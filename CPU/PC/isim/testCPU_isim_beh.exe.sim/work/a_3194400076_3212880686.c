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
static const char *ng0 = "G:/cpu/pipeline-cpu/CPU/PC/immidiate_mux_extend.vhd";



static void work_a_3194400076_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    int t4;
    char *t5;
    char *t6;
    int t7;
    char *t8;
    int t10;
    char *t11;
    char *t12;
    int t13;
    char *t14;
    int t16;
    char *t17;
    char *t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    char *t22;
    char *t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned char t27;
    unsigned char t28;
    static char *nl0[] = {&&LAB18, &&LAB18, &&LAB17, &&LAB16, &&LAB18, &&LAB18, &&LAB18, &&LAB18, &&LAB18};
    static char *nl1[] = {&&LAB22, &&LAB22, &&LAB20, &&LAB21, &&LAB22, &&LAB22, &&LAB22, &&LAB22, &&LAB22};
    static char *nl2[] = {&&LAB26, &&LAB26, &&LAB25, &&LAB24, &&LAB26, &&LAB26, &&LAB26, &&LAB26, &&LAB26};
    static char *nl3[] = {&&LAB30, &&LAB30, &&LAB28, &&LAB29, &&LAB30, &&LAB30, &&LAB30, &&LAB30, &&LAB30};
    static char *nl4[] = {&&LAB34, &&LAB34, &&LAB33, &&LAB32, &&LAB34, &&LAB34, &&LAB34, &&LAB34, &&LAB34};
    static char *nl5[] = {&&LAB38, &&LAB38, &&LAB36, &&LAB37, &&LAB38, &&LAB38, &&LAB38, &&LAB38, &&LAB38};
    static char *nl6[] = {&&LAB42, &&LAB42, &&LAB41, &&LAB40, &&LAB42, &&LAB42, &&LAB42, &&LAB42, &&LAB42};
    static char *nl7[] = {&&LAB46, &&LAB46, &&LAB44, &&LAB45, &&LAB46, &&LAB46, &&LAB46, &&LAB46, &&LAB46};
    static char *nl8[] = {&&LAB50, &&LAB50, &&LAB49, &&LAB48, &&LAB50, &&LAB50, &&LAB50, &&LAB50, &&LAB50};
    static char *nl9[] = {&&LAB54, &&LAB54, &&LAB52, &&LAB53, &&LAB54, &&LAB54, &&LAB54, &&LAB54, &&LAB54};

LAB0:    xsi_set_current_line(47, ng0);
    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t1 = (t0 + 5227);
    t4 = xsi_mem_cmp(t1, t2, 3U);
    if (t4 == 1)
        goto LAB3;

LAB9:    t5 = (t0 + 5230);
    t7 = xsi_mem_cmp(t5, t2, 3U);
    if (t7 == 1)
        goto LAB4;

LAB10:    t8 = (t0 + 5233);
    t10 = xsi_mem_cmp(t8, t2, 3U);
    if (t10 == 1)
        goto LAB5;

LAB11:    t11 = (t0 + 5236);
    t13 = xsi_mem_cmp(t11, t2, 3U);
    if (t13 == 1)
        goto LAB6;

LAB12:    t14 = (t0 + 5239);
    t16 = xsi_mem_cmp(t14, t2, 3U);
    if (t16 == 1)
        goto LAB7;

LAB13:
LAB8:    xsi_set_current_line(134, ng0);

LAB2:    xsi_set_current_line(136, ng0);
    t1 = (t0 + 1808U);
    t2 = *((char **)t1);
    t1 = (t0 + 3192);
    t3 = (t1 + 56U);
    t5 = *((char **)t3);
    t6 = (t5 + 56U);
    t8 = *((char **)t6);
    memcpy(t8, t2, 16U);
    xsi_driver_first_trans_fast_port(t1);
    t1 = (t0 + 3112);
    *((int *)t1) = 1;

