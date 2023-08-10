import 'package:camps_demo/cubit/cubit/home_page_card_cubit_cubit.dart';
import 'package:camps_demo/repositories/card_data.dart';

import 'package:camps_demo/view/widget/custome_app_bar.dart';

import 'package:camps_demo/view/widget/line_widget.dart';
import 'package:camps_demo/view/widget/pages/chat_page.dart';
import 'package:camps_demo/view/widget/pages/help_page.dart';
import 'package:camps_demo/view/widget/pages/home_page.dart';
import 'package:camps_demo/view/widget/pages/report_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';




import 'cubit/cubit/bottom_nav_bar_cubit.dart';

//String stringResponse;

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final bottomNavBarCubit = context.read<BottomNavBarCubit>();
    List<Widget> widgetList = [
      RepositoryProvider(
        create: (context) => GetDataForCard(),
        child: BlocProvider<HomePageCardCubitCubit>(
          create: (context) =>
              HomePageCardCubitCubit(context.read<GetDataForCard>()),
          child: HomePage(),
        ),
      ),
      ChatPage(),
      HelpPage(),
      ReportPage()
    ];

    return BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
      buildWhen: (previous, current) {
        return true;
      },
      bloc: bottomNavBarCubit,
      builder: (context, state) {
        return Scaffold(
          appBar: CustomeAppBar(context),
          body: BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
            builder: (context, state) {
              if (state is BottomNavBarIndexChanged) {
                return widgetList.elementAt(state.newIndex);
              } else {
                return Container();
              }
            },
          ),
          bottomNavigationBar: SizedBox(
            height: 80,
            child: PreferredSize(
              preferredSize: Size.fromHeight(80),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 0, top: 4),
                child: Container(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  color: Colors.white,
                  child: BottomNavigationBar(
                    type: BottomNavigationBarType.fixed,
                    unselectedFontSize: 0,
                    selectedFontSize: 0,
                    backgroundColor: Colors.white,
                    selectedItemColor: Color(0xFFD8F4FF),
                    showSelectedLabels: false,
                    showUnselectedLabels: false,
                    elevation: 0,
                    onTap: (index) => bottomNavBarCubit.updateIndex(index),
                    selectedIconTheme: IconThemeData(color: Colors.amber),
                    currentIndex: bottomNavBarCubit.currentIndex,
                    items: [
                      BottomNavigationBarItem(
                        icon: bottomNavBarCubit.currentIndex == 0
                            ? LineWidget(
                                image:
                                    'assets/icons/common/tapbar_home_active.png',
                                scale: 1.7)
                            : Image.asset(
                                'assets/icons/common/tapbar_home_normal.png',
                                scale: 1.3,
                              ),
                        label: 'home',
                      ),
                      BottomNavigationBarItem(
                        icon: bottomNavBarCubit.currentIndex == 1
                            ? LineWidget(
                                image:
                                    'assets/icons/common/tapbar_chat_active.png',
                                scale: 1.3,
                              )
                            : Image.asset(
                                'assets/icons/common/tapbar_chat_normal.png',
                                scale: 1.3,
                              ),
                        label: 'chat',
                      ),
                      BottomNavigationBarItem(
                        icon: bottomNavBarCubit.currentIndex == 2
                            ? LineWidget(
                                image:
                                    'assets/icons/common/tapbar_report_active.png',
                                scale: 1.3,
                              )
                            : Image.asset(
                                'assets/icons/common/tapbar_report_normal.png',
                                scale: 1.3,
                              ),
                        label: 'report',
                      ),
                      BottomNavigationBarItem(
                        icon: bottomNavBarCubit.currentIndex == 3
                            ? LineWidget(
                                image:
                                    'assets/icons/common/tapbar_help_active.png',
                                scale: 1.3,
                              )
                            : Image.asset(
                                'assets/icons/common/tapbar_help_normal.png',
                                scale: 1.3,
                              ),
                        label: 'help',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
