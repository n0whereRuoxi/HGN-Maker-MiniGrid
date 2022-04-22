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

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_2 - BLOCK
      ?auto_3 - BLOCK
    )
    :vars
    (
      ?auto_4 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_4 ?auto_3 ) ( CLEAR ?auto_4 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_2 ) ( ON ?auto_3 ?auto_2 ) ( not ( = ?auto_2 ?auto_3 ) ) ( not ( = ?auto_2 ?auto_4 ) ) ( not ( = ?auto_3 ?auto_4 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_4 ?auto_3 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_6 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_6 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_6 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_7 - BLOCK
    )
    :vars
    (
      ?auto_8 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_7 ?auto_8 ) ( CLEAR ?auto_7 ) ( HAND-EMPTY ) ( not ( = ?auto_7 ?auto_8 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_7 ?auto_8 )
      ( MAKE-1PILE ?auto_7 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_10 - BLOCK
    )
    :vars
    (
      ?auto_11 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_11 ?auto_10 ) ( CLEAR ?auto_11 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_10 ) ( not ( = ?auto_10 ?auto_11 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_11 ?auto_10 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_12 - BLOCK
    )
    :vars
    (
      ?auto_13 - BLOCK
      ?auto_14 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_13 ?auto_12 ) ( CLEAR ?auto_13 ) ( ON-TABLE ?auto_12 ) ( not ( = ?auto_12 ?auto_13 ) ) ( HOLDING ?auto_14 ) ( not ( = ?auto_12 ?auto_14 ) ) ( not ( = ?auto_13 ?auto_14 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_14 )
      ( MAKE-1PILE ?auto_12 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_15 - BLOCK
    )
    :vars
    (
      ?auto_17 - BLOCK
      ?auto_16 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_17 ?auto_15 ) ( ON-TABLE ?auto_15 ) ( not ( = ?auto_15 ?auto_17 ) ) ( not ( = ?auto_15 ?auto_16 ) ) ( not ( = ?auto_17 ?auto_16 ) ) ( ON ?auto_16 ?auto_17 ) ( CLEAR ?auto_16 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_15 ?auto_17 )
      ( MAKE-1PILE ?auto_15 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_20 - BLOCK
      ?auto_21 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_21 ) ( CLEAR ?auto_20 ) ( ON-TABLE ?auto_20 ) ( not ( = ?auto_20 ?auto_21 ) ) )
    :subtasks
    ( ( !STACK ?auto_21 ?auto_20 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_22 - BLOCK
      ?auto_23 - BLOCK
    )
    :vars
    (
      ?auto_24 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_22 ) ( ON-TABLE ?auto_22 ) ( not ( = ?auto_22 ?auto_23 ) ) ( ON ?auto_23 ?auto_24 ) ( CLEAR ?auto_23 ) ( HAND-EMPTY ) ( not ( = ?auto_22 ?auto_24 ) ) ( not ( = ?auto_23 ?auto_24 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_23 ?auto_24 )
      ( MAKE-2PILE ?auto_22 ?auto_23 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_25 - BLOCK
      ?auto_26 - BLOCK
    )
    :vars
    (
      ?auto_27 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_25 ?auto_26 ) ) ( ON ?auto_26 ?auto_27 ) ( CLEAR ?auto_26 ) ( not ( = ?auto_25 ?auto_27 ) ) ( not ( = ?auto_26 ?auto_27 ) ) ( HOLDING ?auto_25 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_25 )
      ( MAKE-2PILE ?auto_25 ?auto_26 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_28 - BLOCK
      ?auto_29 - BLOCK
    )
    :vars
    (
      ?auto_30 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_28 ?auto_29 ) ) ( ON ?auto_29 ?auto_30 ) ( not ( = ?auto_28 ?auto_30 ) ) ( not ( = ?auto_29 ?auto_30 ) ) ( ON ?auto_28 ?auto_29 ) ( CLEAR ?auto_28 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_30 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_30 ?auto_29 )
      ( MAKE-2PILE ?auto_28 ?auto_29 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_47 - BLOCK
    )
    :vars
    (
      ?auto_48 - BLOCK
      ?auto_49 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47 ?auto_48 ) ( CLEAR ?auto_47 ) ( not ( = ?auto_47 ?auto_48 ) ) ( HOLDING ?auto_49 ) ( not ( = ?auto_47 ?auto_49 ) ) ( not ( = ?auto_48 ?auto_49 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_49 )
      ( MAKE-1PILE ?auto_47 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_50 - BLOCK
    )
    :vars
    (
      ?auto_52 - BLOCK
      ?auto_51 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50 ?auto_52 ) ( not ( = ?auto_50 ?auto_52 ) ) ( not ( = ?auto_50 ?auto_51 ) ) ( not ( = ?auto_52 ?auto_51 ) ) ( ON ?auto_51 ?auto_50 ) ( CLEAR ?auto_51 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_52 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_52 ?auto_50 )
      ( MAKE-1PILE ?auto_50 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_57 - BLOCK
      ?auto_58 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_57 ) ( ON-TABLE ?auto_57 ) ( not ( = ?auto_57 ?auto_58 ) ) ( ON-TABLE ?auto_58 ) ( CLEAR ?auto_58 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_58 )
      ( MAKE-2PILE ?auto_57 ?auto_58 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_59 - BLOCK
      ?auto_60 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_59 ?auto_60 ) ) ( ON-TABLE ?auto_60 ) ( CLEAR ?auto_60 ) ( HOLDING ?auto_59 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_59 )
      ( MAKE-2PILE ?auto_59 ?auto_60 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_61 - BLOCK
      ?auto_62 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_61 ?auto_62 ) ) ( ON-TABLE ?auto_62 ) ( ON ?auto_61 ?auto_62 ) ( CLEAR ?auto_61 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_62 )
      ( MAKE-2PILE ?auto_61 ?auto_62 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_65 - BLOCK
      ?auto_66 - BLOCK
    )
    :vars
    (
      ?auto_67 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_65 ?auto_66 ) ) ( ON-TABLE ?auto_66 ) ( CLEAR ?auto_66 ) ( ON ?auto_65 ?auto_67 ) ( CLEAR ?auto_65 ) ( HAND-EMPTY ) ( not ( = ?auto_65 ?auto_67 ) ) ( not ( = ?auto_66 ?auto_67 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_65 ?auto_67 )
      ( MAKE-2PILE ?auto_65 ?auto_66 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_68 - BLOCK
      ?auto_69 - BLOCK
    )
    :vars
    (
      ?auto_70 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_68 ?auto_69 ) ) ( ON ?auto_68 ?auto_70 ) ( CLEAR ?auto_68 ) ( not ( = ?auto_68 ?auto_70 ) ) ( not ( = ?auto_69 ?auto_70 ) ) ( HOLDING ?auto_69 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_69 )
      ( MAKE-2PILE ?auto_68 ?auto_69 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_71 - BLOCK
      ?auto_72 - BLOCK
    )
    :vars
    (
      ?auto_73 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_71 ?auto_72 ) ) ( ON ?auto_71 ?auto_73 ) ( not ( = ?auto_71 ?auto_73 ) ) ( not ( = ?auto_72 ?auto_73 ) ) ( ON ?auto_72 ?auto_71 ) ( CLEAR ?auto_72 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_73 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_73 ?auto_71 )
      ( MAKE-2PILE ?auto_71 ?auto_72 ) )
  )

)

