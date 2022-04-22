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
      ?auto_88 - BLOCK
    )
    :vars
    (
      ?auto_89 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_88 ?auto_89 ) ( CLEAR ?auto_88 ) ( HAND-EMPTY ) ( not ( = ?auto_88 ?auto_89 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_88 ?auto_89 )
      ( !PUTDOWN ?auto_88 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_95 - BLOCK
      ?auto_96 - BLOCK
    )
    :vars
    (
      ?auto_97 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_95 ) ( ON ?auto_96 ?auto_97 ) ( CLEAR ?auto_96 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_95 ) ( not ( = ?auto_95 ?auto_96 ) ) ( not ( = ?auto_95 ?auto_97 ) ) ( not ( = ?auto_96 ?auto_97 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_96 ?auto_97 )
      ( !STACK ?auto_96 ?auto_95 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_100 - BLOCK
      ?auto_101 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_100 ) ( ON-TABLE ?auto_101 ) ( CLEAR ?auto_101 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_100 ) ( not ( = ?auto_100 ?auto_101 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_101 )
      ( !STACK ?auto_101 ?auto_100 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_104 - BLOCK
      ?auto_105 - BLOCK
    )
    :vars
    (
      ?auto_106 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_105 ?auto_106 ) ( not ( = ?auto_104 ?auto_105 ) ) ( not ( = ?auto_104 ?auto_106 ) ) ( not ( = ?auto_105 ?auto_106 ) ) ( ON ?auto_104 ?auto_105 ) ( CLEAR ?auto_104 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_104 )
      ( MAKE-2PILE ?auto_104 ?auto_105 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_109 - BLOCK
      ?auto_110 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_110 ) ( not ( = ?auto_109 ?auto_110 ) ) ( ON ?auto_109 ?auto_110 ) ( CLEAR ?auto_109 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_109 )
      ( MAKE-2PILE ?auto_109 ?auto_110 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_113 - BLOCK
      ?auto_114 - BLOCK
    )
    :vars
    (
      ?auto_115 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_113 ?auto_114 ) ) ( ON ?auto_113 ?auto_115 ) ( not ( = ?auto_114 ?auto_115 ) ) ( not ( = ?auto_113 ?auto_115 ) ) ( ON ?auto_114 ?auto_113 ) ( CLEAR ?auto_114 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_114 ?auto_113 )
      ( MAKE-2PILE ?auto_113 ?auto_114 ) )
  )

)

