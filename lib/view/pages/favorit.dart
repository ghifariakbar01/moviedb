import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:omdb/constant/color_pallete.dart';
import 'package:omdb/provider/favorit_prov.dart';
import 'package:provider/provider.dart';

class FavoritPage extends StatefulWidget {
  const FavoritPage({Key? key}) : super(key: key);

  @override
  _FavoritPageState createState() => _FavoritPageState();
}

class _FavoritPageState extends State<FavoritPage> {
  bool loading = true;
  @override
  Widget build(BuildContext context) {
    if (loading) {
      //get data from provider
      final favorit = Provider.of<FooModel>(context).getFavorit();
      var providerFavorit = Provider.of<FooModel>(context);
      //set data to provider
      return favorit != null
          ? Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                backgroundColor: ColorPalette.themeColor,
                title: Text('Favorit'),
              ),
              body: favorit != null
                  ? ListView.builder(
                      itemCount: favorit.length,
                      itemBuilder: (context, index) {
                        return favorit != null
                            ? ListTile(
                                onTap: () {
                                  //show dialog to delete list
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return AlertDialog(
                                          title: Text('Delete'),
                                          content: Text(
                                              'Are you sure to delete this item?'),
                                          actions: <Widget>[
                                            Builder(builder: (_context) {
                                              return InkWell(
                                                child: Container(
                                                    height: 50,
                                                    width: 50,
                                                    child: Text('Yes')),
                                                onTap: () {
                                                  setState(() {
                                                    providerFavorit
                                                        .removeFavorit(
                                                            favorit[index]);
                                                    Navigator.pop(context);
                                                  });
                                                },
                                              );
                                            }),
                                            InkWell(
                                              child: Container(
                                                  height: 50,
                                                  width: 50,
                                                  child: Text('No')),
                                              onTap: () {
                                                Navigator.pop(context);
                                              },
                                            )
                                          ],
                                        );
                                      });
                                },
                                title: Text(favorit[index].title),
                                subtitle: Text(favorit[index].description),
                                leading: CircleAvatar(
                                  backgroundImage:
                                      NetworkImage(favorit[index].image),
                                ),
                              )
                            : Container(
                                child: const Center(
                                  child: Text('No Data'),
                                ),
                              );
                      },
                    )
                  : const Center(
                      child: Text('No Data'),
                    ),
            )
          : Center(
              child: Text('No Data'),
            );
    }
    return const CircularProgressIndicator();
  }
}
