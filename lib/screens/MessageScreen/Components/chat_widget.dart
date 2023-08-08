import 'package:flutter/material.dart';

import '../../../model/chat_models.dart';
import '../../../utils/sized_config.dart';

class ChatWidget extends StatelessWidget {
  final ChatModels msg;
  final int index;

  const ChatWidget({Key key, this.msg, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisAlignment: msg.pengirim || index == 3
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        children: [
          index == 1 || msg.pengirim
              ? SizedBox(
                  width: SizeConfig.widthMultiplier * 12,
                )
              : Container(
                  height: SizeConfig.heightMultiplier * 4.5,
                  width: SizeConfig.widthMultiplier * 12,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(msg.image), fit: BoxFit.cover),
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(color: Colors.grey.shade500, blurRadius: 2)
                      ],
                      border: msg.pengirim
                          ? Border.all(
                              width: 2,
                              color: Colors.white,
                            )
                          : null),
                ),
          ConstrainedBox(
            constraints:
                BoxConstraints(maxWidth: SizeConfig.widthMultiplier * 70),
            child: Container(
              margin: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                  color: msg.pengirim ? Colors.purple : Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 2,
                    )
                  ]),
              child: Padding(
                padding: EdgeInsets.only(
                  left: SizeConfig.widthMultiplier * 2,
                  right: SizeConfig.widthMultiplier * 9,
                  top: SizeConfig.heightMultiplier * 1.5,
                  bottom: SizeConfig.heightMultiplier * 1,
                ),
                child: Text(
                  "${msg.pesan}",
                  style: TextStyle(
                      color: msg.pengirim ? Colors.white : Colors.black,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
        ],
      ),
      Row(
        mainAxisAlignment:
            msg.pengirim ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          index == 1 || index == 3
              ? SizedBox()
              : Padding(
                  padding: EdgeInsets.only(
                      left: msg.pengirim ? SizeConfig.widthMultiplier * 0 : 50),
                  child: Text(msg.waktu,
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: SizeConfig.textMultiplier * 1.5,
                          color: Colors.grey.shade500)),
                ),
        ],
      ),
      index == 0
          ? SizedBox(height: SizeConfig.heightMultiplier * 3)
          : SizedBox(),
      index == 2
          ? SizedBox(height: SizeConfig.heightMultiplier * 3)
          : SizedBox(),
    ]);
  }
}
