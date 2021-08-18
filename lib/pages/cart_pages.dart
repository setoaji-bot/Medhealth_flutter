import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medhealth/network/api/url_api.dart';
import 'package:medhealth/network/model/cart_model.dart';
import 'package:medhealth/network/model/pref_profile_model.dart';
import 'package:medhealth/pages/success_checkout.dart';
import 'package:medhealth/widget/button_primary.dart';
import 'package:medhealth/widget/widget_ilustration.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../theme.dart';
import 'main_page.dart';

class CartPages extends StatefulWidget {
  final VoidCallback method;
  CartPages(this.method);
  @override
  _CartPagesState createState() => _CartPagesState();
}

class _CartPagesState extends State<CartPages> {
  final price = NumberFormat("#,##0", "EN_US");
   @override
  String userID, fullName, address, phone;
  int delivery = 0;
  getPref() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
          userID = sharedPreferences.getString(PrefProfile.idUser);
          fullName = sharedPreferences.getString(PrefProfile.name);
          address = sharedPreferences.getString(PrefProfile.address);
          phone = sharedPreferences.getString(PrefProfile.phone);
        });
    getCart();
    cartTotalPrice();
  }

List<CartModel> listCart = [];
  getCart() async {
    listCart.clear();
    var urlGetCart = Uri.parse(BASEURL.getProductCart + userID);
    final response = await http.get(urlGetCart);
    if(response.statusCode == 200){
      setState(() {
              final data = jsonDecode(response.body);
              for (Map item in data){
                listCart.add(CartModel.fromJson(item));
              }
            });
           // print(listCart[0].name);
    }
  }

 
  updateQuantity(String tipe, String model) async{
    var urlUpdateQuantity = Uri.parse(BASEURL.updateQuantityProductCart);
    final response = await http.post(urlUpdateQuantity, body: {
      "cartID" : model,
      "tipe" : tipe
    });
    final data = jsonDecode(response.body);
    int value = data['value'];
    String message = data['message'];
    if(value == 1){
      print(message);
      setState(() {
        getPref();
        widget.method();
      });
    }else{
      print(message);
      setState(() {
        getPref();
      });
    }
  }

  checkout() async{
    var urlCheckout = Uri.parse(BASEURL.checkout);
    final response = await http.post(urlCheckout, body:{
      "idUser" : userID,
    });
    final data = jsonDecode(response.body);
    int value = data['value'];
    String message = data['message'];
    if(value == 1){
      Navigator.pushAndRemoveUntil(
        context, 
        MaterialPageRoute(builder: (context) => SuccessCheckout()), 
        (route) => false);
    }else{
      print(message);
    }
  }

  var sumPrice = "0";
  int totalPayment = 0;
  cartTotalPrice() async {
    var urlTotalPrice = Uri.parse(BASEURL.totalPriceCart + userID);
    final response = await http.get(urlTotalPrice);
    if(response.statusCode == 200){
      final data = jsonDecode(response.body);
      String total = data['total'];
      setState(() {
              sumPrice = total;
              totalPayment = sumPrice == null ? 0 : int.parse(sumPrice) + delivery;
            });
      //print(sumPrice);
    }
  }

  @override
  void initState(){
    super.initState();
    getPref();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton:  listCart.length == 0 
      ? SizedBox()
      : Container(
        padding: EdgeInsets.all(24),
        height: 197,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(30))),
        child: Column(children: [
          SizedBox(
            height: 14,
          ),          
          Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total Items ", 
                  style: regulerTextStyle.copyWith(fontSize: 14, color: greyBoldColor),
                  ),

                  Text("IDR" + price.format(int.parse(sumPrice)),
                  style: regulerTextStyle.copyWith(fontSize: 14),
                  ),

                ],
              ),
          
          SizedBox(
            height: 14,
          ),

          Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Delivery fee ", 
                  style: regulerTextStyle.copyWith(fontSize: 14, color: greyBoldColor),
                  ),

                  Text(delivery == 0 ? "FREE" : delivery, 
                  style: boldTextStyle.copyWith(fontSize: 14),
                  ),

                ],
              ),

          Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                
                children: [
                  Text("Total Payment ", 
                  style: regulerTextStyle.copyWith(fontSize: 14, color: greyBoldColor),
                  ),

                  Text("IDR" + price.format(totalPayment), 
                  style: boldTextStyle.copyWith(fontSize: 14),
                  ),

                ],
              ),
              SizedBox(
                height: 20,
              ),

              Container(
                width: MediaQuery.of(context).size.width,
                child: ButtonPrimary(
                  onTap: (){
                    checkout();
                  },
                  text: "CHECHOUT NOW"
                  
                ), 
              ),
        ],)
      ),
      body:SafeArea(
        child: ListView(
          padding: EdgeInsets.only(bottom: 220),
        children: [
          Container(
                padding: EdgeInsets.fromLTRB(24, 24, 24, 0),
                height: 70,
                child: Row(
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back_rounded, 
                        size:32, 
                        color: greenColor
                        ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      "Keranjang", 
                      style: regulerTextStyle.copyWith(fontSize: 17),
                    )
                    
                  ],),),


                  listCart.length == 0 || listCart.length == null 
                  ? Container(
                    padding: EdgeInsets.all(24),
                    margin: EdgeInsets.only(top: 30),
                    child: WidgetIlustration(image: "assets/empty_cart_ilustration.png",
                    title: "Oops, there are no products in you Cart",
                    subtitle1: "Your Cart is Still Empty, Browser the",
                    subtitle2: "attractive products from MEDHEALTH",
                    child: Container(
                      margin: EdgeInsets.only(top: 30),
                      width: MediaQuery.of(context).size.width,
                      child: ButtonPrimary(
                        text: "SHOPPING NOW",
                        onTap: (){
                          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>MainPages()), (route) => false);
                        },
                      ),
                    ),
                    ),
                  )
                  : 
          
          Container(
            padding: EdgeInsets.all(24),
            height: 160,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Destinasi Pengiriman", 
                style: regulerTextStyle.copyWith(fontSize: 17),
                ),
              
              SizedBox(
                height: 12
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Nama ", 
                  style: regulerTextStyle.copyWith(fontSize: 14, color: greyBoldColor),
                  ),

                  Text("$fullName", 
                  style: regulerTextStyle.copyWith(fontSize: 14),
                  ),

                ],
              ),

              SizedBox(
                height: 8,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Alamat", 
                  style: regulerTextStyle.copyWith(fontSize: 14, color: greyBoldColor),
                  ),

                  Text("$address", 
                  style: regulerTextStyle.copyWith(fontSize: 14),
                  ),

                ],
              ),

              SizedBox(
                height: 8,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Phone", 
                  style: regulerTextStyle.copyWith(fontSize: 14, color: greyBoldColor),
                  ),

                  Text("$phone", 
                  style: regulerTextStyle.copyWith(fontSize: 14),
                  ),

                ],
              ),

              ],
          )),

        ListView.builder(
          itemCount: listCart.length,
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          itemBuilder: (context,i){
            final x = listCart[i];
          return  Container(
          padding: EdgeInsets.all(24),
          color: whiteColor,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.network(
                    x.image, 
                  width: 100, 
                  height: 100,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 200,
                    child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        x.name, 
                        style:regulerTextStyle.copyWith(fontSize: 10)),
                      Row(children: [
                         IconButton(
                           icon: Icon(
                             Icons.add_circle,
                             color: greenColor,

                           ), 
                           onPressed: (){
                             updateQuantity("tambah", x.idCart);
                           }),
                        //Icon(Icons.add_circle),
                        Text(x.quantity),
                        IconButton(
                          icon: Icon(
                            Icons.remove_circle,
                            color: Colors.red,
                            
                          ), 
                          onPressed: (){
                            updateQuantity("kurang", x.idCart);
                          }),
                      ],),
                      Text(
                        "Rp" + price.format(int.parse(x.price)),
                        style:boldTextStyle.copyWith(fontSize: 14)),
                    ],),
                  )
                ],
              ),
              Divider(),
            ]
          )
        );


          })


        ],
      )), 
      
    );
  }
}