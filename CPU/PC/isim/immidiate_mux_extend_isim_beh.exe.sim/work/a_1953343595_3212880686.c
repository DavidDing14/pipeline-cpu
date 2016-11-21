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
static const char *ng0 = "E:/pipeline-cpu/CPU/PC/immidiate_mux_extend.vhd";



static void work_a_1953343595_3212880686_p_0(char *t0)
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
    char *t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    char *t19;
    char *t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    unsigned char t24;
    unsigned char t25;
    static char *nl0[] = {&&LAB16, &&LAB16, &&LAB14, &&LAB15, &&LAB16, &&LAB16, &&LAB16, &&LAB16, &&LAB16};
    static char *nl1[] = {&&LAB20, &&LAB20, &&LAB18, &&LAB19, &&LAB20, &&LAB20, &&LAB20, &&LAB20, &&LAB20};
    static char *nl2[] = {&&LAB24, &&LAB24, &&LAB22, &&LAB23, &&LAB24, &&LAB24, &&LAB24, &&LAB24, &&LAB24};
    static char *nl3[] = {&&LAB28, &&LAB28, &&LAB26, &&LAB27, &&LAB28, &&LAB28, &&LAB28, &&LAB28, &&LAB28};
    static char *nl4[] = {&&LAB32, &&LAB32, &&LAB30, &&LAB31, &&LAB32, &&LAB32, &&LAB32, &&LAB32, &&LAB32};
    static char *nl5[] = {&&LAB36, &&LAB36, &&LAB34, &&LAB35, &&LAB36, &&LAB36, &&LAB36, &&LAB36, &&LAB36};
    static char *nl6[] = {&&LAB40, &&LAB40, &&LAB38, &&LAB39, &&LAB40, &&LAB40, &&LAB40, &&LAB40, &&LAB40};
    static char *nl7[] = {&&LAB44, &&LAB44, &&LAB42, &&LAB43, &&LAB44, &&LAB44, &&LAB44, &&LAB44, &&LAB44};
    static char *nl8[] = {&&LAB48, &&LAB48, &&LAB46, &&LAB47, &&LAB48, &&LAB48, &&LAB48, &&LAB48, &&LAB48};
    static char *nl9[] = {&&LAB52, &&LAB52, &&LAB50, &&LAB51, &&LAB52, &&LAB52, &&LAB52, &&LAB52, &&LAB52};

LAB0:    xsi_set_current_line(47, ng0);
    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t1 = (t0 + 5191);
    t4 = xsi_mem_cmp(t1, t2, 3U);
    if (t4 == 1)
        goto LAB3;

LAB8:    t5 = (t0 + 5194);
    t7 = xsi_mem_cmp(t5, t2, 3U);
    if (t7 == 1)
        goto LAB4;

LAB9:    t8 = (t0 + 5197);
    t10 = xsi_mem_cmp(t8, t2, 3U);
    if (t10 == 1)
        goto LAB5;

LAB10:    t11 = (t0 + 5200);
    t13 = xsi_mem_cmp(t11, t2, 3U);
    if (t13 == 1)
        goto LAB6;

