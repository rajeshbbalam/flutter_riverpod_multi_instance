import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/providers.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, this.screenTitle});
  final String? screenTitle;

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [
        localScopedCounterProvider.overrideWithProvider(StateProvider<Counter>((ref) {
          return Counter();
        })),
        // commonCounterProvider.overrideWithProvider(StateProvider<Counter>((ref) {
        //   return Counter();
        // }))
      ],
      child: Consumer(builder: (context, ref, child) {
        final countRef = ref.watch(localScopedCounterProvider);
        final countCommonRef = ref.watch(parentScopedCounterProvider);
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              screenTitle ?? "",
              style: const TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
            ),
            renderScreen(true, countRef.count),
            renderScreen(false, countCommonRef.count),
          ],
        );
      }),
    );
  }

  Widget renderScreen(bool isLocalScopedProvider, int count) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              RichText(
                text: TextSpan(
                  text: isLocalScopedProvider
                      ? 'increment overrided scoped Local var: '
                      : 'increment parentWidget Scoped var: ',
                  children: [
                    TextSpan(
                        text: '$count',
                        style: const TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold))
                  ],
                  style: const TextStyle(fontSize: 14, color: Colors.black),
                ),
              ),
              // Text(
              //   'increment overrided scoped var: \n ',
              //   style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              // ),
              Consumer(builder: (context, ref, child) {
                return TextButton(
                  // The read method is an utility to read a provider without listening to it
                  onPressed: () {
                    if (isLocalScopedProvider) {
                      var countRef = ref.read(localScopedCounterProvider);
                      ref.read(localScopedCounterProvider.notifier).state = Counter()..count = countRef.count + 1;
                    } else {
                      var commonRef = ref.read(parentScopedCounterProvider);
                      ref.read(parentScopedCounterProvider.notifier).state = Counter()..count = commonRef.count + 1;
                    }
                  },
                  child: const Icon(Icons.add),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
