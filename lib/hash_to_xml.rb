# encoding: utf-8
require 'rubygems'
require 'nokogiri'
class Hash
  def to_xml
    @to_xml_doc = ::Nokogiri::XML( '<root />' )
    def recurse( parent, hash )
      hash.each_pair { | key, value |
        node = Nokogiri::XML::Node.new key, @to_xml_doc
        value.instance_of?( Hash ) ? node = recurse( node, value ) : node.content = value
        parent << node
      }
      return parent
    end
    recurse( @to_xml_doc.root, self )
    return @to_xml_doc.to_xml
  end
end # hash