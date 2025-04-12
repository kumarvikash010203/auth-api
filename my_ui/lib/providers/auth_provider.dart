import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../services/auth_service.dart';

class AuthProvider extends ChangeNotifier {
  final AuthService _authService = AuthService();
  User? _user;
  bool _isLoading = false;
  String? _errorMessage;
  bool _disposed = false;

  User? get user => _user;
  bool get isLoading => _isLoading;
  bool get isAuthenticated => _user != null;
  String? get errorMessage => _errorMessage;

  AuthProvider() {
    _checkCurrentUser();
  }

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }

  Future<void> _checkCurrentUser() async {
    _setLoading(true);
    try {
      _user = await _authService.getCurrentUser();
    } catch (e) {
      _setError('Failed to check current user: $e');
    } finally {
      _setLoading(false);
    }
  }

  Future<bool> register(String name, String email, String password) async {
    _setLoading(true);
    _clearError();
    
    try {
      _user = await _authService.register(name, email, password);
      _setLoading(false);
      return _user != null;
    } catch (e) {
      _setError('Registration failed: $e');
      _setLoading(false);
      return false;
    }
  }

  Future<bool> login(String email, String password) async {
    _setLoading(true);
    _clearError();
    
    try {
      _user = await _authService.login(email, password);
      _setLoading(false);
      return _user != null;
    } catch (e) {
      _setError('Login failed: $e');
      _setLoading(false);
      return false;
    }
  }

  Future<bool> resetPassword(String email) async {
    _setLoading(true);
    _clearError();
    
    try {
      final success = await _authService.resetPassword(email);
      _setLoading(false);
      if (!success) {
        _setError('Password reset failed');
      }
      return success;
    } catch (e) {
      _setError('Password reset failed: $e');
      _setLoading(false);
      return false;
    }
  }

  Future<void> logout() async {
    _setLoading(true);
    try {
      await _authService.logout();
      _user = null;
    } catch (e) {
      _setError('Logout failed: $e');
    } finally {
      _setLoading(false);
    }
  }

  void _setLoading(bool loading) {
    if (_disposed) return;
    _isLoading = loading;
    notifyListeners();
  }

  void _setError(String message) {
    if (_disposed) return;
    _errorMessage = message;
    notifyListeners();
  }

  void _clearError() {
    if (_disposed) return;
    _errorMessage = null;
    notifyListeners();
  }
} 