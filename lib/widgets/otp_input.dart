import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

Widget buildPinPut() {
  return Pinput(
    onCompleted: (pin) => print(pin),
  );
}
