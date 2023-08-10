import 'package:camps_demo/home_screen.dart';
import 'package:camps_demo/view/widget/line_widget.dart';
import 'package:camps_demo/view/widget/pages/chat_page.dart';
import 'package:camps_demo/view/widget/pages/help_page.dart';
import 'package:camps_demo/view/widget/pages/report_page.dart';
import 'package:flutter/material.dart';

class CustormBottamNavBar extends StatefulWidget {
  @override
  State<CustormBottamNavBar> createState() => _CustormBottamNavBarState();
}

class _CustormBottamNavBarState extends State<CustormBottamNavBar> {
  List pages = [HomeScreen(), ChatPage(), ReportPage(), HelpPage()];

  int currentIndex = 0;

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
    switch (index) {
      case 1:
        Navigator.push(context, MaterialPageRoute(builder: (_) => ChatPage()));
        break;
      case 2:
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => ReportPage()));
        break;
      case 3:
        Navigator.push(context, MaterialPageRoute(builder: (_) => HelpPage()));
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
              onTap: onTap,
              selectedIconTheme: IconThemeData(color: Colors.amber),
              
              currentIndex: currentIndex,
              items: [
                BottomNavigationBarItem(
                  icon: currentIndex == 0
                      ? LineWidget(
                          image: 'assets/icons/common/tapbar_home_active.png',
                          scale: 1.7)
                      : Image.asset(
                          'assets/icons/common/tapbar_home_normal.png',
                          scale: 1.3,
                        ),
                  label: 'home',
                ),
                BottomNavigationBarItem(
                  icon: currentIndex == 1
                      ? LineWidget(
                          image: 'assets/icons/common/tapbar_chat_active.png',
                          scale: 1.3,
                        )
                      : Image.asset(
                          'assets/icons/common/tapbar_chat_normal.png',
                          scale: 1.3,
                        ),
                  label: 'chat',
                ),
                BottomNavigationBarItem(
                  icon: currentIndex == 2
                      ? LineWidget(
                          image: 'assets/icons/common/tapbar_report_active.png',
                          scale: 1.3,
                        )
                      : Image.asset(
                          'assets/icons/common/tapbar_report_normal.png',
                          scale: 1.3,
                        ),
                  label: 'report',
                ),
                BottomNavigationBarItem(
                  icon: currentIndex == 3
                      ? LineWidget(
                          image: 'assets/icons/common/tapbar_help_active.png',
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
    );
  }
}
