import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../shared/provider_shared.dart';

class AuthCheckWidget extends ConsumerWidget {
  final Widget child;

  const AuthCheckWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAnonymous = ref.watch(anonymousUserProvider);

    if (!isAnonymous) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(context.tr('loginRequired')),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/login'),
              child: Text(context.tr('loginButton')),
            ),
          ],
        ),
      );
    }
    return child;
  }
}
