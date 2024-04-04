import 'package:code_dpk/helper/size.helper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final int thisYear = DateTime.now().year;
  bool isSubmitting = false;

  TextStyle callText = TextStyle(
    color: Color(0xfff68326),
    fontSize: 12,
    fontWeight: FontWeight.w500,
    decoration: TextDecoration.underline,
    decorationColor: Color(0xfff68326),
  );
  TextStyle contactLabel = TextStyle(fontSize: 12, color: Colors.black);

  Future<void> _dialNumber(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  _submit() async {
    if (_formKey.currentState!.validate()) {
      setState(() => isSubmitting = true);
      await Future<void>.delayed(const Duration(seconds: 2));
      gotoHome();
    }
  }

  gotoHome() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Login successful')),
    );
    setState(() => isSubmitting = false);
    context.goNamed('home');
  }

  @override
  void dispose() {
    super.dispose();
    userName.dispose();
    password.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(18),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _topLogoSection(context),
            _authInputSection(context),
            _contactSection(context),
          ],
        ),
      ),
      bottomSheet: Container(
        color: Theme.of(context).colorScheme.background,
        height: 45,
        child: Center(
          child: Text(
            'v1.7 © ${thisYear.toString()}, Codeland Infosolutions Pvt Ltd.',
            style: TextStyle(fontSize: 11),
          ),
        ),
      ),
    );
  }

  _topLogoSection(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;

    return SizedBox(
      height: height / 2.5,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 18),
            Image.asset(
              './assets/images/logo_text_big.png',
              height: 117,
            ),
            Image.asset(
              './assets/images/logo_pic.png',
              height: 135,
            ),
            SizedBox(height: 9),
            Text(
              'Biomedical Kiosk',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontWeight: FontWeight.w700),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 90.0),
              child: Text(
                'For HCE\'s',
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: 11,
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _authInputSection(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = size.width;
    return Form(
      key: _formKey,
      child: Column(
        children: [
          SizedBox(height: 0),
          TextFormField(
            controller: userName,
            keyboardType: TextInputType.name,
            autofocus: false,
            textInputAction: TextInputAction.next,
            decoration: DCSize().inputDec('Username'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Username can not be empty';
              }
              return null;
            },
          ),
          SizedBox(height: 18),
          TextFormField(
            controller: password,
            keyboardType: TextInputType.visiblePassword,
            autofocus: false,
            textInputAction: TextInputAction.send,
            obscureText: true,
            decoration: DCSize().inputDec('Password'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Username can not be empty';
              }
              return null;
            },
          ),
          SizedBox(height: 36),
          SizedBox(
            width: width,
            child: ElevatedButton(
              onPressed: _submit,
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Colors.white,
                textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                fixedSize: Size(120, 56),
                elevation: 5.4,
              ),
              child: isSubmitting
                  ? CircularProgressIndicator.adaptive(
                      valueColor: AlwaysStoppedAnimation(Colors.white),
                    )
                  : Text('Login'),
            ),
          ),
        ],
      ),
    );
  }

  _contactSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 45),
        Text(
          'For Assistance & Login Details Contact: ',
          style: contactLabel,
        ),
        SizedBox(height: 2.7),
        Table(
          columnWidths: const {
            0: FlexColumnWidth(2.3),
            1: FlexColumnWidth(0.5),
            2: FlexColumnWidth(1.7)
          },
          children: [
            TableRow(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 2.7),
                  child:
                      Text('English, Kannada & Telugu ', style: contactLabel),
                ),
                Text(':', style: contactLabel),
                GestureDetector(
                    onTap: () => _dialNumber('7406333800'),
                    child: Text('7406333800',
                        style: callText, textAlign: TextAlign.left)),
              ],
            ),
            TableRow(
              children: [
                Text('English, Kannada & Hindi ', style: contactLabel),
                Text(':', style: contactLabel),
                GestureDetector(
                    onTap: () => _dialNumber('9071386515'),
                    child: Text('9071386515',
                        style: callText, textAlign: TextAlign.left)),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
