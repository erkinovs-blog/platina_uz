import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/constants/app_colors.dart';
import '../../../common/constants/app_icons.dart';
import 'home_page_mixin.dart';

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
                SliverAppBar(
                  backgroundColor: AppColors.white,
                  elevation: 0,
                  toolbarHeight: 60,
                  title: const Image(
                    image: AssetImage(AppIcons.logo),
                    height: 32,
                  ),
                  centerTitle: true,
                  leadingWidth: 60,
                  leading: DrawerButton(
                    style: IconButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.zero),
                        ),
                        fixedSize: const Size(60, 60)),
                    onPressed: changeScaffoldDrawer,
                  ),
                  bottom: const PreferredSize(
                    preferredSize: Size(double.infinity, 1),
                    child: ColoredBox(
                      color: AppColors.appBarDivider,
                      child: SizedBox(
                        height: 1,
                        width: double.infinity,
                      ),
                    ),
                  ),
                ),
              ];
            },
            body: child!,
          );
        },
        child: Scaffold(
          drawerScrimColor: Colors.blue.withOpacity(0.3),
          onDrawerChanged: changeDrawerValue,
          key: scaffoldKey,
          body: ValueListenableBuilder(
            valueListenable: isDrawerOpen,
            builder: (context, value, _) {
              return Stack(
                children: [
                  ListView.builder(
                    physics: value
                        ? const NeverScrollableScrollPhysics()
                        : const AlwaysScrollableScrollPhysics(),
                    itemCount: 100,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        height: 300,
                        child: ListTile(
                          title: Text("$index"),
                          tileColor: Colors.accents[index % 16],
                        ),
                      );
                    },
                  ),
                  value
                      ? BackdropFilter(
                          filter: ImageFilter.blur(sigmaY: 4, sigmaX: 4),
                          child: const SizedBox.expand(),
                        )
                      : const SizedBox.shrink(),
                ],
              );
            },
          ),
          drawer: const Drawer(
            width: 257,
            backgroundColor: AppColors.white,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            ),
          ),
          bottomNavigationBar: ValueListenableBuilder(
            valueListenable: selectedPage,
            builder: (context, value, _) {
              return BottomAppBar(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(5, (index) {
                    (String name, String imagePath) entry = homeEntries[index];
                    return GestureDetector(
                      onTap: () {
                        selectedPage.value = index;
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(
                            image: AssetImage(entry.$2),
                            width: 22.w,
                            height: 22.h,
                            color: value == index
                                ? AppColors.selectedIndicatorColor
                                : AppColors.notSelectedIndicatorColor,
                          ),
                          SizedBox(
                            height: 20.r,
                            child: FittedBox(
                              fit: BoxFit.fill,
                              child: Text(
                                entry.$1,
                                style: TextStyle(
                                  color: value == index
                                      ? AppColors.selectedIndicatorColor
                                      : AppColors.notSelectedIndicatorColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
