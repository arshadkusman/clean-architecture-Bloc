import 'package:clean_arch_bloc/logic/counter/counter_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CounterBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            BlocConsumer<CounterBloc, CounterState>(
              listener: (context, state) {
                if (state is CounterStatus) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.message),
                      duration: const Duration(seconds: 1),
                    ),
                  );
                }
              },
              builder: (context, state) {
                if (state is CounterValue) {
                  return Text(
                    '${state.value}',
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                }
                return const Text('Loading...');
              },
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () {
                      BlocProvider.of<CounterBloc>(context)
                          .add(IncrementEvent());
                    },
                    child: const Text("Increment")),
                TextButton(
                    onPressed: () {
                      BlocProvider.of<CounterBloc>(context)
                          .add(DecrementEvent());
                    },
                    child: const Text("Decrement")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
