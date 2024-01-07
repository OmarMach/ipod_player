import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gameboy_ui/gameboy_screen.dart';
import 'package:gameboy_ui/ipod_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (context, _) => const MaterialApp(
        home: IpodUI(),
      ),
    );
  }
}
