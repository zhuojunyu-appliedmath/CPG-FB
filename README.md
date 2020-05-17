# CPG-FB

This repository holds code used to generate the figures in our paper 
"Dynamical Consequences of Sensory Feedback in a Half-Center Oscillator Coupled to a Simple Motor System".

Fig. 1 is a system diagram, not generated via simulation.

Fig. 2 shows symmetric limit cycle solutions of the CPG-biomechanics model. To generate figure, run Fig_2a.m and Fig_2b.m

Fig. 3 shows asymmetric limit cycle solutions of the CPG-biomechanics model. To generate figure, run Fig_3a.m and Fig_3b.m

Fig. 4 shows the oscillation period and the magnitude of the second Floquet multiplier of the inhibition-release mechanism.  
This figure is generated using Matcont, with CPG_FB.m as the simulation code. For Fig. 4(a), to produce the plot from precomputed data (ir_period.mat), run Fig_4a.m; for Fig. 4(b), to produce the plot from precomputed data (ir_multiplier.mat), run Fig_4b.m

Fig. 5 illustrates the pitchfork bifurcations on the middle band and left border of the inhibition-release mechanism. This figure is generated using Matcont, with CPG_FB.m as the simulation code. For Fig. 5(a), to produce the plot from precomputed data (ir_pitchfork_middle.mat), run Fig_5a.m; for Fig. 5(b), to produce the plot from precomputed data (ir_pitchfork_left.mat), run Fig_5b.m; the bottom figure is obtained by projecting contours in (a) and (b) to the V_1-V_2 plane.

Fig. 6 shows an oscillatory behavior about the unperturbed trajectory, startting with 10% displacement to the original maximum position in the inhibition-release mechanism with both CPG conductance and FB conductance equal to 0.006. To generate figure, run Fig_6.m

Fig. 7 shows the robustness of the inhibition-release mechanism against external perturbation and internal noise. Run ex_in.m to obtain the result under any combination of (CPG, FB); after getting the ensemble, plot the Fig. 7 with simialr commands as Fig. 4. The data we computed is also attached, see ir_external.mat and ir_internal.mat; to produce the plot from precomputed data, run Fig_7a.m for ir_external.mat and Fig_7b.m for ir_internal.mat

Fig. 8 shows a noisy fluctuating behavior about the unperturbed trajetory over 100 periods in the inhibition-release mechanism under internal noise, with both the CPG conductance and FB conductance equal to 0.006. To generate figure, run Fig_8.m

Fig. 9 shows the oscillation period and the magnitude of the second Floquet multiplier of the inhibition-escape mechanism. This figure is generated using Matcont, with CPG_FB.m as the simulation code. For Fig. 9(a), to produce the plot from precomputed data (ie_period.mat), run Fig_9a.m; for Fig. 9(b), to produce the plot from precomputed data (ie_multiplier.mat), run Fig_9b.m

Fig. 10 shows a stable fixed point coexisting with an unstable limit cycle when close to the subcritical Hopf bifurcation on the right border of the inihibition-escape mechanism with (CPG, FB)=(0.012, 0.0027145). To generate figure, run Fig_10.m

Fig. 11 shows a stable fixed point coexisting with an unstable limit cycle when close to the subcritical Hopf bifurcation on the left border of the inihibition-escape mechanism with (CPG, FB)=(0.0004, 0.00235). To generate figure, run Fig_11.m

Fig. 12 illustrates the pitchfork bifurcation on the left border of the inhibition-escape mechanism. This figure is generated using Matcont, with CPG_FB.m as the simulation code. To produce the left plot from precomputed data (ie_pitchfork.mat), run Fig_12.m. The right plot is obtained by projecting contours in the left to the V_1-V_2 plane.

