import 'package:achievement_view/achievement_view.dart';
import 'package:familyapp/screens/widget/ui_helpers.dart';
import 'package:flutter/material.dart';

void respondMessage(
  BuildContext context, {
  String title,
  String subTitle,
  Color color,
  IconData icon,
  bool isSuccess = true,
}) {
  AchievementView(
    context,
    elevation: 0,
    title: title,
    subTitle: subTitle,
    //onTab: _onTabAchievement,
    icon: Icon(
      icon ?? Icons.error,
      color: Colors.white,
    ),
    borderRadius: BorderRadius.all(Radius.circular(5)),
    //typeAnimationContent: AnimationTypeAchievement.fadeSlideToUp,
    // borderRadius: 5.0,
    color: isSuccess ? Theme.of(context).primaryColor : Colors.red,
    //textStyleTitle: TextStyle(),
    //textStyleSubTitle: TextStyle(),
    alignment: Alignment.center,
    duration: Duration(seconds: 3),
    isCircle: true,
    // listener: (status) {
    //   print(status);
    //   AchievementState.opening
    //   AchievementState.open
    //   AchievementState.closing
    //   AchievementState.closed
    // },
  )..show();
}

void universalLoading(
  BuildContext context, {
  AlignmentGeometry alignment,
  String content,
}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Dialog(
        alignment: alignment ?? Alignment.center,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: SizedBox(
          height: UIHelper.deviceHeigth(context) / 10,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              // crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
                ),
                UIHelper.horizontalSpace(width: 12),
                Text(
                  content,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

class NoData extends StatelessWidget {
  final String title;
  final String description;
  final String imagepath;

  const NoData({Key key, this.description, this.imagepath, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Image.asset(
            imagepath,
            height: 200,
            width: 200,
          ),
          UIHelper.verticalSpace(height: 25),
          Text(
            title,
            style: Theme.of(context).textTheme.headline3.copyWith(fontSize: 24, color: Colors.black),
          ),
          UIHelper.verticalSpace(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 37, right: 37),
            child: Text(
              description,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
