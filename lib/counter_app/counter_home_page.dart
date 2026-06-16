import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';


final counter = StateProvider<int>((ref){
  return 0;
});

class CounterHomePage extends ConsumerWidget {
  const CounterHomePage({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        title: Text(
          "Counter App",
        ),
      ),
      body: Column(
        children: [
          Center(
            child: Consumer(
              builder: (context,ref,child) {
                final count = ref.watch(counter);
                return Text(count.toString(),
                  style: TextStyle(
                    fontSize: 25,
                  ),
                );
              }
            ),
          ),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: (){
                ref.read(counter.notifier).state++;
              }, 
                  child: Icon(Icons.add)
              ),
              ElevatedButton(onPressed: (){
                ref.read(counter.notifier).state--;
              },
                  child: Icon(Icons.minimize),
              ),
            ],
          )
        ],
      ),
    );
  }
}
