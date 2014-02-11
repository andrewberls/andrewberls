window.Game = {}

Game.scroll = ->
  for entity in window.tiles
    entity.position.x -= 2

Game.maxGrav = 6

Game.tryNum = 0

Game.initAll = ->
  @player = new Player({ x: 200, y: 200, sprite: 'img/bird1.png' })
  @scene  = new Kona.Scene { name: "main#{++Game.tryNum}", active: true }
  @scene.background.src = 'img/background.png'
  @scene.addEntity(this.player)
  Kona.Scenes.setCurrent("main#{Game.tryNum}")
  @addColumns()
  Kona.Entity.grav = 0
  Kona.Engine.start() unless Kona.Engine.running
  setTimeout(Game.trackScore, 3000)
  setTimeout(@start, 1000)


# "score" tracking. Don't want to bother tracking actual
# columns, so just make something up
Game.trackScore = ->
  clearInterval(Game.scoreInterval)
  Game.scoreInterval = setInterval =>
    Game.player.score += 1
  , 2000


class Tile extends Kona.Tile
  update: ->
    if @right() < 0
      Kona.Scenes.currentScene.removeEntity(@)
    else
      super()

# Compute and generate all columns
Game.addColumns = ->
  # Add one horizontal segment of a 2 tile wide column
  addColumnSegment = (x,y, sprite=null) =>
    if sprite?
      @scene.addEntity(new Tile({ x: x, y: y, sprite: sprite }))
      @scene.addEntity(new Tile({ x: x+Kona.Tile.tileSize, y: y, sprite: sprite }))
    else
      @scene.addEntity(new Tile({ x: x, y: y, sprite: 'img/col_left.png' }))
      @scene.addEntity(new Tile({ x: x+Kona.Tile.tileSize, y: y, sprite: 'img/col_right.png' }))

  addTopColumn = (x, height) =>
    for yOffset in [0..height]
      y = 0 + (yOffset*Kona.Tile.tileSize)
      sprite = if yOffset == height then 'img/col_top.png' else null
      addColumnSegment(x, y, sprite)

  addBottomColumn = (x,height) =>
    for yOffset in [0..height]
      y = Kona.Canvas.height - (yOffset*Kona.Tile.tileSize)
      sprite = if yOffset == height then 'img/col_bottom.png' else null
      addColumnSegment(x, y, sprite)

  numCols   = 70
  tileSize  = Kona.Tile.tileSize
  colOffset = 4 # tiles between each column

  for num in [2..numCols]
    offset = num * (tileSize * colOffset)
    x = (tileSize * num) + offset

    topPipeHeight = Kona.Utils.random(1,5)
    addTopColumn(x, topPipeHeight)

    bottomPipeHeight = 6 - topPipeHeight
    addBottomColumn(x, bottomPipeHeight)


# Move the player up
Game.playerJump = ->
  return if Game.jumpInterval?

  Kona.Entity.grav = 0
  Game.jumpInterval = setInterval((-> Game.player.position.y -= 3) , 4)
  setTimeout ->
    clearInterval(Game.jumpInterval)
    Game.jumpInterval = null
    Kona.Entity.grav = Game.maxGrav
  , 100


# Bind click handlers and kick things off
Game.start = ->
  Kona.Keys.bind('space', Game.playerJump)
  Kona.Entity.grav = Game.maxGrav
  Game.started = true


Kona.ready ->
  Kona.Canvas.init('gameCanvas')
  Kona.Sounds.play('audio/getlucky.mp3', { autoplay: true, loop: true })
  Game.initAll()
