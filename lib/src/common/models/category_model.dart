class CategoryModel {
  int? id;
  String? name;
  String? slug;
  String? color;

  CategoryModel({
    this.id,
    this.name,
    this.slug,
    this.color,
  });

  Map<String, Object?> toJson() {
    return {
      'id': id,
      'name': name,
      'slug': slug,
      'color': color,
    };
  }

  factory CategoryModel.fromJson(Map<String, Object?> json) {
    return CategoryModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      slug: json['slug'] as String?,
      color: json['color'] as String?,
    );
  }
}
