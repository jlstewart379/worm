Gem::Specification.new do |s|
  s.name = "worm"
  s.version = "0.0.1"
  s.authors = ["Jeremy Stewart"]
  s.date = '2013-06-11'
  s.description = %q{A simple hello world gem}
  s.email = %q{jlstewart379@gmail.com}
  s.files = ["lib/worm.rb"]
  s.test_files = ["test/worm_spec.rb"]
  s.require_paths = ["lib"]
  s.summary = 'just a test'

  gem.add_development_dependency 'rspec'

end