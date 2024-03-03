import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:speech_to_text/speech_to_text_provider.dart';
import 'package:shake/shake.dart';
import 'package:flutter_tts/flutter_tts.dart';


class Response {
  bool? success;
  String? message;

  Response({this.success, this.message});

  Response.fromJson(Map<String, dynamic> json) {
    success = json["success"];
    message = json["message"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["success"] = success;
    _data["message"] = message;
    return _data;
  }
}

class Student extends StatefulWidget {
  const Student({super.key});

  @override
  State<Student> createState() => _StudentState();
}

class _StudentState extends State<Student> {
  late ShakeDetector shake;
  String response="";
  FlutterTts flutterTts = FlutterTts();

  void speakData(String text) async {
    try {
      await flutterTts.speak(text);
    } catch (e) {
      print("Error in text-to-speech: $e");
    }
  }
  apicall() async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('POST', Uri.parse('https://hackthon-x9vu.onrender.com/api/chat'));
    request.body = json.encode({"message": "$textSpeech"});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      // Convert the response stream to a String and store it in a variable
      String responseBody = await utf8.decodeStream(response.stream);



      print(Response.fromJson(jsonDecode(responseBody)).message);
      return Response.fromJson(jsonDecode(responseBody)).message;
    } else {
      speakData("Sorry, I am unable to process your request at the moment. Please try again later.");
    }
  }

  @override
  void initState() {
    super.initState();

    shake = ShakeDetector.waitForStart(onPhoneShake: () {
      flutterTts.stop();
    });

    shake.startListening();
    speakData(" Top Left Button for the Assistant,      Top Right Button for Repeat,       Bottom Left Button for Braille Support,      Bottom Right Button for Support");
    Future.delayed(const Duration(seconds: 8), () {
     checkMic();
    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    shake.stopListening();
    flutterTts.stop();

  }
  var textSpeech = "CLICK ON MIC TO RECORD";
  SpeechToText speechToText = SpeechToText();
  var isListening = false;
  void checkMic() async{
    bool micAvailable = await speechToText.initialize();
    if(micAvailable){
      print("MicroPhone Available");
    }else{
      print("User Denied th use of speech micro");
    }


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children:[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

              children: [
                GestureDetector(
                  onTap: () async {
                    shake.startListening();
                    textSpeech = "";
                    if(!isListening){
                      bool micAvailable = await speechToText.initialize();
                      if(micAvailable){
                        setState(() {
                          isListening = true;
                        });
                        speechToText.listen(
                            listenFor: const Duration(seconds: 20),
                            onResult: (result){
                              setState(() {
                                textSpeech = result.recognizedWords;
                                isListening = false;
                              });
                            }
                        );
                      }
                    }else{
                      setState(() {
                        isListening = false;
                        speechToText.stop();
                      });
                    }
                   response="";
                    Future.delayed(const Duration(seconds: 7), () async {
                      response = await apicall();
                      speakData(response);
                    });
                  },
                  child: Container(
                    height: 160,
                    width: 160,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 3,
                          offset: const Offset(0, 3),
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: const Center(
                      child: Text(
                        'ASSISTANT',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: (){
                    speakData(response);
                  },
                  child: Container(
                    height: 160,
                    width: 160,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 3,
                          offset: const Offset(0, 3),
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: const Center(
                      child: Text(
                        "REPEAT",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
                height: 300,
                width: double.infinity,
                child: Center(
                  child: Text(
                    textSpeech,
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
            ),
            const Spacer(),

            const SizedBox(height: 40,),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    speakData("Please Connect the Bralie Device.");
                  },
                  child: Container(
                    height: 160,
                    width: 160,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 3,
                          offset: const Offset(0, 3),
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Text(
                            "BRALIE",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Center(
                          child: Text(
                            "SUPPORT",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                Container(
                  height: 160,
                  width: 160,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 3,
                        offset: const Offset(0, 3),
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: const Center(
                    child: Text(
                      "Complaints",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ]
        ),
      )

    );
  }
}
