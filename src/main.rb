puts 'hello world'
puts $:
require 'java'
require 'engine/dist/jMonkeyEngine3.jar'

java_import 'com.jme3.app.SimpleApplication'

class Main < com.jme3.app.SimpleApplication
	def simpleInitApp
		
	end
	def simpleUpdate tpf
		
	end
end


app = Main.new

app.start

