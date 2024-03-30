import 'dart:convert';

import 'package:marsous/app/utils/app_shared_data.dart';
import 'package:marsous/models/center_model.dart';
import 'package:marsous/models/children_model.dart';
import 'package:marsous/models/user_info_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum PrefKeys {
  token,
  loggedIn,
  fcmToken,
  language,
  enableNotification,
  userName,
  fullName,
  email,
  phoneNumber,
  role,
  image,
  student,
  turtor,
  centers,
  address,
  children,
  code,
  isParent,
  myToken,
  tokenChild,
  primaryToken,
  attendanceCount,
  absenceCount,
  centerId,
}

class SharedPrefController {
  SharedPrefController._internal();

  late SharedPreferences _sharedPreferences;
  static SharedPrefController? _instance;

  factory SharedPrefController() {
    return _instance ??= SharedPrefController._internal();
  }

  ///TO DO CALLED IN MAIN AFTER --WidgetsFlutterBinding-- AND BEFORE runApp()
  Future<void> initPref() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> saveUserInfo({required UserInfoModel userInfoModel}) async {
    await _sharedPreferences.setString(
        PrefKeys.userName.name, userInfoModel.userName!);
    await _sharedPreferences.setString(
        PrefKeys.fullName.name, userInfoModel.fullName!);
    await _sharedPreferences.setString(
        PrefKeys.image.name, userInfoModel.image!);
    await _sharedPreferences.setString(PrefKeys.role.name, userInfoModel.role!);
    await _sharedPreferences.setString(
        PrefKeys.phoneNumber.name, userInfoModel.phoneNumber!);
    await _sharedPreferences.setString(
        PrefKeys.email.name, userInfoModel.email!);
    await _sharedPreferences.setString(
        PrefKeys.children.name, jsonEncode(userInfoModel.children!));
    await _sharedPreferences.setString(
        PrefKeys.centers.name, jsonEncode(userInfoModel.centers!));
    await _sharedPreferences.setBool(
        PrefKeys.student.name, userInfoModel.student!);
    await _sharedPreferences.setBool(
        PrefKeys.turtor.name, userInfoModel.turtor!);
    await _sharedPreferences.setString(
        PrefKeys.address.name, userInfoModel.address!);
    await _sharedPreferences.setInt(PrefKeys.code.name, userInfoModel.code!);
    await _sharedPreferences.setBool(
        PrefKeys.isParent.name, userInfoModel.isParent!);
    await _sharedPreferences.setString(
        PrefKeys.myToken.name, userInfoModel.myToken!);
    await _sharedPreferences.setInt(
        PrefKeys.attendanceCount.name, userInfoModel.attendanceCount!);
    await _sharedPreferences.setInt(
        PrefKeys.absenceCount.name, userInfoModel.absenceCount!);
  }

  UserInfoModel? getUserInfo() {
    return _sharedPreferences.getString(PrefKeys.token.name) == null
        ? null
        : AppSharedData.userInfoModel = UserInfoModel(
            userName: _sharedPreferences.getString(PrefKeys.userName.name),
            image: _sharedPreferences.getString(PrefKeys.image.name),
            email: _sharedPreferences.getString(PrefKeys.email.name),
            fullName: _sharedPreferences.getString(PrefKeys.fullName.name),
            phoneNumber:
                _sharedPreferences.getString(PrefKeys.phoneNumber.name),
            role: _sharedPreferences.getString(PrefKeys.role.name),
            student: _sharedPreferences.getBool(PrefKeys.student.name),
            turtor: _sharedPreferences.getBool(PrefKeys.turtor.name),
            centers: _sharedPreferences.getString(PrefKeys.children.name) ==
                    null
                ? null
                : List<CenterModel>.from((jsonDecode(
                        _sharedPreferences.getString(PrefKeys.centers.name)!))
                    .map((e) => CenterModel.fromJson(e))),
            address: _sharedPreferences.getString(PrefKeys.address.name),
            children: _sharedPreferences.getString(PrefKeys.children.name) ==
                    null
                ? null
                : List<ChildrenModel>.from((jsonDecode(
                        _sharedPreferences.getString(PrefKeys.children.name)!))
                    .map((e) => ChildrenModel.fromJson(e))),
            code: _sharedPreferences.getInt(PrefKeys.code.name),
            isParent: _sharedPreferences.getBool(PrefKeys.isParent.name),
            myToken: _sharedPreferences.getString(PrefKeys.myToken.name),
            attendanceCount:
                _sharedPreferences.getInt(PrefKeys.attendanceCount.name),
            absenceCount: _sharedPreferences.getInt(PrefKeys.absenceCount.name),
          );
  }

