import 'package:flutter/material.dart';
import 'package:online_graduation/screens/main/components/main_screen_card.dart';
import 'package:online_graduation/utils/color_constant.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  Widget container() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        height: 100,
        width: 350,
        decoration: BoxDecoration(border: Border.all()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Padding(
          padding: EdgeInsets.only(left: 8),
          child: Text(
            '랜선 졸업식',
            style: TextStyle(
              fontFamily: 'PyeongChangPeace',
              fontWeight: FontWeight.bold,
              color: PINK,
              fontSize: 24,
            ),
          ),
        ),
      ),
      body: const SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            MainScreenCard(
              firstRowTitle: "Generate",
              secondRowTitle: "Your Own",
              thirdRowTitle: "Photo",
              pngImageDir: "assets/model_outputs/eunbin.png",
            ),
            MainScreenCard(
              firstRowTitle: "Find",
              secondRowTitle: "Your",
              thirdRowTitle: "Friends",
              pngImageDir: "assets/model_outputs/eunbin.png",
            ),
            MainScreenCard(),
            MainScreenCard(),
            MainScreenCard(),
          ],
        ),
      )),
    );
  }
}
