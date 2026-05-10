import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../view/intro/components/download_button.dart';
import '../../view/projects/components/title_text.dart';

class WelcomePageDesk extends StatelessWidget {
  const WelcomePageDesk({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 600,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const TitleText(prefix: 'Hi! I am Francisco Quiles', title: ''),
          const SizedBox(
            height: 30,
          ),
          const Text(
            "I am a full-Stack Developer for Swisscom, and I am really enthusiastic of machine learning",
            style: TextStyle(
              fontSize: 21,
              height: 1.7,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //   Expanded(
              //                     child: Container( width: 60,height: 60,
              //       child: IconButton(
              //         icon: FaIcon(FontAwesomeIcons.facebook, color: Colors.blue, size: 40,),
              //          onPressed:  ()
              //           {
              //          launchUrl(Uri.parse("https://www.facebook.com/naveenjujaray"));
              //          },
              //          )),
              //   ),
              //   Expanded(
              //                     child: Container( width: 60,height: 60,
              //       child:  GestureDetector(
              //         child: FaIcon(FontAwesomeIcons.twitter, color: Colors.lightBlue, size: 40,),
              //         onTap: () {
              //          launchUrl(Uri.parse("https://twitter.com/naveenjujaray"));
              //          },
              //         ),
              //          ),
              //   ),
              SizedBox(
                  width: 60,
                  height: 60,
                  child: IconButton(
                    icon: const FaIcon(
                      FontAwesomeIcons.linkedin,
                      color: Color.fromRGBO(40, 103, 178, 1),
                      size: 40,
                    ),
                    onPressed: () {
                      launchUrl(Uri.parse(
                          "https://www.linkedin.com/in/francisco-javier-quiles-ruiz-b25563195/"));
                    },
                  )),
              //   Expanded(
              //                     child: Container( width: 60,height: 60,
              //       child: IconButton(
              //         icon: FaIcon(FontAwesomeIcons.bloggerB, color: Colors.red, size: 40,),
              //          onPressed: ()
              //          {
              //          launchUrl(Uri.parse("https://naveenjujaray.js.org"));
              //          },
              //          )),
              //   ),
              //   Expanded(
              //                     child: Container( width: 60,height: 60,
              //       child: IconButton(
              //         icon: FaIcon(FontAwesomeIcons.github, size: 40,),
              //         onPressed: ()
              //         {
              //          launchUrl(Uri.parse("https://www.github.com/naveenjujaray"));
              //          },
              //         )),
              //   ),
              //   Expanded(
              //                     child: Container( width: 60,height: 60,
              //       child: IconButton(
              //         icon: FaIcon(FontAwesomeIcons.gitlab, color: Colors.orange, size: 40,),
              //         onPressed: ()
              //         {
              //          launchUrl(Uri.parse("https://www.gitlab.com/naveenjujaray"));
              //          },
              //         )),
              //   ),
              //   Expanded(
              //                     child: Container( width: 60,height: 60,
              //       child: IconButton(
              //         icon: FaIcon(FontAwesomeIcons.medium, size: 40,),
              //         onPressed: ()
              //         {
              //          launchUrl(Uri.parse("https://medium.com/@naveenjujaray"));
              //          },
              //          )),
              //   ),
              //   Expanded(
              //                     child: Container( width: 60,height: 60,
              //       child: IconButton(
              //         icon: FaIcon(FontAwesomeIcons.dev,size: 40,),
              //         onPressed: ()
              //         {
              //          launchUrl(Uri.parse("https://dev.to/naveenjujaray"));
              //          },
              //          )),
              //   ),
              //   Expanded(
              //                     child: Container( width: 60,height: 60,
              //       child: IconButton(
              //         icon: FaIcon(FontAwesomeIcons.reddit, color: Colors.deepOrangeAccent,size: 40,),
              //         onPressed: ()
              //         {
              //          launchUrl(Uri.parse("https://www.reddit.com/user/jujaraynaveen"));
              //          },
              //          )),
              //   ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DownloadButton(),
            ],
          ),
        ],
      ),
    );
  }
}

