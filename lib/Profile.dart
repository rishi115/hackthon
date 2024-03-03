import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child:  const Column(
          children: [
            SizedBox(height: 40,),
            Center(
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage('https://tse1.mm.bing.net/th?id=OIP.GHGGLYe7gDfZUzF_tElxiQHaHa&pid=Api&rs=1&c=1&qlt=95&w=118&h=118'),
                    ),
                    SizedBox(height: 30,),
                    Text("Raj Padval",
                        style:
                        TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
            SizedBox(height: 40,),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 8, 20, 8),
              child: Column(

                children: [
                  Text("PROFESSION",
                      style: TextStyle(
                          fontSize: 25, fontWeight: FontWeight.bold)),
                  Text('PHYSICIAN',style: TextStyle(fontSize: 20),),
                  Text("LOCATION",
                      style: TextStyle(
                          fontSize: 25, fontWeight: FontWeight.bold)),
                  Text('MUMBAI, MAHARASHTRA',style: TextStyle(fontSize: 20),),
                  Text("VERIFIED",
                      style: TextStyle(
                          fontSize: 25, fontWeight: FontWeight.bold)),
                  Text('YES',style: TextStyle(fontSize: 20),),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}