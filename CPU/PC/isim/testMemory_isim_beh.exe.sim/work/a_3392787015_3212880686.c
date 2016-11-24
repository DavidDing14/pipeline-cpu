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

/* This file is designed for use with ISim build 0xc3576ebc */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "E:/pipeline-cpu/CPU/PC/Memory.vhd";
extern char *IEEE_P_3620187407;



static void work_a_3392787015_3212880686_p_0(char *t0)
{
    char t9[16];
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    int t10;
    unsigned int t11;
    char *t13;
    char *t14;
    char *t15;

LAB0:    xsi_set_current_line(55, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)2);
    if (t4 != 0)
        goto LAB2;

LAB4:    xsi_set_current_line(61, ng0);
    t1 = (t0 + 2632U);
    t2 = *((char **)t1);
    t1 = (t0 + 7072U);
    t5 = (t0 + 7356);
    t7 = (t9 + 0U);
    t8 = (t7 + 0U);
    *((int *)t8) = 0;
    t8 = (t7 + 4U);
    *((int *)t8) = 1;
    t8 = (t7 + 8U);
    *((int *)t8) = 1;
    t10 = (1 - 0);
    t11 = (t10 * 1);
    t11 = (t11 + 1);
    t8 = (t7 + 12U);
    *((unsigned int *)t8) = t11;
    t3 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t2, t1, t5, t9);
    if (t3 != 0)
        goto LAB5;

LAB7:    t1 = (t0 + 2632U);
    t2 = *((char **)t1);
    t1 = (t0 + 7072U);
    t5 = (t0 + 7374);
    t7 = (t9 + 0U);
    t8 = (t7 + 0U);
    *((int *)t8) = 0;
    t8 = (t7 + 4U);
    *((int *)t8) = 1;
    t8 = (t7 + 8U);
    *((int *)t8) = 1;
    t10 = (1 - 0);
    t11 = (t10 * 1);
    t11 = (t11 + 1);
    t8 = (t7 + 12U);
    *((unsigned int *)t8) = t11;
    t3 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t2, t1, t5, t9);
    if (t3 != 0)
        goto LAB8;

LAB9:    t1 = (t0 + 2632U);
    t2 = *((char **)t1);
    t1 = (t0 + 7072U);
    t5 = (t0 + 7376);
    t7 = (t9 + 0U);
    t8 = (t7 + 0U);
    *((int *)t8) = 0;
    t8 = (t7 + 4U);
    *((int *)t8) = 1;
    t8 = (t7 + 8U);
    *((int *)t8) = 1;
    t10 = (1 - 0);
    t11 = (t10 * 1);
    t11 = (t11 + 1);
    t8 = (t7 + 12U);
    *((unsigned int *)t8) = t11;
    t3 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t2, t1, t5, t9);
    if (t3 != 0)
        goto LAB10;

LAB11:
LAB6:
LAB3:    xsi_set_current_line(69, ng0);
    t1 = (t0 + 3048U);
    t2 = *((char **)t1);
    t1 = (t0 + 4672);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 16U);
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(70, ng0);
    t1 = (t0 + 3168U);
    t2 = *((char **)t1);
    t1 = (t0 + 4736);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 16U);
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(71, ng0);
    t1 = (t0 + 3288U);
    t2 = *((char **)t1);
    t1 = (t0 + 4800);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 16U);
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(72, ng0);
    t1 = (t0 + 2928U);
    t2 = *((char **)t1);
    t1 = (t0 + 4864);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 16U);
    xsi_driver_first_trans_fast_port(t1);
    t1 = (t0 + 4592);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(56, ng0);
    t1 = (t0 + 7292);
    t6 = (t0 + 2928U);
    t7 = *((char **)t6);
    t6 = (t7 + 0);
    memcpy(t6, t1, 16U);
    t8 = (t0 + 2872U);
    xsi_variable_act(t8);
    xsi_set_current_line(57, ng0);
    t1 = (t0 + 7308);
    t5 = (t0 + 3048U);
    t6 = *((char **)t5);
    t5 = (t6 + 0);
    memcpy(t5, t1, 16U);
    t7 = (t0 + 2992U);
    xsi_variable_act(t7);
    xsi_set_current_line(58, ng0);
    t1 = (t0 + 7324);
    t5 = (t0 + 3168U);
    t6 = *((char **)t5);
    t5 = (t6 + 0);
    memcpy(t5, t1, 16U);
    t7 = (t0 + 3112U);
    xsi_variable_act(t7);
    xsi_set_current_line(59, ng0);
    t1 = (t0 + 7340);
    t5 = (t0 + 3288U);
    t6 = *((char **)t5);
    t5 = (t6 + 0);
    memcpy(t5, t1, 16U);
    t7 = (t0 + 3232U);
    xsi_variable_act(t7);
    goto LAB3;

LAB5:    xsi_set_current_line(62, ng0);
    t8 = (t0 + 7358);
    t13 = (t0 + 2928U);
    t14 = *((char **)t13);
    t13 = (t14 + 0);
    memcpy(t13, t8, 16U);
    t15 = (t0 + 2872U);
    xsi_variable_act(t15);
    goto LAB6;

LAB8:    xsi_set_current_line(64, ng0);
    goto LAB6;

LAB10:    xsi_set_current_line(66, ng0);
    t8 = (t0 + 7378);
    t13 = (t0 + 3168U);
    t14 = *((char **)t13);
    t13 = (t14 + 0);
    memcpy(t13, t8, 16U);
    t15 = (t0 + 3112U);
    xsi_variable_act(t15);
    goto LAB6;

}


extern void work_a_3392787015_3212880686_init()
{
	static char *pe[] = {(void *)work_a_3392787015_3212880686_p_0};
	xsi_register_didat("work_a_3392787015_3212880686", "isim/testMemory_isim_beh.exe.sim/work/a_3392787015_3212880686.didat");
	xsi_register_executes(pe);
}
