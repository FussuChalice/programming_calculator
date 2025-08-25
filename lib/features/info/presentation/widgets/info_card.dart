import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class InfoCard extends StatefulWidget {
  const InfoCard({super.key});

  @override
  State<InfoCard> createState() => _InfoCardState();
}

class _InfoCardState extends State<InfoCard> {
  String appVersion = '';

  Future<void> _initPackageInfo() async {
    final packageInfo = await PackageInfo.fromPlatform();

    setState(() {
      appVersion = packageInfo.version;
    });
  }

  @override
  void initState() {
    super.initState();
    _initPackageInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 2, color: Colors.black),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            offset: const Offset(3, 3),
            blurRadius: 0, // no blur
            spreadRadius: 0,
          ),
        ],
      ),
      padding: EdgeInsets.only(top: 50, bottom: 8, left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'The Programming Calculator',
            style: TextStyle(
              color: Colors.black,
              fontSize: 31,
              fontFamily: 'ChiKareGo2',
              height: 1,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            'Maksym Makaliuk',
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontFamily: 'FindersKeepers',
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 50),
          Text(
            'Version $appVersion ©2025 Max Makaliuk',
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontFamily: 'FindersKeepers',
            ),
            textAlign: TextAlign.end,
          ),
        ],
      ),
    );
  }
}
