// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uas/api_service.dart';
import 'package:uas/pages/home.dart';
import 'package:uas/pages/login.dart';
import 'package:http/http.dart' as http;

class Register extends StatefulWidget {
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController username = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController alamat = TextEditingController();
  TextEditingController password = TextEditingController();
  Future register() async {
    Uri url = Uri.parse("$baseUrl/user/register");
    final res = await http.post(url,
        body: jsonEncode({
          "username": username.text,
          "phone": phone.text,
          "alamat": alamat.text,
          "password": password.text,
        }),
        headers: headers);
    SharedPreferences storage = await SharedPreferences.getInstance();
    if (res.statusCode == 200) {
    var token = jsonDecode(res.body)["token"];
    storage.setString("token", token);
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => Home()));
    } else {
      print(res.statusCode);
      print(res.body);
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                child: Image.network(
                    'https://img.freepik.com/free-vector/gradient-hexagonal-background_23-2148932756.jpg?size=626&ext=jpg&ga=GA1.2.1903224127.1652838851')),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: Container(
                child: Row(
                  children: [
                    Text("Sign-Up",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: (40))),
                  ],
                ),
              ),
            ),
            Container(
                child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
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
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 18),
                  child: TextField(
                    controller: phone,
                    decoration: InputDecoration(
                      labelText: "No Telp",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 18),
                  child: TextField(
                    controller: alamat,
                    decoration: InputDecoration(
                      labelText: "Alamat",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 18),
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
              height: 20,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: width / 40),
              width: width,
              child: ElevatedButton(
                onPressed: () {
                  register();
                },
                child: Text(
                  "Sign Up",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
                child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return Login();
                }));
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
                    TextSpan(text: "Already have an account ?"),
                    TextSpan(
                        text: " Sign-in", style: TextStyle(color: Colors.blue)),
                  ])),
            ))
          ],
        ),
      ),
    );
  }
}
