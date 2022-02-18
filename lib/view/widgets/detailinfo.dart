import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:omdb/constant/color_pallete.dart';
import 'package:omdb/model/mod_favorit.dart';
import 'package:omdb/provider/favorit_prov.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
//import flutter_styled_toast
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

class DetailInfoPage extends StatefulWidget {
  final String? title;
  final String? content;
  final String? imageUrl;
  final DateTime date;
  final String url;

  DetailInfoPage(
      {Key? key,
      required this.title,
      required this.content,
      required this.imageUrl,
      required this.date,
      required this.url})
      : super(key: key);
  @override
  _DetailInfoPageState createState() => _DetailInfoPageState();
}

class _DetailInfoPageState extends State<DetailInfoPage> {
  late String _imageUrl;
  late String _title;
  late String _content;

  late String titleMore;
  late DateTime _date;
  late ScrollController _scrollController;

  bool lastStatus = true;

  _scrollListener() {
    if (isShrink != lastStatus) {
      setState(() {
        lastStatus = isShrink;
      });
    }
  }

  bool get isShrink {
    return _scrollController.hasClients &&
        _scrollController.offset > (250 - kToolbarHeight);
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    if (widget.title!.length > 24) {
      titleMore = widget.title!.substring(0, 24);
    } else {
      titleMore = widget.title!;
    }
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //get ListFavorit from Provider

    String removeAllHtmlTags(String htmlText) {
      RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
      return htmlText.replaceAll(exp, '');
    }

    _imageUrl = widget.imageUrl!;
    _title = widget.title!;
    _content = widget.content!;
    _date = widget.date;

    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton:
          //add to favorite,
          FloatingActionButton(
        backgroundColor: ColorPalette.themeColor,
        onPressed: () {
          Favorit favorit = Favorit(
            title: _title,
            description: _content,
            image: _imageUrl,
          );
          // add to provider list
          Provider.of<FooModel>(context, listen: false).addFavorit(favorit);
          //show toast
          Fluttertoast.showToast(msg: "Favorite added to list");
        },
        child: const Icon(Icons.favorite_border),
      ),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: <Widget>[
          SliverAppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(
              color: isShrink ? Colors.black : Colors.white,
            ),
            pinned: true,
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                children: [
                  GestureDetector(
                    onTap: () {
                      _launchBrowser(widget.url);
                    },
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      child: ClipRRect(
                        child: CachedNetworkImage(
                          imageUrl: _imageUrl, //baseUrl +
                          fit: BoxFit.cover,
                          placeholder: (context, url) => const Center(
                              child: const CircularProgressIndicator()),
                          errorWidget: (context, url, error) => Center(
                              child: Image.asset(
                            "assets/carousell_galeri.png",
                            height: double.infinity,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          )),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              title: AnimatedOpacity(
                opacity: isShrink ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 150),
                child: Text(
                  titleMore + "...",
                  maxLines: 1,
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate(<Widget>[
            Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(
                        bottom: 5.0, left: 16, right: 16, top: 16),
                    child: AnimatedOpacity(
                      opacity: isShrink ? 0.0 : 1.0,
                      duration: const Duration(milliseconds: 250),
                      child: Text(_title,
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Proppins")),
                    ),
                  ),
                  Container(
                      margin: const EdgeInsets.only(
                          bottom: 10, left: 16, right: 16),
                      child: _date != null
                          ? Text(
                              DateFormat('dd MMM yyyy kk:mm')
                                  .format(_date.add(const Duration(hours: 7))),
                              style: const TextStyle(
                                  color: Colors.grey, fontSize: 14),
                            )
                          : Container()),
                  const Padding(
                    padding: EdgeInsets.only(left: 16, right: 16),
                    child: Divider(
                      height: 4,
                      thickness: 1,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                        top: 5, right: 8, left: 8, bottom: 10),
                    child: Html(
                      data: _content,
                    ),
                  ),
                ],
              ),
            )
          ]))
        ],
      ),
    );
  }

  _launchBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch url';
    }
  }
}
