import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dowerly/presentation/intro_location_screen/bloc/intro_location_bloc.dart';
import 'package:dowerly/presentation/intro_location_screen/widgets/map_widget.dart';

class MapContentBlocConsumer extends StatelessWidget {
  const MapContentBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<IntroLocationBloc, IntroLocationState>(
      listener: (context, state) {
        if (state is IntroLocationErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.red,
              duration: const Duration(seconds: 4),
            ),
          );
        }
      },
      builder: (context, state) {
        return _buildMapContent(context, state);
      },
    );
  }

  Widget _buildMapContent(BuildContext context, IntroLocationState state) {
    if (state is IntroLocationInitialState) {
      return const Center(child: CircularProgressIndicator());
    } else if (state is IntroLocationLoadingState) {
      return const Center(child: CircularProgressIndicator());
    } else if (state is IntroLocationSuccessState) {
      return MapWidget(location: state.location, isSearchResult: false);
    } else if (state is IntroLocationErrorState) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(state.message),
          ElevatedButton(
            onPressed: () => context.read<IntroLocationBloc>().add(
              const RetryLoadingEvent(),
            ),
            child: const Text('Retry'),
          ),
        ],
      );
    }
    return const Center(child: CircularProgressIndicator());
  }
}
