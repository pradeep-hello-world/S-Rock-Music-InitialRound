import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:s_rock_initial_round/view_model/music_services_view_model.dart';


class MusicListView extends StatelessWidget {
  const MusicListView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<MusicServicesViewModel>(context);

    return Stack(
      children: [
        Positioned.fill(
          child: Opacity(
            opacity: 0.2,
            child: Image.asset(
              'assets/images/listview_bg.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
        viewModel.isLoading
            ? const Center(child: CircularProgressIndicator())
            : ListView.separated(
          itemCount: viewModel.services.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final item = viewModel.services[index];
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.white10,
                border: Border.all(color: Colors.white24),
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                leading: Image.asset(
                  item.iconPath,
                  width: 50,
                  height: 40,
                  fit: BoxFit.cover,
                ),
                title: Text(
                  item.title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(item.description),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {},
              ),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(height: 25),
        ),
      ],
    );
  }
}
