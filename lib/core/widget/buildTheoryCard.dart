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
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(
          color: Colors.grey.withOpacity(0.1),
          width: 1,
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
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 14,
                  color: Colors.grey[300],
                ),
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
        color: kPrimaryColor.withOpacity(0.08),
        shape: BoxShape.circle,
      ),
      child: item.icon != null && item.icon!.isNotEmpty
          ? Image.asset(
        'assets/images/${item.icon}',
        color: kPrimaryColor,
        fit: BoxFit.contain,
        errorBuilder: (context, error, stackTrace) =>
        const Icon(Icons.image_not_supported, color: Colors.grey),
      )
          : const Icon(Icons.book, color: kPrimaryColor),
    );
  }

  Widget _buildTextContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          item.title ?? "",
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1E293B),
            fontFamily: 'KohSantepheap',
          ),
        ),
        const SizedBox(height: 6),
        Text(
          item.content ?? "",
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 13,
            color: Colors.grey[600],
            fontFamily: 'KohSantepheap',
            height: 1.4,
          ),
        ),
      ],
    );
  }
}
