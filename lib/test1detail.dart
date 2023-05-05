import 'package:duasection/dbhelper.dart';

import 'package:flutter/material.dart';

class DuaDetailsScreen extends StatefulWidget {
  final Dua dua;

  const DuaDetailsScreen({required this.dua});

  @override
  State<DuaDetailsScreen> createState() => _DuaDetailsScreenState();
}

class _DuaDetailsScreenState extends State<DuaDetailsScreen> {
  int currentTab = 0;
  double _currentSliderValue = 0;
  //  final List<Widget> screens = [const test2(), const test3(), const mainpage()];
  // final PageStorageBucket bucket = PageStorageBucket();
  // // Widget currentScreen = const mainpage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.dua.duaTitle),
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.play_circle_sharp),
          onPressed: () {},
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                textDirection: TextDirection.rtl,
                widget.dua.duaText,
                style: const TextStyle(fontSize: 18.0),
              ),
              const SizedBox(height: 16.0),
              Text(
                textDirection: TextDirection.rtl,
                widget.dua.translationUrdu,
                style: const TextStyle(
                  fontSize: 16.0,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 5,
          child: Container(
            height: 80, // increased height to accommodate SeekBar
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.start, // align SeekBar to bottom
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MaterialButton(
                          minWidth: 40,
                          onPressed: () {
                            setState(() {
                              // currentScreen = const test2();
                              // currentTab = 0;
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.share_rounded,
                                  color: currentTab == 0
                                      ? Colors.blue
                                      : Colors.grey)
                            ],
                          ),
                        ),
                        MaterialButton(
                          minWidth: 40,
                          onPressed: () {
                            setState(() {
                              // currentScreen = const test2();
                              // currentTab = 0;
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.loop,
                                  color: currentTab == 0
                                      ? Colors.blue
                                      : Colors.grey)
                            ],
                          ),
                        ),
                        MaterialButton(
                          minWidth: 40,
                          onPressed: () {
                            setState(() {
                              // currentScreen = const test2();
                              // currentTab = 0;
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.fast_rewind,
                                  color: currentTab == 0
                                      ? Colors.blue
                                      : Colors.grey)
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MaterialButton(
                          minWidth: 40,
                          onPressed: () {
                            setState(() {
                              // currentScreen = const test2();
                              // currentTab = 0;
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.fast_forward,
                                  color: currentTab == 0
                                      ? Colors.blue
                                      : Colors.grey)
                            ],
                          ),
                        ),
                        MaterialButton(
                          minWidth: 40,
                          onPressed: () {
                            setState(() {
                              // currentScreen = const test2();
                              // currentTab = 0;
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.list,
                                  color: currentTab == 0
                                      ? Colors.blue
                                      : Colors.grey)
                            ],
                          ),
                        ),
                        MaterialButton(
                          minWidth: 40,
                          onPressed: () {
                            setState(() {
                              // currentScreen = const test2();
                              // currentTab = 0;
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.favorite,
                                  color: currentTab == 0
                                      ? Colors.blue
                                      : Colors.grey)
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                // added spacing between buttons and SeekBar
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Container(
                    height: 20,
                    width: 400,
                    child: Slider(
                        value:
                            _currentSliderValue, // add you value: _currentSliderValue, // set the initial value of the Slider
                        min: 0, // set the minimum value of the Slider
                        max: 100,
                        onChanged: (double value) {
                          setState(() {
                            _currentSliderValue =
                                value; // update the value of the Slider
                          });
                        }),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
