import 'package:flutter/material.dart';

import 'package:smart_home_flutter_ui/model/smart_home_model.dart';
import 'package:smart_home_flutter_ui/screen/room_control_screen.dart';

import '../constants/app_colors.dart';

class RoomCard extends StatelessWidget {
  const RoomCard({super.key, required this.roomData});
  final SmartHomeModel roomData;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => RoomControlScreen(roomData: roomData)));
      },
      child: Container(
        width: size.width * 0.35,
        height: size.height * 0.5,
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(horizontal: 5),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColor.fgColor,
          borderRadius: BorderRadius.circular(size.width * 0.07),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(roomData.roomImage),
            colorFilter: ColorFilter.mode(
                AppColor.black.withOpacity(0.2), BlendMode.darken),
          ),
        ),
        child: Text(
          roomData.roomName,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColor.white,
          ),
        ),
      ),
    );
  }
}
