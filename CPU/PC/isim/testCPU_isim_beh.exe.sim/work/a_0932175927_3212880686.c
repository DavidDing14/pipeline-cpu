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
static const char *ng0 = "E:/pipeline-cpu/CPU/PC/IDEX_Reg.vhd";



static void work_a_0932175927_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    unsigned char t8;
    unsigned char t9;
    unsigned char t10;
    unsigned char t11;
    unsigned char t12;
    int t13;
    unsigned char t14;
    char *t15;
    char *t16;
    char *t17;

LAB0:    xsi_set_current_line(87, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)2);
    if (t4 != 0)
        goto LAB2;

LAB4:    t1 = (t0 + 992U);
    t4 = xsi_signal_has_event(t1);
    if (t4 == 1)
        goto LAB7;

LAB8:    t3 = (unsigned char)0;

LAB9:    if (t3 != 0)
        goto LAB5;

LAB6:
LAB3:    xsi_set_current_line(148, ng0);
    t1 = (t0 + 6408U);
    t2 = *((char **)t1);
    t1 = (t0 + 9352);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t15 = *((char **)t7);
    memcpy(t15, t2, 16U);
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(149, ng0);
    t1 = (t0 + 6528U);
    t2 = *((char **)t1);
    t1 = (t0 + 9416);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t15 = *((char **)t7);
    memcpy(t15, t2, 16U);
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(150, ng0);
    t1 = (t0 + 6768U);
    t2 = *((char **)t1);
    t1 = (t0 + 9480);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t15 = *((char **)t7);
    memcpy(t15, t2, 16U);
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(151, ng0);
    t1 = (t0 + 6288U);
    t2 = *((char **)t1);
    t1 = (t0 + 9544);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t15 = *((char **)t7);
    memcpy(t15, t2, 16U);
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(152, ng0);
    t1 = (t0 + 6648U);
    t2 = *((char **)t1);
    t1 = (t0 + 9608);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t15 = *((char **)t7);
    memcpy(t15, t2, 4U);
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(153, ng0);
    t1 = (t0 + 6888U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 9672);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t15 = *((char **)t7);
    *((unsigned char *)t15) = t3;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(154, ng0);
    t1 = (t0 + 7008U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 9736);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t15 = *((char **)t7);
    *((unsigned char *)t15) = t3;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(155, ng0);
    t1 = (t0 + 7128U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 9800);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t15 = *((char **)t7);
    *((unsigned char *)t15) = t3;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(156, ng0);
    t1 = (t0 + 7248U);
    t2 = *((char **)t1);
    t1 = (t0 + 9864);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t15 = *((char **)t7);
    memcpy(t15, t2, 4U);
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(157, ng0);
    t1 = (t0 + 7368U);
    t2 = *((char **)t1);
    t1 = (t0 + 9928);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t15 = *((char **)t7);
    memcpy(t15, t2, 2U);
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(158, ng0);
    t1 = (t0 + 7488U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 9992);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t15 = *((char **)t7);
    *((unsigned char *)t15) = t3;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(159, ng0);
    t1 = (t0 + 7608U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 10056);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t15 = *((char **)t7);
    *((unsigned char *)t15) = t3;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(160, ng0);
    t1 = (t0 + 7848U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 10120);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t15 = *((char **)t7);
    *((unsigned char *)t15) = t3;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(161, ng0);
    t1 = (t0 + 7968U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 10184);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t15 = *((char **)t7);
    *((unsigned char *)t15) = t3;
    xsi_driver_first_trans_fast_port(t1);
    t1 = (t0 + 9272);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(88, ng0);
    t1 = (t0 + 14562);
    t6 = (t0 + 6288U);
    t7 = *((char **)t6);
    t6 = (t7 + 0);
    memcpy(t6, t1, 16U);
    xsi_set_current_line(89, ng0);
    t1 = (t0 + 14578);
    t5 = (t0 + 6408U);
    t6 = *((char **)t5);
    t5 = (t6 + 0);
    memcpy(t5, t1, 16U);
    xsi_set_current_line(90, ng0);
    t1 = (t0 + 14594);
    t5 = (t0 + 6528U);
    t6 = *((char **)t5);
    t5 = (t6 + 0);
    memcpy(t5, t1, 16U);
    xsi_set_current_line(91, ng0);
    t1 = (t0 + 14610);
    t5 = (t0 + 6768U);
    t6 = *((char **)t5);
    t5 = (t6 + 0);
    memcpy(t5, t1, 16U);
    xsi_set_current_line(92, ng0);
    t1 = (t0 + 14626);
    t5 = (t0 + 6648U);
    t6 = *((char **)t5);
    t5 = (t6 + 0);
    memcpy(t5, t1, 4U);
    xsi_set_current_line(93, ng0);
    t1 = (t0 + 6888U);
    t2 = *((char **)t1);
    t1 = (t2 + 0);
    *((unsigned char *)t1) = (unsigned char)2;
    xsi_set_current_line(94, ng0);
    t1 = (t0 + 7008U);
    t2 = *((char **)t1);
    t1 = (t2 + 0);
    *((unsigned char *)t1) = (unsigned char)2;
    xsi_set_current_line(95, ng0);
    t1 = (t0 + 7128U);
    t2 = *((char **)t1);
    t1 = (t2 + 0);
    *((unsigned char *)t1) = (unsigned char)2;
    xsi_set_current_line(96, ng0);
    t1 = (t0 + 14630);
    t5 = (t0 + 7248U);
    t6 = *((char **)t5);
    t5 = (t6 + 0);
    memcpy(t5, t1, 4U);
    xsi_set_current_line(97, ng0);
    t1 = (t0 + 14634);
    t5 = (t0 + 7368U);
    t6 = *((char **)t5);
    t5 = (t6 + 0);
    memcpy(t5, t1, 2U);
    xsi_set_current_line(98, ng0);
    t1 = (t0 + 7488U);
    t2 = *((char **)t1);
    t1 = (t2 + 0);
    *((unsigned char *)t1) = (unsigned char)2;
    xsi_set_current_line(99, ng0);
    t1 = (t0 + 7608U);
    t2 = *((char **)t1);
    t1 = (t2 + 0);
    *((unsigned char *)t1) = (unsigned char)2;
    xsi_set_current_line(100, ng0);
    t1 = (t0 + 7728U);
    t2 = *((char **)t1);
    t1 = (t2 + 0);
    *((int *)t1) = 0;
    xsi_set_current_line(101, ng0);
    t1 = (t0 + 7848U);
    t2 = *((char **)t1);
    t1 = (t2 + 0);
    *((unsigned char *)t1) = (unsigned char)2;
    xsi_set_current_line(102, ng0);
    t1 = (t0 + 7968U);
    t2 = *((char **)t1);
    t1 = (t2 + 0);
    *((unsigned char *)t1) = (unsigned char)2;
    goto LAB3;

