import 'package:flutter/material.dart';
import '../services/nfc.dart';
import '../services/storage.dart';

class Match extends StatefulWidget {
  @override
  _MatchState createState() => _MatchState();
}

class _MatchState extends State<Match> {
  String userColor = "";
  String detectedColor = "";

@override
void initState() {
  super.initState();
  
  getFavoriteColor().then((colorName) {
    setState(() {
      userColor = colorName;
    });

    startNFCWriting();
    startNFCReading();
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('NFC Match')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Jouw kleur: $userColor', style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            Text(
              'Gedetecteerde kleur: $detectedColor',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
