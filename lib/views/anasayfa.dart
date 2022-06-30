import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yemeksiparis/cubit/anasayfa_cubit.dart';
import 'package:yemeksiparis/entity/yemekler.dart';
import 'package:yemeksiparis/views/yemek_detay_sayfa.dart';

class AnaSayfa extends StatefulWidget {
  const AnaSayfa({Key? key}) : super(key: key);

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  @override
  void initState() {
    super.initState();
    context.read<AnaSayfaCubit>().yemekleriYukle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFe0e0e0),
      body: BlocBuilder<AnaSayfaCubit, List<Yemekler>>(
        builder: (context, yemekler) {
          if (yemekler.isNotEmpty) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                  itemCount: yemekler.length,
                  itemBuilder: (context, index) {
                    var yemek = yemekler[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    YemekDetaySayfa(yemek: yemek))).then(
                            (value) =>
                                context.read<AnaSayfaCubit>().yemekleriYukle());
                      },
                      child: Card(
                        shadowColor: Colors.grey,
                        shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                color: Colors.deepPurpleAccent, width: 2),
                            borderRadius: BorderRadius.circular(15.0)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  SizedBox(
                                    height: 110,
                                    child: Image.network(
                                        "http://kasimadalan.pe.hu/yemekler/resimler/${yemek.yemek_resim_adi}"),
                                  ),
                                  Text(
                                    yemek.yemek_adi,
                                    style: const TextStyle(
                                      fontFamily: "TxtFont",
                                      fontSize: 20,
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    "${yemek.yemek_fiyat} ₺",
                                    style: const TextStyle(
                                      fontFamily: "TxtFont",
                                      fontSize: 25,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            );
          } else {
            return const Center();
          }
        },
      ),
    );
  }
}
