Gem::Specification.new do |s|
  s.name        = 'hash_to_xml'
  s.version     = '1.0.1'
  s.date        = '2012-03-22'
  s.summary     = "hash.to_xml"
  s.description = "Add method to_xml on ruby Hash class. The method returns a xml string."
  s.authors     = ["Christian Andreas Westgaard"]
  s.email       = 'comlock@gmail.com'
  s.files       = ["lib/hash_to_xml.rb"]
  s.homepage    = 'http://rubygems.org/gems/hash_to_xml'
  s.license     = 'GPL-2'
  s.add_runtime_dependency 'nokogiri'
  s.requirements << 'nokogiri'
end
