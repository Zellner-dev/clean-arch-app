import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutterando_clean_arch/app_modules.dart';
import 'package:flutterando_clean_arch/app_widget.dart';

void main() {
  runApp(ModularApp(module: AppModules(), child: const AppWidget(),));
}

