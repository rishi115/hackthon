import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class CommonLaw extends StatefulWidget {


  String imageurl;
  String Description;
  CommonLaw({super.key, required this.imageurl, required this.Description});

  @override
  State<CommonLaw> createState() => _CommonLawState();
}

class _CommonLawState extends State<CommonLaw> {
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
    speakData(widget.Description);
  }
  @override
  void dispose() {
    player.stop();
    audioPlayer.dispose();

    super.dispose();

  }


  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      child: Scaffold(
          appBar: AppBar(
            title: Text('Learning CommonLaw'),
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
                    child: Image.asset(widget.imageurl,
                      fit: BoxFit.cover,))
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

class Laws extends StatefulWidget {
  const Laws({super.key});

  @override
  State<Laws> createState() => _LawsState();
}

class _LawsState extends State<Laws> {
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
      child: PageView(
      controller: _controller,
      children:  [
        // page_1
        CommonLaw(imageurl: 'assets/signals.jpg', Description: "Signal signs on roads serve various purposes: regulatory signs indicate rules (stop, yield), warning signs warn about hazards (curve ahead, pedestrian crossing), guide signs provide directions (route markers, exits), informational signs offer additional details (services, recreational areas), and construction signs convey work-related information for driver safety",),

        // page_2
        CommonLaw(imageurl: 'assets/zebra crossing.jpg', Description: "A zebra crossing is a marked pedestrian crossing on roads, identified by white stripes painted across the asphalt. It provides a designated area for pedestrians to cross safely. Zebra crossings often include black and white poles with flashing lights to enhance visibility. Vehicles are legally required to yield to pedestrians on zebra crossings, prioritizing pedestrian safety",),

        // page_3
        CommonLaw(imageurl: 'assets/good touch and bad touch.jpg', Description: "Good touch, bad touch is an educational concept emphasizing appropriate and inappropriate physical contact. It teaches children to recognize positive, comforting touches (like hugs from family) and understand uncomfortable or inappropriate touches (such as those violating personal boundaries). This awareness helps children differentiate between acceptable and potentially harmful interactions, fostering their safety and well-being",),
      ],
    ),
    ),
    );
  }
}
