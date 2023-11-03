import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../application/providers/home_page_provider.dart';
import '../../utils/constants.dart';

class Indicator extends StatelessWidget {
  const Indicator({super.key});

  Widget singleIndicator({bool isActive = false}) {
    return Container(
      height: isActive ? 18 : 12,
      width: isActive ? 18 : 12,
      margin: const EdgeInsets.symmetric(horizontal: 5.0),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isActive ? Colors.white : indicatorInactiveColor),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomePageProvider>(builder: (context, prov, _) {
      return Row(
        children: List.generate(
          3,
          (index) => singleIndicator(isActive: prov.state == index + 1),
        ),
      );
    });
  }
}
