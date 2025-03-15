import 'dart:typed_data';

import 'package:flutter/material.dart';

class ImagePreViewRow extends StatelessWidget {
  const ImagePreViewRow({
    super.key,
    required this.pickedImages,
    required this.onImageRemoved,
  });

  final List<Uint8List> pickedImages;
  final ValueChanged<int> onImageRemoved;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children:
            pickedImages.isEmpty
                ? [SizedBox(height: 100)]
                : List.generate(pickedImages.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.memory(
                            pickedImages[index],
                            width: 120,
                            height: 120,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Positioned(
                          top: 5,
                          right: 5,
                          child: GestureDetector(
                            onTap: () => onImageRemoved(index),
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey.withValues(alpha: .7),
                              ),
                              padding: EdgeInsets.all(4),
                              child: Icon(
                                Icons.close,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
      ),
    );
  }
}
