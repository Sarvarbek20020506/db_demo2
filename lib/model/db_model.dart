 class User{
  String mail;
  String password;
  User({required this.mail,required this.password,});

  User.fromJson(Map <String ,dynamic> json)
      :
        mail=json["mail"],
        password=json["password"];
  Map<String,dynamic> toJson()=>{
    "mail":mail,
    "password":password,
  };
 }
 class Account{
   String mail;
   String number;
   String address;
   Account({required this.mail,required this.number,required this.address});
   Account.fromJson(Map <String ,dynamic> json)
       :mail=json['mail'],
         address=json['address'],
         number=json['number'];
   Map<String,dynamic>toJson()=>{
     "mail":mail,
     'number':number,
     'address':address,
   };
}