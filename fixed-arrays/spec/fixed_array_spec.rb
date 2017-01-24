require_relative "../fixed_array"

describe FixedArray do
	let(:array) { FixedArray.new(5) }

	describe '#get' do
		it 'can be seen in entirety' do
			expect(array.array).to eq [nil, nil, nil, nil, nil]
		end

		it 'can retrieve a specific index' do
			expect(array.get(3)). to eq nil
		end

		it "should raise an error if try to retrieve index that's out-of-bounds" do
			expect { array.get(787) }.to raise_exception(OutOfBoundsException)
		end
	end

	describe "#set" do
		it "changes to given element at a specified index" do
			expect { array.set(2, 4) }.to change { array.array[2]}.to 4
		end

		it "shoud raise an error if try to set index that's out-of-bounds" do
			expect { array.set(77, 8) }.to raise_error(OutOfBoundsException)
		end
	end
end