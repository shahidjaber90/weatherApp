import 'package:flutter/material.dart';
import 'package:weatherapp/Controllers/home_controller.dart';
import 'package:weatherapp/Models/home_model.dart';
import 'package:weatherapp/Utils/colors.dart';
import 'package:weatherapp/Utils/texts.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  TextEditingController _controller = TextEditingController();
  var _currentWeather;
  getSearchWeather() {
    _currentWeather = getCurrentWeather(
        (_controller.text == '') ?  _controller.text : 'karachi');
    return _currentWeather;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: ColorConstant.primaryColor,
            body: FutureBuilder(
              future: getSearchWeather(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  HomeModel searchData = snapshot.data;
                  return Column(
                    children: [
                      Container(
                        child: TextField(
                          controller: _controller,
                          onSubmitted: (value) async{
                          HomeModel _currentWeather =  await getSearchWeather();
                            setState(() {
                            });
                          },
                        ),
                      ),
                      Column(
                        children: [
                          Text('${searchData.name?.characters}'),
                          Text('${searchData.main?.temp}'),
                          Text('${searchData.weather?[0].main}'),
                        ],
                      )
                    ],
                  );
                }
                return const CircularProgressIndicator();
              },
            )));
  }
}
