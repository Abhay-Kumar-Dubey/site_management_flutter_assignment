import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import '../models/site_model.dart';
import '../repositories/site_repository.dart';
import 'site_state.dart';

class SiteNotifier extends StateNotifier<SiteState> {
  final SiteRepository _repository;

  SiteNotifier(this._repository) : super(const SiteState()) {
    fetchSites();
  }

  Future<void> fetchSites() async {
    state = SiteState.loading();

    try {
      final sites = await _repository.fetchSites();
      state = SiteState.success(sites);
    } catch (e) {
      state = SiteState.error(e.toString());
    }
  }

  Future<void> toggleSiteStatus(String siteId) async {
    final siteIndex = state.sites.indexWhere((site) => site.id == siteId);

    if (siteIndex == -1) return;

    final site = state.sites[siteIndex];
    final newStatus = site.status == 'Active' ? 'Maintenance' : 'Active';

    try {
      final updatedSites = List<Site>.from(state.sites);
      updatedSites[siteIndex] = site.copyWith(status: newStatus);
      state = state.copyWith(sites: updatedSites);

      await _repository.updateSiteStatus(site, newStatus);
    } catch (e) {
      final revertedSites = List<Site>.from(state.sites);
      revertedSites[siteIndex] = site;
      state = state.copyWith(sites: revertedSites);
    }
  }

  Future<void> refresh() async {
    await fetchSites();
  }
}
