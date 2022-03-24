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
      ?auto_1 - BLOCK
    )
    :vars
    (
      ?auto_2 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_1 ?auto_2 ) ( CLEAR ?auto_1 ) ( HAND-EMPTY ) ( not ( = ?auto_1 ?auto_2 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_1 ?auto_2 )
      ( !PUTDOWN ?auto_1 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_4 - BLOCK
    )
    :vars
    (
      ?auto_5 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4 ?auto_5 ) ( CLEAR ?auto_4 ) ( HAND-EMPTY ) ( not ( = ?auto_4 ?auto_5 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4 ?auto_5 )
      ( !PUTDOWN ?auto_4 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_8 - BLOCK
      ?auto_9 - BLOCK
    )
    :vars
    (
      ?auto_10 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_8 ) ( ON ?auto_9 ?auto_10 ) ( CLEAR ?auto_9 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_8 ) ( not ( = ?auto_8 ?auto_9 ) ) ( not ( = ?auto_8 ?auto_10 ) ) ( not ( = ?auto_9 ?auto_10 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_9 ?auto_10 )
      ( !STACK ?auto_9 ?auto_8 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_13 - BLOCK
      ?auto_14 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_13 ) ( ON-TABLE ?auto_14 ) ( CLEAR ?auto_14 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_13 ) ( not ( = ?auto_13 ?auto_14 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_14 )
      ( !STACK ?auto_14 ?auto_13 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_17 - BLOCK
      ?auto_18 - BLOCK
    )
    :vars
    (
      ?auto_19 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18 ?auto_19 ) ( not ( = ?auto_17 ?auto_18 ) ) ( not ( = ?auto_17 ?auto_19 ) ) ( not ( = ?auto_18 ?auto_19 ) ) ( ON ?auto_17 ?auto_18 ) ( CLEAR ?auto_17 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_17 )
      ( MAKE-2PILE ?auto_17 ?auto_18 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_22 - BLOCK
      ?auto_23 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_23 ) ( not ( = ?auto_22 ?auto_23 ) ) ( ON ?auto_22 ?auto_23 ) ( CLEAR ?auto_22 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_22 )
      ( MAKE-2PILE ?auto_22 ?auto_23 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_26 - BLOCK
      ?auto_27 - BLOCK
    )
    :vars
    (
      ?auto_28 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_26 ?auto_27 ) ) ( ON ?auto_26 ?auto_28 ) ( not ( = ?auto_27 ?auto_28 ) ) ( not ( = ?auto_26 ?auto_28 ) ) ( ON ?auto_27 ?auto_26 ) ( CLEAR ?auto_27 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_27 ?auto_26 )
      ( MAKE-2PILE ?auto_26 ?auto_27 ) )
  )

)

