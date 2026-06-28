#include <verilated.h>
#include "Vpe_tb.h"

int main(int argc, char** argv) {
    Verilated::commandArgs(argc, argv);
    Vpe_tb* top = new Vpe_tb();

    while (!Verilated::gotFinish()) {
        top->eval();
    }

    delete top;
    return 0;
}
