require 'spec_helper'

describe Hash, "#to_xml" do

  it "should return a xml string" do
    hash = {
        'key' => 'value'
    }
    hash.to_xml.should eq( '<?xml version="1.0"?>
<root>
  <key>value</key>
</root>
' )
  end

  it "with arrays should return a xml string" do
    hash = { 'key0' => [
        { 'key1' => 'value1' },
        { 'key2' => 'value2' },
        { 'key2' => 'value3' }
    ] }
        hash.to_xml.should eq( '<?xml version="1.0"?>
<root>
  <key0>
    <key1>value1</key1>
    <key2>value2</key2>
    <key2>value3</key2>
  </key0>
</root>
' )
  end

end
