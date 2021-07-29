import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:medhealth/network/api/url_api.dart';
import 'package:medhealth/theme.dart';
import 'package:medhealth/widget/button_primary.dart';
import 'package:medhealth/widget/general_logo_space.dart';
import 'package:http/http.dart' as http;

import 'login_page.dart';


class RegisterPages extends StatefulWidget {
  @override
  _RegisterPagesState createState() => _RegisterPagesState();
}

class _RegisterPagesState extends State<RegisterPages> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool _secureText = true;
  showHide(){
    setState((){
      _secureText = !_secureText;
    });
  }

registerSubmit() async{
var registerUrl = Uri.parse(BASEURL.apiRegister);
final response = await http.post(registerUrl, body:{
  "fullName" : fullNameController.text,
  "email"    : emailController.text,
  "phone"    : phoneController.text,
  "address"  : addressController.text,
  "password" : passwordController.text
});
  final data = jsonDecode(response.body);
  int value = data['value'];
  String message = data['message'];
  if(value == 1){
    showDialog(
      context: context, 
      builder: (context) => AlertDialog(
        title: Text("Informasi"),
        content: Text(message),
        actions: [TextButton(onPressed:(){
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder:(context)=>LoginPages()), (route) => false);
        }, child:Text("Ok"))],
          ));
          setState(() {});
  }else{
    showDialog(
      context: context, 
      builder: (context) => AlertDialog(
        title: Text("Informasi"),
        content: Text(message),
        actions: [TextButton(
          onPressed:(){
            Navigator.pop(context);
           }, 
        child:Text("Ok"))],
          ));
  }
setState(() {});

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
                Text("REGISTER", 
                style: regulerTextStyle.copyWith(fontSize: 30),
                ),
                SizedBox(
                  height: 8,
                ),
                Text("Register new Your Account", 
                style: regulerTextStyle.copyWith(
                  fontSize: 10, color: greyLightColor)
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
                      controller: fullNameController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Full Name',
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
                      controller: phoneController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Phone',
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
                      controller: addressController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Address',
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
                      text: "SUBMIT",
                      onTap: (){
                        if (fullNameController.text.isEmpty || emailController.text.isEmpty || phoneController.text.isEmpty || addressController.text.isEmpty || passwordController.text.isEmpty) {
                          showDialog(
                            context: context, 
                            builder: (context) => AlertDialog(
                              title: Text("Alert"),
                              content: Text("Pastikan Semua Form diisi!"),
                              actions: [
                                TextButton(
                                  onPressed:(){
                                    Navigator.pop(context);
                                  }, child:Text("Ok"))
                                ],
                                ));

                        } else {
                          registerSubmit();
                        }
                      },
                      ),
                  ),

                  SizedBox(
                    height:20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an account ?", 
                        style: lightTextStyle.copyWith(color:greyLightColor, fontSize: 10),
                      ),
                      InkWell(
                      child: Text("Login Here"),
                      onTap: (){
                            Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) => LoginPages()));
                          },
                    ),
                    ],
                  )

              ],
            ),
          ),
        ],
      ),
    );
  }
}
