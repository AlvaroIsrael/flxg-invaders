package {
  import org.flixel.FlxG;
  import org.flixel.FlxSprite;

  public class Inimigo extends FlxSprite {

    [Embed(source="../resources/img/Inimigo.png")]
    private var InimigoImagem:Class;
    /*Esse array sempre deve conter o mesmo numero de items que seus sprites de animacao tiverem.
    * Lembrando que o array aqui se inicia de 0. */
    private var imagemMapaInimigo:Array = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17];

    public function Inimigo(X:Number = 0, Y:Number = 0) {
      super(X, Y);

      const kVelocidadeDaAnimacao:int = 15;
      loadGraphic(InimigoImagem, true, false, 64, 64);
      addAnimation("explode", imagemMapaInimigo, kVelocidadeDaAnimacao, false);
      addAnimationCallback(onAnimate);
      velocity.y = Math.random() * 100 + 40;
    }

    private function onAnimate(name:String, frame:uint):void {

      //All flixel sprites tem o metodo kill para se livrar dele.
      if (frame == imagemMapaInimigo.length) {
        kill();
      }
    }

    override public function update():void {

      const kForaDaTela:int = -20;

      if (this.y > FlxG.height) {
        this.y = kForaDaTela;
      }
      super.update();
    }
  }
}
