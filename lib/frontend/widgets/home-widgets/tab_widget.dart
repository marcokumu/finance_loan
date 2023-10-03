import 'package:flutter/material.dart';

class TabWidget extends StatefulWidget {
  final TabController tabController;
  final List<String> tabTitles;
  // final ValueChanged<int> onTabSelected;

  const TabWidget({
    Key? key,
    required this.tabController,
    required this.tabTitles,
    // required this.onTabSelected
  }) : super(key: key);

  @override
  TabWidgetState createState() => TabWidgetState();
}

class TabWidgetState extends State<TabWidget>
    with AutomaticKeepAliveClientMixin<TabWidget> {
  @override
  bool get wantKeepAlive => true;

  void handleTabSelected(int tabIndex) {
    // widget.onTabSelected(tabIndex);
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDarkMode ?  Colors.grey.withOpacity(0.3) : Colors.white;
    final shadowColor = isDarkMode ? Colors.black : Colors.grey.withOpacity(0.2);
    super.build(context);
    return Container(
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
              width: MediaQuery.of(context).size.width * 0.93,

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: backgroundColor,
                boxShadow: [
                  BoxShadow(
                    color: shadowColor,
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: TabBar(
                onTap: handleTabSelected,
                controller: widget.tabController,
                indicator: const UnderlineTabIndicator(
                  borderSide: BorderSide(
                    width: 1,
                  ),
                  // insets: EdgeInsets.symmetric(horizontal: 16.0),
                ),
                unselectedLabelStyle: const TextStyle(
                  fontSize: 16,
                ),

                labelStyle: const TextStyle(
                  fontSize: 16,
                ),
                tabs: [
                  buildTab('Borrowing'),
                  buildTab('Lending'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTab(String title) {
    final bool isActiveTab =
        widget.tabController.index == widget.tabTitles.indexOf(title);

    return Padding(
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
                    style:  TextStyle(
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
    );
  }}

