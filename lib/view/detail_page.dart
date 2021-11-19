import 'package:articles_app/config/config.dart';
import 'package:articles_app/model/articles_response.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final ArticlesResponse article;

  const DetailPage({
    Key? key,
    required this.article,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => DetailPageState();
}

class DetailPageState extends State<DetailPage> {
  late Widget selectedImage;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();

    selectedImage = Image.network(
      widget.article.contentThumbnail,
      width: double.infinity,
      height: 200,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.7,
        backgroundColor: Colors.white,
        centerTitle: false,
        title: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: Image.asset(
            'assets/images/logo.png',
            alignment: Alignment.centerLeft,
            width: 100,
            height: 50,
            fit: BoxFit.contain,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              widget.article.id,
              style: titlePrimary,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            header(),
            slider(),
            body(),
          ],
        ),
      ),
    );
  }

  header() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.article.title,
            style: headlineText,
            textAlign: TextAlign.start,
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            widget.article.contributorName,
            style: titlePrimary.copyWith(fontSize: 15),
          ),
          Text(globalDateFormat.format(widget.article.createdAt),
              style: dateText)
        ],
      ),
    );
  }

  slider() {
    return Column(
      children: [
        selectedImage,
        const SizedBox(
          height: 5,
        ),
        widget.article.slideshow.isEmpty
            ? Container()
            : SizedBox(
                width: double.infinity,
                height: 200,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: widget.article.slideshow.length,
                    itemBuilder: (context, index) {
                      var imageUrl = widget.article.slideshow[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ColorFiltered(
                          colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(
                                  index == selectedIndex ? 0.0 : 0.5),
                              BlendMode.srcOver),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                                selectedImage = Image.network(
                                  imageUrl,
                                  width: double.infinity,
                                  height: 200,
                                );
                              });
                            },
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.network(
                                imageUrl,
                                width: 150,
                                height: 50,
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              )
      ],
    );
  }

  body() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Text(
        widget.article.content,
        style: bodyText,
        textAlign: TextAlign.start,
      ),
    );
  }
}
