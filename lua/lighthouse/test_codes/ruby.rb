require("a")
load("b")
require_relative("c")
$HOGE = 3

({})

# TODO
# @return
# @param fuga [hoge]
module Hoge::Fuga
  class Hoge::Fuga
    alias hoge fuga
    include Enumerable
    extend Y
    aiueo(hoge: :fuga, fuga: 23)
    test :a
    [
      {
        a: [%i[aiue eo], %w[hoge fuga]],
        b: { a: 3 },
        c: -> (a:, b:) { },
        d: lambda do |hoge: 1, **xx|
        end,
        e: /^hoge[123]x$/ig
      }
    ]
    class << self
      @test = 3
      @@test = 1
      def y(*a, **b)
        3.times { next }
        begin
        rescue
        end
        2.each.with_index { break }
        [].each do
        rescue => e
        end
        throw(:abort)
        raise("a", 'aaa', :hoge)
      end

      def HogeFuga()
        Encoding::Hoge
        case 3
        when true
        else
        end

        super
      end

      def z_hoge(...)
        zz(...)
        lambda do |y| end
        if y && z || y
          x += 3.0 rescue 3
          hoge unless y
          <<~HERE
            aiueo
          HERE
          return 3
        else
        end
      rescue Error => error
      ensure
      end
    end

    def self.x(a = true, b: ["a", /hoge/i], d: y())
      hoge(
        [aiueo],
        %i[aa]
      )
    end
  end
end

=begin

=end
