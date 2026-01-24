import 'package:flutter/material.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ប្រើ Background Gradient ពណ៌ងងឹត (0xFF0B1120) តាមរូបភាពទី ១៤
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF1E293B), Color(0xFF0B1120)],
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 60),
            _buildProfileHeader(),

            const SizedBox(height: 30),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  _buildSectionTitle("ការប្រឡង និងលទ្ធផល"),
                  _buildGlassMenuItem(Icons.pedal_bike, "តារាងប្រឡងសាកល្បង"),
                  _buildGlassMenuItem(
                    Icons.emoji_events,
                    "តារាងលេខបានពិន្ទុខ្ពស់",
                  ),

                  _buildSectionTitle("ព័ត៌មាន និងទំនាក់ទំនង"),
                  _buildGlassMenuItem(Icons.format_quote, "សាររដ្ឋមន្ត្រី"),
                  _buildGlassMenuItem(Icons.favorite, "ណែនាំមិត្តភក្តិ"),
                  _buildGlassMenuItem(Icons.mail, "មតិយោបល់ / ទំនាក់ទំនង"),

                  _buildSectionTitle("ផ្សេងៗ"),
                  _buildGlassMenuItem(Icons.directions_car, "ដាក់ពាក្យ"),
                  _buildGlassMenuItem(Icons.settings, "កំណត់"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget សម្រាប់ Header (Profile)
  Widget _buildProfileHeader() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Container(
            height: 180,
            width: double.infinity,
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white.withOpacity(0.05),
              border: Border.all(
                color: Colors.white.withOpacity(0.5),
                width: 0.8,
              ),
            ),
            child: Row (
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  width: 150,
                  height: 130,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    image: DecorationImage(
                      image: AssetImage("assets/images/developer.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Expanded(
                //   child: Text(
                //     "កម្មវិធីនេះ បង្កើតឡើងក្នុងគោលបំណងនៃការសិក្សាប៉ុណ្ណោះ ។ "
                //         "ពួកយើងជាក្រុមនិសិត្ស ឆ្នាំទី៣ និងបង្កើត កម្មវិធីនេះដើម្បីបញ្ចប់ "
                //         "Assignment ថ្នាក់ Mobile Development បង្រៀនដោយ ល"
                //         "ោកគ្រូ សុខ ពិសិទ្ធ ។ អានបន្ថែមលម្អិតអំពីពួកយើង នឹង អំពីកម្មវិធីនេះ ។ ស"
                //         "ូមអរគុណ !!----------------------", style: TextStyle(
                //   fontSize: 15,
                // ),
                // ),
                // ),
              ],
            ),
          )
        ),
      ],
    );
  }

  // Widget សម្រាប់ចំណងជើងផ្នែក (Section Title)
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, bottom: 10, top: 10),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.cyanAccent.withOpacity(0.7),
          fontSize: 13,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  // Widget សម្រាប់ Menu Item (Glass Card)
  Widget _buildGlassMenuItem(IconData icon, String title) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.cyanAccent, size: 24),
        title: Text(
          title,
          style: const TextStyle(color: Colors.white, fontSize: 15),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          color: Colors.white24,
          size: 16,
        ),
        onTap: () {},
      ),
    );
  }
}