  // Future<void> save({required User user}) async {
  //   await _sharedPreferences.setBool(PrefKeys.loggedIn.name, true);
  //   await _sharedPreferences.setString(PrefKeys.userName.name, user.userName!);
  //   await _sharedPreferences.setString(
  //       PrefKeys.firstName.name, user.firstName!);
  //   await _sharedPreferences.setString(PrefKeys.lastName.name, user.lastName!);
  //   await _sharedPreferences.setString(PrefKeys.role.name, user.role!);
  //   await _sharedPreferences.setString(PrefKeys.email.name, user.email!);
  //   await _sharedPreferences.setString(
  //       PrefKeys.telephone.name, user.telephone!);
  //   await _sharedPreferences.setString(
  //       PrefKeys.referralCode.name, user.referralCode!);
  //   await _sharedPreferences.setString(
  //       PrefKeys.birthDate.name, user.birthDate!);
  //   await _sharedPreferences.setBool(
  //       PrefKeys.active.name, user.active ?? false);
  //   await _sharedPreferences.setBool(
  //       PrefKeys.ghafGold.name, user.ghafGold ?? false);
  //   await _sharedPreferences.setBool(
  //       PrefKeys.sellerSubmittedForm.name, user.sellerSubmittedForm ?? false);
  //   await _sharedPreferences.setBool(
  //       PrefKeys.individualSellerSubmittedForm.name,
  //       user.individualSellerSubmittedForm ?? false);
  //   if (user.fcmToken != null)
  //     await _sharedPreferences.setString(
  //         PrefKeys.fcmToken.name, user.fcmToken!);
  // }

  // User? getUser() {
  //   return _sharedPreferences.getString(PrefKeys.token.name) == null
  //       ? null
  //       : AppSharedData.currentUser = User(
  //           userName: _sharedPreferences.getString(PrefKeys.userName.name),
  //           firstName: _sharedPreferences.getString(PrefKeys.firstName.name),
  //           lastName: _sharedPreferences.getString(PrefKeys.lastName.name),
  //           role: _sharedPreferences.getString(PrefKeys.role.name),
  //           email: _sharedPreferences.getString(PrefKeys.email.name),
  //           telephone: _sharedPreferences.getString(PrefKeys.telephone.name),
  //           referralCode:
  //               _sharedPreferences.getString(PrefKeys.referralCode.name),
  //           birthDate: _sharedPreferences.getString(PrefKeys.birthDate.name),
  //           active: _sharedPreferences.getBool(PrefKeys.active.name),
  //           ghafGold: _sharedPreferences.getBool(PrefKeys.ghafGold.name),
  //           sellerSubmittedForm:
  //               _sharedPreferences.getBool(PrefKeys.sellerSubmittedForm.name),
  //           individualSellerSubmittedForm: _sharedPreferences
  //               .getBool(PrefKeys.individualSellerSubmittedForm.name),
  //           fcmToken: _sharedPreferences.getString(PrefKeys.fcmToken.name),
  //         );
  // }

  var key = 'ar';

  Future<bool> clear() async {
    return _sharedPreferences.clear();
  }

  bool get loggedIn =>
      _sharedPreferences.getBool(PrefKeys.loggedIn.name) ?? false;

  String get lang1 {
    return _sharedPreferences.getString(PrefKeys.language.toString()) ??
        'en-US';
  }

  bool get enableNotifications =>
      _sharedPreferences.getBool(PrefKeys.enableNotification.toString()) ??
      true;

  Future<void> setEnableNotification(bool enable) async {
    await _sharedPreferences.setBool(
        PrefKeys.enableNotification.toString(), enable);
    // _sharedPreferences.setBool(PrefKeys.loggedIn.name, loggedIn);
  }

  // Future<bool> setLanguage(String language) async {
  //   await _sharedPreferences.setBool();
  //   // _sharedPreferences.setBool(PrefKeys.loggedIn.name, loggedIn);
  // }

  // void set loggedIn(bool loggedIn) => _sharedPreferences.setBool(PrefKeys.loggedIn.name, loggedIn);

  String get token => _sharedPreferences.getString(PrefKeys.token.name) ?? '';

