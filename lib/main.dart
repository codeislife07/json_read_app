import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:json_read_app/app_config_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<AppConfigProvider>(
          create: (_) => AppConfigProvider()),
    ],
    child: const MyApp(),
  ));
}

var navigationKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return MaterialApp(
      title: 'Flutter Demo',
      navigatorKey: navigationKey,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: provider.appeConfig != null
                ? Color(int.parse("0xFF${provider.appeConfig!.primaryColor}"))
                : Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Config app from single file demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<AppConfigProvider>(context, listen: false).loadConfig();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Text("${provider.appeConfig?.appname}"),
      ),
    );
  }
}
