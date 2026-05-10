import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

import '../../view/projects/components/title_text.dart';

class ContactPageDesk extends StatelessWidget {
  const ContactPageDesk({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 600,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TitleText(prefix: 'Contact ', title: 'Me'),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'DISCUSS A PROJECT OR JUST WANT TO SAY HI? MY INBOX IS OPEN FOR ALL.',
            style: TextStyle(color: Colors.grey, fontSize: 22),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const Text(
                '☎️',
                style: TextStyle(color: Colors.grey, fontSize: 28),
              ),
              const SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () {
                  final Uri emailLaunchUri = Uri(
                    scheme: 'sms',
                    path: '+41 79 442 53 33',
                    queryParameters: <String, String>{
                      'body': Uri.encodeComponent(
                          'Hi, I have seen your portfolio and I would like to discuss a project with you.'),
                    },
                  );
                  launchUrl(emailLaunchUri);
                },
                child: const Text(
                  '+41 79 442 53 33',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 28,
                      fontStyle: FontStyle.italic),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const Text(
                '✉️',
                style: TextStyle(color: Colors.grey, fontSize: 28),
              ),
              const SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () {
                  final Uri emailLaunchUri = Uri(
                    scheme: 'mailto',
                    path: 'fran.quiles00@gmail.com',
                    query: encodeQueryParameters(<String, String>{
                      'subject': '',
                    }),
                  );
                  launchUrl(emailLaunchUri);
                },
                child: const Text(
                  'fran.quiles00@gmail.com',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 28,
                      fontStyle: FontStyle.italic),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

class ContactPageTab extends StatelessWidget {
  const ContactPageTab({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: 600,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TitleText(prefix: 'Contact ', title: 'Me'),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'DISCUSS A PROJECT OR JUST WANT TO SAY HI? MY INBOX IS OPEN FOR ALL.',
              style: TextStyle(color: Colors.grey, fontSize: 22),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const Text(
                  '☎️',
                  style: TextStyle(color: Colors.grey, fontSize: 28),
                ),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {
                    final Uri emailLaunchUri = Uri(
                      scheme: 'sms',
                      path: '+41 79 442 53 33',
                      queryParameters: <String, String>{
                        'body': Uri.encodeComponent(
                            'Hi, I have seen your portfolio and I would like to discuss a project with you.'),
                      },
                    );
                    launchUrl(emailLaunchUri);
                  },
                  child: const Text(
                    '+41 79 442 53 33',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 28,
                        fontStyle: FontStyle.italic),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const Text(
                  '✉️',
                  style: TextStyle(color: Colors.grey, fontSize: 28),
                ),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {
                    final Uri emailLaunchUri = Uri(
                      scheme: 'mailto',
                      path: 'fran.quiles00@gmail.com',
                      query: encodeQueryParameters(<String, String>{
                        'subject': '',
                      }),
                    );
                    launchUrl(emailLaunchUri);
                  },
                  child: const Text(
                    'fran.quiles00@gmail.com',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 28,
                        fontStyle: FontStyle.italic),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

class ContactPageMob extends StatelessWidget {
  const ContactPageMob({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: 600,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TitleText(prefix: 'Contact ', title: 'Me'),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'DISCUSS A PROJECT OR JUST WANT TO SAY HI? MY INBOX IS OPEN FOR ALL.',
              style: TextStyle(color: Colors.grey, fontSize: 18),
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  '☎️',
                  style: TextStyle(color: Colors.grey, fontSize: 22),
                ),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () {
                    final Uri emailLaunchUri = Uri(
                      scheme: 'sms',
                      path: '+41 79 442 53 33',
                      queryParameters: <String, String>{
                        'body': Uri.encodeComponent(
                            'Hi, I have seen your portfolio and I would like to discuss a project with you.'),
                      },
                    );
                    launchUrl(emailLaunchUri);
                  },
                  child: const Text(
                    '+41 79 442 53 33',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 20,
                        fontStyle: FontStyle.italic),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  child: const Text(
                    '✉️',
                    style: TextStyle(color: Colors.grey, fontSize: 22),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Container(
                    child: GestureDetector(
                      onTap: () {
                        final Uri emailLaunchUri = Uri(
                          scheme: 'mailto',
                          path: 'fran.quiles00@gmail.com',
                          query: encodeQueryParameters(<String, String>{
                            'subject': '',
                          }),
                        );
                        launchUrl(emailLaunchUri);
                      },
                      child: const Text(
                        'fran.quiles00@gmail.com',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 20,
                            fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

String? encodeQueryParameters(Map<String, String> params) {
  return params.entries
      .map((MapEntry<String, String> e) =>
          '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
      .join('&');
}
