// Packages
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:async';

// Utils
import '../utils/routes.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _selectedOption = -1;
  int _timer = 600; // 10 minutes in seconds for overall exam time
  int _currentQuestion = 0;
  List<int> _selectedAnswers = []; // Track selected answers for each question

  final List<Map<String, String>> _questions = [
    {
      'question': 'What is a benefit of investing?',
      'options':
          'Adds to your debt,Make you poor,Give additional sources of income,You will lose your wealth',
      'audio': 'audio/question.mp3',
      'answers':
          'audio/answer_a.mp3,audio/answer_b.mp3,audio/answer_c.mp3,audio/answer_d.mp3',
      'correct': '2', // Index of correct answer
    },
    {
      'question': 'What is compound interest?',
      'options':
          'Simple interest,Interest on interest,No interest,Negative interest',
      'audio': 'audio/question2.mp3',
      'answers':
          'audio/answer2_a.mp3,audio/answer2_b.mp3,audio/answer2_c.mp3,audio/answer2_d.mp3',
      'correct': '1',
    },
    {
      'question': 'What is diversification?',
      'options':
          'Putting all money in one investment,Spreading investments across different assets,Avoiding investments,Borrowing money',
      'audio': 'audio/question3.mp3',
      'answers':
          'audio/answer3_a.mp3,audio/answer3_b.mp3,audio/answer3_c.mp3,audio/answer3_d.mp3',
      'correct': '1',
    },
  ];

  final AudioPlayer _audioPlayer = AudioPlayer();
  bool _isPlayingQuestion = false;
  bool _isPlayingAnswer = false;

  @override
  void initState() {
    super.initState();
    _selectedAnswers = List.filled(_questions.length, -1);
    _selectedOption = _selectedAnswers[_currentQuestion];
    _startTimer();
  }

  void _startTimer() {
    const oneSec = Duration(seconds: 1);
    Timer.periodic(oneSec, (Timer timer) {
      if (_timer == 0) {
        timer.cancel();
        _saveAndNavigate(); // Auto submit when time is up
      } else {
        setState(() {
          _timer--;
        });
      }
    });
  }

  void _playAudio(String path) async {
    if (path.contains('question')) {
      if (!_isPlayingQuestion) {
        await _audioPlayer.play(AssetSource(path));
        setState(() => _isPlayingQuestion = true);
      } else {
        await _audioPlayer.stop();
        setState(() => _isPlayingQuestion = false);
      }
    } else {
      if (!_isPlayingAnswer) {
        await _audioPlayer.play(AssetSource(path));
        setState(() => _isPlayingAnswer = true);
      } else {
        await _audioPlayer.stop();
        setState(() => _isPlayingAnswer = false);
      }
    }
  }

  void _showExitDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      // ignore: deprecated_member_use
      barrierColor: Colors.black.withOpacity(0.7),
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Attention!',
                  style: TextStyle(
                    fontSize: 20,
                    // fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Please note that if you exit, you may need to start again from beginning. Are you sure want to exit?',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // Close dialog
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.grey[600],
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                      ),
                      child: const Text(
                        'No, Continue',
                        style: TextStyle(fontSize: 16, color: Colors.green),
                      ),
                    ),
                    const SizedBox(width: 12),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(); // Close dialog
                        Navigator.of(context).pop(); // Go back to module screen
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.grey[600],
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                      ),
                      child: const Text(
                        'Yes',
                        style: TextStyle(fontSize: 16, color: Colors.green),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _saveAndNavigate() {
    // Calculate correct answers
    int correctAnswers = 0;
    for (int i = 0; i < _questions.length; i++) {
      if (_selectedAnswers[i] == int.parse(_questions[i]['correct']!)) {
        correctAnswers++;
      }
    }

    Navigator.pushReplacementNamed(
      context,
      AppRoutes.result,
      arguments: {
        'totalQuestions': _questions.length,
        'correctAnswers': correctAnswers,
        'timeTaken': 600 - _timer,
        'selectedAnswers': _selectedAnswers,
        'questions': _questions,
      },
    );
  }

  void _navigateToQuestion(int index) {
    // Save current selection
    _selectedAnswers[_currentQuestion] = _selectedOption;

    setState(() {
      _currentQuestion = index;
      _selectedOption = _selectedAnswers[_currentQuestion];
    });
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  String _formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '$minutes:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = _questions[_currentQuestion];
    final options = currentQuestion['options']!.split(',');
    final answersAudio = currentQuestion['answers']!.split(',');

    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        _showExitDialog();
        return false; // Prevent default back navigation
      },
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: const Text(
            'Assessment',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.green,
          iconTheme: const IconThemeData(color: Colors.white),
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: _showExitDialog,
          ),
        ),
        body: Column(
          children: [
            // Timer at top
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 12),
              color: Colors.grey[200],
              child: Center(
                child: Text(
                  _formatTime(_timer),
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),

            // Question Card
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.green[100],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Question with audio button
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              currentQuestion['question']!,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.black87,
                              ),
                            ),
                          ),
                          Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              icon: Icon(
                                _isPlayingQuestion
                                    ? Icons.pause
                                    : Icons.volume_up,
                                color: Colors.green,
                              ),
                              onPressed: () =>
                                  _playAudio(currentQuestion['audio']!),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 24),

                      // Options
                      ...List.generate(options.length, (index) {
                        bool isSelected = _selectedOption == index;
                        String optionLabel = String.fromCharCode(
                          65 + index,
                        ); // A, B, C, D

                        return Container(
                          margin: const EdgeInsets.only(bottom: 12),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? Colors.green[300]
                                : Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: isSelected
                                  ? Colors.green[600]!
                                  : Colors.grey[300]!,
                              width: isSelected ? 2 : 1,
                            ),
                          ),
                          child: InkWell(
                            onTap: () =>
                                setState(() => _selectedOption = index),
                            borderRadius: BorderRadius.circular(8),
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: Row(
                                children: [
                                  // Option label (A, B, C, D)
                                  Container(
                                    width: 32,
                                    height: 32,
                                    decoration: BoxDecoration(
                                      color: isSelected
                                          ? Colors.white
                                          : Colors.grey[100],
                                      borderRadius: BorderRadius.circular(6),
                                      border: Border.all(
                                        color: Colors.grey[400]!,
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        optionLabel,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: isSelected
                                              ? Colors.green[700]
                                              : Colors.black87,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 12),

                                  // Option text
                                  Expanded(
                                    child: Text(
                                      options[index].trim(),
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: isSelected
                                            ? Colors.black87
                                            : Colors.black87,
                                        fontWeight: isSelected
                                            ? FontWeight.w500
                                            : FontWeight.normal,
                                      ),
                                    ),
                                  ),

                                  // Audio button
                                  Container(
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                    ),
                                    child: IconButton(
                                      icon: const Icon(
                                        Icons.volume_up,
                                        color: Colors.green,
                                      ),
                                      onPressed: () =>
                                          _playAudio(answersAudio[index]),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              ),
            ),

            // Navigation and Progress
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  // Navigation arrows (only show if not first/last question)
                  if (_questions.length > 1)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: _currentQuestion > 0
                              ? () => _navigateToQuestion(_currentQuestion - 1)
                              : null,
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: _currentQuestion > 0
                                ? Colors.green
                                : Colors.grey,
                            size: 32,
                          ),
                        ),
                        IconButton(
                          onPressed: _currentQuestion < _questions.length - 1
                              ? () => _navigateToQuestion(_currentQuestion + 1)
                              : null,
                          icon: Icon(
                            Icons.arrow_forward_ios,
                            color: _currentQuestion < _questions.length - 1
                                ? Colors.green
                                : Colors.grey,
                            size: 32,
                          ),
                        ),
                      ],
                    ),

                  // Show question indicator and progress ONLY if NOT on last question
                  if (_currentQuestion < _questions.length - 1) ...[
                    const SizedBox(height: 16),

                    // Question indicator and progress
                    Column(
                      children: [
                        Text(
                          'Question ${_currentQuestion + 1}/${_questions.length}',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.green,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 8),

                        // Progress indicator
                        Row(
                          children: List.generate(_questions.length, (index) {
                            return Expanded(
                              child: Container(
                                height: 4,
                                margin: EdgeInsets.only(
                                  right: index < _questions.length - 1 ? 4 : 0,
                                ),
                                decoration: BoxDecoration(
                                  color: index <= _currentQuestion
                                      ? Colors.green
                                      : Colors.grey[300],
                                  borderRadius: BorderRadius.circular(2),
                                ),
                              ),
                            );
                          }),
                        ),
                      ],
                    ),
                  ],

                  // Save button (only show on last question)
                  if (_currentQuestion == _questions.length - 1)
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            _selectedAnswers[_currentQuestion] =
                                _selectedOption;
                            _saveAndNavigate();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text(
                            'Save',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
