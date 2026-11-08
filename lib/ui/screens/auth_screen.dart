import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String? _error;
  bool _loading = false;

  Future<void> _submit(bool isLogin) async {
    if (!_formKey.currentState!.validate()) return;
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final email = _emailController.text.trim();
      final password = _passwordController.text;
      if (isLogin) {
        await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      } else {
        await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      }
    } on FirebaseAuthException catch (e) {
      setState(() => _error = e.code);
    } catch (e) {
      setState(() => _error = e.toString());
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 230, 226, 221),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Каталог книг',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 32,),
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                  ),
                  validator: (v) =>
                    (v == null || !v.contains('@')) ? 'Введите email' : null,
                ),
                const SizedBox(height: 16,),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Пароль',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                  ),
                  validator: (v) => (v == null || v.length < 6)
                    ? 'Минимум 6 символов'
                    : null,
                ),
                const SizedBox(height: 16,),
                if (_error != null)
                  Padding(
                    padding: const EdgeInsetsGeometry.only(bottom: 12),
                    child: Text(
                      _error!,
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),
                if (_loading)
                  const Center(child: CircularProgressIndicator(),)
                else ... [
                  FilledButton(
                    onPressed: () => _submit(true),
                    child: const Text('Войти'),
                  ),
                  const SizedBox(height: 8,),
                  OutlinedButton(
                    onPressed: () => _submit(false),
                    child: const Text('Зарегистрироваться'))
                ]
              ],
            ),
          ),
        ),
      ),
    );
  }
}