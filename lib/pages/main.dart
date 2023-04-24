import 'package:flutter/material.dart';
import 'package:mypoj/pages/cart_page.dart';
import 'package:mypoj/pages/login_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mypoj/utils/routes.dart';
import 'package:mypoj/widgets/themes.dart';



import 'home_page.dart';

    void main(){
    runApp(MyApp());
    }

    class MyApp extends StatelessWidget {
      @override
      Widget build(BuildContext context) {
        return MaterialApp(
          themeMode: ThemeMode.dark,
          theme: MyTheme.lightTheme(context),
          darkTheme: MyTheme.darkTheme(context),
          debugShowCheckedModeBanner: false,
          routes: {
            "/" :(context)=> const HomePage(),
            MyRoutes.homeRoute :(context)=>HomePage(),
            MyRoutes.loginRoute:(context)=>LoginPage(),
            MyRoutes.cartRoute:(context)=>CartPage()
          },
        );
      }

    }



//$days string interpolation
