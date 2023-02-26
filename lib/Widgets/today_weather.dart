import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp/Controllers/home_controller.dart';
import 'package:weatherapp/Models/hourly_model.dart';
import 'package:weatherapp/Utils/colors.dart';

class TodayWeather extends StatelessWidget {
  var hourlyWeather;
  TodayWeather({super.key});
  getHourly() {
    hourlyWeather = getHourlyWeather();
    return hourlyWeather;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getHourly(),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          HourlyModel hourlyData = snapshot.data;
          return Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(right: 12, top: 16, bottom: 20),
                  child: Row(
                    children: [
                      Text(
                        'Today',
                        style: TextStyle(
                            color: ColorConstant.fontsColor,
                            fontFamily: 'Open Sans',
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 130,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: hourlyData.list.length > 8? 8 : hourlyData.list.length ,
                          itemBuilder: (context, index) {
                            var time = DateFormat.jm().format(
                                DateTime.fromMillisecondsSinceEpoch(
                                    hourlyData.list[index].dt * 1000));
                            return Container(
                              alignment: Alignment.center,
                              width: 72,
                              height: 80,
                              padding:
                                  const EdgeInsets.only(top: 20, bottom: 20),
                              margin: const EdgeInsets.only(right: 8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(24)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    time,
                                    style: TextStyle(
                                        color: ColorConstant.greenColor,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'Open Sans'),
                                  ),
                                  Image.asset(
                                    'assets/${hourlyData.list[index].weather[0].icon}.png',
                                    width: 40,
                                    height: 50,
                                  ),
                                  Text(
                                    '${hourlyData.list[index].main.temp}°',
                                    style: TextStyle(
                                        color: ColorConstant.fontsColor,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'Open Sans'),
                                  )
                                ],
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  ),
                ),
                // See More Weather

                const SizedBox(
                  height: 16,
                ),

                Container(
                  width: double.infinity,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: hourlyData.list.length,
                    itemBuilder: (context, index) {
                      var days = DateFormat('EEEE').format(
                          DateTime.now().add(Duration(days: index + 1)));
                      var daysNumber = DateFormat('d/M').format(
                          DateTime.now().add(Duration(days: index + 1)));
                      return Container(
                        padding:
                            const EdgeInsets.only(left: 8, right: 16, top: 12),
                        height: 60,
                        width: 24,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '$days',
                                  style: TextStyle(
                                      color: ColorConstant.greenColor,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 1.5,
                                      fontSize: 12,
                                      fontFamily: 'Open Sans'),
                                ),
                                Text(
                                  '$daysNumber',
                                  style: TextStyle(
                                      color: ColorConstant.greenColor,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 1.5,
                                      fontSize: 12,
                                      fontFamily: 'Open Sans'),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                              '${hourlyData.list[index].weather[0].description}',
                              style: TextStyle(
                                  color: ColorConstant.blueColor,
                                  fontSize: 13,
                                  fontFamily: 'Open Sans',
                                  fontWeight: FontWeight.w600),
                            ),
                            const SizedBox(width: 12,),
                            Image.asset(
                              'assets/${hourlyData.list[index].weather[0].icon}.png',
                              height: 50,
                              width: 50,
                            ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  '${hourlyData.list[index].main.tempMax}°',
                                  style: TextStyle(
                                      color: ColorConstant.redColor,
                                      fontSize: 13,
                                      fontFamily: 'Open Sans',
                                      fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(
                                  width: 12,
                                ),
                                Text(
                                  '${hourlyData.list[index].main.tempMin}°',
                                  style: TextStyle(
                                      color: ColorConstant.blueColor,
                                      fontSize: 13,
                                      fontFamily: 'Open Sans',
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        }
        return (Text(''));
      },
    );
  }
}
