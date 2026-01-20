import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDrivingAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final String title;

  const CustomDrivingAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: Container(
          height: preferredSize.height + MediaQuery.of(context).padding.top,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.08),
            border: Border(
              bottom: BorderSide(
                color: Colors.white.withOpacity(0.15),
                width: 1.5,
              ),
            ),
          ),
          child: SafeArea(
            bottom: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.white,
                      size: 20,
                    ),
                    onPressed: () => Get.back(),
                  ),

                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
                  ),

                  Container(
                    width: 40,
                    height: 40,
                    margin: const EdgeInsets.only(right: 8),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.white.withOpacity(0.2)),
                    ),
                    child: const Icon(
                      Icons.person,
                      color: Colors.white70,
                      size: 26,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}
