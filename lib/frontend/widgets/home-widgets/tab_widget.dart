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

class _TabWidgetState extends State<TabWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.transparent,
            width: 0.0,
          ),
        ),
        color: Color.fromARGB(255, 5, 5, 5),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors
                    .grey[800], // Change the background color of the search bar
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: TextField(
                  cursorColor: Colors.white,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    hintStyle: TextStyle(
                      color: Colors.white,
                    ),
                    border: InputBorder.none,
                    prefixIcon:
                        Icon(Icons.search_outlined, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          TabBar(
            // indicatorPadding: EdgeInsets.all(40),
            // indicatorSize: TabBarIndicatorSize.label,
            // indicatorColor: Colors.black,
            controller: widget.tabController,
            indicator: const BoxDecoration(
              color: Color.fromARGB(0, 49, 47, 47),
            ),
            unselectedLabelStyle: const TextStyle(
              fontFamily: 'Roboto',
              fontSize: 14,
              color: Color.fromARGB(255, 236, 232, 232),
            ),
            labelStyle: const TextStyle(
              fontFamily: 'Roboto',
              fontSize: 16,
              color: Colors.black,
            ),
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            tabs: [
              buildTab('Owed To Me'),
              buildTab('Borrowed'),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildTab(String title) {
    final bool isActiveTab =
        widget.tabController.index == widget.tabTitles.indexOf(title);
    const Color activeColor = Colors.white;
    const Color inactiveColor =
        Color.fromARGB(251, 241, 238, 238); // Provide a non-null default value

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color:
            isActiveTab ? activeColor : const Color.fromARGB(189, 88, 82, 82),
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
                  // crossAxisAlignment: CrossAxisAlignment.center,

                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        height: 1.6,
                        letterSpacing: 1,
                        fontSize: 16,
                        fontWeight: isActiveTab ? FontWeight.bold : null,
                        fontFamily: isActiveTab ? 'Roboto-Bold' : 'Roboto',
                        color: isActiveTab ? Colors.black : inactiveColor,
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
