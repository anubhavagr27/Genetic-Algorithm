%
% This defines the problem to solve:
%

ninput  = 2;
nhidden = 5;
noutput = 1;
nPar = nhidden*(ninput+noutput)+nhidden+noutput;

nExamples = 10;
P = rand(ninput,nExamples);
T = hardlim(rand(noutput,nExamples)-0.5);

%
% Define the bounds where to search
%
bounds = [-10*ones(nPar,1) 10*ones(nPar,1)]; 


%
% Set some options. Type 'help fmaxga' for more info.
%
maxGen  = 500;    % maximum number of generations
floatGA = 1;      % binary or float
display = 1;      % 1 ... output somethin on terminal, 0 ... quite
precision = 1e-1; % only reevant fot binary GA
epsilon   = 1e-2; % two fitness values are considerd different iff abs(f1-f2)>epsilon

options = [1e-2 floatGA display precision];
if options(2) == 1
  mutFNs  = ['boundaryMutation multiNonUnifMutation nonUnifMutation unifMutation'];
  mutOps  = [4 0 0;
             6 maxGen 3;
	     4 maxGen 3;
	     4 0 0];
else
  mutFNs = []; % use default values for Binary GA
  mutOps = [];
end  

%
% Create a initial population of 100 idividuals.
%
startPop = initializega(100,bounds,'GAeval',options,ninput,nhidden,noutput,P,T);

%
% Run the Genetic Alg.
%
[x,endPop,bestPop,trace]=ga(bounds,'GAeval',options,startPop,'optMaxGenTerm',...
    [maxGen 0.0 1e-6],[],[],[],[],mutFNs,mutOps,ninput,nhidden,noutput,P,T);

%
% Plot the evaluation of the fittness
%
figure(1); clf;
plot(trace(:,1),trace(:,2),trace(:,1),trace(:,3),trace(:,1),trace(:,4));
legend('best of gen.','mean of gen.','standard dev. of gen.');
xlabel('generation');