Fig. 13 shows the robustness of the inhibition-escape mechanism against external perturbation and internal noise. Run ex_in.m to obtain the result under any combination of (CPG,FB); after getting the ensemble, plot the Fig. 13 with simialr commands as Fig. 9. The data we computed is also attached, see ie_external.mat and ie_internal.mat; to produce the plot from precomputed data, run Fig_13a.m for ie_external.mat and Fig_13b.m for ie_internal.mat

Fig. 14 shows the oscillation period and the magnitude of the second Floquet multiplier of the excitation-release mechanism.   This figure is generated using Matcont, with CPG_FB.m as the simulation code. For Fig. 14(a), to produce the plot from precomputed data (er_period.mat), run Fig_14a.m; for Fig. 14(b), to produce the plot from precomputed data (er_multiplier.mat), run Fig_14b.m

Fig. 15 illustrates the fold bifurcation on the left border of the excitation-release mechanism and torus bifurcation on the left border of the excitation-escape mechansim. This figure is generated using Matcont, with CPG_FB.m as the simulation code. For Fig. 15(a), to produce the plot from precomputed data (er_fold.mat), run Fig_15(a).m; for Fig. 15(b), to produce the plot from precomputed data (ee_torus.mat), run Fig_15(b).m

Fig. 16 shows the robustness of the excitation-release mechanism against external perturbation and internal noise. Run ex_in.m to obtain the result under any combination of (CPG,FB); after getting the ensemble, plot the Fig. 16 with simialr commands as Fig. 14. The data we computed is also attached, see er_external.mat and er_internal.mat; to produce the plot from precomputed data, run Fig_16a.m for er_external.mat and Fig_16b.m for er_internal.mat

Fig. 17 shows the oscillation period and the magnitude of the second Floquet multiplier of the excitation-escape mechanism. This figure is generated using Matcont, with CPG_FB.m as the simulation code. For Fig. 17(a), to produce the plot from precomputed data (ee_period.mat), run Fig_17a.m; for Fig. 17(b), to produce the plot from precomputed data (ee_multiplier.mat), run Fig_17b.m

Fig. 18 shows a stable fixed point coexisting with an unstable limit cycle when close to the subcritical Hopf bifurcation on the right border of the excitation-escape mechanism with (CPG, FB)=(0.0132, 0.002305). To generate figure, run Fig_18.m

Fig. 19 shows the robustness of the excitation-escape mechanism against external perturbation and internal noise. Run ex_in.m to obtain the result under any combination of (CPG,FB); after getting the ensemble, plot the Fig. 19 with simialr commands as Fig. 17. The data we computed is also attached, see ee_external.mat and ee_internal.mat; to produce the plot from precomputed data, run Fig_19a.m for ee_external.mat and Fig_19b.m for ee_internal.mat

Fig. 20 illustrates that the responses to external perturbation and internal noise in the two inhibition-mediated systems fall on similar curves. The data is from Fig. 7 (ir_external.mat and ir_internal.mat) and Fig. 13 (ie_external.mat and ie_internal.mat), and we arrange them into ex_in_relation.mat. To produce the plot from precomputed data (ex_in_relation.mat), run Fig_20.m

Fig. 21 shows the absolute difference of the responses to the external noise between two inhibition-mediated systems and the absolute difference of the responses to the internal noise between two release systems. The data is obtained through the absolue difference between the data of Fig. 7(a) (ir_external.mat) and Fig. 13(a) (ie_external.mat) and between that of Fig. 7(b) (ir_internal.mat) and Fig. 16(b) (er_internal.mat), as shown in compare_inh_ex.mat and compare_release_in.mat, respectively. For Fig. 21(a), to produce the plot from precomputed data (compare_inh_ex.mat), run Fig_21a.m; for Fig. 21(b), to produce the plot from precomputed data (compare_release_in.mat), run Fig_21b.m

Table 1 lists the calculation results of the fold bifurcation (Fig. 15(a)) and pitchfork bifurcation (Fig. 5(a), 5(b), 12). Run poincare.m to generate the results and distinguish the bifurcation type.
