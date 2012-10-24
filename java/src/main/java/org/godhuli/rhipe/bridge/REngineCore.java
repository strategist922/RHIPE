package org.godhuli.rhipe.bridge;

public class REngineCore {
    public native int intializeR(String[] args);
    public native int evalExpression(String[] expressions);

    public static void main(String[] args){
	System.out.println("Hello World");
    }
}
