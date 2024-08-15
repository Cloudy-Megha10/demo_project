class AddImageResponse {
  bool? status;
  String? message;
  dynamic data; // Changed to non-nullable bool

  AddImageResponse({this.status, this.message, required this.data});
  factory AddImageResponse.fromJson(Map<String, dynamic> json) {
    return AddImageResponse(
      status: json['Status'],
      message: json['Message'],
      data: json['Data'] ?? false, // Assign a default value if 'Data' is null
    );
  }
}
