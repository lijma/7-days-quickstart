import 'package:flutter/material.dart';
import 'package:flutter_hello_world/redux/counter_reducer.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'redux/counter_actions.dart';

void main() {
  final store = Store<int>(
    counterReducer,
    initialState: 0,
  );

  runApp(MyApp(store));
}

class MyApp extends StatelessWidget {
  final Store<int> store;

  MyApp(this.store);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<int>(
      store: store,
      child: MaterialApp(
        title: 'Flutter Redux Example',
        home: CounterPage(),
      ),
    );
  }
}

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Counter')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            StoreConnector<int, int>(
              converter: (Store<int> store) => store.state,
              builder: (BuildContext context, int counter) {
                return Text(
                  'Count: $counter',
                  style: TextStyle(fontSize: 24),
                );
              },
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                StoreConnector<int, VoidCallback>(
                  converter: (Store<int> store) {
                    return () => store.dispatch(IncrementAction());
                  },
                  builder: (BuildContext context, VoidCallback callback) {
                    return ElevatedButton(
                      onPressed: callback,
                      child: Text('Increment'),
                    );
                  },
                ),
                SizedBox(width: 16),
                StoreConnector<int, VoidCallback>(
                  converter: (Store<int> store) {
                    return () => store.dispatch(DecrementAction());
                  },
                  builder: (BuildContext context, VoidCallback callback) {
                    return ElevatedButton(
                      onPressed: callback,
                      child: Text('Decrement'),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
