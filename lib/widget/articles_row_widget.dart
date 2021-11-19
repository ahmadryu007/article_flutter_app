import 'package:articles_app/config/config.dart';
import 'package:flutter/material.dart';

class ArticlesRowWidget extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;
  final DateTime created;

  const ArticlesRowWidget(
      {Key? key,
      required this.imageUrl,
      required this.title,
      required this.subtitle,
      required this.created})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            imageUrl,
            height: MediaQuery.of(context).size.height * 0.2,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(subtitle, style: titlePrimary),
          const SizedBox(
            height: 20,
          ),
          Text(title, style: headlineText),
          const SizedBox(
            height: 20,
          ),
          Text(globalDateFormat.format(created), style: dateText,),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: double.infinity,
            height: 1,
            color: Colors.black26,
          ),
        ],
      ),
    );
  }
}
