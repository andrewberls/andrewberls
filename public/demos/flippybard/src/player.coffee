class Player extends Kona.Entity
  @group = 'player'

  constructor: (opts={}) ->
    super(opts)
    @isAlive = true
    @score   = 0

    Kona.Engine.afterEach =>
      Kona.Canvas.safe =>
        Kona.Canvas.ctx.font = 'normal 15px Arial'
        Kona.Canvas.ctx.fillStyle = 'black'
        Kona.Canvas.ctx.fillText("Score: #{@score}", 5, 20)


  update: ->
    @addGravity()

    window.tiles = window.tiles || Kona.Scenes.getCurrentEntities('tiles')
    for entity in window.tiles
      @die() if @intersecting(entity)

    @die() if @bottom() >= Kona.Canvas.height
    Game.scroll() if Game.started


  correctBottom: -> return


  die: () ->
    if @isAlive
      @isAlive = false
      @stop()
      Game.started = false
      clearInterval(Game.scoreInterval)
      Kona.Keys.unbind('space')

      for entity in window.tiles
        entity.solid = false

      Kona.Entity.grav = 15
      ##Kona.Sounds.play('player_die')

      setTimeout =>
        Kona.Engine.afterEach =>
          Kona.Canvas.safe =>
            Kona.Canvas.ctx.textAlign = 'center'
            Kona.Canvas.ctx.font = '40px Arial'
            Kona.Canvas.ctx.fillStyle = 'black'
            Kona.Canvas.ctx.fillText("Game over! Score: #{@score}", 350, 275)
            Kona.Canvas.ctx.font = '30px Arial'
            Kona.Canvas.ctx.fillText('Press enter to restart', 375, 325)

        window.tiles = null
        Kona.Scenes.currentScene.expireEntityCache()
        Kona.Scenes.currentScene.entities.reset()
      , 300

      Kona.Keys.bind 'enter', ->
        Kona.Keys.unbind('enter')
        # TODO: clear text rendering
        Kona.Engine.eachFrameHandlers = []
        Game.initAll()
