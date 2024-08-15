class CommonResponse<T> {
  late bool Status;
  late T Data;
  late String Message;

  CommonResponse.withoutdata(
    this.Status,
    this.Message,
  );
  CommonResponse(
    this.Status,
    this.Data,
    this.Message,
  );

  CommonResponse.withoutData(bool bool, String errorMsg);
}
