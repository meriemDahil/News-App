import 'package:flutter/material.dart';
import 'package:newsapp/features/news/ui/tab_view.dart';

class Tabbar extends StatefulWidget {
  const Tabbar({super.key});

  @override
  State<Tabbar> createState() => _TabbarState();
}

class _TabbarState extends State<Tabbar> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height, 
      child: Column(
        children: [
          TabBar(
            controller: _tabController,
            tabs: const [
              Tab(text: 'Technology'),
              Tab(text: 'Health'),
              Tab(text: 'Sports'),
              Tab(text: 'Business'),
            ],
            labelStyle: const TextStyle(fontWeight: FontWeight.bold),
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.black,
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children:  [
               TabView(query: 'Algeria',),
               TabView(query: 'Health',),
               TabView(query: 'Sports',),
               TabView(query: 'Business',),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
