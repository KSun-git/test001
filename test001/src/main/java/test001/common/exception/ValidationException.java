package test001.common.exception;

/**
 * 유효성검증 에러
 */
public class ValidationException extends Exception {

	private static final long serialVersionUID = 1712641808858587530L;
	
	public ValidationException() {}
	
	public ValidationException(String message){
		super(message);
	}

	public ValidationException(Throwable cause){
		super(cause);
	}

	public ValidationException(String message, Throwable cause){
		super(message, cause);
	}

	public ValidationException(String message, Throwable cause,boolean enableSuppression, boolean writableStackTrace){
		super(message, cause, enableSuppression, writableStackTrace);
	}

}
