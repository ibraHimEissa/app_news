import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:app_news/shared/cubit/cubit.dart';
import 'package:app_news/shared/cubit/state.dart';
import 'package:app_news/shared/theme_cubit/theme_cubit.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NewsCubit()..getBusiness(),
      child: BlocConsumer<NewsCubit,NewsStates>(
        listener: (context,state){},
        builder: (context,state){
          return  Center(
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlutterSwitch(
                  width: 100.0,
                  height: 55.0,
                  toggleSize: 45.0,
                  value: !ThemeCubit.get(context).isDark,
                  borderRadius: 30.0,
                  padding: 2.0,
                  activeToggleColor: HexColor('3B538DFF'),
                  inactiveToggleColor: Color(0xFF01579B),
                  activeSwitchBorder: Border.all(
                    color: HexColor('3B538DFF'),
                    width: 6.0,
                  ),
                  inactiveSwitchBorder: Border.all(
                    color: Color(0xFF29B6F6),
                    width: 6.0,
                  ),
                  activeColor: HexColor('152238'),
                  inactiveColor: Color(0xFF54C5F8),
                  activeIcon: Image.network(
                    "https://cdn4.iconfinder.com/data/icons/multimedia-flat-30px/30/moon_dark_mode_night-512.png",
                  ),
                  inactiveIcon: Image.network(
                    "https://cdn4.iconfinder.com/data/icons/multimedia-flat-30px/30/sun_light_mode_day-512.png",
                  ),
                  onToggle: (val) {
                    setState(() {
                      ThemeCubit.get(context).changeAppMode();
                    });
                  },
                ),
              ],
            ),
            /*IconButton(
              onPressed: (){
                ThemeCubit.get(context).changeAppMode();
              },
              icon: const Icon(Icons.brightness_4_outlined),
            ),*/
          );
        },
      ),
    );
  }
}
