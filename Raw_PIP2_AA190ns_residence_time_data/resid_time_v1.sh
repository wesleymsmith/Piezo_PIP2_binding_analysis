file=mask.dat
ftrs=${file%.*}_trs.dat
ffrq=${file%.*}_frq.dat

awk ' BEGIN {
	getline
	while($1=="#") getline
	Ncol=NF
	close(FILENAME)

	for(i=2; i<=Ncol; i++) {
		while(getline<FILENAME) if(NF==Ncol) printf "%s", $i
		print ""
		close(FILENAME)
	}
}' $file > $ftrs

awk -v file=$file '
BEGIN{ Navg=0; Tavg=0
	getline <file
	while($1=="#") getline <file; dt=$1
	getline <file; dt=$1-dt
	close(file)
}

{	gsub(/0+/, " ")
	Ntxt=split($0, txt)
	for(i=1; i<=Ntxt; i++) {
		T=length(txt[i])
		print T
		Navg++; Tavg += T
	}
}
' $ftrs >$ffrq
