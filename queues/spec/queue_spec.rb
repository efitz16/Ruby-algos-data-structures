require_relative "../queue.rb"

describe Queue do
  let(:queue) { Queue.new }	
  let(:element_a) { "aaa" }
  let(:element_a) { "bbb" }
  let(:element_a) { "ccc" }
  
  it "instantiates a Queue object" do
    expect(queue).to be_an_instance_of Stack
  end
end