import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  // final _formKey = GlobalKey<FormState>();
  // final _nameController = TextEditingController();
  // final _emailController = TextEditingController();
  // final _passwordController = TextEditingController();
  // bool _obscurePassword = true;
  //
  // @override
  // void dispose() {
  //   _nameController.dispose();
  //   _emailController.dispose();
  //   _passwordController.dispose();
  //   super.dispose();
  // }
  //
  // void _signUp() {
  //   if (_formKey.currentState!.validate()) {
  //     context.read<AuthBloc>().add(
  //       SignUpEvent(
  //         name: _nameController.text.trim(),
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
    //                   'Create Account',
    //                   style: TextStyle(
    //                     fontSize: 28,
    //                     fontWeight: FontWeight.bold,
    //                   ),
    //                   textAlign: TextAlign.center,
    //                 ),
    //                 const SizedBox(height: 8),
    //                 const Text(
    //                   'Sign up to start scanning business cards',
    //                   style: TextStyle(fontSize: 16, color: Colors.grey),
    //                   textAlign: TextAlign.center,
    //                 ),
    //                 const SizedBox(height: 48),
    //                 TextFormField(
    //                   controller: _nameController,
    //                   decoration: const InputDecoration(
    //                     labelText: 'Full Name',
    //                     prefixIcon: Icon(Icons.person),
    //                   ),
    //                   validator: Validators.validateName,
    //                   textInputAction: TextInputAction.next,
    //                 ),
    //                 const SizedBox(height: 16),
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
    //                   validator: Validators.validatePassword,
    //                   obscureText: _obscurePassword,
    //                   textInputAction: TextInputAction.done,
    //                   onFieldSubmitted: (_) => _signUp(),
    //                 ),
    //                 const SizedBox(height: 32),
    //                 BlocBuilder<AuthBloc, AuthState>(
    //                   builder: (context, state) {
    //                     return ElevatedButton(
    //                       onPressed: state is AuthLoading ? null : _signUp,
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
    //                           : const Text('Sign Up'),
    //                     );
    //                   },
    //                 ),
    //                 const SizedBox(height: 16),
    //                 Row(
    //                   mainAxisAlignment: MainAxisAlignment.center,
    //                   children: [
    //                     const Text('Already have an account? '),
    //                     TextButton(
    //                       onPressed: () {
    //                         Navigator.of(context).pushReplacement(
    //                           MaterialPageRoute(
    //                             builder: (context) => const SignInScreen(),
    //                           ),
    //                         );
    //                       },
    //                       child: const Text('Sign In'),
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
