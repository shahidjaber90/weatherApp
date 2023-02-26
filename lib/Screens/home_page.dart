import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:weatherapp/Screens/favorite_page.dart';
import 'package:weatherapp/Utils/colors.dart';
import 'package:weatherapp/Utils/image.dart';
import 'package:weatherapp/Widgets/main_temprature.dart';
import 'package:weatherapp/Widgets/today_weather.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.primaryColor,
        body: Container(
          height: MediaQuery.of(context).size.height * 1.00,
          width: double.infinity,
          // color: ColorConstant.fontsColor,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 6,left: 10,right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> const FavoritePage()));
                      }, 
                      icon: Icon(Icons.favorite_border,color: ColorConstant.fontsColor,))
                    ],
                  ),
                ),
                // Main temprature View
                MainTemprature(),
                const SizedBox(height: 16,),
                
                TodayWeather(),
                  
                
                
                 
              ],
            ),
          ),
        ),
      )
    );
  }
}