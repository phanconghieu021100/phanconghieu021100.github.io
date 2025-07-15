// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puzzel/english_transfer/content_deepseek_app.dart';
import 'package:puzzel/english_transfer/bloc/sentence_cubit.dart';
import 'package:puzzel/english_transfer/sentence_view.dart';

class SentenceGamePage extends StatelessWidget {
  final SentenceSet sentenceSet;

  const SentenceGamePage({super.key, required this.sentenceSet});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SentenceCubit(sentenceSet),
      child: const SentenceGameView(),
    );
  }
}
