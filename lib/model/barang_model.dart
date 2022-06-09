// To parse required this JSON data, do
//
//     final barangModel = barangModelFromJson(jsonString);

import 'dart:convert';

BarangModel barangModelFromJson(String str) => BarangModel.fromJson(json.decode(str));

String barangModelToJson(BarangModel data) => json.encode(data.toJson());

class BarangModel {
    BarangModel({
        required this.data,
    });

    List<Datum> data;

    factory BarangModel.fromJson(Map<String, dynamic> json) => BarangModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        required this.id,
        required this.namaBarang,
        required this.fotoBarang,
        required this.harga,
        required this.deskripsi,
        required this.kategori,
        required this.ukuran,
    });

    int id;
    String namaBarang;
    String fotoBarang;
    int harga;
    String deskripsi;
    String kategori;
    String ukuran;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        namaBarang: json["nama_barang"],
        fotoBarang: json["foto_barang"],
        harga: json["harga"],
        deskripsi: json["deskripsi"],
        kategori: json["kategori"],
        ukuran: json["ukuran"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nama_barang": namaBarang,
        "foto_barang": fotoBarang,
        "harga": harga,
        "deskripsi": deskripsi,
        "kategori": kategori,
        "ukuran": ukuran,
    };
}
