import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram/resources/auth_methods.dart';
import 'package:instagram/uitiles/colors.dart';
import 'package:instagram/uitiles/image_uitile.dart';
import 'package:instagram/widget/text_field_input.dart';

class SigupScreen extends StatefulWidget {
  const SigupScreen({Key? key}) : super(key: key);

  @override
  State<SigupScreen> createState() => _SigupScreenState();
}

class _SigupScreenState extends State<SigupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  Uint8List? _image;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _bioController.dispose();
    _userNameController.dispose();
  }

  void selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      _image = im;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: 32,
        ),
        // width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Flexible(
            //   child: Container(),
            //   flex: 1,
            // ),
            SvgPicture.asset(
              'assets/logo/ic_instagram.svg',
              color: primaryColor,
              height: 64,
            ),
            const SizedBox(
              height: 64,
            ),
            // circuler widget
            Stack(
              children: [
                _image != null
                    ? CircleAvatar(
                        radius: 64,
                        backgroundImage: MemoryImage(_image!),
                      )
                    : const CircleAvatar(
                        radius: 64,
                        // assets/logo/user.png
                        backgroundImage: NetworkImage(
                            'data:image/jpeg;base64,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')),
                Positioned(
                    bottom: -10,
                    left: 88,
                    child: IconButton(
                      icon: const Icon(Icons.add_a_photo),
                      onPressed: selectImage,
                    ))
              ],
            ),
            const SizedBox(
              height: 30,
            ),

            // text field input user name
            TextFieldInput(
              hinText: 'Enter your User Name',
              textInputType: TextInputType.text,
              textEditingController: _userNameController,
            ),
            const SizedBox(
              height: 24,
            ),
            // text field input user Email
            TextFieldInput(
              hinText: 'Enter your Email',
              textInputType: TextInputType.emailAddress,
              textEditingController: _emailController,
            ),
            const SizedBox(
              height: 24,
            ),
            // text field input user password
            TextFieldInput(
              hinText: 'Enter your Password',
              textInputType: TextInputType.text,
              textEditingController: _passwordController,
              ispass: true,
            ),
            const SizedBox(
              height: 24,
            ),
            // text field input bio
            TextFieldInput(
              hinText: 'Enter your Bio',
              textInputType: TextInputType.text,
              textEditingController: _bioController,
            ),
            const SizedBox(
              height: 24,
            ),
            InkWell(
              onTap: () async {
                String res = await AuthMethods().sinUpUser(
                  email: _emailController.text,
                  password: _passwordController.text,
                  username: _userNameController.text,
                  bio: _bioController.text,
                  file: _image!,
                );
              },
              child: Container(
                child: Text('Sign up'),
                width: double.infinity,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: const ShapeDecoration(
                  color: blueColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(4),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            // Flexible(
            //   child: Container(),
            //   flex: 2,
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Text("Don't have an account ?"),
                  padding: const EdgeInsets.symmetric(vertical: 8),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    child: const Text(
                      "Sing up.",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    ));
  }
}
