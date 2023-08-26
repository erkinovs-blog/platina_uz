import 'package:flutter/material.dart';

import 'home_page_mixin.dart';
import 'widgets/custom_bottom_bar.dart';
import 'widgets/custom_drawer.dart';
import 'widgets/custom_sliver_appbar.dart';
import 'widgets/home_scaffold_body.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with HomePageMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: isDrawerOpen,
        builder: (context, value, child) {
          return NestedScrollView(
            physics: value
                ? const NeverScrollableScrollPhysics()
                : const AlwaysScrollableScrollPhysics(),
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                CustomSliverAppBar(changeScaffoldDrawer: changeScaffoldDrawer),
              ];
            },
            body: child!,
          );
        },
        child: Scaffold(
          drawerScrimColor: Colors.blue.withOpacity(0.3),
          onDrawerChanged: changeDrawerValue,
          key: scaffoldKey,
          body: HomeScaffoldBody(isDrawerOpen: isDrawerOpen),
          drawer: const CustomDrawer(),
          bottomNavigationBar: CustomBottomBar(
            selectedPage: selectedPage,
            homeEntries: homeEntries,
            isDrawerOpen: isDrawerOpen,
          ),
        ),
      ),
    );
  }
}