LAB11:
LAB7:    xsi_set_current_line(117, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t16 = (10 - 4);
    t17 = (t16 * 1U);
    t18 = (0 + t17);
    t1 = (t2 + t18);
    t3 = (t0 + 1808U);
    t5 = *((char **)t3);
    t21 = (15 - 2);
    t22 = (t21 * 1U);
    t23 = (0 + t22);
    t3 = (t5 + t23);
    memcpy(t3, t1, 3U);
    xsi_set_current_line(118, ng0);
    t1 = (t0 + 1512U);
    t2 = *((char **)t1);
    t24 = *((unsigned char *)t2);
    t1 = (char *)((nl8) + t24);
    goto **((char **)t1);

LAB2:    xsi_set_current_line(134, ng0);
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
    t14 = (t0 + 1032U);
    t15 = *((char **)t14);
    t16 = (10 - 7);
    t17 = (t16 * 1U);
    t18 = (0 + t17);
    t14 = (t15 + t18);
    t19 = (t0 + 1808U);
    t20 = *((char **)t19);
    t21 = (15 - 7);
    t22 = (t21 * 1U);
    t23 = (0 + t22);
    t19 = (t20 + t23);
    memcpy(t19, t14, 8U);
    xsi_set_current_line(50, ng0);
    t1 = (t0 + 1512U);
    t2 = *((char **)t1);
    t24 = *((unsigned char *)t2);
    t1 = (char *)((nl0) + t24);
    goto **((char **)t1);

LAB4:    xsi_set_current_line(66, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t16 = (10 - 3);
    t17 = (t16 * 1U);
    t18 = (0 + t17);
    t1 = (t2 + t18);
    t3 = (t0 + 1808U);
    t5 = *((char **)t3);
    t21 = (15 - 3);
    t22 = (t21 * 1U);
    t23 = (0 + t22);
    t3 = (t5 + t23);
    memcpy(t3, t1, 4U);
    xsi_set_current_line(67, ng0);
    t1 = (t0 + 1512U);
    t2 = *((char **)t1);
    t24 = *((unsigned char *)t2);
    t1 = (char *)((nl2) + t24);
    goto **((char **)t1);

LAB5:    xsi_set_current_line(83, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t16 = (10 - 10);
    t17 = (t16 * 1U);
    t18 = (0 + t17);
    t1 = (t2 + t18);
    t3 = (t0 + 1808U);
    t5 = *((char **)t3);
    t21 = (15 - 10);
    t22 = (t21 * 1U);
    t23 = (0 + t22);
    t3 = (t5 + t23);
    memcpy(t3, t1, 11U);
    xsi_set_current_line(84, ng0);
    t1 = (t0 + 1512U);
    t2 = *((char **)t1);
    t24 = *((unsigned char *)t2);
    t1 = (char *)((nl4) + t24);
    goto **((char **)t1);

LAB6:    xsi_set_current_line(100, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t16 = (10 - 4);
    t17 = (t16 * 1U);
    t18 = (0 + t17);
    t1 = (t2 + t18);
    t3 = (t0 + 1808U);
    t5 = *((char **)t3);
    t21 = (15 - 4);
    t22 = (t21 * 1U);
    t23 = (0 + t22);
    t3 = (t5 + t23);
    memcpy(t3, t1, 5U);
    xsi_set_current_line(101, ng0);
    t1 = (t0 + 1512U);
    t2 = *((char **)t1);
    t24 = *((unsigned char *)t2);
    t1 = (char *)((nl6) + t24);
    goto **((char **)t1);

LAB12:;
LAB13:    goto LAB2;

LAB14:    xsi_set_current_line(52, ng0);
    t3 = (t0 + 1032U);
    t5 = *((char **)t3);
    t4 = (7 - 10);
    t16 = (t4 * -1);
    t17 = (1U * t16);
    t18 = (0 + t17);
    t3 = (t5 + t18);
    t25 = *((unsigned char *)t3);
    t6 = (char *)((nl1) + t25);
    goto **((char **)t6);

LAB15:    xsi_set_current_line(61, ng0);
    t1 = (t0 + 5219);
    t3 = (t0 + 1808U);
    t5 = *((char **)t3);
    t16 = (15 - 15);
    t17 = (t16 * 1U);
    t18 = (0 + t17);
    t3 = (t5 + t18);
    memcpy(t3, t1, 8U);
    goto LAB13;

LAB16:    xsi_set_current_line(63, ng0);
    goto LAB13;

LAB17:    goto LAB13;

LAB18:    xsi_set_current_line(54, ng0);
    t8 = (t0 + 5203);
    t11 = (t0 + 1808U);
    t12 = *((char **)t11);
    t21 = (15 - 15);
    t22 = (t21 * 1U);
    t23 = (0 + t22);
    t11 = (t12 + t23);
    memcpy(t11, t8, 8U);
    goto LAB17;

LAB19:    xsi_set_current_line(56, ng0);
    t1 = (t0 + 5211);
    t3 = (t0 + 1808U);
    t5 = *((char **)t3);
    t16 = (15 - 15);
    t17 = (t16 * 1U);
    t18 = (0 + t17);
    t3 = (t5 + t18);
    memcpy(t3, t1, 8U);
    goto LAB17;

LAB20:    xsi_set_current_line(58, ng0);
    goto LAB17;

LAB21:    goto LAB2;

LAB22:    xsi_set_current_line(69, ng0);
    t3 = (t0 + 1032U);
    t5 = *((char **)t3);
    t4 = (3 - 10);
    t16 = (t4 * -1);
    t17 = (1U * t16);
    t18 = (0 + t17);
    t3 = (t5 + t18);
    t25 = *((unsigned char *)t3);
    t6 = (char *)((nl3) + t25);
    goto **((char **)t6);

LAB23:    xsi_set_current_line(78, ng0);
    t1 = (t0 + 5251);
    t3 = (t0 + 1808U);
    t5 = *((char **)t3);
    t16 = (15 - 15);
    t17 = (t16 * 1U);
    t18 = (0 + t17);
    t3 = (t5 + t18);
    memcpy(t3, t1, 12U);
    goto LAB21;

LAB24:    xsi_set_current_line(80, ng0);
    goto LAB21;

LAB25:    goto LAB21;

LAB26:    xsi_set_current_line(71, ng0);
    t8 = (t0 + 5227);
    t11 = (t0 + 1808U);
    t12 = *((char **)t11);
    t21 = (15 - 15);
    t22 = (t21 * 1U);
    t23 = (0 + t22);
    t11 = (t12 + t23);
    memcpy(t11, t8, 12U);
    goto LAB25;

LAB27:    xsi_set_current_line(73, ng0);
    t1 = (t0 + 5239);
    t3 = (t0 + 1808U);
    t5 = *((char **)t3);
    t16 = (15 - 15);
    t17 = (t16 * 1U);
    t18 = (0 + t17);
    t3 = (t5 + t18);
    memcpy(t3, t1, 12U);
    goto LAB25;

LAB28:    xsi_set_current_line(75, ng0);
    goto LAB25;

LAB29:    goto LAB2;

LAB30:    xsi_set_current_line(86, ng0);
    t3 = (t0 + 1032U);
    t5 = *((char **)t3);
    t4 = (10 - 10);
    t16 = (t4 * -1);
    t17 = (1U * t16);
    t18 = (0 + t17);
    t3 = (t5 + t18);
    t25 = *((unsigned char *)t3);
    t6 = (char *)((nl5) + t25);
    goto **((char **)t6);

LAB31:    xsi_set_current_line(95, ng0);
    t1 = (t0 + 5273);
    t3 = (t0 + 1808U);
    t5 = *((char **)t3);
    t16 = (15 - 15);
    t17 = (t16 * 1U);
    t18 = (0 + t17);
    t3 = (t5 + t18);
    memcpy(t3, t1, 5U);
    goto LAB29;

LAB32:    xsi_set_current_line(97, ng0);
    goto LAB29;

LAB33:    goto LAB29;

LAB34:    xsi_set_current_line(88, ng0);
    t8 = (t0 + 5263);
    t11 = (t0 + 1808U);
    t12 = *((char **)t11);
    t21 = (15 - 15);
    t22 = (t21 * 1U);
    t23 = (0 + t22);
    t11 = (t12 + t23);
    memcpy(t11, t8, 5U);
    goto LAB33;

LAB35:    xsi_set_current_line(90, ng0);
    t1 = (t0 + 5268);
    t3 = (t0 + 1808U);
    t5 = *((char **)t3);
    t16 = (15 - 15);
    t17 = (t16 * 1U);
    t18 = (0 + t17);
    t3 = (t5 + t18);
    memcpy(t3, t1, 5U);
    goto LAB33;

LAB36:    xsi_set_current_line(92, ng0);
    goto LAB33;

LAB37:    goto LAB2;

LAB38:    xsi_set_current_line(103, ng0);
    t3 = (t0 + 1032U);
    t5 = *((char **)t3);
    t4 = (4 - 10);
    t16 = (t4 * -1);
    t17 = (1U * t16);
    t18 = (0 + t17);
    t3 = (t5 + t18);
    t25 = *((unsigned char *)t3);
    t6 = (char *)((nl7) + t25);
    goto **((char **)t6);

LAB39:    xsi_set_current_line(112, ng0);
    t1 = (t0 + 5300);
    t3 = (t0 + 1808U);
    t5 = *((char **)t3);
    t16 = (15 - 15);
    t17 = (t16 * 1U);
    t18 = (0 + t17);
    t3 = (t5 + t18);
    memcpy(t3, t1, 11U);
    goto LAB37;

LAB40:    xsi_set_current_line(114, ng0);
    goto LAB37;

LAB41:    goto LAB37;

LAB42:    xsi_set_current_line(105, ng0);
    t8 = (t0 + 5278);
    t11 = (t0 + 1808U);
    t12 = *((char **)t11);
    t21 = (15 - 15);
    t22 = (t21 * 1U);
    t23 = (0 + t22);
    t11 = (t12 + t23);
    memcpy(t11, t8, 11U);
    goto LAB41;

LAB43:    xsi_set_current_line(107, ng0);
    t1 = (t0 + 5289);
    t3 = (t0 + 1808U);
    t5 = *((char **)t3);
    t16 = (15 - 15);
    t17 = (t16 * 1U);
    t18 = (0 + t17);
    t3 = (t5 + t18);
    memcpy(t3, t1, 11U);
    goto LAB41;

LAB44:    xsi_set_current_line(109, ng0);
    goto LAB41;

LAB45:    goto LAB2;

LAB46:    xsi_set_current_line(120, ng0);
    t3 = (t0 + 1032U);
    t5 = *((char **)t3);
    t4 = (4 - 10);
    t16 = (t4 * -1);
    t17 = (1U * t16);
    t18 = (0 + t17);
    t3 = (t5 + t18);
    t25 = *((unsigned char *)t3);
    t6 = (char *)((nl9) + t25);
    goto **((char **)t6);

LAB47:    xsi_set_current_line(129, ng0);
    t1 = (t0 + 5337);
    t3 = (t0 + 1808U);
    t5 = *((char **)t3);
    t16 = (15 - 15);
    t17 = (t16 * 1U);
    t18 = (0 + t17);
    t3 = (t5 + t18);
    memcpy(t3, t1, 13U);
    goto LAB45;

LAB48:    xsi_set_current_line(131, ng0);
    goto LAB45;

LAB49:    goto LAB45;

LAB50:    xsi_set_current_line(122, ng0);
    t8 = (t0 + 5311);
    t11 = (t0 + 1808U);
    t12 = *((char **)t11);
    t21 = (15 - 15);
    t22 = (t21 * 1U);
    t23 = (0 + t22);
    t11 = (t12 + t23);
    memcpy(t11, t8, 13U);
    goto LAB49;

LAB51:    xsi_set_current_line(124, ng0);
    t1 = (t0 + 5324);
    t3 = (t0 + 1808U);
    t5 = *((char **)t3);
    t16 = (15 - 15);
    t17 = (t16 * 1U);
    t18 = (0 + t17);
    t3 = (t5 + t18);
    memcpy(t3, t1, 13U);
    goto LAB49;

LAB52:    xsi_set_current_line(126, ng0);
    goto LAB49;

}


extern void work_a_1953343595_3212880686_init()
{
	static char *pe[] = {(void *)work_a_1953343595_3212880686_p_0};
	xsi_register_didat("work_a_1953343595_3212880686", "isim/immidiate_mux_extend_isim_beh.exe.sim/work/a_1953343595_3212880686.didat");
	xsi_register_executes(pe);
}
