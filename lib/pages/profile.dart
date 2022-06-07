import 'package:flutter/material.dart';
import 'package:uas/pages/home.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                            )
                          ),
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
                SizedBox(height: 10,),
                Container(child: Text("Rifqi Hasan",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top:30,left: 30),
            child: Container(
              child:Row(
                children: [
                  Icon(Icons.person,size: 55,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Username",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                      SizedBox(height: 5,),
                      Text("Rifqi Hasan"),
                     
                    ],
                  )
                ],
              )
            ),
          ),
           Padding(
             padding: const EdgeInsets.only(left:30,right: 30),
             child: Divider(color: Colors.black,),
           ),
            Padding(
            padding: const EdgeInsets.only(top:10,left: 30),
            child: Container(
              child:Row(
                children: [
                  Icon(Icons.phone,size: 55,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("No. Telp",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                      SizedBox(height: 5,),
                      Text("083721631267"),
                     
                    ],
                  )
                ],
              )
            ),
          ),
           Padding(
             padding: const EdgeInsets.only(left:30,right: 30),
             child: Divider(color: Colors.black,),
           ),
            Padding(
            padding: const EdgeInsets.only(top:10,left: 30),
            child: Container(
              child:Row(
                children: [
                  Icon(Icons.home,size: 55,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Alamat",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                      SizedBox(height: 5,),
                      Text("Jl.anggrek"),
                     
                    ],
                  )
                ],
              )
            ),
          ),
           Padding(
             padding: const EdgeInsets.only(left:30,right: 30),
             child: Divider(color: Colors.black,),
           ),
           Padding(
            padding: const EdgeInsets.only(top:10,left: 30),
            child: Container(
              child:Row(
                children: [
                  Icon(Icons.arrow_back,size: 55,),
                  Text("Log Out",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)
                ],
              )
            ),
          ),
           Padding(
             padding: const EdgeInsets.only(left:30,right: 30),
             child: Divider(color: Colors.black,),
           )
        ],
      ),
    );
  }
}
