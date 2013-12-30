require 'java'
require 'engine/dist/jMonkeyEngine3.jar'

require 'pry'

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

class Main < com.jme3.app.SimpleApplication
	include JMEAccessors

	def simpleInitApp
		setPauseOnLostFocus(false)
		@cube = Geometry.new('box',  Sphere.new(8,8, 1))
		@cube.material = material = Material.new(assets, 'Common/MatDefs/Misc/Unshaded.j3md')
		material.setColor('Color', ColorRGBA::Red)

		root_node.attachChild(@cube)

		@time = 0
	end
	def simpleUpdate tpf
		@cube.rotate(tpf, 0, 0)
		@time += tpf
		if @time > 5
			stop
		end
	end
end

settings = com::jme3::system::AppSettings.new(true)
settings.setResolution(1280, 800)
settings.fullscreen = true
app = Main.new
app.settings = settings
app.start
