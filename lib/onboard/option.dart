import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:hackthon/onboard/Student.dart';
import 'package:shake/shake.dart';
import 'SignI.dart';

class SignupPage extends StatefulWidget {
  SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  List<String> disabilityList = [
    '1) Visual Impairment',
    '2) Hearing Impairment',
    '3) Physical Impairment',
    '4) Cognitive/Intellectual',
    '5) Speech Impairment',
    '6) Chronic Health Condition'
  ];
  late ShakeDetector shake;
  FlutterTts flutterTts = FlutterTts();
  List<bool> isCheckedList = [false, false, false, false, false, false,];
  int count =0;
  void speakData(String text) async {
    try {
      await flutterTts.speak(text);
    } catch (e) {
      print("Error in text-to-speech: $e");
    }
  }

  initi() {
    speakData(
        "Share the type(s) of disability you are dealing with? (check all that apply). Double-tap the screen to select, and shake to skip this option.");
    Future.delayed(Duration(seconds: 8), () {
      if (mounted) {
        setState(() {
          speakData(disabilityList[0]);
        });
      }
      shake.startListening();
    });
  }

  @override
  void initState() {
    super.initState();
    shake = ShakeDetector.waitForStart(onPhoneShake: () {
      if (count < disabilityList.length) {
        setState(() {
          isCheckedList[count] = false; // Optionally uncheck the previous checkbox
          count++;
          speakData(disabilityList[count]);

        });
        if(count == disabilityList.length-1){
          speakData("Shake to repeat the options or doubletap to next");
        }
      } else {
        // Handle the case when all disabilities are spoken
        {
          initi();
          count=0;
        }
      }
    });
    initi();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    shake.stopListening();
  }

    @override
    Widget build(BuildContext context) {
      return GestureDetector(
        onDoubleTap: () {
          setState(() {

            if (count < disabilityList.length) {
              isCheckedList[count] = true;
              count++;
              speakData(disabilityList[count]);
              if(count-1 == disabilityList.length){
                speakData("Shake to repeat the options or doubletap to next");
              }
            }else{
              if(disabilityList[0]==true){

                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Student(),));
              }else {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) =>
                        SignIn(isCheckedList: isCheckedList,)));
              }
            }
          });
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back),
              tooltip: 'Back to Home Page',
            ),
            actions: [
              IconButton(
                onPressed: () {
                  // Add the logic for skipping here
                  flutterTts.stop();
                  if(disabilityList[0]==true){

                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Student(),));
                  }else {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) =>
                            SignIn(isCheckedList: isCheckedList,)));
                  }
                },

                icon: Padding(
                  padding: const EdgeInsets.only(left:8.0),
                  child: Text("Skip", style: TextStyle(fontSize: 20)),
                ),
                tooltip: 'Skip Option',
              ),
            ],
          ),

      body: Stack(
            children: [
              Positioned(
                top: 10,
                left: 170,
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage('assets/techny-customer-survey-form.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 80),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 40, 20),
                      child: Text(
                        "Share the type(s) of disability you are dealing with? (check all that apply)",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(disabilityList.length, (index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(disabilityList[index],
                                    style: TextStyle(fontSize: 20)),
                                Checkbox(
                                  value: isCheckedList[index],
                                  onChanged: (bool? value) {
                                    setState(() {
                                      isCheckedList[index] = value ?? false;
                                    });
                                  },
                                ),
                              ],
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                child: Container(
                  height: 50,
                  width: 160,
                  child: FloatingActionButton(
                    backgroundColor: Color(0xFFDA6A00),
                    onPressed: () {
                      if(disabilityList[0]==true){

                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Student(),));
                      }else {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) =>
                                SignIn(isCheckedList: isCheckedList,)));
                      }
                      },
                    child: Text(
                      "Next",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                top: 650,
                left: 120,
              )
            ],
          ),
        ),
      );
    }
  }
