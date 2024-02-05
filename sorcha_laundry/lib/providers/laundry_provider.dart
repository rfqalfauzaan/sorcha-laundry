// import 'package:flutter/material.dart';
// import '../models/laundrymodel.dart';


// class LaundryProvider with ChangeNotifier {
//   Laundry _laundry = Laundry();

//   Laundry get laundry => _laundry;

//   void setWeight(int weight) {
//     _laundry.weight = weight;
//     notifyListeners();
//   }

//   void setDescription(String description) {
//     _laundry.description = description;
//     notifyListeners();
//   }

//   void setLaundryName(String laundryName) {
//     _laundry.laundryName = laundryName;
//     notifyListeners();
//   }
// }

import 'package:d_method/d_method.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final laundryStatusProvider = StateProvider.autoDispose((ref) => '');

setlaundryStatus(WidgetRef ref, String newStatus) {
  DMethod.printTitle('setlaundryStatus', newStatus);
  ref.read(laundryStatusProvider.notifier).state = newStatus;
}
