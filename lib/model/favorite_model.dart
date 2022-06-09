// To parse required this JSON data, do
//
//     final favorite = favoriteFromJson(jsonString);

import 'dart:convert';

Favorite favoriteFromJson(String str) => Favorite.fromJson(json.decode(str));

String favoriteToJson(Favorite data) => json.encode(data.toJson());

class Favorite {
    Favorite({
        required this.data,
    });

    List<Datum> data;

    factory Favorite.fromJson(Map<String, dynamic> json) => Favorite(
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
        required this.ukuran,
        required this.kategori,
    });

    int id;
    int barangId;
    String namaBarang;
    String fotoBarang;
    int harga;
    String deskripsi;
    String ukuran;
    String kategori;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        barangId: json["barang_id"],
        namaBarang: json["nama_barang"],
        fotoBarang: json["foto_barang"],
        harga: json["harga"],
        deskripsi: json["deskripsi"],
        ukuran: json["ukuran"],
        kategori: json["kategori"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "barang_id": barangId,
        "nama_barang": namaBarang,
        "foto_barang": fotoBarang,
        "harga": harga,
        "deskripsi": deskripsi,
        "ukuran": ukuran,
        "kategori": kategori,
    };
}
