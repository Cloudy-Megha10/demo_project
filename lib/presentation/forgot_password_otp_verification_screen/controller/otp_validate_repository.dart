import '../../../data/apiClient/api_provider.dart';
import '../../../data/apiClient/common_response.dart';
import '../../../data/apiClient/url_list.dart';
import '../models/otp_validated_get_response.dart';

class OtpValidateRepository {
  ApiProvider _provider = ApiProvider();
  //Particular Competition

  Future<CommonResponse<OtpValidatedGetResponse>> getOtpValidatedData(
      otp, emailIdOrMobile) async {
    print("getOtpValidatedData");
    print(otp);
    print(emailIdOrMobile);
    print(UrlList.otpValidatedGetUrl);
    print(UrlList.otpValidatedGetUrl + "$otp" + "/" + "$emailIdOrMobile");
    try {
      var response = await _provider
          .get(UrlList.otpValidatedGetUrl + "$otp" + "/" + "$emailIdOrMobile", {
        'Content-Type': 'application/json',
      });
      print("otpValidatedGetUrl");
      print(UrlList.otpValidatedGetUrl + "$otp" + "/" + "$emailIdOrMobile");
      print(response);

      OtpValidatedGetResponse res = OtpValidatedGetResponse.fromJson(response);
      CommonResponse<OtpValidatedGetResponse> resq =
          new CommonResponse(res.status, res, res.message);
      return resq;
    } catch (e, stackTrace) {
      String errormsg = "Error in Catch Block" + e.toString();
      CommonResponse<OtpValidatedGetResponse> resq =
          new CommonResponse.withoutdata(false, errormsg);
      return resq;
    }
  }
}
