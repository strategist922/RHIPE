package org.godhuli.rhipe.bridge;

public class REngineCore {
    public native int intializeR(String rhome,String[] args);
    public native int evalExpression(String[] expressions);
    private static REngineCore _core;

    private REngineCore(String liblocation) 
	throws RuntimeException 
    {
	try{
	    System.load(liblocation);
	}catch(SecurityException e){
	    throw new RuntimeException(e);
	}catch(UnsatisfiedLinkError e){
	    throw new RuntimeException(e);
	}
    }

    private  void initialize(String rhome, String[] args)
	throws RuntimeException
    {
	int result = intializeR(rhome, args);
	if(result == -1)
	    throw new RuntimeException("RHIPE: Could not malloc JNIContainer");
	else if(result == -2)
	    throw new RuntimeException("RHIPE: NewGlobalRef failure");
	else if(result == -3)
	    throw new RuntimeException("RHIPE: ClassRef failure");
	else if(result <0)
	    throw new RuntimeException("RHIPE: R failed to initialize with return code:"+(result-1000));
    }

    public static synchronized REngineCore getInstance(String liblocation,
						       String RHOME,
						       String[] args)
	throws RuntimeException
    {
	if(_core == null){
	    _core = new REngineCore(liblocation);
	    if(RHOME == null ) 
		throw new RuntimeException("RHIPE: Missing RHOME");
	    if(args == null || args.length==0) 
		throw new RuntimeException("RHIPE: Missing or Zero-length Args");
	    _core.initialize(RHOME, args);
	}
	return(_core);
    }
    
    public static void main(String[] args)
    {
	if(args.length>=1){
	    REngineCore.getInstance(args[0], args[1],new String[] {"--vanilla","--silent","--slave","--vanilla"});
	}
    }
}
