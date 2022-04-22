This set of files contains (hopefully) the results and information necessary to reproduce all experiments used in the paper Learning Hierarchical Task Models from Input Traces, by Hogg, Munoz-Avila, and Kuter, which has not currently been published but is under review for Computational Intelligence.

Use of this data will require FastForward and SGPlan6, both of which are available elsewhere on the web, and HTN-Maker and HTN-Solver2, which can be compiled as part of ch-htn-tools, which can be found at http://www.cse.lehigh.edu/InSyTe/HTN-MAKER/ch-htn-tools-1.1.tar.gz

The directory coverage_experiments contains information about experiments to determine how many training examples (pairs of classical planning problem and plan) the HTN-Maker software must see before it is able to solve its test problems.  There are experiments in five planning domains: logistics, blocks-world, satellite, rovers, and zenotravel.

The directory planning-speed-experiments contains information about experiments to determine how quickly the HTN-Solver2 software is able to solve problems using the knowledge learned in the coverage experiments, compared to classical planners and compared to HTN-Solver2 using hand-encoded knowledge.
