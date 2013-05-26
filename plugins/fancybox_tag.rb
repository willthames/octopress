# Title: Fancybox tag for Jekyll
# Authors: Will Thames
# Description: Easily output images with optional class names, width, height, title and alt attributes. Heavily based on Image Tag from Octopress by Brandon Mathis
#
# Syntax {% fancybox galleryid [http[s]:/]/path/to/image [title text | "title text" ["alt text"]] %}
#
# Examples:
# {% fancybox kittens /images/kitten1.png "Kitten playing with string"%}
# {% fancybox kittens /images/kitten2.png "Kitten sleeping" %}
# {% fancybox kittens /images/kitten3.png "Kitten playing with wool" %}
#
# Output:
# <a class="fancybox" rel="kittens" href="/images/kittens1.png">
#   <img src="/images/thumbs/kittens1.png" alt="Kitten playing with string"
#        title="Kitten playing with string"></a>
# <a class="fancybox" rel="kittens" href="/images/kittens2.png">
#   <img src="/images/thumbs/kittens2.png" alt="Kitten sleeping"
#        title="Kitten sleeping"></a>
# <a class="fancybox" rel="kittens" href="/images/kittens3.png">
#   <img src="/images/thumbs/kittens3.png" alt="Kitten playing with wool"
#        title="Kitten playing with wool"></a>

module Jekyll

  class FancyboxTag < Liquid::Tag
    @fancybox = nil

    def initialize(tag_name, markup, tokens)
      if /(?<gallery>\S+)\s+(?<src>(?:https?:\/\/|\/|\S+\/)\S+)\s+(?<rest>.+)?/i=~ markup
        @fancybox = { gallery: gallery, src: src }
        /(?<baseurl>.*)\/(?<filename>[^\/]*)/ =~ src
        @fancybox[:thumb] = baseurl + '/thumbs/' + filename
        if /(?:"|')(?<title>[^"']+)?(?:"|')(?:\s+(?:"|')(?<alt>[^"']+)?(?:"|'))?/ =~ rest
          @fancybox[:title]  = title
          @fancybox[:alt]    = alt
        else
          @fancybox[:alt]    = @fancybox[:title].gsub!(/"/, '&#34;') if @fancybox[:alt]
        end
      end
      super
    end

    def render(context)
      if @fancybox
        result = ""
        unless context['fancybox']
          context['fancybox'] = 'whatever'
          result = "\n<script>\n    $(document).ready(function() {\n" + 
                   "        $(\".fancybox\").fancybox({\n" + 
                   "             padding     : 0,\n" + 
                   "             margin      : [20, 60, 20, 60], // Increase left/right margin\n" + 
                   "             helpers : {\n" + 
                   "                 title: {\n" +
                   "                     type: 'outside'\n" +
                   "                 }\n" +
                   "             }\n" +
                   "        });\n     });\n</script>"
        end
        result + "<a class=\"fancybox\" rel=\"#{@fancybox[:gallery]}\" " + 
          "href=\"#{@fancybox[:src]}\">\n" + 
          "  <img src=\"#{@fancybox[:thumb]}\" alt=\"#{@fancybox[:alt]}\" " +
          "title=\"#{@fancybox[:title]}\"></a>"
      else
        "Error processing fancybox, expected syntax: {% fancybox galleryname [http[s]:/]/path/to/image [title text | \"title text\" [\"alt text\"]] %}"
      end
    end
  end
end

Liquid::Template.register_tag('fancybox', Jekyll::FancyboxTag)
