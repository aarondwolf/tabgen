	
	clear
	net install tabgen, from("https://aarondwolf.github.io/tabgen/") replace
	
//	Load Data
	sysuse auto, clear
                
//	Generate indicator variables for the foreign variable:
    tabgen foreign

//	You can optionally specify a different stub:
	tabgen foreign, generate(new_)


