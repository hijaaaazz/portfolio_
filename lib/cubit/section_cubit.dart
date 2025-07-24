// lib/bloc/section_bloc.dart
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

enum Section { home, about, skills, portfolio, contact }

class SectionCubit extends Cubit<Section> {
  SectionCubit() : super(Section.home);
  
  void changeSection(Section section) {
    log("changed $section");
    emit(section);
  } 
}
