// Package
import 'package:flutter/material.dart';

// Widget
import 'package:frontend/Screens/Widgets/Home/home_widgets.dart';

// Controller
import 'package:frontend/Controller/attendance.dart';

//Component
import 'package:frontend/Components/bottom_nav.dart';

class Home extends StatefulWidget {
  final AttendanceController controller;
  Home(this.controller);
  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {

  @override
  void initState(){
    super.initState();
    widget.controller.init().then((_){
      setState(() {});
    });
  }

  void _handleTap() async {
    await widget.controller.AttendanceState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Center(
            child: Column(
              children: [
                // Title
                SizedBox(height: 100,),
                HomeWidgets.inHostelTitle(context, widget.controller),

                // Attendance Button
                SizedBox(height: 100,),
                HomeWidgets.attendanceButton(context,_handleTap,widget.controller),

                SizedBox(height: 50,),
                HomeWidgets.attendShowButton(context,widget.controller),

              ],
            ),
          )
        ) 
      ),
              // Bottom Bar
              bottomNavigationBar: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Nav(context, 0, widget.controller),
              )
    );
  }
}