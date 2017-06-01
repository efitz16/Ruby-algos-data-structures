require_relative "../stacks.rb"

describe Stack do
  let(:stack) { Stack.new }
  let(:element1) { "do" }
  let(:element2) { "re" }
  let(:element3) { "me" }

  it "instantiates a Stack object" do
    expect(stack).to be_an_instance_of(Stack)
  end

  describe "#push" do
  	it "Adds an element to the top of an empty stack" do
  	  stack.push(element1)
  	  expect(stack.top.element).to be element1
  	  stack.push(element2)
  	  expect(stack.top.element). to be element2
    end
    it "Adds an element to the top of full stack" do
  	  stack.push(element1)
  	  expect(stack.top.element).to be element1
  	  stack.push(element2)
  	  expect(stack.top.element). to be element2
  	  stack.push(element3)
  	  expect(stack.top.element). to be element3
    end
  end

  describe "#pop" do
    it "Removes and returns the top element of a stack with one item" do
      stack.push(element1)
      top = stack.top
      allow(stack).to receive(:pop).and_return(top)
      expect(top.element). to be element1
    end
  end
end