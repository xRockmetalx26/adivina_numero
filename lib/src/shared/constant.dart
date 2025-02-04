// Flutter imports:
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// ---------------------------------------- Border Radius ---------------------------------------- //

/// `Radius.circular(10)`
const kDialogBorder = RoundedRectangleBorder(
  borderRadius: BorderRadius.all(Radius.circular(10)),
);

/// `Radius.circular(12.5)`
const kButtonBorder = RoundedRectangleBorder(
  borderRadius: BorderRadius.all(Radius.circular(12.5)),
);

/// `Radius.circular(15)`
const kMenuBorder = RoundedRectangleBorder(
  borderRadius: BorderRadius.all(Radius.circular(15)),
);

/// `Radius.circular(20)`
const k20Radius = BorderRadius.all(Radius.circular(20));

// ---------------------------------------- Button Sizes ---------------------------------------- //

/// `height` = 40
const kSmallButtonHeight = 40.0;

/// `height` = 50
const kNormalButtonHeight = 50.0;

/// `height` = 60
const kBigButtonHeight = 60.0;

/// `size` = Size(200, 40)
const kNormalButtonSize = Size(200, kSmallButtonHeight);

/// `double.maxFinite`
const kDynamicDimension = double.infinity;

/// `double.maxFinite`
const kInfinityDimension = double.maxFinite;

// ---------------------------------------- Text Styles ---------------------------------------- //

/// `fontSize` = 8, `letterSpacing` = 1
const k8Style = TextStyle(
  fontSize: 8,
  letterSpacing: 1,
);

/// `fontSize` = 10, `letterSpacing` = 1
const kSmallestStyle = TextStyle(
  fontSize: 10,
  letterSpacing: 1,
);

/// `fontSize` = 12, `letterSpacing` = 1
const kSmallStyle = TextStyle(
  fontSize: 12,
  letterSpacing: 1,
);

/// `fontSize` = 14, `letterSpacing` = 1
const kNormalStyle = TextStyle(
  fontSize: 14,
  letterSpacing: 1,
);

/// `fontSize` = 16, `letterSpacing` = 1
const kBigStyle = TextStyle(
  fontSize: 16,
  letterSpacing: 1,
);

/// `fontSize` = 18, `letterSpacing` = 1
const kBiggestStyle = TextStyle(
  fontSize: 18,
  letterSpacing: 1,
);

/// `fontSize` = 20, `letterSpacing` = 1
const k20Style = TextStyle(
  fontSize: 20,
  letterSpacing: 1,
);

/// `fontSize` = 25, `letterSpacing` = 1
const k25Style = TextStyle(
  fontSize: 25,
  letterSpacing: 1,
);

/// `fontSize` = 30, `letterSpacing` = 1
const k30Style = TextStyle(
  fontSize: 30,
  letterSpacing: 1,
);

// ---------------------------------------- App Constants ---------------------------------------- //

const kFloatingElevation = 6.0;
const kDefaultCountryCode = kDebugMode ? '+57' : '+58';
const kDniLenght = 8;
const kPhoneLenght = 12;
const kOtpLenght = 6;
const kOtpSeconds = 60;
const kPinLenght = 6;
const kMaxNameLenght = 140;

// ---------------------------------------- App Widgets ---------------------------------------- //

const kBackButtonIcon = Icon(
  Icons.chevron_left,
  size: 32,
);