  Future<void> setToken(String token) async {
    await _sharedPreferences.setString(PrefKeys.token.name, 'Bearer ${token}');
    _sharedPreferences.setBool(PrefKeys.loggedIn.name, loggedIn);
  }

  String get tokenChild =>
      _sharedPreferences.getString(PrefKeys.tokenChild.name) ?? '';

  Future<void> setTokenChild(String token) async {
    await _sharedPreferences.setString(
        PrefKeys.tokenChild.name, 'Bearer ${token}');
  }

  String get primaryToken =>
      _sharedPreferences.getString(PrefKeys.primaryToken.name) ?? '';

  Future<void> setPrimaryToken(String token) async {
    await _sharedPreferences.setString(
        PrefKeys.primaryToken.name, 'Bearer ${token}');
  }

  String get centerId => _sharedPreferences.getString(PrefKeys.centerId.name) ?? '';

  Future<void> setCenterId(String centerId) async {
    await _sharedPreferences.setString(PrefKeys.centerId.name, centerId);
  }

  T? getValueFor<T>({required String key}) {
    if (_sharedPreferences.containsKey(key)) {
      return _sharedPreferences.get(key) as T;
    }
    return null;
  }

  Future<bool> changeLanguage({required String language}) async {
    return _sharedPreferences.setString(PrefKeys.language.toString(), language);
  }

  Future<bool> removeValue({required String key}) async {
    if (_sharedPreferences.containsKey(key)) {
      return _sharedPreferences.remove(key);
    }
    return false;
  }

  Future<void> deleteChildToken() async {
    _sharedPreferences.remove(PrefKeys.tokenChild.name);
  }

  Future<void> logout() async {
    _sharedPreferences.remove(PrefKeys.role.name);
    _sharedPreferences.remove(PrefKeys.phoneNumber.name);
    _sharedPreferences.remove(PrefKeys.email.name);
    _sharedPreferences.remove(PrefKeys.userName.name);
    _sharedPreferences.remove(PrefKeys.fullName.name);
    _sharedPreferences.remove(PrefKeys.image.name);
    _sharedPreferences.remove(PrefKeys.token.name);
    _sharedPreferences.remove(PrefKeys.fcmToken.name);
    _sharedPreferences.remove(PrefKeys.myToken.name);
    _sharedPreferences.remove(PrefKeys.children.name);
    _sharedPreferences.remove(PrefKeys.centers.name);
    _sharedPreferences.remove(PrefKeys.isParent.name);
    _sharedPreferences.remove(PrefKeys.turtor.name);
    _sharedPreferences.remove(PrefKeys.student.name);
    _sharedPreferences.remove(PrefKeys.code.name);
    _sharedPreferences.remove(PrefKeys.address.name);
    _sharedPreferences.remove(PrefKeys.tokenChild.name);
    _sharedPreferences.remove(PrefKeys.primaryToken.name);
    _sharedPreferences.remove(PrefKeys.attendanceCount.name);
    _sharedPreferences.remove(PrefKeys.absenceCount.name);
    _sharedPreferences.remove(PrefKeys.enableNotification.name);
    _sharedPreferences.remove(PrefKeys.centerId.name);
    AppSharedData.userInfoModel = null;
  }

// Future<void> logout() async {
//   _sharedPreferences.remove(PrefKeys.loggedIn.name);
//   _sharedPreferences.remove(PrefKeys.token.name);
//   _sharedPreferences.remove(PrefKeys.email.name);
//   _sharedPreferences.remove(PrefKeys.userName.name);
//   _sharedPreferences.remove(PrefKeys.firstName.name);
//   _sharedPreferences.remove(PrefKeys.lastName.name);
//   _sharedPreferences.remove(PrefKeys.role.name);
//   _sharedPreferences.remove(PrefKeys.telephone.name);
//   _sharedPreferences.remove(PrefKeys.referralCode.name);
//   _sharedPreferences.remove(PrefKeys.birthDate.name);
//   _sharedPreferences.remove(PrefKeys.active.name);
//   _sharedPreferences.remove(PrefKeys.ghafGold.name);
//   _sharedPreferences.remove(PrefKeys.sellerSubmittedForm.name);
//   _sharedPreferences.remove(PrefKeys.individualSellerSubmittedForm.name);
//   _sharedPreferences.remove(PrefKeys.fcmToken.name);
//   AppSharedData.currentUser = null;
// }
}
