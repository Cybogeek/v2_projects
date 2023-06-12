import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app_adv/data/questions.dart';
import 'package:quiz_app_adv/models/quizquestions.dart';
import 'package:quiz_app_adv/results.dart';

import 'widgets/gobackbtn.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  bool showresult = false;
  int quescount = questions.length;
  int currentquest = 0;

  List ans = [];
  List saveans = [];
  void changequest(String ans) {
    if (quescount - 1 > currentquest) {
      setState(() {
        saveans.add([ans, questions[currentquest]]);
        currentquest++;
      });
    } else {
      setState(() {
        showresult = true;
      });
      print(saveans);
    }
  }

  getQuest() {
    ans.clear();
    return questions[currentquest];
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    QuizQuestion qs = getQuest();
    ans.addAll(qs.answers);
    ans.shuffle();
    return showresult == false
        ? SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const GoBackBtn(),
                const SizedBox(
                  height: 25,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Text(
                    qs.question,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: GoogleFonts.lato().fontFamily,
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: ans.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Theme.of(context).colorScheme.onPrimaryContainer,
                          foregroundColor:
                              Theme.of(context).colorScheme.onPrimary,
                        ),
                        onPressed: () {
                          changequest(ans[index]);
                        },
                        child: Text(
                          ans[index],
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        : Results(
            data: saveans,
          );
  }
}
