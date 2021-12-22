import 'package:film_app/utils/sized_config.dart';
import 'package:film_app/widgets/VideoCall/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websafe_svg/websafe_svg.dart';

class VideoCallScreen extends StatefulWidget {
  @override
  _VideoCallScreenState createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        bottom: false,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: Image.asset(
                'images/assets/Tommy Silvian.png',
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              child: customAppBar(),
              top: 0,
              left: 0,
              right: 0,
            ),
            Positioned(
              top: 45,
              bottom: 0,
              left: 50,
              right: 0,
              child: Container(
                color: Colors.transparent,
                child: Stack(
                  children: <Widget>[
                    Image.asset(
                      'images/assets/guide cinema 21.png',
                      height: 150,
                      width: 150,
                    ),
                    Positioned(
                      bottom: 24,
                      left: 0,
                      right: 0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 32),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                SizedBox(
                                    width: 56,
                                    height: 56,
                                    child: IconButton(
                                        icon: WebsafeSvg.asset(
                                            'images/assets/flip.svg'),
                                        onPressed: () {})),
                                SizedBox(
                                    width: 56,
                                    height: 56,
                                    child: IconButton(
                                        icon: WebsafeSvg.asset(
                                            'images/assets/mic.svg'),
                                        onPressed: () {})),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 90),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                SizedBox(
                                  width: 56,
                                  height: 56,
                                  child: IconButton(
                                    icon: WebsafeSvg.asset(
                                        'images/assets/flip.svg'),
                                    onPressed: () {},
                                  ),
                                ),
                                SizedBox(
                                  width: 56,
                                  height: 56,
                                  child: IconButton(
                                      icon: Stack(
                                        children: <Widget>[
                                          Positioned(
                                            top: 0,
                                            left: 0,
                                            right: 0,
                                            bottom: 0,
                                            child: WebsafeSvg.asset(
                                                'images/assets/video.svg'),
                                          ),
                                          Positioned(
                                            top: 7,
                                            left: 7,
                                            right: 7,
                                            bottom: 7,
                                            child: WebsafeSvg.asset(
                                                'images/assets/video_camera.svg'),
                                          ),
                                        ],
                                      ),
                                      onPressed: () {}),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 140),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  GestureDetector(
                                    onTap: () {
                                      Get.back();
                                    },
                                    child: Container(
                                      height: SizeConfig.heightMultiplier * 8,
                                      width: SizeConfig.widthMultiplier * 16,
                                      decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                                offset: Offset(4, 8),
                                                color: Colors.black26,
                                                blurRadius: 8)
                                          ],
                                          shape: BoxShape.circle,
                                          color: Colors.purple[400]),
                                      child: Icon(
                                        Icons.call_end,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget customAppBar() => CustomAppBar(
        color: Colors.transparent,
        centerTitle: true,
        leading: IconButton(
            icon: WebsafeSvg.asset('images/assets/arrow_left.svg'),
            onPressed: () {
              Get.back();
            }),
        title: Column(
          children: <Widget>[
            Text(
              'Tommy Silvian',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            Text('19:05', style: TextStyle(color: Colors.white, fontSize: 14)),
          ],
        ),
        actions: <Widget>[
          IconButton(
              icon: WebsafeSvg.asset('images/assets/add.svg'),
              onPressed: () {}),
          IconButton(
              icon: WebsafeSvg.asset('images/assets/message_circle.svg'),
              onPressed: () {}),
        ],
      );
}
