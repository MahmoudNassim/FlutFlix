import 'package:flutter/material.dart';
import 'package:moviesapp/models/movie.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.movie});

  final Movie movie ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${movie.title}'),),
    );
  }
}