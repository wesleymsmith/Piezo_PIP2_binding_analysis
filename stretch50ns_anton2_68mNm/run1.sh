#!/bin/bash
#SBATCH -J gro
#SBATCH --job-name aa_calc_residen
#SBATCH --partition=gpus
#SBATCH --get-user-env
#SBATCH --nodes=1
#SBATCH --tasks-per-node=6
#SBATCH --time=1500:00:00


source /etc/profile.d/modules.sh
module load cuda55/toolkit
source /home/wenjuan/work/scr/mdstress/bin/GMXRC

# please edit these to match your setting
nproc=6                                 # number of cpu cores to use
GMXDIR=/cm/shared/apps/gromacs-2016.4/bin
mdrun="${GMXDIR}/gmx mdrun -nt $nproc"  # gmx mdrun command


# do not edit below
env
nvidia-smi
export GMX_MAXBACKUP=-1



echo "start time: " 
date
#-------------------------EM--------------------------------------
#gmx select -f ../tot_all_12us.xtc -os -oc -oi -om -on selFrm.ndx -selrpos mol_com -select "resname LYS ARG and within 6.45 of resid 6061" -s ../step7.001_production.tpr

for id in 1 15 21 22 30 42 63 65 83 89 122 134 135 161 162 167 168 186 188 198 207 224 242 243 244 245 250 284 287 297 306 334 340 353 366 373 378 395 420 423 443 475 481 486 488 513 514 529 537 548 554 559 565 566 569 570 572 574 577 579 589 610 613 617 620 630 639 644 645 667 680 687 690 693 740 743 744 760 777 778 782 788 794 800 813 832 841 843 872 907 912 913 918 943 958 970 976 984 985 998 1007 1038 1041 1045 1046 1051 1054 1055 1056 1057 1060 1086 1103 1167 1173 1177 1190 1197 1201 1211 1223 1224 1233 1246 1249 1260 1274 1278 1279 1294 1310 1324 1351 1354 1374 1377 1386 1389 1400 1406 1413 1416 1418 1419 1433 1439 1440 1448 1460 1481 1483 1501 1507 1540 1552 1553 1579 1580 1585 1586 1604 1606 1616 1625 1642 1660 1661 1662 1663 1668 1702 1705 1715 1724 1752 1758 1771 1784 1791 1796 1813 1838 1841 1861 1893 1899 1904 1906 1931 1932 1947 1955 1966 1972 1977 1983 1984 1987 1988 1990 1992 1995 1997 2007 2028 2031 2035 2038 2048 2057 2062 2063 2085 2098 2105 2108 2111 2158 2161 2162 2178 2195 2196 2200 2206 2212 2218 2231 2250 2259 2261 2290 2325 2330 2331 2336 2361 2376 2388 2394 2402 2403 2416 2425 2456 2459 2463 2464 2469 2472 2473 2474 2475 2478 2504 2521 2585 2591 2595 2608 2615 2619 2629 2641 2642 2651 2664 2667 2678 2692 2696 2697 2712 2728 2742 2769 2772 2792 2795 2804 2807 2818 2824 2831 2834 2836 2837 2851 2857 2858 2866 2878 2899 2901 2919 2925 2958 2970 2971 2997 2998 3003 3004 3022 3024 3034 3043 3060 3078 3079 3080 3081 3086 3120 3123 3133 3142 3170 3176 3189 3202 3209 3214 3231 3256 3259 3279 3311 3317 3322 3324 3349 3350 3365 3373 3384 3390 3395 3401 3402 3405 3406 3408 3410 3413 3415 3425 3446 3449 3453 3456 3466 3475 3480 3481 3503 3516 3523 3526 3529 3576 3579 3580 3596 3613 3614 3618 3624 3630 3636 3649 3668 3677 3679 3708 3743 3748 3749 3754 3779 3794 3806 3812 3820 3821 3834 3843 3874 3877 3881 3882 3887 3890 3891 3892 3893 3896 3922 3939 4003 4009 4013 4026 4033 4037 4047 4059 4060 4069 4082 4085 4096 4110 4114 4115 4130 4146 4160 4187 4190 4210 4213 4222 4225 4236 4242 4249 4252 4254; 
do
  #   gmx select -f ../../tot_all_12us.xtc -om id_${id}_mask -on selFrm_${id}.ndx -seltype res_com -select "resnr $id and name BB and within 0.645 of resname POP5 and name PO4 P1 P2" -s ../../step7.001_production.tpr 
 gmx select -f /home/wenjuan/work/protein/Piezo/revese_anton2/ely_posre/12us_pip2/2fr_ext100ns/tension68mNm/50ns.stretch.xtc  -om id_${id}_mask -seltype res_com -select "resnr $id and name CZ CE and within 0.57 of resname SAPI24 and type PC PL " -s /home/wenjuan/work/protein/Piezo/revese_anton2/ely_posre/12us_pip2/2fr_ext100ns/gromacs/step7.001_production.tpr

done

