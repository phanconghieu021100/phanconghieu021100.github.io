class SentenceState {
  final int currentIndex;
  final List<String> selectedWords;
  final List<String> shuffledWords;

  const SentenceState({
    required this.currentIndex,
    required this.selectedWords,
    required this.shuffledWords,
  });

  SentenceState copyWith({
    int? currentIndex,
    List<String>? selectedWords,
    List<String>? shuffledWords,
  }) {
    return SentenceState(
      currentIndex: currentIndex ?? this.currentIndex,
      selectedWords: selectedWords ?? this.selectedWords,
      shuffledWords: shuffledWords ?? this.shuffledWords,
    );
  }
}