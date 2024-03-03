import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:speech_to_text/speech_to_text.dart';

import '../Cognative/AdhdStudent.dart';
import 'Counsellor.dart';
import 'Student.dart';


class SignIn extends StatefulWidget {
  List<bool> isCheckedList ;
   SignIn({super.key, required this.isCheckedList});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String alltitle = "Continue as a Student   Continue as a Teacher   Continue as a Counsellor";
  String recognizedText = "";
  bool isListening = false;
  FlutterTts flutterTts = FlutterTts();
  void speakData(String text) async {
    try {
      await flutterTts.speak(text);
    } catch (e) {
      print("Error in text-to-speech: $e");
    }
  }
  SpeechToText speechToText = SpeechToText();
@override
  void initState() {
    super.initState();
    speakData(alltitle);
    Future.delayed(Duration(seconds: 5),() async {
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
                  print(recognizedText);
                  if(recognizedText.contains('student')){
                    if(widget.isCheckedList[0]==true) {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => Student()),);
                    }else{
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => HomePage(User: '',)),);
                    }}
                  if(recognizedText.contains('teacher')){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage(User: "Teacher",)),);

                  }
                  if(recognizedText.contains('counsellor')){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage(User: "Consellor")),);

                  }

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
      }    });

  }

  BottomSheet bottomSheet1(){
    return BottomSheet(
      onClosing: (){},
      builder: (context){
        return Container(
          height: 300,
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(height: 20,),
              Text(
                "As A Student",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.normal,
                ),
              ),
              SizedBox(height: 30,),
              Text(
                "You can Access all accessibility ",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
              ),

              Text(
                "Feature like screen reader",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
              ),
              Text(
                "type using voice & also interact the ",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
              ),
              Text(
                "app with motion Gesture.",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
  BottomSheet bottomSheet2(){
    return BottomSheet(
      onClosing: (){},
      builder: (context){
        return Container(
          height: 300,
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(height: 20,),
              Text(
                "As A Teacher",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.normal,
                ),
              ),
              SizedBox(height: 30,),
              Text(
                "you will get the information ",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
              ),

              Text(
                "about how to interact with ",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
              ),
              Text(
                "disabled students. also get ",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
              ),
              Text(
                "aware about the measures ",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
              ),
              Text(
                "to take.",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
  BottomSheet bottomSheet3(){
    return BottomSheet(
      onClosing: (){},
      builder: (context){
        return Container(
          height: 300,
          width: double.infinity,
          child: Column(
            children: [
              SizedBox(height: 20,),
              Text(
                "As A COUNSELLOR",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.normal,
                ),
              ),
              SizedBox(height: 30,),
              Text(
                "you will be responsible ",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
              ),

              Text(
                "for sharing measures, methods, ",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
              ),
              Text(
                "techniques and other resourses that",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
              ),
              Text(
                "could help in teaching and raising a ",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
              ),
              Text(
                "disabled child",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 60,
            left: 170,
            child: Image.asset(
              "assets/3d-business-young-women-students-smiling.png",
              width: 200,
              height: 300,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
              top: 450,
              left: 20,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: (){
                      if(widget.isCheckedList[0]==true) {
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => Student()),);
                      }else{
                        Navigator.push(context, MaterialPageRoute(
                            builder: (context) => HomePage(User: '',)),);
                      }
                    },
                    child: Container(

                      decoration: BoxDecoration(
                        color: Color(0xFFDA6A00),
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                          color: Color(0xFFDA6A00),
                          width: 2,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0, bottom: 8.0),
                        child: Text(
                          "Continue as a Student",
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  ),
                  IconButton(onPressed: (){
                    showModalBottomSheet(context: context, builder: (context){
                      return bottomSheet1();
                    });
                  }, icon: Icon(Icons.info,size: 34,), color: Colors.black)

                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage(User: "Teacher",)),);

                    },
                    child: Container(

                      decoration: BoxDecoration(
                        color: Color(0xFFDA6A00),
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                          color: Color(0xFFDA6A00),
                          width: 2,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0, bottom: 8.0),
                        child: Text(
                          "Continue as a Teacher",
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  ),
                  IconButton(onPressed: (){
                    showModalBottomSheet(context: context, builder: (context){
                      return bottomSheet2();
                    });
                  }, icon: Icon(Icons.info,size: 34,), color: Colors.black)

                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage(User: "Counsellor")),);
                    },
                    child: Container(

                      decoration: BoxDecoration(
                        color: Color(0xFFDA6A00),
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                          color: Color(0xFFDA6A00),
                          width: 2,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0, bottom: 8.0),
                        child: Text(
                          "Continue as a Counsellor",
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  ),
                  IconButton(onPressed: (){
                    showModalBottomSheet(context: context, builder: (context){
                      return bottomSheet3();
                    });
                  }, icon: Icon(Icons.info,size: 34,), color: Colors.black)

                ],
              ),
            ],
          )),


        ],
      ),
    );
  }
}
