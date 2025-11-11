import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

/// Service class to handle all Firebase Authentication operations
class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// Stream of authentication state changes
  Stream<User?> get userChanges => _auth.authStateChanges();

  /// Get current user
  User? get currentUser => _auth.currentUser;

  /// Register a new user with email and password
  ///
  /// Returns the User object if successful, null otherwise
  /// Throws FirebaseAuthException with appropriate error codes
  Future<User?> register(String email, String password) async {
    try {
      // Validate email format
      if (!email.contains('@') || !email.contains('.com')) {
        throw FirebaseAuthException(
          code: 'invalid-email',
          message: 'Please enter a valid email address with @ and .com',
        );
      }

      // Validate password length
      if (password.length < 6) {
        throw FirebaseAuthException(
          code: 'weak-password',
          message: 'Password must be at least 6 characters long',
        );
      }

      debugPrint('🔐 Attempting to register user: $email');

      final UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      debugPrint(
        '✅ Registration successful for: ${userCredential.user?.email}',
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      debugPrint('❌ Registration error: ${e.code} - ${e.message}');

      switch (e.code) {
        case 'email-already-in-use':
          throw FirebaseAuthException(
            code: e.code,
            message: 'This email is already registered. Please login instead.',
          );
        case 'invalid-email':
          throw FirebaseAuthException(
            code: e.code,
            message: 'The email address is not valid.',
          );
        case 'operation-not-allowed':
          throw FirebaseAuthException(
            code: e.code,
            message: 'Email/password accounts are not enabled.',
          );
        case 'weak-password':
          throw FirebaseAuthException(
            code: e.code,
            message: 'The password is too weak. Use at least 6 characters.',
          );
        default:
          rethrow;
      }
    } catch (e) {
      debugPrint('❌ Unexpected registration error: $e');
      rethrow;
    }
  }

  /// Login an existing user with email and password
  ///
  /// Returns the User object if successful, null otherwise
  /// Throws FirebaseAuthException with appropriate error codes
  Future<User?> login(String email, String password) async {
    try {
      // Validate email format
      if (!email.contains('@')) {
        throw FirebaseAuthException(
          code: 'invalid-email',
          message: 'Please enter a valid email address',
        );
      }

      debugPrint('🔐 Attempting to login user: $email');

      final UserCredential userCredential = await _auth
          .signInWithEmailAndPassword(email: email, password: password);

      debugPrint('✅ Login successful for: ${userCredential.user?.email}');
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      debugPrint('❌ Login error: ${e.code} - ${e.message}');

      switch (e.code) {
        case 'user-not-found':
          throw FirebaseAuthException(
            code: e.code,
            message: 'No user found with this email. Please register first.',
          );
        case 'wrong-password':
          throw FirebaseAuthException(
            code: e.code,
            message: 'Invalid password. Please try again.',
          );
        case 'invalid-email':
          throw FirebaseAuthException(
            code: e.code,
            message: 'The email address is not valid.',
          );
        case 'user-disabled':
          throw FirebaseAuthException(
            code: e.code,
            message: 'This account has been disabled.',
          );
        case 'invalid-credential':
          throw FirebaseAuthException(
            code: e.code,
            message:
                'Invalid credentials. Please check your email and password.',
          );
        default:
          rethrow;
      }
    } catch (e) {
      debugPrint('❌ Unexpected login error: $e');
      rethrow;
    }
  }

  /// Logout the current user
  Future<void> logout() async {
    try {
      debugPrint('🚪 Logging out user: ${_auth.currentUser?.email}');
      await _auth.signOut();
      debugPrint('✅ Logout successful');
    } catch (e) {
      debugPrint('❌ Logout error: $e');
      rethrow;
    }
  }

  /// Change password for the current user
  ///
  /// Requires user to be authenticated
  /// May require recent authentication
  Future<void> changePassword(String newPassword) async {
    try {
      final user = _auth.currentUser;

      if (user == null) {
        throw FirebaseAuthException(
          code: 'no-current-user',
          message: 'No user is currently logged in',
        );
      }

      // Validate password length
      if (newPassword.length < 6) {
        throw FirebaseAuthException(
          code: 'weak-password',
          message: 'Password must be at least 6 characters long',
        );
      }

      debugPrint('🔒 Attempting to change password for: ${user.email}');

      await user.updatePassword(newPassword);

      debugPrint('✅ Password changed successfully');
    } on FirebaseAuthException catch (e) {
      debugPrint('❌ Password change error: ${e.code} - ${e.message}');

      switch (e.code) {
        case 'requires-recent-login':
          throw FirebaseAuthException(
            code: e.code,
            message:
                'Please logout and login again before changing your password.',
          );
        case 'weak-password':
          throw FirebaseAuthException(
            code: e.code,
            message: 'The password is too weak. Use at least 6 characters.',
          );
        default:
          rethrow;
      }
    } catch (e) {
      debugPrint('❌ Unexpected password change error: $e');
      rethrow;
    }
  }

  /// Send password reset email
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      debugPrint('📧 Sending password reset email to: $email');
      await _auth.sendPasswordResetEmail(email: email);
      debugPrint('✅ Password reset email sent');
    } on FirebaseAuthException catch (e) {
      debugPrint('❌ Password reset error: ${e.code} - ${e.message}');
      rethrow;
    }
  }
}
