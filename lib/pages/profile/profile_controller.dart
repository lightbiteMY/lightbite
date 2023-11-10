import 'package:flutter/material.dart';
import 'package:lightbite/pages/profile/profile_page.dart';

class ProfileController extends StatefulWidget {
  const ProfileController({super.key});

  @override
  State<ProfileController> createState() => _ProfileControllerState();
}

class _ProfileControllerState extends State<ProfileController> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const ProfilePage();
  }
}
