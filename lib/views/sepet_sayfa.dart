import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yemeksiparis/cubit/sepet_sayfa_cubit.dart';
import 'package:yemeksiparis/entity/sepet_yemekler.dart';
import 'package:yemeksiparis/views/gecis_sayfasi.dart';

class SepetSayfa extends StatefulWidget {
  const SepetSayfa({Key? key}) : super(key: key);

  @override
  State<SepetSayfa> createState() => _SepetSayfaState();
}

class _SepetSayfaState extends State<SepetSayfa> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    context.read<SepetSayfaCubit>().sepetYemekleriYukle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SepetSayfaCubit, List<SepetYemekler>>(
        builder: (context, yemekler) {
          if (yemekler.isNotEmpty) {
            return ListView.builder(
                itemCount: yemekler.length,
                itemBuilder: (context, index) {
                  var yemek = yemekler[index];
                  int g = int.parse(yemek.yemek_siparis_adet) *
                      int.parse(yemek.yemek_fiyat);
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        context.read<SepetSayfaCubit>().sepetYemekleriYukle();
                      },
                      child: SizedBox(
                        width: 100,
                        height: 90,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                  color: Colors.white, width: 2),
                              borderRadius: BorderRadius.circular(15.0)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text(
                                  "${yemek.yemek_adi} (${yemek.yemek_siparis_adet} adet * ${yemek.yemek_fiyat} = $g ₺ )",
                                  style: const TextStyle(
                                    fontFamily: "TxtFont",
                                    fontSize: 20,
                                  ),
                                ),
                                const Spacer(),
                                IconButton(
                                    onPressed: () {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content: Text(
                                            "${yemek.yemek_adi} silinsin mi?"),
                                        action: SnackBarAction(
                                          label: "Evet",
                                          onPressed: () {
                                            context.read<SepetSayfaCubit>().sil(
                                                int.parse(yemek.sepet_yemek_id),
                                                yemek.kullanici_adi);
                                          },
                                        ),
                                      ));
                                    },
                                    icon: const Icon(
                                      Icons.delete_outline,
                                      color: Colors.black45,
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                });
          } else {
            return const Center();
          }
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 16,
        backgroundColor: const Color(0xFFe0e0e0),
        selectedItemColor: Colors.deepPurple,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.payment_outlined),
            label: 'Sepeti Onayla',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Anasayfaya Git',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(
            () {
              _selectedIndex = index;
            },
          );
          if (index == 0) {
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      title: const Text("Sepeti Onaylamak İstiyor Musunuz?"),
                      actions: [
                        TextButton(
                          child: const Text("Evet"),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const GecisSayfasi()));
                          },
                        ),
                        TextButton(
                          child: const Text("Hayır"),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ));
          }
          if (index == 1) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const GecisSayfasi()));
          }
        },
      ),
    );
  }
}
