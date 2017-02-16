require_relative "../linked_list"
require 'pry'

describe LinkedList do
	let (:list) { LinkedList.new }
	let(:node1) { Node.new("a") }
	let(:node2) { Node.new("b") }
	let(:node3) { Node.new("c") }

	it 'instantiates an LinkedList object' do
		expect(list).to be_an_instance_of(LinkedList)
	end

	describe '#insert_first' do
		it 'adds the given node to the front of an empty list' do
		  list.insert_first(node1)
		  expect(list.first).to be node1
		  expect(list.last).to be node1
		end

		it 'adds the given node to the front of a non-empty list' do
		  list.insert_first(node1)
		  list.insert_first(node2)
		  expect(list.first).to be node2
		  expect(list.last).to be node1
		end
	end

	describe '#remove_first' do
		it 'removes only one node' do
		  list.insert_first(node1)
		  list.remove_first
		  expect(list.first).to be nil
		  expect(list.last).to be nil
		end

		it 'removes the first node in a list with multiple items' do
		  list.insert_first(node1)
		  list.insert_first(node2)
		  list.remove_first
		  expect(list.first).to be node1
		  expect(list.last).to be node1
		end
	end

	describe '#insert_last' do
	  it 'inserts a node at the end of an empty list' do
	  	list.insert_last(node1)
	  	expect(list.last).to be node1
	  	expect(list.first).to be node1
	  end
	  it 'inserts a node at the end of a list with items' do
	  	list.insert_last(node1)
	  	list.insert_last(node2)
	  	list.insert_last(node3)
	  	expect(list.last).to be node3
	  	expect(list.first).to be node1
	  	expect(node1.next).to be node2
	  end
	end

	describe '#remove_last' do
	  it 'removes only one node' do
	  	list.insert_last(node1)
	  	list.remove_last
	  	expect(list.first).to be nil
	  	expect(list.last).to be nil
	  end

	  it 'removes the last node in a list with multiple nodes' do
	    list.insert_last(node2)
	    list.insert_last(node3)
	    list.insert_last(node1)
	  	list.remove_last
	  	expect(list.first).to be node2
	  	expect(list.last).to be node3
	  	expect(list.first.next).to be node3
	  	expect(list.last.next).to be nil
	  end
	end

	describe '#get' do
      it 'gets the node at the index given' do
      	list.insert_last(node2)
	    list.insert_last(node3)
	    list.insert_last(node1)

	    expect(list.get(0)).to be node2
	    expect(list.get(1)).to be node3
	    expect(list.get(2)).to be node1

	    list.remove_last
	    expect(list.get(1)).to be node3

	    list.remove_first
	    expect(list.get(0)).to be node3
      end
	end

	describe '#set' do
	  it 'changes the value of the node at the index given' do

	  	list.insert_first(node2)
	    list.insert_last(node3)
	    list.insert_last(node1)

	    expect{list.set(0, "k")}.to change{ node2.element }.from("b").to("k")
	    expect(list.first).to be node2

	    list.remove_last

	    expect{list.set(1, 78)}.to change{ node3.element }.from("c").to(78)
	    expect(list.last).to be node3
	  end
	end

	describe '#insert' do
	  it 'inserts new nodes at the index given' do
	  	list.insert_first(node2)
	    list.insert_last(node3)
	    list.insert_last(node1)

	    list.insert(1, "hello")
	    expect(list.get(1).element).to eq "hello"
	    expect(list.get(1).next).to be node3

	    list.insert(3, 33)
	    expect(list.get(3).element).to eq 33
	    expect(list.get(3).next).to be node1
	    expect(list.get(4)).to be node1
	    expect(list.last).to be node1
	    expect(list.size).to eq 5
	  end
	end

	describe '#size' do
	  it 'counts the size of the empty list' do
	  	expect(list.size).to be 0
	  end

	  it 'counts the size of the list with nodes' do
	    list.insert_last(node2)
	    list.insert_last(node3)
	    list.insert_last(node1)
	  	expect(list.size).to be 3
	  end
    end

end
