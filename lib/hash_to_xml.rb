# encoding: utf-8
require 'rubygems'
require 'nokogiri'
class Hash

  def to_xml
    #pp "self : #{self}"
    @to_xml_doc = ::Nokogiri::XML( '<root />' )

    def recurse( parent, collection )
      #pp '-' * 80
      #pp "parent : #{parent.to_xml}"
      case collection

        when Hash
          collection.each_pair { | key, value |
            #pp "key   : #{key}"
            #pp "value : #{value}"
            node = Nokogiri::XML::Node.new key, @to_xml_doc
            case value
              when Hash, Array
                node = recurse( node, value )
              else
                node.content = value
            end # case value
            parent << node
          }

        when Array
          node = parent
          collection.each { | value |
            #pp "value : #{value}"
            case value
              when Hash, Array
                node = recurse( node, value )
              else
                node.content = value
            end # case value
          }

        else
          fail "Unhandeled class: #{collection.class}"
      end # case collection

      return parent

    end # def recurse

    recurse( @to_xml_doc.root, self )
    return @to_xml_doc.to_xml
  end # def to_xml

end # hash