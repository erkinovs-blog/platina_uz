enum AdType {
  main,
  right;

  static AdType? getByName(String value) {
    try {
      return AdType.values.firstWhere((e) => e.name == value);
    } catch (e) {
      return null;
    }
  }
}

class AdModel {
  int? id;
  String? name;
  String? image;
  String? imageRight;
  AdType? adType;
  String? link;
  bool? isActive;

  AdModel({
    this.id,
    this.name,
    this.image,
    this.imageRight,
    this.adType,
    this.link,
    this.isActive,
  });

  Map<String, Object?> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'image_right': imageRight,
      'ad_type': adType?.name,
      'link': link,
      'is_active': isActive,
    };
  }

  factory AdModel.fromJson(Map<String, Object?> json) {
    return AdModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      image: json['image'] as String?,
      imageRight: json['image_right'] as String?,
      adType: json['ad_type'] != null
          ? AdType.getByName(json['adType'] as String)
          : null,
      link: json['link'] as String?,
      isActive: json['is_active'] as bool?,
    );
  }
}