class WelcomePageTab extends StatelessWidget {
  const WelcomePageTab({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: 600,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const SizedBox(
              height: 40,
            ),
            const TitleText(prefix: 'Hi! I am Francisco Quiles', title: ''),
            const SizedBox(
              height: 30,
            ),
            const Center(
              child: Text(
                "I am a full-Stack Developer for Swisscom, and I am really enthusiastic of machine learning",
                style: TextStyle(
                  fontSize: 20,
                  height: 1.7,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //   Expanded(
                //                     child: Container( width: 60,height: 60,
                //       child: IconButton(
                //         icon: FaIcon(FontAwesomeIcons.facebook, color: Colors.blue, size: 40,),
                //          onPressed:  ()
                //           {
                //          launchUrl(Uri.parse("https://www.facebook.com/naveenjujaray"));
                //          },
                //          )),
                //   ),
                //   Expanded(
                //                     child: Container( width: 60,height: 60,
                //       child:  GestureDetector(
                //         child: FaIcon(FontAwesomeIcons.twitter, color: Colors.lightBlue, size: 40,),
                //         onTap: () {
                //          launchUrl(Uri.parse("https://twitter.com/naveenjujaray"));
                //          },
                //         ),
                //          ),
                //   ),
                SizedBox(
                    width: 60,
                    height: 60,
                    child: IconButton(
                      icon: const FaIcon(
                        FontAwesomeIcons.linkedin,
                        color: Color.fromRGBO(40, 103, 178, 1),
                        size: 40,
                      ),
                      onPressed: () {
                        launchUrl(Uri.parse(
                            "https://www.linkedin.com/in/francisco-javier-quiles-ruiz-b25563195/"));
                      },
                    )),
                //   Expanded(
                //                     child: Container( width: 60,height: 60,
                //       child: IconButton(
                //         icon: FaIcon(FontAwesomeIcons.bloggerB, color: Colors.red, size: 40,),
                //          onPressed: ()
                //          {
                //          launchUrl(Uri.parse("https://naveenjujaray.js.org"));
                //          },
                //          )),
                //   ),
                //   Expanded(
                //                     child: Container( width: 60,height: 60,
                //       child: IconButton(
                //         icon: FaIcon(FontAwesomeIcons.github, size: 40,),
                //         onPressed: ()
                //         {
                //          launchUrl(Uri.parse("https://www.github.com/naveenjujaray"));
                //          },
                //         )),
                //   ),
                //   Expanded(
                //                     child: Container( width: 60,height: 60,
                //       child: IconButton(
                //         icon: FaIcon(FontAwesomeIcons.gitlab, color: Colors.orange, size: 40,),
                //         onPressed: ()
                //         {
                //          launchUrl(Uri.parse("https://www.gitlab.com/naveenjujaray"));
                //          },
                //         )),
                //   ),
                //   Expanded(
                //                     child: Container( width: 60,height: 60,
                //       child: IconButton(
                //         icon: FaIcon(FontAwesomeIcons.medium, size: 40,),
                //         onPressed: ()
                //         {
                //          launchUrl(Uri.parse("https://medium.com/@naveenjujaray"));
                //          },
                //          )),
                //   ),
                //   Expanded(
                //                     child: Container( width: 60,height: 60,
                //       child: IconButton(
                //         icon: FaIcon(FontAwesomeIcons.dev,size: 40,),
                //         onPressed: ()
                //         {
                //          launchUrl(Uri.parse("https://dev.to/naveenjujaray"));
                //          },
                //          )),
                //   ),
                //   Expanded(
                //                     child: Container( width: 60,height: 60,
                //       child: IconButton(
                //         icon: FaIcon(FontAwesomeIcons.reddit, color: Colors.deepOrangeAccent,size: 40,),
                //         onPressed: ()
                //         {
                //          launchUrl(Uri.parse("https://www.reddit.com/user/jujaraynaveen"));
                //          },
                //          )),
                //   ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DownloadButton(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class WelcomePageMob extends StatelessWidget {
  const WelcomePageMob({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        width: 600,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 40,
            ),
            const TitleText(prefix: 'Hi! I am Francisco Quiles', title: ''),
            const SizedBox(
              height: 30,
            ),
            const Center(
              child: Text(
                "I am a full-Stack Developer for Swisscom, and I am really enthusiastic of machine learning",
                style: TextStyle(
                  fontSize: 16,
                  height: 1.7,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Container( width: 55,height: 55,
                //   child: IconButton(
                //     icon: FaIcon(FontAwesomeIcons.facebook, color: Colors.blue, size: 40,),
                //     onPressed: ()
                //         {
                //        js.context.callMethod("open", ["https://www.facebook.com/naveenjujaray"]);
                //        },
                //        )),
                // Container( width: 55,height: 55,
                //   child: IconButton(
                //     icon: FaIcon(FontAwesomeIcons.twitter, color: Colors.lightBlue, size: 40,),
                //     onPressed: ()
                //        {
                //        js.context.callMethod("open", ["https://twitter.com/naveenjujaray"]);
                //        },
                //        )),
                SizedBox(
                    width: 55,
                    height: 55,
                    child: IconButton(
                      icon: const FaIcon(
                        FontAwesomeIcons.linkedin,
                        color: Color.fromRGBO(40, 103, 178, 1),
                        size: 40,
                      ),
                      onPressed: () {
                        launchUrl(Uri.parse(
                            "https://www.linkedin.com/in/francisco-javier-quiles-ruiz-b25563195/"));
                      },
                    )),
                // Container( width: 55,height: 55,
                //   child: IconButton(
                //     icon: FaIcon(FontAwesomeIcons.bloggerB, color: Colors.red, size: 40,),
                //     onPressed: ()
                //        {
                //        js.context.callMethod("open", ["https://naveenjujaray.js.org"]);
                //        },
                //        )),
                // Container( width: 55,height: 55,
                //   child: IconButton(
                //     icon: FaIcon(FontAwesomeIcons.github,  size: 40,), onPressed: ()
                //       {
                //        js.context.callMethod("open", ["https://www.github.com/naveenjujaray"]);
                //        },
                //        )),
              ],
            ),
            // Row(mainAxisAlignment: MainAxisAlignment.center,
            // children: [
            //    Container( width: 55,height: 55,
            //       child: IconButton(
            //         icon: FaIcon(FontAwesomeIcons.gitlab, color: Colors.orange, size: 40,),
            //         onPressed: ()
            //           {
            //            js.context.callMethod("open", ["https://www.gitlab.com/naveenjujaray"]);
            //            },
            //            )),
            //     Container( width: 55,height: 55,
            //       child: IconButton(
            //         icon: FaIcon(FontAwesomeIcons.medium,  size: 40,),
            //         onPressed: ()
            //           {
            //            js.context.callMethod("open", ["https://medium.com/@naveenjujaray"]);
            //            },
            //            )),
            //     Container( width: 55,height: 55,
            //       child: IconButton(
            //         icon: FaIcon(FontAwesomeIcons.dev, size: 40,),
            //         onPressed: ()
            //           {
            //            js.context.callMethod("open", ["https://dev.to/naveenjujaray"]);
            //            },
            //            )),
            //     Container( width: 55,height: 55,
            //       child: IconButton(
            //         icon: FaIcon(FontAwesomeIcons.reddit, color: Colors.deepOrangeAccent,size: 40,),
            //        onPressed: ()
            //           {
            //            js.context.callMethod("open", ["https://www.reddit.com/user/jujaraynaveen"]);
            //            },)),
            // ],
            // ),
            const SizedBox(
              height: 20,
            ),
            const Center(
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                DownloadButton(),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
