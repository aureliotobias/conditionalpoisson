{smcl}
{* *! version 3.0.0  01nov2022}{...}
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
{bf:xtodp} {hline 2} postestimation command to correct estimates standard errors' for overdispersion after {help xtpoisson}

{marker syntax}{...}
{title:Syntax}

{p 8 17 2}
{cmdab:xtodp} 

{marker examples}{...}
{title:Examples}

{phang}Import air pollution dataset for Valencia, Spain.{p_end}
{phang}{cmd:. import delimited "https://raw.githubusercontent.com/aureliotobias/valenciatempmort/master/valencia0107.csv", clear}{p_end}

{phang}Define stratum set for a time-stratified case-crossover design.{p_end}
{phang}{cmd:. egen stratum = group(year month dow)}{p_end}
{phang}{cmd:. xtset stratum}{p_end}

{phang}Fit fixed effects conditional Poisson regression model.{p_end}
{phang}{cmd:. xtpoisson all pm10 , fe }{p_end}

{phang}Get corrected estimates standard errors' for overdispersion.{p_end}
{phang}{cmd:. xtodp}{p_end}

{marker references}{...}
{title:References}

{phang}Armstrong B, Gasparrini A, Tobías A. 2014. Conditional Poisson models: a flexible alternative to conditional logistic case cross-over analysis. {it:BMC Med Res Methodol} 14: 122. {browse "https://doi.org/10.1186/1471-2288-14-122"}

{phang}Iñiguez C, Ballester F, Tobías A. 2022. Data supporting the short-term health effects of temperature and air pollution in Valencia, Spain. {it:Data in Brief} 44: 108518. {browse "https://doi.org/10.1016/j.dib.2022.108518"}

{marker author}{...}
{title:Authors}

{pstd}Ben Armstrong, London School of Hygiene and Tropical Medicine, London, UK{break}
Email: {browse "mailto:ben.armstrong@lshtm.ac.uk":ben.armstrong@lshtm.ac.uk}

{pstd}Aurelio Tobias, Spanish Council for Scientific Research, Barcelona, Spain{break}
Email: {browse "mailto:aurelio.tobias@idaea.csic.es":aurelio.tobias@idaea.csic.es}

{phang}
