function [sol,val]=GAeval(sol,gen,ninput,nhidden,noutput,P,T);
%
% extract the parameters
%
x=sol(1:end-1);

%
% extract the weight matrix 'W1' from the parameter vector 'x'
%
sw1 = [nhidden ninput];
nw1 = prod(sw1);
W1  = reshape(x(1:nw1),sw1);

%
% extract the weight matrix 'W2' from the parameter vector 'x'
%
sw2 = [noutput nhidden];
nw2 = prod(sw2);
W2  = reshape(x(nw1+1:nw1+nw2),sw2);

%
% extract the biases 'B1' and 'B2' from the parameter vector 'x'
%
B1=x(nw1+nw2+1:nw1+nw2+nhidden)';
B2=x(nw1+nw2+nhidden+1:nw1+nw2+nhidden+noutput)';

%
% Run the 2-layer network on the problem
%
y1 = hardlim(W1*P - B1*ones(1,size(P,2)));
y2 = logsig(W2*y1 - B2*ones(1,size(y1,2)));

%
% Return the *negative* sum squared error, because 'fmaxga' tries 
% to *maximizes* the evaulation function.
%
val=-sum(sum((y2-T).^2));
