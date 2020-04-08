package {

  import org.flixel.FlxG;
  import org.flixel.FlxGroup;
  import org.flixel.FlxSprite;
  import org.flixel.FlxState;

  public class MainState extends FlxState {

    [Embed(source="../resources/img/Fundo.png")]
    private var Fundo:Class;

    [Embed(source="../resources/audio/Explosions/Short/sfx_exp_short_soft9.mp3")]
    private var ExplosaoSom:Class;

    //Esta sendo criado aqui porque precisaremos detectar colisao na funcao update.
    private var inimigos:FlxGroup;
    private var tiros:FlxGroup;

    public function MainState() {
      super();
    }

    override public function create():void {
      // Adicionamos o fundo do jogo ao jogo diferentemente do menu.
      var fundo:FlxSprite = new FlxSprite(0, 0, Fundo);
      add(fundo);

      // Adcionamos a navinha ao jogo
      var nave:Nave = new Nave();
      add(nave);

      //A classe FlxGroup nos permite agrupar objetos como se fosse uma matrix ou array.
      tiros = new FlxGroup();
      var tiro:FlxSprite;
      //A quantidade de tiros deve ser proporcional a velocidade de tiros, ja se nao o tiro reseta antes de chegar
      // ao final do cenario.
      const kMaximoTirosDaNave:int = 20;
      const kForaDaTela:int = -20;

      for (var i:int = 0; i < kMaximoTirosDaNave; i++) {
        //O tiro é criado FORA dos limites da tela, por isso os valores negativos.
        tiro = new FlxSprite(kForaDaTela, kForaDaTela);
        tiro.makeGraphic(2, 8, 0xFFFF0000);
        tiros.add(tiro);
      }

      //Carrego as balas na nave! Existe uma variavel chamada "tiros" na nave
      // que populamos com nossos tiros no início do game.
      nave.carregarMunicao(tiros);
      add(tiros);

      inimigos = new FlxGroup();
      var inimigo:Inimigo;
      //A quantidade de tiros deve ser proporcional a velocidade de tiros, ja se nao o tiro reseta antes de chegar
      // ao final do cenario.
      const kMaximoDeInimigos:int = 20;

      for (var j:int = 0; j < kMaximoDeInimigos; j++) {
        //O tiro é criado FORA dos limites da tela, por isso os valores negativos.
        inimigo = new Inimigo(Math.random() * 500 + 50, -(Math.random() * 400));
        inimigos.add(inimigo);
        add(inimigos);
      }
    }

    private function onOverlap(sprite1:FlxSprite, sprite2:FlxSprite):void {
      sprite2.play("explode");
      FlxG.play(ExplosaoSom);
    }

    override public function update():void {
      FlxG.overlap(tiros, inimigos, onOverlap);

      //Aqui estamos testando se ainda existe algum inimigo vivo na tela. Se nao houver passamos de fase.
      if (inimigos.countLiving() == 0) {
        /*Nesse ponto do jogo podemos implementar a lógica para passar de fase!
        * Nesse exeplo apenas implementei a logica que leva ao estado final do jogo!*/
        var theEnd:FinalState = new FinalState();

        FlxG.switchState(theEnd);
      }
      super.update();
    }
  }
}
