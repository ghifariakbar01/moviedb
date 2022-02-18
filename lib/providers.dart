import 'package:omdb/provider/favorit_prov.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  ...independentServices,
];

//change notifier providers

List<SingleChildWidget> independentServices = [
  Provider.value(value: Map<String, dynamic>()),
  ListenableProvider<FooModel>(create: (_) => FooModel()),
  //changenotifier
];
