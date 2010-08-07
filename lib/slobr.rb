$:.unshift(File.dirname(__FILE__)) unless
$:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

# require "slobr/helpers"

module Slobr
  VERSION = "0.2"

  class Slobr
    def initialize(text = nil)
      @text = text || (puts "Text je nil!"; exit)
      @debug = false

      @h = {}
      @regex = "ABCDEFGHIJKLMNOPQRSTUVWXYZ" #+"ćžpšđĆŽPŠĐ"
    end

    def broji_slova(t = @text)
      t.each_char { |s|
        s = s.upcase
        if @regex.include? s
          @h[s]=0 if @h[s].nil?
          @h[s]+=1
        end
      }
    end

    def text
      @text
    end

    def text=(text)
      @text = text
    end

    def ispis(put = false)
      t = ["Slovo, Frekv."]
      @h.sort{|l,r| r[1]<=>l[1] }.each { |s,c|
        t << "  %s:   %i" % [s, c]
      }
      return t.join("\n") unless put
      put t.join("\n")
    end

    # a = TextGraph.new({
    #   :values => @hash.values,
    #   :labels => @hash.keys
    # })
    # puts a

    def debug(txt='')
      puts '[d] '+txt if debug?
    end

    def debug?
      !!@debug
    end

  end

end
