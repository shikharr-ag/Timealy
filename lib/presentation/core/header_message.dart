import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timealy/application/providers/onboarding_provider.dart';

import '../../application/providers/home_page_provider.dart';
import '../../utils/constants.dart';

class HeaderMessage extends StatelessWidget {
  const HeaderMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.15,
        child: Consumer<HomePageProvider>(builder: (context, prov, _) {
          return Column(
            children: [
              FittedBox(
                child: Text(
                  msgCaption.keys.toList()[prov.state],
                  style: title2Style,
                ),
              ),
              FittedBox(
                fit: BoxFit.fill,
                child: Text(
                  msgCaption.values.toList()[prov.state],
                  style: titleStyle.copyWith(fontSize: 20),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
