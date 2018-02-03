classdef HemodynamicsDirector < mlkinetics.AbstractKineticsDirector
	%% HEMODYNAMICSDIRECTOR  

	%  $Revision$
 	%  was created 04-Dec-2017 13:53:35 by jjlee,
 	%  last modified $LastChangedDate$ and placed into repository /Users/jjlee/Local/src/mlcvl/mlhemodynamics/src/+mlhemodynamics.
 	%% It was developed on Matlab 9.3.0.713579 (R2017b) for MACI64.  Copyright 2017 John Joowon Lee.
 	
    properties (Dependent)
        product
    end
    
	methods 
        
        %% GET/SET
        
        function g = get.product(this)
            g = mlhemodynamics.HemodynamicsView( ...
                'cbf', this.cbf_, ...
                'cbv', this.cbv_);
        end
        
        %%
        		  
        function this = constructCbf(this)
            this.cbf_ = this.kineticsBldr_.buildCbf;
        end
        function this = constructCbv(this)
            this.cbv_ = this.kineticsBldr_.buildCbv;
        end
        
 		function this = HemodynamicsDirector(varargin)
 			%% HEMODYNAMICSDIRECTOR
 			%  @param kineBldr is an mlkinetics.IKineticsBuilder.
            %  @param named model is an mlhemodynamics.HemodynamicsModel.

 			ip = inputParser;
            addRequired( ip, 'kineBldr', @(x) isa(x, 'mlkinetics.IKineticsBuilder'));
            addParameter(ip, 'model',    @(x) isa(x, 'mlhemodynamics.HemodynamicsModel'));
            parse(ip, varargin{:});
            
            this.kineticsBldr_ = ip.Results.kineBldr;
            this.model_        = ip.Results.model; 			
 		end
 	end 

    %% PRIVATE
    
    properties (Access = private)
        model_
        cbf_
        cbv_
 	end

	%  Created with Newcl by John J. Lee after newfcn by Frank Gonzalez-Morphy
 end

