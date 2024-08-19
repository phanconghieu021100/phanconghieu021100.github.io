import 'package:flutter/material.dart';

class AppColors {
  static const Color active = Color(0xffEFAD02);
  static const Color bgActive = Color(0xFFFFF8E7);
  static const Color greyBg = Color(0xffF8F8F8);
  static const Color blueGradient = Color(0xff26CDF1);
  static const Color bgLounge = Color(0xff003CA6);
  static const Color bookingQRCode = Color(0xff019CB4);
  static const Color bluePrimary = Color(0xff005A8C);
  static const Color shortTrip = Color(0xffBFE3F7);
  static const Color unActive = Color(0xffCCCCCC);
  static const Color border = Color(0xffE6E6E6);
  static const Color border2 = Color(0xffD9D9D9);
  static const Color border3 = Color.fromARGB(255, 172, 169, 169);
  static const Color bgAlmostTime = Color(0xffE6E6E6);
  static const Color red = Color(0xffEF5350);
  static const Color pink = Color(0xffFFD7D7);
  static const Color hint = Color(0xff999999);
  static const Color caption = Color(0xff333333);
  static const Color activeStatus = Color(0xff8FD00A);
  static const Color unActiveStatus = Color(0xffCCCCCC);
  static const Color textCaption = Color(0xff666666);
  static const Color typeEmployee = Color(0xff2580B2);
  static const Color textSmall = Color(0xff999999);
  static const Color shadow = Color(0xff086EA8);
  static const Color shadow2 = Color.fromRGBO(8, 110, 168, 0.1);
  static const Color selected = Color(0xff2580B3);
  static const Color borderCheck = Color(0xff828282);
  static const Color checkEmployee = Color(0xffDEF3FF);
  static const Color airportCode = Color(0xff3DA5DE);
  static const Color bgEmployee = Color(0xffEAF7FF);
  static const Color contact1 = Color(0xff935757);
  static const Color contact2 = Color(0xff5C7E50);
  static const Color purple = Color(0xff9747FF);
  static const Color shadow3 = Color(0xff086EA8);
  static const Color bgVN = Color(0xff006885);
  static const Color grayF9F9F9 = Color(0xfff9f9f9);
  static const Color blue3184B2 = Color(0xff3184B2);
  static const Color blue2FA4E5 = Color(0xff2FA4E5);
  static const Color blue005A8C = Color(0xff005A8C);
  static const Color white = Colors.white;
  static const Color redEC2029 = Color(0xFFEC2029);
  static const Color green64AC54 = Color(0xFF64AC54);

  // agency
  static const Color newStatus = Color(0xffFFD977);
  static const Color inContract = Color(0xffAFE3FF);
  static const Color signed = Color(0xff648BD7);
  static const Color green = Color(0xff59D483);
  static const Color done = Color(0xffD6FFDA);
  static const Color newStatusText = Color(0xffF17A0B);
  static const Color inContractText = Color(0xff257EAF);
  static const Color signedText = Color(0xffE1E0FF);
  static const Color deliveredText = Color(0xff154D14);
  static const Color doneText = Color(0xff19AD39);
  static const Color headerFlight = Color(0xffECFBFD);
  static const Color inputBg = Color(0xffE6EAF2);
  static const Color secondActive = Color(0xffFFF2D0);
  static const Color gradientBefore = Color(0xffFFAB49);
  static const Color bgStatusIns = Color(0xffCBF3FF);
  static const Color almostTime = Color(0xffFFE49D);
  static const Color gradientAfter = Color(0xff0066C3);
  static const Color scrollBlue = Color(0xffDDF3FF);
  static const Color backgroundBlue = Color(0xffEAF7FF);
  static const Color shadowBlue = Color(0xff086EA8);
  static const Color backgroundGreen = Color(0xff59D583);
  static const Color available = Color(0xff3DA5DE);
  static const Color backgroundTitle = Color(0xffF5F5F5);
  static const Color blackText = Color(0xff090E1B);
  static const Color grayPreview = Color(0xffCACACA);
  static const Color redBackground = Color(0xffFFE3E2);
  static const Color paymentBg = Color(0xffEAF6FC);
  static const Color pinkBg = Color(0xffFFBCBC);
  static const Color pinkText = Color(0xffEA55A5);
  static const Color bgTrip = Color(0xffFFF8E7);
  // filter color
  static const Color exportColor = Color(0xff154D14);
  static const Color holdColor = Color(0xff257EAF);
  static const Color bookingCode = Color(0xff2FA4E5);
  static const Color bgCancel = Color(0xffFFE3E2);
  static const Color bgHold = Color(0xffFFF2AF);
  // airline color
  static const Color colorVNA = Color(0xff166987);
  static const Color colorVJ = Color(0xffEC2029);
  static const Color colorQH = Color(0xff64AC54);
  static const Color colorVU = Color(0xffFFC80B);
  // color gradient
  static const Color gradient1 = Color(0xffFFAB49);
  static const Color gradient2 = Color(0xff0066C4);
  static const Color bgDayPrice = Color(0xffFFF7EA);
  static const Color bgTable = Color(0xffCCCCCC);

  static Color getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');

    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }

    return Color(int.parse(hexColor, radix: 16));
  }

  // main: background1: background2
  static const ticketColors = {
    '#EFAD02': ['#FFD76F', '#F5EF8A'],
    '#E22326': ['#EA9E9F', '#F9D3D4'],
    '#45B143': ['#ACD7AB', '#DAEFD9'],
    '#0088FF': ['#90C6F6', '#DDF3FF'],
    '#40B0C9': ['#AAD6E0', '#D9EFF4'],
    '#343434': ['#A5A5A5', '#D6D6D6'],
    '#CD2A7A': ['#E2A1C1', '#F5D4E4'],
    '#6517F6': ['#B899F2', '#E0D1FD'],
    '#6E43C4': ['#BCABDE', '#E2D9F3'],
    '#F47D00': ['#F2C290', '#FDE5CC'],
    '#48C995': ['#ADE0CC', '#DAF4EA'],
    '#78808A': ['#C0C3C7', '#E4E6E8'],
  };
  // color airline config fee
  static const Color colorConfigVJ = Color(0xffFFE3E2);
  static const Color colorConfigVN = Color(0xffEAF7FF);
  static const Color colorConfigQH = Color(0xffD6FFDA);
  static const Color colorConfigVU = Color(0xffFFF8E7);
  static const Color colorConfig1G = Color(0xffE2F8FF);
}





