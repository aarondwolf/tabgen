tabgen
=====================================================================================================

*Generate indicator variables for each value of a categorical variable.*

## Installing via *net install*

The current version is still a work in progress. To install, user can use the net install command to download from the project's Github page:

```
net install tabgen, from("https://aarondwolf.github.io/tabgen")
```

## Syntax

        tabgen varname [if] [, generate(stubname)]

## Description

**tabgen** creates a new indicator for each unique value/label pair for a labelled categorical variable.

**tabgen** is very similar to **tabulate varname, gen(stubname)**. The main difference is that **tabgen** ensures that the value at the end of stubname represents the numerical value for that label, rather than assigning the subnames the values 1, 2, 3, etc.

## Options

- **generate(stubname)** a stub that Stata will use when generating new indicator variables. If no stubname is specified, tabgen will use varname_ by default.

## Notes

**tabgen** will replace all negative ('-') signs with an underscore ('_') for variable names when generating new variables. For example, if your variable has a label for a values of -99 (for example, "Don't Know"), the indicator for that values would be stubname_99, which is 1 everywhere varname == -99.

**tabgen** requires Daniel Klein's **labellist** in order to run (*ssc install labellist*). If **labellist** is not installed, **tabgen** will install it first before proceeding.

## Examples

Load auto data:

```
    .  sysuse auto, clear
```


Generate indicator variables for the foreign variable:

```
  .  tabgen foreign
```


You can optionally specify a different stub:

```
   .  tabgen foreign, generate(new_)
```

## Stored results

**tabgen** stores the following in r():

*Scalars*

- r(varlist) - The variable name specified.
- r(varlabel) - The variable label for the variable specified.
- r(lblname) - The value label for the variable specified.
- r(values) - The list of labelled values for the variable specified.
- r(labels) - The list of labels for the variable specified.

## Authors

Aaron Wolf, Yale University
aaron.wolf@yale.edu