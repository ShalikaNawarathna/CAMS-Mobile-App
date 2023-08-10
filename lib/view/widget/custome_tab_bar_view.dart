import 'package:camps_demo/home_screen.dart';
import 'package:camps_demo/models/card_data.dart';
import 'package:camps_demo/repositories/card_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pie_chart/pie_chart.dart';

import '../../cubit/cubit/home_page_card_cubit_cubit.dart';
import 'card/card_item.dart';
import 'card/card_widget.dart';
// import 'package:http/http.dart' as http;
import 'dart:convert';

class CustomeTabBarView extends StatefulWidget {
  const CustomeTabBarView({super.key, required this.tabController});
  final TabController tabController;

  @override
  State<CustomeTabBarView> createState() => _CustomeTabBarViewState();
}

//late String mapResponse;

class _CustomeTabBarViewState extends State<CustomeTabBarView>
    with TickerProviderStateMixin {
  List<String> dates = [
    '2021/11/12',
    '2021/10/12',
    '2020/08/07',
    '2019/12/09',
    '2023/01/02',
    '2016/03/16'
  ];

  void initState() {
    super.initState();
  }

  

  @override
  Widget build(BuildContext context) {
    // final cardCubit = context.read<CardState>();
    return Container(
      child: TabBarView(controller: widget.tabController, children: [
      
        BlocBuilder<HomePageCardCubitCubit, HomePageCardCubitState>(
          builder: (context, state) {
            // final cardCubit = context.read<CardCubit>();
            if (state is HomePageCardCubitInitial ||
                state is LoadingCardState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is ResponseState) {
              final cardDatas = state.cardModel;
              return ListView.builder(
                itemCount: cardDatas.cardModel.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 0.0, vertical: 3.0),
                    child: CardWidget(
                      date: dates[index],
                      description:
                          '${cardDatas.cardModel[index].first_name} ${cardDatas.cardModel[index].last_name} -> ${cardDatas.cardModel[index].first_name} ${cardDatas.cardModel[index].last_name}',
                      value: '21/7',
                    ),
                  );
                },
              );

              //return Text(state.cardModel[0].first_name);
            } else if (state is ErrorCardState) {
              return Text(state.message);
            } else {
              return Text(state.toString());
            }
          },
        ),
        Text('Tab 2'),
        Text('Tab 3'),
        Text('Tab 4')
      ]),
    );
  }
}
