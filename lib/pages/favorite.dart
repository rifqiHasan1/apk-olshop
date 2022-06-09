// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:uas/api_service.dart';
import 'package:uas/model/favorite_model.dart';
import 'package:uas/pages/detailBarang.dart';

class FavoritePage extends StatefulWidget {
  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  late Future getFavorite;
  @override
  void initState() {
    getFavorite = ApiService().getFavorite();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width / 25),
          child: Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Container(
                    child: Text(
                      "Favorites",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Icon(
                Icons.favorite_border,
                color: Colors.red,
                size: 30,
              ),
              SizedBox(
                height: 30,
              ),
              FutureBuilder(
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState != ConnectionState.done) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return Text("terjadi kesalahan");
                  } else {
                    if (snapshot.hasData) {
                      return _card(context, snapshot.data);
                    } else {
                      return Text("kosong");
                    }
                  }
                },
                future: getFavorite,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _card(BuildContext context, Favorite data) {
    return StaggeredGrid.count(
      mainAxisSpacing: 4,
      crossAxisCount: 3,
      crossAxisSpacing: 10,
      children: data.data.map((data) {
        return InkWell(
          onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => DetailBarang(
                    idBarang: data.barangId,
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
