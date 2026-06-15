import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//read const value
final hello = Provider<String>((ref){
  return "subscribe to my channel";
});

final age = Provider<int>((ref){
  return 28;
});

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final subscribe= ref.watch(hello);
    final temp = ref.watch(age);
    return Scaffold(
      appBar: AppBar(
        title: Text("riverpod"),
      ),
     body: Center(
       child:Text(subscribe+" "+temp.toString()),
     ),
    );
  }
}


// class HomeScreen  extends ConsumerWidget{
//   const HomeScreen({super.key});
//
//   @override
//   Widget build(BuildContext context,WidgetRef ref){
//     final subscribe= ref.watch(hello);
//     final temp = ref.watch(age);
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("riverpod"),
//       ),
//      body: Center(
//        child:Text(subscribe+" "+temp.toString()),
//      ),
//     );
//   }
//}