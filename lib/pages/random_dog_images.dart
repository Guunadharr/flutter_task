import 'package:flutter/material.dart';
import 'package:flutter_task/controller/dog_images_controller.dart';

class RandomDogImages extends StatefulWidget {
  const RandomDogImages({super.key});

  @override
  State<RandomDogImages> createState() => _RandomDogImagesState();
}

class _RandomDogImagesState extends State<RandomDogImages> {
  String imageUrl = '';
  // get random dog image
  Future<void> getImage() async {
    try {
      var dogImage = await DogImagesController.fetchRandomDogImage();
      print(dogImage);
      setState(() {
        imageUrl = dogImage;
      });
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Random dog images'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            imageUrl.isNotEmpty ? Image.network(imageUrl) : Container(),
            ElevatedButton(
              onPressed: () {
                DogImagesController.fetchRandomDogImage().then((dogImage) {
                  setState(() {
                    imageUrl = dogImage;
                  });
                });
              },
              child: const Text('Refresh'),
            ),
          ],
        ),
      ),
    );
  }
}
