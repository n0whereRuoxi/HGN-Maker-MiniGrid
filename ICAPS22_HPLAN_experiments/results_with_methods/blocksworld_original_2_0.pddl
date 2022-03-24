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
      ?auto_32 - BLOCK
    )
    :vars
    (
      ?auto_33 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_33 ?auto_32 ) ( CLEAR ?auto_33 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_32 ) ( not ( = ?auto_32 ?auto_33 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_33 ?auto_32 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_39 - BLOCK
    )
    :vars
    (
      ?auto_40 - BLOCK
      ?auto_41 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_39 ?auto_40 ) ) ( ON ?auto_40 ?auto_41 ) ( CLEAR ?auto_40 ) ( not ( = ?auto_39 ?auto_41 ) ) ( not ( = ?auto_40 ?auto_41 ) ) ( HOLDING ?auto_39 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_39 ?auto_40 )
      ( MAKE-1PILE ?auto_39 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_42 - BLOCK
    )
    :vars
    (
      ?auto_44 - BLOCK
      ?auto_43 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_42 ?auto_44 ) ) ( ON ?auto_44 ?auto_43 ) ( not ( = ?auto_42 ?auto_43 ) ) ( not ( = ?auto_44 ?auto_43 ) ) ( ON ?auto_42 ?auto_44 ) ( CLEAR ?auto_42 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_43 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_43 ?auto_44 )
      ( MAKE-1PILE ?auto_42 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_46 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_46 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_46 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_47 - BLOCK
    )
    :vars
    (
      ?auto_48 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_47 ?auto_48 ) ( CLEAR ?auto_47 ) ( HAND-EMPTY ) ( not ( = ?auto_47 ?auto_48 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_47 ?auto_48 )
      ( MAKE-1PILE ?auto_47 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_49 - BLOCK
    )
    :vars
    (
      ?auto_50 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_49 ?auto_50 ) ) ( HOLDING ?auto_49 ) ( CLEAR ?auto_50 ) ( ON-TABLE ?auto_50 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_50 ?auto_49 )
      ( MAKE-1PILE ?auto_49 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_51 - BLOCK
    )
    :vars
    (
      ?auto_52 - BLOCK
      ?auto_53 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_51 ?auto_52 ) ) ( CLEAR ?auto_52 ) ( ON-TABLE ?auto_52 ) ( ON ?auto_51 ?auto_53 ) ( CLEAR ?auto_51 ) ( HAND-EMPTY ) ( not ( = ?auto_51 ?auto_53 ) ) ( not ( = ?auto_52 ?auto_53 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_51 ?auto_53 )
      ( MAKE-1PILE ?auto_51 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_54 - BLOCK
    )
    :vars
    (
      ?auto_56 - BLOCK
      ?auto_55 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_54 ?auto_56 ) ) ( ON ?auto_54 ?auto_55 ) ( CLEAR ?auto_54 ) ( not ( = ?auto_54 ?auto_55 ) ) ( not ( = ?auto_56 ?auto_55 ) ) ( HOLDING ?auto_56 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_56 )
      ( MAKE-1PILE ?auto_54 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_57 - BLOCK
    )
    :vars
    (
      ?auto_59 - BLOCK
      ?auto_58 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_57 ?auto_59 ) ) ( ON ?auto_57 ?auto_58 ) ( not ( = ?auto_57 ?auto_58 ) ) ( not ( = ?auto_59 ?auto_58 ) ) ( ON ?auto_59 ?auto_57 ) ( CLEAR ?auto_59 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_58 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_58 ?auto_57 )
      ( MAKE-1PILE ?auto_57 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_62 - BLOCK
      ?auto_63 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_63 ) ( CLEAR ?auto_62 ) ( ON-TABLE ?auto_62 ) ( not ( = ?auto_62 ?auto_63 ) ) )
    :subtasks
    ( ( !STACK ?auto_63 ?auto_62 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_64 - BLOCK
      ?auto_65 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_64 ) ( ON-TABLE ?auto_64 ) ( not ( = ?auto_64 ?auto_65 ) ) ( ON-TABLE ?auto_65 ) ( CLEAR ?auto_65 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_65 )
      ( MAKE-2PILE ?auto_64 ?auto_65 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_66 - BLOCK
      ?auto_67 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_66 ?auto_67 ) ) ( ON-TABLE ?auto_67 ) ( CLEAR ?auto_67 ) ( HOLDING ?auto_66 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_66 )
      ( MAKE-2PILE ?auto_66 ?auto_67 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_68 - BLOCK
      ?auto_69 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_68 ?auto_69 ) ) ( ON-TABLE ?auto_69 ) ( ON ?auto_68 ?auto_69 ) ( CLEAR ?auto_68 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_69 )
      ( MAKE-2PILE ?auto_68 ?auto_69 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_70 - BLOCK
      ?auto_71 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_70 ?auto_71 ) ) ( ON-TABLE ?auto_71 ) ( HOLDING ?auto_70 ) ( CLEAR ?auto_71 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_71 ?auto_70 )
      ( MAKE-2PILE ?auto_70 ?auto_71 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_72 - BLOCK
      ?auto_73 - BLOCK
    )
    :vars
    (
      ?auto_74 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_72 ?auto_73 ) ) ( ON-TABLE ?auto_73 ) ( CLEAR ?auto_73 ) ( ON ?auto_72 ?auto_74 ) ( CLEAR ?auto_72 ) ( HAND-EMPTY ) ( not ( = ?auto_72 ?auto_74 ) ) ( not ( = ?auto_73 ?auto_74 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_72 ?auto_74 )
      ( MAKE-2PILE ?auto_72 ?auto_73 ) )
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
    ( and ( not ( = ?auto_75 ?auto_76 ) ) ( ON ?auto_75 ?auto_77 ) ( CLEAR ?auto_75 ) ( not ( = ?auto_75 ?auto_77 ) ) ( not ( = ?auto_76 ?auto_77 ) ) ( HOLDING ?auto_76 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_76 )
      ( MAKE-2PILE ?auto_75 ?auto_76 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_78 - BLOCK
      ?auto_79 - BLOCK
    )
    :vars
    (
      ?auto_80 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_78 ?auto_79 ) ) ( ON ?auto_78 ?auto_80 ) ( not ( = ?auto_78 ?auto_80 ) ) ( not ( = ?auto_79 ?auto_80 ) ) ( ON ?auto_79 ?auto_78 ) ( CLEAR ?auto_79 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_80 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_80 ?auto_78 )
      ( MAKE-2PILE ?auto_78 ?auto_79 ) )
  )

)

