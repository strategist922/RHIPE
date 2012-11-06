package org.godhuli.rhipe.misc;


public class Utility {
    public static String bytesPretty(byte[] b,int offset, int length) { 
	int sz= length;
	StringBuffer sb = new StringBuffer(3*sz);
	for (int idx = 0; idx < sz; idx++) {
	    if (idx != 0) {
		sb.append(" 0x");
	    }else sb.append("0x");
	    String num = Integer.toHexString(0xff & b[offset+idx]);
	    if (num.length() < 2) {
		sb.append('0');
	    }
	    sb.append(num);
	}
	return sb.toString();
    }
}
