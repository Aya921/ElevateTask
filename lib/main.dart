import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskelevate/get_dependency.dart';
import 'package:taskelevate/presentaion/cubit/products_cubit.dart';
import 'package:taskelevate/presentaion/pages/products.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init_dependency();

  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => BlocProvider(
        create: (context) => serverLocator<ProductsCubit>(),
        child: const MyApp(),
      ),
    ),
  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: Products(),
    );
  }
}
