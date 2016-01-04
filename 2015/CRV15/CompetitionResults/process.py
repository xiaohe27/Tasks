#!/usr/bin/python

import sys

results=sys.argv[1]
lookup={}

with open(results,"r") as f:
    for line in f:
	line = line.strip()
	job,name,status,time,memory = line.split(",")[:5]	
	tool,ident = name.split("_")[:2]
	team=ident[4:5]
	bench=ident[14::15]
	if ident not in lookup:
		lookup[ident]=set()
	lookup[ident].add((tool,time,memory,status))

scores={}
cscores={}
tscores={}
mscores={}
for ident in sorted(lookup):
	print ident
	sum_time=0
	sum_mem=0
	for res in sorted(lookup[ident]):
		(tool,time,mem,status) = res
		if status=="Violated" or status=="Satisfied":
			sum_time += 1/float(time)
			sum_mem += 1/float(mem)

	for res in sorted(lookup[ident]):
		cscore=0
		tscore=0
		mscore=0
	        (tool,time,mem,status) = res
                if status=="Violated" or status=="Satisfied":
			tscore = 10*((1/float(time))/sum_time)	
			mscore = 10*((1/float(mem))/sum_mem)	
			cscore=10
		elif status=="ParseErr":
			cscore = -10
		elif status=="ResOut":
			cscore = -5 
		else:
			print "Unknown status "+status

		if tool not in scores:
			scores[tool]=0	
			cscores[tool]=0
			tscores[tool]=0
			mscores[tool]=0

		score = cscore + tscore+mscore
		if tscore==0 or mscore==0:
			score=cscore
		scores[tool] = scores[tool]+score
		cscores[tool] = cscores[tool]+cscore
		tscores[tool] = tscores[tool]+tscore
		mscores[tool] = mscores[tool]+mscore

		print "\t"+tool+","+time+","+mem+","+status+","+str(score)
		#print "\t"+tool+","+str(cscore)+","+str(tscore)+","+str(mscore)

print "\n FINAL SCORES:"
for tool in sorted(scores):
	print tool+","+str(cscores[tool])+","+str(tscores[tool])+","+str(mscores[tool])+","+str(scores[tool])	
