import 'package:flutter/material.dart';
import 'package:portfolio/providers/cursor_provider.dart';
import 'package:provider/provider.dart';

import '../../core/constant/theme/styles.dart';
import 'landing_page_1.dart';

class MyMoto extends StatelessWidget {
  const MyMoto({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LandingWidget(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          Consumer<CursorProvider>(builder: (context, provider, _) {
            return MouseRegion(
              onEnter: (event) => provider.toggleMagnify(true),
              onExit: (event) => provider.toggleMagnify(false),
              child: Column(
                children: [
                  Text('MY MOTO', style: AppTextStyle.anotation),
                  const SizedBox(
                    height: 18,
                  ),
                  Text(
                    'DIFFERENT\nSTROKES FOR\nDIFFERENT\nFOLKS',
                    textAlign: TextAlign.center,
                    style: AppTextStyle.heading,
                  ),
                ],
              ),
            );
          }),
          const Spacer(),
        ],
      ),
    );
  }
}
