import 'package:flutter/material.dart';
import 'package:mypoj/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  String name = "";
  bool changeButton = false;
  final _formKey = GlobalKey<FormState>();
  moveToHome(BuildContext context) async{
    if(_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(const Duration(seconds: 1));
      Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeButton = false;
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return  Material(
      color: context.canvasColor,

       child:  SingleChildScrollView(
         child: Form(

          key: _formKey,
           child: Column(
            children: [
              Image.asset("assets/images/hey.png",
                width: 200.0,
                height:200.0,
              ),
              const SizedBox(
                  height:20.0
                  ,width:20.0
              ),
              Text(
                "Welcome $name",
                style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold
                ),
              ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0,horizontal: 32.0),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: "User Name",
                          labelText: "Username",
                        ),
                        validator: (value){
                          if(value!.isEmpty){
                            return "Username cannot be empty";
                          }
                          return null;
                        },
                        onChanged: (value){
                          name = value;
                          setState(() {

                          });
                        },
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: const InputDecoration(
                            hintText: "Enter Password",
                            labelText: "Password"
                        ),
                        validator: (value){
                          if(value!.isEmpty){
                            return "Password cannot be empty";
                          }
                          else if(value.length <6){
                             return "Password should be atleast six";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height:20.0,
                      ),
                      Material(
                        color: Colors.deepPurple,
                        borderRadius: BorderRadius.circular(changeButton==true?20:8),

                        child: InkWell(
                          splashColor: Colors.red,
                          onTap: () =>moveToHome(context),
                          child:
                            AnimatedContainer(
                              width: changeButton==true?50:150,
                              height:50,
                              alignment: Alignment.center,
                              duration: const Duration(seconds: 1),
                              child:changeButton?const Icon(Icons.done,color: Colors.white,):const Text(
                                "Login",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize:18),
                              )
                            ),
                        ),
                      ),
                      //
                      // ElevatedButton(
                      //   onPressed: (){
                      //     Navigator.pushNamed(context,MyRoutes.homeRoute);
                      //   },
                      //   style: TextButton.styleFrom(
                      //     minimumSize: const Size(100,50)
                      //
                      //   ),
                      //   child: const Text("Login"),
                      // ),
                    ],
                  ),
                ),

            ],
      ),
         ),
       )
    );
  }
}

