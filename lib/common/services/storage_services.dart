
import 'package:shared_preferences/shared_preferences.dart';
import 'package:u_learning/common/values/constant.dart';

class StorageServices{
  late final SharedPreferences _prefs;
  //_prefs is global variable and it seen in everywhere in class

  Future<StorageServices> init()async{
    _prefs= await SharedPreferences.getInstance();
     return this;
  }
  Future<bool> setBool(String key,bool value)async{
    return await _prefs.setBool(key, value);
  }
  Future<bool> setString(String key,String value)async{
    return await _prefs.setString(key, value);
  }
   bool getThatOnBoardingOpened(){
   return _prefs.getBool(AppConstant.onBoardingOpened)??false;
  }
  bool getLogIn(){
    return _prefs.getString(AppConstant.onUserLogin)==null?false:true;
  }
  Future<bool> removeKey(String key){
    return _prefs.remove(key);
  }



}


