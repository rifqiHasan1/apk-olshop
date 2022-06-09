// To parse required this JSON data, do
//
//     final cart = cartFromJson(jsonString);

import 'dart:convert';

Cart cartFromJson(String str) => Cart.fromJson(json.decode(str));

String cartToJson(Cart data) => json.encode(data.toJson());

class Cart {
    Cart({
        required this.data,
    });

    List<Datum> data;

    factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        required this.id,
        required this.barangId,
        required this.namaBarang,
        required this.fotoBarang,
        required this.harga,
        required this.deskripsi,
        required this.kategori,
        required this.ukuran,
    });

    int id;
    int barangId;
    String namaBarang;
    String fotoBarang;
    int harga;
    String deskripsi;
    String kategori;
    String ukuran;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        barangId: json["barang_id"],
        namaBarang: json["nama_barang"],
        fotoBarang: json["foto_barang"],
        harga: json["harga"],
        deskripsi: json["deskripsi"],
        kategori: json["kategori"],
        ukuran: json["ukuran"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "barang_id": barangId,
        "nama_barang": namaBarang,
        "foto_barang": fotoBarang,
        "harga": harga,
        "deskripsi": deskripsi,
        "kategori": kategori,
        "ukuran": ukuran,
    };
}
