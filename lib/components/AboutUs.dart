import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About Us"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Image.asset(
              'assets/images/pink.png',
              width: 100,
              height: 100,
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Text(
                  "Pink Flamingo Clothing is a brand that believes in happy colours, quirky patterns and great fabrics.\n\nWe hand pick our fabric from so many different places and put in so much love and effort into every single piece.\n\nWe don't mass-produce. This means that you probably won't run into someone who is wearing the same thing as you and of course,  and everything you own is going to be unique and one of a kind.\n\nWe like trends but we believe that style and confidence is what matters the most. After all, trends come and go but style is what makes you, you.\n\nWe are so proud to say that all our products are made in Bangalore, India with a lot of love and close attention to detail. We love what we do!\n\nWe, at Pink Flamingo Clothing genuinely care about how our customers feel when they wear our clothes. What you wear everyday says a lot about who you are and we try to give you the best that we have to offer.\n\nLastly, we strongly believe that nice clothes or clothes that are of good quality don't have to be expensive which is why all our clothes are affordable!"),
            ),
          ],
        ),
      ),
    );
  }
}
