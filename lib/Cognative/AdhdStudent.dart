import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:speech_to_text/speech_to_text.dart';

import 'BasicLearning.dart';
import 'Chathelp.dart';
import 'ClassHelp.dart';
import 'Reading.dart';

class AdhdStudent extends StatefulWidget {
  const AdhdStudent({super.key});

  @override
  State<AdhdStudent> createState() => _AdhdStudentState();
}

class _AdhdStudentState extends State<AdhdStudent> {
  String valuesToSpeak =
      '80 Points Complete the task to get the Points Basic Learning Reading Assistant Class Help';
  String texttospeech='';
  String recognizedText = "";
  bool isListening = false;
  SpeechToText speechToText = SpeechToText();
  FlutterTts flutterTts = FlutterTts();
  void speakData(String text) async {
    try {
      await flutterTts.speak(text);
    } catch (e) {
      print("Error in text-to-speech: $e");
    }
  }
  void checkMic() async{
    bool micAvailable = await speechToText.initialize();
    if(micAvailable){
      print("MicroPhone Available");
    }else{
      print("User Denied th use of speech micro");
    }


  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    speakData(valuesToSpeak);
    Future.delayed(Duration(seconds: 6), () {

      speakData("Speech to Command Enabled");
    });
    Future.delayed(Duration(seconds: 8), () async {
      if(!isListening){
        bool micAvailable = await speechToText.initialize();
        if(micAvailable){
          setState(() {
            isListening = true;
          });
          speechToText.listen(
              listenFor: Duration(seconds: 20),
              onResult: (result){
                setState(() {
                  recognizedText = result.recognizedWords;
                  if(recognizedText == "basic learning"){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>BasicLearningPage()));}
                  if(recognizedText == "reading"){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SpeechToTextExample()));}
                  if(recognizedText == "assistant"){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatScreen()));}
                  if(recognizedText == "class help"){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ClassHelp()));}
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
    });
  }
  void DailogBox(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Text to Speech"),
            content: TextField(
              decoration: InputDecoration(hintText: "Enter the text"),
              onChanged: (String text) {
                texttospeech = text;
              },
            ),
            actions: [
              TextButton(
                onPressed: () {
speakData(texttospeech);
                },
                child: Text("Speech"),
              ),
            ],
          );
        });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          DailogBox(context);
        },
        child: Icon(Icons.volume_up),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left:40.0),        child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,

                children: [
                Center(
                  child: Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/casual-life-3d-gold-trophy-1.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                  Center(
                    child: Container(
                      height: 40,
                      width: 50,
                      child: Text("80",style: TextStyle(fontSize: 30),),
                    ),
                  ),
                  Center(
                    child: Container(
                      height: 30,
                      width: 100,
                      child: Text("POINTS",style: TextStyle(fontSize: 20,color: Colors.grey),),
                    ),
                  ),
                  Center(
                    child: Container(
                      height: 30,
                      width: 300,
                      child: Text("Complete task to get the Points",style: TextStyle(fontSize: 20,color: Colors.grey),),
                    ),
                  ),

              ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>BasicLearningPage()));
                        },
                        child: Container(
                          height: 160,
                          width: 160,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.orange.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 3,
                                offset: Offset(0, 3),
                              ),
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: Text(
                                  "Basic",
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Center(
                                child: Text(
                                  "Learning",
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 20,),
                      GestureDetector(
                        onTap: (){
                         Navigator.push(context, MaterialPageRoute(builder: (context)=>SpeechToTextExample()));
                        },
                        child: Container(
                          height: 160,
                          width: 160,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.orange.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 3,
                                offset: Offset(0, 3),
                              ),
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: Center(
                            child: Text(
                              "Reading",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>ChatScreen()));
                        },
                        child: Container(
                          height: 160,
                          width: 160,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.orange.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 3,
                                offset: Offset(0, 3),
                              ),
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: Center(
                            child: Text(
                              "Assistant",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 20,),

                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>ClassHelp()));
                        },
                        child: Container(
                          height: 160,
                          width: 160,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.orange.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 3,
                                offset: Offset(0, 3),
                              ),
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: Center(
                            child: Text(
                              "Class Help",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
