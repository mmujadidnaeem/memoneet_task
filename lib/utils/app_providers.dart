import 'package:memoneet_task/features/mcqs/provider/mcqs_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../features/signin/provider/sigin_in_provider.dart';
import '../features/signup/provider/sign_up_provider.dart';
import '../service/auth_service.dart';

class AppProviders {
  static List<SingleChildWidget> providers = [
    ChangeNotifierProvider(
      create: (context) => SignUpProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => SignInProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => AuthService(),
    ),
    ChangeNotifierProvider(
      create: (context) => McqProvider(),
    )
  ];
}
