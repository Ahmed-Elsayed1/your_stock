import 'package:flutter/material.dart';
import 'package:yourstock/constants/routes.dart';
import 'package:yourstock/services/auth/auth_exeptions.dart';
import 'package:yourstock/services/auth/firebase_auth_provider.dart';
import 'package:yourstock/services/crud/cloud_firestore_service.dart';
import 'package:yourstock/shared/cubit/cubit.dart';
import 'package:yourstock/utilities/show_error_dialog.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    FirebaseAuthProvider authProvider = FirebaseAuthProvider();
    final currentUser = authProvider.currentUser;
    return Scaffold(
        appBar: null, // Hide the app bar
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Text(currentUser!.email.toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  )),
              // Empty container to occupy the remaining space
            ),
            Align(
              alignment: Alignment.center,
              child: ElevatedButton(
                  onPressed: () async {
                    AppCubit.get(context);
                    final db = CloudDb();
                    final authProvider = FirebaseAuthProvider();
                    try {
                      db.deleteWatchlist();
                      authProvider.deleteUser();
                      Navigator.of(context).pushNamedAndRemoveUntil(
                        loginRoute,
                        (_) => false,
                      );
                    } on RequiresRecentLogin {
                      await showErrorDialog(
                        context,
                        'Requires Recent Login, Try to re-login and try again.',
                      );
                      await authProvider.logOut();
                      Navigator.of(context).pushNamedAndRemoveUntil(
                        loginRoute,
                        (_) => false,
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
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  child: const Text("Delete this account")),
            ),
            Expanded(
              child:
                  Container(), // Empty container to occupy the remaining space
            ),
          ],
        )));
  }
}
