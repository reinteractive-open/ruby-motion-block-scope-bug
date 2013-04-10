class YieldingConstructor
  def initialize(&block)
    # Without this line the app will seg fault when self is yielded to
    # the block. The crash seems to be caused by self being garbage
    # collected before the block is called, possibly it needs to be
    # retained in the closure scope of the block passed to BW::HTTP.get.
    #
    # You can uncomment it to toggle the behaviour.
    #
    # retain_self = self

    BW::HTTP.get("https://api.github.com/users/mattetti") do |response|
      block.call(self, response)
    end
  end
end