LAB5:    xsi_set_current_line(104, ng0);
    t2 = (t0 + 1672U);
    t6 = *((char **)t2);
    t11 = *((unsigned char *)t6);
    t12 = (t11 == (unsigned char)3);
    if (t12 == 1)
        goto LAB13;

LAB14:    t2 = (t0 + 7728U);
    t7 = *((char **)t2);
    t13 = *((int *)t7);
    t14 = (t13 == 1);
    t10 = t14;

LAB15:    if (t10 != 0)
        goto LAB10;

LAB12:    xsi_set_current_line(121, ng0);
    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t1 = (t0 + 6288U);
    t5 = *((char **)t1);
    t1 = (t5 + 0);
    memcpy(t1, t2, 16U);
    xsi_set_current_line(122, ng0);
    t1 = (t0 + 1832U);
    t2 = *((char **)t1);
    t1 = (t0 + 6408U);
    t5 = *((char **)t1);
    t1 = (t5 + 0);
    memcpy(t1, t2, 16U);
    xsi_set_current_line(123, ng0);
    t1 = (t0 + 1992U);
    t2 = *((char **)t1);
    t1 = (t0 + 6528U);
    t5 = *((char **)t1);
    t1 = (t5 + 0);
    memcpy(t1, t2, 16U);
    xsi_set_current_line(124, ng0);
    t1 = (t0 + 2312U);
    t2 = *((char **)t1);
    t1 = (t0 + 6768U);
    t5 = *((char **)t1);
    t1 = (t5 + 0);
    memcpy(t1, t2, 16U);
    xsi_set_current_line(125, ng0);
    t1 = (t0 + 2152U);
    t2 = *((char **)t1);
    t1 = (t0 + 6648U);
    t5 = *((char **)t1);
    t1 = (t5 + 0);
    memcpy(t1, t2, 4U);
    xsi_set_current_line(126, ng0);
    t1 = (t0 + 2472U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 6888U);
    t5 = *((char **)t1);
    t1 = (t5 + 0);
    *((unsigned char *)t1) = t3;
    xsi_set_current_line(127, ng0);
    t1 = (t0 + 2632U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 7008U);
    t5 = *((char **)t1);
    t1 = (t5 + 0);
    *((unsigned char *)t1) = t3;
    xsi_set_current_line(128, ng0);
    t1 = (t0 + 5992U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)2);
    if (t4 != 0)
        goto LAB16;

