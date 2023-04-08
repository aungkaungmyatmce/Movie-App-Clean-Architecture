import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app_clean_architecture/common/constants/size_constants.dart';
import 'package:movie_app_clean_architecture/common/extensions/size_extensions.dart';
import 'package:movie_app_clean_architecture/common/screenutil/screenutil.dart';
import 'package:movie_app_clean_architecture/presentation/blocs/search_movie/search_movie_cubit.dart';
import 'package:movie_app_clean_architecture/presentation/journeys/search_movie/custom_search_movie_delegate.dart';

import 'logo.dart';

class MovieAppBar extends StatelessWidget {
  const MovieAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(top: ScreenUtil.statusBarHeight + Sizes.dimen_4.h),
      child: Row(
        children: [
          IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: SvgPicture.asset(
                'assets/svgs/menu.svg',
                height: Sizes.dimen_12.h,
              )),
          Expanded(
              child: Logo(
            height: Sizes.dimen_14,
          )),
          IconButton(
              onPressed: () {
                showSearch(
                    context: context,
                    delegate: CustomSearchDelegate(
                        BlocProvider.of<SearchMovieCubit>(context)));
              },
              icon: Icon(
                Icons.search,
                color: Colors.white,
                size: Sizes.dimen_12.h,
              )),
        ],
      ),
    );
  }
}
