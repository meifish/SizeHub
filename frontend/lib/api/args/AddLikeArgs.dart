
part 'AddLikeArgs.g.dart';

@JsonSerializable()
class AddLikeArgs{
  
  final String postId;
  final String token;

  AddLikeArgs(this.postId, this.token);
}