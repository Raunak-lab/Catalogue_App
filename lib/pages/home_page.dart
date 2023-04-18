import 'package:flutter/material.dart';
import 'package:mypoj/widgets/drawer.dart';

import '../models/catalog.dart';
import '../widgets/item_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dummyList = List.generate(20,(index)=>CatalogModel.items[0]);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Catalogue App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount : dummyList.length,
          itemBuilder: (context,index){
           return ItemWidget(item: dummyList[index]);
          },

        ),
      ),
      drawer: const MyDrawer(),
    );
  }
}
