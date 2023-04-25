import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'dart:convert';
import '../models/catalog.dart';
import '../utils/routes.dart';
import '../widgets/item_widget.dart';
import '../widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

import 'home_widgets/catalog_header.dart';
import 'home_widgets/catalog_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key ?key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }
  loadData()async{
    var catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    var deCodedData = jsonDecode(catalogJson);
    var productsData = deCodedData["products"];
    CatalogModel.items = List.from(productsData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      floatingActionButton: FloatingActionButton(onPressed: () =>Navigator.pushNamed(context, MyRoutes.cartRoute),
        backgroundColor: MyTheme.darkBluishColor,
        child:Icon(CupertinoIcons.cart,
        color: Colors.white,
        ),),
      body:SafeArea(
        child: Container(
          padding: Vx.m32,
              child: Column(

                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                     CatalogHeader(),
                    if(CatalogModel.items!=null && CatalogModel.items.isNotEmpty)
                        const CatalogList().p16().expand()
                    else
                      CircularProgressIndicator().centered().py16().expand(),


                  ],
              ),

        ),
      ),
    );
  }
}






