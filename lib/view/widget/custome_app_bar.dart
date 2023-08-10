import 'package:camps_demo/view/widget/Map/map.dart';
import 'package:camps_demo/view/widget/Map/new%20map/view/map_view.dart';
//import 'package:camps_demo/view/widget/map.dart';
import 'package:camps_demo/view/widget/pages/leading_page.dart';
import 'package:camps_demo/view/widget/pages/viewmap_page.dart';
import 'package:flutter/material.dart';

class CustomeAppBar extends AppBar {
  final BuildContext context;
  CustomeAppBar(this.context)
      : super(
          centerTitle: true,

          title: const Text(
            'Two story building',
            style: TextStyle(fontSize: 15),
          ),

          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(25),
                  bottomLeft: Radius.circular(25))),
          elevation: 0.0,
          backgroundColor: Color(0xFF4071FF),

          leading: InkWell(
              onTap: () {
                // Navigator.push(context,
                // MaterialPageRoute(builder: (_) => LeadingPage()));
                //  Scaffold.of(context).openDrawer()
              },
              child: Image.asset('assets/icons/common/hamburger_icon.png')),
          //toolbarHeight: 115.0,
          actions: [
            //Icon(MaterialCommunityIcons.google_)
            Padding(
                padding: const EdgeInsets.only(top: 0, left: 24),
                child: Image.asset(
                  'assets/icons/common/filter_icon.png',
                )),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(70),
            child: Container(
              padding: const EdgeInsets.only(left: 20, bottom: 11),
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Stack(
                  //   children: [Text('West Tower  seaside building')],
                  // )
                  Expanded(
                      child: Text(
                    'West Tower easide building',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  )),
                  InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => NewMapPage()));
                    },
                    child: Container(
                      padding: const EdgeInsets.only(right: 8),
                      child: Image.asset('assets/icons/common/search_icon.png'),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
}
