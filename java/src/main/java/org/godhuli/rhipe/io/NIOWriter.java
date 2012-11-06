package org.godhuli.rhipe.io;

import org.godhuli.rhipe.misc.Utility;

import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;

import org.apache.hadoop.fs.Path;
import org.apache.hadoop.fs.FileSystem;
import org.apache.hadoop.io.Writable;
import org.apache.hadoop.io.SequenceFile;
import org.apache.hadoop.io.DataOutputBuffer;
import org.apache.hadoop.conf.Configuration;

public class NIOWriter  {
    private final int _bufferCapacity;
    private static int PAD=512;
    private int _bufferUsed;
    private int _count;
    private ByteBuffer _buffer;
    private boolean _hasCarryOver = false;
    private final int INTSIZE =  Integer.SIZE + Integer.SIZE;
    
    private RHBytesWritable kextra, vextra;

    public NIOWriter(int byteSize){
	_bufferCapacity = byteSize;
	_bufferUsed = 0;
	try{
	    _buffer  = ByteBuffer.allocateDirect(_bufferCapacity+PAD);
	    _buffer.order(ByteOrder.LITTLE_ENDIAN);
	    _count = 0;
	}catch(Exception e){
	    throw new RuntimeException("RHIPE: Error allocating backing buffer: "+ e);
	}
    }

    public boolean writeDataToNIOBuffer (RHBytesWritable k, RHBytesWritable v)
	throws IOException
    {
	int klength  = k.getLength(), vlength = v.getLength();
	int wtotal = klength + vlength;
	if( (wtotal + INTSIZE) > _bufferCapacity)
	    throw new IOException("RHIPE: The key, value combination exceeds the buffer size, it will never fit, expand your buffer size");
	if( (_bufferUsed + wtotal+ INTSIZE) <= _bufferCapacity){
	    _buffer.putInt(klength);
	    _buffer.put(k.getBytes(),0, klength);
	    _buffer.putInt(vlength);
	    _buffer.put(v.getBytes(),0, vlength);
	    _count++;
	    return false;
	}else{
	    kextra = k; vextra = v;
	    _hasCarryOver = true;
	    return true;
	}
    }

    public int getCount(){
	return _count;
    }

    public int getUsedBytes(){
	return _buffer.position();
    }

    
    public void flush ()
	throws IOException
    {
	_buffer.clear(); _count = 0;
	if(_hasCarryOver){
	    int klength  = kextra.getLength(), vlength = vextra.getLength();
	    _buffer.putInt(klength);
	    _buffer.put(kextra.getBytes(),0, klength);
	    _buffer.putInt(vlength);
	    _buffer.put(vextra.getBytes(),0, vlength);
	    _count++;
	}
    }

    public static void doTest(String[] args)
	throws IOException 
    {
	if(args.length <1)
	    throw new RuntimeException("must provide file on HDFS that has REXP encoded k-v pairs");
	String pathname  = args[0];
	int nummax = 0;
	if(args.length == 2)
	    nummax = Integer.parseInt(args[1]);
	Object k=new Object();
	Object v=new Object();
	Configuration cfg = new Configuration();
	SequenceFile.Reader sqr = new SequenceFile.Reader(FileSystem.get(cfg) ,new Path(pathname), cfg);
	int count = 0;
	DataOutputBuffer dob = new DataOutputBuffer();
	NIOWriter nio = new NIOWriter(1024*1024*1);
	while( (nummax > 0 && count < nummax) || (nummax <=0 )){
	    k = sqr.next(k);
	    v = sqr.getCurrentValue(v);
	    // boolean result = nio.writeDataToNIOBuffer(k,v);
	    // if(result){
	    //     // flush to R
	    //     // call_R_Code( niobuffer, numrecords, numbyteswritten)
	    //     nio.flush();
	    // }
	    count ++;
	}
	sqr.close();
    }

    public static void main(String[] args)
	throws IOException
    {
	NIOWriter.doTest(args);
    }
}
