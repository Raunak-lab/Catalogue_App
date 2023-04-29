import 'package:velocity_x/velocity_x.dart';

import '../../core/store.dart';
import '../../models/cart.dart';
import '../../models/catalog.dart';
import '../../widgets/themes.dart';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;

   AddToCart({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    VxState.watch(context,on:[AddMutation,RemoveMutation]);
    final CartModel  _cart = (VxState.store as MyStore).cart;
    bool isInCart = _cart.items.contains(catalog)??false;

    return ElevatedButton(
        onPressed: (){

          if(!isInCart){
            AddMutation(catalog);
          }

        },style: ButtonStyle(
        backgroundColor:MaterialStateProperty.all(MyTheme.darkBluishColor),
        shape: MaterialStateProperty.all(
            StadiumBorder(),
        )),
        child: isInCart? Icon(Icons.done):Icon(CupertinoIcons.cart_badge_plus));
  }
}



