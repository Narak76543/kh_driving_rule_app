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
          "អំពីក្រុមរបស់ពួកយើង",
          style: TextStyle(
            color: Color(0xFF1E293B),
            fontWeight: FontWeight.bold,
            fontSize: 20,
            fontFamily: 'kohsantepheap',
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle("អំពីគម្រោងនេះ"),
            _buildProjectDescription(),

            const SizedBox(height: 30),
            _buildSectionTitle("សមាជិកក្រុមរបស់យើង"),
            const SizedBox(height: 10),

            _buildMemberProfileCard(
              name: "សារ៉ាត់ ណារ៉ាក់",
              role: "អ្នកអភិវឌ្ឍន៍  សូហ្វវែរ",
              bio:
                  "និស្សិតឆ្នាំទី៣ ជំនាញអភិវឌ្ឍន៍កម្មវិធីទូរស័ព្ទ ដែលមានចំណូលចិត្តក្នុងការបង្កើតដំណោះស្រាយបច្ចេកវិទ្យាដ៏រហ័ស និងមានប្រសិទ្ធភាព។ ផ្តោតសំខាន់លើការសរសេរកូដឱ្យមានរបៀប និងងាយស្រួលក្នុងការថែទាំ។",
              skills: ["Flutter", "Python", "FastAPI", "+PosgrSQL"],
              imagePath: "assets/images/narak.png",
            ),

            _buildMemberProfileCard(
              name: "សេម វិសុត",
              role: "អ្នកអភិវឌ្ឍន៍  សូហ្វវែរ",
              bio:
                  "ជម្រាបសួរ! ខ្ញុំឈ្មោះ សេម វិសុតខ្ញុំជាអ្នកអភិវឌ្ឍន៍កម្មវិធីចំនួន ២ ឆ្នាំបទពិសោធន៍។ ខ្ញុំមានជំនាញខាងការបង្កើតគេហទំព័រទំនើបៗ និងកម្មវិធីទូរស័ព្ទ។ ខ្ញុំចូលចិត្តដោះស្រាយបញ្ហាកម្មវិធី និងបង្កើតដំណោះស្រាយដែលមានប្រសិទ្ធិភាពខ្ពស់។បច្ចុប្បន្ន ខ្ញុំកំពុងសិក្សាថ្នាក់បរិញ្ញាបត្រផ្នែក អភិវឌ្ឍន៍  សូហ្វវែរ នៅសាកលវិទ្យាល័យន័រតុន។ បច្ចុប្បន្ន ខ្ញុំកំពុងធ្វើការជាមួយបច្ចេកវិទ្យាទំនើបៗដូចជា Java Programming, Python, Flutter, និង ឧបករណ៍ AI ជាដើម។ចំណាប់អារម្មណ៍ផ្ទាល់ខ្លួន៖ ខ្ញុំចូលចិត្តសរសេរកូដនៅពេលយប់ជាមួយកាហ្វេមួយកែវ និងស្តាប់តន្ត្រីសម័យពីដើម។",
              skills: ["Flutter", "Python", "Laravel", "+2"],
              imagePath: "assets/images/visut2.jpg",
            ),

            _buildMemberProfileCard(
              name: "ជុំ ភូឡា",
              role: "អ្នកអភិវឌ្ឍន៍ គេហទំព័រ",
              bio:
                  "ខ្ញុំជាអ្នកចូលចិត្តបច្ចេកវិទ្យា និងការអភិវឌ្ឍកម្មវិធី។ ខ្ញុំកំពុងសិក្សា Web Development និង Mobile App Development និងចង់ក្លាយជាអ្នកអភិវឌ្ឍកម្មវិធីជំនាញ។ ខ្ញុំស្រលាញ់ការស្រាវជ្រាវ ការសិក្សាថ្មីៗ និងការបង្កើត Project ផ្ទាល់ខ្លួន។",
              skills: ["HTML", "CSS", "Bootstrap", "JavaScripts", "+Git"],
              imagePath: "assets/images/pula.png",
            ),

            _buildMemberProfileCard(
              name: "ង៉ូវ ម៉េងហៃ",
              role: "Full Stack Developer",
              bio:
                  "អ្នកជំនាញត្រួតពិនិត្យ និងស្វែងរកចំណុចខ្វះខាត ដើម្បីធានាថាគ្រប់មុខងារទាំងអស់របស់កម្មវិធី ដំណើរការបានយ៉ាងរលូន និងគ្មានកំហុស។ ផ្តោតលើការផ្តល់ជូននូវបទពិសោធន៍ដ៏ល្អបំផុតសម្រាប់អ្នកប្រើប្រាស់។",
              skills: ["React.Js", "Flutter", "Flask", "+1"],
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
          fontFamily: 'KohSantepheap',
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
          const Text(
            "កម្មវិធី 'ច្បាប់ចរាចរណ៍' ត្រូវបានបង្កើតឡើងក្នុងគោលបំណងសិក្សា និងធ្វើកិច្ចការស្រាវជ្រាវ ឆ្នាំទី៣ ថ្នាក់អភិវឌ្ឍន៍កម្មវិធីទូរស័ព្ទដៃ។ យើងមានបំណងធ្វើការអនុវត្តលើមេរៀន និងម្យ៉ាងវិញទៀតអាចយល់ដឹងអំពីច្បាប់ចរាចរណ៍នៅកម្ពុជា។",
            style: TextStyle(
              color: Color(0xFF64748B),
              fontSize: 14,
              height: 1.6,
              fontFamily: 'kohsantepheap',
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
          _buildTechRow(Icons.bolt, "Architecture", "Flutter SDK 3.10.1"),
          _buildTechRow(Icons.layers, "State Management", "GetX"),
          _buildTechRow(
            Icons.storage,
            "Data Handling",
            "Local JSON & PDF (Dio, Open_filex)",
          ),
          _buildTechRow(
            Icons.font_download,
            "Typography",
            "KohSantepheap , Poppins",
          ),
          _buildTechRow(
            Icons.devices,
            "Tools",
            "VS Code , Android Studio, GitHub , GitBash",
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
            fontFamily: 'kohsantepheap',
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1E293B),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          role,
          style: TextStyle(
            fontFamily: 'kohsantepheap',
            fontSize: 14,
            color: Colors.redAccent,
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
            fontFamily: 'kohsantepheap',
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
            "ឆែកមើលប្រវត្តិរូប",
            style: TextStyle(
              fontFamily: 'kohsantepheap',
              color: kPrimaryColor,
              fontWeight: FontWeight.w600,
              fontSize: 17,
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
