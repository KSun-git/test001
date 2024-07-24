package test001.common.exception;

public class AccessDeniedException extends Exception {

	private static final long serialVersionUID = -3700229660037076184L;

	public AccessDeniedException() {}
	
	public AccessDeniedException(String message){
		super(message);
	}

	public AccessDeniedException(Throwable cause){
		super(cause);
	}

	public AccessDeniedException(String message, Throwable cause){
		super(message, cause);
	}

	public AccessDeniedException(String message, Throwable cause,boolean enableSuppression, boolean writableStackTrace){
		super(message, cause, enableSuppression, writableStackTrace);
	}
}
