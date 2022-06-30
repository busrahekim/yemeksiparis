import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:yemeksiparis/entity/yemekler.dart';
import 'package:yemeksiparis/entity/yemekler_cevap.dart';

class YemeklerDaoRepository {
  List<Yemekler> parseYemeklerCevap(String cevap) {
    return YemeklerCevap.fromJson(json.decode(cevap)).yemekler;
  }

  Future<List<Yemekler>> tumYemekler() async {
    var url =
        Uri.parse("http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php");
    var cevap = await http.get(url);
    return parseYemeklerCevap(cevap.body);
  }

  Future<List<Yemekler>> tumYemeklerResim(String yemek_resim_adi) async {
    String s = "http://kasimadalan.pe.hu/yemekler/resimler/$yemek_resim_adi";
    var url = Uri.parse(s);
    var cevap = await http.get(url);
    return parseYemeklerCevap(cevap.body);
  }
}
