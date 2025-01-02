// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

List<StaggeredGridTile> _cardTile = [
  StaggeredGridTile.count(
    crossAxisCellCount: 1,
    mainAxisCellCount: 2,
    child: ImageTile(imagePath: 'assets/images/island.jpg'),
  ),
  StaggeredGridTile.count(
    crossAxisCellCount: 1,
    mainAxisCellCount: 1,
    child: ImageTile(imagePath: 'assets/images/island.jpg'),
  ),
  StaggeredGridTile.count(
    crossAxisCellCount: 1,
    mainAxisCellCount: 2,
    child: ImageTile(imagePath: 'assets/images/island.jpg'),
  ),
  StaggeredGridTile.count(
    crossAxisCellCount: 1,
    mainAxisCellCount: 1,
    child: ImageTile(imagePath: 'assets/images/island.jpg'),
  ),
  StaggeredGridTile.count(
    crossAxisCellCount: 4,
    mainAxisCellCount: 2,
    child: ImageTile(imagePath: 'assets/images/island.jpg'),
  ),
];

class FolderScreen extends StatelessWidget {
  const FolderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Folders"),
        centerTitle: true,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: StaggeredGrid.count(
            crossAxisCount: 2,
            mainAxisSpacing: 4.0,
            crossAxisSpacing: 4.0,
            children: _cardTile,
          ),
        ),
      ),
    );
  }
}

class ImageTile extends StatelessWidget {
  final String imagePath;

  const ImageTile({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Image.asset(imagePath, fit: BoxFit.cover),
    );
  }
}
