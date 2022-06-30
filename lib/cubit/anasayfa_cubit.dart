import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yemeksiparis/entity/yemekler.dart';
import 'package:yemeksiparis/repo/YemeklerDaoRepository.dart';

class AnaSayfaCubit extends Cubit<List<Yemekler>> {
  AnaSayfaCubit() : super(<Yemekler>[]);

  var krepo = YemeklerDaoRepository();

  Future<void> yemekleriYukle() async {
    var liste = await krepo.tumYemekler();
    emit(liste);
  }
}
