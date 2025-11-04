class ErrorModel {
  final int status;
  final String errorMessage;

  ErrorModel({required this.status, required this.errorMessage});
  factory ErrorModel.fromJson(Map<String, dynamic> jesonDtata) {
    return ErrorModel(
      status: jesonDtata["status_code"],
      errorMessage: jesonDtata["status_message"],
    );
  }
}
