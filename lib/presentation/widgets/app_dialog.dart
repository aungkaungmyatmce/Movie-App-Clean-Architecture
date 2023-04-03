import 'package:flutter/material.dart';
import 'package:movie_app_clean_architecture/common/extensions/size_extensions.dart';
import 'package:movie_app_clean_architecture/common/extensions/string_extensions.dart';

import '../../common/constants/size_constants.dart';
import '../../common/constants/translation_constants.dart';
import '../themes/app_color.dart';

class AppDialog extends StatelessWidget {
  final String title, description, buttonText;
  final Widget? image;
  const AppDialog(
      {Key? key,
      required this.title,
      required this.description,
      required this.buttonText,
      this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColor.vulcan,
      elevation: Sizes.dimen_32,
      insetPadding: EdgeInsets.all(Sizes.dimen_32.w),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(Sizes.dimen_8.w)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title.t(context),
            style: Theme.of(context).textTheme.headline5,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: Sizes.dimen_6.h),
            child: Text(
              description.t(context),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ),
          if (image != null) image!,
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text(TranslationConstants.okay),
          ),
        ],
      ),
    );
  }
}
