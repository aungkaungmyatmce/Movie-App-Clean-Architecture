import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_clean_architecture/common/constants/size_constants.dart';
import 'package:movie_app_clean_architecture/common/extensions/size_extensions.dart';

import '../../blocs/loading/loading_cubit.dart';
import 'loading_circle.dart';

class LoadingScreen extends StatelessWidget {
  final Widget screen;

  const LoadingScreen({Key? key, required this.screen}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoadingCubit, bool>(
      builder: (context, shouldShow) {
        return Stack(
          fit: StackFit.expand,
          children: [
            screen,
            if (shouldShow)
              Center(
                child: LoadingCircle(
                  size: Sizes.dimen_200.w,
                ),
              ),
          ],
        );
      },
    );
  }
}
