require 'hamsterdam'
require 'lexical_uuid'

module Messages
    DoSomething = Hamsterdam::Struct.define(:id, :name)
    class DoSomething
	def as_json
	    {'id' => id.to_guid, 'name' => name}
	end

	def self.of_json json
	    self.new id: LexicalUUID.new(json.fetch('id')), 
		     name: json.fetch('name')
	end
    end
end
