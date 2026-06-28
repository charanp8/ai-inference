// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vpe_tb.h for the primary calling header

#include "Vpe_tb__pch.h"
#include "Vpe_tb__Syms.h"
#include "Vpe_tb___024root.h"

#ifdef VL_DEBUG
VL_ATTR_COLD void Vpe_tb___024root___dump_triggers__act(Vpe_tb___024root* vlSelf);
#endif  // VL_DEBUG

void Vpe_tb___024root___eval_triggers__act(Vpe_tb___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vpe_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vpe_tb___024root___eval_triggers__act\n"); );
    // Body
    vlSelf->__VactTriggered.set(0U, ((IData)(vlSelf->pe_tb__DOT__clk) 
                                     & (~ (IData)(vlSelf->__Vtrigprevexpr___TOP__pe_tb__DOT__clk__0))));
    vlSelf->__VactTriggered.set(1U, vlSelf->__VdlySched.awaitingCurrentTime());
    vlSelf->__Vtrigprevexpr___TOP__pe_tb__DOT__clk__0 
        = vlSelf->pe_tb__DOT__clk;
#ifdef VL_DEBUG
    if (VL_UNLIKELY(vlSymsp->_vm_contextp__->debug())) {
        Vpe_tb___024root___dump_triggers__act(vlSelf);
    }
#endif
}
