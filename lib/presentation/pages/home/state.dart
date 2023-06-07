class HomeState {
  final String? error;
  HomeState({this.error});
  HomeState init() {
    return HomeState();
  }

  HomeState loaded() {
    return HomeState();
  }

  HomeState withError(String e) {
    return HomeState(error: e);
  }
}
