import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:movie_app_clean_architecture/common/constants/languages.dart';
import 'package:movie_app_clean_architecture/di/get_it.dart';
import 'package:movie_app_clean_architecture/presentation/blocs/language_bloc/language_bloc.dart';
import 'package:movie_app_clean_architecture/presentation/themes/app_color.dart';
import 'package:movie_app_clean_architecture/presentation/themes/theme_text.dart';
import 'package:movie_app_clean_architecture/presentation/wiredash_app.dart';
import '../common/screenutil/screenutil.dart';
import 'app_localizations.dart';
import 'journeys/home/home_screen.dart';

class MovieApp extends StatefulWidget {
  const MovieApp({Key? key}) : super(key: key);

  @override
  State<MovieApp> createState() => _MovieAppState();
}

class _MovieAppState extends State<MovieApp> {
  late LanguageBloc _languageBloc;

  @override
  void initState() {
    _languageBloc = getItInstance<LanguageBloc>();
    super.initState();
  }

  @override
  void dispose() {
    _languageBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init();
    return BlocProvider<LanguageBloc>(
      create: (context) => _languageBloc,
      child: BlocBuilder<LanguageBloc, LanguageState>(
        builder: (context, state) {
          if (state is LanguageLoaded) {
            return WireDashApp(
              languageCode: state.locale.languageCode,
              child: MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Movie App',
                theme: ThemeData(
                  unselectedWidgetColor: AppColor.royalBlue,
                  primaryColor: AppColor.vulcan,
                  scaffoldBackgroundColor: AppColor.vulcan,
                  brightness: Brightness.light,
                  cardTheme: CardTheme(
                    color: AppColor.vulcan,
                  ),
                  visualDensity: VisualDensity.adaptivePlatformDensity,
                  textTheme: ThemeText.getTextTheme(),
                  appBarTheme: const AppBarTheme(
                      elevation: 0, backgroundColor: AppColor.vulcan),
                  inputDecorationTheme: InputDecorationTheme(
                    hintStyle: Theme.of(context).textTheme.greySubtitle1,
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: AppColor.vulcan,
                      ),
                    ),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey)),
                  ),
                ),
                supportedLocales:
                    Languages.languages.map((e) => Locale(e.code)).toList(),
                locale: state.locale,
                localizationsDelegates: [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                home: HomeScreen(),
              ),
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}
