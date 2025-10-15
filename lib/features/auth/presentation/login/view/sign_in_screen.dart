import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/constants/app_constants.dart';
import '../../../../../core/utils/validators.dart';
import '../../../data/repositories/auth_repository_impl.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;
  //
  // @override
  // void dispose() {
  //   _emailController.dispose();
  //   _passwordController.dispose();
  //   super.dispose();
  // }
  //
  // void _signIn() {
  //   if (_formKey.currentState!.validate()) {
  //     context.read<AuthBloc>().add(
  //       SignInEvent(
  //         email: _emailController.text.trim(),
  //         password: _passwordController.text,
  //       ),
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    // return BlocProvider(
    //   create: (context) => AuthBloc(AuthRepositoryImpl()),
    //   child: Scaffold(
    //     body: SafeArea(
    //       child: BlocListener<AuthBloc, AuthState>(
    //         listener: (context, state) {
    //           if (state is AuthSuccess) {
    //             Navigator.of(context).pushReplacement(
    //               MaterialPageRoute(
    //                 builder: (context) => const DashboardScreen(),
    //               ),
    //             );
    //           } else if (state is AuthError) {
    //             ScaffoldMessenger.of(context).showSnackBar(
    //               SnackBar(
    //                 content: Text(state.message),
    //                 backgroundColor: Colors.red,
    //               ),
    //             );
    //           }
    //         },
    //         child: Padding(
    //           padding: const EdgeInsets.all(AppConstants.defaultPadding),
    //           child: Form(
    //             key: _formKey,
    //             child: Column(
    //               mainAxisAlignment: MainAxisAlignment.center,
    //               crossAxisAlignment: CrossAxisAlignment.stretch,
    //               children: [
    //                 const Icon(Icons.credit_card, size: 80, color: Colors.blue),
    //                 const SizedBox(height: 24),
    //                 const Text(
    //                   'Welcome Back',
    //                   style: TextStyle(
    //                     fontSize: 28,
    //                     fontWeight: FontWeight.bold,
    //                   ),
    //                   textAlign: TextAlign.center,
    //                 ),
    //                 const SizedBox(height: 8),
    //                 const Text(
    //                   'Sign in to access your business cards',
    //                   style: TextStyle(fontSize: 16, color: Colors.grey),
    //                   textAlign: TextAlign.center,
    //                 ),
    //                 const SizedBox(height: 48),
    //                 TextFormField(
    //                   controller: _emailController,
    //                   decoration: const InputDecoration(
    //                     labelText: 'Email',
    //                     prefixIcon: Icon(Icons.email),
    //                   ),
    //                   validator: Validators.validateEmail,
    //                   keyboardType: TextInputType.emailAddress,
    //                   textInputAction: TextInputAction.next,
    //                 ),
    //                 const SizedBox(height: 16),
    //                 TextFormField(
    //                   controller: _passwordController,
    //                   decoration: InputDecoration(
    //                     labelText: 'Password',
    //                     prefixIcon: const Icon(Icons.lock),
    //                     suffixIcon: IconButton(
    //                       icon: Icon(
    //                         _obscurePassword
    //                             ? Icons.visibility
    //                             : Icons.visibility_off,
    //                       ),
    //                       onPressed: () {
    //                         setState(() {
    //                           _obscurePassword = !_obscurePassword;
    //                         });
    //                       },
    //                     ),
    //                   ),
    //                   validator: (value) {
    //                     if (value == null || value.isEmpty) {
    //                       return 'Password is required';
    //                     }
    //                     return null;
    //                   },
    //                   obscureText: _obscurePassword,
    //                   textInputAction: TextInputAction.done,
    //                   onFieldSubmitted: (_) => _signIn(),
    //                 ),
    //                 const SizedBox(height: 32),
    //                 BlocBuilder<AuthBloc, AuthState>(
    //                   builder: (context, state) {
    //                     return ElevatedButton(
    //                       onPressed: state is AuthLoading ? null : _signIn,
    //                       child: state is AuthLoading
    //                           ? const SizedBox(
    //                               height: 20,
    //                               width: 20,
    //                               child: CircularProgressIndicator(
    //                                 strokeWidth: 2,
    //                                 valueColor: AlwaysStoppedAnimation<Color>(
    //                                   Colors.white,
    //                                 ),
    //                               ),
    //                             )
    //                           : const Text('Sign In'),
    //                     );
    //                   },
    //                 ),
    //                 const SizedBox(height: 16),
    //                 Row(
    //                   mainAxisAlignment: MainAxisAlignment.center,
    //                   children: [
    //                     const Text("Don't have an account? "),
    //                     TextButton(
    //                       onPressed: () {
    //                         Navigator.of(context).pushReplacement(
    //                           MaterialPageRoute(
    //                             builder: (context) => const SignUpScreen(),
    //                           ),
    //                         );
    //                       },
    //                       child: const Text('Sign Up'),
    //                     ),
    //                   ],
    //                 ),
    //               ],
    //             ),
    //           ),
    //         ),
    //       ),
    //     ),
    //   ),
    // );
    return SizedBox();
  }
}
