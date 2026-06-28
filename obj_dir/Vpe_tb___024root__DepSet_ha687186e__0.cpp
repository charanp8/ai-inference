// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vpe_tb.h for the primary calling header

#include "Vpe_tb__pch.h"
#include "Vpe_tb___024root.h"

VlCoroutine Vpe_tb___024root___eval_initial__TOP__Vtiming__0(Vpe_tb___024root* vlSelf);

void Vpe_tb___024root___eval_initial(Vpe_tb___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vpe_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vpe_tb___024root___eval_initial\n"); );
    // Body
    Vpe_tb___024root___eval_initial__TOP__Vtiming__0(vlSelf);
    vlSelf->__Vtrigprevexpr___TOP__pe_tb__DOT__clk__0 
        = vlSelf->pe_tb__DOT__clk;
}

VL_INLINE_OPT VlCoroutine Vpe_tb___024root___eval_initial__TOP__Vtiming__0(Vpe_tb___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vpe_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vpe_tb___024root___eval_initial__TOP__Vtiming__0\n"); );
    // Body
    vlSelf->pe_tb__DOT__clk = 0U;
    vlSelf->pe_tb__DOT__weight_in = 0U;
    vlSelf->pe_tb__DOT__activation_in = 0U;
    vlSelf->pe_tb__DOT__partial_sum_in = 0U;
    vlSelf->pe_tb__DOT__flush_accum = 0U;
    co_await vlSelf->__VdlySched.delay(1ULL, nullptr, 
                                       "pe_tb.sv", 
                                       37);
    vlSelf->pe_tb__DOT__clk = (1U & (~ (IData)(vlSelf->pe_tb__DOT__clk)));
    co_await vlSelf->__VdlySched.delay(1ULL, nullptr, 
                                       "pe_tb.sv", 
                                       37);
    vlSelf->pe_tb__DOT__clk = (1U & (~ (IData)(vlSelf->pe_tb__DOT__clk)));
    vlSelf->pe_tb__DOT__weight_in = 0x14U;
    vlSelf->pe_tb__DOT__activation_in = 0x14U;
    vlSelf->pe_tb__DOT__partial_sum_in = 0x64U;
    co_await vlSelf->__VdlySched.delay(1ULL, nullptr, 
                                       "pe_tb.sv", 
                                       47);
    vlSelf->pe_tb__DOT__clk = (1U & (~ (IData)(vlSelf->pe_tb__DOT__clk)));
    co_await vlSelf->__VdlySched.delay(1ULL, nullptr, 
                                       "pe_tb.sv", 
                                       47);
    vlSelf->pe_tb__DOT__clk = (1U & (~ (IData)(vlSelf->pe_tb__DOT__clk)));
    co_await vlSelf->__VdlySched.delay(1ULL, nullptr, 
                                       "pe_tb.sv", 
                                       47);
    vlSelf->pe_tb__DOT__clk = (1U & (~ (IData)(vlSelf->pe_tb__DOT__clk)));
    co_await vlSelf->__VdlySched.delay(1ULL, nullptr, 
                                       "pe_tb.sv", 
                                       47);
    vlSelf->pe_tb__DOT__clk = (1U & (~ (IData)(vlSelf->pe_tb__DOT__clk)));
    VL_WRITEF("Result: %10# (expected: 500)\n",32,vlSelf->pe_tb__DOT__partial_sum_out);
    VL_FINISH_MT("pe_tb.sv", 51, "");
}

void Vpe_tb___024root___eval_act(Vpe_tb___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vpe_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vpe_tb___024root___eval_act\n"); );
}

VL_INLINE_OPT void Vpe_tb___024root___nba_sequent__TOP__0(Vpe_tb___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vpe_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vpe_tb___024root___nba_sequent__TOP__0\n"); );
    // Body
    vlSelf->pe_tb__DOT__partial_sum_out = ((IData)(vlSelf->pe_tb__DOT__flush_accum)
                                            ? 0U : 
                                           ((IData)(vlSelf->pe_tb__DOT__instance1__DOT__temp) 
                                            + vlSelf->pe_tb__DOT__partial_sum_in));
    if ((1U & (~ (IData)(vlSelf->pe_tb__DOT__flush_accum)))) {
        vlSelf->pe_tb__DOT__instance1__DOT__temp = 
            (0xffffU & ((IData)(vlSelf->pe_tb__DOT__weight_in) 
                        * (IData)(vlSelf->pe_tb__DOT__activation_in)));
    }
}

