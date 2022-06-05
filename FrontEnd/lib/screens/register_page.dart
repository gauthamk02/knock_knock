import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:twilio_phone_verify/twilio_phone_verify.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import '../widgets/widget.dart';
import '../constants.dart';
import '../models/user.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool passwordVisibility = true;
  late TwilioPhoneVerify _twilioPhoneVerify;

  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _otpController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _passwordConfirmController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    _twilioPhoneVerify = TwilioPhoneVerify(
        accountSid: dotenv.env['ACCSID']!,
        serviceSid: dotenv.env['SERSID']!,
        authToken: dotenv.env['AUTHTOKEN']!);
  }

  void _otpVerificationSucess(BuildContext context) {
    http
        .post(Uri.parse("https://knockknockbackend.herokuapp.com/users/signup"),
            headers: {
              'Content-Type': 'application/json',
            },
            body: jsonEncode({
              'phoneNumber': _phoneNumberController.text,
              'name': _nameController.text,
              //'email': _emailController.text,
              'age': _ageController.text,
              'password': _passwordController.text,
              'type': 'explorer',
              'currentLocation': _locationController.text,
            }))
        .then((response) {
      if (response.statusCode == 200) {
        print(response.body);
        User user = User.userFromJSONString(response.body);
        UserProvider.setUser(user);
        Navigator.of(context).popAndPushNamed('/dashboard');
      } else {
        print(response.statusCode);
        print(response.body);
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Error'),
                content: Text(
                    'Something went wrong /nError Code: ${response.statusCode}'),
                actions: <Widget>[
                  TextButton(
                    child: Text('Ok'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ],
              );
            });
      }
    });
  }

  void _getCountriesList() async {
    final response =
        await http.post(Uri.parse('https://restcountries.eu/rest/v2/all'));
    // await http
    //     .post(Uri.parse('https://knockknockbackend.herokuapp.com/users/'));
    if (response.statusCode == 200) {
      print(response.body);
    } else {
      print(response.body);
      print('Error getting countries list');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kBackgroundColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Column(
                  children: [
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Register",
                            style: kHeadline,
                          ),
                          const Text(
                            "Create new account to get started.",
                            style: kBodyText2,
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          MyTextField(
                            hintText: 'Name',
                            inputType: TextInputType.name,
                            controller: _nameController,
                          ),
                          MyTextField(
                            hintText: 'Email',
                            inputType: TextInputType.emailAddress,
                            controller: _emailController,
                          ),
                          MyTextField(
                            hintText: 'Phone',
                            inputType: TextInputType.phone,
                            controller: _phoneNumberController,
                          ),
                          MyTextField(
                            hintText: 'Age',
                            inputType: TextInputType.number,
                            controller: _ageController,
                          ),
                          MyTextField(
                            hintText: 'Location',
                            inputType: TextInputType.text,
                            controller: _locationController,
                          ),
                          MyPasswordField(
                            isPasswordVisible: passwordVisibility,
                            controller: _passwordController,
                            onTap: () {
                              setState(() {
                                passwordVisibility = !passwordVisibility;
                              });
                            },
                          ),
                          MyPasswordField(
                            isPasswordVisible: passwordVisibility,
                            controller: _passwordConfirmController,
                            hintText: 'Re-enter Password',
                            onTap: () {
                              setState(() {
                                passwordVisibility = !passwordVisibility;
                              });
                            },
                          )
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Already have an account? ",
                          style: kBodyText1,
                        ),
                        TextButton(
                          child: Text("Sign In"),
                          style: ButtonStyle(
                              textStyle: MaterialStateProperty.all<TextStyle>(
                                  kButtonText)),
                          onPressed: () {
                            Navigator.of(context).popAndPushNamed("/signin");
                          },
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    MyTextButton(
                      buttonName: 'Register',
                      onTap: () async {
                        if (_passwordController.text !=
                            _passwordConfirmController.text) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Passwords do not match'),
                                content: Text('Please re-enter your password'),
                                actions: <Widget>[
                                  TextButton(
                                    child: Text('Ok'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        } else {
                          var twilioResponse = await _twilioPhoneVerify
                              .sendSmsCode(_phoneNumberController.text);

                          if (twilioResponse.successful!) {
                            print("Code Sent");
                          } else {
                            print(twilioResponse.errorMessage);
                          }
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  actions: [
                                    ElevatedButton(
                                        onPressed: () async {
                                          var twilioResponse2 =
                                              await _twilioPhoneVerify
                                                  .verifySmsCode(
                                                      phone:
                                                          _phoneNumberController
                                                              .text,
                                                      code:
                                                          _otpController.text);

                                          if (twilioResponse2.successful!) {
                                            if (twilioResponse2
                                                    .verification?.status ==
                                                VerificationStatus.approved) {
                                              print('Phone number is approved');
                                              _otpVerificationSucess(context);
                                            } else {
                                              print('Invalid code');
                                            }
                                          } else {
                                            print(twilioResponse.errorMessage);
                                          }
                                        },
                                        child: const Text("Verify"))
                                  ],
                                  title: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "OTP",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge,
                                        ),
                                      ]),
                                  content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const Text(
                                            "We,ve sent an OTP to your number."),
                                        MyTextField(
                                          hintText: "Enter the OTP",
                                          inputType: TextInputType.number,
                                          controller: _otpController,
                                        ),
                                      ]),
                                );
                              });
                        }
                      },
                      bgColor: kBackgroundColor,
                      textColor: kPrimaryTextColor,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
