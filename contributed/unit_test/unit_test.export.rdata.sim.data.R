################################################################################################
# In this example we demonstrate how to upload an R object to the HDFS for use in MapReduce.
# We simulate an n x p matrix divided into chunks of m rows as observed covariates 
# and a response of length n divided up itself.
################################################################################################


#' Matrix Simulation With Exported RDATA
#'
#' ASSUMES Rhipe is set to run arbitrary jobs to a relative path.
#' On a local stand alone version of Rhipe this requires hdfs.getwd() == getwd() because of rhsave.
#' @author Jeremiah Rounds
unit_test = function(){
	is.good = FALSE
	try({
		################################################################################################
		# Task 1 define some beta coefficients that will form the model.
		################################################################################################
		set.seed(1)
		NCOEF = 50
		b = rnorm(NCOEF)
		#placing some structure in the coefficients to see if we can see it later
		b= b + 4*sin((1:NCOEF)/NCOEF*2*pi)   
		NROW=100
		#DEMO PUTTING OBJECTS ON HDFS
		rhsave("b","NCOEF","NROW", file = "export.example.Rdata",envir=environment() )


		################################################################################################
		# Task 2 simulate the matrix in chunks and demo loading the exported data.
		################################################################################################


		param = list()
		param$setup = expression({
			#DEMO GETTING YOUR OBJECTS FROM THE HDFS.
			#environment variable comes from the mapred object of the job.
			load("export.example.Rdata")
			#loaded NCOEF and b
		})
		param$map = expression({
			for (r in map.values){
				set.seed(r)
				X = runif(NROW*NCOEF)
				X = matrix(X,NROW,NCOEF)
				y = X %*% b + rnorm(NROW)
				y = as.numeric(y)
				rhcollect(r, list(X = X, y = y,files=system("ls",int=TRUE)))
			}
		})

		param$inout = c("lapply","sequence")
		param$N = 100
		param$jobname = "export_rdata_sim_data"
		param$shared = "export.example.Rdata"
		param$ofolder = param$jobname
		mr = do.call("rhmr", param)
		ex = rhex(mr,async=FALSE)

		#what do we got?
		output = rhread(param$ofolder,type="sequence", max=1)	
		value = output[[1]][[2]]
		X = value$X
		Y = value$Y
		files = value$files
		

		#does output look sane?
		if(output[[1]][[1]] > param$N)
			stop("Output wrong (1).")
		if(nrow(X) != NROW)
			stop("nrow in X wrong.")
		if(ncol(X) != NCOEF)
			stop("ncol in X wrong.")	
		is.good = TRUE
	}) # end try
	
	
	if(is.good) {
		result = "GOOD"
	} else { 
		result = "BAD"
	}
	return(as.list(environment()))
}	