void Vpe_tb___024root___eval_nba(Vpe_tb___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vpe_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vpe_tb___024root___eval_nba\n"); );
    // Body
    if ((1ULL & vlSelf->__VnbaTriggered.word(0U))) {
        Vpe_tb___024root___nba_sequent__TOP__0(vlSelf);
    }
}

void Vpe_tb___024root___timing_resume(Vpe_tb___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vpe_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vpe_tb___024root___timing_resume\n"); );
    // Body
    if ((2ULL & vlSelf->__VactTriggered.word(0U))) {
        vlSelf->__VdlySched.resume();
    }
}

void Vpe_tb___024root___eval_triggers__act(Vpe_tb___024root* vlSelf);

bool Vpe_tb___024root___eval_phase__act(Vpe_tb___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vpe_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vpe_tb___024root___eval_phase__act\n"); );
    // Init
    VlTriggerVec<2> __VpreTriggered;
    CData/*0:0*/ __VactExecute;
    // Body
    Vpe_tb___024root___eval_triggers__act(vlSelf);
    __VactExecute = vlSelf->__VactTriggered.any();
    if (__VactExecute) {
        __VpreTriggered.andNot(vlSelf->__VactTriggered, vlSelf->__VnbaTriggered);
        vlSelf->__VnbaTriggered.thisOr(vlSelf->__VactTriggered);
        Vpe_tb___024root___timing_resume(vlSelf);
        Vpe_tb___024root___eval_act(vlSelf);
    }
    return (__VactExecute);
}

bool Vpe_tb___024root___eval_phase__nba(Vpe_tb___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vpe_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vpe_tb___024root___eval_phase__nba\n"); );
    // Init
    CData/*0:0*/ __VnbaExecute;
    // Body
    __VnbaExecute = vlSelf->__VnbaTriggered.any();
    if (__VnbaExecute) {
        Vpe_tb___024root___eval_nba(vlSelf);
        vlSelf->__VnbaTriggered.clear();
    }
    return (__VnbaExecute);
}

#ifdef VL_DEBUG
VL_ATTR_COLD void Vpe_tb___024root___dump_triggers__nba(Vpe_tb___024root* vlSelf);
#endif  // VL_DEBUG
#ifdef VL_DEBUG
VL_ATTR_COLD void Vpe_tb___024root___dump_triggers__act(Vpe_tb___024root* vlSelf);
#endif  // VL_DEBUG

void Vpe_tb___024root___eval(Vpe_tb___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vpe_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vpe_tb___024root___eval\n"); );
    // Init
    IData/*31:0*/ __VnbaIterCount;
    CData/*0:0*/ __VnbaContinue;
    // Body
    __VnbaIterCount = 0U;
    __VnbaContinue = 1U;
    while (__VnbaContinue) {
        if (VL_UNLIKELY((0x64U < __VnbaIterCount))) {
#ifdef VL_DEBUG
            Vpe_tb___024root___dump_triggers__nba(vlSelf);
#endif
            VL_FATAL_MT("pe_tb.sv", 2, "", "NBA region did not converge.");
        }
        __VnbaIterCount = ((IData)(1U) + __VnbaIterCount);
        __VnbaContinue = 0U;
        vlSelf->__VactIterCount = 0U;
        vlSelf->__VactContinue = 1U;
        while (vlSelf->__VactContinue) {
            if (VL_UNLIKELY((0x64U < vlSelf->__VactIterCount))) {
#ifdef VL_DEBUG
                Vpe_tb___024root___dump_triggers__act(vlSelf);
#endif
                VL_FATAL_MT("pe_tb.sv", 2, "", "Active region did not converge.");
            }
            vlSelf->__VactIterCount = ((IData)(1U) 
                                       + vlSelf->__VactIterCount);
            vlSelf->__VactContinue = 0U;
            if (Vpe_tb___024root___eval_phase__act(vlSelf)) {
                vlSelf->__VactContinue = 1U;
            }
        }
        if (Vpe_tb___024root___eval_phase__nba(vlSelf)) {
            __VnbaContinue = 1U;
        }
    }
}

#ifdef VL_DEBUG
void Vpe_tb___024root___eval_debug_assertions(Vpe_tb___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vpe_tb__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vpe_tb___024root___eval_debug_assertions\n"); );
}
#endif  // VL_DEBUG
