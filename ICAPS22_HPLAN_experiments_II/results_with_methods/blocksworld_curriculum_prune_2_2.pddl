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
      ?auto_59 - BLOCK
    )
    :vars
    (
      ?auto_60 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_59 ?auto_60 ) ( CLEAR ?auto_59 ) ( HAND-EMPTY ) ( not ( = ?auto_59 ?auto_60 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_59 ?auto_60 )
      ( !PUTDOWN ?auto_59 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_66 - BLOCK
      ?auto_67 - BLOCK
    )
    :vars
    (
      ?auto_68 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_66 ) ( ON ?auto_67 ?auto_68 ) ( CLEAR ?auto_67 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_66 ) ( not ( = ?auto_66 ?auto_67 ) ) ( not ( = ?auto_66 ?auto_68 ) ) ( not ( = ?auto_67 ?auto_68 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_67 ?auto_68 )
      ( !STACK ?auto_67 ?auto_66 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_71 - BLOCK
      ?auto_72 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_71 ) ( ON-TABLE ?auto_72 ) ( CLEAR ?auto_72 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_71 ) ( not ( = ?auto_71 ?auto_72 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_72 )
      ( !STACK ?auto_72 ?auto_71 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_75 - BLOCK
      ?auto_76 - BLOCK
    )
    :vars
    (
      ?auto_77 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_76 ?auto_77 ) ( not ( = ?auto_75 ?auto_76 ) ) ( not ( = ?auto_75 ?auto_77 ) ) ( not ( = ?auto_76 ?auto_77 ) ) ( ON ?auto_75 ?auto_76 ) ( CLEAR ?auto_75 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_75 )
      ( MAKE-2PILE ?auto_75 ?auto_76 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_80 - BLOCK
      ?auto_81 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_81 ) ( not ( = ?auto_80 ?auto_81 ) ) ( ON ?auto_80 ?auto_81 ) ( CLEAR ?auto_80 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_80 )
      ( MAKE-2PILE ?auto_80 ?auto_81 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_84 - BLOCK
      ?auto_85 - BLOCK
    )
    :vars
    (
      ?auto_86 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_84 ?auto_85 ) ) ( ON ?auto_84 ?auto_86 ) ( not ( = ?auto_85 ?auto_86 ) ) ( not ( = ?auto_84 ?auto_86 ) ) ( ON ?auto_85 ?auto_84 ) ( CLEAR ?auto_85 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_85 ?auto_84 )
      ( MAKE-2PILE ?auto_84 ?auto_85 ) )
  )

)

