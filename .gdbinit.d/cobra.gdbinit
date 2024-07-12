file ./upas-l2
set args -b 1500 -n 200 -t 1 --so2 /localhome/rost_ph/proj/upas-s5p/UPAS-L2/cobra_data/S5P_OFFL_L1B_IR_UVN_20240430T185624_20240430T203754_33928_03_020100_20240430T222917.nc /localhome/rost_ph/proj/upas-s5p/UPAS-L2/cobra_data/S5P_OFFL_L1B_RA_BD3_20240501T050525_20240501T064655_33934_03_020100_20240501T083236.nc --aux-cloud /localhome/rost_ph/proj/upas-s5p/UPAS-L2/cobra_data/S5P_OFFL_L2__CLOUD__20240501T050525_20240501T064655_33934_03_020601_20240504T001944.nc --aux-o3 /localhome/rost_ph/proj/upas-s5p/UPAS-L2/cobra_data/S5P_OFFL_L2__O3_____20240501T050525_20240501T064655_33934_03_020601_20240504T005419.nc --aux-tm5 "/localhome/rost_ph/proj/upas-s5p/UPAS-L2/cobra_data/S5P_OPER_AUX_CTMANA_20190623T000000_20190624T000000_20221224T013458.nc /localhome/rost_ph/proj/upas-s5p/UPAS-L2/cobra_data/S5P_OPER_AUX_CTMANA_20190624T000000_20190625T000000_20221224T020347.nc" --aux-bgso2 /localhome/rost_ph/proj/upas-s5p/UPAS-L2/cobra_data/S5P_OFFL_AUX_BGSO2__20240426T235647_20240430T183452_20240504T003733.nc

#break Cobra.cpp:609
# break Cobra.cpp:232 if diff < uX + 1

# set record full insn-number-max 0
# calc_scd_iter
break Physics::Cobra::calc_scd_iter(blitz::Array<double, 2>&, blitz::Array<bool, 1>&, dlib::matrix<double, 0l, 0l, dlib::memory_manager_stateless_kernel_1<char>, dlib::row_major_layout>&, dlib::matrix<double, 0l, 0l, dlib::memory_manager_stateless_kernel_1<char>, dlib::row_major_layout>&, dlib::matrix<double, 0l, 0l, dlib::memory_manager_stateless_kernel_1<char>, dlib::row_major_layout>&, double, blitz::Array<double, 1>&, blitz::Array<double, 1>&, blitz::Array<double, 1>&)

# process
#break Physics::Cobra::Cobra::process(short const&, blitz::Array<short, 1> const&, blitz::Array<float, 2> const&, blitz::Array<float, 2> const&, blitz::Array<float, 1> const&, blitz::Array<float, 1> const&, blitz::Array<float, 1> const&, blitz::Array<float, 1> const&, blitz::Array<float, 1>&, blitz::Array<float, 1>&, blitz::Array<float, 1>&, blitz::Array<unsigned char, 1>&)

# inv_matrix_eigenvectors()
#break Physics::Cobra::inv_matrix_eigenvectors(dlib::matrix<double, 0l, 0l, dlib::memory_manager_stateless_kernel_1<char>, dlib::row_major_layout> const&)

#break Physics::Cobra::smooth(blitz::Array<double, 1>&, int, blitz::Array<double, 1>&)

#run
