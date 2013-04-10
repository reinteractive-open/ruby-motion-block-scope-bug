class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    YieldingConstructor.new do |object|
      NSLog "Response received"
      # Doing anything with object, which is actually the new YieldingConstructor
      # object, causes a segfault because it seems to have been garbage collected
      # before the block is called.
      #
      # It will sometimes work, but more often than not it crashes.
      NSLog object.to_s
    end

    true
  end
end
