// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, curly_braces_in_flow_control_structures


import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uas/api_service.dart';
import 'package:uas/model/profile_model.dart';
import 'package:uas/pages/login.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late Future getProfile;
  @override
  void initState() {
    getProfile = ApiService().getProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getProfile,
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState != ConnectionState.done)
            return Center(
              child: CircularProgressIndicator(),
            );
          if (snapshot.hasError)
            return Center(
              child: Text("terjadi kesalahan"),
            );
          if (snapshot.hasData) return _builder(context, snapshot.data);
          return Center(
            child: Text("kosong"),
          );
        },
      ),
    );
  }
}

Widget _builder(BuildContext context, Profile data) {
  print(data.data.photoProfile);
  return Column(
    children: [
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  'https://img.freepik.com/free-vector/gradient-geometric-background_23-2148808998.jpg?size=626&ext=jpg&ga=GA1.2.1903224127.1652838851'),
              fit: BoxFit.cover),
        ),
        width: 500,
        height: 330,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Container(
                      child: Text(
                    "Profile",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  )),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.blue),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5, left: 5),
                      child: Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.white,
                          )),
                    ),
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  width: 180,
                  height: 180,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: NetworkImage(
                              "https://t4.ftcdn.net/jpg/02/98/25/49/240_F_298254993_wYbL2DGXzNy3Io23RNJIaaKbas2U2HRo.jpg"))),
                ),
                SizedBox(
                  width: 20,
                ),
                Stack(
                  children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.black),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5, left: 5),
                      child: Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
                child: Text(
              data.data.username,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ))
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 30, left: 30),
        child: Container(
            child: Row(
          children: [
            Icon(
              Icons.person,
              size: 55,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Username",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(data.data.username),
              ],
            )
          ],
        )),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: Divider(
          color: Colors.black,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 10, left: 30),
        child: Container(
            child: Row(
          children: [
            Icon(
              Icons.phone,
              size: 55,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "No. Telp",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(data.data.phone.toString()),
              ],
            )
          ],
        )),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: Divider(
          color: Colors.black,
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 10, left: 30),
        child: Container(
            child: Row(
          children: [
            Icon(
              Icons.home,
              size: 55,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Alamat",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(data.data.alamat),
              ],
            )
          ],
        )),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: Divider(
          color: Colors.black,
        ),
      ),
      InkWell(
        onTap: () async {
          SharedPreferences storage = await SharedPreferences.getInstance();
          storage.remove("token");
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => Login()));
        },
        child: Padding(
          padding: const EdgeInsets.only(top: 10, left: 30),
          child: Container(
              child: Row(
            children: [
              Icon(
                Icons.arrow_back,
                size: 55,
              ),
              Text(
                "Log Out",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              )
            ],
          )),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: Divider(
          color: Colors.black,
        ),
      )
    ],
  );
}
