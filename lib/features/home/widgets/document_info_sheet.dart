import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qcraft/core/model/document_model.dart';
import 'package:qcraft/core/services/extensions.dart';

class DocumentInfoSheet extends StatelessWidget {
  final DocumentModel document;
  final VoidCallback? actionButton;
  final String? actionText;

  const DocumentInfoSheet(
      {super.key, required this.document, this.actionButton, this.actionText});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          Container(
            padding: EdgeInsetsGeometry.only(top: 4, right: 16.0, left: 16.0),
            decoration:
                BoxDecoration(border: Border(bottom: BorderSide(width: 0.1))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    actionButton?.call();
                    Navigator.pop(context);
                  },
                  icon: Text(
                    actionText ?? "Selected",
                    style: TextStyle(
                        fontFamily: "Proxima Nova",
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: actionText != null
                            ? CupertinoColors.systemBlue
                            : CupertinoColors.systemGrey),
                  ),
                  style: IconButton.styleFrom(),
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Text(
                    "Done",
                    style: TextStyle(
                        fontFamily: "Proxima Nova",
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: CupertinoColors.systemBlue),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
              child: SafeArea(
                bottom: true,
                top: false,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      document.title ?? "Title",
                      style: TextStyle(
                          fontFamily: "Proxima Nova",
                          fontSize: 24,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Container(
                      padding: EdgeInsetsGeometry.symmetric(
                          horizontal: 8, vertical: 8),
                      margin: EdgeInsetsGeometry.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                          color: CupertinoColors.systemBrown,
                          borderRadius: BorderRadius.circular(8)),
                      child: Row(
                        children: [
                          Icon(
                            Icons.file_present_rounded,
                            color: Colors.white,
                            size: 32,
                          ),
                          Expanded(
                            child: Text(
                              document.fileName ?? "File Name",
                              style: TextStyle(
                                  fontFamily: "Proxima Nova",
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  overflow: TextOverflow.ellipsis),
                            ),
                          ),
                          Container(
                            padding: EdgeInsetsGeometry.symmetric(
                                horizontal: 6, vertical: 4),
                            margin: EdgeInsetsGeometry.only(left: 4),
                            decoration: BoxDecoration(
                                color: CupertinoColors.activeOrange,
                                borderRadius: BorderRadius.circular(4)),
                            child: Text(
                              document.formatType?.toUpperCase() ?? "File Name",
                              style: TextStyle(
                                  fontFamily: "Proxima Nova",
                                  fontSize: 12,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  overflow: TextOverflow.ellipsis),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      "TOPICS",
                      style: TextStyle(
                          fontFamily: "Proxima Nova",
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 2),
                    ),
                    SizedBox(
                      height: 4.0,
                    ),
                    Wrap(
                      spacing: 8,
                      children:
                          List.generate(document.topics?.length ?? 0, (index) {
                        final topic = document.topics![index];
                        return Chip(
                          label: Text(topic.capitalize()),
                        );
                      }),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      "DESCRIPTION",
                      style: TextStyle(
                          fontFamily: "Proxima Nova",
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 2),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      document.description ?? "description",
                      style: TextStyle(
                          fontFamily: "Proxima Nova",
                          fontSize: 14,
                          fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
