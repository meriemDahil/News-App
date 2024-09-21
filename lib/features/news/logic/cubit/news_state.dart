part of 'news_cubit.dart';

@freezed
class NewsState with _$NewsState {
   const factory NewsState.initial() = _Initial;
   const factory NewsState.loading()= Loading;
   const factory NewsState.success(List<Article>articles)= Success;
   const factory NewsState.error(error)= Error;
}
