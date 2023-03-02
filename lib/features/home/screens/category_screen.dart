import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todquest/features/search/widgets/account_card.dart';

import '../../../core/utilities/utilities.dart';

import '../bloc/home_bloc.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
        create: (context) => HomeBloc(),
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            context.read<HomeBloc>().add(const HomepageEvent());

            return SafeArea(
              child: Scaffold(
                body: SingleChildScrollView(
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: Utilities.screenHeight * 0.02,
                        ),
                        Column(
                          children: List.generate(
                            state.users.length,
                            (index) => Column(
                              children: [
                                AccountCard(
                                  place: state.users[index].place,
                                  email: state.users[index].email,
                                  name: state.users[index].name,
                                ),
                                SizedBox(
                                  height: Utilities.screenHeight * 0.02,
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ));
  }
}
