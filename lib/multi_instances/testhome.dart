import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../common/riverpod_common.dart';

final counterProvider = StateProvider<Counter>((ref) {
  return Counter();
});

class TestHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [
        counterProvider.overrideWithProvider(StateProvider<Counter>((ref) {
          return Counter();
        })),
        commonCounterProvider.overrideWithProvider(StateProvider<Counter>((ref) {
          return Counter();
        }))
      ],
      child: Column(
        children: [
          Center(
            // Consumer is a widget that allows you reading providers.
            // You could also use the hook "ref.watch(" if you uses flutter_hooks
            child: Consumer(builder: (context, ref, child) {
              final countRef = ref.watch(counterProvider);
              final countCommonRef = ref.watch(commonCounterProvider);
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: 200, height: 100, child: Text('Local:${countRef.count}')),
                  SizedBox(width: 200, height: 100, child: Text('Common:${countCommonRef.count}')),
                ],
              );
            }),
          ),
          Consumer(builder: (context, ref, child) {
            return FloatingActionButton(
              // The read method is an utility to read a provider without listening to it
              onPressed: () {
                var countRef = ref.read(counterProvider);
                var commonRef = ref.read(commonCounterProvider);
                ref.read(commonCounterProvider.notifier).state = Counter()..count = commonRef.count + 1;
                ref.read(counterProvider.notifier).state = Counter()..count = countRef.count + 1;
              },
              child: const Icon(Icons.add),
            );
          }),
        ],
      ),
    );
  }
}
