import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:keeper/core/router/app_router.dart';
import 'package:keeper/src/person/model/person.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key, required this.person});
  final Person person;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.white),
        forceMaterialTransparency: true,
        // leading: Container(
        //   decoration: BoxDecoration(
        //     color: Colors.grey.shade500,
        //     shape: BoxShape.circle,
        //   ),
        //   child: IconButton(
        //     splashRadius: 20,
        //     color: Colors.white,
        //     onPressed: () {
        //       context.pop();
        //     },
        //     icon: Icon(Icons.arrow_back),
        //   ),
        // ),
      ),

      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Container(
                height: 350,
                decoration: BoxDecoration(
                  image:
                      person.profileImage != null
                          ? DecorationImage(
                            image: MemoryImage(person.profileImage!),
                            fit: BoxFit.cover,
                          )
                          : null,
                ),
              ),
              Container(
                height: 350,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black.withValues(alpha: .7),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Kelly Hirschfield',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'VP Global Expansion - Facebook',
                      style: TextStyle(fontSize: 16, color: Colors.white70),
                    ),
                  ],
                ),
              ),
            ],
          ),
          TabBarSection(),
        ],
      ),
    );
  }
}

class TabBarSection extends StatelessWidget {
  const TabBarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            TabBar(
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Colors.black,
              tabs: [Tab(text: 'About'), Tab(text: 'Interactions')],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  AboutTab(),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Interactions Content'),
                        ElevatedButton(
                          onPressed: () {
                            context.goNamed(AppPage.transactionViewScreen.name);
                          },
                          child: Text("GOTO TRANSACTION PAGE"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AboutTab extends StatelessWidget {
  const AboutTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'About',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            'Family woman, patriot, Hirschfield. Founder @GlobalExpansionExecs. Formerly: EIC, The New York Observer; founding editor, Gawker. Brooklynite via Alabama.',
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Icon(Icons.link, color: Colors.purple),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  'You and Kelly first connected on October 12th, 2016 via Twitter.',
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Icon(Icons.calendar_today, color: Colors.purple),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  'It appears that it’s been about 3 months since you and Kelly were last in touch.',
                  style: TextStyle(fontSize: 14),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
