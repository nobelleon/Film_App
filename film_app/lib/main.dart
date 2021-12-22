import 'package:film_app/layar/layar_utama.dart';
import 'package:film_app/opening.dart';
import 'package:film_app/utils/sized_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            SizeConfig().init(constraints, orientation);
            SystemChrome.setPreferredOrientations([
              DeviceOrientation.portraitUp,
            ]);

            return GetMaterialApp(
              title: 'Film App',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: Colors.purple,
              ),
              home: Opening(),
            );
          },
        );
      },
    );
  }
}
