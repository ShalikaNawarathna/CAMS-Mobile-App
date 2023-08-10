import 'package:camps_demo/view/widget/Map/map.dart';
import 'package:camps_demo/view/widget/Map/map_page_app_bar.dart';
import 'package:camps_demo/view/widget/Map/new%20map/cubit/map_view_cubit.dart';
import 'package:camps_demo/view/widget/Map/new%20map/widgets/map_screen.dart';
import 'package:camps_demo/view/widget/Map/new%20map/widgets/map_view_app_bar.dart';

import 'package:flutter/material.dart';
import 'package:camps_demo/view/widget/custome_app_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class NewMapPage extends StatefulWidget {
  const NewMapPage({super.key});

  @override
  State<NewMapPage> createState() => _NewMapPageState();
}

class _NewMapPageState extends State<NewMapPage> {
  @override
  Widget build(BuildContext context) {
    
    return BlocProvider(
      create: (context) => MapViewCubit(),
      child: Scaffold(
          appBar: MapViewAppBar(context),
          body: SafeArea(child: ShowMapScreen())),
    );

    // return Container(
    //   child: GoogleMap(
    //     myLocationButtonEnabled: false,
    //     zoomControlsEnabled: false,
    //     initialCameraPosition: _initialCameraPosition,

    //   ),
    // );
  }
}
