// Packages
import 'package:flutter/material.dart';
import 'package:frontend/Controller/attendance.dart';
import 'package:frontend/Controller/meal.dart';
import 'package:intl/intl.dart';

// import 'package:flutter_svg/flutter_svg.dart';

// Components
import 'package:frontend/Components/togglehostel.dart';
import 'package:frontend/Components/bottom_nav.dart';
import 'package:frontend/Components/circle_paint.dart';

// Models
import 'package:frontend/Models/meal.dart';

// Themes
import 'package:frontend/Constants/colors.dart';

//Widgets
import 'package:frontend/Screens/Widgets/Dashboard/dashboard_widget.dart';



class MealPlannerDashboard extends StatefulWidget {
  final AttendanceController controller;
  MealPlannerDashboard(this.controller);

  @override
  _MealPlannerDashboardState createState() => _MealPlannerDashboardState();
}

class _MealPlannerDashboardState extends State<MealPlannerDashboard> {

  final MealController controller = MealController();

  @override
  void initState() {
    super.initState();
    controller.loadHistoryMeals().then((_) {
      setState(() {
        MealModel.mealCount = controller.getTodayMeals();
      });
    });
  }
  
  final List<String> days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
  String day = DateFormat('E').format(DateTime.now());


  // void _increaseProgress() {
  //   setState(() {
  //     _tapCount = (_tapCount + 1) % 5; 
  //   });
  // }

  @override
  Widget build(BuildContext context) {

    double progress = MealModel.mealCount! / 4;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Bar
              DashboardWidgets.topBar(context),
              SizedBox(height: 28),

              // Weeks
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(7, (index) {
                  if(days[index] == day){
                    return Column(
                      children: [
                        CustomPaint(
                          painter: CircleProgressPainter(progress),
                          child: SizedBox(
                            width: 45,
                            height: 45,
                          ),
                        ),
                        Text(days[index],style: TextStyle(color: ColorTheme.textSecondary),)
                      ],
                    );
                  } 

                  return Column(
                    children: [
                      CustomPaint(
                        painter: CircleProgressPainter(0),
                        child: SizedBox(
                          width: 45,
                          height: 45,
                        ),
                      ),
                      Text(days[index],style: TextStyle(color: ColorTheme.textSecondary),)
                    ],
                  );
                }),
              ),
              SizedBox(height: 24),

              // Date Widget
              DashboardWidgets.dateWidget(context),
              SizedBox(height: 14),

              // Hostel Toggle Button
              Center(child: Column(children: [ToggleHostelButton(controller: widget.controller,)])),
              SizedBox(height: 20),

              // Meal Toggle
              DashboardWidgets.mealSelection(context),
              SizedBox(height: 20),

              // Today menu Title
              DashboardWidgets.todayMenuTitle(context),
              
              // Today's Menu
              DashboardWidgets.todayMenu(context),

            ],
          ),
        ),
      ),
          // Bottom Bar
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(20.0),
              child: Nav(context, 1, widget.controller),
              )
    );
  }
}
