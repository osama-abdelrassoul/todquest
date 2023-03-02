import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constant/constant.dart';
import '../../../core/utilities/utilities.dart';

import '../../auth/login/bloc/login_bloc.dart';

import '../bloc/search_bloc.dart';
import '../widgets/account_card.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        return Scaffold(
          body: BlocBuilder<LoginBloc, LoginState>(
            builder: (context, statee) {
              return SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: Utilities.screenHeight * 0.07,
                      ),
                      Container(
                        height: Utilities.screenHeight * 0.05,
                        width: Utilities.screenWidth * 0.95,
                        decoration: BoxDecoration(
                            color: const Color(0xFFf2a493),
                            borderRadius: BorderRadius.circular(25)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: Utilities.screenHeight * 0.04,
                              width: Utilities.screenWidth * 0.22,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(25)),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 3.0),
                                child: DropdownButton<String>(
                                  value: state.searchType,
                                  icon: const Icon(Icons.arrow_drop_down),
                                  elevation: 16,
                                  underline: Container(),
                                  borderRadius: BorderRadius.circular(25),
                                  style: Theme.of(context)
                                      .textTheme
                                      .displaySmall
                                      ?.copyWith(fontSize: 15),
                                  onChanged: (String? value) {
                                    context.read<SearchBloc>().add(
                                        ChangeSearchTypeEvent(
                                            searchType: value!));
                                  },
                                  items: list.map<DropdownMenuItem<String>>(
                                      (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                            Container(
                              height: Utilities.screenHeight * 0.04,
                              width: Utilities.screenWidth * 0.63,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(25)),
                              child: TextField(
                                decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Enter Your Search Key"),
                                textAlignVertical: TextAlignVertical.top,
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .displaySmall
                                    ?.copyWith(fontSize: 20),
                                onChanged: (value) {
                                  context.read<SearchBloc>().add(
                                      ChangeSearchKeyEvent(searchKey: value));
                                },
                              ),
                            ),
                            GestureDetector(
                              onTap: () => context
                                  .read<SearchBloc>()
                                  .add(const GetSearchDataEvent()),
                              child: const Icon(
                                Icons.search,
                                size: 25,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      state.users.isNotEmpty
                          ? SingleChildScrollView(
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
                                              email: state.users[index].email,
                                              name: state.users[index].name,
                                              place: state.users[index].place,
                                            ),
                                            SizedBox(
                                              height:
                                                  Utilities.screenHeight * 0.02,
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          : Container(
                              width: Utilities.screenWidth * 0.8,
                              height: Utilities.screenHeight * 0.8,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/search.png'))),
                            ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
