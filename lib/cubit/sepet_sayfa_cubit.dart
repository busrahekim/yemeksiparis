import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yemeksiparis/entity/sepet_yemekler.dart';
import 'package:yemeksiparis/repo/SepetYemeklerDaoRepository.dart';

class SepetSayfaCubit extends Cubit<List<SepetYemekler>> {
  SepetSayfaCubit() : super(<SepetYemekler>[]);

  var krepo = SepetYemeklerDaoRepository();

  Future<void> sepetYemekleriYukle() async {
    var liste = await krepo.sepetTumYemekler();
    emit(liste);
  }

  Future<void> sil(int sepet_yemek_id, String kullanici_id) async {
    var liste = await krepo.yemekSil(sepet_yemek_id, kullanici_id);
    await sepetYemekleriYukle();
  }
}
