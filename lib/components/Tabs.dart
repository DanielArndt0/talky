// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:talky_chat/app/AppColors.dart';

class Tabs extends StatefulWidget {
  final Map<String, Widget> tabPage;
  final void Function(int)? onTap;

  const Tabs({
    super.key,
    required this.tabPage,
    this.onTap,
  });

  @override
  State<Tabs> createState() => TabsState();
}

class TabsState extends State<Tabs> {
  @override
  Widget build(BuildContext context) {
    widget.tabPage.keys.toList();

    return DefaultTabController(
      length: widget.tabPage.length,
      child: Column(
        children: [
          Container(
            height: 55,
            decoration: BoxDecoration(
              color: const Color(0xFFF7F7F9),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: TabBar(
                onTap: widget.onTap,
                isScrollable: widget.tabPage.length >= 5 ? true : false,
                dividerColor: Colors.transparent,
                labelColor: AppColors.primaryFontColor,
                labelStyle: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
                unselectedLabelColor: const Color(0xFFAAB0B7),
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 10,
                      color: Colors.black26,
                      offset: Offset(0, 7),
                    ),
                  ],
                ),
                tabs: widget.tabPage.keys.toList().map((e) => Text(e)).toList(),
              ),
            ),
          ),
          Expanded(child: TabBarView(children: widget.tabPage.values.toList())),
        ],
      ),
    );
  }
}
