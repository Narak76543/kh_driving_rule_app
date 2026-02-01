import 'package:flutter/material.dart';
import 'package:kh_driving_rule/const/color.dart';
import '../../app/data/models/law_model.dart';

class LawCard extends StatelessWidget {
  final LawModel law;
  final VoidCallback? onDownload;
  final VoidCallback? onTap;

  const LawCard({
    super.key,
    required this.law,
    this.onDownload,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        decoration: BoxDecoration(
          color: kPrimaryColor.withOpacity(0.8),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.white.withOpacity(0.1),
            width: 1.2,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Export
            Expanded(
              child: Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage('assets/images/${law.coverImage}'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                  // Export/Download
                  Positioned(
                    top: 15,
                    right: 15,
                    child: CircleAvatar(
                      backgroundColor: Colors.blueAccent.withOpacity(0.7),
                      radius: 18,
                      child: IconButton(
                        icon: const Icon(
                          Icons.file_download_outlined,
                          color: Colors.white,
                          size: 18,
                        ),
                        onPressed: onDownload,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
              child: Text(
                law.title,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}