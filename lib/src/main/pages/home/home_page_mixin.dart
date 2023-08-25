import 'package:flutter/material.dart';
import '../../../common/constants/app_icons.dart';

import 'home_page.dart';

mixin HomePageMixin on State<HomePage> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  ValueNotifier<bool> isDrawerOpen = ValueNotifier(false);
  ValueNotifier<int> selectedPage = ValueNotifier(0);
  List<(String name, String imagePath)> homeEntries = [
    ("Asosiy", AppIcons.home),
    ("Lenta", AppIcons.news),
    ("Ommabop", AppIcons.tranding),
    ("Maqola", AppIcons.document),
    ("Video", AppIcons.play),
  ];


  void changeDrawerValue(isOpened) {
    isDrawerOpen.value = isOpened;
  }

  void changeScaffoldDrawer() {
    if (scaffoldKey.currentState?.isDrawerOpen ?? false) {
      scaffoldKey.currentState?.closeDrawer();
    } else {
      scaffoldKey.currentState?.openDrawer();
    }
  }
}