
import 'package:calculator/Homescreen.dart';
import 'package:calculator/MyProvider.dart';
import 'package:calculator/Provider.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'CalcProvider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>Myprovider()),
        ChangeNotifierProvider(create: (context)=>CalcProvider()),
        //ChangeNotifierProvider(create: (context)=>CalcProvider()),
        //ChangeNotifierProvider(create: (context)=>CalcProvider()),
      ],
      child: MaterialApp(
        title: 'Calculator',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(

          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Homescreen(),
      ),
    );
  }
}

