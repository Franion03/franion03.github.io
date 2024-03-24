import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../view/projects/components/title_text.dart';

class SkillsLogoDesk extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     return Container(
      width: 600,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TitleText(prefix: 'What ', title: 'I do'),
          SizedBox(height: 30,),
          Text("CRAZY FULL STACK DEVELOPER WHO WANTS TO EXPLORE EVERY TECH STACK", 
          style: TextStyle(fontSize: 22,),
          textAlign: TextAlign.center,
          ),
          SizedBox(height: 20,),
         Row(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Container(
               width: 80, height: 80,
               child: Icon(FontAwesomeIcons.html5, size: 60, color: Colors.grey,)),
             SizedBox(width: 5,),
             Container( width: 80, height: 80,
               child: Icon(FontAwesomeIcons.css3, size: 60,color: Colors.grey,)),
             SizedBox(width: 5,),
             Container( width: 80, height: 80,
               child: Icon(FontAwesomeIcons.android, size: 60,color: Colors.grey,)),
             SizedBox(width: 5,),
             Container( width: 80, height: 80,
               child: Icon(FontAwesomeIcons.python, size: 60,color: Colors.grey,)),
             SizedBox(width: 5,),
             Container( width: 80, height: 80,
               child: Icon(FontAwesomeIcons.node, size: 60,color: Colors.grey,)),
           ],
         ),
         Row(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
               Container( width: 80, height: 80,
                 child: Icon(FontAwesomeIcons.fire, size: 60,color: Colors.grey,)),
             SizedBox(width: 5,),
             Container( width: 80, height: 80,
               child: Icon(FontAwesomeIcons.react, size: 60,color: Colors.grey,)),
             SizedBox(width: 5,),
             Container( width: 80, height: 80,
               child: Icon(FontAwesomeIcons.jsSquare, size: 60,color: Colors.grey,)),
             SizedBox(width: 5,),
             Container( width: 80, height: 80,
               child: Icon(FontAwesomeIcons.database, size: 60,color: Colors.grey,)),
               SizedBox(width: 5,),
             Container( width: 80, height: 80,
             child: Icon(FontAwesomeIcons.filePdf, size: 60,color: Colors.grey,)),
           ],
         ),
         SizedBox(height: 20,),
         Text("⚡ Experienced in crafting innovative solutions with TensorFlow, PyTorch, and beyond, I am a dedicated software developer fueled by a profound love for machine learning, deep learning, and AI development. My journey in the realm of technology has been shaped by an unwavering commitment to continuous learning and pushing the boundaries of what's possible.", style: TextStyle(fontSize: 18),textAlign: TextAlign.justify,),
         Text("⚡ One defining moment in my life serves as a testament to my resilience and determination. I vividly remember a time when I stumbled and fell, leaving me with a scar etched on my face. Rather than allowing this setback to deter me, it ignited a fire within me to persevere against all odds. Just as I refused to let that fall define me, I approach every challenge in my career with the same grit and tenacity, turning obstacles into opportunities for growth and innovation.", style: TextStyle(fontSize: 18),textAlign: TextAlign.justify,),
         Text("⚡ My proficiency in building robust TensorFlow pipelines and harnessing the power of PyTorch underscores my ability to translate concepts into tangible, impactful solutions. Whether it's developing cutting-edge algorithms or optimizing existing models, I thrive in environments that demand creativity, collaboration, and a relentless pursuit of excellence.", style: TextStyle(fontSize: 18),textAlign: TextAlign.justify,),
         Text("⚡ Let's connect and embark on a journey to revolutionize the world of technology together. Reach out, and let's explore how we can leverage the latest advancements in machine learning and AI to shape a brighter future.", style: TextStyle(fontSize: 18),),
        ],
      ),
    );
  }
}

class SkillsLogoTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
          child: Container(
        width: 600,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
          TitleText(prefix: 'What ', title: 'I do'),
            SizedBox(height: 30,),
            Text("CRAZY FULL STACK DEVELOPER WHO WANTS TO EXPLORE EVERY TECH STACK", 
            style: TextStyle(fontSize: 18,),
            textAlign: TextAlign.center,
            ),
            SizedBox(height: 20,),
           Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Container( width: 80, height: 80,
               child: Icon(FontAwesomeIcons.html5, size: 60, color: Colors.grey,)),
               SizedBox(width: 5,),
               Container( width: 80, height: 80,
                 child: Icon(FontAwesomeIcons.css3, size: 60,color: Colors.grey,)),
               SizedBox(width: 5,),
               Container( width: 80, height: 80,
               child: Icon(FontAwesomeIcons.android, size: 60,color: Colors.grey,)),
               SizedBox(width: 5,),
               Container( width: 80, height: 80,
               child: Icon(FontAwesomeIcons.python, size: 60,color: Colors.grey,)),
               SizedBox(width: 5,),
               Container( width: 80, height: 80,
               child: Icon(FontAwesomeIcons.node, size: 60,color: Colors.grey,)),
             ],
           ),
           Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
              Container( width: 80, height: 80,
              child: Icon(FontAwesomeIcons.fire, size: 60,color: Colors.grey,)),
               SizedBox(width: 5,),
               Container( width: 80, height: 80,
               child: Icon(FontAwesomeIcons.react, size: 60,color: Colors.grey,)),
               SizedBox(width: 5,),
               Container( width: 80, height: 80,
               child: Icon(FontAwesomeIcons.jsSquare, size: 60,color: Colors.grey,)),
               SizedBox(width: 5,),
               Container( width: 80, height: 80,
               child: Icon(FontAwesomeIcons.database, size: 60,color: Colors.grey,)),
               SizedBox(width: 5,),
               Container( width: 80, height: 80,
               child: Icon(FontAwesomeIcons.filePdf, size: 60,color: Colors.grey,)),
             ],
           ),
           SizedBox(height: 20,),
          Text("⚡ Experienced in crafting innovative solutions with TensorFlow, PyTorch, and beyond, I am a dedicated software developer fueled by a profound love for machine learning, deep learning, and AI development. My journey in the realm of technology has been shaped by an unwavering commitment to continuous learning and pushing the boundaries of what's possible.", style: TextStyle(fontSize: 20),textAlign: TextAlign.justify,),
          Text("⚡ One defining moment in my life serves as a testament to my resilience and determination. I vividly remember a time when I stumbled and fell, leaving me with a scar etched on my face. Rather than allowing this setback to deter me, it ignited a fire within me to persevere against all odds. Just as I refused to let that fall define me, I approach every challenge in my career with the same grit and tenacity, turning obstacles into opportunities for growth and innovation.", style: TextStyle(fontSize: 20),textAlign: TextAlign.justify,),
          Text("⚡ My proficiency in building robust TensorFlow pipelines and harnessing the power of PyTorch underscores my ability to translate concepts into tangible, impactful solutions. Whether it's developing cutting-edge algorithms or optimizing existing models, I thrive in environments that demand creativity, collaboration, and a relentless pursuit of excellence.", style: TextStyle(fontSize: 20),textAlign: TextAlign.justify,),
          Text("⚡ Let's connect and embark on a journey to revolutionize the world of technology together. Reach out, and let's explore how we can leverage the latest advancements in machine learning and AI to shape a brighter future.", style: TextStyle(fontSize: 20),),
          ],
        ),
      ),
    );
  }
}

