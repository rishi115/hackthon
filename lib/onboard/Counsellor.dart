import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hackthon/Cognative/AdhdStudent.dart';

import '../../Button.dart';
import '../../Cognative/Teacher.dart';
import '../../Counsellor/Counsellor.dart';


class HomePage extends StatefulWidget {
  final String User;
  final int pageIndex;
  const HomePage({super.key, required this.User, this.pageIndex = 0});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late int _selectedIndex;

  late PageController _pageController;
  @override
  void initState() {
    // TODO: implement initState
    _selectedIndex = widget.pageIndex;
    _pageController = PageController(initialPage: widget.pageIndex);
    print("--------");
    print(_selectedIndex);
    super.initState();
  }
  GlobalKey<ConvexAppBarState> appBarKey = GlobalKey<ConvexAppBarState>();

  @override
  Widget build(BuildContext context) {
     List<Widget> _widgetOptions() {
      return [
        if(widget.User == "Counsellor")
            Counsellor(),
        if(widget.User == "Counsellor" || widget.User == "Teacher")
            Counsellor(),

        AdhdStudent(),
        Teacher(),
        ButtonWidget(),


      ];
    }
    return Scaffold(
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
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (index) {
          _selectedIndex = index;
        },
        children: _widgetOptions(),
      ),
      bottomNavigationBar: ConvexAppBar(
        key: appBarKey,
        height: 60,
        initialActiveIndex: widget.pageIndex,
        backgroundColor: Colors.white,
        items: [
          if(widget.User == "Counsellor")
            TabItem(
                activeIcon: Icon(
                  Icons.school,
                  color: Color(0xffDA6A00),
                  size: 50,
                ),
                icon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.school_outlined,
                    color: Color(0xffDA6A00),
                  ),
                ),
                title: 'Orders'),
          if(widget.User == "Counsellor" || widget.User == "Teacher")
              TabItem(
              activeIcon: Icon(
                Icons.book,
                color: Color(0xffDA6A00),
                size: 50,
              ),
              icon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.book_outlined,
                  color: Color(0xffDA6A00),
                ),
              ),
              title: 'Orders'),

          TabItem(
              activeIcon: Icon(
                Icons.face,
                color:Color(0xffDA6A00),
                size: 50,
              ),
              icon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.face_outlined,
                  color:Color(0xffDA6A00),
                ),
              ),
              title: 'Orders'),
          TabItem(
              activeIcon: Icon(
                Icons.person,
                color:Color(0xffDA6A00),
                size: 50,
              ),
              icon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.person_outlined,
                  color: Color(0xffDA6A00),
                ),
              ),
              title: 'Orders'),
          TabItem(
              activeIcon: Icon(
                Icons.analytics,
                color:Color(0xffDA6A00),
                size: 50,
              ),
              icon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.analytics_outlined,
                  color:Color(0xffDA6A00),
                ),
              ),
              title: 'Orders'),

        ],
        onTap: (index) {
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeIn,
          );
        },
      ),
    );
  }
}
