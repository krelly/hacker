module Hacker
    def self.hackerize(hacker_array)
      hacker_array.map do |movie|
        words = movie.split(/[^[[:word:]]]+/).map(&:strip).reject(&:empty?)

        if words.length == 1
          words.insert(rand(2),"хакер")
        else
          words[rand(words.length)] = "хакер"
        end

        words[0] = Unicode::capitalize words[0]
        words.join(' ')
      end
    end
end
