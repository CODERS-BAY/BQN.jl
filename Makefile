test:
	julia -e 'using BQN; BQN.Tests.test_all()'

test0:
	julia -e 'using BQN; BQN.Tests0.test_all()'

gen0: BQN.jl/src/c.jl BQN.jl/src/r.jl

BQN.jl/src/%.jl:
	rm -f $@
	./cjl.bqn $(@:BQN.jl/src/%.jl=%) | sed -e 's/^quote/value = begin/g' > $@

