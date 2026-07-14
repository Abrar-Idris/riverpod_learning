import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/Notes_app/provider/item_provider.dart';

class HomeScreenN extends ConsumerWidget {
  const HomeScreenN({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref){
    final item = ref.watch(ItemProvider);
    return Scaffold(
      appBar: AppBar(
        title:Text("Notes APP") ,
      ),
      body: item.isEmpty ? Center(child: Text("No data Found")):
      ListView.builder(
        itemCount:  item.length,
        itemBuilder: (context,index){
          final itemDetail = item[index];
          return ListTile(
           title: Text(itemDetail.name),
            leading: ElevatedButton(
                onPressed:(){
                  ref.read(ItemProvider.notifier).updateItem(itemDetail.id, "Update Item");
                },
                child:Icon(Icons.update,)
            ),
            trailing: ElevatedButton(
                onPressed:(){
                  ref.read(ItemProvider.notifier).deleteItem(itemDetail.id);
                },
                child:Icon(Icons.delete,)
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            ref.read(ItemProvider.notifier).addItem("new Item");
          },
          child: const Icon(Icons.add),
      ),
    );
  }
}