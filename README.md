Single PE:

8-bit weights × 8-bit activations → 16-bit multiply
32-bit accumulator
2-stage pipeline
Weight storage with load_weight control
Systolic dataflow (weights down, activations/partials right)
4×4 Array:

16 PEs in a 2D grid
Can compute a 4×4 matrix multiply in parallel
All PEs clock together (synchronous)

CONTROLLER SEQUENCING:

Phase 1 (4 cycles): load_weight=1, feed weight_in[0:3] per cycle, weights propagate down
Phase 2 (6+ cycles): load_weight=0, flush_accum=0, stream activation_in[0:3] per cycle
Phase 3: Read partial_sum_out from rightmost column (4 × 32-bit per cycle)

I/O:

64-bit in (8-bit values)
128-bit out OR pack into 64-bit over 2 cycles (decide later)
Valid/ready handshake 

SRAM:

256KB single-port
64-bit data bus
Simple read/write interface (address, data, write_enable, read_enable)
