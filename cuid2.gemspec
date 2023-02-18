# frozen_string_literal: true

require_relative 'lib/cuid2/version'

Gem::Specification.new do |spec|
  spec.name = 'cuid2'
  spec.version = Cuid2::VERSION
  spec.authors = ['Rubens Stulzer']
  spec.email = ['rubens.stulzer@gmail.com']

  spec.summary = 'Cuid2 is a Ruby implementation of the Cuid2 algorithm by Eric Elliott.'
  spec.description = 'Secure, collision-resistant ids optimized for horizontal scaling and performance.' \
  'Next generation UUIDs. Need unique ids in your app? Forget UUIDs which often collide in large apps.' \
  'Use Cuid2, instead.'
  spec.license = 'MIT'

  spec.homepage = 'https://github.com/stulzer/cuid2'
  spec.required_ruby_version = '>= 3.2.0'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/stulzer/cuid2'
  spec.metadata['changelog_uri'] = 'https://github.com/stulzer/cuid2/CHANGELOG.md'

  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|circleci)|appveyor)})
    end
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
end
