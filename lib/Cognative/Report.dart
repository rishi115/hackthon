import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart';

class Report extends StatefulWidget {
  const Report({super.key});

  @override
  State<Report> createState() => _ReportState();
}

class _ReportState extends State<Report> {
  bool isListening = false;
  SpeechToText speechToText = SpeechToText();
  String recognizedText = "";

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
      body:Column(
        children: [
          SizedBox(height: 200,),
          Center(child: Text("Report",style: TextStyle(
            fontSize: 50,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),)),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: TextEditingController()..text = recognizedText,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter your report',
              ),
            ),
          ),
          ElevatedButton(onPressed: () async {
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
          }, child: Padding(
            padding: const EdgeInsets.all(17.0),
            child: Icon(Icons.mic,size: 30,),
          ))
          ,
          SizedBox(height: 20,),
          ElevatedButton(onPressed: (){
            recognizedText = "";
           setState(() {

           });
            final snackBar = SnackBar(
              content: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Report Submitted Successfully!'),
              ),
              backgroundColor: Colors.red,
              duration: Duration(seconds: 1),
            );

            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }, child: Padding(
            padding: const EdgeInsets.all(17.0),
            child: Text("Submit",style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),),
          ))


        ],
      )

    );
  }
}
