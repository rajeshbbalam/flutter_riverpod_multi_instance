import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'multi_instances/testhome.dart';

void main() {
  runApp(const RiverPodMainApp());
}

//ChangeNotifierProvider(create: (context) => Products(), child: ProductsDisplayView())
class RiverPodMainApp extends StatefulWidget {
  const RiverPodMainApp({super.key});
  @override
  State<RiverPodMainApp> createState() => _RiverPodMainAppState();
}

class _RiverPodMainAppState extends State<RiverPodMainApp> {
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        home: Scaffold(
          body: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 200,
                height: 500,
                child: TestHome(),
              ),
              const SizedBox(width: 1, height: 500, child: VerticalDivider(width: 1, color: Colors.black)),
              SizedBox(
                width: 200,
                height: 500,
                child: TestHome(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
