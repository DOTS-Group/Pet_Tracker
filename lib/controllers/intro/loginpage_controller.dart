import 'dart:convert';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../shared/apiroute_shared.dart';

class LoginPageController {
  String? validateEmail(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return context.tr('emailEmpty');
    }
    if (!value.contains('@') || !value.contains('.')) {
      return context.tr('emailInvalid');
    }
    return null;
  }

  String? validatePassword(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return context.tr('passwordEmpty');
    }
    if (value.length < 6) {
      return context.tr('passwordMinLength');
    }
    return null;
  }

  Map<String, String? Function(String?, BuildContext)> get validators => {
        'validateEmail': validateEmail,
        'validatePassword': validatePassword,
      };

  Future<void> handleLogin(
      BuildContext context, String email, String password) async {
    // Email validasyonu
    final emailError = validateEmail(email, context);
    if (emailError != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(emailError),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // Şifre validasyonu
    final passwordError = validatePassword(password, context);
    if (passwordError != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(passwordError),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    try {
      final result = await loginWithEmailAndPassword(email, password);

      if (result['success'] == true && result['data'] != null) {
        // Giriş başarılı, pattern sayfasına yönlendir
        if (context.mounted) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            '/pattern',
            (route) => false,
          );
        }
      } else {
        // Hata mesajını göster
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(result['message'] ?? 'Giriş başarısız'),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Beklenmeyen bir hata oluştu: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Future<Map<String, dynamic>> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse(ApirouteShared.signInUserRoute),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = jsonDecode(response.body);

        if (responseData['Success'] == true && responseData['data'] != null) {
          await _saveTokens(responseData['data']);
          return {
            'success': true,
            'message': 'Giriş başarılı',
            'data': responseData['data']
          };
        } else {
          return {
            'success': false,
            'message': responseData['message'] ?? 'Geçersiz giriş bilgileri'
          };
        }
      } else {
        return {
          'success': false,
          'message': 'Sunucu hatası: ${response.statusCode}'
        };
      }
    } catch (e) {
      return {'success': false, 'message': 'Hata oluştu: $e'};
    }
  }

  Future<void> _saveTokens(Map<String, dynamic> tokens) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('BEARER_TOKEN', tokens['BEARER_TOKEN']);
    await prefs.setString('REFRESH_TOKEN', tokens['REFRESH_TOKEN']);
  }

  Future<Map<String, String?>> getTokens() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      'BEARER_TOKEN': prefs.getString('BEARER_TOKEN'),
      'REFRESH_TOKEN': prefs.getString('REFRESH_TOKEN'),
    };
  }

  Future<void> clearTokens() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('BEARER_TOKEN');
    await prefs.remove('REFRESH_TOKEN');
  }
}
