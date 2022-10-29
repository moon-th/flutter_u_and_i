import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
// 데이터는 항상 부모 클래스에서 자식 클래스로
class _HomeScreenState extends State<HomeScreen> {
  // 날짜의 년,월,일 만 표기
  DateTime selectedDate = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.pink[100],
        body: SafeArea(
          bottom: false,
          child: Container(
            width: MediaQuery.of(context).size.width, // Container 의 사이즈를 현재 핸드폰의 사이즈로 변경
            child: Column(
              children: [
                _TopPart(
                  selectedDate: selectedDate,
                  onPressed : opHeartPressed,
                ),
                _BottomPart(),
              ],
            ),
          ),
        ));
  }


  void opHeartPressed(){

    final now = DateTime.now();
      // 하단에서 올라오는 Dialog 사용
      showCupertinoDialog(
        context: context,
        barrierDismissible: true, // 화면읠 터치할 경우 다이어로그가 사라지도록 설정 기본 true
        builder: (BuildContext context) {
          return Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Colors.white,
              height: 300.0,
              child: CupertinoDatePicker( //달력을 사용하기 위한 CupertinoDatePicker
                mode: CupertinoDatePickerMode.date, //date / dateAndTime / time 사용가능
                initialDateTime: selectedDate, // 초기날짜
                maximumDate: DateTime(
                  // 최대날짜
                    now.year,
                    now.month,
                    now.day),
                onDateTimeChanged: (DateTime date) { // DatePicker 에서 선택한 날짜를 받아온다
                  setState(() {
                    selectedDate = date;
                  });
                },
              ),
            ),
          );
        },
      );
  }
}

class _TopPart extends StatelessWidget {
  final DateTime selectedDate;
  final VoidCallback onPressed;

  _TopPart({required this.selectedDate, Key? key, required this.onPressed}) : super(key: key);

  final now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'U&I',
            style: textTheme.headline1,
          ),
          Column(
            children: [
              Text(
                '우리 처음 만난날',
                style: textTheme.bodyText1,
              ),
              Text(

                '${selectedDate.year}.${selectedDate.month}.${selectedDate.day}',
                style: textTheme.bodyText2,

              ),
            ],
          ),
          IconButton(
            iconSize: 60.0,
            onPressed:onPressed,
            icon: Icon(
              Icons.favorite,
              color: Colors.red,
            ),
          ),
          Text(
            'D+${DateTime(
                  now.year,
                  now.month,
                  now.day,
                ).difference(selectedDate).inDays + 1}',
            style: textTheme.headline2,
          )
        ],
      ),
    );
  }
}

class _BottomPart extends StatelessWidget {
  const _BottomPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Image.asset('asset/img/middle_image.jpg'));
  }
}
