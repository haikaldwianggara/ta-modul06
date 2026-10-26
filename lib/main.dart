import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/theme_cubit.dart';
import 'cubit/favorit_cubit.dart';
import 'cubit/pengajuan_cubit.dart';

import 'navigation/app_routes.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<ThemeCubit>(
          create: (context) => ThemeCubit(),
        ),
        BlocProvider<FavoritCubit>(
          create: (context) => FavoritCubit(),
        ),
        BlocProvider<PengajuanCubit>(
          create: (context) => PengajuanCubit(),
        ),
      ],
      child: const NusantaraCerdasApp(),
    ),
  );
}

class NusantaraCerdasApp extends StatelessWidget {
  const NusantaraCerdasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, themeMode) {
        return MaterialApp(
          title: 'Nusantara Cerdas Mobile',
          debugShowCheckedModeBanner: false,

          // Tema terang
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.teal,
              brightness: Brightness.light,
            ),
            appBarTheme: const AppBarTheme(
              centerTitle: false,
            ),
          ),

          // Tema gelap
          darkTheme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.teal,
              brightness: Brightness.dark,
            ),
            appBarTheme: const AppBarTheme(
              centerTitle: false,
            ),
          ),

          // Mengikuti state ThemeCubit
          themeMode: themeMode,

          // Halaman awal
          initialRoute: AppRoutes.beranda,

          // Named routes yang sudah tersedia di proyek
          routes: AppRoutes.daftarRoute(),

          // Penanganan route tambahan
          onGenerateRoute: AppRoutes.bentukRoute,

          // Penanganan route yang tidak ditemukan
          onUnknownRoute: AppRoutes.routeTidakDikenal,
        );
      },
    );
  }
}
