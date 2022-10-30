import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:smart_home_flutter_ui/constants/app_colors.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Drawer(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(50),
            bottomRight: Radius.circular(50),
          ),
        ),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            color: AppColor.fg1Color,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(50),
              bottomRight: Radius.circular(50),
            ),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Builder(builder: (context) {
                    return IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.close,
                        color: AppColor.white,
                      ),
                    );
                  }),
                ],
              ),
              Row(
                children: [
                  Container(
                    width: size.width * 0.2,
                    height: size.width * 0.2,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image: NetworkImage(
                            "https://randomuser.me/api/portraits/women/13.jpg"),
                        fit: BoxFit.cover,
                      ),
                      border: Border.all(width: 2, color: AppColor.white),
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Hi Vaishali",
                        style: TextStyle(
                          color: AppColor.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                            foregroundColor: AppColor.white,
                            side: const BorderSide(color: AppColor.white),
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            )),
                        child: const Text(
                          "Edit Profile",
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Divider(
                thickness: 0.5,
                color: AppColor.white,
                height: 40,
              ),
              drawerTile(Icons.people_alt_outlined, "Manage Users", () {}),
              drawerTile(Icons.tv_outlined, "Devices", () {}),
              drawerTile(Icons.bed, "Rooms", () {}),
              drawerTile(Icons.music_note, "Music", () {}),
              drawerTile(Icons.settings, "Settings", () {}),
              drawerTile(Icons.help_outline, "Help", () {}),
              const Spacer(),
              drawerTile(Icons.power_settings_new_outlined, "Logout", () {}),
            ],
          ),
        ),
      ),
    );
  }

  ListTile drawerTile(IconData icon, String title, VoidCallback ontap) {
    return ListTile(
      onTap: ontap,
      contentPadding: EdgeInsets.zero,
      horizontalTitleGap: 0,
      leading: Icon(
        icon,
        color: AppColor.white,
      ),
      title: Text(
        title,
        style: const TextStyle(color: AppColor.white),
      ),
    );
  }
}
