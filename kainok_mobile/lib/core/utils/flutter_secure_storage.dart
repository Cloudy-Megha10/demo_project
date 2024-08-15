import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  // Create storage

  final storage = const FlutterSecureStorage();

  final String _iemiNo = 'iemiNo';
  final String _deviceInfoMobileNo = 'mobileNumber';

  final String _userId = 'userId';
  final String _isAdmin = "isAdmin";
  final String _isLoggedOut = "isLoggedOut";
  final String _isGuestUser = "isGuestUser";

  final String _userTypeId = 'userTypeId';

  final String _sessionId = 'sessionId';

  final String _firstName = 'firstName';

  final String _lastName = 'lastName';

  final String _email = 'email';

  final String _city = 'city';

  final String _password = 'password';

  final String _mobileNumber = 'mobileNumber';

  final String _otp = 'otp';

  final String _range = 'range';

  final String _businessId = 'businessId';

  final String _residenceId = 'residenceId';

  final String _staffName = 'staffName';

  final String _designationName = 'designationName';

  // Remove methods

  Future removeAll() async {
    print("removeAll");
    final keysToEliminate = [
      _password,
      _mobileNumber,
      _userId,
      _userTypeId,
    ];

    await Future.wait(keysToEliminate.map((key) => storage.delete(key: key)));
  }

  Future removeUserId() async {
    storage.delete(key: _userId);
  }

  Future removeUserTypeId() async {
    storage.delete(key: _userTypeId);
  }

  Future removeOtp() async {
    final keysToEliminate = [_otp];
    await Future.wait(keysToEliminate.map((key) => storage.delete(key: key)));
  }

  // Set methods

  Future setDeviceInfoMobileNo(String deviceInfoMobileNo) async {
    await storage.write(key: _deviceInfoMobileNo, value: deviceInfoMobileNo);
  }

  Future setIemiNumber(String iemiNo) async {
    await storage.write(key: _iemiNo, value: iemiNo);
  }

  Future setUserId(String userId) async {
    await storage.write(key: _userId, value: userId);
  }

  Future setUserType(String isAdmin) async {
    await storage.write(key: _isAdmin, value: isAdmin.toString());
  }

  Future setIsLoggedOut(String isLoggedOut) async {
    await storage.write(key: _isLoggedOut, value: isLoggedOut.toString());
  }

  Future setIsGuestUser(String isGuestUser) async {
    await storage.write(key: _isGuestUser, value: isGuestUser.toString());
  }

  Future setUserTypeId(String userTypeId) async {
    await storage.write(key: _userTypeId, value: userTypeId);
  }

  Future setFirstName(String firstName) async {
    await storage.write(key: _firstName, value: firstName);
  }

  Future setLastName(String lastName) async {
    await storage.write(key: _lastName, value: lastName);
  }

  Future setEmail(String email) async {
    await storage.write(key: _email, value: email);
  }

  Future setCity(String city) async {
    await storage.write(key: _city, value: city);
  }

  Future setPassword(String password) async {
    await storage.write(key: _password, value: password);
  }

  Future setMobileNumber(String mobileNumber) async {
    await storage.write(key: _mobileNumber, value: mobileNumber);
  }

  Future setSessionId(String sessionId) async {
    await storage.write(key: _sessionId, value: sessionId);
  }

  Future setOtp(String otp) async {
    await storage.write(key: _otp, value: otp);
  }

  Future setBusinessId(String businessId) async {
    await storage.write(key: _businessId, value: businessId);
  }

  Future setResidenceId(String residenceId) async {
    await storage.write(key: _residenceId, value: residenceId);
  }

  Future setStaffName(String staffName) async {
    await storage.write(key: _staffName, value: staffName);
  }

  Future setDesignation(String designationName) async {
    await storage.write(key: _designationName, value: designationName);
  }

  Future setRange(String range) async {
    await storage.write(key: _range, value: range);
  }

  // Get methods

  Future<String?> getIemiNo() async {
    return await storage.read(key: _iemiNo);
  }

  Future<String?> getDeviceInfoMobileNo() async {
    return await storage.read(key: _deviceInfoMobileNo);
  }

  Future<String?> getUserId() async {
    return await storage.read(key: _userId);
  }

  Future<String?> getUserTypeAsAdmin() async {
    return await storage.read(key: _isAdmin);
  }

  Future<String?> getIsLoggedOut() async {
    return await storage.read(key: _isLoggedOut);
  }

  Future<String?> getIsGuestUser() async {
    return await storage.read(key: _isGuestUser);
  }

  Future<String?> getUserTypeId() async {
    return await storage.read(key: _userTypeId);
  }

  Future<String?> getFirstName() async {
    return await storage.read(key: _firstName);
  }

  Future<String?> getLastName() async {
    return await storage.read(key: _lastName);
  }

  Future<String?> getEmail() async {
    return await storage.read(key: _email);
  }

  Future<String?> getCity() async {
    return await storage.read(key: _city);
  }

  Future<String?> getPassword() async {
    return await storage.read(key: _password);
  }

  Future<String?> getMobileNumber() async {
    return await storage.read(key: _mobileNumber);
  }

  Future<String?> getSessionId() async {
    return await storage.read(key: _sessionId);
  }

  Future<String?> getOtp() async {
    return await storage.read(key: _otp);
  }

  Future<String?> getBusinessId() async {
    return await storage.read(key: _businessId);
  }

  Future<String?> getResidenceId() async {
    return await storage.read(key: _residenceId);
  }

  Future<String?> getStaffName() async {
    return await storage.read(key: _staffName);
  }

  Future<String?> getDesignationName() async {
    return await storage.read(key: _designationName);
  }

  Future<String?> getRange() async {
    return await storage.read(key: _range);
  }
}
