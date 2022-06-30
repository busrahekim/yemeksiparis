import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yemeksiparis/cubit/yemek_detay_cubit.dart';
import 'package:yemeksiparis/entity/yemekler.dart';
import 'package:yemeksiparis/views/sepet_sayfa.dart';

class SepetYemekKayitSayfa extends StatefulWidget {
  Yemekler yemek;

  SepetYemekKayitSayfa({required this.yemek});

  @override
  State<SepetYemekKayitSayfa> createState() => _SepetYemekKayitSayfaState();
}

class _SepetYemekKayitSayfaState extends State<SepetYemekKayitSayfa> {
  var yemekAdeti;

  @override
  void initState() {
    super.initState();
    yemekAdeti = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sipariş Verme Sayfası"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 50.0, right: 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                widget.yemek.yemek_adi,
                style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    fontFamily: "TxtFont"),
              ),
              Text(
                "${widget.yemek.yemek_fiyat} ₺",
                style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontFamily: "TxtFont"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                      onPressed: () {
                        if (yemekAdeti > 0) {
                          setState(() {
                            yemekAdeti--;
                          });
                        }
                      },
                      icon: const Icon(Icons.remove_circle_outlined),
                      color: Colors.deepPurpleAccent,
                      iconSize: 35),
                  Text(
                    yemekAdeti.toString(),
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: "TxtFont"),
                  ),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          yemekAdeti++;
                        });
                      },
                      icon: const Icon(Icons.add_circle_outlined),
                      color: Colors.deepPurpleAccent,
                      iconSize: 35),
                ],
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.deepPurple,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 20),
                    textStyle: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold)),
                onPressed: () {
                  context.read<YemekDetayCubit>().siparisEkle(
                      widget.yemek.yemek_adi,
                      widget.yemek.yemek_resim_adi,
                      widget.yemek.yemek_fiyat,
                      yemekAdeti.toString(),
                      "busra_hekim");
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SepetSayfa()));
                },
                child: const Text("SİPARİŞİ TAMAMLA"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
