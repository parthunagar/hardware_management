
import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:vpn_scanner/Constant/colors.dart';

class CustomProgressBar extends StatefulWidget {
  const CustomProgressBar({Key? key}) : super(key: key);

  @override
  _CustomProgressBarState createState() => _CustomProgressBarState();
}

class _CustomProgressBarState extends State<CustomProgressBar> {
  @override
  Widget build(BuildContext context) {
    return Center(child: SpinKitFadingCircle(color: cBlue, size: 50.0));
  }
}
