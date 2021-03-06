require_relative "../linked_list"

describe LinkedList do
	let (:list) { LinkedList.new }
	let(:node1) { "a" }
	let(:node2) { "b" }
	let(:node3) { "c" }

	it 'instantiates an LinkedList object' do
		expect(list).to be_an_instance_of(LinkedList)
	end

	describe '#insert_first' do
		it 'adds the given element to the front of an empty list' do
		  list.insert_first(node1)
		  expect(list.first.element).to be node1
		  expect(list.last.element).to be node1
		end

		it 'adds the given element to the front of a non-empty list' do
		  list.insert_first(node1)
		  list.insert_first(node2)
		  expect(list.first.element).to be node2
		  expect(list.last.element).to be node1
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
		  expect(list.first.element).to be node1
		  expect(list.last.element).to be node1
		end
	end

	describe '#insert_last' do
	  it 'inserts an element at the end of an empty list' do
	  	list.insert_last(node1)
	  	expect(list.last.element).to be node1
	  	expect(list.first.element).to be node1
	  end
	  it 'inserts an element at the end of a list with items' do
	  	list.insert_last(node1)
	  	list.insert_last(node2)
	  	list.insert_last(node3)
	  	expect(list.last.element).to be node3
	  	expect(list.first.element).to be node1
	  	expect(list.first.next.element).to be node2
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
	  	expect(list.first.element).to be node2
	  	expect(list.last.element).to be node3
	  	expect(list.first.next.element).to be node3
	  	expect(list.last.next).to be nil
	  end
	end

	describe '#get' do
      it 'gets the node at the index given' do
      	list.insert_last(node2)
	    list.insert_last(node3)
	    list.insert_last(node1)

	    expect(list.get(0).element).to be node2
	    expect(list.get(1).element).to be node3
	    expect(list.get(2).element).to be node1

	    list.remove_last
	    expect(list.get(1).element).to be node3

	    list.remove_first
	    expect(list.get(0).element).to be node3
      end

      it "should raise an error if try to retrieve index that's out-of-bounds" do
		expect { list.get(787) }.to raise_exception(OutOfBoundsException)
	  end
	end

	describe '#set' do
	  it "should raise an error if try to set an index that's out-of-bounds" do
	    expect { list.set(787, "l") }.to raise_exception(OutOfBoundsException)
	  end
	  it 'changes the value of the node at the index given' do

	  	list.insert_first(node2)
	    list.insert_last(node3)
	    list.insert_last(node1)
	    original_first_node = list.first 
	    original_second_node = list.first.next
	    original_last_node = list.last

	    expect{ list.set(0, "k") }.to change{ list.get(0).element }.from("b").to("k")
	    expect(list.first).to be original_first_node

	    list.remove_last

	    expect{list.set(1, 78)}.to change{ list.get(1).element }.from("c").to(78)
	    expect(list.last).to be original_second_node
	  end
	end

	describe '#insert' do
	  it "should raise an error if try to insert into index that's out-of-bounds" do
	    expect { list.insert(787, "meow") }.to raise_exception(OutOfBoundsException)
	  end
	  it 'inserts new nodes at the index given' do
	  	list.insert_first(node2)
	    list.insert_last(node3)
	    list.insert_last(node1)
	    original_first_node = list.first 
	    original_second_node = list.first.next
	    original_last_node = list.last

	    list.insert(1, "hello")
	    expect(list.get(1).element).to eq "hello"
	    expect(list.get(1).next).to be original_second_node

	    list.insert(3, 33)
	    expect(list.get(3).element).to eq 33
	    expect(list.get(3).next).to be original_last_node
	    expect(list.get(4)).to be original_last_node
	    expect(list.last).to be original_last_node
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
