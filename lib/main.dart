import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import './pages/tabs.dart';

// 我们创建了一个 "provider"，它可以存储一个值（这里是 "Hello world"）。
// 通过使用提供者程序，这可以允许我们模拟或者覆盖一个暴露的值。
final helloWorldProvider = Provider((_) => 'Hello world');

void main() {
  runApp(
    // 为了使小组件可以读取提供者程序，
    // 我们需要将整个应用程序包装在“ProviderScope”小部件中。
    // 这是我们的提供者程序的状态将被存储的地方。
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String value = ref.watch(helloWorldProvider);
    return MaterialApp(
      title: value,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      home: const Tabs(),
    );
  }
}
