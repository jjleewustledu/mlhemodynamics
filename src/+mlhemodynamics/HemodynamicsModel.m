classdef HemodynamicsModel < mlkinetics.AbstractKineticsModel
	%% HEMODYNAMICSMODEL uses strategy design patterns to facilitate use of 
    %  nonlinear regression, simulated annealing, nested sampling, HMC.

	%  $Revision$
 	%  was created 12-Dec-2017 16:38:24 by jjlee,
 	%  last modified $LastChangedDate$ and placed into repository /Users/jjlee/Local/src/mlcvl/mlhemodynamics/src/+mlhemodynamics.
 	%% It was developed on Matlab 9.3.0.713579 (R2017b) for MACI64.  Copyright 2017 John Joowon Lee.
 	
    properties
        cbf
        cbv
    end

	methods 
		  
        function prms = solverParameters(this)
            import mlhemodynamics.*;
            switch (class(this.solver_))
                case 'mlanalysis.LevenbergMarquardt'
                    prms = HemodynamicsLMParameters;
                case 'mlbayesian.BretthorstMcmc'
                    prms = HemodynamicsMcmcParameters;
                case 'mlnest.NestedSamplingMain'
                    prms = HemodynamicsNestParameters;
                case 'mlstan.FlatHMC'
                    prms = HemodynamicsFlatHMCParameters;
                case 'mlstan.HierarchicalHMC'
                    prms = HemodynamicsHierarchicalHMCParameters;
                otherwise
                    error('mlraichle:unsupportedSwitchStrategy', ...
                        'HemodynamicsModel.solverParameters:class(solver)->%s', this.solver_);
            end
        end 
        
 		function this = HemodynamicsModel(varargin)
 			%% HEMODYNAMICSMODEL
            
            this = this@mlkinetics.AbstractKineticsModel(varargin{:});
 		end
 	end 

	%  Created with Newcl by John J. Lee after newfcn by Frank Gonzalez-Morphy
 end

