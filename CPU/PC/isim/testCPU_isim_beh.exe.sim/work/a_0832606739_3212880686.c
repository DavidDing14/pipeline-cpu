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
static const char *ng0 = "G:/cpu/pipeline-cpu/CPU/PC/ALU.vhd";
extern char *IEEE_P_3620187407;
extern char *IEEE_P_2592010699;

char *ieee_p_2592010699_sub_1735675855_503743352(char *, char *, char *, char *, char *, char *);
char *ieee_p_2592010699_sub_1837678034_503743352(char *, char *, char *, char *);
char *ieee_p_2592010699_sub_795620321_503743352(char *, char *, char *, char *, char *, char *);
int ieee_p_3620187407_sub_514432868_3965413181(char *, char *, char *);
char *ieee_p_3620187407_sub_767668596_3965413181(char *, char *, char *, char *, char *, char *);
char *ieee_p_3620187407_sub_767740470_3965413181(char *, char *, char *, char *, char *, char *);


static void work_a_0832606739_3212880686_p_0(char *t0)
{
    char t32[16];
    char t52[16];
    char *t1;
    char *t2;
    char *t3;
    int t4;
    char *t5;
    char *t6;
    int t7;
    char *t8;
    char *t9;
    int t10;
    char *t11;
    char *t12;
    int t13;
    char *t14;
    int t16;
    char *t17;
    int t19;
    char *t20;
    int t22;
    char *t23;
    int t25;
    char *t26;
    int t28;
    char *t29;
    int t31;
    char *t33;
    char *t34;
    char *t35;
    char *t36;
    char *t37;
    char *t38;
    char *t39;
    char *t40;
    unsigned int t41;
    unsigned int t42;
    unsigned char t43;
    unsigned int t44;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    unsigned char t50;
    unsigned char t51;

LAB0:    xsi_set_current_line(49, ng0);
    t1 = (t0 + 1832U);
    t2 = *((char **)t1);
    t1 = (t0 + 5624);
    t4 = xsi_mem_cmp(t1, t2, 4U);
    if (t4 == 1)
        goto LAB3;

LAB14:    t5 = (t0 + 5628);
    t7 = xsi_mem_cmp(t5, t2, 4U);
    if (t7 == 1)
        goto LAB4;

LAB15:    t8 = (t0 + 5632);
    t10 = xsi_mem_cmp(t8, t2, 4U);
    if (t10 == 1)
        goto LAB5;

LAB16:    t11 = (t0 + 5636);
    t13 = xsi_mem_cmp(t11, t2, 4U);
    if (t13 == 1)
        goto LAB6;

LAB17:    t14 = (t0 + 5640);
    t16 = xsi_mem_cmp(t14, t2, 4U);
    if (t16 == 1)
        goto LAB7;

LAB18:    t17 = (t0 + 5644);
    t19 = xsi_mem_cmp(t17, t2, 4U);
    if (t19 == 1)
        goto LAB8;

LAB19:    t20 = (t0 + 5648);
    t22 = xsi_mem_cmp(t20, t2, 4U);
    if (t22 == 1)
        goto LAB9;

LAB20:    t23 = (t0 + 5652);
    t25 = xsi_mem_cmp(t23, t2, 4U);
    if (t25 == 1)
        goto LAB10;

LAB21:    t26 = (t0 + 5656);
    t28 = xsi_mem_cmp(t26, t2, 4U);
    if (t28 == 1)
        goto LAB11;

LAB22:    t29 = (t0 + 5660);
    t31 = xsi_mem_cmp(t29, t2, 4U);
    if (t31 == 1)
        goto LAB12;

LAB23:
LAB13:    xsi_set_current_line(95, ng0);

LAB2:    xsi_set_current_line(97, ng0);
    t1 = (t0 + 2128U);
    t2 = *((char **)t1);
    t1 = (t0 + 3512);
    t3 = (t1 + 56U);
    t5 = *((char **)t3);
    t6 = (t5 + 56U);
    t8 = *((char **)t6);
    memcpy(t8, t2, 16U);
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(98, ng0);
    t1 = (t0 + 2128U);
    t2 = *((char **)t1);
    t1 = (t0 + 3576);
    t3 = (t1 + 56U);
    t5 = *((char **)t3);
    t6 = (t5 + 56U);
    t8 = *((char **)t6);
    memcpy(t8, t2, 16U);
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(99, ng0);
    t1 = (t0 + 2128U);
    t2 = *((char **)t1);
    t1 = (t0 + 3640);
    t3 = (t1 + 56U);
    t5 = *((char **)t3);
    t6 = (t5 + 56U);
    t8 = *((char **)t6);
    memcpy(t8, t2, 16U);
    xsi_driver_first_trans_fast_port(t1);
    t1 = (t0 + 3432);
    *((int *)t1) = 1;

LAB1:    return;
LAB3:    xsi_set_current_line(51, ng0);
    t33 = (t0 + 1032U);
    t34 = *((char **)t33);
    t33 = (t0 + 5452U);
    t35 = (t0 + 1192U);
    t36 = *((char **)t35);
    t35 = (t0 + 5468U);
    t37 = ieee_p_3620187407_sub_767668596_3965413181(IEEE_P_3620187407, t32, t34, t33, t36, t35);
    t38 = (t0 + 2128U);
    t39 = *((char **)t38);
    t38 = (t39 + 0);
    t40 = (t32 + 12U);
    t41 = *((unsigned int *)t40);
    t42 = (1U * t41);
    memcpy(t38, t37, t42);
    goto LAB2;

LAB4:    xsi_set_current_line(53, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t1 = (t0 + 5452U);
    t3 = (t0 + 1192U);
    t5 = *((char **)t3);
    t3 = (t0 + 5468U);
    t6 = ieee_p_2592010699_sub_795620321_503743352(IEEE_P_2592010699, t32, t2, t1, t5, t3);
    t8 = (t0 + 2128U);
    t9 = *((char **)t8);
    t8 = (t9 + 0);
    t11 = (t32 + 12U);
    t41 = *((unsigned int *)t11);
    t42 = (1U * t41);
    memcpy(t8, t6, t42);
    goto LAB2;

LAB5:    xsi_set_current_line(55, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t1 = (t0 + 2128U);
    t3 = *((char **)t1);
    t1 = (t3 + 0);
    memcpy(t1, t2, 16U);
    goto LAB2;

LAB6:    xsi_set_current_line(57, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t1 = (t0 + 2128U);
    t3 = *((char **)t1);
    t1 = (t3 + 0);
    memcpy(t1, t2, 16U);
    goto LAB2;

LAB7:    xsi_set_current_line(59, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t1 = (t0 + 5468U);
    t3 = ieee_p_2592010699_sub_1837678034_503743352(IEEE_P_2592010699, t32, t2, t1);
    t5 = (t0 + 2128U);
    t6 = *((char **)t5);
    t5 = (t6 + 0);
    t8 = (t32 + 12U);
    t41 = *((unsigned int *)t8);
    t42 = (1U * t41);
    memcpy(t5, t3, t42);
    goto LAB2;

LAB8:    xsi_set_current_line(61, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t1 = (t0 + 5452U);
    t3 = (t0 + 1192U);
    t5 = *((char **)t3);
    t3 = (t0 + 5468U);
    t6 = ieee_p_2592010699_sub_1735675855_503743352(IEEE_P_2592010699, t32, t2, t1, t5, t3);
    t8 = (t0 + 2128U);
    t9 = *((char **)t8);
    t8 = (t9 + 0);
    t11 = (t32 + 12U);
    t41 = *((unsigned int *)t11);
    t42 = (1U * t41);
    memcpy(t8, t6, t42);
    goto LAB2;

LAB9:    xsi_set_current_line(63, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t1 = (t0 + 5468U);
    t4 = ieee_p_3620187407_sub_514432868_3965413181(IEEE_P_3620187407, t2, t1);
    t43 = (t4 > 15);
    if (t43 != 0)
        goto LAB25;

LAB27:    xsi_set_current_line(66, ng0);
    t1 = (t0 + 5680);
    t3 = (t0 + 2128U);
    t5 = *((char **)t3);
    t3 = (t5 + 0);
    memcpy(t3, t1, 16U);
    xsi_set_current_line(67, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t1 = (t0 + 1192U);
    t3 = *((char **)t1);
    t1 = (t0 + 5468U);
    t4 = ieee_p_3620187407_sub_514432868_3965413181(IEEE_P_3620187407, t3, t1);
    t7 = (15 - t4);
    t41 = (15 - t7);
    xsi_vhdl_check_range_of_slice(15, 0, -1, t7, 0, -1);
    t42 = (t41 * 1U);
    t44 = (0 + t42);
    t5 = (t2 + t44);
    t6 = (t0 + 2128U);
    t8 = *((char **)t6);
    t45 = (15 - 15);
    t6 = (t0 + 1192U);
    t9 = *((char **)t6);
    t6 = (t0 + 5468U);
    t10 = ieee_p_3620187407_sub_514432868_3965413181(IEEE_P_3620187407, t9, t6);
    xsi_vhdl_check_range_of_slice(15, 0, -1, 15, t10, -1);
    t46 = (t45 * 1U);
    t47 = (0 + t46);
    t11 = (t8 + t47);
    t12 = (t0 + 1192U);
    t14 = *((char **)t12);
    t12 = (t0 + 5468U);
    t13 = ieee_p_3620187407_sub_514432868_3965413181(IEEE_P_3620187407, t14, t12);
    t16 = (15 - t13);
    t19 = (0 - t16);
    t48 = (t19 * -1);
    t48 = (t48 + 1);
    t49 = (1U * t48);
    memcpy(t11, t5, t49);

LAB26:    goto LAB2;

LAB10:    xsi_set_current_line(70, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t4 = (15 - 15);
    t41 = (t4 * -1);
    t42 = (1U * t41);
    t44 = (0 + t42);
    t1 = (t2 + t44);
    t43 = *((unsigned char *)t1);
    t50 = (t43 == (unsigned char)2);
    if (t50 != 0)
        goto LAB28;

LAB30:    xsi_set_current_line(78, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t1 = (t0 + 5468U);
    t4 = ieee_p_3620187407_sub_514432868_3965413181(IEEE_P_3620187407, t2, t1);
    t43 = (t4 > 15);
    if (t43 != 0)
        goto LAB34;

LAB36:    xsi_set_current_line(81, ng0);
    t1 = (t0 + 5744);
    t3 = (t52 + 0U);
    t5 = (t3 + 0U);
    *((int *)t5) = 0;
    t5 = (t3 + 4U);
    *((int *)t5) = 15;
    t5 = (t3 + 8U);
    *((int *)t5) = 1;
    t4 = (15 - 0);
    t41 = (t4 * 1);
    t41 = (t41 + 1);
    t5 = (t3 + 12U);
    *((unsigned int *)t5) = t41;
    t5 = ieee_p_2592010699_sub_1837678034_503743352(IEEE_P_2592010699, t32, t1, t52);
    t6 = (t0 + 2128U);
    t8 = *((char **)t6);
    t6 = (t8 + 0);
    t9 = (t32 + 12U);
    t41 = *((unsigned int *)t9);
    t42 = (1U * t41);
    memcpy(t6, t5, t42);
    xsi_set_current_line(82, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t41 = (15 - 15);
    t1 = (t0 + 1192U);
    t3 = *((char **)t1);
    t1 = (t0 + 5468U);
    t4 = ieee_p_3620187407_sub_514432868_3965413181(IEEE_P_3620187407, t3, t1);
    xsi_vhdl_check_range_of_slice(15, 0, -1, 15, t4, -1);
    t42 = (t41 * 1U);
    t44 = (0 + t42);
    t5 = (t2 + t44);
    t6 = (t0 + 2128U);
    t8 = *((char **)t6);
    t6 = (t0 + 1192U);
    t9 = *((char **)t6);
    t6 = (t0 + 5468U);
    t7 = ieee_p_3620187407_sub_514432868_3965413181(IEEE_P_3620187407, t9, t6);
    t10 = (15 - t7);
    t45 = (15 - t10);
    xsi_vhdl_check_range_of_slice(15, 0, -1, t10, 0, -1);
    t46 = (t45 * 1U);
    t47 = (0 + t46);
    t11 = (t8 + t47);
    t12 = (t0 + 1192U);
    t14 = *((char **)t12);
    t12 = (t0 + 5468U);
    t13 = ieee_p_3620187407_sub_514432868_3965413181(IEEE_P_3620187407, t14, t12);
    t16 = (t13 - 15);
    t48 = (t16 * -1);
    t48 = (t48 + 1);
    t49 = (1U * t48);
    memcpy(t11, t5, t49);

LAB35:
LAB29:    goto LAB2;

LAB11:    xsi_set_current_line(86, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t1 = (t0 + 5468U);
    t4 = ieee_p_3620187407_sub_514432868_3965413181(IEEE_P_3620187407, t2, t1);
    t43 = (t4 > 15);
    if (t43 != 0)
        goto LAB37;

LAB39:    xsi_set_current_line(89, ng0);
    t1 = (t0 + 5776);
    t3 = (t0 + 2128U);
    t5 = *((char **)t3);
    t3 = (t5 + 0);
    memcpy(t3, t1, 16U);
    xsi_set_current_line(90, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t41 = (15 - 15);
    t1 = (t0 + 1192U);
    t3 = *((char **)t1);
    t1 = (t0 + 5468U);
    t4 = ieee_p_3620187407_sub_514432868_3965413181(IEEE_P_3620187407, t3, t1);
    xsi_vhdl_check_range_of_slice(15, 0, -1, 15, t4, -1);
    t42 = (t41 * 1U);
    t44 = (0 + t42);
    t5 = (t2 + t44);
    t6 = (t0 + 2128U);
    t8 = *((char **)t6);
    t6 = (t0 + 1192U);
    t9 = *((char **)t6);
    t6 = (t0 + 5468U);
    t7 = ieee_p_3620187407_sub_514432868_3965413181(IEEE_P_3620187407, t9, t6);
    t10 = (15 - t7);
    t45 = (15 - t10);
    xsi_vhdl_check_range_of_slice(15, 0, -1, t10, 0, -1);
    t46 = (t45 * 1U);
    t47 = (0 + t46);
    t11 = (t8 + t47);
    t12 = (t0 + 1192U);
    t14 = *((char **)t12);
    t12 = (t0 + 5468U);
    t13 = ieee_p_3620187407_sub_514432868_3965413181(IEEE_P_3620187407, t14, t12);
    t16 = (t13 - 15);
    t48 = (t16 * -1);
    t48 = (t48 + 1);
    t49 = (1U * t48);
    memcpy(t11, t5, t49);

LAB38:    goto LAB2;

LAB12:    xsi_set_current_line(93, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t1 = (t0 + 5452U);
    t3 = (t0 + 1192U);
    t5 = *((char **)t3);
    t3 = (t0 + 5468U);
    t6 = ieee_p_3620187407_sub_767740470_3965413181(IEEE_P_3620187407, t32, t2, t1, t5, t3);
    t8 = (t0 + 2128U);
    t9 = *((char **)t8);
    t8 = (t9 + 0);
    t11 = (t32 + 12U);
    t41 = *((unsigned int *)t11);
    t42 = (1U * t41);
    memcpy(t8, t6, t42);
    goto LAB2;

LAB24:;
LAB25:    xsi_set_current_line(64, ng0);
    t3 = (t0 + 5664);
    t6 = (t0 + 2128U);
    t8 = *((char **)t6);
    t6 = (t8 + 0);
    memcpy(t6, t3, 16U);
    goto LAB26;

LAB28:    xsi_set_current_line(71, ng0);
    t3 = (t0 + 1192U);
    t5 = *((char **)t3);
    t3 = (t0 + 5468U);
    t7 = ieee_p_3620187407_sub_514432868_3965413181(IEEE_P_3620187407, t5, t3);
    t51 = (t7 > 15);
    if (t51 != 0)
        goto LAB31;

LAB33:    xsi_set_current_line(74, ng0);
    t1 = (t0 + 5712);
    t3 = (t0 + 2128U);
    t5 = *((char **)t3);
    t3 = (t5 + 0);
    memcpy(t3, t1, 16U);
    xsi_set_current_line(75, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t41 = (15 - 15);
    t1 = (t0 + 1192U);
    t3 = *((char **)t1);
    t1 = (t0 + 5468U);
    t4 = ieee_p_3620187407_sub_514432868_3965413181(IEEE_P_3620187407, t3, t1);
    xsi_vhdl_check_range_of_slice(15, 0, -1, 15, t4, -1);
    t42 = (t41 * 1U);
    t44 = (0 + t42);
    t5 = (t2 + t44);
    t6 = (t0 + 2128U);
    t8 = *((char **)t6);
    t6 = (t0 + 1192U);
    t9 = *((char **)t6);
    t6 = (t0 + 5468U);
    t7 = ieee_p_3620187407_sub_514432868_3965413181(IEEE_P_3620187407, t9, t6);
    t10 = (15 - t7);
    t45 = (15 - t10);
    xsi_vhdl_check_range_of_slice(15, 0, -1, t10, 0, -1);
    t46 = (t45 * 1U);
    t47 = (0 + t46);
    t11 = (t8 + t47);
    t12 = (t0 + 1192U);
    t14 = *((char **)t12);
    t12 = (t0 + 5468U);
    t13 = ieee_p_3620187407_sub_514432868_3965413181(IEEE_P_3620187407, t14, t12);
    t16 = (t13 - 15);
    t48 = (t16 * -1);
    t48 = (t48 + 1);
    t49 = (1U * t48);
    memcpy(t11, t5, t49);

LAB32:    goto LAB29;

LAB31:    xsi_set_current_line(72, ng0);
    t6 = (t0 + 5696);
    t9 = (t0 + 2128U);
    t11 = *((char **)t9);
    t9 = (t11 + 0);
    memcpy(t9, t6, 16U);
    goto LAB32;

LAB34:    xsi_set_current_line(79, ng0);
    t3 = (t0 + 5728);
    t6 = (t52 + 0U);
    t8 = (t6 + 0U);
    *((int *)t8) = 0;
    t8 = (t6 + 4U);
    *((int *)t8) = 15;
    t8 = (t6 + 8U);
    *((int *)t8) = 1;
    t7 = (15 - 0);
    t41 = (t7 * 1);
    t41 = (t41 + 1);
    t8 = (t6 + 12U);
    *((unsigned int *)t8) = t41;
    t8 = ieee_p_2592010699_sub_1837678034_503743352(IEEE_P_2592010699, t32, t3, t52);
    t9 = (t0 + 2128U);
    t11 = *((char **)t9);
    t9 = (t11 + 0);
    t12 = (t32 + 12U);
    t41 = *((unsigned int *)t12);
    t42 = (1U * t41);
    memcpy(t9, t8, t42);
    goto LAB35;

LAB37:    xsi_set_current_line(87, ng0);
    t3 = (t0 + 5760);
    t6 = (t0 + 2128U);
    t8 = *((char **)t6);
    t6 = (t8 + 0);
    memcpy(t6, t3, 16U);
    goto LAB38;

}


extern void work_a_0832606739_3212880686_init()
{
	static char *pe[] = {(void *)work_a_0832606739_3212880686_p_0};
	xsi_register_didat("work_a_0832606739_3212880686", "isim/testCPU_isim_beh.exe.sim/work/a_0832606739_3212880686.didat");
	xsi_register_executes(pe);
}
