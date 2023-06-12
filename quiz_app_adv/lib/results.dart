import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app_adv/theme/custom_color.g.dart';
import 'package:quiz_app_adv/widgets/gobackbtn.dart';

class Results extends StatefulWidget {
  const Results({super.key, required this.data});
  final List data;

  @override
  State<Results> createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  int totalcorrect = 0;
  gettotalcorrect() {
    for (var i in widget.data) {
      if (i[0] == i[1].answers[0]) {
        setState(() {
          totalcorrect++;
        });
      }
    }
  }

  @override
  void initState() {
    gettotalcorrect();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const GoBackBtn(),
          const SizedBox(
            height: 25,
          ),
          Text(
            'Quiz Result...($totalcorrect/${widget.data.length})',
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: GoogleFonts.lato().fontFamily,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.data.length,
              itemBuilder: (context, index) {
                return Card(
                  color:
                      widget.data[index][0] == widget.data[index][1].answers[0]
                          ? Theme.of(context)
                              .extension<CustomColors>()!
                              .onExtraContainer
                          : Theme.of(context).colorScheme.error,
                  child: ListTile(
                    title: Text(
                      'Q$index: ' + widget.data[index][1].question,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                                color: Colors.black54,
                                blurRadius: 8,
                                offset: Offset(-1, 1))
                          ]),
                    ),
                    subtitle: Text(
                      'Ans: ' + widget.data[index][0],
                      style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                                color: Colors.black54,
                                blurRadius: 8,
                                offset: Offset(-1, 1))
                          ]),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
