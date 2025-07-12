// UI Material
import 'package:flutter/material.dart';

// Color Theme
import 'package:frontend/Constants/colors.dart';

// Package
import 'package:intl/intl.dart';
import 'package:frontend/Components/toggle_food.dart';

// Model
import 'package:frontend/Models/meal.dart';


class DashboardWidgets {

  // Top Bar
  static Container topBar(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorTheme.appSecondary,
        borderRadius: BorderRadius.circular(10)
      ),
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(
                Icons.restaurant,
                color: ColorTheme.appSecondary,
              ),
              label: Text(
                'Plan Meal',
                style: TextStyle(
                  fontSize: 20,
                  color: ColorTheme.appSecondary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorTheme.appTertiary,
                padding: EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: OutlinedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/stats');
              },
              icon: Icon(
                Icons.bar_chart,
                color: ColorTheme.textSecondary,
              ),
              label: Text(
                'View Stats',
                style: TextStyle(
                  fontSize: 20,
                  color: ColorTheme.textSecondary,
                ),
              ),
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 12),
                side: BorderSide.none,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Date
  static Center dateWidget(BuildContext context){
    final formattedDate = DateFormat('d MMMM y').format(DateTime.now());
    return Center(
      child: Column(
        children: [
          Text(
            'Today, $formattedDate',
            textAlign: TextAlign.values[5],
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }


  // Meal Selection
  static Center mealSelection(BuildContext build){
      
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal:40, vertical: 16),
        child: Column(
          children: [
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
          Align(
            alignment: Alignment.centerLeft,
            child:
              Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset('assets/images/Breakfast.png'),
              SizedBox(width: 20,),
              Text('Breakfast'),
            ],
              )
            ),
            Align(
              alignment: Alignment.centerRight,
              child: ToggleFoodButton(
              initialValue: MealModel.mealStatus['breakfast']!,
              ),
              ),
            ],
          ),
        ),
        SizedBox(height: 12),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
          Align(
            alignment: Alignment.centerLeft,
            child:
              Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset('assets/images/Lunch.png'),
              SizedBox(width: 20,),
              Text('Lunch'),
            ],
              )
            ),
            Align(
              alignment: Alignment.centerRight,
              child: ToggleFoodButton(
              initialValue: MealModel.mealStatus['lunch']!,
              ),
              ),
            ],
          ),
        ),
        SizedBox(height: 12),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
          Align(
            alignment: Alignment.centerLeft,
            child:
              Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset('assets/images/Tea.png'),
              SizedBox(width: 20,),
              Text('Tea/Snacks'),
            ],
              )
            ),
            Align(
              alignment: Alignment.centerRight,
              child: ToggleFoodButton(
              initialValue: MealModel.mealStatus['teaSnacks']!,
              ),
              ),
            ],
          ),
        ),
        SizedBox(height: 12),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
          Align(
            alignment: Alignment.centerLeft,
            child:
              Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset('assets/images/Dinner.png'),
              SizedBox(width: 20,),
              Text('Dinner'),
            ],
              )
            ),
            Align(
              alignment: Alignment.centerRight,
              child: ToggleFoodButton(
              initialValue: MealModel.mealStatus['dinner']!,
              ),
              ),
          ],
          ),
        ),
          ],
        ),
      ),
    );
  }

  // Menu Title
  static Center todayMenuTitle(BuildContext context){
    return Center(
      child: Text(
        "Today's Menu",
        style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
        ),
      ),
    );
  }

  // Today Menu
  static Expanded todayMenu(BuildContext context){
    return Expanded(
      child: GridView.count(
        crossAxisCount: 2,
        children: [
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/Breakfast.png'),
                SizedBox(width: 10,),
                Text('Breakfast'),
                ]
              )
            ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/Lunch.png'),
                SizedBox(width: 10,),
                Text('Lunch'),
                ]
              )
            ),          
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/Tea.png'),
                SizedBox(width: 10,),
                Text('Tea/Snacks'),
                ]
              )
            ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/Dinner.png'),
                SizedBox(width: 10,),
                Text('Dinner'),
                ]
              )
            ),
        ],
      ),
    );
  }

  
}