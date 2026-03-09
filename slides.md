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

# The Adaptive Fractional State of Visual Cortex

Brendan Harris, Pulin Gong

School of Physics, The University of Sydney

---

# What Is the Working Regime of the Visual Cortex?

This long-standing question has been studied extensively, both experimentally and theoretically

<div class="grid grid-cols-2 gap-8 mt-2">
<div>

Most neurons operate in a **fluctuation-driven regime**:
- Low firing rates (~1–10 Hz) <span class="dim-text">[Barth & Bhatt 2012]</span>
- Sparse coding <span class="dim-text">[Olshausen & Field 2004]</span>
- Mean membrane potentials far from threshold <span class="dim-text">[Carandini 2000; DeWeese & Zador 2006]</span>

But activity is also highly **variable and non-stationary**:
- Nested oscillations with $1/f$ spectral components <span class="dim-text">[Poil et al. 2012]</span>
- Super-Poissonian spike variability <span class="dim-text">[Churchland et al. 2010]</span>
- Heavy-tailed, correlated synaptic inputs <span class="dim-text">[Okun & Lampl 2008]</span>

</div>
<div>

<div class="figure-placeholder mt-4">

Figure: Brain schematic with Neuropixels probes + example LFP/spike traces

</div>

<div class="dim-text text-sm mt-2">Allen Institute Neuropixels dataset — 53 sessions, 36 mice, 6 visual areas</div>

</div>
</div>

<div class="big-question mt-4">How do we understand the origin of these dynamics?</div>

---

# Classical Models: Fluctuation-Driven E/I Networks

<div class="grid grid-cols-2 gap-8 mt-2">
<div>

**Balanced E/I networks** capture the fluctuation-driven regime <span class="dim-text">[van Vreeswijk & Sompolinsky 1996; Brunel 2000]</span>
- Excitatory and inhibitory inputs average near zero
- Spiking driven by fluctuations, not mean input
- Population oscillations from E-I feedback

**Mean-field reduction** approximates the network as a single neuron driven by stochastic input <span class="dim-text">[Brunel 2000; Wardak & Bhatt 2021]</span>

<div class="block mt-4">
<div class="block-title">Standard Mean-Field (Langevin Equation)</div>

$$\frac{dV}{dt} = f(V) + \sigma\,\xi(t)$$

<div class="dim-text">where $\xi(t)$ is white Gaussian noise</div>
</div>

</div>
<div>

<div class="figure-placeholder mt-4">

Figure: Circuit schematic — E/I network with mean-field reduction

</div>

</div>
</div>

---

# The Gaussian Assumption Fixes the Dynamics

The choice of Gaussian noise **is not neutral** — it locks in specific dynamical exponents

<div class="grid grid-cols-2 gap-6 mt-4">
<div>

<div class="block">
<div class="block-title">Gaussian predictions</div>

- Diffusion: MAD $\propto \tau^a$ with $a = 0.5$
- Spectral: PSD $\propto f^b$ with $b = -2$
- Variability: Fano factor $= 1$ at all timescales

<div class="dim-text mt-2">These are consequences, not free parameters</div>
</div>

<div class="alert-text mt-4">But experiment and circuit models show anomalous exponents that directly contradict these values</div>

</div>
<div>

<div class="grid grid-cols-2 gap-4">
<div>

<div class="figure-placeholder" style="min-height: 110px;">

Neuropixels MAD

</div>

<div class="text-center text-sm">$a = 0.6$</div>

</div>
<div>

<div class="figure-placeholder" style="min-height: 110px;">

Circuit model MAD

</div>

<div class="text-center text-sm">$a = 0.69$</div>

</div>
<div>

<div class="figure-placeholder" style="min-height: 110px;">

Neuropixels PSD

</div>

<div class="text-center text-sm">$b = -1.73$</div>

</div>
<div>

<div class="figure-placeholder" style="min-height: 110px;">

Circuit model PSD

</div>

<div class="text-center text-sm">$b = -1.83$</div>

</div>
</div>

</div>
</div>

---

# How Do We Capture These Anomalous Dynamics?

<div class="grid grid-cols-2 gap-8 mt-6">
<div>

**Classical mean-field:**

