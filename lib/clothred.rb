=begin rdoc
Provides the methods to convert HTML into Textile.
#--
TODO: enhance docs, as more methods come availlable
#++

Author:: Phillip "CynicalRyan" Gawlowski (mailto:cmdjackryan@gmail.com)
Copyright:: Copyright (c) 2007 Phillip Gawlowski
License:: BSD



=end




class ClothRed < String
#--
  TEXT_FORMATTING = [
    ["<b>", "**"], ["</b>","**"], ["<em>","_"], ["</em>", "_"], ["<b>", "*"], 
    ["</b>", "*"], ["<cite>", "??"], ["</cite>", "??"], ["<code>", "@"], 
    ["</code>", "@"], ["<del>", "-"], ["</del>", "-"], ["<ins>", "+"], 
    ["</ins>", "+"], ["<sup>","^"], ["</sup>","^"], ["<sub>","~"], ["</sub>","~"], 
    ["<strong>", "*"], ["</strong>", "*"], ["<i>","__"], ["</i>", "__"] 
  ]
  
  HEADINGS = [
    ["<h1>","h1. "], ["</h1>", ""], ["<h2>","h2. "],["</h2>", ""], 
    ["<h3>","h3. "], ["</h3>", ""], ["<h4>","h4. "],["</h4>", ""], 
    ["<h5>","h5. "], ["</h5>", ""], ["<h6>","h6. "],["</h6>", ""]
  ]
  
  STRUCTURES = [
    ["<p>", ""],["</p>","\n\n"], ["<blockquote>", "bq. "], ["</blockquote>",""]
  ]
  
  def initialize (html)
    super(html)
    @workingcopy = html.dup
  end
#++  
  #Call all necessary methods to convert a string of HTML into Textile markup.
  
  def to_textile
   
  headings(@workingcopy)
  structure(@workingcopy)
  text_formatting(@workingcopy)

  @workingcopy

end
  
#--
  #The conversion methods themselves are private.
  private
  
  def text_formatting(text)
    TEXT_FORMATTING.each do |htmltag, textiletag|
      text.gsub!(htmltag, textiletag)
    end
    text
  end
  
  
  def headings(text)
    HEADINGS.each do |htmltag, textiletag|
      text.gsub!(htmltag, textiletag)
    end
    text
  end
  
  
  def structure(text)
    STRUCTURES.each do |htmltag, textiletag|
      text.gsub!(htmltag, textiletag)
    end
    text
  end
  
  def tables(text)
    #TODO: Translate Tables
    text
  end
  
  
  def css_styles(text)
    #TODO: Translate CSS-styles
    text
  end
#++
end
