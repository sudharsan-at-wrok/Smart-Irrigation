// import 'package:flutter/material.dart';
// import 'package:speech_to_text/speech_to_text.dart' as stt;

// class VoiceToText extends StatefulWidget {
//   const VoiceToText({super.key});

//   @override
//   _VoiceToTextState createState() => _VoiceToTextState();
// }

// class _VoiceToTextState extends State<VoiceToText> {
//   final stt.SpeechToText _speech = stt.SpeechToText();
//   bool _isListening = false;
//   final TextEditingController _textEditingController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             TextField(
//               controller: _textEditingController,
//               decoration: const InputDecoration(
//                 hintText: 'Speak here...',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             const SizedBox(height: 20),
//             GestureDetector(
//               onTap: _listen,
//               child: Container(
//                 padding:
//                     const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//                 color: Colors.blue,
//                 child: Text(
//                   _isListening ? 'Listening...' : 'Listen',
//                   style: const TextStyle(color: Colors.white),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void _listen() async {
//     if (!_isListening) {
//       bool available = await _speech.initialize(
//         onStatus: (status) {
//           print('status: $status');
//         },
//         onError: (error) {
//           print('error: $error');
//         },
//       );

//       if (available) {
//         setState(() {
//           _isListening = true;
//         });

//         _speech.listen(
//           onResult: (result) {
//             setState(() {
//               _textEditingController.text = result.recognizedWords;
//             });
//           },
//           cancelOnError: true,
//           localeId: 'ta_IN',
//         );
//       }
//     } else {
//       setState(() {
//         _isListening = false;
//         _speech.stop();
//       });
//     }
//   }
// }


import 'dart:async';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class VoiceToText extends StatefulWidget {
  const VoiceToText({Key? key}) : super(key: key);

  @override
  _VoiceToTextState createState() => _VoiceToTextState();
}

class _VoiceToTextState extends State<VoiceToText> {
  final stt.SpeechToText _speech = stt.SpeechToText();
  bool _isListening = false;
  final TextEditingController _textEditingController = TextEditingController();
  Timer? _timer;

  @override
  void dispose() {
    _timer?.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _textEditingController,
              decoration: const InputDecoration(
                hintText: 'Speak here...',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: _listen,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                color: Colors.blue,
                child: Text(
                  _isListening ? 'Listening...' : 'Listen',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _listen() async {
    if (!_isListening) {
      bool available = await _speech.initialize(
        onStatus: (status) {
          print('status: $status');
        },
        onError: (error) {
          print('error: $error');
        },
      );

      if (available) {
        setState(() {
          _isListening = true;
        });

        _timer = Timer(Duration(seconds: 5), () {
          if (_isListening) {
            setState(() {
              _isListening = false;
              _speech.stop();
            });
          }
        });

        _speech.listen(
          onResult: (result) {
            setState(() {
              _textEditingController.text = result.recognizedWords;
            });
          },
          cancelOnError: true,
          localeId: 'ta_IN',
        );
      }
    } else {
      setState(() {
        _isListening = false;
        _timer?.cancel(); // Cancel the timer if listening is stopped manually
        _speech.stop();
      });
    }
  }
}
