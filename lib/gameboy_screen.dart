import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gameboy_ui/utils.dart';

class GameboyUI extends StatelessWidget {
  const GameboyUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFf6f6f6),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const UpperBody(),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Expanded(
                        flex: 4,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Joystick(),
                            PlayButtons(),
                          ],
                        ),
                      ),
                      const Expanded(child: ParamButtons()),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: List.generate(6, (index) => const SoundEndpointsCosmetic()),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SoundEndpointsCosmetic extends StatelessWidget {
  const SoundEndpointsCosmetic({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Transform.rotate(
        angle: -.25,
        child: Container(
          width: 6.w,
          height: 60.w,
          decoration: BoxDecoration(
            color: const Color(0XFFdfdfdf),
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
      ),
    );
  }
}

class ParamButtons extends StatelessWidget {
  const ParamButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Transform.rotate(
          angle: -0.4,
          child: Column(
            children: [
              Container(
                height: 12.w,
                width: 60.w,
                decoration: BoxDecoration(
                  color: const Color(0XFFb1b1b1),
                  borderRadius: BorderRadius.circular(4.r),
                ),
              ),
              smallVerticalSeparator,
              Text(
                'SELECT',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp,
                  color: const Color(0XFF568996),
                ),
              ),
            ],
          ),
        ),
        horizontalSeparator,
        Transform.rotate(
          angle: -0.4,
          child: Column(
            children: [
              Container(
                height: 12.w,
                width: 60.w,
                decoration: BoxDecoration(
                  color: const Color(0XFFb1b1b1),
                  borderRadius: BorderRadius.circular(4.r),
                ),
              ),
              smallVerticalSeparator,
              Text(
                'START',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp,
                  color: const Color(0XFF568996),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class PlayButtons extends StatelessWidget {
  const PlayButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -0.5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 70.w,
            width: 140.w,
            decoration: BoxDecoration(
              color: const Color(0XFFe2e2e2),
              borderRadius: BorderRadius.circular(50.r),
            ),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ActionButton(),
                  ActionButton(),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 70.w,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'B',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Color(0XFF568996),
                  ),
                ),
                Text(
                  'A',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Color(0XFF568996),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ActionButton extends StatefulWidget {
  const ActionButton({super.key});

  @override
  State<ActionButton> createState() => _ActionButtonState();
}

class _ActionButtonState extends State<ActionButton> {
  bool isTapped = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => isTapped = true),
      onTapUp: (_) => setState(() => isTapped = false),
      child: Stack(
        children: [
          Transform.translate(
            offset: isTapped ? const Offset(0, 0) : const Offset(5, -1),
            child: CircleAvatar(
              radius: 25.r,
              backgroundColor: const Color(0XFFf01b6e).withOpacity(.3),
            ),
          ),
          CircleAvatar(
            radius: 25.r,
            backgroundColor: const Color(0XFFf01b6e),
          ),
        ],
      ),
    );
  }
}

class Joystick extends StatelessWidget {
  const Joystick({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 70.r,
      backgroundColor: const Color(0XFFe2e2e2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 35.w,
            width: 35.w,
            decoration: BoxDecoration(
              color: const Color(0XFF383838),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(7.r),
                bottomLeft: Radius.circular(7.r),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 35.w,
                width: 35.w,
                decoration: BoxDecoration(
                  color: const Color(0XFF383838),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(7.r),
                    topRight: Radius.circular(7.r),
                  ),
                ),
              ),
              Container(
                height: 35.w,
                width: 35.w,
                color: const Color(0XFF383838),
                child: Center(
                  child: CircleAvatar(
                    radius: 20.r,
                    backgroundColor: const Color(0XFF575654),
                  ),
                ),
              ),
              Container(
                height: 35.w,
                width: 35.w,
                decoration: BoxDecoration(
                  color: const Color(0XFF383838),
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(7.r),
                    bottomLeft: Radius.circular(7.r),
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: 35.w,
            width: 35.w,
            decoration: BoxDecoration(
              color: const Color(0XFF383838),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(7.r),
                bottomRight: Radius.circular(7.r),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class UpperBody extends StatelessWidget {
  const UpperBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 300.h,
        width: 350.w,
        decoration: BoxDecoration(
          color: const Color(0XFF535a5a),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.r),
            topRight: Radius.circular(10.r),
            bottomLeft: Radius.circular(10.r),
            bottomRight: Radius.circular(70.r),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Container(height: 2, color: const Color(0XFF704e60)),
                      smallVerticalSeparator,
                      Container(height: 2, color: const Color(0XFF416975)),
                    ],
                  ),
                ),
                smallHorizontalSeparator,
                Text(
                  'DOT MATRIX WITH STEREO SOUND',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                smallHorizontalSeparator,
                Expanded(
                  child: Column(
                    children: [
                      Container(height: 2, color: const Color(0XFF704e60)),
                      smallVerticalSeparator,
                      Container(height: 2, color: const Color(0XFF416975)),
                    ],
                  ),
                ),
              ],
            ),
            verticalSeparator,
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 10.r,
                        backgroundColor: const Color(0XFFfcb502),
                      ),
                      verticalSeparator,
                      Text(
                        'BATTERY',
                        style: TextStyle(
                          fontSize: 10.sp,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    height: 250,
                    width: 200,
                    decoration: const BoxDecoration(
                      color: Color(0XFF67b735),
                    ),
                  ),
                ),
                const Spacer()
              ],
            ),
          ],
        ),
      ),
    );
  }
}
