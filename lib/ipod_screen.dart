import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gameboy_ui/player_provider.dart';
import 'package:gameboy_ui/utils.dart';
import 'package:provider/provider.dart';

class IpodUI extends StatelessWidget {
  const IpodUI({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PlayerProvider(),
      child: const Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Center(
                  child: IpodScreen(),
                ),
              ),
              Expanded(
                child: Center(
                  child: IpodControls(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class IpodControls extends StatelessWidget {
  const IpodControls({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(brightness: Brightness.dark, iconTheme: const IconThemeData(color: Colors.white)),
      child: Container(
        height: 250.h,
        width: 250.h,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: [Colors.black, Color(0XFF24272f)],
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Expanded(
              child: Center(
                child: Text(
                  'MENU',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => Provider.of<PlayerProvider>(context, listen: false).previousScreen(),
                      child: Transform.flip(
                        flipX: true,
                        child: const Icon(CupertinoIcons.forward_end_alt_fill),
                      ),
                    ),
                  ),
                  Container(
                    height: 100.h,
                    width: 100.h,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black,
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => Provider.of<PlayerProvider>(context, listen: false).nextScreen(),
                      child: const Icon(CupertinoIcons.forward_end_alt_fill),
                    ),
                  ),
                ],
              ),
            ),
            const Expanded(child: Icon(CupertinoIcons.playpause_fill)),
          ],
        ),
      ),
    );
  }
}

class IpodScreen extends StatelessWidget {
  const IpodScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(30.h),
      height: 300.h,
      width: 300.w,
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10.r)),
      child: Consumer<PlayerProvider>(
        builder: (context, provider, _) {
          return Column(
            children: [
              Padding(padding: EdgeInsets.all(2.w), child: const StateIndicators()),
              ...provider.screenItems
                  .map(
                    (e) => MenuItem(
                      label: e.label,
                      icon: e.icon,
                      isSelected: e.screen == provider.selectedScreenItem,
                    ),
                  )
                  .toList()
            ],
          );
        },
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  const MenuItem({
    super.key,
    required this.label,
    required this.icon,
    this.isSelected = false,
  });
  final String label;
  final IconData icon;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: isSelected ? const Color(0XFF4374b3) : null,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Icon(
              icon,
              color: isSelected ? Colors.white : Colors.black,
            ),
            horizontalSeparator,
            Text(
              label,
              style: TextStyle(color: isSelected ? Colors.white : Colors.black, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

class StateIndicators extends StatelessWidget {
  const StateIndicators({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Text(
            '16:57',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              CupertinoIcons.play_fill,
              color: Colors.black,
            ),
            Icon(
              CupertinoIcons.battery_full,
              color: Colors.black,
            )
          ],
        ),
      ],
    );
  }
}
