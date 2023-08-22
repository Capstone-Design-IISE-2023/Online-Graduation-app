import 'package:flutter/material.dart';
import 'package:online_graduation/utils/color_constant.dart';

enum SingingCharacter { Male, Female }

class InputScreen extends StatefulWidget {
  const InputScreen({super.key});

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  SingingCharacter? _character = SingingCharacter.Male;

  Widget submitButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: PINK,
      ),
      onPressed: () {},
      child: const Text(
        'Submit',
        style: TextStyle(
          color: WHITE,
        ),
      ),
    );
  }

  Widget radioButton() {
    return Column(
      children: <Widget>[
        ListTile(
          title: const Text('Male'),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.Male,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Female'),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.Female,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
      ],
    );
  }

  Widget container({required double height}) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        height: height,
        width: 350,
        decoration: BoxDecoration(border: Border.all()),
      ),
    );
  }

  Widget uploadButton() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        height: 350,
        width: 350,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.pink.shade50,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.photo,
                size: 50,
                color: Colors.pink.shade300,
              ),
            ),
            const Text(
              'Select',
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 18,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget titleWithDivider({required String title}) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16.0,
        right: 16,
        top: 32,
      ),
      child: Row(
        children: [
          Text(
            "$title   ",
            style: const TextStyle(
              // fontFamily: 'PyeongChangPeace',
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: PINK,
            ),
          ),
          Flexible(
            child: Container(
              height: 0.7,
              color: PINK,
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Padding(
          padding: EdgeInsets.only(left: 8),
          child: Text(
            'Create Your Own Photo',
            style: TextStyle(
              fontFamily: 'PyeongChangPeace',
              fontWeight: FontWeight.bold,
              color: PINK,
              fontSize: 24,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              titleWithDivider(title: 'Image Guide'),
              container(height: 250),
              titleWithDivider(title: 'Upload your photos'),
              uploadButton(),
              titleWithDivider(title: 'Select your options'),
              radioButton(),
              submitButton(),
            ],
          ),
        ),
      ),
    );
  }
}
