import 'package:db_demo2/Services/db_servise.dart';
import 'package:db_demo2/model/db_model.dart';
import 'package:db_demo2/pages/signup_page.dart';
import 'package:flutter/material.dart';
class LoginPage extends StatefulWidget {
  static const String id="login_page";
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController mailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();

  void doLogIn() {
    String mail=mailController.text.toString().trim();
    String password=passwordController.text.toString().trim();

    var user= User(mail: mail,password: password);
    Hive_db().storeUser(user);

    var user2=Hive_db().loadUser();
    print(user2.mail);
    print(user2.password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(left: 40,right: 40,top:60),
            color: Colors.cyan[800],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(image: AssetImage("assets/images/profile1.jpeg"),fit: BoxFit.cover),
                  ),
                ),
                SizedBox(height: 20),
                Text("Welcome",style: TextStyle(color: Colors.cyan[600],fontSize: 20),),
                SizedBox(height: 5),
                Text("Sign In",style: TextStyle(color: Colors.white,fontSize: 40,fontWeight: FontWeight.bold),),
              ],
            ),
          ),
          Column(
            children: [
              SizedBox(height: 240,),
              Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 40),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(60),topRight:Radius.circular(60)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 60,),
                    Text("Email",style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold),),
                    TextField(
                      controller: mailController,
                      decoration: InputDecoration(
                        hintText: "Urmail@gmail.com",
                        hintStyle: TextStyle(color: Colors.black45,fontSize: 15),
                      ),
                    ),
                    SizedBox(height: 30,),
                    Text("Password",style: TextStyle(fontSize: 18,color: Colors.black,fontWeight: FontWeight.bold),),
                    TextField(
                      controller: passwordController,
                    decoration: InputDecoration(
                      hintText: "Enter password",
                      hintStyle: TextStyle(color: Colors.black45,fontSize: 15),
                    ),
                  ),
                    SizedBox(height: 70,),
                    //#Sign Ip
                    GestureDetector(
                      onTap: (){
                        doLogIn();
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 30,right: 30),
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.cyan[700],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child:  Text("Sign In",style: TextStyle(color: Colors.white,fontSize: 18),),
                        ),
                      ),
                    ),
                    SizedBox(height: 25,),
                    //#----OR----
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 1,
                          width:100,
                          color: Colors.grey.shade400,
                        ),
                        SizedBox(width: 10,),
                        Text("OR",style: TextStyle(fontSize: 20,color: Colors.black12,fontWeight: FontWeight.bold),),
                        SizedBox(width: 10,),
                        Container(
                          height: 1,
                          width:100,
                          color: Colors.grey.shade400,
                        ),
                      ],
                    ),
                    SizedBox(height: 25,),
                    //#Facebook,twitter,instagram
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                         height: 35,
                         width: 35,
                         decoration:BoxDecoration(
                           borderRadius: BorderRadius.circular(5),
                           image: DecorationImage(image: AssetImage("assets/images/facebook.png"),fit: BoxFit.cover),
                         ) ,
                       ),
                        SizedBox(width: 50,),
                        Container(
                          height: 35,
                          width: 35,
                          decoration:BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            image: DecorationImage(image: AssetImage("assets/images/twitter.png"),fit: BoxFit.cover),
                          ) ,
                        ),
                        SizedBox(width: 50,),
                        Container(
                          height: 30,
                          width: 30,
                          decoration:BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            image: DecorationImage(image: AssetImage("assets/images/instagram.png"),fit: BoxFit.cover),
                          ) ,
                        ),

                      ],
                    ),
                    SizedBox(height: 60,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account?",style: TextStyle(color: Colors.grey),),
                        SizedBox(width: 10,),
                        GestureDetector(
                          onTap: (){
                            Navigator.pushReplacementNamed(context, SignUpPage.id);
                          },
                          child:  Text("Sign Up",style: TextStyle(color: Colors.cyan[800],fontWeight: FontWeight.bold,fontSize: 17),),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
