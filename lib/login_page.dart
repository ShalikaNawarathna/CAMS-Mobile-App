import 'package:camps_demo/cubit/cubit/bottom_nav_bar_cubit.dart';
import 'package:camps_demo/cubit/cubit/login_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import 'forget_password.dart';
import 'home_screen.dart';
import 'models/post.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<LoginPage> {
  static const String routeName = '/login';
  // final _formKey = GlobalKey<FormState>();

  bool passwordVisible = false;
  List<Get>? gets;
  var isLoaded = false;
  // // This widget is the root of your application.

  
  static Route route() {
    return PageRouteBuilder(
        pageBuilder: (context, _, __) => BlocProvider<LoginCubit>(
            create: (_) => LoginCubit(), child: HomeScreen()),
        transitionDuration: const Duration(seconds: 0),
        settings: const RouteSettings(name: routeName));
  }

  @override
  Widget build(BuildContext context) {
    final loginCubit = context.read<LoginCubit>();
    return Sizer(builder: (context, orientation, deviceType) {
      return Scaffold(
        body: ListView(
          shrinkWrap: true,
          children: [
            SizerUtil.deviceType == DeviceType.mobile
                ? Image.asset(
                    'assets/icons/phone/login_bg.png',
                    fit: BoxFit.cover,
                    // width: 378,
                    // height: 376,
                  )
                : Image.asset(
                    'assets/icons/tablet/login_bg.png',
                    fit: BoxFit.cover,
                    // width: 378,
                    // height: 376,
                  ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 46,
              width: 24,
              padding: EdgeInsets.only(left: 36, top: 20),
              child: Text(
                'Login',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'segoeui',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Form(
              key: loginCubit.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 32, right: 32),
                    child: BlocConsumer<LoginCubit, LoginState>(
                        listener: (context, state) {
                      if (state.status == LoginStatus.success) {
                       // ScaffoldMessenger.of(context)
                            //.showSnackBar(SnackBar(content: Text('Success')));
                      }
                      if (state.status == LoginStatus.error) {
                        // ScaffoldMessenger.of(context)
                        //     .showSnackBar(SnackBar(content: Text('Error')));
                      }
                    }, buildWhen: (previous, current) {
                      return true;
                    }, builder: (context, state) {
                      return TextFormField(
                          controller: loginCubit.usernameControl,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter the username';
                            } else if (!loginCubit.emailValid()) {
                              return 'Please enter the valid email';
                            } else {
                              return null;
                            }
                          },
                          onChanged: (email) {
                            loginCubit.emailChanged(email);
                          },
                          decoration: InputDecoration(
                              hintText: 'User  Name',
                              hintStyle: TextStyle(
                                color: const Color(0x70707059),
                                fontSize: 18,
                              ),
                              contentPadding: EdgeInsets.only(left: 20),
                              filled: true,
                              fillColor: const Color(0xFFE8EEF3),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7.0),
                                borderSide: BorderSide(
                                    color: const Color(0x70707059), width: 1.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7.0),
                                borderSide: BorderSide(
                                    color: const Color(0x70707059), width: 1.0),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7.0),
                                borderSide: BorderSide(
                                    color: const Color(0x70707059), width: 1.0),
                              )));
                    }),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 32, right: 32),
                    child: BlocBuilder<LoginCubit, LoginState>(
                        buildWhen: (previous, current) =>
                            previous.password != current.password,
                        builder: (context, state) {
                          return TextFormField(
                            controller: loginCubit.passwordControl,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter the password';
                              } else if (!loginCubit.passwordValid()) {
                                return 'Please enter the valid password';
                              } else {
                                return null;
                              }
                            },
                            onChanged: (password) {
                              loginCubit.passwordChanged(password);
                            },
                            obscureText: !passwordVisible,
                            keyboardType: TextInputType.visiblePassword,
                            textInputAction: TextInputAction.done,
                            decoration: InputDecoration(
                                hintText: 'Password',
                                // helperText: 'Password must contain special characters',
                                helperStyle: TextStyle(color: Colors.green),
                                suffixIcon: IconButton(
                                    icon: Icon(
                                      passwordVisible
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                      color: passwordVisible
                                          ? Colors.grey
                                          : Colors.grey,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        passwordVisible = !passwordVisible;
                                      });
                                    }),
                                hintStyle: TextStyle(
                                  color: const Color(0x70707059),
                                  fontSize: 18,
                                ),
                                contentPadding: EdgeInsets.only(left: 20),
                                filled: true,
                                fillColor: const Color(0xFFE8EEF3),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7.0),
                                  borderSide: BorderSide(
                                      color: const Color(0x70707059),
                                      width: 1.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7.0),
                                  borderSide: BorderSide(
                                      color: const Color(0x70707059),
                                      width: 1.0),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7.0),
                                  borderSide: BorderSide(
                                      color: const Color(0x70707059),
                                      width: 1.0),
                                )),
                          );
                        }),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return const ForgetPassword();
                      }));
                    },
                    child: Padding(
                        padding: EdgeInsets.only(left: 35, bottom: 0),
                        child: Text(
                          'Forget Password',
                          style: TextStyle(
                              color: Color(0xFF274BFF),
                              fontFamily: 'segoeui',
                              fontWeight: FontWeight.w600,
                              fontSize: 13),
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 31, bottom: 0),
                    child: ElevatedButton(
                      onPressed: () async {
                        // context.read<LoginCubit>().loginWithCredentails();
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => const HomeScreen()));

                        //final loginCubit = context.read<LoginCubit>();
                        loginCubit.loginWithCredentails();
                        //loginCubit.validateUserData('', '');
                        final LoginState = loginCubit.state;
                        if (LoginState.status == LoginStatus.success) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BlocProvider(
                                        create: (context) =>
                                            BottomNavBarCubit(),
                                        child: HomeScreen(),
                                      )));
                        }
                      },
                      child: const Text(
                        'LOGIN',
                        style: TextStyle(
                          color: Color(0xFFFFFFFF),
                          letterSpacing: 0.5,
                          fontSize: 12.0,
                          fontFamily: 'segoeui',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF274BFF),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24.0)),
                          fixedSize: Size(150, 48)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
