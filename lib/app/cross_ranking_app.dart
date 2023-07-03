import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app.dart';

class CrossRankingApp extends StatelessWidget {
  const CrossRankingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeCubit(),
        ),
        BlocProvider(
          create: (context) => EditWorkoutCubit(),
        ),
        BlocProvider(
          create: (context) => WorkoutDetailCubit(),
        ),
        BlocProvider(
          create: (context) => EditRecordCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'Cross Ranking',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: AppColors.primary,
          ),
          useMaterial3: true,
        ),
        initialRoute: RouteName.home.route,
        // home: const HomeScreen(),
        routes: AppRoutes.routes,
      ),
    );
  }
}
