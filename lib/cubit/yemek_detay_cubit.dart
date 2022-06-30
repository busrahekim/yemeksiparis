import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yemeksiparis/repo/SepetYemeklerDaoRepository.dart';

class YemekDetayCubit extends Cubit<void> {
  YemekDetayCubit() : super(0);
  var krepo = SepetYemeklerDaoRepository();

  Future<void> siparisEkle(
      String yemek_adi,
      String yemek_resim_adi,
      String yemek_fiyat,
      String yemek_siparis_adet,
      String kullanici_adi) async {
    await krepo.sepetYemekKayit(yemek_adi, yemek_resim_adi, yemek_fiyat,
        yemek_siparis_adet, kullanici_adi);
  }
}
