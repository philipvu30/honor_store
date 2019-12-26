import 'package:flutter/material.dart';

const kReusableCardMargin = 8.0;
const kReusableCardWidth = 160.0;
const kReusableCardHeight = 160.0;
const kLeftMargin = 8.0;
const kRightMargin = 8.0;
const kTopMargin = 8.0;
const kBottomMargin = 8.0;
const kAllMargin = 8.0;
const kHorizontalPadding = 8.0;
const kVerticalPadding = 8.0;
const double kItemGridHeight = (400 - kToolbarHeight - 24) / 2;
const double kItemGridWidth = 500 / 2;
const String kTagAll = 'tất cả';
const String kTagWine = 'rượu';
const String kTagOil = 'dầu';
const String kTagOther = 'khác';
const String kTabWine = 'Rượu';
const String kTabOil = 'Dầu';
const String kTabOther = 'Khác';
const String kTabAll = 'Tất cả';
const int kHomeScreenColor = 0xff90ee90;
const int kTitleColor = 0xff007CFF;
const int kReusableCardBgColor = 0xffDCDCDC;

enum Screen {
  Home,
  Promotion,
  Product,
  Service,
  Store,
}
