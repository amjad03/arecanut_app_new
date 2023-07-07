import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class ImageUploader extends StatefulWidget {
  const ImageUploader({super.key});

  @override
  _ImageUploaderState createState() => _ImageUploaderState();
}

class _ImageUploaderState extends State<ImageUploader> {
  late File _imageFile;
  late String _imageUrl;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? get currentUser => _auth.currentUser;

  Future<void> _uploadImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });

      try {
        // Create a unique filename for the image
        final userId = currentUser?.uid;
        final uniqueId = DateTime.now().millisecondsSinceEpoch.toString();
        final fileName = '$userId/$uniqueId';

        // Upload the image file to Firebase Storage
        final storageRef = FirebaseStorage.instance.ref().child(fileName);
        final uploadTask = storageRef.putFile(_imageFile);

        final takeSnapshot = await uploadTask;

        String downloadUrl = await takeSnapshot.ref.getDownloadURL();
        // Wait for the upload to complete and retrieve the download URL
        // final snapshot = await uploadTask.onComplete;
        // final downloadUrl = await snapshot.ref.getDownloadURL();

        setState(() {
          _imageUrl = downloadUrl;
        });

        // Store the download URL in the record or database
        // (e.g., update the machine record with the image URL)
        print('Image download URL: $_imageUrl');
      } catch (error) {
        print('Error uploading image: $error');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Uploader'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_imageUrl != null) Image.network(_imageUrl),
            ElevatedButton(
              onPressed: _uploadImage,
              child: Text('Select Image'),
            ),
          ],
        ),
      ),
    );
  }
}
