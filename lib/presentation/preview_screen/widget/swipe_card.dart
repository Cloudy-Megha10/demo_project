import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:demo_project/presentation/preview_screen/widget/card_provider.dart';
import 'package:provider/provider.dart';

class SwipeCards extends StatefulWidget {
  final String urlImage;

  const SwipeCards({
    Key? key,
    required this.urlImage,
  }) : super(key: key);

  @override
  State<SwipeCards> createState() => SwipeCardsState();
}

class SwipeCardsState extends State<SwipeCards> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final size = MediaQuery.of(context).size;

      final provider = Provider.of<CardProvider>(context);
      provider.setScreenSize(size);
    });
  }

  @override
  Widget build(BuildContext context) => SizedBox.expand(
        child: buildFrontCard(),
      );

  Widget buildFrontCard() => GestureDetector(
        child: LayoutBuilder(builder: (context, constraints) {
          return Builder(builder: (context) {
            final provider = Provider.of<CardProvider>(context);
            final pi = 3.142;
            final position = provider.position;
            final milliseconds = provider.isDragging ? 0 : 400;
            final center = constraints.smallest.center(Offset.zero);
            final angle = provider.angle * pi / 180;
            final rotatedMatrix = Matrix4.identity()
              ..translate(center.dx, center.dy)
              ..rotateZ(angle)
              ..translate(-center.dx, -center.dy);
            return AnimatedContainer(
              curve: Curves.easeInOut,
              duration: Duration(milliseconds: milliseconds),
              transform: rotatedMatrix..translate(position.dx, position.dy),
              child: buildCard(),
            );
          });
        }),
        onPanStart: (details) {
          final provider = Provider.of<CardProvider>(context);
          provider.startPosition(details);
        },
        onPanUpdate: (details) {
          final provider = Provider.of<CardProvider>(context);
          provider.updatePosition(details);
        },
        onPanEnd: (details) {
          final provider = Provider.of<CardProvider>(context);
          provider.endPosition();
        },
      );

  Widget buildCard() => ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
          decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(widget.urlImage),
            fit: BoxFit.cover,
            alignment: Alignment(-0.3, 0)),
      )));
}
