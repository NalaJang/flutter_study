import 'package:flutter/material.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);

    super.dispose();
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    debugPrint('didChangeMetrics');
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    switch (state) {
      case AppLifecycleState.detached:
        debugPrint('detached');

      case AppLifecycleState.resumed:
        debugPrint('resumed');

      case AppLifecycleState.inactive:
        debugPrint('inactive');

      case AppLifecycleState.hidden:
        debugPrint('hidden');

      case AppLifecycleState.paused:
        debugPrint('paused');
    }
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('build');
    return const Placeholder();
  }

  @override
  void didChangePlatformBrightness() {
    super.didChangePlatformBrightness();
    debugPrint('didChangePlatformBrightness');
  }
}
