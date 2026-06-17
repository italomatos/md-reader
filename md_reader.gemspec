# frozen_string_literal: true

require_relative "lib/md_reader/version"

Gem::Specification.new do |gem|
  gem.name        = "md-reader"
  gem.version     = MdReader::VERSION
  gem.summary     = "Abre arquivos Markdown no browser como HTML formatado."
  gem.description = "Comando de terminal que converte Markdown em HTML com estilo GitHub e abre no browser."
  gem.authors     = ["Italo Matos"]
  gem.email       = ["italomatos@gmail.com"]
  gem.license     = "MIT"

  gem.files         = Dir["lib/**/*.rb"] + %w[md_reader.gemspec README.md LICENSE]
  gem.executables   = ["md-reader"]
  gem.require_paths = ["lib"]

  gem.required_ruby_version = ">= 3.0"

  gem.add_dependency "redcarpet", "~> 3.6"
  gem.add_dependency "launchy",   "~> 2.5"
  gem.add_dependency "rouge",     "~> 4.0"
end
