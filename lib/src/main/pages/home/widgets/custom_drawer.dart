import 'package:flutter/material.dart';

import '../../../../common/constants/app_colors.dart';
import '../../../../common/constants/app_icons.dart';
import '../../../../common/models/menu_item_model.dart';
import '../../../../common/models/menu_items_model.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 257,
      backgroundColor: AppColors.white,
      elevation: 0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Flexible(
              child: ValueListenableBuilder(
                valueListenable: MenuItemsModel(),
                builder: (context, value, child) {
                  return ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemCount: MenuItemsModel.items.length,
                    itemBuilder: (context, index) {
                      MenuItemModel model =
                          MenuItemsModel.items.elementAt(index);
                      Color color =
                          Color(int.parse("0xFF${model.color.substring(1)}"));
                      return ListTile(
                        onTap: () {
                          MenuItemsModel().value = index;
                          Navigator.pop(context);
                        },
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                        tileColor: value == index
                            ? color.withOpacity(0.2)
                            : AppColors.transparent,
                        title: Text(
                          model.name,
                          style: TextStyle(
                            color: AppColors.selectedIndicatorColor,
                            fontSize: 17,
                            fontWeight: value == index
                                ? FontWeight.w700
                                : FontWeight.w500,
                          ),
                        ),
                        leading: Image(
                          image: const AssetImage(AppIcons.polygon),
                          height: 13,
                          fit: BoxFit.cover,
                          color: value == index
                              ? color
                              : AppColors.notSelectedIndicatorColor,
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 5);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
