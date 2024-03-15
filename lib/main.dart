import 'package:book_app/screens/home_screen.dart';
import 'package:book_app/view_model/book_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'data/local/storage_repository.dart';
import 'data/repositories/book_repo.dart';
void main(List<String> args) async {
    WidgetsFlutterBinding.ensureInitialized();
    await StorageRepository.init();
    runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => BookViewModel(productRepo: BookRepo()))
      ],
      child: const  MyApp(),
    ));
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      builder: (context, child) {
        ScreenUtil.init(context);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(useMaterial3: false),
          home: const  HomeScreen(),
        );
      },
      child: const HomeScreen(),
    );
  }
}