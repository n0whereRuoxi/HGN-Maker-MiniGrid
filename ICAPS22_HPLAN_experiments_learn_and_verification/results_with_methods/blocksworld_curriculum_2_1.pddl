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
      ?auto_30 - BLOCK
    )
    :vars
    (
      ?auto_31 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_30 ?auto_31 ) ( CLEAR ?auto_30 ) ( HAND-EMPTY ) ( not ( = ?auto_30 ?auto_31 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_30 ?auto_31 )
      ( !PUTDOWN ?auto_30 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_33 - BLOCK
    )
    :vars
    (
      ?auto_34 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33 ?auto_34 ) ( CLEAR ?auto_33 ) ( HAND-EMPTY ) ( not ( = ?auto_33 ?auto_34 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_33 ?auto_34 )
      ( !PUTDOWN ?auto_33 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_37 - BLOCK
      ?auto_38 - BLOCK
    )
    :vars
    (
      ?auto_39 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_37 ) ( ON ?auto_38 ?auto_39 ) ( CLEAR ?auto_38 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_37 ) ( not ( = ?auto_37 ?auto_38 ) ) ( not ( = ?auto_37 ?auto_39 ) ) ( not ( = ?auto_38 ?auto_39 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_38 ?auto_39 )
      ( !STACK ?auto_38 ?auto_37 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_42 - BLOCK
      ?auto_43 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_42 ) ( ON-TABLE ?auto_43 ) ( CLEAR ?auto_43 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_42 ) ( not ( = ?auto_42 ?auto_43 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_43 )
      ( !STACK ?auto_43 ?auto_42 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_46 - BLOCK
      ?auto_47 - BLOCK
    )
    :vars
    (
      ?auto_48 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47 ?auto_48 ) ( not ( = ?auto_46 ?auto_47 ) ) ( not ( = ?auto_46 ?auto_48 ) ) ( not ( = ?auto_47 ?auto_48 ) ) ( ON ?auto_46 ?auto_47 ) ( CLEAR ?auto_46 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_46 )
      ( MAKE-2PILE ?auto_46 ?auto_47 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_51 - BLOCK
      ?auto_52 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_52 ) ( not ( = ?auto_51 ?auto_52 ) ) ( ON ?auto_51 ?auto_52 ) ( CLEAR ?auto_51 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_51 )
      ( MAKE-2PILE ?auto_51 ?auto_52 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_55 - BLOCK
      ?auto_56 - BLOCK
    )
    :vars
    (
      ?auto_57 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_55 ?auto_56 ) ) ( ON ?auto_55 ?auto_57 ) ( not ( = ?auto_56 ?auto_57 ) ) ( not ( = ?auto_55 ?auto_57 ) ) ( ON ?auto_56 ?auto_55 ) ( CLEAR ?auto_56 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_56 ?auto_55 )
      ( MAKE-2PILE ?auto_55 ?auto_56 ) )
  )

)

