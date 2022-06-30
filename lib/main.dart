import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yemeksiparis/cubit/anasayfa_cubit.dart';
import 'package:yemeksiparis/cubit/sepet_sayfa_cubit.dart';
import 'package:yemeksiparis/cubit/yemek_detay_cubit.dart';
import 'package:yemeksiparis/views/anasayfa.dart';
import 'package:yemeksiparis/views/gecis_sayfasi.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => YemekDetayCubit()),
        BlocProvider(create: (context) => SepetSayfaCubit()),
        BlocProvider(create: (context) => AnaSayfaCubit()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const GecisSayfasi(),
      ),
    );
  }
}
