import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../shared/provider_shared.dart';

class CalendarPageController {
  void checkAuth(WidgetRef ref) {
    if (ref.read(anonymousUserProvider)) {
      throw Exception('login_required');
    }
  }
}
