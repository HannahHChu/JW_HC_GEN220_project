#!/usr/bin/bash
#SBATCH -n 8 --mem 128gb --out gff.log

rsync -av rsync://ftp.ensemblgenomes.org/all/pub/metazoa/current/gff3/*/*.gff3.gz GFF3s
