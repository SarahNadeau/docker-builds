#!/bin/bash

WORKDIR=speedcheck_python_vs_perl
echo "N, M, N_CPU, EST_FREQ, runtime_pl, runtime_py, runtime_py_minus_pl" > $WORKDIR/speedcheck.txt

for N_CPU in 1 2 3; do
  for N in 10 20 40; do
    for M in 10000 50000; do

      # Simulate an alignment
      python3 $WORKDIR/simulate_alignment.py -n $N -m $M -o $WORKDIR/simulated.fasta

      for EST_FREQ in 0.25 "NONE"; do

        if [ "$EST_FREQ" == "NONE" ]; then
          # Test speed of perl program
          start_pl=`date +%s`
          perl 1.0-pl/pairwiseDistances.pl -n $N_CPU $WORKDIR/simulated.fasta > $WORKDIR/results_pl.txt
          end_pl=`date +%s`
          runtime_pl=$((end_pl-start_pl))

          # Test speed of python program
          start_py=`date +%s`
          python3 1.0-py/pairwiseDistances.py -n $N_CPU $WORKDIR/simulated.fasta > $WORKDIR/results_py.txt
          end_py=`date +%s`
          runtime_py=$((end_py-start_py))
        else
          # Test speed of perl program
          start_pl=`date +%s`
          perl 1.0-pl/pairwiseDistances.pl -n $N_CPU -e -s $EST_FREQ $WORKDIR/simulated.fasta > $WORKDIR/results_pl.txt
          end_pl=`date +%s`
          runtime_pl=$((end_pl-start_pl))

          # Test speed of python program
          start_py=`date +%s`
          python3 1.0-py/pairwiseDistances.py -n $N_CPU -e -s $EST_FREQ $WORKDIR/simulated.fasta > $WORKDIR/results_py.txt
          end_py=`date +%s`
          runtime_py=$((end_py-start_py))
        fi

        # Write out results
        echo "$N, $M, $N_CPU, $EST_FREQ, $runtime_pl, $runtime_py, $((runtime_py-runtime_pl))" >> $WORKDIR/speedcheck.txt

      done

      # Remove simulated alignment and output
      rm $WORKDIR/simulated.fasta
      rm $WORKDIR/results_py.txt
      rm $WORKDIR/results_pl.txt

    done
  done
done