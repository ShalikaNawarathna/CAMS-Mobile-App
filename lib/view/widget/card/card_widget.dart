import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:sizer/sizer.dart';

class CardWidget extends StatelessWidget {
  final String date;
  final String description;
  final String value;

  CardWidget({
    required this.date,
    required this.description,
    required this.value,
  });
  @override
  Widget build(BuildContext context) {
    int index = 0;

    Map<String, double> dataMap = {
      '12/44': 0.27,
      '12/44': 0.27,
      '02/44': 0.045,
      '12/44': 0.27,
      '12/44': 0.27
    };

    return Card(
      elevation: 1.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(11.0),
      ),
      child: Container(
        height: 92,
        // width: 400,
        decoration: BoxDecoration(
            boxShadow: [BoxShadow(color: Color(0x00000014), blurRadius: 5.0)]),
        //width: MediaQuery.of(context).size.width,
        //padding: EdgeInsets.symmetric(horizontal: 14.0, vertical: 7.0),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(left: 14, bottom: 4),
                    child: Text(
                      date,
                      style: TextStyle(
                          fontSize: 13.5,
                          fontFamily: 'segoeui',
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF0F0F0F).withOpacity(0.3)),
                    ),
                  ),
                  SizedBox(
                    height: 0,
                  ),
                  Container(
                    height: 41,
                    width: 68.w,
                    padding: const EdgeInsets.only(left: 14, top: 1),
                    child: Text(
                      description,
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: 'segoeui',
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF0F0F0F).withOpacity(0.90)),
                    ),
                  )
                ]),
            Container(
              //height: 73,
              width: 53,
              color: Color(0xFFF8F8F8),
              //height: double.maxFinite,
              child: Column(
                children: [
                  Container(
                    // height: 17,
                    // width: 30,
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      value,
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  // SizedBox(
                  //   height: 4.01,
                  // ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 2),
                    height: 12.w,
                    width: 15.w,
                    child: PieChart(
                      dataMap: dataMap,
                      chartType: ChartType.disc,
                      chartRadius: MediaQuery.of(context).size.width / 1,
                      chartValuesOptions: ChartValuesOptions(
                          showChartValues: false,
                          showChartValuesOutside: false,
                          showChartValuesInPercentage: false,
                          showChartValueBackground: false),
                      legendOptions: LegendOptions(
                        showLegends: false,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 30,
              //height: 73,
              //padding: const EdgeInsets.only(right: 6, top: 25, bottom: 24),
              child: SizedBox(
                child: Image.asset('assets/icons/common/arrow_right.png',
                    fit: BoxFit.contain, color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
