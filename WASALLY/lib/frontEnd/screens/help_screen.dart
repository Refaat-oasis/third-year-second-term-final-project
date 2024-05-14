import 'package:flutter/material.dart';

class TopicsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help Center'),
      ),
      body: ListView(
        children: [
          _TopicSection(
            title: 'Privacy policy',
            topics: const [
              'the security procedures in place to protect the misuse of your data',
            ],
          ),
          _TopicSection(
            title: 'Terms and Condtition',
            topics: const [
              'Treat everyone with respect',
            ],
          ),
          _TopicSection(
            title: 'Send us Feedback',
            topics: const [
              'Tell us what you think about our app',
            ],
          ),
          // Add more sections for each topic category
          _TopicSection(
            title: 'About Us',
            topics: const [
              'we are WASALLY which is a delivery app that facilitate delivering anything at anytime ',
            ],
          ),
          _TopicSection(
            title: 'Contact With Us',
            topics: const [
              'Tel/ 088457485',
              'Tel/ 088457485',
            ],
          ),
        ],
      ),
    );
  }
}

class _TopicSection extends StatelessWidget {
  final String title;
  final List<String> topics;

  _TopicSection({required this.title, required this.topics});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ...topics.map((topic) => Text(topic)),
          ],
        ),
      ),
    );
  }
}
