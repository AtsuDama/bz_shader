# bz_shader
Simple Belousov-Zhabotinsky(BZ) reaction simulator with shader on Processing.

## Screenshots
<img src = "img/example/example.gif" width = "300">

## Model
A simple model for BZ reaction has been proposed by A. Turner [1]. We assume that three chemical substances react following the chemical equations described below.

<p align = "center"><img src = "img/eq/eq_01.svg"></p>

<p align = "center"><img src = "img/eq/eq_02.svg"></p>

<p align = "center"><img src = "img/eq/eq_03.svg"></p>

where _α_, _β_, and _γ_ denote the rate constants of the chemical reactions, respectively. The concentrations of the substances at _t_ + 1, _a_<sub>_t_+1</sub>, _b_<sub>_t_+1</sub>, and _c_<sub>_t_+1</sub> are expressed by those at _t_, _a_<sub>_t_</sub>, _b_<sub>_t_</sub>, and _c_<sub>_t_</sub>.

<p align = "center"><img src = "img/eq/eq_04.svg"></p>

<p align = "center"><img src = "img/eq/eq_05.svg"></p>

<p align = "center"><img src = "img/eq/eq_06.svg"></p>


## References
[1] A. Turner, A Simple Model of the Belousov-Zhabotinsky Reaction from First Principles, 2009
