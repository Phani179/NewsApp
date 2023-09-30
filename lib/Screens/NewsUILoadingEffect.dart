import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../API/NewsAPI.dart';

class NewsUILoadingEffect extends StatelessWidget {
  const NewsUILoadingEffect({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFFEFE1D0),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Shimmer.fromColors(
                baseColor: Colors.grey.shade50,
                highlightColor: Colors.grey.shade300,
                child: Container(
                    width: width * 0.65,
                    height: height * 0.53,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
