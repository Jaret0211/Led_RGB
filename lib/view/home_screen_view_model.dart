import 'dart:math';

import 'package:app_lampara/provider/base_model.dart';
import 'package:flutter/cupertino.dart';

class HomeScreenViewModel extends BaseModel {
  //-------------VARIABLES-------------//
  int selectedIndex = 0;
  int randomNumber = 1;
  final PageController pageController = PageController();
  bool isLightOn = true;
  bool isLightFav = false;
  
  void generateRandomNumber() {
    randomNumber = Random().nextInt(8);
    notifyListeners();
  }
  void lightFav(){
    isLightFav = !isLightFav;
    notifyListeners();
  }

  void lightSwitch() {
    isLightOn = !isLightOn;
    notifyListeners();
  }

  ///On tapping bottom nav bar items
  void onItemTapped(int index) {
    selectedIndex = index;
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 500), curve: Curves.easeOut);
    notifyListeners();
  }
}
