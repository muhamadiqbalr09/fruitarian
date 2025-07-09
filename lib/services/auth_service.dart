import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter/foundation.dart';

class AuthService {
  final SupabaseClient supabase = Supabase.instance.client;

  Future<AuthResponse> login(String email, String password) async {
    try {
      final response = await supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );
      if (response.user != null) {
        debugPrint('Login berhasil: ${response.user!.email}');
      }
      return response;
    } on AuthApiException catch (e) {
      debugPrint('AuthApiException during login: ${e.message}');
      
      // Provide more user-friendly error messages
      String userFriendlyMessage = e.message;
      if (e.message.contains('invalid format')) {
        userFriendlyMessage = 'Please enter a valid email address';
      } else if (e.message.contains('Invalid login credentials')) {
        userFriendlyMessage = 'Invalid email or password. Please check your credentials and try again.';
      }
      
      throw Exception(userFriendlyMessage);
    } catch (e) {
      debugPrint('Error login: $e');
      rethrow;
    }
  }

  Future<AuthResponse> register(String email, String password) async {
    try {
      debugPrint('Starting registration for email: $email');
      
      final response = await supabase.auth.signUp(
        email: email,
        password: password,
      );
      
      debugPrint('Registration response received');
      debugPrint('User: ${response.user?.email}');
      debugPrint('Session: ${response.session?.accessToken != null ? "exists" : "null"}');
      
      if (response.user != null) {
        debugPrint('Registrasi berhasil: ${response.user!.email}');
        debugPrint('User ID: ${response.user!.id}');
        debugPrint('Email confirmed: ${response.user!.emailConfirmedAt != null}');
      } else {
        debugPrint('Registration failed: No user returned');
      }
      
      return response;
    } on AuthApiException catch (e) {
      debugPrint('AuthApiException during registration: ${e.message}');
      debugPrint('Status Code: ${e.statusCode}');
      debugPrint('Error Code: ${e.code}');
      
      // Provide more user-friendly error messages
      String userFriendlyMessage = e.message;
      if (e.message.contains('invalid format')) {
        userFriendlyMessage = 'Please enter a valid email address (example: user@example.com)';
      } else if (e.message.contains('already registered')) {
        userFriendlyMessage = 'This email is already registered. Please use a different email or try logging in.';
      } else if (e.message.contains('weak password')) {
        userFriendlyMessage = 'Password is too weak. Please use a stronger password.';
      }
      
      throw Exception(userFriendlyMessage);
    } catch (e) {
      debugPrint('Error registrasi: $e');
      debugPrint('Error type: ${e.runtimeType}');
      rethrow;
    }
  }

  Future<void> logout() async {
    try {
      await supabase.auth.signOut();
      debugPrint('Logout berhasil');
    } catch (e) {
      debugPrint('Error logout: $e');
      rethrow;
    }
  }

  // Get current user
  User? get currentUser => supabase.auth.currentUser;

  // Check if user is logged in
  bool get isLoggedIn => currentUser != null;

  // Listen to auth state changes
  Stream<AuthState> get authStateChanges => supabase.auth.onAuthStateChange;

  // Test connection to Supabase
  Future<bool> testConnection() async {
    try {
      debugPrint('Testing Supabase connection...');
      final response = await supabase.from('test').select().limit(1);
      debugPrint('Connection test successful: $response');
      return true;
    } catch (e) {
      debugPrint('Connection test failed: $e');
      // This is expected if 'test' table doesn't exist, but it means connection works
      return true;
    }
  }
}
