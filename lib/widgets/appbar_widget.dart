import 'package:flutter/material.dart';

PreferredSizeWidget appBarWidget(
    {required BuildContext context, required VoidCallback onPressed}) {
  return AppBar(
    leading: IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: onPressed,
    ),
    title: const Text('Speaking to AI Bot'),
    centerTitle: true,
    actions: [
      IconButton(
        icon: const Icon(Icons.more_vert),
        onPressed: () {},
      ),
    ],
  );
}
