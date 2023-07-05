import 'package:bloc_example/screens/home/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterView extends StatefulWidget {
  const CounterView({super.key});

  @override
  State<CounterView> createState() => _CounterViewState();
}

class _CounterViewState extends State<CounterView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              decrementBtn(context),
              counterValueTxt(),
              incrementBtn(context),
            ],
          ),
          const SizedBox(height: 20),
          resetBtn(context),
        ],
      ),
    );
  }

  PreferredSizeWidget appBar() {
    return AppBar(
      centerTitle: true,
      title: const Text(
        "Counter App",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget decrementBtn(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        context.read<CounterBloc>().add(CounterMinusButtonClickedEvent());
      },
      backgroundColor: Colors.deepPurpleAccent,
      child: const Icon(Icons.remove, color: Colors.white),
    );
  }

  Widget counterValueTxt() {
    return BlocConsumer<CounterBloc, CounterState>(
      listener: (context, state) {
        if (state.counter == 0) {
        } else if (state.counter <= 0) {
        } else if (state.counter.isOdd) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Value is Odd"),
              duration: Duration(microseconds: 100),
            ),
          );
        } else if (state.counter.isEven) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Value is Even"),
              duration: Duration(microseconds: 100),
            ),
          );
        }
      },
      builder: (context, state) {
        return BlocBuilder<CounterBloc, CounterState>(
          builder: (context, state) {
            return Text(
              state.counter.toString(),
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            );
          },
        );
      },
    );
  }

  Widget incrementBtn(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        context.read<CounterBloc>().add(CounterPlusButtonClickedEvent());
      },
      backgroundColor: Colors.deepPurpleAccent,
      child: const Icon(Icons.add, color: Colors.white),
    );
  }

  Widget resetBtn(BuildContext context) {
    return SizedBox(
      height: 47,
      width: 200,
      child: TextButton(
        style: const ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(Colors.deepPurpleAccent)),
        onPressed: () {
          context.read<CounterBloc>().add(CounterResetButtonClickedEvent());
        },
        child: const Text(
          "Reset",
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
