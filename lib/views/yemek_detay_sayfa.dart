// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:yemeksiparis/entity/yemekler.dart';
import 'package:yemeksiparis/views/sepetYemek_kayit_sayfa.dart';

class YemekDetaySayfa extends StatefulWidget {
  Yemekler yemek;
  YemekDetaySayfa({Key? key, required this.yemek}) : super(key: key);

  @override
  State<YemekDetaySayfa> createState() => _YemekDetaySayfaState();
}

class _YemekDetaySayfaState extends State<YemekDetaySayfa> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Yemek Detay"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 50.0, right: 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 150,
                height: 150,
                child: Image.network(
                    "http://kasimadalan.pe.hu/yemekler/resimler/${widget.yemek.yemek_resim_adi}"),
              ),
              Text(
                widget.yemek.yemek_adi,
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.w400),
              ),
              Text(
                "${widget.yemek.yemek_fiyat} ₺",
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.deepPurple,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 20),
                    textStyle: const TextStyle(
                        fontSize: 15, fontWeight: FontWeight.bold)),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SepetYemekKayitSayfa(
                                yemek: widget.yemek,
                              )));
                },
                child: const Text("SİPARİŞ VER"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//context.read<YemekDetayCubit>().siparisEkle(widget.yemek.yemek_adi,widget.yemek.yemek_resim_adi,widget.yemek.yemek_fiyat,tfyemekadeti.text,"busra_hekim");
