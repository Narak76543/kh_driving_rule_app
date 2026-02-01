import 'package:flutter/material.dart';
import 'package:kh_driving_rule/const/color.dart';
import 'package:get/get.dart';
import '../../about_us/about_us_view.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Setting",
          style: TextStyle(
            color: kPrimaryColor,
            fontWeight: FontWeight.bold,
            fontFamily: 'Poppins',
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: kPrimaryColor),
            onPressed: () {},
          ),
        ],
      ),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                const SizedBox(height: 20),
                _buildTargetProfileHeader(),
                const SizedBox(height: 25),
              ],
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                _buildSectionTitle("ការប្រឡង និងលទ្ធផល"),
                _buildTargetMenuItem(
                  Icons.pedal_bike_rounded,
                  "តារាងប្រឡងសាកល្បង",
                ),
                _buildTargetMenuItem(
                  Icons.emoji_events_rounded,
                  "តារាងលេខបានពិន្ទុខ្ពស់",
                ),

                _buildSectionTitle("ព័ត៌មាន និងទំនាក់ទំនង"),
                _buildTargetMenuItem(
                  Icons.format_quote_rounded,
                  "សាររដ្ឋមន្ត្រី",
                ),
                _buildTargetMenuItem(Icons.favorite_rounded, "ណែនាំមិត្តភក្តិ"),
                _buildTargetMenuItem(
                  Icons.mail_rounded,
                  "មតិយោបល់ / ទំនាក់ទំនង",
                ),

                _buildSectionTitle("ផ្សេងៗ"),
                _buildTargetMenuItem(Icons.directions_car_rounded, "ដាក់ពាក្យ"),
                _buildTargetMenuItem(Icons.settings_rounded, "កំណត់"),

                const SizedBox(height: 100),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTargetProfileHeader() {
    return InkWell(
      onTap: () => Get.to(() => const AboutUsView()),
      borderRadius: BorderRadius.circular(20),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 15,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                color: kPrimaryColor.withOpacity(0.1),
                shape: BoxShape.circle,
                image: const DecorationImage(
                  image: AssetImage('assets/images/flutter.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(width: 20),

            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "អំពីក្រុមរបស់យើង",
                    style: TextStyle(
                      color: Color(0xFF1E293B),
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      fontFamily: 'KohSantepheap',
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "មិត្តរួមក្រុម និង គម្រោងរបស់ក្រុមយើង",
                    style: TextStyle(
                        color: Colors.grey,
                        fontFamily: 'KohSantepheap',
                        fontSize: 12),
                  ),
                ],
              ),
            ),
            // Icon(Icons.arrow_forward_ios, color: Colors.grey[300], size: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, bottom: 10, top: 20),
      child: Text(
        title,
        style: const TextStyle(
          color: Color(0xFF1E293B),
          fontSize: 14,
          fontWeight: FontWeight.bold,
          fontFamily: 'KohSantepheap',
        ),
      ),
    );
  }

  Widget _buildTargetMenuItem(IconData icon, String title) {
    return Container(
      margin: const EdgeInsets.only(bottom: 2),
      decoration: const BoxDecoration(color: Colors.white),
      child: ListTile(
        leading: Icon(icon, color: kPrimaryColor, size: 22),
        title: Text(
          title,
          style: const TextStyle(
            color: Color(0xFF334155),
            fontSize: 15,
            fontWeight: FontWeight.w500,
            fontFamily: 'KohSantepheap',
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: Colors.grey[200],
          size: 14,
        ),
        onTap: () {},
      ),
    );
  }
}
