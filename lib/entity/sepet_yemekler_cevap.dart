// ignore_for_file: non_constant_identifier_names

import 'package:yemeksiparis/entity/sepet_yemekler.dart';

class SepetYemeklerCevap {
  List<SepetYemekler> sepet_yemekler;
  int success;

  SepetYemeklerCevap({required this.sepet_yemekler, required this.success});

  factory SepetYemeklerCevap.fromJson(Map<String, dynamic> json) {
    var jsonArray = json["sepet_yemekler"] as List;
    List<SepetYemekler> sepetYemeklerListesi =
        jsonArray.map((nesne) => SepetYemekler.fromJson(nesne)).toList();
    return SepetYemeklerCevap(
        sepet_yemekler: sepetYemeklerListesi, success: json["success"] as int);
  }
}
