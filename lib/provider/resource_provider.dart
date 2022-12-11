import 'package:flutter/foundation.dart';
import 'package:flutter_sanalira_app/mixins/cache_manager.dart';
import 'package:flutter_sanalira_app/model/user_model.dart';
import 'package:flutter_sanalira_app/service/bank_service.dart';
import 'package:flutter_sanalira_app/service/firebase_service.dart';

class ResourceProvider extends ChangeNotifier with CacheManager {
  bool isLoggedIn = false;
  IBankService bankService = BankService();
  IFirebaseService firebaseService = FirebaseService();

  ResourceProvider(bool newLoggedIn) {
    isLoggedIn = newLoggedIn;
    notifyListeners();
  }

  void signin(UserModel user) {
    isLoggedIn = true;
    saveLogin(isLoggedIn);
    firebaseService.addUser(user);
    notifyListeners();
  }

  void logOut() {
    isLoggedIn = false;
    saveLogin(isLoggedIn);
    notifyListeners();
  }

  Future<void> getBanks() async {
    return await bankService.getBanks();
  }
}
