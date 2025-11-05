import 'package:flutter/material.dart';
import 'package:untitled4/feature/ads/widget/banner_ads.dart';

class AdsScreen extends StatefulWidget {
  const AdsScreen({super.key});

  @override
  State<AdsScreen> createState() => _AdsScreenState();
}

class _AdsScreenState extends State<AdsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ads Screen"),
        centerTitle: true,
      ),
      body: CircularProgressIndicator(),
      bottomNavigationBar: BannerAds(),
    );
  }
}
