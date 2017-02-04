require_relative "../linked_list"

describe LinkedList do
	let (:list) { LinkedList.new }
	let(:node1) { Node.new("a") }
	let(:node2) { Node.new("b") }
	let(:node3) { Node.new("c") }

	it 'instantiates an LinkedList object' do
		expect(list).to be_an_instance_of(LinkedList)
	end

	describe '#' do
		it ''
	end
end
