# test_structure.rb
# 12. April 2007
#

$:.unshift File.join(File.dirname(__FILE__),'..','lib')

begin
  require "rubygems"
  require "clothred"
rescue LoadError
  require "clothred"
end

require 'test/unit'

class TestClothRedStructures < Test::Unit::TestCase
 
  STRUCTURE_TEST = [
  ["<blockquote>blockquote</blockquote>","bq. blockquote"],
  ["<p>paragraph</p><p>another paragraph</p>", "paragraph\n\nanother paragraph\n\n"]
  ]
  
  
  def test_structures
    STRUCTURE_TEST.each do |html, textile|
      test_html = ClothRed.new(html)
      result = test_html.to_textile
      assert_equal(textile,result)
    end
  end
end
