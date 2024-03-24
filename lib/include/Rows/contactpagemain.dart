import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:js' as js;

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactPageDesk extends StatelessWidget {
  const ContactPageDesk({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 600,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Contact Me", 
          style: TextStyle(fontWeight: FontWeight.w800, height: 1.0, fontSize: 50),
          textAlign: TextAlign.center,
          ),
          SizedBox(height: 10,),
          Text('DISCUSS A PROJECT OR JUST WANT TO SAY HI? MY INBOX IS OPEN FOR ALL.',
          style: TextStyle(color: Colors.grey, fontSize: 22),),
          SizedBox(height: 10,),
          Row(
            children: [
              Text('☎️',
          style: TextStyle(color: Colors.grey, fontSize: 28),),
          SizedBox(width: 10,),
          GestureDetector(
            onTap: () {
                final Uri emailLaunchUri = Uri(
                  scheme: 'sms',
                  path: '+41 442 53 33',
                  queryParameters: <String, String>{
                    'body': Uri.encodeComponent('Hi, I have seen your portfolio and I would like to discuss a project with you.'),
                  },
                );
                launchUrl(emailLaunchUri);
              },
            child: Text('+41 442 53 33',
            style: TextStyle(color: Colors.grey, fontSize: 28, fontStyle: FontStyle.italic),),
          ),
            ],
          ),
          SizedBox(height: 10,),
         Row(
           children: [
              Text('✉️',
          style: TextStyle(color: Colors.grey, fontSize: 28),),
          SizedBox(width: 10,),
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
                child: Text('fran.quiles00@gmail.com',
                          style: TextStyle(color: Colors.grey, fontSize: 28, fontStyle: FontStyle.italic),),
              ),
           ],
         ),
         SizedBox(height: 20,),
        ],
      ),
    );
  }
}

class ContactPageTab extends StatelessWidget {
  const ContactPageTab({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
          child: Container(
        width: 600,
        child: Column(
 crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Contact Me", 
            style: TextStyle(fontWeight: FontWeight.w800, height: 1.0, fontSize: 50),
            
            ),
            SizedBox(height: 10,),
            Text('DISCUSS A PROJECT OR JUST WANT TO SAY HI? MY INBOX IS OPEN FOR ALL.',
            style: TextStyle(color: Colors.grey, fontSize: 22),
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                Text('☎️',
            style: TextStyle(color: Colors.grey, fontSize: 28),),
            SizedBox(width: 10,),
            GestureDetector(
              onTap: () {
                final Uri emailLaunchUri = Uri(
                  scheme: 'sms',
                  path: '+41 442 53 33',
                  queryParameters: <String, String>{
                    'body': Uri.encodeComponent('Hi, I have seen your portfolio and I would like to discuss a project with you.'),
                  },
                );
                launchUrl(emailLaunchUri);
              },
              child: Text('+41 442 53 33',
              style: TextStyle(color: Colors.grey, fontSize: 28, fontStyle: FontStyle.italic),
              ),
            ),
              ],
            ),
            SizedBox(height: 10,),
           Row(
             children: [
                Text('✉️',
            style: TextStyle(color: Colors.grey, fontSize: 28),),
            SizedBox(width: 10,),
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
              child: Text('fran.quiles00@gmail.com',
                  style: TextStyle(color: Colors.grey, fontSize: 28, fontStyle: FontStyle.italic),
                  ),
                ),
             ],
           ),
           SizedBox(height: 20,),
          ],
        ),
        
      ),
    );
  }
}

class ContactPageMob extends StatelessWidget {
  const ContactPageMob({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
          child: Container(
        width: 600,
        child: Column(
 crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Contact Me", 
            style: TextStyle(fontWeight: FontWeight.w800, height: 1.0, fontSize: 32),
            
            ),
            SizedBox(height: 10,),
            Text('DISCUSS A PROJECT OR JUST WANT TO SAY HI? MY INBOX IS OPEN FOR ALL.',
            style: TextStyle(color: Colors.grey, fontSize: 18),),
            SizedBox(height: 25,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('☎️',
            style: TextStyle(color: Colors.grey, fontSize: 22),
            ),
            SizedBox(width: 10,),
            GestureDetector(
              onTap: () {
                final Uri emailLaunchUri = Uri(
                  scheme: 'sms',
                  path: '+41 442 53 33',
                  queryParameters: <String, String>{
                    'body': Uri.encodeComponent('Hi, I have seen your portfolio and I would like to discuss a project with you.'),
                  },
                );
                launchUrl(emailLaunchUri);
              },
              child: Text('+41 442 53 33',
                style: TextStyle(color: Colors.grey, fontSize: 20, fontStyle: FontStyle.italic),
                ),
            ),
              ],
            ),
            SizedBox(height: 10,),
           Row(
             mainAxisAlignment: MainAxisAlignment.start,
             children: [
                Container(
                  child: Text('✉️',
            style: TextStyle(color: Colors.grey, fontSize: 22),
            ),
                ),
            SizedBox(width: 10,),
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
                    child: Text('fran.quiles00@gmail.com',
                                style: TextStyle(color: Colors.grey, fontSize: 20, fontStyle: FontStyle.italic),
                                ),
                  ),
                ),
                ),
             ],
           ),
           SizedBox(height: 20,),
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
