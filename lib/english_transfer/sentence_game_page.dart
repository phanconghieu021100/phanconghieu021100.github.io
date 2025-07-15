import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:puzzel/english_transfer/content_deepseek_app.dart';
import 'package:puzzel/english_transfer/sentence_cubit.dart';
import 'package:puzzel/english_transfer/sentence_state.dart';

class SentenceGamePage extends StatelessWidget {
  const SentenceGamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SentenceCubit(),
      child: const SentenceGameView(),
    );
  }
}

class SentenceGameView extends StatelessWidget {
  const SentenceGameView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(appTitle)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<SentenceCubit, SentenceState>(
          builder: (context, state) {
            final hint = vietnameseHints[state.currentIndex];
            final cubit = context.read<SentenceCubit>();

            return Column(
              children: [
                Text(
                  "Câu ${state.currentIndex + 1}/${englishSentences.length}",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                Text(
                  hint,
                  style: const TextStyle(
                      fontSize: 16, fontStyle: FontStyle.italic),
                ),
                const SizedBox(height: 20),

                // Selected words
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: state.selectedWords.map((word) {
                    return GestureDetector(
                      onTap: () => cubit.onSelectedWordTap(word),
                      child: Chip(label: Text(word)),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 24),

                // Shuffled words
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: state.shuffledWords.map((word) {
                    return GestureDetector(
                      onTap: () => cubit.onWordTap(word),
                      child: Chip(
                        label: Text(word),
                        backgroundColor: Colors.blue.shade100,
                      ),
                    );
                  }).toList(),
                ),

                const Spacer(),

                ElevatedButton(
                  onPressed: () {
                    cubit.checkAnswer(
                      () => ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("✅ Chính xác!")),
                      ),
                      () => ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text("❌ Sai rồi, hãy thử lại!")),
                      ),
                      () => ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text("🎉 Hoàn thành tất cả câu!")),
                      ),
                    );
                  },
                  child: const Text("Kiểm tra"),
                ),
                const SizedBox(height: 16),

                // Navigation buttons
                Row(
                  mainAxisAlignment: state.currentIndex > 0
                      ? MainAxisAlignment.spaceBetween
                      : MainAxisAlignment.end,
                  children: [
                    if (state.currentIndex > 0)
                      ElevatedButton.icon(
                        onPressed: cubit.previous,
                        icon: const Icon(Icons.arrow_back),
                        label: const Text("Quay lại"),
                      ),
                    ElevatedButton.icon(
                      onPressed:
                          state.currentIndex < englishSentences.length - 1
                              ? cubit.next
                              : null,
                      icon: const Icon(Icons.arrow_forward),
                      label: const Text("Tiếp theo"),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
