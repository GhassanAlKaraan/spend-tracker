import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

//@RoutePage()
class BookDetailsPage extends StatelessWidget {
  const BookDetailsPage({super.key, @PathParam('id') required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text(
            "Book $id details",
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
      ),
    );
  }
}
