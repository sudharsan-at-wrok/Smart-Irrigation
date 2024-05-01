import 'package:flutter/material.dart';
import 'package:iitm_app/src/features/voice_assistent.dart/voice_to_text.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class VoiceCommand extends StatefulWidget {
  const VoiceCommand({super.key});

  @override
  VoiceCommandState createState() => VoiceCommandState();
}

class VoiceCommandState extends State<VoiceCommand> {
  late stt.SpeechToText _speech;
  bool _isListening = false;
  String _text = '';

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Voice Navigation'),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(_text),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: _listen,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  color: Colors.blue,
                  child:
                      Text(_isListening ? 'Stop Listening' : 'Start Listening'),
                ),
              ),
            ]),
      ),
    );
  }

  Future<void> _listen() async {
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

        _speech.listen(
          onResult: (result) {
            setState(() {
              _text = result.recognizedWords.toLowerCase();
            });

            // Check for specific commands
            if (_text.contains('navigate to page 2')) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const VoiceToText()),
              );
            }
          },
        );
      }
    } else {
      setState(() {
        _isListening = false;
        _speech.stop();
      });
    }
  }
}

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        title: const Text('Page Two'),
      ),
      body: const Center(
        child: Text('This is Page Two'),
      ),
    );
  }
}
