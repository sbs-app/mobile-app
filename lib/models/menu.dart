class FoodModel {
  FoodModel({
    this.date,
    this.menuItems,
    this.images,
  });

  DateTime? date;
  List<String>? menuItems;
  List<String>? images;

  factory FoodModel.fromJson(Map<String, dynamic> json) => FoodModel(
        date: DateTime.parse(json["date"]),
        menuItems: List<String>.from(json["menu_items"].map((x) {
          return x == null ? "null" : x;
        })),
        images: List<String>.from(json["images"].map((x) {
          return x == null ? "null" : x;
        })),
      );

  Map<String, dynamic> toJson() => {
        "date":
            "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "menu_items": List<dynamic>.from(menuItems!.map((x) => x)),
        "images": List<dynamic>.from(images!.map((x) => x)),
      };
}
