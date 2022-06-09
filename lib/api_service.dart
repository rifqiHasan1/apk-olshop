import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uas/bottomN.dart';
import 'package:uas/model/barang_model.dart';
import 'package:uas/model/cart_model.dart';
import 'package:uas/model/favorite_model.dart';
import 'package:uas/model/profile_model.dart';

String baseUrl = "http://192.168.5.220:8000";
Map<String, String> headers = {
  "Content-Type": "application/json",
  "Authorization": ""
};

class ApiService {
  Future login(String name, String password, BuildContext context) async {
    Uri url = Uri.parse("$baseUrl/user/login");
    SharedPreferences storage = await SharedPreferences.getInstance();
    final res = await http.post(url,
        body: jsonEncode({"username": name, "password": password}),
        headers: headers);
    if (res.statusCode == 200) {
      storage.setString("token", jsonDecode(res.body)["token"]);
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => BottomNavigation()));
      return true;
    } else {
      print(res.statusCode);
      print(res.body);
      return false;
    }
  }

  Future getProfile() async {
    Uri url = Uri.parse("$baseUrl/user/profile");
    SharedPreferences storage = await SharedPreferences.getInstance();
    headers["Authorization"] = "Bearer ${storage.getString("token")}";
    final res = await http.get(url, headers: headers);
    if (res.statusCode == 200) {
      print(res.statusCode);
      return profileFromJson(res.body);
    } else {
      print(res.statusCode);
      print(res.body);
      return false;
    }
  }

  Future addToOrder(int id, int total) async {
    Uri url = Uri.parse("$baseUrl/order/add/$id");
    SharedPreferences storage = await SharedPreferences.getInstance();
    headers["Authorization"] = "Bearer ${storage.getString("token")}";
    final res = await http.post(url,
        body: jsonEncode({"total": total}), headers: headers);
    if (res.statusCode == 200) {
      print(res.statusCode);
      return true;
    } else {
      print(res.statusCode);
      print(res.body);
      return false;
    }
  }

  Future getCart() async {
    Uri url = Uri.parse("$baseUrl/cart/get");
    SharedPreferences storage = await SharedPreferences.getInstance();
    headers["Authorization"] = "Bearer ${storage.getString("token")}";
    final res = await http.get(url, headers: headers);
    if (res.statusCode == 200) {
      print(res.statusCode);
      return cartFromJson(res.body);
    } else {
      print(res.statusCode);
      print(res.body);
      return false;
    }
  }

  Future addToCart(int id) async {
    Uri url = Uri.parse("$baseUrl/cart/add/$id");
    SharedPreferences storage = await SharedPreferences.getInstance();
    headers["Authorization"] = "Bearer ${storage.getString("token")}";
    final res = await http.post(url, headers: headers);
    if (res.statusCode == 200) {
      print(res.statusCode);
      return true;
    } else {
      print(res.statusCode);
      print(res.body);
      return false;
    }
  }

  Future getFavorite() async {
    Uri url = Uri.parse("$baseUrl/favorite/get");
    SharedPreferences storage = await SharedPreferences.getInstance();
    headers["Authorization"] = "Bearer ${storage.getString("token")}";
    final res = await http.get(url, headers: headers);
    if (res.statusCode == 200) {
      return favoriteFromJson(res.body);
    } else {
      print(res.statusCode);
      print(res.body);
      return false;
    }
  }

  Future addFavorite(int id) async {
    Uri url = Uri.parse("$baseUrl/favorite/add/$id");
    SharedPreferences storage = await SharedPreferences.getInstance();
    headers["Authorization"] = "Bearer ${storage.getString("token")}";
    final res = await http.post(url, headers: headers);
    if (res.statusCode == 200) {
      print(res.statusCode);
      return true;
    } else {
      print(res.statusCode);
      return false;
    }
  }

  Future getBarang(String kategori) async {
    Uri url = Uri.parse("$baseUrl/barang/all?$kategori");
    SharedPreferences storage = await SharedPreferences.getInstance();
    headers["Authorization"] = "Bearer ${storage.getString("token")}";
    final res = await http.get(url, headers: headers);
    if (res.statusCode == 200) {
      return barangModelFromJson(res.body);
    } else {
      print(res.statusCode);
      print(res.body);
      return false;
    }
  }
}
