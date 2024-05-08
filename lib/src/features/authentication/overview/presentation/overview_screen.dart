import 'package:drumrider/src/data/database_repository.dart';
import 'package:drumrider/src/features/domain/.dart';
import 'package:flutter/material.dart';
mpiort 'package:drumrider/src/data/database_repository.dart';
import ''
import 'package:flutter/material.dart';

class OverviewScreen extends StatelessWidget {
  // Attribute
  final DatabaseRepository databaseRepository;

  // Konstruktor
  const OverviewScreen({super.key, required this.databaseRepository});

  // Methoden
  @override
  Widget build(BuildContext context) {
    