# Rakefile.rb
# 9. April 2007
#

require 'rubygems'
require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'
require 'rake/gempackagetask'

Gem::manage_gems

task :build => ["pkg"]

spec = Gem::Specification.new do |s|
  s.name = "ClothRake"
  s.version = "0.1.0"
  s.author = 'Phillip "CynicalRyan" Gawlowski'
  s.email = "cmdjackryan@gmail.com"
  s.platform = Gem::Platform::RUBY
  s.summary = "RedCloth in reverse: Converting HTML into Textile markup"
  s.files = FileList["{bin}/**/*","{lib}/**/*","{doc}/**/*"].exclude("nbproject",".svn").to_a
  s.require_path = "lib"
  s.autorequire = "clothred"
  s.has_rdoc = true
  s.add_dependency("")
end

Rake::GemPackageTask.new(spec) do |pkg|
  pkg.need_tar = true
end