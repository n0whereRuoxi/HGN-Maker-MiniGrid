For each domain, we have a classical domain description, an HTN domain description that was hand-written by an expert, and HTN domain descriptions that were learned from the coverage experiments (all four types).  There are also problems of varying sizes, in both classical and HTN versions.  The sizes were chosen to provide a range of difficulty from trivial through very challenging problems.

In these experiments, we attempted to solve each problem using seven planning configurations:
- FastForward with the classical domain description / problems.
- SGPlan6 with the classical domain description / problems.
- HTN-Solver2 with the hand-crafted HTN domain description and HTN problems.
- HTN-Solver2 with each of the four learned HTN domain descriptions and HTN problems.

All planners were run with their default arguments and options.

The file results-number-solved.dat contains the number of problems of each size that could be solved by each planning configuration within a time limit of 30 minutes.  It does not distinguish between problems on which the planner reported no solution, those on which the planner might have crashed, and those on which it was still working at the end of the time limit.

The file results-average-times.dat contains the average time to solve problems in each of the sizes for each planning configuration.  To ensure fair comparisons, only problems that all seven configurations could solve are included.

