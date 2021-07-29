import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:medhealth/network/api/url_api.dart';
import 'package:medhealth/network/model/product_model.dart';
import 'package:medhealth/widget/card_category.dart';
import 'package:medhealth/widget/card_product.dart';
import '../theme.dart';
import 'package:http/http.dart' as http;

class HomePages extends StatefulWidget {

  @override
  _HomePagesState createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  int index;
  bool filter = false;
  List<CategoryWithProduct> listCategory = [];
  getCategory() async{
    listCategory.clear();
    var urlCategory = Uri.parse(BASEURL.categoryWithProduct);
    final response = await http.get(urlCategory);
    if(response.statusCode == 200){
      setState(() {
              final data = jsonDecode(response.body);
              for (Map item in data){
                listCategory.add(CategoryWithProduct.fromJson(item));
              }
            });
            getProduct();
    }
  }

  List<ProductModel> listProduct = [];
  getProduct() async{
    listProduct.clear();
    var urlProduct = Uri.parse(BASEURL.getProduct);
    final response = await http.get(urlProduct);
    if(response.statusCode == 200){
      setState(() {
              final data = jsonDecode(response.body);
              for(Map product in data){
                listProduct.add(ProductModel.fromJson(product));
              }
            });
    }


  }

  @override
    void initState(){
      super.initState();
      getCategory();
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
            padding: EdgeInsets.fromLTRB(24, 30, 24, 30),
          children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/logo.png',
                        width: 155,
                        ),

                      SizedBox(
                        height: 20,
                        ),

                      Text("Find a Medicine in MEDICALTH!", 
                        style: regulerTextStyle.copyWith(
                        fontSize:15, color: greyBoldColor)
                        ),

                    ],
                  ),
                  IconButton(
                    onPressed:(){}, 
                    icon:Icon(
                      Icons.shopping_cart_outlined,
                      color: greenColor,
                      ),
                    )
                ],  
              ),

              SizedBox(
                height: 24,
              ),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                height: 55,
                decoration: 
                  BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xffe4faf0)
                  ),
                  child:TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none, 
                      prefixIcon: Icon(Icons.search, 
                      color: Color(0xffb1d8b2),
                      ),
                    hintText: "Search Medicine ",
                    hintStyle: regulerTextStyle.copyWith(color: Color(0xffb0d8b2))
                    ),

                   
                  ),
              ),
              SizedBox(
                height: 32,
              ),
              
              Text("Medicine & Vitamin by Category", 
                style:regulerTextStyle.copyWith(fontSize: 16),
              ),
              SizedBox(
                height: 10,
              ),
            
             GridView.builder(
                physics: ClampingScrollPhysics(),
                itemCount: listCategory.length,
                shrinkWrap: true,
                gridDelegate: 
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), 
                itemBuilder: (context, i){
                  final x = listCategory[i];
                  return InkWell(
                    onTap: (){
                      setState(() {
                        index = i;        
                        filter = true;
                        print("$index, $filter");                
                      });
                     },
                    child: CardCategory(
                      imageCategory: x.image, 
                      nameCategory: x.category,
                    ),
                  );
                }
              ),

              SizedBox(
                height: 10,
              ),

          filter 
            ? index == 7 ? Text("Feature on Proggress") :
              GridView.builder(
                physics: ClampingScrollPhysics(),
                itemCount: listCategory[index].product.length,
                shrinkWrap: true,
                gridDelegate: 
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1, mainAxisSpacing: 15),
                itemBuilder: (context, i){
                  final y = listCategory[index].product[i];
                  return CardProduct(
                    nameProduct: y.nameProduct, 
                    imageProduct: y.imageProduct, 
                    price: y.price,
                  );
                })
            : GridView.builder(
                physics: ClampingScrollPhysics(),
                itemCount: listProduct.length,
                shrinkWrap: true,
                gridDelegate: 
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1, mainAxisSpacing: 15),
                itemBuilder: (context, i){
                  final y = listProduct[i];
                  return CardProduct(
                    nameProduct: y.nameProduct,
                    imageProduct: y.imageProduct,
                    price: y.price,
                  );
               }),
          ],
        )
      )
    
  
    
    );
  

  }


}