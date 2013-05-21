namespace :engine do
	desc 'download the sources'
	task :download do
		sh 'svn checkout http://jmonkeyengine.googlecode.com/svn/trunk/engine'
	end
	desc 'build the engine'
	task :build do
		sh 'cd engine && ant'
	end
	desc 'download and build the latest version of the engine'
	task :latest => [:download, :build]
end

desc 'run the project'
task :run do
 sh 'JRUBY_OPTS="-J-Xmx128M --2.0" jruby src/main.rb -I"engine/dist/"'
end 
