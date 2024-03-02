import 'package:flutter/material.dart';
import 'package:hackthon/pageslider.dart';
import 'package:speech_to_text/speech_to_text.dart';

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

  void checkMic() async{
    bool micAvailable = await speechToText.initialize();

    if(micAvailable){
      print("MicroPhone Available");
    }else{
      print("User Denied th use of speech micro");
    }
  }
  final PageController _controller = PageController();

  Widget MyPage(){
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
              top: 600,left: 20,
            ),
            Positioned(
              child: Container(
                height: 60,
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
              top: 600,left: 30,
            )
            ,],
        )
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkMic();

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
              MyPage(),

              // page_2
              MyPage(),

              // page_3
              MyPage(),
            ],
          ),
        ),
      ),
    );
  }
}




