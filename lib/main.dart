import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

const two_pi = 3.14 * 2;

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = 200.0;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Progress Indicator'),
        ),
        body: Center(
            child: TweenAnimationBuilder(
                tween: Tween(begin: 0.0, end: 1.0),
                duration: Duration(seconds: 4),
                builder: (context, value, child) {
                  int percentage = (value * 100).ceil();
                  return Container(
                    width: size,
                    height: size,
                    child: Stack(
                      children: [
                        // ShaderMask(
                        //   shaderCallback: (rect){
                        //     return SweepGradient(
                        //       startAngle: 0.0,
                        //       endAngle: two_pi,
                        //       center: Alignment.center,
                        //       colors: [Colors.blue, Colors.transparent]
                        //     ).createShader(rect);
                        //   },
                        Container(
                          width: size,
                          height: size,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: Image.asset(
                                          "assets/images/radial_scale.png")
                                      .image),
                              color: Colors.grey.withAlpha(55)),
                          //  ),
                        ),
                        Center(
                          child: Container(
                            width: size - 40,
                            height: size - 40,
                            decoration: BoxDecoration(
                                color: Colors.white, shape: BoxShape.circle),
                            child: Center(
                              child: Text(
                                "$percentage%",
                                style:
                                    TextStyle(fontSize: 55,
                                     color: Colors.red,
                                     fontWeight: FontWeight.bold
                                     ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                })),
      ),
    );
  }
}

/*
child: TweenAnimationBuilder(
            tween: Tween(begin: 0.0, end: 1.0),
            duration: Duration(seconds: 4),
            builder: (context, value, child) {
              int percentage = (value * 100).ceil();
              return Container(
                width: size,
                height: size,
                color: Colors.blue,
                child: Stack(
                  children: [
                    ShaderMask(
                      shaderCallback: (rect) {
                        return SweepGradient(
                            startAngle: 0.0,
                            endAngle: two_pi,
                            stops: [0.1, 0.1],
                            center: Alignment.center,
                            colors: [
                              Colors.blue,
                              Colors.grey.withAlpha(55)
                            ]).createShader(rect);
                      },
                      child: Container(
                        width: size,
                        height: size,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                      ),
                    ),
                    Center(
                      child: Container(
                        width: size - 40,
                        height: size - 40,
                        decoration: BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                        child: Center(
                          child: Text(
                            "$percentage",
                            style: TextStyle(
                              fontSize: 40,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          ),

*/
