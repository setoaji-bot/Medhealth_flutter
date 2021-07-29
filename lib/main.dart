import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:medhealth/pages/login_page.dart';
import 'package:medhealth/pages/main_page.dart';
import 'package:medhealth/pages/splash_screen.dart';
import 'package:medhealth/theme.dart';
	
class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}
//void main() =>runApp(MyApp());

void main(){
    HttpOverrides.global = new MyHttpOverrides();
    runApp(new MyApp());
}

class  MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: greenColor),
      home: MainPages(),
      
    );
  }
}