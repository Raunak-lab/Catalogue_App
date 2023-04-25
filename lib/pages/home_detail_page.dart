import 'package:mypoj/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../models/catalog.dart';

class HomeDetailPage extends StatelessWidget {
   final Item catalog;

  const HomeDetailPage({required this.catalog}):assert(catalog!=null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: context.canvasColor,
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
            alignment: MainAxisAlignment.spaceBetween,
            buttonPadding: EdgeInsets.zero,
            children: [
              "\$${catalog.price}".text.bold.xl4.red800.make(),
              ElevatedButton(onPressed: (){},
                  style: ButtonStyle(
                  backgroundColor:MaterialStateProperty.all(MyTheme.darkBluishColor),
                  shape: MaterialStateProperty.all(StadiumBorder())
              ), child: "Add To Cart".text.make() ).wh(180,50)

            ]
        ).p32(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(

          children: [
            Hero(
              tag: Key(catalog.id.toString()),
                child: Image.network(catalog.image)).h32(context).py24().centered(),
            Expanded(child: VxArc(
              height: 30.0,
              arcType: VxArcType.CONVEY,
              edge: VxEdge.TOP,
              child: Container(
                 color: context.cardColor,
                width: context.screenWidth,
                child: Column(
                  children: [
                    catalog.name.text.xl4.color(MyTheme.darkBluishColor).bold.make(),
                    catalog.desc.text.textStyle(context.captionStyle).xl.make(),
                    10.heightBox,
                  ],
                ).py64(),

              ),
            ),)

          ],
        ),
      ),
    );
  }
}
