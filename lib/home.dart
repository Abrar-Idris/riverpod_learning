import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/src/framework.dart';
import 'package:riverpod_example/provider/counter_provider.dart';

class Home extends ConsumerWidget{
  const Home({super.key});


  @override
  Widget build(BuildContext context,WidgetRef ref) {

    final counter = ref.watch(counterProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Home Page"
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("You have clicked the button this many times"),
            Text(counter.toString(),
              style:TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),

      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
           ref.watch(counterProvider.notifier).increment();
          },
        child: const Icon(Icons.add),
      ),
    );
  }}