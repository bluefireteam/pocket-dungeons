import '../engine/coords.dart';
import 'animated_actor.dart';

class Zombie extends AnimatedActor {

  Zombie(Coords pos) : super(pos);

  @override
  AnimatedActorConfig config() => AnimatedActorConfig('zombie.png', frames: 6, width: 11, height: 12);
}