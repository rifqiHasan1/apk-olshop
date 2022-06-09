// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:uas/api_service.dart';
import 'package:uas/model/cart_model.dart';
import 'package:uas/pages/detailKeranjang.dart';

class Keranjang extends StatefulWidget {
  @override
  State<Keranjang> createState() => _KeranjangState();
}

class _KeranjangState extends State<Keranjang> {
  late Future getCart;
  @override
  void initState() {
    getCart = ApiService().getCart();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.only(top: 15.0, left: 20),
              child: Row(
                children: [
                  Container(
                      child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.arrow_back))),
                  SizedBox(
                    width: 25,
                  ),
                  Container(
                      child: Text(
                    "Cart",
                    style: TextStyle(fontSize: 20),
                  )),
                ],
              ),
            ),
          ),
          FutureBuilder(
            future: getCart,
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text("terjadi kesalahan"),
                );
              } else {
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      _item(snapshot.data),
                       SizedBox(
            height: 420,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Total",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 20,
                ),
                Text("\$",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold))
              ],
            ),
          ),
          SizedBox(
            height: 30,
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
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => DetailKeranjang(data: snapshot.data,)));
                },
                child: Center(
                  child: Text(
                    "Make Order",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
                    ],
                  );
                } else {
                  return Center(
                    child: Text("terjadi kesalahan"),
                  );
                }
              }
            },
          ),
         
        ],
      ),
    );
  }

  Widget _item(Cart data) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: StaggeredGrid.count(
          crossAxisCount: 1,
          mainAxisSpacing: 20,
          children: data.data.map((data) {
            return Container(
              width: 400,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.lightBlueAccent,
              ),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey,
                      image: DecorationImage(
                          image: NetworkImage(data.fotoBarang),
                          fit: BoxFit.cover),
                    ),
                    width: 120,
                    height: 100,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(data.namaBarang),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "\$${data.harga}",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          }).toList()),
    );
  }
}
