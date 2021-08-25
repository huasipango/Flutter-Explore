import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  SliderPage({Key? key}) : super(key: key);

  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _sliderValue = 100;
  bool? _checkblock = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sliders'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50),
        child: Column(
          children: [
            _createSlider(),
            _createCheckbox(),
            _createSwitch(),
            Expanded(child: _createImage()),
          ],
        ),
      ),
    );
  }

  Widget _createSlider() {
    return Slider(
        activeColor: Colors.indigoAccent,
        label: 'Image size',
        divisions: 20,
        value: _sliderValue,
        min: 10,
        max: 400,
        onChanged: (!(_checkblock!))
            ? null
            : (value) {
                setState(() {
                  _sliderValue = value;
                });
              });
  }

  Widget _createImage() {
    return Image(
      image: NetworkImage(
          'https://logos-marcas.com/wp-content/uploads/2020/11/Superman-Logo.png'),
      width: _sliderValue,
    );
  }

  Widget _createCheckbox() {
    // return Checkbox(
    //     value: _checkblock,
    //     onChanged: (newValue) {
    //       setState(() {
    //         _checkblock = newValue;
    //       });
    //     });
    return CheckboxListTile(
        title: Text('Block slider'),
        value: _checkblock,
        onChanged: (newValue) {
          setState(() {
            _checkblock = newValue;
          });
        });
  }

  Widget _createSwitch() {
    return SwitchListTile(
        title: Text('Block slider'),
        value: _checkblock!,
        onChanged: (newValue) {
          setState(() {
            _checkblock = newValue;
          });
        });
  }
}
