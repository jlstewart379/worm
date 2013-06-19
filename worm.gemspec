Gem::Specification.new do |s|
  s.name = "worm"
  s.version = "0.0.2"
  s.authors = ["Jeremy Stewart"]
  s.date = '2013-06-11'
  s.description = %q{An irb driver for Frankified iOS apps}
  s.email = %q{jlstewart379@gmail.com}
  s.files = ["lib/worm.rb", "lib/selector_builder.rb", "lib/screen.rb"]
  s.test_files = ["spec/selector_builder_spec.rb","spec/screen_spec.rb" ]
  s.require_paths = ["lib"]
  s.summary = 'An irb driver for Frankified apps'
  s.homepage = 'https://github.com/jlstewart379/worm.git'

  s.add_dependency 'frank-cucumber', '~> 1.1.8'
  s.add_development_dependency 'rspec'
end