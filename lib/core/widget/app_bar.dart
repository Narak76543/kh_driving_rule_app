import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:kh_driving_rule/const/color.dart';

class CustomDrivingAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomDrivingAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
        child: Container(
          height: preferredSize.height + MediaQuery.of(context).padding.top,
          decoration: BoxDecoration(
            color: kPrimaryColor,
            border: Border(
              bottom: BorderSide(color: Colors.white.withOpacity(0.1), width: 0.5),
            ),
          ),
          child: SafeArea(
            bottom: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                children: [
                  // ១. Logo ខាងឆ្វេង
                  Image.asset(
                    'assets/images/drive.png',
                    height: 35,
                    color: Colors.white,
                    errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.drive_eta, color: Colors.white),
                  ),
                  const SizedBox(width: 12),

                  // ២. ចំណងជើងអេក្រង់
                  Expanded(
                    child: Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'KohSantepheab', // ប្រើ Font របស់អ្នក
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),

                  // ៣. ផ្នែក Icon Buttons ខាងស្តាំ
                  _buildRoundedAction('assets/images/app-logo.png'),
                  const SizedBox(width: 8),
                  _buildRoundedAction('assets/images/m-logo.png', isProfile: true),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  Widget _buildRoundedAction(String assetPath, {bool isProfile = false}) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white.withOpacity(0.2)),
      ),
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            assetPath,
            height: 25,
            width: 25,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) =>
                Icon(isProfile ? Icons.person : Icons.apps, size: 20, color: Colors.white70),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(65); // បន្ថយទំហំបន្តិចឱ្យសមសួន
}
