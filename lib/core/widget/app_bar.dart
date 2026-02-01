// import 'dart:ui';
// import 'package:flutter/material.dart';
// import 'package:kh_driving_rule/const/color.dart';
//
// class CustomDrivingAppBar extends StatelessWidget implements PreferredSizeWidget {
//   final String title;
//
//   const CustomDrivingAppBar({super.key, required this.title});
//
//   @override
//   Widget build(BuildContext context) {
//     return ClipRRect(
//       child: BackdropFilter(
//         filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
//         child: Container(
//           height: preferredSize.height + MediaQuery.of(context).padding.top,
//           decoration: BoxDecoration(
//             color: kPrimaryColor,
//             border: Border(
//               bottom: BorderSide(color: Colors.white.withOpacity(0.1), width: 0.5),
//             ),
//           ),
//           child: SafeArea(
//             bottom: false,
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 12.0),
//               child: Row(
//                 children: [
//                   // ១. Logo ខាងឆ្វេង
//                   Image.asset(
//                     'assets/images/drive.png',
//                     height: 35,
//                     color: Colors.white,
//                     errorBuilder: (context, error, stackTrace) =>
//                     const Icon(Icons.drive_eta, color: Colors.white),
//                   ),
//                   const SizedBox(width: 12),
//                   Expanded(
//                     child: Text(
//                       title,
//                       style: const TextStyle(
//                         color: Colors.white,
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                         fontFamily: 'KohSantepheab',
//                       ),
//                       maxLines: 1,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                   ),
//
//                   // ៣. ផ្នែក Icon Buttons ខាងស្តាំ
//                   _buildRoundedAction('assets/images/app-logo.png'),
//                   const SizedBox(width: 8),
//                   _buildRoundedAction('assets/images/m-logo.png', isProfile: true),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//   Widget _buildRoundedAction(String assetPath, {bool isProfile = false}) {
//     return Container(
//       height: 40,
//       width: 40,
//       decoration: BoxDecoration(
//         color: Colors.white.withOpacity(0.1),
//         shape: BoxShape.circle,
//         border: Border.all(color: Colors.white.withOpacity(0.2)),
//       ),
//       child: Center(
//         child: ClipRRect(
//           borderRadius: BorderRadius.circular(20),
//           child: Image.asset(
//             assetPath,
//             height: 25,
//             width: 25,
//             fit: BoxFit.contain,
//             errorBuilder: (context, error, stackTrace) =>
//                 Icon(isProfile ? Icons.person : Icons.apps, size: 20, color: Colors.white70),
//           ),
//         ),
//       ),
//     );
//   }
//
//   @override
//   Size get preferredSize => const Size.fromHeight(65); // បន្ថយទំហំបន្តិចឱ្យសមសួន
// }

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
        // បង្កើនកម្រិត Blur ដើម្បីឱ្យ Content ខាងក្រោយមើលទៅរលាយចូលគ្នាបានល្អ
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: Container(
          height: preferredSize.height + MediaQuery.of(context).padding.top,
          decoration: BoxDecoration(
            // ១. ប្តូរមកប្រើពណ៌សថ្លាសម្រាប់ Light Mode
            color: Colors.white.withOpacity(0.8),
            border: Border(
              bottom: BorderSide(
                color: Colors.black.withOpacity(0.05), // បន្ទាត់ខណ្ឌស្តើងបំផុត
                width: 1,
              ),
            ),
          ),
          child: SafeArea(
            bottom: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  // ២. Logo ខាងឆ្វេង (ប្រើពណ៌ Primary របស់អ្នកវិញ)
                  Image.asset(
                    'assets/images/drive.png',
                    height: 32,
                    color: kPrimaryColor, // ពណ៌ Teal 0xFF1A4958
                    errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.drive_eta, color: kPrimaryColor),
                  ),
                  const SizedBox(width: 12),

                  // ៣. ចំណងជើងអេក្រង់ (ប្រើពណ៌ងងឹតងាយអាន)
                  Expanded(
                    child: Text(
                      title,
                      style: const TextStyle(
                        color: Color(0xFF1E293B),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'KohSantepheab',
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),

                  // ៤. ផ្នែក Icon Buttons ខាងស្តាំ បែប Light Mode
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
      height: 38,
      width: 38,
      decoration: BoxDecoration(
        // ប្រើផ្ទៃពណ៌ប្រផេះខ្ចីបំផុត
        color: Colors.grey.withOpacity(0.1),
        shape: BoxShape.circle,
        border: Border.all(color: Colors.black.withOpacity(0.05)),
      ),
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.asset(
            assetPath,
            height: 24,
            width: 24,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) =>
                Icon(isProfile ? Icons.person : Icons.apps,
                    size: 20,
                    color: kPrimaryColor.withOpacity(0.6)),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
