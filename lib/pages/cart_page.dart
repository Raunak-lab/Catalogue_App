import 'package:flutter/material.dart';
import 'package:mypoj/core/store.dart';
import 'package:mypoj/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:mypoj/models/cart.dart';

class CartPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.make(),

      ),

      body: Column(
        children: [
           _CartList().p32().expand(),
          const Divider(),
          const _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  const _CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    final _cart = (VxState.store as MyStore).cart;

    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          "\$${_cart.totalPrice}"
              .text
              .xl5
              .color(context.theme.accentColor)
              .make(),
          30.widthBox,
          ElevatedButton(onPressed: (){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content:"Buying not supported yet.".text.make()));
          },
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(MyTheme.darkBluishColor))
              , child: "Buy".text.color(Colors.white).make(),
          ).w32(context)
        ],
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  final _cart = (VxState.store as MyStore).cart;
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    return _cart.items.isEmpty?"Nothing to show".text.xl3.makeCentered(): ListView.builder(
      itemCount: _cart.items?.length,
        itemBuilder:(context,index) =>ListTile(
        leading: const Icon(Icons.done),
    trailing: IconButton(
      icon: const Icon(Icons.remove_circle_outline),
    onPressed: () => RemoveMutation(_cart.items[index]),

    ),
          title: _cart.items[index].name.text.make(),
    ) );
  }
}

