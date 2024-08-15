import '../../../core/utils/flutter_secure_storage.dart';
import '../../../data/apiClient/api_provider.dart';
import '../../../data/apiClient/common_response.dart';
import '../../../data/apiClient/url_list.dart';
import '../models/my_vote_img_list_response.dart';

class MyVoteImgListingRepository {
  ApiProvider _provider = ApiProvider();
  SecureStorage _secureStorage = SecureStorage();

  Future<CommonResponse<GetMyVoteImgListResponse>> getCompAllImagesData(
      String compId) async {
    try {
      final userId = await _secureStorage.getUserId();
      var response = await _provider
          .get(UrlList.getMyVotesAllImagesUrl + "$userId" + "/" + "$compId", {
        'Content-Type': 'application/json',
      });
      print("getCompAllImagesDetailsUrl");
      print(UrlList.getMyVotesAllImagesUrl + "$userId" + "/" + "$compId");
      print(response);
      GetMyVoteImgListResponse res =
          GetMyVoteImgListResponse.fromJson(response);
      CommonResponse<GetMyVoteImgListResponse> resq =
          new CommonResponse(res.status, res, res.message);
      return resq;
    } catch (e, stackTrace) {
      String errormsg = "Error in Catch Block" + e.toString();
      CommonResponse<GetMyVoteImgListResponse> resq =
          new CommonResponse.withoutdata(false, errormsg);
      return resq;
    }
  }
}
