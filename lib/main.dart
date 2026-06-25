import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/Slider/slider_home_page.dart';
import 'package:riverpod_example/counter_app/counter_home_page.dart';
import 'package:riverpod_example/home_screen.dart';

void main() {
  runApp(const ProviderScope(child:MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
      home: SliderHomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

