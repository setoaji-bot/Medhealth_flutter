import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:medhealth/network/api/url_api.dart';
import 'package:medhealth/network/model/pref_profile_model.dart';
import 'package:medhealth/theme.dart';
import 'package:medhealth/widget/button_primary.dart';
import 'package:medhealth/widget/general_logo_space.dart';
import 'package:http/http.dart' as http;

import 'package:medhealth/pages/register_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'main_page.dart';


class LoginPages extends StatefulWidget {
  @override
  _LoginPagesState createState() => _LoginPagesState();
}

class _LoginPagesState extends State<LoginPages> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool _secureText = true;
  showHide(){
    setState((){
      _secureText = !_secureText;
    });
  }


  loginSubmit() async{
var loginUrl = Uri.parse(BASEURL.apiLogin);
final response = await http.post(loginUrl, body:{
  "email"    : emailController.text,
  "password" : passwordController.text
});
  final data =jsonDecode(response.body);
  int value = data['value'];
  String message = data['message'];
  String idUser = data['user_id'];
  String fullName = data['fullName'];
  String email = data['email'];
  String phone = data['phone'];
  String address = data['address'];
  String createdAt = data['created_at'];

  if(value == 1){
    savePref(idUser, fullName, email, phone, address, createdAt); 


    showDialog(
      context: context, 
      builder: (context) => AlertDialog(
        title: Text("Informasi"),
        content: Text(message),
        actions: [TextButton(onPressed:(){
          //Navigator.pop(context);
          
          Navigator.pushAndRemoveUntil(
            context, 
              MaterialPageRoute(
                builder:(context)=>MainPages()), 
                (route) => false);
                
               // print(name);
        }, child:Text("Ok"))],
          ));
          setState(() {});
  }else{
showDialog(
      context: context, 
      builder: (context) => AlertDialog(
        title: Text("Informasi"),
        content: Text(message),
        actions: [TextButton(onPressed:(){
          Navigator.pop(context);
        }, child:Text("Ok"))],
          ));
  }
setState(() {});

  }

  savePref(String idUser, String name, String email, String phone, String address, String createdAt)async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
          sharedPreferences.setString(PrefProfile.idUser, idUser);
          sharedPreferences.setString(PrefProfile.name, name);
          sharedPreferences.setString(PrefProfile.email, email);
          sharedPreferences.setString(PrefProfile.phone, phone);
          sharedPreferences.setString(PrefProfile.address, address);
          sharedPreferences.setString(PrefProfile.createdAt, createdAt);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(child: GeneralLogoSpace(),
          ),
          Container(
            padding: EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment:  CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50,
                ),
                Text("LOGIN", 
                style: regulerTextStyle.copyWith(fontSize: 30),
                ),
                SizedBox(
                  height: 5,
                ),
                Text("lOGIN TO Your Account", 
                style: regulerTextStyle.copyWith(
                  fontSize: 10, color: greyLightColor)
                ),
                SizedBox(
                  height: 10,
                ),

                //TEXT FIELD REGISTER
                Container(
                  padding: EdgeInsets.only(left:16),
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x40000000),
                        offset: Offset(0, 1),
                        blurRadius: 4,
                        spreadRadius: 0)
                    ],
                    color: whiteColor),
                    width: MediaQuery.of(context).size.width,

                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Email',
                        hintStyle: lightTextStyle.copyWith(fontSize: 15, color:greyLightColor)),
                    ),
                  ),
                
                SizedBox(
                  height: 24,
                ),

                //TEXT FIELD REGISTER
                Container(
                  padding: EdgeInsets.only(left:16),
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x40000000),
                        offset: Offset(0, 1),
                        blurRadius: 4,
                        spreadRadius: 0)
                    ],
                    color: whiteColor),
                    width: MediaQuery.of(context).size.width,
                    
                    child: TextField(
                      controller: passwordController,
                      obscureText: _secureText,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed:showHide,
                        icon:_secureText 
                            ? Icon(Icons.visibility_off, 
                            size:20,)
                            : Icon(Icons.visibility,
                            size:20,
                            ),  

                        ),
                        
                        border: InputBorder.none,
                        hintText: 'Password',
                        hintStyle: lightTextStyle.copyWith(fontSize: 15, color:greyLightColor)),
                    ),
                  ),
                  SizedBox(
                    height:30,
                  ),

                  Container(
                    width:  MediaQuery.of(context).size.width,
                    child: ButtonPrimary(
                      text: "LOGIN",
                      onTap: (){
                        if (emailController.text.isEmpty || passwordController.text.isEmpty) {
                          showDialog(
                            context: context, 
                            builder: (context) => AlertDialog(
                              title: Text("Alert"),
                              content: Text("Pastikan Email dan Password sudah diisi!"),
                              actions: [
                                TextButton(
                                  onPressed:(){
                                    Navigator.pop(context);
                                  }, child:Text("Ok"))
                                ],
                                ));

                        } else {
                          loginSubmit();
                        }
                      },
                      ),
                  ),

                  SizedBox(
                    height:20,
                  ),

                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: InkWell(
                      child: Text("Create Account Here"),
                      onTap: (){
                            Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => RegisterPages()));
                          },
                    ),
                  ),
                  /*
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Never had Account Yet ?", 
                        style: lightTextStyle.copyWith(color:greyLightColor, fontSize: 10),
                      ),
                      Text("Register here",
                        style: boldTextStyle.copyWith(color:greenColor, fontSize: 15),
                        
                      ),
                    ],
                  )
                  */
              ],
            ),
          ),
        ],
      ),
    );
  }
}