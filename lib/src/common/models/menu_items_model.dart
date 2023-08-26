import 'package:flutter/material.dart';
import 'package:my_platina_uz/src/common/models/menu_item_model.dart';

class MenuItemsModel extends ValueNotifier {
  MenuItemsModel._() : super(0);

  factory MenuItemsModel() => _instance;
  static final MenuItemsModel _instance = MenuItemsModel._();

  static final List<MenuItemModel> items = [
    MenuItemModel(
      name: "Сиёсат",
      slug: "ozbekiston",
      color: "#2DA85B",
      order: 0,
      link: "/category/siyosat",
      language: "uz",
    ),
    MenuItemModel(
      name: "Иқтисод",
      slug: "iqtisod",
      color: "#A940FF",
      order: 1,
      link: "/category/iqtisod",
      language: "uz",
    ),
    MenuItemModel(
      name: "Жаҳон",
      slug: "jahon",
      color: "#003096",
      order: 2,
      link: "/category/jahon",
      language: "uz",
    ),
    MenuItemModel(
      name: "Жамият",
      slug: "jamiyat",
      color: "#FF7D25",
      order: 3,
      link: "/category/jamiyat",
      language: "uz",
    ),
    MenuItemModel(
      name: "Спорт",
      slug: "sport",
      color: "#E50029",
      order: 5,
      link: "/category/sport",
      language: "uz",
    ),
    MenuItemModel(
      name: "Давлат харидлари",
      slug: "davlat-xaridlari",
      color: "#6D01D8",
      order: 6,
      link: "/category/davlat-xaridlari",
      language: "uz",
    ),
    MenuItemModel(
      name: "Мақола",
      slug: "maqola",
      color: "#018AD8",
      order: 7,
      link: "/category/maqola",
      language: "uz",
    ),
  ];
}
