import 'package:flutter/widgets.dart';

class VerticalText extends StatefulWidget {
  const VerticalText({
    Key? key,
    required this.content,
    required this.author,
    required this.numberOfSingleLineText,
    this.singleLineWidth = 16,
  }) : super(key: key);

  final String content;
  final String author;
  final int numberOfSingleLineText;
  final double singleLineWidth;

  @override
  State<VerticalText> createState() => _VerticalTextState();
}

@override
void initState() {}

Widget textWidget(
    String content, double singleLineWidth, int numberOfSingleLineText) {
  List<Widget> allTextLine = [];

  if (content.isNotEmpty) {
    int numberOfLines = content.length ~/ numberOfSingleLineText;
    numberOfLines++;

    for (int i = 0; i < numberOfLines; i++) {
      String singleLineText = '';
      if (i < numberOfLines - 1) {
        singleLineText = content.substring(i * numberOfSingleLineText,
            i * numberOfSingleLineText + numberOfSingleLineText);
      } else {
        singleLineText = content.substring(i * numberOfSingleLineText);
      }

      allTextLine.add(Container(
        margin: const EdgeInsets.only(left: 5),
        width: singleLineWidth,
        child: Text(
          singleLineText,
          textAlign: TextAlign.left,
        ),
      ));
    }

    allTextLine = allTextLine.reversed.toList();
  } else {
    allTextLine.add(const Text(''));
  }

  return Container(
    padding: const EdgeInsets.only(
      top: 40,
      bottom: 30,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: allTextLine,
    ),
  );
}

class _VerticalTextState extends State<VerticalText> {
  @override
  Widget build(BuildContext context) {
    List<Widget> allTextLine = [];

    String content = widget.content;
    int numberOfSingleLineText = widget.numberOfSingleLineText;
    double singleLineWidth = widget.singleLineWidth;

    if (content.isNotEmpty) {
      int numberOfLines = content.length ~/ numberOfSingleLineText;
      numberOfLines++;

      for (int i = 0; i < numberOfLines; i++) {
        String singleLineText = '';
        if (i < numberOfLines - 1) {
          singleLineText = content.substring(i * numberOfSingleLineText,
              i * numberOfSingleLineText + numberOfSingleLineText);
        } else {
          singleLineText = content.substring(i * numberOfSingleLineText);
        }

        allTextLine.add(Container(
          margin: const EdgeInsets.only(left: 5),
          width: singleLineWidth,
          child: Text(
            singleLineText,
            textAlign: TextAlign.left,
          ),
        ));
      }

      allTextLine = allTextLine.reversed.toList();
    } else {
      allTextLine.add(const Text(''));
    }

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(
            top: 40,
            bottom: 30,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: allTextLine,
          ),
        ),
        Text(
          '-${widget.author}-',
          style: TextStyle(
            fontSize: widget.singleLineWidth,
          ),
        ),
      ],
    );
  }
}
