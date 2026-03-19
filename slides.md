---
theme: ./theme
title: The Adaptive Fractional State of Visual Cortex
author: Brendan Harris
info: |
  Anomalous Dynamics in Neural Circuits
  School of Physics, The University of Sydney
fonts:
  sans: Arial
  mono: JuliaMono
colorSchema: dark
aspectRatio: 16/9
canvasWidth: 980
transition: slide-left
---

# The Adaptive Fractional Regime of Visual Cortex

**Brendan Harris & Pulin Gong**

School of Physics<br>The University of Sydney

<div style="position: absolute; bottom: 32px; left: 40px; font-size: 0.8em;">

[brendanjohnharris.github.io/WorkingRegimeSlides](https://brendanjohnharris.github.io/WorkingRegimeSlides)

</div>

---

# What is the working regime of the visual cortex?

<div class="grid gap-8 mt-2" style="grid-template-columns: 6fr 6fr;">
<div>

<div style="background: #cccccc; color: #282c34; border-radius: 8px; padding: 8px 16px; display: inline-block; font-weight: bold; margin-bottom: 12px; margin-top: 12px;">Spontaneous activity is fluctuation-driven</div>

- Low firing rates (~1--10 Hz) <span class="dim-text">[[Barth & Poulet 2012](https://doi.org/10.1016/j.tins.2012.03.008)]</span>
- Sparse coding <span class="dim-text">[[Olshausen & Field 2004](https://doi.org/10.1016/j.conb.2004.07.007)]</span>
- Mean membrane potentials far from threshold <span class="dim-text">[[Carandini 2000](https://doi.org/10.1523/JNEUROSCI.20-01-00470.2000); [DeWeese & Zador 2006](https://doi.org/10.1523/jneurosci.2813-06.2006)]</span>

</div>
<div>


<div style="background: #cccccc; color: #282c34; border-radius: 8px; padding: 8px 16px; display: inline-block; font-weight: bold; margin-bottom: 12px; margin-top: 12px;">But also highly variable and non-stationary</div>

- Nested oscillations and $1/f$ <span class="dim-text">[[Poil et al. 2012](https://doi.org/10.1523/JNEUROSCI.5990-11.2012)]</span>
- Super-Poissonian spikes <span class="dim-text">[[Churchland et al. 2010](https://doi.org/10.1038/nn.2501)]</span>
- Bumpy synaptic inputs <span class="dim-text">[[Okun & Lampl 2008](https://doi.org/10.1038/nn.2105)]</span>

</div>
</div>

<img src="/.figures/brain_trace.svg" class="w-full max-h-52" style="margin-top: 12px;" />

<!-- <div class="dim-text text-sm mt-1">Allen Institute Neuropixels dataset — 53 sessions, 36 mice, 6 visual areas</div> -->

<!-- <div class="big-question mt-2">How do we understand the origin of these dynamics?</div> -->

---

# Classical model: balanced-state network

<div class="grid grid-cols-2 gap-8 mt-2">
<div>

**Balanced E/I populations** can produce the fluctuation-driven regime <span class="dim-text">[[van Vreeswijk & Sompolinsky 1996](https://doi.org/10.1126/science.274.5293.1724)]</span>

**Mean-field theory** treats summed E/I input as a stochastic process <span class="dim-text">[[Brunel 2000](https://doi.org/10.1023/A:1008925309027)]</span>:
- E and I inputs cancel on average
- Spiking is driven by fluctuations alone
<!-- - Population oscillations from E-I feedback appear in input traces -->
<!-- ; [Wardak & Gong 2021](https://doi.org/10.1103/PhysRevResearch.3.013083)] -->

<div class="block mt-4">
<div class="block-title">Classical mean-field Langevin-like Equation</div>

$$\frac{dV}{dt} = f(V) + \eta\,\xi(t)$$

where $\xi(t)$ is white (or OU) Gaussian noise.
</div></div>

<img src="/.figures/mean_field.svg" class="w-full max-h-100" style="margin-top: 12px;" />

</div>

---

# Dynamical exponents

<!-- The choice of Gaussian noise **is not neutral** — it locks in specific dynamical exponents -->

<div class="grid grid-cols-2 gap-4">
<div class="block">
<div class="block-title">Diffusion</div>

MAD (width of probability density) expands $\propto \tau^a$ with $a = 0.5$

</div>
<div class="block">
<div class="block-title">Spectral</div>

PSD $\propto f^b$ with $b = -2$, indicating local temporal correlations

</div>
</div>

<div class="alert-text mt-2">But experiment and circuit models show anomalous exponents that contradict these values</div>

<img src="/.figures/experiment_circuit_statistics.svg" class="w-full" style="margin-top: auto;" />

---

# How do we capture anomalous dynamics?

<div class="text-center mt-6">



<div style="font-size: 2em;">

**Bi-fractional mean-field input**

$${}^C\!D_t^{\textcolor{#DC143C}{\beta}}\, x = -\eta\,\nabla \tilde{V}_{\textcolor{#6495ED}{\alpha}} + {\textcolor{#EF9901}{\gamma}}\, p + \eta^{1/{\textcolor{#6495ED}{\alpha}}}\,\xi_{{\textcolor{#6495ED}{\alpha}},{\textcolor{#DC143C}{\beta}}}$$

$$\frac{dp}{dt} = -{\textcolor{#EF9901}{\gamma}}\,\nabla \tilde{V}_{\textcolor{#6495ED}{\alpha}}$$

</div>

</div>

<div class="grid grid-cols-3 gap-6 mt-4">
<div class="block">
<div class="block-title cornflowerblue">

$\textcolor{#6495ED}{\alpha}$ — Space-fractional order

</div>

Heavy-tailed jumps → superdiffusion

</div>
<div class="block">
<div class="block-title crimson">

$\textcolor{#DC143C}{\beta}$ — Time-fractional order

</div>

Power-law memory → long-range correlations

</div>
<div class="block">
<div class="block-title california">

$\textcolor{#EF9901}{\gamma}$ — Momentum coupling

</div>

Local oscillations

</div>
</div>

---

# What do fractional derivatives do?



<div class="grid gap-8 mt-4" style="grid-template-columns: 7fr 5fr;">

<div class="flex justify-right my-4">
  <img src=".figures/fractional_summary.svg" alt="Fractional derivatives summary" style="max-width: 100%; height: auto;" />
</div>

<div>

<div class="text-xs mt-12">

| | **Space-fractional** $\alpha$ | **Time-fractional** $\beta$ |
| --- | --- | --- |
| **Classical limit** | $\textcolor{#6495ED}{\alpha} = 2$: Gaussian | $\textcolor{#DC143C}{\beta} = 1$: finite memory |
| **Fractional regime** | $1 < \textcolor{#6495ED}{\alpha} < 2$ | $0 < \textcolor{#DC143C}{\beta} < 1$ |
| **Drift effect** | Effective potential with steep walls | Caputo derivative produces power-law relaxation|
| **Diffusion effect** | Stable distribution produces large jumps, promotes superdiffusion | Long-range memory flattens power spectrum, promotes subdiffusion |

</div>

</div>
<div>

</div>
</div>




---

# bFNS: tunable diffusion and spectral exponents

<div class="grid gap-8 mt-4 items-center" style="grid-template-columns: 5fr 3fr;">
<div>
<div class="flex justify-center mt-4">
  <img src=".figures/model_summary.svg" alt="Model summary" style="max-width: 100%; height: auto;" />
</div>

</div>
<div class="mt--3 tight-list" style="font-size: 0.9em;">

**Diffusion exponent $a$** depends on $\textcolor{#6495ED}{\alpha}$ and $\textcolor{#DC143C}{\beta}$
- $\textcolor{#6495ED}{\alpha} \downarrow \textrm{pushes } a \uparrow$ (superdiffusive)
- $\textcolor{#DC143C}{\beta} \downarrow \textrm{pushes } a \downarrow$ (subdiffusive)

<br>

**Spectral exponent $b$** is only sensitive to $\textcolor{#DC143C}{\beta}$
- $\textcolor{#DC143C}{\beta} \downarrow \textrm{pushes } b \uparrow$ (more long-range temporal dependencies)

<br>

$\textcolor{#EF9901}{\gamma}$ adds oscillatory peak

<br>

**Experimental targets:**
- $b \approx -1.7 \to \textcolor{#6495ED}{\alpha} \approx 1.5$
- $a \approx 0.6 \to \textcolor{#DC143C}{\beta} \approx 0.85$

</div>
</div>

---

# bFNS an an empirical mean field

<div class="mt-2">

<div class="grid grid-cols-3 gap-4 mt-0 text-sm">
<div class="block">

$\textcolor{#6495ED}{\alpha}$ superdiffusion enhances fluctuation-driven regime (lower mean $V$ for a given firing rate)

</div>
<div class="block">

$\textcolor{#DC143C}{\beta}$ memory increases firing-rate variability and produces power-law Fano factor scaling................add fano factor for experiment here.................

</div>
<div class="block">

$\textcolor{#EF9901}{\gamma}$ momentum adds subthreshold oscillations, tempering Fano factor scaling

</div>
</div>

</div>

<div class="flex justify-center mt-0" style="margin-left: -4rem; margin-right: -2rem;">
  <img src=".figures/mean_field_sweep.svg" alt="Mean field sweep" style="width: 90%; height: auto;" />
</div>


---

# Summary: the adaptive fractional state

<div class="grid grid-cols-3 gap-6 mt-6 text-center">
<div class="block">
<div class="block-title">Experiment + circuit model</div>

Visual cortex shows anomalous scaling:

$a > 0.5$ | $b > -2$ | $c > 0$

<div class="dim-text text-sm mt-2">Inconsistent with Gaussian mean-field</div>

</div>
<div class="block">
<div class="block-title">bFNS model</div>

Fractional calculus gives tunable exponents:

<span class="cornflowerblue">$\textcolor{#6495ED}{\alpha}$</span> superdiffusion <br> <span class="crimson">$\textcolor{#DC143C}{\beta}$</span> long-range memory <br> <span class="california">$\textcolor{#EF9901}{\gamma}$</span> oscillations

<div class="dim-text text-sm mt-2">Independent control over anomalous dynamics</div>

</div>
<div class="block">
<div class="block-title">Functional implication</div>

Competition between superdiffusion and subdiffusion:

<span class="highlight">Exploration</span> vs <span class="highlight">Exploitation</span>

<div class="dim-text text-sm mt-2">Navigates the flexibility–stability trade-off</div>

</div>
</div>

<div class="mt-8 text-center">

bFNS provides a mechanistic bridge between anomalous **circuit dynamics** and **population statistics**

</div>

---

<div class="grid grid-cols-3 gap-6">
<div class="col-span-2"><h1>Future directions</h1></div>
<div class="text-right"><h1>Thank you!</h1></div>
</div>

<div class="grid grid-cols-3 gap-6 mt-2 text-sm">
<div class="col-span-2">

<div class="block"><div class="block-title">Saccadic eye movements</div>
<span class="dim-text">Jude Metcalf</span> — Heavy-tailed saccade dynamics modelled via bFNS
</div>

<div class="block"><div class="block-title">Decision making</div>
<span class="dim-text">Aiden Sloots</span> — Fractional drift-diffusion with heavy tails and memory
</div>

<div class="block"><div class="block-title">Hierarchical exponents</div>
Exponent variation across visual areas, layers, and E/I balance
</div>

<div class="block"><div class="block-title">
Theta--gamma coupling</div>
<span class="dim-text">Jude Metcalf</span> -- Interactions between adaptation and momentum
</div>


<div class="block"><div class="block-title">Machine learning and sampling efficiency</div>
Bayesian inference via heavy-tailed, memory-driven sampling
</div>

</div>
<div class="flex flex-col items-center justify-start text-center">


<div class="mt--5 text-sm">


**Brendan Harris** & Pulin Gong



School of Physics, University of Sydney

</div>

<!-- <img src="/.figures/logo.svg" class="w-32 mt-4" /> -->
<div class="mt-0 text-xs flex flex-col gap-2 items-start">
<a href="mailto:brendan.harris@sydney.edu.au" class="flex items-center gap-2 !border-none"><carbon-email class="w-4 h-4 inline" /> brendan.harris@sydney.edu.au</a>
<a href="https://github.com/brendanjohnharris" class="flex items-center gap-2 !border-none"><carbon-logo-github class="w-4 h-4 inline" /> brendanjohnharris</a>
<a href="https://bsky.app/profile/brendanjohnharris.bsky.social" class="flex items-center gap-2 !border-none"><carbon-logo-bluesky class="w-4 h-4 inline" /> @brendanjohnharris</a>
<br>
</div>

<img src="/.figures/link.svg" class="mt--1 w-55" />
<a href="https://brendanjohnharris.github.io/WorkingRegimeSlides/" class="">Slide deck</a>

</div>
</div>

---
layout: center
class: supplementary
---

# Supplementary slides

---
class: supplementary
---

# S1: exponent variation across hierarchy

Diffusion, spectral, and variability exponents across layers and areas

<div class="figure-placeholder mt-4" style="min-height: 200px;">

Figure: Exponents across cortical layers and visual areas

</div>

- Trend toward decreased diffusion exponent in layer 2/3 across hierarchy
- Higher areas show spectral exponents closer to $-1.5$
- Variability exponent increases in higher areas

---
class: supplementary
---

# S2: input distribution parameters

Distribution of stable distribution parameters across neurons

<div class="figure-placeholder mt-4" style="min-height: 200px;">

Figure: Stable distribution parameters across neurons

</div>

- Tail index $\approx 1.5$
- Skewness $\approx 0$ (symmetric)
- Scale and location parameters vary across neurons

---
class: supplementary
---

# S3: sampling accuracy

bFNS maintains accurate sampling across parameter space

<div class="grid grid-cols-2 gap-8 mt-4">
<div class="text-center">

**Unimodal potential**

<div class="figure-placeholder" style="min-height: 150px;">Accuracy heatmap</div>

</div>
<div class="text-center">

**Bimodal potential**

<div class="figure-placeholder" style="min-height: 150px;">Accuracy heatmap</div>

</div>
</div>

<div class="dim-text text-center mt-4">Low Wasserstein distance between target and empirical distributions</div>

---
class: supplementary
---

# S4: circuit model parameters

<div class="grid grid-cols-2 gap-8 text-sm">
<div>

**Neuron parameters**
- $C = 0.25$ nF
- $g_L^E = 0.0167$ μS
- $V_L = -70$ mV
- $V_{\mathrm{th}} = -50$ mV
- $\tau_K = 40$ ms
- $\Delta g_K = 0.002$ μS

**Synaptic parameters**
- $\tau_r^E = 1.0$ ms
- $\tau_d^E = 5.0$ ms
- $V_E = 0$ mV
- $V_I = -80$ mV

</div>
<div>

**Connectivity**
- $\rho = 20000$ /mm²
- $L = 0.5$ mm
- E:I ratio $= 4$
- $\eta_{EE} = 0.06$ mm
- $K_{EE} = 260$
- $J_{EE} = 0.00105$ μS

**External input**
- $\nu_{\mathrm{ext}} = 10$ Hz
- $n_{\mathrm{ext}} = 100$

</div>
</div>
