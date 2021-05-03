import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class TextToSpeech extends StatefulWidget {
  final List<dynamic> results;

  TextToSpeech(this.results);

  @override
  _TextToSpeechState createState() => _TextToSpeechState();
}

class _TextToSpeechState extends State<TextToSpeech> {

  final FlutterTts flutterTts = FlutterTts();
  bool speaking = false;
  
  Widget build(BuildContext context) {
    _speak(String text) async{
      print(await flutterTts.getLanguages);
      await flutterTts.setLanguage('en-US');
      await flutterTts.setPitch(1);
      await flutterTts.speak(text);
    }
    _stop() async {
      var result = await flutterTts.stop();
      if (result == 1) setState((){speaking = false;});
    }
    widget.results.forEach((r) {
      if (speaking == true) {
        _speak(r["detectedClass"]);
      }
    });

    return Align(
          alignment: Alignment.bottomCenter,
          child: ElevatedButton(
            child: Text((speaking)?"stop":"start"),
            style: ButtonStyle(
              backgroundColor: (speaking)?MaterialStateProperty.all<Color>(Colors.red[800]):MaterialStateProperty.all<Color>(Colors.blue[800]),
            ),
            onPressed: () {
              if (speaking == false){
                setState(() { speaking = true; });
              } else if(speaking == true) {
                setState(() { speaking = false; });
                _stop();
              }
            }),
    );
  }
}