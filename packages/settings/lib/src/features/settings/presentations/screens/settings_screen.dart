import 'package:your_stock_design_system/your_stock_design_system.dart';
import 'package:your_stock_core/your_stock_core.dart';
import 'package:authentication/authentication.dart';

@RoutePage()
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    FirebaseAuthProvider authProvider = FirebaseAuthProvider();
    final currentUser = authProvider.currentUser;
    return AppScaffold(
        appbar: const AppScaffoldBar.center(
          title: "Settings",
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: Text(currentUser!.email.toString(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    )),
              ),
              // Empty container to occupy the remaining space
            ),
            Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    ElevatedButton(
                        onPressed: () async {
                          final db = CloudDb();
                          final authProvider = FirebaseAuthProvider();
                          try {
                            db.deleteWatchList();
                            authProvider.deleteUser();
                            context.router.pushAndPopUntil(
                              const LoginRoute(),
                              predicate: (_) => false,
                            );
                          } on RequiresRecentLogin {
                            if (!context.mounted) return;
                            await showErrorDialog(
                              context,
                              'Requires Recent Login, Try to re-login and try again.',
                            );
                            await authProvider.logOut();
                            if (!context.mounted) return;
                            context.router.pushAndPopUntil(
                              const LoginRoute(),
                              predicate: (_) => false,
                            );
                          } catch (e) {
                            if (e is GenericAuthException) {
                              await showErrorDialog(
                                context,
                                'Authentication error',
                              );
                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red),
                        child: const Text("Delete this account")),
                    const AppGap.xxs(),
                    ElevatedButton(
                        onPressed: () async {
                          final shouldLogout = await _showLogoutDialog(context);
                          if (shouldLogout) {
                            await AuthService.firebase().logOut();
                            if (!context.mounted) return;
                            context.router.pushAndPopUntil(
                              const LoginRoute(),
                              predicate: (_) => false,
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey),
                        child: const Text("Logout")),
                  ],
                )),
            Expanded(
              child:
                  Container(), // Empty container to occupy the remaining space
            ),
          ],
        )));
  }

  Future<bool> _showLogoutDialog(context) {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('log out'),
          content: const Text('Are you sure that you want to log out?'),
          actions: [
            TextButton(
              onPressed: () {
                context.router.maybePop(false);
              },
              child: const Text('Cancle'),
            ),
            TextButton(
              onPressed: () {
                context.router.maybePop(true);
              },
              child: const Text('Log out'),
            ),
          ],
        );
      },
    ).then((value) => value ?? false);
  }
}
