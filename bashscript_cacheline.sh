#!/bin/bash
#gem2mcpat
declare -a cacheSize=("32" "64" "128" "256")
declare tests=("specsjeng_tests" "specmcf_tests" "speclibm_tests" "spechmmer_tests" "specbzip_tests" )
path="../../Documents/Computer_Architecture_2nd_Assignment/spec_results/tests"


        for test in "${tests[@]}"
        do
	   for size in "${cacheSize[@]}"
	   do	
	
		echo  GEM5TOMCPAT cachelinesize start
		mkdir -p $test/cachleline_test/$size
               python GEM5ToMcPAT.py $path/$test/cachelinetests/$size/stats.txt $path/$test/cachelinetests/$size/config.json ../mcpat/ProcessorDescriptionFiles/inorder_arm.xml -o $test/cachleline_test/$size/$test_$size.xml
		echo 	MCPAT START
		./../mcpat/mcpat -infile $test/cachleline_test/$size/$test_$size.xml  -print_level 5 > $test/cachleline_test/$size/mcpat_out_$size.txt
		echo print energy
		python print_energy.py $test/cachleline_test/$size/mcpat_out_$size.txt $path/$test/cachelinetests/$size/stats.txt > $test/cachleline_test/$size/my_print_energy_$size.txt
	  done
	 done
	
	



