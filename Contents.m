% Genetic Optimization Toolbox
%
% *** Modified by Thomas Natschlaeger 1999/01/05 ***
%
% Main interface
% fmaxga.m               The Genetic Algorithm  
% initializega.m         Initialization function for float and binary
%                        representation Used by fmaxga.m   
%
% Operators used during simulated evolution
%
% Crossover Operators
% 
% Float and Binary Representation
%   simpleXover.m          Operator for the Algorithm Used by fmaxga.m 
%
% Float Representation
%   heuristicXover.m       Operator for the Algorithm Used by fmaxga.m 
%   arithXover.m           Operator for the Algorithm Used by fmaxga.m 
%
% Order-based Representation
%   cyclicXover.m          Operator for the Algorithm Used by fmaxga.m
%   erXover.m              Operator for the Algorithm Used by fmaxga.m
%   enhancederXover.m      Operator for the Algorithm Used by fmaxga.m
%   linerorderXover.m      Operator for the Algorithm Used by fmaxga.m
%   orderbasedXover.m      Operator for the Algorithm Used by fmaxga.m
%   partmapXover.m         Operator for the Algorithm Used by fmaxga.m
%   singleptXover.m        Operator for the Algorithm Used by fmaxga.m
%   uniformXover.m         Operator for the Algorithm Used by fmaxga.m
%
% Mutation Operators
%
% Binary Representation
%   binaryMutation.m       Operator for the Algorithm Used by fmaxga.m 
%
% Float Representation
%   boundaryMutation.m     Operator for the Algorithm Used by fmaxga.m 
%   multiNonUnifMutation.m Operator for the Algorithm Used by fmaxga.m 
%   nonUnifMutation.m      Operator for the Algorithm Used by fmaxga.m 
%   unifMutation.m         Operator for the Algorithm Used by fmaxga.m
%
% Binary and Order-Based Representation
%   inversionMutation.m    Operator for the Algorithm Used by fmaxga.m
%
% Order-Based Representation
%   adjswapMutation.m      Operator for the Algorithm Used by fmaxga.m 
%   shiftMutation.m        Operator for the Algorithm Used by fmaxga.m 
%   swapMutation.m         Operator for the Algorithm Used by fmaxga.m 
%   threeswapMutation.m    Operator for the Algorithm Used by fmaxga.m 
%
% Selection Functions
%   normGeomSelect.m       Selection function Used by fmaxga.m
%   roulette.m             Selection function Used by fmaxga.m
%   tournSelect.m          Selection function Used by fmaxga.m
%
% Termination Functions
%   maxGenTerm.m           Termination function Used by fmaxga.m
%   optMaxGenTerm.m        Termination function Used by fmaxga.m
%
% Functions used for binary representation
%   calcbits.m             Binary precision function used by fmaxga.m
%   f2b.m                  Float to Binary conversion used by fmaxga.m
%   b2f.m                  Binary to Float conversion used by fmaxga.m
%
% Utility functions
%   parse.m                Parse blank separated names used by fmaxga.m
%   delta.m                Used by nonUnifMutation.m and mult...m
%
% Demonstrations
%
%   GenAlgEx.m
%   GAeval.m
   
% Binary and Real-Valued Simulation Evolution for Matlab 
% Copyright (C) 1996 C.R. Houck, J.A. Joines, M.G. Kay 
%
% C.R. Houck, J.Joines, and M.Kay. A genetic algorithm for function
% optimization: A Matlab implementation. ACM Transactions on Mathmatical
% Software, Submitted 1996.
%
% Modified by Thomas Natschlaeger 1999/01/05
%
% This program is free software; you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation; either version 1, or (at your option)
% any later version.
%
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details. A copy of the GNU 
% General Public License can be obtained from the 
% Free Software Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