$$\frac{dV}{dt} = f(V) + \sigma\,\xi(t)$$

<div class="dim-text">Gaussian white noise → fixed exponents</div>
<div class="dim-text">$a = 0.5$, $b = -2$, FF $= 1$</div>

</div>
<div>

**Bi-fractional mean-field:**

$${}^C\!D_t^{\textcolor{#DC143C}{\beta}}\, x = -\eta\,\nabla \tilde{V}_{\textcolor{#6495ED}{\alpha}} + {\textcolor{#EF9901}{\gamma}}\, p + \eta^{1/{\textcolor{#6495ED}{\alpha}}}\,\xi_{{\textcolor{#6495ED}{\alpha}},{\textcolor{#DC143C}{\beta}}}$$

$$\frac{dp}{dt} = -{\textcolor{#EF9901}{\gamma}}\,\nabla \tilde{V}_{\textcolor{#6495ED}{\alpha}}$$

<div class="dim-text">Fractional derivatives → tunable exponents</div>

</div>
</div>

<div class="grid grid-cols-3 gap-6 mt-8 text-center">
<div>

<span class="cornflowerblue text-xl">$\textcolor{#6495ED}{\alpha}$</span> — Space-fractional order

<div class="dim-text text-sm">Heavy-tailed jumps → superdiffusion</div>

</div>
<div>

<span class="crimson text-xl">$\textcolor{#DC143C}{\beta}$</span> — Time-fractional order

<div class="dim-text text-sm">Power-law memory → long-range correlations</div>

</div>
<div>

<span class="california text-xl">$\textcolor{#EF9901}{\gamma}$</span> — Momentum coupling

<div class="dim-text text-sm">E-I feedback → oscillations</div>

</div>
</div>

---

# What Do Fractional Derivatives Do?

<div class="grid grid-cols-2 gap-8 mt-4">
<div>

**Space-fractional derivative** ($\textcolor{#6495ED}{\alpha} < 2$)

Replaces Gaussian diffusion with Lévy-stable noise
- $\textcolor{#6495ED}{\alpha} = 2$: Gaussian (classical)
- $\textcolor{#6495ED}{\alpha} < 2$: heavy-tailed jumps

**Effect on drift & diffusion:**
- Large, rare excursions from the potential well
- Superdiffusive motion ($a > 0.5$)
- Faster exploration of state space

<div class="figure-placeholder mt-2" style="min-height: 100px;">

Figure: Effective potential — Gaussian vs Lévy ($\textcolor{#6495ED}{\alpha} = 2$ vs $1.5$)

</div>

</div>
<div>

**Time-fractional derivative** ($\textcolor{#DC143C}{\beta} < 1$)

Replaces the standard derivative with a Caputo derivative: a weighted integral over all past states
- $\textcolor{#DC143C}{\beta} = 1$: standard (memoryless)
- $\textcolor{#DC143C}{\beta} < 1$: power-law memory kernel

**Effect on drift & diffusion:**
- Long-range temporal correlations
- Subdiffusive component that stabilizes local dynamics
- Spectral slope $b > -2$

<div class="figure-placeholder mt-2" style="min-height: 100px;">

Figure: Memory kernel — exponential vs power-law decay

</div>

</div>
</div>

<div class="dim-text text-center mt-2">Oscillations arise from momentum coupling ($\textcolor{#EF9901}{\gamma}$), analogous to PING in E-I circuits</div>

---

# bFNS: Tunable Diffusion and Spectral Exponents

$\textcolor{#6495ED}{\alpha}$ and $\textcolor{#DC143C}{\beta}$ provide **independent control** over superdiffusion and long-range memory

<div class="grid grid-cols-2 gap-8 mt-4">
<div>

**Diffusion exponent** $a$

$a \approx 1 - \frac{\textcolor{#6495ED}{\alpha}}{2} + \frac{\textcolor{#DC143C}{\beta}}{2}$

- $\textcolor{#6495ED}{\alpha} < 2$ <span class="cucumber">increases</span> $a$ (superdiffusion)
- $\textcolor{#DC143C}{\beta} < 1$ <span class="crimson">decreases</span> $a$ (subdiffusion)
- Superdiffusion when $\textcolor{#6495ED}{\alpha} < \textcolor{#DC143C}{\beta} + 1$

<div class="figure-placeholder mt-2" style="min-height: 140px;">

Figure: Diffusion exponent heatmap ($\textcolor{#6495ED}{\alpha}$ × $\textcolor{#DC143C}{\beta}$)

</div>

</div>
<div>

**Spectral exponent** $b$

Primarily controlled by $\textcolor{#DC143C}{\beta}$

- $\textcolor{#DC143C}{\beta}$ determines long-range correlations
- Weak dependence on $\textcolor{#6495ED}{\alpha}$
- Oscillatory component adds $\theta$/$\textcolor{#EF9901}{\gamma}$ peaks

<div class="figure-placeholder mt-2" style="min-height: 140px;">

Figure: Spectral exponent heatmap ($\textcolor{#6495ED}{\alpha}$ × $\textcolor{#DC143C}{\beta}$)

</div>

</div>
</div>

---
layout: two-cols
---

# bFNS: Parameter Sweeps

Sweeping $\textcolor{#6495ED}{\alpha}$ and $\textcolor{#DC143C}{\beta}$ across the anomalous regime

<div class="figure-placeholder mt-4" style="min-height: 140px;">

Figure: MAD curves for varying $\textcolor{#6495ED}{\alpha}$ at fixed $\textcolor{#DC143C}{\beta}$

</div>

<div class="figure-placeholder mt-4" style="min-height: 140px;">

Figure: PSD curves for varying $\textcolor{#DC143C}{\beta}$ at fixed $\textcolor{#6495ED}{\alpha}$

</div>

::right::

<div class="mt-12">

**MAD:**
- Decreasing $\textcolor{#6495ED}{\alpha}$ steepens the short-lag slope
- $\textcolor{#DC143C}{\beta}$ modulates the crossover to long-lag behavior

**PSD:**
- Decreasing $\textcolor{#DC143C}{\beta}$ flattens the spectral slope ($b \to -1$)
- $\textcolor{#6495ED}{\alpha}$ has minimal effect on spectral exponent
- $\textcolor{#EF9901}{\gamma}$ adds oscillatory peaks without changing the slope

<div class="dim-text mt-4">Experimental targets: $a \approx 0.6$, $b \approx -1.73$</div>

</div>

---

# bFNS as Empirical Mean-Field

<div class="grid grid-cols-2 gap-8 mt-2">
<div>

**Construction:**
- Replace Gaussian noise with bFNS process
- Fit target distribution from circuit model inputs
- Drive a single neuron with bFNS input

<div class="figure-placeholder mt-4" style="min-height: 120px;">

Figure: Mean-field schematic — circuit → bFNS → single neuron

</div>

</div>
<div>

**Enhanced fluctuation-driven regime**

bFNS reproduces key features of the circuit model:
- Mean membrane potential ~10 mV below threshold
- Low firing rate, sparse spiking
- Non-Gaussian, bumpy inputs with power-law tails

<span class="highlight">Large Lévy jumps drive spikes despite low mean input</span>

<div class="dim-text mt-2">→ "Super-fluctuation-driven" regime: the mean input can be even lower for a given firing rate</div>

</div>
</div>

<div class="figure-placeholder mt-4" style="min-height: 100px;">

Figure: Membrane potential trace + input current trace + step-size distribution (bFNS mean-field)

</div>

---

# Fano Factors: bFNS Reproduces Experimental Scaling

<div class="grid grid-cols-2 gap-8 mt-4">
<div>

**Three regimes of Fano factor scaling:**

1. <span class="cucumber">No memory ($\textcolor{#DC143C}{\beta} = 1$):</span> flat, Poisson-like (FF ≈ 1)
2. <span class="crimson">Memory, no oscillations:</span> power-law scaling
3. <span class="cornflowerblue">Memory + oscillations:</span> tempered power-law

<div class="mt-4">

The experimental Fano factor exponent ($c = 0.24$) falls within the bFNS parameter range

</div>

<div class="dim-text mt-4">Gaussian models cannot produce $c > 0$</div>

</div>
<div>

<div class="figure-placeholder" style="min-height: 140px;">

Figure: Fano factor curves — bFNS mean-field (three regimes)

</div>

<div class="figure-placeholder mt-4" style="min-height: 140px;">

Figure: Fano factor — Neuropixels experiment (overlay or side-by-side)

</div>

</div>
</div>

---

# Summary: The Adaptive Fractional State

<div class="grid grid-cols-3 gap-6 mt-6 text-center">
<div>

**Experiment + circuit model**

Visual cortex shows anomalous scaling:

$a > 0.5$ · $b > -2$ · $c > 0$

<div class="dim-text text-sm mt-2">Inconsistent with Gaussian mean-field</div>

</div>
<div>

**bFNS model**

Fractional calculus gives tunable exponents:

<span class="cornflowerblue">$\textcolor{#6495ED}{\alpha}$</span> superdiffusion · <span class="crimson">$\textcolor{#DC143C}{\beta}$</span> memory · <span class="california">$\textcolor{#EF9901}{\gamma}$</span> oscillations

<div class="dim-text text-sm mt-2">Independent control over anomalous dynamics</div>

</div>
<div>

**Functional implication**

Competition between superdiffusion and subdiffusion:

<span class="highlight">Exploration</span> vs <span class="highlight">Exploitation</span>

<div class="dim-text text-sm mt-2">Navigates the flexibility–stability trade-off</div>

</div>
</div>

<div class="mt-8 text-center">

bFNS provides a mechanistic bridge between **circuit dynamics** and **population statistics**

</div>

---

# Future Directions

<div class="grid grid-cols-3 gap-6 mt-4">
<div>

**bFNS for saccadic eye movements**

<div class="dim-text">Jude Metcalf</div>

- Saccade dynamics show heavy-tailed statistics
- bFNS as a model for oculomotor variability
- Connects cortical dynamics to motor output

</div>
<div>

**bFNS for decision making**

<div class="dim-text">Aiden Sloots</div>

- Drift-diffusion models with fractional noise
- Heavy tails → faster escape from indecision
- Memory → integration over longer timescales

</div>
<div>

**$\theta$–$\textcolor{#EF9901}{\gamma}$ coupling**

<div class="dim-text">Jude Metcalf</div>

- Nested oscillations from bFNS momentum
- Phase-amplitude coupling across timescales
- Role of fractional memory in cross-frequency interactions

</div>
</div>

<div class="mt-4">

**Also in progress:** Hierarchical variation of exponents across visual areas and layers — exponents vary systematically with adaptation strength and E/I balance

</div>

---
layout: center
---

# Thank You

<div class="mt-6">

<span class="cornflowerblue">Non-Gaussian fluctuations</span> · <span class="crimson">Long-range memory</span> · <span class="california">Oscillations</span>

</div>

<div class="grid grid-cols-2 gap-12 mt-8 text-sm">
<div>

**Brendan Harris** & Pulin Gong

School of Physics, University of Sydney

</div>
<div>

**Collaborators:**

Jude Metcalf · Aiden Sloots

</div>
</div>

<div class="dim-text text-sm mt-8">

Contact / links / QR code here

</div>

---
layout: section
---

# Supplementary Slides

---

# S1: Exponent Variation Across Hierarchy

Diffusion, spectral, and variability exponents across layers and areas

<div class="figure-placeholder mt-4" style="min-height: 200px;">

Figure: Exponents across cortical layers and visual areas

</div>

- Trend toward decreased diffusion exponent in layer 2/3 across hierarchy
- Higher areas show spectral exponents closer to $-1.5$
- Variability exponent increases in higher areas

---

# S2: Input Distribution Parameters

Distribution of stable distribution parameters across neurons

<div class="figure-placeholder mt-4" style="min-height: 200px;">

Figure: Stable distribution parameters across neurons

</div>

- Tail index $\approx 1.5$
- Skewness $\approx 0$ (symmetric)
- Scale and location parameters vary across neurons

---

# S3: Sampling Accuracy

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

# S4: Circuit Model Parameters

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
- $\sigma_{EE} = 0.06$ mm
- $K_{EE} = 260$
- $J_{EE} = 0.00105$ μS

**External input**
- $\nu_{\mathrm{ext}} = 10$ Hz
- $n_{\mathrm{ext}} = 100$

</div>
</div>
