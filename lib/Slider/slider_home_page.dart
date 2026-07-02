import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example/Slider/slider_provider.dart';

class SliderHomePage extends ConsumerWidget {
  const SliderHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Slider Home"),

      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer(
            builder: (context,ref,child) {
              final slider = ref.watch(sliderProvider.select((state)=>state.slider));
              print("container");
              return Container(
                height: 200,
                width: 200,
                color: Colors.red.withOpacity(slider),
              );
            }
          ),
           Consumer(
                builder: (context,ref,child) {
                  final slider = ref.watch(sliderProvider.select((state)=>state.showPassword));
                  print("icons ");
                  return InkWell(
                    onTap: (){
                      final stateProvider = ref.read(sliderProvider.notifier);
                      stateProvider.state = stateProvider.state.copyWith(showPassword:!slider);
                    },
                    child: Container(
                      height: 200,
                      width: 200,
                      child: slider? Icon(Icons.remove_red_eye_sharp):Icon(Icons.remove_red_eye_outlined),
                    ),
                  );
                }
            ),

          Consumer(
            builder: (context,ref,child) {
              final slider = ref.watch(sliderProvider);
              return Slider(value: slider.slider, onChanged: (value) {
                final stateProvider = ref.read(sliderProvider.notifier);
                stateProvider.state = stateProvider.state.copyWith(slider: value);
              });
            }
          ),

         
        ],
      ),
    );
  }
}
