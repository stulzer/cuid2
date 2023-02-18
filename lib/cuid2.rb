# frozen_string_literal: true

require_relative 'cuid2/version'
require 'digest'

module Cuid2
  # Entropy is a class that generates a random string of characters
  class Entropy
    PRIMES = [109_717, 109_721, 109_741, 109_751, 109_789, 109_793, 109_807, 109_819, 109_829, 109_831].freeze

    def self.create(length)
      entropy = ''

      while entropy.length < length
        random_prime = PRIMES[(rand * PRIMES.size).floor]
        entropy += (rand * random_prime).floor.to_s(36)
      end

      entropy[0, length]
    end
  end

  # Hash is a class that generates a hash of a string
  class Hash
    BIG_LENGTH = 32

    def self.create(input, length = BIG_LENGTH)
      # The salt should be long enough to be globally unique across the full
      # length of the hash. For simplicity, we use the same length as the
      # intended id output, defaulting to the maximum recommended size.
      salt = Entropy.create(length)
      text = input + salt

      # Drop the first two characters because they bias the histogram
      # to the left.
      Digest::SHA512.hexdigest(text).chars.map(&:to_i).join.to_i.to_s(36)[2..]
    end
  end

  # Generate is a class that generates a Cuid2
  class Generate
    DEFAULT_LENGTH = 24

    def self.call
      new.generate
    end

    def generate(length = DEFAULT_LENGTH)
      hash_input = (time + Entropy.create(length) + count + fingerprint).to_s

      "#{random_letter}#{Cuid2::Hash.create(hash_input, length)[2..length]}"
    end

    private

    def time
      @time ||= Time.now.to_i.to_s(36)
    end

    def count
      @count ||= counter.to_i.to_s(36)
    end

    def random
      @random ||= rand
    end

    def counter
      (rand + 1) * 2057
    end

    def random_letter
      ('a'..'z').to_a[(random * 26).floor]
    end

    def fingerprint
      Cuid2::Hash.create("#{((random + 1) * 2063).floor} #{Object.constants.map(&:to_s)}")
    end
  end
end
