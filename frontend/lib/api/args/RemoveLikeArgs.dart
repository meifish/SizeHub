
part 'RemoveLikeArgs.g.dart';

@JsonSerializable()
class RemoveLikeArgs{

  final String postId;
  final String token;

  RemoveLikeArgs(this.postId, this.token);
}