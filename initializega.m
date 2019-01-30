function [pop] = initializega(popSize,bounds,evalFN,options,varargin)
% POP = INITIALIZEGA(POPSIZE,BOUNDS,EVALFN,OPTIONS,VARARGIN) creates a
%   matrix of random numbers with a number of rows equal to the
%   populationSize and a number columns equal to the number of rows in
%   bounds plus 1 for the value which is found by evaluating 'evalFN'.
%   This is used by 'fmaxga' to create the population if it is not
%   supplied.
%
% POP            - the initial, evaluated, random population 
% POPSIZE        - the size of the population, i.e. the number to create
% BOUNDS         - a matrix which contains the bounds of each variable, i.e.
%                  [var1_high var1_low; var2_high var2_low; ....]
% EVALFN         - the evaluation fn, usually the name of the .m file for 
%                  evaluation
% OPTIONS       - [epsilon floatGA display prec] ([1e-6 1 0 1e-1])
%                    epsilon ... change required to consider two solutions different,
%		     floatGA ... 0 if you want to use the binary GA,
%		                 1 for the float GA;
%                    display ... is 1 to output progress 0 for quiet 
%
%                    prec   ... used to calculate how many bits should be used to
%                               represent one variable

% Binary and Real-Valued Simulation Evolution for Matlab GAOT V2 
% Copyright (C) 1998 C.R. Houck, J.A. Joines, M.G. Kay 
%
% C.R. Houck, J.Joines, and M.Kay. A genetic algorithm for function
% optimization: A Matlab implementation. ACM Transactions on Mathmatical
% Software, Submitted 1996.
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

if nargin < 3
  error('Insufficient arguments. You must supply ''popSize'', ''bounds'' and ''evalFN''!');
end

if nargin<4
  options=[];
end

if isempty(options)
  options=[1e-6 1 0 1e-1];
end 


if any(evalFN<48) % Not a .m file
  if options(2)==1
    % Float GA
    estr=['x=pop(i,1:end-1)''; pop(i,xZomeLength)=', evalFN ';'];  
  else
    % Binary GA
    estr=['x=b2f(pop(i,1:end-1)'',bounds,bits); pop(i,xZomeLength)=', evalFN ';']; 
  end
else              % A .m file
  if options(2)==1
    % Float GA
    estr=['[ pop(i,:) pop(i,xZomeLength)]=' evalFN '(pop(i,:),0,varargin{:});']; 
  else
    % Binary GA
    estr=['x=b2f(pop(i,1:end-1),bounds,bits);[x v]=' evalFN '([x pop(i,end)],0,varargin{:}); pop(i,:)=[f2b(x,bounds,bits) v];'];  
  end
end


numVars     = size(bounds,1); 		  % Number of variables
rng         = (bounds(:,2)-bounds(:,1))'; % The variable ranges

if options(2)==1 %Float GA
  xZomeLength = numVars+1 		
  %Length of string is numVar + fit
  pop         = zeros(popSize,xZomeLength); 	%Allocate the new population
  pop(:,1:numVars)=(ones(popSize,1)*rng).*(rand(popSize,numVars))+...
    (ones(popSize,1)*bounds(:,1)');
else %Binary GA
  bits=calcbits(bounds,options(4));
  xZomeLength = sum(bits)+1;	%Length of string is numVar + fit
  pop = round(rand(popSize,sum(bits)+1));
end

for i=1:popSize
 eval(estr);
end
