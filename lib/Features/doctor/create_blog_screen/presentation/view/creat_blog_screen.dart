import 'dart:io';

import 'package:file_selector/file_selector.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../../../constants.dart';
import '../../data/provider/blog_provider.dart';


class CreateBlogScreen extends StatefulWidget {
  const CreateBlogScreen({super.key});

  @override
  State<CreateBlogScreen> createState() => _CreateBlogScreenState();
}

class _CreateBlogScreenState extends State<CreateBlogScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  List<String> selectedMediaPaths = [];

  void _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        selectedMediaPaths.add(image.path);
      });
    }
  }

  void _pickVideo() async {
    final XFile? video = await _picker.pickVideo(source: ImageSource.gallery);
    if (video != null) {
      setState(() {
        selectedMediaPaths.add(video.path);
      });
    }
  }

  void _pickPDF() async {
    try {
      final XFile? file = await openFile(
        acceptedTypeGroups: [
          const XTypeGroup(label: 'PDF', extensions: ['pdf']),
        ],
      );

      if (file != null) {
        setState(() {
          selectedMediaPaths.add(file.path);
        });
      }
    } catch (e) {
      print('Error selecting PDF: $e');
      // Optional: Show a user-friendly error message
    }
  }

  void _submitBlog() async {
    if (_titleController.text.isEmpty || _contentController.text.isEmpty) return;

    final newPost = {
      'doctorName': 'Dr. Zeyad Abdelglel',
      'doctorImage': 'images/doc.png',
      'timeEdited': 'Just now',
      'title': _titleController.text,
      'content': _contentController.text,
      'media': selectedMediaPaths.take(3).toList(),
    };

    await Provider.of<BlogProvider>(context, listen: false).addBlogPost(newPost);

    _titleController.clear();
    _contentController.clear();
    setState(() {
      selectedMediaPaths.clear();
    });
  }

  Widget _mediaOption(String iconPath, String label, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Image.asset(iconPath, width: 30, height: 30),
          const SizedBox(width: 5),
          Text(label, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final blogPosts = context.watch<BlogProvider>().blogPosts;

    return Scaffold(
      backgroundColor: kbeigeColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: Text("Write Medical Vlog",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
                ),
                const SizedBox(height: 25),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xff676666), width: 1.5),
                    color: kbeigeColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.asset('images/doc.png', width: 60, height: 60),
                          const SizedBox(width: 15),
                          Expanded(
                            child: Column(
                              children: [
                                TextField(
                                  controller: _titleController,
                                  decoration: const InputDecoration(
                                    hintText: "Enter blog title",
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                TextField(
                                  controller: _contentController,
                                  maxLines: 3,
                                  decoration: const InputDecoration(
                                    hintText: "Write your vlog",
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: selectedMediaPaths.map((path) {
                          if (path.endsWith('.pdf')) {
                            return Container(
                              width: 100,
                              height: 100,
                              color: Colors.grey[300],
                              child: const Center(child: Icon(Icons.picture_as_pdf)),
                            );
                          } else if (path.endsWith('.mp4')) {
                            return Container(
                              width: 100,
                              height: 100,
                              color: Colors.grey[400],
                              child: const Center(child: Icon(Icons.videocam)),
                            );
                          } else {
                            return Image.file(File(path),
                                width: 100, height: 100, fit: BoxFit.cover);
                          }
                        }).toList(),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _mediaOption('images/pho.png', "Photo", _pickImage),
                          const SizedBox(width: 15),
                          _mediaOption('images/vid.png', "Video", _pickVideo),
                          const SizedBox(width: 15),
                          _mediaOption('images/atr.png', "PDF", _pickPDF),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Center(
                        child: ElevatedButton.icon(
                          onPressed: _submitBlog,
                          icon: const Icon(Icons.send),
                          label: const Text("Post Vlog"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xffE85729),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                const Divider(thickness: 2, color: Color(0xffD0BDA9)),
                const SizedBox(height: 20),
                ...blogPosts.map((post) => _buildBlogCard(post)).toList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBlogCard(Map<String, dynamic> post) {
    final blogProvider = Provider.of<BlogProvider>(context, listen: false);
    final index = context.watch<BlogProvider>().blogPosts.indexOf(post);

    return Container(
      margin: const EdgeInsets.only(bottom: 25),
      padding: const EdgeInsets.only(left: 30, top: 20, bottom: 10, right: 10),
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(color: Color(0xffCEB395)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(post['doctorImage'], width: 60, height: 60),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(post['doctorName'],
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20)),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        const Icon(CupertinoIcons.eyedropper,
                            size: 20, color: Color(0xff676666)),
                        const SizedBox(width: 10),
                        Text(post['timeEdited'],
                            style: const TextStyle(
                                color: Color(0xff676666), fontSize: 18)),
                      ],
                    ),
                  ],
                ),
              ),
              // 🗑️ DELETE BUTTON
              IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: const Text("Delete Blog"),
                      content: const Text("Are you sure you want to delete this blog?"),
                      actions: [
                        TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text("Cancel")),
                        TextButton(
                            onPressed: () {
                              blogProvider.deleteBlogPost(index);
                              Navigator.pop(context);
                            },
                            child: const Text("Delete", style: TextStyle(color: Colors.red))),
                      ],
                    ),
                  );
                },
              )
            ],
          ),
          const SizedBox(height: 20),
          Text(
            post['title'],
            style: TextStyle(
              color: kprimaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          Text(post['content'], style: const TextStyle(fontSize: 18)),
          const SizedBox(height: 10),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: (post['media'] as List).map((path) {
              if (path.endsWith('.pdf')) {
                return Container(
                  width: 100,
                  height: 100,
                  color: Colors.grey[300],
                  child: const Center(child: Icon(Icons.picture_as_pdf)),
                );
              } else if (path.endsWith('.mp4')) {
                return Container(
                  width: 100,
                  height: 100,
                  color: Colors.grey[400],
                  child: const Center(child: Icon(Icons.videocam)),
                );
              } else {
                return Image.file(File(path),
                    width: 100, height: 100, fit: BoxFit.cover);
              }
            }).toList(),
          ),
        ],
      ),
    );
  }

}
