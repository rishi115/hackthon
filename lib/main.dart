import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'onboard/SignI.dart';
import 'onboard/option.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var textSpeech = "CLICK ON MIC TO RECORD";
  SpeechToText speechToText = SpeechToText();
  var isListening = false;
  FlutterTts flutterTts = FlutterTts();

  void speakData(String text) async {
    try {
      await flutterTts.speak(text);
    } catch (e) {
      print("Error in text-to-speech: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 4), () {
      speakData("Learning made for Everyone. A Quick Tour of the Application");
      _controller.nextPage(
          duration: Duration(milliseconds: 500), curve: Curves.linear);
    });
    Future.delayed(Duration(seconds: 8), () {
      speakData("Motion Gestures, Enhanced Interface, Speech to Text, Text to Speech, Tailored Approach");
      _controller.nextPage(
          duration: Duration(milliseconds: 500), curve: Curves.linear);
    });
    Future.delayed(Duration(seconds: 12), () {
      speakData("Community Guidance, Ask Experts, Learn to Teach, Guides and Educational Content");
      _controller.nextPage(
          duration: Duration(milliseconds: 500), curve: Curves.linear);
    });
    Future.delayed(Duration(seconds: 20), () {
      if (_controller.page == 2) {
        Navigator.push(context, MaterialPageRoute(builder: (context) => SignupPage()));
      }
    });
  }
  final PageController _controller = PageController();


  Widget MyPage1(){

    return Scaffold(
        body:Stack(
          children: [
            Positioned(child: Container(

              height: 250,
              width: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage('assets/casual-life-3d-girl-sleeping-on-books-with-hands-folded.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ), top: 200, left: 100,),
            Positioned(child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text("Learning made for", style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),),

                ),
                Container(
                  child: Text("Everyone", style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),),

                ),
              ],
            ),
              top: 430,left: 20,
            ),
            Positioned(child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text("A Quick Tour of the", style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),),

                ),
                Container(
                  child: Text("Application", style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),),

                ),
              ],
            ),
              top: 560,left: 30,
            ),
            Positioned(
              child: Container(
                height: 50,
                width: 160,
                child: FloatingActionButton(
                  backgroundColor: Color(0xFFDA6A00),
                  onPressed: (){
                    _controller.nextPage(
                        duration: Duration(milliseconds: 500), curve: Curves.linear);
                    if (_controller.page == 2) {

                    }
                  },
                  child: Text("Next", style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),),
                ),
              )
              ,
              top: 680,left: 30,
            )
            ,],
        )
    );
  }
  Widget MyPage2(){

    return Scaffold(
        body:Stack(
          children: [
            Positioned(child: Container(

              height: 250,
              width: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage('assets/silky-accessibility-features.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ), top: 70, left: 70,),
            Positioned(child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text("* MOTION GESTURES", style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),),

                ),
                SizedBox(height: 10,),
                Container(
                  child: Text("* ENHANCED INTERFACE", style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),),

                ),
                SizedBox(height: 10,),
                Container(
                  child: Text("* SPEECH TO TEXT", style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),),

                ),
                SizedBox(height: 10,),
                Container(
                  child: Text("* TEXT TO SPEECH", style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),),

                ),
                SizedBox(height: 10,),
                Container(
                  child: Text("* TAILORED APPROACH", style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),),

                ),
              ],
            ),
              top: 460,left: 50,
            ),
            Positioned(child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text("CHOOSE THE DISABILITY", style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),),

                ),
                Container(
                  child: Text("AND EASE THE LEARING ", style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),),

                ),Container(
                  child: Text("JOURNEY", style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),),

                ),

              ],
            ),
              top: 320,left: 20,
            ),

            Positioned(
              child: Container(
                height: 50,
                width: 160,
                child: FloatingActionButton(
                  backgroundColor: Color(0xFFDA6A00),
                  onPressed: (){
                    _controller.nextPage(
                        duration: Duration(milliseconds: 500), curve: Curves.linear);
                    if (_controller.page == 2) {

                    }
                  },
                  child: Text("Next", style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),),
                ),
              )
              ,
              top: 680,left: 30,
            )
            ,],
        )
    );
  }
  Widget MyPage3(){
    return Scaffold(
        body:Stack(
          children: [
            Positioned(child: Container(

              height: 280,
              width: 420,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage('assets/3d-business-woman-and-little-girl-drawing-together.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ), top: 40, left: 10,),
            Positioned(child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text("* COMMUNITY GUIDANCE", style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),),
                ),
                SizedBox(height: 10,),
                Container(
                  child: Text("* ASK EXPERTS", style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),),

                ),
                SizedBox(height: 10,),
                Container(
                  child: Text("* LEARN TO TEACH", style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),),

                ),
                SizedBox(height: 10,),
                Container(
                  child: Text("* GUIDES AND EDUCATIONAL", style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),),

                ),
                SizedBox(height: 10,),
                Container(
                  child: Text(" CONTENT", style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),),

                ),
              ],
            ),
              top: 460,left: 50,
            ),
            Positioned(child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text("CHOOSE THE DISABILITY", style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),),

                ),
                Container(
                  child: Text("AND EASE THE LEARING ", style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),),

                ),Container(
                  child: Text("JOURNEY", style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),),

                ),

              ],
            ),
              top: 320,left: 20,
            ),

            Positioned(
              child: Container(
                height: 50,
                width: 160,
                child: FloatingActionButton(
                  backgroundColor: Color(0xFFDA6A00),
                  onPressed: (){
                    _controller.nextPage(
                        duration: Duration(milliseconds: 500), curve: Curves.linear);
                    if (_controller.page == 2) {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SignupPage()));
                    }
                  },
                  child: Text("Next", style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    color: Colors.white,
                  ),),
                ),
              )
              ,
              top: 680,left: 30,
            )
            ,],
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: null,
        child: SafeArea(
          child: PageView(
            controller: _controller,
            children:  [
              // page_1
              MyPage1(),

              // page_2
              MyPage2(),

              // page_3
              MyPage3(),
            ],
          ),
        ),
      ),
    );
  }
}




