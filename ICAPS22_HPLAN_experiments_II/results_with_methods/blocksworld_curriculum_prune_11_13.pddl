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
      ?auto_134925 - BLOCK
    )
    :vars
    (
      ?auto_134926 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_134925 ?auto_134926 ) ( CLEAR ?auto_134925 ) ( HAND-EMPTY ) ( not ( = ?auto_134925 ?auto_134926 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_134925 ?auto_134926 )
      ( !PUTDOWN ?auto_134925 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_134932 - BLOCK
      ?auto_134933 - BLOCK
    )
    :vars
    (
      ?auto_134934 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_134932 ) ( ON ?auto_134933 ?auto_134934 ) ( CLEAR ?auto_134933 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_134932 ) ( not ( = ?auto_134932 ?auto_134933 ) ) ( not ( = ?auto_134932 ?auto_134934 ) ) ( not ( = ?auto_134933 ?auto_134934 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_134933 ?auto_134934 )
      ( !STACK ?auto_134933 ?auto_134932 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_134942 - BLOCK
      ?auto_134943 - BLOCK
    )
    :vars
    (
      ?auto_134944 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_134943 ?auto_134944 ) ( not ( = ?auto_134942 ?auto_134943 ) ) ( not ( = ?auto_134942 ?auto_134944 ) ) ( not ( = ?auto_134943 ?auto_134944 ) ) ( ON ?auto_134942 ?auto_134943 ) ( CLEAR ?auto_134942 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_134942 )
      ( MAKE-2PILE ?auto_134942 ?auto_134943 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_134953 - BLOCK
      ?auto_134954 - BLOCK
      ?auto_134955 - BLOCK
    )
    :vars
    (
      ?auto_134956 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_134954 ) ( ON ?auto_134955 ?auto_134956 ) ( CLEAR ?auto_134955 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_134953 ) ( ON ?auto_134954 ?auto_134953 ) ( not ( = ?auto_134953 ?auto_134954 ) ) ( not ( = ?auto_134953 ?auto_134955 ) ) ( not ( = ?auto_134953 ?auto_134956 ) ) ( not ( = ?auto_134954 ?auto_134955 ) ) ( not ( = ?auto_134954 ?auto_134956 ) ) ( not ( = ?auto_134955 ?auto_134956 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_134955 ?auto_134956 )
      ( !STACK ?auto_134955 ?auto_134954 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_134967 - BLOCK
      ?auto_134968 - BLOCK
      ?auto_134969 - BLOCK
    )
    :vars
    (
      ?auto_134970 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_134969 ?auto_134970 ) ( ON-TABLE ?auto_134967 ) ( not ( = ?auto_134967 ?auto_134968 ) ) ( not ( = ?auto_134967 ?auto_134969 ) ) ( not ( = ?auto_134967 ?auto_134970 ) ) ( not ( = ?auto_134968 ?auto_134969 ) ) ( not ( = ?auto_134968 ?auto_134970 ) ) ( not ( = ?auto_134969 ?auto_134970 ) ) ( CLEAR ?auto_134967 ) ( ON ?auto_134968 ?auto_134969 ) ( CLEAR ?auto_134968 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_134967 ?auto_134968 )
      ( MAKE-3PILE ?auto_134967 ?auto_134968 ?auto_134969 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_134981 - BLOCK
      ?auto_134982 - BLOCK
      ?auto_134983 - BLOCK
    )
    :vars
    (
      ?auto_134984 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_134983 ?auto_134984 ) ( not ( = ?auto_134981 ?auto_134982 ) ) ( not ( = ?auto_134981 ?auto_134983 ) ) ( not ( = ?auto_134981 ?auto_134984 ) ) ( not ( = ?auto_134982 ?auto_134983 ) ) ( not ( = ?auto_134982 ?auto_134984 ) ) ( not ( = ?auto_134983 ?auto_134984 ) ) ( ON ?auto_134982 ?auto_134983 ) ( ON ?auto_134981 ?auto_134982 ) ( CLEAR ?auto_134981 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_134981 )
      ( MAKE-3PILE ?auto_134981 ?auto_134982 ?auto_134983 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_134996 - BLOCK
      ?auto_134997 - BLOCK
      ?auto_134998 - BLOCK
      ?auto_134999 - BLOCK
    )
    :vars
    (
      ?auto_135000 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_134998 ) ( ON ?auto_134999 ?auto_135000 ) ( CLEAR ?auto_134999 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_134996 ) ( ON ?auto_134997 ?auto_134996 ) ( ON ?auto_134998 ?auto_134997 ) ( not ( = ?auto_134996 ?auto_134997 ) ) ( not ( = ?auto_134996 ?auto_134998 ) ) ( not ( = ?auto_134996 ?auto_134999 ) ) ( not ( = ?auto_134996 ?auto_135000 ) ) ( not ( = ?auto_134997 ?auto_134998 ) ) ( not ( = ?auto_134997 ?auto_134999 ) ) ( not ( = ?auto_134997 ?auto_135000 ) ) ( not ( = ?auto_134998 ?auto_134999 ) ) ( not ( = ?auto_134998 ?auto_135000 ) ) ( not ( = ?auto_134999 ?auto_135000 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_134999 ?auto_135000 )
      ( !STACK ?auto_134999 ?auto_134998 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_135014 - BLOCK
      ?auto_135015 - BLOCK
      ?auto_135016 - BLOCK
      ?auto_135017 - BLOCK
    )
    :vars
    (
      ?auto_135018 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_135017 ?auto_135018 ) ( ON-TABLE ?auto_135014 ) ( ON ?auto_135015 ?auto_135014 ) ( not ( = ?auto_135014 ?auto_135015 ) ) ( not ( = ?auto_135014 ?auto_135016 ) ) ( not ( = ?auto_135014 ?auto_135017 ) ) ( not ( = ?auto_135014 ?auto_135018 ) ) ( not ( = ?auto_135015 ?auto_135016 ) ) ( not ( = ?auto_135015 ?auto_135017 ) ) ( not ( = ?auto_135015 ?auto_135018 ) ) ( not ( = ?auto_135016 ?auto_135017 ) ) ( not ( = ?auto_135016 ?auto_135018 ) ) ( not ( = ?auto_135017 ?auto_135018 ) ) ( CLEAR ?auto_135015 ) ( ON ?auto_135016 ?auto_135017 ) ( CLEAR ?auto_135016 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_135014 ?auto_135015 ?auto_135016 )
      ( MAKE-4PILE ?auto_135014 ?auto_135015 ?auto_135016 ?auto_135017 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_135032 - BLOCK
      ?auto_135033 - BLOCK
      ?auto_135034 - BLOCK
      ?auto_135035 - BLOCK
    )
    :vars
    (
      ?auto_135036 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_135035 ?auto_135036 ) ( ON-TABLE ?auto_135032 ) ( not ( = ?auto_135032 ?auto_135033 ) ) ( not ( = ?auto_135032 ?auto_135034 ) ) ( not ( = ?auto_135032 ?auto_135035 ) ) ( not ( = ?auto_135032 ?auto_135036 ) ) ( not ( = ?auto_135033 ?auto_135034 ) ) ( not ( = ?auto_135033 ?auto_135035 ) ) ( not ( = ?auto_135033 ?auto_135036 ) ) ( not ( = ?auto_135034 ?auto_135035 ) ) ( not ( = ?auto_135034 ?auto_135036 ) ) ( not ( = ?auto_135035 ?auto_135036 ) ) ( ON ?auto_135034 ?auto_135035 ) ( CLEAR ?auto_135032 ) ( ON ?auto_135033 ?auto_135034 ) ( CLEAR ?auto_135033 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_135032 ?auto_135033 )
      ( MAKE-4PILE ?auto_135032 ?auto_135033 ?auto_135034 ?auto_135035 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_135050 - BLOCK
      ?auto_135051 - BLOCK
      ?auto_135052 - BLOCK
      ?auto_135053 - BLOCK
    )
    :vars
    (
      ?auto_135054 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_135053 ?auto_135054 ) ( not ( = ?auto_135050 ?auto_135051 ) ) ( not ( = ?auto_135050 ?auto_135052 ) ) ( not ( = ?auto_135050 ?auto_135053 ) ) ( not ( = ?auto_135050 ?auto_135054 ) ) ( not ( = ?auto_135051 ?auto_135052 ) ) ( not ( = ?auto_135051 ?auto_135053 ) ) ( not ( = ?auto_135051 ?auto_135054 ) ) ( not ( = ?auto_135052 ?auto_135053 ) ) ( not ( = ?auto_135052 ?auto_135054 ) ) ( not ( = ?auto_135053 ?auto_135054 ) ) ( ON ?auto_135052 ?auto_135053 ) ( ON ?auto_135051 ?auto_135052 ) ( ON ?auto_135050 ?auto_135051 ) ( CLEAR ?auto_135050 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_135050 )
      ( MAKE-4PILE ?auto_135050 ?auto_135051 ?auto_135052 ?auto_135053 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_135069 - BLOCK
      ?auto_135070 - BLOCK
      ?auto_135071 - BLOCK
      ?auto_135072 - BLOCK
      ?auto_135073 - BLOCK
    )
    :vars
    (
      ?auto_135074 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_135072 ) ( ON ?auto_135073 ?auto_135074 ) ( CLEAR ?auto_135073 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_135069 ) ( ON ?auto_135070 ?auto_135069 ) ( ON ?auto_135071 ?auto_135070 ) ( ON ?auto_135072 ?auto_135071 ) ( not ( = ?auto_135069 ?auto_135070 ) ) ( not ( = ?auto_135069 ?auto_135071 ) ) ( not ( = ?auto_135069 ?auto_135072 ) ) ( not ( = ?auto_135069 ?auto_135073 ) ) ( not ( = ?auto_135069 ?auto_135074 ) ) ( not ( = ?auto_135070 ?auto_135071 ) ) ( not ( = ?auto_135070 ?auto_135072 ) ) ( not ( = ?auto_135070 ?auto_135073 ) ) ( not ( = ?auto_135070 ?auto_135074 ) ) ( not ( = ?auto_135071 ?auto_135072 ) ) ( not ( = ?auto_135071 ?auto_135073 ) ) ( not ( = ?auto_135071 ?auto_135074 ) ) ( not ( = ?auto_135072 ?auto_135073 ) ) ( not ( = ?auto_135072 ?auto_135074 ) ) ( not ( = ?auto_135073 ?auto_135074 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_135073 ?auto_135074 )
      ( !STACK ?auto_135073 ?auto_135072 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_135091 - BLOCK
      ?auto_135092 - BLOCK
      ?auto_135093 - BLOCK
      ?auto_135094 - BLOCK
      ?auto_135095 - BLOCK
    )
    :vars
    (
      ?auto_135096 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_135095 ?auto_135096 ) ( ON-TABLE ?auto_135091 ) ( ON ?auto_135092 ?auto_135091 ) ( ON ?auto_135093 ?auto_135092 ) ( not ( = ?auto_135091 ?auto_135092 ) ) ( not ( = ?auto_135091 ?auto_135093 ) ) ( not ( = ?auto_135091 ?auto_135094 ) ) ( not ( = ?auto_135091 ?auto_135095 ) ) ( not ( = ?auto_135091 ?auto_135096 ) ) ( not ( = ?auto_135092 ?auto_135093 ) ) ( not ( = ?auto_135092 ?auto_135094 ) ) ( not ( = ?auto_135092 ?auto_135095 ) ) ( not ( = ?auto_135092 ?auto_135096 ) ) ( not ( = ?auto_135093 ?auto_135094 ) ) ( not ( = ?auto_135093 ?auto_135095 ) ) ( not ( = ?auto_135093 ?auto_135096 ) ) ( not ( = ?auto_135094 ?auto_135095 ) ) ( not ( = ?auto_135094 ?auto_135096 ) ) ( not ( = ?auto_135095 ?auto_135096 ) ) ( CLEAR ?auto_135093 ) ( ON ?auto_135094 ?auto_135095 ) ( CLEAR ?auto_135094 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_135091 ?auto_135092 ?auto_135093 ?auto_135094 )
      ( MAKE-5PILE ?auto_135091 ?auto_135092 ?auto_135093 ?auto_135094 ?auto_135095 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_135113 - BLOCK
      ?auto_135114 - BLOCK
      ?auto_135115 - BLOCK
      ?auto_135116 - BLOCK
      ?auto_135117 - BLOCK
    )
    :vars
    (
      ?auto_135118 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_135117 ?auto_135118 ) ( ON-TABLE ?auto_135113 ) ( ON ?auto_135114 ?auto_135113 ) ( not ( = ?auto_135113 ?auto_135114 ) ) ( not ( = ?auto_135113 ?auto_135115 ) ) ( not ( = ?auto_135113 ?auto_135116 ) ) ( not ( = ?auto_135113 ?auto_135117 ) ) ( not ( = ?auto_135113 ?auto_135118 ) ) ( not ( = ?auto_135114 ?auto_135115 ) ) ( not ( = ?auto_135114 ?auto_135116 ) ) ( not ( = ?auto_135114 ?auto_135117 ) ) ( not ( = ?auto_135114 ?auto_135118 ) ) ( not ( = ?auto_135115 ?auto_135116 ) ) ( not ( = ?auto_135115 ?auto_135117 ) ) ( not ( = ?auto_135115 ?auto_135118 ) ) ( not ( = ?auto_135116 ?auto_135117 ) ) ( not ( = ?auto_135116 ?auto_135118 ) ) ( not ( = ?auto_135117 ?auto_135118 ) ) ( ON ?auto_135116 ?auto_135117 ) ( CLEAR ?auto_135114 ) ( ON ?auto_135115 ?auto_135116 ) ( CLEAR ?auto_135115 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_135113 ?auto_135114 ?auto_135115 )
      ( MAKE-5PILE ?auto_135113 ?auto_135114 ?auto_135115 ?auto_135116 ?auto_135117 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_135135 - BLOCK
      ?auto_135136 - BLOCK
      ?auto_135137 - BLOCK
      ?auto_135138 - BLOCK
      ?auto_135139 - BLOCK
    )
    :vars
    (
      ?auto_135140 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_135139 ?auto_135140 ) ( ON-TABLE ?auto_135135 ) ( not ( = ?auto_135135 ?auto_135136 ) ) ( not ( = ?auto_135135 ?auto_135137 ) ) ( not ( = ?auto_135135 ?auto_135138 ) ) ( not ( = ?auto_135135 ?auto_135139 ) ) ( not ( = ?auto_135135 ?auto_135140 ) ) ( not ( = ?auto_135136 ?auto_135137 ) ) ( not ( = ?auto_135136 ?auto_135138 ) ) ( not ( = ?auto_135136 ?auto_135139 ) ) ( not ( = ?auto_135136 ?auto_135140 ) ) ( not ( = ?auto_135137 ?auto_135138 ) ) ( not ( = ?auto_135137 ?auto_135139 ) ) ( not ( = ?auto_135137 ?auto_135140 ) ) ( not ( = ?auto_135138 ?auto_135139 ) ) ( not ( = ?auto_135138 ?auto_135140 ) ) ( not ( = ?auto_135139 ?auto_135140 ) ) ( ON ?auto_135138 ?auto_135139 ) ( ON ?auto_135137 ?auto_135138 ) ( CLEAR ?auto_135135 ) ( ON ?auto_135136 ?auto_135137 ) ( CLEAR ?auto_135136 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_135135 ?auto_135136 )
      ( MAKE-5PILE ?auto_135135 ?auto_135136 ?auto_135137 ?auto_135138 ?auto_135139 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_135157 - BLOCK
      ?auto_135158 - BLOCK
      ?auto_135159 - BLOCK
      ?auto_135160 - BLOCK
      ?auto_135161 - BLOCK
    )
    :vars
    (
      ?auto_135162 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_135161 ?auto_135162 ) ( not ( = ?auto_135157 ?auto_135158 ) ) ( not ( = ?auto_135157 ?auto_135159 ) ) ( not ( = ?auto_135157 ?auto_135160 ) ) ( not ( = ?auto_135157 ?auto_135161 ) ) ( not ( = ?auto_135157 ?auto_135162 ) ) ( not ( = ?auto_135158 ?auto_135159 ) ) ( not ( = ?auto_135158 ?auto_135160 ) ) ( not ( = ?auto_135158 ?auto_135161 ) ) ( not ( = ?auto_135158 ?auto_135162 ) ) ( not ( = ?auto_135159 ?auto_135160 ) ) ( not ( = ?auto_135159 ?auto_135161 ) ) ( not ( = ?auto_135159 ?auto_135162 ) ) ( not ( = ?auto_135160 ?auto_135161 ) ) ( not ( = ?auto_135160 ?auto_135162 ) ) ( not ( = ?auto_135161 ?auto_135162 ) ) ( ON ?auto_135160 ?auto_135161 ) ( ON ?auto_135159 ?auto_135160 ) ( ON ?auto_135158 ?auto_135159 ) ( ON ?auto_135157 ?auto_135158 ) ( CLEAR ?auto_135157 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_135157 )
      ( MAKE-5PILE ?auto_135157 ?auto_135158 ?auto_135159 ?auto_135160 ?auto_135161 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_135180 - BLOCK
      ?auto_135181 - BLOCK
      ?auto_135182 - BLOCK
      ?auto_135183 - BLOCK
      ?auto_135184 - BLOCK
      ?auto_135185 - BLOCK
    )
    :vars
    (
      ?auto_135186 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_135184 ) ( ON ?auto_135185 ?auto_135186 ) ( CLEAR ?auto_135185 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_135180 ) ( ON ?auto_135181 ?auto_135180 ) ( ON ?auto_135182 ?auto_135181 ) ( ON ?auto_135183 ?auto_135182 ) ( ON ?auto_135184 ?auto_135183 ) ( not ( = ?auto_135180 ?auto_135181 ) ) ( not ( = ?auto_135180 ?auto_135182 ) ) ( not ( = ?auto_135180 ?auto_135183 ) ) ( not ( = ?auto_135180 ?auto_135184 ) ) ( not ( = ?auto_135180 ?auto_135185 ) ) ( not ( = ?auto_135180 ?auto_135186 ) ) ( not ( = ?auto_135181 ?auto_135182 ) ) ( not ( = ?auto_135181 ?auto_135183 ) ) ( not ( = ?auto_135181 ?auto_135184 ) ) ( not ( = ?auto_135181 ?auto_135185 ) ) ( not ( = ?auto_135181 ?auto_135186 ) ) ( not ( = ?auto_135182 ?auto_135183 ) ) ( not ( = ?auto_135182 ?auto_135184 ) ) ( not ( = ?auto_135182 ?auto_135185 ) ) ( not ( = ?auto_135182 ?auto_135186 ) ) ( not ( = ?auto_135183 ?auto_135184 ) ) ( not ( = ?auto_135183 ?auto_135185 ) ) ( not ( = ?auto_135183 ?auto_135186 ) ) ( not ( = ?auto_135184 ?auto_135185 ) ) ( not ( = ?auto_135184 ?auto_135186 ) ) ( not ( = ?auto_135185 ?auto_135186 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_135185 ?auto_135186 )
      ( !STACK ?auto_135185 ?auto_135184 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_135206 - BLOCK
      ?auto_135207 - BLOCK
      ?auto_135208 - BLOCK
      ?auto_135209 - BLOCK
      ?auto_135210 - BLOCK
      ?auto_135211 - BLOCK
    )
    :vars
    (
      ?auto_135212 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_135211 ?auto_135212 ) ( ON-TABLE ?auto_135206 ) ( ON ?auto_135207 ?auto_135206 ) ( ON ?auto_135208 ?auto_135207 ) ( ON ?auto_135209 ?auto_135208 ) ( not ( = ?auto_135206 ?auto_135207 ) ) ( not ( = ?auto_135206 ?auto_135208 ) ) ( not ( = ?auto_135206 ?auto_135209 ) ) ( not ( = ?auto_135206 ?auto_135210 ) ) ( not ( = ?auto_135206 ?auto_135211 ) ) ( not ( = ?auto_135206 ?auto_135212 ) ) ( not ( = ?auto_135207 ?auto_135208 ) ) ( not ( = ?auto_135207 ?auto_135209 ) ) ( not ( = ?auto_135207 ?auto_135210 ) ) ( not ( = ?auto_135207 ?auto_135211 ) ) ( not ( = ?auto_135207 ?auto_135212 ) ) ( not ( = ?auto_135208 ?auto_135209 ) ) ( not ( = ?auto_135208 ?auto_135210 ) ) ( not ( = ?auto_135208 ?auto_135211 ) ) ( not ( = ?auto_135208 ?auto_135212 ) ) ( not ( = ?auto_135209 ?auto_135210 ) ) ( not ( = ?auto_135209 ?auto_135211 ) ) ( not ( = ?auto_135209 ?auto_135212 ) ) ( not ( = ?auto_135210 ?auto_135211 ) ) ( not ( = ?auto_135210 ?auto_135212 ) ) ( not ( = ?auto_135211 ?auto_135212 ) ) ( CLEAR ?auto_135209 ) ( ON ?auto_135210 ?auto_135211 ) ( CLEAR ?auto_135210 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_135206 ?auto_135207 ?auto_135208 ?auto_135209 ?auto_135210 )
      ( MAKE-6PILE ?auto_135206 ?auto_135207 ?auto_135208 ?auto_135209 ?auto_135210 ?auto_135211 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_135232 - BLOCK
      ?auto_135233 - BLOCK
      ?auto_135234 - BLOCK
      ?auto_135235 - BLOCK
      ?auto_135236 - BLOCK
      ?auto_135237 - BLOCK
    )
    :vars
    (
      ?auto_135238 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_135237 ?auto_135238 ) ( ON-TABLE ?auto_135232 ) ( ON ?auto_135233 ?auto_135232 ) ( ON ?auto_135234 ?auto_135233 ) ( not ( = ?auto_135232 ?auto_135233 ) ) ( not ( = ?auto_135232 ?auto_135234 ) ) ( not ( = ?auto_135232 ?auto_135235 ) ) ( not ( = ?auto_135232 ?auto_135236 ) ) ( not ( = ?auto_135232 ?auto_135237 ) ) ( not ( = ?auto_135232 ?auto_135238 ) ) ( not ( = ?auto_135233 ?auto_135234 ) ) ( not ( = ?auto_135233 ?auto_135235 ) ) ( not ( = ?auto_135233 ?auto_135236 ) ) ( not ( = ?auto_135233 ?auto_135237 ) ) ( not ( = ?auto_135233 ?auto_135238 ) ) ( not ( = ?auto_135234 ?auto_135235 ) ) ( not ( = ?auto_135234 ?auto_135236 ) ) ( not ( = ?auto_135234 ?auto_135237 ) ) ( not ( = ?auto_135234 ?auto_135238 ) ) ( not ( = ?auto_135235 ?auto_135236 ) ) ( not ( = ?auto_135235 ?auto_135237 ) ) ( not ( = ?auto_135235 ?auto_135238 ) ) ( not ( = ?auto_135236 ?auto_135237 ) ) ( not ( = ?auto_135236 ?auto_135238 ) ) ( not ( = ?auto_135237 ?auto_135238 ) ) ( ON ?auto_135236 ?auto_135237 ) ( CLEAR ?auto_135234 ) ( ON ?auto_135235 ?auto_135236 ) ( CLEAR ?auto_135235 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_135232 ?auto_135233 ?auto_135234 ?auto_135235 )
      ( MAKE-6PILE ?auto_135232 ?auto_135233 ?auto_135234 ?auto_135235 ?auto_135236 ?auto_135237 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_135258 - BLOCK
      ?auto_135259 - BLOCK
      ?auto_135260 - BLOCK
      ?auto_135261 - BLOCK
      ?auto_135262 - BLOCK
      ?auto_135263 - BLOCK
    )
    :vars
    (
      ?auto_135264 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_135263 ?auto_135264 ) ( ON-TABLE ?auto_135258 ) ( ON ?auto_135259 ?auto_135258 ) ( not ( = ?auto_135258 ?auto_135259 ) ) ( not ( = ?auto_135258 ?auto_135260 ) ) ( not ( = ?auto_135258 ?auto_135261 ) ) ( not ( = ?auto_135258 ?auto_135262 ) ) ( not ( = ?auto_135258 ?auto_135263 ) ) ( not ( = ?auto_135258 ?auto_135264 ) ) ( not ( = ?auto_135259 ?auto_135260 ) ) ( not ( = ?auto_135259 ?auto_135261 ) ) ( not ( = ?auto_135259 ?auto_135262 ) ) ( not ( = ?auto_135259 ?auto_135263 ) ) ( not ( = ?auto_135259 ?auto_135264 ) ) ( not ( = ?auto_135260 ?auto_135261 ) ) ( not ( = ?auto_135260 ?auto_135262 ) ) ( not ( = ?auto_135260 ?auto_135263 ) ) ( not ( = ?auto_135260 ?auto_135264 ) ) ( not ( = ?auto_135261 ?auto_135262 ) ) ( not ( = ?auto_135261 ?auto_135263 ) ) ( not ( = ?auto_135261 ?auto_135264 ) ) ( not ( = ?auto_135262 ?auto_135263 ) ) ( not ( = ?auto_135262 ?auto_135264 ) ) ( not ( = ?auto_135263 ?auto_135264 ) ) ( ON ?auto_135262 ?auto_135263 ) ( ON ?auto_135261 ?auto_135262 ) ( CLEAR ?auto_135259 ) ( ON ?auto_135260 ?auto_135261 ) ( CLEAR ?auto_135260 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_135258 ?auto_135259 ?auto_135260 )
      ( MAKE-6PILE ?auto_135258 ?auto_135259 ?auto_135260 ?auto_135261 ?auto_135262 ?auto_135263 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_135284 - BLOCK
      ?auto_135285 - BLOCK
      ?auto_135286 - BLOCK
      ?auto_135287 - BLOCK
      ?auto_135288 - BLOCK
      ?auto_135289 - BLOCK
    )
    :vars
    (
      ?auto_135290 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_135289 ?auto_135290 ) ( ON-TABLE ?auto_135284 ) ( not ( = ?auto_135284 ?auto_135285 ) ) ( not ( = ?auto_135284 ?auto_135286 ) ) ( not ( = ?auto_135284 ?auto_135287 ) ) ( not ( = ?auto_135284 ?auto_135288 ) ) ( not ( = ?auto_135284 ?auto_135289 ) ) ( not ( = ?auto_135284 ?auto_135290 ) ) ( not ( = ?auto_135285 ?auto_135286 ) ) ( not ( = ?auto_135285 ?auto_135287 ) ) ( not ( = ?auto_135285 ?auto_135288 ) ) ( not ( = ?auto_135285 ?auto_135289 ) ) ( not ( = ?auto_135285 ?auto_135290 ) ) ( not ( = ?auto_135286 ?auto_135287 ) ) ( not ( = ?auto_135286 ?auto_135288 ) ) ( not ( = ?auto_135286 ?auto_135289 ) ) ( not ( = ?auto_135286 ?auto_135290 ) ) ( not ( = ?auto_135287 ?auto_135288 ) ) ( not ( = ?auto_135287 ?auto_135289 ) ) ( not ( = ?auto_135287 ?auto_135290 ) ) ( not ( = ?auto_135288 ?auto_135289 ) ) ( not ( = ?auto_135288 ?auto_135290 ) ) ( not ( = ?auto_135289 ?auto_135290 ) ) ( ON ?auto_135288 ?auto_135289 ) ( ON ?auto_135287 ?auto_135288 ) ( ON ?auto_135286 ?auto_135287 ) ( CLEAR ?auto_135284 ) ( ON ?auto_135285 ?auto_135286 ) ( CLEAR ?auto_135285 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_135284 ?auto_135285 )
      ( MAKE-6PILE ?auto_135284 ?auto_135285 ?auto_135286 ?auto_135287 ?auto_135288 ?auto_135289 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_135310 - BLOCK
      ?auto_135311 - BLOCK
      ?auto_135312 - BLOCK
      ?auto_135313 - BLOCK
      ?auto_135314 - BLOCK
      ?auto_135315 - BLOCK
    )
    :vars
    (
      ?auto_135316 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_135315 ?auto_135316 ) ( not ( = ?auto_135310 ?auto_135311 ) ) ( not ( = ?auto_135310 ?auto_135312 ) ) ( not ( = ?auto_135310 ?auto_135313 ) ) ( not ( = ?auto_135310 ?auto_135314 ) ) ( not ( = ?auto_135310 ?auto_135315 ) ) ( not ( = ?auto_135310 ?auto_135316 ) ) ( not ( = ?auto_135311 ?auto_135312 ) ) ( not ( = ?auto_135311 ?auto_135313 ) ) ( not ( = ?auto_135311 ?auto_135314 ) ) ( not ( = ?auto_135311 ?auto_135315 ) ) ( not ( = ?auto_135311 ?auto_135316 ) ) ( not ( = ?auto_135312 ?auto_135313 ) ) ( not ( = ?auto_135312 ?auto_135314 ) ) ( not ( = ?auto_135312 ?auto_135315 ) ) ( not ( = ?auto_135312 ?auto_135316 ) ) ( not ( = ?auto_135313 ?auto_135314 ) ) ( not ( = ?auto_135313 ?auto_135315 ) ) ( not ( = ?auto_135313 ?auto_135316 ) ) ( not ( = ?auto_135314 ?auto_135315 ) ) ( not ( = ?auto_135314 ?auto_135316 ) ) ( not ( = ?auto_135315 ?auto_135316 ) ) ( ON ?auto_135314 ?auto_135315 ) ( ON ?auto_135313 ?auto_135314 ) ( ON ?auto_135312 ?auto_135313 ) ( ON ?auto_135311 ?auto_135312 ) ( ON ?auto_135310 ?auto_135311 ) ( CLEAR ?auto_135310 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_135310 )
      ( MAKE-6PILE ?auto_135310 ?auto_135311 ?auto_135312 ?auto_135313 ?auto_135314 ?auto_135315 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_135337 - BLOCK
      ?auto_135338 - BLOCK
      ?auto_135339 - BLOCK
      ?auto_135340 - BLOCK
      ?auto_135341 - BLOCK
      ?auto_135342 - BLOCK
      ?auto_135343 - BLOCK
    )
    :vars
    (
      ?auto_135344 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_135342 ) ( ON ?auto_135343 ?auto_135344 ) ( CLEAR ?auto_135343 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_135337 ) ( ON ?auto_135338 ?auto_135337 ) ( ON ?auto_135339 ?auto_135338 ) ( ON ?auto_135340 ?auto_135339 ) ( ON ?auto_135341 ?auto_135340 ) ( ON ?auto_135342 ?auto_135341 ) ( not ( = ?auto_135337 ?auto_135338 ) ) ( not ( = ?auto_135337 ?auto_135339 ) ) ( not ( = ?auto_135337 ?auto_135340 ) ) ( not ( = ?auto_135337 ?auto_135341 ) ) ( not ( = ?auto_135337 ?auto_135342 ) ) ( not ( = ?auto_135337 ?auto_135343 ) ) ( not ( = ?auto_135337 ?auto_135344 ) ) ( not ( = ?auto_135338 ?auto_135339 ) ) ( not ( = ?auto_135338 ?auto_135340 ) ) ( not ( = ?auto_135338 ?auto_135341 ) ) ( not ( = ?auto_135338 ?auto_135342 ) ) ( not ( = ?auto_135338 ?auto_135343 ) ) ( not ( = ?auto_135338 ?auto_135344 ) ) ( not ( = ?auto_135339 ?auto_135340 ) ) ( not ( = ?auto_135339 ?auto_135341 ) ) ( not ( = ?auto_135339 ?auto_135342 ) ) ( not ( = ?auto_135339 ?auto_135343 ) ) ( not ( = ?auto_135339 ?auto_135344 ) ) ( not ( = ?auto_135340 ?auto_135341 ) ) ( not ( = ?auto_135340 ?auto_135342 ) ) ( not ( = ?auto_135340 ?auto_135343 ) ) ( not ( = ?auto_135340 ?auto_135344 ) ) ( not ( = ?auto_135341 ?auto_135342 ) ) ( not ( = ?auto_135341 ?auto_135343 ) ) ( not ( = ?auto_135341 ?auto_135344 ) ) ( not ( = ?auto_135342 ?auto_135343 ) ) ( not ( = ?auto_135342 ?auto_135344 ) ) ( not ( = ?auto_135343 ?auto_135344 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_135343 ?auto_135344 )
      ( !STACK ?auto_135343 ?auto_135342 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_135367 - BLOCK
      ?auto_135368 - BLOCK
      ?auto_135369 - BLOCK
      ?auto_135370 - BLOCK
      ?auto_135371 - BLOCK
      ?auto_135372 - BLOCK
      ?auto_135373 - BLOCK
    )
    :vars
    (
      ?auto_135374 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_135373 ?auto_135374 ) ( ON-TABLE ?auto_135367 ) ( ON ?auto_135368 ?auto_135367 ) ( ON ?auto_135369 ?auto_135368 ) ( ON ?auto_135370 ?auto_135369 ) ( ON ?auto_135371 ?auto_135370 ) ( not ( = ?auto_135367 ?auto_135368 ) ) ( not ( = ?auto_135367 ?auto_135369 ) ) ( not ( = ?auto_135367 ?auto_135370 ) ) ( not ( = ?auto_135367 ?auto_135371 ) ) ( not ( = ?auto_135367 ?auto_135372 ) ) ( not ( = ?auto_135367 ?auto_135373 ) ) ( not ( = ?auto_135367 ?auto_135374 ) ) ( not ( = ?auto_135368 ?auto_135369 ) ) ( not ( = ?auto_135368 ?auto_135370 ) ) ( not ( = ?auto_135368 ?auto_135371 ) ) ( not ( = ?auto_135368 ?auto_135372 ) ) ( not ( = ?auto_135368 ?auto_135373 ) ) ( not ( = ?auto_135368 ?auto_135374 ) ) ( not ( = ?auto_135369 ?auto_135370 ) ) ( not ( = ?auto_135369 ?auto_135371 ) ) ( not ( = ?auto_135369 ?auto_135372 ) ) ( not ( = ?auto_135369 ?auto_135373 ) ) ( not ( = ?auto_135369 ?auto_135374 ) ) ( not ( = ?auto_135370 ?auto_135371 ) ) ( not ( = ?auto_135370 ?auto_135372 ) ) ( not ( = ?auto_135370 ?auto_135373 ) ) ( not ( = ?auto_135370 ?auto_135374 ) ) ( not ( = ?auto_135371 ?auto_135372 ) ) ( not ( = ?auto_135371 ?auto_135373 ) ) ( not ( = ?auto_135371 ?auto_135374 ) ) ( not ( = ?auto_135372 ?auto_135373 ) ) ( not ( = ?auto_135372 ?auto_135374 ) ) ( not ( = ?auto_135373 ?auto_135374 ) ) ( CLEAR ?auto_135371 ) ( ON ?auto_135372 ?auto_135373 ) ( CLEAR ?auto_135372 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_135367 ?auto_135368 ?auto_135369 ?auto_135370 ?auto_135371 ?auto_135372 )
      ( MAKE-7PILE ?auto_135367 ?auto_135368 ?auto_135369 ?auto_135370 ?auto_135371 ?auto_135372 ?auto_135373 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_135397 - BLOCK
      ?auto_135398 - BLOCK
      ?auto_135399 - BLOCK
      ?auto_135400 - BLOCK
      ?auto_135401 - BLOCK
      ?auto_135402 - BLOCK
      ?auto_135403 - BLOCK
    )
    :vars
    (
      ?auto_135404 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_135403 ?auto_135404 ) ( ON-TABLE ?auto_135397 ) ( ON ?auto_135398 ?auto_135397 ) ( ON ?auto_135399 ?auto_135398 ) ( ON ?auto_135400 ?auto_135399 ) ( not ( = ?auto_135397 ?auto_135398 ) ) ( not ( = ?auto_135397 ?auto_135399 ) ) ( not ( = ?auto_135397 ?auto_135400 ) ) ( not ( = ?auto_135397 ?auto_135401 ) ) ( not ( = ?auto_135397 ?auto_135402 ) ) ( not ( = ?auto_135397 ?auto_135403 ) ) ( not ( = ?auto_135397 ?auto_135404 ) ) ( not ( = ?auto_135398 ?auto_135399 ) ) ( not ( = ?auto_135398 ?auto_135400 ) ) ( not ( = ?auto_135398 ?auto_135401 ) ) ( not ( = ?auto_135398 ?auto_135402 ) ) ( not ( = ?auto_135398 ?auto_135403 ) ) ( not ( = ?auto_135398 ?auto_135404 ) ) ( not ( = ?auto_135399 ?auto_135400 ) ) ( not ( = ?auto_135399 ?auto_135401 ) ) ( not ( = ?auto_135399 ?auto_135402 ) ) ( not ( = ?auto_135399 ?auto_135403 ) ) ( not ( = ?auto_135399 ?auto_135404 ) ) ( not ( = ?auto_135400 ?auto_135401 ) ) ( not ( = ?auto_135400 ?auto_135402 ) ) ( not ( = ?auto_135400 ?auto_135403 ) ) ( not ( = ?auto_135400 ?auto_135404 ) ) ( not ( = ?auto_135401 ?auto_135402 ) ) ( not ( = ?auto_135401 ?auto_135403 ) ) ( not ( = ?auto_135401 ?auto_135404 ) ) ( not ( = ?auto_135402 ?auto_135403 ) ) ( not ( = ?auto_135402 ?auto_135404 ) ) ( not ( = ?auto_135403 ?auto_135404 ) ) ( ON ?auto_135402 ?auto_135403 ) ( CLEAR ?auto_135400 ) ( ON ?auto_135401 ?auto_135402 ) ( CLEAR ?auto_135401 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_135397 ?auto_135398 ?auto_135399 ?auto_135400 ?auto_135401 )
      ( MAKE-7PILE ?auto_135397 ?auto_135398 ?auto_135399 ?auto_135400 ?auto_135401 ?auto_135402 ?auto_135403 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_135427 - BLOCK
      ?auto_135428 - BLOCK
      ?auto_135429 - BLOCK
      ?auto_135430 - BLOCK
      ?auto_135431 - BLOCK
      ?auto_135432 - BLOCK
      ?auto_135433 - BLOCK
    )
    :vars
    (
      ?auto_135434 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_135433 ?auto_135434 ) ( ON-TABLE ?auto_135427 ) ( ON ?auto_135428 ?auto_135427 ) ( ON ?auto_135429 ?auto_135428 ) ( not ( = ?auto_135427 ?auto_135428 ) ) ( not ( = ?auto_135427 ?auto_135429 ) ) ( not ( = ?auto_135427 ?auto_135430 ) ) ( not ( = ?auto_135427 ?auto_135431 ) ) ( not ( = ?auto_135427 ?auto_135432 ) ) ( not ( = ?auto_135427 ?auto_135433 ) ) ( not ( = ?auto_135427 ?auto_135434 ) ) ( not ( = ?auto_135428 ?auto_135429 ) ) ( not ( = ?auto_135428 ?auto_135430 ) ) ( not ( = ?auto_135428 ?auto_135431 ) ) ( not ( = ?auto_135428 ?auto_135432 ) ) ( not ( = ?auto_135428 ?auto_135433 ) ) ( not ( = ?auto_135428 ?auto_135434 ) ) ( not ( = ?auto_135429 ?auto_135430 ) ) ( not ( = ?auto_135429 ?auto_135431 ) ) ( not ( = ?auto_135429 ?auto_135432 ) ) ( not ( = ?auto_135429 ?auto_135433 ) ) ( not ( = ?auto_135429 ?auto_135434 ) ) ( not ( = ?auto_135430 ?auto_135431 ) ) ( not ( = ?auto_135430 ?auto_135432 ) ) ( not ( = ?auto_135430 ?auto_135433 ) ) ( not ( = ?auto_135430 ?auto_135434 ) ) ( not ( = ?auto_135431 ?auto_135432 ) ) ( not ( = ?auto_135431 ?auto_135433 ) ) ( not ( = ?auto_135431 ?auto_135434 ) ) ( not ( = ?auto_135432 ?auto_135433 ) ) ( not ( = ?auto_135432 ?auto_135434 ) ) ( not ( = ?auto_135433 ?auto_135434 ) ) ( ON ?auto_135432 ?auto_135433 ) ( ON ?auto_135431 ?auto_135432 ) ( CLEAR ?auto_135429 ) ( ON ?auto_135430 ?auto_135431 ) ( CLEAR ?auto_135430 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_135427 ?auto_135428 ?auto_135429 ?auto_135430 )
      ( MAKE-7PILE ?auto_135427 ?auto_135428 ?auto_135429 ?auto_135430 ?auto_135431 ?auto_135432 ?auto_135433 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_135457 - BLOCK
      ?auto_135458 - BLOCK
      ?auto_135459 - BLOCK
      ?auto_135460 - BLOCK
      ?auto_135461 - BLOCK
      ?auto_135462 - BLOCK
      ?auto_135463 - BLOCK
    )
    :vars
    (
      ?auto_135464 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_135463 ?auto_135464 ) ( ON-TABLE ?auto_135457 ) ( ON ?auto_135458 ?auto_135457 ) ( not ( = ?auto_135457 ?auto_135458 ) ) ( not ( = ?auto_135457 ?auto_135459 ) ) ( not ( = ?auto_135457 ?auto_135460 ) ) ( not ( = ?auto_135457 ?auto_135461 ) ) ( not ( = ?auto_135457 ?auto_135462 ) ) ( not ( = ?auto_135457 ?auto_135463 ) ) ( not ( = ?auto_135457 ?auto_135464 ) ) ( not ( = ?auto_135458 ?auto_135459 ) ) ( not ( = ?auto_135458 ?auto_135460 ) ) ( not ( = ?auto_135458 ?auto_135461 ) ) ( not ( = ?auto_135458 ?auto_135462 ) ) ( not ( = ?auto_135458 ?auto_135463 ) ) ( not ( = ?auto_135458 ?auto_135464 ) ) ( not ( = ?auto_135459 ?auto_135460 ) ) ( not ( = ?auto_135459 ?auto_135461 ) ) ( not ( = ?auto_135459 ?auto_135462 ) ) ( not ( = ?auto_135459 ?auto_135463 ) ) ( not ( = ?auto_135459 ?auto_135464 ) ) ( not ( = ?auto_135460 ?auto_135461 ) ) ( not ( = ?auto_135460 ?auto_135462 ) ) ( not ( = ?auto_135460 ?auto_135463 ) ) ( not ( = ?auto_135460 ?auto_135464 ) ) ( not ( = ?auto_135461 ?auto_135462 ) ) ( not ( = ?auto_135461 ?auto_135463 ) ) ( not ( = ?auto_135461 ?auto_135464 ) ) ( not ( = ?auto_135462 ?auto_135463 ) ) ( not ( = ?auto_135462 ?auto_135464 ) ) ( not ( = ?auto_135463 ?auto_135464 ) ) ( ON ?auto_135462 ?auto_135463 ) ( ON ?auto_135461 ?auto_135462 ) ( ON ?auto_135460 ?auto_135461 ) ( CLEAR ?auto_135458 ) ( ON ?auto_135459 ?auto_135460 ) ( CLEAR ?auto_135459 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_135457 ?auto_135458 ?auto_135459 )
      ( MAKE-7PILE ?auto_135457 ?auto_135458 ?auto_135459 ?auto_135460 ?auto_135461 ?auto_135462 ?auto_135463 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_135487 - BLOCK
      ?auto_135488 - BLOCK
      ?auto_135489 - BLOCK
      ?auto_135490 - BLOCK
      ?auto_135491 - BLOCK
      ?auto_135492 - BLOCK
      ?auto_135493 - BLOCK
    )
    :vars
    (
      ?auto_135494 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_135493 ?auto_135494 ) ( ON-TABLE ?auto_135487 ) ( not ( = ?auto_135487 ?auto_135488 ) ) ( not ( = ?auto_135487 ?auto_135489 ) ) ( not ( = ?auto_135487 ?auto_135490 ) ) ( not ( = ?auto_135487 ?auto_135491 ) ) ( not ( = ?auto_135487 ?auto_135492 ) ) ( not ( = ?auto_135487 ?auto_135493 ) ) ( not ( = ?auto_135487 ?auto_135494 ) ) ( not ( = ?auto_135488 ?auto_135489 ) ) ( not ( = ?auto_135488 ?auto_135490 ) ) ( not ( = ?auto_135488 ?auto_135491 ) ) ( not ( = ?auto_135488 ?auto_135492 ) ) ( not ( = ?auto_135488 ?auto_135493 ) ) ( not ( = ?auto_135488 ?auto_135494 ) ) ( not ( = ?auto_135489 ?auto_135490 ) ) ( not ( = ?auto_135489 ?auto_135491 ) ) ( not ( = ?auto_135489 ?auto_135492 ) ) ( not ( = ?auto_135489 ?auto_135493 ) ) ( not ( = ?auto_135489 ?auto_135494 ) ) ( not ( = ?auto_135490 ?auto_135491 ) ) ( not ( = ?auto_135490 ?auto_135492 ) ) ( not ( = ?auto_135490 ?auto_135493 ) ) ( not ( = ?auto_135490 ?auto_135494 ) ) ( not ( = ?auto_135491 ?auto_135492 ) ) ( not ( = ?auto_135491 ?auto_135493 ) ) ( not ( = ?auto_135491 ?auto_135494 ) ) ( not ( = ?auto_135492 ?auto_135493 ) ) ( not ( = ?auto_135492 ?auto_135494 ) ) ( not ( = ?auto_135493 ?auto_135494 ) ) ( ON ?auto_135492 ?auto_135493 ) ( ON ?auto_135491 ?auto_135492 ) ( ON ?auto_135490 ?auto_135491 ) ( ON ?auto_135489 ?auto_135490 ) ( CLEAR ?auto_135487 ) ( ON ?auto_135488 ?auto_135489 ) ( CLEAR ?auto_135488 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_135487 ?auto_135488 )
      ( MAKE-7PILE ?auto_135487 ?auto_135488 ?auto_135489 ?auto_135490 ?auto_135491 ?auto_135492 ?auto_135493 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_135517 - BLOCK
      ?auto_135518 - BLOCK
      ?auto_135519 - BLOCK
      ?auto_135520 - BLOCK
      ?auto_135521 - BLOCK
      ?auto_135522 - BLOCK
      ?auto_135523 - BLOCK
    )
    :vars
    (
      ?auto_135524 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_135523 ?auto_135524 ) ( not ( = ?auto_135517 ?auto_135518 ) ) ( not ( = ?auto_135517 ?auto_135519 ) ) ( not ( = ?auto_135517 ?auto_135520 ) ) ( not ( = ?auto_135517 ?auto_135521 ) ) ( not ( = ?auto_135517 ?auto_135522 ) ) ( not ( = ?auto_135517 ?auto_135523 ) ) ( not ( = ?auto_135517 ?auto_135524 ) ) ( not ( = ?auto_135518 ?auto_135519 ) ) ( not ( = ?auto_135518 ?auto_135520 ) ) ( not ( = ?auto_135518 ?auto_135521 ) ) ( not ( = ?auto_135518 ?auto_135522 ) ) ( not ( = ?auto_135518 ?auto_135523 ) ) ( not ( = ?auto_135518 ?auto_135524 ) ) ( not ( = ?auto_135519 ?auto_135520 ) ) ( not ( = ?auto_135519 ?auto_135521 ) ) ( not ( = ?auto_135519 ?auto_135522 ) ) ( not ( = ?auto_135519 ?auto_135523 ) ) ( not ( = ?auto_135519 ?auto_135524 ) ) ( not ( = ?auto_135520 ?auto_135521 ) ) ( not ( = ?auto_135520 ?auto_135522 ) ) ( not ( = ?auto_135520 ?auto_135523 ) ) ( not ( = ?auto_135520 ?auto_135524 ) ) ( not ( = ?auto_135521 ?auto_135522 ) ) ( not ( = ?auto_135521 ?auto_135523 ) ) ( not ( = ?auto_135521 ?auto_135524 ) ) ( not ( = ?auto_135522 ?auto_135523 ) ) ( not ( = ?auto_135522 ?auto_135524 ) ) ( not ( = ?auto_135523 ?auto_135524 ) ) ( ON ?auto_135522 ?auto_135523 ) ( ON ?auto_135521 ?auto_135522 ) ( ON ?auto_135520 ?auto_135521 ) ( ON ?auto_135519 ?auto_135520 ) ( ON ?auto_135518 ?auto_135519 ) ( ON ?auto_135517 ?auto_135518 ) ( CLEAR ?auto_135517 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_135517 )
      ( MAKE-7PILE ?auto_135517 ?auto_135518 ?auto_135519 ?auto_135520 ?auto_135521 ?auto_135522 ?auto_135523 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_135548 - BLOCK
      ?auto_135549 - BLOCK
      ?auto_135550 - BLOCK
      ?auto_135551 - BLOCK
      ?auto_135552 - BLOCK
      ?auto_135553 - BLOCK
      ?auto_135554 - BLOCK
      ?auto_135555 - BLOCK
    )
    :vars
    (
      ?auto_135556 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_135554 ) ( ON ?auto_135555 ?auto_135556 ) ( CLEAR ?auto_135555 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_135548 ) ( ON ?auto_135549 ?auto_135548 ) ( ON ?auto_135550 ?auto_135549 ) ( ON ?auto_135551 ?auto_135550 ) ( ON ?auto_135552 ?auto_135551 ) ( ON ?auto_135553 ?auto_135552 ) ( ON ?auto_135554 ?auto_135553 ) ( not ( = ?auto_135548 ?auto_135549 ) ) ( not ( = ?auto_135548 ?auto_135550 ) ) ( not ( = ?auto_135548 ?auto_135551 ) ) ( not ( = ?auto_135548 ?auto_135552 ) ) ( not ( = ?auto_135548 ?auto_135553 ) ) ( not ( = ?auto_135548 ?auto_135554 ) ) ( not ( = ?auto_135548 ?auto_135555 ) ) ( not ( = ?auto_135548 ?auto_135556 ) ) ( not ( = ?auto_135549 ?auto_135550 ) ) ( not ( = ?auto_135549 ?auto_135551 ) ) ( not ( = ?auto_135549 ?auto_135552 ) ) ( not ( = ?auto_135549 ?auto_135553 ) ) ( not ( = ?auto_135549 ?auto_135554 ) ) ( not ( = ?auto_135549 ?auto_135555 ) ) ( not ( = ?auto_135549 ?auto_135556 ) ) ( not ( = ?auto_135550 ?auto_135551 ) ) ( not ( = ?auto_135550 ?auto_135552 ) ) ( not ( = ?auto_135550 ?auto_135553 ) ) ( not ( = ?auto_135550 ?auto_135554 ) ) ( not ( = ?auto_135550 ?auto_135555 ) ) ( not ( = ?auto_135550 ?auto_135556 ) ) ( not ( = ?auto_135551 ?auto_135552 ) ) ( not ( = ?auto_135551 ?auto_135553 ) ) ( not ( = ?auto_135551 ?auto_135554 ) ) ( not ( = ?auto_135551 ?auto_135555 ) ) ( not ( = ?auto_135551 ?auto_135556 ) ) ( not ( = ?auto_135552 ?auto_135553 ) ) ( not ( = ?auto_135552 ?auto_135554 ) ) ( not ( = ?auto_135552 ?auto_135555 ) ) ( not ( = ?auto_135552 ?auto_135556 ) ) ( not ( = ?auto_135553 ?auto_135554 ) ) ( not ( = ?auto_135553 ?auto_135555 ) ) ( not ( = ?auto_135553 ?auto_135556 ) ) ( not ( = ?auto_135554 ?auto_135555 ) ) ( not ( = ?auto_135554 ?auto_135556 ) ) ( not ( = ?auto_135555 ?auto_135556 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_135555 ?auto_135556 )
      ( !STACK ?auto_135555 ?auto_135554 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_135582 - BLOCK
      ?auto_135583 - BLOCK
      ?auto_135584 - BLOCK
      ?auto_135585 - BLOCK
      ?auto_135586 - BLOCK
      ?auto_135587 - BLOCK
      ?auto_135588 - BLOCK
      ?auto_135589 - BLOCK
    )
    :vars
    (
      ?auto_135590 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_135589 ?auto_135590 ) ( ON-TABLE ?auto_135582 ) ( ON ?auto_135583 ?auto_135582 ) ( ON ?auto_135584 ?auto_135583 ) ( ON ?auto_135585 ?auto_135584 ) ( ON ?auto_135586 ?auto_135585 ) ( ON ?auto_135587 ?auto_135586 ) ( not ( = ?auto_135582 ?auto_135583 ) ) ( not ( = ?auto_135582 ?auto_135584 ) ) ( not ( = ?auto_135582 ?auto_135585 ) ) ( not ( = ?auto_135582 ?auto_135586 ) ) ( not ( = ?auto_135582 ?auto_135587 ) ) ( not ( = ?auto_135582 ?auto_135588 ) ) ( not ( = ?auto_135582 ?auto_135589 ) ) ( not ( = ?auto_135582 ?auto_135590 ) ) ( not ( = ?auto_135583 ?auto_135584 ) ) ( not ( = ?auto_135583 ?auto_135585 ) ) ( not ( = ?auto_135583 ?auto_135586 ) ) ( not ( = ?auto_135583 ?auto_135587 ) ) ( not ( = ?auto_135583 ?auto_135588 ) ) ( not ( = ?auto_135583 ?auto_135589 ) ) ( not ( = ?auto_135583 ?auto_135590 ) ) ( not ( = ?auto_135584 ?auto_135585 ) ) ( not ( = ?auto_135584 ?auto_135586 ) ) ( not ( = ?auto_135584 ?auto_135587 ) ) ( not ( = ?auto_135584 ?auto_135588 ) ) ( not ( = ?auto_135584 ?auto_135589 ) ) ( not ( = ?auto_135584 ?auto_135590 ) ) ( not ( = ?auto_135585 ?auto_135586 ) ) ( not ( = ?auto_135585 ?auto_135587 ) ) ( not ( = ?auto_135585 ?auto_135588 ) ) ( not ( = ?auto_135585 ?auto_135589 ) ) ( not ( = ?auto_135585 ?auto_135590 ) ) ( not ( = ?auto_135586 ?auto_135587 ) ) ( not ( = ?auto_135586 ?auto_135588 ) ) ( not ( = ?auto_135586 ?auto_135589 ) ) ( not ( = ?auto_135586 ?auto_135590 ) ) ( not ( = ?auto_135587 ?auto_135588 ) ) ( not ( = ?auto_135587 ?auto_135589 ) ) ( not ( = ?auto_135587 ?auto_135590 ) ) ( not ( = ?auto_135588 ?auto_135589 ) ) ( not ( = ?auto_135588 ?auto_135590 ) ) ( not ( = ?auto_135589 ?auto_135590 ) ) ( CLEAR ?auto_135587 ) ( ON ?auto_135588 ?auto_135589 ) ( CLEAR ?auto_135588 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_135582 ?auto_135583 ?auto_135584 ?auto_135585 ?auto_135586 ?auto_135587 ?auto_135588 )
      ( MAKE-8PILE ?auto_135582 ?auto_135583 ?auto_135584 ?auto_135585 ?auto_135586 ?auto_135587 ?auto_135588 ?auto_135589 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_135616 - BLOCK
      ?auto_135617 - BLOCK
      ?auto_135618 - BLOCK
      ?auto_135619 - BLOCK
      ?auto_135620 - BLOCK
      ?auto_135621 - BLOCK
      ?auto_135622 - BLOCK
      ?auto_135623 - BLOCK
    )
    :vars
    (
      ?auto_135624 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_135623 ?auto_135624 ) ( ON-TABLE ?auto_135616 ) ( ON ?auto_135617 ?auto_135616 ) ( ON ?auto_135618 ?auto_135617 ) ( ON ?auto_135619 ?auto_135618 ) ( ON ?auto_135620 ?auto_135619 ) ( not ( = ?auto_135616 ?auto_135617 ) ) ( not ( = ?auto_135616 ?auto_135618 ) ) ( not ( = ?auto_135616 ?auto_135619 ) ) ( not ( = ?auto_135616 ?auto_135620 ) ) ( not ( = ?auto_135616 ?auto_135621 ) ) ( not ( = ?auto_135616 ?auto_135622 ) ) ( not ( = ?auto_135616 ?auto_135623 ) ) ( not ( = ?auto_135616 ?auto_135624 ) ) ( not ( = ?auto_135617 ?auto_135618 ) ) ( not ( = ?auto_135617 ?auto_135619 ) ) ( not ( = ?auto_135617 ?auto_135620 ) ) ( not ( = ?auto_135617 ?auto_135621 ) ) ( not ( = ?auto_135617 ?auto_135622 ) ) ( not ( = ?auto_135617 ?auto_135623 ) ) ( not ( = ?auto_135617 ?auto_135624 ) ) ( not ( = ?auto_135618 ?auto_135619 ) ) ( not ( = ?auto_135618 ?auto_135620 ) ) ( not ( = ?auto_135618 ?auto_135621 ) ) ( not ( = ?auto_135618 ?auto_135622 ) ) ( not ( = ?auto_135618 ?auto_135623 ) ) ( not ( = ?auto_135618 ?auto_135624 ) ) ( not ( = ?auto_135619 ?auto_135620 ) ) ( not ( = ?auto_135619 ?auto_135621 ) ) ( not ( = ?auto_135619 ?auto_135622 ) ) ( not ( = ?auto_135619 ?auto_135623 ) ) ( not ( = ?auto_135619 ?auto_135624 ) ) ( not ( = ?auto_135620 ?auto_135621 ) ) ( not ( = ?auto_135620 ?auto_135622 ) ) ( not ( = ?auto_135620 ?auto_135623 ) ) ( not ( = ?auto_135620 ?auto_135624 ) ) ( not ( = ?auto_135621 ?auto_135622 ) ) ( not ( = ?auto_135621 ?auto_135623 ) ) ( not ( = ?auto_135621 ?auto_135624 ) ) ( not ( = ?auto_135622 ?auto_135623 ) ) ( not ( = ?auto_135622 ?auto_135624 ) ) ( not ( = ?auto_135623 ?auto_135624 ) ) ( ON ?auto_135622 ?auto_135623 ) ( CLEAR ?auto_135620 ) ( ON ?auto_135621 ?auto_135622 ) ( CLEAR ?auto_135621 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_135616 ?auto_135617 ?auto_135618 ?auto_135619 ?auto_135620 ?auto_135621 )
      ( MAKE-8PILE ?auto_135616 ?auto_135617 ?auto_135618 ?auto_135619 ?auto_135620 ?auto_135621 ?auto_135622 ?auto_135623 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_135650 - BLOCK
      ?auto_135651 - BLOCK
      ?auto_135652 - BLOCK
      ?auto_135653 - BLOCK
      ?auto_135654 - BLOCK
      ?auto_135655 - BLOCK
      ?auto_135656 - BLOCK
      ?auto_135657 - BLOCK
    )
    :vars
    (
      ?auto_135658 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_135657 ?auto_135658 ) ( ON-TABLE ?auto_135650 ) ( ON ?auto_135651 ?auto_135650 ) ( ON ?auto_135652 ?auto_135651 ) ( ON ?auto_135653 ?auto_135652 ) ( not ( = ?auto_135650 ?auto_135651 ) ) ( not ( = ?auto_135650 ?auto_135652 ) ) ( not ( = ?auto_135650 ?auto_135653 ) ) ( not ( = ?auto_135650 ?auto_135654 ) ) ( not ( = ?auto_135650 ?auto_135655 ) ) ( not ( = ?auto_135650 ?auto_135656 ) ) ( not ( = ?auto_135650 ?auto_135657 ) ) ( not ( = ?auto_135650 ?auto_135658 ) ) ( not ( = ?auto_135651 ?auto_135652 ) ) ( not ( = ?auto_135651 ?auto_135653 ) ) ( not ( = ?auto_135651 ?auto_135654 ) ) ( not ( = ?auto_135651 ?auto_135655 ) ) ( not ( = ?auto_135651 ?auto_135656 ) ) ( not ( = ?auto_135651 ?auto_135657 ) ) ( not ( = ?auto_135651 ?auto_135658 ) ) ( not ( = ?auto_135652 ?auto_135653 ) ) ( not ( = ?auto_135652 ?auto_135654 ) ) ( not ( = ?auto_135652 ?auto_135655 ) ) ( not ( = ?auto_135652 ?auto_135656 ) ) ( not ( = ?auto_135652 ?auto_135657 ) ) ( not ( = ?auto_135652 ?auto_135658 ) ) ( not ( = ?auto_135653 ?auto_135654 ) ) ( not ( = ?auto_135653 ?auto_135655 ) ) ( not ( = ?auto_135653 ?auto_135656 ) ) ( not ( = ?auto_135653 ?auto_135657 ) ) ( not ( = ?auto_135653 ?auto_135658 ) ) ( not ( = ?auto_135654 ?auto_135655 ) ) ( not ( = ?auto_135654 ?auto_135656 ) ) ( not ( = ?auto_135654 ?auto_135657 ) ) ( not ( = ?auto_135654 ?auto_135658 ) ) ( not ( = ?auto_135655 ?auto_135656 ) ) ( not ( = ?auto_135655 ?auto_135657 ) ) ( not ( = ?auto_135655 ?auto_135658 ) ) ( not ( = ?auto_135656 ?auto_135657 ) ) ( not ( = ?auto_135656 ?auto_135658 ) ) ( not ( = ?auto_135657 ?auto_135658 ) ) ( ON ?auto_135656 ?auto_135657 ) ( ON ?auto_135655 ?auto_135656 ) ( CLEAR ?auto_135653 ) ( ON ?auto_135654 ?auto_135655 ) ( CLEAR ?auto_135654 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_135650 ?auto_135651 ?auto_135652 ?auto_135653 ?auto_135654 )
      ( MAKE-8PILE ?auto_135650 ?auto_135651 ?auto_135652 ?auto_135653 ?auto_135654 ?auto_135655 ?auto_135656 ?auto_135657 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_135684 - BLOCK
      ?auto_135685 - BLOCK
      ?auto_135686 - BLOCK
      ?auto_135687 - BLOCK
      ?auto_135688 - BLOCK
      ?auto_135689 - BLOCK
      ?auto_135690 - BLOCK
      ?auto_135691 - BLOCK
    )
    :vars
    (
      ?auto_135692 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_135691 ?auto_135692 ) ( ON-TABLE ?auto_135684 ) ( ON ?auto_135685 ?auto_135684 ) ( ON ?auto_135686 ?auto_135685 ) ( not ( = ?auto_135684 ?auto_135685 ) ) ( not ( = ?auto_135684 ?auto_135686 ) ) ( not ( = ?auto_135684 ?auto_135687 ) ) ( not ( = ?auto_135684 ?auto_135688 ) ) ( not ( = ?auto_135684 ?auto_135689 ) ) ( not ( = ?auto_135684 ?auto_135690 ) ) ( not ( = ?auto_135684 ?auto_135691 ) ) ( not ( = ?auto_135684 ?auto_135692 ) ) ( not ( = ?auto_135685 ?auto_135686 ) ) ( not ( = ?auto_135685 ?auto_135687 ) ) ( not ( = ?auto_135685 ?auto_135688 ) ) ( not ( = ?auto_135685 ?auto_135689 ) ) ( not ( = ?auto_135685 ?auto_135690 ) ) ( not ( = ?auto_135685 ?auto_135691 ) ) ( not ( = ?auto_135685 ?auto_135692 ) ) ( not ( = ?auto_135686 ?auto_135687 ) ) ( not ( = ?auto_135686 ?auto_135688 ) ) ( not ( = ?auto_135686 ?auto_135689 ) ) ( not ( = ?auto_135686 ?auto_135690 ) ) ( not ( = ?auto_135686 ?auto_135691 ) ) ( not ( = ?auto_135686 ?auto_135692 ) ) ( not ( = ?auto_135687 ?auto_135688 ) ) ( not ( = ?auto_135687 ?auto_135689 ) ) ( not ( = ?auto_135687 ?auto_135690 ) ) ( not ( = ?auto_135687 ?auto_135691 ) ) ( not ( = ?auto_135687 ?auto_135692 ) ) ( not ( = ?auto_135688 ?auto_135689 ) ) ( not ( = ?auto_135688 ?auto_135690 ) ) ( not ( = ?auto_135688 ?auto_135691 ) ) ( not ( = ?auto_135688 ?auto_135692 ) ) ( not ( = ?auto_135689 ?auto_135690 ) ) ( not ( = ?auto_135689 ?auto_135691 ) ) ( not ( = ?auto_135689 ?auto_135692 ) ) ( not ( = ?auto_135690 ?auto_135691 ) ) ( not ( = ?auto_135690 ?auto_135692 ) ) ( not ( = ?auto_135691 ?auto_135692 ) ) ( ON ?auto_135690 ?auto_135691 ) ( ON ?auto_135689 ?auto_135690 ) ( ON ?auto_135688 ?auto_135689 ) ( CLEAR ?auto_135686 ) ( ON ?auto_135687 ?auto_135688 ) ( CLEAR ?auto_135687 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_135684 ?auto_135685 ?auto_135686 ?auto_135687 )
      ( MAKE-8PILE ?auto_135684 ?auto_135685 ?auto_135686 ?auto_135687 ?auto_135688 ?auto_135689 ?auto_135690 ?auto_135691 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_135718 - BLOCK
      ?auto_135719 - BLOCK
      ?auto_135720 - BLOCK
      ?auto_135721 - BLOCK
      ?auto_135722 - BLOCK
      ?auto_135723 - BLOCK
      ?auto_135724 - BLOCK
      ?auto_135725 - BLOCK
    )
    :vars
    (
      ?auto_135726 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_135725 ?auto_135726 ) ( ON-TABLE ?auto_135718 ) ( ON ?auto_135719 ?auto_135718 ) ( not ( = ?auto_135718 ?auto_135719 ) ) ( not ( = ?auto_135718 ?auto_135720 ) ) ( not ( = ?auto_135718 ?auto_135721 ) ) ( not ( = ?auto_135718 ?auto_135722 ) ) ( not ( = ?auto_135718 ?auto_135723 ) ) ( not ( = ?auto_135718 ?auto_135724 ) ) ( not ( = ?auto_135718 ?auto_135725 ) ) ( not ( = ?auto_135718 ?auto_135726 ) ) ( not ( = ?auto_135719 ?auto_135720 ) ) ( not ( = ?auto_135719 ?auto_135721 ) ) ( not ( = ?auto_135719 ?auto_135722 ) ) ( not ( = ?auto_135719 ?auto_135723 ) ) ( not ( = ?auto_135719 ?auto_135724 ) ) ( not ( = ?auto_135719 ?auto_135725 ) ) ( not ( = ?auto_135719 ?auto_135726 ) ) ( not ( = ?auto_135720 ?auto_135721 ) ) ( not ( = ?auto_135720 ?auto_135722 ) ) ( not ( = ?auto_135720 ?auto_135723 ) ) ( not ( = ?auto_135720 ?auto_135724 ) ) ( not ( = ?auto_135720 ?auto_135725 ) ) ( not ( = ?auto_135720 ?auto_135726 ) ) ( not ( = ?auto_135721 ?auto_135722 ) ) ( not ( = ?auto_135721 ?auto_135723 ) ) ( not ( = ?auto_135721 ?auto_135724 ) ) ( not ( = ?auto_135721 ?auto_135725 ) ) ( not ( = ?auto_135721 ?auto_135726 ) ) ( not ( = ?auto_135722 ?auto_135723 ) ) ( not ( = ?auto_135722 ?auto_135724 ) ) ( not ( = ?auto_135722 ?auto_135725 ) ) ( not ( = ?auto_135722 ?auto_135726 ) ) ( not ( = ?auto_135723 ?auto_135724 ) ) ( not ( = ?auto_135723 ?auto_135725 ) ) ( not ( = ?auto_135723 ?auto_135726 ) ) ( not ( = ?auto_135724 ?auto_135725 ) ) ( not ( = ?auto_135724 ?auto_135726 ) ) ( not ( = ?auto_135725 ?auto_135726 ) ) ( ON ?auto_135724 ?auto_135725 ) ( ON ?auto_135723 ?auto_135724 ) ( ON ?auto_135722 ?auto_135723 ) ( ON ?auto_135721 ?auto_135722 ) ( CLEAR ?auto_135719 ) ( ON ?auto_135720 ?auto_135721 ) ( CLEAR ?auto_135720 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_135718 ?auto_135719 ?auto_135720 )
      ( MAKE-8PILE ?auto_135718 ?auto_135719 ?auto_135720 ?auto_135721 ?auto_135722 ?auto_135723 ?auto_135724 ?auto_135725 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_135752 - BLOCK
      ?auto_135753 - BLOCK
      ?auto_135754 - BLOCK
      ?auto_135755 - BLOCK
      ?auto_135756 - BLOCK
      ?auto_135757 - BLOCK
      ?auto_135758 - BLOCK
      ?auto_135759 - BLOCK
    )
    :vars
    (
      ?auto_135760 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_135759 ?auto_135760 ) ( ON-TABLE ?auto_135752 ) ( not ( = ?auto_135752 ?auto_135753 ) ) ( not ( = ?auto_135752 ?auto_135754 ) ) ( not ( = ?auto_135752 ?auto_135755 ) ) ( not ( = ?auto_135752 ?auto_135756 ) ) ( not ( = ?auto_135752 ?auto_135757 ) ) ( not ( = ?auto_135752 ?auto_135758 ) ) ( not ( = ?auto_135752 ?auto_135759 ) ) ( not ( = ?auto_135752 ?auto_135760 ) ) ( not ( = ?auto_135753 ?auto_135754 ) ) ( not ( = ?auto_135753 ?auto_135755 ) ) ( not ( = ?auto_135753 ?auto_135756 ) ) ( not ( = ?auto_135753 ?auto_135757 ) ) ( not ( = ?auto_135753 ?auto_135758 ) ) ( not ( = ?auto_135753 ?auto_135759 ) ) ( not ( = ?auto_135753 ?auto_135760 ) ) ( not ( = ?auto_135754 ?auto_135755 ) ) ( not ( = ?auto_135754 ?auto_135756 ) ) ( not ( = ?auto_135754 ?auto_135757 ) ) ( not ( = ?auto_135754 ?auto_135758 ) ) ( not ( = ?auto_135754 ?auto_135759 ) ) ( not ( = ?auto_135754 ?auto_135760 ) ) ( not ( = ?auto_135755 ?auto_135756 ) ) ( not ( = ?auto_135755 ?auto_135757 ) ) ( not ( = ?auto_135755 ?auto_135758 ) ) ( not ( = ?auto_135755 ?auto_135759 ) ) ( not ( = ?auto_135755 ?auto_135760 ) ) ( not ( = ?auto_135756 ?auto_135757 ) ) ( not ( = ?auto_135756 ?auto_135758 ) ) ( not ( = ?auto_135756 ?auto_135759 ) ) ( not ( = ?auto_135756 ?auto_135760 ) ) ( not ( = ?auto_135757 ?auto_135758 ) ) ( not ( = ?auto_135757 ?auto_135759 ) ) ( not ( = ?auto_135757 ?auto_135760 ) ) ( not ( = ?auto_135758 ?auto_135759 ) ) ( not ( = ?auto_135758 ?auto_135760 ) ) ( not ( = ?auto_135759 ?auto_135760 ) ) ( ON ?auto_135758 ?auto_135759 ) ( ON ?auto_135757 ?auto_135758 ) ( ON ?auto_135756 ?auto_135757 ) ( ON ?auto_135755 ?auto_135756 ) ( ON ?auto_135754 ?auto_135755 ) ( CLEAR ?auto_135752 ) ( ON ?auto_135753 ?auto_135754 ) ( CLEAR ?auto_135753 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_135752 ?auto_135753 )
      ( MAKE-8PILE ?auto_135752 ?auto_135753 ?auto_135754 ?auto_135755 ?auto_135756 ?auto_135757 ?auto_135758 ?auto_135759 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_135786 - BLOCK
      ?auto_135787 - BLOCK
      ?auto_135788 - BLOCK
      ?auto_135789 - BLOCK
      ?auto_135790 - BLOCK
      ?auto_135791 - BLOCK
      ?auto_135792 - BLOCK
      ?auto_135793 - BLOCK
    )
    :vars
    (
      ?auto_135794 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_135793 ?auto_135794 ) ( not ( = ?auto_135786 ?auto_135787 ) ) ( not ( = ?auto_135786 ?auto_135788 ) ) ( not ( = ?auto_135786 ?auto_135789 ) ) ( not ( = ?auto_135786 ?auto_135790 ) ) ( not ( = ?auto_135786 ?auto_135791 ) ) ( not ( = ?auto_135786 ?auto_135792 ) ) ( not ( = ?auto_135786 ?auto_135793 ) ) ( not ( = ?auto_135786 ?auto_135794 ) ) ( not ( = ?auto_135787 ?auto_135788 ) ) ( not ( = ?auto_135787 ?auto_135789 ) ) ( not ( = ?auto_135787 ?auto_135790 ) ) ( not ( = ?auto_135787 ?auto_135791 ) ) ( not ( = ?auto_135787 ?auto_135792 ) ) ( not ( = ?auto_135787 ?auto_135793 ) ) ( not ( = ?auto_135787 ?auto_135794 ) ) ( not ( = ?auto_135788 ?auto_135789 ) ) ( not ( = ?auto_135788 ?auto_135790 ) ) ( not ( = ?auto_135788 ?auto_135791 ) ) ( not ( = ?auto_135788 ?auto_135792 ) ) ( not ( = ?auto_135788 ?auto_135793 ) ) ( not ( = ?auto_135788 ?auto_135794 ) ) ( not ( = ?auto_135789 ?auto_135790 ) ) ( not ( = ?auto_135789 ?auto_135791 ) ) ( not ( = ?auto_135789 ?auto_135792 ) ) ( not ( = ?auto_135789 ?auto_135793 ) ) ( not ( = ?auto_135789 ?auto_135794 ) ) ( not ( = ?auto_135790 ?auto_135791 ) ) ( not ( = ?auto_135790 ?auto_135792 ) ) ( not ( = ?auto_135790 ?auto_135793 ) ) ( not ( = ?auto_135790 ?auto_135794 ) ) ( not ( = ?auto_135791 ?auto_135792 ) ) ( not ( = ?auto_135791 ?auto_135793 ) ) ( not ( = ?auto_135791 ?auto_135794 ) ) ( not ( = ?auto_135792 ?auto_135793 ) ) ( not ( = ?auto_135792 ?auto_135794 ) ) ( not ( = ?auto_135793 ?auto_135794 ) ) ( ON ?auto_135792 ?auto_135793 ) ( ON ?auto_135791 ?auto_135792 ) ( ON ?auto_135790 ?auto_135791 ) ( ON ?auto_135789 ?auto_135790 ) ( ON ?auto_135788 ?auto_135789 ) ( ON ?auto_135787 ?auto_135788 ) ( ON ?auto_135786 ?auto_135787 ) ( CLEAR ?auto_135786 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_135786 )
      ( MAKE-8PILE ?auto_135786 ?auto_135787 ?auto_135788 ?auto_135789 ?auto_135790 ?auto_135791 ?auto_135792 ?auto_135793 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_135821 - BLOCK
      ?auto_135822 - BLOCK
      ?auto_135823 - BLOCK
      ?auto_135824 - BLOCK
      ?auto_135825 - BLOCK
      ?auto_135826 - BLOCK
      ?auto_135827 - BLOCK
      ?auto_135828 - BLOCK
      ?auto_135829 - BLOCK
    )
    :vars
    (
      ?auto_135830 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_135828 ) ( ON ?auto_135829 ?auto_135830 ) ( CLEAR ?auto_135829 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_135821 ) ( ON ?auto_135822 ?auto_135821 ) ( ON ?auto_135823 ?auto_135822 ) ( ON ?auto_135824 ?auto_135823 ) ( ON ?auto_135825 ?auto_135824 ) ( ON ?auto_135826 ?auto_135825 ) ( ON ?auto_135827 ?auto_135826 ) ( ON ?auto_135828 ?auto_135827 ) ( not ( = ?auto_135821 ?auto_135822 ) ) ( not ( = ?auto_135821 ?auto_135823 ) ) ( not ( = ?auto_135821 ?auto_135824 ) ) ( not ( = ?auto_135821 ?auto_135825 ) ) ( not ( = ?auto_135821 ?auto_135826 ) ) ( not ( = ?auto_135821 ?auto_135827 ) ) ( not ( = ?auto_135821 ?auto_135828 ) ) ( not ( = ?auto_135821 ?auto_135829 ) ) ( not ( = ?auto_135821 ?auto_135830 ) ) ( not ( = ?auto_135822 ?auto_135823 ) ) ( not ( = ?auto_135822 ?auto_135824 ) ) ( not ( = ?auto_135822 ?auto_135825 ) ) ( not ( = ?auto_135822 ?auto_135826 ) ) ( not ( = ?auto_135822 ?auto_135827 ) ) ( not ( = ?auto_135822 ?auto_135828 ) ) ( not ( = ?auto_135822 ?auto_135829 ) ) ( not ( = ?auto_135822 ?auto_135830 ) ) ( not ( = ?auto_135823 ?auto_135824 ) ) ( not ( = ?auto_135823 ?auto_135825 ) ) ( not ( = ?auto_135823 ?auto_135826 ) ) ( not ( = ?auto_135823 ?auto_135827 ) ) ( not ( = ?auto_135823 ?auto_135828 ) ) ( not ( = ?auto_135823 ?auto_135829 ) ) ( not ( = ?auto_135823 ?auto_135830 ) ) ( not ( = ?auto_135824 ?auto_135825 ) ) ( not ( = ?auto_135824 ?auto_135826 ) ) ( not ( = ?auto_135824 ?auto_135827 ) ) ( not ( = ?auto_135824 ?auto_135828 ) ) ( not ( = ?auto_135824 ?auto_135829 ) ) ( not ( = ?auto_135824 ?auto_135830 ) ) ( not ( = ?auto_135825 ?auto_135826 ) ) ( not ( = ?auto_135825 ?auto_135827 ) ) ( not ( = ?auto_135825 ?auto_135828 ) ) ( not ( = ?auto_135825 ?auto_135829 ) ) ( not ( = ?auto_135825 ?auto_135830 ) ) ( not ( = ?auto_135826 ?auto_135827 ) ) ( not ( = ?auto_135826 ?auto_135828 ) ) ( not ( = ?auto_135826 ?auto_135829 ) ) ( not ( = ?auto_135826 ?auto_135830 ) ) ( not ( = ?auto_135827 ?auto_135828 ) ) ( not ( = ?auto_135827 ?auto_135829 ) ) ( not ( = ?auto_135827 ?auto_135830 ) ) ( not ( = ?auto_135828 ?auto_135829 ) ) ( not ( = ?auto_135828 ?auto_135830 ) ) ( not ( = ?auto_135829 ?auto_135830 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_135829 ?auto_135830 )
      ( !STACK ?auto_135829 ?auto_135828 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_135859 - BLOCK
      ?auto_135860 - BLOCK
      ?auto_135861 - BLOCK
      ?auto_135862 - BLOCK
      ?auto_135863 - BLOCK
      ?auto_135864 - BLOCK
      ?auto_135865 - BLOCK
      ?auto_135866 - BLOCK
      ?auto_135867 - BLOCK
    )
    :vars
    (
      ?auto_135868 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_135867 ?auto_135868 ) ( ON-TABLE ?auto_135859 ) ( ON ?auto_135860 ?auto_135859 ) ( ON ?auto_135861 ?auto_135860 ) ( ON ?auto_135862 ?auto_135861 ) ( ON ?auto_135863 ?auto_135862 ) ( ON ?auto_135864 ?auto_135863 ) ( ON ?auto_135865 ?auto_135864 ) ( not ( = ?auto_135859 ?auto_135860 ) ) ( not ( = ?auto_135859 ?auto_135861 ) ) ( not ( = ?auto_135859 ?auto_135862 ) ) ( not ( = ?auto_135859 ?auto_135863 ) ) ( not ( = ?auto_135859 ?auto_135864 ) ) ( not ( = ?auto_135859 ?auto_135865 ) ) ( not ( = ?auto_135859 ?auto_135866 ) ) ( not ( = ?auto_135859 ?auto_135867 ) ) ( not ( = ?auto_135859 ?auto_135868 ) ) ( not ( = ?auto_135860 ?auto_135861 ) ) ( not ( = ?auto_135860 ?auto_135862 ) ) ( not ( = ?auto_135860 ?auto_135863 ) ) ( not ( = ?auto_135860 ?auto_135864 ) ) ( not ( = ?auto_135860 ?auto_135865 ) ) ( not ( = ?auto_135860 ?auto_135866 ) ) ( not ( = ?auto_135860 ?auto_135867 ) ) ( not ( = ?auto_135860 ?auto_135868 ) ) ( not ( = ?auto_135861 ?auto_135862 ) ) ( not ( = ?auto_135861 ?auto_135863 ) ) ( not ( = ?auto_135861 ?auto_135864 ) ) ( not ( = ?auto_135861 ?auto_135865 ) ) ( not ( = ?auto_135861 ?auto_135866 ) ) ( not ( = ?auto_135861 ?auto_135867 ) ) ( not ( = ?auto_135861 ?auto_135868 ) ) ( not ( = ?auto_135862 ?auto_135863 ) ) ( not ( = ?auto_135862 ?auto_135864 ) ) ( not ( = ?auto_135862 ?auto_135865 ) ) ( not ( = ?auto_135862 ?auto_135866 ) ) ( not ( = ?auto_135862 ?auto_135867 ) ) ( not ( = ?auto_135862 ?auto_135868 ) ) ( not ( = ?auto_135863 ?auto_135864 ) ) ( not ( = ?auto_135863 ?auto_135865 ) ) ( not ( = ?auto_135863 ?auto_135866 ) ) ( not ( = ?auto_135863 ?auto_135867 ) ) ( not ( = ?auto_135863 ?auto_135868 ) ) ( not ( = ?auto_135864 ?auto_135865 ) ) ( not ( = ?auto_135864 ?auto_135866 ) ) ( not ( = ?auto_135864 ?auto_135867 ) ) ( not ( = ?auto_135864 ?auto_135868 ) ) ( not ( = ?auto_135865 ?auto_135866 ) ) ( not ( = ?auto_135865 ?auto_135867 ) ) ( not ( = ?auto_135865 ?auto_135868 ) ) ( not ( = ?auto_135866 ?auto_135867 ) ) ( not ( = ?auto_135866 ?auto_135868 ) ) ( not ( = ?auto_135867 ?auto_135868 ) ) ( CLEAR ?auto_135865 ) ( ON ?auto_135866 ?auto_135867 ) ( CLEAR ?auto_135866 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_135859 ?auto_135860 ?auto_135861 ?auto_135862 ?auto_135863 ?auto_135864 ?auto_135865 ?auto_135866 )
      ( MAKE-9PILE ?auto_135859 ?auto_135860 ?auto_135861 ?auto_135862 ?auto_135863 ?auto_135864 ?auto_135865 ?auto_135866 ?auto_135867 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_135897 - BLOCK
      ?auto_135898 - BLOCK
      ?auto_135899 - BLOCK
      ?auto_135900 - BLOCK
      ?auto_135901 - BLOCK
      ?auto_135902 - BLOCK
      ?auto_135903 - BLOCK
      ?auto_135904 - BLOCK
      ?auto_135905 - BLOCK
    )
    :vars
    (
      ?auto_135906 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_135905 ?auto_135906 ) ( ON-TABLE ?auto_135897 ) ( ON ?auto_135898 ?auto_135897 ) ( ON ?auto_135899 ?auto_135898 ) ( ON ?auto_135900 ?auto_135899 ) ( ON ?auto_135901 ?auto_135900 ) ( ON ?auto_135902 ?auto_135901 ) ( not ( = ?auto_135897 ?auto_135898 ) ) ( not ( = ?auto_135897 ?auto_135899 ) ) ( not ( = ?auto_135897 ?auto_135900 ) ) ( not ( = ?auto_135897 ?auto_135901 ) ) ( not ( = ?auto_135897 ?auto_135902 ) ) ( not ( = ?auto_135897 ?auto_135903 ) ) ( not ( = ?auto_135897 ?auto_135904 ) ) ( not ( = ?auto_135897 ?auto_135905 ) ) ( not ( = ?auto_135897 ?auto_135906 ) ) ( not ( = ?auto_135898 ?auto_135899 ) ) ( not ( = ?auto_135898 ?auto_135900 ) ) ( not ( = ?auto_135898 ?auto_135901 ) ) ( not ( = ?auto_135898 ?auto_135902 ) ) ( not ( = ?auto_135898 ?auto_135903 ) ) ( not ( = ?auto_135898 ?auto_135904 ) ) ( not ( = ?auto_135898 ?auto_135905 ) ) ( not ( = ?auto_135898 ?auto_135906 ) ) ( not ( = ?auto_135899 ?auto_135900 ) ) ( not ( = ?auto_135899 ?auto_135901 ) ) ( not ( = ?auto_135899 ?auto_135902 ) ) ( not ( = ?auto_135899 ?auto_135903 ) ) ( not ( = ?auto_135899 ?auto_135904 ) ) ( not ( = ?auto_135899 ?auto_135905 ) ) ( not ( = ?auto_135899 ?auto_135906 ) ) ( not ( = ?auto_135900 ?auto_135901 ) ) ( not ( = ?auto_135900 ?auto_135902 ) ) ( not ( = ?auto_135900 ?auto_135903 ) ) ( not ( = ?auto_135900 ?auto_135904 ) ) ( not ( = ?auto_135900 ?auto_135905 ) ) ( not ( = ?auto_135900 ?auto_135906 ) ) ( not ( = ?auto_135901 ?auto_135902 ) ) ( not ( = ?auto_135901 ?auto_135903 ) ) ( not ( = ?auto_135901 ?auto_135904 ) ) ( not ( = ?auto_135901 ?auto_135905 ) ) ( not ( = ?auto_135901 ?auto_135906 ) ) ( not ( = ?auto_135902 ?auto_135903 ) ) ( not ( = ?auto_135902 ?auto_135904 ) ) ( not ( = ?auto_135902 ?auto_135905 ) ) ( not ( = ?auto_135902 ?auto_135906 ) ) ( not ( = ?auto_135903 ?auto_135904 ) ) ( not ( = ?auto_135903 ?auto_135905 ) ) ( not ( = ?auto_135903 ?auto_135906 ) ) ( not ( = ?auto_135904 ?auto_135905 ) ) ( not ( = ?auto_135904 ?auto_135906 ) ) ( not ( = ?auto_135905 ?auto_135906 ) ) ( ON ?auto_135904 ?auto_135905 ) ( CLEAR ?auto_135902 ) ( ON ?auto_135903 ?auto_135904 ) ( CLEAR ?auto_135903 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_135897 ?auto_135898 ?auto_135899 ?auto_135900 ?auto_135901 ?auto_135902 ?auto_135903 )
      ( MAKE-9PILE ?auto_135897 ?auto_135898 ?auto_135899 ?auto_135900 ?auto_135901 ?auto_135902 ?auto_135903 ?auto_135904 ?auto_135905 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_135935 - BLOCK
      ?auto_135936 - BLOCK
      ?auto_135937 - BLOCK
      ?auto_135938 - BLOCK
      ?auto_135939 - BLOCK
      ?auto_135940 - BLOCK
      ?auto_135941 - BLOCK
      ?auto_135942 - BLOCK
      ?auto_135943 - BLOCK
    )
    :vars
    (
      ?auto_135944 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_135943 ?auto_135944 ) ( ON-TABLE ?auto_135935 ) ( ON ?auto_135936 ?auto_135935 ) ( ON ?auto_135937 ?auto_135936 ) ( ON ?auto_135938 ?auto_135937 ) ( ON ?auto_135939 ?auto_135938 ) ( not ( = ?auto_135935 ?auto_135936 ) ) ( not ( = ?auto_135935 ?auto_135937 ) ) ( not ( = ?auto_135935 ?auto_135938 ) ) ( not ( = ?auto_135935 ?auto_135939 ) ) ( not ( = ?auto_135935 ?auto_135940 ) ) ( not ( = ?auto_135935 ?auto_135941 ) ) ( not ( = ?auto_135935 ?auto_135942 ) ) ( not ( = ?auto_135935 ?auto_135943 ) ) ( not ( = ?auto_135935 ?auto_135944 ) ) ( not ( = ?auto_135936 ?auto_135937 ) ) ( not ( = ?auto_135936 ?auto_135938 ) ) ( not ( = ?auto_135936 ?auto_135939 ) ) ( not ( = ?auto_135936 ?auto_135940 ) ) ( not ( = ?auto_135936 ?auto_135941 ) ) ( not ( = ?auto_135936 ?auto_135942 ) ) ( not ( = ?auto_135936 ?auto_135943 ) ) ( not ( = ?auto_135936 ?auto_135944 ) ) ( not ( = ?auto_135937 ?auto_135938 ) ) ( not ( = ?auto_135937 ?auto_135939 ) ) ( not ( = ?auto_135937 ?auto_135940 ) ) ( not ( = ?auto_135937 ?auto_135941 ) ) ( not ( = ?auto_135937 ?auto_135942 ) ) ( not ( = ?auto_135937 ?auto_135943 ) ) ( not ( = ?auto_135937 ?auto_135944 ) ) ( not ( = ?auto_135938 ?auto_135939 ) ) ( not ( = ?auto_135938 ?auto_135940 ) ) ( not ( = ?auto_135938 ?auto_135941 ) ) ( not ( = ?auto_135938 ?auto_135942 ) ) ( not ( = ?auto_135938 ?auto_135943 ) ) ( not ( = ?auto_135938 ?auto_135944 ) ) ( not ( = ?auto_135939 ?auto_135940 ) ) ( not ( = ?auto_135939 ?auto_135941 ) ) ( not ( = ?auto_135939 ?auto_135942 ) ) ( not ( = ?auto_135939 ?auto_135943 ) ) ( not ( = ?auto_135939 ?auto_135944 ) ) ( not ( = ?auto_135940 ?auto_135941 ) ) ( not ( = ?auto_135940 ?auto_135942 ) ) ( not ( = ?auto_135940 ?auto_135943 ) ) ( not ( = ?auto_135940 ?auto_135944 ) ) ( not ( = ?auto_135941 ?auto_135942 ) ) ( not ( = ?auto_135941 ?auto_135943 ) ) ( not ( = ?auto_135941 ?auto_135944 ) ) ( not ( = ?auto_135942 ?auto_135943 ) ) ( not ( = ?auto_135942 ?auto_135944 ) ) ( not ( = ?auto_135943 ?auto_135944 ) ) ( ON ?auto_135942 ?auto_135943 ) ( ON ?auto_135941 ?auto_135942 ) ( CLEAR ?auto_135939 ) ( ON ?auto_135940 ?auto_135941 ) ( CLEAR ?auto_135940 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_135935 ?auto_135936 ?auto_135937 ?auto_135938 ?auto_135939 ?auto_135940 )
      ( MAKE-9PILE ?auto_135935 ?auto_135936 ?auto_135937 ?auto_135938 ?auto_135939 ?auto_135940 ?auto_135941 ?auto_135942 ?auto_135943 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_135973 - BLOCK
      ?auto_135974 - BLOCK
      ?auto_135975 - BLOCK
      ?auto_135976 - BLOCK
      ?auto_135977 - BLOCK
      ?auto_135978 - BLOCK
      ?auto_135979 - BLOCK
      ?auto_135980 - BLOCK
      ?auto_135981 - BLOCK
    )
    :vars
    (
      ?auto_135982 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_135981 ?auto_135982 ) ( ON-TABLE ?auto_135973 ) ( ON ?auto_135974 ?auto_135973 ) ( ON ?auto_135975 ?auto_135974 ) ( ON ?auto_135976 ?auto_135975 ) ( not ( = ?auto_135973 ?auto_135974 ) ) ( not ( = ?auto_135973 ?auto_135975 ) ) ( not ( = ?auto_135973 ?auto_135976 ) ) ( not ( = ?auto_135973 ?auto_135977 ) ) ( not ( = ?auto_135973 ?auto_135978 ) ) ( not ( = ?auto_135973 ?auto_135979 ) ) ( not ( = ?auto_135973 ?auto_135980 ) ) ( not ( = ?auto_135973 ?auto_135981 ) ) ( not ( = ?auto_135973 ?auto_135982 ) ) ( not ( = ?auto_135974 ?auto_135975 ) ) ( not ( = ?auto_135974 ?auto_135976 ) ) ( not ( = ?auto_135974 ?auto_135977 ) ) ( not ( = ?auto_135974 ?auto_135978 ) ) ( not ( = ?auto_135974 ?auto_135979 ) ) ( not ( = ?auto_135974 ?auto_135980 ) ) ( not ( = ?auto_135974 ?auto_135981 ) ) ( not ( = ?auto_135974 ?auto_135982 ) ) ( not ( = ?auto_135975 ?auto_135976 ) ) ( not ( = ?auto_135975 ?auto_135977 ) ) ( not ( = ?auto_135975 ?auto_135978 ) ) ( not ( = ?auto_135975 ?auto_135979 ) ) ( not ( = ?auto_135975 ?auto_135980 ) ) ( not ( = ?auto_135975 ?auto_135981 ) ) ( not ( = ?auto_135975 ?auto_135982 ) ) ( not ( = ?auto_135976 ?auto_135977 ) ) ( not ( = ?auto_135976 ?auto_135978 ) ) ( not ( = ?auto_135976 ?auto_135979 ) ) ( not ( = ?auto_135976 ?auto_135980 ) ) ( not ( = ?auto_135976 ?auto_135981 ) ) ( not ( = ?auto_135976 ?auto_135982 ) ) ( not ( = ?auto_135977 ?auto_135978 ) ) ( not ( = ?auto_135977 ?auto_135979 ) ) ( not ( = ?auto_135977 ?auto_135980 ) ) ( not ( = ?auto_135977 ?auto_135981 ) ) ( not ( = ?auto_135977 ?auto_135982 ) ) ( not ( = ?auto_135978 ?auto_135979 ) ) ( not ( = ?auto_135978 ?auto_135980 ) ) ( not ( = ?auto_135978 ?auto_135981 ) ) ( not ( = ?auto_135978 ?auto_135982 ) ) ( not ( = ?auto_135979 ?auto_135980 ) ) ( not ( = ?auto_135979 ?auto_135981 ) ) ( not ( = ?auto_135979 ?auto_135982 ) ) ( not ( = ?auto_135980 ?auto_135981 ) ) ( not ( = ?auto_135980 ?auto_135982 ) ) ( not ( = ?auto_135981 ?auto_135982 ) ) ( ON ?auto_135980 ?auto_135981 ) ( ON ?auto_135979 ?auto_135980 ) ( ON ?auto_135978 ?auto_135979 ) ( CLEAR ?auto_135976 ) ( ON ?auto_135977 ?auto_135978 ) ( CLEAR ?auto_135977 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_135973 ?auto_135974 ?auto_135975 ?auto_135976 ?auto_135977 )
      ( MAKE-9PILE ?auto_135973 ?auto_135974 ?auto_135975 ?auto_135976 ?auto_135977 ?auto_135978 ?auto_135979 ?auto_135980 ?auto_135981 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_136011 - BLOCK
      ?auto_136012 - BLOCK
      ?auto_136013 - BLOCK
      ?auto_136014 - BLOCK
      ?auto_136015 - BLOCK
      ?auto_136016 - BLOCK
      ?auto_136017 - BLOCK
      ?auto_136018 - BLOCK
      ?auto_136019 - BLOCK
    )
    :vars
    (
      ?auto_136020 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_136019 ?auto_136020 ) ( ON-TABLE ?auto_136011 ) ( ON ?auto_136012 ?auto_136011 ) ( ON ?auto_136013 ?auto_136012 ) ( not ( = ?auto_136011 ?auto_136012 ) ) ( not ( = ?auto_136011 ?auto_136013 ) ) ( not ( = ?auto_136011 ?auto_136014 ) ) ( not ( = ?auto_136011 ?auto_136015 ) ) ( not ( = ?auto_136011 ?auto_136016 ) ) ( not ( = ?auto_136011 ?auto_136017 ) ) ( not ( = ?auto_136011 ?auto_136018 ) ) ( not ( = ?auto_136011 ?auto_136019 ) ) ( not ( = ?auto_136011 ?auto_136020 ) ) ( not ( = ?auto_136012 ?auto_136013 ) ) ( not ( = ?auto_136012 ?auto_136014 ) ) ( not ( = ?auto_136012 ?auto_136015 ) ) ( not ( = ?auto_136012 ?auto_136016 ) ) ( not ( = ?auto_136012 ?auto_136017 ) ) ( not ( = ?auto_136012 ?auto_136018 ) ) ( not ( = ?auto_136012 ?auto_136019 ) ) ( not ( = ?auto_136012 ?auto_136020 ) ) ( not ( = ?auto_136013 ?auto_136014 ) ) ( not ( = ?auto_136013 ?auto_136015 ) ) ( not ( = ?auto_136013 ?auto_136016 ) ) ( not ( = ?auto_136013 ?auto_136017 ) ) ( not ( = ?auto_136013 ?auto_136018 ) ) ( not ( = ?auto_136013 ?auto_136019 ) ) ( not ( = ?auto_136013 ?auto_136020 ) ) ( not ( = ?auto_136014 ?auto_136015 ) ) ( not ( = ?auto_136014 ?auto_136016 ) ) ( not ( = ?auto_136014 ?auto_136017 ) ) ( not ( = ?auto_136014 ?auto_136018 ) ) ( not ( = ?auto_136014 ?auto_136019 ) ) ( not ( = ?auto_136014 ?auto_136020 ) ) ( not ( = ?auto_136015 ?auto_136016 ) ) ( not ( = ?auto_136015 ?auto_136017 ) ) ( not ( = ?auto_136015 ?auto_136018 ) ) ( not ( = ?auto_136015 ?auto_136019 ) ) ( not ( = ?auto_136015 ?auto_136020 ) ) ( not ( = ?auto_136016 ?auto_136017 ) ) ( not ( = ?auto_136016 ?auto_136018 ) ) ( not ( = ?auto_136016 ?auto_136019 ) ) ( not ( = ?auto_136016 ?auto_136020 ) ) ( not ( = ?auto_136017 ?auto_136018 ) ) ( not ( = ?auto_136017 ?auto_136019 ) ) ( not ( = ?auto_136017 ?auto_136020 ) ) ( not ( = ?auto_136018 ?auto_136019 ) ) ( not ( = ?auto_136018 ?auto_136020 ) ) ( not ( = ?auto_136019 ?auto_136020 ) ) ( ON ?auto_136018 ?auto_136019 ) ( ON ?auto_136017 ?auto_136018 ) ( ON ?auto_136016 ?auto_136017 ) ( ON ?auto_136015 ?auto_136016 ) ( CLEAR ?auto_136013 ) ( ON ?auto_136014 ?auto_136015 ) ( CLEAR ?auto_136014 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_136011 ?auto_136012 ?auto_136013 ?auto_136014 )
      ( MAKE-9PILE ?auto_136011 ?auto_136012 ?auto_136013 ?auto_136014 ?auto_136015 ?auto_136016 ?auto_136017 ?auto_136018 ?auto_136019 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_136049 - BLOCK
      ?auto_136050 - BLOCK
      ?auto_136051 - BLOCK
      ?auto_136052 - BLOCK
      ?auto_136053 - BLOCK
      ?auto_136054 - BLOCK
      ?auto_136055 - BLOCK
      ?auto_136056 - BLOCK
      ?auto_136057 - BLOCK
    )
    :vars
    (
      ?auto_136058 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_136057 ?auto_136058 ) ( ON-TABLE ?auto_136049 ) ( ON ?auto_136050 ?auto_136049 ) ( not ( = ?auto_136049 ?auto_136050 ) ) ( not ( = ?auto_136049 ?auto_136051 ) ) ( not ( = ?auto_136049 ?auto_136052 ) ) ( not ( = ?auto_136049 ?auto_136053 ) ) ( not ( = ?auto_136049 ?auto_136054 ) ) ( not ( = ?auto_136049 ?auto_136055 ) ) ( not ( = ?auto_136049 ?auto_136056 ) ) ( not ( = ?auto_136049 ?auto_136057 ) ) ( not ( = ?auto_136049 ?auto_136058 ) ) ( not ( = ?auto_136050 ?auto_136051 ) ) ( not ( = ?auto_136050 ?auto_136052 ) ) ( not ( = ?auto_136050 ?auto_136053 ) ) ( not ( = ?auto_136050 ?auto_136054 ) ) ( not ( = ?auto_136050 ?auto_136055 ) ) ( not ( = ?auto_136050 ?auto_136056 ) ) ( not ( = ?auto_136050 ?auto_136057 ) ) ( not ( = ?auto_136050 ?auto_136058 ) ) ( not ( = ?auto_136051 ?auto_136052 ) ) ( not ( = ?auto_136051 ?auto_136053 ) ) ( not ( = ?auto_136051 ?auto_136054 ) ) ( not ( = ?auto_136051 ?auto_136055 ) ) ( not ( = ?auto_136051 ?auto_136056 ) ) ( not ( = ?auto_136051 ?auto_136057 ) ) ( not ( = ?auto_136051 ?auto_136058 ) ) ( not ( = ?auto_136052 ?auto_136053 ) ) ( not ( = ?auto_136052 ?auto_136054 ) ) ( not ( = ?auto_136052 ?auto_136055 ) ) ( not ( = ?auto_136052 ?auto_136056 ) ) ( not ( = ?auto_136052 ?auto_136057 ) ) ( not ( = ?auto_136052 ?auto_136058 ) ) ( not ( = ?auto_136053 ?auto_136054 ) ) ( not ( = ?auto_136053 ?auto_136055 ) ) ( not ( = ?auto_136053 ?auto_136056 ) ) ( not ( = ?auto_136053 ?auto_136057 ) ) ( not ( = ?auto_136053 ?auto_136058 ) ) ( not ( = ?auto_136054 ?auto_136055 ) ) ( not ( = ?auto_136054 ?auto_136056 ) ) ( not ( = ?auto_136054 ?auto_136057 ) ) ( not ( = ?auto_136054 ?auto_136058 ) ) ( not ( = ?auto_136055 ?auto_136056 ) ) ( not ( = ?auto_136055 ?auto_136057 ) ) ( not ( = ?auto_136055 ?auto_136058 ) ) ( not ( = ?auto_136056 ?auto_136057 ) ) ( not ( = ?auto_136056 ?auto_136058 ) ) ( not ( = ?auto_136057 ?auto_136058 ) ) ( ON ?auto_136056 ?auto_136057 ) ( ON ?auto_136055 ?auto_136056 ) ( ON ?auto_136054 ?auto_136055 ) ( ON ?auto_136053 ?auto_136054 ) ( ON ?auto_136052 ?auto_136053 ) ( CLEAR ?auto_136050 ) ( ON ?auto_136051 ?auto_136052 ) ( CLEAR ?auto_136051 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_136049 ?auto_136050 ?auto_136051 )
      ( MAKE-9PILE ?auto_136049 ?auto_136050 ?auto_136051 ?auto_136052 ?auto_136053 ?auto_136054 ?auto_136055 ?auto_136056 ?auto_136057 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_136087 - BLOCK
      ?auto_136088 - BLOCK
      ?auto_136089 - BLOCK
      ?auto_136090 - BLOCK
      ?auto_136091 - BLOCK
      ?auto_136092 - BLOCK
      ?auto_136093 - BLOCK
      ?auto_136094 - BLOCK
      ?auto_136095 - BLOCK
    )
    :vars
    (
      ?auto_136096 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_136095 ?auto_136096 ) ( ON-TABLE ?auto_136087 ) ( not ( = ?auto_136087 ?auto_136088 ) ) ( not ( = ?auto_136087 ?auto_136089 ) ) ( not ( = ?auto_136087 ?auto_136090 ) ) ( not ( = ?auto_136087 ?auto_136091 ) ) ( not ( = ?auto_136087 ?auto_136092 ) ) ( not ( = ?auto_136087 ?auto_136093 ) ) ( not ( = ?auto_136087 ?auto_136094 ) ) ( not ( = ?auto_136087 ?auto_136095 ) ) ( not ( = ?auto_136087 ?auto_136096 ) ) ( not ( = ?auto_136088 ?auto_136089 ) ) ( not ( = ?auto_136088 ?auto_136090 ) ) ( not ( = ?auto_136088 ?auto_136091 ) ) ( not ( = ?auto_136088 ?auto_136092 ) ) ( not ( = ?auto_136088 ?auto_136093 ) ) ( not ( = ?auto_136088 ?auto_136094 ) ) ( not ( = ?auto_136088 ?auto_136095 ) ) ( not ( = ?auto_136088 ?auto_136096 ) ) ( not ( = ?auto_136089 ?auto_136090 ) ) ( not ( = ?auto_136089 ?auto_136091 ) ) ( not ( = ?auto_136089 ?auto_136092 ) ) ( not ( = ?auto_136089 ?auto_136093 ) ) ( not ( = ?auto_136089 ?auto_136094 ) ) ( not ( = ?auto_136089 ?auto_136095 ) ) ( not ( = ?auto_136089 ?auto_136096 ) ) ( not ( = ?auto_136090 ?auto_136091 ) ) ( not ( = ?auto_136090 ?auto_136092 ) ) ( not ( = ?auto_136090 ?auto_136093 ) ) ( not ( = ?auto_136090 ?auto_136094 ) ) ( not ( = ?auto_136090 ?auto_136095 ) ) ( not ( = ?auto_136090 ?auto_136096 ) ) ( not ( = ?auto_136091 ?auto_136092 ) ) ( not ( = ?auto_136091 ?auto_136093 ) ) ( not ( = ?auto_136091 ?auto_136094 ) ) ( not ( = ?auto_136091 ?auto_136095 ) ) ( not ( = ?auto_136091 ?auto_136096 ) ) ( not ( = ?auto_136092 ?auto_136093 ) ) ( not ( = ?auto_136092 ?auto_136094 ) ) ( not ( = ?auto_136092 ?auto_136095 ) ) ( not ( = ?auto_136092 ?auto_136096 ) ) ( not ( = ?auto_136093 ?auto_136094 ) ) ( not ( = ?auto_136093 ?auto_136095 ) ) ( not ( = ?auto_136093 ?auto_136096 ) ) ( not ( = ?auto_136094 ?auto_136095 ) ) ( not ( = ?auto_136094 ?auto_136096 ) ) ( not ( = ?auto_136095 ?auto_136096 ) ) ( ON ?auto_136094 ?auto_136095 ) ( ON ?auto_136093 ?auto_136094 ) ( ON ?auto_136092 ?auto_136093 ) ( ON ?auto_136091 ?auto_136092 ) ( ON ?auto_136090 ?auto_136091 ) ( ON ?auto_136089 ?auto_136090 ) ( CLEAR ?auto_136087 ) ( ON ?auto_136088 ?auto_136089 ) ( CLEAR ?auto_136088 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_136087 ?auto_136088 )
      ( MAKE-9PILE ?auto_136087 ?auto_136088 ?auto_136089 ?auto_136090 ?auto_136091 ?auto_136092 ?auto_136093 ?auto_136094 ?auto_136095 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_136125 - BLOCK
      ?auto_136126 - BLOCK
      ?auto_136127 - BLOCK
      ?auto_136128 - BLOCK
      ?auto_136129 - BLOCK
      ?auto_136130 - BLOCK
      ?auto_136131 - BLOCK
      ?auto_136132 - BLOCK
      ?auto_136133 - BLOCK
    )
    :vars
    (
      ?auto_136134 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_136133 ?auto_136134 ) ( not ( = ?auto_136125 ?auto_136126 ) ) ( not ( = ?auto_136125 ?auto_136127 ) ) ( not ( = ?auto_136125 ?auto_136128 ) ) ( not ( = ?auto_136125 ?auto_136129 ) ) ( not ( = ?auto_136125 ?auto_136130 ) ) ( not ( = ?auto_136125 ?auto_136131 ) ) ( not ( = ?auto_136125 ?auto_136132 ) ) ( not ( = ?auto_136125 ?auto_136133 ) ) ( not ( = ?auto_136125 ?auto_136134 ) ) ( not ( = ?auto_136126 ?auto_136127 ) ) ( not ( = ?auto_136126 ?auto_136128 ) ) ( not ( = ?auto_136126 ?auto_136129 ) ) ( not ( = ?auto_136126 ?auto_136130 ) ) ( not ( = ?auto_136126 ?auto_136131 ) ) ( not ( = ?auto_136126 ?auto_136132 ) ) ( not ( = ?auto_136126 ?auto_136133 ) ) ( not ( = ?auto_136126 ?auto_136134 ) ) ( not ( = ?auto_136127 ?auto_136128 ) ) ( not ( = ?auto_136127 ?auto_136129 ) ) ( not ( = ?auto_136127 ?auto_136130 ) ) ( not ( = ?auto_136127 ?auto_136131 ) ) ( not ( = ?auto_136127 ?auto_136132 ) ) ( not ( = ?auto_136127 ?auto_136133 ) ) ( not ( = ?auto_136127 ?auto_136134 ) ) ( not ( = ?auto_136128 ?auto_136129 ) ) ( not ( = ?auto_136128 ?auto_136130 ) ) ( not ( = ?auto_136128 ?auto_136131 ) ) ( not ( = ?auto_136128 ?auto_136132 ) ) ( not ( = ?auto_136128 ?auto_136133 ) ) ( not ( = ?auto_136128 ?auto_136134 ) ) ( not ( = ?auto_136129 ?auto_136130 ) ) ( not ( = ?auto_136129 ?auto_136131 ) ) ( not ( = ?auto_136129 ?auto_136132 ) ) ( not ( = ?auto_136129 ?auto_136133 ) ) ( not ( = ?auto_136129 ?auto_136134 ) ) ( not ( = ?auto_136130 ?auto_136131 ) ) ( not ( = ?auto_136130 ?auto_136132 ) ) ( not ( = ?auto_136130 ?auto_136133 ) ) ( not ( = ?auto_136130 ?auto_136134 ) ) ( not ( = ?auto_136131 ?auto_136132 ) ) ( not ( = ?auto_136131 ?auto_136133 ) ) ( not ( = ?auto_136131 ?auto_136134 ) ) ( not ( = ?auto_136132 ?auto_136133 ) ) ( not ( = ?auto_136132 ?auto_136134 ) ) ( not ( = ?auto_136133 ?auto_136134 ) ) ( ON ?auto_136132 ?auto_136133 ) ( ON ?auto_136131 ?auto_136132 ) ( ON ?auto_136130 ?auto_136131 ) ( ON ?auto_136129 ?auto_136130 ) ( ON ?auto_136128 ?auto_136129 ) ( ON ?auto_136127 ?auto_136128 ) ( ON ?auto_136126 ?auto_136127 ) ( ON ?auto_136125 ?auto_136126 ) ( CLEAR ?auto_136125 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_136125 )
      ( MAKE-9PILE ?auto_136125 ?auto_136126 ?auto_136127 ?auto_136128 ?auto_136129 ?auto_136130 ?auto_136131 ?auto_136132 ?auto_136133 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_136164 - BLOCK
      ?auto_136165 - BLOCK
      ?auto_136166 - BLOCK
      ?auto_136167 - BLOCK
      ?auto_136168 - BLOCK
      ?auto_136169 - BLOCK
      ?auto_136170 - BLOCK
      ?auto_136171 - BLOCK
      ?auto_136172 - BLOCK
      ?auto_136173 - BLOCK
    )
    :vars
    (
      ?auto_136174 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_136172 ) ( ON ?auto_136173 ?auto_136174 ) ( CLEAR ?auto_136173 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_136164 ) ( ON ?auto_136165 ?auto_136164 ) ( ON ?auto_136166 ?auto_136165 ) ( ON ?auto_136167 ?auto_136166 ) ( ON ?auto_136168 ?auto_136167 ) ( ON ?auto_136169 ?auto_136168 ) ( ON ?auto_136170 ?auto_136169 ) ( ON ?auto_136171 ?auto_136170 ) ( ON ?auto_136172 ?auto_136171 ) ( not ( = ?auto_136164 ?auto_136165 ) ) ( not ( = ?auto_136164 ?auto_136166 ) ) ( not ( = ?auto_136164 ?auto_136167 ) ) ( not ( = ?auto_136164 ?auto_136168 ) ) ( not ( = ?auto_136164 ?auto_136169 ) ) ( not ( = ?auto_136164 ?auto_136170 ) ) ( not ( = ?auto_136164 ?auto_136171 ) ) ( not ( = ?auto_136164 ?auto_136172 ) ) ( not ( = ?auto_136164 ?auto_136173 ) ) ( not ( = ?auto_136164 ?auto_136174 ) ) ( not ( = ?auto_136165 ?auto_136166 ) ) ( not ( = ?auto_136165 ?auto_136167 ) ) ( not ( = ?auto_136165 ?auto_136168 ) ) ( not ( = ?auto_136165 ?auto_136169 ) ) ( not ( = ?auto_136165 ?auto_136170 ) ) ( not ( = ?auto_136165 ?auto_136171 ) ) ( not ( = ?auto_136165 ?auto_136172 ) ) ( not ( = ?auto_136165 ?auto_136173 ) ) ( not ( = ?auto_136165 ?auto_136174 ) ) ( not ( = ?auto_136166 ?auto_136167 ) ) ( not ( = ?auto_136166 ?auto_136168 ) ) ( not ( = ?auto_136166 ?auto_136169 ) ) ( not ( = ?auto_136166 ?auto_136170 ) ) ( not ( = ?auto_136166 ?auto_136171 ) ) ( not ( = ?auto_136166 ?auto_136172 ) ) ( not ( = ?auto_136166 ?auto_136173 ) ) ( not ( = ?auto_136166 ?auto_136174 ) ) ( not ( = ?auto_136167 ?auto_136168 ) ) ( not ( = ?auto_136167 ?auto_136169 ) ) ( not ( = ?auto_136167 ?auto_136170 ) ) ( not ( = ?auto_136167 ?auto_136171 ) ) ( not ( = ?auto_136167 ?auto_136172 ) ) ( not ( = ?auto_136167 ?auto_136173 ) ) ( not ( = ?auto_136167 ?auto_136174 ) ) ( not ( = ?auto_136168 ?auto_136169 ) ) ( not ( = ?auto_136168 ?auto_136170 ) ) ( not ( = ?auto_136168 ?auto_136171 ) ) ( not ( = ?auto_136168 ?auto_136172 ) ) ( not ( = ?auto_136168 ?auto_136173 ) ) ( not ( = ?auto_136168 ?auto_136174 ) ) ( not ( = ?auto_136169 ?auto_136170 ) ) ( not ( = ?auto_136169 ?auto_136171 ) ) ( not ( = ?auto_136169 ?auto_136172 ) ) ( not ( = ?auto_136169 ?auto_136173 ) ) ( not ( = ?auto_136169 ?auto_136174 ) ) ( not ( = ?auto_136170 ?auto_136171 ) ) ( not ( = ?auto_136170 ?auto_136172 ) ) ( not ( = ?auto_136170 ?auto_136173 ) ) ( not ( = ?auto_136170 ?auto_136174 ) ) ( not ( = ?auto_136171 ?auto_136172 ) ) ( not ( = ?auto_136171 ?auto_136173 ) ) ( not ( = ?auto_136171 ?auto_136174 ) ) ( not ( = ?auto_136172 ?auto_136173 ) ) ( not ( = ?auto_136172 ?auto_136174 ) ) ( not ( = ?auto_136173 ?auto_136174 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_136173 ?auto_136174 )
      ( !STACK ?auto_136173 ?auto_136172 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_136206 - BLOCK
      ?auto_136207 - BLOCK
      ?auto_136208 - BLOCK
      ?auto_136209 - BLOCK
      ?auto_136210 - BLOCK
      ?auto_136211 - BLOCK
      ?auto_136212 - BLOCK
      ?auto_136213 - BLOCK
      ?auto_136214 - BLOCK
      ?auto_136215 - BLOCK
    )
    :vars
    (
      ?auto_136216 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_136215 ?auto_136216 ) ( ON-TABLE ?auto_136206 ) ( ON ?auto_136207 ?auto_136206 ) ( ON ?auto_136208 ?auto_136207 ) ( ON ?auto_136209 ?auto_136208 ) ( ON ?auto_136210 ?auto_136209 ) ( ON ?auto_136211 ?auto_136210 ) ( ON ?auto_136212 ?auto_136211 ) ( ON ?auto_136213 ?auto_136212 ) ( not ( = ?auto_136206 ?auto_136207 ) ) ( not ( = ?auto_136206 ?auto_136208 ) ) ( not ( = ?auto_136206 ?auto_136209 ) ) ( not ( = ?auto_136206 ?auto_136210 ) ) ( not ( = ?auto_136206 ?auto_136211 ) ) ( not ( = ?auto_136206 ?auto_136212 ) ) ( not ( = ?auto_136206 ?auto_136213 ) ) ( not ( = ?auto_136206 ?auto_136214 ) ) ( not ( = ?auto_136206 ?auto_136215 ) ) ( not ( = ?auto_136206 ?auto_136216 ) ) ( not ( = ?auto_136207 ?auto_136208 ) ) ( not ( = ?auto_136207 ?auto_136209 ) ) ( not ( = ?auto_136207 ?auto_136210 ) ) ( not ( = ?auto_136207 ?auto_136211 ) ) ( not ( = ?auto_136207 ?auto_136212 ) ) ( not ( = ?auto_136207 ?auto_136213 ) ) ( not ( = ?auto_136207 ?auto_136214 ) ) ( not ( = ?auto_136207 ?auto_136215 ) ) ( not ( = ?auto_136207 ?auto_136216 ) ) ( not ( = ?auto_136208 ?auto_136209 ) ) ( not ( = ?auto_136208 ?auto_136210 ) ) ( not ( = ?auto_136208 ?auto_136211 ) ) ( not ( = ?auto_136208 ?auto_136212 ) ) ( not ( = ?auto_136208 ?auto_136213 ) ) ( not ( = ?auto_136208 ?auto_136214 ) ) ( not ( = ?auto_136208 ?auto_136215 ) ) ( not ( = ?auto_136208 ?auto_136216 ) ) ( not ( = ?auto_136209 ?auto_136210 ) ) ( not ( = ?auto_136209 ?auto_136211 ) ) ( not ( = ?auto_136209 ?auto_136212 ) ) ( not ( = ?auto_136209 ?auto_136213 ) ) ( not ( = ?auto_136209 ?auto_136214 ) ) ( not ( = ?auto_136209 ?auto_136215 ) ) ( not ( = ?auto_136209 ?auto_136216 ) ) ( not ( = ?auto_136210 ?auto_136211 ) ) ( not ( = ?auto_136210 ?auto_136212 ) ) ( not ( = ?auto_136210 ?auto_136213 ) ) ( not ( = ?auto_136210 ?auto_136214 ) ) ( not ( = ?auto_136210 ?auto_136215 ) ) ( not ( = ?auto_136210 ?auto_136216 ) ) ( not ( = ?auto_136211 ?auto_136212 ) ) ( not ( = ?auto_136211 ?auto_136213 ) ) ( not ( = ?auto_136211 ?auto_136214 ) ) ( not ( = ?auto_136211 ?auto_136215 ) ) ( not ( = ?auto_136211 ?auto_136216 ) ) ( not ( = ?auto_136212 ?auto_136213 ) ) ( not ( = ?auto_136212 ?auto_136214 ) ) ( not ( = ?auto_136212 ?auto_136215 ) ) ( not ( = ?auto_136212 ?auto_136216 ) ) ( not ( = ?auto_136213 ?auto_136214 ) ) ( not ( = ?auto_136213 ?auto_136215 ) ) ( not ( = ?auto_136213 ?auto_136216 ) ) ( not ( = ?auto_136214 ?auto_136215 ) ) ( not ( = ?auto_136214 ?auto_136216 ) ) ( not ( = ?auto_136215 ?auto_136216 ) ) ( CLEAR ?auto_136213 ) ( ON ?auto_136214 ?auto_136215 ) ( CLEAR ?auto_136214 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_136206 ?auto_136207 ?auto_136208 ?auto_136209 ?auto_136210 ?auto_136211 ?auto_136212 ?auto_136213 ?auto_136214 )
      ( MAKE-10PILE ?auto_136206 ?auto_136207 ?auto_136208 ?auto_136209 ?auto_136210 ?auto_136211 ?auto_136212 ?auto_136213 ?auto_136214 ?auto_136215 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_136248 - BLOCK
      ?auto_136249 - BLOCK
      ?auto_136250 - BLOCK
      ?auto_136251 - BLOCK
      ?auto_136252 - BLOCK
      ?auto_136253 - BLOCK
      ?auto_136254 - BLOCK
      ?auto_136255 - BLOCK
      ?auto_136256 - BLOCK
      ?auto_136257 - BLOCK
    )
    :vars
    (
      ?auto_136258 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_136257 ?auto_136258 ) ( ON-TABLE ?auto_136248 ) ( ON ?auto_136249 ?auto_136248 ) ( ON ?auto_136250 ?auto_136249 ) ( ON ?auto_136251 ?auto_136250 ) ( ON ?auto_136252 ?auto_136251 ) ( ON ?auto_136253 ?auto_136252 ) ( ON ?auto_136254 ?auto_136253 ) ( not ( = ?auto_136248 ?auto_136249 ) ) ( not ( = ?auto_136248 ?auto_136250 ) ) ( not ( = ?auto_136248 ?auto_136251 ) ) ( not ( = ?auto_136248 ?auto_136252 ) ) ( not ( = ?auto_136248 ?auto_136253 ) ) ( not ( = ?auto_136248 ?auto_136254 ) ) ( not ( = ?auto_136248 ?auto_136255 ) ) ( not ( = ?auto_136248 ?auto_136256 ) ) ( not ( = ?auto_136248 ?auto_136257 ) ) ( not ( = ?auto_136248 ?auto_136258 ) ) ( not ( = ?auto_136249 ?auto_136250 ) ) ( not ( = ?auto_136249 ?auto_136251 ) ) ( not ( = ?auto_136249 ?auto_136252 ) ) ( not ( = ?auto_136249 ?auto_136253 ) ) ( not ( = ?auto_136249 ?auto_136254 ) ) ( not ( = ?auto_136249 ?auto_136255 ) ) ( not ( = ?auto_136249 ?auto_136256 ) ) ( not ( = ?auto_136249 ?auto_136257 ) ) ( not ( = ?auto_136249 ?auto_136258 ) ) ( not ( = ?auto_136250 ?auto_136251 ) ) ( not ( = ?auto_136250 ?auto_136252 ) ) ( not ( = ?auto_136250 ?auto_136253 ) ) ( not ( = ?auto_136250 ?auto_136254 ) ) ( not ( = ?auto_136250 ?auto_136255 ) ) ( not ( = ?auto_136250 ?auto_136256 ) ) ( not ( = ?auto_136250 ?auto_136257 ) ) ( not ( = ?auto_136250 ?auto_136258 ) ) ( not ( = ?auto_136251 ?auto_136252 ) ) ( not ( = ?auto_136251 ?auto_136253 ) ) ( not ( = ?auto_136251 ?auto_136254 ) ) ( not ( = ?auto_136251 ?auto_136255 ) ) ( not ( = ?auto_136251 ?auto_136256 ) ) ( not ( = ?auto_136251 ?auto_136257 ) ) ( not ( = ?auto_136251 ?auto_136258 ) ) ( not ( = ?auto_136252 ?auto_136253 ) ) ( not ( = ?auto_136252 ?auto_136254 ) ) ( not ( = ?auto_136252 ?auto_136255 ) ) ( not ( = ?auto_136252 ?auto_136256 ) ) ( not ( = ?auto_136252 ?auto_136257 ) ) ( not ( = ?auto_136252 ?auto_136258 ) ) ( not ( = ?auto_136253 ?auto_136254 ) ) ( not ( = ?auto_136253 ?auto_136255 ) ) ( not ( = ?auto_136253 ?auto_136256 ) ) ( not ( = ?auto_136253 ?auto_136257 ) ) ( not ( = ?auto_136253 ?auto_136258 ) ) ( not ( = ?auto_136254 ?auto_136255 ) ) ( not ( = ?auto_136254 ?auto_136256 ) ) ( not ( = ?auto_136254 ?auto_136257 ) ) ( not ( = ?auto_136254 ?auto_136258 ) ) ( not ( = ?auto_136255 ?auto_136256 ) ) ( not ( = ?auto_136255 ?auto_136257 ) ) ( not ( = ?auto_136255 ?auto_136258 ) ) ( not ( = ?auto_136256 ?auto_136257 ) ) ( not ( = ?auto_136256 ?auto_136258 ) ) ( not ( = ?auto_136257 ?auto_136258 ) ) ( ON ?auto_136256 ?auto_136257 ) ( CLEAR ?auto_136254 ) ( ON ?auto_136255 ?auto_136256 ) ( CLEAR ?auto_136255 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_136248 ?auto_136249 ?auto_136250 ?auto_136251 ?auto_136252 ?auto_136253 ?auto_136254 ?auto_136255 )
      ( MAKE-10PILE ?auto_136248 ?auto_136249 ?auto_136250 ?auto_136251 ?auto_136252 ?auto_136253 ?auto_136254 ?auto_136255 ?auto_136256 ?auto_136257 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_136290 - BLOCK
      ?auto_136291 - BLOCK
      ?auto_136292 - BLOCK
      ?auto_136293 - BLOCK
      ?auto_136294 - BLOCK
      ?auto_136295 - BLOCK
      ?auto_136296 - BLOCK
      ?auto_136297 - BLOCK
      ?auto_136298 - BLOCK
      ?auto_136299 - BLOCK
    )
    :vars
    (
      ?auto_136300 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_136299 ?auto_136300 ) ( ON-TABLE ?auto_136290 ) ( ON ?auto_136291 ?auto_136290 ) ( ON ?auto_136292 ?auto_136291 ) ( ON ?auto_136293 ?auto_136292 ) ( ON ?auto_136294 ?auto_136293 ) ( ON ?auto_136295 ?auto_136294 ) ( not ( = ?auto_136290 ?auto_136291 ) ) ( not ( = ?auto_136290 ?auto_136292 ) ) ( not ( = ?auto_136290 ?auto_136293 ) ) ( not ( = ?auto_136290 ?auto_136294 ) ) ( not ( = ?auto_136290 ?auto_136295 ) ) ( not ( = ?auto_136290 ?auto_136296 ) ) ( not ( = ?auto_136290 ?auto_136297 ) ) ( not ( = ?auto_136290 ?auto_136298 ) ) ( not ( = ?auto_136290 ?auto_136299 ) ) ( not ( = ?auto_136290 ?auto_136300 ) ) ( not ( = ?auto_136291 ?auto_136292 ) ) ( not ( = ?auto_136291 ?auto_136293 ) ) ( not ( = ?auto_136291 ?auto_136294 ) ) ( not ( = ?auto_136291 ?auto_136295 ) ) ( not ( = ?auto_136291 ?auto_136296 ) ) ( not ( = ?auto_136291 ?auto_136297 ) ) ( not ( = ?auto_136291 ?auto_136298 ) ) ( not ( = ?auto_136291 ?auto_136299 ) ) ( not ( = ?auto_136291 ?auto_136300 ) ) ( not ( = ?auto_136292 ?auto_136293 ) ) ( not ( = ?auto_136292 ?auto_136294 ) ) ( not ( = ?auto_136292 ?auto_136295 ) ) ( not ( = ?auto_136292 ?auto_136296 ) ) ( not ( = ?auto_136292 ?auto_136297 ) ) ( not ( = ?auto_136292 ?auto_136298 ) ) ( not ( = ?auto_136292 ?auto_136299 ) ) ( not ( = ?auto_136292 ?auto_136300 ) ) ( not ( = ?auto_136293 ?auto_136294 ) ) ( not ( = ?auto_136293 ?auto_136295 ) ) ( not ( = ?auto_136293 ?auto_136296 ) ) ( not ( = ?auto_136293 ?auto_136297 ) ) ( not ( = ?auto_136293 ?auto_136298 ) ) ( not ( = ?auto_136293 ?auto_136299 ) ) ( not ( = ?auto_136293 ?auto_136300 ) ) ( not ( = ?auto_136294 ?auto_136295 ) ) ( not ( = ?auto_136294 ?auto_136296 ) ) ( not ( = ?auto_136294 ?auto_136297 ) ) ( not ( = ?auto_136294 ?auto_136298 ) ) ( not ( = ?auto_136294 ?auto_136299 ) ) ( not ( = ?auto_136294 ?auto_136300 ) ) ( not ( = ?auto_136295 ?auto_136296 ) ) ( not ( = ?auto_136295 ?auto_136297 ) ) ( not ( = ?auto_136295 ?auto_136298 ) ) ( not ( = ?auto_136295 ?auto_136299 ) ) ( not ( = ?auto_136295 ?auto_136300 ) ) ( not ( = ?auto_136296 ?auto_136297 ) ) ( not ( = ?auto_136296 ?auto_136298 ) ) ( not ( = ?auto_136296 ?auto_136299 ) ) ( not ( = ?auto_136296 ?auto_136300 ) ) ( not ( = ?auto_136297 ?auto_136298 ) ) ( not ( = ?auto_136297 ?auto_136299 ) ) ( not ( = ?auto_136297 ?auto_136300 ) ) ( not ( = ?auto_136298 ?auto_136299 ) ) ( not ( = ?auto_136298 ?auto_136300 ) ) ( not ( = ?auto_136299 ?auto_136300 ) ) ( ON ?auto_136298 ?auto_136299 ) ( ON ?auto_136297 ?auto_136298 ) ( CLEAR ?auto_136295 ) ( ON ?auto_136296 ?auto_136297 ) ( CLEAR ?auto_136296 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_136290 ?auto_136291 ?auto_136292 ?auto_136293 ?auto_136294 ?auto_136295 ?auto_136296 )
      ( MAKE-10PILE ?auto_136290 ?auto_136291 ?auto_136292 ?auto_136293 ?auto_136294 ?auto_136295 ?auto_136296 ?auto_136297 ?auto_136298 ?auto_136299 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_136332 - BLOCK
      ?auto_136333 - BLOCK
      ?auto_136334 - BLOCK
      ?auto_136335 - BLOCK
      ?auto_136336 - BLOCK
      ?auto_136337 - BLOCK
      ?auto_136338 - BLOCK
      ?auto_136339 - BLOCK
      ?auto_136340 - BLOCK
      ?auto_136341 - BLOCK
    )
    :vars
    (
      ?auto_136342 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_136341 ?auto_136342 ) ( ON-TABLE ?auto_136332 ) ( ON ?auto_136333 ?auto_136332 ) ( ON ?auto_136334 ?auto_136333 ) ( ON ?auto_136335 ?auto_136334 ) ( ON ?auto_136336 ?auto_136335 ) ( not ( = ?auto_136332 ?auto_136333 ) ) ( not ( = ?auto_136332 ?auto_136334 ) ) ( not ( = ?auto_136332 ?auto_136335 ) ) ( not ( = ?auto_136332 ?auto_136336 ) ) ( not ( = ?auto_136332 ?auto_136337 ) ) ( not ( = ?auto_136332 ?auto_136338 ) ) ( not ( = ?auto_136332 ?auto_136339 ) ) ( not ( = ?auto_136332 ?auto_136340 ) ) ( not ( = ?auto_136332 ?auto_136341 ) ) ( not ( = ?auto_136332 ?auto_136342 ) ) ( not ( = ?auto_136333 ?auto_136334 ) ) ( not ( = ?auto_136333 ?auto_136335 ) ) ( not ( = ?auto_136333 ?auto_136336 ) ) ( not ( = ?auto_136333 ?auto_136337 ) ) ( not ( = ?auto_136333 ?auto_136338 ) ) ( not ( = ?auto_136333 ?auto_136339 ) ) ( not ( = ?auto_136333 ?auto_136340 ) ) ( not ( = ?auto_136333 ?auto_136341 ) ) ( not ( = ?auto_136333 ?auto_136342 ) ) ( not ( = ?auto_136334 ?auto_136335 ) ) ( not ( = ?auto_136334 ?auto_136336 ) ) ( not ( = ?auto_136334 ?auto_136337 ) ) ( not ( = ?auto_136334 ?auto_136338 ) ) ( not ( = ?auto_136334 ?auto_136339 ) ) ( not ( = ?auto_136334 ?auto_136340 ) ) ( not ( = ?auto_136334 ?auto_136341 ) ) ( not ( = ?auto_136334 ?auto_136342 ) ) ( not ( = ?auto_136335 ?auto_136336 ) ) ( not ( = ?auto_136335 ?auto_136337 ) ) ( not ( = ?auto_136335 ?auto_136338 ) ) ( not ( = ?auto_136335 ?auto_136339 ) ) ( not ( = ?auto_136335 ?auto_136340 ) ) ( not ( = ?auto_136335 ?auto_136341 ) ) ( not ( = ?auto_136335 ?auto_136342 ) ) ( not ( = ?auto_136336 ?auto_136337 ) ) ( not ( = ?auto_136336 ?auto_136338 ) ) ( not ( = ?auto_136336 ?auto_136339 ) ) ( not ( = ?auto_136336 ?auto_136340 ) ) ( not ( = ?auto_136336 ?auto_136341 ) ) ( not ( = ?auto_136336 ?auto_136342 ) ) ( not ( = ?auto_136337 ?auto_136338 ) ) ( not ( = ?auto_136337 ?auto_136339 ) ) ( not ( = ?auto_136337 ?auto_136340 ) ) ( not ( = ?auto_136337 ?auto_136341 ) ) ( not ( = ?auto_136337 ?auto_136342 ) ) ( not ( = ?auto_136338 ?auto_136339 ) ) ( not ( = ?auto_136338 ?auto_136340 ) ) ( not ( = ?auto_136338 ?auto_136341 ) ) ( not ( = ?auto_136338 ?auto_136342 ) ) ( not ( = ?auto_136339 ?auto_136340 ) ) ( not ( = ?auto_136339 ?auto_136341 ) ) ( not ( = ?auto_136339 ?auto_136342 ) ) ( not ( = ?auto_136340 ?auto_136341 ) ) ( not ( = ?auto_136340 ?auto_136342 ) ) ( not ( = ?auto_136341 ?auto_136342 ) ) ( ON ?auto_136340 ?auto_136341 ) ( ON ?auto_136339 ?auto_136340 ) ( ON ?auto_136338 ?auto_136339 ) ( CLEAR ?auto_136336 ) ( ON ?auto_136337 ?auto_136338 ) ( CLEAR ?auto_136337 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_136332 ?auto_136333 ?auto_136334 ?auto_136335 ?auto_136336 ?auto_136337 )
      ( MAKE-10PILE ?auto_136332 ?auto_136333 ?auto_136334 ?auto_136335 ?auto_136336 ?auto_136337 ?auto_136338 ?auto_136339 ?auto_136340 ?auto_136341 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_136374 - BLOCK
      ?auto_136375 - BLOCK
      ?auto_136376 - BLOCK
      ?auto_136377 - BLOCK
      ?auto_136378 - BLOCK
      ?auto_136379 - BLOCK
      ?auto_136380 - BLOCK
      ?auto_136381 - BLOCK
      ?auto_136382 - BLOCK
      ?auto_136383 - BLOCK
    )
    :vars
    (
      ?auto_136384 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_136383 ?auto_136384 ) ( ON-TABLE ?auto_136374 ) ( ON ?auto_136375 ?auto_136374 ) ( ON ?auto_136376 ?auto_136375 ) ( ON ?auto_136377 ?auto_136376 ) ( not ( = ?auto_136374 ?auto_136375 ) ) ( not ( = ?auto_136374 ?auto_136376 ) ) ( not ( = ?auto_136374 ?auto_136377 ) ) ( not ( = ?auto_136374 ?auto_136378 ) ) ( not ( = ?auto_136374 ?auto_136379 ) ) ( not ( = ?auto_136374 ?auto_136380 ) ) ( not ( = ?auto_136374 ?auto_136381 ) ) ( not ( = ?auto_136374 ?auto_136382 ) ) ( not ( = ?auto_136374 ?auto_136383 ) ) ( not ( = ?auto_136374 ?auto_136384 ) ) ( not ( = ?auto_136375 ?auto_136376 ) ) ( not ( = ?auto_136375 ?auto_136377 ) ) ( not ( = ?auto_136375 ?auto_136378 ) ) ( not ( = ?auto_136375 ?auto_136379 ) ) ( not ( = ?auto_136375 ?auto_136380 ) ) ( not ( = ?auto_136375 ?auto_136381 ) ) ( not ( = ?auto_136375 ?auto_136382 ) ) ( not ( = ?auto_136375 ?auto_136383 ) ) ( not ( = ?auto_136375 ?auto_136384 ) ) ( not ( = ?auto_136376 ?auto_136377 ) ) ( not ( = ?auto_136376 ?auto_136378 ) ) ( not ( = ?auto_136376 ?auto_136379 ) ) ( not ( = ?auto_136376 ?auto_136380 ) ) ( not ( = ?auto_136376 ?auto_136381 ) ) ( not ( = ?auto_136376 ?auto_136382 ) ) ( not ( = ?auto_136376 ?auto_136383 ) ) ( not ( = ?auto_136376 ?auto_136384 ) ) ( not ( = ?auto_136377 ?auto_136378 ) ) ( not ( = ?auto_136377 ?auto_136379 ) ) ( not ( = ?auto_136377 ?auto_136380 ) ) ( not ( = ?auto_136377 ?auto_136381 ) ) ( not ( = ?auto_136377 ?auto_136382 ) ) ( not ( = ?auto_136377 ?auto_136383 ) ) ( not ( = ?auto_136377 ?auto_136384 ) ) ( not ( = ?auto_136378 ?auto_136379 ) ) ( not ( = ?auto_136378 ?auto_136380 ) ) ( not ( = ?auto_136378 ?auto_136381 ) ) ( not ( = ?auto_136378 ?auto_136382 ) ) ( not ( = ?auto_136378 ?auto_136383 ) ) ( not ( = ?auto_136378 ?auto_136384 ) ) ( not ( = ?auto_136379 ?auto_136380 ) ) ( not ( = ?auto_136379 ?auto_136381 ) ) ( not ( = ?auto_136379 ?auto_136382 ) ) ( not ( = ?auto_136379 ?auto_136383 ) ) ( not ( = ?auto_136379 ?auto_136384 ) ) ( not ( = ?auto_136380 ?auto_136381 ) ) ( not ( = ?auto_136380 ?auto_136382 ) ) ( not ( = ?auto_136380 ?auto_136383 ) ) ( not ( = ?auto_136380 ?auto_136384 ) ) ( not ( = ?auto_136381 ?auto_136382 ) ) ( not ( = ?auto_136381 ?auto_136383 ) ) ( not ( = ?auto_136381 ?auto_136384 ) ) ( not ( = ?auto_136382 ?auto_136383 ) ) ( not ( = ?auto_136382 ?auto_136384 ) ) ( not ( = ?auto_136383 ?auto_136384 ) ) ( ON ?auto_136382 ?auto_136383 ) ( ON ?auto_136381 ?auto_136382 ) ( ON ?auto_136380 ?auto_136381 ) ( ON ?auto_136379 ?auto_136380 ) ( CLEAR ?auto_136377 ) ( ON ?auto_136378 ?auto_136379 ) ( CLEAR ?auto_136378 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_136374 ?auto_136375 ?auto_136376 ?auto_136377 ?auto_136378 )
      ( MAKE-10PILE ?auto_136374 ?auto_136375 ?auto_136376 ?auto_136377 ?auto_136378 ?auto_136379 ?auto_136380 ?auto_136381 ?auto_136382 ?auto_136383 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_136416 - BLOCK
      ?auto_136417 - BLOCK
      ?auto_136418 - BLOCK
      ?auto_136419 - BLOCK
      ?auto_136420 - BLOCK
      ?auto_136421 - BLOCK
      ?auto_136422 - BLOCK
      ?auto_136423 - BLOCK
      ?auto_136424 - BLOCK
      ?auto_136425 - BLOCK
    )
    :vars
    (
      ?auto_136426 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_136425 ?auto_136426 ) ( ON-TABLE ?auto_136416 ) ( ON ?auto_136417 ?auto_136416 ) ( ON ?auto_136418 ?auto_136417 ) ( not ( = ?auto_136416 ?auto_136417 ) ) ( not ( = ?auto_136416 ?auto_136418 ) ) ( not ( = ?auto_136416 ?auto_136419 ) ) ( not ( = ?auto_136416 ?auto_136420 ) ) ( not ( = ?auto_136416 ?auto_136421 ) ) ( not ( = ?auto_136416 ?auto_136422 ) ) ( not ( = ?auto_136416 ?auto_136423 ) ) ( not ( = ?auto_136416 ?auto_136424 ) ) ( not ( = ?auto_136416 ?auto_136425 ) ) ( not ( = ?auto_136416 ?auto_136426 ) ) ( not ( = ?auto_136417 ?auto_136418 ) ) ( not ( = ?auto_136417 ?auto_136419 ) ) ( not ( = ?auto_136417 ?auto_136420 ) ) ( not ( = ?auto_136417 ?auto_136421 ) ) ( not ( = ?auto_136417 ?auto_136422 ) ) ( not ( = ?auto_136417 ?auto_136423 ) ) ( not ( = ?auto_136417 ?auto_136424 ) ) ( not ( = ?auto_136417 ?auto_136425 ) ) ( not ( = ?auto_136417 ?auto_136426 ) ) ( not ( = ?auto_136418 ?auto_136419 ) ) ( not ( = ?auto_136418 ?auto_136420 ) ) ( not ( = ?auto_136418 ?auto_136421 ) ) ( not ( = ?auto_136418 ?auto_136422 ) ) ( not ( = ?auto_136418 ?auto_136423 ) ) ( not ( = ?auto_136418 ?auto_136424 ) ) ( not ( = ?auto_136418 ?auto_136425 ) ) ( not ( = ?auto_136418 ?auto_136426 ) ) ( not ( = ?auto_136419 ?auto_136420 ) ) ( not ( = ?auto_136419 ?auto_136421 ) ) ( not ( = ?auto_136419 ?auto_136422 ) ) ( not ( = ?auto_136419 ?auto_136423 ) ) ( not ( = ?auto_136419 ?auto_136424 ) ) ( not ( = ?auto_136419 ?auto_136425 ) ) ( not ( = ?auto_136419 ?auto_136426 ) ) ( not ( = ?auto_136420 ?auto_136421 ) ) ( not ( = ?auto_136420 ?auto_136422 ) ) ( not ( = ?auto_136420 ?auto_136423 ) ) ( not ( = ?auto_136420 ?auto_136424 ) ) ( not ( = ?auto_136420 ?auto_136425 ) ) ( not ( = ?auto_136420 ?auto_136426 ) ) ( not ( = ?auto_136421 ?auto_136422 ) ) ( not ( = ?auto_136421 ?auto_136423 ) ) ( not ( = ?auto_136421 ?auto_136424 ) ) ( not ( = ?auto_136421 ?auto_136425 ) ) ( not ( = ?auto_136421 ?auto_136426 ) ) ( not ( = ?auto_136422 ?auto_136423 ) ) ( not ( = ?auto_136422 ?auto_136424 ) ) ( not ( = ?auto_136422 ?auto_136425 ) ) ( not ( = ?auto_136422 ?auto_136426 ) ) ( not ( = ?auto_136423 ?auto_136424 ) ) ( not ( = ?auto_136423 ?auto_136425 ) ) ( not ( = ?auto_136423 ?auto_136426 ) ) ( not ( = ?auto_136424 ?auto_136425 ) ) ( not ( = ?auto_136424 ?auto_136426 ) ) ( not ( = ?auto_136425 ?auto_136426 ) ) ( ON ?auto_136424 ?auto_136425 ) ( ON ?auto_136423 ?auto_136424 ) ( ON ?auto_136422 ?auto_136423 ) ( ON ?auto_136421 ?auto_136422 ) ( ON ?auto_136420 ?auto_136421 ) ( CLEAR ?auto_136418 ) ( ON ?auto_136419 ?auto_136420 ) ( CLEAR ?auto_136419 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_136416 ?auto_136417 ?auto_136418 ?auto_136419 )
      ( MAKE-10PILE ?auto_136416 ?auto_136417 ?auto_136418 ?auto_136419 ?auto_136420 ?auto_136421 ?auto_136422 ?auto_136423 ?auto_136424 ?auto_136425 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_136458 - BLOCK
      ?auto_136459 - BLOCK
      ?auto_136460 - BLOCK
      ?auto_136461 - BLOCK
      ?auto_136462 - BLOCK
      ?auto_136463 - BLOCK
      ?auto_136464 - BLOCK
      ?auto_136465 - BLOCK
      ?auto_136466 - BLOCK
      ?auto_136467 - BLOCK
    )
    :vars
    (
      ?auto_136468 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_136467 ?auto_136468 ) ( ON-TABLE ?auto_136458 ) ( ON ?auto_136459 ?auto_136458 ) ( not ( = ?auto_136458 ?auto_136459 ) ) ( not ( = ?auto_136458 ?auto_136460 ) ) ( not ( = ?auto_136458 ?auto_136461 ) ) ( not ( = ?auto_136458 ?auto_136462 ) ) ( not ( = ?auto_136458 ?auto_136463 ) ) ( not ( = ?auto_136458 ?auto_136464 ) ) ( not ( = ?auto_136458 ?auto_136465 ) ) ( not ( = ?auto_136458 ?auto_136466 ) ) ( not ( = ?auto_136458 ?auto_136467 ) ) ( not ( = ?auto_136458 ?auto_136468 ) ) ( not ( = ?auto_136459 ?auto_136460 ) ) ( not ( = ?auto_136459 ?auto_136461 ) ) ( not ( = ?auto_136459 ?auto_136462 ) ) ( not ( = ?auto_136459 ?auto_136463 ) ) ( not ( = ?auto_136459 ?auto_136464 ) ) ( not ( = ?auto_136459 ?auto_136465 ) ) ( not ( = ?auto_136459 ?auto_136466 ) ) ( not ( = ?auto_136459 ?auto_136467 ) ) ( not ( = ?auto_136459 ?auto_136468 ) ) ( not ( = ?auto_136460 ?auto_136461 ) ) ( not ( = ?auto_136460 ?auto_136462 ) ) ( not ( = ?auto_136460 ?auto_136463 ) ) ( not ( = ?auto_136460 ?auto_136464 ) ) ( not ( = ?auto_136460 ?auto_136465 ) ) ( not ( = ?auto_136460 ?auto_136466 ) ) ( not ( = ?auto_136460 ?auto_136467 ) ) ( not ( = ?auto_136460 ?auto_136468 ) ) ( not ( = ?auto_136461 ?auto_136462 ) ) ( not ( = ?auto_136461 ?auto_136463 ) ) ( not ( = ?auto_136461 ?auto_136464 ) ) ( not ( = ?auto_136461 ?auto_136465 ) ) ( not ( = ?auto_136461 ?auto_136466 ) ) ( not ( = ?auto_136461 ?auto_136467 ) ) ( not ( = ?auto_136461 ?auto_136468 ) ) ( not ( = ?auto_136462 ?auto_136463 ) ) ( not ( = ?auto_136462 ?auto_136464 ) ) ( not ( = ?auto_136462 ?auto_136465 ) ) ( not ( = ?auto_136462 ?auto_136466 ) ) ( not ( = ?auto_136462 ?auto_136467 ) ) ( not ( = ?auto_136462 ?auto_136468 ) ) ( not ( = ?auto_136463 ?auto_136464 ) ) ( not ( = ?auto_136463 ?auto_136465 ) ) ( not ( = ?auto_136463 ?auto_136466 ) ) ( not ( = ?auto_136463 ?auto_136467 ) ) ( not ( = ?auto_136463 ?auto_136468 ) ) ( not ( = ?auto_136464 ?auto_136465 ) ) ( not ( = ?auto_136464 ?auto_136466 ) ) ( not ( = ?auto_136464 ?auto_136467 ) ) ( not ( = ?auto_136464 ?auto_136468 ) ) ( not ( = ?auto_136465 ?auto_136466 ) ) ( not ( = ?auto_136465 ?auto_136467 ) ) ( not ( = ?auto_136465 ?auto_136468 ) ) ( not ( = ?auto_136466 ?auto_136467 ) ) ( not ( = ?auto_136466 ?auto_136468 ) ) ( not ( = ?auto_136467 ?auto_136468 ) ) ( ON ?auto_136466 ?auto_136467 ) ( ON ?auto_136465 ?auto_136466 ) ( ON ?auto_136464 ?auto_136465 ) ( ON ?auto_136463 ?auto_136464 ) ( ON ?auto_136462 ?auto_136463 ) ( ON ?auto_136461 ?auto_136462 ) ( CLEAR ?auto_136459 ) ( ON ?auto_136460 ?auto_136461 ) ( CLEAR ?auto_136460 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_136458 ?auto_136459 ?auto_136460 )
      ( MAKE-10PILE ?auto_136458 ?auto_136459 ?auto_136460 ?auto_136461 ?auto_136462 ?auto_136463 ?auto_136464 ?auto_136465 ?auto_136466 ?auto_136467 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_136500 - BLOCK
      ?auto_136501 - BLOCK
      ?auto_136502 - BLOCK
      ?auto_136503 - BLOCK
      ?auto_136504 - BLOCK
      ?auto_136505 - BLOCK
      ?auto_136506 - BLOCK
      ?auto_136507 - BLOCK
      ?auto_136508 - BLOCK
      ?auto_136509 - BLOCK
    )
    :vars
    (
      ?auto_136510 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_136509 ?auto_136510 ) ( ON-TABLE ?auto_136500 ) ( not ( = ?auto_136500 ?auto_136501 ) ) ( not ( = ?auto_136500 ?auto_136502 ) ) ( not ( = ?auto_136500 ?auto_136503 ) ) ( not ( = ?auto_136500 ?auto_136504 ) ) ( not ( = ?auto_136500 ?auto_136505 ) ) ( not ( = ?auto_136500 ?auto_136506 ) ) ( not ( = ?auto_136500 ?auto_136507 ) ) ( not ( = ?auto_136500 ?auto_136508 ) ) ( not ( = ?auto_136500 ?auto_136509 ) ) ( not ( = ?auto_136500 ?auto_136510 ) ) ( not ( = ?auto_136501 ?auto_136502 ) ) ( not ( = ?auto_136501 ?auto_136503 ) ) ( not ( = ?auto_136501 ?auto_136504 ) ) ( not ( = ?auto_136501 ?auto_136505 ) ) ( not ( = ?auto_136501 ?auto_136506 ) ) ( not ( = ?auto_136501 ?auto_136507 ) ) ( not ( = ?auto_136501 ?auto_136508 ) ) ( not ( = ?auto_136501 ?auto_136509 ) ) ( not ( = ?auto_136501 ?auto_136510 ) ) ( not ( = ?auto_136502 ?auto_136503 ) ) ( not ( = ?auto_136502 ?auto_136504 ) ) ( not ( = ?auto_136502 ?auto_136505 ) ) ( not ( = ?auto_136502 ?auto_136506 ) ) ( not ( = ?auto_136502 ?auto_136507 ) ) ( not ( = ?auto_136502 ?auto_136508 ) ) ( not ( = ?auto_136502 ?auto_136509 ) ) ( not ( = ?auto_136502 ?auto_136510 ) ) ( not ( = ?auto_136503 ?auto_136504 ) ) ( not ( = ?auto_136503 ?auto_136505 ) ) ( not ( = ?auto_136503 ?auto_136506 ) ) ( not ( = ?auto_136503 ?auto_136507 ) ) ( not ( = ?auto_136503 ?auto_136508 ) ) ( not ( = ?auto_136503 ?auto_136509 ) ) ( not ( = ?auto_136503 ?auto_136510 ) ) ( not ( = ?auto_136504 ?auto_136505 ) ) ( not ( = ?auto_136504 ?auto_136506 ) ) ( not ( = ?auto_136504 ?auto_136507 ) ) ( not ( = ?auto_136504 ?auto_136508 ) ) ( not ( = ?auto_136504 ?auto_136509 ) ) ( not ( = ?auto_136504 ?auto_136510 ) ) ( not ( = ?auto_136505 ?auto_136506 ) ) ( not ( = ?auto_136505 ?auto_136507 ) ) ( not ( = ?auto_136505 ?auto_136508 ) ) ( not ( = ?auto_136505 ?auto_136509 ) ) ( not ( = ?auto_136505 ?auto_136510 ) ) ( not ( = ?auto_136506 ?auto_136507 ) ) ( not ( = ?auto_136506 ?auto_136508 ) ) ( not ( = ?auto_136506 ?auto_136509 ) ) ( not ( = ?auto_136506 ?auto_136510 ) ) ( not ( = ?auto_136507 ?auto_136508 ) ) ( not ( = ?auto_136507 ?auto_136509 ) ) ( not ( = ?auto_136507 ?auto_136510 ) ) ( not ( = ?auto_136508 ?auto_136509 ) ) ( not ( = ?auto_136508 ?auto_136510 ) ) ( not ( = ?auto_136509 ?auto_136510 ) ) ( ON ?auto_136508 ?auto_136509 ) ( ON ?auto_136507 ?auto_136508 ) ( ON ?auto_136506 ?auto_136507 ) ( ON ?auto_136505 ?auto_136506 ) ( ON ?auto_136504 ?auto_136505 ) ( ON ?auto_136503 ?auto_136504 ) ( ON ?auto_136502 ?auto_136503 ) ( CLEAR ?auto_136500 ) ( ON ?auto_136501 ?auto_136502 ) ( CLEAR ?auto_136501 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_136500 ?auto_136501 )
      ( MAKE-10PILE ?auto_136500 ?auto_136501 ?auto_136502 ?auto_136503 ?auto_136504 ?auto_136505 ?auto_136506 ?auto_136507 ?auto_136508 ?auto_136509 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_136542 - BLOCK
      ?auto_136543 - BLOCK
      ?auto_136544 - BLOCK
      ?auto_136545 - BLOCK
      ?auto_136546 - BLOCK
      ?auto_136547 - BLOCK
      ?auto_136548 - BLOCK
      ?auto_136549 - BLOCK
      ?auto_136550 - BLOCK
      ?auto_136551 - BLOCK
    )
    :vars
    (
      ?auto_136552 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_136551 ?auto_136552 ) ( not ( = ?auto_136542 ?auto_136543 ) ) ( not ( = ?auto_136542 ?auto_136544 ) ) ( not ( = ?auto_136542 ?auto_136545 ) ) ( not ( = ?auto_136542 ?auto_136546 ) ) ( not ( = ?auto_136542 ?auto_136547 ) ) ( not ( = ?auto_136542 ?auto_136548 ) ) ( not ( = ?auto_136542 ?auto_136549 ) ) ( not ( = ?auto_136542 ?auto_136550 ) ) ( not ( = ?auto_136542 ?auto_136551 ) ) ( not ( = ?auto_136542 ?auto_136552 ) ) ( not ( = ?auto_136543 ?auto_136544 ) ) ( not ( = ?auto_136543 ?auto_136545 ) ) ( not ( = ?auto_136543 ?auto_136546 ) ) ( not ( = ?auto_136543 ?auto_136547 ) ) ( not ( = ?auto_136543 ?auto_136548 ) ) ( not ( = ?auto_136543 ?auto_136549 ) ) ( not ( = ?auto_136543 ?auto_136550 ) ) ( not ( = ?auto_136543 ?auto_136551 ) ) ( not ( = ?auto_136543 ?auto_136552 ) ) ( not ( = ?auto_136544 ?auto_136545 ) ) ( not ( = ?auto_136544 ?auto_136546 ) ) ( not ( = ?auto_136544 ?auto_136547 ) ) ( not ( = ?auto_136544 ?auto_136548 ) ) ( not ( = ?auto_136544 ?auto_136549 ) ) ( not ( = ?auto_136544 ?auto_136550 ) ) ( not ( = ?auto_136544 ?auto_136551 ) ) ( not ( = ?auto_136544 ?auto_136552 ) ) ( not ( = ?auto_136545 ?auto_136546 ) ) ( not ( = ?auto_136545 ?auto_136547 ) ) ( not ( = ?auto_136545 ?auto_136548 ) ) ( not ( = ?auto_136545 ?auto_136549 ) ) ( not ( = ?auto_136545 ?auto_136550 ) ) ( not ( = ?auto_136545 ?auto_136551 ) ) ( not ( = ?auto_136545 ?auto_136552 ) ) ( not ( = ?auto_136546 ?auto_136547 ) ) ( not ( = ?auto_136546 ?auto_136548 ) ) ( not ( = ?auto_136546 ?auto_136549 ) ) ( not ( = ?auto_136546 ?auto_136550 ) ) ( not ( = ?auto_136546 ?auto_136551 ) ) ( not ( = ?auto_136546 ?auto_136552 ) ) ( not ( = ?auto_136547 ?auto_136548 ) ) ( not ( = ?auto_136547 ?auto_136549 ) ) ( not ( = ?auto_136547 ?auto_136550 ) ) ( not ( = ?auto_136547 ?auto_136551 ) ) ( not ( = ?auto_136547 ?auto_136552 ) ) ( not ( = ?auto_136548 ?auto_136549 ) ) ( not ( = ?auto_136548 ?auto_136550 ) ) ( not ( = ?auto_136548 ?auto_136551 ) ) ( not ( = ?auto_136548 ?auto_136552 ) ) ( not ( = ?auto_136549 ?auto_136550 ) ) ( not ( = ?auto_136549 ?auto_136551 ) ) ( not ( = ?auto_136549 ?auto_136552 ) ) ( not ( = ?auto_136550 ?auto_136551 ) ) ( not ( = ?auto_136550 ?auto_136552 ) ) ( not ( = ?auto_136551 ?auto_136552 ) ) ( ON ?auto_136550 ?auto_136551 ) ( ON ?auto_136549 ?auto_136550 ) ( ON ?auto_136548 ?auto_136549 ) ( ON ?auto_136547 ?auto_136548 ) ( ON ?auto_136546 ?auto_136547 ) ( ON ?auto_136545 ?auto_136546 ) ( ON ?auto_136544 ?auto_136545 ) ( ON ?auto_136543 ?auto_136544 ) ( ON ?auto_136542 ?auto_136543 ) ( CLEAR ?auto_136542 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_136542 )
      ( MAKE-10PILE ?auto_136542 ?auto_136543 ?auto_136544 ?auto_136545 ?auto_136546 ?auto_136547 ?auto_136548 ?auto_136549 ?auto_136550 ?auto_136551 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_136585 - BLOCK
      ?auto_136586 - BLOCK
      ?auto_136587 - BLOCK
      ?auto_136588 - BLOCK
      ?auto_136589 - BLOCK
      ?auto_136590 - BLOCK
      ?auto_136591 - BLOCK
      ?auto_136592 - BLOCK
      ?auto_136593 - BLOCK
      ?auto_136594 - BLOCK
      ?auto_136595 - BLOCK
    )
    :vars
    (
      ?auto_136596 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_136594 ) ( ON ?auto_136595 ?auto_136596 ) ( CLEAR ?auto_136595 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_136585 ) ( ON ?auto_136586 ?auto_136585 ) ( ON ?auto_136587 ?auto_136586 ) ( ON ?auto_136588 ?auto_136587 ) ( ON ?auto_136589 ?auto_136588 ) ( ON ?auto_136590 ?auto_136589 ) ( ON ?auto_136591 ?auto_136590 ) ( ON ?auto_136592 ?auto_136591 ) ( ON ?auto_136593 ?auto_136592 ) ( ON ?auto_136594 ?auto_136593 ) ( not ( = ?auto_136585 ?auto_136586 ) ) ( not ( = ?auto_136585 ?auto_136587 ) ) ( not ( = ?auto_136585 ?auto_136588 ) ) ( not ( = ?auto_136585 ?auto_136589 ) ) ( not ( = ?auto_136585 ?auto_136590 ) ) ( not ( = ?auto_136585 ?auto_136591 ) ) ( not ( = ?auto_136585 ?auto_136592 ) ) ( not ( = ?auto_136585 ?auto_136593 ) ) ( not ( = ?auto_136585 ?auto_136594 ) ) ( not ( = ?auto_136585 ?auto_136595 ) ) ( not ( = ?auto_136585 ?auto_136596 ) ) ( not ( = ?auto_136586 ?auto_136587 ) ) ( not ( = ?auto_136586 ?auto_136588 ) ) ( not ( = ?auto_136586 ?auto_136589 ) ) ( not ( = ?auto_136586 ?auto_136590 ) ) ( not ( = ?auto_136586 ?auto_136591 ) ) ( not ( = ?auto_136586 ?auto_136592 ) ) ( not ( = ?auto_136586 ?auto_136593 ) ) ( not ( = ?auto_136586 ?auto_136594 ) ) ( not ( = ?auto_136586 ?auto_136595 ) ) ( not ( = ?auto_136586 ?auto_136596 ) ) ( not ( = ?auto_136587 ?auto_136588 ) ) ( not ( = ?auto_136587 ?auto_136589 ) ) ( not ( = ?auto_136587 ?auto_136590 ) ) ( not ( = ?auto_136587 ?auto_136591 ) ) ( not ( = ?auto_136587 ?auto_136592 ) ) ( not ( = ?auto_136587 ?auto_136593 ) ) ( not ( = ?auto_136587 ?auto_136594 ) ) ( not ( = ?auto_136587 ?auto_136595 ) ) ( not ( = ?auto_136587 ?auto_136596 ) ) ( not ( = ?auto_136588 ?auto_136589 ) ) ( not ( = ?auto_136588 ?auto_136590 ) ) ( not ( = ?auto_136588 ?auto_136591 ) ) ( not ( = ?auto_136588 ?auto_136592 ) ) ( not ( = ?auto_136588 ?auto_136593 ) ) ( not ( = ?auto_136588 ?auto_136594 ) ) ( not ( = ?auto_136588 ?auto_136595 ) ) ( not ( = ?auto_136588 ?auto_136596 ) ) ( not ( = ?auto_136589 ?auto_136590 ) ) ( not ( = ?auto_136589 ?auto_136591 ) ) ( not ( = ?auto_136589 ?auto_136592 ) ) ( not ( = ?auto_136589 ?auto_136593 ) ) ( not ( = ?auto_136589 ?auto_136594 ) ) ( not ( = ?auto_136589 ?auto_136595 ) ) ( not ( = ?auto_136589 ?auto_136596 ) ) ( not ( = ?auto_136590 ?auto_136591 ) ) ( not ( = ?auto_136590 ?auto_136592 ) ) ( not ( = ?auto_136590 ?auto_136593 ) ) ( not ( = ?auto_136590 ?auto_136594 ) ) ( not ( = ?auto_136590 ?auto_136595 ) ) ( not ( = ?auto_136590 ?auto_136596 ) ) ( not ( = ?auto_136591 ?auto_136592 ) ) ( not ( = ?auto_136591 ?auto_136593 ) ) ( not ( = ?auto_136591 ?auto_136594 ) ) ( not ( = ?auto_136591 ?auto_136595 ) ) ( not ( = ?auto_136591 ?auto_136596 ) ) ( not ( = ?auto_136592 ?auto_136593 ) ) ( not ( = ?auto_136592 ?auto_136594 ) ) ( not ( = ?auto_136592 ?auto_136595 ) ) ( not ( = ?auto_136592 ?auto_136596 ) ) ( not ( = ?auto_136593 ?auto_136594 ) ) ( not ( = ?auto_136593 ?auto_136595 ) ) ( not ( = ?auto_136593 ?auto_136596 ) ) ( not ( = ?auto_136594 ?auto_136595 ) ) ( not ( = ?auto_136594 ?auto_136596 ) ) ( not ( = ?auto_136595 ?auto_136596 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_136595 ?auto_136596 )
      ( !STACK ?auto_136595 ?auto_136594 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_136608 - BLOCK
      ?auto_136609 - BLOCK
      ?auto_136610 - BLOCK
      ?auto_136611 - BLOCK
      ?auto_136612 - BLOCK
      ?auto_136613 - BLOCK
      ?auto_136614 - BLOCK
      ?auto_136615 - BLOCK
      ?auto_136616 - BLOCK
      ?auto_136617 - BLOCK
      ?auto_136618 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_136617 ) ( ON-TABLE ?auto_136618 ) ( CLEAR ?auto_136618 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_136608 ) ( ON ?auto_136609 ?auto_136608 ) ( ON ?auto_136610 ?auto_136609 ) ( ON ?auto_136611 ?auto_136610 ) ( ON ?auto_136612 ?auto_136611 ) ( ON ?auto_136613 ?auto_136612 ) ( ON ?auto_136614 ?auto_136613 ) ( ON ?auto_136615 ?auto_136614 ) ( ON ?auto_136616 ?auto_136615 ) ( ON ?auto_136617 ?auto_136616 ) ( not ( = ?auto_136608 ?auto_136609 ) ) ( not ( = ?auto_136608 ?auto_136610 ) ) ( not ( = ?auto_136608 ?auto_136611 ) ) ( not ( = ?auto_136608 ?auto_136612 ) ) ( not ( = ?auto_136608 ?auto_136613 ) ) ( not ( = ?auto_136608 ?auto_136614 ) ) ( not ( = ?auto_136608 ?auto_136615 ) ) ( not ( = ?auto_136608 ?auto_136616 ) ) ( not ( = ?auto_136608 ?auto_136617 ) ) ( not ( = ?auto_136608 ?auto_136618 ) ) ( not ( = ?auto_136609 ?auto_136610 ) ) ( not ( = ?auto_136609 ?auto_136611 ) ) ( not ( = ?auto_136609 ?auto_136612 ) ) ( not ( = ?auto_136609 ?auto_136613 ) ) ( not ( = ?auto_136609 ?auto_136614 ) ) ( not ( = ?auto_136609 ?auto_136615 ) ) ( not ( = ?auto_136609 ?auto_136616 ) ) ( not ( = ?auto_136609 ?auto_136617 ) ) ( not ( = ?auto_136609 ?auto_136618 ) ) ( not ( = ?auto_136610 ?auto_136611 ) ) ( not ( = ?auto_136610 ?auto_136612 ) ) ( not ( = ?auto_136610 ?auto_136613 ) ) ( not ( = ?auto_136610 ?auto_136614 ) ) ( not ( = ?auto_136610 ?auto_136615 ) ) ( not ( = ?auto_136610 ?auto_136616 ) ) ( not ( = ?auto_136610 ?auto_136617 ) ) ( not ( = ?auto_136610 ?auto_136618 ) ) ( not ( = ?auto_136611 ?auto_136612 ) ) ( not ( = ?auto_136611 ?auto_136613 ) ) ( not ( = ?auto_136611 ?auto_136614 ) ) ( not ( = ?auto_136611 ?auto_136615 ) ) ( not ( = ?auto_136611 ?auto_136616 ) ) ( not ( = ?auto_136611 ?auto_136617 ) ) ( not ( = ?auto_136611 ?auto_136618 ) ) ( not ( = ?auto_136612 ?auto_136613 ) ) ( not ( = ?auto_136612 ?auto_136614 ) ) ( not ( = ?auto_136612 ?auto_136615 ) ) ( not ( = ?auto_136612 ?auto_136616 ) ) ( not ( = ?auto_136612 ?auto_136617 ) ) ( not ( = ?auto_136612 ?auto_136618 ) ) ( not ( = ?auto_136613 ?auto_136614 ) ) ( not ( = ?auto_136613 ?auto_136615 ) ) ( not ( = ?auto_136613 ?auto_136616 ) ) ( not ( = ?auto_136613 ?auto_136617 ) ) ( not ( = ?auto_136613 ?auto_136618 ) ) ( not ( = ?auto_136614 ?auto_136615 ) ) ( not ( = ?auto_136614 ?auto_136616 ) ) ( not ( = ?auto_136614 ?auto_136617 ) ) ( not ( = ?auto_136614 ?auto_136618 ) ) ( not ( = ?auto_136615 ?auto_136616 ) ) ( not ( = ?auto_136615 ?auto_136617 ) ) ( not ( = ?auto_136615 ?auto_136618 ) ) ( not ( = ?auto_136616 ?auto_136617 ) ) ( not ( = ?auto_136616 ?auto_136618 ) ) ( not ( = ?auto_136617 ?auto_136618 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_136618 )
      ( !STACK ?auto_136618 ?auto_136617 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_136630 - BLOCK
      ?auto_136631 - BLOCK
      ?auto_136632 - BLOCK
      ?auto_136633 - BLOCK
      ?auto_136634 - BLOCK
      ?auto_136635 - BLOCK
      ?auto_136636 - BLOCK
      ?auto_136637 - BLOCK
      ?auto_136638 - BLOCK
      ?auto_136639 - BLOCK
      ?auto_136640 - BLOCK
    )
    :vars
    (
      ?auto_136641 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_136640 ?auto_136641 ) ( ON-TABLE ?auto_136630 ) ( ON ?auto_136631 ?auto_136630 ) ( ON ?auto_136632 ?auto_136631 ) ( ON ?auto_136633 ?auto_136632 ) ( ON ?auto_136634 ?auto_136633 ) ( ON ?auto_136635 ?auto_136634 ) ( ON ?auto_136636 ?auto_136635 ) ( ON ?auto_136637 ?auto_136636 ) ( ON ?auto_136638 ?auto_136637 ) ( not ( = ?auto_136630 ?auto_136631 ) ) ( not ( = ?auto_136630 ?auto_136632 ) ) ( not ( = ?auto_136630 ?auto_136633 ) ) ( not ( = ?auto_136630 ?auto_136634 ) ) ( not ( = ?auto_136630 ?auto_136635 ) ) ( not ( = ?auto_136630 ?auto_136636 ) ) ( not ( = ?auto_136630 ?auto_136637 ) ) ( not ( = ?auto_136630 ?auto_136638 ) ) ( not ( = ?auto_136630 ?auto_136639 ) ) ( not ( = ?auto_136630 ?auto_136640 ) ) ( not ( = ?auto_136630 ?auto_136641 ) ) ( not ( = ?auto_136631 ?auto_136632 ) ) ( not ( = ?auto_136631 ?auto_136633 ) ) ( not ( = ?auto_136631 ?auto_136634 ) ) ( not ( = ?auto_136631 ?auto_136635 ) ) ( not ( = ?auto_136631 ?auto_136636 ) ) ( not ( = ?auto_136631 ?auto_136637 ) ) ( not ( = ?auto_136631 ?auto_136638 ) ) ( not ( = ?auto_136631 ?auto_136639 ) ) ( not ( = ?auto_136631 ?auto_136640 ) ) ( not ( = ?auto_136631 ?auto_136641 ) ) ( not ( = ?auto_136632 ?auto_136633 ) ) ( not ( = ?auto_136632 ?auto_136634 ) ) ( not ( = ?auto_136632 ?auto_136635 ) ) ( not ( = ?auto_136632 ?auto_136636 ) ) ( not ( = ?auto_136632 ?auto_136637 ) ) ( not ( = ?auto_136632 ?auto_136638 ) ) ( not ( = ?auto_136632 ?auto_136639 ) ) ( not ( = ?auto_136632 ?auto_136640 ) ) ( not ( = ?auto_136632 ?auto_136641 ) ) ( not ( = ?auto_136633 ?auto_136634 ) ) ( not ( = ?auto_136633 ?auto_136635 ) ) ( not ( = ?auto_136633 ?auto_136636 ) ) ( not ( = ?auto_136633 ?auto_136637 ) ) ( not ( = ?auto_136633 ?auto_136638 ) ) ( not ( = ?auto_136633 ?auto_136639 ) ) ( not ( = ?auto_136633 ?auto_136640 ) ) ( not ( = ?auto_136633 ?auto_136641 ) ) ( not ( = ?auto_136634 ?auto_136635 ) ) ( not ( = ?auto_136634 ?auto_136636 ) ) ( not ( = ?auto_136634 ?auto_136637 ) ) ( not ( = ?auto_136634 ?auto_136638 ) ) ( not ( = ?auto_136634 ?auto_136639 ) ) ( not ( = ?auto_136634 ?auto_136640 ) ) ( not ( = ?auto_136634 ?auto_136641 ) ) ( not ( = ?auto_136635 ?auto_136636 ) ) ( not ( = ?auto_136635 ?auto_136637 ) ) ( not ( = ?auto_136635 ?auto_136638 ) ) ( not ( = ?auto_136635 ?auto_136639 ) ) ( not ( = ?auto_136635 ?auto_136640 ) ) ( not ( = ?auto_136635 ?auto_136641 ) ) ( not ( = ?auto_136636 ?auto_136637 ) ) ( not ( = ?auto_136636 ?auto_136638 ) ) ( not ( = ?auto_136636 ?auto_136639 ) ) ( not ( = ?auto_136636 ?auto_136640 ) ) ( not ( = ?auto_136636 ?auto_136641 ) ) ( not ( = ?auto_136637 ?auto_136638 ) ) ( not ( = ?auto_136637 ?auto_136639 ) ) ( not ( = ?auto_136637 ?auto_136640 ) ) ( not ( = ?auto_136637 ?auto_136641 ) ) ( not ( = ?auto_136638 ?auto_136639 ) ) ( not ( = ?auto_136638 ?auto_136640 ) ) ( not ( = ?auto_136638 ?auto_136641 ) ) ( not ( = ?auto_136639 ?auto_136640 ) ) ( not ( = ?auto_136639 ?auto_136641 ) ) ( not ( = ?auto_136640 ?auto_136641 ) ) ( CLEAR ?auto_136638 ) ( ON ?auto_136639 ?auto_136640 ) ( CLEAR ?auto_136639 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_136630 ?auto_136631 ?auto_136632 ?auto_136633 ?auto_136634 ?auto_136635 ?auto_136636 ?auto_136637 ?auto_136638 ?auto_136639 )
      ( MAKE-11PILE ?auto_136630 ?auto_136631 ?auto_136632 ?auto_136633 ?auto_136634 ?auto_136635 ?auto_136636 ?auto_136637 ?auto_136638 ?auto_136639 ?auto_136640 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_136653 - BLOCK
      ?auto_136654 - BLOCK
      ?auto_136655 - BLOCK
      ?auto_136656 - BLOCK
      ?auto_136657 - BLOCK
      ?auto_136658 - BLOCK
      ?auto_136659 - BLOCK
      ?auto_136660 - BLOCK
      ?auto_136661 - BLOCK
      ?auto_136662 - BLOCK
      ?auto_136663 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_136663 ) ( ON-TABLE ?auto_136653 ) ( ON ?auto_136654 ?auto_136653 ) ( ON ?auto_136655 ?auto_136654 ) ( ON ?auto_136656 ?auto_136655 ) ( ON ?auto_136657 ?auto_136656 ) ( ON ?auto_136658 ?auto_136657 ) ( ON ?auto_136659 ?auto_136658 ) ( ON ?auto_136660 ?auto_136659 ) ( ON ?auto_136661 ?auto_136660 ) ( not ( = ?auto_136653 ?auto_136654 ) ) ( not ( = ?auto_136653 ?auto_136655 ) ) ( not ( = ?auto_136653 ?auto_136656 ) ) ( not ( = ?auto_136653 ?auto_136657 ) ) ( not ( = ?auto_136653 ?auto_136658 ) ) ( not ( = ?auto_136653 ?auto_136659 ) ) ( not ( = ?auto_136653 ?auto_136660 ) ) ( not ( = ?auto_136653 ?auto_136661 ) ) ( not ( = ?auto_136653 ?auto_136662 ) ) ( not ( = ?auto_136653 ?auto_136663 ) ) ( not ( = ?auto_136654 ?auto_136655 ) ) ( not ( = ?auto_136654 ?auto_136656 ) ) ( not ( = ?auto_136654 ?auto_136657 ) ) ( not ( = ?auto_136654 ?auto_136658 ) ) ( not ( = ?auto_136654 ?auto_136659 ) ) ( not ( = ?auto_136654 ?auto_136660 ) ) ( not ( = ?auto_136654 ?auto_136661 ) ) ( not ( = ?auto_136654 ?auto_136662 ) ) ( not ( = ?auto_136654 ?auto_136663 ) ) ( not ( = ?auto_136655 ?auto_136656 ) ) ( not ( = ?auto_136655 ?auto_136657 ) ) ( not ( = ?auto_136655 ?auto_136658 ) ) ( not ( = ?auto_136655 ?auto_136659 ) ) ( not ( = ?auto_136655 ?auto_136660 ) ) ( not ( = ?auto_136655 ?auto_136661 ) ) ( not ( = ?auto_136655 ?auto_136662 ) ) ( not ( = ?auto_136655 ?auto_136663 ) ) ( not ( = ?auto_136656 ?auto_136657 ) ) ( not ( = ?auto_136656 ?auto_136658 ) ) ( not ( = ?auto_136656 ?auto_136659 ) ) ( not ( = ?auto_136656 ?auto_136660 ) ) ( not ( = ?auto_136656 ?auto_136661 ) ) ( not ( = ?auto_136656 ?auto_136662 ) ) ( not ( = ?auto_136656 ?auto_136663 ) ) ( not ( = ?auto_136657 ?auto_136658 ) ) ( not ( = ?auto_136657 ?auto_136659 ) ) ( not ( = ?auto_136657 ?auto_136660 ) ) ( not ( = ?auto_136657 ?auto_136661 ) ) ( not ( = ?auto_136657 ?auto_136662 ) ) ( not ( = ?auto_136657 ?auto_136663 ) ) ( not ( = ?auto_136658 ?auto_136659 ) ) ( not ( = ?auto_136658 ?auto_136660 ) ) ( not ( = ?auto_136658 ?auto_136661 ) ) ( not ( = ?auto_136658 ?auto_136662 ) ) ( not ( = ?auto_136658 ?auto_136663 ) ) ( not ( = ?auto_136659 ?auto_136660 ) ) ( not ( = ?auto_136659 ?auto_136661 ) ) ( not ( = ?auto_136659 ?auto_136662 ) ) ( not ( = ?auto_136659 ?auto_136663 ) ) ( not ( = ?auto_136660 ?auto_136661 ) ) ( not ( = ?auto_136660 ?auto_136662 ) ) ( not ( = ?auto_136660 ?auto_136663 ) ) ( not ( = ?auto_136661 ?auto_136662 ) ) ( not ( = ?auto_136661 ?auto_136663 ) ) ( not ( = ?auto_136662 ?auto_136663 ) ) ( CLEAR ?auto_136661 ) ( ON ?auto_136662 ?auto_136663 ) ( CLEAR ?auto_136662 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_136653 ?auto_136654 ?auto_136655 ?auto_136656 ?auto_136657 ?auto_136658 ?auto_136659 ?auto_136660 ?auto_136661 ?auto_136662 )
      ( MAKE-11PILE ?auto_136653 ?auto_136654 ?auto_136655 ?auto_136656 ?auto_136657 ?auto_136658 ?auto_136659 ?auto_136660 ?auto_136661 ?auto_136662 ?auto_136663 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_136675 - BLOCK
      ?auto_136676 - BLOCK
      ?auto_136677 - BLOCK
      ?auto_136678 - BLOCK
      ?auto_136679 - BLOCK
      ?auto_136680 - BLOCK
      ?auto_136681 - BLOCK
      ?auto_136682 - BLOCK
      ?auto_136683 - BLOCK
      ?auto_136684 - BLOCK
      ?auto_136685 - BLOCK
    )
    :vars
    (
      ?auto_136686 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_136685 ?auto_136686 ) ( ON-TABLE ?auto_136675 ) ( ON ?auto_136676 ?auto_136675 ) ( ON ?auto_136677 ?auto_136676 ) ( ON ?auto_136678 ?auto_136677 ) ( ON ?auto_136679 ?auto_136678 ) ( ON ?auto_136680 ?auto_136679 ) ( ON ?auto_136681 ?auto_136680 ) ( ON ?auto_136682 ?auto_136681 ) ( not ( = ?auto_136675 ?auto_136676 ) ) ( not ( = ?auto_136675 ?auto_136677 ) ) ( not ( = ?auto_136675 ?auto_136678 ) ) ( not ( = ?auto_136675 ?auto_136679 ) ) ( not ( = ?auto_136675 ?auto_136680 ) ) ( not ( = ?auto_136675 ?auto_136681 ) ) ( not ( = ?auto_136675 ?auto_136682 ) ) ( not ( = ?auto_136675 ?auto_136683 ) ) ( not ( = ?auto_136675 ?auto_136684 ) ) ( not ( = ?auto_136675 ?auto_136685 ) ) ( not ( = ?auto_136675 ?auto_136686 ) ) ( not ( = ?auto_136676 ?auto_136677 ) ) ( not ( = ?auto_136676 ?auto_136678 ) ) ( not ( = ?auto_136676 ?auto_136679 ) ) ( not ( = ?auto_136676 ?auto_136680 ) ) ( not ( = ?auto_136676 ?auto_136681 ) ) ( not ( = ?auto_136676 ?auto_136682 ) ) ( not ( = ?auto_136676 ?auto_136683 ) ) ( not ( = ?auto_136676 ?auto_136684 ) ) ( not ( = ?auto_136676 ?auto_136685 ) ) ( not ( = ?auto_136676 ?auto_136686 ) ) ( not ( = ?auto_136677 ?auto_136678 ) ) ( not ( = ?auto_136677 ?auto_136679 ) ) ( not ( = ?auto_136677 ?auto_136680 ) ) ( not ( = ?auto_136677 ?auto_136681 ) ) ( not ( = ?auto_136677 ?auto_136682 ) ) ( not ( = ?auto_136677 ?auto_136683 ) ) ( not ( = ?auto_136677 ?auto_136684 ) ) ( not ( = ?auto_136677 ?auto_136685 ) ) ( not ( = ?auto_136677 ?auto_136686 ) ) ( not ( = ?auto_136678 ?auto_136679 ) ) ( not ( = ?auto_136678 ?auto_136680 ) ) ( not ( = ?auto_136678 ?auto_136681 ) ) ( not ( = ?auto_136678 ?auto_136682 ) ) ( not ( = ?auto_136678 ?auto_136683 ) ) ( not ( = ?auto_136678 ?auto_136684 ) ) ( not ( = ?auto_136678 ?auto_136685 ) ) ( not ( = ?auto_136678 ?auto_136686 ) ) ( not ( = ?auto_136679 ?auto_136680 ) ) ( not ( = ?auto_136679 ?auto_136681 ) ) ( not ( = ?auto_136679 ?auto_136682 ) ) ( not ( = ?auto_136679 ?auto_136683 ) ) ( not ( = ?auto_136679 ?auto_136684 ) ) ( not ( = ?auto_136679 ?auto_136685 ) ) ( not ( = ?auto_136679 ?auto_136686 ) ) ( not ( = ?auto_136680 ?auto_136681 ) ) ( not ( = ?auto_136680 ?auto_136682 ) ) ( not ( = ?auto_136680 ?auto_136683 ) ) ( not ( = ?auto_136680 ?auto_136684 ) ) ( not ( = ?auto_136680 ?auto_136685 ) ) ( not ( = ?auto_136680 ?auto_136686 ) ) ( not ( = ?auto_136681 ?auto_136682 ) ) ( not ( = ?auto_136681 ?auto_136683 ) ) ( not ( = ?auto_136681 ?auto_136684 ) ) ( not ( = ?auto_136681 ?auto_136685 ) ) ( not ( = ?auto_136681 ?auto_136686 ) ) ( not ( = ?auto_136682 ?auto_136683 ) ) ( not ( = ?auto_136682 ?auto_136684 ) ) ( not ( = ?auto_136682 ?auto_136685 ) ) ( not ( = ?auto_136682 ?auto_136686 ) ) ( not ( = ?auto_136683 ?auto_136684 ) ) ( not ( = ?auto_136683 ?auto_136685 ) ) ( not ( = ?auto_136683 ?auto_136686 ) ) ( not ( = ?auto_136684 ?auto_136685 ) ) ( not ( = ?auto_136684 ?auto_136686 ) ) ( not ( = ?auto_136685 ?auto_136686 ) ) ( ON ?auto_136684 ?auto_136685 ) ( CLEAR ?auto_136682 ) ( ON ?auto_136683 ?auto_136684 ) ( CLEAR ?auto_136683 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_136675 ?auto_136676 ?auto_136677 ?auto_136678 ?auto_136679 ?auto_136680 ?auto_136681 ?auto_136682 ?auto_136683 )
      ( MAKE-11PILE ?auto_136675 ?auto_136676 ?auto_136677 ?auto_136678 ?auto_136679 ?auto_136680 ?auto_136681 ?auto_136682 ?auto_136683 ?auto_136684 ?auto_136685 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_136698 - BLOCK
      ?auto_136699 - BLOCK
      ?auto_136700 - BLOCK
      ?auto_136701 - BLOCK
      ?auto_136702 - BLOCK
      ?auto_136703 - BLOCK
      ?auto_136704 - BLOCK
      ?auto_136705 - BLOCK
      ?auto_136706 - BLOCK
      ?auto_136707 - BLOCK
      ?auto_136708 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_136708 ) ( ON-TABLE ?auto_136698 ) ( ON ?auto_136699 ?auto_136698 ) ( ON ?auto_136700 ?auto_136699 ) ( ON ?auto_136701 ?auto_136700 ) ( ON ?auto_136702 ?auto_136701 ) ( ON ?auto_136703 ?auto_136702 ) ( ON ?auto_136704 ?auto_136703 ) ( ON ?auto_136705 ?auto_136704 ) ( not ( = ?auto_136698 ?auto_136699 ) ) ( not ( = ?auto_136698 ?auto_136700 ) ) ( not ( = ?auto_136698 ?auto_136701 ) ) ( not ( = ?auto_136698 ?auto_136702 ) ) ( not ( = ?auto_136698 ?auto_136703 ) ) ( not ( = ?auto_136698 ?auto_136704 ) ) ( not ( = ?auto_136698 ?auto_136705 ) ) ( not ( = ?auto_136698 ?auto_136706 ) ) ( not ( = ?auto_136698 ?auto_136707 ) ) ( not ( = ?auto_136698 ?auto_136708 ) ) ( not ( = ?auto_136699 ?auto_136700 ) ) ( not ( = ?auto_136699 ?auto_136701 ) ) ( not ( = ?auto_136699 ?auto_136702 ) ) ( not ( = ?auto_136699 ?auto_136703 ) ) ( not ( = ?auto_136699 ?auto_136704 ) ) ( not ( = ?auto_136699 ?auto_136705 ) ) ( not ( = ?auto_136699 ?auto_136706 ) ) ( not ( = ?auto_136699 ?auto_136707 ) ) ( not ( = ?auto_136699 ?auto_136708 ) ) ( not ( = ?auto_136700 ?auto_136701 ) ) ( not ( = ?auto_136700 ?auto_136702 ) ) ( not ( = ?auto_136700 ?auto_136703 ) ) ( not ( = ?auto_136700 ?auto_136704 ) ) ( not ( = ?auto_136700 ?auto_136705 ) ) ( not ( = ?auto_136700 ?auto_136706 ) ) ( not ( = ?auto_136700 ?auto_136707 ) ) ( not ( = ?auto_136700 ?auto_136708 ) ) ( not ( = ?auto_136701 ?auto_136702 ) ) ( not ( = ?auto_136701 ?auto_136703 ) ) ( not ( = ?auto_136701 ?auto_136704 ) ) ( not ( = ?auto_136701 ?auto_136705 ) ) ( not ( = ?auto_136701 ?auto_136706 ) ) ( not ( = ?auto_136701 ?auto_136707 ) ) ( not ( = ?auto_136701 ?auto_136708 ) ) ( not ( = ?auto_136702 ?auto_136703 ) ) ( not ( = ?auto_136702 ?auto_136704 ) ) ( not ( = ?auto_136702 ?auto_136705 ) ) ( not ( = ?auto_136702 ?auto_136706 ) ) ( not ( = ?auto_136702 ?auto_136707 ) ) ( not ( = ?auto_136702 ?auto_136708 ) ) ( not ( = ?auto_136703 ?auto_136704 ) ) ( not ( = ?auto_136703 ?auto_136705 ) ) ( not ( = ?auto_136703 ?auto_136706 ) ) ( not ( = ?auto_136703 ?auto_136707 ) ) ( not ( = ?auto_136703 ?auto_136708 ) ) ( not ( = ?auto_136704 ?auto_136705 ) ) ( not ( = ?auto_136704 ?auto_136706 ) ) ( not ( = ?auto_136704 ?auto_136707 ) ) ( not ( = ?auto_136704 ?auto_136708 ) ) ( not ( = ?auto_136705 ?auto_136706 ) ) ( not ( = ?auto_136705 ?auto_136707 ) ) ( not ( = ?auto_136705 ?auto_136708 ) ) ( not ( = ?auto_136706 ?auto_136707 ) ) ( not ( = ?auto_136706 ?auto_136708 ) ) ( not ( = ?auto_136707 ?auto_136708 ) ) ( ON ?auto_136707 ?auto_136708 ) ( CLEAR ?auto_136705 ) ( ON ?auto_136706 ?auto_136707 ) ( CLEAR ?auto_136706 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_136698 ?auto_136699 ?auto_136700 ?auto_136701 ?auto_136702 ?auto_136703 ?auto_136704 ?auto_136705 ?auto_136706 )
      ( MAKE-11PILE ?auto_136698 ?auto_136699 ?auto_136700 ?auto_136701 ?auto_136702 ?auto_136703 ?auto_136704 ?auto_136705 ?auto_136706 ?auto_136707 ?auto_136708 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_136720 - BLOCK
      ?auto_136721 - BLOCK
      ?auto_136722 - BLOCK
      ?auto_136723 - BLOCK
      ?auto_136724 - BLOCK
      ?auto_136725 - BLOCK
      ?auto_136726 - BLOCK
      ?auto_136727 - BLOCK
      ?auto_136728 - BLOCK
      ?auto_136729 - BLOCK
      ?auto_136730 - BLOCK
    )
    :vars
    (
      ?auto_136731 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_136730 ?auto_136731 ) ( ON-TABLE ?auto_136720 ) ( ON ?auto_136721 ?auto_136720 ) ( ON ?auto_136722 ?auto_136721 ) ( ON ?auto_136723 ?auto_136722 ) ( ON ?auto_136724 ?auto_136723 ) ( ON ?auto_136725 ?auto_136724 ) ( ON ?auto_136726 ?auto_136725 ) ( not ( = ?auto_136720 ?auto_136721 ) ) ( not ( = ?auto_136720 ?auto_136722 ) ) ( not ( = ?auto_136720 ?auto_136723 ) ) ( not ( = ?auto_136720 ?auto_136724 ) ) ( not ( = ?auto_136720 ?auto_136725 ) ) ( not ( = ?auto_136720 ?auto_136726 ) ) ( not ( = ?auto_136720 ?auto_136727 ) ) ( not ( = ?auto_136720 ?auto_136728 ) ) ( not ( = ?auto_136720 ?auto_136729 ) ) ( not ( = ?auto_136720 ?auto_136730 ) ) ( not ( = ?auto_136720 ?auto_136731 ) ) ( not ( = ?auto_136721 ?auto_136722 ) ) ( not ( = ?auto_136721 ?auto_136723 ) ) ( not ( = ?auto_136721 ?auto_136724 ) ) ( not ( = ?auto_136721 ?auto_136725 ) ) ( not ( = ?auto_136721 ?auto_136726 ) ) ( not ( = ?auto_136721 ?auto_136727 ) ) ( not ( = ?auto_136721 ?auto_136728 ) ) ( not ( = ?auto_136721 ?auto_136729 ) ) ( not ( = ?auto_136721 ?auto_136730 ) ) ( not ( = ?auto_136721 ?auto_136731 ) ) ( not ( = ?auto_136722 ?auto_136723 ) ) ( not ( = ?auto_136722 ?auto_136724 ) ) ( not ( = ?auto_136722 ?auto_136725 ) ) ( not ( = ?auto_136722 ?auto_136726 ) ) ( not ( = ?auto_136722 ?auto_136727 ) ) ( not ( = ?auto_136722 ?auto_136728 ) ) ( not ( = ?auto_136722 ?auto_136729 ) ) ( not ( = ?auto_136722 ?auto_136730 ) ) ( not ( = ?auto_136722 ?auto_136731 ) ) ( not ( = ?auto_136723 ?auto_136724 ) ) ( not ( = ?auto_136723 ?auto_136725 ) ) ( not ( = ?auto_136723 ?auto_136726 ) ) ( not ( = ?auto_136723 ?auto_136727 ) ) ( not ( = ?auto_136723 ?auto_136728 ) ) ( not ( = ?auto_136723 ?auto_136729 ) ) ( not ( = ?auto_136723 ?auto_136730 ) ) ( not ( = ?auto_136723 ?auto_136731 ) ) ( not ( = ?auto_136724 ?auto_136725 ) ) ( not ( = ?auto_136724 ?auto_136726 ) ) ( not ( = ?auto_136724 ?auto_136727 ) ) ( not ( = ?auto_136724 ?auto_136728 ) ) ( not ( = ?auto_136724 ?auto_136729 ) ) ( not ( = ?auto_136724 ?auto_136730 ) ) ( not ( = ?auto_136724 ?auto_136731 ) ) ( not ( = ?auto_136725 ?auto_136726 ) ) ( not ( = ?auto_136725 ?auto_136727 ) ) ( not ( = ?auto_136725 ?auto_136728 ) ) ( not ( = ?auto_136725 ?auto_136729 ) ) ( not ( = ?auto_136725 ?auto_136730 ) ) ( not ( = ?auto_136725 ?auto_136731 ) ) ( not ( = ?auto_136726 ?auto_136727 ) ) ( not ( = ?auto_136726 ?auto_136728 ) ) ( not ( = ?auto_136726 ?auto_136729 ) ) ( not ( = ?auto_136726 ?auto_136730 ) ) ( not ( = ?auto_136726 ?auto_136731 ) ) ( not ( = ?auto_136727 ?auto_136728 ) ) ( not ( = ?auto_136727 ?auto_136729 ) ) ( not ( = ?auto_136727 ?auto_136730 ) ) ( not ( = ?auto_136727 ?auto_136731 ) ) ( not ( = ?auto_136728 ?auto_136729 ) ) ( not ( = ?auto_136728 ?auto_136730 ) ) ( not ( = ?auto_136728 ?auto_136731 ) ) ( not ( = ?auto_136729 ?auto_136730 ) ) ( not ( = ?auto_136729 ?auto_136731 ) ) ( not ( = ?auto_136730 ?auto_136731 ) ) ( ON ?auto_136729 ?auto_136730 ) ( ON ?auto_136728 ?auto_136729 ) ( CLEAR ?auto_136726 ) ( ON ?auto_136727 ?auto_136728 ) ( CLEAR ?auto_136727 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_136720 ?auto_136721 ?auto_136722 ?auto_136723 ?auto_136724 ?auto_136725 ?auto_136726 ?auto_136727 )
      ( MAKE-11PILE ?auto_136720 ?auto_136721 ?auto_136722 ?auto_136723 ?auto_136724 ?auto_136725 ?auto_136726 ?auto_136727 ?auto_136728 ?auto_136729 ?auto_136730 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_136743 - BLOCK
      ?auto_136744 - BLOCK
      ?auto_136745 - BLOCK
      ?auto_136746 - BLOCK
      ?auto_136747 - BLOCK
      ?auto_136748 - BLOCK
      ?auto_136749 - BLOCK
      ?auto_136750 - BLOCK
      ?auto_136751 - BLOCK
      ?auto_136752 - BLOCK
      ?auto_136753 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_136753 ) ( ON-TABLE ?auto_136743 ) ( ON ?auto_136744 ?auto_136743 ) ( ON ?auto_136745 ?auto_136744 ) ( ON ?auto_136746 ?auto_136745 ) ( ON ?auto_136747 ?auto_136746 ) ( ON ?auto_136748 ?auto_136747 ) ( ON ?auto_136749 ?auto_136748 ) ( not ( = ?auto_136743 ?auto_136744 ) ) ( not ( = ?auto_136743 ?auto_136745 ) ) ( not ( = ?auto_136743 ?auto_136746 ) ) ( not ( = ?auto_136743 ?auto_136747 ) ) ( not ( = ?auto_136743 ?auto_136748 ) ) ( not ( = ?auto_136743 ?auto_136749 ) ) ( not ( = ?auto_136743 ?auto_136750 ) ) ( not ( = ?auto_136743 ?auto_136751 ) ) ( not ( = ?auto_136743 ?auto_136752 ) ) ( not ( = ?auto_136743 ?auto_136753 ) ) ( not ( = ?auto_136744 ?auto_136745 ) ) ( not ( = ?auto_136744 ?auto_136746 ) ) ( not ( = ?auto_136744 ?auto_136747 ) ) ( not ( = ?auto_136744 ?auto_136748 ) ) ( not ( = ?auto_136744 ?auto_136749 ) ) ( not ( = ?auto_136744 ?auto_136750 ) ) ( not ( = ?auto_136744 ?auto_136751 ) ) ( not ( = ?auto_136744 ?auto_136752 ) ) ( not ( = ?auto_136744 ?auto_136753 ) ) ( not ( = ?auto_136745 ?auto_136746 ) ) ( not ( = ?auto_136745 ?auto_136747 ) ) ( not ( = ?auto_136745 ?auto_136748 ) ) ( not ( = ?auto_136745 ?auto_136749 ) ) ( not ( = ?auto_136745 ?auto_136750 ) ) ( not ( = ?auto_136745 ?auto_136751 ) ) ( not ( = ?auto_136745 ?auto_136752 ) ) ( not ( = ?auto_136745 ?auto_136753 ) ) ( not ( = ?auto_136746 ?auto_136747 ) ) ( not ( = ?auto_136746 ?auto_136748 ) ) ( not ( = ?auto_136746 ?auto_136749 ) ) ( not ( = ?auto_136746 ?auto_136750 ) ) ( not ( = ?auto_136746 ?auto_136751 ) ) ( not ( = ?auto_136746 ?auto_136752 ) ) ( not ( = ?auto_136746 ?auto_136753 ) ) ( not ( = ?auto_136747 ?auto_136748 ) ) ( not ( = ?auto_136747 ?auto_136749 ) ) ( not ( = ?auto_136747 ?auto_136750 ) ) ( not ( = ?auto_136747 ?auto_136751 ) ) ( not ( = ?auto_136747 ?auto_136752 ) ) ( not ( = ?auto_136747 ?auto_136753 ) ) ( not ( = ?auto_136748 ?auto_136749 ) ) ( not ( = ?auto_136748 ?auto_136750 ) ) ( not ( = ?auto_136748 ?auto_136751 ) ) ( not ( = ?auto_136748 ?auto_136752 ) ) ( not ( = ?auto_136748 ?auto_136753 ) ) ( not ( = ?auto_136749 ?auto_136750 ) ) ( not ( = ?auto_136749 ?auto_136751 ) ) ( not ( = ?auto_136749 ?auto_136752 ) ) ( not ( = ?auto_136749 ?auto_136753 ) ) ( not ( = ?auto_136750 ?auto_136751 ) ) ( not ( = ?auto_136750 ?auto_136752 ) ) ( not ( = ?auto_136750 ?auto_136753 ) ) ( not ( = ?auto_136751 ?auto_136752 ) ) ( not ( = ?auto_136751 ?auto_136753 ) ) ( not ( = ?auto_136752 ?auto_136753 ) ) ( ON ?auto_136752 ?auto_136753 ) ( ON ?auto_136751 ?auto_136752 ) ( CLEAR ?auto_136749 ) ( ON ?auto_136750 ?auto_136751 ) ( CLEAR ?auto_136750 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_136743 ?auto_136744 ?auto_136745 ?auto_136746 ?auto_136747 ?auto_136748 ?auto_136749 ?auto_136750 )
      ( MAKE-11PILE ?auto_136743 ?auto_136744 ?auto_136745 ?auto_136746 ?auto_136747 ?auto_136748 ?auto_136749 ?auto_136750 ?auto_136751 ?auto_136752 ?auto_136753 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_136765 - BLOCK
      ?auto_136766 - BLOCK
      ?auto_136767 - BLOCK
      ?auto_136768 - BLOCK
      ?auto_136769 - BLOCK
      ?auto_136770 - BLOCK
      ?auto_136771 - BLOCK
      ?auto_136772 - BLOCK
      ?auto_136773 - BLOCK
      ?auto_136774 - BLOCK
      ?auto_136775 - BLOCK
    )
    :vars
    (
      ?auto_136776 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_136775 ?auto_136776 ) ( ON-TABLE ?auto_136765 ) ( ON ?auto_136766 ?auto_136765 ) ( ON ?auto_136767 ?auto_136766 ) ( ON ?auto_136768 ?auto_136767 ) ( ON ?auto_136769 ?auto_136768 ) ( ON ?auto_136770 ?auto_136769 ) ( not ( = ?auto_136765 ?auto_136766 ) ) ( not ( = ?auto_136765 ?auto_136767 ) ) ( not ( = ?auto_136765 ?auto_136768 ) ) ( not ( = ?auto_136765 ?auto_136769 ) ) ( not ( = ?auto_136765 ?auto_136770 ) ) ( not ( = ?auto_136765 ?auto_136771 ) ) ( not ( = ?auto_136765 ?auto_136772 ) ) ( not ( = ?auto_136765 ?auto_136773 ) ) ( not ( = ?auto_136765 ?auto_136774 ) ) ( not ( = ?auto_136765 ?auto_136775 ) ) ( not ( = ?auto_136765 ?auto_136776 ) ) ( not ( = ?auto_136766 ?auto_136767 ) ) ( not ( = ?auto_136766 ?auto_136768 ) ) ( not ( = ?auto_136766 ?auto_136769 ) ) ( not ( = ?auto_136766 ?auto_136770 ) ) ( not ( = ?auto_136766 ?auto_136771 ) ) ( not ( = ?auto_136766 ?auto_136772 ) ) ( not ( = ?auto_136766 ?auto_136773 ) ) ( not ( = ?auto_136766 ?auto_136774 ) ) ( not ( = ?auto_136766 ?auto_136775 ) ) ( not ( = ?auto_136766 ?auto_136776 ) ) ( not ( = ?auto_136767 ?auto_136768 ) ) ( not ( = ?auto_136767 ?auto_136769 ) ) ( not ( = ?auto_136767 ?auto_136770 ) ) ( not ( = ?auto_136767 ?auto_136771 ) ) ( not ( = ?auto_136767 ?auto_136772 ) ) ( not ( = ?auto_136767 ?auto_136773 ) ) ( not ( = ?auto_136767 ?auto_136774 ) ) ( not ( = ?auto_136767 ?auto_136775 ) ) ( not ( = ?auto_136767 ?auto_136776 ) ) ( not ( = ?auto_136768 ?auto_136769 ) ) ( not ( = ?auto_136768 ?auto_136770 ) ) ( not ( = ?auto_136768 ?auto_136771 ) ) ( not ( = ?auto_136768 ?auto_136772 ) ) ( not ( = ?auto_136768 ?auto_136773 ) ) ( not ( = ?auto_136768 ?auto_136774 ) ) ( not ( = ?auto_136768 ?auto_136775 ) ) ( not ( = ?auto_136768 ?auto_136776 ) ) ( not ( = ?auto_136769 ?auto_136770 ) ) ( not ( = ?auto_136769 ?auto_136771 ) ) ( not ( = ?auto_136769 ?auto_136772 ) ) ( not ( = ?auto_136769 ?auto_136773 ) ) ( not ( = ?auto_136769 ?auto_136774 ) ) ( not ( = ?auto_136769 ?auto_136775 ) ) ( not ( = ?auto_136769 ?auto_136776 ) ) ( not ( = ?auto_136770 ?auto_136771 ) ) ( not ( = ?auto_136770 ?auto_136772 ) ) ( not ( = ?auto_136770 ?auto_136773 ) ) ( not ( = ?auto_136770 ?auto_136774 ) ) ( not ( = ?auto_136770 ?auto_136775 ) ) ( not ( = ?auto_136770 ?auto_136776 ) ) ( not ( = ?auto_136771 ?auto_136772 ) ) ( not ( = ?auto_136771 ?auto_136773 ) ) ( not ( = ?auto_136771 ?auto_136774 ) ) ( not ( = ?auto_136771 ?auto_136775 ) ) ( not ( = ?auto_136771 ?auto_136776 ) ) ( not ( = ?auto_136772 ?auto_136773 ) ) ( not ( = ?auto_136772 ?auto_136774 ) ) ( not ( = ?auto_136772 ?auto_136775 ) ) ( not ( = ?auto_136772 ?auto_136776 ) ) ( not ( = ?auto_136773 ?auto_136774 ) ) ( not ( = ?auto_136773 ?auto_136775 ) ) ( not ( = ?auto_136773 ?auto_136776 ) ) ( not ( = ?auto_136774 ?auto_136775 ) ) ( not ( = ?auto_136774 ?auto_136776 ) ) ( not ( = ?auto_136775 ?auto_136776 ) ) ( ON ?auto_136774 ?auto_136775 ) ( ON ?auto_136773 ?auto_136774 ) ( ON ?auto_136772 ?auto_136773 ) ( CLEAR ?auto_136770 ) ( ON ?auto_136771 ?auto_136772 ) ( CLEAR ?auto_136771 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_136765 ?auto_136766 ?auto_136767 ?auto_136768 ?auto_136769 ?auto_136770 ?auto_136771 )
      ( MAKE-11PILE ?auto_136765 ?auto_136766 ?auto_136767 ?auto_136768 ?auto_136769 ?auto_136770 ?auto_136771 ?auto_136772 ?auto_136773 ?auto_136774 ?auto_136775 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_136788 - BLOCK
      ?auto_136789 - BLOCK
      ?auto_136790 - BLOCK
      ?auto_136791 - BLOCK
      ?auto_136792 - BLOCK
      ?auto_136793 - BLOCK
      ?auto_136794 - BLOCK
      ?auto_136795 - BLOCK
      ?auto_136796 - BLOCK
      ?auto_136797 - BLOCK
      ?auto_136798 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_136798 ) ( ON-TABLE ?auto_136788 ) ( ON ?auto_136789 ?auto_136788 ) ( ON ?auto_136790 ?auto_136789 ) ( ON ?auto_136791 ?auto_136790 ) ( ON ?auto_136792 ?auto_136791 ) ( ON ?auto_136793 ?auto_136792 ) ( not ( = ?auto_136788 ?auto_136789 ) ) ( not ( = ?auto_136788 ?auto_136790 ) ) ( not ( = ?auto_136788 ?auto_136791 ) ) ( not ( = ?auto_136788 ?auto_136792 ) ) ( not ( = ?auto_136788 ?auto_136793 ) ) ( not ( = ?auto_136788 ?auto_136794 ) ) ( not ( = ?auto_136788 ?auto_136795 ) ) ( not ( = ?auto_136788 ?auto_136796 ) ) ( not ( = ?auto_136788 ?auto_136797 ) ) ( not ( = ?auto_136788 ?auto_136798 ) ) ( not ( = ?auto_136789 ?auto_136790 ) ) ( not ( = ?auto_136789 ?auto_136791 ) ) ( not ( = ?auto_136789 ?auto_136792 ) ) ( not ( = ?auto_136789 ?auto_136793 ) ) ( not ( = ?auto_136789 ?auto_136794 ) ) ( not ( = ?auto_136789 ?auto_136795 ) ) ( not ( = ?auto_136789 ?auto_136796 ) ) ( not ( = ?auto_136789 ?auto_136797 ) ) ( not ( = ?auto_136789 ?auto_136798 ) ) ( not ( = ?auto_136790 ?auto_136791 ) ) ( not ( = ?auto_136790 ?auto_136792 ) ) ( not ( = ?auto_136790 ?auto_136793 ) ) ( not ( = ?auto_136790 ?auto_136794 ) ) ( not ( = ?auto_136790 ?auto_136795 ) ) ( not ( = ?auto_136790 ?auto_136796 ) ) ( not ( = ?auto_136790 ?auto_136797 ) ) ( not ( = ?auto_136790 ?auto_136798 ) ) ( not ( = ?auto_136791 ?auto_136792 ) ) ( not ( = ?auto_136791 ?auto_136793 ) ) ( not ( = ?auto_136791 ?auto_136794 ) ) ( not ( = ?auto_136791 ?auto_136795 ) ) ( not ( = ?auto_136791 ?auto_136796 ) ) ( not ( = ?auto_136791 ?auto_136797 ) ) ( not ( = ?auto_136791 ?auto_136798 ) ) ( not ( = ?auto_136792 ?auto_136793 ) ) ( not ( = ?auto_136792 ?auto_136794 ) ) ( not ( = ?auto_136792 ?auto_136795 ) ) ( not ( = ?auto_136792 ?auto_136796 ) ) ( not ( = ?auto_136792 ?auto_136797 ) ) ( not ( = ?auto_136792 ?auto_136798 ) ) ( not ( = ?auto_136793 ?auto_136794 ) ) ( not ( = ?auto_136793 ?auto_136795 ) ) ( not ( = ?auto_136793 ?auto_136796 ) ) ( not ( = ?auto_136793 ?auto_136797 ) ) ( not ( = ?auto_136793 ?auto_136798 ) ) ( not ( = ?auto_136794 ?auto_136795 ) ) ( not ( = ?auto_136794 ?auto_136796 ) ) ( not ( = ?auto_136794 ?auto_136797 ) ) ( not ( = ?auto_136794 ?auto_136798 ) ) ( not ( = ?auto_136795 ?auto_136796 ) ) ( not ( = ?auto_136795 ?auto_136797 ) ) ( not ( = ?auto_136795 ?auto_136798 ) ) ( not ( = ?auto_136796 ?auto_136797 ) ) ( not ( = ?auto_136796 ?auto_136798 ) ) ( not ( = ?auto_136797 ?auto_136798 ) ) ( ON ?auto_136797 ?auto_136798 ) ( ON ?auto_136796 ?auto_136797 ) ( ON ?auto_136795 ?auto_136796 ) ( CLEAR ?auto_136793 ) ( ON ?auto_136794 ?auto_136795 ) ( CLEAR ?auto_136794 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_136788 ?auto_136789 ?auto_136790 ?auto_136791 ?auto_136792 ?auto_136793 ?auto_136794 )
      ( MAKE-11PILE ?auto_136788 ?auto_136789 ?auto_136790 ?auto_136791 ?auto_136792 ?auto_136793 ?auto_136794 ?auto_136795 ?auto_136796 ?auto_136797 ?auto_136798 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_136810 - BLOCK
      ?auto_136811 - BLOCK
      ?auto_136812 - BLOCK
      ?auto_136813 - BLOCK
      ?auto_136814 - BLOCK
      ?auto_136815 - BLOCK
      ?auto_136816 - BLOCK
      ?auto_136817 - BLOCK
      ?auto_136818 - BLOCK
      ?auto_136819 - BLOCK
      ?auto_136820 - BLOCK
    )
    :vars
    (
      ?auto_136821 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_136820 ?auto_136821 ) ( ON-TABLE ?auto_136810 ) ( ON ?auto_136811 ?auto_136810 ) ( ON ?auto_136812 ?auto_136811 ) ( ON ?auto_136813 ?auto_136812 ) ( ON ?auto_136814 ?auto_136813 ) ( not ( = ?auto_136810 ?auto_136811 ) ) ( not ( = ?auto_136810 ?auto_136812 ) ) ( not ( = ?auto_136810 ?auto_136813 ) ) ( not ( = ?auto_136810 ?auto_136814 ) ) ( not ( = ?auto_136810 ?auto_136815 ) ) ( not ( = ?auto_136810 ?auto_136816 ) ) ( not ( = ?auto_136810 ?auto_136817 ) ) ( not ( = ?auto_136810 ?auto_136818 ) ) ( not ( = ?auto_136810 ?auto_136819 ) ) ( not ( = ?auto_136810 ?auto_136820 ) ) ( not ( = ?auto_136810 ?auto_136821 ) ) ( not ( = ?auto_136811 ?auto_136812 ) ) ( not ( = ?auto_136811 ?auto_136813 ) ) ( not ( = ?auto_136811 ?auto_136814 ) ) ( not ( = ?auto_136811 ?auto_136815 ) ) ( not ( = ?auto_136811 ?auto_136816 ) ) ( not ( = ?auto_136811 ?auto_136817 ) ) ( not ( = ?auto_136811 ?auto_136818 ) ) ( not ( = ?auto_136811 ?auto_136819 ) ) ( not ( = ?auto_136811 ?auto_136820 ) ) ( not ( = ?auto_136811 ?auto_136821 ) ) ( not ( = ?auto_136812 ?auto_136813 ) ) ( not ( = ?auto_136812 ?auto_136814 ) ) ( not ( = ?auto_136812 ?auto_136815 ) ) ( not ( = ?auto_136812 ?auto_136816 ) ) ( not ( = ?auto_136812 ?auto_136817 ) ) ( not ( = ?auto_136812 ?auto_136818 ) ) ( not ( = ?auto_136812 ?auto_136819 ) ) ( not ( = ?auto_136812 ?auto_136820 ) ) ( not ( = ?auto_136812 ?auto_136821 ) ) ( not ( = ?auto_136813 ?auto_136814 ) ) ( not ( = ?auto_136813 ?auto_136815 ) ) ( not ( = ?auto_136813 ?auto_136816 ) ) ( not ( = ?auto_136813 ?auto_136817 ) ) ( not ( = ?auto_136813 ?auto_136818 ) ) ( not ( = ?auto_136813 ?auto_136819 ) ) ( not ( = ?auto_136813 ?auto_136820 ) ) ( not ( = ?auto_136813 ?auto_136821 ) ) ( not ( = ?auto_136814 ?auto_136815 ) ) ( not ( = ?auto_136814 ?auto_136816 ) ) ( not ( = ?auto_136814 ?auto_136817 ) ) ( not ( = ?auto_136814 ?auto_136818 ) ) ( not ( = ?auto_136814 ?auto_136819 ) ) ( not ( = ?auto_136814 ?auto_136820 ) ) ( not ( = ?auto_136814 ?auto_136821 ) ) ( not ( = ?auto_136815 ?auto_136816 ) ) ( not ( = ?auto_136815 ?auto_136817 ) ) ( not ( = ?auto_136815 ?auto_136818 ) ) ( not ( = ?auto_136815 ?auto_136819 ) ) ( not ( = ?auto_136815 ?auto_136820 ) ) ( not ( = ?auto_136815 ?auto_136821 ) ) ( not ( = ?auto_136816 ?auto_136817 ) ) ( not ( = ?auto_136816 ?auto_136818 ) ) ( not ( = ?auto_136816 ?auto_136819 ) ) ( not ( = ?auto_136816 ?auto_136820 ) ) ( not ( = ?auto_136816 ?auto_136821 ) ) ( not ( = ?auto_136817 ?auto_136818 ) ) ( not ( = ?auto_136817 ?auto_136819 ) ) ( not ( = ?auto_136817 ?auto_136820 ) ) ( not ( = ?auto_136817 ?auto_136821 ) ) ( not ( = ?auto_136818 ?auto_136819 ) ) ( not ( = ?auto_136818 ?auto_136820 ) ) ( not ( = ?auto_136818 ?auto_136821 ) ) ( not ( = ?auto_136819 ?auto_136820 ) ) ( not ( = ?auto_136819 ?auto_136821 ) ) ( not ( = ?auto_136820 ?auto_136821 ) ) ( ON ?auto_136819 ?auto_136820 ) ( ON ?auto_136818 ?auto_136819 ) ( ON ?auto_136817 ?auto_136818 ) ( ON ?auto_136816 ?auto_136817 ) ( CLEAR ?auto_136814 ) ( ON ?auto_136815 ?auto_136816 ) ( CLEAR ?auto_136815 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_136810 ?auto_136811 ?auto_136812 ?auto_136813 ?auto_136814 ?auto_136815 )
      ( MAKE-11PILE ?auto_136810 ?auto_136811 ?auto_136812 ?auto_136813 ?auto_136814 ?auto_136815 ?auto_136816 ?auto_136817 ?auto_136818 ?auto_136819 ?auto_136820 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_136833 - BLOCK
      ?auto_136834 - BLOCK
      ?auto_136835 - BLOCK
      ?auto_136836 - BLOCK
      ?auto_136837 - BLOCK
      ?auto_136838 - BLOCK
      ?auto_136839 - BLOCK
      ?auto_136840 - BLOCK
      ?auto_136841 - BLOCK
      ?auto_136842 - BLOCK
      ?auto_136843 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_136843 ) ( ON-TABLE ?auto_136833 ) ( ON ?auto_136834 ?auto_136833 ) ( ON ?auto_136835 ?auto_136834 ) ( ON ?auto_136836 ?auto_136835 ) ( ON ?auto_136837 ?auto_136836 ) ( not ( = ?auto_136833 ?auto_136834 ) ) ( not ( = ?auto_136833 ?auto_136835 ) ) ( not ( = ?auto_136833 ?auto_136836 ) ) ( not ( = ?auto_136833 ?auto_136837 ) ) ( not ( = ?auto_136833 ?auto_136838 ) ) ( not ( = ?auto_136833 ?auto_136839 ) ) ( not ( = ?auto_136833 ?auto_136840 ) ) ( not ( = ?auto_136833 ?auto_136841 ) ) ( not ( = ?auto_136833 ?auto_136842 ) ) ( not ( = ?auto_136833 ?auto_136843 ) ) ( not ( = ?auto_136834 ?auto_136835 ) ) ( not ( = ?auto_136834 ?auto_136836 ) ) ( not ( = ?auto_136834 ?auto_136837 ) ) ( not ( = ?auto_136834 ?auto_136838 ) ) ( not ( = ?auto_136834 ?auto_136839 ) ) ( not ( = ?auto_136834 ?auto_136840 ) ) ( not ( = ?auto_136834 ?auto_136841 ) ) ( not ( = ?auto_136834 ?auto_136842 ) ) ( not ( = ?auto_136834 ?auto_136843 ) ) ( not ( = ?auto_136835 ?auto_136836 ) ) ( not ( = ?auto_136835 ?auto_136837 ) ) ( not ( = ?auto_136835 ?auto_136838 ) ) ( not ( = ?auto_136835 ?auto_136839 ) ) ( not ( = ?auto_136835 ?auto_136840 ) ) ( not ( = ?auto_136835 ?auto_136841 ) ) ( not ( = ?auto_136835 ?auto_136842 ) ) ( not ( = ?auto_136835 ?auto_136843 ) ) ( not ( = ?auto_136836 ?auto_136837 ) ) ( not ( = ?auto_136836 ?auto_136838 ) ) ( not ( = ?auto_136836 ?auto_136839 ) ) ( not ( = ?auto_136836 ?auto_136840 ) ) ( not ( = ?auto_136836 ?auto_136841 ) ) ( not ( = ?auto_136836 ?auto_136842 ) ) ( not ( = ?auto_136836 ?auto_136843 ) ) ( not ( = ?auto_136837 ?auto_136838 ) ) ( not ( = ?auto_136837 ?auto_136839 ) ) ( not ( = ?auto_136837 ?auto_136840 ) ) ( not ( = ?auto_136837 ?auto_136841 ) ) ( not ( = ?auto_136837 ?auto_136842 ) ) ( not ( = ?auto_136837 ?auto_136843 ) ) ( not ( = ?auto_136838 ?auto_136839 ) ) ( not ( = ?auto_136838 ?auto_136840 ) ) ( not ( = ?auto_136838 ?auto_136841 ) ) ( not ( = ?auto_136838 ?auto_136842 ) ) ( not ( = ?auto_136838 ?auto_136843 ) ) ( not ( = ?auto_136839 ?auto_136840 ) ) ( not ( = ?auto_136839 ?auto_136841 ) ) ( not ( = ?auto_136839 ?auto_136842 ) ) ( not ( = ?auto_136839 ?auto_136843 ) ) ( not ( = ?auto_136840 ?auto_136841 ) ) ( not ( = ?auto_136840 ?auto_136842 ) ) ( not ( = ?auto_136840 ?auto_136843 ) ) ( not ( = ?auto_136841 ?auto_136842 ) ) ( not ( = ?auto_136841 ?auto_136843 ) ) ( not ( = ?auto_136842 ?auto_136843 ) ) ( ON ?auto_136842 ?auto_136843 ) ( ON ?auto_136841 ?auto_136842 ) ( ON ?auto_136840 ?auto_136841 ) ( ON ?auto_136839 ?auto_136840 ) ( CLEAR ?auto_136837 ) ( ON ?auto_136838 ?auto_136839 ) ( CLEAR ?auto_136838 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_136833 ?auto_136834 ?auto_136835 ?auto_136836 ?auto_136837 ?auto_136838 )
      ( MAKE-11PILE ?auto_136833 ?auto_136834 ?auto_136835 ?auto_136836 ?auto_136837 ?auto_136838 ?auto_136839 ?auto_136840 ?auto_136841 ?auto_136842 ?auto_136843 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_136855 - BLOCK
      ?auto_136856 - BLOCK
      ?auto_136857 - BLOCK
      ?auto_136858 - BLOCK
      ?auto_136859 - BLOCK
      ?auto_136860 - BLOCK
      ?auto_136861 - BLOCK
      ?auto_136862 - BLOCK
      ?auto_136863 - BLOCK
      ?auto_136864 - BLOCK
      ?auto_136865 - BLOCK
    )
    :vars
    (
      ?auto_136866 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_136865 ?auto_136866 ) ( ON-TABLE ?auto_136855 ) ( ON ?auto_136856 ?auto_136855 ) ( ON ?auto_136857 ?auto_136856 ) ( ON ?auto_136858 ?auto_136857 ) ( not ( = ?auto_136855 ?auto_136856 ) ) ( not ( = ?auto_136855 ?auto_136857 ) ) ( not ( = ?auto_136855 ?auto_136858 ) ) ( not ( = ?auto_136855 ?auto_136859 ) ) ( not ( = ?auto_136855 ?auto_136860 ) ) ( not ( = ?auto_136855 ?auto_136861 ) ) ( not ( = ?auto_136855 ?auto_136862 ) ) ( not ( = ?auto_136855 ?auto_136863 ) ) ( not ( = ?auto_136855 ?auto_136864 ) ) ( not ( = ?auto_136855 ?auto_136865 ) ) ( not ( = ?auto_136855 ?auto_136866 ) ) ( not ( = ?auto_136856 ?auto_136857 ) ) ( not ( = ?auto_136856 ?auto_136858 ) ) ( not ( = ?auto_136856 ?auto_136859 ) ) ( not ( = ?auto_136856 ?auto_136860 ) ) ( not ( = ?auto_136856 ?auto_136861 ) ) ( not ( = ?auto_136856 ?auto_136862 ) ) ( not ( = ?auto_136856 ?auto_136863 ) ) ( not ( = ?auto_136856 ?auto_136864 ) ) ( not ( = ?auto_136856 ?auto_136865 ) ) ( not ( = ?auto_136856 ?auto_136866 ) ) ( not ( = ?auto_136857 ?auto_136858 ) ) ( not ( = ?auto_136857 ?auto_136859 ) ) ( not ( = ?auto_136857 ?auto_136860 ) ) ( not ( = ?auto_136857 ?auto_136861 ) ) ( not ( = ?auto_136857 ?auto_136862 ) ) ( not ( = ?auto_136857 ?auto_136863 ) ) ( not ( = ?auto_136857 ?auto_136864 ) ) ( not ( = ?auto_136857 ?auto_136865 ) ) ( not ( = ?auto_136857 ?auto_136866 ) ) ( not ( = ?auto_136858 ?auto_136859 ) ) ( not ( = ?auto_136858 ?auto_136860 ) ) ( not ( = ?auto_136858 ?auto_136861 ) ) ( not ( = ?auto_136858 ?auto_136862 ) ) ( not ( = ?auto_136858 ?auto_136863 ) ) ( not ( = ?auto_136858 ?auto_136864 ) ) ( not ( = ?auto_136858 ?auto_136865 ) ) ( not ( = ?auto_136858 ?auto_136866 ) ) ( not ( = ?auto_136859 ?auto_136860 ) ) ( not ( = ?auto_136859 ?auto_136861 ) ) ( not ( = ?auto_136859 ?auto_136862 ) ) ( not ( = ?auto_136859 ?auto_136863 ) ) ( not ( = ?auto_136859 ?auto_136864 ) ) ( not ( = ?auto_136859 ?auto_136865 ) ) ( not ( = ?auto_136859 ?auto_136866 ) ) ( not ( = ?auto_136860 ?auto_136861 ) ) ( not ( = ?auto_136860 ?auto_136862 ) ) ( not ( = ?auto_136860 ?auto_136863 ) ) ( not ( = ?auto_136860 ?auto_136864 ) ) ( not ( = ?auto_136860 ?auto_136865 ) ) ( not ( = ?auto_136860 ?auto_136866 ) ) ( not ( = ?auto_136861 ?auto_136862 ) ) ( not ( = ?auto_136861 ?auto_136863 ) ) ( not ( = ?auto_136861 ?auto_136864 ) ) ( not ( = ?auto_136861 ?auto_136865 ) ) ( not ( = ?auto_136861 ?auto_136866 ) ) ( not ( = ?auto_136862 ?auto_136863 ) ) ( not ( = ?auto_136862 ?auto_136864 ) ) ( not ( = ?auto_136862 ?auto_136865 ) ) ( not ( = ?auto_136862 ?auto_136866 ) ) ( not ( = ?auto_136863 ?auto_136864 ) ) ( not ( = ?auto_136863 ?auto_136865 ) ) ( not ( = ?auto_136863 ?auto_136866 ) ) ( not ( = ?auto_136864 ?auto_136865 ) ) ( not ( = ?auto_136864 ?auto_136866 ) ) ( not ( = ?auto_136865 ?auto_136866 ) ) ( ON ?auto_136864 ?auto_136865 ) ( ON ?auto_136863 ?auto_136864 ) ( ON ?auto_136862 ?auto_136863 ) ( ON ?auto_136861 ?auto_136862 ) ( ON ?auto_136860 ?auto_136861 ) ( CLEAR ?auto_136858 ) ( ON ?auto_136859 ?auto_136860 ) ( CLEAR ?auto_136859 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_136855 ?auto_136856 ?auto_136857 ?auto_136858 ?auto_136859 )
      ( MAKE-11PILE ?auto_136855 ?auto_136856 ?auto_136857 ?auto_136858 ?auto_136859 ?auto_136860 ?auto_136861 ?auto_136862 ?auto_136863 ?auto_136864 ?auto_136865 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_136878 - BLOCK
      ?auto_136879 - BLOCK
      ?auto_136880 - BLOCK
      ?auto_136881 - BLOCK
      ?auto_136882 - BLOCK
      ?auto_136883 - BLOCK
      ?auto_136884 - BLOCK
      ?auto_136885 - BLOCK
      ?auto_136886 - BLOCK
      ?auto_136887 - BLOCK
      ?auto_136888 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_136888 ) ( ON-TABLE ?auto_136878 ) ( ON ?auto_136879 ?auto_136878 ) ( ON ?auto_136880 ?auto_136879 ) ( ON ?auto_136881 ?auto_136880 ) ( not ( = ?auto_136878 ?auto_136879 ) ) ( not ( = ?auto_136878 ?auto_136880 ) ) ( not ( = ?auto_136878 ?auto_136881 ) ) ( not ( = ?auto_136878 ?auto_136882 ) ) ( not ( = ?auto_136878 ?auto_136883 ) ) ( not ( = ?auto_136878 ?auto_136884 ) ) ( not ( = ?auto_136878 ?auto_136885 ) ) ( not ( = ?auto_136878 ?auto_136886 ) ) ( not ( = ?auto_136878 ?auto_136887 ) ) ( not ( = ?auto_136878 ?auto_136888 ) ) ( not ( = ?auto_136879 ?auto_136880 ) ) ( not ( = ?auto_136879 ?auto_136881 ) ) ( not ( = ?auto_136879 ?auto_136882 ) ) ( not ( = ?auto_136879 ?auto_136883 ) ) ( not ( = ?auto_136879 ?auto_136884 ) ) ( not ( = ?auto_136879 ?auto_136885 ) ) ( not ( = ?auto_136879 ?auto_136886 ) ) ( not ( = ?auto_136879 ?auto_136887 ) ) ( not ( = ?auto_136879 ?auto_136888 ) ) ( not ( = ?auto_136880 ?auto_136881 ) ) ( not ( = ?auto_136880 ?auto_136882 ) ) ( not ( = ?auto_136880 ?auto_136883 ) ) ( not ( = ?auto_136880 ?auto_136884 ) ) ( not ( = ?auto_136880 ?auto_136885 ) ) ( not ( = ?auto_136880 ?auto_136886 ) ) ( not ( = ?auto_136880 ?auto_136887 ) ) ( not ( = ?auto_136880 ?auto_136888 ) ) ( not ( = ?auto_136881 ?auto_136882 ) ) ( not ( = ?auto_136881 ?auto_136883 ) ) ( not ( = ?auto_136881 ?auto_136884 ) ) ( not ( = ?auto_136881 ?auto_136885 ) ) ( not ( = ?auto_136881 ?auto_136886 ) ) ( not ( = ?auto_136881 ?auto_136887 ) ) ( not ( = ?auto_136881 ?auto_136888 ) ) ( not ( = ?auto_136882 ?auto_136883 ) ) ( not ( = ?auto_136882 ?auto_136884 ) ) ( not ( = ?auto_136882 ?auto_136885 ) ) ( not ( = ?auto_136882 ?auto_136886 ) ) ( not ( = ?auto_136882 ?auto_136887 ) ) ( not ( = ?auto_136882 ?auto_136888 ) ) ( not ( = ?auto_136883 ?auto_136884 ) ) ( not ( = ?auto_136883 ?auto_136885 ) ) ( not ( = ?auto_136883 ?auto_136886 ) ) ( not ( = ?auto_136883 ?auto_136887 ) ) ( not ( = ?auto_136883 ?auto_136888 ) ) ( not ( = ?auto_136884 ?auto_136885 ) ) ( not ( = ?auto_136884 ?auto_136886 ) ) ( not ( = ?auto_136884 ?auto_136887 ) ) ( not ( = ?auto_136884 ?auto_136888 ) ) ( not ( = ?auto_136885 ?auto_136886 ) ) ( not ( = ?auto_136885 ?auto_136887 ) ) ( not ( = ?auto_136885 ?auto_136888 ) ) ( not ( = ?auto_136886 ?auto_136887 ) ) ( not ( = ?auto_136886 ?auto_136888 ) ) ( not ( = ?auto_136887 ?auto_136888 ) ) ( ON ?auto_136887 ?auto_136888 ) ( ON ?auto_136886 ?auto_136887 ) ( ON ?auto_136885 ?auto_136886 ) ( ON ?auto_136884 ?auto_136885 ) ( ON ?auto_136883 ?auto_136884 ) ( CLEAR ?auto_136881 ) ( ON ?auto_136882 ?auto_136883 ) ( CLEAR ?auto_136882 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_136878 ?auto_136879 ?auto_136880 ?auto_136881 ?auto_136882 )
      ( MAKE-11PILE ?auto_136878 ?auto_136879 ?auto_136880 ?auto_136881 ?auto_136882 ?auto_136883 ?auto_136884 ?auto_136885 ?auto_136886 ?auto_136887 ?auto_136888 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_136900 - BLOCK
      ?auto_136901 - BLOCK
      ?auto_136902 - BLOCK
      ?auto_136903 - BLOCK
      ?auto_136904 - BLOCK
      ?auto_136905 - BLOCK
      ?auto_136906 - BLOCK
      ?auto_136907 - BLOCK
      ?auto_136908 - BLOCK
      ?auto_136909 - BLOCK
      ?auto_136910 - BLOCK
    )
    :vars
    (
      ?auto_136911 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_136910 ?auto_136911 ) ( ON-TABLE ?auto_136900 ) ( ON ?auto_136901 ?auto_136900 ) ( ON ?auto_136902 ?auto_136901 ) ( not ( = ?auto_136900 ?auto_136901 ) ) ( not ( = ?auto_136900 ?auto_136902 ) ) ( not ( = ?auto_136900 ?auto_136903 ) ) ( not ( = ?auto_136900 ?auto_136904 ) ) ( not ( = ?auto_136900 ?auto_136905 ) ) ( not ( = ?auto_136900 ?auto_136906 ) ) ( not ( = ?auto_136900 ?auto_136907 ) ) ( not ( = ?auto_136900 ?auto_136908 ) ) ( not ( = ?auto_136900 ?auto_136909 ) ) ( not ( = ?auto_136900 ?auto_136910 ) ) ( not ( = ?auto_136900 ?auto_136911 ) ) ( not ( = ?auto_136901 ?auto_136902 ) ) ( not ( = ?auto_136901 ?auto_136903 ) ) ( not ( = ?auto_136901 ?auto_136904 ) ) ( not ( = ?auto_136901 ?auto_136905 ) ) ( not ( = ?auto_136901 ?auto_136906 ) ) ( not ( = ?auto_136901 ?auto_136907 ) ) ( not ( = ?auto_136901 ?auto_136908 ) ) ( not ( = ?auto_136901 ?auto_136909 ) ) ( not ( = ?auto_136901 ?auto_136910 ) ) ( not ( = ?auto_136901 ?auto_136911 ) ) ( not ( = ?auto_136902 ?auto_136903 ) ) ( not ( = ?auto_136902 ?auto_136904 ) ) ( not ( = ?auto_136902 ?auto_136905 ) ) ( not ( = ?auto_136902 ?auto_136906 ) ) ( not ( = ?auto_136902 ?auto_136907 ) ) ( not ( = ?auto_136902 ?auto_136908 ) ) ( not ( = ?auto_136902 ?auto_136909 ) ) ( not ( = ?auto_136902 ?auto_136910 ) ) ( not ( = ?auto_136902 ?auto_136911 ) ) ( not ( = ?auto_136903 ?auto_136904 ) ) ( not ( = ?auto_136903 ?auto_136905 ) ) ( not ( = ?auto_136903 ?auto_136906 ) ) ( not ( = ?auto_136903 ?auto_136907 ) ) ( not ( = ?auto_136903 ?auto_136908 ) ) ( not ( = ?auto_136903 ?auto_136909 ) ) ( not ( = ?auto_136903 ?auto_136910 ) ) ( not ( = ?auto_136903 ?auto_136911 ) ) ( not ( = ?auto_136904 ?auto_136905 ) ) ( not ( = ?auto_136904 ?auto_136906 ) ) ( not ( = ?auto_136904 ?auto_136907 ) ) ( not ( = ?auto_136904 ?auto_136908 ) ) ( not ( = ?auto_136904 ?auto_136909 ) ) ( not ( = ?auto_136904 ?auto_136910 ) ) ( not ( = ?auto_136904 ?auto_136911 ) ) ( not ( = ?auto_136905 ?auto_136906 ) ) ( not ( = ?auto_136905 ?auto_136907 ) ) ( not ( = ?auto_136905 ?auto_136908 ) ) ( not ( = ?auto_136905 ?auto_136909 ) ) ( not ( = ?auto_136905 ?auto_136910 ) ) ( not ( = ?auto_136905 ?auto_136911 ) ) ( not ( = ?auto_136906 ?auto_136907 ) ) ( not ( = ?auto_136906 ?auto_136908 ) ) ( not ( = ?auto_136906 ?auto_136909 ) ) ( not ( = ?auto_136906 ?auto_136910 ) ) ( not ( = ?auto_136906 ?auto_136911 ) ) ( not ( = ?auto_136907 ?auto_136908 ) ) ( not ( = ?auto_136907 ?auto_136909 ) ) ( not ( = ?auto_136907 ?auto_136910 ) ) ( not ( = ?auto_136907 ?auto_136911 ) ) ( not ( = ?auto_136908 ?auto_136909 ) ) ( not ( = ?auto_136908 ?auto_136910 ) ) ( not ( = ?auto_136908 ?auto_136911 ) ) ( not ( = ?auto_136909 ?auto_136910 ) ) ( not ( = ?auto_136909 ?auto_136911 ) ) ( not ( = ?auto_136910 ?auto_136911 ) ) ( ON ?auto_136909 ?auto_136910 ) ( ON ?auto_136908 ?auto_136909 ) ( ON ?auto_136907 ?auto_136908 ) ( ON ?auto_136906 ?auto_136907 ) ( ON ?auto_136905 ?auto_136906 ) ( ON ?auto_136904 ?auto_136905 ) ( CLEAR ?auto_136902 ) ( ON ?auto_136903 ?auto_136904 ) ( CLEAR ?auto_136903 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_136900 ?auto_136901 ?auto_136902 ?auto_136903 )
      ( MAKE-11PILE ?auto_136900 ?auto_136901 ?auto_136902 ?auto_136903 ?auto_136904 ?auto_136905 ?auto_136906 ?auto_136907 ?auto_136908 ?auto_136909 ?auto_136910 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_136923 - BLOCK
      ?auto_136924 - BLOCK
      ?auto_136925 - BLOCK
      ?auto_136926 - BLOCK
      ?auto_136927 - BLOCK
      ?auto_136928 - BLOCK
      ?auto_136929 - BLOCK
      ?auto_136930 - BLOCK
      ?auto_136931 - BLOCK
      ?auto_136932 - BLOCK
      ?auto_136933 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_136933 ) ( ON-TABLE ?auto_136923 ) ( ON ?auto_136924 ?auto_136923 ) ( ON ?auto_136925 ?auto_136924 ) ( not ( = ?auto_136923 ?auto_136924 ) ) ( not ( = ?auto_136923 ?auto_136925 ) ) ( not ( = ?auto_136923 ?auto_136926 ) ) ( not ( = ?auto_136923 ?auto_136927 ) ) ( not ( = ?auto_136923 ?auto_136928 ) ) ( not ( = ?auto_136923 ?auto_136929 ) ) ( not ( = ?auto_136923 ?auto_136930 ) ) ( not ( = ?auto_136923 ?auto_136931 ) ) ( not ( = ?auto_136923 ?auto_136932 ) ) ( not ( = ?auto_136923 ?auto_136933 ) ) ( not ( = ?auto_136924 ?auto_136925 ) ) ( not ( = ?auto_136924 ?auto_136926 ) ) ( not ( = ?auto_136924 ?auto_136927 ) ) ( not ( = ?auto_136924 ?auto_136928 ) ) ( not ( = ?auto_136924 ?auto_136929 ) ) ( not ( = ?auto_136924 ?auto_136930 ) ) ( not ( = ?auto_136924 ?auto_136931 ) ) ( not ( = ?auto_136924 ?auto_136932 ) ) ( not ( = ?auto_136924 ?auto_136933 ) ) ( not ( = ?auto_136925 ?auto_136926 ) ) ( not ( = ?auto_136925 ?auto_136927 ) ) ( not ( = ?auto_136925 ?auto_136928 ) ) ( not ( = ?auto_136925 ?auto_136929 ) ) ( not ( = ?auto_136925 ?auto_136930 ) ) ( not ( = ?auto_136925 ?auto_136931 ) ) ( not ( = ?auto_136925 ?auto_136932 ) ) ( not ( = ?auto_136925 ?auto_136933 ) ) ( not ( = ?auto_136926 ?auto_136927 ) ) ( not ( = ?auto_136926 ?auto_136928 ) ) ( not ( = ?auto_136926 ?auto_136929 ) ) ( not ( = ?auto_136926 ?auto_136930 ) ) ( not ( = ?auto_136926 ?auto_136931 ) ) ( not ( = ?auto_136926 ?auto_136932 ) ) ( not ( = ?auto_136926 ?auto_136933 ) ) ( not ( = ?auto_136927 ?auto_136928 ) ) ( not ( = ?auto_136927 ?auto_136929 ) ) ( not ( = ?auto_136927 ?auto_136930 ) ) ( not ( = ?auto_136927 ?auto_136931 ) ) ( not ( = ?auto_136927 ?auto_136932 ) ) ( not ( = ?auto_136927 ?auto_136933 ) ) ( not ( = ?auto_136928 ?auto_136929 ) ) ( not ( = ?auto_136928 ?auto_136930 ) ) ( not ( = ?auto_136928 ?auto_136931 ) ) ( not ( = ?auto_136928 ?auto_136932 ) ) ( not ( = ?auto_136928 ?auto_136933 ) ) ( not ( = ?auto_136929 ?auto_136930 ) ) ( not ( = ?auto_136929 ?auto_136931 ) ) ( not ( = ?auto_136929 ?auto_136932 ) ) ( not ( = ?auto_136929 ?auto_136933 ) ) ( not ( = ?auto_136930 ?auto_136931 ) ) ( not ( = ?auto_136930 ?auto_136932 ) ) ( not ( = ?auto_136930 ?auto_136933 ) ) ( not ( = ?auto_136931 ?auto_136932 ) ) ( not ( = ?auto_136931 ?auto_136933 ) ) ( not ( = ?auto_136932 ?auto_136933 ) ) ( ON ?auto_136932 ?auto_136933 ) ( ON ?auto_136931 ?auto_136932 ) ( ON ?auto_136930 ?auto_136931 ) ( ON ?auto_136929 ?auto_136930 ) ( ON ?auto_136928 ?auto_136929 ) ( ON ?auto_136927 ?auto_136928 ) ( CLEAR ?auto_136925 ) ( ON ?auto_136926 ?auto_136927 ) ( CLEAR ?auto_136926 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_136923 ?auto_136924 ?auto_136925 ?auto_136926 )
      ( MAKE-11PILE ?auto_136923 ?auto_136924 ?auto_136925 ?auto_136926 ?auto_136927 ?auto_136928 ?auto_136929 ?auto_136930 ?auto_136931 ?auto_136932 ?auto_136933 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_136945 - BLOCK
      ?auto_136946 - BLOCK
      ?auto_136947 - BLOCK
      ?auto_136948 - BLOCK
      ?auto_136949 - BLOCK
      ?auto_136950 - BLOCK
      ?auto_136951 - BLOCK
      ?auto_136952 - BLOCK
      ?auto_136953 - BLOCK
      ?auto_136954 - BLOCK
      ?auto_136955 - BLOCK
    )
    :vars
    (
      ?auto_136956 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_136955 ?auto_136956 ) ( ON-TABLE ?auto_136945 ) ( ON ?auto_136946 ?auto_136945 ) ( not ( = ?auto_136945 ?auto_136946 ) ) ( not ( = ?auto_136945 ?auto_136947 ) ) ( not ( = ?auto_136945 ?auto_136948 ) ) ( not ( = ?auto_136945 ?auto_136949 ) ) ( not ( = ?auto_136945 ?auto_136950 ) ) ( not ( = ?auto_136945 ?auto_136951 ) ) ( not ( = ?auto_136945 ?auto_136952 ) ) ( not ( = ?auto_136945 ?auto_136953 ) ) ( not ( = ?auto_136945 ?auto_136954 ) ) ( not ( = ?auto_136945 ?auto_136955 ) ) ( not ( = ?auto_136945 ?auto_136956 ) ) ( not ( = ?auto_136946 ?auto_136947 ) ) ( not ( = ?auto_136946 ?auto_136948 ) ) ( not ( = ?auto_136946 ?auto_136949 ) ) ( not ( = ?auto_136946 ?auto_136950 ) ) ( not ( = ?auto_136946 ?auto_136951 ) ) ( not ( = ?auto_136946 ?auto_136952 ) ) ( not ( = ?auto_136946 ?auto_136953 ) ) ( not ( = ?auto_136946 ?auto_136954 ) ) ( not ( = ?auto_136946 ?auto_136955 ) ) ( not ( = ?auto_136946 ?auto_136956 ) ) ( not ( = ?auto_136947 ?auto_136948 ) ) ( not ( = ?auto_136947 ?auto_136949 ) ) ( not ( = ?auto_136947 ?auto_136950 ) ) ( not ( = ?auto_136947 ?auto_136951 ) ) ( not ( = ?auto_136947 ?auto_136952 ) ) ( not ( = ?auto_136947 ?auto_136953 ) ) ( not ( = ?auto_136947 ?auto_136954 ) ) ( not ( = ?auto_136947 ?auto_136955 ) ) ( not ( = ?auto_136947 ?auto_136956 ) ) ( not ( = ?auto_136948 ?auto_136949 ) ) ( not ( = ?auto_136948 ?auto_136950 ) ) ( not ( = ?auto_136948 ?auto_136951 ) ) ( not ( = ?auto_136948 ?auto_136952 ) ) ( not ( = ?auto_136948 ?auto_136953 ) ) ( not ( = ?auto_136948 ?auto_136954 ) ) ( not ( = ?auto_136948 ?auto_136955 ) ) ( not ( = ?auto_136948 ?auto_136956 ) ) ( not ( = ?auto_136949 ?auto_136950 ) ) ( not ( = ?auto_136949 ?auto_136951 ) ) ( not ( = ?auto_136949 ?auto_136952 ) ) ( not ( = ?auto_136949 ?auto_136953 ) ) ( not ( = ?auto_136949 ?auto_136954 ) ) ( not ( = ?auto_136949 ?auto_136955 ) ) ( not ( = ?auto_136949 ?auto_136956 ) ) ( not ( = ?auto_136950 ?auto_136951 ) ) ( not ( = ?auto_136950 ?auto_136952 ) ) ( not ( = ?auto_136950 ?auto_136953 ) ) ( not ( = ?auto_136950 ?auto_136954 ) ) ( not ( = ?auto_136950 ?auto_136955 ) ) ( not ( = ?auto_136950 ?auto_136956 ) ) ( not ( = ?auto_136951 ?auto_136952 ) ) ( not ( = ?auto_136951 ?auto_136953 ) ) ( not ( = ?auto_136951 ?auto_136954 ) ) ( not ( = ?auto_136951 ?auto_136955 ) ) ( not ( = ?auto_136951 ?auto_136956 ) ) ( not ( = ?auto_136952 ?auto_136953 ) ) ( not ( = ?auto_136952 ?auto_136954 ) ) ( not ( = ?auto_136952 ?auto_136955 ) ) ( not ( = ?auto_136952 ?auto_136956 ) ) ( not ( = ?auto_136953 ?auto_136954 ) ) ( not ( = ?auto_136953 ?auto_136955 ) ) ( not ( = ?auto_136953 ?auto_136956 ) ) ( not ( = ?auto_136954 ?auto_136955 ) ) ( not ( = ?auto_136954 ?auto_136956 ) ) ( not ( = ?auto_136955 ?auto_136956 ) ) ( ON ?auto_136954 ?auto_136955 ) ( ON ?auto_136953 ?auto_136954 ) ( ON ?auto_136952 ?auto_136953 ) ( ON ?auto_136951 ?auto_136952 ) ( ON ?auto_136950 ?auto_136951 ) ( ON ?auto_136949 ?auto_136950 ) ( ON ?auto_136948 ?auto_136949 ) ( CLEAR ?auto_136946 ) ( ON ?auto_136947 ?auto_136948 ) ( CLEAR ?auto_136947 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_136945 ?auto_136946 ?auto_136947 )
      ( MAKE-11PILE ?auto_136945 ?auto_136946 ?auto_136947 ?auto_136948 ?auto_136949 ?auto_136950 ?auto_136951 ?auto_136952 ?auto_136953 ?auto_136954 ?auto_136955 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_136968 - BLOCK
      ?auto_136969 - BLOCK
      ?auto_136970 - BLOCK
      ?auto_136971 - BLOCK
      ?auto_136972 - BLOCK
      ?auto_136973 - BLOCK
      ?auto_136974 - BLOCK
      ?auto_136975 - BLOCK
      ?auto_136976 - BLOCK
      ?auto_136977 - BLOCK
      ?auto_136978 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_136978 ) ( ON-TABLE ?auto_136968 ) ( ON ?auto_136969 ?auto_136968 ) ( not ( = ?auto_136968 ?auto_136969 ) ) ( not ( = ?auto_136968 ?auto_136970 ) ) ( not ( = ?auto_136968 ?auto_136971 ) ) ( not ( = ?auto_136968 ?auto_136972 ) ) ( not ( = ?auto_136968 ?auto_136973 ) ) ( not ( = ?auto_136968 ?auto_136974 ) ) ( not ( = ?auto_136968 ?auto_136975 ) ) ( not ( = ?auto_136968 ?auto_136976 ) ) ( not ( = ?auto_136968 ?auto_136977 ) ) ( not ( = ?auto_136968 ?auto_136978 ) ) ( not ( = ?auto_136969 ?auto_136970 ) ) ( not ( = ?auto_136969 ?auto_136971 ) ) ( not ( = ?auto_136969 ?auto_136972 ) ) ( not ( = ?auto_136969 ?auto_136973 ) ) ( not ( = ?auto_136969 ?auto_136974 ) ) ( not ( = ?auto_136969 ?auto_136975 ) ) ( not ( = ?auto_136969 ?auto_136976 ) ) ( not ( = ?auto_136969 ?auto_136977 ) ) ( not ( = ?auto_136969 ?auto_136978 ) ) ( not ( = ?auto_136970 ?auto_136971 ) ) ( not ( = ?auto_136970 ?auto_136972 ) ) ( not ( = ?auto_136970 ?auto_136973 ) ) ( not ( = ?auto_136970 ?auto_136974 ) ) ( not ( = ?auto_136970 ?auto_136975 ) ) ( not ( = ?auto_136970 ?auto_136976 ) ) ( not ( = ?auto_136970 ?auto_136977 ) ) ( not ( = ?auto_136970 ?auto_136978 ) ) ( not ( = ?auto_136971 ?auto_136972 ) ) ( not ( = ?auto_136971 ?auto_136973 ) ) ( not ( = ?auto_136971 ?auto_136974 ) ) ( not ( = ?auto_136971 ?auto_136975 ) ) ( not ( = ?auto_136971 ?auto_136976 ) ) ( not ( = ?auto_136971 ?auto_136977 ) ) ( not ( = ?auto_136971 ?auto_136978 ) ) ( not ( = ?auto_136972 ?auto_136973 ) ) ( not ( = ?auto_136972 ?auto_136974 ) ) ( not ( = ?auto_136972 ?auto_136975 ) ) ( not ( = ?auto_136972 ?auto_136976 ) ) ( not ( = ?auto_136972 ?auto_136977 ) ) ( not ( = ?auto_136972 ?auto_136978 ) ) ( not ( = ?auto_136973 ?auto_136974 ) ) ( not ( = ?auto_136973 ?auto_136975 ) ) ( not ( = ?auto_136973 ?auto_136976 ) ) ( not ( = ?auto_136973 ?auto_136977 ) ) ( not ( = ?auto_136973 ?auto_136978 ) ) ( not ( = ?auto_136974 ?auto_136975 ) ) ( not ( = ?auto_136974 ?auto_136976 ) ) ( not ( = ?auto_136974 ?auto_136977 ) ) ( not ( = ?auto_136974 ?auto_136978 ) ) ( not ( = ?auto_136975 ?auto_136976 ) ) ( not ( = ?auto_136975 ?auto_136977 ) ) ( not ( = ?auto_136975 ?auto_136978 ) ) ( not ( = ?auto_136976 ?auto_136977 ) ) ( not ( = ?auto_136976 ?auto_136978 ) ) ( not ( = ?auto_136977 ?auto_136978 ) ) ( ON ?auto_136977 ?auto_136978 ) ( ON ?auto_136976 ?auto_136977 ) ( ON ?auto_136975 ?auto_136976 ) ( ON ?auto_136974 ?auto_136975 ) ( ON ?auto_136973 ?auto_136974 ) ( ON ?auto_136972 ?auto_136973 ) ( ON ?auto_136971 ?auto_136972 ) ( CLEAR ?auto_136969 ) ( ON ?auto_136970 ?auto_136971 ) ( CLEAR ?auto_136970 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_136968 ?auto_136969 ?auto_136970 )
      ( MAKE-11PILE ?auto_136968 ?auto_136969 ?auto_136970 ?auto_136971 ?auto_136972 ?auto_136973 ?auto_136974 ?auto_136975 ?auto_136976 ?auto_136977 ?auto_136978 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_136990 - BLOCK
      ?auto_136991 - BLOCK
      ?auto_136992 - BLOCK
      ?auto_136993 - BLOCK
      ?auto_136994 - BLOCK
      ?auto_136995 - BLOCK
      ?auto_136996 - BLOCK
      ?auto_136997 - BLOCK
      ?auto_136998 - BLOCK
      ?auto_136999 - BLOCK
      ?auto_137000 - BLOCK
    )
    :vars
    (
      ?auto_137001 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_137000 ?auto_137001 ) ( ON-TABLE ?auto_136990 ) ( not ( = ?auto_136990 ?auto_136991 ) ) ( not ( = ?auto_136990 ?auto_136992 ) ) ( not ( = ?auto_136990 ?auto_136993 ) ) ( not ( = ?auto_136990 ?auto_136994 ) ) ( not ( = ?auto_136990 ?auto_136995 ) ) ( not ( = ?auto_136990 ?auto_136996 ) ) ( not ( = ?auto_136990 ?auto_136997 ) ) ( not ( = ?auto_136990 ?auto_136998 ) ) ( not ( = ?auto_136990 ?auto_136999 ) ) ( not ( = ?auto_136990 ?auto_137000 ) ) ( not ( = ?auto_136990 ?auto_137001 ) ) ( not ( = ?auto_136991 ?auto_136992 ) ) ( not ( = ?auto_136991 ?auto_136993 ) ) ( not ( = ?auto_136991 ?auto_136994 ) ) ( not ( = ?auto_136991 ?auto_136995 ) ) ( not ( = ?auto_136991 ?auto_136996 ) ) ( not ( = ?auto_136991 ?auto_136997 ) ) ( not ( = ?auto_136991 ?auto_136998 ) ) ( not ( = ?auto_136991 ?auto_136999 ) ) ( not ( = ?auto_136991 ?auto_137000 ) ) ( not ( = ?auto_136991 ?auto_137001 ) ) ( not ( = ?auto_136992 ?auto_136993 ) ) ( not ( = ?auto_136992 ?auto_136994 ) ) ( not ( = ?auto_136992 ?auto_136995 ) ) ( not ( = ?auto_136992 ?auto_136996 ) ) ( not ( = ?auto_136992 ?auto_136997 ) ) ( not ( = ?auto_136992 ?auto_136998 ) ) ( not ( = ?auto_136992 ?auto_136999 ) ) ( not ( = ?auto_136992 ?auto_137000 ) ) ( not ( = ?auto_136992 ?auto_137001 ) ) ( not ( = ?auto_136993 ?auto_136994 ) ) ( not ( = ?auto_136993 ?auto_136995 ) ) ( not ( = ?auto_136993 ?auto_136996 ) ) ( not ( = ?auto_136993 ?auto_136997 ) ) ( not ( = ?auto_136993 ?auto_136998 ) ) ( not ( = ?auto_136993 ?auto_136999 ) ) ( not ( = ?auto_136993 ?auto_137000 ) ) ( not ( = ?auto_136993 ?auto_137001 ) ) ( not ( = ?auto_136994 ?auto_136995 ) ) ( not ( = ?auto_136994 ?auto_136996 ) ) ( not ( = ?auto_136994 ?auto_136997 ) ) ( not ( = ?auto_136994 ?auto_136998 ) ) ( not ( = ?auto_136994 ?auto_136999 ) ) ( not ( = ?auto_136994 ?auto_137000 ) ) ( not ( = ?auto_136994 ?auto_137001 ) ) ( not ( = ?auto_136995 ?auto_136996 ) ) ( not ( = ?auto_136995 ?auto_136997 ) ) ( not ( = ?auto_136995 ?auto_136998 ) ) ( not ( = ?auto_136995 ?auto_136999 ) ) ( not ( = ?auto_136995 ?auto_137000 ) ) ( not ( = ?auto_136995 ?auto_137001 ) ) ( not ( = ?auto_136996 ?auto_136997 ) ) ( not ( = ?auto_136996 ?auto_136998 ) ) ( not ( = ?auto_136996 ?auto_136999 ) ) ( not ( = ?auto_136996 ?auto_137000 ) ) ( not ( = ?auto_136996 ?auto_137001 ) ) ( not ( = ?auto_136997 ?auto_136998 ) ) ( not ( = ?auto_136997 ?auto_136999 ) ) ( not ( = ?auto_136997 ?auto_137000 ) ) ( not ( = ?auto_136997 ?auto_137001 ) ) ( not ( = ?auto_136998 ?auto_136999 ) ) ( not ( = ?auto_136998 ?auto_137000 ) ) ( not ( = ?auto_136998 ?auto_137001 ) ) ( not ( = ?auto_136999 ?auto_137000 ) ) ( not ( = ?auto_136999 ?auto_137001 ) ) ( not ( = ?auto_137000 ?auto_137001 ) ) ( ON ?auto_136999 ?auto_137000 ) ( ON ?auto_136998 ?auto_136999 ) ( ON ?auto_136997 ?auto_136998 ) ( ON ?auto_136996 ?auto_136997 ) ( ON ?auto_136995 ?auto_136996 ) ( ON ?auto_136994 ?auto_136995 ) ( ON ?auto_136993 ?auto_136994 ) ( ON ?auto_136992 ?auto_136993 ) ( CLEAR ?auto_136990 ) ( ON ?auto_136991 ?auto_136992 ) ( CLEAR ?auto_136991 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_136990 ?auto_136991 )
      ( MAKE-11PILE ?auto_136990 ?auto_136991 ?auto_136992 ?auto_136993 ?auto_136994 ?auto_136995 ?auto_136996 ?auto_136997 ?auto_136998 ?auto_136999 ?auto_137000 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_137013 - BLOCK
      ?auto_137014 - BLOCK
      ?auto_137015 - BLOCK
      ?auto_137016 - BLOCK
      ?auto_137017 - BLOCK
      ?auto_137018 - BLOCK
      ?auto_137019 - BLOCK
      ?auto_137020 - BLOCK
      ?auto_137021 - BLOCK
      ?auto_137022 - BLOCK
      ?auto_137023 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_137023 ) ( ON-TABLE ?auto_137013 ) ( not ( = ?auto_137013 ?auto_137014 ) ) ( not ( = ?auto_137013 ?auto_137015 ) ) ( not ( = ?auto_137013 ?auto_137016 ) ) ( not ( = ?auto_137013 ?auto_137017 ) ) ( not ( = ?auto_137013 ?auto_137018 ) ) ( not ( = ?auto_137013 ?auto_137019 ) ) ( not ( = ?auto_137013 ?auto_137020 ) ) ( not ( = ?auto_137013 ?auto_137021 ) ) ( not ( = ?auto_137013 ?auto_137022 ) ) ( not ( = ?auto_137013 ?auto_137023 ) ) ( not ( = ?auto_137014 ?auto_137015 ) ) ( not ( = ?auto_137014 ?auto_137016 ) ) ( not ( = ?auto_137014 ?auto_137017 ) ) ( not ( = ?auto_137014 ?auto_137018 ) ) ( not ( = ?auto_137014 ?auto_137019 ) ) ( not ( = ?auto_137014 ?auto_137020 ) ) ( not ( = ?auto_137014 ?auto_137021 ) ) ( not ( = ?auto_137014 ?auto_137022 ) ) ( not ( = ?auto_137014 ?auto_137023 ) ) ( not ( = ?auto_137015 ?auto_137016 ) ) ( not ( = ?auto_137015 ?auto_137017 ) ) ( not ( = ?auto_137015 ?auto_137018 ) ) ( not ( = ?auto_137015 ?auto_137019 ) ) ( not ( = ?auto_137015 ?auto_137020 ) ) ( not ( = ?auto_137015 ?auto_137021 ) ) ( not ( = ?auto_137015 ?auto_137022 ) ) ( not ( = ?auto_137015 ?auto_137023 ) ) ( not ( = ?auto_137016 ?auto_137017 ) ) ( not ( = ?auto_137016 ?auto_137018 ) ) ( not ( = ?auto_137016 ?auto_137019 ) ) ( not ( = ?auto_137016 ?auto_137020 ) ) ( not ( = ?auto_137016 ?auto_137021 ) ) ( not ( = ?auto_137016 ?auto_137022 ) ) ( not ( = ?auto_137016 ?auto_137023 ) ) ( not ( = ?auto_137017 ?auto_137018 ) ) ( not ( = ?auto_137017 ?auto_137019 ) ) ( not ( = ?auto_137017 ?auto_137020 ) ) ( not ( = ?auto_137017 ?auto_137021 ) ) ( not ( = ?auto_137017 ?auto_137022 ) ) ( not ( = ?auto_137017 ?auto_137023 ) ) ( not ( = ?auto_137018 ?auto_137019 ) ) ( not ( = ?auto_137018 ?auto_137020 ) ) ( not ( = ?auto_137018 ?auto_137021 ) ) ( not ( = ?auto_137018 ?auto_137022 ) ) ( not ( = ?auto_137018 ?auto_137023 ) ) ( not ( = ?auto_137019 ?auto_137020 ) ) ( not ( = ?auto_137019 ?auto_137021 ) ) ( not ( = ?auto_137019 ?auto_137022 ) ) ( not ( = ?auto_137019 ?auto_137023 ) ) ( not ( = ?auto_137020 ?auto_137021 ) ) ( not ( = ?auto_137020 ?auto_137022 ) ) ( not ( = ?auto_137020 ?auto_137023 ) ) ( not ( = ?auto_137021 ?auto_137022 ) ) ( not ( = ?auto_137021 ?auto_137023 ) ) ( not ( = ?auto_137022 ?auto_137023 ) ) ( ON ?auto_137022 ?auto_137023 ) ( ON ?auto_137021 ?auto_137022 ) ( ON ?auto_137020 ?auto_137021 ) ( ON ?auto_137019 ?auto_137020 ) ( ON ?auto_137018 ?auto_137019 ) ( ON ?auto_137017 ?auto_137018 ) ( ON ?auto_137016 ?auto_137017 ) ( ON ?auto_137015 ?auto_137016 ) ( CLEAR ?auto_137013 ) ( ON ?auto_137014 ?auto_137015 ) ( CLEAR ?auto_137014 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_137013 ?auto_137014 )
      ( MAKE-11PILE ?auto_137013 ?auto_137014 ?auto_137015 ?auto_137016 ?auto_137017 ?auto_137018 ?auto_137019 ?auto_137020 ?auto_137021 ?auto_137022 ?auto_137023 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_137035 - BLOCK
      ?auto_137036 - BLOCK
      ?auto_137037 - BLOCK
      ?auto_137038 - BLOCK
      ?auto_137039 - BLOCK
      ?auto_137040 - BLOCK
      ?auto_137041 - BLOCK
      ?auto_137042 - BLOCK
      ?auto_137043 - BLOCK
      ?auto_137044 - BLOCK
      ?auto_137045 - BLOCK
    )
    :vars
    (
      ?auto_137046 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_137045 ?auto_137046 ) ( not ( = ?auto_137035 ?auto_137036 ) ) ( not ( = ?auto_137035 ?auto_137037 ) ) ( not ( = ?auto_137035 ?auto_137038 ) ) ( not ( = ?auto_137035 ?auto_137039 ) ) ( not ( = ?auto_137035 ?auto_137040 ) ) ( not ( = ?auto_137035 ?auto_137041 ) ) ( not ( = ?auto_137035 ?auto_137042 ) ) ( not ( = ?auto_137035 ?auto_137043 ) ) ( not ( = ?auto_137035 ?auto_137044 ) ) ( not ( = ?auto_137035 ?auto_137045 ) ) ( not ( = ?auto_137035 ?auto_137046 ) ) ( not ( = ?auto_137036 ?auto_137037 ) ) ( not ( = ?auto_137036 ?auto_137038 ) ) ( not ( = ?auto_137036 ?auto_137039 ) ) ( not ( = ?auto_137036 ?auto_137040 ) ) ( not ( = ?auto_137036 ?auto_137041 ) ) ( not ( = ?auto_137036 ?auto_137042 ) ) ( not ( = ?auto_137036 ?auto_137043 ) ) ( not ( = ?auto_137036 ?auto_137044 ) ) ( not ( = ?auto_137036 ?auto_137045 ) ) ( not ( = ?auto_137036 ?auto_137046 ) ) ( not ( = ?auto_137037 ?auto_137038 ) ) ( not ( = ?auto_137037 ?auto_137039 ) ) ( not ( = ?auto_137037 ?auto_137040 ) ) ( not ( = ?auto_137037 ?auto_137041 ) ) ( not ( = ?auto_137037 ?auto_137042 ) ) ( not ( = ?auto_137037 ?auto_137043 ) ) ( not ( = ?auto_137037 ?auto_137044 ) ) ( not ( = ?auto_137037 ?auto_137045 ) ) ( not ( = ?auto_137037 ?auto_137046 ) ) ( not ( = ?auto_137038 ?auto_137039 ) ) ( not ( = ?auto_137038 ?auto_137040 ) ) ( not ( = ?auto_137038 ?auto_137041 ) ) ( not ( = ?auto_137038 ?auto_137042 ) ) ( not ( = ?auto_137038 ?auto_137043 ) ) ( not ( = ?auto_137038 ?auto_137044 ) ) ( not ( = ?auto_137038 ?auto_137045 ) ) ( not ( = ?auto_137038 ?auto_137046 ) ) ( not ( = ?auto_137039 ?auto_137040 ) ) ( not ( = ?auto_137039 ?auto_137041 ) ) ( not ( = ?auto_137039 ?auto_137042 ) ) ( not ( = ?auto_137039 ?auto_137043 ) ) ( not ( = ?auto_137039 ?auto_137044 ) ) ( not ( = ?auto_137039 ?auto_137045 ) ) ( not ( = ?auto_137039 ?auto_137046 ) ) ( not ( = ?auto_137040 ?auto_137041 ) ) ( not ( = ?auto_137040 ?auto_137042 ) ) ( not ( = ?auto_137040 ?auto_137043 ) ) ( not ( = ?auto_137040 ?auto_137044 ) ) ( not ( = ?auto_137040 ?auto_137045 ) ) ( not ( = ?auto_137040 ?auto_137046 ) ) ( not ( = ?auto_137041 ?auto_137042 ) ) ( not ( = ?auto_137041 ?auto_137043 ) ) ( not ( = ?auto_137041 ?auto_137044 ) ) ( not ( = ?auto_137041 ?auto_137045 ) ) ( not ( = ?auto_137041 ?auto_137046 ) ) ( not ( = ?auto_137042 ?auto_137043 ) ) ( not ( = ?auto_137042 ?auto_137044 ) ) ( not ( = ?auto_137042 ?auto_137045 ) ) ( not ( = ?auto_137042 ?auto_137046 ) ) ( not ( = ?auto_137043 ?auto_137044 ) ) ( not ( = ?auto_137043 ?auto_137045 ) ) ( not ( = ?auto_137043 ?auto_137046 ) ) ( not ( = ?auto_137044 ?auto_137045 ) ) ( not ( = ?auto_137044 ?auto_137046 ) ) ( not ( = ?auto_137045 ?auto_137046 ) ) ( ON ?auto_137044 ?auto_137045 ) ( ON ?auto_137043 ?auto_137044 ) ( ON ?auto_137042 ?auto_137043 ) ( ON ?auto_137041 ?auto_137042 ) ( ON ?auto_137040 ?auto_137041 ) ( ON ?auto_137039 ?auto_137040 ) ( ON ?auto_137038 ?auto_137039 ) ( ON ?auto_137037 ?auto_137038 ) ( ON ?auto_137036 ?auto_137037 ) ( ON ?auto_137035 ?auto_137036 ) ( CLEAR ?auto_137035 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_137035 )
      ( MAKE-11PILE ?auto_137035 ?auto_137036 ?auto_137037 ?auto_137038 ?auto_137039 ?auto_137040 ?auto_137041 ?auto_137042 ?auto_137043 ?auto_137044 ?auto_137045 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_137058 - BLOCK
      ?auto_137059 - BLOCK
      ?auto_137060 - BLOCK
      ?auto_137061 - BLOCK
      ?auto_137062 - BLOCK
      ?auto_137063 - BLOCK
      ?auto_137064 - BLOCK
      ?auto_137065 - BLOCK
      ?auto_137066 - BLOCK
      ?auto_137067 - BLOCK
      ?auto_137068 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_137068 ) ( not ( = ?auto_137058 ?auto_137059 ) ) ( not ( = ?auto_137058 ?auto_137060 ) ) ( not ( = ?auto_137058 ?auto_137061 ) ) ( not ( = ?auto_137058 ?auto_137062 ) ) ( not ( = ?auto_137058 ?auto_137063 ) ) ( not ( = ?auto_137058 ?auto_137064 ) ) ( not ( = ?auto_137058 ?auto_137065 ) ) ( not ( = ?auto_137058 ?auto_137066 ) ) ( not ( = ?auto_137058 ?auto_137067 ) ) ( not ( = ?auto_137058 ?auto_137068 ) ) ( not ( = ?auto_137059 ?auto_137060 ) ) ( not ( = ?auto_137059 ?auto_137061 ) ) ( not ( = ?auto_137059 ?auto_137062 ) ) ( not ( = ?auto_137059 ?auto_137063 ) ) ( not ( = ?auto_137059 ?auto_137064 ) ) ( not ( = ?auto_137059 ?auto_137065 ) ) ( not ( = ?auto_137059 ?auto_137066 ) ) ( not ( = ?auto_137059 ?auto_137067 ) ) ( not ( = ?auto_137059 ?auto_137068 ) ) ( not ( = ?auto_137060 ?auto_137061 ) ) ( not ( = ?auto_137060 ?auto_137062 ) ) ( not ( = ?auto_137060 ?auto_137063 ) ) ( not ( = ?auto_137060 ?auto_137064 ) ) ( not ( = ?auto_137060 ?auto_137065 ) ) ( not ( = ?auto_137060 ?auto_137066 ) ) ( not ( = ?auto_137060 ?auto_137067 ) ) ( not ( = ?auto_137060 ?auto_137068 ) ) ( not ( = ?auto_137061 ?auto_137062 ) ) ( not ( = ?auto_137061 ?auto_137063 ) ) ( not ( = ?auto_137061 ?auto_137064 ) ) ( not ( = ?auto_137061 ?auto_137065 ) ) ( not ( = ?auto_137061 ?auto_137066 ) ) ( not ( = ?auto_137061 ?auto_137067 ) ) ( not ( = ?auto_137061 ?auto_137068 ) ) ( not ( = ?auto_137062 ?auto_137063 ) ) ( not ( = ?auto_137062 ?auto_137064 ) ) ( not ( = ?auto_137062 ?auto_137065 ) ) ( not ( = ?auto_137062 ?auto_137066 ) ) ( not ( = ?auto_137062 ?auto_137067 ) ) ( not ( = ?auto_137062 ?auto_137068 ) ) ( not ( = ?auto_137063 ?auto_137064 ) ) ( not ( = ?auto_137063 ?auto_137065 ) ) ( not ( = ?auto_137063 ?auto_137066 ) ) ( not ( = ?auto_137063 ?auto_137067 ) ) ( not ( = ?auto_137063 ?auto_137068 ) ) ( not ( = ?auto_137064 ?auto_137065 ) ) ( not ( = ?auto_137064 ?auto_137066 ) ) ( not ( = ?auto_137064 ?auto_137067 ) ) ( not ( = ?auto_137064 ?auto_137068 ) ) ( not ( = ?auto_137065 ?auto_137066 ) ) ( not ( = ?auto_137065 ?auto_137067 ) ) ( not ( = ?auto_137065 ?auto_137068 ) ) ( not ( = ?auto_137066 ?auto_137067 ) ) ( not ( = ?auto_137066 ?auto_137068 ) ) ( not ( = ?auto_137067 ?auto_137068 ) ) ( ON ?auto_137067 ?auto_137068 ) ( ON ?auto_137066 ?auto_137067 ) ( ON ?auto_137065 ?auto_137066 ) ( ON ?auto_137064 ?auto_137065 ) ( ON ?auto_137063 ?auto_137064 ) ( ON ?auto_137062 ?auto_137063 ) ( ON ?auto_137061 ?auto_137062 ) ( ON ?auto_137060 ?auto_137061 ) ( ON ?auto_137059 ?auto_137060 ) ( ON ?auto_137058 ?auto_137059 ) ( CLEAR ?auto_137058 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_137058 )
      ( MAKE-11PILE ?auto_137058 ?auto_137059 ?auto_137060 ?auto_137061 ?auto_137062 ?auto_137063 ?auto_137064 ?auto_137065 ?auto_137066 ?auto_137067 ?auto_137068 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_137080 - BLOCK
      ?auto_137081 - BLOCK
      ?auto_137082 - BLOCK
      ?auto_137083 - BLOCK
      ?auto_137084 - BLOCK
      ?auto_137085 - BLOCK
      ?auto_137086 - BLOCK
      ?auto_137087 - BLOCK
      ?auto_137088 - BLOCK
      ?auto_137089 - BLOCK
      ?auto_137090 - BLOCK
    )
    :vars
    (
      ?auto_137091 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_137080 ?auto_137081 ) ) ( not ( = ?auto_137080 ?auto_137082 ) ) ( not ( = ?auto_137080 ?auto_137083 ) ) ( not ( = ?auto_137080 ?auto_137084 ) ) ( not ( = ?auto_137080 ?auto_137085 ) ) ( not ( = ?auto_137080 ?auto_137086 ) ) ( not ( = ?auto_137080 ?auto_137087 ) ) ( not ( = ?auto_137080 ?auto_137088 ) ) ( not ( = ?auto_137080 ?auto_137089 ) ) ( not ( = ?auto_137080 ?auto_137090 ) ) ( not ( = ?auto_137081 ?auto_137082 ) ) ( not ( = ?auto_137081 ?auto_137083 ) ) ( not ( = ?auto_137081 ?auto_137084 ) ) ( not ( = ?auto_137081 ?auto_137085 ) ) ( not ( = ?auto_137081 ?auto_137086 ) ) ( not ( = ?auto_137081 ?auto_137087 ) ) ( not ( = ?auto_137081 ?auto_137088 ) ) ( not ( = ?auto_137081 ?auto_137089 ) ) ( not ( = ?auto_137081 ?auto_137090 ) ) ( not ( = ?auto_137082 ?auto_137083 ) ) ( not ( = ?auto_137082 ?auto_137084 ) ) ( not ( = ?auto_137082 ?auto_137085 ) ) ( not ( = ?auto_137082 ?auto_137086 ) ) ( not ( = ?auto_137082 ?auto_137087 ) ) ( not ( = ?auto_137082 ?auto_137088 ) ) ( not ( = ?auto_137082 ?auto_137089 ) ) ( not ( = ?auto_137082 ?auto_137090 ) ) ( not ( = ?auto_137083 ?auto_137084 ) ) ( not ( = ?auto_137083 ?auto_137085 ) ) ( not ( = ?auto_137083 ?auto_137086 ) ) ( not ( = ?auto_137083 ?auto_137087 ) ) ( not ( = ?auto_137083 ?auto_137088 ) ) ( not ( = ?auto_137083 ?auto_137089 ) ) ( not ( = ?auto_137083 ?auto_137090 ) ) ( not ( = ?auto_137084 ?auto_137085 ) ) ( not ( = ?auto_137084 ?auto_137086 ) ) ( not ( = ?auto_137084 ?auto_137087 ) ) ( not ( = ?auto_137084 ?auto_137088 ) ) ( not ( = ?auto_137084 ?auto_137089 ) ) ( not ( = ?auto_137084 ?auto_137090 ) ) ( not ( = ?auto_137085 ?auto_137086 ) ) ( not ( = ?auto_137085 ?auto_137087 ) ) ( not ( = ?auto_137085 ?auto_137088 ) ) ( not ( = ?auto_137085 ?auto_137089 ) ) ( not ( = ?auto_137085 ?auto_137090 ) ) ( not ( = ?auto_137086 ?auto_137087 ) ) ( not ( = ?auto_137086 ?auto_137088 ) ) ( not ( = ?auto_137086 ?auto_137089 ) ) ( not ( = ?auto_137086 ?auto_137090 ) ) ( not ( = ?auto_137087 ?auto_137088 ) ) ( not ( = ?auto_137087 ?auto_137089 ) ) ( not ( = ?auto_137087 ?auto_137090 ) ) ( not ( = ?auto_137088 ?auto_137089 ) ) ( not ( = ?auto_137088 ?auto_137090 ) ) ( not ( = ?auto_137089 ?auto_137090 ) ) ( ON ?auto_137080 ?auto_137091 ) ( not ( = ?auto_137090 ?auto_137091 ) ) ( not ( = ?auto_137089 ?auto_137091 ) ) ( not ( = ?auto_137088 ?auto_137091 ) ) ( not ( = ?auto_137087 ?auto_137091 ) ) ( not ( = ?auto_137086 ?auto_137091 ) ) ( not ( = ?auto_137085 ?auto_137091 ) ) ( not ( = ?auto_137084 ?auto_137091 ) ) ( not ( = ?auto_137083 ?auto_137091 ) ) ( not ( = ?auto_137082 ?auto_137091 ) ) ( not ( = ?auto_137081 ?auto_137091 ) ) ( not ( = ?auto_137080 ?auto_137091 ) ) ( ON ?auto_137081 ?auto_137080 ) ( ON ?auto_137082 ?auto_137081 ) ( ON ?auto_137083 ?auto_137082 ) ( ON ?auto_137084 ?auto_137083 ) ( ON ?auto_137085 ?auto_137084 ) ( ON ?auto_137086 ?auto_137085 ) ( ON ?auto_137087 ?auto_137086 ) ( ON ?auto_137088 ?auto_137087 ) ( ON ?auto_137089 ?auto_137088 ) ( ON ?auto_137090 ?auto_137089 ) ( CLEAR ?auto_137090 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_137090 ?auto_137089 ?auto_137088 ?auto_137087 ?auto_137086 ?auto_137085 ?auto_137084 ?auto_137083 ?auto_137082 ?auto_137081 ?auto_137080 )
      ( MAKE-11PILE ?auto_137080 ?auto_137081 ?auto_137082 ?auto_137083 ?auto_137084 ?auto_137085 ?auto_137086 ?auto_137087 ?auto_137088 ?auto_137089 ?auto_137090 ) )
  )

)

