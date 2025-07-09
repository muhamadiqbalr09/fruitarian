import 'package:flutter/material.dart';
import 'package:fruitarian/screens/login_page.dart';
import 'package:fruitarian/screens/home_page.dart';
import 'package:fruitarian/services/auth_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthService authService = AuthService();
    
    return StreamBuilder<AuthState>(
      stream: authService.authStateChanges,
      builder: (context, snapshot) {
        // Show loading while checking auth state
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(color: Colors.green),
            ),
          );
        }

        // Check if user is logged in
        final User? user = snapshot.data?.session?.user;
        
        if (user != null) {
          // User is logged in, show home page
          return HomePage();
        } else {
          // User is not logged in, show login page
          return const LoginPage();
        }
      },
    );
  }
}