LAB1:    return;
LAB3:    xsi_set_current_line(49, ng0);
    t17 = (t0 + 1032U);
    t18 = *((char **)t17);
    t19 = (10 - 7);
    t20 = (t19 * 1U);
    t21 = (0 + t20);
    t17 = (t18 + t21);
    t22 = (t0 + 1808U);
    t23 = *((char **)t22);
    t24 = (15 - 7);
    t25 = (t24 * 1U);
    t26 = (0 + t25);
    t22 = (t23 + t26);
    memcpy(t22, t17, 8U);
    xsi_set_current_line(50, ng0);
    t1 = (t0 + 1512U);
    t2 = *((char **)t1);
    t27 = *((unsigned char *)t2);
    t1 = (char *)((nl0) + t27);
    goto **((char **)t1);

LAB4:    xsi_set_current_line(66, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t19 = (10 - 3);
    t20 = (t19 * 1U);
    t21 = (0 + t20);
    t1 = (t2 + t21);
    t3 = (t0 + 1808U);
    t5 = *((char **)t3);
    t24 = (15 - 3);
    t25 = (t24 * 1U);
    t26 = (0 + t25);
    t3 = (t5 + t26);
    memcpy(t3, t1, 4U);
    xsi_set_current_line(67, ng0);
    t1 = (t0 + 1512U);
    t2 = *((char **)t1);
    t27 = *((unsigned char *)t2);
    t1 = (char *)((nl2) + t27);
    goto **((char **)t1);

LAB5:    xsi_set_current_line(83, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t19 = (10 - 10);
    t20 = (t19 * 1U);
    t21 = (0 + t20);
    t1 = (t2 + t21);
    t3 = (t0 + 1808U);
    t5 = *((char **)t3);
    t24 = (15 - 10);
    t25 = (t24 * 1U);
    t26 = (0 + t25);
    t3 = (t5 + t26);
    memcpy(t3, t1, 11U);
    xsi_set_current_line(84, ng0);
    t1 = (t0 + 1512U);
    t2 = *((char **)t1);
    t27 = *((unsigned char *)t2);
    t1 = (char *)((nl4) + t27);
    goto **((char **)t1);

LAB6:    xsi_set_current_line(100, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t19 = (10 - 4);
    t20 = (t19 * 1U);
    t21 = (0 + t20);
    t1 = (t2 + t21);
    t3 = (t0 + 1808U);
    t5 = *((char **)t3);
    t24 = (15 - 4);
    t25 = (t24 * 1U);
    t26 = (0 + t25);
    t3 = (t5 + t26);
    memcpy(t3, t1, 5U);
    xsi_set_current_line(101, ng0);
    t1 = (t0 + 1512U);
    t2 = *((char **)t1);
    t27 = *((unsigned char *)t2);
    t1 = (char *)((nl6) + t27);
    goto **((char **)t1);

LAB7:    xsi_set_current_line(117, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t19 = (10 - 4);
    t20 = (t19 * 1U);
    t21 = (0 + t20);
    t1 = (t2 + t21);
    t3 = (t0 + 1808U);
    t5 = *((char **)t3);
    t24 = (15 - 2);
    t25 = (t24 * 1U);
    t26 = (0 + t25);
    t3 = (t5 + t26);
    memcpy(t3, t1, 3U);
    xsi_set_current_line(118, ng0);
    t1 = (t0 + 1512U);
    t2 = *((char **)t1);
    t27 = *((unsigned char *)t2);
    t1 = (char *)((nl8) + t27);
    goto **((char **)t1);

LAB14:;
LAB15:    goto LAB2;

LAB16:    xsi_set_current_line(52, ng0);
    t3 = (t0 + 1032U);
    t5 = *((char **)t3);
    t4 = (7 - 10);
    t19 = (t4 * -1);
    t20 = (1U * t19);
    t21 = (0 + t20);
    t3 = (t5 + t21);
    t28 = *((unsigned char *)t3);
    t6 = (char *)((nl1) + t28);
    goto **((char **)t6);

LAB17:    xsi_set_current_line(61, ng0);
    t1 = (t0 + 5258);
    t3 = (t0 + 1808U);
    t5 = *((char **)t3);
    t19 = (15 - 15);
    t20 = (t19 * 1U);
    t21 = (0 + t20);
    t3 = (t5 + t21);
    memcpy(t3, t1, 8U);
    goto LAB15;

LAB18:    xsi_set_current_line(63, ng0);
    goto LAB15;

LAB19:    goto LAB15;

LAB20:    xsi_set_current_line(54, ng0);
    t8 = (t0 + 5242);
    t11 = (t0 + 1808U);
    t12 = *((char **)t11);
    t24 = (15 - 15);
    t25 = (t24 * 1U);
    t26 = (0 + t25);
    t11 = (t12 + t26);
    memcpy(t11, t8, 8U);
    goto LAB19;

LAB21:    xsi_set_current_line(56, ng0);
    t1 = (t0 + 5250);
    t3 = (t0 + 1808U);
    t5 = *((char **)t3);
    t19 = (15 - 15);
    t20 = (t19 * 1U);
    t21 = (0 + t20);
    t3 = (t5 + t21);
    memcpy(t3, t1, 8U);
    goto LAB19;

LAB22:    xsi_set_current_line(58, ng0);
    goto LAB19;

LAB23:    goto LAB2;

LAB24:    xsi_set_current_line(69, ng0);
    t3 = (t0 + 1032U);
    t5 = *((char **)t3);
    t4 = (3 - 10);
    t19 = (t4 * -1);
    t20 = (1U * t19);
    t21 = (0 + t20);
    t3 = (t5 + t21);
    t28 = *((unsigned char *)t3);
    t6 = (char *)((nl3) + t28);
    goto **((char **)t6);

LAB25:    xsi_set_current_line(78, ng0);
    t1 = (t0 + 5290);
    t3 = (t0 + 1808U);
    t5 = *((char **)t3);
    t19 = (15 - 15);
    t20 = (t19 * 1U);
    t21 = (0 + t20);
    t3 = (t5 + t21);
    memcpy(t3, t1, 12U);
    goto LAB23;

LAB26:    xsi_set_current_line(80, ng0);
    goto LAB23;

LAB27:    goto LAB23;

LAB28:    xsi_set_current_line(71, ng0);
    t8 = (t0 + 5266);
    t11 = (t0 + 1808U);
    t12 = *((char **)t11);
    t24 = (15 - 15);
    t25 = (t24 * 1U);
    t26 = (0 + t25);
    t11 = (t12 + t26);
    memcpy(t11, t8, 12U);
    goto LAB27;

LAB29:    xsi_set_current_line(73, ng0);
    t1 = (t0 + 5278);
    t3 = (t0 + 1808U);
    t5 = *((char **)t3);
    t19 = (15 - 15);
    t20 = (t19 * 1U);
    t21 = (0 + t20);
    t3 = (t5 + t21);
    memcpy(t3, t1, 12U);
    goto LAB27;

LAB30:    xsi_set_current_line(75, ng0);
    goto LAB27;

LAB31:    goto LAB2;

LAB32:    xsi_set_current_line(86, ng0);
    t3 = (t0 + 1032U);
    t5 = *((char **)t3);
    t4 = (10 - 10);
    t19 = (t4 * -1);
    t20 = (1U * t19);
    t21 = (0 + t20);
    t3 = (t5 + t21);
    t28 = *((unsigned char *)t3);
    t6 = (char *)((nl5) + t28);
    goto **((char **)t6);

LAB33:    xsi_set_current_line(95, ng0);
    t1 = (t0 + 5312);
    t3 = (t0 + 1808U);
    t5 = *((char **)t3);
    t19 = (15 - 15);
    t20 = (t19 * 1U);
    t21 = (0 + t20);
    t3 = (t5 + t21);
    memcpy(t3, t1, 5U);
    goto LAB31;

LAB34:    xsi_set_current_line(97, ng0);
    goto LAB31;

LAB35:    goto LAB31;

LAB36:    xsi_set_current_line(88, ng0);
    t8 = (t0 + 5302);
    t11 = (t0 + 1808U);
    t12 = *((char **)t11);
    t24 = (15 - 15);
    t25 = (t24 * 1U);
    t26 = (0 + t25);
    t11 = (t12 + t26);
    memcpy(t11, t8, 5U);
    goto LAB35;

LAB37:    xsi_set_current_line(90, ng0);
    t1 = (t0 + 5307);
    t3 = (t0 + 1808U);
    t5 = *((char **)t3);
    t19 = (15 - 15);
    t20 = (t19 * 1U);
    t21 = (0 + t20);
    t3 = (t5 + t21);
    memcpy(t3, t1, 5U);
    goto LAB35;

LAB38:    xsi_set_current_line(92, ng0);
    goto LAB35;

LAB39:    goto LAB2;

LAB40:    xsi_set_current_line(103, ng0);
    t3 = (t0 + 1032U);
    t5 = *((char **)t3);
    t4 = (4 - 10);
    t19 = (t4 * -1);
    t20 = (1U * t19);
    t21 = (0 + t20);
    t3 = (t5 + t21);
    t28 = *((unsigned char *)t3);
    t6 = (char *)((nl7) + t28);
    goto **((char **)t6);

LAB41:    xsi_set_current_line(112, ng0);
    t1 = (t0 + 5339);
    t3 = (t0 + 1808U);
    t5 = *((char **)t3);
    t19 = (15 - 15);
    t20 = (t19 * 1U);
    t21 = (0 + t20);
    t3 = (t5 + t21);
    memcpy(t3, t1, 11U);
    goto LAB39;

LAB42:    xsi_set_current_line(114, ng0);
    goto LAB39;

LAB43:    goto LAB39;

LAB44:    xsi_set_current_line(105, ng0);
    t8 = (t0 + 5317);
    t11 = (t0 + 1808U);
    t12 = *((char **)t11);
    t24 = (15 - 15);
    t25 = (t24 * 1U);
    t26 = (0 + t25);
    t11 = (t12 + t26);
    memcpy(t11, t8, 11U);
    goto LAB43;

LAB45:    xsi_set_current_line(107, ng0);
    t1 = (t0 + 5328);
    t3 = (t0 + 1808U);
    t5 = *((char **)t3);
    t19 = (15 - 15);
    t20 = (t19 * 1U);
    t21 = (0 + t20);
    t3 = (t5 + t21);
    memcpy(t3, t1, 11U);
    goto LAB43;

LAB46:    xsi_set_current_line(109, ng0);
    goto LAB43;

LAB47:    goto LAB2;

LAB48:    xsi_set_current_line(120, ng0);
    t3 = (t0 + 1032U);
    t5 = *((char **)t3);
    t4 = (4 - 10);
    t19 = (t4 * -1);
    t20 = (1U * t19);
    t21 = (0 + t20);
    t3 = (t5 + t21);
    t28 = *((unsigned char *)t3);
    t6 = (char *)((nl9) + t28);
    goto **((char **)t6);

LAB49:    xsi_set_current_line(129, ng0);
    t1 = (t0 + 5376);
    t3 = (t0 + 1808U);
    t5 = *((char **)t3);
    t19 = (15 - 15);
    t20 = (t19 * 1U);
    t21 = (0 + t20);
    t3 = (t5 + t21);
    memcpy(t3, t1, 13U);
    goto LAB47;

LAB50:    xsi_set_current_line(131, ng0);
    goto LAB47;

LAB51:    goto LAB47;

LAB52:    xsi_set_current_line(122, ng0);
    t8 = (t0 + 5350);
    t11 = (t0 + 1808U);
    t12 = *((char **)t11);
    t24 = (15 - 15);
    t25 = (t24 * 1U);
    t26 = (0 + t25);
    t11 = (t12 + t26);
    memcpy(t11, t8, 13U);
    goto LAB51;

LAB53:    xsi_set_current_line(124, ng0);
    t1 = (t0 + 5363);
    t3 = (t0 + 1808U);
    t5 = *((char **)t3);
    t19 = (15 - 15);
    t20 = (t19 * 1U);
    t21 = (0 + t20);
    t3 = (t5 + t21);
    memcpy(t3, t1, 13U);
    goto LAB51;

LAB54:    xsi_set_current_line(126, ng0);
    goto LAB51;

}


extern void work_a_3194400076_3212880686_init()
{
	static char *pe[] = {(void *)work_a_3194400076_3212880686_p_0};
	xsi_register_didat("work_a_3194400076_3212880686", "isim/testCPU_isim_beh.exe.sim/work/a_3194400076_3212880686.didat");
	xsi_register_executes(pe);
}
