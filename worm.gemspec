Gem::Specification.new do |s|
  s.name = "worm"
  s.version = "0.0.1"
  s.authors = ["Jeremy Stewart"]
  s.date = '2013-06-11'
  s.description = %q{An iOS app command line driver}
  s.email = %q{jlstewart379@gmail.com}
  s.files = ["lib/worm.rb", "lib/selector_builder.rb", "lib/screen.rb"]
  s.test_files = ["spec/selector_builder_spec.rb","spec/screen_spec.rb" ]
  s.require_paths = ["lib"]
  s.summary = 'iOS app driver'

  s.add_dependency 'frank-cucumber', '~> 1.1.8'
  s.add_development_dependency 'rspec'
end