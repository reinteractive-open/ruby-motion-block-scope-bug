This is a Ruby Motion application that demonstrates a Ruby Motion bug
in which a reference to ``self`` is not retained by the closure scope
of a block. If ``self`` is then yielded to another block it results
in a seg fault and the application crashes.

