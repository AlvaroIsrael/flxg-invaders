package {

  import org.flixel.FlxG;
  import org.flixel.FlxGroup;
  import org.flixel.FlxSprite;

  public class Nave extends FlxSprite {

    //Todos os flixel Sprites tem uma propriedade chamada valocidade! Frameworks sao sucesso!
    internal const kVelocidadeDaNave:Number = 250;
    internal const kVelocidadeDoTiro:Number = -400;
    internal var contadorTiros:int = 0;

    [Embed(source="../resources/img/Nave.png")]
    private var NaveImagem:Class;

    [Embed(source="../resources/audio/Weapons/Lasers/sfx_wpn_laser6.mp3")]
    private var TiroSom:Class;

    protected var _tiros:FlxGroup;

    // Getter para os tiros, GLOBAL JAMAIS, vamos evitar o quanto pudermos.

    public function carregarMunicao(tiros:FlxGroup):void {
      _tiros = tiros;
    }

    //Construtor da classe, chamado apenas uma vez quando iniciamos a classe.
    public function Nave() {
      //Centralizando a nave
      super(FlxG.width * 0.5, FlxG.height - 100, NaveImagem);
    }

    private function atirar():void {
      //Toca nosso barulhinho maroto!
      FlxG.play(TiroSom);
      var tiro:FlxSprite = _tiros.members[contadorTiros];

      //Jogamos o tiro para fora da tela no início, porém aqui ele precis se resetado para "aparecer" na tela e
      // poder ser "disparado".
      var meioDaNave:int = this.x + this.width / 2;

      tiro.reset(meioDaNave - tiro.width, this.y);
      tiro.velocity.y = kVelocidadeDoTiro;
      contadorTiros +=1;

      if (contadorTiros >= _tiros.length) {
        contadorTiros = 0;
      }
    }

    override public function update():void {

      //Mano a nave comeca parada ne?!
      velocity.x = 0;

      if (FlxG.keys.LEFT) {
        velocity.x -= kVelocidadeDaNave;
      }

      if (FlxG.keys.RIGHT) {
        velocity.x += kVelocidadeDaNave;
      }

      if (FlxG.keys.justPressed("SPACE")) {
        atirar();
      }

      super.update();
    }
  }
}
