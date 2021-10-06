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

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?auto_1 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_1 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_1 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?auto_3 - BLOCK
    )
    :vars
    (
      ?auto_6 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3 ?auto_6 ) ( CLEAR ?auto_3 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?auto_3 ?auto_6 )
      ( MAKE-ON-TABLE ?auto_3 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?auto_14 - BLOCK
    )
    :vars
    (
      ?auto_15 - BLOCK
      ?auto_17 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_14 ?auto_15 ) ( CLEAR ?auto_14 ) ( HOLDING ?auto_17 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_17 )
      ( MAKE-ON-TABLE ?auto_14 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?auto_18 - BLOCK
    )
    :vars
    (
      ?auto_19 - BLOCK
      ?auto_21 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_18 ?auto_19 ) ( ON ?auto_21 ?auto_18 ) ( CLEAR ?auto_21 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?auto_21 ?auto_18 )
      ( MAKE-ON-TABLE ?auto_18 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_26 - BLOCK
      ?auto_27 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_26 ) ( CLEAR ?auto_27 ) )
    :subtasks
    ( ( !STACK ?auto_26 ?auto_27 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_30 - BLOCK
      ?auto_31 - BLOCK
    )
    :vars
    (
      ?auto_35 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_31 ) ( ON ?auto_30 ?auto_35 ) ( CLEAR ?auto_30 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?auto_30 ?auto_35 )
      ( MAKE-ON ?auto_30 ?auto_31 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_36 - BLOCK
      ?auto_37 - BLOCK
    )
    :vars
    (
      ?auto_38 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_36 ?auto_38 ) ( CLEAR ?auto_36 ) ( HOLDING ?auto_37 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_37 )
      ( MAKE-ON ?auto_36 ?auto_37 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_42 - BLOCK
      ?auto_43 - BLOCK
    )
    :vars
    (
      ?auto_44 - BLOCK
      ?auto_48 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_42 ?auto_44 ) ( CLEAR ?auto_42 ) ( ON ?auto_43 ?auto_48 ) ( CLEAR ?auto_43 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?auto_43 ?auto_48 )
      ( MAKE-ON ?auto_42 ?auto_43 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_49 - BLOCK
      ?auto_50 - BLOCK
    )
    :vars
    (
      ?auto_51 - BLOCK
      ?auto_52 - BLOCK
      ?auto_55 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_49 ?auto_51 ) ( CLEAR ?auto_49 ) ( ON ?auto_50 ?auto_52 ) ( CLEAR ?auto_50 ) ( HOLDING ?auto_55 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_55 )
      ( MAKE-ON ?auto_49 ?auto_50 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_56 - BLOCK
      ?auto_57 - BLOCK
    )
    :vars
    (
      ?auto_58 - BLOCK
      ?auto_59 - BLOCK
      ?auto_60 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_56 ?auto_58 ) ( CLEAR ?auto_56 ) ( ON ?auto_57 ?auto_59 ) ( ON ?auto_60 ?auto_57 ) ( CLEAR ?auto_60 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?auto_60 ?auto_57 )
      ( MAKE-ON ?auto_56 ?auto_57 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_71 - BLOCK
      ?auto_72 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_72 ) ( ON-TABLE ?auto_71 ) ( CLEAR ?auto_71 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_71 )
      ( MAKE-ON ?auto_71 ?auto_72 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_76 - BLOCK
      ?auto_77 - BLOCK
    )
    :vars
    (
      ?auto_80 - BLOCK
      ?auto_81 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_77 ) ( ON-TABLE ?auto_76 ) ( CLEAR ?auto_76 ) ( HOLDING ?auto_80 ) ( CLEAR ?auto_81 ) )
    :subtasks
    ( ( !STACK ?auto_80 ?auto_81 )
      ( MAKE-ON ?auto_76 ?auto_77 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_97 - BLOCK
      ?auto_98 - BLOCK
    )
    :vars
    (
      ?auto_100 - BLOCK
      ?auto_99 - BLOCK
      ?auto_104 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_97 ) ( CLEAR ?auto_97 ) ( ON ?auto_100 ?auto_98 ) ( CLEAR ?auto_100 ) ( ON ?auto_99 ?auto_104 ) ( CLEAR ?auto_99 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?auto_99 ?auto_104 )
      ( MAKE-ON ?auto_97 ?auto_98 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_90 - BLOCK
      ?auto_91 - BLOCK
    )
    :vars
    (
      ?auto_92 - BLOCK
      ?auto_93 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_90 ) ( CLEAR ?auto_90 ) ( ON ?auto_92 ?auto_91 ) ( CLEAR ?auto_92 ) ( HOLDING ?auto_93 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_93 )
      ( MAKE-ON ?auto_90 ?auto_91 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_105 - BLOCK
      ?auto_106 - BLOCK
    )
    :vars
    (
      ?auto_111 - BLOCK
      ?auto_108 - BLOCK
      ?auto_107 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_111 ?auto_106 ) ( CLEAR ?auto_111 ) ( ON ?auto_108 ?auto_107 ) ( CLEAR ?auto_108 ) ( HOLDING ?auto_105 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_105 )
      ( MAKE-ON ?auto_105 ?auto_106 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?auto_113 - BLOCK
      ?auto_114 - BLOCK
    )
    :vars
    (
      ?auto_117 - BLOCK
      ?auto_115 - BLOCK
      ?auto_116 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_117 ?auto_114 ) ( CLEAR ?auto_117 ) ( ON ?auto_115 ?auto_116 ) ( ON ?auto_113 ?auto_115 ) ( CLEAR ?auto_113 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?auto_113 ?auto_115 )
      ( MAKE-ON ?auto_113 ?auto_114 ) )
  )

)