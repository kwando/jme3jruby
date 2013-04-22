namespace :engine do
	task :download do
		sh 'svn checkout http://jmonkeyengine.googlecode.com/svn/trunk/engine'
	end
	task :build do
		sh 'cd engine && ant'
	end
end

task :run do
 sh 'jruby src/main.rb -I"engine/dist/"'
end

