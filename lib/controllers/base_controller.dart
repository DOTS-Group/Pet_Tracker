import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../shared/provider_shared.dart';

abstract class BaseController {
  void checkAuth(WidgetRef ref) {
    if (ref.read(anonymousUserProvider)) {
      throw const AuthRequiredException();
    }
  }
}

class AuthRequiredException implements Exception {
  final String message;
  const AuthRequiredException([this.message = 'login_required']);
}
