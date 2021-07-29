import 'package:flutter/material.dart';
import 'package:medhealth/theme.dart';


class  WidgetIlustration extends StatelessWidget {
  final Widget child;
  final String image;
  final String title;
  final String subtitle1;
  final String subtitle2;

  WidgetIlustration(
    {this.child, this.image, this.title, this.subtitle1, this.subtitle2});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
        image, 
        width:250,
        ),
        SizedBox(height: 20,),
        Text(
          title, 
          style: regulerTextStyle.copyWith(fontSize: 20),
          textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 25
            ),

            Column(
              children: [
                Text(
                  subtitle1, 
                    style: regulerTextStyle.copyWith
                    (fontSize:10, color: greyLightColor),
                    ),
                SizedBox(
                  height: 7,
                  ),
                Text(
                  subtitle2, 
                    style: regulerTextStyle.copyWith
                    (fontSize:10, color: greyLightColor),
                    ),
                SizedBox(
                  height: 20,
                  ),

                    child ?? SizedBox(),
              ],
            ),
      ],
    );
  }
}