abstract class NewsStates {}

class NewsInitialStates extends NewsStates {}

class NewsBottomNavStates extends NewsStates {}

class NewsBusinessLoadingStates extends NewsStates {}

class NewsBusinessSuccessStates extends NewsStates {}

class NewsBusinessErrorStates extends NewsStates {
  String error;
  NewsBusinessErrorStates({ required this.error});
}

class NewsSportsLoadingStates extends NewsStates {}

class NewsSportsSuccessStates extends NewsStates {}

class NewsSportsErrorStates extends NewsStates {
  String error;
  NewsSportsErrorStates({ required this.error});
}

class NewsScienceLoadingStates extends NewsStates {}

class NewsScienceSuccessStates extends NewsStates {}

class NewsScienceErrorStates extends NewsStates {
  String error;
  NewsScienceErrorStates({ required this.error});
}
class NewsChangeModeStates extends NewsStates {}
