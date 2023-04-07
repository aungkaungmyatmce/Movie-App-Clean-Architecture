import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:movie_app_clean_architecture/common/constants/languages.dart';
import 'package:movie_app_clean_architecture/common/constants/route_constants.dart';
import 'package:movie_app_clean_architecture/di/get_it.dart';
import 'package:movie_app_clean_architecture/presentation/blocs/language_bloc/language_bloc.dart';
import 'package:movie_app_clean_architecture/presentation/blocs/loading/loading_cubit.dart';
import 'package:movie_app_clean_architecture/presentation/blocs/login/login_bloc.dart';
import 'package:movie_app_clean_architecture/presentation/journeys/loading/loading_screen.dart';
import 'package:movie_app_clean_architecture/presentation/routes.dart';
import 'package:movie_app_clean_architecture/presentation/themes/app_color.dart';
import 'package:movie_app_clean_architecture/presentation/themes/theme_text.dart';
import 'package:movie_app_clean_architecture/presentation/wiredash_app.dart';
import '../common/screenutil/screenutil.dart';
import 'app_localizations.dart';
import 'fade_page_route_builder.dart';
import 'journeys/home/home_screen.dart';

class MovieApp extends StatefulWidget {
  const MovieApp({Key? key}) : super(key: key);

  @override
  State<MovieApp> createState() => _MovieAppState();
}

class _MovieAppState extends State<MovieApp> {
  late LanguageBloc _languageBloc;
  late LoginBloc _loginBloc;
  late LoadingCubit _loadingBloc;

  @override
  void initState() {
    _languageBloc = getItInstance<LanguageBloc>();
    _languageBloc.add(LoadPreferredLanguageEvent());
    _loginBloc = getItInstance<LoginBloc>();
    _loadingBloc = getItInstance<LoadingCubit>();
    super.initState();
  }

  @override
  void dispose() {
    _languageBloc.close();
    _loginBloc.close();
    _loadingBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init();
    return MultiBlocProvider(
      providers: [
        BlocProvider<LanguageBloc>.value(value: _languageBloc),
        BlocProvider<LoginBloc>.value(value: _loginBloc),
        BlocProvider<LoadingCubit>.value(value: _loadingBloc),
      ],
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
                // home: HomeScreen(),
                builder: (context, child) {
                  return LoadingScreen(screen: child!);
                },
                initialRoute: RouteList.initial,
                onGenerateRoute: (RouteSettings settings) {
                  final routes = Routes.getRoutes(settings);
                  final WidgetBuilder? builder = routes[settings.name];
                  return FadePageRouteBuilder(
                    builder: builder!,
                    settings: settings,
                  );
                },
              ),
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}
