import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import '../models/site_model.dart';
import '../repositories/site_repository.dart';
import '../viewmodels/site_notifier.dart';
import '../viewmodels/site_state.dart';

final siteRepositoryProvider = Provider<SiteRepository>((ref) {
  return SiteRepository();
});

final siteNotifierProvider = StateNotifierProvider<SiteNotifier, SiteState>((
  ref,
) {
  final repository = ref.watch(siteRepositoryProvider);
  return SiteNotifier(repository);
});

final searchQueryProvider = StateProvider<String>((ref) => '');

final filteredSitesProvider = Provider<List<Site>>((ref) {
  final siteState = ref.watch(siteNotifierProvider);
  final searchQuery = ref.watch(searchQueryProvider).toLowerCase();

  if (searchQuery.isEmpty) {
    return siteState.sites;
  }

  return siteState.sites.where((site) {
    return site.name.toLowerCase().contains(searchQuery) ||
        site.location.toLowerCase().contains(searchQuery) ||
        site.manager.toLowerCase().contains(searchQuery);
  }).toList();
});

final isLoadingProvider = Provider<bool>((ref) {
  final siteState = ref.watch(siteNotifierProvider);
  return siteState.isLoading;
});
