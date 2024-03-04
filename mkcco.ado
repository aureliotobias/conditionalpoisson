* mkcco AT 1.0.0 September 2011
* http://www.stata.com/meeting/spain11/abstracts/
* mkcco AT 1.1.0 July 2013
cap program drop mkcco

program define mkcco, rclass
	version 10.0
	syntax varlist(min=1 max=1), [date(varlist max=1)]
	tokenize "`varlist'"
	local y `1'

	qui {

	* count ts obs
	count
	local A = r(N)

	* main temporary dataset
	sort `date'
	save _temp_set_0, replace	

	* temporary datasets for months with 1 to 5 week days
	foreach i of numlist 1/5 {
		use _temp_set_0, clear
		generate _yy = year(`date')
		generate _mm = month(`date')
		generate _dw = dow(`date')
		egen _set=group(_yy _mm _dw)
		sort _set `date'
		by _set: generate N= _n
		generate case=0
		replace  case=1 if N==`i'
		generate long id=_yy*1000+_set*10+`i'
		by _set: generate n=`y'[`i']
		save _temp_set_`i', replace
	}

	* join all temporary data setes
	use _temp_set_1, clear
		foreach i of numlist 2/5 {
		append using _temp_set_`i'
	}

	* delete temporary datasets
	foreach i of numlist 0/5 {
		erase _temp_set_`i'.dta
	}
	
	* delete unnecesary variables
	drop N _set _yy _mm _dw
	
	* order main cco variables
	order id case

	* count cco obs
	count
	local B = r(N)
	count if case==0
	local C0 = r(N)
	count if case==1
	local C1 = r(N)
	}
	
	* warning label
	display
	display in ye "Data set expanded from " in gre `A' in ye " to " in gre `B' /*
	*/ in ye " obs. ("in gre `C1' in ye " case days and " in gre `C0' in ye " control days)."
	display in ye "New variables " in gre "case" in ye ", " in gre "n" in ye " and " in gre "id" /*
	*/ in ye " added to the expanded case-crossover data set."
	display in ye "--------------------------------------------------------------------"
	display in gre "case" in ye " - case control status (" in gre "1" in ye ": case days, " in gre "0" in ye ": control days)
	display in gre "n" in ye "    - number of events on case days"
	display in gre "id" in ye "   - identification number to match cases with their own controls"
	display in ye "--------------------------------------------------------------------"	 
end
