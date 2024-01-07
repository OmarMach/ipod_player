import 'package:flutter/cupertino.dart';

enum Screens {
  nowPlaying,
  albums,
  artists,
  shuffle,
  playlists,
  settings,
}

class ScreenItem {
  final String label;
  final Screens screen;
  final IconData icon;

  ScreenItem({
    required this.label,
    required this.screen,
    required this.icon,
  });
  // TODO Add action here
}

class PlayerProvider with ChangeNotifier {
  Screens currentScreen = Screens.nowPlaying;
  Screens selectedScreenItem = Screens.albums;

  List<ScreenItem> screenItems = [
    ScreenItem(label: 'Now Playing', icon: CupertinoIcons.play, screen: Screens.nowPlaying),
    ScreenItem(label: 'Albums', icon: CupertinoIcons.music_albums, screen: Screens.albums),
    ScreenItem(label: 'Artists', icon: CupertinoIcons.person_2, screen: Screens.artists),
    ScreenItem(label: 'Shuffle', icon: CupertinoIcons.shuffle, screen: Screens.shuffle),
    ScreenItem(label: 'Playlists', icon: CupertinoIcons.list_bullet, screen: Screens.playlists),
    ScreenItem(label: 'Settings', icon: CupertinoIcons.settings, screen: Screens.settings),
  ];

  void previousScreen() {
    print(Screens.values);
    final int selectedScreenItemIndex = Screens.values.indexOf(selectedScreenItem);
    print(selectedScreenItemIndex);
    if (selectedScreenItemIndex == 0) return;
    selectedScreenItem = Screens.values.elementAt(selectedScreenItemIndex - 1);
    notifyListeners();
  }

  void nextScreen() {
    final int selectedScreenItemIndex = Screens.values.indexOf(selectedScreenItem);
    if (selectedScreenItemIndex == Screens.values.length - 1) return;
    selectedScreenItem = Screens.values.elementAt(selectedScreenItemIndex + 1);
    notifyListeners();
  }
}
