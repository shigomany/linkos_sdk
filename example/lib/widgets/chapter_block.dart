import 'package:flutter/material.dart';

class ChapterBlock extends StatelessWidget {
  const ChapterBlock({
    Key? key,
    required this.title,
    required this.child,
  }) : super(key: key);

  final Widget child;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Theme.of(context).highlightColor),
      padding: const EdgeInsets.all(4),
      child: SizedBox(
        width: double.infinity,
        child: Center(
          child: Column(
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              child,
            ],
          ),
        ),
      ),
    );
  }
}
