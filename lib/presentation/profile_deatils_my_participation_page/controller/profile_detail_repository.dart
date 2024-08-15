import 'package:demo_project/data/apiClient/api_provider.dart';
import 'package:demo_project/data/apiClient/common_response.dart';
import 'package:demo_project/data/apiClient/url_list.dart';
import 'package:demo_project/presentation/profile_deatils_my_participation_page/models/profile_get_response.dart';

class ProfileDetailRepository {
  ApiProvider _provider = ApiProvider();

  Future<CommonResponse<GetMyParticipateResponse>> getMyParticipationData(
      userId) async {
    try {
      var response =
          await _provider.get(UrlList.getParticipationUrl + "$userId", {
        'Content-Type': 'application/json',
      });
      GetMyParticipateResponse res =
          GetMyParticipateResponse.fromJson(response);
      CommonResponse<GetMyParticipateResponse> resq =
          new CommonResponse(res.status, res, res.message);
      return resq;
    } catch (e, stackTrace) {
      String errormsg = "Error in Catch Block" + e.toString();
      CommonResponse<GetMyParticipateResponse> resq =
          new CommonResponse.withoutdata(false, errormsg);
      return resq;
    }
  }
}
