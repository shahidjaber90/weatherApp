import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp/Controllers/home_controller.dart';
import 'package:weatherapp/Models/home_model.dart';
import 'package:weatherapp/Utils/colors.dart';
import 'package:weatherapp/Utils/texts.dart';

class MainTemprature extends StatelessWidget {
  String currentDate = DateFormat('yMMMMd').format(DateTime.now());
  String currentTime = DateFormat().add_jm().format(DateTime.now());
  var currentweather;
  MainTemprature({super.key});
  getWeather() {
    currentweather = getCurrentWeather('karachi');
    return currentweather;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getWeather(),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          HomeModel data = snapshot.data;
          return Container(
            width: double.infinity,
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.35,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '${data.name}'.toUpperCase(),
                              style: TextStyle(
                                  fontFamily: 'Open Sans',
                                  fontSize: 22,
                                  color: ColorConstant.fontsColor,
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              '${data.main?.temp} ${TextConstant.degree}',
                              style: TextStyle(
                                  fontFamily: 'Open Sans',
                                  fontSize: 24,
                                  color: ColorConstant.fontsColor,
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color:
                                      ColorConstant.greyColor.withOpacity(0.60),
                                  borderRadius: BorderRadius.circular(24)),
                              width: MediaQuery.of(context).size.width * 0.22,
                              alignment: Alignment.center,
                              child: Text(
                                '${data.weather?[0].main}',
                                style: TextStyle(
                                    fontFamily: 'Open Sans',
                                    fontSize: 18,
                                    color: ColorConstant.fontsColor,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width * 0.60,
                      height: 200,
                      // height: 250,
                      child: Image.asset(
                        'assets/${data.weather?[0].icon}.png',
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12, right: 12, top: 10),
                  child: Container(
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          width: MediaQuery.of(context).size.width * 0.26,
                          child: Row(
                            children: [
                              Icon(
                                Icons.water_drop_outlined,
                                size: 18,
                                color: ColorConstant.blueColor,
                              ),
                              const SizedBox(
                                width: 6,
                              ),
                              Text(
                                '${data.main?.humidity}%',
                                style: TextStyle(
                                    color: ColorConstant.fontsColor,
                                    fontFamily: 'Open Sans',
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width * 0.30,
                          child: Row(
                            children: [
                              Icon(
                                Icons.swap_horizontal_circle_outlined,
                                size: 18,
                                color: ColorConstant.blueColor,
                              ),
                              const SizedBox(
                                width: 6,
                              ),
                              Text(
                                '${data.main?.pressure} mBar',
                                style: TextStyle(
                                    color: ColorConstant.fontsColor,
                                    fontFamily: 'Open Sans',
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          width: MediaQuery.of(context).size.width * 0.26,
                          child: Row(
                            children: [
                              Icon(
                                Icons.air,
                                size: 18,
                                color: ColorConstant.blueColor,
                              ),
                              const SizedBox(
                                width: 6,
                              ),
                              Text(
                                '${data.wind?.speed}km/h',
                                style: TextStyle(
                                    color: ColorConstant.fontsColor,
                                    fontFamily: 'Open Sans',
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12,right: 24,top: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Image.asset(
                          'assets/${data.weather?[0].icon}.png',height: 20,width: 20,
                        ),
                      Text(
                        '${currentTime}',
                        style: TextStyle(
                          color: ColorConstant.fontsColor,
                          fontFamily: 'Open Sans',
                          fontWeight: FontWeight.w600
                        ),
                      ),
                          ],
                        ),
                      ),
                      Text(
                        '${currentDate}',
                        style: TextStyle(
                          color: ColorConstant.fontsColor,
                          fontFamily: 'Open Sans',
                          fontWeight: FontWeight.w600
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
