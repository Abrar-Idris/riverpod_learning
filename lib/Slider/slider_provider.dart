import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final sliderProvider = StateProvider<double>((ref){
  return 0.0;
});