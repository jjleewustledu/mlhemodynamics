classdef HemodynamicsBuilder < mlkinetics.AbstractKineticsBuilder 
	%% HEMODYNAMICSBUILDER  

	%  $Revision$
 	%  was created 04-Dec-2017 13:53:52 by jjlee,
 	%  last modified $LastChangedDate$ and placed into repository /Users/jjlee/Local/src/mlcvl/mlhemodynamics/src/+mlhemodynamics.
 	%% It was developed on Matlab 9.3.0.713579 (R2017b) for MACI64.  Copyright 2017 John Joowon Lee.
 	
	properties 		
 	end

	methods 
		  
        %%
        
        function cbf = buildCbf(this)
            this.solver_ = this.solver_.estimateParameters('cbf');
            assert(this.solver_.isfinished);
            cbf = this.solver_.model.cbf;
        end
        function cbv = buildCbv(this)
            this.solver_ = this.solver_.estimateParameters('cbv');
            assert(this.solver_.isfinished);
            cbv = this.solver_.model.cbv;
        end
        
 		function this = HemodynamicsBuilder(varargin)
 			%% HEMODYNAMICSBUILDER
 			%  @param named solver is an mlanalysis.ISolver
            
            this = this@mlkinetics.AbstractKineticsBuilder(varargin{:});
 		end
 	end 

	%  Created with Newcl by John J. Lee after newfcn by Frank Gonzalez-Morphy
 end

