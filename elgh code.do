tsset Year // setting the year variable for stationarity testing // 


//running adf //
dfuller inex
dfuller wgdp
dfuller rbeer

// generating first difference values // 
generate dinex = d.inex
generate dwgdp =d.wgdp
generate drbeer =d.rbeer

//adf//
dfuller dinex
dfuller dwgdp
dfuller drbeer

//generating log values of varibles//
generate linex = log(inex)
generate lwgdp = log(wgdp)
generate lrbeer = log(rbeer)

//adf//
dfuller linex
dfuller lwgdp
dfuller lrbeer

//generating second differences of the variables//
generate d2inex = d2.inex
generate d2wgdp =d2.wgdp
generate d2rbeer =d2.rbeer


//adf//
dfuller d2inex
dfuller d2wgdp
dfuller d2rbeer

//running the regression//
regress dinex dwgdp drbeer
dwstat //calculating the durbin watson d-stat to check for spurious regression//


generate ld2inex = log(d2inex)
generate ld2wgdp = log(d2wgdp)
generate ld2rbeer = log(d2rbeer)

regress ldinex ldwgdp ldrbeer
dwstat 

//running VAR and granger//
var dinex dwgdp drbeer
vargranger

//engle-granger test for coointegration//
regress inex wgdp rbeer
predict error, residuals //storing residual values in variable called "error" //
dfuller error, noconstant //adf on residuals//



