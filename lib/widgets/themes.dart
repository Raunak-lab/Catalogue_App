import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

 class MyTheme{
   static ThemeData lightTheme(BuildContext context)=>ThemeData(
      primarySwatch: Colors.deepPurple,
     cardColor: Colors.white,
     canvasColor: creamColor,
      fontFamily: GoogleFonts.poppins().fontFamily,
      appBarTheme: const AppBarTheme(
      color:Colors.white,
      elevation: 0.0,
     iconTheme: IconThemeData(color: Colors.black),
     titleTextStyle:TextStyle(
     color:Colors.black,
       fontWeight: FontWeight.bold,
       fontSize: 22
      ) ,
      ),
   );
   static ThemeData darkTheme(BuildContext context)=> ThemeData(
     brightness: Brightness.dark,
     primarySwatch: Colors.deepPurple,
     fontFamily: GoogleFonts.poppins().fontFamily,
     cardColor: Colors.black,
     canvasColor: darkCreamColor,
     appBarTheme: const AppBarTheme(
       color:Colors.black,
       elevation: 0.0,
       iconTheme: IconThemeData(color: Colors.white),
       titleTextStyle:TextStyle(
           color:Colors.white,
           fontWeight: FontWeight.bold,
           fontSize: 22
       ) ,
     ),
   );


   static const Color creamColor = Color(0xfff5f5f5);
   static const Color darkCreamColor = Vx.gray900;
   static const Color darkBluishColor = Color(0xff403b58);
   static const Color lightBluishColor = Vx.purple400;


}


