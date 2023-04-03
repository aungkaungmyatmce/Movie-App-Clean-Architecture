import 'package:flutter/material.dart';
import 'package:movie_app_clean_architecture/common/extensions/size_extensions.dart';
import 'package:movie_app_clean_architecture/common/extensions/string_extensions.dart';
import 'package:movie_app_clean_architecture/domain/entities/app_error.dart';
import 'package:movie_app_clean_architecture/presentation/blocs/movie_carousel/movie_carousel_bloc.dart';
import 'package:wiredash/wiredash.dart';

import '../../common/constants/size_constants.dart';
import '../../common/constants/translation_constants.dart';

class AppErrorWidget extends StatelessWidget {
  final AppErrorType errorType;
  final Function onPressed;

  const AppErrorWidget({
    Key? key,
    required this.errorType,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_32.w),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            errorType == AppErrorType.api
                ? TranslationConstants.somethingWentWrong.t(context)
                : TranslationConstants.checkNetwork.t(context),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          ButtonBar(
            children: [
              TextButton(
                onPressed: () => onPressed,
                child: Text(TranslationConstants.retry),
              ),
              TextButton(
                onPressed: () => Wiredash.of(context)?.show(),
                child: Text(
                  TranslationConstants.feedback,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
