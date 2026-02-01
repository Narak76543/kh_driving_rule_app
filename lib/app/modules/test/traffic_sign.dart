import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kh_driving_rule/const/color.dart';
import '../../data/models/traffic_sign_model.dart';

class TrafficSignViews extends StatefulWidget {
  const TrafficSignViews({super.key});

  @override
  State<TrafficSignViews> createState() => _TrafficSignViewsState();
}

class _TrafficSignViewsState extends State<TrafficSignViews> {
  List<TrafficSignModel> signs = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadTrafficSigns();
  }

  Future<void> _loadTrafficSigns() async {
    try {
      final String response = await rootBundle.loadString('assets/data/traffic_signs.json');
      final data = await json.decode(response);
      setState(() {
        signs = (data as List).map((e) => TrafficSignModel.fromJson(e)).toList();
        isLoading = false;
      });
    } catch (e) {
      debugPrint("Error loading JSON: $e");
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: kPrimaryColor, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "ស្លាកសញ្ញាចរាចរណ៍",
          style: TextStyle(
            color: Color(0xFF1E293B),
            fontFamily: 'KohSantepheap',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator(color: kPrimaryColor))
          : signs.isEmpty
          ? const Center(child: Text("មិនមានទិន្នន័យ", style: TextStyle(fontFamily: 'KohSantepheap')))
          : GridView.builder(
        padding: const EdgeInsets.all(15),
        physics: const BouncingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 1,
        ),
        itemCount: signs.length,
        itemBuilder: (context, index) {
          return _buildSignItem(signs[index]);
        },
      ),
    );
  }

  Widget _buildSignItem(TrafficSignModel sign) {
    return InkWell(
      onTap: () => _showSignDetail(sign),
      borderRadius: BorderRadius.circular(15),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
          border: Border.all(color: Colors.grey.withOpacity(0.1)),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              sign.image.contains('assets/') ? sign.image : 'assets/images/${sign.image}',
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) => const Icon(Icons.image_not_supported, color: Colors.grey),
            ),
          ),
        ),
      ),
    );
  }

  void _showSignDetail(TrafficSignModel sign) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.8,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        ),
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            Container(width: 50, height: 5, decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(10))),
            const SizedBox(height: 25),

            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: const Color(0xFFF1F5F9),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Image.asset(
                sign.image.contains('assets/') ? sign.image : 'assets/images/${sign.image}',
                height: 150,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 20),

            Text(
              sign.title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'KohSantepheap',
                color: Color(0xFF1E293B),
              ),
            ),
            const Divider(height: 30, thickness: 1),

            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "សេចក្តីពន្យល់៖",
                      style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'KohSantepheap', color: kPrimaryColor),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      sign.description,
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 15,
                        height: 1.7,
                        color: Colors.grey[700],
                        fontFamily: 'KohSantepheap',
                      ),
                    ),

                    if (sign.note != null && sign.note.toString().isNotEmpty) ...[
                      const SizedBox(height: 20),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.amber.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.amber.withOpacity(0.2)),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(Icons.info_rounded, color: Colors.amber, size: 22),
                            const SizedBox(width: 12),
                            Expanded(
                              child: RichText(
                                text: TextSpan(
                                  style: const TextStyle(
                                    fontFamily: 'KohSantepheap',
                                    fontSize: 14,
                                    color: Color(0xFF92400E),
                                    height: 1.5,
                                  ),
                                  children: [
                                    const TextSpan(
                                      text: "ចំណាំ៖ ",
                                      style: TextStyle(fontWeight: FontWeight.bold),
                                    ),
                                    TextSpan(text: sign.note.toString()),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: kPrimaryColor,
                  elevation: 0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                child: const Text(
                    "យល់ព្រម",
                    style: TextStyle(fontFamily: 'KohSantepheap', color: Colors.white, fontWeight: FontWeight.bold)
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}