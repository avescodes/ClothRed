# Rakefile.rb
# 9. April 2007
#

require 'rubygems'
require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'
require 'rake/gempackagetask'

Gem::manage_gems

task :gem => ["pkg"]

spec = Gem::Specification.new do |s|
  s.name = "ClothRed"
  s.version = "0.1.0"
  s.author = 'Phillip "CynicalRyan" Gawlowski'
  s.email = "cmdjackryan@gmail.com"
  s.platform = Gem::Platform::RUBY
  s.summary = "RedCloth in reverse: Converting HTML into Textile markup"
  s.files = FileList["{lib,test}/**/*"].exclude("nbproject",".svn").to_a
  s.require_path = "lib"
  s.autorequire = "clothred"
  s.has_rdoc = true
end

Rake::GemPackageTask.new(spec) do |pkg|
  pkg.need_tar = true
end