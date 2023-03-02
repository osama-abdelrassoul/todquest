import 'package:flutter/material.dart';

import '../../../core/utilities/utilities.dart';

class TopBarLogin extends StatelessWidget {
  const TopBarLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Column(
          children: [
            SizedBox(
              height: Utilities.screenHeight * 0.16,
            ),
            Container(
              height: Utilities.screenHeight * 0.14,
              width: Utilities.screenWidth * 0.33,
              decoration: BoxDecoration(
                  color: Colors.amber[50],
                  borderRadius: BorderRadius.circular(100),
                  image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/profile.png'))),
            )
          ],
        )
      ],
    );
  }
}
