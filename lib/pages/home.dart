// ignore_for_file: prefer_const_constructors


import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:uas/pages/detailBarang.dart';


class Home extends StatefulWidget {
  
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: TextFormField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Search',
                    border: OutlineInputBorder(),
                    filled: true),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'please enter a search term';
                  }
                  return null;
                },
              ),
            ),
          ),
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 40, top: 10, bottom: 10, right: 15),
                  child: Container(
                    child: Material(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "All",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    child: Material(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "Handbags",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    child: Material(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "Dresses",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    child: Material(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "men's clothing",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text(
                    "New Collection",
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 15),
                  _card(context)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _card(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_)=>DetailBarang()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey,
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://img.freepik.com/free-psd/shopping-bag-mockup_58466-17138.jpg?size=626&ext=jpg&ga=GA1.2.1903224127.1652838851'),
                            fit: BoxFit.cover),
                      ),
                      width: 180,
                      height: 190,
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    child: Text("Embossed Faux Leather "),
                  ),
                  SizedBox(height: 5,),
                  Container(
                    child: Text("\$120",style: TextStyle(fontWeight: FontWeight.bold),),
                  )
                ],
              ),
              SizedBox(
                width: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailBarang()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey,
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://img.freepik.com/free-photo/pink-canvas-sneakers-with-polka-dot-unisex-footwear-fashion_53876-106039.jpg?size=626&ext=jpg&ga=GA1.2.1903224127.1652838851'),
                            fit: BoxFit.cover),
                      ),
                      width: 180,
                      height: 190,
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    child: Text("Nike Air Force 1 Graffiti"),
                  ),
                  SizedBox(height: 5,),
                  Container(
                    child: Text("\$150",style: TextStyle(fontWeight: FontWeight.bold),),
                  )
                ],
              ),
            ],
          ),
          
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_)=>DetailBarang()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey,
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://img.freepik.com/free-photo/beautiful-elegant-evening-women-s-dress-white-background_236836-20099.jpg?size=338&ext=jpg&ga=GA1.2.1903224127.1652838851'),
                            fit: BoxFit.cover),
                      ),
                      width: 180,
                      height: 190,
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    child: Text("V-Neck Print Sherri Dress "),
                  ),
                  SizedBox(height: 5,),
                  Container(
                    child: Text("\$220",style: TextStyle(fontWeight: FontWeight.bold),),
                  )
                ],
              ),
              SizedBox(
                width: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailBarang()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey,
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://img.freepik.com/free-psd/black-t-shirt-mockup_125540-430.jpg?size=626&ext=jpg&ga=GA1.2.1903224127.1652838851'),
                            fit: BoxFit.cover),
                      ),
                      width: 180,
                      height: 190,
                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    child: Text("Mockup Orwell Socialist"),
                  ),
                  SizedBox(height: 5,),
                  Container(
                    child: Text("\$97",style: TextStyle(fontWeight: FontWeight.bold),),
                  )
                ],
              ),
            ],
          ),
          
        )
      ],
    );
  }
}
