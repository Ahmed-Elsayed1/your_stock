import 'dart:async';
import 'package:authentication/authentication.dart';
import 'package:your_stock_design_system/your_stock_design_system.dart';
import 'package:home/home.dart';
import 'package:your_stock_core/your_stock_core.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    final user = AuthService.firebase().currentUser;
    Timer(
      const Duration(seconds: 3),
      () => context.router.replace(
        user == null
            ? const LoginRoute()
            : user.isEmailVerified
                ? const HomeRoute()
                : const VerificationRoute(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              'assets/images/logos/start_screen1.png',
              width: 400.0,
              height: 400.0,
            ),
          ],
        ),
      ),
    );
  }
}
