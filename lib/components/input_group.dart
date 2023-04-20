import 'package:flutter/material.dart';

class InputGroup extends StatelessWidget {
  final List<Widget> inputs;
  final GlobalKey formKey;
  final double minHeight;
  final double spacing;

  const InputGroup({
    Key? key,
    required this.inputs,
    required this.formKey,
    this.minHeight = 220,
    this.spacing = 20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Container(
        constraints: BoxConstraints(minHeight: minHeight),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: inputs
              .map((input) => Padding(
                    padding: EdgeInsets.only(top: spacing),
                    child: input,
                  ))
              .toList(),
        ),
      ),
    );
  }
}
