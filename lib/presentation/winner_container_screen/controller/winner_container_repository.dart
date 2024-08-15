import 'package:kainok_app/data/apiClient/api_provider.dart';
import 'package:kainok_app/data/apiClient/common_response.dart';
import 'package:kainok_app/data/apiClient/url_list.dart';
import 'package:kainok_app/presentation/winner_container_screen/models/get_winner_response.dart';

class WinnerRepository {
  ApiProvider _provider = ApiProvider();

  Future<CommonResponse<WinnerResponse>> getAllWinnersData(
      latitude, longitude) async {
    try {
      var response = await _provider
          .get(UrlList.getAllWinnersUrl + "$latitude" + "%2C" + "$longitude", {
        'Content-Type': 'application/json',
      });
      print("getAllWinnersUrl");
      print(UrlList.getAllWinnersUrl + "$latitude" + "%2C" + "$longitude");
      print(response);
      WinnerResponse res = WinnerResponse.fromJson(response);
      CommonResponse<WinnerResponse> resq =
          new CommonResponse(res.status, res, res.message);
      return resq;
    } catch (e, stackTrace) {
      String errormsg = "Error in Catch Block" + e.toString();
      CommonResponse<WinnerResponse> resq =
          new CommonResponse.withoutdata(false, errormsg);
      return resq;
    }
  }
}
