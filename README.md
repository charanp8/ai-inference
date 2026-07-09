Single PE:

8-bit weights × 8-bit activations → 16-bit multiply
32-bit accumulator
2-stage pipeline
Weight storage with load_weight control
Systolic dataflow (weights down, activations/partials right)

8×8 Array:

64 PEs in a 2D grid
Each row streams its own weight + activation, accumulates across columns
All PEs clock together (synchronous)

CONTROLLER SEQUENCING:

start must be pulsed for 1 cycle (not held high)
Phase 1 (9 cycles): load_weight=1 for cycles 1-8, feed weight_in[0:7] per cycle, weights propagate down
Phase 2 (11 cycles): flush_accum=1 on first cycle, then stream activation_in[0:7] per cycle
Phase 3: partial_sum_out (8×8 × 32-bit) is live the whole time, no separate read phase

I/O:

8×8-bit in (weight_in, wr_data)
8×8×32-bit out (partial_sum_out)
No valid/ready handshake, just a done flag

SRAM:

will be 256kb
