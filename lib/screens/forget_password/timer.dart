import 'dart:async';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';

class TimerComponent extends StatefulWidget {
  // const TimerComponent({Key? key}) : super(key: key);
  final String lastEmail ;

  const TimerComponent({Key? key, required this.lastEmail}) : super(key: key);

  @override
  State<TimerComponent> createState() => _TimerComponentState();
}

class _TimerComponentState extends State<TimerComponent> {
  int _startTimeInSecond = 60;
  bool _isResend = false;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 300), startTimer);
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              child: Text('Resend',
                  style: TextStyle(
                      color: _isResend ? Colors.grey : Color(0xff1f95a1),
                      fontWeight: FontWeight.w600)),
              onPressed: _isResend
                  ? null
                  : () {
                resetPassword(widget.lastEmail);
                setState(() {

                  _startTimeInSecond = 60;
                });
                Future.delayed(
                    const Duration(milliseconds: 300), startTimer);
              },
            ),
          ],
        ),
        const SizedBox(width: 10),
        Text(
          '${_timeFormate(_startTimeInSecond ~/ 60)}:${_timeFormate(_startTimeInSecond % 60)}',
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Color(0xff1f95a1),
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(width: 10),
      ],
    );
  }

  void startTimer() {
    int sec = 1;
    _timer = Timer.periodic(Duration(seconds: sec), (timer) {
      if (_startTimeInSecond == 0) {
        setState(() {
          timer.cancel();
          _isResend = false;
        });
      } else {
        setState(() {
          _startTimeInSecond--;
          _isResend = true;
          print(_startTimeInSecond);
        });
      }
    });
  }

  String _timeFormate(int time) {
    if (time < 10) return '0$time';
    return '$time';
  }
  Future<void> resetPassword(email) async {
    email=widget.lastEmail;
    Map data = {
      'gmail': email,
    };
    print(data.toString());
    if (email.isNotEmpty ) {
      Response response = await http.post(
        Uri.parse('https://graduation-api.herokuapp.com/admin/resetPassword'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(data),
      );
      var _data = jsonDecode(response.body);

      // Map<String, dynamic> user = _data['user'];
      //

      print(_data['codeNumber']);
      // print(_data);
      if (response.statusCode == 200) {
        print(_data['message']);
        print('code send to this gmail');
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Code send")));
      } else {
        print(_data['message']);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Wrong Email"),
        ));
      }
    }
  }
}
