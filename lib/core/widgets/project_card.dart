import 'package:flutter/material.dart';

class ProjectsCard extends StatelessWidget {
  const ProjectsCard({
    super.key,
    required this.size,
    required this.url,
  });
  final Size size;
  final String url;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      image: DecorationImage(image: NetworkImage(url), fit: BoxFit.fill),
    ));
  }
}
