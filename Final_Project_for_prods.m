x1 = optimvar('x1', 'Type', 'integer', 'LowerBound', 0, 'UpperBound', Inf);
x2 = optimvar('x2', 'Type', 'integer', 'LowerBound', 0, 'UpperBound', Inf);
x3 = optimvar('x3', 'Type', 'integer', 'LowerBound', 0, 'UpperBound', Inf);
x4 = optimvar('x4', 'Type', 'integer', 'LowerBound', 0, 'UpperBound', Inf);
x5 = optimvar('x5', 'Type', 'integer', 'LowerBound', 0, 'UpperBound', Inf);
x6 = optimvar('x6', 'Type', 'integer', 'LowerBound', 0, 'UpperBound', Inf);
x7 = optimvar('x7', 'Type', 'integer', 'LowerBound', 0, 'UpperBound', Inf);
x8 = optimvar('x8', 'Type', 'integer', 'LowerBound', 0, 'UpperBound', Inf);
x9 = optimvar('x9', 'Type', 'integer', 'LowerBound', 0, 'UpperBound', Inf);
x10 = optimvar('x10', 'Type', 'integer', 'LowerBound', 0, 'UpperBound', Inf);
x11 = optimvar('x11', 'Type', 'integer', 'LowerBound', 0, 'UpperBound', Inf);
x12 = optimvar('x12', 'Type', 'integer', 'LowerBound', 0, 'UpperBound', Inf);
x13 = optimvar('x13', 'Type', 'integer', 'LowerBound', 0, 'UpperBound', Inf);

%objective equation is multiplied by cost per 100gram to get objective cost
prob = optimproblem('Objective', 33.0*x1 + 39.0*x2 + 34.0*x3 + 29.5*x4 + 15.0*x5 + 10.5*x6 + 14.0*x7 + 14.0*x8 + .90*x9 + .70*x10 + .70*x11 + 11.0*x12 + 6*x13, 'ObjectiveSense', 'min');

%% Add constraints
% Protein Lower Limit
prob.Constraints.c1 = 20.70*x1 + 21.24*x2 + 9.34*x3 + 23.10*x4 + 27.30*x5 + 26.20*x6 + 20.50*x7 + 18.50*x8 + 1.82*x9 + 1.82*x10 + 0.98*x11 + 3.60*x12 + 12.60*x13 >= 350;
%constraint for meats
prob.Constraints.c2 = 100*(x1 + x2 + x3 + x4 + x5) <= 700;%multiplying 100 to get a 100 gram serving of each meat
%constraint for fish
prob.Constraints.c3 =100*(x6 + x7 + x8) <= 340;%multiplying 100 to get a 100 gram serving of each fish
%constraint for veggie
prob.Constraints.c4 = 100*(x9 + x10 + x11 + x12) <= 180;%multiplying 100 to get a 100 gram serving of each veggie
%constraint for egg
prob.Constraints.c5 = 50*x13 <= 700;%multiplying 50 to get a of each egg
% Solve the problem
[sol, fval] = solve(prob);

% Display results
disp(sol);
disp(fval);