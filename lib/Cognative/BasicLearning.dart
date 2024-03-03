import 'dart:ffi';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'CommonLaw.dart';
import 'English.dart';
import 'learninganimal.dart';

class BasicLearningPage extends StatefulWidget {

  const BasicLearningPage({super.key});

  @override
  State<BasicLearningPage> createState() => _BasicLearningPageState();
}

class _BasicLearningPageState extends State<BasicLearningPage> {

  @override
  void initState() {
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {

                      Navigator.push(context, MaterialPageRoute(builder: (context) =>  Animal(
                        imagelink: null,
                        audiolink: "dog-barking-70772.mp3", imageurl: 'https://tse4.mm.bing.net/th?id=OIP.ZdkhBEvMCpJUTTI_yFIzXQHaFj&pid=Api&P=0&h=180''', Description: 'Dogs, known scientifically as Canis lupus familiaris, are domesticated mammals that have been companions to humans for thousands of years. They come in various breeds, each with unique characteristics in terms of size, coat, and temperament.')));
                    },
                    child: Container(
                      width: 160,
                      height: 160,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Text("Animals",style: TextStyle(fontSize: 20),),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>  Animal(
                        imagelink: null,
                        audiolink: "water.mp3", imageurl: 'https://tse3.mm.bing.net/th?id=OIP.pG8CT-YSFDEQfCcmaQlsOgHaEo&pid=Api&P=0&h=180', Description: 'Water is a transparent, tasteless, odorless, and nearly colorless chemical substance, which is the main constituent of Earths hydrosphere and the fluids of all known living organisms. ',
                      )));
                    },
                    child: Container(
                      width: 160,
                      height: 160,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Text("Elements",style: TextStyle(fontSize: 20),),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>  Animal(
                        imagelink: null,
                        audiolink: "natural-thunder-113219.mp3", imageurl: 'https://tse4.mm.bing.net/th?id=OIP.EaUf4OLhW4M_PMf2zcVkZAHaHa&pid=Api&P=0&h=180', Description: "Thunder is the audible sound produced by lightning during a thunderstorm. It results from the rapid expansion and contraction of air surrounding a lightning bolt. The loudness of thunder is influenced by the distance from the lightning strike, atmospheric conditions, and topography.",
                      )));
                    },
                    child: Container(
                      width: 160,
                      height: 160,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Text("Precaution",style: TextStyle(fontSize: 20),),
                    ),
                  ),
                  Container(
                    width: 160,
                    height: 160,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Text("Food",style: TextStyle(fontSize: 20),),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 160,
                    height: 160,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Text("Mathematics",style: TextStyle(fontSize: 20),),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>  Laws()));

                    },
                    child: Container(
                      width: 160,
                      height: 160,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Text("Common Laws",style: TextStyle(fontSize: 20),),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>  DrawingBoard()));
                    },
                    child: Container(
                      width: 160,
                      height: 160,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Text("English",style: TextStyle(fontSize: 20),),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) =>  Animal(
                        imagelink: null,
                        audiolink: "train-railroad-traffic-sound-8002.mp3", imageurl: 'https://tse1.mm.bing.net/th?id=OIP.DQxKzUMSlwK_9Hb7XHngyAHaEo&pid=Api&P=0&h=180', Description: "Trains are a popular mode of transportation, utilizing railways for efficient and mass transit. They connect cities and regions, offering a convenient and often environmentally friendly travel option.",
                      )));                    },
                    child: Container(
                      width: 160,
                      height: 160,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Text("Vehicle",style: TextStyle(fontSize: 20),),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}