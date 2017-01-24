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
	end
end