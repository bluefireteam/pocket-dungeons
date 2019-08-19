import '../engine/coords.dart';
import 'animated_actor.dart';

class Player extends AnimatedActor {

  Player(Coords coords) : super(coords);

  @override
  AnimatedActorConfig config() => AnimatedActorConfig('player.png', frames: 9, width: 16, height: 27);
}