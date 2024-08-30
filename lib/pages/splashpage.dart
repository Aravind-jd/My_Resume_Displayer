import 'dart:async';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter/material.dart';
import 'package:my_resume/pages/mainpage.dart';

class Splashpage extends StatefulWidget {
  const Splashpage({super.key});

  @override
  State<Splashpage> createState() => _SplashpageState();
}

class _SplashpageState extends State<Splashpage>  with TickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> _animation;



  @override
  void initState() {
    super.initState();
    // redirect();

    // Initialize the animation controller
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    // Define the animation curve and tween
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.bounceInOut,
    );

    // Start the animation
    _controller.forward();

    // Navigate to home page after the animation completes
    Timer(Duration(seconds: 4), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => Mainpage()),
      );
    });

  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white54,

      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       CircleAvatar(
      //         child:Container(
      //           width: 600,
      //           height: 600,
      //           decoration: BoxDecoration(
      //             shape: BoxShape.circle,
      //             image: DecorationImage(
      //               image: AssetImage(
      //                 "assets/images/app3.png",
      //               ),
      //               fit: BoxFit.fill,
      //             ),
      //             border: Border(
      //               top: BorderSide(
      //                 color: Colors.white,
      //               ),
      //               bottom: BorderSide(
      //                 color: Colors.white,
      //               ),
      //               left: BorderSide(
      //                 color: Colors.white,
      //               ),
      //               right: BorderSide(
      //                 color: Colors.white,
      //               ),
      //             ),
      //           ),
      //         ),
      //       ),
      //       SizedBox(
      //         width: 10,
      //       ),
      //       Text(
      //         "My Resume",
      //         style: TextStyle(
      //           color: Colors.black,
      //           fontFamily: "Caveat",
      //           fontSize: 30,
      //           fontStyle: FontStyle.italic,
      //           fontWeight: FontWeight.normal,
      //         ),
      //       ),
      //     ],
      //   ),
      // ),

        body: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Stack(
              children: <Widget>[
                Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.lightBlueAccent,
                          Colors.blueAccent.withOpacity(_animation.value),
                          Colors.blue,
                        ],
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Opacity(
                    opacity: _animation.value,
                    child: ScaleTransition(
                      scale: _animation,
                      child: Image.asset(
                        'assets/images/app3.png',
                        width: 200,
                        height: 200,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),


        // AnimatedSplashScreen(
        //     duration: 3000,
        //     splash: Column(
        //       children: [
        //         CircleAvatar(
        //           child:Container(
        //             width: 200,
        //             height: 200,
        //             decoration: BoxDecoration(
        //               shape: BoxShape.circle,
        //               image: DecorationImage(
        //                 image: AssetImage(
        //                   "assets/images/app3.png",
        //                 ),
        //                 fit: BoxFit.fill,
        //               ),
        //               border: Border(
        //                 top: BorderSide(
        //                   color: Colors.white,
        //                 ),
        //                 bottom: BorderSide(
        //                   color: Colors.white,
        //                 ),
        //                 left: BorderSide(
        //                   color: Colors.white,
        //                 ),
        //                 right: BorderSide(
        //                   color: Colors.white,
        //                 ),
        //               ),
        //             ),
        //           ),
        //         ),
        //         SizedBox(
        //           height: 10,
        //         ),
        //         Text(
        //           "My Resume",
        //           style: TextStyle(
        //             fontFamily: "Tangerine",
        //           ),
        //         ),
        //       ],
        //     ),
        //     nextScreen: Mainpage(),
        //     splashTransition: SplashTransition.fadeTransition,
        //     pageTransitionType: PageTransitionType.fade,
        //     backgroundColor: Colors.teal.shade200,
        // )
    );
  }

  // Future<void> redirect() async{
  //   await Future.delayed(const Duration(seconds: 4));
  //   Navigator.pushReplacement(
  //     context,
  //     MaterialPageRoute(
  //       builder: (BuildContext context) => const Mainpage(),
  //     ),
  //   );
  // }

}
