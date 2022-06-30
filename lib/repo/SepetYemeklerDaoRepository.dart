import 'dart:convert';
import 'package:yemeksiparis/entity/sepet_yemekler.dart';
import 'package:yemeksiparis/entity/sepet_yemekler_cevap.dart';
import 'package:http/http.dart' as http;

class SepetYemeklerDaoRepository {
  List<SepetYemekler> parseYemeklerCevap(String cevap) {
    return SepetYemeklerCevap.fromJson(json.decode(cevap)).sepet_yemekler;
  }

  Future<List<SepetYemekler>> sepetTumYemekler() async {
    var url = Uri.parse(
        "http://kasimadalan.pe.hu/yemekler/sepettekiYemekleriGetir.php");
    var veri = {"kullanici_adi": "busra_hekim"};
    var cevap = await http.post(url, body: veri);
    //var cevap = await http.get(url);
    return parseYemeklerCevap(cevap.body);
  }

  Future<void> sepetYemekKayit(
      String yemek_adi,
      String yemek_resim_adi,
      String yemek_fiyat,
      String yemek_siparis_adet,
      String kullanici_adi) async {
    var url =
        Uri.parse("http://kasimadalan.pe.hu/yemekler/sepeteYemekEkle.php");
    var veri = {
      "yemek_adi": yemek_adi,
      "yemek_resim_adi": yemek_resim_adi,
      "yemek_fiyat": yemek_fiyat,
      "yemek_siparis_adet": yemek_siparis_adet,
      "kullanici_adi": "busra_hekim"
    };
    var cevap = await http.post(url, body: veri);
    print("sepete yemek ekle: ${cevap.body}");
  }

  Future<void> yemekSil(int sepet_yemek_id, String kullanici_adi) async {
    var url =
        Uri.parse("http://kasimadalan.pe.hu/yemekler/sepettenYemekSil.php");
    var veri = {
      "sepet_yemek_id": sepet_yemek_id.toString(),
      "kullanici_adi": kullanici_adi,
    };
    var cevap = await http.post(url, body: veri);
    print("yemek sil: ${cevap.body}");
  }
}
