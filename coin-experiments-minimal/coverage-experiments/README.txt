For each domain, we have a classical domain description, an HTN domain description that does not have any methods, a description of tasks for the problem, and 400 problems with both their classical and HTN representations.

Under results you will find the HTN domain descriptions with all methods learned from the 100 problems in the training set.  There are five trials with five different random ways of dividing the problems into training and test set and ordering the training set.

You will also find there the percentage of the test set that could be solved using the cumulative HTN domain description learned from the 1st, 1st + 2nd, 1st + 2nd + 3rd, etc. examples in the training set, average across all 5 of trials.

There are four experiment types for each domain:
- The first uses subsumption checking and complete generalization.
- The second uses subsumption checking and partial generalization.
- The third does not use subsumption checking, and uses partial generalization.
- The fourth does not use subsumption checking, and uses complete generalization.

In addition, all experiments used the following options to htn-maker: drop_unneeded, force_ops_first, require_new, only_task_effects, soundness_check.  (These should probably be the default options, but are not because they were all added to solve problems that were not anticipated until initial testing of the system.)
