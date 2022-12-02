import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'screens/home_screen.dart';

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
    return const ProviderScope(
      child: MaterialApp(
        home: Scaffold(
          body: Center(
            child: RootScreen(),
          ),
        ),
      ),
    );
  }
}

class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    bool isHorizontalLayout = true;
    if (width < 1024) {
      isHorizontalLayout = false;
    }
    return Container(
      child: isHorizontalLayout
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                SizedBox(
                  height: 300,
                  child: Card(color: Colors.blue, child: HomeScreen(screenTitle: "Screen A")),
                ),
                SizedBox(
                  height: 300,
                  child: Card(color: Colors.green, child: HomeScreen(screenTitle: "Screen B")),
                ),
              ],
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                SizedBox(
                  height: 300,
                  child: Card(color: Colors.blue, child: HomeScreen(screenTitle: "Screen A")),
                ),
                SizedBox(
                  height: 300,
                  child: Card(color: Colors.green, child: HomeScreen(screenTitle: "Screen B")),
                ),
              ],
            ),
    );
  }
}
