import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kh_driving_rule/const/color.dart';
import '../../data/models/vehicle_tech/vehicle_tech_model.dart';

class VehicleTechView extends StatefulWidget {
  const VehicleTechView({super.key});

  @override
  State<VehicleTechView> createState() => _VehicleTechViewState();
}

class _VehicleTechViewState extends State<VehicleTechView> {
  List<VehicleTechModel> techList = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    try {
      final String response = await rootBundle.loadString(
        'assets/data/vehicle_tech.json',
      );
      final data = await json.decode(response);
      setState(() {
        techList = (data as List)
            .map((e) => VehicleTechModel.fromJson(e))
            .toList();
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
          icon: const Icon(
            Icons.arrow_back_ios,
            color: kPrimaryColor,
            size: 20,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "បច្ចេកទេសយានយន្ត",
          style: TextStyle(
            color: Color(0xFF1E293B),
            fontFamily: 'KohSantepheap',
            fontWeight: FontWeight.bold,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(color: Colors.grey.withOpacity(0.1), height: 1),
        ),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator(color: kPrimaryColor))
          : techList.isEmpty
          ? const Center(
              child: Text(
                "មិនមានទិន្នន័យ",
                style: TextStyle(fontFamily: 'KohSantepheap'),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              physics: const BouncingScrollPhysics(),
              itemCount: techList.length,
              itemBuilder: (context, index) {
                return _buildTechCard(techList[index], index + 1);
              },
            ),
    );
  }

  Widget _buildTechCard(VehicleTechModel item, int number) {
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
        border: Border.all(color: Colors.grey.withOpacity(0.1), width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 16,
              backgroundColor: kPrimaryColor.withOpacity(0.1),
              child: Text(
                "$number",
                style: const TextStyle(
                  color: kPrimaryColor,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                ),
              ),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.question,
                    style: const TextStyle(
                      color: Color(0xFF1E293B),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'KohSantepheap',
                      height: 1.6,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Divider(color: Color(0xFFF1F5F9), thickness: 1.2),
                  const SizedBox(height: 12),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "ចម្លើយ៖ ",
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'KohSantepheap',
                          fontSize: 14,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          item.answer,
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 14,
                            fontFamily: 'KohSantepheap',
                            height: 1.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
