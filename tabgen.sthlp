{smcl}
{* 26aug2019}{...}
{cmd:help tabgen}
{hline}

{title:Title}

{phang}
{cmd:tabgen} {hline 2} Generate indicator variables for each value of a categorical
variable.


{title:Syntax}

	{cmd:tabgen} {cmd:{help varname}} [{cmd:{help if}}] [{cmd:,} {opt g:enerate}{cmd:(}{help varlist:stubname}{cmd:)}]


{title:Description}

{pstd}
{cmd:tabgen} Creates a new indicator for each unique value/label pair for a 
labelled categorical variable. 

{pstd}
{cmd:tabgen} is very similar to {cmd:tabulate varname, gen(stubname)}. The main
difference is that tabgen ensures that the value at the end of {cmd:stubname} represents
the numerical value for that label, rather than assigning the subnames the values
1, 2, 3, etc.


{title:Options}

{phang}{opt g:enerate}{cmd:(}{help varlist:stubname}{cmd:)} a stub that Stata will
use when generating new indicator variables. If no stubname is specified, {cmd:tabgen}
will use {it:varname_} by default.


{title:Notes}

{pstd}
{cmd:tabgen} Will replace all negative ('-') signs with an underscore ('_')
for variable names when generating new variables. For example, if your variable
has a label for a values of -99 (for example, "Don't Know"), the indicator for
that values would be stubname_99, which is 1 everywhere varname == -99.

{pstd}
{cmd:tabgen} requires {cmd:{search labellist}} in order to run. If {cmd:{search labellist}}
is not installed, {cmd:tabgen} will install it first before proceeding.


{title:Examples}

{pstd}
Load auto data:

        {cmd:.} {cmd: sysuse auto, clear}
		
{pstd}
Generate indicator variables for the foreign variable:

		{cmd:.} {cmd: tabgen foreign}
		
{pstd}
You can optionally specify a different stub:
		
		{cmd:.} {cmd: tabgen foreign, generate(new_)}
		

{title:Stored results}

{pstd}
{cmd:tabgen} stores the following in {cmd:r()}:

{synoptset 20 tabbed}{...}
{p2col 5 20 24 2: Scalars}{p_end}
{synopt:{cmd:r(varlist)}}The variable name specified.{p_end}
{synopt:{cmd:r(varlabel)}}The variable label for the variable specified.{p_end}
{synopt:{cmd:r(lblname)}}The value label for the variable specified.{p_end}
{synopt:{cmd:r(values)}}The list of labelled values for the variable specified.{p_end}
{synopt:{cmd:r(labels)}}The list of labels for the variable specified.{p_end}


{title:Authors}

{pstd}Aaron Wolf, Yale University{p_end}
{pstd}aaron.wolf@yale.edu{p_end}

