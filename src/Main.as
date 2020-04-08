package {

  import org.flixel.FlxGame;

  //Metadata para o caso de ser modo desktop.
  [SWF(width='600', height='600', backgroundColor='#000000', frameRate=60)]

  //Como nos estamos usando o framework Flixel extendemos [FlxGame] ao invés de Sprite.
  //Isso nos da a habilidade de utilizarmos as funcoes dessa classe e consequentemente
  //desse framework 2D.
  public class Main extends FlxGame {

    //Programa comecar aqui, have fun!
    public function Main() {

      //Construtor da FlxGame, aqui definimos os largura, altura, classe inicial e zoom!
      super(600, 600, MenuState, 1, 60);
    }
  }
}
