import 'package:flutter_starter_app/bloc/example_bloc.dart';
import 'package:flutter_starter_app/utils/api/api.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:restui/restui.dart';

import 'utils/navigation/generate_route.dart';
import 'utils/style_provider/style_provider.dart';

void main() => runApp(MyApp());

const _appColors = const AppColors(
  accent: Colors.redAccent,
  secondaryAccent: Colors.blueAccent,
  content: Colors.white,
  secondaryContent: Colors.black,
  background: Colors.black,
  secondaryBackground: Colors.white,
  shadow: Color.fromRGBO(0, 0, 0, 0.1),
  secondaryShadow: Color.fromRGBO(0, 0, 0, 0.05),
);

final Map<int, Color> _primarySwatch = {
  50: _appColors.accent,
  100: _appColors.accent,
  200: _appColors.accent,
  300: _appColors.accent,
  400: _appColors.accent,
  500: _appColors.accent,
  600: _appColors.accent,
  700: _appColors.accent,
  800: _appColors.accent,
  900: _appColors.accent,
};

final _materialColor = MaterialColor(_appColors.accent.value, _primarySwatch);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      child: RestuiProvider<Api>(
        create: (_) => Api(
          uri: Uri.parse("https://picsum.photos"),
          link: HeadersMapperLink(["uid", "client", "access-token"])
              .chain(DebugLink(printResponseBody: true)),
        ),
        child: StyleProvider(
          child: MaterialApp(
            title: 'Eprufhealth',
            theme: ThemeData(
              primarySwatch: _materialColor,
              accentColor: _appColors.accent,
              appBarTheme: AppBarTheme(color: _appColors.accent),
              backgroundColor: _appColors.background,
              dialogBackgroundColor: _appColors.background,
              scaffoldBackgroundColor: _appColors.background,
            ),
            onGenerateRoute: Routes.generateRoute,
            initialRoute: Routes.home,
          ),
          colors: _appColors,
        ),
      ),
      providers: <SingleChildWidget>[
        ChangeNotifierProvider<ExampleBloc>(
          create: (_) => ExampleBloc(),
        ),
      ],
    );
  }
}