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
  FORMATTING_HTML = [
    ["<b>", "**"], ["</b>","**"], ["<em>","_"], ["</em>", "_"], ["<b>", "*"], 
    ["</b>", "*"], ["<cite>", "??"], ["</cite>", "??"], ["<code>", "@"], 
    ["</code>", "@"], ["<del>", "-"], ["</del>", "-"], ["<ins>", "+"], 
    ["</ins>", "+"], ["<sup>","^"], ["</sup>","^"], ["<sub>","~"], ["</sub>","~"], 
    ["<strong>", "*"], ["</strong>", "*"], ["<i>","__"], ["</i>", "__"] 
  ]
  
  def initialize (html)
    super(html)
  end
#++  
  #Call all necessary methods to convert a string of HTML into Textile markup.
  
  def to_textile
    html = self.dup
    FORMATTING_HTML.each do |htmltag, textiletag|
      html.gsub!(htmltag, textiletag)
    end
    html
  end
  
end
