#!/bin/bash
timeNow=$(date +%d-%b-%H_%M_%S)
echo "$timeNow"
path2stats='../../Documents/Computer_Architecture_2nd_Assignment/spec_results/tests'
#gem2mcpat
declare -a cacheSize=("32" "64" "128" "256")
declare -a tests=("specmcf_tests" "specbzip_tests" "spechmmer_tests" "speclibm_tests" "specsjeng_tests")
for test in "${tests[@]}"
do
	mkdir -p logs/cachelinesize/$test
	mkdir -p mcpat_output/cachelinesize/$test
	mkdir -p print_energy/cachelinesize/$test	
	for size in "${cacheSize[@]}"
	do	
		echo  GEM5TOMCPAT cachelinesize start
		./GEM5ToMcPAT.py $path2stats/$test/cachelinetests/$size/stats.txt $path2stats/$test/cachelinetests/$size/config.json ../mcpat/ProcessorDescriptionFiles/inorder_arm.xml -o logs/cachelinesize/$test/$size$test.xml
		echo 	MCPAT START
		./../mcpat/mcpat -infile logs/cachelinesize/$test/$size$test.xml -print_level 5 > mcpat_output/cachelinesize/$test/$size$test.txt
		echo PRINT ENERGY 
		./print_energy.py mcpat_ouput/cachelinesize/$test/$size$test.txt $path2stats/$test/cachelinetests/$size/stats.txt #> print_energy/cachelinesize/$size/energy_$size$test.txt
	done

done

declare -a testType=("A" "B" "C" "D")
for test in "${tests[@]}"
do
	mkdir -p logs/cachesizemods/$test
	mkdir -p mcpat_output/cachesizemods/$test	
	mkdir -p print_energy/cachesizemods/$test
	for type in "${testType[@]}"
	do	
		#gem5tomcpat
		./GEM5ToMcPAT.py $path2stats/$test/othermods/$type/stats.txt $path2stats/$test/othermods/$type/config.json ../mcpat/ProcessorDescriptionFiles/inorder_arm.xml -o logs/cachesizemods/$test/$type$test.xml
		#mcpat print level 5
		./../mcpat/mcpat -infile logs/cachesizemods/$test/$type$test.xml -print_level 5 > mcpat_output/cachesizemods/$test/$type$test.txt
		#print energy 
		./print_energy.py mcpat_ouput/cachesizemods/$test/$type$test.txt $path2stats/$test/othermods/$type/stats.txt > print_energy/cachesizemods/$test/energy_$type$test.txt
	done


done

declare -a testType2=("A1" "B1" "C1" "D1")
for test in "${tests[@]}"
do
	mkdir -p logs/associativity/$test
	mkdir -p mcpat_output/associativity/$test
	mkdir -p print_energy/associativity/$test	
	for type in "${testType2[@]}"
	do
		#gem5tomcpat
		./GEM5ToMcPAT.py $path2stats/$test/othermods/assoc/$type/stats.txt $path2stats/$test/othermods/assoc/$type/config.json ../mcpat/ProcessorDescriptionFiles/inorder_arm.xml -o logs/associativity/$test/$type$test.xml
		#mcpat print level 5
		./../mcpat/mcpat -infile logs/associativity/$test/$type$test.xml -print_level 5 > mcpat_output/associativity/$test/$type$test.txt
		#print energy 
		./print_energy.py mcpat_ouput/associativity/$test/$type$test.txt $path2stats/$test/othermods/assoc/$type/stats.txt > print_energy/associativity/$test/energy_$type$test.txt
	done
done
