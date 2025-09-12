import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../Common/color.dart' show colorPrimary;

String convertDateToDDMMYYYYFormat({String? dateString}) {
  DateTime dt = DateTime.parse(dateString!).toLocal();
  // String date = DateFormat("yyyy-MM-dd hh:mm a").format(dt).toString();
  String date = DateFormat().format(dt).toString();
  return date;
}

commonBottomSheet(BuildContext context,
    {GestureTapCallback? onTapCamera, GestureTapCallback? onTapGallery}) {
  return Container(
    margin: EdgeInsets.symmetric(
      vertical: MediaQuery.of(context).size.height * 0.05,
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        const Text(
          "Upload Document",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 21.0,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          TextButton(
            onPressed: onTapCamera,
            child: Row(
              children: const [
                Icon(Icons.camera, color: colorPrimary),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Camera",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 17.0,
                      color: colorPrimary),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 20.w,
          ),
          TextButton(
            onPressed: onTapGallery,
            child: Row(
              children: const [
                Icon(Icons.image, color: colorPrimary),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Gallery/Document",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 17.0,
                      color: colorPrimary),
                ),
              ],
            ),
          ),
        ])
      ],
    ),
  );
}

String convertDateToDDMMYYYFormat({String? dateString}) {
  DateTime dt = DateTime.parse(dateString!).toLocal();
  String date = DateFormat("dd/MM/yyyy").format(dt).toString();
  // String date = DateFormat().format(dt).toString();
  return date;
}

String convertDateTo({String? dateString}) {
  DateTime dt = DateTime.parse(dateString!).toLocal();
  String date = DateFormat("EEE, MMM dd yyyy").format(dt).toString();
  // String date = DateFormat().format(dt).toString();
  return date;
}

String convertDateTo1({String? dateString}) {
  DateTime dt = DateTime.parse(dateString!).toLocal();
  String date = DateFormat("EEE dd , MMM yyyy").format(dt).toString();
  // String date = DateFormat().format(dt).toString();
  return date;
}

String convertDateToRFQ({String? dateString}) {
  DateTime dt = DateTime.parse(dateString!).toLocal();
  String date = DateFormat("dd MMM yyyy").format(dt).toString();
  // String date = DateFormat().format(dt).toString();
  return date;
}

convertDate({String? dateString, required int duration}) {
  DateTime dt =
      DateTime.parse(dateString!).toLocal().add(Duration(days: duration));
  String date = DateFormat("EEE, MMM dd yyyy").format(dt).toString();
  return date;
}

convertDateMyCart({String? dateString, required int duration}) {
  DateTime dt =
      DateTime.parse(dateString!).toLocal().add(Duration(days: duration));
  String date = DateFormat("EEE,dd MMM yyy").format(dt).toString();
  return date;
}

convertDateOrder({String? dateString, required int duration}) {
  DateTime dt =
      DateTime.parse(dateString!).toLocal().add(Duration(days: duration));
  String date = DateFormat("EEE dd , MMM yyyy").format(dt).toString();
  return date;
}

convertDateNOw({DateTime? dateString, required int duration}) {
  DateTime dt = dateString!.add(Duration(days: duration));
  String date = DateFormat("EEE, MMM dd yyyy").format(dt).toString();
  return date;
}

convertProductDetails({DateTime? dateString, required int duration}) {
  DateTime dt = dateString!.add(Duration(days: duration));
  String date = DateFormat("EEE,dd MMM yyy").format(dt).toString();
  return date;
}

String convertTimestampToAgo(String timestamp) {
  DateTime now = DateTime.now();
  DateTime dt = DateTime.parse(timestamp).toLocal();
  String date = DateFormat("yyyy-MM-dd HH:mm:ss").format(dt).toString();
  DateTime time = DateTime.parse(date);

  // var eventTime = DateFormat("yyyy-MM-dd HH:mm:ss").parse(timestamp ?? '', true);
  // var local = eventTime.toLocal();
  // print(local);
  Duration difference = now.difference(dt);

  if (difference.inDays > 0) {
    return '${difference.inDays} ${difference.inDays == 1 ? "day" : "days"} ago';
  } else if (difference.inHours > 0) {
    return '${difference.inHours} ${difference.inHours == 1 ? "hour" : "hours"} ago';
  } else if (difference.inMinutes > 0) {
    return '${difference.inMinutes} ${difference.inMinutes == 1 ? "minute" : "minutes"} ago';
  } else {
    return 'Just now';
  }
}

String convertTimestampToAgoForChatList(String timestamp) {
  DateTime now = DateTime.now();
  DateTime dt = DateTime.parse(timestamp).toLocal();
  String date = DateFormat("yyyy-MM-dd HH:mm:ss").format(dt).toString();

  Duration difference = now.difference(dt);

  if (difference.inDays > 0) {
    return '${difference.inDays} ${difference.inDays == 1 ? "day" : "days"} ago';
  } else if (difference.inHours > 0) {
    return '${difference.inHours} ${difference.inHours == 1 ? "hr" : "hr"}';
  } else if (difference.inMinutes > 0) {
    return '${difference.inMinutes} ${difference.inMinutes == 1 ? "min" : "min"}';
  } else {
    return 'Just now';
  }
}

String chatDetails({String? dateString}) {
  DateTime now = DateTime.now();
  DateTime dt = DateTime.parse(dateString!).toLocal();
  String date = DateFormat("hh:mm a").format(dt).toString();
  String dateDate = DateFormat("dd-MM-yyyy hh:mm a").format(dt).toString();
  Duration difference = now.difference(dt);

  if (difference.inDays > 0) {
    return dateDate;
  }  else {
    return date;
  }
}
