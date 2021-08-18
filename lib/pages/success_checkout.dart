import 'package:flutter/material.dart';
import 'package:medhealth/pages/main_page.dart';
import 'package:medhealth/widget/button_primary.dart';
import 'package:medhealth/widget/general_logo_space.dart';
import 'package:medhealth/widget/widget_ilustration.dart';

class SuccessCheckout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GeneralLogoSpace(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.all(24),
          children: [
            SizedBox(
              height: 10,
            ),
            WidgetIlustration(
              image:"assets/order_success_ilustration.png",
              title: "Yeay, Your order was Successful.",
              subtitle1: "Consult with a Doctor",
              subtitle2: "Whereever You Want",
            ),
            SizedBox(
              height: 10,
            ),
            ButtonPrimary(
              text: "BACK TO HOME",
              onTap: (){
                Navigator.pushAndRemoveUntil(
                  context, 
                  MaterialPageRoute(builder: (context) => MainPages()), 
                  (route) => false);
              },
            ),
          ],
        ),
      ),
    );
  }
}