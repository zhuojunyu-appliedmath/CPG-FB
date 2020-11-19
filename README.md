# CPG-FB

This repository holds code used to generate the figures in our paper 
"Dynamical Consequences of Sensory Feedback in a Half-Center Oscillator Coupled to a Simple Motor System".

Fig. 1 is a system diagram, not generated via simulation.

Fig. 2 shows (V,N) phase plane for a single Morris-Lecar model neuron. To generate figure, run Fig_2.m

Fig. 3 shows symmetric limit cycle solutions of the CPG-biomechanics model. To generate figure, run Fig_3a.m and Fig_3b.m

Fig. 4 shows asymmetric limit cycle solutions of the CPG-biomechanics model. To generate figure, run Fig_4a.m and Fig_4b.m

Fig. 5 is a classification diagram, not generated via simulation.

Fig. 6 shows the oscillation period and the magnitude of the second Floquet multiplier of the inhibition-release mechanism.  
The data of this figure is generated using Matcont, with CPG_FB.m as the simulation code. For Fig. 6(a), to produce the plot from precomputed data (ir_period.mat), run Fig_6a.m; for Fig. 6(b), to produce the plot from precomputed data (ir_multiplier.mat), run Fig_6b.m

Fig. 7 illustrates the pitchfork bifurcations on the middle band of the inhibition-release mechanism. The data of this figure is generated using Matcont, with CPG_FB.m as the simulation code. To produce the plot from precomputed data (ir_pitchfork_middle.mat), run Fig_7.m

Fig. 8 illustrates the pitchfork bifurcations on the left border of the inhibition-release mechanism. The data of this figure is generated using Matcont, with CPG_FB.m as the simulation code. To produce the plot from precomputed data (ir_pitchfork_left.mat), run Fig_8.m

Fig. 9 shows an oscillatory behavior about the unperturbed trajectory, startting with 10% displacement to the original maximum position in the inhibition-release mechanism with both CPG conductance and FB conductance equal to 0.006. To generate figure, run Fig_9.m

Fig. 10 shows the robustness of the inhibition-release mechanism against external perturbation and internal noise. Run ex_in.m to obtain the result under any combination of (CPG, FB); after getting the ensemble, plot Fig. 10 with simialr commands as Fig. 6. The data we computed is also attached, see ir_external.mat and ir_internal.mat; to produce the plot from precomputed data, run Fig_10a.m for ir_external.mat and Fig_10b.m for ir_internal.mat

Fig. 11 shows a noisy fluctuating behavior about the unperturbed trajetory over 100 periods in the inhibition-release mechanism under internal noise, with both the CPG conductance and FB conductance equal to 0.006. To generate figure, run Fig_11.m

Fig. 12 shows the oscillation period and the magnitude of the second Floquet multiplier of the inhibition-escape mechanism. The data of this figure is generated using Matcont, with CPG_FB.m as the simulation code. For Fig. 12(a), to produce the plot from precomputed data (ie_period.mat), run Fig_12a.m; for Fig. 12(b), to produce the plot from precomputed data (ie_multiplier.mat), run Fig_12b.m

Fig. 13 shows (V,N) phase plane of the escape mechanism without feedback. To generate figure, run Fig_13.m

Fig. 14 shows a stable fixed point coexisting with an unstable limit cycle when close to the subcritical Hopf bifurcation on the right border of the inihibition-escape mechanism with (CPG, FB)=(0.012, 0.0027145). To generate figure, run Fig_14.m

Fig. 15 illustrates the pitchfork bifurcations on the left border of the inhibition-escape mechanism. The data of this figure is generated using Matcont, with CPG_FB.m as the simulation code. To produce the plot from precomputed data (ie_pitchfork.mat), run Fig_15.m. 

Fig. 16 shows a stable fixed point coexisting with an unstable limit cycle when close to the subcritical Hopf bifurcation on the left border of the inihibition-escape mechanism with (CPG, FB)=(0.0004, 0.00235). To generate figure, run Fig_16.m

