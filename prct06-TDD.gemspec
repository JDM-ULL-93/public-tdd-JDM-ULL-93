lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
#require "prct06/TDD/version"

Gem::Specification.new do |spec|
  spec.name          = "prct06-TDD"
  spec.version       = 0.1
  spec.authors       = ["Javier Duque Melguizo"]
  spec.email         = ["alu0101160337@ull.edu.es"]

  spec.summary       = %q{Es un ejemplo de test-driven development}
  spec.description   = %q{En esta practica se plantea para aprender a usar bundle, rspec y como funciona el desarrollo basado en TDD.}
  spec.homepage      = "https://github.com/ULL-ESIT-LPP-1920/tdd-JDM-ULL-93"

  spec.metadata["allowed_push_host"] = "https://github.com/ULL-ESIT-LPP-1920/tdd-JDM-ULL-93"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/ULL-ESIT-LPP-1920/tdd-JDM-ULL-93"
  spec.metadata["changelog_uri"] = "https://github.com/ULL-ESIT-LPP-1920/tdd-JDM-ULL-93"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
