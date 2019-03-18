# -*- frozen-string-literal: true -*-

require "did_you_mean/levenshtein"
require "did_you_mean/jaro_winkler"

module DidYouMean
  class SpellChecker
    def initialize(dictionary: )
      @dictionary = dictionary
    end

    def correct(input)
      input     = normalize(input)
      threshold = input.length > 3 ? 0.834 : 0.77

      seed = @dictionary.select {|candidate| JaroWinkler.distance(normalize(candidate), input) >= threshold }
      seed.reject! {|candidate| input == candidate.to_s }
      seed.sort_by! {|candidate| JaroWinkler.distance(candidate.to_s, input) }
      seed.reverse!

      # Correct mistypes
      threshold   = (input.length * 0.25).ceil
      has_mistype = seed.rindex {|c| Levenshtein.distance(normalize(c), input) <= threshold }

      corrections = if has_mistype
        seed.take(has_mistype + 1)
      else
        # Correct misspells
        seed.select do |candidate|
          candidate = normalize(candidate)
          length    = input.length < candidate.length ? input.length : candidate.length

          Levenshtein.distance(candidate, input) < length
        end.first(1)
      end

      corrections
    end

    private

    def normalize(str_or_symbol) #:nodoc:
      str = if str_or_symbol.is_a?(String)
              str_or_symbol.dup
            else
              str_or_symbol.to_s
            end

      str.downcase!
      str.tr!("@", "")
      str
    end
  end
end