Fig. 17 shows the robustness of the inhibition-escape mechanism against external perturbation and internal noise. Run ex_in.m to obtain the result under any combination of (CPG,FB); after getting the ensemble, plot the Fig. 17 with simialr commands as Fig. 12. The data we computed is also attached, see ie_external.mat and ie_internal.mat; to produce the plot from precomputed data, run Fig_17a.m for ie_external.mat and Fig_17b.m for ie_internal.mat

Fig. 18 shows the oscillation period and the magnitude of the second Floquet multiplier of the excitation-release mechanism. The data of this figure is generated using Matcont, with CPG_FB.m as the simulation code. For Fig. 18(a), to produce the plot from precomputed data (er_period.mat), run Fig_18a.m; for Fig. 18(b), to produce the plot from precomputed data (er_multiplier.mat), run Fig_18b.m

Fig. 19 illustrates the fold bifurcation on the left border of the excitation-release mechanism. The data of this figure is generated using Matcont, with CPG_FB.m as the simulation code. To produce the plot from precomputed data (er_fold.mat), run Fig_19.m. 

Fig. 20 shows the robustness of the excitation-release mechanism against external perturbation and internal noise. Run ex_in.m to obtain the result under any combination of (CPG,FB); after getting the ensemble, plot the Fig. 20 with simialr commands as Fig. 18. The data we computed is also attached, see er_external.mat and er_internal.mat; to produce the plot from precomputed data, run Fig_20a.m for er_external.mat and Fig_20b.m for er_internal.mat

Fig. 21 shows the oscillation period and the magnitude of the second Floquet multiplier of the excitation-escape mechanism. This figure is generated using Matcont, with CPG_FB.m as the simulation code. For Fig. 21(a), to produce the plot from precomputed data (ee_period.mat), run Fig_21a.m; for Fig. 21(b), to produce the plot from precomputed data (ee_multiplier.mat), run Fig_21b.m

Fig. 22 illustrates the torus bifurcation on the left border of the excitation-escape mechanism. The data of this figure is generated using Matcont, with CPG_FB.m as the simulation code. To produce the plot from precomputed data (ee_torus.mat), run Fig_22.m. 

Fig. 23 shows a stable fixed point coexisting with an unstable limit cycle when close to the subcritical Hopf bifurcation on the right border of the excitation-escape mechanism with (CPG, FB)=(0.0132, 0.002305). To generate figure, run Fig_23.m

Fig. 24 shows the robustness of the excitation-escape mechanism against external perturbation and internal noise. Run ex_in.m to obtain the result under any combination of (CPG,FB); after getting the ensemble, plot the Fig. 24 with simialr commands as Fig. 21. The data we computed is also attached, see ee_external.mat and ee_internal.mat; to produce the plot from precomputed data, run Fig_24a.m for ee_external.mat and Fig_24b.m for ee_internal.mat

Fig. 25 shows a continuum of asymmetric limit cycles from nealy in-phase to nearly anti-phase. To gengerate the figure, run Fig_25.m. 

Fig. 26 illustrates that the responses to external perturbation and internal noise in the two inhibition-mediated systems fall on similar curves. The data is from Fig. 10 (ir_external.mat and ir_internal.mat) and Fig. 17 (ie_external.mat and ie_internal.mat), and we arrange them into ex_in_relation.mat. To produce the plot from precomputed data (ex_in_relation.mat), run Fig_26.m

Fig. 27 shows the absolute difference of the responses to the external noise between two inhibition-mediated systems and the absolute difference of the responses to the internal noise between two release systems. The data is obtained through the absolue difference between the data of Fig. 10(a) (ir_external.mat) and Fig. 17(a) (ie_external.mat) and between that of Fig. 10(b) (ir_internal.mat) and Fig. 20(b) (er_internal.mat), as shown in compare_inh_ex.mat and compare_release_in.mat, respectively. For Fig. 27(a), to produce the plot from precomputed data (compare_inh_ex.mat), run Fig_27a.m; for Fig. 27(b), to produce the plot from precomputed data (compare_release_in.mat), run Fig_27b.m

Table 1 lists the calculation results of the fold bifurcation (Fig. 19) and pitchfork bifurcation (Fig. 7, 8, 15). Run poincare.m to generate the results and distinguish the bifurcation type.
