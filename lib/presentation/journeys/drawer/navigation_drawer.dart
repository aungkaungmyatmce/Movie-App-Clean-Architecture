import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_clean_architecture/common/constants/languages.dart';
import 'package:movie_app_clean_architecture/common/constants/size_constants.dart';
import 'package:movie_app_clean_architecture/common/constants/translation_constants.dart';
import 'package:movie_app_clean_architecture/common/extensions/size_extensions.dart';
import 'package:movie_app_clean_architecture/common/extensions/string_extensions.dart';
import 'package:movie_app_clean_architecture/presentation/app_localizations.dart';
import 'package:movie_app_clean_architecture/presentation/blocs/language_bloc/language_bloc.dart';
import 'package:movie_app_clean_architecture/presentation/journeys/drawer/navigation_expanded_list_tile.dart';
import 'package:movie_app_clean_architecture/presentation/journeys/drawer/navigation_list_item.dart';
import 'package:movie_app_clean_architecture/presentation/themes/app_color.dart';
import 'package:movie_app_clean_architecture/presentation/widgets/logo.dart';
import 'package:wiredash/wiredash.dart';

import '../../widgets/app_dialog.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.7),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).primaryColor.withOpacity(0.7),
            blurRadius: 4,
          )
        ],
      ),
      width: Sizes.dimen_300.w,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: Sizes.dimen_6.h,
                bottom: Sizes.dimen_16.h,
                left: Sizes.dimen_6.w,
                right: Sizes.dimen_6.w,
              ),
              child: Logo(
                height: Sizes.dimen_20.h,
              ),
            ),
            NavigationListItem(
                title: TranslationConstants.favoriteMovies.t(context),
                onPressed: () {}),
            NavigationExpandedListItem(
              title: TranslationConstants.language.t(context),
              children: Languages.languages.map((e) => e.value).toList(),
              onPressed: (index) {
                BlocProvider.of<LanguageBloc>(context)
                    .add(ToggleLanguageEvent(Languages.languages[index]));
              },
            ),
            NavigationListItem(
                title: TranslationConstants.feedback.t(context),
                onPressed: () {
                  Scaffold.of(context).closeDrawer();
                  Wiredash.of(context).show();
                }),
            NavigationListItem(
                title: TranslationConstants.about.t(context),
                onPressed: () {
                  Navigator.of(context).pop();
                  _showDialog(context);
                }),
          ],
        ),
      ),
    );
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AppDialog(
        title: TranslationConstants.about,
        description: TranslationConstants.aboutDescription,
        buttonText: TranslationConstants.okay,
        image: Image.asset(
          'assets/pngs/tmdb_logo.png',
          height: Sizes.dimen_32.h,
        ),
      ),
    );
  }
}
