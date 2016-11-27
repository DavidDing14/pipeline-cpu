/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

#include "xsi.h"

struct XSI_INFO xsi_info;

char *IEEE_P_2592010699;
char *STD_STANDARD;
char *IEEE_P_3499444699;
char *IEEE_P_3620187407;


int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    ieee_p_2592010699_init();
    ieee_p_3499444699_init();
    ieee_p_3620187407_init();
    work_a_1991350011_3212880686_init();
    work_a_3466821759_3212880686_init();
    work_a_2865939362_3212880686_init();
    work_a_2316682349_3212880686_init();
    work_a_3392787015_3212880686_init();
    work_a_3817509602_3212880686_init();
    work_a_3475433456_3212880686_init();
    work_a_3194400076_3212880686_init();
    work_a_3996056081_3212880686_init();
    work_a_0932175927_3212880686_init();
    work_a_3194366101_3212880686_init();
    work_a_0061621339_3212880686_init();
    work_a_0832606739_3212880686_init();
    work_a_2657849955_3212880686_init();
    work_a_0720342707_3212880686_init();
    work_a_1275041991_3212880686_init();
    work_a_2934098902_3212880686_init();
    work_a_1415465652_3212880686_init();
    work_a_2589421751_2372691052_init();


    xsi_register_tops("work_a_2589421751_2372691052");

    IEEE_P_2592010699 = xsi_get_engine_memory("ieee_p_2592010699");
    xsi_register_ieee_std_logic_1164(IEEE_P_2592010699);
    STD_STANDARD = xsi_get_engine_memory("std_standard");
    IEEE_P_3499444699 = xsi_get_engine_memory("ieee_p_3499444699");
    IEEE_P_3620187407 = xsi_get_engine_memory("ieee_p_3620187407");

    return xsi_run_simulation(argc, argv);

}
