import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   const imageUrl = "assets/images/profile_pic.png";
    return  Drawer(
      child:  Container(
        color: Colors.deepPurple,
        child: ListView(
          padding: EdgeInsets.zero,
          children:  const [
              DrawerHeader(
               padding: EdgeInsets.zero,

               child :UserAccountsDrawerHeader(
                 margin: EdgeInsets.zero,
                 accountName:  Text("Raunak Kumar Thakur"),
                 accountEmail: Text("raunakkumarthakur12@gmail.com"),
                 currentAccountPicture:CircleAvatar(
                   backgroundImage:AssetImage(imageUrl) ,
                 ),
               ),
             ),
            ListTile(
              leading:  Icon(
                CupertinoIcons.home,
                color: Colors.white,
              ),
              title:Text("Home",
              textScaleFactor: 1.2,
                style: TextStyle(
                  color:Colors.white,
                ),
              ),
            ),
            ListTile(
                leading:  Icon(
                  CupertinoIcons.profile_circled,
                  color: Colors.white,
                ),
                title:Text("profile",
                  textScaleFactor: 1.2,
                  style: TextStyle(
                    color:Colors.white,
                  ),
                ),
            ),
            ListTile(
              leading:  Icon(
                CupertinoIcons.mail,
                color: Colors.white,
              ),
              title:Text("Email",
                textScaleFactor: 1.2,
                style: TextStyle(
                  color:Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
