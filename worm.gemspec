Gem::Specification.new do |s|
  s.name = "worm"
  s.version = "0.0.1"
  s.authors = ["Jeremy Stewart"]
  s.date = '2013-06-11'
  s.description = %q{iOS app driver for irb using Frank}
  s.email = %q{jlstewart379@gmail.com}
  s.files = ["lib/worm.rb",]
  s.test_files = ["spec/selector_builder_spec.rb","spec/screen_spec.rb" ]
  s.require_paths = ["lib"]
  s.summary = %q{iOS app driver for irb using Frank}

  gem.add_development_dependency 'rspec'

end