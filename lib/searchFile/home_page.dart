import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/searchFile/search_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});


  @override
  Widget build(BuildContext context,WidgetRef ref){
    return Scaffold(
      appBar: AppBar(
        title: Text("State Notifier Provider "),
      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            onChanged: (value){
              ref.read(searchProvider.notifier).search(value);
            },
          ),
          Consumer(
            builder: (context,ref,child) {
              final search = ref.watch(searchProvider);
              return Text(search.search);
            }
          ),

          Consumer(
              builder: (context,ref,child) {
                final isChange = ref.watch((searchProvider).select((state)=>state.isChange));
                return Switch(value:isChange,
                  onChanged: (value){
                    ref.read(searchProvider.notifier).onChange(value);
                  },
                );
              }
          ),
        ],
      ),
    );
  }
}