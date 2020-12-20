#!/bin/bash

path='../../Documents/Computer_Architecture_2nd_Assignment/spec_results/tests'
declare -a tests=("specmcf_tests" "specbzip_tests" "spechmmer_tests" "speclibm_tests" "specsjeng_tests")
declare -a testType=("A1" "B1" "C1" "D1")

        for test in "${tests[@]}"
        do
	   for Type in "${testType[@]}"
	   do	
	
		echo  GEM5TOMCPAT associativity start
		mkdir -p $test/associativity/$Type
               python GEM5ToMcPAT.py $path/$test/othermods/assoc/$Type/stats.txt $path/$test/othermods/assoc/$Type/config.json ../mcpat/ProcessorDescriptionFiles/inorder_arm.xml -o $test/associativity/$Type/$test_$Type.xml
		echo 	MCPAT START
		./../mcpat/mcpat -infile $test/associativity/$Type/$test_$Type.xml  -print_level 5 > $test/associativity/$Type/mcpat_out_$Type.txt
		echo print energy
		python print_energy.py $test/associativity/$Type/mcpat_out_$Type.txt $path/$test/othermods/assoc/$Type/stats.txt > $test/associativity/$Type/my_print_energy_$Type.txt
	  done
	 done
	
