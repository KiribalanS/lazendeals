import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:lazendeals/auth/auth_bloc/auth_bloc.dart';
import 'package:lazendeals/auth/screens/otp_result_screen.dart';
import 'package:lazendeals/widgets/custom_container.dart';

class OtpVerifyScreen extends StatefulWidget {
  const OtpVerifyScreen({super.key, required this.email});

  final String email;

  @override
  State<OtpVerifyScreen> createState() => _OtpVerifyScreenState();
}

class _OtpVerifyScreenState extends State<OtpVerifyScreen> {
  String otp = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomContainer(
        child: BlocConsumer<AuthBloc, AuthState>(listener: (context, state) {
          if (state is AuthSuccessState) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const OtpResultScreen(),
              ),
            );
          }
          if (state is AuthFailureState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.failureMessage),
              ),
            );
          }
        }, builder: (context, state) {
          return Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 15,
                ),
                const Image(
                  height: 115,
                  width: 115,
                  image: AssetImage("assets/images/logo.png"),
                ),
                Text(
                  "Lazendeals",
                  style: Theme.of(context).appBarTheme.titleTextStyle,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Image(
                        height: 75,
                        width: 75,
                        image: AssetImage("assets/images/message.png"),
                      ),
                      const Text(
                        "OTP verification",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text("Enter the otp sent to ${widget.email}"),
                      // Padding(
                      //   padding: const EdgeInsets.all(8.0),
                      //   child: Pinput(
                      //     length: 6,
                      //     onChanged: (code) {
                      //       otp = code;
                      //       if (otp.isEmpty) {
                      //         return;
                      //       }
                      //       print(otp);
                      //     },
                      //     onCompleted: (String verificationCode) {
                      //       otp = verificationCode;
                      //       if (otp.isEmpty) {
                      //         return;
                      //       }
                      //       print(otp);
                      //     },
                      // ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: OtpTextField(
                          numberOfFields: 6,
                          showFieldAsBox: true,
                          borderWidth: 3,
                          fieldWidth: 40,
                          filled: true,
                          contentPadding: const EdgeInsets.all(10),
                          fillColor: Colors.grey.shade200,
                          //runs when a code is typed in
                          onCodeChanged: (String code) {
                            otp = code;
                            if (otp.isEmpty) {
                              return;
                            }
                            print(otp);
                          },
                          //runs when every textfield is filled
                          onSubmit: (String verificationCode) {
                            otp = verificationCode;
                            if (otp.isEmpty) {
                              return;
                            }
                            print(otp);

                            // showDialog(
                            //     context: context,
                            //     builder: (context) {
                            //       return AlertDialog(
                            //         title: const Text("Verification Code"),
                            //         content: Text('Code entered is $verificationCode'),
                            //       );
                            //     });
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 55,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: ElevatedButton(
                    onPressed: () {
                      if (otp.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("No Code entered"),
                          ),
                        );
                      } else if (otp.length != 6) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Enter valid code"),
                          ),
                        );
                      } else {
                        if (state is AuthOtpSentState) {
                          context.read<AuthBloc>().add(
                                VerifyOtpEvent(
                                  otp: otp,
                                  email: widget.email,
                                  userId: state.userId,
                                ),
                              );
                        }
                      }
                    },
                    child: const Text("Verify"),
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
