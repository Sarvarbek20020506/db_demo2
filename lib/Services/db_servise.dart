
import 'package:hive_flutter/hive_flutter.dart';

import '../model/db_model.dart';
class Hive_db{

  var box= Hive.box("pdp_online");

  void storeUser(User user){
    box.put("user", user.toJson());
  }
  User loadUser(){
    var user=User.fromJson(box.get('user'));
    return user;
  }
  void removeUser()async{
    box.delete("user");
  }
  //Account
  void storeAccount(Account account){
    box.put("account", account.toJson());
  }
  Account loadAccount(){
    var account=Account.fromJson(box.get('account'));
    return account;
  }
  void removeAccount()async{
    box.delete("user");
  }

}