class ResponseHandler implements Exception{

  final int ?code;
  final String message;

  ResponseHandler({required this .message,this.code});

  @override
  String toString() {
    // TODO: implement toString
    return "[$code ---$message]";
  }

}