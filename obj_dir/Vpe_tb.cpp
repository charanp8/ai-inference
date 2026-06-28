// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Model implementation (design independent parts)

#include "Vpe_tb__pch.h"

//============================================================
// Constructors

Vpe_tb::Vpe_tb(VerilatedContext* _vcontextp__, const char* _vcname__)
    : VerilatedModel{*_vcontextp__}
    , vlSymsp{new Vpe_tb__Syms(contextp(), _vcname__, this)}
    , rootp{&(vlSymsp->TOP)}
{
    // Register model with the context
    contextp()->addModel(this);
}

Vpe_tb::Vpe_tb(const char* _vcname__)
    : Vpe_tb(Verilated::threadContextp(), _vcname__)
{
}

//============================================================
// Destructor

Vpe_tb::~Vpe_tb() {
    delete vlSymsp;
}

//============================================================
// Evaluation function

#ifdef VL_DEBUG
void Vpe_tb___024root___eval_debug_assertions(Vpe_tb___024root* vlSelf);
#endif  // VL_DEBUG
void Vpe_tb___024root___eval_static(Vpe_tb___024root* vlSelf);
void Vpe_tb___024root___eval_initial(Vpe_tb___024root* vlSelf);
void Vpe_tb___024root___eval_settle(Vpe_tb___024root* vlSelf);
void Vpe_tb___024root___eval(Vpe_tb___024root* vlSelf);

void Vpe_tb::eval_step() {
    VL_DEBUG_IF(VL_DBG_MSGF("+++++TOP Evaluate Vpe_tb::eval_step\n"); );
#ifdef VL_DEBUG
    // Debug assertions
    Vpe_tb___024root___eval_debug_assertions(&(vlSymsp->TOP));
#endif  // VL_DEBUG
    vlSymsp->__Vm_deleter.deleteAll();
    if (VL_UNLIKELY(!vlSymsp->__Vm_didInit)) {
        vlSymsp->__Vm_didInit = true;
        VL_DEBUG_IF(VL_DBG_MSGF("+ Initial\n"););
        Vpe_tb___024root___eval_static(&(vlSymsp->TOP));
        Vpe_tb___024root___eval_initial(&(vlSymsp->TOP));
        Vpe_tb___024root___eval_settle(&(vlSymsp->TOP));
    }
    VL_DEBUG_IF(VL_DBG_MSGF("+ Eval\n"););
    Vpe_tb___024root___eval(&(vlSymsp->TOP));
    // Evaluate cleanup
    Verilated::endOfEval(vlSymsp->__Vm_evalMsgQp);
}

//============================================================
// Events and timing
bool Vpe_tb::eventsPending() { return !vlSymsp->TOP.__VdlySched.empty(); }

uint64_t Vpe_tb::nextTimeSlot() { return vlSymsp->TOP.__VdlySched.nextTimeSlot(); }

//============================================================
// Utilities

const char* Vpe_tb::name() const {
    return vlSymsp->name();
}

//============================================================
// Invoke final blocks

void Vpe_tb___024root___eval_final(Vpe_tb___024root* vlSelf);

VL_ATTR_COLD void Vpe_tb::final() {
    Vpe_tb___024root___eval_final(&(vlSymsp->TOP));
}

//============================================================
// Implementations of abstract methods from VerilatedModel

const char* Vpe_tb::hierName() const { return vlSymsp->name(); }
const char* Vpe_tb::modelName() const { return "Vpe_tb"; }
unsigned Vpe_tb::threads() const { return 1; }
void Vpe_tb::prepareClone() const { contextp()->prepareClone(); }
void Vpe_tb::atClone() const {
    contextp()->threadPoolpOnClone();
}

//============================================================
// Trace configuration

VL_ATTR_COLD void Vpe_tb::trace(VerilatedVcdC* tfp, int levels, int options) {
    vl_fatal(__FILE__, __LINE__, __FILE__,"'Vpe_tb::trace()' called on model that was Verilated without --trace option");
}
