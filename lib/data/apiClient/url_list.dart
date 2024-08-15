class UrlList {
  static String baseUrl = 'http://27.111.74.44:8080';

  //static String baseUrl = 'http://192.168.1.7:8080';

  static String loginUrl = baseUrl + '/User/Login';

  static String logoutUrl = baseUrl + '/User/Logout/';

  static String registerUrl = baseUrl + '/User/RegisterUser';

  static String createUserTypeUrl = baseUrl + '/User/CreateUserType';

  static String updateUserTypeUrl = baseUrl + '/User/UpdateUserType';

  static String getTrendingUrl =
      baseUrl + '/Competition/GetTrendingCompetitionsForUser/';

  static String getNearByTrendingCompToVote =
      baseUrl + '/Competition/GetNearByTrendingCompetitionsForUser/';
  static String getNearByGlobalTrendingCompToVote =
      baseUrl + '/Competition/GetGlobalTrendingCompetitionsForUser/';

  static String getGlobalTrendingUrl =
      baseUrl + '/Competition/GetGlobalTrendingCompetitionsForUser';

  static String getHighPrizeUrl =
      baseUrl + '/Competition/GetNearByHighPriceCompetitions/';

  static String getFeatureCompetitionUrl =
      baseUrl + '/Competition/GetNearByFeatureCompetitions/';

  static String getClosingCompetitionUrl =
      baseUrl + '/Competition/GetNearByClosingCompetitions/';

  static String getNearByCompetitionUrl =
      baseUrl + '/Competition/GetNearByCompetitionsForUser/';

  static String getNearByCompToParticipateUrl =
      baseUrl + '/Competition/GetNearByCompetitionsToParticipate/';

  static String getNearByCompToVoteUrl =
      baseUrl + '/Competition/GetNearByCompetitionsToVote/';

  static String getParticipationCompetitionsByCategoryUrl =
      baseUrl + '/Competition/GetNearByCompetitionsForUploadByCategory/';

  static String getVotingCompetitionsByCategoryUrl =
      baseUrl + '/Competition/GetVotingCompetitionsByCategory/';

  static String getCompetitionDetailsByIdAndUserIdUrl =
      baseUrl + '/Competition/GetCompetitionDetailsByIdAndUser/';

  static String getMyImagesForCompByIdAndUserIdUrl =
      baseUrl + '/Competition/GetMyImagesForCompetitions/';

  static String getMyCompetitionDetailsById =
      baseUrl + '/Competition/GetCompetitionDetailsById/';

  static String updateProfilePhoto = baseUrl + '/User/UpdateUserProfileImage';

  static String updateCompetition = baseUrl + '/Competition/UpdateCompetition';

  static String addImagesPostUrl =
      baseUrl + '/Competition/AddImagesToCompetition';

  static String getParticipationUrl =
      baseUrl + '/Competition/GetMyParticipations/';

  static String getMyVoteUrl = baseUrl + '/Vote/GetMyVotes/';

  static String getUserDetailUrl = baseUrl + '/User/GetUserDetails/';

  static String getUserDetailByIdUrl = baseUrl + '/User/GetUserDetailsById/';

  static String getAllUserUrl = baseUrl + '/User/GetAllUsers';

  static String getCompAllImagesDetailsUrl =
      baseUrl + '/Competition/GetImagesForCompetitions/';

  static String getMyVotesAllImagesUrl = baseUrl + '/Vote/GetMyVotedImages/';

  static String getMyCompetitions = baseUrl + '/Competition/GetMyCompetitions/';

  static String updateUserUrl = baseUrl + '/User/UpdateSelfUser';

  static String updateUserByIdUrl = baseUrl + '/User/UpdateUser';

  static String getUserTypeByUserIdUrl = baseUrl + '/User/GetUserTypeDetails/';

  static String getMyWinningsUrl = baseUrl + '/Competition/GetMyWonImages/';

  static String getAllUserTypeUrl = baseUrl + '/User/GetAllUserTypes';

  static String getAllWinnersUrl =
      baseUrl + '/Competition/GetAllWinnerDetails/';

  static String createCompetitionPostUrl =
      baseUrl + '/Competition/CreateCompetition';

  static String forgetPasswordGetUrl = baseUrl + '/User/GenerateOtp/';

  static String otpValidatedGetUrl = baseUrl + '/User/ValidateOtp/';

  static String newPasswordUpdateUrl = baseUrl + '/User/UpdatePassword';

  static String votePostUrl = baseUrl + '/Vote/Vote';

  static String getAllCategoriesUrl = baseUrl + '/Competition/GetCategories';

  static String createUserUrl = baseUrl + '/User/CreateUser';

  static String isDeviceRegistered = baseUrl + '/Register/IsDeviceRegistered';
  static String registerViaSocialMedia =
      baseUrl + '/Register/RegisterViaSocialMedia';

  static String createGuestUser = baseUrl + '/User/CreateGuestUser';

  static String signUpGuestUser = baseUrl + '/User/UpdateGuestUser';
}
