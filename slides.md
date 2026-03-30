---
theme: ./theme
title: The Adaptive Fractional State of Visual Cortex
author: Brendan Harris
info: |
  Anomalous Dynamics in Neural Circuits
  School of Physics, The University of Sydney
fonts:
  sans: Source Sans 3
  mono: JuliaMono
colorSchema: dark
aspectRatio: 16/9
canvasWidth: 980
transition: slide-left
---

# <span style="font-size: 0.98em;">Adaptive Fractional States of the Visual Cortex</span>

**Brendan Harris & Pulin Gong**

School of Physics<br>The University of Sydney

<div style="position: absolute; bottom: 32px; font-size: 0.8em;">

**Slides**: [brendanjohnharris.github.io/MiB_2026](https://brendanjohnharris.github.io/MiB_2026)

**Poster**: [github.com/brendanjohnharris/MiB_2026](github.com/brendanjohnharris/MiB_2026)

</div>

<!-- Hello everyone, My name is Brendan Harris. I'm currently a postdoc at the University of Sydney with Ben Fulcher, but today I'm presenting a piece of work from the tail end of my PhD with Pulin Gong.

This work has to do with the interesting and kind of unexpected dynamics we observe in cortical activity, and how we can interpret these dynamics through what we call the 'adaptive fractional' state of the visual cortex. -->

---

# What is the working regime of the visual cortex?

<div class="grid gap-8 mt-2" style="grid-template-columns: 6fr 6fr;">
<div>

<div class="block">
<div class="block-title">Spontaneous activity is fluctuation-driven</div>

- Low firing rates (~1--10 Hz) <span class="dim-text" style="font-size: 0.75em;">[[Barth & Poulet 2012](https://doi.org/10.1016/j.tins.2012.03.008)]</span>
- Sparse coding <span class="dim-text" style="font-size: 0.75em;">[[Olshausen & Field 2004](https://doi.org/10.1016/j.conb.2004.07.007)]</span>
- Low mean membrane potentials <span class="dim-text" style="font-size: 0.75em;">[[Carandini 2000](https://doi.org/10.1523/JNEUROSCI.20-01-00470.2000)]</span>

</div>

</div>
<div>

<div class="block block-alert">
<div class="block-title">But also shows 'anomalous' dynamics</div>

- Nested oscillations and $1/f$ <span class="dim-text" style="font-size: 0.75em;">[[Poil et al. 2012](https://doi.org/10.1523/JNEUROSCI.5990-11.2012)]</span>
- Super-Poissonian spikes <span class="dim-text" style="font-size: 0.75em;">[[Churchland et al. 2010](https://doi.org/10.1038/nn.2501)]</span>
- Bumpy synaptic inputs <span class="dim-text" style="font-size: 0.75em;">[[DeWeese & Zador 2006](https://doi.org/10.1523/jneurosci.2813-06.2006)]</span>

</div>
</div>
</div>

<!-- **Talk goals**:

<div class="flex items-center gap-2 mt-2">
  <div class="block block-example" style="flex:1; margin:0; font-size:0.82em;">1. Explain the classical fluctuation-driven regime from first principles</div>
  <div style="font-size:1.4em; color:var(--slidev-theme-cucumber);">→</div>
  <div class="block block-example" style="flex:1; margin:0; font-size:0.82em;">2. Show anomalous dynamics in empirical data</div>
  <div style="font-size:1.4em; color:var(--slidev-theme-cucumber);">→</div>
  <div class="block block-example" style="flex:1; margin:0; font-size:0.82em;">3. Introduce our new framework for capturing these anomalous properties</div>
</div> -->

<br>

<img src="/.figures/brain_trace.svg" class="w-full max-h-52" style="margin-top: 12px;" />

<!-- <div class="dim-text text-sm mt-1">Allen Institute Neuropixels dataset — 53 sessions, 36 mice, 6 visual areas</div> -->

<!-- <div class="big-question mt-2">How do we understand the origin of these dynamics?</div> -->

<!--
So, this work builds off a very long-standing question in the field: what is the working regime of the visual cortex? What kind of spontaneous activity does the cortex uphold in order to maintain sensitivity and specificity to visual stimuli.
I'll group what we what we know about the working regime into two broad categories: those that are easy to understand from first-principles, and those are more exotic and harder to explain.

For the first category, we know that most neurons operate in a 'fluctuation driven regime'. They have low firing rates of less than 10 Hz, and they have this sparse coding property, where stimuli will drive only a small fraction of neurons.
And tying these together are mean membrane potentials that typically sit well below the spiking threshold.

But the cortex also exhibits what I'll call 'anomalous dynamics'.
These include nested oscillations and 1/f spectral components, which are very common in local field potential recordings like the green trace here.
Neurons also show spike times that have this super Poissonian variability, meaning that they are more variable across time than you would expect from a Poisson point process.
And they also have bumpy synaptic inputs, which you can see in the red trace here, with high-amplitude fluctuations that are caused by synchronous, correlated inputs from many neurons.
-->

---

# Classical theory for the fluctuation-driven regime

<!-- <div class="grid grid-cols-2 gap-4">
<div class="block">
<div class="block-title">Gaussian assumption</div>

- Normal diffusion: <span class="cornflowerblue">MAD</span> $\propto \tau^{a}$ with $a = 0.5$
- No memory: <span class="alert-text">PSD</span> $\propto f^{b}$ with $b = -2$

</div>
<div class="block">
<div class="block-title">Experiment and biophysical circuit model</div>

- <span class="cornflowerblue">Superdiffusion</span>: $a \approx 0.6$ &ensp;
- <span class="alert-text">Long-range dependence</span>: $b \approx -1.7$ &ensp;

</div>
</div> -->

<div class="grid grid-cols-2 gap-8 mt-2">
<div>

**Balanced E/I populations** can explain the fluctuation-driven regime <span class="dim-text" style="font-size: 0.75em;">[[van Vreeswijk & Sompolinsky 1996](https://doi.org/10.1126/science.274.5293.1724)]</span>

**Mean-field theory** treats summed E/I input as a stochastic process <span class="dim-text" style="font-size: 0.75em;">[[Brunel 2000](https://doi.org/10.1023/A:1008925309027);[Wardak & Gong 2021](https://doi.org/10.1103/PhysRevResearch.3.013083)]</span>:
- E and I inputs cancel _on average_ (low mean)
- Random variations approx. _Gaussian noise_

<div class="block mt-4">
<div class="block-title">Classical mean field</div>

$$\frac{dV}{dt} = f(V) + \eta\,\xi(t)$$

where $\xi(t)$ is white (or OU) Gaussian noise.
</div>
</div>


<img src="/.figures/mean_field.svg" class="w-full max-h-100" style="margin-top: 12px;" />

</div>

<!--
So I want us to get to three places in this talk: first, to understand from first principles how the how classical fluctuation-driven regime arises in cortical circuits.
Then, I'm going to show you some empirical observations we've made that are directly inconsistent with the classical theory.
Finally, I'll present the new method we have for empirically capturing these anomalous dynamics using formalisms from fractional calculus.

So classically, the fluctuation driven regime can be captured by balanced networks excitatory and inhibitory neurons, which you can see on the right.
To understand how balanced networks can produce the fluctuation driven regime, we have this theoretical tool called mean field theory.
Mean-field theory which treats the summed excitatory and inhibitory inputs to a given neuron, your statistically average neuron, as a stochastic process.
And this is valid because in the fluctuation-driven regime, the excitatory and inhibitory inputs to a given neuron cancel on average, so they have a low mean, but random input spikes approximate Gaussian noise about this mean, by the central limit theorem.
And that gives us a Langevin like equation, simplified here, where the change in membrane potential over time is given by some deterministic function of the membrane potential, plus some noise term that is a white or sometimes Ornstein-Uhlenbeck Gaussian noise process.
-->

---

# Classical mean-field diffusion

<div class="grid gap-6 mt-4" style="grid-template-columns: 2fr 2fr;">



<div class="flex items-center justify-center">
<img src="/.figures/diffusion.svg" style="width: 100%; height: auto; object-fit: contain;" />
</div>


<div class="flex flex-col gap-3 justify-center">

<div class="block">
<div class="block-title">Diffusion exponent</div>

Mean absolute deviation: $\text{MAD}(\tau) \propto \tau^{a}$

- $a = 0.5$ — normal (Brownian) diffusion
- $a > 0.5$ — superdiffusion (fast spreading)

</div>
<div class="block block-alert">
<div class="block-title">Spectral exponent</div>

Power spectral density: $\text{PSD}(f) \propto f^{b}$

- $b = -2$ — white-noise-driven (memoryless)
- $b > -2$ — negatively correlated increments (antipersistent long-range memory)

</div>
</div>

</div>

<!--
But the Gaussian assumption of the classical mean field theory isn't neutral, and has strong implications for the mean-field dynamics.
To explain, we can think of the subthreshold dynamics as a random walk; here the red ball is the membrane potential, and the white arrows are random excitatory and inhibitory kicks .
The red ball, under the influence of the random inputs, diffuses around, and we can quantify this diffusionin terms of two dynamical exponents.

First the diffusion exponent, which measures how fast the likely positions of the random walker spread away from an initial condition over time.
For white Gaussian noise or brownian motion, this diffusion exponent is 0.5.
If the diffusion exponent is greater than 0.5, then we have fast spreading, and superdiffusion.

The second exponent is the spectral exponent, which describes the temporal correlations in the random walk.
For Brownian motion, with memoryless Gaussian noise, the spectral exponent is -2.
If it's greater than -2, then we have long-range memory and an antipersistent motion that tends to be more stable and subdiffusive than Brownian motion.

The crucial fact is that the Gaussian noise assumption locks these dynamical exponents in place: the diffusion exponent is 0.5, and the spectral exponent is a multiple of -2.
-->

---

# Cortex shows _anomalous_ dynamics



<!-- <div class="alert-text mt-2">But experiment and circuit models show anomalous exponents that contradict these values</div> -->

<div class="block">We study LFP from <span class="cucumber">mouse Neuropixels</span> and subthreshold inputs from a <span class="juliapurple-light">biophysical circuit model</span> <span class="dim-text">[<a href="https://doi.org/10.1038/s41467-022-32279-z">Qi & Gong 2022</a>]</span> </div>

<br>

<img src="/.figures/experiment_circuit_statistics.svg" class="w-10/10 mx-auto" style="margin-top: auto;" />

<!--
But when we look at real data, what we see doesn't agree with the classical mean-field exponents.
What I'm plotting here are the mean absolute deviation and power spectral densities for data from the mouse visual cortex in green---lfp data--- and in purple, the subthreshold input currents from a biophysical spiking neural circuit model.
In both cases, you can see that the diffusion exponent is larger than 0.5; indicating superdiffusion; whereas the spectral exponent is greater than -2, indicating long-range memory.
It's also important to spot the peaks in the power spectrum on the right; these are a sign of oscillations, and we've used standard techniques to split the 1/f component from the oscillatory peaks.
-->

---

# How can we capture anomalous dynamics?

<div class="grid gap-6 mt-2 items-center" style="grid-template-columns: 1fr 1fr;">
<div>

<div style="font-size: 1.3em;">

<!-- **Bi-fractional Langevin with momentum** -->

$${}^C\!D_t^{\textcolor{#DC143C}{\beta}}\, x = -\eta\,\nabla \tilde{V}_{\textcolor{#6495ED}{\alpha}} + {\textcolor{#EF9901}{\gamma}}\, p + \eta^{1/{\textcolor{#6495ED}{\alpha}}}\,\xi_{{\textcolor{#6495ED}{\alpha}},{\textcolor{#DC143C}{\beta}}}$$

$$\frac{dp}{dt} = -{\textcolor{#EF9901}{\gamma}}\,\nabla \tilde{V}_{\textcolor{#6495ED}{\alpha}}$$

</div>

<div class="grid grid-cols-1 gap-2 mt-4 text-sm">
<div class="block" style="padding: 4px 10px;">
<div class="block-title cornflowerblue">

$\textcolor{#6495ED}{\alpha}$ — Space-fractional order <span class="dim-text">[<a href="https://doi.org/10.1038/s41467-022-32279-z">Qi & Gong 2022</a>]</span>

</div>

Heavy-tailed step sizes → superdiffusion

</div>
<div class="block" style="padding: 4px 10px;">
<div class="block-title crimson">

$\textcolor{#DC143C}{\beta}$ — Time-fractional order

</div>

Power-law memory → long-range correlations

</div>
<div class="block" style="padding: 4px 10px;">
<div class="block-title california">

$\textcolor{#EF9901}{\gamma}$ — Momentum coupling

</div>

Local oscillations

</div>
</div>

</div>
<div class="flex items-center justify-center">
  <img src="/.figures/timeseries_parameter_effects.svg" alt="Timeseries parameter effects" style="max-width: 100%;" />
</div>
</div>

<!-- ---
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
</div> -->

<!--
So taken together, it looks like the dynamics of cortical circuits are inconsistent with the classical Gaussian mean field.
So we need to generalize this theory, which we do by using the formalisms of fractional calculus.
I've written out the full equation here, but you don't need to focus on that; I can walk you through it during the poster session.
For now, we just need to understand how fractional calculus can capture anomalous diffusion.

First, the space fractional derivative gives us heavy tailed step sizes following a power-law distribution, controlled by the parameter alpha. Comparing to the brownian motion shown in white, adding the space-fractional derivative adds these large jumps that directly contribute to superdiffusion.

On the other hand, the time fractional derivative adds a power-law memory kernel, giving long-range correlations, controlled by beta. You can see in the red trace that after the large jumps, we reverse direction more quickly due to the anticorrelated increments, so the time-fractional derivative has this subdiffusion.

The last ingredient in this model is momentum coupling, which adds local oscillations controlled by the parameter gamma---you can see that when we add momentum, in the yellow trace, we get this small regularity to the fluctuations in the time series.
-->

---

# Bi-fractional mean-field inputs

<div class="grid gap-8 mt-4 items-center" style="grid-template-columns: 5fr 3fr;">
<div>
<div class="flex justify-center mt-4">
  <img src=".figures/model_summary.svg" alt="Model summary" style="max-width: 100%; height: auto;" />
</div>

</div>
<div class="mt--3 tight-list" style="font-size: 0.9em;">

**Diffusion exponent $a$** depends on $\textcolor{#6495ED}{\alpha}$ and $\textcolor{#DC143C}{\beta}$

- $\textcolor{#6495ED}{\alpha} \downarrow$ pushes $a \uparrow$ (superdiffusive)
- $\textcolor{#DC143C}{\beta} \downarrow$ pushes $a \downarrow$ (subdiffusive)

<br>

**Spectral exponent $b$** is only sensitive to $\textcolor{#DC143C}{\beta}$

- $\textcolor{#DC143C}{\beta} \downarrow$ pushes $b \uparrow$ (more long-range temporal dependencies)

<br>

$\textcolor{#EF9901}{\gamma}$ adds oscillatory peak

<br>

<div class="block">

**Experimental targets:**

- $b \approx -1.7 \to \textcolor{#DC143C}{\beta} \approx 0.85$
- $a \approx 0.6 \to \textcolor{#6495ED}{\alpha} \approx 1.5$

</div>

</div>
</div>

<!--
So now that we have this bi-fractional equation, we can use it to model the anomalous dynamics we observe in the empirical data.
I'm plotting on the top row here the mean-absolute deviation and the power spectrum for simulated data from our model: in green, we see a diffusion exponent greater than 0.5, a spectral exponent greater than -2, and an oscillatory peak.

And because of the way we've parameterised this model, we can independently tune the diffusion and spectral exponents by varying the spatial fractional order and the temporal fractional order, which you can see in the heatmaps on the bottom row.

And by doing so we can hit our empirical targets, a temporal fractional order of around 0.85 for a spectral exponent of -1.7, and a spatial fractional order of around 1.5 for a diffusion exponent of 0.6.
-->

---

# Bi-fractional input produces an <span class="cornflowerblue-light">adaptive fractional state</span>
<div class="mt-2">

<div class="grid grid-cols-3 gap-4 mt-0 text-sm">
<div class="block">

$\textcolor{#6495ED}{\alpha}$ superdiffusion enhances fluctuation-driven regime (lower mean membrane potential for a given firing rate)

</div>
<div class="block">

$\textcolor{#DC143C}{\beta}$ memory increases firing-rate variability and produces power-law Fano factor scaling.

</div>
<div class="block">

$\textcolor{#EF9901}{\gamma}$ momentum adds subthreshold oscillations, tempering Fano factor scaling

</div>
</div>

</div>

<br>
<div class="flex justify-center mt-0" style="margin-left: -4rem; margin-right: -2rem;">
  <img src=".figures/mean_field_sweep.svg" alt="Mean field sweep" style="width: 90%; height: auto;" />
</div>

<!--
Finally, we can take our bifractional model and use it as an empirical mean-field, by driving a simulated neuron using the bifracitonal process as an input current.
Then we can explain properties of neuronal spiking, which are shared between the real mouse brain and the biophysical circuit model.
First, as shown in the left panel, we find that the spatial fractional derivative enahnces the fluctuation-driven regime by increasing superdiffusion, which allows for a lower mean membrane potential at a given firing rate.
Then, the fractional temporal derivative is important for producing the super-poissonian spike-rate variability we see in the cortex; as shown in the middle panel, both the mouse data and circuit model have power-law segments in their fano factor scaling, but poisson processes have flat fano factors. Also, as you can see on the right, the momentum coupling controlling oscillations is required to temper the power law at long time windows.
-->

---

# _Why_&ensp;the adaptive fractional state?

<div class="grid grid-cols-3 gap-6 mt-4">

<div class="flex flex-col gap-3 col-span-2">
<div class="block">

<!-- Classical mean field does not capture the anomalous dynamics of real data -->

<!-- <div class="text-center text-2xl my-1">↓</div>

We develop theoretical machinery for capturing anomalous dynamics -->

<!-- <div class="text-center text-2xl my-1">↓</div> -->

New <span class="cucumber">bi-fractional mean field</span> generalizes Gaussian mean field to capture:
<ul style="list-style: none; padding-left: 0;">
<li><carbon-chart-line class="inline" /> Superdiffusion and long-range memory</li>
<li><carbon-activity class="inline" /> Oscillations</li>
<li>⚅ Power-law Fano factors</li>
</ul>
</div>
<!-- <div class="flex justify-center">
  <img src=".figures/brain_trace.svg" alt="Neural trace" style="width: 100%; height: auto; max-height: 130px; object-fit: contain;" />
</div> -->
<div class="block">
Potential advantages of adaptive fractional state:


<ul style="list-style: none; padding-left: 0;">
<li><carbon-explore class="inline" /> Exploration: superdiffusion/large jumps enable state switching</li>
<li>◎ Exploitation: subdiffusive long-range memory stabilizes dynamics</li>
</ul>

<br>

_Tunable_ exponents may allow circuits to better navigate the tradeoff between exploration/exploitation

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
<a href="https://brendanjohnharris.github.io/MiB_2026/" class="">Slide deck</a>

</div>

</div>

<!--
So, to bring everything together, we've developed a new bi-fractional mean field to capture the anomalous dynamics we observe in the cortex:  Superdiffusion and long-range memory, oscillations, and power-law fano factors

Why might cortex be orgnaized to have these anomalous dynamics? We think they are important for balancing the fundamental tradeoff between exploration and exploitation; space-fractional superdiffusion lets you occasionally jump to new distant states, exploring the global environment, whereas time-fractional subdiffusion stabilizes your motion, letting you exploit local information.

And because of these advantages, our bi-fractional model might be more broadly applicable to understanding diffusion process across many other contexts, from visual sampling to animal foraging or machine learning.

So, thankyou, and here are my contact details along with a qr code to take you to the slide deck. Thanks :)
-->

---
layout: center
class: supplementary
---

# Supplementary slides

---
class: supplementary
---

# S1: Fractional derivatives on drift and diffusion

<img src="/.figures/fractional_summary.svg" alt="Fractional derivatives summary" class="w-full object-contain" style="max-height: calc(100% - 3rem);" />

---
class: supplementary
---

# S2: hierarchical variation of dynamical exponents

<div class="grid grid-cols-2 gap-4 h-full">
  <div class="flex flex-col">
    <p class="text-center font-semibold mb-1">Mean absolute deviation</p>
    <img src="/.figures/supplemental_madev.svg" alt="Supplemental MADev" class="w-full object-contain" style="max-height: calc(100% - 2rem);" />
  </div>
  <div class="flex flex-col">
    <p class="text-center font-semibold mb-1">Power spectra</p>
    <img src="/.figures/supplemental_power_spectra.svg" alt="Supplemental power spectra" class="w-full object-contain" style="max-height: calc(100% - 2rem);" />
  </div>
</div>
