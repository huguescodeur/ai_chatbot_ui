import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

class GeneratePicturesPage extends StatelessWidget {
  const GeneratePicturesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Generate Pictures & Art'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FadeInDown(
                duration: const Duration(milliseconds: 800),
                child: const Text(
                  'Create Stunning Art with AI',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              FadeInLeft(
                duration: const Duration(milliseconds: 800),
                child: const Text(
                  textAlign: TextAlign.center,
                  'Upload an image or let the AI generate something amazing for you!',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ),
              const SizedBox(height: 30),
              Center(
                child: FadeIn(
                  duration: const Duration(milliseconds: 1000),
                  child: Container(
                    width: double.infinity,
                    height: 250,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade400),
                    ),
                    child: Center(
                      child: IconButton(
                        iconSize: 50,
                        icon:
                            const Icon(Icons.cloud_upload, color: Colors.blue),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              FadeInUp(
                duration: const Duration(milliseconds: 800),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade400,
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 30),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {},
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.image, color: Colors.white),
                      SizedBox(width: 10),
                      Text('Generate Art', style: TextStyle(fontSize: 18)),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 40),
              const Expanded(
                child: Center(
                  child: Text(
                    'Your generated pictures will appear here',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
