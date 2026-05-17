import '../models/site_model.dart';

/// Site State - Represents the state of the site list
class SiteState {
  final List<Site> sites;
  final bool isLoading;
  final String? error;

  const SiteState({this.sites = const [], this.isLoading = false, this.error});

  /// Create a copy of the state with updated fields
  SiteState copyWith({List<Site>? sites, bool? isLoading, String? error}) {
    return SiteState(
      sites: sites ?? this.sites,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }

  /// Initial loading state
  factory SiteState.loading() {
    return const SiteState(isLoading: true);
  }

  /// Success state with data
  factory SiteState.success(List<Site> sites) {
    return SiteState(sites: sites, isLoading: false);
  }

  /// Error state
  factory SiteState.error(String message) {
    return SiteState(error: message, isLoading: false);
  }
}
