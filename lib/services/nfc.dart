import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:nfc_manager/nfc_manager.dart';

void startNFCReading() async {
  try {
    bool isAvailable = await NfcManager.instance.isAvailable();

    if (isAvailable) {
      NfcManager.instance.startSession( 
        onDiscovered: (NfcTag tag) async {
          debugPrint('NFC Tag Detected: ${tag.data}');
        },
      );
    } else {
      debugPrint('NFC is not available (reading)');
    }
  } catch (e) {
    debugPrint('Error reading NFC: $e');}
}

void startNFCWriting() async {
  bool isAvailable = await NfcManager.instance.isAvailable();

  if (isAvailable) {
    NfcManager.instance.startSession(onDiscovered: (NfcTag tag) async {
      try {
        NdefMessage message = NdefMessage([NdefRecord.createText("Hello, NFC!")]);
        await Ndef.from(tag)?.write(message);
        debugPrint('Data emitted successfully');
        Uint8List payload = message.records.first.payload;
        String text = String.fromCharCodes(payload);
        debugPrint('Data read: $text');

        NfcManager.instance.stopSession();
      } catch (e) {
        debugPrint('Error writing NFC: $e');
      }
    });
  } else {
    debugPrint('NFC is not available (writing)');
  }
}
