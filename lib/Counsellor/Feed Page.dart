import 'package:flutter/material.dart';

import 'AddPost.dart';

class NetworkScreen extends StatefulWidget {
  const NetworkScreen({Key? key}) : super(key: key);

  @override
  _NetworkScreenState createState() => _NetworkScreenState();

}

class _NetworkScreenState extends State<NetworkScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xffDA6A00),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddPost()),
          );
        },
        child: Container(
            child: const Icon(Icons.add)),
      ),
      appBar: AppBar(
        title: Text("Counsellor"),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Image.asset('assets/icons8-student-48.png'),
          tooltip: 'Back to Home Page',
        ),
      ),
      body: Container(
        color: Colors.white,
        child: ListView(
          controller: _scrollController,
          children: [
            SizedBox(height: 8),
            Row(
              children: [
                SizedBox(width: 30),
                Expanded(
                  child: Container(
                    height: 45,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 0.5),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Icon(Icons.search, color: Colors.grey),
                        ),
                        Expanded(
                          child: TextFormField(
                            style: TextStyle(fontSize: 15),
                            decoration: InputDecoration(
                              hintText: 'Search',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 13),
                IconButton(
                  icon: Icon(Icons.settings),
                  onPressed: () {

                  },
                ),
                SizedBox(width: 14),
              ],
            ),

            UserProfileWidget(
              name: 'Rishikesh ',
              status: 'Navi Mumbai',
              aboutText: 'HI Community i am new to netclan.',
              profileImageUrl: 'https://images.unsplash.com/photo-1529665253569-6d01c0eaf7b6?ixid=MXwxMjA3fDB8MHxzZWFyY2h8M3x8cHJvZmlsZXxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&w=1000&q=80',
            ),


            UserProfileWidget(
              name: 'John Doe',
              status: 'Online',
              aboutText: 'I am a software engineer with a passion for coding.',
              profileImageUrl: 'https://images.unsplash.com/photo-1529665253569-6d01c0eaf7b6?ixid=MXwxMjA3fDB8MHxzZWFyY2h8M3x8cHJvZmlsZXxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&w=1000&q=80',
            ),
            UserProfileWidget(
              name: 'John Doe',
              status: 'Online',
              aboutText: 'I am a software engineer with a passion for coding.',
              profileImageUrl: 'https://images.unsplash.com/photo-1529665253569-6d01c0eaf7b6?ixid=MXwxMjA3fDB8MHxzZWFyY2h8M3x8cHJvZmlsZXxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&w=1000&q=80',
            ),


          ],
        ),
      ),
    );
  }
}

class UserProfileWidget extends StatelessWidget {
  final String name;
  final String status;
  final String aboutText;
  final String profileImageUrl;

  const UserProfileWidget({
    required this.name,
    required this.status,
    required this.aboutText,
    required this.profileImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 3,
              offset: Offset(0, 3),
            ),
          ],
          border: Border.all(color: Colors.white, width: 0.5),
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.topRight,
            colors: [
              Colors.white,
            ],
            stops: [0.0],
          ),
        ),
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 100,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                      image: Image.asset('assets/3d-business-woman-and-little-girl-drawing-together.png').image,
                      fit: BoxFit.fill,
                    ),
                  ),),
                SizedBox(width: 30),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "A Better Approach",
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    ),
                    Text(
                      "For Teaching ",
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    ),
                    Text(
                      "a Alphabets to Blinds",
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "MAR 2",
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}



class HorizontalTubeWidget extends StatelessWidget {
  final double fillPercentage;
  final Color fillColor;

  const HorizontalTubeWidget({
    Key? key,
    required this.fillPercentage,
    required this.fillColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: 4,
      child: Container(
        width: 80,
        height: 12,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: FractionallySizedBox(
                heightFactor: 1,
                widthFactor: fillPercentage / 100,
                child: Container(
                  color: fillColor,
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                '${fillPercentage.round()}km',
                style: TextStyle(
                  fontSize: 8,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

