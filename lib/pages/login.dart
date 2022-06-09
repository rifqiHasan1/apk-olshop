// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:uas/api_service.dart';
import 'package:uas/pages/register.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Container(
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(40))),
              child: Image.network(
                  'https://img.freepik.com/free-vector/gradient-hexagonal-background_23-2148932756.jpg?size=626&ext=jpg&ga=GA1.2.1903224127.1652838851')),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Container(
                child: Row(
              children: [
                Text(
                  "Log-in",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: (40)),
                )
              ],
            )),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
              child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  controller: username,
                  decoration: InputDecoration(
                    labelText: "Username",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: TextField(
                  controller: password,
                  decoration: InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                ),
              ),
            ],
          )),
          SizedBox(
            height: 50,
          ),
          Container(
            width: 395,
            height: 60,
            child: Material(
              borderRadius: BorderRadius.circular(15),
              color: Colors.blue,
              elevation: 7.0,
              child: GestureDetector(
                onTap: () {
                  ApiService().login(username.text, password.text, context);
                },
                child: Center(
                  child: Text(
                    "Login",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
              child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return Register();
                  },
                ),
              );
            },
            child: RichText(
                text: TextSpan(
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: "popin",
                      fontSize: (15),
                    ),
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                  TextSpan(text: "Don't have an account ?"),
                  TextSpan(
                      text: " Sign-up", style: TextStyle(color: Colors.blue)),
                ])),
          ))
        ]),
      ),
    );
  }
}
