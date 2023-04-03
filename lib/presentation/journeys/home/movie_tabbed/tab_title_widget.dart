import 'package:flutter/material.dart';
import 'package:movie_app_clean_architecture/common/constants/size_constants.dart';
import 'package:movie_app_clean_architecture/common/extensions/size_extensions.dart';
import 'package:movie_app_clean_architecture/common/extensions/string_extensions.dart';
import 'package:movie_app_clean_architecture/presentation/app_localizations.dart';
import 'package:movie_app_clean_architecture/presentation/themes/app_color.dart';
import 'package:movie_app_clean_architecture/presentation/themes/theme_text.dart';

class TabTitleWidget extends StatelessWidget {
  final String title;
  final Function() onTap;
  final bool isSelected;
  const TabTitleWidget(
      {Key? key,
      required this.title,
      required this.onTap,
      this.isSelected = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.transparent,
            border: Border(
                bottom: BorderSide(
              color: isSelected ? AppColor.royalBlue : Colors.transparent,
              width: Sizes.dimen_1.h,
            ))),
        child: Text(
          title.t(context),
          style: isSelected
              ? Theme.of(context).textTheme.royalBlueSubtitle1
              : Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}
