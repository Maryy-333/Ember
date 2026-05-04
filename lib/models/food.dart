// ignore_for_file: unused_element

class Food {
  String name;
  String imagePath;
  String price;
  String rating;
  String description;

  Food({
    required this.name,
    required this.imagePath,
    required this.price,
    required this.rating,
    required this.description,
  });

  String get _name => name;
  String get _price => price;
  String get _imagePath => imagePath;
  String get _rating => rating;
  String get _description => description;
}
