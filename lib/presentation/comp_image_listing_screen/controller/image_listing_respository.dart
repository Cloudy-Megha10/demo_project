import 'package:kainok_app/presentation/comp_image_listing_screen/models/get_comp_all_img_response.dart';
import '../../../core/utils/flutter_secure_storage.dart';
import '../../../data/apiClient/api_provider.dart';
import '../../../data/apiClient/common_response.dart';
import '../../../data/apiClient/url_list.dart';

class ImageListingRepository {
  ApiProvider _provider = ApiProvider();
  final SecureStorage _secureStorage = SecureStorage();

  Future<CommonResponse<GetCompetitionAllImgListResponse>>
      getMyParticipationCompImageData(compId) async {
    try {
      var userId = await _secureStorage.getUserId();
      if (userId == null) {
        userId = "0";
      }
      var response = await _provider.get(
          UrlList.getMyImagesForCompByIdAndUserIdUrl +
              "$compId" +
              "/" +
              "$userId" +
              "/0",
          {
            'Content-Type': 'application/json',
          });
      print("GetCompetitionAllImgListResponse");
      print(
        UrlList.getMyImagesForCompByIdAndUserIdUrl +
            "$compId" +
            "/" +
            "$userId" +
            "/0",
      );
      print("GetCompetitionAllImgListResponseresponse");
      print(response);
      GetCompetitionAllImgListResponse res =
          GetCompetitionAllImgListResponse.fromJson(response);
      CommonResponse<GetCompetitionAllImgListResponse> resq =
          new CommonResponse(res.status, res, res.message);
      return resq;
    } catch (e, stackTrace) {
      String errormsg = "Error in Catch Block" + e.toString();
      CommonResponse<GetCompetitionAllImgListResponse> resq =
          new CommonResponse.withoutdata(false, errormsg);
      return resq;
    }
  }
}
