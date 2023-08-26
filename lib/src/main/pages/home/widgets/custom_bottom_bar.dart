import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/constants/app_colors.dart';

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({
    super.key,
    required this.selectedPage,
    required this.homeEntries,
    required this.isDrawerOpen,
  });

  final ValueNotifier<int> selectedPage;
  final List<(String, String)> homeEntries;
  final ValueNotifier<bool> isDrawerOpen;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selectedPage,
      builder: (context, value, child) {
        return Stack(
          alignment: Alignment.bottomCenter,
          children: [
            SizedBox(
              width: double.infinity,
              height: 70,
              child: BottomAppBar(
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
              ),
            ),
            child!,
          ],
        );
      },
      child: ValueListenableBuilder(
        valueListenable: isDrawerOpen,
        builder: (context, value, child) {
          return value
              ? BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                  child: const SizedBox(
                    height: 70,
                    width: double.infinity,
                  ),
                )
              : const SizedBox.shrink();
        },
      ),
    );
  }
}
