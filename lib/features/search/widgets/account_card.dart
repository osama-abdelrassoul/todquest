import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utilities/utilities.dart';
import '../../auth/login/bloc/login_bloc.dart';

class AccountCard extends StatelessWidget {
  final String name;
  final String email;
  final String place;

  const AccountCard({
    super.key,
    required this.name,
    required this.email,
    required this.place,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Container(
          width: Utilities.screenWidth * 0.92,
          height: Utilities.screenHeight * 0.14,
          decoration: BoxDecoration(
              color: const Color(0xFFf2a493),
              borderRadius: BorderRadius.circular(15)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(
                radius: Utilities.screenHeight * 0.05,
                backgroundImage: const AssetImage("assets/images/profile.png"),
                backgroundColor: Colors.transparent,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Name: $name",
                    style: const TextStyle(
                      fontSize: 22,
                    ),
                  ),
                  SizedBox(
                    height: Utilities.screenHeight * 0.01,
                  ),
                  Text(
                    "Email: $email",
                    style: const TextStyle(
                      fontSize: 22,
                    ),
                  ),
                  SizedBox(
                    height: Utilities.screenHeight * 0.01,
                  ),
                  SizedBox(
                    width: Utilities.screenWidth * 0.6,
                    child: Text(
                      "coming from: $place",
                      style: const TextStyle(
                        fontSize: 22,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
