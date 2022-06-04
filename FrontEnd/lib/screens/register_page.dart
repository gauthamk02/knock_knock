import 'package:flutter/material.dart';
import 'package:twilio_phone_verify/twilio_phone_verify.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../widgets/widget.dart';
import '../constants.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool passwordVisibility = true;
  late TwilioPhoneVerify _twilioPhoneVerify;
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _otpController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _twilioPhoneVerify = TwilioPhoneVerify(
        accountSid: dotenv.env['ACCSID']!,
        serviceSid: dotenv.env['SERSID']!,
        authToken: dotenv.env['AUTHTOKEN']!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                          const MyTextField(
                            hintText: 'Name',
                            inputType: TextInputType.name,
                          ),
                          const MyTextField(
                            hintText: 'Email',
                            inputType: TextInputType.emailAddress,
                          ),
                          MyTextField(
                            hintText: 'Phone',
                            inputType: TextInputType.phone,
                            controller: _phoneNumberController,
                          ),
                          MyPasswordField(
                            isPasswordVisible: passwordVisibility,
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
                                                    code: _otpController.text);

                                        if (twilioResponse2.successful!) {
                                          if (twilioResponse2
                                                  .verification?.status ==
                                              VerificationStatus.approved) {
                                            print('Phone number is approved');
                                            Navigator.of(context)
                                                .popAndPushNamed(
                                                    '/explorer-dashboard');
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
                                    mainAxisAlignment: MainAxisAlignment.center,
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
