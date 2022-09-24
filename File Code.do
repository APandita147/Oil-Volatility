gen TIME = mofd(time)
format TIME %tm
tsset TIME

dfuller oilvol //stationary//
dfuller dinflation //non-stationary; can also do logs?//
dfuller bbk //stationary//

generate dinflation = d.inflation //stationary//

var oilvol dinflation bbk, lags (1/3)

varsoc //lag-length criterion//

varstable //eigenvalue stability condition, how shocks are transferred//

predict error, resid

summarize error

tsline error, yline(3.82e-08)

varlmar, mlag(3) //LM Test for Autocorrelation//

vargranger //granger causality test//

varbasic oilvol dinflation bbk //try changing order of the vars and observe the graphs//

irf graph fevd