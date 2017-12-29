
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "top/ico/version"

Gem::Specification.new do |spec|
  spec.name          = "top-ico"
  spec.version       = Top::Ico::VERSION
  spec.authors       = ["TungFelix", "duytd", "merlinv"]
  spec.email         = ["bluephoenix.hp@gmail.com", "duytd.hanu@gmail.com", "summondk@gmail.com"]

  spec.summary       = %q{Finding up-to-date list of trending and promising ICOs to invest from topicolist.com}
  spec.description   = %q{Start using our cryptocurrency ico list and discover the best initial coin offerings}
  spec.homepage      = "https://github.com/TungFelix/top-ico"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_dependency "nokogiri"
end