LAB18:    xsi_set_current_line(131, ng0);
    t1 = (t0 + 7128U);
    t2 = *((char **)t1);
    t1 = (t2 + 0);
    *((unsigned char *)t1) = (unsigned char)2;

LAB17:    xsi_set_current_line(133, ng0);
    t1 = (t0 + 2952U);
    t2 = *((char **)t1);
    t1 = (t0 + 7248U);
    t5 = *((char **)t1);
    t1 = (t5 + 0);
    memcpy(t1, t2, 4U);
    xsi_set_current_line(134, ng0);
    t1 = (t0 + 3112U);
    t2 = *((char **)t1);
    t1 = (t0 + 7368U);
    t5 = *((char **)t1);
    t1 = (t5 + 0);
    memcpy(t1, t2, 2U);
    xsi_set_current_line(135, ng0);
    t1 = (t0 + 3272U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 7488U);
    t5 = *((char **)t1);
    t1 = (t5 + 0);
    *((unsigned char *)t1) = t3;
    xsi_set_current_line(136, ng0);
    t1 = (t0 + 3432U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t1 = (t0 + 7608U);
    t5 = *((char **)t1);
    t1 = (t5 + 0);
    *((unsigned char *)t1) = t3;
    xsi_set_current_line(138, ng0);
    t1 = (t0 + 5352U);
    t2 = *((char **)t1);
    t4 = *((unsigned char *)t2);
    t8 = (t4 == (unsigned char)3);
    if (t8 == 1)
        goto LAB22;

LAB23:    t1 = (t0 + 5512U);
    t5 = *((char **)t1);
    t9 = *((unsigned char *)t5);
    t10 = (t9 == (unsigned char)3);
    t3 = t10;

LAB24:    if (t3 != 0)
        goto LAB19;

LAB21:    xsi_set_current_line(143, ng0);
    t1 = (t0 + 7848U);
    t2 = *((char **)t1);
    t1 = (t2 + 0);
    *((unsigned char *)t1) = (unsigned char)2;
    xsi_set_current_line(144, ng0);
    t1 = (t0 + 7968U);
    t2 = *((char **)t1);
    t1 = (t2 + 0);
    *((unsigned char *)t1) = (unsigned char)2;

LAB20:
LAB11:    goto LAB3;

LAB7:    t2 = (t0 + 1032U);
    t5 = *((char **)t2);
    t8 = *((unsigned char *)t5);
    t9 = (t8 == (unsigned char)3);
    t3 = t9;
    goto LAB9;

LAB10:    xsi_set_current_line(105, ng0);
    t2 = (t0 + 14636);
    t16 = (t0 + 6288U);
    t17 = *((char **)t16);
    t16 = (t17 + 0);
    memcpy(t16, t2, 16U);
    xsi_set_current_line(106, ng0);
    t1 = (t0 + 14652);
    t5 = (t0 + 6408U);
    t6 = *((char **)t5);
    t5 = (t6 + 0);
    memcpy(t5, t1, 16U);
    xsi_set_current_line(107, ng0);
    t1 = (t0 + 14668);
    t5 = (t0 + 6528U);
    t6 = *((char **)t5);
    t5 = (t6 + 0);
    memcpy(t5, t1, 16U);
    xsi_set_current_line(108, ng0);
    t1 = (t0 + 14684);
    t5 = (t0 + 6768U);
    t6 = *((char **)t5);
    t5 = (t6 + 0);
    memcpy(t5, t1, 16U);
    xsi_set_current_line(109, ng0);
    t1 = (t0 + 14700);
    t5 = (t0 + 6648U);
    t6 = *((char **)t5);
    t5 = (t6 + 0);
    memcpy(t5, t1, 4U);
    xsi_set_current_line(110, ng0);
    t1 = (t0 + 6888U);
    t2 = *((char **)t1);
    t1 = (t2 + 0);
    *((unsigned char *)t1) = (unsigned char)2;
    xsi_set_current_line(111, ng0);
    t1 = (t0 + 7008U);
    t2 = *((char **)t1);
    t1 = (t2 + 0);
    *((unsigned char *)t1) = (unsigned char)2;
    xsi_set_current_line(112, ng0);
    t1 = (t0 + 7128U);
    t2 = *((char **)t1);
    t1 = (t2 + 0);
    *((unsigned char *)t1) = (unsigned char)2;
    xsi_set_current_line(113, ng0);
    t1 = (t0 + 14704);
    t5 = (t0 + 7248U);
    t6 = *((char **)t5);
    t5 = (t6 + 0);
    memcpy(t5, t1, 4U);
    xsi_set_current_line(114, ng0);
    t1 = (t0 + 14708);
    t5 = (t0 + 7368U);
    t6 = *((char **)t5);
    t5 = (t6 + 0);
    memcpy(t5, t1, 2U);
    xsi_set_current_line(115, ng0);
    t1 = (t0 + 7488U);
    t2 = *((char **)t1);
    t1 = (t2 + 0);
    *((unsigned char *)t1) = (unsigned char)2;
    xsi_set_current_line(116, ng0);
    t1 = (t0 + 7608U);
    t2 = *((char **)t1);
    t1 = (t2 + 0);
    *((unsigned char *)t1) = (unsigned char)2;
    xsi_set_current_line(117, ng0);
    t1 = (t0 + 7728U);
    t2 = *((char **)t1);
    t1 = (t2 + 0);
    *((int *)t1) = 0;
    xsi_set_current_line(118, ng0);
    t1 = (t0 + 7848U);
    t2 = *((char **)t1);
    t1 = (t2 + 0);
    *((unsigned char *)t1) = (unsigned char)2;
    xsi_set_current_line(119, ng0);
    t1 = (t0 + 7968U);
    t2 = *((char **)t1);
    t1 = (t2 + 0);
    *((unsigned char *)t1) = (unsigned char)2;
    goto LAB11;

LAB13:    t10 = (unsigned char)1;
    goto LAB15;

LAB16:    xsi_set_current_line(129, ng0);
    t1 = (t0 + 2792U);
    t5 = *((char **)t1);
    t8 = *((unsigned char *)t5);
    t1 = (t0 + 7128U);
    t6 = *((char **)t1);
    t1 = (t6 + 0);
    *((unsigned char *)t1) = t8;
    goto LAB17;

LAB19:    xsi_set_current_line(139, ng0);
    t1 = (t0 + 7848U);
    t6 = *((char **)t1);
    t1 = (t6 + 0);
    *((unsigned char *)t1) = (unsigned char)3;
    xsi_set_current_line(140, ng0);
    t1 = (t0 + 7968U);
    t2 = *((char **)t1);
    t1 = (t2 + 0);
    *((unsigned char *)t1) = (unsigned char)3;
    xsi_set_current_line(141, ng0);
    t1 = (t0 + 7728U);
    t2 = *((char **)t1);
    t1 = (t2 + 0);
    *((int *)t1) = 1;
    goto LAB20;

LAB22:    t3 = (unsigned char)1;
    goto LAB24;

}


extern void work_a_0932175927_3212880686_init()
{
	static char *pe[] = {(void *)work_a_0932175927_3212880686_p_0};
	xsi_register_didat("work_a_0932175927_3212880686", "isim/testCPU_isim_beh.exe.sim/work/a_0932175927_3212880686.didat");
	xsi_register_executes(pe);
}
