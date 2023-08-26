import 'package:flutter/material.dart';

import '../../../../common/constants/app_colors.dart';
import '../../../../common/constants/app_icons.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({
    required this.changeScaffoldDrawer,
    super.key,
  });

  final void Function() changeScaffoldDrawer;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: AppColors.white,
      elevation: 0,
      toolbarHeight: 60,
      title: const Image(
        image: AssetImage(AppIcons.logo),
        height: 35,
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
    );
  }
}
