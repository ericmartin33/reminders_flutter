import '../../common/widgets/category_icon.dart';

class Category {
  final String id;
  final String name;
  bool isChecked;
  final CategoryIcon icon;

  Category({
    required this.id,
    required this.name,
    this.isChecked = true,
    required this.icon,
  });

  toggleCheckBox() {
    isChecked = !isChecked;
    print(isChecked);
  }
}
