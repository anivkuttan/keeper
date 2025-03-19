import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keeper/core/di/di.dart';
import 'package:keeper/src/login/view_model/cubit/login_cubit.dart';

class DependancyInjection extends StatelessWidget {
  const DependancyInjection({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginCubit>(create: (context) => getIt<LoginCubit>()),
      ],
      child: child,
    );
  }
}
