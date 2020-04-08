package {

  import org.flixel.FlxG;
  import org.flixel.FlxSprite;
  import org.flixel.FlxState;
  import org.flixel.FlxText;

  // FlxState é uma classe que extende FlxGroup e serve basicamente para definir em qual estado do jogo estamos:
  // 1) No menu
  // 2) Em jogo
  // Aqui vamos modelar o Estado.
  public class MenuState extends FlxState {

    //Metadata em que importamos
    [Embed(source="../resources/img/InvadersMenu.png")]
    private var Fundo:Class;

    //Construtor de nossa classe, precisa implementar o construtor de FlxState, por isso o super.
    //U Dont have to worry here, its programming stuff...
    public function MenuState() {
      super();
    }

    //Aqui implementamos o metodo que a classe FlxState define:
    override public function create():void {

      //Adicionamos o fundo ao jogo.
      var fundo:FlxSprite = new FlxSprite(0, 0, Fundo);
      add(fundo);

      //Adicionamos o logotipo ao jogo.
      var logotipo:FlxText = new FlxText(FlxG.width * 0.5 - 200, 250, 400, "INVADERS");
      logotipo.setFormat(null, 40, 0xFFFFFF, "center");
      add(logotipo);

      //Adicionamos as instrucoes na tela.
      var instrucoes:FlxText = new FlxText(FlxG.width * 0.5 - 200, 320, 400, "Aperte [x] para JOGAR");
      instrucoes.setFormat(null, 20, 0x0000FF, "center");
      add(instrucoes);
    }

    //Funcao tipo a interframe do flash
    override public function update():void {
      if (FlxG.keys.X) {
        //Inicia o jogo, ou seja muda o estado do jogo de menu para o principal.
        var menu: MainState = new MainState();

        FlxG.switchState(menu);
      }
      super.update();
    }
  }
}
