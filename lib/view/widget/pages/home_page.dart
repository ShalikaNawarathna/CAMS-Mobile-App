import 'package:camps_demo/cubit/cubit/home_page_card_cubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubit/cubit/card_cubit.dart';
import '../../../repositories/card_data.dart';
import '../custome_tab_bar.dart';
import '../custome_tab_bar_view.dart';

class HomePage extends StatefulWidget {

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController tabController;
  void initState() {
    super.initState();
      
    tabController = TabController(length: 4, vsync: this);
  
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CustomeTabBar(
            tabController: tabController,
          ),
          Expanded(
              child: Container(
            decoration: BoxDecoration(
              color: Color(0xFFF7F9FB).withOpacity(1.0),
            ),
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: CustomeTabBarView(
              tabController: tabController,
            ),
          ))
        ],
      ),
    );
  }
}
