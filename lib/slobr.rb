$:.unshift(File.dirname(__FILE__)) unless
$:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

# require "slobr/helperi"

module Slobr
  VERSION = "0.1"
  # extend self
  BasePath = File.expand_path(File.dirname(__FILE__))

  class Slobr

    def initialize(text = nil)
      @text = text
      @text ||= $stdin.readlines
      # @debug = true
      @debug = false

      @h = {}
      @dozvoljena_slova = /[A-Za-zćžpšđĆŽPŠĐ]/
    end

    def broji_slova(text = @text)
      text.each { |line|
        debug "+ LINE: #{line}"
        line.scan(/./).each { |s|
          debug " - SLOVO: #{s}"
          s = s.upcase
          if @h[s]
            @h[s] += 1
          else
            @h[s] = 1 unless s.grep(@dozvoljena_slova).empty? # samo slova /a-z/
          end
        }
      }
    end

    def text
      @text
    end

    def text=(text)
      @text = text
    end

    # @hash = @hash.keys.sort_by {|s| s.to_s}.map {|key| [key, h[key]] }
    # @hash = @hash.sort
    def sort_h(h)
      Hash.create(
        h.sort { |l, r| l[1]<=>r[1] }.each { |i, ii| i  },
        h.sort { |l, r| l[1]<=>r[1] }.each { |i, ii| ii }
      )
    end
    # @hash = Hash.create(@hash.sort.each {|i, ii| i }, @hash.sort.each {|i, ii| ii })

    def ispis(put = false)
      t = "Slovo, Frekv.\n"
      @h.sort { |l, r| r[1]<=>l[1] }.each { |i,a|
        t += "  #{i}:     #{a}\n"
      }
      return t unless put == true
      putr t
    end

    # a = TextGraph.new({
    #   :values => @hash.values,
    #   :labels => @hash.keys
    # })
    # puts a

    def debug(*messages)
      puts messages.map { |m| "== #{m}" } if debug?
    end

    def debug?
      !!@debug
    end

  end

end
