// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import '../services/storage.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

String getColorName(Color color) {
  Map<Color, String> colorNames = {
    Colors.red: "Rood",
    Colors.green: "Groen",
    Colors.blue: "Blauw",
    Colors.yellow: "Geel",
  };
  return colorNames[color] ?? "unknown";
}

Color getColorFromName(String name) {
  Map<String, Color> colorMap = {
    "Rood": Colors.red,
    "Groen": Colors.green,
    "Blauw": Colors.blue,
    "Geel": Colors.yellow,
  };
  return colorMap[name] ?? Colors.blue;
}

class _HomeState extends State<Home> {
  Color selectedColor = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Kies je favoriete kleur')),
      body: Column(
        children: [
          Expanded(
            child: GridView.count(
              crossAxisCount: 4,
              children:
                  [Colors.red, Colors.green, Colors.blue, Colors.yellow]
                      .map(
                        (color) => GestureDetector(
                          onTap: () {
                            String colorName = getColorName(color); 
                            setState(() => selectedColor = color);
                            saveFavoriteColor(colorName);
                          },
                          child: Container(
                            color: color,
                            margin: EdgeInsets.all(5),
                          ),
                        ),
                      )
                      .toList(),
            ),
          ),
          ElevatedButton(
            style: ButtonStyle(
              // ignore: deprecated_member_use
              backgroundColor: MaterialStateProperty.all(selectedColor),
            ),
            onPressed: () {
              saveFavoriteColor(getColorName(selectedColor));
              Navigator.pushNamed(context, '/match');
            },
            child: Text(
              'MATCH',
              style: TextStyle(color: Colors.black),),
          ),
          SizedBox(height: 60)
        ],
      ),
    );
  }
}
