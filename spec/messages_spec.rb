require 'rantly/property'
require 'messages'
require 'lexical_uuid'
require 'json'

class Rantly
    def uuid
	LexicalUUID.new
    end
end

module Messages
    describe DoSomething do
	let (:message) { 
	    lambda { |r| DoSomething.new id: r.uuid, name: r.string }
	}
	it "should be usefully representable as JSON" do
	    property_of(&message).check do |msg|
		json = msg.as_json
		JSON.parse(JSON.unparse(json)).should == json
	    end
	end
	it "should round-trip via it's representation" do
	    property_of(&message).check do |msg|
		DoSomething.of_json(msg.as_json).should == msg
	    end
	end

    end
end
