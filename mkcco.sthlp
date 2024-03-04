{smcl}
{* *! version 1.0.0  03mar2024}{...}
{findalias asfradohelp}{...}
{vieweralsosee "" "--"}{...}
{vieweralsosee "[R] help" "help help"}{...}
{viewerjumpto "Syntax" "examplehelpfile##syntax"}{...}
{viewerjumpto "Description" "examplehelpfile##description"}{...}
{viewerjumpto "Options" "examplehelpfile##options"}{...}
{viewerjumpto "Remarks" "examplehelpfile##remarks"}{...}
{viewerjumpto "Examples" "examplehelpfile##examples"}{...}
{viewerjumpto "References" "network##refs"}{...}
{viewerjumpto "Authors" "network##author"}{...}
{title:Title}

{phang}
{bf:xtodp} {hline 2} convert daily time-series data to individual time-stratified case-crossover data to be analized with {help clogit}

{marker syntax}{...}
{title:Syntax}

{p 8 17 2}
{cmdab:mkcco} {varname} , {it:options}

{marker options}{...}
{title:Options}

{synoptset 20 tabbed}{...}
{synopthdr}
{synoptline}
{syntab:Main}
{synopt:{opt date(varname)}}compulsory option to indicate the date variable with a proper Stata date format{p_end}{synoptline}
{p2colreset}{...}

{marker examples}{...}
{title:Examples}

{phang}Import air pollution dataset for Valencia, Spain.{p_end}
{phang}{cmd:. import delimited "https://raw.githubusercontent.com/aureliotobias/valenciatempmort/master/valencia0107.csv", clear}{p_end}

{phang}Generating date variable with Stata date format.{p_end}
{phang}{cmd:. generate numdate = date(date, "YMD")}{p_end}
{phang}{cmd:. format numdate %td}{p_end}
{phang}{cmd:. list numdate in 1/5}{p_end}

{phang}Convert daily time-series data to individual time-stratified case-crossover data.{p_end}
{phang}{cmd:. mkcco all , date(numdate)}{p_end}

{phang}Fit conditional logistic regression model.{p_end}
{phang}{cmd:. clogit case pm10 [fw=n], group(id) or}{p_end}

{marker references}{...}
{title:References}

{phang}Armstrong B, Gasparrini A, Tobías A. 2014. Conditional Poisson models: a flexible alternative to conditional logistic case cross-over analysis. {it:BMC Med Res Methodol} 14: 122. {browse "https://doi.org/10.1186/1471-2288-14-122"}

{phang}Tobías A, Kim Y, Madaniyazi L. 2024. Time-stratified case-crossover studies for aggregated data in environmental epidemiology: a tutorial. {it:Int J Epidemiol} 35: dyae020. {browse "https://doi.org/10.1093/ije/dyae020"}

{phang}Iñiguez C, Ballester F, Tobías A. 2022. Data supporting the short-term health effects of temperature and air pollution in Valencia, Spain. {it:Data in Brief} 44: 108518. {browse "https://doi.org/10.1016/j.dib.2022.108518"}

{marker author}{...}
{title:Authors}

{pstd}Aurelio Tobias, Spanish Council for Scientific Research, Barcelona, Spain{break}
Email: {browse "mailto:aurelio.tobias@idaea.csic.es":aurelio.tobias@idaea.csic.es}

{phang}
