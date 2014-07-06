require 'bundler'
Bundler.require

require 'java'
require 'engine/dist/jMonkeyEngine3.jar'
require 'lib/Lemur.jar'

require 'lib/game_state'
require 'lib/state_manager'

java_import 'com.jme3.scene.Geometry'
java_import 'com.jme3.scene.shape.Sphere'
java_import 'com.jme3.app.SimpleApplication'
java_import 'com.jme3.material.Material'
java_import 'com.jme3.math.ColorRGBA'

module JMEAccessors
	def assets
		asset_manager
	end
end

class FrameCounter < GameState
  def setup
    @acc = 0
    @frames = 0
  end

  def update(tpf)
    @acc += tpf
    @frames += 1
    if @acc >= 1
      puts @frames
      @frames = 0
      @acc -=1
    end
  end
end
class Game < com.jme3.app.SimpleApplication
  # The setup method is called when the application starts,
  # override this implement initialization logic.
  def setup
  end

  def simpleInitApp
    puts RUBY_DESCRIPTION
    @state_manager = StateManager.new

    setPauseOnLostFocus(false)
    assets.registerLocator(File.join(File.dirname(__FILE__),'..', 'assets'), com.jme3.asset.plugins.FileLocator.java_class)

    setup()
    loadQGuiFont
  end

  def loadQGuiFont
    assets.load_font('fonts/Futura.fnt')
  end


  # @return [StateManager]
  def states
    @state_manager
  end

  def assets
    asset_manager
  end
end

class Main < Game
  def setup
    states << FrameCounter.new
    texture = assets.loadTexture('textures/nuclear.jpg')
    puts texture.class

    @cube = Geometry.new('box',  Sphere.new(8,8, 1))
    @cube.material = material = Material.new(assets, 'Common/MatDefs/Misc/Unshaded.j3md')
    material.setColor('Color', ColorRGBA::Red)

    root_node.attachChild(@cube)


    @time = 0
  end

  def simpleUpdate(tpf)
		@cube.rotate(tpf, 0, 0)
		@time += tpf
    @state_manager.update(tpf)
	end
end

settings = com::jme3::system::AppSettings.new(true)
settings.setResolution(1280, 720)
settings.fullscreen = false
app = Main.new
app.settings = settings
app.show_settings = false
app.start

