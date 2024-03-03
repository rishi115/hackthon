import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class Animal extends StatefulWidget {
  String? imagelink ;
  String? audiolink ;
  String imageurl;
  String Description;
   Animal({super.key,  this.imagelink,  this.audiolink, required this.imageurl, required this.Description});

  @override
  State<Animal> createState() => _AnimalState();
}

class _AnimalState extends State<Animal> {
  FlutterTts flutterTts = FlutterTts();

  final player = AudioPlayer();
  AudioPlayer audioPlayer = AudioPlayer();
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
    playSound();
    Future.delayed(const Duration(seconds: 5), () async {
      await player.stop();
      speakData(widget.Description);

    });
  }
  @override
  void dispose() {
    player.stop();
    audioPlayer.dispose();

    super.dispose();

  }


  Future<void> playSound() async {
    String soundPath = widget.audiolink!; //You don't need to include assets/ because AssetSource assume that you have sound in your assets folder.
    await player.play(AssetSource(soundPath));
  }
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Learning Animal'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 20,),
              if(widget.imageurl != null) Container(
                height: 400,
                  width: 350,
                  child: Image.network(widget.imageurl,
                  fit: BoxFit.cover,)),
              if(widget.imagelink != null) Container(
      height: 400,
      width: 350,
      child: Image.asset(widget.imagelink!,
      fit: BoxFit.cover,)),
              SizedBox(height: 20,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      playSound();
                      Future.delayed(const Duration(seconds: 5), () async {
                        await player.stop();                      });
                    },
                    child: Container(
                        height: 50,
                        width: 100,
                        child: Center(child: Text('Play Sound'))),

                  ),

                  ElevatedButton(
                    onPressed: () async {
                    await   player.pause();

                    },
                    child: Container(
                        height: 50,
                        width: 100,
                        child: Center(child: Text('Pause Sound'))),

                  ),
                ],
              )
              ,
              SizedBox(height: 20,),

              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Container(

                    width: 350,
                    child: Center(child: Text(widget.Description, style: TextStyle(fontSize: 20),)),
                  ),
                ),
              ),
            ],
          ),
        )),
    );
  }
}
