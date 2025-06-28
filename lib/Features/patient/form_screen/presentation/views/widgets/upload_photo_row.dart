import 'dart:io';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class UploadPhotoRow extends StatelessWidget {
  final VoidCallback onTap;
  final File? selectedImage;

  const UploadPhotoRow({
    super.key,
    required this.onTap,
    required this.selectedImage,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          const Icon(
            LineAwesomeIcons.upload_solid,
            color: Color(0xff676666),
            size: 30,
          ),
          const SizedBox(width: 15),
          const Text(
            "Upload Photo",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xff676666),
              fontSize: 20,
            ),
          ),
          const SizedBox(width: 10),
          if (selectedImage != null)
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.file(
                selectedImage!,
                width: 180,
                height: 180,
                fit: BoxFit.cover,
              ),
            ),
        ],
      ),
    );
  }
}
