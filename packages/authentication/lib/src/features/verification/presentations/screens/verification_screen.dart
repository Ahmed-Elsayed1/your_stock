import 'package:your_stock_core/your_stock_core.dart';
import 'package:your_stock_design_system/your_stock_design_system.dart';

import '../../../../../authentication.dart';

@RoutePage()
class VerificationScreen extends StatefulWidget {
  const VerificationScreen({super.key});

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appbar: const AppScaffoldBar.leadingTitle(
        title: 'Verify account',
      ),
      body: Column(
        children: [
          const Text("We've already sent you email verification."),
          const Text("If you didn't recived an email verification."),
          TextButton(
            onPressed: () async {
              //get the logged in/registered user, then send verification email.
              await AuthService.firebase().sendEmailVerification();
            },
            child: const Text('Send email verification, again.'),
          ),
          TextButton(
            onPressed: () async {
              await AuthService.firebase().logOut();
              if (!context.mounted) return;
              context.router.popAndPush(const RegisterationRoute());
            },
            child: const Text('Go back.'),
          ),
        ],
      ),
    );
  }
}
