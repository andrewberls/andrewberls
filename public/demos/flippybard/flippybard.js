(function() {
  var Player, Tile,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  Player = (function(_super) {

    __extends(Player, _super);

    Player.group = 'player';

    function Player(opts) {
      var _this = this;
      if (opts == null) {
        opts = {};
      }
      Player.__super__.constructor.call(this, opts);
      this.isAlive = true;
      this.score = 0;
      Kona.Engine.afterEach(function() {
        return Kona.Canvas.safe(function() {
          Kona.Canvas.ctx.font = 'normal 15px Arial';
          Kona.Canvas.ctx.fillStyle = 'black';
          return Kona.Canvas.ctx.fillText("Score: " + _this.score, 5, 20);
        });
      });
    }

    Player.prototype.update = function() {
      var entity, _i, _len, _ref;
      this.addGravity();
      window.tiles = window.tiles || Kona.Scenes.getCurrentEntities('tiles');
      _ref = window.tiles;
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        entity = _ref[_i];
        if (this.intersecting(entity)) {
          this.die();
        }
      }
      if (this.bottom() >= Kona.Canvas.height) {
        this.die();
      }
      if (Game.started) {
        return Game.scroll();
      }
    };

    Player.prototype.correctBottom = function() {};

    Player.prototype.die = function() {
      var entity, _i, _len, _ref,
        _this = this;
      if (this.isAlive) {
        this.isAlive = false;
        this.stop();
        Game.started = false;
        clearInterval(Game.scoreInterval);
        Kona.Keys.unbind('space');
        _ref = window.tiles;
        for (_i = 0, _len = _ref.length; _i < _len; _i++) {
          entity = _ref[_i];
          entity.solid = false;
        }
        Kona.Entity.grav = 15;
        setTimeout(function() {
          Kona.Engine.afterEach(function() {
            return Kona.Canvas.safe(function() {
              Kona.Canvas.ctx.textAlign = 'center';
              Kona.Canvas.ctx.font = '40px Arial';
              Kona.Canvas.ctx.fillStyle = 'black';
              Kona.Canvas.ctx.fillText("Game over! Score: " + _this.score, 350, 275);
              Kona.Canvas.ctx.font = '30px Arial';
              return Kona.Canvas.ctx.fillText('Press enter to restart', 375, 325);
            });
          });
          window.tiles = null;
          Kona.Scenes.currentScene.expireEntityCache();
          return Kona.Scenes.currentScene.entities.reset();
        }, 300);
        return Kona.Keys.bind('enter', function() {
          Kona.Keys.unbind('enter');
          Kona.Engine.eachFrameHandlers = [];
          return Game.initAll();
        });
      }
    };

    return Player;

  })(Kona.Entity);

  window.Game = {};

  Game.scroll = function() {
    var entity, _i, _len, _ref, _results;
    _ref = window.tiles;
    _results = [];
    for (_i = 0, _len = _ref.length; _i < _len; _i++) {
      entity = _ref[_i];
      _results.push(entity.position.x -= 2);
    }
    return _results;
  };

  Game.maxGrav = 6;

  Game.tryNum = 0;

  Game.scoreInterval = null;

  Game.jumpInterval = null;

  Game.initAll = function() {
    this.player = new Player({
      x: 200,
      y: 200,
      sprite: 'img/bird1.png'
    });
    this.scene = new Kona.Scene({
      name: "main" + (++Game.tryNum),
      active: true
    });
    this.scene.background.src = 'img/background.png';
    this.scene.addEntity(this.player);
    Kona.Scenes.setCurrent("main" + Game.tryNum);
    this.addColumns();
    Kona.Entity.grav = 0;
    if (!Kona.Engine.running) {
      Kona.Engine.start();
    }
    setTimeout(Game.trackScore, 3000);
    return setTimeout(this.start, 1000);
  };

  Game.trackScore = function() {
    var _this = this;
    if (!Game.player.isAlive) {
      return;
    }
    if (Game.scoreInterval != null) {
      clearInterval(Game.scoreInterval);
    }
    return Game.scoreInterval = setInterval(function() {
      return Game.player.score += 1;
    }, 2000);
  };

  Tile = (function(_super) {

    __extends(Tile, _super);

    function Tile() {
      return Tile.__super__.constructor.apply(this, arguments);
    }

    Tile.prototype.update = function() {
      if (this.right() < 0) {
        return Kona.Scenes.currentScene.removeEntity(this);
      } else {
        return Tile.__super__.update.call(this);
      }
    };

    return Tile;

  })(Kona.Tile);

  Game.addColumns = function() {
    var addBottomColumn, addColumnSegment, addTopColumn, bottomPipeHeight, colOffset, num, numCols, offset, tileSize, topPipeHeight, x, _i, _results,
      _this = this;
    addColumnSegment = function(x, y, sprite) {
      if (sprite == null) {
        sprite = null;
      }
      if (sprite != null) {
        _this.scene.addEntity(new Tile({
          x: x,
          y: y,
          sprite: sprite
        }));
        return _this.scene.addEntity(new Tile({
          x: x + Kona.Tile.tileSize,
          y: y,
          sprite: sprite
        }));
      } else {
        _this.scene.addEntity(new Tile({
          x: x,
          y: y,
          sprite: 'img/col_left.png'
        }));
        return _this.scene.addEntity(new Tile({
          x: x + Kona.Tile.tileSize,
          y: y,
          sprite: 'img/col_right.png'
        }));
      }
    };
    addTopColumn = function(x, height) {
      var sprite, y, yOffset, _i, _results;
      _results = [];
      for (yOffset = _i = 0; 0 <= height ? _i <= height : _i >= height; yOffset = 0 <= height ? ++_i : --_i) {
        y = 0 + (yOffset * Kona.Tile.tileSize);
        sprite = yOffset === height ? 'img/col_top.png' : null;
        _results.push(addColumnSegment(x, y, sprite));
      }
      return _results;
    };
    addBottomColumn = function(x, height) {
      var sprite, y, yOffset, _i, _results;
      _results = [];
      for (yOffset = _i = 0; 0 <= height ? _i <= height : _i >= height; yOffset = 0 <= height ? ++_i : --_i) {
        y = Kona.Canvas.height - (yOffset * Kona.Tile.tileSize);
        sprite = yOffset === height ? 'img/col_bottom.png' : null;
        _results.push(addColumnSegment(x, y, sprite));
      }
      return _results;
    };
    numCols = 70;
    tileSize = Kona.Tile.tileSize;
    colOffset = 4;
    _results = [];
    for (num = _i = 2; 2 <= numCols ? _i <= numCols : _i >= numCols; num = 2 <= numCols ? ++_i : --_i) {
      offset = num * (tileSize * colOffset);
      x = (tileSize * num) + offset;
      topPipeHeight = Kona.Utils.random(1, 5);
      addTopColumn(x, topPipeHeight);
      bottomPipeHeight = 6 - topPipeHeight;
      _results.push(addBottomColumn(x, bottomPipeHeight));
    }
    return _results;
  };

  Game.playerJump = function() {
    if (Game.jumpInterval != null) {
      return;
    }
    Kona.Entity.grav = 0;
    Game.jumpInterval = setInterval((function() {
      return Game.player.position.y -= 3;
    }), 4);
    return setTimeout(function() {
      clearInterval(Game.jumpInterval);
      Game.jumpInterval = null;
      return Kona.Entity.grav = Game.maxGrav;
    }, 100);
  };

  Game.start = function() {
    Kona.Keys.bind('space', Game.playerJump);
    Kona.Entity.grav = Game.maxGrav;
    return Game.started = true;
  };

  Kona.ready(function() {
    Kona.Canvas.init('gameCanvas');
    Kona.Sounds.play('audio/getlucky.ogg', {
      autoplay: true,
      loop: true
    });
    return Game.initAll();
  });

}).call(this);
