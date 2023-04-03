import 'package:flutter/material.dart';
import 'package:movie_app_clean_architecture/presentation/themes/app_color.dart';
import 'package:wiredash/wiredash.dart';

class WireDashApp extends StatelessWidget {
  final String languageCode;
  final Widget child;
  const WireDashApp({Key? key, required this.child, required this.languageCode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wiredash(
        projectId: 'movie-app-attiukk',
        secret: '1RoFbzDfIFuBWriwwN1xEJn0wXWcM6or',
        theme: WiredashThemeData(
          brightness: Brightness.dark,
          primaryColor: AppColor.royalBlue,
          secondaryColor: AppColor.violet,
          secondaryBackgroundColor: AppColor.vulcan,
        ),
        options: WiredashOptionsData(
          locale: Locale.fromSubtags(languageCode: languageCode),
        ),
        child: child);
  }
}
