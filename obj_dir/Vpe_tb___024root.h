// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design internal header
// See Vpe_tb.h for the primary calling header

#ifndef VERILATED_VPE_TB___024ROOT_H_
#define VERILATED_VPE_TB___024ROOT_H_  // guard

#include "verilated.h"
#include "verilated_timing.h"


class Vpe_tb__Syms;

class alignas(VL_CACHE_LINE_BYTES) Vpe_tb___024root final : public VerilatedModule {
  public:

    // DESIGN SPECIFIC STATE
    CData/*0:0*/ pe_tb__DOT__clk;
    CData/*7:0*/ pe_tb__DOT__weight_in;
    CData/*7:0*/ pe_tb__DOT__activation_in;
    CData/*0:0*/ pe_tb__DOT__flush_accum;
    CData/*0:0*/ __Vtrigprevexpr___TOP__pe_tb__DOT__clk__0;
    CData/*0:0*/ __VactContinue;
    SData/*15:0*/ pe_tb__DOT__instance1__DOT__temp;
    IData/*31:0*/ pe_tb__DOT__partial_sum_in;
    IData/*31:0*/ pe_tb__DOT__partial_sum_out;
    IData/*31:0*/ __VactIterCount;
    VlDelayScheduler __VdlySched;
    VlTriggerVec<2> __VactTriggered;
    VlTriggerVec<2> __VnbaTriggered;

    // INTERNAL VARIABLES
    Vpe_tb__Syms* const vlSymsp;

    // CONSTRUCTORS
    Vpe_tb___024root(Vpe_tb__Syms* symsp, const char* v__name);
    ~Vpe_tb___024root();
    VL_UNCOPYABLE(Vpe_tb___024root);

    // INTERNAL METHODS
    void __Vconfigure(bool first);
};


#endif  // guard
