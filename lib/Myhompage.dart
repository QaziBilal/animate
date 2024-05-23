import 'package:animate/details.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'imags.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: AnimateImage());
  }
}

class AnimateImage extends StatefulWidget {
  const AnimateImage({super.key});

  @override
  State<AnimateImage> createState() => _AnimateImageState();
}

class _AnimateImageState extends State<AnimateImage> {
  bool selected = true;
  @override
  Widget build(BuildContext context) {
    double sw = MediaQuery.sizeOf(context).width;
    double sh = MediaQuery.sizeOf(context).height;

    return Stack(
      children: [
        AnimatedPositioned(
          left: selected == true ? sw * 0.1 : 0,
          top: selected == true ? sh * 0.25 : 0,
          width: selected == true ? sw * 0.72 : sw,
          height: selected == true
              ? sh >= 630
                  ? sh * 0.5
                  : sh * 0.4
              : sh,
          duration: const Duration(seconds: 2),
          curve: Curves.fastOutSlowIn,
          child: GestureDetector(
              onTap: () {
                setState(() {
                  selected = !selected;
                });
                selected == true
                    ? null
                    : Future.delayed(Duration(seconds: 3), () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailScreen()));
                      });
              },
              child: Hero(
                tag: "kimageposter",
                child: Image.asset(
                  kIsWeb ? "assets/$kimageposter" : kimageposter,
                  fit: BoxFit.fill,
                ),
              )),
        ),
        Positioned(
            top: sh * 0.08,
            left: sw * 0.1,
            child: Icon(
              Icons.menu,
              color: selected == true ? Colors.black : Colors.white,
              size: 30,
            )),
        AnimatedPositioned(
          top: selected ? sh * 0.15 : sh * 0.08,
          left: selected ? sw * 0.1 : sw * 0.65,
          duration: const Duration(seconds: 2),
          child: AnimatedDefaultTextStyle(
            duration: const Duration(seconds: 2),
            style: TextStyle(
              fontSize: 28,
              color: selected ? Colors.black : Colors.white,
              fontWeight: FontWeight.w600,
            ),
            child: Text("In theaters"),
          ),
        ),
        AnimatedPositioned(
            bottom: selected == true ? sh * 0.05 : sh * 0.06,
            left: selected == true ? sw * 0.1 : 30,
            duration: const Duration(seconds: 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AnimatedDefaultTextStyle(
                  duration: Duration(seconds: 2),
                  style: TextStyle(
                      fontSize: 28,
                      color: selected == true ? Colors.black : Colors.white,
                      fontWeight: FontWeight.w600),
                  child: Text(
                    "The OutPost",
                  ),
                ),
                const SizedBox(
                  height: 0,
                ),
                AnimatedDefaultTextStyle(
                  duration: Duration(seconds: 2),
                  style: TextStyle(
                      fontSize: 18,
                      color: selected == true ? Colors.grey : Colors.white),
                  child: Text(
                    "4 Seasons",
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                AnimatedDefaultTextStyle(
                  duration: Duration(seconds: 2),
                  style: TextStyle(
                      fontSize: 18,
                      color: selected == true ? Colors.black : Colors.white),
                  child: Text(
                    "IMDb   6.6/10",
                  ),
                ),
              ],
            )),
        AnimatedPositioned(
            bottom: selected == true ? sh * 0.11 : sh * 0.145,
            left: selected == false ? 25 : sw * 0.8,
            child: Icon(
              Icons.menu,
              color: selected == true ? Colors.black : Colors.white,
            ),
            duration: Duration(seconds: 2))
      ],
    );
  }
}
