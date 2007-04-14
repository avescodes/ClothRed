# Rakefile.rb
# 9. April 2007
#

require 'rubygems'
require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'
require 'rake/gempackagetask'

#List of tasks available
task :gem => ["pkg", "test", "rdoc"]
task :test


Gem::manage_gems

spec = Gem::Specification.new do |s|
  s.name = "ClothRed"
  s.version = "0.4.0"
  s.author = 'Phillip "CynicalRyan" Gawlowski'
  s.email = "cmdjackryan@gmail.com"
  s.platform = Gem::Platform::RUBY
  s.summary = "RedCloth in reverse: Converting HTML into Textile markup"
  s.files = FileList["{lib,test,doc}/**/*"].exclude("nbproject",".svn").to_a
  s.rdoc_options << '--title' << 'ClothRed documentation' << '--main' << 'README.rdoc'
  s.autorequire = "clothred"
  s.has_rdoc = false #Should be true, have to juggle with the directories first, though
  s.rubyforge_project ="clothred"
end

Rake::GemPackageTask.new(spec) do |pkg|
  pkg.need_tar = true
end

Rake::TestTask.new do |test|
  test.name = "test"
  test.warning = true
  test.verbose = false
  test.test_files = FileList['test/test*.rb']
end

Rake::RDocTask.new do |rd|
  rd.title = "ClothRead documentation"
  rd.rdoc_files.exclude("Rakefile.rb")
  rd.rdoc_files.include("LICENSE.rdoc", "lib/clothred.rb", "README.rdoc")
  rd.rdoc_dir = "/doc/html"
  rd.main = "README.rdoc"
end