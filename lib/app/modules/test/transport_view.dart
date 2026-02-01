import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kh_driving_rule/const/color.dart';

import '../transport/transport_model.dart';

class TransportView extends StatefulWidget {
  const TransportView({super.key});

  @override
  State<TransportView> createState() => _TransportViewState();
}

class _TransportViewState extends State<TransportView> {
  List<TransportModel> transportList = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadTransportData();
  }

  Future<void> _loadTransportData() async {
    try {
      final String response = await rootBundle.loadString('assets/data/transport_data.json');
      final data = await json.decode(response);
      setState(() {
        transportList = (data as List).map((e) => TransportModel.fromJson(e)).toList();
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
      backgroundColor: const Color(0xFFF8FAFC), // Light Mode Background
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: kPrimaryColor, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "ការដឹកជញ្ជូន",
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
          : transportList.isEmpty
          ? const Center(child: Text("មិនមានទិន្នន័យ", style: TextStyle(fontFamily: 'KohSantepheap')))
          : ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        physics: const BouncingScrollPhysics(), // Smooth scrolling for Samsung A05
        itemCount: transportList.length,
        itemBuilder: (context, index) {
          return _buildTransportCard(transportList[index], index + 1);
        },
      ),
    );
  }

  Widget _buildTransportCard(TransportModel item, int number) {
    const Color transportAccent = Colors.deepPurple; // ប្រើពណ៌ស្វាយសម្រាប់ផ្នែកដឹកជញ្ជូន

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
        border: Border.all(color: Colors.grey.withOpacity(0.1)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // លេខរៀង
            CircleAvatar(
              radius: 16,
              backgroundColor: transportAccent.withOpacity(0.1),
              child: Text(
                "$number",
                style: const TextStyle(
                  color: transportAccent,
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
                          color: transportAccent,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'KohSantepheap',
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