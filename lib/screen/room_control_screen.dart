import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_home_flutter_ui/constants/app_colors.dart';
import 'package:smart_home_flutter_ui/model/smart_home_model.dart';
import 'package:smart_home_flutter_ui/screen/widgets/device_switch.dart';
import 'package:smart_home_flutter_ui/screen/widgets/glass_morphism.dart';

class RoomControlScreen extends StatefulWidget {
  const RoomControlScreen({super.key, required this.roomData});
  final SmartHomeModel roomData;

  @override
  State<RoomControlScreen> createState() => _RoomControlScreenState();
}

class _RoomControlScreenState extends State<RoomControlScreen> {
  @override
  Widget build(BuildContext context) {
    final SmartHomeModel roomData = this.widget.roomData;
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(roomData.roomImage), fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: AppColor.fgColor.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(
                          Icons.arrow_back_ios_new,
                          color: AppColor.white,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppColor.fgColor.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(
                        Icons.settings,
                        color: AppColor.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            bottomCard(size, roomData),
          ],
        ),
      ),
    );
  }

  Widget bottomCard(Size size, SmartHomeModel roomData) {
    return GlassMorphism(
      child: Container(
        width: double.infinity,
        height: size.height * 0.6,
        // color: AppColor.white.withOpacity(0.5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    roomData.roomName,
                    style: const TextStyle(
                      color: AppColor.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                    child: FittedBox(
                      child: CupertinoSwitch(
                        value: roomData.roomStatus,
                        activeColor: AppColor.white,
                        trackColor: AppColor.black.withOpacity(.3),
                        thumbColor: AppColor.fgColor,
                        onChanged: (value) {
                          setState(() {
                            roomData.roomStatus = value;
                          });
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 60),
              child: Text.rich(
                TextSpan(
                    text: 'Your ',
                    style: const TextStyle(
                      color: AppColor.white,
                      fontSize: 16,
                    ),
                    children: [
                      TextSpan(text: roomData.roomName),
                      const TextSpan(text: ' is connected with '),
                      TextSpan(text: roomData.devices!.length.toString()),
                      const TextSpan(text: ' and '),
                      TextSpan(
                          text: '${roomData.userAccess} users',
                          style: const TextStyle(
                            decoration: TextDecoration.underline,
                          )),
                      const TextSpan(text: ' have access for '),
                      TextSpan(text: roomData.roomName),
                    ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                roomData.roomTemperature,
                style: const TextStyle(
                  fontSize: 30,
                  color: AppColor.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Divider(
              color: AppColor.white.withOpacity(0.5),
              thickness: 1,
              endIndent: 20,
              indent: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Devices',
                    style: TextStyle(
                      fontSize: 20,
                      color: AppColor.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_forward_ios),
                    color: AppColor.white,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.22,
              child: ListView.builder(
                itemCount: roomData.devices!.length + 2,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  if (index == 0 || roomData.devices!.length + 1 == index) {
                    return SizedBox(width: 10);
                  }
                  final data = roomData.devices![index - 1];
                  return DeviceSwitch(data: data);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
