import 'dart:async';
import 'package:flutter/material.dart';

import 'helpers/clock_model.dart';
import 'helpers/spinner_text.dart';

class DigitalClock extends StatefulWidget {
  DigitalClock({
    this.is24HourTimeFormat,
    this.areaWidth,
    this.areaHeight,
    this.areaDecoration,
    this.digitDecoration,
    this.digitAnimationStyle,
    this.hourTextStyle,
    this.minuteTextStyle,
    this.secondTextStyle,
    this.amPmTextStyle,
  });

  final bool is24HourTimeFormat;
  final double areaWidth;
  final double areaHeight;
  final BoxDecoration areaDecoration;
  final BoxDecoration digitDecoration;
  final Curve digitAnimationStyle;
  final TextStyle hourTextStyle;
  final TextStyle minuteTextStyle;
  final TextStyle secondTextStyle;
  final TextStyle amPmTextStyle;

  @override
  _DigitalClockState createState() => _DigitalClockState();
}

class _DigitalClockState extends State<DigitalClock> {
  DateTime _dateTime;
  ClockModel _clockModel;
  @override
  void initState() {
    super.initState();
    _dateTime = DateTime.now();
    _clockModel = ClockModel();
    _clockModel.is24HourFormat = widget.is24HourTimeFormat!=null? widget.is24HourTimeFormat : true;
    _dateTime = DateTime.now();
    _clockModel.hour = _dateTime.hour;
    _clockModel.minute = _dateTime.minute;
    _clockModel.second = _dateTime.second;

    Timer.periodic(Duration(seconds: 1), (timer) {
      _dateTime = DateTime.now();
      _clockModel.hour = _dateTime.hour;
      _clockModel.minute = _dateTime.minute;
      _clockModel.second = _dateTime.second;

      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.areaWidth != null ? widget.areaWidth : 135,
      height: widget.areaHeight != null ? widget.areaHeight : 40,
      child: Container(
        decoration: widget.areaDecoration != null
            ? widget.areaDecoration
            : BoxDecoration(
                border: Border.all(color: Colors.transparent),
                borderRadius: BorderRadius.circular(20),
                color: Color.fromARGB(255, 3, 12, 84),
              ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Container(
              decoration: widget.digitDecoration,
              child: SpinnerText(
                text: _clockModel.is24HourTimeFormat
                    ? hTOhh_24hTrue(_clockModel.hour)
                    : hTOhh_24hFalse(_clockModel.hour)[0],
                animationStyle: widget.digitAnimationStyle,
                textStyle:
                    widget.hourTextStyle == null ? null : widget.hourTextStyle,
              ),
            ),
            Container(
                margin: EdgeInsets.only(bottom: 3, left: 2, right: 2),
                child: Text(
                  ":",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                )),
            Container(
              decoration: widget.digitDecoration,
              child: SpinnerText(
                text: mTOmm(_clockModel.minute),
                animationStyle: widget.digitAnimationStyle,
                textStyle: widget.minuteTextStyle == null
                    ? null
                    : widget.minuteTextStyle,
              ),
            ),
            SizedBox(
              width: 1,
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(5)),
              margin: EdgeInsets.only(bottom: 6),
              child: SpinnerText(
                text: sTOss(_clockModel.second),
                animationStyle: widget.digitAnimationStyle,
                textStyle: widget.secondTextStyle == null
                    ? TextStyle(fontSize: 12, color: Colors.white)
                    : widget.secondTextStyle,
              ),
            ),
            _clockModel.is24HourTimeFormat
                ? Text("")
                : Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: Text(
                      " " + hTOhh_24hFalse(_clockModel.hour)[1],
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}