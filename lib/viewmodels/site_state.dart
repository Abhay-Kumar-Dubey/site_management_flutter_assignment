import '../models/site_model.dart';

class SiteState {
  final List<Site> sites;
  final bool isLoading;
  final String? error;

  const SiteState({this.sites = const [], this.isLoading = false, this.error});

  SiteState copyWith({List<Site>? sites, bool? isLoading, String? error}) {
    return SiteState(
      sites: sites ?? this.sites,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }

  factory SiteState.loading() {
    return const SiteState(isLoading: true);
  }

  factory SiteState.success(List<Site> sites) {
    return SiteState(sites: sites, isLoading: false);
  }

  factory SiteState.error(String message) {
    return SiteState(error: message, isLoading: false);
  }
}
