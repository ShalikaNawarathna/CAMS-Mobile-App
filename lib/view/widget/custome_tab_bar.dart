import 'package:flutter/material.dart';

class CustomeTabBar extends StatefulWidget {
  final TabController tabController;

  const CustomeTabBar({super.key, required this.tabController});

  @override
  State<CustomeTabBar> createState() => _CustomeTabBarState();
}

class _CustomeTabBarState extends State<CustomeTabBar>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 0.5,
        top: 9,
      ),
      child: Container(
          // margin: EdgeInsets.only(top: 10, bottom: 20),
          height: 50,
          child: DefaultTabController(
            length: 4,
            child: Container(
              // margin: EdgeInsets.only(top: 0, bottom: 0, left: 16),
              constraints: BoxConstraints(maxHeight: 35.0),
              child: Material(
                elevation: 1,
                child: Center(
                  child: TabBar(
                      // onTap: (index) =>    _scrollController.move(index),
                      padding: EdgeInsets.only(top: 0, bottom: 1, left: 29),
                      controller: widget.tabController,
                      isScrollable: true,
                      indicatorColor: Color(0xFF4071FF),
                      labelColor: Color(0xFF4071FF),
                      // indicatorPadding: EdgeInsets.only(bottom: 0),
                      labelStyle: TextStyle(fontSize: 13),
                      unselectedLabelColor: Color(0xFF737373),
                      
                      tabs: [
                        Tab(
                          text: 'Building Types',
                        ),
                        Tab(
                          text: 'Buildings',
                        ),
                        Tab(
                          text: 'Functional Areas',
                        ),
                        Tab(
                          text: 'Functs',
                        )
                      ]),
                ),
              ),
            ),
          )),
    );
  }
}
