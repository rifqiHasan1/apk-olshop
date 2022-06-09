// ignore_for_file: use_key_in_widget_constructors, avoid_unnecessary_containers, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:uas/api_service.dart';
import 'package:uas/model/cart_model.dart';

class DetailKeranjang extends StatefulWidget {
  Cart data;
  DetailKeranjang({required this.data});
  @override
  State<DetailKeranjang> createState() => _DetailKeranjangState();
}

class _DetailKeranjangState extends State<DetailKeranjang> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                      "Order",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, left: 40),
              child: Text(
                "Alamat pengiriman",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, left: 25, right: 25),
              child: Divider(
                color: Colors.black,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5, left: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Rifqi(08240148104)",
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 3),
                  Text(
                    "Jl.nin aja dulu",
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    "Pesanan",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  _item(widget.data),
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    "Ringkasan Pesanan",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8, left: 25, right: 25),
              child: Divider(
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Total Keseluruhan",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "\$",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 130),
              child: Center(
                child: Container(
                  width: 395,
                  height: 60,
                  child: Material(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.blue,
                    elevation: 7.0,
                    child: GestureDetector(
                      onTap: () {
                        widget.data.data
                            .map((data) =>
                                ApiService().addToOrder(data.barangId, 20000))
                            .toList();
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
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _item(Cart data) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
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
