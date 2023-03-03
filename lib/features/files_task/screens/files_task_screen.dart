import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:todquest/core/utilities/utilities.dart';

class FilesTaskScreen extends StatefulWidget {
  const FilesTaskScreen({super.key});

  @override
  State<FilesTaskScreen> createState() => _FilesTaskScreenState();
}

class _FilesTaskScreenState extends State<FilesTaskScreen> {
  List<String> pathList = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(const Color(0xFFf2a493))),
              onPressed: () async {
                pathList.clear();
                String? selectedDirectory =
                    await FilePicker.platform.getDirectoryPath();

                if (selectedDirectory == null) {
                } else {
                  printDirectoryContents(selectedDirectory);
                }
              },
              child: const Text("Pick a Path")),
          SizedBox(
            width: Utilities.screenWidth * 0.8,
            height: Utilities.screenHeight * 0.6,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: pathList.isEmpty
                        ? List.generate(0, (index) => Container())
                        : List.generate(
                            pathList.length,
                            (index) => Column(
                                  children: [
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: const Color(0xFFf2a493),
                                        ),
                                        padding: const EdgeInsets.all(5),
                                        child: Text(pathList[index])),
                                  ],
                                )),
                  )
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }

  void printDirectoryContents(String path, [int level = 0]) {
    Directory directory = Directory(path);
    List<FileSystemEntity> contents = directory.listSync();
    for (FileSystemEntity entity in contents) {
      if (entity is File) {
        pathList.add(
            '${'  ' * level}${entity.parent.path}-${entity.path.split('-').last}');
      } else if (entity is Directory) {
        printDirectoryContents(entity.path, level + 1);
      }
    }
    setState(() {
      pathList;
    });
  }
}
