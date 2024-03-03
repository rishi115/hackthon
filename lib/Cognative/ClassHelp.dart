import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart';


class ClassHelp extends StatefulWidget {
  const ClassHelp({super.key});

  @override
  State<ClassHelp> createState() => _ClassHelpState();
}

class _ClassHelpState extends State<ClassHelp> {

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
      appBar: AppBar(
        title: Text("Class Help",style: TextStyle(fontSize: 25),),
      ),
      body: Column(
        children: [
          SizedBox(height: 50,),
          Expanded(child: Container(
              width:360,child: Text(textSpeech,style: TextStyle(fontSize: 25),))),
Spacer(),
        Center(
          child: GestureDetector(
            onTap: () async {
              textSpeech = "";
              if(!isListening){
                bool micAvailable = await speechToText.initialize();
                if(micAvailable){
                  setState(() {
                    isListening = true;
                  });
                  speechToText.listen(
                    cancelOnError: false,
                      listenFor: const Duration(hours: 1),
                      onResult: (result){
                        setState(() {
                          textSpeech = result.recognizedWords;
                          isListening = false;
                        });
                      }
                  );
                }
              }
            },
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(50)
                ),
                height: 100,
                width: 100,
                child: Icon(Icons.mic,size: 30,)
            ),
          ),
        ),
          const SizedBox(height: 50,),
      ]
      ),
    );
  }
}
