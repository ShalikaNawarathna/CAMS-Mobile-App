# camps_demo

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


My note --------------------
error of installing map featues 
flutter pub add flutter_polyline_points
The current Dart SDK version is 3.0.5.

Because flutter_polyline_points >=1.0.0 depends on http ^0.13.1 and flutter_polyline_points <1.0.0 doesn't support null safety, every version   
  of flutter_polyline_points requires http ^0.13.1.
So, because camps_demo depends on both http ^1.1.0 and flutter_polyline_points any, version solving failed.

The lower bound of "sdk: '>=2.1.0 <3.0.0'" must be 2.12.0 or higher to enable null safety.
For details, see https://dart.dev/null-safety

---------------------------------------------------------------------------------
#My Package 

there are some facilites , User can select the location form map retunr the locations 
langitude and latitude