class SkillsLogoMob extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
          child: Container(
        width: 600,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TitleText(prefix: 'What ', title: 'I do'),
            SizedBox(height: 30,),
            Text("CRAZY FULL STACK DEVELOPER WHO WANTS TO EXPLORE EVERY TECH STACK", 
            style: TextStyle(fontSize: 16,),
            textAlign: TextAlign.center,
            ),
            SizedBox(height: 20,),
           Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Container( width: 80, height: 80,
               child: Icon(FontAwesomeIcons.html5, size: 60, color: Colors.grey,)),
               SizedBox(width: 5,),
               Container( width: 80, height: 80,
               child: Icon(FontAwesomeIcons.css3, size: 60,color: Colors.grey,)),
               SizedBox(width: 5,),
               Container( width: 80, height: 80,
                 child: Icon(FontAwesomeIcons.android, size: 60,color: Colors.grey,)),
               SizedBox(width: 5,),
               Container( width: 80, height: 80,
               child: Icon(FontAwesomeIcons.python, size: 60,color: Colors.grey,)),
               SizedBox(width: 5,),
             ],
           ),
           Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
                 Container( width: 80, height: 80,
                 child: Icon(FontAwesomeIcons.fire, size: 60,color: Colors.grey,)),
               SizedBox(width: 5,),
               Container( width: 80, height: 80,
               child: Icon(FontAwesomeIcons.react, size: 60,color: Colors.grey,)),
               SizedBox(width: 5,),
               Container( width: 80, height: 80,
               child: Icon(FontAwesomeIcons.jsSquare, size: 60,color: Colors.grey,)),
               SizedBox(width: 5,),
               Container( width: 80, height: 80,
               child: Icon(FontAwesomeIcons.database, size: 60,color: Colors.grey,)),
             ],
           ),
           Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Container( width: 80, height: 80,
               child: Icon(FontAwesomeIcons.node, size: 60,color: Colors.grey,)),
               SizedBox(width: 5,),
               Container( width: 80, height: 80,
               child: Icon(FontAwesomeIcons.filePdf, size: 60,color: Colors.grey,)),
             ],
           ),
           SizedBox(height: 20,),
           Text("⚡ Experienced in crafting innovative solutions with TensorFlow, PyTorch, and beyond, I am a dedicated software developer fueled by a profound love for machine learning, deep learning, and AI development. My journey in the realm of technology has been shaped by an unwavering commitment to continuous learning and pushing the boundaries of what's possible.", style: TextStyle(fontSize: 16),textAlign: TextAlign.justify,),
            SizedBox(height: 10,),
            Text("⚡ One defining moment in my life serves as a testament to my resilience and determination. I vividly remember a time when I stumbled and fell, leaving me with a scar etched on my face. Rather than allowing this setback to deter me, it ignited a fire within me to persevere against all odds. Just as I refused to let that fall define me, I approach every challenge in my career with the same grit and tenacity, turning obstacles into opportunities for growth and innovation.", style: TextStyle(fontSize: 16),textAlign: TextAlign.justify,),
            SizedBox(height: 10,),
            Text("⚡ My proficiency in building robust TensorFlow pipelines and harnessing the power of PyTorch underscores my ability to translate concepts into tangible, impactful solutions. Whether it's developing cutting-edge algorithms or optimizing existing models, I thrive in environments that demand creativity, collaboration, and a relentless pursuit of excellence.", style: TextStyle(fontSize: 16),textAlign: TextAlign.justify,),
            SizedBox(height: 10,),
            Text("⚡ Let's connect and embark on a journey to revolutionize the world of technology together. Reach out, and let's explore how we can leverage the latest advancements in machine learning and AI to shape a brighter future.", style: TextStyle(fontSize: 16),),
          ],
        ),
      ),
    );
  }
}