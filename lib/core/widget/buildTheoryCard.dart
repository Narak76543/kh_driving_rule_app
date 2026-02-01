
import 'package:flutter/material.dart';
import 'package:kh_driving_rule/app/data/models/lesson_model.dart';
import 'package:kh_driving_rule/const/color.dart';

class TheoryCard extends StatelessWidget {
  final LessonModel item;
  final VoidCallback? onTap;
  const TheoryCard({super.key, required this.item, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Color(0xff1a4958),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Colors.white.withOpacity(0.2),
          width: 1.2,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(15),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [

                // Icon Section
                _buildIcon(),

                const SizedBox(width: 16),
                // Text Section
                Expanded(child: _buildTextContent()),

                Container(
                  height: 80,
                  width: 1,
                  decoration: BoxDecoration(
                    color: whiteColor
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildIcon() {
    return Container(
      height: 56,
      width: 56,
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.white.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: item.icon != null && item.icon!.isNotEmpty
          ? Image.asset(
        'assets/images/${item.icon}',
        color: Colors.white,
        fit: BoxFit.contain,
        // បន្ថែម errorBuilder ដើម្បីការពារកុំឱ្យគាំងបើរកឯកសាររូបភាពមិនឃើញ
        errorBuilder: (context, error, stackTrace) =>
        const Icon(Icons.image_not_supported, color: Colors.white24),
      )
          : const Icon(Icons.book, color: Colors.white70),
    );
  }

  Widget _buildTextContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          item.title ?? "",
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          item.content ?? "",
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 13,
            color: Colors.white.withOpacity(0.7), // ប្រើ Opacity សម្រាប់ Body text
            height: 1.4,
          ),
        ),
      ],
    );
  }
}
