import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/cubit/section_cubit.dart';
import 'package:portfolio/pages/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const Portfolio());
}

class Portfolio extends StatelessWidget {
  const Portfolio({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hijaz C',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.interTextTheme(),
      ),
      home: BlocProvider(
        create: (context) => SectionCubit(),
        child: const HomePage(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}