import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Constants {
  // Apps Names
  static String AmazoneAppName = 'Amazon Ui Clone';
  static String NoonAppName = 'Noon Ui Clone';
  static String HangerStationAppName = 'HangerStation Ui Clone';
  static String MarsolAppName = 'Marsol Ui Clone';
  static String RestaurantsAppName = 'Restaurants Ui Clone';
  static String AqarAppName = 'AqarApp Ui Clone';
  static String LinkedInAppName = 'LinkedIn Ui Clone';

  // Apps Paths

  static String AmazoneApp = 'AmazonApp';
  static String NoonApp = 'NoonApp';
  static String HangerStationApp = 'HangerStationApp';
  static String MarsolApp = 'MarsolApp';
  static String RestaurantsApp = 'RestaurantsApp';
  static String AqarApp = 'AqarApp';
  static String LinkedInApp = 'LinkedInApp';

  // Images
  static String AmazoneLogo = 'assets/images/amazon_app/amazon_logo.jpg';
  static String NoonLogo = 'assets/images/noon_app/noon2.png';
  static String HangerStationLogo = 'assets/images/hanger_app/hanger.png';
  static String MarsolAppLogo = 'assets/images/marsol_app/marsol.png';
  static String RestaurantsAppLogo = 'assets/images/resturants_ui_app/icon/burger.jpg';
  static String AqarAppLogo = 'assets/images/aqar_app/logo.png';
  static String LinkedInAppLogo = 'assets/images/linkedin_app/index.png';
}

class ColorConstants {
  // static const primaryColor = const Color(0xffF79352);
  static const primaryColor = const Color(0xff514b52);
  static const primaryColor2 = const Color(0xffffdd00);
  static const primaryColor3 = const Color(0xffE3FFE2);
  static const primaryColor33 = const Color(0xffE3920C);
}

const kSpacingUnit = 10;

const kDarkPrimaryColor = Color(0xFF212121);
const kDarkSecondaryColor = Color(0xFF373737);
const kLightPrimaryColor = Color(0xFFFFFFFF);
const kLightSecondaryColor = Color(0xFFF3F7FB);
const kAccentColor = Color(0xFFFFC107);

final kTitleTextStyle = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w600,
);

final kCaptionTextStyle = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w100,
);

final kButtonTextStyle = TextStyle(
  fontSize: 14,
  fontWeight: FontWeight.w400,
  color: kDarkPrimaryColor,
);

final kDarkTheme = ThemeData(
  brightness: Brightness.dark,
  fontFamily: 'SFProText',
  primaryColor: kDarkPrimaryColor,
  canvasColor: kDarkPrimaryColor,
  backgroundColor: kDarkSecondaryColor,
  accentColor: kAccentColor,
  iconTheme: ThemeData.dark().iconTheme.copyWith(
        color: kLightSecondaryColor,
      ),
  textTheme: ThemeData.dark().textTheme.apply(
        fontFamily: 'SFProText',
        bodyColor: kLightSecondaryColor,
        displayColor: kLightSecondaryColor,
      ),
);

final kLightTheme = ThemeData(
  brightness: Brightness.dark,
  fontFamily: 'SFProText',
  primaryColor: kLightPrimaryColor,
  canvasColor: kLightPrimaryColor,
  backgroundColor: kAccentColor,
  accentColor: kAccentColor,
  iconTheme: ThemeData.light().iconTheme.copyWith(
        color: kDarkSecondaryColor,
      ),
  textTheme: ThemeData.light().textTheme.apply(
        fontFamily: 'SFProText',
        bodyColor: kDarkSecondaryColor,
        displayColor: kDarkSecondaryColor,
      ),
);
final fontStyle = GoogleFonts.almarai(
  textStyle: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.normal,
    color: Colors.black87,
    height: 1.5,
  ),
);
InputDecoration textFieldDecorationCircle(
    {String? hint, String? lable, Icon? suffixIcon,Icon? prefixIcon, TextStyle? style}) {
  style = fontStyle.copyWith(color: Colors.grey, fontSize: 14);
  return InputDecoration(
    // prefixIcon: icon,
//      prefixIcon: icon,
//     icon: icon,
    suffixIcon: suffixIcon,
    prefixIcon: prefixIcon,
    fillColor:  Color(0xFFEFF2F7),

    hintTextDirection: TextDirection.rtl,
    floatingLabelBehavior: FloatingLabelBehavior.never,
    contentPadding: EdgeInsets.all(10),
    hintText: hint,
    labelText: lable,
    hintStyle: style,
    labelStyle: style,
    enabled: false,
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.blue),
      borderRadius: BorderRadius.all(Radius.circular(5)),
    ),
    disabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey),
      borderRadius: BorderRadius.all(Radius.circular(5)),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey),
      borderRadius: BorderRadius.all(Radius.circular(5)),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.redAccent),
      borderRadius: BorderRadius.all(Radius.circular(5)),
    ),
  );
}

/// key
// keytool -genkey -v -keystore C:\Users\MaNoOox\appui_key.jks -storetype JKS -keyalg RSA -keysize 2048 -validity 10000 -alias key
// test appboundl
// java -jar bundletool-all-1.4.0.jar build-apks --bundle=/h/Android Projects/Flutter Projects/Mine/ui_clones/ui_clones/build/app/outputs/bundle/release/app-release.aab --output=out_bundle_archive_set.apks
// keytool -genkey -v -keystore  C:\Users\MaNoOox\key.jks -storetype JKS -keyalg RSA -keysize 2048 -validity 10000 -alias key

// class ImagesConstants {
//   static var s = Image.asset('assets/images/r');
//   static var s2 = Image.asset('assets/images/food');
//   static var s1 = Image.asset('assets/images/pizza-1.png');
//   static var s3 = Image.asset('assets/images/');
//   static var s4 = Image.asset('assets/images/');
// }

const  List<String> names = [
  'شقة للبيع',
  'فيلا للبيع',
  'بيت للبيع',
  'إستراحة للبيع',
  ' مزرعة للبيع',
  'شقة للإيجار',
  'فيلا للإيجار',
  'بيت للإيجار',
  'إستراحة للإيجار',
  ' مزرعة للإيجار',
];
