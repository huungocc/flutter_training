import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_training/gen_l10n/app_localizations.dart';
import 'package:flutter_training/util/language_cubit.dart';
import 'package:flutter_training/util/localization_service.dart';
import 'package:flutter_training/util/supabase_config.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'util/routes.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  await SupabaseConfig.init();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    BlocProvider(
      create: (_) => LanguageCubit(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageCubit, Locale>(
      builder: (context, locale) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          navigatorKey: NavigationService.navigatorKey,
          initialRoute: Routes.initScreen(),
          onGenerateRoute: Routes.generateRoute,
          locale: locale,
          supportedLocales: const [
            Locale('en'),
            Locale('vi'),
          ],
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          builder: (context, child) {
            LocalizationService.update(context);
            return child!;
          },
        );
      }
    );
  }
}

class NavigationService {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static NavigatorState? get navigator => navigatorKey.currentState;

  static BuildContext? get context => navigatorKey.currentContext;
}
