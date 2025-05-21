import 'dart:io';

import 'package:bloc_playlist/blocs/all_bloc/image_picker_bloc.dart';
import 'package:bloc_playlist/blocs/events/image_picker_event.dart';
import 'package:bloc_playlist/states/image_picker_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImagePickerView extends StatefulWidget {
  const ImagePickerView({super.key});

  @override
  State<ImagePickerView> createState() => _ImagePickerViewState();
}

class _ImagePickerViewState extends State<ImagePickerView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pick Image')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Camera Button
            InkWell(
              onTap: () {
                context.read<ImagePickerBlock>().add(CameraCapture());
              },
              child: Container(
                height: 40,
                width: 200,
                alignment: Alignment.center,
                color: Colors.green,
                child: Text('Pick Image (Camera)', style: TextStyle(color: Colors.white)),
              ),
            ),

            SizedBox(height: 10),

            // Gallery Button
            InkWell(
              onTap: () {
                context.read<ImagePickerBlock>().add(GalleryCapture());
              },
              child: Container(
                height: 40,
                width: 200,
                alignment: Alignment.center,
                color: Colors.green,
                child: Text('Pick Image (Gallery)', style: TextStyle(color: Colors.white)),
              ),
            ),

            SizedBox(height: 20),

            // Image Preview
            BlocBuilder<ImagePickerBlock, ImagePickerStates>(
              builder: (context, state) {
                if (state.file != null) {
                  return Image.file(
                    File(state.file!.path),
                    height: 150,
                    width: 150,
                    fit: BoxFit.cover,
                  );
                } else {
                  return Text('No image selected');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
