import 'package:flutter/material.dart';

class FormController {
  static const users = <String, Map<String, String>>{
    'dyepes@gmail.com': {
      'password': 'D1234',
      'name': 'Diego',
      'role': 'Administrador',
    },
    'ivannarvaez@gmail.com': {
      'password': 'I1234',
      'name': 'Ivanna',
      'role': 'Diseñadora',
    },
    'miguel@gmail.com': {
      'password': 'M1234',
      'name': 'Miguel',
      'role': 'Desarrollador',
    },
  };

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool validate() => formKey.currentState?.validate() ?? false;

  bool authenticate() {
    final email = emailController.text.trim();
    final password = passwordController.text;
    return users[email]?['password'] == password;
  }

  String authenticatedUserName() {
    final email = emailController.text.trim();
    return users[email]?['name'] ?? 'Usuario';
  }

  String authenticatedUserRole() {
    final email = emailController.text.trim();
    return users[email]?['role'] ?? 'Usuario';
  }

  String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Ingresa tu correo electrónico';
    }

    if (!value.contains('@')) {
      return 'Ingresa un correo electrónico válido';
    }

    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Ingresa tu contraseña';
    }

    if (value.length < 5) {
      return 'La contraseña debe tener al menos 5 caracteres';
    }

    return null;
  }

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }
}
