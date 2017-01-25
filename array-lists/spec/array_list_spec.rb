require_relative "../array_list"
require "pry"

describe ArrayList do
	let(:array_list) { ArrayList.new(5) }

	it 'instantiates an ArrayList object' do
		expect(array_list).to be_an_instance_of(ArrayList)
	end

	describe '#length' do
		it "returns the length of the array" do
			expect(array_list.length).to be 5
		end
	end

	describe '#add' do
        it "returns the added element" do
        	expect(array_list.add(78)).to be 78
    	end

		it "adds a given element to the end of a list" do
			array_list.add(78)
			expect(array_list.get(array_list.length-1)).to eq(78)
		end

		it "increases the length by one" do
			array_list.add(78)
			expect(array_list.length).to be(6)
		end
	end

	describe '#get' do
		it "returns the element at a given index" do
			array_list.add("hello")

			expect(array_list.get(5)).to eq "hello"
			expect(array_list.get(0)).to be nil
		end

		it "raises an error if try to set index that's out-of-bounds" do
			expect { array_list.get(6) }.to raise_error(OutOfBoundsException)
		end
	end

	describe '#set' do
		it "changes a given index to a given element" do
		  expect { array_list.set(0, "7") }.to change { array_list.get(0) }.to "7" 
		end

		it "shoud raise an error if try to set index that's out-of-bounds" do
			expect { array_list.set(77, 8) }.to raise_error(OutOfBoundsException)
		end
	end

	describe '#insert' do
		before(:example) do
			array_list.set(3, "9")
			@el = array_list.get(3)
			array_list.insert(3, "mellow")
		end

		describe "initialized in before(:example)" do
			it "inserts a given element at a given index" do
				expect(array_list.get(3)).to eq "mellow"
			end
	
			it "moves the previous element that was at that index to the next index" do
				expect(array_list.get(4)).to eq @el
			end
	
			it "increases the length by one" do
				expect(array_list.length).to eq(6)
			end
		end
	end
end