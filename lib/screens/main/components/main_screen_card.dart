import 'package:flutter/material.dart';
import 'package:online_graduation/utils/color_constant.dart';

class MainScreenCard extends StatelessWidget {
  final String firstRowTitle;
  final String secondRowTitle;
  final String thirdRowTitle;
  final String? pngImageDir;
  const MainScreenCard({
    super.key,
    this.pngImageDir,
    this.firstRowTitle = "",
    this.secondRowTitle = "",
    this.thirdRowTitle = "",
  });

  Widget cardTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          firstRowTitle,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 48,
            fontWeight: FontWeight.w300,
            fontFamily: 'PyeongChangPeace',
          ),
        ),
        Text(
          secondRowTitle,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 36,
            fontWeight: FontWeight.w300,
            fontFamily: 'PyeongChangPeace',
          ),
        ),
        Text(
          thirdRowTitle,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 48,
            fontWeight: FontWeight.w300,
            fontFamily: 'PyeongChangPeace',
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 5,
          foregroundColor: BLACK,
          backgroundColor: PINK,
          minimumSize: const Size(88, 36),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          shadowColor: Colors.black87,
        ),
        onPressed: () {},
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: pngImageDir == null
                    ? [cardTitle()]
                    : [
                        cardTitle(),
                        Transform.translate(
                          offset: Offset(150, 8),
                          child: Image.asset(
                            pngImageDir!,
                            height: 200,
                          ),
                        ),
                      ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
