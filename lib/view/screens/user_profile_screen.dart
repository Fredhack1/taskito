import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taskito/view/components/my_options_sheet.dart';
import 'package:taskito/view/components/simple_list_component.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Profile',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w700,
                color: Theme.of(context).colorScheme.primary,
                letterSpacing: 2,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        SingleChildScrollView(
          child: Column(
            children: [
              // Profile Picture
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    shape: const RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20)),
                    ),
                    builder: (context) => const MyOptionsSheet(),
                  );
                },
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    image: const DecorationImage(
                      image: AssetImage("assets/images/user.png"),
                      fit: BoxFit.cover,
                    ),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Theme.of(context).colorScheme.secondary,
                      width: 2,
                    ),
                    // borderRadius: BorderRadius.circular(100),
                  ),
                  padding: const EdgeInsets.all(20.0),
                  // child: Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     // label
                  //     Center(
                  //       child: Text(
                  //         "Profile Picture",
                  //         style: TextStyle(
                  //           fontWeight: FontWeight.bold,
                  //           color: Theme.of(context).colorScheme.primary,
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                ),
              ),
              const SizedBox(height: 20),
              // Name
              Center(
                child: Text(
                  "User's Name",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Edit Profile
              const SimpleListComponent(
                label: "Edit Profile",
                icon: CupertinoIcons.forward,
              ),
              const SizedBox(height: 20),

              // Change Password
              const SimpleListComponent(
                label: "Change Password",
                icon: CupertinoIcons.forward,
              ),
              const SizedBox(height: 20),

              // Logout
              const SimpleListComponent(
                label: "Logout",
                icon: Icons.logout,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ],
    );
  }
}
