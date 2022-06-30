import 'package:flutter/material.dart';
import 'package:yemeksiparis/views/anasayfa.dart';
import 'package:yemeksiparis/views/sepet_sayfa.dart';

class GecisSayfasi extends StatefulWidget {
  const GecisSayfasi({Key? key}) : super(key: key);

  @override
  State<GecisSayfasi> createState() => _GecisSayfasiState();
}

class _GecisSayfasiState extends State<GecisSayfasi> {
  int selected = 0;
  var sayfalar = [const AnaSayfa(), const SepetSayfa()];
  var sayfaBaslik = ["YEMEKLER", "SEPETİM"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          sayfaBaslik[selected],
          style: const TextStyle(
            fontFamily: "HeaderFont",
          ),
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: sayfalar[selected],
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  image: DecorationImage(
                      image: AssetImage("resimler/log.jpg"),
                      fit: BoxFit.cover)),
              child: Align(
                alignment: Alignment.topRight,
                child: Text(
                  "Yemek Sipariş",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      //backgroundColor: Colors.deepPurple,
                      fontFamily: "MyFont"),
                ),
              ),
            ),
            ListTile(
              title: const Text(
                "Yemekler",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    fontStyle: FontStyle.italic,
                    fontFamily: "TxtFont"),
              ),
              leading: const Icon(
                Icons.restaurant,
                size: 30,
                color: Colors.deepPurple,
              ),
              onTap: () {
                setState(() {
                  selected = 0;
                });
                Navigator.pop(context);
              },
            ),
            const Divider(
              color: Colors.blueGrey,
              thickness: 0.3,
              indent: 18,
              endIndent: 18,
            ),
            ListTile(
              title: const Text(
                "Sepetim",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    fontStyle: FontStyle.italic,
                    fontFamily: "TxtFont"),
              ),
              leading: const Icon(
                Icons.shopping_basket_outlined,
                size: 30,
                color: Colors.deepPurple,
              ),
              onTap: () {
                setState(() {
                  selected = 1;
                });
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
