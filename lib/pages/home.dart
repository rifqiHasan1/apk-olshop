// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:uas/api_service.dart';
import 'package:uas/model/barang_model.dart';
import 'package:uas/pages/detailBarang.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future getBarang;
  FutureOr changeState(String value) {
    setState(() {
      getBarang = ApiService().getBarang("category=$value");
    });
  }

  @override
  void initState() {
    getBarang = ApiService().getBarang("");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
      future: getBarang,
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Text("Terjadi kesalahan");
        } else {
          if (snapshot.hasData) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: TextFormField(
                      onFieldSubmitted: (value) {
                        setState(() {
                          getBarang = ApiService().getBarang("search=$value");
                        });
                      },
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
                      InkWell(
                        onTap: () {
                          setState(() {
                            getBarang = ApiService().getBarang("");
                          });
                        },
                        child: Padding(
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
                      ),
                      InkWell(
                        onTap: () => changeState("bag"),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            child: Material(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.blue,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  "Bag",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () => changeState("shoes"),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            child: Material(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.blue,
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Text(
                                  "Shoes",
                                  style: TextStyle(color: Colors.white),
                                ),
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
                      children: [
                        Text(
                          "New Collection",
                          style: TextStyle(
                              fontSize: 35, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 15),
                        _card(context, snapshot.data)
                      ],
                    ),
                  ),
                ),
              ],
            );
          } else {
            return Text("kosong");
          }
        }
      },
    ));
  }

  Widget _card(BuildContext context, BarangModel barangModel) {
    return StaggeredGrid.count(
      mainAxisSpacing: 4,
      crossAxisCount: 3,
      crossAxisSpacing: 10,
      children: barangModel.data.map((data) {
        return InkWell(
          onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => DetailBarang(
                    idBarang: data.id,
                    data: data,
                  ))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey,
                  image: DecorationImage(
                      image: NetworkImage(data.fotoBarang), fit: BoxFit.cover),
                ),
                width: 180,
                height: 190,
              ),
              SizedBox(
                height: 10,
              ),
              Text(data.namaBarang),
              SizedBox(
                height: 10,
              ),
              Text(
                "\$${data.harga}",
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          ),
        );
      }).toList(),
    );
  }
}
