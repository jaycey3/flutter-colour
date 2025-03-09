import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveFavoriteColor(String colorName) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('favorite_color', colorName);
}

Future<String> getFavoriteColor() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('favorite_color') ?? "blue";
}