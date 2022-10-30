import 'package:flutter/material.dart';

import 'package:smart_home_flutter_ui/constants/app_colors.dart';
import 'package:smart_home_flutter_ui/screen/room_card.dart';
import 'package:smart_home_flutter_ui/screen/widgets/custom_drawer.dart';

import '../model/smart_home_model.dart';

class SmartHomeScreen extends StatefulWidget {
  const SmartHomeScreen({super.key});

  @override
  State<SmartHomeScreen> createState() => _SmartHomeScreenState();
}

class _SmartHomeScreenState extends State<SmartHomeScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: CustomDrawer(),
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Builder(
                    builder: (context) {
                      return IconButton(
                          onPressed: () {
                            Scaffold.of(context).openDrawer();
                          },
                          icon: Icon(Icons.menu));
                    }
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "27\u00b0",
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Container(
                        width: 90,
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: AppColor.white,
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 10,
                                  spreadRadius: 5,
                                  color: AppColor.black.withOpacity(.1)),
                            ],
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(35),
                              bottomLeft: Radius.circular(35),
                            )),
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: const BoxDecoration(
                            color: AppColor.fgColor,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.add,
                            size: 30,
                            color: AppColor.white,
                          ),
                        ),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Hi Vaishali",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "Welcome to your Smart Home",
                        style: TextStyle(
                          fontSize: 18,
                          color: AppColor.fgColor.withOpacity(.5),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: double.infinity,
                    height: 70,
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: AppColor.white,
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 10,
                              spreadRadius: 5,
                              color: AppColor.black.withOpacity(.1)),
                        ],
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(35),
                          bottomLeft: Radius.circular(35),
                        )),
                    child: Row(
                      children: [
                        userPicture(
                            "https://randomuser.me/api/portraits/men/51.jpg"),
                        userPicture(
                            "https://randomuser.me/api/portraits/women/13.jpg"),
                        userPicture(
                            "https://randomuser.me/api/portraits/women/45.jpg"),
                        userPicture(
                            "https://randomuser.me/api/portraits/women/87.jpg"),
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: AppColor.fgColor.withOpacity(.1),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.add,
                            size: 30,
                            color: AppColor.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "All Rooms",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.arrow_forward_ios),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: smartHomeData.length + 2,
              itemBuilder: (context, index) {
                if (index == 0 || smartHomeData.length + 1 == index) {
                  return Container(
                    width: 15,
                    height: size.height * 0.5,
                    color: Colors.transparent,
                  );
                }
                final data = smartHomeData[index - 1];
                return RoomCard(roomData: data);
              },
            ),
          )
        ],
      )),
    );
  }

  Container userPicture(String imageUrl) {
    return Container(
      width: 50,
      height: 50,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
          color: AppColor.fgColor.withOpacity(.1),
          shape: BoxShape.circle,
          image: DecorationImage(image: NetworkImage(imageUrl))),
    );
  }
}
