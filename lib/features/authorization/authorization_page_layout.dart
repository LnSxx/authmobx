import 'package:authmobx/clippers/mountain_clipper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AuthorizationPageLayout extends StatelessWidget {
  final Widget form;
  const AuthorizationPageLayout({
    super.key,
    required this.form,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Stack(
          children: [
            Container(
              color: theme.colorScheme.onBackground,
            ),
            DraggableScrollableSheet(
              initialChildSize: 0.7,
              maxChildSize: 0.9,
              minChildSize: 0.7,
              snap: true,
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return Container(
                  color: theme.colorScheme.background,
                  child: Column(
                    children: [
                      ClipPath(
                        clipper: ParabolicClipper(),
                        child: Container(
                          height: 88,
                          color: theme.colorScheme.onBackground,
                        ),
                      ),
                      Expanded(
                        child: ListView(
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          controller: scrollController,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 24),
                              child: form,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 54, left: 24),
              child: SvgPicture.asset('assets/logo.svg'),
            ),
          ],
        ),
      ),
    );
  }
}
