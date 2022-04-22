( define ( domain Blocks4 )
  ( :requirements :strips :typing :equality :htn )
  ( :types block )
  ( :predicates
    ( ON-TABLE ?b - BLOCK )
    ( ON ?b1 - BLOCK ?b2 - BLOCK )
    ( CLEAR ?b - BLOCK )
    ( HAND-EMPTY )
    ( HOLDING ?b - BLOCK )
  )
  ( :action !PICKUP
    :parameters
    (
      ?b - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?b ) ( CLEAR ?b ) ( HAND-EMPTY ) )
    :effect
    ( and ( not ( ON-TABLE ?b ) ) ( not ( CLEAR ?b ) ) ( not ( HAND-EMPTY ) ) ( HOLDING ?b ) )
  )
  ( :action !PUTDOWN
    :parameters
    (
      ?b - BLOCK
    )
    :precondition
    ( and ( HOLDING ?b ) )
    :effect
    ( and ( not ( HOLDING ?b ) ) ( HAND-EMPTY ) ( ON-TABLE ?b ) ( CLEAR ?b ) )
  )
  ( :action !UNSTACK
    :parameters
    (
      ?b1 - BLOCK
      ?b2 - BLOCK
    )
    :precondition
    ( and ( ON ?b1 ?b2 ) ( CLEAR ?b1 ) ( HAND-EMPTY ) )
    :effect
    ( and ( not ( ON ?b1 ?b2 ) ) ( not ( CLEAR ?b1 ) ) ( not ( HAND-EMPTY ) ) ( CLEAR ?b2 ) ( HOLDING ?b1 ) )
  )
  ( :action !STACK
    :parameters
    (
      ?b1 - BLOCK
      ?b2 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?b1 ) ( CLEAR ?b2 ) )
    :effect
    ( and ( not ( HOLDING ?b1 ) ) ( not ( CLEAR ?b2 ) ) ( HAND-EMPTY ) ( ON ?b1 ?b2 ) ( CLEAR ?b1 ) )
  )
  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?goal - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?goal ) )
    :subtasks
    (  )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?top - BLOCK
      ?bottom - BLOCK
    )
    :precondition
    ( and ( ON ?top ?bottom ) )
    :subtasks
    (  )
  )

  ( :method MAKE-CLEAR
    :parameters
    (
      ?target - BLOCK
    )
    :precondition
    ( and ( CLEAR ?target ) )
    :subtasks
    (  )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_597865 - BLOCK
    )
    :vars
    (
      ?auto_597866 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_597865 ?auto_597866 ) ( CLEAR ?auto_597865 ) ( HAND-EMPTY ) ( not ( = ?auto_597865 ?auto_597866 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_597865 ?auto_597866 )
      ( !PUTDOWN ?auto_597865 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_597872 - BLOCK
      ?auto_597873 - BLOCK
    )
    :vars
    (
      ?auto_597874 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_597872 ) ( ON ?auto_597873 ?auto_597874 ) ( CLEAR ?auto_597873 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_597872 ) ( not ( = ?auto_597872 ?auto_597873 ) ) ( not ( = ?auto_597872 ?auto_597874 ) ) ( not ( = ?auto_597873 ?auto_597874 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_597873 ?auto_597874 )
      ( !STACK ?auto_597873 ?auto_597872 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_597882 - BLOCK
      ?auto_597883 - BLOCK
    )
    :vars
    (
      ?auto_597884 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_597883 ?auto_597884 ) ( not ( = ?auto_597882 ?auto_597883 ) ) ( not ( = ?auto_597882 ?auto_597884 ) ) ( not ( = ?auto_597883 ?auto_597884 ) ) ( ON ?auto_597882 ?auto_597883 ) ( CLEAR ?auto_597882 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_597882 )
      ( MAKE-2PILE ?auto_597882 ?auto_597883 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_597893 - BLOCK
      ?auto_597894 - BLOCK
      ?auto_597895 - BLOCK
    )
    :vars
    (
      ?auto_597896 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_597894 ) ( ON ?auto_597895 ?auto_597896 ) ( CLEAR ?auto_597895 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_597893 ) ( ON ?auto_597894 ?auto_597893 ) ( not ( = ?auto_597893 ?auto_597894 ) ) ( not ( = ?auto_597893 ?auto_597895 ) ) ( not ( = ?auto_597893 ?auto_597896 ) ) ( not ( = ?auto_597894 ?auto_597895 ) ) ( not ( = ?auto_597894 ?auto_597896 ) ) ( not ( = ?auto_597895 ?auto_597896 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_597895 ?auto_597896 )
      ( !STACK ?auto_597895 ?auto_597894 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_597907 - BLOCK
      ?auto_597908 - BLOCK
      ?auto_597909 - BLOCK
    )
    :vars
    (
      ?auto_597910 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_597909 ?auto_597910 ) ( ON-TABLE ?auto_597907 ) ( not ( = ?auto_597907 ?auto_597908 ) ) ( not ( = ?auto_597907 ?auto_597909 ) ) ( not ( = ?auto_597907 ?auto_597910 ) ) ( not ( = ?auto_597908 ?auto_597909 ) ) ( not ( = ?auto_597908 ?auto_597910 ) ) ( not ( = ?auto_597909 ?auto_597910 ) ) ( CLEAR ?auto_597907 ) ( ON ?auto_597908 ?auto_597909 ) ( CLEAR ?auto_597908 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_597907 ?auto_597908 )
      ( MAKE-3PILE ?auto_597907 ?auto_597908 ?auto_597909 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_597921 - BLOCK
      ?auto_597922 - BLOCK
      ?auto_597923 - BLOCK
    )
    :vars
    (
      ?auto_597924 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_597923 ?auto_597924 ) ( not ( = ?auto_597921 ?auto_597922 ) ) ( not ( = ?auto_597921 ?auto_597923 ) ) ( not ( = ?auto_597921 ?auto_597924 ) ) ( not ( = ?auto_597922 ?auto_597923 ) ) ( not ( = ?auto_597922 ?auto_597924 ) ) ( not ( = ?auto_597923 ?auto_597924 ) ) ( ON ?auto_597922 ?auto_597923 ) ( ON ?auto_597921 ?auto_597922 ) ( CLEAR ?auto_597921 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_597921 )
      ( MAKE-3PILE ?auto_597921 ?auto_597922 ?auto_597923 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_597936 - BLOCK
      ?auto_597937 - BLOCK
      ?auto_597938 - BLOCK
      ?auto_597939 - BLOCK
    )
    :vars
    (
      ?auto_597940 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_597938 ) ( ON ?auto_597939 ?auto_597940 ) ( CLEAR ?auto_597939 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_597936 ) ( ON ?auto_597937 ?auto_597936 ) ( ON ?auto_597938 ?auto_597937 ) ( not ( = ?auto_597936 ?auto_597937 ) ) ( not ( = ?auto_597936 ?auto_597938 ) ) ( not ( = ?auto_597936 ?auto_597939 ) ) ( not ( = ?auto_597936 ?auto_597940 ) ) ( not ( = ?auto_597937 ?auto_597938 ) ) ( not ( = ?auto_597937 ?auto_597939 ) ) ( not ( = ?auto_597937 ?auto_597940 ) ) ( not ( = ?auto_597938 ?auto_597939 ) ) ( not ( = ?auto_597938 ?auto_597940 ) ) ( not ( = ?auto_597939 ?auto_597940 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_597939 ?auto_597940 )
      ( !STACK ?auto_597939 ?auto_597938 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_597954 - BLOCK
      ?auto_597955 - BLOCK
      ?auto_597956 - BLOCK
      ?auto_597957 - BLOCK
    )
    :vars
    (
      ?auto_597958 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_597957 ?auto_597958 ) ( ON-TABLE ?auto_597954 ) ( ON ?auto_597955 ?auto_597954 ) ( not ( = ?auto_597954 ?auto_597955 ) ) ( not ( = ?auto_597954 ?auto_597956 ) ) ( not ( = ?auto_597954 ?auto_597957 ) ) ( not ( = ?auto_597954 ?auto_597958 ) ) ( not ( = ?auto_597955 ?auto_597956 ) ) ( not ( = ?auto_597955 ?auto_597957 ) ) ( not ( = ?auto_597955 ?auto_597958 ) ) ( not ( = ?auto_597956 ?auto_597957 ) ) ( not ( = ?auto_597956 ?auto_597958 ) ) ( not ( = ?auto_597957 ?auto_597958 ) ) ( CLEAR ?auto_597955 ) ( ON ?auto_597956 ?auto_597957 ) ( CLEAR ?auto_597956 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_597954 ?auto_597955 ?auto_597956 )
      ( MAKE-4PILE ?auto_597954 ?auto_597955 ?auto_597956 ?auto_597957 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_597972 - BLOCK
      ?auto_597973 - BLOCK
      ?auto_597974 - BLOCK
      ?auto_597975 - BLOCK
    )
    :vars
    (
      ?auto_597976 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_597975 ?auto_597976 ) ( ON-TABLE ?auto_597972 ) ( not ( = ?auto_597972 ?auto_597973 ) ) ( not ( = ?auto_597972 ?auto_597974 ) ) ( not ( = ?auto_597972 ?auto_597975 ) ) ( not ( = ?auto_597972 ?auto_597976 ) ) ( not ( = ?auto_597973 ?auto_597974 ) ) ( not ( = ?auto_597973 ?auto_597975 ) ) ( not ( = ?auto_597973 ?auto_597976 ) ) ( not ( = ?auto_597974 ?auto_597975 ) ) ( not ( = ?auto_597974 ?auto_597976 ) ) ( not ( = ?auto_597975 ?auto_597976 ) ) ( ON ?auto_597974 ?auto_597975 ) ( CLEAR ?auto_597972 ) ( ON ?auto_597973 ?auto_597974 ) ( CLEAR ?auto_597973 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_597972 ?auto_597973 )
      ( MAKE-4PILE ?auto_597972 ?auto_597973 ?auto_597974 ?auto_597975 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_597990 - BLOCK
      ?auto_597991 - BLOCK
      ?auto_597992 - BLOCK
      ?auto_597993 - BLOCK
    )
    :vars
    (
      ?auto_597994 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_597993 ?auto_597994 ) ( not ( = ?auto_597990 ?auto_597991 ) ) ( not ( = ?auto_597990 ?auto_597992 ) ) ( not ( = ?auto_597990 ?auto_597993 ) ) ( not ( = ?auto_597990 ?auto_597994 ) ) ( not ( = ?auto_597991 ?auto_597992 ) ) ( not ( = ?auto_597991 ?auto_597993 ) ) ( not ( = ?auto_597991 ?auto_597994 ) ) ( not ( = ?auto_597992 ?auto_597993 ) ) ( not ( = ?auto_597992 ?auto_597994 ) ) ( not ( = ?auto_597993 ?auto_597994 ) ) ( ON ?auto_597992 ?auto_597993 ) ( ON ?auto_597991 ?auto_597992 ) ( ON ?auto_597990 ?auto_597991 ) ( CLEAR ?auto_597990 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_597990 )
      ( MAKE-4PILE ?auto_597990 ?auto_597991 ?auto_597992 ?auto_597993 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_598009 - BLOCK
      ?auto_598010 - BLOCK
      ?auto_598011 - BLOCK
      ?auto_598012 - BLOCK
      ?auto_598013 - BLOCK
    )
    :vars
    (
      ?auto_598014 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_598012 ) ( ON ?auto_598013 ?auto_598014 ) ( CLEAR ?auto_598013 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_598009 ) ( ON ?auto_598010 ?auto_598009 ) ( ON ?auto_598011 ?auto_598010 ) ( ON ?auto_598012 ?auto_598011 ) ( not ( = ?auto_598009 ?auto_598010 ) ) ( not ( = ?auto_598009 ?auto_598011 ) ) ( not ( = ?auto_598009 ?auto_598012 ) ) ( not ( = ?auto_598009 ?auto_598013 ) ) ( not ( = ?auto_598009 ?auto_598014 ) ) ( not ( = ?auto_598010 ?auto_598011 ) ) ( not ( = ?auto_598010 ?auto_598012 ) ) ( not ( = ?auto_598010 ?auto_598013 ) ) ( not ( = ?auto_598010 ?auto_598014 ) ) ( not ( = ?auto_598011 ?auto_598012 ) ) ( not ( = ?auto_598011 ?auto_598013 ) ) ( not ( = ?auto_598011 ?auto_598014 ) ) ( not ( = ?auto_598012 ?auto_598013 ) ) ( not ( = ?auto_598012 ?auto_598014 ) ) ( not ( = ?auto_598013 ?auto_598014 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_598013 ?auto_598014 )
      ( !STACK ?auto_598013 ?auto_598012 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_598031 - BLOCK
      ?auto_598032 - BLOCK
      ?auto_598033 - BLOCK
      ?auto_598034 - BLOCK
      ?auto_598035 - BLOCK
    )
    :vars
    (
      ?auto_598036 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_598035 ?auto_598036 ) ( ON-TABLE ?auto_598031 ) ( ON ?auto_598032 ?auto_598031 ) ( ON ?auto_598033 ?auto_598032 ) ( not ( = ?auto_598031 ?auto_598032 ) ) ( not ( = ?auto_598031 ?auto_598033 ) ) ( not ( = ?auto_598031 ?auto_598034 ) ) ( not ( = ?auto_598031 ?auto_598035 ) ) ( not ( = ?auto_598031 ?auto_598036 ) ) ( not ( = ?auto_598032 ?auto_598033 ) ) ( not ( = ?auto_598032 ?auto_598034 ) ) ( not ( = ?auto_598032 ?auto_598035 ) ) ( not ( = ?auto_598032 ?auto_598036 ) ) ( not ( = ?auto_598033 ?auto_598034 ) ) ( not ( = ?auto_598033 ?auto_598035 ) ) ( not ( = ?auto_598033 ?auto_598036 ) ) ( not ( = ?auto_598034 ?auto_598035 ) ) ( not ( = ?auto_598034 ?auto_598036 ) ) ( not ( = ?auto_598035 ?auto_598036 ) ) ( CLEAR ?auto_598033 ) ( ON ?auto_598034 ?auto_598035 ) ( CLEAR ?auto_598034 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_598031 ?auto_598032 ?auto_598033 ?auto_598034 )
      ( MAKE-5PILE ?auto_598031 ?auto_598032 ?auto_598033 ?auto_598034 ?auto_598035 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_598053 - BLOCK
      ?auto_598054 - BLOCK
      ?auto_598055 - BLOCK
      ?auto_598056 - BLOCK
      ?auto_598057 - BLOCK
    )
    :vars
    (
      ?auto_598058 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_598057 ?auto_598058 ) ( ON-TABLE ?auto_598053 ) ( ON ?auto_598054 ?auto_598053 ) ( not ( = ?auto_598053 ?auto_598054 ) ) ( not ( = ?auto_598053 ?auto_598055 ) ) ( not ( = ?auto_598053 ?auto_598056 ) ) ( not ( = ?auto_598053 ?auto_598057 ) ) ( not ( = ?auto_598053 ?auto_598058 ) ) ( not ( = ?auto_598054 ?auto_598055 ) ) ( not ( = ?auto_598054 ?auto_598056 ) ) ( not ( = ?auto_598054 ?auto_598057 ) ) ( not ( = ?auto_598054 ?auto_598058 ) ) ( not ( = ?auto_598055 ?auto_598056 ) ) ( not ( = ?auto_598055 ?auto_598057 ) ) ( not ( = ?auto_598055 ?auto_598058 ) ) ( not ( = ?auto_598056 ?auto_598057 ) ) ( not ( = ?auto_598056 ?auto_598058 ) ) ( not ( = ?auto_598057 ?auto_598058 ) ) ( ON ?auto_598056 ?auto_598057 ) ( CLEAR ?auto_598054 ) ( ON ?auto_598055 ?auto_598056 ) ( CLEAR ?auto_598055 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_598053 ?auto_598054 ?auto_598055 )
      ( MAKE-5PILE ?auto_598053 ?auto_598054 ?auto_598055 ?auto_598056 ?auto_598057 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_598075 - BLOCK
      ?auto_598076 - BLOCK
      ?auto_598077 - BLOCK
      ?auto_598078 - BLOCK
      ?auto_598079 - BLOCK
    )
    :vars
    (
      ?auto_598080 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_598079 ?auto_598080 ) ( ON-TABLE ?auto_598075 ) ( not ( = ?auto_598075 ?auto_598076 ) ) ( not ( = ?auto_598075 ?auto_598077 ) ) ( not ( = ?auto_598075 ?auto_598078 ) ) ( not ( = ?auto_598075 ?auto_598079 ) ) ( not ( = ?auto_598075 ?auto_598080 ) ) ( not ( = ?auto_598076 ?auto_598077 ) ) ( not ( = ?auto_598076 ?auto_598078 ) ) ( not ( = ?auto_598076 ?auto_598079 ) ) ( not ( = ?auto_598076 ?auto_598080 ) ) ( not ( = ?auto_598077 ?auto_598078 ) ) ( not ( = ?auto_598077 ?auto_598079 ) ) ( not ( = ?auto_598077 ?auto_598080 ) ) ( not ( = ?auto_598078 ?auto_598079 ) ) ( not ( = ?auto_598078 ?auto_598080 ) ) ( not ( = ?auto_598079 ?auto_598080 ) ) ( ON ?auto_598078 ?auto_598079 ) ( ON ?auto_598077 ?auto_598078 ) ( CLEAR ?auto_598075 ) ( ON ?auto_598076 ?auto_598077 ) ( CLEAR ?auto_598076 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_598075 ?auto_598076 )
      ( MAKE-5PILE ?auto_598075 ?auto_598076 ?auto_598077 ?auto_598078 ?auto_598079 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_598097 - BLOCK
      ?auto_598098 - BLOCK
      ?auto_598099 - BLOCK
      ?auto_598100 - BLOCK
      ?auto_598101 - BLOCK
    )
    :vars
    (
      ?auto_598102 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_598101 ?auto_598102 ) ( not ( = ?auto_598097 ?auto_598098 ) ) ( not ( = ?auto_598097 ?auto_598099 ) ) ( not ( = ?auto_598097 ?auto_598100 ) ) ( not ( = ?auto_598097 ?auto_598101 ) ) ( not ( = ?auto_598097 ?auto_598102 ) ) ( not ( = ?auto_598098 ?auto_598099 ) ) ( not ( = ?auto_598098 ?auto_598100 ) ) ( not ( = ?auto_598098 ?auto_598101 ) ) ( not ( = ?auto_598098 ?auto_598102 ) ) ( not ( = ?auto_598099 ?auto_598100 ) ) ( not ( = ?auto_598099 ?auto_598101 ) ) ( not ( = ?auto_598099 ?auto_598102 ) ) ( not ( = ?auto_598100 ?auto_598101 ) ) ( not ( = ?auto_598100 ?auto_598102 ) ) ( not ( = ?auto_598101 ?auto_598102 ) ) ( ON ?auto_598100 ?auto_598101 ) ( ON ?auto_598099 ?auto_598100 ) ( ON ?auto_598098 ?auto_598099 ) ( ON ?auto_598097 ?auto_598098 ) ( CLEAR ?auto_598097 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_598097 )
      ( MAKE-5PILE ?auto_598097 ?auto_598098 ?auto_598099 ?auto_598100 ?auto_598101 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_598120 - BLOCK
      ?auto_598121 - BLOCK
      ?auto_598122 - BLOCK
      ?auto_598123 - BLOCK
      ?auto_598124 - BLOCK
      ?auto_598125 - BLOCK
    )
    :vars
    (
      ?auto_598126 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_598124 ) ( ON ?auto_598125 ?auto_598126 ) ( CLEAR ?auto_598125 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_598120 ) ( ON ?auto_598121 ?auto_598120 ) ( ON ?auto_598122 ?auto_598121 ) ( ON ?auto_598123 ?auto_598122 ) ( ON ?auto_598124 ?auto_598123 ) ( not ( = ?auto_598120 ?auto_598121 ) ) ( not ( = ?auto_598120 ?auto_598122 ) ) ( not ( = ?auto_598120 ?auto_598123 ) ) ( not ( = ?auto_598120 ?auto_598124 ) ) ( not ( = ?auto_598120 ?auto_598125 ) ) ( not ( = ?auto_598120 ?auto_598126 ) ) ( not ( = ?auto_598121 ?auto_598122 ) ) ( not ( = ?auto_598121 ?auto_598123 ) ) ( not ( = ?auto_598121 ?auto_598124 ) ) ( not ( = ?auto_598121 ?auto_598125 ) ) ( not ( = ?auto_598121 ?auto_598126 ) ) ( not ( = ?auto_598122 ?auto_598123 ) ) ( not ( = ?auto_598122 ?auto_598124 ) ) ( not ( = ?auto_598122 ?auto_598125 ) ) ( not ( = ?auto_598122 ?auto_598126 ) ) ( not ( = ?auto_598123 ?auto_598124 ) ) ( not ( = ?auto_598123 ?auto_598125 ) ) ( not ( = ?auto_598123 ?auto_598126 ) ) ( not ( = ?auto_598124 ?auto_598125 ) ) ( not ( = ?auto_598124 ?auto_598126 ) ) ( not ( = ?auto_598125 ?auto_598126 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_598125 ?auto_598126 )
      ( !STACK ?auto_598125 ?auto_598124 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_598146 - BLOCK
      ?auto_598147 - BLOCK
      ?auto_598148 - BLOCK
      ?auto_598149 - BLOCK
      ?auto_598150 - BLOCK
      ?auto_598151 - BLOCK
    )
    :vars
    (
      ?auto_598152 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_598151 ?auto_598152 ) ( ON-TABLE ?auto_598146 ) ( ON ?auto_598147 ?auto_598146 ) ( ON ?auto_598148 ?auto_598147 ) ( ON ?auto_598149 ?auto_598148 ) ( not ( = ?auto_598146 ?auto_598147 ) ) ( not ( = ?auto_598146 ?auto_598148 ) ) ( not ( = ?auto_598146 ?auto_598149 ) ) ( not ( = ?auto_598146 ?auto_598150 ) ) ( not ( = ?auto_598146 ?auto_598151 ) ) ( not ( = ?auto_598146 ?auto_598152 ) ) ( not ( = ?auto_598147 ?auto_598148 ) ) ( not ( = ?auto_598147 ?auto_598149 ) ) ( not ( = ?auto_598147 ?auto_598150 ) ) ( not ( = ?auto_598147 ?auto_598151 ) ) ( not ( = ?auto_598147 ?auto_598152 ) ) ( not ( = ?auto_598148 ?auto_598149 ) ) ( not ( = ?auto_598148 ?auto_598150 ) ) ( not ( = ?auto_598148 ?auto_598151 ) ) ( not ( = ?auto_598148 ?auto_598152 ) ) ( not ( = ?auto_598149 ?auto_598150 ) ) ( not ( = ?auto_598149 ?auto_598151 ) ) ( not ( = ?auto_598149 ?auto_598152 ) ) ( not ( = ?auto_598150 ?auto_598151 ) ) ( not ( = ?auto_598150 ?auto_598152 ) ) ( not ( = ?auto_598151 ?auto_598152 ) ) ( CLEAR ?auto_598149 ) ( ON ?auto_598150 ?auto_598151 ) ( CLEAR ?auto_598150 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_598146 ?auto_598147 ?auto_598148 ?auto_598149 ?auto_598150 )
      ( MAKE-6PILE ?auto_598146 ?auto_598147 ?auto_598148 ?auto_598149 ?auto_598150 ?auto_598151 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_598172 - BLOCK
      ?auto_598173 - BLOCK
      ?auto_598174 - BLOCK
      ?auto_598175 - BLOCK
      ?auto_598176 - BLOCK
      ?auto_598177 - BLOCK
    )
    :vars
    (
      ?auto_598178 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_598177 ?auto_598178 ) ( ON-TABLE ?auto_598172 ) ( ON ?auto_598173 ?auto_598172 ) ( ON ?auto_598174 ?auto_598173 ) ( not ( = ?auto_598172 ?auto_598173 ) ) ( not ( = ?auto_598172 ?auto_598174 ) ) ( not ( = ?auto_598172 ?auto_598175 ) ) ( not ( = ?auto_598172 ?auto_598176 ) ) ( not ( = ?auto_598172 ?auto_598177 ) ) ( not ( = ?auto_598172 ?auto_598178 ) ) ( not ( = ?auto_598173 ?auto_598174 ) ) ( not ( = ?auto_598173 ?auto_598175 ) ) ( not ( = ?auto_598173 ?auto_598176 ) ) ( not ( = ?auto_598173 ?auto_598177 ) ) ( not ( = ?auto_598173 ?auto_598178 ) ) ( not ( = ?auto_598174 ?auto_598175 ) ) ( not ( = ?auto_598174 ?auto_598176 ) ) ( not ( = ?auto_598174 ?auto_598177 ) ) ( not ( = ?auto_598174 ?auto_598178 ) ) ( not ( = ?auto_598175 ?auto_598176 ) ) ( not ( = ?auto_598175 ?auto_598177 ) ) ( not ( = ?auto_598175 ?auto_598178 ) ) ( not ( = ?auto_598176 ?auto_598177 ) ) ( not ( = ?auto_598176 ?auto_598178 ) ) ( not ( = ?auto_598177 ?auto_598178 ) ) ( ON ?auto_598176 ?auto_598177 ) ( CLEAR ?auto_598174 ) ( ON ?auto_598175 ?auto_598176 ) ( CLEAR ?auto_598175 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_598172 ?auto_598173 ?auto_598174 ?auto_598175 )
      ( MAKE-6PILE ?auto_598172 ?auto_598173 ?auto_598174 ?auto_598175 ?auto_598176 ?auto_598177 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_598198 - BLOCK
      ?auto_598199 - BLOCK
      ?auto_598200 - BLOCK
      ?auto_598201 - BLOCK
      ?auto_598202 - BLOCK
      ?auto_598203 - BLOCK
    )
    :vars
    (
      ?auto_598204 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_598203 ?auto_598204 ) ( ON-TABLE ?auto_598198 ) ( ON ?auto_598199 ?auto_598198 ) ( not ( = ?auto_598198 ?auto_598199 ) ) ( not ( = ?auto_598198 ?auto_598200 ) ) ( not ( = ?auto_598198 ?auto_598201 ) ) ( not ( = ?auto_598198 ?auto_598202 ) ) ( not ( = ?auto_598198 ?auto_598203 ) ) ( not ( = ?auto_598198 ?auto_598204 ) ) ( not ( = ?auto_598199 ?auto_598200 ) ) ( not ( = ?auto_598199 ?auto_598201 ) ) ( not ( = ?auto_598199 ?auto_598202 ) ) ( not ( = ?auto_598199 ?auto_598203 ) ) ( not ( = ?auto_598199 ?auto_598204 ) ) ( not ( = ?auto_598200 ?auto_598201 ) ) ( not ( = ?auto_598200 ?auto_598202 ) ) ( not ( = ?auto_598200 ?auto_598203 ) ) ( not ( = ?auto_598200 ?auto_598204 ) ) ( not ( = ?auto_598201 ?auto_598202 ) ) ( not ( = ?auto_598201 ?auto_598203 ) ) ( not ( = ?auto_598201 ?auto_598204 ) ) ( not ( = ?auto_598202 ?auto_598203 ) ) ( not ( = ?auto_598202 ?auto_598204 ) ) ( not ( = ?auto_598203 ?auto_598204 ) ) ( ON ?auto_598202 ?auto_598203 ) ( ON ?auto_598201 ?auto_598202 ) ( CLEAR ?auto_598199 ) ( ON ?auto_598200 ?auto_598201 ) ( CLEAR ?auto_598200 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_598198 ?auto_598199 ?auto_598200 )
      ( MAKE-6PILE ?auto_598198 ?auto_598199 ?auto_598200 ?auto_598201 ?auto_598202 ?auto_598203 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_598224 - BLOCK
      ?auto_598225 - BLOCK
      ?auto_598226 - BLOCK
      ?auto_598227 - BLOCK
      ?auto_598228 - BLOCK
      ?auto_598229 - BLOCK
    )
    :vars
    (
      ?auto_598230 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_598229 ?auto_598230 ) ( ON-TABLE ?auto_598224 ) ( not ( = ?auto_598224 ?auto_598225 ) ) ( not ( = ?auto_598224 ?auto_598226 ) ) ( not ( = ?auto_598224 ?auto_598227 ) ) ( not ( = ?auto_598224 ?auto_598228 ) ) ( not ( = ?auto_598224 ?auto_598229 ) ) ( not ( = ?auto_598224 ?auto_598230 ) ) ( not ( = ?auto_598225 ?auto_598226 ) ) ( not ( = ?auto_598225 ?auto_598227 ) ) ( not ( = ?auto_598225 ?auto_598228 ) ) ( not ( = ?auto_598225 ?auto_598229 ) ) ( not ( = ?auto_598225 ?auto_598230 ) ) ( not ( = ?auto_598226 ?auto_598227 ) ) ( not ( = ?auto_598226 ?auto_598228 ) ) ( not ( = ?auto_598226 ?auto_598229 ) ) ( not ( = ?auto_598226 ?auto_598230 ) ) ( not ( = ?auto_598227 ?auto_598228 ) ) ( not ( = ?auto_598227 ?auto_598229 ) ) ( not ( = ?auto_598227 ?auto_598230 ) ) ( not ( = ?auto_598228 ?auto_598229 ) ) ( not ( = ?auto_598228 ?auto_598230 ) ) ( not ( = ?auto_598229 ?auto_598230 ) ) ( ON ?auto_598228 ?auto_598229 ) ( ON ?auto_598227 ?auto_598228 ) ( ON ?auto_598226 ?auto_598227 ) ( CLEAR ?auto_598224 ) ( ON ?auto_598225 ?auto_598226 ) ( CLEAR ?auto_598225 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_598224 ?auto_598225 )
      ( MAKE-6PILE ?auto_598224 ?auto_598225 ?auto_598226 ?auto_598227 ?auto_598228 ?auto_598229 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_598250 - BLOCK
      ?auto_598251 - BLOCK
      ?auto_598252 - BLOCK
      ?auto_598253 - BLOCK
      ?auto_598254 - BLOCK
      ?auto_598255 - BLOCK
    )
    :vars
    (
      ?auto_598256 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_598255 ?auto_598256 ) ( not ( = ?auto_598250 ?auto_598251 ) ) ( not ( = ?auto_598250 ?auto_598252 ) ) ( not ( = ?auto_598250 ?auto_598253 ) ) ( not ( = ?auto_598250 ?auto_598254 ) ) ( not ( = ?auto_598250 ?auto_598255 ) ) ( not ( = ?auto_598250 ?auto_598256 ) ) ( not ( = ?auto_598251 ?auto_598252 ) ) ( not ( = ?auto_598251 ?auto_598253 ) ) ( not ( = ?auto_598251 ?auto_598254 ) ) ( not ( = ?auto_598251 ?auto_598255 ) ) ( not ( = ?auto_598251 ?auto_598256 ) ) ( not ( = ?auto_598252 ?auto_598253 ) ) ( not ( = ?auto_598252 ?auto_598254 ) ) ( not ( = ?auto_598252 ?auto_598255 ) ) ( not ( = ?auto_598252 ?auto_598256 ) ) ( not ( = ?auto_598253 ?auto_598254 ) ) ( not ( = ?auto_598253 ?auto_598255 ) ) ( not ( = ?auto_598253 ?auto_598256 ) ) ( not ( = ?auto_598254 ?auto_598255 ) ) ( not ( = ?auto_598254 ?auto_598256 ) ) ( not ( = ?auto_598255 ?auto_598256 ) ) ( ON ?auto_598254 ?auto_598255 ) ( ON ?auto_598253 ?auto_598254 ) ( ON ?auto_598252 ?auto_598253 ) ( ON ?auto_598251 ?auto_598252 ) ( ON ?auto_598250 ?auto_598251 ) ( CLEAR ?auto_598250 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_598250 )
      ( MAKE-6PILE ?auto_598250 ?auto_598251 ?auto_598252 ?auto_598253 ?auto_598254 ?auto_598255 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_598277 - BLOCK
      ?auto_598278 - BLOCK
      ?auto_598279 - BLOCK
      ?auto_598280 - BLOCK
      ?auto_598281 - BLOCK
      ?auto_598282 - BLOCK
      ?auto_598283 - BLOCK
    )
    :vars
    (
      ?auto_598284 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_598282 ) ( ON ?auto_598283 ?auto_598284 ) ( CLEAR ?auto_598283 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_598277 ) ( ON ?auto_598278 ?auto_598277 ) ( ON ?auto_598279 ?auto_598278 ) ( ON ?auto_598280 ?auto_598279 ) ( ON ?auto_598281 ?auto_598280 ) ( ON ?auto_598282 ?auto_598281 ) ( not ( = ?auto_598277 ?auto_598278 ) ) ( not ( = ?auto_598277 ?auto_598279 ) ) ( not ( = ?auto_598277 ?auto_598280 ) ) ( not ( = ?auto_598277 ?auto_598281 ) ) ( not ( = ?auto_598277 ?auto_598282 ) ) ( not ( = ?auto_598277 ?auto_598283 ) ) ( not ( = ?auto_598277 ?auto_598284 ) ) ( not ( = ?auto_598278 ?auto_598279 ) ) ( not ( = ?auto_598278 ?auto_598280 ) ) ( not ( = ?auto_598278 ?auto_598281 ) ) ( not ( = ?auto_598278 ?auto_598282 ) ) ( not ( = ?auto_598278 ?auto_598283 ) ) ( not ( = ?auto_598278 ?auto_598284 ) ) ( not ( = ?auto_598279 ?auto_598280 ) ) ( not ( = ?auto_598279 ?auto_598281 ) ) ( not ( = ?auto_598279 ?auto_598282 ) ) ( not ( = ?auto_598279 ?auto_598283 ) ) ( not ( = ?auto_598279 ?auto_598284 ) ) ( not ( = ?auto_598280 ?auto_598281 ) ) ( not ( = ?auto_598280 ?auto_598282 ) ) ( not ( = ?auto_598280 ?auto_598283 ) ) ( not ( = ?auto_598280 ?auto_598284 ) ) ( not ( = ?auto_598281 ?auto_598282 ) ) ( not ( = ?auto_598281 ?auto_598283 ) ) ( not ( = ?auto_598281 ?auto_598284 ) ) ( not ( = ?auto_598282 ?auto_598283 ) ) ( not ( = ?auto_598282 ?auto_598284 ) ) ( not ( = ?auto_598283 ?auto_598284 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_598283 ?auto_598284 )
      ( !STACK ?auto_598283 ?auto_598282 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_598307 - BLOCK
      ?auto_598308 - BLOCK
      ?auto_598309 - BLOCK
      ?auto_598310 - BLOCK
      ?auto_598311 - BLOCK
      ?auto_598312 - BLOCK
      ?auto_598313 - BLOCK
    )
    :vars
    (
      ?auto_598314 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_598313 ?auto_598314 ) ( ON-TABLE ?auto_598307 ) ( ON ?auto_598308 ?auto_598307 ) ( ON ?auto_598309 ?auto_598308 ) ( ON ?auto_598310 ?auto_598309 ) ( ON ?auto_598311 ?auto_598310 ) ( not ( = ?auto_598307 ?auto_598308 ) ) ( not ( = ?auto_598307 ?auto_598309 ) ) ( not ( = ?auto_598307 ?auto_598310 ) ) ( not ( = ?auto_598307 ?auto_598311 ) ) ( not ( = ?auto_598307 ?auto_598312 ) ) ( not ( = ?auto_598307 ?auto_598313 ) ) ( not ( = ?auto_598307 ?auto_598314 ) ) ( not ( = ?auto_598308 ?auto_598309 ) ) ( not ( = ?auto_598308 ?auto_598310 ) ) ( not ( = ?auto_598308 ?auto_598311 ) ) ( not ( = ?auto_598308 ?auto_598312 ) ) ( not ( = ?auto_598308 ?auto_598313 ) ) ( not ( = ?auto_598308 ?auto_598314 ) ) ( not ( = ?auto_598309 ?auto_598310 ) ) ( not ( = ?auto_598309 ?auto_598311 ) ) ( not ( = ?auto_598309 ?auto_598312 ) ) ( not ( = ?auto_598309 ?auto_598313 ) ) ( not ( = ?auto_598309 ?auto_598314 ) ) ( not ( = ?auto_598310 ?auto_598311 ) ) ( not ( = ?auto_598310 ?auto_598312 ) ) ( not ( = ?auto_598310 ?auto_598313 ) ) ( not ( = ?auto_598310 ?auto_598314 ) ) ( not ( = ?auto_598311 ?auto_598312 ) ) ( not ( = ?auto_598311 ?auto_598313 ) ) ( not ( = ?auto_598311 ?auto_598314 ) ) ( not ( = ?auto_598312 ?auto_598313 ) ) ( not ( = ?auto_598312 ?auto_598314 ) ) ( not ( = ?auto_598313 ?auto_598314 ) ) ( CLEAR ?auto_598311 ) ( ON ?auto_598312 ?auto_598313 ) ( CLEAR ?auto_598312 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_598307 ?auto_598308 ?auto_598309 ?auto_598310 ?auto_598311 ?auto_598312 )
      ( MAKE-7PILE ?auto_598307 ?auto_598308 ?auto_598309 ?auto_598310 ?auto_598311 ?auto_598312 ?auto_598313 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_598337 - BLOCK
      ?auto_598338 - BLOCK
      ?auto_598339 - BLOCK
      ?auto_598340 - BLOCK
      ?auto_598341 - BLOCK
      ?auto_598342 - BLOCK
      ?auto_598343 - BLOCK
    )
    :vars
    (
      ?auto_598344 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_598343 ?auto_598344 ) ( ON-TABLE ?auto_598337 ) ( ON ?auto_598338 ?auto_598337 ) ( ON ?auto_598339 ?auto_598338 ) ( ON ?auto_598340 ?auto_598339 ) ( not ( = ?auto_598337 ?auto_598338 ) ) ( not ( = ?auto_598337 ?auto_598339 ) ) ( not ( = ?auto_598337 ?auto_598340 ) ) ( not ( = ?auto_598337 ?auto_598341 ) ) ( not ( = ?auto_598337 ?auto_598342 ) ) ( not ( = ?auto_598337 ?auto_598343 ) ) ( not ( = ?auto_598337 ?auto_598344 ) ) ( not ( = ?auto_598338 ?auto_598339 ) ) ( not ( = ?auto_598338 ?auto_598340 ) ) ( not ( = ?auto_598338 ?auto_598341 ) ) ( not ( = ?auto_598338 ?auto_598342 ) ) ( not ( = ?auto_598338 ?auto_598343 ) ) ( not ( = ?auto_598338 ?auto_598344 ) ) ( not ( = ?auto_598339 ?auto_598340 ) ) ( not ( = ?auto_598339 ?auto_598341 ) ) ( not ( = ?auto_598339 ?auto_598342 ) ) ( not ( = ?auto_598339 ?auto_598343 ) ) ( not ( = ?auto_598339 ?auto_598344 ) ) ( not ( = ?auto_598340 ?auto_598341 ) ) ( not ( = ?auto_598340 ?auto_598342 ) ) ( not ( = ?auto_598340 ?auto_598343 ) ) ( not ( = ?auto_598340 ?auto_598344 ) ) ( not ( = ?auto_598341 ?auto_598342 ) ) ( not ( = ?auto_598341 ?auto_598343 ) ) ( not ( = ?auto_598341 ?auto_598344 ) ) ( not ( = ?auto_598342 ?auto_598343 ) ) ( not ( = ?auto_598342 ?auto_598344 ) ) ( not ( = ?auto_598343 ?auto_598344 ) ) ( ON ?auto_598342 ?auto_598343 ) ( CLEAR ?auto_598340 ) ( ON ?auto_598341 ?auto_598342 ) ( CLEAR ?auto_598341 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_598337 ?auto_598338 ?auto_598339 ?auto_598340 ?auto_598341 )
      ( MAKE-7PILE ?auto_598337 ?auto_598338 ?auto_598339 ?auto_598340 ?auto_598341 ?auto_598342 ?auto_598343 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_598367 - BLOCK
      ?auto_598368 - BLOCK
      ?auto_598369 - BLOCK
      ?auto_598370 - BLOCK
      ?auto_598371 - BLOCK
      ?auto_598372 - BLOCK
      ?auto_598373 - BLOCK
    )
    :vars
    (
      ?auto_598374 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_598373 ?auto_598374 ) ( ON-TABLE ?auto_598367 ) ( ON ?auto_598368 ?auto_598367 ) ( ON ?auto_598369 ?auto_598368 ) ( not ( = ?auto_598367 ?auto_598368 ) ) ( not ( = ?auto_598367 ?auto_598369 ) ) ( not ( = ?auto_598367 ?auto_598370 ) ) ( not ( = ?auto_598367 ?auto_598371 ) ) ( not ( = ?auto_598367 ?auto_598372 ) ) ( not ( = ?auto_598367 ?auto_598373 ) ) ( not ( = ?auto_598367 ?auto_598374 ) ) ( not ( = ?auto_598368 ?auto_598369 ) ) ( not ( = ?auto_598368 ?auto_598370 ) ) ( not ( = ?auto_598368 ?auto_598371 ) ) ( not ( = ?auto_598368 ?auto_598372 ) ) ( not ( = ?auto_598368 ?auto_598373 ) ) ( not ( = ?auto_598368 ?auto_598374 ) ) ( not ( = ?auto_598369 ?auto_598370 ) ) ( not ( = ?auto_598369 ?auto_598371 ) ) ( not ( = ?auto_598369 ?auto_598372 ) ) ( not ( = ?auto_598369 ?auto_598373 ) ) ( not ( = ?auto_598369 ?auto_598374 ) ) ( not ( = ?auto_598370 ?auto_598371 ) ) ( not ( = ?auto_598370 ?auto_598372 ) ) ( not ( = ?auto_598370 ?auto_598373 ) ) ( not ( = ?auto_598370 ?auto_598374 ) ) ( not ( = ?auto_598371 ?auto_598372 ) ) ( not ( = ?auto_598371 ?auto_598373 ) ) ( not ( = ?auto_598371 ?auto_598374 ) ) ( not ( = ?auto_598372 ?auto_598373 ) ) ( not ( = ?auto_598372 ?auto_598374 ) ) ( not ( = ?auto_598373 ?auto_598374 ) ) ( ON ?auto_598372 ?auto_598373 ) ( ON ?auto_598371 ?auto_598372 ) ( CLEAR ?auto_598369 ) ( ON ?auto_598370 ?auto_598371 ) ( CLEAR ?auto_598370 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_598367 ?auto_598368 ?auto_598369 ?auto_598370 )
      ( MAKE-7PILE ?auto_598367 ?auto_598368 ?auto_598369 ?auto_598370 ?auto_598371 ?auto_598372 ?auto_598373 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_598397 - BLOCK
      ?auto_598398 - BLOCK
      ?auto_598399 - BLOCK
      ?auto_598400 - BLOCK
      ?auto_598401 - BLOCK
      ?auto_598402 - BLOCK
      ?auto_598403 - BLOCK
    )
    :vars
    (
      ?auto_598404 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_598403 ?auto_598404 ) ( ON-TABLE ?auto_598397 ) ( ON ?auto_598398 ?auto_598397 ) ( not ( = ?auto_598397 ?auto_598398 ) ) ( not ( = ?auto_598397 ?auto_598399 ) ) ( not ( = ?auto_598397 ?auto_598400 ) ) ( not ( = ?auto_598397 ?auto_598401 ) ) ( not ( = ?auto_598397 ?auto_598402 ) ) ( not ( = ?auto_598397 ?auto_598403 ) ) ( not ( = ?auto_598397 ?auto_598404 ) ) ( not ( = ?auto_598398 ?auto_598399 ) ) ( not ( = ?auto_598398 ?auto_598400 ) ) ( not ( = ?auto_598398 ?auto_598401 ) ) ( not ( = ?auto_598398 ?auto_598402 ) ) ( not ( = ?auto_598398 ?auto_598403 ) ) ( not ( = ?auto_598398 ?auto_598404 ) ) ( not ( = ?auto_598399 ?auto_598400 ) ) ( not ( = ?auto_598399 ?auto_598401 ) ) ( not ( = ?auto_598399 ?auto_598402 ) ) ( not ( = ?auto_598399 ?auto_598403 ) ) ( not ( = ?auto_598399 ?auto_598404 ) ) ( not ( = ?auto_598400 ?auto_598401 ) ) ( not ( = ?auto_598400 ?auto_598402 ) ) ( not ( = ?auto_598400 ?auto_598403 ) ) ( not ( = ?auto_598400 ?auto_598404 ) ) ( not ( = ?auto_598401 ?auto_598402 ) ) ( not ( = ?auto_598401 ?auto_598403 ) ) ( not ( = ?auto_598401 ?auto_598404 ) ) ( not ( = ?auto_598402 ?auto_598403 ) ) ( not ( = ?auto_598402 ?auto_598404 ) ) ( not ( = ?auto_598403 ?auto_598404 ) ) ( ON ?auto_598402 ?auto_598403 ) ( ON ?auto_598401 ?auto_598402 ) ( ON ?auto_598400 ?auto_598401 ) ( CLEAR ?auto_598398 ) ( ON ?auto_598399 ?auto_598400 ) ( CLEAR ?auto_598399 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_598397 ?auto_598398 ?auto_598399 )
      ( MAKE-7PILE ?auto_598397 ?auto_598398 ?auto_598399 ?auto_598400 ?auto_598401 ?auto_598402 ?auto_598403 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_598427 - BLOCK
      ?auto_598428 - BLOCK
      ?auto_598429 - BLOCK
      ?auto_598430 - BLOCK
      ?auto_598431 - BLOCK
      ?auto_598432 - BLOCK
      ?auto_598433 - BLOCK
    )
    :vars
    (
      ?auto_598434 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_598433 ?auto_598434 ) ( ON-TABLE ?auto_598427 ) ( not ( = ?auto_598427 ?auto_598428 ) ) ( not ( = ?auto_598427 ?auto_598429 ) ) ( not ( = ?auto_598427 ?auto_598430 ) ) ( not ( = ?auto_598427 ?auto_598431 ) ) ( not ( = ?auto_598427 ?auto_598432 ) ) ( not ( = ?auto_598427 ?auto_598433 ) ) ( not ( = ?auto_598427 ?auto_598434 ) ) ( not ( = ?auto_598428 ?auto_598429 ) ) ( not ( = ?auto_598428 ?auto_598430 ) ) ( not ( = ?auto_598428 ?auto_598431 ) ) ( not ( = ?auto_598428 ?auto_598432 ) ) ( not ( = ?auto_598428 ?auto_598433 ) ) ( not ( = ?auto_598428 ?auto_598434 ) ) ( not ( = ?auto_598429 ?auto_598430 ) ) ( not ( = ?auto_598429 ?auto_598431 ) ) ( not ( = ?auto_598429 ?auto_598432 ) ) ( not ( = ?auto_598429 ?auto_598433 ) ) ( not ( = ?auto_598429 ?auto_598434 ) ) ( not ( = ?auto_598430 ?auto_598431 ) ) ( not ( = ?auto_598430 ?auto_598432 ) ) ( not ( = ?auto_598430 ?auto_598433 ) ) ( not ( = ?auto_598430 ?auto_598434 ) ) ( not ( = ?auto_598431 ?auto_598432 ) ) ( not ( = ?auto_598431 ?auto_598433 ) ) ( not ( = ?auto_598431 ?auto_598434 ) ) ( not ( = ?auto_598432 ?auto_598433 ) ) ( not ( = ?auto_598432 ?auto_598434 ) ) ( not ( = ?auto_598433 ?auto_598434 ) ) ( ON ?auto_598432 ?auto_598433 ) ( ON ?auto_598431 ?auto_598432 ) ( ON ?auto_598430 ?auto_598431 ) ( ON ?auto_598429 ?auto_598430 ) ( CLEAR ?auto_598427 ) ( ON ?auto_598428 ?auto_598429 ) ( CLEAR ?auto_598428 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_598427 ?auto_598428 )
      ( MAKE-7PILE ?auto_598427 ?auto_598428 ?auto_598429 ?auto_598430 ?auto_598431 ?auto_598432 ?auto_598433 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_598457 - BLOCK
      ?auto_598458 - BLOCK
      ?auto_598459 - BLOCK
      ?auto_598460 - BLOCK
      ?auto_598461 - BLOCK
      ?auto_598462 - BLOCK
      ?auto_598463 - BLOCK
    )
    :vars
    (
      ?auto_598464 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_598463 ?auto_598464 ) ( not ( = ?auto_598457 ?auto_598458 ) ) ( not ( = ?auto_598457 ?auto_598459 ) ) ( not ( = ?auto_598457 ?auto_598460 ) ) ( not ( = ?auto_598457 ?auto_598461 ) ) ( not ( = ?auto_598457 ?auto_598462 ) ) ( not ( = ?auto_598457 ?auto_598463 ) ) ( not ( = ?auto_598457 ?auto_598464 ) ) ( not ( = ?auto_598458 ?auto_598459 ) ) ( not ( = ?auto_598458 ?auto_598460 ) ) ( not ( = ?auto_598458 ?auto_598461 ) ) ( not ( = ?auto_598458 ?auto_598462 ) ) ( not ( = ?auto_598458 ?auto_598463 ) ) ( not ( = ?auto_598458 ?auto_598464 ) ) ( not ( = ?auto_598459 ?auto_598460 ) ) ( not ( = ?auto_598459 ?auto_598461 ) ) ( not ( = ?auto_598459 ?auto_598462 ) ) ( not ( = ?auto_598459 ?auto_598463 ) ) ( not ( = ?auto_598459 ?auto_598464 ) ) ( not ( = ?auto_598460 ?auto_598461 ) ) ( not ( = ?auto_598460 ?auto_598462 ) ) ( not ( = ?auto_598460 ?auto_598463 ) ) ( not ( = ?auto_598460 ?auto_598464 ) ) ( not ( = ?auto_598461 ?auto_598462 ) ) ( not ( = ?auto_598461 ?auto_598463 ) ) ( not ( = ?auto_598461 ?auto_598464 ) ) ( not ( = ?auto_598462 ?auto_598463 ) ) ( not ( = ?auto_598462 ?auto_598464 ) ) ( not ( = ?auto_598463 ?auto_598464 ) ) ( ON ?auto_598462 ?auto_598463 ) ( ON ?auto_598461 ?auto_598462 ) ( ON ?auto_598460 ?auto_598461 ) ( ON ?auto_598459 ?auto_598460 ) ( ON ?auto_598458 ?auto_598459 ) ( ON ?auto_598457 ?auto_598458 ) ( CLEAR ?auto_598457 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_598457 )
      ( MAKE-7PILE ?auto_598457 ?auto_598458 ?auto_598459 ?auto_598460 ?auto_598461 ?auto_598462 ?auto_598463 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_598488 - BLOCK
      ?auto_598489 - BLOCK
      ?auto_598490 - BLOCK
      ?auto_598491 - BLOCK
      ?auto_598492 - BLOCK
      ?auto_598493 - BLOCK
      ?auto_598494 - BLOCK
      ?auto_598495 - BLOCK
    )
    :vars
    (
      ?auto_598496 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_598494 ) ( ON ?auto_598495 ?auto_598496 ) ( CLEAR ?auto_598495 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_598488 ) ( ON ?auto_598489 ?auto_598488 ) ( ON ?auto_598490 ?auto_598489 ) ( ON ?auto_598491 ?auto_598490 ) ( ON ?auto_598492 ?auto_598491 ) ( ON ?auto_598493 ?auto_598492 ) ( ON ?auto_598494 ?auto_598493 ) ( not ( = ?auto_598488 ?auto_598489 ) ) ( not ( = ?auto_598488 ?auto_598490 ) ) ( not ( = ?auto_598488 ?auto_598491 ) ) ( not ( = ?auto_598488 ?auto_598492 ) ) ( not ( = ?auto_598488 ?auto_598493 ) ) ( not ( = ?auto_598488 ?auto_598494 ) ) ( not ( = ?auto_598488 ?auto_598495 ) ) ( not ( = ?auto_598488 ?auto_598496 ) ) ( not ( = ?auto_598489 ?auto_598490 ) ) ( not ( = ?auto_598489 ?auto_598491 ) ) ( not ( = ?auto_598489 ?auto_598492 ) ) ( not ( = ?auto_598489 ?auto_598493 ) ) ( not ( = ?auto_598489 ?auto_598494 ) ) ( not ( = ?auto_598489 ?auto_598495 ) ) ( not ( = ?auto_598489 ?auto_598496 ) ) ( not ( = ?auto_598490 ?auto_598491 ) ) ( not ( = ?auto_598490 ?auto_598492 ) ) ( not ( = ?auto_598490 ?auto_598493 ) ) ( not ( = ?auto_598490 ?auto_598494 ) ) ( not ( = ?auto_598490 ?auto_598495 ) ) ( not ( = ?auto_598490 ?auto_598496 ) ) ( not ( = ?auto_598491 ?auto_598492 ) ) ( not ( = ?auto_598491 ?auto_598493 ) ) ( not ( = ?auto_598491 ?auto_598494 ) ) ( not ( = ?auto_598491 ?auto_598495 ) ) ( not ( = ?auto_598491 ?auto_598496 ) ) ( not ( = ?auto_598492 ?auto_598493 ) ) ( not ( = ?auto_598492 ?auto_598494 ) ) ( not ( = ?auto_598492 ?auto_598495 ) ) ( not ( = ?auto_598492 ?auto_598496 ) ) ( not ( = ?auto_598493 ?auto_598494 ) ) ( not ( = ?auto_598493 ?auto_598495 ) ) ( not ( = ?auto_598493 ?auto_598496 ) ) ( not ( = ?auto_598494 ?auto_598495 ) ) ( not ( = ?auto_598494 ?auto_598496 ) ) ( not ( = ?auto_598495 ?auto_598496 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_598495 ?auto_598496 )
      ( !STACK ?auto_598495 ?auto_598494 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_598522 - BLOCK
      ?auto_598523 - BLOCK
      ?auto_598524 - BLOCK
      ?auto_598525 - BLOCK
      ?auto_598526 - BLOCK
      ?auto_598527 - BLOCK
      ?auto_598528 - BLOCK
      ?auto_598529 - BLOCK
    )
    :vars
    (
      ?auto_598530 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_598529 ?auto_598530 ) ( ON-TABLE ?auto_598522 ) ( ON ?auto_598523 ?auto_598522 ) ( ON ?auto_598524 ?auto_598523 ) ( ON ?auto_598525 ?auto_598524 ) ( ON ?auto_598526 ?auto_598525 ) ( ON ?auto_598527 ?auto_598526 ) ( not ( = ?auto_598522 ?auto_598523 ) ) ( not ( = ?auto_598522 ?auto_598524 ) ) ( not ( = ?auto_598522 ?auto_598525 ) ) ( not ( = ?auto_598522 ?auto_598526 ) ) ( not ( = ?auto_598522 ?auto_598527 ) ) ( not ( = ?auto_598522 ?auto_598528 ) ) ( not ( = ?auto_598522 ?auto_598529 ) ) ( not ( = ?auto_598522 ?auto_598530 ) ) ( not ( = ?auto_598523 ?auto_598524 ) ) ( not ( = ?auto_598523 ?auto_598525 ) ) ( not ( = ?auto_598523 ?auto_598526 ) ) ( not ( = ?auto_598523 ?auto_598527 ) ) ( not ( = ?auto_598523 ?auto_598528 ) ) ( not ( = ?auto_598523 ?auto_598529 ) ) ( not ( = ?auto_598523 ?auto_598530 ) ) ( not ( = ?auto_598524 ?auto_598525 ) ) ( not ( = ?auto_598524 ?auto_598526 ) ) ( not ( = ?auto_598524 ?auto_598527 ) ) ( not ( = ?auto_598524 ?auto_598528 ) ) ( not ( = ?auto_598524 ?auto_598529 ) ) ( not ( = ?auto_598524 ?auto_598530 ) ) ( not ( = ?auto_598525 ?auto_598526 ) ) ( not ( = ?auto_598525 ?auto_598527 ) ) ( not ( = ?auto_598525 ?auto_598528 ) ) ( not ( = ?auto_598525 ?auto_598529 ) ) ( not ( = ?auto_598525 ?auto_598530 ) ) ( not ( = ?auto_598526 ?auto_598527 ) ) ( not ( = ?auto_598526 ?auto_598528 ) ) ( not ( = ?auto_598526 ?auto_598529 ) ) ( not ( = ?auto_598526 ?auto_598530 ) ) ( not ( = ?auto_598527 ?auto_598528 ) ) ( not ( = ?auto_598527 ?auto_598529 ) ) ( not ( = ?auto_598527 ?auto_598530 ) ) ( not ( = ?auto_598528 ?auto_598529 ) ) ( not ( = ?auto_598528 ?auto_598530 ) ) ( not ( = ?auto_598529 ?auto_598530 ) ) ( CLEAR ?auto_598527 ) ( ON ?auto_598528 ?auto_598529 ) ( CLEAR ?auto_598528 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_598522 ?auto_598523 ?auto_598524 ?auto_598525 ?auto_598526 ?auto_598527 ?auto_598528 )
      ( MAKE-8PILE ?auto_598522 ?auto_598523 ?auto_598524 ?auto_598525 ?auto_598526 ?auto_598527 ?auto_598528 ?auto_598529 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_598556 - BLOCK
      ?auto_598557 - BLOCK
      ?auto_598558 - BLOCK
      ?auto_598559 - BLOCK
      ?auto_598560 - BLOCK
      ?auto_598561 - BLOCK
      ?auto_598562 - BLOCK
      ?auto_598563 - BLOCK
    )
    :vars
    (
      ?auto_598564 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_598563 ?auto_598564 ) ( ON-TABLE ?auto_598556 ) ( ON ?auto_598557 ?auto_598556 ) ( ON ?auto_598558 ?auto_598557 ) ( ON ?auto_598559 ?auto_598558 ) ( ON ?auto_598560 ?auto_598559 ) ( not ( = ?auto_598556 ?auto_598557 ) ) ( not ( = ?auto_598556 ?auto_598558 ) ) ( not ( = ?auto_598556 ?auto_598559 ) ) ( not ( = ?auto_598556 ?auto_598560 ) ) ( not ( = ?auto_598556 ?auto_598561 ) ) ( not ( = ?auto_598556 ?auto_598562 ) ) ( not ( = ?auto_598556 ?auto_598563 ) ) ( not ( = ?auto_598556 ?auto_598564 ) ) ( not ( = ?auto_598557 ?auto_598558 ) ) ( not ( = ?auto_598557 ?auto_598559 ) ) ( not ( = ?auto_598557 ?auto_598560 ) ) ( not ( = ?auto_598557 ?auto_598561 ) ) ( not ( = ?auto_598557 ?auto_598562 ) ) ( not ( = ?auto_598557 ?auto_598563 ) ) ( not ( = ?auto_598557 ?auto_598564 ) ) ( not ( = ?auto_598558 ?auto_598559 ) ) ( not ( = ?auto_598558 ?auto_598560 ) ) ( not ( = ?auto_598558 ?auto_598561 ) ) ( not ( = ?auto_598558 ?auto_598562 ) ) ( not ( = ?auto_598558 ?auto_598563 ) ) ( not ( = ?auto_598558 ?auto_598564 ) ) ( not ( = ?auto_598559 ?auto_598560 ) ) ( not ( = ?auto_598559 ?auto_598561 ) ) ( not ( = ?auto_598559 ?auto_598562 ) ) ( not ( = ?auto_598559 ?auto_598563 ) ) ( not ( = ?auto_598559 ?auto_598564 ) ) ( not ( = ?auto_598560 ?auto_598561 ) ) ( not ( = ?auto_598560 ?auto_598562 ) ) ( not ( = ?auto_598560 ?auto_598563 ) ) ( not ( = ?auto_598560 ?auto_598564 ) ) ( not ( = ?auto_598561 ?auto_598562 ) ) ( not ( = ?auto_598561 ?auto_598563 ) ) ( not ( = ?auto_598561 ?auto_598564 ) ) ( not ( = ?auto_598562 ?auto_598563 ) ) ( not ( = ?auto_598562 ?auto_598564 ) ) ( not ( = ?auto_598563 ?auto_598564 ) ) ( ON ?auto_598562 ?auto_598563 ) ( CLEAR ?auto_598560 ) ( ON ?auto_598561 ?auto_598562 ) ( CLEAR ?auto_598561 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_598556 ?auto_598557 ?auto_598558 ?auto_598559 ?auto_598560 ?auto_598561 )
      ( MAKE-8PILE ?auto_598556 ?auto_598557 ?auto_598558 ?auto_598559 ?auto_598560 ?auto_598561 ?auto_598562 ?auto_598563 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_598590 - BLOCK
      ?auto_598591 - BLOCK
      ?auto_598592 - BLOCK
      ?auto_598593 - BLOCK
      ?auto_598594 - BLOCK
      ?auto_598595 - BLOCK
      ?auto_598596 - BLOCK
      ?auto_598597 - BLOCK
    )
    :vars
    (
      ?auto_598598 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_598597 ?auto_598598 ) ( ON-TABLE ?auto_598590 ) ( ON ?auto_598591 ?auto_598590 ) ( ON ?auto_598592 ?auto_598591 ) ( ON ?auto_598593 ?auto_598592 ) ( not ( = ?auto_598590 ?auto_598591 ) ) ( not ( = ?auto_598590 ?auto_598592 ) ) ( not ( = ?auto_598590 ?auto_598593 ) ) ( not ( = ?auto_598590 ?auto_598594 ) ) ( not ( = ?auto_598590 ?auto_598595 ) ) ( not ( = ?auto_598590 ?auto_598596 ) ) ( not ( = ?auto_598590 ?auto_598597 ) ) ( not ( = ?auto_598590 ?auto_598598 ) ) ( not ( = ?auto_598591 ?auto_598592 ) ) ( not ( = ?auto_598591 ?auto_598593 ) ) ( not ( = ?auto_598591 ?auto_598594 ) ) ( not ( = ?auto_598591 ?auto_598595 ) ) ( not ( = ?auto_598591 ?auto_598596 ) ) ( not ( = ?auto_598591 ?auto_598597 ) ) ( not ( = ?auto_598591 ?auto_598598 ) ) ( not ( = ?auto_598592 ?auto_598593 ) ) ( not ( = ?auto_598592 ?auto_598594 ) ) ( not ( = ?auto_598592 ?auto_598595 ) ) ( not ( = ?auto_598592 ?auto_598596 ) ) ( not ( = ?auto_598592 ?auto_598597 ) ) ( not ( = ?auto_598592 ?auto_598598 ) ) ( not ( = ?auto_598593 ?auto_598594 ) ) ( not ( = ?auto_598593 ?auto_598595 ) ) ( not ( = ?auto_598593 ?auto_598596 ) ) ( not ( = ?auto_598593 ?auto_598597 ) ) ( not ( = ?auto_598593 ?auto_598598 ) ) ( not ( = ?auto_598594 ?auto_598595 ) ) ( not ( = ?auto_598594 ?auto_598596 ) ) ( not ( = ?auto_598594 ?auto_598597 ) ) ( not ( = ?auto_598594 ?auto_598598 ) ) ( not ( = ?auto_598595 ?auto_598596 ) ) ( not ( = ?auto_598595 ?auto_598597 ) ) ( not ( = ?auto_598595 ?auto_598598 ) ) ( not ( = ?auto_598596 ?auto_598597 ) ) ( not ( = ?auto_598596 ?auto_598598 ) ) ( not ( = ?auto_598597 ?auto_598598 ) ) ( ON ?auto_598596 ?auto_598597 ) ( ON ?auto_598595 ?auto_598596 ) ( CLEAR ?auto_598593 ) ( ON ?auto_598594 ?auto_598595 ) ( CLEAR ?auto_598594 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_598590 ?auto_598591 ?auto_598592 ?auto_598593 ?auto_598594 )
      ( MAKE-8PILE ?auto_598590 ?auto_598591 ?auto_598592 ?auto_598593 ?auto_598594 ?auto_598595 ?auto_598596 ?auto_598597 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_598624 - BLOCK
      ?auto_598625 - BLOCK
      ?auto_598626 - BLOCK
      ?auto_598627 - BLOCK
      ?auto_598628 - BLOCK
      ?auto_598629 - BLOCK
      ?auto_598630 - BLOCK
      ?auto_598631 - BLOCK
    )
    :vars
    (
      ?auto_598632 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_598631 ?auto_598632 ) ( ON-TABLE ?auto_598624 ) ( ON ?auto_598625 ?auto_598624 ) ( ON ?auto_598626 ?auto_598625 ) ( not ( = ?auto_598624 ?auto_598625 ) ) ( not ( = ?auto_598624 ?auto_598626 ) ) ( not ( = ?auto_598624 ?auto_598627 ) ) ( not ( = ?auto_598624 ?auto_598628 ) ) ( not ( = ?auto_598624 ?auto_598629 ) ) ( not ( = ?auto_598624 ?auto_598630 ) ) ( not ( = ?auto_598624 ?auto_598631 ) ) ( not ( = ?auto_598624 ?auto_598632 ) ) ( not ( = ?auto_598625 ?auto_598626 ) ) ( not ( = ?auto_598625 ?auto_598627 ) ) ( not ( = ?auto_598625 ?auto_598628 ) ) ( not ( = ?auto_598625 ?auto_598629 ) ) ( not ( = ?auto_598625 ?auto_598630 ) ) ( not ( = ?auto_598625 ?auto_598631 ) ) ( not ( = ?auto_598625 ?auto_598632 ) ) ( not ( = ?auto_598626 ?auto_598627 ) ) ( not ( = ?auto_598626 ?auto_598628 ) ) ( not ( = ?auto_598626 ?auto_598629 ) ) ( not ( = ?auto_598626 ?auto_598630 ) ) ( not ( = ?auto_598626 ?auto_598631 ) ) ( not ( = ?auto_598626 ?auto_598632 ) ) ( not ( = ?auto_598627 ?auto_598628 ) ) ( not ( = ?auto_598627 ?auto_598629 ) ) ( not ( = ?auto_598627 ?auto_598630 ) ) ( not ( = ?auto_598627 ?auto_598631 ) ) ( not ( = ?auto_598627 ?auto_598632 ) ) ( not ( = ?auto_598628 ?auto_598629 ) ) ( not ( = ?auto_598628 ?auto_598630 ) ) ( not ( = ?auto_598628 ?auto_598631 ) ) ( not ( = ?auto_598628 ?auto_598632 ) ) ( not ( = ?auto_598629 ?auto_598630 ) ) ( not ( = ?auto_598629 ?auto_598631 ) ) ( not ( = ?auto_598629 ?auto_598632 ) ) ( not ( = ?auto_598630 ?auto_598631 ) ) ( not ( = ?auto_598630 ?auto_598632 ) ) ( not ( = ?auto_598631 ?auto_598632 ) ) ( ON ?auto_598630 ?auto_598631 ) ( ON ?auto_598629 ?auto_598630 ) ( ON ?auto_598628 ?auto_598629 ) ( CLEAR ?auto_598626 ) ( ON ?auto_598627 ?auto_598628 ) ( CLEAR ?auto_598627 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_598624 ?auto_598625 ?auto_598626 ?auto_598627 )
      ( MAKE-8PILE ?auto_598624 ?auto_598625 ?auto_598626 ?auto_598627 ?auto_598628 ?auto_598629 ?auto_598630 ?auto_598631 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_598658 - BLOCK
      ?auto_598659 - BLOCK
      ?auto_598660 - BLOCK
      ?auto_598661 - BLOCK
      ?auto_598662 - BLOCK
      ?auto_598663 - BLOCK
      ?auto_598664 - BLOCK
      ?auto_598665 - BLOCK
    )
    :vars
    (
      ?auto_598666 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_598665 ?auto_598666 ) ( ON-TABLE ?auto_598658 ) ( ON ?auto_598659 ?auto_598658 ) ( not ( = ?auto_598658 ?auto_598659 ) ) ( not ( = ?auto_598658 ?auto_598660 ) ) ( not ( = ?auto_598658 ?auto_598661 ) ) ( not ( = ?auto_598658 ?auto_598662 ) ) ( not ( = ?auto_598658 ?auto_598663 ) ) ( not ( = ?auto_598658 ?auto_598664 ) ) ( not ( = ?auto_598658 ?auto_598665 ) ) ( not ( = ?auto_598658 ?auto_598666 ) ) ( not ( = ?auto_598659 ?auto_598660 ) ) ( not ( = ?auto_598659 ?auto_598661 ) ) ( not ( = ?auto_598659 ?auto_598662 ) ) ( not ( = ?auto_598659 ?auto_598663 ) ) ( not ( = ?auto_598659 ?auto_598664 ) ) ( not ( = ?auto_598659 ?auto_598665 ) ) ( not ( = ?auto_598659 ?auto_598666 ) ) ( not ( = ?auto_598660 ?auto_598661 ) ) ( not ( = ?auto_598660 ?auto_598662 ) ) ( not ( = ?auto_598660 ?auto_598663 ) ) ( not ( = ?auto_598660 ?auto_598664 ) ) ( not ( = ?auto_598660 ?auto_598665 ) ) ( not ( = ?auto_598660 ?auto_598666 ) ) ( not ( = ?auto_598661 ?auto_598662 ) ) ( not ( = ?auto_598661 ?auto_598663 ) ) ( not ( = ?auto_598661 ?auto_598664 ) ) ( not ( = ?auto_598661 ?auto_598665 ) ) ( not ( = ?auto_598661 ?auto_598666 ) ) ( not ( = ?auto_598662 ?auto_598663 ) ) ( not ( = ?auto_598662 ?auto_598664 ) ) ( not ( = ?auto_598662 ?auto_598665 ) ) ( not ( = ?auto_598662 ?auto_598666 ) ) ( not ( = ?auto_598663 ?auto_598664 ) ) ( not ( = ?auto_598663 ?auto_598665 ) ) ( not ( = ?auto_598663 ?auto_598666 ) ) ( not ( = ?auto_598664 ?auto_598665 ) ) ( not ( = ?auto_598664 ?auto_598666 ) ) ( not ( = ?auto_598665 ?auto_598666 ) ) ( ON ?auto_598664 ?auto_598665 ) ( ON ?auto_598663 ?auto_598664 ) ( ON ?auto_598662 ?auto_598663 ) ( ON ?auto_598661 ?auto_598662 ) ( CLEAR ?auto_598659 ) ( ON ?auto_598660 ?auto_598661 ) ( CLEAR ?auto_598660 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_598658 ?auto_598659 ?auto_598660 )
      ( MAKE-8PILE ?auto_598658 ?auto_598659 ?auto_598660 ?auto_598661 ?auto_598662 ?auto_598663 ?auto_598664 ?auto_598665 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_598692 - BLOCK
      ?auto_598693 - BLOCK
      ?auto_598694 - BLOCK
      ?auto_598695 - BLOCK
      ?auto_598696 - BLOCK
      ?auto_598697 - BLOCK
      ?auto_598698 - BLOCK
      ?auto_598699 - BLOCK
    )
    :vars
    (
      ?auto_598700 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_598699 ?auto_598700 ) ( ON-TABLE ?auto_598692 ) ( not ( = ?auto_598692 ?auto_598693 ) ) ( not ( = ?auto_598692 ?auto_598694 ) ) ( not ( = ?auto_598692 ?auto_598695 ) ) ( not ( = ?auto_598692 ?auto_598696 ) ) ( not ( = ?auto_598692 ?auto_598697 ) ) ( not ( = ?auto_598692 ?auto_598698 ) ) ( not ( = ?auto_598692 ?auto_598699 ) ) ( not ( = ?auto_598692 ?auto_598700 ) ) ( not ( = ?auto_598693 ?auto_598694 ) ) ( not ( = ?auto_598693 ?auto_598695 ) ) ( not ( = ?auto_598693 ?auto_598696 ) ) ( not ( = ?auto_598693 ?auto_598697 ) ) ( not ( = ?auto_598693 ?auto_598698 ) ) ( not ( = ?auto_598693 ?auto_598699 ) ) ( not ( = ?auto_598693 ?auto_598700 ) ) ( not ( = ?auto_598694 ?auto_598695 ) ) ( not ( = ?auto_598694 ?auto_598696 ) ) ( not ( = ?auto_598694 ?auto_598697 ) ) ( not ( = ?auto_598694 ?auto_598698 ) ) ( not ( = ?auto_598694 ?auto_598699 ) ) ( not ( = ?auto_598694 ?auto_598700 ) ) ( not ( = ?auto_598695 ?auto_598696 ) ) ( not ( = ?auto_598695 ?auto_598697 ) ) ( not ( = ?auto_598695 ?auto_598698 ) ) ( not ( = ?auto_598695 ?auto_598699 ) ) ( not ( = ?auto_598695 ?auto_598700 ) ) ( not ( = ?auto_598696 ?auto_598697 ) ) ( not ( = ?auto_598696 ?auto_598698 ) ) ( not ( = ?auto_598696 ?auto_598699 ) ) ( not ( = ?auto_598696 ?auto_598700 ) ) ( not ( = ?auto_598697 ?auto_598698 ) ) ( not ( = ?auto_598697 ?auto_598699 ) ) ( not ( = ?auto_598697 ?auto_598700 ) ) ( not ( = ?auto_598698 ?auto_598699 ) ) ( not ( = ?auto_598698 ?auto_598700 ) ) ( not ( = ?auto_598699 ?auto_598700 ) ) ( ON ?auto_598698 ?auto_598699 ) ( ON ?auto_598697 ?auto_598698 ) ( ON ?auto_598696 ?auto_598697 ) ( ON ?auto_598695 ?auto_598696 ) ( ON ?auto_598694 ?auto_598695 ) ( CLEAR ?auto_598692 ) ( ON ?auto_598693 ?auto_598694 ) ( CLEAR ?auto_598693 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_598692 ?auto_598693 )
      ( MAKE-8PILE ?auto_598692 ?auto_598693 ?auto_598694 ?auto_598695 ?auto_598696 ?auto_598697 ?auto_598698 ?auto_598699 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_598726 - BLOCK
      ?auto_598727 - BLOCK
      ?auto_598728 - BLOCK
      ?auto_598729 - BLOCK
      ?auto_598730 - BLOCK
      ?auto_598731 - BLOCK
      ?auto_598732 - BLOCK
      ?auto_598733 - BLOCK
    )
    :vars
    (
      ?auto_598734 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_598733 ?auto_598734 ) ( not ( = ?auto_598726 ?auto_598727 ) ) ( not ( = ?auto_598726 ?auto_598728 ) ) ( not ( = ?auto_598726 ?auto_598729 ) ) ( not ( = ?auto_598726 ?auto_598730 ) ) ( not ( = ?auto_598726 ?auto_598731 ) ) ( not ( = ?auto_598726 ?auto_598732 ) ) ( not ( = ?auto_598726 ?auto_598733 ) ) ( not ( = ?auto_598726 ?auto_598734 ) ) ( not ( = ?auto_598727 ?auto_598728 ) ) ( not ( = ?auto_598727 ?auto_598729 ) ) ( not ( = ?auto_598727 ?auto_598730 ) ) ( not ( = ?auto_598727 ?auto_598731 ) ) ( not ( = ?auto_598727 ?auto_598732 ) ) ( not ( = ?auto_598727 ?auto_598733 ) ) ( not ( = ?auto_598727 ?auto_598734 ) ) ( not ( = ?auto_598728 ?auto_598729 ) ) ( not ( = ?auto_598728 ?auto_598730 ) ) ( not ( = ?auto_598728 ?auto_598731 ) ) ( not ( = ?auto_598728 ?auto_598732 ) ) ( not ( = ?auto_598728 ?auto_598733 ) ) ( not ( = ?auto_598728 ?auto_598734 ) ) ( not ( = ?auto_598729 ?auto_598730 ) ) ( not ( = ?auto_598729 ?auto_598731 ) ) ( not ( = ?auto_598729 ?auto_598732 ) ) ( not ( = ?auto_598729 ?auto_598733 ) ) ( not ( = ?auto_598729 ?auto_598734 ) ) ( not ( = ?auto_598730 ?auto_598731 ) ) ( not ( = ?auto_598730 ?auto_598732 ) ) ( not ( = ?auto_598730 ?auto_598733 ) ) ( not ( = ?auto_598730 ?auto_598734 ) ) ( not ( = ?auto_598731 ?auto_598732 ) ) ( not ( = ?auto_598731 ?auto_598733 ) ) ( not ( = ?auto_598731 ?auto_598734 ) ) ( not ( = ?auto_598732 ?auto_598733 ) ) ( not ( = ?auto_598732 ?auto_598734 ) ) ( not ( = ?auto_598733 ?auto_598734 ) ) ( ON ?auto_598732 ?auto_598733 ) ( ON ?auto_598731 ?auto_598732 ) ( ON ?auto_598730 ?auto_598731 ) ( ON ?auto_598729 ?auto_598730 ) ( ON ?auto_598728 ?auto_598729 ) ( ON ?auto_598727 ?auto_598728 ) ( ON ?auto_598726 ?auto_598727 ) ( CLEAR ?auto_598726 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_598726 )
      ( MAKE-8PILE ?auto_598726 ?auto_598727 ?auto_598728 ?auto_598729 ?auto_598730 ?auto_598731 ?auto_598732 ?auto_598733 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_598761 - BLOCK
      ?auto_598762 - BLOCK
      ?auto_598763 - BLOCK
      ?auto_598764 - BLOCK
      ?auto_598765 - BLOCK
      ?auto_598766 - BLOCK
      ?auto_598767 - BLOCK
      ?auto_598768 - BLOCK
      ?auto_598769 - BLOCK
    )
    :vars
    (
      ?auto_598770 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_598768 ) ( ON ?auto_598769 ?auto_598770 ) ( CLEAR ?auto_598769 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_598761 ) ( ON ?auto_598762 ?auto_598761 ) ( ON ?auto_598763 ?auto_598762 ) ( ON ?auto_598764 ?auto_598763 ) ( ON ?auto_598765 ?auto_598764 ) ( ON ?auto_598766 ?auto_598765 ) ( ON ?auto_598767 ?auto_598766 ) ( ON ?auto_598768 ?auto_598767 ) ( not ( = ?auto_598761 ?auto_598762 ) ) ( not ( = ?auto_598761 ?auto_598763 ) ) ( not ( = ?auto_598761 ?auto_598764 ) ) ( not ( = ?auto_598761 ?auto_598765 ) ) ( not ( = ?auto_598761 ?auto_598766 ) ) ( not ( = ?auto_598761 ?auto_598767 ) ) ( not ( = ?auto_598761 ?auto_598768 ) ) ( not ( = ?auto_598761 ?auto_598769 ) ) ( not ( = ?auto_598761 ?auto_598770 ) ) ( not ( = ?auto_598762 ?auto_598763 ) ) ( not ( = ?auto_598762 ?auto_598764 ) ) ( not ( = ?auto_598762 ?auto_598765 ) ) ( not ( = ?auto_598762 ?auto_598766 ) ) ( not ( = ?auto_598762 ?auto_598767 ) ) ( not ( = ?auto_598762 ?auto_598768 ) ) ( not ( = ?auto_598762 ?auto_598769 ) ) ( not ( = ?auto_598762 ?auto_598770 ) ) ( not ( = ?auto_598763 ?auto_598764 ) ) ( not ( = ?auto_598763 ?auto_598765 ) ) ( not ( = ?auto_598763 ?auto_598766 ) ) ( not ( = ?auto_598763 ?auto_598767 ) ) ( not ( = ?auto_598763 ?auto_598768 ) ) ( not ( = ?auto_598763 ?auto_598769 ) ) ( not ( = ?auto_598763 ?auto_598770 ) ) ( not ( = ?auto_598764 ?auto_598765 ) ) ( not ( = ?auto_598764 ?auto_598766 ) ) ( not ( = ?auto_598764 ?auto_598767 ) ) ( not ( = ?auto_598764 ?auto_598768 ) ) ( not ( = ?auto_598764 ?auto_598769 ) ) ( not ( = ?auto_598764 ?auto_598770 ) ) ( not ( = ?auto_598765 ?auto_598766 ) ) ( not ( = ?auto_598765 ?auto_598767 ) ) ( not ( = ?auto_598765 ?auto_598768 ) ) ( not ( = ?auto_598765 ?auto_598769 ) ) ( not ( = ?auto_598765 ?auto_598770 ) ) ( not ( = ?auto_598766 ?auto_598767 ) ) ( not ( = ?auto_598766 ?auto_598768 ) ) ( not ( = ?auto_598766 ?auto_598769 ) ) ( not ( = ?auto_598766 ?auto_598770 ) ) ( not ( = ?auto_598767 ?auto_598768 ) ) ( not ( = ?auto_598767 ?auto_598769 ) ) ( not ( = ?auto_598767 ?auto_598770 ) ) ( not ( = ?auto_598768 ?auto_598769 ) ) ( not ( = ?auto_598768 ?auto_598770 ) ) ( not ( = ?auto_598769 ?auto_598770 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_598769 ?auto_598770 )
      ( !STACK ?auto_598769 ?auto_598768 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_598799 - BLOCK
      ?auto_598800 - BLOCK
      ?auto_598801 - BLOCK
      ?auto_598802 - BLOCK
      ?auto_598803 - BLOCK
      ?auto_598804 - BLOCK
      ?auto_598805 - BLOCK
      ?auto_598806 - BLOCK
      ?auto_598807 - BLOCK
    )
    :vars
    (
      ?auto_598808 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_598807 ?auto_598808 ) ( ON-TABLE ?auto_598799 ) ( ON ?auto_598800 ?auto_598799 ) ( ON ?auto_598801 ?auto_598800 ) ( ON ?auto_598802 ?auto_598801 ) ( ON ?auto_598803 ?auto_598802 ) ( ON ?auto_598804 ?auto_598803 ) ( ON ?auto_598805 ?auto_598804 ) ( not ( = ?auto_598799 ?auto_598800 ) ) ( not ( = ?auto_598799 ?auto_598801 ) ) ( not ( = ?auto_598799 ?auto_598802 ) ) ( not ( = ?auto_598799 ?auto_598803 ) ) ( not ( = ?auto_598799 ?auto_598804 ) ) ( not ( = ?auto_598799 ?auto_598805 ) ) ( not ( = ?auto_598799 ?auto_598806 ) ) ( not ( = ?auto_598799 ?auto_598807 ) ) ( not ( = ?auto_598799 ?auto_598808 ) ) ( not ( = ?auto_598800 ?auto_598801 ) ) ( not ( = ?auto_598800 ?auto_598802 ) ) ( not ( = ?auto_598800 ?auto_598803 ) ) ( not ( = ?auto_598800 ?auto_598804 ) ) ( not ( = ?auto_598800 ?auto_598805 ) ) ( not ( = ?auto_598800 ?auto_598806 ) ) ( not ( = ?auto_598800 ?auto_598807 ) ) ( not ( = ?auto_598800 ?auto_598808 ) ) ( not ( = ?auto_598801 ?auto_598802 ) ) ( not ( = ?auto_598801 ?auto_598803 ) ) ( not ( = ?auto_598801 ?auto_598804 ) ) ( not ( = ?auto_598801 ?auto_598805 ) ) ( not ( = ?auto_598801 ?auto_598806 ) ) ( not ( = ?auto_598801 ?auto_598807 ) ) ( not ( = ?auto_598801 ?auto_598808 ) ) ( not ( = ?auto_598802 ?auto_598803 ) ) ( not ( = ?auto_598802 ?auto_598804 ) ) ( not ( = ?auto_598802 ?auto_598805 ) ) ( not ( = ?auto_598802 ?auto_598806 ) ) ( not ( = ?auto_598802 ?auto_598807 ) ) ( not ( = ?auto_598802 ?auto_598808 ) ) ( not ( = ?auto_598803 ?auto_598804 ) ) ( not ( = ?auto_598803 ?auto_598805 ) ) ( not ( = ?auto_598803 ?auto_598806 ) ) ( not ( = ?auto_598803 ?auto_598807 ) ) ( not ( = ?auto_598803 ?auto_598808 ) ) ( not ( = ?auto_598804 ?auto_598805 ) ) ( not ( = ?auto_598804 ?auto_598806 ) ) ( not ( = ?auto_598804 ?auto_598807 ) ) ( not ( = ?auto_598804 ?auto_598808 ) ) ( not ( = ?auto_598805 ?auto_598806 ) ) ( not ( = ?auto_598805 ?auto_598807 ) ) ( not ( = ?auto_598805 ?auto_598808 ) ) ( not ( = ?auto_598806 ?auto_598807 ) ) ( not ( = ?auto_598806 ?auto_598808 ) ) ( not ( = ?auto_598807 ?auto_598808 ) ) ( CLEAR ?auto_598805 ) ( ON ?auto_598806 ?auto_598807 ) ( CLEAR ?auto_598806 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_598799 ?auto_598800 ?auto_598801 ?auto_598802 ?auto_598803 ?auto_598804 ?auto_598805 ?auto_598806 )
      ( MAKE-9PILE ?auto_598799 ?auto_598800 ?auto_598801 ?auto_598802 ?auto_598803 ?auto_598804 ?auto_598805 ?auto_598806 ?auto_598807 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_598837 - BLOCK
      ?auto_598838 - BLOCK
      ?auto_598839 - BLOCK
      ?auto_598840 - BLOCK
      ?auto_598841 - BLOCK
      ?auto_598842 - BLOCK
      ?auto_598843 - BLOCK
      ?auto_598844 - BLOCK
      ?auto_598845 - BLOCK
    )
    :vars
    (
      ?auto_598846 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_598845 ?auto_598846 ) ( ON-TABLE ?auto_598837 ) ( ON ?auto_598838 ?auto_598837 ) ( ON ?auto_598839 ?auto_598838 ) ( ON ?auto_598840 ?auto_598839 ) ( ON ?auto_598841 ?auto_598840 ) ( ON ?auto_598842 ?auto_598841 ) ( not ( = ?auto_598837 ?auto_598838 ) ) ( not ( = ?auto_598837 ?auto_598839 ) ) ( not ( = ?auto_598837 ?auto_598840 ) ) ( not ( = ?auto_598837 ?auto_598841 ) ) ( not ( = ?auto_598837 ?auto_598842 ) ) ( not ( = ?auto_598837 ?auto_598843 ) ) ( not ( = ?auto_598837 ?auto_598844 ) ) ( not ( = ?auto_598837 ?auto_598845 ) ) ( not ( = ?auto_598837 ?auto_598846 ) ) ( not ( = ?auto_598838 ?auto_598839 ) ) ( not ( = ?auto_598838 ?auto_598840 ) ) ( not ( = ?auto_598838 ?auto_598841 ) ) ( not ( = ?auto_598838 ?auto_598842 ) ) ( not ( = ?auto_598838 ?auto_598843 ) ) ( not ( = ?auto_598838 ?auto_598844 ) ) ( not ( = ?auto_598838 ?auto_598845 ) ) ( not ( = ?auto_598838 ?auto_598846 ) ) ( not ( = ?auto_598839 ?auto_598840 ) ) ( not ( = ?auto_598839 ?auto_598841 ) ) ( not ( = ?auto_598839 ?auto_598842 ) ) ( not ( = ?auto_598839 ?auto_598843 ) ) ( not ( = ?auto_598839 ?auto_598844 ) ) ( not ( = ?auto_598839 ?auto_598845 ) ) ( not ( = ?auto_598839 ?auto_598846 ) ) ( not ( = ?auto_598840 ?auto_598841 ) ) ( not ( = ?auto_598840 ?auto_598842 ) ) ( not ( = ?auto_598840 ?auto_598843 ) ) ( not ( = ?auto_598840 ?auto_598844 ) ) ( not ( = ?auto_598840 ?auto_598845 ) ) ( not ( = ?auto_598840 ?auto_598846 ) ) ( not ( = ?auto_598841 ?auto_598842 ) ) ( not ( = ?auto_598841 ?auto_598843 ) ) ( not ( = ?auto_598841 ?auto_598844 ) ) ( not ( = ?auto_598841 ?auto_598845 ) ) ( not ( = ?auto_598841 ?auto_598846 ) ) ( not ( = ?auto_598842 ?auto_598843 ) ) ( not ( = ?auto_598842 ?auto_598844 ) ) ( not ( = ?auto_598842 ?auto_598845 ) ) ( not ( = ?auto_598842 ?auto_598846 ) ) ( not ( = ?auto_598843 ?auto_598844 ) ) ( not ( = ?auto_598843 ?auto_598845 ) ) ( not ( = ?auto_598843 ?auto_598846 ) ) ( not ( = ?auto_598844 ?auto_598845 ) ) ( not ( = ?auto_598844 ?auto_598846 ) ) ( not ( = ?auto_598845 ?auto_598846 ) ) ( ON ?auto_598844 ?auto_598845 ) ( CLEAR ?auto_598842 ) ( ON ?auto_598843 ?auto_598844 ) ( CLEAR ?auto_598843 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_598837 ?auto_598838 ?auto_598839 ?auto_598840 ?auto_598841 ?auto_598842 ?auto_598843 )
      ( MAKE-9PILE ?auto_598837 ?auto_598838 ?auto_598839 ?auto_598840 ?auto_598841 ?auto_598842 ?auto_598843 ?auto_598844 ?auto_598845 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_598875 - BLOCK
      ?auto_598876 - BLOCK
      ?auto_598877 - BLOCK
      ?auto_598878 - BLOCK
      ?auto_598879 - BLOCK
      ?auto_598880 - BLOCK
      ?auto_598881 - BLOCK
      ?auto_598882 - BLOCK
      ?auto_598883 - BLOCK
    )
    :vars
    (
      ?auto_598884 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_598883 ?auto_598884 ) ( ON-TABLE ?auto_598875 ) ( ON ?auto_598876 ?auto_598875 ) ( ON ?auto_598877 ?auto_598876 ) ( ON ?auto_598878 ?auto_598877 ) ( ON ?auto_598879 ?auto_598878 ) ( not ( = ?auto_598875 ?auto_598876 ) ) ( not ( = ?auto_598875 ?auto_598877 ) ) ( not ( = ?auto_598875 ?auto_598878 ) ) ( not ( = ?auto_598875 ?auto_598879 ) ) ( not ( = ?auto_598875 ?auto_598880 ) ) ( not ( = ?auto_598875 ?auto_598881 ) ) ( not ( = ?auto_598875 ?auto_598882 ) ) ( not ( = ?auto_598875 ?auto_598883 ) ) ( not ( = ?auto_598875 ?auto_598884 ) ) ( not ( = ?auto_598876 ?auto_598877 ) ) ( not ( = ?auto_598876 ?auto_598878 ) ) ( not ( = ?auto_598876 ?auto_598879 ) ) ( not ( = ?auto_598876 ?auto_598880 ) ) ( not ( = ?auto_598876 ?auto_598881 ) ) ( not ( = ?auto_598876 ?auto_598882 ) ) ( not ( = ?auto_598876 ?auto_598883 ) ) ( not ( = ?auto_598876 ?auto_598884 ) ) ( not ( = ?auto_598877 ?auto_598878 ) ) ( not ( = ?auto_598877 ?auto_598879 ) ) ( not ( = ?auto_598877 ?auto_598880 ) ) ( not ( = ?auto_598877 ?auto_598881 ) ) ( not ( = ?auto_598877 ?auto_598882 ) ) ( not ( = ?auto_598877 ?auto_598883 ) ) ( not ( = ?auto_598877 ?auto_598884 ) ) ( not ( = ?auto_598878 ?auto_598879 ) ) ( not ( = ?auto_598878 ?auto_598880 ) ) ( not ( = ?auto_598878 ?auto_598881 ) ) ( not ( = ?auto_598878 ?auto_598882 ) ) ( not ( = ?auto_598878 ?auto_598883 ) ) ( not ( = ?auto_598878 ?auto_598884 ) ) ( not ( = ?auto_598879 ?auto_598880 ) ) ( not ( = ?auto_598879 ?auto_598881 ) ) ( not ( = ?auto_598879 ?auto_598882 ) ) ( not ( = ?auto_598879 ?auto_598883 ) ) ( not ( = ?auto_598879 ?auto_598884 ) ) ( not ( = ?auto_598880 ?auto_598881 ) ) ( not ( = ?auto_598880 ?auto_598882 ) ) ( not ( = ?auto_598880 ?auto_598883 ) ) ( not ( = ?auto_598880 ?auto_598884 ) ) ( not ( = ?auto_598881 ?auto_598882 ) ) ( not ( = ?auto_598881 ?auto_598883 ) ) ( not ( = ?auto_598881 ?auto_598884 ) ) ( not ( = ?auto_598882 ?auto_598883 ) ) ( not ( = ?auto_598882 ?auto_598884 ) ) ( not ( = ?auto_598883 ?auto_598884 ) ) ( ON ?auto_598882 ?auto_598883 ) ( ON ?auto_598881 ?auto_598882 ) ( CLEAR ?auto_598879 ) ( ON ?auto_598880 ?auto_598881 ) ( CLEAR ?auto_598880 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_598875 ?auto_598876 ?auto_598877 ?auto_598878 ?auto_598879 ?auto_598880 )
      ( MAKE-9PILE ?auto_598875 ?auto_598876 ?auto_598877 ?auto_598878 ?auto_598879 ?auto_598880 ?auto_598881 ?auto_598882 ?auto_598883 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_598913 - BLOCK
      ?auto_598914 - BLOCK
      ?auto_598915 - BLOCK
      ?auto_598916 - BLOCK
      ?auto_598917 - BLOCK
      ?auto_598918 - BLOCK
      ?auto_598919 - BLOCK
      ?auto_598920 - BLOCK
      ?auto_598921 - BLOCK
    )
    :vars
    (
      ?auto_598922 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_598921 ?auto_598922 ) ( ON-TABLE ?auto_598913 ) ( ON ?auto_598914 ?auto_598913 ) ( ON ?auto_598915 ?auto_598914 ) ( ON ?auto_598916 ?auto_598915 ) ( not ( = ?auto_598913 ?auto_598914 ) ) ( not ( = ?auto_598913 ?auto_598915 ) ) ( not ( = ?auto_598913 ?auto_598916 ) ) ( not ( = ?auto_598913 ?auto_598917 ) ) ( not ( = ?auto_598913 ?auto_598918 ) ) ( not ( = ?auto_598913 ?auto_598919 ) ) ( not ( = ?auto_598913 ?auto_598920 ) ) ( not ( = ?auto_598913 ?auto_598921 ) ) ( not ( = ?auto_598913 ?auto_598922 ) ) ( not ( = ?auto_598914 ?auto_598915 ) ) ( not ( = ?auto_598914 ?auto_598916 ) ) ( not ( = ?auto_598914 ?auto_598917 ) ) ( not ( = ?auto_598914 ?auto_598918 ) ) ( not ( = ?auto_598914 ?auto_598919 ) ) ( not ( = ?auto_598914 ?auto_598920 ) ) ( not ( = ?auto_598914 ?auto_598921 ) ) ( not ( = ?auto_598914 ?auto_598922 ) ) ( not ( = ?auto_598915 ?auto_598916 ) ) ( not ( = ?auto_598915 ?auto_598917 ) ) ( not ( = ?auto_598915 ?auto_598918 ) ) ( not ( = ?auto_598915 ?auto_598919 ) ) ( not ( = ?auto_598915 ?auto_598920 ) ) ( not ( = ?auto_598915 ?auto_598921 ) ) ( not ( = ?auto_598915 ?auto_598922 ) ) ( not ( = ?auto_598916 ?auto_598917 ) ) ( not ( = ?auto_598916 ?auto_598918 ) ) ( not ( = ?auto_598916 ?auto_598919 ) ) ( not ( = ?auto_598916 ?auto_598920 ) ) ( not ( = ?auto_598916 ?auto_598921 ) ) ( not ( = ?auto_598916 ?auto_598922 ) ) ( not ( = ?auto_598917 ?auto_598918 ) ) ( not ( = ?auto_598917 ?auto_598919 ) ) ( not ( = ?auto_598917 ?auto_598920 ) ) ( not ( = ?auto_598917 ?auto_598921 ) ) ( not ( = ?auto_598917 ?auto_598922 ) ) ( not ( = ?auto_598918 ?auto_598919 ) ) ( not ( = ?auto_598918 ?auto_598920 ) ) ( not ( = ?auto_598918 ?auto_598921 ) ) ( not ( = ?auto_598918 ?auto_598922 ) ) ( not ( = ?auto_598919 ?auto_598920 ) ) ( not ( = ?auto_598919 ?auto_598921 ) ) ( not ( = ?auto_598919 ?auto_598922 ) ) ( not ( = ?auto_598920 ?auto_598921 ) ) ( not ( = ?auto_598920 ?auto_598922 ) ) ( not ( = ?auto_598921 ?auto_598922 ) ) ( ON ?auto_598920 ?auto_598921 ) ( ON ?auto_598919 ?auto_598920 ) ( ON ?auto_598918 ?auto_598919 ) ( CLEAR ?auto_598916 ) ( ON ?auto_598917 ?auto_598918 ) ( CLEAR ?auto_598917 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_598913 ?auto_598914 ?auto_598915 ?auto_598916 ?auto_598917 )
      ( MAKE-9PILE ?auto_598913 ?auto_598914 ?auto_598915 ?auto_598916 ?auto_598917 ?auto_598918 ?auto_598919 ?auto_598920 ?auto_598921 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_598951 - BLOCK
      ?auto_598952 - BLOCK
      ?auto_598953 - BLOCK
      ?auto_598954 - BLOCK
      ?auto_598955 - BLOCK
      ?auto_598956 - BLOCK
      ?auto_598957 - BLOCK
      ?auto_598958 - BLOCK
      ?auto_598959 - BLOCK
    )
    :vars
    (
      ?auto_598960 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_598959 ?auto_598960 ) ( ON-TABLE ?auto_598951 ) ( ON ?auto_598952 ?auto_598951 ) ( ON ?auto_598953 ?auto_598952 ) ( not ( = ?auto_598951 ?auto_598952 ) ) ( not ( = ?auto_598951 ?auto_598953 ) ) ( not ( = ?auto_598951 ?auto_598954 ) ) ( not ( = ?auto_598951 ?auto_598955 ) ) ( not ( = ?auto_598951 ?auto_598956 ) ) ( not ( = ?auto_598951 ?auto_598957 ) ) ( not ( = ?auto_598951 ?auto_598958 ) ) ( not ( = ?auto_598951 ?auto_598959 ) ) ( not ( = ?auto_598951 ?auto_598960 ) ) ( not ( = ?auto_598952 ?auto_598953 ) ) ( not ( = ?auto_598952 ?auto_598954 ) ) ( not ( = ?auto_598952 ?auto_598955 ) ) ( not ( = ?auto_598952 ?auto_598956 ) ) ( not ( = ?auto_598952 ?auto_598957 ) ) ( not ( = ?auto_598952 ?auto_598958 ) ) ( not ( = ?auto_598952 ?auto_598959 ) ) ( not ( = ?auto_598952 ?auto_598960 ) ) ( not ( = ?auto_598953 ?auto_598954 ) ) ( not ( = ?auto_598953 ?auto_598955 ) ) ( not ( = ?auto_598953 ?auto_598956 ) ) ( not ( = ?auto_598953 ?auto_598957 ) ) ( not ( = ?auto_598953 ?auto_598958 ) ) ( not ( = ?auto_598953 ?auto_598959 ) ) ( not ( = ?auto_598953 ?auto_598960 ) ) ( not ( = ?auto_598954 ?auto_598955 ) ) ( not ( = ?auto_598954 ?auto_598956 ) ) ( not ( = ?auto_598954 ?auto_598957 ) ) ( not ( = ?auto_598954 ?auto_598958 ) ) ( not ( = ?auto_598954 ?auto_598959 ) ) ( not ( = ?auto_598954 ?auto_598960 ) ) ( not ( = ?auto_598955 ?auto_598956 ) ) ( not ( = ?auto_598955 ?auto_598957 ) ) ( not ( = ?auto_598955 ?auto_598958 ) ) ( not ( = ?auto_598955 ?auto_598959 ) ) ( not ( = ?auto_598955 ?auto_598960 ) ) ( not ( = ?auto_598956 ?auto_598957 ) ) ( not ( = ?auto_598956 ?auto_598958 ) ) ( not ( = ?auto_598956 ?auto_598959 ) ) ( not ( = ?auto_598956 ?auto_598960 ) ) ( not ( = ?auto_598957 ?auto_598958 ) ) ( not ( = ?auto_598957 ?auto_598959 ) ) ( not ( = ?auto_598957 ?auto_598960 ) ) ( not ( = ?auto_598958 ?auto_598959 ) ) ( not ( = ?auto_598958 ?auto_598960 ) ) ( not ( = ?auto_598959 ?auto_598960 ) ) ( ON ?auto_598958 ?auto_598959 ) ( ON ?auto_598957 ?auto_598958 ) ( ON ?auto_598956 ?auto_598957 ) ( ON ?auto_598955 ?auto_598956 ) ( CLEAR ?auto_598953 ) ( ON ?auto_598954 ?auto_598955 ) ( CLEAR ?auto_598954 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_598951 ?auto_598952 ?auto_598953 ?auto_598954 )
      ( MAKE-9PILE ?auto_598951 ?auto_598952 ?auto_598953 ?auto_598954 ?auto_598955 ?auto_598956 ?auto_598957 ?auto_598958 ?auto_598959 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_598989 - BLOCK
      ?auto_598990 - BLOCK
      ?auto_598991 - BLOCK
      ?auto_598992 - BLOCK
      ?auto_598993 - BLOCK
      ?auto_598994 - BLOCK
      ?auto_598995 - BLOCK
      ?auto_598996 - BLOCK
      ?auto_598997 - BLOCK
    )
    :vars
    (
      ?auto_598998 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_598997 ?auto_598998 ) ( ON-TABLE ?auto_598989 ) ( ON ?auto_598990 ?auto_598989 ) ( not ( = ?auto_598989 ?auto_598990 ) ) ( not ( = ?auto_598989 ?auto_598991 ) ) ( not ( = ?auto_598989 ?auto_598992 ) ) ( not ( = ?auto_598989 ?auto_598993 ) ) ( not ( = ?auto_598989 ?auto_598994 ) ) ( not ( = ?auto_598989 ?auto_598995 ) ) ( not ( = ?auto_598989 ?auto_598996 ) ) ( not ( = ?auto_598989 ?auto_598997 ) ) ( not ( = ?auto_598989 ?auto_598998 ) ) ( not ( = ?auto_598990 ?auto_598991 ) ) ( not ( = ?auto_598990 ?auto_598992 ) ) ( not ( = ?auto_598990 ?auto_598993 ) ) ( not ( = ?auto_598990 ?auto_598994 ) ) ( not ( = ?auto_598990 ?auto_598995 ) ) ( not ( = ?auto_598990 ?auto_598996 ) ) ( not ( = ?auto_598990 ?auto_598997 ) ) ( not ( = ?auto_598990 ?auto_598998 ) ) ( not ( = ?auto_598991 ?auto_598992 ) ) ( not ( = ?auto_598991 ?auto_598993 ) ) ( not ( = ?auto_598991 ?auto_598994 ) ) ( not ( = ?auto_598991 ?auto_598995 ) ) ( not ( = ?auto_598991 ?auto_598996 ) ) ( not ( = ?auto_598991 ?auto_598997 ) ) ( not ( = ?auto_598991 ?auto_598998 ) ) ( not ( = ?auto_598992 ?auto_598993 ) ) ( not ( = ?auto_598992 ?auto_598994 ) ) ( not ( = ?auto_598992 ?auto_598995 ) ) ( not ( = ?auto_598992 ?auto_598996 ) ) ( not ( = ?auto_598992 ?auto_598997 ) ) ( not ( = ?auto_598992 ?auto_598998 ) ) ( not ( = ?auto_598993 ?auto_598994 ) ) ( not ( = ?auto_598993 ?auto_598995 ) ) ( not ( = ?auto_598993 ?auto_598996 ) ) ( not ( = ?auto_598993 ?auto_598997 ) ) ( not ( = ?auto_598993 ?auto_598998 ) ) ( not ( = ?auto_598994 ?auto_598995 ) ) ( not ( = ?auto_598994 ?auto_598996 ) ) ( not ( = ?auto_598994 ?auto_598997 ) ) ( not ( = ?auto_598994 ?auto_598998 ) ) ( not ( = ?auto_598995 ?auto_598996 ) ) ( not ( = ?auto_598995 ?auto_598997 ) ) ( not ( = ?auto_598995 ?auto_598998 ) ) ( not ( = ?auto_598996 ?auto_598997 ) ) ( not ( = ?auto_598996 ?auto_598998 ) ) ( not ( = ?auto_598997 ?auto_598998 ) ) ( ON ?auto_598996 ?auto_598997 ) ( ON ?auto_598995 ?auto_598996 ) ( ON ?auto_598994 ?auto_598995 ) ( ON ?auto_598993 ?auto_598994 ) ( ON ?auto_598992 ?auto_598993 ) ( CLEAR ?auto_598990 ) ( ON ?auto_598991 ?auto_598992 ) ( CLEAR ?auto_598991 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_598989 ?auto_598990 ?auto_598991 )
      ( MAKE-9PILE ?auto_598989 ?auto_598990 ?auto_598991 ?auto_598992 ?auto_598993 ?auto_598994 ?auto_598995 ?auto_598996 ?auto_598997 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_599027 - BLOCK
      ?auto_599028 - BLOCK
      ?auto_599029 - BLOCK
      ?auto_599030 - BLOCK
      ?auto_599031 - BLOCK
      ?auto_599032 - BLOCK
      ?auto_599033 - BLOCK
      ?auto_599034 - BLOCK
      ?auto_599035 - BLOCK
    )
    :vars
    (
      ?auto_599036 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_599035 ?auto_599036 ) ( ON-TABLE ?auto_599027 ) ( not ( = ?auto_599027 ?auto_599028 ) ) ( not ( = ?auto_599027 ?auto_599029 ) ) ( not ( = ?auto_599027 ?auto_599030 ) ) ( not ( = ?auto_599027 ?auto_599031 ) ) ( not ( = ?auto_599027 ?auto_599032 ) ) ( not ( = ?auto_599027 ?auto_599033 ) ) ( not ( = ?auto_599027 ?auto_599034 ) ) ( not ( = ?auto_599027 ?auto_599035 ) ) ( not ( = ?auto_599027 ?auto_599036 ) ) ( not ( = ?auto_599028 ?auto_599029 ) ) ( not ( = ?auto_599028 ?auto_599030 ) ) ( not ( = ?auto_599028 ?auto_599031 ) ) ( not ( = ?auto_599028 ?auto_599032 ) ) ( not ( = ?auto_599028 ?auto_599033 ) ) ( not ( = ?auto_599028 ?auto_599034 ) ) ( not ( = ?auto_599028 ?auto_599035 ) ) ( not ( = ?auto_599028 ?auto_599036 ) ) ( not ( = ?auto_599029 ?auto_599030 ) ) ( not ( = ?auto_599029 ?auto_599031 ) ) ( not ( = ?auto_599029 ?auto_599032 ) ) ( not ( = ?auto_599029 ?auto_599033 ) ) ( not ( = ?auto_599029 ?auto_599034 ) ) ( not ( = ?auto_599029 ?auto_599035 ) ) ( not ( = ?auto_599029 ?auto_599036 ) ) ( not ( = ?auto_599030 ?auto_599031 ) ) ( not ( = ?auto_599030 ?auto_599032 ) ) ( not ( = ?auto_599030 ?auto_599033 ) ) ( not ( = ?auto_599030 ?auto_599034 ) ) ( not ( = ?auto_599030 ?auto_599035 ) ) ( not ( = ?auto_599030 ?auto_599036 ) ) ( not ( = ?auto_599031 ?auto_599032 ) ) ( not ( = ?auto_599031 ?auto_599033 ) ) ( not ( = ?auto_599031 ?auto_599034 ) ) ( not ( = ?auto_599031 ?auto_599035 ) ) ( not ( = ?auto_599031 ?auto_599036 ) ) ( not ( = ?auto_599032 ?auto_599033 ) ) ( not ( = ?auto_599032 ?auto_599034 ) ) ( not ( = ?auto_599032 ?auto_599035 ) ) ( not ( = ?auto_599032 ?auto_599036 ) ) ( not ( = ?auto_599033 ?auto_599034 ) ) ( not ( = ?auto_599033 ?auto_599035 ) ) ( not ( = ?auto_599033 ?auto_599036 ) ) ( not ( = ?auto_599034 ?auto_599035 ) ) ( not ( = ?auto_599034 ?auto_599036 ) ) ( not ( = ?auto_599035 ?auto_599036 ) ) ( ON ?auto_599034 ?auto_599035 ) ( ON ?auto_599033 ?auto_599034 ) ( ON ?auto_599032 ?auto_599033 ) ( ON ?auto_599031 ?auto_599032 ) ( ON ?auto_599030 ?auto_599031 ) ( ON ?auto_599029 ?auto_599030 ) ( CLEAR ?auto_599027 ) ( ON ?auto_599028 ?auto_599029 ) ( CLEAR ?auto_599028 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_599027 ?auto_599028 )
      ( MAKE-9PILE ?auto_599027 ?auto_599028 ?auto_599029 ?auto_599030 ?auto_599031 ?auto_599032 ?auto_599033 ?auto_599034 ?auto_599035 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_599065 - BLOCK
      ?auto_599066 - BLOCK
      ?auto_599067 - BLOCK
      ?auto_599068 - BLOCK
      ?auto_599069 - BLOCK
      ?auto_599070 - BLOCK
      ?auto_599071 - BLOCK
      ?auto_599072 - BLOCK
      ?auto_599073 - BLOCK
    )
    :vars
    (
      ?auto_599074 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_599073 ?auto_599074 ) ( not ( = ?auto_599065 ?auto_599066 ) ) ( not ( = ?auto_599065 ?auto_599067 ) ) ( not ( = ?auto_599065 ?auto_599068 ) ) ( not ( = ?auto_599065 ?auto_599069 ) ) ( not ( = ?auto_599065 ?auto_599070 ) ) ( not ( = ?auto_599065 ?auto_599071 ) ) ( not ( = ?auto_599065 ?auto_599072 ) ) ( not ( = ?auto_599065 ?auto_599073 ) ) ( not ( = ?auto_599065 ?auto_599074 ) ) ( not ( = ?auto_599066 ?auto_599067 ) ) ( not ( = ?auto_599066 ?auto_599068 ) ) ( not ( = ?auto_599066 ?auto_599069 ) ) ( not ( = ?auto_599066 ?auto_599070 ) ) ( not ( = ?auto_599066 ?auto_599071 ) ) ( not ( = ?auto_599066 ?auto_599072 ) ) ( not ( = ?auto_599066 ?auto_599073 ) ) ( not ( = ?auto_599066 ?auto_599074 ) ) ( not ( = ?auto_599067 ?auto_599068 ) ) ( not ( = ?auto_599067 ?auto_599069 ) ) ( not ( = ?auto_599067 ?auto_599070 ) ) ( not ( = ?auto_599067 ?auto_599071 ) ) ( not ( = ?auto_599067 ?auto_599072 ) ) ( not ( = ?auto_599067 ?auto_599073 ) ) ( not ( = ?auto_599067 ?auto_599074 ) ) ( not ( = ?auto_599068 ?auto_599069 ) ) ( not ( = ?auto_599068 ?auto_599070 ) ) ( not ( = ?auto_599068 ?auto_599071 ) ) ( not ( = ?auto_599068 ?auto_599072 ) ) ( not ( = ?auto_599068 ?auto_599073 ) ) ( not ( = ?auto_599068 ?auto_599074 ) ) ( not ( = ?auto_599069 ?auto_599070 ) ) ( not ( = ?auto_599069 ?auto_599071 ) ) ( not ( = ?auto_599069 ?auto_599072 ) ) ( not ( = ?auto_599069 ?auto_599073 ) ) ( not ( = ?auto_599069 ?auto_599074 ) ) ( not ( = ?auto_599070 ?auto_599071 ) ) ( not ( = ?auto_599070 ?auto_599072 ) ) ( not ( = ?auto_599070 ?auto_599073 ) ) ( not ( = ?auto_599070 ?auto_599074 ) ) ( not ( = ?auto_599071 ?auto_599072 ) ) ( not ( = ?auto_599071 ?auto_599073 ) ) ( not ( = ?auto_599071 ?auto_599074 ) ) ( not ( = ?auto_599072 ?auto_599073 ) ) ( not ( = ?auto_599072 ?auto_599074 ) ) ( not ( = ?auto_599073 ?auto_599074 ) ) ( ON ?auto_599072 ?auto_599073 ) ( ON ?auto_599071 ?auto_599072 ) ( ON ?auto_599070 ?auto_599071 ) ( ON ?auto_599069 ?auto_599070 ) ( ON ?auto_599068 ?auto_599069 ) ( ON ?auto_599067 ?auto_599068 ) ( ON ?auto_599066 ?auto_599067 ) ( ON ?auto_599065 ?auto_599066 ) ( CLEAR ?auto_599065 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_599065 )
      ( MAKE-9PILE ?auto_599065 ?auto_599066 ?auto_599067 ?auto_599068 ?auto_599069 ?auto_599070 ?auto_599071 ?auto_599072 ?auto_599073 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_599104 - BLOCK
      ?auto_599105 - BLOCK
      ?auto_599106 - BLOCK
      ?auto_599107 - BLOCK
      ?auto_599108 - BLOCK
      ?auto_599109 - BLOCK
      ?auto_599110 - BLOCK
      ?auto_599111 - BLOCK
      ?auto_599112 - BLOCK
      ?auto_599113 - BLOCK
    )
    :vars
    (
      ?auto_599114 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_599112 ) ( ON ?auto_599113 ?auto_599114 ) ( CLEAR ?auto_599113 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_599104 ) ( ON ?auto_599105 ?auto_599104 ) ( ON ?auto_599106 ?auto_599105 ) ( ON ?auto_599107 ?auto_599106 ) ( ON ?auto_599108 ?auto_599107 ) ( ON ?auto_599109 ?auto_599108 ) ( ON ?auto_599110 ?auto_599109 ) ( ON ?auto_599111 ?auto_599110 ) ( ON ?auto_599112 ?auto_599111 ) ( not ( = ?auto_599104 ?auto_599105 ) ) ( not ( = ?auto_599104 ?auto_599106 ) ) ( not ( = ?auto_599104 ?auto_599107 ) ) ( not ( = ?auto_599104 ?auto_599108 ) ) ( not ( = ?auto_599104 ?auto_599109 ) ) ( not ( = ?auto_599104 ?auto_599110 ) ) ( not ( = ?auto_599104 ?auto_599111 ) ) ( not ( = ?auto_599104 ?auto_599112 ) ) ( not ( = ?auto_599104 ?auto_599113 ) ) ( not ( = ?auto_599104 ?auto_599114 ) ) ( not ( = ?auto_599105 ?auto_599106 ) ) ( not ( = ?auto_599105 ?auto_599107 ) ) ( not ( = ?auto_599105 ?auto_599108 ) ) ( not ( = ?auto_599105 ?auto_599109 ) ) ( not ( = ?auto_599105 ?auto_599110 ) ) ( not ( = ?auto_599105 ?auto_599111 ) ) ( not ( = ?auto_599105 ?auto_599112 ) ) ( not ( = ?auto_599105 ?auto_599113 ) ) ( not ( = ?auto_599105 ?auto_599114 ) ) ( not ( = ?auto_599106 ?auto_599107 ) ) ( not ( = ?auto_599106 ?auto_599108 ) ) ( not ( = ?auto_599106 ?auto_599109 ) ) ( not ( = ?auto_599106 ?auto_599110 ) ) ( not ( = ?auto_599106 ?auto_599111 ) ) ( not ( = ?auto_599106 ?auto_599112 ) ) ( not ( = ?auto_599106 ?auto_599113 ) ) ( not ( = ?auto_599106 ?auto_599114 ) ) ( not ( = ?auto_599107 ?auto_599108 ) ) ( not ( = ?auto_599107 ?auto_599109 ) ) ( not ( = ?auto_599107 ?auto_599110 ) ) ( not ( = ?auto_599107 ?auto_599111 ) ) ( not ( = ?auto_599107 ?auto_599112 ) ) ( not ( = ?auto_599107 ?auto_599113 ) ) ( not ( = ?auto_599107 ?auto_599114 ) ) ( not ( = ?auto_599108 ?auto_599109 ) ) ( not ( = ?auto_599108 ?auto_599110 ) ) ( not ( = ?auto_599108 ?auto_599111 ) ) ( not ( = ?auto_599108 ?auto_599112 ) ) ( not ( = ?auto_599108 ?auto_599113 ) ) ( not ( = ?auto_599108 ?auto_599114 ) ) ( not ( = ?auto_599109 ?auto_599110 ) ) ( not ( = ?auto_599109 ?auto_599111 ) ) ( not ( = ?auto_599109 ?auto_599112 ) ) ( not ( = ?auto_599109 ?auto_599113 ) ) ( not ( = ?auto_599109 ?auto_599114 ) ) ( not ( = ?auto_599110 ?auto_599111 ) ) ( not ( = ?auto_599110 ?auto_599112 ) ) ( not ( = ?auto_599110 ?auto_599113 ) ) ( not ( = ?auto_599110 ?auto_599114 ) ) ( not ( = ?auto_599111 ?auto_599112 ) ) ( not ( = ?auto_599111 ?auto_599113 ) ) ( not ( = ?auto_599111 ?auto_599114 ) ) ( not ( = ?auto_599112 ?auto_599113 ) ) ( not ( = ?auto_599112 ?auto_599114 ) ) ( not ( = ?auto_599113 ?auto_599114 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_599113 ?auto_599114 )
      ( !STACK ?auto_599113 ?auto_599112 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_599146 - BLOCK
      ?auto_599147 - BLOCK
      ?auto_599148 - BLOCK
      ?auto_599149 - BLOCK
      ?auto_599150 - BLOCK
      ?auto_599151 - BLOCK
      ?auto_599152 - BLOCK
      ?auto_599153 - BLOCK
      ?auto_599154 - BLOCK
      ?auto_599155 - BLOCK
    )
    :vars
    (
      ?auto_599156 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_599155 ?auto_599156 ) ( ON-TABLE ?auto_599146 ) ( ON ?auto_599147 ?auto_599146 ) ( ON ?auto_599148 ?auto_599147 ) ( ON ?auto_599149 ?auto_599148 ) ( ON ?auto_599150 ?auto_599149 ) ( ON ?auto_599151 ?auto_599150 ) ( ON ?auto_599152 ?auto_599151 ) ( ON ?auto_599153 ?auto_599152 ) ( not ( = ?auto_599146 ?auto_599147 ) ) ( not ( = ?auto_599146 ?auto_599148 ) ) ( not ( = ?auto_599146 ?auto_599149 ) ) ( not ( = ?auto_599146 ?auto_599150 ) ) ( not ( = ?auto_599146 ?auto_599151 ) ) ( not ( = ?auto_599146 ?auto_599152 ) ) ( not ( = ?auto_599146 ?auto_599153 ) ) ( not ( = ?auto_599146 ?auto_599154 ) ) ( not ( = ?auto_599146 ?auto_599155 ) ) ( not ( = ?auto_599146 ?auto_599156 ) ) ( not ( = ?auto_599147 ?auto_599148 ) ) ( not ( = ?auto_599147 ?auto_599149 ) ) ( not ( = ?auto_599147 ?auto_599150 ) ) ( not ( = ?auto_599147 ?auto_599151 ) ) ( not ( = ?auto_599147 ?auto_599152 ) ) ( not ( = ?auto_599147 ?auto_599153 ) ) ( not ( = ?auto_599147 ?auto_599154 ) ) ( not ( = ?auto_599147 ?auto_599155 ) ) ( not ( = ?auto_599147 ?auto_599156 ) ) ( not ( = ?auto_599148 ?auto_599149 ) ) ( not ( = ?auto_599148 ?auto_599150 ) ) ( not ( = ?auto_599148 ?auto_599151 ) ) ( not ( = ?auto_599148 ?auto_599152 ) ) ( not ( = ?auto_599148 ?auto_599153 ) ) ( not ( = ?auto_599148 ?auto_599154 ) ) ( not ( = ?auto_599148 ?auto_599155 ) ) ( not ( = ?auto_599148 ?auto_599156 ) ) ( not ( = ?auto_599149 ?auto_599150 ) ) ( not ( = ?auto_599149 ?auto_599151 ) ) ( not ( = ?auto_599149 ?auto_599152 ) ) ( not ( = ?auto_599149 ?auto_599153 ) ) ( not ( = ?auto_599149 ?auto_599154 ) ) ( not ( = ?auto_599149 ?auto_599155 ) ) ( not ( = ?auto_599149 ?auto_599156 ) ) ( not ( = ?auto_599150 ?auto_599151 ) ) ( not ( = ?auto_599150 ?auto_599152 ) ) ( not ( = ?auto_599150 ?auto_599153 ) ) ( not ( = ?auto_599150 ?auto_599154 ) ) ( not ( = ?auto_599150 ?auto_599155 ) ) ( not ( = ?auto_599150 ?auto_599156 ) ) ( not ( = ?auto_599151 ?auto_599152 ) ) ( not ( = ?auto_599151 ?auto_599153 ) ) ( not ( = ?auto_599151 ?auto_599154 ) ) ( not ( = ?auto_599151 ?auto_599155 ) ) ( not ( = ?auto_599151 ?auto_599156 ) ) ( not ( = ?auto_599152 ?auto_599153 ) ) ( not ( = ?auto_599152 ?auto_599154 ) ) ( not ( = ?auto_599152 ?auto_599155 ) ) ( not ( = ?auto_599152 ?auto_599156 ) ) ( not ( = ?auto_599153 ?auto_599154 ) ) ( not ( = ?auto_599153 ?auto_599155 ) ) ( not ( = ?auto_599153 ?auto_599156 ) ) ( not ( = ?auto_599154 ?auto_599155 ) ) ( not ( = ?auto_599154 ?auto_599156 ) ) ( not ( = ?auto_599155 ?auto_599156 ) ) ( CLEAR ?auto_599153 ) ( ON ?auto_599154 ?auto_599155 ) ( CLEAR ?auto_599154 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_599146 ?auto_599147 ?auto_599148 ?auto_599149 ?auto_599150 ?auto_599151 ?auto_599152 ?auto_599153 ?auto_599154 )
      ( MAKE-10PILE ?auto_599146 ?auto_599147 ?auto_599148 ?auto_599149 ?auto_599150 ?auto_599151 ?auto_599152 ?auto_599153 ?auto_599154 ?auto_599155 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_599188 - BLOCK
      ?auto_599189 - BLOCK
      ?auto_599190 - BLOCK
      ?auto_599191 - BLOCK
      ?auto_599192 - BLOCK
      ?auto_599193 - BLOCK
      ?auto_599194 - BLOCK
      ?auto_599195 - BLOCK
      ?auto_599196 - BLOCK
      ?auto_599197 - BLOCK
    )
    :vars
    (
      ?auto_599198 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_599197 ?auto_599198 ) ( ON-TABLE ?auto_599188 ) ( ON ?auto_599189 ?auto_599188 ) ( ON ?auto_599190 ?auto_599189 ) ( ON ?auto_599191 ?auto_599190 ) ( ON ?auto_599192 ?auto_599191 ) ( ON ?auto_599193 ?auto_599192 ) ( ON ?auto_599194 ?auto_599193 ) ( not ( = ?auto_599188 ?auto_599189 ) ) ( not ( = ?auto_599188 ?auto_599190 ) ) ( not ( = ?auto_599188 ?auto_599191 ) ) ( not ( = ?auto_599188 ?auto_599192 ) ) ( not ( = ?auto_599188 ?auto_599193 ) ) ( not ( = ?auto_599188 ?auto_599194 ) ) ( not ( = ?auto_599188 ?auto_599195 ) ) ( not ( = ?auto_599188 ?auto_599196 ) ) ( not ( = ?auto_599188 ?auto_599197 ) ) ( not ( = ?auto_599188 ?auto_599198 ) ) ( not ( = ?auto_599189 ?auto_599190 ) ) ( not ( = ?auto_599189 ?auto_599191 ) ) ( not ( = ?auto_599189 ?auto_599192 ) ) ( not ( = ?auto_599189 ?auto_599193 ) ) ( not ( = ?auto_599189 ?auto_599194 ) ) ( not ( = ?auto_599189 ?auto_599195 ) ) ( not ( = ?auto_599189 ?auto_599196 ) ) ( not ( = ?auto_599189 ?auto_599197 ) ) ( not ( = ?auto_599189 ?auto_599198 ) ) ( not ( = ?auto_599190 ?auto_599191 ) ) ( not ( = ?auto_599190 ?auto_599192 ) ) ( not ( = ?auto_599190 ?auto_599193 ) ) ( not ( = ?auto_599190 ?auto_599194 ) ) ( not ( = ?auto_599190 ?auto_599195 ) ) ( not ( = ?auto_599190 ?auto_599196 ) ) ( not ( = ?auto_599190 ?auto_599197 ) ) ( not ( = ?auto_599190 ?auto_599198 ) ) ( not ( = ?auto_599191 ?auto_599192 ) ) ( not ( = ?auto_599191 ?auto_599193 ) ) ( not ( = ?auto_599191 ?auto_599194 ) ) ( not ( = ?auto_599191 ?auto_599195 ) ) ( not ( = ?auto_599191 ?auto_599196 ) ) ( not ( = ?auto_599191 ?auto_599197 ) ) ( not ( = ?auto_599191 ?auto_599198 ) ) ( not ( = ?auto_599192 ?auto_599193 ) ) ( not ( = ?auto_599192 ?auto_599194 ) ) ( not ( = ?auto_599192 ?auto_599195 ) ) ( not ( = ?auto_599192 ?auto_599196 ) ) ( not ( = ?auto_599192 ?auto_599197 ) ) ( not ( = ?auto_599192 ?auto_599198 ) ) ( not ( = ?auto_599193 ?auto_599194 ) ) ( not ( = ?auto_599193 ?auto_599195 ) ) ( not ( = ?auto_599193 ?auto_599196 ) ) ( not ( = ?auto_599193 ?auto_599197 ) ) ( not ( = ?auto_599193 ?auto_599198 ) ) ( not ( = ?auto_599194 ?auto_599195 ) ) ( not ( = ?auto_599194 ?auto_599196 ) ) ( not ( = ?auto_599194 ?auto_599197 ) ) ( not ( = ?auto_599194 ?auto_599198 ) ) ( not ( = ?auto_599195 ?auto_599196 ) ) ( not ( = ?auto_599195 ?auto_599197 ) ) ( not ( = ?auto_599195 ?auto_599198 ) ) ( not ( = ?auto_599196 ?auto_599197 ) ) ( not ( = ?auto_599196 ?auto_599198 ) ) ( not ( = ?auto_599197 ?auto_599198 ) ) ( ON ?auto_599196 ?auto_599197 ) ( CLEAR ?auto_599194 ) ( ON ?auto_599195 ?auto_599196 ) ( CLEAR ?auto_599195 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_599188 ?auto_599189 ?auto_599190 ?auto_599191 ?auto_599192 ?auto_599193 ?auto_599194 ?auto_599195 )
      ( MAKE-10PILE ?auto_599188 ?auto_599189 ?auto_599190 ?auto_599191 ?auto_599192 ?auto_599193 ?auto_599194 ?auto_599195 ?auto_599196 ?auto_599197 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_599230 - BLOCK
      ?auto_599231 - BLOCK
      ?auto_599232 - BLOCK
      ?auto_599233 - BLOCK
      ?auto_599234 - BLOCK
      ?auto_599235 - BLOCK
      ?auto_599236 - BLOCK
      ?auto_599237 - BLOCK
      ?auto_599238 - BLOCK
      ?auto_599239 - BLOCK
    )
    :vars
    (
      ?auto_599240 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_599239 ?auto_599240 ) ( ON-TABLE ?auto_599230 ) ( ON ?auto_599231 ?auto_599230 ) ( ON ?auto_599232 ?auto_599231 ) ( ON ?auto_599233 ?auto_599232 ) ( ON ?auto_599234 ?auto_599233 ) ( ON ?auto_599235 ?auto_599234 ) ( not ( = ?auto_599230 ?auto_599231 ) ) ( not ( = ?auto_599230 ?auto_599232 ) ) ( not ( = ?auto_599230 ?auto_599233 ) ) ( not ( = ?auto_599230 ?auto_599234 ) ) ( not ( = ?auto_599230 ?auto_599235 ) ) ( not ( = ?auto_599230 ?auto_599236 ) ) ( not ( = ?auto_599230 ?auto_599237 ) ) ( not ( = ?auto_599230 ?auto_599238 ) ) ( not ( = ?auto_599230 ?auto_599239 ) ) ( not ( = ?auto_599230 ?auto_599240 ) ) ( not ( = ?auto_599231 ?auto_599232 ) ) ( not ( = ?auto_599231 ?auto_599233 ) ) ( not ( = ?auto_599231 ?auto_599234 ) ) ( not ( = ?auto_599231 ?auto_599235 ) ) ( not ( = ?auto_599231 ?auto_599236 ) ) ( not ( = ?auto_599231 ?auto_599237 ) ) ( not ( = ?auto_599231 ?auto_599238 ) ) ( not ( = ?auto_599231 ?auto_599239 ) ) ( not ( = ?auto_599231 ?auto_599240 ) ) ( not ( = ?auto_599232 ?auto_599233 ) ) ( not ( = ?auto_599232 ?auto_599234 ) ) ( not ( = ?auto_599232 ?auto_599235 ) ) ( not ( = ?auto_599232 ?auto_599236 ) ) ( not ( = ?auto_599232 ?auto_599237 ) ) ( not ( = ?auto_599232 ?auto_599238 ) ) ( not ( = ?auto_599232 ?auto_599239 ) ) ( not ( = ?auto_599232 ?auto_599240 ) ) ( not ( = ?auto_599233 ?auto_599234 ) ) ( not ( = ?auto_599233 ?auto_599235 ) ) ( not ( = ?auto_599233 ?auto_599236 ) ) ( not ( = ?auto_599233 ?auto_599237 ) ) ( not ( = ?auto_599233 ?auto_599238 ) ) ( not ( = ?auto_599233 ?auto_599239 ) ) ( not ( = ?auto_599233 ?auto_599240 ) ) ( not ( = ?auto_599234 ?auto_599235 ) ) ( not ( = ?auto_599234 ?auto_599236 ) ) ( not ( = ?auto_599234 ?auto_599237 ) ) ( not ( = ?auto_599234 ?auto_599238 ) ) ( not ( = ?auto_599234 ?auto_599239 ) ) ( not ( = ?auto_599234 ?auto_599240 ) ) ( not ( = ?auto_599235 ?auto_599236 ) ) ( not ( = ?auto_599235 ?auto_599237 ) ) ( not ( = ?auto_599235 ?auto_599238 ) ) ( not ( = ?auto_599235 ?auto_599239 ) ) ( not ( = ?auto_599235 ?auto_599240 ) ) ( not ( = ?auto_599236 ?auto_599237 ) ) ( not ( = ?auto_599236 ?auto_599238 ) ) ( not ( = ?auto_599236 ?auto_599239 ) ) ( not ( = ?auto_599236 ?auto_599240 ) ) ( not ( = ?auto_599237 ?auto_599238 ) ) ( not ( = ?auto_599237 ?auto_599239 ) ) ( not ( = ?auto_599237 ?auto_599240 ) ) ( not ( = ?auto_599238 ?auto_599239 ) ) ( not ( = ?auto_599238 ?auto_599240 ) ) ( not ( = ?auto_599239 ?auto_599240 ) ) ( ON ?auto_599238 ?auto_599239 ) ( ON ?auto_599237 ?auto_599238 ) ( CLEAR ?auto_599235 ) ( ON ?auto_599236 ?auto_599237 ) ( CLEAR ?auto_599236 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_599230 ?auto_599231 ?auto_599232 ?auto_599233 ?auto_599234 ?auto_599235 ?auto_599236 )
      ( MAKE-10PILE ?auto_599230 ?auto_599231 ?auto_599232 ?auto_599233 ?auto_599234 ?auto_599235 ?auto_599236 ?auto_599237 ?auto_599238 ?auto_599239 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_599272 - BLOCK
      ?auto_599273 - BLOCK
      ?auto_599274 - BLOCK
      ?auto_599275 - BLOCK
      ?auto_599276 - BLOCK
      ?auto_599277 - BLOCK
      ?auto_599278 - BLOCK
      ?auto_599279 - BLOCK
      ?auto_599280 - BLOCK
      ?auto_599281 - BLOCK
    )
    :vars
    (
      ?auto_599282 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_599281 ?auto_599282 ) ( ON-TABLE ?auto_599272 ) ( ON ?auto_599273 ?auto_599272 ) ( ON ?auto_599274 ?auto_599273 ) ( ON ?auto_599275 ?auto_599274 ) ( ON ?auto_599276 ?auto_599275 ) ( not ( = ?auto_599272 ?auto_599273 ) ) ( not ( = ?auto_599272 ?auto_599274 ) ) ( not ( = ?auto_599272 ?auto_599275 ) ) ( not ( = ?auto_599272 ?auto_599276 ) ) ( not ( = ?auto_599272 ?auto_599277 ) ) ( not ( = ?auto_599272 ?auto_599278 ) ) ( not ( = ?auto_599272 ?auto_599279 ) ) ( not ( = ?auto_599272 ?auto_599280 ) ) ( not ( = ?auto_599272 ?auto_599281 ) ) ( not ( = ?auto_599272 ?auto_599282 ) ) ( not ( = ?auto_599273 ?auto_599274 ) ) ( not ( = ?auto_599273 ?auto_599275 ) ) ( not ( = ?auto_599273 ?auto_599276 ) ) ( not ( = ?auto_599273 ?auto_599277 ) ) ( not ( = ?auto_599273 ?auto_599278 ) ) ( not ( = ?auto_599273 ?auto_599279 ) ) ( not ( = ?auto_599273 ?auto_599280 ) ) ( not ( = ?auto_599273 ?auto_599281 ) ) ( not ( = ?auto_599273 ?auto_599282 ) ) ( not ( = ?auto_599274 ?auto_599275 ) ) ( not ( = ?auto_599274 ?auto_599276 ) ) ( not ( = ?auto_599274 ?auto_599277 ) ) ( not ( = ?auto_599274 ?auto_599278 ) ) ( not ( = ?auto_599274 ?auto_599279 ) ) ( not ( = ?auto_599274 ?auto_599280 ) ) ( not ( = ?auto_599274 ?auto_599281 ) ) ( not ( = ?auto_599274 ?auto_599282 ) ) ( not ( = ?auto_599275 ?auto_599276 ) ) ( not ( = ?auto_599275 ?auto_599277 ) ) ( not ( = ?auto_599275 ?auto_599278 ) ) ( not ( = ?auto_599275 ?auto_599279 ) ) ( not ( = ?auto_599275 ?auto_599280 ) ) ( not ( = ?auto_599275 ?auto_599281 ) ) ( not ( = ?auto_599275 ?auto_599282 ) ) ( not ( = ?auto_599276 ?auto_599277 ) ) ( not ( = ?auto_599276 ?auto_599278 ) ) ( not ( = ?auto_599276 ?auto_599279 ) ) ( not ( = ?auto_599276 ?auto_599280 ) ) ( not ( = ?auto_599276 ?auto_599281 ) ) ( not ( = ?auto_599276 ?auto_599282 ) ) ( not ( = ?auto_599277 ?auto_599278 ) ) ( not ( = ?auto_599277 ?auto_599279 ) ) ( not ( = ?auto_599277 ?auto_599280 ) ) ( not ( = ?auto_599277 ?auto_599281 ) ) ( not ( = ?auto_599277 ?auto_599282 ) ) ( not ( = ?auto_599278 ?auto_599279 ) ) ( not ( = ?auto_599278 ?auto_599280 ) ) ( not ( = ?auto_599278 ?auto_599281 ) ) ( not ( = ?auto_599278 ?auto_599282 ) ) ( not ( = ?auto_599279 ?auto_599280 ) ) ( not ( = ?auto_599279 ?auto_599281 ) ) ( not ( = ?auto_599279 ?auto_599282 ) ) ( not ( = ?auto_599280 ?auto_599281 ) ) ( not ( = ?auto_599280 ?auto_599282 ) ) ( not ( = ?auto_599281 ?auto_599282 ) ) ( ON ?auto_599280 ?auto_599281 ) ( ON ?auto_599279 ?auto_599280 ) ( ON ?auto_599278 ?auto_599279 ) ( CLEAR ?auto_599276 ) ( ON ?auto_599277 ?auto_599278 ) ( CLEAR ?auto_599277 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_599272 ?auto_599273 ?auto_599274 ?auto_599275 ?auto_599276 ?auto_599277 )
      ( MAKE-10PILE ?auto_599272 ?auto_599273 ?auto_599274 ?auto_599275 ?auto_599276 ?auto_599277 ?auto_599278 ?auto_599279 ?auto_599280 ?auto_599281 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_599314 - BLOCK
      ?auto_599315 - BLOCK
      ?auto_599316 - BLOCK
      ?auto_599317 - BLOCK
      ?auto_599318 - BLOCK
      ?auto_599319 - BLOCK
      ?auto_599320 - BLOCK
      ?auto_599321 - BLOCK
      ?auto_599322 - BLOCK
      ?auto_599323 - BLOCK
    )
    :vars
    (
      ?auto_599324 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_599323 ?auto_599324 ) ( ON-TABLE ?auto_599314 ) ( ON ?auto_599315 ?auto_599314 ) ( ON ?auto_599316 ?auto_599315 ) ( ON ?auto_599317 ?auto_599316 ) ( not ( = ?auto_599314 ?auto_599315 ) ) ( not ( = ?auto_599314 ?auto_599316 ) ) ( not ( = ?auto_599314 ?auto_599317 ) ) ( not ( = ?auto_599314 ?auto_599318 ) ) ( not ( = ?auto_599314 ?auto_599319 ) ) ( not ( = ?auto_599314 ?auto_599320 ) ) ( not ( = ?auto_599314 ?auto_599321 ) ) ( not ( = ?auto_599314 ?auto_599322 ) ) ( not ( = ?auto_599314 ?auto_599323 ) ) ( not ( = ?auto_599314 ?auto_599324 ) ) ( not ( = ?auto_599315 ?auto_599316 ) ) ( not ( = ?auto_599315 ?auto_599317 ) ) ( not ( = ?auto_599315 ?auto_599318 ) ) ( not ( = ?auto_599315 ?auto_599319 ) ) ( not ( = ?auto_599315 ?auto_599320 ) ) ( not ( = ?auto_599315 ?auto_599321 ) ) ( not ( = ?auto_599315 ?auto_599322 ) ) ( not ( = ?auto_599315 ?auto_599323 ) ) ( not ( = ?auto_599315 ?auto_599324 ) ) ( not ( = ?auto_599316 ?auto_599317 ) ) ( not ( = ?auto_599316 ?auto_599318 ) ) ( not ( = ?auto_599316 ?auto_599319 ) ) ( not ( = ?auto_599316 ?auto_599320 ) ) ( not ( = ?auto_599316 ?auto_599321 ) ) ( not ( = ?auto_599316 ?auto_599322 ) ) ( not ( = ?auto_599316 ?auto_599323 ) ) ( not ( = ?auto_599316 ?auto_599324 ) ) ( not ( = ?auto_599317 ?auto_599318 ) ) ( not ( = ?auto_599317 ?auto_599319 ) ) ( not ( = ?auto_599317 ?auto_599320 ) ) ( not ( = ?auto_599317 ?auto_599321 ) ) ( not ( = ?auto_599317 ?auto_599322 ) ) ( not ( = ?auto_599317 ?auto_599323 ) ) ( not ( = ?auto_599317 ?auto_599324 ) ) ( not ( = ?auto_599318 ?auto_599319 ) ) ( not ( = ?auto_599318 ?auto_599320 ) ) ( not ( = ?auto_599318 ?auto_599321 ) ) ( not ( = ?auto_599318 ?auto_599322 ) ) ( not ( = ?auto_599318 ?auto_599323 ) ) ( not ( = ?auto_599318 ?auto_599324 ) ) ( not ( = ?auto_599319 ?auto_599320 ) ) ( not ( = ?auto_599319 ?auto_599321 ) ) ( not ( = ?auto_599319 ?auto_599322 ) ) ( not ( = ?auto_599319 ?auto_599323 ) ) ( not ( = ?auto_599319 ?auto_599324 ) ) ( not ( = ?auto_599320 ?auto_599321 ) ) ( not ( = ?auto_599320 ?auto_599322 ) ) ( not ( = ?auto_599320 ?auto_599323 ) ) ( not ( = ?auto_599320 ?auto_599324 ) ) ( not ( = ?auto_599321 ?auto_599322 ) ) ( not ( = ?auto_599321 ?auto_599323 ) ) ( not ( = ?auto_599321 ?auto_599324 ) ) ( not ( = ?auto_599322 ?auto_599323 ) ) ( not ( = ?auto_599322 ?auto_599324 ) ) ( not ( = ?auto_599323 ?auto_599324 ) ) ( ON ?auto_599322 ?auto_599323 ) ( ON ?auto_599321 ?auto_599322 ) ( ON ?auto_599320 ?auto_599321 ) ( ON ?auto_599319 ?auto_599320 ) ( CLEAR ?auto_599317 ) ( ON ?auto_599318 ?auto_599319 ) ( CLEAR ?auto_599318 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_599314 ?auto_599315 ?auto_599316 ?auto_599317 ?auto_599318 )
      ( MAKE-10PILE ?auto_599314 ?auto_599315 ?auto_599316 ?auto_599317 ?auto_599318 ?auto_599319 ?auto_599320 ?auto_599321 ?auto_599322 ?auto_599323 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_599356 - BLOCK
      ?auto_599357 - BLOCK
      ?auto_599358 - BLOCK
      ?auto_599359 - BLOCK
      ?auto_599360 - BLOCK
      ?auto_599361 - BLOCK
      ?auto_599362 - BLOCK
      ?auto_599363 - BLOCK
      ?auto_599364 - BLOCK
      ?auto_599365 - BLOCK
    )
    :vars
    (
      ?auto_599366 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_599365 ?auto_599366 ) ( ON-TABLE ?auto_599356 ) ( ON ?auto_599357 ?auto_599356 ) ( ON ?auto_599358 ?auto_599357 ) ( not ( = ?auto_599356 ?auto_599357 ) ) ( not ( = ?auto_599356 ?auto_599358 ) ) ( not ( = ?auto_599356 ?auto_599359 ) ) ( not ( = ?auto_599356 ?auto_599360 ) ) ( not ( = ?auto_599356 ?auto_599361 ) ) ( not ( = ?auto_599356 ?auto_599362 ) ) ( not ( = ?auto_599356 ?auto_599363 ) ) ( not ( = ?auto_599356 ?auto_599364 ) ) ( not ( = ?auto_599356 ?auto_599365 ) ) ( not ( = ?auto_599356 ?auto_599366 ) ) ( not ( = ?auto_599357 ?auto_599358 ) ) ( not ( = ?auto_599357 ?auto_599359 ) ) ( not ( = ?auto_599357 ?auto_599360 ) ) ( not ( = ?auto_599357 ?auto_599361 ) ) ( not ( = ?auto_599357 ?auto_599362 ) ) ( not ( = ?auto_599357 ?auto_599363 ) ) ( not ( = ?auto_599357 ?auto_599364 ) ) ( not ( = ?auto_599357 ?auto_599365 ) ) ( not ( = ?auto_599357 ?auto_599366 ) ) ( not ( = ?auto_599358 ?auto_599359 ) ) ( not ( = ?auto_599358 ?auto_599360 ) ) ( not ( = ?auto_599358 ?auto_599361 ) ) ( not ( = ?auto_599358 ?auto_599362 ) ) ( not ( = ?auto_599358 ?auto_599363 ) ) ( not ( = ?auto_599358 ?auto_599364 ) ) ( not ( = ?auto_599358 ?auto_599365 ) ) ( not ( = ?auto_599358 ?auto_599366 ) ) ( not ( = ?auto_599359 ?auto_599360 ) ) ( not ( = ?auto_599359 ?auto_599361 ) ) ( not ( = ?auto_599359 ?auto_599362 ) ) ( not ( = ?auto_599359 ?auto_599363 ) ) ( not ( = ?auto_599359 ?auto_599364 ) ) ( not ( = ?auto_599359 ?auto_599365 ) ) ( not ( = ?auto_599359 ?auto_599366 ) ) ( not ( = ?auto_599360 ?auto_599361 ) ) ( not ( = ?auto_599360 ?auto_599362 ) ) ( not ( = ?auto_599360 ?auto_599363 ) ) ( not ( = ?auto_599360 ?auto_599364 ) ) ( not ( = ?auto_599360 ?auto_599365 ) ) ( not ( = ?auto_599360 ?auto_599366 ) ) ( not ( = ?auto_599361 ?auto_599362 ) ) ( not ( = ?auto_599361 ?auto_599363 ) ) ( not ( = ?auto_599361 ?auto_599364 ) ) ( not ( = ?auto_599361 ?auto_599365 ) ) ( not ( = ?auto_599361 ?auto_599366 ) ) ( not ( = ?auto_599362 ?auto_599363 ) ) ( not ( = ?auto_599362 ?auto_599364 ) ) ( not ( = ?auto_599362 ?auto_599365 ) ) ( not ( = ?auto_599362 ?auto_599366 ) ) ( not ( = ?auto_599363 ?auto_599364 ) ) ( not ( = ?auto_599363 ?auto_599365 ) ) ( not ( = ?auto_599363 ?auto_599366 ) ) ( not ( = ?auto_599364 ?auto_599365 ) ) ( not ( = ?auto_599364 ?auto_599366 ) ) ( not ( = ?auto_599365 ?auto_599366 ) ) ( ON ?auto_599364 ?auto_599365 ) ( ON ?auto_599363 ?auto_599364 ) ( ON ?auto_599362 ?auto_599363 ) ( ON ?auto_599361 ?auto_599362 ) ( ON ?auto_599360 ?auto_599361 ) ( CLEAR ?auto_599358 ) ( ON ?auto_599359 ?auto_599360 ) ( CLEAR ?auto_599359 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_599356 ?auto_599357 ?auto_599358 ?auto_599359 )
      ( MAKE-10PILE ?auto_599356 ?auto_599357 ?auto_599358 ?auto_599359 ?auto_599360 ?auto_599361 ?auto_599362 ?auto_599363 ?auto_599364 ?auto_599365 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_599398 - BLOCK
      ?auto_599399 - BLOCK
      ?auto_599400 - BLOCK
      ?auto_599401 - BLOCK
      ?auto_599402 - BLOCK
      ?auto_599403 - BLOCK
      ?auto_599404 - BLOCK
      ?auto_599405 - BLOCK
      ?auto_599406 - BLOCK
      ?auto_599407 - BLOCK
    )
    :vars
    (
      ?auto_599408 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_599407 ?auto_599408 ) ( ON-TABLE ?auto_599398 ) ( ON ?auto_599399 ?auto_599398 ) ( not ( = ?auto_599398 ?auto_599399 ) ) ( not ( = ?auto_599398 ?auto_599400 ) ) ( not ( = ?auto_599398 ?auto_599401 ) ) ( not ( = ?auto_599398 ?auto_599402 ) ) ( not ( = ?auto_599398 ?auto_599403 ) ) ( not ( = ?auto_599398 ?auto_599404 ) ) ( not ( = ?auto_599398 ?auto_599405 ) ) ( not ( = ?auto_599398 ?auto_599406 ) ) ( not ( = ?auto_599398 ?auto_599407 ) ) ( not ( = ?auto_599398 ?auto_599408 ) ) ( not ( = ?auto_599399 ?auto_599400 ) ) ( not ( = ?auto_599399 ?auto_599401 ) ) ( not ( = ?auto_599399 ?auto_599402 ) ) ( not ( = ?auto_599399 ?auto_599403 ) ) ( not ( = ?auto_599399 ?auto_599404 ) ) ( not ( = ?auto_599399 ?auto_599405 ) ) ( not ( = ?auto_599399 ?auto_599406 ) ) ( not ( = ?auto_599399 ?auto_599407 ) ) ( not ( = ?auto_599399 ?auto_599408 ) ) ( not ( = ?auto_599400 ?auto_599401 ) ) ( not ( = ?auto_599400 ?auto_599402 ) ) ( not ( = ?auto_599400 ?auto_599403 ) ) ( not ( = ?auto_599400 ?auto_599404 ) ) ( not ( = ?auto_599400 ?auto_599405 ) ) ( not ( = ?auto_599400 ?auto_599406 ) ) ( not ( = ?auto_599400 ?auto_599407 ) ) ( not ( = ?auto_599400 ?auto_599408 ) ) ( not ( = ?auto_599401 ?auto_599402 ) ) ( not ( = ?auto_599401 ?auto_599403 ) ) ( not ( = ?auto_599401 ?auto_599404 ) ) ( not ( = ?auto_599401 ?auto_599405 ) ) ( not ( = ?auto_599401 ?auto_599406 ) ) ( not ( = ?auto_599401 ?auto_599407 ) ) ( not ( = ?auto_599401 ?auto_599408 ) ) ( not ( = ?auto_599402 ?auto_599403 ) ) ( not ( = ?auto_599402 ?auto_599404 ) ) ( not ( = ?auto_599402 ?auto_599405 ) ) ( not ( = ?auto_599402 ?auto_599406 ) ) ( not ( = ?auto_599402 ?auto_599407 ) ) ( not ( = ?auto_599402 ?auto_599408 ) ) ( not ( = ?auto_599403 ?auto_599404 ) ) ( not ( = ?auto_599403 ?auto_599405 ) ) ( not ( = ?auto_599403 ?auto_599406 ) ) ( not ( = ?auto_599403 ?auto_599407 ) ) ( not ( = ?auto_599403 ?auto_599408 ) ) ( not ( = ?auto_599404 ?auto_599405 ) ) ( not ( = ?auto_599404 ?auto_599406 ) ) ( not ( = ?auto_599404 ?auto_599407 ) ) ( not ( = ?auto_599404 ?auto_599408 ) ) ( not ( = ?auto_599405 ?auto_599406 ) ) ( not ( = ?auto_599405 ?auto_599407 ) ) ( not ( = ?auto_599405 ?auto_599408 ) ) ( not ( = ?auto_599406 ?auto_599407 ) ) ( not ( = ?auto_599406 ?auto_599408 ) ) ( not ( = ?auto_599407 ?auto_599408 ) ) ( ON ?auto_599406 ?auto_599407 ) ( ON ?auto_599405 ?auto_599406 ) ( ON ?auto_599404 ?auto_599405 ) ( ON ?auto_599403 ?auto_599404 ) ( ON ?auto_599402 ?auto_599403 ) ( ON ?auto_599401 ?auto_599402 ) ( CLEAR ?auto_599399 ) ( ON ?auto_599400 ?auto_599401 ) ( CLEAR ?auto_599400 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_599398 ?auto_599399 ?auto_599400 )
      ( MAKE-10PILE ?auto_599398 ?auto_599399 ?auto_599400 ?auto_599401 ?auto_599402 ?auto_599403 ?auto_599404 ?auto_599405 ?auto_599406 ?auto_599407 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_599440 - BLOCK
      ?auto_599441 - BLOCK
      ?auto_599442 - BLOCK
      ?auto_599443 - BLOCK
      ?auto_599444 - BLOCK
      ?auto_599445 - BLOCK
      ?auto_599446 - BLOCK
      ?auto_599447 - BLOCK
      ?auto_599448 - BLOCK
      ?auto_599449 - BLOCK
    )
    :vars
    (
      ?auto_599450 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_599449 ?auto_599450 ) ( ON-TABLE ?auto_599440 ) ( not ( = ?auto_599440 ?auto_599441 ) ) ( not ( = ?auto_599440 ?auto_599442 ) ) ( not ( = ?auto_599440 ?auto_599443 ) ) ( not ( = ?auto_599440 ?auto_599444 ) ) ( not ( = ?auto_599440 ?auto_599445 ) ) ( not ( = ?auto_599440 ?auto_599446 ) ) ( not ( = ?auto_599440 ?auto_599447 ) ) ( not ( = ?auto_599440 ?auto_599448 ) ) ( not ( = ?auto_599440 ?auto_599449 ) ) ( not ( = ?auto_599440 ?auto_599450 ) ) ( not ( = ?auto_599441 ?auto_599442 ) ) ( not ( = ?auto_599441 ?auto_599443 ) ) ( not ( = ?auto_599441 ?auto_599444 ) ) ( not ( = ?auto_599441 ?auto_599445 ) ) ( not ( = ?auto_599441 ?auto_599446 ) ) ( not ( = ?auto_599441 ?auto_599447 ) ) ( not ( = ?auto_599441 ?auto_599448 ) ) ( not ( = ?auto_599441 ?auto_599449 ) ) ( not ( = ?auto_599441 ?auto_599450 ) ) ( not ( = ?auto_599442 ?auto_599443 ) ) ( not ( = ?auto_599442 ?auto_599444 ) ) ( not ( = ?auto_599442 ?auto_599445 ) ) ( not ( = ?auto_599442 ?auto_599446 ) ) ( not ( = ?auto_599442 ?auto_599447 ) ) ( not ( = ?auto_599442 ?auto_599448 ) ) ( not ( = ?auto_599442 ?auto_599449 ) ) ( not ( = ?auto_599442 ?auto_599450 ) ) ( not ( = ?auto_599443 ?auto_599444 ) ) ( not ( = ?auto_599443 ?auto_599445 ) ) ( not ( = ?auto_599443 ?auto_599446 ) ) ( not ( = ?auto_599443 ?auto_599447 ) ) ( not ( = ?auto_599443 ?auto_599448 ) ) ( not ( = ?auto_599443 ?auto_599449 ) ) ( not ( = ?auto_599443 ?auto_599450 ) ) ( not ( = ?auto_599444 ?auto_599445 ) ) ( not ( = ?auto_599444 ?auto_599446 ) ) ( not ( = ?auto_599444 ?auto_599447 ) ) ( not ( = ?auto_599444 ?auto_599448 ) ) ( not ( = ?auto_599444 ?auto_599449 ) ) ( not ( = ?auto_599444 ?auto_599450 ) ) ( not ( = ?auto_599445 ?auto_599446 ) ) ( not ( = ?auto_599445 ?auto_599447 ) ) ( not ( = ?auto_599445 ?auto_599448 ) ) ( not ( = ?auto_599445 ?auto_599449 ) ) ( not ( = ?auto_599445 ?auto_599450 ) ) ( not ( = ?auto_599446 ?auto_599447 ) ) ( not ( = ?auto_599446 ?auto_599448 ) ) ( not ( = ?auto_599446 ?auto_599449 ) ) ( not ( = ?auto_599446 ?auto_599450 ) ) ( not ( = ?auto_599447 ?auto_599448 ) ) ( not ( = ?auto_599447 ?auto_599449 ) ) ( not ( = ?auto_599447 ?auto_599450 ) ) ( not ( = ?auto_599448 ?auto_599449 ) ) ( not ( = ?auto_599448 ?auto_599450 ) ) ( not ( = ?auto_599449 ?auto_599450 ) ) ( ON ?auto_599448 ?auto_599449 ) ( ON ?auto_599447 ?auto_599448 ) ( ON ?auto_599446 ?auto_599447 ) ( ON ?auto_599445 ?auto_599446 ) ( ON ?auto_599444 ?auto_599445 ) ( ON ?auto_599443 ?auto_599444 ) ( ON ?auto_599442 ?auto_599443 ) ( CLEAR ?auto_599440 ) ( ON ?auto_599441 ?auto_599442 ) ( CLEAR ?auto_599441 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_599440 ?auto_599441 )
      ( MAKE-10PILE ?auto_599440 ?auto_599441 ?auto_599442 ?auto_599443 ?auto_599444 ?auto_599445 ?auto_599446 ?auto_599447 ?auto_599448 ?auto_599449 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_599482 - BLOCK
      ?auto_599483 - BLOCK
      ?auto_599484 - BLOCK
      ?auto_599485 - BLOCK
      ?auto_599486 - BLOCK
      ?auto_599487 - BLOCK
      ?auto_599488 - BLOCK
      ?auto_599489 - BLOCK
      ?auto_599490 - BLOCK
      ?auto_599491 - BLOCK
    )
    :vars
    (
      ?auto_599492 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_599491 ?auto_599492 ) ( not ( = ?auto_599482 ?auto_599483 ) ) ( not ( = ?auto_599482 ?auto_599484 ) ) ( not ( = ?auto_599482 ?auto_599485 ) ) ( not ( = ?auto_599482 ?auto_599486 ) ) ( not ( = ?auto_599482 ?auto_599487 ) ) ( not ( = ?auto_599482 ?auto_599488 ) ) ( not ( = ?auto_599482 ?auto_599489 ) ) ( not ( = ?auto_599482 ?auto_599490 ) ) ( not ( = ?auto_599482 ?auto_599491 ) ) ( not ( = ?auto_599482 ?auto_599492 ) ) ( not ( = ?auto_599483 ?auto_599484 ) ) ( not ( = ?auto_599483 ?auto_599485 ) ) ( not ( = ?auto_599483 ?auto_599486 ) ) ( not ( = ?auto_599483 ?auto_599487 ) ) ( not ( = ?auto_599483 ?auto_599488 ) ) ( not ( = ?auto_599483 ?auto_599489 ) ) ( not ( = ?auto_599483 ?auto_599490 ) ) ( not ( = ?auto_599483 ?auto_599491 ) ) ( not ( = ?auto_599483 ?auto_599492 ) ) ( not ( = ?auto_599484 ?auto_599485 ) ) ( not ( = ?auto_599484 ?auto_599486 ) ) ( not ( = ?auto_599484 ?auto_599487 ) ) ( not ( = ?auto_599484 ?auto_599488 ) ) ( not ( = ?auto_599484 ?auto_599489 ) ) ( not ( = ?auto_599484 ?auto_599490 ) ) ( not ( = ?auto_599484 ?auto_599491 ) ) ( not ( = ?auto_599484 ?auto_599492 ) ) ( not ( = ?auto_599485 ?auto_599486 ) ) ( not ( = ?auto_599485 ?auto_599487 ) ) ( not ( = ?auto_599485 ?auto_599488 ) ) ( not ( = ?auto_599485 ?auto_599489 ) ) ( not ( = ?auto_599485 ?auto_599490 ) ) ( not ( = ?auto_599485 ?auto_599491 ) ) ( not ( = ?auto_599485 ?auto_599492 ) ) ( not ( = ?auto_599486 ?auto_599487 ) ) ( not ( = ?auto_599486 ?auto_599488 ) ) ( not ( = ?auto_599486 ?auto_599489 ) ) ( not ( = ?auto_599486 ?auto_599490 ) ) ( not ( = ?auto_599486 ?auto_599491 ) ) ( not ( = ?auto_599486 ?auto_599492 ) ) ( not ( = ?auto_599487 ?auto_599488 ) ) ( not ( = ?auto_599487 ?auto_599489 ) ) ( not ( = ?auto_599487 ?auto_599490 ) ) ( not ( = ?auto_599487 ?auto_599491 ) ) ( not ( = ?auto_599487 ?auto_599492 ) ) ( not ( = ?auto_599488 ?auto_599489 ) ) ( not ( = ?auto_599488 ?auto_599490 ) ) ( not ( = ?auto_599488 ?auto_599491 ) ) ( not ( = ?auto_599488 ?auto_599492 ) ) ( not ( = ?auto_599489 ?auto_599490 ) ) ( not ( = ?auto_599489 ?auto_599491 ) ) ( not ( = ?auto_599489 ?auto_599492 ) ) ( not ( = ?auto_599490 ?auto_599491 ) ) ( not ( = ?auto_599490 ?auto_599492 ) ) ( not ( = ?auto_599491 ?auto_599492 ) ) ( ON ?auto_599490 ?auto_599491 ) ( ON ?auto_599489 ?auto_599490 ) ( ON ?auto_599488 ?auto_599489 ) ( ON ?auto_599487 ?auto_599488 ) ( ON ?auto_599486 ?auto_599487 ) ( ON ?auto_599485 ?auto_599486 ) ( ON ?auto_599484 ?auto_599485 ) ( ON ?auto_599483 ?auto_599484 ) ( ON ?auto_599482 ?auto_599483 ) ( CLEAR ?auto_599482 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_599482 )
      ( MAKE-10PILE ?auto_599482 ?auto_599483 ?auto_599484 ?auto_599485 ?auto_599486 ?auto_599487 ?auto_599488 ?auto_599489 ?auto_599490 ?auto_599491 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_599525 - BLOCK
      ?auto_599526 - BLOCK
      ?auto_599527 - BLOCK
      ?auto_599528 - BLOCK
      ?auto_599529 - BLOCK
      ?auto_599530 - BLOCK
      ?auto_599531 - BLOCK
      ?auto_599532 - BLOCK
      ?auto_599533 - BLOCK
      ?auto_599534 - BLOCK
      ?auto_599535 - BLOCK
    )
    :vars
    (
      ?auto_599536 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_599534 ) ( ON ?auto_599535 ?auto_599536 ) ( CLEAR ?auto_599535 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_599525 ) ( ON ?auto_599526 ?auto_599525 ) ( ON ?auto_599527 ?auto_599526 ) ( ON ?auto_599528 ?auto_599527 ) ( ON ?auto_599529 ?auto_599528 ) ( ON ?auto_599530 ?auto_599529 ) ( ON ?auto_599531 ?auto_599530 ) ( ON ?auto_599532 ?auto_599531 ) ( ON ?auto_599533 ?auto_599532 ) ( ON ?auto_599534 ?auto_599533 ) ( not ( = ?auto_599525 ?auto_599526 ) ) ( not ( = ?auto_599525 ?auto_599527 ) ) ( not ( = ?auto_599525 ?auto_599528 ) ) ( not ( = ?auto_599525 ?auto_599529 ) ) ( not ( = ?auto_599525 ?auto_599530 ) ) ( not ( = ?auto_599525 ?auto_599531 ) ) ( not ( = ?auto_599525 ?auto_599532 ) ) ( not ( = ?auto_599525 ?auto_599533 ) ) ( not ( = ?auto_599525 ?auto_599534 ) ) ( not ( = ?auto_599525 ?auto_599535 ) ) ( not ( = ?auto_599525 ?auto_599536 ) ) ( not ( = ?auto_599526 ?auto_599527 ) ) ( not ( = ?auto_599526 ?auto_599528 ) ) ( not ( = ?auto_599526 ?auto_599529 ) ) ( not ( = ?auto_599526 ?auto_599530 ) ) ( not ( = ?auto_599526 ?auto_599531 ) ) ( not ( = ?auto_599526 ?auto_599532 ) ) ( not ( = ?auto_599526 ?auto_599533 ) ) ( not ( = ?auto_599526 ?auto_599534 ) ) ( not ( = ?auto_599526 ?auto_599535 ) ) ( not ( = ?auto_599526 ?auto_599536 ) ) ( not ( = ?auto_599527 ?auto_599528 ) ) ( not ( = ?auto_599527 ?auto_599529 ) ) ( not ( = ?auto_599527 ?auto_599530 ) ) ( not ( = ?auto_599527 ?auto_599531 ) ) ( not ( = ?auto_599527 ?auto_599532 ) ) ( not ( = ?auto_599527 ?auto_599533 ) ) ( not ( = ?auto_599527 ?auto_599534 ) ) ( not ( = ?auto_599527 ?auto_599535 ) ) ( not ( = ?auto_599527 ?auto_599536 ) ) ( not ( = ?auto_599528 ?auto_599529 ) ) ( not ( = ?auto_599528 ?auto_599530 ) ) ( not ( = ?auto_599528 ?auto_599531 ) ) ( not ( = ?auto_599528 ?auto_599532 ) ) ( not ( = ?auto_599528 ?auto_599533 ) ) ( not ( = ?auto_599528 ?auto_599534 ) ) ( not ( = ?auto_599528 ?auto_599535 ) ) ( not ( = ?auto_599528 ?auto_599536 ) ) ( not ( = ?auto_599529 ?auto_599530 ) ) ( not ( = ?auto_599529 ?auto_599531 ) ) ( not ( = ?auto_599529 ?auto_599532 ) ) ( not ( = ?auto_599529 ?auto_599533 ) ) ( not ( = ?auto_599529 ?auto_599534 ) ) ( not ( = ?auto_599529 ?auto_599535 ) ) ( not ( = ?auto_599529 ?auto_599536 ) ) ( not ( = ?auto_599530 ?auto_599531 ) ) ( not ( = ?auto_599530 ?auto_599532 ) ) ( not ( = ?auto_599530 ?auto_599533 ) ) ( not ( = ?auto_599530 ?auto_599534 ) ) ( not ( = ?auto_599530 ?auto_599535 ) ) ( not ( = ?auto_599530 ?auto_599536 ) ) ( not ( = ?auto_599531 ?auto_599532 ) ) ( not ( = ?auto_599531 ?auto_599533 ) ) ( not ( = ?auto_599531 ?auto_599534 ) ) ( not ( = ?auto_599531 ?auto_599535 ) ) ( not ( = ?auto_599531 ?auto_599536 ) ) ( not ( = ?auto_599532 ?auto_599533 ) ) ( not ( = ?auto_599532 ?auto_599534 ) ) ( not ( = ?auto_599532 ?auto_599535 ) ) ( not ( = ?auto_599532 ?auto_599536 ) ) ( not ( = ?auto_599533 ?auto_599534 ) ) ( not ( = ?auto_599533 ?auto_599535 ) ) ( not ( = ?auto_599533 ?auto_599536 ) ) ( not ( = ?auto_599534 ?auto_599535 ) ) ( not ( = ?auto_599534 ?auto_599536 ) ) ( not ( = ?auto_599535 ?auto_599536 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_599535 ?auto_599536 )
      ( !STACK ?auto_599535 ?auto_599534 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_599571 - BLOCK
      ?auto_599572 - BLOCK
      ?auto_599573 - BLOCK
      ?auto_599574 - BLOCK
      ?auto_599575 - BLOCK
      ?auto_599576 - BLOCK
      ?auto_599577 - BLOCK
      ?auto_599578 - BLOCK
      ?auto_599579 - BLOCK
      ?auto_599580 - BLOCK
      ?auto_599581 - BLOCK
    )
    :vars
    (
      ?auto_599582 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_599581 ?auto_599582 ) ( ON-TABLE ?auto_599571 ) ( ON ?auto_599572 ?auto_599571 ) ( ON ?auto_599573 ?auto_599572 ) ( ON ?auto_599574 ?auto_599573 ) ( ON ?auto_599575 ?auto_599574 ) ( ON ?auto_599576 ?auto_599575 ) ( ON ?auto_599577 ?auto_599576 ) ( ON ?auto_599578 ?auto_599577 ) ( ON ?auto_599579 ?auto_599578 ) ( not ( = ?auto_599571 ?auto_599572 ) ) ( not ( = ?auto_599571 ?auto_599573 ) ) ( not ( = ?auto_599571 ?auto_599574 ) ) ( not ( = ?auto_599571 ?auto_599575 ) ) ( not ( = ?auto_599571 ?auto_599576 ) ) ( not ( = ?auto_599571 ?auto_599577 ) ) ( not ( = ?auto_599571 ?auto_599578 ) ) ( not ( = ?auto_599571 ?auto_599579 ) ) ( not ( = ?auto_599571 ?auto_599580 ) ) ( not ( = ?auto_599571 ?auto_599581 ) ) ( not ( = ?auto_599571 ?auto_599582 ) ) ( not ( = ?auto_599572 ?auto_599573 ) ) ( not ( = ?auto_599572 ?auto_599574 ) ) ( not ( = ?auto_599572 ?auto_599575 ) ) ( not ( = ?auto_599572 ?auto_599576 ) ) ( not ( = ?auto_599572 ?auto_599577 ) ) ( not ( = ?auto_599572 ?auto_599578 ) ) ( not ( = ?auto_599572 ?auto_599579 ) ) ( not ( = ?auto_599572 ?auto_599580 ) ) ( not ( = ?auto_599572 ?auto_599581 ) ) ( not ( = ?auto_599572 ?auto_599582 ) ) ( not ( = ?auto_599573 ?auto_599574 ) ) ( not ( = ?auto_599573 ?auto_599575 ) ) ( not ( = ?auto_599573 ?auto_599576 ) ) ( not ( = ?auto_599573 ?auto_599577 ) ) ( not ( = ?auto_599573 ?auto_599578 ) ) ( not ( = ?auto_599573 ?auto_599579 ) ) ( not ( = ?auto_599573 ?auto_599580 ) ) ( not ( = ?auto_599573 ?auto_599581 ) ) ( not ( = ?auto_599573 ?auto_599582 ) ) ( not ( = ?auto_599574 ?auto_599575 ) ) ( not ( = ?auto_599574 ?auto_599576 ) ) ( not ( = ?auto_599574 ?auto_599577 ) ) ( not ( = ?auto_599574 ?auto_599578 ) ) ( not ( = ?auto_599574 ?auto_599579 ) ) ( not ( = ?auto_599574 ?auto_599580 ) ) ( not ( = ?auto_599574 ?auto_599581 ) ) ( not ( = ?auto_599574 ?auto_599582 ) ) ( not ( = ?auto_599575 ?auto_599576 ) ) ( not ( = ?auto_599575 ?auto_599577 ) ) ( not ( = ?auto_599575 ?auto_599578 ) ) ( not ( = ?auto_599575 ?auto_599579 ) ) ( not ( = ?auto_599575 ?auto_599580 ) ) ( not ( = ?auto_599575 ?auto_599581 ) ) ( not ( = ?auto_599575 ?auto_599582 ) ) ( not ( = ?auto_599576 ?auto_599577 ) ) ( not ( = ?auto_599576 ?auto_599578 ) ) ( not ( = ?auto_599576 ?auto_599579 ) ) ( not ( = ?auto_599576 ?auto_599580 ) ) ( not ( = ?auto_599576 ?auto_599581 ) ) ( not ( = ?auto_599576 ?auto_599582 ) ) ( not ( = ?auto_599577 ?auto_599578 ) ) ( not ( = ?auto_599577 ?auto_599579 ) ) ( not ( = ?auto_599577 ?auto_599580 ) ) ( not ( = ?auto_599577 ?auto_599581 ) ) ( not ( = ?auto_599577 ?auto_599582 ) ) ( not ( = ?auto_599578 ?auto_599579 ) ) ( not ( = ?auto_599578 ?auto_599580 ) ) ( not ( = ?auto_599578 ?auto_599581 ) ) ( not ( = ?auto_599578 ?auto_599582 ) ) ( not ( = ?auto_599579 ?auto_599580 ) ) ( not ( = ?auto_599579 ?auto_599581 ) ) ( not ( = ?auto_599579 ?auto_599582 ) ) ( not ( = ?auto_599580 ?auto_599581 ) ) ( not ( = ?auto_599580 ?auto_599582 ) ) ( not ( = ?auto_599581 ?auto_599582 ) ) ( CLEAR ?auto_599579 ) ( ON ?auto_599580 ?auto_599581 ) ( CLEAR ?auto_599580 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_599571 ?auto_599572 ?auto_599573 ?auto_599574 ?auto_599575 ?auto_599576 ?auto_599577 ?auto_599578 ?auto_599579 ?auto_599580 )
      ( MAKE-11PILE ?auto_599571 ?auto_599572 ?auto_599573 ?auto_599574 ?auto_599575 ?auto_599576 ?auto_599577 ?auto_599578 ?auto_599579 ?auto_599580 ?auto_599581 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_599617 - BLOCK
      ?auto_599618 - BLOCK
      ?auto_599619 - BLOCK
      ?auto_599620 - BLOCK
      ?auto_599621 - BLOCK
      ?auto_599622 - BLOCK
      ?auto_599623 - BLOCK
      ?auto_599624 - BLOCK
      ?auto_599625 - BLOCK
      ?auto_599626 - BLOCK
      ?auto_599627 - BLOCK
    )
    :vars
    (
      ?auto_599628 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_599627 ?auto_599628 ) ( ON-TABLE ?auto_599617 ) ( ON ?auto_599618 ?auto_599617 ) ( ON ?auto_599619 ?auto_599618 ) ( ON ?auto_599620 ?auto_599619 ) ( ON ?auto_599621 ?auto_599620 ) ( ON ?auto_599622 ?auto_599621 ) ( ON ?auto_599623 ?auto_599622 ) ( ON ?auto_599624 ?auto_599623 ) ( not ( = ?auto_599617 ?auto_599618 ) ) ( not ( = ?auto_599617 ?auto_599619 ) ) ( not ( = ?auto_599617 ?auto_599620 ) ) ( not ( = ?auto_599617 ?auto_599621 ) ) ( not ( = ?auto_599617 ?auto_599622 ) ) ( not ( = ?auto_599617 ?auto_599623 ) ) ( not ( = ?auto_599617 ?auto_599624 ) ) ( not ( = ?auto_599617 ?auto_599625 ) ) ( not ( = ?auto_599617 ?auto_599626 ) ) ( not ( = ?auto_599617 ?auto_599627 ) ) ( not ( = ?auto_599617 ?auto_599628 ) ) ( not ( = ?auto_599618 ?auto_599619 ) ) ( not ( = ?auto_599618 ?auto_599620 ) ) ( not ( = ?auto_599618 ?auto_599621 ) ) ( not ( = ?auto_599618 ?auto_599622 ) ) ( not ( = ?auto_599618 ?auto_599623 ) ) ( not ( = ?auto_599618 ?auto_599624 ) ) ( not ( = ?auto_599618 ?auto_599625 ) ) ( not ( = ?auto_599618 ?auto_599626 ) ) ( not ( = ?auto_599618 ?auto_599627 ) ) ( not ( = ?auto_599618 ?auto_599628 ) ) ( not ( = ?auto_599619 ?auto_599620 ) ) ( not ( = ?auto_599619 ?auto_599621 ) ) ( not ( = ?auto_599619 ?auto_599622 ) ) ( not ( = ?auto_599619 ?auto_599623 ) ) ( not ( = ?auto_599619 ?auto_599624 ) ) ( not ( = ?auto_599619 ?auto_599625 ) ) ( not ( = ?auto_599619 ?auto_599626 ) ) ( not ( = ?auto_599619 ?auto_599627 ) ) ( not ( = ?auto_599619 ?auto_599628 ) ) ( not ( = ?auto_599620 ?auto_599621 ) ) ( not ( = ?auto_599620 ?auto_599622 ) ) ( not ( = ?auto_599620 ?auto_599623 ) ) ( not ( = ?auto_599620 ?auto_599624 ) ) ( not ( = ?auto_599620 ?auto_599625 ) ) ( not ( = ?auto_599620 ?auto_599626 ) ) ( not ( = ?auto_599620 ?auto_599627 ) ) ( not ( = ?auto_599620 ?auto_599628 ) ) ( not ( = ?auto_599621 ?auto_599622 ) ) ( not ( = ?auto_599621 ?auto_599623 ) ) ( not ( = ?auto_599621 ?auto_599624 ) ) ( not ( = ?auto_599621 ?auto_599625 ) ) ( not ( = ?auto_599621 ?auto_599626 ) ) ( not ( = ?auto_599621 ?auto_599627 ) ) ( not ( = ?auto_599621 ?auto_599628 ) ) ( not ( = ?auto_599622 ?auto_599623 ) ) ( not ( = ?auto_599622 ?auto_599624 ) ) ( not ( = ?auto_599622 ?auto_599625 ) ) ( not ( = ?auto_599622 ?auto_599626 ) ) ( not ( = ?auto_599622 ?auto_599627 ) ) ( not ( = ?auto_599622 ?auto_599628 ) ) ( not ( = ?auto_599623 ?auto_599624 ) ) ( not ( = ?auto_599623 ?auto_599625 ) ) ( not ( = ?auto_599623 ?auto_599626 ) ) ( not ( = ?auto_599623 ?auto_599627 ) ) ( not ( = ?auto_599623 ?auto_599628 ) ) ( not ( = ?auto_599624 ?auto_599625 ) ) ( not ( = ?auto_599624 ?auto_599626 ) ) ( not ( = ?auto_599624 ?auto_599627 ) ) ( not ( = ?auto_599624 ?auto_599628 ) ) ( not ( = ?auto_599625 ?auto_599626 ) ) ( not ( = ?auto_599625 ?auto_599627 ) ) ( not ( = ?auto_599625 ?auto_599628 ) ) ( not ( = ?auto_599626 ?auto_599627 ) ) ( not ( = ?auto_599626 ?auto_599628 ) ) ( not ( = ?auto_599627 ?auto_599628 ) ) ( ON ?auto_599626 ?auto_599627 ) ( CLEAR ?auto_599624 ) ( ON ?auto_599625 ?auto_599626 ) ( CLEAR ?auto_599625 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_599617 ?auto_599618 ?auto_599619 ?auto_599620 ?auto_599621 ?auto_599622 ?auto_599623 ?auto_599624 ?auto_599625 )
      ( MAKE-11PILE ?auto_599617 ?auto_599618 ?auto_599619 ?auto_599620 ?auto_599621 ?auto_599622 ?auto_599623 ?auto_599624 ?auto_599625 ?auto_599626 ?auto_599627 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_599663 - BLOCK
      ?auto_599664 - BLOCK
      ?auto_599665 - BLOCK
      ?auto_599666 - BLOCK
      ?auto_599667 - BLOCK
      ?auto_599668 - BLOCK
      ?auto_599669 - BLOCK
      ?auto_599670 - BLOCK
      ?auto_599671 - BLOCK
      ?auto_599672 - BLOCK
      ?auto_599673 - BLOCK
    )
    :vars
    (
      ?auto_599674 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_599673 ?auto_599674 ) ( ON-TABLE ?auto_599663 ) ( ON ?auto_599664 ?auto_599663 ) ( ON ?auto_599665 ?auto_599664 ) ( ON ?auto_599666 ?auto_599665 ) ( ON ?auto_599667 ?auto_599666 ) ( ON ?auto_599668 ?auto_599667 ) ( ON ?auto_599669 ?auto_599668 ) ( not ( = ?auto_599663 ?auto_599664 ) ) ( not ( = ?auto_599663 ?auto_599665 ) ) ( not ( = ?auto_599663 ?auto_599666 ) ) ( not ( = ?auto_599663 ?auto_599667 ) ) ( not ( = ?auto_599663 ?auto_599668 ) ) ( not ( = ?auto_599663 ?auto_599669 ) ) ( not ( = ?auto_599663 ?auto_599670 ) ) ( not ( = ?auto_599663 ?auto_599671 ) ) ( not ( = ?auto_599663 ?auto_599672 ) ) ( not ( = ?auto_599663 ?auto_599673 ) ) ( not ( = ?auto_599663 ?auto_599674 ) ) ( not ( = ?auto_599664 ?auto_599665 ) ) ( not ( = ?auto_599664 ?auto_599666 ) ) ( not ( = ?auto_599664 ?auto_599667 ) ) ( not ( = ?auto_599664 ?auto_599668 ) ) ( not ( = ?auto_599664 ?auto_599669 ) ) ( not ( = ?auto_599664 ?auto_599670 ) ) ( not ( = ?auto_599664 ?auto_599671 ) ) ( not ( = ?auto_599664 ?auto_599672 ) ) ( not ( = ?auto_599664 ?auto_599673 ) ) ( not ( = ?auto_599664 ?auto_599674 ) ) ( not ( = ?auto_599665 ?auto_599666 ) ) ( not ( = ?auto_599665 ?auto_599667 ) ) ( not ( = ?auto_599665 ?auto_599668 ) ) ( not ( = ?auto_599665 ?auto_599669 ) ) ( not ( = ?auto_599665 ?auto_599670 ) ) ( not ( = ?auto_599665 ?auto_599671 ) ) ( not ( = ?auto_599665 ?auto_599672 ) ) ( not ( = ?auto_599665 ?auto_599673 ) ) ( not ( = ?auto_599665 ?auto_599674 ) ) ( not ( = ?auto_599666 ?auto_599667 ) ) ( not ( = ?auto_599666 ?auto_599668 ) ) ( not ( = ?auto_599666 ?auto_599669 ) ) ( not ( = ?auto_599666 ?auto_599670 ) ) ( not ( = ?auto_599666 ?auto_599671 ) ) ( not ( = ?auto_599666 ?auto_599672 ) ) ( not ( = ?auto_599666 ?auto_599673 ) ) ( not ( = ?auto_599666 ?auto_599674 ) ) ( not ( = ?auto_599667 ?auto_599668 ) ) ( not ( = ?auto_599667 ?auto_599669 ) ) ( not ( = ?auto_599667 ?auto_599670 ) ) ( not ( = ?auto_599667 ?auto_599671 ) ) ( not ( = ?auto_599667 ?auto_599672 ) ) ( not ( = ?auto_599667 ?auto_599673 ) ) ( not ( = ?auto_599667 ?auto_599674 ) ) ( not ( = ?auto_599668 ?auto_599669 ) ) ( not ( = ?auto_599668 ?auto_599670 ) ) ( not ( = ?auto_599668 ?auto_599671 ) ) ( not ( = ?auto_599668 ?auto_599672 ) ) ( not ( = ?auto_599668 ?auto_599673 ) ) ( not ( = ?auto_599668 ?auto_599674 ) ) ( not ( = ?auto_599669 ?auto_599670 ) ) ( not ( = ?auto_599669 ?auto_599671 ) ) ( not ( = ?auto_599669 ?auto_599672 ) ) ( not ( = ?auto_599669 ?auto_599673 ) ) ( not ( = ?auto_599669 ?auto_599674 ) ) ( not ( = ?auto_599670 ?auto_599671 ) ) ( not ( = ?auto_599670 ?auto_599672 ) ) ( not ( = ?auto_599670 ?auto_599673 ) ) ( not ( = ?auto_599670 ?auto_599674 ) ) ( not ( = ?auto_599671 ?auto_599672 ) ) ( not ( = ?auto_599671 ?auto_599673 ) ) ( not ( = ?auto_599671 ?auto_599674 ) ) ( not ( = ?auto_599672 ?auto_599673 ) ) ( not ( = ?auto_599672 ?auto_599674 ) ) ( not ( = ?auto_599673 ?auto_599674 ) ) ( ON ?auto_599672 ?auto_599673 ) ( ON ?auto_599671 ?auto_599672 ) ( CLEAR ?auto_599669 ) ( ON ?auto_599670 ?auto_599671 ) ( CLEAR ?auto_599670 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_599663 ?auto_599664 ?auto_599665 ?auto_599666 ?auto_599667 ?auto_599668 ?auto_599669 ?auto_599670 )
      ( MAKE-11PILE ?auto_599663 ?auto_599664 ?auto_599665 ?auto_599666 ?auto_599667 ?auto_599668 ?auto_599669 ?auto_599670 ?auto_599671 ?auto_599672 ?auto_599673 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_599709 - BLOCK
      ?auto_599710 - BLOCK
      ?auto_599711 - BLOCK
      ?auto_599712 - BLOCK
      ?auto_599713 - BLOCK
      ?auto_599714 - BLOCK
      ?auto_599715 - BLOCK
      ?auto_599716 - BLOCK
      ?auto_599717 - BLOCK
      ?auto_599718 - BLOCK
      ?auto_599719 - BLOCK
    )
    :vars
    (
      ?auto_599720 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_599719 ?auto_599720 ) ( ON-TABLE ?auto_599709 ) ( ON ?auto_599710 ?auto_599709 ) ( ON ?auto_599711 ?auto_599710 ) ( ON ?auto_599712 ?auto_599711 ) ( ON ?auto_599713 ?auto_599712 ) ( ON ?auto_599714 ?auto_599713 ) ( not ( = ?auto_599709 ?auto_599710 ) ) ( not ( = ?auto_599709 ?auto_599711 ) ) ( not ( = ?auto_599709 ?auto_599712 ) ) ( not ( = ?auto_599709 ?auto_599713 ) ) ( not ( = ?auto_599709 ?auto_599714 ) ) ( not ( = ?auto_599709 ?auto_599715 ) ) ( not ( = ?auto_599709 ?auto_599716 ) ) ( not ( = ?auto_599709 ?auto_599717 ) ) ( not ( = ?auto_599709 ?auto_599718 ) ) ( not ( = ?auto_599709 ?auto_599719 ) ) ( not ( = ?auto_599709 ?auto_599720 ) ) ( not ( = ?auto_599710 ?auto_599711 ) ) ( not ( = ?auto_599710 ?auto_599712 ) ) ( not ( = ?auto_599710 ?auto_599713 ) ) ( not ( = ?auto_599710 ?auto_599714 ) ) ( not ( = ?auto_599710 ?auto_599715 ) ) ( not ( = ?auto_599710 ?auto_599716 ) ) ( not ( = ?auto_599710 ?auto_599717 ) ) ( not ( = ?auto_599710 ?auto_599718 ) ) ( not ( = ?auto_599710 ?auto_599719 ) ) ( not ( = ?auto_599710 ?auto_599720 ) ) ( not ( = ?auto_599711 ?auto_599712 ) ) ( not ( = ?auto_599711 ?auto_599713 ) ) ( not ( = ?auto_599711 ?auto_599714 ) ) ( not ( = ?auto_599711 ?auto_599715 ) ) ( not ( = ?auto_599711 ?auto_599716 ) ) ( not ( = ?auto_599711 ?auto_599717 ) ) ( not ( = ?auto_599711 ?auto_599718 ) ) ( not ( = ?auto_599711 ?auto_599719 ) ) ( not ( = ?auto_599711 ?auto_599720 ) ) ( not ( = ?auto_599712 ?auto_599713 ) ) ( not ( = ?auto_599712 ?auto_599714 ) ) ( not ( = ?auto_599712 ?auto_599715 ) ) ( not ( = ?auto_599712 ?auto_599716 ) ) ( not ( = ?auto_599712 ?auto_599717 ) ) ( not ( = ?auto_599712 ?auto_599718 ) ) ( not ( = ?auto_599712 ?auto_599719 ) ) ( not ( = ?auto_599712 ?auto_599720 ) ) ( not ( = ?auto_599713 ?auto_599714 ) ) ( not ( = ?auto_599713 ?auto_599715 ) ) ( not ( = ?auto_599713 ?auto_599716 ) ) ( not ( = ?auto_599713 ?auto_599717 ) ) ( not ( = ?auto_599713 ?auto_599718 ) ) ( not ( = ?auto_599713 ?auto_599719 ) ) ( not ( = ?auto_599713 ?auto_599720 ) ) ( not ( = ?auto_599714 ?auto_599715 ) ) ( not ( = ?auto_599714 ?auto_599716 ) ) ( not ( = ?auto_599714 ?auto_599717 ) ) ( not ( = ?auto_599714 ?auto_599718 ) ) ( not ( = ?auto_599714 ?auto_599719 ) ) ( not ( = ?auto_599714 ?auto_599720 ) ) ( not ( = ?auto_599715 ?auto_599716 ) ) ( not ( = ?auto_599715 ?auto_599717 ) ) ( not ( = ?auto_599715 ?auto_599718 ) ) ( not ( = ?auto_599715 ?auto_599719 ) ) ( not ( = ?auto_599715 ?auto_599720 ) ) ( not ( = ?auto_599716 ?auto_599717 ) ) ( not ( = ?auto_599716 ?auto_599718 ) ) ( not ( = ?auto_599716 ?auto_599719 ) ) ( not ( = ?auto_599716 ?auto_599720 ) ) ( not ( = ?auto_599717 ?auto_599718 ) ) ( not ( = ?auto_599717 ?auto_599719 ) ) ( not ( = ?auto_599717 ?auto_599720 ) ) ( not ( = ?auto_599718 ?auto_599719 ) ) ( not ( = ?auto_599718 ?auto_599720 ) ) ( not ( = ?auto_599719 ?auto_599720 ) ) ( ON ?auto_599718 ?auto_599719 ) ( ON ?auto_599717 ?auto_599718 ) ( ON ?auto_599716 ?auto_599717 ) ( CLEAR ?auto_599714 ) ( ON ?auto_599715 ?auto_599716 ) ( CLEAR ?auto_599715 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_599709 ?auto_599710 ?auto_599711 ?auto_599712 ?auto_599713 ?auto_599714 ?auto_599715 )
      ( MAKE-11PILE ?auto_599709 ?auto_599710 ?auto_599711 ?auto_599712 ?auto_599713 ?auto_599714 ?auto_599715 ?auto_599716 ?auto_599717 ?auto_599718 ?auto_599719 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_599755 - BLOCK
      ?auto_599756 - BLOCK
      ?auto_599757 - BLOCK
      ?auto_599758 - BLOCK
      ?auto_599759 - BLOCK
      ?auto_599760 - BLOCK
      ?auto_599761 - BLOCK
      ?auto_599762 - BLOCK
      ?auto_599763 - BLOCK
      ?auto_599764 - BLOCK
      ?auto_599765 - BLOCK
    )
    :vars
    (
      ?auto_599766 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_599765 ?auto_599766 ) ( ON-TABLE ?auto_599755 ) ( ON ?auto_599756 ?auto_599755 ) ( ON ?auto_599757 ?auto_599756 ) ( ON ?auto_599758 ?auto_599757 ) ( ON ?auto_599759 ?auto_599758 ) ( not ( = ?auto_599755 ?auto_599756 ) ) ( not ( = ?auto_599755 ?auto_599757 ) ) ( not ( = ?auto_599755 ?auto_599758 ) ) ( not ( = ?auto_599755 ?auto_599759 ) ) ( not ( = ?auto_599755 ?auto_599760 ) ) ( not ( = ?auto_599755 ?auto_599761 ) ) ( not ( = ?auto_599755 ?auto_599762 ) ) ( not ( = ?auto_599755 ?auto_599763 ) ) ( not ( = ?auto_599755 ?auto_599764 ) ) ( not ( = ?auto_599755 ?auto_599765 ) ) ( not ( = ?auto_599755 ?auto_599766 ) ) ( not ( = ?auto_599756 ?auto_599757 ) ) ( not ( = ?auto_599756 ?auto_599758 ) ) ( not ( = ?auto_599756 ?auto_599759 ) ) ( not ( = ?auto_599756 ?auto_599760 ) ) ( not ( = ?auto_599756 ?auto_599761 ) ) ( not ( = ?auto_599756 ?auto_599762 ) ) ( not ( = ?auto_599756 ?auto_599763 ) ) ( not ( = ?auto_599756 ?auto_599764 ) ) ( not ( = ?auto_599756 ?auto_599765 ) ) ( not ( = ?auto_599756 ?auto_599766 ) ) ( not ( = ?auto_599757 ?auto_599758 ) ) ( not ( = ?auto_599757 ?auto_599759 ) ) ( not ( = ?auto_599757 ?auto_599760 ) ) ( not ( = ?auto_599757 ?auto_599761 ) ) ( not ( = ?auto_599757 ?auto_599762 ) ) ( not ( = ?auto_599757 ?auto_599763 ) ) ( not ( = ?auto_599757 ?auto_599764 ) ) ( not ( = ?auto_599757 ?auto_599765 ) ) ( not ( = ?auto_599757 ?auto_599766 ) ) ( not ( = ?auto_599758 ?auto_599759 ) ) ( not ( = ?auto_599758 ?auto_599760 ) ) ( not ( = ?auto_599758 ?auto_599761 ) ) ( not ( = ?auto_599758 ?auto_599762 ) ) ( not ( = ?auto_599758 ?auto_599763 ) ) ( not ( = ?auto_599758 ?auto_599764 ) ) ( not ( = ?auto_599758 ?auto_599765 ) ) ( not ( = ?auto_599758 ?auto_599766 ) ) ( not ( = ?auto_599759 ?auto_599760 ) ) ( not ( = ?auto_599759 ?auto_599761 ) ) ( not ( = ?auto_599759 ?auto_599762 ) ) ( not ( = ?auto_599759 ?auto_599763 ) ) ( not ( = ?auto_599759 ?auto_599764 ) ) ( not ( = ?auto_599759 ?auto_599765 ) ) ( not ( = ?auto_599759 ?auto_599766 ) ) ( not ( = ?auto_599760 ?auto_599761 ) ) ( not ( = ?auto_599760 ?auto_599762 ) ) ( not ( = ?auto_599760 ?auto_599763 ) ) ( not ( = ?auto_599760 ?auto_599764 ) ) ( not ( = ?auto_599760 ?auto_599765 ) ) ( not ( = ?auto_599760 ?auto_599766 ) ) ( not ( = ?auto_599761 ?auto_599762 ) ) ( not ( = ?auto_599761 ?auto_599763 ) ) ( not ( = ?auto_599761 ?auto_599764 ) ) ( not ( = ?auto_599761 ?auto_599765 ) ) ( not ( = ?auto_599761 ?auto_599766 ) ) ( not ( = ?auto_599762 ?auto_599763 ) ) ( not ( = ?auto_599762 ?auto_599764 ) ) ( not ( = ?auto_599762 ?auto_599765 ) ) ( not ( = ?auto_599762 ?auto_599766 ) ) ( not ( = ?auto_599763 ?auto_599764 ) ) ( not ( = ?auto_599763 ?auto_599765 ) ) ( not ( = ?auto_599763 ?auto_599766 ) ) ( not ( = ?auto_599764 ?auto_599765 ) ) ( not ( = ?auto_599764 ?auto_599766 ) ) ( not ( = ?auto_599765 ?auto_599766 ) ) ( ON ?auto_599764 ?auto_599765 ) ( ON ?auto_599763 ?auto_599764 ) ( ON ?auto_599762 ?auto_599763 ) ( ON ?auto_599761 ?auto_599762 ) ( CLEAR ?auto_599759 ) ( ON ?auto_599760 ?auto_599761 ) ( CLEAR ?auto_599760 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_599755 ?auto_599756 ?auto_599757 ?auto_599758 ?auto_599759 ?auto_599760 )
      ( MAKE-11PILE ?auto_599755 ?auto_599756 ?auto_599757 ?auto_599758 ?auto_599759 ?auto_599760 ?auto_599761 ?auto_599762 ?auto_599763 ?auto_599764 ?auto_599765 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_599801 - BLOCK
      ?auto_599802 - BLOCK
      ?auto_599803 - BLOCK
      ?auto_599804 - BLOCK
      ?auto_599805 - BLOCK
      ?auto_599806 - BLOCK
      ?auto_599807 - BLOCK
      ?auto_599808 - BLOCK
      ?auto_599809 - BLOCK
      ?auto_599810 - BLOCK
      ?auto_599811 - BLOCK
    )
    :vars
    (
      ?auto_599812 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_599811 ?auto_599812 ) ( ON-TABLE ?auto_599801 ) ( ON ?auto_599802 ?auto_599801 ) ( ON ?auto_599803 ?auto_599802 ) ( ON ?auto_599804 ?auto_599803 ) ( not ( = ?auto_599801 ?auto_599802 ) ) ( not ( = ?auto_599801 ?auto_599803 ) ) ( not ( = ?auto_599801 ?auto_599804 ) ) ( not ( = ?auto_599801 ?auto_599805 ) ) ( not ( = ?auto_599801 ?auto_599806 ) ) ( not ( = ?auto_599801 ?auto_599807 ) ) ( not ( = ?auto_599801 ?auto_599808 ) ) ( not ( = ?auto_599801 ?auto_599809 ) ) ( not ( = ?auto_599801 ?auto_599810 ) ) ( not ( = ?auto_599801 ?auto_599811 ) ) ( not ( = ?auto_599801 ?auto_599812 ) ) ( not ( = ?auto_599802 ?auto_599803 ) ) ( not ( = ?auto_599802 ?auto_599804 ) ) ( not ( = ?auto_599802 ?auto_599805 ) ) ( not ( = ?auto_599802 ?auto_599806 ) ) ( not ( = ?auto_599802 ?auto_599807 ) ) ( not ( = ?auto_599802 ?auto_599808 ) ) ( not ( = ?auto_599802 ?auto_599809 ) ) ( not ( = ?auto_599802 ?auto_599810 ) ) ( not ( = ?auto_599802 ?auto_599811 ) ) ( not ( = ?auto_599802 ?auto_599812 ) ) ( not ( = ?auto_599803 ?auto_599804 ) ) ( not ( = ?auto_599803 ?auto_599805 ) ) ( not ( = ?auto_599803 ?auto_599806 ) ) ( not ( = ?auto_599803 ?auto_599807 ) ) ( not ( = ?auto_599803 ?auto_599808 ) ) ( not ( = ?auto_599803 ?auto_599809 ) ) ( not ( = ?auto_599803 ?auto_599810 ) ) ( not ( = ?auto_599803 ?auto_599811 ) ) ( not ( = ?auto_599803 ?auto_599812 ) ) ( not ( = ?auto_599804 ?auto_599805 ) ) ( not ( = ?auto_599804 ?auto_599806 ) ) ( not ( = ?auto_599804 ?auto_599807 ) ) ( not ( = ?auto_599804 ?auto_599808 ) ) ( not ( = ?auto_599804 ?auto_599809 ) ) ( not ( = ?auto_599804 ?auto_599810 ) ) ( not ( = ?auto_599804 ?auto_599811 ) ) ( not ( = ?auto_599804 ?auto_599812 ) ) ( not ( = ?auto_599805 ?auto_599806 ) ) ( not ( = ?auto_599805 ?auto_599807 ) ) ( not ( = ?auto_599805 ?auto_599808 ) ) ( not ( = ?auto_599805 ?auto_599809 ) ) ( not ( = ?auto_599805 ?auto_599810 ) ) ( not ( = ?auto_599805 ?auto_599811 ) ) ( not ( = ?auto_599805 ?auto_599812 ) ) ( not ( = ?auto_599806 ?auto_599807 ) ) ( not ( = ?auto_599806 ?auto_599808 ) ) ( not ( = ?auto_599806 ?auto_599809 ) ) ( not ( = ?auto_599806 ?auto_599810 ) ) ( not ( = ?auto_599806 ?auto_599811 ) ) ( not ( = ?auto_599806 ?auto_599812 ) ) ( not ( = ?auto_599807 ?auto_599808 ) ) ( not ( = ?auto_599807 ?auto_599809 ) ) ( not ( = ?auto_599807 ?auto_599810 ) ) ( not ( = ?auto_599807 ?auto_599811 ) ) ( not ( = ?auto_599807 ?auto_599812 ) ) ( not ( = ?auto_599808 ?auto_599809 ) ) ( not ( = ?auto_599808 ?auto_599810 ) ) ( not ( = ?auto_599808 ?auto_599811 ) ) ( not ( = ?auto_599808 ?auto_599812 ) ) ( not ( = ?auto_599809 ?auto_599810 ) ) ( not ( = ?auto_599809 ?auto_599811 ) ) ( not ( = ?auto_599809 ?auto_599812 ) ) ( not ( = ?auto_599810 ?auto_599811 ) ) ( not ( = ?auto_599810 ?auto_599812 ) ) ( not ( = ?auto_599811 ?auto_599812 ) ) ( ON ?auto_599810 ?auto_599811 ) ( ON ?auto_599809 ?auto_599810 ) ( ON ?auto_599808 ?auto_599809 ) ( ON ?auto_599807 ?auto_599808 ) ( ON ?auto_599806 ?auto_599807 ) ( CLEAR ?auto_599804 ) ( ON ?auto_599805 ?auto_599806 ) ( CLEAR ?auto_599805 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_599801 ?auto_599802 ?auto_599803 ?auto_599804 ?auto_599805 )
      ( MAKE-11PILE ?auto_599801 ?auto_599802 ?auto_599803 ?auto_599804 ?auto_599805 ?auto_599806 ?auto_599807 ?auto_599808 ?auto_599809 ?auto_599810 ?auto_599811 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_599847 - BLOCK
      ?auto_599848 - BLOCK
      ?auto_599849 - BLOCK
      ?auto_599850 - BLOCK
      ?auto_599851 - BLOCK
      ?auto_599852 - BLOCK
      ?auto_599853 - BLOCK
      ?auto_599854 - BLOCK
      ?auto_599855 - BLOCK
      ?auto_599856 - BLOCK
      ?auto_599857 - BLOCK
    )
    :vars
    (
      ?auto_599858 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_599857 ?auto_599858 ) ( ON-TABLE ?auto_599847 ) ( ON ?auto_599848 ?auto_599847 ) ( ON ?auto_599849 ?auto_599848 ) ( not ( = ?auto_599847 ?auto_599848 ) ) ( not ( = ?auto_599847 ?auto_599849 ) ) ( not ( = ?auto_599847 ?auto_599850 ) ) ( not ( = ?auto_599847 ?auto_599851 ) ) ( not ( = ?auto_599847 ?auto_599852 ) ) ( not ( = ?auto_599847 ?auto_599853 ) ) ( not ( = ?auto_599847 ?auto_599854 ) ) ( not ( = ?auto_599847 ?auto_599855 ) ) ( not ( = ?auto_599847 ?auto_599856 ) ) ( not ( = ?auto_599847 ?auto_599857 ) ) ( not ( = ?auto_599847 ?auto_599858 ) ) ( not ( = ?auto_599848 ?auto_599849 ) ) ( not ( = ?auto_599848 ?auto_599850 ) ) ( not ( = ?auto_599848 ?auto_599851 ) ) ( not ( = ?auto_599848 ?auto_599852 ) ) ( not ( = ?auto_599848 ?auto_599853 ) ) ( not ( = ?auto_599848 ?auto_599854 ) ) ( not ( = ?auto_599848 ?auto_599855 ) ) ( not ( = ?auto_599848 ?auto_599856 ) ) ( not ( = ?auto_599848 ?auto_599857 ) ) ( not ( = ?auto_599848 ?auto_599858 ) ) ( not ( = ?auto_599849 ?auto_599850 ) ) ( not ( = ?auto_599849 ?auto_599851 ) ) ( not ( = ?auto_599849 ?auto_599852 ) ) ( not ( = ?auto_599849 ?auto_599853 ) ) ( not ( = ?auto_599849 ?auto_599854 ) ) ( not ( = ?auto_599849 ?auto_599855 ) ) ( not ( = ?auto_599849 ?auto_599856 ) ) ( not ( = ?auto_599849 ?auto_599857 ) ) ( not ( = ?auto_599849 ?auto_599858 ) ) ( not ( = ?auto_599850 ?auto_599851 ) ) ( not ( = ?auto_599850 ?auto_599852 ) ) ( not ( = ?auto_599850 ?auto_599853 ) ) ( not ( = ?auto_599850 ?auto_599854 ) ) ( not ( = ?auto_599850 ?auto_599855 ) ) ( not ( = ?auto_599850 ?auto_599856 ) ) ( not ( = ?auto_599850 ?auto_599857 ) ) ( not ( = ?auto_599850 ?auto_599858 ) ) ( not ( = ?auto_599851 ?auto_599852 ) ) ( not ( = ?auto_599851 ?auto_599853 ) ) ( not ( = ?auto_599851 ?auto_599854 ) ) ( not ( = ?auto_599851 ?auto_599855 ) ) ( not ( = ?auto_599851 ?auto_599856 ) ) ( not ( = ?auto_599851 ?auto_599857 ) ) ( not ( = ?auto_599851 ?auto_599858 ) ) ( not ( = ?auto_599852 ?auto_599853 ) ) ( not ( = ?auto_599852 ?auto_599854 ) ) ( not ( = ?auto_599852 ?auto_599855 ) ) ( not ( = ?auto_599852 ?auto_599856 ) ) ( not ( = ?auto_599852 ?auto_599857 ) ) ( not ( = ?auto_599852 ?auto_599858 ) ) ( not ( = ?auto_599853 ?auto_599854 ) ) ( not ( = ?auto_599853 ?auto_599855 ) ) ( not ( = ?auto_599853 ?auto_599856 ) ) ( not ( = ?auto_599853 ?auto_599857 ) ) ( not ( = ?auto_599853 ?auto_599858 ) ) ( not ( = ?auto_599854 ?auto_599855 ) ) ( not ( = ?auto_599854 ?auto_599856 ) ) ( not ( = ?auto_599854 ?auto_599857 ) ) ( not ( = ?auto_599854 ?auto_599858 ) ) ( not ( = ?auto_599855 ?auto_599856 ) ) ( not ( = ?auto_599855 ?auto_599857 ) ) ( not ( = ?auto_599855 ?auto_599858 ) ) ( not ( = ?auto_599856 ?auto_599857 ) ) ( not ( = ?auto_599856 ?auto_599858 ) ) ( not ( = ?auto_599857 ?auto_599858 ) ) ( ON ?auto_599856 ?auto_599857 ) ( ON ?auto_599855 ?auto_599856 ) ( ON ?auto_599854 ?auto_599855 ) ( ON ?auto_599853 ?auto_599854 ) ( ON ?auto_599852 ?auto_599853 ) ( ON ?auto_599851 ?auto_599852 ) ( CLEAR ?auto_599849 ) ( ON ?auto_599850 ?auto_599851 ) ( CLEAR ?auto_599850 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_599847 ?auto_599848 ?auto_599849 ?auto_599850 )
      ( MAKE-11PILE ?auto_599847 ?auto_599848 ?auto_599849 ?auto_599850 ?auto_599851 ?auto_599852 ?auto_599853 ?auto_599854 ?auto_599855 ?auto_599856 ?auto_599857 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_599893 - BLOCK
      ?auto_599894 - BLOCK
      ?auto_599895 - BLOCK
      ?auto_599896 - BLOCK
      ?auto_599897 - BLOCK
      ?auto_599898 - BLOCK
      ?auto_599899 - BLOCK
      ?auto_599900 - BLOCK
      ?auto_599901 - BLOCK
      ?auto_599902 - BLOCK
      ?auto_599903 - BLOCK
    )
    :vars
    (
      ?auto_599904 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_599903 ?auto_599904 ) ( ON-TABLE ?auto_599893 ) ( ON ?auto_599894 ?auto_599893 ) ( not ( = ?auto_599893 ?auto_599894 ) ) ( not ( = ?auto_599893 ?auto_599895 ) ) ( not ( = ?auto_599893 ?auto_599896 ) ) ( not ( = ?auto_599893 ?auto_599897 ) ) ( not ( = ?auto_599893 ?auto_599898 ) ) ( not ( = ?auto_599893 ?auto_599899 ) ) ( not ( = ?auto_599893 ?auto_599900 ) ) ( not ( = ?auto_599893 ?auto_599901 ) ) ( not ( = ?auto_599893 ?auto_599902 ) ) ( not ( = ?auto_599893 ?auto_599903 ) ) ( not ( = ?auto_599893 ?auto_599904 ) ) ( not ( = ?auto_599894 ?auto_599895 ) ) ( not ( = ?auto_599894 ?auto_599896 ) ) ( not ( = ?auto_599894 ?auto_599897 ) ) ( not ( = ?auto_599894 ?auto_599898 ) ) ( not ( = ?auto_599894 ?auto_599899 ) ) ( not ( = ?auto_599894 ?auto_599900 ) ) ( not ( = ?auto_599894 ?auto_599901 ) ) ( not ( = ?auto_599894 ?auto_599902 ) ) ( not ( = ?auto_599894 ?auto_599903 ) ) ( not ( = ?auto_599894 ?auto_599904 ) ) ( not ( = ?auto_599895 ?auto_599896 ) ) ( not ( = ?auto_599895 ?auto_599897 ) ) ( not ( = ?auto_599895 ?auto_599898 ) ) ( not ( = ?auto_599895 ?auto_599899 ) ) ( not ( = ?auto_599895 ?auto_599900 ) ) ( not ( = ?auto_599895 ?auto_599901 ) ) ( not ( = ?auto_599895 ?auto_599902 ) ) ( not ( = ?auto_599895 ?auto_599903 ) ) ( not ( = ?auto_599895 ?auto_599904 ) ) ( not ( = ?auto_599896 ?auto_599897 ) ) ( not ( = ?auto_599896 ?auto_599898 ) ) ( not ( = ?auto_599896 ?auto_599899 ) ) ( not ( = ?auto_599896 ?auto_599900 ) ) ( not ( = ?auto_599896 ?auto_599901 ) ) ( not ( = ?auto_599896 ?auto_599902 ) ) ( not ( = ?auto_599896 ?auto_599903 ) ) ( not ( = ?auto_599896 ?auto_599904 ) ) ( not ( = ?auto_599897 ?auto_599898 ) ) ( not ( = ?auto_599897 ?auto_599899 ) ) ( not ( = ?auto_599897 ?auto_599900 ) ) ( not ( = ?auto_599897 ?auto_599901 ) ) ( not ( = ?auto_599897 ?auto_599902 ) ) ( not ( = ?auto_599897 ?auto_599903 ) ) ( not ( = ?auto_599897 ?auto_599904 ) ) ( not ( = ?auto_599898 ?auto_599899 ) ) ( not ( = ?auto_599898 ?auto_599900 ) ) ( not ( = ?auto_599898 ?auto_599901 ) ) ( not ( = ?auto_599898 ?auto_599902 ) ) ( not ( = ?auto_599898 ?auto_599903 ) ) ( not ( = ?auto_599898 ?auto_599904 ) ) ( not ( = ?auto_599899 ?auto_599900 ) ) ( not ( = ?auto_599899 ?auto_599901 ) ) ( not ( = ?auto_599899 ?auto_599902 ) ) ( not ( = ?auto_599899 ?auto_599903 ) ) ( not ( = ?auto_599899 ?auto_599904 ) ) ( not ( = ?auto_599900 ?auto_599901 ) ) ( not ( = ?auto_599900 ?auto_599902 ) ) ( not ( = ?auto_599900 ?auto_599903 ) ) ( not ( = ?auto_599900 ?auto_599904 ) ) ( not ( = ?auto_599901 ?auto_599902 ) ) ( not ( = ?auto_599901 ?auto_599903 ) ) ( not ( = ?auto_599901 ?auto_599904 ) ) ( not ( = ?auto_599902 ?auto_599903 ) ) ( not ( = ?auto_599902 ?auto_599904 ) ) ( not ( = ?auto_599903 ?auto_599904 ) ) ( ON ?auto_599902 ?auto_599903 ) ( ON ?auto_599901 ?auto_599902 ) ( ON ?auto_599900 ?auto_599901 ) ( ON ?auto_599899 ?auto_599900 ) ( ON ?auto_599898 ?auto_599899 ) ( ON ?auto_599897 ?auto_599898 ) ( ON ?auto_599896 ?auto_599897 ) ( CLEAR ?auto_599894 ) ( ON ?auto_599895 ?auto_599896 ) ( CLEAR ?auto_599895 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_599893 ?auto_599894 ?auto_599895 )
      ( MAKE-11PILE ?auto_599893 ?auto_599894 ?auto_599895 ?auto_599896 ?auto_599897 ?auto_599898 ?auto_599899 ?auto_599900 ?auto_599901 ?auto_599902 ?auto_599903 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_599939 - BLOCK
      ?auto_599940 - BLOCK
      ?auto_599941 - BLOCK
      ?auto_599942 - BLOCK
      ?auto_599943 - BLOCK
      ?auto_599944 - BLOCK
      ?auto_599945 - BLOCK
      ?auto_599946 - BLOCK
      ?auto_599947 - BLOCK
      ?auto_599948 - BLOCK
      ?auto_599949 - BLOCK
    )
    :vars
    (
      ?auto_599950 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_599949 ?auto_599950 ) ( ON-TABLE ?auto_599939 ) ( not ( = ?auto_599939 ?auto_599940 ) ) ( not ( = ?auto_599939 ?auto_599941 ) ) ( not ( = ?auto_599939 ?auto_599942 ) ) ( not ( = ?auto_599939 ?auto_599943 ) ) ( not ( = ?auto_599939 ?auto_599944 ) ) ( not ( = ?auto_599939 ?auto_599945 ) ) ( not ( = ?auto_599939 ?auto_599946 ) ) ( not ( = ?auto_599939 ?auto_599947 ) ) ( not ( = ?auto_599939 ?auto_599948 ) ) ( not ( = ?auto_599939 ?auto_599949 ) ) ( not ( = ?auto_599939 ?auto_599950 ) ) ( not ( = ?auto_599940 ?auto_599941 ) ) ( not ( = ?auto_599940 ?auto_599942 ) ) ( not ( = ?auto_599940 ?auto_599943 ) ) ( not ( = ?auto_599940 ?auto_599944 ) ) ( not ( = ?auto_599940 ?auto_599945 ) ) ( not ( = ?auto_599940 ?auto_599946 ) ) ( not ( = ?auto_599940 ?auto_599947 ) ) ( not ( = ?auto_599940 ?auto_599948 ) ) ( not ( = ?auto_599940 ?auto_599949 ) ) ( not ( = ?auto_599940 ?auto_599950 ) ) ( not ( = ?auto_599941 ?auto_599942 ) ) ( not ( = ?auto_599941 ?auto_599943 ) ) ( not ( = ?auto_599941 ?auto_599944 ) ) ( not ( = ?auto_599941 ?auto_599945 ) ) ( not ( = ?auto_599941 ?auto_599946 ) ) ( not ( = ?auto_599941 ?auto_599947 ) ) ( not ( = ?auto_599941 ?auto_599948 ) ) ( not ( = ?auto_599941 ?auto_599949 ) ) ( not ( = ?auto_599941 ?auto_599950 ) ) ( not ( = ?auto_599942 ?auto_599943 ) ) ( not ( = ?auto_599942 ?auto_599944 ) ) ( not ( = ?auto_599942 ?auto_599945 ) ) ( not ( = ?auto_599942 ?auto_599946 ) ) ( not ( = ?auto_599942 ?auto_599947 ) ) ( not ( = ?auto_599942 ?auto_599948 ) ) ( not ( = ?auto_599942 ?auto_599949 ) ) ( not ( = ?auto_599942 ?auto_599950 ) ) ( not ( = ?auto_599943 ?auto_599944 ) ) ( not ( = ?auto_599943 ?auto_599945 ) ) ( not ( = ?auto_599943 ?auto_599946 ) ) ( not ( = ?auto_599943 ?auto_599947 ) ) ( not ( = ?auto_599943 ?auto_599948 ) ) ( not ( = ?auto_599943 ?auto_599949 ) ) ( not ( = ?auto_599943 ?auto_599950 ) ) ( not ( = ?auto_599944 ?auto_599945 ) ) ( not ( = ?auto_599944 ?auto_599946 ) ) ( not ( = ?auto_599944 ?auto_599947 ) ) ( not ( = ?auto_599944 ?auto_599948 ) ) ( not ( = ?auto_599944 ?auto_599949 ) ) ( not ( = ?auto_599944 ?auto_599950 ) ) ( not ( = ?auto_599945 ?auto_599946 ) ) ( not ( = ?auto_599945 ?auto_599947 ) ) ( not ( = ?auto_599945 ?auto_599948 ) ) ( not ( = ?auto_599945 ?auto_599949 ) ) ( not ( = ?auto_599945 ?auto_599950 ) ) ( not ( = ?auto_599946 ?auto_599947 ) ) ( not ( = ?auto_599946 ?auto_599948 ) ) ( not ( = ?auto_599946 ?auto_599949 ) ) ( not ( = ?auto_599946 ?auto_599950 ) ) ( not ( = ?auto_599947 ?auto_599948 ) ) ( not ( = ?auto_599947 ?auto_599949 ) ) ( not ( = ?auto_599947 ?auto_599950 ) ) ( not ( = ?auto_599948 ?auto_599949 ) ) ( not ( = ?auto_599948 ?auto_599950 ) ) ( not ( = ?auto_599949 ?auto_599950 ) ) ( ON ?auto_599948 ?auto_599949 ) ( ON ?auto_599947 ?auto_599948 ) ( ON ?auto_599946 ?auto_599947 ) ( ON ?auto_599945 ?auto_599946 ) ( ON ?auto_599944 ?auto_599945 ) ( ON ?auto_599943 ?auto_599944 ) ( ON ?auto_599942 ?auto_599943 ) ( ON ?auto_599941 ?auto_599942 ) ( CLEAR ?auto_599939 ) ( ON ?auto_599940 ?auto_599941 ) ( CLEAR ?auto_599940 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_599939 ?auto_599940 )
      ( MAKE-11PILE ?auto_599939 ?auto_599940 ?auto_599941 ?auto_599942 ?auto_599943 ?auto_599944 ?auto_599945 ?auto_599946 ?auto_599947 ?auto_599948 ?auto_599949 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_599985 - BLOCK
      ?auto_599986 - BLOCK
      ?auto_599987 - BLOCK
      ?auto_599988 - BLOCK
      ?auto_599989 - BLOCK
      ?auto_599990 - BLOCK
      ?auto_599991 - BLOCK
      ?auto_599992 - BLOCK
      ?auto_599993 - BLOCK
      ?auto_599994 - BLOCK
      ?auto_599995 - BLOCK
    )
    :vars
    (
      ?auto_599996 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_599995 ?auto_599996 ) ( not ( = ?auto_599985 ?auto_599986 ) ) ( not ( = ?auto_599985 ?auto_599987 ) ) ( not ( = ?auto_599985 ?auto_599988 ) ) ( not ( = ?auto_599985 ?auto_599989 ) ) ( not ( = ?auto_599985 ?auto_599990 ) ) ( not ( = ?auto_599985 ?auto_599991 ) ) ( not ( = ?auto_599985 ?auto_599992 ) ) ( not ( = ?auto_599985 ?auto_599993 ) ) ( not ( = ?auto_599985 ?auto_599994 ) ) ( not ( = ?auto_599985 ?auto_599995 ) ) ( not ( = ?auto_599985 ?auto_599996 ) ) ( not ( = ?auto_599986 ?auto_599987 ) ) ( not ( = ?auto_599986 ?auto_599988 ) ) ( not ( = ?auto_599986 ?auto_599989 ) ) ( not ( = ?auto_599986 ?auto_599990 ) ) ( not ( = ?auto_599986 ?auto_599991 ) ) ( not ( = ?auto_599986 ?auto_599992 ) ) ( not ( = ?auto_599986 ?auto_599993 ) ) ( not ( = ?auto_599986 ?auto_599994 ) ) ( not ( = ?auto_599986 ?auto_599995 ) ) ( not ( = ?auto_599986 ?auto_599996 ) ) ( not ( = ?auto_599987 ?auto_599988 ) ) ( not ( = ?auto_599987 ?auto_599989 ) ) ( not ( = ?auto_599987 ?auto_599990 ) ) ( not ( = ?auto_599987 ?auto_599991 ) ) ( not ( = ?auto_599987 ?auto_599992 ) ) ( not ( = ?auto_599987 ?auto_599993 ) ) ( not ( = ?auto_599987 ?auto_599994 ) ) ( not ( = ?auto_599987 ?auto_599995 ) ) ( not ( = ?auto_599987 ?auto_599996 ) ) ( not ( = ?auto_599988 ?auto_599989 ) ) ( not ( = ?auto_599988 ?auto_599990 ) ) ( not ( = ?auto_599988 ?auto_599991 ) ) ( not ( = ?auto_599988 ?auto_599992 ) ) ( not ( = ?auto_599988 ?auto_599993 ) ) ( not ( = ?auto_599988 ?auto_599994 ) ) ( not ( = ?auto_599988 ?auto_599995 ) ) ( not ( = ?auto_599988 ?auto_599996 ) ) ( not ( = ?auto_599989 ?auto_599990 ) ) ( not ( = ?auto_599989 ?auto_599991 ) ) ( not ( = ?auto_599989 ?auto_599992 ) ) ( not ( = ?auto_599989 ?auto_599993 ) ) ( not ( = ?auto_599989 ?auto_599994 ) ) ( not ( = ?auto_599989 ?auto_599995 ) ) ( not ( = ?auto_599989 ?auto_599996 ) ) ( not ( = ?auto_599990 ?auto_599991 ) ) ( not ( = ?auto_599990 ?auto_599992 ) ) ( not ( = ?auto_599990 ?auto_599993 ) ) ( not ( = ?auto_599990 ?auto_599994 ) ) ( not ( = ?auto_599990 ?auto_599995 ) ) ( not ( = ?auto_599990 ?auto_599996 ) ) ( not ( = ?auto_599991 ?auto_599992 ) ) ( not ( = ?auto_599991 ?auto_599993 ) ) ( not ( = ?auto_599991 ?auto_599994 ) ) ( not ( = ?auto_599991 ?auto_599995 ) ) ( not ( = ?auto_599991 ?auto_599996 ) ) ( not ( = ?auto_599992 ?auto_599993 ) ) ( not ( = ?auto_599992 ?auto_599994 ) ) ( not ( = ?auto_599992 ?auto_599995 ) ) ( not ( = ?auto_599992 ?auto_599996 ) ) ( not ( = ?auto_599993 ?auto_599994 ) ) ( not ( = ?auto_599993 ?auto_599995 ) ) ( not ( = ?auto_599993 ?auto_599996 ) ) ( not ( = ?auto_599994 ?auto_599995 ) ) ( not ( = ?auto_599994 ?auto_599996 ) ) ( not ( = ?auto_599995 ?auto_599996 ) ) ( ON ?auto_599994 ?auto_599995 ) ( ON ?auto_599993 ?auto_599994 ) ( ON ?auto_599992 ?auto_599993 ) ( ON ?auto_599991 ?auto_599992 ) ( ON ?auto_599990 ?auto_599991 ) ( ON ?auto_599989 ?auto_599990 ) ( ON ?auto_599988 ?auto_599989 ) ( ON ?auto_599987 ?auto_599988 ) ( ON ?auto_599986 ?auto_599987 ) ( ON ?auto_599985 ?auto_599986 ) ( CLEAR ?auto_599985 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_599985 )
      ( MAKE-11PILE ?auto_599985 ?auto_599986 ?auto_599987 ?auto_599988 ?auto_599989 ?auto_599990 ?auto_599991 ?auto_599992 ?auto_599993 ?auto_599994 ?auto_599995 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_600032 - BLOCK
      ?auto_600033 - BLOCK
      ?auto_600034 - BLOCK
      ?auto_600035 - BLOCK
      ?auto_600036 - BLOCK
      ?auto_600037 - BLOCK
      ?auto_600038 - BLOCK
      ?auto_600039 - BLOCK
      ?auto_600040 - BLOCK
      ?auto_600041 - BLOCK
      ?auto_600042 - BLOCK
      ?auto_600043 - BLOCK
    )
    :vars
    (
      ?auto_600044 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_600042 ) ( ON ?auto_600043 ?auto_600044 ) ( CLEAR ?auto_600043 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_600032 ) ( ON ?auto_600033 ?auto_600032 ) ( ON ?auto_600034 ?auto_600033 ) ( ON ?auto_600035 ?auto_600034 ) ( ON ?auto_600036 ?auto_600035 ) ( ON ?auto_600037 ?auto_600036 ) ( ON ?auto_600038 ?auto_600037 ) ( ON ?auto_600039 ?auto_600038 ) ( ON ?auto_600040 ?auto_600039 ) ( ON ?auto_600041 ?auto_600040 ) ( ON ?auto_600042 ?auto_600041 ) ( not ( = ?auto_600032 ?auto_600033 ) ) ( not ( = ?auto_600032 ?auto_600034 ) ) ( not ( = ?auto_600032 ?auto_600035 ) ) ( not ( = ?auto_600032 ?auto_600036 ) ) ( not ( = ?auto_600032 ?auto_600037 ) ) ( not ( = ?auto_600032 ?auto_600038 ) ) ( not ( = ?auto_600032 ?auto_600039 ) ) ( not ( = ?auto_600032 ?auto_600040 ) ) ( not ( = ?auto_600032 ?auto_600041 ) ) ( not ( = ?auto_600032 ?auto_600042 ) ) ( not ( = ?auto_600032 ?auto_600043 ) ) ( not ( = ?auto_600032 ?auto_600044 ) ) ( not ( = ?auto_600033 ?auto_600034 ) ) ( not ( = ?auto_600033 ?auto_600035 ) ) ( not ( = ?auto_600033 ?auto_600036 ) ) ( not ( = ?auto_600033 ?auto_600037 ) ) ( not ( = ?auto_600033 ?auto_600038 ) ) ( not ( = ?auto_600033 ?auto_600039 ) ) ( not ( = ?auto_600033 ?auto_600040 ) ) ( not ( = ?auto_600033 ?auto_600041 ) ) ( not ( = ?auto_600033 ?auto_600042 ) ) ( not ( = ?auto_600033 ?auto_600043 ) ) ( not ( = ?auto_600033 ?auto_600044 ) ) ( not ( = ?auto_600034 ?auto_600035 ) ) ( not ( = ?auto_600034 ?auto_600036 ) ) ( not ( = ?auto_600034 ?auto_600037 ) ) ( not ( = ?auto_600034 ?auto_600038 ) ) ( not ( = ?auto_600034 ?auto_600039 ) ) ( not ( = ?auto_600034 ?auto_600040 ) ) ( not ( = ?auto_600034 ?auto_600041 ) ) ( not ( = ?auto_600034 ?auto_600042 ) ) ( not ( = ?auto_600034 ?auto_600043 ) ) ( not ( = ?auto_600034 ?auto_600044 ) ) ( not ( = ?auto_600035 ?auto_600036 ) ) ( not ( = ?auto_600035 ?auto_600037 ) ) ( not ( = ?auto_600035 ?auto_600038 ) ) ( not ( = ?auto_600035 ?auto_600039 ) ) ( not ( = ?auto_600035 ?auto_600040 ) ) ( not ( = ?auto_600035 ?auto_600041 ) ) ( not ( = ?auto_600035 ?auto_600042 ) ) ( not ( = ?auto_600035 ?auto_600043 ) ) ( not ( = ?auto_600035 ?auto_600044 ) ) ( not ( = ?auto_600036 ?auto_600037 ) ) ( not ( = ?auto_600036 ?auto_600038 ) ) ( not ( = ?auto_600036 ?auto_600039 ) ) ( not ( = ?auto_600036 ?auto_600040 ) ) ( not ( = ?auto_600036 ?auto_600041 ) ) ( not ( = ?auto_600036 ?auto_600042 ) ) ( not ( = ?auto_600036 ?auto_600043 ) ) ( not ( = ?auto_600036 ?auto_600044 ) ) ( not ( = ?auto_600037 ?auto_600038 ) ) ( not ( = ?auto_600037 ?auto_600039 ) ) ( not ( = ?auto_600037 ?auto_600040 ) ) ( not ( = ?auto_600037 ?auto_600041 ) ) ( not ( = ?auto_600037 ?auto_600042 ) ) ( not ( = ?auto_600037 ?auto_600043 ) ) ( not ( = ?auto_600037 ?auto_600044 ) ) ( not ( = ?auto_600038 ?auto_600039 ) ) ( not ( = ?auto_600038 ?auto_600040 ) ) ( not ( = ?auto_600038 ?auto_600041 ) ) ( not ( = ?auto_600038 ?auto_600042 ) ) ( not ( = ?auto_600038 ?auto_600043 ) ) ( not ( = ?auto_600038 ?auto_600044 ) ) ( not ( = ?auto_600039 ?auto_600040 ) ) ( not ( = ?auto_600039 ?auto_600041 ) ) ( not ( = ?auto_600039 ?auto_600042 ) ) ( not ( = ?auto_600039 ?auto_600043 ) ) ( not ( = ?auto_600039 ?auto_600044 ) ) ( not ( = ?auto_600040 ?auto_600041 ) ) ( not ( = ?auto_600040 ?auto_600042 ) ) ( not ( = ?auto_600040 ?auto_600043 ) ) ( not ( = ?auto_600040 ?auto_600044 ) ) ( not ( = ?auto_600041 ?auto_600042 ) ) ( not ( = ?auto_600041 ?auto_600043 ) ) ( not ( = ?auto_600041 ?auto_600044 ) ) ( not ( = ?auto_600042 ?auto_600043 ) ) ( not ( = ?auto_600042 ?auto_600044 ) ) ( not ( = ?auto_600043 ?auto_600044 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_600043 ?auto_600044 )
      ( !STACK ?auto_600043 ?auto_600042 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_600082 - BLOCK
      ?auto_600083 - BLOCK
      ?auto_600084 - BLOCK
      ?auto_600085 - BLOCK
      ?auto_600086 - BLOCK
      ?auto_600087 - BLOCK
      ?auto_600088 - BLOCK
      ?auto_600089 - BLOCK
      ?auto_600090 - BLOCK
      ?auto_600091 - BLOCK
      ?auto_600092 - BLOCK
      ?auto_600093 - BLOCK
    )
    :vars
    (
      ?auto_600094 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_600093 ?auto_600094 ) ( ON-TABLE ?auto_600082 ) ( ON ?auto_600083 ?auto_600082 ) ( ON ?auto_600084 ?auto_600083 ) ( ON ?auto_600085 ?auto_600084 ) ( ON ?auto_600086 ?auto_600085 ) ( ON ?auto_600087 ?auto_600086 ) ( ON ?auto_600088 ?auto_600087 ) ( ON ?auto_600089 ?auto_600088 ) ( ON ?auto_600090 ?auto_600089 ) ( ON ?auto_600091 ?auto_600090 ) ( not ( = ?auto_600082 ?auto_600083 ) ) ( not ( = ?auto_600082 ?auto_600084 ) ) ( not ( = ?auto_600082 ?auto_600085 ) ) ( not ( = ?auto_600082 ?auto_600086 ) ) ( not ( = ?auto_600082 ?auto_600087 ) ) ( not ( = ?auto_600082 ?auto_600088 ) ) ( not ( = ?auto_600082 ?auto_600089 ) ) ( not ( = ?auto_600082 ?auto_600090 ) ) ( not ( = ?auto_600082 ?auto_600091 ) ) ( not ( = ?auto_600082 ?auto_600092 ) ) ( not ( = ?auto_600082 ?auto_600093 ) ) ( not ( = ?auto_600082 ?auto_600094 ) ) ( not ( = ?auto_600083 ?auto_600084 ) ) ( not ( = ?auto_600083 ?auto_600085 ) ) ( not ( = ?auto_600083 ?auto_600086 ) ) ( not ( = ?auto_600083 ?auto_600087 ) ) ( not ( = ?auto_600083 ?auto_600088 ) ) ( not ( = ?auto_600083 ?auto_600089 ) ) ( not ( = ?auto_600083 ?auto_600090 ) ) ( not ( = ?auto_600083 ?auto_600091 ) ) ( not ( = ?auto_600083 ?auto_600092 ) ) ( not ( = ?auto_600083 ?auto_600093 ) ) ( not ( = ?auto_600083 ?auto_600094 ) ) ( not ( = ?auto_600084 ?auto_600085 ) ) ( not ( = ?auto_600084 ?auto_600086 ) ) ( not ( = ?auto_600084 ?auto_600087 ) ) ( not ( = ?auto_600084 ?auto_600088 ) ) ( not ( = ?auto_600084 ?auto_600089 ) ) ( not ( = ?auto_600084 ?auto_600090 ) ) ( not ( = ?auto_600084 ?auto_600091 ) ) ( not ( = ?auto_600084 ?auto_600092 ) ) ( not ( = ?auto_600084 ?auto_600093 ) ) ( not ( = ?auto_600084 ?auto_600094 ) ) ( not ( = ?auto_600085 ?auto_600086 ) ) ( not ( = ?auto_600085 ?auto_600087 ) ) ( not ( = ?auto_600085 ?auto_600088 ) ) ( not ( = ?auto_600085 ?auto_600089 ) ) ( not ( = ?auto_600085 ?auto_600090 ) ) ( not ( = ?auto_600085 ?auto_600091 ) ) ( not ( = ?auto_600085 ?auto_600092 ) ) ( not ( = ?auto_600085 ?auto_600093 ) ) ( not ( = ?auto_600085 ?auto_600094 ) ) ( not ( = ?auto_600086 ?auto_600087 ) ) ( not ( = ?auto_600086 ?auto_600088 ) ) ( not ( = ?auto_600086 ?auto_600089 ) ) ( not ( = ?auto_600086 ?auto_600090 ) ) ( not ( = ?auto_600086 ?auto_600091 ) ) ( not ( = ?auto_600086 ?auto_600092 ) ) ( not ( = ?auto_600086 ?auto_600093 ) ) ( not ( = ?auto_600086 ?auto_600094 ) ) ( not ( = ?auto_600087 ?auto_600088 ) ) ( not ( = ?auto_600087 ?auto_600089 ) ) ( not ( = ?auto_600087 ?auto_600090 ) ) ( not ( = ?auto_600087 ?auto_600091 ) ) ( not ( = ?auto_600087 ?auto_600092 ) ) ( not ( = ?auto_600087 ?auto_600093 ) ) ( not ( = ?auto_600087 ?auto_600094 ) ) ( not ( = ?auto_600088 ?auto_600089 ) ) ( not ( = ?auto_600088 ?auto_600090 ) ) ( not ( = ?auto_600088 ?auto_600091 ) ) ( not ( = ?auto_600088 ?auto_600092 ) ) ( not ( = ?auto_600088 ?auto_600093 ) ) ( not ( = ?auto_600088 ?auto_600094 ) ) ( not ( = ?auto_600089 ?auto_600090 ) ) ( not ( = ?auto_600089 ?auto_600091 ) ) ( not ( = ?auto_600089 ?auto_600092 ) ) ( not ( = ?auto_600089 ?auto_600093 ) ) ( not ( = ?auto_600089 ?auto_600094 ) ) ( not ( = ?auto_600090 ?auto_600091 ) ) ( not ( = ?auto_600090 ?auto_600092 ) ) ( not ( = ?auto_600090 ?auto_600093 ) ) ( not ( = ?auto_600090 ?auto_600094 ) ) ( not ( = ?auto_600091 ?auto_600092 ) ) ( not ( = ?auto_600091 ?auto_600093 ) ) ( not ( = ?auto_600091 ?auto_600094 ) ) ( not ( = ?auto_600092 ?auto_600093 ) ) ( not ( = ?auto_600092 ?auto_600094 ) ) ( not ( = ?auto_600093 ?auto_600094 ) ) ( CLEAR ?auto_600091 ) ( ON ?auto_600092 ?auto_600093 ) ( CLEAR ?auto_600092 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_600082 ?auto_600083 ?auto_600084 ?auto_600085 ?auto_600086 ?auto_600087 ?auto_600088 ?auto_600089 ?auto_600090 ?auto_600091 ?auto_600092 )
      ( MAKE-12PILE ?auto_600082 ?auto_600083 ?auto_600084 ?auto_600085 ?auto_600086 ?auto_600087 ?auto_600088 ?auto_600089 ?auto_600090 ?auto_600091 ?auto_600092 ?auto_600093 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_600132 - BLOCK
      ?auto_600133 - BLOCK
      ?auto_600134 - BLOCK
      ?auto_600135 - BLOCK
      ?auto_600136 - BLOCK
      ?auto_600137 - BLOCK
      ?auto_600138 - BLOCK
      ?auto_600139 - BLOCK
      ?auto_600140 - BLOCK
      ?auto_600141 - BLOCK
      ?auto_600142 - BLOCK
      ?auto_600143 - BLOCK
    )
    :vars
    (
      ?auto_600144 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_600143 ?auto_600144 ) ( ON-TABLE ?auto_600132 ) ( ON ?auto_600133 ?auto_600132 ) ( ON ?auto_600134 ?auto_600133 ) ( ON ?auto_600135 ?auto_600134 ) ( ON ?auto_600136 ?auto_600135 ) ( ON ?auto_600137 ?auto_600136 ) ( ON ?auto_600138 ?auto_600137 ) ( ON ?auto_600139 ?auto_600138 ) ( ON ?auto_600140 ?auto_600139 ) ( not ( = ?auto_600132 ?auto_600133 ) ) ( not ( = ?auto_600132 ?auto_600134 ) ) ( not ( = ?auto_600132 ?auto_600135 ) ) ( not ( = ?auto_600132 ?auto_600136 ) ) ( not ( = ?auto_600132 ?auto_600137 ) ) ( not ( = ?auto_600132 ?auto_600138 ) ) ( not ( = ?auto_600132 ?auto_600139 ) ) ( not ( = ?auto_600132 ?auto_600140 ) ) ( not ( = ?auto_600132 ?auto_600141 ) ) ( not ( = ?auto_600132 ?auto_600142 ) ) ( not ( = ?auto_600132 ?auto_600143 ) ) ( not ( = ?auto_600132 ?auto_600144 ) ) ( not ( = ?auto_600133 ?auto_600134 ) ) ( not ( = ?auto_600133 ?auto_600135 ) ) ( not ( = ?auto_600133 ?auto_600136 ) ) ( not ( = ?auto_600133 ?auto_600137 ) ) ( not ( = ?auto_600133 ?auto_600138 ) ) ( not ( = ?auto_600133 ?auto_600139 ) ) ( not ( = ?auto_600133 ?auto_600140 ) ) ( not ( = ?auto_600133 ?auto_600141 ) ) ( not ( = ?auto_600133 ?auto_600142 ) ) ( not ( = ?auto_600133 ?auto_600143 ) ) ( not ( = ?auto_600133 ?auto_600144 ) ) ( not ( = ?auto_600134 ?auto_600135 ) ) ( not ( = ?auto_600134 ?auto_600136 ) ) ( not ( = ?auto_600134 ?auto_600137 ) ) ( not ( = ?auto_600134 ?auto_600138 ) ) ( not ( = ?auto_600134 ?auto_600139 ) ) ( not ( = ?auto_600134 ?auto_600140 ) ) ( not ( = ?auto_600134 ?auto_600141 ) ) ( not ( = ?auto_600134 ?auto_600142 ) ) ( not ( = ?auto_600134 ?auto_600143 ) ) ( not ( = ?auto_600134 ?auto_600144 ) ) ( not ( = ?auto_600135 ?auto_600136 ) ) ( not ( = ?auto_600135 ?auto_600137 ) ) ( not ( = ?auto_600135 ?auto_600138 ) ) ( not ( = ?auto_600135 ?auto_600139 ) ) ( not ( = ?auto_600135 ?auto_600140 ) ) ( not ( = ?auto_600135 ?auto_600141 ) ) ( not ( = ?auto_600135 ?auto_600142 ) ) ( not ( = ?auto_600135 ?auto_600143 ) ) ( not ( = ?auto_600135 ?auto_600144 ) ) ( not ( = ?auto_600136 ?auto_600137 ) ) ( not ( = ?auto_600136 ?auto_600138 ) ) ( not ( = ?auto_600136 ?auto_600139 ) ) ( not ( = ?auto_600136 ?auto_600140 ) ) ( not ( = ?auto_600136 ?auto_600141 ) ) ( not ( = ?auto_600136 ?auto_600142 ) ) ( not ( = ?auto_600136 ?auto_600143 ) ) ( not ( = ?auto_600136 ?auto_600144 ) ) ( not ( = ?auto_600137 ?auto_600138 ) ) ( not ( = ?auto_600137 ?auto_600139 ) ) ( not ( = ?auto_600137 ?auto_600140 ) ) ( not ( = ?auto_600137 ?auto_600141 ) ) ( not ( = ?auto_600137 ?auto_600142 ) ) ( not ( = ?auto_600137 ?auto_600143 ) ) ( not ( = ?auto_600137 ?auto_600144 ) ) ( not ( = ?auto_600138 ?auto_600139 ) ) ( not ( = ?auto_600138 ?auto_600140 ) ) ( not ( = ?auto_600138 ?auto_600141 ) ) ( not ( = ?auto_600138 ?auto_600142 ) ) ( not ( = ?auto_600138 ?auto_600143 ) ) ( not ( = ?auto_600138 ?auto_600144 ) ) ( not ( = ?auto_600139 ?auto_600140 ) ) ( not ( = ?auto_600139 ?auto_600141 ) ) ( not ( = ?auto_600139 ?auto_600142 ) ) ( not ( = ?auto_600139 ?auto_600143 ) ) ( not ( = ?auto_600139 ?auto_600144 ) ) ( not ( = ?auto_600140 ?auto_600141 ) ) ( not ( = ?auto_600140 ?auto_600142 ) ) ( not ( = ?auto_600140 ?auto_600143 ) ) ( not ( = ?auto_600140 ?auto_600144 ) ) ( not ( = ?auto_600141 ?auto_600142 ) ) ( not ( = ?auto_600141 ?auto_600143 ) ) ( not ( = ?auto_600141 ?auto_600144 ) ) ( not ( = ?auto_600142 ?auto_600143 ) ) ( not ( = ?auto_600142 ?auto_600144 ) ) ( not ( = ?auto_600143 ?auto_600144 ) ) ( ON ?auto_600142 ?auto_600143 ) ( CLEAR ?auto_600140 ) ( ON ?auto_600141 ?auto_600142 ) ( CLEAR ?auto_600141 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_600132 ?auto_600133 ?auto_600134 ?auto_600135 ?auto_600136 ?auto_600137 ?auto_600138 ?auto_600139 ?auto_600140 ?auto_600141 )
      ( MAKE-12PILE ?auto_600132 ?auto_600133 ?auto_600134 ?auto_600135 ?auto_600136 ?auto_600137 ?auto_600138 ?auto_600139 ?auto_600140 ?auto_600141 ?auto_600142 ?auto_600143 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_600182 - BLOCK
      ?auto_600183 - BLOCK
      ?auto_600184 - BLOCK
      ?auto_600185 - BLOCK
      ?auto_600186 - BLOCK
      ?auto_600187 - BLOCK
      ?auto_600188 - BLOCK
      ?auto_600189 - BLOCK
      ?auto_600190 - BLOCK
      ?auto_600191 - BLOCK
      ?auto_600192 - BLOCK
      ?auto_600193 - BLOCK
    )
    :vars
    (
      ?auto_600194 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_600193 ?auto_600194 ) ( ON-TABLE ?auto_600182 ) ( ON ?auto_600183 ?auto_600182 ) ( ON ?auto_600184 ?auto_600183 ) ( ON ?auto_600185 ?auto_600184 ) ( ON ?auto_600186 ?auto_600185 ) ( ON ?auto_600187 ?auto_600186 ) ( ON ?auto_600188 ?auto_600187 ) ( ON ?auto_600189 ?auto_600188 ) ( not ( = ?auto_600182 ?auto_600183 ) ) ( not ( = ?auto_600182 ?auto_600184 ) ) ( not ( = ?auto_600182 ?auto_600185 ) ) ( not ( = ?auto_600182 ?auto_600186 ) ) ( not ( = ?auto_600182 ?auto_600187 ) ) ( not ( = ?auto_600182 ?auto_600188 ) ) ( not ( = ?auto_600182 ?auto_600189 ) ) ( not ( = ?auto_600182 ?auto_600190 ) ) ( not ( = ?auto_600182 ?auto_600191 ) ) ( not ( = ?auto_600182 ?auto_600192 ) ) ( not ( = ?auto_600182 ?auto_600193 ) ) ( not ( = ?auto_600182 ?auto_600194 ) ) ( not ( = ?auto_600183 ?auto_600184 ) ) ( not ( = ?auto_600183 ?auto_600185 ) ) ( not ( = ?auto_600183 ?auto_600186 ) ) ( not ( = ?auto_600183 ?auto_600187 ) ) ( not ( = ?auto_600183 ?auto_600188 ) ) ( not ( = ?auto_600183 ?auto_600189 ) ) ( not ( = ?auto_600183 ?auto_600190 ) ) ( not ( = ?auto_600183 ?auto_600191 ) ) ( not ( = ?auto_600183 ?auto_600192 ) ) ( not ( = ?auto_600183 ?auto_600193 ) ) ( not ( = ?auto_600183 ?auto_600194 ) ) ( not ( = ?auto_600184 ?auto_600185 ) ) ( not ( = ?auto_600184 ?auto_600186 ) ) ( not ( = ?auto_600184 ?auto_600187 ) ) ( not ( = ?auto_600184 ?auto_600188 ) ) ( not ( = ?auto_600184 ?auto_600189 ) ) ( not ( = ?auto_600184 ?auto_600190 ) ) ( not ( = ?auto_600184 ?auto_600191 ) ) ( not ( = ?auto_600184 ?auto_600192 ) ) ( not ( = ?auto_600184 ?auto_600193 ) ) ( not ( = ?auto_600184 ?auto_600194 ) ) ( not ( = ?auto_600185 ?auto_600186 ) ) ( not ( = ?auto_600185 ?auto_600187 ) ) ( not ( = ?auto_600185 ?auto_600188 ) ) ( not ( = ?auto_600185 ?auto_600189 ) ) ( not ( = ?auto_600185 ?auto_600190 ) ) ( not ( = ?auto_600185 ?auto_600191 ) ) ( not ( = ?auto_600185 ?auto_600192 ) ) ( not ( = ?auto_600185 ?auto_600193 ) ) ( not ( = ?auto_600185 ?auto_600194 ) ) ( not ( = ?auto_600186 ?auto_600187 ) ) ( not ( = ?auto_600186 ?auto_600188 ) ) ( not ( = ?auto_600186 ?auto_600189 ) ) ( not ( = ?auto_600186 ?auto_600190 ) ) ( not ( = ?auto_600186 ?auto_600191 ) ) ( not ( = ?auto_600186 ?auto_600192 ) ) ( not ( = ?auto_600186 ?auto_600193 ) ) ( not ( = ?auto_600186 ?auto_600194 ) ) ( not ( = ?auto_600187 ?auto_600188 ) ) ( not ( = ?auto_600187 ?auto_600189 ) ) ( not ( = ?auto_600187 ?auto_600190 ) ) ( not ( = ?auto_600187 ?auto_600191 ) ) ( not ( = ?auto_600187 ?auto_600192 ) ) ( not ( = ?auto_600187 ?auto_600193 ) ) ( not ( = ?auto_600187 ?auto_600194 ) ) ( not ( = ?auto_600188 ?auto_600189 ) ) ( not ( = ?auto_600188 ?auto_600190 ) ) ( not ( = ?auto_600188 ?auto_600191 ) ) ( not ( = ?auto_600188 ?auto_600192 ) ) ( not ( = ?auto_600188 ?auto_600193 ) ) ( not ( = ?auto_600188 ?auto_600194 ) ) ( not ( = ?auto_600189 ?auto_600190 ) ) ( not ( = ?auto_600189 ?auto_600191 ) ) ( not ( = ?auto_600189 ?auto_600192 ) ) ( not ( = ?auto_600189 ?auto_600193 ) ) ( not ( = ?auto_600189 ?auto_600194 ) ) ( not ( = ?auto_600190 ?auto_600191 ) ) ( not ( = ?auto_600190 ?auto_600192 ) ) ( not ( = ?auto_600190 ?auto_600193 ) ) ( not ( = ?auto_600190 ?auto_600194 ) ) ( not ( = ?auto_600191 ?auto_600192 ) ) ( not ( = ?auto_600191 ?auto_600193 ) ) ( not ( = ?auto_600191 ?auto_600194 ) ) ( not ( = ?auto_600192 ?auto_600193 ) ) ( not ( = ?auto_600192 ?auto_600194 ) ) ( not ( = ?auto_600193 ?auto_600194 ) ) ( ON ?auto_600192 ?auto_600193 ) ( ON ?auto_600191 ?auto_600192 ) ( CLEAR ?auto_600189 ) ( ON ?auto_600190 ?auto_600191 ) ( CLEAR ?auto_600190 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_600182 ?auto_600183 ?auto_600184 ?auto_600185 ?auto_600186 ?auto_600187 ?auto_600188 ?auto_600189 ?auto_600190 )
      ( MAKE-12PILE ?auto_600182 ?auto_600183 ?auto_600184 ?auto_600185 ?auto_600186 ?auto_600187 ?auto_600188 ?auto_600189 ?auto_600190 ?auto_600191 ?auto_600192 ?auto_600193 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_600232 - BLOCK
      ?auto_600233 - BLOCK
      ?auto_600234 - BLOCK
      ?auto_600235 - BLOCK
      ?auto_600236 - BLOCK
      ?auto_600237 - BLOCK
      ?auto_600238 - BLOCK
      ?auto_600239 - BLOCK
      ?auto_600240 - BLOCK
      ?auto_600241 - BLOCK
      ?auto_600242 - BLOCK
      ?auto_600243 - BLOCK
    )
    :vars
    (
      ?auto_600244 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_600243 ?auto_600244 ) ( ON-TABLE ?auto_600232 ) ( ON ?auto_600233 ?auto_600232 ) ( ON ?auto_600234 ?auto_600233 ) ( ON ?auto_600235 ?auto_600234 ) ( ON ?auto_600236 ?auto_600235 ) ( ON ?auto_600237 ?auto_600236 ) ( ON ?auto_600238 ?auto_600237 ) ( not ( = ?auto_600232 ?auto_600233 ) ) ( not ( = ?auto_600232 ?auto_600234 ) ) ( not ( = ?auto_600232 ?auto_600235 ) ) ( not ( = ?auto_600232 ?auto_600236 ) ) ( not ( = ?auto_600232 ?auto_600237 ) ) ( not ( = ?auto_600232 ?auto_600238 ) ) ( not ( = ?auto_600232 ?auto_600239 ) ) ( not ( = ?auto_600232 ?auto_600240 ) ) ( not ( = ?auto_600232 ?auto_600241 ) ) ( not ( = ?auto_600232 ?auto_600242 ) ) ( not ( = ?auto_600232 ?auto_600243 ) ) ( not ( = ?auto_600232 ?auto_600244 ) ) ( not ( = ?auto_600233 ?auto_600234 ) ) ( not ( = ?auto_600233 ?auto_600235 ) ) ( not ( = ?auto_600233 ?auto_600236 ) ) ( not ( = ?auto_600233 ?auto_600237 ) ) ( not ( = ?auto_600233 ?auto_600238 ) ) ( not ( = ?auto_600233 ?auto_600239 ) ) ( not ( = ?auto_600233 ?auto_600240 ) ) ( not ( = ?auto_600233 ?auto_600241 ) ) ( not ( = ?auto_600233 ?auto_600242 ) ) ( not ( = ?auto_600233 ?auto_600243 ) ) ( not ( = ?auto_600233 ?auto_600244 ) ) ( not ( = ?auto_600234 ?auto_600235 ) ) ( not ( = ?auto_600234 ?auto_600236 ) ) ( not ( = ?auto_600234 ?auto_600237 ) ) ( not ( = ?auto_600234 ?auto_600238 ) ) ( not ( = ?auto_600234 ?auto_600239 ) ) ( not ( = ?auto_600234 ?auto_600240 ) ) ( not ( = ?auto_600234 ?auto_600241 ) ) ( not ( = ?auto_600234 ?auto_600242 ) ) ( not ( = ?auto_600234 ?auto_600243 ) ) ( not ( = ?auto_600234 ?auto_600244 ) ) ( not ( = ?auto_600235 ?auto_600236 ) ) ( not ( = ?auto_600235 ?auto_600237 ) ) ( not ( = ?auto_600235 ?auto_600238 ) ) ( not ( = ?auto_600235 ?auto_600239 ) ) ( not ( = ?auto_600235 ?auto_600240 ) ) ( not ( = ?auto_600235 ?auto_600241 ) ) ( not ( = ?auto_600235 ?auto_600242 ) ) ( not ( = ?auto_600235 ?auto_600243 ) ) ( not ( = ?auto_600235 ?auto_600244 ) ) ( not ( = ?auto_600236 ?auto_600237 ) ) ( not ( = ?auto_600236 ?auto_600238 ) ) ( not ( = ?auto_600236 ?auto_600239 ) ) ( not ( = ?auto_600236 ?auto_600240 ) ) ( not ( = ?auto_600236 ?auto_600241 ) ) ( not ( = ?auto_600236 ?auto_600242 ) ) ( not ( = ?auto_600236 ?auto_600243 ) ) ( not ( = ?auto_600236 ?auto_600244 ) ) ( not ( = ?auto_600237 ?auto_600238 ) ) ( not ( = ?auto_600237 ?auto_600239 ) ) ( not ( = ?auto_600237 ?auto_600240 ) ) ( not ( = ?auto_600237 ?auto_600241 ) ) ( not ( = ?auto_600237 ?auto_600242 ) ) ( not ( = ?auto_600237 ?auto_600243 ) ) ( not ( = ?auto_600237 ?auto_600244 ) ) ( not ( = ?auto_600238 ?auto_600239 ) ) ( not ( = ?auto_600238 ?auto_600240 ) ) ( not ( = ?auto_600238 ?auto_600241 ) ) ( not ( = ?auto_600238 ?auto_600242 ) ) ( not ( = ?auto_600238 ?auto_600243 ) ) ( not ( = ?auto_600238 ?auto_600244 ) ) ( not ( = ?auto_600239 ?auto_600240 ) ) ( not ( = ?auto_600239 ?auto_600241 ) ) ( not ( = ?auto_600239 ?auto_600242 ) ) ( not ( = ?auto_600239 ?auto_600243 ) ) ( not ( = ?auto_600239 ?auto_600244 ) ) ( not ( = ?auto_600240 ?auto_600241 ) ) ( not ( = ?auto_600240 ?auto_600242 ) ) ( not ( = ?auto_600240 ?auto_600243 ) ) ( not ( = ?auto_600240 ?auto_600244 ) ) ( not ( = ?auto_600241 ?auto_600242 ) ) ( not ( = ?auto_600241 ?auto_600243 ) ) ( not ( = ?auto_600241 ?auto_600244 ) ) ( not ( = ?auto_600242 ?auto_600243 ) ) ( not ( = ?auto_600242 ?auto_600244 ) ) ( not ( = ?auto_600243 ?auto_600244 ) ) ( ON ?auto_600242 ?auto_600243 ) ( ON ?auto_600241 ?auto_600242 ) ( ON ?auto_600240 ?auto_600241 ) ( CLEAR ?auto_600238 ) ( ON ?auto_600239 ?auto_600240 ) ( CLEAR ?auto_600239 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_600232 ?auto_600233 ?auto_600234 ?auto_600235 ?auto_600236 ?auto_600237 ?auto_600238 ?auto_600239 )
      ( MAKE-12PILE ?auto_600232 ?auto_600233 ?auto_600234 ?auto_600235 ?auto_600236 ?auto_600237 ?auto_600238 ?auto_600239 ?auto_600240 ?auto_600241 ?auto_600242 ?auto_600243 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_600282 - BLOCK
      ?auto_600283 - BLOCK
      ?auto_600284 - BLOCK
      ?auto_600285 - BLOCK
      ?auto_600286 - BLOCK
      ?auto_600287 - BLOCK
      ?auto_600288 - BLOCK
      ?auto_600289 - BLOCK
      ?auto_600290 - BLOCK
      ?auto_600291 - BLOCK
      ?auto_600292 - BLOCK
      ?auto_600293 - BLOCK
    )
    :vars
    (
      ?auto_600294 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_600293 ?auto_600294 ) ( ON-TABLE ?auto_600282 ) ( ON ?auto_600283 ?auto_600282 ) ( ON ?auto_600284 ?auto_600283 ) ( ON ?auto_600285 ?auto_600284 ) ( ON ?auto_600286 ?auto_600285 ) ( ON ?auto_600287 ?auto_600286 ) ( not ( = ?auto_600282 ?auto_600283 ) ) ( not ( = ?auto_600282 ?auto_600284 ) ) ( not ( = ?auto_600282 ?auto_600285 ) ) ( not ( = ?auto_600282 ?auto_600286 ) ) ( not ( = ?auto_600282 ?auto_600287 ) ) ( not ( = ?auto_600282 ?auto_600288 ) ) ( not ( = ?auto_600282 ?auto_600289 ) ) ( not ( = ?auto_600282 ?auto_600290 ) ) ( not ( = ?auto_600282 ?auto_600291 ) ) ( not ( = ?auto_600282 ?auto_600292 ) ) ( not ( = ?auto_600282 ?auto_600293 ) ) ( not ( = ?auto_600282 ?auto_600294 ) ) ( not ( = ?auto_600283 ?auto_600284 ) ) ( not ( = ?auto_600283 ?auto_600285 ) ) ( not ( = ?auto_600283 ?auto_600286 ) ) ( not ( = ?auto_600283 ?auto_600287 ) ) ( not ( = ?auto_600283 ?auto_600288 ) ) ( not ( = ?auto_600283 ?auto_600289 ) ) ( not ( = ?auto_600283 ?auto_600290 ) ) ( not ( = ?auto_600283 ?auto_600291 ) ) ( not ( = ?auto_600283 ?auto_600292 ) ) ( not ( = ?auto_600283 ?auto_600293 ) ) ( not ( = ?auto_600283 ?auto_600294 ) ) ( not ( = ?auto_600284 ?auto_600285 ) ) ( not ( = ?auto_600284 ?auto_600286 ) ) ( not ( = ?auto_600284 ?auto_600287 ) ) ( not ( = ?auto_600284 ?auto_600288 ) ) ( not ( = ?auto_600284 ?auto_600289 ) ) ( not ( = ?auto_600284 ?auto_600290 ) ) ( not ( = ?auto_600284 ?auto_600291 ) ) ( not ( = ?auto_600284 ?auto_600292 ) ) ( not ( = ?auto_600284 ?auto_600293 ) ) ( not ( = ?auto_600284 ?auto_600294 ) ) ( not ( = ?auto_600285 ?auto_600286 ) ) ( not ( = ?auto_600285 ?auto_600287 ) ) ( not ( = ?auto_600285 ?auto_600288 ) ) ( not ( = ?auto_600285 ?auto_600289 ) ) ( not ( = ?auto_600285 ?auto_600290 ) ) ( not ( = ?auto_600285 ?auto_600291 ) ) ( not ( = ?auto_600285 ?auto_600292 ) ) ( not ( = ?auto_600285 ?auto_600293 ) ) ( not ( = ?auto_600285 ?auto_600294 ) ) ( not ( = ?auto_600286 ?auto_600287 ) ) ( not ( = ?auto_600286 ?auto_600288 ) ) ( not ( = ?auto_600286 ?auto_600289 ) ) ( not ( = ?auto_600286 ?auto_600290 ) ) ( not ( = ?auto_600286 ?auto_600291 ) ) ( not ( = ?auto_600286 ?auto_600292 ) ) ( not ( = ?auto_600286 ?auto_600293 ) ) ( not ( = ?auto_600286 ?auto_600294 ) ) ( not ( = ?auto_600287 ?auto_600288 ) ) ( not ( = ?auto_600287 ?auto_600289 ) ) ( not ( = ?auto_600287 ?auto_600290 ) ) ( not ( = ?auto_600287 ?auto_600291 ) ) ( not ( = ?auto_600287 ?auto_600292 ) ) ( not ( = ?auto_600287 ?auto_600293 ) ) ( not ( = ?auto_600287 ?auto_600294 ) ) ( not ( = ?auto_600288 ?auto_600289 ) ) ( not ( = ?auto_600288 ?auto_600290 ) ) ( not ( = ?auto_600288 ?auto_600291 ) ) ( not ( = ?auto_600288 ?auto_600292 ) ) ( not ( = ?auto_600288 ?auto_600293 ) ) ( not ( = ?auto_600288 ?auto_600294 ) ) ( not ( = ?auto_600289 ?auto_600290 ) ) ( not ( = ?auto_600289 ?auto_600291 ) ) ( not ( = ?auto_600289 ?auto_600292 ) ) ( not ( = ?auto_600289 ?auto_600293 ) ) ( not ( = ?auto_600289 ?auto_600294 ) ) ( not ( = ?auto_600290 ?auto_600291 ) ) ( not ( = ?auto_600290 ?auto_600292 ) ) ( not ( = ?auto_600290 ?auto_600293 ) ) ( not ( = ?auto_600290 ?auto_600294 ) ) ( not ( = ?auto_600291 ?auto_600292 ) ) ( not ( = ?auto_600291 ?auto_600293 ) ) ( not ( = ?auto_600291 ?auto_600294 ) ) ( not ( = ?auto_600292 ?auto_600293 ) ) ( not ( = ?auto_600292 ?auto_600294 ) ) ( not ( = ?auto_600293 ?auto_600294 ) ) ( ON ?auto_600292 ?auto_600293 ) ( ON ?auto_600291 ?auto_600292 ) ( ON ?auto_600290 ?auto_600291 ) ( ON ?auto_600289 ?auto_600290 ) ( CLEAR ?auto_600287 ) ( ON ?auto_600288 ?auto_600289 ) ( CLEAR ?auto_600288 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_600282 ?auto_600283 ?auto_600284 ?auto_600285 ?auto_600286 ?auto_600287 ?auto_600288 )
      ( MAKE-12PILE ?auto_600282 ?auto_600283 ?auto_600284 ?auto_600285 ?auto_600286 ?auto_600287 ?auto_600288 ?auto_600289 ?auto_600290 ?auto_600291 ?auto_600292 ?auto_600293 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_600332 - BLOCK
      ?auto_600333 - BLOCK
      ?auto_600334 - BLOCK
      ?auto_600335 - BLOCK
      ?auto_600336 - BLOCK
      ?auto_600337 - BLOCK
      ?auto_600338 - BLOCK
      ?auto_600339 - BLOCK
      ?auto_600340 - BLOCK
      ?auto_600341 - BLOCK
      ?auto_600342 - BLOCK
      ?auto_600343 - BLOCK
    )
    :vars
    (
      ?auto_600344 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_600343 ?auto_600344 ) ( ON-TABLE ?auto_600332 ) ( ON ?auto_600333 ?auto_600332 ) ( ON ?auto_600334 ?auto_600333 ) ( ON ?auto_600335 ?auto_600334 ) ( ON ?auto_600336 ?auto_600335 ) ( not ( = ?auto_600332 ?auto_600333 ) ) ( not ( = ?auto_600332 ?auto_600334 ) ) ( not ( = ?auto_600332 ?auto_600335 ) ) ( not ( = ?auto_600332 ?auto_600336 ) ) ( not ( = ?auto_600332 ?auto_600337 ) ) ( not ( = ?auto_600332 ?auto_600338 ) ) ( not ( = ?auto_600332 ?auto_600339 ) ) ( not ( = ?auto_600332 ?auto_600340 ) ) ( not ( = ?auto_600332 ?auto_600341 ) ) ( not ( = ?auto_600332 ?auto_600342 ) ) ( not ( = ?auto_600332 ?auto_600343 ) ) ( not ( = ?auto_600332 ?auto_600344 ) ) ( not ( = ?auto_600333 ?auto_600334 ) ) ( not ( = ?auto_600333 ?auto_600335 ) ) ( not ( = ?auto_600333 ?auto_600336 ) ) ( not ( = ?auto_600333 ?auto_600337 ) ) ( not ( = ?auto_600333 ?auto_600338 ) ) ( not ( = ?auto_600333 ?auto_600339 ) ) ( not ( = ?auto_600333 ?auto_600340 ) ) ( not ( = ?auto_600333 ?auto_600341 ) ) ( not ( = ?auto_600333 ?auto_600342 ) ) ( not ( = ?auto_600333 ?auto_600343 ) ) ( not ( = ?auto_600333 ?auto_600344 ) ) ( not ( = ?auto_600334 ?auto_600335 ) ) ( not ( = ?auto_600334 ?auto_600336 ) ) ( not ( = ?auto_600334 ?auto_600337 ) ) ( not ( = ?auto_600334 ?auto_600338 ) ) ( not ( = ?auto_600334 ?auto_600339 ) ) ( not ( = ?auto_600334 ?auto_600340 ) ) ( not ( = ?auto_600334 ?auto_600341 ) ) ( not ( = ?auto_600334 ?auto_600342 ) ) ( not ( = ?auto_600334 ?auto_600343 ) ) ( not ( = ?auto_600334 ?auto_600344 ) ) ( not ( = ?auto_600335 ?auto_600336 ) ) ( not ( = ?auto_600335 ?auto_600337 ) ) ( not ( = ?auto_600335 ?auto_600338 ) ) ( not ( = ?auto_600335 ?auto_600339 ) ) ( not ( = ?auto_600335 ?auto_600340 ) ) ( not ( = ?auto_600335 ?auto_600341 ) ) ( not ( = ?auto_600335 ?auto_600342 ) ) ( not ( = ?auto_600335 ?auto_600343 ) ) ( not ( = ?auto_600335 ?auto_600344 ) ) ( not ( = ?auto_600336 ?auto_600337 ) ) ( not ( = ?auto_600336 ?auto_600338 ) ) ( not ( = ?auto_600336 ?auto_600339 ) ) ( not ( = ?auto_600336 ?auto_600340 ) ) ( not ( = ?auto_600336 ?auto_600341 ) ) ( not ( = ?auto_600336 ?auto_600342 ) ) ( not ( = ?auto_600336 ?auto_600343 ) ) ( not ( = ?auto_600336 ?auto_600344 ) ) ( not ( = ?auto_600337 ?auto_600338 ) ) ( not ( = ?auto_600337 ?auto_600339 ) ) ( not ( = ?auto_600337 ?auto_600340 ) ) ( not ( = ?auto_600337 ?auto_600341 ) ) ( not ( = ?auto_600337 ?auto_600342 ) ) ( not ( = ?auto_600337 ?auto_600343 ) ) ( not ( = ?auto_600337 ?auto_600344 ) ) ( not ( = ?auto_600338 ?auto_600339 ) ) ( not ( = ?auto_600338 ?auto_600340 ) ) ( not ( = ?auto_600338 ?auto_600341 ) ) ( not ( = ?auto_600338 ?auto_600342 ) ) ( not ( = ?auto_600338 ?auto_600343 ) ) ( not ( = ?auto_600338 ?auto_600344 ) ) ( not ( = ?auto_600339 ?auto_600340 ) ) ( not ( = ?auto_600339 ?auto_600341 ) ) ( not ( = ?auto_600339 ?auto_600342 ) ) ( not ( = ?auto_600339 ?auto_600343 ) ) ( not ( = ?auto_600339 ?auto_600344 ) ) ( not ( = ?auto_600340 ?auto_600341 ) ) ( not ( = ?auto_600340 ?auto_600342 ) ) ( not ( = ?auto_600340 ?auto_600343 ) ) ( not ( = ?auto_600340 ?auto_600344 ) ) ( not ( = ?auto_600341 ?auto_600342 ) ) ( not ( = ?auto_600341 ?auto_600343 ) ) ( not ( = ?auto_600341 ?auto_600344 ) ) ( not ( = ?auto_600342 ?auto_600343 ) ) ( not ( = ?auto_600342 ?auto_600344 ) ) ( not ( = ?auto_600343 ?auto_600344 ) ) ( ON ?auto_600342 ?auto_600343 ) ( ON ?auto_600341 ?auto_600342 ) ( ON ?auto_600340 ?auto_600341 ) ( ON ?auto_600339 ?auto_600340 ) ( ON ?auto_600338 ?auto_600339 ) ( CLEAR ?auto_600336 ) ( ON ?auto_600337 ?auto_600338 ) ( CLEAR ?auto_600337 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_600332 ?auto_600333 ?auto_600334 ?auto_600335 ?auto_600336 ?auto_600337 )
      ( MAKE-12PILE ?auto_600332 ?auto_600333 ?auto_600334 ?auto_600335 ?auto_600336 ?auto_600337 ?auto_600338 ?auto_600339 ?auto_600340 ?auto_600341 ?auto_600342 ?auto_600343 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_600382 - BLOCK
      ?auto_600383 - BLOCK
      ?auto_600384 - BLOCK
      ?auto_600385 - BLOCK
      ?auto_600386 - BLOCK
      ?auto_600387 - BLOCK
      ?auto_600388 - BLOCK
      ?auto_600389 - BLOCK
      ?auto_600390 - BLOCK
      ?auto_600391 - BLOCK
      ?auto_600392 - BLOCK
      ?auto_600393 - BLOCK
    )
    :vars
    (
      ?auto_600394 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_600393 ?auto_600394 ) ( ON-TABLE ?auto_600382 ) ( ON ?auto_600383 ?auto_600382 ) ( ON ?auto_600384 ?auto_600383 ) ( ON ?auto_600385 ?auto_600384 ) ( not ( = ?auto_600382 ?auto_600383 ) ) ( not ( = ?auto_600382 ?auto_600384 ) ) ( not ( = ?auto_600382 ?auto_600385 ) ) ( not ( = ?auto_600382 ?auto_600386 ) ) ( not ( = ?auto_600382 ?auto_600387 ) ) ( not ( = ?auto_600382 ?auto_600388 ) ) ( not ( = ?auto_600382 ?auto_600389 ) ) ( not ( = ?auto_600382 ?auto_600390 ) ) ( not ( = ?auto_600382 ?auto_600391 ) ) ( not ( = ?auto_600382 ?auto_600392 ) ) ( not ( = ?auto_600382 ?auto_600393 ) ) ( not ( = ?auto_600382 ?auto_600394 ) ) ( not ( = ?auto_600383 ?auto_600384 ) ) ( not ( = ?auto_600383 ?auto_600385 ) ) ( not ( = ?auto_600383 ?auto_600386 ) ) ( not ( = ?auto_600383 ?auto_600387 ) ) ( not ( = ?auto_600383 ?auto_600388 ) ) ( not ( = ?auto_600383 ?auto_600389 ) ) ( not ( = ?auto_600383 ?auto_600390 ) ) ( not ( = ?auto_600383 ?auto_600391 ) ) ( not ( = ?auto_600383 ?auto_600392 ) ) ( not ( = ?auto_600383 ?auto_600393 ) ) ( not ( = ?auto_600383 ?auto_600394 ) ) ( not ( = ?auto_600384 ?auto_600385 ) ) ( not ( = ?auto_600384 ?auto_600386 ) ) ( not ( = ?auto_600384 ?auto_600387 ) ) ( not ( = ?auto_600384 ?auto_600388 ) ) ( not ( = ?auto_600384 ?auto_600389 ) ) ( not ( = ?auto_600384 ?auto_600390 ) ) ( not ( = ?auto_600384 ?auto_600391 ) ) ( not ( = ?auto_600384 ?auto_600392 ) ) ( not ( = ?auto_600384 ?auto_600393 ) ) ( not ( = ?auto_600384 ?auto_600394 ) ) ( not ( = ?auto_600385 ?auto_600386 ) ) ( not ( = ?auto_600385 ?auto_600387 ) ) ( not ( = ?auto_600385 ?auto_600388 ) ) ( not ( = ?auto_600385 ?auto_600389 ) ) ( not ( = ?auto_600385 ?auto_600390 ) ) ( not ( = ?auto_600385 ?auto_600391 ) ) ( not ( = ?auto_600385 ?auto_600392 ) ) ( not ( = ?auto_600385 ?auto_600393 ) ) ( not ( = ?auto_600385 ?auto_600394 ) ) ( not ( = ?auto_600386 ?auto_600387 ) ) ( not ( = ?auto_600386 ?auto_600388 ) ) ( not ( = ?auto_600386 ?auto_600389 ) ) ( not ( = ?auto_600386 ?auto_600390 ) ) ( not ( = ?auto_600386 ?auto_600391 ) ) ( not ( = ?auto_600386 ?auto_600392 ) ) ( not ( = ?auto_600386 ?auto_600393 ) ) ( not ( = ?auto_600386 ?auto_600394 ) ) ( not ( = ?auto_600387 ?auto_600388 ) ) ( not ( = ?auto_600387 ?auto_600389 ) ) ( not ( = ?auto_600387 ?auto_600390 ) ) ( not ( = ?auto_600387 ?auto_600391 ) ) ( not ( = ?auto_600387 ?auto_600392 ) ) ( not ( = ?auto_600387 ?auto_600393 ) ) ( not ( = ?auto_600387 ?auto_600394 ) ) ( not ( = ?auto_600388 ?auto_600389 ) ) ( not ( = ?auto_600388 ?auto_600390 ) ) ( not ( = ?auto_600388 ?auto_600391 ) ) ( not ( = ?auto_600388 ?auto_600392 ) ) ( not ( = ?auto_600388 ?auto_600393 ) ) ( not ( = ?auto_600388 ?auto_600394 ) ) ( not ( = ?auto_600389 ?auto_600390 ) ) ( not ( = ?auto_600389 ?auto_600391 ) ) ( not ( = ?auto_600389 ?auto_600392 ) ) ( not ( = ?auto_600389 ?auto_600393 ) ) ( not ( = ?auto_600389 ?auto_600394 ) ) ( not ( = ?auto_600390 ?auto_600391 ) ) ( not ( = ?auto_600390 ?auto_600392 ) ) ( not ( = ?auto_600390 ?auto_600393 ) ) ( not ( = ?auto_600390 ?auto_600394 ) ) ( not ( = ?auto_600391 ?auto_600392 ) ) ( not ( = ?auto_600391 ?auto_600393 ) ) ( not ( = ?auto_600391 ?auto_600394 ) ) ( not ( = ?auto_600392 ?auto_600393 ) ) ( not ( = ?auto_600392 ?auto_600394 ) ) ( not ( = ?auto_600393 ?auto_600394 ) ) ( ON ?auto_600392 ?auto_600393 ) ( ON ?auto_600391 ?auto_600392 ) ( ON ?auto_600390 ?auto_600391 ) ( ON ?auto_600389 ?auto_600390 ) ( ON ?auto_600388 ?auto_600389 ) ( ON ?auto_600387 ?auto_600388 ) ( CLEAR ?auto_600385 ) ( ON ?auto_600386 ?auto_600387 ) ( CLEAR ?auto_600386 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_600382 ?auto_600383 ?auto_600384 ?auto_600385 ?auto_600386 )
      ( MAKE-12PILE ?auto_600382 ?auto_600383 ?auto_600384 ?auto_600385 ?auto_600386 ?auto_600387 ?auto_600388 ?auto_600389 ?auto_600390 ?auto_600391 ?auto_600392 ?auto_600393 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_600432 - BLOCK
      ?auto_600433 - BLOCK
      ?auto_600434 - BLOCK
      ?auto_600435 - BLOCK
      ?auto_600436 - BLOCK
      ?auto_600437 - BLOCK
      ?auto_600438 - BLOCK
      ?auto_600439 - BLOCK
      ?auto_600440 - BLOCK
      ?auto_600441 - BLOCK
      ?auto_600442 - BLOCK
      ?auto_600443 - BLOCK
    )
    :vars
    (
      ?auto_600444 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_600443 ?auto_600444 ) ( ON-TABLE ?auto_600432 ) ( ON ?auto_600433 ?auto_600432 ) ( ON ?auto_600434 ?auto_600433 ) ( not ( = ?auto_600432 ?auto_600433 ) ) ( not ( = ?auto_600432 ?auto_600434 ) ) ( not ( = ?auto_600432 ?auto_600435 ) ) ( not ( = ?auto_600432 ?auto_600436 ) ) ( not ( = ?auto_600432 ?auto_600437 ) ) ( not ( = ?auto_600432 ?auto_600438 ) ) ( not ( = ?auto_600432 ?auto_600439 ) ) ( not ( = ?auto_600432 ?auto_600440 ) ) ( not ( = ?auto_600432 ?auto_600441 ) ) ( not ( = ?auto_600432 ?auto_600442 ) ) ( not ( = ?auto_600432 ?auto_600443 ) ) ( not ( = ?auto_600432 ?auto_600444 ) ) ( not ( = ?auto_600433 ?auto_600434 ) ) ( not ( = ?auto_600433 ?auto_600435 ) ) ( not ( = ?auto_600433 ?auto_600436 ) ) ( not ( = ?auto_600433 ?auto_600437 ) ) ( not ( = ?auto_600433 ?auto_600438 ) ) ( not ( = ?auto_600433 ?auto_600439 ) ) ( not ( = ?auto_600433 ?auto_600440 ) ) ( not ( = ?auto_600433 ?auto_600441 ) ) ( not ( = ?auto_600433 ?auto_600442 ) ) ( not ( = ?auto_600433 ?auto_600443 ) ) ( not ( = ?auto_600433 ?auto_600444 ) ) ( not ( = ?auto_600434 ?auto_600435 ) ) ( not ( = ?auto_600434 ?auto_600436 ) ) ( not ( = ?auto_600434 ?auto_600437 ) ) ( not ( = ?auto_600434 ?auto_600438 ) ) ( not ( = ?auto_600434 ?auto_600439 ) ) ( not ( = ?auto_600434 ?auto_600440 ) ) ( not ( = ?auto_600434 ?auto_600441 ) ) ( not ( = ?auto_600434 ?auto_600442 ) ) ( not ( = ?auto_600434 ?auto_600443 ) ) ( not ( = ?auto_600434 ?auto_600444 ) ) ( not ( = ?auto_600435 ?auto_600436 ) ) ( not ( = ?auto_600435 ?auto_600437 ) ) ( not ( = ?auto_600435 ?auto_600438 ) ) ( not ( = ?auto_600435 ?auto_600439 ) ) ( not ( = ?auto_600435 ?auto_600440 ) ) ( not ( = ?auto_600435 ?auto_600441 ) ) ( not ( = ?auto_600435 ?auto_600442 ) ) ( not ( = ?auto_600435 ?auto_600443 ) ) ( not ( = ?auto_600435 ?auto_600444 ) ) ( not ( = ?auto_600436 ?auto_600437 ) ) ( not ( = ?auto_600436 ?auto_600438 ) ) ( not ( = ?auto_600436 ?auto_600439 ) ) ( not ( = ?auto_600436 ?auto_600440 ) ) ( not ( = ?auto_600436 ?auto_600441 ) ) ( not ( = ?auto_600436 ?auto_600442 ) ) ( not ( = ?auto_600436 ?auto_600443 ) ) ( not ( = ?auto_600436 ?auto_600444 ) ) ( not ( = ?auto_600437 ?auto_600438 ) ) ( not ( = ?auto_600437 ?auto_600439 ) ) ( not ( = ?auto_600437 ?auto_600440 ) ) ( not ( = ?auto_600437 ?auto_600441 ) ) ( not ( = ?auto_600437 ?auto_600442 ) ) ( not ( = ?auto_600437 ?auto_600443 ) ) ( not ( = ?auto_600437 ?auto_600444 ) ) ( not ( = ?auto_600438 ?auto_600439 ) ) ( not ( = ?auto_600438 ?auto_600440 ) ) ( not ( = ?auto_600438 ?auto_600441 ) ) ( not ( = ?auto_600438 ?auto_600442 ) ) ( not ( = ?auto_600438 ?auto_600443 ) ) ( not ( = ?auto_600438 ?auto_600444 ) ) ( not ( = ?auto_600439 ?auto_600440 ) ) ( not ( = ?auto_600439 ?auto_600441 ) ) ( not ( = ?auto_600439 ?auto_600442 ) ) ( not ( = ?auto_600439 ?auto_600443 ) ) ( not ( = ?auto_600439 ?auto_600444 ) ) ( not ( = ?auto_600440 ?auto_600441 ) ) ( not ( = ?auto_600440 ?auto_600442 ) ) ( not ( = ?auto_600440 ?auto_600443 ) ) ( not ( = ?auto_600440 ?auto_600444 ) ) ( not ( = ?auto_600441 ?auto_600442 ) ) ( not ( = ?auto_600441 ?auto_600443 ) ) ( not ( = ?auto_600441 ?auto_600444 ) ) ( not ( = ?auto_600442 ?auto_600443 ) ) ( not ( = ?auto_600442 ?auto_600444 ) ) ( not ( = ?auto_600443 ?auto_600444 ) ) ( ON ?auto_600442 ?auto_600443 ) ( ON ?auto_600441 ?auto_600442 ) ( ON ?auto_600440 ?auto_600441 ) ( ON ?auto_600439 ?auto_600440 ) ( ON ?auto_600438 ?auto_600439 ) ( ON ?auto_600437 ?auto_600438 ) ( ON ?auto_600436 ?auto_600437 ) ( CLEAR ?auto_600434 ) ( ON ?auto_600435 ?auto_600436 ) ( CLEAR ?auto_600435 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_600432 ?auto_600433 ?auto_600434 ?auto_600435 )
      ( MAKE-12PILE ?auto_600432 ?auto_600433 ?auto_600434 ?auto_600435 ?auto_600436 ?auto_600437 ?auto_600438 ?auto_600439 ?auto_600440 ?auto_600441 ?auto_600442 ?auto_600443 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_600482 - BLOCK
      ?auto_600483 - BLOCK
      ?auto_600484 - BLOCK
      ?auto_600485 - BLOCK
      ?auto_600486 - BLOCK
      ?auto_600487 - BLOCK
      ?auto_600488 - BLOCK
      ?auto_600489 - BLOCK
      ?auto_600490 - BLOCK
      ?auto_600491 - BLOCK
      ?auto_600492 - BLOCK
      ?auto_600493 - BLOCK
    )
    :vars
    (
      ?auto_600494 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_600493 ?auto_600494 ) ( ON-TABLE ?auto_600482 ) ( ON ?auto_600483 ?auto_600482 ) ( not ( = ?auto_600482 ?auto_600483 ) ) ( not ( = ?auto_600482 ?auto_600484 ) ) ( not ( = ?auto_600482 ?auto_600485 ) ) ( not ( = ?auto_600482 ?auto_600486 ) ) ( not ( = ?auto_600482 ?auto_600487 ) ) ( not ( = ?auto_600482 ?auto_600488 ) ) ( not ( = ?auto_600482 ?auto_600489 ) ) ( not ( = ?auto_600482 ?auto_600490 ) ) ( not ( = ?auto_600482 ?auto_600491 ) ) ( not ( = ?auto_600482 ?auto_600492 ) ) ( not ( = ?auto_600482 ?auto_600493 ) ) ( not ( = ?auto_600482 ?auto_600494 ) ) ( not ( = ?auto_600483 ?auto_600484 ) ) ( not ( = ?auto_600483 ?auto_600485 ) ) ( not ( = ?auto_600483 ?auto_600486 ) ) ( not ( = ?auto_600483 ?auto_600487 ) ) ( not ( = ?auto_600483 ?auto_600488 ) ) ( not ( = ?auto_600483 ?auto_600489 ) ) ( not ( = ?auto_600483 ?auto_600490 ) ) ( not ( = ?auto_600483 ?auto_600491 ) ) ( not ( = ?auto_600483 ?auto_600492 ) ) ( not ( = ?auto_600483 ?auto_600493 ) ) ( not ( = ?auto_600483 ?auto_600494 ) ) ( not ( = ?auto_600484 ?auto_600485 ) ) ( not ( = ?auto_600484 ?auto_600486 ) ) ( not ( = ?auto_600484 ?auto_600487 ) ) ( not ( = ?auto_600484 ?auto_600488 ) ) ( not ( = ?auto_600484 ?auto_600489 ) ) ( not ( = ?auto_600484 ?auto_600490 ) ) ( not ( = ?auto_600484 ?auto_600491 ) ) ( not ( = ?auto_600484 ?auto_600492 ) ) ( not ( = ?auto_600484 ?auto_600493 ) ) ( not ( = ?auto_600484 ?auto_600494 ) ) ( not ( = ?auto_600485 ?auto_600486 ) ) ( not ( = ?auto_600485 ?auto_600487 ) ) ( not ( = ?auto_600485 ?auto_600488 ) ) ( not ( = ?auto_600485 ?auto_600489 ) ) ( not ( = ?auto_600485 ?auto_600490 ) ) ( not ( = ?auto_600485 ?auto_600491 ) ) ( not ( = ?auto_600485 ?auto_600492 ) ) ( not ( = ?auto_600485 ?auto_600493 ) ) ( not ( = ?auto_600485 ?auto_600494 ) ) ( not ( = ?auto_600486 ?auto_600487 ) ) ( not ( = ?auto_600486 ?auto_600488 ) ) ( not ( = ?auto_600486 ?auto_600489 ) ) ( not ( = ?auto_600486 ?auto_600490 ) ) ( not ( = ?auto_600486 ?auto_600491 ) ) ( not ( = ?auto_600486 ?auto_600492 ) ) ( not ( = ?auto_600486 ?auto_600493 ) ) ( not ( = ?auto_600486 ?auto_600494 ) ) ( not ( = ?auto_600487 ?auto_600488 ) ) ( not ( = ?auto_600487 ?auto_600489 ) ) ( not ( = ?auto_600487 ?auto_600490 ) ) ( not ( = ?auto_600487 ?auto_600491 ) ) ( not ( = ?auto_600487 ?auto_600492 ) ) ( not ( = ?auto_600487 ?auto_600493 ) ) ( not ( = ?auto_600487 ?auto_600494 ) ) ( not ( = ?auto_600488 ?auto_600489 ) ) ( not ( = ?auto_600488 ?auto_600490 ) ) ( not ( = ?auto_600488 ?auto_600491 ) ) ( not ( = ?auto_600488 ?auto_600492 ) ) ( not ( = ?auto_600488 ?auto_600493 ) ) ( not ( = ?auto_600488 ?auto_600494 ) ) ( not ( = ?auto_600489 ?auto_600490 ) ) ( not ( = ?auto_600489 ?auto_600491 ) ) ( not ( = ?auto_600489 ?auto_600492 ) ) ( not ( = ?auto_600489 ?auto_600493 ) ) ( not ( = ?auto_600489 ?auto_600494 ) ) ( not ( = ?auto_600490 ?auto_600491 ) ) ( not ( = ?auto_600490 ?auto_600492 ) ) ( not ( = ?auto_600490 ?auto_600493 ) ) ( not ( = ?auto_600490 ?auto_600494 ) ) ( not ( = ?auto_600491 ?auto_600492 ) ) ( not ( = ?auto_600491 ?auto_600493 ) ) ( not ( = ?auto_600491 ?auto_600494 ) ) ( not ( = ?auto_600492 ?auto_600493 ) ) ( not ( = ?auto_600492 ?auto_600494 ) ) ( not ( = ?auto_600493 ?auto_600494 ) ) ( ON ?auto_600492 ?auto_600493 ) ( ON ?auto_600491 ?auto_600492 ) ( ON ?auto_600490 ?auto_600491 ) ( ON ?auto_600489 ?auto_600490 ) ( ON ?auto_600488 ?auto_600489 ) ( ON ?auto_600487 ?auto_600488 ) ( ON ?auto_600486 ?auto_600487 ) ( ON ?auto_600485 ?auto_600486 ) ( CLEAR ?auto_600483 ) ( ON ?auto_600484 ?auto_600485 ) ( CLEAR ?auto_600484 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_600482 ?auto_600483 ?auto_600484 )
      ( MAKE-12PILE ?auto_600482 ?auto_600483 ?auto_600484 ?auto_600485 ?auto_600486 ?auto_600487 ?auto_600488 ?auto_600489 ?auto_600490 ?auto_600491 ?auto_600492 ?auto_600493 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_600532 - BLOCK
      ?auto_600533 - BLOCK
      ?auto_600534 - BLOCK
      ?auto_600535 - BLOCK
      ?auto_600536 - BLOCK
      ?auto_600537 - BLOCK
      ?auto_600538 - BLOCK
      ?auto_600539 - BLOCK
      ?auto_600540 - BLOCK
      ?auto_600541 - BLOCK
      ?auto_600542 - BLOCK
      ?auto_600543 - BLOCK
    )
    :vars
    (
      ?auto_600544 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_600543 ?auto_600544 ) ( ON-TABLE ?auto_600532 ) ( not ( = ?auto_600532 ?auto_600533 ) ) ( not ( = ?auto_600532 ?auto_600534 ) ) ( not ( = ?auto_600532 ?auto_600535 ) ) ( not ( = ?auto_600532 ?auto_600536 ) ) ( not ( = ?auto_600532 ?auto_600537 ) ) ( not ( = ?auto_600532 ?auto_600538 ) ) ( not ( = ?auto_600532 ?auto_600539 ) ) ( not ( = ?auto_600532 ?auto_600540 ) ) ( not ( = ?auto_600532 ?auto_600541 ) ) ( not ( = ?auto_600532 ?auto_600542 ) ) ( not ( = ?auto_600532 ?auto_600543 ) ) ( not ( = ?auto_600532 ?auto_600544 ) ) ( not ( = ?auto_600533 ?auto_600534 ) ) ( not ( = ?auto_600533 ?auto_600535 ) ) ( not ( = ?auto_600533 ?auto_600536 ) ) ( not ( = ?auto_600533 ?auto_600537 ) ) ( not ( = ?auto_600533 ?auto_600538 ) ) ( not ( = ?auto_600533 ?auto_600539 ) ) ( not ( = ?auto_600533 ?auto_600540 ) ) ( not ( = ?auto_600533 ?auto_600541 ) ) ( not ( = ?auto_600533 ?auto_600542 ) ) ( not ( = ?auto_600533 ?auto_600543 ) ) ( not ( = ?auto_600533 ?auto_600544 ) ) ( not ( = ?auto_600534 ?auto_600535 ) ) ( not ( = ?auto_600534 ?auto_600536 ) ) ( not ( = ?auto_600534 ?auto_600537 ) ) ( not ( = ?auto_600534 ?auto_600538 ) ) ( not ( = ?auto_600534 ?auto_600539 ) ) ( not ( = ?auto_600534 ?auto_600540 ) ) ( not ( = ?auto_600534 ?auto_600541 ) ) ( not ( = ?auto_600534 ?auto_600542 ) ) ( not ( = ?auto_600534 ?auto_600543 ) ) ( not ( = ?auto_600534 ?auto_600544 ) ) ( not ( = ?auto_600535 ?auto_600536 ) ) ( not ( = ?auto_600535 ?auto_600537 ) ) ( not ( = ?auto_600535 ?auto_600538 ) ) ( not ( = ?auto_600535 ?auto_600539 ) ) ( not ( = ?auto_600535 ?auto_600540 ) ) ( not ( = ?auto_600535 ?auto_600541 ) ) ( not ( = ?auto_600535 ?auto_600542 ) ) ( not ( = ?auto_600535 ?auto_600543 ) ) ( not ( = ?auto_600535 ?auto_600544 ) ) ( not ( = ?auto_600536 ?auto_600537 ) ) ( not ( = ?auto_600536 ?auto_600538 ) ) ( not ( = ?auto_600536 ?auto_600539 ) ) ( not ( = ?auto_600536 ?auto_600540 ) ) ( not ( = ?auto_600536 ?auto_600541 ) ) ( not ( = ?auto_600536 ?auto_600542 ) ) ( not ( = ?auto_600536 ?auto_600543 ) ) ( not ( = ?auto_600536 ?auto_600544 ) ) ( not ( = ?auto_600537 ?auto_600538 ) ) ( not ( = ?auto_600537 ?auto_600539 ) ) ( not ( = ?auto_600537 ?auto_600540 ) ) ( not ( = ?auto_600537 ?auto_600541 ) ) ( not ( = ?auto_600537 ?auto_600542 ) ) ( not ( = ?auto_600537 ?auto_600543 ) ) ( not ( = ?auto_600537 ?auto_600544 ) ) ( not ( = ?auto_600538 ?auto_600539 ) ) ( not ( = ?auto_600538 ?auto_600540 ) ) ( not ( = ?auto_600538 ?auto_600541 ) ) ( not ( = ?auto_600538 ?auto_600542 ) ) ( not ( = ?auto_600538 ?auto_600543 ) ) ( not ( = ?auto_600538 ?auto_600544 ) ) ( not ( = ?auto_600539 ?auto_600540 ) ) ( not ( = ?auto_600539 ?auto_600541 ) ) ( not ( = ?auto_600539 ?auto_600542 ) ) ( not ( = ?auto_600539 ?auto_600543 ) ) ( not ( = ?auto_600539 ?auto_600544 ) ) ( not ( = ?auto_600540 ?auto_600541 ) ) ( not ( = ?auto_600540 ?auto_600542 ) ) ( not ( = ?auto_600540 ?auto_600543 ) ) ( not ( = ?auto_600540 ?auto_600544 ) ) ( not ( = ?auto_600541 ?auto_600542 ) ) ( not ( = ?auto_600541 ?auto_600543 ) ) ( not ( = ?auto_600541 ?auto_600544 ) ) ( not ( = ?auto_600542 ?auto_600543 ) ) ( not ( = ?auto_600542 ?auto_600544 ) ) ( not ( = ?auto_600543 ?auto_600544 ) ) ( ON ?auto_600542 ?auto_600543 ) ( ON ?auto_600541 ?auto_600542 ) ( ON ?auto_600540 ?auto_600541 ) ( ON ?auto_600539 ?auto_600540 ) ( ON ?auto_600538 ?auto_600539 ) ( ON ?auto_600537 ?auto_600538 ) ( ON ?auto_600536 ?auto_600537 ) ( ON ?auto_600535 ?auto_600536 ) ( ON ?auto_600534 ?auto_600535 ) ( CLEAR ?auto_600532 ) ( ON ?auto_600533 ?auto_600534 ) ( CLEAR ?auto_600533 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_600532 ?auto_600533 )
      ( MAKE-12PILE ?auto_600532 ?auto_600533 ?auto_600534 ?auto_600535 ?auto_600536 ?auto_600537 ?auto_600538 ?auto_600539 ?auto_600540 ?auto_600541 ?auto_600542 ?auto_600543 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_600582 - BLOCK
      ?auto_600583 - BLOCK
      ?auto_600584 - BLOCK
      ?auto_600585 - BLOCK
      ?auto_600586 - BLOCK
      ?auto_600587 - BLOCK
      ?auto_600588 - BLOCK
      ?auto_600589 - BLOCK
      ?auto_600590 - BLOCK
      ?auto_600591 - BLOCK
      ?auto_600592 - BLOCK
      ?auto_600593 - BLOCK
    )
    :vars
    (
      ?auto_600594 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_600593 ?auto_600594 ) ( not ( = ?auto_600582 ?auto_600583 ) ) ( not ( = ?auto_600582 ?auto_600584 ) ) ( not ( = ?auto_600582 ?auto_600585 ) ) ( not ( = ?auto_600582 ?auto_600586 ) ) ( not ( = ?auto_600582 ?auto_600587 ) ) ( not ( = ?auto_600582 ?auto_600588 ) ) ( not ( = ?auto_600582 ?auto_600589 ) ) ( not ( = ?auto_600582 ?auto_600590 ) ) ( not ( = ?auto_600582 ?auto_600591 ) ) ( not ( = ?auto_600582 ?auto_600592 ) ) ( not ( = ?auto_600582 ?auto_600593 ) ) ( not ( = ?auto_600582 ?auto_600594 ) ) ( not ( = ?auto_600583 ?auto_600584 ) ) ( not ( = ?auto_600583 ?auto_600585 ) ) ( not ( = ?auto_600583 ?auto_600586 ) ) ( not ( = ?auto_600583 ?auto_600587 ) ) ( not ( = ?auto_600583 ?auto_600588 ) ) ( not ( = ?auto_600583 ?auto_600589 ) ) ( not ( = ?auto_600583 ?auto_600590 ) ) ( not ( = ?auto_600583 ?auto_600591 ) ) ( not ( = ?auto_600583 ?auto_600592 ) ) ( not ( = ?auto_600583 ?auto_600593 ) ) ( not ( = ?auto_600583 ?auto_600594 ) ) ( not ( = ?auto_600584 ?auto_600585 ) ) ( not ( = ?auto_600584 ?auto_600586 ) ) ( not ( = ?auto_600584 ?auto_600587 ) ) ( not ( = ?auto_600584 ?auto_600588 ) ) ( not ( = ?auto_600584 ?auto_600589 ) ) ( not ( = ?auto_600584 ?auto_600590 ) ) ( not ( = ?auto_600584 ?auto_600591 ) ) ( not ( = ?auto_600584 ?auto_600592 ) ) ( not ( = ?auto_600584 ?auto_600593 ) ) ( not ( = ?auto_600584 ?auto_600594 ) ) ( not ( = ?auto_600585 ?auto_600586 ) ) ( not ( = ?auto_600585 ?auto_600587 ) ) ( not ( = ?auto_600585 ?auto_600588 ) ) ( not ( = ?auto_600585 ?auto_600589 ) ) ( not ( = ?auto_600585 ?auto_600590 ) ) ( not ( = ?auto_600585 ?auto_600591 ) ) ( not ( = ?auto_600585 ?auto_600592 ) ) ( not ( = ?auto_600585 ?auto_600593 ) ) ( not ( = ?auto_600585 ?auto_600594 ) ) ( not ( = ?auto_600586 ?auto_600587 ) ) ( not ( = ?auto_600586 ?auto_600588 ) ) ( not ( = ?auto_600586 ?auto_600589 ) ) ( not ( = ?auto_600586 ?auto_600590 ) ) ( not ( = ?auto_600586 ?auto_600591 ) ) ( not ( = ?auto_600586 ?auto_600592 ) ) ( not ( = ?auto_600586 ?auto_600593 ) ) ( not ( = ?auto_600586 ?auto_600594 ) ) ( not ( = ?auto_600587 ?auto_600588 ) ) ( not ( = ?auto_600587 ?auto_600589 ) ) ( not ( = ?auto_600587 ?auto_600590 ) ) ( not ( = ?auto_600587 ?auto_600591 ) ) ( not ( = ?auto_600587 ?auto_600592 ) ) ( not ( = ?auto_600587 ?auto_600593 ) ) ( not ( = ?auto_600587 ?auto_600594 ) ) ( not ( = ?auto_600588 ?auto_600589 ) ) ( not ( = ?auto_600588 ?auto_600590 ) ) ( not ( = ?auto_600588 ?auto_600591 ) ) ( not ( = ?auto_600588 ?auto_600592 ) ) ( not ( = ?auto_600588 ?auto_600593 ) ) ( not ( = ?auto_600588 ?auto_600594 ) ) ( not ( = ?auto_600589 ?auto_600590 ) ) ( not ( = ?auto_600589 ?auto_600591 ) ) ( not ( = ?auto_600589 ?auto_600592 ) ) ( not ( = ?auto_600589 ?auto_600593 ) ) ( not ( = ?auto_600589 ?auto_600594 ) ) ( not ( = ?auto_600590 ?auto_600591 ) ) ( not ( = ?auto_600590 ?auto_600592 ) ) ( not ( = ?auto_600590 ?auto_600593 ) ) ( not ( = ?auto_600590 ?auto_600594 ) ) ( not ( = ?auto_600591 ?auto_600592 ) ) ( not ( = ?auto_600591 ?auto_600593 ) ) ( not ( = ?auto_600591 ?auto_600594 ) ) ( not ( = ?auto_600592 ?auto_600593 ) ) ( not ( = ?auto_600592 ?auto_600594 ) ) ( not ( = ?auto_600593 ?auto_600594 ) ) ( ON ?auto_600592 ?auto_600593 ) ( ON ?auto_600591 ?auto_600592 ) ( ON ?auto_600590 ?auto_600591 ) ( ON ?auto_600589 ?auto_600590 ) ( ON ?auto_600588 ?auto_600589 ) ( ON ?auto_600587 ?auto_600588 ) ( ON ?auto_600586 ?auto_600587 ) ( ON ?auto_600585 ?auto_600586 ) ( ON ?auto_600584 ?auto_600585 ) ( ON ?auto_600583 ?auto_600584 ) ( ON ?auto_600582 ?auto_600583 ) ( CLEAR ?auto_600582 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_600582 )
      ( MAKE-12PILE ?auto_600582 ?auto_600583 ?auto_600584 ?auto_600585 ?auto_600586 ?auto_600587 ?auto_600588 ?auto_600589 ?auto_600590 ?auto_600591 ?auto_600592 ?auto_600593 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_600633 - BLOCK
      ?auto_600634 - BLOCK
      ?auto_600635 - BLOCK
      ?auto_600636 - BLOCK
      ?auto_600637 - BLOCK
      ?auto_600638 - BLOCK
      ?auto_600639 - BLOCK
      ?auto_600640 - BLOCK
      ?auto_600641 - BLOCK
      ?auto_600642 - BLOCK
      ?auto_600643 - BLOCK
      ?auto_600644 - BLOCK
      ?auto_600645 - BLOCK
    )
    :vars
    (
      ?auto_600646 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_600644 ) ( ON ?auto_600645 ?auto_600646 ) ( CLEAR ?auto_600645 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_600633 ) ( ON ?auto_600634 ?auto_600633 ) ( ON ?auto_600635 ?auto_600634 ) ( ON ?auto_600636 ?auto_600635 ) ( ON ?auto_600637 ?auto_600636 ) ( ON ?auto_600638 ?auto_600637 ) ( ON ?auto_600639 ?auto_600638 ) ( ON ?auto_600640 ?auto_600639 ) ( ON ?auto_600641 ?auto_600640 ) ( ON ?auto_600642 ?auto_600641 ) ( ON ?auto_600643 ?auto_600642 ) ( ON ?auto_600644 ?auto_600643 ) ( not ( = ?auto_600633 ?auto_600634 ) ) ( not ( = ?auto_600633 ?auto_600635 ) ) ( not ( = ?auto_600633 ?auto_600636 ) ) ( not ( = ?auto_600633 ?auto_600637 ) ) ( not ( = ?auto_600633 ?auto_600638 ) ) ( not ( = ?auto_600633 ?auto_600639 ) ) ( not ( = ?auto_600633 ?auto_600640 ) ) ( not ( = ?auto_600633 ?auto_600641 ) ) ( not ( = ?auto_600633 ?auto_600642 ) ) ( not ( = ?auto_600633 ?auto_600643 ) ) ( not ( = ?auto_600633 ?auto_600644 ) ) ( not ( = ?auto_600633 ?auto_600645 ) ) ( not ( = ?auto_600633 ?auto_600646 ) ) ( not ( = ?auto_600634 ?auto_600635 ) ) ( not ( = ?auto_600634 ?auto_600636 ) ) ( not ( = ?auto_600634 ?auto_600637 ) ) ( not ( = ?auto_600634 ?auto_600638 ) ) ( not ( = ?auto_600634 ?auto_600639 ) ) ( not ( = ?auto_600634 ?auto_600640 ) ) ( not ( = ?auto_600634 ?auto_600641 ) ) ( not ( = ?auto_600634 ?auto_600642 ) ) ( not ( = ?auto_600634 ?auto_600643 ) ) ( not ( = ?auto_600634 ?auto_600644 ) ) ( not ( = ?auto_600634 ?auto_600645 ) ) ( not ( = ?auto_600634 ?auto_600646 ) ) ( not ( = ?auto_600635 ?auto_600636 ) ) ( not ( = ?auto_600635 ?auto_600637 ) ) ( not ( = ?auto_600635 ?auto_600638 ) ) ( not ( = ?auto_600635 ?auto_600639 ) ) ( not ( = ?auto_600635 ?auto_600640 ) ) ( not ( = ?auto_600635 ?auto_600641 ) ) ( not ( = ?auto_600635 ?auto_600642 ) ) ( not ( = ?auto_600635 ?auto_600643 ) ) ( not ( = ?auto_600635 ?auto_600644 ) ) ( not ( = ?auto_600635 ?auto_600645 ) ) ( not ( = ?auto_600635 ?auto_600646 ) ) ( not ( = ?auto_600636 ?auto_600637 ) ) ( not ( = ?auto_600636 ?auto_600638 ) ) ( not ( = ?auto_600636 ?auto_600639 ) ) ( not ( = ?auto_600636 ?auto_600640 ) ) ( not ( = ?auto_600636 ?auto_600641 ) ) ( not ( = ?auto_600636 ?auto_600642 ) ) ( not ( = ?auto_600636 ?auto_600643 ) ) ( not ( = ?auto_600636 ?auto_600644 ) ) ( not ( = ?auto_600636 ?auto_600645 ) ) ( not ( = ?auto_600636 ?auto_600646 ) ) ( not ( = ?auto_600637 ?auto_600638 ) ) ( not ( = ?auto_600637 ?auto_600639 ) ) ( not ( = ?auto_600637 ?auto_600640 ) ) ( not ( = ?auto_600637 ?auto_600641 ) ) ( not ( = ?auto_600637 ?auto_600642 ) ) ( not ( = ?auto_600637 ?auto_600643 ) ) ( not ( = ?auto_600637 ?auto_600644 ) ) ( not ( = ?auto_600637 ?auto_600645 ) ) ( not ( = ?auto_600637 ?auto_600646 ) ) ( not ( = ?auto_600638 ?auto_600639 ) ) ( not ( = ?auto_600638 ?auto_600640 ) ) ( not ( = ?auto_600638 ?auto_600641 ) ) ( not ( = ?auto_600638 ?auto_600642 ) ) ( not ( = ?auto_600638 ?auto_600643 ) ) ( not ( = ?auto_600638 ?auto_600644 ) ) ( not ( = ?auto_600638 ?auto_600645 ) ) ( not ( = ?auto_600638 ?auto_600646 ) ) ( not ( = ?auto_600639 ?auto_600640 ) ) ( not ( = ?auto_600639 ?auto_600641 ) ) ( not ( = ?auto_600639 ?auto_600642 ) ) ( not ( = ?auto_600639 ?auto_600643 ) ) ( not ( = ?auto_600639 ?auto_600644 ) ) ( not ( = ?auto_600639 ?auto_600645 ) ) ( not ( = ?auto_600639 ?auto_600646 ) ) ( not ( = ?auto_600640 ?auto_600641 ) ) ( not ( = ?auto_600640 ?auto_600642 ) ) ( not ( = ?auto_600640 ?auto_600643 ) ) ( not ( = ?auto_600640 ?auto_600644 ) ) ( not ( = ?auto_600640 ?auto_600645 ) ) ( not ( = ?auto_600640 ?auto_600646 ) ) ( not ( = ?auto_600641 ?auto_600642 ) ) ( not ( = ?auto_600641 ?auto_600643 ) ) ( not ( = ?auto_600641 ?auto_600644 ) ) ( not ( = ?auto_600641 ?auto_600645 ) ) ( not ( = ?auto_600641 ?auto_600646 ) ) ( not ( = ?auto_600642 ?auto_600643 ) ) ( not ( = ?auto_600642 ?auto_600644 ) ) ( not ( = ?auto_600642 ?auto_600645 ) ) ( not ( = ?auto_600642 ?auto_600646 ) ) ( not ( = ?auto_600643 ?auto_600644 ) ) ( not ( = ?auto_600643 ?auto_600645 ) ) ( not ( = ?auto_600643 ?auto_600646 ) ) ( not ( = ?auto_600644 ?auto_600645 ) ) ( not ( = ?auto_600644 ?auto_600646 ) ) ( not ( = ?auto_600645 ?auto_600646 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_600645 ?auto_600646 )
      ( !STACK ?auto_600645 ?auto_600644 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_600687 - BLOCK
      ?auto_600688 - BLOCK
      ?auto_600689 - BLOCK
      ?auto_600690 - BLOCK
      ?auto_600691 - BLOCK
      ?auto_600692 - BLOCK
      ?auto_600693 - BLOCK
      ?auto_600694 - BLOCK
      ?auto_600695 - BLOCK
      ?auto_600696 - BLOCK
      ?auto_600697 - BLOCK
      ?auto_600698 - BLOCK
      ?auto_600699 - BLOCK
    )
    :vars
    (
      ?auto_600700 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_600699 ?auto_600700 ) ( ON-TABLE ?auto_600687 ) ( ON ?auto_600688 ?auto_600687 ) ( ON ?auto_600689 ?auto_600688 ) ( ON ?auto_600690 ?auto_600689 ) ( ON ?auto_600691 ?auto_600690 ) ( ON ?auto_600692 ?auto_600691 ) ( ON ?auto_600693 ?auto_600692 ) ( ON ?auto_600694 ?auto_600693 ) ( ON ?auto_600695 ?auto_600694 ) ( ON ?auto_600696 ?auto_600695 ) ( ON ?auto_600697 ?auto_600696 ) ( not ( = ?auto_600687 ?auto_600688 ) ) ( not ( = ?auto_600687 ?auto_600689 ) ) ( not ( = ?auto_600687 ?auto_600690 ) ) ( not ( = ?auto_600687 ?auto_600691 ) ) ( not ( = ?auto_600687 ?auto_600692 ) ) ( not ( = ?auto_600687 ?auto_600693 ) ) ( not ( = ?auto_600687 ?auto_600694 ) ) ( not ( = ?auto_600687 ?auto_600695 ) ) ( not ( = ?auto_600687 ?auto_600696 ) ) ( not ( = ?auto_600687 ?auto_600697 ) ) ( not ( = ?auto_600687 ?auto_600698 ) ) ( not ( = ?auto_600687 ?auto_600699 ) ) ( not ( = ?auto_600687 ?auto_600700 ) ) ( not ( = ?auto_600688 ?auto_600689 ) ) ( not ( = ?auto_600688 ?auto_600690 ) ) ( not ( = ?auto_600688 ?auto_600691 ) ) ( not ( = ?auto_600688 ?auto_600692 ) ) ( not ( = ?auto_600688 ?auto_600693 ) ) ( not ( = ?auto_600688 ?auto_600694 ) ) ( not ( = ?auto_600688 ?auto_600695 ) ) ( not ( = ?auto_600688 ?auto_600696 ) ) ( not ( = ?auto_600688 ?auto_600697 ) ) ( not ( = ?auto_600688 ?auto_600698 ) ) ( not ( = ?auto_600688 ?auto_600699 ) ) ( not ( = ?auto_600688 ?auto_600700 ) ) ( not ( = ?auto_600689 ?auto_600690 ) ) ( not ( = ?auto_600689 ?auto_600691 ) ) ( not ( = ?auto_600689 ?auto_600692 ) ) ( not ( = ?auto_600689 ?auto_600693 ) ) ( not ( = ?auto_600689 ?auto_600694 ) ) ( not ( = ?auto_600689 ?auto_600695 ) ) ( not ( = ?auto_600689 ?auto_600696 ) ) ( not ( = ?auto_600689 ?auto_600697 ) ) ( not ( = ?auto_600689 ?auto_600698 ) ) ( not ( = ?auto_600689 ?auto_600699 ) ) ( not ( = ?auto_600689 ?auto_600700 ) ) ( not ( = ?auto_600690 ?auto_600691 ) ) ( not ( = ?auto_600690 ?auto_600692 ) ) ( not ( = ?auto_600690 ?auto_600693 ) ) ( not ( = ?auto_600690 ?auto_600694 ) ) ( not ( = ?auto_600690 ?auto_600695 ) ) ( not ( = ?auto_600690 ?auto_600696 ) ) ( not ( = ?auto_600690 ?auto_600697 ) ) ( not ( = ?auto_600690 ?auto_600698 ) ) ( not ( = ?auto_600690 ?auto_600699 ) ) ( not ( = ?auto_600690 ?auto_600700 ) ) ( not ( = ?auto_600691 ?auto_600692 ) ) ( not ( = ?auto_600691 ?auto_600693 ) ) ( not ( = ?auto_600691 ?auto_600694 ) ) ( not ( = ?auto_600691 ?auto_600695 ) ) ( not ( = ?auto_600691 ?auto_600696 ) ) ( not ( = ?auto_600691 ?auto_600697 ) ) ( not ( = ?auto_600691 ?auto_600698 ) ) ( not ( = ?auto_600691 ?auto_600699 ) ) ( not ( = ?auto_600691 ?auto_600700 ) ) ( not ( = ?auto_600692 ?auto_600693 ) ) ( not ( = ?auto_600692 ?auto_600694 ) ) ( not ( = ?auto_600692 ?auto_600695 ) ) ( not ( = ?auto_600692 ?auto_600696 ) ) ( not ( = ?auto_600692 ?auto_600697 ) ) ( not ( = ?auto_600692 ?auto_600698 ) ) ( not ( = ?auto_600692 ?auto_600699 ) ) ( not ( = ?auto_600692 ?auto_600700 ) ) ( not ( = ?auto_600693 ?auto_600694 ) ) ( not ( = ?auto_600693 ?auto_600695 ) ) ( not ( = ?auto_600693 ?auto_600696 ) ) ( not ( = ?auto_600693 ?auto_600697 ) ) ( not ( = ?auto_600693 ?auto_600698 ) ) ( not ( = ?auto_600693 ?auto_600699 ) ) ( not ( = ?auto_600693 ?auto_600700 ) ) ( not ( = ?auto_600694 ?auto_600695 ) ) ( not ( = ?auto_600694 ?auto_600696 ) ) ( not ( = ?auto_600694 ?auto_600697 ) ) ( not ( = ?auto_600694 ?auto_600698 ) ) ( not ( = ?auto_600694 ?auto_600699 ) ) ( not ( = ?auto_600694 ?auto_600700 ) ) ( not ( = ?auto_600695 ?auto_600696 ) ) ( not ( = ?auto_600695 ?auto_600697 ) ) ( not ( = ?auto_600695 ?auto_600698 ) ) ( not ( = ?auto_600695 ?auto_600699 ) ) ( not ( = ?auto_600695 ?auto_600700 ) ) ( not ( = ?auto_600696 ?auto_600697 ) ) ( not ( = ?auto_600696 ?auto_600698 ) ) ( not ( = ?auto_600696 ?auto_600699 ) ) ( not ( = ?auto_600696 ?auto_600700 ) ) ( not ( = ?auto_600697 ?auto_600698 ) ) ( not ( = ?auto_600697 ?auto_600699 ) ) ( not ( = ?auto_600697 ?auto_600700 ) ) ( not ( = ?auto_600698 ?auto_600699 ) ) ( not ( = ?auto_600698 ?auto_600700 ) ) ( not ( = ?auto_600699 ?auto_600700 ) ) ( CLEAR ?auto_600697 ) ( ON ?auto_600698 ?auto_600699 ) ( CLEAR ?auto_600698 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_600687 ?auto_600688 ?auto_600689 ?auto_600690 ?auto_600691 ?auto_600692 ?auto_600693 ?auto_600694 ?auto_600695 ?auto_600696 ?auto_600697 ?auto_600698 )
      ( MAKE-13PILE ?auto_600687 ?auto_600688 ?auto_600689 ?auto_600690 ?auto_600691 ?auto_600692 ?auto_600693 ?auto_600694 ?auto_600695 ?auto_600696 ?auto_600697 ?auto_600698 ?auto_600699 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_600741 - BLOCK
      ?auto_600742 - BLOCK
      ?auto_600743 - BLOCK
      ?auto_600744 - BLOCK
      ?auto_600745 - BLOCK
      ?auto_600746 - BLOCK
      ?auto_600747 - BLOCK
      ?auto_600748 - BLOCK
      ?auto_600749 - BLOCK
      ?auto_600750 - BLOCK
      ?auto_600751 - BLOCK
      ?auto_600752 - BLOCK
      ?auto_600753 - BLOCK
    )
    :vars
    (
      ?auto_600754 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_600753 ?auto_600754 ) ( ON-TABLE ?auto_600741 ) ( ON ?auto_600742 ?auto_600741 ) ( ON ?auto_600743 ?auto_600742 ) ( ON ?auto_600744 ?auto_600743 ) ( ON ?auto_600745 ?auto_600744 ) ( ON ?auto_600746 ?auto_600745 ) ( ON ?auto_600747 ?auto_600746 ) ( ON ?auto_600748 ?auto_600747 ) ( ON ?auto_600749 ?auto_600748 ) ( ON ?auto_600750 ?auto_600749 ) ( not ( = ?auto_600741 ?auto_600742 ) ) ( not ( = ?auto_600741 ?auto_600743 ) ) ( not ( = ?auto_600741 ?auto_600744 ) ) ( not ( = ?auto_600741 ?auto_600745 ) ) ( not ( = ?auto_600741 ?auto_600746 ) ) ( not ( = ?auto_600741 ?auto_600747 ) ) ( not ( = ?auto_600741 ?auto_600748 ) ) ( not ( = ?auto_600741 ?auto_600749 ) ) ( not ( = ?auto_600741 ?auto_600750 ) ) ( not ( = ?auto_600741 ?auto_600751 ) ) ( not ( = ?auto_600741 ?auto_600752 ) ) ( not ( = ?auto_600741 ?auto_600753 ) ) ( not ( = ?auto_600741 ?auto_600754 ) ) ( not ( = ?auto_600742 ?auto_600743 ) ) ( not ( = ?auto_600742 ?auto_600744 ) ) ( not ( = ?auto_600742 ?auto_600745 ) ) ( not ( = ?auto_600742 ?auto_600746 ) ) ( not ( = ?auto_600742 ?auto_600747 ) ) ( not ( = ?auto_600742 ?auto_600748 ) ) ( not ( = ?auto_600742 ?auto_600749 ) ) ( not ( = ?auto_600742 ?auto_600750 ) ) ( not ( = ?auto_600742 ?auto_600751 ) ) ( not ( = ?auto_600742 ?auto_600752 ) ) ( not ( = ?auto_600742 ?auto_600753 ) ) ( not ( = ?auto_600742 ?auto_600754 ) ) ( not ( = ?auto_600743 ?auto_600744 ) ) ( not ( = ?auto_600743 ?auto_600745 ) ) ( not ( = ?auto_600743 ?auto_600746 ) ) ( not ( = ?auto_600743 ?auto_600747 ) ) ( not ( = ?auto_600743 ?auto_600748 ) ) ( not ( = ?auto_600743 ?auto_600749 ) ) ( not ( = ?auto_600743 ?auto_600750 ) ) ( not ( = ?auto_600743 ?auto_600751 ) ) ( not ( = ?auto_600743 ?auto_600752 ) ) ( not ( = ?auto_600743 ?auto_600753 ) ) ( not ( = ?auto_600743 ?auto_600754 ) ) ( not ( = ?auto_600744 ?auto_600745 ) ) ( not ( = ?auto_600744 ?auto_600746 ) ) ( not ( = ?auto_600744 ?auto_600747 ) ) ( not ( = ?auto_600744 ?auto_600748 ) ) ( not ( = ?auto_600744 ?auto_600749 ) ) ( not ( = ?auto_600744 ?auto_600750 ) ) ( not ( = ?auto_600744 ?auto_600751 ) ) ( not ( = ?auto_600744 ?auto_600752 ) ) ( not ( = ?auto_600744 ?auto_600753 ) ) ( not ( = ?auto_600744 ?auto_600754 ) ) ( not ( = ?auto_600745 ?auto_600746 ) ) ( not ( = ?auto_600745 ?auto_600747 ) ) ( not ( = ?auto_600745 ?auto_600748 ) ) ( not ( = ?auto_600745 ?auto_600749 ) ) ( not ( = ?auto_600745 ?auto_600750 ) ) ( not ( = ?auto_600745 ?auto_600751 ) ) ( not ( = ?auto_600745 ?auto_600752 ) ) ( not ( = ?auto_600745 ?auto_600753 ) ) ( not ( = ?auto_600745 ?auto_600754 ) ) ( not ( = ?auto_600746 ?auto_600747 ) ) ( not ( = ?auto_600746 ?auto_600748 ) ) ( not ( = ?auto_600746 ?auto_600749 ) ) ( not ( = ?auto_600746 ?auto_600750 ) ) ( not ( = ?auto_600746 ?auto_600751 ) ) ( not ( = ?auto_600746 ?auto_600752 ) ) ( not ( = ?auto_600746 ?auto_600753 ) ) ( not ( = ?auto_600746 ?auto_600754 ) ) ( not ( = ?auto_600747 ?auto_600748 ) ) ( not ( = ?auto_600747 ?auto_600749 ) ) ( not ( = ?auto_600747 ?auto_600750 ) ) ( not ( = ?auto_600747 ?auto_600751 ) ) ( not ( = ?auto_600747 ?auto_600752 ) ) ( not ( = ?auto_600747 ?auto_600753 ) ) ( not ( = ?auto_600747 ?auto_600754 ) ) ( not ( = ?auto_600748 ?auto_600749 ) ) ( not ( = ?auto_600748 ?auto_600750 ) ) ( not ( = ?auto_600748 ?auto_600751 ) ) ( not ( = ?auto_600748 ?auto_600752 ) ) ( not ( = ?auto_600748 ?auto_600753 ) ) ( not ( = ?auto_600748 ?auto_600754 ) ) ( not ( = ?auto_600749 ?auto_600750 ) ) ( not ( = ?auto_600749 ?auto_600751 ) ) ( not ( = ?auto_600749 ?auto_600752 ) ) ( not ( = ?auto_600749 ?auto_600753 ) ) ( not ( = ?auto_600749 ?auto_600754 ) ) ( not ( = ?auto_600750 ?auto_600751 ) ) ( not ( = ?auto_600750 ?auto_600752 ) ) ( not ( = ?auto_600750 ?auto_600753 ) ) ( not ( = ?auto_600750 ?auto_600754 ) ) ( not ( = ?auto_600751 ?auto_600752 ) ) ( not ( = ?auto_600751 ?auto_600753 ) ) ( not ( = ?auto_600751 ?auto_600754 ) ) ( not ( = ?auto_600752 ?auto_600753 ) ) ( not ( = ?auto_600752 ?auto_600754 ) ) ( not ( = ?auto_600753 ?auto_600754 ) ) ( ON ?auto_600752 ?auto_600753 ) ( CLEAR ?auto_600750 ) ( ON ?auto_600751 ?auto_600752 ) ( CLEAR ?auto_600751 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_600741 ?auto_600742 ?auto_600743 ?auto_600744 ?auto_600745 ?auto_600746 ?auto_600747 ?auto_600748 ?auto_600749 ?auto_600750 ?auto_600751 )
      ( MAKE-13PILE ?auto_600741 ?auto_600742 ?auto_600743 ?auto_600744 ?auto_600745 ?auto_600746 ?auto_600747 ?auto_600748 ?auto_600749 ?auto_600750 ?auto_600751 ?auto_600752 ?auto_600753 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_600795 - BLOCK
      ?auto_600796 - BLOCK
      ?auto_600797 - BLOCK
      ?auto_600798 - BLOCK
      ?auto_600799 - BLOCK
      ?auto_600800 - BLOCK
      ?auto_600801 - BLOCK
      ?auto_600802 - BLOCK
      ?auto_600803 - BLOCK
      ?auto_600804 - BLOCK
      ?auto_600805 - BLOCK
      ?auto_600806 - BLOCK
      ?auto_600807 - BLOCK
    )
    :vars
    (
      ?auto_600808 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_600807 ?auto_600808 ) ( ON-TABLE ?auto_600795 ) ( ON ?auto_600796 ?auto_600795 ) ( ON ?auto_600797 ?auto_600796 ) ( ON ?auto_600798 ?auto_600797 ) ( ON ?auto_600799 ?auto_600798 ) ( ON ?auto_600800 ?auto_600799 ) ( ON ?auto_600801 ?auto_600800 ) ( ON ?auto_600802 ?auto_600801 ) ( ON ?auto_600803 ?auto_600802 ) ( not ( = ?auto_600795 ?auto_600796 ) ) ( not ( = ?auto_600795 ?auto_600797 ) ) ( not ( = ?auto_600795 ?auto_600798 ) ) ( not ( = ?auto_600795 ?auto_600799 ) ) ( not ( = ?auto_600795 ?auto_600800 ) ) ( not ( = ?auto_600795 ?auto_600801 ) ) ( not ( = ?auto_600795 ?auto_600802 ) ) ( not ( = ?auto_600795 ?auto_600803 ) ) ( not ( = ?auto_600795 ?auto_600804 ) ) ( not ( = ?auto_600795 ?auto_600805 ) ) ( not ( = ?auto_600795 ?auto_600806 ) ) ( not ( = ?auto_600795 ?auto_600807 ) ) ( not ( = ?auto_600795 ?auto_600808 ) ) ( not ( = ?auto_600796 ?auto_600797 ) ) ( not ( = ?auto_600796 ?auto_600798 ) ) ( not ( = ?auto_600796 ?auto_600799 ) ) ( not ( = ?auto_600796 ?auto_600800 ) ) ( not ( = ?auto_600796 ?auto_600801 ) ) ( not ( = ?auto_600796 ?auto_600802 ) ) ( not ( = ?auto_600796 ?auto_600803 ) ) ( not ( = ?auto_600796 ?auto_600804 ) ) ( not ( = ?auto_600796 ?auto_600805 ) ) ( not ( = ?auto_600796 ?auto_600806 ) ) ( not ( = ?auto_600796 ?auto_600807 ) ) ( not ( = ?auto_600796 ?auto_600808 ) ) ( not ( = ?auto_600797 ?auto_600798 ) ) ( not ( = ?auto_600797 ?auto_600799 ) ) ( not ( = ?auto_600797 ?auto_600800 ) ) ( not ( = ?auto_600797 ?auto_600801 ) ) ( not ( = ?auto_600797 ?auto_600802 ) ) ( not ( = ?auto_600797 ?auto_600803 ) ) ( not ( = ?auto_600797 ?auto_600804 ) ) ( not ( = ?auto_600797 ?auto_600805 ) ) ( not ( = ?auto_600797 ?auto_600806 ) ) ( not ( = ?auto_600797 ?auto_600807 ) ) ( not ( = ?auto_600797 ?auto_600808 ) ) ( not ( = ?auto_600798 ?auto_600799 ) ) ( not ( = ?auto_600798 ?auto_600800 ) ) ( not ( = ?auto_600798 ?auto_600801 ) ) ( not ( = ?auto_600798 ?auto_600802 ) ) ( not ( = ?auto_600798 ?auto_600803 ) ) ( not ( = ?auto_600798 ?auto_600804 ) ) ( not ( = ?auto_600798 ?auto_600805 ) ) ( not ( = ?auto_600798 ?auto_600806 ) ) ( not ( = ?auto_600798 ?auto_600807 ) ) ( not ( = ?auto_600798 ?auto_600808 ) ) ( not ( = ?auto_600799 ?auto_600800 ) ) ( not ( = ?auto_600799 ?auto_600801 ) ) ( not ( = ?auto_600799 ?auto_600802 ) ) ( not ( = ?auto_600799 ?auto_600803 ) ) ( not ( = ?auto_600799 ?auto_600804 ) ) ( not ( = ?auto_600799 ?auto_600805 ) ) ( not ( = ?auto_600799 ?auto_600806 ) ) ( not ( = ?auto_600799 ?auto_600807 ) ) ( not ( = ?auto_600799 ?auto_600808 ) ) ( not ( = ?auto_600800 ?auto_600801 ) ) ( not ( = ?auto_600800 ?auto_600802 ) ) ( not ( = ?auto_600800 ?auto_600803 ) ) ( not ( = ?auto_600800 ?auto_600804 ) ) ( not ( = ?auto_600800 ?auto_600805 ) ) ( not ( = ?auto_600800 ?auto_600806 ) ) ( not ( = ?auto_600800 ?auto_600807 ) ) ( not ( = ?auto_600800 ?auto_600808 ) ) ( not ( = ?auto_600801 ?auto_600802 ) ) ( not ( = ?auto_600801 ?auto_600803 ) ) ( not ( = ?auto_600801 ?auto_600804 ) ) ( not ( = ?auto_600801 ?auto_600805 ) ) ( not ( = ?auto_600801 ?auto_600806 ) ) ( not ( = ?auto_600801 ?auto_600807 ) ) ( not ( = ?auto_600801 ?auto_600808 ) ) ( not ( = ?auto_600802 ?auto_600803 ) ) ( not ( = ?auto_600802 ?auto_600804 ) ) ( not ( = ?auto_600802 ?auto_600805 ) ) ( not ( = ?auto_600802 ?auto_600806 ) ) ( not ( = ?auto_600802 ?auto_600807 ) ) ( not ( = ?auto_600802 ?auto_600808 ) ) ( not ( = ?auto_600803 ?auto_600804 ) ) ( not ( = ?auto_600803 ?auto_600805 ) ) ( not ( = ?auto_600803 ?auto_600806 ) ) ( not ( = ?auto_600803 ?auto_600807 ) ) ( not ( = ?auto_600803 ?auto_600808 ) ) ( not ( = ?auto_600804 ?auto_600805 ) ) ( not ( = ?auto_600804 ?auto_600806 ) ) ( not ( = ?auto_600804 ?auto_600807 ) ) ( not ( = ?auto_600804 ?auto_600808 ) ) ( not ( = ?auto_600805 ?auto_600806 ) ) ( not ( = ?auto_600805 ?auto_600807 ) ) ( not ( = ?auto_600805 ?auto_600808 ) ) ( not ( = ?auto_600806 ?auto_600807 ) ) ( not ( = ?auto_600806 ?auto_600808 ) ) ( not ( = ?auto_600807 ?auto_600808 ) ) ( ON ?auto_600806 ?auto_600807 ) ( ON ?auto_600805 ?auto_600806 ) ( CLEAR ?auto_600803 ) ( ON ?auto_600804 ?auto_600805 ) ( CLEAR ?auto_600804 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_600795 ?auto_600796 ?auto_600797 ?auto_600798 ?auto_600799 ?auto_600800 ?auto_600801 ?auto_600802 ?auto_600803 ?auto_600804 )
      ( MAKE-13PILE ?auto_600795 ?auto_600796 ?auto_600797 ?auto_600798 ?auto_600799 ?auto_600800 ?auto_600801 ?auto_600802 ?auto_600803 ?auto_600804 ?auto_600805 ?auto_600806 ?auto_600807 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_600849 - BLOCK
      ?auto_600850 - BLOCK
      ?auto_600851 - BLOCK
      ?auto_600852 - BLOCK
      ?auto_600853 - BLOCK
      ?auto_600854 - BLOCK
      ?auto_600855 - BLOCK
      ?auto_600856 - BLOCK
      ?auto_600857 - BLOCK
      ?auto_600858 - BLOCK
      ?auto_600859 - BLOCK
      ?auto_600860 - BLOCK
      ?auto_600861 - BLOCK
    )
    :vars
    (
      ?auto_600862 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_600861 ?auto_600862 ) ( ON-TABLE ?auto_600849 ) ( ON ?auto_600850 ?auto_600849 ) ( ON ?auto_600851 ?auto_600850 ) ( ON ?auto_600852 ?auto_600851 ) ( ON ?auto_600853 ?auto_600852 ) ( ON ?auto_600854 ?auto_600853 ) ( ON ?auto_600855 ?auto_600854 ) ( ON ?auto_600856 ?auto_600855 ) ( not ( = ?auto_600849 ?auto_600850 ) ) ( not ( = ?auto_600849 ?auto_600851 ) ) ( not ( = ?auto_600849 ?auto_600852 ) ) ( not ( = ?auto_600849 ?auto_600853 ) ) ( not ( = ?auto_600849 ?auto_600854 ) ) ( not ( = ?auto_600849 ?auto_600855 ) ) ( not ( = ?auto_600849 ?auto_600856 ) ) ( not ( = ?auto_600849 ?auto_600857 ) ) ( not ( = ?auto_600849 ?auto_600858 ) ) ( not ( = ?auto_600849 ?auto_600859 ) ) ( not ( = ?auto_600849 ?auto_600860 ) ) ( not ( = ?auto_600849 ?auto_600861 ) ) ( not ( = ?auto_600849 ?auto_600862 ) ) ( not ( = ?auto_600850 ?auto_600851 ) ) ( not ( = ?auto_600850 ?auto_600852 ) ) ( not ( = ?auto_600850 ?auto_600853 ) ) ( not ( = ?auto_600850 ?auto_600854 ) ) ( not ( = ?auto_600850 ?auto_600855 ) ) ( not ( = ?auto_600850 ?auto_600856 ) ) ( not ( = ?auto_600850 ?auto_600857 ) ) ( not ( = ?auto_600850 ?auto_600858 ) ) ( not ( = ?auto_600850 ?auto_600859 ) ) ( not ( = ?auto_600850 ?auto_600860 ) ) ( not ( = ?auto_600850 ?auto_600861 ) ) ( not ( = ?auto_600850 ?auto_600862 ) ) ( not ( = ?auto_600851 ?auto_600852 ) ) ( not ( = ?auto_600851 ?auto_600853 ) ) ( not ( = ?auto_600851 ?auto_600854 ) ) ( not ( = ?auto_600851 ?auto_600855 ) ) ( not ( = ?auto_600851 ?auto_600856 ) ) ( not ( = ?auto_600851 ?auto_600857 ) ) ( not ( = ?auto_600851 ?auto_600858 ) ) ( not ( = ?auto_600851 ?auto_600859 ) ) ( not ( = ?auto_600851 ?auto_600860 ) ) ( not ( = ?auto_600851 ?auto_600861 ) ) ( not ( = ?auto_600851 ?auto_600862 ) ) ( not ( = ?auto_600852 ?auto_600853 ) ) ( not ( = ?auto_600852 ?auto_600854 ) ) ( not ( = ?auto_600852 ?auto_600855 ) ) ( not ( = ?auto_600852 ?auto_600856 ) ) ( not ( = ?auto_600852 ?auto_600857 ) ) ( not ( = ?auto_600852 ?auto_600858 ) ) ( not ( = ?auto_600852 ?auto_600859 ) ) ( not ( = ?auto_600852 ?auto_600860 ) ) ( not ( = ?auto_600852 ?auto_600861 ) ) ( not ( = ?auto_600852 ?auto_600862 ) ) ( not ( = ?auto_600853 ?auto_600854 ) ) ( not ( = ?auto_600853 ?auto_600855 ) ) ( not ( = ?auto_600853 ?auto_600856 ) ) ( not ( = ?auto_600853 ?auto_600857 ) ) ( not ( = ?auto_600853 ?auto_600858 ) ) ( not ( = ?auto_600853 ?auto_600859 ) ) ( not ( = ?auto_600853 ?auto_600860 ) ) ( not ( = ?auto_600853 ?auto_600861 ) ) ( not ( = ?auto_600853 ?auto_600862 ) ) ( not ( = ?auto_600854 ?auto_600855 ) ) ( not ( = ?auto_600854 ?auto_600856 ) ) ( not ( = ?auto_600854 ?auto_600857 ) ) ( not ( = ?auto_600854 ?auto_600858 ) ) ( not ( = ?auto_600854 ?auto_600859 ) ) ( not ( = ?auto_600854 ?auto_600860 ) ) ( not ( = ?auto_600854 ?auto_600861 ) ) ( not ( = ?auto_600854 ?auto_600862 ) ) ( not ( = ?auto_600855 ?auto_600856 ) ) ( not ( = ?auto_600855 ?auto_600857 ) ) ( not ( = ?auto_600855 ?auto_600858 ) ) ( not ( = ?auto_600855 ?auto_600859 ) ) ( not ( = ?auto_600855 ?auto_600860 ) ) ( not ( = ?auto_600855 ?auto_600861 ) ) ( not ( = ?auto_600855 ?auto_600862 ) ) ( not ( = ?auto_600856 ?auto_600857 ) ) ( not ( = ?auto_600856 ?auto_600858 ) ) ( not ( = ?auto_600856 ?auto_600859 ) ) ( not ( = ?auto_600856 ?auto_600860 ) ) ( not ( = ?auto_600856 ?auto_600861 ) ) ( not ( = ?auto_600856 ?auto_600862 ) ) ( not ( = ?auto_600857 ?auto_600858 ) ) ( not ( = ?auto_600857 ?auto_600859 ) ) ( not ( = ?auto_600857 ?auto_600860 ) ) ( not ( = ?auto_600857 ?auto_600861 ) ) ( not ( = ?auto_600857 ?auto_600862 ) ) ( not ( = ?auto_600858 ?auto_600859 ) ) ( not ( = ?auto_600858 ?auto_600860 ) ) ( not ( = ?auto_600858 ?auto_600861 ) ) ( not ( = ?auto_600858 ?auto_600862 ) ) ( not ( = ?auto_600859 ?auto_600860 ) ) ( not ( = ?auto_600859 ?auto_600861 ) ) ( not ( = ?auto_600859 ?auto_600862 ) ) ( not ( = ?auto_600860 ?auto_600861 ) ) ( not ( = ?auto_600860 ?auto_600862 ) ) ( not ( = ?auto_600861 ?auto_600862 ) ) ( ON ?auto_600860 ?auto_600861 ) ( ON ?auto_600859 ?auto_600860 ) ( ON ?auto_600858 ?auto_600859 ) ( CLEAR ?auto_600856 ) ( ON ?auto_600857 ?auto_600858 ) ( CLEAR ?auto_600857 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_600849 ?auto_600850 ?auto_600851 ?auto_600852 ?auto_600853 ?auto_600854 ?auto_600855 ?auto_600856 ?auto_600857 )
      ( MAKE-13PILE ?auto_600849 ?auto_600850 ?auto_600851 ?auto_600852 ?auto_600853 ?auto_600854 ?auto_600855 ?auto_600856 ?auto_600857 ?auto_600858 ?auto_600859 ?auto_600860 ?auto_600861 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_600903 - BLOCK
      ?auto_600904 - BLOCK
      ?auto_600905 - BLOCK
      ?auto_600906 - BLOCK
      ?auto_600907 - BLOCK
      ?auto_600908 - BLOCK
      ?auto_600909 - BLOCK
      ?auto_600910 - BLOCK
      ?auto_600911 - BLOCK
      ?auto_600912 - BLOCK
      ?auto_600913 - BLOCK
      ?auto_600914 - BLOCK
      ?auto_600915 - BLOCK
    )
    :vars
    (
      ?auto_600916 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_600915 ?auto_600916 ) ( ON-TABLE ?auto_600903 ) ( ON ?auto_600904 ?auto_600903 ) ( ON ?auto_600905 ?auto_600904 ) ( ON ?auto_600906 ?auto_600905 ) ( ON ?auto_600907 ?auto_600906 ) ( ON ?auto_600908 ?auto_600907 ) ( ON ?auto_600909 ?auto_600908 ) ( not ( = ?auto_600903 ?auto_600904 ) ) ( not ( = ?auto_600903 ?auto_600905 ) ) ( not ( = ?auto_600903 ?auto_600906 ) ) ( not ( = ?auto_600903 ?auto_600907 ) ) ( not ( = ?auto_600903 ?auto_600908 ) ) ( not ( = ?auto_600903 ?auto_600909 ) ) ( not ( = ?auto_600903 ?auto_600910 ) ) ( not ( = ?auto_600903 ?auto_600911 ) ) ( not ( = ?auto_600903 ?auto_600912 ) ) ( not ( = ?auto_600903 ?auto_600913 ) ) ( not ( = ?auto_600903 ?auto_600914 ) ) ( not ( = ?auto_600903 ?auto_600915 ) ) ( not ( = ?auto_600903 ?auto_600916 ) ) ( not ( = ?auto_600904 ?auto_600905 ) ) ( not ( = ?auto_600904 ?auto_600906 ) ) ( not ( = ?auto_600904 ?auto_600907 ) ) ( not ( = ?auto_600904 ?auto_600908 ) ) ( not ( = ?auto_600904 ?auto_600909 ) ) ( not ( = ?auto_600904 ?auto_600910 ) ) ( not ( = ?auto_600904 ?auto_600911 ) ) ( not ( = ?auto_600904 ?auto_600912 ) ) ( not ( = ?auto_600904 ?auto_600913 ) ) ( not ( = ?auto_600904 ?auto_600914 ) ) ( not ( = ?auto_600904 ?auto_600915 ) ) ( not ( = ?auto_600904 ?auto_600916 ) ) ( not ( = ?auto_600905 ?auto_600906 ) ) ( not ( = ?auto_600905 ?auto_600907 ) ) ( not ( = ?auto_600905 ?auto_600908 ) ) ( not ( = ?auto_600905 ?auto_600909 ) ) ( not ( = ?auto_600905 ?auto_600910 ) ) ( not ( = ?auto_600905 ?auto_600911 ) ) ( not ( = ?auto_600905 ?auto_600912 ) ) ( not ( = ?auto_600905 ?auto_600913 ) ) ( not ( = ?auto_600905 ?auto_600914 ) ) ( not ( = ?auto_600905 ?auto_600915 ) ) ( not ( = ?auto_600905 ?auto_600916 ) ) ( not ( = ?auto_600906 ?auto_600907 ) ) ( not ( = ?auto_600906 ?auto_600908 ) ) ( not ( = ?auto_600906 ?auto_600909 ) ) ( not ( = ?auto_600906 ?auto_600910 ) ) ( not ( = ?auto_600906 ?auto_600911 ) ) ( not ( = ?auto_600906 ?auto_600912 ) ) ( not ( = ?auto_600906 ?auto_600913 ) ) ( not ( = ?auto_600906 ?auto_600914 ) ) ( not ( = ?auto_600906 ?auto_600915 ) ) ( not ( = ?auto_600906 ?auto_600916 ) ) ( not ( = ?auto_600907 ?auto_600908 ) ) ( not ( = ?auto_600907 ?auto_600909 ) ) ( not ( = ?auto_600907 ?auto_600910 ) ) ( not ( = ?auto_600907 ?auto_600911 ) ) ( not ( = ?auto_600907 ?auto_600912 ) ) ( not ( = ?auto_600907 ?auto_600913 ) ) ( not ( = ?auto_600907 ?auto_600914 ) ) ( not ( = ?auto_600907 ?auto_600915 ) ) ( not ( = ?auto_600907 ?auto_600916 ) ) ( not ( = ?auto_600908 ?auto_600909 ) ) ( not ( = ?auto_600908 ?auto_600910 ) ) ( not ( = ?auto_600908 ?auto_600911 ) ) ( not ( = ?auto_600908 ?auto_600912 ) ) ( not ( = ?auto_600908 ?auto_600913 ) ) ( not ( = ?auto_600908 ?auto_600914 ) ) ( not ( = ?auto_600908 ?auto_600915 ) ) ( not ( = ?auto_600908 ?auto_600916 ) ) ( not ( = ?auto_600909 ?auto_600910 ) ) ( not ( = ?auto_600909 ?auto_600911 ) ) ( not ( = ?auto_600909 ?auto_600912 ) ) ( not ( = ?auto_600909 ?auto_600913 ) ) ( not ( = ?auto_600909 ?auto_600914 ) ) ( not ( = ?auto_600909 ?auto_600915 ) ) ( not ( = ?auto_600909 ?auto_600916 ) ) ( not ( = ?auto_600910 ?auto_600911 ) ) ( not ( = ?auto_600910 ?auto_600912 ) ) ( not ( = ?auto_600910 ?auto_600913 ) ) ( not ( = ?auto_600910 ?auto_600914 ) ) ( not ( = ?auto_600910 ?auto_600915 ) ) ( not ( = ?auto_600910 ?auto_600916 ) ) ( not ( = ?auto_600911 ?auto_600912 ) ) ( not ( = ?auto_600911 ?auto_600913 ) ) ( not ( = ?auto_600911 ?auto_600914 ) ) ( not ( = ?auto_600911 ?auto_600915 ) ) ( not ( = ?auto_600911 ?auto_600916 ) ) ( not ( = ?auto_600912 ?auto_600913 ) ) ( not ( = ?auto_600912 ?auto_600914 ) ) ( not ( = ?auto_600912 ?auto_600915 ) ) ( not ( = ?auto_600912 ?auto_600916 ) ) ( not ( = ?auto_600913 ?auto_600914 ) ) ( not ( = ?auto_600913 ?auto_600915 ) ) ( not ( = ?auto_600913 ?auto_600916 ) ) ( not ( = ?auto_600914 ?auto_600915 ) ) ( not ( = ?auto_600914 ?auto_600916 ) ) ( not ( = ?auto_600915 ?auto_600916 ) ) ( ON ?auto_600914 ?auto_600915 ) ( ON ?auto_600913 ?auto_600914 ) ( ON ?auto_600912 ?auto_600913 ) ( ON ?auto_600911 ?auto_600912 ) ( CLEAR ?auto_600909 ) ( ON ?auto_600910 ?auto_600911 ) ( CLEAR ?auto_600910 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_600903 ?auto_600904 ?auto_600905 ?auto_600906 ?auto_600907 ?auto_600908 ?auto_600909 ?auto_600910 )
      ( MAKE-13PILE ?auto_600903 ?auto_600904 ?auto_600905 ?auto_600906 ?auto_600907 ?auto_600908 ?auto_600909 ?auto_600910 ?auto_600911 ?auto_600912 ?auto_600913 ?auto_600914 ?auto_600915 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_600957 - BLOCK
      ?auto_600958 - BLOCK
      ?auto_600959 - BLOCK
      ?auto_600960 - BLOCK
      ?auto_600961 - BLOCK
      ?auto_600962 - BLOCK
      ?auto_600963 - BLOCK
      ?auto_600964 - BLOCK
      ?auto_600965 - BLOCK
      ?auto_600966 - BLOCK
      ?auto_600967 - BLOCK
      ?auto_600968 - BLOCK
      ?auto_600969 - BLOCK
    )
    :vars
    (
      ?auto_600970 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_600969 ?auto_600970 ) ( ON-TABLE ?auto_600957 ) ( ON ?auto_600958 ?auto_600957 ) ( ON ?auto_600959 ?auto_600958 ) ( ON ?auto_600960 ?auto_600959 ) ( ON ?auto_600961 ?auto_600960 ) ( ON ?auto_600962 ?auto_600961 ) ( not ( = ?auto_600957 ?auto_600958 ) ) ( not ( = ?auto_600957 ?auto_600959 ) ) ( not ( = ?auto_600957 ?auto_600960 ) ) ( not ( = ?auto_600957 ?auto_600961 ) ) ( not ( = ?auto_600957 ?auto_600962 ) ) ( not ( = ?auto_600957 ?auto_600963 ) ) ( not ( = ?auto_600957 ?auto_600964 ) ) ( not ( = ?auto_600957 ?auto_600965 ) ) ( not ( = ?auto_600957 ?auto_600966 ) ) ( not ( = ?auto_600957 ?auto_600967 ) ) ( not ( = ?auto_600957 ?auto_600968 ) ) ( not ( = ?auto_600957 ?auto_600969 ) ) ( not ( = ?auto_600957 ?auto_600970 ) ) ( not ( = ?auto_600958 ?auto_600959 ) ) ( not ( = ?auto_600958 ?auto_600960 ) ) ( not ( = ?auto_600958 ?auto_600961 ) ) ( not ( = ?auto_600958 ?auto_600962 ) ) ( not ( = ?auto_600958 ?auto_600963 ) ) ( not ( = ?auto_600958 ?auto_600964 ) ) ( not ( = ?auto_600958 ?auto_600965 ) ) ( not ( = ?auto_600958 ?auto_600966 ) ) ( not ( = ?auto_600958 ?auto_600967 ) ) ( not ( = ?auto_600958 ?auto_600968 ) ) ( not ( = ?auto_600958 ?auto_600969 ) ) ( not ( = ?auto_600958 ?auto_600970 ) ) ( not ( = ?auto_600959 ?auto_600960 ) ) ( not ( = ?auto_600959 ?auto_600961 ) ) ( not ( = ?auto_600959 ?auto_600962 ) ) ( not ( = ?auto_600959 ?auto_600963 ) ) ( not ( = ?auto_600959 ?auto_600964 ) ) ( not ( = ?auto_600959 ?auto_600965 ) ) ( not ( = ?auto_600959 ?auto_600966 ) ) ( not ( = ?auto_600959 ?auto_600967 ) ) ( not ( = ?auto_600959 ?auto_600968 ) ) ( not ( = ?auto_600959 ?auto_600969 ) ) ( not ( = ?auto_600959 ?auto_600970 ) ) ( not ( = ?auto_600960 ?auto_600961 ) ) ( not ( = ?auto_600960 ?auto_600962 ) ) ( not ( = ?auto_600960 ?auto_600963 ) ) ( not ( = ?auto_600960 ?auto_600964 ) ) ( not ( = ?auto_600960 ?auto_600965 ) ) ( not ( = ?auto_600960 ?auto_600966 ) ) ( not ( = ?auto_600960 ?auto_600967 ) ) ( not ( = ?auto_600960 ?auto_600968 ) ) ( not ( = ?auto_600960 ?auto_600969 ) ) ( not ( = ?auto_600960 ?auto_600970 ) ) ( not ( = ?auto_600961 ?auto_600962 ) ) ( not ( = ?auto_600961 ?auto_600963 ) ) ( not ( = ?auto_600961 ?auto_600964 ) ) ( not ( = ?auto_600961 ?auto_600965 ) ) ( not ( = ?auto_600961 ?auto_600966 ) ) ( not ( = ?auto_600961 ?auto_600967 ) ) ( not ( = ?auto_600961 ?auto_600968 ) ) ( not ( = ?auto_600961 ?auto_600969 ) ) ( not ( = ?auto_600961 ?auto_600970 ) ) ( not ( = ?auto_600962 ?auto_600963 ) ) ( not ( = ?auto_600962 ?auto_600964 ) ) ( not ( = ?auto_600962 ?auto_600965 ) ) ( not ( = ?auto_600962 ?auto_600966 ) ) ( not ( = ?auto_600962 ?auto_600967 ) ) ( not ( = ?auto_600962 ?auto_600968 ) ) ( not ( = ?auto_600962 ?auto_600969 ) ) ( not ( = ?auto_600962 ?auto_600970 ) ) ( not ( = ?auto_600963 ?auto_600964 ) ) ( not ( = ?auto_600963 ?auto_600965 ) ) ( not ( = ?auto_600963 ?auto_600966 ) ) ( not ( = ?auto_600963 ?auto_600967 ) ) ( not ( = ?auto_600963 ?auto_600968 ) ) ( not ( = ?auto_600963 ?auto_600969 ) ) ( not ( = ?auto_600963 ?auto_600970 ) ) ( not ( = ?auto_600964 ?auto_600965 ) ) ( not ( = ?auto_600964 ?auto_600966 ) ) ( not ( = ?auto_600964 ?auto_600967 ) ) ( not ( = ?auto_600964 ?auto_600968 ) ) ( not ( = ?auto_600964 ?auto_600969 ) ) ( not ( = ?auto_600964 ?auto_600970 ) ) ( not ( = ?auto_600965 ?auto_600966 ) ) ( not ( = ?auto_600965 ?auto_600967 ) ) ( not ( = ?auto_600965 ?auto_600968 ) ) ( not ( = ?auto_600965 ?auto_600969 ) ) ( not ( = ?auto_600965 ?auto_600970 ) ) ( not ( = ?auto_600966 ?auto_600967 ) ) ( not ( = ?auto_600966 ?auto_600968 ) ) ( not ( = ?auto_600966 ?auto_600969 ) ) ( not ( = ?auto_600966 ?auto_600970 ) ) ( not ( = ?auto_600967 ?auto_600968 ) ) ( not ( = ?auto_600967 ?auto_600969 ) ) ( not ( = ?auto_600967 ?auto_600970 ) ) ( not ( = ?auto_600968 ?auto_600969 ) ) ( not ( = ?auto_600968 ?auto_600970 ) ) ( not ( = ?auto_600969 ?auto_600970 ) ) ( ON ?auto_600968 ?auto_600969 ) ( ON ?auto_600967 ?auto_600968 ) ( ON ?auto_600966 ?auto_600967 ) ( ON ?auto_600965 ?auto_600966 ) ( ON ?auto_600964 ?auto_600965 ) ( CLEAR ?auto_600962 ) ( ON ?auto_600963 ?auto_600964 ) ( CLEAR ?auto_600963 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_600957 ?auto_600958 ?auto_600959 ?auto_600960 ?auto_600961 ?auto_600962 ?auto_600963 )
      ( MAKE-13PILE ?auto_600957 ?auto_600958 ?auto_600959 ?auto_600960 ?auto_600961 ?auto_600962 ?auto_600963 ?auto_600964 ?auto_600965 ?auto_600966 ?auto_600967 ?auto_600968 ?auto_600969 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_601011 - BLOCK
      ?auto_601012 - BLOCK
      ?auto_601013 - BLOCK
      ?auto_601014 - BLOCK
      ?auto_601015 - BLOCK
      ?auto_601016 - BLOCK
      ?auto_601017 - BLOCK
      ?auto_601018 - BLOCK
      ?auto_601019 - BLOCK
      ?auto_601020 - BLOCK
      ?auto_601021 - BLOCK
      ?auto_601022 - BLOCK
      ?auto_601023 - BLOCK
    )
    :vars
    (
      ?auto_601024 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_601023 ?auto_601024 ) ( ON-TABLE ?auto_601011 ) ( ON ?auto_601012 ?auto_601011 ) ( ON ?auto_601013 ?auto_601012 ) ( ON ?auto_601014 ?auto_601013 ) ( ON ?auto_601015 ?auto_601014 ) ( not ( = ?auto_601011 ?auto_601012 ) ) ( not ( = ?auto_601011 ?auto_601013 ) ) ( not ( = ?auto_601011 ?auto_601014 ) ) ( not ( = ?auto_601011 ?auto_601015 ) ) ( not ( = ?auto_601011 ?auto_601016 ) ) ( not ( = ?auto_601011 ?auto_601017 ) ) ( not ( = ?auto_601011 ?auto_601018 ) ) ( not ( = ?auto_601011 ?auto_601019 ) ) ( not ( = ?auto_601011 ?auto_601020 ) ) ( not ( = ?auto_601011 ?auto_601021 ) ) ( not ( = ?auto_601011 ?auto_601022 ) ) ( not ( = ?auto_601011 ?auto_601023 ) ) ( not ( = ?auto_601011 ?auto_601024 ) ) ( not ( = ?auto_601012 ?auto_601013 ) ) ( not ( = ?auto_601012 ?auto_601014 ) ) ( not ( = ?auto_601012 ?auto_601015 ) ) ( not ( = ?auto_601012 ?auto_601016 ) ) ( not ( = ?auto_601012 ?auto_601017 ) ) ( not ( = ?auto_601012 ?auto_601018 ) ) ( not ( = ?auto_601012 ?auto_601019 ) ) ( not ( = ?auto_601012 ?auto_601020 ) ) ( not ( = ?auto_601012 ?auto_601021 ) ) ( not ( = ?auto_601012 ?auto_601022 ) ) ( not ( = ?auto_601012 ?auto_601023 ) ) ( not ( = ?auto_601012 ?auto_601024 ) ) ( not ( = ?auto_601013 ?auto_601014 ) ) ( not ( = ?auto_601013 ?auto_601015 ) ) ( not ( = ?auto_601013 ?auto_601016 ) ) ( not ( = ?auto_601013 ?auto_601017 ) ) ( not ( = ?auto_601013 ?auto_601018 ) ) ( not ( = ?auto_601013 ?auto_601019 ) ) ( not ( = ?auto_601013 ?auto_601020 ) ) ( not ( = ?auto_601013 ?auto_601021 ) ) ( not ( = ?auto_601013 ?auto_601022 ) ) ( not ( = ?auto_601013 ?auto_601023 ) ) ( not ( = ?auto_601013 ?auto_601024 ) ) ( not ( = ?auto_601014 ?auto_601015 ) ) ( not ( = ?auto_601014 ?auto_601016 ) ) ( not ( = ?auto_601014 ?auto_601017 ) ) ( not ( = ?auto_601014 ?auto_601018 ) ) ( not ( = ?auto_601014 ?auto_601019 ) ) ( not ( = ?auto_601014 ?auto_601020 ) ) ( not ( = ?auto_601014 ?auto_601021 ) ) ( not ( = ?auto_601014 ?auto_601022 ) ) ( not ( = ?auto_601014 ?auto_601023 ) ) ( not ( = ?auto_601014 ?auto_601024 ) ) ( not ( = ?auto_601015 ?auto_601016 ) ) ( not ( = ?auto_601015 ?auto_601017 ) ) ( not ( = ?auto_601015 ?auto_601018 ) ) ( not ( = ?auto_601015 ?auto_601019 ) ) ( not ( = ?auto_601015 ?auto_601020 ) ) ( not ( = ?auto_601015 ?auto_601021 ) ) ( not ( = ?auto_601015 ?auto_601022 ) ) ( not ( = ?auto_601015 ?auto_601023 ) ) ( not ( = ?auto_601015 ?auto_601024 ) ) ( not ( = ?auto_601016 ?auto_601017 ) ) ( not ( = ?auto_601016 ?auto_601018 ) ) ( not ( = ?auto_601016 ?auto_601019 ) ) ( not ( = ?auto_601016 ?auto_601020 ) ) ( not ( = ?auto_601016 ?auto_601021 ) ) ( not ( = ?auto_601016 ?auto_601022 ) ) ( not ( = ?auto_601016 ?auto_601023 ) ) ( not ( = ?auto_601016 ?auto_601024 ) ) ( not ( = ?auto_601017 ?auto_601018 ) ) ( not ( = ?auto_601017 ?auto_601019 ) ) ( not ( = ?auto_601017 ?auto_601020 ) ) ( not ( = ?auto_601017 ?auto_601021 ) ) ( not ( = ?auto_601017 ?auto_601022 ) ) ( not ( = ?auto_601017 ?auto_601023 ) ) ( not ( = ?auto_601017 ?auto_601024 ) ) ( not ( = ?auto_601018 ?auto_601019 ) ) ( not ( = ?auto_601018 ?auto_601020 ) ) ( not ( = ?auto_601018 ?auto_601021 ) ) ( not ( = ?auto_601018 ?auto_601022 ) ) ( not ( = ?auto_601018 ?auto_601023 ) ) ( not ( = ?auto_601018 ?auto_601024 ) ) ( not ( = ?auto_601019 ?auto_601020 ) ) ( not ( = ?auto_601019 ?auto_601021 ) ) ( not ( = ?auto_601019 ?auto_601022 ) ) ( not ( = ?auto_601019 ?auto_601023 ) ) ( not ( = ?auto_601019 ?auto_601024 ) ) ( not ( = ?auto_601020 ?auto_601021 ) ) ( not ( = ?auto_601020 ?auto_601022 ) ) ( not ( = ?auto_601020 ?auto_601023 ) ) ( not ( = ?auto_601020 ?auto_601024 ) ) ( not ( = ?auto_601021 ?auto_601022 ) ) ( not ( = ?auto_601021 ?auto_601023 ) ) ( not ( = ?auto_601021 ?auto_601024 ) ) ( not ( = ?auto_601022 ?auto_601023 ) ) ( not ( = ?auto_601022 ?auto_601024 ) ) ( not ( = ?auto_601023 ?auto_601024 ) ) ( ON ?auto_601022 ?auto_601023 ) ( ON ?auto_601021 ?auto_601022 ) ( ON ?auto_601020 ?auto_601021 ) ( ON ?auto_601019 ?auto_601020 ) ( ON ?auto_601018 ?auto_601019 ) ( ON ?auto_601017 ?auto_601018 ) ( CLEAR ?auto_601015 ) ( ON ?auto_601016 ?auto_601017 ) ( CLEAR ?auto_601016 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_601011 ?auto_601012 ?auto_601013 ?auto_601014 ?auto_601015 ?auto_601016 )
      ( MAKE-13PILE ?auto_601011 ?auto_601012 ?auto_601013 ?auto_601014 ?auto_601015 ?auto_601016 ?auto_601017 ?auto_601018 ?auto_601019 ?auto_601020 ?auto_601021 ?auto_601022 ?auto_601023 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_601065 - BLOCK
      ?auto_601066 - BLOCK
      ?auto_601067 - BLOCK
      ?auto_601068 - BLOCK
      ?auto_601069 - BLOCK
      ?auto_601070 - BLOCK
      ?auto_601071 - BLOCK
      ?auto_601072 - BLOCK
      ?auto_601073 - BLOCK
      ?auto_601074 - BLOCK
      ?auto_601075 - BLOCK
      ?auto_601076 - BLOCK
      ?auto_601077 - BLOCK
    )
    :vars
    (
      ?auto_601078 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_601077 ?auto_601078 ) ( ON-TABLE ?auto_601065 ) ( ON ?auto_601066 ?auto_601065 ) ( ON ?auto_601067 ?auto_601066 ) ( ON ?auto_601068 ?auto_601067 ) ( not ( = ?auto_601065 ?auto_601066 ) ) ( not ( = ?auto_601065 ?auto_601067 ) ) ( not ( = ?auto_601065 ?auto_601068 ) ) ( not ( = ?auto_601065 ?auto_601069 ) ) ( not ( = ?auto_601065 ?auto_601070 ) ) ( not ( = ?auto_601065 ?auto_601071 ) ) ( not ( = ?auto_601065 ?auto_601072 ) ) ( not ( = ?auto_601065 ?auto_601073 ) ) ( not ( = ?auto_601065 ?auto_601074 ) ) ( not ( = ?auto_601065 ?auto_601075 ) ) ( not ( = ?auto_601065 ?auto_601076 ) ) ( not ( = ?auto_601065 ?auto_601077 ) ) ( not ( = ?auto_601065 ?auto_601078 ) ) ( not ( = ?auto_601066 ?auto_601067 ) ) ( not ( = ?auto_601066 ?auto_601068 ) ) ( not ( = ?auto_601066 ?auto_601069 ) ) ( not ( = ?auto_601066 ?auto_601070 ) ) ( not ( = ?auto_601066 ?auto_601071 ) ) ( not ( = ?auto_601066 ?auto_601072 ) ) ( not ( = ?auto_601066 ?auto_601073 ) ) ( not ( = ?auto_601066 ?auto_601074 ) ) ( not ( = ?auto_601066 ?auto_601075 ) ) ( not ( = ?auto_601066 ?auto_601076 ) ) ( not ( = ?auto_601066 ?auto_601077 ) ) ( not ( = ?auto_601066 ?auto_601078 ) ) ( not ( = ?auto_601067 ?auto_601068 ) ) ( not ( = ?auto_601067 ?auto_601069 ) ) ( not ( = ?auto_601067 ?auto_601070 ) ) ( not ( = ?auto_601067 ?auto_601071 ) ) ( not ( = ?auto_601067 ?auto_601072 ) ) ( not ( = ?auto_601067 ?auto_601073 ) ) ( not ( = ?auto_601067 ?auto_601074 ) ) ( not ( = ?auto_601067 ?auto_601075 ) ) ( not ( = ?auto_601067 ?auto_601076 ) ) ( not ( = ?auto_601067 ?auto_601077 ) ) ( not ( = ?auto_601067 ?auto_601078 ) ) ( not ( = ?auto_601068 ?auto_601069 ) ) ( not ( = ?auto_601068 ?auto_601070 ) ) ( not ( = ?auto_601068 ?auto_601071 ) ) ( not ( = ?auto_601068 ?auto_601072 ) ) ( not ( = ?auto_601068 ?auto_601073 ) ) ( not ( = ?auto_601068 ?auto_601074 ) ) ( not ( = ?auto_601068 ?auto_601075 ) ) ( not ( = ?auto_601068 ?auto_601076 ) ) ( not ( = ?auto_601068 ?auto_601077 ) ) ( not ( = ?auto_601068 ?auto_601078 ) ) ( not ( = ?auto_601069 ?auto_601070 ) ) ( not ( = ?auto_601069 ?auto_601071 ) ) ( not ( = ?auto_601069 ?auto_601072 ) ) ( not ( = ?auto_601069 ?auto_601073 ) ) ( not ( = ?auto_601069 ?auto_601074 ) ) ( not ( = ?auto_601069 ?auto_601075 ) ) ( not ( = ?auto_601069 ?auto_601076 ) ) ( not ( = ?auto_601069 ?auto_601077 ) ) ( not ( = ?auto_601069 ?auto_601078 ) ) ( not ( = ?auto_601070 ?auto_601071 ) ) ( not ( = ?auto_601070 ?auto_601072 ) ) ( not ( = ?auto_601070 ?auto_601073 ) ) ( not ( = ?auto_601070 ?auto_601074 ) ) ( not ( = ?auto_601070 ?auto_601075 ) ) ( not ( = ?auto_601070 ?auto_601076 ) ) ( not ( = ?auto_601070 ?auto_601077 ) ) ( not ( = ?auto_601070 ?auto_601078 ) ) ( not ( = ?auto_601071 ?auto_601072 ) ) ( not ( = ?auto_601071 ?auto_601073 ) ) ( not ( = ?auto_601071 ?auto_601074 ) ) ( not ( = ?auto_601071 ?auto_601075 ) ) ( not ( = ?auto_601071 ?auto_601076 ) ) ( not ( = ?auto_601071 ?auto_601077 ) ) ( not ( = ?auto_601071 ?auto_601078 ) ) ( not ( = ?auto_601072 ?auto_601073 ) ) ( not ( = ?auto_601072 ?auto_601074 ) ) ( not ( = ?auto_601072 ?auto_601075 ) ) ( not ( = ?auto_601072 ?auto_601076 ) ) ( not ( = ?auto_601072 ?auto_601077 ) ) ( not ( = ?auto_601072 ?auto_601078 ) ) ( not ( = ?auto_601073 ?auto_601074 ) ) ( not ( = ?auto_601073 ?auto_601075 ) ) ( not ( = ?auto_601073 ?auto_601076 ) ) ( not ( = ?auto_601073 ?auto_601077 ) ) ( not ( = ?auto_601073 ?auto_601078 ) ) ( not ( = ?auto_601074 ?auto_601075 ) ) ( not ( = ?auto_601074 ?auto_601076 ) ) ( not ( = ?auto_601074 ?auto_601077 ) ) ( not ( = ?auto_601074 ?auto_601078 ) ) ( not ( = ?auto_601075 ?auto_601076 ) ) ( not ( = ?auto_601075 ?auto_601077 ) ) ( not ( = ?auto_601075 ?auto_601078 ) ) ( not ( = ?auto_601076 ?auto_601077 ) ) ( not ( = ?auto_601076 ?auto_601078 ) ) ( not ( = ?auto_601077 ?auto_601078 ) ) ( ON ?auto_601076 ?auto_601077 ) ( ON ?auto_601075 ?auto_601076 ) ( ON ?auto_601074 ?auto_601075 ) ( ON ?auto_601073 ?auto_601074 ) ( ON ?auto_601072 ?auto_601073 ) ( ON ?auto_601071 ?auto_601072 ) ( ON ?auto_601070 ?auto_601071 ) ( CLEAR ?auto_601068 ) ( ON ?auto_601069 ?auto_601070 ) ( CLEAR ?auto_601069 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_601065 ?auto_601066 ?auto_601067 ?auto_601068 ?auto_601069 )
      ( MAKE-13PILE ?auto_601065 ?auto_601066 ?auto_601067 ?auto_601068 ?auto_601069 ?auto_601070 ?auto_601071 ?auto_601072 ?auto_601073 ?auto_601074 ?auto_601075 ?auto_601076 ?auto_601077 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_601119 - BLOCK
      ?auto_601120 - BLOCK
      ?auto_601121 - BLOCK
      ?auto_601122 - BLOCK
      ?auto_601123 - BLOCK
      ?auto_601124 - BLOCK
      ?auto_601125 - BLOCK
      ?auto_601126 - BLOCK
      ?auto_601127 - BLOCK
      ?auto_601128 - BLOCK
      ?auto_601129 - BLOCK
      ?auto_601130 - BLOCK
      ?auto_601131 - BLOCK
    )
    :vars
    (
      ?auto_601132 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_601131 ?auto_601132 ) ( ON-TABLE ?auto_601119 ) ( ON ?auto_601120 ?auto_601119 ) ( ON ?auto_601121 ?auto_601120 ) ( not ( = ?auto_601119 ?auto_601120 ) ) ( not ( = ?auto_601119 ?auto_601121 ) ) ( not ( = ?auto_601119 ?auto_601122 ) ) ( not ( = ?auto_601119 ?auto_601123 ) ) ( not ( = ?auto_601119 ?auto_601124 ) ) ( not ( = ?auto_601119 ?auto_601125 ) ) ( not ( = ?auto_601119 ?auto_601126 ) ) ( not ( = ?auto_601119 ?auto_601127 ) ) ( not ( = ?auto_601119 ?auto_601128 ) ) ( not ( = ?auto_601119 ?auto_601129 ) ) ( not ( = ?auto_601119 ?auto_601130 ) ) ( not ( = ?auto_601119 ?auto_601131 ) ) ( not ( = ?auto_601119 ?auto_601132 ) ) ( not ( = ?auto_601120 ?auto_601121 ) ) ( not ( = ?auto_601120 ?auto_601122 ) ) ( not ( = ?auto_601120 ?auto_601123 ) ) ( not ( = ?auto_601120 ?auto_601124 ) ) ( not ( = ?auto_601120 ?auto_601125 ) ) ( not ( = ?auto_601120 ?auto_601126 ) ) ( not ( = ?auto_601120 ?auto_601127 ) ) ( not ( = ?auto_601120 ?auto_601128 ) ) ( not ( = ?auto_601120 ?auto_601129 ) ) ( not ( = ?auto_601120 ?auto_601130 ) ) ( not ( = ?auto_601120 ?auto_601131 ) ) ( not ( = ?auto_601120 ?auto_601132 ) ) ( not ( = ?auto_601121 ?auto_601122 ) ) ( not ( = ?auto_601121 ?auto_601123 ) ) ( not ( = ?auto_601121 ?auto_601124 ) ) ( not ( = ?auto_601121 ?auto_601125 ) ) ( not ( = ?auto_601121 ?auto_601126 ) ) ( not ( = ?auto_601121 ?auto_601127 ) ) ( not ( = ?auto_601121 ?auto_601128 ) ) ( not ( = ?auto_601121 ?auto_601129 ) ) ( not ( = ?auto_601121 ?auto_601130 ) ) ( not ( = ?auto_601121 ?auto_601131 ) ) ( not ( = ?auto_601121 ?auto_601132 ) ) ( not ( = ?auto_601122 ?auto_601123 ) ) ( not ( = ?auto_601122 ?auto_601124 ) ) ( not ( = ?auto_601122 ?auto_601125 ) ) ( not ( = ?auto_601122 ?auto_601126 ) ) ( not ( = ?auto_601122 ?auto_601127 ) ) ( not ( = ?auto_601122 ?auto_601128 ) ) ( not ( = ?auto_601122 ?auto_601129 ) ) ( not ( = ?auto_601122 ?auto_601130 ) ) ( not ( = ?auto_601122 ?auto_601131 ) ) ( not ( = ?auto_601122 ?auto_601132 ) ) ( not ( = ?auto_601123 ?auto_601124 ) ) ( not ( = ?auto_601123 ?auto_601125 ) ) ( not ( = ?auto_601123 ?auto_601126 ) ) ( not ( = ?auto_601123 ?auto_601127 ) ) ( not ( = ?auto_601123 ?auto_601128 ) ) ( not ( = ?auto_601123 ?auto_601129 ) ) ( not ( = ?auto_601123 ?auto_601130 ) ) ( not ( = ?auto_601123 ?auto_601131 ) ) ( not ( = ?auto_601123 ?auto_601132 ) ) ( not ( = ?auto_601124 ?auto_601125 ) ) ( not ( = ?auto_601124 ?auto_601126 ) ) ( not ( = ?auto_601124 ?auto_601127 ) ) ( not ( = ?auto_601124 ?auto_601128 ) ) ( not ( = ?auto_601124 ?auto_601129 ) ) ( not ( = ?auto_601124 ?auto_601130 ) ) ( not ( = ?auto_601124 ?auto_601131 ) ) ( not ( = ?auto_601124 ?auto_601132 ) ) ( not ( = ?auto_601125 ?auto_601126 ) ) ( not ( = ?auto_601125 ?auto_601127 ) ) ( not ( = ?auto_601125 ?auto_601128 ) ) ( not ( = ?auto_601125 ?auto_601129 ) ) ( not ( = ?auto_601125 ?auto_601130 ) ) ( not ( = ?auto_601125 ?auto_601131 ) ) ( not ( = ?auto_601125 ?auto_601132 ) ) ( not ( = ?auto_601126 ?auto_601127 ) ) ( not ( = ?auto_601126 ?auto_601128 ) ) ( not ( = ?auto_601126 ?auto_601129 ) ) ( not ( = ?auto_601126 ?auto_601130 ) ) ( not ( = ?auto_601126 ?auto_601131 ) ) ( not ( = ?auto_601126 ?auto_601132 ) ) ( not ( = ?auto_601127 ?auto_601128 ) ) ( not ( = ?auto_601127 ?auto_601129 ) ) ( not ( = ?auto_601127 ?auto_601130 ) ) ( not ( = ?auto_601127 ?auto_601131 ) ) ( not ( = ?auto_601127 ?auto_601132 ) ) ( not ( = ?auto_601128 ?auto_601129 ) ) ( not ( = ?auto_601128 ?auto_601130 ) ) ( not ( = ?auto_601128 ?auto_601131 ) ) ( not ( = ?auto_601128 ?auto_601132 ) ) ( not ( = ?auto_601129 ?auto_601130 ) ) ( not ( = ?auto_601129 ?auto_601131 ) ) ( not ( = ?auto_601129 ?auto_601132 ) ) ( not ( = ?auto_601130 ?auto_601131 ) ) ( not ( = ?auto_601130 ?auto_601132 ) ) ( not ( = ?auto_601131 ?auto_601132 ) ) ( ON ?auto_601130 ?auto_601131 ) ( ON ?auto_601129 ?auto_601130 ) ( ON ?auto_601128 ?auto_601129 ) ( ON ?auto_601127 ?auto_601128 ) ( ON ?auto_601126 ?auto_601127 ) ( ON ?auto_601125 ?auto_601126 ) ( ON ?auto_601124 ?auto_601125 ) ( ON ?auto_601123 ?auto_601124 ) ( CLEAR ?auto_601121 ) ( ON ?auto_601122 ?auto_601123 ) ( CLEAR ?auto_601122 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_601119 ?auto_601120 ?auto_601121 ?auto_601122 )
      ( MAKE-13PILE ?auto_601119 ?auto_601120 ?auto_601121 ?auto_601122 ?auto_601123 ?auto_601124 ?auto_601125 ?auto_601126 ?auto_601127 ?auto_601128 ?auto_601129 ?auto_601130 ?auto_601131 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_601173 - BLOCK
      ?auto_601174 - BLOCK
      ?auto_601175 - BLOCK
      ?auto_601176 - BLOCK
      ?auto_601177 - BLOCK
      ?auto_601178 - BLOCK
      ?auto_601179 - BLOCK
      ?auto_601180 - BLOCK
      ?auto_601181 - BLOCK
      ?auto_601182 - BLOCK
      ?auto_601183 - BLOCK
      ?auto_601184 - BLOCK
      ?auto_601185 - BLOCK
    )
    :vars
    (
      ?auto_601186 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_601185 ?auto_601186 ) ( ON-TABLE ?auto_601173 ) ( ON ?auto_601174 ?auto_601173 ) ( not ( = ?auto_601173 ?auto_601174 ) ) ( not ( = ?auto_601173 ?auto_601175 ) ) ( not ( = ?auto_601173 ?auto_601176 ) ) ( not ( = ?auto_601173 ?auto_601177 ) ) ( not ( = ?auto_601173 ?auto_601178 ) ) ( not ( = ?auto_601173 ?auto_601179 ) ) ( not ( = ?auto_601173 ?auto_601180 ) ) ( not ( = ?auto_601173 ?auto_601181 ) ) ( not ( = ?auto_601173 ?auto_601182 ) ) ( not ( = ?auto_601173 ?auto_601183 ) ) ( not ( = ?auto_601173 ?auto_601184 ) ) ( not ( = ?auto_601173 ?auto_601185 ) ) ( not ( = ?auto_601173 ?auto_601186 ) ) ( not ( = ?auto_601174 ?auto_601175 ) ) ( not ( = ?auto_601174 ?auto_601176 ) ) ( not ( = ?auto_601174 ?auto_601177 ) ) ( not ( = ?auto_601174 ?auto_601178 ) ) ( not ( = ?auto_601174 ?auto_601179 ) ) ( not ( = ?auto_601174 ?auto_601180 ) ) ( not ( = ?auto_601174 ?auto_601181 ) ) ( not ( = ?auto_601174 ?auto_601182 ) ) ( not ( = ?auto_601174 ?auto_601183 ) ) ( not ( = ?auto_601174 ?auto_601184 ) ) ( not ( = ?auto_601174 ?auto_601185 ) ) ( not ( = ?auto_601174 ?auto_601186 ) ) ( not ( = ?auto_601175 ?auto_601176 ) ) ( not ( = ?auto_601175 ?auto_601177 ) ) ( not ( = ?auto_601175 ?auto_601178 ) ) ( not ( = ?auto_601175 ?auto_601179 ) ) ( not ( = ?auto_601175 ?auto_601180 ) ) ( not ( = ?auto_601175 ?auto_601181 ) ) ( not ( = ?auto_601175 ?auto_601182 ) ) ( not ( = ?auto_601175 ?auto_601183 ) ) ( not ( = ?auto_601175 ?auto_601184 ) ) ( not ( = ?auto_601175 ?auto_601185 ) ) ( not ( = ?auto_601175 ?auto_601186 ) ) ( not ( = ?auto_601176 ?auto_601177 ) ) ( not ( = ?auto_601176 ?auto_601178 ) ) ( not ( = ?auto_601176 ?auto_601179 ) ) ( not ( = ?auto_601176 ?auto_601180 ) ) ( not ( = ?auto_601176 ?auto_601181 ) ) ( not ( = ?auto_601176 ?auto_601182 ) ) ( not ( = ?auto_601176 ?auto_601183 ) ) ( not ( = ?auto_601176 ?auto_601184 ) ) ( not ( = ?auto_601176 ?auto_601185 ) ) ( not ( = ?auto_601176 ?auto_601186 ) ) ( not ( = ?auto_601177 ?auto_601178 ) ) ( not ( = ?auto_601177 ?auto_601179 ) ) ( not ( = ?auto_601177 ?auto_601180 ) ) ( not ( = ?auto_601177 ?auto_601181 ) ) ( not ( = ?auto_601177 ?auto_601182 ) ) ( not ( = ?auto_601177 ?auto_601183 ) ) ( not ( = ?auto_601177 ?auto_601184 ) ) ( not ( = ?auto_601177 ?auto_601185 ) ) ( not ( = ?auto_601177 ?auto_601186 ) ) ( not ( = ?auto_601178 ?auto_601179 ) ) ( not ( = ?auto_601178 ?auto_601180 ) ) ( not ( = ?auto_601178 ?auto_601181 ) ) ( not ( = ?auto_601178 ?auto_601182 ) ) ( not ( = ?auto_601178 ?auto_601183 ) ) ( not ( = ?auto_601178 ?auto_601184 ) ) ( not ( = ?auto_601178 ?auto_601185 ) ) ( not ( = ?auto_601178 ?auto_601186 ) ) ( not ( = ?auto_601179 ?auto_601180 ) ) ( not ( = ?auto_601179 ?auto_601181 ) ) ( not ( = ?auto_601179 ?auto_601182 ) ) ( not ( = ?auto_601179 ?auto_601183 ) ) ( not ( = ?auto_601179 ?auto_601184 ) ) ( not ( = ?auto_601179 ?auto_601185 ) ) ( not ( = ?auto_601179 ?auto_601186 ) ) ( not ( = ?auto_601180 ?auto_601181 ) ) ( not ( = ?auto_601180 ?auto_601182 ) ) ( not ( = ?auto_601180 ?auto_601183 ) ) ( not ( = ?auto_601180 ?auto_601184 ) ) ( not ( = ?auto_601180 ?auto_601185 ) ) ( not ( = ?auto_601180 ?auto_601186 ) ) ( not ( = ?auto_601181 ?auto_601182 ) ) ( not ( = ?auto_601181 ?auto_601183 ) ) ( not ( = ?auto_601181 ?auto_601184 ) ) ( not ( = ?auto_601181 ?auto_601185 ) ) ( not ( = ?auto_601181 ?auto_601186 ) ) ( not ( = ?auto_601182 ?auto_601183 ) ) ( not ( = ?auto_601182 ?auto_601184 ) ) ( not ( = ?auto_601182 ?auto_601185 ) ) ( not ( = ?auto_601182 ?auto_601186 ) ) ( not ( = ?auto_601183 ?auto_601184 ) ) ( not ( = ?auto_601183 ?auto_601185 ) ) ( not ( = ?auto_601183 ?auto_601186 ) ) ( not ( = ?auto_601184 ?auto_601185 ) ) ( not ( = ?auto_601184 ?auto_601186 ) ) ( not ( = ?auto_601185 ?auto_601186 ) ) ( ON ?auto_601184 ?auto_601185 ) ( ON ?auto_601183 ?auto_601184 ) ( ON ?auto_601182 ?auto_601183 ) ( ON ?auto_601181 ?auto_601182 ) ( ON ?auto_601180 ?auto_601181 ) ( ON ?auto_601179 ?auto_601180 ) ( ON ?auto_601178 ?auto_601179 ) ( ON ?auto_601177 ?auto_601178 ) ( ON ?auto_601176 ?auto_601177 ) ( CLEAR ?auto_601174 ) ( ON ?auto_601175 ?auto_601176 ) ( CLEAR ?auto_601175 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_601173 ?auto_601174 ?auto_601175 )
      ( MAKE-13PILE ?auto_601173 ?auto_601174 ?auto_601175 ?auto_601176 ?auto_601177 ?auto_601178 ?auto_601179 ?auto_601180 ?auto_601181 ?auto_601182 ?auto_601183 ?auto_601184 ?auto_601185 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_601227 - BLOCK
      ?auto_601228 - BLOCK
      ?auto_601229 - BLOCK
      ?auto_601230 - BLOCK
      ?auto_601231 - BLOCK
      ?auto_601232 - BLOCK
      ?auto_601233 - BLOCK
      ?auto_601234 - BLOCK
      ?auto_601235 - BLOCK
      ?auto_601236 - BLOCK
      ?auto_601237 - BLOCK
      ?auto_601238 - BLOCK
      ?auto_601239 - BLOCK
    )
    :vars
    (
      ?auto_601240 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_601239 ?auto_601240 ) ( ON-TABLE ?auto_601227 ) ( not ( = ?auto_601227 ?auto_601228 ) ) ( not ( = ?auto_601227 ?auto_601229 ) ) ( not ( = ?auto_601227 ?auto_601230 ) ) ( not ( = ?auto_601227 ?auto_601231 ) ) ( not ( = ?auto_601227 ?auto_601232 ) ) ( not ( = ?auto_601227 ?auto_601233 ) ) ( not ( = ?auto_601227 ?auto_601234 ) ) ( not ( = ?auto_601227 ?auto_601235 ) ) ( not ( = ?auto_601227 ?auto_601236 ) ) ( not ( = ?auto_601227 ?auto_601237 ) ) ( not ( = ?auto_601227 ?auto_601238 ) ) ( not ( = ?auto_601227 ?auto_601239 ) ) ( not ( = ?auto_601227 ?auto_601240 ) ) ( not ( = ?auto_601228 ?auto_601229 ) ) ( not ( = ?auto_601228 ?auto_601230 ) ) ( not ( = ?auto_601228 ?auto_601231 ) ) ( not ( = ?auto_601228 ?auto_601232 ) ) ( not ( = ?auto_601228 ?auto_601233 ) ) ( not ( = ?auto_601228 ?auto_601234 ) ) ( not ( = ?auto_601228 ?auto_601235 ) ) ( not ( = ?auto_601228 ?auto_601236 ) ) ( not ( = ?auto_601228 ?auto_601237 ) ) ( not ( = ?auto_601228 ?auto_601238 ) ) ( not ( = ?auto_601228 ?auto_601239 ) ) ( not ( = ?auto_601228 ?auto_601240 ) ) ( not ( = ?auto_601229 ?auto_601230 ) ) ( not ( = ?auto_601229 ?auto_601231 ) ) ( not ( = ?auto_601229 ?auto_601232 ) ) ( not ( = ?auto_601229 ?auto_601233 ) ) ( not ( = ?auto_601229 ?auto_601234 ) ) ( not ( = ?auto_601229 ?auto_601235 ) ) ( not ( = ?auto_601229 ?auto_601236 ) ) ( not ( = ?auto_601229 ?auto_601237 ) ) ( not ( = ?auto_601229 ?auto_601238 ) ) ( not ( = ?auto_601229 ?auto_601239 ) ) ( not ( = ?auto_601229 ?auto_601240 ) ) ( not ( = ?auto_601230 ?auto_601231 ) ) ( not ( = ?auto_601230 ?auto_601232 ) ) ( not ( = ?auto_601230 ?auto_601233 ) ) ( not ( = ?auto_601230 ?auto_601234 ) ) ( not ( = ?auto_601230 ?auto_601235 ) ) ( not ( = ?auto_601230 ?auto_601236 ) ) ( not ( = ?auto_601230 ?auto_601237 ) ) ( not ( = ?auto_601230 ?auto_601238 ) ) ( not ( = ?auto_601230 ?auto_601239 ) ) ( not ( = ?auto_601230 ?auto_601240 ) ) ( not ( = ?auto_601231 ?auto_601232 ) ) ( not ( = ?auto_601231 ?auto_601233 ) ) ( not ( = ?auto_601231 ?auto_601234 ) ) ( not ( = ?auto_601231 ?auto_601235 ) ) ( not ( = ?auto_601231 ?auto_601236 ) ) ( not ( = ?auto_601231 ?auto_601237 ) ) ( not ( = ?auto_601231 ?auto_601238 ) ) ( not ( = ?auto_601231 ?auto_601239 ) ) ( not ( = ?auto_601231 ?auto_601240 ) ) ( not ( = ?auto_601232 ?auto_601233 ) ) ( not ( = ?auto_601232 ?auto_601234 ) ) ( not ( = ?auto_601232 ?auto_601235 ) ) ( not ( = ?auto_601232 ?auto_601236 ) ) ( not ( = ?auto_601232 ?auto_601237 ) ) ( not ( = ?auto_601232 ?auto_601238 ) ) ( not ( = ?auto_601232 ?auto_601239 ) ) ( not ( = ?auto_601232 ?auto_601240 ) ) ( not ( = ?auto_601233 ?auto_601234 ) ) ( not ( = ?auto_601233 ?auto_601235 ) ) ( not ( = ?auto_601233 ?auto_601236 ) ) ( not ( = ?auto_601233 ?auto_601237 ) ) ( not ( = ?auto_601233 ?auto_601238 ) ) ( not ( = ?auto_601233 ?auto_601239 ) ) ( not ( = ?auto_601233 ?auto_601240 ) ) ( not ( = ?auto_601234 ?auto_601235 ) ) ( not ( = ?auto_601234 ?auto_601236 ) ) ( not ( = ?auto_601234 ?auto_601237 ) ) ( not ( = ?auto_601234 ?auto_601238 ) ) ( not ( = ?auto_601234 ?auto_601239 ) ) ( not ( = ?auto_601234 ?auto_601240 ) ) ( not ( = ?auto_601235 ?auto_601236 ) ) ( not ( = ?auto_601235 ?auto_601237 ) ) ( not ( = ?auto_601235 ?auto_601238 ) ) ( not ( = ?auto_601235 ?auto_601239 ) ) ( not ( = ?auto_601235 ?auto_601240 ) ) ( not ( = ?auto_601236 ?auto_601237 ) ) ( not ( = ?auto_601236 ?auto_601238 ) ) ( not ( = ?auto_601236 ?auto_601239 ) ) ( not ( = ?auto_601236 ?auto_601240 ) ) ( not ( = ?auto_601237 ?auto_601238 ) ) ( not ( = ?auto_601237 ?auto_601239 ) ) ( not ( = ?auto_601237 ?auto_601240 ) ) ( not ( = ?auto_601238 ?auto_601239 ) ) ( not ( = ?auto_601238 ?auto_601240 ) ) ( not ( = ?auto_601239 ?auto_601240 ) ) ( ON ?auto_601238 ?auto_601239 ) ( ON ?auto_601237 ?auto_601238 ) ( ON ?auto_601236 ?auto_601237 ) ( ON ?auto_601235 ?auto_601236 ) ( ON ?auto_601234 ?auto_601235 ) ( ON ?auto_601233 ?auto_601234 ) ( ON ?auto_601232 ?auto_601233 ) ( ON ?auto_601231 ?auto_601232 ) ( ON ?auto_601230 ?auto_601231 ) ( ON ?auto_601229 ?auto_601230 ) ( CLEAR ?auto_601227 ) ( ON ?auto_601228 ?auto_601229 ) ( CLEAR ?auto_601228 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_601227 ?auto_601228 )
      ( MAKE-13PILE ?auto_601227 ?auto_601228 ?auto_601229 ?auto_601230 ?auto_601231 ?auto_601232 ?auto_601233 ?auto_601234 ?auto_601235 ?auto_601236 ?auto_601237 ?auto_601238 ?auto_601239 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_601281 - BLOCK
      ?auto_601282 - BLOCK
      ?auto_601283 - BLOCK
      ?auto_601284 - BLOCK
      ?auto_601285 - BLOCK
      ?auto_601286 - BLOCK
      ?auto_601287 - BLOCK
      ?auto_601288 - BLOCK
      ?auto_601289 - BLOCK
      ?auto_601290 - BLOCK
      ?auto_601291 - BLOCK
      ?auto_601292 - BLOCK
      ?auto_601293 - BLOCK
    )
    :vars
    (
      ?auto_601294 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_601293 ?auto_601294 ) ( not ( = ?auto_601281 ?auto_601282 ) ) ( not ( = ?auto_601281 ?auto_601283 ) ) ( not ( = ?auto_601281 ?auto_601284 ) ) ( not ( = ?auto_601281 ?auto_601285 ) ) ( not ( = ?auto_601281 ?auto_601286 ) ) ( not ( = ?auto_601281 ?auto_601287 ) ) ( not ( = ?auto_601281 ?auto_601288 ) ) ( not ( = ?auto_601281 ?auto_601289 ) ) ( not ( = ?auto_601281 ?auto_601290 ) ) ( not ( = ?auto_601281 ?auto_601291 ) ) ( not ( = ?auto_601281 ?auto_601292 ) ) ( not ( = ?auto_601281 ?auto_601293 ) ) ( not ( = ?auto_601281 ?auto_601294 ) ) ( not ( = ?auto_601282 ?auto_601283 ) ) ( not ( = ?auto_601282 ?auto_601284 ) ) ( not ( = ?auto_601282 ?auto_601285 ) ) ( not ( = ?auto_601282 ?auto_601286 ) ) ( not ( = ?auto_601282 ?auto_601287 ) ) ( not ( = ?auto_601282 ?auto_601288 ) ) ( not ( = ?auto_601282 ?auto_601289 ) ) ( not ( = ?auto_601282 ?auto_601290 ) ) ( not ( = ?auto_601282 ?auto_601291 ) ) ( not ( = ?auto_601282 ?auto_601292 ) ) ( not ( = ?auto_601282 ?auto_601293 ) ) ( not ( = ?auto_601282 ?auto_601294 ) ) ( not ( = ?auto_601283 ?auto_601284 ) ) ( not ( = ?auto_601283 ?auto_601285 ) ) ( not ( = ?auto_601283 ?auto_601286 ) ) ( not ( = ?auto_601283 ?auto_601287 ) ) ( not ( = ?auto_601283 ?auto_601288 ) ) ( not ( = ?auto_601283 ?auto_601289 ) ) ( not ( = ?auto_601283 ?auto_601290 ) ) ( not ( = ?auto_601283 ?auto_601291 ) ) ( not ( = ?auto_601283 ?auto_601292 ) ) ( not ( = ?auto_601283 ?auto_601293 ) ) ( not ( = ?auto_601283 ?auto_601294 ) ) ( not ( = ?auto_601284 ?auto_601285 ) ) ( not ( = ?auto_601284 ?auto_601286 ) ) ( not ( = ?auto_601284 ?auto_601287 ) ) ( not ( = ?auto_601284 ?auto_601288 ) ) ( not ( = ?auto_601284 ?auto_601289 ) ) ( not ( = ?auto_601284 ?auto_601290 ) ) ( not ( = ?auto_601284 ?auto_601291 ) ) ( not ( = ?auto_601284 ?auto_601292 ) ) ( not ( = ?auto_601284 ?auto_601293 ) ) ( not ( = ?auto_601284 ?auto_601294 ) ) ( not ( = ?auto_601285 ?auto_601286 ) ) ( not ( = ?auto_601285 ?auto_601287 ) ) ( not ( = ?auto_601285 ?auto_601288 ) ) ( not ( = ?auto_601285 ?auto_601289 ) ) ( not ( = ?auto_601285 ?auto_601290 ) ) ( not ( = ?auto_601285 ?auto_601291 ) ) ( not ( = ?auto_601285 ?auto_601292 ) ) ( not ( = ?auto_601285 ?auto_601293 ) ) ( not ( = ?auto_601285 ?auto_601294 ) ) ( not ( = ?auto_601286 ?auto_601287 ) ) ( not ( = ?auto_601286 ?auto_601288 ) ) ( not ( = ?auto_601286 ?auto_601289 ) ) ( not ( = ?auto_601286 ?auto_601290 ) ) ( not ( = ?auto_601286 ?auto_601291 ) ) ( not ( = ?auto_601286 ?auto_601292 ) ) ( not ( = ?auto_601286 ?auto_601293 ) ) ( not ( = ?auto_601286 ?auto_601294 ) ) ( not ( = ?auto_601287 ?auto_601288 ) ) ( not ( = ?auto_601287 ?auto_601289 ) ) ( not ( = ?auto_601287 ?auto_601290 ) ) ( not ( = ?auto_601287 ?auto_601291 ) ) ( not ( = ?auto_601287 ?auto_601292 ) ) ( not ( = ?auto_601287 ?auto_601293 ) ) ( not ( = ?auto_601287 ?auto_601294 ) ) ( not ( = ?auto_601288 ?auto_601289 ) ) ( not ( = ?auto_601288 ?auto_601290 ) ) ( not ( = ?auto_601288 ?auto_601291 ) ) ( not ( = ?auto_601288 ?auto_601292 ) ) ( not ( = ?auto_601288 ?auto_601293 ) ) ( not ( = ?auto_601288 ?auto_601294 ) ) ( not ( = ?auto_601289 ?auto_601290 ) ) ( not ( = ?auto_601289 ?auto_601291 ) ) ( not ( = ?auto_601289 ?auto_601292 ) ) ( not ( = ?auto_601289 ?auto_601293 ) ) ( not ( = ?auto_601289 ?auto_601294 ) ) ( not ( = ?auto_601290 ?auto_601291 ) ) ( not ( = ?auto_601290 ?auto_601292 ) ) ( not ( = ?auto_601290 ?auto_601293 ) ) ( not ( = ?auto_601290 ?auto_601294 ) ) ( not ( = ?auto_601291 ?auto_601292 ) ) ( not ( = ?auto_601291 ?auto_601293 ) ) ( not ( = ?auto_601291 ?auto_601294 ) ) ( not ( = ?auto_601292 ?auto_601293 ) ) ( not ( = ?auto_601292 ?auto_601294 ) ) ( not ( = ?auto_601293 ?auto_601294 ) ) ( ON ?auto_601292 ?auto_601293 ) ( ON ?auto_601291 ?auto_601292 ) ( ON ?auto_601290 ?auto_601291 ) ( ON ?auto_601289 ?auto_601290 ) ( ON ?auto_601288 ?auto_601289 ) ( ON ?auto_601287 ?auto_601288 ) ( ON ?auto_601286 ?auto_601287 ) ( ON ?auto_601285 ?auto_601286 ) ( ON ?auto_601284 ?auto_601285 ) ( ON ?auto_601283 ?auto_601284 ) ( ON ?auto_601282 ?auto_601283 ) ( ON ?auto_601281 ?auto_601282 ) ( CLEAR ?auto_601281 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_601281 )
      ( MAKE-13PILE ?auto_601281 ?auto_601282 ?auto_601283 ?auto_601284 ?auto_601285 ?auto_601286 ?auto_601287 ?auto_601288 ?auto_601289 ?auto_601290 ?auto_601291 ?auto_601292 ?auto_601293 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_601336 - BLOCK
      ?auto_601337 - BLOCK
      ?auto_601338 - BLOCK
      ?auto_601339 - BLOCK
      ?auto_601340 - BLOCK
      ?auto_601341 - BLOCK
      ?auto_601342 - BLOCK
      ?auto_601343 - BLOCK
      ?auto_601344 - BLOCK
      ?auto_601345 - BLOCK
      ?auto_601346 - BLOCK
      ?auto_601347 - BLOCK
      ?auto_601348 - BLOCK
      ?auto_601349 - BLOCK
    )
    :vars
    (
      ?auto_601350 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_601348 ) ( ON ?auto_601349 ?auto_601350 ) ( CLEAR ?auto_601349 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_601336 ) ( ON ?auto_601337 ?auto_601336 ) ( ON ?auto_601338 ?auto_601337 ) ( ON ?auto_601339 ?auto_601338 ) ( ON ?auto_601340 ?auto_601339 ) ( ON ?auto_601341 ?auto_601340 ) ( ON ?auto_601342 ?auto_601341 ) ( ON ?auto_601343 ?auto_601342 ) ( ON ?auto_601344 ?auto_601343 ) ( ON ?auto_601345 ?auto_601344 ) ( ON ?auto_601346 ?auto_601345 ) ( ON ?auto_601347 ?auto_601346 ) ( ON ?auto_601348 ?auto_601347 ) ( not ( = ?auto_601336 ?auto_601337 ) ) ( not ( = ?auto_601336 ?auto_601338 ) ) ( not ( = ?auto_601336 ?auto_601339 ) ) ( not ( = ?auto_601336 ?auto_601340 ) ) ( not ( = ?auto_601336 ?auto_601341 ) ) ( not ( = ?auto_601336 ?auto_601342 ) ) ( not ( = ?auto_601336 ?auto_601343 ) ) ( not ( = ?auto_601336 ?auto_601344 ) ) ( not ( = ?auto_601336 ?auto_601345 ) ) ( not ( = ?auto_601336 ?auto_601346 ) ) ( not ( = ?auto_601336 ?auto_601347 ) ) ( not ( = ?auto_601336 ?auto_601348 ) ) ( not ( = ?auto_601336 ?auto_601349 ) ) ( not ( = ?auto_601336 ?auto_601350 ) ) ( not ( = ?auto_601337 ?auto_601338 ) ) ( not ( = ?auto_601337 ?auto_601339 ) ) ( not ( = ?auto_601337 ?auto_601340 ) ) ( not ( = ?auto_601337 ?auto_601341 ) ) ( not ( = ?auto_601337 ?auto_601342 ) ) ( not ( = ?auto_601337 ?auto_601343 ) ) ( not ( = ?auto_601337 ?auto_601344 ) ) ( not ( = ?auto_601337 ?auto_601345 ) ) ( not ( = ?auto_601337 ?auto_601346 ) ) ( not ( = ?auto_601337 ?auto_601347 ) ) ( not ( = ?auto_601337 ?auto_601348 ) ) ( not ( = ?auto_601337 ?auto_601349 ) ) ( not ( = ?auto_601337 ?auto_601350 ) ) ( not ( = ?auto_601338 ?auto_601339 ) ) ( not ( = ?auto_601338 ?auto_601340 ) ) ( not ( = ?auto_601338 ?auto_601341 ) ) ( not ( = ?auto_601338 ?auto_601342 ) ) ( not ( = ?auto_601338 ?auto_601343 ) ) ( not ( = ?auto_601338 ?auto_601344 ) ) ( not ( = ?auto_601338 ?auto_601345 ) ) ( not ( = ?auto_601338 ?auto_601346 ) ) ( not ( = ?auto_601338 ?auto_601347 ) ) ( not ( = ?auto_601338 ?auto_601348 ) ) ( not ( = ?auto_601338 ?auto_601349 ) ) ( not ( = ?auto_601338 ?auto_601350 ) ) ( not ( = ?auto_601339 ?auto_601340 ) ) ( not ( = ?auto_601339 ?auto_601341 ) ) ( not ( = ?auto_601339 ?auto_601342 ) ) ( not ( = ?auto_601339 ?auto_601343 ) ) ( not ( = ?auto_601339 ?auto_601344 ) ) ( not ( = ?auto_601339 ?auto_601345 ) ) ( not ( = ?auto_601339 ?auto_601346 ) ) ( not ( = ?auto_601339 ?auto_601347 ) ) ( not ( = ?auto_601339 ?auto_601348 ) ) ( not ( = ?auto_601339 ?auto_601349 ) ) ( not ( = ?auto_601339 ?auto_601350 ) ) ( not ( = ?auto_601340 ?auto_601341 ) ) ( not ( = ?auto_601340 ?auto_601342 ) ) ( not ( = ?auto_601340 ?auto_601343 ) ) ( not ( = ?auto_601340 ?auto_601344 ) ) ( not ( = ?auto_601340 ?auto_601345 ) ) ( not ( = ?auto_601340 ?auto_601346 ) ) ( not ( = ?auto_601340 ?auto_601347 ) ) ( not ( = ?auto_601340 ?auto_601348 ) ) ( not ( = ?auto_601340 ?auto_601349 ) ) ( not ( = ?auto_601340 ?auto_601350 ) ) ( not ( = ?auto_601341 ?auto_601342 ) ) ( not ( = ?auto_601341 ?auto_601343 ) ) ( not ( = ?auto_601341 ?auto_601344 ) ) ( not ( = ?auto_601341 ?auto_601345 ) ) ( not ( = ?auto_601341 ?auto_601346 ) ) ( not ( = ?auto_601341 ?auto_601347 ) ) ( not ( = ?auto_601341 ?auto_601348 ) ) ( not ( = ?auto_601341 ?auto_601349 ) ) ( not ( = ?auto_601341 ?auto_601350 ) ) ( not ( = ?auto_601342 ?auto_601343 ) ) ( not ( = ?auto_601342 ?auto_601344 ) ) ( not ( = ?auto_601342 ?auto_601345 ) ) ( not ( = ?auto_601342 ?auto_601346 ) ) ( not ( = ?auto_601342 ?auto_601347 ) ) ( not ( = ?auto_601342 ?auto_601348 ) ) ( not ( = ?auto_601342 ?auto_601349 ) ) ( not ( = ?auto_601342 ?auto_601350 ) ) ( not ( = ?auto_601343 ?auto_601344 ) ) ( not ( = ?auto_601343 ?auto_601345 ) ) ( not ( = ?auto_601343 ?auto_601346 ) ) ( not ( = ?auto_601343 ?auto_601347 ) ) ( not ( = ?auto_601343 ?auto_601348 ) ) ( not ( = ?auto_601343 ?auto_601349 ) ) ( not ( = ?auto_601343 ?auto_601350 ) ) ( not ( = ?auto_601344 ?auto_601345 ) ) ( not ( = ?auto_601344 ?auto_601346 ) ) ( not ( = ?auto_601344 ?auto_601347 ) ) ( not ( = ?auto_601344 ?auto_601348 ) ) ( not ( = ?auto_601344 ?auto_601349 ) ) ( not ( = ?auto_601344 ?auto_601350 ) ) ( not ( = ?auto_601345 ?auto_601346 ) ) ( not ( = ?auto_601345 ?auto_601347 ) ) ( not ( = ?auto_601345 ?auto_601348 ) ) ( not ( = ?auto_601345 ?auto_601349 ) ) ( not ( = ?auto_601345 ?auto_601350 ) ) ( not ( = ?auto_601346 ?auto_601347 ) ) ( not ( = ?auto_601346 ?auto_601348 ) ) ( not ( = ?auto_601346 ?auto_601349 ) ) ( not ( = ?auto_601346 ?auto_601350 ) ) ( not ( = ?auto_601347 ?auto_601348 ) ) ( not ( = ?auto_601347 ?auto_601349 ) ) ( not ( = ?auto_601347 ?auto_601350 ) ) ( not ( = ?auto_601348 ?auto_601349 ) ) ( not ( = ?auto_601348 ?auto_601350 ) ) ( not ( = ?auto_601349 ?auto_601350 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_601349 ?auto_601350 )
      ( !STACK ?auto_601349 ?auto_601348 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_601394 - BLOCK
      ?auto_601395 - BLOCK
      ?auto_601396 - BLOCK
      ?auto_601397 - BLOCK
      ?auto_601398 - BLOCK
      ?auto_601399 - BLOCK
      ?auto_601400 - BLOCK
      ?auto_601401 - BLOCK
      ?auto_601402 - BLOCK
      ?auto_601403 - BLOCK
      ?auto_601404 - BLOCK
      ?auto_601405 - BLOCK
      ?auto_601406 - BLOCK
      ?auto_601407 - BLOCK
    )
    :vars
    (
      ?auto_601408 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_601407 ?auto_601408 ) ( ON-TABLE ?auto_601394 ) ( ON ?auto_601395 ?auto_601394 ) ( ON ?auto_601396 ?auto_601395 ) ( ON ?auto_601397 ?auto_601396 ) ( ON ?auto_601398 ?auto_601397 ) ( ON ?auto_601399 ?auto_601398 ) ( ON ?auto_601400 ?auto_601399 ) ( ON ?auto_601401 ?auto_601400 ) ( ON ?auto_601402 ?auto_601401 ) ( ON ?auto_601403 ?auto_601402 ) ( ON ?auto_601404 ?auto_601403 ) ( ON ?auto_601405 ?auto_601404 ) ( not ( = ?auto_601394 ?auto_601395 ) ) ( not ( = ?auto_601394 ?auto_601396 ) ) ( not ( = ?auto_601394 ?auto_601397 ) ) ( not ( = ?auto_601394 ?auto_601398 ) ) ( not ( = ?auto_601394 ?auto_601399 ) ) ( not ( = ?auto_601394 ?auto_601400 ) ) ( not ( = ?auto_601394 ?auto_601401 ) ) ( not ( = ?auto_601394 ?auto_601402 ) ) ( not ( = ?auto_601394 ?auto_601403 ) ) ( not ( = ?auto_601394 ?auto_601404 ) ) ( not ( = ?auto_601394 ?auto_601405 ) ) ( not ( = ?auto_601394 ?auto_601406 ) ) ( not ( = ?auto_601394 ?auto_601407 ) ) ( not ( = ?auto_601394 ?auto_601408 ) ) ( not ( = ?auto_601395 ?auto_601396 ) ) ( not ( = ?auto_601395 ?auto_601397 ) ) ( not ( = ?auto_601395 ?auto_601398 ) ) ( not ( = ?auto_601395 ?auto_601399 ) ) ( not ( = ?auto_601395 ?auto_601400 ) ) ( not ( = ?auto_601395 ?auto_601401 ) ) ( not ( = ?auto_601395 ?auto_601402 ) ) ( not ( = ?auto_601395 ?auto_601403 ) ) ( not ( = ?auto_601395 ?auto_601404 ) ) ( not ( = ?auto_601395 ?auto_601405 ) ) ( not ( = ?auto_601395 ?auto_601406 ) ) ( not ( = ?auto_601395 ?auto_601407 ) ) ( not ( = ?auto_601395 ?auto_601408 ) ) ( not ( = ?auto_601396 ?auto_601397 ) ) ( not ( = ?auto_601396 ?auto_601398 ) ) ( not ( = ?auto_601396 ?auto_601399 ) ) ( not ( = ?auto_601396 ?auto_601400 ) ) ( not ( = ?auto_601396 ?auto_601401 ) ) ( not ( = ?auto_601396 ?auto_601402 ) ) ( not ( = ?auto_601396 ?auto_601403 ) ) ( not ( = ?auto_601396 ?auto_601404 ) ) ( not ( = ?auto_601396 ?auto_601405 ) ) ( not ( = ?auto_601396 ?auto_601406 ) ) ( not ( = ?auto_601396 ?auto_601407 ) ) ( not ( = ?auto_601396 ?auto_601408 ) ) ( not ( = ?auto_601397 ?auto_601398 ) ) ( not ( = ?auto_601397 ?auto_601399 ) ) ( not ( = ?auto_601397 ?auto_601400 ) ) ( not ( = ?auto_601397 ?auto_601401 ) ) ( not ( = ?auto_601397 ?auto_601402 ) ) ( not ( = ?auto_601397 ?auto_601403 ) ) ( not ( = ?auto_601397 ?auto_601404 ) ) ( not ( = ?auto_601397 ?auto_601405 ) ) ( not ( = ?auto_601397 ?auto_601406 ) ) ( not ( = ?auto_601397 ?auto_601407 ) ) ( not ( = ?auto_601397 ?auto_601408 ) ) ( not ( = ?auto_601398 ?auto_601399 ) ) ( not ( = ?auto_601398 ?auto_601400 ) ) ( not ( = ?auto_601398 ?auto_601401 ) ) ( not ( = ?auto_601398 ?auto_601402 ) ) ( not ( = ?auto_601398 ?auto_601403 ) ) ( not ( = ?auto_601398 ?auto_601404 ) ) ( not ( = ?auto_601398 ?auto_601405 ) ) ( not ( = ?auto_601398 ?auto_601406 ) ) ( not ( = ?auto_601398 ?auto_601407 ) ) ( not ( = ?auto_601398 ?auto_601408 ) ) ( not ( = ?auto_601399 ?auto_601400 ) ) ( not ( = ?auto_601399 ?auto_601401 ) ) ( not ( = ?auto_601399 ?auto_601402 ) ) ( not ( = ?auto_601399 ?auto_601403 ) ) ( not ( = ?auto_601399 ?auto_601404 ) ) ( not ( = ?auto_601399 ?auto_601405 ) ) ( not ( = ?auto_601399 ?auto_601406 ) ) ( not ( = ?auto_601399 ?auto_601407 ) ) ( not ( = ?auto_601399 ?auto_601408 ) ) ( not ( = ?auto_601400 ?auto_601401 ) ) ( not ( = ?auto_601400 ?auto_601402 ) ) ( not ( = ?auto_601400 ?auto_601403 ) ) ( not ( = ?auto_601400 ?auto_601404 ) ) ( not ( = ?auto_601400 ?auto_601405 ) ) ( not ( = ?auto_601400 ?auto_601406 ) ) ( not ( = ?auto_601400 ?auto_601407 ) ) ( not ( = ?auto_601400 ?auto_601408 ) ) ( not ( = ?auto_601401 ?auto_601402 ) ) ( not ( = ?auto_601401 ?auto_601403 ) ) ( not ( = ?auto_601401 ?auto_601404 ) ) ( not ( = ?auto_601401 ?auto_601405 ) ) ( not ( = ?auto_601401 ?auto_601406 ) ) ( not ( = ?auto_601401 ?auto_601407 ) ) ( not ( = ?auto_601401 ?auto_601408 ) ) ( not ( = ?auto_601402 ?auto_601403 ) ) ( not ( = ?auto_601402 ?auto_601404 ) ) ( not ( = ?auto_601402 ?auto_601405 ) ) ( not ( = ?auto_601402 ?auto_601406 ) ) ( not ( = ?auto_601402 ?auto_601407 ) ) ( not ( = ?auto_601402 ?auto_601408 ) ) ( not ( = ?auto_601403 ?auto_601404 ) ) ( not ( = ?auto_601403 ?auto_601405 ) ) ( not ( = ?auto_601403 ?auto_601406 ) ) ( not ( = ?auto_601403 ?auto_601407 ) ) ( not ( = ?auto_601403 ?auto_601408 ) ) ( not ( = ?auto_601404 ?auto_601405 ) ) ( not ( = ?auto_601404 ?auto_601406 ) ) ( not ( = ?auto_601404 ?auto_601407 ) ) ( not ( = ?auto_601404 ?auto_601408 ) ) ( not ( = ?auto_601405 ?auto_601406 ) ) ( not ( = ?auto_601405 ?auto_601407 ) ) ( not ( = ?auto_601405 ?auto_601408 ) ) ( not ( = ?auto_601406 ?auto_601407 ) ) ( not ( = ?auto_601406 ?auto_601408 ) ) ( not ( = ?auto_601407 ?auto_601408 ) ) ( CLEAR ?auto_601405 ) ( ON ?auto_601406 ?auto_601407 ) ( CLEAR ?auto_601406 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_601394 ?auto_601395 ?auto_601396 ?auto_601397 ?auto_601398 ?auto_601399 ?auto_601400 ?auto_601401 ?auto_601402 ?auto_601403 ?auto_601404 ?auto_601405 ?auto_601406 )
      ( MAKE-14PILE ?auto_601394 ?auto_601395 ?auto_601396 ?auto_601397 ?auto_601398 ?auto_601399 ?auto_601400 ?auto_601401 ?auto_601402 ?auto_601403 ?auto_601404 ?auto_601405 ?auto_601406 ?auto_601407 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_601452 - BLOCK
      ?auto_601453 - BLOCK
      ?auto_601454 - BLOCK
      ?auto_601455 - BLOCK
      ?auto_601456 - BLOCK
      ?auto_601457 - BLOCK
      ?auto_601458 - BLOCK
      ?auto_601459 - BLOCK
      ?auto_601460 - BLOCK
      ?auto_601461 - BLOCK
      ?auto_601462 - BLOCK
      ?auto_601463 - BLOCK
      ?auto_601464 - BLOCK
      ?auto_601465 - BLOCK
    )
    :vars
    (
      ?auto_601466 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_601465 ?auto_601466 ) ( ON-TABLE ?auto_601452 ) ( ON ?auto_601453 ?auto_601452 ) ( ON ?auto_601454 ?auto_601453 ) ( ON ?auto_601455 ?auto_601454 ) ( ON ?auto_601456 ?auto_601455 ) ( ON ?auto_601457 ?auto_601456 ) ( ON ?auto_601458 ?auto_601457 ) ( ON ?auto_601459 ?auto_601458 ) ( ON ?auto_601460 ?auto_601459 ) ( ON ?auto_601461 ?auto_601460 ) ( ON ?auto_601462 ?auto_601461 ) ( not ( = ?auto_601452 ?auto_601453 ) ) ( not ( = ?auto_601452 ?auto_601454 ) ) ( not ( = ?auto_601452 ?auto_601455 ) ) ( not ( = ?auto_601452 ?auto_601456 ) ) ( not ( = ?auto_601452 ?auto_601457 ) ) ( not ( = ?auto_601452 ?auto_601458 ) ) ( not ( = ?auto_601452 ?auto_601459 ) ) ( not ( = ?auto_601452 ?auto_601460 ) ) ( not ( = ?auto_601452 ?auto_601461 ) ) ( not ( = ?auto_601452 ?auto_601462 ) ) ( not ( = ?auto_601452 ?auto_601463 ) ) ( not ( = ?auto_601452 ?auto_601464 ) ) ( not ( = ?auto_601452 ?auto_601465 ) ) ( not ( = ?auto_601452 ?auto_601466 ) ) ( not ( = ?auto_601453 ?auto_601454 ) ) ( not ( = ?auto_601453 ?auto_601455 ) ) ( not ( = ?auto_601453 ?auto_601456 ) ) ( not ( = ?auto_601453 ?auto_601457 ) ) ( not ( = ?auto_601453 ?auto_601458 ) ) ( not ( = ?auto_601453 ?auto_601459 ) ) ( not ( = ?auto_601453 ?auto_601460 ) ) ( not ( = ?auto_601453 ?auto_601461 ) ) ( not ( = ?auto_601453 ?auto_601462 ) ) ( not ( = ?auto_601453 ?auto_601463 ) ) ( not ( = ?auto_601453 ?auto_601464 ) ) ( not ( = ?auto_601453 ?auto_601465 ) ) ( not ( = ?auto_601453 ?auto_601466 ) ) ( not ( = ?auto_601454 ?auto_601455 ) ) ( not ( = ?auto_601454 ?auto_601456 ) ) ( not ( = ?auto_601454 ?auto_601457 ) ) ( not ( = ?auto_601454 ?auto_601458 ) ) ( not ( = ?auto_601454 ?auto_601459 ) ) ( not ( = ?auto_601454 ?auto_601460 ) ) ( not ( = ?auto_601454 ?auto_601461 ) ) ( not ( = ?auto_601454 ?auto_601462 ) ) ( not ( = ?auto_601454 ?auto_601463 ) ) ( not ( = ?auto_601454 ?auto_601464 ) ) ( not ( = ?auto_601454 ?auto_601465 ) ) ( not ( = ?auto_601454 ?auto_601466 ) ) ( not ( = ?auto_601455 ?auto_601456 ) ) ( not ( = ?auto_601455 ?auto_601457 ) ) ( not ( = ?auto_601455 ?auto_601458 ) ) ( not ( = ?auto_601455 ?auto_601459 ) ) ( not ( = ?auto_601455 ?auto_601460 ) ) ( not ( = ?auto_601455 ?auto_601461 ) ) ( not ( = ?auto_601455 ?auto_601462 ) ) ( not ( = ?auto_601455 ?auto_601463 ) ) ( not ( = ?auto_601455 ?auto_601464 ) ) ( not ( = ?auto_601455 ?auto_601465 ) ) ( not ( = ?auto_601455 ?auto_601466 ) ) ( not ( = ?auto_601456 ?auto_601457 ) ) ( not ( = ?auto_601456 ?auto_601458 ) ) ( not ( = ?auto_601456 ?auto_601459 ) ) ( not ( = ?auto_601456 ?auto_601460 ) ) ( not ( = ?auto_601456 ?auto_601461 ) ) ( not ( = ?auto_601456 ?auto_601462 ) ) ( not ( = ?auto_601456 ?auto_601463 ) ) ( not ( = ?auto_601456 ?auto_601464 ) ) ( not ( = ?auto_601456 ?auto_601465 ) ) ( not ( = ?auto_601456 ?auto_601466 ) ) ( not ( = ?auto_601457 ?auto_601458 ) ) ( not ( = ?auto_601457 ?auto_601459 ) ) ( not ( = ?auto_601457 ?auto_601460 ) ) ( not ( = ?auto_601457 ?auto_601461 ) ) ( not ( = ?auto_601457 ?auto_601462 ) ) ( not ( = ?auto_601457 ?auto_601463 ) ) ( not ( = ?auto_601457 ?auto_601464 ) ) ( not ( = ?auto_601457 ?auto_601465 ) ) ( not ( = ?auto_601457 ?auto_601466 ) ) ( not ( = ?auto_601458 ?auto_601459 ) ) ( not ( = ?auto_601458 ?auto_601460 ) ) ( not ( = ?auto_601458 ?auto_601461 ) ) ( not ( = ?auto_601458 ?auto_601462 ) ) ( not ( = ?auto_601458 ?auto_601463 ) ) ( not ( = ?auto_601458 ?auto_601464 ) ) ( not ( = ?auto_601458 ?auto_601465 ) ) ( not ( = ?auto_601458 ?auto_601466 ) ) ( not ( = ?auto_601459 ?auto_601460 ) ) ( not ( = ?auto_601459 ?auto_601461 ) ) ( not ( = ?auto_601459 ?auto_601462 ) ) ( not ( = ?auto_601459 ?auto_601463 ) ) ( not ( = ?auto_601459 ?auto_601464 ) ) ( not ( = ?auto_601459 ?auto_601465 ) ) ( not ( = ?auto_601459 ?auto_601466 ) ) ( not ( = ?auto_601460 ?auto_601461 ) ) ( not ( = ?auto_601460 ?auto_601462 ) ) ( not ( = ?auto_601460 ?auto_601463 ) ) ( not ( = ?auto_601460 ?auto_601464 ) ) ( not ( = ?auto_601460 ?auto_601465 ) ) ( not ( = ?auto_601460 ?auto_601466 ) ) ( not ( = ?auto_601461 ?auto_601462 ) ) ( not ( = ?auto_601461 ?auto_601463 ) ) ( not ( = ?auto_601461 ?auto_601464 ) ) ( not ( = ?auto_601461 ?auto_601465 ) ) ( not ( = ?auto_601461 ?auto_601466 ) ) ( not ( = ?auto_601462 ?auto_601463 ) ) ( not ( = ?auto_601462 ?auto_601464 ) ) ( not ( = ?auto_601462 ?auto_601465 ) ) ( not ( = ?auto_601462 ?auto_601466 ) ) ( not ( = ?auto_601463 ?auto_601464 ) ) ( not ( = ?auto_601463 ?auto_601465 ) ) ( not ( = ?auto_601463 ?auto_601466 ) ) ( not ( = ?auto_601464 ?auto_601465 ) ) ( not ( = ?auto_601464 ?auto_601466 ) ) ( not ( = ?auto_601465 ?auto_601466 ) ) ( ON ?auto_601464 ?auto_601465 ) ( CLEAR ?auto_601462 ) ( ON ?auto_601463 ?auto_601464 ) ( CLEAR ?auto_601463 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_601452 ?auto_601453 ?auto_601454 ?auto_601455 ?auto_601456 ?auto_601457 ?auto_601458 ?auto_601459 ?auto_601460 ?auto_601461 ?auto_601462 ?auto_601463 )
      ( MAKE-14PILE ?auto_601452 ?auto_601453 ?auto_601454 ?auto_601455 ?auto_601456 ?auto_601457 ?auto_601458 ?auto_601459 ?auto_601460 ?auto_601461 ?auto_601462 ?auto_601463 ?auto_601464 ?auto_601465 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_601510 - BLOCK
      ?auto_601511 - BLOCK
      ?auto_601512 - BLOCK
      ?auto_601513 - BLOCK
      ?auto_601514 - BLOCK
      ?auto_601515 - BLOCK
      ?auto_601516 - BLOCK
      ?auto_601517 - BLOCK
      ?auto_601518 - BLOCK
      ?auto_601519 - BLOCK
      ?auto_601520 - BLOCK
      ?auto_601521 - BLOCK
      ?auto_601522 - BLOCK
      ?auto_601523 - BLOCK
    )
    :vars
    (
      ?auto_601524 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_601523 ?auto_601524 ) ( ON-TABLE ?auto_601510 ) ( ON ?auto_601511 ?auto_601510 ) ( ON ?auto_601512 ?auto_601511 ) ( ON ?auto_601513 ?auto_601512 ) ( ON ?auto_601514 ?auto_601513 ) ( ON ?auto_601515 ?auto_601514 ) ( ON ?auto_601516 ?auto_601515 ) ( ON ?auto_601517 ?auto_601516 ) ( ON ?auto_601518 ?auto_601517 ) ( ON ?auto_601519 ?auto_601518 ) ( not ( = ?auto_601510 ?auto_601511 ) ) ( not ( = ?auto_601510 ?auto_601512 ) ) ( not ( = ?auto_601510 ?auto_601513 ) ) ( not ( = ?auto_601510 ?auto_601514 ) ) ( not ( = ?auto_601510 ?auto_601515 ) ) ( not ( = ?auto_601510 ?auto_601516 ) ) ( not ( = ?auto_601510 ?auto_601517 ) ) ( not ( = ?auto_601510 ?auto_601518 ) ) ( not ( = ?auto_601510 ?auto_601519 ) ) ( not ( = ?auto_601510 ?auto_601520 ) ) ( not ( = ?auto_601510 ?auto_601521 ) ) ( not ( = ?auto_601510 ?auto_601522 ) ) ( not ( = ?auto_601510 ?auto_601523 ) ) ( not ( = ?auto_601510 ?auto_601524 ) ) ( not ( = ?auto_601511 ?auto_601512 ) ) ( not ( = ?auto_601511 ?auto_601513 ) ) ( not ( = ?auto_601511 ?auto_601514 ) ) ( not ( = ?auto_601511 ?auto_601515 ) ) ( not ( = ?auto_601511 ?auto_601516 ) ) ( not ( = ?auto_601511 ?auto_601517 ) ) ( not ( = ?auto_601511 ?auto_601518 ) ) ( not ( = ?auto_601511 ?auto_601519 ) ) ( not ( = ?auto_601511 ?auto_601520 ) ) ( not ( = ?auto_601511 ?auto_601521 ) ) ( not ( = ?auto_601511 ?auto_601522 ) ) ( not ( = ?auto_601511 ?auto_601523 ) ) ( not ( = ?auto_601511 ?auto_601524 ) ) ( not ( = ?auto_601512 ?auto_601513 ) ) ( not ( = ?auto_601512 ?auto_601514 ) ) ( not ( = ?auto_601512 ?auto_601515 ) ) ( not ( = ?auto_601512 ?auto_601516 ) ) ( not ( = ?auto_601512 ?auto_601517 ) ) ( not ( = ?auto_601512 ?auto_601518 ) ) ( not ( = ?auto_601512 ?auto_601519 ) ) ( not ( = ?auto_601512 ?auto_601520 ) ) ( not ( = ?auto_601512 ?auto_601521 ) ) ( not ( = ?auto_601512 ?auto_601522 ) ) ( not ( = ?auto_601512 ?auto_601523 ) ) ( not ( = ?auto_601512 ?auto_601524 ) ) ( not ( = ?auto_601513 ?auto_601514 ) ) ( not ( = ?auto_601513 ?auto_601515 ) ) ( not ( = ?auto_601513 ?auto_601516 ) ) ( not ( = ?auto_601513 ?auto_601517 ) ) ( not ( = ?auto_601513 ?auto_601518 ) ) ( not ( = ?auto_601513 ?auto_601519 ) ) ( not ( = ?auto_601513 ?auto_601520 ) ) ( not ( = ?auto_601513 ?auto_601521 ) ) ( not ( = ?auto_601513 ?auto_601522 ) ) ( not ( = ?auto_601513 ?auto_601523 ) ) ( not ( = ?auto_601513 ?auto_601524 ) ) ( not ( = ?auto_601514 ?auto_601515 ) ) ( not ( = ?auto_601514 ?auto_601516 ) ) ( not ( = ?auto_601514 ?auto_601517 ) ) ( not ( = ?auto_601514 ?auto_601518 ) ) ( not ( = ?auto_601514 ?auto_601519 ) ) ( not ( = ?auto_601514 ?auto_601520 ) ) ( not ( = ?auto_601514 ?auto_601521 ) ) ( not ( = ?auto_601514 ?auto_601522 ) ) ( not ( = ?auto_601514 ?auto_601523 ) ) ( not ( = ?auto_601514 ?auto_601524 ) ) ( not ( = ?auto_601515 ?auto_601516 ) ) ( not ( = ?auto_601515 ?auto_601517 ) ) ( not ( = ?auto_601515 ?auto_601518 ) ) ( not ( = ?auto_601515 ?auto_601519 ) ) ( not ( = ?auto_601515 ?auto_601520 ) ) ( not ( = ?auto_601515 ?auto_601521 ) ) ( not ( = ?auto_601515 ?auto_601522 ) ) ( not ( = ?auto_601515 ?auto_601523 ) ) ( not ( = ?auto_601515 ?auto_601524 ) ) ( not ( = ?auto_601516 ?auto_601517 ) ) ( not ( = ?auto_601516 ?auto_601518 ) ) ( not ( = ?auto_601516 ?auto_601519 ) ) ( not ( = ?auto_601516 ?auto_601520 ) ) ( not ( = ?auto_601516 ?auto_601521 ) ) ( not ( = ?auto_601516 ?auto_601522 ) ) ( not ( = ?auto_601516 ?auto_601523 ) ) ( not ( = ?auto_601516 ?auto_601524 ) ) ( not ( = ?auto_601517 ?auto_601518 ) ) ( not ( = ?auto_601517 ?auto_601519 ) ) ( not ( = ?auto_601517 ?auto_601520 ) ) ( not ( = ?auto_601517 ?auto_601521 ) ) ( not ( = ?auto_601517 ?auto_601522 ) ) ( not ( = ?auto_601517 ?auto_601523 ) ) ( not ( = ?auto_601517 ?auto_601524 ) ) ( not ( = ?auto_601518 ?auto_601519 ) ) ( not ( = ?auto_601518 ?auto_601520 ) ) ( not ( = ?auto_601518 ?auto_601521 ) ) ( not ( = ?auto_601518 ?auto_601522 ) ) ( not ( = ?auto_601518 ?auto_601523 ) ) ( not ( = ?auto_601518 ?auto_601524 ) ) ( not ( = ?auto_601519 ?auto_601520 ) ) ( not ( = ?auto_601519 ?auto_601521 ) ) ( not ( = ?auto_601519 ?auto_601522 ) ) ( not ( = ?auto_601519 ?auto_601523 ) ) ( not ( = ?auto_601519 ?auto_601524 ) ) ( not ( = ?auto_601520 ?auto_601521 ) ) ( not ( = ?auto_601520 ?auto_601522 ) ) ( not ( = ?auto_601520 ?auto_601523 ) ) ( not ( = ?auto_601520 ?auto_601524 ) ) ( not ( = ?auto_601521 ?auto_601522 ) ) ( not ( = ?auto_601521 ?auto_601523 ) ) ( not ( = ?auto_601521 ?auto_601524 ) ) ( not ( = ?auto_601522 ?auto_601523 ) ) ( not ( = ?auto_601522 ?auto_601524 ) ) ( not ( = ?auto_601523 ?auto_601524 ) ) ( ON ?auto_601522 ?auto_601523 ) ( ON ?auto_601521 ?auto_601522 ) ( CLEAR ?auto_601519 ) ( ON ?auto_601520 ?auto_601521 ) ( CLEAR ?auto_601520 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_601510 ?auto_601511 ?auto_601512 ?auto_601513 ?auto_601514 ?auto_601515 ?auto_601516 ?auto_601517 ?auto_601518 ?auto_601519 ?auto_601520 )
      ( MAKE-14PILE ?auto_601510 ?auto_601511 ?auto_601512 ?auto_601513 ?auto_601514 ?auto_601515 ?auto_601516 ?auto_601517 ?auto_601518 ?auto_601519 ?auto_601520 ?auto_601521 ?auto_601522 ?auto_601523 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_601568 - BLOCK
      ?auto_601569 - BLOCK
      ?auto_601570 - BLOCK
      ?auto_601571 - BLOCK
      ?auto_601572 - BLOCK
      ?auto_601573 - BLOCK
      ?auto_601574 - BLOCK
      ?auto_601575 - BLOCK
      ?auto_601576 - BLOCK
      ?auto_601577 - BLOCK
      ?auto_601578 - BLOCK
      ?auto_601579 - BLOCK
      ?auto_601580 - BLOCK
      ?auto_601581 - BLOCK
    )
    :vars
    (
      ?auto_601582 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_601581 ?auto_601582 ) ( ON-TABLE ?auto_601568 ) ( ON ?auto_601569 ?auto_601568 ) ( ON ?auto_601570 ?auto_601569 ) ( ON ?auto_601571 ?auto_601570 ) ( ON ?auto_601572 ?auto_601571 ) ( ON ?auto_601573 ?auto_601572 ) ( ON ?auto_601574 ?auto_601573 ) ( ON ?auto_601575 ?auto_601574 ) ( ON ?auto_601576 ?auto_601575 ) ( not ( = ?auto_601568 ?auto_601569 ) ) ( not ( = ?auto_601568 ?auto_601570 ) ) ( not ( = ?auto_601568 ?auto_601571 ) ) ( not ( = ?auto_601568 ?auto_601572 ) ) ( not ( = ?auto_601568 ?auto_601573 ) ) ( not ( = ?auto_601568 ?auto_601574 ) ) ( not ( = ?auto_601568 ?auto_601575 ) ) ( not ( = ?auto_601568 ?auto_601576 ) ) ( not ( = ?auto_601568 ?auto_601577 ) ) ( not ( = ?auto_601568 ?auto_601578 ) ) ( not ( = ?auto_601568 ?auto_601579 ) ) ( not ( = ?auto_601568 ?auto_601580 ) ) ( not ( = ?auto_601568 ?auto_601581 ) ) ( not ( = ?auto_601568 ?auto_601582 ) ) ( not ( = ?auto_601569 ?auto_601570 ) ) ( not ( = ?auto_601569 ?auto_601571 ) ) ( not ( = ?auto_601569 ?auto_601572 ) ) ( not ( = ?auto_601569 ?auto_601573 ) ) ( not ( = ?auto_601569 ?auto_601574 ) ) ( not ( = ?auto_601569 ?auto_601575 ) ) ( not ( = ?auto_601569 ?auto_601576 ) ) ( not ( = ?auto_601569 ?auto_601577 ) ) ( not ( = ?auto_601569 ?auto_601578 ) ) ( not ( = ?auto_601569 ?auto_601579 ) ) ( not ( = ?auto_601569 ?auto_601580 ) ) ( not ( = ?auto_601569 ?auto_601581 ) ) ( not ( = ?auto_601569 ?auto_601582 ) ) ( not ( = ?auto_601570 ?auto_601571 ) ) ( not ( = ?auto_601570 ?auto_601572 ) ) ( not ( = ?auto_601570 ?auto_601573 ) ) ( not ( = ?auto_601570 ?auto_601574 ) ) ( not ( = ?auto_601570 ?auto_601575 ) ) ( not ( = ?auto_601570 ?auto_601576 ) ) ( not ( = ?auto_601570 ?auto_601577 ) ) ( not ( = ?auto_601570 ?auto_601578 ) ) ( not ( = ?auto_601570 ?auto_601579 ) ) ( not ( = ?auto_601570 ?auto_601580 ) ) ( not ( = ?auto_601570 ?auto_601581 ) ) ( not ( = ?auto_601570 ?auto_601582 ) ) ( not ( = ?auto_601571 ?auto_601572 ) ) ( not ( = ?auto_601571 ?auto_601573 ) ) ( not ( = ?auto_601571 ?auto_601574 ) ) ( not ( = ?auto_601571 ?auto_601575 ) ) ( not ( = ?auto_601571 ?auto_601576 ) ) ( not ( = ?auto_601571 ?auto_601577 ) ) ( not ( = ?auto_601571 ?auto_601578 ) ) ( not ( = ?auto_601571 ?auto_601579 ) ) ( not ( = ?auto_601571 ?auto_601580 ) ) ( not ( = ?auto_601571 ?auto_601581 ) ) ( not ( = ?auto_601571 ?auto_601582 ) ) ( not ( = ?auto_601572 ?auto_601573 ) ) ( not ( = ?auto_601572 ?auto_601574 ) ) ( not ( = ?auto_601572 ?auto_601575 ) ) ( not ( = ?auto_601572 ?auto_601576 ) ) ( not ( = ?auto_601572 ?auto_601577 ) ) ( not ( = ?auto_601572 ?auto_601578 ) ) ( not ( = ?auto_601572 ?auto_601579 ) ) ( not ( = ?auto_601572 ?auto_601580 ) ) ( not ( = ?auto_601572 ?auto_601581 ) ) ( not ( = ?auto_601572 ?auto_601582 ) ) ( not ( = ?auto_601573 ?auto_601574 ) ) ( not ( = ?auto_601573 ?auto_601575 ) ) ( not ( = ?auto_601573 ?auto_601576 ) ) ( not ( = ?auto_601573 ?auto_601577 ) ) ( not ( = ?auto_601573 ?auto_601578 ) ) ( not ( = ?auto_601573 ?auto_601579 ) ) ( not ( = ?auto_601573 ?auto_601580 ) ) ( not ( = ?auto_601573 ?auto_601581 ) ) ( not ( = ?auto_601573 ?auto_601582 ) ) ( not ( = ?auto_601574 ?auto_601575 ) ) ( not ( = ?auto_601574 ?auto_601576 ) ) ( not ( = ?auto_601574 ?auto_601577 ) ) ( not ( = ?auto_601574 ?auto_601578 ) ) ( not ( = ?auto_601574 ?auto_601579 ) ) ( not ( = ?auto_601574 ?auto_601580 ) ) ( not ( = ?auto_601574 ?auto_601581 ) ) ( not ( = ?auto_601574 ?auto_601582 ) ) ( not ( = ?auto_601575 ?auto_601576 ) ) ( not ( = ?auto_601575 ?auto_601577 ) ) ( not ( = ?auto_601575 ?auto_601578 ) ) ( not ( = ?auto_601575 ?auto_601579 ) ) ( not ( = ?auto_601575 ?auto_601580 ) ) ( not ( = ?auto_601575 ?auto_601581 ) ) ( not ( = ?auto_601575 ?auto_601582 ) ) ( not ( = ?auto_601576 ?auto_601577 ) ) ( not ( = ?auto_601576 ?auto_601578 ) ) ( not ( = ?auto_601576 ?auto_601579 ) ) ( not ( = ?auto_601576 ?auto_601580 ) ) ( not ( = ?auto_601576 ?auto_601581 ) ) ( not ( = ?auto_601576 ?auto_601582 ) ) ( not ( = ?auto_601577 ?auto_601578 ) ) ( not ( = ?auto_601577 ?auto_601579 ) ) ( not ( = ?auto_601577 ?auto_601580 ) ) ( not ( = ?auto_601577 ?auto_601581 ) ) ( not ( = ?auto_601577 ?auto_601582 ) ) ( not ( = ?auto_601578 ?auto_601579 ) ) ( not ( = ?auto_601578 ?auto_601580 ) ) ( not ( = ?auto_601578 ?auto_601581 ) ) ( not ( = ?auto_601578 ?auto_601582 ) ) ( not ( = ?auto_601579 ?auto_601580 ) ) ( not ( = ?auto_601579 ?auto_601581 ) ) ( not ( = ?auto_601579 ?auto_601582 ) ) ( not ( = ?auto_601580 ?auto_601581 ) ) ( not ( = ?auto_601580 ?auto_601582 ) ) ( not ( = ?auto_601581 ?auto_601582 ) ) ( ON ?auto_601580 ?auto_601581 ) ( ON ?auto_601579 ?auto_601580 ) ( ON ?auto_601578 ?auto_601579 ) ( CLEAR ?auto_601576 ) ( ON ?auto_601577 ?auto_601578 ) ( CLEAR ?auto_601577 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_601568 ?auto_601569 ?auto_601570 ?auto_601571 ?auto_601572 ?auto_601573 ?auto_601574 ?auto_601575 ?auto_601576 ?auto_601577 )
      ( MAKE-14PILE ?auto_601568 ?auto_601569 ?auto_601570 ?auto_601571 ?auto_601572 ?auto_601573 ?auto_601574 ?auto_601575 ?auto_601576 ?auto_601577 ?auto_601578 ?auto_601579 ?auto_601580 ?auto_601581 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_601626 - BLOCK
      ?auto_601627 - BLOCK
      ?auto_601628 - BLOCK
      ?auto_601629 - BLOCK
      ?auto_601630 - BLOCK
      ?auto_601631 - BLOCK
      ?auto_601632 - BLOCK
      ?auto_601633 - BLOCK
      ?auto_601634 - BLOCK
      ?auto_601635 - BLOCK
      ?auto_601636 - BLOCK
      ?auto_601637 - BLOCK
      ?auto_601638 - BLOCK
      ?auto_601639 - BLOCK
    )
    :vars
    (
      ?auto_601640 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_601639 ?auto_601640 ) ( ON-TABLE ?auto_601626 ) ( ON ?auto_601627 ?auto_601626 ) ( ON ?auto_601628 ?auto_601627 ) ( ON ?auto_601629 ?auto_601628 ) ( ON ?auto_601630 ?auto_601629 ) ( ON ?auto_601631 ?auto_601630 ) ( ON ?auto_601632 ?auto_601631 ) ( ON ?auto_601633 ?auto_601632 ) ( not ( = ?auto_601626 ?auto_601627 ) ) ( not ( = ?auto_601626 ?auto_601628 ) ) ( not ( = ?auto_601626 ?auto_601629 ) ) ( not ( = ?auto_601626 ?auto_601630 ) ) ( not ( = ?auto_601626 ?auto_601631 ) ) ( not ( = ?auto_601626 ?auto_601632 ) ) ( not ( = ?auto_601626 ?auto_601633 ) ) ( not ( = ?auto_601626 ?auto_601634 ) ) ( not ( = ?auto_601626 ?auto_601635 ) ) ( not ( = ?auto_601626 ?auto_601636 ) ) ( not ( = ?auto_601626 ?auto_601637 ) ) ( not ( = ?auto_601626 ?auto_601638 ) ) ( not ( = ?auto_601626 ?auto_601639 ) ) ( not ( = ?auto_601626 ?auto_601640 ) ) ( not ( = ?auto_601627 ?auto_601628 ) ) ( not ( = ?auto_601627 ?auto_601629 ) ) ( not ( = ?auto_601627 ?auto_601630 ) ) ( not ( = ?auto_601627 ?auto_601631 ) ) ( not ( = ?auto_601627 ?auto_601632 ) ) ( not ( = ?auto_601627 ?auto_601633 ) ) ( not ( = ?auto_601627 ?auto_601634 ) ) ( not ( = ?auto_601627 ?auto_601635 ) ) ( not ( = ?auto_601627 ?auto_601636 ) ) ( not ( = ?auto_601627 ?auto_601637 ) ) ( not ( = ?auto_601627 ?auto_601638 ) ) ( not ( = ?auto_601627 ?auto_601639 ) ) ( not ( = ?auto_601627 ?auto_601640 ) ) ( not ( = ?auto_601628 ?auto_601629 ) ) ( not ( = ?auto_601628 ?auto_601630 ) ) ( not ( = ?auto_601628 ?auto_601631 ) ) ( not ( = ?auto_601628 ?auto_601632 ) ) ( not ( = ?auto_601628 ?auto_601633 ) ) ( not ( = ?auto_601628 ?auto_601634 ) ) ( not ( = ?auto_601628 ?auto_601635 ) ) ( not ( = ?auto_601628 ?auto_601636 ) ) ( not ( = ?auto_601628 ?auto_601637 ) ) ( not ( = ?auto_601628 ?auto_601638 ) ) ( not ( = ?auto_601628 ?auto_601639 ) ) ( not ( = ?auto_601628 ?auto_601640 ) ) ( not ( = ?auto_601629 ?auto_601630 ) ) ( not ( = ?auto_601629 ?auto_601631 ) ) ( not ( = ?auto_601629 ?auto_601632 ) ) ( not ( = ?auto_601629 ?auto_601633 ) ) ( not ( = ?auto_601629 ?auto_601634 ) ) ( not ( = ?auto_601629 ?auto_601635 ) ) ( not ( = ?auto_601629 ?auto_601636 ) ) ( not ( = ?auto_601629 ?auto_601637 ) ) ( not ( = ?auto_601629 ?auto_601638 ) ) ( not ( = ?auto_601629 ?auto_601639 ) ) ( not ( = ?auto_601629 ?auto_601640 ) ) ( not ( = ?auto_601630 ?auto_601631 ) ) ( not ( = ?auto_601630 ?auto_601632 ) ) ( not ( = ?auto_601630 ?auto_601633 ) ) ( not ( = ?auto_601630 ?auto_601634 ) ) ( not ( = ?auto_601630 ?auto_601635 ) ) ( not ( = ?auto_601630 ?auto_601636 ) ) ( not ( = ?auto_601630 ?auto_601637 ) ) ( not ( = ?auto_601630 ?auto_601638 ) ) ( not ( = ?auto_601630 ?auto_601639 ) ) ( not ( = ?auto_601630 ?auto_601640 ) ) ( not ( = ?auto_601631 ?auto_601632 ) ) ( not ( = ?auto_601631 ?auto_601633 ) ) ( not ( = ?auto_601631 ?auto_601634 ) ) ( not ( = ?auto_601631 ?auto_601635 ) ) ( not ( = ?auto_601631 ?auto_601636 ) ) ( not ( = ?auto_601631 ?auto_601637 ) ) ( not ( = ?auto_601631 ?auto_601638 ) ) ( not ( = ?auto_601631 ?auto_601639 ) ) ( not ( = ?auto_601631 ?auto_601640 ) ) ( not ( = ?auto_601632 ?auto_601633 ) ) ( not ( = ?auto_601632 ?auto_601634 ) ) ( not ( = ?auto_601632 ?auto_601635 ) ) ( not ( = ?auto_601632 ?auto_601636 ) ) ( not ( = ?auto_601632 ?auto_601637 ) ) ( not ( = ?auto_601632 ?auto_601638 ) ) ( not ( = ?auto_601632 ?auto_601639 ) ) ( not ( = ?auto_601632 ?auto_601640 ) ) ( not ( = ?auto_601633 ?auto_601634 ) ) ( not ( = ?auto_601633 ?auto_601635 ) ) ( not ( = ?auto_601633 ?auto_601636 ) ) ( not ( = ?auto_601633 ?auto_601637 ) ) ( not ( = ?auto_601633 ?auto_601638 ) ) ( not ( = ?auto_601633 ?auto_601639 ) ) ( not ( = ?auto_601633 ?auto_601640 ) ) ( not ( = ?auto_601634 ?auto_601635 ) ) ( not ( = ?auto_601634 ?auto_601636 ) ) ( not ( = ?auto_601634 ?auto_601637 ) ) ( not ( = ?auto_601634 ?auto_601638 ) ) ( not ( = ?auto_601634 ?auto_601639 ) ) ( not ( = ?auto_601634 ?auto_601640 ) ) ( not ( = ?auto_601635 ?auto_601636 ) ) ( not ( = ?auto_601635 ?auto_601637 ) ) ( not ( = ?auto_601635 ?auto_601638 ) ) ( not ( = ?auto_601635 ?auto_601639 ) ) ( not ( = ?auto_601635 ?auto_601640 ) ) ( not ( = ?auto_601636 ?auto_601637 ) ) ( not ( = ?auto_601636 ?auto_601638 ) ) ( not ( = ?auto_601636 ?auto_601639 ) ) ( not ( = ?auto_601636 ?auto_601640 ) ) ( not ( = ?auto_601637 ?auto_601638 ) ) ( not ( = ?auto_601637 ?auto_601639 ) ) ( not ( = ?auto_601637 ?auto_601640 ) ) ( not ( = ?auto_601638 ?auto_601639 ) ) ( not ( = ?auto_601638 ?auto_601640 ) ) ( not ( = ?auto_601639 ?auto_601640 ) ) ( ON ?auto_601638 ?auto_601639 ) ( ON ?auto_601637 ?auto_601638 ) ( ON ?auto_601636 ?auto_601637 ) ( ON ?auto_601635 ?auto_601636 ) ( CLEAR ?auto_601633 ) ( ON ?auto_601634 ?auto_601635 ) ( CLEAR ?auto_601634 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_601626 ?auto_601627 ?auto_601628 ?auto_601629 ?auto_601630 ?auto_601631 ?auto_601632 ?auto_601633 ?auto_601634 )
      ( MAKE-14PILE ?auto_601626 ?auto_601627 ?auto_601628 ?auto_601629 ?auto_601630 ?auto_601631 ?auto_601632 ?auto_601633 ?auto_601634 ?auto_601635 ?auto_601636 ?auto_601637 ?auto_601638 ?auto_601639 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_601684 - BLOCK
      ?auto_601685 - BLOCK
      ?auto_601686 - BLOCK
      ?auto_601687 - BLOCK
      ?auto_601688 - BLOCK
      ?auto_601689 - BLOCK
      ?auto_601690 - BLOCK
      ?auto_601691 - BLOCK
      ?auto_601692 - BLOCK
      ?auto_601693 - BLOCK
      ?auto_601694 - BLOCK
      ?auto_601695 - BLOCK
      ?auto_601696 - BLOCK
      ?auto_601697 - BLOCK
    )
    :vars
    (
      ?auto_601698 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_601697 ?auto_601698 ) ( ON-TABLE ?auto_601684 ) ( ON ?auto_601685 ?auto_601684 ) ( ON ?auto_601686 ?auto_601685 ) ( ON ?auto_601687 ?auto_601686 ) ( ON ?auto_601688 ?auto_601687 ) ( ON ?auto_601689 ?auto_601688 ) ( ON ?auto_601690 ?auto_601689 ) ( not ( = ?auto_601684 ?auto_601685 ) ) ( not ( = ?auto_601684 ?auto_601686 ) ) ( not ( = ?auto_601684 ?auto_601687 ) ) ( not ( = ?auto_601684 ?auto_601688 ) ) ( not ( = ?auto_601684 ?auto_601689 ) ) ( not ( = ?auto_601684 ?auto_601690 ) ) ( not ( = ?auto_601684 ?auto_601691 ) ) ( not ( = ?auto_601684 ?auto_601692 ) ) ( not ( = ?auto_601684 ?auto_601693 ) ) ( not ( = ?auto_601684 ?auto_601694 ) ) ( not ( = ?auto_601684 ?auto_601695 ) ) ( not ( = ?auto_601684 ?auto_601696 ) ) ( not ( = ?auto_601684 ?auto_601697 ) ) ( not ( = ?auto_601684 ?auto_601698 ) ) ( not ( = ?auto_601685 ?auto_601686 ) ) ( not ( = ?auto_601685 ?auto_601687 ) ) ( not ( = ?auto_601685 ?auto_601688 ) ) ( not ( = ?auto_601685 ?auto_601689 ) ) ( not ( = ?auto_601685 ?auto_601690 ) ) ( not ( = ?auto_601685 ?auto_601691 ) ) ( not ( = ?auto_601685 ?auto_601692 ) ) ( not ( = ?auto_601685 ?auto_601693 ) ) ( not ( = ?auto_601685 ?auto_601694 ) ) ( not ( = ?auto_601685 ?auto_601695 ) ) ( not ( = ?auto_601685 ?auto_601696 ) ) ( not ( = ?auto_601685 ?auto_601697 ) ) ( not ( = ?auto_601685 ?auto_601698 ) ) ( not ( = ?auto_601686 ?auto_601687 ) ) ( not ( = ?auto_601686 ?auto_601688 ) ) ( not ( = ?auto_601686 ?auto_601689 ) ) ( not ( = ?auto_601686 ?auto_601690 ) ) ( not ( = ?auto_601686 ?auto_601691 ) ) ( not ( = ?auto_601686 ?auto_601692 ) ) ( not ( = ?auto_601686 ?auto_601693 ) ) ( not ( = ?auto_601686 ?auto_601694 ) ) ( not ( = ?auto_601686 ?auto_601695 ) ) ( not ( = ?auto_601686 ?auto_601696 ) ) ( not ( = ?auto_601686 ?auto_601697 ) ) ( not ( = ?auto_601686 ?auto_601698 ) ) ( not ( = ?auto_601687 ?auto_601688 ) ) ( not ( = ?auto_601687 ?auto_601689 ) ) ( not ( = ?auto_601687 ?auto_601690 ) ) ( not ( = ?auto_601687 ?auto_601691 ) ) ( not ( = ?auto_601687 ?auto_601692 ) ) ( not ( = ?auto_601687 ?auto_601693 ) ) ( not ( = ?auto_601687 ?auto_601694 ) ) ( not ( = ?auto_601687 ?auto_601695 ) ) ( not ( = ?auto_601687 ?auto_601696 ) ) ( not ( = ?auto_601687 ?auto_601697 ) ) ( not ( = ?auto_601687 ?auto_601698 ) ) ( not ( = ?auto_601688 ?auto_601689 ) ) ( not ( = ?auto_601688 ?auto_601690 ) ) ( not ( = ?auto_601688 ?auto_601691 ) ) ( not ( = ?auto_601688 ?auto_601692 ) ) ( not ( = ?auto_601688 ?auto_601693 ) ) ( not ( = ?auto_601688 ?auto_601694 ) ) ( not ( = ?auto_601688 ?auto_601695 ) ) ( not ( = ?auto_601688 ?auto_601696 ) ) ( not ( = ?auto_601688 ?auto_601697 ) ) ( not ( = ?auto_601688 ?auto_601698 ) ) ( not ( = ?auto_601689 ?auto_601690 ) ) ( not ( = ?auto_601689 ?auto_601691 ) ) ( not ( = ?auto_601689 ?auto_601692 ) ) ( not ( = ?auto_601689 ?auto_601693 ) ) ( not ( = ?auto_601689 ?auto_601694 ) ) ( not ( = ?auto_601689 ?auto_601695 ) ) ( not ( = ?auto_601689 ?auto_601696 ) ) ( not ( = ?auto_601689 ?auto_601697 ) ) ( not ( = ?auto_601689 ?auto_601698 ) ) ( not ( = ?auto_601690 ?auto_601691 ) ) ( not ( = ?auto_601690 ?auto_601692 ) ) ( not ( = ?auto_601690 ?auto_601693 ) ) ( not ( = ?auto_601690 ?auto_601694 ) ) ( not ( = ?auto_601690 ?auto_601695 ) ) ( not ( = ?auto_601690 ?auto_601696 ) ) ( not ( = ?auto_601690 ?auto_601697 ) ) ( not ( = ?auto_601690 ?auto_601698 ) ) ( not ( = ?auto_601691 ?auto_601692 ) ) ( not ( = ?auto_601691 ?auto_601693 ) ) ( not ( = ?auto_601691 ?auto_601694 ) ) ( not ( = ?auto_601691 ?auto_601695 ) ) ( not ( = ?auto_601691 ?auto_601696 ) ) ( not ( = ?auto_601691 ?auto_601697 ) ) ( not ( = ?auto_601691 ?auto_601698 ) ) ( not ( = ?auto_601692 ?auto_601693 ) ) ( not ( = ?auto_601692 ?auto_601694 ) ) ( not ( = ?auto_601692 ?auto_601695 ) ) ( not ( = ?auto_601692 ?auto_601696 ) ) ( not ( = ?auto_601692 ?auto_601697 ) ) ( not ( = ?auto_601692 ?auto_601698 ) ) ( not ( = ?auto_601693 ?auto_601694 ) ) ( not ( = ?auto_601693 ?auto_601695 ) ) ( not ( = ?auto_601693 ?auto_601696 ) ) ( not ( = ?auto_601693 ?auto_601697 ) ) ( not ( = ?auto_601693 ?auto_601698 ) ) ( not ( = ?auto_601694 ?auto_601695 ) ) ( not ( = ?auto_601694 ?auto_601696 ) ) ( not ( = ?auto_601694 ?auto_601697 ) ) ( not ( = ?auto_601694 ?auto_601698 ) ) ( not ( = ?auto_601695 ?auto_601696 ) ) ( not ( = ?auto_601695 ?auto_601697 ) ) ( not ( = ?auto_601695 ?auto_601698 ) ) ( not ( = ?auto_601696 ?auto_601697 ) ) ( not ( = ?auto_601696 ?auto_601698 ) ) ( not ( = ?auto_601697 ?auto_601698 ) ) ( ON ?auto_601696 ?auto_601697 ) ( ON ?auto_601695 ?auto_601696 ) ( ON ?auto_601694 ?auto_601695 ) ( ON ?auto_601693 ?auto_601694 ) ( ON ?auto_601692 ?auto_601693 ) ( CLEAR ?auto_601690 ) ( ON ?auto_601691 ?auto_601692 ) ( CLEAR ?auto_601691 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_601684 ?auto_601685 ?auto_601686 ?auto_601687 ?auto_601688 ?auto_601689 ?auto_601690 ?auto_601691 )
      ( MAKE-14PILE ?auto_601684 ?auto_601685 ?auto_601686 ?auto_601687 ?auto_601688 ?auto_601689 ?auto_601690 ?auto_601691 ?auto_601692 ?auto_601693 ?auto_601694 ?auto_601695 ?auto_601696 ?auto_601697 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_601742 - BLOCK
      ?auto_601743 - BLOCK
      ?auto_601744 - BLOCK
      ?auto_601745 - BLOCK
      ?auto_601746 - BLOCK
      ?auto_601747 - BLOCK
      ?auto_601748 - BLOCK
      ?auto_601749 - BLOCK
      ?auto_601750 - BLOCK
      ?auto_601751 - BLOCK
      ?auto_601752 - BLOCK
      ?auto_601753 - BLOCK
      ?auto_601754 - BLOCK
      ?auto_601755 - BLOCK
    )
    :vars
    (
      ?auto_601756 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_601755 ?auto_601756 ) ( ON-TABLE ?auto_601742 ) ( ON ?auto_601743 ?auto_601742 ) ( ON ?auto_601744 ?auto_601743 ) ( ON ?auto_601745 ?auto_601744 ) ( ON ?auto_601746 ?auto_601745 ) ( ON ?auto_601747 ?auto_601746 ) ( not ( = ?auto_601742 ?auto_601743 ) ) ( not ( = ?auto_601742 ?auto_601744 ) ) ( not ( = ?auto_601742 ?auto_601745 ) ) ( not ( = ?auto_601742 ?auto_601746 ) ) ( not ( = ?auto_601742 ?auto_601747 ) ) ( not ( = ?auto_601742 ?auto_601748 ) ) ( not ( = ?auto_601742 ?auto_601749 ) ) ( not ( = ?auto_601742 ?auto_601750 ) ) ( not ( = ?auto_601742 ?auto_601751 ) ) ( not ( = ?auto_601742 ?auto_601752 ) ) ( not ( = ?auto_601742 ?auto_601753 ) ) ( not ( = ?auto_601742 ?auto_601754 ) ) ( not ( = ?auto_601742 ?auto_601755 ) ) ( not ( = ?auto_601742 ?auto_601756 ) ) ( not ( = ?auto_601743 ?auto_601744 ) ) ( not ( = ?auto_601743 ?auto_601745 ) ) ( not ( = ?auto_601743 ?auto_601746 ) ) ( not ( = ?auto_601743 ?auto_601747 ) ) ( not ( = ?auto_601743 ?auto_601748 ) ) ( not ( = ?auto_601743 ?auto_601749 ) ) ( not ( = ?auto_601743 ?auto_601750 ) ) ( not ( = ?auto_601743 ?auto_601751 ) ) ( not ( = ?auto_601743 ?auto_601752 ) ) ( not ( = ?auto_601743 ?auto_601753 ) ) ( not ( = ?auto_601743 ?auto_601754 ) ) ( not ( = ?auto_601743 ?auto_601755 ) ) ( not ( = ?auto_601743 ?auto_601756 ) ) ( not ( = ?auto_601744 ?auto_601745 ) ) ( not ( = ?auto_601744 ?auto_601746 ) ) ( not ( = ?auto_601744 ?auto_601747 ) ) ( not ( = ?auto_601744 ?auto_601748 ) ) ( not ( = ?auto_601744 ?auto_601749 ) ) ( not ( = ?auto_601744 ?auto_601750 ) ) ( not ( = ?auto_601744 ?auto_601751 ) ) ( not ( = ?auto_601744 ?auto_601752 ) ) ( not ( = ?auto_601744 ?auto_601753 ) ) ( not ( = ?auto_601744 ?auto_601754 ) ) ( not ( = ?auto_601744 ?auto_601755 ) ) ( not ( = ?auto_601744 ?auto_601756 ) ) ( not ( = ?auto_601745 ?auto_601746 ) ) ( not ( = ?auto_601745 ?auto_601747 ) ) ( not ( = ?auto_601745 ?auto_601748 ) ) ( not ( = ?auto_601745 ?auto_601749 ) ) ( not ( = ?auto_601745 ?auto_601750 ) ) ( not ( = ?auto_601745 ?auto_601751 ) ) ( not ( = ?auto_601745 ?auto_601752 ) ) ( not ( = ?auto_601745 ?auto_601753 ) ) ( not ( = ?auto_601745 ?auto_601754 ) ) ( not ( = ?auto_601745 ?auto_601755 ) ) ( not ( = ?auto_601745 ?auto_601756 ) ) ( not ( = ?auto_601746 ?auto_601747 ) ) ( not ( = ?auto_601746 ?auto_601748 ) ) ( not ( = ?auto_601746 ?auto_601749 ) ) ( not ( = ?auto_601746 ?auto_601750 ) ) ( not ( = ?auto_601746 ?auto_601751 ) ) ( not ( = ?auto_601746 ?auto_601752 ) ) ( not ( = ?auto_601746 ?auto_601753 ) ) ( not ( = ?auto_601746 ?auto_601754 ) ) ( not ( = ?auto_601746 ?auto_601755 ) ) ( not ( = ?auto_601746 ?auto_601756 ) ) ( not ( = ?auto_601747 ?auto_601748 ) ) ( not ( = ?auto_601747 ?auto_601749 ) ) ( not ( = ?auto_601747 ?auto_601750 ) ) ( not ( = ?auto_601747 ?auto_601751 ) ) ( not ( = ?auto_601747 ?auto_601752 ) ) ( not ( = ?auto_601747 ?auto_601753 ) ) ( not ( = ?auto_601747 ?auto_601754 ) ) ( not ( = ?auto_601747 ?auto_601755 ) ) ( not ( = ?auto_601747 ?auto_601756 ) ) ( not ( = ?auto_601748 ?auto_601749 ) ) ( not ( = ?auto_601748 ?auto_601750 ) ) ( not ( = ?auto_601748 ?auto_601751 ) ) ( not ( = ?auto_601748 ?auto_601752 ) ) ( not ( = ?auto_601748 ?auto_601753 ) ) ( not ( = ?auto_601748 ?auto_601754 ) ) ( not ( = ?auto_601748 ?auto_601755 ) ) ( not ( = ?auto_601748 ?auto_601756 ) ) ( not ( = ?auto_601749 ?auto_601750 ) ) ( not ( = ?auto_601749 ?auto_601751 ) ) ( not ( = ?auto_601749 ?auto_601752 ) ) ( not ( = ?auto_601749 ?auto_601753 ) ) ( not ( = ?auto_601749 ?auto_601754 ) ) ( not ( = ?auto_601749 ?auto_601755 ) ) ( not ( = ?auto_601749 ?auto_601756 ) ) ( not ( = ?auto_601750 ?auto_601751 ) ) ( not ( = ?auto_601750 ?auto_601752 ) ) ( not ( = ?auto_601750 ?auto_601753 ) ) ( not ( = ?auto_601750 ?auto_601754 ) ) ( not ( = ?auto_601750 ?auto_601755 ) ) ( not ( = ?auto_601750 ?auto_601756 ) ) ( not ( = ?auto_601751 ?auto_601752 ) ) ( not ( = ?auto_601751 ?auto_601753 ) ) ( not ( = ?auto_601751 ?auto_601754 ) ) ( not ( = ?auto_601751 ?auto_601755 ) ) ( not ( = ?auto_601751 ?auto_601756 ) ) ( not ( = ?auto_601752 ?auto_601753 ) ) ( not ( = ?auto_601752 ?auto_601754 ) ) ( not ( = ?auto_601752 ?auto_601755 ) ) ( not ( = ?auto_601752 ?auto_601756 ) ) ( not ( = ?auto_601753 ?auto_601754 ) ) ( not ( = ?auto_601753 ?auto_601755 ) ) ( not ( = ?auto_601753 ?auto_601756 ) ) ( not ( = ?auto_601754 ?auto_601755 ) ) ( not ( = ?auto_601754 ?auto_601756 ) ) ( not ( = ?auto_601755 ?auto_601756 ) ) ( ON ?auto_601754 ?auto_601755 ) ( ON ?auto_601753 ?auto_601754 ) ( ON ?auto_601752 ?auto_601753 ) ( ON ?auto_601751 ?auto_601752 ) ( ON ?auto_601750 ?auto_601751 ) ( ON ?auto_601749 ?auto_601750 ) ( CLEAR ?auto_601747 ) ( ON ?auto_601748 ?auto_601749 ) ( CLEAR ?auto_601748 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_601742 ?auto_601743 ?auto_601744 ?auto_601745 ?auto_601746 ?auto_601747 ?auto_601748 )
      ( MAKE-14PILE ?auto_601742 ?auto_601743 ?auto_601744 ?auto_601745 ?auto_601746 ?auto_601747 ?auto_601748 ?auto_601749 ?auto_601750 ?auto_601751 ?auto_601752 ?auto_601753 ?auto_601754 ?auto_601755 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_601800 - BLOCK
      ?auto_601801 - BLOCK
      ?auto_601802 - BLOCK
      ?auto_601803 - BLOCK
      ?auto_601804 - BLOCK
      ?auto_601805 - BLOCK
      ?auto_601806 - BLOCK
      ?auto_601807 - BLOCK
      ?auto_601808 - BLOCK
      ?auto_601809 - BLOCK
      ?auto_601810 - BLOCK
      ?auto_601811 - BLOCK
      ?auto_601812 - BLOCK
      ?auto_601813 - BLOCK
    )
    :vars
    (
      ?auto_601814 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_601813 ?auto_601814 ) ( ON-TABLE ?auto_601800 ) ( ON ?auto_601801 ?auto_601800 ) ( ON ?auto_601802 ?auto_601801 ) ( ON ?auto_601803 ?auto_601802 ) ( ON ?auto_601804 ?auto_601803 ) ( not ( = ?auto_601800 ?auto_601801 ) ) ( not ( = ?auto_601800 ?auto_601802 ) ) ( not ( = ?auto_601800 ?auto_601803 ) ) ( not ( = ?auto_601800 ?auto_601804 ) ) ( not ( = ?auto_601800 ?auto_601805 ) ) ( not ( = ?auto_601800 ?auto_601806 ) ) ( not ( = ?auto_601800 ?auto_601807 ) ) ( not ( = ?auto_601800 ?auto_601808 ) ) ( not ( = ?auto_601800 ?auto_601809 ) ) ( not ( = ?auto_601800 ?auto_601810 ) ) ( not ( = ?auto_601800 ?auto_601811 ) ) ( not ( = ?auto_601800 ?auto_601812 ) ) ( not ( = ?auto_601800 ?auto_601813 ) ) ( not ( = ?auto_601800 ?auto_601814 ) ) ( not ( = ?auto_601801 ?auto_601802 ) ) ( not ( = ?auto_601801 ?auto_601803 ) ) ( not ( = ?auto_601801 ?auto_601804 ) ) ( not ( = ?auto_601801 ?auto_601805 ) ) ( not ( = ?auto_601801 ?auto_601806 ) ) ( not ( = ?auto_601801 ?auto_601807 ) ) ( not ( = ?auto_601801 ?auto_601808 ) ) ( not ( = ?auto_601801 ?auto_601809 ) ) ( not ( = ?auto_601801 ?auto_601810 ) ) ( not ( = ?auto_601801 ?auto_601811 ) ) ( not ( = ?auto_601801 ?auto_601812 ) ) ( not ( = ?auto_601801 ?auto_601813 ) ) ( not ( = ?auto_601801 ?auto_601814 ) ) ( not ( = ?auto_601802 ?auto_601803 ) ) ( not ( = ?auto_601802 ?auto_601804 ) ) ( not ( = ?auto_601802 ?auto_601805 ) ) ( not ( = ?auto_601802 ?auto_601806 ) ) ( not ( = ?auto_601802 ?auto_601807 ) ) ( not ( = ?auto_601802 ?auto_601808 ) ) ( not ( = ?auto_601802 ?auto_601809 ) ) ( not ( = ?auto_601802 ?auto_601810 ) ) ( not ( = ?auto_601802 ?auto_601811 ) ) ( not ( = ?auto_601802 ?auto_601812 ) ) ( not ( = ?auto_601802 ?auto_601813 ) ) ( not ( = ?auto_601802 ?auto_601814 ) ) ( not ( = ?auto_601803 ?auto_601804 ) ) ( not ( = ?auto_601803 ?auto_601805 ) ) ( not ( = ?auto_601803 ?auto_601806 ) ) ( not ( = ?auto_601803 ?auto_601807 ) ) ( not ( = ?auto_601803 ?auto_601808 ) ) ( not ( = ?auto_601803 ?auto_601809 ) ) ( not ( = ?auto_601803 ?auto_601810 ) ) ( not ( = ?auto_601803 ?auto_601811 ) ) ( not ( = ?auto_601803 ?auto_601812 ) ) ( not ( = ?auto_601803 ?auto_601813 ) ) ( not ( = ?auto_601803 ?auto_601814 ) ) ( not ( = ?auto_601804 ?auto_601805 ) ) ( not ( = ?auto_601804 ?auto_601806 ) ) ( not ( = ?auto_601804 ?auto_601807 ) ) ( not ( = ?auto_601804 ?auto_601808 ) ) ( not ( = ?auto_601804 ?auto_601809 ) ) ( not ( = ?auto_601804 ?auto_601810 ) ) ( not ( = ?auto_601804 ?auto_601811 ) ) ( not ( = ?auto_601804 ?auto_601812 ) ) ( not ( = ?auto_601804 ?auto_601813 ) ) ( not ( = ?auto_601804 ?auto_601814 ) ) ( not ( = ?auto_601805 ?auto_601806 ) ) ( not ( = ?auto_601805 ?auto_601807 ) ) ( not ( = ?auto_601805 ?auto_601808 ) ) ( not ( = ?auto_601805 ?auto_601809 ) ) ( not ( = ?auto_601805 ?auto_601810 ) ) ( not ( = ?auto_601805 ?auto_601811 ) ) ( not ( = ?auto_601805 ?auto_601812 ) ) ( not ( = ?auto_601805 ?auto_601813 ) ) ( not ( = ?auto_601805 ?auto_601814 ) ) ( not ( = ?auto_601806 ?auto_601807 ) ) ( not ( = ?auto_601806 ?auto_601808 ) ) ( not ( = ?auto_601806 ?auto_601809 ) ) ( not ( = ?auto_601806 ?auto_601810 ) ) ( not ( = ?auto_601806 ?auto_601811 ) ) ( not ( = ?auto_601806 ?auto_601812 ) ) ( not ( = ?auto_601806 ?auto_601813 ) ) ( not ( = ?auto_601806 ?auto_601814 ) ) ( not ( = ?auto_601807 ?auto_601808 ) ) ( not ( = ?auto_601807 ?auto_601809 ) ) ( not ( = ?auto_601807 ?auto_601810 ) ) ( not ( = ?auto_601807 ?auto_601811 ) ) ( not ( = ?auto_601807 ?auto_601812 ) ) ( not ( = ?auto_601807 ?auto_601813 ) ) ( not ( = ?auto_601807 ?auto_601814 ) ) ( not ( = ?auto_601808 ?auto_601809 ) ) ( not ( = ?auto_601808 ?auto_601810 ) ) ( not ( = ?auto_601808 ?auto_601811 ) ) ( not ( = ?auto_601808 ?auto_601812 ) ) ( not ( = ?auto_601808 ?auto_601813 ) ) ( not ( = ?auto_601808 ?auto_601814 ) ) ( not ( = ?auto_601809 ?auto_601810 ) ) ( not ( = ?auto_601809 ?auto_601811 ) ) ( not ( = ?auto_601809 ?auto_601812 ) ) ( not ( = ?auto_601809 ?auto_601813 ) ) ( not ( = ?auto_601809 ?auto_601814 ) ) ( not ( = ?auto_601810 ?auto_601811 ) ) ( not ( = ?auto_601810 ?auto_601812 ) ) ( not ( = ?auto_601810 ?auto_601813 ) ) ( not ( = ?auto_601810 ?auto_601814 ) ) ( not ( = ?auto_601811 ?auto_601812 ) ) ( not ( = ?auto_601811 ?auto_601813 ) ) ( not ( = ?auto_601811 ?auto_601814 ) ) ( not ( = ?auto_601812 ?auto_601813 ) ) ( not ( = ?auto_601812 ?auto_601814 ) ) ( not ( = ?auto_601813 ?auto_601814 ) ) ( ON ?auto_601812 ?auto_601813 ) ( ON ?auto_601811 ?auto_601812 ) ( ON ?auto_601810 ?auto_601811 ) ( ON ?auto_601809 ?auto_601810 ) ( ON ?auto_601808 ?auto_601809 ) ( ON ?auto_601807 ?auto_601808 ) ( ON ?auto_601806 ?auto_601807 ) ( CLEAR ?auto_601804 ) ( ON ?auto_601805 ?auto_601806 ) ( CLEAR ?auto_601805 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_601800 ?auto_601801 ?auto_601802 ?auto_601803 ?auto_601804 ?auto_601805 )
      ( MAKE-14PILE ?auto_601800 ?auto_601801 ?auto_601802 ?auto_601803 ?auto_601804 ?auto_601805 ?auto_601806 ?auto_601807 ?auto_601808 ?auto_601809 ?auto_601810 ?auto_601811 ?auto_601812 ?auto_601813 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_601858 - BLOCK
      ?auto_601859 - BLOCK
      ?auto_601860 - BLOCK
      ?auto_601861 - BLOCK
      ?auto_601862 - BLOCK
      ?auto_601863 - BLOCK
      ?auto_601864 - BLOCK
      ?auto_601865 - BLOCK
      ?auto_601866 - BLOCK
      ?auto_601867 - BLOCK
      ?auto_601868 - BLOCK
      ?auto_601869 - BLOCK
      ?auto_601870 - BLOCK
      ?auto_601871 - BLOCK
    )
    :vars
    (
      ?auto_601872 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_601871 ?auto_601872 ) ( ON-TABLE ?auto_601858 ) ( ON ?auto_601859 ?auto_601858 ) ( ON ?auto_601860 ?auto_601859 ) ( ON ?auto_601861 ?auto_601860 ) ( not ( = ?auto_601858 ?auto_601859 ) ) ( not ( = ?auto_601858 ?auto_601860 ) ) ( not ( = ?auto_601858 ?auto_601861 ) ) ( not ( = ?auto_601858 ?auto_601862 ) ) ( not ( = ?auto_601858 ?auto_601863 ) ) ( not ( = ?auto_601858 ?auto_601864 ) ) ( not ( = ?auto_601858 ?auto_601865 ) ) ( not ( = ?auto_601858 ?auto_601866 ) ) ( not ( = ?auto_601858 ?auto_601867 ) ) ( not ( = ?auto_601858 ?auto_601868 ) ) ( not ( = ?auto_601858 ?auto_601869 ) ) ( not ( = ?auto_601858 ?auto_601870 ) ) ( not ( = ?auto_601858 ?auto_601871 ) ) ( not ( = ?auto_601858 ?auto_601872 ) ) ( not ( = ?auto_601859 ?auto_601860 ) ) ( not ( = ?auto_601859 ?auto_601861 ) ) ( not ( = ?auto_601859 ?auto_601862 ) ) ( not ( = ?auto_601859 ?auto_601863 ) ) ( not ( = ?auto_601859 ?auto_601864 ) ) ( not ( = ?auto_601859 ?auto_601865 ) ) ( not ( = ?auto_601859 ?auto_601866 ) ) ( not ( = ?auto_601859 ?auto_601867 ) ) ( not ( = ?auto_601859 ?auto_601868 ) ) ( not ( = ?auto_601859 ?auto_601869 ) ) ( not ( = ?auto_601859 ?auto_601870 ) ) ( not ( = ?auto_601859 ?auto_601871 ) ) ( not ( = ?auto_601859 ?auto_601872 ) ) ( not ( = ?auto_601860 ?auto_601861 ) ) ( not ( = ?auto_601860 ?auto_601862 ) ) ( not ( = ?auto_601860 ?auto_601863 ) ) ( not ( = ?auto_601860 ?auto_601864 ) ) ( not ( = ?auto_601860 ?auto_601865 ) ) ( not ( = ?auto_601860 ?auto_601866 ) ) ( not ( = ?auto_601860 ?auto_601867 ) ) ( not ( = ?auto_601860 ?auto_601868 ) ) ( not ( = ?auto_601860 ?auto_601869 ) ) ( not ( = ?auto_601860 ?auto_601870 ) ) ( not ( = ?auto_601860 ?auto_601871 ) ) ( not ( = ?auto_601860 ?auto_601872 ) ) ( not ( = ?auto_601861 ?auto_601862 ) ) ( not ( = ?auto_601861 ?auto_601863 ) ) ( not ( = ?auto_601861 ?auto_601864 ) ) ( not ( = ?auto_601861 ?auto_601865 ) ) ( not ( = ?auto_601861 ?auto_601866 ) ) ( not ( = ?auto_601861 ?auto_601867 ) ) ( not ( = ?auto_601861 ?auto_601868 ) ) ( not ( = ?auto_601861 ?auto_601869 ) ) ( not ( = ?auto_601861 ?auto_601870 ) ) ( not ( = ?auto_601861 ?auto_601871 ) ) ( not ( = ?auto_601861 ?auto_601872 ) ) ( not ( = ?auto_601862 ?auto_601863 ) ) ( not ( = ?auto_601862 ?auto_601864 ) ) ( not ( = ?auto_601862 ?auto_601865 ) ) ( not ( = ?auto_601862 ?auto_601866 ) ) ( not ( = ?auto_601862 ?auto_601867 ) ) ( not ( = ?auto_601862 ?auto_601868 ) ) ( not ( = ?auto_601862 ?auto_601869 ) ) ( not ( = ?auto_601862 ?auto_601870 ) ) ( not ( = ?auto_601862 ?auto_601871 ) ) ( not ( = ?auto_601862 ?auto_601872 ) ) ( not ( = ?auto_601863 ?auto_601864 ) ) ( not ( = ?auto_601863 ?auto_601865 ) ) ( not ( = ?auto_601863 ?auto_601866 ) ) ( not ( = ?auto_601863 ?auto_601867 ) ) ( not ( = ?auto_601863 ?auto_601868 ) ) ( not ( = ?auto_601863 ?auto_601869 ) ) ( not ( = ?auto_601863 ?auto_601870 ) ) ( not ( = ?auto_601863 ?auto_601871 ) ) ( not ( = ?auto_601863 ?auto_601872 ) ) ( not ( = ?auto_601864 ?auto_601865 ) ) ( not ( = ?auto_601864 ?auto_601866 ) ) ( not ( = ?auto_601864 ?auto_601867 ) ) ( not ( = ?auto_601864 ?auto_601868 ) ) ( not ( = ?auto_601864 ?auto_601869 ) ) ( not ( = ?auto_601864 ?auto_601870 ) ) ( not ( = ?auto_601864 ?auto_601871 ) ) ( not ( = ?auto_601864 ?auto_601872 ) ) ( not ( = ?auto_601865 ?auto_601866 ) ) ( not ( = ?auto_601865 ?auto_601867 ) ) ( not ( = ?auto_601865 ?auto_601868 ) ) ( not ( = ?auto_601865 ?auto_601869 ) ) ( not ( = ?auto_601865 ?auto_601870 ) ) ( not ( = ?auto_601865 ?auto_601871 ) ) ( not ( = ?auto_601865 ?auto_601872 ) ) ( not ( = ?auto_601866 ?auto_601867 ) ) ( not ( = ?auto_601866 ?auto_601868 ) ) ( not ( = ?auto_601866 ?auto_601869 ) ) ( not ( = ?auto_601866 ?auto_601870 ) ) ( not ( = ?auto_601866 ?auto_601871 ) ) ( not ( = ?auto_601866 ?auto_601872 ) ) ( not ( = ?auto_601867 ?auto_601868 ) ) ( not ( = ?auto_601867 ?auto_601869 ) ) ( not ( = ?auto_601867 ?auto_601870 ) ) ( not ( = ?auto_601867 ?auto_601871 ) ) ( not ( = ?auto_601867 ?auto_601872 ) ) ( not ( = ?auto_601868 ?auto_601869 ) ) ( not ( = ?auto_601868 ?auto_601870 ) ) ( not ( = ?auto_601868 ?auto_601871 ) ) ( not ( = ?auto_601868 ?auto_601872 ) ) ( not ( = ?auto_601869 ?auto_601870 ) ) ( not ( = ?auto_601869 ?auto_601871 ) ) ( not ( = ?auto_601869 ?auto_601872 ) ) ( not ( = ?auto_601870 ?auto_601871 ) ) ( not ( = ?auto_601870 ?auto_601872 ) ) ( not ( = ?auto_601871 ?auto_601872 ) ) ( ON ?auto_601870 ?auto_601871 ) ( ON ?auto_601869 ?auto_601870 ) ( ON ?auto_601868 ?auto_601869 ) ( ON ?auto_601867 ?auto_601868 ) ( ON ?auto_601866 ?auto_601867 ) ( ON ?auto_601865 ?auto_601866 ) ( ON ?auto_601864 ?auto_601865 ) ( ON ?auto_601863 ?auto_601864 ) ( CLEAR ?auto_601861 ) ( ON ?auto_601862 ?auto_601863 ) ( CLEAR ?auto_601862 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_601858 ?auto_601859 ?auto_601860 ?auto_601861 ?auto_601862 )
      ( MAKE-14PILE ?auto_601858 ?auto_601859 ?auto_601860 ?auto_601861 ?auto_601862 ?auto_601863 ?auto_601864 ?auto_601865 ?auto_601866 ?auto_601867 ?auto_601868 ?auto_601869 ?auto_601870 ?auto_601871 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_601916 - BLOCK
      ?auto_601917 - BLOCK
      ?auto_601918 - BLOCK
      ?auto_601919 - BLOCK
      ?auto_601920 - BLOCK
      ?auto_601921 - BLOCK
      ?auto_601922 - BLOCK
      ?auto_601923 - BLOCK
      ?auto_601924 - BLOCK
      ?auto_601925 - BLOCK
      ?auto_601926 - BLOCK
      ?auto_601927 - BLOCK
      ?auto_601928 - BLOCK
      ?auto_601929 - BLOCK
    )
    :vars
    (
      ?auto_601930 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_601929 ?auto_601930 ) ( ON-TABLE ?auto_601916 ) ( ON ?auto_601917 ?auto_601916 ) ( ON ?auto_601918 ?auto_601917 ) ( not ( = ?auto_601916 ?auto_601917 ) ) ( not ( = ?auto_601916 ?auto_601918 ) ) ( not ( = ?auto_601916 ?auto_601919 ) ) ( not ( = ?auto_601916 ?auto_601920 ) ) ( not ( = ?auto_601916 ?auto_601921 ) ) ( not ( = ?auto_601916 ?auto_601922 ) ) ( not ( = ?auto_601916 ?auto_601923 ) ) ( not ( = ?auto_601916 ?auto_601924 ) ) ( not ( = ?auto_601916 ?auto_601925 ) ) ( not ( = ?auto_601916 ?auto_601926 ) ) ( not ( = ?auto_601916 ?auto_601927 ) ) ( not ( = ?auto_601916 ?auto_601928 ) ) ( not ( = ?auto_601916 ?auto_601929 ) ) ( not ( = ?auto_601916 ?auto_601930 ) ) ( not ( = ?auto_601917 ?auto_601918 ) ) ( not ( = ?auto_601917 ?auto_601919 ) ) ( not ( = ?auto_601917 ?auto_601920 ) ) ( not ( = ?auto_601917 ?auto_601921 ) ) ( not ( = ?auto_601917 ?auto_601922 ) ) ( not ( = ?auto_601917 ?auto_601923 ) ) ( not ( = ?auto_601917 ?auto_601924 ) ) ( not ( = ?auto_601917 ?auto_601925 ) ) ( not ( = ?auto_601917 ?auto_601926 ) ) ( not ( = ?auto_601917 ?auto_601927 ) ) ( not ( = ?auto_601917 ?auto_601928 ) ) ( not ( = ?auto_601917 ?auto_601929 ) ) ( not ( = ?auto_601917 ?auto_601930 ) ) ( not ( = ?auto_601918 ?auto_601919 ) ) ( not ( = ?auto_601918 ?auto_601920 ) ) ( not ( = ?auto_601918 ?auto_601921 ) ) ( not ( = ?auto_601918 ?auto_601922 ) ) ( not ( = ?auto_601918 ?auto_601923 ) ) ( not ( = ?auto_601918 ?auto_601924 ) ) ( not ( = ?auto_601918 ?auto_601925 ) ) ( not ( = ?auto_601918 ?auto_601926 ) ) ( not ( = ?auto_601918 ?auto_601927 ) ) ( not ( = ?auto_601918 ?auto_601928 ) ) ( not ( = ?auto_601918 ?auto_601929 ) ) ( not ( = ?auto_601918 ?auto_601930 ) ) ( not ( = ?auto_601919 ?auto_601920 ) ) ( not ( = ?auto_601919 ?auto_601921 ) ) ( not ( = ?auto_601919 ?auto_601922 ) ) ( not ( = ?auto_601919 ?auto_601923 ) ) ( not ( = ?auto_601919 ?auto_601924 ) ) ( not ( = ?auto_601919 ?auto_601925 ) ) ( not ( = ?auto_601919 ?auto_601926 ) ) ( not ( = ?auto_601919 ?auto_601927 ) ) ( not ( = ?auto_601919 ?auto_601928 ) ) ( not ( = ?auto_601919 ?auto_601929 ) ) ( not ( = ?auto_601919 ?auto_601930 ) ) ( not ( = ?auto_601920 ?auto_601921 ) ) ( not ( = ?auto_601920 ?auto_601922 ) ) ( not ( = ?auto_601920 ?auto_601923 ) ) ( not ( = ?auto_601920 ?auto_601924 ) ) ( not ( = ?auto_601920 ?auto_601925 ) ) ( not ( = ?auto_601920 ?auto_601926 ) ) ( not ( = ?auto_601920 ?auto_601927 ) ) ( not ( = ?auto_601920 ?auto_601928 ) ) ( not ( = ?auto_601920 ?auto_601929 ) ) ( not ( = ?auto_601920 ?auto_601930 ) ) ( not ( = ?auto_601921 ?auto_601922 ) ) ( not ( = ?auto_601921 ?auto_601923 ) ) ( not ( = ?auto_601921 ?auto_601924 ) ) ( not ( = ?auto_601921 ?auto_601925 ) ) ( not ( = ?auto_601921 ?auto_601926 ) ) ( not ( = ?auto_601921 ?auto_601927 ) ) ( not ( = ?auto_601921 ?auto_601928 ) ) ( not ( = ?auto_601921 ?auto_601929 ) ) ( not ( = ?auto_601921 ?auto_601930 ) ) ( not ( = ?auto_601922 ?auto_601923 ) ) ( not ( = ?auto_601922 ?auto_601924 ) ) ( not ( = ?auto_601922 ?auto_601925 ) ) ( not ( = ?auto_601922 ?auto_601926 ) ) ( not ( = ?auto_601922 ?auto_601927 ) ) ( not ( = ?auto_601922 ?auto_601928 ) ) ( not ( = ?auto_601922 ?auto_601929 ) ) ( not ( = ?auto_601922 ?auto_601930 ) ) ( not ( = ?auto_601923 ?auto_601924 ) ) ( not ( = ?auto_601923 ?auto_601925 ) ) ( not ( = ?auto_601923 ?auto_601926 ) ) ( not ( = ?auto_601923 ?auto_601927 ) ) ( not ( = ?auto_601923 ?auto_601928 ) ) ( not ( = ?auto_601923 ?auto_601929 ) ) ( not ( = ?auto_601923 ?auto_601930 ) ) ( not ( = ?auto_601924 ?auto_601925 ) ) ( not ( = ?auto_601924 ?auto_601926 ) ) ( not ( = ?auto_601924 ?auto_601927 ) ) ( not ( = ?auto_601924 ?auto_601928 ) ) ( not ( = ?auto_601924 ?auto_601929 ) ) ( not ( = ?auto_601924 ?auto_601930 ) ) ( not ( = ?auto_601925 ?auto_601926 ) ) ( not ( = ?auto_601925 ?auto_601927 ) ) ( not ( = ?auto_601925 ?auto_601928 ) ) ( not ( = ?auto_601925 ?auto_601929 ) ) ( not ( = ?auto_601925 ?auto_601930 ) ) ( not ( = ?auto_601926 ?auto_601927 ) ) ( not ( = ?auto_601926 ?auto_601928 ) ) ( not ( = ?auto_601926 ?auto_601929 ) ) ( not ( = ?auto_601926 ?auto_601930 ) ) ( not ( = ?auto_601927 ?auto_601928 ) ) ( not ( = ?auto_601927 ?auto_601929 ) ) ( not ( = ?auto_601927 ?auto_601930 ) ) ( not ( = ?auto_601928 ?auto_601929 ) ) ( not ( = ?auto_601928 ?auto_601930 ) ) ( not ( = ?auto_601929 ?auto_601930 ) ) ( ON ?auto_601928 ?auto_601929 ) ( ON ?auto_601927 ?auto_601928 ) ( ON ?auto_601926 ?auto_601927 ) ( ON ?auto_601925 ?auto_601926 ) ( ON ?auto_601924 ?auto_601925 ) ( ON ?auto_601923 ?auto_601924 ) ( ON ?auto_601922 ?auto_601923 ) ( ON ?auto_601921 ?auto_601922 ) ( ON ?auto_601920 ?auto_601921 ) ( CLEAR ?auto_601918 ) ( ON ?auto_601919 ?auto_601920 ) ( CLEAR ?auto_601919 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_601916 ?auto_601917 ?auto_601918 ?auto_601919 )
      ( MAKE-14PILE ?auto_601916 ?auto_601917 ?auto_601918 ?auto_601919 ?auto_601920 ?auto_601921 ?auto_601922 ?auto_601923 ?auto_601924 ?auto_601925 ?auto_601926 ?auto_601927 ?auto_601928 ?auto_601929 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_601974 - BLOCK
      ?auto_601975 - BLOCK
      ?auto_601976 - BLOCK
      ?auto_601977 - BLOCK
      ?auto_601978 - BLOCK
      ?auto_601979 - BLOCK
      ?auto_601980 - BLOCK
      ?auto_601981 - BLOCK
      ?auto_601982 - BLOCK
      ?auto_601983 - BLOCK
      ?auto_601984 - BLOCK
      ?auto_601985 - BLOCK
      ?auto_601986 - BLOCK
      ?auto_601987 - BLOCK
    )
    :vars
    (
      ?auto_601988 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_601987 ?auto_601988 ) ( ON-TABLE ?auto_601974 ) ( ON ?auto_601975 ?auto_601974 ) ( not ( = ?auto_601974 ?auto_601975 ) ) ( not ( = ?auto_601974 ?auto_601976 ) ) ( not ( = ?auto_601974 ?auto_601977 ) ) ( not ( = ?auto_601974 ?auto_601978 ) ) ( not ( = ?auto_601974 ?auto_601979 ) ) ( not ( = ?auto_601974 ?auto_601980 ) ) ( not ( = ?auto_601974 ?auto_601981 ) ) ( not ( = ?auto_601974 ?auto_601982 ) ) ( not ( = ?auto_601974 ?auto_601983 ) ) ( not ( = ?auto_601974 ?auto_601984 ) ) ( not ( = ?auto_601974 ?auto_601985 ) ) ( not ( = ?auto_601974 ?auto_601986 ) ) ( not ( = ?auto_601974 ?auto_601987 ) ) ( not ( = ?auto_601974 ?auto_601988 ) ) ( not ( = ?auto_601975 ?auto_601976 ) ) ( not ( = ?auto_601975 ?auto_601977 ) ) ( not ( = ?auto_601975 ?auto_601978 ) ) ( not ( = ?auto_601975 ?auto_601979 ) ) ( not ( = ?auto_601975 ?auto_601980 ) ) ( not ( = ?auto_601975 ?auto_601981 ) ) ( not ( = ?auto_601975 ?auto_601982 ) ) ( not ( = ?auto_601975 ?auto_601983 ) ) ( not ( = ?auto_601975 ?auto_601984 ) ) ( not ( = ?auto_601975 ?auto_601985 ) ) ( not ( = ?auto_601975 ?auto_601986 ) ) ( not ( = ?auto_601975 ?auto_601987 ) ) ( not ( = ?auto_601975 ?auto_601988 ) ) ( not ( = ?auto_601976 ?auto_601977 ) ) ( not ( = ?auto_601976 ?auto_601978 ) ) ( not ( = ?auto_601976 ?auto_601979 ) ) ( not ( = ?auto_601976 ?auto_601980 ) ) ( not ( = ?auto_601976 ?auto_601981 ) ) ( not ( = ?auto_601976 ?auto_601982 ) ) ( not ( = ?auto_601976 ?auto_601983 ) ) ( not ( = ?auto_601976 ?auto_601984 ) ) ( not ( = ?auto_601976 ?auto_601985 ) ) ( not ( = ?auto_601976 ?auto_601986 ) ) ( not ( = ?auto_601976 ?auto_601987 ) ) ( not ( = ?auto_601976 ?auto_601988 ) ) ( not ( = ?auto_601977 ?auto_601978 ) ) ( not ( = ?auto_601977 ?auto_601979 ) ) ( not ( = ?auto_601977 ?auto_601980 ) ) ( not ( = ?auto_601977 ?auto_601981 ) ) ( not ( = ?auto_601977 ?auto_601982 ) ) ( not ( = ?auto_601977 ?auto_601983 ) ) ( not ( = ?auto_601977 ?auto_601984 ) ) ( not ( = ?auto_601977 ?auto_601985 ) ) ( not ( = ?auto_601977 ?auto_601986 ) ) ( not ( = ?auto_601977 ?auto_601987 ) ) ( not ( = ?auto_601977 ?auto_601988 ) ) ( not ( = ?auto_601978 ?auto_601979 ) ) ( not ( = ?auto_601978 ?auto_601980 ) ) ( not ( = ?auto_601978 ?auto_601981 ) ) ( not ( = ?auto_601978 ?auto_601982 ) ) ( not ( = ?auto_601978 ?auto_601983 ) ) ( not ( = ?auto_601978 ?auto_601984 ) ) ( not ( = ?auto_601978 ?auto_601985 ) ) ( not ( = ?auto_601978 ?auto_601986 ) ) ( not ( = ?auto_601978 ?auto_601987 ) ) ( not ( = ?auto_601978 ?auto_601988 ) ) ( not ( = ?auto_601979 ?auto_601980 ) ) ( not ( = ?auto_601979 ?auto_601981 ) ) ( not ( = ?auto_601979 ?auto_601982 ) ) ( not ( = ?auto_601979 ?auto_601983 ) ) ( not ( = ?auto_601979 ?auto_601984 ) ) ( not ( = ?auto_601979 ?auto_601985 ) ) ( not ( = ?auto_601979 ?auto_601986 ) ) ( not ( = ?auto_601979 ?auto_601987 ) ) ( not ( = ?auto_601979 ?auto_601988 ) ) ( not ( = ?auto_601980 ?auto_601981 ) ) ( not ( = ?auto_601980 ?auto_601982 ) ) ( not ( = ?auto_601980 ?auto_601983 ) ) ( not ( = ?auto_601980 ?auto_601984 ) ) ( not ( = ?auto_601980 ?auto_601985 ) ) ( not ( = ?auto_601980 ?auto_601986 ) ) ( not ( = ?auto_601980 ?auto_601987 ) ) ( not ( = ?auto_601980 ?auto_601988 ) ) ( not ( = ?auto_601981 ?auto_601982 ) ) ( not ( = ?auto_601981 ?auto_601983 ) ) ( not ( = ?auto_601981 ?auto_601984 ) ) ( not ( = ?auto_601981 ?auto_601985 ) ) ( not ( = ?auto_601981 ?auto_601986 ) ) ( not ( = ?auto_601981 ?auto_601987 ) ) ( not ( = ?auto_601981 ?auto_601988 ) ) ( not ( = ?auto_601982 ?auto_601983 ) ) ( not ( = ?auto_601982 ?auto_601984 ) ) ( not ( = ?auto_601982 ?auto_601985 ) ) ( not ( = ?auto_601982 ?auto_601986 ) ) ( not ( = ?auto_601982 ?auto_601987 ) ) ( not ( = ?auto_601982 ?auto_601988 ) ) ( not ( = ?auto_601983 ?auto_601984 ) ) ( not ( = ?auto_601983 ?auto_601985 ) ) ( not ( = ?auto_601983 ?auto_601986 ) ) ( not ( = ?auto_601983 ?auto_601987 ) ) ( not ( = ?auto_601983 ?auto_601988 ) ) ( not ( = ?auto_601984 ?auto_601985 ) ) ( not ( = ?auto_601984 ?auto_601986 ) ) ( not ( = ?auto_601984 ?auto_601987 ) ) ( not ( = ?auto_601984 ?auto_601988 ) ) ( not ( = ?auto_601985 ?auto_601986 ) ) ( not ( = ?auto_601985 ?auto_601987 ) ) ( not ( = ?auto_601985 ?auto_601988 ) ) ( not ( = ?auto_601986 ?auto_601987 ) ) ( not ( = ?auto_601986 ?auto_601988 ) ) ( not ( = ?auto_601987 ?auto_601988 ) ) ( ON ?auto_601986 ?auto_601987 ) ( ON ?auto_601985 ?auto_601986 ) ( ON ?auto_601984 ?auto_601985 ) ( ON ?auto_601983 ?auto_601984 ) ( ON ?auto_601982 ?auto_601983 ) ( ON ?auto_601981 ?auto_601982 ) ( ON ?auto_601980 ?auto_601981 ) ( ON ?auto_601979 ?auto_601980 ) ( ON ?auto_601978 ?auto_601979 ) ( ON ?auto_601977 ?auto_601978 ) ( CLEAR ?auto_601975 ) ( ON ?auto_601976 ?auto_601977 ) ( CLEAR ?auto_601976 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_601974 ?auto_601975 ?auto_601976 )
      ( MAKE-14PILE ?auto_601974 ?auto_601975 ?auto_601976 ?auto_601977 ?auto_601978 ?auto_601979 ?auto_601980 ?auto_601981 ?auto_601982 ?auto_601983 ?auto_601984 ?auto_601985 ?auto_601986 ?auto_601987 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_602032 - BLOCK
      ?auto_602033 - BLOCK
      ?auto_602034 - BLOCK
      ?auto_602035 - BLOCK
      ?auto_602036 - BLOCK
      ?auto_602037 - BLOCK
      ?auto_602038 - BLOCK
      ?auto_602039 - BLOCK
      ?auto_602040 - BLOCK
      ?auto_602041 - BLOCK
      ?auto_602042 - BLOCK
      ?auto_602043 - BLOCK
      ?auto_602044 - BLOCK
      ?auto_602045 - BLOCK
    )
    :vars
    (
      ?auto_602046 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_602045 ?auto_602046 ) ( ON-TABLE ?auto_602032 ) ( not ( = ?auto_602032 ?auto_602033 ) ) ( not ( = ?auto_602032 ?auto_602034 ) ) ( not ( = ?auto_602032 ?auto_602035 ) ) ( not ( = ?auto_602032 ?auto_602036 ) ) ( not ( = ?auto_602032 ?auto_602037 ) ) ( not ( = ?auto_602032 ?auto_602038 ) ) ( not ( = ?auto_602032 ?auto_602039 ) ) ( not ( = ?auto_602032 ?auto_602040 ) ) ( not ( = ?auto_602032 ?auto_602041 ) ) ( not ( = ?auto_602032 ?auto_602042 ) ) ( not ( = ?auto_602032 ?auto_602043 ) ) ( not ( = ?auto_602032 ?auto_602044 ) ) ( not ( = ?auto_602032 ?auto_602045 ) ) ( not ( = ?auto_602032 ?auto_602046 ) ) ( not ( = ?auto_602033 ?auto_602034 ) ) ( not ( = ?auto_602033 ?auto_602035 ) ) ( not ( = ?auto_602033 ?auto_602036 ) ) ( not ( = ?auto_602033 ?auto_602037 ) ) ( not ( = ?auto_602033 ?auto_602038 ) ) ( not ( = ?auto_602033 ?auto_602039 ) ) ( not ( = ?auto_602033 ?auto_602040 ) ) ( not ( = ?auto_602033 ?auto_602041 ) ) ( not ( = ?auto_602033 ?auto_602042 ) ) ( not ( = ?auto_602033 ?auto_602043 ) ) ( not ( = ?auto_602033 ?auto_602044 ) ) ( not ( = ?auto_602033 ?auto_602045 ) ) ( not ( = ?auto_602033 ?auto_602046 ) ) ( not ( = ?auto_602034 ?auto_602035 ) ) ( not ( = ?auto_602034 ?auto_602036 ) ) ( not ( = ?auto_602034 ?auto_602037 ) ) ( not ( = ?auto_602034 ?auto_602038 ) ) ( not ( = ?auto_602034 ?auto_602039 ) ) ( not ( = ?auto_602034 ?auto_602040 ) ) ( not ( = ?auto_602034 ?auto_602041 ) ) ( not ( = ?auto_602034 ?auto_602042 ) ) ( not ( = ?auto_602034 ?auto_602043 ) ) ( not ( = ?auto_602034 ?auto_602044 ) ) ( not ( = ?auto_602034 ?auto_602045 ) ) ( not ( = ?auto_602034 ?auto_602046 ) ) ( not ( = ?auto_602035 ?auto_602036 ) ) ( not ( = ?auto_602035 ?auto_602037 ) ) ( not ( = ?auto_602035 ?auto_602038 ) ) ( not ( = ?auto_602035 ?auto_602039 ) ) ( not ( = ?auto_602035 ?auto_602040 ) ) ( not ( = ?auto_602035 ?auto_602041 ) ) ( not ( = ?auto_602035 ?auto_602042 ) ) ( not ( = ?auto_602035 ?auto_602043 ) ) ( not ( = ?auto_602035 ?auto_602044 ) ) ( not ( = ?auto_602035 ?auto_602045 ) ) ( not ( = ?auto_602035 ?auto_602046 ) ) ( not ( = ?auto_602036 ?auto_602037 ) ) ( not ( = ?auto_602036 ?auto_602038 ) ) ( not ( = ?auto_602036 ?auto_602039 ) ) ( not ( = ?auto_602036 ?auto_602040 ) ) ( not ( = ?auto_602036 ?auto_602041 ) ) ( not ( = ?auto_602036 ?auto_602042 ) ) ( not ( = ?auto_602036 ?auto_602043 ) ) ( not ( = ?auto_602036 ?auto_602044 ) ) ( not ( = ?auto_602036 ?auto_602045 ) ) ( not ( = ?auto_602036 ?auto_602046 ) ) ( not ( = ?auto_602037 ?auto_602038 ) ) ( not ( = ?auto_602037 ?auto_602039 ) ) ( not ( = ?auto_602037 ?auto_602040 ) ) ( not ( = ?auto_602037 ?auto_602041 ) ) ( not ( = ?auto_602037 ?auto_602042 ) ) ( not ( = ?auto_602037 ?auto_602043 ) ) ( not ( = ?auto_602037 ?auto_602044 ) ) ( not ( = ?auto_602037 ?auto_602045 ) ) ( not ( = ?auto_602037 ?auto_602046 ) ) ( not ( = ?auto_602038 ?auto_602039 ) ) ( not ( = ?auto_602038 ?auto_602040 ) ) ( not ( = ?auto_602038 ?auto_602041 ) ) ( not ( = ?auto_602038 ?auto_602042 ) ) ( not ( = ?auto_602038 ?auto_602043 ) ) ( not ( = ?auto_602038 ?auto_602044 ) ) ( not ( = ?auto_602038 ?auto_602045 ) ) ( not ( = ?auto_602038 ?auto_602046 ) ) ( not ( = ?auto_602039 ?auto_602040 ) ) ( not ( = ?auto_602039 ?auto_602041 ) ) ( not ( = ?auto_602039 ?auto_602042 ) ) ( not ( = ?auto_602039 ?auto_602043 ) ) ( not ( = ?auto_602039 ?auto_602044 ) ) ( not ( = ?auto_602039 ?auto_602045 ) ) ( not ( = ?auto_602039 ?auto_602046 ) ) ( not ( = ?auto_602040 ?auto_602041 ) ) ( not ( = ?auto_602040 ?auto_602042 ) ) ( not ( = ?auto_602040 ?auto_602043 ) ) ( not ( = ?auto_602040 ?auto_602044 ) ) ( not ( = ?auto_602040 ?auto_602045 ) ) ( not ( = ?auto_602040 ?auto_602046 ) ) ( not ( = ?auto_602041 ?auto_602042 ) ) ( not ( = ?auto_602041 ?auto_602043 ) ) ( not ( = ?auto_602041 ?auto_602044 ) ) ( not ( = ?auto_602041 ?auto_602045 ) ) ( not ( = ?auto_602041 ?auto_602046 ) ) ( not ( = ?auto_602042 ?auto_602043 ) ) ( not ( = ?auto_602042 ?auto_602044 ) ) ( not ( = ?auto_602042 ?auto_602045 ) ) ( not ( = ?auto_602042 ?auto_602046 ) ) ( not ( = ?auto_602043 ?auto_602044 ) ) ( not ( = ?auto_602043 ?auto_602045 ) ) ( not ( = ?auto_602043 ?auto_602046 ) ) ( not ( = ?auto_602044 ?auto_602045 ) ) ( not ( = ?auto_602044 ?auto_602046 ) ) ( not ( = ?auto_602045 ?auto_602046 ) ) ( ON ?auto_602044 ?auto_602045 ) ( ON ?auto_602043 ?auto_602044 ) ( ON ?auto_602042 ?auto_602043 ) ( ON ?auto_602041 ?auto_602042 ) ( ON ?auto_602040 ?auto_602041 ) ( ON ?auto_602039 ?auto_602040 ) ( ON ?auto_602038 ?auto_602039 ) ( ON ?auto_602037 ?auto_602038 ) ( ON ?auto_602036 ?auto_602037 ) ( ON ?auto_602035 ?auto_602036 ) ( ON ?auto_602034 ?auto_602035 ) ( CLEAR ?auto_602032 ) ( ON ?auto_602033 ?auto_602034 ) ( CLEAR ?auto_602033 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_602032 ?auto_602033 )
      ( MAKE-14PILE ?auto_602032 ?auto_602033 ?auto_602034 ?auto_602035 ?auto_602036 ?auto_602037 ?auto_602038 ?auto_602039 ?auto_602040 ?auto_602041 ?auto_602042 ?auto_602043 ?auto_602044 ?auto_602045 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_602090 - BLOCK
      ?auto_602091 - BLOCK
      ?auto_602092 - BLOCK
      ?auto_602093 - BLOCK
      ?auto_602094 - BLOCK
      ?auto_602095 - BLOCK
      ?auto_602096 - BLOCK
      ?auto_602097 - BLOCK
      ?auto_602098 - BLOCK
      ?auto_602099 - BLOCK
      ?auto_602100 - BLOCK
      ?auto_602101 - BLOCK
      ?auto_602102 - BLOCK
      ?auto_602103 - BLOCK
    )
    :vars
    (
      ?auto_602104 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_602103 ?auto_602104 ) ( not ( = ?auto_602090 ?auto_602091 ) ) ( not ( = ?auto_602090 ?auto_602092 ) ) ( not ( = ?auto_602090 ?auto_602093 ) ) ( not ( = ?auto_602090 ?auto_602094 ) ) ( not ( = ?auto_602090 ?auto_602095 ) ) ( not ( = ?auto_602090 ?auto_602096 ) ) ( not ( = ?auto_602090 ?auto_602097 ) ) ( not ( = ?auto_602090 ?auto_602098 ) ) ( not ( = ?auto_602090 ?auto_602099 ) ) ( not ( = ?auto_602090 ?auto_602100 ) ) ( not ( = ?auto_602090 ?auto_602101 ) ) ( not ( = ?auto_602090 ?auto_602102 ) ) ( not ( = ?auto_602090 ?auto_602103 ) ) ( not ( = ?auto_602090 ?auto_602104 ) ) ( not ( = ?auto_602091 ?auto_602092 ) ) ( not ( = ?auto_602091 ?auto_602093 ) ) ( not ( = ?auto_602091 ?auto_602094 ) ) ( not ( = ?auto_602091 ?auto_602095 ) ) ( not ( = ?auto_602091 ?auto_602096 ) ) ( not ( = ?auto_602091 ?auto_602097 ) ) ( not ( = ?auto_602091 ?auto_602098 ) ) ( not ( = ?auto_602091 ?auto_602099 ) ) ( not ( = ?auto_602091 ?auto_602100 ) ) ( not ( = ?auto_602091 ?auto_602101 ) ) ( not ( = ?auto_602091 ?auto_602102 ) ) ( not ( = ?auto_602091 ?auto_602103 ) ) ( not ( = ?auto_602091 ?auto_602104 ) ) ( not ( = ?auto_602092 ?auto_602093 ) ) ( not ( = ?auto_602092 ?auto_602094 ) ) ( not ( = ?auto_602092 ?auto_602095 ) ) ( not ( = ?auto_602092 ?auto_602096 ) ) ( not ( = ?auto_602092 ?auto_602097 ) ) ( not ( = ?auto_602092 ?auto_602098 ) ) ( not ( = ?auto_602092 ?auto_602099 ) ) ( not ( = ?auto_602092 ?auto_602100 ) ) ( not ( = ?auto_602092 ?auto_602101 ) ) ( not ( = ?auto_602092 ?auto_602102 ) ) ( not ( = ?auto_602092 ?auto_602103 ) ) ( not ( = ?auto_602092 ?auto_602104 ) ) ( not ( = ?auto_602093 ?auto_602094 ) ) ( not ( = ?auto_602093 ?auto_602095 ) ) ( not ( = ?auto_602093 ?auto_602096 ) ) ( not ( = ?auto_602093 ?auto_602097 ) ) ( not ( = ?auto_602093 ?auto_602098 ) ) ( not ( = ?auto_602093 ?auto_602099 ) ) ( not ( = ?auto_602093 ?auto_602100 ) ) ( not ( = ?auto_602093 ?auto_602101 ) ) ( not ( = ?auto_602093 ?auto_602102 ) ) ( not ( = ?auto_602093 ?auto_602103 ) ) ( not ( = ?auto_602093 ?auto_602104 ) ) ( not ( = ?auto_602094 ?auto_602095 ) ) ( not ( = ?auto_602094 ?auto_602096 ) ) ( not ( = ?auto_602094 ?auto_602097 ) ) ( not ( = ?auto_602094 ?auto_602098 ) ) ( not ( = ?auto_602094 ?auto_602099 ) ) ( not ( = ?auto_602094 ?auto_602100 ) ) ( not ( = ?auto_602094 ?auto_602101 ) ) ( not ( = ?auto_602094 ?auto_602102 ) ) ( not ( = ?auto_602094 ?auto_602103 ) ) ( not ( = ?auto_602094 ?auto_602104 ) ) ( not ( = ?auto_602095 ?auto_602096 ) ) ( not ( = ?auto_602095 ?auto_602097 ) ) ( not ( = ?auto_602095 ?auto_602098 ) ) ( not ( = ?auto_602095 ?auto_602099 ) ) ( not ( = ?auto_602095 ?auto_602100 ) ) ( not ( = ?auto_602095 ?auto_602101 ) ) ( not ( = ?auto_602095 ?auto_602102 ) ) ( not ( = ?auto_602095 ?auto_602103 ) ) ( not ( = ?auto_602095 ?auto_602104 ) ) ( not ( = ?auto_602096 ?auto_602097 ) ) ( not ( = ?auto_602096 ?auto_602098 ) ) ( not ( = ?auto_602096 ?auto_602099 ) ) ( not ( = ?auto_602096 ?auto_602100 ) ) ( not ( = ?auto_602096 ?auto_602101 ) ) ( not ( = ?auto_602096 ?auto_602102 ) ) ( not ( = ?auto_602096 ?auto_602103 ) ) ( not ( = ?auto_602096 ?auto_602104 ) ) ( not ( = ?auto_602097 ?auto_602098 ) ) ( not ( = ?auto_602097 ?auto_602099 ) ) ( not ( = ?auto_602097 ?auto_602100 ) ) ( not ( = ?auto_602097 ?auto_602101 ) ) ( not ( = ?auto_602097 ?auto_602102 ) ) ( not ( = ?auto_602097 ?auto_602103 ) ) ( not ( = ?auto_602097 ?auto_602104 ) ) ( not ( = ?auto_602098 ?auto_602099 ) ) ( not ( = ?auto_602098 ?auto_602100 ) ) ( not ( = ?auto_602098 ?auto_602101 ) ) ( not ( = ?auto_602098 ?auto_602102 ) ) ( not ( = ?auto_602098 ?auto_602103 ) ) ( not ( = ?auto_602098 ?auto_602104 ) ) ( not ( = ?auto_602099 ?auto_602100 ) ) ( not ( = ?auto_602099 ?auto_602101 ) ) ( not ( = ?auto_602099 ?auto_602102 ) ) ( not ( = ?auto_602099 ?auto_602103 ) ) ( not ( = ?auto_602099 ?auto_602104 ) ) ( not ( = ?auto_602100 ?auto_602101 ) ) ( not ( = ?auto_602100 ?auto_602102 ) ) ( not ( = ?auto_602100 ?auto_602103 ) ) ( not ( = ?auto_602100 ?auto_602104 ) ) ( not ( = ?auto_602101 ?auto_602102 ) ) ( not ( = ?auto_602101 ?auto_602103 ) ) ( not ( = ?auto_602101 ?auto_602104 ) ) ( not ( = ?auto_602102 ?auto_602103 ) ) ( not ( = ?auto_602102 ?auto_602104 ) ) ( not ( = ?auto_602103 ?auto_602104 ) ) ( ON ?auto_602102 ?auto_602103 ) ( ON ?auto_602101 ?auto_602102 ) ( ON ?auto_602100 ?auto_602101 ) ( ON ?auto_602099 ?auto_602100 ) ( ON ?auto_602098 ?auto_602099 ) ( ON ?auto_602097 ?auto_602098 ) ( ON ?auto_602096 ?auto_602097 ) ( ON ?auto_602095 ?auto_602096 ) ( ON ?auto_602094 ?auto_602095 ) ( ON ?auto_602093 ?auto_602094 ) ( ON ?auto_602092 ?auto_602093 ) ( ON ?auto_602091 ?auto_602092 ) ( ON ?auto_602090 ?auto_602091 ) ( CLEAR ?auto_602090 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_602090 )
      ( MAKE-14PILE ?auto_602090 ?auto_602091 ?auto_602092 ?auto_602093 ?auto_602094 ?auto_602095 ?auto_602096 ?auto_602097 ?auto_602098 ?auto_602099 ?auto_602100 ?auto_602101 ?auto_602102 ?auto_602103 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_602149 - BLOCK
      ?auto_602150 - BLOCK
      ?auto_602151 - BLOCK
      ?auto_602152 - BLOCK
      ?auto_602153 - BLOCK
      ?auto_602154 - BLOCK
      ?auto_602155 - BLOCK
      ?auto_602156 - BLOCK
      ?auto_602157 - BLOCK
      ?auto_602158 - BLOCK
      ?auto_602159 - BLOCK
      ?auto_602160 - BLOCK
      ?auto_602161 - BLOCK
      ?auto_602162 - BLOCK
      ?auto_602163 - BLOCK
    )
    :vars
    (
      ?auto_602164 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_602162 ) ( ON ?auto_602163 ?auto_602164 ) ( CLEAR ?auto_602163 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_602149 ) ( ON ?auto_602150 ?auto_602149 ) ( ON ?auto_602151 ?auto_602150 ) ( ON ?auto_602152 ?auto_602151 ) ( ON ?auto_602153 ?auto_602152 ) ( ON ?auto_602154 ?auto_602153 ) ( ON ?auto_602155 ?auto_602154 ) ( ON ?auto_602156 ?auto_602155 ) ( ON ?auto_602157 ?auto_602156 ) ( ON ?auto_602158 ?auto_602157 ) ( ON ?auto_602159 ?auto_602158 ) ( ON ?auto_602160 ?auto_602159 ) ( ON ?auto_602161 ?auto_602160 ) ( ON ?auto_602162 ?auto_602161 ) ( not ( = ?auto_602149 ?auto_602150 ) ) ( not ( = ?auto_602149 ?auto_602151 ) ) ( not ( = ?auto_602149 ?auto_602152 ) ) ( not ( = ?auto_602149 ?auto_602153 ) ) ( not ( = ?auto_602149 ?auto_602154 ) ) ( not ( = ?auto_602149 ?auto_602155 ) ) ( not ( = ?auto_602149 ?auto_602156 ) ) ( not ( = ?auto_602149 ?auto_602157 ) ) ( not ( = ?auto_602149 ?auto_602158 ) ) ( not ( = ?auto_602149 ?auto_602159 ) ) ( not ( = ?auto_602149 ?auto_602160 ) ) ( not ( = ?auto_602149 ?auto_602161 ) ) ( not ( = ?auto_602149 ?auto_602162 ) ) ( not ( = ?auto_602149 ?auto_602163 ) ) ( not ( = ?auto_602149 ?auto_602164 ) ) ( not ( = ?auto_602150 ?auto_602151 ) ) ( not ( = ?auto_602150 ?auto_602152 ) ) ( not ( = ?auto_602150 ?auto_602153 ) ) ( not ( = ?auto_602150 ?auto_602154 ) ) ( not ( = ?auto_602150 ?auto_602155 ) ) ( not ( = ?auto_602150 ?auto_602156 ) ) ( not ( = ?auto_602150 ?auto_602157 ) ) ( not ( = ?auto_602150 ?auto_602158 ) ) ( not ( = ?auto_602150 ?auto_602159 ) ) ( not ( = ?auto_602150 ?auto_602160 ) ) ( not ( = ?auto_602150 ?auto_602161 ) ) ( not ( = ?auto_602150 ?auto_602162 ) ) ( not ( = ?auto_602150 ?auto_602163 ) ) ( not ( = ?auto_602150 ?auto_602164 ) ) ( not ( = ?auto_602151 ?auto_602152 ) ) ( not ( = ?auto_602151 ?auto_602153 ) ) ( not ( = ?auto_602151 ?auto_602154 ) ) ( not ( = ?auto_602151 ?auto_602155 ) ) ( not ( = ?auto_602151 ?auto_602156 ) ) ( not ( = ?auto_602151 ?auto_602157 ) ) ( not ( = ?auto_602151 ?auto_602158 ) ) ( not ( = ?auto_602151 ?auto_602159 ) ) ( not ( = ?auto_602151 ?auto_602160 ) ) ( not ( = ?auto_602151 ?auto_602161 ) ) ( not ( = ?auto_602151 ?auto_602162 ) ) ( not ( = ?auto_602151 ?auto_602163 ) ) ( not ( = ?auto_602151 ?auto_602164 ) ) ( not ( = ?auto_602152 ?auto_602153 ) ) ( not ( = ?auto_602152 ?auto_602154 ) ) ( not ( = ?auto_602152 ?auto_602155 ) ) ( not ( = ?auto_602152 ?auto_602156 ) ) ( not ( = ?auto_602152 ?auto_602157 ) ) ( not ( = ?auto_602152 ?auto_602158 ) ) ( not ( = ?auto_602152 ?auto_602159 ) ) ( not ( = ?auto_602152 ?auto_602160 ) ) ( not ( = ?auto_602152 ?auto_602161 ) ) ( not ( = ?auto_602152 ?auto_602162 ) ) ( not ( = ?auto_602152 ?auto_602163 ) ) ( not ( = ?auto_602152 ?auto_602164 ) ) ( not ( = ?auto_602153 ?auto_602154 ) ) ( not ( = ?auto_602153 ?auto_602155 ) ) ( not ( = ?auto_602153 ?auto_602156 ) ) ( not ( = ?auto_602153 ?auto_602157 ) ) ( not ( = ?auto_602153 ?auto_602158 ) ) ( not ( = ?auto_602153 ?auto_602159 ) ) ( not ( = ?auto_602153 ?auto_602160 ) ) ( not ( = ?auto_602153 ?auto_602161 ) ) ( not ( = ?auto_602153 ?auto_602162 ) ) ( not ( = ?auto_602153 ?auto_602163 ) ) ( not ( = ?auto_602153 ?auto_602164 ) ) ( not ( = ?auto_602154 ?auto_602155 ) ) ( not ( = ?auto_602154 ?auto_602156 ) ) ( not ( = ?auto_602154 ?auto_602157 ) ) ( not ( = ?auto_602154 ?auto_602158 ) ) ( not ( = ?auto_602154 ?auto_602159 ) ) ( not ( = ?auto_602154 ?auto_602160 ) ) ( not ( = ?auto_602154 ?auto_602161 ) ) ( not ( = ?auto_602154 ?auto_602162 ) ) ( not ( = ?auto_602154 ?auto_602163 ) ) ( not ( = ?auto_602154 ?auto_602164 ) ) ( not ( = ?auto_602155 ?auto_602156 ) ) ( not ( = ?auto_602155 ?auto_602157 ) ) ( not ( = ?auto_602155 ?auto_602158 ) ) ( not ( = ?auto_602155 ?auto_602159 ) ) ( not ( = ?auto_602155 ?auto_602160 ) ) ( not ( = ?auto_602155 ?auto_602161 ) ) ( not ( = ?auto_602155 ?auto_602162 ) ) ( not ( = ?auto_602155 ?auto_602163 ) ) ( not ( = ?auto_602155 ?auto_602164 ) ) ( not ( = ?auto_602156 ?auto_602157 ) ) ( not ( = ?auto_602156 ?auto_602158 ) ) ( not ( = ?auto_602156 ?auto_602159 ) ) ( not ( = ?auto_602156 ?auto_602160 ) ) ( not ( = ?auto_602156 ?auto_602161 ) ) ( not ( = ?auto_602156 ?auto_602162 ) ) ( not ( = ?auto_602156 ?auto_602163 ) ) ( not ( = ?auto_602156 ?auto_602164 ) ) ( not ( = ?auto_602157 ?auto_602158 ) ) ( not ( = ?auto_602157 ?auto_602159 ) ) ( not ( = ?auto_602157 ?auto_602160 ) ) ( not ( = ?auto_602157 ?auto_602161 ) ) ( not ( = ?auto_602157 ?auto_602162 ) ) ( not ( = ?auto_602157 ?auto_602163 ) ) ( not ( = ?auto_602157 ?auto_602164 ) ) ( not ( = ?auto_602158 ?auto_602159 ) ) ( not ( = ?auto_602158 ?auto_602160 ) ) ( not ( = ?auto_602158 ?auto_602161 ) ) ( not ( = ?auto_602158 ?auto_602162 ) ) ( not ( = ?auto_602158 ?auto_602163 ) ) ( not ( = ?auto_602158 ?auto_602164 ) ) ( not ( = ?auto_602159 ?auto_602160 ) ) ( not ( = ?auto_602159 ?auto_602161 ) ) ( not ( = ?auto_602159 ?auto_602162 ) ) ( not ( = ?auto_602159 ?auto_602163 ) ) ( not ( = ?auto_602159 ?auto_602164 ) ) ( not ( = ?auto_602160 ?auto_602161 ) ) ( not ( = ?auto_602160 ?auto_602162 ) ) ( not ( = ?auto_602160 ?auto_602163 ) ) ( not ( = ?auto_602160 ?auto_602164 ) ) ( not ( = ?auto_602161 ?auto_602162 ) ) ( not ( = ?auto_602161 ?auto_602163 ) ) ( not ( = ?auto_602161 ?auto_602164 ) ) ( not ( = ?auto_602162 ?auto_602163 ) ) ( not ( = ?auto_602162 ?auto_602164 ) ) ( not ( = ?auto_602163 ?auto_602164 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_602163 ?auto_602164 )
      ( !STACK ?auto_602163 ?auto_602162 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_602211 - BLOCK
      ?auto_602212 - BLOCK
      ?auto_602213 - BLOCK
      ?auto_602214 - BLOCK
      ?auto_602215 - BLOCK
      ?auto_602216 - BLOCK
      ?auto_602217 - BLOCK
      ?auto_602218 - BLOCK
      ?auto_602219 - BLOCK
      ?auto_602220 - BLOCK
      ?auto_602221 - BLOCK
      ?auto_602222 - BLOCK
      ?auto_602223 - BLOCK
      ?auto_602224 - BLOCK
      ?auto_602225 - BLOCK
    )
    :vars
    (
      ?auto_602226 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_602225 ?auto_602226 ) ( ON-TABLE ?auto_602211 ) ( ON ?auto_602212 ?auto_602211 ) ( ON ?auto_602213 ?auto_602212 ) ( ON ?auto_602214 ?auto_602213 ) ( ON ?auto_602215 ?auto_602214 ) ( ON ?auto_602216 ?auto_602215 ) ( ON ?auto_602217 ?auto_602216 ) ( ON ?auto_602218 ?auto_602217 ) ( ON ?auto_602219 ?auto_602218 ) ( ON ?auto_602220 ?auto_602219 ) ( ON ?auto_602221 ?auto_602220 ) ( ON ?auto_602222 ?auto_602221 ) ( ON ?auto_602223 ?auto_602222 ) ( not ( = ?auto_602211 ?auto_602212 ) ) ( not ( = ?auto_602211 ?auto_602213 ) ) ( not ( = ?auto_602211 ?auto_602214 ) ) ( not ( = ?auto_602211 ?auto_602215 ) ) ( not ( = ?auto_602211 ?auto_602216 ) ) ( not ( = ?auto_602211 ?auto_602217 ) ) ( not ( = ?auto_602211 ?auto_602218 ) ) ( not ( = ?auto_602211 ?auto_602219 ) ) ( not ( = ?auto_602211 ?auto_602220 ) ) ( not ( = ?auto_602211 ?auto_602221 ) ) ( not ( = ?auto_602211 ?auto_602222 ) ) ( not ( = ?auto_602211 ?auto_602223 ) ) ( not ( = ?auto_602211 ?auto_602224 ) ) ( not ( = ?auto_602211 ?auto_602225 ) ) ( not ( = ?auto_602211 ?auto_602226 ) ) ( not ( = ?auto_602212 ?auto_602213 ) ) ( not ( = ?auto_602212 ?auto_602214 ) ) ( not ( = ?auto_602212 ?auto_602215 ) ) ( not ( = ?auto_602212 ?auto_602216 ) ) ( not ( = ?auto_602212 ?auto_602217 ) ) ( not ( = ?auto_602212 ?auto_602218 ) ) ( not ( = ?auto_602212 ?auto_602219 ) ) ( not ( = ?auto_602212 ?auto_602220 ) ) ( not ( = ?auto_602212 ?auto_602221 ) ) ( not ( = ?auto_602212 ?auto_602222 ) ) ( not ( = ?auto_602212 ?auto_602223 ) ) ( not ( = ?auto_602212 ?auto_602224 ) ) ( not ( = ?auto_602212 ?auto_602225 ) ) ( not ( = ?auto_602212 ?auto_602226 ) ) ( not ( = ?auto_602213 ?auto_602214 ) ) ( not ( = ?auto_602213 ?auto_602215 ) ) ( not ( = ?auto_602213 ?auto_602216 ) ) ( not ( = ?auto_602213 ?auto_602217 ) ) ( not ( = ?auto_602213 ?auto_602218 ) ) ( not ( = ?auto_602213 ?auto_602219 ) ) ( not ( = ?auto_602213 ?auto_602220 ) ) ( not ( = ?auto_602213 ?auto_602221 ) ) ( not ( = ?auto_602213 ?auto_602222 ) ) ( not ( = ?auto_602213 ?auto_602223 ) ) ( not ( = ?auto_602213 ?auto_602224 ) ) ( not ( = ?auto_602213 ?auto_602225 ) ) ( not ( = ?auto_602213 ?auto_602226 ) ) ( not ( = ?auto_602214 ?auto_602215 ) ) ( not ( = ?auto_602214 ?auto_602216 ) ) ( not ( = ?auto_602214 ?auto_602217 ) ) ( not ( = ?auto_602214 ?auto_602218 ) ) ( not ( = ?auto_602214 ?auto_602219 ) ) ( not ( = ?auto_602214 ?auto_602220 ) ) ( not ( = ?auto_602214 ?auto_602221 ) ) ( not ( = ?auto_602214 ?auto_602222 ) ) ( not ( = ?auto_602214 ?auto_602223 ) ) ( not ( = ?auto_602214 ?auto_602224 ) ) ( not ( = ?auto_602214 ?auto_602225 ) ) ( not ( = ?auto_602214 ?auto_602226 ) ) ( not ( = ?auto_602215 ?auto_602216 ) ) ( not ( = ?auto_602215 ?auto_602217 ) ) ( not ( = ?auto_602215 ?auto_602218 ) ) ( not ( = ?auto_602215 ?auto_602219 ) ) ( not ( = ?auto_602215 ?auto_602220 ) ) ( not ( = ?auto_602215 ?auto_602221 ) ) ( not ( = ?auto_602215 ?auto_602222 ) ) ( not ( = ?auto_602215 ?auto_602223 ) ) ( not ( = ?auto_602215 ?auto_602224 ) ) ( not ( = ?auto_602215 ?auto_602225 ) ) ( not ( = ?auto_602215 ?auto_602226 ) ) ( not ( = ?auto_602216 ?auto_602217 ) ) ( not ( = ?auto_602216 ?auto_602218 ) ) ( not ( = ?auto_602216 ?auto_602219 ) ) ( not ( = ?auto_602216 ?auto_602220 ) ) ( not ( = ?auto_602216 ?auto_602221 ) ) ( not ( = ?auto_602216 ?auto_602222 ) ) ( not ( = ?auto_602216 ?auto_602223 ) ) ( not ( = ?auto_602216 ?auto_602224 ) ) ( not ( = ?auto_602216 ?auto_602225 ) ) ( not ( = ?auto_602216 ?auto_602226 ) ) ( not ( = ?auto_602217 ?auto_602218 ) ) ( not ( = ?auto_602217 ?auto_602219 ) ) ( not ( = ?auto_602217 ?auto_602220 ) ) ( not ( = ?auto_602217 ?auto_602221 ) ) ( not ( = ?auto_602217 ?auto_602222 ) ) ( not ( = ?auto_602217 ?auto_602223 ) ) ( not ( = ?auto_602217 ?auto_602224 ) ) ( not ( = ?auto_602217 ?auto_602225 ) ) ( not ( = ?auto_602217 ?auto_602226 ) ) ( not ( = ?auto_602218 ?auto_602219 ) ) ( not ( = ?auto_602218 ?auto_602220 ) ) ( not ( = ?auto_602218 ?auto_602221 ) ) ( not ( = ?auto_602218 ?auto_602222 ) ) ( not ( = ?auto_602218 ?auto_602223 ) ) ( not ( = ?auto_602218 ?auto_602224 ) ) ( not ( = ?auto_602218 ?auto_602225 ) ) ( not ( = ?auto_602218 ?auto_602226 ) ) ( not ( = ?auto_602219 ?auto_602220 ) ) ( not ( = ?auto_602219 ?auto_602221 ) ) ( not ( = ?auto_602219 ?auto_602222 ) ) ( not ( = ?auto_602219 ?auto_602223 ) ) ( not ( = ?auto_602219 ?auto_602224 ) ) ( not ( = ?auto_602219 ?auto_602225 ) ) ( not ( = ?auto_602219 ?auto_602226 ) ) ( not ( = ?auto_602220 ?auto_602221 ) ) ( not ( = ?auto_602220 ?auto_602222 ) ) ( not ( = ?auto_602220 ?auto_602223 ) ) ( not ( = ?auto_602220 ?auto_602224 ) ) ( not ( = ?auto_602220 ?auto_602225 ) ) ( not ( = ?auto_602220 ?auto_602226 ) ) ( not ( = ?auto_602221 ?auto_602222 ) ) ( not ( = ?auto_602221 ?auto_602223 ) ) ( not ( = ?auto_602221 ?auto_602224 ) ) ( not ( = ?auto_602221 ?auto_602225 ) ) ( not ( = ?auto_602221 ?auto_602226 ) ) ( not ( = ?auto_602222 ?auto_602223 ) ) ( not ( = ?auto_602222 ?auto_602224 ) ) ( not ( = ?auto_602222 ?auto_602225 ) ) ( not ( = ?auto_602222 ?auto_602226 ) ) ( not ( = ?auto_602223 ?auto_602224 ) ) ( not ( = ?auto_602223 ?auto_602225 ) ) ( not ( = ?auto_602223 ?auto_602226 ) ) ( not ( = ?auto_602224 ?auto_602225 ) ) ( not ( = ?auto_602224 ?auto_602226 ) ) ( not ( = ?auto_602225 ?auto_602226 ) ) ( CLEAR ?auto_602223 ) ( ON ?auto_602224 ?auto_602225 ) ( CLEAR ?auto_602224 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_602211 ?auto_602212 ?auto_602213 ?auto_602214 ?auto_602215 ?auto_602216 ?auto_602217 ?auto_602218 ?auto_602219 ?auto_602220 ?auto_602221 ?auto_602222 ?auto_602223 ?auto_602224 )
      ( MAKE-15PILE ?auto_602211 ?auto_602212 ?auto_602213 ?auto_602214 ?auto_602215 ?auto_602216 ?auto_602217 ?auto_602218 ?auto_602219 ?auto_602220 ?auto_602221 ?auto_602222 ?auto_602223 ?auto_602224 ?auto_602225 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_602273 - BLOCK
      ?auto_602274 - BLOCK
      ?auto_602275 - BLOCK
      ?auto_602276 - BLOCK
      ?auto_602277 - BLOCK
      ?auto_602278 - BLOCK
      ?auto_602279 - BLOCK
      ?auto_602280 - BLOCK
      ?auto_602281 - BLOCK
      ?auto_602282 - BLOCK
      ?auto_602283 - BLOCK
      ?auto_602284 - BLOCK
      ?auto_602285 - BLOCK
      ?auto_602286 - BLOCK
      ?auto_602287 - BLOCK
    )
    :vars
    (
      ?auto_602288 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_602287 ?auto_602288 ) ( ON-TABLE ?auto_602273 ) ( ON ?auto_602274 ?auto_602273 ) ( ON ?auto_602275 ?auto_602274 ) ( ON ?auto_602276 ?auto_602275 ) ( ON ?auto_602277 ?auto_602276 ) ( ON ?auto_602278 ?auto_602277 ) ( ON ?auto_602279 ?auto_602278 ) ( ON ?auto_602280 ?auto_602279 ) ( ON ?auto_602281 ?auto_602280 ) ( ON ?auto_602282 ?auto_602281 ) ( ON ?auto_602283 ?auto_602282 ) ( ON ?auto_602284 ?auto_602283 ) ( not ( = ?auto_602273 ?auto_602274 ) ) ( not ( = ?auto_602273 ?auto_602275 ) ) ( not ( = ?auto_602273 ?auto_602276 ) ) ( not ( = ?auto_602273 ?auto_602277 ) ) ( not ( = ?auto_602273 ?auto_602278 ) ) ( not ( = ?auto_602273 ?auto_602279 ) ) ( not ( = ?auto_602273 ?auto_602280 ) ) ( not ( = ?auto_602273 ?auto_602281 ) ) ( not ( = ?auto_602273 ?auto_602282 ) ) ( not ( = ?auto_602273 ?auto_602283 ) ) ( not ( = ?auto_602273 ?auto_602284 ) ) ( not ( = ?auto_602273 ?auto_602285 ) ) ( not ( = ?auto_602273 ?auto_602286 ) ) ( not ( = ?auto_602273 ?auto_602287 ) ) ( not ( = ?auto_602273 ?auto_602288 ) ) ( not ( = ?auto_602274 ?auto_602275 ) ) ( not ( = ?auto_602274 ?auto_602276 ) ) ( not ( = ?auto_602274 ?auto_602277 ) ) ( not ( = ?auto_602274 ?auto_602278 ) ) ( not ( = ?auto_602274 ?auto_602279 ) ) ( not ( = ?auto_602274 ?auto_602280 ) ) ( not ( = ?auto_602274 ?auto_602281 ) ) ( not ( = ?auto_602274 ?auto_602282 ) ) ( not ( = ?auto_602274 ?auto_602283 ) ) ( not ( = ?auto_602274 ?auto_602284 ) ) ( not ( = ?auto_602274 ?auto_602285 ) ) ( not ( = ?auto_602274 ?auto_602286 ) ) ( not ( = ?auto_602274 ?auto_602287 ) ) ( not ( = ?auto_602274 ?auto_602288 ) ) ( not ( = ?auto_602275 ?auto_602276 ) ) ( not ( = ?auto_602275 ?auto_602277 ) ) ( not ( = ?auto_602275 ?auto_602278 ) ) ( not ( = ?auto_602275 ?auto_602279 ) ) ( not ( = ?auto_602275 ?auto_602280 ) ) ( not ( = ?auto_602275 ?auto_602281 ) ) ( not ( = ?auto_602275 ?auto_602282 ) ) ( not ( = ?auto_602275 ?auto_602283 ) ) ( not ( = ?auto_602275 ?auto_602284 ) ) ( not ( = ?auto_602275 ?auto_602285 ) ) ( not ( = ?auto_602275 ?auto_602286 ) ) ( not ( = ?auto_602275 ?auto_602287 ) ) ( not ( = ?auto_602275 ?auto_602288 ) ) ( not ( = ?auto_602276 ?auto_602277 ) ) ( not ( = ?auto_602276 ?auto_602278 ) ) ( not ( = ?auto_602276 ?auto_602279 ) ) ( not ( = ?auto_602276 ?auto_602280 ) ) ( not ( = ?auto_602276 ?auto_602281 ) ) ( not ( = ?auto_602276 ?auto_602282 ) ) ( not ( = ?auto_602276 ?auto_602283 ) ) ( not ( = ?auto_602276 ?auto_602284 ) ) ( not ( = ?auto_602276 ?auto_602285 ) ) ( not ( = ?auto_602276 ?auto_602286 ) ) ( not ( = ?auto_602276 ?auto_602287 ) ) ( not ( = ?auto_602276 ?auto_602288 ) ) ( not ( = ?auto_602277 ?auto_602278 ) ) ( not ( = ?auto_602277 ?auto_602279 ) ) ( not ( = ?auto_602277 ?auto_602280 ) ) ( not ( = ?auto_602277 ?auto_602281 ) ) ( not ( = ?auto_602277 ?auto_602282 ) ) ( not ( = ?auto_602277 ?auto_602283 ) ) ( not ( = ?auto_602277 ?auto_602284 ) ) ( not ( = ?auto_602277 ?auto_602285 ) ) ( not ( = ?auto_602277 ?auto_602286 ) ) ( not ( = ?auto_602277 ?auto_602287 ) ) ( not ( = ?auto_602277 ?auto_602288 ) ) ( not ( = ?auto_602278 ?auto_602279 ) ) ( not ( = ?auto_602278 ?auto_602280 ) ) ( not ( = ?auto_602278 ?auto_602281 ) ) ( not ( = ?auto_602278 ?auto_602282 ) ) ( not ( = ?auto_602278 ?auto_602283 ) ) ( not ( = ?auto_602278 ?auto_602284 ) ) ( not ( = ?auto_602278 ?auto_602285 ) ) ( not ( = ?auto_602278 ?auto_602286 ) ) ( not ( = ?auto_602278 ?auto_602287 ) ) ( not ( = ?auto_602278 ?auto_602288 ) ) ( not ( = ?auto_602279 ?auto_602280 ) ) ( not ( = ?auto_602279 ?auto_602281 ) ) ( not ( = ?auto_602279 ?auto_602282 ) ) ( not ( = ?auto_602279 ?auto_602283 ) ) ( not ( = ?auto_602279 ?auto_602284 ) ) ( not ( = ?auto_602279 ?auto_602285 ) ) ( not ( = ?auto_602279 ?auto_602286 ) ) ( not ( = ?auto_602279 ?auto_602287 ) ) ( not ( = ?auto_602279 ?auto_602288 ) ) ( not ( = ?auto_602280 ?auto_602281 ) ) ( not ( = ?auto_602280 ?auto_602282 ) ) ( not ( = ?auto_602280 ?auto_602283 ) ) ( not ( = ?auto_602280 ?auto_602284 ) ) ( not ( = ?auto_602280 ?auto_602285 ) ) ( not ( = ?auto_602280 ?auto_602286 ) ) ( not ( = ?auto_602280 ?auto_602287 ) ) ( not ( = ?auto_602280 ?auto_602288 ) ) ( not ( = ?auto_602281 ?auto_602282 ) ) ( not ( = ?auto_602281 ?auto_602283 ) ) ( not ( = ?auto_602281 ?auto_602284 ) ) ( not ( = ?auto_602281 ?auto_602285 ) ) ( not ( = ?auto_602281 ?auto_602286 ) ) ( not ( = ?auto_602281 ?auto_602287 ) ) ( not ( = ?auto_602281 ?auto_602288 ) ) ( not ( = ?auto_602282 ?auto_602283 ) ) ( not ( = ?auto_602282 ?auto_602284 ) ) ( not ( = ?auto_602282 ?auto_602285 ) ) ( not ( = ?auto_602282 ?auto_602286 ) ) ( not ( = ?auto_602282 ?auto_602287 ) ) ( not ( = ?auto_602282 ?auto_602288 ) ) ( not ( = ?auto_602283 ?auto_602284 ) ) ( not ( = ?auto_602283 ?auto_602285 ) ) ( not ( = ?auto_602283 ?auto_602286 ) ) ( not ( = ?auto_602283 ?auto_602287 ) ) ( not ( = ?auto_602283 ?auto_602288 ) ) ( not ( = ?auto_602284 ?auto_602285 ) ) ( not ( = ?auto_602284 ?auto_602286 ) ) ( not ( = ?auto_602284 ?auto_602287 ) ) ( not ( = ?auto_602284 ?auto_602288 ) ) ( not ( = ?auto_602285 ?auto_602286 ) ) ( not ( = ?auto_602285 ?auto_602287 ) ) ( not ( = ?auto_602285 ?auto_602288 ) ) ( not ( = ?auto_602286 ?auto_602287 ) ) ( not ( = ?auto_602286 ?auto_602288 ) ) ( not ( = ?auto_602287 ?auto_602288 ) ) ( ON ?auto_602286 ?auto_602287 ) ( CLEAR ?auto_602284 ) ( ON ?auto_602285 ?auto_602286 ) ( CLEAR ?auto_602285 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_602273 ?auto_602274 ?auto_602275 ?auto_602276 ?auto_602277 ?auto_602278 ?auto_602279 ?auto_602280 ?auto_602281 ?auto_602282 ?auto_602283 ?auto_602284 ?auto_602285 )
      ( MAKE-15PILE ?auto_602273 ?auto_602274 ?auto_602275 ?auto_602276 ?auto_602277 ?auto_602278 ?auto_602279 ?auto_602280 ?auto_602281 ?auto_602282 ?auto_602283 ?auto_602284 ?auto_602285 ?auto_602286 ?auto_602287 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_602335 - BLOCK
      ?auto_602336 - BLOCK
      ?auto_602337 - BLOCK
      ?auto_602338 - BLOCK
      ?auto_602339 - BLOCK
      ?auto_602340 - BLOCK
      ?auto_602341 - BLOCK
      ?auto_602342 - BLOCK
      ?auto_602343 - BLOCK
      ?auto_602344 - BLOCK
      ?auto_602345 - BLOCK
      ?auto_602346 - BLOCK
      ?auto_602347 - BLOCK
      ?auto_602348 - BLOCK
      ?auto_602349 - BLOCK
    )
    :vars
    (
      ?auto_602350 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_602349 ?auto_602350 ) ( ON-TABLE ?auto_602335 ) ( ON ?auto_602336 ?auto_602335 ) ( ON ?auto_602337 ?auto_602336 ) ( ON ?auto_602338 ?auto_602337 ) ( ON ?auto_602339 ?auto_602338 ) ( ON ?auto_602340 ?auto_602339 ) ( ON ?auto_602341 ?auto_602340 ) ( ON ?auto_602342 ?auto_602341 ) ( ON ?auto_602343 ?auto_602342 ) ( ON ?auto_602344 ?auto_602343 ) ( ON ?auto_602345 ?auto_602344 ) ( not ( = ?auto_602335 ?auto_602336 ) ) ( not ( = ?auto_602335 ?auto_602337 ) ) ( not ( = ?auto_602335 ?auto_602338 ) ) ( not ( = ?auto_602335 ?auto_602339 ) ) ( not ( = ?auto_602335 ?auto_602340 ) ) ( not ( = ?auto_602335 ?auto_602341 ) ) ( not ( = ?auto_602335 ?auto_602342 ) ) ( not ( = ?auto_602335 ?auto_602343 ) ) ( not ( = ?auto_602335 ?auto_602344 ) ) ( not ( = ?auto_602335 ?auto_602345 ) ) ( not ( = ?auto_602335 ?auto_602346 ) ) ( not ( = ?auto_602335 ?auto_602347 ) ) ( not ( = ?auto_602335 ?auto_602348 ) ) ( not ( = ?auto_602335 ?auto_602349 ) ) ( not ( = ?auto_602335 ?auto_602350 ) ) ( not ( = ?auto_602336 ?auto_602337 ) ) ( not ( = ?auto_602336 ?auto_602338 ) ) ( not ( = ?auto_602336 ?auto_602339 ) ) ( not ( = ?auto_602336 ?auto_602340 ) ) ( not ( = ?auto_602336 ?auto_602341 ) ) ( not ( = ?auto_602336 ?auto_602342 ) ) ( not ( = ?auto_602336 ?auto_602343 ) ) ( not ( = ?auto_602336 ?auto_602344 ) ) ( not ( = ?auto_602336 ?auto_602345 ) ) ( not ( = ?auto_602336 ?auto_602346 ) ) ( not ( = ?auto_602336 ?auto_602347 ) ) ( not ( = ?auto_602336 ?auto_602348 ) ) ( not ( = ?auto_602336 ?auto_602349 ) ) ( not ( = ?auto_602336 ?auto_602350 ) ) ( not ( = ?auto_602337 ?auto_602338 ) ) ( not ( = ?auto_602337 ?auto_602339 ) ) ( not ( = ?auto_602337 ?auto_602340 ) ) ( not ( = ?auto_602337 ?auto_602341 ) ) ( not ( = ?auto_602337 ?auto_602342 ) ) ( not ( = ?auto_602337 ?auto_602343 ) ) ( not ( = ?auto_602337 ?auto_602344 ) ) ( not ( = ?auto_602337 ?auto_602345 ) ) ( not ( = ?auto_602337 ?auto_602346 ) ) ( not ( = ?auto_602337 ?auto_602347 ) ) ( not ( = ?auto_602337 ?auto_602348 ) ) ( not ( = ?auto_602337 ?auto_602349 ) ) ( not ( = ?auto_602337 ?auto_602350 ) ) ( not ( = ?auto_602338 ?auto_602339 ) ) ( not ( = ?auto_602338 ?auto_602340 ) ) ( not ( = ?auto_602338 ?auto_602341 ) ) ( not ( = ?auto_602338 ?auto_602342 ) ) ( not ( = ?auto_602338 ?auto_602343 ) ) ( not ( = ?auto_602338 ?auto_602344 ) ) ( not ( = ?auto_602338 ?auto_602345 ) ) ( not ( = ?auto_602338 ?auto_602346 ) ) ( not ( = ?auto_602338 ?auto_602347 ) ) ( not ( = ?auto_602338 ?auto_602348 ) ) ( not ( = ?auto_602338 ?auto_602349 ) ) ( not ( = ?auto_602338 ?auto_602350 ) ) ( not ( = ?auto_602339 ?auto_602340 ) ) ( not ( = ?auto_602339 ?auto_602341 ) ) ( not ( = ?auto_602339 ?auto_602342 ) ) ( not ( = ?auto_602339 ?auto_602343 ) ) ( not ( = ?auto_602339 ?auto_602344 ) ) ( not ( = ?auto_602339 ?auto_602345 ) ) ( not ( = ?auto_602339 ?auto_602346 ) ) ( not ( = ?auto_602339 ?auto_602347 ) ) ( not ( = ?auto_602339 ?auto_602348 ) ) ( not ( = ?auto_602339 ?auto_602349 ) ) ( not ( = ?auto_602339 ?auto_602350 ) ) ( not ( = ?auto_602340 ?auto_602341 ) ) ( not ( = ?auto_602340 ?auto_602342 ) ) ( not ( = ?auto_602340 ?auto_602343 ) ) ( not ( = ?auto_602340 ?auto_602344 ) ) ( not ( = ?auto_602340 ?auto_602345 ) ) ( not ( = ?auto_602340 ?auto_602346 ) ) ( not ( = ?auto_602340 ?auto_602347 ) ) ( not ( = ?auto_602340 ?auto_602348 ) ) ( not ( = ?auto_602340 ?auto_602349 ) ) ( not ( = ?auto_602340 ?auto_602350 ) ) ( not ( = ?auto_602341 ?auto_602342 ) ) ( not ( = ?auto_602341 ?auto_602343 ) ) ( not ( = ?auto_602341 ?auto_602344 ) ) ( not ( = ?auto_602341 ?auto_602345 ) ) ( not ( = ?auto_602341 ?auto_602346 ) ) ( not ( = ?auto_602341 ?auto_602347 ) ) ( not ( = ?auto_602341 ?auto_602348 ) ) ( not ( = ?auto_602341 ?auto_602349 ) ) ( not ( = ?auto_602341 ?auto_602350 ) ) ( not ( = ?auto_602342 ?auto_602343 ) ) ( not ( = ?auto_602342 ?auto_602344 ) ) ( not ( = ?auto_602342 ?auto_602345 ) ) ( not ( = ?auto_602342 ?auto_602346 ) ) ( not ( = ?auto_602342 ?auto_602347 ) ) ( not ( = ?auto_602342 ?auto_602348 ) ) ( not ( = ?auto_602342 ?auto_602349 ) ) ( not ( = ?auto_602342 ?auto_602350 ) ) ( not ( = ?auto_602343 ?auto_602344 ) ) ( not ( = ?auto_602343 ?auto_602345 ) ) ( not ( = ?auto_602343 ?auto_602346 ) ) ( not ( = ?auto_602343 ?auto_602347 ) ) ( not ( = ?auto_602343 ?auto_602348 ) ) ( not ( = ?auto_602343 ?auto_602349 ) ) ( not ( = ?auto_602343 ?auto_602350 ) ) ( not ( = ?auto_602344 ?auto_602345 ) ) ( not ( = ?auto_602344 ?auto_602346 ) ) ( not ( = ?auto_602344 ?auto_602347 ) ) ( not ( = ?auto_602344 ?auto_602348 ) ) ( not ( = ?auto_602344 ?auto_602349 ) ) ( not ( = ?auto_602344 ?auto_602350 ) ) ( not ( = ?auto_602345 ?auto_602346 ) ) ( not ( = ?auto_602345 ?auto_602347 ) ) ( not ( = ?auto_602345 ?auto_602348 ) ) ( not ( = ?auto_602345 ?auto_602349 ) ) ( not ( = ?auto_602345 ?auto_602350 ) ) ( not ( = ?auto_602346 ?auto_602347 ) ) ( not ( = ?auto_602346 ?auto_602348 ) ) ( not ( = ?auto_602346 ?auto_602349 ) ) ( not ( = ?auto_602346 ?auto_602350 ) ) ( not ( = ?auto_602347 ?auto_602348 ) ) ( not ( = ?auto_602347 ?auto_602349 ) ) ( not ( = ?auto_602347 ?auto_602350 ) ) ( not ( = ?auto_602348 ?auto_602349 ) ) ( not ( = ?auto_602348 ?auto_602350 ) ) ( not ( = ?auto_602349 ?auto_602350 ) ) ( ON ?auto_602348 ?auto_602349 ) ( ON ?auto_602347 ?auto_602348 ) ( CLEAR ?auto_602345 ) ( ON ?auto_602346 ?auto_602347 ) ( CLEAR ?auto_602346 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_602335 ?auto_602336 ?auto_602337 ?auto_602338 ?auto_602339 ?auto_602340 ?auto_602341 ?auto_602342 ?auto_602343 ?auto_602344 ?auto_602345 ?auto_602346 )
      ( MAKE-15PILE ?auto_602335 ?auto_602336 ?auto_602337 ?auto_602338 ?auto_602339 ?auto_602340 ?auto_602341 ?auto_602342 ?auto_602343 ?auto_602344 ?auto_602345 ?auto_602346 ?auto_602347 ?auto_602348 ?auto_602349 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_602397 - BLOCK
      ?auto_602398 - BLOCK
      ?auto_602399 - BLOCK
      ?auto_602400 - BLOCK
      ?auto_602401 - BLOCK
      ?auto_602402 - BLOCK
      ?auto_602403 - BLOCK
      ?auto_602404 - BLOCK
      ?auto_602405 - BLOCK
      ?auto_602406 - BLOCK
      ?auto_602407 - BLOCK
      ?auto_602408 - BLOCK
      ?auto_602409 - BLOCK
      ?auto_602410 - BLOCK
      ?auto_602411 - BLOCK
    )
    :vars
    (
      ?auto_602412 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_602411 ?auto_602412 ) ( ON-TABLE ?auto_602397 ) ( ON ?auto_602398 ?auto_602397 ) ( ON ?auto_602399 ?auto_602398 ) ( ON ?auto_602400 ?auto_602399 ) ( ON ?auto_602401 ?auto_602400 ) ( ON ?auto_602402 ?auto_602401 ) ( ON ?auto_602403 ?auto_602402 ) ( ON ?auto_602404 ?auto_602403 ) ( ON ?auto_602405 ?auto_602404 ) ( ON ?auto_602406 ?auto_602405 ) ( not ( = ?auto_602397 ?auto_602398 ) ) ( not ( = ?auto_602397 ?auto_602399 ) ) ( not ( = ?auto_602397 ?auto_602400 ) ) ( not ( = ?auto_602397 ?auto_602401 ) ) ( not ( = ?auto_602397 ?auto_602402 ) ) ( not ( = ?auto_602397 ?auto_602403 ) ) ( not ( = ?auto_602397 ?auto_602404 ) ) ( not ( = ?auto_602397 ?auto_602405 ) ) ( not ( = ?auto_602397 ?auto_602406 ) ) ( not ( = ?auto_602397 ?auto_602407 ) ) ( not ( = ?auto_602397 ?auto_602408 ) ) ( not ( = ?auto_602397 ?auto_602409 ) ) ( not ( = ?auto_602397 ?auto_602410 ) ) ( not ( = ?auto_602397 ?auto_602411 ) ) ( not ( = ?auto_602397 ?auto_602412 ) ) ( not ( = ?auto_602398 ?auto_602399 ) ) ( not ( = ?auto_602398 ?auto_602400 ) ) ( not ( = ?auto_602398 ?auto_602401 ) ) ( not ( = ?auto_602398 ?auto_602402 ) ) ( not ( = ?auto_602398 ?auto_602403 ) ) ( not ( = ?auto_602398 ?auto_602404 ) ) ( not ( = ?auto_602398 ?auto_602405 ) ) ( not ( = ?auto_602398 ?auto_602406 ) ) ( not ( = ?auto_602398 ?auto_602407 ) ) ( not ( = ?auto_602398 ?auto_602408 ) ) ( not ( = ?auto_602398 ?auto_602409 ) ) ( not ( = ?auto_602398 ?auto_602410 ) ) ( not ( = ?auto_602398 ?auto_602411 ) ) ( not ( = ?auto_602398 ?auto_602412 ) ) ( not ( = ?auto_602399 ?auto_602400 ) ) ( not ( = ?auto_602399 ?auto_602401 ) ) ( not ( = ?auto_602399 ?auto_602402 ) ) ( not ( = ?auto_602399 ?auto_602403 ) ) ( not ( = ?auto_602399 ?auto_602404 ) ) ( not ( = ?auto_602399 ?auto_602405 ) ) ( not ( = ?auto_602399 ?auto_602406 ) ) ( not ( = ?auto_602399 ?auto_602407 ) ) ( not ( = ?auto_602399 ?auto_602408 ) ) ( not ( = ?auto_602399 ?auto_602409 ) ) ( not ( = ?auto_602399 ?auto_602410 ) ) ( not ( = ?auto_602399 ?auto_602411 ) ) ( not ( = ?auto_602399 ?auto_602412 ) ) ( not ( = ?auto_602400 ?auto_602401 ) ) ( not ( = ?auto_602400 ?auto_602402 ) ) ( not ( = ?auto_602400 ?auto_602403 ) ) ( not ( = ?auto_602400 ?auto_602404 ) ) ( not ( = ?auto_602400 ?auto_602405 ) ) ( not ( = ?auto_602400 ?auto_602406 ) ) ( not ( = ?auto_602400 ?auto_602407 ) ) ( not ( = ?auto_602400 ?auto_602408 ) ) ( not ( = ?auto_602400 ?auto_602409 ) ) ( not ( = ?auto_602400 ?auto_602410 ) ) ( not ( = ?auto_602400 ?auto_602411 ) ) ( not ( = ?auto_602400 ?auto_602412 ) ) ( not ( = ?auto_602401 ?auto_602402 ) ) ( not ( = ?auto_602401 ?auto_602403 ) ) ( not ( = ?auto_602401 ?auto_602404 ) ) ( not ( = ?auto_602401 ?auto_602405 ) ) ( not ( = ?auto_602401 ?auto_602406 ) ) ( not ( = ?auto_602401 ?auto_602407 ) ) ( not ( = ?auto_602401 ?auto_602408 ) ) ( not ( = ?auto_602401 ?auto_602409 ) ) ( not ( = ?auto_602401 ?auto_602410 ) ) ( not ( = ?auto_602401 ?auto_602411 ) ) ( not ( = ?auto_602401 ?auto_602412 ) ) ( not ( = ?auto_602402 ?auto_602403 ) ) ( not ( = ?auto_602402 ?auto_602404 ) ) ( not ( = ?auto_602402 ?auto_602405 ) ) ( not ( = ?auto_602402 ?auto_602406 ) ) ( not ( = ?auto_602402 ?auto_602407 ) ) ( not ( = ?auto_602402 ?auto_602408 ) ) ( not ( = ?auto_602402 ?auto_602409 ) ) ( not ( = ?auto_602402 ?auto_602410 ) ) ( not ( = ?auto_602402 ?auto_602411 ) ) ( not ( = ?auto_602402 ?auto_602412 ) ) ( not ( = ?auto_602403 ?auto_602404 ) ) ( not ( = ?auto_602403 ?auto_602405 ) ) ( not ( = ?auto_602403 ?auto_602406 ) ) ( not ( = ?auto_602403 ?auto_602407 ) ) ( not ( = ?auto_602403 ?auto_602408 ) ) ( not ( = ?auto_602403 ?auto_602409 ) ) ( not ( = ?auto_602403 ?auto_602410 ) ) ( not ( = ?auto_602403 ?auto_602411 ) ) ( not ( = ?auto_602403 ?auto_602412 ) ) ( not ( = ?auto_602404 ?auto_602405 ) ) ( not ( = ?auto_602404 ?auto_602406 ) ) ( not ( = ?auto_602404 ?auto_602407 ) ) ( not ( = ?auto_602404 ?auto_602408 ) ) ( not ( = ?auto_602404 ?auto_602409 ) ) ( not ( = ?auto_602404 ?auto_602410 ) ) ( not ( = ?auto_602404 ?auto_602411 ) ) ( not ( = ?auto_602404 ?auto_602412 ) ) ( not ( = ?auto_602405 ?auto_602406 ) ) ( not ( = ?auto_602405 ?auto_602407 ) ) ( not ( = ?auto_602405 ?auto_602408 ) ) ( not ( = ?auto_602405 ?auto_602409 ) ) ( not ( = ?auto_602405 ?auto_602410 ) ) ( not ( = ?auto_602405 ?auto_602411 ) ) ( not ( = ?auto_602405 ?auto_602412 ) ) ( not ( = ?auto_602406 ?auto_602407 ) ) ( not ( = ?auto_602406 ?auto_602408 ) ) ( not ( = ?auto_602406 ?auto_602409 ) ) ( not ( = ?auto_602406 ?auto_602410 ) ) ( not ( = ?auto_602406 ?auto_602411 ) ) ( not ( = ?auto_602406 ?auto_602412 ) ) ( not ( = ?auto_602407 ?auto_602408 ) ) ( not ( = ?auto_602407 ?auto_602409 ) ) ( not ( = ?auto_602407 ?auto_602410 ) ) ( not ( = ?auto_602407 ?auto_602411 ) ) ( not ( = ?auto_602407 ?auto_602412 ) ) ( not ( = ?auto_602408 ?auto_602409 ) ) ( not ( = ?auto_602408 ?auto_602410 ) ) ( not ( = ?auto_602408 ?auto_602411 ) ) ( not ( = ?auto_602408 ?auto_602412 ) ) ( not ( = ?auto_602409 ?auto_602410 ) ) ( not ( = ?auto_602409 ?auto_602411 ) ) ( not ( = ?auto_602409 ?auto_602412 ) ) ( not ( = ?auto_602410 ?auto_602411 ) ) ( not ( = ?auto_602410 ?auto_602412 ) ) ( not ( = ?auto_602411 ?auto_602412 ) ) ( ON ?auto_602410 ?auto_602411 ) ( ON ?auto_602409 ?auto_602410 ) ( ON ?auto_602408 ?auto_602409 ) ( CLEAR ?auto_602406 ) ( ON ?auto_602407 ?auto_602408 ) ( CLEAR ?auto_602407 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_602397 ?auto_602398 ?auto_602399 ?auto_602400 ?auto_602401 ?auto_602402 ?auto_602403 ?auto_602404 ?auto_602405 ?auto_602406 ?auto_602407 )
      ( MAKE-15PILE ?auto_602397 ?auto_602398 ?auto_602399 ?auto_602400 ?auto_602401 ?auto_602402 ?auto_602403 ?auto_602404 ?auto_602405 ?auto_602406 ?auto_602407 ?auto_602408 ?auto_602409 ?auto_602410 ?auto_602411 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_602459 - BLOCK
      ?auto_602460 - BLOCK
      ?auto_602461 - BLOCK
      ?auto_602462 - BLOCK
      ?auto_602463 - BLOCK
      ?auto_602464 - BLOCK
      ?auto_602465 - BLOCK
      ?auto_602466 - BLOCK
      ?auto_602467 - BLOCK
      ?auto_602468 - BLOCK
      ?auto_602469 - BLOCK
      ?auto_602470 - BLOCK
      ?auto_602471 - BLOCK
      ?auto_602472 - BLOCK
      ?auto_602473 - BLOCK
    )
    :vars
    (
      ?auto_602474 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_602473 ?auto_602474 ) ( ON-TABLE ?auto_602459 ) ( ON ?auto_602460 ?auto_602459 ) ( ON ?auto_602461 ?auto_602460 ) ( ON ?auto_602462 ?auto_602461 ) ( ON ?auto_602463 ?auto_602462 ) ( ON ?auto_602464 ?auto_602463 ) ( ON ?auto_602465 ?auto_602464 ) ( ON ?auto_602466 ?auto_602465 ) ( ON ?auto_602467 ?auto_602466 ) ( not ( = ?auto_602459 ?auto_602460 ) ) ( not ( = ?auto_602459 ?auto_602461 ) ) ( not ( = ?auto_602459 ?auto_602462 ) ) ( not ( = ?auto_602459 ?auto_602463 ) ) ( not ( = ?auto_602459 ?auto_602464 ) ) ( not ( = ?auto_602459 ?auto_602465 ) ) ( not ( = ?auto_602459 ?auto_602466 ) ) ( not ( = ?auto_602459 ?auto_602467 ) ) ( not ( = ?auto_602459 ?auto_602468 ) ) ( not ( = ?auto_602459 ?auto_602469 ) ) ( not ( = ?auto_602459 ?auto_602470 ) ) ( not ( = ?auto_602459 ?auto_602471 ) ) ( not ( = ?auto_602459 ?auto_602472 ) ) ( not ( = ?auto_602459 ?auto_602473 ) ) ( not ( = ?auto_602459 ?auto_602474 ) ) ( not ( = ?auto_602460 ?auto_602461 ) ) ( not ( = ?auto_602460 ?auto_602462 ) ) ( not ( = ?auto_602460 ?auto_602463 ) ) ( not ( = ?auto_602460 ?auto_602464 ) ) ( not ( = ?auto_602460 ?auto_602465 ) ) ( not ( = ?auto_602460 ?auto_602466 ) ) ( not ( = ?auto_602460 ?auto_602467 ) ) ( not ( = ?auto_602460 ?auto_602468 ) ) ( not ( = ?auto_602460 ?auto_602469 ) ) ( not ( = ?auto_602460 ?auto_602470 ) ) ( not ( = ?auto_602460 ?auto_602471 ) ) ( not ( = ?auto_602460 ?auto_602472 ) ) ( not ( = ?auto_602460 ?auto_602473 ) ) ( not ( = ?auto_602460 ?auto_602474 ) ) ( not ( = ?auto_602461 ?auto_602462 ) ) ( not ( = ?auto_602461 ?auto_602463 ) ) ( not ( = ?auto_602461 ?auto_602464 ) ) ( not ( = ?auto_602461 ?auto_602465 ) ) ( not ( = ?auto_602461 ?auto_602466 ) ) ( not ( = ?auto_602461 ?auto_602467 ) ) ( not ( = ?auto_602461 ?auto_602468 ) ) ( not ( = ?auto_602461 ?auto_602469 ) ) ( not ( = ?auto_602461 ?auto_602470 ) ) ( not ( = ?auto_602461 ?auto_602471 ) ) ( not ( = ?auto_602461 ?auto_602472 ) ) ( not ( = ?auto_602461 ?auto_602473 ) ) ( not ( = ?auto_602461 ?auto_602474 ) ) ( not ( = ?auto_602462 ?auto_602463 ) ) ( not ( = ?auto_602462 ?auto_602464 ) ) ( not ( = ?auto_602462 ?auto_602465 ) ) ( not ( = ?auto_602462 ?auto_602466 ) ) ( not ( = ?auto_602462 ?auto_602467 ) ) ( not ( = ?auto_602462 ?auto_602468 ) ) ( not ( = ?auto_602462 ?auto_602469 ) ) ( not ( = ?auto_602462 ?auto_602470 ) ) ( not ( = ?auto_602462 ?auto_602471 ) ) ( not ( = ?auto_602462 ?auto_602472 ) ) ( not ( = ?auto_602462 ?auto_602473 ) ) ( not ( = ?auto_602462 ?auto_602474 ) ) ( not ( = ?auto_602463 ?auto_602464 ) ) ( not ( = ?auto_602463 ?auto_602465 ) ) ( not ( = ?auto_602463 ?auto_602466 ) ) ( not ( = ?auto_602463 ?auto_602467 ) ) ( not ( = ?auto_602463 ?auto_602468 ) ) ( not ( = ?auto_602463 ?auto_602469 ) ) ( not ( = ?auto_602463 ?auto_602470 ) ) ( not ( = ?auto_602463 ?auto_602471 ) ) ( not ( = ?auto_602463 ?auto_602472 ) ) ( not ( = ?auto_602463 ?auto_602473 ) ) ( not ( = ?auto_602463 ?auto_602474 ) ) ( not ( = ?auto_602464 ?auto_602465 ) ) ( not ( = ?auto_602464 ?auto_602466 ) ) ( not ( = ?auto_602464 ?auto_602467 ) ) ( not ( = ?auto_602464 ?auto_602468 ) ) ( not ( = ?auto_602464 ?auto_602469 ) ) ( not ( = ?auto_602464 ?auto_602470 ) ) ( not ( = ?auto_602464 ?auto_602471 ) ) ( not ( = ?auto_602464 ?auto_602472 ) ) ( not ( = ?auto_602464 ?auto_602473 ) ) ( not ( = ?auto_602464 ?auto_602474 ) ) ( not ( = ?auto_602465 ?auto_602466 ) ) ( not ( = ?auto_602465 ?auto_602467 ) ) ( not ( = ?auto_602465 ?auto_602468 ) ) ( not ( = ?auto_602465 ?auto_602469 ) ) ( not ( = ?auto_602465 ?auto_602470 ) ) ( not ( = ?auto_602465 ?auto_602471 ) ) ( not ( = ?auto_602465 ?auto_602472 ) ) ( not ( = ?auto_602465 ?auto_602473 ) ) ( not ( = ?auto_602465 ?auto_602474 ) ) ( not ( = ?auto_602466 ?auto_602467 ) ) ( not ( = ?auto_602466 ?auto_602468 ) ) ( not ( = ?auto_602466 ?auto_602469 ) ) ( not ( = ?auto_602466 ?auto_602470 ) ) ( not ( = ?auto_602466 ?auto_602471 ) ) ( not ( = ?auto_602466 ?auto_602472 ) ) ( not ( = ?auto_602466 ?auto_602473 ) ) ( not ( = ?auto_602466 ?auto_602474 ) ) ( not ( = ?auto_602467 ?auto_602468 ) ) ( not ( = ?auto_602467 ?auto_602469 ) ) ( not ( = ?auto_602467 ?auto_602470 ) ) ( not ( = ?auto_602467 ?auto_602471 ) ) ( not ( = ?auto_602467 ?auto_602472 ) ) ( not ( = ?auto_602467 ?auto_602473 ) ) ( not ( = ?auto_602467 ?auto_602474 ) ) ( not ( = ?auto_602468 ?auto_602469 ) ) ( not ( = ?auto_602468 ?auto_602470 ) ) ( not ( = ?auto_602468 ?auto_602471 ) ) ( not ( = ?auto_602468 ?auto_602472 ) ) ( not ( = ?auto_602468 ?auto_602473 ) ) ( not ( = ?auto_602468 ?auto_602474 ) ) ( not ( = ?auto_602469 ?auto_602470 ) ) ( not ( = ?auto_602469 ?auto_602471 ) ) ( not ( = ?auto_602469 ?auto_602472 ) ) ( not ( = ?auto_602469 ?auto_602473 ) ) ( not ( = ?auto_602469 ?auto_602474 ) ) ( not ( = ?auto_602470 ?auto_602471 ) ) ( not ( = ?auto_602470 ?auto_602472 ) ) ( not ( = ?auto_602470 ?auto_602473 ) ) ( not ( = ?auto_602470 ?auto_602474 ) ) ( not ( = ?auto_602471 ?auto_602472 ) ) ( not ( = ?auto_602471 ?auto_602473 ) ) ( not ( = ?auto_602471 ?auto_602474 ) ) ( not ( = ?auto_602472 ?auto_602473 ) ) ( not ( = ?auto_602472 ?auto_602474 ) ) ( not ( = ?auto_602473 ?auto_602474 ) ) ( ON ?auto_602472 ?auto_602473 ) ( ON ?auto_602471 ?auto_602472 ) ( ON ?auto_602470 ?auto_602471 ) ( ON ?auto_602469 ?auto_602470 ) ( CLEAR ?auto_602467 ) ( ON ?auto_602468 ?auto_602469 ) ( CLEAR ?auto_602468 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_602459 ?auto_602460 ?auto_602461 ?auto_602462 ?auto_602463 ?auto_602464 ?auto_602465 ?auto_602466 ?auto_602467 ?auto_602468 )
      ( MAKE-15PILE ?auto_602459 ?auto_602460 ?auto_602461 ?auto_602462 ?auto_602463 ?auto_602464 ?auto_602465 ?auto_602466 ?auto_602467 ?auto_602468 ?auto_602469 ?auto_602470 ?auto_602471 ?auto_602472 ?auto_602473 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_602521 - BLOCK
      ?auto_602522 - BLOCK
      ?auto_602523 - BLOCK
      ?auto_602524 - BLOCK
      ?auto_602525 - BLOCK
      ?auto_602526 - BLOCK
      ?auto_602527 - BLOCK
      ?auto_602528 - BLOCK
      ?auto_602529 - BLOCK
      ?auto_602530 - BLOCK
      ?auto_602531 - BLOCK
      ?auto_602532 - BLOCK
      ?auto_602533 - BLOCK
      ?auto_602534 - BLOCK
      ?auto_602535 - BLOCK
    )
    :vars
    (
      ?auto_602536 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_602535 ?auto_602536 ) ( ON-TABLE ?auto_602521 ) ( ON ?auto_602522 ?auto_602521 ) ( ON ?auto_602523 ?auto_602522 ) ( ON ?auto_602524 ?auto_602523 ) ( ON ?auto_602525 ?auto_602524 ) ( ON ?auto_602526 ?auto_602525 ) ( ON ?auto_602527 ?auto_602526 ) ( ON ?auto_602528 ?auto_602527 ) ( not ( = ?auto_602521 ?auto_602522 ) ) ( not ( = ?auto_602521 ?auto_602523 ) ) ( not ( = ?auto_602521 ?auto_602524 ) ) ( not ( = ?auto_602521 ?auto_602525 ) ) ( not ( = ?auto_602521 ?auto_602526 ) ) ( not ( = ?auto_602521 ?auto_602527 ) ) ( not ( = ?auto_602521 ?auto_602528 ) ) ( not ( = ?auto_602521 ?auto_602529 ) ) ( not ( = ?auto_602521 ?auto_602530 ) ) ( not ( = ?auto_602521 ?auto_602531 ) ) ( not ( = ?auto_602521 ?auto_602532 ) ) ( not ( = ?auto_602521 ?auto_602533 ) ) ( not ( = ?auto_602521 ?auto_602534 ) ) ( not ( = ?auto_602521 ?auto_602535 ) ) ( not ( = ?auto_602521 ?auto_602536 ) ) ( not ( = ?auto_602522 ?auto_602523 ) ) ( not ( = ?auto_602522 ?auto_602524 ) ) ( not ( = ?auto_602522 ?auto_602525 ) ) ( not ( = ?auto_602522 ?auto_602526 ) ) ( not ( = ?auto_602522 ?auto_602527 ) ) ( not ( = ?auto_602522 ?auto_602528 ) ) ( not ( = ?auto_602522 ?auto_602529 ) ) ( not ( = ?auto_602522 ?auto_602530 ) ) ( not ( = ?auto_602522 ?auto_602531 ) ) ( not ( = ?auto_602522 ?auto_602532 ) ) ( not ( = ?auto_602522 ?auto_602533 ) ) ( not ( = ?auto_602522 ?auto_602534 ) ) ( not ( = ?auto_602522 ?auto_602535 ) ) ( not ( = ?auto_602522 ?auto_602536 ) ) ( not ( = ?auto_602523 ?auto_602524 ) ) ( not ( = ?auto_602523 ?auto_602525 ) ) ( not ( = ?auto_602523 ?auto_602526 ) ) ( not ( = ?auto_602523 ?auto_602527 ) ) ( not ( = ?auto_602523 ?auto_602528 ) ) ( not ( = ?auto_602523 ?auto_602529 ) ) ( not ( = ?auto_602523 ?auto_602530 ) ) ( not ( = ?auto_602523 ?auto_602531 ) ) ( not ( = ?auto_602523 ?auto_602532 ) ) ( not ( = ?auto_602523 ?auto_602533 ) ) ( not ( = ?auto_602523 ?auto_602534 ) ) ( not ( = ?auto_602523 ?auto_602535 ) ) ( not ( = ?auto_602523 ?auto_602536 ) ) ( not ( = ?auto_602524 ?auto_602525 ) ) ( not ( = ?auto_602524 ?auto_602526 ) ) ( not ( = ?auto_602524 ?auto_602527 ) ) ( not ( = ?auto_602524 ?auto_602528 ) ) ( not ( = ?auto_602524 ?auto_602529 ) ) ( not ( = ?auto_602524 ?auto_602530 ) ) ( not ( = ?auto_602524 ?auto_602531 ) ) ( not ( = ?auto_602524 ?auto_602532 ) ) ( not ( = ?auto_602524 ?auto_602533 ) ) ( not ( = ?auto_602524 ?auto_602534 ) ) ( not ( = ?auto_602524 ?auto_602535 ) ) ( not ( = ?auto_602524 ?auto_602536 ) ) ( not ( = ?auto_602525 ?auto_602526 ) ) ( not ( = ?auto_602525 ?auto_602527 ) ) ( not ( = ?auto_602525 ?auto_602528 ) ) ( not ( = ?auto_602525 ?auto_602529 ) ) ( not ( = ?auto_602525 ?auto_602530 ) ) ( not ( = ?auto_602525 ?auto_602531 ) ) ( not ( = ?auto_602525 ?auto_602532 ) ) ( not ( = ?auto_602525 ?auto_602533 ) ) ( not ( = ?auto_602525 ?auto_602534 ) ) ( not ( = ?auto_602525 ?auto_602535 ) ) ( not ( = ?auto_602525 ?auto_602536 ) ) ( not ( = ?auto_602526 ?auto_602527 ) ) ( not ( = ?auto_602526 ?auto_602528 ) ) ( not ( = ?auto_602526 ?auto_602529 ) ) ( not ( = ?auto_602526 ?auto_602530 ) ) ( not ( = ?auto_602526 ?auto_602531 ) ) ( not ( = ?auto_602526 ?auto_602532 ) ) ( not ( = ?auto_602526 ?auto_602533 ) ) ( not ( = ?auto_602526 ?auto_602534 ) ) ( not ( = ?auto_602526 ?auto_602535 ) ) ( not ( = ?auto_602526 ?auto_602536 ) ) ( not ( = ?auto_602527 ?auto_602528 ) ) ( not ( = ?auto_602527 ?auto_602529 ) ) ( not ( = ?auto_602527 ?auto_602530 ) ) ( not ( = ?auto_602527 ?auto_602531 ) ) ( not ( = ?auto_602527 ?auto_602532 ) ) ( not ( = ?auto_602527 ?auto_602533 ) ) ( not ( = ?auto_602527 ?auto_602534 ) ) ( not ( = ?auto_602527 ?auto_602535 ) ) ( not ( = ?auto_602527 ?auto_602536 ) ) ( not ( = ?auto_602528 ?auto_602529 ) ) ( not ( = ?auto_602528 ?auto_602530 ) ) ( not ( = ?auto_602528 ?auto_602531 ) ) ( not ( = ?auto_602528 ?auto_602532 ) ) ( not ( = ?auto_602528 ?auto_602533 ) ) ( not ( = ?auto_602528 ?auto_602534 ) ) ( not ( = ?auto_602528 ?auto_602535 ) ) ( not ( = ?auto_602528 ?auto_602536 ) ) ( not ( = ?auto_602529 ?auto_602530 ) ) ( not ( = ?auto_602529 ?auto_602531 ) ) ( not ( = ?auto_602529 ?auto_602532 ) ) ( not ( = ?auto_602529 ?auto_602533 ) ) ( not ( = ?auto_602529 ?auto_602534 ) ) ( not ( = ?auto_602529 ?auto_602535 ) ) ( not ( = ?auto_602529 ?auto_602536 ) ) ( not ( = ?auto_602530 ?auto_602531 ) ) ( not ( = ?auto_602530 ?auto_602532 ) ) ( not ( = ?auto_602530 ?auto_602533 ) ) ( not ( = ?auto_602530 ?auto_602534 ) ) ( not ( = ?auto_602530 ?auto_602535 ) ) ( not ( = ?auto_602530 ?auto_602536 ) ) ( not ( = ?auto_602531 ?auto_602532 ) ) ( not ( = ?auto_602531 ?auto_602533 ) ) ( not ( = ?auto_602531 ?auto_602534 ) ) ( not ( = ?auto_602531 ?auto_602535 ) ) ( not ( = ?auto_602531 ?auto_602536 ) ) ( not ( = ?auto_602532 ?auto_602533 ) ) ( not ( = ?auto_602532 ?auto_602534 ) ) ( not ( = ?auto_602532 ?auto_602535 ) ) ( not ( = ?auto_602532 ?auto_602536 ) ) ( not ( = ?auto_602533 ?auto_602534 ) ) ( not ( = ?auto_602533 ?auto_602535 ) ) ( not ( = ?auto_602533 ?auto_602536 ) ) ( not ( = ?auto_602534 ?auto_602535 ) ) ( not ( = ?auto_602534 ?auto_602536 ) ) ( not ( = ?auto_602535 ?auto_602536 ) ) ( ON ?auto_602534 ?auto_602535 ) ( ON ?auto_602533 ?auto_602534 ) ( ON ?auto_602532 ?auto_602533 ) ( ON ?auto_602531 ?auto_602532 ) ( ON ?auto_602530 ?auto_602531 ) ( CLEAR ?auto_602528 ) ( ON ?auto_602529 ?auto_602530 ) ( CLEAR ?auto_602529 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_602521 ?auto_602522 ?auto_602523 ?auto_602524 ?auto_602525 ?auto_602526 ?auto_602527 ?auto_602528 ?auto_602529 )
      ( MAKE-15PILE ?auto_602521 ?auto_602522 ?auto_602523 ?auto_602524 ?auto_602525 ?auto_602526 ?auto_602527 ?auto_602528 ?auto_602529 ?auto_602530 ?auto_602531 ?auto_602532 ?auto_602533 ?auto_602534 ?auto_602535 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_602583 - BLOCK
      ?auto_602584 - BLOCK
      ?auto_602585 - BLOCK
      ?auto_602586 - BLOCK
      ?auto_602587 - BLOCK
      ?auto_602588 - BLOCK
      ?auto_602589 - BLOCK
      ?auto_602590 - BLOCK
      ?auto_602591 - BLOCK
      ?auto_602592 - BLOCK
      ?auto_602593 - BLOCK
      ?auto_602594 - BLOCK
      ?auto_602595 - BLOCK
      ?auto_602596 - BLOCK
      ?auto_602597 - BLOCK
    )
    :vars
    (
      ?auto_602598 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_602597 ?auto_602598 ) ( ON-TABLE ?auto_602583 ) ( ON ?auto_602584 ?auto_602583 ) ( ON ?auto_602585 ?auto_602584 ) ( ON ?auto_602586 ?auto_602585 ) ( ON ?auto_602587 ?auto_602586 ) ( ON ?auto_602588 ?auto_602587 ) ( ON ?auto_602589 ?auto_602588 ) ( not ( = ?auto_602583 ?auto_602584 ) ) ( not ( = ?auto_602583 ?auto_602585 ) ) ( not ( = ?auto_602583 ?auto_602586 ) ) ( not ( = ?auto_602583 ?auto_602587 ) ) ( not ( = ?auto_602583 ?auto_602588 ) ) ( not ( = ?auto_602583 ?auto_602589 ) ) ( not ( = ?auto_602583 ?auto_602590 ) ) ( not ( = ?auto_602583 ?auto_602591 ) ) ( not ( = ?auto_602583 ?auto_602592 ) ) ( not ( = ?auto_602583 ?auto_602593 ) ) ( not ( = ?auto_602583 ?auto_602594 ) ) ( not ( = ?auto_602583 ?auto_602595 ) ) ( not ( = ?auto_602583 ?auto_602596 ) ) ( not ( = ?auto_602583 ?auto_602597 ) ) ( not ( = ?auto_602583 ?auto_602598 ) ) ( not ( = ?auto_602584 ?auto_602585 ) ) ( not ( = ?auto_602584 ?auto_602586 ) ) ( not ( = ?auto_602584 ?auto_602587 ) ) ( not ( = ?auto_602584 ?auto_602588 ) ) ( not ( = ?auto_602584 ?auto_602589 ) ) ( not ( = ?auto_602584 ?auto_602590 ) ) ( not ( = ?auto_602584 ?auto_602591 ) ) ( not ( = ?auto_602584 ?auto_602592 ) ) ( not ( = ?auto_602584 ?auto_602593 ) ) ( not ( = ?auto_602584 ?auto_602594 ) ) ( not ( = ?auto_602584 ?auto_602595 ) ) ( not ( = ?auto_602584 ?auto_602596 ) ) ( not ( = ?auto_602584 ?auto_602597 ) ) ( not ( = ?auto_602584 ?auto_602598 ) ) ( not ( = ?auto_602585 ?auto_602586 ) ) ( not ( = ?auto_602585 ?auto_602587 ) ) ( not ( = ?auto_602585 ?auto_602588 ) ) ( not ( = ?auto_602585 ?auto_602589 ) ) ( not ( = ?auto_602585 ?auto_602590 ) ) ( not ( = ?auto_602585 ?auto_602591 ) ) ( not ( = ?auto_602585 ?auto_602592 ) ) ( not ( = ?auto_602585 ?auto_602593 ) ) ( not ( = ?auto_602585 ?auto_602594 ) ) ( not ( = ?auto_602585 ?auto_602595 ) ) ( not ( = ?auto_602585 ?auto_602596 ) ) ( not ( = ?auto_602585 ?auto_602597 ) ) ( not ( = ?auto_602585 ?auto_602598 ) ) ( not ( = ?auto_602586 ?auto_602587 ) ) ( not ( = ?auto_602586 ?auto_602588 ) ) ( not ( = ?auto_602586 ?auto_602589 ) ) ( not ( = ?auto_602586 ?auto_602590 ) ) ( not ( = ?auto_602586 ?auto_602591 ) ) ( not ( = ?auto_602586 ?auto_602592 ) ) ( not ( = ?auto_602586 ?auto_602593 ) ) ( not ( = ?auto_602586 ?auto_602594 ) ) ( not ( = ?auto_602586 ?auto_602595 ) ) ( not ( = ?auto_602586 ?auto_602596 ) ) ( not ( = ?auto_602586 ?auto_602597 ) ) ( not ( = ?auto_602586 ?auto_602598 ) ) ( not ( = ?auto_602587 ?auto_602588 ) ) ( not ( = ?auto_602587 ?auto_602589 ) ) ( not ( = ?auto_602587 ?auto_602590 ) ) ( not ( = ?auto_602587 ?auto_602591 ) ) ( not ( = ?auto_602587 ?auto_602592 ) ) ( not ( = ?auto_602587 ?auto_602593 ) ) ( not ( = ?auto_602587 ?auto_602594 ) ) ( not ( = ?auto_602587 ?auto_602595 ) ) ( not ( = ?auto_602587 ?auto_602596 ) ) ( not ( = ?auto_602587 ?auto_602597 ) ) ( not ( = ?auto_602587 ?auto_602598 ) ) ( not ( = ?auto_602588 ?auto_602589 ) ) ( not ( = ?auto_602588 ?auto_602590 ) ) ( not ( = ?auto_602588 ?auto_602591 ) ) ( not ( = ?auto_602588 ?auto_602592 ) ) ( not ( = ?auto_602588 ?auto_602593 ) ) ( not ( = ?auto_602588 ?auto_602594 ) ) ( not ( = ?auto_602588 ?auto_602595 ) ) ( not ( = ?auto_602588 ?auto_602596 ) ) ( not ( = ?auto_602588 ?auto_602597 ) ) ( not ( = ?auto_602588 ?auto_602598 ) ) ( not ( = ?auto_602589 ?auto_602590 ) ) ( not ( = ?auto_602589 ?auto_602591 ) ) ( not ( = ?auto_602589 ?auto_602592 ) ) ( not ( = ?auto_602589 ?auto_602593 ) ) ( not ( = ?auto_602589 ?auto_602594 ) ) ( not ( = ?auto_602589 ?auto_602595 ) ) ( not ( = ?auto_602589 ?auto_602596 ) ) ( not ( = ?auto_602589 ?auto_602597 ) ) ( not ( = ?auto_602589 ?auto_602598 ) ) ( not ( = ?auto_602590 ?auto_602591 ) ) ( not ( = ?auto_602590 ?auto_602592 ) ) ( not ( = ?auto_602590 ?auto_602593 ) ) ( not ( = ?auto_602590 ?auto_602594 ) ) ( not ( = ?auto_602590 ?auto_602595 ) ) ( not ( = ?auto_602590 ?auto_602596 ) ) ( not ( = ?auto_602590 ?auto_602597 ) ) ( not ( = ?auto_602590 ?auto_602598 ) ) ( not ( = ?auto_602591 ?auto_602592 ) ) ( not ( = ?auto_602591 ?auto_602593 ) ) ( not ( = ?auto_602591 ?auto_602594 ) ) ( not ( = ?auto_602591 ?auto_602595 ) ) ( not ( = ?auto_602591 ?auto_602596 ) ) ( not ( = ?auto_602591 ?auto_602597 ) ) ( not ( = ?auto_602591 ?auto_602598 ) ) ( not ( = ?auto_602592 ?auto_602593 ) ) ( not ( = ?auto_602592 ?auto_602594 ) ) ( not ( = ?auto_602592 ?auto_602595 ) ) ( not ( = ?auto_602592 ?auto_602596 ) ) ( not ( = ?auto_602592 ?auto_602597 ) ) ( not ( = ?auto_602592 ?auto_602598 ) ) ( not ( = ?auto_602593 ?auto_602594 ) ) ( not ( = ?auto_602593 ?auto_602595 ) ) ( not ( = ?auto_602593 ?auto_602596 ) ) ( not ( = ?auto_602593 ?auto_602597 ) ) ( not ( = ?auto_602593 ?auto_602598 ) ) ( not ( = ?auto_602594 ?auto_602595 ) ) ( not ( = ?auto_602594 ?auto_602596 ) ) ( not ( = ?auto_602594 ?auto_602597 ) ) ( not ( = ?auto_602594 ?auto_602598 ) ) ( not ( = ?auto_602595 ?auto_602596 ) ) ( not ( = ?auto_602595 ?auto_602597 ) ) ( not ( = ?auto_602595 ?auto_602598 ) ) ( not ( = ?auto_602596 ?auto_602597 ) ) ( not ( = ?auto_602596 ?auto_602598 ) ) ( not ( = ?auto_602597 ?auto_602598 ) ) ( ON ?auto_602596 ?auto_602597 ) ( ON ?auto_602595 ?auto_602596 ) ( ON ?auto_602594 ?auto_602595 ) ( ON ?auto_602593 ?auto_602594 ) ( ON ?auto_602592 ?auto_602593 ) ( ON ?auto_602591 ?auto_602592 ) ( CLEAR ?auto_602589 ) ( ON ?auto_602590 ?auto_602591 ) ( CLEAR ?auto_602590 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_602583 ?auto_602584 ?auto_602585 ?auto_602586 ?auto_602587 ?auto_602588 ?auto_602589 ?auto_602590 )
      ( MAKE-15PILE ?auto_602583 ?auto_602584 ?auto_602585 ?auto_602586 ?auto_602587 ?auto_602588 ?auto_602589 ?auto_602590 ?auto_602591 ?auto_602592 ?auto_602593 ?auto_602594 ?auto_602595 ?auto_602596 ?auto_602597 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_602645 - BLOCK
      ?auto_602646 - BLOCK
      ?auto_602647 - BLOCK
      ?auto_602648 - BLOCK
      ?auto_602649 - BLOCK
      ?auto_602650 - BLOCK
      ?auto_602651 - BLOCK
      ?auto_602652 - BLOCK
      ?auto_602653 - BLOCK
      ?auto_602654 - BLOCK
      ?auto_602655 - BLOCK
      ?auto_602656 - BLOCK
      ?auto_602657 - BLOCK
      ?auto_602658 - BLOCK
      ?auto_602659 - BLOCK
    )
    :vars
    (
      ?auto_602660 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_602659 ?auto_602660 ) ( ON-TABLE ?auto_602645 ) ( ON ?auto_602646 ?auto_602645 ) ( ON ?auto_602647 ?auto_602646 ) ( ON ?auto_602648 ?auto_602647 ) ( ON ?auto_602649 ?auto_602648 ) ( ON ?auto_602650 ?auto_602649 ) ( not ( = ?auto_602645 ?auto_602646 ) ) ( not ( = ?auto_602645 ?auto_602647 ) ) ( not ( = ?auto_602645 ?auto_602648 ) ) ( not ( = ?auto_602645 ?auto_602649 ) ) ( not ( = ?auto_602645 ?auto_602650 ) ) ( not ( = ?auto_602645 ?auto_602651 ) ) ( not ( = ?auto_602645 ?auto_602652 ) ) ( not ( = ?auto_602645 ?auto_602653 ) ) ( not ( = ?auto_602645 ?auto_602654 ) ) ( not ( = ?auto_602645 ?auto_602655 ) ) ( not ( = ?auto_602645 ?auto_602656 ) ) ( not ( = ?auto_602645 ?auto_602657 ) ) ( not ( = ?auto_602645 ?auto_602658 ) ) ( not ( = ?auto_602645 ?auto_602659 ) ) ( not ( = ?auto_602645 ?auto_602660 ) ) ( not ( = ?auto_602646 ?auto_602647 ) ) ( not ( = ?auto_602646 ?auto_602648 ) ) ( not ( = ?auto_602646 ?auto_602649 ) ) ( not ( = ?auto_602646 ?auto_602650 ) ) ( not ( = ?auto_602646 ?auto_602651 ) ) ( not ( = ?auto_602646 ?auto_602652 ) ) ( not ( = ?auto_602646 ?auto_602653 ) ) ( not ( = ?auto_602646 ?auto_602654 ) ) ( not ( = ?auto_602646 ?auto_602655 ) ) ( not ( = ?auto_602646 ?auto_602656 ) ) ( not ( = ?auto_602646 ?auto_602657 ) ) ( not ( = ?auto_602646 ?auto_602658 ) ) ( not ( = ?auto_602646 ?auto_602659 ) ) ( not ( = ?auto_602646 ?auto_602660 ) ) ( not ( = ?auto_602647 ?auto_602648 ) ) ( not ( = ?auto_602647 ?auto_602649 ) ) ( not ( = ?auto_602647 ?auto_602650 ) ) ( not ( = ?auto_602647 ?auto_602651 ) ) ( not ( = ?auto_602647 ?auto_602652 ) ) ( not ( = ?auto_602647 ?auto_602653 ) ) ( not ( = ?auto_602647 ?auto_602654 ) ) ( not ( = ?auto_602647 ?auto_602655 ) ) ( not ( = ?auto_602647 ?auto_602656 ) ) ( not ( = ?auto_602647 ?auto_602657 ) ) ( not ( = ?auto_602647 ?auto_602658 ) ) ( not ( = ?auto_602647 ?auto_602659 ) ) ( not ( = ?auto_602647 ?auto_602660 ) ) ( not ( = ?auto_602648 ?auto_602649 ) ) ( not ( = ?auto_602648 ?auto_602650 ) ) ( not ( = ?auto_602648 ?auto_602651 ) ) ( not ( = ?auto_602648 ?auto_602652 ) ) ( not ( = ?auto_602648 ?auto_602653 ) ) ( not ( = ?auto_602648 ?auto_602654 ) ) ( not ( = ?auto_602648 ?auto_602655 ) ) ( not ( = ?auto_602648 ?auto_602656 ) ) ( not ( = ?auto_602648 ?auto_602657 ) ) ( not ( = ?auto_602648 ?auto_602658 ) ) ( not ( = ?auto_602648 ?auto_602659 ) ) ( not ( = ?auto_602648 ?auto_602660 ) ) ( not ( = ?auto_602649 ?auto_602650 ) ) ( not ( = ?auto_602649 ?auto_602651 ) ) ( not ( = ?auto_602649 ?auto_602652 ) ) ( not ( = ?auto_602649 ?auto_602653 ) ) ( not ( = ?auto_602649 ?auto_602654 ) ) ( not ( = ?auto_602649 ?auto_602655 ) ) ( not ( = ?auto_602649 ?auto_602656 ) ) ( not ( = ?auto_602649 ?auto_602657 ) ) ( not ( = ?auto_602649 ?auto_602658 ) ) ( not ( = ?auto_602649 ?auto_602659 ) ) ( not ( = ?auto_602649 ?auto_602660 ) ) ( not ( = ?auto_602650 ?auto_602651 ) ) ( not ( = ?auto_602650 ?auto_602652 ) ) ( not ( = ?auto_602650 ?auto_602653 ) ) ( not ( = ?auto_602650 ?auto_602654 ) ) ( not ( = ?auto_602650 ?auto_602655 ) ) ( not ( = ?auto_602650 ?auto_602656 ) ) ( not ( = ?auto_602650 ?auto_602657 ) ) ( not ( = ?auto_602650 ?auto_602658 ) ) ( not ( = ?auto_602650 ?auto_602659 ) ) ( not ( = ?auto_602650 ?auto_602660 ) ) ( not ( = ?auto_602651 ?auto_602652 ) ) ( not ( = ?auto_602651 ?auto_602653 ) ) ( not ( = ?auto_602651 ?auto_602654 ) ) ( not ( = ?auto_602651 ?auto_602655 ) ) ( not ( = ?auto_602651 ?auto_602656 ) ) ( not ( = ?auto_602651 ?auto_602657 ) ) ( not ( = ?auto_602651 ?auto_602658 ) ) ( not ( = ?auto_602651 ?auto_602659 ) ) ( not ( = ?auto_602651 ?auto_602660 ) ) ( not ( = ?auto_602652 ?auto_602653 ) ) ( not ( = ?auto_602652 ?auto_602654 ) ) ( not ( = ?auto_602652 ?auto_602655 ) ) ( not ( = ?auto_602652 ?auto_602656 ) ) ( not ( = ?auto_602652 ?auto_602657 ) ) ( not ( = ?auto_602652 ?auto_602658 ) ) ( not ( = ?auto_602652 ?auto_602659 ) ) ( not ( = ?auto_602652 ?auto_602660 ) ) ( not ( = ?auto_602653 ?auto_602654 ) ) ( not ( = ?auto_602653 ?auto_602655 ) ) ( not ( = ?auto_602653 ?auto_602656 ) ) ( not ( = ?auto_602653 ?auto_602657 ) ) ( not ( = ?auto_602653 ?auto_602658 ) ) ( not ( = ?auto_602653 ?auto_602659 ) ) ( not ( = ?auto_602653 ?auto_602660 ) ) ( not ( = ?auto_602654 ?auto_602655 ) ) ( not ( = ?auto_602654 ?auto_602656 ) ) ( not ( = ?auto_602654 ?auto_602657 ) ) ( not ( = ?auto_602654 ?auto_602658 ) ) ( not ( = ?auto_602654 ?auto_602659 ) ) ( not ( = ?auto_602654 ?auto_602660 ) ) ( not ( = ?auto_602655 ?auto_602656 ) ) ( not ( = ?auto_602655 ?auto_602657 ) ) ( not ( = ?auto_602655 ?auto_602658 ) ) ( not ( = ?auto_602655 ?auto_602659 ) ) ( not ( = ?auto_602655 ?auto_602660 ) ) ( not ( = ?auto_602656 ?auto_602657 ) ) ( not ( = ?auto_602656 ?auto_602658 ) ) ( not ( = ?auto_602656 ?auto_602659 ) ) ( not ( = ?auto_602656 ?auto_602660 ) ) ( not ( = ?auto_602657 ?auto_602658 ) ) ( not ( = ?auto_602657 ?auto_602659 ) ) ( not ( = ?auto_602657 ?auto_602660 ) ) ( not ( = ?auto_602658 ?auto_602659 ) ) ( not ( = ?auto_602658 ?auto_602660 ) ) ( not ( = ?auto_602659 ?auto_602660 ) ) ( ON ?auto_602658 ?auto_602659 ) ( ON ?auto_602657 ?auto_602658 ) ( ON ?auto_602656 ?auto_602657 ) ( ON ?auto_602655 ?auto_602656 ) ( ON ?auto_602654 ?auto_602655 ) ( ON ?auto_602653 ?auto_602654 ) ( ON ?auto_602652 ?auto_602653 ) ( CLEAR ?auto_602650 ) ( ON ?auto_602651 ?auto_602652 ) ( CLEAR ?auto_602651 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_602645 ?auto_602646 ?auto_602647 ?auto_602648 ?auto_602649 ?auto_602650 ?auto_602651 )
      ( MAKE-15PILE ?auto_602645 ?auto_602646 ?auto_602647 ?auto_602648 ?auto_602649 ?auto_602650 ?auto_602651 ?auto_602652 ?auto_602653 ?auto_602654 ?auto_602655 ?auto_602656 ?auto_602657 ?auto_602658 ?auto_602659 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_602707 - BLOCK
      ?auto_602708 - BLOCK
      ?auto_602709 - BLOCK
      ?auto_602710 - BLOCK
      ?auto_602711 - BLOCK
      ?auto_602712 - BLOCK
      ?auto_602713 - BLOCK
      ?auto_602714 - BLOCK
      ?auto_602715 - BLOCK
      ?auto_602716 - BLOCK
      ?auto_602717 - BLOCK
      ?auto_602718 - BLOCK
      ?auto_602719 - BLOCK
      ?auto_602720 - BLOCK
      ?auto_602721 - BLOCK
    )
    :vars
    (
      ?auto_602722 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_602721 ?auto_602722 ) ( ON-TABLE ?auto_602707 ) ( ON ?auto_602708 ?auto_602707 ) ( ON ?auto_602709 ?auto_602708 ) ( ON ?auto_602710 ?auto_602709 ) ( ON ?auto_602711 ?auto_602710 ) ( not ( = ?auto_602707 ?auto_602708 ) ) ( not ( = ?auto_602707 ?auto_602709 ) ) ( not ( = ?auto_602707 ?auto_602710 ) ) ( not ( = ?auto_602707 ?auto_602711 ) ) ( not ( = ?auto_602707 ?auto_602712 ) ) ( not ( = ?auto_602707 ?auto_602713 ) ) ( not ( = ?auto_602707 ?auto_602714 ) ) ( not ( = ?auto_602707 ?auto_602715 ) ) ( not ( = ?auto_602707 ?auto_602716 ) ) ( not ( = ?auto_602707 ?auto_602717 ) ) ( not ( = ?auto_602707 ?auto_602718 ) ) ( not ( = ?auto_602707 ?auto_602719 ) ) ( not ( = ?auto_602707 ?auto_602720 ) ) ( not ( = ?auto_602707 ?auto_602721 ) ) ( not ( = ?auto_602707 ?auto_602722 ) ) ( not ( = ?auto_602708 ?auto_602709 ) ) ( not ( = ?auto_602708 ?auto_602710 ) ) ( not ( = ?auto_602708 ?auto_602711 ) ) ( not ( = ?auto_602708 ?auto_602712 ) ) ( not ( = ?auto_602708 ?auto_602713 ) ) ( not ( = ?auto_602708 ?auto_602714 ) ) ( not ( = ?auto_602708 ?auto_602715 ) ) ( not ( = ?auto_602708 ?auto_602716 ) ) ( not ( = ?auto_602708 ?auto_602717 ) ) ( not ( = ?auto_602708 ?auto_602718 ) ) ( not ( = ?auto_602708 ?auto_602719 ) ) ( not ( = ?auto_602708 ?auto_602720 ) ) ( not ( = ?auto_602708 ?auto_602721 ) ) ( not ( = ?auto_602708 ?auto_602722 ) ) ( not ( = ?auto_602709 ?auto_602710 ) ) ( not ( = ?auto_602709 ?auto_602711 ) ) ( not ( = ?auto_602709 ?auto_602712 ) ) ( not ( = ?auto_602709 ?auto_602713 ) ) ( not ( = ?auto_602709 ?auto_602714 ) ) ( not ( = ?auto_602709 ?auto_602715 ) ) ( not ( = ?auto_602709 ?auto_602716 ) ) ( not ( = ?auto_602709 ?auto_602717 ) ) ( not ( = ?auto_602709 ?auto_602718 ) ) ( not ( = ?auto_602709 ?auto_602719 ) ) ( not ( = ?auto_602709 ?auto_602720 ) ) ( not ( = ?auto_602709 ?auto_602721 ) ) ( not ( = ?auto_602709 ?auto_602722 ) ) ( not ( = ?auto_602710 ?auto_602711 ) ) ( not ( = ?auto_602710 ?auto_602712 ) ) ( not ( = ?auto_602710 ?auto_602713 ) ) ( not ( = ?auto_602710 ?auto_602714 ) ) ( not ( = ?auto_602710 ?auto_602715 ) ) ( not ( = ?auto_602710 ?auto_602716 ) ) ( not ( = ?auto_602710 ?auto_602717 ) ) ( not ( = ?auto_602710 ?auto_602718 ) ) ( not ( = ?auto_602710 ?auto_602719 ) ) ( not ( = ?auto_602710 ?auto_602720 ) ) ( not ( = ?auto_602710 ?auto_602721 ) ) ( not ( = ?auto_602710 ?auto_602722 ) ) ( not ( = ?auto_602711 ?auto_602712 ) ) ( not ( = ?auto_602711 ?auto_602713 ) ) ( not ( = ?auto_602711 ?auto_602714 ) ) ( not ( = ?auto_602711 ?auto_602715 ) ) ( not ( = ?auto_602711 ?auto_602716 ) ) ( not ( = ?auto_602711 ?auto_602717 ) ) ( not ( = ?auto_602711 ?auto_602718 ) ) ( not ( = ?auto_602711 ?auto_602719 ) ) ( not ( = ?auto_602711 ?auto_602720 ) ) ( not ( = ?auto_602711 ?auto_602721 ) ) ( not ( = ?auto_602711 ?auto_602722 ) ) ( not ( = ?auto_602712 ?auto_602713 ) ) ( not ( = ?auto_602712 ?auto_602714 ) ) ( not ( = ?auto_602712 ?auto_602715 ) ) ( not ( = ?auto_602712 ?auto_602716 ) ) ( not ( = ?auto_602712 ?auto_602717 ) ) ( not ( = ?auto_602712 ?auto_602718 ) ) ( not ( = ?auto_602712 ?auto_602719 ) ) ( not ( = ?auto_602712 ?auto_602720 ) ) ( not ( = ?auto_602712 ?auto_602721 ) ) ( not ( = ?auto_602712 ?auto_602722 ) ) ( not ( = ?auto_602713 ?auto_602714 ) ) ( not ( = ?auto_602713 ?auto_602715 ) ) ( not ( = ?auto_602713 ?auto_602716 ) ) ( not ( = ?auto_602713 ?auto_602717 ) ) ( not ( = ?auto_602713 ?auto_602718 ) ) ( not ( = ?auto_602713 ?auto_602719 ) ) ( not ( = ?auto_602713 ?auto_602720 ) ) ( not ( = ?auto_602713 ?auto_602721 ) ) ( not ( = ?auto_602713 ?auto_602722 ) ) ( not ( = ?auto_602714 ?auto_602715 ) ) ( not ( = ?auto_602714 ?auto_602716 ) ) ( not ( = ?auto_602714 ?auto_602717 ) ) ( not ( = ?auto_602714 ?auto_602718 ) ) ( not ( = ?auto_602714 ?auto_602719 ) ) ( not ( = ?auto_602714 ?auto_602720 ) ) ( not ( = ?auto_602714 ?auto_602721 ) ) ( not ( = ?auto_602714 ?auto_602722 ) ) ( not ( = ?auto_602715 ?auto_602716 ) ) ( not ( = ?auto_602715 ?auto_602717 ) ) ( not ( = ?auto_602715 ?auto_602718 ) ) ( not ( = ?auto_602715 ?auto_602719 ) ) ( not ( = ?auto_602715 ?auto_602720 ) ) ( not ( = ?auto_602715 ?auto_602721 ) ) ( not ( = ?auto_602715 ?auto_602722 ) ) ( not ( = ?auto_602716 ?auto_602717 ) ) ( not ( = ?auto_602716 ?auto_602718 ) ) ( not ( = ?auto_602716 ?auto_602719 ) ) ( not ( = ?auto_602716 ?auto_602720 ) ) ( not ( = ?auto_602716 ?auto_602721 ) ) ( not ( = ?auto_602716 ?auto_602722 ) ) ( not ( = ?auto_602717 ?auto_602718 ) ) ( not ( = ?auto_602717 ?auto_602719 ) ) ( not ( = ?auto_602717 ?auto_602720 ) ) ( not ( = ?auto_602717 ?auto_602721 ) ) ( not ( = ?auto_602717 ?auto_602722 ) ) ( not ( = ?auto_602718 ?auto_602719 ) ) ( not ( = ?auto_602718 ?auto_602720 ) ) ( not ( = ?auto_602718 ?auto_602721 ) ) ( not ( = ?auto_602718 ?auto_602722 ) ) ( not ( = ?auto_602719 ?auto_602720 ) ) ( not ( = ?auto_602719 ?auto_602721 ) ) ( not ( = ?auto_602719 ?auto_602722 ) ) ( not ( = ?auto_602720 ?auto_602721 ) ) ( not ( = ?auto_602720 ?auto_602722 ) ) ( not ( = ?auto_602721 ?auto_602722 ) ) ( ON ?auto_602720 ?auto_602721 ) ( ON ?auto_602719 ?auto_602720 ) ( ON ?auto_602718 ?auto_602719 ) ( ON ?auto_602717 ?auto_602718 ) ( ON ?auto_602716 ?auto_602717 ) ( ON ?auto_602715 ?auto_602716 ) ( ON ?auto_602714 ?auto_602715 ) ( ON ?auto_602713 ?auto_602714 ) ( CLEAR ?auto_602711 ) ( ON ?auto_602712 ?auto_602713 ) ( CLEAR ?auto_602712 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_602707 ?auto_602708 ?auto_602709 ?auto_602710 ?auto_602711 ?auto_602712 )
      ( MAKE-15PILE ?auto_602707 ?auto_602708 ?auto_602709 ?auto_602710 ?auto_602711 ?auto_602712 ?auto_602713 ?auto_602714 ?auto_602715 ?auto_602716 ?auto_602717 ?auto_602718 ?auto_602719 ?auto_602720 ?auto_602721 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_602769 - BLOCK
      ?auto_602770 - BLOCK
      ?auto_602771 - BLOCK
      ?auto_602772 - BLOCK
      ?auto_602773 - BLOCK
      ?auto_602774 - BLOCK
      ?auto_602775 - BLOCK
      ?auto_602776 - BLOCK
      ?auto_602777 - BLOCK
      ?auto_602778 - BLOCK
      ?auto_602779 - BLOCK
      ?auto_602780 - BLOCK
      ?auto_602781 - BLOCK
      ?auto_602782 - BLOCK
      ?auto_602783 - BLOCK
    )
    :vars
    (
      ?auto_602784 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_602783 ?auto_602784 ) ( ON-TABLE ?auto_602769 ) ( ON ?auto_602770 ?auto_602769 ) ( ON ?auto_602771 ?auto_602770 ) ( ON ?auto_602772 ?auto_602771 ) ( not ( = ?auto_602769 ?auto_602770 ) ) ( not ( = ?auto_602769 ?auto_602771 ) ) ( not ( = ?auto_602769 ?auto_602772 ) ) ( not ( = ?auto_602769 ?auto_602773 ) ) ( not ( = ?auto_602769 ?auto_602774 ) ) ( not ( = ?auto_602769 ?auto_602775 ) ) ( not ( = ?auto_602769 ?auto_602776 ) ) ( not ( = ?auto_602769 ?auto_602777 ) ) ( not ( = ?auto_602769 ?auto_602778 ) ) ( not ( = ?auto_602769 ?auto_602779 ) ) ( not ( = ?auto_602769 ?auto_602780 ) ) ( not ( = ?auto_602769 ?auto_602781 ) ) ( not ( = ?auto_602769 ?auto_602782 ) ) ( not ( = ?auto_602769 ?auto_602783 ) ) ( not ( = ?auto_602769 ?auto_602784 ) ) ( not ( = ?auto_602770 ?auto_602771 ) ) ( not ( = ?auto_602770 ?auto_602772 ) ) ( not ( = ?auto_602770 ?auto_602773 ) ) ( not ( = ?auto_602770 ?auto_602774 ) ) ( not ( = ?auto_602770 ?auto_602775 ) ) ( not ( = ?auto_602770 ?auto_602776 ) ) ( not ( = ?auto_602770 ?auto_602777 ) ) ( not ( = ?auto_602770 ?auto_602778 ) ) ( not ( = ?auto_602770 ?auto_602779 ) ) ( not ( = ?auto_602770 ?auto_602780 ) ) ( not ( = ?auto_602770 ?auto_602781 ) ) ( not ( = ?auto_602770 ?auto_602782 ) ) ( not ( = ?auto_602770 ?auto_602783 ) ) ( not ( = ?auto_602770 ?auto_602784 ) ) ( not ( = ?auto_602771 ?auto_602772 ) ) ( not ( = ?auto_602771 ?auto_602773 ) ) ( not ( = ?auto_602771 ?auto_602774 ) ) ( not ( = ?auto_602771 ?auto_602775 ) ) ( not ( = ?auto_602771 ?auto_602776 ) ) ( not ( = ?auto_602771 ?auto_602777 ) ) ( not ( = ?auto_602771 ?auto_602778 ) ) ( not ( = ?auto_602771 ?auto_602779 ) ) ( not ( = ?auto_602771 ?auto_602780 ) ) ( not ( = ?auto_602771 ?auto_602781 ) ) ( not ( = ?auto_602771 ?auto_602782 ) ) ( not ( = ?auto_602771 ?auto_602783 ) ) ( not ( = ?auto_602771 ?auto_602784 ) ) ( not ( = ?auto_602772 ?auto_602773 ) ) ( not ( = ?auto_602772 ?auto_602774 ) ) ( not ( = ?auto_602772 ?auto_602775 ) ) ( not ( = ?auto_602772 ?auto_602776 ) ) ( not ( = ?auto_602772 ?auto_602777 ) ) ( not ( = ?auto_602772 ?auto_602778 ) ) ( not ( = ?auto_602772 ?auto_602779 ) ) ( not ( = ?auto_602772 ?auto_602780 ) ) ( not ( = ?auto_602772 ?auto_602781 ) ) ( not ( = ?auto_602772 ?auto_602782 ) ) ( not ( = ?auto_602772 ?auto_602783 ) ) ( not ( = ?auto_602772 ?auto_602784 ) ) ( not ( = ?auto_602773 ?auto_602774 ) ) ( not ( = ?auto_602773 ?auto_602775 ) ) ( not ( = ?auto_602773 ?auto_602776 ) ) ( not ( = ?auto_602773 ?auto_602777 ) ) ( not ( = ?auto_602773 ?auto_602778 ) ) ( not ( = ?auto_602773 ?auto_602779 ) ) ( not ( = ?auto_602773 ?auto_602780 ) ) ( not ( = ?auto_602773 ?auto_602781 ) ) ( not ( = ?auto_602773 ?auto_602782 ) ) ( not ( = ?auto_602773 ?auto_602783 ) ) ( not ( = ?auto_602773 ?auto_602784 ) ) ( not ( = ?auto_602774 ?auto_602775 ) ) ( not ( = ?auto_602774 ?auto_602776 ) ) ( not ( = ?auto_602774 ?auto_602777 ) ) ( not ( = ?auto_602774 ?auto_602778 ) ) ( not ( = ?auto_602774 ?auto_602779 ) ) ( not ( = ?auto_602774 ?auto_602780 ) ) ( not ( = ?auto_602774 ?auto_602781 ) ) ( not ( = ?auto_602774 ?auto_602782 ) ) ( not ( = ?auto_602774 ?auto_602783 ) ) ( not ( = ?auto_602774 ?auto_602784 ) ) ( not ( = ?auto_602775 ?auto_602776 ) ) ( not ( = ?auto_602775 ?auto_602777 ) ) ( not ( = ?auto_602775 ?auto_602778 ) ) ( not ( = ?auto_602775 ?auto_602779 ) ) ( not ( = ?auto_602775 ?auto_602780 ) ) ( not ( = ?auto_602775 ?auto_602781 ) ) ( not ( = ?auto_602775 ?auto_602782 ) ) ( not ( = ?auto_602775 ?auto_602783 ) ) ( not ( = ?auto_602775 ?auto_602784 ) ) ( not ( = ?auto_602776 ?auto_602777 ) ) ( not ( = ?auto_602776 ?auto_602778 ) ) ( not ( = ?auto_602776 ?auto_602779 ) ) ( not ( = ?auto_602776 ?auto_602780 ) ) ( not ( = ?auto_602776 ?auto_602781 ) ) ( not ( = ?auto_602776 ?auto_602782 ) ) ( not ( = ?auto_602776 ?auto_602783 ) ) ( not ( = ?auto_602776 ?auto_602784 ) ) ( not ( = ?auto_602777 ?auto_602778 ) ) ( not ( = ?auto_602777 ?auto_602779 ) ) ( not ( = ?auto_602777 ?auto_602780 ) ) ( not ( = ?auto_602777 ?auto_602781 ) ) ( not ( = ?auto_602777 ?auto_602782 ) ) ( not ( = ?auto_602777 ?auto_602783 ) ) ( not ( = ?auto_602777 ?auto_602784 ) ) ( not ( = ?auto_602778 ?auto_602779 ) ) ( not ( = ?auto_602778 ?auto_602780 ) ) ( not ( = ?auto_602778 ?auto_602781 ) ) ( not ( = ?auto_602778 ?auto_602782 ) ) ( not ( = ?auto_602778 ?auto_602783 ) ) ( not ( = ?auto_602778 ?auto_602784 ) ) ( not ( = ?auto_602779 ?auto_602780 ) ) ( not ( = ?auto_602779 ?auto_602781 ) ) ( not ( = ?auto_602779 ?auto_602782 ) ) ( not ( = ?auto_602779 ?auto_602783 ) ) ( not ( = ?auto_602779 ?auto_602784 ) ) ( not ( = ?auto_602780 ?auto_602781 ) ) ( not ( = ?auto_602780 ?auto_602782 ) ) ( not ( = ?auto_602780 ?auto_602783 ) ) ( not ( = ?auto_602780 ?auto_602784 ) ) ( not ( = ?auto_602781 ?auto_602782 ) ) ( not ( = ?auto_602781 ?auto_602783 ) ) ( not ( = ?auto_602781 ?auto_602784 ) ) ( not ( = ?auto_602782 ?auto_602783 ) ) ( not ( = ?auto_602782 ?auto_602784 ) ) ( not ( = ?auto_602783 ?auto_602784 ) ) ( ON ?auto_602782 ?auto_602783 ) ( ON ?auto_602781 ?auto_602782 ) ( ON ?auto_602780 ?auto_602781 ) ( ON ?auto_602779 ?auto_602780 ) ( ON ?auto_602778 ?auto_602779 ) ( ON ?auto_602777 ?auto_602778 ) ( ON ?auto_602776 ?auto_602777 ) ( ON ?auto_602775 ?auto_602776 ) ( ON ?auto_602774 ?auto_602775 ) ( CLEAR ?auto_602772 ) ( ON ?auto_602773 ?auto_602774 ) ( CLEAR ?auto_602773 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_602769 ?auto_602770 ?auto_602771 ?auto_602772 ?auto_602773 )
      ( MAKE-15PILE ?auto_602769 ?auto_602770 ?auto_602771 ?auto_602772 ?auto_602773 ?auto_602774 ?auto_602775 ?auto_602776 ?auto_602777 ?auto_602778 ?auto_602779 ?auto_602780 ?auto_602781 ?auto_602782 ?auto_602783 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_602831 - BLOCK
      ?auto_602832 - BLOCK
      ?auto_602833 - BLOCK
      ?auto_602834 - BLOCK
      ?auto_602835 - BLOCK
      ?auto_602836 - BLOCK
      ?auto_602837 - BLOCK
      ?auto_602838 - BLOCK
      ?auto_602839 - BLOCK
      ?auto_602840 - BLOCK
      ?auto_602841 - BLOCK
      ?auto_602842 - BLOCK
      ?auto_602843 - BLOCK
      ?auto_602844 - BLOCK
      ?auto_602845 - BLOCK
    )
    :vars
    (
      ?auto_602846 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_602845 ?auto_602846 ) ( ON-TABLE ?auto_602831 ) ( ON ?auto_602832 ?auto_602831 ) ( ON ?auto_602833 ?auto_602832 ) ( not ( = ?auto_602831 ?auto_602832 ) ) ( not ( = ?auto_602831 ?auto_602833 ) ) ( not ( = ?auto_602831 ?auto_602834 ) ) ( not ( = ?auto_602831 ?auto_602835 ) ) ( not ( = ?auto_602831 ?auto_602836 ) ) ( not ( = ?auto_602831 ?auto_602837 ) ) ( not ( = ?auto_602831 ?auto_602838 ) ) ( not ( = ?auto_602831 ?auto_602839 ) ) ( not ( = ?auto_602831 ?auto_602840 ) ) ( not ( = ?auto_602831 ?auto_602841 ) ) ( not ( = ?auto_602831 ?auto_602842 ) ) ( not ( = ?auto_602831 ?auto_602843 ) ) ( not ( = ?auto_602831 ?auto_602844 ) ) ( not ( = ?auto_602831 ?auto_602845 ) ) ( not ( = ?auto_602831 ?auto_602846 ) ) ( not ( = ?auto_602832 ?auto_602833 ) ) ( not ( = ?auto_602832 ?auto_602834 ) ) ( not ( = ?auto_602832 ?auto_602835 ) ) ( not ( = ?auto_602832 ?auto_602836 ) ) ( not ( = ?auto_602832 ?auto_602837 ) ) ( not ( = ?auto_602832 ?auto_602838 ) ) ( not ( = ?auto_602832 ?auto_602839 ) ) ( not ( = ?auto_602832 ?auto_602840 ) ) ( not ( = ?auto_602832 ?auto_602841 ) ) ( not ( = ?auto_602832 ?auto_602842 ) ) ( not ( = ?auto_602832 ?auto_602843 ) ) ( not ( = ?auto_602832 ?auto_602844 ) ) ( not ( = ?auto_602832 ?auto_602845 ) ) ( not ( = ?auto_602832 ?auto_602846 ) ) ( not ( = ?auto_602833 ?auto_602834 ) ) ( not ( = ?auto_602833 ?auto_602835 ) ) ( not ( = ?auto_602833 ?auto_602836 ) ) ( not ( = ?auto_602833 ?auto_602837 ) ) ( not ( = ?auto_602833 ?auto_602838 ) ) ( not ( = ?auto_602833 ?auto_602839 ) ) ( not ( = ?auto_602833 ?auto_602840 ) ) ( not ( = ?auto_602833 ?auto_602841 ) ) ( not ( = ?auto_602833 ?auto_602842 ) ) ( not ( = ?auto_602833 ?auto_602843 ) ) ( not ( = ?auto_602833 ?auto_602844 ) ) ( not ( = ?auto_602833 ?auto_602845 ) ) ( not ( = ?auto_602833 ?auto_602846 ) ) ( not ( = ?auto_602834 ?auto_602835 ) ) ( not ( = ?auto_602834 ?auto_602836 ) ) ( not ( = ?auto_602834 ?auto_602837 ) ) ( not ( = ?auto_602834 ?auto_602838 ) ) ( not ( = ?auto_602834 ?auto_602839 ) ) ( not ( = ?auto_602834 ?auto_602840 ) ) ( not ( = ?auto_602834 ?auto_602841 ) ) ( not ( = ?auto_602834 ?auto_602842 ) ) ( not ( = ?auto_602834 ?auto_602843 ) ) ( not ( = ?auto_602834 ?auto_602844 ) ) ( not ( = ?auto_602834 ?auto_602845 ) ) ( not ( = ?auto_602834 ?auto_602846 ) ) ( not ( = ?auto_602835 ?auto_602836 ) ) ( not ( = ?auto_602835 ?auto_602837 ) ) ( not ( = ?auto_602835 ?auto_602838 ) ) ( not ( = ?auto_602835 ?auto_602839 ) ) ( not ( = ?auto_602835 ?auto_602840 ) ) ( not ( = ?auto_602835 ?auto_602841 ) ) ( not ( = ?auto_602835 ?auto_602842 ) ) ( not ( = ?auto_602835 ?auto_602843 ) ) ( not ( = ?auto_602835 ?auto_602844 ) ) ( not ( = ?auto_602835 ?auto_602845 ) ) ( not ( = ?auto_602835 ?auto_602846 ) ) ( not ( = ?auto_602836 ?auto_602837 ) ) ( not ( = ?auto_602836 ?auto_602838 ) ) ( not ( = ?auto_602836 ?auto_602839 ) ) ( not ( = ?auto_602836 ?auto_602840 ) ) ( not ( = ?auto_602836 ?auto_602841 ) ) ( not ( = ?auto_602836 ?auto_602842 ) ) ( not ( = ?auto_602836 ?auto_602843 ) ) ( not ( = ?auto_602836 ?auto_602844 ) ) ( not ( = ?auto_602836 ?auto_602845 ) ) ( not ( = ?auto_602836 ?auto_602846 ) ) ( not ( = ?auto_602837 ?auto_602838 ) ) ( not ( = ?auto_602837 ?auto_602839 ) ) ( not ( = ?auto_602837 ?auto_602840 ) ) ( not ( = ?auto_602837 ?auto_602841 ) ) ( not ( = ?auto_602837 ?auto_602842 ) ) ( not ( = ?auto_602837 ?auto_602843 ) ) ( not ( = ?auto_602837 ?auto_602844 ) ) ( not ( = ?auto_602837 ?auto_602845 ) ) ( not ( = ?auto_602837 ?auto_602846 ) ) ( not ( = ?auto_602838 ?auto_602839 ) ) ( not ( = ?auto_602838 ?auto_602840 ) ) ( not ( = ?auto_602838 ?auto_602841 ) ) ( not ( = ?auto_602838 ?auto_602842 ) ) ( not ( = ?auto_602838 ?auto_602843 ) ) ( not ( = ?auto_602838 ?auto_602844 ) ) ( not ( = ?auto_602838 ?auto_602845 ) ) ( not ( = ?auto_602838 ?auto_602846 ) ) ( not ( = ?auto_602839 ?auto_602840 ) ) ( not ( = ?auto_602839 ?auto_602841 ) ) ( not ( = ?auto_602839 ?auto_602842 ) ) ( not ( = ?auto_602839 ?auto_602843 ) ) ( not ( = ?auto_602839 ?auto_602844 ) ) ( not ( = ?auto_602839 ?auto_602845 ) ) ( not ( = ?auto_602839 ?auto_602846 ) ) ( not ( = ?auto_602840 ?auto_602841 ) ) ( not ( = ?auto_602840 ?auto_602842 ) ) ( not ( = ?auto_602840 ?auto_602843 ) ) ( not ( = ?auto_602840 ?auto_602844 ) ) ( not ( = ?auto_602840 ?auto_602845 ) ) ( not ( = ?auto_602840 ?auto_602846 ) ) ( not ( = ?auto_602841 ?auto_602842 ) ) ( not ( = ?auto_602841 ?auto_602843 ) ) ( not ( = ?auto_602841 ?auto_602844 ) ) ( not ( = ?auto_602841 ?auto_602845 ) ) ( not ( = ?auto_602841 ?auto_602846 ) ) ( not ( = ?auto_602842 ?auto_602843 ) ) ( not ( = ?auto_602842 ?auto_602844 ) ) ( not ( = ?auto_602842 ?auto_602845 ) ) ( not ( = ?auto_602842 ?auto_602846 ) ) ( not ( = ?auto_602843 ?auto_602844 ) ) ( not ( = ?auto_602843 ?auto_602845 ) ) ( not ( = ?auto_602843 ?auto_602846 ) ) ( not ( = ?auto_602844 ?auto_602845 ) ) ( not ( = ?auto_602844 ?auto_602846 ) ) ( not ( = ?auto_602845 ?auto_602846 ) ) ( ON ?auto_602844 ?auto_602845 ) ( ON ?auto_602843 ?auto_602844 ) ( ON ?auto_602842 ?auto_602843 ) ( ON ?auto_602841 ?auto_602842 ) ( ON ?auto_602840 ?auto_602841 ) ( ON ?auto_602839 ?auto_602840 ) ( ON ?auto_602838 ?auto_602839 ) ( ON ?auto_602837 ?auto_602838 ) ( ON ?auto_602836 ?auto_602837 ) ( ON ?auto_602835 ?auto_602836 ) ( CLEAR ?auto_602833 ) ( ON ?auto_602834 ?auto_602835 ) ( CLEAR ?auto_602834 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_602831 ?auto_602832 ?auto_602833 ?auto_602834 )
      ( MAKE-15PILE ?auto_602831 ?auto_602832 ?auto_602833 ?auto_602834 ?auto_602835 ?auto_602836 ?auto_602837 ?auto_602838 ?auto_602839 ?auto_602840 ?auto_602841 ?auto_602842 ?auto_602843 ?auto_602844 ?auto_602845 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_602893 - BLOCK
      ?auto_602894 - BLOCK
      ?auto_602895 - BLOCK
      ?auto_602896 - BLOCK
      ?auto_602897 - BLOCK
      ?auto_602898 - BLOCK
      ?auto_602899 - BLOCK
      ?auto_602900 - BLOCK
      ?auto_602901 - BLOCK
      ?auto_602902 - BLOCK
      ?auto_602903 - BLOCK
      ?auto_602904 - BLOCK
      ?auto_602905 - BLOCK
      ?auto_602906 - BLOCK
      ?auto_602907 - BLOCK
    )
    :vars
    (
      ?auto_602908 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_602907 ?auto_602908 ) ( ON-TABLE ?auto_602893 ) ( ON ?auto_602894 ?auto_602893 ) ( not ( = ?auto_602893 ?auto_602894 ) ) ( not ( = ?auto_602893 ?auto_602895 ) ) ( not ( = ?auto_602893 ?auto_602896 ) ) ( not ( = ?auto_602893 ?auto_602897 ) ) ( not ( = ?auto_602893 ?auto_602898 ) ) ( not ( = ?auto_602893 ?auto_602899 ) ) ( not ( = ?auto_602893 ?auto_602900 ) ) ( not ( = ?auto_602893 ?auto_602901 ) ) ( not ( = ?auto_602893 ?auto_602902 ) ) ( not ( = ?auto_602893 ?auto_602903 ) ) ( not ( = ?auto_602893 ?auto_602904 ) ) ( not ( = ?auto_602893 ?auto_602905 ) ) ( not ( = ?auto_602893 ?auto_602906 ) ) ( not ( = ?auto_602893 ?auto_602907 ) ) ( not ( = ?auto_602893 ?auto_602908 ) ) ( not ( = ?auto_602894 ?auto_602895 ) ) ( not ( = ?auto_602894 ?auto_602896 ) ) ( not ( = ?auto_602894 ?auto_602897 ) ) ( not ( = ?auto_602894 ?auto_602898 ) ) ( not ( = ?auto_602894 ?auto_602899 ) ) ( not ( = ?auto_602894 ?auto_602900 ) ) ( not ( = ?auto_602894 ?auto_602901 ) ) ( not ( = ?auto_602894 ?auto_602902 ) ) ( not ( = ?auto_602894 ?auto_602903 ) ) ( not ( = ?auto_602894 ?auto_602904 ) ) ( not ( = ?auto_602894 ?auto_602905 ) ) ( not ( = ?auto_602894 ?auto_602906 ) ) ( not ( = ?auto_602894 ?auto_602907 ) ) ( not ( = ?auto_602894 ?auto_602908 ) ) ( not ( = ?auto_602895 ?auto_602896 ) ) ( not ( = ?auto_602895 ?auto_602897 ) ) ( not ( = ?auto_602895 ?auto_602898 ) ) ( not ( = ?auto_602895 ?auto_602899 ) ) ( not ( = ?auto_602895 ?auto_602900 ) ) ( not ( = ?auto_602895 ?auto_602901 ) ) ( not ( = ?auto_602895 ?auto_602902 ) ) ( not ( = ?auto_602895 ?auto_602903 ) ) ( not ( = ?auto_602895 ?auto_602904 ) ) ( not ( = ?auto_602895 ?auto_602905 ) ) ( not ( = ?auto_602895 ?auto_602906 ) ) ( not ( = ?auto_602895 ?auto_602907 ) ) ( not ( = ?auto_602895 ?auto_602908 ) ) ( not ( = ?auto_602896 ?auto_602897 ) ) ( not ( = ?auto_602896 ?auto_602898 ) ) ( not ( = ?auto_602896 ?auto_602899 ) ) ( not ( = ?auto_602896 ?auto_602900 ) ) ( not ( = ?auto_602896 ?auto_602901 ) ) ( not ( = ?auto_602896 ?auto_602902 ) ) ( not ( = ?auto_602896 ?auto_602903 ) ) ( not ( = ?auto_602896 ?auto_602904 ) ) ( not ( = ?auto_602896 ?auto_602905 ) ) ( not ( = ?auto_602896 ?auto_602906 ) ) ( not ( = ?auto_602896 ?auto_602907 ) ) ( not ( = ?auto_602896 ?auto_602908 ) ) ( not ( = ?auto_602897 ?auto_602898 ) ) ( not ( = ?auto_602897 ?auto_602899 ) ) ( not ( = ?auto_602897 ?auto_602900 ) ) ( not ( = ?auto_602897 ?auto_602901 ) ) ( not ( = ?auto_602897 ?auto_602902 ) ) ( not ( = ?auto_602897 ?auto_602903 ) ) ( not ( = ?auto_602897 ?auto_602904 ) ) ( not ( = ?auto_602897 ?auto_602905 ) ) ( not ( = ?auto_602897 ?auto_602906 ) ) ( not ( = ?auto_602897 ?auto_602907 ) ) ( not ( = ?auto_602897 ?auto_602908 ) ) ( not ( = ?auto_602898 ?auto_602899 ) ) ( not ( = ?auto_602898 ?auto_602900 ) ) ( not ( = ?auto_602898 ?auto_602901 ) ) ( not ( = ?auto_602898 ?auto_602902 ) ) ( not ( = ?auto_602898 ?auto_602903 ) ) ( not ( = ?auto_602898 ?auto_602904 ) ) ( not ( = ?auto_602898 ?auto_602905 ) ) ( not ( = ?auto_602898 ?auto_602906 ) ) ( not ( = ?auto_602898 ?auto_602907 ) ) ( not ( = ?auto_602898 ?auto_602908 ) ) ( not ( = ?auto_602899 ?auto_602900 ) ) ( not ( = ?auto_602899 ?auto_602901 ) ) ( not ( = ?auto_602899 ?auto_602902 ) ) ( not ( = ?auto_602899 ?auto_602903 ) ) ( not ( = ?auto_602899 ?auto_602904 ) ) ( not ( = ?auto_602899 ?auto_602905 ) ) ( not ( = ?auto_602899 ?auto_602906 ) ) ( not ( = ?auto_602899 ?auto_602907 ) ) ( not ( = ?auto_602899 ?auto_602908 ) ) ( not ( = ?auto_602900 ?auto_602901 ) ) ( not ( = ?auto_602900 ?auto_602902 ) ) ( not ( = ?auto_602900 ?auto_602903 ) ) ( not ( = ?auto_602900 ?auto_602904 ) ) ( not ( = ?auto_602900 ?auto_602905 ) ) ( not ( = ?auto_602900 ?auto_602906 ) ) ( not ( = ?auto_602900 ?auto_602907 ) ) ( not ( = ?auto_602900 ?auto_602908 ) ) ( not ( = ?auto_602901 ?auto_602902 ) ) ( not ( = ?auto_602901 ?auto_602903 ) ) ( not ( = ?auto_602901 ?auto_602904 ) ) ( not ( = ?auto_602901 ?auto_602905 ) ) ( not ( = ?auto_602901 ?auto_602906 ) ) ( not ( = ?auto_602901 ?auto_602907 ) ) ( not ( = ?auto_602901 ?auto_602908 ) ) ( not ( = ?auto_602902 ?auto_602903 ) ) ( not ( = ?auto_602902 ?auto_602904 ) ) ( not ( = ?auto_602902 ?auto_602905 ) ) ( not ( = ?auto_602902 ?auto_602906 ) ) ( not ( = ?auto_602902 ?auto_602907 ) ) ( not ( = ?auto_602902 ?auto_602908 ) ) ( not ( = ?auto_602903 ?auto_602904 ) ) ( not ( = ?auto_602903 ?auto_602905 ) ) ( not ( = ?auto_602903 ?auto_602906 ) ) ( not ( = ?auto_602903 ?auto_602907 ) ) ( not ( = ?auto_602903 ?auto_602908 ) ) ( not ( = ?auto_602904 ?auto_602905 ) ) ( not ( = ?auto_602904 ?auto_602906 ) ) ( not ( = ?auto_602904 ?auto_602907 ) ) ( not ( = ?auto_602904 ?auto_602908 ) ) ( not ( = ?auto_602905 ?auto_602906 ) ) ( not ( = ?auto_602905 ?auto_602907 ) ) ( not ( = ?auto_602905 ?auto_602908 ) ) ( not ( = ?auto_602906 ?auto_602907 ) ) ( not ( = ?auto_602906 ?auto_602908 ) ) ( not ( = ?auto_602907 ?auto_602908 ) ) ( ON ?auto_602906 ?auto_602907 ) ( ON ?auto_602905 ?auto_602906 ) ( ON ?auto_602904 ?auto_602905 ) ( ON ?auto_602903 ?auto_602904 ) ( ON ?auto_602902 ?auto_602903 ) ( ON ?auto_602901 ?auto_602902 ) ( ON ?auto_602900 ?auto_602901 ) ( ON ?auto_602899 ?auto_602900 ) ( ON ?auto_602898 ?auto_602899 ) ( ON ?auto_602897 ?auto_602898 ) ( ON ?auto_602896 ?auto_602897 ) ( CLEAR ?auto_602894 ) ( ON ?auto_602895 ?auto_602896 ) ( CLEAR ?auto_602895 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_602893 ?auto_602894 ?auto_602895 )
      ( MAKE-15PILE ?auto_602893 ?auto_602894 ?auto_602895 ?auto_602896 ?auto_602897 ?auto_602898 ?auto_602899 ?auto_602900 ?auto_602901 ?auto_602902 ?auto_602903 ?auto_602904 ?auto_602905 ?auto_602906 ?auto_602907 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_602955 - BLOCK
      ?auto_602956 - BLOCK
      ?auto_602957 - BLOCK
      ?auto_602958 - BLOCK
      ?auto_602959 - BLOCK
      ?auto_602960 - BLOCK
      ?auto_602961 - BLOCK
      ?auto_602962 - BLOCK
      ?auto_602963 - BLOCK
      ?auto_602964 - BLOCK
      ?auto_602965 - BLOCK
      ?auto_602966 - BLOCK
      ?auto_602967 - BLOCK
      ?auto_602968 - BLOCK
      ?auto_602969 - BLOCK
    )
    :vars
    (
      ?auto_602970 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_602969 ?auto_602970 ) ( ON-TABLE ?auto_602955 ) ( not ( = ?auto_602955 ?auto_602956 ) ) ( not ( = ?auto_602955 ?auto_602957 ) ) ( not ( = ?auto_602955 ?auto_602958 ) ) ( not ( = ?auto_602955 ?auto_602959 ) ) ( not ( = ?auto_602955 ?auto_602960 ) ) ( not ( = ?auto_602955 ?auto_602961 ) ) ( not ( = ?auto_602955 ?auto_602962 ) ) ( not ( = ?auto_602955 ?auto_602963 ) ) ( not ( = ?auto_602955 ?auto_602964 ) ) ( not ( = ?auto_602955 ?auto_602965 ) ) ( not ( = ?auto_602955 ?auto_602966 ) ) ( not ( = ?auto_602955 ?auto_602967 ) ) ( not ( = ?auto_602955 ?auto_602968 ) ) ( not ( = ?auto_602955 ?auto_602969 ) ) ( not ( = ?auto_602955 ?auto_602970 ) ) ( not ( = ?auto_602956 ?auto_602957 ) ) ( not ( = ?auto_602956 ?auto_602958 ) ) ( not ( = ?auto_602956 ?auto_602959 ) ) ( not ( = ?auto_602956 ?auto_602960 ) ) ( not ( = ?auto_602956 ?auto_602961 ) ) ( not ( = ?auto_602956 ?auto_602962 ) ) ( not ( = ?auto_602956 ?auto_602963 ) ) ( not ( = ?auto_602956 ?auto_602964 ) ) ( not ( = ?auto_602956 ?auto_602965 ) ) ( not ( = ?auto_602956 ?auto_602966 ) ) ( not ( = ?auto_602956 ?auto_602967 ) ) ( not ( = ?auto_602956 ?auto_602968 ) ) ( not ( = ?auto_602956 ?auto_602969 ) ) ( not ( = ?auto_602956 ?auto_602970 ) ) ( not ( = ?auto_602957 ?auto_602958 ) ) ( not ( = ?auto_602957 ?auto_602959 ) ) ( not ( = ?auto_602957 ?auto_602960 ) ) ( not ( = ?auto_602957 ?auto_602961 ) ) ( not ( = ?auto_602957 ?auto_602962 ) ) ( not ( = ?auto_602957 ?auto_602963 ) ) ( not ( = ?auto_602957 ?auto_602964 ) ) ( not ( = ?auto_602957 ?auto_602965 ) ) ( not ( = ?auto_602957 ?auto_602966 ) ) ( not ( = ?auto_602957 ?auto_602967 ) ) ( not ( = ?auto_602957 ?auto_602968 ) ) ( not ( = ?auto_602957 ?auto_602969 ) ) ( not ( = ?auto_602957 ?auto_602970 ) ) ( not ( = ?auto_602958 ?auto_602959 ) ) ( not ( = ?auto_602958 ?auto_602960 ) ) ( not ( = ?auto_602958 ?auto_602961 ) ) ( not ( = ?auto_602958 ?auto_602962 ) ) ( not ( = ?auto_602958 ?auto_602963 ) ) ( not ( = ?auto_602958 ?auto_602964 ) ) ( not ( = ?auto_602958 ?auto_602965 ) ) ( not ( = ?auto_602958 ?auto_602966 ) ) ( not ( = ?auto_602958 ?auto_602967 ) ) ( not ( = ?auto_602958 ?auto_602968 ) ) ( not ( = ?auto_602958 ?auto_602969 ) ) ( not ( = ?auto_602958 ?auto_602970 ) ) ( not ( = ?auto_602959 ?auto_602960 ) ) ( not ( = ?auto_602959 ?auto_602961 ) ) ( not ( = ?auto_602959 ?auto_602962 ) ) ( not ( = ?auto_602959 ?auto_602963 ) ) ( not ( = ?auto_602959 ?auto_602964 ) ) ( not ( = ?auto_602959 ?auto_602965 ) ) ( not ( = ?auto_602959 ?auto_602966 ) ) ( not ( = ?auto_602959 ?auto_602967 ) ) ( not ( = ?auto_602959 ?auto_602968 ) ) ( not ( = ?auto_602959 ?auto_602969 ) ) ( not ( = ?auto_602959 ?auto_602970 ) ) ( not ( = ?auto_602960 ?auto_602961 ) ) ( not ( = ?auto_602960 ?auto_602962 ) ) ( not ( = ?auto_602960 ?auto_602963 ) ) ( not ( = ?auto_602960 ?auto_602964 ) ) ( not ( = ?auto_602960 ?auto_602965 ) ) ( not ( = ?auto_602960 ?auto_602966 ) ) ( not ( = ?auto_602960 ?auto_602967 ) ) ( not ( = ?auto_602960 ?auto_602968 ) ) ( not ( = ?auto_602960 ?auto_602969 ) ) ( not ( = ?auto_602960 ?auto_602970 ) ) ( not ( = ?auto_602961 ?auto_602962 ) ) ( not ( = ?auto_602961 ?auto_602963 ) ) ( not ( = ?auto_602961 ?auto_602964 ) ) ( not ( = ?auto_602961 ?auto_602965 ) ) ( not ( = ?auto_602961 ?auto_602966 ) ) ( not ( = ?auto_602961 ?auto_602967 ) ) ( not ( = ?auto_602961 ?auto_602968 ) ) ( not ( = ?auto_602961 ?auto_602969 ) ) ( not ( = ?auto_602961 ?auto_602970 ) ) ( not ( = ?auto_602962 ?auto_602963 ) ) ( not ( = ?auto_602962 ?auto_602964 ) ) ( not ( = ?auto_602962 ?auto_602965 ) ) ( not ( = ?auto_602962 ?auto_602966 ) ) ( not ( = ?auto_602962 ?auto_602967 ) ) ( not ( = ?auto_602962 ?auto_602968 ) ) ( not ( = ?auto_602962 ?auto_602969 ) ) ( not ( = ?auto_602962 ?auto_602970 ) ) ( not ( = ?auto_602963 ?auto_602964 ) ) ( not ( = ?auto_602963 ?auto_602965 ) ) ( not ( = ?auto_602963 ?auto_602966 ) ) ( not ( = ?auto_602963 ?auto_602967 ) ) ( not ( = ?auto_602963 ?auto_602968 ) ) ( not ( = ?auto_602963 ?auto_602969 ) ) ( not ( = ?auto_602963 ?auto_602970 ) ) ( not ( = ?auto_602964 ?auto_602965 ) ) ( not ( = ?auto_602964 ?auto_602966 ) ) ( not ( = ?auto_602964 ?auto_602967 ) ) ( not ( = ?auto_602964 ?auto_602968 ) ) ( not ( = ?auto_602964 ?auto_602969 ) ) ( not ( = ?auto_602964 ?auto_602970 ) ) ( not ( = ?auto_602965 ?auto_602966 ) ) ( not ( = ?auto_602965 ?auto_602967 ) ) ( not ( = ?auto_602965 ?auto_602968 ) ) ( not ( = ?auto_602965 ?auto_602969 ) ) ( not ( = ?auto_602965 ?auto_602970 ) ) ( not ( = ?auto_602966 ?auto_602967 ) ) ( not ( = ?auto_602966 ?auto_602968 ) ) ( not ( = ?auto_602966 ?auto_602969 ) ) ( not ( = ?auto_602966 ?auto_602970 ) ) ( not ( = ?auto_602967 ?auto_602968 ) ) ( not ( = ?auto_602967 ?auto_602969 ) ) ( not ( = ?auto_602967 ?auto_602970 ) ) ( not ( = ?auto_602968 ?auto_602969 ) ) ( not ( = ?auto_602968 ?auto_602970 ) ) ( not ( = ?auto_602969 ?auto_602970 ) ) ( ON ?auto_602968 ?auto_602969 ) ( ON ?auto_602967 ?auto_602968 ) ( ON ?auto_602966 ?auto_602967 ) ( ON ?auto_602965 ?auto_602966 ) ( ON ?auto_602964 ?auto_602965 ) ( ON ?auto_602963 ?auto_602964 ) ( ON ?auto_602962 ?auto_602963 ) ( ON ?auto_602961 ?auto_602962 ) ( ON ?auto_602960 ?auto_602961 ) ( ON ?auto_602959 ?auto_602960 ) ( ON ?auto_602958 ?auto_602959 ) ( ON ?auto_602957 ?auto_602958 ) ( CLEAR ?auto_602955 ) ( ON ?auto_602956 ?auto_602957 ) ( CLEAR ?auto_602956 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_602955 ?auto_602956 )
      ( MAKE-15PILE ?auto_602955 ?auto_602956 ?auto_602957 ?auto_602958 ?auto_602959 ?auto_602960 ?auto_602961 ?auto_602962 ?auto_602963 ?auto_602964 ?auto_602965 ?auto_602966 ?auto_602967 ?auto_602968 ?auto_602969 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_603017 - BLOCK
      ?auto_603018 - BLOCK
      ?auto_603019 - BLOCK
      ?auto_603020 - BLOCK
      ?auto_603021 - BLOCK
      ?auto_603022 - BLOCK
      ?auto_603023 - BLOCK
      ?auto_603024 - BLOCK
      ?auto_603025 - BLOCK
      ?auto_603026 - BLOCK
      ?auto_603027 - BLOCK
      ?auto_603028 - BLOCK
      ?auto_603029 - BLOCK
      ?auto_603030 - BLOCK
      ?auto_603031 - BLOCK
    )
    :vars
    (
      ?auto_603032 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_603031 ?auto_603032 ) ( not ( = ?auto_603017 ?auto_603018 ) ) ( not ( = ?auto_603017 ?auto_603019 ) ) ( not ( = ?auto_603017 ?auto_603020 ) ) ( not ( = ?auto_603017 ?auto_603021 ) ) ( not ( = ?auto_603017 ?auto_603022 ) ) ( not ( = ?auto_603017 ?auto_603023 ) ) ( not ( = ?auto_603017 ?auto_603024 ) ) ( not ( = ?auto_603017 ?auto_603025 ) ) ( not ( = ?auto_603017 ?auto_603026 ) ) ( not ( = ?auto_603017 ?auto_603027 ) ) ( not ( = ?auto_603017 ?auto_603028 ) ) ( not ( = ?auto_603017 ?auto_603029 ) ) ( not ( = ?auto_603017 ?auto_603030 ) ) ( not ( = ?auto_603017 ?auto_603031 ) ) ( not ( = ?auto_603017 ?auto_603032 ) ) ( not ( = ?auto_603018 ?auto_603019 ) ) ( not ( = ?auto_603018 ?auto_603020 ) ) ( not ( = ?auto_603018 ?auto_603021 ) ) ( not ( = ?auto_603018 ?auto_603022 ) ) ( not ( = ?auto_603018 ?auto_603023 ) ) ( not ( = ?auto_603018 ?auto_603024 ) ) ( not ( = ?auto_603018 ?auto_603025 ) ) ( not ( = ?auto_603018 ?auto_603026 ) ) ( not ( = ?auto_603018 ?auto_603027 ) ) ( not ( = ?auto_603018 ?auto_603028 ) ) ( not ( = ?auto_603018 ?auto_603029 ) ) ( not ( = ?auto_603018 ?auto_603030 ) ) ( not ( = ?auto_603018 ?auto_603031 ) ) ( not ( = ?auto_603018 ?auto_603032 ) ) ( not ( = ?auto_603019 ?auto_603020 ) ) ( not ( = ?auto_603019 ?auto_603021 ) ) ( not ( = ?auto_603019 ?auto_603022 ) ) ( not ( = ?auto_603019 ?auto_603023 ) ) ( not ( = ?auto_603019 ?auto_603024 ) ) ( not ( = ?auto_603019 ?auto_603025 ) ) ( not ( = ?auto_603019 ?auto_603026 ) ) ( not ( = ?auto_603019 ?auto_603027 ) ) ( not ( = ?auto_603019 ?auto_603028 ) ) ( not ( = ?auto_603019 ?auto_603029 ) ) ( not ( = ?auto_603019 ?auto_603030 ) ) ( not ( = ?auto_603019 ?auto_603031 ) ) ( not ( = ?auto_603019 ?auto_603032 ) ) ( not ( = ?auto_603020 ?auto_603021 ) ) ( not ( = ?auto_603020 ?auto_603022 ) ) ( not ( = ?auto_603020 ?auto_603023 ) ) ( not ( = ?auto_603020 ?auto_603024 ) ) ( not ( = ?auto_603020 ?auto_603025 ) ) ( not ( = ?auto_603020 ?auto_603026 ) ) ( not ( = ?auto_603020 ?auto_603027 ) ) ( not ( = ?auto_603020 ?auto_603028 ) ) ( not ( = ?auto_603020 ?auto_603029 ) ) ( not ( = ?auto_603020 ?auto_603030 ) ) ( not ( = ?auto_603020 ?auto_603031 ) ) ( not ( = ?auto_603020 ?auto_603032 ) ) ( not ( = ?auto_603021 ?auto_603022 ) ) ( not ( = ?auto_603021 ?auto_603023 ) ) ( not ( = ?auto_603021 ?auto_603024 ) ) ( not ( = ?auto_603021 ?auto_603025 ) ) ( not ( = ?auto_603021 ?auto_603026 ) ) ( not ( = ?auto_603021 ?auto_603027 ) ) ( not ( = ?auto_603021 ?auto_603028 ) ) ( not ( = ?auto_603021 ?auto_603029 ) ) ( not ( = ?auto_603021 ?auto_603030 ) ) ( not ( = ?auto_603021 ?auto_603031 ) ) ( not ( = ?auto_603021 ?auto_603032 ) ) ( not ( = ?auto_603022 ?auto_603023 ) ) ( not ( = ?auto_603022 ?auto_603024 ) ) ( not ( = ?auto_603022 ?auto_603025 ) ) ( not ( = ?auto_603022 ?auto_603026 ) ) ( not ( = ?auto_603022 ?auto_603027 ) ) ( not ( = ?auto_603022 ?auto_603028 ) ) ( not ( = ?auto_603022 ?auto_603029 ) ) ( not ( = ?auto_603022 ?auto_603030 ) ) ( not ( = ?auto_603022 ?auto_603031 ) ) ( not ( = ?auto_603022 ?auto_603032 ) ) ( not ( = ?auto_603023 ?auto_603024 ) ) ( not ( = ?auto_603023 ?auto_603025 ) ) ( not ( = ?auto_603023 ?auto_603026 ) ) ( not ( = ?auto_603023 ?auto_603027 ) ) ( not ( = ?auto_603023 ?auto_603028 ) ) ( not ( = ?auto_603023 ?auto_603029 ) ) ( not ( = ?auto_603023 ?auto_603030 ) ) ( not ( = ?auto_603023 ?auto_603031 ) ) ( not ( = ?auto_603023 ?auto_603032 ) ) ( not ( = ?auto_603024 ?auto_603025 ) ) ( not ( = ?auto_603024 ?auto_603026 ) ) ( not ( = ?auto_603024 ?auto_603027 ) ) ( not ( = ?auto_603024 ?auto_603028 ) ) ( not ( = ?auto_603024 ?auto_603029 ) ) ( not ( = ?auto_603024 ?auto_603030 ) ) ( not ( = ?auto_603024 ?auto_603031 ) ) ( not ( = ?auto_603024 ?auto_603032 ) ) ( not ( = ?auto_603025 ?auto_603026 ) ) ( not ( = ?auto_603025 ?auto_603027 ) ) ( not ( = ?auto_603025 ?auto_603028 ) ) ( not ( = ?auto_603025 ?auto_603029 ) ) ( not ( = ?auto_603025 ?auto_603030 ) ) ( not ( = ?auto_603025 ?auto_603031 ) ) ( not ( = ?auto_603025 ?auto_603032 ) ) ( not ( = ?auto_603026 ?auto_603027 ) ) ( not ( = ?auto_603026 ?auto_603028 ) ) ( not ( = ?auto_603026 ?auto_603029 ) ) ( not ( = ?auto_603026 ?auto_603030 ) ) ( not ( = ?auto_603026 ?auto_603031 ) ) ( not ( = ?auto_603026 ?auto_603032 ) ) ( not ( = ?auto_603027 ?auto_603028 ) ) ( not ( = ?auto_603027 ?auto_603029 ) ) ( not ( = ?auto_603027 ?auto_603030 ) ) ( not ( = ?auto_603027 ?auto_603031 ) ) ( not ( = ?auto_603027 ?auto_603032 ) ) ( not ( = ?auto_603028 ?auto_603029 ) ) ( not ( = ?auto_603028 ?auto_603030 ) ) ( not ( = ?auto_603028 ?auto_603031 ) ) ( not ( = ?auto_603028 ?auto_603032 ) ) ( not ( = ?auto_603029 ?auto_603030 ) ) ( not ( = ?auto_603029 ?auto_603031 ) ) ( not ( = ?auto_603029 ?auto_603032 ) ) ( not ( = ?auto_603030 ?auto_603031 ) ) ( not ( = ?auto_603030 ?auto_603032 ) ) ( not ( = ?auto_603031 ?auto_603032 ) ) ( ON ?auto_603030 ?auto_603031 ) ( ON ?auto_603029 ?auto_603030 ) ( ON ?auto_603028 ?auto_603029 ) ( ON ?auto_603027 ?auto_603028 ) ( ON ?auto_603026 ?auto_603027 ) ( ON ?auto_603025 ?auto_603026 ) ( ON ?auto_603024 ?auto_603025 ) ( ON ?auto_603023 ?auto_603024 ) ( ON ?auto_603022 ?auto_603023 ) ( ON ?auto_603021 ?auto_603022 ) ( ON ?auto_603020 ?auto_603021 ) ( ON ?auto_603019 ?auto_603020 ) ( ON ?auto_603018 ?auto_603019 ) ( ON ?auto_603017 ?auto_603018 ) ( CLEAR ?auto_603017 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_603017 )
      ( MAKE-15PILE ?auto_603017 ?auto_603018 ?auto_603019 ?auto_603020 ?auto_603021 ?auto_603022 ?auto_603023 ?auto_603024 ?auto_603025 ?auto_603026 ?auto_603027 ?auto_603028 ?auto_603029 ?auto_603030 ?auto_603031 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_603080 - BLOCK
      ?auto_603081 - BLOCK
      ?auto_603082 - BLOCK
      ?auto_603083 - BLOCK
      ?auto_603084 - BLOCK
      ?auto_603085 - BLOCK
      ?auto_603086 - BLOCK
      ?auto_603087 - BLOCK
      ?auto_603088 - BLOCK
      ?auto_603089 - BLOCK
      ?auto_603090 - BLOCK
      ?auto_603091 - BLOCK
      ?auto_603092 - BLOCK
      ?auto_603093 - BLOCK
      ?auto_603094 - BLOCK
      ?auto_603095 - BLOCK
    )
    :vars
    (
      ?auto_603096 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_603094 ) ( ON ?auto_603095 ?auto_603096 ) ( CLEAR ?auto_603095 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_603080 ) ( ON ?auto_603081 ?auto_603080 ) ( ON ?auto_603082 ?auto_603081 ) ( ON ?auto_603083 ?auto_603082 ) ( ON ?auto_603084 ?auto_603083 ) ( ON ?auto_603085 ?auto_603084 ) ( ON ?auto_603086 ?auto_603085 ) ( ON ?auto_603087 ?auto_603086 ) ( ON ?auto_603088 ?auto_603087 ) ( ON ?auto_603089 ?auto_603088 ) ( ON ?auto_603090 ?auto_603089 ) ( ON ?auto_603091 ?auto_603090 ) ( ON ?auto_603092 ?auto_603091 ) ( ON ?auto_603093 ?auto_603092 ) ( ON ?auto_603094 ?auto_603093 ) ( not ( = ?auto_603080 ?auto_603081 ) ) ( not ( = ?auto_603080 ?auto_603082 ) ) ( not ( = ?auto_603080 ?auto_603083 ) ) ( not ( = ?auto_603080 ?auto_603084 ) ) ( not ( = ?auto_603080 ?auto_603085 ) ) ( not ( = ?auto_603080 ?auto_603086 ) ) ( not ( = ?auto_603080 ?auto_603087 ) ) ( not ( = ?auto_603080 ?auto_603088 ) ) ( not ( = ?auto_603080 ?auto_603089 ) ) ( not ( = ?auto_603080 ?auto_603090 ) ) ( not ( = ?auto_603080 ?auto_603091 ) ) ( not ( = ?auto_603080 ?auto_603092 ) ) ( not ( = ?auto_603080 ?auto_603093 ) ) ( not ( = ?auto_603080 ?auto_603094 ) ) ( not ( = ?auto_603080 ?auto_603095 ) ) ( not ( = ?auto_603080 ?auto_603096 ) ) ( not ( = ?auto_603081 ?auto_603082 ) ) ( not ( = ?auto_603081 ?auto_603083 ) ) ( not ( = ?auto_603081 ?auto_603084 ) ) ( not ( = ?auto_603081 ?auto_603085 ) ) ( not ( = ?auto_603081 ?auto_603086 ) ) ( not ( = ?auto_603081 ?auto_603087 ) ) ( not ( = ?auto_603081 ?auto_603088 ) ) ( not ( = ?auto_603081 ?auto_603089 ) ) ( not ( = ?auto_603081 ?auto_603090 ) ) ( not ( = ?auto_603081 ?auto_603091 ) ) ( not ( = ?auto_603081 ?auto_603092 ) ) ( not ( = ?auto_603081 ?auto_603093 ) ) ( not ( = ?auto_603081 ?auto_603094 ) ) ( not ( = ?auto_603081 ?auto_603095 ) ) ( not ( = ?auto_603081 ?auto_603096 ) ) ( not ( = ?auto_603082 ?auto_603083 ) ) ( not ( = ?auto_603082 ?auto_603084 ) ) ( not ( = ?auto_603082 ?auto_603085 ) ) ( not ( = ?auto_603082 ?auto_603086 ) ) ( not ( = ?auto_603082 ?auto_603087 ) ) ( not ( = ?auto_603082 ?auto_603088 ) ) ( not ( = ?auto_603082 ?auto_603089 ) ) ( not ( = ?auto_603082 ?auto_603090 ) ) ( not ( = ?auto_603082 ?auto_603091 ) ) ( not ( = ?auto_603082 ?auto_603092 ) ) ( not ( = ?auto_603082 ?auto_603093 ) ) ( not ( = ?auto_603082 ?auto_603094 ) ) ( not ( = ?auto_603082 ?auto_603095 ) ) ( not ( = ?auto_603082 ?auto_603096 ) ) ( not ( = ?auto_603083 ?auto_603084 ) ) ( not ( = ?auto_603083 ?auto_603085 ) ) ( not ( = ?auto_603083 ?auto_603086 ) ) ( not ( = ?auto_603083 ?auto_603087 ) ) ( not ( = ?auto_603083 ?auto_603088 ) ) ( not ( = ?auto_603083 ?auto_603089 ) ) ( not ( = ?auto_603083 ?auto_603090 ) ) ( not ( = ?auto_603083 ?auto_603091 ) ) ( not ( = ?auto_603083 ?auto_603092 ) ) ( not ( = ?auto_603083 ?auto_603093 ) ) ( not ( = ?auto_603083 ?auto_603094 ) ) ( not ( = ?auto_603083 ?auto_603095 ) ) ( not ( = ?auto_603083 ?auto_603096 ) ) ( not ( = ?auto_603084 ?auto_603085 ) ) ( not ( = ?auto_603084 ?auto_603086 ) ) ( not ( = ?auto_603084 ?auto_603087 ) ) ( not ( = ?auto_603084 ?auto_603088 ) ) ( not ( = ?auto_603084 ?auto_603089 ) ) ( not ( = ?auto_603084 ?auto_603090 ) ) ( not ( = ?auto_603084 ?auto_603091 ) ) ( not ( = ?auto_603084 ?auto_603092 ) ) ( not ( = ?auto_603084 ?auto_603093 ) ) ( not ( = ?auto_603084 ?auto_603094 ) ) ( not ( = ?auto_603084 ?auto_603095 ) ) ( not ( = ?auto_603084 ?auto_603096 ) ) ( not ( = ?auto_603085 ?auto_603086 ) ) ( not ( = ?auto_603085 ?auto_603087 ) ) ( not ( = ?auto_603085 ?auto_603088 ) ) ( not ( = ?auto_603085 ?auto_603089 ) ) ( not ( = ?auto_603085 ?auto_603090 ) ) ( not ( = ?auto_603085 ?auto_603091 ) ) ( not ( = ?auto_603085 ?auto_603092 ) ) ( not ( = ?auto_603085 ?auto_603093 ) ) ( not ( = ?auto_603085 ?auto_603094 ) ) ( not ( = ?auto_603085 ?auto_603095 ) ) ( not ( = ?auto_603085 ?auto_603096 ) ) ( not ( = ?auto_603086 ?auto_603087 ) ) ( not ( = ?auto_603086 ?auto_603088 ) ) ( not ( = ?auto_603086 ?auto_603089 ) ) ( not ( = ?auto_603086 ?auto_603090 ) ) ( not ( = ?auto_603086 ?auto_603091 ) ) ( not ( = ?auto_603086 ?auto_603092 ) ) ( not ( = ?auto_603086 ?auto_603093 ) ) ( not ( = ?auto_603086 ?auto_603094 ) ) ( not ( = ?auto_603086 ?auto_603095 ) ) ( not ( = ?auto_603086 ?auto_603096 ) ) ( not ( = ?auto_603087 ?auto_603088 ) ) ( not ( = ?auto_603087 ?auto_603089 ) ) ( not ( = ?auto_603087 ?auto_603090 ) ) ( not ( = ?auto_603087 ?auto_603091 ) ) ( not ( = ?auto_603087 ?auto_603092 ) ) ( not ( = ?auto_603087 ?auto_603093 ) ) ( not ( = ?auto_603087 ?auto_603094 ) ) ( not ( = ?auto_603087 ?auto_603095 ) ) ( not ( = ?auto_603087 ?auto_603096 ) ) ( not ( = ?auto_603088 ?auto_603089 ) ) ( not ( = ?auto_603088 ?auto_603090 ) ) ( not ( = ?auto_603088 ?auto_603091 ) ) ( not ( = ?auto_603088 ?auto_603092 ) ) ( not ( = ?auto_603088 ?auto_603093 ) ) ( not ( = ?auto_603088 ?auto_603094 ) ) ( not ( = ?auto_603088 ?auto_603095 ) ) ( not ( = ?auto_603088 ?auto_603096 ) ) ( not ( = ?auto_603089 ?auto_603090 ) ) ( not ( = ?auto_603089 ?auto_603091 ) ) ( not ( = ?auto_603089 ?auto_603092 ) ) ( not ( = ?auto_603089 ?auto_603093 ) ) ( not ( = ?auto_603089 ?auto_603094 ) ) ( not ( = ?auto_603089 ?auto_603095 ) ) ( not ( = ?auto_603089 ?auto_603096 ) ) ( not ( = ?auto_603090 ?auto_603091 ) ) ( not ( = ?auto_603090 ?auto_603092 ) ) ( not ( = ?auto_603090 ?auto_603093 ) ) ( not ( = ?auto_603090 ?auto_603094 ) ) ( not ( = ?auto_603090 ?auto_603095 ) ) ( not ( = ?auto_603090 ?auto_603096 ) ) ( not ( = ?auto_603091 ?auto_603092 ) ) ( not ( = ?auto_603091 ?auto_603093 ) ) ( not ( = ?auto_603091 ?auto_603094 ) ) ( not ( = ?auto_603091 ?auto_603095 ) ) ( not ( = ?auto_603091 ?auto_603096 ) ) ( not ( = ?auto_603092 ?auto_603093 ) ) ( not ( = ?auto_603092 ?auto_603094 ) ) ( not ( = ?auto_603092 ?auto_603095 ) ) ( not ( = ?auto_603092 ?auto_603096 ) ) ( not ( = ?auto_603093 ?auto_603094 ) ) ( not ( = ?auto_603093 ?auto_603095 ) ) ( not ( = ?auto_603093 ?auto_603096 ) ) ( not ( = ?auto_603094 ?auto_603095 ) ) ( not ( = ?auto_603094 ?auto_603096 ) ) ( not ( = ?auto_603095 ?auto_603096 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_603095 ?auto_603096 )
      ( !STACK ?auto_603095 ?auto_603094 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_603146 - BLOCK
      ?auto_603147 - BLOCK
      ?auto_603148 - BLOCK
      ?auto_603149 - BLOCK
      ?auto_603150 - BLOCK
      ?auto_603151 - BLOCK
      ?auto_603152 - BLOCK
      ?auto_603153 - BLOCK
      ?auto_603154 - BLOCK
      ?auto_603155 - BLOCK
      ?auto_603156 - BLOCK
      ?auto_603157 - BLOCK
      ?auto_603158 - BLOCK
      ?auto_603159 - BLOCK
      ?auto_603160 - BLOCK
      ?auto_603161 - BLOCK
    )
    :vars
    (
      ?auto_603162 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_603161 ?auto_603162 ) ( ON-TABLE ?auto_603146 ) ( ON ?auto_603147 ?auto_603146 ) ( ON ?auto_603148 ?auto_603147 ) ( ON ?auto_603149 ?auto_603148 ) ( ON ?auto_603150 ?auto_603149 ) ( ON ?auto_603151 ?auto_603150 ) ( ON ?auto_603152 ?auto_603151 ) ( ON ?auto_603153 ?auto_603152 ) ( ON ?auto_603154 ?auto_603153 ) ( ON ?auto_603155 ?auto_603154 ) ( ON ?auto_603156 ?auto_603155 ) ( ON ?auto_603157 ?auto_603156 ) ( ON ?auto_603158 ?auto_603157 ) ( ON ?auto_603159 ?auto_603158 ) ( not ( = ?auto_603146 ?auto_603147 ) ) ( not ( = ?auto_603146 ?auto_603148 ) ) ( not ( = ?auto_603146 ?auto_603149 ) ) ( not ( = ?auto_603146 ?auto_603150 ) ) ( not ( = ?auto_603146 ?auto_603151 ) ) ( not ( = ?auto_603146 ?auto_603152 ) ) ( not ( = ?auto_603146 ?auto_603153 ) ) ( not ( = ?auto_603146 ?auto_603154 ) ) ( not ( = ?auto_603146 ?auto_603155 ) ) ( not ( = ?auto_603146 ?auto_603156 ) ) ( not ( = ?auto_603146 ?auto_603157 ) ) ( not ( = ?auto_603146 ?auto_603158 ) ) ( not ( = ?auto_603146 ?auto_603159 ) ) ( not ( = ?auto_603146 ?auto_603160 ) ) ( not ( = ?auto_603146 ?auto_603161 ) ) ( not ( = ?auto_603146 ?auto_603162 ) ) ( not ( = ?auto_603147 ?auto_603148 ) ) ( not ( = ?auto_603147 ?auto_603149 ) ) ( not ( = ?auto_603147 ?auto_603150 ) ) ( not ( = ?auto_603147 ?auto_603151 ) ) ( not ( = ?auto_603147 ?auto_603152 ) ) ( not ( = ?auto_603147 ?auto_603153 ) ) ( not ( = ?auto_603147 ?auto_603154 ) ) ( not ( = ?auto_603147 ?auto_603155 ) ) ( not ( = ?auto_603147 ?auto_603156 ) ) ( not ( = ?auto_603147 ?auto_603157 ) ) ( not ( = ?auto_603147 ?auto_603158 ) ) ( not ( = ?auto_603147 ?auto_603159 ) ) ( not ( = ?auto_603147 ?auto_603160 ) ) ( not ( = ?auto_603147 ?auto_603161 ) ) ( not ( = ?auto_603147 ?auto_603162 ) ) ( not ( = ?auto_603148 ?auto_603149 ) ) ( not ( = ?auto_603148 ?auto_603150 ) ) ( not ( = ?auto_603148 ?auto_603151 ) ) ( not ( = ?auto_603148 ?auto_603152 ) ) ( not ( = ?auto_603148 ?auto_603153 ) ) ( not ( = ?auto_603148 ?auto_603154 ) ) ( not ( = ?auto_603148 ?auto_603155 ) ) ( not ( = ?auto_603148 ?auto_603156 ) ) ( not ( = ?auto_603148 ?auto_603157 ) ) ( not ( = ?auto_603148 ?auto_603158 ) ) ( not ( = ?auto_603148 ?auto_603159 ) ) ( not ( = ?auto_603148 ?auto_603160 ) ) ( not ( = ?auto_603148 ?auto_603161 ) ) ( not ( = ?auto_603148 ?auto_603162 ) ) ( not ( = ?auto_603149 ?auto_603150 ) ) ( not ( = ?auto_603149 ?auto_603151 ) ) ( not ( = ?auto_603149 ?auto_603152 ) ) ( not ( = ?auto_603149 ?auto_603153 ) ) ( not ( = ?auto_603149 ?auto_603154 ) ) ( not ( = ?auto_603149 ?auto_603155 ) ) ( not ( = ?auto_603149 ?auto_603156 ) ) ( not ( = ?auto_603149 ?auto_603157 ) ) ( not ( = ?auto_603149 ?auto_603158 ) ) ( not ( = ?auto_603149 ?auto_603159 ) ) ( not ( = ?auto_603149 ?auto_603160 ) ) ( not ( = ?auto_603149 ?auto_603161 ) ) ( not ( = ?auto_603149 ?auto_603162 ) ) ( not ( = ?auto_603150 ?auto_603151 ) ) ( not ( = ?auto_603150 ?auto_603152 ) ) ( not ( = ?auto_603150 ?auto_603153 ) ) ( not ( = ?auto_603150 ?auto_603154 ) ) ( not ( = ?auto_603150 ?auto_603155 ) ) ( not ( = ?auto_603150 ?auto_603156 ) ) ( not ( = ?auto_603150 ?auto_603157 ) ) ( not ( = ?auto_603150 ?auto_603158 ) ) ( not ( = ?auto_603150 ?auto_603159 ) ) ( not ( = ?auto_603150 ?auto_603160 ) ) ( not ( = ?auto_603150 ?auto_603161 ) ) ( not ( = ?auto_603150 ?auto_603162 ) ) ( not ( = ?auto_603151 ?auto_603152 ) ) ( not ( = ?auto_603151 ?auto_603153 ) ) ( not ( = ?auto_603151 ?auto_603154 ) ) ( not ( = ?auto_603151 ?auto_603155 ) ) ( not ( = ?auto_603151 ?auto_603156 ) ) ( not ( = ?auto_603151 ?auto_603157 ) ) ( not ( = ?auto_603151 ?auto_603158 ) ) ( not ( = ?auto_603151 ?auto_603159 ) ) ( not ( = ?auto_603151 ?auto_603160 ) ) ( not ( = ?auto_603151 ?auto_603161 ) ) ( not ( = ?auto_603151 ?auto_603162 ) ) ( not ( = ?auto_603152 ?auto_603153 ) ) ( not ( = ?auto_603152 ?auto_603154 ) ) ( not ( = ?auto_603152 ?auto_603155 ) ) ( not ( = ?auto_603152 ?auto_603156 ) ) ( not ( = ?auto_603152 ?auto_603157 ) ) ( not ( = ?auto_603152 ?auto_603158 ) ) ( not ( = ?auto_603152 ?auto_603159 ) ) ( not ( = ?auto_603152 ?auto_603160 ) ) ( not ( = ?auto_603152 ?auto_603161 ) ) ( not ( = ?auto_603152 ?auto_603162 ) ) ( not ( = ?auto_603153 ?auto_603154 ) ) ( not ( = ?auto_603153 ?auto_603155 ) ) ( not ( = ?auto_603153 ?auto_603156 ) ) ( not ( = ?auto_603153 ?auto_603157 ) ) ( not ( = ?auto_603153 ?auto_603158 ) ) ( not ( = ?auto_603153 ?auto_603159 ) ) ( not ( = ?auto_603153 ?auto_603160 ) ) ( not ( = ?auto_603153 ?auto_603161 ) ) ( not ( = ?auto_603153 ?auto_603162 ) ) ( not ( = ?auto_603154 ?auto_603155 ) ) ( not ( = ?auto_603154 ?auto_603156 ) ) ( not ( = ?auto_603154 ?auto_603157 ) ) ( not ( = ?auto_603154 ?auto_603158 ) ) ( not ( = ?auto_603154 ?auto_603159 ) ) ( not ( = ?auto_603154 ?auto_603160 ) ) ( not ( = ?auto_603154 ?auto_603161 ) ) ( not ( = ?auto_603154 ?auto_603162 ) ) ( not ( = ?auto_603155 ?auto_603156 ) ) ( not ( = ?auto_603155 ?auto_603157 ) ) ( not ( = ?auto_603155 ?auto_603158 ) ) ( not ( = ?auto_603155 ?auto_603159 ) ) ( not ( = ?auto_603155 ?auto_603160 ) ) ( not ( = ?auto_603155 ?auto_603161 ) ) ( not ( = ?auto_603155 ?auto_603162 ) ) ( not ( = ?auto_603156 ?auto_603157 ) ) ( not ( = ?auto_603156 ?auto_603158 ) ) ( not ( = ?auto_603156 ?auto_603159 ) ) ( not ( = ?auto_603156 ?auto_603160 ) ) ( not ( = ?auto_603156 ?auto_603161 ) ) ( not ( = ?auto_603156 ?auto_603162 ) ) ( not ( = ?auto_603157 ?auto_603158 ) ) ( not ( = ?auto_603157 ?auto_603159 ) ) ( not ( = ?auto_603157 ?auto_603160 ) ) ( not ( = ?auto_603157 ?auto_603161 ) ) ( not ( = ?auto_603157 ?auto_603162 ) ) ( not ( = ?auto_603158 ?auto_603159 ) ) ( not ( = ?auto_603158 ?auto_603160 ) ) ( not ( = ?auto_603158 ?auto_603161 ) ) ( not ( = ?auto_603158 ?auto_603162 ) ) ( not ( = ?auto_603159 ?auto_603160 ) ) ( not ( = ?auto_603159 ?auto_603161 ) ) ( not ( = ?auto_603159 ?auto_603162 ) ) ( not ( = ?auto_603160 ?auto_603161 ) ) ( not ( = ?auto_603160 ?auto_603162 ) ) ( not ( = ?auto_603161 ?auto_603162 ) ) ( CLEAR ?auto_603159 ) ( ON ?auto_603160 ?auto_603161 ) ( CLEAR ?auto_603160 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_603146 ?auto_603147 ?auto_603148 ?auto_603149 ?auto_603150 ?auto_603151 ?auto_603152 ?auto_603153 ?auto_603154 ?auto_603155 ?auto_603156 ?auto_603157 ?auto_603158 ?auto_603159 ?auto_603160 )
      ( MAKE-16PILE ?auto_603146 ?auto_603147 ?auto_603148 ?auto_603149 ?auto_603150 ?auto_603151 ?auto_603152 ?auto_603153 ?auto_603154 ?auto_603155 ?auto_603156 ?auto_603157 ?auto_603158 ?auto_603159 ?auto_603160 ?auto_603161 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_603212 - BLOCK
      ?auto_603213 - BLOCK
      ?auto_603214 - BLOCK
      ?auto_603215 - BLOCK
      ?auto_603216 - BLOCK
      ?auto_603217 - BLOCK
      ?auto_603218 - BLOCK
      ?auto_603219 - BLOCK
      ?auto_603220 - BLOCK
      ?auto_603221 - BLOCK
      ?auto_603222 - BLOCK
      ?auto_603223 - BLOCK
      ?auto_603224 - BLOCK
      ?auto_603225 - BLOCK
      ?auto_603226 - BLOCK
      ?auto_603227 - BLOCK
    )
    :vars
    (
      ?auto_603228 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_603227 ?auto_603228 ) ( ON-TABLE ?auto_603212 ) ( ON ?auto_603213 ?auto_603212 ) ( ON ?auto_603214 ?auto_603213 ) ( ON ?auto_603215 ?auto_603214 ) ( ON ?auto_603216 ?auto_603215 ) ( ON ?auto_603217 ?auto_603216 ) ( ON ?auto_603218 ?auto_603217 ) ( ON ?auto_603219 ?auto_603218 ) ( ON ?auto_603220 ?auto_603219 ) ( ON ?auto_603221 ?auto_603220 ) ( ON ?auto_603222 ?auto_603221 ) ( ON ?auto_603223 ?auto_603222 ) ( ON ?auto_603224 ?auto_603223 ) ( not ( = ?auto_603212 ?auto_603213 ) ) ( not ( = ?auto_603212 ?auto_603214 ) ) ( not ( = ?auto_603212 ?auto_603215 ) ) ( not ( = ?auto_603212 ?auto_603216 ) ) ( not ( = ?auto_603212 ?auto_603217 ) ) ( not ( = ?auto_603212 ?auto_603218 ) ) ( not ( = ?auto_603212 ?auto_603219 ) ) ( not ( = ?auto_603212 ?auto_603220 ) ) ( not ( = ?auto_603212 ?auto_603221 ) ) ( not ( = ?auto_603212 ?auto_603222 ) ) ( not ( = ?auto_603212 ?auto_603223 ) ) ( not ( = ?auto_603212 ?auto_603224 ) ) ( not ( = ?auto_603212 ?auto_603225 ) ) ( not ( = ?auto_603212 ?auto_603226 ) ) ( not ( = ?auto_603212 ?auto_603227 ) ) ( not ( = ?auto_603212 ?auto_603228 ) ) ( not ( = ?auto_603213 ?auto_603214 ) ) ( not ( = ?auto_603213 ?auto_603215 ) ) ( not ( = ?auto_603213 ?auto_603216 ) ) ( not ( = ?auto_603213 ?auto_603217 ) ) ( not ( = ?auto_603213 ?auto_603218 ) ) ( not ( = ?auto_603213 ?auto_603219 ) ) ( not ( = ?auto_603213 ?auto_603220 ) ) ( not ( = ?auto_603213 ?auto_603221 ) ) ( not ( = ?auto_603213 ?auto_603222 ) ) ( not ( = ?auto_603213 ?auto_603223 ) ) ( not ( = ?auto_603213 ?auto_603224 ) ) ( not ( = ?auto_603213 ?auto_603225 ) ) ( not ( = ?auto_603213 ?auto_603226 ) ) ( not ( = ?auto_603213 ?auto_603227 ) ) ( not ( = ?auto_603213 ?auto_603228 ) ) ( not ( = ?auto_603214 ?auto_603215 ) ) ( not ( = ?auto_603214 ?auto_603216 ) ) ( not ( = ?auto_603214 ?auto_603217 ) ) ( not ( = ?auto_603214 ?auto_603218 ) ) ( not ( = ?auto_603214 ?auto_603219 ) ) ( not ( = ?auto_603214 ?auto_603220 ) ) ( not ( = ?auto_603214 ?auto_603221 ) ) ( not ( = ?auto_603214 ?auto_603222 ) ) ( not ( = ?auto_603214 ?auto_603223 ) ) ( not ( = ?auto_603214 ?auto_603224 ) ) ( not ( = ?auto_603214 ?auto_603225 ) ) ( not ( = ?auto_603214 ?auto_603226 ) ) ( not ( = ?auto_603214 ?auto_603227 ) ) ( not ( = ?auto_603214 ?auto_603228 ) ) ( not ( = ?auto_603215 ?auto_603216 ) ) ( not ( = ?auto_603215 ?auto_603217 ) ) ( not ( = ?auto_603215 ?auto_603218 ) ) ( not ( = ?auto_603215 ?auto_603219 ) ) ( not ( = ?auto_603215 ?auto_603220 ) ) ( not ( = ?auto_603215 ?auto_603221 ) ) ( not ( = ?auto_603215 ?auto_603222 ) ) ( not ( = ?auto_603215 ?auto_603223 ) ) ( not ( = ?auto_603215 ?auto_603224 ) ) ( not ( = ?auto_603215 ?auto_603225 ) ) ( not ( = ?auto_603215 ?auto_603226 ) ) ( not ( = ?auto_603215 ?auto_603227 ) ) ( not ( = ?auto_603215 ?auto_603228 ) ) ( not ( = ?auto_603216 ?auto_603217 ) ) ( not ( = ?auto_603216 ?auto_603218 ) ) ( not ( = ?auto_603216 ?auto_603219 ) ) ( not ( = ?auto_603216 ?auto_603220 ) ) ( not ( = ?auto_603216 ?auto_603221 ) ) ( not ( = ?auto_603216 ?auto_603222 ) ) ( not ( = ?auto_603216 ?auto_603223 ) ) ( not ( = ?auto_603216 ?auto_603224 ) ) ( not ( = ?auto_603216 ?auto_603225 ) ) ( not ( = ?auto_603216 ?auto_603226 ) ) ( not ( = ?auto_603216 ?auto_603227 ) ) ( not ( = ?auto_603216 ?auto_603228 ) ) ( not ( = ?auto_603217 ?auto_603218 ) ) ( not ( = ?auto_603217 ?auto_603219 ) ) ( not ( = ?auto_603217 ?auto_603220 ) ) ( not ( = ?auto_603217 ?auto_603221 ) ) ( not ( = ?auto_603217 ?auto_603222 ) ) ( not ( = ?auto_603217 ?auto_603223 ) ) ( not ( = ?auto_603217 ?auto_603224 ) ) ( not ( = ?auto_603217 ?auto_603225 ) ) ( not ( = ?auto_603217 ?auto_603226 ) ) ( not ( = ?auto_603217 ?auto_603227 ) ) ( not ( = ?auto_603217 ?auto_603228 ) ) ( not ( = ?auto_603218 ?auto_603219 ) ) ( not ( = ?auto_603218 ?auto_603220 ) ) ( not ( = ?auto_603218 ?auto_603221 ) ) ( not ( = ?auto_603218 ?auto_603222 ) ) ( not ( = ?auto_603218 ?auto_603223 ) ) ( not ( = ?auto_603218 ?auto_603224 ) ) ( not ( = ?auto_603218 ?auto_603225 ) ) ( not ( = ?auto_603218 ?auto_603226 ) ) ( not ( = ?auto_603218 ?auto_603227 ) ) ( not ( = ?auto_603218 ?auto_603228 ) ) ( not ( = ?auto_603219 ?auto_603220 ) ) ( not ( = ?auto_603219 ?auto_603221 ) ) ( not ( = ?auto_603219 ?auto_603222 ) ) ( not ( = ?auto_603219 ?auto_603223 ) ) ( not ( = ?auto_603219 ?auto_603224 ) ) ( not ( = ?auto_603219 ?auto_603225 ) ) ( not ( = ?auto_603219 ?auto_603226 ) ) ( not ( = ?auto_603219 ?auto_603227 ) ) ( not ( = ?auto_603219 ?auto_603228 ) ) ( not ( = ?auto_603220 ?auto_603221 ) ) ( not ( = ?auto_603220 ?auto_603222 ) ) ( not ( = ?auto_603220 ?auto_603223 ) ) ( not ( = ?auto_603220 ?auto_603224 ) ) ( not ( = ?auto_603220 ?auto_603225 ) ) ( not ( = ?auto_603220 ?auto_603226 ) ) ( not ( = ?auto_603220 ?auto_603227 ) ) ( not ( = ?auto_603220 ?auto_603228 ) ) ( not ( = ?auto_603221 ?auto_603222 ) ) ( not ( = ?auto_603221 ?auto_603223 ) ) ( not ( = ?auto_603221 ?auto_603224 ) ) ( not ( = ?auto_603221 ?auto_603225 ) ) ( not ( = ?auto_603221 ?auto_603226 ) ) ( not ( = ?auto_603221 ?auto_603227 ) ) ( not ( = ?auto_603221 ?auto_603228 ) ) ( not ( = ?auto_603222 ?auto_603223 ) ) ( not ( = ?auto_603222 ?auto_603224 ) ) ( not ( = ?auto_603222 ?auto_603225 ) ) ( not ( = ?auto_603222 ?auto_603226 ) ) ( not ( = ?auto_603222 ?auto_603227 ) ) ( not ( = ?auto_603222 ?auto_603228 ) ) ( not ( = ?auto_603223 ?auto_603224 ) ) ( not ( = ?auto_603223 ?auto_603225 ) ) ( not ( = ?auto_603223 ?auto_603226 ) ) ( not ( = ?auto_603223 ?auto_603227 ) ) ( not ( = ?auto_603223 ?auto_603228 ) ) ( not ( = ?auto_603224 ?auto_603225 ) ) ( not ( = ?auto_603224 ?auto_603226 ) ) ( not ( = ?auto_603224 ?auto_603227 ) ) ( not ( = ?auto_603224 ?auto_603228 ) ) ( not ( = ?auto_603225 ?auto_603226 ) ) ( not ( = ?auto_603225 ?auto_603227 ) ) ( not ( = ?auto_603225 ?auto_603228 ) ) ( not ( = ?auto_603226 ?auto_603227 ) ) ( not ( = ?auto_603226 ?auto_603228 ) ) ( not ( = ?auto_603227 ?auto_603228 ) ) ( ON ?auto_603226 ?auto_603227 ) ( CLEAR ?auto_603224 ) ( ON ?auto_603225 ?auto_603226 ) ( CLEAR ?auto_603225 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_603212 ?auto_603213 ?auto_603214 ?auto_603215 ?auto_603216 ?auto_603217 ?auto_603218 ?auto_603219 ?auto_603220 ?auto_603221 ?auto_603222 ?auto_603223 ?auto_603224 ?auto_603225 )
      ( MAKE-16PILE ?auto_603212 ?auto_603213 ?auto_603214 ?auto_603215 ?auto_603216 ?auto_603217 ?auto_603218 ?auto_603219 ?auto_603220 ?auto_603221 ?auto_603222 ?auto_603223 ?auto_603224 ?auto_603225 ?auto_603226 ?auto_603227 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_603278 - BLOCK
      ?auto_603279 - BLOCK
      ?auto_603280 - BLOCK
      ?auto_603281 - BLOCK
      ?auto_603282 - BLOCK
      ?auto_603283 - BLOCK
      ?auto_603284 - BLOCK
      ?auto_603285 - BLOCK
      ?auto_603286 - BLOCK
      ?auto_603287 - BLOCK
      ?auto_603288 - BLOCK
      ?auto_603289 - BLOCK
      ?auto_603290 - BLOCK
      ?auto_603291 - BLOCK
      ?auto_603292 - BLOCK
      ?auto_603293 - BLOCK
    )
    :vars
    (
      ?auto_603294 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_603293 ?auto_603294 ) ( ON-TABLE ?auto_603278 ) ( ON ?auto_603279 ?auto_603278 ) ( ON ?auto_603280 ?auto_603279 ) ( ON ?auto_603281 ?auto_603280 ) ( ON ?auto_603282 ?auto_603281 ) ( ON ?auto_603283 ?auto_603282 ) ( ON ?auto_603284 ?auto_603283 ) ( ON ?auto_603285 ?auto_603284 ) ( ON ?auto_603286 ?auto_603285 ) ( ON ?auto_603287 ?auto_603286 ) ( ON ?auto_603288 ?auto_603287 ) ( ON ?auto_603289 ?auto_603288 ) ( not ( = ?auto_603278 ?auto_603279 ) ) ( not ( = ?auto_603278 ?auto_603280 ) ) ( not ( = ?auto_603278 ?auto_603281 ) ) ( not ( = ?auto_603278 ?auto_603282 ) ) ( not ( = ?auto_603278 ?auto_603283 ) ) ( not ( = ?auto_603278 ?auto_603284 ) ) ( not ( = ?auto_603278 ?auto_603285 ) ) ( not ( = ?auto_603278 ?auto_603286 ) ) ( not ( = ?auto_603278 ?auto_603287 ) ) ( not ( = ?auto_603278 ?auto_603288 ) ) ( not ( = ?auto_603278 ?auto_603289 ) ) ( not ( = ?auto_603278 ?auto_603290 ) ) ( not ( = ?auto_603278 ?auto_603291 ) ) ( not ( = ?auto_603278 ?auto_603292 ) ) ( not ( = ?auto_603278 ?auto_603293 ) ) ( not ( = ?auto_603278 ?auto_603294 ) ) ( not ( = ?auto_603279 ?auto_603280 ) ) ( not ( = ?auto_603279 ?auto_603281 ) ) ( not ( = ?auto_603279 ?auto_603282 ) ) ( not ( = ?auto_603279 ?auto_603283 ) ) ( not ( = ?auto_603279 ?auto_603284 ) ) ( not ( = ?auto_603279 ?auto_603285 ) ) ( not ( = ?auto_603279 ?auto_603286 ) ) ( not ( = ?auto_603279 ?auto_603287 ) ) ( not ( = ?auto_603279 ?auto_603288 ) ) ( not ( = ?auto_603279 ?auto_603289 ) ) ( not ( = ?auto_603279 ?auto_603290 ) ) ( not ( = ?auto_603279 ?auto_603291 ) ) ( not ( = ?auto_603279 ?auto_603292 ) ) ( not ( = ?auto_603279 ?auto_603293 ) ) ( not ( = ?auto_603279 ?auto_603294 ) ) ( not ( = ?auto_603280 ?auto_603281 ) ) ( not ( = ?auto_603280 ?auto_603282 ) ) ( not ( = ?auto_603280 ?auto_603283 ) ) ( not ( = ?auto_603280 ?auto_603284 ) ) ( not ( = ?auto_603280 ?auto_603285 ) ) ( not ( = ?auto_603280 ?auto_603286 ) ) ( not ( = ?auto_603280 ?auto_603287 ) ) ( not ( = ?auto_603280 ?auto_603288 ) ) ( not ( = ?auto_603280 ?auto_603289 ) ) ( not ( = ?auto_603280 ?auto_603290 ) ) ( not ( = ?auto_603280 ?auto_603291 ) ) ( not ( = ?auto_603280 ?auto_603292 ) ) ( not ( = ?auto_603280 ?auto_603293 ) ) ( not ( = ?auto_603280 ?auto_603294 ) ) ( not ( = ?auto_603281 ?auto_603282 ) ) ( not ( = ?auto_603281 ?auto_603283 ) ) ( not ( = ?auto_603281 ?auto_603284 ) ) ( not ( = ?auto_603281 ?auto_603285 ) ) ( not ( = ?auto_603281 ?auto_603286 ) ) ( not ( = ?auto_603281 ?auto_603287 ) ) ( not ( = ?auto_603281 ?auto_603288 ) ) ( not ( = ?auto_603281 ?auto_603289 ) ) ( not ( = ?auto_603281 ?auto_603290 ) ) ( not ( = ?auto_603281 ?auto_603291 ) ) ( not ( = ?auto_603281 ?auto_603292 ) ) ( not ( = ?auto_603281 ?auto_603293 ) ) ( not ( = ?auto_603281 ?auto_603294 ) ) ( not ( = ?auto_603282 ?auto_603283 ) ) ( not ( = ?auto_603282 ?auto_603284 ) ) ( not ( = ?auto_603282 ?auto_603285 ) ) ( not ( = ?auto_603282 ?auto_603286 ) ) ( not ( = ?auto_603282 ?auto_603287 ) ) ( not ( = ?auto_603282 ?auto_603288 ) ) ( not ( = ?auto_603282 ?auto_603289 ) ) ( not ( = ?auto_603282 ?auto_603290 ) ) ( not ( = ?auto_603282 ?auto_603291 ) ) ( not ( = ?auto_603282 ?auto_603292 ) ) ( not ( = ?auto_603282 ?auto_603293 ) ) ( not ( = ?auto_603282 ?auto_603294 ) ) ( not ( = ?auto_603283 ?auto_603284 ) ) ( not ( = ?auto_603283 ?auto_603285 ) ) ( not ( = ?auto_603283 ?auto_603286 ) ) ( not ( = ?auto_603283 ?auto_603287 ) ) ( not ( = ?auto_603283 ?auto_603288 ) ) ( not ( = ?auto_603283 ?auto_603289 ) ) ( not ( = ?auto_603283 ?auto_603290 ) ) ( not ( = ?auto_603283 ?auto_603291 ) ) ( not ( = ?auto_603283 ?auto_603292 ) ) ( not ( = ?auto_603283 ?auto_603293 ) ) ( not ( = ?auto_603283 ?auto_603294 ) ) ( not ( = ?auto_603284 ?auto_603285 ) ) ( not ( = ?auto_603284 ?auto_603286 ) ) ( not ( = ?auto_603284 ?auto_603287 ) ) ( not ( = ?auto_603284 ?auto_603288 ) ) ( not ( = ?auto_603284 ?auto_603289 ) ) ( not ( = ?auto_603284 ?auto_603290 ) ) ( not ( = ?auto_603284 ?auto_603291 ) ) ( not ( = ?auto_603284 ?auto_603292 ) ) ( not ( = ?auto_603284 ?auto_603293 ) ) ( not ( = ?auto_603284 ?auto_603294 ) ) ( not ( = ?auto_603285 ?auto_603286 ) ) ( not ( = ?auto_603285 ?auto_603287 ) ) ( not ( = ?auto_603285 ?auto_603288 ) ) ( not ( = ?auto_603285 ?auto_603289 ) ) ( not ( = ?auto_603285 ?auto_603290 ) ) ( not ( = ?auto_603285 ?auto_603291 ) ) ( not ( = ?auto_603285 ?auto_603292 ) ) ( not ( = ?auto_603285 ?auto_603293 ) ) ( not ( = ?auto_603285 ?auto_603294 ) ) ( not ( = ?auto_603286 ?auto_603287 ) ) ( not ( = ?auto_603286 ?auto_603288 ) ) ( not ( = ?auto_603286 ?auto_603289 ) ) ( not ( = ?auto_603286 ?auto_603290 ) ) ( not ( = ?auto_603286 ?auto_603291 ) ) ( not ( = ?auto_603286 ?auto_603292 ) ) ( not ( = ?auto_603286 ?auto_603293 ) ) ( not ( = ?auto_603286 ?auto_603294 ) ) ( not ( = ?auto_603287 ?auto_603288 ) ) ( not ( = ?auto_603287 ?auto_603289 ) ) ( not ( = ?auto_603287 ?auto_603290 ) ) ( not ( = ?auto_603287 ?auto_603291 ) ) ( not ( = ?auto_603287 ?auto_603292 ) ) ( not ( = ?auto_603287 ?auto_603293 ) ) ( not ( = ?auto_603287 ?auto_603294 ) ) ( not ( = ?auto_603288 ?auto_603289 ) ) ( not ( = ?auto_603288 ?auto_603290 ) ) ( not ( = ?auto_603288 ?auto_603291 ) ) ( not ( = ?auto_603288 ?auto_603292 ) ) ( not ( = ?auto_603288 ?auto_603293 ) ) ( not ( = ?auto_603288 ?auto_603294 ) ) ( not ( = ?auto_603289 ?auto_603290 ) ) ( not ( = ?auto_603289 ?auto_603291 ) ) ( not ( = ?auto_603289 ?auto_603292 ) ) ( not ( = ?auto_603289 ?auto_603293 ) ) ( not ( = ?auto_603289 ?auto_603294 ) ) ( not ( = ?auto_603290 ?auto_603291 ) ) ( not ( = ?auto_603290 ?auto_603292 ) ) ( not ( = ?auto_603290 ?auto_603293 ) ) ( not ( = ?auto_603290 ?auto_603294 ) ) ( not ( = ?auto_603291 ?auto_603292 ) ) ( not ( = ?auto_603291 ?auto_603293 ) ) ( not ( = ?auto_603291 ?auto_603294 ) ) ( not ( = ?auto_603292 ?auto_603293 ) ) ( not ( = ?auto_603292 ?auto_603294 ) ) ( not ( = ?auto_603293 ?auto_603294 ) ) ( ON ?auto_603292 ?auto_603293 ) ( ON ?auto_603291 ?auto_603292 ) ( CLEAR ?auto_603289 ) ( ON ?auto_603290 ?auto_603291 ) ( CLEAR ?auto_603290 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_603278 ?auto_603279 ?auto_603280 ?auto_603281 ?auto_603282 ?auto_603283 ?auto_603284 ?auto_603285 ?auto_603286 ?auto_603287 ?auto_603288 ?auto_603289 ?auto_603290 )
      ( MAKE-16PILE ?auto_603278 ?auto_603279 ?auto_603280 ?auto_603281 ?auto_603282 ?auto_603283 ?auto_603284 ?auto_603285 ?auto_603286 ?auto_603287 ?auto_603288 ?auto_603289 ?auto_603290 ?auto_603291 ?auto_603292 ?auto_603293 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_603344 - BLOCK
      ?auto_603345 - BLOCK
      ?auto_603346 - BLOCK
      ?auto_603347 - BLOCK
      ?auto_603348 - BLOCK
      ?auto_603349 - BLOCK
      ?auto_603350 - BLOCK
      ?auto_603351 - BLOCK
      ?auto_603352 - BLOCK
      ?auto_603353 - BLOCK
      ?auto_603354 - BLOCK
      ?auto_603355 - BLOCK
      ?auto_603356 - BLOCK
      ?auto_603357 - BLOCK
      ?auto_603358 - BLOCK
      ?auto_603359 - BLOCK
    )
    :vars
    (
      ?auto_603360 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_603359 ?auto_603360 ) ( ON-TABLE ?auto_603344 ) ( ON ?auto_603345 ?auto_603344 ) ( ON ?auto_603346 ?auto_603345 ) ( ON ?auto_603347 ?auto_603346 ) ( ON ?auto_603348 ?auto_603347 ) ( ON ?auto_603349 ?auto_603348 ) ( ON ?auto_603350 ?auto_603349 ) ( ON ?auto_603351 ?auto_603350 ) ( ON ?auto_603352 ?auto_603351 ) ( ON ?auto_603353 ?auto_603352 ) ( ON ?auto_603354 ?auto_603353 ) ( not ( = ?auto_603344 ?auto_603345 ) ) ( not ( = ?auto_603344 ?auto_603346 ) ) ( not ( = ?auto_603344 ?auto_603347 ) ) ( not ( = ?auto_603344 ?auto_603348 ) ) ( not ( = ?auto_603344 ?auto_603349 ) ) ( not ( = ?auto_603344 ?auto_603350 ) ) ( not ( = ?auto_603344 ?auto_603351 ) ) ( not ( = ?auto_603344 ?auto_603352 ) ) ( not ( = ?auto_603344 ?auto_603353 ) ) ( not ( = ?auto_603344 ?auto_603354 ) ) ( not ( = ?auto_603344 ?auto_603355 ) ) ( not ( = ?auto_603344 ?auto_603356 ) ) ( not ( = ?auto_603344 ?auto_603357 ) ) ( not ( = ?auto_603344 ?auto_603358 ) ) ( not ( = ?auto_603344 ?auto_603359 ) ) ( not ( = ?auto_603344 ?auto_603360 ) ) ( not ( = ?auto_603345 ?auto_603346 ) ) ( not ( = ?auto_603345 ?auto_603347 ) ) ( not ( = ?auto_603345 ?auto_603348 ) ) ( not ( = ?auto_603345 ?auto_603349 ) ) ( not ( = ?auto_603345 ?auto_603350 ) ) ( not ( = ?auto_603345 ?auto_603351 ) ) ( not ( = ?auto_603345 ?auto_603352 ) ) ( not ( = ?auto_603345 ?auto_603353 ) ) ( not ( = ?auto_603345 ?auto_603354 ) ) ( not ( = ?auto_603345 ?auto_603355 ) ) ( not ( = ?auto_603345 ?auto_603356 ) ) ( not ( = ?auto_603345 ?auto_603357 ) ) ( not ( = ?auto_603345 ?auto_603358 ) ) ( not ( = ?auto_603345 ?auto_603359 ) ) ( not ( = ?auto_603345 ?auto_603360 ) ) ( not ( = ?auto_603346 ?auto_603347 ) ) ( not ( = ?auto_603346 ?auto_603348 ) ) ( not ( = ?auto_603346 ?auto_603349 ) ) ( not ( = ?auto_603346 ?auto_603350 ) ) ( not ( = ?auto_603346 ?auto_603351 ) ) ( not ( = ?auto_603346 ?auto_603352 ) ) ( not ( = ?auto_603346 ?auto_603353 ) ) ( not ( = ?auto_603346 ?auto_603354 ) ) ( not ( = ?auto_603346 ?auto_603355 ) ) ( not ( = ?auto_603346 ?auto_603356 ) ) ( not ( = ?auto_603346 ?auto_603357 ) ) ( not ( = ?auto_603346 ?auto_603358 ) ) ( not ( = ?auto_603346 ?auto_603359 ) ) ( not ( = ?auto_603346 ?auto_603360 ) ) ( not ( = ?auto_603347 ?auto_603348 ) ) ( not ( = ?auto_603347 ?auto_603349 ) ) ( not ( = ?auto_603347 ?auto_603350 ) ) ( not ( = ?auto_603347 ?auto_603351 ) ) ( not ( = ?auto_603347 ?auto_603352 ) ) ( not ( = ?auto_603347 ?auto_603353 ) ) ( not ( = ?auto_603347 ?auto_603354 ) ) ( not ( = ?auto_603347 ?auto_603355 ) ) ( not ( = ?auto_603347 ?auto_603356 ) ) ( not ( = ?auto_603347 ?auto_603357 ) ) ( not ( = ?auto_603347 ?auto_603358 ) ) ( not ( = ?auto_603347 ?auto_603359 ) ) ( not ( = ?auto_603347 ?auto_603360 ) ) ( not ( = ?auto_603348 ?auto_603349 ) ) ( not ( = ?auto_603348 ?auto_603350 ) ) ( not ( = ?auto_603348 ?auto_603351 ) ) ( not ( = ?auto_603348 ?auto_603352 ) ) ( not ( = ?auto_603348 ?auto_603353 ) ) ( not ( = ?auto_603348 ?auto_603354 ) ) ( not ( = ?auto_603348 ?auto_603355 ) ) ( not ( = ?auto_603348 ?auto_603356 ) ) ( not ( = ?auto_603348 ?auto_603357 ) ) ( not ( = ?auto_603348 ?auto_603358 ) ) ( not ( = ?auto_603348 ?auto_603359 ) ) ( not ( = ?auto_603348 ?auto_603360 ) ) ( not ( = ?auto_603349 ?auto_603350 ) ) ( not ( = ?auto_603349 ?auto_603351 ) ) ( not ( = ?auto_603349 ?auto_603352 ) ) ( not ( = ?auto_603349 ?auto_603353 ) ) ( not ( = ?auto_603349 ?auto_603354 ) ) ( not ( = ?auto_603349 ?auto_603355 ) ) ( not ( = ?auto_603349 ?auto_603356 ) ) ( not ( = ?auto_603349 ?auto_603357 ) ) ( not ( = ?auto_603349 ?auto_603358 ) ) ( not ( = ?auto_603349 ?auto_603359 ) ) ( not ( = ?auto_603349 ?auto_603360 ) ) ( not ( = ?auto_603350 ?auto_603351 ) ) ( not ( = ?auto_603350 ?auto_603352 ) ) ( not ( = ?auto_603350 ?auto_603353 ) ) ( not ( = ?auto_603350 ?auto_603354 ) ) ( not ( = ?auto_603350 ?auto_603355 ) ) ( not ( = ?auto_603350 ?auto_603356 ) ) ( not ( = ?auto_603350 ?auto_603357 ) ) ( not ( = ?auto_603350 ?auto_603358 ) ) ( not ( = ?auto_603350 ?auto_603359 ) ) ( not ( = ?auto_603350 ?auto_603360 ) ) ( not ( = ?auto_603351 ?auto_603352 ) ) ( not ( = ?auto_603351 ?auto_603353 ) ) ( not ( = ?auto_603351 ?auto_603354 ) ) ( not ( = ?auto_603351 ?auto_603355 ) ) ( not ( = ?auto_603351 ?auto_603356 ) ) ( not ( = ?auto_603351 ?auto_603357 ) ) ( not ( = ?auto_603351 ?auto_603358 ) ) ( not ( = ?auto_603351 ?auto_603359 ) ) ( not ( = ?auto_603351 ?auto_603360 ) ) ( not ( = ?auto_603352 ?auto_603353 ) ) ( not ( = ?auto_603352 ?auto_603354 ) ) ( not ( = ?auto_603352 ?auto_603355 ) ) ( not ( = ?auto_603352 ?auto_603356 ) ) ( not ( = ?auto_603352 ?auto_603357 ) ) ( not ( = ?auto_603352 ?auto_603358 ) ) ( not ( = ?auto_603352 ?auto_603359 ) ) ( not ( = ?auto_603352 ?auto_603360 ) ) ( not ( = ?auto_603353 ?auto_603354 ) ) ( not ( = ?auto_603353 ?auto_603355 ) ) ( not ( = ?auto_603353 ?auto_603356 ) ) ( not ( = ?auto_603353 ?auto_603357 ) ) ( not ( = ?auto_603353 ?auto_603358 ) ) ( not ( = ?auto_603353 ?auto_603359 ) ) ( not ( = ?auto_603353 ?auto_603360 ) ) ( not ( = ?auto_603354 ?auto_603355 ) ) ( not ( = ?auto_603354 ?auto_603356 ) ) ( not ( = ?auto_603354 ?auto_603357 ) ) ( not ( = ?auto_603354 ?auto_603358 ) ) ( not ( = ?auto_603354 ?auto_603359 ) ) ( not ( = ?auto_603354 ?auto_603360 ) ) ( not ( = ?auto_603355 ?auto_603356 ) ) ( not ( = ?auto_603355 ?auto_603357 ) ) ( not ( = ?auto_603355 ?auto_603358 ) ) ( not ( = ?auto_603355 ?auto_603359 ) ) ( not ( = ?auto_603355 ?auto_603360 ) ) ( not ( = ?auto_603356 ?auto_603357 ) ) ( not ( = ?auto_603356 ?auto_603358 ) ) ( not ( = ?auto_603356 ?auto_603359 ) ) ( not ( = ?auto_603356 ?auto_603360 ) ) ( not ( = ?auto_603357 ?auto_603358 ) ) ( not ( = ?auto_603357 ?auto_603359 ) ) ( not ( = ?auto_603357 ?auto_603360 ) ) ( not ( = ?auto_603358 ?auto_603359 ) ) ( not ( = ?auto_603358 ?auto_603360 ) ) ( not ( = ?auto_603359 ?auto_603360 ) ) ( ON ?auto_603358 ?auto_603359 ) ( ON ?auto_603357 ?auto_603358 ) ( ON ?auto_603356 ?auto_603357 ) ( CLEAR ?auto_603354 ) ( ON ?auto_603355 ?auto_603356 ) ( CLEAR ?auto_603355 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_603344 ?auto_603345 ?auto_603346 ?auto_603347 ?auto_603348 ?auto_603349 ?auto_603350 ?auto_603351 ?auto_603352 ?auto_603353 ?auto_603354 ?auto_603355 )
      ( MAKE-16PILE ?auto_603344 ?auto_603345 ?auto_603346 ?auto_603347 ?auto_603348 ?auto_603349 ?auto_603350 ?auto_603351 ?auto_603352 ?auto_603353 ?auto_603354 ?auto_603355 ?auto_603356 ?auto_603357 ?auto_603358 ?auto_603359 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_603410 - BLOCK
      ?auto_603411 - BLOCK
      ?auto_603412 - BLOCK
      ?auto_603413 - BLOCK
      ?auto_603414 - BLOCK
      ?auto_603415 - BLOCK
      ?auto_603416 - BLOCK
      ?auto_603417 - BLOCK
      ?auto_603418 - BLOCK
      ?auto_603419 - BLOCK
      ?auto_603420 - BLOCK
      ?auto_603421 - BLOCK
      ?auto_603422 - BLOCK
      ?auto_603423 - BLOCK
      ?auto_603424 - BLOCK
      ?auto_603425 - BLOCK
    )
    :vars
    (
      ?auto_603426 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_603425 ?auto_603426 ) ( ON-TABLE ?auto_603410 ) ( ON ?auto_603411 ?auto_603410 ) ( ON ?auto_603412 ?auto_603411 ) ( ON ?auto_603413 ?auto_603412 ) ( ON ?auto_603414 ?auto_603413 ) ( ON ?auto_603415 ?auto_603414 ) ( ON ?auto_603416 ?auto_603415 ) ( ON ?auto_603417 ?auto_603416 ) ( ON ?auto_603418 ?auto_603417 ) ( ON ?auto_603419 ?auto_603418 ) ( not ( = ?auto_603410 ?auto_603411 ) ) ( not ( = ?auto_603410 ?auto_603412 ) ) ( not ( = ?auto_603410 ?auto_603413 ) ) ( not ( = ?auto_603410 ?auto_603414 ) ) ( not ( = ?auto_603410 ?auto_603415 ) ) ( not ( = ?auto_603410 ?auto_603416 ) ) ( not ( = ?auto_603410 ?auto_603417 ) ) ( not ( = ?auto_603410 ?auto_603418 ) ) ( not ( = ?auto_603410 ?auto_603419 ) ) ( not ( = ?auto_603410 ?auto_603420 ) ) ( not ( = ?auto_603410 ?auto_603421 ) ) ( not ( = ?auto_603410 ?auto_603422 ) ) ( not ( = ?auto_603410 ?auto_603423 ) ) ( not ( = ?auto_603410 ?auto_603424 ) ) ( not ( = ?auto_603410 ?auto_603425 ) ) ( not ( = ?auto_603410 ?auto_603426 ) ) ( not ( = ?auto_603411 ?auto_603412 ) ) ( not ( = ?auto_603411 ?auto_603413 ) ) ( not ( = ?auto_603411 ?auto_603414 ) ) ( not ( = ?auto_603411 ?auto_603415 ) ) ( not ( = ?auto_603411 ?auto_603416 ) ) ( not ( = ?auto_603411 ?auto_603417 ) ) ( not ( = ?auto_603411 ?auto_603418 ) ) ( not ( = ?auto_603411 ?auto_603419 ) ) ( not ( = ?auto_603411 ?auto_603420 ) ) ( not ( = ?auto_603411 ?auto_603421 ) ) ( not ( = ?auto_603411 ?auto_603422 ) ) ( not ( = ?auto_603411 ?auto_603423 ) ) ( not ( = ?auto_603411 ?auto_603424 ) ) ( not ( = ?auto_603411 ?auto_603425 ) ) ( not ( = ?auto_603411 ?auto_603426 ) ) ( not ( = ?auto_603412 ?auto_603413 ) ) ( not ( = ?auto_603412 ?auto_603414 ) ) ( not ( = ?auto_603412 ?auto_603415 ) ) ( not ( = ?auto_603412 ?auto_603416 ) ) ( not ( = ?auto_603412 ?auto_603417 ) ) ( not ( = ?auto_603412 ?auto_603418 ) ) ( not ( = ?auto_603412 ?auto_603419 ) ) ( not ( = ?auto_603412 ?auto_603420 ) ) ( not ( = ?auto_603412 ?auto_603421 ) ) ( not ( = ?auto_603412 ?auto_603422 ) ) ( not ( = ?auto_603412 ?auto_603423 ) ) ( not ( = ?auto_603412 ?auto_603424 ) ) ( not ( = ?auto_603412 ?auto_603425 ) ) ( not ( = ?auto_603412 ?auto_603426 ) ) ( not ( = ?auto_603413 ?auto_603414 ) ) ( not ( = ?auto_603413 ?auto_603415 ) ) ( not ( = ?auto_603413 ?auto_603416 ) ) ( not ( = ?auto_603413 ?auto_603417 ) ) ( not ( = ?auto_603413 ?auto_603418 ) ) ( not ( = ?auto_603413 ?auto_603419 ) ) ( not ( = ?auto_603413 ?auto_603420 ) ) ( not ( = ?auto_603413 ?auto_603421 ) ) ( not ( = ?auto_603413 ?auto_603422 ) ) ( not ( = ?auto_603413 ?auto_603423 ) ) ( not ( = ?auto_603413 ?auto_603424 ) ) ( not ( = ?auto_603413 ?auto_603425 ) ) ( not ( = ?auto_603413 ?auto_603426 ) ) ( not ( = ?auto_603414 ?auto_603415 ) ) ( not ( = ?auto_603414 ?auto_603416 ) ) ( not ( = ?auto_603414 ?auto_603417 ) ) ( not ( = ?auto_603414 ?auto_603418 ) ) ( not ( = ?auto_603414 ?auto_603419 ) ) ( not ( = ?auto_603414 ?auto_603420 ) ) ( not ( = ?auto_603414 ?auto_603421 ) ) ( not ( = ?auto_603414 ?auto_603422 ) ) ( not ( = ?auto_603414 ?auto_603423 ) ) ( not ( = ?auto_603414 ?auto_603424 ) ) ( not ( = ?auto_603414 ?auto_603425 ) ) ( not ( = ?auto_603414 ?auto_603426 ) ) ( not ( = ?auto_603415 ?auto_603416 ) ) ( not ( = ?auto_603415 ?auto_603417 ) ) ( not ( = ?auto_603415 ?auto_603418 ) ) ( not ( = ?auto_603415 ?auto_603419 ) ) ( not ( = ?auto_603415 ?auto_603420 ) ) ( not ( = ?auto_603415 ?auto_603421 ) ) ( not ( = ?auto_603415 ?auto_603422 ) ) ( not ( = ?auto_603415 ?auto_603423 ) ) ( not ( = ?auto_603415 ?auto_603424 ) ) ( not ( = ?auto_603415 ?auto_603425 ) ) ( not ( = ?auto_603415 ?auto_603426 ) ) ( not ( = ?auto_603416 ?auto_603417 ) ) ( not ( = ?auto_603416 ?auto_603418 ) ) ( not ( = ?auto_603416 ?auto_603419 ) ) ( not ( = ?auto_603416 ?auto_603420 ) ) ( not ( = ?auto_603416 ?auto_603421 ) ) ( not ( = ?auto_603416 ?auto_603422 ) ) ( not ( = ?auto_603416 ?auto_603423 ) ) ( not ( = ?auto_603416 ?auto_603424 ) ) ( not ( = ?auto_603416 ?auto_603425 ) ) ( not ( = ?auto_603416 ?auto_603426 ) ) ( not ( = ?auto_603417 ?auto_603418 ) ) ( not ( = ?auto_603417 ?auto_603419 ) ) ( not ( = ?auto_603417 ?auto_603420 ) ) ( not ( = ?auto_603417 ?auto_603421 ) ) ( not ( = ?auto_603417 ?auto_603422 ) ) ( not ( = ?auto_603417 ?auto_603423 ) ) ( not ( = ?auto_603417 ?auto_603424 ) ) ( not ( = ?auto_603417 ?auto_603425 ) ) ( not ( = ?auto_603417 ?auto_603426 ) ) ( not ( = ?auto_603418 ?auto_603419 ) ) ( not ( = ?auto_603418 ?auto_603420 ) ) ( not ( = ?auto_603418 ?auto_603421 ) ) ( not ( = ?auto_603418 ?auto_603422 ) ) ( not ( = ?auto_603418 ?auto_603423 ) ) ( not ( = ?auto_603418 ?auto_603424 ) ) ( not ( = ?auto_603418 ?auto_603425 ) ) ( not ( = ?auto_603418 ?auto_603426 ) ) ( not ( = ?auto_603419 ?auto_603420 ) ) ( not ( = ?auto_603419 ?auto_603421 ) ) ( not ( = ?auto_603419 ?auto_603422 ) ) ( not ( = ?auto_603419 ?auto_603423 ) ) ( not ( = ?auto_603419 ?auto_603424 ) ) ( not ( = ?auto_603419 ?auto_603425 ) ) ( not ( = ?auto_603419 ?auto_603426 ) ) ( not ( = ?auto_603420 ?auto_603421 ) ) ( not ( = ?auto_603420 ?auto_603422 ) ) ( not ( = ?auto_603420 ?auto_603423 ) ) ( not ( = ?auto_603420 ?auto_603424 ) ) ( not ( = ?auto_603420 ?auto_603425 ) ) ( not ( = ?auto_603420 ?auto_603426 ) ) ( not ( = ?auto_603421 ?auto_603422 ) ) ( not ( = ?auto_603421 ?auto_603423 ) ) ( not ( = ?auto_603421 ?auto_603424 ) ) ( not ( = ?auto_603421 ?auto_603425 ) ) ( not ( = ?auto_603421 ?auto_603426 ) ) ( not ( = ?auto_603422 ?auto_603423 ) ) ( not ( = ?auto_603422 ?auto_603424 ) ) ( not ( = ?auto_603422 ?auto_603425 ) ) ( not ( = ?auto_603422 ?auto_603426 ) ) ( not ( = ?auto_603423 ?auto_603424 ) ) ( not ( = ?auto_603423 ?auto_603425 ) ) ( not ( = ?auto_603423 ?auto_603426 ) ) ( not ( = ?auto_603424 ?auto_603425 ) ) ( not ( = ?auto_603424 ?auto_603426 ) ) ( not ( = ?auto_603425 ?auto_603426 ) ) ( ON ?auto_603424 ?auto_603425 ) ( ON ?auto_603423 ?auto_603424 ) ( ON ?auto_603422 ?auto_603423 ) ( ON ?auto_603421 ?auto_603422 ) ( CLEAR ?auto_603419 ) ( ON ?auto_603420 ?auto_603421 ) ( CLEAR ?auto_603420 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_603410 ?auto_603411 ?auto_603412 ?auto_603413 ?auto_603414 ?auto_603415 ?auto_603416 ?auto_603417 ?auto_603418 ?auto_603419 ?auto_603420 )
      ( MAKE-16PILE ?auto_603410 ?auto_603411 ?auto_603412 ?auto_603413 ?auto_603414 ?auto_603415 ?auto_603416 ?auto_603417 ?auto_603418 ?auto_603419 ?auto_603420 ?auto_603421 ?auto_603422 ?auto_603423 ?auto_603424 ?auto_603425 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_603476 - BLOCK
      ?auto_603477 - BLOCK
      ?auto_603478 - BLOCK
      ?auto_603479 - BLOCK
      ?auto_603480 - BLOCK
      ?auto_603481 - BLOCK
      ?auto_603482 - BLOCK
      ?auto_603483 - BLOCK
      ?auto_603484 - BLOCK
      ?auto_603485 - BLOCK
      ?auto_603486 - BLOCK
      ?auto_603487 - BLOCK
      ?auto_603488 - BLOCK
      ?auto_603489 - BLOCK
      ?auto_603490 - BLOCK
      ?auto_603491 - BLOCK
    )
    :vars
    (
      ?auto_603492 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_603491 ?auto_603492 ) ( ON-TABLE ?auto_603476 ) ( ON ?auto_603477 ?auto_603476 ) ( ON ?auto_603478 ?auto_603477 ) ( ON ?auto_603479 ?auto_603478 ) ( ON ?auto_603480 ?auto_603479 ) ( ON ?auto_603481 ?auto_603480 ) ( ON ?auto_603482 ?auto_603481 ) ( ON ?auto_603483 ?auto_603482 ) ( ON ?auto_603484 ?auto_603483 ) ( not ( = ?auto_603476 ?auto_603477 ) ) ( not ( = ?auto_603476 ?auto_603478 ) ) ( not ( = ?auto_603476 ?auto_603479 ) ) ( not ( = ?auto_603476 ?auto_603480 ) ) ( not ( = ?auto_603476 ?auto_603481 ) ) ( not ( = ?auto_603476 ?auto_603482 ) ) ( not ( = ?auto_603476 ?auto_603483 ) ) ( not ( = ?auto_603476 ?auto_603484 ) ) ( not ( = ?auto_603476 ?auto_603485 ) ) ( not ( = ?auto_603476 ?auto_603486 ) ) ( not ( = ?auto_603476 ?auto_603487 ) ) ( not ( = ?auto_603476 ?auto_603488 ) ) ( not ( = ?auto_603476 ?auto_603489 ) ) ( not ( = ?auto_603476 ?auto_603490 ) ) ( not ( = ?auto_603476 ?auto_603491 ) ) ( not ( = ?auto_603476 ?auto_603492 ) ) ( not ( = ?auto_603477 ?auto_603478 ) ) ( not ( = ?auto_603477 ?auto_603479 ) ) ( not ( = ?auto_603477 ?auto_603480 ) ) ( not ( = ?auto_603477 ?auto_603481 ) ) ( not ( = ?auto_603477 ?auto_603482 ) ) ( not ( = ?auto_603477 ?auto_603483 ) ) ( not ( = ?auto_603477 ?auto_603484 ) ) ( not ( = ?auto_603477 ?auto_603485 ) ) ( not ( = ?auto_603477 ?auto_603486 ) ) ( not ( = ?auto_603477 ?auto_603487 ) ) ( not ( = ?auto_603477 ?auto_603488 ) ) ( not ( = ?auto_603477 ?auto_603489 ) ) ( not ( = ?auto_603477 ?auto_603490 ) ) ( not ( = ?auto_603477 ?auto_603491 ) ) ( not ( = ?auto_603477 ?auto_603492 ) ) ( not ( = ?auto_603478 ?auto_603479 ) ) ( not ( = ?auto_603478 ?auto_603480 ) ) ( not ( = ?auto_603478 ?auto_603481 ) ) ( not ( = ?auto_603478 ?auto_603482 ) ) ( not ( = ?auto_603478 ?auto_603483 ) ) ( not ( = ?auto_603478 ?auto_603484 ) ) ( not ( = ?auto_603478 ?auto_603485 ) ) ( not ( = ?auto_603478 ?auto_603486 ) ) ( not ( = ?auto_603478 ?auto_603487 ) ) ( not ( = ?auto_603478 ?auto_603488 ) ) ( not ( = ?auto_603478 ?auto_603489 ) ) ( not ( = ?auto_603478 ?auto_603490 ) ) ( not ( = ?auto_603478 ?auto_603491 ) ) ( not ( = ?auto_603478 ?auto_603492 ) ) ( not ( = ?auto_603479 ?auto_603480 ) ) ( not ( = ?auto_603479 ?auto_603481 ) ) ( not ( = ?auto_603479 ?auto_603482 ) ) ( not ( = ?auto_603479 ?auto_603483 ) ) ( not ( = ?auto_603479 ?auto_603484 ) ) ( not ( = ?auto_603479 ?auto_603485 ) ) ( not ( = ?auto_603479 ?auto_603486 ) ) ( not ( = ?auto_603479 ?auto_603487 ) ) ( not ( = ?auto_603479 ?auto_603488 ) ) ( not ( = ?auto_603479 ?auto_603489 ) ) ( not ( = ?auto_603479 ?auto_603490 ) ) ( not ( = ?auto_603479 ?auto_603491 ) ) ( not ( = ?auto_603479 ?auto_603492 ) ) ( not ( = ?auto_603480 ?auto_603481 ) ) ( not ( = ?auto_603480 ?auto_603482 ) ) ( not ( = ?auto_603480 ?auto_603483 ) ) ( not ( = ?auto_603480 ?auto_603484 ) ) ( not ( = ?auto_603480 ?auto_603485 ) ) ( not ( = ?auto_603480 ?auto_603486 ) ) ( not ( = ?auto_603480 ?auto_603487 ) ) ( not ( = ?auto_603480 ?auto_603488 ) ) ( not ( = ?auto_603480 ?auto_603489 ) ) ( not ( = ?auto_603480 ?auto_603490 ) ) ( not ( = ?auto_603480 ?auto_603491 ) ) ( not ( = ?auto_603480 ?auto_603492 ) ) ( not ( = ?auto_603481 ?auto_603482 ) ) ( not ( = ?auto_603481 ?auto_603483 ) ) ( not ( = ?auto_603481 ?auto_603484 ) ) ( not ( = ?auto_603481 ?auto_603485 ) ) ( not ( = ?auto_603481 ?auto_603486 ) ) ( not ( = ?auto_603481 ?auto_603487 ) ) ( not ( = ?auto_603481 ?auto_603488 ) ) ( not ( = ?auto_603481 ?auto_603489 ) ) ( not ( = ?auto_603481 ?auto_603490 ) ) ( not ( = ?auto_603481 ?auto_603491 ) ) ( not ( = ?auto_603481 ?auto_603492 ) ) ( not ( = ?auto_603482 ?auto_603483 ) ) ( not ( = ?auto_603482 ?auto_603484 ) ) ( not ( = ?auto_603482 ?auto_603485 ) ) ( not ( = ?auto_603482 ?auto_603486 ) ) ( not ( = ?auto_603482 ?auto_603487 ) ) ( not ( = ?auto_603482 ?auto_603488 ) ) ( not ( = ?auto_603482 ?auto_603489 ) ) ( not ( = ?auto_603482 ?auto_603490 ) ) ( not ( = ?auto_603482 ?auto_603491 ) ) ( not ( = ?auto_603482 ?auto_603492 ) ) ( not ( = ?auto_603483 ?auto_603484 ) ) ( not ( = ?auto_603483 ?auto_603485 ) ) ( not ( = ?auto_603483 ?auto_603486 ) ) ( not ( = ?auto_603483 ?auto_603487 ) ) ( not ( = ?auto_603483 ?auto_603488 ) ) ( not ( = ?auto_603483 ?auto_603489 ) ) ( not ( = ?auto_603483 ?auto_603490 ) ) ( not ( = ?auto_603483 ?auto_603491 ) ) ( not ( = ?auto_603483 ?auto_603492 ) ) ( not ( = ?auto_603484 ?auto_603485 ) ) ( not ( = ?auto_603484 ?auto_603486 ) ) ( not ( = ?auto_603484 ?auto_603487 ) ) ( not ( = ?auto_603484 ?auto_603488 ) ) ( not ( = ?auto_603484 ?auto_603489 ) ) ( not ( = ?auto_603484 ?auto_603490 ) ) ( not ( = ?auto_603484 ?auto_603491 ) ) ( not ( = ?auto_603484 ?auto_603492 ) ) ( not ( = ?auto_603485 ?auto_603486 ) ) ( not ( = ?auto_603485 ?auto_603487 ) ) ( not ( = ?auto_603485 ?auto_603488 ) ) ( not ( = ?auto_603485 ?auto_603489 ) ) ( not ( = ?auto_603485 ?auto_603490 ) ) ( not ( = ?auto_603485 ?auto_603491 ) ) ( not ( = ?auto_603485 ?auto_603492 ) ) ( not ( = ?auto_603486 ?auto_603487 ) ) ( not ( = ?auto_603486 ?auto_603488 ) ) ( not ( = ?auto_603486 ?auto_603489 ) ) ( not ( = ?auto_603486 ?auto_603490 ) ) ( not ( = ?auto_603486 ?auto_603491 ) ) ( not ( = ?auto_603486 ?auto_603492 ) ) ( not ( = ?auto_603487 ?auto_603488 ) ) ( not ( = ?auto_603487 ?auto_603489 ) ) ( not ( = ?auto_603487 ?auto_603490 ) ) ( not ( = ?auto_603487 ?auto_603491 ) ) ( not ( = ?auto_603487 ?auto_603492 ) ) ( not ( = ?auto_603488 ?auto_603489 ) ) ( not ( = ?auto_603488 ?auto_603490 ) ) ( not ( = ?auto_603488 ?auto_603491 ) ) ( not ( = ?auto_603488 ?auto_603492 ) ) ( not ( = ?auto_603489 ?auto_603490 ) ) ( not ( = ?auto_603489 ?auto_603491 ) ) ( not ( = ?auto_603489 ?auto_603492 ) ) ( not ( = ?auto_603490 ?auto_603491 ) ) ( not ( = ?auto_603490 ?auto_603492 ) ) ( not ( = ?auto_603491 ?auto_603492 ) ) ( ON ?auto_603490 ?auto_603491 ) ( ON ?auto_603489 ?auto_603490 ) ( ON ?auto_603488 ?auto_603489 ) ( ON ?auto_603487 ?auto_603488 ) ( ON ?auto_603486 ?auto_603487 ) ( CLEAR ?auto_603484 ) ( ON ?auto_603485 ?auto_603486 ) ( CLEAR ?auto_603485 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_603476 ?auto_603477 ?auto_603478 ?auto_603479 ?auto_603480 ?auto_603481 ?auto_603482 ?auto_603483 ?auto_603484 ?auto_603485 )
      ( MAKE-16PILE ?auto_603476 ?auto_603477 ?auto_603478 ?auto_603479 ?auto_603480 ?auto_603481 ?auto_603482 ?auto_603483 ?auto_603484 ?auto_603485 ?auto_603486 ?auto_603487 ?auto_603488 ?auto_603489 ?auto_603490 ?auto_603491 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_603542 - BLOCK
      ?auto_603543 - BLOCK
      ?auto_603544 - BLOCK
      ?auto_603545 - BLOCK
      ?auto_603546 - BLOCK
      ?auto_603547 - BLOCK
      ?auto_603548 - BLOCK
      ?auto_603549 - BLOCK
      ?auto_603550 - BLOCK
      ?auto_603551 - BLOCK
      ?auto_603552 - BLOCK
      ?auto_603553 - BLOCK
      ?auto_603554 - BLOCK
      ?auto_603555 - BLOCK
      ?auto_603556 - BLOCK
      ?auto_603557 - BLOCK
    )
    :vars
    (
      ?auto_603558 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_603557 ?auto_603558 ) ( ON-TABLE ?auto_603542 ) ( ON ?auto_603543 ?auto_603542 ) ( ON ?auto_603544 ?auto_603543 ) ( ON ?auto_603545 ?auto_603544 ) ( ON ?auto_603546 ?auto_603545 ) ( ON ?auto_603547 ?auto_603546 ) ( ON ?auto_603548 ?auto_603547 ) ( ON ?auto_603549 ?auto_603548 ) ( not ( = ?auto_603542 ?auto_603543 ) ) ( not ( = ?auto_603542 ?auto_603544 ) ) ( not ( = ?auto_603542 ?auto_603545 ) ) ( not ( = ?auto_603542 ?auto_603546 ) ) ( not ( = ?auto_603542 ?auto_603547 ) ) ( not ( = ?auto_603542 ?auto_603548 ) ) ( not ( = ?auto_603542 ?auto_603549 ) ) ( not ( = ?auto_603542 ?auto_603550 ) ) ( not ( = ?auto_603542 ?auto_603551 ) ) ( not ( = ?auto_603542 ?auto_603552 ) ) ( not ( = ?auto_603542 ?auto_603553 ) ) ( not ( = ?auto_603542 ?auto_603554 ) ) ( not ( = ?auto_603542 ?auto_603555 ) ) ( not ( = ?auto_603542 ?auto_603556 ) ) ( not ( = ?auto_603542 ?auto_603557 ) ) ( not ( = ?auto_603542 ?auto_603558 ) ) ( not ( = ?auto_603543 ?auto_603544 ) ) ( not ( = ?auto_603543 ?auto_603545 ) ) ( not ( = ?auto_603543 ?auto_603546 ) ) ( not ( = ?auto_603543 ?auto_603547 ) ) ( not ( = ?auto_603543 ?auto_603548 ) ) ( not ( = ?auto_603543 ?auto_603549 ) ) ( not ( = ?auto_603543 ?auto_603550 ) ) ( not ( = ?auto_603543 ?auto_603551 ) ) ( not ( = ?auto_603543 ?auto_603552 ) ) ( not ( = ?auto_603543 ?auto_603553 ) ) ( not ( = ?auto_603543 ?auto_603554 ) ) ( not ( = ?auto_603543 ?auto_603555 ) ) ( not ( = ?auto_603543 ?auto_603556 ) ) ( not ( = ?auto_603543 ?auto_603557 ) ) ( not ( = ?auto_603543 ?auto_603558 ) ) ( not ( = ?auto_603544 ?auto_603545 ) ) ( not ( = ?auto_603544 ?auto_603546 ) ) ( not ( = ?auto_603544 ?auto_603547 ) ) ( not ( = ?auto_603544 ?auto_603548 ) ) ( not ( = ?auto_603544 ?auto_603549 ) ) ( not ( = ?auto_603544 ?auto_603550 ) ) ( not ( = ?auto_603544 ?auto_603551 ) ) ( not ( = ?auto_603544 ?auto_603552 ) ) ( not ( = ?auto_603544 ?auto_603553 ) ) ( not ( = ?auto_603544 ?auto_603554 ) ) ( not ( = ?auto_603544 ?auto_603555 ) ) ( not ( = ?auto_603544 ?auto_603556 ) ) ( not ( = ?auto_603544 ?auto_603557 ) ) ( not ( = ?auto_603544 ?auto_603558 ) ) ( not ( = ?auto_603545 ?auto_603546 ) ) ( not ( = ?auto_603545 ?auto_603547 ) ) ( not ( = ?auto_603545 ?auto_603548 ) ) ( not ( = ?auto_603545 ?auto_603549 ) ) ( not ( = ?auto_603545 ?auto_603550 ) ) ( not ( = ?auto_603545 ?auto_603551 ) ) ( not ( = ?auto_603545 ?auto_603552 ) ) ( not ( = ?auto_603545 ?auto_603553 ) ) ( not ( = ?auto_603545 ?auto_603554 ) ) ( not ( = ?auto_603545 ?auto_603555 ) ) ( not ( = ?auto_603545 ?auto_603556 ) ) ( not ( = ?auto_603545 ?auto_603557 ) ) ( not ( = ?auto_603545 ?auto_603558 ) ) ( not ( = ?auto_603546 ?auto_603547 ) ) ( not ( = ?auto_603546 ?auto_603548 ) ) ( not ( = ?auto_603546 ?auto_603549 ) ) ( not ( = ?auto_603546 ?auto_603550 ) ) ( not ( = ?auto_603546 ?auto_603551 ) ) ( not ( = ?auto_603546 ?auto_603552 ) ) ( not ( = ?auto_603546 ?auto_603553 ) ) ( not ( = ?auto_603546 ?auto_603554 ) ) ( not ( = ?auto_603546 ?auto_603555 ) ) ( not ( = ?auto_603546 ?auto_603556 ) ) ( not ( = ?auto_603546 ?auto_603557 ) ) ( not ( = ?auto_603546 ?auto_603558 ) ) ( not ( = ?auto_603547 ?auto_603548 ) ) ( not ( = ?auto_603547 ?auto_603549 ) ) ( not ( = ?auto_603547 ?auto_603550 ) ) ( not ( = ?auto_603547 ?auto_603551 ) ) ( not ( = ?auto_603547 ?auto_603552 ) ) ( not ( = ?auto_603547 ?auto_603553 ) ) ( not ( = ?auto_603547 ?auto_603554 ) ) ( not ( = ?auto_603547 ?auto_603555 ) ) ( not ( = ?auto_603547 ?auto_603556 ) ) ( not ( = ?auto_603547 ?auto_603557 ) ) ( not ( = ?auto_603547 ?auto_603558 ) ) ( not ( = ?auto_603548 ?auto_603549 ) ) ( not ( = ?auto_603548 ?auto_603550 ) ) ( not ( = ?auto_603548 ?auto_603551 ) ) ( not ( = ?auto_603548 ?auto_603552 ) ) ( not ( = ?auto_603548 ?auto_603553 ) ) ( not ( = ?auto_603548 ?auto_603554 ) ) ( not ( = ?auto_603548 ?auto_603555 ) ) ( not ( = ?auto_603548 ?auto_603556 ) ) ( not ( = ?auto_603548 ?auto_603557 ) ) ( not ( = ?auto_603548 ?auto_603558 ) ) ( not ( = ?auto_603549 ?auto_603550 ) ) ( not ( = ?auto_603549 ?auto_603551 ) ) ( not ( = ?auto_603549 ?auto_603552 ) ) ( not ( = ?auto_603549 ?auto_603553 ) ) ( not ( = ?auto_603549 ?auto_603554 ) ) ( not ( = ?auto_603549 ?auto_603555 ) ) ( not ( = ?auto_603549 ?auto_603556 ) ) ( not ( = ?auto_603549 ?auto_603557 ) ) ( not ( = ?auto_603549 ?auto_603558 ) ) ( not ( = ?auto_603550 ?auto_603551 ) ) ( not ( = ?auto_603550 ?auto_603552 ) ) ( not ( = ?auto_603550 ?auto_603553 ) ) ( not ( = ?auto_603550 ?auto_603554 ) ) ( not ( = ?auto_603550 ?auto_603555 ) ) ( not ( = ?auto_603550 ?auto_603556 ) ) ( not ( = ?auto_603550 ?auto_603557 ) ) ( not ( = ?auto_603550 ?auto_603558 ) ) ( not ( = ?auto_603551 ?auto_603552 ) ) ( not ( = ?auto_603551 ?auto_603553 ) ) ( not ( = ?auto_603551 ?auto_603554 ) ) ( not ( = ?auto_603551 ?auto_603555 ) ) ( not ( = ?auto_603551 ?auto_603556 ) ) ( not ( = ?auto_603551 ?auto_603557 ) ) ( not ( = ?auto_603551 ?auto_603558 ) ) ( not ( = ?auto_603552 ?auto_603553 ) ) ( not ( = ?auto_603552 ?auto_603554 ) ) ( not ( = ?auto_603552 ?auto_603555 ) ) ( not ( = ?auto_603552 ?auto_603556 ) ) ( not ( = ?auto_603552 ?auto_603557 ) ) ( not ( = ?auto_603552 ?auto_603558 ) ) ( not ( = ?auto_603553 ?auto_603554 ) ) ( not ( = ?auto_603553 ?auto_603555 ) ) ( not ( = ?auto_603553 ?auto_603556 ) ) ( not ( = ?auto_603553 ?auto_603557 ) ) ( not ( = ?auto_603553 ?auto_603558 ) ) ( not ( = ?auto_603554 ?auto_603555 ) ) ( not ( = ?auto_603554 ?auto_603556 ) ) ( not ( = ?auto_603554 ?auto_603557 ) ) ( not ( = ?auto_603554 ?auto_603558 ) ) ( not ( = ?auto_603555 ?auto_603556 ) ) ( not ( = ?auto_603555 ?auto_603557 ) ) ( not ( = ?auto_603555 ?auto_603558 ) ) ( not ( = ?auto_603556 ?auto_603557 ) ) ( not ( = ?auto_603556 ?auto_603558 ) ) ( not ( = ?auto_603557 ?auto_603558 ) ) ( ON ?auto_603556 ?auto_603557 ) ( ON ?auto_603555 ?auto_603556 ) ( ON ?auto_603554 ?auto_603555 ) ( ON ?auto_603553 ?auto_603554 ) ( ON ?auto_603552 ?auto_603553 ) ( ON ?auto_603551 ?auto_603552 ) ( CLEAR ?auto_603549 ) ( ON ?auto_603550 ?auto_603551 ) ( CLEAR ?auto_603550 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_603542 ?auto_603543 ?auto_603544 ?auto_603545 ?auto_603546 ?auto_603547 ?auto_603548 ?auto_603549 ?auto_603550 )
      ( MAKE-16PILE ?auto_603542 ?auto_603543 ?auto_603544 ?auto_603545 ?auto_603546 ?auto_603547 ?auto_603548 ?auto_603549 ?auto_603550 ?auto_603551 ?auto_603552 ?auto_603553 ?auto_603554 ?auto_603555 ?auto_603556 ?auto_603557 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_603608 - BLOCK
      ?auto_603609 - BLOCK
      ?auto_603610 - BLOCK
      ?auto_603611 - BLOCK
      ?auto_603612 - BLOCK
      ?auto_603613 - BLOCK
      ?auto_603614 - BLOCK
      ?auto_603615 - BLOCK
      ?auto_603616 - BLOCK
      ?auto_603617 - BLOCK
      ?auto_603618 - BLOCK
      ?auto_603619 - BLOCK
      ?auto_603620 - BLOCK
      ?auto_603621 - BLOCK
      ?auto_603622 - BLOCK
      ?auto_603623 - BLOCK
    )
    :vars
    (
      ?auto_603624 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_603623 ?auto_603624 ) ( ON-TABLE ?auto_603608 ) ( ON ?auto_603609 ?auto_603608 ) ( ON ?auto_603610 ?auto_603609 ) ( ON ?auto_603611 ?auto_603610 ) ( ON ?auto_603612 ?auto_603611 ) ( ON ?auto_603613 ?auto_603612 ) ( ON ?auto_603614 ?auto_603613 ) ( not ( = ?auto_603608 ?auto_603609 ) ) ( not ( = ?auto_603608 ?auto_603610 ) ) ( not ( = ?auto_603608 ?auto_603611 ) ) ( not ( = ?auto_603608 ?auto_603612 ) ) ( not ( = ?auto_603608 ?auto_603613 ) ) ( not ( = ?auto_603608 ?auto_603614 ) ) ( not ( = ?auto_603608 ?auto_603615 ) ) ( not ( = ?auto_603608 ?auto_603616 ) ) ( not ( = ?auto_603608 ?auto_603617 ) ) ( not ( = ?auto_603608 ?auto_603618 ) ) ( not ( = ?auto_603608 ?auto_603619 ) ) ( not ( = ?auto_603608 ?auto_603620 ) ) ( not ( = ?auto_603608 ?auto_603621 ) ) ( not ( = ?auto_603608 ?auto_603622 ) ) ( not ( = ?auto_603608 ?auto_603623 ) ) ( not ( = ?auto_603608 ?auto_603624 ) ) ( not ( = ?auto_603609 ?auto_603610 ) ) ( not ( = ?auto_603609 ?auto_603611 ) ) ( not ( = ?auto_603609 ?auto_603612 ) ) ( not ( = ?auto_603609 ?auto_603613 ) ) ( not ( = ?auto_603609 ?auto_603614 ) ) ( not ( = ?auto_603609 ?auto_603615 ) ) ( not ( = ?auto_603609 ?auto_603616 ) ) ( not ( = ?auto_603609 ?auto_603617 ) ) ( not ( = ?auto_603609 ?auto_603618 ) ) ( not ( = ?auto_603609 ?auto_603619 ) ) ( not ( = ?auto_603609 ?auto_603620 ) ) ( not ( = ?auto_603609 ?auto_603621 ) ) ( not ( = ?auto_603609 ?auto_603622 ) ) ( not ( = ?auto_603609 ?auto_603623 ) ) ( not ( = ?auto_603609 ?auto_603624 ) ) ( not ( = ?auto_603610 ?auto_603611 ) ) ( not ( = ?auto_603610 ?auto_603612 ) ) ( not ( = ?auto_603610 ?auto_603613 ) ) ( not ( = ?auto_603610 ?auto_603614 ) ) ( not ( = ?auto_603610 ?auto_603615 ) ) ( not ( = ?auto_603610 ?auto_603616 ) ) ( not ( = ?auto_603610 ?auto_603617 ) ) ( not ( = ?auto_603610 ?auto_603618 ) ) ( not ( = ?auto_603610 ?auto_603619 ) ) ( not ( = ?auto_603610 ?auto_603620 ) ) ( not ( = ?auto_603610 ?auto_603621 ) ) ( not ( = ?auto_603610 ?auto_603622 ) ) ( not ( = ?auto_603610 ?auto_603623 ) ) ( not ( = ?auto_603610 ?auto_603624 ) ) ( not ( = ?auto_603611 ?auto_603612 ) ) ( not ( = ?auto_603611 ?auto_603613 ) ) ( not ( = ?auto_603611 ?auto_603614 ) ) ( not ( = ?auto_603611 ?auto_603615 ) ) ( not ( = ?auto_603611 ?auto_603616 ) ) ( not ( = ?auto_603611 ?auto_603617 ) ) ( not ( = ?auto_603611 ?auto_603618 ) ) ( not ( = ?auto_603611 ?auto_603619 ) ) ( not ( = ?auto_603611 ?auto_603620 ) ) ( not ( = ?auto_603611 ?auto_603621 ) ) ( not ( = ?auto_603611 ?auto_603622 ) ) ( not ( = ?auto_603611 ?auto_603623 ) ) ( not ( = ?auto_603611 ?auto_603624 ) ) ( not ( = ?auto_603612 ?auto_603613 ) ) ( not ( = ?auto_603612 ?auto_603614 ) ) ( not ( = ?auto_603612 ?auto_603615 ) ) ( not ( = ?auto_603612 ?auto_603616 ) ) ( not ( = ?auto_603612 ?auto_603617 ) ) ( not ( = ?auto_603612 ?auto_603618 ) ) ( not ( = ?auto_603612 ?auto_603619 ) ) ( not ( = ?auto_603612 ?auto_603620 ) ) ( not ( = ?auto_603612 ?auto_603621 ) ) ( not ( = ?auto_603612 ?auto_603622 ) ) ( not ( = ?auto_603612 ?auto_603623 ) ) ( not ( = ?auto_603612 ?auto_603624 ) ) ( not ( = ?auto_603613 ?auto_603614 ) ) ( not ( = ?auto_603613 ?auto_603615 ) ) ( not ( = ?auto_603613 ?auto_603616 ) ) ( not ( = ?auto_603613 ?auto_603617 ) ) ( not ( = ?auto_603613 ?auto_603618 ) ) ( not ( = ?auto_603613 ?auto_603619 ) ) ( not ( = ?auto_603613 ?auto_603620 ) ) ( not ( = ?auto_603613 ?auto_603621 ) ) ( not ( = ?auto_603613 ?auto_603622 ) ) ( not ( = ?auto_603613 ?auto_603623 ) ) ( not ( = ?auto_603613 ?auto_603624 ) ) ( not ( = ?auto_603614 ?auto_603615 ) ) ( not ( = ?auto_603614 ?auto_603616 ) ) ( not ( = ?auto_603614 ?auto_603617 ) ) ( not ( = ?auto_603614 ?auto_603618 ) ) ( not ( = ?auto_603614 ?auto_603619 ) ) ( not ( = ?auto_603614 ?auto_603620 ) ) ( not ( = ?auto_603614 ?auto_603621 ) ) ( not ( = ?auto_603614 ?auto_603622 ) ) ( not ( = ?auto_603614 ?auto_603623 ) ) ( not ( = ?auto_603614 ?auto_603624 ) ) ( not ( = ?auto_603615 ?auto_603616 ) ) ( not ( = ?auto_603615 ?auto_603617 ) ) ( not ( = ?auto_603615 ?auto_603618 ) ) ( not ( = ?auto_603615 ?auto_603619 ) ) ( not ( = ?auto_603615 ?auto_603620 ) ) ( not ( = ?auto_603615 ?auto_603621 ) ) ( not ( = ?auto_603615 ?auto_603622 ) ) ( not ( = ?auto_603615 ?auto_603623 ) ) ( not ( = ?auto_603615 ?auto_603624 ) ) ( not ( = ?auto_603616 ?auto_603617 ) ) ( not ( = ?auto_603616 ?auto_603618 ) ) ( not ( = ?auto_603616 ?auto_603619 ) ) ( not ( = ?auto_603616 ?auto_603620 ) ) ( not ( = ?auto_603616 ?auto_603621 ) ) ( not ( = ?auto_603616 ?auto_603622 ) ) ( not ( = ?auto_603616 ?auto_603623 ) ) ( not ( = ?auto_603616 ?auto_603624 ) ) ( not ( = ?auto_603617 ?auto_603618 ) ) ( not ( = ?auto_603617 ?auto_603619 ) ) ( not ( = ?auto_603617 ?auto_603620 ) ) ( not ( = ?auto_603617 ?auto_603621 ) ) ( not ( = ?auto_603617 ?auto_603622 ) ) ( not ( = ?auto_603617 ?auto_603623 ) ) ( not ( = ?auto_603617 ?auto_603624 ) ) ( not ( = ?auto_603618 ?auto_603619 ) ) ( not ( = ?auto_603618 ?auto_603620 ) ) ( not ( = ?auto_603618 ?auto_603621 ) ) ( not ( = ?auto_603618 ?auto_603622 ) ) ( not ( = ?auto_603618 ?auto_603623 ) ) ( not ( = ?auto_603618 ?auto_603624 ) ) ( not ( = ?auto_603619 ?auto_603620 ) ) ( not ( = ?auto_603619 ?auto_603621 ) ) ( not ( = ?auto_603619 ?auto_603622 ) ) ( not ( = ?auto_603619 ?auto_603623 ) ) ( not ( = ?auto_603619 ?auto_603624 ) ) ( not ( = ?auto_603620 ?auto_603621 ) ) ( not ( = ?auto_603620 ?auto_603622 ) ) ( not ( = ?auto_603620 ?auto_603623 ) ) ( not ( = ?auto_603620 ?auto_603624 ) ) ( not ( = ?auto_603621 ?auto_603622 ) ) ( not ( = ?auto_603621 ?auto_603623 ) ) ( not ( = ?auto_603621 ?auto_603624 ) ) ( not ( = ?auto_603622 ?auto_603623 ) ) ( not ( = ?auto_603622 ?auto_603624 ) ) ( not ( = ?auto_603623 ?auto_603624 ) ) ( ON ?auto_603622 ?auto_603623 ) ( ON ?auto_603621 ?auto_603622 ) ( ON ?auto_603620 ?auto_603621 ) ( ON ?auto_603619 ?auto_603620 ) ( ON ?auto_603618 ?auto_603619 ) ( ON ?auto_603617 ?auto_603618 ) ( ON ?auto_603616 ?auto_603617 ) ( CLEAR ?auto_603614 ) ( ON ?auto_603615 ?auto_603616 ) ( CLEAR ?auto_603615 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_603608 ?auto_603609 ?auto_603610 ?auto_603611 ?auto_603612 ?auto_603613 ?auto_603614 ?auto_603615 )
      ( MAKE-16PILE ?auto_603608 ?auto_603609 ?auto_603610 ?auto_603611 ?auto_603612 ?auto_603613 ?auto_603614 ?auto_603615 ?auto_603616 ?auto_603617 ?auto_603618 ?auto_603619 ?auto_603620 ?auto_603621 ?auto_603622 ?auto_603623 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_603674 - BLOCK
      ?auto_603675 - BLOCK
      ?auto_603676 - BLOCK
      ?auto_603677 - BLOCK
      ?auto_603678 - BLOCK
      ?auto_603679 - BLOCK
      ?auto_603680 - BLOCK
      ?auto_603681 - BLOCK
      ?auto_603682 - BLOCK
      ?auto_603683 - BLOCK
      ?auto_603684 - BLOCK
      ?auto_603685 - BLOCK
      ?auto_603686 - BLOCK
      ?auto_603687 - BLOCK
      ?auto_603688 - BLOCK
      ?auto_603689 - BLOCK
    )
    :vars
    (
      ?auto_603690 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_603689 ?auto_603690 ) ( ON-TABLE ?auto_603674 ) ( ON ?auto_603675 ?auto_603674 ) ( ON ?auto_603676 ?auto_603675 ) ( ON ?auto_603677 ?auto_603676 ) ( ON ?auto_603678 ?auto_603677 ) ( ON ?auto_603679 ?auto_603678 ) ( not ( = ?auto_603674 ?auto_603675 ) ) ( not ( = ?auto_603674 ?auto_603676 ) ) ( not ( = ?auto_603674 ?auto_603677 ) ) ( not ( = ?auto_603674 ?auto_603678 ) ) ( not ( = ?auto_603674 ?auto_603679 ) ) ( not ( = ?auto_603674 ?auto_603680 ) ) ( not ( = ?auto_603674 ?auto_603681 ) ) ( not ( = ?auto_603674 ?auto_603682 ) ) ( not ( = ?auto_603674 ?auto_603683 ) ) ( not ( = ?auto_603674 ?auto_603684 ) ) ( not ( = ?auto_603674 ?auto_603685 ) ) ( not ( = ?auto_603674 ?auto_603686 ) ) ( not ( = ?auto_603674 ?auto_603687 ) ) ( not ( = ?auto_603674 ?auto_603688 ) ) ( not ( = ?auto_603674 ?auto_603689 ) ) ( not ( = ?auto_603674 ?auto_603690 ) ) ( not ( = ?auto_603675 ?auto_603676 ) ) ( not ( = ?auto_603675 ?auto_603677 ) ) ( not ( = ?auto_603675 ?auto_603678 ) ) ( not ( = ?auto_603675 ?auto_603679 ) ) ( not ( = ?auto_603675 ?auto_603680 ) ) ( not ( = ?auto_603675 ?auto_603681 ) ) ( not ( = ?auto_603675 ?auto_603682 ) ) ( not ( = ?auto_603675 ?auto_603683 ) ) ( not ( = ?auto_603675 ?auto_603684 ) ) ( not ( = ?auto_603675 ?auto_603685 ) ) ( not ( = ?auto_603675 ?auto_603686 ) ) ( not ( = ?auto_603675 ?auto_603687 ) ) ( not ( = ?auto_603675 ?auto_603688 ) ) ( not ( = ?auto_603675 ?auto_603689 ) ) ( not ( = ?auto_603675 ?auto_603690 ) ) ( not ( = ?auto_603676 ?auto_603677 ) ) ( not ( = ?auto_603676 ?auto_603678 ) ) ( not ( = ?auto_603676 ?auto_603679 ) ) ( not ( = ?auto_603676 ?auto_603680 ) ) ( not ( = ?auto_603676 ?auto_603681 ) ) ( not ( = ?auto_603676 ?auto_603682 ) ) ( not ( = ?auto_603676 ?auto_603683 ) ) ( not ( = ?auto_603676 ?auto_603684 ) ) ( not ( = ?auto_603676 ?auto_603685 ) ) ( not ( = ?auto_603676 ?auto_603686 ) ) ( not ( = ?auto_603676 ?auto_603687 ) ) ( not ( = ?auto_603676 ?auto_603688 ) ) ( not ( = ?auto_603676 ?auto_603689 ) ) ( not ( = ?auto_603676 ?auto_603690 ) ) ( not ( = ?auto_603677 ?auto_603678 ) ) ( not ( = ?auto_603677 ?auto_603679 ) ) ( not ( = ?auto_603677 ?auto_603680 ) ) ( not ( = ?auto_603677 ?auto_603681 ) ) ( not ( = ?auto_603677 ?auto_603682 ) ) ( not ( = ?auto_603677 ?auto_603683 ) ) ( not ( = ?auto_603677 ?auto_603684 ) ) ( not ( = ?auto_603677 ?auto_603685 ) ) ( not ( = ?auto_603677 ?auto_603686 ) ) ( not ( = ?auto_603677 ?auto_603687 ) ) ( not ( = ?auto_603677 ?auto_603688 ) ) ( not ( = ?auto_603677 ?auto_603689 ) ) ( not ( = ?auto_603677 ?auto_603690 ) ) ( not ( = ?auto_603678 ?auto_603679 ) ) ( not ( = ?auto_603678 ?auto_603680 ) ) ( not ( = ?auto_603678 ?auto_603681 ) ) ( not ( = ?auto_603678 ?auto_603682 ) ) ( not ( = ?auto_603678 ?auto_603683 ) ) ( not ( = ?auto_603678 ?auto_603684 ) ) ( not ( = ?auto_603678 ?auto_603685 ) ) ( not ( = ?auto_603678 ?auto_603686 ) ) ( not ( = ?auto_603678 ?auto_603687 ) ) ( not ( = ?auto_603678 ?auto_603688 ) ) ( not ( = ?auto_603678 ?auto_603689 ) ) ( not ( = ?auto_603678 ?auto_603690 ) ) ( not ( = ?auto_603679 ?auto_603680 ) ) ( not ( = ?auto_603679 ?auto_603681 ) ) ( not ( = ?auto_603679 ?auto_603682 ) ) ( not ( = ?auto_603679 ?auto_603683 ) ) ( not ( = ?auto_603679 ?auto_603684 ) ) ( not ( = ?auto_603679 ?auto_603685 ) ) ( not ( = ?auto_603679 ?auto_603686 ) ) ( not ( = ?auto_603679 ?auto_603687 ) ) ( not ( = ?auto_603679 ?auto_603688 ) ) ( not ( = ?auto_603679 ?auto_603689 ) ) ( not ( = ?auto_603679 ?auto_603690 ) ) ( not ( = ?auto_603680 ?auto_603681 ) ) ( not ( = ?auto_603680 ?auto_603682 ) ) ( not ( = ?auto_603680 ?auto_603683 ) ) ( not ( = ?auto_603680 ?auto_603684 ) ) ( not ( = ?auto_603680 ?auto_603685 ) ) ( not ( = ?auto_603680 ?auto_603686 ) ) ( not ( = ?auto_603680 ?auto_603687 ) ) ( not ( = ?auto_603680 ?auto_603688 ) ) ( not ( = ?auto_603680 ?auto_603689 ) ) ( not ( = ?auto_603680 ?auto_603690 ) ) ( not ( = ?auto_603681 ?auto_603682 ) ) ( not ( = ?auto_603681 ?auto_603683 ) ) ( not ( = ?auto_603681 ?auto_603684 ) ) ( not ( = ?auto_603681 ?auto_603685 ) ) ( not ( = ?auto_603681 ?auto_603686 ) ) ( not ( = ?auto_603681 ?auto_603687 ) ) ( not ( = ?auto_603681 ?auto_603688 ) ) ( not ( = ?auto_603681 ?auto_603689 ) ) ( not ( = ?auto_603681 ?auto_603690 ) ) ( not ( = ?auto_603682 ?auto_603683 ) ) ( not ( = ?auto_603682 ?auto_603684 ) ) ( not ( = ?auto_603682 ?auto_603685 ) ) ( not ( = ?auto_603682 ?auto_603686 ) ) ( not ( = ?auto_603682 ?auto_603687 ) ) ( not ( = ?auto_603682 ?auto_603688 ) ) ( not ( = ?auto_603682 ?auto_603689 ) ) ( not ( = ?auto_603682 ?auto_603690 ) ) ( not ( = ?auto_603683 ?auto_603684 ) ) ( not ( = ?auto_603683 ?auto_603685 ) ) ( not ( = ?auto_603683 ?auto_603686 ) ) ( not ( = ?auto_603683 ?auto_603687 ) ) ( not ( = ?auto_603683 ?auto_603688 ) ) ( not ( = ?auto_603683 ?auto_603689 ) ) ( not ( = ?auto_603683 ?auto_603690 ) ) ( not ( = ?auto_603684 ?auto_603685 ) ) ( not ( = ?auto_603684 ?auto_603686 ) ) ( not ( = ?auto_603684 ?auto_603687 ) ) ( not ( = ?auto_603684 ?auto_603688 ) ) ( not ( = ?auto_603684 ?auto_603689 ) ) ( not ( = ?auto_603684 ?auto_603690 ) ) ( not ( = ?auto_603685 ?auto_603686 ) ) ( not ( = ?auto_603685 ?auto_603687 ) ) ( not ( = ?auto_603685 ?auto_603688 ) ) ( not ( = ?auto_603685 ?auto_603689 ) ) ( not ( = ?auto_603685 ?auto_603690 ) ) ( not ( = ?auto_603686 ?auto_603687 ) ) ( not ( = ?auto_603686 ?auto_603688 ) ) ( not ( = ?auto_603686 ?auto_603689 ) ) ( not ( = ?auto_603686 ?auto_603690 ) ) ( not ( = ?auto_603687 ?auto_603688 ) ) ( not ( = ?auto_603687 ?auto_603689 ) ) ( not ( = ?auto_603687 ?auto_603690 ) ) ( not ( = ?auto_603688 ?auto_603689 ) ) ( not ( = ?auto_603688 ?auto_603690 ) ) ( not ( = ?auto_603689 ?auto_603690 ) ) ( ON ?auto_603688 ?auto_603689 ) ( ON ?auto_603687 ?auto_603688 ) ( ON ?auto_603686 ?auto_603687 ) ( ON ?auto_603685 ?auto_603686 ) ( ON ?auto_603684 ?auto_603685 ) ( ON ?auto_603683 ?auto_603684 ) ( ON ?auto_603682 ?auto_603683 ) ( ON ?auto_603681 ?auto_603682 ) ( CLEAR ?auto_603679 ) ( ON ?auto_603680 ?auto_603681 ) ( CLEAR ?auto_603680 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_603674 ?auto_603675 ?auto_603676 ?auto_603677 ?auto_603678 ?auto_603679 ?auto_603680 )
      ( MAKE-16PILE ?auto_603674 ?auto_603675 ?auto_603676 ?auto_603677 ?auto_603678 ?auto_603679 ?auto_603680 ?auto_603681 ?auto_603682 ?auto_603683 ?auto_603684 ?auto_603685 ?auto_603686 ?auto_603687 ?auto_603688 ?auto_603689 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_603740 - BLOCK
      ?auto_603741 - BLOCK
      ?auto_603742 - BLOCK
      ?auto_603743 - BLOCK
      ?auto_603744 - BLOCK
      ?auto_603745 - BLOCK
      ?auto_603746 - BLOCK
      ?auto_603747 - BLOCK
      ?auto_603748 - BLOCK
      ?auto_603749 - BLOCK
      ?auto_603750 - BLOCK
      ?auto_603751 - BLOCK
      ?auto_603752 - BLOCK
      ?auto_603753 - BLOCK
      ?auto_603754 - BLOCK
      ?auto_603755 - BLOCK
    )
    :vars
    (
      ?auto_603756 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_603755 ?auto_603756 ) ( ON-TABLE ?auto_603740 ) ( ON ?auto_603741 ?auto_603740 ) ( ON ?auto_603742 ?auto_603741 ) ( ON ?auto_603743 ?auto_603742 ) ( ON ?auto_603744 ?auto_603743 ) ( not ( = ?auto_603740 ?auto_603741 ) ) ( not ( = ?auto_603740 ?auto_603742 ) ) ( not ( = ?auto_603740 ?auto_603743 ) ) ( not ( = ?auto_603740 ?auto_603744 ) ) ( not ( = ?auto_603740 ?auto_603745 ) ) ( not ( = ?auto_603740 ?auto_603746 ) ) ( not ( = ?auto_603740 ?auto_603747 ) ) ( not ( = ?auto_603740 ?auto_603748 ) ) ( not ( = ?auto_603740 ?auto_603749 ) ) ( not ( = ?auto_603740 ?auto_603750 ) ) ( not ( = ?auto_603740 ?auto_603751 ) ) ( not ( = ?auto_603740 ?auto_603752 ) ) ( not ( = ?auto_603740 ?auto_603753 ) ) ( not ( = ?auto_603740 ?auto_603754 ) ) ( not ( = ?auto_603740 ?auto_603755 ) ) ( not ( = ?auto_603740 ?auto_603756 ) ) ( not ( = ?auto_603741 ?auto_603742 ) ) ( not ( = ?auto_603741 ?auto_603743 ) ) ( not ( = ?auto_603741 ?auto_603744 ) ) ( not ( = ?auto_603741 ?auto_603745 ) ) ( not ( = ?auto_603741 ?auto_603746 ) ) ( not ( = ?auto_603741 ?auto_603747 ) ) ( not ( = ?auto_603741 ?auto_603748 ) ) ( not ( = ?auto_603741 ?auto_603749 ) ) ( not ( = ?auto_603741 ?auto_603750 ) ) ( not ( = ?auto_603741 ?auto_603751 ) ) ( not ( = ?auto_603741 ?auto_603752 ) ) ( not ( = ?auto_603741 ?auto_603753 ) ) ( not ( = ?auto_603741 ?auto_603754 ) ) ( not ( = ?auto_603741 ?auto_603755 ) ) ( not ( = ?auto_603741 ?auto_603756 ) ) ( not ( = ?auto_603742 ?auto_603743 ) ) ( not ( = ?auto_603742 ?auto_603744 ) ) ( not ( = ?auto_603742 ?auto_603745 ) ) ( not ( = ?auto_603742 ?auto_603746 ) ) ( not ( = ?auto_603742 ?auto_603747 ) ) ( not ( = ?auto_603742 ?auto_603748 ) ) ( not ( = ?auto_603742 ?auto_603749 ) ) ( not ( = ?auto_603742 ?auto_603750 ) ) ( not ( = ?auto_603742 ?auto_603751 ) ) ( not ( = ?auto_603742 ?auto_603752 ) ) ( not ( = ?auto_603742 ?auto_603753 ) ) ( not ( = ?auto_603742 ?auto_603754 ) ) ( not ( = ?auto_603742 ?auto_603755 ) ) ( not ( = ?auto_603742 ?auto_603756 ) ) ( not ( = ?auto_603743 ?auto_603744 ) ) ( not ( = ?auto_603743 ?auto_603745 ) ) ( not ( = ?auto_603743 ?auto_603746 ) ) ( not ( = ?auto_603743 ?auto_603747 ) ) ( not ( = ?auto_603743 ?auto_603748 ) ) ( not ( = ?auto_603743 ?auto_603749 ) ) ( not ( = ?auto_603743 ?auto_603750 ) ) ( not ( = ?auto_603743 ?auto_603751 ) ) ( not ( = ?auto_603743 ?auto_603752 ) ) ( not ( = ?auto_603743 ?auto_603753 ) ) ( not ( = ?auto_603743 ?auto_603754 ) ) ( not ( = ?auto_603743 ?auto_603755 ) ) ( not ( = ?auto_603743 ?auto_603756 ) ) ( not ( = ?auto_603744 ?auto_603745 ) ) ( not ( = ?auto_603744 ?auto_603746 ) ) ( not ( = ?auto_603744 ?auto_603747 ) ) ( not ( = ?auto_603744 ?auto_603748 ) ) ( not ( = ?auto_603744 ?auto_603749 ) ) ( not ( = ?auto_603744 ?auto_603750 ) ) ( not ( = ?auto_603744 ?auto_603751 ) ) ( not ( = ?auto_603744 ?auto_603752 ) ) ( not ( = ?auto_603744 ?auto_603753 ) ) ( not ( = ?auto_603744 ?auto_603754 ) ) ( not ( = ?auto_603744 ?auto_603755 ) ) ( not ( = ?auto_603744 ?auto_603756 ) ) ( not ( = ?auto_603745 ?auto_603746 ) ) ( not ( = ?auto_603745 ?auto_603747 ) ) ( not ( = ?auto_603745 ?auto_603748 ) ) ( not ( = ?auto_603745 ?auto_603749 ) ) ( not ( = ?auto_603745 ?auto_603750 ) ) ( not ( = ?auto_603745 ?auto_603751 ) ) ( not ( = ?auto_603745 ?auto_603752 ) ) ( not ( = ?auto_603745 ?auto_603753 ) ) ( not ( = ?auto_603745 ?auto_603754 ) ) ( not ( = ?auto_603745 ?auto_603755 ) ) ( not ( = ?auto_603745 ?auto_603756 ) ) ( not ( = ?auto_603746 ?auto_603747 ) ) ( not ( = ?auto_603746 ?auto_603748 ) ) ( not ( = ?auto_603746 ?auto_603749 ) ) ( not ( = ?auto_603746 ?auto_603750 ) ) ( not ( = ?auto_603746 ?auto_603751 ) ) ( not ( = ?auto_603746 ?auto_603752 ) ) ( not ( = ?auto_603746 ?auto_603753 ) ) ( not ( = ?auto_603746 ?auto_603754 ) ) ( not ( = ?auto_603746 ?auto_603755 ) ) ( not ( = ?auto_603746 ?auto_603756 ) ) ( not ( = ?auto_603747 ?auto_603748 ) ) ( not ( = ?auto_603747 ?auto_603749 ) ) ( not ( = ?auto_603747 ?auto_603750 ) ) ( not ( = ?auto_603747 ?auto_603751 ) ) ( not ( = ?auto_603747 ?auto_603752 ) ) ( not ( = ?auto_603747 ?auto_603753 ) ) ( not ( = ?auto_603747 ?auto_603754 ) ) ( not ( = ?auto_603747 ?auto_603755 ) ) ( not ( = ?auto_603747 ?auto_603756 ) ) ( not ( = ?auto_603748 ?auto_603749 ) ) ( not ( = ?auto_603748 ?auto_603750 ) ) ( not ( = ?auto_603748 ?auto_603751 ) ) ( not ( = ?auto_603748 ?auto_603752 ) ) ( not ( = ?auto_603748 ?auto_603753 ) ) ( not ( = ?auto_603748 ?auto_603754 ) ) ( not ( = ?auto_603748 ?auto_603755 ) ) ( not ( = ?auto_603748 ?auto_603756 ) ) ( not ( = ?auto_603749 ?auto_603750 ) ) ( not ( = ?auto_603749 ?auto_603751 ) ) ( not ( = ?auto_603749 ?auto_603752 ) ) ( not ( = ?auto_603749 ?auto_603753 ) ) ( not ( = ?auto_603749 ?auto_603754 ) ) ( not ( = ?auto_603749 ?auto_603755 ) ) ( not ( = ?auto_603749 ?auto_603756 ) ) ( not ( = ?auto_603750 ?auto_603751 ) ) ( not ( = ?auto_603750 ?auto_603752 ) ) ( not ( = ?auto_603750 ?auto_603753 ) ) ( not ( = ?auto_603750 ?auto_603754 ) ) ( not ( = ?auto_603750 ?auto_603755 ) ) ( not ( = ?auto_603750 ?auto_603756 ) ) ( not ( = ?auto_603751 ?auto_603752 ) ) ( not ( = ?auto_603751 ?auto_603753 ) ) ( not ( = ?auto_603751 ?auto_603754 ) ) ( not ( = ?auto_603751 ?auto_603755 ) ) ( not ( = ?auto_603751 ?auto_603756 ) ) ( not ( = ?auto_603752 ?auto_603753 ) ) ( not ( = ?auto_603752 ?auto_603754 ) ) ( not ( = ?auto_603752 ?auto_603755 ) ) ( not ( = ?auto_603752 ?auto_603756 ) ) ( not ( = ?auto_603753 ?auto_603754 ) ) ( not ( = ?auto_603753 ?auto_603755 ) ) ( not ( = ?auto_603753 ?auto_603756 ) ) ( not ( = ?auto_603754 ?auto_603755 ) ) ( not ( = ?auto_603754 ?auto_603756 ) ) ( not ( = ?auto_603755 ?auto_603756 ) ) ( ON ?auto_603754 ?auto_603755 ) ( ON ?auto_603753 ?auto_603754 ) ( ON ?auto_603752 ?auto_603753 ) ( ON ?auto_603751 ?auto_603752 ) ( ON ?auto_603750 ?auto_603751 ) ( ON ?auto_603749 ?auto_603750 ) ( ON ?auto_603748 ?auto_603749 ) ( ON ?auto_603747 ?auto_603748 ) ( ON ?auto_603746 ?auto_603747 ) ( CLEAR ?auto_603744 ) ( ON ?auto_603745 ?auto_603746 ) ( CLEAR ?auto_603745 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_603740 ?auto_603741 ?auto_603742 ?auto_603743 ?auto_603744 ?auto_603745 )
      ( MAKE-16PILE ?auto_603740 ?auto_603741 ?auto_603742 ?auto_603743 ?auto_603744 ?auto_603745 ?auto_603746 ?auto_603747 ?auto_603748 ?auto_603749 ?auto_603750 ?auto_603751 ?auto_603752 ?auto_603753 ?auto_603754 ?auto_603755 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_603806 - BLOCK
      ?auto_603807 - BLOCK
      ?auto_603808 - BLOCK
      ?auto_603809 - BLOCK
      ?auto_603810 - BLOCK
      ?auto_603811 - BLOCK
      ?auto_603812 - BLOCK
      ?auto_603813 - BLOCK
      ?auto_603814 - BLOCK
      ?auto_603815 - BLOCK
      ?auto_603816 - BLOCK
      ?auto_603817 - BLOCK
      ?auto_603818 - BLOCK
      ?auto_603819 - BLOCK
      ?auto_603820 - BLOCK
      ?auto_603821 - BLOCK
    )
    :vars
    (
      ?auto_603822 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_603821 ?auto_603822 ) ( ON-TABLE ?auto_603806 ) ( ON ?auto_603807 ?auto_603806 ) ( ON ?auto_603808 ?auto_603807 ) ( ON ?auto_603809 ?auto_603808 ) ( not ( = ?auto_603806 ?auto_603807 ) ) ( not ( = ?auto_603806 ?auto_603808 ) ) ( not ( = ?auto_603806 ?auto_603809 ) ) ( not ( = ?auto_603806 ?auto_603810 ) ) ( not ( = ?auto_603806 ?auto_603811 ) ) ( not ( = ?auto_603806 ?auto_603812 ) ) ( not ( = ?auto_603806 ?auto_603813 ) ) ( not ( = ?auto_603806 ?auto_603814 ) ) ( not ( = ?auto_603806 ?auto_603815 ) ) ( not ( = ?auto_603806 ?auto_603816 ) ) ( not ( = ?auto_603806 ?auto_603817 ) ) ( not ( = ?auto_603806 ?auto_603818 ) ) ( not ( = ?auto_603806 ?auto_603819 ) ) ( not ( = ?auto_603806 ?auto_603820 ) ) ( not ( = ?auto_603806 ?auto_603821 ) ) ( not ( = ?auto_603806 ?auto_603822 ) ) ( not ( = ?auto_603807 ?auto_603808 ) ) ( not ( = ?auto_603807 ?auto_603809 ) ) ( not ( = ?auto_603807 ?auto_603810 ) ) ( not ( = ?auto_603807 ?auto_603811 ) ) ( not ( = ?auto_603807 ?auto_603812 ) ) ( not ( = ?auto_603807 ?auto_603813 ) ) ( not ( = ?auto_603807 ?auto_603814 ) ) ( not ( = ?auto_603807 ?auto_603815 ) ) ( not ( = ?auto_603807 ?auto_603816 ) ) ( not ( = ?auto_603807 ?auto_603817 ) ) ( not ( = ?auto_603807 ?auto_603818 ) ) ( not ( = ?auto_603807 ?auto_603819 ) ) ( not ( = ?auto_603807 ?auto_603820 ) ) ( not ( = ?auto_603807 ?auto_603821 ) ) ( not ( = ?auto_603807 ?auto_603822 ) ) ( not ( = ?auto_603808 ?auto_603809 ) ) ( not ( = ?auto_603808 ?auto_603810 ) ) ( not ( = ?auto_603808 ?auto_603811 ) ) ( not ( = ?auto_603808 ?auto_603812 ) ) ( not ( = ?auto_603808 ?auto_603813 ) ) ( not ( = ?auto_603808 ?auto_603814 ) ) ( not ( = ?auto_603808 ?auto_603815 ) ) ( not ( = ?auto_603808 ?auto_603816 ) ) ( not ( = ?auto_603808 ?auto_603817 ) ) ( not ( = ?auto_603808 ?auto_603818 ) ) ( not ( = ?auto_603808 ?auto_603819 ) ) ( not ( = ?auto_603808 ?auto_603820 ) ) ( not ( = ?auto_603808 ?auto_603821 ) ) ( not ( = ?auto_603808 ?auto_603822 ) ) ( not ( = ?auto_603809 ?auto_603810 ) ) ( not ( = ?auto_603809 ?auto_603811 ) ) ( not ( = ?auto_603809 ?auto_603812 ) ) ( not ( = ?auto_603809 ?auto_603813 ) ) ( not ( = ?auto_603809 ?auto_603814 ) ) ( not ( = ?auto_603809 ?auto_603815 ) ) ( not ( = ?auto_603809 ?auto_603816 ) ) ( not ( = ?auto_603809 ?auto_603817 ) ) ( not ( = ?auto_603809 ?auto_603818 ) ) ( not ( = ?auto_603809 ?auto_603819 ) ) ( not ( = ?auto_603809 ?auto_603820 ) ) ( not ( = ?auto_603809 ?auto_603821 ) ) ( not ( = ?auto_603809 ?auto_603822 ) ) ( not ( = ?auto_603810 ?auto_603811 ) ) ( not ( = ?auto_603810 ?auto_603812 ) ) ( not ( = ?auto_603810 ?auto_603813 ) ) ( not ( = ?auto_603810 ?auto_603814 ) ) ( not ( = ?auto_603810 ?auto_603815 ) ) ( not ( = ?auto_603810 ?auto_603816 ) ) ( not ( = ?auto_603810 ?auto_603817 ) ) ( not ( = ?auto_603810 ?auto_603818 ) ) ( not ( = ?auto_603810 ?auto_603819 ) ) ( not ( = ?auto_603810 ?auto_603820 ) ) ( not ( = ?auto_603810 ?auto_603821 ) ) ( not ( = ?auto_603810 ?auto_603822 ) ) ( not ( = ?auto_603811 ?auto_603812 ) ) ( not ( = ?auto_603811 ?auto_603813 ) ) ( not ( = ?auto_603811 ?auto_603814 ) ) ( not ( = ?auto_603811 ?auto_603815 ) ) ( not ( = ?auto_603811 ?auto_603816 ) ) ( not ( = ?auto_603811 ?auto_603817 ) ) ( not ( = ?auto_603811 ?auto_603818 ) ) ( not ( = ?auto_603811 ?auto_603819 ) ) ( not ( = ?auto_603811 ?auto_603820 ) ) ( not ( = ?auto_603811 ?auto_603821 ) ) ( not ( = ?auto_603811 ?auto_603822 ) ) ( not ( = ?auto_603812 ?auto_603813 ) ) ( not ( = ?auto_603812 ?auto_603814 ) ) ( not ( = ?auto_603812 ?auto_603815 ) ) ( not ( = ?auto_603812 ?auto_603816 ) ) ( not ( = ?auto_603812 ?auto_603817 ) ) ( not ( = ?auto_603812 ?auto_603818 ) ) ( not ( = ?auto_603812 ?auto_603819 ) ) ( not ( = ?auto_603812 ?auto_603820 ) ) ( not ( = ?auto_603812 ?auto_603821 ) ) ( not ( = ?auto_603812 ?auto_603822 ) ) ( not ( = ?auto_603813 ?auto_603814 ) ) ( not ( = ?auto_603813 ?auto_603815 ) ) ( not ( = ?auto_603813 ?auto_603816 ) ) ( not ( = ?auto_603813 ?auto_603817 ) ) ( not ( = ?auto_603813 ?auto_603818 ) ) ( not ( = ?auto_603813 ?auto_603819 ) ) ( not ( = ?auto_603813 ?auto_603820 ) ) ( not ( = ?auto_603813 ?auto_603821 ) ) ( not ( = ?auto_603813 ?auto_603822 ) ) ( not ( = ?auto_603814 ?auto_603815 ) ) ( not ( = ?auto_603814 ?auto_603816 ) ) ( not ( = ?auto_603814 ?auto_603817 ) ) ( not ( = ?auto_603814 ?auto_603818 ) ) ( not ( = ?auto_603814 ?auto_603819 ) ) ( not ( = ?auto_603814 ?auto_603820 ) ) ( not ( = ?auto_603814 ?auto_603821 ) ) ( not ( = ?auto_603814 ?auto_603822 ) ) ( not ( = ?auto_603815 ?auto_603816 ) ) ( not ( = ?auto_603815 ?auto_603817 ) ) ( not ( = ?auto_603815 ?auto_603818 ) ) ( not ( = ?auto_603815 ?auto_603819 ) ) ( not ( = ?auto_603815 ?auto_603820 ) ) ( not ( = ?auto_603815 ?auto_603821 ) ) ( not ( = ?auto_603815 ?auto_603822 ) ) ( not ( = ?auto_603816 ?auto_603817 ) ) ( not ( = ?auto_603816 ?auto_603818 ) ) ( not ( = ?auto_603816 ?auto_603819 ) ) ( not ( = ?auto_603816 ?auto_603820 ) ) ( not ( = ?auto_603816 ?auto_603821 ) ) ( not ( = ?auto_603816 ?auto_603822 ) ) ( not ( = ?auto_603817 ?auto_603818 ) ) ( not ( = ?auto_603817 ?auto_603819 ) ) ( not ( = ?auto_603817 ?auto_603820 ) ) ( not ( = ?auto_603817 ?auto_603821 ) ) ( not ( = ?auto_603817 ?auto_603822 ) ) ( not ( = ?auto_603818 ?auto_603819 ) ) ( not ( = ?auto_603818 ?auto_603820 ) ) ( not ( = ?auto_603818 ?auto_603821 ) ) ( not ( = ?auto_603818 ?auto_603822 ) ) ( not ( = ?auto_603819 ?auto_603820 ) ) ( not ( = ?auto_603819 ?auto_603821 ) ) ( not ( = ?auto_603819 ?auto_603822 ) ) ( not ( = ?auto_603820 ?auto_603821 ) ) ( not ( = ?auto_603820 ?auto_603822 ) ) ( not ( = ?auto_603821 ?auto_603822 ) ) ( ON ?auto_603820 ?auto_603821 ) ( ON ?auto_603819 ?auto_603820 ) ( ON ?auto_603818 ?auto_603819 ) ( ON ?auto_603817 ?auto_603818 ) ( ON ?auto_603816 ?auto_603817 ) ( ON ?auto_603815 ?auto_603816 ) ( ON ?auto_603814 ?auto_603815 ) ( ON ?auto_603813 ?auto_603814 ) ( ON ?auto_603812 ?auto_603813 ) ( ON ?auto_603811 ?auto_603812 ) ( CLEAR ?auto_603809 ) ( ON ?auto_603810 ?auto_603811 ) ( CLEAR ?auto_603810 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_603806 ?auto_603807 ?auto_603808 ?auto_603809 ?auto_603810 )
      ( MAKE-16PILE ?auto_603806 ?auto_603807 ?auto_603808 ?auto_603809 ?auto_603810 ?auto_603811 ?auto_603812 ?auto_603813 ?auto_603814 ?auto_603815 ?auto_603816 ?auto_603817 ?auto_603818 ?auto_603819 ?auto_603820 ?auto_603821 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_603872 - BLOCK
      ?auto_603873 - BLOCK
      ?auto_603874 - BLOCK
      ?auto_603875 - BLOCK
      ?auto_603876 - BLOCK
      ?auto_603877 - BLOCK
      ?auto_603878 - BLOCK
      ?auto_603879 - BLOCK
      ?auto_603880 - BLOCK
      ?auto_603881 - BLOCK
      ?auto_603882 - BLOCK
      ?auto_603883 - BLOCK
      ?auto_603884 - BLOCK
      ?auto_603885 - BLOCK
      ?auto_603886 - BLOCK
      ?auto_603887 - BLOCK
    )
    :vars
    (
      ?auto_603888 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_603887 ?auto_603888 ) ( ON-TABLE ?auto_603872 ) ( ON ?auto_603873 ?auto_603872 ) ( ON ?auto_603874 ?auto_603873 ) ( not ( = ?auto_603872 ?auto_603873 ) ) ( not ( = ?auto_603872 ?auto_603874 ) ) ( not ( = ?auto_603872 ?auto_603875 ) ) ( not ( = ?auto_603872 ?auto_603876 ) ) ( not ( = ?auto_603872 ?auto_603877 ) ) ( not ( = ?auto_603872 ?auto_603878 ) ) ( not ( = ?auto_603872 ?auto_603879 ) ) ( not ( = ?auto_603872 ?auto_603880 ) ) ( not ( = ?auto_603872 ?auto_603881 ) ) ( not ( = ?auto_603872 ?auto_603882 ) ) ( not ( = ?auto_603872 ?auto_603883 ) ) ( not ( = ?auto_603872 ?auto_603884 ) ) ( not ( = ?auto_603872 ?auto_603885 ) ) ( not ( = ?auto_603872 ?auto_603886 ) ) ( not ( = ?auto_603872 ?auto_603887 ) ) ( not ( = ?auto_603872 ?auto_603888 ) ) ( not ( = ?auto_603873 ?auto_603874 ) ) ( not ( = ?auto_603873 ?auto_603875 ) ) ( not ( = ?auto_603873 ?auto_603876 ) ) ( not ( = ?auto_603873 ?auto_603877 ) ) ( not ( = ?auto_603873 ?auto_603878 ) ) ( not ( = ?auto_603873 ?auto_603879 ) ) ( not ( = ?auto_603873 ?auto_603880 ) ) ( not ( = ?auto_603873 ?auto_603881 ) ) ( not ( = ?auto_603873 ?auto_603882 ) ) ( not ( = ?auto_603873 ?auto_603883 ) ) ( not ( = ?auto_603873 ?auto_603884 ) ) ( not ( = ?auto_603873 ?auto_603885 ) ) ( not ( = ?auto_603873 ?auto_603886 ) ) ( not ( = ?auto_603873 ?auto_603887 ) ) ( not ( = ?auto_603873 ?auto_603888 ) ) ( not ( = ?auto_603874 ?auto_603875 ) ) ( not ( = ?auto_603874 ?auto_603876 ) ) ( not ( = ?auto_603874 ?auto_603877 ) ) ( not ( = ?auto_603874 ?auto_603878 ) ) ( not ( = ?auto_603874 ?auto_603879 ) ) ( not ( = ?auto_603874 ?auto_603880 ) ) ( not ( = ?auto_603874 ?auto_603881 ) ) ( not ( = ?auto_603874 ?auto_603882 ) ) ( not ( = ?auto_603874 ?auto_603883 ) ) ( not ( = ?auto_603874 ?auto_603884 ) ) ( not ( = ?auto_603874 ?auto_603885 ) ) ( not ( = ?auto_603874 ?auto_603886 ) ) ( not ( = ?auto_603874 ?auto_603887 ) ) ( not ( = ?auto_603874 ?auto_603888 ) ) ( not ( = ?auto_603875 ?auto_603876 ) ) ( not ( = ?auto_603875 ?auto_603877 ) ) ( not ( = ?auto_603875 ?auto_603878 ) ) ( not ( = ?auto_603875 ?auto_603879 ) ) ( not ( = ?auto_603875 ?auto_603880 ) ) ( not ( = ?auto_603875 ?auto_603881 ) ) ( not ( = ?auto_603875 ?auto_603882 ) ) ( not ( = ?auto_603875 ?auto_603883 ) ) ( not ( = ?auto_603875 ?auto_603884 ) ) ( not ( = ?auto_603875 ?auto_603885 ) ) ( not ( = ?auto_603875 ?auto_603886 ) ) ( not ( = ?auto_603875 ?auto_603887 ) ) ( not ( = ?auto_603875 ?auto_603888 ) ) ( not ( = ?auto_603876 ?auto_603877 ) ) ( not ( = ?auto_603876 ?auto_603878 ) ) ( not ( = ?auto_603876 ?auto_603879 ) ) ( not ( = ?auto_603876 ?auto_603880 ) ) ( not ( = ?auto_603876 ?auto_603881 ) ) ( not ( = ?auto_603876 ?auto_603882 ) ) ( not ( = ?auto_603876 ?auto_603883 ) ) ( not ( = ?auto_603876 ?auto_603884 ) ) ( not ( = ?auto_603876 ?auto_603885 ) ) ( not ( = ?auto_603876 ?auto_603886 ) ) ( not ( = ?auto_603876 ?auto_603887 ) ) ( not ( = ?auto_603876 ?auto_603888 ) ) ( not ( = ?auto_603877 ?auto_603878 ) ) ( not ( = ?auto_603877 ?auto_603879 ) ) ( not ( = ?auto_603877 ?auto_603880 ) ) ( not ( = ?auto_603877 ?auto_603881 ) ) ( not ( = ?auto_603877 ?auto_603882 ) ) ( not ( = ?auto_603877 ?auto_603883 ) ) ( not ( = ?auto_603877 ?auto_603884 ) ) ( not ( = ?auto_603877 ?auto_603885 ) ) ( not ( = ?auto_603877 ?auto_603886 ) ) ( not ( = ?auto_603877 ?auto_603887 ) ) ( not ( = ?auto_603877 ?auto_603888 ) ) ( not ( = ?auto_603878 ?auto_603879 ) ) ( not ( = ?auto_603878 ?auto_603880 ) ) ( not ( = ?auto_603878 ?auto_603881 ) ) ( not ( = ?auto_603878 ?auto_603882 ) ) ( not ( = ?auto_603878 ?auto_603883 ) ) ( not ( = ?auto_603878 ?auto_603884 ) ) ( not ( = ?auto_603878 ?auto_603885 ) ) ( not ( = ?auto_603878 ?auto_603886 ) ) ( not ( = ?auto_603878 ?auto_603887 ) ) ( not ( = ?auto_603878 ?auto_603888 ) ) ( not ( = ?auto_603879 ?auto_603880 ) ) ( not ( = ?auto_603879 ?auto_603881 ) ) ( not ( = ?auto_603879 ?auto_603882 ) ) ( not ( = ?auto_603879 ?auto_603883 ) ) ( not ( = ?auto_603879 ?auto_603884 ) ) ( not ( = ?auto_603879 ?auto_603885 ) ) ( not ( = ?auto_603879 ?auto_603886 ) ) ( not ( = ?auto_603879 ?auto_603887 ) ) ( not ( = ?auto_603879 ?auto_603888 ) ) ( not ( = ?auto_603880 ?auto_603881 ) ) ( not ( = ?auto_603880 ?auto_603882 ) ) ( not ( = ?auto_603880 ?auto_603883 ) ) ( not ( = ?auto_603880 ?auto_603884 ) ) ( not ( = ?auto_603880 ?auto_603885 ) ) ( not ( = ?auto_603880 ?auto_603886 ) ) ( not ( = ?auto_603880 ?auto_603887 ) ) ( not ( = ?auto_603880 ?auto_603888 ) ) ( not ( = ?auto_603881 ?auto_603882 ) ) ( not ( = ?auto_603881 ?auto_603883 ) ) ( not ( = ?auto_603881 ?auto_603884 ) ) ( not ( = ?auto_603881 ?auto_603885 ) ) ( not ( = ?auto_603881 ?auto_603886 ) ) ( not ( = ?auto_603881 ?auto_603887 ) ) ( not ( = ?auto_603881 ?auto_603888 ) ) ( not ( = ?auto_603882 ?auto_603883 ) ) ( not ( = ?auto_603882 ?auto_603884 ) ) ( not ( = ?auto_603882 ?auto_603885 ) ) ( not ( = ?auto_603882 ?auto_603886 ) ) ( not ( = ?auto_603882 ?auto_603887 ) ) ( not ( = ?auto_603882 ?auto_603888 ) ) ( not ( = ?auto_603883 ?auto_603884 ) ) ( not ( = ?auto_603883 ?auto_603885 ) ) ( not ( = ?auto_603883 ?auto_603886 ) ) ( not ( = ?auto_603883 ?auto_603887 ) ) ( not ( = ?auto_603883 ?auto_603888 ) ) ( not ( = ?auto_603884 ?auto_603885 ) ) ( not ( = ?auto_603884 ?auto_603886 ) ) ( not ( = ?auto_603884 ?auto_603887 ) ) ( not ( = ?auto_603884 ?auto_603888 ) ) ( not ( = ?auto_603885 ?auto_603886 ) ) ( not ( = ?auto_603885 ?auto_603887 ) ) ( not ( = ?auto_603885 ?auto_603888 ) ) ( not ( = ?auto_603886 ?auto_603887 ) ) ( not ( = ?auto_603886 ?auto_603888 ) ) ( not ( = ?auto_603887 ?auto_603888 ) ) ( ON ?auto_603886 ?auto_603887 ) ( ON ?auto_603885 ?auto_603886 ) ( ON ?auto_603884 ?auto_603885 ) ( ON ?auto_603883 ?auto_603884 ) ( ON ?auto_603882 ?auto_603883 ) ( ON ?auto_603881 ?auto_603882 ) ( ON ?auto_603880 ?auto_603881 ) ( ON ?auto_603879 ?auto_603880 ) ( ON ?auto_603878 ?auto_603879 ) ( ON ?auto_603877 ?auto_603878 ) ( ON ?auto_603876 ?auto_603877 ) ( CLEAR ?auto_603874 ) ( ON ?auto_603875 ?auto_603876 ) ( CLEAR ?auto_603875 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_603872 ?auto_603873 ?auto_603874 ?auto_603875 )
      ( MAKE-16PILE ?auto_603872 ?auto_603873 ?auto_603874 ?auto_603875 ?auto_603876 ?auto_603877 ?auto_603878 ?auto_603879 ?auto_603880 ?auto_603881 ?auto_603882 ?auto_603883 ?auto_603884 ?auto_603885 ?auto_603886 ?auto_603887 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_603938 - BLOCK
      ?auto_603939 - BLOCK
      ?auto_603940 - BLOCK
      ?auto_603941 - BLOCK
      ?auto_603942 - BLOCK
      ?auto_603943 - BLOCK
      ?auto_603944 - BLOCK
      ?auto_603945 - BLOCK
      ?auto_603946 - BLOCK
      ?auto_603947 - BLOCK
      ?auto_603948 - BLOCK
      ?auto_603949 - BLOCK
      ?auto_603950 - BLOCK
      ?auto_603951 - BLOCK
      ?auto_603952 - BLOCK
      ?auto_603953 - BLOCK
    )
    :vars
    (
      ?auto_603954 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_603953 ?auto_603954 ) ( ON-TABLE ?auto_603938 ) ( ON ?auto_603939 ?auto_603938 ) ( not ( = ?auto_603938 ?auto_603939 ) ) ( not ( = ?auto_603938 ?auto_603940 ) ) ( not ( = ?auto_603938 ?auto_603941 ) ) ( not ( = ?auto_603938 ?auto_603942 ) ) ( not ( = ?auto_603938 ?auto_603943 ) ) ( not ( = ?auto_603938 ?auto_603944 ) ) ( not ( = ?auto_603938 ?auto_603945 ) ) ( not ( = ?auto_603938 ?auto_603946 ) ) ( not ( = ?auto_603938 ?auto_603947 ) ) ( not ( = ?auto_603938 ?auto_603948 ) ) ( not ( = ?auto_603938 ?auto_603949 ) ) ( not ( = ?auto_603938 ?auto_603950 ) ) ( not ( = ?auto_603938 ?auto_603951 ) ) ( not ( = ?auto_603938 ?auto_603952 ) ) ( not ( = ?auto_603938 ?auto_603953 ) ) ( not ( = ?auto_603938 ?auto_603954 ) ) ( not ( = ?auto_603939 ?auto_603940 ) ) ( not ( = ?auto_603939 ?auto_603941 ) ) ( not ( = ?auto_603939 ?auto_603942 ) ) ( not ( = ?auto_603939 ?auto_603943 ) ) ( not ( = ?auto_603939 ?auto_603944 ) ) ( not ( = ?auto_603939 ?auto_603945 ) ) ( not ( = ?auto_603939 ?auto_603946 ) ) ( not ( = ?auto_603939 ?auto_603947 ) ) ( not ( = ?auto_603939 ?auto_603948 ) ) ( not ( = ?auto_603939 ?auto_603949 ) ) ( not ( = ?auto_603939 ?auto_603950 ) ) ( not ( = ?auto_603939 ?auto_603951 ) ) ( not ( = ?auto_603939 ?auto_603952 ) ) ( not ( = ?auto_603939 ?auto_603953 ) ) ( not ( = ?auto_603939 ?auto_603954 ) ) ( not ( = ?auto_603940 ?auto_603941 ) ) ( not ( = ?auto_603940 ?auto_603942 ) ) ( not ( = ?auto_603940 ?auto_603943 ) ) ( not ( = ?auto_603940 ?auto_603944 ) ) ( not ( = ?auto_603940 ?auto_603945 ) ) ( not ( = ?auto_603940 ?auto_603946 ) ) ( not ( = ?auto_603940 ?auto_603947 ) ) ( not ( = ?auto_603940 ?auto_603948 ) ) ( not ( = ?auto_603940 ?auto_603949 ) ) ( not ( = ?auto_603940 ?auto_603950 ) ) ( not ( = ?auto_603940 ?auto_603951 ) ) ( not ( = ?auto_603940 ?auto_603952 ) ) ( not ( = ?auto_603940 ?auto_603953 ) ) ( not ( = ?auto_603940 ?auto_603954 ) ) ( not ( = ?auto_603941 ?auto_603942 ) ) ( not ( = ?auto_603941 ?auto_603943 ) ) ( not ( = ?auto_603941 ?auto_603944 ) ) ( not ( = ?auto_603941 ?auto_603945 ) ) ( not ( = ?auto_603941 ?auto_603946 ) ) ( not ( = ?auto_603941 ?auto_603947 ) ) ( not ( = ?auto_603941 ?auto_603948 ) ) ( not ( = ?auto_603941 ?auto_603949 ) ) ( not ( = ?auto_603941 ?auto_603950 ) ) ( not ( = ?auto_603941 ?auto_603951 ) ) ( not ( = ?auto_603941 ?auto_603952 ) ) ( not ( = ?auto_603941 ?auto_603953 ) ) ( not ( = ?auto_603941 ?auto_603954 ) ) ( not ( = ?auto_603942 ?auto_603943 ) ) ( not ( = ?auto_603942 ?auto_603944 ) ) ( not ( = ?auto_603942 ?auto_603945 ) ) ( not ( = ?auto_603942 ?auto_603946 ) ) ( not ( = ?auto_603942 ?auto_603947 ) ) ( not ( = ?auto_603942 ?auto_603948 ) ) ( not ( = ?auto_603942 ?auto_603949 ) ) ( not ( = ?auto_603942 ?auto_603950 ) ) ( not ( = ?auto_603942 ?auto_603951 ) ) ( not ( = ?auto_603942 ?auto_603952 ) ) ( not ( = ?auto_603942 ?auto_603953 ) ) ( not ( = ?auto_603942 ?auto_603954 ) ) ( not ( = ?auto_603943 ?auto_603944 ) ) ( not ( = ?auto_603943 ?auto_603945 ) ) ( not ( = ?auto_603943 ?auto_603946 ) ) ( not ( = ?auto_603943 ?auto_603947 ) ) ( not ( = ?auto_603943 ?auto_603948 ) ) ( not ( = ?auto_603943 ?auto_603949 ) ) ( not ( = ?auto_603943 ?auto_603950 ) ) ( not ( = ?auto_603943 ?auto_603951 ) ) ( not ( = ?auto_603943 ?auto_603952 ) ) ( not ( = ?auto_603943 ?auto_603953 ) ) ( not ( = ?auto_603943 ?auto_603954 ) ) ( not ( = ?auto_603944 ?auto_603945 ) ) ( not ( = ?auto_603944 ?auto_603946 ) ) ( not ( = ?auto_603944 ?auto_603947 ) ) ( not ( = ?auto_603944 ?auto_603948 ) ) ( not ( = ?auto_603944 ?auto_603949 ) ) ( not ( = ?auto_603944 ?auto_603950 ) ) ( not ( = ?auto_603944 ?auto_603951 ) ) ( not ( = ?auto_603944 ?auto_603952 ) ) ( not ( = ?auto_603944 ?auto_603953 ) ) ( not ( = ?auto_603944 ?auto_603954 ) ) ( not ( = ?auto_603945 ?auto_603946 ) ) ( not ( = ?auto_603945 ?auto_603947 ) ) ( not ( = ?auto_603945 ?auto_603948 ) ) ( not ( = ?auto_603945 ?auto_603949 ) ) ( not ( = ?auto_603945 ?auto_603950 ) ) ( not ( = ?auto_603945 ?auto_603951 ) ) ( not ( = ?auto_603945 ?auto_603952 ) ) ( not ( = ?auto_603945 ?auto_603953 ) ) ( not ( = ?auto_603945 ?auto_603954 ) ) ( not ( = ?auto_603946 ?auto_603947 ) ) ( not ( = ?auto_603946 ?auto_603948 ) ) ( not ( = ?auto_603946 ?auto_603949 ) ) ( not ( = ?auto_603946 ?auto_603950 ) ) ( not ( = ?auto_603946 ?auto_603951 ) ) ( not ( = ?auto_603946 ?auto_603952 ) ) ( not ( = ?auto_603946 ?auto_603953 ) ) ( not ( = ?auto_603946 ?auto_603954 ) ) ( not ( = ?auto_603947 ?auto_603948 ) ) ( not ( = ?auto_603947 ?auto_603949 ) ) ( not ( = ?auto_603947 ?auto_603950 ) ) ( not ( = ?auto_603947 ?auto_603951 ) ) ( not ( = ?auto_603947 ?auto_603952 ) ) ( not ( = ?auto_603947 ?auto_603953 ) ) ( not ( = ?auto_603947 ?auto_603954 ) ) ( not ( = ?auto_603948 ?auto_603949 ) ) ( not ( = ?auto_603948 ?auto_603950 ) ) ( not ( = ?auto_603948 ?auto_603951 ) ) ( not ( = ?auto_603948 ?auto_603952 ) ) ( not ( = ?auto_603948 ?auto_603953 ) ) ( not ( = ?auto_603948 ?auto_603954 ) ) ( not ( = ?auto_603949 ?auto_603950 ) ) ( not ( = ?auto_603949 ?auto_603951 ) ) ( not ( = ?auto_603949 ?auto_603952 ) ) ( not ( = ?auto_603949 ?auto_603953 ) ) ( not ( = ?auto_603949 ?auto_603954 ) ) ( not ( = ?auto_603950 ?auto_603951 ) ) ( not ( = ?auto_603950 ?auto_603952 ) ) ( not ( = ?auto_603950 ?auto_603953 ) ) ( not ( = ?auto_603950 ?auto_603954 ) ) ( not ( = ?auto_603951 ?auto_603952 ) ) ( not ( = ?auto_603951 ?auto_603953 ) ) ( not ( = ?auto_603951 ?auto_603954 ) ) ( not ( = ?auto_603952 ?auto_603953 ) ) ( not ( = ?auto_603952 ?auto_603954 ) ) ( not ( = ?auto_603953 ?auto_603954 ) ) ( ON ?auto_603952 ?auto_603953 ) ( ON ?auto_603951 ?auto_603952 ) ( ON ?auto_603950 ?auto_603951 ) ( ON ?auto_603949 ?auto_603950 ) ( ON ?auto_603948 ?auto_603949 ) ( ON ?auto_603947 ?auto_603948 ) ( ON ?auto_603946 ?auto_603947 ) ( ON ?auto_603945 ?auto_603946 ) ( ON ?auto_603944 ?auto_603945 ) ( ON ?auto_603943 ?auto_603944 ) ( ON ?auto_603942 ?auto_603943 ) ( ON ?auto_603941 ?auto_603942 ) ( CLEAR ?auto_603939 ) ( ON ?auto_603940 ?auto_603941 ) ( CLEAR ?auto_603940 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_603938 ?auto_603939 ?auto_603940 )
      ( MAKE-16PILE ?auto_603938 ?auto_603939 ?auto_603940 ?auto_603941 ?auto_603942 ?auto_603943 ?auto_603944 ?auto_603945 ?auto_603946 ?auto_603947 ?auto_603948 ?auto_603949 ?auto_603950 ?auto_603951 ?auto_603952 ?auto_603953 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_604004 - BLOCK
      ?auto_604005 - BLOCK
      ?auto_604006 - BLOCK
      ?auto_604007 - BLOCK
      ?auto_604008 - BLOCK
      ?auto_604009 - BLOCK
      ?auto_604010 - BLOCK
      ?auto_604011 - BLOCK
      ?auto_604012 - BLOCK
      ?auto_604013 - BLOCK
      ?auto_604014 - BLOCK
      ?auto_604015 - BLOCK
      ?auto_604016 - BLOCK
      ?auto_604017 - BLOCK
      ?auto_604018 - BLOCK
      ?auto_604019 - BLOCK
    )
    :vars
    (
      ?auto_604020 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_604019 ?auto_604020 ) ( ON-TABLE ?auto_604004 ) ( not ( = ?auto_604004 ?auto_604005 ) ) ( not ( = ?auto_604004 ?auto_604006 ) ) ( not ( = ?auto_604004 ?auto_604007 ) ) ( not ( = ?auto_604004 ?auto_604008 ) ) ( not ( = ?auto_604004 ?auto_604009 ) ) ( not ( = ?auto_604004 ?auto_604010 ) ) ( not ( = ?auto_604004 ?auto_604011 ) ) ( not ( = ?auto_604004 ?auto_604012 ) ) ( not ( = ?auto_604004 ?auto_604013 ) ) ( not ( = ?auto_604004 ?auto_604014 ) ) ( not ( = ?auto_604004 ?auto_604015 ) ) ( not ( = ?auto_604004 ?auto_604016 ) ) ( not ( = ?auto_604004 ?auto_604017 ) ) ( not ( = ?auto_604004 ?auto_604018 ) ) ( not ( = ?auto_604004 ?auto_604019 ) ) ( not ( = ?auto_604004 ?auto_604020 ) ) ( not ( = ?auto_604005 ?auto_604006 ) ) ( not ( = ?auto_604005 ?auto_604007 ) ) ( not ( = ?auto_604005 ?auto_604008 ) ) ( not ( = ?auto_604005 ?auto_604009 ) ) ( not ( = ?auto_604005 ?auto_604010 ) ) ( not ( = ?auto_604005 ?auto_604011 ) ) ( not ( = ?auto_604005 ?auto_604012 ) ) ( not ( = ?auto_604005 ?auto_604013 ) ) ( not ( = ?auto_604005 ?auto_604014 ) ) ( not ( = ?auto_604005 ?auto_604015 ) ) ( not ( = ?auto_604005 ?auto_604016 ) ) ( not ( = ?auto_604005 ?auto_604017 ) ) ( not ( = ?auto_604005 ?auto_604018 ) ) ( not ( = ?auto_604005 ?auto_604019 ) ) ( not ( = ?auto_604005 ?auto_604020 ) ) ( not ( = ?auto_604006 ?auto_604007 ) ) ( not ( = ?auto_604006 ?auto_604008 ) ) ( not ( = ?auto_604006 ?auto_604009 ) ) ( not ( = ?auto_604006 ?auto_604010 ) ) ( not ( = ?auto_604006 ?auto_604011 ) ) ( not ( = ?auto_604006 ?auto_604012 ) ) ( not ( = ?auto_604006 ?auto_604013 ) ) ( not ( = ?auto_604006 ?auto_604014 ) ) ( not ( = ?auto_604006 ?auto_604015 ) ) ( not ( = ?auto_604006 ?auto_604016 ) ) ( not ( = ?auto_604006 ?auto_604017 ) ) ( not ( = ?auto_604006 ?auto_604018 ) ) ( not ( = ?auto_604006 ?auto_604019 ) ) ( not ( = ?auto_604006 ?auto_604020 ) ) ( not ( = ?auto_604007 ?auto_604008 ) ) ( not ( = ?auto_604007 ?auto_604009 ) ) ( not ( = ?auto_604007 ?auto_604010 ) ) ( not ( = ?auto_604007 ?auto_604011 ) ) ( not ( = ?auto_604007 ?auto_604012 ) ) ( not ( = ?auto_604007 ?auto_604013 ) ) ( not ( = ?auto_604007 ?auto_604014 ) ) ( not ( = ?auto_604007 ?auto_604015 ) ) ( not ( = ?auto_604007 ?auto_604016 ) ) ( not ( = ?auto_604007 ?auto_604017 ) ) ( not ( = ?auto_604007 ?auto_604018 ) ) ( not ( = ?auto_604007 ?auto_604019 ) ) ( not ( = ?auto_604007 ?auto_604020 ) ) ( not ( = ?auto_604008 ?auto_604009 ) ) ( not ( = ?auto_604008 ?auto_604010 ) ) ( not ( = ?auto_604008 ?auto_604011 ) ) ( not ( = ?auto_604008 ?auto_604012 ) ) ( not ( = ?auto_604008 ?auto_604013 ) ) ( not ( = ?auto_604008 ?auto_604014 ) ) ( not ( = ?auto_604008 ?auto_604015 ) ) ( not ( = ?auto_604008 ?auto_604016 ) ) ( not ( = ?auto_604008 ?auto_604017 ) ) ( not ( = ?auto_604008 ?auto_604018 ) ) ( not ( = ?auto_604008 ?auto_604019 ) ) ( not ( = ?auto_604008 ?auto_604020 ) ) ( not ( = ?auto_604009 ?auto_604010 ) ) ( not ( = ?auto_604009 ?auto_604011 ) ) ( not ( = ?auto_604009 ?auto_604012 ) ) ( not ( = ?auto_604009 ?auto_604013 ) ) ( not ( = ?auto_604009 ?auto_604014 ) ) ( not ( = ?auto_604009 ?auto_604015 ) ) ( not ( = ?auto_604009 ?auto_604016 ) ) ( not ( = ?auto_604009 ?auto_604017 ) ) ( not ( = ?auto_604009 ?auto_604018 ) ) ( not ( = ?auto_604009 ?auto_604019 ) ) ( not ( = ?auto_604009 ?auto_604020 ) ) ( not ( = ?auto_604010 ?auto_604011 ) ) ( not ( = ?auto_604010 ?auto_604012 ) ) ( not ( = ?auto_604010 ?auto_604013 ) ) ( not ( = ?auto_604010 ?auto_604014 ) ) ( not ( = ?auto_604010 ?auto_604015 ) ) ( not ( = ?auto_604010 ?auto_604016 ) ) ( not ( = ?auto_604010 ?auto_604017 ) ) ( not ( = ?auto_604010 ?auto_604018 ) ) ( not ( = ?auto_604010 ?auto_604019 ) ) ( not ( = ?auto_604010 ?auto_604020 ) ) ( not ( = ?auto_604011 ?auto_604012 ) ) ( not ( = ?auto_604011 ?auto_604013 ) ) ( not ( = ?auto_604011 ?auto_604014 ) ) ( not ( = ?auto_604011 ?auto_604015 ) ) ( not ( = ?auto_604011 ?auto_604016 ) ) ( not ( = ?auto_604011 ?auto_604017 ) ) ( not ( = ?auto_604011 ?auto_604018 ) ) ( not ( = ?auto_604011 ?auto_604019 ) ) ( not ( = ?auto_604011 ?auto_604020 ) ) ( not ( = ?auto_604012 ?auto_604013 ) ) ( not ( = ?auto_604012 ?auto_604014 ) ) ( not ( = ?auto_604012 ?auto_604015 ) ) ( not ( = ?auto_604012 ?auto_604016 ) ) ( not ( = ?auto_604012 ?auto_604017 ) ) ( not ( = ?auto_604012 ?auto_604018 ) ) ( not ( = ?auto_604012 ?auto_604019 ) ) ( not ( = ?auto_604012 ?auto_604020 ) ) ( not ( = ?auto_604013 ?auto_604014 ) ) ( not ( = ?auto_604013 ?auto_604015 ) ) ( not ( = ?auto_604013 ?auto_604016 ) ) ( not ( = ?auto_604013 ?auto_604017 ) ) ( not ( = ?auto_604013 ?auto_604018 ) ) ( not ( = ?auto_604013 ?auto_604019 ) ) ( not ( = ?auto_604013 ?auto_604020 ) ) ( not ( = ?auto_604014 ?auto_604015 ) ) ( not ( = ?auto_604014 ?auto_604016 ) ) ( not ( = ?auto_604014 ?auto_604017 ) ) ( not ( = ?auto_604014 ?auto_604018 ) ) ( not ( = ?auto_604014 ?auto_604019 ) ) ( not ( = ?auto_604014 ?auto_604020 ) ) ( not ( = ?auto_604015 ?auto_604016 ) ) ( not ( = ?auto_604015 ?auto_604017 ) ) ( not ( = ?auto_604015 ?auto_604018 ) ) ( not ( = ?auto_604015 ?auto_604019 ) ) ( not ( = ?auto_604015 ?auto_604020 ) ) ( not ( = ?auto_604016 ?auto_604017 ) ) ( not ( = ?auto_604016 ?auto_604018 ) ) ( not ( = ?auto_604016 ?auto_604019 ) ) ( not ( = ?auto_604016 ?auto_604020 ) ) ( not ( = ?auto_604017 ?auto_604018 ) ) ( not ( = ?auto_604017 ?auto_604019 ) ) ( not ( = ?auto_604017 ?auto_604020 ) ) ( not ( = ?auto_604018 ?auto_604019 ) ) ( not ( = ?auto_604018 ?auto_604020 ) ) ( not ( = ?auto_604019 ?auto_604020 ) ) ( ON ?auto_604018 ?auto_604019 ) ( ON ?auto_604017 ?auto_604018 ) ( ON ?auto_604016 ?auto_604017 ) ( ON ?auto_604015 ?auto_604016 ) ( ON ?auto_604014 ?auto_604015 ) ( ON ?auto_604013 ?auto_604014 ) ( ON ?auto_604012 ?auto_604013 ) ( ON ?auto_604011 ?auto_604012 ) ( ON ?auto_604010 ?auto_604011 ) ( ON ?auto_604009 ?auto_604010 ) ( ON ?auto_604008 ?auto_604009 ) ( ON ?auto_604007 ?auto_604008 ) ( ON ?auto_604006 ?auto_604007 ) ( CLEAR ?auto_604004 ) ( ON ?auto_604005 ?auto_604006 ) ( CLEAR ?auto_604005 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_604004 ?auto_604005 )
      ( MAKE-16PILE ?auto_604004 ?auto_604005 ?auto_604006 ?auto_604007 ?auto_604008 ?auto_604009 ?auto_604010 ?auto_604011 ?auto_604012 ?auto_604013 ?auto_604014 ?auto_604015 ?auto_604016 ?auto_604017 ?auto_604018 ?auto_604019 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_604070 - BLOCK
      ?auto_604071 - BLOCK
      ?auto_604072 - BLOCK
      ?auto_604073 - BLOCK
      ?auto_604074 - BLOCK
      ?auto_604075 - BLOCK
      ?auto_604076 - BLOCK
      ?auto_604077 - BLOCK
      ?auto_604078 - BLOCK
      ?auto_604079 - BLOCK
      ?auto_604080 - BLOCK
      ?auto_604081 - BLOCK
      ?auto_604082 - BLOCK
      ?auto_604083 - BLOCK
      ?auto_604084 - BLOCK
      ?auto_604085 - BLOCK
    )
    :vars
    (
      ?auto_604086 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_604085 ?auto_604086 ) ( not ( = ?auto_604070 ?auto_604071 ) ) ( not ( = ?auto_604070 ?auto_604072 ) ) ( not ( = ?auto_604070 ?auto_604073 ) ) ( not ( = ?auto_604070 ?auto_604074 ) ) ( not ( = ?auto_604070 ?auto_604075 ) ) ( not ( = ?auto_604070 ?auto_604076 ) ) ( not ( = ?auto_604070 ?auto_604077 ) ) ( not ( = ?auto_604070 ?auto_604078 ) ) ( not ( = ?auto_604070 ?auto_604079 ) ) ( not ( = ?auto_604070 ?auto_604080 ) ) ( not ( = ?auto_604070 ?auto_604081 ) ) ( not ( = ?auto_604070 ?auto_604082 ) ) ( not ( = ?auto_604070 ?auto_604083 ) ) ( not ( = ?auto_604070 ?auto_604084 ) ) ( not ( = ?auto_604070 ?auto_604085 ) ) ( not ( = ?auto_604070 ?auto_604086 ) ) ( not ( = ?auto_604071 ?auto_604072 ) ) ( not ( = ?auto_604071 ?auto_604073 ) ) ( not ( = ?auto_604071 ?auto_604074 ) ) ( not ( = ?auto_604071 ?auto_604075 ) ) ( not ( = ?auto_604071 ?auto_604076 ) ) ( not ( = ?auto_604071 ?auto_604077 ) ) ( not ( = ?auto_604071 ?auto_604078 ) ) ( not ( = ?auto_604071 ?auto_604079 ) ) ( not ( = ?auto_604071 ?auto_604080 ) ) ( not ( = ?auto_604071 ?auto_604081 ) ) ( not ( = ?auto_604071 ?auto_604082 ) ) ( not ( = ?auto_604071 ?auto_604083 ) ) ( not ( = ?auto_604071 ?auto_604084 ) ) ( not ( = ?auto_604071 ?auto_604085 ) ) ( not ( = ?auto_604071 ?auto_604086 ) ) ( not ( = ?auto_604072 ?auto_604073 ) ) ( not ( = ?auto_604072 ?auto_604074 ) ) ( not ( = ?auto_604072 ?auto_604075 ) ) ( not ( = ?auto_604072 ?auto_604076 ) ) ( not ( = ?auto_604072 ?auto_604077 ) ) ( not ( = ?auto_604072 ?auto_604078 ) ) ( not ( = ?auto_604072 ?auto_604079 ) ) ( not ( = ?auto_604072 ?auto_604080 ) ) ( not ( = ?auto_604072 ?auto_604081 ) ) ( not ( = ?auto_604072 ?auto_604082 ) ) ( not ( = ?auto_604072 ?auto_604083 ) ) ( not ( = ?auto_604072 ?auto_604084 ) ) ( not ( = ?auto_604072 ?auto_604085 ) ) ( not ( = ?auto_604072 ?auto_604086 ) ) ( not ( = ?auto_604073 ?auto_604074 ) ) ( not ( = ?auto_604073 ?auto_604075 ) ) ( not ( = ?auto_604073 ?auto_604076 ) ) ( not ( = ?auto_604073 ?auto_604077 ) ) ( not ( = ?auto_604073 ?auto_604078 ) ) ( not ( = ?auto_604073 ?auto_604079 ) ) ( not ( = ?auto_604073 ?auto_604080 ) ) ( not ( = ?auto_604073 ?auto_604081 ) ) ( not ( = ?auto_604073 ?auto_604082 ) ) ( not ( = ?auto_604073 ?auto_604083 ) ) ( not ( = ?auto_604073 ?auto_604084 ) ) ( not ( = ?auto_604073 ?auto_604085 ) ) ( not ( = ?auto_604073 ?auto_604086 ) ) ( not ( = ?auto_604074 ?auto_604075 ) ) ( not ( = ?auto_604074 ?auto_604076 ) ) ( not ( = ?auto_604074 ?auto_604077 ) ) ( not ( = ?auto_604074 ?auto_604078 ) ) ( not ( = ?auto_604074 ?auto_604079 ) ) ( not ( = ?auto_604074 ?auto_604080 ) ) ( not ( = ?auto_604074 ?auto_604081 ) ) ( not ( = ?auto_604074 ?auto_604082 ) ) ( not ( = ?auto_604074 ?auto_604083 ) ) ( not ( = ?auto_604074 ?auto_604084 ) ) ( not ( = ?auto_604074 ?auto_604085 ) ) ( not ( = ?auto_604074 ?auto_604086 ) ) ( not ( = ?auto_604075 ?auto_604076 ) ) ( not ( = ?auto_604075 ?auto_604077 ) ) ( not ( = ?auto_604075 ?auto_604078 ) ) ( not ( = ?auto_604075 ?auto_604079 ) ) ( not ( = ?auto_604075 ?auto_604080 ) ) ( not ( = ?auto_604075 ?auto_604081 ) ) ( not ( = ?auto_604075 ?auto_604082 ) ) ( not ( = ?auto_604075 ?auto_604083 ) ) ( not ( = ?auto_604075 ?auto_604084 ) ) ( not ( = ?auto_604075 ?auto_604085 ) ) ( not ( = ?auto_604075 ?auto_604086 ) ) ( not ( = ?auto_604076 ?auto_604077 ) ) ( not ( = ?auto_604076 ?auto_604078 ) ) ( not ( = ?auto_604076 ?auto_604079 ) ) ( not ( = ?auto_604076 ?auto_604080 ) ) ( not ( = ?auto_604076 ?auto_604081 ) ) ( not ( = ?auto_604076 ?auto_604082 ) ) ( not ( = ?auto_604076 ?auto_604083 ) ) ( not ( = ?auto_604076 ?auto_604084 ) ) ( not ( = ?auto_604076 ?auto_604085 ) ) ( not ( = ?auto_604076 ?auto_604086 ) ) ( not ( = ?auto_604077 ?auto_604078 ) ) ( not ( = ?auto_604077 ?auto_604079 ) ) ( not ( = ?auto_604077 ?auto_604080 ) ) ( not ( = ?auto_604077 ?auto_604081 ) ) ( not ( = ?auto_604077 ?auto_604082 ) ) ( not ( = ?auto_604077 ?auto_604083 ) ) ( not ( = ?auto_604077 ?auto_604084 ) ) ( not ( = ?auto_604077 ?auto_604085 ) ) ( not ( = ?auto_604077 ?auto_604086 ) ) ( not ( = ?auto_604078 ?auto_604079 ) ) ( not ( = ?auto_604078 ?auto_604080 ) ) ( not ( = ?auto_604078 ?auto_604081 ) ) ( not ( = ?auto_604078 ?auto_604082 ) ) ( not ( = ?auto_604078 ?auto_604083 ) ) ( not ( = ?auto_604078 ?auto_604084 ) ) ( not ( = ?auto_604078 ?auto_604085 ) ) ( not ( = ?auto_604078 ?auto_604086 ) ) ( not ( = ?auto_604079 ?auto_604080 ) ) ( not ( = ?auto_604079 ?auto_604081 ) ) ( not ( = ?auto_604079 ?auto_604082 ) ) ( not ( = ?auto_604079 ?auto_604083 ) ) ( not ( = ?auto_604079 ?auto_604084 ) ) ( not ( = ?auto_604079 ?auto_604085 ) ) ( not ( = ?auto_604079 ?auto_604086 ) ) ( not ( = ?auto_604080 ?auto_604081 ) ) ( not ( = ?auto_604080 ?auto_604082 ) ) ( not ( = ?auto_604080 ?auto_604083 ) ) ( not ( = ?auto_604080 ?auto_604084 ) ) ( not ( = ?auto_604080 ?auto_604085 ) ) ( not ( = ?auto_604080 ?auto_604086 ) ) ( not ( = ?auto_604081 ?auto_604082 ) ) ( not ( = ?auto_604081 ?auto_604083 ) ) ( not ( = ?auto_604081 ?auto_604084 ) ) ( not ( = ?auto_604081 ?auto_604085 ) ) ( not ( = ?auto_604081 ?auto_604086 ) ) ( not ( = ?auto_604082 ?auto_604083 ) ) ( not ( = ?auto_604082 ?auto_604084 ) ) ( not ( = ?auto_604082 ?auto_604085 ) ) ( not ( = ?auto_604082 ?auto_604086 ) ) ( not ( = ?auto_604083 ?auto_604084 ) ) ( not ( = ?auto_604083 ?auto_604085 ) ) ( not ( = ?auto_604083 ?auto_604086 ) ) ( not ( = ?auto_604084 ?auto_604085 ) ) ( not ( = ?auto_604084 ?auto_604086 ) ) ( not ( = ?auto_604085 ?auto_604086 ) ) ( ON ?auto_604084 ?auto_604085 ) ( ON ?auto_604083 ?auto_604084 ) ( ON ?auto_604082 ?auto_604083 ) ( ON ?auto_604081 ?auto_604082 ) ( ON ?auto_604080 ?auto_604081 ) ( ON ?auto_604079 ?auto_604080 ) ( ON ?auto_604078 ?auto_604079 ) ( ON ?auto_604077 ?auto_604078 ) ( ON ?auto_604076 ?auto_604077 ) ( ON ?auto_604075 ?auto_604076 ) ( ON ?auto_604074 ?auto_604075 ) ( ON ?auto_604073 ?auto_604074 ) ( ON ?auto_604072 ?auto_604073 ) ( ON ?auto_604071 ?auto_604072 ) ( ON ?auto_604070 ?auto_604071 ) ( CLEAR ?auto_604070 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_604070 )
      ( MAKE-16PILE ?auto_604070 ?auto_604071 ?auto_604072 ?auto_604073 ?auto_604074 ?auto_604075 ?auto_604076 ?auto_604077 ?auto_604078 ?auto_604079 ?auto_604080 ?auto_604081 ?auto_604082 ?auto_604083 ?auto_604084 ?auto_604085 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_604137 - BLOCK
      ?auto_604138 - BLOCK
      ?auto_604139 - BLOCK
      ?auto_604140 - BLOCK
      ?auto_604141 - BLOCK
      ?auto_604142 - BLOCK
      ?auto_604143 - BLOCK
      ?auto_604144 - BLOCK
      ?auto_604145 - BLOCK
      ?auto_604146 - BLOCK
      ?auto_604147 - BLOCK
      ?auto_604148 - BLOCK
      ?auto_604149 - BLOCK
      ?auto_604150 - BLOCK
      ?auto_604151 - BLOCK
      ?auto_604152 - BLOCK
      ?auto_604153 - BLOCK
    )
    :vars
    (
      ?auto_604154 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_604152 ) ( ON ?auto_604153 ?auto_604154 ) ( CLEAR ?auto_604153 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_604137 ) ( ON ?auto_604138 ?auto_604137 ) ( ON ?auto_604139 ?auto_604138 ) ( ON ?auto_604140 ?auto_604139 ) ( ON ?auto_604141 ?auto_604140 ) ( ON ?auto_604142 ?auto_604141 ) ( ON ?auto_604143 ?auto_604142 ) ( ON ?auto_604144 ?auto_604143 ) ( ON ?auto_604145 ?auto_604144 ) ( ON ?auto_604146 ?auto_604145 ) ( ON ?auto_604147 ?auto_604146 ) ( ON ?auto_604148 ?auto_604147 ) ( ON ?auto_604149 ?auto_604148 ) ( ON ?auto_604150 ?auto_604149 ) ( ON ?auto_604151 ?auto_604150 ) ( ON ?auto_604152 ?auto_604151 ) ( not ( = ?auto_604137 ?auto_604138 ) ) ( not ( = ?auto_604137 ?auto_604139 ) ) ( not ( = ?auto_604137 ?auto_604140 ) ) ( not ( = ?auto_604137 ?auto_604141 ) ) ( not ( = ?auto_604137 ?auto_604142 ) ) ( not ( = ?auto_604137 ?auto_604143 ) ) ( not ( = ?auto_604137 ?auto_604144 ) ) ( not ( = ?auto_604137 ?auto_604145 ) ) ( not ( = ?auto_604137 ?auto_604146 ) ) ( not ( = ?auto_604137 ?auto_604147 ) ) ( not ( = ?auto_604137 ?auto_604148 ) ) ( not ( = ?auto_604137 ?auto_604149 ) ) ( not ( = ?auto_604137 ?auto_604150 ) ) ( not ( = ?auto_604137 ?auto_604151 ) ) ( not ( = ?auto_604137 ?auto_604152 ) ) ( not ( = ?auto_604137 ?auto_604153 ) ) ( not ( = ?auto_604137 ?auto_604154 ) ) ( not ( = ?auto_604138 ?auto_604139 ) ) ( not ( = ?auto_604138 ?auto_604140 ) ) ( not ( = ?auto_604138 ?auto_604141 ) ) ( not ( = ?auto_604138 ?auto_604142 ) ) ( not ( = ?auto_604138 ?auto_604143 ) ) ( not ( = ?auto_604138 ?auto_604144 ) ) ( not ( = ?auto_604138 ?auto_604145 ) ) ( not ( = ?auto_604138 ?auto_604146 ) ) ( not ( = ?auto_604138 ?auto_604147 ) ) ( not ( = ?auto_604138 ?auto_604148 ) ) ( not ( = ?auto_604138 ?auto_604149 ) ) ( not ( = ?auto_604138 ?auto_604150 ) ) ( not ( = ?auto_604138 ?auto_604151 ) ) ( not ( = ?auto_604138 ?auto_604152 ) ) ( not ( = ?auto_604138 ?auto_604153 ) ) ( not ( = ?auto_604138 ?auto_604154 ) ) ( not ( = ?auto_604139 ?auto_604140 ) ) ( not ( = ?auto_604139 ?auto_604141 ) ) ( not ( = ?auto_604139 ?auto_604142 ) ) ( not ( = ?auto_604139 ?auto_604143 ) ) ( not ( = ?auto_604139 ?auto_604144 ) ) ( not ( = ?auto_604139 ?auto_604145 ) ) ( not ( = ?auto_604139 ?auto_604146 ) ) ( not ( = ?auto_604139 ?auto_604147 ) ) ( not ( = ?auto_604139 ?auto_604148 ) ) ( not ( = ?auto_604139 ?auto_604149 ) ) ( not ( = ?auto_604139 ?auto_604150 ) ) ( not ( = ?auto_604139 ?auto_604151 ) ) ( not ( = ?auto_604139 ?auto_604152 ) ) ( not ( = ?auto_604139 ?auto_604153 ) ) ( not ( = ?auto_604139 ?auto_604154 ) ) ( not ( = ?auto_604140 ?auto_604141 ) ) ( not ( = ?auto_604140 ?auto_604142 ) ) ( not ( = ?auto_604140 ?auto_604143 ) ) ( not ( = ?auto_604140 ?auto_604144 ) ) ( not ( = ?auto_604140 ?auto_604145 ) ) ( not ( = ?auto_604140 ?auto_604146 ) ) ( not ( = ?auto_604140 ?auto_604147 ) ) ( not ( = ?auto_604140 ?auto_604148 ) ) ( not ( = ?auto_604140 ?auto_604149 ) ) ( not ( = ?auto_604140 ?auto_604150 ) ) ( not ( = ?auto_604140 ?auto_604151 ) ) ( not ( = ?auto_604140 ?auto_604152 ) ) ( not ( = ?auto_604140 ?auto_604153 ) ) ( not ( = ?auto_604140 ?auto_604154 ) ) ( not ( = ?auto_604141 ?auto_604142 ) ) ( not ( = ?auto_604141 ?auto_604143 ) ) ( not ( = ?auto_604141 ?auto_604144 ) ) ( not ( = ?auto_604141 ?auto_604145 ) ) ( not ( = ?auto_604141 ?auto_604146 ) ) ( not ( = ?auto_604141 ?auto_604147 ) ) ( not ( = ?auto_604141 ?auto_604148 ) ) ( not ( = ?auto_604141 ?auto_604149 ) ) ( not ( = ?auto_604141 ?auto_604150 ) ) ( not ( = ?auto_604141 ?auto_604151 ) ) ( not ( = ?auto_604141 ?auto_604152 ) ) ( not ( = ?auto_604141 ?auto_604153 ) ) ( not ( = ?auto_604141 ?auto_604154 ) ) ( not ( = ?auto_604142 ?auto_604143 ) ) ( not ( = ?auto_604142 ?auto_604144 ) ) ( not ( = ?auto_604142 ?auto_604145 ) ) ( not ( = ?auto_604142 ?auto_604146 ) ) ( not ( = ?auto_604142 ?auto_604147 ) ) ( not ( = ?auto_604142 ?auto_604148 ) ) ( not ( = ?auto_604142 ?auto_604149 ) ) ( not ( = ?auto_604142 ?auto_604150 ) ) ( not ( = ?auto_604142 ?auto_604151 ) ) ( not ( = ?auto_604142 ?auto_604152 ) ) ( not ( = ?auto_604142 ?auto_604153 ) ) ( not ( = ?auto_604142 ?auto_604154 ) ) ( not ( = ?auto_604143 ?auto_604144 ) ) ( not ( = ?auto_604143 ?auto_604145 ) ) ( not ( = ?auto_604143 ?auto_604146 ) ) ( not ( = ?auto_604143 ?auto_604147 ) ) ( not ( = ?auto_604143 ?auto_604148 ) ) ( not ( = ?auto_604143 ?auto_604149 ) ) ( not ( = ?auto_604143 ?auto_604150 ) ) ( not ( = ?auto_604143 ?auto_604151 ) ) ( not ( = ?auto_604143 ?auto_604152 ) ) ( not ( = ?auto_604143 ?auto_604153 ) ) ( not ( = ?auto_604143 ?auto_604154 ) ) ( not ( = ?auto_604144 ?auto_604145 ) ) ( not ( = ?auto_604144 ?auto_604146 ) ) ( not ( = ?auto_604144 ?auto_604147 ) ) ( not ( = ?auto_604144 ?auto_604148 ) ) ( not ( = ?auto_604144 ?auto_604149 ) ) ( not ( = ?auto_604144 ?auto_604150 ) ) ( not ( = ?auto_604144 ?auto_604151 ) ) ( not ( = ?auto_604144 ?auto_604152 ) ) ( not ( = ?auto_604144 ?auto_604153 ) ) ( not ( = ?auto_604144 ?auto_604154 ) ) ( not ( = ?auto_604145 ?auto_604146 ) ) ( not ( = ?auto_604145 ?auto_604147 ) ) ( not ( = ?auto_604145 ?auto_604148 ) ) ( not ( = ?auto_604145 ?auto_604149 ) ) ( not ( = ?auto_604145 ?auto_604150 ) ) ( not ( = ?auto_604145 ?auto_604151 ) ) ( not ( = ?auto_604145 ?auto_604152 ) ) ( not ( = ?auto_604145 ?auto_604153 ) ) ( not ( = ?auto_604145 ?auto_604154 ) ) ( not ( = ?auto_604146 ?auto_604147 ) ) ( not ( = ?auto_604146 ?auto_604148 ) ) ( not ( = ?auto_604146 ?auto_604149 ) ) ( not ( = ?auto_604146 ?auto_604150 ) ) ( not ( = ?auto_604146 ?auto_604151 ) ) ( not ( = ?auto_604146 ?auto_604152 ) ) ( not ( = ?auto_604146 ?auto_604153 ) ) ( not ( = ?auto_604146 ?auto_604154 ) ) ( not ( = ?auto_604147 ?auto_604148 ) ) ( not ( = ?auto_604147 ?auto_604149 ) ) ( not ( = ?auto_604147 ?auto_604150 ) ) ( not ( = ?auto_604147 ?auto_604151 ) ) ( not ( = ?auto_604147 ?auto_604152 ) ) ( not ( = ?auto_604147 ?auto_604153 ) ) ( not ( = ?auto_604147 ?auto_604154 ) ) ( not ( = ?auto_604148 ?auto_604149 ) ) ( not ( = ?auto_604148 ?auto_604150 ) ) ( not ( = ?auto_604148 ?auto_604151 ) ) ( not ( = ?auto_604148 ?auto_604152 ) ) ( not ( = ?auto_604148 ?auto_604153 ) ) ( not ( = ?auto_604148 ?auto_604154 ) ) ( not ( = ?auto_604149 ?auto_604150 ) ) ( not ( = ?auto_604149 ?auto_604151 ) ) ( not ( = ?auto_604149 ?auto_604152 ) ) ( not ( = ?auto_604149 ?auto_604153 ) ) ( not ( = ?auto_604149 ?auto_604154 ) ) ( not ( = ?auto_604150 ?auto_604151 ) ) ( not ( = ?auto_604150 ?auto_604152 ) ) ( not ( = ?auto_604150 ?auto_604153 ) ) ( not ( = ?auto_604150 ?auto_604154 ) ) ( not ( = ?auto_604151 ?auto_604152 ) ) ( not ( = ?auto_604151 ?auto_604153 ) ) ( not ( = ?auto_604151 ?auto_604154 ) ) ( not ( = ?auto_604152 ?auto_604153 ) ) ( not ( = ?auto_604152 ?auto_604154 ) ) ( not ( = ?auto_604153 ?auto_604154 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_604153 ?auto_604154 )
      ( !STACK ?auto_604153 ?auto_604152 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_604172 - BLOCK
      ?auto_604173 - BLOCK
      ?auto_604174 - BLOCK
      ?auto_604175 - BLOCK
      ?auto_604176 - BLOCK
      ?auto_604177 - BLOCK
      ?auto_604178 - BLOCK
      ?auto_604179 - BLOCK
      ?auto_604180 - BLOCK
      ?auto_604181 - BLOCK
      ?auto_604182 - BLOCK
      ?auto_604183 - BLOCK
      ?auto_604184 - BLOCK
      ?auto_604185 - BLOCK
      ?auto_604186 - BLOCK
      ?auto_604187 - BLOCK
      ?auto_604188 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_604187 ) ( ON-TABLE ?auto_604188 ) ( CLEAR ?auto_604188 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_604172 ) ( ON ?auto_604173 ?auto_604172 ) ( ON ?auto_604174 ?auto_604173 ) ( ON ?auto_604175 ?auto_604174 ) ( ON ?auto_604176 ?auto_604175 ) ( ON ?auto_604177 ?auto_604176 ) ( ON ?auto_604178 ?auto_604177 ) ( ON ?auto_604179 ?auto_604178 ) ( ON ?auto_604180 ?auto_604179 ) ( ON ?auto_604181 ?auto_604180 ) ( ON ?auto_604182 ?auto_604181 ) ( ON ?auto_604183 ?auto_604182 ) ( ON ?auto_604184 ?auto_604183 ) ( ON ?auto_604185 ?auto_604184 ) ( ON ?auto_604186 ?auto_604185 ) ( ON ?auto_604187 ?auto_604186 ) ( not ( = ?auto_604172 ?auto_604173 ) ) ( not ( = ?auto_604172 ?auto_604174 ) ) ( not ( = ?auto_604172 ?auto_604175 ) ) ( not ( = ?auto_604172 ?auto_604176 ) ) ( not ( = ?auto_604172 ?auto_604177 ) ) ( not ( = ?auto_604172 ?auto_604178 ) ) ( not ( = ?auto_604172 ?auto_604179 ) ) ( not ( = ?auto_604172 ?auto_604180 ) ) ( not ( = ?auto_604172 ?auto_604181 ) ) ( not ( = ?auto_604172 ?auto_604182 ) ) ( not ( = ?auto_604172 ?auto_604183 ) ) ( not ( = ?auto_604172 ?auto_604184 ) ) ( not ( = ?auto_604172 ?auto_604185 ) ) ( not ( = ?auto_604172 ?auto_604186 ) ) ( not ( = ?auto_604172 ?auto_604187 ) ) ( not ( = ?auto_604172 ?auto_604188 ) ) ( not ( = ?auto_604173 ?auto_604174 ) ) ( not ( = ?auto_604173 ?auto_604175 ) ) ( not ( = ?auto_604173 ?auto_604176 ) ) ( not ( = ?auto_604173 ?auto_604177 ) ) ( not ( = ?auto_604173 ?auto_604178 ) ) ( not ( = ?auto_604173 ?auto_604179 ) ) ( not ( = ?auto_604173 ?auto_604180 ) ) ( not ( = ?auto_604173 ?auto_604181 ) ) ( not ( = ?auto_604173 ?auto_604182 ) ) ( not ( = ?auto_604173 ?auto_604183 ) ) ( not ( = ?auto_604173 ?auto_604184 ) ) ( not ( = ?auto_604173 ?auto_604185 ) ) ( not ( = ?auto_604173 ?auto_604186 ) ) ( not ( = ?auto_604173 ?auto_604187 ) ) ( not ( = ?auto_604173 ?auto_604188 ) ) ( not ( = ?auto_604174 ?auto_604175 ) ) ( not ( = ?auto_604174 ?auto_604176 ) ) ( not ( = ?auto_604174 ?auto_604177 ) ) ( not ( = ?auto_604174 ?auto_604178 ) ) ( not ( = ?auto_604174 ?auto_604179 ) ) ( not ( = ?auto_604174 ?auto_604180 ) ) ( not ( = ?auto_604174 ?auto_604181 ) ) ( not ( = ?auto_604174 ?auto_604182 ) ) ( not ( = ?auto_604174 ?auto_604183 ) ) ( not ( = ?auto_604174 ?auto_604184 ) ) ( not ( = ?auto_604174 ?auto_604185 ) ) ( not ( = ?auto_604174 ?auto_604186 ) ) ( not ( = ?auto_604174 ?auto_604187 ) ) ( not ( = ?auto_604174 ?auto_604188 ) ) ( not ( = ?auto_604175 ?auto_604176 ) ) ( not ( = ?auto_604175 ?auto_604177 ) ) ( not ( = ?auto_604175 ?auto_604178 ) ) ( not ( = ?auto_604175 ?auto_604179 ) ) ( not ( = ?auto_604175 ?auto_604180 ) ) ( not ( = ?auto_604175 ?auto_604181 ) ) ( not ( = ?auto_604175 ?auto_604182 ) ) ( not ( = ?auto_604175 ?auto_604183 ) ) ( not ( = ?auto_604175 ?auto_604184 ) ) ( not ( = ?auto_604175 ?auto_604185 ) ) ( not ( = ?auto_604175 ?auto_604186 ) ) ( not ( = ?auto_604175 ?auto_604187 ) ) ( not ( = ?auto_604175 ?auto_604188 ) ) ( not ( = ?auto_604176 ?auto_604177 ) ) ( not ( = ?auto_604176 ?auto_604178 ) ) ( not ( = ?auto_604176 ?auto_604179 ) ) ( not ( = ?auto_604176 ?auto_604180 ) ) ( not ( = ?auto_604176 ?auto_604181 ) ) ( not ( = ?auto_604176 ?auto_604182 ) ) ( not ( = ?auto_604176 ?auto_604183 ) ) ( not ( = ?auto_604176 ?auto_604184 ) ) ( not ( = ?auto_604176 ?auto_604185 ) ) ( not ( = ?auto_604176 ?auto_604186 ) ) ( not ( = ?auto_604176 ?auto_604187 ) ) ( not ( = ?auto_604176 ?auto_604188 ) ) ( not ( = ?auto_604177 ?auto_604178 ) ) ( not ( = ?auto_604177 ?auto_604179 ) ) ( not ( = ?auto_604177 ?auto_604180 ) ) ( not ( = ?auto_604177 ?auto_604181 ) ) ( not ( = ?auto_604177 ?auto_604182 ) ) ( not ( = ?auto_604177 ?auto_604183 ) ) ( not ( = ?auto_604177 ?auto_604184 ) ) ( not ( = ?auto_604177 ?auto_604185 ) ) ( not ( = ?auto_604177 ?auto_604186 ) ) ( not ( = ?auto_604177 ?auto_604187 ) ) ( not ( = ?auto_604177 ?auto_604188 ) ) ( not ( = ?auto_604178 ?auto_604179 ) ) ( not ( = ?auto_604178 ?auto_604180 ) ) ( not ( = ?auto_604178 ?auto_604181 ) ) ( not ( = ?auto_604178 ?auto_604182 ) ) ( not ( = ?auto_604178 ?auto_604183 ) ) ( not ( = ?auto_604178 ?auto_604184 ) ) ( not ( = ?auto_604178 ?auto_604185 ) ) ( not ( = ?auto_604178 ?auto_604186 ) ) ( not ( = ?auto_604178 ?auto_604187 ) ) ( not ( = ?auto_604178 ?auto_604188 ) ) ( not ( = ?auto_604179 ?auto_604180 ) ) ( not ( = ?auto_604179 ?auto_604181 ) ) ( not ( = ?auto_604179 ?auto_604182 ) ) ( not ( = ?auto_604179 ?auto_604183 ) ) ( not ( = ?auto_604179 ?auto_604184 ) ) ( not ( = ?auto_604179 ?auto_604185 ) ) ( not ( = ?auto_604179 ?auto_604186 ) ) ( not ( = ?auto_604179 ?auto_604187 ) ) ( not ( = ?auto_604179 ?auto_604188 ) ) ( not ( = ?auto_604180 ?auto_604181 ) ) ( not ( = ?auto_604180 ?auto_604182 ) ) ( not ( = ?auto_604180 ?auto_604183 ) ) ( not ( = ?auto_604180 ?auto_604184 ) ) ( not ( = ?auto_604180 ?auto_604185 ) ) ( not ( = ?auto_604180 ?auto_604186 ) ) ( not ( = ?auto_604180 ?auto_604187 ) ) ( not ( = ?auto_604180 ?auto_604188 ) ) ( not ( = ?auto_604181 ?auto_604182 ) ) ( not ( = ?auto_604181 ?auto_604183 ) ) ( not ( = ?auto_604181 ?auto_604184 ) ) ( not ( = ?auto_604181 ?auto_604185 ) ) ( not ( = ?auto_604181 ?auto_604186 ) ) ( not ( = ?auto_604181 ?auto_604187 ) ) ( not ( = ?auto_604181 ?auto_604188 ) ) ( not ( = ?auto_604182 ?auto_604183 ) ) ( not ( = ?auto_604182 ?auto_604184 ) ) ( not ( = ?auto_604182 ?auto_604185 ) ) ( not ( = ?auto_604182 ?auto_604186 ) ) ( not ( = ?auto_604182 ?auto_604187 ) ) ( not ( = ?auto_604182 ?auto_604188 ) ) ( not ( = ?auto_604183 ?auto_604184 ) ) ( not ( = ?auto_604183 ?auto_604185 ) ) ( not ( = ?auto_604183 ?auto_604186 ) ) ( not ( = ?auto_604183 ?auto_604187 ) ) ( not ( = ?auto_604183 ?auto_604188 ) ) ( not ( = ?auto_604184 ?auto_604185 ) ) ( not ( = ?auto_604184 ?auto_604186 ) ) ( not ( = ?auto_604184 ?auto_604187 ) ) ( not ( = ?auto_604184 ?auto_604188 ) ) ( not ( = ?auto_604185 ?auto_604186 ) ) ( not ( = ?auto_604185 ?auto_604187 ) ) ( not ( = ?auto_604185 ?auto_604188 ) ) ( not ( = ?auto_604186 ?auto_604187 ) ) ( not ( = ?auto_604186 ?auto_604188 ) ) ( not ( = ?auto_604187 ?auto_604188 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_604188 )
      ( !STACK ?auto_604188 ?auto_604187 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_604206 - BLOCK
      ?auto_604207 - BLOCK
      ?auto_604208 - BLOCK
      ?auto_604209 - BLOCK
      ?auto_604210 - BLOCK
      ?auto_604211 - BLOCK
      ?auto_604212 - BLOCK
      ?auto_604213 - BLOCK
      ?auto_604214 - BLOCK
      ?auto_604215 - BLOCK
      ?auto_604216 - BLOCK
      ?auto_604217 - BLOCK
      ?auto_604218 - BLOCK
      ?auto_604219 - BLOCK
      ?auto_604220 - BLOCK
      ?auto_604221 - BLOCK
      ?auto_604222 - BLOCK
    )
    :vars
    (
      ?auto_604223 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_604222 ?auto_604223 ) ( ON-TABLE ?auto_604206 ) ( ON ?auto_604207 ?auto_604206 ) ( ON ?auto_604208 ?auto_604207 ) ( ON ?auto_604209 ?auto_604208 ) ( ON ?auto_604210 ?auto_604209 ) ( ON ?auto_604211 ?auto_604210 ) ( ON ?auto_604212 ?auto_604211 ) ( ON ?auto_604213 ?auto_604212 ) ( ON ?auto_604214 ?auto_604213 ) ( ON ?auto_604215 ?auto_604214 ) ( ON ?auto_604216 ?auto_604215 ) ( ON ?auto_604217 ?auto_604216 ) ( ON ?auto_604218 ?auto_604217 ) ( ON ?auto_604219 ?auto_604218 ) ( ON ?auto_604220 ?auto_604219 ) ( not ( = ?auto_604206 ?auto_604207 ) ) ( not ( = ?auto_604206 ?auto_604208 ) ) ( not ( = ?auto_604206 ?auto_604209 ) ) ( not ( = ?auto_604206 ?auto_604210 ) ) ( not ( = ?auto_604206 ?auto_604211 ) ) ( not ( = ?auto_604206 ?auto_604212 ) ) ( not ( = ?auto_604206 ?auto_604213 ) ) ( not ( = ?auto_604206 ?auto_604214 ) ) ( not ( = ?auto_604206 ?auto_604215 ) ) ( not ( = ?auto_604206 ?auto_604216 ) ) ( not ( = ?auto_604206 ?auto_604217 ) ) ( not ( = ?auto_604206 ?auto_604218 ) ) ( not ( = ?auto_604206 ?auto_604219 ) ) ( not ( = ?auto_604206 ?auto_604220 ) ) ( not ( = ?auto_604206 ?auto_604221 ) ) ( not ( = ?auto_604206 ?auto_604222 ) ) ( not ( = ?auto_604206 ?auto_604223 ) ) ( not ( = ?auto_604207 ?auto_604208 ) ) ( not ( = ?auto_604207 ?auto_604209 ) ) ( not ( = ?auto_604207 ?auto_604210 ) ) ( not ( = ?auto_604207 ?auto_604211 ) ) ( not ( = ?auto_604207 ?auto_604212 ) ) ( not ( = ?auto_604207 ?auto_604213 ) ) ( not ( = ?auto_604207 ?auto_604214 ) ) ( not ( = ?auto_604207 ?auto_604215 ) ) ( not ( = ?auto_604207 ?auto_604216 ) ) ( not ( = ?auto_604207 ?auto_604217 ) ) ( not ( = ?auto_604207 ?auto_604218 ) ) ( not ( = ?auto_604207 ?auto_604219 ) ) ( not ( = ?auto_604207 ?auto_604220 ) ) ( not ( = ?auto_604207 ?auto_604221 ) ) ( not ( = ?auto_604207 ?auto_604222 ) ) ( not ( = ?auto_604207 ?auto_604223 ) ) ( not ( = ?auto_604208 ?auto_604209 ) ) ( not ( = ?auto_604208 ?auto_604210 ) ) ( not ( = ?auto_604208 ?auto_604211 ) ) ( not ( = ?auto_604208 ?auto_604212 ) ) ( not ( = ?auto_604208 ?auto_604213 ) ) ( not ( = ?auto_604208 ?auto_604214 ) ) ( not ( = ?auto_604208 ?auto_604215 ) ) ( not ( = ?auto_604208 ?auto_604216 ) ) ( not ( = ?auto_604208 ?auto_604217 ) ) ( not ( = ?auto_604208 ?auto_604218 ) ) ( not ( = ?auto_604208 ?auto_604219 ) ) ( not ( = ?auto_604208 ?auto_604220 ) ) ( not ( = ?auto_604208 ?auto_604221 ) ) ( not ( = ?auto_604208 ?auto_604222 ) ) ( not ( = ?auto_604208 ?auto_604223 ) ) ( not ( = ?auto_604209 ?auto_604210 ) ) ( not ( = ?auto_604209 ?auto_604211 ) ) ( not ( = ?auto_604209 ?auto_604212 ) ) ( not ( = ?auto_604209 ?auto_604213 ) ) ( not ( = ?auto_604209 ?auto_604214 ) ) ( not ( = ?auto_604209 ?auto_604215 ) ) ( not ( = ?auto_604209 ?auto_604216 ) ) ( not ( = ?auto_604209 ?auto_604217 ) ) ( not ( = ?auto_604209 ?auto_604218 ) ) ( not ( = ?auto_604209 ?auto_604219 ) ) ( not ( = ?auto_604209 ?auto_604220 ) ) ( not ( = ?auto_604209 ?auto_604221 ) ) ( not ( = ?auto_604209 ?auto_604222 ) ) ( not ( = ?auto_604209 ?auto_604223 ) ) ( not ( = ?auto_604210 ?auto_604211 ) ) ( not ( = ?auto_604210 ?auto_604212 ) ) ( not ( = ?auto_604210 ?auto_604213 ) ) ( not ( = ?auto_604210 ?auto_604214 ) ) ( not ( = ?auto_604210 ?auto_604215 ) ) ( not ( = ?auto_604210 ?auto_604216 ) ) ( not ( = ?auto_604210 ?auto_604217 ) ) ( not ( = ?auto_604210 ?auto_604218 ) ) ( not ( = ?auto_604210 ?auto_604219 ) ) ( not ( = ?auto_604210 ?auto_604220 ) ) ( not ( = ?auto_604210 ?auto_604221 ) ) ( not ( = ?auto_604210 ?auto_604222 ) ) ( not ( = ?auto_604210 ?auto_604223 ) ) ( not ( = ?auto_604211 ?auto_604212 ) ) ( not ( = ?auto_604211 ?auto_604213 ) ) ( not ( = ?auto_604211 ?auto_604214 ) ) ( not ( = ?auto_604211 ?auto_604215 ) ) ( not ( = ?auto_604211 ?auto_604216 ) ) ( not ( = ?auto_604211 ?auto_604217 ) ) ( not ( = ?auto_604211 ?auto_604218 ) ) ( not ( = ?auto_604211 ?auto_604219 ) ) ( not ( = ?auto_604211 ?auto_604220 ) ) ( not ( = ?auto_604211 ?auto_604221 ) ) ( not ( = ?auto_604211 ?auto_604222 ) ) ( not ( = ?auto_604211 ?auto_604223 ) ) ( not ( = ?auto_604212 ?auto_604213 ) ) ( not ( = ?auto_604212 ?auto_604214 ) ) ( not ( = ?auto_604212 ?auto_604215 ) ) ( not ( = ?auto_604212 ?auto_604216 ) ) ( not ( = ?auto_604212 ?auto_604217 ) ) ( not ( = ?auto_604212 ?auto_604218 ) ) ( not ( = ?auto_604212 ?auto_604219 ) ) ( not ( = ?auto_604212 ?auto_604220 ) ) ( not ( = ?auto_604212 ?auto_604221 ) ) ( not ( = ?auto_604212 ?auto_604222 ) ) ( not ( = ?auto_604212 ?auto_604223 ) ) ( not ( = ?auto_604213 ?auto_604214 ) ) ( not ( = ?auto_604213 ?auto_604215 ) ) ( not ( = ?auto_604213 ?auto_604216 ) ) ( not ( = ?auto_604213 ?auto_604217 ) ) ( not ( = ?auto_604213 ?auto_604218 ) ) ( not ( = ?auto_604213 ?auto_604219 ) ) ( not ( = ?auto_604213 ?auto_604220 ) ) ( not ( = ?auto_604213 ?auto_604221 ) ) ( not ( = ?auto_604213 ?auto_604222 ) ) ( not ( = ?auto_604213 ?auto_604223 ) ) ( not ( = ?auto_604214 ?auto_604215 ) ) ( not ( = ?auto_604214 ?auto_604216 ) ) ( not ( = ?auto_604214 ?auto_604217 ) ) ( not ( = ?auto_604214 ?auto_604218 ) ) ( not ( = ?auto_604214 ?auto_604219 ) ) ( not ( = ?auto_604214 ?auto_604220 ) ) ( not ( = ?auto_604214 ?auto_604221 ) ) ( not ( = ?auto_604214 ?auto_604222 ) ) ( not ( = ?auto_604214 ?auto_604223 ) ) ( not ( = ?auto_604215 ?auto_604216 ) ) ( not ( = ?auto_604215 ?auto_604217 ) ) ( not ( = ?auto_604215 ?auto_604218 ) ) ( not ( = ?auto_604215 ?auto_604219 ) ) ( not ( = ?auto_604215 ?auto_604220 ) ) ( not ( = ?auto_604215 ?auto_604221 ) ) ( not ( = ?auto_604215 ?auto_604222 ) ) ( not ( = ?auto_604215 ?auto_604223 ) ) ( not ( = ?auto_604216 ?auto_604217 ) ) ( not ( = ?auto_604216 ?auto_604218 ) ) ( not ( = ?auto_604216 ?auto_604219 ) ) ( not ( = ?auto_604216 ?auto_604220 ) ) ( not ( = ?auto_604216 ?auto_604221 ) ) ( not ( = ?auto_604216 ?auto_604222 ) ) ( not ( = ?auto_604216 ?auto_604223 ) ) ( not ( = ?auto_604217 ?auto_604218 ) ) ( not ( = ?auto_604217 ?auto_604219 ) ) ( not ( = ?auto_604217 ?auto_604220 ) ) ( not ( = ?auto_604217 ?auto_604221 ) ) ( not ( = ?auto_604217 ?auto_604222 ) ) ( not ( = ?auto_604217 ?auto_604223 ) ) ( not ( = ?auto_604218 ?auto_604219 ) ) ( not ( = ?auto_604218 ?auto_604220 ) ) ( not ( = ?auto_604218 ?auto_604221 ) ) ( not ( = ?auto_604218 ?auto_604222 ) ) ( not ( = ?auto_604218 ?auto_604223 ) ) ( not ( = ?auto_604219 ?auto_604220 ) ) ( not ( = ?auto_604219 ?auto_604221 ) ) ( not ( = ?auto_604219 ?auto_604222 ) ) ( not ( = ?auto_604219 ?auto_604223 ) ) ( not ( = ?auto_604220 ?auto_604221 ) ) ( not ( = ?auto_604220 ?auto_604222 ) ) ( not ( = ?auto_604220 ?auto_604223 ) ) ( not ( = ?auto_604221 ?auto_604222 ) ) ( not ( = ?auto_604221 ?auto_604223 ) ) ( not ( = ?auto_604222 ?auto_604223 ) ) ( CLEAR ?auto_604220 ) ( ON ?auto_604221 ?auto_604222 ) ( CLEAR ?auto_604221 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-16PILE ?auto_604206 ?auto_604207 ?auto_604208 ?auto_604209 ?auto_604210 ?auto_604211 ?auto_604212 ?auto_604213 ?auto_604214 ?auto_604215 ?auto_604216 ?auto_604217 ?auto_604218 ?auto_604219 ?auto_604220 ?auto_604221 )
      ( MAKE-17PILE ?auto_604206 ?auto_604207 ?auto_604208 ?auto_604209 ?auto_604210 ?auto_604211 ?auto_604212 ?auto_604213 ?auto_604214 ?auto_604215 ?auto_604216 ?auto_604217 ?auto_604218 ?auto_604219 ?auto_604220 ?auto_604221 ?auto_604222 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_604241 - BLOCK
      ?auto_604242 - BLOCK
      ?auto_604243 - BLOCK
      ?auto_604244 - BLOCK
      ?auto_604245 - BLOCK
      ?auto_604246 - BLOCK
      ?auto_604247 - BLOCK
      ?auto_604248 - BLOCK
      ?auto_604249 - BLOCK
      ?auto_604250 - BLOCK
      ?auto_604251 - BLOCK
      ?auto_604252 - BLOCK
      ?auto_604253 - BLOCK
      ?auto_604254 - BLOCK
      ?auto_604255 - BLOCK
      ?auto_604256 - BLOCK
      ?auto_604257 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_604257 ) ( ON-TABLE ?auto_604241 ) ( ON ?auto_604242 ?auto_604241 ) ( ON ?auto_604243 ?auto_604242 ) ( ON ?auto_604244 ?auto_604243 ) ( ON ?auto_604245 ?auto_604244 ) ( ON ?auto_604246 ?auto_604245 ) ( ON ?auto_604247 ?auto_604246 ) ( ON ?auto_604248 ?auto_604247 ) ( ON ?auto_604249 ?auto_604248 ) ( ON ?auto_604250 ?auto_604249 ) ( ON ?auto_604251 ?auto_604250 ) ( ON ?auto_604252 ?auto_604251 ) ( ON ?auto_604253 ?auto_604252 ) ( ON ?auto_604254 ?auto_604253 ) ( ON ?auto_604255 ?auto_604254 ) ( not ( = ?auto_604241 ?auto_604242 ) ) ( not ( = ?auto_604241 ?auto_604243 ) ) ( not ( = ?auto_604241 ?auto_604244 ) ) ( not ( = ?auto_604241 ?auto_604245 ) ) ( not ( = ?auto_604241 ?auto_604246 ) ) ( not ( = ?auto_604241 ?auto_604247 ) ) ( not ( = ?auto_604241 ?auto_604248 ) ) ( not ( = ?auto_604241 ?auto_604249 ) ) ( not ( = ?auto_604241 ?auto_604250 ) ) ( not ( = ?auto_604241 ?auto_604251 ) ) ( not ( = ?auto_604241 ?auto_604252 ) ) ( not ( = ?auto_604241 ?auto_604253 ) ) ( not ( = ?auto_604241 ?auto_604254 ) ) ( not ( = ?auto_604241 ?auto_604255 ) ) ( not ( = ?auto_604241 ?auto_604256 ) ) ( not ( = ?auto_604241 ?auto_604257 ) ) ( not ( = ?auto_604242 ?auto_604243 ) ) ( not ( = ?auto_604242 ?auto_604244 ) ) ( not ( = ?auto_604242 ?auto_604245 ) ) ( not ( = ?auto_604242 ?auto_604246 ) ) ( not ( = ?auto_604242 ?auto_604247 ) ) ( not ( = ?auto_604242 ?auto_604248 ) ) ( not ( = ?auto_604242 ?auto_604249 ) ) ( not ( = ?auto_604242 ?auto_604250 ) ) ( not ( = ?auto_604242 ?auto_604251 ) ) ( not ( = ?auto_604242 ?auto_604252 ) ) ( not ( = ?auto_604242 ?auto_604253 ) ) ( not ( = ?auto_604242 ?auto_604254 ) ) ( not ( = ?auto_604242 ?auto_604255 ) ) ( not ( = ?auto_604242 ?auto_604256 ) ) ( not ( = ?auto_604242 ?auto_604257 ) ) ( not ( = ?auto_604243 ?auto_604244 ) ) ( not ( = ?auto_604243 ?auto_604245 ) ) ( not ( = ?auto_604243 ?auto_604246 ) ) ( not ( = ?auto_604243 ?auto_604247 ) ) ( not ( = ?auto_604243 ?auto_604248 ) ) ( not ( = ?auto_604243 ?auto_604249 ) ) ( not ( = ?auto_604243 ?auto_604250 ) ) ( not ( = ?auto_604243 ?auto_604251 ) ) ( not ( = ?auto_604243 ?auto_604252 ) ) ( not ( = ?auto_604243 ?auto_604253 ) ) ( not ( = ?auto_604243 ?auto_604254 ) ) ( not ( = ?auto_604243 ?auto_604255 ) ) ( not ( = ?auto_604243 ?auto_604256 ) ) ( not ( = ?auto_604243 ?auto_604257 ) ) ( not ( = ?auto_604244 ?auto_604245 ) ) ( not ( = ?auto_604244 ?auto_604246 ) ) ( not ( = ?auto_604244 ?auto_604247 ) ) ( not ( = ?auto_604244 ?auto_604248 ) ) ( not ( = ?auto_604244 ?auto_604249 ) ) ( not ( = ?auto_604244 ?auto_604250 ) ) ( not ( = ?auto_604244 ?auto_604251 ) ) ( not ( = ?auto_604244 ?auto_604252 ) ) ( not ( = ?auto_604244 ?auto_604253 ) ) ( not ( = ?auto_604244 ?auto_604254 ) ) ( not ( = ?auto_604244 ?auto_604255 ) ) ( not ( = ?auto_604244 ?auto_604256 ) ) ( not ( = ?auto_604244 ?auto_604257 ) ) ( not ( = ?auto_604245 ?auto_604246 ) ) ( not ( = ?auto_604245 ?auto_604247 ) ) ( not ( = ?auto_604245 ?auto_604248 ) ) ( not ( = ?auto_604245 ?auto_604249 ) ) ( not ( = ?auto_604245 ?auto_604250 ) ) ( not ( = ?auto_604245 ?auto_604251 ) ) ( not ( = ?auto_604245 ?auto_604252 ) ) ( not ( = ?auto_604245 ?auto_604253 ) ) ( not ( = ?auto_604245 ?auto_604254 ) ) ( not ( = ?auto_604245 ?auto_604255 ) ) ( not ( = ?auto_604245 ?auto_604256 ) ) ( not ( = ?auto_604245 ?auto_604257 ) ) ( not ( = ?auto_604246 ?auto_604247 ) ) ( not ( = ?auto_604246 ?auto_604248 ) ) ( not ( = ?auto_604246 ?auto_604249 ) ) ( not ( = ?auto_604246 ?auto_604250 ) ) ( not ( = ?auto_604246 ?auto_604251 ) ) ( not ( = ?auto_604246 ?auto_604252 ) ) ( not ( = ?auto_604246 ?auto_604253 ) ) ( not ( = ?auto_604246 ?auto_604254 ) ) ( not ( = ?auto_604246 ?auto_604255 ) ) ( not ( = ?auto_604246 ?auto_604256 ) ) ( not ( = ?auto_604246 ?auto_604257 ) ) ( not ( = ?auto_604247 ?auto_604248 ) ) ( not ( = ?auto_604247 ?auto_604249 ) ) ( not ( = ?auto_604247 ?auto_604250 ) ) ( not ( = ?auto_604247 ?auto_604251 ) ) ( not ( = ?auto_604247 ?auto_604252 ) ) ( not ( = ?auto_604247 ?auto_604253 ) ) ( not ( = ?auto_604247 ?auto_604254 ) ) ( not ( = ?auto_604247 ?auto_604255 ) ) ( not ( = ?auto_604247 ?auto_604256 ) ) ( not ( = ?auto_604247 ?auto_604257 ) ) ( not ( = ?auto_604248 ?auto_604249 ) ) ( not ( = ?auto_604248 ?auto_604250 ) ) ( not ( = ?auto_604248 ?auto_604251 ) ) ( not ( = ?auto_604248 ?auto_604252 ) ) ( not ( = ?auto_604248 ?auto_604253 ) ) ( not ( = ?auto_604248 ?auto_604254 ) ) ( not ( = ?auto_604248 ?auto_604255 ) ) ( not ( = ?auto_604248 ?auto_604256 ) ) ( not ( = ?auto_604248 ?auto_604257 ) ) ( not ( = ?auto_604249 ?auto_604250 ) ) ( not ( = ?auto_604249 ?auto_604251 ) ) ( not ( = ?auto_604249 ?auto_604252 ) ) ( not ( = ?auto_604249 ?auto_604253 ) ) ( not ( = ?auto_604249 ?auto_604254 ) ) ( not ( = ?auto_604249 ?auto_604255 ) ) ( not ( = ?auto_604249 ?auto_604256 ) ) ( not ( = ?auto_604249 ?auto_604257 ) ) ( not ( = ?auto_604250 ?auto_604251 ) ) ( not ( = ?auto_604250 ?auto_604252 ) ) ( not ( = ?auto_604250 ?auto_604253 ) ) ( not ( = ?auto_604250 ?auto_604254 ) ) ( not ( = ?auto_604250 ?auto_604255 ) ) ( not ( = ?auto_604250 ?auto_604256 ) ) ( not ( = ?auto_604250 ?auto_604257 ) ) ( not ( = ?auto_604251 ?auto_604252 ) ) ( not ( = ?auto_604251 ?auto_604253 ) ) ( not ( = ?auto_604251 ?auto_604254 ) ) ( not ( = ?auto_604251 ?auto_604255 ) ) ( not ( = ?auto_604251 ?auto_604256 ) ) ( not ( = ?auto_604251 ?auto_604257 ) ) ( not ( = ?auto_604252 ?auto_604253 ) ) ( not ( = ?auto_604252 ?auto_604254 ) ) ( not ( = ?auto_604252 ?auto_604255 ) ) ( not ( = ?auto_604252 ?auto_604256 ) ) ( not ( = ?auto_604252 ?auto_604257 ) ) ( not ( = ?auto_604253 ?auto_604254 ) ) ( not ( = ?auto_604253 ?auto_604255 ) ) ( not ( = ?auto_604253 ?auto_604256 ) ) ( not ( = ?auto_604253 ?auto_604257 ) ) ( not ( = ?auto_604254 ?auto_604255 ) ) ( not ( = ?auto_604254 ?auto_604256 ) ) ( not ( = ?auto_604254 ?auto_604257 ) ) ( not ( = ?auto_604255 ?auto_604256 ) ) ( not ( = ?auto_604255 ?auto_604257 ) ) ( not ( = ?auto_604256 ?auto_604257 ) ) ( CLEAR ?auto_604255 ) ( ON ?auto_604256 ?auto_604257 ) ( CLEAR ?auto_604256 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-16PILE ?auto_604241 ?auto_604242 ?auto_604243 ?auto_604244 ?auto_604245 ?auto_604246 ?auto_604247 ?auto_604248 ?auto_604249 ?auto_604250 ?auto_604251 ?auto_604252 ?auto_604253 ?auto_604254 ?auto_604255 ?auto_604256 )
      ( MAKE-17PILE ?auto_604241 ?auto_604242 ?auto_604243 ?auto_604244 ?auto_604245 ?auto_604246 ?auto_604247 ?auto_604248 ?auto_604249 ?auto_604250 ?auto_604251 ?auto_604252 ?auto_604253 ?auto_604254 ?auto_604255 ?auto_604256 ?auto_604257 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_604275 - BLOCK
      ?auto_604276 - BLOCK
      ?auto_604277 - BLOCK
      ?auto_604278 - BLOCK
      ?auto_604279 - BLOCK
      ?auto_604280 - BLOCK
      ?auto_604281 - BLOCK
      ?auto_604282 - BLOCK
      ?auto_604283 - BLOCK
      ?auto_604284 - BLOCK
      ?auto_604285 - BLOCK
      ?auto_604286 - BLOCK
      ?auto_604287 - BLOCK
      ?auto_604288 - BLOCK
      ?auto_604289 - BLOCK
      ?auto_604290 - BLOCK
      ?auto_604291 - BLOCK
    )
    :vars
    (
      ?auto_604292 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_604291 ?auto_604292 ) ( ON-TABLE ?auto_604275 ) ( ON ?auto_604276 ?auto_604275 ) ( ON ?auto_604277 ?auto_604276 ) ( ON ?auto_604278 ?auto_604277 ) ( ON ?auto_604279 ?auto_604278 ) ( ON ?auto_604280 ?auto_604279 ) ( ON ?auto_604281 ?auto_604280 ) ( ON ?auto_604282 ?auto_604281 ) ( ON ?auto_604283 ?auto_604282 ) ( ON ?auto_604284 ?auto_604283 ) ( ON ?auto_604285 ?auto_604284 ) ( ON ?auto_604286 ?auto_604285 ) ( ON ?auto_604287 ?auto_604286 ) ( ON ?auto_604288 ?auto_604287 ) ( not ( = ?auto_604275 ?auto_604276 ) ) ( not ( = ?auto_604275 ?auto_604277 ) ) ( not ( = ?auto_604275 ?auto_604278 ) ) ( not ( = ?auto_604275 ?auto_604279 ) ) ( not ( = ?auto_604275 ?auto_604280 ) ) ( not ( = ?auto_604275 ?auto_604281 ) ) ( not ( = ?auto_604275 ?auto_604282 ) ) ( not ( = ?auto_604275 ?auto_604283 ) ) ( not ( = ?auto_604275 ?auto_604284 ) ) ( not ( = ?auto_604275 ?auto_604285 ) ) ( not ( = ?auto_604275 ?auto_604286 ) ) ( not ( = ?auto_604275 ?auto_604287 ) ) ( not ( = ?auto_604275 ?auto_604288 ) ) ( not ( = ?auto_604275 ?auto_604289 ) ) ( not ( = ?auto_604275 ?auto_604290 ) ) ( not ( = ?auto_604275 ?auto_604291 ) ) ( not ( = ?auto_604275 ?auto_604292 ) ) ( not ( = ?auto_604276 ?auto_604277 ) ) ( not ( = ?auto_604276 ?auto_604278 ) ) ( not ( = ?auto_604276 ?auto_604279 ) ) ( not ( = ?auto_604276 ?auto_604280 ) ) ( not ( = ?auto_604276 ?auto_604281 ) ) ( not ( = ?auto_604276 ?auto_604282 ) ) ( not ( = ?auto_604276 ?auto_604283 ) ) ( not ( = ?auto_604276 ?auto_604284 ) ) ( not ( = ?auto_604276 ?auto_604285 ) ) ( not ( = ?auto_604276 ?auto_604286 ) ) ( not ( = ?auto_604276 ?auto_604287 ) ) ( not ( = ?auto_604276 ?auto_604288 ) ) ( not ( = ?auto_604276 ?auto_604289 ) ) ( not ( = ?auto_604276 ?auto_604290 ) ) ( not ( = ?auto_604276 ?auto_604291 ) ) ( not ( = ?auto_604276 ?auto_604292 ) ) ( not ( = ?auto_604277 ?auto_604278 ) ) ( not ( = ?auto_604277 ?auto_604279 ) ) ( not ( = ?auto_604277 ?auto_604280 ) ) ( not ( = ?auto_604277 ?auto_604281 ) ) ( not ( = ?auto_604277 ?auto_604282 ) ) ( not ( = ?auto_604277 ?auto_604283 ) ) ( not ( = ?auto_604277 ?auto_604284 ) ) ( not ( = ?auto_604277 ?auto_604285 ) ) ( not ( = ?auto_604277 ?auto_604286 ) ) ( not ( = ?auto_604277 ?auto_604287 ) ) ( not ( = ?auto_604277 ?auto_604288 ) ) ( not ( = ?auto_604277 ?auto_604289 ) ) ( not ( = ?auto_604277 ?auto_604290 ) ) ( not ( = ?auto_604277 ?auto_604291 ) ) ( not ( = ?auto_604277 ?auto_604292 ) ) ( not ( = ?auto_604278 ?auto_604279 ) ) ( not ( = ?auto_604278 ?auto_604280 ) ) ( not ( = ?auto_604278 ?auto_604281 ) ) ( not ( = ?auto_604278 ?auto_604282 ) ) ( not ( = ?auto_604278 ?auto_604283 ) ) ( not ( = ?auto_604278 ?auto_604284 ) ) ( not ( = ?auto_604278 ?auto_604285 ) ) ( not ( = ?auto_604278 ?auto_604286 ) ) ( not ( = ?auto_604278 ?auto_604287 ) ) ( not ( = ?auto_604278 ?auto_604288 ) ) ( not ( = ?auto_604278 ?auto_604289 ) ) ( not ( = ?auto_604278 ?auto_604290 ) ) ( not ( = ?auto_604278 ?auto_604291 ) ) ( not ( = ?auto_604278 ?auto_604292 ) ) ( not ( = ?auto_604279 ?auto_604280 ) ) ( not ( = ?auto_604279 ?auto_604281 ) ) ( not ( = ?auto_604279 ?auto_604282 ) ) ( not ( = ?auto_604279 ?auto_604283 ) ) ( not ( = ?auto_604279 ?auto_604284 ) ) ( not ( = ?auto_604279 ?auto_604285 ) ) ( not ( = ?auto_604279 ?auto_604286 ) ) ( not ( = ?auto_604279 ?auto_604287 ) ) ( not ( = ?auto_604279 ?auto_604288 ) ) ( not ( = ?auto_604279 ?auto_604289 ) ) ( not ( = ?auto_604279 ?auto_604290 ) ) ( not ( = ?auto_604279 ?auto_604291 ) ) ( not ( = ?auto_604279 ?auto_604292 ) ) ( not ( = ?auto_604280 ?auto_604281 ) ) ( not ( = ?auto_604280 ?auto_604282 ) ) ( not ( = ?auto_604280 ?auto_604283 ) ) ( not ( = ?auto_604280 ?auto_604284 ) ) ( not ( = ?auto_604280 ?auto_604285 ) ) ( not ( = ?auto_604280 ?auto_604286 ) ) ( not ( = ?auto_604280 ?auto_604287 ) ) ( not ( = ?auto_604280 ?auto_604288 ) ) ( not ( = ?auto_604280 ?auto_604289 ) ) ( not ( = ?auto_604280 ?auto_604290 ) ) ( not ( = ?auto_604280 ?auto_604291 ) ) ( not ( = ?auto_604280 ?auto_604292 ) ) ( not ( = ?auto_604281 ?auto_604282 ) ) ( not ( = ?auto_604281 ?auto_604283 ) ) ( not ( = ?auto_604281 ?auto_604284 ) ) ( not ( = ?auto_604281 ?auto_604285 ) ) ( not ( = ?auto_604281 ?auto_604286 ) ) ( not ( = ?auto_604281 ?auto_604287 ) ) ( not ( = ?auto_604281 ?auto_604288 ) ) ( not ( = ?auto_604281 ?auto_604289 ) ) ( not ( = ?auto_604281 ?auto_604290 ) ) ( not ( = ?auto_604281 ?auto_604291 ) ) ( not ( = ?auto_604281 ?auto_604292 ) ) ( not ( = ?auto_604282 ?auto_604283 ) ) ( not ( = ?auto_604282 ?auto_604284 ) ) ( not ( = ?auto_604282 ?auto_604285 ) ) ( not ( = ?auto_604282 ?auto_604286 ) ) ( not ( = ?auto_604282 ?auto_604287 ) ) ( not ( = ?auto_604282 ?auto_604288 ) ) ( not ( = ?auto_604282 ?auto_604289 ) ) ( not ( = ?auto_604282 ?auto_604290 ) ) ( not ( = ?auto_604282 ?auto_604291 ) ) ( not ( = ?auto_604282 ?auto_604292 ) ) ( not ( = ?auto_604283 ?auto_604284 ) ) ( not ( = ?auto_604283 ?auto_604285 ) ) ( not ( = ?auto_604283 ?auto_604286 ) ) ( not ( = ?auto_604283 ?auto_604287 ) ) ( not ( = ?auto_604283 ?auto_604288 ) ) ( not ( = ?auto_604283 ?auto_604289 ) ) ( not ( = ?auto_604283 ?auto_604290 ) ) ( not ( = ?auto_604283 ?auto_604291 ) ) ( not ( = ?auto_604283 ?auto_604292 ) ) ( not ( = ?auto_604284 ?auto_604285 ) ) ( not ( = ?auto_604284 ?auto_604286 ) ) ( not ( = ?auto_604284 ?auto_604287 ) ) ( not ( = ?auto_604284 ?auto_604288 ) ) ( not ( = ?auto_604284 ?auto_604289 ) ) ( not ( = ?auto_604284 ?auto_604290 ) ) ( not ( = ?auto_604284 ?auto_604291 ) ) ( not ( = ?auto_604284 ?auto_604292 ) ) ( not ( = ?auto_604285 ?auto_604286 ) ) ( not ( = ?auto_604285 ?auto_604287 ) ) ( not ( = ?auto_604285 ?auto_604288 ) ) ( not ( = ?auto_604285 ?auto_604289 ) ) ( not ( = ?auto_604285 ?auto_604290 ) ) ( not ( = ?auto_604285 ?auto_604291 ) ) ( not ( = ?auto_604285 ?auto_604292 ) ) ( not ( = ?auto_604286 ?auto_604287 ) ) ( not ( = ?auto_604286 ?auto_604288 ) ) ( not ( = ?auto_604286 ?auto_604289 ) ) ( not ( = ?auto_604286 ?auto_604290 ) ) ( not ( = ?auto_604286 ?auto_604291 ) ) ( not ( = ?auto_604286 ?auto_604292 ) ) ( not ( = ?auto_604287 ?auto_604288 ) ) ( not ( = ?auto_604287 ?auto_604289 ) ) ( not ( = ?auto_604287 ?auto_604290 ) ) ( not ( = ?auto_604287 ?auto_604291 ) ) ( not ( = ?auto_604287 ?auto_604292 ) ) ( not ( = ?auto_604288 ?auto_604289 ) ) ( not ( = ?auto_604288 ?auto_604290 ) ) ( not ( = ?auto_604288 ?auto_604291 ) ) ( not ( = ?auto_604288 ?auto_604292 ) ) ( not ( = ?auto_604289 ?auto_604290 ) ) ( not ( = ?auto_604289 ?auto_604291 ) ) ( not ( = ?auto_604289 ?auto_604292 ) ) ( not ( = ?auto_604290 ?auto_604291 ) ) ( not ( = ?auto_604290 ?auto_604292 ) ) ( not ( = ?auto_604291 ?auto_604292 ) ) ( ON ?auto_604290 ?auto_604291 ) ( CLEAR ?auto_604288 ) ( ON ?auto_604289 ?auto_604290 ) ( CLEAR ?auto_604289 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_604275 ?auto_604276 ?auto_604277 ?auto_604278 ?auto_604279 ?auto_604280 ?auto_604281 ?auto_604282 ?auto_604283 ?auto_604284 ?auto_604285 ?auto_604286 ?auto_604287 ?auto_604288 ?auto_604289 )
      ( MAKE-17PILE ?auto_604275 ?auto_604276 ?auto_604277 ?auto_604278 ?auto_604279 ?auto_604280 ?auto_604281 ?auto_604282 ?auto_604283 ?auto_604284 ?auto_604285 ?auto_604286 ?auto_604287 ?auto_604288 ?auto_604289 ?auto_604290 ?auto_604291 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_604310 - BLOCK
      ?auto_604311 - BLOCK
      ?auto_604312 - BLOCK
      ?auto_604313 - BLOCK
      ?auto_604314 - BLOCK
      ?auto_604315 - BLOCK
      ?auto_604316 - BLOCK
      ?auto_604317 - BLOCK
      ?auto_604318 - BLOCK
      ?auto_604319 - BLOCK
      ?auto_604320 - BLOCK
      ?auto_604321 - BLOCK
      ?auto_604322 - BLOCK
      ?auto_604323 - BLOCK
      ?auto_604324 - BLOCK
      ?auto_604325 - BLOCK
      ?auto_604326 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_604326 ) ( ON-TABLE ?auto_604310 ) ( ON ?auto_604311 ?auto_604310 ) ( ON ?auto_604312 ?auto_604311 ) ( ON ?auto_604313 ?auto_604312 ) ( ON ?auto_604314 ?auto_604313 ) ( ON ?auto_604315 ?auto_604314 ) ( ON ?auto_604316 ?auto_604315 ) ( ON ?auto_604317 ?auto_604316 ) ( ON ?auto_604318 ?auto_604317 ) ( ON ?auto_604319 ?auto_604318 ) ( ON ?auto_604320 ?auto_604319 ) ( ON ?auto_604321 ?auto_604320 ) ( ON ?auto_604322 ?auto_604321 ) ( ON ?auto_604323 ?auto_604322 ) ( not ( = ?auto_604310 ?auto_604311 ) ) ( not ( = ?auto_604310 ?auto_604312 ) ) ( not ( = ?auto_604310 ?auto_604313 ) ) ( not ( = ?auto_604310 ?auto_604314 ) ) ( not ( = ?auto_604310 ?auto_604315 ) ) ( not ( = ?auto_604310 ?auto_604316 ) ) ( not ( = ?auto_604310 ?auto_604317 ) ) ( not ( = ?auto_604310 ?auto_604318 ) ) ( not ( = ?auto_604310 ?auto_604319 ) ) ( not ( = ?auto_604310 ?auto_604320 ) ) ( not ( = ?auto_604310 ?auto_604321 ) ) ( not ( = ?auto_604310 ?auto_604322 ) ) ( not ( = ?auto_604310 ?auto_604323 ) ) ( not ( = ?auto_604310 ?auto_604324 ) ) ( not ( = ?auto_604310 ?auto_604325 ) ) ( not ( = ?auto_604310 ?auto_604326 ) ) ( not ( = ?auto_604311 ?auto_604312 ) ) ( not ( = ?auto_604311 ?auto_604313 ) ) ( not ( = ?auto_604311 ?auto_604314 ) ) ( not ( = ?auto_604311 ?auto_604315 ) ) ( not ( = ?auto_604311 ?auto_604316 ) ) ( not ( = ?auto_604311 ?auto_604317 ) ) ( not ( = ?auto_604311 ?auto_604318 ) ) ( not ( = ?auto_604311 ?auto_604319 ) ) ( not ( = ?auto_604311 ?auto_604320 ) ) ( not ( = ?auto_604311 ?auto_604321 ) ) ( not ( = ?auto_604311 ?auto_604322 ) ) ( not ( = ?auto_604311 ?auto_604323 ) ) ( not ( = ?auto_604311 ?auto_604324 ) ) ( not ( = ?auto_604311 ?auto_604325 ) ) ( not ( = ?auto_604311 ?auto_604326 ) ) ( not ( = ?auto_604312 ?auto_604313 ) ) ( not ( = ?auto_604312 ?auto_604314 ) ) ( not ( = ?auto_604312 ?auto_604315 ) ) ( not ( = ?auto_604312 ?auto_604316 ) ) ( not ( = ?auto_604312 ?auto_604317 ) ) ( not ( = ?auto_604312 ?auto_604318 ) ) ( not ( = ?auto_604312 ?auto_604319 ) ) ( not ( = ?auto_604312 ?auto_604320 ) ) ( not ( = ?auto_604312 ?auto_604321 ) ) ( not ( = ?auto_604312 ?auto_604322 ) ) ( not ( = ?auto_604312 ?auto_604323 ) ) ( not ( = ?auto_604312 ?auto_604324 ) ) ( not ( = ?auto_604312 ?auto_604325 ) ) ( not ( = ?auto_604312 ?auto_604326 ) ) ( not ( = ?auto_604313 ?auto_604314 ) ) ( not ( = ?auto_604313 ?auto_604315 ) ) ( not ( = ?auto_604313 ?auto_604316 ) ) ( not ( = ?auto_604313 ?auto_604317 ) ) ( not ( = ?auto_604313 ?auto_604318 ) ) ( not ( = ?auto_604313 ?auto_604319 ) ) ( not ( = ?auto_604313 ?auto_604320 ) ) ( not ( = ?auto_604313 ?auto_604321 ) ) ( not ( = ?auto_604313 ?auto_604322 ) ) ( not ( = ?auto_604313 ?auto_604323 ) ) ( not ( = ?auto_604313 ?auto_604324 ) ) ( not ( = ?auto_604313 ?auto_604325 ) ) ( not ( = ?auto_604313 ?auto_604326 ) ) ( not ( = ?auto_604314 ?auto_604315 ) ) ( not ( = ?auto_604314 ?auto_604316 ) ) ( not ( = ?auto_604314 ?auto_604317 ) ) ( not ( = ?auto_604314 ?auto_604318 ) ) ( not ( = ?auto_604314 ?auto_604319 ) ) ( not ( = ?auto_604314 ?auto_604320 ) ) ( not ( = ?auto_604314 ?auto_604321 ) ) ( not ( = ?auto_604314 ?auto_604322 ) ) ( not ( = ?auto_604314 ?auto_604323 ) ) ( not ( = ?auto_604314 ?auto_604324 ) ) ( not ( = ?auto_604314 ?auto_604325 ) ) ( not ( = ?auto_604314 ?auto_604326 ) ) ( not ( = ?auto_604315 ?auto_604316 ) ) ( not ( = ?auto_604315 ?auto_604317 ) ) ( not ( = ?auto_604315 ?auto_604318 ) ) ( not ( = ?auto_604315 ?auto_604319 ) ) ( not ( = ?auto_604315 ?auto_604320 ) ) ( not ( = ?auto_604315 ?auto_604321 ) ) ( not ( = ?auto_604315 ?auto_604322 ) ) ( not ( = ?auto_604315 ?auto_604323 ) ) ( not ( = ?auto_604315 ?auto_604324 ) ) ( not ( = ?auto_604315 ?auto_604325 ) ) ( not ( = ?auto_604315 ?auto_604326 ) ) ( not ( = ?auto_604316 ?auto_604317 ) ) ( not ( = ?auto_604316 ?auto_604318 ) ) ( not ( = ?auto_604316 ?auto_604319 ) ) ( not ( = ?auto_604316 ?auto_604320 ) ) ( not ( = ?auto_604316 ?auto_604321 ) ) ( not ( = ?auto_604316 ?auto_604322 ) ) ( not ( = ?auto_604316 ?auto_604323 ) ) ( not ( = ?auto_604316 ?auto_604324 ) ) ( not ( = ?auto_604316 ?auto_604325 ) ) ( not ( = ?auto_604316 ?auto_604326 ) ) ( not ( = ?auto_604317 ?auto_604318 ) ) ( not ( = ?auto_604317 ?auto_604319 ) ) ( not ( = ?auto_604317 ?auto_604320 ) ) ( not ( = ?auto_604317 ?auto_604321 ) ) ( not ( = ?auto_604317 ?auto_604322 ) ) ( not ( = ?auto_604317 ?auto_604323 ) ) ( not ( = ?auto_604317 ?auto_604324 ) ) ( not ( = ?auto_604317 ?auto_604325 ) ) ( not ( = ?auto_604317 ?auto_604326 ) ) ( not ( = ?auto_604318 ?auto_604319 ) ) ( not ( = ?auto_604318 ?auto_604320 ) ) ( not ( = ?auto_604318 ?auto_604321 ) ) ( not ( = ?auto_604318 ?auto_604322 ) ) ( not ( = ?auto_604318 ?auto_604323 ) ) ( not ( = ?auto_604318 ?auto_604324 ) ) ( not ( = ?auto_604318 ?auto_604325 ) ) ( not ( = ?auto_604318 ?auto_604326 ) ) ( not ( = ?auto_604319 ?auto_604320 ) ) ( not ( = ?auto_604319 ?auto_604321 ) ) ( not ( = ?auto_604319 ?auto_604322 ) ) ( not ( = ?auto_604319 ?auto_604323 ) ) ( not ( = ?auto_604319 ?auto_604324 ) ) ( not ( = ?auto_604319 ?auto_604325 ) ) ( not ( = ?auto_604319 ?auto_604326 ) ) ( not ( = ?auto_604320 ?auto_604321 ) ) ( not ( = ?auto_604320 ?auto_604322 ) ) ( not ( = ?auto_604320 ?auto_604323 ) ) ( not ( = ?auto_604320 ?auto_604324 ) ) ( not ( = ?auto_604320 ?auto_604325 ) ) ( not ( = ?auto_604320 ?auto_604326 ) ) ( not ( = ?auto_604321 ?auto_604322 ) ) ( not ( = ?auto_604321 ?auto_604323 ) ) ( not ( = ?auto_604321 ?auto_604324 ) ) ( not ( = ?auto_604321 ?auto_604325 ) ) ( not ( = ?auto_604321 ?auto_604326 ) ) ( not ( = ?auto_604322 ?auto_604323 ) ) ( not ( = ?auto_604322 ?auto_604324 ) ) ( not ( = ?auto_604322 ?auto_604325 ) ) ( not ( = ?auto_604322 ?auto_604326 ) ) ( not ( = ?auto_604323 ?auto_604324 ) ) ( not ( = ?auto_604323 ?auto_604325 ) ) ( not ( = ?auto_604323 ?auto_604326 ) ) ( not ( = ?auto_604324 ?auto_604325 ) ) ( not ( = ?auto_604324 ?auto_604326 ) ) ( not ( = ?auto_604325 ?auto_604326 ) ) ( ON ?auto_604325 ?auto_604326 ) ( CLEAR ?auto_604323 ) ( ON ?auto_604324 ?auto_604325 ) ( CLEAR ?auto_604324 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_604310 ?auto_604311 ?auto_604312 ?auto_604313 ?auto_604314 ?auto_604315 ?auto_604316 ?auto_604317 ?auto_604318 ?auto_604319 ?auto_604320 ?auto_604321 ?auto_604322 ?auto_604323 ?auto_604324 )
      ( MAKE-17PILE ?auto_604310 ?auto_604311 ?auto_604312 ?auto_604313 ?auto_604314 ?auto_604315 ?auto_604316 ?auto_604317 ?auto_604318 ?auto_604319 ?auto_604320 ?auto_604321 ?auto_604322 ?auto_604323 ?auto_604324 ?auto_604325 ?auto_604326 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_604344 - BLOCK
      ?auto_604345 - BLOCK
      ?auto_604346 - BLOCK
      ?auto_604347 - BLOCK
      ?auto_604348 - BLOCK
      ?auto_604349 - BLOCK
      ?auto_604350 - BLOCK
      ?auto_604351 - BLOCK
      ?auto_604352 - BLOCK
      ?auto_604353 - BLOCK
      ?auto_604354 - BLOCK
      ?auto_604355 - BLOCK
      ?auto_604356 - BLOCK
      ?auto_604357 - BLOCK
      ?auto_604358 - BLOCK
      ?auto_604359 - BLOCK
      ?auto_604360 - BLOCK
    )
    :vars
    (
      ?auto_604361 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_604360 ?auto_604361 ) ( ON-TABLE ?auto_604344 ) ( ON ?auto_604345 ?auto_604344 ) ( ON ?auto_604346 ?auto_604345 ) ( ON ?auto_604347 ?auto_604346 ) ( ON ?auto_604348 ?auto_604347 ) ( ON ?auto_604349 ?auto_604348 ) ( ON ?auto_604350 ?auto_604349 ) ( ON ?auto_604351 ?auto_604350 ) ( ON ?auto_604352 ?auto_604351 ) ( ON ?auto_604353 ?auto_604352 ) ( ON ?auto_604354 ?auto_604353 ) ( ON ?auto_604355 ?auto_604354 ) ( ON ?auto_604356 ?auto_604355 ) ( not ( = ?auto_604344 ?auto_604345 ) ) ( not ( = ?auto_604344 ?auto_604346 ) ) ( not ( = ?auto_604344 ?auto_604347 ) ) ( not ( = ?auto_604344 ?auto_604348 ) ) ( not ( = ?auto_604344 ?auto_604349 ) ) ( not ( = ?auto_604344 ?auto_604350 ) ) ( not ( = ?auto_604344 ?auto_604351 ) ) ( not ( = ?auto_604344 ?auto_604352 ) ) ( not ( = ?auto_604344 ?auto_604353 ) ) ( not ( = ?auto_604344 ?auto_604354 ) ) ( not ( = ?auto_604344 ?auto_604355 ) ) ( not ( = ?auto_604344 ?auto_604356 ) ) ( not ( = ?auto_604344 ?auto_604357 ) ) ( not ( = ?auto_604344 ?auto_604358 ) ) ( not ( = ?auto_604344 ?auto_604359 ) ) ( not ( = ?auto_604344 ?auto_604360 ) ) ( not ( = ?auto_604344 ?auto_604361 ) ) ( not ( = ?auto_604345 ?auto_604346 ) ) ( not ( = ?auto_604345 ?auto_604347 ) ) ( not ( = ?auto_604345 ?auto_604348 ) ) ( not ( = ?auto_604345 ?auto_604349 ) ) ( not ( = ?auto_604345 ?auto_604350 ) ) ( not ( = ?auto_604345 ?auto_604351 ) ) ( not ( = ?auto_604345 ?auto_604352 ) ) ( not ( = ?auto_604345 ?auto_604353 ) ) ( not ( = ?auto_604345 ?auto_604354 ) ) ( not ( = ?auto_604345 ?auto_604355 ) ) ( not ( = ?auto_604345 ?auto_604356 ) ) ( not ( = ?auto_604345 ?auto_604357 ) ) ( not ( = ?auto_604345 ?auto_604358 ) ) ( not ( = ?auto_604345 ?auto_604359 ) ) ( not ( = ?auto_604345 ?auto_604360 ) ) ( not ( = ?auto_604345 ?auto_604361 ) ) ( not ( = ?auto_604346 ?auto_604347 ) ) ( not ( = ?auto_604346 ?auto_604348 ) ) ( not ( = ?auto_604346 ?auto_604349 ) ) ( not ( = ?auto_604346 ?auto_604350 ) ) ( not ( = ?auto_604346 ?auto_604351 ) ) ( not ( = ?auto_604346 ?auto_604352 ) ) ( not ( = ?auto_604346 ?auto_604353 ) ) ( not ( = ?auto_604346 ?auto_604354 ) ) ( not ( = ?auto_604346 ?auto_604355 ) ) ( not ( = ?auto_604346 ?auto_604356 ) ) ( not ( = ?auto_604346 ?auto_604357 ) ) ( not ( = ?auto_604346 ?auto_604358 ) ) ( not ( = ?auto_604346 ?auto_604359 ) ) ( not ( = ?auto_604346 ?auto_604360 ) ) ( not ( = ?auto_604346 ?auto_604361 ) ) ( not ( = ?auto_604347 ?auto_604348 ) ) ( not ( = ?auto_604347 ?auto_604349 ) ) ( not ( = ?auto_604347 ?auto_604350 ) ) ( not ( = ?auto_604347 ?auto_604351 ) ) ( not ( = ?auto_604347 ?auto_604352 ) ) ( not ( = ?auto_604347 ?auto_604353 ) ) ( not ( = ?auto_604347 ?auto_604354 ) ) ( not ( = ?auto_604347 ?auto_604355 ) ) ( not ( = ?auto_604347 ?auto_604356 ) ) ( not ( = ?auto_604347 ?auto_604357 ) ) ( not ( = ?auto_604347 ?auto_604358 ) ) ( not ( = ?auto_604347 ?auto_604359 ) ) ( not ( = ?auto_604347 ?auto_604360 ) ) ( not ( = ?auto_604347 ?auto_604361 ) ) ( not ( = ?auto_604348 ?auto_604349 ) ) ( not ( = ?auto_604348 ?auto_604350 ) ) ( not ( = ?auto_604348 ?auto_604351 ) ) ( not ( = ?auto_604348 ?auto_604352 ) ) ( not ( = ?auto_604348 ?auto_604353 ) ) ( not ( = ?auto_604348 ?auto_604354 ) ) ( not ( = ?auto_604348 ?auto_604355 ) ) ( not ( = ?auto_604348 ?auto_604356 ) ) ( not ( = ?auto_604348 ?auto_604357 ) ) ( not ( = ?auto_604348 ?auto_604358 ) ) ( not ( = ?auto_604348 ?auto_604359 ) ) ( not ( = ?auto_604348 ?auto_604360 ) ) ( not ( = ?auto_604348 ?auto_604361 ) ) ( not ( = ?auto_604349 ?auto_604350 ) ) ( not ( = ?auto_604349 ?auto_604351 ) ) ( not ( = ?auto_604349 ?auto_604352 ) ) ( not ( = ?auto_604349 ?auto_604353 ) ) ( not ( = ?auto_604349 ?auto_604354 ) ) ( not ( = ?auto_604349 ?auto_604355 ) ) ( not ( = ?auto_604349 ?auto_604356 ) ) ( not ( = ?auto_604349 ?auto_604357 ) ) ( not ( = ?auto_604349 ?auto_604358 ) ) ( not ( = ?auto_604349 ?auto_604359 ) ) ( not ( = ?auto_604349 ?auto_604360 ) ) ( not ( = ?auto_604349 ?auto_604361 ) ) ( not ( = ?auto_604350 ?auto_604351 ) ) ( not ( = ?auto_604350 ?auto_604352 ) ) ( not ( = ?auto_604350 ?auto_604353 ) ) ( not ( = ?auto_604350 ?auto_604354 ) ) ( not ( = ?auto_604350 ?auto_604355 ) ) ( not ( = ?auto_604350 ?auto_604356 ) ) ( not ( = ?auto_604350 ?auto_604357 ) ) ( not ( = ?auto_604350 ?auto_604358 ) ) ( not ( = ?auto_604350 ?auto_604359 ) ) ( not ( = ?auto_604350 ?auto_604360 ) ) ( not ( = ?auto_604350 ?auto_604361 ) ) ( not ( = ?auto_604351 ?auto_604352 ) ) ( not ( = ?auto_604351 ?auto_604353 ) ) ( not ( = ?auto_604351 ?auto_604354 ) ) ( not ( = ?auto_604351 ?auto_604355 ) ) ( not ( = ?auto_604351 ?auto_604356 ) ) ( not ( = ?auto_604351 ?auto_604357 ) ) ( not ( = ?auto_604351 ?auto_604358 ) ) ( not ( = ?auto_604351 ?auto_604359 ) ) ( not ( = ?auto_604351 ?auto_604360 ) ) ( not ( = ?auto_604351 ?auto_604361 ) ) ( not ( = ?auto_604352 ?auto_604353 ) ) ( not ( = ?auto_604352 ?auto_604354 ) ) ( not ( = ?auto_604352 ?auto_604355 ) ) ( not ( = ?auto_604352 ?auto_604356 ) ) ( not ( = ?auto_604352 ?auto_604357 ) ) ( not ( = ?auto_604352 ?auto_604358 ) ) ( not ( = ?auto_604352 ?auto_604359 ) ) ( not ( = ?auto_604352 ?auto_604360 ) ) ( not ( = ?auto_604352 ?auto_604361 ) ) ( not ( = ?auto_604353 ?auto_604354 ) ) ( not ( = ?auto_604353 ?auto_604355 ) ) ( not ( = ?auto_604353 ?auto_604356 ) ) ( not ( = ?auto_604353 ?auto_604357 ) ) ( not ( = ?auto_604353 ?auto_604358 ) ) ( not ( = ?auto_604353 ?auto_604359 ) ) ( not ( = ?auto_604353 ?auto_604360 ) ) ( not ( = ?auto_604353 ?auto_604361 ) ) ( not ( = ?auto_604354 ?auto_604355 ) ) ( not ( = ?auto_604354 ?auto_604356 ) ) ( not ( = ?auto_604354 ?auto_604357 ) ) ( not ( = ?auto_604354 ?auto_604358 ) ) ( not ( = ?auto_604354 ?auto_604359 ) ) ( not ( = ?auto_604354 ?auto_604360 ) ) ( not ( = ?auto_604354 ?auto_604361 ) ) ( not ( = ?auto_604355 ?auto_604356 ) ) ( not ( = ?auto_604355 ?auto_604357 ) ) ( not ( = ?auto_604355 ?auto_604358 ) ) ( not ( = ?auto_604355 ?auto_604359 ) ) ( not ( = ?auto_604355 ?auto_604360 ) ) ( not ( = ?auto_604355 ?auto_604361 ) ) ( not ( = ?auto_604356 ?auto_604357 ) ) ( not ( = ?auto_604356 ?auto_604358 ) ) ( not ( = ?auto_604356 ?auto_604359 ) ) ( not ( = ?auto_604356 ?auto_604360 ) ) ( not ( = ?auto_604356 ?auto_604361 ) ) ( not ( = ?auto_604357 ?auto_604358 ) ) ( not ( = ?auto_604357 ?auto_604359 ) ) ( not ( = ?auto_604357 ?auto_604360 ) ) ( not ( = ?auto_604357 ?auto_604361 ) ) ( not ( = ?auto_604358 ?auto_604359 ) ) ( not ( = ?auto_604358 ?auto_604360 ) ) ( not ( = ?auto_604358 ?auto_604361 ) ) ( not ( = ?auto_604359 ?auto_604360 ) ) ( not ( = ?auto_604359 ?auto_604361 ) ) ( not ( = ?auto_604360 ?auto_604361 ) ) ( ON ?auto_604359 ?auto_604360 ) ( ON ?auto_604358 ?auto_604359 ) ( CLEAR ?auto_604356 ) ( ON ?auto_604357 ?auto_604358 ) ( CLEAR ?auto_604357 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_604344 ?auto_604345 ?auto_604346 ?auto_604347 ?auto_604348 ?auto_604349 ?auto_604350 ?auto_604351 ?auto_604352 ?auto_604353 ?auto_604354 ?auto_604355 ?auto_604356 ?auto_604357 )
      ( MAKE-17PILE ?auto_604344 ?auto_604345 ?auto_604346 ?auto_604347 ?auto_604348 ?auto_604349 ?auto_604350 ?auto_604351 ?auto_604352 ?auto_604353 ?auto_604354 ?auto_604355 ?auto_604356 ?auto_604357 ?auto_604358 ?auto_604359 ?auto_604360 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_604379 - BLOCK
      ?auto_604380 - BLOCK
      ?auto_604381 - BLOCK
      ?auto_604382 - BLOCK
      ?auto_604383 - BLOCK
      ?auto_604384 - BLOCK
      ?auto_604385 - BLOCK
      ?auto_604386 - BLOCK
      ?auto_604387 - BLOCK
      ?auto_604388 - BLOCK
      ?auto_604389 - BLOCK
      ?auto_604390 - BLOCK
      ?auto_604391 - BLOCK
      ?auto_604392 - BLOCK
      ?auto_604393 - BLOCK
      ?auto_604394 - BLOCK
      ?auto_604395 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_604395 ) ( ON-TABLE ?auto_604379 ) ( ON ?auto_604380 ?auto_604379 ) ( ON ?auto_604381 ?auto_604380 ) ( ON ?auto_604382 ?auto_604381 ) ( ON ?auto_604383 ?auto_604382 ) ( ON ?auto_604384 ?auto_604383 ) ( ON ?auto_604385 ?auto_604384 ) ( ON ?auto_604386 ?auto_604385 ) ( ON ?auto_604387 ?auto_604386 ) ( ON ?auto_604388 ?auto_604387 ) ( ON ?auto_604389 ?auto_604388 ) ( ON ?auto_604390 ?auto_604389 ) ( ON ?auto_604391 ?auto_604390 ) ( not ( = ?auto_604379 ?auto_604380 ) ) ( not ( = ?auto_604379 ?auto_604381 ) ) ( not ( = ?auto_604379 ?auto_604382 ) ) ( not ( = ?auto_604379 ?auto_604383 ) ) ( not ( = ?auto_604379 ?auto_604384 ) ) ( not ( = ?auto_604379 ?auto_604385 ) ) ( not ( = ?auto_604379 ?auto_604386 ) ) ( not ( = ?auto_604379 ?auto_604387 ) ) ( not ( = ?auto_604379 ?auto_604388 ) ) ( not ( = ?auto_604379 ?auto_604389 ) ) ( not ( = ?auto_604379 ?auto_604390 ) ) ( not ( = ?auto_604379 ?auto_604391 ) ) ( not ( = ?auto_604379 ?auto_604392 ) ) ( not ( = ?auto_604379 ?auto_604393 ) ) ( not ( = ?auto_604379 ?auto_604394 ) ) ( not ( = ?auto_604379 ?auto_604395 ) ) ( not ( = ?auto_604380 ?auto_604381 ) ) ( not ( = ?auto_604380 ?auto_604382 ) ) ( not ( = ?auto_604380 ?auto_604383 ) ) ( not ( = ?auto_604380 ?auto_604384 ) ) ( not ( = ?auto_604380 ?auto_604385 ) ) ( not ( = ?auto_604380 ?auto_604386 ) ) ( not ( = ?auto_604380 ?auto_604387 ) ) ( not ( = ?auto_604380 ?auto_604388 ) ) ( not ( = ?auto_604380 ?auto_604389 ) ) ( not ( = ?auto_604380 ?auto_604390 ) ) ( not ( = ?auto_604380 ?auto_604391 ) ) ( not ( = ?auto_604380 ?auto_604392 ) ) ( not ( = ?auto_604380 ?auto_604393 ) ) ( not ( = ?auto_604380 ?auto_604394 ) ) ( not ( = ?auto_604380 ?auto_604395 ) ) ( not ( = ?auto_604381 ?auto_604382 ) ) ( not ( = ?auto_604381 ?auto_604383 ) ) ( not ( = ?auto_604381 ?auto_604384 ) ) ( not ( = ?auto_604381 ?auto_604385 ) ) ( not ( = ?auto_604381 ?auto_604386 ) ) ( not ( = ?auto_604381 ?auto_604387 ) ) ( not ( = ?auto_604381 ?auto_604388 ) ) ( not ( = ?auto_604381 ?auto_604389 ) ) ( not ( = ?auto_604381 ?auto_604390 ) ) ( not ( = ?auto_604381 ?auto_604391 ) ) ( not ( = ?auto_604381 ?auto_604392 ) ) ( not ( = ?auto_604381 ?auto_604393 ) ) ( not ( = ?auto_604381 ?auto_604394 ) ) ( not ( = ?auto_604381 ?auto_604395 ) ) ( not ( = ?auto_604382 ?auto_604383 ) ) ( not ( = ?auto_604382 ?auto_604384 ) ) ( not ( = ?auto_604382 ?auto_604385 ) ) ( not ( = ?auto_604382 ?auto_604386 ) ) ( not ( = ?auto_604382 ?auto_604387 ) ) ( not ( = ?auto_604382 ?auto_604388 ) ) ( not ( = ?auto_604382 ?auto_604389 ) ) ( not ( = ?auto_604382 ?auto_604390 ) ) ( not ( = ?auto_604382 ?auto_604391 ) ) ( not ( = ?auto_604382 ?auto_604392 ) ) ( not ( = ?auto_604382 ?auto_604393 ) ) ( not ( = ?auto_604382 ?auto_604394 ) ) ( not ( = ?auto_604382 ?auto_604395 ) ) ( not ( = ?auto_604383 ?auto_604384 ) ) ( not ( = ?auto_604383 ?auto_604385 ) ) ( not ( = ?auto_604383 ?auto_604386 ) ) ( not ( = ?auto_604383 ?auto_604387 ) ) ( not ( = ?auto_604383 ?auto_604388 ) ) ( not ( = ?auto_604383 ?auto_604389 ) ) ( not ( = ?auto_604383 ?auto_604390 ) ) ( not ( = ?auto_604383 ?auto_604391 ) ) ( not ( = ?auto_604383 ?auto_604392 ) ) ( not ( = ?auto_604383 ?auto_604393 ) ) ( not ( = ?auto_604383 ?auto_604394 ) ) ( not ( = ?auto_604383 ?auto_604395 ) ) ( not ( = ?auto_604384 ?auto_604385 ) ) ( not ( = ?auto_604384 ?auto_604386 ) ) ( not ( = ?auto_604384 ?auto_604387 ) ) ( not ( = ?auto_604384 ?auto_604388 ) ) ( not ( = ?auto_604384 ?auto_604389 ) ) ( not ( = ?auto_604384 ?auto_604390 ) ) ( not ( = ?auto_604384 ?auto_604391 ) ) ( not ( = ?auto_604384 ?auto_604392 ) ) ( not ( = ?auto_604384 ?auto_604393 ) ) ( not ( = ?auto_604384 ?auto_604394 ) ) ( not ( = ?auto_604384 ?auto_604395 ) ) ( not ( = ?auto_604385 ?auto_604386 ) ) ( not ( = ?auto_604385 ?auto_604387 ) ) ( not ( = ?auto_604385 ?auto_604388 ) ) ( not ( = ?auto_604385 ?auto_604389 ) ) ( not ( = ?auto_604385 ?auto_604390 ) ) ( not ( = ?auto_604385 ?auto_604391 ) ) ( not ( = ?auto_604385 ?auto_604392 ) ) ( not ( = ?auto_604385 ?auto_604393 ) ) ( not ( = ?auto_604385 ?auto_604394 ) ) ( not ( = ?auto_604385 ?auto_604395 ) ) ( not ( = ?auto_604386 ?auto_604387 ) ) ( not ( = ?auto_604386 ?auto_604388 ) ) ( not ( = ?auto_604386 ?auto_604389 ) ) ( not ( = ?auto_604386 ?auto_604390 ) ) ( not ( = ?auto_604386 ?auto_604391 ) ) ( not ( = ?auto_604386 ?auto_604392 ) ) ( not ( = ?auto_604386 ?auto_604393 ) ) ( not ( = ?auto_604386 ?auto_604394 ) ) ( not ( = ?auto_604386 ?auto_604395 ) ) ( not ( = ?auto_604387 ?auto_604388 ) ) ( not ( = ?auto_604387 ?auto_604389 ) ) ( not ( = ?auto_604387 ?auto_604390 ) ) ( not ( = ?auto_604387 ?auto_604391 ) ) ( not ( = ?auto_604387 ?auto_604392 ) ) ( not ( = ?auto_604387 ?auto_604393 ) ) ( not ( = ?auto_604387 ?auto_604394 ) ) ( not ( = ?auto_604387 ?auto_604395 ) ) ( not ( = ?auto_604388 ?auto_604389 ) ) ( not ( = ?auto_604388 ?auto_604390 ) ) ( not ( = ?auto_604388 ?auto_604391 ) ) ( not ( = ?auto_604388 ?auto_604392 ) ) ( not ( = ?auto_604388 ?auto_604393 ) ) ( not ( = ?auto_604388 ?auto_604394 ) ) ( not ( = ?auto_604388 ?auto_604395 ) ) ( not ( = ?auto_604389 ?auto_604390 ) ) ( not ( = ?auto_604389 ?auto_604391 ) ) ( not ( = ?auto_604389 ?auto_604392 ) ) ( not ( = ?auto_604389 ?auto_604393 ) ) ( not ( = ?auto_604389 ?auto_604394 ) ) ( not ( = ?auto_604389 ?auto_604395 ) ) ( not ( = ?auto_604390 ?auto_604391 ) ) ( not ( = ?auto_604390 ?auto_604392 ) ) ( not ( = ?auto_604390 ?auto_604393 ) ) ( not ( = ?auto_604390 ?auto_604394 ) ) ( not ( = ?auto_604390 ?auto_604395 ) ) ( not ( = ?auto_604391 ?auto_604392 ) ) ( not ( = ?auto_604391 ?auto_604393 ) ) ( not ( = ?auto_604391 ?auto_604394 ) ) ( not ( = ?auto_604391 ?auto_604395 ) ) ( not ( = ?auto_604392 ?auto_604393 ) ) ( not ( = ?auto_604392 ?auto_604394 ) ) ( not ( = ?auto_604392 ?auto_604395 ) ) ( not ( = ?auto_604393 ?auto_604394 ) ) ( not ( = ?auto_604393 ?auto_604395 ) ) ( not ( = ?auto_604394 ?auto_604395 ) ) ( ON ?auto_604394 ?auto_604395 ) ( ON ?auto_604393 ?auto_604394 ) ( CLEAR ?auto_604391 ) ( ON ?auto_604392 ?auto_604393 ) ( CLEAR ?auto_604392 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_604379 ?auto_604380 ?auto_604381 ?auto_604382 ?auto_604383 ?auto_604384 ?auto_604385 ?auto_604386 ?auto_604387 ?auto_604388 ?auto_604389 ?auto_604390 ?auto_604391 ?auto_604392 )
      ( MAKE-17PILE ?auto_604379 ?auto_604380 ?auto_604381 ?auto_604382 ?auto_604383 ?auto_604384 ?auto_604385 ?auto_604386 ?auto_604387 ?auto_604388 ?auto_604389 ?auto_604390 ?auto_604391 ?auto_604392 ?auto_604393 ?auto_604394 ?auto_604395 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_604413 - BLOCK
      ?auto_604414 - BLOCK
      ?auto_604415 - BLOCK
      ?auto_604416 - BLOCK
      ?auto_604417 - BLOCK
      ?auto_604418 - BLOCK
      ?auto_604419 - BLOCK
      ?auto_604420 - BLOCK
      ?auto_604421 - BLOCK
      ?auto_604422 - BLOCK
      ?auto_604423 - BLOCK
      ?auto_604424 - BLOCK
      ?auto_604425 - BLOCK
      ?auto_604426 - BLOCK
      ?auto_604427 - BLOCK
      ?auto_604428 - BLOCK
      ?auto_604429 - BLOCK
    )
    :vars
    (
      ?auto_604430 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_604429 ?auto_604430 ) ( ON-TABLE ?auto_604413 ) ( ON ?auto_604414 ?auto_604413 ) ( ON ?auto_604415 ?auto_604414 ) ( ON ?auto_604416 ?auto_604415 ) ( ON ?auto_604417 ?auto_604416 ) ( ON ?auto_604418 ?auto_604417 ) ( ON ?auto_604419 ?auto_604418 ) ( ON ?auto_604420 ?auto_604419 ) ( ON ?auto_604421 ?auto_604420 ) ( ON ?auto_604422 ?auto_604421 ) ( ON ?auto_604423 ?auto_604422 ) ( ON ?auto_604424 ?auto_604423 ) ( not ( = ?auto_604413 ?auto_604414 ) ) ( not ( = ?auto_604413 ?auto_604415 ) ) ( not ( = ?auto_604413 ?auto_604416 ) ) ( not ( = ?auto_604413 ?auto_604417 ) ) ( not ( = ?auto_604413 ?auto_604418 ) ) ( not ( = ?auto_604413 ?auto_604419 ) ) ( not ( = ?auto_604413 ?auto_604420 ) ) ( not ( = ?auto_604413 ?auto_604421 ) ) ( not ( = ?auto_604413 ?auto_604422 ) ) ( not ( = ?auto_604413 ?auto_604423 ) ) ( not ( = ?auto_604413 ?auto_604424 ) ) ( not ( = ?auto_604413 ?auto_604425 ) ) ( not ( = ?auto_604413 ?auto_604426 ) ) ( not ( = ?auto_604413 ?auto_604427 ) ) ( not ( = ?auto_604413 ?auto_604428 ) ) ( not ( = ?auto_604413 ?auto_604429 ) ) ( not ( = ?auto_604413 ?auto_604430 ) ) ( not ( = ?auto_604414 ?auto_604415 ) ) ( not ( = ?auto_604414 ?auto_604416 ) ) ( not ( = ?auto_604414 ?auto_604417 ) ) ( not ( = ?auto_604414 ?auto_604418 ) ) ( not ( = ?auto_604414 ?auto_604419 ) ) ( not ( = ?auto_604414 ?auto_604420 ) ) ( not ( = ?auto_604414 ?auto_604421 ) ) ( not ( = ?auto_604414 ?auto_604422 ) ) ( not ( = ?auto_604414 ?auto_604423 ) ) ( not ( = ?auto_604414 ?auto_604424 ) ) ( not ( = ?auto_604414 ?auto_604425 ) ) ( not ( = ?auto_604414 ?auto_604426 ) ) ( not ( = ?auto_604414 ?auto_604427 ) ) ( not ( = ?auto_604414 ?auto_604428 ) ) ( not ( = ?auto_604414 ?auto_604429 ) ) ( not ( = ?auto_604414 ?auto_604430 ) ) ( not ( = ?auto_604415 ?auto_604416 ) ) ( not ( = ?auto_604415 ?auto_604417 ) ) ( not ( = ?auto_604415 ?auto_604418 ) ) ( not ( = ?auto_604415 ?auto_604419 ) ) ( not ( = ?auto_604415 ?auto_604420 ) ) ( not ( = ?auto_604415 ?auto_604421 ) ) ( not ( = ?auto_604415 ?auto_604422 ) ) ( not ( = ?auto_604415 ?auto_604423 ) ) ( not ( = ?auto_604415 ?auto_604424 ) ) ( not ( = ?auto_604415 ?auto_604425 ) ) ( not ( = ?auto_604415 ?auto_604426 ) ) ( not ( = ?auto_604415 ?auto_604427 ) ) ( not ( = ?auto_604415 ?auto_604428 ) ) ( not ( = ?auto_604415 ?auto_604429 ) ) ( not ( = ?auto_604415 ?auto_604430 ) ) ( not ( = ?auto_604416 ?auto_604417 ) ) ( not ( = ?auto_604416 ?auto_604418 ) ) ( not ( = ?auto_604416 ?auto_604419 ) ) ( not ( = ?auto_604416 ?auto_604420 ) ) ( not ( = ?auto_604416 ?auto_604421 ) ) ( not ( = ?auto_604416 ?auto_604422 ) ) ( not ( = ?auto_604416 ?auto_604423 ) ) ( not ( = ?auto_604416 ?auto_604424 ) ) ( not ( = ?auto_604416 ?auto_604425 ) ) ( not ( = ?auto_604416 ?auto_604426 ) ) ( not ( = ?auto_604416 ?auto_604427 ) ) ( not ( = ?auto_604416 ?auto_604428 ) ) ( not ( = ?auto_604416 ?auto_604429 ) ) ( not ( = ?auto_604416 ?auto_604430 ) ) ( not ( = ?auto_604417 ?auto_604418 ) ) ( not ( = ?auto_604417 ?auto_604419 ) ) ( not ( = ?auto_604417 ?auto_604420 ) ) ( not ( = ?auto_604417 ?auto_604421 ) ) ( not ( = ?auto_604417 ?auto_604422 ) ) ( not ( = ?auto_604417 ?auto_604423 ) ) ( not ( = ?auto_604417 ?auto_604424 ) ) ( not ( = ?auto_604417 ?auto_604425 ) ) ( not ( = ?auto_604417 ?auto_604426 ) ) ( not ( = ?auto_604417 ?auto_604427 ) ) ( not ( = ?auto_604417 ?auto_604428 ) ) ( not ( = ?auto_604417 ?auto_604429 ) ) ( not ( = ?auto_604417 ?auto_604430 ) ) ( not ( = ?auto_604418 ?auto_604419 ) ) ( not ( = ?auto_604418 ?auto_604420 ) ) ( not ( = ?auto_604418 ?auto_604421 ) ) ( not ( = ?auto_604418 ?auto_604422 ) ) ( not ( = ?auto_604418 ?auto_604423 ) ) ( not ( = ?auto_604418 ?auto_604424 ) ) ( not ( = ?auto_604418 ?auto_604425 ) ) ( not ( = ?auto_604418 ?auto_604426 ) ) ( not ( = ?auto_604418 ?auto_604427 ) ) ( not ( = ?auto_604418 ?auto_604428 ) ) ( not ( = ?auto_604418 ?auto_604429 ) ) ( not ( = ?auto_604418 ?auto_604430 ) ) ( not ( = ?auto_604419 ?auto_604420 ) ) ( not ( = ?auto_604419 ?auto_604421 ) ) ( not ( = ?auto_604419 ?auto_604422 ) ) ( not ( = ?auto_604419 ?auto_604423 ) ) ( not ( = ?auto_604419 ?auto_604424 ) ) ( not ( = ?auto_604419 ?auto_604425 ) ) ( not ( = ?auto_604419 ?auto_604426 ) ) ( not ( = ?auto_604419 ?auto_604427 ) ) ( not ( = ?auto_604419 ?auto_604428 ) ) ( not ( = ?auto_604419 ?auto_604429 ) ) ( not ( = ?auto_604419 ?auto_604430 ) ) ( not ( = ?auto_604420 ?auto_604421 ) ) ( not ( = ?auto_604420 ?auto_604422 ) ) ( not ( = ?auto_604420 ?auto_604423 ) ) ( not ( = ?auto_604420 ?auto_604424 ) ) ( not ( = ?auto_604420 ?auto_604425 ) ) ( not ( = ?auto_604420 ?auto_604426 ) ) ( not ( = ?auto_604420 ?auto_604427 ) ) ( not ( = ?auto_604420 ?auto_604428 ) ) ( not ( = ?auto_604420 ?auto_604429 ) ) ( not ( = ?auto_604420 ?auto_604430 ) ) ( not ( = ?auto_604421 ?auto_604422 ) ) ( not ( = ?auto_604421 ?auto_604423 ) ) ( not ( = ?auto_604421 ?auto_604424 ) ) ( not ( = ?auto_604421 ?auto_604425 ) ) ( not ( = ?auto_604421 ?auto_604426 ) ) ( not ( = ?auto_604421 ?auto_604427 ) ) ( not ( = ?auto_604421 ?auto_604428 ) ) ( not ( = ?auto_604421 ?auto_604429 ) ) ( not ( = ?auto_604421 ?auto_604430 ) ) ( not ( = ?auto_604422 ?auto_604423 ) ) ( not ( = ?auto_604422 ?auto_604424 ) ) ( not ( = ?auto_604422 ?auto_604425 ) ) ( not ( = ?auto_604422 ?auto_604426 ) ) ( not ( = ?auto_604422 ?auto_604427 ) ) ( not ( = ?auto_604422 ?auto_604428 ) ) ( not ( = ?auto_604422 ?auto_604429 ) ) ( not ( = ?auto_604422 ?auto_604430 ) ) ( not ( = ?auto_604423 ?auto_604424 ) ) ( not ( = ?auto_604423 ?auto_604425 ) ) ( not ( = ?auto_604423 ?auto_604426 ) ) ( not ( = ?auto_604423 ?auto_604427 ) ) ( not ( = ?auto_604423 ?auto_604428 ) ) ( not ( = ?auto_604423 ?auto_604429 ) ) ( not ( = ?auto_604423 ?auto_604430 ) ) ( not ( = ?auto_604424 ?auto_604425 ) ) ( not ( = ?auto_604424 ?auto_604426 ) ) ( not ( = ?auto_604424 ?auto_604427 ) ) ( not ( = ?auto_604424 ?auto_604428 ) ) ( not ( = ?auto_604424 ?auto_604429 ) ) ( not ( = ?auto_604424 ?auto_604430 ) ) ( not ( = ?auto_604425 ?auto_604426 ) ) ( not ( = ?auto_604425 ?auto_604427 ) ) ( not ( = ?auto_604425 ?auto_604428 ) ) ( not ( = ?auto_604425 ?auto_604429 ) ) ( not ( = ?auto_604425 ?auto_604430 ) ) ( not ( = ?auto_604426 ?auto_604427 ) ) ( not ( = ?auto_604426 ?auto_604428 ) ) ( not ( = ?auto_604426 ?auto_604429 ) ) ( not ( = ?auto_604426 ?auto_604430 ) ) ( not ( = ?auto_604427 ?auto_604428 ) ) ( not ( = ?auto_604427 ?auto_604429 ) ) ( not ( = ?auto_604427 ?auto_604430 ) ) ( not ( = ?auto_604428 ?auto_604429 ) ) ( not ( = ?auto_604428 ?auto_604430 ) ) ( not ( = ?auto_604429 ?auto_604430 ) ) ( ON ?auto_604428 ?auto_604429 ) ( ON ?auto_604427 ?auto_604428 ) ( ON ?auto_604426 ?auto_604427 ) ( CLEAR ?auto_604424 ) ( ON ?auto_604425 ?auto_604426 ) ( CLEAR ?auto_604425 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_604413 ?auto_604414 ?auto_604415 ?auto_604416 ?auto_604417 ?auto_604418 ?auto_604419 ?auto_604420 ?auto_604421 ?auto_604422 ?auto_604423 ?auto_604424 ?auto_604425 )
      ( MAKE-17PILE ?auto_604413 ?auto_604414 ?auto_604415 ?auto_604416 ?auto_604417 ?auto_604418 ?auto_604419 ?auto_604420 ?auto_604421 ?auto_604422 ?auto_604423 ?auto_604424 ?auto_604425 ?auto_604426 ?auto_604427 ?auto_604428 ?auto_604429 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_604448 - BLOCK
      ?auto_604449 - BLOCK
      ?auto_604450 - BLOCK
      ?auto_604451 - BLOCK
      ?auto_604452 - BLOCK
      ?auto_604453 - BLOCK
      ?auto_604454 - BLOCK
      ?auto_604455 - BLOCK
      ?auto_604456 - BLOCK
      ?auto_604457 - BLOCK
      ?auto_604458 - BLOCK
      ?auto_604459 - BLOCK
      ?auto_604460 - BLOCK
      ?auto_604461 - BLOCK
      ?auto_604462 - BLOCK
      ?auto_604463 - BLOCK
      ?auto_604464 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_604464 ) ( ON-TABLE ?auto_604448 ) ( ON ?auto_604449 ?auto_604448 ) ( ON ?auto_604450 ?auto_604449 ) ( ON ?auto_604451 ?auto_604450 ) ( ON ?auto_604452 ?auto_604451 ) ( ON ?auto_604453 ?auto_604452 ) ( ON ?auto_604454 ?auto_604453 ) ( ON ?auto_604455 ?auto_604454 ) ( ON ?auto_604456 ?auto_604455 ) ( ON ?auto_604457 ?auto_604456 ) ( ON ?auto_604458 ?auto_604457 ) ( ON ?auto_604459 ?auto_604458 ) ( not ( = ?auto_604448 ?auto_604449 ) ) ( not ( = ?auto_604448 ?auto_604450 ) ) ( not ( = ?auto_604448 ?auto_604451 ) ) ( not ( = ?auto_604448 ?auto_604452 ) ) ( not ( = ?auto_604448 ?auto_604453 ) ) ( not ( = ?auto_604448 ?auto_604454 ) ) ( not ( = ?auto_604448 ?auto_604455 ) ) ( not ( = ?auto_604448 ?auto_604456 ) ) ( not ( = ?auto_604448 ?auto_604457 ) ) ( not ( = ?auto_604448 ?auto_604458 ) ) ( not ( = ?auto_604448 ?auto_604459 ) ) ( not ( = ?auto_604448 ?auto_604460 ) ) ( not ( = ?auto_604448 ?auto_604461 ) ) ( not ( = ?auto_604448 ?auto_604462 ) ) ( not ( = ?auto_604448 ?auto_604463 ) ) ( not ( = ?auto_604448 ?auto_604464 ) ) ( not ( = ?auto_604449 ?auto_604450 ) ) ( not ( = ?auto_604449 ?auto_604451 ) ) ( not ( = ?auto_604449 ?auto_604452 ) ) ( not ( = ?auto_604449 ?auto_604453 ) ) ( not ( = ?auto_604449 ?auto_604454 ) ) ( not ( = ?auto_604449 ?auto_604455 ) ) ( not ( = ?auto_604449 ?auto_604456 ) ) ( not ( = ?auto_604449 ?auto_604457 ) ) ( not ( = ?auto_604449 ?auto_604458 ) ) ( not ( = ?auto_604449 ?auto_604459 ) ) ( not ( = ?auto_604449 ?auto_604460 ) ) ( not ( = ?auto_604449 ?auto_604461 ) ) ( not ( = ?auto_604449 ?auto_604462 ) ) ( not ( = ?auto_604449 ?auto_604463 ) ) ( not ( = ?auto_604449 ?auto_604464 ) ) ( not ( = ?auto_604450 ?auto_604451 ) ) ( not ( = ?auto_604450 ?auto_604452 ) ) ( not ( = ?auto_604450 ?auto_604453 ) ) ( not ( = ?auto_604450 ?auto_604454 ) ) ( not ( = ?auto_604450 ?auto_604455 ) ) ( not ( = ?auto_604450 ?auto_604456 ) ) ( not ( = ?auto_604450 ?auto_604457 ) ) ( not ( = ?auto_604450 ?auto_604458 ) ) ( not ( = ?auto_604450 ?auto_604459 ) ) ( not ( = ?auto_604450 ?auto_604460 ) ) ( not ( = ?auto_604450 ?auto_604461 ) ) ( not ( = ?auto_604450 ?auto_604462 ) ) ( not ( = ?auto_604450 ?auto_604463 ) ) ( not ( = ?auto_604450 ?auto_604464 ) ) ( not ( = ?auto_604451 ?auto_604452 ) ) ( not ( = ?auto_604451 ?auto_604453 ) ) ( not ( = ?auto_604451 ?auto_604454 ) ) ( not ( = ?auto_604451 ?auto_604455 ) ) ( not ( = ?auto_604451 ?auto_604456 ) ) ( not ( = ?auto_604451 ?auto_604457 ) ) ( not ( = ?auto_604451 ?auto_604458 ) ) ( not ( = ?auto_604451 ?auto_604459 ) ) ( not ( = ?auto_604451 ?auto_604460 ) ) ( not ( = ?auto_604451 ?auto_604461 ) ) ( not ( = ?auto_604451 ?auto_604462 ) ) ( not ( = ?auto_604451 ?auto_604463 ) ) ( not ( = ?auto_604451 ?auto_604464 ) ) ( not ( = ?auto_604452 ?auto_604453 ) ) ( not ( = ?auto_604452 ?auto_604454 ) ) ( not ( = ?auto_604452 ?auto_604455 ) ) ( not ( = ?auto_604452 ?auto_604456 ) ) ( not ( = ?auto_604452 ?auto_604457 ) ) ( not ( = ?auto_604452 ?auto_604458 ) ) ( not ( = ?auto_604452 ?auto_604459 ) ) ( not ( = ?auto_604452 ?auto_604460 ) ) ( not ( = ?auto_604452 ?auto_604461 ) ) ( not ( = ?auto_604452 ?auto_604462 ) ) ( not ( = ?auto_604452 ?auto_604463 ) ) ( not ( = ?auto_604452 ?auto_604464 ) ) ( not ( = ?auto_604453 ?auto_604454 ) ) ( not ( = ?auto_604453 ?auto_604455 ) ) ( not ( = ?auto_604453 ?auto_604456 ) ) ( not ( = ?auto_604453 ?auto_604457 ) ) ( not ( = ?auto_604453 ?auto_604458 ) ) ( not ( = ?auto_604453 ?auto_604459 ) ) ( not ( = ?auto_604453 ?auto_604460 ) ) ( not ( = ?auto_604453 ?auto_604461 ) ) ( not ( = ?auto_604453 ?auto_604462 ) ) ( not ( = ?auto_604453 ?auto_604463 ) ) ( not ( = ?auto_604453 ?auto_604464 ) ) ( not ( = ?auto_604454 ?auto_604455 ) ) ( not ( = ?auto_604454 ?auto_604456 ) ) ( not ( = ?auto_604454 ?auto_604457 ) ) ( not ( = ?auto_604454 ?auto_604458 ) ) ( not ( = ?auto_604454 ?auto_604459 ) ) ( not ( = ?auto_604454 ?auto_604460 ) ) ( not ( = ?auto_604454 ?auto_604461 ) ) ( not ( = ?auto_604454 ?auto_604462 ) ) ( not ( = ?auto_604454 ?auto_604463 ) ) ( not ( = ?auto_604454 ?auto_604464 ) ) ( not ( = ?auto_604455 ?auto_604456 ) ) ( not ( = ?auto_604455 ?auto_604457 ) ) ( not ( = ?auto_604455 ?auto_604458 ) ) ( not ( = ?auto_604455 ?auto_604459 ) ) ( not ( = ?auto_604455 ?auto_604460 ) ) ( not ( = ?auto_604455 ?auto_604461 ) ) ( not ( = ?auto_604455 ?auto_604462 ) ) ( not ( = ?auto_604455 ?auto_604463 ) ) ( not ( = ?auto_604455 ?auto_604464 ) ) ( not ( = ?auto_604456 ?auto_604457 ) ) ( not ( = ?auto_604456 ?auto_604458 ) ) ( not ( = ?auto_604456 ?auto_604459 ) ) ( not ( = ?auto_604456 ?auto_604460 ) ) ( not ( = ?auto_604456 ?auto_604461 ) ) ( not ( = ?auto_604456 ?auto_604462 ) ) ( not ( = ?auto_604456 ?auto_604463 ) ) ( not ( = ?auto_604456 ?auto_604464 ) ) ( not ( = ?auto_604457 ?auto_604458 ) ) ( not ( = ?auto_604457 ?auto_604459 ) ) ( not ( = ?auto_604457 ?auto_604460 ) ) ( not ( = ?auto_604457 ?auto_604461 ) ) ( not ( = ?auto_604457 ?auto_604462 ) ) ( not ( = ?auto_604457 ?auto_604463 ) ) ( not ( = ?auto_604457 ?auto_604464 ) ) ( not ( = ?auto_604458 ?auto_604459 ) ) ( not ( = ?auto_604458 ?auto_604460 ) ) ( not ( = ?auto_604458 ?auto_604461 ) ) ( not ( = ?auto_604458 ?auto_604462 ) ) ( not ( = ?auto_604458 ?auto_604463 ) ) ( not ( = ?auto_604458 ?auto_604464 ) ) ( not ( = ?auto_604459 ?auto_604460 ) ) ( not ( = ?auto_604459 ?auto_604461 ) ) ( not ( = ?auto_604459 ?auto_604462 ) ) ( not ( = ?auto_604459 ?auto_604463 ) ) ( not ( = ?auto_604459 ?auto_604464 ) ) ( not ( = ?auto_604460 ?auto_604461 ) ) ( not ( = ?auto_604460 ?auto_604462 ) ) ( not ( = ?auto_604460 ?auto_604463 ) ) ( not ( = ?auto_604460 ?auto_604464 ) ) ( not ( = ?auto_604461 ?auto_604462 ) ) ( not ( = ?auto_604461 ?auto_604463 ) ) ( not ( = ?auto_604461 ?auto_604464 ) ) ( not ( = ?auto_604462 ?auto_604463 ) ) ( not ( = ?auto_604462 ?auto_604464 ) ) ( not ( = ?auto_604463 ?auto_604464 ) ) ( ON ?auto_604463 ?auto_604464 ) ( ON ?auto_604462 ?auto_604463 ) ( ON ?auto_604461 ?auto_604462 ) ( CLEAR ?auto_604459 ) ( ON ?auto_604460 ?auto_604461 ) ( CLEAR ?auto_604460 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_604448 ?auto_604449 ?auto_604450 ?auto_604451 ?auto_604452 ?auto_604453 ?auto_604454 ?auto_604455 ?auto_604456 ?auto_604457 ?auto_604458 ?auto_604459 ?auto_604460 )
      ( MAKE-17PILE ?auto_604448 ?auto_604449 ?auto_604450 ?auto_604451 ?auto_604452 ?auto_604453 ?auto_604454 ?auto_604455 ?auto_604456 ?auto_604457 ?auto_604458 ?auto_604459 ?auto_604460 ?auto_604461 ?auto_604462 ?auto_604463 ?auto_604464 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_604482 - BLOCK
      ?auto_604483 - BLOCK
      ?auto_604484 - BLOCK
      ?auto_604485 - BLOCK
      ?auto_604486 - BLOCK
      ?auto_604487 - BLOCK
      ?auto_604488 - BLOCK
      ?auto_604489 - BLOCK
      ?auto_604490 - BLOCK
      ?auto_604491 - BLOCK
      ?auto_604492 - BLOCK
      ?auto_604493 - BLOCK
      ?auto_604494 - BLOCK
      ?auto_604495 - BLOCK
      ?auto_604496 - BLOCK
      ?auto_604497 - BLOCK
      ?auto_604498 - BLOCK
    )
    :vars
    (
      ?auto_604499 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_604498 ?auto_604499 ) ( ON-TABLE ?auto_604482 ) ( ON ?auto_604483 ?auto_604482 ) ( ON ?auto_604484 ?auto_604483 ) ( ON ?auto_604485 ?auto_604484 ) ( ON ?auto_604486 ?auto_604485 ) ( ON ?auto_604487 ?auto_604486 ) ( ON ?auto_604488 ?auto_604487 ) ( ON ?auto_604489 ?auto_604488 ) ( ON ?auto_604490 ?auto_604489 ) ( ON ?auto_604491 ?auto_604490 ) ( ON ?auto_604492 ?auto_604491 ) ( not ( = ?auto_604482 ?auto_604483 ) ) ( not ( = ?auto_604482 ?auto_604484 ) ) ( not ( = ?auto_604482 ?auto_604485 ) ) ( not ( = ?auto_604482 ?auto_604486 ) ) ( not ( = ?auto_604482 ?auto_604487 ) ) ( not ( = ?auto_604482 ?auto_604488 ) ) ( not ( = ?auto_604482 ?auto_604489 ) ) ( not ( = ?auto_604482 ?auto_604490 ) ) ( not ( = ?auto_604482 ?auto_604491 ) ) ( not ( = ?auto_604482 ?auto_604492 ) ) ( not ( = ?auto_604482 ?auto_604493 ) ) ( not ( = ?auto_604482 ?auto_604494 ) ) ( not ( = ?auto_604482 ?auto_604495 ) ) ( not ( = ?auto_604482 ?auto_604496 ) ) ( not ( = ?auto_604482 ?auto_604497 ) ) ( not ( = ?auto_604482 ?auto_604498 ) ) ( not ( = ?auto_604482 ?auto_604499 ) ) ( not ( = ?auto_604483 ?auto_604484 ) ) ( not ( = ?auto_604483 ?auto_604485 ) ) ( not ( = ?auto_604483 ?auto_604486 ) ) ( not ( = ?auto_604483 ?auto_604487 ) ) ( not ( = ?auto_604483 ?auto_604488 ) ) ( not ( = ?auto_604483 ?auto_604489 ) ) ( not ( = ?auto_604483 ?auto_604490 ) ) ( not ( = ?auto_604483 ?auto_604491 ) ) ( not ( = ?auto_604483 ?auto_604492 ) ) ( not ( = ?auto_604483 ?auto_604493 ) ) ( not ( = ?auto_604483 ?auto_604494 ) ) ( not ( = ?auto_604483 ?auto_604495 ) ) ( not ( = ?auto_604483 ?auto_604496 ) ) ( not ( = ?auto_604483 ?auto_604497 ) ) ( not ( = ?auto_604483 ?auto_604498 ) ) ( not ( = ?auto_604483 ?auto_604499 ) ) ( not ( = ?auto_604484 ?auto_604485 ) ) ( not ( = ?auto_604484 ?auto_604486 ) ) ( not ( = ?auto_604484 ?auto_604487 ) ) ( not ( = ?auto_604484 ?auto_604488 ) ) ( not ( = ?auto_604484 ?auto_604489 ) ) ( not ( = ?auto_604484 ?auto_604490 ) ) ( not ( = ?auto_604484 ?auto_604491 ) ) ( not ( = ?auto_604484 ?auto_604492 ) ) ( not ( = ?auto_604484 ?auto_604493 ) ) ( not ( = ?auto_604484 ?auto_604494 ) ) ( not ( = ?auto_604484 ?auto_604495 ) ) ( not ( = ?auto_604484 ?auto_604496 ) ) ( not ( = ?auto_604484 ?auto_604497 ) ) ( not ( = ?auto_604484 ?auto_604498 ) ) ( not ( = ?auto_604484 ?auto_604499 ) ) ( not ( = ?auto_604485 ?auto_604486 ) ) ( not ( = ?auto_604485 ?auto_604487 ) ) ( not ( = ?auto_604485 ?auto_604488 ) ) ( not ( = ?auto_604485 ?auto_604489 ) ) ( not ( = ?auto_604485 ?auto_604490 ) ) ( not ( = ?auto_604485 ?auto_604491 ) ) ( not ( = ?auto_604485 ?auto_604492 ) ) ( not ( = ?auto_604485 ?auto_604493 ) ) ( not ( = ?auto_604485 ?auto_604494 ) ) ( not ( = ?auto_604485 ?auto_604495 ) ) ( not ( = ?auto_604485 ?auto_604496 ) ) ( not ( = ?auto_604485 ?auto_604497 ) ) ( not ( = ?auto_604485 ?auto_604498 ) ) ( not ( = ?auto_604485 ?auto_604499 ) ) ( not ( = ?auto_604486 ?auto_604487 ) ) ( not ( = ?auto_604486 ?auto_604488 ) ) ( not ( = ?auto_604486 ?auto_604489 ) ) ( not ( = ?auto_604486 ?auto_604490 ) ) ( not ( = ?auto_604486 ?auto_604491 ) ) ( not ( = ?auto_604486 ?auto_604492 ) ) ( not ( = ?auto_604486 ?auto_604493 ) ) ( not ( = ?auto_604486 ?auto_604494 ) ) ( not ( = ?auto_604486 ?auto_604495 ) ) ( not ( = ?auto_604486 ?auto_604496 ) ) ( not ( = ?auto_604486 ?auto_604497 ) ) ( not ( = ?auto_604486 ?auto_604498 ) ) ( not ( = ?auto_604486 ?auto_604499 ) ) ( not ( = ?auto_604487 ?auto_604488 ) ) ( not ( = ?auto_604487 ?auto_604489 ) ) ( not ( = ?auto_604487 ?auto_604490 ) ) ( not ( = ?auto_604487 ?auto_604491 ) ) ( not ( = ?auto_604487 ?auto_604492 ) ) ( not ( = ?auto_604487 ?auto_604493 ) ) ( not ( = ?auto_604487 ?auto_604494 ) ) ( not ( = ?auto_604487 ?auto_604495 ) ) ( not ( = ?auto_604487 ?auto_604496 ) ) ( not ( = ?auto_604487 ?auto_604497 ) ) ( not ( = ?auto_604487 ?auto_604498 ) ) ( not ( = ?auto_604487 ?auto_604499 ) ) ( not ( = ?auto_604488 ?auto_604489 ) ) ( not ( = ?auto_604488 ?auto_604490 ) ) ( not ( = ?auto_604488 ?auto_604491 ) ) ( not ( = ?auto_604488 ?auto_604492 ) ) ( not ( = ?auto_604488 ?auto_604493 ) ) ( not ( = ?auto_604488 ?auto_604494 ) ) ( not ( = ?auto_604488 ?auto_604495 ) ) ( not ( = ?auto_604488 ?auto_604496 ) ) ( not ( = ?auto_604488 ?auto_604497 ) ) ( not ( = ?auto_604488 ?auto_604498 ) ) ( not ( = ?auto_604488 ?auto_604499 ) ) ( not ( = ?auto_604489 ?auto_604490 ) ) ( not ( = ?auto_604489 ?auto_604491 ) ) ( not ( = ?auto_604489 ?auto_604492 ) ) ( not ( = ?auto_604489 ?auto_604493 ) ) ( not ( = ?auto_604489 ?auto_604494 ) ) ( not ( = ?auto_604489 ?auto_604495 ) ) ( not ( = ?auto_604489 ?auto_604496 ) ) ( not ( = ?auto_604489 ?auto_604497 ) ) ( not ( = ?auto_604489 ?auto_604498 ) ) ( not ( = ?auto_604489 ?auto_604499 ) ) ( not ( = ?auto_604490 ?auto_604491 ) ) ( not ( = ?auto_604490 ?auto_604492 ) ) ( not ( = ?auto_604490 ?auto_604493 ) ) ( not ( = ?auto_604490 ?auto_604494 ) ) ( not ( = ?auto_604490 ?auto_604495 ) ) ( not ( = ?auto_604490 ?auto_604496 ) ) ( not ( = ?auto_604490 ?auto_604497 ) ) ( not ( = ?auto_604490 ?auto_604498 ) ) ( not ( = ?auto_604490 ?auto_604499 ) ) ( not ( = ?auto_604491 ?auto_604492 ) ) ( not ( = ?auto_604491 ?auto_604493 ) ) ( not ( = ?auto_604491 ?auto_604494 ) ) ( not ( = ?auto_604491 ?auto_604495 ) ) ( not ( = ?auto_604491 ?auto_604496 ) ) ( not ( = ?auto_604491 ?auto_604497 ) ) ( not ( = ?auto_604491 ?auto_604498 ) ) ( not ( = ?auto_604491 ?auto_604499 ) ) ( not ( = ?auto_604492 ?auto_604493 ) ) ( not ( = ?auto_604492 ?auto_604494 ) ) ( not ( = ?auto_604492 ?auto_604495 ) ) ( not ( = ?auto_604492 ?auto_604496 ) ) ( not ( = ?auto_604492 ?auto_604497 ) ) ( not ( = ?auto_604492 ?auto_604498 ) ) ( not ( = ?auto_604492 ?auto_604499 ) ) ( not ( = ?auto_604493 ?auto_604494 ) ) ( not ( = ?auto_604493 ?auto_604495 ) ) ( not ( = ?auto_604493 ?auto_604496 ) ) ( not ( = ?auto_604493 ?auto_604497 ) ) ( not ( = ?auto_604493 ?auto_604498 ) ) ( not ( = ?auto_604493 ?auto_604499 ) ) ( not ( = ?auto_604494 ?auto_604495 ) ) ( not ( = ?auto_604494 ?auto_604496 ) ) ( not ( = ?auto_604494 ?auto_604497 ) ) ( not ( = ?auto_604494 ?auto_604498 ) ) ( not ( = ?auto_604494 ?auto_604499 ) ) ( not ( = ?auto_604495 ?auto_604496 ) ) ( not ( = ?auto_604495 ?auto_604497 ) ) ( not ( = ?auto_604495 ?auto_604498 ) ) ( not ( = ?auto_604495 ?auto_604499 ) ) ( not ( = ?auto_604496 ?auto_604497 ) ) ( not ( = ?auto_604496 ?auto_604498 ) ) ( not ( = ?auto_604496 ?auto_604499 ) ) ( not ( = ?auto_604497 ?auto_604498 ) ) ( not ( = ?auto_604497 ?auto_604499 ) ) ( not ( = ?auto_604498 ?auto_604499 ) ) ( ON ?auto_604497 ?auto_604498 ) ( ON ?auto_604496 ?auto_604497 ) ( ON ?auto_604495 ?auto_604496 ) ( ON ?auto_604494 ?auto_604495 ) ( CLEAR ?auto_604492 ) ( ON ?auto_604493 ?auto_604494 ) ( CLEAR ?auto_604493 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_604482 ?auto_604483 ?auto_604484 ?auto_604485 ?auto_604486 ?auto_604487 ?auto_604488 ?auto_604489 ?auto_604490 ?auto_604491 ?auto_604492 ?auto_604493 )
      ( MAKE-17PILE ?auto_604482 ?auto_604483 ?auto_604484 ?auto_604485 ?auto_604486 ?auto_604487 ?auto_604488 ?auto_604489 ?auto_604490 ?auto_604491 ?auto_604492 ?auto_604493 ?auto_604494 ?auto_604495 ?auto_604496 ?auto_604497 ?auto_604498 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_604517 - BLOCK
      ?auto_604518 - BLOCK
      ?auto_604519 - BLOCK
      ?auto_604520 - BLOCK
      ?auto_604521 - BLOCK
      ?auto_604522 - BLOCK
      ?auto_604523 - BLOCK
      ?auto_604524 - BLOCK
      ?auto_604525 - BLOCK
      ?auto_604526 - BLOCK
      ?auto_604527 - BLOCK
      ?auto_604528 - BLOCK
      ?auto_604529 - BLOCK
      ?auto_604530 - BLOCK
      ?auto_604531 - BLOCK
      ?auto_604532 - BLOCK
      ?auto_604533 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_604533 ) ( ON-TABLE ?auto_604517 ) ( ON ?auto_604518 ?auto_604517 ) ( ON ?auto_604519 ?auto_604518 ) ( ON ?auto_604520 ?auto_604519 ) ( ON ?auto_604521 ?auto_604520 ) ( ON ?auto_604522 ?auto_604521 ) ( ON ?auto_604523 ?auto_604522 ) ( ON ?auto_604524 ?auto_604523 ) ( ON ?auto_604525 ?auto_604524 ) ( ON ?auto_604526 ?auto_604525 ) ( ON ?auto_604527 ?auto_604526 ) ( not ( = ?auto_604517 ?auto_604518 ) ) ( not ( = ?auto_604517 ?auto_604519 ) ) ( not ( = ?auto_604517 ?auto_604520 ) ) ( not ( = ?auto_604517 ?auto_604521 ) ) ( not ( = ?auto_604517 ?auto_604522 ) ) ( not ( = ?auto_604517 ?auto_604523 ) ) ( not ( = ?auto_604517 ?auto_604524 ) ) ( not ( = ?auto_604517 ?auto_604525 ) ) ( not ( = ?auto_604517 ?auto_604526 ) ) ( not ( = ?auto_604517 ?auto_604527 ) ) ( not ( = ?auto_604517 ?auto_604528 ) ) ( not ( = ?auto_604517 ?auto_604529 ) ) ( not ( = ?auto_604517 ?auto_604530 ) ) ( not ( = ?auto_604517 ?auto_604531 ) ) ( not ( = ?auto_604517 ?auto_604532 ) ) ( not ( = ?auto_604517 ?auto_604533 ) ) ( not ( = ?auto_604518 ?auto_604519 ) ) ( not ( = ?auto_604518 ?auto_604520 ) ) ( not ( = ?auto_604518 ?auto_604521 ) ) ( not ( = ?auto_604518 ?auto_604522 ) ) ( not ( = ?auto_604518 ?auto_604523 ) ) ( not ( = ?auto_604518 ?auto_604524 ) ) ( not ( = ?auto_604518 ?auto_604525 ) ) ( not ( = ?auto_604518 ?auto_604526 ) ) ( not ( = ?auto_604518 ?auto_604527 ) ) ( not ( = ?auto_604518 ?auto_604528 ) ) ( not ( = ?auto_604518 ?auto_604529 ) ) ( not ( = ?auto_604518 ?auto_604530 ) ) ( not ( = ?auto_604518 ?auto_604531 ) ) ( not ( = ?auto_604518 ?auto_604532 ) ) ( not ( = ?auto_604518 ?auto_604533 ) ) ( not ( = ?auto_604519 ?auto_604520 ) ) ( not ( = ?auto_604519 ?auto_604521 ) ) ( not ( = ?auto_604519 ?auto_604522 ) ) ( not ( = ?auto_604519 ?auto_604523 ) ) ( not ( = ?auto_604519 ?auto_604524 ) ) ( not ( = ?auto_604519 ?auto_604525 ) ) ( not ( = ?auto_604519 ?auto_604526 ) ) ( not ( = ?auto_604519 ?auto_604527 ) ) ( not ( = ?auto_604519 ?auto_604528 ) ) ( not ( = ?auto_604519 ?auto_604529 ) ) ( not ( = ?auto_604519 ?auto_604530 ) ) ( not ( = ?auto_604519 ?auto_604531 ) ) ( not ( = ?auto_604519 ?auto_604532 ) ) ( not ( = ?auto_604519 ?auto_604533 ) ) ( not ( = ?auto_604520 ?auto_604521 ) ) ( not ( = ?auto_604520 ?auto_604522 ) ) ( not ( = ?auto_604520 ?auto_604523 ) ) ( not ( = ?auto_604520 ?auto_604524 ) ) ( not ( = ?auto_604520 ?auto_604525 ) ) ( not ( = ?auto_604520 ?auto_604526 ) ) ( not ( = ?auto_604520 ?auto_604527 ) ) ( not ( = ?auto_604520 ?auto_604528 ) ) ( not ( = ?auto_604520 ?auto_604529 ) ) ( not ( = ?auto_604520 ?auto_604530 ) ) ( not ( = ?auto_604520 ?auto_604531 ) ) ( not ( = ?auto_604520 ?auto_604532 ) ) ( not ( = ?auto_604520 ?auto_604533 ) ) ( not ( = ?auto_604521 ?auto_604522 ) ) ( not ( = ?auto_604521 ?auto_604523 ) ) ( not ( = ?auto_604521 ?auto_604524 ) ) ( not ( = ?auto_604521 ?auto_604525 ) ) ( not ( = ?auto_604521 ?auto_604526 ) ) ( not ( = ?auto_604521 ?auto_604527 ) ) ( not ( = ?auto_604521 ?auto_604528 ) ) ( not ( = ?auto_604521 ?auto_604529 ) ) ( not ( = ?auto_604521 ?auto_604530 ) ) ( not ( = ?auto_604521 ?auto_604531 ) ) ( not ( = ?auto_604521 ?auto_604532 ) ) ( not ( = ?auto_604521 ?auto_604533 ) ) ( not ( = ?auto_604522 ?auto_604523 ) ) ( not ( = ?auto_604522 ?auto_604524 ) ) ( not ( = ?auto_604522 ?auto_604525 ) ) ( not ( = ?auto_604522 ?auto_604526 ) ) ( not ( = ?auto_604522 ?auto_604527 ) ) ( not ( = ?auto_604522 ?auto_604528 ) ) ( not ( = ?auto_604522 ?auto_604529 ) ) ( not ( = ?auto_604522 ?auto_604530 ) ) ( not ( = ?auto_604522 ?auto_604531 ) ) ( not ( = ?auto_604522 ?auto_604532 ) ) ( not ( = ?auto_604522 ?auto_604533 ) ) ( not ( = ?auto_604523 ?auto_604524 ) ) ( not ( = ?auto_604523 ?auto_604525 ) ) ( not ( = ?auto_604523 ?auto_604526 ) ) ( not ( = ?auto_604523 ?auto_604527 ) ) ( not ( = ?auto_604523 ?auto_604528 ) ) ( not ( = ?auto_604523 ?auto_604529 ) ) ( not ( = ?auto_604523 ?auto_604530 ) ) ( not ( = ?auto_604523 ?auto_604531 ) ) ( not ( = ?auto_604523 ?auto_604532 ) ) ( not ( = ?auto_604523 ?auto_604533 ) ) ( not ( = ?auto_604524 ?auto_604525 ) ) ( not ( = ?auto_604524 ?auto_604526 ) ) ( not ( = ?auto_604524 ?auto_604527 ) ) ( not ( = ?auto_604524 ?auto_604528 ) ) ( not ( = ?auto_604524 ?auto_604529 ) ) ( not ( = ?auto_604524 ?auto_604530 ) ) ( not ( = ?auto_604524 ?auto_604531 ) ) ( not ( = ?auto_604524 ?auto_604532 ) ) ( not ( = ?auto_604524 ?auto_604533 ) ) ( not ( = ?auto_604525 ?auto_604526 ) ) ( not ( = ?auto_604525 ?auto_604527 ) ) ( not ( = ?auto_604525 ?auto_604528 ) ) ( not ( = ?auto_604525 ?auto_604529 ) ) ( not ( = ?auto_604525 ?auto_604530 ) ) ( not ( = ?auto_604525 ?auto_604531 ) ) ( not ( = ?auto_604525 ?auto_604532 ) ) ( not ( = ?auto_604525 ?auto_604533 ) ) ( not ( = ?auto_604526 ?auto_604527 ) ) ( not ( = ?auto_604526 ?auto_604528 ) ) ( not ( = ?auto_604526 ?auto_604529 ) ) ( not ( = ?auto_604526 ?auto_604530 ) ) ( not ( = ?auto_604526 ?auto_604531 ) ) ( not ( = ?auto_604526 ?auto_604532 ) ) ( not ( = ?auto_604526 ?auto_604533 ) ) ( not ( = ?auto_604527 ?auto_604528 ) ) ( not ( = ?auto_604527 ?auto_604529 ) ) ( not ( = ?auto_604527 ?auto_604530 ) ) ( not ( = ?auto_604527 ?auto_604531 ) ) ( not ( = ?auto_604527 ?auto_604532 ) ) ( not ( = ?auto_604527 ?auto_604533 ) ) ( not ( = ?auto_604528 ?auto_604529 ) ) ( not ( = ?auto_604528 ?auto_604530 ) ) ( not ( = ?auto_604528 ?auto_604531 ) ) ( not ( = ?auto_604528 ?auto_604532 ) ) ( not ( = ?auto_604528 ?auto_604533 ) ) ( not ( = ?auto_604529 ?auto_604530 ) ) ( not ( = ?auto_604529 ?auto_604531 ) ) ( not ( = ?auto_604529 ?auto_604532 ) ) ( not ( = ?auto_604529 ?auto_604533 ) ) ( not ( = ?auto_604530 ?auto_604531 ) ) ( not ( = ?auto_604530 ?auto_604532 ) ) ( not ( = ?auto_604530 ?auto_604533 ) ) ( not ( = ?auto_604531 ?auto_604532 ) ) ( not ( = ?auto_604531 ?auto_604533 ) ) ( not ( = ?auto_604532 ?auto_604533 ) ) ( ON ?auto_604532 ?auto_604533 ) ( ON ?auto_604531 ?auto_604532 ) ( ON ?auto_604530 ?auto_604531 ) ( ON ?auto_604529 ?auto_604530 ) ( CLEAR ?auto_604527 ) ( ON ?auto_604528 ?auto_604529 ) ( CLEAR ?auto_604528 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_604517 ?auto_604518 ?auto_604519 ?auto_604520 ?auto_604521 ?auto_604522 ?auto_604523 ?auto_604524 ?auto_604525 ?auto_604526 ?auto_604527 ?auto_604528 )
      ( MAKE-17PILE ?auto_604517 ?auto_604518 ?auto_604519 ?auto_604520 ?auto_604521 ?auto_604522 ?auto_604523 ?auto_604524 ?auto_604525 ?auto_604526 ?auto_604527 ?auto_604528 ?auto_604529 ?auto_604530 ?auto_604531 ?auto_604532 ?auto_604533 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_604551 - BLOCK
      ?auto_604552 - BLOCK
      ?auto_604553 - BLOCK
      ?auto_604554 - BLOCK
      ?auto_604555 - BLOCK
      ?auto_604556 - BLOCK
      ?auto_604557 - BLOCK
      ?auto_604558 - BLOCK
      ?auto_604559 - BLOCK
      ?auto_604560 - BLOCK
      ?auto_604561 - BLOCK
      ?auto_604562 - BLOCK
      ?auto_604563 - BLOCK
      ?auto_604564 - BLOCK
      ?auto_604565 - BLOCK
      ?auto_604566 - BLOCK
      ?auto_604567 - BLOCK
    )
    :vars
    (
      ?auto_604568 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_604567 ?auto_604568 ) ( ON-TABLE ?auto_604551 ) ( ON ?auto_604552 ?auto_604551 ) ( ON ?auto_604553 ?auto_604552 ) ( ON ?auto_604554 ?auto_604553 ) ( ON ?auto_604555 ?auto_604554 ) ( ON ?auto_604556 ?auto_604555 ) ( ON ?auto_604557 ?auto_604556 ) ( ON ?auto_604558 ?auto_604557 ) ( ON ?auto_604559 ?auto_604558 ) ( ON ?auto_604560 ?auto_604559 ) ( not ( = ?auto_604551 ?auto_604552 ) ) ( not ( = ?auto_604551 ?auto_604553 ) ) ( not ( = ?auto_604551 ?auto_604554 ) ) ( not ( = ?auto_604551 ?auto_604555 ) ) ( not ( = ?auto_604551 ?auto_604556 ) ) ( not ( = ?auto_604551 ?auto_604557 ) ) ( not ( = ?auto_604551 ?auto_604558 ) ) ( not ( = ?auto_604551 ?auto_604559 ) ) ( not ( = ?auto_604551 ?auto_604560 ) ) ( not ( = ?auto_604551 ?auto_604561 ) ) ( not ( = ?auto_604551 ?auto_604562 ) ) ( not ( = ?auto_604551 ?auto_604563 ) ) ( not ( = ?auto_604551 ?auto_604564 ) ) ( not ( = ?auto_604551 ?auto_604565 ) ) ( not ( = ?auto_604551 ?auto_604566 ) ) ( not ( = ?auto_604551 ?auto_604567 ) ) ( not ( = ?auto_604551 ?auto_604568 ) ) ( not ( = ?auto_604552 ?auto_604553 ) ) ( not ( = ?auto_604552 ?auto_604554 ) ) ( not ( = ?auto_604552 ?auto_604555 ) ) ( not ( = ?auto_604552 ?auto_604556 ) ) ( not ( = ?auto_604552 ?auto_604557 ) ) ( not ( = ?auto_604552 ?auto_604558 ) ) ( not ( = ?auto_604552 ?auto_604559 ) ) ( not ( = ?auto_604552 ?auto_604560 ) ) ( not ( = ?auto_604552 ?auto_604561 ) ) ( not ( = ?auto_604552 ?auto_604562 ) ) ( not ( = ?auto_604552 ?auto_604563 ) ) ( not ( = ?auto_604552 ?auto_604564 ) ) ( not ( = ?auto_604552 ?auto_604565 ) ) ( not ( = ?auto_604552 ?auto_604566 ) ) ( not ( = ?auto_604552 ?auto_604567 ) ) ( not ( = ?auto_604552 ?auto_604568 ) ) ( not ( = ?auto_604553 ?auto_604554 ) ) ( not ( = ?auto_604553 ?auto_604555 ) ) ( not ( = ?auto_604553 ?auto_604556 ) ) ( not ( = ?auto_604553 ?auto_604557 ) ) ( not ( = ?auto_604553 ?auto_604558 ) ) ( not ( = ?auto_604553 ?auto_604559 ) ) ( not ( = ?auto_604553 ?auto_604560 ) ) ( not ( = ?auto_604553 ?auto_604561 ) ) ( not ( = ?auto_604553 ?auto_604562 ) ) ( not ( = ?auto_604553 ?auto_604563 ) ) ( not ( = ?auto_604553 ?auto_604564 ) ) ( not ( = ?auto_604553 ?auto_604565 ) ) ( not ( = ?auto_604553 ?auto_604566 ) ) ( not ( = ?auto_604553 ?auto_604567 ) ) ( not ( = ?auto_604553 ?auto_604568 ) ) ( not ( = ?auto_604554 ?auto_604555 ) ) ( not ( = ?auto_604554 ?auto_604556 ) ) ( not ( = ?auto_604554 ?auto_604557 ) ) ( not ( = ?auto_604554 ?auto_604558 ) ) ( not ( = ?auto_604554 ?auto_604559 ) ) ( not ( = ?auto_604554 ?auto_604560 ) ) ( not ( = ?auto_604554 ?auto_604561 ) ) ( not ( = ?auto_604554 ?auto_604562 ) ) ( not ( = ?auto_604554 ?auto_604563 ) ) ( not ( = ?auto_604554 ?auto_604564 ) ) ( not ( = ?auto_604554 ?auto_604565 ) ) ( not ( = ?auto_604554 ?auto_604566 ) ) ( not ( = ?auto_604554 ?auto_604567 ) ) ( not ( = ?auto_604554 ?auto_604568 ) ) ( not ( = ?auto_604555 ?auto_604556 ) ) ( not ( = ?auto_604555 ?auto_604557 ) ) ( not ( = ?auto_604555 ?auto_604558 ) ) ( not ( = ?auto_604555 ?auto_604559 ) ) ( not ( = ?auto_604555 ?auto_604560 ) ) ( not ( = ?auto_604555 ?auto_604561 ) ) ( not ( = ?auto_604555 ?auto_604562 ) ) ( not ( = ?auto_604555 ?auto_604563 ) ) ( not ( = ?auto_604555 ?auto_604564 ) ) ( not ( = ?auto_604555 ?auto_604565 ) ) ( not ( = ?auto_604555 ?auto_604566 ) ) ( not ( = ?auto_604555 ?auto_604567 ) ) ( not ( = ?auto_604555 ?auto_604568 ) ) ( not ( = ?auto_604556 ?auto_604557 ) ) ( not ( = ?auto_604556 ?auto_604558 ) ) ( not ( = ?auto_604556 ?auto_604559 ) ) ( not ( = ?auto_604556 ?auto_604560 ) ) ( not ( = ?auto_604556 ?auto_604561 ) ) ( not ( = ?auto_604556 ?auto_604562 ) ) ( not ( = ?auto_604556 ?auto_604563 ) ) ( not ( = ?auto_604556 ?auto_604564 ) ) ( not ( = ?auto_604556 ?auto_604565 ) ) ( not ( = ?auto_604556 ?auto_604566 ) ) ( not ( = ?auto_604556 ?auto_604567 ) ) ( not ( = ?auto_604556 ?auto_604568 ) ) ( not ( = ?auto_604557 ?auto_604558 ) ) ( not ( = ?auto_604557 ?auto_604559 ) ) ( not ( = ?auto_604557 ?auto_604560 ) ) ( not ( = ?auto_604557 ?auto_604561 ) ) ( not ( = ?auto_604557 ?auto_604562 ) ) ( not ( = ?auto_604557 ?auto_604563 ) ) ( not ( = ?auto_604557 ?auto_604564 ) ) ( not ( = ?auto_604557 ?auto_604565 ) ) ( not ( = ?auto_604557 ?auto_604566 ) ) ( not ( = ?auto_604557 ?auto_604567 ) ) ( not ( = ?auto_604557 ?auto_604568 ) ) ( not ( = ?auto_604558 ?auto_604559 ) ) ( not ( = ?auto_604558 ?auto_604560 ) ) ( not ( = ?auto_604558 ?auto_604561 ) ) ( not ( = ?auto_604558 ?auto_604562 ) ) ( not ( = ?auto_604558 ?auto_604563 ) ) ( not ( = ?auto_604558 ?auto_604564 ) ) ( not ( = ?auto_604558 ?auto_604565 ) ) ( not ( = ?auto_604558 ?auto_604566 ) ) ( not ( = ?auto_604558 ?auto_604567 ) ) ( not ( = ?auto_604558 ?auto_604568 ) ) ( not ( = ?auto_604559 ?auto_604560 ) ) ( not ( = ?auto_604559 ?auto_604561 ) ) ( not ( = ?auto_604559 ?auto_604562 ) ) ( not ( = ?auto_604559 ?auto_604563 ) ) ( not ( = ?auto_604559 ?auto_604564 ) ) ( not ( = ?auto_604559 ?auto_604565 ) ) ( not ( = ?auto_604559 ?auto_604566 ) ) ( not ( = ?auto_604559 ?auto_604567 ) ) ( not ( = ?auto_604559 ?auto_604568 ) ) ( not ( = ?auto_604560 ?auto_604561 ) ) ( not ( = ?auto_604560 ?auto_604562 ) ) ( not ( = ?auto_604560 ?auto_604563 ) ) ( not ( = ?auto_604560 ?auto_604564 ) ) ( not ( = ?auto_604560 ?auto_604565 ) ) ( not ( = ?auto_604560 ?auto_604566 ) ) ( not ( = ?auto_604560 ?auto_604567 ) ) ( not ( = ?auto_604560 ?auto_604568 ) ) ( not ( = ?auto_604561 ?auto_604562 ) ) ( not ( = ?auto_604561 ?auto_604563 ) ) ( not ( = ?auto_604561 ?auto_604564 ) ) ( not ( = ?auto_604561 ?auto_604565 ) ) ( not ( = ?auto_604561 ?auto_604566 ) ) ( not ( = ?auto_604561 ?auto_604567 ) ) ( not ( = ?auto_604561 ?auto_604568 ) ) ( not ( = ?auto_604562 ?auto_604563 ) ) ( not ( = ?auto_604562 ?auto_604564 ) ) ( not ( = ?auto_604562 ?auto_604565 ) ) ( not ( = ?auto_604562 ?auto_604566 ) ) ( not ( = ?auto_604562 ?auto_604567 ) ) ( not ( = ?auto_604562 ?auto_604568 ) ) ( not ( = ?auto_604563 ?auto_604564 ) ) ( not ( = ?auto_604563 ?auto_604565 ) ) ( not ( = ?auto_604563 ?auto_604566 ) ) ( not ( = ?auto_604563 ?auto_604567 ) ) ( not ( = ?auto_604563 ?auto_604568 ) ) ( not ( = ?auto_604564 ?auto_604565 ) ) ( not ( = ?auto_604564 ?auto_604566 ) ) ( not ( = ?auto_604564 ?auto_604567 ) ) ( not ( = ?auto_604564 ?auto_604568 ) ) ( not ( = ?auto_604565 ?auto_604566 ) ) ( not ( = ?auto_604565 ?auto_604567 ) ) ( not ( = ?auto_604565 ?auto_604568 ) ) ( not ( = ?auto_604566 ?auto_604567 ) ) ( not ( = ?auto_604566 ?auto_604568 ) ) ( not ( = ?auto_604567 ?auto_604568 ) ) ( ON ?auto_604566 ?auto_604567 ) ( ON ?auto_604565 ?auto_604566 ) ( ON ?auto_604564 ?auto_604565 ) ( ON ?auto_604563 ?auto_604564 ) ( ON ?auto_604562 ?auto_604563 ) ( CLEAR ?auto_604560 ) ( ON ?auto_604561 ?auto_604562 ) ( CLEAR ?auto_604561 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_604551 ?auto_604552 ?auto_604553 ?auto_604554 ?auto_604555 ?auto_604556 ?auto_604557 ?auto_604558 ?auto_604559 ?auto_604560 ?auto_604561 )
      ( MAKE-17PILE ?auto_604551 ?auto_604552 ?auto_604553 ?auto_604554 ?auto_604555 ?auto_604556 ?auto_604557 ?auto_604558 ?auto_604559 ?auto_604560 ?auto_604561 ?auto_604562 ?auto_604563 ?auto_604564 ?auto_604565 ?auto_604566 ?auto_604567 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_604586 - BLOCK
      ?auto_604587 - BLOCK
      ?auto_604588 - BLOCK
      ?auto_604589 - BLOCK
      ?auto_604590 - BLOCK
      ?auto_604591 - BLOCK
      ?auto_604592 - BLOCK
      ?auto_604593 - BLOCK
      ?auto_604594 - BLOCK
      ?auto_604595 - BLOCK
      ?auto_604596 - BLOCK
      ?auto_604597 - BLOCK
      ?auto_604598 - BLOCK
      ?auto_604599 - BLOCK
      ?auto_604600 - BLOCK
      ?auto_604601 - BLOCK
      ?auto_604602 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_604602 ) ( ON-TABLE ?auto_604586 ) ( ON ?auto_604587 ?auto_604586 ) ( ON ?auto_604588 ?auto_604587 ) ( ON ?auto_604589 ?auto_604588 ) ( ON ?auto_604590 ?auto_604589 ) ( ON ?auto_604591 ?auto_604590 ) ( ON ?auto_604592 ?auto_604591 ) ( ON ?auto_604593 ?auto_604592 ) ( ON ?auto_604594 ?auto_604593 ) ( ON ?auto_604595 ?auto_604594 ) ( not ( = ?auto_604586 ?auto_604587 ) ) ( not ( = ?auto_604586 ?auto_604588 ) ) ( not ( = ?auto_604586 ?auto_604589 ) ) ( not ( = ?auto_604586 ?auto_604590 ) ) ( not ( = ?auto_604586 ?auto_604591 ) ) ( not ( = ?auto_604586 ?auto_604592 ) ) ( not ( = ?auto_604586 ?auto_604593 ) ) ( not ( = ?auto_604586 ?auto_604594 ) ) ( not ( = ?auto_604586 ?auto_604595 ) ) ( not ( = ?auto_604586 ?auto_604596 ) ) ( not ( = ?auto_604586 ?auto_604597 ) ) ( not ( = ?auto_604586 ?auto_604598 ) ) ( not ( = ?auto_604586 ?auto_604599 ) ) ( not ( = ?auto_604586 ?auto_604600 ) ) ( not ( = ?auto_604586 ?auto_604601 ) ) ( not ( = ?auto_604586 ?auto_604602 ) ) ( not ( = ?auto_604587 ?auto_604588 ) ) ( not ( = ?auto_604587 ?auto_604589 ) ) ( not ( = ?auto_604587 ?auto_604590 ) ) ( not ( = ?auto_604587 ?auto_604591 ) ) ( not ( = ?auto_604587 ?auto_604592 ) ) ( not ( = ?auto_604587 ?auto_604593 ) ) ( not ( = ?auto_604587 ?auto_604594 ) ) ( not ( = ?auto_604587 ?auto_604595 ) ) ( not ( = ?auto_604587 ?auto_604596 ) ) ( not ( = ?auto_604587 ?auto_604597 ) ) ( not ( = ?auto_604587 ?auto_604598 ) ) ( not ( = ?auto_604587 ?auto_604599 ) ) ( not ( = ?auto_604587 ?auto_604600 ) ) ( not ( = ?auto_604587 ?auto_604601 ) ) ( not ( = ?auto_604587 ?auto_604602 ) ) ( not ( = ?auto_604588 ?auto_604589 ) ) ( not ( = ?auto_604588 ?auto_604590 ) ) ( not ( = ?auto_604588 ?auto_604591 ) ) ( not ( = ?auto_604588 ?auto_604592 ) ) ( not ( = ?auto_604588 ?auto_604593 ) ) ( not ( = ?auto_604588 ?auto_604594 ) ) ( not ( = ?auto_604588 ?auto_604595 ) ) ( not ( = ?auto_604588 ?auto_604596 ) ) ( not ( = ?auto_604588 ?auto_604597 ) ) ( not ( = ?auto_604588 ?auto_604598 ) ) ( not ( = ?auto_604588 ?auto_604599 ) ) ( not ( = ?auto_604588 ?auto_604600 ) ) ( not ( = ?auto_604588 ?auto_604601 ) ) ( not ( = ?auto_604588 ?auto_604602 ) ) ( not ( = ?auto_604589 ?auto_604590 ) ) ( not ( = ?auto_604589 ?auto_604591 ) ) ( not ( = ?auto_604589 ?auto_604592 ) ) ( not ( = ?auto_604589 ?auto_604593 ) ) ( not ( = ?auto_604589 ?auto_604594 ) ) ( not ( = ?auto_604589 ?auto_604595 ) ) ( not ( = ?auto_604589 ?auto_604596 ) ) ( not ( = ?auto_604589 ?auto_604597 ) ) ( not ( = ?auto_604589 ?auto_604598 ) ) ( not ( = ?auto_604589 ?auto_604599 ) ) ( not ( = ?auto_604589 ?auto_604600 ) ) ( not ( = ?auto_604589 ?auto_604601 ) ) ( not ( = ?auto_604589 ?auto_604602 ) ) ( not ( = ?auto_604590 ?auto_604591 ) ) ( not ( = ?auto_604590 ?auto_604592 ) ) ( not ( = ?auto_604590 ?auto_604593 ) ) ( not ( = ?auto_604590 ?auto_604594 ) ) ( not ( = ?auto_604590 ?auto_604595 ) ) ( not ( = ?auto_604590 ?auto_604596 ) ) ( not ( = ?auto_604590 ?auto_604597 ) ) ( not ( = ?auto_604590 ?auto_604598 ) ) ( not ( = ?auto_604590 ?auto_604599 ) ) ( not ( = ?auto_604590 ?auto_604600 ) ) ( not ( = ?auto_604590 ?auto_604601 ) ) ( not ( = ?auto_604590 ?auto_604602 ) ) ( not ( = ?auto_604591 ?auto_604592 ) ) ( not ( = ?auto_604591 ?auto_604593 ) ) ( not ( = ?auto_604591 ?auto_604594 ) ) ( not ( = ?auto_604591 ?auto_604595 ) ) ( not ( = ?auto_604591 ?auto_604596 ) ) ( not ( = ?auto_604591 ?auto_604597 ) ) ( not ( = ?auto_604591 ?auto_604598 ) ) ( not ( = ?auto_604591 ?auto_604599 ) ) ( not ( = ?auto_604591 ?auto_604600 ) ) ( not ( = ?auto_604591 ?auto_604601 ) ) ( not ( = ?auto_604591 ?auto_604602 ) ) ( not ( = ?auto_604592 ?auto_604593 ) ) ( not ( = ?auto_604592 ?auto_604594 ) ) ( not ( = ?auto_604592 ?auto_604595 ) ) ( not ( = ?auto_604592 ?auto_604596 ) ) ( not ( = ?auto_604592 ?auto_604597 ) ) ( not ( = ?auto_604592 ?auto_604598 ) ) ( not ( = ?auto_604592 ?auto_604599 ) ) ( not ( = ?auto_604592 ?auto_604600 ) ) ( not ( = ?auto_604592 ?auto_604601 ) ) ( not ( = ?auto_604592 ?auto_604602 ) ) ( not ( = ?auto_604593 ?auto_604594 ) ) ( not ( = ?auto_604593 ?auto_604595 ) ) ( not ( = ?auto_604593 ?auto_604596 ) ) ( not ( = ?auto_604593 ?auto_604597 ) ) ( not ( = ?auto_604593 ?auto_604598 ) ) ( not ( = ?auto_604593 ?auto_604599 ) ) ( not ( = ?auto_604593 ?auto_604600 ) ) ( not ( = ?auto_604593 ?auto_604601 ) ) ( not ( = ?auto_604593 ?auto_604602 ) ) ( not ( = ?auto_604594 ?auto_604595 ) ) ( not ( = ?auto_604594 ?auto_604596 ) ) ( not ( = ?auto_604594 ?auto_604597 ) ) ( not ( = ?auto_604594 ?auto_604598 ) ) ( not ( = ?auto_604594 ?auto_604599 ) ) ( not ( = ?auto_604594 ?auto_604600 ) ) ( not ( = ?auto_604594 ?auto_604601 ) ) ( not ( = ?auto_604594 ?auto_604602 ) ) ( not ( = ?auto_604595 ?auto_604596 ) ) ( not ( = ?auto_604595 ?auto_604597 ) ) ( not ( = ?auto_604595 ?auto_604598 ) ) ( not ( = ?auto_604595 ?auto_604599 ) ) ( not ( = ?auto_604595 ?auto_604600 ) ) ( not ( = ?auto_604595 ?auto_604601 ) ) ( not ( = ?auto_604595 ?auto_604602 ) ) ( not ( = ?auto_604596 ?auto_604597 ) ) ( not ( = ?auto_604596 ?auto_604598 ) ) ( not ( = ?auto_604596 ?auto_604599 ) ) ( not ( = ?auto_604596 ?auto_604600 ) ) ( not ( = ?auto_604596 ?auto_604601 ) ) ( not ( = ?auto_604596 ?auto_604602 ) ) ( not ( = ?auto_604597 ?auto_604598 ) ) ( not ( = ?auto_604597 ?auto_604599 ) ) ( not ( = ?auto_604597 ?auto_604600 ) ) ( not ( = ?auto_604597 ?auto_604601 ) ) ( not ( = ?auto_604597 ?auto_604602 ) ) ( not ( = ?auto_604598 ?auto_604599 ) ) ( not ( = ?auto_604598 ?auto_604600 ) ) ( not ( = ?auto_604598 ?auto_604601 ) ) ( not ( = ?auto_604598 ?auto_604602 ) ) ( not ( = ?auto_604599 ?auto_604600 ) ) ( not ( = ?auto_604599 ?auto_604601 ) ) ( not ( = ?auto_604599 ?auto_604602 ) ) ( not ( = ?auto_604600 ?auto_604601 ) ) ( not ( = ?auto_604600 ?auto_604602 ) ) ( not ( = ?auto_604601 ?auto_604602 ) ) ( ON ?auto_604601 ?auto_604602 ) ( ON ?auto_604600 ?auto_604601 ) ( ON ?auto_604599 ?auto_604600 ) ( ON ?auto_604598 ?auto_604599 ) ( ON ?auto_604597 ?auto_604598 ) ( CLEAR ?auto_604595 ) ( ON ?auto_604596 ?auto_604597 ) ( CLEAR ?auto_604596 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_604586 ?auto_604587 ?auto_604588 ?auto_604589 ?auto_604590 ?auto_604591 ?auto_604592 ?auto_604593 ?auto_604594 ?auto_604595 ?auto_604596 )
      ( MAKE-17PILE ?auto_604586 ?auto_604587 ?auto_604588 ?auto_604589 ?auto_604590 ?auto_604591 ?auto_604592 ?auto_604593 ?auto_604594 ?auto_604595 ?auto_604596 ?auto_604597 ?auto_604598 ?auto_604599 ?auto_604600 ?auto_604601 ?auto_604602 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_604620 - BLOCK
      ?auto_604621 - BLOCK
      ?auto_604622 - BLOCK
      ?auto_604623 - BLOCK
      ?auto_604624 - BLOCK
      ?auto_604625 - BLOCK
      ?auto_604626 - BLOCK
      ?auto_604627 - BLOCK
      ?auto_604628 - BLOCK
      ?auto_604629 - BLOCK
      ?auto_604630 - BLOCK
      ?auto_604631 - BLOCK
      ?auto_604632 - BLOCK
      ?auto_604633 - BLOCK
      ?auto_604634 - BLOCK
      ?auto_604635 - BLOCK
      ?auto_604636 - BLOCK
    )
    :vars
    (
      ?auto_604637 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_604636 ?auto_604637 ) ( ON-TABLE ?auto_604620 ) ( ON ?auto_604621 ?auto_604620 ) ( ON ?auto_604622 ?auto_604621 ) ( ON ?auto_604623 ?auto_604622 ) ( ON ?auto_604624 ?auto_604623 ) ( ON ?auto_604625 ?auto_604624 ) ( ON ?auto_604626 ?auto_604625 ) ( ON ?auto_604627 ?auto_604626 ) ( ON ?auto_604628 ?auto_604627 ) ( not ( = ?auto_604620 ?auto_604621 ) ) ( not ( = ?auto_604620 ?auto_604622 ) ) ( not ( = ?auto_604620 ?auto_604623 ) ) ( not ( = ?auto_604620 ?auto_604624 ) ) ( not ( = ?auto_604620 ?auto_604625 ) ) ( not ( = ?auto_604620 ?auto_604626 ) ) ( not ( = ?auto_604620 ?auto_604627 ) ) ( not ( = ?auto_604620 ?auto_604628 ) ) ( not ( = ?auto_604620 ?auto_604629 ) ) ( not ( = ?auto_604620 ?auto_604630 ) ) ( not ( = ?auto_604620 ?auto_604631 ) ) ( not ( = ?auto_604620 ?auto_604632 ) ) ( not ( = ?auto_604620 ?auto_604633 ) ) ( not ( = ?auto_604620 ?auto_604634 ) ) ( not ( = ?auto_604620 ?auto_604635 ) ) ( not ( = ?auto_604620 ?auto_604636 ) ) ( not ( = ?auto_604620 ?auto_604637 ) ) ( not ( = ?auto_604621 ?auto_604622 ) ) ( not ( = ?auto_604621 ?auto_604623 ) ) ( not ( = ?auto_604621 ?auto_604624 ) ) ( not ( = ?auto_604621 ?auto_604625 ) ) ( not ( = ?auto_604621 ?auto_604626 ) ) ( not ( = ?auto_604621 ?auto_604627 ) ) ( not ( = ?auto_604621 ?auto_604628 ) ) ( not ( = ?auto_604621 ?auto_604629 ) ) ( not ( = ?auto_604621 ?auto_604630 ) ) ( not ( = ?auto_604621 ?auto_604631 ) ) ( not ( = ?auto_604621 ?auto_604632 ) ) ( not ( = ?auto_604621 ?auto_604633 ) ) ( not ( = ?auto_604621 ?auto_604634 ) ) ( not ( = ?auto_604621 ?auto_604635 ) ) ( not ( = ?auto_604621 ?auto_604636 ) ) ( not ( = ?auto_604621 ?auto_604637 ) ) ( not ( = ?auto_604622 ?auto_604623 ) ) ( not ( = ?auto_604622 ?auto_604624 ) ) ( not ( = ?auto_604622 ?auto_604625 ) ) ( not ( = ?auto_604622 ?auto_604626 ) ) ( not ( = ?auto_604622 ?auto_604627 ) ) ( not ( = ?auto_604622 ?auto_604628 ) ) ( not ( = ?auto_604622 ?auto_604629 ) ) ( not ( = ?auto_604622 ?auto_604630 ) ) ( not ( = ?auto_604622 ?auto_604631 ) ) ( not ( = ?auto_604622 ?auto_604632 ) ) ( not ( = ?auto_604622 ?auto_604633 ) ) ( not ( = ?auto_604622 ?auto_604634 ) ) ( not ( = ?auto_604622 ?auto_604635 ) ) ( not ( = ?auto_604622 ?auto_604636 ) ) ( not ( = ?auto_604622 ?auto_604637 ) ) ( not ( = ?auto_604623 ?auto_604624 ) ) ( not ( = ?auto_604623 ?auto_604625 ) ) ( not ( = ?auto_604623 ?auto_604626 ) ) ( not ( = ?auto_604623 ?auto_604627 ) ) ( not ( = ?auto_604623 ?auto_604628 ) ) ( not ( = ?auto_604623 ?auto_604629 ) ) ( not ( = ?auto_604623 ?auto_604630 ) ) ( not ( = ?auto_604623 ?auto_604631 ) ) ( not ( = ?auto_604623 ?auto_604632 ) ) ( not ( = ?auto_604623 ?auto_604633 ) ) ( not ( = ?auto_604623 ?auto_604634 ) ) ( not ( = ?auto_604623 ?auto_604635 ) ) ( not ( = ?auto_604623 ?auto_604636 ) ) ( not ( = ?auto_604623 ?auto_604637 ) ) ( not ( = ?auto_604624 ?auto_604625 ) ) ( not ( = ?auto_604624 ?auto_604626 ) ) ( not ( = ?auto_604624 ?auto_604627 ) ) ( not ( = ?auto_604624 ?auto_604628 ) ) ( not ( = ?auto_604624 ?auto_604629 ) ) ( not ( = ?auto_604624 ?auto_604630 ) ) ( not ( = ?auto_604624 ?auto_604631 ) ) ( not ( = ?auto_604624 ?auto_604632 ) ) ( not ( = ?auto_604624 ?auto_604633 ) ) ( not ( = ?auto_604624 ?auto_604634 ) ) ( not ( = ?auto_604624 ?auto_604635 ) ) ( not ( = ?auto_604624 ?auto_604636 ) ) ( not ( = ?auto_604624 ?auto_604637 ) ) ( not ( = ?auto_604625 ?auto_604626 ) ) ( not ( = ?auto_604625 ?auto_604627 ) ) ( not ( = ?auto_604625 ?auto_604628 ) ) ( not ( = ?auto_604625 ?auto_604629 ) ) ( not ( = ?auto_604625 ?auto_604630 ) ) ( not ( = ?auto_604625 ?auto_604631 ) ) ( not ( = ?auto_604625 ?auto_604632 ) ) ( not ( = ?auto_604625 ?auto_604633 ) ) ( not ( = ?auto_604625 ?auto_604634 ) ) ( not ( = ?auto_604625 ?auto_604635 ) ) ( not ( = ?auto_604625 ?auto_604636 ) ) ( not ( = ?auto_604625 ?auto_604637 ) ) ( not ( = ?auto_604626 ?auto_604627 ) ) ( not ( = ?auto_604626 ?auto_604628 ) ) ( not ( = ?auto_604626 ?auto_604629 ) ) ( not ( = ?auto_604626 ?auto_604630 ) ) ( not ( = ?auto_604626 ?auto_604631 ) ) ( not ( = ?auto_604626 ?auto_604632 ) ) ( not ( = ?auto_604626 ?auto_604633 ) ) ( not ( = ?auto_604626 ?auto_604634 ) ) ( not ( = ?auto_604626 ?auto_604635 ) ) ( not ( = ?auto_604626 ?auto_604636 ) ) ( not ( = ?auto_604626 ?auto_604637 ) ) ( not ( = ?auto_604627 ?auto_604628 ) ) ( not ( = ?auto_604627 ?auto_604629 ) ) ( not ( = ?auto_604627 ?auto_604630 ) ) ( not ( = ?auto_604627 ?auto_604631 ) ) ( not ( = ?auto_604627 ?auto_604632 ) ) ( not ( = ?auto_604627 ?auto_604633 ) ) ( not ( = ?auto_604627 ?auto_604634 ) ) ( not ( = ?auto_604627 ?auto_604635 ) ) ( not ( = ?auto_604627 ?auto_604636 ) ) ( not ( = ?auto_604627 ?auto_604637 ) ) ( not ( = ?auto_604628 ?auto_604629 ) ) ( not ( = ?auto_604628 ?auto_604630 ) ) ( not ( = ?auto_604628 ?auto_604631 ) ) ( not ( = ?auto_604628 ?auto_604632 ) ) ( not ( = ?auto_604628 ?auto_604633 ) ) ( not ( = ?auto_604628 ?auto_604634 ) ) ( not ( = ?auto_604628 ?auto_604635 ) ) ( not ( = ?auto_604628 ?auto_604636 ) ) ( not ( = ?auto_604628 ?auto_604637 ) ) ( not ( = ?auto_604629 ?auto_604630 ) ) ( not ( = ?auto_604629 ?auto_604631 ) ) ( not ( = ?auto_604629 ?auto_604632 ) ) ( not ( = ?auto_604629 ?auto_604633 ) ) ( not ( = ?auto_604629 ?auto_604634 ) ) ( not ( = ?auto_604629 ?auto_604635 ) ) ( not ( = ?auto_604629 ?auto_604636 ) ) ( not ( = ?auto_604629 ?auto_604637 ) ) ( not ( = ?auto_604630 ?auto_604631 ) ) ( not ( = ?auto_604630 ?auto_604632 ) ) ( not ( = ?auto_604630 ?auto_604633 ) ) ( not ( = ?auto_604630 ?auto_604634 ) ) ( not ( = ?auto_604630 ?auto_604635 ) ) ( not ( = ?auto_604630 ?auto_604636 ) ) ( not ( = ?auto_604630 ?auto_604637 ) ) ( not ( = ?auto_604631 ?auto_604632 ) ) ( not ( = ?auto_604631 ?auto_604633 ) ) ( not ( = ?auto_604631 ?auto_604634 ) ) ( not ( = ?auto_604631 ?auto_604635 ) ) ( not ( = ?auto_604631 ?auto_604636 ) ) ( not ( = ?auto_604631 ?auto_604637 ) ) ( not ( = ?auto_604632 ?auto_604633 ) ) ( not ( = ?auto_604632 ?auto_604634 ) ) ( not ( = ?auto_604632 ?auto_604635 ) ) ( not ( = ?auto_604632 ?auto_604636 ) ) ( not ( = ?auto_604632 ?auto_604637 ) ) ( not ( = ?auto_604633 ?auto_604634 ) ) ( not ( = ?auto_604633 ?auto_604635 ) ) ( not ( = ?auto_604633 ?auto_604636 ) ) ( not ( = ?auto_604633 ?auto_604637 ) ) ( not ( = ?auto_604634 ?auto_604635 ) ) ( not ( = ?auto_604634 ?auto_604636 ) ) ( not ( = ?auto_604634 ?auto_604637 ) ) ( not ( = ?auto_604635 ?auto_604636 ) ) ( not ( = ?auto_604635 ?auto_604637 ) ) ( not ( = ?auto_604636 ?auto_604637 ) ) ( ON ?auto_604635 ?auto_604636 ) ( ON ?auto_604634 ?auto_604635 ) ( ON ?auto_604633 ?auto_604634 ) ( ON ?auto_604632 ?auto_604633 ) ( ON ?auto_604631 ?auto_604632 ) ( ON ?auto_604630 ?auto_604631 ) ( CLEAR ?auto_604628 ) ( ON ?auto_604629 ?auto_604630 ) ( CLEAR ?auto_604629 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_604620 ?auto_604621 ?auto_604622 ?auto_604623 ?auto_604624 ?auto_604625 ?auto_604626 ?auto_604627 ?auto_604628 ?auto_604629 )
      ( MAKE-17PILE ?auto_604620 ?auto_604621 ?auto_604622 ?auto_604623 ?auto_604624 ?auto_604625 ?auto_604626 ?auto_604627 ?auto_604628 ?auto_604629 ?auto_604630 ?auto_604631 ?auto_604632 ?auto_604633 ?auto_604634 ?auto_604635 ?auto_604636 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_604655 - BLOCK
      ?auto_604656 - BLOCK
      ?auto_604657 - BLOCK
      ?auto_604658 - BLOCK
      ?auto_604659 - BLOCK
      ?auto_604660 - BLOCK
      ?auto_604661 - BLOCK
      ?auto_604662 - BLOCK
      ?auto_604663 - BLOCK
      ?auto_604664 - BLOCK
      ?auto_604665 - BLOCK
      ?auto_604666 - BLOCK
      ?auto_604667 - BLOCK
      ?auto_604668 - BLOCK
      ?auto_604669 - BLOCK
      ?auto_604670 - BLOCK
      ?auto_604671 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_604671 ) ( ON-TABLE ?auto_604655 ) ( ON ?auto_604656 ?auto_604655 ) ( ON ?auto_604657 ?auto_604656 ) ( ON ?auto_604658 ?auto_604657 ) ( ON ?auto_604659 ?auto_604658 ) ( ON ?auto_604660 ?auto_604659 ) ( ON ?auto_604661 ?auto_604660 ) ( ON ?auto_604662 ?auto_604661 ) ( ON ?auto_604663 ?auto_604662 ) ( not ( = ?auto_604655 ?auto_604656 ) ) ( not ( = ?auto_604655 ?auto_604657 ) ) ( not ( = ?auto_604655 ?auto_604658 ) ) ( not ( = ?auto_604655 ?auto_604659 ) ) ( not ( = ?auto_604655 ?auto_604660 ) ) ( not ( = ?auto_604655 ?auto_604661 ) ) ( not ( = ?auto_604655 ?auto_604662 ) ) ( not ( = ?auto_604655 ?auto_604663 ) ) ( not ( = ?auto_604655 ?auto_604664 ) ) ( not ( = ?auto_604655 ?auto_604665 ) ) ( not ( = ?auto_604655 ?auto_604666 ) ) ( not ( = ?auto_604655 ?auto_604667 ) ) ( not ( = ?auto_604655 ?auto_604668 ) ) ( not ( = ?auto_604655 ?auto_604669 ) ) ( not ( = ?auto_604655 ?auto_604670 ) ) ( not ( = ?auto_604655 ?auto_604671 ) ) ( not ( = ?auto_604656 ?auto_604657 ) ) ( not ( = ?auto_604656 ?auto_604658 ) ) ( not ( = ?auto_604656 ?auto_604659 ) ) ( not ( = ?auto_604656 ?auto_604660 ) ) ( not ( = ?auto_604656 ?auto_604661 ) ) ( not ( = ?auto_604656 ?auto_604662 ) ) ( not ( = ?auto_604656 ?auto_604663 ) ) ( not ( = ?auto_604656 ?auto_604664 ) ) ( not ( = ?auto_604656 ?auto_604665 ) ) ( not ( = ?auto_604656 ?auto_604666 ) ) ( not ( = ?auto_604656 ?auto_604667 ) ) ( not ( = ?auto_604656 ?auto_604668 ) ) ( not ( = ?auto_604656 ?auto_604669 ) ) ( not ( = ?auto_604656 ?auto_604670 ) ) ( not ( = ?auto_604656 ?auto_604671 ) ) ( not ( = ?auto_604657 ?auto_604658 ) ) ( not ( = ?auto_604657 ?auto_604659 ) ) ( not ( = ?auto_604657 ?auto_604660 ) ) ( not ( = ?auto_604657 ?auto_604661 ) ) ( not ( = ?auto_604657 ?auto_604662 ) ) ( not ( = ?auto_604657 ?auto_604663 ) ) ( not ( = ?auto_604657 ?auto_604664 ) ) ( not ( = ?auto_604657 ?auto_604665 ) ) ( not ( = ?auto_604657 ?auto_604666 ) ) ( not ( = ?auto_604657 ?auto_604667 ) ) ( not ( = ?auto_604657 ?auto_604668 ) ) ( not ( = ?auto_604657 ?auto_604669 ) ) ( not ( = ?auto_604657 ?auto_604670 ) ) ( not ( = ?auto_604657 ?auto_604671 ) ) ( not ( = ?auto_604658 ?auto_604659 ) ) ( not ( = ?auto_604658 ?auto_604660 ) ) ( not ( = ?auto_604658 ?auto_604661 ) ) ( not ( = ?auto_604658 ?auto_604662 ) ) ( not ( = ?auto_604658 ?auto_604663 ) ) ( not ( = ?auto_604658 ?auto_604664 ) ) ( not ( = ?auto_604658 ?auto_604665 ) ) ( not ( = ?auto_604658 ?auto_604666 ) ) ( not ( = ?auto_604658 ?auto_604667 ) ) ( not ( = ?auto_604658 ?auto_604668 ) ) ( not ( = ?auto_604658 ?auto_604669 ) ) ( not ( = ?auto_604658 ?auto_604670 ) ) ( not ( = ?auto_604658 ?auto_604671 ) ) ( not ( = ?auto_604659 ?auto_604660 ) ) ( not ( = ?auto_604659 ?auto_604661 ) ) ( not ( = ?auto_604659 ?auto_604662 ) ) ( not ( = ?auto_604659 ?auto_604663 ) ) ( not ( = ?auto_604659 ?auto_604664 ) ) ( not ( = ?auto_604659 ?auto_604665 ) ) ( not ( = ?auto_604659 ?auto_604666 ) ) ( not ( = ?auto_604659 ?auto_604667 ) ) ( not ( = ?auto_604659 ?auto_604668 ) ) ( not ( = ?auto_604659 ?auto_604669 ) ) ( not ( = ?auto_604659 ?auto_604670 ) ) ( not ( = ?auto_604659 ?auto_604671 ) ) ( not ( = ?auto_604660 ?auto_604661 ) ) ( not ( = ?auto_604660 ?auto_604662 ) ) ( not ( = ?auto_604660 ?auto_604663 ) ) ( not ( = ?auto_604660 ?auto_604664 ) ) ( not ( = ?auto_604660 ?auto_604665 ) ) ( not ( = ?auto_604660 ?auto_604666 ) ) ( not ( = ?auto_604660 ?auto_604667 ) ) ( not ( = ?auto_604660 ?auto_604668 ) ) ( not ( = ?auto_604660 ?auto_604669 ) ) ( not ( = ?auto_604660 ?auto_604670 ) ) ( not ( = ?auto_604660 ?auto_604671 ) ) ( not ( = ?auto_604661 ?auto_604662 ) ) ( not ( = ?auto_604661 ?auto_604663 ) ) ( not ( = ?auto_604661 ?auto_604664 ) ) ( not ( = ?auto_604661 ?auto_604665 ) ) ( not ( = ?auto_604661 ?auto_604666 ) ) ( not ( = ?auto_604661 ?auto_604667 ) ) ( not ( = ?auto_604661 ?auto_604668 ) ) ( not ( = ?auto_604661 ?auto_604669 ) ) ( not ( = ?auto_604661 ?auto_604670 ) ) ( not ( = ?auto_604661 ?auto_604671 ) ) ( not ( = ?auto_604662 ?auto_604663 ) ) ( not ( = ?auto_604662 ?auto_604664 ) ) ( not ( = ?auto_604662 ?auto_604665 ) ) ( not ( = ?auto_604662 ?auto_604666 ) ) ( not ( = ?auto_604662 ?auto_604667 ) ) ( not ( = ?auto_604662 ?auto_604668 ) ) ( not ( = ?auto_604662 ?auto_604669 ) ) ( not ( = ?auto_604662 ?auto_604670 ) ) ( not ( = ?auto_604662 ?auto_604671 ) ) ( not ( = ?auto_604663 ?auto_604664 ) ) ( not ( = ?auto_604663 ?auto_604665 ) ) ( not ( = ?auto_604663 ?auto_604666 ) ) ( not ( = ?auto_604663 ?auto_604667 ) ) ( not ( = ?auto_604663 ?auto_604668 ) ) ( not ( = ?auto_604663 ?auto_604669 ) ) ( not ( = ?auto_604663 ?auto_604670 ) ) ( not ( = ?auto_604663 ?auto_604671 ) ) ( not ( = ?auto_604664 ?auto_604665 ) ) ( not ( = ?auto_604664 ?auto_604666 ) ) ( not ( = ?auto_604664 ?auto_604667 ) ) ( not ( = ?auto_604664 ?auto_604668 ) ) ( not ( = ?auto_604664 ?auto_604669 ) ) ( not ( = ?auto_604664 ?auto_604670 ) ) ( not ( = ?auto_604664 ?auto_604671 ) ) ( not ( = ?auto_604665 ?auto_604666 ) ) ( not ( = ?auto_604665 ?auto_604667 ) ) ( not ( = ?auto_604665 ?auto_604668 ) ) ( not ( = ?auto_604665 ?auto_604669 ) ) ( not ( = ?auto_604665 ?auto_604670 ) ) ( not ( = ?auto_604665 ?auto_604671 ) ) ( not ( = ?auto_604666 ?auto_604667 ) ) ( not ( = ?auto_604666 ?auto_604668 ) ) ( not ( = ?auto_604666 ?auto_604669 ) ) ( not ( = ?auto_604666 ?auto_604670 ) ) ( not ( = ?auto_604666 ?auto_604671 ) ) ( not ( = ?auto_604667 ?auto_604668 ) ) ( not ( = ?auto_604667 ?auto_604669 ) ) ( not ( = ?auto_604667 ?auto_604670 ) ) ( not ( = ?auto_604667 ?auto_604671 ) ) ( not ( = ?auto_604668 ?auto_604669 ) ) ( not ( = ?auto_604668 ?auto_604670 ) ) ( not ( = ?auto_604668 ?auto_604671 ) ) ( not ( = ?auto_604669 ?auto_604670 ) ) ( not ( = ?auto_604669 ?auto_604671 ) ) ( not ( = ?auto_604670 ?auto_604671 ) ) ( ON ?auto_604670 ?auto_604671 ) ( ON ?auto_604669 ?auto_604670 ) ( ON ?auto_604668 ?auto_604669 ) ( ON ?auto_604667 ?auto_604668 ) ( ON ?auto_604666 ?auto_604667 ) ( ON ?auto_604665 ?auto_604666 ) ( CLEAR ?auto_604663 ) ( ON ?auto_604664 ?auto_604665 ) ( CLEAR ?auto_604664 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_604655 ?auto_604656 ?auto_604657 ?auto_604658 ?auto_604659 ?auto_604660 ?auto_604661 ?auto_604662 ?auto_604663 ?auto_604664 )
      ( MAKE-17PILE ?auto_604655 ?auto_604656 ?auto_604657 ?auto_604658 ?auto_604659 ?auto_604660 ?auto_604661 ?auto_604662 ?auto_604663 ?auto_604664 ?auto_604665 ?auto_604666 ?auto_604667 ?auto_604668 ?auto_604669 ?auto_604670 ?auto_604671 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_604689 - BLOCK
      ?auto_604690 - BLOCK
      ?auto_604691 - BLOCK
      ?auto_604692 - BLOCK
      ?auto_604693 - BLOCK
      ?auto_604694 - BLOCK
      ?auto_604695 - BLOCK
      ?auto_604696 - BLOCK
      ?auto_604697 - BLOCK
      ?auto_604698 - BLOCK
      ?auto_604699 - BLOCK
      ?auto_604700 - BLOCK
      ?auto_604701 - BLOCK
      ?auto_604702 - BLOCK
      ?auto_604703 - BLOCK
      ?auto_604704 - BLOCK
      ?auto_604705 - BLOCK
    )
    :vars
    (
      ?auto_604706 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_604705 ?auto_604706 ) ( ON-TABLE ?auto_604689 ) ( ON ?auto_604690 ?auto_604689 ) ( ON ?auto_604691 ?auto_604690 ) ( ON ?auto_604692 ?auto_604691 ) ( ON ?auto_604693 ?auto_604692 ) ( ON ?auto_604694 ?auto_604693 ) ( ON ?auto_604695 ?auto_604694 ) ( ON ?auto_604696 ?auto_604695 ) ( not ( = ?auto_604689 ?auto_604690 ) ) ( not ( = ?auto_604689 ?auto_604691 ) ) ( not ( = ?auto_604689 ?auto_604692 ) ) ( not ( = ?auto_604689 ?auto_604693 ) ) ( not ( = ?auto_604689 ?auto_604694 ) ) ( not ( = ?auto_604689 ?auto_604695 ) ) ( not ( = ?auto_604689 ?auto_604696 ) ) ( not ( = ?auto_604689 ?auto_604697 ) ) ( not ( = ?auto_604689 ?auto_604698 ) ) ( not ( = ?auto_604689 ?auto_604699 ) ) ( not ( = ?auto_604689 ?auto_604700 ) ) ( not ( = ?auto_604689 ?auto_604701 ) ) ( not ( = ?auto_604689 ?auto_604702 ) ) ( not ( = ?auto_604689 ?auto_604703 ) ) ( not ( = ?auto_604689 ?auto_604704 ) ) ( not ( = ?auto_604689 ?auto_604705 ) ) ( not ( = ?auto_604689 ?auto_604706 ) ) ( not ( = ?auto_604690 ?auto_604691 ) ) ( not ( = ?auto_604690 ?auto_604692 ) ) ( not ( = ?auto_604690 ?auto_604693 ) ) ( not ( = ?auto_604690 ?auto_604694 ) ) ( not ( = ?auto_604690 ?auto_604695 ) ) ( not ( = ?auto_604690 ?auto_604696 ) ) ( not ( = ?auto_604690 ?auto_604697 ) ) ( not ( = ?auto_604690 ?auto_604698 ) ) ( not ( = ?auto_604690 ?auto_604699 ) ) ( not ( = ?auto_604690 ?auto_604700 ) ) ( not ( = ?auto_604690 ?auto_604701 ) ) ( not ( = ?auto_604690 ?auto_604702 ) ) ( not ( = ?auto_604690 ?auto_604703 ) ) ( not ( = ?auto_604690 ?auto_604704 ) ) ( not ( = ?auto_604690 ?auto_604705 ) ) ( not ( = ?auto_604690 ?auto_604706 ) ) ( not ( = ?auto_604691 ?auto_604692 ) ) ( not ( = ?auto_604691 ?auto_604693 ) ) ( not ( = ?auto_604691 ?auto_604694 ) ) ( not ( = ?auto_604691 ?auto_604695 ) ) ( not ( = ?auto_604691 ?auto_604696 ) ) ( not ( = ?auto_604691 ?auto_604697 ) ) ( not ( = ?auto_604691 ?auto_604698 ) ) ( not ( = ?auto_604691 ?auto_604699 ) ) ( not ( = ?auto_604691 ?auto_604700 ) ) ( not ( = ?auto_604691 ?auto_604701 ) ) ( not ( = ?auto_604691 ?auto_604702 ) ) ( not ( = ?auto_604691 ?auto_604703 ) ) ( not ( = ?auto_604691 ?auto_604704 ) ) ( not ( = ?auto_604691 ?auto_604705 ) ) ( not ( = ?auto_604691 ?auto_604706 ) ) ( not ( = ?auto_604692 ?auto_604693 ) ) ( not ( = ?auto_604692 ?auto_604694 ) ) ( not ( = ?auto_604692 ?auto_604695 ) ) ( not ( = ?auto_604692 ?auto_604696 ) ) ( not ( = ?auto_604692 ?auto_604697 ) ) ( not ( = ?auto_604692 ?auto_604698 ) ) ( not ( = ?auto_604692 ?auto_604699 ) ) ( not ( = ?auto_604692 ?auto_604700 ) ) ( not ( = ?auto_604692 ?auto_604701 ) ) ( not ( = ?auto_604692 ?auto_604702 ) ) ( not ( = ?auto_604692 ?auto_604703 ) ) ( not ( = ?auto_604692 ?auto_604704 ) ) ( not ( = ?auto_604692 ?auto_604705 ) ) ( not ( = ?auto_604692 ?auto_604706 ) ) ( not ( = ?auto_604693 ?auto_604694 ) ) ( not ( = ?auto_604693 ?auto_604695 ) ) ( not ( = ?auto_604693 ?auto_604696 ) ) ( not ( = ?auto_604693 ?auto_604697 ) ) ( not ( = ?auto_604693 ?auto_604698 ) ) ( not ( = ?auto_604693 ?auto_604699 ) ) ( not ( = ?auto_604693 ?auto_604700 ) ) ( not ( = ?auto_604693 ?auto_604701 ) ) ( not ( = ?auto_604693 ?auto_604702 ) ) ( not ( = ?auto_604693 ?auto_604703 ) ) ( not ( = ?auto_604693 ?auto_604704 ) ) ( not ( = ?auto_604693 ?auto_604705 ) ) ( not ( = ?auto_604693 ?auto_604706 ) ) ( not ( = ?auto_604694 ?auto_604695 ) ) ( not ( = ?auto_604694 ?auto_604696 ) ) ( not ( = ?auto_604694 ?auto_604697 ) ) ( not ( = ?auto_604694 ?auto_604698 ) ) ( not ( = ?auto_604694 ?auto_604699 ) ) ( not ( = ?auto_604694 ?auto_604700 ) ) ( not ( = ?auto_604694 ?auto_604701 ) ) ( not ( = ?auto_604694 ?auto_604702 ) ) ( not ( = ?auto_604694 ?auto_604703 ) ) ( not ( = ?auto_604694 ?auto_604704 ) ) ( not ( = ?auto_604694 ?auto_604705 ) ) ( not ( = ?auto_604694 ?auto_604706 ) ) ( not ( = ?auto_604695 ?auto_604696 ) ) ( not ( = ?auto_604695 ?auto_604697 ) ) ( not ( = ?auto_604695 ?auto_604698 ) ) ( not ( = ?auto_604695 ?auto_604699 ) ) ( not ( = ?auto_604695 ?auto_604700 ) ) ( not ( = ?auto_604695 ?auto_604701 ) ) ( not ( = ?auto_604695 ?auto_604702 ) ) ( not ( = ?auto_604695 ?auto_604703 ) ) ( not ( = ?auto_604695 ?auto_604704 ) ) ( not ( = ?auto_604695 ?auto_604705 ) ) ( not ( = ?auto_604695 ?auto_604706 ) ) ( not ( = ?auto_604696 ?auto_604697 ) ) ( not ( = ?auto_604696 ?auto_604698 ) ) ( not ( = ?auto_604696 ?auto_604699 ) ) ( not ( = ?auto_604696 ?auto_604700 ) ) ( not ( = ?auto_604696 ?auto_604701 ) ) ( not ( = ?auto_604696 ?auto_604702 ) ) ( not ( = ?auto_604696 ?auto_604703 ) ) ( not ( = ?auto_604696 ?auto_604704 ) ) ( not ( = ?auto_604696 ?auto_604705 ) ) ( not ( = ?auto_604696 ?auto_604706 ) ) ( not ( = ?auto_604697 ?auto_604698 ) ) ( not ( = ?auto_604697 ?auto_604699 ) ) ( not ( = ?auto_604697 ?auto_604700 ) ) ( not ( = ?auto_604697 ?auto_604701 ) ) ( not ( = ?auto_604697 ?auto_604702 ) ) ( not ( = ?auto_604697 ?auto_604703 ) ) ( not ( = ?auto_604697 ?auto_604704 ) ) ( not ( = ?auto_604697 ?auto_604705 ) ) ( not ( = ?auto_604697 ?auto_604706 ) ) ( not ( = ?auto_604698 ?auto_604699 ) ) ( not ( = ?auto_604698 ?auto_604700 ) ) ( not ( = ?auto_604698 ?auto_604701 ) ) ( not ( = ?auto_604698 ?auto_604702 ) ) ( not ( = ?auto_604698 ?auto_604703 ) ) ( not ( = ?auto_604698 ?auto_604704 ) ) ( not ( = ?auto_604698 ?auto_604705 ) ) ( not ( = ?auto_604698 ?auto_604706 ) ) ( not ( = ?auto_604699 ?auto_604700 ) ) ( not ( = ?auto_604699 ?auto_604701 ) ) ( not ( = ?auto_604699 ?auto_604702 ) ) ( not ( = ?auto_604699 ?auto_604703 ) ) ( not ( = ?auto_604699 ?auto_604704 ) ) ( not ( = ?auto_604699 ?auto_604705 ) ) ( not ( = ?auto_604699 ?auto_604706 ) ) ( not ( = ?auto_604700 ?auto_604701 ) ) ( not ( = ?auto_604700 ?auto_604702 ) ) ( not ( = ?auto_604700 ?auto_604703 ) ) ( not ( = ?auto_604700 ?auto_604704 ) ) ( not ( = ?auto_604700 ?auto_604705 ) ) ( not ( = ?auto_604700 ?auto_604706 ) ) ( not ( = ?auto_604701 ?auto_604702 ) ) ( not ( = ?auto_604701 ?auto_604703 ) ) ( not ( = ?auto_604701 ?auto_604704 ) ) ( not ( = ?auto_604701 ?auto_604705 ) ) ( not ( = ?auto_604701 ?auto_604706 ) ) ( not ( = ?auto_604702 ?auto_604703 ) ) ( not ( = ?auto_604702 ?auto_604704 ) ) ( not ( = ?auto_604702 ?auto_604705 ) ) ( not ( = ?auto_604702 ?auto_604706 ) ) ( not ( = ?auto_604703 ?auto_604704 ) ) ( not ( = ?auto_604703 ?auto_604705 ) ) ( not ( = ?auto_604703 ?auto_604706 ) ) ( not ( = ?auto_604704 ?auto_604705 ) ) ( not ( = ?auto_604704 ?auto_604706 ) ) ( not ( = ?auto_604705 ?auto_604706 ) ) ( ON ?auto_604704 ?auto_604705 ) ( ON ?auto_604703 ?auto_604704 ) ( ON ?auto_604702 ?auto_604703 ) ( ON ?auto_604701 ?auto_604702 ) ( ON ?auto_604700 ?auto_604701 ) ( ON ?auto_604699 ?auto_604700 ) ( ON ?auto_604698 ?auto_604699 ) ( CLEAR ?auto_604696 ) ( ON ?auto_604697 ?auto_604698 ) ( CLEAR ?auto_604697 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_604689 ?auto_604690 ?auto_604691 ?auto_604692 ?auto_604693 ?auto_604694 ?auto_604695 ?auto_604696 ?auto_604697 )
      ( MAKE-17PILE ?auto_604689 ?auto_604690 ?auto_604691 ?auto_604692 ?auto_604693 ?auto_604694 ?auto_604695 ?auto_604696 ?auto_604697 ?auto_604698 ?auto_604699 ?auto_604700 ?auto_604701 ?auto_604702 ?auto_604703 ?auto_604704 ?auto_604705 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_604724 - BLOCK
      ?auto_604725 - BLOCK
      ?auto_604726 - BLOCK
      ?auto_604727 - BLOCK
      ?auto_604728 - BLOCK
      ?auto_604729 - BLOCK
      ?auto_604730 - BLOCK
      ?auto_604731 - BLOCK
      ?auto_604732 - BLOCK
      ?auto_604733 - BLOCK
      ?auto_604734 - BLOCK
      ?auto_604735 - BLOCK
      ?auto_604736 - BLOCK
      ?auto_604737 - BLOCK
      ?auto_604738 - BLOCK
      ?auto_604739 - BLOCK
      ?auto_604740 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_604740 ) ( ON-TABLE ?auto_604724 ) ( ON ?auto_604725 ?auto_604724 ) ( ON ?auto_604726 ?auto_604725 ) ( ON ?auto_604727 ?auto_604726 ) ( ON ?auto_604728 ?auto_604727 ) ( ON ?auto_604729 ?auto_604728 ) ( ON ?auto_604730 ?auto_604729 ) ( ON ?auto_604731 ?auto_604730 ) ( not ( = ?auto_604724 ?auto_604725 ) ) ( not ( = ?auto_604724 ?auto_604726 ) ) ( not ( = ?auto_604724 ?auto_604727 ) ) ( not ( = ?auto_604724 ?auto_604728 ) ) ( not ( = ?auto_604724 ?auto_604729 ) ) ( not ( = ?auto_604724 ?auto_604730 ) ) ( not ( = ?auto_604724 ?auto_604731 ) ) ( not ( = ?auto_604724 ?auto_604732 ) ) ( not ( = ?auto_604724 ?auto_604733 ) ) ( not ( = ?auto_604724 ?auto_604734 ) ) ( not ( = ?auto_604724 ?auto_604735 ) ) ( not ( = ?auto_604724 ?auto_604736 ) ) ( not ( = ?auto_604724 ?auto_604737 ) ) ( not ( = ?auto_604724 ?auto_604738 ) ) ( not ( = ?auto_604724 ?auto_604739 ) ) ( not ( = ?auto_604724 ?auto_604740 ) ) ( not ( = ?auto_604725 ?auto_604726 ) ) ( not ( = ?auto_604725 ?auto_604727 ) ) ( not ( = ?auto_604725 ?auto_604728 ) ) ( not ( = ?auto_604725 ?auto_604729 ) ) ( not ( = ?auto_604725 ?auto_604730 ) ) ( not ( = ?auto_604725 ?auto_604731 ) ) ( not ( = ?auto_604725 ?auto_604732 ) ) ( not ( = ?auto_604725 ?auto_604733 ) ) ( not ( = ?auto_604725 ?auto_604734 ) ) ( not ( = ?auto_604725 ?auto_604735 ) ) ( not ( = ?auto_604725 ?auto_604736 ) ) ( not ( = ?auto_604725 ?auto_604737 ) ) ( not ( = ?auto_604725 ?auto_604738 ) ) ( not ( = ?auto_604725 ?auto_604739 ) ) ( not ( = ?auto_604725 ?auto_604740 ) ) ( not ( = ?auto_604726 ?auto_604727 ) ) ( not ( = ?auto_604726 ?auto_604728 ) ) ( not ( = ?auto_604726 ?auto_604729 ) ) ( not ( = ?auto_604726 ?auto_604730 ) ) ( not ( = ?auto_604726 ?auto_604731 ) ) ( not ( = ?auto_604726 ?auto_604732 ) ) ( not ( = ?auto_604726 ?auto_604733 ) ) ( not ( = ?auto_604726 ?auto_604734 ) ) ( not ( = ?auto_604726 ?auto_604735 ) ) ( not ( = ?auto_604726 ?auto_604736 ) ) ( not ( = ?auto_604726 ?auto_604737 ) ) ( not ( = ?auto_604726 ?auto_604738 ) ) ( not ( = ?auto_604726 ?auto_604739 ) ) ( not ( = ?auto_604726 ?auto_604740 ) ) ( not ( = ?auto_604727 ?auto_604728 ) ) ( not ( = ?auto_604727 ?auto_604729 ) ) ( not ( = ?auto_604727 ?auto_604730 ) ) ( not ( = ?auto_604727 ?auto_604731 ) ) ( not ( = ?auto_604727 ?auto_604732 ) ) ( not ( = ?auto_604727 ?auto_604733 ) ) ( not ( = ?auto_604727 ?auto_604734 ) ) ( not ( = ?auto_604727 ?auto_604735 ) ) ( not ( = ?auto_604727 ?auto_604736 ) ) ( not ( = ?auto_604727 ?auto_604737 ) ) ( not ( = ?auto_604727 ?auto_604738 ) ) ( not ( = ?auto_604727 ?auto_604739 ) ) ( not ( = ?auto_604727 ?auto_604740 ) ) ( not ( = ?auto_604728 ?auto_604729 ) ) ( not ( = ?auto_604728 ?auto_604730 ) ) ( not ( = ?auto_604728 ?auto_604731 ) ) ( not ( = ?auto_604728 ?auto_604732 ) ) ( not ( = ?auto_604728 ?auto_604733 ) ) ( not ( = ?auto_604728 ?auto_604734 ) ) ( not ( = ?auto_604728 ?auto_604735 ) ) ( not ( = ?auto_604728 ?auto_604736 ) ) ( not ( = ?auto_604728 ?auto_604737 ) ) ( not ( = ?auto_604728 ?auto_604738 ) ) ( not ( = ?auto_604728 ?auto_604739 ) ) ( not ( = ?auto_604728 ?auto_604740 ) ) ( not ( = ?auto_604729 ?auto_604730 ) ) ( not ( = ?auto_604729 ?auto_604731 ) ) ( not ( = ?auto_604729 ?auto_604732 ) ) ( not ( = ?auto_604729 ?auto_604733 ) ) ( not ( = ?auto_604729 ?auto_604734 ) ) ( not ( = ?auto_604729 ?auto_604735 ) ) ( not ( = ?auto_604729 ?auto_604736 ) ) ( not ( = ?auto_604729 ?auto_604737 ) ) ( not ( = ?auto_604729 ?auto_604738 ) ) ( not ( = ?auto_604729 ?auto_604739 ) ) ( not ( = ?auto_604729 ?auto_604740 ) ) ( not ( = ?auto_604730 ?auto_604731 ) ) ( not ( = ?auto_604730 ?auto_604732 ) ) ( not ( = ?auto_604730 ?auto_604733 ) ) ( not ( = ?auto_604730 ?auto_604734 ) ) ( not ( = ?auto_604730 ?auto_604735 ) ) ( not ( = ?auto_604730 ?auto_604736 ) ) ( not ( = ?auto_604730 ?auto_604737 ) ) ( not ( = ?auto_604730 ?auto_604738 ) ) ( not ( = ?auto_604730 ?auto_604739 ) ) ( not ( = ?auto_604730 ?auto_604740 ) ) ( not ( = ?auto_604731 ?auto_604732 ) ) ( not ( = ?auto_604731 ?auto_604733 ) ) ( not ( = ?auto_604731 ?auto_604734 ) ) ( not ( = ?auto_604731 ?auto_604735 ) ) ( not ( = ?auto_604731 ?auto_604736 ) ) ( not ( = ?auto_604731 ?auto_604737 ) ) ( not ( = ?auto_604731 ?auto_604738 ) ) ( not ( = ?auto_604731 ?auto_604739 ) ) ( not ( = ?auto_604731 ?auto_604740 ) ) ( not ( = ?auto_604732 ?auto_604733 ) ) ( not ( = ?auto_604732 ?auto_604734 ) ) ( not ( = ?auto_604732 ?auto_604735 ) ) ( not ( = ?auto_604732 ?auto_604736 ) ) ( not ( = ?auto_604732 ?auto_604737 ) ) ( not ( = ?auto_604732 ?auto_604738 ) ) ( not ( = ?auto_604732 ?auto_604739 ) ) ( not ( = ?auto_604732 ?auto_604740 ) ) ( not ( = ?auto_604733 ?auto_604734 ) ) ( not ( = ?auto_604733 ?auto_604735 ) ) ( not ( = ?auto_604733 ?auto_604736 ) ) ( not ( = ?auto_604733 ?auto_604737 ) ) ( not ( = ?auto_604733 ?auto_604738 ) ) ( not ( = ?auto_604733 ?auto_604739 ) ) ( not ( = ?auto_604733 ?auto_604740 ) ) ( not ( = ?auto_604734 ?auto_604735 ) ) ( not ( = ?auto_604734 ?auto_604736 ) ) ( not ( = ?auto_604734 ?auto_604737 ) ) ( not ( = ?auto_604734 ?auto_604738 ) ) ( not ( = ?auto_604734 ?auto_604739 ) ) ( not ( = ?auto_604734 ?auto_604740 ) ) ( not ( = ?auto_604735 ?auto_604736 ) ) ( not ( = ?auto_604735 ?auto_604737 ) ) ( not ( = ?auto_604735 ?auto_604738 ) ) ( not ( = ?auto_604735 ?auto_604739 ) ) ( not ( = ?auto_604735 ?auto_604740 ) ) ( not ( = ?auto_604736 ?auto_604737 ) ) ( not ( = ?auto_604736 ?auto_604738 ) ) ( not ( = ?auto_604736 ?auto_604739 ) ) ( not ( = ?auto_604736 ?auto_604740 ) ) ( not ( = ?auto_604737 ?auto_604738 ) ) ( not ( = ?auto_604737 ?auto_604739 ) ) ( not ( = ?auto_604737 ?auto_604740 ) ) ( not ( = ?auto_604738 ?auto_604739 ) ) ( not ( = ?auto_604738 ?auto_604740 ) ) ( not ( = ?auto_604739 ?auto_604740 ) ) ( ON ?auto_604739 ?auto_604740 ) ( ON ?auto_604738 ?auto_604739 ) ( ON ?auto_604737 ?auto_604738 ) ( ON ?auto_604736 ?auto_604737 ) ( ON ?auto_604735 ?auto_604736 ) ( ON ?auto_604734 ?auto_604735 ) ( ON ?auto_604733 ?auto_604734 ) ( CLEAR ?auto_604731 ) ( ON ?auto_604732 ?auto_604733 ) ( CLEAR ?auto_604732 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_604724 ?auto_604725 ?auto_604726 ?auto_604727 ?auto_604728 ?auto_604729 ?auto_604730 ?auto_604731 ?auto_604732 )
      ( MAKE-17PILE ?auto_604724 ?auto_604725 ?auto_604726 ?auto_604727 ?auto_604728 ?auto_604729 ?auto_604730 ?auto_604731 ?auto_604732 ?auto_604733 ?auto_604734 ?auto_604735 ?auto_604736 ?auto_604737 ?auto_604738 ?auto_604739 ?auto_604740 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_604758 - BLOCK
      ?auto_604759 - BLOCK
      ?auto_604760 - BLOCK
      ?auto_604761 - BLOCK
      ?auto_604762 - BLOCK
      ?auto_604763 - BLOCK
      ?auto_604764 - BLOCK
      ?auto_604765 - BLOCK
      ?auto_604766 - BLOCK
      ?auto_604767 - BLOCK
      ?auto_604768 - BLOCK
      ?auto_604769 - BLOCK
      ?auto_604770 - BLOCK
      ?auto_604771 - BLOCK
      ?auto_604772 - BLOCK
      ?auto_604773 - BLOCK
      ?auto_604774 - BLOCK
    )
    :vars
    (
      ?auto_604775 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_604774 ?auto_604775 ) ( ON-TABLE ?auto_604758 ) ( ON ?auto_604759 ?auto_604758 ) ( ON ?auto_604760 ?auto_604759 ) ( ON ?auto_604761 ?auto_604760 ) ( ON ?auto_604762 ?auto_604761 ) ( ON ?auto_604763 ?auto_604762 ) ( ON ?auto_604764 ?auto_604763 ) ( not ( = ?auto_604758 ?auto_604759 ) ) ( not ( = ?auto_604758 ?auto_604760 ) ) ( not ( = ?auto_604758 ?auto_604761 ) ) ( not ( = ?auto_604758 ?auto_604762 ) ) ( not ( = ?auto_604758 ?auto_604763 ) ) ( not ( = ?auto_604758 ?auto_604764 ) ) ( not ( = ?auto_604758 ?auto_604765 ) ) ( not ( = ?auto_604758 ?auto_604766 ) ) ( not ( = ?auto_604758 ?auto_604767 ) ) ( not ( = ?auto_604758 ?auto_604768 ) ) ( not ( = ?auto_604758 ?auto_604769 ) ) ( not ( = ?auto_604758 ?auto_604770 ) ) ( not ( = ?auto_604758 ?auto_604771 ) ) ( not ( = ?auto_604758 ?auto_604772 ) ) ( not ( = ?auto_604758 ?auto_604773 ) ) ( not ( = ?auto_604758 ?auto_604774 ) ) ( not ( = ?auto_604758 ?auto_604775 ) ) ( not ( = ?auto_604759 ?auto_604760 ) ) ( not ( = ?auto_604759 ?auto_604761 ) ) ( not ( = ?auto_604759 ?auto_604762 ) ) ( not ( = ?auto_604759 ?auto_604763 ) ) ( not ( = ?auto_604759 ?auto_604764 ) ) ( not ( = ?auto_604759 ?auto_604765 ) ) ( not ( = ?auto_604759 ?auto_604766 ) ) ( not ( = ?auto_604759 ?auto_604767 ) ) ( not ( = ?auto_604759 ?auto_604768 ) ) ( not ( = ?auto_604759 ?auto_604769 ) ) ( not ( = ?auto_604759 ?auto_604770 ) ) ( not ( = ?auto_604759 ?auto_604771 ) ) ( not ( = ?auto_604759 ?auto_604772 ) ) ( not ( = ?auto_604759 ?auto_604773 ) ) ( not ( = ?auto_604759 ?auto_604774 ) ) ( not ( = ?auto_604759 ?auto_604775 ) ) ( not ( = ?auto_604760 ?auto_604761 ) ) ( not ( = ?auto_604760 ?auto_604762 ) ) ( not ( = ?auto_604760 ?auto_604763 ) ) ( not ( = ?auto_604760 ?auto_604764 ) ) ( not ( = ?auto_604760 ?auto_604765 ) ) ( not ( = ?auto_604760 ?auto_604766 ) ) ( not ( = ?auto_604760 ?auto_604767 ) ) ( not ( = ?auto_604760 ?auto_604768 ) ) ( not ( = ?auto_604760 ?auto_604769 ) ) ( not ( = ?auto_604760 ?auto_604770 ) ) ( not ( = ?auto_604760 ?auto_604771 ) ) ( not ( = ?auto_604760 ?auto_604772 ) ) ( not ( = ?auto_604760 ?auto_604773 ) ) ( not ( = ?auto_604760 ?auto_604774 ) ) ( not ( = ?auto_604760 ?auto_604775 ) ) ( not ( = ?auto_604761 ?auto_604762 ) ) ( not ( = ?auto_604761 ?auto_604763 ) ) ( not ( = ?auto_604761 ?auto_604764 ) ) ( not ( = ?auto_604761 ?auto_604765 ) ) ( not ( = ?auto_604761 ?auto_604766 ) ) ( not ( = ?auto_604761 ?auto_604767 ) ) ( not ( = ?auto_604761 ?auto_604768 ) ) ( not ( = ?auto_604761 ?auto_604769 ) ) ( not ( = ?auto_604761 ?auto_604770 ) ) ( not ( = ?auto_604761 ?auto_604771 ) ) ( not ( = ?auto_604761 ?auto_604772 ) ) ( not ( = ?auto_604761 ?auto_604773 ) ) ( not ( = ?auto_604761 ?auto_604774 ) ) ( not ( = ?auto_604761 ?auto_604775 ) ) ( not ( = ?auto_604762 ?auto_604763 ) ) ( not ( = ?auto_604762 ?auto_604764 ) ) ( not ( = ?auto_604762 ?auto_604765 ) ) ( not ( = ?auto_604762 ?auto_604766 ) ) ( not ( = ?auto_604762 ?auto_604767 ) ) ( not ( = ?auto_604762 ?auto_604768 ) ) ( not ( = ?auto_604762 ?auto_604769 ) ) ( not ( = ?auto_604762 ?auto_604770 ) ) ( not ( = ?auto_604762 ?auto_604771 ) ) ( not ( = ?auto_604762 ?auto_604772 ) ) ( not ( = ?auto_604762 ?auto_604773 ) ) ( not ( = ?auto_604762 ?auto_604774 ) ) ( not ( = ?auto_604762 ?auto_604775 ) ) ( not ( = ?auto_604763 ?auto_604764 ) ) ( not ( = ?auto_604763 ?auto_604765 ) ) ( not ( = ?auto_604763 ?auto_604766 ) ) ( not ( = ?auto_604763 ?auto_604767 ) ) ( not ( = ?auto_604763 ?auto_604768 ) ) ( not ( = ?auto_604763 ?auto_604769 ) ) ( not ( = ?auto_604763 ?auto_604770 ) ) ( not ( = ?auto_604763 ?auto_604771 ) ) ( not ( = ?auto_604763 ?auto_604772 ) ) ( not ( = ?auto_604763 ?auto_604773 ) ) ( not ( = ?auto_604763 ?auto_604774 ) ) ( not ( = ?auto_604763 ?auto_604775 ) ) ( not ( = ?auto_604764 ?auto_604765 ) ) ( not ( = ?auto_604764 ?auto_604766 ) ) ( not ( = ?auto_604764 ?auto_604767 ) ) ( not ( = ?auto_604764 ?auto_604768 ) ) ( not ( = ?auto_604764 ?auto_604769 ) ) ( not ( = ?auto_604764 ?auto_604770 ) ) ( not ( = ?auto_604764 ?auto_604771 ) ) ( not ( = ?auto_604764 ?auto_604772 ) ) ( not ( = ?auto_604764 ?auto_604773 ) ) ( not ( = ?auto_604764 ?auto_604774 ) ) ( not ( = ?auto_604764 ?auto_604775 ) ) ( not ( = ?auto_604765 ?auto_604766 ) ) ( not ( = ?auto_604765 ?auto_604767 ) ) ( not ( = ?auto_604765 ?auto_604768 ) ) ( not ( = ?auto_604765 ?auto_604769 ) ) ( not ( = ?auto_604765 ?auto_604770 ) ) ( not ( = ?auto_604765 ?auto_604771 ) ) ( not ( = ?auto_604765 ?auto_604772 ) ) ( not ( = ?auto_604765 ?auto_604773 ) ) ( not ( = ?auto_604765 ?auto_604774 ) ) ( not ( = ?auto_604765 ?auto_604775 ) ) ( not ( = ?auto_604766 ?auto_604767 ) ) ( not ( = ?auto_604766 ?auto_604768 ) ) ( not ( = ?auto_604766 ?auto_604769 ) ) ( not ( = ?auto_604766 ?auto_604770 ) ) ( not ( = ?auto_604766 ?auto_604771 ) ) ( not ( = ?auto_604766 ?auto_604772 ) ) ( not ( = ?auto_604766 ?auto_604773 ) ) ( not ( = ?auto_604766 ?auto_604774 ) ) ( not ( = ?auto_604766 ?auto_604775 ) ) ( not ( = ?auto_604767 ?auto_604768 ) ) ( not ( = ?auto_604767 ?auto_604769 ) ) ( not ( = ?auto_604767 ?auto_604770 ) ) ( not ( = ?auto_604767 ?auto_604771 ) ) ( not ( = ?auto_604767 ?auto_604772 ) ) ( not ( = ?auto_604767 ?auto_604773 ) ) ( not ( = ?auto_604767 ?auto_604774 ) ) ( not ( = ?auto_604767 ?auto_604775 ) ) ( not ( = ?auto_604768 ?auto_604769 ) ) ( not ( = ?auto_604768 ?auto_604770 ) ) ( not ( = ?auto_604768 ?auto_604771 ) ) ( not ( = ?auto_604768 ?auto_604772 ) ) ( not ( = ?auto_604768 ?auto_604773 ) ) ( not ( = ?auto_604768 ?auto_604774 ) ) ( not ( = ?auto_604768 ?auto_604775 ) ) ( not ( = ?auto_604769 ?auto_604770 ) ) ( not ( = ?auto_604769 ?auto_604771 ) ) ( not ( = ?auto_604769 ?auto_604772 ) ) ( not ( = ?auto_604769 ?auto_604773 ) ) ( not ( = ?auto_604769 ?auto_604774 ) ) ( not ( = ?auto_604769 ?auto_604775 ) ) ( not ( = ?auto_604770 ?auto_604771 ) ) ( not ( = ?auto_604770 ?auto_604772 ) ) ( not ( = ?auto_604770 ?auto_604773 ) ) ( not ( = ?auto_604770 ?auto_604774 ) ) ( not ( = ?auto_604770 ?auto_604775 ) ) ( not ( = ?auto_604771 ?auto_604772 ) ) ( not ( = ?auto_604771 ?auto_604773 ) ) ( not ( = ?auto_604771 ?auto_604774 ) ) ( not ( = ?auto_604771 ?auto_604775 ) ) ( not ( = ?auto_604772 ?auto_604773 ) ) ( not ( = ?auto_604772 ?auto_604774 ) ) ( not ( = ?auto_604772 ?auto_604775 ) ) ( not ( = ?auto_604773 ?auto_604774 ) ) ( not ( = ?auto_604773 ?auto_604775 ) ) ( not ( = ?auto_604774 ?auto_604775 ) ) ( ON ?auto_604773 ?auto_604774 ) ( ON ?auto_604772 ?auto_604773 ) ( ON ?auto_604771 ?auto_604772 ) ( ON ?auto_604770 ?auto_604771 ) ( ON ?auto_604769 ?auto_604770 ) ( ON ?auto_604768 ?auto_604769 ) ( ON ?auto_604767 ?auto_604768 ) ( ON ?auto_604766 ?auto_604767 ) ( CLEAR ?auto_604764 ) ( ON ?auto_604765 ?auto_604766 ) ( CLEAR ?auto_604765 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_604758 ?auto_604759 ?auto_604760 ?auto_604761 ?auto_604762 ?auto_604763 ?auto_604764 ?auto_604765 )
      ( MAKE-17PILE ?auto_604758 ?auto_604759 ?auto_604760 ?auto_604761 ?auto_604762 ?auto_604763 ?auto_604764 ?auto_604765 ?auto_604766 ?auto_604767 ?auto_604768 ?auto_604769 ?auto_604770 ?auto_604771 ?auto_604772 ?auto_604773 ?auto_604774 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_604793 - BLOCK
      ?auto_604794 - BLOCK
      ?auto_604795 - BLOCK
      ?auto_604796 - BLOCK
      ?auto_604797 - BLOCK
      ?auto_604798 - BLOCK
      ?auto_604799 - BLOCK
      ?auto_604800 - BLOCK
      ?auto_604801 - BLOCK
      ?auto_604802 - BLOCK
      ?auto_604803 - BLOCK
      ?auto_604804 - BLOCK
      ?auto_604805 - BLOCK
      ?auto_604806 - BLOCK
      ?auto_604807 - BLOCK
      ?auto_604808 - BLOCK
      ?auto_604809 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_604809 ) ( ON-TABLE ?auto_604793 ) ( ON ?auto_604794 ?auto_604793 ) ( ON ?auto_604795 ?auto_604794 ) ( ON ?auto_604796 ?auto_604795 ) ( ON ?auto_604797 ?auto_604796 ) ( ON ?auto_604798 ?auto_604797 ) ( ON ?auto_604799 ?auto_604798 ) ( not ( = ?auto_604793 ?auto_604794 ) ) ( not ( = ?auto_604793 ?auto_604795 ) ) ( not ( = ?auto_604793 ?auto_604796 ) ) ( not ( = ?auto_604793 ?auto_604797 ) ) ( not ( = ?auto_604793 ?auto_604798 ) ) ( not ( = ?auto_604793 ?auto_604799 ) ) ( not ( = ?auto_604793 ?auto_604800 ) ) ( not ( = ?auto_604793 ?auto_604801 ) ) ( not ( = ?auto_604793 ?auto_604802 ) ) ( not ( = ?auto_604793 ?auto_604803 ) ) ( not ( = ?auto_604793 ?auto_604804 ) ) ( not ( = ?auto_604793 ?auto_604805 ) ) ( not ( = ?auto_604793 ?auto_604806 ) ) ( not ( = ?auto_604793 ?auto_604807 ) ) ( not ( = ?auto_604793 ?auto_604808 ) ) ( not ( = ?auto_604793 ?auto_604809 ) ) ( not ( = ?auto_604794 ?auto_604795 ) ) ( not ( = ?auto_604794 ?auto_604796 ) ) ( not ( = ?auto_604794 ?auto_604797 ) ) ( not ( = ?auto_604794 ?auto_604798 ) ) ( not ( = ?auto_604794 ?auto_604799 ) ) ( not ( = ?auto_604794 ?auto_604800 ) ) ( not ( = ?auto_604794 ?auto_604801 ) ) ( not ( = ?auto_604794 ?auto_604802 ) ) ( not ( = ?auto_604794 ?auto_604803 ) ) ( not ( = ?auto_604794 ?auto_604804 ) ) ( not ( = ?auto_604794 ?auto_604805 ) ) ( not ( = ?auto_604794 ?auto_604806 ) ) ( not ( = ?auto_604794 ?auto_604807 ) ) ( not ( = ?auto_604794 ?auto_604808 ) ) ( not ( = ?auto_604794 ?auto_604809 ) ) ( not ( = ?auto_604795 ?auto_604796 ) ) ( not ( = ?auto_604795 ?auto_604797 ) ) ( not ( = ?auto_604795 ?auto_604798 ) ) ( not ( = ?auto_604795 ?auto_604799 ) ) ( not ( = ?auto_604795 ?auto_604800 ) ) ( not ( = ?auto_604795 ?auto_604801 ) ) ( not ( = ?auto_604795 ?auto_604802 ) ) ( not ( = ?auto_604795 ?auto_604803 ) ) ( not ( = ?auto_604795 ?auto_604804 ) ) ( not ( = ?auto_604795 ?auto_604805 ) ) ( not ( = ?auto_604795 ?auto_604806 ) ) ( not ( = ?auto_604795 ?auto_604807 ) ) ( not ( = ?auto_604795 ?auto_604808 ) ) ( not ( = ?auto_604795 ?auto_604809 ) ) ( not ( = ?auto_604796 ?auto_604797 ) ) ( not ( = ?auto_604796 ?auto_604798 ) ) ( not ( = ?auto_604796 ?auto_604799 ) ) ( not ( = ?auto_604796 ?auto_604800 ) ) ( not ( = ?auto_604796 ?auto_604801 ) ) ( not ( = ?auto_604796 ?auto_604802 ) ) ( not ( = ?auto_604796 ?auto_604803 ) ) ( not ( = ?auto_604796 ?auto_604804 ) ) ( not ( = ?auto_604796 ?auto_604805 ) ) ( not ( = ?auto_604796 ?auto_604806 ) ) ( not ( = ?auto_604796 ?auto_604807 ) ) ( not ( = ?auto_604796 ?auto_604808 ) ) ( not ( = ?auto_604796 ?auto_604809 ) ) ( not ( = ?auto_604797 ?auto_604798 ) ) ( not ( = ?auto_604797 ?auto_604799 ) ) ( not ( = ?auto_604797 ?auto_604800 ) ) ( not ( = ?auto_604797 ?auto_604801 ) ) ( not ( = ?auto_604797 ?auto_604802 ) ) ( not ( = ?auto_604797 ?auto_604803 ) ) ( not ( = ?auto_604797 ?auto_604804 ) ) ( not ( = ?auto_604797 ?auto_604805 ) ) ( not ( = ?auto_604797 ?auto_604806 ) ) ( not ( = ?auto_604797 ?auto_604807 ) ) ( not ( = ?auto_604797 ?auto_604808 ) ) ( not ( = ?auto_604797 ?auto_604809 ) ) ( not ( = ?auto_604798 ?auto_604799 ) ) ( not ( = ?auto_604798 ?auto_604800 ) ) ( not ( = ?auto_604798 ?auto_604801 ) ) ( not ( = ?auto_604798 ?auto_604802 ) ) ( not ( = ?auto_604798 ?auto_604803 ) ) ( not ( = ?auto_604798 ?auto_604804 ) ) ( not ( = ?auto_604798 ?auto_604805 ) ) ( not ( = ?auto_604798 ?auto_604806 ) ) ( not ( = ?auto_604798 ?auto_604807 ) ) ( not ( = ?auto_604798 ?auto_604808 ) ) ( not ( = ?auto_604798 ?auto_604809 ) ) ( not ( = ?auto_604799 ?auto_604800 ) ) ( not ( = ?auto_604799 ?auto_604801 ) ) ( not ( = ?auto_604799 ?auto_604802 ) ) ( not ( = ?auto_604799 ?auto_604803 ) ) ( not ( = ?auto_604799 ?auto_604804 ) ) ( not ( = ?auto_604799 ?auto_604805 ) ) ( not ( = ?auto_604799 ?auto_604806 ) ) ( not ( = ?auto_604799 ?auto_604807 ) ) ( not ( = ?auto_604799 ?auto_604808 ) ) ( not ( = ?auto_604799 ?auto_604809 ) ) ( not ( = ?auto_604800 ?auto_604801 ) ) ( not ( = ?auto_604800 ?auto_604802 ) ) ( not ( = ?auto_604800 ?auto_604803 ) ) ( not ( = ?auto_604800 ?auto_604804 ) ) ( not ( = ?auto_604800 ?auto_604805 ) ) ( not ( = ?auto_604800 ?auto_604806 ) ) ( not ( = ?auto_604800 ?auto_604807 ) ) ( not ( = ?auto_604800 ?auto_604808 ) ) ( not ( = ?auto_604800 ?auto_604809 ) ) ( not ( = ?auto_604801 ?auto_604802 ) ) ( not ( = ?auto_604801 ?auto_604803 ) ) ( not ( = ?auto_604801 ?auto_604804 ) ) ( not ( = ?auto_604801 ?auto_604805 ) ) ( not ( = ?auto_604801 ?auto_604806 ) ) ( not ( = ?auto_604801 ?auto_604807 ) ) ( not ( = ?auto_604801 ?auto_604808 ) ) ( not ( = ?auto_604801 ?auto_604809 ) ) ( not ( = ?auto_604802 ?auto_604803 ) ) ( not ( = ?auto_604802 ?auto_604804 ) ) ( not ( = ?auto_604802 ?auto_604805 ) ) ( not ( = ?auto_604802 ?auto_604806 ) ) ( not ( = ?auto_604802 ?auto_604807 ) ) ( not ( = ?auto_604802 ?auto_604808 ) ) ( not ( = ?auto_604802 ?auto_604809 ) ) ( not ( = ?auto_604803 ?auto_604804 ) ) ( not ( = ?auto_604803 ?auto_604805 ) ) ( not ( = ?auto_604803 ?auto_604806 ) ) ( not ( = ?auto_604803 ?auto_604807 ) ) ( not ( = ?auto_604803 ?auto_604808 ) ) ( not ( = ?auto_604803 ?auto_604809 ) ) ( not ( = ?auto_604804 ?auto_604805 ) ) ( not ( = ?auto_604804 ?auto_604806 ) ) ( not ( = ?auto_604804 ?auto_604807 ) ) ( not ( = ?auto_604804 ?auto_604808 ) ) ( not ( = ?auto_604804 ?auto_604809 ) ) ( not ( = ?auto_604805 ?auto_604806 ) ) ( not ( = ?auto_604805 ?auto_604807 ) ) ( not ( = ?auto_604805 ?auto_604808 ) ) ( not ( = ?auto_604805 ?auto_604809 ) ) ( not ( = ?auto_604806 ?auto_604807 ) ) ( not ( = ?auto_604806 ?auto_604808 ) ) ( not ( = ?auto_604806 ?auto_604809 ) ) ( not ( = ?auto_604807 ?auto_604808 ) ) ( not ( = ?auto_604807 ?auto_604809 ) ) ( not ( = ?auto_604808 ?auto_604809 ) ) ( ON ?auto_604808 ?auto_604809 ) ( ON ?auto_604807 ?auto_604808 ) ( ON ?auto_604806 ?auto_604807 ) ( ON ?auto_604805 ?auto_604806 ) ( ON ?auto_604804 ?auto_604805 ) ( ON ?auto_604803 ?auto_604804 ) ( ON ?auto_604802 ?auto_604803 ) ( ON ?auto_604801 ?auto_604802 ) ( CLEAR ?auto_604799 ) ( ON ?auto_604800 ?auto_604801 ) ( CLEAR ?auto_604800 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_604793 ?auto_604794 ?auto_604795 ?auto_604796 ?auto_604797 ?auto_604798 ?auto_604799 ?auto_604800 )
      ( MAKE-17PILE ?auto_604793 ?auto_604794 ?auto_604795 ?auto_604796 ?auto_604797 ?auto_604798 ?auto_604799 ?auto_604800 ?auto_604801 ?auto_604802 ?auto_604803 ?auto_604804 ?auto_604805 ?auto_604806 ?auto_604807 ?auto_604808 ?auto_604809 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_604827 - BLOCK
      ?auto_604828 - BLOCK
      ?auto_604829 - BLOCK
      ?auto_604830 - BLOCK
      ?auto_604831 - BLOCK
      ?auto_604832 - BLOCK
      ?auto_604833 - BLOCK
      ?auto_604834 - BLOCK
      ?auto_604835 - BLOCK
      ?auto_604836 - BLOCK
      ?auto_604837 - BLOCK
      ?auto_604838 - BLOCK
      ?auto_604839 - BLOCK
      ?auto_604840 - BLOCK
      ?auto_604841 - BLOCK
      ?auto_604842 - BLOCK
      ?auto_604843 - BLOCK
    )
    :vars
    (
      ?auto_604844 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_604843 ?auto_604844 ) ( ON-TABLE ?auto_604827 ) ( ON ?auto_604828 ?auto_604827 ) ( ON ?auto_604829 ?auto_604828 ) ( ON ?auto_604830 ?auto_604829 ) ( ON ?auto_604831 ?auto_604830 ) ( ON ?auto_604832 ?auto_604831 ) ( not ( = ?auto_604827 ?auto_604828 ) ) ( not ( = ?auto_604827 ?auto_604829 ) ) ( not ( = ?auto_604827 ?auto_604830 ) ) ( not ( = ?auto_604827 ?auto_604831 ) ) ( not ( = ?auto_604827 ?auto_604832 ) ) ( not ( = ?auto_604827 ?auto_604833 ) ) ( not ( = ?auto_604827 ?auto_604834 ) ) ( not ( = ?auto_604827 ?auto_604835 ) ) ( not ( = ?auto_604827 ?auto_604836 ) ) ( not ( = ?auto_604827 ?auto_604837 ) ) ( not ( = ?auto_604827 ?auto_604838 ) ) ( not ( = ?auto_604827 ?auto_604839 ) ) ( not ( = ?auto_604827 ?auto_604840 ) ) ( not ( = ?auto_604827 ?auto_604841 ) ) ( not ( = ?auto_604827 ?auto_604842 ) ) ( not ( = ?auto_604827 ?auto_604843 ) ) ( not ( = ?auto_604827 ?auto_604844 ) ) ( not ( = ?auto_604828 ?auto_604829 ) ) ( not ( = ?auto_604828 ?auto_604830 ) ) ( not ( = ?auto_604828 ?auto_604831 ) ) ( not ( = ?auto_604828 ?auto_604832 ) ) ( not ( = ?auto_604828 ?auto_604833 ) ) ( not ( = ?auto_604828 ?auto_604834 ) ) ( not ( = ?auto_604828 ?auto_604835 ) ) ( not ( = ?auto_604828 ?auto_604836 ) ) ( not ( = ?auto_604828 ?auto_604837 ) ) ( not ( = ?auto_604828 ?auto_604838 ) ) ( not ( = ?auto_604828 ?auto_604839 ) ) ( not ( = ?auto_604828 ?auto_604840 ) ) ( not ( = ?auto_604828 ?auto_604841 ) ) ( not ( = ?auto_604828 ?auto_604842 ) ) ( not ( = ?auto_604828 ?auto_604843 ) ) ( not ( = ?auto_604828 ?auto_604844 ) ) ( not ( = ?auto_604829 ?auto_604830 ) ) ( not ( = ?auto_604829 ?auto_604831 ) ) ( not ( = ?auto_604829 ?auto_604832 ) ) ( not ( = ?auto_604829 ?auto_604833 ) ) ( not ( = ?auto_604829 ?auto_604834 ) ) ( not ( = ?auto_604829 ?auto_604835 ) ) ( not ( = ?auto_604829 ?auto_604836 ) ) ( not ( = ?auto_604829 ?auto_604837 ) ) ( not ( = ?auto_604829 ?auto_604838 ) ) ( not ( = ?auto_604829 ?auto_604839 ) ) ( not ( = ?auto_604829 ?auto_604840 ) ) ( not ( = ?auto_604829 ?auto_604841 ) ) ( not ( = ?auto_604829 ?auto_604842 ) ) ( not ( = ?auto_604829 ?auto_604843 ) ) ( not ( = ?auto_604829 ?auto_604844 ) ) ( not ( = ?auto_604830 ?auto_604831 ) ) ( not ( = ?auto_604830 ?auto_604832 ) ) ( not ( = ?auto_604830 ?auto_604833 ) ) ( not ( = ?auto_604830 ?auto_604834 ) ) ( not ( = ?auto_604830 ?auto_604835 ) ) ( not ( = ?auto_604830 ?auto_604836 ) ) ( not ( = ?auto_604830 ?auto_604837 ) ) ( not ( = ?auto_604830 ?auto_604838 ) ) ( not ( = ?auto_604830 ?auto_604839 ) ) ( not ( = ?auto_604830 ?auto_604840 ) ) ( not ( = ?auto_604830 ?auto_604841 ) ) ( not ( = ?auto_604830 ?auto_604842 ) ) ( not ( = ?auto_604830 ?auto_604843 ) ) ( not ( = ?auto_604830 ?auto_604844 ) ) ( not ( = ?auto_604831 ?auto_604832 ) ) ( not ( = ?auto_604831 ?auto_604833 ) ) ( not ( = ?auto_604831 ?auto_604834 ) ) ( not ( = ?auto_604831 ?auto_604835 ) ) ( not ( = ?auto_604831 ?auto_604836 ) ) ( not ( = ?auto_604831 ?auto_604837 ) ) ( not ( = ?auto_604831 ?auto_604838 ) ) ( not ( = ?auto_604831 ?auto_604839 ) ) ( not ( = ?auto_604831 ?auto_604840 ) ) ( not ( = ?auto_604831 ?auto_604841 ) ) ( not ( = ?auto_604831 ?auto_604842 ) ) ( not ( = ?auto_604831 ?auto_604843 ) ) ( not ( = ?auto_604831 ?auto_604844 ) ) ( not ( = ?auto_604832 ?auto_604833 ) ) ( not ( = ?auto_604832 ?auto_604834 ) ) ( not ( = ?auto_604832 ?auto_604835 ) ) ( not ( = ?auto_604832 ?auto_604836 ) ) ( not ( = ?auto_604832 ?auto_604837 ) ) ( not ( = ?auto_604832 ?auto_604838 ) ) ( not ( = ?auto_604832 ?auto_604839 ) ) ( not ( = ?auto_604832 ?auto_604840 ) ) ( not ( = ?auto_604832 ?auto_604841 ) ) ( not ( = ?auto_604832 ?auto_604842 ) ) ( not ( = ?auto_604832 ?auto_604843 ) ) ( not ( = ?auto_604832 ?auto_604844 ) ) ( not ( = ?auto_604833 ?auto_604834 ) ) ( not ( = ?auto_604833 ?auto_604835 ) ) ( not ( = ?auto_604833 ?auto_604836 ) ) ( not ( = ?auto_604833 ?auto_604837 ) ) ( not ( = ?auto_604833 ?auto_604838 ) ) ( not ( = ?auto_604833 ?auto_604839 ) ) ( not ( = ?auto_604833 ?auto_604840 ) ) ( not ( = ?auto_604833 ?auto_604841 ) ) ( not ( = ?auto_604833 ?auto_604842 ) ) ( not ( = ?auto_604833 ?auto_604843 ) ) ( not ( = ?auto_604833 ?auto_604844 ) ) ( not ( = ?auto_604834 ?auto_604835 ) ) ( not ( = ?auto_604834 ?auto_604836 ) ) ( not ( = ?auto_604834 ?auto_604837 ) ) ( not ( = ?auto_604834 ?auto_604838 ) ) ( not ( = ?auto_604834 ?auto_604839 ) ) ( not ( = ?auto_604834 ?auto_604840 ) ) ( not ( = ?auto_604834 ?auto_604841 ) ) ( not ( = ?auto_604834 ?auto_604842 ) ) ( not ( = ?auto_604834 ?auto_604843 ) ) ( not ( = ?auto_604834 ?auto_604844 ) ) ( not ( = ?auto_604835 ?auto_604836 ) ) ( not ( = ?auto_604835 ?auto_604837 ) ) ( not ( = ?auto_604835 ?auto_604838 ) ) ( not ( = ?auto_604835 ?auto_604839 ) ) ( not ( = ?auto_604835 ?auto_604840 ) ) ( not ( = ?auto_604835 ?auto_604841 ) ) ( not ( = ?auto_604835 ?auto_604842 ) ) ( not ( = ?auto_604835 ?auto_604843 ) ) ( not ( = ?auto_604835 ?auto_604844 ) ) ( not ( = ?auto_604836 ?auto_604837 ) ) ( not ( = ?auto_604836 ?auto_604838 ) ) ( not ( = ?auto_604836 ?auto_604839 ) ) ( not ( = ?auto_604836 ?auto_604840 ) ) ( not ( = ?auto_604836 ?auto_604841 ) ) ( not ( = ?auto_604836 ?auto_604842 ) ) ( not ( = ?auto_604836 ?auto_604843 ) ) ( not ( = ?auto_604836 ?auto_604844 ) ) ( not ( = ?auto_604837 ?auto_604838 ) ) ( not ( = ?auto_604837 ?auto_604839 ) ) ( not ( = ?auto_604837 ?auto_604840 ) ) ( not ( = ?auto_604837 ?auto_604841 ) ) ( not ( = ?auto_604837 ?auto_604842 ) ) ( not ( = ?auto_604837 ?auto_604843 ) ) ( not ( = ?auto_604837 ?auto_604844 ) ) ( not ( = ?auto_604838 ?auto_604839 ) ) ( not ( = ?auto_604838 ?auto_604840 ) ) ( not ( = ?auto_604838 ?auto_604841 ) ) ( not ( = ?auto_604838 ?auto_604842 ) ) ( not ( = ?auto_604838 ?auto_604843 ) ) ( not ( = ?auto_604838 ?auto_604844 ) ) ( not ( = ?auto_604839 ?auto_604840 ) ) ( not ( = ?auto_604839 ?auto_604841 ) ) ( not ( = ?auto_604839 ?auto_604842 ) ) ( not ( = ?auto_604839 ?auto_604843 ) ) ( not ( = ?auto_604839 ?auto_604844 ) ) ( not ( = ?auto_604840 ?auto_604841 ) ) ( not ( = ?auto_604840 ?auto_604842 ) ) ( not ( = ?auto_604840 ?auto_604843 ) ) ( not ( = ?auto_604840 ?auto_604844 ) ) ( not ( = ?auto_604841 ?auto_604842 ) ) ( not ( = ?auto_604841 ?auto_604843 ) ) ( not ( = ?auto_604841 ?auto_604844 ) ) ( not ( = ?auto_604842 ?auto_604843 ) ) ( not ( = ?auto_604842 ?auto_604844 ) ) ( not ( = ?auto_604843 ?auto_604844 ) ) ( ON ?auto_604842 ?auto_604843 ) ( ON ?auto_604841 ?auto_604842 ) ( ON ?auto_604840 ?auto_604841 ) ( ON ?auto_604839 ?auto_604840 ) ( ON ?auto_604838 ?auto_604839 ) ( ON ?auto_604837 ?auto_604838 ) ( ON ?auto_604836 ?auto_604837 ) ( ON ?auto_604835 ?auto_604836 ) ( ON ?auto_604834 ?auto_604835 ) ( CLEAR ?auto_604832 ) ( ON ?auto_604833 ?auto_604834 ) ( CLEAR ?auto_604833 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_604827 ?auto_604828 ?auto_604829 ?auto_604830 ?auto_604831 ?auto_604832 ?auto_604833 )
      ( MAKE-17PILE ?auto_604827 ?auto_604828 ?auto_604829 ?auto_604830 ?auto_604831 ?auto_604832 ?auto_604833 ?auto_604834 ?auto_604835 ?auto_604836 ?auto_604837 ?auto_604838 ?auto_604839 ?auto_604840 ?auto_604841 ?auto_604842 ?auto_604843 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_604862 - BLOCK
      ?auto_604863 - BLOCK
      ?auto_604864 - BLOCK
      ?auto_604865 - BLOCK
      ?auto_604866 - BLOCK
      ?auto_604867 - BLOCK
      ?auto_604868 - BLOCK
      ?auto_604869 - BLOCK
      ?auto_604870 - BLOCK
      ?auto_604871 - BLOCK
      ?auto_604872 - BLOCK
      ?auto_604873 - BLOCK
      ?auto_604874 - BLOCK
      ?auto_604875 - BLOCK
      ?auto_604876 - BLOCK
      ?auto_604877 - BLOCK
      ?auto_604878 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_604878 ) ( ON-TABLE ?auto_604862 ) ( ON ?auto_604863 ?auto_604862 ) ( ON ?auto_604864 ?auto_604863 ) ( ON ?auto_604865 ?auto_604864 ) ( ON ?auto_604866 ?auto_604865 ) ( ON ?auto_604867 ?auto_604866 ) ( not ( = ?auto_604862 ?auto_604863 ) ) ( not ( = ?auto_604862 ?auto_604864 ) ) ( not ( = ?auto_604862 ?auto_604865 ) ) ( not ( = ?auto_604862 ?auto_604866 ) ) ( not ( = ?auto_604862 ?auto_604867 ) ) ( not ( = ?auto_604862 ?auto_604868 ) ) ( not ( = ?auto_604862 ?auto_604869 ) ) ( not ( = ?auto_604862 ?auto_604870 ) ) ( not ( = ?auto_604862 ?auto_604871 ) ) ( not ( = ?auto_604862 ?auto_604872 ) ) ( not ( = ?auto_604862 ?auto_604873 ) ) ( not ( = ?auto_604862 ?auto_604874 ) ) ( not ( = ?auto_604862 ?auto_604875 ) ) ( not ( = ?auto_604862 ?auto_604876 ) ) ( not ( = ?auto_604862 ?auto_604877 ) ) ( not ( = ?auto_604862 ?auto_604878 ) ) ( not ( = ?auto_604863 ?auto_604864 ) ) ( not ( = ?auto_604863 ?auto_604865 ) ) ( not ( = ?auto_604863 ?auto_604866 ) ) ( not ( = ?auto_604863 ?auto_604867 ) ) ( not ( = ?auto_604863 ?auto_604868 ) ) ( not ( = ?auto_604863 ?auto_604869 ) ) ( not ( = ?auto_604863 ?auto_604870 ) ) ( not ( = ?auto_604863 ?auto_604871 ) ) ( not ( = ?auto_604863 ?auto_604872 ) ) ( not ( = ?auto_604863 ?auto_604873 ) ) ( not ( = ?auto_604863 ?auto_604874 ) ) ( not ( = ?auto_604863 ?auto_604875 ) ) ( not ( = ?auto_604863 ?auto_604876 ) ) ( not ( = ?auto_604863 ?auto_604877 ) ) ( not ( = ?auto_604863 ?auto_604878 ) ) ( not ( = ?auto_604864 ?auto_604865 ) ) ( not ( = ?auto_604864 ?auto_604866 ) ) ( not ( = ?auto_604864 ?auto_604867 ) ) ( not ( = ?auto_604864 ?auto_604868 ) ) ( not ( = ?auto_604864 ?auto_604869 ) ) ( not ( = ?auto_604864 ?auto_604870 ) ) ( not ( = ?auto_604864 ?auto_604871 ) ) ( not ( = ?auto_604864 ?auto_604872 ) ) ( not ( = ?auto_604864 ?auto_604873 ) ) ( not ( = ?auto_604864 ?auto_604874 ) ) ( not ( = ?auto_604864 ?auto_604875 ) ) ( not ( = ?auto_604864 ?auto_604876 ) ) ( not ( = ?auto_604864 ?auto_604877 ) ) ( not ( = ?auto_604864 ?auto_604878 ) ) ( not ( = ?auto_604865 ?auto_604866 ) ) ( not ( = ?auto_604865 ?auto_604867 ) ) ( not ( = ?auto_604865 ?auto_604868 ) ) ( not ( = ?auto_604865 ?auto_604869 ) ) ( not ( = ?auto_604865 ?auto_604870 ) ) ( not ( = ?auto_604865 ?auto_604871 ) ) ( not ( = ?auto_604865 ?auto_604872 ) ) ( not ( = ?auto_604865 ?auto_604873 ) ) ( not ( = ?auto_604865 ?auto_604874 ) ) ( not ( = ?auto_604865 ?auto_604875 ) ) ( not ( = ?auto_604865 ?auto_604876 ) ) ( not ( = ?auto_604865 ?auto_604877 ) ) ( not ( = ?auto_604865 ?auto_604878 ) ) ( not ( = ?auto_604866 ?auto_604867 ) ) ( not ( = ?auto_604866 ?auto_604868 ) ) ( not ( = ?auto_604866 ?auto_604869 ) ) ( not ( = ?auto_604866 ?auto_604870 ) ) ( not ( = ?auto_604866 ?auto_604871 ) ) ( not ( = ?auto_604866 ?auto_604872 ) ) ( not ( = ?auto_604866 ?auto_604873 ) ) ( not ( = ?auto_604866 ?auto_604874 ) ) ( not ( = ?auto_604866 ?auto_604875 ) ) ( not ( = ?auto_604866 ?auto_604876 ) ) ( not ( = ?auto_604866 ?auto_604877 ) ) ( not ( = ?auto_604866 ?auto_604878 ) ) ( not ( = ?auto_604867 ?auto_604868 ) ) ( not ( = ?auto_604867 ?auto_604869 ) ) ( not ( = ?auto_604867 ?auto_604870 ) ) ( not ( = ?auto_604867 ?auto_604871 ) ) ( not ( = ?auto_604867 ?auto_604872 ) ) ( not ( = ?auto_604867 ?auto_604873 ) ) ( not ( = ?auto_604867 ?auto_604874 ) ) ( not ( = ?auto_604867 ?auto_604875 ) ) ( not ( = ?auto_604867 ?auto_604876 ) ) ( not ( = ?auto_604867 ?auto_604877 ) ) ( not ( = ?auto_604867 ?auto_604878 ) ) ( not ( = ?auto_604868 ?auto_604869 ) ) ( not ( = ?auto_604868 ?auto_604870 ) ) ( not ( = ?auto_604868 ?auto_604871 ) ) ( not ( = ?auto_604868 ?auto_604872 ) ) ( not ( = ?auto_604868 ?auto_604873 ) ) ( not ( = ?auto_604868 ?auto_604874 ) ) ( not ( = ?auto_604868 ?auto_604875 ) ) ( not ( = ?auto_604868 ?auto_604876 ) ) ( not ( = ?auto_604868 ?auto_604877 ) ) ( not ( = ?auto_604868 ?auto_604878 ) ) ( not ( = ?auto_604869 ?auto_604870 ) ) ( not ( = ?auto_604869 ?auto_604871 ) ) ( not ( = ?auto_604869 ?auto_604872 ) ) ( not ( = ?auto_604869 ?auto_604873 ) ) ( not ( = ?auto_604869 ?auto_604874 ) ) ( not ( = ?auto_604869 ?auto_604875 ) ) ( not ( = ?auto_604869 ?auto_604876 ) ) ( not ( = ?auto_604869 ?auto_604877 ) ) ( not ( = ?auto_604869 ?auto_604878 ) ) ( not ( = ?auto_604870 ?auto_604871 ) ) ( not ( = ?auto_604870 ?auto_604872 ) ) ( not ( = ?auto_604870 ?auto_604873 ) ) ( not ( = ?auto_604870 ?auto_604874 ) ) ( not ( = ?auto_604870 ?auto_604875 ) ) ( not ( = ?auto_604870 ?auto_604876 ) ) ( not ( = ?auto_604870 ?auto_604877 ) ) ( not ( = ?auto_604870 ?auto_604878 ) ) ( not ( = ?auto_604871 ?auto_604872 ) ) ( not ( = ?auto_604871 ?auto_604873 ) ) ( not ( = ?auto_604871 ?auto_604874 ) ) ( not ( = ?auto_604871 ?auto_604875 ) ) ( not ( = ?auto_604871 ?auto_604876 ) ) ( not ( = ?auto_604871 ?auto_604877 ) ) ( not ( = ?auto_604871 ?auto_604878 ) ) ( not ( = ?auto_604872 ?auto_604873 ) ) ( not ( = ?auto_604872 ?auto_604874 ) ) ( not ( = ?auto_604872 ?auto_604875 ) ) ( not ( = ?auto_604872 ?auto_604876 ) ) ( not ( = ?auto_604872 ?auto_604877 ) ) ( not ( = ?auto_604872 ?auto_604878 ) ) ( not ( = ?auto_604873 ?auto_604874 ) ) ( not ( = ?auto_604873 ?auto_604875 ) ) ( not ( = ?auto_604873 ?auto_604876 ) ) ( not ( = ?auto_604873 ?auto_604877 ) ) ( not ( = ?auto_604873 ?auto_604878 ) ) ( not ( = ?auto_604874 ?auto_604875 ) ) ( not ( = ?auto_604874 ?auto_604876 ) ) ( not ( = ?auto_604874 ?auto_604877 ) ) ( not ( = ?auto_604874 ?auto_604878 ) ) ( not ( = ?auto_604875 ?auto_604876 ) ) ( not ( = ?auto_604875 ?auto_604877 ) ) ( not ( = ?auto_604875 ?auto_604878 ) ) ( not ( = ?auto_604876 ?auto_604877 ) ) ( not ( = ?auto_604876 ?auto_604878 ) ) ( not ( = ?auto_604877 ?auto_604878 ) ) ( ON ?auto_604877 ?auto_604878 ) ( ON ?auto_604876 ?auto_604877 ) ( ON ?auto_604875 ?auto_604876 ) ( ON ?auto_604874 ?auto_604875 ) ( ON ?auto_604873 ?auto_604874 ) ( ON ?auto_604872 ?auto_604873 ) ( ON ?auto_604871 ?auto_604872 ) ( ON ?auto_604870 ?auto_604871 ) ( ON ?auto_604869 ?auto_604870 ) ( CLEAR ?auto_604867 ) ( ON ?auto_604868 ?auto_604869 ) ( CLEAR ?auto_604868 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_604862 ?auto_604863 ?auto_604864 ?auto_604865 ?auto_604866 ?auto_604867 ?auto_604868 )
      ( MAKE-17PILE ?auto_604862 ?auto_604863 ?auto_604864 ?auto_604865 ?auto_604866 ?auto_604867 ?auto_604868 ?auto_604869 ?auto_604870 ?auto_604871 ?auto_604872 ?auto_604873 ?auto_604874 ?auto_604875 ?auto_604876 ?auto_604877 ?auto_604878 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_604896 - BLOCK
      ?auto_604897 - BLOCK
      ?auto_604898 - BLOCK
      ?auto_604899 - BLOCK
      ?auto_604900 - BLOCK
      ?auto_604901 - BLOCK
      ?auto_604902 - BLOCK
      ?auto_604903 - BLOCK
      ?auto_604904 - BLOCK
      ?auto_604905 - BLOCK
      ?auto_604906 - BLOCK
      ?auto_604907 - BLOCK
      ?auto_604908 - BLOCK
      ?auto_604909 - BLOCK
      ?auto_604910 - BLOCK
      ?auto_604911 - BLOCK
      ?auto_604912 - BLOCK
    )
    :vars
    (
      ?auto_604913 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_604912 ?auto_604913 ) ( ON-TABLE ?auto_604896 ) ( ON ?auto_604897 ?auto_604896 ) ( ON ?auto_604898 ?auto_604897 ) ( ON ?auto_604899 ?auto_604898 ) ( ON ?auto_604900 ?auto_604899 ) ( not ( = ?auto_604896 ?auto_604897 ) ) ( not ( = ?auto_604896 ?auto_604898 ) ) ( not ( = ?auto_604896 ?auto_604899 ) ) ( not ( = ?auto_604896 ?auto_604900 ) ) ( not ( = ?auto_604896 ?auto_604901 ) ) ( not ( = ?auto_604896 ?auto_604902 ) ) ( not ( = ?auto_604896 ?auto_604903 ) ) ( not ( = ?auto_604896 ?auto_604904 ) ) ( not ( = ?auto_604896 ?auto_604905 ) ) ( not ( = ?auto_604896 ?auto_604906 ) ) ( not ( = ?auto_604896 ?auto_604907 ) ) ( not ( = ?auto_604896 ?auto_604908 ) ) ( not ( = ?auto_604896 ?auto_604909 ) ) ( not ( = ?auto_604896 ?auto_604910 ) ) ( not ( = ?auto_604896 ?auto_604911 ) ) ( not ( = ?auto_604896 ?auto_604912 ) ) ( not ( = ?auto_604896 ?auto_604913 ) ) ( not ( = ?auto_604897 ?auto_604898 ) ) ( not ( = ?auto_604897 ?auto_604899 ) ) ( not ( = ?auto_604897 ?auto_604900 ) ) ( not ( = ?auto_604897 ?auto_604901 ) ) ( not ( = ?auto_604897 ?auto_604902 ) ) ( not ( = ?auto_604897 ?auto_604903 ) ) ( not ( = ?auto_604897 ?auto_604904 ) ) ( not ( = ?auto_604897 ?auto_604905 ) ) ( not ( = ?auto_604897 ?auto_604906 ) ) ( not ( = ?auto_604897 ?auto_604907 ) ) ( not ( = ?auto_604897 ?auto_604908 ) ) ( not ( = ?auto_604897 ?auto_604909 ) ) ( not ( = ?auto_604897 ?auto_604910 ) ) ( not ( = ?auto_604897 ?auto_604911 ) ) ( not ( = ?auto_604897 ?auto_604912 ) ) ( not ( = ?auto_604897 ?auto_604913 ) ) ( not ( = ?auto_604898 ?auto_604899 ) ) ( not ( = ?auto_604898 ?auto_604900 ) ) ( not ( = ?auto_604898 ?auto_604901 ) ) ( not ( = ?auto_604898 ?auto_604902 ) ) ( not ( = ?auto_604898 ?auto_604903 ) ) ( not ( = ?auto_604898 ?auto_604904 ) ) ( not ( = ?auto_604898 ?auto_604905 ) ) ( not ( = ?auto_604898 ?auto_604906 ) ) ( not ( = ?auto_604898 ?auto_604907 ) ) ( not ( = ?auto_604898 ?auto_604908 ) ) ( not ( = ?auto_604898 ?auto_604909 ) ) ( not ( = ?auto_604898 ?auto_604910 ) ) ( not ( = ?auto_604898 ?auto_604911 ) ) ( not ( = ?auto_604898 ?auto_604912 ) ) ( not ( = ?auto_604898 ?auto_604913 ) ) ( not ( = ?auto_604899 ?auto_604900 ) ) ( not ( = ?auto_604899 ?auto_604901 ) ) ( not ( = ?auto_604899 ?auto_604902 ) ) ( not ( = ?auto_604899 ?auto_604903 ) ) ( not ( = ?auto_604899 ?auto_604904 ) ) ( not ( = ?auto_604899 ?auto_604905 ) ) ( not ( = ?auto_604899 ?auto_604906 ) ) ( not ( = ?auto_604899 ?auto_604907 ) ) ( not ( = ?auto_604899 ?auto_604908 ) ) ( not ( = ?auto_604899 ?auto_604909 ) ) ( not ( = ?auto_604899 ?auto_604910 ) ) ( not ( = ?auto_604899 ?auto_604911 ) ) ( not ( = ?auto_604899 ?auto_604912 ) ) ( not ( = ?auto_604899 ?auto_604913 ) ) ( not ( = ?auto_604900 ?auto_604901 ) ) ( not ( = ?auto_604900 ?auto_604902 ) ) ( not ( = ?auto_604900 ?auto_604903 ) ) ( not ( = ?auto_604900 ?auto_604904 ) ) ( not ( = ?auto_604900 ?auto_604905 ) ) ( not ( = ?auto_604900 ?auto_604906 ) ) ( not ( = ?auto_604900 ?auto_604907 ) ) ( not ( = ?auto_604900 ?auto_604908 ) ) ( not ( = ?auto_604900 ?auto_604909 ) ) ( not ( = ?auto_604900 ?auto_604910 ) ) ( not ( = ?auto_604900 ?auto_604911 ) ) ( not ( = ?auto_604900 ?auto_604912 ) ) ( not ( = ?auto_604900 ?auto_604913 ) ) ( not ( = ?auto_604901 ?auto_604902 ) ) ( not ( = ?auto_604901 ?auto_604903 ) ) ( not ( = ?auto_604901 ?auto_604904 ) ) ( not ( = ?auto_604901 ?auto_604905 ) ) ( not ( = ?auto_604901 ?auto_604906 ) ) ( not ( = ?auto_604901 ?auto_604907 ) ) ( not ( = ?auto_604901 ?auto_604908 ) ) ( not ( = ?auto_604901 ?auto_604909 ) ) ( not ( = ?auto_604901 ?auto_604910 ) ) ( not ( = ?auto_604901 ?auto_604911 ) ) ( not ( = ?auto_604901 ?auto_604912 ) ) ( not ( = ?auto_604901 ?auto_604913 ) ) ( not ( = ?auto_604902 ?auto_604903 ) ) ( not ( = ?auto_604902 ?auto_604904 ) ) ( not ( = ?auto_604902 ?auto_604905 ) ) ( not ( = ?auto_604902 ?auto_604906 ) ) ( not ( = ?auto_604902 ?auto_604907 ) ) ( not ( = ?auto_604902 ?auto_604908 ) ) ( not ( = ?auto_604902 ?auto_604909 ) ) ( not ( = ?auto_604902 ?auto_604910 ) ) ( not ( = ?auto_604902 ?auto_604911 ) ) ( not ( = ?auto_604902 ?auto_604912 ) ) ( not ( = ?auto_604902 ?auto_604913 ) ) ( not ( = ?auto_604903 ?auto_604904 ) ) ( not ( = ?auto_604903 ?auto_604905 ) ) ( not ( = ?auto_604903 ?auto_604906 ) ) ( not ( = ?auto_604903 ?auto_604907 ) ) ( not ( = ?auto_604903 ?auto_604908 ) ) ( not ( = ?auto_604903 ?auto_604909 ) ) ( not ( = ?auto_604903 ?auto_604910 ) ) ( not ( = ?auto_604903 ?auto_604911 ) ) ( not ( = ?auto_604903 ?auto_604912 ) ) ( not ( = ?auto_604903 ?auto_604913 ) ) ( not ( = ?auto_604904 ?auto_604905 ) ) ( not ( = ?auto_604904 ?auto_604906 ) ) ( not ( = ?auto_604904 ?auto_604907 ) ) ( not ( = ?auto_604904 ?auto_604908 ) ) ( not ( = ?auto_604904 ?auto_604909 ) ) ( not ( = ?auto_604904 ?auto_604910 ) ) ( not ( = ?auto_604904 ?auto_604911 ) ) ( not ( = ?auto_604904 ?auto_604912 ) ) ( not ( = ?auto_604904 ?auto_604913 ) ) ( not ( = ?auto_604905 ?auto_604906 ) ) ( not ( = ?auto_604905 ?auto_604907 ) ) ( not ( = ?auto_604905 ?auto_604908 ) ) ( not ( = ?auto_604905 ?auto_604909 ) ) ( not ( = ?auto_604905 ?auto_604910 ) ) ( not ( = ?auto_604905 ?auto_604911 ) ) ( not ( = ?auto_604905 ?auto_604912 ) ) ( not ( = ?auto_604905 ?auto_604913 ) ) ( not ( = ?auto_604906 ?auto_604907 ) ) ( not ( = ?auto_604906 ?auto_604908 ) ) ( not ( = ?auto_604906 ?auto_604909 ) ) ( not ( = ?auto_604906 ?auto_604910 ) ) ( not ( = ?auto_604906 ?auto_604911 ) ) ( not ( = ?auto_604906 ?auto_604912 ) ) ( not ( = ?auto_604906 ?auto_604913 ) ) ( not ( = ?auto_604907 ?auto_604908 ) ) ( not ( = ?auto_604907 ?auto_604909 ) ) ( not ( = ?auto_604907 ?auto_604910 ) ) ( not ( = ?auto_604907 ?auto_604911 ) ) ( not ( = ?auto_604907 ?auto_604912 ) ) ( not ( = ?auto_604907 ?auto_604913 ) ) ( not ( = ?auto_604908 ?auto_604909 ) ) ( not ( = ?auto_604908 ?auto_604910 ) ) ( not ( = ?auto_604908 ?auto_604911 ) ) ( not ( = ?auto_604908 ?auto_604912 ) ) ( not ( = ?auto_604908 ?auto_604913 ) ) ( not ( = ?auto_604909 ?auto_604910 ) ) ( not ( = ?auto_604909 ?auto_604911 ) ) ( not ( = ?auto_604909 ?auto_604912 ) ) ( not ( = ?auto_604909 ?auto_604913 ) ) ( not ( = ?auto_604910 ?auto_604911 ) ) ( not ( = ?auto_604910 ?auto_604912 ) ) ( not ( = ?auto_604910 ?auto_604913 ) ) ( not ( = ?auto_604911 ?auto_604912 ) ) ( not ( = ?auto_604911 ?auto_604913 ) ) ( not ( = ?auto_604912 ?auto_604913 ) ) ( ON ?auto_604911 ?auto_604912 ) ( ON ?auto_604910 ?auto_604911 ) ( ON ?auto_604909 ?auto_604910 ) ( ON ?auto_604908 ?auto_604909 ) ( ON ?auto_604907 ?auto_604908 ) ( ON ?auto_604906 ?auto_604907 ) ( ON ?auto_604905 ?auto_604906 ) ( ON ?auto_604904 ?auto_604905 ) ( ON ?auto_604903 ?auto_604904 ) ( ON ?auto_604902 ?auto_604903 ) ( CLEAR ?auto_604900 ) ( ON ?auto_604901 ?auto_604902 ) ( CLEAR ?auto_604901 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_604896 ?auto_604897 ?auto_604898 ?auto_604899 ?auto_604900 ?auto_604901 )
      ( MAKE-17PILE ?auto_604896 ?auto_604897 ?auto_604898 ?auto_604899 ?auto_604900 ?auto_604901 ?auto_604902 ?auto_604903 ?auto_604904 ?auto_604905 ?auto_604906 ?auto_604907 ?auto_604908 ?auto_604909 ?auto_604910 ?auto_604911 ?auto_604912 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_604931 - BLOCK
      ?auto_604932 - BLOCK
      ?auto_604933 - BLOCK
      ?auto_604934 - BLOCK
      ?auto_604935 - BLOCK
      ?auto_604936 - BLOCK
      ?auto_604937 - BLOCK
      ?auto_604938 - BLOCK
      ?auto_604939 - BLOCK
      ?auto_604940 - BLOCK
      ?auto_604941 - BLOCK
      ?auto_604942 - BLOCK
      ?auto_604943 - BLOCK
      ?auto_604944 - BLOCK
      ?auto_604945 - BLOCK
      ?auto_604946 - BLOCK
      ?auto_604947 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_604947 ) ( ON-TABLE ?auto_604931 ) ( ON ?auto_604932 ?auto_604931 ) ( ON ?auto_604933 ?auto_604932 ) ( ON ?auto_604934 ?auto_604933 ) ( ON ?auto_604935 ?auto_604934 ) ( not ( = ?auto_604931 ?auto_604932 ) ) ( not ( = ?auto_604931 ?auto_604933 ) ) ( not ( = ?auto_604931 ?auto_604934 ) ) ( not ( = ?auto_604931 ?auto_604935 ) ) ( not ( = ?auto_604931 ?auto_604936 ) ) ( not ( = ?auto_604931 ?auto_604937 ) ) ( not ( = ?auto_604931 ?auto_604938 ) ) ( not ( = ?auto_604931 ?auto_604939 ) ) ( not ( = ?auto_604931 ?auto_604940 ) ) ( not ( = ?auto_604931 ?auto_604941 ) ) ( not ( = ?auto_604931 ?auto_604942 ) ) ( not ( = ?auto_604931 ?auto_604943 ) ) ( not ( = ?auto_604931 ?auto_604944 ) ) ( not ( = ?auto_604931 ?auto_604945 ) ) ( not ( = ?auto_604931 ?auto_604946 ) ) ( not ( = ?auto_604931 ?auto_604947 ) ) ( not ( = ?auto_604932 ?auto_604933 ) ) ( not ( = ?auto_604932 ?auto_604934 ) ) ( not ( = ?auto_604932 ?auto_604935 ) ) ( not ( = ?auto_604932 ?auto_604936 ) ) ( not ( = ?auto_604932 ?auto_604937 ) ) ( not ( = ?auto_604932 ?auto_604938 ) ) ( not ( = ?auto_604932 ?auto_604939 ) ) ( not ( = ?auto_604932 ?auto_604940 ) ) ( not ( = ?auto_604932 ?auto_604941 ) ) ( not ( = ?auto_604932 ?auto_604942 ) ) ( not ( = ?auto_604932 ?auto_604943 ) ) ( not ( = ?auto_604932 ?auto_604944 ) ) ( not ( = ?auto_604932 ?auto_604945 ) ) ( not ( = ?auto_604932 ?auto_604946 ) ) ( not ( = ?auto_604932 ?auto_604947 ) ) ( not ( = ?auto_604933 ?auto_604934 ) ) ( not ( = ?auto_604933 ?auto_604935 ) ) ( not ( = ?auto_604933 ?auto_604936 ) ) ( not ( = ?auto_604933 ?auto_604937 ) ) ( not ( = ?auto_604933 ?auto_604938 ) ) ( not ( = ?auto_604933 ?auto_604939 ) ) ( not ( = ?auto_604933 ?auto_604940 ) ) ( not ( = ?auto_604933 ?auto_604941 ) ) ( not ( = ?auto_604933 ?auto_604942 ) ) ( not ( = ?auto_604933 ?auto_604943 ) ) ( not ( = ?auto_604933 ?auto_604944 ) ) ( not ( = ?auto_604933 ?auto_604945 ) ) ( not ( = ?auto_604933 ?auto_604946 ) ) ( not ( = ?auto_604933 ?auto_604947 ) ) ( not ( = ?auto_604934 ?auto_604935 ) ) ( not ( = ?auto_604934 ?auto_604936 ) ) ( not ( = ?auto_604934 ?auto_604937 ) ) ( not ( = ?auto_604934 ?auto_604938 ) ) ( not ( = ?auto_604934 ?auto_604939 ) ) ( not ( = ?auto_604934 ?auto_604940 ) ) ( not ( = ?auto_604934 ?auto_604941 ) ) ( not ( = ?auto_604934 ?auto_604942 ) ) ( not ( = ?auto_604934 ?auto_604943 ) ) ( not ( = ?auto_604934 ?auto_604944 ) ) ( not ( = ?auto_604934 ?auto_604945 ) ) ( not ( = ?auto_604934 ?auto_604946 ) ) ( not ( = ?auto_604934 ?auto_604947 ) ) ( not ( = ?auto_604935 ?auto_604936 ) ) ( not ( = ?auto_604935 ?auto_604937 ) ) ( not ( = ?auto_604935 ?auto_604938 ) ) ( not ( = ?auto_604935 ?auto_604939 ) ) ( not ( = ?auto_604935 ?auto_604940 ) ) ( not ( = ?auto_604935 ?auto_604941 ) ) ( not ( = ?auto_604935 ?auto_604942 ) ) ( not ( = ?auto_604935 ?auto_604943 ) ) ( not ( = ?auto_604935 ?auto_604944 ) ) ( not ( = ?auto_604935 ?auto_604945 ) ) ( not ( = ?auto_604935 ?auto_604946 ) ) ( not ( = ?auto_604935 ?auto_604947 ) ) ( not ( = ?auto_604936 ?auto_604937 ) ) ( not ( = ?auto_604936 ?auto_604938 ) ) ( not ( = ?auto_604936 ?auto_604939 ) ) ( not ( = ?auto_604936 ?auto_604940 ) ) ( not ( = ?auto_604936 ?auto_604941 ) ) ( not ( = ?auto_604936 ?auto_604942 ) ) ( not ( = ?auto_604936 ?auto_604943 ) ) ( not ( = ?auto_604936 ?auto_604944 ) ) ( not ( = ?auto_604936 ?auto_604945 ) ) ( not ( = ?auto_604936 ?auto_604946 ) ) ( not ( = ?auto_604936 ?auto_604947 ) ) ( not ( = ?auto_604937 ?auto_604938 ) ) ( not ( = ?auto_604937 ?auto_604939 ) ) ( not ( = ?auto_604937 ?auto_604940 ) ) ( not ( = ?auto_604937 ?auto_604941 ) ) ( not ( = ?auto_604937 ?auto_604942 ) ) ( not ( = ?auto_604937 ?auto_604943 ) ) ( not ( = ?auto_604937 ?auto_604944 ) ) ( not ( = ?auto_604937 ?auto_604945 ) ) ( not ( = ?auto_604937 ?auto_604946 ) ) ( not ( = ?auto_604937 ?auto_604947 ) ) ( not ( = ?auto_604938 ?auto_604939 ) ) ( not ( = ?auto_604938 ?auto_604940 ) ) ( not ( = ?auto_604938 ?auto_604941 ) ) ( not ( = ?auto_604938 ?auto_604942 ) ) ( not ( = ?auto_604938 ?auto_604943 ) ) ( not ( = ?auto_604938 ?auto_604944 ) ) ( not ( = ?auto_604938 ?auto_604945 ) ) ( not ( = ?auto_604938 ?auto_604946 ) ) ( not ( = ?auto_604938 ?auto_604947 ) ) ( not ( = ?auto_604939 ?auto_604940 ) ) ( not ( = ?auto_604939 ?auto_604941 ) ) ( not ( = ?auto_604939 ?auto_604942 ) ) ( not ( = ?auto_604939 ?auto_604943 ) ) ( not ( = ?auto_604939 ?auto_604944 ) ) ( not ( = ?auto_604939 ?auto_604945 ) ) ( not ( = ?auto_604939 ?auto_604946 ) ) ( not ( = ?auto_604939 ?auto_604947 ) ) ( not ( = ?auto_604940 ?auto_604941 ) ) ( not ( = ?auto_604940 ?auto_604942 ) ) ( not ( = ?auto_604940 ?auto_604943 ) ) ( not ( = ?auto_604940 ?auto_604944 ) ) ( not ( = ?auto_604940 ?auto_604945 ) ) ( not ( = ?auto_604940 ?auto_604946 ) ) ( not ( = ?auto_604940 ?auto_604947 ) ) ( not ( = ?auto_604941 ?auto_604942 ) ) ( not ( = ?auto_604941 ?auto_604943 ) ) ( not ( = ?auto_604941 ?auto_604944 ) ) ( not ( = ?auto_604941 ?auto_604945 ) ) ( not ( = ?auto_604941 ?auto_604946 ) ) ( not ( = ?auto_604941 ?auto_604947 ) ) ( not ( = ?auto_604942 ?auto_604943 ) ) ( not ( = ?auto_604942 ?auto_604944 ) ) ( not ( = ?auto_604942 ?auto_604945 ) ) ( not ( = ?auto_604942 ?auto_604946 ) ) ( not ( = ?auto_604942 ?auto_604947 ) ) ( not ( = ?auto_604943 ?auto_604944 ) ) ( not ( = ?auto_604943 ?auto_604945 ) ) ( not ( = ?auto_604943 ?auto_604946 ) ) ( not ( = ?auto_604943 ?auto_604947 ) ) ( not ( = ?auto_604944 ?auto_604945 ) ) ( not ( = ?auto_604944 ?auto_604946 ) ) ( not ( = ?auto_604944 ?auto_604947 ) ) ( not ( = ?auto_604945 ?auto_604946 ) ) ( not ( = ?auto_604945 ?auto_604947 ) ) ( not ( = ?auto_604946 ?auto_604947 ) ) ( ON ?auto_604946 ?auto_604947 ) ( ON ?auto_604945 ?auto_604946 ) ( ON ?auto_604944 ?auto_604945 ) ( ON ?auto_604943 ?auto_604944 ) ( ON ?auto_604942 ?auto_604943 ) ( ON ?auto_604941 ?auto_604942 ) ( ON ?auto_604940 ?auto_604941 ) ( ON ?auto_604939 ?auto_604940 ) ( ON ?auto_604938 ?auto_604939 ) ( ON ?auto_604937 ?auto_604938 ) ( CLEAR ?auto_604935 ) ( ON ?auto_604936 ?auto_604937 ) ( CLEAR ?auto_604936 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_604931 ?auto_604932 ?auto_604933 ?auto_604934 ?auto_604935 ?auto_604936 )
      ( MAKE-17PILE ?auto_604931 ?auto_604932 ?auto_604933 ?auto_604934 ?auto_604935 ?auto_604936 ?auto_604937 ?auto_604938 ?auto_604939 ?auto_604940 ?auto_604941 ?auto_604942 ?auto_604943 ?auto_604944 ?auto_604945 ?auto_604946 ?auto_604947 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_604965 - BLOCK
      ?auto_604966 - BLOCK
      ?auto_604967 - BLOCK
      ?auto_604968 - BLOCK
      ?auto_604969 - BLOCK
      ?auto_604970 - BLOCK
      ?auto_604971 - BLOCK
      ?auto_604972 - BLOCK
      ?auto_604973 - BLOCK
      ?auto_604974 - BLOCK
      ?auto_604975 - BLOCK
      ?auto_604976 - BLOCK
      ?auto_604977 - BLOCK
      ?auto_604978 - BLOCK
      ?auto_604979 - BLOCK
      ?auto_604980 - BLOCK
      ?auto_604981 - BLOCK
    )
    :vars
    (
      ?auto_604982 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_604981 ?auto_604982 ) ( ON-TABLE ?auto_604965 ) ( ON ?auto_604966 ?auto_604965 ) ( ON ?auto_604967 ?auto_604966 ) ( ON ?auto_604968 ?auto_604967 ) ( not ( = ?auto_604965 ?auto_604966 ) ) ( not ( = ?auto_604965 ?auto_604967 ) ) ( not ( = ?auto_604965 ?auto_604968 ) ) ( not ( = ?auto_604965 ?auto_604969 ) ) ( not ( = ?auto_604965 ?auto_604970 ) ) ( not ( = ?auto_604965 ?auto_604971 ) ) ( not ( = ?auto_604965 ?auto_604972 ) ) ( not ( = ?auto_604965 ?auto_604973 ) ) ( not ( = ?auto_604965 ?auto_604974 ) ) ( not ( = ?auto_604965 ?auto_604975 ) ) ( not ( = ?auto_604965 ?auto_604976 ) ) ( not ( = ?auto_604965 ?auto_604977 ) ) ( not ( = ?auto_604965 ?auto_604978 ) ) ( not ( = ?auto_604965 ?auto_604979 ) ) ( not ( = ?auto_604965 ?auto_604980 ) ) ( not ( = ?auto_604965 ?auto_604981 ) ) ( not ( = ?auto_604965 ?auto_604982 ) ) ( not ( = ?auto_604966 ?auto_604967 ) ) ( not ( = ?auto_604966 ?auto_604968 ) ) ( not ( = ?auto_604966 ?auto_604969 ) ) ( not ( = ?auto_604966 ?auto_604970 ) ) ( not ( = ?auto_604966 ?auto_604971 ) ) ( not ( = ?auto_604966 ?auto_604972 ) ) ( not ( = ?auto_604966 ?auto_604973 ) ) ( not ( = ?auto_604966 ?auto_604974 ) ) ( not ( = ?auto_604966 ?auto_604975 ) ) ( not ( = ?auto_604966 ?auto_604976 ) ) ( not ( = ?auto_604966 ?auto_604977 ) ) ( not ( = ?auto_604966 ?auto_604978 ) ) ( not ( = ?auto_604966 ?auto_604979 ) ) ( not ( = ?auto_604966 ?auto_604980 ) ) ( not ( = ?auto_604966 ?auto_604981 ) ) ( not ( = ?auto_604966 ?auto_604982 ) ) ( not ( = ?auto_604967 ?auto_604968 ) ) ( not ( = ?auto_604967 ?auto_604969 ) ) ( not ( = ?auto_604967 ?auto_604970 ) ) ( not ( = ?auto_604967 ?auto_604971 ) ) ( not ( = ?auto_604967 ?auto_604972 ) ) ( not ( = ?auto_604967 ?auto_604973 ) ) ( not ( = ?auto_604967 ?auto_604974 ) ) ( not ( = ?auto_604967 ?auto_604975 ) ) ( not ( = ?auto_604967 ?auto_604976 ) ) ( not ( = ?auto_604967 ?auto_604977 ) ) ( not ( = ?auto_604967 ?auto_604978 ) ) ( not ( = ?auto_604967 ?auto_604979 ) ) ( not ( = ?auto_604967 ?auto_604980 ) ) ( not ( = ?auto_604967 ?auto_604981 ) ) ( not ( = ?auto_604967 ?auto_604982 ) ) ( not ( = ?auto_604968 ?auto_604969 ) ) ( not ( = ?auto_604968 ?auto_604970 ) ) ( not ( = ?auto_604968 ?auto_604971 ) ) ( not ( = ?auto_604968 ?auto_604972 ) ) ( not ( = ?auto_604968 ?auto_604973 ) ) ( not ( = ?auto_604968 ?auto_604974 ) ) ( not ( = ?auto_604968 ?auto_604975 ) ) ( not ( = ?auto_604968 ?auto_604976 ) ) ( not ( = ?auto_604968 ?auto_604977 ) ) ( not ( = ?auto_604968 ?auto_604978 ) ) ( not ( = ?auto_604968 ?auto_604979 ) ) ( not ( = ?auto_604968 ?auto_604980 ) ) ( not ( = ?auto_604968 ?auto_604981 ) ) ( not ( = ?auto_604968 ?auto_604982 ) ) ( not ( = ?auto_604969 ?auto_604970 ) ) ( not ( = ?auto_604969 ?auto_604971 ) ) ( not ( = ?auto_604969 ?auto_604972 ) ) ( not ( = ?auto_604969 ?auto_604973 ) ) ( not ( = ?auto_604969 ?auto_604974 ) ) ( not ( = ?auto_604969 ?auto_604975 ) ) ( not ( = ?auto_604969 ?auto_604976 ) ) ( not ( = ?auto_604969 ?auto_604977 ) ) ( not ( = ?auto_604969 ?auto_604978 ) ) ( not ( = ?auto_604969 ?auto_604979 ) ) ( not ( = ?auto_604969 ?auto_604980 ) ) ( not ( = ?auto_604969 ?auto_604981 ) ) ( not ( = ?auto_604969 ?auto_604982 ) ) ( not ( = ?auto_604970 ?auto_604971 ) ) ( not ( = ?auto_604970 ?auto_604972 ) ) ( not ( = ?auto_604970 ?auto_604973 ) ) ( not ( = ?auto_604970 ?auto_604974 ) ) ( not ( = ?auto_604970 ?auto_604975 ) ) ( not ( = ?auto_604970 ?auto_604976 ) ) ( not ( = ?auto_604970 ?auto_604977 ) ) ( not ( = ?auto_604970 ?auto_604978 ) ) ( not ( = ?auto_604970 ?auto_604979 ) ) ( not ( = ?auto_604970 ?auto_604980 ) ) ( not ( = ?auto_604970 ?auto_604981 ) ) ( not ( = ?auto_604970 ?auto_604982 ) ) ( not ( = ?auto_604971 ?auto_604972 ) ) ( not ( = ?auto_604971 ?auto_604973 ) ) ( not ( = ?auto_604971 ?auto_604974 ) ) ( not ( = ?auto_604971 ?auto_604975 ) ) ( not ( = ?auto_604971 ?auto_604976 ) ) ( not ( = ?auto_604971 ?auto_604977 ) ) ( not ( = ?auto_604971 ?auto_604978 ) ) ( not ( = ?auto_604971 ?auto_604979 ) ) ( not ( = ?auto_604971 ?auto_604980 ) ) ( not ( = ?auto_604971 ?auto_604981 ) ) ( not ( = ?auto_604971 ?auto_604982 ) ) ( not ( = ?auto_604972 ?auto_604973 ) ) ( not ( = ?auto_604972 ?auto_604974 ) ) ( not ( = ?auto_604972 ?auto_604975 ) ) ( not ( = ?auto_604972 ?auto_604976 ) ) ( not ( = ?auto_604972 ?auto_604977 ) ) ( not ( = ?auto_604972 ?auto_604978 ) ) ( not ( = ?auto_604972 ?auto_604979 ) ) ( not ( = ?auto_604972 ?auto_604980 ) ) ( not ( = ?auto_604972 ?auto_604981 ) ) ( not ( = ?auto_604972 ?auto_604982 ) ) ( not ( = ?auto_604973 ?auto_604974 ) ) ( not ( = ?auto_604973 ?auto_604975 ) ) ( not ( = ?auto_604973 ?auto_604976 ) ) ( not ( = ?auto_604973 ?auto_604977 ) ) ( not ( = ?auto_604973 ?auto_604978 ) ) ( not ( = ?auto_604973 ?auto_604979 ) ) ( not ( = ?auto_604973 ?auto_604980 ) ) ( not ( = ?auto_604973 ?auto_604981 ) ) ( not ( = ?auto_604973 ?auto_604982 ) ) ( not ( = ?auto_604974 ?auto_604975 ) ) ( not ( = ?auto_604974 ?auto_604976 ) ) ( not ( = ?auto_604974 ?auto_604977 ) ) ( not ( = ?auto_604974 ?auto_604978 ) ) ( not ( = ?auto_604974 ?auto_604979 ) ) ( not ( = ?auto_604974 ?auto_604980 ) ) ( not ( = ?auto_604974 ?auto_604981 ) ) ( not ( = ?auto_604974 ?auto_604982 ) ) ( not ( = ?auto_604975 ?auto_604976 ) ) ( not ( = ?auto_604975 ?auto_604977 ) ) ( not ( = ?auto_604975 ?auto_604978 ) ) ( not ( = ?auto_604975 ?auto_604979 ) ) ( not ( = ?auto_604975 ?auto_604980 ) ) ( not ( = ?auto_604975 ?auto_604981 ) ) ( not ( = ?auto_604975 ?auto_604982 ) ) ( not ( = ?auto_604976 ?auto_604977 ) ) ( not ( = ?auto_604976 ?auto_604978 ) ) ( not ( = ?auto_604976 ?auto_604979 ) ) ( not ( = ?auto_604976 ?auto_604980 ) ) ( not ( = ?auto_604976 ?auto_604981 ) ) ( not ( = ?auto_604976 ?auto_604982 ) ) ( not ( = ?auto_604977 ?auto_604978 ) ) ( not ( = ?auto_604977 ?auto_604979 ) ) ( not ( = ?auto_604977 ?auto_604980 ) ) ( not ( = ?auto_604977 ?auto_604981 ) ) ( not ( = ?auto_604977 ?auto_604982 ) ) ( not ( = ?auto_604978 ?auto_604979 ) ) ( not ( = ?auto_604978 ?auto_604980 ) ) ( not ( = ?auto_604978 ?auto_604981 ) ) ( not ( = ?auto_604978 ?auto_604982 ) ) ( not ( = ?auto_604979 ?auto_604980 ) ) ( not ( = ?auto_604979 ?auto_604981 ) ) ( not ( = ?auto_604979 ?auto_604982 ) ) ( not ( = ?auto_604980 ?auto_604981 ) ) ( not ( = ?auto_604980 ?auto_604982 ) ) ( not ( = ?auto_604981 ?auto_604982 ) ) ( ON ?auto_604980 ?auto_604981 ) ( ON ?auto_604979 ?auto_604980 ) ( ON ?auto_604978 ?auto_604979 ) ( ON ?auto_604977 ?auto_604978 ) ( ON ?auto_604976 ?auto_604977 ) ( ON ?auto_604975 ?auto_604976 ) ( ON ?auto_604974 ?auto_604975 ) ( ON ?auto_604973 ?auto_604974 ) ( ON ?auto_604972 ?auto_604973 ) ( ON ?auto_604971 ?auto_604972 ) ( ON ?auto_604970 ?auto_604971 ) ( CLEAR ?auto_604968 ) ( ON ?auto_604969 ?auto_604970 ) ( CLEAR ?auto_604969 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_604965 ?auto_604966 ?auto_604967 ?auto_604968 ?auto_604969 )
      ( MAKE-17PILE ?auto_604965 ?auto_604966 ?auto_604967 ?auto_604968 ?auto_604969 ?auto_604970 ?auto_604971 ?auto_604972 ?auto_604973 ?auto_604974 ?auto_604975 ?auto_604976 ?auto_604977 ?auto_604978 ?auto_604979 ?auto_604980 ?auto_604981 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_605000 - BLOCK
      ?auto_605001 - BLOCK
      ?auto_605002 - BLOCK
      ?auto_605003 - BLOCK
      ?auto_605004 - BLOCK
      ?auto_605005 - BLOCK
      ?auto_605006 - BLOCK
      ?auto_605007 - BLOCK
      ?auto_605008 - BLOCK
      ?auto_605009 - BLOCK
      ?auto_605010 - BLOCK
      ?auto_605011 - BLOCK
      ?auto_605012 - BLOCK
      ?auto_605013 - BLOCK
      ?auto_605014 - BLOCK
      ?auto_605015 - BLOCK
      ?auto_605016 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_605016 ) ( ON-TABLE ?auto_605000 ) ( ON ?auto_605001 ?auto_605000 ) ( ON ?auto_605002 ?auto_605001 ) ( ON ?auto_605003 ?auto_605002 ) ( not ( = ?auto_605000 ?auto_605001 ) ) ( not ( = ?auto_605000 ?auto_605002 ) ) ( not ( = ?auto_605000 ?auto_605003 ) ) ( not ( = ?auto_605000 ?auto_605004 ) ) ( not ( = ?auto_605000 ?auto_605005 ) ) ( not ( = ?auto_605000 ?auto_605006 ) ) ( not ( = ?auto_605000 ?auto_605007 ) ) ( not ( = ?auto_605000 ?auto_605008 ) ) ( not ( = ?auto_605000 ?auto_605009 ) ) ( not ( = ?auto_605000 ?auto_605010 ) ) ( not ( = ?auto_605000 ?auto_605011 ) ) ( not ( = ?auto_605000 ?auto_605012 ) ) ( not ( = ?auto_605000 ?auto_605013 ) ) ( not ( = ?auto_605000 ?auto_605014 ) ) ( not ( = ?auto_605000 ?auto_605015 ) ) ( not ( = ?auto_605000 ?auto_605016 ) ) ( not ( = ?auto_605001 ?auto_605002 ) ) ( not ( = ?auto_605001 ?auto_605003 ) ) ( not ( = ?auto_605001 ?auto_605004 ) ) ( not ( = ?auto_605001 ?auto_605005 ) ) ( not ( = ?auto_605001 ?auto_605006 ) ) ( not ( = ?auto_605001 ?auto_605007 ) ) ( not ( = ?auto_605001 ?auto_605008 ) ) ( not ( = ?auto_605001 ?auto_605009 ) ) ( not ( = ?auto_605001 ?auto_605010 ) ) ( not ( = ?auto_605001 ?auto_605011 ) ) ( not ( = ?auto_605001 ?auto_605012 ) ) ( not ( = ?auto_605001 ?auto_605013 ) ) ( not ( = ?auto_605001 ?auto_605014 ) ) ( not ( = ?auto_605001 ?auto_605015 ) ) ( not ( = ?auto_605001 ?auto_605016 ) ) ( not ( = ?auto_605002 ?auto_605003 ) ) ( not ( = ?auto_605002 ?auto_605004 ) ) ( not ( = ?auto_605002 ?auto_605005 ) ) ( not ( = ?auto_605002 ?auto_605006 ) ) ( not ( = ?auto_605002 ?auto_605007 ) ) ( not ( = ?auto_605002 ?auto_605008 ) ) ( not ( = ?auto_605002 ?auto_605009 ) ) ( not ( = ?auto_605002 ?auto_605010 ) ) ( not ( = ?auto_605002 ?auto_605011 ) ) ( not ( = ?auto_605002 ?auto_605012 ) ) ( not ( = ?auto_605002 ?auto_605013 ) ) ( not ( = ?auto_605002 ?auto_605014 ) ) ( not ( = ?auto_605002 ?auto_605015 ) ) ( not ( = ?auto_605002 ?auto_605016 ) ) ( not ( = ?auto_605003 ?auto_605004 ) ) ( not ( = ?auto_605003 ?auto_605005 ) ) ( not ( = ?auto_605003 ?auto_605006 ) ) ( not ( = ?auto_605003 ?auto_605007 ) ) ( not ( = ?auto_605003 ?auto_605008 ) ) ( not ( = ?auto_605003 ?auto_605009 ) ) ( not ( = ?auto_605003 ?auto_605010 ) ) ( not ( = ?auto_605003 ?auto_605011 ) ) ( not ( = ?auto_605003 ?auto_605012 ) ) ( not ( = ?auto_605003 ?auto_605013 ) ) ( not ( = ?auto_605003 ?auto_605014 ) ) ( not ( = ?auto_605003 ?auto_605015 ) ) ( not ( = ?auto_605003 ?auto_605016 ) ) ( not ( = ?auto_605004 ?auto_605005 ) ) ( not ( = ?auto_605004 ?auto_605006 ) ) ( not ( = ?auto_605004 ?auto_605007 ) ) ( not ( = ?auto_605004 ?auto_605008 ) ) ( not ( = ?auto_605004 ?auto_605009 ) ) ( not ( = ?auto_605004 ?auto_605010 ) ) ( not ( = ?auto_605004 ?auto_605011 ) ) ( not ( = ?auto_605004 ?auto_605012 ) ) ( not ( = ?auto_605004 ?auto_605013 ) ) ( not ( = ?auto_605004 ?auto_605014 ) ) ( not ( = ?auto_605004 ?auto_605015 ) ) ( not ( = ?auto_605004 ?auto_605016 ) ) ( not ( = ?auto_605005 ?auto_605006 ) ) ( not ( = ?auto_605005 ?auto_605007 ) ) ( not ( = ?auto_605005 ?auto_605008 ) ) ( not ( = ?auto_605005 ?auto_605009 ) ) ( not ( = ?auto_605005 ?auto_605010 ) ) ( not ( = ?auto_605005 ?auto_605011 ) ) ( not ( = ?auto_605005 ?auto_605012 ) ) ( not ( = ?auto_605005 ?auto_605013 ) ) ( not ( = ?auto_605005 ?auto_605014 ) ) ( not ( = ?auto_605005 ?auto_605015 ) ) ( not ( = ?auto_605005 ?auto_605016 ) ) ( not ( = ?auto_605006 ?auto_605007 ) ) ( not ( = ?auto_605006 ?auto_605008 ) ) ( not ( = ?auto_605006 ?auto_605009 ) ) ( not ( = ?auto_605006 ?auto_605010 ) ) ( not ( = ?auto_605006 ?auto_605011 ) ) ( not ( = ?auto_605006 ?auto_605012 ) ) ( not ( = ?auto_605006 ?auto_605013 ) ) ( not ( = ?auto_605006 ?auto_605014 ) ) ( not ( = ?auto_605006 ?auto_605015 ) ) ( not ( = ?auto_605006 ?auto_605016 ) ) ( not ( = ?auto_605007 ?auto_605008 ) ) ( not ( = ?auto_605007 ?auto_605009 ) ) ( not ( = ?auto_605007 ?auto_605010 ) ) ( not ( = ?auto_605007 ?auto_605011 ) ) ( not ( = ?auto_605007 ?auto_605012 ) ) ( not ( = ?auto_605007 ?auto_605013 ) ) ( not ( = ?auto_605007 ?auto_605014 ) ) ( not ( = ?auto_605007 ?auto_605015 ) ) ( not ( = ?auto_605007 ?auto_605016 ) ) ( not ( = ?auto_605008 ?auto_605009 ) ) ( not ( = ?auto_605008 ?auto_605010 ) ) ( not ( = ?auto_605008 ?auto_605011 ) ) ( not ( = ?auto_605008 ?auto_605012 ) ) ( not ( = ?auto_605008 ?auto_605013 ) ) ( not ( = ?auto_605008 ?auto_605014 ) ) ( not ( = ?auto_605008 ?auto_605015 ) ) ( not ( = ?auto_605008 ?auto_605016 ) ) ( not ( = ?auto_605009 ?auto_605010 ) ) ( not ( = ?auto_605009 ?auto_605011 ) ) ( not ( = ?auto_605009 ?auto_605012 ) ) ( not ( = ?auto_605009 ?auto_605013 ) ) ( not ( = ?auto_605009 ?auto_605014 ) ) ( not ( = ?auto_605009 ?auto_605015 ) ) ( not ( = ?auto_605009 ?auto_605016 ) ) ( not ( = ?auto_605010 ?auto_605011 ) ) ( not ( = ?auto_605010 ?auto_605012 ) ) ( not ( = ?auto_605010 ?auto_605013 ) ) ( not ( = ?auto_605010 ?auto_605014 ) ) ( not ( = ?auto_605010 ?auto_605015 ) ) ( not ( = ?auto_605010 ?auto_605016 ) ) ( not ( = ?auto_605011 ?auto_605012 ) ) ( not ( = ?auto_605011 ?auto_605013 ) ) ( not ( = ?auto_605011 ?auto_605014 ) ) ( not ( = ?auto_605011 ?auto_605015 ) ) ( not ( = ?auto_605011 ?auto_605016 ) ) ( not ( = ?auto_605012 ?auto_605013 ) ) ( not ( = ?auto_605012 ?auto_605014 ) ) ( not ( = ?auto_605012 ?auto_605015 ) ) ( not ( = ?auto_605012 ?auto_605016 ) ) ( not ( = ?auto_605013 ?auto_605014 ) ) ( not ( = ?auto_605013 ?auto_605015 ) ) ( not ( = ?auto_605013 ?auto_605016 ) ) ( not ( = ?auto_605014 ?auto_605015 ) ) ( not ( = ?auto_605014 ?auto_605016 ) ) ( not ( = ?auto_605015 ?auto_605016 ) ) ( ON ?auto_605015 ?auto_605016 ) ( ON ?auto_605014 ?auto_605015 ) ( ON ?auto_605013 ?auto_605014 ) ( ON ?auto_605012 ?auto_605013 ) ( ON ?auto_605011 ?auto_605012 ) ( ON ?auto_605010 ?auto_605011 ) ( ON ?auto_605009 ?auto_605010 ) ( ON ?auto_605008 ?auto_605009 ) ( ON ?auto_605007 ?auto_605008 ) ( ON ?auto_605006 ?auto_605007 ) ( ON ?auto_605005 ?auto_605006 ) ( CLEAR ?auto_605003 ) ( ON ?auto_605004 ?auto_605005 ) ( CLEAR ?auto_605004 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_605000 ?auto_605001 ?auto_605002 ?auto_605003 ?auto_605004 )
      ( MAKE-17PILE ?auto_605000 ?auto_605001 ?auto_605002 ?auto_605003 ?auto_605004 ?auto_605005 ?auto_605006 ?auto_605007 ?auto_605008 ?auto_605009 ?auto_605010 ?auto_605011 ?auto_605012 ?auto_605013 ?auto_605014 ?auto_605015 ?auto_605016 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_605034 - BLOCK
      ?auto_605035 - BLOCK
      ?auto_605036 - BLOCK
      ?auto_605037 - BLOCK
      ?auto_605038 - BLOCK
      ?auto_605039 - BLOCK
      ?auto_605040 - BLOCK
      ?auto_605041 - BLOCK
      ?auto_605042 - BLOCK
      ?auto_605043 - BLOCK
      ?auto_605044 - BLOCK
      ?auto_605045 - BLOCK
      ?auto_605046 - BLOCK
      ?auto_605047 - BLOCK
      ?auto_605048 - BLOCK
      ?auto_605049 - BLOCK
      ?auto_605050 - BLOCK
    )
    :vars
    (
      ?auto_605051 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_605050 ?auto_605051 ) ( ON-TABLE ?auto_605034 ) ( ON ?auto_605035 ?auto_605034 ) ( ON ?auto_605036 ?auto_605035 ) ( not ( = ?auto_605034 ?auto_605035 ) ) ( not ( = ?auto_605034 ?auto_605036 ) ) ( not ( = ?auto_605034 ?auto_605037 ) ) ( not ( = ?auto_605034 ?auto_605038 ) ) ( not ( = ?auto_605034 ?auto_605039 ) ) ( not ( = ?auto_605034 ?auto_605040 ) ) ( not ( = ?auto_605034 ?auto_605041 ) ) ( not ( = ?auto_605034 ?auto_605042 ) ) ( not ( = ?auto_605034 ?auto_605043 ) ) ( not ( = ?auto_605034 ?auto_605044 ) ) ( not ( = ?auto_605034 ?auto_605045 ) ) ( not ( = ?auto_605034 ?auto_605046 ) ) ( not ( = ?auto_605034 ?auto_605047 ) ) ( not ( = ?auto_605034 ?auto_605048 ) ) ( not ( = ?auto_605034 ?auto_605049 ) ) ( not ( = ?auto_605034 ?auto_605050 ) ) ( not ( = ?auto_605034 ?auto_605051 ) ) ( not ( = ?auto_605035 ?auto_605036 ) ) ( not ( = ?auto_605035 ?auto_605037 ) ) ( not ( = ?auto_605035 ?auto_605038 ) ) ( not ( = ?auto_605035 ?auto_605039 ) ) ( not ( = ?auto_605035 ?auto_605040 ) ) ( not ( = ?auto_605035 ?auto_605041 ) ) ( not ( = ?auto_605035 ?auto_605042 ) ) ( not ( = ?auto_605035 ?auto_605043 ) ) ( not ( = ?auto_605035 ?auto_605044 ) ) ( not ( = ?auto_605035 ?auto_605045 ) ) ( not ( = ?auto_605035 ?auto_605046 ) ) ( not ( = ?auto_605035 ?auto_605047 ) ) ( not ( = ?auto_605035 ?auto_605048 ) ) ( not ( = ?auto_605035 ?auto_605049 ) ) ( not ( = ?auto_605035 ?auto_605050 ) ) ( not ( = ?auto_605035 ?auto_605051 ) ) ( not ( = ?auto_605036 ?auto_605037 ) ) ( not ( = ?auto_605036 ?auto_605038 ) ) ( not ( = ?auto_605036 ?auto_605039 ) ) ( not ( = ?auto_605036 ?auto_605040 ) ) ( not ( = ?auto_605036 ?auto_605041 ) ) ( not ( = ?auto_605036 ?auto_605042 ) ) ( not ( = ?auto_605036 ?auto_605043 ) ) ( not ( = ?auto_605036 ?auto_605044 ) ) ( not ( = ?auto_605036 ?auto_605045 ) ) ( not ( = ?auto_605036 ?auto_605046 ) ) ( not ( = ?auto_605036 ?auto_605047 ) ) ( not ( = ?auto_605036 ?auto_605048 ) ) ( not ( = ?auto_605036 ?auto_605049 ) ) ( not ( = ?auto_605036 ?auto_605050 ) ) ( not ( = ?auto_605036 ?auto_605051 ) ) ( not ( = ?auto_605037 ?auto_605038 ) ) ( not ( = ?auto_605037 ?auto_605039 ) ) ( not ( = ?auto_605037 ?auto_605040 ) ) ( not ( = ?auto_605037 ?auto_605041 ) ) ( not ( = ?auto_605037 ?auto_605042 ) ) ( not ( = ?auto_605037 ?auto_605043 ) ) ( not ( = ?auto_605037 ?auto_605044 ) ) ( not ( = ?auto_605037 ?auto_605045 ) ) ( not ( = ?auto_605037 ?auto_605046 ) ) ( not ( = ?auto_605037 ?auto_605047 ) ) ( not ( = ?auto_605037 ?auto_605048 ) ) ( not ( = ?auto_605037 ?auto_605049 ) ) ( not ( = ?auto_605037 ?auto_605050 ) ) ( not ( = ?auto_605037 ?auto_605051 ) ) ( not ( = ?auto_605038 ?auto_605039 ) ) ( not ( = ?auto_605038 ?auto_605040 ) ) ( not ( = ?auto_605038 ?auto_605041 ) ) ( not ( = ?auto_605038 ?auto_605042 ) ) ( not ( = ?auto_605038 ?auto_605043 ) ) ( not ( = ?auto_605038 ?auto_605044 ) ) ( not ( = ?auto_605038 ?auto_605045 ) ) ( not ( = ?auto_605038 ?auto_605046 ) ) ( not ( = ?auto_605038 ?auto_605047 ) ) ( not ( = ?auto_605038 ?auto_605048 ) ) ( not ( = ?auto_605038 ?auto_605049 ) ) ( not ( = ?auto_605038 ?auto_605050 ) ) ( not ( = ?auto_605038 ?auto_605051 ) ) ( not ( = ?auto_605039 ?auto_605040 ) ) ( not ( = ?auto_605039 ?auto_605041 ) ) ( not ( = ?auto_605039 ?auto_605042 ) ) ( not ( = ?auto_605039 ?auto_605043 ) ) ( not ( = ?auto_605039 ?auto_605044 ) ) ( not ( = ?auto_605039 ?auto_605045 ) ) ( not ( = ?auto_605039 ?auto_605046 ) ) ( not ( = ?auto_605039 ?auto_605047 ) ) ( not ( = ?auto_605039 ?auto_605048 ) ) ( not ( = ?auto_605039 ?auto_605049 ) ) ( not ( = ?auto_605039 ?auto_605050 ) ) ( not ( = ?auto_605039 ?auto_605051 ) ) ( not ( = ?auto_605040 ?auto_605041 ) ) ( not ( = ?auto_605040 ?auto_605042 ) ) ( not ( = ?auto_605040 ?auto_605043 ) ) ( not ( = ?auto_605040 ?auto_605044 ) ) ( not ( = ?auto_605040 ?auto_605045 ) ) ( not ( = ?auto_605040 ?auto_605046 ) ) ( not ( = ?auto_605040 ?auto_605047 ) ) ( not ( = ?auto_605040 ?auto_605048 ) ) ( not ( = ?auto_605040 ?auto_605049 ) ) ( not ( = ?auto_605040 ?auto_605050 ) ) ( not ( = ?auto_605040 ?auto_605051 ) ) ( not ( = ?auto_605041 ?auto_605042 ) ) ( not ( = ?auto_605041 ?auto_605043 ) ) ( not ( = ?auto_605041 ?auto_605044 ) ) ( not ( = ?auto_605041 ?auto_605045 ) ) ( not ( = ?auto_605041 ?auto_605046 ) ) ( not ( = ?auto_605041 ?auto_605047 ) ) ( not ( = ?auto_605041 ?auto_605048 ) ) ( not ( = ?auto_605041 ?auto_605049 ) ) ( not ( = ?auto_605041 ?auto_605050 ) ) ( not ( = ?auto_605041 ?auto_605051 ) ) ( not ( = ?auto_605042 ?auto_605043 ) ) ( not ( = ?auto_605042 ?auto_605044 ) ) ( not ( = ?auto_605042 ?auto_605045 ) ) ( not ( = ?auto_605042 ?auto_605046 ) ) ( not ( = ?auto_605042 ?auto_605047 ) ) ( not ( = ?auto_605042 ?auto_605048 ) ) ( not ( = ?auto_605042 ?auto_605049 ) ) ( not ( = ?auto_605042 ?auto_605050 ) ) ( not ( = ?auto_605042 ?auto_605051 ) ) ( not ( = ?auto_605043 ?auto_605044 ) ) ( not ( = ?auto_605043 ?auto_605045 ) ) ( not ( = ?auto_605043 ?auto_605046 ) ) ( not ( = ?auto_605043 ?auto_605047 ) ) ( not ( = ?auto_605043 ?auto_605048 ) ) ( not ( = ?auto_605043 ?auto_605049 ) ) ( not ( = ?auto_605043 ?auto_605050 ) ) ( not ( = ?auto_605043 ?auto_605051 ) ) ( not ( = ?auto_605044 ?auto_605045 ) ) ( not ( = ?auto_605044 ?auto_605046 ) ) ( not ( = ?auto_605044 ?auto_605047 ) ) ( not ( = ?auto_605044 ?auto_605048 ) ) ( not ( = ?auto_605044 ?auto_605049 ) ) ( not ( = ?auto_605044 ?auto_605050 ) ) ( not ( = ?auto_605044 ?auto_605051 ) ) ( not ( = ?auto_605045 ?auto_605046 ) ) ( not ( = ?auto_605045 ?auto_605047 ) ) ( not ( = ?auto_605045 ?auto_605048 ) ) ( not ( = ?auto_605045 ?auto_605049 ) ) ( not ( = ?auto_605045 ?auto_605050 ) ) ( not ( = ?auto_605045 ?auto_605051 ) ) ( not ( = ?auto_605046 ?auto_605047 ) ) ( not ( = ?auto_605046 ?auto_605048 ) ) ( not ( = ?auto_605046 ?auto_605049 ) ) ( not ( = ?auto_605046 ?auto_605050 ) ) ( not ( = ?auto_605046 ?auto_605051 ) ) ( not ( = ?auto_605047 ?auto_605048 ) ) ( not ( = ?auto_605047 ?auto_605049 ) ) ( not ( = ?auto_605047 ?auto_605050 ) ) ( not ( = ?auto_605047 ?auto_605051 ) ) ( not ( = ?auto_605048 ?auto_605049 ) ) ( not ( = ?auto_605048 ?auto_605050 ) ) ( not ( = ?auto_605048 ?auto_605051 ) ) ( not ( = ?auto_605049 ?auto_605050 ) ) ( not ( = ?auto_605049 ?auto_605051 ) ) ( not ( = ?auto_605050 ?auto_605051 ) ) ( ON ?auto_605049 ?auto_605050 ) ( ON ?auto_605048 ?auto_605049 ) ( ON ?auto_605047 ?auto_605048 ) ( ON ?auto_605046 ?auto_605047 ) ( ON ?auto_605045 ?auto_605046 ) ( ON ?auto_605044 ?auto_605045 ) ( ON ?auto_605043 ?auto_605044 ) ( ON ?auto_605042 ?auto_605043 ) ( ON ?auto_605041 ?auto_605042 ) ( ON ?auto_605040 ?auto_605041 ) ( ON ?auto_605039 ?auto_605040 ) ( ON ?auto_605038 ?auto_605039 ) ( CLEAR ?auto_605036 ) ( ON ?auto_605037 ?auto_605038 ) ( CLEAR ?auto_605037 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_605034 ?auto_605035 ?auto_605036 ?auto_605037 )
      ( MAKE-17PILE ?auto_605034 ?auto_605035 ?auto_605036 ?auto_605037 ?auto_605038 ?auto_605039 ?auto_605040 ?auto_605041 ?auto_605042 ?auto_605043 ?auto_605044 ?auto_605045 ?auto_605046 ?auto_605047 ?auto_605048 ?auto_605049 ?auto_605050 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_605069 - BLOCK
      ?auto_605070 - BLOCK
      ?auto_605071 - BLOCK
      ?auto_605072 - BLOCK
      ?auto_605073 - BLOCK
      ?auto_605074 - BLOCK
      ?auto_605075 - BLOCK
      ?auto_605076 - BLOCK
      ?auto_605077 - BLOCK
      ?auto_605078 - BLOCK
      ?auto_605079 - BLOCK
      ?auto_605080 - BLOCK
      ?auto_605081 - BLOCK
      ?auto_605082 - BLOCK
      ?auto_605083 - BLOCK
      ?auto_605084 - BLOCK
      ?auto_605085 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_605085 ) ( ON-TABLE ?auto_605069 ) ( ON ?auto_605070 ?auto_605069 ) ( ON ?auto_605071 ?auto_605070 ) ( not ( = ?auto_605069 ?auto_605070 ) ) ( not ( = ?auto_605069 ?auto_605071 ) ) ( not ( = ?auto_605069 ?auto_605072 ) ) ( not ( = ?auto_605069 ?auto_605073 ) ) ( not ( = ?auto_605069 ?auto_605074 ) ) ( not ( = ?auto_605069 ?auto_605075 ) ) ( not ( = ?auto_605069 ?auto_605076 ) ) ( not ( = ?auto_605069 ?auto_605077 ) ) ( not ( = ?auto_605069 ?auto_605078 ) ) ( not ( = ?auto_605069 ?auto_605079 ) ) ( not ( = ?auto_605069 ?auto_605080 ) ) ( not ( = ?auto_605069 ?auto_605081 ) ) ( not ( = ?auto_605069 ?auto_605082 ) ) ( not ( = ?auto_605069 ?auto_605083 ) ) ( not ( = ?auto_605069 ?auto_605084 ) ) ( not ( = ?auto_605069 ?auto_605085 ) ) ( not ( = ?auto_605070 ?auto_605071 ) ) ( not ( = ?auto_605070 ?auto_605072 ) ) ( not ( = ?auto_605070 ?auto_605073 ) ) ( not ( = ?auto_605070 ?auto_605074 ) ) ( not ( = ?auto_605070 ?auto_605075 ) ) ( not ( = ?auto_605070 ?auto_605076 ) ) ( not ( = ?auto_605070 ?auto_605077 ) ) ( not ( = ?auto_605070 ?auto_605078 ) ) ( not ( = ?auto_605070 ?auto_605079 ) ) ( not ( = ?auto_605070 ?auto_605080 ) ) ( not ( = ?auto_605070 ?auto_605081 ) ) ( not ( = ?auto_605070 ?auto_605082 ) ) ( not ( = ?auto_605070 ?auto_605083 ) ) ( not ( = ?auto_605070 ?auto_605084 ) ) ( not ( = ?auto_605070 ?auto_605085 ) ) ( not ( = ?auto_605071 ?auto_605072 ) ) ( not ( = ?auto_605071 ?auto_605073 ) ) ( not ( = ?auto_605071 ?auto_605074 ) ) ( not ( = ?auto_605071 ?auto_605075 ) ) ( not ( = ?auto_605071 ?auto_605076 ) ) ( not ( = ?auto_605071 ?auto_605077 ) ) ( not ( = ?auto_605071 ?auto_605078 ) ) ( not ( = ?auto_605071 ?auto_605079 ) ) ( not ( = ?auto_605071 ?auto_605080 ) ) ( not ( = ?auto_605071 ?auto_605081 ) ) ( not ( = ?auto_605071 ?auto_605082 ) ) ( not ( = ?auto_605071 ?auto_605083 ) ) ( not ( = ?auto_605071 ?auto_605084 ) ) ( not ( = ?auto_605071 ?auto_605085 ) ) ( not ( = ?auto_605072 ?auto_605073 ) ) ( not ( = ?auto_605072 ?auto_605074 ) ) ( not ( = ?auto_605072 ?auto_605075 ) ) ( not ( = ?auto_605072 ?auto_605076 ) ) ( not ( = ?auto_605072 ?auto_605077 ) ) ( not ( = ?auto_605072 ?auto_605078 ) ) ( not ( = ?auto_605072 ?auto_605079 ) ) ( not ( = ?auto_605072 ?auto_605080 ) ) ( not ( = ?auto_605072 ?auto_605081 ) ) ( not ( = ?auto_605072 ?auto_605082 ) ) ( not ( = ?auto_605072 ?auto_605083 ) ) ( not ( = ?auto_605072 ?auto_605084 ) ) ( not ( = ?auto_605072 ?auto_605085 ) ) ( not ( = ?auto_605073 ?auto_605074 ) ) ( not ( = ?auto_605073 ?auto_605075 ) ) ( not ( = ?auto_605073 ?auto_605076 ) ) ( not ( = ?auto_605073 ?auto_605077 ) ) ( not ( = ?auto_605073 ?auto_605078 ) ) ( not ( = ?auto_605073 ?auto_605079 ) ) ( not ( = ?auto_605073 ?auto_605080 ) ) ( not ( = ?auto_605073 ?auto_605081 ) ) ( not ( = ?auto_605073 ?auto_605082 ) ) ( not ( = ?auto_605073 ?auto_605083 ) ) ( not ( = ?auto_605073 ?auto_605084 ) ) ( not ( = ?auto_605073 ?auto_605085 ) ) ( not ( = ?auto_605074 ?auto_605075 ) ) ( not ( = ?auto_605074 ?auto_605076 ) ) ( not ( = ?auto_605074 ?auto_605077 ) ) ( not ( = ?auto_605074 ?auto_605078 ) ) ( not ( = ?auto_605074 ?auto_605079 ) ) ( not ( = ?auto_605074 ?auto_605080 ) ) ( not ( = ?auto_605074 ?auto_605081 ) ) ( not ( = ?auto_605074 ?auto_605082 ) ) ( not ( = ?auto_605074 ?auto_605083 ) ) ( not ( = ?auto_605074 ?auto_605084 ) ) ( not ( = ?auto_605074 ?auto_605085 ) ) ( not ( = ?auto_605075 ?auto_605076 ) ) ( not ( = ?auto_605075 ?auto_605077 ) ) ( not ( = ?auto_605075 ?auto_605078 ) ) ( not ( = ?auto_605075 ?auto_605079 ) ) ( not ( = ?auto_605075 ?auto_605080 ) ) ( not ( = ?auto_605075 ?auto_605081 ) ) ( not ( = ?auto_605075 ?auto_605082 ) ) ( not ( = ?auto_605075 ?auto_605083 ) ) ( not ( = ?auto_605075 ?auto_605084 ) ) ( not ( = ?auto_605075 ?auto_605085 ) ) ( not ( = ?auto_605076 ?auto_605077 ) ) ( not ( = ?auto_605076 ?auto_605078 ) ) ( not ( = ?auto_605076 ?auto_605079 ) ) ( not ( = ?auto_605076 ?auto_605080 ) ) ( not ( = ?auto_605076 ?auto_605081 ) ) ( not ( = ?auto_605076 ?auto_605082 ) ) ( not ( = ?auto_605076 ?auto_605083 ) ) ( not ( = ?auto_605076 ?auto_605084 ) ) ( not ( = ?auto_605076 ?auto_605085 ) ) ( not ( = ?auto_605077 ?auto_605078 ) ) ( not ( = ?auto_605077 ?auto_605079 ) ) ( not ( = ?auto_605077 ?auto_605080 ) ) ( not ( = ?auto_605077 ?auto_605081 ) ) ( not ( = ?auto_605077 ?auto_605082 ) ) ( not ( = ?auto_605077 ?auto_605083 ) ) ( not ( = ?auto_605077 ?auto_605084 ) ) ( not ( = ?auto_605077 ?auto_605085 ) ) ( not ( = ?auto_605078 ?auto_605079 ) ) ( not ( = ?auto_605078 ?auto_605080 ) ) ( not ( = ?auto_605078 ?auto_605081 ) ) ( not ( = ?auto_605078 ?auto_605082 ) ) ( not ( = ?auto_605078 ?auto_605083 ) ) ( not ( = ?auto_605078 ?auto_605084 ) ) ( not ( = ?auto_605078 ?auto_605085 ) ) ( not ( = ?auto_605079 ?auto_605080 ) ) ( not ( = ?auto_605079 ?auto_605081 ) ) ( not ( = ?auto_605079 ?auto_605082 ) ) ( not ( = ?auto_605079 ?auto_605083 ) ) ( not ( = ?auto_605079 ?auto_605084 ) ) ( not ( = ?auto_605079 ?auto_605085 ) ) ( not ( = ?auto_605080 ?auto_605081 ) ) ( not ( = ?auto_605080 ?auto_605082 ) ) ( not ( = ?auto_605080 ?auto_605083 ) ) ( not ( = ?auto_605080 ?auto_605084 ) ) ( not ( = ?auto_605080 ?auto_605085 ) ) ( not ( = ?auto_605081 ?auto_605082 ) ) ( not ( = ?auto_605081 ?auto_605083 ) ) ( not ( = ?auto_605081 ?auto_605084 ) ) ( not ( = ?auto_605081 ?auto_605085 ) ) ( not ( = ?auto_605082 ?auto_605083 ) ) ( not ( = ?auto_605082 ?auto_605084 ) ) ( not ( = ?auto_605082 ?auto_605085 ) ) ( not ( = ?auto_605083 ?auto_605084 ) ) ( not ( = ?auto_605083 ?auto_605085 ) ) ( not ( = ?auto_605084 ?auto_605085 ) ) ( ON ?auto_605084 ?auto_605085 ) ( ON ?auto_605083 ?auto_605084 ) ( ON ?auto_605082 ?auto_605083 ) ( ON ?auto_605081 ?auto_605082 ) ( ON ?auto_605080 ?auto_605081 ) ( ON ?auto_605079 ?auto_605080 ) ( ON ?auto_605078 ?auto_605079 ) ( ON ?auto_605077 ?auto_605078 ) ( ON ?auto_605076 ?auto_605077 ) ( ON ?auto_605075 ?auto_605076 ) ( ON ?auto_605074 ?auto_605075 ) ( ON ?auto_605073 ?auto_605074 ) ( CLEAR ?auto_605071 ) ( ON ?auto_605072 ?auto_605073 ) ( CLEAR ?auto_605072 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_605069 ?auto_605070 ?auto_605071 ?auto_605072 )
      ( MAKE-17PILE ?auto_605069 ?auto_605070 ?auto_605071 ?auto_605072 ?auto_605073 ?auto_605074 ?auto_605075 ?auto_605076 ?auto_605077 ?auto_605078 ?auto_605079 ?auto_605080 ?auto_605081 ?auto_605082 ?auto_605083 ?auto_605084 ?auto_605085 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_605103 - BLOCK
      ?auto_605104 - BLOCK
      ?auto_605105 - BLOCK
      ?auto_605106 - BLOCK
      ?auto_605107 - BLOCK
      ?auto_605108 - BLOCK
      ?auto_605109 - BLOCK
      ?auto_605110 - BLOCK
      ?auto_605111 - BLOCK
      ?auto_605112 - BLOCK
      ?auto_605113 - BLOCK
      ?auto_605114 - BLOCK
      ?auto_605115 - BLOCK
      ?auto_605116 - BLOCK
      ?auto_605117 - BLOCK
      ?auto_605118 - BLOCK
      ?auto_605119 - BLOCK
    )
    :vars
    (
      ?auto_605120 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_605119 ?auto_605120 ) ( ON-TABLE ?auto_605103 ) ( ON ?auto_605104 ?auto_605103 ) ( not ( = ?auto_605103 ?auto_605104 ) ) ( not ( = ?auto_605103 ?auto_605105 ) ) ( not ( = ?auto_605103 ?auto_605106 ) ) ( not ( = ?auto_605103 ?auto_605107 ) ) ( not ( = ?auto_605103 ?auto_605108 ) ) ( not ( = ?auto_605103 ?auto_605109 ) ) ( not ( = ?auto_605103 ?auto_605110 ) ) ( not ( = ?auto_605103 ?auto_605111 ) ) ( not ( = ?auto_605103 ?auto_605112 ) ) ( not ( = ?auto_605103 ?auto_605113 ) ) ( not ( = ?auto_605103 ?auto_605114 ) ) ( not ( = ?auto_605103 ?auto_605115 ) ) ( not ( = ?auto_605103 ?auto_605116 ) ) ( not ( = ?auto_605103 ?auto_605117 ) ) ( not ( = ?auto_605103 ?auto_605118 ) ) ( not ( = ?auto_605103 ?auto_605119 ) ) ( not ( = ?auto_605103 ?auto_605120 ) ) ( not ( = ?auto_605104 ?auto_605105 ) ) ( not ( = ?auto_605104 ?auto_605106 ) ) ( not ( = ?auto_605104 ?auto_605107 ) ) ( not ( = ?auto_605104 ?auto_605108 ) ) ( not ( = ?auto_605104 ?auto_605109 ) ) ( not ( = ?auto_605104 ?auto_605110 ) ) ( not ( = ?auto_605104 ?auto_605111 ) ) ( not ( = ?auto_605104 ?auto_605112 ) ) ( not ( = ?auto_605104 ?auto_605113 ) ) ( not ( = ?auto_605104 ?auto_605114 ) ) ( not ( = ?auto_605104 ?auto_605115 ) ) ( not ( = ?auto_605104 ?auto_605116 ) ) ( not ( = ?auto_605104 ?auto_605117 ) ) ( not ( = ?auto_605104 ?auto_605118 ) ) ( not ( = ?auto_605104 ?auto_605119 ) ) ( not ( = ?auto_605104 ?auto_605120 ) ) ( not ( = ?auto_605105 ?auto_605106 ) ) ( not ( = ?auto_605105 ?auto_605107 ) ) ( not ( = ?auto_605105 ?auto_605108 ) ) ( not ( = ?auto_605105 ?auto_605109 ) ) ( not ( = ?auto_605105 ?auto_605110 ) ) ( not ( = ?auto_605105 ?auto_605111 ) ) ( not ( = ?auto_605105 ?auto_605112 ) ) ( not ( = ?auto_605105 ?auto_605113 ) ) ( not ( = ?auto_605105 ?auto_605114 ) ) ( not ( = ?auto_605105 ?auto_605115 ) ) ( not ( = ?auto_605105 ?auto_605116 ) ) ( not ( = ?auto_605105 ?auto_605117 ) ) ( not ( = ?auto_605105 ?auto_605118 ) ) ( not ( = ?auto_605105 ?auto_605119 ) ) ( not ( = ?auto_605105 ?auto_605120 ) ) ( not ( = ?auto_605106 ?auto_605107 ) ) ( not ( = ?auto_605106 ?auto_605108 ) ) ( not ( = ?auto_605106 ?auto_605109 ) ) ( not ( = ?auto_605106 ?auto_605110 ) ) ( not ( = ?auto_605106 ?auto_605111 ) ) ( not ( = ?auto_605106 ?auto_605112 ) ) ( not ( = ?auto_605106 ?auto_605113 ) ) ( not ( = ?auto_605106 ?auto_605114 ) ) ( not ( = ?auto_605106 ?auto_605115 ) ) ( not ( = ?auto_605106 ?auto_605116 ) ) ( not ( = ?auto_605106 ?auto_605117 ) ) ( not ( = ?auto_605106 ?auto_605118 ) ) ( not ( = ?auto_605106 ?auto_605119 ) ) ( not ( = ?auto_605106 ?auto_605120 ) ) ( not ( = ?auto_605107 ?auto_605108 ) ) ( not ( = ?auto_605107 ?auto_605109 ) ) ( not ( = ?auto_605107 ?auto_605110 ) ) ( not ( = ?auto_605107 ?auto_605111 ) ) ( not ( = ?auto_605107 ?auto_605112 ) ) ( not ( = ?auto_605107 ?auto_605113 ) ) ( not ( = ?auto_605107 ?auto_605114 ) ) ( not ( = ?auto_605107 ?auto_605115 ) ) ( not ( = ?auto_605107 ?auto_605116 ) ) ( not ( = ?auto_605107 ?auto_605117 ) ) ( not ( = ?auto_605107 ?auto_605118 ) ) ( not ( = ?auto_605107 ?auto_605119 ) ) ( not ( = ?auto_605107 ?auto_605120 ) ) ( not ( = ?auto_605108 ?auto_605109 ) ) ( not ( = ?auto_605108 ?auto_605110 ) ) ( not ( = ?auto_605108 ?auto_605111 ) ) ( not ( = ?auto_605108 ?auto_605112 ) ) ( not ( = ?auto_605108 ?auto_605113 ) ) ( not ( = ?auto_605108 ?auto_605114 ) ) ( not ( = ?auto_605108 ?auto_605115 ) ) ( not ( = ?auto_605108 ?auto_605116 ) ) ( not ( = ?auto_605108 ?auto_605117 ) ) ( not ( = ?auto_605108 ?auto_605118 ) ) ( not ( = ?auto_605108 ?auto_605119 ) ) ( not ( = ?auto_605108 ?auto_605120 ) ) ( not ( = ?auto_605109 ?auto_605110 ) ) ( not ( = ?auto_605109 ?auto_605111 ) ) ( not ( = ?auto_605109 ?auto_605112 ) ) ( not ( = ?auto_605109 ?auto_605113 ) ) ( not ( = ?auto_605109 ?auto_605114 ) ) ( not ( = ?auto_605109 ?auto_605115 ) ) ( not ( = ?auto_605109 ?auto_605116 ) ) ( not ( = ?auto_605109 ?auto_605117 ) ) ( not ( = ?auto_605109 ?auto_605118 ) ) ( not ( = ?auto_605109 ?auto_605119 ) ) ( not ( = ?auto_605109 ?auto_605120 ) ) ( not ( = ?auto_605110 ?auto_605111 ) ) ( not ( = ?auto_605110 ?auto_605112 ) ) ( not ( = ?auto_605110 ?auto_605113 ) ) ( not ( = ?auto_605110 ?auto_605114 ) ) ( not ( = ?auto_605110 ?auto_605115 ) ) ( not ( = ?auto_605110 ?auto_605116 ) ) ( not ( = ?auto_605110 ?auto_605117 ) ) ( not ( = ?auto_605110 ?auto_605118 ) ) ( not ( = ?auto_605110 ?auto_605119 ) ) ( not ( = ?auto_605110 ?auto_605120 ) ) ( not ( = ?auto_605111 ?auto_605112 ) ) ( not ( = ?auto_605111 ?auto_605113 ) ) ( not ( = ?auto_605111 ?auto_605114 ) ) ( not ( = ?auto_605111 ?auto_605115 ) ) ( not ( = ?auto_605111 ?auto_605116 ) ) ( not ( = ?auto_605111 ?auto_605117 ) ) ( not ( = ?auto_605111 ?auto_605118 ) ) ( not ( = ?auto_605111 ?auto_605119 ) ) ( not ( = ?auto_605111 ?auto_605120 ) ) ( not ( = ?auto_605112 ?auto_605113 ) ) ( not ( = ?auto_605112 ?auto_605114 ) ) ( not ( = ?auto_605112 ?auto_605115 ) ) ( not ( = ?auto_605112 ?auto_605116 ) ) ( not ( = ?auto_605112 ?auto_605117 ) ) ( not ( = ?auto_605112 ?auto_605118 ) ) ( not ( = ?auto_605112 ?auto_605119 ) ) ( not ( = ?auto_605112 ?auto_605120 ) ) ( not ( = ?auto_605113 ?auto_605114 ) ) ( not ( = ?auto_605113 ?auto_605115 ) ) ( not ( = ?auto_605113 ?auto_605116 ) ) ( not ( = ?auto_605113 ?auto_605117 ) ) ( not ( = ?auto_605113 ?auto_605118 ) ) ( not ( = ?auto_605113 ?auto_605119 ) ) ( not ( = ?auto_605113 ?auto_605120 ) ) ( not ( = ?auto_605114 ?auto_605115 ) ) ( not ( = ?auto_605114 ?auto_605116 ) ) ( not ( = ?auto_605114 ?auto_605117 ) ) ( not ( = ?auto_605114 ?auto_605118 ) ) ( not ( = ?auto_605114 ?auto_605119 ) ) ( not ( = ?auto_605114 ?auto_605120 ) ) ( not ( = ?auto_605115 ?auto_605116 ) ) ( not ( = ?auto_605115 ?auto_605117 ) ) ( not ( = ?auto_605115 ?auto_605118 ) ) ( not ( = ?auto_605115 ?auto_605119 ) ) ( not ( = ?auto_605115 ?auto_605120 ) ) ( not ( = ?auto_605116 ?auto_605117 ) ) ( not ( = ?auto_605116 ?auto_605118 ) ) ( not ( = ?auto_605116 ?auto_605119 ) ) ( not ( = ?auto_605116 ?auto_605120 ) ) ( not ( = ?auto_605117 ?auto_605118 ) ) ( not ( = ?auto_605117 ?auto_605119 ) ) ( not ( = ?auto_605117 ?auto_605120 ) ) ( not ( = ?auto_605118 ?auto_605119 ) ) ( not ( = ?auto_605118 ?auto_605120 ) ) ( not ( = ?auto_605119 ?auto_605120 ) ) ( ON ?auto_605118 ?auto_605119 ) ( ON ?auto_605117 ?auto_605118 ) ( ON ?auto_605116 ?auto_605117 ) ( ON ?auto_605115 ?auto_605116 ) ( ON ?auto_605114 ?auto_605115 ) ( ON ?auto_605113 ?auto_605114 ) ( ON ?auto_605112 ?auto_605113 ) ( ON ?auto_605111 ?auto_605112 ) ( ON ?auto_605110 ?auto_605111 ) ( ON ?auto_605109 ?auto_605110 ) ( ON ?auto_605108 ?auto_605109 ) ( ON ?auto_605107 ?auto_605108 ) ( ON ?auto_605106 ?auto_605107 ) ( CLEAR ?auto_605104 ) ( ON ?auto_605105 ?auto_605106 ) ( CLEAR ?auto_605105 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_605103 ?auto_605104 ?auto_605105 )
      ( MAKE-17PILE ?auto_605103 ?auto_605104 ?auto_605105 ?auto_605106 ?auto_605107 ?auto_605108 ?auto_605109 ?auto_605110 ?auto_605111 ?auto_605112 ?auto_605113 ?auto_605114 ?auto_605115 ?auto_605116 ?auto_605117 ?auto_605118 ?auto_605119 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_605138 - BLOCK
      ?auto_605139 - BLOCK
      ?auto_605140 - BLOCK
      ?auto_605141 - BLOCK
      ?auto_605142 - BLOCK
      ?auto_605143 - BLOCK
      ?auto_605144 - BLOCK
      ?auto_605145 - BLOCK
      ?auto_605146 - BLOCK
      ?auto_605147 - BLOCK
      ?auto_605148 - BLOCK
      ?auto_605149 - BLOCK
      ?auto_605150 - BLOCK
      ?auto_605151 - BLOCK
      ?auto_605152 - BLOCK
      ?auto_605153 - BLOCK
      ?auto_605154 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_605154 ) ( ON-TABLE ?auto_605138 ) ( ON ?auto_605139 ?auto_605138 ) ( not ( = ?auto_605138 ?auto_605139 ) ) ( not ( = ?auto_605138 ?auto_605140 ) ) ( not ( = ?auto_605138 ?auto_605141 ) ) ( not ( = ?auto_605138 ?auto_605142 ) ) ( not ( = ?auto_605138 ?auto_605143 ) ) ( not ( = ?auto_605138 ?auto_605144 ) ) ( not ( = ?auto_605138 ?auto_605145 ) ) ( not ( = ?auto_605138 ?auto_605146 ) ) ( not ( = ?auto_605138 ?auto_605147 ) ) ( not ( = ?auto_605138 ?auto_605148 ) ) ( not ( = ?auto_605138 ?auto_605149 ) ) ( not ( = ?auto_605138 ?auto_605150 ) ) ( not ( = ?auto_605138 ?auto_605151 ) ) ( not ( = ?auto_605138 ?auto_605152 ) ) ( not ( = ?auto_605138 ?auto_605153 ) ) ( not ( = ?auto_605138 ?auto_605154 ) ) ( not ( = ?auto_605139 ?auto_605140 ) ) ( not ( = ?auto_605139 ?auto_605141 ) ) ( not ( = ?auto_605139 ?auto_605142 ) ) ( not ( = ?auto_605139 ?auto_605143 ) ) ( not ( = ?auto_605139 ?auto_605144 ) ) ( not ( = ?auto_605139 ?auto_605145 ) ) ( not ( = ?auto_605139 ?auto_605146 ) ) ( not ( = ?auto_605139 ?auto_605147 ) ) ( not ( = ?auto_605139 ?auto_605148 ) ) ( not ( = ?auto_605139 ?auto_605149 ) ) ( not ( = ?auto_605139 ?auto_605150 ) ) ( not ( = ?auto_605139 ?auto_605151 ) ) ( not ( = ?auto_605139 ?auto_605152 ) ) ( not ( = ?auto_605139 ?auto_605153 ) ) ( not ( = ?auto_605139 ?auto_605154 ) ) ( not ( = ?auto_605140 ?auto_605141 ) ) ( not ( = ?auto_605140 ?auto_605142 ) ) ( not ( = ?auto_605140 ?auto_605143 ) ) ( not ( = ?auto_605140 ?auto_605144 ) ) ( not ( = ?auto_605140 ?auto_605145 ) ) ( not ( = ?auto_605140 ?auto_605146 ) ) ( not ( = ?auto_605140 ?auto_605147 ) ) ( not ( = ?auto_605140 ?auto_605148 ) ) ( not ( = ?auto_605140 ?auto_605149 ) ) ( not ( = ?auto_605140 ?auto_605150 ) ) ( not ( = ?auto_605140 ?auto_605151 ) ) ( not ( = ?auto_605140 ?auto_605152 ) ) ( not ( = ?auto_605140 ?auto_605153 ) ) ( not ( = ?auto_605140 ?auto_605154 ) ) ( not ( = ?auto_605141 ?auto_605142 ) ) ( not ( = ?auto_605141 ?auto_605143 ) ) ( not ( = ?auto_605141 ?auto_605144 ) ) ( not ( = ?auto_605141 ?auto_605145 ) ) ( not ( = ?auto_605141 ?auto_605146 ) ) ( not ( = ?auto_605141 ?auto_605147 ) ) ( not ( = ?auto_605141 ?auto_605148 ) ) ( not ( = ?auto_605141 ?auto_605149 ) ) ( not ( = ?auto_605141 ?auto_605150 ) ) ( not ( = ?auto_605141 ?auto_605151 ) ) ( not ( = ?auto_605141 ?auto_605152 ) ) ( not ( = ?auto_605141 ?auto_605153 ) ) ( not ( = ?auto_605141 ?auto_605154 ) ) ( not ( = ?auto_605142 ?auto_605143 ) ) ( not ( = ?auto_605142 ?auto_605144 ) ) ( not ( = ?auto_605142 ?auto_605145 ) ) ( not ( = ?auto_605142 ?auto_605146 ) ) ( not ( = ?auto_605142 ?auto_605147 ) ) ( not ( = ?auto_605142 ?auto_605148 ) ) ( not ( = ?auto_605142 ?auto_605149 ) ) ( not ( = ?auto_605142 ?auto_605150 ) ) ( not ( = ?auto_605142 ?auto_605151 ) ) ( not ( = ?auto_605142 ?auto_605152 ) ) ( not ( = ?auto_605142 ?auto_605153 ) ) ( not ( = ?auto_605142 ?auto_605154 ) ) ( not ( = ?auto_605143 ?auto_605144 ) ) ( not ( = ?auto_605143 ?auto_605145 ) ) ( not ( = ?auto_605143 ?auto_605146 ) ) ( not ( = ?auto_605143 ?auto_605147 ) ) ( not ( = ?auto_605143 ?auto_605148 ) ) ( not ( = ?auto_605143 ?auto_605149 ) ) ( not ( = ?auto_605143 ?auto_605150 ) ) ( not ( = ?auto_605143 ?auto_605151 ) ) ( not ( = ?auto_605143 ?auto_605152 ) ) ( not ( = ?auto_605143 ?auto_605153 ) ) ( not ( = ?auto_605143 ?auto_605154 ) ) ( not ( = ?auto_605144 ?auto_605145 ) ) ( not ( = ?auto_605144 ?auto_605146 ) ) ( not ( = ?auto_605144 ?auto_605147 ) ) ( not ( = ?auto_605144 ?auto_605148 ) ) ( not ( = ?auto_605144 ?auto_605149 ) ) ( not ( = ?auto_605144 ?auto_605150 ) ) ( not ( = ?auto_605144 ?auto_605151 ) ) ( not ( = ?auto_605144 ?auto_605152 ) ) ( not ( = ?auto_605144 ?auto_605153 ) ) ( not ( = ?auto_605144 ?auto_605154 ) ) ( not ( = ?auto_605145 ?auto_605146 ) ) ( not ( = ?auto_605145 ?auto_605147 ) ) ( not ( = ?auto_605145 ?auto_605148 ) ) ( not ( = ?auto_605145 ?auto_605149 ) ) ( not ( = ?auto_605145 ?auto_605150 ) ) ( not ( = ?auto_605145 ?auto_605151 ) ) ( not ( = ?auto_605145 ?auto_605152 ) ) ( not ( = ?auto_605145 ?auto_605153 ) ) ( not ( = ?auto_605145 ?auto_605154 ) ) ( not ( = ?auto_605146 ?auto_605147 ) ) ( not ( = ?auto_605146 ?auto_605148 ) ) ( not ( = ?auto_605146 ?auto_605149 ) ) ( not ( = ?auto_605146 ?auto_605150 ) ) ( not ( = ?auto_605146 ?auto_605151 ) ) ( not ( = ?auto_605146 ?auto_605152 ) ) ( not ( = ?auto_605146 ?auto_605153 ) ) ( not ( = ?auto_605146 ?auto_605154 ) ) ( not ( = ?auto_605147 ?auto_605148 ) ) ( not ( = ?auto_605147 ?auto_605149 ) ) ( not ( = ?auto_605147 ?auto_605150 ) ) ( not ( = ?auto_605147 ?auto_605151 ) ) ( not ( = ?auto_605147 ?auto_605152 ) ) ( not ( = ?auto_605147 ?auto_605153 ) ) ( not ( = ?auto_605147 ?auto_605154 ) ) ( not ( = ?auto_605148 ?auto_605149 ) ) ( not ( = ?auto_605148 ?auto_605150 ) ) ( not ( = ?auto_605148 ?auto_605151 ) ) ( not ( = ?auto_605148 ?auto_605152 ) ) ( not ( = ?auto_605148 ?auto_605153 ) ) ( not ( = ?auto_605148 ?auto_605154 ) ) ( not ( = ?auto_605149 ?auto_605150 ) ) ( not ( = ?auto_605149 ?auto_605151 ) ) ( not ( = ?auto_605149 ?auto_605152 ) ) ( not ( = ?auto_605149 ?auto_605153 ) ) ( not ( = ?auto_605149 ?auto_605154 ) ) ( not ( = ?auto_605150 ?auto_605151 ) ) ( not ( = ?auto_605150 ?auto_605152 ) ) ( not ( = ?auto_605150 ?auto_605153 ) ) ( not ( = ?auto_605150 ?auto_605154 ) ) ( not ( = ?auto_605151 ?auto_605152 ) ) ( not ( = ?auto_605151 ?auto_605153 ) ) ( not ( = ?auto_605151 ?auto_605154 ) ) ( not ( = ?auto_605152 ?auto_605153 ) ) ( not ( = ?auto_605152 ?auto_605154 ) ) ( not ( = ?auto_605153 ?auto_605154 ) ) ( ON ?auto_605153 ?auto_605154 ) ( ON ?auto_605152 ?auto_605153 ) ( ON ?auto_605151 ?auto_605152 ) ( ON ?auto_605150 ?auto_605151 ) ( ON ?auto_605149 ?auto_605150 ) ( ON ?auto_605148 ?auto_605149 ) ( ON ?auto_605147 ?auto_605148 ) ( ON ?auto_605146 ?auto_605147 ) ( ON ?auto_605145 ?auto_605146 ) ( ON ?auto_605144 ?auto_605145 ) ( ON ?auto_605143 ?auto_605144 ) ( ON ?auto_605142 ?auto_605143 ) ( ON ?auto_605141 ?auto_605142 ) ( CLEAR ?auto_605139 ) ( ON ?auto_605140 ?auto_605141 ) ( CLEAR ?auto_605140 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_605138 ?auto_605139 ?auto_605140 )
      ( MAKE-17PILE ?auto_605138 ?auto_605139 ?auto_605140 ?auto_605141 ?auto_605142 ?auto_605143 ?auto_605144 ?auto_605145 ?auto_605146 ?auto_605147 ?auto_605148 ?auto_605149 ?auto_605150 ?auto_605151 ?auto_605152 ?auto_605153 ?auto_605154 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_605172 - BLOCK
      ?auto_605173 - BLOCK
      ?auto_605174 - BLOCK
      ?auto_605175 - BLOCK
      ?auto_605176 - BLOCK
      ?auto_605177 - BLOCK
      ?auto_605178 - BLOCK
      ?auto_605179 - BLOCK
      ?auto_605180 - BLOCK
      ?auto_605181 - BLOCK
      ?auto_605182 - BLOCK
      ?auto_605183 - BLOCK
      ?auto_605184 - BLOCK
      ?auto_605185 - BLOCK
      ?auto_605186 - BLOCK
      ?auto_605187 - BLOCK
      ?auto_605188 - BLOCK
    )
    :vars
    (
      ?auto_605189 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_605188 ?auto_605189 ) ( ON-TABLE ?auto_605172 ) ( not ( = ?auto_605172 ?auto_605173 ) ) ( not ( = ?auto_605172 ?auto_605174 ) ) ( not ( = ?auto_605172 ?auto_605175 ) ) ( not ( = ?auto_605172 ?auto_605176 ) ) ( not ( = ?auto_605172 ?auto_605177 ) ) ( not ( = ?auto_605172 ?auto_605178 ) ) ( not ( = ?auto_605172 ?auto_605179 ) ) ( not ( = ?auto_605172 ?auto_605180 ) ) ( not ( = ?auto_605172 ?auto_605181 ) ) ( not ( = ?auto_605172 ?auto_605182 ) ) ( not ( = ?auto_605172 ?auto_605183 ) ) ( not ( = ?auto_605172 ?auto_605184 ) ) ( not ( = ?auto_605172 ?auto_605185 ) ) ( not ( = ?auto_605172 ?auto_605186 ) ) ( not ( = ?auto_605172 ?auto_605187 ) ) ( not ( = ?auto_605172 ?auto_605188 ) ) ( not ( = ?auto_605172 ?auto_605189 ) ) ( not ( = ?auto_605173 ?auto_605174 ) ) ( not ( = ?auto_605173 ?auto_605175 ) ) ( not ( = ?auto_605173 ?auto_605176 ) ) ( not ( = ?auto_605173 ?auto_605177 ) ) ( not ( = ?auto_605173 ?auto_605178 ) ) ( not ( = ?auto_605173 ?auto_605179 ) ) ( not ( = ?auto_605173 ?auto_605180 ) ) ( not ( = ?auto_605173 ?auto_605181 ) ) ( not ( = ?auto_605173 ?auto_605182 ) ) ( not ( = ?auto_605173 ?auto_605183 ) ) ( not ( = ?auto_605173 ?auto_605184 ) ) ( not ( = ?auto_605173 ?auto_605185 ) ) ( not ( = ?auto_605173 ?auto_605186 ) ) ( not ( = ?auto_605173 ?auto_605187 ) ) ( not ( = ?auto_605173 ?auto_605188 ) ) ( not ( = ?auto_605173 ?auto_605189 ) ) ( not ( = ?auto_605174 ?auto_605175 ) ) ( not ( = ?auto_605174 ?auto_605176 ) ) ( not ( = ?auto_605174 ?auto_605177 ) ) ( not ( = ?auto_605174 ?auto_605178 ) ) ( not ( = ?auto_605174 ?auto_605179 ) ) ( not ( = ?auto_605174 ?auto_605180 ) ) ( not ( = ?auto_605174 ?auto_605181 ) ) ( not ( = ?auto_605174 ?auto_605182 ) ) ( not ( = ?auto_605174 ?auto_605183 ) ) ( not ( = ?auto_605174 ?auto_605184 ) ) ( not ( = ?auto_605174 ?auto_605185 ) ) ( not ( = ?auto_605174 ?auto_605186 ) ) ( not ( = ?auto_605174 ?auto_605187 ) ) ( not ( = ?auto_605174 ?auto_605188 ) ) ( not ( = ?auto_605174 ?auto_605189 ) ) ( not ( = ?auto_605175 ?auto_605176 ) ) ( not ( = ?auto_605175 ?auto_605177 ) ) ( not ( = ?auto_605175 ?auto_605178 ) ) ( not ( = ?auto_605175 ?auto_605179 ) ) ( not ( = ?auto_605175 ?auto_605180 ) ) ( not ( = ?auto_605175 ?auto_605181 ) ) ( not ( = ?auto_605175 ?auto_605182 ) ) ( not ( = ?auto_605175 ?auto_605183 ) ) ( not ( = ?auto_605175 ?auto_605184 ) ) ( not ( = ?auto_605175 ?auto_605185 ) ) ( not ( = ?auto_605175 ?auto_605186 ) ) ( not ( = ?auto_605175 ?auto_605187 ) ) ( not ( = ?auto_605175 ?auto_605188 ) ) ( not ( = ?auto_605175 ?auto_605189 ) ) ( not ( = ?auto_605176 ?auto_605177 ) ) ( not ( = ?auto_605176 ?auto_605178 ) ) ( not ( = ?auto_605176 ?auto_605179 ) ) ( not ( = ?auto_605176 ?auto_605180 ) ) ( not ( = ?auto_605176 ?auto_605181 ) ) ( not ( = ?auto_605176 ?auto_605182 ) ) ( not ( = ?auto_605176 ?auto_605183 ) ) ( not ( = ?auto_605176 ?auto_605184 ) ) ( not ( = ?auto_605176 ?auto_605185 ) ) ( not ( = ?auto_605176 ?auto_605186 ) ) ( not ( = ?auto_605176 ?auto_605187 ) ) ( not ( = ?auto_605176 ?auto_605188 ) ) ( not ( = ?auto_605176 ?auto_605189 ) ) ( not ( = ?auto_605177 ?auto_605178 ) ) ( not ( = ?auto_605177 ?auto_605179 ) ) ( not ( = ?auto_605177 ?auto_605180 ) ) ( not ( = ?auto_605177 ?auto_605181 ) ) ( not ( = ?auto_605177 ?auto_605182 ) ) ( not ( = ?auto_605177 ?auto_605183 ) ) ( not ( = ?auto_605177 ?auto_605184 ) ) ( not ( = ?auto_605177 ?auto_605185 ) ) ( not ( = ?auto_605177 ?auto_605186 ) ) ( not ( = ?auto_605177 ?auto_605187 ) ) ( not ( = ?auto_605177 ?auto_605188 ) ) ( not ( = ?auto_605177 ?auto_605189 ) ) ( not ( = ?auto_605178 ?auto_605179 ) ) ( not ( = ?auto_605178 ?auto_605180 ) ) ( not ( = ?auto_605178 ?auto_605181 ) ) ( not ( = ?auto_605178 ?auto_605182 ) ) ( not ( = ?auto_605178 ?auto_605183 ) ) ( not ( = ?auto_605178 ?auto_605184 ) ) ( not ( = ?auto_605178 ?auto_605185 ) ) ( not ( = ?auto_605178 ?auto_605186 ) ) ( not ( = ?auto_605178 ?auto_605187 ) ) ( not ( = ?auto_605178 ?auto_605188 ) ) ( not ( = ?auto_605178 ?auto_605189 ) ) ( not ( = ?auto_605179 ?auto_605180 ) ) ( not ( = ?auto_605179 ?auto_605181 ) ) ( not ( = ?auto_605179 ?auto_605182 ) ) ( not ( = ?auto_605179 ?auto_605183 ) ) ( not ( = ?auto_605179 ?auto_605184 ) ) ( not ( = ?auto_605179 ?auto_605185 ) ) ( not ( = ?auto_605179 ?auto_605186 ) ) ( not ( = ?auto_605179 ?auto_605187 ) ) ( not ( = ?auto_605179 ?auto_605188 ) ) ( not ( = ?auto_605179 ?auto_605189 ) ) ( not ( = ?auto_605180 ?auto_605181 ) ) ( not ( = ?auto_605180 ?auto_605182 ) ) ( not ( = ?auto_605180 ?auto_605183 ) ) ( not ( = ?auto_605180 ?auto_605184 ) ) ( not ( = ?auto_605180 ?auto_605185 ) ) ( not ( = ?auto_605180 ?auto_605186 ) ) ( not ( = ?auto_605180 ?auto_605187 ) ) ( not ( = ?auto_605180 ?auto_605188 ) ) ( not ( = ?auto_605180 ?auto_605189 ) ) ( not ( = ?auto_605181 ?auto_605182 ) ) ( not ( = ?auto_605181 ?auto_605183 ) ) ( not ( = ?auto_605181 ?auto_605184 ) ) ( not ( = ?auto_605181 ?auto_605185 ) ) ( not ( = ?auto_605181 ?auto_605186 ) ) ( not ( = ?auto_605181 ?auto_605187 ) ) ( not ( = ?auto_605181 ?auto_605188 ) ) ( not ( = ?auto_605181 ?auto_605189 ) ) ( not ( = ?auto_605182 ?auto_605183 ) ) ( not ( = ?auto_605182 ?auto_605184 ) ) ( not ( = ?auto_605182 ?auto_605185 ) ) ( not ( = ?auto_605182 ?auto_605186 ) ) ( not ( = ?auto_605182 ?auto_605187 ) ) ( not ( = ?auto_605182 ?auto_605188 ) ) ( not ( = ?auto_605182 ?auto_605189 ) ) ( not ( = ?auto_605183 ?auto_605184 ) ) ( not ( = ?auto_605183 ?auto_605185 ) ) ( not ( = ?auto_605183 ?auto_605186 ) ) ( not ( = ?auto_605183 ?auto_605187 ) ) ( not ( = ?auto_605183 ?auto_605188 ) ) ( not ( = ?auto_605183 ?auto_605189 ) ) ( not ( = ?auto_605184 ?auto_605185 ) ) ( not ( = ?auto_605184 ?auto_605186 ) ) ( not ( = ?auto_605184 ?auto_605187 ) ) ( not ( = ?auto_605184 ?auto_605188 ) ) ( not ( = ?auto_605184 ?auto_605189 ) ) ( not ( = ?auto_605185 ?auto_605186 ) ) ( not ( = ?auto_605185 ?auto_605187 ) ) ( not ( = ?auto_605185 ?auto_605188 ) ) ( not ( = ?auto_605185 ?auto_605189 ) ) ( not ( = ?auto_605186 ?auto_605187 ) ) ( not ( = ?auto_605186 ?auto_605188 ) ) ( not ( = ?auto_605186 ?auto_605189 ) ) ( not ( = ?auto_605187 ?auto_605188 ) ) ( not ( = ?auto_605187 ?auto_605189 ) ) ( not ( = ?auto_605188 ?auto_605189 ) ) ( ON ?auto_605187 ?auto_605188 ) ( ON ?auto_605186 ?auto_605187 ) ( ON ?auto_605185 ?auto_605186 ) ( ON ?auto_605184 ?auto_605185 ) ( ON ?auto_605183 ?auto_605184 ) ( ON ?auto_605182 ?auto_605183 ) ( ON ?auto_605181 ?auto_605182 ) ( ON ?auto_605180 ?auto_605181 ) ( ON ?auto_605179 ?auto_605180 ) ( ON ?auto_605178 ?auto_605179 ) ( ON ?auto_605177 ?auto_605178 ) ( ON ?auto_605176 ?auto_605177 ) ( ON ?auto_605175 ?auto_605176 ) ( ON ?auto_605174 ?auto_605175 ) ( CLEAR ?auto_605172 ) ( ON ?auto_605173 ?auto_605174 ) ( CLEAR ?auto_605173 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_605172 ?auto_605173 )
      ( MAKE-17PILE ?auto_605172 ?auto_605173 ?auto_605174 ?auto_605175 ?auto_605176 ?auto_605177 ?auto_605178 ?auto_605179 ?auto_605180 ?auto_605181 ?auto_605182 ?auto_605183 ?auto_605184 ?auto_605185 ?auto_605186 ?auto_605187 ?auto_605188 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_605207 - BLOCK
      ?auto_605208 - BLOCK
      ?auto_605209 - BLOCK
      ?auto_605210 - BLOCK
      ?auto_605211 - BLOCK
      ?auto_605212 - BLOCK
      ?auto_605213 - BLOCK
      ?auto_605214 - BLOCK
      ?auto_605215 - BLOCK
      ?auto_605216 - BLOCK
      ?auto_605217 - BLOCK
      ?auto_605218 - BLOCK
      ?auto_605219 - BLOCK
      ?auto_605220 - BLOCK
      ?auto_605221 - BLOCK
      ?auto_605222 - BLOCK
      ?auto_605223 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_605223 ) ( ON-TABLE ?auto_605207 ) ( not ( = ?auto_605207 ?auto_605208 ) ) ( not ( = ?auto_605207 ?auto_605209 ) ) ( not ( = ?auto_605207 ?auto_605210 ) ) ( not ( = ?auto_605207 ?auto_605211 ) ) ( not ( = ?auto_605207 ?auto_605212 ) ) ( not ( = ?auto_605207 ?auto_605213 ) ) ( not ( = ?auto_605207 ?auto_605214 ) ) ( not ( = ?auto_605207 ?auto_605215 ) ) ( not ( = ?auto_605207 ?auto_605216 ) ) ( not ( = ?auto_605207 ?auto_605217 ) ) ( not ( = ?auto_605207 ?auto_605218 ) ) ( not ( = ?auto_605207 ?auto_605219 ) ) ( not ( = ?auto_605207 ?auto_605220 ) ) ( not ( = ?auto_605207 ?auto_605221 ) ) ( not ( = ?auto_605207 ?auto_605222 ) ) ( not ( = ?auto_605207 ?auto_605223 ) ) ( not ( = ?auto_605208 ?auto_605209 ) ) ( not ( = ?auto_605208 ?auto_605210 ) ) ( not ( = ?auto_605208 ?auto_605211 ) ) ( not ( = ?auto_605208 ?auto_605212 ) ) ( not ( = ?auto_605208 ?auto_605213 ) ) ( not ( = ?auto_605208 ?auto_605214 ) ) ( not ( = ?auto_605208 ?auto_605215 ) ) ( not ( = ?auto_605208 ?auto_605216 ) ) ( not ( = ?auto_605208 ?auto_605217 ) ) ( not ( = ?auto_605208 ?auto_605218 ) ) ( not ( = ?auto_605208 ?auto_605219 ) ) ( not ( = ?auto_605208 ?auto_605220 ) ) ( not ( = ?auto_605208 ?auto_605221 ) ) ( not ( = ?auto_605208 ?auto_605222 ) ) ( not ( = ?auto_605208 ?auto_605223 ) ) ( not ( = ?auto_605209 ?auto_605210 ) ) ( not ( = ?auto_605209 ?auto_605211 ) ) ( not ( = ?auto_605209 ?auto_605212 ) ) ( not ( = ?auto_605209 ?auto_605213 ) ) ( not ( = ?auto_605209 ?auto_605214 ) ) ( not ( = ?auto_605209 ?auto_605215 ) ) ( not ( = ?auto_605209 ?auto_605216 ) ) ( not ( = ?auto_605209 ?auto_605217 ) ) ( not ( = ?auto_605209 ?auto_605218 ) ) ( not ( = ?auto_605209 ?auto_605219 ) ) ( not ( = ?auto_605209 ?auto_605220 ) ) ( not ( = ?auto_605209 ?auto_605221 ) ) ( not ( = ?auto_605209 ?auto_605222 ) ) ( not ( = ?auto_605209 ?auto_605223 ) ) ( not ( = ?auto_605210 ?auto_605211 ) ) ( not ( = ?auto_605210 ?auto_605212 ) ) ( not ( = ?auto_605210 ?auto_605213 ) ) ( not ( = ?auto_605210 ?auto_605214 ) ) ( not ( = ?auto_605210 ?auto_605215 ) ) ( not ( = ?auto_605210 ?auto_605216 ) ) ( not ( = ?auto_605210 ?auto_605217 ) ) ( not ( = ?auto_605210 ?auto_605218 ) ) ( not ( = ?auto_605210 ?auto_605219 ) ) ( not ( = ?auto_605210 ?auto_605220 ) ) ( not ( = ?auto_605210 ?auto_605221 ) ) ( not ( = ?auto_605210 ?auto_605222 ) ) ( not ( = ?auto_605210 ?auto_605223 ) ) ( not ( = ?auto_605211 ?auto_605212 ) ) ( not ( = ?auto_605211 ?auto_605213 ) ) ( not ( = ?auto_605211 ?auto_605214 ) ) ( not ( = ?auto_605211 ?auto_605215 ) ) ( not ( = ?auto_605211 ?auto_605216 ) ) ( not ( = ?auto_605211 ?auto_605217 ) ) ( not ( = ?auto_605211 ?auto_605218 ) ) ( not ( = ?auto_605211 ?auto_605219 ) ) ( not ( = ?auto_605211 ?auto_605220 ) ) ( not ( = ?auto_605211 ?auto_605221 ) ) ( not ( = ?auto_605211 ?auto_605222 ) ) ( not ( = ?auto_605211 ?auto_605223 ) ) ( not ( = ?auto_605212 ?auto_605213 ) ) ( not ( = ?auto_605212 ?auto_605214 ) ) ( not ( = ?auto_605212 ?auto_605215 ) ) ( not ( = ?auto_605212 ?auto_605216 ) ) ( not ( = ?auto_605212 ?auto_605217 ) ) ( not ( = ?auto_605212 ?auto_605218 ) ) ( not ( = ?auto_605212 ?auto_605219 ) ) ( not ( = ?auto_605212 ?auto_605220 ) ) ( not ( = ?auto_605212 ?auto_605221 ) ) ( not ( = ?auto_605212 ?auto_605222 ) ) ( not ( = ?auto_605212 ?auto_605223 ) ) ( not ( = ?auto_605213 ?auto_605214 ) ) ( not ( = ?auto_605213 ?auto_605215 ) ) ( not ( = ?auto_605213 ?auto_605216 ) ) ( not ( = ?auto_605213 ?auto_605217 ) ) ( not ( = ?auto_605213 ?auto_605218 ) ) ( not ( = ?auto_605213 ?auto_605219 ) ) ( not ( = ?auto_605213 ?auto_605220 ) ) ( not ( = ?auto_605213 ?auto_605221 ) ) ( not ( = ?auto_605213 ?auto_605222 ) ) ( not ( = ?auto_605213 ?auto_605223 ) ) ( not ( = ?auto_605214 ?auto_605215 ) ) ( not ( = ?auto_605214 ?auto_605216 ) ) ( not ( = ?auto_605214 ?auto_605217 ) ) ( not ( = ?auto_605214 ?auto_605218 ) ) ( not ( = ?auto_605214 ?auto_605219 ) ) ( not ( = ?auto_605214 ?auto_605220 ) ) ( not ( = ?auto_605214 ?auto_605221 ) ) ( not ( = ?auto_605214 ?auto_605222 ) ) ( not ( = ?auto_605214 ?auto_605223 ) ) ( not ( = ?auto_605215 ?auto_605216 ) ) ( not ( = ?auto_605215 ?auto_605217 ) ) ( not ( = ?auto_605215 ?auto_605218 ) ) ( not ( = ?auto_605215 ?auto_605219 ) ) ( not ( = ?auto_605215 ?auto_605220 ) ) ( not ( = ?auto_605215 ?auto_605221 ) ) ( not ( = ?auto_605215 ?auto_605222 ) ) ( not ( = ?auto_605215 ?auto_605223 ) ) ( not ( = ?auto_605216 ?auto_605217 ) ) ( not ( = ?auto_605216 ?auto_605218 ) ) ( not ( = ?auto_605216 ?auto_605219 ) ) ( not ( = ?auto_605216 ?auto_605220 ) ) ( not ( = ?auto_605216 ?auto_605221 ) ) ( not ( = ?auto_605216 ?auto_605222 ) ) ( not ( = ?auto_605216 ?auto_605223 ) ) ( not ( = ?auto_605217 ?auto_605218 ) ) ( not ( = ?auto_605217 ?auto_605219 ) ) ( not ( = ?auto_605217 ?auto_605220 ) ) ( not ( = ?auto_605217 ?auto_605221 ) ) ( not ( = ?auto_605217 ?auto_605222 ) ) ( not ( = ?auto_605217 ?auto_605223 ) ) ( not ( = ?auto_605218 ?auto_605219 ) ) ( not ( = ?auto_605218 ?auto_605220 ) ) ( not ( = ?auto_605218 ?auto_605221 ) ) ( not ( = ?auto_605218 ?auto_605222 ) ) ( not ( = ?auto_605218 ?auto_605223 ) ) ( not ( = ?auto_605219 ?auto_605220 ) ) ( not ( = ?auto_605219 ?auto_605221 ) ) ( not ( = ?auto_605219 ?auto_605222 ) ) ( not ( = ?auto_605219 ?auto_605223 ) ) ( not ( = ?auto_605220 ?auto_605221 ) ) ( not ( = ?auto_605220 ?auto_605222 ) ) ( not ( = ?auto_605220 ?auto_605223 ) ) ( not ( = ?auto_605221 ?auto_605222 ) ) ( not ( = ?auto_605221 ?auto_605223 ) ) ( not ( = ?auto_605222 ?auto_605223 ) ) ( ON ?auto_605222 ?auto_605223 ) ( ON ?auto_605221 ?auto_605222 ) ( ON ?auto_605220 ?auto_605221 ) ( ON ?auto_605219 ?auto_605220 ) ( ON ?auto_605218 ?auto_605219 ) ( ON ?auto_605217 ?auto_605218 ) ( ON ?auto_605216 ?auto_605217 ) ( ON ?auto_605215 ?auto_605216 ) ( ON ?auto_605214 ?auto_605215 ) ( ON ?auto_605213 ?auto_605214 ) ( ON ?auto_605212 ?auto_605213 ) ( ON ?auto_605211 ?auto_605212 ) ( ON ?auto_605210 ?auto_605211 ) ( ON ?auto_605209 ?auto_605210 ) ( CLEAR ?auto_605207 ) ( ON ?auto_605208 ?auto_605209 ) ( CLEAR ?auto_605208 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_605207 ?auto_605208 )
      ( MAKE-17PILE ?auto_605207 ?auto_605208 ?auto_605209 ?auto_605210 ?auto_605211 ?auto_605212 ?auto_605213 ?auto_605214 ?auto_605215 ?auto_605216 ?auto_605217 ?auto_605218 ?auto_605219 ?auto_605220 ?auto_605221 ?auto_605222 ?auto_605223 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_605241 - BLOCK
      ?auto_605242 - BLOCK
      ?auto_605243 - BLOCK
      ?auto_605244 - BLOCK
      ?auto_605245 - BLOCK
      ?auto_605246 - BLOCK
      ?auto_605247 - BLOCK
      ?auto_605248 - BLOCK
      ?auto_605249 - BLOCK
      ?auto_605250 - BLOCK
      ?auto_605251 - BLOCK
      ?auto_605252 - BLOCK
      ?auto_605253 - BLOCK
      ?auto_605254 - BLOCK
      ?auto_605255 - BLOCK
      ?auto_605256 - BLOCK
      ?auto_605257 - BLOCK
    )
    :vars
    (
      ?auto_605258 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_605257 ?auto_605258 ) ( not ( = ?auto_605241 ?auto_605242 ) ) ( not ( = ?auto_605241 ?auto_605243 ) ) ( not ( = ?auto_605241 ?auto_605244 ) ) ( not ( = ?auto_605241 ?auto_605245 ) ) ( not ( = ?auto_605241 ?auto_605246 ) ) ( not ( = ?auto_605241 ?auto_605247 ) ) ( not ( = ?auto_605241 ?auto_605248 ) ) ( not ( = ?auto_605241 ?auto_605249 ) ) ( not ( = ?auto_605241 ?auto_605250 ) ) ( not ( = ?auto_605241 ?auto_605251 ) ) ( not ( = ?auto_605241 ?auto_605252 ) ) ( not ( = ?auto_605241 ?auto_605253 ) ) ( not ( = ?auto_605241 ?auto_605254 ) ) ( not ( = ?auto_605241 ?auto_605255 ) ) ( not ( = ?auto_605241 ?auto_605256 ) ) ( not ( = ?auto_605241 ?auto_605257 ) ) ( not ( = ?auto_605241 ?auto_605258 ) ) ( not ( = ?auto_605242 ?auto_605243 ) ) ( not ( = ?auto_605242 ?auto_605244 ) ) ( not ( = ?auto_605242 ?auto_605245 ) ) ( not ( = ?auto_605242 ?auto_605246 ) ) ( not ( = ?auto_605242 ?auto_605247 ) ) ( not ( = ?auto_605242 ?auto_605248 ) ) ( not ( = ?auto_605242 ?auto_605249 ) ) ( not ( = ?auto_605242 ?auto_605250 ) ) ( not ( = ?auto_605242 ?auto_605251 ) ) ( not ( = ?auto_605242 ?auto_605252 ) ) ( not ( = ?auto_605242 ?auto_605253 ) ) ( not ( = ?auto_605242 ?auto_605254 ) ) ( not ( = ?auto_605242 ?auto_605255 ) ) ( not ( = ?auto_605242 ?auto_605256 ) ) ( not ( = ?auto_605242 ?auto_605257 ) ) ( not ( = ?auto_605242 ?auto_605258 ) ) ( not ( = ?auto_605243 ?auto_605244 ) ) ( not ( = ?auto_605243 ?auto_605245 ) ) ( not ( = ?auto_605243 ?auto_605246 ) ) ( not ( = ?auto_605243 ?auto_605247 ) ) ( not ( = ?auto_605243 ?auto_605248 ) ) ( not ( = ?auto_605243 ?auto_605249 ) ) ( not ( = ?auto_605243 ?auto_605250 ) ) ( not ( = ?auto_605243 ?auto_605251 ) ) ( not ( = ?auto_605243 ?auto_605252 ) ) ( not ( = ?auto_605243 ?auto_605253 ) ) ( not ( = ?auto_605243 ?auto_605254 ) ) ( not ( = ?auto_605243 ?auto_605255 ) ) ( not ( = ?auto_605243 ?auto_605256 ) ) ( not ( = ?auto_605243 ?auto_605257 ) ) ( not ( = ?auto_605243 ?auto_605258 ) ) ( not ( = ?auto_605244 ?auto_605245 ) ) ( not ( = ?auto_605244 ?auto_605246 ) ) ( not ( = ?auto_605244 ?auto_605247 ) ) ( not ( = ?auto_605244 ?auto_605248 ) ) ( not ( = ?auto_605244 ?auto_605249 ) ) ( not ( = ?auto_605244 ?auto_605250 ) ) ( not ( = ?auto_605244 ?auto_605251 ) ) ( not ( = ?auto_605244 ?auto_605252 ) ) ( not ( = ?auto_605244 ?auto_605253 ) ) ( not ( = ?auto_605244 ?auto_605254 ) ) ( not ( = ?auto_605244 ?auto_605255 ) ) ( not ( = ?auto_605244 ?auto_605256 ) ) ( not ( = ?auto_605244 ?auto_605257 ) ) ( not ( = ?auto_605244 ?auto_605258 ) ) ( not ( = ?auto_605245 ?auto_605246 ) ) ( not ( = ?auto_605245 ?auto_605247 ) ) ( not ( = ?auto_605245 ?auto_605248 ) ) ( not ( = ?auto_605245 ?auto_605249 ) ) ( not ( = ?auto_605245 ?auto_605250 ) ) ( not ( = ?auto_605245 ?auto_605251 ) ) ( not ( = ?auto_605245 ?auto_605252 ) ) ( not ( = ?auto_605245 ?auto_605253 ) ) ( not ( = ?auto_605245 ?auto_605254 ) ) ( not ( = ?auto_605245 ?auto_605255 ) ) ( not ( = ?auto_605245 ?auto_605256 ) ) ( not ( = ?auto_605245 ?auto_605257 ) ) ( not ( = ?auto_605245 ?auto_605258 ) ) ( not ( = ?auto_605246 ?auto_605247 ) ) ( not ( = ?auto_605246 ?auto_605248 ) ) ( not ( = ?auto_605246 ?auto_605249 ) ) ( not ( = ?auto_605246 ?auto_605250 ) ) ( not ( = ?auto_605246 ?auto_605251 ) ) ( not ( = ?auto_605246 ?auto_605252 ) ) ( not ( = ?auto_605246 ?auto_605253 ) ) ( not ( = ?auto_605246 ?auto_605254 ) ) ( not ( = ?auto_605246 ?auto_605255 ) ) ( not ( = ?auto_605246 ?auto_605256 ) ) ( not ( = ?auto_605246 ?auto_605257 ) ) ( not ( = ?auto_605246 ?auto_605258 ) ) ( not ( = ?auto_605247 ?auto_605248 ) ) ( not ( = ?auto_605247 ?auto_605249 ) ) ( not ( = ?auto_605247 ?auto_605250 ) ) ( not ( = ?auto_605247 ?auto_605251 ) ) ( not ( = ?auto_605247 ?auto_605252 ) ) ( not ( = ?auto_605247 ?auto_605253 ) ) ( not ( = ?auto_605247 ?auto_605254 ) ) ( not ( = ?auto_605247 ?auto_605255 ) ) ( not ( = ?auto_605247 ?auto_605256 ) ) ( not ( = ?auto_605247 ?auto_605257 ) ) ( not ( = ?auto_605247 ?auto_605258 ) ) ( not ( = ?auto_605248 ?auto_605249 ) ) ( not ( = ?auto_605248 ?auto_605250 ) ) ( not ( = ?auto_605248 ?auto_605251 ) ) ( not ( = ?auto_605248 ?auto_605252 ) ) ( not ( = ?auto_605248 ?auto_605253 ) ) ( not ( = ?auto_605248 ?auto_605254 ) ) ( not ( = ?auto_605248 ?auto_605255 ) ) ( not ( = ?auto_605248 ?auto_605256 ) ) ( not ( = ?auto_605248 ?auto_605257 ) ) ( not ( = ?auto_605248 ?auto_605258 ) ) ( not ( = ?auto_605249 ?auto_605250 ) ) ( not ( = ?auto_605249 ?auto_605251 ) ) ( not ( = ?auto_605249 ?auto_605252 ) ) ( not ( = ?auto_605249 ?auto_605253 ) ) ( not ( = ?auto_605249 ?auto_605254 ) ) ( not ( = ?auto_605249 ?auto_605255 ) ) ( not ( = ?auto_605249 ?auto_605256 ) ) ( not ( = ?auto_605249 ?auto_605257 ) ) ( not ( = ?auto_605249 ?auto_605258 ) ) ( not ( = ?auto_605250 ?auto_605251 ) ) ( not ( = ?auto_605250 ?auto_605252 ) ) ( not ( = ?auto_605250 ?auto_605253 ) ) ( not ( = ?auto_605250 ?auto_605254 ) ) ( not ( = ?auto_605250 ?auto_605255 ) ) ( not ( = ?auto_605250 ?auto_605256 ) ) ( not ( = ?auto_605250 ?auto_605257 ) ) ( not ( = ?auto_605250 ?auto_605258 ) ) ( not ( = ?auto_605251 ?auto_605252 ) ) ( not ( = ?auto_605251 ?auto_605253 ) ) ( not ( = ?auto_605251 ?auto_605254 ) ) ( not ( = ?auto_605251 ?auto_605255 ) ) ( not ( = ?auto_605251 ?auto_605256 ) ) ( not ( = ?auto_605251 ?auto_605257 ) ) ( not ( = ?auto_605251 ?auto_605258 ) ) ( not ( = ?auto_605252 ?auto_605253 ) ) ( not ( = ?auto_605252 ?auto_605254 ) ) ( not ( = ?auto_605252 ?auto_605255 ) ) ( not ( = ?auto_605252 ?auto_605256 ) ) ( not ( = ?auto_605252 ?auto_605257 ) ) ( not ( = ?auto_605252 ?auto_605258 ) ) ( not ( = ?auto_605253 ?auto_605254 ) ) ( not ( = ?auto_605253 ?auto_605255 ) ) ( not ( = ?auto_605253 ?auto_605256 ) ) ( not ( = ?auto_605253 ?auto_605257 ) ) ( not ( = ?auto_605253 ?auto_605258 ) ) ( not ( = ?auto_605254 ?auto_605255 ) ) ( not ( = ?auto_605254 ?auto_605256 ) ) ( not ( = ?auto_605254 ?auto_605257 ) ) ( not ( = ?auto_605254 ?auto_605258 ) ) ( not ( = ?auto_605255 ?auto_605256 ) ) ( not ( = ?auto_605255 ?auto_605257 ) ) ( not ( = ?auto_605255 ?auto_605258 ) ) ( not ( = ?auto_605256 ?auto_605257 ) ) ( not ( = ?auto_605256 ?auto_605258 ) ) ( not ( = ?auto_605257 ?auto_605258 ) ) ( ON ?auto_605256 ?auto_605257 ) ( ON ?auto_605255 ?auto_605256 ) ( ON ?auto_605254 ?auto_605255 ) ( ON ?auto_605253 ?auto_605254 ) ( ON ?auto_605252 ?auto_605253 ) ( ON ?auto_605251 ?auto_605252 ) ( ON ?auto_605250 ?auto_605251 ) ( ON ?auto_605249 ?auto_605250 ) ( ON ?auto_605248 ?auto_605249 ) ( ON ?auto_605247 ?auto_605248 ) ( ON ?auto_605246 ?auto_605247 ) ( ON ?auto_605245 ?auto_605246 ) ( ON ?auto_605244 ?auto_605245 ) ( ON ?auto_605243 ?auto_605244 ) ( ON ?auto_605242 ?auto_605243 ) ( ON ?auto_605241 ?auto_605242 ) ( CLEAR ?auto_605241 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_605241 )
      ( MAKE-17PILE ?auto_605241 ?auto_605242 ?auto_605243 ?auto_605244 ?auto_605245 ?auto_605246 ?auto_605247 ?auto_605248 ?auto_605249 ?auto_605250 ?auto_605251 ?auto_605252 ?auto_605253 ?auto_605254 ?auto_605255 ?auto_605256 ?auto_605257 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_605276 - BLOCK
      ?auto_605277 - BLOCK
      ?auto_605278 - BLOCK
      ?auto_605279 - BLOCK
      ?auto_605280 - BLOCK
      ?auto_605281 - BLOCK
      ?auto_605282 - BLOCK
      ?auto_605283 - BLOCK
      ?auto_605284 - BLOCK
      ?auto_605285 - BLOCK
      ?auto_605286 - BLOCK
      ?auto_605287 - BLOCK
      ?auto_605288 - BLOCK
      ?auto_605289 - BLOCK
      ?auto_605290 - BLOCK
      ?auto_605291 - BLOCK
      ?auto_605292 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_605292 ) ( not ( = ?auto_605276 ?auto_605277 ) ) ( not ( = ?auto_605276 ?auto_605278 ) ) ( not ( = ?auto_605276 ?auto_605279 ) ) ( not ( = ?auto_605276 ?auto_605280 ) ) ( not ( = ?auto_605276 ?auto_605281 ) ) ( not ( = ?auto_605276 ?auto_605282 ) ) ( not ( = ?auto_605276 ?auto_605283 ) ) ( not ( = ?auto_605276 ?auto_605284 ) ) ( not ( = ?auto_605276 ?auto_605285 ) ) ( not ( = ?auto_605276 ?auto_605286 ) ) ( not ( = ?auto_605276 ?auto_605287 ) ) ( not ( = ?auto_605276 ?auto_605288 ) ) ( not ( = ?auto_605276 ?auto_605289 ) ) ( not ( = ?auto_605276 ?auto_605290 ) ) ( not ( = ?auto_605276 ?auto_605291 ) ) ( not ( = ?auto_605276 ?auto_605292 ) ) ( not ( = ?auto_605277 ?auto_605278 ) ) ( not ( = ?auto_605277 ?auto_605279 ) ) ( not ( = ?auto_605277 ?auto_605280 ) ) ( not ( = ?auto_605277 ?auto_605281 ) ) ( not ( = ?auto_605277 ?auto_605282 ) ) ( not ( = ?auto_605277 ?auto_605283 ) ) ( not ( = ?auto_605277 ?auto_605284 ) ) ( not ( = ?auto_605277 ?auto_605285 ) ) ( not ( = ?auto_605277 ?auto_605286 ) ) ( not ( = ?auto_605277 ?auto_605287 ) ) ( not ( = ?auto_605277 ?auto_605288 ) ) ( not ( = ?auto_605277 ?auto_605289 ) ) ( not ( = ?auto_605277 ?auto_605290 ) ) ( not ( = ?auto_605277 ?auto_605291 ) ) ( not ( = ?auto_605277 ?auto_605292 ) ) ( not ( = ?auto_605278 ?auto_605279 ) ) ( not ( = ?auto_605278 ?auto_605280 ) ) ( not ( = ?auto_605278 ?auto_605281 ) ) ( not ( = ?auto_605278 ?auto_605282 ) ) ( not ( = ?auto_605278 ?auto_605283 ) ) ( not ( = ?auto_605278 ?auto_605284 ) ) ( not ( = ?auto_605278 ?auto_605285 ) ) ( not ( = ?auto_605278 ?auto_605286 ) ) ( not ( = ?auto_605278 ?auto_605287 ) ) ( not ( = ?auto_605278 ?auto_605288 ) ) ( not ( = ?auto_605278 ?auto_605289 ) ) ( not ( = ?auto_605278 ?auto_605290 ) ) ( not ( = ?auto_605278 ?auto_605291 ) ) ( not ( = ?auto_605278 ?auto_605292 ) ) ( not ( = ?auto_605279 ?auto_605280 ) ) ( not ( = ?auto_605279 ?auto_605281 ) ) ( not ( = ?auto_605279 ?auto_605282 ) ) ( not ( = ?auto_605279 ?auto_605283 ) ) ( not ( = ?auto_605279 ?auto_605284 ) ) ( not ( = ?auto_605279 ?auto_605285 ) ) ( not ( = ?auto_605279 ?auto_605286 ) ) ( not ( = ?auto_605279 ?auto_605287 ) ) ( not ( = ?auto_605279 ?auto_605288 ) ) ( not ( = ?auto_605279 ?auto_605289 ) ) ( not ( = ?auto_605279 ?auto_605290 ) ) ( not ( = ?auto_605279 ?auto_605291 ) ) ( not ( = ?auto_605279 ?auto_605292 ) ) ( not ( = ?auto_605280 ?auto_605281 ) ) ( not ( = ?auto_605280 ?auto_605282 ) ) ( not ( = ?auto_605280 ?auto_605283 ) ) ( not ( = ?auto_605280 ?auto_605284 ) ) ( not ( = ?auto_605280 ?auto_605285 ) ) ( not ( = ?auto_605280 ?auto_605286 ) ) ( not ( = ?auto_605280 ?auto_605287 ) ) ( not ( = ?auto_605280 ?auto_605288 ) ) ( not ( = ?auto_605280 ?auto_605289 ) ) ( not ( = ?auto_605280 ?auto_605290 ) ) ( not ( = ?auto_605280 ?auto_605291 ) ) ( not ( = ?auto_605280 ?auto_605292 ) ) ( not ( = ?auto_605281 ?auto_605282 ) ) ( not ( = ?auto_605281 ?auto_605283 ) ) ( not ( = ?auto_605281 ?auto_605284 ) ) ( not ( = ?auto_605281 ?auto_605285 ) ) ( not ( = ?auto_605281 ?auto_605286 ) ) ( not ( = ?auto_605281 ?auto_605287 ) ) ( not ( = ?auto_605281 ?auto_605288 ) ) ( not ( = ?auto_605281 ?auto_605289 ) ) ( not ( = ?auto_605281 ?auto_605290 ) ) ( not ( = ?auto_605281 ?auto_605291 ) ) ( not ( = ?auto_605281 ?auto_605292 ) ) ( not ( = ?auto_605282 ?auto_605283 ) ) ( not ( = ?auto_605282 ?auto_605284 ) ) ( not ( = ?auto_605282 ?auto_605285 ) ) ( not ( = ?auto_605282 ?auto_605286 ) ) ( not ( = ?auto_605282 ?auto_605287 ) ) ( not ( = ?auto_605282 ?auto_605288 ) ) ( not ( = ?auto_605282 ?auto_605289 ) ) ( not ( = ?auto_605282 ?auto_605290 ) ) ( not ( = ?auto_605282 ?auto_605291 ) ) ( not ( = ?auto_605282 ?auto_605292 ) ) ( not ( = ?auto_605283 ?auto_605284 ) ) ( not ( = ?auto_605283 ?auto_605285 ) ) ( not ( = ?auto_605283 ?auto_605286 ) ) ( not ( = ?auto_605283 ?auto_605287 ) ) ( not ( = ?auto_605283 ?auto_605288 ) ) ( not ( = ?auto_605283 ?auto_605289 ) ) ( not ( = ?auto_605283 ?auto_605290 ) ) ( not ( = ?auto_605283 ?auto_605291 ) ) ( not ( = ?auto_605283 ?auto_605292 ) ) ( not ( = ?auto_605284 ?auto_605285 ) ) ( not ( = ?auto_605284 ?auto_605286 ) ) ( not ( = ?auto_605284 ?auto_605287 ) ) ( not ( = ?auto_605284 ?auto_605288 ) ) ( not ( = ?auto_605284 ?auto_605289 ) ) ( not ( = ?auto_605284 ?auto_605290 ) ) ( not ( = ?auto_605284 ?auto_605291 ) ) ( not ( = ?auto_605284 ?auto_605292 ) ) ( not ( = ?auto_605285 ?auto_605286 ) ) ( not ( = ?auto_605285 ?auto_605287 ) ) ( not ( = ?auto_605285 ?auto_605288 ) ) ( not ( = ?auto_605285 ?auto_605289 ) ) ( not ( = ?auto_605285 ?auto_605290 ) ) ( not ( = ?auto_605285 ?auto_605291 ) ) ( not ( = ?auto_605285 ?auto_605292 ) ) ( not ( = ?auto_605286 ?auto_605287 ) ) ( not ( = ?auto_605286 ?auto_605288 ) ) ( not ( = ?auto_605286 ?auto_605289 ) ) ( not ( = ?auto_605286 ?auto_605290 ) ) ( not ( = ?auto_605286 ?auto_605291 ) ) ( not ( = ?auto_605286 ?auto_605292 ) ) ( not ( = ?auto_605287 ?auto_605288 ) ) ( not ( = ?auto_605287 ?auto_605289 ) ) ( not ( = ?auto_605287 ?auto_605290 ) ) ( not ( = ?auto_605287 ?auto_605291 ) ) ( not ( = ?auto_605287 ?auto_605292 ) ) ( not ( = ?auto_605288 ?auto_605289 ) ) ( not ( = ?auto_605288 ?auto_605290 ) ) ( not ( = ?auto_605288 ?auto_605291 ) ) ( not ( = ?auto_605288 ?auto_605292 ) ) ( not ( = ?auto_605289 ?auto_605290 ) ) ( not ( = ?auto_605289 ?auto_605291 ) ) ( not ( = ?auto_605289 ?auto_605292 ) ) ( not ( = ?auto_605290 ?auto_605291 ) ) ( not ( = ?auto_605290 ?auto_605292 ) ) ( not ( = ?auto_605291 ?auto_605292 ) ) ( ON ?auto_605291 ?auto_605292 ) ( ON ?auto_605290 ?auto_605291 ) ( ON ?auto_605289 ?auto_605290 ) ( ON ?auto_605288 ?auto_605289 ) ( ON ?auto_605287 ?auto_605288 ) ( ON ?auto_605286 ?auto_605287 ) ( ON ?auto_605285 ?auto_605286 ) ( ON ?auto_605284 ?auto_605285 ) ( ON ?auto_605283 ?auto_605284 ) ( ON ?auto_605282 ?auto_605283 ) ( ON ?auto_605281 ?auto_605282 ) ( ON ?auto_605280 ?auto_605281 ) ( ON ?auto_605279 ?auto_605280 ) ( ON ?auto_605278 ?auto_605279 ) ( ON ?auto_605277 ?auto_605278 ) ( ON ?auto_605276 ?auto_605277 ) ( CLEAR ?auto_605276 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_605276 )
      ( MAKE-17PILE ?auto_605276 ?auto_605277 ?auto_605278 ?auto_605279 ?auto_605280 ?auto_605281 ?auto_605282 ?auto_605283 ?auto_605284 ?auto_605285 ?auto_605286 ?auto_605287 ?auto_605288 ?auto_605289 ?auto_605290 ?auto_605291 ?auto_605292 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_605310 - BLOCK
      ?auto_605311 - BLOCK
      ?auto_605312 - BLOCK
      ?auto_605313 - BLOCK
      ?auto_605314 - BLOCK
      ?auto_605315 - BLOCK
      ?auto_605316 - BLOCK
      ?auto_605317 - BLOCK
      ?auto_605318 - BLOCK
      ?auto_605319 - BLOCK
      ?auto_605320 - BLOCK
      ?auto_605321 - BLOCK
      ?auto_605322 - BLOCK
      ?auto_605323 - BLOCK
      ?auto_605324 - BLOCK
      ?auto_605325 - BLOCK
      ?auto_605326 - BLOCK
    )
    :vars
    (
      ?auto_605327 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_605310 ?auto_605311 ) ) ( not ( = ?auto_605310 ?auto_605312 ) ) ( not ( = ?auto_605310 ?auto_605313 ) ) ( not ( = ?auto_605310 ?auto_605314 ) ) ( not ( = ?auto_605310 ?auto_605315 ) ) ( not ( = ?auto_605310 ?auto_605316 ) ) ( not ( = ?auto_605310 ?auto_605317 ) ) ( not ( = ?auto_605310 ?auto_605318 ) ) ( not ( = ?auto_605310 ?auto_605319 ) ) ( not ( = ?auto_605310 ?auto_605320 ) ) ( not ( = ?auto_605310 ?auto_605321 ) ) ( not ( = ?auto_605310 ?auto_605322 ) ) ( not ( = ?auto_605310 ?auto_605323 ) ) ( not ( = ?auto_605310 ?auto_605324 ) ) ( not ( = ?auto_605310 ?auto_605325 ) ) ( not ( = ?auto_605310 ?auto_605326 ) ) ( not ( = ?auto_605311 ?auto_605312 ) ) ( not ( = ?auto_605311 ?auto_605313 ) ) ( not ( = ?auto_605311 ?auto_605314 ) ) ( not ( = ?auto_605311 ?auto_605315 ) ) ( not ( = ?auto_605311 ?auto_605316 ) ) ( not ( = ?auto_605311 ?auto_605317 ) ) ( not ( = ?auto_605311 ?auto_605318 ) ) ( not ( = ?auto_605311 ?auto_605319 ) ) ( not ( = ?auto_605311 ?auto_605320 ) ) ( not ( = ?auto_605311 ?auto_605321 ) ) ( not ( = ?auto_605311 ?auto_605322 ) ) ( not ( = ?auto_605311 ?auto_605323 ) ) ( not ( = ?auto_605311 ?auto_605324 ) ) ( not ( = ?auto_605311 ?auto_605325 ) ) ( not ( = ?auto_605311 ?auto_605326 ) ) ( not ( = ?auto_605312 ?auto_605313 ) ) ( not ( = ?auto_605312 ?auto_605314 ) ) ( not ( = ?auto_605312 ?auto_605315 ) ) ( not ( = ?auto_605312 ?auto_605316 ) ) ( not ( = ?auto_605312 ?auto_605317 ) ) ( not ( = ?auto_605312 ?auto_605318 ) ) ( not ( = ?auto_605312 ?auto_605319 ) ) ( not ( = ?auto_605312 ?auto_605320 ) ) ( not ( = ?auto_605312 ?auto_605321 ) ) ( not ( = ?auto_605312 ?auto_605322 ) ) ( not ( = ?auto_605312 ?auto_605323 ) ) ( not ( = ?auto_605312 ?auto_605324 ) ) ( not ( = ?auto_605312 ?auto_605325 ) ) ( not ( = ?auto_605312 ?auto_605326 ) ) ( not ( = ?auto_605313 ?auto_605314 ) ) ( not ( = ?auto_605313 ?auto_605315 ) ) ( not ( = ?auto_605313 ?auto_605316 ) ) ( not ( = ?auto_605313 ?auto_605317 ) ) ( not ( = ?auto_605313 ?auto_605318 ) ) ( not ( = ?auto_605313 ?auto_605319 ) ) ( not ( = ?auto_605313 ?auto_605320 ) ) ( not ( = ?auto_605313 ?auto_605321 ) ) ( not ( = ?auto_605313 ?auto_605322 ) ) ( not ( = ?auto_605313 ?auto_605323 ) ) ( not ( = ?auto_605313 ?auto_605324 ) ) ( not ( = ?auto_605313 ?auto_605325 ) ) ( not ( = ?auto_605313 ?auto_605326 ) ) ( not ( = ?auto_605314 ?auto_605315 ) ) ( not ( = ?auto_605314 ?auto_605316 ) ) ( not ( = ?auto_605314 ?auto_605317 ) ) ( not ( = ?auto_605314 ?auto_605318 ) ) ( not ( = ?auto_605314 ?auto_605319 ) ) ( not ( = ?auto_605314 ?auto_605320 ) ) ( not ( = ?auto_605314 ?auto_605321 ) ) ( not ( = ?auto_605314 ?auto_605322 ) ) ( not ( = ?auto_605314 ?auto_605323 ) ) ( not ( = ?auto_605314 ?auto_605324 ) ) ( not ( = ?auto_605314 ?auto_605325 ) ) ( not ( = ?auto_605314 ?auto_605326 ) ) ( not ( = ?auto_605315 ?auto_605316 ) ) ( not ( = ?auto_605315 ?auto_605317 ) ) ( not ( = ?auto_605315 ?auto_605318 ) ) ( not ( = ?auto_605315 ?auto_605319 ) ) ( not ( = ?auto_605315 ?auto_605320 ) ) ( not ( = ?auto_605315 ?auto_605321 ) ) ( not ( = ?auto_605315 ?auto_605322 ) ) ( not ( = ?auto_605315 ?auto_605323 ) ) ( not ( = ?auto_605315 ?auto_605324 ) ) ( not ( = ?auto_605315 ?auto_605325 ) ) ( not ( = ?auto_605315 ?auto_605326 ) ) ( not ( = ?auto_605316 ?auto_605317 ) ) ( not ( = ?auto_605316 ?auto_605318 ) ) ( not ( = ?auto_605316 ?auto_605319 ) ) ( not ( = ?auto_605316 ?auto_605320 ) ) ( not ( = ?auto_605316 ?auto_605321 ) ) ( not ( = ?auto_605316 ?auto_605322 ) ) ( not ( = ?auto_605316 ?auto_605323 ) ) ( not ( = ?auto_605316 ?auto_605324 ) ) ( not ( = ?auto_605316 ?auto_605325 ) ) ( not ( = ?auto_605316 ?auto_605326 ) ) ( not ( = ?auto_605317 ?auto_605318 ) ) ( not ( = ?auto_605317 ?auto_605319 ) ) ( not ( = ?auto_605317 ?auto_605320 ) ) ( not ( = ?auto_605317 ?auto_605321 ) ) ( not ( = ?auto_605317 ?auto_605322 ) ) ( not ( = ?auto_605317 ?auto_605323 ) ) ( not ( = ?auto_605317 ?auto_605324 ) ) ( not ( = ?auto_605317 ?auto_605325 ) ) ( not ( = ?auto_605317 ?auto_605326 ) ) ( not ( = ?auto_605318 ?auto_605319 ) ) ( not ( = ?auto_605318 ?auto_605320 ) ) ( not ( = ?auto_605318 ?auto_605321 ) ) ( not ( = ?auto_605318 ?auto_605322 ) ) ( not ( = ?auto_605318 ?auto_605323 ) ) ( not ( = ?auto_605318 ?auto_605324 ) ) ( not ( = ?auto_605318 ?auto_605325 ) ) ( not ( = ?auto_605318 ?auto_605326 ) ) ( not ( = ?auto_605319 ?auto_605320 ) ) ( not ( = ?auto_605319 ?auto_605321 ) ) ( not ( = ?auto_605319 ?auto_605322 ) ) ( not ( = ?auto_605319 ?auto_605323 ) ) ( not ( = ?auto_605319 ?auto_605324 ) ) ( not ( = ?auto_605319 ?auto_605325 ) ) ( not ( = ?auto_605319 ?auto_605326 ) ) ( not ( = ?auto_605320 ?auto_605321 ) ) ( not ( = ?auto_605320 ?auto_605322 ) ) ( not ( = ?auto_605320 ?auto_605323 ) ) ( not ( = ?auto_605320 ?auto_605324 ) ) ( not ( = ?auto_605320 ?auto_605325 ) ) ( not ( = ?auto_605320 ?auto_605326 ) ) ( not ( = ?auto_605321 ?auto_605322 ) ) ( not ( = ?auto_605321 ?auto_605323 ) ) ( not ( = ?auto_605321 ?auto_605324 ) ) ( not ( = ?auto_605321 ?auto_605325 ) ) ( not ( = ?auto_605321 ?auto_605326 ) ) ( not ( = ?auto_605322 ?auto_605323 ) ) ( not ( = ?auto_605322 ?auto_605324 ) ) ( not ( = ?auto_605322 ?auto_605325 ) ) ( not ( = ?auto_605322 ?auto_605326 ) ) ( not ( = ?auto_605323 ?auto_605324 ) ) ( not ( = ?auto_605323 ?auto_605325 ) ) ( not ( = ?auto_605323 ?auto_605326 ) ) ( not ( = ?auto_605324 ?auto_605325 ) ) ( not ( = ?auto_605324 ?auto_605326 ) ) ( not ( = ?auto_605325 ?auto_605326 ) ) ( ON ?auto_605310 ?auto_605327 ) ( not ( = ?auto_605326 ?auto_605327 ) ) ( not ( = ?auto_605325 ?auto_605327 ) ) ( not ( = ?auto_605324 ?auto_605327 ) ) ( not ( = ?auto_605323 ?auto_605327 ) ) ( not ( = ?auto_605322 ?auto_605327 ) ) ( not ( = ?auto_605321 ?auto_605327 ) ) ( not ( = ?auto_605320 ?auto_605327 ) ) ( not ( = ?auto_605319 ?auto_605327 ) ) ( not ( = ?auto_605318 ?auto_605327 ) ) ( not ( = ?auto_605317 ?auto_605327 ) ) ( not ( = ?auto_605316 ?auto_605327 ) ) ( not ( = ?auto_605315 ?auto_605327 ) ) ( not ( = ?auto_605314 ?auto_605327 ) ) ( not ( = ?auto_605313 ?auto_605327 ) ) ( not ( = ?auto_605312 ?auto_605327 ) ) ( not ( = ?auto_605311 ?auto_605327 ) ) ( not ( = ?auto_605310 ?auto_605327 ) ) ( ON ?auto_605311 ?auto_605310 ) ( ON ?auto_605312 ?auto_605311 ) ( ON ?auto_605313 ?auto_605312 ) ( ON ?auto_605314 ?auto_605313 ) ( ON ?auto_605315 ?auto_605314 ) ( ON ?auto_605316 ?auto_605315 ) ( ON ?auto_605317 ?auto_605316 ) ( ON ?auto_605318 ?auto_605317 ) ( ON ?auto_605319 ?auto_605318 ) ( ON ?auto_605320 ?auto_605319 ) ( ON ?auto_605321 ?auto_605320 ) ( ON ?auto_605322 ?auto_605321 ) ( ON ?auto_605323 ?auto_605322 ) ( ON ?auto_605324 ?auto_605323 ) ( ON ?auto_605325 ?auto_605324 ) ( ON ?auto_605326 ?auto_605325 ) ( CLEAR ?auto_605326 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-17PILE ?auto_605326 ?auto_605325 ?auto_605324 ?auto_605323 ?auto_605322 ?auto_605321 ?auto_605320 ?auto_605319 ?auto_605318 ?auto_605317 ?auto_605316 ?auto_605315 ?auto_605314 ?auto_605313 ?auto_605312 ?auto_605311 ?auto_605310 )
      ( MAKE-17PILE ?auto_605310 ?auto_605311 ?auto_605312 ?auto_605313 ?auto_605314 ?auto_605315 ?auto_605316 ?auto_605317 ?auto_605318 ?auto_605319 ?auto_605320 ?auto_605321 ?auto_605322 ?auto_605323 ?auto_605324 ?auto_605325 ?auto_605326 ) )
  )

)

