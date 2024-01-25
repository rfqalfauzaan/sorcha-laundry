import 'package:flutter/material.dart';
import '../models/laundrymodel.dart';


class LaundryProvider with ChangeNotifier {
  Laundry _laundry = Laundry();

  Laundry get laundry => _laundry;

  void setWeight(int weight) {
    _laundry.weight = weight;
    notifyListeners();
  }

  void setDescription(String description) {
    _laundry.description = description;
    notifyListeners();
  }

  void setLaundryName(String laundryName) {
    _laundry.laundryName = laundryName;
    notifyListeners();
  }
}