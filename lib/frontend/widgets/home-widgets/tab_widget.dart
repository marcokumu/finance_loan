import 'package:flutter/material.dart';

class TabWidget extends StatefulWidget {
  final TabController tabController;
  final List<String> tabTitles;

  const TabWidget({
    Key? key,
    required this.tabController,
    required this.tabTitles,
  }) : super(key: key);

  @override
  _TabWidgetState createState() => _TabWidgetState();
}

class _TabWidgetState extends State<TabWidget>
    with AutomaticKeepAliveClientMixin<TabWidget> {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      // padding: const EdgeInsets.symmetric(horizontal: 50),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.transparent,
            width: 0.0,
          ),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
          TabBar(
            controller: widget.tabController,
            indicator: const UnderlineTabIndicator(
              borderSide: BorderSide(
                width: 1,
              ),
              insets: EdgeInsets.symmetric(horizontal: 16.0),
            ),
            unselectedLabelStyle: const TextStyle(
              fontSize: 14,
            ),
            labelStyle: const TextStyle(
              fontSize: 16,
            ),
            tabs: [
              buildTab('Borrowed'),
              buildTab('Owed To Me'),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildTab(String title) {
    final bool isActiveTab =
        widget.tabController.index == widget.tabTitles.indexOf(title);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
      ),
      child: Padding(
        padding: const EdgeInsets.all(1.0),
        child: Tab(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        height: 1.6,
                        letterSpacing: 1,
                        fontSize: 16,
                        fontWeight: isActiveTab ? FontWeight.bold : null,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
