require_relative "../queue.rb"

describe Queue do
  let(:queue) { MyQueue.new }	
  let(:element_a) { "aaa" }
  let(:element_b) { "bbb" }
  let(:element_c) { "ccc" }
  
  it "instantiates a MyQueue object" do
    expect(queue).to be_an_instance_of MyQueue
  end

  describe "#enqueue" do
    it "adds an element to the back of the queue" do
      queue.enqueue(element_b)
      expect(queue.peel.element).to be element_b
      queue.enqueue(element_a)
      expect(queue.peel.element).to be element_b
      queue.enqueue(element_c)
      expect(queue.peel.element).to be element_b
    end
  end

  describe "#dequeue" do
    it "removes and returns an element from the front of the queue" do
      queue.enqueue(element_b)
      queue.enqueue(element_a)
      queue.enqueue(element_c)
      q = queue.dequeue.element
      expect(q).to be element_b
      q = queue.dequeue.element
      expect(q).to be element_a
      queue.enqueue(element_b)
      q = queue.dequeue.element
      expect(q).to be element_c
    end
  end
  
  describe "#peel" do
    it "returns the first element of the queue" do
      queue.enqueue(element_b)
      queue.enqueue(element_a)
      queue.enqueue(element_c)
      expect(queue.peel.element).to be element_b
      queue.dequeue
      expect(queue.peel.element).to be element_a
    end
  end

  describe "#empty" do
    it "returns true if the queue is empty" do
      expect(queue.empty?).to eq true
      queue.enqueue(element_b)
      queue.enqueue(element_a)
      queue.enqueue(element_c)
      queue.dequeue
      queue.dequeue
      queue.dequeue
      expect(queue.empty?).to eq true
    end
    it "returns false if the queue is not empty" do
      queue.enqueue(element_b)
      queue.enqueue(element_a)
      queue.enqueue(element_c)
      expect(queue.peel.element).to be element_b
      queue.dequeue
      expect(queue.peel.element).to be element_a
    end
  end
end