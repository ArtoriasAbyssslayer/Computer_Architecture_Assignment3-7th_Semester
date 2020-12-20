#!/bin/bash

path='../../Documents/Computer_Architecture_2nd_Assignment/spec_results/tests'
declare -a tests=("specmcf_tests" "specbzip_tests" "spechmmer_tests" "speclibm_tests" "specsjeng_tests")
declare -a testType=("A" "B" "C" "D")

        for test in "${tests[@]}"
        do
	   for Type in "${testType[@]}"
	   do	
	
		echo  GEM5TOMCPAT othermods start
		mkdir -p $test/othermods/$Type
               python GEM5ToMcPAT.py $path/$test/othermods/$Type/stats.txt $path/$test/othermods/$Type/config.json ../mcpat/ProcessorDescriptionFiles/inorder_arm.xml -o $test/othermods/$Type/$test_$Type.xml
		echo 	MCPAT START
		./../mcpat/mcpat -infile $test/othermods/$Type/$test_$Type.xml  -print_level 5 > $test/othermods/$Type/mcpat_out_$Type.txt
		echo print energy
		python print_energy.py $test/othermods/$Type/mcpat_out_$Type.txt $path/$test/othermods/$Type/stats.txt > $test/othermods/$Type/my_print_energy_$Type.txt
	  done
	 done
	
