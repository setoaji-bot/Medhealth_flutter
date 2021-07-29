import 'package:flutter/material.dart';
import 'package:medhealth/pages/register_page.dart';
import 'package:medhealth/widget/general_logo_space.dart';
import 'package:medhealth/widget/widget_ilustration.dart';
import 'package:medhealth/widget/button_primary.dart';

class  SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GeneralLogoSpace(
        child: Column(
          children:[
            SizedBox(height: 40,
            ),
            WidgetIlustration(
              image: "assets/splash_ilustration.png",
              title: "Find Your Medical Solution",
              subtitle1: "Consult With Our Pro Doctor",
              subtitle2: "Whereever and Any Place",
              child: ButtonPrimary(
                text: "GET STARTED",
                onTap: (){
                  Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => RegisterPages()));
                },
                ),
              ),
          ],
        ),),
    );    
  }
}