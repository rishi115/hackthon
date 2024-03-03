import 'dart:math';

import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart';

class SpeechToTextExample extends StatefulWidget {
  @override
  _SpeechToTextExampleState createState() => _SpeechToTextExampleState();
}

class _SpeechToTextExampleState extends State<SpeechToTextExample> {
  SpeechToText speech = SpeechToText();
  String displayedParagraph =
      " In the kingdom of Eldoria, King Alexander ruled with wisdom and kindness. His people admired him for his fairness and compassion. One day, a humble farmer named Thomas proposed an idea to improve the lives of villagers. The king not only listened but implemented the suggestion, bringing positive change to the kingdom. King Alexanders reign became a legendary era of peace and unity, and his people cherished him for his wise and just rule.";
  String recognizedText = "";
  bool isListening = false;

  @override
  void initState() {
    super.initState();

  }

  void initSpeech() async {
    bool available = await speech.initialize();
    if (available) {
      speech.listen(
        onResult: (result) {
          setState(() {
            recognizedText = result.recognizedWords;
          });
        },
        listenFor: Duration(seconds: 60), // Adjust duration as needed
      );
      setState(() {
        isListening = true;
      });
    }
  }
  double accuracy = 0.0;

  @override
  void dispose() {
    speech.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Speech-to-Text Accuracy Test'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                displayedParagraph,
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  recognizedText = "";
                  initSpeech();
                  // Display accuracy or perform further actions based on recognizedText
                Future.delayed(Duration(seconds: 30), () {
                  setState(() {
                    accuracy = calculateAccuracy();
                    isListening = false;
                  });
                });
                },
                child: Text('Check Accuracy'),
              ),
              SizedBox(height: 20),
              Text(
                'Recognized Text: $recognizedText',
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(height: 20),
              Text(
                'Accuracy: ${accuracy.toStringAsFixed(2)}%',
                style: TextStyle(fontSize: 18.0),
              )
            ],
          ),
        ),
      ),
    );
  }

  double calculateAccuracy() {
    // Implement your logic to compare recognizedText with displayedParagraph
    double accuracy = calculateLevenshteinDistance(
        displayedParagraph.toLowerCase(), recognizedText.toLowerCase());
    print('Accuracy: ${(1 - accuracy) * 100}%');
    return (1 - accuracy) * 100;
  }

  // Function to calculate Levenshtein distance (edit distance)
  double calculateLevenshteinDistance(String a, String b) {
    int n = a.length;
    int m = b.length;
    List<List<int>> dp = List.generate(n + 1, (index) => List.filled(m + 1, 0));

    for (int i = 0; i <= n; i++) {
      for (int j = 0; j <= m; j++) {
        if (i == 0) {
          dp[i][j] = j;
        } else if (j == 0) {
          dp[i][j] = i;
        } else {
          dp[i][j] = min(
            dp[i - 1][j] + 1,
            min(dp[i][j - 1] + 1, dp[i - 1][j - 1] + (a[i - 1] == b[j - 1] ? 0 : 1)),
          );
        }
      }
    }

    return dp[n][m] / max(n, m);
  }
}
