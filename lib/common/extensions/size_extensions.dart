import 'package:movie_app_clean_architecture/common/screenutil/screenutil.dart';

extension SizeExtension on num {
  double get w => ScreenUtil().setWidth(this);
  double get h => ScreenUtil().setHeight(this);
  double get sp => ScreenUtil().setSp(this);
}
