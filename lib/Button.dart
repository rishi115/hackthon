import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {


  const ButtonWidget({
    Key? key,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
    body:SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Container(
            height: 320,
            width: double.infinity,
            child: Image.network('https://user-images.githubusercontent.com/4436664/33346395-4f70d670-d4db-11e7-8bee-e4f3a44a8f28.png'),),

          Container(
            height:320,
            width: double.infinity,
            child: Image.network('https://tse1.mm.bing.net/th?id=OIP.ZV3T0V4nZNZo-ofCIPg2JQHaEP&pid=Api&P=0&h=180'),),
          Container(
            height:420,
            width: double.infinity,
            child: Image.network('https://tse3.mm.bing.net/th?id=OIP.tjcFZ22UVIN-Ks1tY9SojgHaGt&pid=Api&P=0&h=180',scale: 0.7,),),
        ],
      ),
    )
  );
}
