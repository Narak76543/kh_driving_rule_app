import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kh_driving_rule/const/color.dart';

class AboutUsView extends StatelessWidget {
  const AboutUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: kPrimaryColor,
            size: 20,
          ),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          "About Us",
          style: TextStyle(
            color: Color(0xFF1E293B),
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle("About Project"),
            _buildProjectDescription(),

            const SizedBox(height: 30),
            _buildSectionTitle("Our Team Members"),
            const SizedBox(height: 10),

            _buildMemberProfileCard(
              name: "Sarat Narak",
              role: "Lead Developer",
              bio:
                  "Narak is a 3rd-year student specializing in Flutter & FastAPI development, focused on building efficient mobile solutions.",
              skills: ["Flutter", "Dart", "FastAPI", "Git"],
              imagePath: "assets/images/narak.png",
            ),

            _buildMemberProfileCard(
              name: "Sem Visut",
              role: "Flutter Developer",
              bio:
                  "Creative designer with a passion for clean, user-friendly interfaces and modern mobile application layouts.",
              skills: ["Figma", "Design", "Color Theory", "+2"],
              imagePath: "assets/images/visut.png",
            ),

            _buildMemberProfileCard(
              name: "Chum Phula",
              role: "Web Developer",
              bio:
                  "Focused on structuring traffic rule data and ensuring all technical information is accurate and up-to-date.",
              skills: ["Research", "JSON", "Database", "+3"],
              imagePath: "assets/images/member3.png",
            ),

            _buildMemberProfileCard(
              name: "Ngov Menghai",
              role: "Full Stack Developer",
              bio:
                  "Responsible for testing application features and ensuring a smooth, bug-free experience for all users.",
              skills: ["Testing", "Bug Fix", "Analysis", "+1"],
              imagePath: "assets/images/menghai.png",
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Color(0xFF1E293B),
        ),
      ),
    );
  }

  Widget _buildProjectDescription() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ១. ការពិពណ៌នាទូទៅ
          const Text(
            "កម្មវិធី 'ច្បាប់ចរាចរណ៍' ត្រូវបានបង្កើតឡើងក្នុងគោលបំណងសិក្សា Assignment ឆ្នាំទី៣ ថ្នាក់ Mobile App Development។ យើងមានបំណងជួយសម្រួលដល់ការសិក្សា និងយល់ដឹងអំពីច្បាប់ចរាចរណ៍នៅកម្ពុជា។",
            style: TextStyle(
              color: Color(0xFF64748B),
              fontSize: 14,
              height: 1.6,
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: Divider(color: Color(0xFFF1F5F9), thickness: 1.5),
          ),
          const Text(
            "Technical Specifications:",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: Color(0xFF1E293B),
            ),
          ),
          const SizedBox(height: 10),
          _buildTechRow(
            Icons.bolt,
            "Architecture",
            "Flutter SDK ^3.10.1 (Material 3)",
          ),
          _buildTechRow(
            Icons.layers,
            "State Management",
            "GetX Framework (^4.7.3)",
          ),
          _buildTechRow(
            Icons.storage,
            "Data Handling",
            "Local JSON & PDF (Dio, Open_filex)",
          ),
          _buildTechRow(
            Icons.font_download,
            "Typography",
            "KohSantepheap (Khmer/English Support)",
          ),
          _buildTechRow(
            Icons.devices,
            "Optimization",
            "High-performance on Samsung A05 & MSI Cyborg",
          ),
        ],
      ),
    );
  }

  Widget _buildTechRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 16, color: kPrimaryColor),
          const SizedBox(width: 12),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 13,
                  color: Color(0xFF64748B),
                ),
                children: [
                  TextSpan(
                    text: "$label: ",
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF1E293B),
                    ),
                  ),
                  TextSpan(
                    text: value,
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillChip(String label) {
    bool isSpecial = label.startsWith('+');
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        color: isSpecial ? const Color(0xFF3B82F6) : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isSpecial ? Colors.transparent : Colors.grey.withOpacity(0.2),
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 12,
          color: isSpecial ? Colors.white : Colors.grey[600],
          fontWeight: isSpecial ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}

Widget _buildMemberProfileCard({
  required String name,
  required String role,
  required String bio,
  required List<String> skills,
  required String imagePath,
}) {
  return Container(
    margin: const EdgeInsets.only(bottom: 20),
    padding: const EdgeInsets.all(24),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 15,
          offset: const Offset(0, 8),
        ),
      ],
    ),
    child: Column(
      children: [
        // ផ្នែករូបថតសមាជិក
        Container(
          width: 110,
          height: 110,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.grey.withOpacity(0.1), width: 4),
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          name,
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1E293B),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          role,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 14,
            color: Colors.grey[400],
            letterSpacing: 0.8,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 16),

        // Skills Chips (Wrap)
        Wrap(
          spacing: 8,
          runSpacing: 8,
          alignment: WrapAlignment.center,
          children: skills.map((skill) => _buildSkillChip(skill)).toList(),
        ),
        const SizedBox(height: 20),

        Text(
          bio,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 14,
            color: Colors.grey[600],
            height: 1.5,
          ),
        ),
        const SizedBox(height: 20),

        const Divider(height: 1),
        const SizedBox(height: 10),
        TextButton(
          onPressed: () {},
          child: const Text(
            "VIEW PROFILE",
            style: TextStyle(
              fontFamily: 'Poppins',
              color: kPrimaryColor,
              fontWeight: FontWeight.w600,
              fontSize: 13,
              letterSpacing: 1.1,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget _buildSkillChip(String label) {
  bool isSpecial = label.startsWith('+');
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
    decoration: BoxDecoration(
      color: isSpecial ? const Color(0xFF3B82F6) : Colors.white,
      borderRadius: BorderRadius.circular(20),
      border: Border.all(
        color: isSpecial ? Colors.transparent : Colors.grey.withOpacity(0.2),
      ),
    ),
    child: Text(
      label,
      style: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 11,
        color: isSpecial ? Colors.white : Colors.grey[600],
        fontWeight: isSpecial ? FontWeight.bold : FontWeight.w500,
      ),
    ),
  );
}
