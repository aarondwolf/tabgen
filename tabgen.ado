*! version 1.0.1  26aug2019 Aaron Wolf, aaron.wolf@u.northwestern.edu
program tabgen, rclass
	version 15
	
	syntax varlist(max=1) [if] [, Generate(name)]
	
	* Confirm varname is numeric
	confirm numeric variable `varlist'
	
	* Confirm labellist is installed
	cap which labellist
	if _rc==111 {
		di as error "tabgen requires package labellist. Downloading from SSC..."
		ssc install labellist
	}
	
	* Get first and last values of varname
	qui sum `varlist'
	local first = subinstr("`r(min)'","-","_",.)
	local last = subinstr("`r(max)'","-","_",.)
	
	* Get new stub
	if "`generate'" != "" local var `generate'
	else local var `varlist'_
	
//	Get all labelled values of varnames's value labels
	local value_label: value label `varlist'
	if "`value_label'" == "" {
		di as error "`varlist' does not have a value label."
		exit 198
	}
	
	* Pull label metadata
	labellist `varlist'
	
	
	* Convert "-" to "_" for variables
	local first = subinstr("`r(`value_label'_min)'","-","_",.)
	local last = subinstr("`r(`value_label'_max)'","-","_",.)
	
	foreach i in `r(values)' {
		local suf = subinstr("`i'","-","_",.)
		qui gen `var'`suf' = `varlist' == `i' `if'
		local vallabel: label `value_label' `i'
		la var `var'`suf' "`varlist'==`vallabel'"
		char `var'`suf'[CTO_type] select_one_choice
		char `var'`suf'[CTO_name] ``varlist'[CTO_name]'
		char `var'`suf'[CTO_relevance] ``varlist'[CTO_relevance]'
	}
	
	* Order generated variables after the original
	order `var'`first'-`var'`last', after(`varlist')
	
	* return locals
	return local labels `"`r(labels)'"'
	return local values "`r(values)'"
    return local lblname "`r(lblname)'"
    return local varlabel "`r(varlabel)'"
    return local varlist "`r(varlist)'"


end
