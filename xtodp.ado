******************************************************************************
*** PROGRAM TO CORRECT ESTIMATES FOR OVERDISPERSION AFTER USING XTPOISSON, FE
capture program drop xtodp
program def xtodp, eclass
dis _n(1) "Estimate and standard errors corrected for over-dipersion"
tempvar ppred  nonmissxY stratumsumY stratumsumpred pred x2 
qui predict `ppred', nu0       // GIVES PRED COUNT WITHOUT STRATUM EFFECT
local Y `e(depvar)'
local i `e(ivar)'               // STRATUM INDEX VARIABLE
local dfres=e(N)-e(df_m)-e(N_g) // DF OF THE RESIDUALS
qui gen `nonmissxY'=`Y'*(`ppred'!=.)
qui egen `stratumsumY'=sum(`nonmissxY'), by(`i')
qui egen `stratumsumpred'=sum(`ppred'), by(`i')
qui gen `pred'=`ppred'*`stratumsumY'/`stratumsumpred' // RESCALES PRED COUNTS TO MATCH STRATUM SUMS
qui gen `x2'=(`Y'-`pred')^2/(`pred')
qui summ `x2'
local dispers=r(sum)/`dfres'
dis "df: `dfres' ; pearson x2:" %8.1f r(sum) " ; dispersion: " %8.2f `dispers'

matrix B=get(_b)
matrix V=get(VCE)
matrix corrV=V*`dispers'
ereturn scalar dispers=`dispers'
ereturn post B corrV
ereturn display

*STORE PREDICTED COUNTS AND PEARSON RESIDUALS
capture  drop _xtp_pred_count
qui gen _xtp_pred_count = `pred'
capture drop _xtp_pearsonres 
qui gen _xtp_pearsonres= (`x2'^.5)*sign(`Y'-`pred')
capture drop _xtp_devianceres 
qui gen _xtp_devianceres= sqrt( 2*(`Y'*log(`Y'/`pred')-( `Y'-`pred') )) *sign(`Y'-`pred')
end
