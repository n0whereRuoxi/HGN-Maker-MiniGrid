( define ( domain Blocks4 )
  ( :requirements :strips :typing :equality :htn )
  ( :types block )
  ( :predicates
    ( ON-TABLE ?B - BLOCK )
    ( ON ?B1 - BLOCK ?B2 - BLOCK )
    ( CLEAR ?B - BLOCK )
    ( HAND-EMPTY )
    ( HOLDING ?B - BLOCK )
  )
  ( :action !PICKUP
    :parameters
    (
      ?B - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?B ) ( CLEAR ?B ) ( HAND-EMPTY ) )
    :effect
    ( and ( not ( ON-TABLE ?B ) ) ( not ( CLEAR ?B ) ) ( not ( HAND-EMPTY ) ) ( HOLDING ?B ) )
  )
  ( :action !PUTDOWN
    :parameters
    (
      ?B - BLOCK
    )
    :precondition
    ( and ( HOLDING ?B ) )
    :effect
    ( and ( not ( HOLDING ?B ) ) ( HAND-EMPTY ) ( ON-TABLE ?B ) ( CLEAR ?B ) )
  )
  ( :action !UNSTACK
    :parameters
    (
      ?B1 - BLOCK
      ?B2 - BLOCK
    )
    :precondition
    ( and ( ON ?B1 ?B2 ) ( CLEAR ?B1 ) ( HAND-EMPTY ) )
    :effect
    ( and ( not ( ON ?B1 ?B2 ) ) ( not ( CLEAR ?B1 ) ) ( not ( HAND-EMPTY ) ) ( CLEAR ?B2 ) ( HOLDING ?B1 ) )
  )
  ( :action !STACK
    :parameters
    (
      ?B1 - BLOCK
      ?B2 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?B1 ) ( CLEAR ?B2 ) )
    :effect
    ( and ( not ( HOLDING ?B1 ) ) ( not ( CLEAR ?B2 ) ) ( HAND-EMPTY ) ( ON ?B1 ?B2 ) ( CLEAR ?B1 ) )
  )
  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?GOAL - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?GOAL ) )
    :subtasks
    (  )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?TOP - BLOCK
      ?BOTTOM - BLOCK
    )
    :precondition
    ( and ( ON ?TOP ?BOTTOM ) )
    :subtasks
    (  )
  )

  ( :method MAKE-ON-TABLE-VERIFY
    :parameters
    (
      ?BLOCK - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?BLOCK ) )
    :subtasks
    (  )
  )

  ( :method MAKE-ON-VERIFY
    :parameters
    (
      ?B1 - BLOCK
      ?B2 - BLOCK
    )
    :precondition
    ( and ( ON ?B1 ?B2 ) )
    :subtasks
    (  )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2 - BLOCK
    )
    :vars
    (
      ?AUTO_3 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2 ?AUTO_3 ) ( CLEAR ?AUTO_2 ) ( HAND-EMPTY ) ( not ( = ?AUTO_2 ?AUTO_3 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2 ?AUTO_3 )
      ( MAKE-ON-TABLE ?AUTO_2 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6 - BLOCK
      ?AUTO_7 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6 ) ( CLEAR ?AUTO_7 ) ( not ( = ?AUTO_6 ?AUTO_7 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_6 ?AUTO_7 )
      ( MAKE-ON-VERIFY ?AUTO_6 ?AUTO_7 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8 - BLOCK
      ?AUTO_9 - BLOCK
    )
    :vars
    (
      ?AUTO_10 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_9 ) ( not ( = ?AUTO_8 ?AUTO_9 ) ) ( ON ?AUTO_8 ?AUTO_10 ) ( CLEAR ?AUTO_8 ) ( HAND-EMPTY ) ( not ( = ?AUTO_8 ?AUTO_10 ) ) ( not ( = ?AUTO_9 ?AUTO_10 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8 ?AUTO_10 )
      ( MAKE-ON ?AUTO_8 ?AUTO_9 )
      ( MAKE-ON-VERIFY ?AUTO_8 ?AUTO_9 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_11 - BLOCK
      ?AUTO_12 - BLOCK
    )
    :vars
    (
      ?AUTO_13 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_11 ?AUTO_12 ) ) ( ON ?AUTO_11 ?AUTO_13 ) ( CLEAR ?AUTO_11 ) ( not ( = ?AUTO_11 ?AUTO_13 ) ) ( not ( = ?AUTO_12 ?AUTO_13 ) ) ( HOLDING ?AUTO_12 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_12 )
      ( MAKE-ON ?AUTO_11 ?AUTO_12 )
      ( MAKE-ON-VERIFY ?AUTO_11 ?AUTO_12 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_18 - BLOCK
      ?AUTO_19 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_18 ) ( CLEAR ?AUTO_19 ) ( not ( = ?AUTO_18 ?AUTO_19 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_18 ?AUTO_19 )
      ( MAKE-ON-VERIFY ?AUTO_18 ?AUTO_19 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_20 - BLOCK
      ?AUTO_21 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_21 ) ( not ( = ?AUTO_20 ?AUTO_21 ) ) ( ON-TABLE ?AUTO_20 ) ( CLEAR ?AUTO_20 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_20 )
      ( MAKE-ON ?AUTO_20 ?AUTO_21 )
      ( MAKE-ON-VERIFY ?AUTO_20 ?AUTO_21 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_22 - BLOCK
      ?AUTO_23 - BLOCK
    )
    :vars
    (
      ?AUTO_24 - BLOCK
      ?AUTO_25 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_23 ) ( not ( = ?AUTO_22 ?AUTO_23 ) ) ( ON-TABLE ?AUTO_22 ) ( CLEAR ?AUTO_22 ) ( HOLDING ?AUTO_24 ) ( CLEAR ?AUTO_25 ) ( not ( = ?AUTO_22 ?AUTO_24 ) ) ( not ( = ?AUTO_22 ?AUTO_25 ) ) ( not ( = ?AUTO_23 ?AUTO_24 ) ) ( not ( = ?AUTO_23 ?AUTO_25 ) ) ( not ( = ?AUTO_24 ?AUTO_25 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_24 ?AUTO_25 )
      ( MAKE-ON ?AUTO_22 ?AUTO_23 )
      ( MAKE-ON-VERIFY ?AUTO_22 ?AUTO_23 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_26 - BLOCK
      ?AUTO_27 - BLOCK
    )
    :vars
    (
      ?AUTO_28 - BLOCK
      ?AUTO_29 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_26 ?AUTO_27 ) ) ( ON-TABLE ?AUTO_26 ) ( CLEAR ?AUTO_26 ) ( CLEAR ?AUTO_28 ) ( not ( = ?AUTO_26 ?AUTO_29 ) ) ( not ( = ?AUTO_26 ?AUTO_28 ) ) ( not ( = ?AUTO_27 ?AUTO_29 ) ) ( not ( = ?AUTO_27 ?AUTO_28 ) ) ( not ( = ?AUTO_29 ?AUTO_28 ) ) ( ON ?AUTO_29 ?AUTO_27 ) ( CLEAR ?AUTO_29 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_29 ?AUTO_27 )
      ( MAKE-ON ?AUTO_26 ?AUTO_27 )
      ( MAKE-ON-VERIFY ?AUTO_26 ?AUTO_27 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_30 - BLOCK
      ?AUTO_31 - BLOCK
    )
    :vars
    (
      ?AUTO_33 - BLOCK
      ?AUTO_32 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_30 ?AUTO_31 ) ) ( ON-TABLE ?AUTO_30 ) ( CLEAR ?AUTO_30 ) ( not ( = ?AUTO_30 ?AUTO_33 ) ) ( not ( = ?AUTO_30 ?AUTO_32 ) ) ( not ( = ?AUTO_31 ?AUTO_33 ) ) ( not ( = ?AUTO_31 ?AUTO_32 ) ) ( not ( = ?AUTO_33 ?AUTO_32 ) ) ( ON ?AUTO_33 ?AUTO_31 ) ( CLEAR ?AUTO_33 ) ( HOLDING ?AUTO_32 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_32 )
      ( MAKE-ON ?AUTO_30 ?AUTO_31 )
      ( MAKE-ON-VERIFY ?AUTO_30 ?AUTO_31 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_34 - BLOCK
      ?AUTO_35 - BLOCK
    )
    :vars
    (
      ?AUTO_36 - BLOCK
      ?AUTO_37 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_34 ?AUTO_35 ) ) ( ON-TABLE ?AUTO_34 ) ( not ( = ?AUTO_34 ?AUTO_36 ) ) ( not ( = ?AUTO_34 ?AUTO_37 ) ) ( not ( = ?AUTO_35 ?AUTO_36 ) ) ( not ( = ?AUTO_35 ?AUTO_37 ) ) ( not ( = ?AUTO_36 ?AUTO_37 ) ) ( ON ?AUTO_36 ?AUTO_35 ) ( CLEAR ?AUTO_36 ) ( ON ?AUTO_37 ?AUTO_34 ) ( CLEAR ?AUTO_37 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_37 ?AUTO_34 )
      ( MAKE-ON ?AUTO_34 ?AUTO_35 )
      ( MAKE-ON-VERIFY ?AUTO_34 ?AUTO_35 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_40 - BLOCK
      ?AUTO_41 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_40 ) ( CLEAR ?AUTO_41 ) ( not ( = ?AUTO_40 ?AUTO_41 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_40 ?AUTO_41 )
      ( MAKE-ON-VERIFY ?AUTO_40 ?AUTO_41 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_42 - BLOCK
      ?AUTO_43 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_43 ) ( not ( = ?AUTO_42 ?AUTO_43 ) ) ( ON-TABLE ?AUTO_42 ) ( CLEAR ?AUTO_42 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_42 )
      ( MAKE-ON ?AUTO_42 ?AUTO_43 )
      ( MAKE-ON-VERIFY ?AUTO_42 ?AUTO_43 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_44 - BLOCK
      ?AUTO_45 - BLOCK
    )
    :vars
    (
      ?AUTO_46 - BLOCK
      ?AUTO_47 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_45 ) ( not ( = ?AUTO_44 ?AUTO_45 ) ) ( ON-TABLE ?AUTO_44 ) ( CLEAR ?AUTO_44 ) ( HOLDING ?AUTO_46 ) ( CLEAR ?AUTO_47 ) ( not ( = ?AUTO_44 ?AUTO_46 ) ) ( not ( = ?AUTO_44 ?AUTO_47 ) ) ( not ( = ?AUTO_45 ?AUTO_46 ) ) ( not ( = ?AUTO_45 ?AUTO_47 ) ) ( not ( = ?AUTO_46 ?AUTO_47 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_46 ?AUTO_47 )
      ( MAKE-ON ?AUTO_44 ?AUTO_45 )
      ( MAKE-ON-VERIFY ?AUTO_44 ?AUTO_45 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_50 - BLOCK
      ?AUTO_51 - BLOCK
    )
    :vars
    (
      ?AUTO_52 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_50 ?AUTO_51 ) ) ( ON-TABLE ?AUTO_50 ) ( CLEAR ?AUTO_50 ) ( HOLDING ?AUTO_51 ) ( CLEAR ?AUTO_52 ) ( not ( = ?AUTO_50 ?AUTO_52 ) ) ( not ( = ?AUTO_51 ?AUTO_52 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_51 ?AUTO_52 )
      ( MAKE-ON ?AUTO_50 ?AUTO_51 )
      ( MAKE-ON-VERIFY ?AUTO_50 ?AUTO_51 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_54 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_54 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_54 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_54 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_55 - BLOCK
    )
    :vars
    (
      ?AUTO_56 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_55 ?AUTO_56 ) ( CLEAR ?AUTO_55 ) ( HAND-EMPTY ) ( not ( = ?AUTO_55 ?AUTO_56 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_55 ?AUTO_56 )
      ( MAKE-ON-TABLE ?AUTO_55 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_55 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_58 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_58 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_58 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_58 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_59 - BLOCK
    )
    :vars
    (
      ?AUTO_60 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_59 ?AUTO_60 ) ( CLEAR ?AUTO_59 ) ( HAND-EMPTY ) ( not ( = ?AUTO_59 ?AUTO_60 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_59 ?AUTO_60 )
      ( MAKE-ON-TABLE ?AUTO_59 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_59 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_61 - BLOCK
    )
    :vars
    (
      ?AUTO_62 - BLOCK
      ?AUTO_63 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_61 ?AUTO_62 ) ( CLEAR ?AUTO_61 ) ( not ( = ?AUTO_61 ?AUTO_62 ) ) ( HOLDING ?AUTO_63 ) ( not ( = ?AUTO_61 ?AUTO_63 ) ) ( not ( = ?AUTO_62 ?AUTO_63 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_63 )
      ( MAKE-ON-TABLE ?AUTO_61 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_61 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_67 - BLOCK
      ?AUTO_68 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_67 ) ( CLEAR ?AUTO_68 ) ( not ( = ?AUTO_67 ?AUTO_68 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_67 ?AUTO_68 )
      ( MAKE-ON-VERIFY ?AUTO_67 ?AUTO_68 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_69 - BLOCK
      ?AUTO_70 - BLOCK
    )
    :vars
    (
      ?AUTO_71 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_70 ) ( not ( = ?AUTO_69 ?AUTO_70 ) ) ( ON ?AUTO_69 ?AUTO_71 ) ( CLEAR ?AUTO_69 ) ( HAND-EMPTY ) ( not ( = ?AUTO_69 ?AUTO_71 ) ) ( not ( = ?AUTO_70 ?AUTO_71 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_69 ?AUTO_71 )
      ( MAKE-ON ?AUTO_69 ?AUTO_70 )
      ( MAKE-ON-VERIFY ?AUTO_69 ?AUTO_70 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_72 - BLOCK
      ?AUTO_73 - BLOCK
    )
    :vars
    (
      ?AUTO_74 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_72 ?AUTO_73 ) ) ( ON ?AUTO_72 ?AUTO_74 ) ( CLEAR ?AUTO_72 ) ( not ( = ?AUTO_72 ?AUTO_74 ) ) ( not ( = ?AUTO_73 ?AUTO_74 ) ) ( HOLDING ?AUTO_73 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_73 )
      ( MAKE-ON ?AUTO_72 ?AUTO_73 )
      ( MAKE-ON-VERIFY ?AUTO_72 ?AUTO_73 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_75 - BLOCK
      ?AUTO_76 - BLOCK
    )
    :vars
    (
      ?AUTO_77 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_75 ?AUTO_76 ) ) ( ON ?AUTO_75 ?AUTO_77 ) ( not ( = ?AUTO_75 ?AUTO_77 ) ) ( not ( = ?AUTO_76 ?AUTO_77 ) ) ( ON ?AUTO_76 ?AUTO_75 ) ( CLEAR ?AUTO_76 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_76 ?AUTO_75 )
      ( MAKE-ON ?AUTO_75 ?AUTO_76 )
      ( MAKE-ON-VERIFY ?AUTO_75 ?AUTO_76 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_78 - BLOCK
      ?AUTO_79 - BLOCK
    )
    :vars
    (
      ?AUTO_80 - BLOCK
      ?AUTO_81 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_78 ?AUTO_79 ) ) ( ON ?AUTO_78 ?AUTO_80 ) ( not ( = ?AUTO_78 ?AUTO_80 ) ) ( not ( = ?AUTO_79 ?AUTO_80 ) ) ( ON ?AUTO_79 ?AUTO_78 ) ( CLEAR ?AUTO_79 ) ( HOLDING ?AUTO_81 ) ( not ( = ?AUTO_78 ?AUTO_81 ) ) ( not ( = ?AUTO_79 ?AUTO_81 ) ) ( not ( = ?AUTO_80 ?AUTO_81 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_81 )
      ( MAKE-ON ?AUTO_78 ?AUTO_79 )
      ( MAKE-ON-VERIFY ?AUTO_78 ?AUTO_79 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_86 - BLOCK
      ?AUTO_87 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_86 ) ( CLEAR ?AUTO_87 ) ( not ( = ?AUTO_86 ?AUTO_87 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_86 ?AUTO_87 )
      ( MAKE-ON-VERIFY ?AUTO_86 ?AUTO_87 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_88 - BLOCK
      ?AUTO_89 - BLOCK
    )
    :vars
    (
      ?AUTO_90 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_89 ) ( not ( = ?AUTO_88 ?AUTO_89 ) ) ( ON ?AUTO_88 ?AUTO_90 ) ( CLEAR ?AUTO_88 ) ( HAND-EMPTY ) ( not ( = ?AUTO_88 ?AUTO_90 ) ) ( not ( = ?AUTO_89 ?AUTO_90 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_88 ?AUTO_90 )
      ( MAKE-ON ?AUTO_88 ?AUTO_89 )
      ( MAKE-ON-VERIFY ?AUTO_88 ?AUTO_89 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_91 - BLOCK
      ?AUTO_92 - BLOCK
    )
    :vars
    (
      ?AUTO_93 - BLOCK
      ?AUTO_94 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_91 ?AUTO_92 ) ) ( ON ?AUTO_91 ?AUTO_93 ) ( CLEAR ?AUTO_91 ) ( not ( = ?AUTO_91 ?AUTO_93 ) ) ( not ( = ?AUTO_92 ?AUTO_93 ) ) ( HOLDING ?AUTO_92 ) ( CLEAR ?AUTO_94 ) ( not ( = ?AUTO_91 ?AUTO_94 ) ) ( not ( = ?AUTO_92 ?AUTO_94 ) ) ( not ( = ?AUTO_93 ?AUTO_94 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_92 ?AUTO_94 )
      ( MAKE-ON ?AUTO_91 ?AUTO_92 )
      ( MAKE-ON-VERIFY ?AUTO_91 ?AUTO_92 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_97 - BLOCK
      ?AUTO_98 - BLOCK
    )
    :vars
    (
      ?AUTO_99 - BLOCK
      ?AUTO_100 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_98 ) ( not ( = ?AUTO_97 ?AUTO_98 ) ) ( ON ?AUTO_97 ?AUTO_99 ) ( CLEAR ?AUTO_97 ) ( not ( = ?AUTO_97 ?AUTO_99 ) ) ( not ( = ?AUTO_98 ?AUTO_99 ) ) ( HOLDING ?AUTO_100 ) ( not ( = ?AUTO_97 ?AUTO_100 ) ) ( not ( = ?AUTO_98 ?AUTO_100 ) ) ( not ( = ?AUTO_99 ?AUTO_100 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_100 )
      ( MAKE-ON ?AUTO_97 ?AUTO_98 )
      ( MAKE-ON-VERIFY ?AUTO_97 ?AUTO_98 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_101 - BLOCK
      ?AUTO_102 - BLOCK
    )
    :vars
    (
      ?AUTO_103 - BLOCK
      ?AUTO_104 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_101 ?AUTO_102 ) ) ( ON ?AUTO_101 ?AUTO_103 ) ( CLEAR ?AUTO_101 ) ( not ( = ?AUTO_101 ?AUTO_103 ) ) ( not ( = ?AUTO_102 ?AUTO_103 ) ) ( not ( = ?AUTO_101 ?AUTO_104 ) ) ( not ( = ?AUTO_102 ?AUTO_104 ) ) ( not ( = ?AUTO_103 ?AUTO_104 ) ) ( ON ?AUTO_104 ?AUTO_102 ) ( CLEAR ?AUTO_104 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_104 ?AUTO_102 )
      ( MAKE-ON ?AUTO_101 ?AUTO_102 )
      ( MAKE-ON-VERIFY ?AUTO_101 ?AUTO_102 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_105 - BLOCK
      ?AUTO_106 - BLOCK
    )
    :vars
    (
      ?AUTO_107 - BLOCK
      ?AUTO_108 - BLOCK
      ?AUTO_109 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_105 ?AUTO_106 ) ) ( ON ?AUTO_105 ?AUTO_107 ) ( CLEAR ?AUTO_105 ) ( not ( = ?AUTO_105 ?AUTO_107 ) ) ( not ( = ?AUTO_106 ?AUTO_107 ) ) ( not ( = ?AUTO_105 ?AUTO_108 ) ) ( not ( = ?AUTO_106 ?AUTO_108 ) ) ( not ( = ?AUTO_107 ?AUTO_108 ) ) ( ON ?AUTO_108 ?AUTO_106 ) ( CLEAR ?AUTO_108 ) ( HOLDING ?AUTO_109 ) ( not ( = ?AUTO_105 ?AUTO_109 ) ) ( not ( = ?AUTO_106 ?AUTO_109 ) ) ( not ( = ?AUTO_107 ?AUTO_109 ) ) ( not ( = ?AUTO_108 ?AUTO_109 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_109 )
      ( MAKE-ON ?AUTO_105 ?AUTO_106 )
      ( MAKE-ON-VERIFY ?AUTO_105 ?AUTO_106 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_110 - BLOCK
      ?AUTO_111 - BLOCK
    )
    :vars
    (
      ?AUTO_112 - BLOCK
      ?AUTO_113 - BLOCK
      ?AUTO_114 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_110 ?AUTO_111 ) ) ( ON ?AUTO_110 ?AUTO_112 ) ( not ( = ?AUTO_110 ?AUTO_112 ) ) ( not ( = ?AUTO_111 ?AUTO_112 ) ) ( not ( = ?AUTO_110 ?AUTO_113 ) ) ( not ( = ?AUTO_111 ?AUTO_113 ) ) ( not ( = ?AUTO_112 ?AUTO_113 ) ) ( ON ?AUTO_113 ?AUTO_111 ) ( CLEAR ?AUTO_113 ) ( not ( = ?AUTO_110 ?AUTO_114 ) ) ( not ( = ?AUTO_111 ?AUTO_114 ) ) ( not ( = ?AUTO_112 ?AUTO_114 ) ) ( not ( = ?AUTO_113 ?AUTO_114 ) ) ( ON ?AUTO_114 ?AUTO_110 ) ( CLEAR ?AUTO_114 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_114 ?AUTO_110 )
      ( MAKE-ON ?AUTO_110 ?AUTO_111 )
      ( MAKE-ON-VERIFY ?AUTO_110 ?AUTO_111 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_117 - BLOCK
      ?AUTO_118 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_117 ) ( CLEAR ?AUTO_118 ) ( not ( = ?AUTO_117 ?AUTO_118 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_117 ?AUTO_118 )
      ( MAKE-ON-VERIFY ?AUTO_117 ?AUTO_118 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_119 - BLOCK
      ?AUTO_120 - BLOCK
    )
    :vars
    (
      ?AUTO_121 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_120 ) ( not ( = ?AUTO_119 ?AUTO_120 ) ) ( ON ?AUTO_119 ?AUTO_121 ) ( CLEAR ?AUTO_119 ) ( HAND-EMPTY ) ( not ( = ?AUTO_119 ?AUTO_121 ) ) ( not ( = ?AUTO_120 ?AUTO_121 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_119 ?AUTO_121 )
      ( MAKE-ON ?AUTO_119 ?AUTO_120 )
      ( MAKE-ON-VERIFY ?AUTO_119 ?AUTO_120 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_122 - BLOCK
      ?AUTO_123 - BLOCK
    )
    :vars
    (
      ?AUTO_124 - BLOCK
      ?AUTO_125 - BLOCK
      ?AUTO_126 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_123 ) ( not ( = ?AUTO_122 ?AUTO_123 ) ) ( ON ?AUTO_122 ?AUTO_124 ) ( CLEAR ?AUTO_122 ) ( not ( = ?AUTO_122 ?AUTO_124 ) ) ( not ( = ?AUTO_123 ?AUTO_124 ) ) ( HOLDING ?AUTO_125 ) ( CLEAR ?AUTO_126 ) ( not ( = ?AUTO_122 ?AUTO_125 ) ) ( not ( = ?AUTO_122 ?AUTO_126 ) ) ( not ( = ?AUTO_123 ?AUTO_125 ) ) ( not ( = ?AUTO_123 ?AUTO_126 ) ) ( not ( = ?AUTO_124 ?AUTO_125 ) ) ( not ( = ?AUTO_124 ?AUTO_126 ) ) ( not ( = ?AUTO_125 ?AUTO_126 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_125 ?AUTO_126 )
      ( MAKE-ON ?AUTO_122 ?AUTO_123 )
      ( MAKE-ON-VERIFY ?AUTO_122 ?AUTO_123 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_127 - BLOCK
      ?AUTO_128 - BLOCK
    )
    :vars
    (
      ?AUTO_129 - BLOCK
      ?AUTO_130 - BLOCK
      ?AUTO_131 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_127 ?AUTO_128 ) ) ( ON ?AUTO_127 ?AUTO_129 ) ( CLEAR ?AUTO_127 ) ( not ( = ?AUTO_127 ?AUTO_129 ) ) ( not ( = ?AUTO_128 ?AUTO_129 ) ) ( CLEAR ?AUTO_130 ) ( not ( = ?AUTO_127 ?AUTO_131 ) ) ( not ( = ?AUTO_127 ?AUTO_130 ) ) ( not ( = ?AUTO_128 ?AUTO_131 ) ) ( not ( = ?AUTO_128 ?AUTO_130 ) ) ( not ( = ?AUTO_129 ?AUTO_131 ) ) ( not ( = ?AUTO_129 ?AUTO_130 ) ) ( not ( = ?AUTO_131 ?AUTO_130 ) ) ( ON ?AUTO_131 ?AUTO_128 ) ( CLEAR ?AUTO_131 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_131 ?AUTO_128 )
      ( MAKE-ON ?AUTO_127 ?AUTO_128 )
      ( MAKE-ON-VERIFY ?AUTO_127 ?AUTO_128 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_132 - BLOCK
      ?AUTO_133 - BLOCK
    )
    :vars
    (
      ?AUTO_136 - BLOCK
      ?AUTO_134 - BLOCK
      ?AUTO_135 - BLOCK
      ?AUTO_137 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_132 ?AUTO_133 ) ) ( ON ?AUTO_132 ?AUTO_136 ) ( CLEAR ?AUTO_132 ) ( not ( = ?AUTO_132 ?AUTO_136 ) ) ( not ( = ?AUTO_133 ?AUTO_136 ) ) ( not ( = ?AUTO_132 ?AUTO_134 ) ) ( not ( = ?AUTO_132 ?AUTO_135 ) ) ( not ( = ?AUTO_133 ?AUTO_134 ) ) ( not ( = ?AUTO_133 ?AUTO_135 ) ) ( not ( = ?AUTO_136 ?AUTO_134 ) ) ( not ( = ?AUTO_136 ?AUTO_135 ) ) ( not ( = ?AUTO_134 ?AUTO_135 ) ) ( ON ?AUTO_134 ?AUTO_133 ) ( CLEAR ?AUTO_134 ) ( HOLDING ?AUTO_135 ) ( CLEAR ?AUTO_137 ) ( not ( = ?AUTO_132 ?AUTO_137 ) ) ( not ( = ?AUTO_133 ?AUTO_137 ) ) ( not ( = ?AUTO_136 ?AUTO_137 ) ) ( not ( = ?AUTO_134 ?AUTO_137 ) ) ( not ( = ?AUTO_135 ?AUTO_137 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_135 ?AUTO_137 )
      ( MAKE-ON ?AUTO_132 ?AUTO_133 )
      ( MAKE-ON-VERIFY ?AUTO_132 ?AUTO_133 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_138 - BLOCK
      ?AUTO_139 - BLOCK
    )
    :vars
    (
      ?AUTO_143 - BLOCK
      ?AUTO_141 - BLOCK
      ?AUTO_140 - BLOCK
      ?AUTO_142 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_138 ?AUTO_139 ) ) ( ON ?AUTO_138 ?AUTO_143 ) ( not ( = ?AUTO_138 ?AUTO_143 ) ) ( not ( = ?AUTO_139 ?AUTO_143 ) ) ( not ( = ?AUTO_138 ?AUTO_141 ) ) ( not ( = ?AUTO_138 ?AUTO_140 ) ) ( not ( = ?AUTO_139 ?AUTO_141 ) ) ( not ( = ?AUTO_139 ?AUTO_140 ) ) ( not ( = ?AUTO_143 ?AUTO_141 ) ) ( not ( = ?AUTO_143 ?AUTO_140 ) ) ( not ( = ?AUTO_141 ?AUTO_140 ) ) ( ON ?AUTO_141 ?AUTO_139 ) ( CLEAR ?AUTO_141 ) ( CLEAR ?AUTO_142 ) ( not ( = ?AUTO_138 ?AUTO_142 ) ) ( not ( = ?AUTO_139 ?AUTO_142 ) ) ( not ( = ?AUTO_143 ?AUTO_142 ) ) ( not ( = ?AUTO_141 ?AUTO_142 ) ) ( not ( = ?AUTO_140 ?AUTO_142 ) ) ( ON ?AUTO_140 ?AUTO_138 ) ( CLEAR ?AUTO_140 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_140 ?AUTO_138 )
      ( MAKE-ON ?AUTO_138 ?AUTO_139 )
      ( MAKE-ON-VERIFY ?AUTO_138 ?AUTO_139 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_144 - BLOCK
      ?AUTO_145 - BLOCK
    )
    :vars
    (
      ?AUTO_148 - BLOCK
      ?AUTO_149 - BLOCK
      ?AUTO_146 - BLOCK
      ?AUTO_147 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_144 ?AUTO_145 ) ) ( ON ?AUTO_144 ?AUTO_148 ) ( not ( = ?AUTO_144 ?AUTO_148 ) ) ( not ( = ?AUTO_145 ?AUTO_148 ) ) ( not ( = ?AUTO_144 ?AUTO_149 ) ) ( not ( = ?AUTO_144 ?AUTO_146 ) ) ( not ( = ?AUTO_145 ?AUTO_149 ) ) ( not ( = ?AUTO_145 ?AUTO_146 ) ) ( not ( = ?AUTO_148 ?AUTO_149 ) ) ( not ( = ?AUTO_148 ?AUTO_146 ) ) ( not ( = ?AUTO_149 ?AUTO_146 ) ) ( ON ?AUTO_149 ?AUTO_145 ) ( CLEAR ?AUTO_149 ) ( not ( = ?AUTO_144 ?AUTO_147 ) ) ( not ( = ?AUTO_145 ?AUTO_147 ) ) ( not ( = ?AUTO_148 ?AUTO_147 ) ) ( not ( = ?AUTO_149 ?AUTO_147 ) ) ( not ( = ?AUTO_146 ?AUTO_147 ) ) ( ON ?AUTO_146 ?AUTO_144 ) ( CLEAR ?AUTO_146 ) ( HOLDING ?AUTO_147 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_147 )
      ( MAKE-ON ?AUTO_144 ?AUTO_145 )
      ( MAKE-ON-VERIFY ?AUTO_144 ?AUTO_145 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_150 - BLOCK
      ?AUTO_151 - BLOCK
    )
    :vars
    (
      ?AUTO_153 - BLOCK
      ?AUTO_154 - BLOCK
      ?AUTO_152 - BLOCK
      ?AUTO_155 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_150 ?AUTO_151 ) ) ( ON ?AUTO_150 ?AUTO_153 ) ( not ( = ?AUTO_150 ?AUTO_153 ) ) ( not ( = ?AUTO_151 ?AUTO_153 ) ) ( not ( = ?AUTO_150 ?AUTO_154 ) ) ( not ( = ?AUTO_150 ?AUTO_152 ) ) ( not ( = ?AUTO_151 ?AUTO_154 ) ) ( not ( = ?AUTO_151 ?AUTO_152 ) ) ( not ( = ?AUTO_153 ?AUTO_154 ) ) ( not ( = ?AUTO_153 ?AUTO_152 ) ) ( not ( = ?AUTO_154 ?AUTO_152 ) ) ( ON ?AUTO_154 ?AUTO_151 ) ( CLEAR ?AUTO_154 ) ( not ( = ?AUTO_150 ?AUTO_155 ) ) ( not ( = ?AUTO_151 ?AUTO_155 ) ) ( not ( = ?AUTO_153 ?AUTO_155 ) ) ( not ( = ?AUTO_154 ?AUTO_155 ) ) ( not ( = ?AUTO_152 ?AUTO_155 ) ) ( ON ?AUTO_152 ?AUTO_150 ) ( ON ?AUTO_155 ?AUTO_152 ) ( CLEAR ?AUTO_155 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_155 ?AUTO_152 )
      ( MAKE-ON ?AUTO_150 ?AUTO_151 )
      ( MAKE-ON-VERIFY ?AUTO_150 ?AUTO_151 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_156 - BLOCK
      ?AUTO_157 - BLOCK
    )
    :vars
    (
      ?AUTO_158 - BLOCK
      ?AUTO_160 - BLOCK
      ?AUTO_159 - BLOCK
      ?AUTO_161 - BLOCK
      ?AUTO_162 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_156 ?AUTO_157 ) ) ( ON ?AUTO_156 ?AUTO_158 ) ( not ( = ?AUTO_156 ?AUTO_158 ) ) ( not ( = ?AUTO_157 ?AUTO_158 ) ) ( not ( = ?AUTO_156 ?AUTO_160 ) ) ( not ( = ?AUTO_156 ?AUTO_159 ) ) ( not ( = ?AUTO_157 ?AUTO_160 ) ) ( not ( = ?AUTO_157 ?AUTO_159 ) ) ( not ( = ?AUTO_158 ?AUTO_160 ) ) ( not ( = ?AUTO_158 ?AUTO_159 ) ) ( not ( = ?AUTO_160 ?AUTO_159 ) ) ( ON ?AUTO_160 ?AUTO_157 ) ( CLEAR ?AUTO_160 ) ( not ( = ?AUTO_156 ?AUTO_161 ) ) ( not ( = ?AUTO_157 ?AUTO_161 ) ) ( not ( = ?AUTO_158 ?AUTO_161 ) ) ( not ( = ?AUTO_160 ?AUTO_161 ) ) ( not ( = ?AUTO_159 ?AUTO_161 ) ) ( ON ?AUTO_159 ?AUTO_156 ) ( ON ?AUTO_161 ?AUTO_159 ) ( CLEAR ?AUTO_161 ) ( HOLDING ?AUTO_162 ) ( not ( = ?AUTO_156 ?AUTO_162 ) ) ( not ( = ?AUTO_157 ?AUTO_162 ) ) ( not ( = ?AUTO_158 ?AUTO_162 ) ) ( not ( = ?AUTO_160 ?AUTO_162 ) ) ( not ( = ?AUTO_159 ?AUTO_162 ) ) ( not ( = ?AUTO_161 ?AUTO_162 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_162 )
      ( MAKE-ON ?AUTO_156 ?AUTO_157 )
      ( MAKE-ON-VERIFY ?AUTO_156 ?AUTO_157 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_163 - BLOCK
      ?AUTO_164 - BLOCK
    )
    :vars
    (
      ?AUTO_166 - BLOCK
      ?AUTO_168 - BLOCK
      ?AUTO_165 - BLOCK
      ?AUTO_167 - BLOCK
      ?AUTO_169 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_163 ?AUTO_164 ) ) ( ON ?AUTO_163 ?AUTO_166 ) ( not ( = ?AUTO_163 ?AUTO_166 ) ) ( not ( = ?AUTO_164 ?AUTO_166 ) ) ( not ( = ?AUTO_163 ?AUTO_168 ) ) ( not ( = ?AUTO_163 ?AUTO_165 ) ) ( not ( = ?AUTO_164 ?AUTO_168 ) ) ( not ( = ?AUTO_164 ?AUTO_165 ) ) ( not ( = ?AUTO_166 ?AUTO_168 ) ) ( not ( = ?AUTO_166 ?AUTO_165 ) ) ( not ( = ?AUTO_168 ?AUTO_165 ) ) ( ON ?AUTO_168 ?AUTO_164 ) ( not ( = ?AUTO_163 ?AUTO_167 ) ) ( not ( = ?AUTO_164 ?AUTO_167 ) ) ( not ( = ?AUTO_166 ?AUTO_167 ) ) ( not ( = ?AUTO_168 ?AUTO_167 ) ) ( not ( = ?AUTO_165 ?AUTO_167 ) ) ( ON ?AUTO_165 ?AUTO_163 ) ( ON ?AUTO_167 ?AUTO_165 ) ( CLEAR ?AUTO_167 ) ( not ( = ?AUTO_163 ?AUTO_169 ) ) ( not ( = ?AUTO_164 ?AUTO_169 ) ) ( not ( = ?AUTO_166 ?AUTO_169 ) ) ( not ( = ?AUTO_168 ?AUTO_169 ) ) ( not ( = ?AUTO_165 ?AUTO_169 ) ) ( not ( = ?AUTO_167 ?AUTO_169 ) ) ( ON ?AUTO_169 ?AUTO_168 ) ( CLEAR ?AUTO_169 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_169 ?AUTO_168 )
      ( MAKE-ON ?AUTO_163 ?AUTO_164 )
      ( MAKE-ON-VERIFY ?AUTO_163 ?AUTO_164 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_172 - BLOCK
      ?AUTO_173 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_172 ) ( CLEAR ?AUTO_173 ) ( not ( = ?AUTO_172 ?AUTO_173 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_172 ?AUTO_173 )
      ( MAKE-ON-VERIFY ?AUTO_172 ?AUTO_173 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_174 - BLOCK
      ?AUTO_175 - BLOCK
    )
    :vars
    (
      ?AUTO_176 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_175 ) ( not ( = ?AUTO_174 ?AUTO_175 ) ) ( ON ?AUTO_174 ?AUTO_176 ) ( CLEAR ?AUTO_174 ) ( HAND-EMPTY ) ( not ( = ?AUTO_174 ?AUTO_176 ) ) ( not ( = ?AUTO_175 ?AUTO_176 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_174 ?AUTO_176 )
      ( MAKE-ON ?AUTO_174 ?AUTO_175 )
      ( MAKE-ON-VERIFY ?AUTO_174 ?AUTO_175 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_177 - BLOCK
      ?AUTO_178 - BLOCK
    )
    :vars
    (
      ?AUTO_179 - BLOCK
      ?AUTO_180 - BLOCK
      ?AUTO_181 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_178 ) ( not ( = ?AUTO_177 ?AUTO_178 ) ) ( ON ?AUTO_177 ?AUTO_179 ) ( CLEAR ?AUTO_177 ) ( not ( = ?AUTO_177 ?AUTO_179 ) ) ( not ( = ?AUTO_178 ?AUTO_179 ) ) ( HOLDING ?AUTO_180 ) ( CLEAR ?AUTO_181 ) ( not ( = ?AUTO_177 ?AUTO_180 ) ) ( not ( = ?AUTO_177 ?AUTO_181 ) ) ( not ( = ?AUTO_178 ?AUTO_180 ) ) ( not ( = ?AUTO_178 ?AUTO_181 ) ) ( not ( = ?AUTO_179 ?AUTO_180 ) ) ( not ( = ?AUTO_179 ?AUTO_181 ) ) ( not ( = ?AUTO_180 ?AUTO_181 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_180 ?AUTO_181 )
      ( MAKE-ON ?AUTO_177 ?AUTO_178 )
      ( MAKE-ON-VERIFY ?AUTO_177 ?AUTO_178 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_184 - BLOCK
      ?AUTO_185 - BLOCK
    )
    :vars
    (
      ?AUTO_186 - BLOCK
      ?AUTO_187 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_184 ?AUTO_185 ) ) ( ON ?AUTO_184 ?AUTO_186 ) ( CLEAR ?AUTO_184 ) ( not ( = ?AUTO_184 ?AUTO_186 ) ) ( not ( = ?AUTO_185 ?AUTO_186 ) ) ( HOLDING ?AUTO_185 ) ( CLEAR ?AUTO_187 ) ( not ( = ?AUTO_184 ?AUTO_187 ) ) ( not ( = ?AUTO_185 ?AUTO_187 ) ) ( not ( = ?AUTO_186 ?AUTO_187 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_185 ?AUTO_187 )
      ( MAKE-ON ?AUTO_184 ?AUTO_185 )
      ( MAKE-ON-VERIFY ?AUTO_184 ?AUTO_185 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_204 - BLOCK
      ?AUTO_205 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_204 ) ( CLEAR ?AUTO_205 ) ( not ( = ?AUTO_204 ?AUTO_205 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_204 ?AUTO_205 )
      ( MAKE-ON-VERIFY ?AUTO_204 ?AUTO_205 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_206 - BLOCK
      ?AUTO_207 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_207 ) ( not ( = ?AUTO_206 ?AUTO_207 ) ) ( ON-TABLE ?AUTO_206 ) ( CLEAR ?AUTO_206 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_206 )
      ( MAKE-ON ?AUTO_206 ?AUTO_207 )
      ( MAKE-ON-VERIFY ?AUTO_206 ?AUTO_207 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_208 - BLOCK
      ?AUTO_209 - BLOCK
    )
    :vars
    (
      ?AUTO_210 - BLOCK
      ?AUTO_211 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_209 ) ( not ( = ?AUTO_208 ?AUTO_209 ) ) ( ON-TABLE ?AUTO_208 ) ( CLEAR ?AUTO_208 ) ( HOLDING ?AUTO_210 ) ( CLEAR ?AUTO_211 ) ( not ( = ?AUTO_208 ?AUTO_210 ) ) ( not ( = ?AUTO_208 ?AUTO_211 ) ) ( not ( = ?AUTO_209 ?AUTO_210 ) ) ( not ( = ?AUTO_209 ?AUTO_211 ) ) ( not ( = ?AUTO_210 ?AUTO_211 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_210 ?AUTO_211 )
      ( MAKE-ON ?AUTO_208 ?AUTO_209 )
      ( MAKE-ON-VERIFY ?AUTO_208 ?AUTO_209 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_212 - BLOCK
      ?AUTO_213 - BLOCK
    )
    :vars
    (
      ?AUTO_214 - BLOCK
      ?AUTO_215 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_213 ) ( not ( = ?AUTO_212 ?AUTO_213 ) ) ( ON-TABLE ?AUTO_212 ) ( CLEAR ?AUTO_214 ) ( not ( = ?AUTO_212 ?AUTO_215 ) ) ( not ( = ?AUTO_212 ?AUTO_214 ) ) ( not ( = ?AUTO_213 ?AUTO_215 ) ) ( not ( = ?AUTO_213 ?AUTO_214 ) ) ( not ( = ?AUTO_215 ?AUTO_214 ) ) ( ON ?AUTO_215 ?AUTO_212 ) ( CLEAR ?AUTO_215 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_215 ?AUTO_212 )
      ( MAKE-ON ?AUTO_212 ?AUTO_213 )
      ( MAKE-ON-VERIFY ?AUTO_212 ?AUTO_213 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_216 - BLOCK
      ?AUTO_217 - BLOCK
    )
    :vars
    (
      ?AUTO_219 - BLOCK
      ?AUTO_218 - BLOCK
      ?AUTO_220 - BLOCK
      ?AUTO_221 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_217 ) ( not ( = ?AUTO_216 ?AUTO_217 ) ) ( ON-TABLE ?AUTO_216 ) ( CLEAR ?AUTO_219 ) ( not ( = ?AUTO_216 ?AUTO_218 ) ) ( not ( = ?AUTO_216 ?AUTO_219 ) ) ( not ( = ?AUTO_217 ?AUTO_218 ) ) ( not ( = ?AUTO_217 ?AUTO_219 ) ) ( not ( = ?AUTO_218 ?AUTO_219 ) ) ( ON ?AUTO_218 ?AUTO_216 ) ( CLEAR ?AUTO_218 ) ( HOLDING ?AUTO_220 ) ( CLEAR ?AUTO_221 ) ( not ( = ?AUTO_216 ?AUTO_220 ) ) ( not ( = ?AUTO_216 ?AUTO_221 ) ) ( not ( = ?AUTO_217 ?AUTO_220 ) ) ( not ( = ?AUTO_217 ?AUTO_221 ) ) ( not ( = ?AUTO_219 ?AUTO_220 ) ) ( not ( = ?AUTO_219 ?AUTO_221 ) ) ( not ( = ?AUTO_218 ?AUTO_220 ) ) ( not ( = ?AUTO_218 ?AUTO_221 ) ) ( not ( = ?AUTO_220 ?AUTO_221 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_220 ?AUTO_221 )
      ( MAKE-ON ?AUTO_216 ?AUTO_217 )
      ( MAKE-ON-VERIFY ?AUTO_216 ?AUTO_217 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_236 - BLOCK
      ?AUTO_237 - BLOCK
    )
    :vars
    (
      ?AUTO_239 - BLOCK
      ?AUTO_238 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_236 ?AUTO_237 ) ) ( ON-TABLE ?AUTO_236 ) ( CLEAR ?AUTO_239 ) ( not ( = ?AUTO_236 ?AUTO_238 ) ) ( not ( = ?AUTO_236 ?AUTO_239 ) ) ( not ( = ?AUTO_237 ?AUTO_238 ) ) ( not ( = ?AUTO_237 ?AUTO_239 ) ) ( not ( = ?AUTO_238 ?AUTO_239 ) ) ( ON ?AUTO_238 ?AUTO_236 ) ( CLEAR ?AUTO_238 ) ( HOLDING ?AUTO_237 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_237 )
      ( MAKE-ON ?AUTO_236 ?AUTO_237 )
      ( MAKE-ON-VERIFY ?AUTO_236 ?AUTO_237 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_241 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_241 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_241 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_241 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_242 - BLOCK
    )
    :vars
    (
      ?AUTO_243 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_242 ?AUTO_243 ) ( CLEAR ?AUTO_242 ) ( HAND-EMPTY ) ( not ( = ?AUTO_242 ?AUTO_243 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_242 ?AUTO_243 )
      ( MAKE-ON-TABLE ?AUTO_242 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_242 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_246 - BLOCK
      ?AUTO_247 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_246 ) ( CLEAR ?AUTO_247 ) ( not ( = ?AUTO_246 ?AUTO_247 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_246 ?AUTO_247 )
      ( MAKE-ON-VERIFY ?AUTO_246 ?AUTO_247 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_248 - BLOCK
      ?AUTO_249 - BLOCK
    )
    :vars
    (
      ?AUTO_250 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_249 ) ( not ( = ?AUTO_248 ?AUTO_249 ) ) ( ON ?AUTO_248 ?AUTO_250 ) ( CLEAR ?AUTO_248 ) ( HAND-EMPTY ) ( not ( = ?AUTO_248 ?AUTO_250 ) ) ( not ( = ?AUTO_249 ?AUTO_250 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_248 ?AUTO_250 )
      ( MAKE-ON ?AUTO_248 ?AUTO_249 )
      ( MAKE-ON-VERIFY ?AUTO_248 ?AUTO_249 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_251 - BLOCK
      ?AUTO_252 - BLOCK
    )
    :vars
    (
      ?AUTO_253 - BLOCK
      ?AUTO_254 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_252 ) ( not ( = ?AUTO_251 ?AUTO_252 ) ) ( ON ?AUTO_251 ?AUTO_253 ) ( CLEAR ?AUTO_251 ) ( not ( = ?AUTO_251 ?AUTO_253 ) ) ( not ( = ?AUTO_252 ?AUTO_253 ) ) ( HOLDING ?AUTO_254 ) ( not ( = ?AUTO_251 ?AUTO_254 ) ) ( not ( = ?AUTO_252 ?AUTO_254 ) ) ( not ( = ?AUTO_253 ?AUTO_254 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_254 )
      ( MAKE-ON ?AUTO_251 ?AUTO_252 )
      ( MAKE-ON-VERIFY ?AUTO_251 ?AUTO_252 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_255 - BLOCK
      ?AUTO_256 - BLOCK
    )
    :vars
    (
      ?AUTO_257 - BLOCK
      ?AUTO_258 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_255 ?AUTO_256 ) ) ( ON ?AUTO_255 ?AUTO_257 ) ( CLEAR ?AUTO_255 ) ( not ( = ?AUTO_255 ?AUTO_257 ) ) ( not ( = ?AUTO_256 ?AUTO_257 ) ) ( not ( = ?AUTO_255 ?AUTO_258 ) ) ( not ( = ?AUTO_256 ?AUTO_258 ) ) ( not ( = ?AUTO_257 ?AUTO_258 ) ) ( ON ?AUTO_258 ?AUTO_256 ) ( CLEAR ?AUTO_258 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_258 ?AUTO_256 )
      ( MAKE-ON ?AUTO_255 ?AUTO_256 )
      ( MAKE-ON-VERIFY ?AUTO_255 ?AUTO_256 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_260 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_260 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_260 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_260 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_261 - BLOCK
    )
    :vars
    (
      ?AUTO_262 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_261 ?AUTO_262 ) ( CLEAR ?AUTO_261 ) ( HAND-EMPTY ) ( not ( = ?AUTO_261 ?AUTO_262 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_261 ?AUTO_262 )
      ( MAKE-ON-TABLE ?AUTO_261 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_261 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_263 - BLOCK
    )
    :vars
    (
      ?AUTO_264 - BLOCK
      ?AUTO_265 - BLOCK
      ?AUTO_266 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_263 ?AUTO_264 ) ( CLEAR ?AUTO_263 ) ( not ( = ?AUTO_263 ?AUTO_264 ) ) ( HOLDING ?AUTO_265 ) ( CLEAR ?AUTO_266 ) ( not ( = ?AUTO_263 ?AUTO_265 ) ) ( not ( = ?AUTO_263 ?AUTO_266 ) ) ( not ( = ?AUTO_264 ?AUTO_265 ) ) ( not ( = ?AUTO_264 ?AUTO_266 ) ) ( not ( = ?AUTO_265 ?AUTO_266 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_265 ?AUTO_266 )
      ( MAKE-ON-TABLE ?AUTO_263 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_263 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_267 - BLOCK
    )
    :vars
    (
      ?AUTO_268 - BLOCK
      ?AUTO_270 - BLOCK
      ?AUTO_269 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_267 ?AUTO_268 ) ( not ( = ?AUTO_267 ?AUTO_268 ) ) ( CLEAR ?AUTO_270 ) ( not ( = ?AUTO_267 ?AUTO_269 ) ) ( not ( = ?AUTO_267 ?AUTO_270 ) ) ( not ( = ?AUTO_268 ?AUTO_269 ) ) ( not ( = ?AUTO_268 ?AUTO_270 ) ) ( not ( = ?AUTO_269 ?AUTO_270 ) ) ( ON ?AUTO_269 ?AUTO_267 ) ( CLEAR ?AUTO_269 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_269 ?AUTO_267 )
      ( MAKE-ON-TABLE ?AUTO_267 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_267 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_271 - BLOCK
    )
    :vars
    (
      ?AUTO_272 - BLOCK
      ?AUTO_274 - BLOCK
      ?AUTO_273 - BLOCK
      ?AUTO_275 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_271 ?AUTO_272 ) ( not ( = ?AUTO_271 ?AUTO_272 ) ) ( CLEAR ?AUTO_274 ) ( not ( = ?AUTO_271 ?AUTO_273 ) ) ( not ( = ?AUTO_271 ?AUTO_274 ) ) ( not ( = ?AUTO_272 ?AUTO_273 ) ) ( not ( = ?AUTO_272 ?AUTO_274 ) ) ( not ( = ?AUTO_273 ?AUTO_274 ) ) ( ON ?AUTO_273 ?AUTO_271 ) ( CLEAR ?AUTO_273 ) ( HOLDING ?AUTO_275 ) ( not ( = ?AUTO_271 ?AUTO_275 ) ) ( not ( = ?AUTO_272 ?AUTO_275 ) ) ( not ( = ?AUTO_274 ?AUTO_275 ) ) ( not ( = ?AUTO_273 ?AUTO_275 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_275 )
      ( MAKE-ON-TABLE ?AUTO_271 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_271 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_279 - BLOCK
      ?AUTO_280 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_279 ) ( CLEAR ?AUTO_280 ) ( not ( = ?AUTO_279 ?AUTO_280 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_279 ?AUTO_280 )
      ( MAKE-ON-VERIFY ?AUTO_279 ?AUTO_280 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_281 - BLOCK
      ?AUTO_282 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_282 ) ( not ( = ?AUTO_281 ?AUTO_282 ) ) ( ON-TABLE ?AUTO_281 ) ( CLEAR ?AUTO_281 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_281 )
      ( MAKE-ON ?AUTO_281 ?AUTO_282 )
      ( MAKE-ON-VERIFY ?AUTO_281 ?AUTO_282 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_283 - BLOCK
      ?AUTO_284 - BLOCK
    )
    :vars
    (
      ?AUTO_285 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_284 ) ( not ( = ?AUTO_283 ?AUTO_284 ) ) ( ON-TABLE ?AUTO_283 ) ( CLEAR ?AUTO_283 ) ( HOLDING ?AUTO_285 ) ( not ( = ?AUTO_283 ?AUTO_285 ) ) ( not ( = ?AUTO_284 ?AUTO_285 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_285 )
      ( MAKE-ON ?AUTO_283 ?AUTO_284 )
      ( MAKE-ON-VERIFY ?AUTO_283 ?AUTO_284 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_286 - BLOCK
      ?AUTO_287 - BLOCK
    )
    :vars
    (
      ?AUTO_288 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_287 ) ( not ( = ?AUTO_286 ?AUTO_287 ) ) ( ON-TABLE ?AUTO_286 ) ( not ( = ?AUTO_286 ?AUTO_288 ) ) ( not ( = ?AUTO_287 ?AUTO_288 ) ) ( ON ?AUTO_288 ?AUTO_286 ) ( CLEAR ?AUTO_288 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_288 ?AUTO_286 )
      ( MAKE-ON ?AUTO_286 ?AUTO_287 )
      ( MAKE-ON-VERIFY ?AUTO_286 ?AUTO_287 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_289 - BLOCK
      ?AUTO_290 - BLOCK
    )
    :vars
    (
      ?AUTO_291 - BLOCK
      ?AUTO_292 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_289 ?AUTO_290 ) ) ( ON-TABLE ?AUTO_289 ) ( not ( = ?AUTO_289 ?AUTO_291 ) ) ( not ( = ?AUTO_290 ?AUTO_291 ) ) ( ON ?AUTO_291 ?AUTO_289 ) ( CLEAR ?AUTO_291 ) ( HOLDING ?AUTO_290 ) ( CLEAR ?AUTO_292 ) ( not ( = ?AUTO_289 ?AUTO_292 ) ) ( not ( = ?AUTO_290 ?AUTO_292 ) ) ( not ( = ?AUTO_291 ?AUTO_292 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_290 ?AUTO_292 )
      ( MAKE-ON ?AUTO_289 ?AUTO_290 )
      ( MAKE-ON-VERIFY ?AUTO_289 ?AUTO_290 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_293 - BLOCK
      ?AUTO_294 - BLOCK
    )
    :vars
    (
      ?AUTO_295 - BLOCK
      ?AUTO_296 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_293 ?AUTO_294 ) ) ( ON-TABLE ?AUTO_293 ) ( not ( = ?AUTO_293 ?AUTO_295 ) ) ( not ( = ?AUTO_294 ?AUTO_295 ) ) ( ON ?AUTO_295 ?AUTO_293 ) ( CLEAR ?AUTO_296 ) ( not ( = ?AUTO_293 ?AUTO_296 ) ) ( not ( = ?AUTO_294 ?AUTO_296 ) ) ( not ( = ?AUTO_295 ?AUTO_296 ) ) ( ON ?AUTO_294 ?AUTO_295 ) ( CLEAR ?AUTO_294 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_294 ?AUTO_295 )
      ( MAKE-ON ?AUTO_293 ?AUTO_294 )
      ( MAKE-ON-VERIFY ?AUTO_293 ?AUTO_294 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_297 - BLOCK
      ?AUTO_298 - BLOCK
    )
    :vars
    (
      ?AUTO_300 - BLOCK
      ?AUTO_299 - BLOCK
      ?AUTO_301 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_297 ?AUTO_298 ) ) ( ON-TABLE ?AUTO_297 ) ( not ( = ?AUTO_297 ?AUTO_300 ) ) ( not ( = ?AUTO_298 ?AUTO_300 ) ) ( ON ?AUTO_300 ?AUTO_297 ) ( CLEAR ?AUTO_299 ) ( not ( = ?AUTO_297 ?AUTO_299 ) ) ( not ( = ?AUTO_298 ?AUTO_299 ) ) ( not ( = ?AUTO_300 ?AUTO_299 ) ) ( ON ?AUTO_298 ?AUTO_300 ) ( CLEAR ?AUTO_298 ) ( HOLDING ?AUTO_301 ) ( not ( = ?AUTO_297 ?AUTO_301 ) ) ( not ( = ?AUTO_298 ?AUTO_301 ) ) ( not ( = ?AUTO_300 ?AUTO_301 ) ) ( not ( = ?AUTO_299 ?AUTO_301 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_301 )
      ( MAKE-ON ?AUTO_297 ?AUTO_298 )
      ( MAKE-ON-VERIFY ?AUTO_297 ?AUTO_298 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_306 - BLOCK
      ?AUTO_307 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_306 ) ( CLEAR ?AUTO_307 ) ( not ( = ?AUTO_306 ?AUTO_307 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_306 ?AUTO_307 )
      ( MAKE-ON-VERIFY ?AUTO_306 ?AUTO_307 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_308 - BLOCK
      ?AUTO_309 - BLOCK
    )
    :vars
    (
      ?AUTO_310 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_309 ) ( not ( = ?AUTO_308 ?AUTO_309 ) ) ( ON ?AUTO_308 ?AUTO_310 ) ( CLEAR ?AUTO_308 ) ( HAND-EMPTY ) ( not ( = ?AUTO_308 ?AUTO_310 ) ) ( not ( = ?AUTO_309 ?AUTO_310 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_308 ?AUTO_310 )
      ( MAKE-ON ?AUTO_308 ?AUTO_309 )
      ( MAKE-ON-VERIFY ?AUTO_308 ?AUTO_309 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_311 - BLOCK
      ?AUTO_312 - BLOCK
    )
    :vars
    (
      ?AUTO_313 - BLOCK
      ?AUTO_314 - BLOCK
      ?AUTO_315 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_312 ) ( not ( = ?AUTO_311 ?AUTO_312 ) ) ( ON ?AUTO_311 ?AUTO_313 ) ( CLEAR ?AUTO_311 ) ( not ( = ?AUTO_311 ?AUTO_313 ) ) ( not ( = ?AUTO_312 ?AUTO_313 ) ) ( HOLDING ?AUTO_314 ) ( CLEAR ?AUTO_315 ) ( not ( = ?AUTO_311 ?AUTO_314 ) ) ( not ( = ?AUTO_311 ?AUTO_315 ) ) ( not ( = ?AUTO_312 ?AUTO_314 ) ) ( not ( = ?AUTO_312 ?AUTO_315 ) ) ( not ( = ?AUTO_313 ?AUTO_314 ) ) ( not ( = ?AUTO_313 ?AUTO_315 ) ) ( not ( = ?AUTO_314 ?AUTO_315 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_314 ?AUTO_315 )
      ( MAKE-ON ?AUTO_311 ?AUTO_312 )
      ( MAKE-ON-VERIFY ?AUTO_311 ?AUTO_312 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_318 - BLOCK
      ?AUTO_319 - BLOCK
    )
    :vars
    (
      ?AUTO_320 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_318 ?AUTO_319 ) ) ( ON ?AUTO_318 ?AUTO_320 ) ( CLEAR ?AUTO_318 ) ( not ( = ?AUTO_318 ?AUTO_320 ) ) ( not ( = ?AUTO_319 ?AUTO_320 ) ) ( HOLDING ?AUTO_319 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_319 )
      ( MAKE-ON ?AUTO_318 ?AUTO_319 )
      ( MAKE-ON-VERIFY ?AUTO_318 ?AUTO_319 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_325 - BLOCK
      ?AUTO_326 - BLOCK
    )
    :vars
    (
      ?AUTO_329 - BLOCK
      ?AUTO_328 - BLOCK
      ?AUTO_327 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_325 ?AUTO_326 ) ) ( ON ?AUTO_325 ?AUTO_329 ) ( CLEAR ?AUTO_325 ) ( not ( = ?AUTO_325 ?AUTO_329 ) ) ( not ( = ?AUTO_326 ?AUTO_329 ) ) ( CLEAR ?AUTO_328 ) ( not ( = ?AUTO_325 ?AUTO_327 ) ) ( not ( = ?AUTO_325 ?AUTO_328 ) ) ( not ( = ?AUTO_326 ?AUTO_327 ) ) ( not ( = ?AUTO_326 ?AUTO_328 ) ) ( not ( = ?AUTO_329 ?AUTO_327 ) ) ( not ( = ?AUTO_329 ?AUTO_328 ) ) ( not ( = ?AUTO_327 ?AUTO_328 ) ) ( ON ?AUTO_327 ?AUTO_326 ) ( CLEAR ?AUTO_327 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_327 ?AUTO_326 )
      ( MAKE-ON ?AUTO_325 ?AUTO_326 )
      ( MAKE-ON-VERIFY ?AUTO_325 ?AUTO_326 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_330 - BLOCK
      ?AUTO_331 - BLOCK
    )
    :vars
    (
      ?AUTO_334 - BLOCK
      ?AUTO_332 - BLOCK
      ?AUTO_333 - BLOCK
      ?AUTO_335 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_330 ?AUTO_331 ) ) ( ON ?AUTO_330 ?AUTO_334 ) ( CLEAR ?AUTO_330 ) ( not ( = ?AUTO_330 ?AUTO_334 ) ) ( not ( = ?AUTO_331 ?AUTO_334 ) ) ( CLEAR ?AUTO_332 ) ( not ( = ?AUTO_330 ?AUTO_333 ) ) ( not ( = ?AUTO_330 ?AUTO_332 ) ) ( not ( = ?AUTO_331 ?AUTO_333 ) ) ( not ( = ?AUTO_331 ?AUTO_332 ) ) ( not ( = ?AUTO_334 ?AUTO_333 ) ) ( not ( = ?AUTO_334 ?AUTO_332 ) ) ( not ( = ?AUTO_333 ?AUTO_332 ) ) ( ON ?AUTO_333 ?AUTO_331 ) ( CLEAR ?AUTO_333 ) ( HOLDING ?AUTO_335 ) ( not ( = ?AUTO_330 ?AUTO_335 ) ) ( not ( = ?AUTO_331 ?AUTO_335 ) ) ( not ( = ?AUTO_334 ?AUTO_335 ) ) ( not ( = ?AUTO_332 ?AUTO_335 ) ) ( not ( = ?AUTO_333 ?AUTO_335 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_335 )
      ( MAKE-ON ?AUTO_330 ?AUTO_331 )
      ( MAKE-ON-VERIFY ?AUTO_330 ?AUTO_331 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_340 - BLOCK
      ?AUTO_341 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_340 ) ( CLEAR ?AUTO_341 ) ( not ( = ?AUTO_340 ?AUTO_341 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_340 ?AUTO_341 )
      ( MAKE-ON-VERIFY ?AUTO_340 ?AUTO_341 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_342 - BLOCK
      ?AUTO_343 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_343 ) ( not ( = ?AUTO_342 ?AUTO_343 ) ) ( ON-TABLE ?AUTO_342 ) ( CLEAR ?AUTO_342 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_342 )
      ( MAKE-ON ?AUTO_342 ?AUTO_343 )
      ( MAKE-ON-VERIFY ?AUTO_342 ?AUTO_343 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_344 - BLOCK
      ?AUTO_345 - BLOCK
    )
    :vars
    (
      ?AUTO_346 - BLOCK
      ?AUTO_347 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_345 ) ( not ( = ?AUTO_344 ?AUTO_345 ) ) ( ON-TABLE ?AUTO_344 ) ( CLEAR ?AUTO_344 ) ( HOLDING ?AUTO_346 ) ( CLEAR ?AUTO_347 ) ( not ( = ?AUTO_344 ?AUTO_346 ) ) ( not ( = ?AUTO_344 ?AUTO_347 ) ) ( not ( = ?AUTO_345 ?AUTO_346 ) ) ( not ( = ?AUTO_345 ?AUTO_347 ) ) ( not ( = ?AUTO_346 ?AUTO_347 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_346 ?AUTO_347 )
      ( MAKE-ON ?AUTO_344 ?AUTO_345 )
      ( MAKE-ON-VERIFY ?AUTO_344 ?AUTO_345 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_348 - BLOCK
      ?AUTO_349 - BLOCK
    )
    :vars
    (
      ?AUTO_350 - BLOCK
      ?AUTO_351 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_348 ?AUTO_349 ) ) ( ON-TABLE ?AUTO_348 ) ( CLEAR ?AUTO_348 ) ( CLEAR ?AUTO_350 ) ( not ( = ?AUTO_348 ?AUTO_351 ) ) ( not ( = ?AUTO_348 ?AUTO_350 ) ) ( not ( = ?AUTO_349 ?AUTO_351 ) ) ( not ( = ?AUTO_349 ?AUTO_350 ) ) ( not ( = ?AUTO_351 ?AUTO_350 ) ) ( ON ?AUTO_351 ?AUTO_349 ) ( CLEAR ?AUTO_351 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_351 ?AUTO_349 )
      ( MAKE-ON ?AUTO_348 ?AUTO_349 )
      ( MAKE-ON-VERIFY ?AUTO_348 ?AUTO_349 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_352 - BLOCK
      ?AUTO_353 - BLOCK
    )
    :vars
    (
      ?AUTO_354 - BLOCK
      ?AUTO_355 - BLOCK
      ?AUTO_356 - BLOCK
      ?AUTO_357 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_352 ?AUTO_353 ) ) ( ON-TABLE ?AUTO_352 ) ( CLEAR ?AUTO_352 ) ( CLEAR ?AUTO_354 ) ( not ( = ?AUTO_352 ?AUTO_355 ) ) ( not ( = ?AUTO_352 ?AUTO_354 ) ) ( not ( = ?AUTO_353 ?AUTO_355 ) ) ( not ( = ?AUTO_353 ?AUTO_354 ) ) ( not ( = ?AUTO_355 ?AUTO_354 ) ) ( ON ?AUTO_355 ?AUTO_353 ) ( CLEAR ?AUTO_355 ) ( HOLDING ?AUTO_356 ) ( CLEAR ?AUTO_357 ) ( not ( = ?AUTO_352 ?AUTO_356 ) ) ( not ( = ?AUTO_352 ?AUTO_357 ) ) ( not ( = ?AUTO_353 ?AUTO_356 ) ) ( not ( = ?AUTO_353 ?AUTO_357 ) ) ( not ( = ?AUTO_354 ?AUTO_356 ) ) ( not ( = ?AUTO_354 ?AUTO_357 ) ) ( not ( = ?AUTO_355 ?AUTO_356 ) ) ( not ( = ?AUTO_355 ?AUTO_357 ) ) ( not ( = ?AUTO_356 ?AUTO_357 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_356 ?AUTO_357 )
      ( MAKE-ON ?AUTO_352 ?AUTO_353 )
      ( MAKE-ON-VERIFY ?AUTO_352 ?AUTO_353 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_368 - BLOCK
      ?AUTO_369 - BLOCK
    )
    :vars
    (
      ?AUTO_370 - BLOCK
      ?AUTO_371 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_368 ?AUTO_369 ) ) ( CLEAR ?AUTO_370 ) ( not ( = ?AUTO_368 ?AUTO_371 ) ) ( not ( = ?AUTO_368 ?AUTO_370 ) ) ( not ( = ?AUTO_369 ?AUTO_371 ) ) ( not ( = ?AUTO_369 ?AUTO_370 ) ) ( not ( = ?AUTO_371 ?AUTO_370 ) ) ( ON ?AUTO_371 ?AUTO_369 ) ( CLEAR ?AUTO_371 ) ( HOLDING ?AUTO_368 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_368 )
      ( MAKE-ON ?AUTO_368 ?AUTO_369 )
      ( MAKE-ON-VERIFY ?AUTO_368 ?AUTO_369 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_376 - BLOCK
      ?AUTO_377 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_376 ) ( CLEAR ?AUTO_377 ) ( not ( = ?AUTO_376 ?AUTO_377 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_376 ?AUTO_377 )
      ( MAKE-ON-VERIFY ?AUTO_376 ?AUTO_377 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_378 - BLOCK
      ?AUTO_379 - BLOCK
    )
    :vars
    (
      ?AUTO_380 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_379 ) ( not ( = ?AUTO_378 ?AUTO_379 ) ) ( ON ?AUTO_378 ?AUTO_380 ) ( CLEAR ?AUTO_378 ) ( HAND-EMPTY ) ( not ( = ?AUTO_378 ?AUTO_380 ) ) ( not ( = ?AUTO_379 ?AUTO_380 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_378 ?AUTO_380 )
      ( MAKE-ON ?AUTO_378 ?AUTO_379 )
      ( MAKE-ON-VERIFY ?AUTO_378 ?AUTO_379 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_381 - BLOCK
      ?AUTO_382 - BLOCK
    )
    :vars
    (
      ?AUTO_383 - BLOCK
      ?AUTO_384 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_381 ?AUTO_382 ) ) ( ON ?AUTO_381 ?AUTO_383 ) ( CLEAR ?AUTO_381 ) ( not ( = ?AUTO_381 ?AUTO_383 ) ) ( not ( = ?AUTO_382 ?AUTO_383 ) ) ( HOLDING ?AUTO_382 ) ( CLEAR ?AUTO_384 ) ( not ( = ?AUTO_381 ?AUTO_384 ) ) ( not ( = ?AUTO_382 ?AUTO_384 ) ) ( not ( = ?AUTO_383 ?AUTO_384 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_382 ?AUTO_384 )
      ( MAKE-ON ?AUTO_381 ?AUTO_382 )
      ( MAKE-ON-VERIFY ?AUTO_381 ?AUTO_382 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_387 - BLOCK
      ?AUTO_388 - BLOCK
    )
    :vars
    (
      ?AUTO_389 - BLOCK
      ?AUTO_390 - BLOCK
      ?AUTO_391 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_388 ) ( not ( = ?AUTO_387 ?AUTO_388 ) ) ( ON ?AUTO_387 ?AUTO_389 ) ( CLEAR ?AUTO_387 ) ( not ( = ?AUTO_387 ?AUTO_389 ) ) ( not ( = ?AUTO_388 ?AUTO_389 ) ) ( HOLDING ?AUTO_390 ) ( CLEAR ?AUTO_391 ) ( not ( = ?AUTO_387 ?AUTO_390 ) ) ( not ( = ?AUTO_387 ?AUTO_391 ) ) ( not ( = ?AUTO_388 ?AUTO_390 ) ) ( not ( = ?AUTO_388 ?AUTO_391 ) ) ( not ( = ?AUTO_389 ?AUTO_390 ) ) ( not ( = ?AUTO_389 ?AUTO_391 ) ) ( not ( = ?AUTO_390 ?AUTO_391 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_390 ?AUTO_391 )
      ( MAKE-ON ?AUTO_387 ?AUTO_388 )
      ( MAKE-ON-VERIFY ?AUTO_387 ?AUTO_388 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_402 - BLOCK
      ?AUTO_403 - BLOCK
    )
    :vars
    (
      ?AUTO_404 - BLOCK
      ?AUTO_405 - BLOCK
      ?AUTO_406 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_403 ) ( not ( = ?AUTO_402 ?AUTO_403 ) ) ( ON-TABLE ?AUTO_402 ) ( not ( = ?AUTO_402 ?AUTO_404 ) ) ( not ( = ?AUTO_403 ?AUTO_404 ) ) ( ON ?AUTO_404 ?AUTO_402 ) ( CLEAR ?AUTO_404 ) ( HOLDING ?AUTO_405 ) ( CLEAR ?AUTO_406 ) ( not ( = ?AUTO_402 ?AUTO_405 ) ) ( not ( = ?AUTO_402 ?AUTO_406 ) ) ( not ( = ?AUTO_403 ?AUTO_405 ) ) ( not ( = ?AUTO_403 ?AUTO_406 ) ) ( not ( = ?AUTO_404 ?AUTO_405 ) ) ( not ( = ?AUTO_404 ?AUTO_406 ) ) ( not ( = ?AUTO_405 ?AUTO_406 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_405 ?AUTO_406 )
      ( MAKE-ON ?AUTO_402 ?AUTO_403 )
      ( MAKE-ON-VERIFY ?AUTO_402 ?AUTO_403 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_407 - BLOCK
      ?AUTO_408 - BLOCK
    )
    :vars
    (
      ?AUTO_409 - BLOCK
      ?AUTO_411 - BLOCK
      ?AUTO_410 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_408 ) ( not ( = ?AUTO_407 ?AUTO_408 ) ) ( ON-TABLE ?AUTO_407 ) ( not ( = ?AUTO_407 ?AUTO_409 ) ) ( not ( = ?AUTO_408 ?AUTO_409 ) ) ( ON ?AUTO_409 ?AUTO_407 ) ( CLEAR ?AUTO_411 ) ( not ( = ?AUTO_407 ?AUTO_410 ) ) ( not ( = ?AUTO_407 ?AUTO_411 ) ) ( not ( = ?AUTO_408 ?AUTO_410 ) ) ( not ( = ?AUTO_408 ?AUTO_411 ) ) ( not ( = ?AUTO_409 ?AUTO_410 ) ) ( not ( = ?AUTO_409 ?AUTO_411 ) ) ( not ( = ?AUTO_410 ?AUTO_411 ) ) ( ON ?AUTO_410 ?AUTO_409 ) ( CLEAR ?AUTO_410 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_410 ?AUTO_409 )
      ( MAKE-ON ?AUTO_407 ?AUTO_408 )
      ( MAKE-ON-VERIFY ?AUTO_407 ?AUTO_408 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_412 - BLOCK
      ?AUTO_413 - BLOCK
    )
    :vars
    (
      ?AUTO_414 - BLOCK
      ?AUTO_415 - BLOCK
      ?AUTO_416 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_412 ?AUTO_413 ) ) ( ON-TABLE ?AUTO_412 ) ( not ( = ?AUTO_412 ?AUTO_414 ) ) ( not ( = ?AUTO_413 ?AUTO_414 ) ) ( ON ?AUTO_414 ?AUTO_412 ) ( CLEAR ?AUTO_415 ) ( not ( = ?AUTO_412 ?AUTO_416 ) ) ( not ( = ?AUTO_412 ?AUTO_415 ) ) ( not ( = ?AUTO_413 ?AUTO_416 ) ) ( not ( = ?AUTO_413 ?AUTO_415 ) ) ( not ( = ?AUTO_414 ?AUTO_416 ) ) ( not ( = ?AUTO_414 ?AUTO_415 ) ) ( not ( = ?AUTO_416 ?AUTO_415 ) ) ( ON ?AUTO_416 ?AUTO_414 ) ( CLEAR ?AUTO_416 ) ( HOLDING ?AUTO_413 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_413 )
      ( MAKE-ON ?AUTO_412 ?AUTO_413 )
      ( MAKE-ON-VERIFY ?AUTO_412 ?AUTO_413 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_420 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_420 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_420 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_420 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_421 - BLOCK
    )
    :vars
    (
      ?AUTO_422 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_421 ?AUTO_422 ) ( CLEAR ?AUTO_421 ) ( HAND-EMPTY ) ( not ( = ?AUTO_421 ?AUTO_422 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_421 ?AUTO_422 )
      ( MAKE-ON-TABLE ?AUTO_421 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_421 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_423 - BLOCK
    )
    :vars
    (
      ?AUTO_424 - BLOCK
      ?AUTO_425 - BLOCK
      ?AUTO_426 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_423 ?AUTO_424 ) ( CLEAR ?AUTO_423 ) ( not ( = ?AUTO_423 ?AUTO_424 ) ) ( HOLDING ?AUTO_425 ) ( CLEAR ?AUTO_426 ) ( not ( = ?AUTO_423 ?AUTO_425 ) ) ( not ( = ?AUTO_423 ?AUTO_426 ) ) ( not ( = ?AUTO_424 ?AUTO_425 ) ) ( not ( = ?AUTO_424 ?AUTO_426 ) ) ( not ( = ?AUTO_425 ?AUTO_426 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_425 ?AUTO_426 )
      ( MAKE-ON-TABLE ?AUTO_423 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_423 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_427 - BLOCK
    )
    :vars
    (
      ?AUTO_428 - BLOCK
      ?AUTO_430 - BLOCK
      ?AUTO_429 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_427 ?AUTO_428 ) ( not ( = ?AUTO_427 ?AUTO_428 ) ) ( CLEAR ?AUTO_430 ) ( not ( = ?AUTO_427 ?AUTO_429 ) ) ( not ( = ?AUTO_427 ?AUTO_430 ) ) ( not ( = ?AUTO_428 ?AUTO_429 ) ) ( not ( = ?AUTO_428 ?AUTO_430 ) ) ( not ( = ?AUTO_429 ?AUTO_430 ) ) ( ON ?AUTO_429 ?AUTO_427 ) ( CLEAR ?AUTO_429 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_429 ?AUTO_427 )
      ( MAKE-ON-TABLE ?AUTO_427 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_427 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_431 - BLOCK
    )
    :vars
    (
      ?AUTO_432 - BLOCK
      ?AUTO_433 - BLOCK
      ?AUTO_434 - BLOCK
      ?AUTO_435 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_431 ?AUTO_432 ) ( not ( = ?AUTO_431 ?AUTO_432 ) ) ( not ( = ?AUTO_431 ?AUTO_433 ) ) ( not ( = ?AUTO_431 ?AUTO_434 ) ) ( not ( = ?AUTO_432 ?AUTO_433 ) ) ( not ( = ?AUTO_432 ?AUTO_434 ) ) ( not ( = ?AUTO_433 ?AUTO_434 ) ) ( ON ?AUTO_433 ?AUTO_431 ) ( CLEAR ?AUTO_433 ) ( HOLDING ?AUTO_434 ) ( CLEAR ?AUTO_435 ) ( not ( = ?AUTO_431 ?AUTO_435 ) ) ( not ( = ?AUTO_432 ?AUTO_435 ) ) ( not ( = ?AUTO_433 ?AUTO_435 ) ) ( not ( = ?AUTO_434 ?AUTO_435 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_434 ?AUTO_435 )
      ( MAKE-ON-TABLE ?AUTO_431 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_431 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_449 - BLOCK
      ?AUTO_450 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_449 ) ( CLEAR ?AUTO_450 ) ( not ( = ?AUTO_449 ?AUTO_450 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_449 ?AUTO_450 )
      ( MAKE-ON-VERIFY ?AUTO_449 ?AUTO_450 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_451 - BLOCK
      ?AUTO_452 - BLOCK
    )
    :vars
    (
      ?AUTO_453 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_452 ) ( not ( = ?AUTO_451 ?AUTO_452 ) ) ( ON ?AUTO_451 ?AUTO_453 ) ( CLEAR ?AUTO_451 ) ( HAND-EMPTY ) ( not ( = ?AUTO_451 ?AUTO_453 ) ) ( not ( = ?AUTO_452 ?AUTO_453 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_451 ?AUTO_453 )
      ( MAKE-ON ?AUTO_451 ?AUTO_452 )
      ( MAKE-ON-VERIFY ?AUTO_451 ?AUTO_452 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_454 - BLOCK
      ?AUTO_455 - BLOCK
    )
    :vars
    (
      ?AUTO_456 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_454 ?AUTO_455 ) ) ( ON ?AUTO_454 ?AUTO_456 ) ( CLEAR ?AUTO_454 ) ( not ( = ?AUTO_454 ?AUTO_456 ) ) ( not ( = ?AUTO_455 ?AUTO_456 ) ) ( HOLDING ?AUTO_455 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_455 )
      ( MAKE-ON ?AUTO_454 ?AUTO_455 )
      ( MAKE-ON-VERIFY ?AUTO_454 ?AUTO_455 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_500 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_500 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_500 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_500 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_501 - BLOCK
    )
    :vars
    (
      ?AUTO_502 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_501 ?AUTO_502 ) ( CLEAR ?AUTO_501 ) ( HAND-EMPTY ) ( not ( = ?AUTO_501 ?AUTO_502 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_501 ?AUTO_502 )
      ( MAKE-ON-TABLE ?AUTO_501 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_501 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_503 - BLOCK
    )
    :vars
    (
      ?AUTO_504 - BLOCK
      ?AUTO_505 - BLOCK
      ?AUTO_506 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_503 ?AUTO_504 ) ( CLEAR ?AUTO_503 ) ( not ( = ?AUTO_503 ?AUTO_504 ) ) ( HOLDING ?AUTO_505 ) ( CLEAR ?AUTO_506 ) ( not ( = ?AUTO_503 ?AUTO_505 ) ) ( not ( = ?AUTO_503 ?AUTO_506 ) ) ( not ( = ?AUTO_504 ?AUTO_505 ) ) ( not ( = ?AUTO_504 ?AUTO_506 ) ) ( not ( = ?AUTO_505 ?AUTO_506 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_505 ?AUTO_506 )
      ( MAKE-ON-TABLE ?AUTO_503 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_503 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_509 - BLOCK
    )
    :vars
    (
      ?AUTO_511 - BLOCK
      ?AUTO_510 - BLOCK
      ?AUTO_512 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_509 ?AUTO_511 ) ( not ( = ?AUTO_509 ?AUTO_511 ) ) ( CLEAR ?AUTO_510 ) ( not ( = ?AUTO_509 ?AUTO_512 ) ) ( not ( = ?AUTO_509 ?AUTO_510 ) ) ( not ( = ?AUTO_511 ?AUTO_512 ) ) ( not ( = ?AUTO_511 ?AUTO_510 ) ) ( not ( = ?AUTO_512 ?AUTO_510 ) ) ( ON ?AUTO_512 ?AUTO_509 ) ( CLEAR ?AUTO_512 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_512 ?AUTO_509 )
      ( MAKE-ON-TABLE ?AUTO_509 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_509 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_513 - BLOCK
    )
    :vars
    (
      ?AUTO_514 - BLOCK
      ?AUTO_515 - BLOCK
      ?AUTO_516 - BLOCK
      ?AUTO_517 - BLOCK
      ?AUTO_518 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_513 ?AUTO_514 ) ( not ( = ?AUTO_513 ?AUTO_514 ) ) ( CLEAR ?AUTO_515 ) ( not ( = ?AUTO_513 ?AUTO_516 ) ) ( not ( = ?AUTO_513 ?AUTO_515 ) ) ( not ( = ?AUTO_514 ?AUTO_516 ) ) ( not ( = ?AUTO_514 ?AUTO_515 ) ) ( not ( = ?AUTO_516 ?AUTO_515 ) ) ( ON ?AUTO_516 ?AUTO_513 ) ( CLEAR ?AUTO_516 ) ( HOLDING ?AUTO_517 ) ( CLEAR ?AUTO_518 ) ( not ( = ?AUTO_513 ?AUTO_517 ) ) ( not ( = ?AUTO_513 ?AUTO_518 ) ) ( not ( = ?AUTO_514 ?AUTO_517 ) ) ( not ( = ?AUTO_514 ?AUTO_518 ) ) ( not ( = ?AUTO_515 ?AUTO_517 ) ) ( not ( = ?AUTO_515 ?AUTO_518 ) ) ( not ( = ?AUTO_516 ?AUTO_517 ) ) ( not ( = ?AUTO_516 ?AUTO_518 ) ) ( not ( = ?AUTO_517 ?AUTO_518 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_517 ?AUTO_518 )
      ( MAKE-ON-TABLE ?AUTO_513 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_513 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_519 - BLOCK
    )
    :vars
    (
      ?AUTO_521 - BLOCK
      ?AUTO_520 - BLOCK
      ?AUTO_524 - BLOCK
      ?AUTO_523 - BLOCK
      ?AUTO_522 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_519 ?AUTO_521 ) ( not ( = ?AUTO_519 ?AUTO_521 ) ) ( CLEAR ?AUTO_520 ) ( not ( = ?AUTO_519 ?AUTO_524 ) ) ( not ( = ?AUTO_519 ?AUTO_520 ) ) ( not ( = ?AUTO_521 ?AUTO_524 ) ) ( not ( = ?AUTO_521 ?AUTO_520 ) ) ( not ( = ?AUTO_524 ?AUTO_520 ) ) ( ON ?AUTO_524 ?AUTO_519 ) ( CLEAR ?AUTO_523 ) ( not ( = ?AUTO_519 ?AUTO_522 ) ) ( not ( = ?AUTO_519 ?AUTO_523 ) ) ( not ( = ?AUTO_521 ?AUTO_522 ) ) ( not ( = ?AUTO_521 ?AUTO_523 ) ) ( not ( = ?AUTO_520 ?AUTO_522 ) ) ( not ( = ?AUTO_520 ?AUTO_523 ) ) ( not ( = ?AUTO_524 ?AUTO_522 ) ) ( not ( = ?AUTO_524 ?AUTO_523 ) ) ( not ( = ?AUTO_522 ?AUTO_523 ) ) ( ON ?AUTO_522 ?AUTO_524 ) ( CLEAR ?AUTO_522 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_522 ?AUTO_524 )
      ( MAKE-ON-TABLE ?AUTO_519 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_519 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_525 - BLOCK
    )
    :vars
    (
      ?AUTO_527 - BLOCK
      ?AUTO_526 - BLOCK
      ?AUTO_530 - BLOCK
      ?AUTO_528 - BLOCK
      ?AUTO_529 - BLOCK
      ?AUTO_531 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_525 ?AUTO_527 ) ( not ( = ?AUTO_525 ?AUTO_527 ) ) ( CLEAR ?AUTO_526 ) ( not ( = ?AUTO_525 ?AUTO_530 ) ) ( not ( = ?AUTO_525 ?AUTO_526 ) ) ( not ( = ?AUTO_527 ?AUTO_530 ) ) ( not ( = ?AUTO_527 ?AUTO_526 ) ) ( not ( = ?AUTO_530 ?AUTO_526 ) ) ( ON ?AUTO_530 ?AUTO_525 ) ( not ( = ?AUTO_525 ?AUTO_528 ) ) ( not ( = ?AUTO_525 ?AUTO_529 ) ) ( not ( = ?AUTO_527 ?AUTO_528 ) ) ( not ( = ?AUTO_527 ?AUTO_529 ) ) ( not ( = ?AUTO_526 ?AUTO_528 ) ) ( not ( = ?AUTO_526 ?AUTO_529 ) ) ( not ( = ?AUTO_530 ?AUTO_528 ) ) ( not ( = ?AUTO_530 ?AUTO_529 ) ) ( not ( = ?AUTO_528 ?AUTO_529 ) ) ( ON ?AUTO_528 ?AUTO_530 ) ( CLEAR ?AUTO_528 ) ( HOLDING ?AUTO_529 ) ( CLEAR ?AUTO_531 ) ( not ( = ?AUTO_525 ?AUTO_531 ) ) ( not ( = ?AUTO_527 ?AUTO_531 ) ) ( not ( = ?AUTO_526 ?AUTO_531 ) ) ( not ( = ?AUTO_530 ?AUTO_531 ) ) ( not ( = ?AUTO_528 ?AUTO_531 ) ) ( not ( = ?AUTO_529 ?AUTO_531 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_529 ?AUTO_531 )
      ( MAKE-ON-TABLE ?AUTO_525 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_525 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_544 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_544 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_544 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_544 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_545 - BLOCK
    )
    :vars
    (
      ?AUTO_546 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_545 ?AUTO_546 ) ( CLEAR ?AUTO_545 ) ( HAND-EMPTY ) ( not ( = ?AUTO_545 ?AUTO_546 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_545 ?AUTO_546 )
      ( MAKE-ON-TABLE ?AUTO_545 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_545 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_547 - BLOCK
    )
    :vars
    (
      ?AUTO_548 - BLOCK
      ?AUTO_549 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_547 ?AUTO_548 ) ( CLEAR ?AUTO_547 ) ( not ( = ?AUTO_547 ?AUTO_548 ) ) ( HOLDING ?AUTO_549 ) ( not ( = ?AUTO_547 ?AUTO_549 ) ) ( not ( = ?AUTO_548 ?AUTO_549 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_549 )
      ( MAKE-ON-TABLE ?AUTO_547 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_547 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_550 - BLOCK
    )
    :vars
    (
      ?AUTO_551 - BLOCK
      ?AUTO_552 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_550 ?AUTO_551 ) ( not ( = ?AUTO_550 ?AUTO_551 ) ) ( not ( = ?AUTO_550 ?AUTO_552 ) ) ( not ( = ?AUTO_551 ?AUTO_552 ) ) ( ON ?AUTO_552 ?AUTO_550 ) ( CLEAR ?AUTO_552 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_552 ?AUTO_550 )
      ( MAKE-ON-TABLE ?AUTO_550 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_550 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_553 - BLOCK
    )
    :vars
    (
      ?AUTO_554 - BLOCK
      ?AUTO_555 - BLOCK
      ?AUTO_556 - BLOCK
      ?AUTO_557 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_553 ?AUTO_554 ) ( not ( = ?AUTO_553 ?AUTO_554 ) ) ( not ( = ?AUTO_553 ?AUTO_555 ) ) ( not ( = ?AUTO_554 ?AUTO_555 ) ) ( ON ?AUTO_555 ?AUTO_553 ) ( CLEAR ?AUTO_555 ) ( HOLDING ?AUTO_556 ) ( CLEAR ?AUTO_557 ) ( not ( = ?AUTO_553 ?AUTO_556 ) ) ( not ( = ?AUTO_553 ?AUTO_557 ) ) ( not ( = ?AUTO_554 ?AUTO_556 ) ) ( not ( = ?AUTO_554 ?AUTO_557 ) ) ( not ( = ?AUTO_555 ?AUTO_556 ) ) ( not ( = ?AUTO_555 ?AUTO_557 ) ) ( not ( = ?AUTO_556 ?AUTO_557 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_556 ?AUTO_557 )
      ( MAKE-ON-TABLE ?AUTO_553 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_553 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_560 - BLOCK
    )
    :vars
    (
      ?AUTO_564 - BLOCK
      ?AUTO_563 - BLOCK
      ?AUTO_562 - BLOCK
      ?AUTO_561 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_560 ?AUTO_564 ) ( not ( = ?AUTO_560 ?AUTO_564 ) ) ( not ( = ?AUTO_560 ?AUTO_563 ) ) ( not ( = ?AUTO_564 ?AUTO_563 ) ) ( ON ?AUTO_563 ?AUTO_560 ) ( CLEAR ?AUTO_562 ) ( not ( = ?AUTO_560 ?AUTO_561 ) ) ( not ( = ?AUTO_560 ?AUTO_562 ) ) ( not ( = ?AUTO_564 ?AUTO_561 ) ) ( not ( = ?AUTO_564 ?AUTO_562 ) ) ( not ( = ?AUTO_563 ?AUTO_561 ) ) ( not ( = ?AUTO_563 ?AUTO_562 ) ) ( not ( = ?AUTO_561 ?AUTO_562 ) ) ( ON ?AUTO_561 ?AUTO_563 ) ( CLEAR ?AUTO_561 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_561 ?AUTO_563 )
      ( MAKE-ON-TABLE ?AUTO_560 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_560 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_565 - BLOCK
    )
    :vars
    (
      ?AUTO_566 - BLOCK
      ?AUTO_567 - BLOCK
      ?AUTO_569 - BLOCK
      ?AUTO_568 - BLOCK
      ?AUTO_570 - BLOCK
      ?AUTO_571 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_565 ?AUTO_566 ) ( not ( = ?AUTO_565 ?AUTO_566 ) ) ( not ( = ?AUTO_565 ?AUTO_567 ) ) ( not ( = ?AUTO_566 ?AUTO_567 ) ) ( ON ?AUTO_567 ?AUTO_565 ) ( CLEAR ?AUTO_569 ) ( not ( = ?AUTO_565 ?AUTO_568 ) ) ( not ( = ?AUTO_565 ?AUTO_569 ) ) ( not ( = ?AUTO_566 ?AUTO_568 ) ) ( not ( = ?AUTO_566 ?AUTO_569 ) ) ( not ( = ?AUTO_567 ?AUTO_568 ) ) ( not ( = ?AUTO_567 ?AUTO_569 ) ) ( not ( = ?AUTO_568 ?AUTO_569 ) ) ( ON ?AUTO_568 ?AUTO_567 ) ( CLEAR ?AUTO_568 ) ( HOLDING ?AUTO_570 ) ( CLEAR ?AUTO_571 ) ( not ( = ?AUTO_565 ?AUTO_570 ) ) ( not ( = ?AUTO_565 ?AUTO_571 ) ) ( not ( = ?AUTO_566 ?AUTO_570 ) ) ( not ( = ?AUTO_566 ?AUTO_571 ) ) ( not ( = ?AUTO_567 ?AUTO_570 ) ) ( not ( = ?AUTO_567 ?AUTO_571 ) ) ( not ( = ?AUTO_569 ?AUTO_570 ) ) ( not ( = ?AUTO_569 ?AUTO_571 ) ) ( not ( = ?AUTO_568 ?AUTO_570 ) ) ( not ( = ?AUTO_568 ?AUTO_571 ) ) ( not ( = ?AUTO_570 ?AUTO_571 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_570 ?AUTO_571 )
      ( MAKE-ON-TABLE ?AUTO_565 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_565 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_572 - BLOCK
    )
    :vars
    (
      ?AUTO_576 - BLOCK
      ?AUTO_574 - BLOCK
      ?AUTO_575 - BLOCK
      ?AUTO_573 - BLOCK
      ?AUTO_578 - BLOCK
      ?AUTO_577 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_572 ?AUTO_576 ) ( not ( = ?AUTO_572 ?AUTO_576 ) ) ( not ( = ?AUTO_572 ?AUTO_574 ) ) ( not ( = ?AUTO_576 ?AUTO_574 ) ) ( ON ?AUTO_574 ?AUTO_572 ) ( CLEAR ?AUTO_575 ) ( not ( = ?AUTO_572 ?AUTO_573 ) ) ( not ( = ?AUTO_572 ?AUTO_575 ) ) ( not ( = ?AUTO_576 ?AUTO_573 ) ) ( not ( = ?AUTO_576 ?AUTO_575 ) ) ( not ( = ?AUTO_574 ?AUTO_573 ) ) ( not ( = ?AUTO_574 ?AUTO_575 ) ) ( not ( = ?AUTO_573 ?AUTO_575 ) ) ( ON ?AUTO_573 ?AUTO_574 ) ( CLEAR ?AUTO_578 ) ( not ( = ?AUTO_572 ?AUTO_577 ) ) ( not ( = ?AUTO_572 ?AUTO_578 ) ) ( not ( = ?AUTO_576 ?AUTO_577 ) ) ( not ( = ?AUTO_576 ?AUTO_578 ) ) ( not ( = ?AUTO_574 ?AUTO_577 ) ) ( not ( = ?AUTO_574 ?AUTO_578 ) ) ( not ( = ?AUTO_575 ?AUTO_577 ) ) ( not ( = ?AUTO_575 ?AUTO_578 ) ) ( not ( = ?AUTO_573 ?AUTO_577 ) ) ( not ( = ?AUTO_573 ?AUTO_578 ) ) ( not ( = ?AUTO_577 ?AUTO_578 ) ) ( ON ?AUTO_577 ?AUTO_573 ) ( CLEAR ?AUTO_577 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_577 ?AUTO_573 )
      ( MAKE-ON-TABLE ?AUTO_572 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_572 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_579 - BLOCK
    )
    :vars
    (
      ?AUTO_584 - BLOCK
      ?AUTO_582 - BLOCK
      ?AUTO_583 - BLOCK
      ?AUTO_580 - BLOCK
      ?AUTO_581 - BLOCK
      ?AUTO_585 - BLOCK
      ?AUTO_586 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_579 ?AUTO_584 ) ( not ( = ?AUTO_579 ?AUTO_584 ) ) ( not ( = ?AUTO_579 ?AUTO_582 ) ) ( not ( = ?AUTO_584 ?AUTO_582 ) ) ( ON ?AUTO_582 ?AUTO_579 ) ( CLEAR ?AUTO_583 ) ( not ( = ?AUTO_579 ?AUTO_580 ) ) ( not ( = ?AUTO_579 ?AUTO_583 ) ) ( not ( = ?AUTO_584 ?AUTO_580 ) ) ( not ( = ?AUTO_584 ?AUTO_583 ) ) ( not ( = ?AUTO_582 ?AUTO_580 ) ) ( not ( = ?AUTO_582 ?AUTO_583 ) ) ( not ( = ?AUTO_580 ?AUTO_583 ) ) ( ON ?AUTO_580 ?AUTO_582 ) ( not ( = ?AUTO_579 ?AUTO_581 ) ) ( not ( = ?AUTO_579 ?AUTO_585 ) ) ( not ( = ?AUTO_584 ?AUTO_581 ) ) ( not ( = ?AUTO_584 ?AUTO_585 ) ) ( not ( = ?AUTO_582 ?AUTO_581 ) ) ( not ( = ?AUTO_582 ?AUTO_585 ) ) ( not ( = ?AUTO_583 ?AUTO_581 ) ) ( not ( = ?AUTO_583 ?AUTO_585 ) ) ( not ( = ?AUTO_580 ?AUTO_581 ) ) ( not ( = ?AUTO_580 ?AUTO_585 ) ) ( not ( = ?AUTO_581 ?AUTO_585 ) ) ( ON ?AUTO_581 ?AUTO_580 ) ( CLEAR ?AUTO_581 ) ( HOLDING ?AUTO_585 ) ( CLEAR ?AUTO_586 ) ( not ( = ?AUTO_579 ?AUTO_586 ) ) ( not ( = ?AUTO_584 ?AUTO_586 ) ) ( not ( = ?AUTO_582 ?AUTO_586 ) ) ( not ( = ?AUTO_583 ?AUTO_586 ) ) ( not ( = ?AUTO_580 ?AUTO_586 ) ) ( not ( = ?AUTO_581 ?AUTO_586 ) ) ( not ( = ?AUTO_585 ?AUTO_586 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_585 ?AUTO_586 )
      ( MAKE-ON-TABLE ?AUTO_579 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_579 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_600 - BLOCK
      ?AUTO_601 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_600 ) ( CLEAR ?AUTO_601 ) ( not ( = ?AUTO_600 ?AUTO_601 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_600 ?AUTO_601 )
      ( MAKE-ON-VERIFY ?AUTO_600 ?AUTO_601 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_602 - BLOCK
      ?AUTO_603 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_603 ) ( not ( = ?AUTO_602 ?AUTO_603 ) ) ( ON-TABLE ?AUTO_602 ) ( CLEAR ?AUTO_602 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_602 )
      ( MAKE-ON ?AUTO_602 ?AUTO_603 )
      ( MAKE-ON-VERIFY ?AUTO_602 ?AUTO_603 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_604 - BLOCK
      ?AUTO_605 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_604 ?AUTO_605 ) ) ( ON-TABLE ?AUTO_604 ) ( CLEAR ?AUTO_604 ) ( HOLDING ?AUTO_605 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_605 )
      ( MAKE-ON ?AUTO_604 ?AUTO_605 )
      ( MAKE-ON-VERIFY ?AUTO_604 ?AUTO_605 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_717 - BLOCK
      ?AUTO_718 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_717 ) ( CLEAR ?AUTO_718 ) ( not ( = ?AUTO_717 ?AUTO_718 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_717 ?AUTO_718 )
      ( MAKE-ON-VERIFY ?AUTO_717 ?AUTO_718 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_719 - BLOCK
      ?AUTO_720 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_720 ) ( not ( = ?AUTO_719 ?AUTO_720 ) ) ( ON-TABLE ?AUTO_719 ) ( CLEAR ?AUTO_719 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_719 )
      ( MAKE-ON ?AUTO_719 ?AUTO_720 )
      ( MAKE-ON-VERIFY ?AUTO_719 ?AUTO_720 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_721 - BLOCK
      ?AUTO_722 - BLOCK
    )
    :vars
    (
      ?AUTO_723 - BLOCK
      ?AUTO_724 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_722 ) ( not ( = ?AUTO_721 ?AUTO_722 ) ) ( ON-TABLE ?AUTO_721 ) ( CLEAR ?AUTO_721 ) ( HOLDING ?AUTO_723 ) ( CLEAR ?AUTO_724 ) ( not ( = ?AUTO_721 ?AUTO_723 ) ) ( not ( = ?AUTO_721 ?AUTO_724 ) ) ( not ( = ?AUTO_722 ?AUTO_723 ) ) ( not ( = ?AUTO_722 ?AUTO_724 ) ) ( not ( = ?AUTO_723 ?AUTO_724 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_723 ?AUTO_724 )
      ( MAKE-ON ?AUTO_721 ?AUTO_722 )
      ( MAKE-ON-VERIFY ?AUTO_721 ?AUTO_722 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_729 - BLOCK
      ?AUTO_730 - BLOCK
    )
    :vars
    (
      ?AUTO_732 - BLOCK
      ?AUTO_731 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_730 ) ( not ( = ?AUTO_729 ?AUTO_730 ) ) ( ON-TABLE ?AUTO_729 ) ( CLEAR ?AUTO_732 ) ( not ( = ?AUTO_729 ?AUTO_731 ) ) ( not ( = ?AUTO_729 ?AUTO_732 ) ) ( not ( = ?AUTO_730 ?AUTO_731 ) ) ( not ( = ?AUTO_730 ?AUTO_732 ) ) ( not ( = ?AUTO_731 ?AUTO_732 ) ) ( ON ?AUTO_731 ?AUTO_729 ) ( CLEAR ?AUTO_731 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_731 ?AUTO_729 )
      ( MAKE-ON ?AUTO_729 ?AUTO_730 )
      ( MAKE-ON-VERIFY ?AUTO_729 ?AUTO_730 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_733 - BLOCK
      ?AUTO_734 - BLOCK
    )
    :vars
    (
      ?AUTO_736 - BLOCK
      ?AUTO_735 - BLOCK
      ?AUTO_737 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_734 ) ( not ( = ?AUTO_733 ?AUTO_734 ) ) ( ON-TABLE ?AUTO_733 ) ( CLEAR ?AUTO_736 ) ( not ( = ?AUTO_733 ?AUTO_735 ) ) ( not ( = ?AUTO_733 ?AUTO_736 ) ) ( not ( = ?AUTO_734 ?AUTO_735 ) ) ( not ( = ?AUTO_734 ?AUTO_736 ) ) ( not ( = ?AUTO_735 ?AUTO_736 ) ) ( ON ?AUTO_735 ?AUTO_733 ) ( CLEAR ?AUTO_735 ) ( HOLDING ?AUTO_737 ) ( not ( = ?AUTO_733 ?AUTO_737 ) ) ( not ( = ?AUTO_734 ?AUTO_737 ) ) ( not ( = ?AUTO_736 ?AUTO_737 ) ) ( not ( = ?AUTO_735 ?AUTO_737 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_737 )
      ( MAKE-ON ?AUTO_733 ?AUTO_734 )
      ( MAKE-ON-VERIFY ?AUTO_733 ?AUTO_734 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_738 - BLOCK
      ?AUTO_739 - BLOCK
    )
    :vars
    (
      ?AUTO_741 - BLOCK
      ?AUTO_740 - BLOCK
      ?AUTO_742 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_739 ) ( not ( = ?AUTO_738 ?AUTO_739 ) ) ( ON-TABLE ?AUTO_738 ) ( CLEAR ?AUTO_741 ) ( not ( = ?AUTO_738 ?AUTO_740 ) ) ( not ( = ?AUTO_738 ?AUTO_741 ) ) ( not ( = ?AUTO_739 ?AUTO_740 ) ) ( not ( = ?AUTO_739 ?AUTO_741 ) ) ( not ( = ?AUTO_740 ?AUTO_741 ) ) ( ON ?AUTO_740 ?AUTO_738 ) ( not ( = ?AUTO_738 ?AUTO_742 ) ) ( not ( = ?AUTO_739 ?AUTO_742 ) ) ( not ( = ?AUTO_741 ?AUTO_742 ) ) ( not ( = ?AUTO_740 ?AUTO_742 ) ) ( ON ?AUTO_742 ?AUTO_740 ) ( CLEAR ?AUTO_742 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_742 ?AUTO_740 )
      ( MAKE-ON ?AUTO_738 ?AUTO_739 )
      ( MAKE-ON-VERIFY ?AUTO_738 ?AUTO_739 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_743 - BLOCK
      ?AUTO_744 - BLOCK
    )
    :vars
    (
      ?AUTO_746 - BLOCK
      ?AUTO_745 - BLOCK
      ?AUTO_747 - BLOCK
      ?AUTO_748 - BLOCK
      ?AUTO_749 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_744 ) ( not ( = ?AUTO_743 ?AUTO_744 ) ) ( ON-TABLE ?AUTO_743 ) ( CLEAR ?AUTO_746 ) ( not ( = ?AUTO_743 ?AUTO_745 ) ) ( not ( = ?AUTO_743 ?AUTO_746 ) ) ( not ( = ?AUTO_744 ?AUTO_745 ) ) ( not ( = ?AUTO_744 ?AUTO_746 ) ) ( not ( = ?AUTO_745 ?AUTO_746 ) ) ( ON ?AUTO_745 ?AUTO_743 ) ( not ( = ?AUTO_743 ?AUTO_747 ) ) ( not ( = ?AUTO_744 ?AUTO_747 ) ) ( not ( = ?AUTO_746 ?AUTO_747 ) ) ( not ( = ?AUTO_745 ?AUTO_747 ) ) ( ON ?AUTO_747 ?AUTO_745 ) ( CLEAR ?AUTO_747 ) ( HOLDING ?AUTO_748 ) ( CLEAR ?AUTO_749 ) ( not ( = ?AUTO_743 ?AUTO_748 ) ) ( not ( = ?AUTO_743 ?AUTO_749 ) ) ( not ( = ?AUTO_744 ?AUTO_748 ) ) ( not ( = ?AUTO_744 ?AUTO_749 ) ) ( not ( = ?AUTO_746 ?AUTO_748 ) ) ( not ( = ?AUTO_746 ?AUTO_749 ) ) ( not ( = ?AUTO_745 ?AUTO_748 ) ) ( not ( = ?AUTO_745 ?AUTO_749 ) ) ( not ( = ?AUTO_747 ?AUTO_748 ) ) ( not ( = ?AUTO_747 ?AUTO_749 ) ) ( not ( = ?AUTO_748 ?AUTO_749 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_748 ?AUTO_749 )
      ( MAKE-ON ?AUTO_743 ?AUTO_744 )
      ( MAKE-ON-VERIFY ?AUTO_743 ?AUTO_744 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_750 - BLOCK
      ?AUTO_751 - BLOCK
    )
    :vars
    (
      ?AUTO_752 - BLOCK
      ?AUTO_753 - BLOCK
      ?AUTO_756 - BLOCK
      ?AUTO_755 - BLOCK
      ?AUTO_754 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_750 ?AUTO_751 ) ) ( ON-TABLE ?AUTO_750 ) ( CLEAR ?AUTO_752 ) ( not ( = ?AUTO_750 ?AUTO_753 ) ) ( not ( = ?AUTO_750 ?AUTO_752 ) ) ( not ( = ?AUTO_751 ?AUTO_753 ) ) ( not ( = ?AUTO_751 ?AUTO_752 ) ) ( not ( = ?AUTO_753 ?AUTO_752 ) ) ( ON ?AUTO_753 ?AUTO_750 ) ( not ( = ?AUTO_750 ?AUTO_756 ) ) ( not ( = ?AUTO_751 ?AUTO_756 ) ) ( not ( = ?AUTO_752 ?AUTO_756 ) ) ( not ( = ?AUTO_753 ?AUTO_756 ) ) ( ON ?AUTO_756 ?AUTO_753 ) ( CLEAR ?AUTO_756 ) ( CLEAR ?AUTO_755 ) ( not ( = ?AUTO_750 ?AUTO_754 ) ) ( not ( = ?AUTO_750 ?AUTO_755 ) ) ( not ( = ?AUTO_751 ?AUTO_754 ) ) ( not ( = ?AUTO_751 ?AUTO_755 ) ) ( not ( = ?AUTO_752 ?AUTO_754 ) ) ( not ( = ?AUTO_752 ?AUTO_755 ) ) ( not ( = ?AUTO_753 ?AUTO_754 ) ) ( not ( = ?AUTO_753 ?AUTO_755 ) ) ( not ( = ?AUTO_756 ?AUTO_754 ) ) ( not ( = ?AUTO_756 ?AUTO_755 ) ) ( not ( = ?AUTO_754 ?AUTO_755 ) ) ( ON ?AUTO_754 ?AUTO_751 ) ( CLEAR ?AUTO_754 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_754 ?AUTO_751 )
      ( MAKE-ON ?AUTO_750 ?AUTO_751 )
      ( MAKE-ON-VERIFY ?AUTO_750 ?AUTO_751 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_757 - BLOCK
      ?AUTO_758 - BLOCK
    )
    :vars
    (
      ?AUTO_760 - BLOCK
      ?AUTO_759 - BLOCK
      ?AUTO_761 - BLOCK
      ?AUTO_763 - BLOCK
      ?AUTO_762 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_757 ?AUTO_758 ) ) ( ON-TABLE ?AUTO_757 ) ( CLEAR ?AUTO_760 ) ( not ( = ?AUTO_757 ?AUTO_759 ) ) ( not ( = ?AUTO_757 ?AUTO_760 ) ) ( not ( = ?AUTO_758 ?AUTO_759 ) ) ( not ( = ?AUTO_758 ?AUTO_760 ) ) ( not ( = ?AUTO_759 ?AUTO_760 ) ) ( ON ?AUTO_759 ?AUTO_757 ) ( not ( = ?AUTO_757 ?AUTO_761 ) ) ( not ( = ?AUTO_758 ?AUTO_761 ) ) ( not ( = ?AUTO_760 ?AUTO_761 ) ) ( not ( = ?AUTO_759 ?AUTO_761 ) ) ( ON ?AUTO_761 ?AUTO_759 ) ( CLEAR ?AUTO_761 ) ( not ( = ?AUTO_757 ?AUTO_763 ) ) ( not ( = ?AUTO_757 ?AUTO_762 ) ) ( not ( = ?AUTO_758 ?AUTO_763 ) ) ( not ( = ?AUTO_758 ?AUTO_762 ) ) ( not ( = ?AUTO_760 ?AUTO_763 ) ) ( not ( = ?AUTO_760 ?AUTO_762 ) ) ( not ( = ?AUTO_759 ?AUTO_763 ) ) ( not ( = ?AUTO_759 ?AUTO_762 ) ) ( not ( = ?AUTO_761 ?AUTO_763 ) ) ( not ( = ?AUTO_761 ?AUTO_762 ) ) ( not ( = ?AUTO_763 ?AUTO_762 ) ) ( ON ?AUTO_763 ?AUTO_758 ) ( CLEAR ?AUTO_763 ) ( HOLDING ?AUTO_762 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_762 )
      ( MAKE-ON ?AUTO_757 ?AUTO_758 )
      ( MAKE-ON-VERIFY ?AUTO_757 ?AUTO_758 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_764 - BLOCK
      ?AUTO_765 - BLOCK
    )
    :vars
    (
      ?AUTO_768 - BLOCK
      ?AUTO_769 - BLOCK
      ?AUTO_770 - BLOCK
      ?AUTO_767 - BLOCK
      ?AUTO_766 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_764 ?AUTO_765 ) ) ( ON-TABLE ?AUTO_764 ) ( CLEAR ?AUTO_768 ) ( not ( = ?AUTO_764 ?AUTO_769 ) ) ( not ( = ?AUTO_764 ?AUTO_768 ) ) ( not ( = ?AUTO_765 ?AUTO_769 ) ) ( not ( = ?AUTO_765 ?AUTO_768 ) ) ( not ( = ?AUTO_769 ?AUTO_768 ) ) ( ON ?AUTO_769 ?AUTO_764 ) ( not ( = ?AUTO_764 ?AUTO_770 ) ) ( not ( = ?AUTO_765 ?AUTO_770 ) ) ( not ( = ?AUTO_768 ?AUTO_770 ) ) ( not ( = ?AUTO_769 ?AUTO_770 ) ) ( ON ?AUTO_770 ?AUTO_769 ) ( not ( = ?AUTO_764 ?AUTO_767 ) ) ( not ( = ?AUTO_764 ?AUTO_766 ) ) ( not ( = ?AUTO_765 ?AUTO_767 ) ) ( not ( = ?AUTO_765 ?AUTO_766 ) ) ( not ( = ?AUTO_768 ?AUTO_767 ) ) ( not ( = ?AUTO_768 ?AUTO_766 ) ) ( not ( = ?AUTO_769 ?AUTO_767 ) ) ( not ( = ?AUTO_769 ?AUTO_766 ) ) ( not ( = ?AUTO_770 ?AUTO_767 ) ) ( not ( = ?AUTO_770 ?AUTO_766 ) ) ( not ( = ?AUTO_767 ?AUTO_766 ) ) ( ON ?AUTO_767 ?AUTO_765 ) ( CLEAR ?AUTO_767 ) ( ON ?AUTO_766 ?AUTO_770 ) ( CLEAR ?AUTO_766 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_766 ?AUTO_770 )
      ( MAKE-ON ?AUTO_764 ?AUTO_765 )
      ( MAKE-ON-VERIFY ?AUTO_764 ?AUTO_765 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_771 - BLOCK
      ?AUTO_772 - BLOCK
    )
    :vars
    (
      ?AUTO_776 - BLOCK
      ?AUTO_777 - BLOCK
      ?AUTO_775 - BLOCK
      ?AUTO_773 - BLOCK
      ?AUTO_774 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_771 ?AUTO_772 ) ) ( ON-TABLE ?AUTO_771 ) ( CLEAR ?AUTO_776 ) ( not ( = ?AUTO_771 ?AUTO_777 ) ) ( not ( = ?AUTO_771 ?AUTO_776 ) ) ( not ( = ?AUTO_772 ?AUTO_777 ) ) ( not ( = ?AUTO_772 ?AUTO_776 ) ) ( not ( = ?AUTO_777 ?AUTO_776 ) ) ( ON ?AUTO_777 ?AUTO_771 ) ( not ( = ?AUTO_771 ?AUTO_775 ) ) ( not ( = ?AUTO_772 ?AUTO_775 ) ) ( not ( = ?AUTO_776 ?AUTO_775 ) ) ( not ( = ?AUTO_777 ?AUTO_775 ) ) ( ON ?AUTO_775 ?AUTO_777 ) ( not ( = ?AUTO_771 ?AUTO_773 ) ) ( not ( = ?AUTO_771 ?AUTO_774 ) ) ( not ( = ?AUTO_772 ?AUTO_773 ) ) ( not ( = ?AUTO_772 ?AUTO_774 ) ) ( not ( = ?AUTO_776 ?AUTO_773 ) ) ( not ( = ?AUTO_776 ?AUTO_774 ) ) ( not ( = ?AUTO_777 ?AUTO_773 ) ) ( not ( = ?AUTO_777 ?AUTO_774 ) ) ( not ( = ?AUTO_775 ?AUTO_773 ) ) ( not ( = ?AUTO_775 ?AUTO_774 ) ) ( not ( = ?AUTO_773 ?AUTO_774 ) ) ( ON ?AUTO_774 ?AUTO_775 ) ( CLEAR ?AUTO_774 ) ( HOLDING ?AUTO_773 ) ( CLEAR ?AUTO_772 ) )
    :subtasks
    ( ( !STACK ?AUTO_773 ?AUTO_772 )
      ( MAKE-ON ?AUTO_771 ?AUTO_772 )
      ( MAKE-ON-VERIFY ?AUTO_771 ?AUTO_772 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_778 - BLOCK
      ?AUTO_779 - BLOCK
    )
    :vars
    (
      ?AUTO_783 - BLOCK
      ?AUTO_782 - BLOCK
      ?AUTO_784 - BLOCK
      ?AUTO_780 - BLOCK
      ?AUTO_781 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_778 ?AUTO_779 ) ) ( ON-TABLE ?AUTO_778 ) ( CLEAR ?AUTO_783 ) ( not ( = ?AUTO_778 ?AUTO_782 ) ) ( not ( = ?AUTO_778 ?AUTO_783 ) ) ( not ( = ?AUTO_779 ?AUTO_782 ) ) ( not ( = ?AUTO_779 ?AUTO_783 ) ) ( not ( = ?AUTO_782 ?AUTO_783 ) ) ( ON ?AUTO_782 ?AUTO_778 ) ( not ( = ?AUTO_778 ?AUTO_784 ) ) ( not ( = ?AUTO_779 ?AUTO_784 ) ) ( not ( = ?AUTO_783 ?AUTO_784 ) ) ( not ( = ?AUTO_782 ?AUTO_784 ) ) ( ON ?AUTO_784 ?AUTO_782 ) ( not ( = ?AUTO_778 ?AUTO_780 ) ) ( not ( = ?AUTO_778 ?AUTO_781 ) ) ( not ( = ?AUTO_779 ?AUTO_780 ) ) ( not ( = ?AUTO_779 ?AUTO_781 ) ) ( not ( = ?AUTO_783 ?AUTO_780 ) ) ( not ( = ?AUTO_783 ?AUTO_781 ) ) ( not ( = ?AUTO_782 ?AUTO_780 ) ) ( not ( = ?AUTO_782 ?AUTO_781 ) ) ( not ( = ?AUTO_784 ?AUTO_780 ) ) ( not ( = ?AUTO_784 ?AUTO_781 ) ) ( not ( = ?AUTO_780 ?AUTO_781 ) ) ( ON ?AUTO_781 ?AUTO_784 ) ( CLEAR ?AUTO_779 ) ( ON ?AUTO_780 ?AUTO_781 ) ( CLEAR ?AUTO_780 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_780 ?AUTO_781 )
      ( MAKE-ON ?AUTO_778 ?AUTO_779 )
      ( MAKE-ON-VERIFY ?AUTO_778 ?AUTO_779 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_785 - BLOCK
      ?AUTO_786 - BLOCK
    )
    :vars
    (
      ?AUTO_791 - BLOCK
      ?AUTO_788 - BLOCK
      ?AUTO_789 - BLOCK
      ?AUTO_790 - BLOCK
      ?AUTO_787 - BLOCK
      ?AUTO_792 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_785 ?AUTO_786 ) ) ( ON-TABLE ?AUTO_785 ) ( CLEAR ?AUTO_791 ) ( not ( = ?AUTO_785 ?AUTO_788 ) ) ( not ( = ?AUTO_785 ?AUTO_791 ) ) ( not ( = ?AUTO_786 ?AUTO_788 ) ) ( not ( = ?AUTO_786 ?AUTO_791 ) ) ( not ( = ?AUTO_788 ?AUTO_791 ) ) ( ON ?AUTO_788 ?AUTO_785 ) ( not ( = ?AUTO_785 ?AUTO_789 ) ) ( not ( = ?AUTO_786 ?AUTO_789 ) ) ( not ( = ?AUTO_791 ?AUTO_789 ) ) ( not ( = ?AUTO_788 ?AUTO_789 ) ) ( ON ?AUTO_789 ?AUTO_788 ) ( not ( = ?AUTO_785 ?AUTO_790 ) ) ( not ( = ?AUTO_785 ?AUTO_787 ) ) ( not ( = ?AUTO_786 ?AUTO_790 ) ) ( not ( = ?AUTO_786 ?AUTO_787 ) ) ( not ( = ?AUTO_791 ?AUTO_790 ) ) ( not ( = ?AUTO_791 ?AUTO_787 ) ) ( not ( = ?AUTO_788 ?AUTO_790 ) ) ( not ( = ?AUTO_788 ?AUTO_787 ) ) ( not ( = ?AUTO_789 ?AUTO_790 ) ) ( not ( = ?AUTO_789 ?AUTO_787 ) ) ( not ( = ?AUTO_790 ?AUTO_787 ) ) ( ON ?AUTO_787 ?AUTO_789 ) ( ON ?AUTO_790 ?AUTO_787 ) ( CLEAR ?AUTO_790 ) ( HOLDING ?AUTO_786 ) ( CLEAR ?AUTO_792 ) ( not ( = ?AUTO_785 ?AUTO_792 ) ) ( not ( = ?AUTO_786 ?AUTO_792 ) ) ( not ( = ?AUTO_791 ?AUTO_792 ) ) ( not ( = ?AUTO_788 ?AUTO_792 ) ) ( not ( = ?AUTO_789 ?AUTO_792 ) ) ( not ( = ?AUTO_790 ?AUTO_792 ) ) ( not ( = ?AUTO_787 ?AUTO_792 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_786 ?AUTO_792 )
      ( MAKE-ON ?AUTO_785 ?AUTO_786 )
      ( MAKE-ON-VERIFY ?AUTO_785 ?AUTO_786 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_795 - BLOCK
      ?AUTO_796 - BLOCK
    )
    :vars
    (
      ?AUTO_800 - BLOCK
      ?AUTO_798 - BLOCK
      ?AUTO_797 - BLOCK
      ?AUTO_799 - BLOCK
      ?AUTO_801 - BLOCK
      ?AUTO_802 - BLOCK
      ?AUTO_803 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_795 ?AUTO_796 ) ) ( ON-TABLE ?AUTO_795 ) ( CLEAR ?AUTO_800 ) ( not ( = ?AUTO_795 ?AUTO_798 ) ) ( not ( = ?AUTO_795 ?AUTO_800 ) ) ( not ( = ?AUTO_796 ?AUTO_798 ) ) ( not ( = ?AUTO_796 ?AUTO_800 ) ) ( not ( = ?AUTO_798 ?AUTO_800 ) ) ( ON ?AUTO_798 ?AUTO_795 ) ( not ( = ?AUTO_795 ?AUTO_797 ) ) ( not ( = ?AUTO_796 ?AUTO_797 ) ) ( not ( = ?AUTO_800 ?AUTO_797 ) ) ( not ( = ?AUTO_798 ?AUTO_797 ) ) ( ON ?AUTO_797 ?AUTO_798 ) ( not ( = ?AUTO_795 ?AUTO_799 ) ) ( not ( = ?AUTO_795 ?AUTO_801 ) ) ( not ( = ?AUTO_796 ?AUTO_799 ) ) ( not ( = ?AUTO_796 ?AUTO_801 ) ) ( not ( = ?AUTO_800 ?AUTO_799 ) ) ( not ( = ?AUTO_800 ?AUTO_801 ) ) ( not ( = ?AUTO_798 ?AUTO_799 ) ) ( not ( = ?AUTO_798 ?AUTO_801 ) ) ( not ( = ?AUTO_797 ?AUTO_799 ) ) ( not ( = ?AUTO_797 ?AUTO_801 ) ) ( not ( = ?AUTO_799 ?AUTO_801 ) ) ( ON ?AUTO_801 ?AUTO_797 ) ( CLEAR ?AUTO_796 ) ( ON ?AUTO_799 ?AUTO_801 ) ( CLEAR ?AUTO_799 ) ( HOLDING ?AUTO_802 ) ( CLEAR ?AUTO_803 ) ( not ( = ?AUTO_795 ?AUTO_802 ) ) ( not ( = ?AUTO_795 ?AUTO_803 ) ) ( not ( = ?AUTO_796 ?AUTO_802 ) ) ( not ( = ?AUTO_796 ?AUTO_803 ) ) ( not ( = ?AUTO_800 ?AUTO_802 ) ) ( not ( = ?AUTO_800 ?AUTO_803 ) ) ( not ( = ?AUTO_798 ?AUTO_802 ) ) ( not ( = ?AUTO_798 ?AUTO_803 ) ) ( not ( = ?AUTO_797 ?AUTO_802 ) ) ( not ( = ?AUTO_797 ?AUTO_803 ) ) ( not ( = ?AUTO_799 ?AUTO_802 ) ) ( not ( = ?AUTO_799 ?AUTO_803 ) ) ( not ( = ?AUTO_801 ?AUTO_802 ) ) ( not ( = ?AUTO_801 ?AUTO_803 ) ) ( not ( = ?AUTO_802 ?AUTO_803 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_802 ?AUTO_803 )
      ( MAKE-ON ?AUTO_795 ?AUTO_796 )
      ( MAKE-ON-VERIFY ?AUTO_795 ?AUTO_796 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_808 - BLOCK
      ?AUTO_809 - BLOCK
    )
    :vars
    (
      ?AUTO_812 - BLOCK
      ?AUTO_813 - BLOCK
      ?AUTO_811 - BLOCK
      ?AUTO_810 - BLOCK
      ?AUTO_814 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_808 ?AUTO_809 ) ) ( ON-TABLE ?AUTO_808 ) ( CLEAR ?AUTO_812 ) ( not ( = ?AUTO_808 ?AUTO_813 ) ) ( not ( = ?AUTO_808 ?AUTO_812 ) ) ( not ( = ?AUTO_809 ?AUTO_813 ) ) ( not ( = ?AUTO_809 ?AUTO_812 ) ) ( not ( = ?AUTO_813 ?AUTO_812 ) ) ( ON ?AUTO_813 ?AUTO_808 ) ( not ( = ?AUTO_808 ?AUTO_811 ) ) ( not ( = ?AUTO_809 ?AUTO_811 ) ) ( not ( = ?AUTO_812 ?AUTO_811 ) ) ( not ( = ?AUTO_813 ?AUTO_811 ) ) ( ON ?AUTO_811 ?AUTO_813 ) ( not ( = ?AUTO_808 ?AUTO_810 ) ) ( not ( = ?AUTO_808 ?AUTO_814 ) ) ( not ( = ?AUTO_809 ?AUTO_810 ) ) ( not ( = ?AUTO_809 ?AUTO_814 ) ) ( not ( = ?AUTO_812 ?AUTO_810 ) ) ( not ( = ?AUTO_812 ?AUTO_814 ) ) ( not ( = ?AUTO_813 ?AUTO_810 ) ) ( not ( = ?AUTO_813 ?AUTO_814 ) ) ( not ( = ?AUTO_811 ?AUTO_810 ) ) ( not ( = ?AUTO_811 ?AUTO_814 ) ) ( not ( = ?AUTO_810 ?AUTO_814 ) ) ( ON ?AUTO_814 ?AUTO_811 ) ( CLEAR ?AUTO_814 ) ( CLEAR ?AUTO_809 ) ( ON-TABLE ?AUTO_810 ) ( CLEAR ?AUTO_810 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_810 )
      ( MAKE-ON ?AUTO_808 ?AUTO_809 )
      ( MAKE-ON-VERIFY ?AUTO_808 ?AUTO_809 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_817 - BLOCK
      ?AUTO_818 - BLOCK
    )
    :vars
    (
      ?AUTO_822 - BLOCK
      ?AUTO_821 - BLOCK
      ?AUTO_823 - BLOCK
      ?AUTO_819 - BLOCK
      ?AUTO_820 - BLOCK
      ?AUTO_824 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_817 ?AUTO_818 ) ) ( ON-TABLE ?AUTO_817 ) ( CLEAR ?AUTO_822 ) ( not ( = ?AUTO_817 ?AUTO_821 ) ) ( not ( = ?AUTO_817 ?AUTO_822 ) ) ( not ( = ?AUTO_818 ?AUTO_821 ) ) ( not ( = ?AUTO_818 ?AUTO_822 ) ) ( not ( = ?AUTO_821 ?AUTO_822 ) ) ( ON ?AUTO_821 ?AUTO_817 ) ( not ( = ?AUTO_817 ?AUTO_823 ) ) ( not ( = ?AUTO_818 ?AUTO_823 ) ) ( not ( = ?AUTO_822 ?AUTO_823 ) ) ( not ( = ?AUTO_821 ?AUTO_823 ) ) ( ON ?AUTO_823 ?AUTO_821 ) ( not ( = ?AUTO_817 ?AUTO_819 ) ) ( not ( = ?AUTO_817 ?AUTO_820 ) ) ( not ( = ?AUTO_818 ?AUTO_819 ) ) ( not ( = ?AUTO_818 ?AUTO_820 ) ) ( not ( = ?AUTO_822 ?AUTO_819 ) ) ( not ( = ?AUTO_822 ?AUTO_820 ) ) ( not ( = ?AUTO_821 ?AUTO_819 ) ) ( not ( = ?AUTO_821 ?AUTO_820 ) ) ( not ( = ?AUTO_823 ?AUTO_819 ) ) ( not ( = ?AUTO_823 ?AUTO_820 ) ) ( not ( = ?AUTO_819 ?AUTO_820 ) ) ( ON ?AUTO_820 ?AUTO_823 ) ( CLEAR ?AUTO_820 ) ( CLEAR ?AUTO_818 ) ( ON ?AUTO_819 ?AUTO_824 ) ( CLEAR ?AUTO_819 ) ( HAND-EMPTY ) ( not ( = ?AUTO_817 ?AUTO_824 ) ) ( not ( = ?AUTO_818 ?AUTO_824 ) ) ( not ( = ?AUTO_822 ?AUTO_824 ) ) ( not ( = ?AUTO_821 ?AUTO_824 ) ) ( not ( = ?AUTO_823 ?AUTO_824 ) ) ( not ( = ?AUTO_819 ?AUTO_824 ) ) ( not ( = ?AUTO_820 ?AUTO_824 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_819 ?AUTO_824 )
      ( MAKE-ON ?AUTO_817 ?AUTO_818 )
      ( MAKE-ON-VERIFY ?AUTO_817 ?AUTO_818 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_831 - BLOCK
      ?AUTO_832 - BLOCK
    )
    :vars
    (
      ?AUTO_834 - BLOCK
      ?AUTO_833 - BLOCK
      ?AUTO_835 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_831 ?AUTO_832 ) ) ( ON-TABLE ?AUTO_831 ) ( not ( = ?AUTO_831 ?AUTO_834 ) ) ( not ( = ?AUTO_832 ?AUTO_834 ) ) ( ON ?AUTO_834 ?AUTO_831 ) ( CLEAR ?AUTO_833 ) ( not ( = ?AUTO_831 ?AUTO_835 ) ) ( not ( = ?AUTO_831 ?AUTO_833 ) ) ( not ( = ?AUTO_832 ?AUTO_835 ) ) ( not ( = ?AUTO_832 ?AUTO_833 ) ) ( not ( = ?AUTO_834 ?AUTO_835 ) ) ( not ( = ?AUTO_834 ?AUTO_833 ) ) ( not ( = ?AUTO_835 ?AUTO_833 ) ) ( ON ?AUTO_835 ?AUTO_834 ) ( ON ?AUTO_832 ?AUTO_835 ) ( CLEAR ?AUTO_832 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_832 ?AUTO_835 )
      ( MAKE-ON ?AUTO_831 ?AUTO_832 )
      ( MAKE-ON-VERIFY ?AUTO_831 ?AUTO_832 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_838 - BLOCK
      ?AUTO_839 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_838 ) ( CLEAR ?AUTO_839 ) ( not ( = ?AUTO_838 ?AUTO_839 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_838 ?AUTO_839 )
      ( MAKE-ON-VERIFY ?AUTO_838 ?AUTO_839 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_840 - BLOCK
      ?AUTO_841 - BLOCK
    )
    :vars
    (
      ?AUTO_842 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_841 ) ( not ( = ?AUTO_840 ?AUTO_841 ) ) ( ON ?AUTO_840 ?AUTO_842 ) ( CLEAR ?AUTO_840 ) ( HAND-EMPTY ) ( not ( = ?AUTO_840 ?AUTO_842 ) ) ( not ( = ?AUTO_841 ?AUTO_842 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_840 ?AUTO_842 )
      ( MAKE-ON ?AUTO_840 ?AUTO_841 )
      ( MAKE-ON-VERIFY ?AUTO_840 ?AUTO_841 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_843 - BLOCK
      ?AUTO_844 - BLOCK
    )
    :vars
    (
      ?AUTO_845 - BLOCK
      ?AUTO_846 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_843 ?AUTO_844 ) ) ( ON ?AUTO_843 ?AUTO_845 ) ( CLEAR ?AUTO_843 ) ( not ( = ?AUTO_843 ?AUTO_845 ) ) ( not ( = ?AUTO_844 ?AUTO_845 ) ) ( HOLDING ?AUTO_844 ) ( CLEAR ?AUTO_846 ) ( not ( = ?AUTO_843 ?AUTO_846 ) ) ( not ( = ?AUTO_844 ?AUTO_846 ) ) ( not ( = ?AUTO_845 ?AUTO_846 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_844 ?AUTO_846 )
      ( MAKE-ON ?AUTO_843 ?AUTO_844 )
      ( MAKE-ON-VERIFY ?AUTO_843 ?AUTO_844 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_849 - BLOCK
      ?AUTO_850 - BLOCK
    )
    :vars
    (
      ?AUTO_851 - BLOCK
      ?AUTO_852 - BLOCK
      ?AUTO_853 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_850 ) ( not ( = ?AUTO_849 ?AUTO_850 ) ) ( ON ?AUTO_849 ?AUTO_851 ) ( CLEAR ?AUTO_849 ) ( not ( = ?AUTO_849 ?AUTO_851 ) ) ( not ( = ?AUTO_850 ?AUTO_851 ) ) ( HOLDING ?AUTO_852 ) ( CLEAR ?AUTO_853 ) ( not ( = ?AUTO_849 ?AUTO_852 ) ) ( not ( = ?AUTO_849 ?AUTO_853 ) ) ( not ( = ?AUTO_850 ?AUTO_852 ) ) ( not ( = ?AUTO_850 ?AUTO_853 ) ) ( not ( = ?AUTO_851 ?AUTO_852 ) ) ( not ( = ?AUTO_851 ?AUTO_853 ) ) ( not ( = ?AUTO_852 ?AUTO_853 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_852 ?AUTO_853 )
      ( MAKE-ON ?AUTO_849 ?AUTO_850 )
      ( MAKE-ON-VERIFY ?AUTO_849 ?AUTO_850 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_858 - BLOCK
      ?AUTO_859 - BLOCK
    )
    :vars
    (
      ?AUTO_862 - BLOCK
      ?AUTO_861 - BLOCK
      ?AUTO_860 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_858 ?AUTO_859 ) ) ( ON ?AUTO_858 ?AUTO_862 ) ( CLEAR ?AUTO_858 ) ( not ( = ?AUTO_858 ?AUTO_862 ) ) ( not ( = ?AUTO_859 ?AUTO_862 ) ) ( CLEAR ?AUTO_861 ) ( not ( = ?AUTO_858 ?AUTO_860 ) ) ( not ( = ?AUTO_858 ?AUTO_861 ) ) ( not ( = ?AUTO_859 ?AUTO_860 ) ) ( not ( = ?AUTO_859 ?AUTO_861 ) ) ( not ( = ?AUTO_862 ?AUTO_860 ) ) ( not ( = ?AUTO_862 ?AUTO_861 ) ) ( not ( = ?AUTO_860 ?AUTO_861 ) ) ( ON ?AUTO_860 ?AUTO_859 ) ( CLEAR ?AUTO_860 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_860 ?AUTO_859 )
      ( MAKE-ON ?AUTO_858 ?AUTO_859 )
      ( MAKE-ON-VERIFY ?AUTO_858 ?AUTO_859 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_863 - BLOCK
      ?AUTO_864 - BLOCK
    )
    :vars
    (
      ?AUTO_865 - BLOCK
      ?AUTO_866 - BLOCK
      ?AUTO_867 - BLOCK
      ?AUTO_868 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_863 ?AUTO_864 ) ) ( ON ?AUTO_863 ?AUTO_865 ) ( CLEAR ?AUTO_863 ) ( not ( = ?AUTO_863 ?AUTO_865 ) ) ( not ( = ?AUTO_864 ?AUTO_865 ) ) ( CLEAR ?AUTO_866 ) ( not ( = ?AUTO_863 ?AUTO_867 ) ) ( not ( = ?AUTO_863 ?AUTO_866 ) ) ( not ( = ?AUTO_864 ?AUTO_867 ) ) ( not ( = ?AUTO_864 ?AUTO_866 ) ) ( not ( = ?AUTO_865 ?AUTO_867 ) ) ( not ( = ?AUTO_865 ?AUTO_866 ) ) ( not ( = ?AUTO_867 ?AUTO_866 ) ) ( ON ?AUTO_867 ?AUTO_864 ) ( CLEAR ?AUTO_867 ) ( HOLDING ?AUTO_868 ) ( not ( = ?AUTO_863 ?AUTO_868 ) ) ( not ( = ?AUTO_864 ?AUTO_868 ) ) ( not ( = ?AUTO_865 ?AUTO_868 ) ) ( not ( = ?AUTO_866 ?AUTO_868 ) ) ( not ( = ?AUTO_867 ?AUTO_868 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_868 )
      ( MAKE-ON ?AUTO_863 ?AUTO_864 )
      ( MAKE-ON-VERIFY ?AUTO_863 ?AUTO_864 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_869 - BLOCK
      ?AUTO_870 - BLOCK
    )
    :vars
    (
      ?AUTO_871 - BLOCK
      ?AUTO_872 - BLOCK
      ?AUTO_873 - BLOCK
      ?AUTO_874 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_869 ?AUTO_870 ) ) ( ON ?AUTO_869 ?AUTO_871 ) ( CLEAR ?AUTO_869 ) ( not ( = ?AUTO_869 ?AUTO_871 ) ) ( not ( = ?AUTO_870 ?AUTO_871 ) ) ( CLEAR ?AUTO_872 ) ( not ( = ?AUTO_869 ?AUTO_873 ) ) ( not ( = ?AUTO_869 ?AUTO_872 ) ) ( not ( = ?AUTO_870 ?AUTO_873 ) ) ( not ( = ?AUTO_870 ?AUTO_872 ) ) ( not ( = ?AUTO_871 ?AUTO_873 ) ) ( not ( = ?AUTO_871 ?AUTO_872 ) ) ( not ( = ?AUTO_873 ?AUTO_872 ) ) ( ON ?AUTO_873 ?AUTO_870 ) ( not ( = ?AUTO_869 ?AUTO_874 ) ) ( not ( = ?AUTO_870 ?AUTO_874 ) ) ( not ( = ?AUTO_871 ?AUTO_874 ) ) ( not ( = ?AUTO_872 ?AUTO_874 ) ) ( not ( = ?AUTO_873 ?AUTO_874 ) ) ( ON ?AUTO_874 ?AUTO_873 ) ( CLEAR ?AUTO_874 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_874 ?AUTO_873 )
      ( MAKE-ON ?AUTO_869 ?AUTO_870 )
      ( MAKE-ON-VERIFY ?AUTO_869 ?AUTO_870 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_875 - BLOCK
      ?AUTO_876 - BLOCK
    )
    :vars
    (
      ?AUTO_879 - BLOCK
      ?AUTO_878 - BLOCK
      ?AUTO_880 - BLOCK
      ?AUTO_877 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_875 ?AUTO_876 ) ) ( not ( = ?AUTO_875 ?AUTO_879 ) ) ( not ( = ?AUTO_876 ?AUTO_879 ) ) ( CLEAR ?AUTO_878 ) ( not ( = ?AUTO_875 ?AUTO_880 ) ) ( not ( = ?AUTO_875 ?AUTO_878 ) ) ( not ( = ?AUTO_876 ?AUTO_880 ) ) ( not ( = ?AUTO_876 ?AUTO_878 ) ) ( not ( = ?AUTO_879 ?AUTO_880 ) ) ( not ( = ?AUTO_879 ?AUTO_878 ) ) ( not ( = ?AUTO_880 ?AUTO_878 ) ) ( ON ?AUTO_880 ?AUTO_876 ) ( not ( = ?AUTO_875 ?AUTO_877 ) ) ( not ( = ?AUTO_876 ?AUTO_877 ) ) ( not ( = ?AUTO_879 ?AUTO_877 ) ) ( not ( = ?AUTO_878 ?AUTO_877 ) ) ( not ( = ?AUTO_880 ?AUTO_877 ) ) ( ON ?AUTO_877 ?AUTO_880 ) ( CLEAR ?AUTO_877 ) ( HOLDING ?AUTO_875 ) ( CLEAR ?AUTO_879 ) )
    :subtasks
    ( ( !STACK ?AUTO_875 ?AUTO_879 )
      ( MAKE-ON ?AUTO_875 ?AUTO_876 )
      ( MAKE-ON-VERIFY ?AUTO_875 ?AUTO_876 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_883 - BLOCK
      ?AUTO_884 - BLOCK
    )
    :vars
    (
      ?AUTO_885 - BLOCK
      ?AUTO_886 - BLOCK
      ?AUTO_887 - BLOCK
      ?AUTO_888 - BLOCK
      ?AUTO_889 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_883 ?AUTO_884 ) ) ( ON ?AUTO_883 ?AUTO_885 ) ( CLEAR ?AUTO_883 ) ( not ( = ?AUTO_883 ?AUTO_885 ) ) ( not ( = ?AUTO_884 ?AUTO_885 ) ) ( CLEAR ?AUTO_886 ) ( not ( = ?AUTO_883 ?AUTO_887 ) ) ( not ( = ?AUTO_883 ?AUTO_886 ) ) ( not ( = ?AUTO_884 ?AUTO_887 ) ) ( not ( = ?AUTO_884 ?AUTO_886 ) ) ( not ( = ?AUTO_885 ?AUTO_887 ) ) ( not ( = ?AUTO_885 ?AUTO_886 ) ) ( not ( = ?AUTO_887 ?AUTO_886 ) ) ( ON ?AUTO_887 ?AUTO_884 ) ( not ( = ?AUTO_883 ?AUTO_888 ) ) ( not ( = ?AUTO_884 ?AUTO_888 ) ) ( not ( = ?AUTO_885 ?AUTO_888 ) ) ( not ( = ?AUTO_886 ?AUTO_888 ) ) ( not ( = ?AUTO_887 ?AUTO_888 ) ) ( ON ?AUTO_888 ?AUTO_887 ) ( CLEAR ?AUTO_888 ) ( HOLDING ?AUTO_889 ) ( not ( = ?AUTO_883 ?AUTO_889 ) ) ( not ( = ?AUTO_884 ?AUTO_889 ) ) ( not ( = ?AUTO_885 ?AUTO_889 ) ) ( not ( = ?AUTO_886 ?AUTO_889 ) ) ( not ( = ?AUTO_887 ?AUTO_889 ) ) ( not ( = ?AUTO_888 ?AUTO_889 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_889 )
      ( MAKE-ON ?AUTO_883 ?AUTO_884 )
      ( MAKE-ON-VERIFY ?AUTO_883 ?AUTO_884 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_890 - BLOCK
      ?AUTO_891 - BLOCK
    )
    :vars
    (
      ?AUTO_893 - BLOCK
      ?AUTO_892 - BLOCK
      ?AUTO_895 - BLOCK
      ?AUTO_896 - BLOCK
      ?AUTO_894 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_890 ?AUTO_891 ) ) ( ON ?AUTO_890 ?AUTO_893 ) ( CLEAR ?AUTO_890 ) ( not ( = ?AUTO_890 ?AUTO_893 ) ) ( not ( = ?AUTO_891 ?AUTO_893 ) ) ( CLEAR ?AUTO_892 ) ( not ( = ?AUTO_890 ?AUTO_895 ) ) ( not ( = ?AUTO_890 ?AUTO_892 ) ) ( not ( = ?AUTO_891 ?AUTO_895 ) ) ( not ( = ?AUTO_891 ?AUTO_892 ) ) ( not ( = ?AUTO_893 ?AUTO_895 ) ) ( not ( = ?AUTO_893 ?AUTO_892 ) ) ( not ( = ?AUTO_895 ?AUTO_892 ) ) ( ON ?AUTO_895 ?AUTO_891 ) ( not ( = ?AUTO_890 ?AUTO_896 ) ) ( not ( = ?AUTO_891 ?AUTO_896 ) ) ( not ( = ?AUTO_893 ?AUTO_896 ) ) ( not ( = ?AUTO_892 ?AUTO_896 ) ) ( not ( = ?AUTO_895 ?AUTO_896 ) ) ( ON ?AUTO_896 ?AUTO_895 ) ( not ( = ?AUTO_890 ?AUTO_894 ) ) ( not ( = ?AUTO_891 ?AUTO_894 ) ) ( not ( = ?AUTO_893 ?AUTO_894 ) ) ( not ( = ?AUTO_892 ?AUTO_894 ) ) ( not ( = ?AUTO_895 ?AUTO_894 ) ) ( not ( = ?AUTO_896 ?AUTO_894 ) ) ( ON ?AUTO_894 ?AUTO_896 ) ( CLEAR ?AUTO_894 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_894 ?AUTO_896 )
      ( MAKE-ON ?AUTO_890 ?AUTO_891 )
      ( MAKE-ON-VERIFY ?AUTO_890 ?AUTO_891 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_897 - BLOCK
      ?AUTO_898 - BLOCK
    )
    :vars
    (
      ?AUTO_903 - BLOCK
      ?AUTO_899 - BLOCK
      ?AUTO_902 - BLOCK
      ?AUTO_900 - BLOCK
      ?AUTO_901 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_897 ?AUTO_898 ) ) ( not ( = ?AUTO_897 ?AUTO_903 ) ) ( not ( = ?AUTO_898 ?AUTO_903 ) ) ( CLEAR ?AUTO_899 ) ( not ( = ?AUTO_897 ?AUTO_902 ) ) ( not ( = ?AUTO_897 ?AUTO_899 ) ) ( not ( = ?AUTO_898 ?AUTO_902 ) ) ( not ( = ?AUTO_898 ?AUTO_899 ) ) ( not ( = ?AUTO_903 ?AUTO_902 ) ) ( not ( = ?AUTO_903 ?AUTO_899 ) ) ( not ( = ?AUTO_902 ?AUTO_899 ) ) ( ON ?AUTO_902 ?AUTO_898 ) ( not ( = ?AUTO_897 ?AUTO_900 ) ) ( not ( = ?AUTO_898 ?AUTO_900 ) ) ( not ( = ?AUTO_903 ?AUTO_900 ) ) ( not ( = ?AUTO_899 ?AUTO_900 ) ) ( not ( = ?AUTO_902 ?AUTO_900 ) ) ( ON ?AUTO_900 ?AUTO_902 ) ( not ( = ?AUTO_897 ?AUTO_901 ) ) ( not ( = ?AUTO_898 ?AUTO_901 ) ) ( not ( = ?AUTO_903 ?AUTO_901 ) ) ( not ( = ?AUTO_899 ?AUTO_901 ) ) ( not ( = ?AUTO_902 ?AUTO_901 ) ) ( not ( = ?AUTO_900 ?AUTO_901 ) ) ( ON ?AUTO_901 ?AUTO_900 ) ( CLEAR ?AUTO_901 ) ( HOLDING ?AUTO_897 ) ( CLEAR ?AUTO_903 ) )
    :subtasks
    ( ( !STACK ?AUTO_897 ?AUTO_903 )
      ( MAKE-ON ?AUTO_897 ?AUTO_898 )
      ( MAKE-ON-VERIFY ?AUTO_897 ?AUTO_898 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_904 - BLOCK
      ?AUTO_905 - BLOCK
    )
    :vars
    (
      ?AUTO_909 - BLOCK
      ?AUTO_906 - BLOCK
      ?AUTO_910 - BLOCK
      ?AUTO_907 - BLOCK
      ?AUTO_908 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_904 ?AUTO_905 ) ) ( not ( = ?AUTO_904 ?AUTO_909 ) ) ( not ( = ?AUTO_905 ?AUTO_909 ) ) ( CLEAR ?AUTO_906 ) ( not ( = ?AUTO_904 ?AUTO_910 ) ) ( not ( = ?AUTO_904 ?AUTO_906 ) ) ( not ( = ?AUTO_905 ?AUTO_910 ) ) ( not ( = ?AUTO_905 ?AUTO_906 ) ) ( not ( = ?AUTO_909 ?AUTO_910 ) ) ( not ( = ?AUTO_909 ?AUTO_906 ) ) ( not ( = ?AUTO_910 ?AUTO_906 ) ) ( ON ?AUTO_910 ?AUTO_905 ) ( not ( = ?AUTO_904 ?AUTO_907 ) ) ( not ( = ?AUTO_905 ?AUTO_907 ) ) ( not ( = ?AUTO_909 ?AUTO_907 ) ) ( not ( = ?AUTO_906 ?AUTO_907 ) ) ( not ( = ?AUTO_910 ?AUTO_907 ) ) ( ON ?AUTO_907 ?AUTO_910 ) ( not ( = ?AUTO_904 ?AUTO_908 ) ) ( not ( = ?AUTO_905 ?AUTO_908 ) ) ( not ( = ?AUTO_909 ?AUTO_908 ) ) ( not ( = ?AUTO_906 ?AUTO_908 ) ) ( not ( = ?AUTO_910 ?AUTO_908 ) ) ( not ( = ?AUTO_907 ?AUTO_908 ) ) ( ON ?AUTO_908 ?AUTO_907 ) ( CLEAR ?AUTO_909 ) ( ON ?AUTO_904 ?AUTO_908 ) ( CLEAR ?AUTO_904 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_904 ?AUTO_908 )
      ( MAKE-ON ?AUTO_904 ?AUTO_905 )
      ( MAKE-ON-VERIFY ?AUTO_904 ?AUTO_905 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_911 - BLOCK
      ?AUTO_912 - BLOCK
    )
    :vars
    (
      ?AUTO_916 - BLOCK
      ?AUTO_914 - BLOCK
      ?AUTO_917 - BLOCK
      ?AUTO_915 - BLOCK
      ?AUTO_913 - BLOCK
      ?AUTO_918 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_911 ?AUTO_912 ) ) ( not ( = ?AUTO_911 ?AUTO_916 ) ) ( not ( = ?AUTO_912 ?AUTO_916 ) ) ( CLEAR ?AUTO_914 ) ( not ( = ?AUTO_911 ?AUTO_917 ) ) ( not ( = ?AUTO_911 ?AUTO_914 ) ) ( not ( = ?AUTO_912 ?AUTO_917 ) ) ( not ( = ?AUTO_912 ?AUTO_914 ) ) ( not ( = ?AUTO_916 ?AUTO_917 ) ) ( not ( = ?AUTO_916 ?AUTO_914 ) ) ( not ( = ?AUTO_917 ?AUTO_914 ) ) ( ON ?AUTO_917 ?AUTO_912 ) ( not ( = ?AUTO_911 ?AUTO_915 ) ) ( not ( = ?AUTO_912 ?AUTO_915 ) ) ( not ( = ?AUTO_916 ?AUTO_915 ) ) ( not ( = ?AUTO_914 ?AUTO_915 ) ) ( not ( = ?AUTO_917 ?AUTO_915 ) ) ( ON ?AUTO_915 ?AUTO_917 ) ( not ( = ?AUTO_911 ?AUTO_913 ) ) ( not ( = ?AUTO_912 ?AUTO_913 ) ) ( not ( = ?AUTO_916 ?AUTO_913 ) ) ( not ( = ?AUTO_914 ?AUTO_913 ) ) ( not ( = ?AUTO_917 ?AUTO_913 ) ) ( not ( = ?AUTO_915 ?AUTO_913 ) ) ( ON ?AUTO_913 ?AUTO_915 ) ( ON ?AUTO_911 ?AUTO_913 ) ( CLEAR ?AUTO_911 ) ( HOLDING ?AUTO_916 ) ( CLEAR ?AUTO_918 ) ( not ( = ?AUTO_911 ?AUTO_918 ) ) ( not ( = ?AUTO_912 ?AUTO_918 ) ) ( not ( = ?AUTO_916 ?AUTO_918 ) ) ( not ( = ?AUTO_914 ?AUTO_918 ) ) ( not ( = ?AUTO_917 ?AUTO_918 ) ) ( not ( = ?AUTO_915 ?AUTO_918 ) ) ( not ( = ?AUTO_913 ?AUTO_918 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_916 ?AUTO_918 )
      ( MAKE-ON ?AUTO_911 ?AUTO_912 )
      ( MAKE-ON-VERIFY ?AUTO_911 ?AUTO_912 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_927 - BLOCK
      ?AUTO_928 - BLOCK
    )
    :vars
    (
      ?AUTO_933 - BLOCK
      ?AUTO_931 - BLOCK
      ?AUTO_932 - BLOCK
      ?AUTO_930 - BLOCK
      ?AUTO_929 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_927 ?AUTO_928 ) ) ( not ( = ?AUTO_927 ?AUTO_933 ) ) ( not ( = ?AUTO_928 ?AUTO_933 ) ) ( CLEAR ?AUTO_931 ) ( not ( = ?AUTO_927 ?AUTO_932 ) ) ( not ( = ?AUTO_927 ?AUTO_931 ) ) ( not ( = ?AUTO_928 ?AUTO_932 ) ) ( not ( = ?AUTO_928 ?AUTO_931 ) ) ( not ( = ?AUTO_933 ?AUTO_932 ) ) ( not ( = ?AUTO_933 ?AUTO_931 ) ) ( not ( = ?AUTO_932 ?AUTO_931 ) ) ( ON ?AUTO_932 ?AUTO_928 ) ( not ( = ?AUTO_927 ?AUTO_930 ) ) ( not ( = ?AUTO_928 ?AUTO_930 ) ) ( not ( = ?AUTO_933 ?AUTO_930 ) ) ( not ( = ?AUTO_931 ?AUTO_930 ) ) ( not ( = ?AUTO_932 ?AUTO_930 ) ) ( ON ?AUTO_930 ?AUTO_932 ) ( not ( = ?AUTO_927 ?AUTO_929 ) ) ( not ( = ?AUTO_928 ?AUTO_929 ) ) ( not ( = ?AUTO_933 ?AUTO_929 ) ) ( not ( = ?AUTO_931 ?AUTO_929 ) ) ( not ( = ?AUTO_932 ?AUTO_929 ) ) ( not ( = ?AUTO_930 ?AUTO_929 ) ) ( ON ?AUTO_929 ?AUTO_930 ) ( CLEAR ?AUTO_929 ) ( CLEAR ?AUTO_933 ) ( ON-TABLE ?AUTO_927 ) ( CLEAR ?AUTO_927 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_927 )
      ( MAKE-ON ?AUTO_927 ?AUTO_928 )
      ( MAKE-ON-VERIFY ?AUTO_927 ?AUTO_928 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_934 - BLOCK
      ?AUTO_935 - BLOCK
    )
    :vars
    (
      ?AUTO_938 - BLOCK
      ?AUTO_940 - BLOCK
      ?AUTO_939 - BLOCK
      ?AUTO_937 - BLOCK
      ?AUTO_936 - BLOCK
      ?AUTO_941 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_934 ?AUTO_935 ) ) ( not ( = ?AUTO_934 ?AUTO_938 ) ) ( not ( = ?AUTO_935 ?AUTO_938 ) ) ( CLEAR ?AUTO_940 ) ( not ( = ?AUTO_934 ?AUTO_939 ) ) ( not ( = ?AUTO_934 ?AUTO_940 ) ) ( not ( = ?AUTO_935 ?AUTO_939 ) ) ( not ( = ?AUTO_935 ?AUTO_940 ) ) ( not ( = ?AUTO_938 ?AUTO_939 ) ) ( not ( = ?AUTO_938 ?AUTO_940 ) ) ( not ( = ?AUTO_939 ?AUTO_940 ) ) ( ON ?AUTO_939 ?AUTO_935 ) ( not ( = ?AUTO_934 ?AUTO_937 ) ) ( not ( = ?AUTO_935 ?AUTO_937 ) ) ( not ( = ?AUTO_938 ?AUTO_937 ) ) ( not ( = ?AUTO_940 ?AUTO_937 ) ) ( not ( = ?AUTO_939 ?AUTO_937 ) ) ( ON ?AUTO_937 ?AUTO_939 ) ( not ( = ?AUTO_934 ?AUTO_936 ) ) ( not ( = ?AUTO_935 ?AUTO_936 ) ) ( not ( = ?AUTO_938 ?AUTO_936 ) ) ( not ( = ?AUTO_940 ?AUTO_936 ) ) ( not ( = ?AUTO_939 ?AUTO_936 ) ) ( not ( = ?AUTO_937 ?AUTO_936 ) ) ( ON ?AUTO_936 ?AUTO_937 ) ( CLEAR ?AUTO_936 ) ( CLEAR ?AUTO_938 ) ( ON-TABLE ?AUTO_934 ) ( CLEAR ?AUTO_934 ) ( HOLDING ?AUTO_941 ) ( not ( = ?AUTO_934 ?AUTO_941 ) ) ( not ( = ?AUTO_935 ?AUTO_941 ) ) ( not ( = ?AUTO_938 ?AUTO_941 ) ) ( not ( = ?AUTO_940 ?AUTO_941 ) ) ( not ( = ?AUTO_939 ?AUTO_941 ) ) ( not ( = ?AUTO_937 ?AUTO_941 ) ) ( not ( = ?AUTO_936 ?AUTO_941 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_941 )
      ( MAKE-ON ?AUTO_934 ?AUTO_935 )
      ( MAKE-ON-VERIFY ?AUTO_934 ?AUTO_935 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_942 - BLOCK
      ?AUTO_943 - BLOCK
    )
    :vars
    (
      ?AUTO_949 - BLOCK
      ?AUTO_948 - BLOCK
      ?AUTO_947 - BLOCK
      ?AUTO_945 - BLOCK
      ?AUTO_944 - BLOCK
      ?AUTO_946 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_942 ?AUTO_943 ) ) ( not ( = ?AUTO_942 ?AUTO_949 ) ) ( not ( = ?AUTO_943 ?AUTO_949 ) ) ( CLEAR ?AUTO_948 ) ( not ( = ?AUTO_942 ?AUTO_947 ) ) ( not ( = ?AUTO_942 ?AUTO_948 ) ) ( not ( = ?AUTO_943 ?AUTO_947 ) ) ( not ( = ?AUTO_943 ?AUTO_948 ) ) ( not ( = ?AUTO_949 ?AUTO_947 ) ) ( not ( = ?AUTO_949 ?AUTO_948 ) ) ( not ( = ?AUTO_947 ?AUTO_948 ) ) ( ON ?AUTO_947 ?AUTO_943 ) ( not ( = ?AUTO_942 ?AUTO_945 ) ) ( not ( = ?AUTO_943 ?AUTO_945 ) ) ( not ( = ?AUTO_949 ?AUTO_945 ) ) ( not ( = ?AUTO_948 ?AUTO_945 ) ) ( not ( = ?AUTO_947 ?AUTO_945 ) ) ( ON ?AUTO_945 ?AUTO_947 ) ( not ( = ?AUTO_942 ?AUTO_944 ) ) ( not ( = ?AUTO_943 ?AUTO_944 ) ) ( not ( = ?AUTO_949 ?AUTO_944 ) ) ( not ( = ?AUTO_948 ?AUTO_944 ) ) ( not ( = ?AUTO_947 ?AUTO_944 ) ) ( not ( = ?AUTO_945 ?AUTO_944 ) ) ( ON ?AUTO_944 ?AUTO_945 ) ( CLEAR ?AUTO_944 ) ( CLEAR ?AUTO_949 ) ( ON-TABLE ?AUTO_942 ) ( not ( = ?AUTO_942 ?AUTO_946 ) ) ( not ( = ?AUTO_943 ?AUTO_946 ) ) ( not ( = ?AUTO_949 ?AUTO_946 ) ) ( not ( = ?AUTO_948 ?AUTO_946 ) ) ( not ( = ?AUTO_947 ?AUTO_946 ) ) ( not ( = ?AUTO_945 ?AUTO_946 ) ) ( not ( = ?AUTO_944 ?AUTO_946 ) ) ( ON ?AUTO_946 ?AUTO_942 ) ( CLEAR ?AUTO_946 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_946 ?AUTO_942 )
      ( MAKE-ON ?AUTO_942 ?AUTO_943 )
      ( MAKE-ON-VERIFY ?AUTO_942 ?AUTO_943 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_950 - BLOCK
      ?AUTO_951 - BLOCK
    )
    :vars
    (
      ?AUTO_956 - BLOCK
      ?AUTO_957 - BLOCK
      ?AUTO_953 - BLOCK
      ?AUTO_952 - BLOCK
      ?AUTO_955 - BLOCK
      ?AUTO_954 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_950 ?AUTO_951 ) ) ( not ( = ?AUTO_950 ?AUTO_956 ) ) ( not ( = ?AUTO_951 ?AUTO_956 ) ) ( CLEAR ?AUTO_957 ) ( not ( = ?AUTO_950 ?AUTO_953 ) ) ( not ( = ?AUTO_950 ?AUTO_957 ) ) ( not ( = ?AUTO_951 ?AUTO_953 ) ) ( not ( = ?AUTO_951 ?AUTO_957 ) ) ( not ( = ?AUTO_956 ?AUTO_953 ) ) ( not ( = ?AUTO_956 ?AUTO_957 ) ) ( not ( = ?AUTO_953 ?AUTO_957 ) ) ( ON ?AUTO_953 ?AUTO_951 ) ( not ( = ?AUTO_950 ?AUTO_952 ) ) ( not ( = ?AUTO_951 ?AUTO_952 ) ) ( not ( = ?AUTO_956 ?AUTO_952 ) ) ( not ( = ?AUTO_957 ?AUTO_952 ) ) ( not ( = ?AUTO_953 ?AUTO_952 ) ) ( ON ?AUTO_952 ?AUTO_953 ) ( not ( = ?AUTO_950 ?AUTO_955 ) ) ( not ( = ?AUTO_951 ?AUTO_955 ) ) ( not ( = ?AUTO_956 ?AUTO_955 ) ) ( not ( = ?AUTO_957 ?AUTO_955 ) ) ( not ( = ?AUTO_953 ?AUTO_955 ) ) ( not ( = ?AUTO_952 ?AUTO_955 ) ) ( CLEAR ?AUTO_956 ) ( ON-TABLE ?AUTO_950 ) ( not ( = ?AUTO_950 ?AUTO_954 ) ) ( not ( = ?AUTO_951 ?AUTO_954 ) ) ( not ( = ?AUTO_956 ?AUTO_954 ) ) ( not ( = ?AUTO_957 ?AUTO_954 ) ) ( not ( = ?AUTO_953 ?AUTO_954 ) ) ( not ( = ?AUTO_952 ?AUTO_954 ) ) ( not ( = ?AUTO_955 ?AUTO_954 ) ) ( ON ?AUTO_954 ?AUTO_950 ) ( CLEAR ?AUTO_954 ) ( HOLDING ?AUTO_955 ) ( CLEAR ?AUTO_952 ) )
    :subtasks
    ( ( !STACK ?AUTO_955 ?AUTO_952 )
      ( MAKE-ON ?AUTO_950 ?AUTO_951 )
      ( MAKE-ON-VERIFY ?AUTO_950 ?AUTO_951 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_958 - BLOCK
      ?AUTO_959 - BLOCK
    )
    :vars
    (
      ?AUTO_963 - BLOCK
      ?AUTO_960 - BLOCK
      ?AUTO_962 - BLOCK
      ?AUTO_965 - BLOCK
      ?AUTO_961 - BLOCK
      ?AUTO_964 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_958 ?AUTO_959 ) ) ( not ( = ?AUTO_958 ?AUTO_963 ) ) ( not ( = ?AUTO_959 ?AUTO_963 ) ) ( CLEAR ?AUTO_960 ) ( not ( = ?AUTO_958 ?AUTO_962 ) ) ( not ( = ?AUTO_958 ?AUTO_960 ) ) ( not ( = ?AUTO_959 ?AUTO_962 ) ) ( not ( = ?AUTO_959 ?AUTO_960 ) ) ( not ( = ?AUTO_963 ?AUTO_962 ) ) ( not ( = ?AUTO_963 ?AUTO_960 ) ) ( not ( = ?AUTO_962 ?AUTO_960 ) ) ( ON ?AUTO_962 ?AUTO_959 ) ( not ( = ?AUTO_958 ?AUTO_965 ) ) ( not ( = ?AUTO_959 ?AUTO_965 ) ) ( not ( = ?AUTO_963 ?AUTO_965 ) ) ( not ( = ?AUTO_960 ?AUTO_965 ) ) ( not ( = ?AUTO_962 ?AUTO_965 ) ) ( ON ?AUTO_965 ?AUTO_962 ) ( not ( = ?AUTO_958 ?AUTO_961 ) ) ( not ( = ?AUTO_959 ?AUTO_961 ) ) ( not ( = ?AUTO_963 ?AUTO_961 ) ) ( not ( = ?AUTO_960 ?AUTO_961 ) ) ( not ( = ?AUTO_962 ?AUTO_961 ) ) ( not ( = ?AUTO_965 ?AUTO_961 ) ) ( CLEAR ?AUTO_963 ) ( ON-TABLE ?AUTO_958 ) ( not ( = ?AUTO_958 ?AUTO_964 ) ) ( not ( = ?AUTO_959 ?AUTO_964 ) ) ( not ( = ?AUTO_963 ?AUTO_964 ) ) ( not ( = ?AUTO_960 ?AUTO_964 ) ) ( not ( = ?AUTO_962 ?AUTO_964 ) ) ( not ( = ?AUTO_965 ?AUTO_964 ) ) ( not ( = ?AUTO_961 ?AUTO_964 ) ) ( ON ?AUTO_964 ?AUTO_958 ) ( CLEAR ?AUTO_965 ) ( ON ?AUTO_961 ?AUTO_964 ) ( CLEAR ?AUTO_961 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_961 ?AUTO_964 )
      ( MAKE-ON ?AUTO_958 ?AUTO_959 )
      ( MAKE-ON-VERIFY ?AUTO_958 ?AUTO_959 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_966 - BLOCK
      ?AUTO_967 - BLOCK
    )
    :vars
    (
      ?AUTO_972 - BLOCK
      ?AUTO_973 - BLOCK
      ?AUTO_968 - BLOCK
      ?AUTO_971 - BLOCK
      ?AUTO_969 - BLOCK
      ?AUTO_970 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_966 ?AUTO_967 ) ) ( not ( = ?AUTO_966 ?AUTO_972 ) ) ( not ( = ?AUTO_967 ?AUTO_972 ) ) ( not ( = ?AUTO_966 ?AUTO_973 ) ) ( not ( = ?AUTO_966 ?AUTO_968 ) ) ( not ( = ?AUTO_967 ?AUTO_973 ) ) ( not ( = ?AUTO_967 ?AUTO_968 ) ) ( not ( = ?AUTO_972 ?AUTO_973 ) ) ( not ( = ?AUTO_972 ?AUTO_968 ) ) ( not ( = ?AUTO_973 ?AUTO_968 ) ) ( ON ?AUTO_973 ?AUTO_967 ) ( not ( = ?AUTO_966 ?AUTO_971 ) ) ( not ( = ?AUTO_967 ?AUTO_971 ) ) ( not ( = ?AUTO_972 ?AUTO_971 ) ) ( not ( = ?AUTO_968 ?AUTO_971 ) ) ( not ( = ?AUTO_973 ?AUTO_971 ) ) ( ON ?AUTO_971 ?AUTO_973 ) ( not ( = ?AUTO_966 ?AUTO_969 ) ) ( not ( = ?AUTO_967 ?AUTO_969 ) ) ( not ( = ?AUTO_972 ?AUTO_969 ) ) ( not ( = ?AUTO_968 ?AUTO_969 ) ) ( not ( = ?AUTO_973 ?AUTO_969 ) ) ( not ( = ?AUTO_971 ?AUTO_969 ) ) ( CLEAR ?AUTO_972 ) ( ON-TABLE ?AUTO_966 ) ( not ( = ?AUTO_966 ?AUTO_970 ) ) ( not ( = ?AUTO_967 ?AUTO_970 ) ) ( not ( = ?AUTO_972 ?AUTO_970 ) ) ( not ( = ?AUTO_968 ?AUTO_970 ) ) ( not ( = ?AUTO_973 ?AUTO_970 ) ) ( not ( = ?AUTO_971 ?AUTO_970 ) ) ( not ( = ?AUTO_969 ?AUTO_970 ) ) ( ON ?AUTO_970 ?AUTO_966 ) ( CLEAR ?AUTO_971 ) ( ON ?AUTO_969 ?AUTO_970 ) ( CLEAR ?AUTO_969 ) ( HOLDING ?AUTO_968 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_968 )
      ( MAKE-ON ?AUTO_966 ?AUTO_967 )
      ( MAKE-ON-VERIFY ?AUTO_966 ?AUTO_967 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_974 - BLOCK
      ?AUTO_975 - BLOCK
    )
    :vars
    (
      ?AUTO_980 - BLOCK
      ?AUTO_977 - BLOCK
      ?AUTO_979 - BLOCK
      ?AUTO_978 - BLOCK
      ?AUTO_976 - BLOCK
      ?AUTO_981 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_974 ?AUTO_975 ) ) ( not ( = ?AUTO_974 ?AUTO_980 ) ) ( not ( = ?AUTO_975 ?AUTO_980 ) ) ( not ( = ?AUTO_974 ?AUTO_977 ) ) ( not ( = ?AUTO_974 ?AUTO_979 ) ) ( not ( = ?AUTO_975 ?AUTO_977 ) ) ( not ( = ?AUTO_975 ?AUTO_979 ) ) ( not ( = ?AUTO_980 ?AUTO_977 ) ) ( not ( = ?AUTO_980 ?AUTO_979 ) ) ( not ( = ?AUTO_977 ?AUTO_979 ) ) ( ON ?AUTO_977 ?AUTO_975 ) ( not ( = ?AUTO_974 ?AUTO_978 ) ) ( not ( = ?AUTO_975 ?AUTO_978 ) ) ( not ( = ?AUTO_980 ?AUTO_978 ) ) ( not ( = ?AUTO_979 ?AUTO_978 ) ) ( not ( = ?AUTO_977 ?AUTO_978 ) ) ( ON ?AUTO_978 ?AUTO_977 ) ( not ( = ?AUTO_974 ?AUTO_976 ) ) ( not ( = ?AUTO_975 ?AUTO_976 ) ) ( not ( = ?AUTO_980 ?AUTO_976 ) ) ( not ( = ?AUTO_979 ?AUTO_976 ) ) ( not ( = ?AUTO_977 ?AUTO_976 ) ) ( not ( = ?AUTO_978 ?AUTO_976 ) ) ( CLEAR ?AUTO_980 ) ( ON-TABLE ?AUTO_974 ) ( not ( = ?AUTO_974 ?AUTO_981 ) ) ( not ( = ?AUTO_975 ?AUTO_981 ) ) ( not ( = ?AUTO_980 ?AUTO_981 ) ) ( not ( = ?AUTO_979 ?AUTO_981 ) ) ( not ( = ?AUTO_977 ?AUTO_981 ) ) ( not ( = ?AUTO_978 ?AUTO_981 ) ) ( not ( = ?AUTO_976 ?AUTO_981 ) ) ( ON ?AUTO_981 ?AUTO_974 ) ( ON ?AUTO_976 ?AUTO_981 ) ( CLEAR ?AUTO_976 ) ( ON ?AUTO_979 ?AUTO_978 ) ( CLEAR ?AUTO_979 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_979 ?AUTO_978 )
      ( MAKE-ON ?AUTO_974 ?AUTO_975 )
      ( MAKE-ON-VERIFY ?AUTO_974 ?AUTO_975 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_984 - BLOCK
      ?AUTO_985 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_984 ) ( CLEAR ?AUTO_985 ) ( not ( = ?AUTO_984 ?AUTO_985 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_984 ?AUTO_985 )
      ( MAKE-ON-VERIFY ?AUTO_984 ?AUTO_985 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_986 - BLOCK
      ?AUTO_987 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_987 ) ( not ( = ?AUTO_986 ?AUTO_987 ) ) ( ON-TABLE ?AUTO_986 ) ( CLEAR ?AUTO_986 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_986 )
      ( MAKE-ON ?AUTO_986 ?AUTO_987 )
      ( MAKE-ON-VERIFY ?AUTO_986 ?AUTO_987 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_988 - BLOCK
      ?AUTO_989 - BLOCK
    )
    :vars
    (
      ?AUTO_990 - BLOCK
      ?AUTO_991 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_989 ) ( not ( = ?AUTO_988 ?AUTO_989 ) ) ( ON-TABLE ?AUTO_988 ) ( CLEAR ?AUTO_988 ) ( HOLDING ?AUTO_990 ) ( CLEAR ?AUTO_991 ) ( not ( = ?AUTO_988 ?AUTO_990 ) ) ( not ( = ?AUTO_988 ?AUTO_991 ) ) ( not ( = ?AUTO_989 ?AUTO_990 ) ) ( not ( = ?AUTO_989 ?AUTO_991 ) ) ( not ( = ?AUTO_990 ?AUTO_991 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_990 ?AUTO_991 )
      ( MAKE-ON ?AUTO_988 ?AUTO_989 )
      ( MAKE-ON-VERIFY ?AUTO_988 ?AUTO_989 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_992 - BLOCK
      ?AUTO_993 - BLOCK
    )
    :vars
    (
      ?AUTO_994 - BLOCK
      ?AUTO_995 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_993 ) ( not ( = ?AUTO_992 ?AUTO_993 ) ) ( ON-TABLE ?AUTO_992 ) ( CLEAR ?AUTO_994 ) ( not ( = ?AUTO_992 ?AUTO_995 ) ) ( not ( = ?AUTO_992 ?AUTO_994 ) ) ( not ( = ?AUTO_993 ?AUTO_995 ) ) ( not ( = ?AUTO_993 ?AUTO_994 ) ) ( not ( = ?AUTO_995 ?AUTO_994 ) ) ( ON ?AUTO_995 ?AUTO_992 ) ( CLEAR ?AUTO_995 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_995 ?AUTO_992 )
      ( MAKE-ON ?AUTO_992 ?AUTO_993 )
      ( MAKE-ON-VERIFY ?AUTO_992 ?AUTO_993 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_996 - BLOCK
      ?AUTO_997 - BLOCK
    )
    :vars
    (
      ?AUTO_998 - BLOCK
      ?AUTO_999 - BLOCK
      ?AUTO_1000 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_997 ) ( not ( = ?AUTO_996 ?AUTO_997 ) ) ( ON-TABLE ?AUTO_996 ) ( not ( = ?AUTO_996 ?AUTO_998 ) ) ( not ( = ?AUTO_996 ?AUTO_999 ) ) ( not ( = ?AUTO_997 ?AUTO_998 ) ) ( not ( = ?AUTO_997 ?AUTO_999 ) ) ( not ( = ?AUTO_998 ?AUTO_999 ) ) ( ON ?AUTO_998 ?AUTO_996 ) ( CLEAR ?AUTO_998 ) ( HOLDING ?AUTO_999 ) ( CLEAR ?AUTO_1000 ) ( not ( = ?AUTO_996 ?AUTO_1000 ) ) ( not ( = ?AUTO_997 ?AUTO_1000 ) ) ( not ( = ?AUTO_998 ?AUTO_1000 ) ) ( not ( = ?AUTO_999 ?AUTO_1000 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_999 ?AUTO_1000 )
      ( MAKE-ON ?AUTO_996 ?AUTO_997 )
      ( MAKE-ON-VERIFY ?AUTO_996 ?AUTO_997 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1003 - BLOCK
      ?AUTO_1004 - BLOCK
    )
    :vars
    (
      ?AUTO_1006 - BLOCK
      ?AUTO_1005 - BLOCK
      ?AUTO_1007 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1003 ?AUTO_1004 ) ) ( ON-TABLE ?AUTO_1003 ) ( CLEAR ?AUTO_1006 ) ( not ( = ?AUTO_1003 ?AUTO_1005 ) ) ( not ( = ?AUTO_1003 ?AUTO_1006 ) ) ( not ( = ?AUTO_1004 ?AUTO_1005 ) ) ( not ( = ?AUTO_1004 ?AUTO_1006 ) ) ( not ( = ?AUTO_1005 ?AUTO_1006 ) ) ( ON ?AUTO_1005 ?AUTO_1003 ) ( CLEAR ?AUTO_1005 ) ( HOLDING ?AUTO_1004 ) ( CLEAR ?AUTO_1007 ) ( not ( = ?AUTO_1003 ?AUTO_1007 ) ) ( not ( = ?AUTO_1004 ?AUTO_1007 ) ) ( not ( = ?AUTO_1006 ?AUTO_1007 ) ) ( not ( = ?AUTO_1005 ?AUTO_1007 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1004 ?AUTO_1007 )
      ( MAKE-ON ?AUTO_1003 ?AUTO_1004 )
      ( MAKE-ON-VERIFY ?AUTO_1003 ?AUTO_1004 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1096 - BLOCK
      ?AUTO_1097 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1096 ) ( CLEAR ?AUTO_1097 ) ( not ( = ?AUTO_1096 ?AUTO_1097 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1096 ?AUTO_1097 )
      ( MAKE-ON-VERIFY ?AUTO_1096 ?AUTO_1097 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1098 - BLOCK
      ?AUTO_1099 - BLOCK
    )
    :vars
    (
      ?AUTO_1100 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1099 ) ( not ( = ?AUTO_1098 ?AUTO_1099 ) ) ( ON ?AUTO_1098 ?AUTO_1100 ) ( CLEAR ?AUTO_1098 ) ( HAND-EMPTY ) ( not ( = ?AUTO_1098 ?AUTO_1100 ) ) ( not ( = ?AUTO_1099 ?AUTO_1100 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1098 ?AUTO_1100 )
      ( MAKE-ON ?AUTO_1098 ?AUTO_1099 )
      ( MAKE-ON-VERIFY ?AUTO_1098 ?AUTO_1099 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1101 - BLOCK
      ?AUTO_1102 - BLOCK
    )
    :vars
    (
      ?AUTO_1103 - BLOCK
      ?AUTO_1104 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1101 ?AUTO_1102 ) ) ( ON ?AUTO_1101 ?AUTO_1103 ) ( CLEAR ?AUTO_1101 ) ( not ( = ?AUTO_1101 ?AUTO_1103 ) ) ( not ( = ?AUTO_1102 ?AUTO_1103 ) ) ( HOLDING ?AUTO_1102 ) ( CLEAR ?AUTO_1104 ) ( not ( = ?AUTO_1101 ?AUTO_1104 ) ) ( not ( = ?AUTO_1102 ?AUTO_1104 ) ) ( not ( = ?AUTO_1103 ?AUTO_1104 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1102 ?AUTO_1104 )
      ( MAKE-ON ?AUTO_1101 ?AUTO_1102 )
      ( MAKE-ON-VERIFY ?AUTO_1101 ?AUTO_1102 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1106 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1106 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1106 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1106 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1107 - BLOCK
    )
    :vars
    (
      ?AUTO_1108 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1107 ?AUTO_1108 ) ( CLEAR ?AUTO_1107 ) ( HAND-EMPTY ) ( not ( = ?AUTO_1107 ?AUTO_1108 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1107 ?AUTO_1108 )
      ( MAKE-ON-TABLE ?AUTO_1107 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1107 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1111 - BLOCK
      ?AUTO_1112 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1111 ) ( CLEAR ?AUTO_1112 ) ( not ( = ?AUTO_1111 ?AUTO_1112 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1111 ?AUTO_1112 )
      ( MAKE-ON-VERIFY ?AUTO_1111 ?AUTO_1112 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1113 - BLOCK
      ?AUTO_1114 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1114 ) ( not ( = ?AUTO_1113 ?AUTO_1114 ) ) ( ON-TABLE ?AUTO_1113 ) ( CLEAR ?AUTO_1113 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_1113 )
      ( MAKE-ON ?AUTO_1113 ?AUTO_1114 )
      ( MAKE-ON-VERIFY ?AUTO_1113 ?AUTO_1114 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1115 - BLOCK
      ?AUTO_1116 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1115 ?AUTO_1116 ) ) ( ON-TABLE ?AUTO_1115 ) ( CLEAR ?AUTO_1115 ) ( HOLDING ?AUTO_1116 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1116 )
      ( MAKE-ON ?AUTO_1115 ?AUTO_1116 )
      ( MAKE-ON-VERIFY ?AUTO_1115 ?AUTO_1116 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1117 - BLOCK
      ?AUTO_1118 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1117 ?AUTO_1118 ) ) ( ON-TABLE ?AUTO_1117 ) ( ON ?AUTO_1118 ?AUTO_1117 ) ( CLEAR ?AUTO_1118 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1118 ?AUTO_1117 )
      ( MAKE-ON ?AUTO_1117 ?AUTO_1118 )
      ( MAKE-ON-VERIFY ?AUTO_1117 ?AUTO_1118 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1120 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1120 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1120 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1120 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1121 - BLOCK
    )
    :vars
    (
      ?AUTO_1122 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1121 ?AUTO_1122 ) ( CLEAR ?AUTO_1121 ) ( HAND-EMPTY ) ( not ( = ?AUTO_1121 ?AUTO_1122 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1121 ?AUTO_1122 )
      ( MAKE-ON-TABLE ?AUTO_1121 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1121 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1123 - BLOCK
    )
    :vars
    (
      ?AUTO_1124 - BLOCK
      ?AUTO_1125 - BLOCK
      ?AUTO_1126 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1123 ?AUTO_1124 ) ( CLEAR ?AUTO_1123 ) ( not ( = ?AUTO_1123 ?AUTO_1124 ) ) ( HOLDING ?AUTO_1125 ) ( CLEAR ?AUTO_1126 ) ( not ( = ?AUTO_1123 ?AUTO_1125 ) ) ( not ( = ?AUTO_1123 ?AUTO_1126 ) ) ( not ( = ?AUTO_1124 ?AUTO_1125 ) ) ( not ( = ?AUTO_1124 ?AUTO_1126 ) ) ( not ( = ?AUTO_1125 ?AUTO_1126 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1125 ?AUTO_1126 )
      ( MAKE-ON-TABLE ?AUTO_1123 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1123 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1132 - BLOCK
      ?AUTO_1133 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1132 ) ( CLEAR ?AUTO_1133 ) ( not ( = ?AUTO_1132 ?AUTO_1133 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1132 ?AUTO_1133 )
      ( MAKE-ON-VERIFY ?AUTO_1132 ?AUTO_1133 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1134 - BLOCK
      ?AUTO_1135 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1135 ) ( not ( = ?AUTO_1134 ?AUTO_1135 ) ) ( ON-TABLE ?AUTO_1134 ) ( CLEAR ?AUTO_1134 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_1134 )
      ( MAKE-ON ?AUTO_1134 ?AUTO_1135 )
      ( MAKE-ON-VERIFY ?AUTO_1134 ?AUTO_1135 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1136 - BLOCK
      ?AUTO_1137 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1136 ?AUTO_1137 ) ) ( ON-TABLE ?AUTO_1136 ) ( CLEAR ?AUTO_1136 ) ( HOLDING ?AUTO_1137 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1137 )
      ( MAKE-ON ?AUTO_1136 ?AUTO_1137 )
      ( MAKE-ON-VERIFY ?AUTO_1136 ?AUTO_1137 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1140 - BLOCK
      ?AUTO_1141 - BLOCK
    )
    :vars
    (
      ?AUTO_1142 - BLOCK
      ?AUTO_1143 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1141 ) ( not ( = ?AUTO_1140 ?AUTO_1141 ) ) ( ON-TABLE ?AUTO_1140 ) ( CLEAR ?AUTO_1140 ) ( HOLDING ?AUTO_1142 ) ( CLEAR ?AUTO_1143 ) ( not ( = ?AUTO_1140 ?AUTO_1142 ) ) ( not ( = ?AUTO_1140 ?AUTO_1143 ) ) ( not ( = ?AUTO_1141 ?AUTO_1142 ) ) ( not ( = ?AUTO_1141 ?AUTO_1143 ) ) ( not ( = ?AUTO_1142 ?AUTO_1143 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1142 ?AUTO_1143 )
      ( MAKE-ON ?AUTO_1140 ?AUTO_1141 )
      ( MAKE-ON-VERIFY ?AUTO_1140 ?AUTO_1141 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1152 - BLOCK
      ?AUTO_1153 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1152 ) ( CLEAR ?AUTO_1153 ) ( not ( = ?AUTO_1152 ?AUTO_1153 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1152 ?AUTO_1153 )
      ( MAKE-ON-VERIFY ?AUTO_1152 ?AUTO_1153 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1154 - BLOCK
      ?AUTO_1155 - BLOCK
    )
    :vars
    (
      ?AUTO_1156 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1155 ) ( not ( = ?AUTO_1154 ?AUTO_1155 ) ) ( ON ?AUTO_1154 ?AUTO_1156 ) ( CLEAR ?AUTO_1154 ) ( HAND-EMPTY ) ( not ( = ?AUTO_1154 ?AUTO_1156 ) ) ( not ( = ?AUTO_1155 ?AUTO_1156 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1154 ?AUTO_1156 )
      ( MAKE-ON ?AUTO_1154 ?AUTO_1155 )
      ( MAKE-ON-VERIFY ?AUTO_1154 ?AUTO_1155 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1157 - BLOCK
      ?AUTO_1158 - BLOCK
    )
    :vars
    (
      ?AUTO_1159 - BLOCK
      ?AUTO_1160 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1157 ?AUTO_1158 ) ) ( ON ?AUTO_1157 ?AUTO_1159 ) ( CLEAR ?AUTO_1157 ) ( not ( = ?AUTO_1157 ?AUTO_1159 ) ) ( not ( = ?AUTO_1158 ?AUTO_1159 ) ) ( HOLDING ?AUTO_1158 ) ( CLEAR ?AUTO_1160 ) ( not ( = ?AUTO_1157 ?AUTO_1160 ) ) ( not ( = ?AUTO_1158 ?AUTO_1160 ) ) ( not ( = ?AUTO_1159 ?AUTO_1160 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1158 ?AUTO_1160 )
      ( MAKE-ON ?AUTO_1157 ?AUTO_1158 )
      ( MAKE-ON-VERIFY ?AUTO_1157 ?AUTO_1158 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1163 - BLOCK
      ?AUTO_1164 - BLOCK
    )
    :vars
    (
      ?AUTO_1165 - BLOCK
      ?AUTO_1166 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1164 ) ( not ( = ?AUTO_1163 ?AUTO_1164 ) ) ( ON ?AUTO_1163 ?AUTO_1165 ) ( CLEAR ?AUTO_1163 ) ( not ( = ?AUTO_1163 ?AUTO_1165 ) ) ( not ( = ?AUTO_1164 ?AUTO_1165 ) ) ( HOLDING ?AUTO_1166 ) ( not ( = ?AUTO_1163 ?AUTO_1166 ) ) ( not ( = ?AUTO_1164 ?AUTO_1166 ) ) ( not ( = ?AUTO_1165 ?AUTO_1166 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1166 )
      ( MAKE-ON ?AUTO_1163 ?AUTO_1164 )
      ( MAKE-ON-VERIFY ?AUTO_1163 ?AUTO_1164 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1179 - BLOCK
      ?AUTO_1180 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1179 ) ( CLEAR ?AUTO_1180 ) ( not ( = ?AUTO_1179 ?AUTO_1180 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1179 ?AUTO_1180 )
      ( MAKE-ON-VERIFY ?AUTO_1179 ?AUTO_1180 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1181 - BLOCK
      ?AUTO_1182 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1182 ) ( not ( = ?AUTO_1181 ?AUTO_1182 ) ) ( ON-TABLE ?AUTO_1181 ) ( CLEAR ?AUTO_1181 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_1181 )
      ( MAKE-ON ?AUTO_1181 ?AUTO_1182 )
      ( MAKE-ON-VERIFY ?AUTO_1181 ?AUTO_1182 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1183 - BLOCK
      ?AUTO_1184 - BLOCK
    )
    :vars
    (
      ?AUTO_1185 - BLOCK
      ?AUTO_1186 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1184 ) ( not ( = ?AUTO_1183 ?AUTO_1184 ) ) ( ON-TABLE ?AUTO_1183 ) ( CLEAR ?AUTO_1183 ) ( HOLDING ?AUTO_1185 ) ( CLEAR ?AUTO_1186 ) ( not ( = ?AUTO_1183 ?AUTO_1185 ) ) ( not ( = ?AUTO_1183 ?AUTO_1186 ) ) ( not ( = ?AUTO_1184 ?AUTO_1185 ) ) ( not ( = ?AUTO_1184 ?AUTO_1186 ) ) ( not ( = ?AUTO_1185 ?AUTO_1186 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1185 ?AUTO_1186 )
      ( MAKE-ON ?AUTO_1183 ?AUTO_1184 )
      ( MAKE-ON-VERIFY ?AUTO_1183 ?AUTO_1184 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1187 - BLOCK
      ?AUTO_1188 - BLOCK
    )
    :vars
    (
      ?AUTO_1189 - BLOCK
      ?AUTO_1190 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1188 ) ( not ( = ?AUTO_1187 ?AUTO_1188 ) ) ( ON-TABLE ?AUTO_1187 ) ( CLEAR ?AUTO_1189 ) ( not ( = ?AUTO_1187 ?AUTO_1190 ) ) ( not ( = ?AUTO_1187 ?AUTO_1189 ) ) ( not ( = ?AUTO_1188 ?AUTO_1190 ) ) ( not ( = ?AUTO_1188 ?AUTO_1189 ) ) ( not ( = ?AUTO_1190 ?AUTO_1189 ) ) ( ON ?AUTO_1190 ?AUTO_1187 ) ( CLEAR ?AUTO_1190 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1190 ?AUTO_1187 )
      ( MAKE-ON ?AUTO_1187 ?AUTO_1188 )
      ( MAKE-ON-VERIFY ?AUTO_1187 ?AUTO_1188 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1191 - BLOCK
      ?AUTO_1192 - BLOCK
    )
    :vars
    (
      ?AUTO_1193 - BLOCK
      ?AUTO_1194 - BLOCK
      ?AUTO_1195 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1192 ) ( not ( = ?AUTO_1191 ?AUTO_1192 ) ) ( ON-TABLE ?AUTO_1191 ) ( not ( = ?AUTO_1191 ?AUTO_1193 ) ) ( not ( = ?AUTO_1191 ?AUTO_1194 ) ) ( not ( = ?AUTO_1192 ?AUTO_1193 ) ) ( not ( = ?AUTO_1192 ?AUTO_1194 ) ) ( not ( = ?AUTO_1193 ?AUTO_1194 ) ) ( ON ?AUTO_1193 ?AUTO_1191 ) ( CLEAR ?AUTO_1193 ) ( HOLDING ?AUTO_1194 ) ( CLEAR ?AUTO_1195 ) ( not ( = ?AUTO_1191 ?AUTO_1195 ) ) ( not ( = ?AUTO_1192 ?AUTO_1195 ) ) ( not ( = ?AUTO_1193 ?AUTO_1195 ) ) ( not ( = ?AUTO_1194 ?AUTO_1195 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1194 ?AUTO_1195 )
      ( MAKE-ON ?AUTO_1191 ?AUTO_1192 )
      ( MAKE-ON-VERIFY ?AUTO_1191 ?AUTO_1192 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1202 - BLOCK
      ?AUTO_1203 - BLOCK
    )
    :vars
    (
      ?AUTO_1205 - BLOCK
      ?AUTO_1204 - BLOCK
      ?AUTO_1206 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1202 ?AUTO_1203 ) ) ( ON-TABLE ?AUTO_1202 ) ( CLEAR ?AUTO_1205 ) ( not ( = ?AUTO_1202 ?AUTO_1204 ) ) ( not ( = ?AUTO_1202 ?AUTO_1205 ) ) ( not ( = ?AUTO_1203 ?AUTO_1204 ) ) ( not ( = ?AUTO_1203 ?AUTO_1205 ) ) ( not ( = ?AUTO_1204 ?AUTO_1205 ) ) ( ON ?AUTO_1204 ?AUTO_1202 ) ( CLEAR ?AUTO_1204 ) ( HOLDING ?AUTO_1203 ) ( CLEAR ?AUTO_1206 ) ( not ( = ?AUTO_1202 ?AUTO_1206 ) ) ( not ( = ?AUTO_1203 ?AUTO_1206 ) ) ( not ( = ?AUTO_1205 ?AUTO_1206 ) ) ( not ( = ?AUTO_1204 ?AUTO_1206 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1203 ?AUTO_1206 )
      ( MAKE-ON ?AUTO_1202 ?AUTO_1203 )
      ( MAKE-ON-VERIFY ?AUTO_1202 ?AUTO_1203 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1211 - BLOCK
      ?AUTO_1212 - BLOCK
    )
    :vars
    (
      ?AUTO_1213 - BLOCK
      ?AUTO_1214 - BLOCK
      ?AUTO_1215 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1211 ?AUTO_1212 ) ) ( ON-TABLE ?AUTO_1211 ) ( not ( = ?AUTO_1211 ?AUTO_1213 ) ) ( not ( = ?AUTO_1211 ?AUTO_1214 ) ) ( not ( = ?AUTO_1212 ?AUTO_1213 ) ) ( not ( = ?AUTO_1212 ?AUTO_1214 ) ) ( not ( = ?AUTO_1213 ?AUTO_1214 ) ) ( ON ?AUTO_1213 ?AUTO_1211 ) ( CLEAR ?AUTO_1213 ) ( CLEAR ?AUTO_1215 ) ( not ( = ?AUTO_1211 ?AUTO_1215 ) ) ( not ( = ?AUTO_1212 ?AUTO_1215 ) ) ( not ( = ?AUTO_1213 ?AUTO_1215 ) ) ( not ( = ?AUTO_1214 ?AUTO_1215 ) ) ( ON ?AUTO_1214 ?AUTO_1212 ) ( CLEAR ?AUTO_1214 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1214 ?AUTO_1212 )
      ( MAKE-ON ?AUTO_1211 ?AUTO_1212 )
      ( MAKE-ON-VERIFY ?AUTO_1211 ?AUTO_1212 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1217 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1217 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1217 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1217 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1218 - BLOCK
    )
    :vars
    (
      ?AUTO_1219 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1218 ?AUTO_1219 ) ( CLEAR ?AUTO_1218 ) ( HAND-EMPTY ) ( not ( = ?AUTO_1218 ?AUTO_1219 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1218 ?AUTO_1219 )
      ( MAKE-ON-TABLE ?AUTO_1218 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1218 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1220 - BLOCK
    )
    :vars
    (
      ?AUTO_1221 - BLOCK
      ?AUTO_1222 - BLOCK
      ?AUTO_1223 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1220 ?AUTO_1221 ) ( CLEAR ?AUTO_1220 ) ( not ( = ?AUTO_1220 ?AUTO_1221 ) ) ( HOLDING ?AUTO_1222 ) ( CLEAR ?AUTO_1223 ) ( not ( = ?AUTO_1220 ?AUTO_1222 ) ) ( not ( = ?AUTO_1220 ?AUTO_1223 ) ) ( not ( = ?AUTO_1221 ?AUTO_1222 ) ) ( not ( = ?AUTO_1221 ?AUTO_1223 ) ) ( not ( = ?AUTO_1222 ?AUTO_1223 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1222 ?AUTO_1223 )
      ( MAKE-ON-TABLE ?AUTO_1220 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1220 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1230 - BLOCK
    )
    :vars
    (
      ?AUTO_1233 - BLOCK
      ?AUTO_1231 - BLOCK
      ?AUTO_1232 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1230 ?AUTO_1233 ) ( not ( = ?AUTO_1230 ?AUTO_1233 ) ) ( CLEAR ?AUTO_1231 ) ( not ( = ?AUTO_1230 ?AUTO_1232 ) ) ( not ( = ?AUTO_1230 ?AUTO_1231 ) ) ( not ( = ?AUTO_1233 ?AUTO_1232 ) ) ( not ( = ?AUTO_1233 ?AUTO_1231 ) ) ( not ( = ?AUTO_1232 ?AUTO_1231 ) ) ( ON ?AUTO_1232 ?AUTO_1230 ) ( CLEAR ?AUTO_1232 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1232 ?AUTO_1230 )
      ( MAKE-ON-TABLE ?AUTO_1230 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1230 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1234 - BLOCK
    )
    :vars
    (
      ?AUTO_1235 - BLOCK
      ?AUTO_1237 - BLOCK
      ?AUTO_1236 - BLOCK
      ?AUTO_1238 - BLOCK
      ?AUTO_1239 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1234 ?AUTO_1235 ) ( not ( = ?AUTO_1234 ?AUTO_1235 ) ) ( CLEAR ?AUTO_1237 ) ( not ( = ?AUTO_1234 ?AUTO_1236 ) ) ( not ( = ?AUTO_1234 ?AUTO_1237 ) ) ( not ( = ?AUTO_1235 ?AUTO_1236 ) ) ( not ( = ?AUTO_1235 ?AUTO_1237 ) ) ( not ( = ?AUTO_1236 ?AUTO_1237 ) ) ( ON ?AUTO_1236 ?AUTO_1234 ) ( CLEAR ?AUTO_1236 ) ( HOLDING ?AUTO_1238 ) ( CLEAR ?AUTO_1239 ) ( not ( = ?AUTO_1234 ?AUTO_1238 ) ) ( not ( = ?AUTO_1234 ?AUTO_1239 ) ) ( not ( = ?AUTO_1235 ?AUTO_1238 ) ) ( not ( = ?AUTO_1235 ?AUTO_1239 ) ) ( not ( = ?AUTO_1237 ?AUTO_1238 ) ) ( not ( = ?AUTO_1237 ?AUTO_1239 ) ) ( not ( = ?AUTO_1236 ?AUTO_1238 ) ) ( not ( = ?AUTO_1236 ?AUTO_1239 ) ) ( not ( = ?AUTO_1238 ?AUTO_1239 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1238 ?AUTO_1239 )
      ( MAKE-ON-TABLE ?AUTO_1234 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1234 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1245 - BLOCK
      ?AUTO_1246 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1245 ) ( CLEAR ?AUTO_1246 ) ( not ( = ?AUTO_1245 ?AUTO_1246 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1245 ?AUTO_1246 )
      ( MAKE-ON-VERIFY ?AUTO_1245 ?AUTO_1246 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1247 - BLOCK
      ?AUTO_1248 - BLOCK
    )
    :vars
    (
      ?AUTO_1249 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1248 ) ( not ( = ?AUTO_1247 ?AUTO_1248 ) ) ( ON ?AUTO_1247 ?AUTO_1249 ) ( CLEAR ?AUTO_1247 ) ( HAND-EMPTY ) ( not ( = ?AUTO_1247 ?AUTO_1249 ) ) ( not ( = ?AUTO_1248 ?AUTO_1249 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1247 ?AUTO_1249 )
      ( MAKE-ON ?AUTO_1247 ?AUTO_1248 )
      ( MAKE-ON-VERIFY ?AUTO_1247 ?AUTO_1248 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1250 - BLOCK
      ?AUTO_1251 - BLOCK
    )
    :vars
    (
      ?AUTO_1252 - BLOCK
      ?AUTO_1253 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1251 ) ( not ( = ?AUTO_1250 ?AUTO_1251 ) ) ( ON ?AUTO_1250 ?AUTO_1252 ) ( CLEAR ?AUTO_1250 ) ( not ( = ?AUTO_1250 ?AUTO_1252 ) ) ( not ( = ?AUTO_1251 ?AUTO_1252 ) ) ( HOLDING ?AUTO_1253 ) ( not ( = ?AUTO_1250 ?AUTO_1253 ) ) ( not ( = ?AUTO_1251 ?AUTO_1253 ) ) ( not ( = ?AUTO_1252 ?AUTO_1253 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1253 )
      ( MAKE-ON ?AUTO_1250 ?AUTO_1251 )
      ( MAKE-ON-VERIFY ?AUTO_1250 ?AUTO_1251 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1254 - BLOCK
      ?AUTO_1255 - BLOCK
    )
    :vars
    (
      ?AUTO_1256 - BLOCK
      ?AUTO_1257 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1255 ) ( not ( = ?AUTO_1254 ?AUTO_1255 ) ) ( ON ?AUTO_1254 ?AUTO_1256 ) ( not ( = ?AUTO_1254 ?AUTO_1256 ) ) ( not ( = ?AUTO_1255 ?AUTO_1256 ) ) ( not ( = ?AUTO_1254 ?AUTO_1257 ) ) ( not ( = ?AUTO_1255 ?AUTO_1257 ) ) ( not ( = ?AUTO_1256 ?AUTO_1257 ) ) ( ON ?AUTO_1257 ?AUTO_1254 ) ( CLEAR ?AUTO_1257 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1257 ?AUTO_1254 )
      ( MAKE-ON ?AUTO_1254 ?AUTO_1255 )
      ( MAKE-ON-VERIFY ?AUTO_1254 ?AUTO_1255 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1258 - BLOCK
      ?AUTO_1259 - BLOCK
    )
    :vars
    (
      ?AUTO_1260 - BLOCK
      ?AUTO_1261 - BLOCK
      ?AUTO_1262 - BLOCK
      ?AUTO_1263 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1259 ) ( not ( = ?AUTO_1258 ?AUTO_1259 ) ) ( ON ?AUTO_1258 ?AUTO_1260 ) ( not ( = ?AUTO_1258 ?AUTO_1260 ) ) ( not ( = ?AUTO_1259 ?AUTO_1260 ) ) ( not ( = ?AUTO_1258 ?AUTO_1261 ) ) ( not ( = ?AUTO_1259 ?AUTO_1261 ) ) ( not ( = ?AUTO_1260 ?AUTO_1261 ) ) ( ON ?AUTO_1261 ?AUTO_1258 ) ( CLEAR ?AUTO_1261 ) ( HOLDING ?AUTO_1262 ) ( CLEAR ?AUTO_1263 ) ( not ( = ?AUTO_1258 ?AUTO_1262 ) ) ( not ( = ?AUTO_1258 ?AUTO_1263 ) ) ( not ( = ?AUTO_1259 ?AUTO_1262 ) ) ( not ( = ?AUTO_1259 ?AUTO_1263 ) ) ( not ( = ?AUTO_1260 ?AUTO_1262 ) ) ( not ( = ?AUTO_1260 ?AUTO_1263 ) ) ( not ( = ?AUTO_1261 ?AUTO_1262 ) ) ( not ( = ?AUTO_1261 ?AUTO_1263 ) ) ( not ( = ?AUTO_1262 ?AUTO_1263 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1262 ?AUTO_1263 )
      ( MAKE-ON ?AUTO_1258 ?AUTO_1259 )
      ( MAKE-ON-VERIFY ?AUTO_1258 ?AUTO_1259 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1276 - BLOCK
      ?AUTO_1277 - BLOCK
    )
    :vars
    (
      ?AUTO_1278 - BLOCK
      ?AUTO_1279 - BLOCK
      ?AUTO_1280 - BLOCK
      ?AUTO_1281 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1277 ) ( not ( = ?AUTO_1276 ?AUTO_1277 ) ) ( ON ?AUTO_1276 ?AUTO_1278 ) ( not ( = ?AUTO_1276 ?AUTO_1278 ) ) ( not ( = ?AUTO_1277 ?AUTO_1278 ) ) ( not ( = ?AUTO_1276 ?AUTO_1279 ) ) ( not ( = ?AUTO_1277 ?AUTO_1279 ) ) ( not ( = ?AUTO_1278 ?AUTO_1279 ) ) ( ON ?AUTO_1279 ?AUTO_1276 ) ( CLEAR ?AUTO_1280 ) ( not ( = ?AUTO_1276 ?AUTO_1281 ) ) ( not ( = ?AUTO_1276 ?AUTO_1280 ) ) ( not ( = ?AUTO_1277 ?AUTO_1281 ) ) ( not ( = ?AUTO_1277 ?AUTO_1280 ) ) ( not ( = ?AUTO_1278 ?AUTO_1281 ) ) ( not ( = ?AUTO_1278 ?AUTO_1280 ) ) ( not ( = ?AUTO_1279 ?AUTO_1281 ) ) ( not ( = ?AUTO_1279 ?AUTO_1280 ) ) ( not ( = ?AUTO_1281 ?AUTO_1280 ) ) ( ON ?AUTO_1281 ?AUTO_1279 ) ( CLEAR ?AUTO_1281 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1281 ?AUTO_1279 )
      ( MAKE-ON ?AUTO_1276 ?AUTO_1277 )
      ( MAKE-ON-VERIFY ?AUTO_1276 ?AUTO_1277 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1282 - BLOCK
      ?AUTO_1283 - BLOCK
    )
    :vars
    (
      ?AUTO_1287 - BLOCK
      ?AUTO_1285 - BLOCK
      ?AUTO_1286 - BLOCK
      ?AUTO_1284 - BLOCK
      ?AUTO_1288 - BLOCK
      ?AUTO_1289 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1283 ) ( not ( = ?AUTO_1282 ?AUTO_1283 ) ) ( ON ?AUTO_1282 ?AUTO_1287 ) ( not ( = ?AUTO_1282 ?AUTO_1287 ) ) ( not ( = ?AUTO_1283 ?AUTO_1287 ) ) ( not ( = ?AUTO_1282 ?AUTO_1285 ) ) ( not ( = ?AUTO_1283 ?AUTO_1285 ) ) ( not ( = ?AUTO_1287 ?AUTO_1285 ) ) ( ON ?AUTO_1285 ?AUTO_1282 ) ( CLEAR ?AUTO_1286 ) ( not ( = ?AUTO_1282 ?AUTO_1284 ) ) ( not ( = ?AUTO_1282 ?AUTO_1286 ) ) ( not ( = ?AUTO_1283 ?AUTO_1284 ) ) ( not ( = ?AUTO_1283 ?AUTO_1286 ) ) ( not ( = ?AUTO_1287 ?AUTO_1284 ) ) ( not ( = ?AUTO_1287 ?AUTO_1286 ) ) ( not ( = ?AUTO_1285 ?AUTO_1284 ) ) ( not ( = ?AUTO_1285 ?AUTO_1286 ) ) ( not ( = ?AUTO_1284 ?AUTO_1286 ) ) ( ON ?AUTO_1284 ?AUTO_1285 ) ( CLEAR ?AUTO_1284 ) ( HOLDING ?AUTO_1288 ) ( CLEAR ?AUTO_1289 ) ( not ( = ?AUTO_1282 ?AUTO_1288 ) ) ( not ( = ?AUTO_1282 ?AUTO_1289 ) ) ( not ( = ?AUTO_1283 ?AUTO_1288 ) ) ( not ( = ?AUTO_1283 ?AUTO_1289 ) ) ( not ( = ?AUTO_1287 ?AUTO_1288 ) ) ( not ( = ?AUTO_1287 ?AUTO_1289 ) ) ( not ( = ?AUTO_1285 ?AUTO_1288 ) ) ( not ( = ?AUTO_1285 ?AUTO_1289 ) ) ( not ( = ?AUTO_1286 ?AUTO_1288 ) ) ( not ( = ?AUTO_1286 ?AUTO_1289 ) ) ( not ( = ?AUTO_1284 ?AUTO_1288 ) ) ( not ( = ?AUTO_1284 ?AUTO_1289 ) ) ( not ( = ?AUTO_1288 ?AUTO_1289 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1288 ?AUTO_1289 )
      ( MAKE-ON ?AUTO_1282 ?AUTO_1283 )
      ( MAKE-ON-VERIFY ?AUTO_1282 ?AUTO_1283 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1298 - BLOCK
      ?AUTO_1299 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1298 ) ( CLEAR ?AUTO_1299 ) ( not ( = ?AUTO_1298 ?AUTO_1299 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1298 ?AUTO_1299 )
      ( MAKE-ON-VERIFY ?AUTO_1298 ?AUTO_1299 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1300 - BLOCK
      ?AUTO_1301 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1301 ) ( not ( = ?AUTO_1300 ?AUTO_1301 ) ) ( ON-TABLE ?AUTO_1300 ) ( CLEAR ?AUTO_1300 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_1300 )
      ( MAKE-ON ?AUTO_1300 ?AUTO_1301 )
      ( MAKE-ON-VERIFY ?AUTO_1300 ?AUTO_1301 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1302 - BLOCK
      ?AUTO_1303 - BLOCK
    )
    :vars
    (
      ?AUTO_1304 - BLOCK
      ?AUTO_1305 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1303 ) ( not ( = ?AUTO_1302 ?AUTO_1303 ) ) ( ON-TABLE ?AUTO_1302 ) ( CLEAR ?AUTO_1302 ) ( HOLDING ?AUTO_1304 ) ( CLEAR ?AUTO_1305 ) ( not ( = ?AUTO_1302 ?AUTO_1304 ) ) ( not ( = ?AUTO_1302 ?AUTO_1305 ) ) ( not ( = ?AUTO_1303 ?AUTO_1304 ) ) ( not ( = ?AUTO_1303 ?AUTO_1305 ) ) ( not ( = ?AUTO_1304 ?AUTO_1305 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1304 ?AUTO_1305 )
      ( MAKE-ON ?AUTO_1302 ?AUTO_1303 )
      ( MAKE-ON-VERIFY ?AUTO_1302 ?AUTO_1303 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1306 - BLOCK
      ?AUTO_1307 - BLOCK
    )
    :vars
    (
      ?AUTO_1308 - BLOCK
      ?AUTO_1309 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1306 ?AUTO_1307 ) ) ( ON-TABLE ?AUTO_1306 ) ( CLEAR ?AUTO_1306 ) ( CLEAR ?AUTO_1308 ) ( not ( = ?AUTO_1306 ?AUTO_1309 ) ) ( not ( = ?AUTO_1306 ?AUTO_1308 ) ) ( not ( = ?AUTO_1307 ?AUTO_1309 ) ) ( not ( = ?AUTO_1307 ?AUTO_1308 ) ) ( not ( = ?AUTO_1309 ?AUTO_1308 ) ) ( ON ?AUTO_1309 ?AUTO_1307 ) ( CLEAR ?AUTO_1309 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1309 ?AUTO_1307 )
      ( MAKE-ON ?AUTO_1306 ?AUTO_1307 )
      ( MAKE-ON-VERIFY ?AUTO_1306 ?AUTO_1307 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1310 - BLOCK
      ?AUTO_1311 - BLOCK
    )
    :vars
    (
      ?AUTO_1312 - BLOCK
      ?AUTO_1313 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1310 ?AUTO_1311 ) ) ( CLEAR ?AUTO_1312 ) ( not ( = ?AUTO_1310 ?AUTO_1313 ) ) ( not ( = ?AUTO_1310 ?AUTO_1312 ) ) ( not ( = ?AUTO_1311 ?AUTO_1313 ) ) ( not ( = ?AUTO_1311 ?AUTO_1312 ) ) ( not ( = ?AUTO_1313 ?AUTO_1312 ) ) ( ON ?AUTO_1313 ?AUTO_1311 ) ( CLEAR ?AUTO_1313 ) ( HOLDING ?AUTO_1310 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1310 )
      ( MAKE-ON ?AUTO_1310 ?AUTO_1311 )
      ( MAKE-ON-VERIFY ?AUTO_1310 ?AUTO_1311 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1314 - BLOCK
      ?AUTO_1315 - BLOCK
    )
    :vars
    (
      ?AUTO_1316 - BLOCK
      ?AUTO_1317 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1314 ?AUTO_1315 ) ) ( CLEAR ?AUTO_1316 ) ( not ( = ?AUTO_1314 ?AUTO_1317 ) ) ( not ( = ?AUTO_1314 ?AUTO_1316 ) ) ( not ( = ?AUTO_1315 ?AUTO_1317 ) ) ( not ( = ?AUTO_1315 ?AUTO_1316 ) ) ( not ( = ?AUTO_1317 ?AUTO_1316 ) ) ( ON ?AUTO_1317 ?AUTO_1315 ) ( ON ?AUTO_1314 ?AUTO_1317 ) ( CLEAR ?AUTO_1314 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1314 ?AUTO_1317 )
      ( MAKE-ON ?AUTO_1314 ?AUTO_1315 )
      ( MAKE-ON-VERIFY ?AUTO_1314 ?AUTO_1315 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1318 - BLOCK
      ?AUTO_1319 - BLOCK
    )
    :vars
    (
      ?AUTO_1321 - BLOCK
      ?AUTO_1320 - BLOCK
      ?AUTO_1322 - BLOCK
      ?AUTO_1323 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1318 ?AUTO_1319 ) ) ( CLEAR ?AUTO_1321 ) ( not ( = ?AUTO_1318 ?AUTO_1320 ) ) ( not ( = ?AUTO_1318 ?AUTO_1321 ) ) ( not ( = ?AUTO_1319 ?AUTO_1320 ) ) ( not ( = ?AUTO_1319 ?AUTO_1321 ) ) ( not ( = ?AUTO_1320 ?AUTO_1321 ) ) ( ON ?AUTO_1320 ?AUTO_1319 ) ( ON ?AUTO_1318 ?AUTO_1320 ) ( CLEAR ?AUTO_1318 ) ( HOLDING ?AUTO_1322 ) ( CLEAR ?AUTO_1323 ) ( not ( = ?AUTO_1318 ?AUTO_1322 ) ) ( not ( = ?AUTO_1318 ?AUTO_1323 ) ) ( not ( = ?AUTO_1319 ?AUTO_1322 ) ) ( not ( = ?AUTO_1319 ?AUTO_1323 ) ) ( not ( = ?AUTO_1321 ?AUTO_1322 ) ) ( not ( = ?AUTO_1321 ?AUTO_1323 ) ) ( not ( = ?AUTO_1320 ?AUTO_1322 ) ) ( not ( = ?AUTO_1320 ?AUTO_1323 ) ) ( not ( = ?AUTO_1322 ?AUTO_1323 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1322 ?AUTO_1323 )
      ( MAKE-ON ?AUTO_1318 ?AUTO_1319 )
      ( MAKE-ON-VERIFY ?AUTO_1318 ?AUTO_1319 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1336 - BLOCK
      ?AUTO_1337 - BLOCK
    )
    :vars
    (
      ?AUTO_1338 - BLOCK
      ?AUTO_1339 - BLOCK
      ?AUTO_1340 - BLOCK
      ?AUTO_1341 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1336 ?AUTO_1337 ) ) ( CLEAR ?AUTO_1338 ) ( not ( = ?AUTO_1336 ?AUTO_1339 ) ) ( not ( = ?AUTO_1336 ?AUTO_1338 ) ) ( not ( = ?AUTO_1337 ?AUTO_1339 ) ) ( not ( = ?AUTO_1337 ?AUTO_1338 ) ) ( not ( = ?AUTO_1339 ?AUTO_1338 ) ) ( ON ?AUTO_1339 ?AUTO_1337 ) ( ON ?AUTO_1336 ?AUTO_1339 ) ( CLEAR ?AUTO_1340 ) ( not ( = ?AUTO_1336 ?AUTO_1341 ) ) ( not ( = ?AUTO_1336 ?AUTO_1340 ) ) ( not ( = ?AUTO_1337 ?AUTO_1341 ) ) ( not ( = ?AUTO_1337 ?AUTO_1340 ) ) ( not ( = ?AUTO_1338 ?AUTO_1341 ) ) ( not ( = ?AUTO_1338 ?AUTO_1340 ) ) ( not ( = ?AUTO_1339 ?AUTO_1341 ) ) ( not ( = ?AUTO_1339 ?AUTO_1340 ) ) ( not ( = ?AUTO_1341 ?AUTO_1340 ) ) ( ON ?AUTO_1341 ?AUTO_1336 ) ( CLEAR ?AUTO_1341 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1341 ?AUTO_1336 )
      ( MAKE-ON ?AUTO_1336 ?AUTO_1337 )
      ( MAKE-ON-VERIFY ?AUTO_1336 ?AUTO_1337 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1342 - BLOCK
      ?AUTO_1343 - BLOCK
    )
    :vars
    (
      ?AUTO_1344 - BLOCK
      ?AUTO_1347 - BLOCK
      ?AUTO_1346 - BLOCK
      ?AUTO_1345 - BLOCK
      ?AUTO_1348 - BLOCK
      ?AUTO_1349 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1342 ?AUTO_1343 ) ) ( CLEAR ?AUTO_1344 ) ( not ( = ?AUTO_1342 ?AUTO_1347 ) ) ( not ( = ?AUTO_1342 ?AUTO_1344 ) ) ( not ( = ?AUTO_1343 ?AUTO_1347 ) ) ( not ( = ?AUTO_1343 ?AUTO_1344 ) ) ( not ( = ?AUTO_1347 ?AUTO_1344 ) ) ( ON ?AUTO_1347 ?AUTO_1343 ) ( ON ?AUTO_1342 ?AUTO_1347 ) ( CLEAR ?AUTO_1346 ) ( not ( = ?AUTO_1342 ?AUTO_1345 ) ) ( not ( = ?AUTO_1342 ?AUTO_1346 ) ) ( not ( = ?AUTO_1343 ?AUTO_1345 ) ) ( not ( = ?AUTO_1343 ?AUTO_1346 ) ) ( not ( = ?AUTO_1344 ?AUTO_1345 ) ) ( not ( = ?AUTO_1344 ?AUTO_1346 ) ) ( not ( = ?AUTO_1347 ?AUTO_1345 ) ) ( not ( = ?AUTO_1347 ?AUTO_1346 ) ) ( not ( = ?AUTO_1345 ?AUTO_1346 ) ) ( ON ?AUTO_1345 ?AUTO_1342 ) ( CLEAR ?AUTO_1345 ) ( HOLDING ?AUTO_1348 ) ( CLEAR ?AUTO_1349 ) ( not ( = ?AUTO_1342 ?AUTO_1348 ) ) ( not ( = ?AUTO_1342 ?AUTO_1349 ) ) ( not ( = ?AUTO_1343 ?AUTO_1348 ) ) ( not ( = ?AUTO_1343 ?AUTO_1349 ) ) ( not ( = ?AUTO_1344 ?AUTO_1348 ) ) ( not ( = ?AUTO_1344 ?AUTO_1349 ) ) ( not ( = ?AUTO_1347 ?AUTO_1348 ) ) ( not ( = ?AUTO_1347 ?AUTO_1349 ) ) ( not ( = ?AUTO_1346 ?AUTO_1348 ) ) ( not ( = ?AUTO_1346 ?AUTO_1349 ) ) ( not ( = ?AUTO_1345 ?AUTO_1348 ) ) ( not ( = ?AUTO_1345 ?AUTO_1349 ) ) ( not ( = ?AUTO_1348 ?AUTO_1349 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1348 ?AUTO_1349 )
      ( MAKE-ON ?AUTO_1342 ?AUTO_1343 )
      ( MAKE-ON-VERIFY ?AUTO_1342 ?AUTO_1343 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1351 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1351 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1351 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1351 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1352 - BLOCK
    )
    :vars
    (
      ?AUTO_1353 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1352 ?AUTO_1353 ) ( CLEAR ?AUTO_1352 ) ( HAND-EMPTY ) ( not ( = ?AUTO_1352 ?AUTO_1353 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1352 ?AUTO_1353 )
      ( MAKE-ON-TABLE ?AUTO_1352 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1352 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1355 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1355 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1355 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1355 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1356 - BLOCK
    )
    :vars
    (
      ?AUTO_1357 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1356 ?AUTO_1357 ) ( CLEAR ?AUTO_1356 ) ( HAND-EMPTY ) ( not ( = ?AUTO_1356 ?AUTO_1357 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1356 ?AUTO_1357 )
      ( MAKE-ON-TABLE ?AUTO_1356 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1356 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1358 - BLOCK
    )
    :vars
    (
      ?AUTO_1359 - BLOCK
      ?AUTO_1360 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1358 ?AUTO_1359 ) ( CLEAR ?AUTO_1358 ) ( not ( = ?AUTO_1358 ?AUTO_1359 ) ) ( HOLDING ?AUTO_1360 ) ( not ( = ?AUTO_1358 ?AUTO_1360 ) ) ( not ( = ?AUTO_1359 ?AUTO_1360 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1360 )
      ( MAKE-ON-TABLE ?AUTO_1358 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1358 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1361 - BLOCK
    )
    :vars
    (
      ?AUTO_1362 - BLOCK
      ?AUTO_1363 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1361 ?AUTO_1362 ) ( not ( = ?AUTO_1361 ?AUTO_1362 ) ) ( not ( = ?AUTO_1361 ?AUTO_1363 ) ) ( not ( = ?AUTO_1362 ?AUTO_1363 ) ) ( ON ?AUTO_1363 ?AUTO_1361 ) ( CLEAR ?AUTO_1363 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1363 ?AUTO_1361 )
      ( MAKE-ON-TABLE ?AUTO_1361 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1361 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1365 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1365 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1365 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1365 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1366 - BLOCK
    )
    :vars
    (
      ?AUTO_1367 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1366 ?AUTO_1367 ) ( CLEAR ?AUTO_1366 ) ( HAND-EMPTY ) ( not ( = ?AUTO_1366 ?AUTO_1367 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1366 ?AUTO_1367 )
      ( MAKE-ON-TABLE ?AUTO_1366 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1366 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1368 - BLOCK
    )
    :vars
    (
      ?AUTO_1369 - BLOCK
      ?AUTO_1370 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1368 ?AUTO_1369 ) ( CLEAR ?AUTO_1368 ) ( not ( = ?AUTO_1368 ?AUTO_1369 ) ) ( HOLDING ?AUTO_1370 ) ( not ( = ?AUTO_1368 ?AUTO_1370 ) ) ( not ( = ?AUTO_1369 ?AUTO_1370 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1370 )
      ( MAKE-ON-TABLE ?AUTO_1368 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1368 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1371 - BLOCK
    )
    :vars
    (
      ?AUTO_1372 - BLOCK
      ?AUTO_1373 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1371 ?AUTO_1372 ) ( not ( = ?AUTO_1371 ?AUTO_1372 ) ) ( not ( = ?AUTO_1371 ?AUTO_1373 ) ) ( not ( = ?AUTO_1372 ?AUTO_1373 ) ) ( ON ?AUTO_1373 ?AUTO_1371 ) ( CLEAR ?AUTO_1373 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1373 ?AUTO_1371 )
      ( MAKE-ON-TABLE ?AUTO_1371 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1371 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1374 - BLOCK
    )
    :vars
    (
      ?AUTO_1375 - BLOCK
      ?AUTO_1376 - BLOCK
      ?AUTO_1377 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1374 ?AUTO_1375 ) ( not ( = ?AUTO_1374 ?AUTO_1375 ) ) ( not ( = ?AUTO_1374 ?AUTO_1376 ) ) ( not ( = ?AUTO_1375 ?AUTO_1376 ) ) ( ON ?AUTO_1376 ?AUTO_1374 ) ( CLEAR ?AUTO_1376 ) ( HOLDING ?AUTO_1377 ) ( not ( = ?AUTO_1374 ?AUTO_1377 ) ) ( not ( = ?AUTO_1375 ?AUTO_1377 ) ) ( not ( = ?AUTO_1376 ?AUTO_1377 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1377 )
      ( MAKE-ON-TABLE ?AUTO_1374 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1374 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1378 - BLOCK
    )
    :vars
    (
      ?AUTO_1379 - BLOCK
      ?AUTO_1380 - BLOCK
      ?AUTO_1381 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1378 ?AUTO_1379 ) ( not ( = ?AUTO_1378 ?AUTO_1379 ) ) ( not ( = ?AUTO_1378 ?AUTO_1380 ) ) ( not ( = ?AUTO_1379 ?AUTO_1380 ) ) ( ON ?AUTO_1380 ?AUTO_1378 ) ( not ( = ?AUTO_1378 ?AUTO_1381 ) ) ( not ( = ?AUTO_1379 ?AUTO_1381 ) ) ( not ( = ?AUTO_1380 ?AUTO_1381 ) ) ( ON ?AUTO_1381 ?AUTO_1380 ) ( CLEAR ?AUTO_1381 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1381 ?AUTO_1380 )
      ( MAKE-ON-TABLE ?AUTO_1378 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1378 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1384 - BLOCK
      ?AUTO_1385 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1384 ) ( CLEAR ?AUTO_1385 ) ( not ( = ?AUTO_1384 ?AUTO_1385 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1384 ?AUTO_1385 )
      ( MAKE-ON-VERIFY ?AUTO_1384 ?AUTO_1385 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1386 - BLOCK
      ?AUTO_1387 - BLOCK
    )
    :vars
    (
      ?AUTO_1388 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1387 ) ( not ( = ?AUTO_1386 ?AUTO_1387 ) ) ( ON ?AUTO_1386 ?AUTO_1388 ) ( CLEAR ?AUTO_1386 ) ( HAND-EMPTY ) ( not ( = ?AUTO_1386 ?AUTO_1388 ) ) ( not ( = ?AUTO_1387 ?AUTO_1388 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1386 ?AUTO_1388 )
      ( MAKE-ON ?AUTO_1386 ?AUTO_1387 )
      ( MAKE-ON-VERIFY ?AUTO_1386 ?AUTO_1387 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1389 - BLOCK
      ?AUTO_1390 - BLOCK
    )
    :vars
    (
      ?AUTO_1391 - BLOCK
      ?AUTO_1392 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1390 ) ( not ( = ?AUTO_1389 ?AUTO_1390 ) ) ( ON ?AUTO_1389 ?AUTO_1391 ) ( CLEAR ?AUTO_1389 ) ( not ( = ?AUTO_1389 ?AUTO_1391 ) ) ( not ( = ?AUTO_1390 ?AUTO_1391 ) ) ( HOLDING ?AUTO_1392 ) ( not ( = ?AUTO_1389 ?AUTO_1392 ) ) ( not ( = ?AUTO_1390 ?AUTO_1392 ) ) ( not ( = ?AUTO_1391 ?AUTO_1392 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1392 )
      ( MAKE-ON ?AUTO_1389 ?AUTO_1390 )
      ( MAKE-ON-VERIFY ?AUTO_1389 ?AUTO_1390 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1393 - BLOCK
      ?AUTO_1394 - BLOCK
    )
    :vars
    (
      ?AUTO_1395 - BLOCK
      ?AUTO_1396 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1394 ) ( not ( = ?AUTO_1393 ?AUTO_1394 ) ) ( ON ?AUTO_1393 ?AUTO_1395 ) ( not ( = ?AUTO_1393 ?AUTO_1395 ) ) ( not ( = ?AUTO_1394 ?AUTO_1395 ) ) ( not ( = ?AUTO_1393 ?AUTO_1396 ) ) ( not ( = ?AUTO_1394 ?AUTO_1396 ) ) ( not ( = ?AUTO_1395 ?AUTO_1396 ) ) ( ON ?AUTO_1396 ?AUTO_1393 ) ( CLEAR ?AUTO_1396 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1396 ?AUTO_1393 )
      ( MAKE-ON ?AUTO_1393 ?AUTO_1394 )
      ( MAKE-ON-VERIFY ?AUTO_1393 ?AUTO_1394 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1397 - BLOCK
      ?AUTO_1398 - BLOCK
    )
    :vars
    (
      ?AUTO_1399 - BLOCK
      ?AUTO_1400 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1397 ?AUTO_1398 ) ) ( ON ?AUTO_1397 ?AUTO_1399 ) ( not ( = ?AUTO_1397 ?AUTO_1399 ) ) ( not ( = ?AUTO_1398 ?AUTO_1399 ) ) ( not ( = ?AUTO_1397 ?AUTO_1400 ) ) ( not ( = ?AUTO_1398 ?AUTO_1400 ) ) ( not ( = ?AUTO_1399 ?AUTO_1400 ) ) ( ON ?AUTO_1400 ?AUTO_1397 ) ( CLEAR ?AUTO_1400 ) ( HOLDING ?AUTO_1398 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1398 )
      ( MAKE-ON ?AUTO_1397 ?AUTO_1398 )
      ( MAKE-ON-VERIFY ?AUTO_1397 ?AUTO_1398 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1401 - BLOCK
      ?AUTO_1402 - BLOCK
    )
    :vars
    (
      ?AUTO_1403 - BLOCK
      ?AUTO_1404 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1401 ?AUTO_1402 ) ) ( ON ?AUTO_1401 ?AUTO_1403 ) ( not ( = ?AUTO_1401 ?AUTO_1403 ) ) ( not ( = ?AUTO_1402 ?AUTO_1403 ) ) ( not ( = ?AUTO_1401 ?AUTO_1404 ) ) ( not ( = ?AUTO_1402 ?AUTO_1404 ) ) ( not ( = ?AUTO_1403 ?AUTO_1404 ) ) ( ON ?AUTO_1404 ?AUTO_1401 ) ( ON ?AUTO_1402 ?AUTO_1404 ) ( CLEAR ?AUTO_1402 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1402 ?AUTO_1404 )
      ( MAKE-ON ?AUTO_1401 ?AUTO_1402 )
      ( MAKE-ON-VERIFY ?AUTO_1401 ?AUTO_1402 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1405 - BLOCK
      ?AUTO_1406 - BLOCK
    )
    :vars
    (
      ?AUTO_1408 - BLOCK
      ?AUTO_1407 - BLOCK
      ?AUTO_1409 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1405 ?AUTO_1406 ) ) ( ON ?AUTO_1405 ?AUTO_1408 ) ( not ( = ?AUTO_1405 ?AUTO_1408 ) ) ( not ( = ?AUTO_1406 ?AUTO_1408 ) ) ( not ( = ?AUTO_1405 ?AUTO_1407 ) ) ( not ( = ?AUTO_1406 ?AUTO_1407 ) ) ( not ( = ?AUTO_1408 ?AUTO_1407 ) ) ( ON ?AUTO_1407 ?AUTO_1405 ) ( ON ?AUTO_1406 ?AUTO_1407 ) ( CLEAR ?AUTO_1406 ) ( HOLDING ?AUTO_1409 ) ( not ( = ?AUTO_1405 ?AUTO_1409 ) ) ( not ( = ?AUTO_1406 ?AUTO_1409 ) ) ( not ( = ?AUTO_1408 ?AUTO_1409 ) ) ( not ( = ?AUTO_1407 ?AUTO_1409 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1409 )
      ( MAKE-ON ?AUTO_1405 ?AUTO_1406 )
      ( MAKE-ON-VERIFY ?AUTO_1405 ?AUTO_1406 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1410 - BLOCK
      ?AUTO_1411 - BLOCK
    )
    :vars
    (
      ?AUTO_1412 - BLOCK
      ?AUTO_1413 - BLOCK
      ?AUTO_1414 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1410 ?AUTO_1411 ) ) ( ON ?AUTO_1410 ?AUTO_1412 ) ( not ( = ?AUTO_1410 ?AUTO_1412 ) ) ( not ( = ?AUTO_1411 ?AUTO_1412 ) ) ( not ( = ?AUTO_1410 ?AUTO_1413 ) ) ( not ( = ?AUTO_1411 ?AUTO_1413 ) ) ( not ( = ?AUTO_1412 ?AUTO_1413 ) ) ( ON ?AUTO_1413 ?AUTO_1410 ) ( ON ?AUTO_1411 ?AUTO_1413 ) ( not ( = ?AUTO_1410 ?AUTO_1414 ) ) ( not ( = ?AUTO_1411 ?AUTO_1414 ) ) ( not ( = ?AUTO_1412 ?AUTO_1414 ) ) ( not ( = ?AUTO_1413 ?AUTO_1414 ) ) ( ON ?AUTO_1414 ?AUTO_1411 ) ( CLEAR ?AUTO_1414 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1414 ?AUTO_1411 )
      ( MAKE-ON ?AUTO_1410 ?AUTO_1411 )
      ( MAKE-ON-VERIFY ?AUTO_1410 ?AUTO_1411 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1417 - BLOCK
      ?AUTO_1418 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1417 ) ( CLEAR ?AUTO_1418 ) ( not ( = ?AUTO_1417 ?AUTO_1418 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1417 ?AUTO_1418 )
      ( MAKE-ON-VERIFY ?AUTO_1417 ?AUTO_1418 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1419 - BLOCK
      ?AUTO_1420 - BLOCK
    )
    :vars
    (
      ?AUTO_1421 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1420 ) ( not ( = ?AUTO_1419 ?AUTO_1420 ) ) ( ON ?AUTO_1419 ?AUTO_1421 ) ( CLEAR ?AUTO_1419 ) ( HAND-EMPTY ) ( not ( = ?AUTO_1419 ?AUTO_1421 ) ) ( not ( = ?AUTO_1420 ?AUTO_1421 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1419 ?AUTO_1421 )
      ( MAKE-ON ?AUTO_1419 ?AUTO_1420 )
      ( MAKE-ON-VERIFY ?AUTO_1419 ?AUTO_1420 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1422 - BLOCK
      ?AUTO_1423 - BLOCK
    )
    :vars
    (
      ?AUTO_1424 - BLOCK
      ?AUTO_1425 - BLOCK
      ?AUTO_1426 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1423 ) ( not ( = ?AUTO_1422 ?AUTO_1423 ) ) ( ON ?AUTO_1422 ?AUTO_1424 ) ( CLEAR ?AUTO_1422 ) ( not ( = ?AUTO_1422 ?AUTO_1424 ) ) ( not ( = ?AUTO_1423 ?AUTO_1424 ) ) ( HOLDING ?AUTO_1425 ) ( CLEAR ?AUTO_1426 ) ( not ( = ?AUTO_1422 ?AUTO_1425 ) ) ( not ( = ?AUTO_1422 ?AUTO_1426 ) ) ( not ( = ?AUTO_1423 ?AUTO_1425 ) ) ( not ( = ?AUTO_1423 ?AUTO_1426 ) ) ( not ( = ?AUTO_1424 ?AUTO_1425 ) ) ( not ( = ?AUTO_1424 ?AUTO_1426 ) ) ( not ( = ?AUTO_1425 ?AUTO_1426 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1425 ?AUTO_1426 )
      ( MAKE-ON ?AUTO_1422 ?AUTO_1423 )
      ( MAKE-ON-VERIFY ?AUTO_1422 ?AUTO_1423 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1427 - BLOCK
      ?AUTO_1428 - BLOCK
    )
    :vars
    (
      ?AUTO_1429 - BLOCK
      ?AUTO_1430 - BLOCK
      ?AUTO_1431 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1427 ?AUTO_1428 ) ) ( ON ?AUTO_1427 ?AUTO_1429 ) ( CLEAR ?AUTO_1427 ) ( not ( = ?AUTO_1427 ?AUTO_1429 ) ) ( not ( = ?AUTO_1428 ?AUTO_1429 ) ) ( CLEAR ?AUTO_1430 ) ( not ( = ?AUTO_1427 ?AUTO_1431 ) ) ( not ( = ?AUTO_1427 ?AUTO_1430 ) ) ( not ( = ?AUTO_1428 ?AUTO_1431 ) ) ( not ( = ?AUTO_1428 ?AUTO_1430 ) ) ( not ( = ?AUTO_1429 ?AUTO_1431 ) ) ( not ( = ?AUTO_1429 ?AUTO_1430 ) ) ( not ( = ?AUTO_1431 ?AUTO_1430 ) ) ( ON ?AUTO_1431 ?AUTO_1428 ) ( CLEAR ?AUTO_1431 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1431 ?AUTO_1428 )
      ( MAKE-ON ?AUTO_1427 ?AUTO_1428 )
      ( MAKE-ON-VERIFY ?AUTO_1427 ?AUTO_1428 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1432 - BLOCK
      ?AUTO_1433 - BLOCK
    )
    :vars
    (
      ?AUTO_1436 - BLOCK
      ?AUTO_1434 - BLOCK
      ?AUTO_1435 - BLOCK
      ?AUTO_1437 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1432 ?AUTO_1433 ) ) ( ON ?AUTO_1432 ?AUTO_1436 ) ( CLEAR ?AUTO_1432 ) ( not ( = ?AUTO_1432 ?AUTO_1436 ) ) ( not ( = ?AUTO_1433 ?AUTO_1436 ) ) ( CLEAR ?AUTO_1434 ) ( not ( = ?AUTO_1432 ?AUTO_1435 ) ) ( not ( = ?AUTO_1432 ?AUTO_1434 ) ) ( not ( = ?AUTO_1433 ?AUTO_1435 ) ) ( not ( = ?AUTO_1433 ?AUTO_1434 ) ) ( not ( = ?AUTO_1436 ?AUTO_1435 ) ) ( not ( = ?AUTO_1436 ?AUTO_1434 ) ) ( not ( = ?AUTO_1435 ?AUTO_1434 ) ) ( ON ?AUTO_1435 ?AUTO_1433 ) ( CLEAR ?AUTO_1435 ) ( HOLDING ?AUTO_1437 ) ( not ( = ?AUTO_1432 ?AUTO_1437 ) ) ( not ( = ?AUTO_1433 ?AUTO_1437 ) ) ( not ( = ?AUTO_1436 ?AUTO_1437 ) ) ( not ( = ?AUTO_1434 ?AUTO_1437 ) ) ( not ( = ?AUTO_1435 ?AUTO_1437 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1437 )
      ( MAKE-ON ?AUTO_1432 ?AUTO_1433 )
      ( MAKE-ON-VERIFY ?AUTO_1432 ?AUTO_1433 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1438 - BLOCK
      ?AUTO_1439 - BLOCK
    )
    :vars
    (
      ?AUTO_1443 - BLOCK
      ?AUTO_1441 - BLOCK
      ?AUTO_1442 - BLOCK
      ?AUTO_1440 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1438 ?AUTO_1439 ) ) ( ON ?AUTO_1438 ?AUTO_1443 ) ( CLEAR ?AUTO_1438 ) ( not ( = ?AUTO_1438 ?AUTO_1443 ) ) ( not ( = ?AUTO_1439 ?AUTO_1443 ) ) ( CLEAR ?AUTO_1441 ) ( not ( = ?AUTO_1438 ?AUTO_1442 ) ) ( not ( = ?AUTO_1438 ?AUTO_1441 ) ) ( not ( = ?AUTO_1439 ?AUTO_1442 ) ) ( not ( = ?AUTO_1439 ?AUTO_1441 ) ) ( not ( = ?AUTO_1443 ?AUTO_1442 ) ) ( not ( = ?AUTO_1443 ?AUTO_1441 ) ) ( not ( = ?AUTO_1442 ?AUTO_1441 ) ) ( ON ?AUTO_1442 ?AUTO_1439 ) ( not ( = ?AUTO_1438 ?AUTO_1440 ) ) ( not ( = ?AUTO_1439 ?AUTO_1440 ) ) ( not ( = ?AUTO_1443 ?AUTO_1440 ) ) ( not ( = ?AUTO_1441 ?AUTO_1440 ) ) ( not ( = ?AUTO_1442 ?AUTO_1440 ) ) ( ON ?AUTO_1440 ?AUTO_1442 ) ( CLEAR ?AUTO_1440 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1440 ?AUTO_1442 )
      ( MAKE-ON ?AUTO_1438 ?AUTO_1439 )
      ( MAKE-ON-VERIFY ?AUTO_1438 ?AUTO_1439 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1444 - BLOCK
      ?AUTO_1445 - BLOCK
    )
    :vars
    (
      ?AUTO_1446 - BLOCK
      ?AUTO_1448 - BLOCK
      ?AUTO_1447 - BLOCK
      ?AUTO_1449 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1444 ?AUTO_1445 ) ) ( ON ?AUTO_1444 ?AUTO_1446 ) ( CLEAR ?AUTO_1444 ) ( not ( = ?AUTO_1444 ?AUTO_1446 ) ) ( not ( = ?AUTO_1445 ?AUTO_1446 ) ) ( not ( = ?AUTO_1444 ?AUTO_1448 ) ) ( not ( = ?AUTO_1444 ?AUTO_1447 ) ) ( not ( = ?AUTO_1445 ?AUTO_1448 ) ) ( not ( = ?AUTO_1445 ?AUTO_1447 ) ) ( not ( = ?AUTO_1446 ?AUTO_1448 ) ) ( not ( = ?AUTO_1446 ?AUTO_1447 ) ) ( not ( = ?AUTO_1448 ?AUTO_1447 ) ) ( ON ?AUTO_1448 ?AUTO_1445 ) ( not ( = ?AUTO_1444 ?AUTO_1449 ) ) ( not ( = ?AUTO_1445 ?AUTO_1449 ) ) ( not ( = ?AUTO_1446 ?AUTO_1449 ) ) ( not ( = ?AUTO_1447 ?AUTO_1449 ) ) ( not ( = ?AUTO_1448 ?AUTO_1449 ) ) ( ON ?AUTO_1449 ?AUTO_1448 ) ( CLEAR ?AUTO_1449 ) ( HOLDING ?AUTO_1447 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1447 )
      ( MAKE-ON ?AUTO_1444 ?AUTO_1445 )
      ( MAKE-ON-VERIFY ?AUTO_1444 ?AUTO_1445 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1450 - BLOCK
      ?AUTO_1451 - BLOCK
    )
    :vars
    (
      ?AUTO_1454 - BLOCK
      ?AUTO_1455 - BLOCK
      ?AUTO_1453 - BLOCK
      ?AUTO_1452 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1450 ?AUTO_1451 ) ) ( ON ?AUTO_1450 ?AUTO_1454 ) ( CLEAR ?AUTO_1450 ) ( not ( = ?AUTO_1450 ?AUTO_1454 ) ) ( not ( = ?AUTO_1451 ?AUTO_1454 ) ) ( not ( = ?AUTO_1450 ?AUTO_1455 ) ) ( not ( = ?AUTO_1450 ?AUTO_1453 ) ) ( not ( = ?AUTO_1451 ?AUTO_1455 ) ) ( not ( = ?AUTO_1451 ?AUTO_1453 ) ) ( not ( = ?AUTO_1454 ?AUTO_1455 ) ) ( not ( = ?AUTO_1454 ?AUTO_1453 ) ) ( not ( = ?AUTO_1455 ?AUTO_1453 ) ) ( ON ?AUTO_1455 ?AUTO_1451 ) ( not ( = ?AUTO_1450 ?AUTO_1452 ) ) ( not ( = ?AUTO_1451 ?AUTO_1452 ) ) ( not ( = ?AUTO_1454 ?AUTO_1452 ) ) ( not ( = ?AUTO_1453 ?AUTO_1452 ) ) ( not ( = ?AUTO_1455 ?AUTO_1452 ) ) ( ON ?AUTO_1452 ?AUTO_1455 ) ( ON ?AUTO_1453 ?AUTO_1452 ) ( CLEAR ?AUTO_1453 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1453 ?AUTO_1452 )
      ( MAKE-ON ?AUTO_1450 ?AUTO_1451 )
      ( MAKE-ON-VERIFY ?AUTO_1450 ?AUTO_1451 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1456 - BLOCK
      ?AUTO_1457 - BLOCK
    )
    :vars
    (
      ?AUTO_1461 - BLOCK
      ?AUTO_1458 - BLOCK
      ?AUTO_1460 - BLOCK
      ?AUTO_1459 - BLOCK
      ?AUTO_1462 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1456 ?AUTO_1457 ) ) ( ON ?AUTO_1456 ?AUTO_1461 ) ( CLEAR ?AUTO_1456 ) ( not ( = ?AUTO_1456 ?AUTO_1461 ) ) ( not ( = ?AUTO_1457 ?AUTO_1461 ) ) ( not ( = ?AUTO_1456 ?AUTO_1458 ) ) ( not ( = ?AUTO_1456 ?AUTO_1460 ) ) ( not ( = ?AUTO_1457 ?AUTO_1458 ) ) ( not ( = ?AUTO_1457 ?AUTO_1460 ) ) ( not ( = ?AUTO_1461 ?AUTO_1458 ) ) ( not ( = ?AUTO_1461 ?AUTO_1460 ) ) ( not ( = ?AUTO_1458 ?AUTO_1460 ) ) ( ON ?AUTO_1458 ?AUTO_1457 ) ( not ( = ?AUTO_1456 ?AUTO_1459 ) ) ( not ( = ?AUTO_1457 ?AUTO_1459 ) ) ( not ( = ?AUTO_1461 ?AUTO_1459 ) ) ( not ( = ?AUTO_1460 ?AUTO_1459 ) ) ( not ( = ?AUTO_1458 ?AUTO_1459 ) ) ( ON ?AUTO_1459 ?AUTO_1458 ) ( ON ?AUTO_1460 ?AUTO_1459 ) ( CLEAR ?AUTO_1460 ) ( HOLDING ?AUTO_1462 ) ( not ( = ?AUTO_1456 ?AUTO_1462 ) ) ( not ( = ?AUTO_1457 ?AUTO_1462 ) ) ( not ( = ?AUTO_1461 ?AUTO_1462 ) ) ( not ( = ?AUTO_1458 ?AUTO_1462 ) ) ( not ( = ?AUTO_1460 ?AUTO_1462 ) ) ( not ( = ?AUTO_1459 ?AUTO_1462 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1462 )
      ( MAKE-ON ?AUTO_1456 ?AUTO_1457 )
      ( MAKE-ON-VERIFY ?AUTO_1456 ?AUTO_1457 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1463 - BLOCK
      ?AUTO_1464 - BLOCK
    )
    :vars
    (
      ?AUTO_1466 - BLOCK
      ?AUTO_1465 - BLOCK
      ?AUTO_1469 - BLOCK
      ?AUTO_1467 - BLOCK
      ?AUTO_1468 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1463 ?AUTO_1464 ) ) ( ON ?AUTO_1463 ?AUTO_1466 ) ( CLEAR ?AUTO_1463 ) ( not ( = ?AUTO_1463 ?AUTO_1466 ) ) ( not ( = ?AUTO_1464 ?AUTO_1466 ) ) ( not ( = ?AUTO_1463 ?AUTO_1465 ) ) ( not ( = ?AUTO_1463 ?AUTO_1469 ) ) ( not ( = ?AUTO_1464 ?AUTO_1465 ) ) ( not ( = ?AUTO_1464 ?AUTO_1469 ) ) ( not ( = ?AUTO_1466 ?AUTO_1465 ) ) ( not ( = ?AUTO_1466 ?AUTO_1469 ) ) ( not ( = ?AUTO_1465 ?AUTO_1469 ) ) ( ON ?AUTO_1465 ?AUTO_1464 ) ( not ( = ?AUTO_1463 ?AUTO_1467 ) ) ( not ( = ?AUTO_1464 ?AUTO_1467 ) ) ( not ( = ?AUTO_1466 ?AUTO_1467 ) ) ( not ( = ?AUTO_1469 ?AUTO_1467 ) ) ( not ( = ?AUTO_1465 ?AUTO_1467 ) ) ( ON ?AUTO_1467 ?AUTO_1465 ) ( ON ?AUTO_1469 ?AUTO_1467 ) ( not ( = ?AUTO_1463 ?AUTO_1468 ) ) ( not ( = ?AUTO_1464 ?AUTO_1468 ) ) ( not ( = ?AUTO_1466 ?AUTO_1468 ) ) ( not ( = ?AUTO_1465 ?AUTO_1468 ) ) ( not ( = ?AUTO_1469 ?AUTO_1468 ) ) ( not ( = ?AUTO_1467 ?AUTO_1468 ) ) ( ON ?AUTO_1468 ?AUTO_1469 ) ( CLEAR ?AUTO_1468 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1468 ?AUTO_1469 )
      ( MAKE-ON ?AUTO_1463 ?AUTO_1464 )
      ( MAKE-ON-VERIFY ?AUTO_1463 ?AUTO_1464 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1472 - BLOCK
      ?AUTO_1473 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1472 ) ( CLEAR ?AUTO_1473 ) ( not ( = ?AUTO_1472 ?AUTO_1473 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1472 ?AUTO_1473 )
      ( MAKE-ON-VERIFY ?AUTO_1472 ?AUTO_1473 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1474 - BLOCK
      ?AUTO_1475 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1475 ) ( not ( = ?AUTO_1474 ?AUTO_1475 ) ) ( ON-TABLE ?AUTO_1474 ) ( CLEAR ?AUTO_1474 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_1474 )
      ( MAKE-ON ?AUTO_1474 ?AUTO_1475 )
      ( MAKE-ON-VERIFY ?AUTO_1474 ?AUTO_1475 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1476 - BLOCK
      ?AUTO_1477 - BLOCK
    )
    :vars
    (
      ?AUTO_1478 - BLOCK
      ?AUTO_1479 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1477 ) ( not ( = ?AUTO_1476 ?AUTO_1477 ) ) ( ON-TABLE ?AUTO_1476 ) ( CLEAR ?AUTO_1476 ) ( HOLDING ?AUTO_1478 ) ( CLEAR ?AUTO_1479 ) ( not ( = ?AUTO_1476 ?AUTO_1478 ) ) ( not ( = ?AUTO_1476 ?AUTO_1479 ) ) ( not ( = ?AUTO_1477 ?AUTO_1478 ) ) ( not ( = ?AUTO_1477 ?AUTO_1479 ) ) ( not ( = ?AUTO_1478 ?AUTO_1479 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1478 ?AUTO_1479 )
      ( MAKE-ON ?AUTO_1476 ?AUTO_1477 )
      ( MAKE-ON-VERIFY ?AUTO_1476 ?AUTO_1477 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1486 - BLOCK
      ?AUTO_1487 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1486 ?AUTO_1487 ) ) ( ON-TABLE ?AUTO_1486 ) ( CLEAR ?AUTO_1486 ) ( HOLDING ?AUTO_1487 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1487 )
      ( MAKE-ON ?AUTO_1486 ?AUTO_1487 )
      ( MAKE-ON-VERIFY ?AUTO_1486 ?AUTO_1487 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1492 - BLOCK
      ?AUTO_1493 - BLOCK
    )
    :vars
    (
      ?AUTO_1494 - BLOCK
      ?AUTO_1495 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1492 ?AUTO_1493 ) ) ( ON-TABLE ?AUTO_1492 ) ( CLEAR ?AUTO_1492 ) ( CLEAR ?AUTO_1494 ) ( not ( = ?AUTO_1492 ?AUTO_1495 ) ) ( not ( = ?AUTO_1492 ?AUTO_1494 ) ) ( not ( = ?AUTO_1493 ?AUTO_1495 ) ) ( not ( = ?AUTO_1493 ?AUTO_1494 ) ) ( not ( = ?AUTO_1495 ?AUTO_1494 ) ) ( ON ?AUTO_1495 ?AUTO_1493 ) ( CLEAR ?AUTO_1495 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1495 ?AUTO_1493 )
      ( MAKE-ON ?AUTO_1492 ?AUTO_1493 )
      ( MAKE-ON-VERIFY ?AUTO_1492 ?AUTO_1493 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1496 - BLOCK
      ?AUTO_1497 - BLOCK
    )
    :vars
    (
      ?AUTO_1499 - BLOCK
      ?AUTO_1498 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1496 ?AUTO_1497 ) ) ( CLEAR ?AUTO_1499 ) ( not ( = ?AUTO_1496 ?AUTO_1498 ) ) ( not ( = ?AUTO_1496 ?AUTO_1499 ) ) ( not ( = ?AUTO_1497 ?AUTO_1498 ) ) ( not ( = ?AUTO_1497 ?AUTO_1499 ) ) ( not ( = ?AUTO_1498 ?AUTO_1499 ) ) ( ON ?AUTO_1498 ?AUTO_1497 ) ( CLEAR ?AUTO_1498 ) ( HOLDING ?AUTO_1496 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1496 )
      ( MAKE-ON ?AUTO_1496 ?AUTO_1497 )
      ( MAKE-ON-VERIFY ?AUTO_1496 ?AUTO_1497 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1500 - BLOCK
      ?AUTO_1501 - BLOCK
    )
    :vars
    (
      ?AUTO_1502 - BLOCK
      ?AUTO_1503 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1500 ?AUTO_1501 ) ) ( CLEAR ?AUTO_1502 ) ( not ( = ?AUTO_1500 ?AUTO_1503 ) ) ( not ( = ?AUTO_1500 ?AUTO_1502 ) ) ( not ( = ?AUTO_1501 ?AUTO_1503 ) ) ( not ( = ?AUTO_1501 ?AUTO_1502 ) ) ( not ( = ?AUTO_1503 ?AUTO_1502 ) ) ( ON ?AUTO_1503 ?AUTO_1501 ) ( ON ?AUTO_1500 ?AUTO_1503 ) ( CLEAR ?AUTO_1500 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1500 ?AUTO_1503 )
      ( MAKE-ON ?AUTO_1500 ?AUTO_1501 )
      ( MAKE-ON-VERIFY ?AUTO_1500 ?AUTO_1501 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1505 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1505 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1505 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1505 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1506 - BLOCK
    )
    :vars
    (
      ?AUTO_1507 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1506 ?AUTO_1507 ) ( CLEAR ?AUTO_1506 ) ( HAND-EMPTY ) ( not ( = ?AUTO_1506 ?AUTO_1507 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1506 ?AUTO_1507 )
      ( MAKE-ON-TABLE ?AUTO_1506 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1506 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1509 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1509 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1509 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1509 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1510 - BLOCK
    )
    :vars
    (
      ?AUTO_1511 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1510 ?AUTO_1511 ) ( CLEAR ?AUTO_1510 ) ( HAND-EMPTY ) ( not ( = ?AUTO_1510 ?AUTO_1511 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1510 ?AUTO_1511 )
      ( MAKE-ON-TABLE ?AUTO_1510 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1510 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1512 - BLOCK
    )
    :vars
    (
      ?AUTO_1513 - BLOCK
      ?AUTO_1514 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1512 ?AUTO_1513 ) ( CLEAR ?AUTO_1512 ) ( not ( = ?AUTO_1512 ?AUTO_1513 ) ) ( HOLDING ?AUTO_1514 ) ( not ( = ?AUTO_1512 ?AUTO_1514 ) ) ( not ( = ?AUTO_1513 ?AUTO_1514 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1514 )
      ( MAKE-ON-TABLE ?AUTO_1512 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1512 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1515 - BLOCK
    )
    :vars
    (
      ?AUTO_1516 - BLOCK
      ?AUTO_1517 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1515 ?AUTO_1516 ) ( not ( = ?AUTO_1515 ?AUTO_1516 ) ) ( not ( = ?AUTO_1515 ?AUTO_1517 ) ) ( not ( = ?AUTO_1516 ?AUTO_1517 ) ) ( ON ?AUTO_1517 ?AUTO_1515 ) ( CLEAR ?AUTO_1517 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1517 ?AUTO_1515 )
      ( MAKE-ON-TABLE ?AUTO_1515 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1515 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1520 - BLOCK
      ?AUTO_1521 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1520 ) ( CLEAR ?AUTO_1521 ) ( not ( = ?AUTO_1520 ?AUTO_1521 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1520 ?AUTO_1521 )
      ( MAKE-ON-VERIFY ?AUTO_1520 ?AUTO_1521 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1522 - BLOCK
      ?AUTO_1523 - BLOCK
    )
    :vars
    (
      ?AUTO_1524 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1523 ) ( not ( = ?AUTO_1522 ?AUTO_1523 ) ) ( ON ?AUTO_1522 ?AUTO_1524 ) ( CLEAR ?AUTO_1522 ) ( HAND-EMPTY ) ( not ( = ?AUTO_1522 ?AUTO_1524 ) ) ( not ( = ?AUTO_1523 ?AUTO_1524 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1522 ?AUTO_1524 )
      ( MAKE-ON ?AUTO_1522 ?AUTO_1523 )
      ( MAKE-ON-VERIFY ?AUTO_1522 ?AUTO_1523 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1525 - BLOCK
      ?AUTO_1526 - BLOCK
    )
    :vars
    (
      ?AUTO_1527 - BLOCK
      ?AUTO_1528 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1526 ) ( not ( = ?AUTO_1525 ?AUTO_1526 ) ) ( ON ?AUTO_1525 ?AUTO_1527 ) ( CLEAR ?AUTO_1525 ) ( not ( = ?AUTO_1525 ?AUTO_1527 ) ) ( not ( = ?AUTO_1526 ?AUTO_1527 ) ) ( HOLDING ?AUTO_1528 ) ( not ( = ?AUTO_1525 ?AUTO_1528 ) ) ( not ( = ?AUTO_1526 ?AUTO_1528 ) ) ( not ( = ?AUTO_1527 ?AUTO_1528 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1528 )
      ( MAKE-ON ?AUTO_1525 ?AUTO_1526 )
      ( MAKE-ON-VERIFY ?AUTO_1525 ?AUTO_1526 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1529 - BLOCK
      ?AUTO_1530 - BLOCK
    )
    :vars
    (
      ?AUTO_1531 - BLOCK
      ?AUTO_1532 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1530 ) ( not ( = ?AUTO_1529 ?AUTO_1530 ) ) ( ON ?AUTO_1529 ?AUTO_1531 ) ( not ( = ?AUTO_1529 ?AUTO_1531 ) ) ( not ( = ?AUTO_1530 ?AUTO_1531 ) ) ( not ( = ?AUTO_1529 ?AUTO_1532 ) ) ( not ( = ?AUTO_1530 ?AUTO_1532 ) ) ( not ( = ?AUTO_1531 ?AUTO_1532 ) ) ( ON ?AUTO_1532 ?AUTO_1529 ) ( CLEAR ?AUTO_1532 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1532 ?AUTO_1529 )
      ( MAKE-ON ?AUTO_1529 ?AUTO_1530 )
      ( MAKE-ON-VERIFY ?AUTO_1529 ?AUTO_1530 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1533 - BLOCK
      ?AUTO_1534 - BLOCK
    )
    :vars
    (
      ?AUTO_1535 - BLOCK
      ?AUTO_1536 - BLOCK
      ?AUTO_1537 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1534 ) ( not ( = ?AUTO_1533 ?AUTO_1534 ) ) ( ON ?AUTO_1533 ?AUTO_1535 ) ( not ( = ?AUTO_1533 ?AUTO_1535 ) ) ( not ( = ?AUTO_1534 ?AUTO_1535 ) ) ( not ( = ?AUTO_1533 ?AUTO_1536 ) ) ( not ( = ?AUTO_1534 ?AUTO_1536 ) ) ( not ( = ?AUTO_1535 ?AUTO_1536 ) ) ( ON ?AUTO_1536 ?AUTO_1533 ) ( CLEAR ?AUTO_1536 ) ( HOLDING ?AUTO_1537 ) ( not ( = ?AUTO_1533 ?AUTO_1537 ) ) ( not ( = ?AUTO_1534 ?AUTO_1537 ) ) ( not ( = ?AUTO_1535 ?AUTO_1537 ) ) ( not ( = ?AUTO_1536 ?AUTO_1537 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1537 )
      ( MAKE-ON ?AUTO_1533 ?AUTO_1534 )
      ( MAKE-ON-VERIFY ?AUTO_1533 ?AUTO_1534 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1538 - BLOCK
      ?AUTO_1539 - BLOCK
    )
    :vars
    (
      ?AUTO_1540 - BLOCK
      ?AUTO_1541 - BLOCK
      ?AUTO_1542 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1539 ) ( not ( = ?AUTO_1538 ?AUTO_1539 ) ) ( ON ?AUTO_1538 ?AUTO_1540 ) ( not ( = ?AUTO_1538 ?AUTO_1540 ) ) ( not ( = ?AUTO_1539 ?AUTO_1540 ) ) ( not ( = ?AUTO_1538 ?AUTO_1541 ) ) ( not ( = ?AUTO_1539 ?AUTO_1541 ) ) ( not ( = ?AUTO_1540 ?AUTO_1541 ) ) ( ON ?AUTO_1541 ?AUTO_1538 ) ( not ( = ?AUTO_1538 ?AUTO_1542 ) ) ( not ( = ?AUTO_1539 ?AUTO_1542 ) ) ( not ( = ?AUTO_1540 ?AUTO_1542 ) ) ( not ( = ?AUTO_1541 ?AUTO_1542 ) ) ( ON ?AUTO_1542 ?AUTO_1541 ) ( CLEAR ?AUTO_1542 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1542 ?AUTO_1541 )
      ( MAKE-ON ?AUTO_1538 ?AUTO_1539 )
      ( MAKE-ON-VERIFY ?AUTO_1538 ?AUTO_1539 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1544 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1544 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1544 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1544 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1545 - BLOCK
    )
    :vars
    (
      ?AUTO_1546 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1545 ?AUTO_1546 ) ( CLEAR ?AUTO_1545 ) ( HAND-EMPTY ) ( not ( = ?AUTO_1545 ?AUTO_1546 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1545 ?AUTO_1546 )
      ( MAKE-ON-TABLE ?AUTO_1545 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1545 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1547 - BLOCK
    )
    :vars
    (
      ?AUTO_1548 - BLOCK
      ?AUTO_1549 - BLOCK
      ?AUTO_1550 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1547 ?AUTO_1548 ) ( CLEAR ?AUTO_1547 ) ( not ( = ?AUTO_1547 ?AUTO_1548 ) ) ( HOLDING ?AUTO_1549 ) ( CLEAR ?AUTO_1550 ) ( not ( = ?AUTO_1547 ?AUTO_1549 ) ) ( not ( = ?AUTO_1547 ?AUTO_1550 ) ) ( not ( = ?AUTO_1548 ?AUTO_1549 ) ) ( not ( = ?AUTO_1548 ?AUTO_1550 ) ) ( not ( = ?AUTO_1549 ?AUTO_1550 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1549 ?AUTO_1550 )
      ( MAKE-ON-TABLE ?AUTO_1547 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1547 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1551 - BLOCK
    )
    :vars
    (
      ?AUTO_1552 - BLOCK
      ?AUTO_1554 - BLOCK
      ?AUTO_1553 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1551 ?AUTO_1552 ) ( not ( = ?AUTO_1551 ?AUTO_1552 ) ) ( CLEAR ?AUTO_1554 ) ( not ( = ?AUTO_1551 ?AUTO_1553 ) ) ( not ( = ?AUTO_1551 ?AUTO_1554 ) ) ( not ( = ?AUTO_1552 ?AUTO_1553 ) ) ( not ( = ?AUTO_1552 ?AUTO_1554 ) ) ( not ( = ?AUTO_1553 ?AUTO_1554 ) ) ( ON ?AUTO_1553 ?AUTO_1551 ) ( CLEAR ?AUTO_1553 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1553 ?AUTO_1551 )
      ( MAKE-ON-TABLE ?AUTO_1551 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1551 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1555 - BLOCK
    )
    :vars
    (
      ?AUTO_1556 - BLOCK
      ?AUTO_1558 - BLOCK
      ?AUTO_1557 - BLOCK
      ?AUTO_1559 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1555 ?AUTO_1556 ) ( not ( = ?AUTO_1555 ?AUTO_1556 ) ) ( CLEAR ?AUTO_1558 ) ( not ( = ?AUTO_1555 ?AUTO_1557 ) ) ( not ( = ?AUTO_1555 ?AUTO_1558 ) ) ( not ( = ?AUTO_1556 ?AUTO_1557 ) ) ( not ( = ?AUTO_1556 ?AUTO_1558 ) ) ( not ( = ?AUTO_1557 ?AUTO_1558 ) ) ( ON ?AUTO_1557 ?AUTO_1555 ) ( CLEAR ?AUTO_1557 ) ( HOLDING ?AUTO_1559 ) ( not ( = ?AUTO_1555 ?AUTO_1559 ) ) ( not ( = ?AUTO_1556 ?AUTO_1559 ) ) ( not ( = ?AUTO_1558 ?AUTO_1559 ) ) ( not ( = ?AUTO_1557 ?AUTO_1559 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1559 )
      ( MAKE-ON-TABLE ?AUTO_1555 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1555 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1560 - BLOCK
    )
    :vars
    (
      ?AUTO_1561 - BLOCK
      ?AUTO_1564 - BLOCK
      ?AUTO_1562 - BLOCK
      ?AUTO_1563 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1560 ?AUTO_1561 ) ( not ( = ?AUTO_1560 ?AUTO_1561 ) ) ( CLEAR ?AUTO_1564 ) ( not ( = ?AUTO_1560 ?AUTO_1562 ) ) ( not ( = ?AUTO_1560 ?AUTO_1564 ) ) ( not ( = ?AUTO_1561 ?AUTO_1562 ) ) ( not ( = ?AUTO_1561 ?AUTO_1564 ) ) ( not ( = ?AUTO_1562 ?AUTO_1564 ) ) ( ON ?AUTO_1562 ?AUTO_1560 ) ( not ( = ?AUTO_1560 ?AUTO_1563 ) ) ( not ( = ?AUTO_1561 ?AUTO_1563 ) ) ( not ( = ?AUTO_1564 ?AUTO_1563 ) ) ( not ( = ?AUTO_1562 ?AUTO_1563 ) ) ( ON ?AUTO_1563 ?AUTO_1562 ) ( CLEAR ?AUTO_1563 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1563 ?AUTO_1562 )
      ( MAKE-ON-TABLE ?AUTO_1560 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1560 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1565 - BLOCK
    )
    :vars
    (
      ?AUTO_1569 - BLOCK
      ?AUTO_1568 - BLOCK
      ?AUTO_1567 - BLOCK
      ?AUTO_1566 - BLOCK
      ?AUTO_1570 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1565 ?AUTO_1569 ) ( not ( = ?AUTO_1565 ?AUTO_1569 ) ) ( CLEAR ?AUTO_1568 ) ( not ( = ?AUTO_1565 ?AUTO_1567 ) ) ( not ( = ?AUTO_1565 ?AUTO_1568 ) ) ( not ( = ?AUTO_1569 ?AUTO_1567 ) ) ( not ( = ?AUTO_1569 ?AUTO_1568 ) ) ( not ( = ?AUTO_1567 ?AUTO_1568 ) ) ( ON ?AUTO_1567 ?AUTO_1565 ) ( not ( = ?AUTO_1565 ?AUTO_1566 ) ) ( not ( = ?AUTO_1569 ?AUTO_1566 ) ) ( not ( = ?AUTO_1568 ?AUTO_1566 ) ) ( not ( = ?AUTO_1567 ?AUTO_1566 ) ) ( ON ?AUTO_1566 ?AUTO_1567 ) ( CLEAR ?AUTO_1566 ) ( HOLDING ?AUTO_1570 ) ( not ( = ?AUTO_1565 ?AUTO_1570 ) ) ( not ( = ?AUTO_1569 ?AUTO_1570 ) ) ( not ( = ?AUTO_1568 ?AUTO_1570 ) ) ( not ( = ?AUTO_1567 ?AUTO_1570 ) ) ( not ( = ?AUTO_1566 ?AUTO_1570 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1570 )
      ( MAKE-ON-TABLE ?AUTO_1565 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1565 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1571 - BLOCK
    )
    :vars
    (
      ?AUTO_1574 - BLOCK
      ?AUTO_1576 - BLOCK
      ?AUTO_1572 - BLOCK
      ?AUTO_1573 - BLOCK
      ?AUTO_1575 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1571 ?AUTO_1574 ) ( not ( = ?AUTO_1571 ?AUTO_1574 ) ) ( CLEAR ?AUTO_1576 ) ( not ( = ?AUTO_1571 ?AUTO_1572 ) ) ( not ( = ?AUTO_1571 ?AUTO_1576 ) ) ( not ( = ?AUTO_1574 ?AUTO_1572 ) ) ( not ( = ?AUTO_1574 ?AUTO_1576 ) ) ( not ( = ?AUTO_1572 ?AUTO_1576 ) ) ( ON ?AUTO_1572 ?AUTO_1571 ) ( not ( = ?AUTO_1571 ?AUTO_1573 ) ) ( not ( = ?AUTO_1574 ?AUTO_1573 ) ) ( not ( = ?AUTO_1576 ?AUTO_1573 ) ) ( not ( = ?AUTO_1572 ?AUTO_1573 ) ) ( ON ?AUTO_1573 ?AUTO_1572 ) ( not ( = ?AUTO_1571 ?AUTO_1575 ) ) ( not ( = ?AUTO_1574 ?AUTO_1575 ) ) ( not ( = ?AUTO_1576 ?AUTO_1575 ) ) ( not ( = ?AUTO_1572 ?AUTO_1575 ) ) ( not ( = ?AUTO_1573 ?AUTO_1575 ) ) ( ON ?AUTO_1575 ?AUTO_1573 ) ( CLEAR ?AUTO_1575 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1575 ?AUTO_1573 )
      ( MAKE-ON-TABLE ?AUTO_1571 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1571 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1579 - BLOCK
      ?AUTO_1580 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1579 ) ( CLEAR ?AUTO_1580 ) ( not ( = ?AUTO_1579 ?AUTO_1580 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1579 ?AUTO_1580 )
      ( MAKE-ON-VERIFY ?AUTO_1579 ?AUTO_1580 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1581 - BLOCK
      ?AUTO_1582 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1582 ) ( not ( = ?AUTO_1581 ?AUTO_1582 ) ) ( ON-TABLE ?AUTO_1581 ) ( CLEAR ?AUTO_1581 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_1581 )
      ( MAKE-ON ?AUTO_1581 ?AUTO_1582 )
      ( MAKE-ON-VERIFY ?AUTO_1581 ?AUTO_1582 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1583 - BLOCK
      ?AUTO_1584 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1583 ?AUTO_1584 ) ) ( ON-TABLE ?AUTO_1583 ) ( CLEAR ?AUTO_1583 ) ( HOLDING ?AUTO_1584 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1584 )
      ( MAKE-ON ?AUTO_1583 ?AUTO_1584 )
      ( MAKE-ON-VERIFY ?AUTO_1583 ?AUTO_1584 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1587 - BLOCK
      ?AUTO_1588 - BLOCK
    )
    :vars
    (
      ?AUTO_1589 - BLOCK
      ?AUTO_1590 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1588 ) ( not ( = ?AUTO_1587 ?AUTO_1588 ) ) ( ON-TABLE ?AUTO_1587 ) ( CLEAR ?AUTO_1587 ) ( HOLDING ?AUTO_1589 ) ( CLEAR ?AUTO_1590 ) ( not ( = ?AUTO_1587 ?AUTO_1589 ) ) ( not ( = ?AUTO_1587 ?AUTO_1590 ) ) ( not ( = ?AUTO_1588 ?AUTO_1589 ) ) ( not ( = ?AUTO_1588 ?AUTO_1590 ) ) ( not ( = ?AUTO_1589 ?AUTO_1590 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1589 ?AUTO_1590 )
      ( MAKE-ON ?AUTO_1587 ?AUTO_1588 )
      ( MAKE-ON-VERIFY ?AUTO_1587 ?AUTO_1588 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1591 - BLOCK
      ?AUTO_1592 - BLOCK
    )
    :vars
    (
      ?AUTO_1593 - BLOCK
      ?AUTO_1594 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1591 ?AUTO_1592 ) ) ( ON-TABLE ?AUTO_1591 ) ( CLEAR ?AUTO_1591 ) ( CLEAR ?AUTO_1593 ) ( not ( = ?AUTO_1591 ?AUTO_1594 ) ) ( not ( = ?AUTO_1591 ?AUTO_1593 ) ) ( not ( = ?AUTO_1592 ?AUTO_1594 ) ) ( not ( = ?AUTO_1592 ?AUTO_1593 ) ) ( not ( = ?AUTO_1594 ?AUTO_1593 ) ) ( ON ?AUTO_1594 ?AUTO_1592 ) ( CLEAR ?AUTO_1594 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1594 ?AUTO_1592 )
      ( MAKE-ON ?AUTO_1591 ?AUTO_1592 )
      ( MAKE-ON-VERIFY ?AUTO_1591 ?AUTO_1592 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1595 - BLOCK
      ?AUTO_1596 - BLOCK
    )
    :vars
    (
      ?AUTO_1598 - BLOCK
      ?AUTO_1597 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1595 ?AUTO_1596 ) ) ( CLEAR ?AUTO_1598 ) ( not ( = ?AUTO_1595 ?AUTO_1597 ) ) ( not ( = ?AUTO_1595 ?AUTO_1598 ) ) ( not ( = ?AUTO_1596 ?AUTO_1597 ) ) ( not ( = ?AUTO_1596 ?AUTO_1598 ) ) ( not ( = ?AUTO_1597 ?AUTO_1598 ) ) ( ON ?AUTO_1597 ?AUTO_1596 ) ( CLEAR ?AUTO_1597 ) ( HOLDING ?AUTO_1595 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1595 )
      ( MAKE-ON ?AUTO_1595 ?AUTO_1596 )
      ( MAKE-ON-VERIFY ?AUTO_1595 ?AUTO_1596 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1599 - BLOCK
      ?AUTO_1600 - BLOCK
    )
    :vars
    (
      ?AUTO_1601 - BLOCK
      ?AUTO_1602 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1599 ?AUTO_1600 ) ) ( CLEAR ?AUTO_1601 ) ( not ( = ?AUTO_1599 ?AUTO_1602 ) ) ( not ( = ?AUTO_1599 ?AUTO_1601 ) ) ( not ( = ?AUTO_1600 ?AUTO_1602 ) ) ( not ( = ?AUTO_1600 ?AUTO_1601 ) ) ( not ( = ?AUTO_1602 ?AUTO_1601 ) ) ( ON ?AUTO_1602 ?AUTO_1600 ) ( ON ?AUTO_1599 ?AUTO_1602 ) ( CLEAR ?AUTO_1599 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1599 ?AUTO_1602 )
      ( MAKE-ON ?AUTO_1599 ?AUTO_1600 )
      ( MAKE-ON-VERIFY ?AUTO_1599 ?AUTO_1600 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1603 - BLOCK
      ?AUTO_1604 - BLOCK
    )
    :vars
    (
      ?AUTO_1605 - BLOCK
      ?AUTO_1606 - BLOCK
      ?AUTO_1607 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1603 ?AUTO_1604 ) ) ( CLEAR ?AUTO_1605 ) ( not ( = ?AUTO_1603 ?AUTO_1606 ) ) ( not ( = ?AUTO_1603 ?AUTO_1605 ) ) ( not ( = ?AUTO_1604 ?AUTO_1606 ) ) ( not ( = ?AUTO_1604 ?AUTO_1605 ) ) ( not ( = ?AUTO_1606 ?AUTO_1605 ) ) ( ON ?AUTO_1606 ?AUTO_1604 ) ( ON ?AUTO_1603 ?AUTO_1606 ) ( CLEAR ?AUTO_1603 ) ( HOLDING ?AUTO_1607 ) ( not ( = ?AUTO_1603 ?AUTO_1607 ) ) ( not ( = ?AUTO_1604 ?AUTO_1607 ) ) ( not ( = ?AUTO_1605 ?AUTO_1607 ) ) ( not ( = ?AUTO_1606 ?AUTO_1607 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1607 )
      ( MAKE-ON ?AUTO_1603 ?AUTO_1604 )
      ( MAKE-ON-VERIFY ?AUTO_1603 ?AUTO_1604 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1608 - BLOCK
      ?AUTO_1609 - BLOCK
    )
    :vars
    (
      ?AUTO_1610 - BLOCK
      ?AUTO_1611 - BLOCK
      ?AUTO_1612 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1608 ?AUTO_1609 ) ) ( CLEAR ?AUTO_1610 ) ( not ( = ?AUTO_1608 ?AUTO_1611 ) ) ( not ( = ?AUTO_1608 ?AUTO_1610 ) ) ( not ( = ?AUTO_1609 ?AUTO_1611 ) ) ( not ( = ?AUTO_1609 ?AUTO_1610 ) ) ( not ( = ?AUTO_1611 ?AUTO_1610 ) ) ( ON ?AUTO_1611 ?AUTO_1609 ) ( ON ?AUTO_1608 ?AUTO_1611 ) ( not ( = ?AUTO_1608 ?AUTO_1612 ) ) ( not ( = ?AUTO_1609 ?AUTO_1612 ) ) ( not ( = ?AUTO_1610 ?AUTO_1612 ) ) ( not ( = ?AUTO_1611 ?AUTO_1612 ) ) ( ON ?AUTO_1612 ?AUTO_1608 ) ( CLEAR ?AUTO_1612 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1612 ?AUTO_1608 )
      ( MAKE-ON ?AUTO_1608 ?AUTO_1609 )
      ( MAKE-ON-VERIFY ?AUTO_1608 ?AUTO_1609 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1615 - BLOCK
      ?AUTO_1616 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1615 ) ( CLEAR ?AUTO_1616 ) ( not ( = ?AUTO_1615 ?AUTO_1616 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1615 ?AUTO_1616 )
      ( MAKE-ON-VERIFY ?AUTO_1615 ?AUTO_1616 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1617 - BLOCK
      ?AUTO_1618 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1618 ) ( not ( = ?AUTO_1617 ?AUTO_1618 ) ) ( ON-TABLE ?AUTO_1617 ) ( CLEAR ?AUTO_1617 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_1617 )
      ( MAKE-ON ?AUTO_1617 ?AUTO_1618 )
      ( MAKE-ON-VERIFY ?AUTO_1617 ?AUTO_1618 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1619 - BLOCK
      ?AUTO_1620 - BLOCK
    )
    :vars
    (
      ?AUTO_1621 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1619 ?AUTO_1620 ) ) ( ON-TABLE ?AUTO_1619 ) ( CLEAR ?AUTO_1619 ) ( HOLDING ?AUTO_1620 ) ( CLEAR ?AUTO_1621 ) ( not ( = ?AUTO_1619 ?AUTO_1621 ) ) ( not ( = ?AUTO_1620 ?AUTO_1621 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1620 ?AUTO_1621 )
      ( MAKE-ON ?AUTO_1619 ?AUTO_1620 )
      ( MAKE-ON-VERIFY ?AUTO_1619 ?AUTO_1620 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1624 - BLOCK
      ?AUTO_1625 - BLOCK
    )
    :vars
    (
      ?AUTO_1626 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1625 ) ( not ( = ?AUTO_1624 ?AUTO_1625 ) ) ( ON-TABLE ?AUTO_1624 ) ( CLEAR ?AUTO_1624 ) ( HOLDING ?AUTO_1626 ) ( not ( = ?AUTO_1624 ?AUTO_1626 ) ) ( not ( = ?AUTO_1625 ?AUTO_1626 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1626 )
      ( MAKE-ON ?AUTO_1624 ?AUTO_1625 )
      ( MAKE-ON-VERIFY ?AUTO_1624 ?AUTO_1625 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1627 - BLOCK
      ?AUTO_1628 - BLOCK
    )
    :vars
    (
      ?AUTO_1629 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1628 ) ( not ( = ?AUTO_1627 ?AUTO_1628 ) ) ( ON-TABLE ?AUTO_1627 ) ( not ( = ?AUTO_1627 ?AUTO_1629 ) ) ( not ( = ?AUTO_1628 ?AUTO_1629 ) ) ( ON ?AUTO_1629 ?AUTO_1627 ) ( CLEAR ?AUTO_1629 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1629 ?AUTO_1627 )
      ( MAKE-ON ?AUTO_1627 ?AUTO_1628 )
      ( MAKE-ON-VERIFY ?AUTO_1627 ?AUTO_1628 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1630 - BLOCK
      ?AUTO_1631 - BLOCK
    )
    :vars
    (
      ?AUTO_1632 - BLOCK
      ?AUTO_1633 - BLOCK
      ?AUTO_1634 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1631 ) ( not ( = ?AUTO_1630 ?AUTO_1631 ) ) ( ON-TABLE ?AUTO_1630 ) ( not ( = ?AUTO_1630 ?AUTO_1632 ) ) ( not ( = ?AUTO_1631 ?AUTO_1632 ) ) ( ON ?AUTO_1632 ?AUTO_1630 ) ( CLEAR ?AUTO_1632 ) ( HOLDING ?AUTO_1633 ) ( CLEAR ?AUTO_1634 ) ( not ( = ?AUTO_1630 ?AUTO_1633 ) ) ( not ( = ?AUTO_1630 ?AUTO_1634 ) ) ( not ( = ?AUTO_1631 ?AUTO_1633 ) ) ( not ( = ?AUTO_1631 ?AUTO_1634 ) ) ( not ( = ?AUTO_1632 ?AUTO_1633 ) ) ( not ( = ?AUTO_1632 ?AUTO_1634 ) ) ( not ( = ?AUTO_1633 ?AUTO_1634 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1633 ?AUTO_1634 )
      ( MAKE-ON ?AUTO_1630 ?AUTO_1631 )
      ( MAKE-ON-VERIFY ?AUTO_1630 ?AUTO_1631 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1635 - BLOCK
      ?AUTO_1636 - BLOCK
    )
    :vars
    (
      ?AUTO_1637 - BLOCK
      ?AUTO_1639 - BLOCK
      ?AUTO_1638 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1636 ) ( not ( = ?AUTO_1635 ?AUTO_1636 ) ) ( ON-TABLE ?AUTO_1635 ) ( not ( = ?AUTO_1635 ?AUTO_1637 ) ) ( not ( = ?AUTO_1636 ?AUTO_1637 ) ) ( ON ?AUTO_1637 ?AUTO_1635 ) ( CLEAR ?AUTO_1639 ) ( not ( = ?AUTO_1635 ?AUTO_1638 ) ) ( not ( = ?AUTO_1635 ?AUTO_1639 ) ) ( not ( = ?AUTO_1636 ?AUTO_1638 ) ) ( not ( = ?AUTO_1636 ?AUTO_1639 ) ) ( not ( = ?AUTO_1637 ?AUTO_1638 ) ) ( not ( = ?AUTO_1637 ?AUTO_1639 ) ) ( not ( = ?AUTO_1638 ?AUTO_1639 ) ) ( ON ?AUTO_1638 ?AUTO_1637 ) ( CLEAR ?AUTO_1638 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1638 ?AUTO_1637 )
      ( MAKE-ON ?AUTO_1635 ?AUTO_1636 )
      ( MAKE-ON-VERIFY ?AUTO_1635 ?AUTO_1636 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1640 - BLOCK
      ?AUTO_1641 - BLOCK
    )
    :vars
    (
      ?AUTO_1643 - BLOCK
      ?AUTO_1642 - BLOCK
      ?AUTO_1644 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1640 ?AUTO_1641 ) ) ( ON-TABLE ?AUTO_1640 ) ( not ( = ?AUTO_1640 ?AUTO_1643 ) ) ( not ( = ?AUTO_1641 ?AUTO_1643 ) ) ( ON ?AUTO_1643 ?AUTO_1640 ) ( CLEAR ?AUTO_1642 ) ( not ( = ?AUTO_1640 ?AUTO_1644 ) ) ( not ( = ?AUTO_1640 ?AUTO_1642 ) ) ( not ( = ?AUTO_1641 ?AUTO_1644 ) ) ( not ( = ?AUTO_1641 ?AUTO_1642 ) ) ( not ( = ?AUTO_1643 ?AUTO_1644 ) ) ( not ( = ?AUTO_1643 ?AUTO_1642 ) ) ( not ( = ?AUTO_1644 ?AUTO_1642 ) ) ( ON ?AUTO_1644 ?AUTO_1643 ) ( CLEAR ?AUTO_1644 ) ( HOLDING ?AUTO_1641 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1641 )
      ( MAKE-ON ?AUTO_1640 ?AUTO_1641 )
      ( MAKE-ON-VERIFY ?AUTO_1640 ?AUTO_1641 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1645 - BLOCK
      ?AUTO_1646 - BLOCK
    )
    :vars
    (
      ?AUTO_1647 - BLOCK
      ?AUTO_1648 - BLOCK
      ?AUTO_1649 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1645 ?AUTO_1646 ) ) ( ON-TABLE ?AUTO_1645 ) ( not ( = ?AUTO_1645 ?AUTO_1647 ) ) ( not ( = ?AUTO_1646 ?AUTO_1647 ) ) ( ON ?AUTO_1647 ?AUTO_1645 ) ( CLEAR ?AUTO_1648 ) ( not ( = ?AUTO_1645 ?AUTO_1649 ) ) ( not ( = ?AUTO_1645 ?AUTO_1648 ) ) ( not ( = ?AUTO_1646 ?AUTO_1649 ) ) ( not ( = ?AUTO_1646 ?AUTO_1648 ) ) ( not ( = ?AUTO_1647 ?AUTO_1649 ) ) ( not ( = ?AUTO_1647 ?AUTO_1648 ) ) ( not ( = ?AUTO_1649 ?AUTO_1648 ) ) ( ON ?AUTO_1649 ?AUTO_1647 ) ( ON ?AUTO_1646 ?AUTO_1649 ) ( CLEAR ?AUTO_1646 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1646 ?AUTO_1649 )
      ( MAKE-ON ?AUTO_1645 ?AUTO_1646 )
      ( MAKE-ON-VERIFY ?AUTO_1645 ?AUTO_1646 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1650 - BLOCK
      ?AUTO_1651 - BLOCK
    )
    :vars
    (
      ?AUTO_1652 - BLOCK
      ?AUTO_1653 - BLOCK
      ?AUTO_1654 - BLOCK
      ?AUTO_1655 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1650 ?AUTO_1651 ) ) ( ON-TABLE ?AUTO_1650 ) ( not ( = ?AUTO_1650 ?AUTO_1652 ) ) ( not ( = ?AUTO_1651 ?AUTO_1652 ) ) ( ON ?AUTO_1652 ?AUTO_1650 ) ( CLEAR ?AUTO_1653 ) ( not ( = ?AUTO_1650 ?AUTO_1654 ) ) ( not ( = ?AUTO_1650 ?AUTO_1653 ) ) ( not ( = ?AUTO_1651 ?AUTO_1654 ) ) ( not ( = ?AUTO_1651 ?AUTO_1653 ) ) ( not ( = ?AUTO_1652 ?AUTO_1654 ) ) ( not ( = ?AUTO_1652 ?AUTO_1653 ) ) ( not ( = ?AUTO_1654 ?AUTO_1653 ) ) ( ON ?AUTO_1654 ?AUTO_1652 ) ( ON ?AUTO_1651 ?AUTO_1654 ) ( CLEAR ?AUTO_1651 ) ( HOLDING ?AUTO_1655 ) ( not ( = ?AUTO_1650 ?AUTO_1655 ) ) ( not ( = ?AUTO_1651 ?AUTO_1655 ) ) ( not ( = ?AUTO_1652 ?AUTO_1655 ) ) ( not ( = ?AUTO_1653 ?AUTO_1655 ) ) ( not ( = ?AUTO_1654 ?AUTO_1655 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1655 )
      ( MAKE-ON ?AUTO_1650 ?AUTO_1651 )
      ( MAKE-ON-VERIFY ?AUTO_1650 ?AUTO_1651 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1656 - BLOCK
      ?AUTO_1657 - BLOCK
    )
    :vars
    (
      ?AUTO_1658 - BLOCK
      ?AUTO_1659 - BLOCK
      ?AUTO_1660 - BLOCK
      ?AUTO_1661 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1656 ?AUTO_1657 ) ) ( ON-TABLE ?AUTO_1656 ) ( not ( = ?AUTO_1656 ?AUTO_1658 ) ) ( not ( = ?AUTO_1657 ?AUTO_1658 ) ) ( ON ?AUTO_1658 ?AUTO_1656 ) ( CLEAR ?AUTO_1659 ) ( not ( = ?AUTO_1656 ?AUTO_1660 ) ) ( not ( = ?AUTO_1656 ?AUTO_1659 ) ) ( not ( = ?AUTO_1657 ?AUTO_1660 ) ) ( not ( = ?AUTO_1657 ?AUTO_1659 ) ) ( not ( = ?AUTO_1658 ?AUTO_1660 ) ) ( not ( = ?AUTO_1658 ?AUTO_1659 ) ) ( not ( = ?AUTO_1660 ?AUTO_1659 ) ) ( ON ?AUTO_1660 ?AUTO_1658 ) ( ON ?AUTO_1657 ?AUTO_1660 ) ( not ( = ?AUTO_1656 ?AUTO_1661 ) ) ( not ( = ?AUTO_1657 ?AUTO_1661 ) ) ( not ( = ?AUTO_1658 ?AUTO_1661 ) ) ( not ( = ?AUTO_1659 ?AUTO_1661 ) ) ( not ( = ?AUTO_1660 ?AUTO_1661 ) ) ( ON ?AUTO_1661 ?AUTO_1657 ) ( CLEAR ?AUTO_1661 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1661 ?AUTO_1657 )
      ( MAKE-ON ?AUTO_1656 ?AUTO_1657 )
      ( MAKE-ON-VERIFY ?AUTO_1656 ?AUTO_1657 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1664 - BLOCK
      ?AUTO_1665 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1664 ) ( CLEAR ?AUTO_1665 ) ( not ( = ?AUTO_1664 ?AUTO_1665 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1664 ?AUTO_1665 )
      ( MAKE-ON-VERIFY ?AUTO_1664 ?AUTO_1665 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1666 - BLOCK
      ?AUTO_1667 - BLOCK
    )
    :vars
    (
      ?AUTO_1668 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1667 ) ( not ( = ?AUTO_1666 ?AUTO_1667 ) ) ( ON ?AUTO_1666 ?AUTO_1668 ) ( CLEAR ?AUTO_1666 ) ( HAND-EMPTY ) ( not ( = ?AUTO_1666 ?AUTO_1668 ) ) ( not ( = ?AUTO_1667 ?AUTO_1668 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1666 ?AUTO_1668 )
      ( MAKE-ON ?AUTO_1666 ?AUTO_1667 )
      ( MAKE-ON-VERIFY ?AUTO_1666 ?AUTO_1667 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1670 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1670 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1670 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1670 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1671 - BLOCK
    )
    :vars
    (
      ?AUTO_1672 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1671 ?AUTO_1672 ) ( CLEAR ?AUTO_1671 ) ( HAND-EMPTY ) ( not ( = ?AUTO_1671 ?AUTO_1672 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1671 ?AUTO_1672 )
      ( MAKE-ON-TABLE ?AUTO_1671 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1671 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1673 - BLOCK
    )
    :vars
    (
      ?AUTO_1674 - BLOCK
      ?AUTO_1675 - BLOCK
      ?AUTO_1676 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1673 ?AUTO_1674 ) ( CLEAR ?AUTO_1673 ) ( not ( = ?AUTO_1673 ?AUTO_1674 ) ) ( HOLDING ?AUTO_1675 ) ( CLEAR ?AUTO_1676 ) ( not ( = ?AUTO_1673 ?AUTO_1675 ) ) ( not ( = ?AUTO_1673 ?AUTO_1676 ) ) ( not ( = ?AUTO_1674 ?AUTO_1675 ) ) ( not ( = ?AUTO_1674 ?AUTO_1676 ) ) ( not ( = ?AUTO_1675 ?AUTO_1676 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1675 ?AUTO_1676 )
      ( MAKE-ON-TABLE ?AUTO_1673 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1673 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1677 - BLOCK
    )
    :vars
    (
      ?AUTO_1678 - BLOCK
      ?AUTO_1680 - BLOCK
      ?AUTO_1679 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1677 ?AUTO_1678 ) ( not ( = ?AUTO_1677 ?AUTO_1678 ) ) ( CLEAR ?AUTO_1680 ) ( not ( = ?AUTO_1677 ?AUTO_1679 ) ) ( not ( = ?AUTO_1677 ?AUTO_1680 ) ) ( not ( = ?AUTO_1678 ?AUTO_1679 ) ) ( not ( = ?AUTO_1678 ?AUTO_1680 ) ) ( not ( = ?AUTO_1679 ?AUTO_1680 ) ) ( ON ?AUTO_1679 ?AUTO_1677 ) ( CLEAR ?AUTO_1679 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1679 ?AUTO_1677 )
      ( MAKE-ON-TABLE ?AUTO_1677 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1677 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1683 - BLOCK
      ?AUTO_1684 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1683 ) ( CLEAR ?AUTO_1684 ) ( not ( = ?AUTO_1683 ?AUTO_1684 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1683 ?AUTO_1684 )
      ( MAKE-ON-VERIFY ?AUTO_1683 ?AUTO_1684 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1685 - BLOCK
      ?AUTO_1686 - BLOCK
    )
    :vars
    (
      ?AUTO_1687 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1686 ) ( not ( = ?AUTO_1685 ?AUTO_1686 ) ) ( ON ?AUTO_1685 ?AUTO_1687 ) ( CLEAR ?AUTO_1685 ) ( HAND-EMPTY ) ( not ( = ?AUTO_1685 ?AUTO_1687 ) ) ( not ( = ?AUTO_1686 ?AUTO_1687 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1685 ?AUTO_1687 )
      ( MAKE-ON ?AUTO_1685 ?AUTO_1686 )
      ( MAKE-ON-VERIFY ?AUTO_1685 ?AUTO_1686 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1688 - BLOCK
      ?AUTO_1689 - BLOCK
    )
    :vars
    (
      ?AUTO_1690 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1688 ?AUTO_1689 ) ) ( ON ?AUTO_1688 ?AUTO_1690 ) ( CLEAR ?AUTO_1688 ) ( not ( = ?AUTO_1688 ?AUTO_1690 ) ) ( not ( = ?AUTO_1689 ?AUTO_1690 ) ) ( HOLDING ?AUTO_1689 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1689 )
      ( MAKE-ON ?AUTO_1688 ?AUTO_1689 )
      ( MAKE-ON-VERIFY ?AUTO_1688 ?AUTO_1689 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1698 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1698 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1698 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1698 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1699 - BLOCK
    )
    :vars
    (
      ?AUTO_1700 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1699 ?AUTO_1700 ) ( CLEAR ?AUTO_1699 ) ( HAND-EMPTY ) ( not ( = ?AUTO_1699 ?AUTO_1700 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1699 ?AUTO_1700 )
      ( MAKE-ON-TABLE ?AUTO_1699 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1699 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1701 - BLOCK
    )
    :vars
    (
      ?AUTO_1702 - BLOCK
      ?AUTO_1703 - BLOCK
      ?AUTO_1704 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1701 ?AUTO_1702 ) ( CLEAR ?AUTO_1701 ) ( not ( = ?AUTO_1701 ?AUTO_1702 ) ) ( HOLDING ?AUTO_1703 ) ( CLEAR ?AUTO_1704 ) ( not ( = ?AUTO_1701 ?AUTO_1703 ) ) ( not ( = ?AUTO_1701 ?AUTO_1704 ) ) ( not ( = ?AUTO_1702 ?AUTO_1703 ) ) ( not ( = ?AUTO_1702 ?AUTO_1704 ) ) ( not ( = ?AUTO_1703 ?AUTO_1704 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1703 ?AUTO_1704 )
      ( MAKE-ON-TABLE ?AUTO_1701 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1701 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1707 - BLOCK
    )
    :vars
    (
      ?AUTO_1710 - BLOCK
      ?AUTO_1708 - BLOCK
      ?AUTO_1709 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1707 ?AUTO_1710 ) ( not ( = ?AUTO_1707 ?AUTO_1710 ) ) ( CLEAR ?AUTO_1708 ) ( not ( = ?AUTO_1707 ?AUTO_1709 ) ) ( not ( = ?AUTO_1707 ?AUTO_1708 ) ) ( not ( = ?AUTO_1710 ?AUTO_1709 ) ) ( not ( = ?AUTO_1710 ?AUTO_1708 ) ) ( not ( = ?AUTO_1709 ?AUTO_1708 ) ) ( ON ?AUTO_1709 ?AUTO_1707 ) ( CLEAR ?AUTO_1709 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1709 ?AUTO_1707 )
      ( MAKE-ON-TABLE ?AUTO_1707 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1707 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1711 - BLOCK
    )
    :vars
    (
      ?AUTO_1714 - BLOCK
      ?AUTO_1712 - BLOCK
      ?AUTO_1713 - BLOCK
      ?AUTO_1715 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1711 ?AUTO_1714 ) ( not ( = ?AUTO_1711 ?AUTO_1714 ) ) ( not ( = ?AUTO_1711 ?AUTO_1712 ) ) ( not ( = ?AUTO_1711 ?AUTO_1713 ) ) ( not ( = ?AUTO_1714 ?AUTO_1712 ) ) ( not ( = ?AUTO_1714 ?AUTO_1713 ) ) ( not ( = ?AUTO_1712 ?AUTO_1713 ) ) ( ON ?AUTO_1712 ?AUTO_1711 ) ( CLEAR ?AUTO_1712 ) ( HOLDING ?AUTO_1713 ) ( CLEAR ?AUTO_1715 ) ( not ( = ?AUTO_1711 ?AUTO_1715 ) ) ( not ( = ?AUTO_1714 ?AUTO_1715 ) ) ( not ( = ?AUTO_1712 ?AUTO_1715 ) ) ( not ( = ?AUTO_1713 ?AUTO_1715 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1713 ?AUTO_1715 )
      ( MAKE-ON-TABLE ?AUTO_1711 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1711 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1716 - BLOCK
    )
    :vars
    (
      ?AUTO_1720 - BLOCK
      ?AUTO_1719 - BLOCK
      ?AUTO_1718 - BLOCK
      ?AUTO_1717 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1716 ?AUTO_1720 ) ( not ( = ?AUTO_1716 ?AUTO_1720 ) ) ( not ( = ?AUTO_1716 ?AUTO_1719 ) ) ( not ( = ?AUTO_1716 ?AUTO_1718 ) ) ( not ( = ?AUTO_1720 ?AUTO_1719 ) ) ( not ( = ?AUTO_1720 ?AUTO_1718 ) ) ( not ( = ?AUTO_1719 ?AUTO_1718 ) ) ( ON ?AUTO_1719 ?AUTO_1716 ) ( CLEAR ?AUTO_1717 ) ( not ( = ?AUTO_1716 ?AUTO_1717 ) ) ( not ( = ?AUTO_1720 ?AUTO_1717 ) ) ( not ( = ?AUTO_1719 ?AUTO_1717 ) ) ( not ( = ?AUTO_1718 ?AUTO_1717 ) ) ( ON ?AUTO_1718 ?AUTO_1719 ) ( CLEAR ?AUTO_1718 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1718 ?AUTO_1719 )
      ( MAKE-ON-TABLE ?AUTO_1716 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1716 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1723 - BLOCK
      ?AUTO_1724 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1723 ) ( CLEAR ?AUTO_1724 ) ( not ( = ?AUTO_1723 ?AUTO_1724 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1723 ?AUTO_1724 )
      ( MAKE-ON-VERIFY ?AUTO_1723 ?AUTO_1724 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1725 - BLOCK
      ?AUTO_1726 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1726 ) ( not ( = ?AUTO_1725 ?AUTO_1726 ) ) ( ON-TABLE ?AUTO_1725 ) ( CLEAR ?AUTO_1725 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_1725 )
      ( MAKE-ON ?AUTO_1725 ?AUTO_1726 )
      ( MAKE-ON-VERIFY ?AUTO_1725 ?AUTO_1726 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1727 - BLOCK
      ?AUTO_1728 - BLOCK
    )
    :vars
    (
      ?AUTO_1729 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1728 ) ( not ( = ?AUTO_1727 ?AUTO_1728 ) ) ( ON-TABLE ?AUTO_1727 ) ( CLEAR ?AUTO_1727 ) ( HOLDING ?AUTO_1729 ) ( not ( = ?AUTO_1727 ?AUTO_1729 ) ) ( not ( = ?AUTO_1728 ?AUTO_1729 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1729 )
      ( MAKE-ON ?AUTO_1727 ?AUTO_1728 )
      ( MAKE-ON-VERIFY ?AUTO_1727 ?AUTO_1728 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1732 - BLOCK
      ?AUTO_1733 - BLOCK
    )
    :vars
    (
      ?AUTO_1734 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1732 ?AUTO_1733 ) ) ( ON-TABLE ?AUTO_1732 ) ( CLEAR ?AUTO_1732 ) ( HOLDING ?AUTO_1733 ) ( CLEAR ?AUTO_1734 ) ( not ( = ?AUTO_1732 ?AUTO_1734 ) ) ( not ( = ?AUTO_1733 ?AUTO_1734 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1733 ?AUTO_1734 )
      ( MAKE-ON ?AUTO_1732 ?AUTO_1733 )
      ( MAKE-ON-VERIFY ?AUTO_1732 ?AUTO_1733 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1735 - BLOCK
      ?AUTO_1736 - BLOCK
    )
    :vars
    (
      ?AUTO_1737 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1735 ?AUTO_1736 ) ) ( ON-TABLE ?AUTO_1735 ) ( CLEAR ?AUTO_1737 ) ( not ( = ?AUTO_1735 ?AUTO_1737 ) ) ( not ( = ?AUTO_1736 ?AUTO_1737 ) ) ( ON ?AUTO_1736 ?AUTO_1735 ) ( CLEAR ?AUTO_1736 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1736 ?AUTO_1735 )
      ( MAKE-ON ?AUTO_1735 ?AUTO_1736 )
      ( MAKE-ON-VERIFY ?AUTO_1735 ?AUTO_1736 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1738 - BLOCK
      ?AUTO_1739 - BLOCK
    )
    :vars
    (
      ?AUTO_1740 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1738 ?AUTO_1739 ) ) ( ON-TABLE ?AUTO_1738 ) ( not ( = ?AUTO_1738 ?AUTO_1740 ) ) ( not ( = ?AUTO_1739 ?AUTO_1740 ) ) ( ON ?AUTO_1739 ?AUTO_1738 ) ( CLEAR ?AUTO_1739 ) ( HOLDING ?AUTO_1740 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1740 )
      ( MAKE-ON ?AUTO_1738 ?AUTO_1739 )
      ( MAKE-ON-VERIFY ?AUTO_1738 ?AUTO_1739 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1749 - BLOCK
      ?AUTO_1750 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1749 ) ( CLEAR ?AUTO_1750 ) ( not ( = ?AUTO_1749 ?AUTO_1750 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1749 ?AUTO_1750 )
      ( MAKE-ON-VERIFY ?AUTO_1749 ?AUTO_1750 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1751 - BLOCK
      ?AUTO_1752 - BLOCK
    )
    :vars
    (
      ?AUTO_1753 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1752 ) ( not ( = ?AUTO_1751 ?AUTO_1752 ) ) ( ON ?AUTO_1751 ?AUTO_1753 ) ( CLEAR ?AUTO_1751 ) ( HAND-EMPTY ) ( not ( = ?AUTO_1751 ?AUTO_1753 ) ) ( not ( = ?AUTO_1752 ?AUTO_1753 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1751 ?AUTO_1753 )
      ( MAKE-ON ?AUTO_1751 ?AUTO_1752 )
      ( MAKE-ON-VERIFY ?AUTO_1751 ?AUTO_1752 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1754 - BLOCK
      ?AUTO_1755 - BLOCK
    )
    :vars
    (
      ?AUTO_1756 - BLOCK
      ?AUTO_1757 - BLOCK
      ?AUTO_1758 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1755 ) ( not ( = ?AUTO_1754 ?AUTO_1755 ) ) ( ON ?AUTO_1754 ?AUTO_1756 ) ( CLEAR ?AUTO_1754 ) ( not ( = ?AUTO_1754 ?AUTO_1756 ) ) ( not ( = ?AUTO_1755 ?AUTO_1756 ) ) ( HOLDING ?AUTO_1757 ) ( CLEAR ?AUTO_1758 ) ( not ( = ?AUTO_1754 ?AUTO_1757 ) ) ( not ( = ?AUTO_1754 ?AUTO_1758 ) ) ( not ( = ?AUTO_1755 ?AUTO_1757 ) ) ( not ( = ?AUTO_1755 ?AUTO_1758 ) ) ( not ( = ?AUTO_1756 ?AUTO_1757 ) ) ( not ( = ?AUTO_1756 ?AUTO_1758 ) ) ( not ( = ?AUTO_1757 ?AUTO_1758 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1757 ?AUTO_1758 )
      ( MAKE-ON ?AUTO_1754 ?AUTO_1755 )
      ( MAKE-ON-VERIFY ?AUTO_1754 ?AUTO_1755 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1761 - BLOCK
      ?AUTO_1762 - BLOCK
    )
    :vars
    (
      ?AUTO_1763 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1761 ?AUTO_1762 ) ) ( ON ?AUTO_1761 ?AUTO_1763 ) ( CLEAR ?AUTO_1761 ) ( not ( = ?AUTO_1761 ?AUTO_1763 ) ) ( not ( = ?AUTO_1762 ?AUTO_1763 ) ) ( HOLDING ?AUTO_1762 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1762 )
      ( MAKE-ON ?AUTO_1761 ?AUTO_1762 )
      ( MAKE-ON-VERIFY ?AUTO_1761 ?AUTO_1762 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1764 - BLOCK
      ?AUTO_1765 - BLOCK
    )
    :vars
    (
      ?AUTO_1766 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1764 ?AUTO_1765 ) ) ( ON ?AUTO_1764 ?AUTO_1766 ) ( not ( = ?AUTO_1764 ?AUTO_1766 ) ) ( not ( = ?AUTO_1765 ?AUTO_1766 ) ) ( ON ?AUTO_1765 ?AUTO_1764 ) ( CLEAR ?AUTO_1765 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1765 ?AUTO_1764 )
      ( MAKE-ON ?AUTO_1764 ?AUTO_1765 )
      ( MAKE-ON-VERIFY ?AUTO_1764 ?AUTO_1765 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1767 - BLOCK
      ?AUTO_1768 - BLOCK
    )
    :vars
    (
      ?AUTO_1769 - BLOCK
      ?AUTO_1770 - BLOCK
      ?AUTO_1771 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1767 ?AUTO_1768 ) ) ( ON ?AUTO_1767 ?AUTO_1769 ) ( not ( = ?AUTO_1767 ?AUTO_1769 ) ) ( not ( = ?AUTO_1768 ?AUTO_1769 ) ) ( ON ?AUTO_1768 ?AUTO_1767 ) ( CLEAR ?AUTO_1768 ) ( HOLDING ?AUTO_1770 ) ( CLEAR ?AUTO_1771 ) ( not ( = ?AUTO_1767 ?AUTO_1770 ) ) ( not ( = ?AUTO_1767 ?AUTO_1771 ) ) ( not ( = ?AUTO_1768 ?AUTO_1770 ) ) ( not ( = ?AUTO_1768 ?AUTO_1771 ) ) ( not ( = ?AUTO_1769 ?AUTO_1770 ) ) ( not ( = ?AUTO_1769 ?AUTO_1771 ) ) ( not ( = ?AUTO_1770 ?AUTO_1771 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1770 ?AUTO_1771 )
      ( MAKE-ON ?AUTO_1767 ?AUTO_1768 )
      ( MAKE-ON-VERIFY ?AUTO_1767 ?AUTO_1768 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1776 - BLOCK
      ?AUTO_1777 - BLOCK
    )
    :vars
    (
      ?AUTO_1780 - BLOCK
      ?AUTO_1778 - BLOCK
      ?AUTO_1779 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1776 ?AUTO_1777 ) ) ( ON ?AUTO_1776 ?AUTO_1780 ) ( not ( = ?AUTO_1776 ?AUTO_1780 ) ) ( not ( = ?AUTO_1777 ?AUTO_1780 ) ) ( ON ?AUTO_1777 ?AUTO_1776 ) ( CLEAR ?AUTO_1778 ) ( not ( = ?AUTO_1776 ?AUTO_1779 ) ) ( not ( = ?AUTO_1776 ?AUTO_1778 ) ) ( not ( = ?AUTO_1777 ?AUTO_1779 ) ) ( not ( = ?AUTO_1777 ?AUTO_1778 ) ) ( not ( = ?AUTO_1780 ?AUTO_1779 ) ) ( not ( = ?AUTO_1780 ?AUTO_1778 ) ) ( not ( = ?AUTO_1779 ?AUTO_1778 ) ) ( ON ?AUTO_1779 ?AUTO_1777 ) ( CLEAR ?AUTO_1779 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1779 ?AUTO_1777 )
      ( MAKE-ON ?AUTO_1776 ?AUTO_1777 )
      ( MAKE-ON-VERIFY ?AUTO_1776 ?AUTO_1777 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1781 - BLOCK
      ?AUTO_1782 - BLOCK
    )
    :vars
    (
      ?AUTO_1785 - BLOCK
      ?AUTO_1783 - BLOCK
      ?AUTO_1784 - BLOCK
      ?AUTO_1786 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1781 ?AUTO_1782 ) ) ( ON ?AUTO_1781 ?AUTO_1785 ) ( not ( = ?AUTO_1781 ?AUTO_1785 ) ) ( not ( = ?AUTO_1782 ?AUTO_1785 ) ) ( ON ?AUTO_1782 ?AUTO_1781 ) ( not ( = ?AUTO_1781 ?AUTO_1783 ) ) ( not ( = ?AUTO_1781 ?AUTO_1784 ) ) ( not ( = ?AUTO_1782 ?AUTO_1783 ) ) ( not ( = ?AUTO_1782 ?AUTO_1784 ) ) ( not ( = ?AUTO_1785 ?AUTO_1783 ) ) ( not ( = ?AUTO_1785 ?AUTO_1784 ) ) ( not ( = ?AUTO_1783 ?AUTO_1784 ) ) ( ON ?AUTO_1783 ?AUTO_1782 ) ( CLEAR ?AUTO_1783 ) ( HOLDING ?AUTO_1784 ) ( CLEAR ?AUTO_1786 ) ( not ( = ?AUTO_1781 ?AUTO_1786 ) ) ( not ( = ?AUTO_1782 ?AUTO_1786 ) ) ( not ( = ?AUTO_1785 ?AUTO_1786 ) ) ( not ( = ?AUTO_1783 ?AUTO_1786 ) ) ( not ( = ?AUTO_1784 ?AUTO_1786 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1784 ?AUTO_1786 )
      ( MAKE-ON ?AUTO_1781 ?AUTO_1782 )
      ( MAKE-ON-VERIFY ?AUTO_1781 ?AUTO_1782 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1787 - BLOCK
      ?AUTO_1788 - BLOCK
    )
    :vars
    (
      ?AUTO_1792 - BLOCK
      ?AUTO_1790 - BLOCK
      ?AUTO_1789 - BLOCK
      ?AUTO_1791 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1787 ?AUTO_1788 ) ) ( ON ?AUTO_1787 ?AUTO_1792 ) ( not ( = ?AUTO_1787 ?AUTO_1792 ) ) ( not ( = ?AUTO_1788 ?AUTO_1792 ) ) ( ON ?AUTO_1788 ?AUTO_1787 ) ( not ( = ?AUTO_1787 ?AUTO_1790 ) ) ( not ( = ?AUTO_1787 ?AUTO_1789 ) ) ( not ( = ?AUTO_1788 ?AUTO_1790 ) ) ( not ( = ?AUTO_1788 ?AUTO_1789 ) ) ( not ( = ?AUTO_1792 ?AUTO_1790 ) ) ( not ( = ?AUTO_1792 ?AUTO_1789 ) ) ( not ( = ?AUTO_1790 ?AUTO_1789 ) ) ( ON ?AUTO_1790 ?AUTO_1788 ) ( CLEAR ?AUTO_1791 ) ( not ( = ?AUTO_1787 ?AUTO_1791 ) ) ( not ( = ?AUTO_1788 ?AUTO_1791 ) ) ( not ( = ?AUTO_1792 ?AUTO_1791 ) ) ( not ( = ?AUTO_1790 ?AUTO_1791 ) ) ( not ( = ?AUTO_1789 ?AUTO_1791 ) ) ( ON ?AUTO_1789 ?AUTO_1790 ) ( CLEAR ?AUTO_1789 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1789 ?AUTO_1790 )
      ( MAKE-ON ?AUTO_1787 ?AUTO_1788 )
      ( MAKE-ON-VERIFY ?AUTO_1787 ?AUTO_1788 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1795 - BLOCK
      ?AUTO_1796 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1795 ) ( CLEAR ?AUTO_1796 ) ( not ( = ?AUTO_1795 ?AUTO_1796 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1795 ?AUTO_1796 )
      ( MAKE-ON-VERIFY ?AUTO_1795 ?AUTO_1796 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1797 - BLOCK
      ?AUTO_1798 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1798 ) ( not ( = ?AUTO_1797 ?AUTO_1798 ) ) ( ON-TABLE ?AUTO_1797 ) ( CLEAR ?AUTO_1797 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_1797 )
      ( MAKE-ON ?AUTO_1797 ?AUTO_1798 )
      ( MAKE-ON-VERIFY ?AUTO_1797 ?AUTO_1798 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1799 - BLOCK
      ?AUTO_1800 - BLOCK
    )
    :vars
    (
      ?AUTO_1801 - BLOCK
      ?AUTO_1802 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1800 ) ( not ( = ?AUTO_1799 ?AUTO_1800 ) ) ( ON-TABLE ?AUTO_1799 ) ( CLEAR ?AUTO_1799 ) ( HOLDING ?AUTO_1801 ) ( CLEAR ?AUTO_1802 ) ( not ( = ?AUTO_1799 ?AUTO_1801 ) ) ( not ( = ?AUTO_1799 ?AUTO_1802 ) ) ( not ( = ?AUTO_1800 ?AUTO_1801 ) ) ( not ( = ?AUTO_1800 ?AUTO_1802 ) ) ( not ( = ?AUTO_1801 ?AUTO_1802 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1801 ?AUTO_1802 )
      ( MAKE-ON ?AUTO_1799 ?AUTO_1800 )
      ( MAKE-ON-VERIFY ?AUTO_1799 ?AUTO_1800 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1803 - BLOCK
      ?AUTO_1804 - BLOCK
    )
    :vars
    (
      ?AUTO_1805 - BLOCK
      ?AUTO_1806 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1804 ) ( not ( = ?AUTO_1803 ?AUTO_1804 ) ) ( ON-TABLE ?AUTO_1803 ) ( CLEAR ?AUTO_1805 ) ( not ( = ?AUTO_1803 ?AUTO_1806 ) ) ( not ( = ?AUTO_1803 ?AUTO_1805 ) ) ( not ( = ?AUTO_1804 ?AUTO_1806 ) ) ( not ( = ?AUTO_1804 ?AUTO_1805 ) ) ( not ( = ?AUTO_1806 ?AUTO_1805 ) ) ( ON ?AUTO_1806 ?AUTO_1803 ) ( CLEAR ?AUTO_1806 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1806 ?AUTO_1803 )
      ( MAKE-ON ?AUTO_1803 ?AUTO_1804 )
      ( MAKE-ON-VERIFY ?AUTO_1803 ?AUTO_1804 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1807 - BLOCK
      ?AUTO_1808 - BLOCK
    )
    :vars
    (
      ?AUTO_1810 - BLOCK
      ?AUTO_1809 - BLOCK
      ?AUTO_1811 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1807 ?AUTO_1808 ) ) ( ON-TABLE ?AUTO_1807 ) ( CLEAR ?AUTO_1810 ) ( not ( = ?AUTO_1807 ?AUTO_1809 ) ) ( not ( = ?AUTO_1807 ?AUTO_1810 ) ) ( not ( = ?AUTO_1808 ?AUTO_1809 ) ) ( not ( = ?AUTO_1808 ?AUTO_1810 ) ) ( not ( = ?AUTO_1809 ?AUTO_1810 ) ) ( ON ?AUTO_1809 ?AUTO_1807 ) ( CLEAR ?AUTO_1809 ) ( HOLDING ?AUTO_1808 ) ( CLEAR ?AUTO_1811 ) ( not ( = ?AUTO_1807 ?AUTO_1811 ) ) ( not ( = ?AUTO_1808 ?AUTO_1811 ) ) ( not ( = ?AUTO_1810 ?AUTO_1811 ) ) ( not ( = ?AUTO_1809 ?AUTO_1811 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1808 ?AUTO_1811 )
      ( MAKE-ON ?AUTO_1807 ?AUTO_1808 )
      ( MAKE-ON-VERIFY ?AUTO_1807 ?AUTO_1808 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1814 - BLOCK
      ?AUTO_1815 - BLOCK
    )
    :vars
    (
      ?AUTO_1817 - BLOCK
      ?AUTO_1816 - BLOCK
      ?AUTO_1818 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1815 ) ( not ( = ?AUTO_1814 ?AUTO_1815 ) ) ( ON-TABLE ?AUTO_1814 ) ( CLEAR ?AUTO_1817 ) ( not ( = ?AUTO_1814 ?AUTO_1816 ) ) ( not ( = ?AUTO_1814 ?AUTO_1817 ) ) ( not ( = ?AUTO_1815 ?AUTO_1816 ) ) ( not ( = ?AUTO_1815 ?AUTO_1817 ) ) ( not ( = ?AUTO_1816 ?AUTO_1817 ) ) ( ON ?AUTO_1816 ?AUTO_1814 ) ( CLEAR ?AUTO_1816 ) ( HOLDING ?AUTO_1818 ) ( not ( = ?AUTO_1814 ?AUTO_1818 ) ) ( not ( = ?AUTO_1815 ?AUTO_1818 ) ) ( not ( = ?AUTO_1817 ?AUTO_1818 ) ) ( not ( = ?AUTO_1816 ?AUTO_1818 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1818 )
      ( MAKE-ON ?AUTO_1814 ?AUTO_1815 )
      ( MAKE-ON-VERIFY ?AUTO_1814 ?AUTO_1815 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1819 - BLOCK
      ?AUTO_1820 - BLOCK
    )
    :vars
    (
      ?AUTO_1822 - BLOCK
      ?AUTO_1821 - BLOCK
      ?AUTO_1823 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1820 ) ( not ( = ?AUTO_1819 ?AUTO_1820 ) ) ( ON-TABLE ?AUTO_1819 ) ( CLEAR ?AUTO_1822 ) ( not ( = ?AUTO_1819 ?AUTO_1821 ) ) ( not ( = ?AUTO_1819 ?AUTO_1822 ) ) ( not ( = ?AUTO_1820 ?AUTO_1821 ) ) ( not ( = ?AUTO_1820 ?AUTO_1822 ) ) ( not ( = ?AUTO_1821 ?AUTO_1822 ) ) ( ON ?AUTO_1821 ?AUTO_1819 ) ( not ( = ?AUTO_1819 ?AUTO_1823 ) ) ( not ( = ?AUTO_1820 ?AUTO_1823 ) ) ( not ( = ?AUTO_1822 ?AUTO_1823 ) ) ( not ( = ?AUTO_1821 ?AUTO_1823 ) ) ( ON ?AUTO_1823 ?AUTO_1821 ) ( CLEAR ?AUTO_1823 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1823 ?AUTO_1821 )
      ( MAKE-ON ?AUTO_1819 ?AUTO_1820 )
      ( MAKE-ON-VERIFY ?AUTO_1819 ?AUTO_1820 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1824 - BLOCK
      ?AUTO_1825 - BLOCK
    )
    :vars
    (
      ?AUTO_1826 - BLOCK
      ?AUTO_1827 - BLOCK
      ?AUTO_1828 - BLOCK
      ?AUTO_1829 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1825 ) ( not ( = ?AUTO_1824 ?AUTO_1825 ) ) ( ON-TABLE ?AUTO_1824 ) ( not ( = ?AUTO_1824 ?AUTO_1826 ) ) ( not ( = ?AUTO_1824 ?AUTO_1827 ) ) ( not ( = ?AUTO_1825 ?AUTO_1826 ) ) ( not ( = ?AUTO_1825 ?AUTO_1827 ) ) ( not ( = ?AUTO_1826 ?AUTO_1827 ) ) ( ON ?AUTO_1826 ?AUTO_1824 ) ( not ( = ?AUTO_1824 ?AUTO_1828 ) ) ( not ( = ?AUTO_1825 ?AUTO_1828 ) ) ( not ( = ?AUTO_1827 ?AUTO_1828 ) ) ( not ( = ?AUTO_1826 ?AUTO_1828 ) ) ( ON ?AUTO_1828 ?AUTO_1826 ) ( CLEAR ?AUTO_1828 ) ( HOLDING ?AUTO_1827 ) ( CLEAR ?AUTO_1829 ) ( not ( = ?AUTO_1824 ?AUTO_1829 ) ) ( not ( = ?AUTO_1825 ?AUTO_1829 ) ) ( not ( = ?AUTO_1826 ?AUTO_1829 ) ) ( not ( = ?AUTO_1827 ?AUTO_1829 ) ) ( not ( = ?AUTO_1828 ?AUTO_1829 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1827 ?AUTO_1829 )
      ( MAKE-ON ?AUTO_1824 ?AUTO_1825 )
      ( MAKE-ON-VERIFY ?AUTO_1824 ?AUTO_1825 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1830 - BLOCK
      ?AUTO_1831 - BLOCK
    )
    :vars
    (
      ?AUTO_1833 - BLOCK
      ?AUTO_1832 - BLOCK
      ?AUTO_1835 - BLOCK
      ?AUTO_1834 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1830 ?AUTO_1831 ) ) ( ON-TABLE ?AUTO_1830 ) ( not ( = ?AUTO_1830 ?AUTO_1833 ) ) ( not ( = ?AUTO_1830 ?AUTO_1832 ) ) ( not ( = ?AUTO_1831 ?AUTO_1833 ) ) ( not ( = ?AUTO_1831 ?AUTO_1832 ) ) ( not ( = ?AUTO_1833 ?AUTO_1832 ) ) ( ON ?AUTO_1833 ?AUTO_1830 ) ( not ( = ?AUTO_1830 ?AUTO_1835 ) ) ( not ( = ?AUTO_1831 ?AUTO_1835 ) ) ( not ( = ?AUTO_1832 ?AUTO_1835 ) ) ( not ( = ?AUTO_1833 ?AUTO_1835 ) ) ( ON ?AUTO_1835 ?AUTO_1833 ) ( CLEAR ?AUTO_1835 ) ( CLEAR ?AUTO_1834 ) ( not ( = ?AUTO_1830 ?AUTO_1834 ) ) ( not ( = ?AUTO_1831 ?AUTO_1834 ) ) ( not ( = ?AUTO_1833 ?AUTO_1834 ) ) ( not ( = ?AUTO_1832 ?AUTO_1834 ) ) ( not ( = ?AUTO_1835 ?AUTO_1834 ) ) ( ON ?AUTO_1832 ?AUTO_1831 ) ( CLEAR ?AUTO_1832 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1832 ?AUTO_1831 )
      ( MAKE-ON ?AUTO_1830 ?AUTO_1831 )
      ( MAKE-ON-VERIFY ?AUTO_1830 ?AUTO_1831 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1836 - BLOCK
      ?AUTO_1837 - BLOCK
    )
    :vars
    (
      ?AUTO_1841 - BLOCK
      ?AUTO_1838 - BLOCK
      ?AUTO_1840 - BLOCK
      ?AUTO_1839 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1836 ?AUTO_1837 ) ) ( ON-TABLE ?AUTO_1836 ) ( not ( = ?AUTO_1836 ?AUTO_1841 ) ) ( not ( = ?AUTO_1836 ?AUTO_1838 ) ) ( not ( = ?AUTO_1837 ?AUTO_1841 ) ) ( not ( = ?AUTO_1837 ?AUTO_1838 ) ) ( not ( = ?AUTO_1841 ?AUTO_1838 ) ) ( ON ?AUTO_1841 ?AUTO_1836 ) ( not ( = ?AUTO_1836 ?AUTO_1840 ) ) ( not ( = ?AUTO_1837 ?AUTO_1840 ) ) ( not ( = ?AUTO_1838 ?AUTO_1840 ) ) ( not ( = ?AUTO_1841 ?AUTO_1840 ) ) ( ON ?AUTO_1840 ?AUTO_1841 ) ( CLEAR ?AUTO_1840 ) ( not ( = ?AUTO_1836 ?AUTO_1839 ) ) ( not ( = ?AUTO_1837 ?AUTO_1839 ) ) ( not ( = ?AUTO_1841 ?AUTO_1839 ) ) ( not ( = ?AUTO_1838 ?AUTO_1839 ) ) ( not ( = ?AUTO_1840 ?AUTO_1839 ) ) ( ON ?AUTO_1838 ?AUTO_1837 ) ( CLEAR ?AUTO_1838 ) ( HOLDING ?AUTO_1839 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1839 )
      ( MAKE-ON ?AUTO_1836 ?AUTO_1837 )
      ( MAKE-ON-VERIFY ?AUTO_1836 ?AUTO_1837 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1842 - BLOCK
      ?AUTO_1843 - BLOCK
    )
    :vars
    (
      ?AUTO_1845 - BLOCK
      ?AUTO_1844 - BLOCK
      ?AUTO_1847 - BLOCK
      ?AUTO_1846 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1842 ?AUTO_1843 ) ) ( ON-TABLE ?AUTO_1842 ) ( not ( = ?AUTO_1842 ?AUTO_1845 ) ) ( not ( = ?AUTO_1842 ?AUTO_1844 ) ) ( not ( = ?AUTO_1843 ?AUTO_1845 ) ) ( not ( = ?AUTO_1843 ?AUTO_1844 ) ) ( not ( = ?AUTO_1845 ?AUTO_1844 ) ) ( ON ?AUTO_1845 ?AUTO_1842 ) ( not ( = ?AUTO_1842 ?AUTO_1847 ) ) ( not ( = ?AUTO_1843 ?AUTO_1847 ) ) ( not ( = ?AUTO_1844 ?AUTO_1847 ) ) ( not ( = ?AUTO_1845 ?AUTO_1847 ) ) ( ON ?AUTO_1847 ?AUTO_1845 ) ( not ( = ?AUTO_1842 ?AUTO_1846 ) ) ( not ( = ?AUTO_1843 ?AUTO_1846 ) ) ( not ( = ?AUTO_1845 ?AUTO_1846 ) ) ( not ( = ?AUTO_1844 ?AUTO_1846 ) ) ( not ( = ?AUTO_1847 ?AUTO_1846 ) ) ( ON ?AUTO_1844 ?AUTO_1843 ) ( CLEAR ?AUTO_1844 ) ( ON ?AUTO_1846 ?AUTO_1847 ) ( CLEAR ?AUTO_1846 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1846 ?AUTO_1847 )
      ( MAKE-ON ?AUTO_1842 ?AUTO_1843 )
      ( MAKE-ON-VERIFY ?AUTO_1842 ?AUTO_1843 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1848 - BLOCK
      ?AUTO_1849 - BLOCK
    )
    :vars
    (
      ?AUTO_1850 - BLOCK
      ?AUTO_1851 - BLOCK
      ?AUTO_1852 - BLOCK
      ?AUTO_1853 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1848 ?AUTO_1849 ) ) ( ON-TABLE ?AUTO_1848 ) ( not ( = ?AUTO_1848 ?AUTO_1850 ) ) ( not ( = ?AUTO_1848 ?AUTO_1851 ) ) ( not ( = ?AUTO_1849 ?AUTO_1850 ) ) ( not ( = ?AUTO_1849 ?AUTO_1851 ) ) ( not ( = ?AUTO_1850 ?AUTO_1851 ) ) ( ON ?AUTO_1850 ?AUTO_1848 ) ( not ( = ?AUTO_1848 ?AUTO_1852 ) ) ( not ( = ?AUTO_1849 ?AUTO_1852 ) ) ( not ( = ?AUTO_1851 ?AUTO_1852 ) ) ( not ( = ?AUTO_1850 ?AUTO_1852 ) ) ( ON ?AUTO_1852 ?AUTO_1850 ) ( not ( = ?AUTO_1848 ?AUTO_1853 ) ) ( not ( = ?AUTO_1849 ?AUTO_1853 ) ) ( not ( = ?AUTO_1850 ?AUTO_1853 ) ) ( not ( = ?AUTO_1851 ?AUTO_1853 ) ) ( not ( = ?AUTO_1852 ?AUTO_1853 ) ) ( ON ?AUTO_1853 ?AUTO_1852 ) ( CLEAR ?AUTO_1853 ) ( HOLDING ?AUTO_1851 ) ( CLEAR ?AUTO_1849 ) )
    :subtasks
    ( ( !STACK ?AUTO_1851 ?AUTO_1849 )
      ( MAKE-ON ?AUTO_1848 ?AUTO_1849 )
      ( MAKE-ON-VERIFY ?AUTO_1848 ?AUTO_1849 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1854 - BLOCK
      ?AUTO_1855 - BLOCK
    )
    :vars
    (
      ?AUTO_1857 - BLOCK
      ?AUTO_1856 - BLOCK
      ?AUTO_1859 - BLOCK
      ?AUTO_1858 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1854 ?AUTO_1855 ) ) ( ON-TABLE ?AUTO_1854 ) ( not ( = ?AUTO_1854 ?AUTO_1857 ) ) ( not ( = ?AUTO_1854 ?AUTO_1856 ) ) ( not ( = ?AUTO_1855 ?AUTO_1857 ) ) ( not ( = ?AUTO_1855 ?AUTO_1856 ) ) ( not ( = ?AUTO_1857 ?AUTO_1856 ) ) ( ON ?AUTO_1857 ?AUTO_1854 ) ( not ( = ?AUTO_1854 ?AUTO_1859 ) ) ( not ( = ?AUTO_1855 ?AUTO_1859 ) ) ( not ( = ?AUTO_1856 ?AUTO_1859 ) ) ( not ( = ?AUTO_1857 ?AUTO_1859 ) ) ( ON ?AUTO_1859 ?AUTO_1857 ) ( not ( = ?AUTO_1854 ?AUTO_1858 ) ) ( not ( = ?AUTO_1855 ?AUTO_1858 ) ) ( not ( = ?AUTO_1857 ?AUTO_1858 ) ) ( not ( = ?AUTO_1856 ?AUTO_1858 ) ) ( not ( = ?AUTO_1859 ?AUTO_1858 ) ) ( ON ?AUTO_1858 ?AUTO_1859 ) ( CLEAR ?AUTO_1855 ) ( ON ?AUTO_1856 ?AUTO_1858 ) ( CLEAR ?AUTO_1856 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1856 ?AUTO_1858 )
      ( MAKE-ON ?AUTO_1854 ?AUTO_1855 )
      ( MAKE-ON-VERIFY ?AUTO_1854 ?AUTO_1855 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1861 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1861 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1861 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1861 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1862 - BLOCK
    )
    :vars
    (
      ?AUTO_1863 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1862 ?AUTO_1863 ) ( CLEAR ?AUTO_1862 ) ( HAND-EMPTY ) ( not ( = ?AUTO_1862 ?AUTO_1863 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1862 ?AUTO_1863 )
      ( MAKE-ON-TABLE ?AUTO_1862 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1862 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1865 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1865 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1865 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1865 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1866 - BLOCK
    )
    :vars
    (
      ?AUTO_1867 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1866 ?AUTO_1867 ) ( CLEAR ?AUTO_1866 ) ( HAND-EMPTY ) ( not ( = ?AUTO_1866 ?AUTO_1867 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1866 ?AUTO_1867 )
      ( MAKE-ON-TABLE ?AUTO_1866 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1866 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1868 - BLOCK
    )
    :vars
    (
      ?AUTO_1869 - BLOCK
      ?AUTO_1870 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1868 ?AUTO_1869 ) ( CLEAR ?AUTO_1868 ) ( not ( = ?AUTO_1868 ?AUTO_1869 ) ) ( HOLDING ?AUTO_1870 ) ( not ( = ?AUTO_1868 ?AUTO_1870 ) ) ( not ( = ?AUTO_1869 ?AUTO_1870 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1870 )
      ( MAKE-ON-TABLE ?AUTO_1868 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1868 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1873 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1873 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1873 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1873 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1874 - BLOCK
    )
    :vars
    (
      ?AUTO_1875 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1874 ?AUTO_1875 ) ( CLEAR ?AUTO_1874 ) ( HAND-EMPTY ) ( not ( = ?AUTO_1874 ?AUTO_1875 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1874 ?AUTO_1875 )
      ( MAKE-ON-TABLE ?AUTO_1874 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1874 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1876 - BLOCK
    )
    :vars
    (
      ?AUTO_1877 - BLOCK
      ?AUTO_1878 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1876 ?AUTO_1877 ) ( CLEAR ?AUTO_1876 ) ( not ( = ?AUTO_1876 ?AUTO_1877 ) ) ( HOLDING ?AUTO_1878 ) ( not ( = ?AUTO_1876 ?AUTO_1878 ) ) ( not ( = ?AUTO_1877 ?AUTO_1878 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1878 )
      ( MAKE-ON-TABLE ?AUTO_1876 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1876 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1879 - BLOCK
    )
    :vars
    (
      ?AUTO_1880 - BLOCK
      ?AUTO_1881 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1879 ?AUTO_1880 ) ( not ( = ?AUTO_1879 ?AUTO_1880 ) ) ( not ( = ?AUTO_1879 ?AUTO_1881 ) ) ( not ( = ?AUTO_1880 ?AUTO_1881 ) ) ( ON ?AUTO_1881 ?AUTO_1879 ) ( CLEAR ?AUTO_1881 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1881 ?AUTO_1879 )
      ( MAKE-ON-TABLE ?AUTO_1879 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1879 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1882 - BLOCK
    )
    :vars
    (
      ?AUTO_1883 - BLOCK
      ?AUTO_1884 - BLOCK
      ?AUTO_1885 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1882 ?AUTO_1883 ) ( not ( = ?AUTO_1882 ?AUTO_1883 ) ) ( not ( = ?AUTO_1882 ?AUTO_1884 ) ) ( not ( = ?AUTO_1883 ?AUTO_1884 ) ) ( ON ?AUTO_1884 ?AUTO_1882 ) ( CLEAR ?AUTO_1884 ) ( HOLDING ?AUTO_1885 ) ( not ( = ?AUTO_1882 ?AUTO_1885 ) ) ( not ( = ?AUTO_1883 ?AUTO_1885 ) ) ( not ( = ?AUTO_1884 ?AUTO_1885 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1885 )
      ( MAKE-ON-TABLE ?AUTO_1882 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1882 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1888 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1888 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1888 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1888 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1889 - BLOCK
    )
    :vars
    (
      ?AUTO_1890 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1889 ?AUTO_1890 ) ( CLEAR ?AUTO_1889 ) ( HAND-EMPTY ) ( not ( = ?AUTO_1889 ?AUTO_1890 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1889 ?AUTO_1890 )
      ( MAKE-ON-TABLE ?AUTO_1889 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1889 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1891 - BLOCK
    )
    :vars
    (
      ?AUTO_1892 - BLOCK
      ?AUTO_1893 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1891 ?AUTO_1892 ) ( CLEAR ?AUTO_1891 ) ( not ( = ?AUTO_1891 ?AUTO_1892 ) ) ( HOLDING ?AUTO_1893 ) ( not ( = ?AUTO_1891 ?AUTO_1893 ) ) ( not ( = ?AUTO_1892 ?AUTO_1893 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1893 )
      ( MAKE-ON-TABLE ?AUTO_1891 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1891 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1901 - BLOCK
      ?AUTO_1902 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1901 ) ( CLEAR ?AUTO_1902 ) ( not ( = ?AUTO_1901 ?AUTO_1902 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1901 ?AUTO_1902 )
      ( MAKE-ON-VERIFY ?AUTO_1901 ?AUTO_1902 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1903 - BLOCK
      ?AUTO_1904 - BLOCK
    )
    :vars
    (
      ?AUTO_1905 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1904 ) ( not ( = ?AUTO_1903 ?AUTO_1904 ) ) ( ON ?AUTO_1903 ?AUTO_1905 ) ( CLEAR ?AUTO_1903 ) ( HAND-EMPTY ) ( not ( = ?AUTO_1903 ?AUTO_1905 ) ) ( not ( = ?AUTO_1904 ?AUTO_1905 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1903 ?AUTO_1905 )
      ( MAKE-ON ?AUTO_1903 ?AUTO_1904 )
      ( MAKE-ON-VERIFY ?AUTO_1903 ?AUTO_1904 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1906 - BLOCK
      ?AUTO_1907 - BLOCK
    )
    :vars
    (
      ?AUTO_1908 - BLOCK
      ?AUTO_1909 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1907 ) ( not ( = ?AUTO_1906 ?AUTO_1907 ) ) ( ON ?AUTO_1906 ?AUTO_1908 ) ( CLEAR ?AUTO_1906 ) ( not ( = ?AUTO_1906 ?AUTO_1908 ) ) ( not ( = ?AUTO_1907 ?AUTO_1908 ) ) ( HOLDING ?AUTO_1909 ) ( not ( = ?AUTO_1906 ?AUTO_1909 ) ) ( not ( = ?AUTO_1907 ?AUTO_1909 ) ) ( not ( = ?AUTO_1908 ?AUTO_1909 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1909 )
      ( MAKE-ON ?AUTO_1906 ?AUTO_1907 )
      ( MAKE-ON-VERIFY ?AUTO_1906 ?AUTO_1907 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1910 - BLOCK
      ?AUTO_1911 - BLOCK
    )
    :vars
    (
      ?AUTO_1912 - BLOCK
      ?AUTO_1913 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1911 ) ( not ( = ?AUTO_1910 ?AUTO_1911 ) ) ( ON ?AUTO_1910 ?AUTO_1912 ) ( not ( = ?AUTO_1910 ?AUTO_1912 ) ) ( not ( = ?AUTO_1911 ?AUTO_1912 ) ) ( not ( = ?AUTO_1910 ?AUTO_1913 ) ) ( not ( = ?AUTO_1911 ?AUTO_1913 ) ) ( not ( = ?AUTO_1912 ?AUTO_1913 ) ) ( ON ?AUTO_1913 ?AUTO_1910 ) ( CLEAR ?AUTO_1913 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1913 ?AUTO_1910 )
      ( MAKE-ON ?AUTO_1910 ?AUTO_1911 )
      ( MAKE-ON-VERIFY ?AUTO_1910 ?AUTO_1911 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1914 - BLOCK
      ?AUTO_1915 - BLOCK
    )
    :vars
    (
      ?AUTO_1916 - BLOCK
      ?AUTO_1917 - BLOCK
      ?AUTO_1918 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1915 ) ( not ( = ?AUTO_1914 ?AUTO_1915 ) ) ( ON ?AUTO_1914 ?AUTO_1916 ) ( not ( = ?AUTO_1914 ?AUTO_1916 ) ) ( not ( = ?AUTO_1915 ?AUTO_1916 ) ) ( not ( = ?AUTO_1914 ?AUTO_1917 ) ) ( not ( = ?AUTO_1915 ?AUTO_1917 ) ) ( not ( = ?AUTO_1916 ?AUTO_1917 ) ) ( ON ?AUTO_1917 ?AUTO_1914 ) ( CLEAR ?AUTO_1917 ) ( HOLDING ?AUTO_1918 ) ( not ( = ?AUTO_1914 ?AUTO_1918 ) ) ( not ( = ?AUTO_1915 ?AUTO_1918 ) ) ( not ( = ?AUTO_1916 ?AUTO_1918 ) ) ( not ( = ?AUTO_1917 ?AUTO_1918 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1918 )
      ( MAKE-ON ?AUTO_1914 ?AUTO_1915 )
      ( MAKE-ON-VERIFY ?AUTO_1914 ?AUTO_1915 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1921 - BLOCK
      ?AUTO_1922 - BLOCK
    )
    :vars
    (
      ?AUTO_1924 - BLOCK
      ?AUTO_1923 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1921 ?AUTO_1922 ) ) ( ON ?AUTO_1921 ?AUTO_1924 ) ( not ( = ?AUTO_1921 ?AUTO_1924 ) ) ( not ( = ?AUTO_1922 ?AUTO_1924 ) ) ( not ( = ?AUTO_1921 ?AUTO_1923 ) ) ( not ( = ?AUTO_1922 ?AUTO_1923 ) ) ( not ( = ?AUTO_1924 ?AUTO_1923 ) ) ( ON ?AUTO_1923 ?AUTO_1921 ) ( CLEAR ?AUTO_1923 ) ( HOLDING ?AUTO_1922 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1922 )
      ( MAKE-ON ?AUTO_1921 ?AUTO_1922 )
      ( MAKE-ON-VERIFY ?AUTO_1921 ?AUTO_1922 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1929 - BLOCK
      ?AUTO_1930 - BLOCK
    )
    :vars
    (
      ?AUTO_1933 - BLOCK
      ?AUTO_1932 - BLOCK
      ?AUTO_1931 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1930 ) ( not ( = ?AUTO_1929 ?AUTO_1930 ) ) ( ON ?AUTO_1929 ?AUTO_1933 ) ( not ( = ?AUTO_1929 ?AUTO_1933 ) ) ( not ( = ?AUTO_1930 ?AUTO_1933 ) ) ( not ( = ?AUTO_1929 ?AUTO_1932 ) ) ( not ( = ?AUTO_1930 ?AUTO_1932 ) ) ( not ( = ?AUTO_1933 ?AUTO_1932 ) ) ( ON ?AUTO_1932 ?AUTO_1929 ) ( not ( = ?AUTO_1929 ?AUTO_1931 ) ) ( not ( = ?AUTO_1930 ?AUTO_1931 ) ) ( not ( = ?AUTO_1933 ?AUTO_1931 ) ) ( not ( = ?AUTO_1932 ?AUTO_1931 ) ) ( ON ?AUTO_1931 ?AUTO_1932 ) ( CLEAR ?AUTO_1931 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1931 ?AUTO_1932 )
      ( MAKE-ON ?AUTO_1929 ?AUTO_1930 )
      ( MAKE-ON-VERIFY ?AUTO_1929 ?AUTO_1930 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1936 - BLOCK
      ?AUTO_1937 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1936 ) ( CLEAR ?AUTO_1937 ) ( not ( = ?AUTO_1936 ?AUTO_1937 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1936 ?AUTO_1937 )
      ( MAKE-ON-VERIFY ?AUTO_1936 ?AUTO_1937 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1938 - BLOCK
      ?AUTO_1939 - BLOCK
    )
    :vars
    (
      ?AUTO_1940 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1939 ) ( not ( = ?AUTO_1938 ?AUTO_1939 ) ) ( ON ?AUTO_1938 ?AUTO_1940 ) ( CLEAR ?AUTO_1938 ) ( HAND-EMPTY ) ( not ( = ?AUTO_1938 ?AUTO_1940 ) ) ( not ( = ?AUTO_1939 ?AUTO_1940 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1938 ?AUTO_1940 )
      ( MAKE-ON ?AUTO_1938 ?AUTO_1939 )
      ( MAKE-ON-VERIFY ?AUTO_1938 ?AUTO_1939 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1941 - BLOCK
      ?AUTO_1942 - BLOCK
    )
    :vars
    (
      ?AUTO_1943 - BLOCK
      ?AUTO_1944 - BLOCK
      ?AUTO_1945 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1942 ) ( not ( = ?AUTO_1941 ?AUTO_1942 ) ) ( ON ?AUTO_1941 ?AUTO_1943 ) ( CLEAR ?AUTO_1941 ) ( not ( = ?AUTO_1941 ?AUTO_1943 ) ) ( not ( = ?AUTO_1942 ?AUTO_1943 ) ) ( HOLDING ?AUTO_1944 ) ( CLEAR ?AUTO_1945 ) ( not ( = ?AUTO_1941 ?AUTO_1944 ) ) ( not ( = ?AUTO_1941 ?AUTO_1945 ) ) ( not ( = ?AUTO_1942 ?AUTO_1944 ) ) ( not ( = ?AUTO_1942 ?AUTO_1945 ) ) ( not ( = ?AUTO_1943 ?AUTO_1944 ) ) ( not ( = ?AUTO_1943 ?AUTO_1945 ) ) ( not ( = ?AUTO_1944 ?AUTO_1945 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1944 ?AUTO_1945 )
      ( MAKE-ON ?AUTO_1941 ?AUTO_1942 )
      ( MAKE-ON-VERIFY ?AUTO_1941 ?AUTO_1942 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1946 - BLOCK
      ?AUTO_1947 - BLOCK
    )
    :vars
    (
      ?AUTO_1948 - BLOCK
      ?AUTO_1949 - BLOCK
      ?AUTO_1950 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1947 ) ( not ( = ?AUTO_1946 ?AUTO_1947 ) ) ( ON ?AUTO_1946 ?AUTO_1948 ) ( not ( = ?AUTO_1946 ?AUTO_1948 ) ) ( not ( = ?AUTO_1947 ?AUTO_1948 ) ) ( CLEAR ?AUTO_1949 ) ( not ( = ?AUTO_1946 ?AUTO_1950 ) ) ( not ( = ?AUTO_1946 ?AUTO_1949 ) ) ( not ( = ?AUTO_1947 ?AUTO_1950 ) ) ( not ( = ?AUTO_1947 ?AUTO_1949 ) ) ( not ( = ?AUTO_1948 ?AUTO_1950 ) ) ( not ( = ?AUTO_1948 ?AUTO_1949 ) ) ( not ( = ?AUTO_1950 ?AUTO_1949 ) ) ( ON ?AUTO_1950 ?AUTO_1946 ) ( CLEAR ?AUTO_1950 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1950 ?AUTO_1946 )
      ( MAKE-ON ?AUTO_1946 ?AUTO_1947 )
      ( MAKE-ON-VERIFY ?AUTO_1946 ?AUTO_1947 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1951 - BLOCK
      ?AUTO_1952 - BLOCK
    )
    :vars
    (
      ?AUTO_1953 - BLOCK
      ?AUTO_1955 - BLOCK
      ?AUTO_1954 - BLOCK
      ?AUTO_1956 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1952 ) ( not ( = ?AUTO_1951 ?AUTO_1952 ) ) ( ON ?AUTO_1951 ?AUTO_1953 ) ( not ( = ?AUTO_1951 ?AUTO_1953 ) ) ( not ( = ?AUTO_1952 ?AUTO_1953 ) ) ( CLEAR ?AUTO_1955 ) ( not ( = ?AUTO_1951 ?AUTO_1954 ) ) ( not ( = ?AUTO_1951 ?AUTO_1955 ) ) ( not ( = ?AUTO_1952 ?AUTO_1954 ) ) ( not ( = ?AUTO_1952 ?AUTO_1955 ) ) ( not ( = ?AUTO_1953 ?AUTO_1954 ) ) ( not ( = ?AUTO_1953 ?AUTO_1955 ) ) ( not ( = ?AUTO_1954 ?AUTO_1955 ) ) ( ON ?AUTO_1954 ?AUTO_1951 ) ( CLEAR ?AUTO_1954 ) ( HOLDING ?AUTO_1956 ) ( not ( = ?AUTO_1951 ?AUTO_1956 ) ) ( not ( = ?AUTO_1952 ?AUTO_1956 ) ) ( not ( = ?AUTO_1953 ?AUTO_1956 ) ) ( not ( = ?AUTO_1955 ?AUTO_1956 ) ) ( not ( = ?AUTO_1954 ?AUTO_1956 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1956 )
      ( MAKE-ON ?AUTO_1951 ?AUTO_1952 )
      ( MAKE-ON-VERIFY ?AUTO_1951 ?AUTO_1952 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1957 - BLOCK
      ?AUTO_1958 - BLOCK
    )
    :vars
    (
      ?AUTO_1960 - BLOCK
      ?AUTO_1961 - BLOCK
      ?AUTO_1959 - BLOCK
      ?AUTO_1962 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1958 ) ( not ( = ?AUTO_1957 ?AUTO_1958 ) ) ( ON ?AUTO_1957 ?AUTO_1960 ) ( not ( = ?AUTO_1957 ?AUTO_1960 ) ) ( not ( = ?AUTO_1958 ?AUTO_1960 ) ) ( CLEAR ?AUTO_1961 ) ( not ( = ?AUTO_1957 ?AUTO_1959 ) ) ( not ( = ?AUTO_1957 ?AUTO_1961 ) ) ( not ( = ?AUTO_1958 ?AUTO_1959 ) ) ( not ( = ?AUTO_1958 ?AUTO_1961 ) ) ( not ( = ?AUTO_1960 ?AUTO_1959 ) ) ( not ( = ?AUTO_1960 ?AUTO_1961 ) ) ( not ( = ?AUTO_1959 ?AUTO_1961 ) ) ( ON ?AUTO_1959 ?AUTO_1957 ) ( not ( = ?AUTO_1957 ?AUTO_1962 ) ) ( not ( = ?AUTO_1958 ?AUTO_1962 ) ) ( not ( = ?AUTO_1960 ?AUTO_1962 ) ) ( not ( = ?AUTO_1961 ?AUTO_1962 ) ) ( not ( = ?AUTO_1959 ?AUTO_1962 ) ) ( ON ?AUTO_1962 ?AUTO_1959 ) ( CLEAR ?AUTO_1962 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1962 ?AUTO_1959 )
      ( MAKE-ON ?AUTO_1957 ?AUTO_1958 )
      ( MAKE-ON-VERIFY ?AUTO_1957 ?AUTO_1958 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1963 - BLOCK
      ?AUTO_1964 - BLOCK
    )
    :vars
    (
      ?AUTO_1967 - BLOCK
      ?AUTO_1966 - BLOCK
      ?AUTO_1968 - BLOCK
      ?AUTO_1965 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1963 ?AUTO_1964 ) ) ( ON ?AUTO_1963 ?AUTO_1967 ) ( not ( = ?AUTO_1963 ?AUTO_1967 ) ) ( not ( = ?AUTO_1964 ?AUTO_1967 ) ) ( CLEAR ?AUTO_1966 ) ( not ( = ?AUTO_1963 ?AUTO_1968 ) ) ( not ( = ?AUTO_1963 ?AUTO_1966 ) ) ( not ( = ?AUTO_1964 ?AUTO_1968 ) ) ( not ( = ?AUTO_1964 ?AUTO_1966 ) ) ( not ( = ?AUTO_1967 ?AUTO_1968 ) ) ( not ( = ?AUTO_1967 ?AUTO_1966 ) ) ( not ( = ?AUTO_1968 ?AUTO_1966 ) ) ( ON ?AUTO_1968 ?AUTO_1963 ) ( not ( = ?AUTO_1963 ?AUTO_1965 ) ) ( not ( = ?AUTO_1964 ?AUTO_1965 ) ) ( not ( = ?AUTO_1967 ?AUTO_1965 ) ) ( not ( = ?AUTO_1966 ?AUTO_1965 ) ) ( not ( = ?AUTO_1968 ?AUTO_1965 ) ) ( ON ?AUTO_1965 ?AUTO_1968 ) ( CLEAR ?AUTO_1965 ) ( HOLDING ?AUTO_1964 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1964 )
      ( MAKE-ON ?AUTO_1963 ?AUTO_1964 )
      ( MAKE-ON-VERIFY ?AUTO_1963 ?AUTO_1964 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1971 - BLOCK
      ?AUTO_1972 - BLOCK
    )
    :vars
    (
      ?AUTO_1973 - BLOCK
      ?AUTO_1976 - BLOCK
      ?AUTO_1974 - BLOCK
      ?AUTO_1975 - BLOCK
      ?AUTO_1977 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1972 ) ( not ( = ?AUTO_1971 ?AUTO_1972 ) ) ( ON ?AUTO_1971 ?AUTO_1973 ) ( not ( = ?AUTO_1971 ?AUTO_1973 ) ) ( not ( = ?AUTO_1972 ?AUTO_1973 ) ) ( CLEAR ?AUTO_1976 ) ( not ( = ?AUTO_1971 ?AUTO_1974 ) ) ( not ( = ?AUTO_1971 ?AUTO_1976 ) ) ( not ( = ?AUTO_1972 ?AUTO_1974 ) ) ( not ( = ?AUTO_1972 ?AUTO_1976 ) ) ( not ( = ?AUTO_1973 ?AUTO_1974 ) ) ( not ( = ?AUTO_1973 ?AUTO_1976 ) ) ( not ( = ?AUTO_1974 ?AUTO_1976 ) ) ( ON ?AUTO_1974 ?AUTO_1971 ) ( not ( = ?AUTO_1971 ?AUTO_1975 ) ) ( not ( = ?AUTO_1972 ?AUTO_1975 ) ) ( not ( = ?AUTO_1973 ?AUTO_1975 ) ) ( not ( = ?AUTO_1976 ?AUTO_1975 ) ) ( not ( = ?AUTO_1974 ?AUTO_1975 ) ) ( ON ?AUTO_1975 ?AUTO_1974 ) ( CLEAR ?AUTO_1975 ) ( HOLDING ?AUTO_1977 ) ( not ( = ?AUTO_1971 ?AUTO_1977 ) ) ( not ( = ?AUTO_1972 ?AUTO_1977 ) ) ( not ( = ?AUTO_1973 ?AUTO_1977 ) ) ( not ( = ?AUTO_1976 ?AUTO_1977 ) ) ( not ( = ?AUTO_1974 ?AUTO_1977 ) ) ( not ( = ?AUTO_1975 ?AUTO_1977 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1977 )
      ( MAKE-ON ?AUTO_1971 ?AUTO_1972 )
      ( MAKE-ON-VERIFY ?AUTO_1971 ?AUTO_1972 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1978 - BLOCK
      ?AUTO_1979 - BLOCK
    )
    :vars
    (
      ?AUTO_1982 - BLOCK
      ?AUTO_1983 - BLOCK
      ?AUTO_1981 - BLOCK
      ?AUTO_1984 - BLOCK
      ?AUTO_1980 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1978 ?AUTO_1979 ) ) ( ON ?AUTO_1978 ?AUTO_1982 ) ( not ( = ?AUTO_1978 ?AUTO_1982 ) ) ( not ( = ?AUTO_1979 ?AUTO_1982 ) ) ( CLEAR ?AUTO_1983 ) ( not ( = ?AUTO_1978 ?AUTO_1981 ) ) ( not ( = ?AUTO_1978 ?AUTO_1983 ) ) ( not ( = ?AUTO_1979 ?AUTO_1981 ) ) ( not ( = ?AUTO_1979 ?AUTO_1983 ) ) ( not ( = ?AUTO_1982 ?AUTO_1981 ) ) ( not ( = ?AUTO_1982 ?AUTO_1983 ) ) ( not ( = ?AUTO_1981 ?AUTO_1983 ) ) ( ON ?AUTO_1981 ?AUTO_1978 ) ( not ( = ?AUTO_1978 ?AUTO_1984 ) ) ( not ( = ?AUTO_1979 ?AUTO_1984 ) ) ( not ( = ?AUTO_1982 ?AUTO_1984 ) ) ( not ( = ?AUTO_1983 ?AUTO_1984 ) ) ( not ( = ?AUTO_1981 ?AUTO_1984 ) ) ( ON ?AUTO_1984 ?AUTO_1981 ) ( CLEAR ?AUTO_1984 ) ( not ( = ?AUTO_1978 ?AUTO_1980 ) ) ( not ( = ?AUTO_1979 ?AUTO_1980 ) ) ( not ( = ?AUTO_1982 ?AUTO_1980 ) ) ( not ( = ?AUTO_1983 ?AUTO_1980 ) ) ( not ( = ?AUTO_1981 ?AUTO_1980 ) ) ( not ( = ?AUTO_1984 ?AUTO_1980 ) ) ( ON ?AUTO_1980 ?AUTO_1979 ) ( CLEAR ?AUTO_1980 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1980 ?AUTO_1979 )
      ( MAKE-ON ?AUTO_1978 ?AUTO_1979 )
      ( MAKE-ON-VERIFY ?AUTO_1978 ?AUTO_1979 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1985 - BLOCK
      ?AUTO_1986 - BLOCK
    )
    :vars
    (
      ?AUTO_1990 - BLOCK
      ?AUTO_1988 - BLOCK
      ?AUTO_1989 - BLOCK
      ?AUTO_1987 - BLOCK
      ?AUTO_1991 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1985 ?AUTO_1986 ) ) ( ON ?AUTO_1985 ?AUTO_1990 ) ( not ( = ?AUTO_1985 ?AUTO_1990 ) ) ( not ( = ?AUTO_1986 ?AUTO_1990 ) ) ( not ( = ?AUTO_1985 ?AUTO_1988 ) ) ( not ( = ?AUTO_1985 ?AUTO_1989 ) ) ( not ( = ?AUTO_1986 ?AUTO_1988 ) ) ( not ( = ?AUTO_1986 ?AUTO_1989 ) ) ( not ( = ?AUTO_1990 ?AUTO_1988 ) ) ( not ( = ?AUTO_1990 ?AUTO_1989 ) ) ( not ( = ?AUTO_1988 ?AUTO_1989 ) ) ( ON ?AUTO_1988 ?AUTO_1985 ) ( not ( = ?AUTO_1985 ?AUTO_1987 ) ) ( not ( = ?AUTO_1986 ?AUTO_1987 ) ) ( not ( = ?AUTO_1990 ?AUTO_1987 ) ) ( not ( = ?AUTO_1989 ?AUTO_1987 ) ) ( not ( = ?AUTO_1988 ?AUTO_1987 ) ) ( ON ?AUTO_1987 ?AUTO_1988 ) ( CLEAR ?AUTO_1987 ) ( not ( = ?AUTO_1985 ?AUTO_1991 ) ) ( not ( = ?AUTO_1986 ?AUTO_1991 ) ) ( not ( = ?AUTO_1990 ?AUTO_1991 ) ) ( not ( = ?AUTO_1989 ?AUTO_1991 ) ) ( not ( = ?AUTO_1988 ?AUTO_1991 ) ) ( not ( = ?AUTO_1987 ?AUTO_1991 ) ) ( ON ?AUTO_1991 ?AUTO_1986 ) ( CLEAR ?AUTO_1991 ) ( HOLDING ?AUTO_1989 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1989 )
      ( MAKE-ON ?AUTO_1985 ?AUTO_1986 )
      ( MAKE-ON-VERIFY ?AUTO_1985 ?AUTO_1986 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1992 - BLOCK
      ?AUTO_1993 - BLOCK
    )
    :vars
    (
      ?AUTO_1997 - BLOCK
      ?AUTO_1994 - BLOCK
      ?AUTO_1995 - BLOCK
      ?AUTO_1996 - BLOCK
      ?AUTO_1998 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1992 ?AUTO_1993 ) ) ( ON ?AUTO_1992 ?AUTO_1997 ) ( not ( = ?AUTO_1992 ?AUTO_1997 ) ) ( not ( = ?AUTO_1993 ?AUTO_1997 ) ) ( not ( = ?AUTO_1992 ?AUTO_1994 ) ) ( not ( = ?AUTO_1992 ?AUTO_1995 ) ) ( not ( = ?AUTO_1993 ?AUTO_1994 ) ) ( not ( = ?AUTO_1993 ?AUTO_1995 ) ) ( not ( = ?AUTO_1997 ?AUTO_1994 ) ) ( not ( = ?AUTO_1997 ?AUTO_1995 ) ) ( not ( = ?AUTO_1994 ?AUTO_1995 ) ) ( ON ?AUTO_1994 ?AUTO_1992 ) ( not ( = ?AUTO_1992 ?AUTO_1996 ) ) ( not ( = ?AUTO_1993 ?AUTO_1996 ) ) ( not ( = ?AUTO_1997 ?AUTO_1996 ) ) ( not ( = ?AUTO_1995 ?AUTO_1996 ) ) ( not ( = ?AUTO_1994 ?AUTO_1996 ) ) ( ON ?AUTO_1996 ?AUTO_1994 ) ( not ( = ?AUTO_1992 ?AUTO_1998 ) ) ( not ( = ?AUTO_1993 ?AUTO_1998 ) ) ( not ( = ?AUTO_1997 ?AUTO_1998 ) ) ( not ( = ?AUTO_1995 ?AUTO_1998 ) ) ( not ( = ?AUTO_1994 ?AUTO_1998 ) ) ( not ( = ?AUTO_1996 ?AUTO_1998 ) ) ( ON ?AUTO_1998 ?AUTO_1993 ) ( CLEAR ?AUTO_1998 ) ( ON ?AUTO_1995 ?AUTO_1996 ) ( CLEAR ?AUTO_1995 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1995 ?AUTO_1996 )
      ( MAKE-ON ?AUTO_1992 ?AUTO_1993 )
      ( MAKE-ON-VERIFY ?AUTO_1992 ?AUTO_1993 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2001 - BLOCK
      ?AUTO_2002 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2001 ) ( CLEAR ?AUTO_2002 ) ( not ( = ?AUTO_2001 ?AUTO_2002 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2001 ?AUTO_2002 )
      ( MAKE-ON-VERIFY ?AUTO_2001 ?AUTO_2002 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2003 - BLOCK
      ?AUTO_2004 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2004 ) ( not ( = ?AUTO_2003 ?AUTO_2004 ) ) ( ON-TABLE ?AUTO_2003 ) ( CLEAR ?AUTO_2003 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_2003 )
      ( MAKE-ON ?AUTO_2003 ?AUTO_2004 )
      ( MAKE-ON-VERIFY ?AUTO_2003 ?AUTO_2004 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2005 - BLOCK
      ?AUTO_2006 - BLOCK
    )
    :vars
    (
      ?AUTO_2007 - BLOCK
      ?AUTO_2008 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2006 ) ( not ( = ?AUTO_2005 ?AUTO_2006 ) ) ( ON-TABLE ?AUTO_2005 ) ( CLEAR ?AUTO_2005 ) ( HOLDING ?AUTO_2007 ) ( CLEAR ?AUTO_2008 ) ( not ( = ?AUTO_2005 ?AUTO_2007 ) ) ( not ( = ?AUTO_2005 ?AUTO_2008 ) ) ( not ( = ?AUTO_2006 ?AUTO_2007 ) ) ( not ( = ?AUTO_2006 ?AUTO_2008 ) ) ( not ( = ?AUTO_2007 ?AUTO_2008 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2007 ?AUTO_2008 )
      ( MAKE-ON ?AUTO_2005 ?AUTO_2006 )
      ( MAKE-ON-VERIFY ?AUTO_2005 ?AUTO_2006 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2009 - BLOCK
      ?AUTO_2010 - BLOCK
    )
    :vars
    (
      ?AUTO_2011 - BLOCK
      ?AUTO_2012 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2009 ?AUTO_2010 ) ) ( ON-TABLE ?AUTO_2009 ) ( CLEAR ?AUTO_2009 ) ( CLEAR ?AUTO_2011 ) ( not ( = ?AUTO_2009 ?AUTO_2012 ) ) ( not ( = ?AUTO_2009 ?AUTO_2011 ) ) ( not ( = ?AUTO_2010 ?AUTO_2012 ) ) ( not ( = ?AUTO_2010 ?AUTO_2011 ) ) ( not ( = ?AUTO_2012 ?AUTO_2011 ) ) ( ON ?AUTO_2012 ?AUTO_2010 ) ( CLEAR ?AUTO_2012 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2012 ?AUTO_2010 )
      ( MAKE-ON ?AUTO_2009 ?AUTO_2010 )
      ( MAKE-ON-VERIFY ?AUTO_2009 ?AUTO_2010 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2013 - BLOCK
      ?AUTO_2014 - BLOCK
    )
    :vars
    (
      ?AUTO_2015 - BLOCK
      ?AUTO_2016 - BLOCK
      ?AUTO_2017 - BLOCK
      ?AUTO_2018 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2013 ?AUTO_2014 ) ) ( ON-TABLE ?AUTO_2013 ) ( CLEAR ?AUTO_2013 ) ( CLEAR ?AUTO_2015 ) ( not ( = ?AUTO_2013 ?AUTO_2016 ) ) ( not ( = ?AUTO_2013 ?AUTO_2015 ) ) ( not ( = ?AUTO_2014 ?AUTO_2016 ) ) ( not ( = ?AUTO_2014 ?AUTO_2015 ) ) ( not ( = ?AUTO_2016 ?AUTO_2015 ) ) ( ON ?AUTO_2016 ?AUTO_2014 ) ( CLEAR ?AUTO_2016 ) ( HOLDING ?AUTO_2017 ) ( CLEAR ?AUTO_2018 ) ( not ( = ?AUTO_2013 ?AUTO_2017 ) ) ( not ( = ?AUTO_2013 ?AUTO_2018 ) ) ( not ( = ?AUTO_2014 ?AUTO_2017 ) ) ( not ( = ?AUTO_2014 ?AUTO_2018 ) ) ( not ( = ?AUTO_2015 ?AUTO_2017 ) ) ( not ( = ?AUTO_2015 ?AUTO_2018 ) ) ( not ( = ?AUTO_2016 ?AUTO_2017 ) ) ( not ( = ?AUTO_2016 ?AUTO_2018 ) ) ( not ( = ?AUTO_2017 ?AUTO_2018 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2017 ?AUTO_2018 )
      ( MAKE-ON ?AUTO_2013 ?AUTO_2014 )
      ( MAKE-ON-VERIFY ?AUTO_2013 ?AUTO_2014 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2019 - BLOCK
      ?AUTO_2020 - BLOCK
    )
    :vars
    (
      ?AUTO_2022 - BLOCK
      ?AUTO_2021 - BLOCK
      ?AUTO_2024 - BLOCK
      ?AUTO_2023 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2019 ?AUTO_2020 ) ) ( ON-TABLE ?AUTO_2019 ) ( CLEAR ?AUTO_2019 ) ( CLEAR ?AUTO_2022 ) ( not ( = ?AUTO_2019 ?AUTO_2021 ) ) ( not ( = ?AUTO_2019 ?AUTO_2022 ) ) ( not ( = ?AUTO_2020 ?AUTO_2021 ) ) ( not ( = ?AUTO_2020 ?AUTO_2022 ) ) ( not ( = ?AUTO_2021 ?AUTO_2022 ) ) ( ON ?AUTO_2021 ?AUTO_2020 ) ( CLEAR ?AUTO_2024 ) ( not ( = ?AUTO_2019 ?AUTO_2023 ) ) ( not ( = ?AUTO_2019 ?AUTO_2024 ) ) ( not ( = ?AUTO_2020 ?AUTO_2023 ) ) ( not ( = ?AUTO_2020 ?AUTO_2024 ) ) ( not ( = ?AUTO_2022 ?AUTO_2023 ) ) ( not ( = ?AUTO_2022 ?AUTO_2024 ) ) ( not ( = ?AUTO_2021 ?AUTO_2023 ) ) ( not ( = ?AUTO_2021 ?AUTO_2024 ) ) ( not ( = ?AUTO_2023 ?AUTO_2024 ) ) ( ON ?AUTO_2023 ?AUTO_2021 ) ( CLEAR ?AUTO_2023 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2023 ?AUTO_2021 )
      ( MAKE-ON ?AUTO_2019 ?AUTO_2020 )
      ( MAKE-ON-VERIFY ?AUTO_2019 ?AUTO_2020 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2025 - BLOCK
      ?AUTO_2026 - BLOCK
    )
    :vars
    (
      ?AUTO_2027 - BLOCK
      ?AUTO_2030 - BLOCK
      ?AUTO_2028 - BLOCK
      ?AUTO_2029 - BLOCK
      ?AUTO_2031 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2025 ?AUTO_2026 ) ) ( ON-TABLE ?AUTO_2025 ) ( CLEAR ?AUTO_2025 ) ( CLEAR ?AUTO_2027 ) ( not ( = ?AUTO_2025 ?AUTO_2030 ) ) ( not ( = ?AUTO_2025 ?AUTO_2027 ) ) ( not ( = ?AUTO_2026 ?AUTO_2030 ) ) ( not ( = ?AUTO_2026 ?AUTO_2027 ) ) ( not ( = ?AUTO_2030 ?AUTO_2027 ) ) ( ON ?AUTO_2030 ?AUTO_2026 ) ( CLEAR ?AUTO_2028 ) ( not ( = ?AUTO_2025 ?AUTO_2029 ) ) ( not ( = ?AUTO_2025 ?AUTO_2028 ) ) ( not ( = ?AUTO_2026 ?AUTO_2029 ) ) ( not ( = ?AUTO_2026 ?AUTO_2028 ) ) ( not ( = ?AUTO_2027 ?AUTO_2029 ) ) ( not ( = ?AUTO_2027 ?AUTO_2028 ) ) ( not ( = ?AUTO_2030 ?AUTO_2029 ) ) ( not ( = ?AUTO_2030 ?AUTO_2028 ) ) ( not ( = ?AUTO_2029 ?AUTO_2028 ) ) ( ON ?AUTO_2029 ?AUTO_2030 ) ( CLEAR ?AUTO_2029 ) ( HOLDING ?AUTO_2031 ) ( not ( = ?AUTO_2025 ?AUTO_2031 ) ) ( not ( = ?AUTO_2026 ?AUTO_2031 ) ) ( not ( = ?AUTO_2027 ?AUTO_2031 ) ) ( not ( = ?AUTO_2030 ?AUTO_2031 ) ) ( not ( = ?AUTO_2028 ?AUTO_2031 ) ) ( not ( = ?AUTO_2029 ?AUTO_2031 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2031 )
      ( MAKE-ON ?AUTO_2025 ?AUTO_2026 )
      ( MAKE-ON-VERIFY ?AUTO_2025 ?AUTO_2026 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2032 - BLOCK
      ?AUTO_2033 - BLOCK
    )
    :vars
    (
      ?AUTO_2036 - BLOCK
      ?AUTO_2035 - BLOCK
      ?AUTO_2034 - BLOCK
      ?AUTO_2037 - BLOCK
      ?AUTO_2038 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2032 ?AUTO_2033 ) ) ( ON-TABLE ?AUTO_2032 ) ( CLEAR ?AUTO_2032 ) ( CLEAR ?AUTO_2036 ) ( not ( = ?AUTO_2032 ?AUTO_2035 ) ) ( not ( = ?AUTO_2032 ?AUTO_2036 ) ) ( not ( = ?AUTO_2033 ?AUTO_2035 ) ) ( not ( = ?AUTO_2033 ?AUTO_2036 ) ) ( not ( = ?AUTO_2035 ?AUTO_2036 ) ) ( ON ?AUTO_2035 ?AUTO_2033 ) ( CLEAR ?AUTO_2034 ) ( not ( = ?AUTO_2032 ?AUTO_2037 ) ) ( not ( = ?AUTO_2032 ?AUTO_2034 ) ) ( not ( = ?AUTO_2033 ?AUTO_2037 ) ) ( not ( = ?AUTO_2033 ?AUTO_2034 ) ) ( not ( = ?AUTO_2036 ?AUTO_2037 ) ) ( not ( = ?AUTO_2036 ?AUTO_2034 ) ) ( not ( = ?AUTO_2035 ?AUTO_2037 ) ) ( not ( = ?AUTO_2035 ?AUTO_2034 ) ) ( not ( = ?AUTO_2037 ?AUTO_2034 ) ) ( ON ?AUTO_2037 ?AUTO_2035 ) ( not ( = ?AUTO_2032 ?AUTO_2038 ) ) ( not ( = ?AUTO_2033 ?AUTO_2038 ) ) ( not ( = ?AUTO_2036 ?AUTO_2038 ) ) ( not ( = ?AUTO_2035 ?AUTO_2038 ) ) ( not ( = ?AUTO_2034 ?AUTO_2038 ) ) ( not ( = ?AUTO_2037 ?AUTO_2038 ) ) ( ON ?AUTO_2038 ?AUTO_2037 ) ( CLEAR ?AUTO_2038 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2038 ?AUTO_2037 )
      ( MAKE-ON ?AUTO_2032 ?AUTO_2033 )
      ( MAKE-ON-VERIFY ?AUTO_2032 ?AUTO_2033 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2039 - BLOCK
      ?AUTO_2040 - BLOCK
    )
    :vars
    (
      ?AUTO_2042 - BLOCK
      ?AUTO_2041 - BLOCK
      ?AUTO_2043 - BLOCK
      ?AUTO_2045 - BLOCK
      ?AUTO_2044 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2039 ?AUTO_2040 ) ) ( ON-TABLE ?AUTO_2039 ) ( CLEAR ?AUTO_2039 ) ( not ( = ?AUTO_2039 ?AUTO_2042 ) ) ( not ( = ?AUTO_2039 ?AUTO_2041 ) ) ( not ( = ?AUTO_2040 ?AUTO_2042 ) ) ( not ( = ?AUTO_2040 ?AUTO_2041 ) ) ( not ( = ?AUTO_2042 ?AUTO_2041 ) ) ( ON ?AUTO_2042 ?AUTO_2040 ) ( CLEAR ?AUTO_2043 ) ( not ( = ?AUTO_2039 ?AUTO_2045 ) ) ( not ( = ?AUTO_2039 ?AUTO_2043 ) ) ( not ( = ?AUTO_2040 ?AUTO_2045 ) ) ( not ( = ?AUTO_2040 ?AUTO_2043 ) ) ( not ( = ?AUTO_2041 ?AUTO_2045 ) ) ( not ( = ?AUTO_2041 ?AUTO_2043 ) ) ( not ( = ?AUTO_2042 ?AUTO_2045 ) ) ( not ( = ?AUTO_2042 ?AUTO_2043 ) ) ( not ( = ?AUTO_2045 ?AUTO_2043 ) ) ( ON ?AUTO_2045 ?AUTO_2042 ) ( not ( = ?AUTO_2039 ?AUTO_2044 ) ) ( not ( = ?AUTO_2040 ?AUTO_2044 ) ) ( not ( = ?AUTO_2041 ?AUTO_2044 ) ) ( not ( = ?AUTO_2042 ?AUTO_2044 ) ) ( not ( = ?AUTO_2043 ?AUTO_2044 ) ) ( not ( = ?AUTO_2045 ?AUTO_2044 ) ) ( ON ?AUTO_2044 ?AUTO_2045 ) ( CLEAR ?AUTO_2044 ) ( HOLDING ?AUTO_2041 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2041 )
      ( MAKE-ON ?AUTO_2039 ?AUTO_2040 )
      ( MAKE-ON-VERIFY ?AUTO_2039 ?AUTO_2040 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2046 - BLOCK
      ?AUTO_2047 - BLOCK
    )
    :vars
    (
      ?AUTO_2050 - BLOCK
      ?AUTO_2048 - BLOCK
      ?AUTO_2052 - BLOCK
      ?AUTO_2051 - BLOCK
      ?AUTO_2049 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2046 ?AUTO_2047 ) ) ( ON-TABLE ?AUTO_2046 ) ( not ( = ?AUTO_2046 ?AUTO_2050 ) ) ( not ( = ?AUTO_2046 ?AUTO_2048 ) ) ( not ( = ?AUTO_2047 ?AUTO_2050 ) ) ( not ( = ?AUTO_2047 ?AUTO_2048 ) ) ( not ( = ?AUTO_2050 ?AUTO_2048 ) ) ( ON ?AUTO_2050 ?AUTO_2047 ) ( CLEAR ?AUTO_2052 ) ( not ( = ?AUTO_2046 ?AUTO_2051 ) ) ( not ( = ?AUTO_2046 ?AUTO_2052 ) ) ( not ( = ?AUTO_2047 ?AUTO_2051 ) ) ( not ( = ?AUTO_2047 ?AUTO_2052 ) ) ( not ( = ?AUTO_2048 ?AUTO_2051 ) ) ( not ( = ?AUTO_2048 ?AUTO_2052 ) ) ( not ( = ?AUTO_2050 ?AUTO_2051 ) ) ( not ( = ?AUTO_2050 ?AUTO_2052 ) ) ( not ( = ?AUTO_2051 ?AUTO_2052 ) ) ( ON ?AUTO_2051 ?AUTO_2050 ) ( not ( = ?AUTO_2046 ?AUTO_2049 ) ) ( not ( = ?AUTO_2047 ?AUTO_2049 ) ) ( not ( = ?AUTO_2048 ?AUTO_2049 ) ) ( not ( = ?AUTO_2050 ?AUTO_2049 ) ) ( not ( = ?AUTO_2052 ?AUTO_2049 ) ) ( not ( = ?AUTO_2051 ?AUTO_2049 ) ) ( ON ?AUTO_2049 ?AUTO_2051 ) ( CLEAR ?AUTO_2049 ) ( ON ?AUTO_2048 ?AUTO_2046 ) ( CLEAR ?AUTO_2048 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2048 ?AUTO_2046 )
      ( MAKE-ON ?AUTO_2046 ?AUTO_2047 )
      ( MAKE-ON-VERIFY ?AUTO_2046 ?AUTO_2047 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2053 - BLOCK
      ?AUTO_2054 - BLOCK
    )
    :vars
    (
      ?AUTO_2058 - BLOCK
      ?AUTO_2056 - BLOCK
      ?AUTO_2059 - BLOCK
      ?AUTO_2057 - BLOCK
      ?AUTO_2055 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2053 ?AUTO_2054 ) ) ( ON-TABLE ?AUTO_2053 ) ( not ( = ?AUTO_2053 ?AUTO_2058 ) ) ( not ( = ?AUTO_2053 ?AUTO_2056 ) ) ( not ( = ?AUTO_2054 ?AUTO_2058 ) ) ( not ( = ?AUTO_2054 ?AUTO_2056 ) ) ( not ( = ?AUTO_2058 ?AUTO_2056 ) ) ( ON ?AUTO_2058 ?AUTO_2054 ) ( not ( = ?AUTO_2053 ?AUTO_2059 ) ) ( not ( = ?AUTO_2053 ?AUTO_2057 ) ) ( not ( = ?AUTO_2054 ?AUTO_2059 ) ) ( not ( = ?AUTO_2054 ?AUTO_2057 ) ) ( not ( = ?AUTO_2056 ?AUTO_2059 ) ) ( not ( = ?AUTO_2056 ?AUTO_2057 ) ) ( not ( = ?AUTO_2058 ?AUTO_2059 ) ) ( not ( = ?AUTO_2058 ?AUTO_2057 ) ) ( not ( = ?AUTO_2059 ?AUTO_2057 ) ) ( ON ?AUTO_2059 ?AUTO_2058 ) ( not ( = ?AUTO_2053 ?AUTO_2055 ) ) ( not ( = ?AUTO_2054 ?AUTO_2055 ) ) ( not ( = ?AUTO_2056 ?AUTO_2055 ) ) ( not ( = ?AUTO_2058 ?AUTO_2055 ) ) ( not ( = ?AUTO_2057 ?AUTO_2055 ) ) ( not ( = ?AUTO_2059 ?AUTO_2055 ) ) ( ON ?AUTO_2055 ?AUTO_2059 ) ( CLEAR ?AUTO_2055 ) ( ON ?AUTO_2056 ?AUTO_2053 ) ( CLEAR ?AUTO_2056 ) ( HOLDING ?AUTO_2057 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2057 )
      ( MAKE-ON ?AUTO_2053 ?AUTO_2054 )
      ( MAKE-ON-VERIFY ?AUTO_2053 ?AUTO_2054 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2060 - BLOCK
      ?AUTO_2061 - BLOCK
    )
    :vars
    (
      ?AUTO_2065 - BLOCK
      ?AUTO_2063 - BLOCK
      ?AUTO_2064 - BLOCK
      ?AUTO_2066 - BLOCK
      ?AUTO_2062 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2060 ?AUTO_2061 ) ) ( ON-TABLE ?AUTO_2060 ) ( not ( = ?AUTO_2060 ?AUTO_2065 ) ) ( not ( = ?AUTO_2060 ?AUTO_2063 ) ) ( not ( = ?AUTO_2061 ?AUTO_2065 ) ) ( not ( = ?AUTO_2061 ?AUTO_2063 ) ) ( not ( = ?AUTO_2065 ?AUTO_2063 ) ) ( ON ?AUTO_2065 ?AUTO_2061 ) ( not ( = ?AUTO_2060 ?AUTO_2064 ) ) ( not ( = ?AUTO_2060 ?AUTO_2066 ) ) ( not ( = ?AUTO_2061 ?AUTO_2064 ) ) ( not ( = ?AUTO_2061 ?AUTO_2066 ) ) ( not ( = ?AUTO_2063 ?AUTO_2064 ) ) ( not ( = ?AUTO_2063 ?AUTO_2066 ) ) ( not ( = ?AUTO_2065 ?AUTO_2064 ) ) ( not ( = ?AUTO_2065 ?AUTO_2066 ) ) ( not ( = ?AUTO_2064 ?AUTO_2066 ) ) ( ON ?AUTO_2064 ?AUTO_2065 ) ( not ( = ?AUTO_2060 ?AUTO_2062 ) ) ( not ( = ?AUTO_2061 ?AUTO_2062 ) ) ( not ( = ?AUTO_2063 ?AUTO_2062 ) ) ( not ( = ?AUTO_2065 ?AUTO_2062 ) ) ( not ( = ?AUTO_2066 ?AUTO_2062 ) ) ( not ( = ?AUTO_2064 ?AUTO_2062 ) ) ( ON ?AUTO_2062 ?AUTO_2064 ) ( CLEAR ?AUTO_2062 ) ( ON ?AUTO_2063 ?AUTO_2060 ) ( ON ?AUTO_2066 ?AUTO_2063 ) ( CLEAR ?AUTO_2066 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2066 ?AUTO_2063 )
      ( MAKE-ON ?AUTO_2060 ?AUTO_2061 )
      ( MAKE-ON-VERIFY ?AUTO_2060 ?AUTO_2061 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2067 - BLOCK
      ?AUTO_2068 - BLOCK
    )
    :vars
    (
      ?AUTO_2071 - BLOCK
      ?AUTO_2070 - BLOCK
      ?AUTO_2073 - BLOCK
      ?AUTO_2072 - BLOCK
      ?AUTO_2069 - BLOCK
      ?AUTO_2074 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2067 ?AUTO_2068 ) ) ( ON-TABLE ?AUTO_2067 ) ( not ( = ?AUTO_2067 ?AUTO_2071 ) ) ( not ( = ?AUTO_2067 ?AUTO_2070 ) ) ( not ( = ?AUTO_2068 ?AUTO_2071 ) ) ( not ( = ?AUTO_2068 ?AUTO_2070 ) ) ( not ( = ?AUTO_2071 ?AUTO_2070 ) ) ( ON ?AUTO_2071 ?AUTO_2068 ) ( not ( = ?AUTO_2067 ?AUTO_2073 ) ) ( not ( = ?AUTO_2067 ?AUTO_2072 ) ) ( not ( = ?AUTO_2068 ?AUTO_2073 ) ) ( not ( = ?AUTO_2068 ?AUTO_2072 ) ) ( not ( = ?AUTO_2070 ?AUTO_2073 ) ) ( not ( = ?AUTO_2070 ?AUTO_2072 ) ) ( not ( = ?AUTO_2071 ?AUTO_2073 ) ) ( not ( = ?AUTO_2071 ?AUTO_2072 ) ) ( not ( = ?AUTO_2073 ?AUTO_2072 ) ) ( ON ?AUTO_2073 ?AUTO_2071 ) ( not ( = ?AUTO_2067 ?AUTO_2069 ) ) ( not ( = ?AUTO_2068 ?AUTO_2069 ) ) ( not ( = ?AUTO_2070 ?AUTO_2069 ) ) ( not ( = ?AUTO_2071 ?AUTO_2069 ) ) ( not ( = ?AUTO_2072 ?AUTO_2069 ) ) ( not ( = ?AUTO_2073 ?AUTO_2069 ) ) ( ON ?AUTO_2069 ?AUTO_2073 ) ( CLEAR ?AUTO_2069 ) ( ON ?AUTO_2070 ?AUTO_2067 ) ( ON ?AUTO_2072 ?AUTO_2070 ) ( CLEAR ?AUTO_2072 ) ( HOLDING ?AUTO_2074 ) ( not ( = ?AUTO_2067 ?AUTO_2074 ) ) ( not ( = ?AUTO_2068 ?AUTO_2074 ) ) ( not ( = ?AUTO_2071 ?AUTO_2074 ) ) ( not ( = ?AUTO_2070 ?AUTO_2074 ) ) ( not ( = ?AUTO_2073 ?AUTO_2074 ) ) ( not ( = ?AUTO_2072 ?AUTO_2074 ) ) ( not ( = ?AUTO_2069 ?AUTO_2074 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2074 )
      ( MAKE-ON ?AUTO_2067 ?AUTO_2068 )
      ( MAKE-ON-VERIFY ?AUTO_2067 ?AUTO_2068 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2075 - BLOCK
      ?AUTO_2076 - BLOCK
    )
    :vars
    (
      ?AUTO_2082 - BLOCK
      ?AUTO_2077 - BLOCK
      ?AUTO_2080 - BLOCK
      ?AUTO_2081 - BLOCK
      ?AUTO_2078 - BLOCK
      ?AUTO_2079 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2075 ?AUTO_2076 ) ) ( ON-TABLE ?AUTO_2075 ) ( not ( = ?AUTO_2075 ?AUTO_2082 ) ) ( not ( = ?AUTO_2075 ?AUTO_2077 ) ) ( not ( = ?AUTO_2076 ?AUTO_2082 ) ) ( not ( = ?AUTO_2076 ?AUTO_2077 ) ) ( not ( = ?AUTO_2082 ?AUTO_2077 ) ) ( ON ?AUTO_2082 ?AUTO_2076 ) ( not ( = ?AUTO_2075 ?AUTO_2080 ) ) ( not ( = ?AUTO_2075 ?AUTO_2081 ) ) ( not ( = ?AUTO_2076 ?AUTO_2080 ) ) ( not ( = ?AUTO_2076 ?AUTO_2081 ) ) ( not ( = ?AUTO_2077 ?AUTO_2080 ) ) ( not ( = ?AUTO_2077 ?AUTO_2081 ) ) ( not ( = ?AUTO_2082 ?AUTO_2080 ) ) ( not ( = ?AUTO_2082 ?AUTO_2081 ) ) ( not ( = ?AUTO_2080 ?AUTO_2081 ) ) ( ON ?AUTO_2080 ?AUTO_2082 ) ( not ( = ?AUTO_2075 ?AUTO_2078 ) ) ( not ( = ?AUTO_2076 ?AUTO_2078 ) ) ( not ( = ?AUTO_2077 ?AUTO_2078 ) ) ( not ( = ?AUTO_2082 ?AUTO_2078 ) ) ( not ( = ?AUTO_2081 ?AUTO_2078 ) ) ( not ( = ?AUTO_2080 ?AUTO_2078 ) ) ( ON ?AUTO_2078 ?AUTO_2080 ) ( ON ?AUTO_2077 ?AUTO_2075 ) ( ON ?AUTO_2081 ?AUTO_2077 ) ( CLEAR ?AUTO_2081 ) ( not ( = ?AUTO_2075 ?AUTO_2079 ) ) ( not ( = ?AUTO_2076 ?AUTO_2079 ) ) ( not ( = ?AUTO_2082 ?AUTO_2079 ) ) ( not ( = ?AUTO_2077 ?AUTO_2079 ) ) ( not ( = ?AUTO_2080 ?AUTO_2079 ) ) ( not ( = ?AUTO_2081 ?AUTO_2079 ) ) ( not ( = ?AUTO_2078 ?AUTO_2079 ) ) ( ON ?AUTO_2079 ?AUTO_2078 ) ( CLEAR ?AUTO_2079 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2079 ?AUTO_2078 )
      ( MAKE-ON ?AUTO_2075 ?AUTO_2076 )
      ( MAKE-ON-VERIFY ?AUTO_2075 ?AUTO_2076 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2084 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2084 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2084 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2084 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2085 - BLOCK
    )
    :vars
    (
      ?AUTO_2086 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2085 ?AUTO_2086 ) ( CLEAR ?AUTO_2085 ) ( HAND-EMPTY ) ( not ( = ?AUTO_2085 ?AUTO_2086 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2085 ?AUTO_2086 )
      ( MAKE-ON-TABLE ?AUTO_2085 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2085 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2087 - BLOCK
    )
    :vars
    (
      ?AUTO_2088 - BLOCK
      ?AUTO_2089 - BLOCK
      ?AUTO_2090 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2087 ?AUTO_2088 ) ( CLEAR ?AUTO_2087 ) ( not ( = ?AUTO_2087 ?AUTO_2088 ) ) ( HOLDING ?AUTO_2089 ) ( CLEAR ?AUTO_2090 ) ( not ( = ?AUTO_2087 ?AUTO_2089 ) ) ( not ( = ?AUTO_2087 ?AUTO_2090 ) ) ( not ( = ?AUTO_2088 ?AUTO_2089 ) ) ( not ( = ?AUTO_2088 ?AUTO_2090 ) ) ( not ( = ?AUTO_2089 ?AUTO_2090 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2089 ?AUTO_2090 )
      ( MAKE-ON-TABLE ?AUTO_2087 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2087 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2097 - BLOCK
    )
    :vars
    (
      ?AUTO_2098 - BLOCK
      ?AUTO_2100 - BLOCK
      ?AUTO_2099 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2097 ?AUTO_2098 ) ( not ( = ?AUTO_2097 ?AUTO_2098 ) ) ( CLEAR ?AUTO_2100 ) ( not ( = ?AUTO_2097 ?AUTO_2099 ) ) ( not ( = ?AUTO_2097 ?AUTO_2100 ) ) ( not ( = ?AUTO_2098 ?AUTO_2099 ) ) ( not ( = ?AUTO_2098 ?AUTO_2100 ) ) ( not ( = ?AUTO_2099 ?AUTO_2100 ) ) ( ON ?AUTO_2099 ?AUTO_2097 ) ( CLEAR ?AUTO_2099 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2099 ?AUTO_2097 )
      ( MAKE-ON-TABLE ?AUTO_2097 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2097 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2101 - BLOCK
    )
    :vars
    (
      ?AUTO_2103 - BLOCK
      ?AUTO_2104 - BLOCK
      ?AUTO_2102 - BLOCK
      ?AUTO_2105 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2101 ?AUTO_2103 ) ( not ( = ?AUTO_2101 ?AUTO_2103 ) ) ( CLEAR ?AUTO_2104 ) ( not ( = ?AUTO_2101 ?AUTO_2102 ) ) ( not ( = ?AUTO_2101 ?AUTO_2104 ) ) ( not ( = ?AUTO_2103 ?AUTO_2102 ) ) ( not ( = ?AUTO_2103 ?AUTO_2104 ) ) ( not ( = ?AUTO_2102 ?AUTO_2104 ) ) ( ON ?AUTO_2102 ?AUTO_2101 ) ( CLEAR ?AUTO_2102 ) ( HOLDING ?AUTO_2105 ) ( not ( = ?AUTO_2101 ?AUTO_2105 ) ) ( not ( = ?AUTO_2103 ?AUTO_2105 ) ) ( not ( = ?AUTO_2104 ?AUTO_2105 ) ) ( not ( = ?AUTO_2102 ?AUTO_2105 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2105 )
      ( MAKE-ON-TABLE ?AUTO_2101 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2101 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2110 - BLOCK
    )
    :vars
    (
      ?AUTO_2112 - BLOCK
      ?AUTO_2113 - BLOCK
      ?AUTO_2111 - BLOCK
      ?AUTO_2114 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2110 ?AUTO_2112 ) ( not ( = ?AUTO_2110 ?AUTO_2112 ) ) ( CLEAR ?AUTO_2113 ) ( not ( = ?AUTO_2110 ?AUTO_2111 ) ) ( not ( = ?AUTO_2110 ?AUTO_2113 ) ) ( not ( = ?AUTO_2112 ?AUTO_2111 ) ) ( not ( = ?AUTO_2112 ?AUTO_2113 ) ) ( not ( = ?AUTO_2111 ?AUTO_2113 ) ) ( ON ?AUTO_2111 ?AUTO_2110 ) ( not ( = ?AUTO_2110 ?AUTO_2114 ) ) ( not ( = ?AUTO_2112 ?AUTO_2114 ) ) ( not ( = ?AUTO_2113 ?AUTO_2114 ) ) ( not ( = ?AUTO_2111 ?AUTO_2114 ) ) ( ON ?AUTO_2114 ?AUTO_2111 ) ( CLEAR ?AUTO_2114 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2114 ?AUTO_2111 )
      ( MAKE-ON-TABLE ?AUTO_2110 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2110 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2117 - BLOCK
      ?AUTO_2118 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2117 ) ( CLEAR ?AUTO_2118 ) ( not ( = ?AUTO_2117 ?AUTO_2118 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2117 ?AUTO_2118 )
      ( MAKE-ON-VERIFY ?AUTO_2117 ?AUTO_2118 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2119 - BLOCK
      ?AUTO_2120 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2120 ) ( not ( = ?AUTO_2119 ?AUTO_2120 ) ) ( ON-TABLE ?AUTO_2119 ) ( CLEAR ?AUTO_2119 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_2119 )
      ( MAKE-ON ?AUTO_2119 ?AUTO_2120 )
      ( MAKE-ON-VERIFY ?AUTO_2119 ?AUTO_2120 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2121 - BLOCK
      ?AUTO_2122 - BLOCK
    )
    :vars
    (
      ?AUTO_2123 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2122 ) ( not ( = ?AUTO_2121 ?AUTO_2122 ) ) ( ON-TABLE ?AUTO_2121 ) ( CLEAR ?AUTO_2121 ) ( HOLDING ?AUTO_2123 ) ( not ( = ?AUTO_2121 ?AUTO_2123 ) ) ( not ( = ?AUTO_2122 ?AUTO_2123 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2123 )
      ( MAKE-ON ?AUTO_2121 ?AUTO_2122 )
      ( MAKE-ON-VERIFY ?AUTO_2121 ?AUTO_2122 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2124 - BLOCK
      ?AUTO_2125 - BLOCK
    )
    :vars
    (
      ?AUTO_2126 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2125 ) ( not ( = ?AUTO_2124 ?AUTO_2125 ) ) ( ON-TABLE ?AUTO_2124 ) ( not ( = ?AUTO_2124 ?AUTO_2126 ) ) ( not ( = ?AUTO_2125 ?AUTO_2126 ) ) ( ON ?AUTO_2126 ?AUTO_2124 ) ( CLEAR ?AUTO_2126 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2126 ?AUTO_2124 )
      ( MAKE-ON ?AUTO_2124 ?AUTO_2125 )
      ( MAKE-ON-VERIFY ?AUTO_2124 ?AUTO_2125 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2127 - BLOCK
      ?AUTO_2128 - BLOCK
    )
    :vars
    (
      ?AUTO_2129 - BLOCK
      ?AUTO_2130 - BLOCK
      ?AUTO_2131 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2128 ) ( not ( = ?AUTO_2127 ?AUTO_2128 ) ) ( ON-TABLE ?AUTO_2127 ) ( not ( = ?AUTO_2127 ?AUTO_2129 ) ) ( not ( = ?AUTO_2128 ?AUTO_2129 ) ) ( ON ?AUTO_2129 ?AUTO_2127 ) ( CLEAR ?AUTO_2129 ) ( HOLDING ?AUTO_2130 ) ( CLEAR ?AUTO_2131 ) ( not ( = ?AUTO_2127 ?AUTO_2130 ) ) ( not ( = ?AUTO_2127 ?AUTO_2131 ) ) ( not ( = ?AUTO_2128 ?AUTO_2130 ) ) ( not ( = ?AUTO_2128 ?AUTO_2131 ) ) ( not ( = ?AUTO_2129 ?AUTO_2130 ) ) ( not ( = ?AUTO_2129 ?AUTO_2131 ) ) ( not ( = ?AUTO_2130 ?AUTO_2131 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2130 ?AUTO_2131 )
      ( MAKE-ON ?AUTO_2127 ?AUTO_2128 )
      ( MAKE-ON-VERIFY ?AUTO_2127 ?AUTO_2128 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2134 - BLOCK
      ?AUTO_2135 - BLOCK
    )
    :vars
    (
      ?AUTO_2136 - BLOCK
      ?AUTO_2137 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2134 ?AUTO_2135 ) ) ( ON-TABLE ?AUTO_2134 ) ( not ( = ?AUTO_2134 ?AUTO_2136 ) ) ( not ( = ?AUTO_2135 ?AUTO_2136 ) ) ( ON ?AUTO_2136 ?AUTO_2134 ) ( CLEAR ?AUTO_2136 ) ( HOLDING ?AUTO_2135 ) ( CLEAR ?AUTO_2137 ) ( not ( = ?AUTO_2134 ?AUTO_2137 ) ) ( not ( = ?AUTO_2135 ?AUTO_2137 ) ) ( not ( = ?AUTO_2136 ?AUTO_2137 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2135 ?AUTO_2137 )
      ( MAKE-ON ?AUTO_2134 ?AUTO_2135 )
      ( MAKE-ON-VERIFY ?AUTO_2134 ?AUTO_2135 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2152 - BLOCK
      ?AUTO_2153 - BLOCK
    )
    :vars
    (
      ?AUTO_2156 - BLOCK
      ?AUTO_2157 - BLOCK
      ?AUTO_2155 - BLOCK
      ?AUTO_2154 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2152 ?AUTO_2153 ) ) ( CLEAR ?AUTO_2156 ) ( not ( = ?AUTO_2152 ?AUTO_2157 ) ) ( not ( = ?AUTO_2152 ?AUTO_2156 ) ) ( not ( = ?AUTO_2153 ?AUTO_2157 ) ) ( not ( = ?AUTO_2153 ?AUTO_2156 ) ) ( not ( = ?AUTO_2157 ?AUTO_2156 ) ) ( ON ?AUTO_2157 ?AUTO_2153 ) ( CLEAR ?AUTO_2155 ) ( not ( = ?AUTO_2152 ?AUTO_2154 ) ) ( not ( = ?AUTO_2152 ?AUTO_2155 ) ) ( not ( = ?AUTO_2153 ?AUTO_2154 ) ) ( not ( = ?AUTO_2153 ?AUTO_2155 ) ) ( not ( = ?AUTO_2156 ?AUTO_2154 ) ) ( not ( = ?AUTO_2156 ?AUTO_2155 ) ) ( not ( = ?AUTO_2157 ?AUTO_2154 ) ) ( not ( = ?AUTO_2157 ?AUTO_2155 ) ) ( not ( = ?AUTO_2154 ?AUTO_2155 ) ) ( ON ?AUTO_2154 ?AUTO_2157 ) ( CLEAR ?AUTO_2154 ) ( HOLDING ?AUTO_2152 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2152 )
      ( MAKE-ON ?AUTO_2152 ?AUTO_2153 )
      ( MAKE-ON-VERIFY ?AUTO_2152 ?AUTO_2153 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2158 - BLOCK
      ?AUTO_2159 - BLOCK
    )
    :vars
    (
      ?AUTO_2163 - BLOCK
      ?AUTO_2160 - BLOCK
      ?AUTO_2162 - BLOCK
      ?AUTO_2161 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2158 ?AUTO_2159 ) ) ( not ( = ?AUTO_2158 ?AUTO_2163 ) ) ( not ( = ?AUTO_2158 ?AUTO_2160 ) ) ( not ( = ?AUTO_2159 ?AUTO_2163 ) ) ( not ( = ?AUTO_2159 ?AUTO_2160 ) ) ( not ( = ?AUTO_2163 ?AUTO_2160 ) ) ( ON ?AUTO_2163 ?AUTO_2159 ) ( CLEAR ?AUTO_2162 ) ( not ( = ?AUTO_2158 ?AUTO_2161 ) ) ( not ( = ?AUTO_2158 ?AUTO_2162 ) ) ( not ( = ?AUTO_2159 ?AUTO_2161 ) ) ( not ( = ?AUTO_2159 ?AUTO_2162 ) ) ( not ( = ?AUTO_2160 ?AUTO_2161 ) ) ( not ( = ?AUTO_2160 ?AUTO_2162 ) ) ( not ( = ?AUTO_2163 ?AUTO_2161 ) ) ( not ( = ?AUTO_2163 ?AUTO_2162 ) ) ( not ( = ?AUTO_2161 ?AUTO_2162 ) ) ( ON ?AUTO_2161 ?AUTO_2163 ) ( CLEAR ?AUTO_2161 ) ( ON ?AUTO_2158 ?AUTO_2160 ) ( CLEAR ?AUTO_2158 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2158 ?AUTO_2160 )
      ( MAKE-ON ?AUTO_2158 ?AUTO_2159 )
      ( MAKE-ON-VERIFY ?AUTO_2158 ?AUTO_2159 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2164 - BLOCK
      ?AUTO_2165 - BLOCK
    )
    :vars
    (
      ?AUTO_2169 - BLOCK
      ?AUTO_2167 - BLOCK
      ?AUTO_2166 - BLOCK
      ?AUTO_2168 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2164 ?AUTO_2165 ) ) ( not ( = ?AUTO_2164 ?AUTO_2169 ) ) ( not ( = ?AUTO_2164 ?AUTO_2167 ) ) ( not ( = ?AUTO_2165 ?AUTO_2169 ) ) ( not ( = ?AUTO_2165 ?AUTO_2167 ) ) ( not ( = ?AUTO_2169 ?AUTO_2167 ) ) ( ON ?AUTO_2169 ?AUTO_2165 ) ( not ( = ?AUTO_2164 ?AUTO_2166 ) ) ( not ( = ?AUTO_2164 ?AUTO_2168 ) ) ( not ( = ?AUTO_2165 ?AUTO_2166 ) ) ( not ( = ?AUTO_2165 ?AUTO_2168 ) ) ( not ( = ?AUTO_2167 ?AUTO_2166 ) ) ( not ( = ?AUTO_2167 ?AUTO_2168 ) ) ( not ( = ?AUTO_2169 ?AUTO_2166 ) ) ( not ( = ?AUTO_2169 ?AUTO_2168 ) ) ( not ( = ?AUTO_2166 ?AUTO_2168 ) ) ( ON ?AUTO_2166 ?AUTO_2169 ) ( CLEAR ?AUTO_2166 ) ( ON ?AUTO_2164 ?AUTO_2167 ) ( CLEAR ?AUTO_2164 ) ( HOLDING ?AUTO_2168 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2168 )
      ( MAKE-ON ?AUTO_2164 ?AUTO_2165 )
      ( MAKE-ON-VERIFY ?AUTO_2164 ?AUTO_2165 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2170 - BLOCK
      ?AUTO_2171 - BLOCK
    )
    :vars
    (
      ?AUTO_2175 - BLOCK
      ?AUTO_2172 - BLOCK
      ?AUTO_2173 - BLOCK
      ?AUTO_2174 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2170 ?AUTO_2171 ) ) ( not ( = ?AUTO_2170 ?AUTO_2175 ) ) ( not ( = ?AUTO_2170 ?AUTO_2172 ) ) ( not ( = ?AUTO_2171 ?AUTO_2175 ) ) ( not ( = ?AUTO_2171 ?AUTO_2172 ) ) ( not ( = ?AUTO_2175 ?AUTO_2172 ) ) ( ON ?AUTO_2175 ?AUTO_2171 ) ( not ( = ?AUTO_2170 ?AUTO_2173 ) ) ( not ( = ?AUTO_2170 ?AUTO_2174 ) ) ( not ( = ?AUTO_2171 ?AUTO_2173 ) ) ( not ( = ?AUTO_2171 ?AUTO_2174 ) ) ( not ( = ?AUTO_2172 ?AUTO_2173 ) ) ( not ( = ?AUTO_2172 ?AUTO_2174 ) ) ( not ( = ?AUTO_2175 ?AUTO_2173 ) ) ( not ( = ?AUTO_2175 ?AUTO_2174 ) ) ( not ( = ?AUTO_2173 ?AUTO_2174 ) ) ( ON ?AUTO_2173 ?AUTO_2175 ) ( ON ?AUTO_2170 ?AUTO_2172 ) ( CLEAR ?AUTO_2170 ) ( ON ?AUTO_2174 ?AUTO_2173 ) ( CLEAR ?AUTO_2174 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2174 ?AUTO_2173 )
      ( MAKE-ON ?AUTO_2170 ?AUTO_2171 )
      ( MAKE-ON-VERIFY ?AUTO_2170 ?AUTO_2171 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2178 - BLOCK
      ?AUTO_2179 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2178 ) ( CLEAR ?AUTO_2179 ) ( not ( = ?AUTO_2178 ?AUTO_2179 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2178 ?AUTO_2179 )
      ( MAKE-ON-VERIFY ?AUTO_2178 ?AUTO_2179 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2180 - BLOCK
      ?AUTO_2181 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2181 ) ( not ( = ?AUTO_2180 ?AUTO_2181 ) ) ( ON-TABLE ?AUTO_2180 ) ( CLEAR ?AUTO_2180 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_2180 )
      ( MAKE-ON ?AUTO_2180 ?AUTO_2181 )
      ( MAKE-ON-VERIFY ?AUTO_2180 ?AUTO_2181 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2182 - BLOCK
      ?AUTO_2183 - BLOCK
    )
    :vars
    (
      ?AUTO_2184 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2182 ?AUTO_2183 ) ) ( ON-TABLE ?AUTO_2182 ) ( CLEAR ?AUTO_2182 ) ( HOLDING ?AUTO_2183 ) ( CLEAR ?AUTO_2184 ) ( not ( = ?AUTO_2182 ?AUTO_2184 ) ) ( not ( = ?AUTO_2183 ?AUTO_2184 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2183 ?AUTO_2184 )
      ( MAKE-ON ?AUTO_2182 ?AUTO_2183 )
      ( MAKE-ON-VERIFY ?AUTO_2182 ?AUTO_2183 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2233 - BLOCK
      ?AUTO_2234 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2233 ) ( CLEAR ?AUTO_2234 ) ( not ( = ?AUTO_2233 ?AUTO_2234 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2233 ?AUTO_2234 )
      ( MAKE-ON-VERIFY ?AUTO_2233 ?AUTO_2234 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2235 - BLOCK
      ?AUTO_2236 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2236 ) ( not ( = ?AUTO_2235 ?AUTO_2236 ) ) ( ON-TABLE ?AUTO_2235 ) ( CLEAR ?AUTO_2235 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_2235 )
      ( MAKE-ON ?AUTO_2235 ?AUTO_2236 )
      ( MAKE-ON-VERIFY ?AUTO_2235 ?AUTO_2236 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2237 - BLOCK
      ?AUTO_2238 - BLOCK
    )
    :vars
    (
      ?AUTO_2239 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2237 ?AUTO_2238 ) ) ( ON-TABLE ?AUTO_2237 ) ( CLEAR ?AUTO_2237 ) ( HOLDING ?AUTO_2238 ) ( CLEAR ?AUTO_2239 ) ( not ( = ?AUTO_2237 ?AUTO_2239 ) ) ( not ( = ?AUTO_2238 ?AUTO_2239 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2238 ?AUTO_2239 )
      ( MAKE-ON ?AUTO_2237 ?AUTO_2238 )
      ( MAKE-ON-VERIFY ?AUTO_2237 ?AUTO_2238 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2242 - BLOCK
      ?AUTO_2243 - BLOCK
    )
    :vars
    (
      ?AUTO_2244 - BLOCK
      ?AUTO_2245 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2243 ) ( not ( = ?AUTO_2242 ?AUTO_2243 ) ) ( ON-TABLE ?AUTO_2242 ) ( CLEAR ?AUTO_2242 ) ( HOLDING ?AUTO_2244 ) ( CLEAR ?AUTO_2245 ) ( not ( = ?AUTO_2242 ?AUTO_2244 ) ) ( not ( = ?AUTO_2242 ?AUTO_2245 ) ) ( not ( = ?AUTO_2243 ?AUTO_2244 ) ) ( not ( = ?AUTO_2243 ?AUTO_2245 ) ) ( not ( = ?AUTO_2244 ?AUTO_2245 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2244 ?AUTO_2245 )
      ( MAKE-ON ?AUTO_2242 ?AUTO_2243 )
      ( MAKE-ON-VERIFY ?AUTO_2242 ?AUTO_2243 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2247 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2247 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2247 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2247 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2248 - BLOCK
    )
    :vars
    (
      ?AUTO_2249 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2248 ?AUTO_2249 ) ( CLEAR ?AUTO_2248 ) ( HAND-EMPTY ) ( not ( = ?AUTO_2248 ?AUTO_2249 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2248 ?AUTO_2249 )
      ( MAKE-ON-TABLE ?AUTO_2248 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2248 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2251 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2251 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2251 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2251 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2252 - BLOCK
    )
    :vars
    (
      ?AUTO_2253 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2252 ?AUTO_2253 ) ( CLEAR ?AUTO_2252 ) ( HAND-EMPTY ) ( not ( = ?AUTO_2252 ?AUTO_2253 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2252 ?AUTO_2253 )
      ( MAKE-ON-TABLE ?AUTO_2252 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2252 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2254 - BLOCK
    )
    :vars
    (
      ?AUTO_2255 - BLOCK
      ?AUTO_2256 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2254 ?AUTO_2255 ) ( CLEAR ?AUTO_2254 ) ( not ( = ?AUTO_2254 ?AUTO_2255 ) ) ( HOLDING ?AUTO_2256 ) ( not ( = ?AUTO_2254 ?AUTO_2256 ) ) ( not ( = ?AUTO_2255 ?AUTO_2256 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2256 )
      ( MAKE-ON-TABLE ?AUTO_2254 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2254 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2257 - BLOCK
    )
    :vars
    (
      ?AUTO_2258 - BLOCK
      ?AUTO_2259 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2257 ?AUTO_2258 ) ( not ( = ?AUTO_2257 ?AUTO_2258 ) ) ( not ( = ?AUTO_2257 ?AUTO_2259 ) ) ( not ( = ?AUTO_2258 ?AUTO_2259 ) ) ( ON ?AUTO_2259 ?AUTO_2257 ) ( CLEAR ?AUTO_2259 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2259 ?AUTO_2257 )
      ( MAKE-ON-TABLE ?AUTO_2257 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2257 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2261 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2261 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2261 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2261 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2262 - BLOCK
    )
    :vars
    (
      ?AUTO_2263 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2262 ?AUTO_2263 ) ( CLEAR ?AUTO_2262 ) ( HAND-EMPTY ) ( not ( = ?AUTO_2262 ?AUTO_2263 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2262 ?AUTO_2263 )
      ( MAKE-ON-TABLE ?AUTO_2262 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2262 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2264 - BLOCK
    )
    :vars
    (
      ?AUTO_2265 - BLOCK
      ?AUTO_2266 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2264 ?AUTO_2265 ) ( CLEAR ?AUTO_2264 ) ( not ( = ?AUTO_2264 ?AUTO_2265 ) ) ( HOLDING ?AUTO_2266 ) ( not ( = ?AUTO_2264 ?AUTO_2266 ) ) ( not ( = ?AUTO_2265 ?AUTO_2266 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2266 )
      ( MAKE-ON-TABLE ?AUTO_2264 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2264 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2267 - BLOCK
    )
    :vars
    (
      ?AUTO_2268 - BLOCK
      ?AUTO_2269 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2267 ?AUTO_2268 ) ( not ( = ?AUTO_2267 ?AUTO_2268 ) ) ( not ( = ?AUTO_2267 ?AUTO_2269 ) ) ( not ( = ?AUTO_2268 ?AUTO_2269 ) ) ( ON ?AUTO_2269 ?AUTO_2267 ) ( CLEAR ?AUTO_2269 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2269 ?AUTO_2267 )
      ( MAKE-ON-TABLE ?AUTO_2267 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2267 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2270 - BLOCK
    )
    :vars
    (
      ?AUTO_2271 - BLOCK
      ?AUTO_2272 - BLOCK
      ?AUTO_2273 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2270 ?AUTO_2271 ) ( not ( = ?AUTO_2270 ?AUTO_2271 ) ) ( not ( = ?AUTO_2270 ?AUTO_2272 ) ) ( not ( = ?AUTO_2271 ?AUTO_2272 ) ) ( ON ?AUTO_2272 ?AUTO_2270 ) ( CLEAR ?AUTO_2272 ) ( HOLDING ?AUTO_2273 ) ( not ( = ?AUTO_2270 ?AUTO_2273 ) ) ( not ( = ?AUTO_2271 ?AUTO_2273 ) ) ( not ( = ?AUTO_2272 ?AUTO_2273 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2273 )
      ( MAKE-ON-TABLE ?AUTO_2270 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2270 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2274 - BLOCK
    )
    :vars
    (
      ?AUTO_2275 - BLOCK
      ?AUTO_2276 - BLOCK
      ?AUTO_2277 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2274 ?AUTO_2275 ) ( not ( = ?AUTO_2274 ?AUTO_2275 ) ) ( not ( = ?AUTO_2274 ?AUTO_2276 ) ) ( not ( = ?AUTO_2275 ?AUTO_2276 ) ) ( ON ?AUTO_2276 ?AUTO_2274 ) ( not ( = ?AUTO_2274 ?AUTO_2277 ) ) ( not ( = ?AUTO_2275 ?AUTO_2277 ) ) ( not ( = ?AUTO_2276 ?AUTO_2277 ) ) ( ON ?AUTO_2277 ?AUTO_2276 ) ( CLEAR ?AUTO_2277 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2277 ?AUTO_2276 )
      ( MAKE-ON-TABLE ?AUTO_2274 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2274 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2280 - BLOCK
      ?AUTO_2281 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2280 ) ( CLEAR ?AUTO_2281 ) ( not ( = ?AUTO_2280 ?AUTO_2281 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2280 ?AUTO_2281 )
      ( MAKE-ON-VERIFY ?AUTO_2280 ?AUTO_2281 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2282 - BLOCK
      ?AUTO_2283 - BLOCK
    )
    :vars
    (
      ?AUTO_2284 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2283 ) ( not ( = ?AUTO_2282 ?AUTO_2283 ) ) ( ON ?AUTO_2282 ?AUTO_2284 ) ( CLEAR ?AUTO_2282 ) ( HAND-EMPTY ) ( not ( = ?AUTO_2282 ?AUTO_2284 ) ) ( not ( = ?AUTO_2283 ?AUTO_2284 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2282 ?AUTO_2284 )
      ( MAKE-ON ?AUTO_2282 ?AUTO_2283 )
      ( MAKE-ON-VERIFY ?AUTO_2282 ?AUTO_2283 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2285 - BLOCK
      ?AUTO_2286 - BLOCK
    )
    :vars
    (
      ?AUTO_2287 - BLOCK
      ?AUTO_2288 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2286 ) ( not ( = ?AUTO_2285 ?AUTO_2286 ) ) ( ON ?AUTO_2285 ?AUTO_2287 ) ( CLEAR ?AUTO_2285 ) ( not ( = ?AUTO_2285 ?AUTO_2287 ) ) ( not ( = ?AUTO_2286 ?AUTO_2287 ) ) ( HOLDING ?AUTO_2288 ) ( not ( = ?AUTO_2285 ?AUTO_2288 ) ) ( not ( = ?AUTO_2286 ?AUTO_2288 ) ) ( not ( = ?AUTO_2287 ?AUTO_2288 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2288 )
      ( MAKE-ON ?AUTO_2285 ?AUTO_2286 )
      ( MAKE-ON-VERIFY ?AUTO_2285 ?AUTO_2286 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2289 - BLOCK
      ?AUTO_2290 - BLOCK
    )
    :vars
    (
      ?AUTO_2291 - BLOCK
      ?AUTO_2292 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2289 ?AUTO_2290 ) ) ( ON ?AUTO_2289 ?AUTO_2291 ) ( CLEAR ?AUTO_2289 ) ( not ( = ?AUTO_2289 ?AUTO_2291 ) ) ( not ( = ?AUTO_2290 ?AUTO_2291 ) ) ( not ( = ?AUTO_2289 ?AUTO_2292 ) ) ( not ( = ?AUTO_2290 ?AUTO_2292 ) ) ( not ( = ?AUTO_2291 ?AUTO_2292 ) ) ( ON ?AUTO_2292 ?AUTO_2290 ) ( CLEAR ?AUTO_2292 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2292 ?AUTO_2290 )
      ( MAKE-ON ?AUTO_2289 ?AUTO_2290 )
      ( MAKE-ON-VERIFY ?AUTO_2289 ?AUTO_2290 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2293 - BLOCK
      ?AUTO_2294 - BLOCK
    )
    :vars
    (
      ?AUTO_2295 - BLOCK
      ?AUTO_2296 - BLOCK
      ?AUTO_2297 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2293 ?AUTO_2294 ) ) ( ON ?AUTO_2293 ?AUTO_2295 ) ( CLEAR ?AUTO_2293 ) ( not ( = ?AUTO_2293 ?AUTO_2295 ) ) ( not ( = ?AUTO_2294 ?AUTO_2295 ) ) ( not ( = ?AUTO_2293 ?AUTO_2296 ) ) ( not ( = ?AUTO_2294 ?AUTO_2296 ) ) ( not ( = ?AUTO_2295 ?AUTO_2296 ) ) ( ON ?AUTO_2296 ?AUTO_2294 ) ( CLEAR ?AUTO_2296 ) ( HOLDING ?AUTO_2297 ) ( not ( = ?AUTO_2293 ?AUTO_2297 ) ) ( not ( = ?AUTO_2294 ?AUTO_2297 ) ) ( not ( = ?AUTO_2295 ?AUTO_2297 ) ) ( not ( = ?AUTO_2296 ?AUTO_2297 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2297 )
      ( MAKE-ON ?AUTO_2293 ?AUTO_2294 )
      ( MAKE-ON-VERIFY ?AUTO_2293 ?AUTO_2294 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2298 - BLOCK
      ?AUTO_2299 - BLOCK
    )
    :vars
    (
      ?AUTO_2300 - BLOCK
      ?AUTO_2301 - BLOCK
      ?AUTO_2302 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2298 ?AUTO_2299 ) ) ( ON ?AUTO_2298 ?AUTO_2300 ) ( CLEAR ?AUTO_2298 ) ( not ( = ?AUTO_2298 ?AUTO_2300 ) ) ( not ( = ?AUTO_2299 ?AUTO_2300 ) ) ( not ( = ?AUTO_2298 ?AUTO_2301 ) ) ( not ( = ?AUTO_2299 ?AUTO_2301 ) ) ( not ( = ?AUTO_2300 ?AUTO_2301 ) ) ( ON ?AUTO_2301 ?AUTO_2299 ) ( not ( = ?AUTO_2298 ?AUTO_2302 ) ) ( not ( = ?AUTO_2299 ?AUTO_2302 ) ) ( not ( = ?AUTO_2300 ?AUTO_2302 ) ) ( not ( = ?AUTO_2301 ?AUTO_2302 ) ) ( ON ?AUTO_2302 ?AUTO_2301 ) ( CLEAR ?AUTO_2302 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2302 ?AUTO_2301 )
      ( MAKE-ON ?AUTO_2298 ?AUTO_2299 )
      ( MAKE-ON-VERIFY ?AUTO_2298 ?AUTO_2299 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2303 - BLOCK
      ?AUTO_2304 - BLOCK
    )
    :vars
    (
      ?AUTO_2305 - BLOCK
      ?AUTO_2306 - BLOCK
      ?AUTO_2307 - BLOCK
      ?AUTO_2308 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2303 ?AUTO_2304 ) ) ( ON ?AUTO_2303 ?AUTO_2305 ) ( CLEAR ?AUTO_2303 ) ( not ( = ?AUTO_2303 ?AUTO_2305 ) ) ( not ( = ?AUTO_2304 ?AUTO_2305 ) ) ( not ( = ?AUTO_2303 ?AUTO_2306 ) ) ( not ( = ?AUTO_2304 ?AUTO_2306 ) ) ( not ( = ?AUTO_2305 ?AUTO_2306 ) ) ( ON ?AUTO_2306 ?AUTO_2304 ) ( not ( = ?AUTO_2303 ?AUTO_2307 ) ) ( not ( = ?AUTO_2304 ?AUTO_2307 ) ) ( not ( = ?AUTO_2305 ?AUTO_2307 ) ) ( not ( = ?AUTO_2306 ?AUTO_2307 ) ) ( ON ?AUTO_2307 ?AUTO_2306 ) ( CLEAR ?AUTO_2307 ) ( HOLDING ?AUTO_2308 ) ( not ( = ?AUTO_2303 ?AUTO_2308 ) ) ( not ( = ?AUTO_2304 ?AUTO_2308 ) ) ( not ( = ?AUTO_2305 ?AUTO_2308 ) ) ( not ( = ?AUTO_2306 ?AUTO_2308 ) ) ( not ( = ?AUTO_2307 ?AUTO_2308 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2308 )
      ( MAKE-ON ?AUTO_2303 ?AUTO_2304 )
      ( MAKE-ON-VERIFY ?AUTO_2303 ?AUTO_2304 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2309 - BLOCK
      ?AUTO_2310 - BLOCK
    )
    :vars
    (
      ?AUTO_2312 - BLOCK
      ?AUTO_2311 - BLOCK
      ?AUTO_2314 - BLOCK
      ?AUTO_2313 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2309 ?AUTO_2310 ) ) ( ON ?AUTO_2309 ?AUTO_2312 ) ( CLEAR ?AUTO_2309 ) ( not ( = ?AUTO_2309 ?AUTO_2312 ) ) ( not ( = ?AUTO_2310 ?AUTO_2312 ) ) ( not ( = ?AUTO_2309 ?AUTO_2311 ) ) ( not ( = ?AUTO_2310 ?AUTO_2311 ) ) ( not ( = ?AUTO_2312 ?AUTO_2311 ) ) ( ON ?AUTO_2311 ?AUTO_2310 ) ( not ( = ?AUTO_2309 ?AUTO_2314 ) ) ( not ( = ?AUTO_2310 ?AUTO_2314 ) ) ( not ( = ?AUTO_2312 ?AUTO_2314 ) ) ( not ( = ?AUTO_2311 ?AUTO_2314 ) ) ( ON ?AUTO_2314 ?AUTO_2311 ) ( not ( = ?AUTO_2309 ?AUTO_2313 ) ) ( not ( = ?AUTO_2310 ?AUTO_2313 ) ) ( not ( = ?AUTO_2312 ?AUTO_2313 ) ) ( not ( = ?AUTO_2311 ?AUTO_2313 ) ) ( not ( = ?AUTO_2314 ?AUTO_2313 ) ) ( ON ?AUTO_2313 ?AUTO_2314 ) ( CLEAR ?AUTO_2313 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2313 ?AUTO_2314 )
      ( MAKE-ON ?AUTO_2309 ?AUTO_2310 )
      ( MAKE-ON-VERIFY ?AUTO_2309 ?AUTO_2310 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2316 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2316 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2316 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2316 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2317 - BLOCK
    )
    :vars
    (
      ?AUTO_2318 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2317 ?AUTO_2318 ) ( CLEAR ?AUTO_2317 ) ( HAND-EMPTY ) ( not ( = ?AUTO_2317 ?AUTO_2318 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2317 ?AUTO_2318 )
      ( MAKE-ON-TABLE ?AUTO_2317 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2317 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2319 - BLOCK
    )
    :vars
    (
      ?AUTO_2320 - BLOCK
      ?AUTO_2321 - BLOCK
      ?AUTO_2322 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2319 ?AUTO_2320 ) ( CLEAR ?AUTO_2319 ) ( not ( = ?AUTO_2319 ?AUTO_2320 ) ) ( HOLDING ?AUTO_2321 ) ( CLEAR ?AUTO_2322 ) ( not ( = ?AUTO_2319 ?AUTO_2321 ) ) ( not ( = ?AUTO_2319 ?AUTO_2322 ) ) ( not ( = ?AUTO_2320 ?AUTO_2321 ) ) ( not ( = ?AUTO_2320 ?AUTO_2322 ) ) ( not ( = ?AUTO_2321 ?AUTO_2322 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2321 ?AUTO_2322 )
      ( MAKE-ON-TABLE ?AUTO_2319 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2319 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2323 - BLOCK
    )
    :vars
    (
      ?AUTO_2324 - BLOCK
      ?AUTO_2326 - BLOCK
      ?AUTO_2325 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2323 ?AUTO_2324 ) ( not ( = ?AUTO_2323 ?AUTO_2324 ) ) ( CLEAR ?AUTO_2326 ) ( not ( = ?AUTO_2323 ?AUTO_2325 ) ) ( not ( = ?AUTO_2323 ?AUTO_2326 ) ) ( not ( = ?AUTO_2324 ?AUTO_2325 ) ) ( not ( = ?AUTO_2324 ?AUTO_2326 ) ) ( not ( = ?AUTO_2325 ?AUTO_2326 ) ) ( ON ?AUTO_2325 ?AUTO_2323 ) ( CLEAR ?AUTO_2325 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2325 ?AUTO_2323 )
      ( MAKE-ON-TABLE ?AUTO_2323 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2323 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2327 - BLOCK
    )
    :vars
    (
      ?AUTO_2328 - BLOCK
      ?AUTO_2330 - BLOCK
      ?AUTO_2329 - BLOCK
      ?AUTO_2331 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2327 ?AUTO_2328 ) ( not ( = ?AUTO_2327 ?AUTO_2328 ) ) ( CLEAR ?AUTO_2330 ) ( not ( = ?AUTO_2327 ?AUTO_2329 ) ) ( not ( = ?AUTO_2327 ?AUTO_2330 ) ) ( not ( = ?AUTO_2328 ?AUTO_2329 ) ) ( not ( = ?AUTO_2328 ?AUTO_2330 ) ) ( not ( = ?AUTO_2329 ?AUTO_2330 ) ) ( ON ?AUTO_2329 ?AUTO_2327 ) ( CLEAR ?AUTO_2329 ) ( HOLDING ?AUTO_2331 ) ( not ( = ?AUTO_2327 ?AUTO_2331 ) ) ( not ( = ?AUTO_2328 ?AUTO_2331 ) ) ( not ( = ?AUTO_2330 ?AUTO_2331 ) ) ( not ( = ?AUTO_2329 ?AUTO_2331 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2331 )
      ( MAKE-ON-TABLE ?AUTO_2327 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2327 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2338 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2338 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2338 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2338 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2339 - BLOCK
    )
    :vars
    (
      ?AUTO_2340 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2339 ?AUTO_2340 ) ( CLEAR ?AUTO_2339 ) ( HAND-EMPTY ) ( not ( = ?AUTO_2339 ?AUTO_2340 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2339 ?AUTO_2340 )
      ( MAKE-ON-TABLE ?AUTO_2339 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2339 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2341 - BLOCK
    )
    :vars
    (
      ?AUTO_2342 - BLOCK
      ?AUTO_2343 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2341 ?AUTO_2342 ) ( CLEAR ?AUTO_2341 ) ( not ( = ?AUTO_2341 ?AUTO_2342 ) ) ( HOLDING ?AUTO_2343 ) ( not ( = ?AUTO_2341 ?AUTO_2343 ) ) ( not ( = ?AUTO_2342 ?AUTO_2343 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2343 )
      ( MAKE-ON-TABLE ?AUTO_2341 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2341 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2344 - BLOCK
    )
    :vars
    (
      ?AUTO_2345 - BLOCK
      ?AUTO_2346 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2344 ?AUTO_2345 ) ( not ( = ?AUTO_2344 ?AUTO_2345 ) ) ( not ( = ?AUTO_2344 ?AUTO_2346 ) ) ( not ( = ?AUTO_2345 ?AUTO_2346 ) ) ( ON ?AUTO_2346 ?AUTO_2344 ) ( CLEAR ?AUTO_2346 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2346 ?AUTO_2344 )
      ( MAKE-ON-TABLE ?AUTO_2344 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2344 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2347 - BLOCK
    )
    :vars
    (
      ?AUTO_2348 - BLOCK
      ?AUTO_2349 - BLOCK
      ?AUTO_2350 - BLOCK
      ?AUTO_2351 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2347 ?AUTO_2348 ) ( not ( = ?AUTO_2347 ?AUTO_2348 ) ) ( not ( = ?AUTO_2347 ?AUTO_2349 ) ) ( not ( = ?AUTO_2348 ?AUTO_2349 ) ) ( ON ?AUTO_2349 ?AUTO_2347 ) ( CLEAR ?AUTO_2349 ) ( HOLDING ?AUTO_2350 ) ( CLEAR ?AUTO_2351 ) ( not ( = ?AUTO_2347 ?AUTO_2350 ) ) ( not ( = ?AUTO_2347 ?AUTO_2351 ) ) ( not ( = ?AUTO_2348 ?AUTO_2350 ) ) ( not ( = ?AUTO_2348 ?AUTO_2351 ) ) ( not ( = ?AUTO_2349 ?AUTO_2350 ) ) ( not ( = ?AUTO_2349 ?AUTO_2351 ) ) ( not ( = ?AUTO_2350 ?AUTO_2351 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2350 ?AUTO_2351 )
      ( MAKE-ON-TABLE ?AUTO_2347 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2347 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2352 - BLOCK
    )
    :vars
    (
      ?AUTO_2353 - BLOCK
      ?AUTO_2354 - BLOCK
      ?AUTO_2355 - BLOCK
      ?AUTO_2356 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2352 ?AUTO_2353 ) ( not ( = ?AUTO_2352 ?AUTO_2353 ) ) ( not ( = ?AUTO_2352 ?AUTO_2354 ) ) ( not ( = ?AUTO_2353 ?AUTO_2354 ) ) ( ON ?AUTO_2354 ?AUTO_2352 ) ( CLEAR ?AUTO_2355 ) ( not ( = ?AUTO_2352 ?AUTO_2356 ) ) ( not ( = ?AUTO_2352 ?AUTO_2355 ) ) ( not ( = ?AUTO_2353 ?AUTO_2356 ) ) ( not ( = ?AUTO_2353 ?AUTO_2355 ) ) ( not ( = ?AUTO_2354 ?AUTO_2356 ) ) ( not ( = ?AUTO_2354 ?AUTO_2355 ) ) ( not ( = ?AUTO_2356 ?AUTO_2355 ) ) ( ON ?AUTO_2356 ?AUTO_2354 ) ( CLEAR ?AUTO_2356 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2356 ?AUTO_2354 )
      ( MAKE-ON-TABLE ?AUTO_2352 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2352 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2357 - BLOCK
    )
    :vars
    (
      ?AUTO_2361 - BLOCK
      ?AUTO_2358 - BLOCK
      ?AUTO_2359 - BLOCK
      ?AUTO_2360 - BLOCK
      ?AUTO_2362 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2357 ?AUTO_2361 ) ( not ( = ?AUTO_2357 ?AUTO_2361 ) ) ( not ( = ?AUTO_2357 ?AUTO_2358 ) ) ( not ( = ?AUTO_2361 ?AUTO_2358 ) ) ( ON ?AUTO_2358 ?AUTO_2357 ) ( CLEAR ?AUTO_2359 ) ( not ( = ?AUTO_2357 ?AUTO_2360 ) ) ( not ( = ?AUTO_2357 ?AUTO_2359 ) ) ( not ( = ?AUTO_2361 ?AUTO_2360 ) ) ( not ( = ?AUTO_2361 ?AUTO_2359 ) ) ( not ( = ?AUTO_2358 ?AUTO_2360 ) ) ( not ( = ?AUTO_2358 ?AUTO_2359 ) ) ( not ( = ?AUTO_2360 ?AUTO_2359 ) ) ( ON ?AUTO_2360 ?AUTO_2358 ) ( CLEAR ?AUTO_2360 ) ( HOLDING ?AUTO_2362 ) ( not ( = ?AUTO_2357 ?AUTO_2362 ) ) ( not ( = ?AUTO_2361 ?AUTO_2362 ) ) ( not ( = ?AUTO_2358 ?AUTO_2362 ) ) ( not ( = ?AUTO_2359 ?AUTO_2362 ) ) ( not ( = ?AUTO_2360 ?AUTO_2362 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2362 )
      ( MAKE-ON-TABLE ?AUTO_2357 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2357 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2370 - BLOCK
      ?AUTO_2371 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2370 ) ( CLEAR ?AUTO_2371 ) ( not ( = ?AUTO_2370 ?AUTO_2371 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2370 ?AUTO_2371 )
      ( MAKE-ON-VERIFY ?AUTO_2370 ?AUTO_2371 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2372 - BLOCK
      ?AUTO_2373 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2373 ) ( not ( = ?AUTO_2372 ?AUTO_2373 ) ) ( ON-TABLE ?AUTO_2372 ) ( CLEAR ?AUTO_2372 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_2372 )
      ( MAKE-ON ?AUTO_2372 ?AUTO_2373 )
      ( MAKE-ON-VERIFY ?AUTO_2372 ?AUTO_2373 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2374 - BLOCK
      ?AUTO_2375 - BLOCK
    )
    :vars
    (
      ?AUTO_2376 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2375 ) ( not ( = ?AUTO_2374 ?AUTO_2375 ) ) ( ON-TABLE ?AUTO_2374 ) ( CLEAR ?AUTO_2374 ) ( HOLDING ?AUTO_2376 ) ( not ( = ?AUTO_2374 ?AUTO_2376 ) ) ( not ( = ?AUTO_2375 ?AUTO_2376 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2376 )
      ( MAKE-ON ?AUTO_2374 ?AUTO_2375 )
      ( MAKE-ON-VERIFY ?AUTO_2374 ?AUTO_2375 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2377 - BLOCK
      ?AUTO_2378 - BLOCK
    )
    :vars
    (
      ?AUTO_2379 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2377 ?AUTO_2378 ) ) ( ON-TABLE ?AUTO_2377 ) ( CLEAR ?AUTO_2377 ) ( not ( = ?AUTO_2377 ?AUTO_2379 ) ) ( not ( = ?AUTO_2378 ?AUTO_2379 ) ) ( ON ?AUTO_2379 ?AUTO_2378 ) ( CLEAR ?AUTO_2379 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2379 ?AUTO_2378 )
      ( MAKE-ON ?AUTO_2377 ?AUTO_2378 )
      ( MAKE-ON-VERIFY ?AUTO_2377 ?AUTO_2378 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2380 - BLOCK
      ?AUTO_2381 - BLOCK
    )
    :vars
    (
      ?AUTO_2382 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2380 ?AUTO_2381 ) ) ( not ( = ?AUTO_2380 ?AUTO_2382 ) ) ( not ( = ?AUTO_2381 ?AUTO_2382 ) ) ( ON ?AUTO_2382 ?AUTO_2381 ) ( CLEAR ?AUTO_2382 ) ( HOLDING ?AUTO_2380 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2380 )
      ( MAKE-ON ?AUTO_2380 ?AUTO_2381 )
      ( MAKE-ON-VERIFY ?AUTO_2380 ?AUTO_2381 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2383 - BLOCK
      ?AUTO_2384 - BLOCK
    )
    :vars
    (
      ?AUTO_2385 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2383 ?AUTO_2384 ) ) ( not ( = ?AUTO_2383 ?AUTO_2385 ) ) ( not ( = ?AUTO_2384 ?AUTO_2385 ) ) ( ON ?AUTO_2385 ?AUTO_2384 ) ( ON ?AUTO_2383 ?AUTO_2385 ) ( CLEAR ?AUTO_2383 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2383 ?AUTO_2385 )
      ( MAKE-ON ?AUTO_2383 ?AUTO_2384 )
      ( MAKE-ON-VERIFY ?AUTO_2383 ?AUTO_2384 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2386 - BLOCK
      ?AUTO_2387 - BLOCK
    )
    :vars
    (
      ?AUTO_2388 - BLOCK
      ?AUTO_2389 - BLOCK
      ?AUTO_2390 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2386 ?AUTO_2387 ) ) ( not ( = ?AUTO_2386 ?AUTO_2388 ) ) ( not ( = ?AUTO_2387 ?AUTO_2388 ) ) ( ON ?AUTO_2388 ?AUTO_2387 ) ( ON ?AUTO_2386 ?AUTO_2388 ) ( CLEAR ?AUTO_2386 ) ( HOLDING ?AUTO_2389 ) ( CLEAR ?AUTO_2390 ) ( not ( = ?AUTO_2386 ?AUTO_2389 ) ) ( not ( = ?AUTO_2386 ?AUTO_2390 ) ) ( not ( = ?AUTO_2387 ?AUTO_2389 ) ) ( not ( = ?AUTO_2387 ?AUTO_2390 ) ) ( not ( = ?AUTO_2388 ?AUTO_2389 ) ) ( not ( = ?AUTO_2388 ?AUTO_2390 ) ) ( not ( = ?AUTO_2389 ?AUTO_2390 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2389 ?AUTO_2390 )
      ( MAKE-ON ?AUTO_2386 ?AUTO_2387 )
      ( MAKE-ON-VERIFY ?AUTO_2386 ?AUTO_2387 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2391 - BLOCK
      ?AUTO_2392 - BLOCK
    )
    :vars
    (
      ?AUTO_2393 - BLOCK
      ?AUTO_2394 - BLOCK
      ?AUTO_2395 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2391 ?AUTO_2392 ) ) ( not ( = ?AUTO_2391 ?AUTO_2393 ) ) ( not ( = ?AUTO_2392 ?AUTO_2393 ) ) ( ON ?AUTO_2393 ?AUTO_2392 ) ( ON ?AUTO_2391 ?AUTO_2393 ) ( CLEAR ?AUTO_2394 ) ( not ( = ?AUTO_2391 ?AUTO_2395 ) ) ( not ( = ?AUTO_2391 ?AUTO_2394 ) ) ( not ( = ?AUTO_2392 ?AUTO_2395 ) ) ( not ( = ?AUTO_2392 ?AUTO_2394 ) ) ( not ( = ?AUTO_2393 ?AUTO_2395 ) ) ( not ( = ?AUTO_2393 ?AUTO_2394 ) ) ( not ( = ?AUTO_2395 ?AUTO_2394 ) ) ( ON ?AUTO_2395 ?AUTO_2391 ) ( CLEAR ?AUTO_2395 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2395 ?AUTO_2391 )
      ( MAKE-ON ?AUTO_2391 ?AUTO_2392 )
      ( MAKE-ON-VERIFY ?AUTO_2391 ?AUTO_2392 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2396 - BLOCK
      ?AUTO_2397 - BLOCK
    )
    :vars
    (
      ?AUTO_2400 - BLOCK
      ?AUTO_2399 - BLOCK
      ?AUTO_2398 - BLOCK
      ?AUTO_2401 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2396 ?AUTO_2397 ) ) ( not ( = ?AUTO_2396 ?AUTO_2400 ) ) ( not ( = ?AUTO_2397 ?AUTO_2400 ) ) ( ON ?AUTO_2400 ?AUTO_2397 ) ( ON ?AUTO_2396 ?AUTO_2400 ) ( CLEAR ?AUTO_2399 ) ( not ( = ?AUTO_2396 ?AUTO_2398 ) ) ( not ( = ?AUTO_2396 ?AUTO_2399 ) ) ( not ( = ?AUTO_2397 ?AUTO_2398 ) ) ( not ( = ?AUTO_2397 ?AUTO_2399 ) ) ( not ( = ?AUTO_2400 ?AUTO_2398 ) ) ( not ( = ?AUTO_2400 ?AUTO_2399 ) ) ( not ( = ?AUTO_2398 ?AUTO_2399 ) ) ( ON ?AUTO_2398 ?AUTO_2396 ) ( CLEAR ?AUTO_2398 ) ( HOLDING ?AUTO_2401 ) ( not ( = ?AUTO_2396 ?AUTO_2401 ) ) ( not ( = ?AUTO_2397 ?AUTO_2401 ) ) ( not ( = ?AUTO_2400 ?AUTO_2401 ) ) ( not ( = ?AUTO_2399 ?AUTO_2401 ) ) ( not ( = ?AUTO_2398 ?AUTO_2401 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2401 )
      ( MAKE-ON ?AUTO_2396 ?AUTO_2397 )
      ( MAKE-ON-VERIFY ?AUTO_2396 ?AUTO_2397 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2414 - BLOCK
      ?AUTO_2415 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2414 ) ( CLEAR ?AUTO_2415 ) ( not ( = ?AUTO_2414 ?AUTO_2415 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2414 ?AUTO_2415 )
      ( MAKE-ON-VERIFY ?AUTO_2414 ?AUTO_2415 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2416 - BLOCK
      ?AUTO_2417 - BLOCK
    )
    :vars
    (
      ?AUTO_2418 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2417 ) ( not ( = ?AUTO_2416 ?AUTO_2417 ) ) ( ON ?AUTO_2416 ?AUTO_2418 ) ( CLEAR ?AUTO_2416 ) ( HAND-EMPTY ) ( not ( = ?AUTO_2416 ?AUTO_2418 ) ) ( not ( = ?AUTO_2417 ?AUTO_2418 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2416 ?AUTO_2418 )
      ( MAKE-ON ?AUTO_2416 ?AUTO_2417 )
      ( MAKE-ON-VERIFY ?AUTO_2416 ?AUTO_2417 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2419 - BLOCK
      ?AUTO_2420 - BLOCK
    )
    :vars
    (
      ?AUTO_2421 - BLOCK
      ?AUTO_2422 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2419 ?AUTO_2420 ) ) ( ON ?AUTO_2419 ?AUTO_2421 ) ( CLEAR ?AUTO_2419 ) ( not ( = ?AUTO_2419 ?AUTO_2421 ) ) ( not ( = ?AUTO_2420 ?AUTO_2421 ) ) ( HOLDING ?AUTO_2420 ) ( CLEAR ?AUTO_2422 ) ( not ( = ?AUTO_2419 ?AUTO_2422 ) ) ( not ( = ?AUTO_2420 ?AUTO_2422 ) ) ( not ( = ?AUTO_2421 ?AUTO_2422 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2420 ?AUTO_2422 )
      ( MAKE-ON ?AUTO_2419 ?AUTO_2420 )
      ( MAKE-ON-VERIFY ?AUTO_2419 ?AUTO_2420 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2425 - BLOCK
      ?AUTO_2426 - BLOCK
    )
    :vars
    (
      ?AUTO_2427 - BLOCK
      ?AUTO_2428 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2426 ) ( not ( = ?AUTO_2425 ?AUTO_2426 ) ) ( ON ?AUTO_2425 ?AUTO_2427 ) ( CLEAR ?AUTO_2425 ) ( not ( = ?AUTO_2425 ?AUTO_2427 ) ) ( not ( = ?AUTO_2426 ?AUTO_2427 ) ) ( HOLDING ?AUTO_2428 ) ( not ( = ?AUTO_2425 ?AUTO_2428 ) ) ( not ( = ?AUTO_2426 ?AUTO_2428 ) ) ( not ( = ?AUTO_2427 ?AUTO_2428 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2428 )
      ( MAKE-ON ?AUTO_2425 ?AUTO_2426 )
      ( MAKE-ON-VERIFY ?AUTO_2425 ?AUTO_2426 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2470 - BLOCK
      ?AUTO_2471 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2470 ) ( CLEAR ?AUTO_2471 ) ( not ( = ?AUTO_2470 ?AUTO_2471 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2470 ?AUTO_2471 )
      ( MAKE-ON-VERIFY ?AUTO_2470 ?AUTO_2471 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2472 - BLOCK
      ?AUTO_2473 - BLOCK
    )
    :vars
    (
      ?AUTO_2474 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2473 ) ( not ( = ?AUTO_2472 ?AUTO_2473 ) ) ( ON ?AUTO_2472 ?AUTO_2474 ) ( CLEAR ?AUTO_2472 ) ( HAND-EMPTY ) ( not ( = ?AUTO_2472 ?AUTO_2474 ) ) ( not ( = ?AUTO_2473 ?AUTO_2474 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2472 ?AUTO_2474 )
      ( MAKE-ON ?AUTO_2472 ?AUTO_2473 )
      ( MAKE-ON-VERIFY ?AUTO_2472 ?AUTO_2473 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2475 - BLOCK
      ?AUTO_2476 - BLOCK
    )
    :vars
    (
      ?AUTO_2477 - BLOCK
      ?AUTO_2478 - BLOCK
      ?AUTO_2479 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2476 ) ( not ( = ?AUTO_2475 ?AUTO_2476 ) ) ( ON ?AUTO_2475 ?AUTO_2477 ) ( CLEAR ?AUTO_2475 ) ( not ( = ?AUTO_2475 ?AUTO_2477 ) ) ( not ( = ?AUTO_2476 ?AUTO_2477 ) ) ( HOLDING ?AUTO_2478 ) ( CLEAR ?AUTO_2479 ) ( not ( = ?AUTO_2475 ?AUTO_2478 ) ) ( not ( = ?AUTO_2475 ?AUTO_2479 ) ) ( not ( = ?AUTO_2476 ?AUTO_2478 ) ) ( not ( = ?AUTO_2476 ?AUTO_2479 ) ) ( not ( = ?AUTO_2477 ?AUTO_2478 ) ) ( not ( = ?AUTO_2477 ?AUTO_2479 ) ) ( not ( = ?AUTO_2478 ?AUTO_2479 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2478 ?AUTO_2479 )
      ( MAKE-ON ?AUTO_2475 ?AUTO_2476 )
      ( MAKE-ON-VERIFY ?AUTO_2475 ?AUTO_2476 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2480 - BLOCK
      ?AUTO_2481 - BLOCK
    )
    :vars
    (
      ?AUTO_2484 - BLOCK
      ?AUTO_2482 - BLOCK
      ?AUTO_2483 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2481 ) ( not ( = ?AUTO_2480 ?AUTO_2481 ) ) ( ON ?AUTO_2480 ?AUTO_2484 ) ( not ( = ?AUTO_2480 ?AUTO_2484 ) ) ( not ( = ?AUTO_2481 ?AUTO_2484 ) ) ( CLEAR ?AUTO_2482 ) ( not ( = ?AUTO_2480 ?AUTO_2483 ) ) ( not ( = ?AUTO_2480 ?AUTO_2482 ) ) ( not ( = ?AUTO_2481 ?AUTO_2483 ) ) ( not ( = ?AUTO_2481 ?AUTO_2482 ) ) ( not ( = ?AUTO_2484 ?AUTO_2483 ) ) ( not ( = ?AUTO_2484 ?AUTO_2482 ) ) ( not ( = ?AUTO_2483 ?AUTO_2482 ) ) ( ON ?AUTO_2483 ?AUTO_2480 ) ( CLEAR ?AUTO_2483 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2483 ?AUTO_2480 )
      ( MAKE-ON ?AUTO_2480 ?AUTO_2481 )
      ( MAKE-ON-VERIFY ?AUTO_2480 ?AUTO_2481 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2485 - BLOCK
      ?AUTO_2486 - BLOCK
    )
    :vars
    (
      ?AUTO_2487 - BLOCK
      ?AUTO_2488 - BLOCK
      ?AUTO_2489 - BLOCK
      ?AUTO_2490 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2486 ) ( not ( = ?AUTO_2485 ?AUTO_2486 ) ) ( ON ?AUTO_2485 ?AUTO_2487 ) ( not ( = ?AUTO_2485 ?AUTO_2487 ) ) ( not ( = ?AUTO_2486 ?AUTO_2487 ) ) ( not ( = ?AUTO_2485 ?AUTO_2488 ) ) ( not ( = ?AUTO_2485 ?AUTO_2489 ) ) ( not ( = ?AUTO_2486 ?AUTO_2488 ) ) ( not ( = ?AUTO_2486 ?AUTO_2489 ) ) ( not ( = ?AUTO_2487 ?AUTO_2488 ) ) ( not ( = ?AUTO_2487 ?AUTO_2489 ) ) ( not ( = ?AUTO_2488 ?AUTO_2489 ) ) ( ON ?AUTO_2488 ?AUTO_2485 ) ( CLEAR ?AUTO_2488 ) ( HOLDING ?AUTO_2489 ) ( CLEAR ?AUTO_2490 ) ( not ( = ?AUTO_2485 ?AUTO_2490 ) ) ( not ( = ?AUTO_2486 ?AUTO_2490 ) ) ( not ( = ?AUTO_2487 ?AUTO_2490 ) ) ( not ( = ?AUTO_2488 ?AUTO_2490 ) ) ( not ( = ?AUTO_2489 ?AUTO_2490 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2489 ?AUTO_2490 )
      ( MAKE-ON ?AUTO_2485 ?AUTO_2486 )
      ( MAKE-ON-VERIFY ?AUTO_2485 ?AUTO_2486 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2493 - BLOCK
      ?AUTO_2494 - BLOCK
    )
    :vars
    (
      ?AUTO_2496 - BLOCK
      ?AUTO_2497 - BLOCK
      ?AUTO_2495 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2493 ?AUTO_2494 ) ) ( ON ?AUTO_2493 ?AUTO_2496 ) ( not ( = ?AUTO_2493 ?AUTO_2496 ) ) ( not ( = ?AUTO_2494 ?AUTO_2496 ) ) ( CLEAR ?AUTO_2497 ) ( not ( = ?AUTO_2493 ?AUTO_2495 ) ) ( not ( = ?AUTO_2493 ?AUTO_2497 ) ) ( not ( = ?AUTO_2494 ?AUTO_2495 ) ) ( not ( = ?AUTO_2494 ?AUTO_2497 ) ) ( not ( = ?AUTO_2496 ?AUTO_2495 ) ) ( not ( = ?AUTO_2496 ?AUTO_2497 ) ) ( not ( = ?AUTO_2495 ?AUTO_2497 ) ) ( ON ?AUTO_2495 ?AUTO_2493 ) ( CLEAR ?AUTO_2495 ) ( HOLDING ?AUTO_2494 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2494 )
      ( MAKE-ON ?AUTO_2493 ?AUTO_2494 )
      ( MAKE-ON-VERIFY ?AUTO_2493 ?AUTO_2494 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2502 - BLOCK
      ?AUTO_2503 - BLOCK
    )
    :vars
    (
      ?AUTO_2507 - BLOCK
      ?AUTO_2506 - BLOCK
      ?AUTO_2505 - BLOCK
      ?AUTO_2504 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2502 ?AUTO_2503 ) ) ( ON ?AUTO_2502 ?AUTO_2507 ) ( not ( = ?AUTO_2502 ?AUTO_2507 ) ) ( not ( = ?AUTO_2503 ?AUTO_2507 ) ) ( not ( = ?AUTO_2502 ?AUTO_2506 ) ) ( not ( = ?AUTO_2502 ?AUTO_2505 ) ) ( not ( = ?AUTO_2503 ?AUTO_2506 ) ) ( not ( = ?AUTO_2503 ?AUTO_2505 ) ) ( not ( = ?AUTO_2507 ?AUTO_2506 ) ) ( not ( = ?AUTO_2507 ?AUTO_2505 ) ) ( not ( = ?AUTO_2506 ?AUTO_2505 ) ) ( ON ?AUTO_2506 ?AUTO_2502 ) ( CLEAR ?AUTO_2506 ) ( CLEAR ?AUTO_2504 ) ( not ( = ?AUTO_2502 ?AUTO_2504 ) ) ( not ( = ?AUTO_2503 ?AUTO_2504 ) ) ( not ( = ?AUTO_2507 ?AUTO_2504 ) ) ( not ( = ?AUTO_2506 ?AUTO_2504 ) ) ( not ( = ?AUTO_2505 ?AUTO_2504 ) ) ( ON ?AUTO_2505 ?AUTO_2503 ) ( CLEAR ?AUTO_2505 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2505 ?AUTO_2503 )
      ( MAKE-ON ?AUTO_2502 ?AUTO_2503 )
      ( MAKE-ON-VERIFY ?AUTO_2502 ?AUTO_2503 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2508 - BLOCK
      ?AUTO_2509 - BLOCK
    )
    :vars
    (
      ?AUTO_2510 - BLOCK
      ?AUTO_2513 - BLOCK
      ?AUTO_2512 - BLOCK
      ?AUTO_2511 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2508 ?AUTO_2509 ) ) ( ON ?AUTO_2508 ?AUTO_2510 ) ( not ( = ?AUTO_2508 ?AUTO_2510 ) ) ( not ( = ?AUTO_2509 ?AUTO_2510 ) ) ( not ( = ?AUTO_2508 ?AUTO_2513 ) ) ( not ( = ?AUTO_2508 ?AUTO_2512 ) ) ( not ( = ?AUTO_2509 ?AUTO_2513 ) ) ( not ( = ?AUTO_2509 ?AUTO_2512 ) ) ( not ( = ?AUTO_2510 ?AUTO_2513 ) ) ( not ( = ?AUTO_2510 ?AUTO_2512 ) ) ( not ( = ?AUTO_2513 ?AUTO_2512 ) ) ( CLEAR ?AUTO_2511 ) ( not ( = ?AUTO_2508 ?AUTO_2511 ) ) ( not ( = ?AUTO_2509 ?AUTO_2511 ) ) ( not ( = ?AUTO_2510 ?AUTO_2511 ) ) ( not ( = ?AUTO_2513 ?AUTO_2511 ) ) ( not ( = ?AUTO_2512 ?AUTO_2511 ) ) ( ON ?AUTO_2512 ?AUTO_2509 ) ( CLEAR ?AUTO_2512 ) ( HOLDING ?AUTO_2513 ) ( CLEAR ?AUTO_2508 ) )
    :subtasks
    ( ( !STACK ?AUTO_2513 ?AUTO_2508 )
      ( MAKE-ON ?AUTO_2508 ?AUTO_2509 )
      ( MAKE-ON-VERIFY ?AUTO_2508 ?AUTO_2509 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2514 - BLOCK
      ?AUTO_2515 - BLOCK
    )
    :vars
    (
      ?AUTO_2516 - BLOCK
      ?AUTO_2518 - BLOCK
      ?AUTO_2517 - BLOCK
      ?AUTO_2519 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2514 ?AUTO_2515 ) ) ( ON ?AUTO_2514 ?AUTO_2516 ) ( not ( = ?AUTO_2514 ?AUTO_2516 ) ) ( not ( = ?AUTO_2515 ?AUTO_2516 ) ) ( not ( = ?AUTO_2514 ?AUTO_2518 ) ) ( not ( = ?AUTO_2514 ?AUTO_2517 ) ) ( not ( = ?AUTO_2515 ?AUTO_2518 ) ) ( not ( = ?AUTO_2515 ?AUTO_2517 ) ) ( not ( = ?AUTO_2516 ?AUTO_2518 ) ) ( not ( = ?AUTO_2516 ?AUTO_2517 ) ) ( not ( = ?AUTO_2518 ?AUTO_2517 ) ) ( CLEAR ?AUTO_2519 ) ( not ( = ?AUTO_2514 ?AUTO_2519 ) ) ( not ( = ?AUTO_2515 ?AUTO_2519 ) ) ( not ( = ?AUTO_2516 ?AUTO_2519 ) ) ( not ( = ?AUTO_2518 ?AUTO_2519 ) ) ( not ( = ?AUTO_2517 ?AUTO_2519 ) ) ( ON ?AUTO_2517 ?AUTO_2515 ) ( CLEAR ?AUTO_2514 ) ( ON ?AUTO_2518 ?AUTO_2517 ) ( CLEAR ?AUTO_2518 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2518 ?AUTO_2517 )
      ( MAKE-ON ?AUTO_2514 ?AUTO_2515 )
      ( MAKE-ON-VERIFY ?AUTO_2514 ?AUTO_2515 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2520 - BLOCK
      ?AUTO_2521 - BLOCK
    )
    :vars
    (
      ?AUTO_2522 - BLOCK
      ?AUTO_2524 - BLOCK
      ?AUTO_2523 - BLOCK
      ?AUTO_2525 - BLOCK
      ?AUTO_2526 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2520 ?AUTO_2521 ) ) ( ON ?AUTO_2520 ?AUTO_2522 ) ( not ( = ?AUTO_2520 ?AUTO_2522 ) ) ( not ( = ?AUTO_2521 ?AUTO_2522 ) ) ( not ( = ?AUTO_2520 ?AUTO_2524 ) ) ( not ( = ?AUTO_2520 ?AUTO_2523 ) ) ( not ( = ?AUTO_2521 ?AUTO_2524 ) ) ( not ( = ?AUTO_2521 ?AUTO_2523 ) ) ( not ( = ?AUTO_2522 ?AUTO_2524 ) ) ( not ( = ?AUTO_2522 ?AUTO_2523 ) ) ( not ( = ?AUTO_2524 ?AUTO_2523 ) ) ( CLEAR ?AUTO_2525 ) ( not ( = ?AUTO_2520 ?AUTO_2525 ) ) ( not ( = ?AUTO_2521 ?AUTO_2525 ) ) ( not ( = ?AUTO_2522 ?AUTO_2525 ) ) ( not ( = ?AUTO_2524 ?AUTO_2525 ) ) ( not ( = ?AUTO_2523 ?AUTO_2525 ) ) ( ON ?AUTO_2523 ?AUTO_2521 ) ( CLEAR ?AUTO_2520 ) ( ON ?AUTO_2524 ?AUTO_2523 ) ( CLEAR ?AUTO_2524 ) ( HOLDING ?AUTO_2526 ) ( not ( = ?AUTO_2520 ?AUTO_2526 ) ) ( not ( = ?AUTO_2521 ?AUTO_2526 ) ) ( not ( = ?AUTO_2522 ?AUTO_2526 ) ) ( not ( = ?AUTO_2524 ?AUTO_2526 ) ) ( not ( = ?AUTO_2523 ?AUTO_2526 ) ) ( not ( = ?AUTO_2525 ?AUTO_2526 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2526 )
      ( MAKE-ON ?AUTO_2520 ?AUTO_2521 )
      ( MAKE-ON-VERIFY ?AUTO_2520 ?AUTO_2521 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2527 - BLOCK
      ?AUTO_2528 - BLOCK
    )
    :vars
    (
      ?AUTO_2529 - BLOCK
      ?AUTO_2530 - BLOCK
      ?AUTO_2531 - BLOCK
      ?AUTO_2533 - BLOCK
      ?AUTO_2532 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2527 ?AUTO_2528 ) ) ( ON ?AUTO_2527 ?AUTO_2529 ) ( not ( = ?AUTO_2527 ?AUTO_2529 ) ) ( not ( = ?AUTO_2528 ?AUTO_2529 ) ) ( not ( = ?AUTO_2527 ?AUTO_2530 ) ) ( not ( = ?AUTO_2527 ?AUTO_2531 ) ) ( not ( = ?AUTO_2528 ?AUTO_2530 ) ) ( not ( = ?AUTO_2528 ?AUTO_2531 ) ) ( not ( = ?AUTO_2529 ?AUTO_2530 ) ) ( not ( = ?AUTO_2529 ?AUTO_2531 ) ) ( not ( = ?AUTO_2530 ?AUTO_2531 ) ) ( CLEAR ?AUTO_2533 ) ( not ( = ?AUTO_2527 ?AUTO_2533 ) ) ( not ( = ?AUTO_2528 ?AUTO_2533 ) ) ( not ( = ?AUTO_2529 ?AUTO_2533 ) ) ( not ( = ?AUTO_2530 ?AUTO_2533 ) ) ( not ( = ?AUTO_2531 ?AUTO_2533 ) ) ( ON ?AUTO_2531 ?AUTO_2528 ) ( ON ?AUTO_2530 ?AUTO_2531 ) ( CLEAR ?AUTO_2530 ) ( not ( = ?AUTO_2527 ?AUTO_2532 ) ) ( not ( = ?AUTO_2528 ?AUTO_2532 ) ) ( not ( = ?AUTO_2529 ?AUTO_2532 ) ) ( not ( = ?AUTO_2530 ?AUTO_2532 ) ) ( not ( = ?AUTO_2531 ?AUTO_2532 ) ) ( not ( = ?AUTO_2533 ?AUTO_2532 ) ) ( ON ?AUTO_2532 ?AUTO_2527 ) ( CLEAR ?AUTO_2532 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2532 ?AUTO_2527 )
      ( MAKE-ON ?AUTO_2527 ?AUTO_2528 )
      ( MAKE-ON-VERIFY ?AUTO_2527 ?AUTO_2528 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2534 - BLOCK
      ?AUTO_2535 - BLOCK
    )
    :vars
    (
      ?AUTO_2539 - BLOCK
      ?AUTO_2536 - BLOCK
      ?AUTO_2538 - BLOCK
      ?AUTO_2540 - BLOCK
      ?AUTO_2537 - BLOCK
      ?AUTO_2541 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2534 ?AUTO_2535 ) ) ( ON ?AUTO_2534 ?AUTO_2539 ) ( not ( = ?AUTO_2534 ?AUTO_2539 ) ) ( not ( = ?AUTO_2535 ?AUTO_2539 ) ) ( not ( = ?AUTO_2534 ?AUTO_2536 ) ) ( not ( = ?AUTO_2534 ?AUTO_2538 ) ) ( not ( = ?AUTO_2535 ?AUTO_2536 ) ) ( not ( = ?AUTO_2535 ?AUTO_2538 ) ) ( not ( = ?AUTO_2539 ?AUTO_2536 ) ) ( not ( = ?AUTO_2539 ?AUTO_2538 ) ) ( not ( = ?AUTO_2536 ?AUTO_2538 ) ) ( CLEAR ?AUTO_2540 ) ( not ( = ?AUTO_2534 ?AUTO_2540 ) ) ( not ( = ?AUTO_2535 ?AUTO_2540 ) ) ( not ( = ?AUTO_2539 ?AUTO_2540 ) ) ( not ( = ?AUTO_2536 ?AUTO_2540 ) ) ( not ( = ?AUTO_2538 ?AUTO_2540 ) ) ( ON ?AUTO_2538 ?AUTO_2535 ) ( ON ?AUTO_2536 ?AUTO_2538 ) ( CLEAR ?AUTO_2536 ) ( not ( = ?AUTO_2534 ?AUTO_2537 ) ) ( not ( = ?AUTO_2535 ?AUTO_2537 ) ) ( not ( = ?AUTO_2539 ?AUTO_2537 ) ) ( not ( = ?AUTO_2536 ?AUTO_2537 ) ) ( not ( = ?AUTO_2538 ?AUTO_2537 ) ) ( not ( = ?AUTO_2540 ?AUTO_2537 ) ) ( ON ?AUTO_2537 ?AUTO_2534 ) ( CLEAR ?AUTO_2537 ) ( HOLDING ?AUTO_2541 ) ( not ( = ?AUTO_2534 ?AUTO_2541 ) ) ( not ( = ?AUTO_2535 ?AUTO_2541 ) ) ( not ( = ?AUTO_2539 ?AUTO_2541 ) ) ( not ( = ?AUTO_2536 ?AUTO_2541 ) ) ( not ( = ?AUTO_2538 ?AUTO_2541 ) ) ( not ( = ?AUTO_2540 ?AUTO_2541 ) ) ( not ( = ?AUTO_2537 ?AUTO_2541 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2541 )
      ( MAKE-ON ?AUTO_2534 ?AUTO_2535 )
      ( MAKE-ON-VERIFY ?AUTO_2534 ?AUTO_2535 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2542 - BLOCK
      ?AUTO_2543 - BLOCK
    )
    :vars
    (
      ?AUTO_2547 - BLOCK
      ?AUTO_2544 - BLOCK
      ?AUTO_2549 - BLOCK
      ?AUTO_2545 - BLOCK
      ?AUTO_2546 - BLOCK
      ?AUTO_2548 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2542 ?AUTO_2543 ) ) ( ON ?AUTO_2542 ?AUTO_2547 ) ( not ( = ?AUTO_2542 ?AUTO_2547 ) ) ( not ( = ?AUTO_2543 ?AUTO_2547 ) ) ( not ( = ?AUTO_2542 ?AUTO_2544 ) ) ( not ( = ?AUTO_2542 ?AUTO_2549 ) ) ( not ( = ?AUTO_2543 ?AUTO_2544 ) ) ( not ( = ?AUTO_2543 ?AUTO_2549 ) ) ( not ( = ?AUTO_2547 ?AUTO_2544 ) ) ( not ( = ?AUTO_2547 ?AUTO_2549 ) ) ( not ( = ?AUTO_2544 ?AUTO_2549 ) ) ( CLEAR ?AUTO_2545 ) ( not ( = ?AUTO_2542 ?AUTO_2545 ) ) ( not ( = ?AUTO_2543 ?AUTO_2545 ) ) ( not ( = ?AUTO_2547 ?AUTO_2545 ) ) ( not ( = ?AUTO_2544 ?AUTO_2545 ) ) ( not ( = ?AUTO_2549 ?AUTO_2545 ) ) ( ON ?AUTO_2549 ?AUTO_2543 ) ( ON ?AUTO_2544 ?AUTO_2549 ) ( CLEAR ?AUTO_2544 ) ( not ( = ?AUTO_2542 ?AUTO_2546 ) ) ( not ( = ?AUTO_2543 ?AUTO_2546 ) ) ( not ( = ?AUTO_2547 ?AUTO_2546 ) ) ( not ( = ?AUTO_2544 ?AUTO_2546 ) ) ( not ( = ?AUTO_2549 ?AUTO_2546 ) ) ( not ( = ?AUTO_2545 ?AUTO_2546 ) ) ( ON ?AUTO_2546 ?AUTO_2542 ) ( not ( = ?AUTO_2542 ?AUTO_2548 ) ) ( not ( = ?AUTO_2543 ?AUTO_2548 ) ) ( not ( = ?AUTO_2547 ?AUTO_2548 ) ) ( not ( = ?AUTO_2544 ?AUTO_2548 ) ) ( not ( = ?AUTO_2549 ?AUTO_2548 ) ) ( not ( = ?AUTO_2545 ?AUTO_2548 ) ) ( not ( = ?AUTO_2546 ?AUTO_2548 ) ) ( ON ?AUTO_2548 ?AUTO_2546 ) ( CLEAR ?AUTO_2548 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2548 ?AUTO_2546 )
      ( MAKE-ON ?AUTO_2542 ?AUTO_2543 )
      ( MAKE-ON-VERIFY ?AUTO_2542 ?AUTO_2543 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2550 - BLOCK
      ?AUTO_2551 - BLOCK
    )
    :vars
    (
      ?AUTO_2553 - BLOCK
      ?AUTO_2557 - BLOCK
      ?AUTO_2556 - BLOCK
      ?AUTO_2554 - BLOCK
      ?AUTO_2555 - BLOCK
      ?AUTO_2552 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2550 ?AUTO_2551 ) ) ( ON ?AUTO_2550 ?AUTO_2553 ) ( not ( = ?AUTO_2550 ?AUTO_2553 ) ) ( not ( = ?AUTO_2551 ?AUTO_2553 ) ) ( not ( = ?AUTO_2550 ?AUTO_2557 ) ) ( not ( = ?AUTO_2550 ?AUTO_2556 ) ) ( not ( = ?AUTO_2551 ?AUTO_2557 ) ) ( not ( = ?AUTO_2551 ?AUTO_2556 ) ) ( not ( = ?AUTO_2553 ?AUTO_2557 ) ) ( not ( = ?AUTO_2553 ?AUTO_2556 ) ) ( not ( = ?AUTO_2557 ?AUTO_2556 ) ) ( not ( = ?AUTO_2550 ?AUTO_2554 ) ) ( not ( = ?AUTO_2551 ?AUTO_2554 ) ) ( not ( = ?AUTO_2553 ?AUTO_2554 ) ) ( not ( = ?AUTO_2557 ?AUTO_2554 ) ) ( not ( = ?AUTO_2556 ?AUTO_2554 ) ) ( ON ?AUTO_2556 ?AUTO_2551 ) ( ON ?AUTO_2557 ?AUTO_2556 ) ( CLEAR ?AUTO_2557 ) ( not ( = ?AUTO_2550 ?AUTO_2555 ) ) ( not ( = ?AUTO_2551 ?AUTO_2555 ) ) ( not ( = ?AUTO_2553 ?AUTO_2555 ) ) ( not ( = ?AUTO_2557 ?AUTO_2555 ) ) ( not ( = ?AUTO_2556 ?AUTO_2555 ) ) ( not ( = ?AUTO_2554 ?AUTO_2555 ) ) ( ON ?AUTO_2555 ?AUTO_2550 ) ( not ( = ?AUTO_2550 ?AUTO_2552 ) ) ( not ( = ?AUTO_2551 ?AUTO_2552 ) ) ( not ( = ?AUTO_2553 ?AUTO_2552 ) ) ( not ( = ?AUTO_2557 ?AUTO_2552 ) ) ( not ( = ?AUTO_2556 ?AUTO_2552 ) ) ( not ( = ?AUTO_2554 ?AUTO_2552 ) ) ( not ( = ?AUTO_2555 ?AUTO_2552 ) ) ( ON ?AUTO_2552 ?AUTO_2555 ) ( CLEAR ?AUTO_2552 ) ( HOLDING ?AUTO_2554 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2554 )
      ( MAKE-ON ?AUTO_2550 ?AUTO_2551 )
      ( MAKE-ON-VERIFY ?AUTO_2550 ?AUTO_2551 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2558 - BLOCK
      ?AUTO_2559 - BLOCK
    )
    :vars
    (
      ?AUTO_2565 - BLOCK
      ?AUTO_2561 - BLOCK
      ?AUTO_2562 - BLOCK
      ?AUTO_2564 - BLOCK
      ?AUTO_2560 - BLOCK
      ?AUTO_2563 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2558 ?AUTO_2559 ) ) ( ON ?AUTO_2558 ?AUTO_2565 ) ( not ( = ?AUTO_2558 ?AUTO_2565 ) ) ( not ( = ?AUTO_2559 ?AUTO_2565 ) ) ( not ( = ?AUTO_2558 ?AUTO_2561 ) ) ( not ( = ?AUTO_2558 ?AUTO_2562 ) ) ( not ( = ?AUTO_2559 ?AUTO_2561 ) ) ( not ( = ?AUTO_2559 ?AUTO_2562 ) ) ( not ( = ?AUTO_2565 ?AUTO_2561 ) ) ( not ( = ?AUTO_2565 ?AUTO_2562 ) ) ( not ( = ?AUTO_2561 ?AUTO_2562 ) ) ( not ( = ?AUTO_2558 ?AUTO_2564 ) ) ( not ( = ?AUTO_2559 ?AUTO_2564 ) ) ( not ( = ?AUTO_2565 ?AUTO_2564 ) ) ( not ( = ?AUTO_2561 ?AUTO_2564 ) ) ( not ( = ?AUTO_2562 ?AUTO_2564 ) ) ( ON ?AUTO_2562 ?AUTO_2559 ) ( ON ?AUTO_2561 ?AUTO_2562 ) ( CLEAR ?AUTO_2561 ) ( not ( = ?AUTO_2558 ?AUTO_2560 ) ) ( not ( = ?AUTO_2559 ?AUTO_2560 ) ) ( not ( = ?AUTO_2565 ?AUTO_2560 ) ) ( not ( = ?AUTO_2561 ?AUTO_2560 ) ) ( not ( = ?AUTO_2562 ?AUTO_2560 ) ) ( not ( = ?AUTO_2564 ?AUTO_2560 ) ) ( ON ?AUTO_2560 ?AUTO_2558 ) ( not ( = ?AUTO_2558 ?AUTO_2563 ) ) ( not ( = ?AUTO_2559 ?AUTO_2563 ) ) ( not ( = ?AUTO_2565 ?AUTO_2563 ) ) ( not ( = ?AUTO_2561 ?AUTO_2563 ) ) ( not ( = ?AUTO_2562 ?AUTO_2563 ) ) ( not ( = ?AUTO_2564 ?AUTO_2563 ) ) ( not ( = ?AUTO_2560 ?AUTO_2563 ) ) ( ON ?AUTO_2563 ?AUTO_2560 ) ( ON ?AUTO_2564 ?AUTO_2563 ) ( CLEAR ?AUTO_2564 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2564 ?AUTO_2563 )
      ( MAKE-ON ?AUTO_2558 ?AUTO_2559 )
      ( MAKE-ON-VERIFY ?AUTO_2558 ?AUTO_2559 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2568 - BLOCK
      ?AUTO_2569 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2568 ) ( CLEAR ?AUTO_2569 ) ( not ( = ?AUTO_2568 ?AUTO_2569 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2568 ?AUTO_2569 )
      ( MAKE-ON-VERIFY ?AUTO_2568 ?AUTO_2569 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2570 - BLOCK
      ?AUTO_2571 - BLOCK
    )
    :vars
    (
      ?AUTO_2572 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2571 ) ( not ( = ?AUTO_2570 ?AUTO_2571 ) ) ( ON ?AUTO_2570 ?AUTO_2572 ) ( CLEAR ?AUTO_2570 ) ( HAND-EMPTY ) ( not ( = ?AUTO_2570 ?AUTO_2572 ) ) ( not ( = ?AUTO_2571 ?AUTO_2572 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2570 ?AUTO_2572 )
      ( MAKE-ON ?AUTO_2570 ?AUTO_2571 )
      ( MAKE-ON-VERIFY ?AUTO_2570 ?AUTO_2571 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2573 - BLOCK
      ?AUTO_2574 - BLOCK
    )
    :vars
    (
      ?AUTO_2575 - BLOCK
      ?AUTO_2576 - BLOCK
      ?AUTO_2577 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2574 ) ( not ( = ?AUTO_2573 ?AUTO_2574 ) ) ( ON ?AUTO_2573 ?AUTO_2575 ) ( CLEAR ?AUTO_2573 ) ( not ( = ?AUTO_2573 ?AUTO_2575 ) ) ( not ( = ?AUTO_2574 ?AUTO_2575 ) ) ( HOLDING ?AUTO_2576 ) ( CLEAR ?AUTO_2577 ) ( not ( = ?AUTO_2573 ?AUTO_2576 ) ) ( not ( = ?AUTO_2573 ?AUTO_2577 ) ) ( not ( = ?AUTO_2574 ?AUTO_2576 ) ) ( not ( = ?AUTO_2574 ?AUTO_2577 ) ) ( not ( = ?AUTO_2575 ?AUTO_2576 ) ) ( not ( = ?AUTO_2575 ?AUTO_2577 ) ) ( not ( = ?AUTO_2576 ?AUTO_2577 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2576 ?AUTO_2577 )
      ( MAKE-ON ?AUTO_2573 ?AUTO_2574 )
      ( MAKE-ON-VERIFY ?AUTO_2573 ?AUTO_2574 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2578 - BLOCK
      ?AUTO_2579 - BLOCK
    )
    :vars
    (
      ?AUTO_2580 - BLOCK
      ?AUTO_2581 - BLOCK
      ?AUTO_2582 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2578 ?AUTO_2579 ) ) ( ON ?AUTO_2578 ?AUTO_2580 ) ( CLEAR ?AUTO_2578 ) ( not ( = ?AUTO_2578 ?AUTO_2580 ) ) ( not ( = ?AUTO_2579 ?AUTO_2580 ) ) ( CLEAR ?AUTO_2581 ) ( not ( = ?AUTO_2578 ?AUTO_2582 ) ) ( not ( = ?AUTO_2578 ?AUTO_2581 ) ) ( not ( = ?AUTO_2579 ?AUTO_2582 ) ) ( not ( = ?AUTO_2579 ?AUTO_2581 ) ) ( not ( = ?AUTO_2580 ?AUTO_2582 ) ) ( not ( = ?AUTO_2580 ?AUTO_2581 ) ) ( not ( = ?AUTO_2582 ?AUTO_2581 ) ) ( ON ?AUTO_2582 ?AUTO_2579 ) ( CLEAR ?AUTO_2582 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2582 ?AUTO_2579 )
      ( MAKE-ON ?AUTO_2578 ?AUTO_2579 )
      ( MAKE-ON-VERIFY ?AUTO_2578 ?AUTO_2579 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2583 - BLOCK
      ?AUTO_2584 - BLOCK
    )
    :vars
    (
      ?AUTO_2587 - BLOCK
      ?AUTO_2585 - BLOCK
      ?AUTO_2586 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2583 ?AUTO_2584 ) ) ( not ( = ?AUTO_2583 ?AUTO_2587 ) ) ( not ( = ?AUTO_2584 ?AUTO_2587 ) ) ( CLEAR ?AUTO_2585 ) ( not ( = ?AUTO_2583 ?AUTO_2586 ) ) ( not ( = ?AUTO_2583 ?AUTO_2585 ) ) ( not ( = ?AUTO_2584 ?AUTO_2586 ) ) ( not ( = ?AUTO_2584 ?AUTO_2585 ) ) ( not ( = ?AUTO_2587 ?AUTO_2586 ) ) ( not ( = ?AUTO_2587 ?AUTO_2585 ) ) ( not ( = ?AUTO_2586 ?AUTO_2585 ) ) ( ON ?AUTO_2586 ?AUTO_2584 ) ( CLEAR ?AUTO_2586 ) ( HOLDING ?AUTO_2583 ) ( CLEAR ?AUTO_2587 ) )
    :subtasks
    ( ( !STACK ?AUTO_2583 ?AUTO_2587 )
      ( MAKE-ON ?AUTO_2583 ?AUTO_2584 )
      ( MAKE-ON-VERIFY ?AUTO_2583 ?AUTO_2584 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2588 - BLOCK
      ?AUTO_2589 - BLOCK
    )
    :vars
    (
      ?AUTO_2592 - BLOCK
      ?AUTO_2590 - BLOCK
      ?AUTO_2591 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2588 ?AUTO_2589 ) ) ( not ( = ?AUTO_2588 ?AUTO_2592 ) ) ( not ( = ?AUTO_2589 ?AUTO_2592 ) ) ( CLEAR ?AUTO_2590 ) ( not ( = ?AUTO_2588 ?AUTO_2591 ) ) ( not ( = ?AUTO_2588 ?AUTO_2590 ) ) ( not ( = ?AUTO_2589 ?AUTO_2591 ) ) ( not ( = ?AUTO_2589 ?AUTO_2590 ) ) ( not ( = ?AUTO_2592 ?AUTO_2591 ) ) ( not ( = ?AUTO_2592 ?AUTO_2590 ) ) ( not ( = ?AUTO_2591 ?AUTO_2590 ) ) ( ON ?AUTO_2591 ?AUTO_2589 ) ( CLEAR ?AUTO_2592 ) ( ON ?AUTO_2588 ?AUTO_2591 ) ( CLEAR ?AUTO_2588 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2588 ?AUTO_2591 )
      ( MAKE-ON ?AUTO_2588 ?AUTO_2589 )
      ( MAKE-ON-VERIFY ?AUTO_2588 ?AUTO_2589 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2593 - BLOCK
      ?AUTO_2594 - BLOCK
    )
    :vars
    (
      ?AUTO_2597 - BLOCK
      ?AUTO_2595 - BLOCK
      ?AUTO_2596 - BLOCK
      ?AUTO_2598 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2593 ?AUTO_2594 ) ) ( not ( = ?AUTO_2593 ?AUTO_2597 ) ) ( not ( = ?AUTO_2594 ?AUTO_2597 ) ) ( CLEAR ?AUTO_2595 ) ( not ( = ?AUTO_2593 ?AUTO_2596 ) ) ( not ( = ?AUTO_2593 ?AUTO_2595 ) ) ( not ( = ?AUTO_2594 ?AUTO_2596 ) ) ( not ( = ?AUTO_2594 ?AUTO_2595 ) ) ( not ( = ?AUTO_2597 ?AUTO_2596 ) ) ( not ( = ?AUTO_2597 ?AUTO_2595 ) ) ( not ( = ?AUTO_2596 ?AUTO_2595 ) ) ( ON ?AUTO_2596 ?AUTO_2594 ) ( ON ?AUTO_2593 ?AUTO_2596 ) ( CLEAR ?AUTO_2593 ) ( HOLDING ?AUTO_2597 ) ( CLEAR ?AUTO_2598 ) ( not ( = ?AUTO_2593 ?AUTO_2598 ) ) ( not ( = ?AUTO_2594 ?AUTO_2598 ) ) ( not ( = ?AUTO_2597 ?AUTO_2598 ) ) ( not ( = ?AUTO_2595 ?AUTO_2598 ) ) ( not ( = ?AUTO_2596 ?AUTO_2598 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2597 ?AUTO_2598 )
      ( MAKE-ON ?AUTO_2593 ?AUTO_2594 )
      ( MAKE-ON-VERIFY ?AUTO_2593 ?AUTO_2594 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2619 - BLOCK
      ?AUTO_2620 - BLOCK
    )
    :vars
    (
      ?AUTO_2623 - BLOCK
      ?AUTO_2621 - BLOCK
      ?AUTO_2624 - BLOCK
      ?AUTO_2625 - BLOCK
      ?AUTO_2622 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2619 ?AUTO_2620 ) ) ( ON ?AUTO_2619 ?AUTO_2623 ) ( not ( = ?AUTO_2619 ?AUTO_2623 ) ) ( not ( = ?AUTO_2620 ?AUTO_2623 ) ) ( not ( = ?AUTO_2619 ?AUTO_2621 ) ) ( not ( = ?AUTO_2619 ?AUTO_2624 ) ) ( not ( = ?AUTO_2620 ?AUTO_2621 ) ) ( not ( = ?AUTO_2620 ?AUTO_2624 ) ) ( not ( = ?AUTO_2623 ?AUTO_2621 ) ) ( not ( = ?AUTO_2623 ?AUTO_2624 ) ) ( not ( = ?AUTO_2621 ?AUTO_2624 ) ) ( CLEAR ?AUTO_2625 ) ( not ( = ?AUTO_2619 ?AUTO_2625 ) ) ( not ( = ?AUTO_2620 ?AUTO_2625 ) ) ( not ( = ?AUTO_2623 ?AUTO_2625 ) ) ( not ( = ?AUTO_2621 ?AUTO_2625 ) ) ( not ( = ?AUTO_2624 ?AUTO_2625 ) ) ( ON ?AUTO_2624 ?AUTO_2620 ) ( CLEAR ?AUTO_2619 ) ( ON ?AUTO_2621 ?AUTO_2624 ) ( not ( = ?AUTO_2619 ?AUTO_2622 ) ) ( not ( = ?AUTO_2620 ?AUTO_2622 ) ) ( not ( = ?AUTO_2623 ?AUTO_2622 ) ) ( not ( = ?AUTO_2621 ?AUTO_2622 ) ) ( not ( = ?AUTO_2624 ?AUTO_2622 ) ) ( not ( = ?AUTO_2625 ?AUTO_2622 ) ) ( ON ?AUTO_2622 ?AUTO_2621 ) ( CLEAR ?AUTO_2622 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2622 ?AUTO_2621 )
      ( MAKE-ON ?AUTO_2619 ?AUTO_2620 )
      ( MAKE-ON-VERIFY ?AUTO_2619 ?AUTO_2620 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2626 - BLOCK
      ?AUTO_2627 - BLOCK
    )
    :vars
    (
      ?AUTO_2631 - BLOCK
      ?AUTO_2628 - BLOCK
      ?AUTO_2632 - BLOCK
      ?AUTO_2630 - BLOCK
      ?AUTO_2629 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2626 ?AUTO_2627 ) ) ( ON ?AUTO_2626 ?AUTO_2631 ) ( not ( = ?AUTO_2626 ?AUTO_2631 ) ) ( not ( = ?AUTO_2627 ?AUTO_2631 ) ) ( not ( = ?AUTO_2626 ?AUTO_2628 ) ) ( not ( = ?AUTO_2626 ?AUTO_2632 ) ) ( not ( = ?AUTO_2627 ?AUTO_2628 ) ) ( not ( = ?AUTO_2627 ?AUTO_2632 ) ) ( not ( = ?AUTO_2631 ?AUTO_2628 ) ) ( not ( = ?AUTO_2631 ?AUTO_2632 ) ) ( not ( = ?AUTO_2628 ?AUTO_2632 ) ) ( not ( = ?AUTO_2626 ?AUTO_2630 ) ) ( not ( = ?AUTO_2627 ?AUTO_2630 ) ) ( not ( = ?AUTO_2631 ?AUTO_2630 ) ) ( not ( = ?AUTO_2628 ?AUTO_2630 ) ) ( not ( = ?AUTO_2632 ?AUTO_2630 ) ) ( ON ?AUTO_2632 ?AUTO_2627 ) ( CLEAR ?AUTO_2626 ) ( ON ?AUTO_2628 ?AUTO_2632 ) ( not ( = ?AUTO_2626 ?AUTO_2629 ) ) ( not ( = ?AUTO_2627 ?AUTO_2629 ) ) ( not ( = ?AUTO_2631 ?AUTO_2629 ) ) ( not ( = ?AUTO_2628 ?AUTO_2629 ) ) ( not ( = ?AUTO_2632 ?AUTO_2629 ) ) ( not ( = ?AUTO_2630 ?AUTO_2629 ) ) ( ON ?AUTO_2629 ?AUTO_2628 ) ( CLEAR ?AUTO_2629 ) ( HOLDING ?AUTO_2630 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2630 )
      ( MAKE-ON ?AUTO_2626 ?AUTO_2627 )
      ( MAKE-ON-VERIFY ?AUTO_2626 ?AUTO_2627 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2633 - BLOCK
      ?AUTO_2634 - BLOCK
    )
    :vars
    (
      ?AUTO_2635 - BLOCK
      ?AUTO_2638 - BLOCK
      ?AUTO_2636 - BLOCK
      ?AUTO_2639 - BLOCK
      ?AUTO_2637 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2633 ?AUTO_2634 ) ) ( ON ?AUTO_2633 ?AUTO_2635 ) ( not ( = ?AUTO_2633 ?AUTO_2635 ) ) ( not ( = ?AUTO_2634 ?AUTO_2635 ) ) ( not ( = ?AUTO_2633 ?AUTO_2638 ) ) ( not ( = ?AUTO_2633 ?AUTO_2636 ) ) ( not ( = ?AUTO_2634 ?AUTO_2638 ) ) ( not ( = ?AUTO_2634 ?AUTO_2636 ) ) ( not ( = ?AUTO_2635 ?AUTO_2638 ) ) ( not ( = ?AUTO_2635 ?AUTO_2636 ) ) ( not ( = ?AUTO_2638 ?AUTO_2636 ) ) ( not ( = ?AUTO_2633 ?AUTO_2639 ) ) ( not ( = ?AUTO_2634 ?AUTO_2639 ) ) ( not ( = ?AUTO_2635 ?AUTO_2639 ) ) ( not ( = ?AUTO_2638 ?AUTO_2639 ) ) ( not ( = ?AUTO_2636 ?AUTO_2639 ) ) ( ON ?AUTO_2636 ?AUTO_2634 ) ( CLEAR ?AUTO_2633 ) ( ON ?AUTO_2638 ?AUTO_2636 ) ( not ( = ?AUTO_2633 ?AUTO_2637 ) ) ( not ( = ?AUTO_2634 ?AUTO_2637 ) ) ( not ( = ?AUTO_2635 ?AUTO_2637 ) ) ( not ( = ?AUTO_2638 ?AUTO_2637 ) ) ( not ( = ?AUTO_2636 ?AUTO_2637 ) ) ( not ( = ?AUTO_2639 ?AUTO_2637 ) ) ( ON ?AUTO_2637 ?AUTO_2638 ) ( ON ?AUTO_2639 ?AUTO_2637 ) ( CLEAR ?AUTO_2639 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2639 ?AUTO_2637 )
      ( MAKE-ON ?AUTO_2633 ?AUTO_2634 )
      ( MAKE-ON-VERIFY ?AUTO_2633 ?AUTO_2634 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2641 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2641 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2641 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2641 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2642 - BLOCK
    )
    :vars
    (
      ?AUTO_2643 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2642 ?AUTO_2643 ) ( CLEAR ?AUTO_2642 ) ( HAND-EMPTY ) ( not ( = ?AUTO_2642 ?AUTO_2643 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2642 ?AUTO_2643 )
      ( MAKE-ON-TABLE ?AUTO_2642 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2642 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2644 - BLOCK
    )
    :vars
    (
      ?AUTO_2645 - BLOCK
      ?AUTO_2646 - BLOCK
      ?AUTO_2647 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2644 ?AUTO_2645 ) ( CLEAR ?AUTO_2644 ) ( not ( = ?AUTO_2644 ?AUTO_2645 ) ) ( HOLDING ?AUTO_2646 ) ( CLEAR ?AUTO_2647 ) ( not ( = ?AUTO_2644 ?AUTO_2646 ) ) ( not ( = ?AUTO_2644 ?AUTO_2647 ) ) ( not ( = ?AUTO_2645 ?AUTO_2646 ) ) ( not ( = ?AUTO_2645 ?AUTO_2647 ) ) ( not ( = ?AUTO_2646 ?AUTO_2647 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2646 ?AUTO_2647 )
      ( MAKE-ON-TABLE ?AUTO_2644 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2644 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2648 - BLOCK
    )
    :vars
    (
      ?AUTO_2649 - BLOCK
      ?AUTO_2651 - BLOCK
      ?AUTO_2650 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2648 ?AUTO_2649 ) ( not ( = ?AUTO_2648 ?AUTO_2649 ) ) ( CLEAR ?AUTO_2651 ) ( not ( = ?AUTO_2648 ?AUTO_2650 ) ) ( not ( = ?AUTO_2648 ?AUTO_2651 ) ) ( not ( = ?AUTO_2649 ?AUTO_2650 ) ) ( not ( = ?AUTO_2649 ?AUTO_2651 ) ) ( not ( = ?AUTO_2650 ?AUTO_2651 ) ) ( ON ?AUTO_2650 ?AUTO_2648 ) ( CLEAR ?AUTO_2650 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2650 ?AUTO_2648 )
      ( MAKE-ON-TABLE ?AUTO_2648 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2648 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2652 - BLOCK
    )
    :vars
    (
      ?AUTO_2653 - BLOCK
      ?AUTO_2655 - BLOCK
      ?AUTO_2654 - BLOCK
      ?AUTO_2656 - BLOCK
      ?AUTO_2657 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2652 ?AUTO_2653 ) ( not ( = ?AUTO_2652 ?AUTO_2653 ) ) ( CLEAR ?AUTO_2655 ) ( not ( = ?AUTO_2652 ?AUTO_2654 ) ) ( not ( = ?AUTO_2652 ?AUTO_2655 ) ) ( not ( = ?AUTO_2653 ?AUTO_2654 ) ) ( not ( = ?AUTO_2653 ?AUTO_2655 ) ) ( not ( = ?AUTO_2654 ?AUTO_2655 ) ) ( ON ?AUTO_2654 ?AUTO_2652 ) ( CLEAR ?AUTO_2654 ) ( HOLDING ?AUTO_2656 ) ( CLEAR ?AUTO_2657 ) ( not ( = ?AUTO_2652 ?AUTO_2656 ) ) ( not ( = ?AUTO_2652 ?AUTO_2657 ) ) ( not ( = ?AUTO_2653 ?AUTO_2656 ) ) ( not ( = ?AUTO_2653 ?AUTO_2657 ) ) ( not ( = ?AUTO_2655 ?AUTO_2656 ) ) ( not ( = ?AUTO_2655 ?AUTO_2657 ) ) ( not ( = ?AUTO_2654 ?AUTO_2656 ) ) ( not ( = ?AUTO_2654 ?AUTO_2657 ) ) ( not ( = ?AUTO_2656 ?AUTO_2657 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2656 ?AUTO_2657 )
      ( MAKE-ON-TABLE ?AUTO_2652 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2652 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2680 - BLOCK
      ?AUTO_2681 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2680 ) ( CLEAR ?AUTO_2681 ) ( not ( = ?AUTO_2680 ?AUTO_2681 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2680 ?AUTO_2681 )
      ( MAKE-ON-VERIFY ?AUTO_2680 ?AUTO_2681 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2682 - BLOCK
      ?AUTO_2683 - BLOCK
    )
    :vars
    (
      ?AUTO_2684 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2683 ) ( not ( = ?AUTO_2682 ?AUTO_2683 ) ) ( ON ?AUTO_2682 ?AUTO_2684 ) ( CLEAR ?AUTO_2682 ) ( HAND-EMPTY ) ( not ( = ?AUTO_2682 ?AUTO_2684 ) ) ( not ( = ?AUTO_2683 ?AUTO_2684 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2682 ?AUTO_2684 )
      ( MAKE-ON ?AUTO_2682 ?AUTO_2683 )
      ( MAKE-ON-VERIFY ?AUTO_2682 ?AUTO_2683 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2685 - BLOCK
      ?AUTO_2686 - BLOCK
    )
    :vars
    (
      ?AUTO_2687 - BLOCK
      ?AUTO_2688 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2686 ) ( not ( = ?AUTO_2685 ?AUTO_2686 ) ) ( ON ?AUTO_2685 ?AUTO_2687 ) ( CLEAR ?AUTO_2685 ) ( not ( = ?AUTO_2685 ?AUTO_2687 ) ) ( not ( = ?AUTO_2686 ?AUTO_2687 ) ) ( HOLDING ?AUTO_2688 ) ( not ( = ?AUTO_2685 ?AUTO_2688 ) ) ( not ( = ?AUTO_2686 ?AUTO_2688 ) ) ( not ( = ?AUTO_2687 ?AUTO_2688 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2688 )
      ( MAKE-ON ?AUTO_2685 ?AUTO_2686 )
      ( MAKE-ON-VERIFY ?AUTO_2685 ?AUTO_2686 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2689 - BLOCK
      ?AUTO_2690 - BLOCK
    )
    :vars
    (
      ?AUTO_2691 - BLOCK
      ?AUTO_2692 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2690 ) ( not ( = ?AUTO_2689 ?AUTO_2690 ) ) ( ON ?AUTO_2689 ?AUTO_2691 ) ( not ( = ?AUTO_2689 ?AUTO_2691 ) ) ( not ( = ?AUTO_2690 ?AUTO_2691 ) ) ( not ( = ?AUTO_2689 ?AUTO_2692 ) ) ( not ( = ?AUTO_2690 ?AUTO_2692 ) ) ( not ( = ?AUTO_2691 ?AUTO_2692 ) ) ( ON ?AUTO_2692 ?AUTO_2689 ) ( CLEAR ?AUTO_2692 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2692 ?AUTO_2689 )
      ( MAKE-ON ?AUTO_2689 ?AUTO_2690 )
      ( MAKE-ON-VERIFY ?AUTO_2689 ?AUTO_2690 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2693 - BLOCK
      ?AUTO_2694 - BLOCK
    )
    :vars
    (
      ?AUTO_2695 - BLOCK
      ?AUTO_2696 - BLOCK
      ?AUTO_2697 - BLOCK
      ?AUTO_2698 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2694 ) ( not ( = ?AUTO_2693 ?AUTO_2694 ) ) ( ON ?AUTO_2693 ?AUTO_2695 ) ( not ( = ?AUTO_2693 ?AUTO_2695 ) ) ( not ( = ?AUTO_2694 ?AUTO_2695 ) ) ( not ( = ?AUTO_2693 ?AUTO_2696 ) ) ( not ( = ?AUTO_2694 ?AUTO_2696 ) ) ( not ( = ?AUTO_2695 ?AUTO_2696 ) ) ( ON ?AUTO_2696 ?AUTO_2693 ) ( CLEAR ?AUTO_2696 ) ( HOLDING ?AUTO_2697 ) ( CLEAR ?AUTO_2698 ) ( not ( = ?AUTO_2693 ?AUTO_2697 ) ) ( not ( = ?AUTO_2693 ?AUTO_2698 ) ) ( not ( = ?AUTO_2694 ?AUTO_2697 ) ) ( not ( = ?AUTO_2694 ?AUTO_2698 ) ) ( not ( = ?AUTO_2695 ?AUTO_2697 ) ) ( not ( = ?AUTO_2695 ?AUTO_2698 ) ) ( not ( = ?AUTO_2696 ?AUTO_2697 ) ) ( not ( = ?AUTO_2696 ?AUTO_2698 ) ) ( not ( = ?AUTO_2697 ?AUTO_2698 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2697 ?AUTO_2698 )
      ( MAKE-ON ?AUTO_2693 ?AUTO_2694 )
      ( MAKE-ON-VERIFY ?AUTO_2693 ?AUTO_2694 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2699 - BLOCK
      ?AUTO_2700 - BLOCK
    )
    :vars
    (
      ?AUTO_2701 - BLOCK
      ?AUTO_2702 - BLOCK
      ?AUTO_2704 - BLOCK
      ?AUTO_2703 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2700 ) ( not ( = ?AUTO_2699 ?AUTO_2700 ) ) ( ON ?AUTO_2699 ?AUTO_2701 ) ( not ( = ?AUTO_2699 ?AUTO_2701 ) ) ( not ( = ?AUTO_2700 ?AUTO_2701 ) ) ( not ( = ?AUTO_2699 ?AUTO_2702 ) ) ( not ( = ?AUTO_2700 ?AUTO_2702 ) ) ( not ( = ?AUTO_2701 ?AUTO_2702 ) ) ( ON ?AUTO_2702 ?AUTO_2699 ) ( CLEAR ?AUTO_2704 ) ( not ( = ?AUTO_2699 ?AUTO_2703 ) ) ( not ( = ?AUTO_2699 ?AUTO_2704 ) ) ( not ( = ?AUTO_2700 ?AUTO_2703 ) ) ( not ( = ?AUTO_2700 ?AUTO_2704 ) ) ( not ( = ?AUTO_2701 ?AUTO_2703 ) ) ( not ( = ?AUTO_2701 ?AUTO_2704 ) ) ( not ( = ?AUTO_2702 ?AUTO_2703 ) ) ( not ( = ?AUTO_2702 ?AUTO_2704 ) ) ( not ( = ?AUTO_2703 ?AUTO_2704 ) ) ( ON ?AUTO_2703 ?AUTO_2702 ) ( CLEAR ?AUTO_2703 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2703 ?AUTO_2702 )
      ( MAKE-ON ?AUTO_2699 ?AUTO_2700 )
      ( MAKE-ON-VERIFY ?AUTO_2699 ?AUTO_2700 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2705 - BLOCK
      ?AUTO_2706 - BLOCK
    )
    :vars
    (
      ?AUTO_2707 - BLOCK
      ?AUTO_2708 - BLOCK
      ?AUTO_2710 - BLOCK
      ?AUTO_2709 - BLOCK
      ?AUTO_2711 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2705 ?AUTO_2706 ) ) ( ON ?AUTO_2705 ?AUTO_2707 ) ( not ( = ?AUTO_2705 ?AUTO_2707 ) ) ( not ( = ?AUTO_2706 ?AUTO_2707 ) ) ( not ( = ?AUTO_2705 ?AUTO_2708 ) ) ( not ( = ?AUTO_2706 ?AUTO_2708 ) ) ( not ( = ?AUTO_2707 ?AUTO_2708 ) ) ( ON ?AUTO_2708 ?AUTO_2705 ) ( CLEAR ?AUTO_2710 ) ( not ( = ?AUTO_2705 ?AUTO_2709 ) ) ( not ( = ?AUTO_2705 ?AUTO_2710 ) ) ( not ( = ?AUTO_2706 ?AUTO_2709 ) ) ( not ( = ?AUTO_2706 ?AUTO_2710 ) ) ( not ( = ?AUTO_2707 ?AUTO_2709 ) ) ( not ( = ?AUTO_2707 ?AUTO_2710 ) ) ( not ( = ?AUTO_2708 ?AUTO_2709 ) ) ( not ( = ?AUTO_2708 ?AUTO_2710 ) ) ( not ( = ?AUTO_2709 ?AUTO_2710 ) ) ( ON ?AUTO_2709 ?AUTO_2708 ) ( CLEAR ?AUTO_2709 ) ( HOLDING ?AUTO_2706 ) ( CLEAR ?AUTO_2711 ) ( not ( = ?AUTO_2705 ?AUTO_2711 ) ) ( not ( = ?AUTO_2706 ?AUTO_2711 ) ) ( not ( = ?AUTO_2707 ?AUTO_2711 ) ) ( not ( = ?AUTO_2708 ?AUTO_2711 ) ) ( not ( = ?AUTO_2710 ?AUTO_2711 ) ) ( not ( = ?AUTO_2709 ?AUTO_2711 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2706 ?AUTO_2711 )
      ( MAKE-ON ?AUTO_2705 ?AUTO_2706 )
      ( MAKE-ON-VERIFY ?AUTO_2705 ?AUTO_2706 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2716 - BLOCK
      ?AUTO_2717 - BLOCK
    )
    :vars
    (
      ?AUTO_2719 - BLOCK
      ?AUTO_2718 - BLOCK
      ?AUTO_2721 - BLOCK
      ?AUTO_2720 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2716 ?AUTO_2717 ) ) ( ON ?AUTO_2716 ?AUTO_2719 ) ( not ( = ?AUTO_2716 ?AUTO_2719 ) ) ( not ( = ?AUTO_2717 ?AUTO_2719 ) ) ( not ( = ?AUTO_2716 ?AUTO_2718 ) ) ( not ( = ?AUTO_2717 ?AUTO_2718 ) ) ( not ( = ?AUTO_2719 ?AUTO_2718 ) ) ( ON ?AUTO_2718 ?AUTO_2716 ) ( CLEAR ?AUTO_2718 ) ( CLEAR ?AUTO_2721 ) ( not ( = ?AUTO_2716 ?AUTO_2720 ) ) ( not ( = ?AUTO_2716 ?AUTO_2721 ) ) ( not ( = ?AUTO_2717 ?AUTO_2720 ) ) ( not ( = ?AUTO_2717 ?AUTO_2721 ) ) ( not ( = ?AUTO_2719 ?AUTO_2720 ) ) ( not ( = ?AUTO_2719 ?AUTO_2721 ) ) ( not ( = ?AUTO_2718 ?AUTO_2720 ) ) ( not ( = ?AUTO_2718 ?AUTO_2721 ) ) ( not ( = ?AUTO_2720 ?AUTO_2721 ) ) ( ON ?AUTO_2720 ?AUTO_2717 ) ( CLEAR ?AUTO_2720 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2720 ?AUTO_2717 )
      ( MAKE-ON ?AUTO_2716 ?AUTO_2717 )
      ( MAKE-ON-VERIFY ?AUTO_2716 ?AUTO_2717 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2722 - BLOCK
      ?AUTO_2723 - BLOCK
    )
    :vars
    (
      ?AUTO_2724 - BLOCK
      ?AUTO_2725 - BLOCK
      ?AUTO_2726 - BLOCK
      ?AUTO_2727 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2722 ?AUTO_2723 ) ) ( ON ?AUTO_2722 ?AUTO_2724 ) ( not ( = ?AUTO_2722 ?AUTO_2724 ) ) ( not ( = ?AUTO_2723 ?AUTO_2724 ) ) ( not ( = ?AUTO_2722 ?AUTO_2725 ) ) ( not ( = ?AUTO_2723 ?AUTO_2725 ) ) ( not ( = ?AUTO_2724 ?AUTO_2725 ) ) ( CLEAR ?AUTO_2726 ) ( not ( = ?AUTO_2722 ?AUTO_2727 ) ) ( not ( = ?AUTO_2722 ?AUTO_2726 ) ) ( not ( = ?AUTO_2723 ?AUTO_2727 ) ) ( not ( = ?AUTO_2723 ?AUTO_2726 ) ) ( not ( = ?AUTO_2724 ?AUTO_2727 ) ) ( not ( = ?AUTO_2724 ?AUTO_2726 ) ) ( not ( = ?AUTO_2725 ?AUTO_2727 ) ) ( not ( = ?AUTO_2725 ?AUTO_2726 ) ) ( not ( = ?AUTO_2727 ?AUTO_2726 ) ) ( ON ?AUTO_2727 ?AUTO_2723 ) ( CLEAR ?AUTO_2727 ) ( HOLDING ?AUTO_2725 ) ( CLEAR ?AUTO_2722 ) )
    :subtasks
    ( ( !STACK ?AUTO_2725 ?AUTO_2722 )
      ( MAKE-ON ?AUTO_2722 ?AUTO_2723 )
      ( MAKE-ON-VERIFY ?AUTO_2722 ?AUTO_2723 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2734 - BLOCK
      ?AUTO_2735 - BLOCK
    )
    :vars
    (
      ?AUTO_2739 - BLOCK
      ?AUTO_2738 - BLOCK
      ?AUTO_2737 - BLOCK
      ?AUTO_2736 - BLOCK
      ?AUTO_2740 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2734 ?AUTO_2735 ) ) ( ON ?AUTO_2734 ?AUTO_2739 ) ( not ( = ?AUTO_2734 ?AUTO_2739 ) ) ( not ( = ?AUTO_2735 ?AUTO_2739 ) ) ( not ( = ?AUTO_2734 ?AUTO_2738 ) ) ( not ( = ?AUTO_2735 ?AUTO_2738 ) ) ( not ( = ?AUTO_2739 ?AUTO_2738 ) ) ( ON ?AUTO_2738 ?AUTO_2734 ) ( CLEAR ?AUTO_2738 ) ( CLEAR ?AUTO_2737 ) ( not ( = ?AUTO_2734 ?AUTO_2736 ) ) ( not ( = ?AUTO_2734 ?AUTO_2737 ) ) ( not ( = ?AUTO_2735 ?AUTO_2736 ) ) ( not ( = ?AUTO_2735 ?AUTO_2737 ) ) ( not ( = ?AUTO_2739 ?AUTO_2736 ) ) ( not ( = ?AUTO_2739 ?AUTO_2737 ) ) ( not ( = ?AUTO_2738 ?AUTO_2736 ) ) ( not ( = ?AUTO_2738 ?AUTO_2737 ) ) ( not ( = ?AUTO_2736 ?AUTO_2737 ) ) ( ON ?AUTO_2736 ?AUTO_2735 ) ( CLEAR ?AUTO_2736 ) ( HOLDING ?AUTO_2740 ) ( not ( = ?AUTO_2734 ?AUTO_2740 ) ) ( not ( = ?AUTO_2735 ?AUTO_2740 ) ) ( not ( = ?AUTO_2739 ?AUTO_2740 ) ) ( not ( = ?AUTO_2738 ?AUTO_2740 ) ) ( not ( = ?AUTO_2737 ?AUTO_2740 ) ) ( not ( = ?AUTO_2736 ?AUTO_2740 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2740 )
      ( MAKE-ON ?AUTO_2734 ?AUTO_2735 )
      ( MAKE-ON-VERIFY ?AUTO_2734 ?AUTO_2735 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2741 - BLOCK
      ?AUTO_2742 - BLOCK
    )
    :vars
    (
      ?AUTO_2744 - BLOCK
      ?AUTO_2743 - BLOCK
      ?AUTO_2746 - BLOCK
      ?AUTO_2745 - BLOCK
      ?AUTO_2747 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2741 ?AUTO_2742 ) ) ( ON ?AUTO_2741 ?AUTO_2744 ) ( not ( = ?AUTO_2741 ?AUTO_2744 ) ) ( not ( = ?AUTO_2742 ?AUTO_2744 ) ) ( not ( = ?AUTO_2741 ?AUTO_2743 ) ) ( not ( = ?AUTO_2742 ?AUTO_2743 ) ) ( not ( = ?AUTO_2744 ?AUTO_2743 ) ) ( ON ?AUTO_2743 ?AUTO_2741 ) ( CLEAR ?AUTO_2746 ) ( not ( = ?AUTO_2741 ?AUTO_2745 ) ) ( not ( = ?AUTO_2741 ?AUTO_2746 ) ) ( not ( = ?AUTO_2742 ?AUTO_2745 ) ) ( not ( = ?AUTO_2742 ?AUTO_2746 ) ) ( not ( = ?AUTO_2744 ?AUTO_2745 ) ) ( not ( = ?AUTO_2744 ?AUTO_2746 ) ) ( not ( = ?AUTO_2743 ?AUTO_2745 ) ) ( not ( = ?AUTO_2743 ?AUTO_2746 ) ) ( not ( = ?AUTO_2745 ?AUTO_2746 ) ) ( ON ?AUTO_2745 ?AUTO_2742 ) ( CLEAR ?AUTO_2745 ) ( not ( = ?AUTO_2741 ?AUTO_2747 ) ) ( not ( = ?AUTO_2742 ?AUTO_2747 ) ) ( not ( = ?AUTO_2744 ?AUTO_2747 ) ) ( not ( = ?AUTO_2743 ?AUTO_2747 ) ) ( not ( = ?AUTO_2746 ?AUTO_2747 ) ) ( not ( = ?AUTO_2745 ?AUTO_2747 ) ) ( ON ?AUTO_2747 ?AUTO_2743 ) ( CLEAR ?AUTO_2747 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2747 ?AUTO_2743 )
      ( MAKE-ON ?AUTO_2741 ?AUTO_2742 )
      ( MAKE-ON-VERIFY ?AUTO_2741 ?AUTO_2742 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2748 - BLOCK
      ?AUTO_2749 - BLOCK
    )
    :vars
    (
      ?AUTO_2752 - BLOCK
      ?AUTO_2750 - BLOCK
      ?AUTO_2753 - BLOCK
      ?AUTO_2754 - BLOCK
      ?AUTO_2751 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2748 ?AUTO_2749 ) ) ( ON ?AUTO_2748 ?AUTO_2752 ) ( not ( = ?AUTO_2748 ?AUTO_2752 ) ) ( not ( = ?AUTO_2749 ?AUTO_2752 ) ) ( not ( = ?AUTO_2748 ?AUTO_2750 ) ) ( not ( = ?AUTO_2749 ?AUTO_2750 ) ) ( not ( = ?AUTO_2752 ?AUTO_2750 ) ) ( ON ?AUTO_2750 ?AUTO_2748 ) ( CLEAR ?AUTO_2753 ) ( not ( = ?AUTO_2748 ?AUTO_2754 ) ) ( not ( = ?AUTO_2748 ?AUTO_2753 ) ) ( not ( = ?AUTO_2749 ?AUTO_2754 ) ) ( not ( = ?AUTO_2749 ?AUTO_2753 ) ) ( not ( = ?AUTO_2752 ?AUTO_2754 ) ) ( not ( = ?AUTO_2752 ?AUTO_2753 ) ) ( not ( = ?AUTO_2750 ?AUTO_2754 ) ) ( not ( = ?AUTO_2750 ?AUTO_2753 ) ) ( not ( = ?AUTO_2754 ?AUTO_2753 ) ) ( not ( = ?AUTO_2748 ?AUTO_2751 ) ) ( not ( = ?AUTO_2749 ?AUTO_2751 ) ) ( not ( = ?AUTO_2752 ?AUTO_2751 ) ) ( not ( = ?AUTO_2750 ?AUTO_2751 ) ) ( not ( = ?AUTO_2753 ?AUTO_2751 ) ) ( not ( = ?AUTO_2754 ?AUTO_2751 ) ) ( ON ?AUTO_2751 ?AUTO_2750 ) ( CLEAR ?AUTO_2751 ) ( HOLDING ?AUTO_2754 ) ( CLEAR ?AUTO_2749 ) )
    :subtasks
    ( ( !STACK ?AUTO_2754 ?AUTO_2749 )
      ( MAKE-ON ?AUTO_2748 ?AUTO_2749 )
      ( MAKE-ON-VERIFY ?AUTO_2748 ?AUTO_2749 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2755 - BLOCK
      ?AUTO_2756 - BLOCK
    )
    :vars
    (
      ?AUTO_2760 - BLOCK
      ?AUTO_2759 - BLOCK
      ?AUTO_2761 - BLOCK
      ?AUTO_2758 - BLOCK
      ?AUTO_2757 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2755 ?AUTO_2756 ) ) ( ON ?AUTO_2755 ?AUTO_2760 ) ( not ( = ?AUTO_2755 ?AUTO_2760 ) ) ( not ( = ?AUTO_2756 ?AUTO_2760 ) ) ( not ( = ?AUTO_2755 ?AUTO_2759 ) ) ( not ( = ?AUTO_2756 ?AUTO_2759 ) ) ( not ( = ?AUTO_2760 ?AUTO_2759 ) ) ( ON ?AUTO_2759 ?AUTO_2755 ) ( CLEAR ?AUTO_2761 ) ( not ( = ?AUTO_2755 ?AUTO_2758 ) ) ( not ( = ?AUTO_2755 ?AUTO_2761 ) ) ( not ( = ?AUTO_2756 ?AUTO_2758 ) ) ( not ( = ?AUTO_2756 ?AUTO_2761 ) ) ( not ( = ?AUTO_2760 ?AUTO_2758 ) ) ( not ( = ?AUTO_2760 ?AUTO_2761 ) ) ( not ( = ?AUTO_2759 ?AUTO_2758 ) ) ( not ( = ?AUTO_2759 ?AUTO_2761 ) ) ( not ( = ?AUTO_2758 ?AUTO_2761 ) ) ( not ( = ?AUTO_2755 ?AUTO_2757 ) ) ( not ( = ?AUTO_2756 ?AUTO_2757 ) ) ( not ( = ?AUTO_2760 ?AUTO_2757 ) ) ( not ( = ?AUTO_2759 ?AUTO_2757 ) ) ( not ( = ?AUTO_2761 ?AUTO_2757 ) ) ( not ( = ?AUTO_2758 ?AUTO_2757 ) ) ( ON ?AUTO_2757 ?AUTO_2759 ) ( CLEAR ?AUTO_2756 ) ( ON ?AUTO_2758 ?AUTO_2757 ) ( CLEAR ?AUTO_2758 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2758 ?AUTO_2757 )
      ( MAKE-ON ?AUTO_2755 ?AUTO_2756 )
      ( MAKE-ON-VERIFY ?AUTO_2755 ?AUTO_2756 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2762 - BLOCK
      ?AUTO_2763 - BLOCK
    )
    :vars
    (
      ?AUTO_2766 - BLOCK
      ?AUTO_2765 - BLOCK
      ?AUTO_2768 - BLOCK
      ?AUTO_2764 - BLOCK
      ?AUTO_2767 - BLOCK
      ?AUTO_2769 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2762 ?AUTO_2763 ) ) ( ON ?AUTO_2762 ?AUTO_2766 ) ( not ( = ?AUTO_2762 ?AUTO_2766 ) ) ( not ( = ?AUTO_2763 ?AUTO_2766 ) ) ( not ( = ?AUTO_2762 ?AUTO_2765 ) ) ( not ( = ?AUTO_2763 ?AUTO_2765 ) ) ( not ( = ?AUTO_2766 ?AUTO_2765 ) ) ( ON ?AUTO_2765 ?AUTO_2762 ) ( CLEAR ?AUTO_2768 ) ( not ( = ?AUTO_2762 ?AUTO_2764 ) ) ( not ( = ?AUTO_2762 ?AUTO_2768 ) ) ( not ( = ?AUTO_2763 ?AUTO_2764 ) ) ( not ( = ?AUTO_2763 ?AUTO_2768 ) ) ( not ( = ?AUTO_2766 ?AUTO_2764 ) ) ( not ( = ?AUTO_2766 ?AUTO_2768 ) ) ( not ( = ?AUTO_2765 ?AUTO_2764 ) ) ( not ( = ?AUTO_2765 ?AUTO_2768 ) ) ( not ( = ?AUTO_2764 ?AUTO_2768 ) ) ( not ( = ?AUTO_2762 ?AUTO_2767 ) ) ( not ( = ?AUTO_2763 ?AUTO_2767 ) ) ( not ( = ?AUTO_2766 ?AUTO_2767 ) ) ( not ( = ?AUTO_2765 ?AUTO_2767 ) ) ( not ( = ?AUTO_2768 ?AUTO_2767 ) ) ( not ( = ?AUTO_2764 ?AUTO_2767 ) ) ( ON ?AUTO_2767 ?AUTO_2765 ) ( CLEAR ?AUTO_2763 ) ( ON ?AUTO_2764 ?AUTO_2767 ) ( CLEAR ?AUTO_2764 ) ( HOLDING ?AUTO_2769 ) ( not ( = ?AUTO_2762 ?AUTO_2769 ) ) ( not ( = ?AUTO_2763 ?AUTO_2769 ) ) ( not ( = ?AUTO_2766 ?AUTO_2769 ) ) ( not ( = ?AUTO_2765 ?AUTO_2769 ) ) ( not ( = ?AUTO_2768 ?AUTO_2769 ) ) ( not ( = ?AUTO_2764 ?AUTO_2769 ) ) ( not ( = ?AUTO_2767 ?AUTO_2769 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2769 )
      ( MAKE-ON ?AUTO_2762 ?AUTO_2763 )
      ( MAKE-ON-VERIFY ?AUTO_2762 ?AUTO_2763 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2770 - BLOCK
      ?AUTO_2771 - BLOCK
    )
    :vars
    (
      ?AUTO_2774 - BLOCK
      ?AUTO_2773 - BLOCK
      ?AUTO_2775 - BLOCK
      ?AUTO_2772 - BLOCK
      ?AUTO_2776 - BLOCK
      ?AUTO_2777 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2770 ?AUTO_2771 ) ) ( ON ?AUTO_2770 ?AUTO_2774 ) ( not ( = ?AUTO_2770 ?AUTO_2774 ) ) ( not ( = ?AUTO_2771 ?AUTO_2774 ) ) ( not ( = ?AUTO_2770 ?AUTO_2773 ) ) ( not ( = ?AUTO_2771 ?AUTO_2773 ) ) ( not ( = ?AUTO_2774 ?AUTO_2773 ) ) ( ON ?AUTO_2773 ?AUTO_2770 ) ( CLEAR ?AUTO_2775 ) ( not ( = ?AUTO_2770 ?AUTO_2772 ) ) ( not ( = ?AUTO_2770 ?AUTO_2775 ) ) ( not ( = ?AUTO_2771 ?AUTO_2772 ) ) ( not ( = ?AUTO_2771 ?AUTO_2775 ) ) ( not ( = ?AUTO_2774 ?AUTO_2772 ) ) ( not ( = ?AUTO_2774 ?AUTO_2775 ) ) ( not ( = ?AUTO_2773 ?AUTO_2772 ) ) ( not ( = ?AUTO_2773 ?AUTO_2775 ) ) ( not ( = ?AUTO_2772 ?AUTO_2775 ) ) ( not ( = ?AUTO_2770 ?AUTO_2776 ) ) ( not ( = ?AUTO_2771 ?AUTO_2776 ) ) ( not ( = ?AUTO_2774 ?AUTO_2776 ) ) ( not ( = ?AUTO_2773 ?AUTO_2776 ) ) ( not ( = ?AUTO_2775 ?AUTO_2776 ) ) ( not ( = ?AUTO_2772 ?AUTO_2776 ) ) ( ON ?AUTO_2776 ?AUTO_2773 ) ( ON ?AUTO_2772 ?AUTO_2776 ) ( CLEAR ?AUTO_2772 ) ( not ( = ?AUTO_2770 ?AUTO_2777 ) ) ( not ( = ?AUTO_2771 ?AUTO_2777 ) ) ( not ( = ?AUTO_2774 ?AUTO_2777 ) ) ( not ( = ?AUTO_2773 ?AUTO_2777 ) ) ( not ( = ?AUTO_2775 ?AUTO_2777 ) ) ( not ( = ?AUTO_2772 ?AUTO_2777 ) ) ( not ( = ?AUTO_2776 ?AUTO_2777 ) ) ( ON ?AUTO_2777 ?AUTO_2771 ) ( CLEAR ?AUTO_2777 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2777 ?AUTO_2771 )
      ( MAKE-ON ?AUTO_2770 ?AUTO_2771 )
      ( MAKE-ON-VERIFY ?AUTO_2770 ?AUTO_2771 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2778 - BLOCK
      ?AUTO_2779 - BLOCK
    )
    :vars
    (
      ?AUTO_2783 - BLOCK
      ?AUTO_2781 - BLOCK
      ?AUTO_2782 - BLOCK
      ?AUTO_2780 - BLOCK
      ?AUTO_2784 - BLOCK
      ?AUTO_2785 - BLOCK
      ?AUTO_2786 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2778 ?AUTO_2779 ) ) ( ON ?AUTO_2778 ?AUTO_2783 ) ( not ( = ?AUTO_2778 ?AUTO_2783 ) ) ( not ( = ?AUTO_2779 ?AUTO_2783 ) ) ( not ( = ?AUTO_2778 ?AUTO_2781 ) ) ( not ( = ?AUTO_2779 ?AUTO_2781 ) ) ( not ( = ?AUTO_2783 ?AUTO_2781 ) ) ( ON ?AUTO_2781 ?AUTO_2778 ) ( CLEAR ?AUTO_2782 ) ( not ( = ?AUTO_2778 ?AUTO_2780 ) ) ( not ( = ?AUTO_2778 ?AUTO_2782 ) ) ( not ( = ?AUTO_2779 ?AUTO_2780 ) ) ( not ( = ?AUTO_2779 ?AUTO_2782 ) ) ( not ( = ?AUTO_2783 ?AUTO_2780 ) ) ( not ( = ?AUTO_2783 ?AUTO_2782 ) ) ( not ( = ?AUTO_2781 ?AUTO_2780 ) ) ( not ( = ?AUTO_2781 ?AUTO_2782 ) ) ( not ( = ?AUTO_2780 ?AUTO_2782 ) ) ( not ( = ?AUTO_2778 ?AUTO_2784 ) ) ( not ( = ?AUTO_2779 ?AUTO_2784 ) ) ( not ( = ?AUTO_2783 ?AUTO_2784 ) ) ( not ( = ?AUTO_2781 ?AUTO_2784 ) ) ( not ( = ?AUTO_2782 ?AUTO_2784 ) ) ( not ( = ?AUTO_2780 ?AUTO_2784 ) ) ( ON ?AUTO_2784 ?AUTO_2781 ) ( ON ?AUTO_2780 ?AUTO_2784 ) ( CLEAR ?AUTO_2780 ) ( not ( = ?AUTO_2778 ?AUTO_2785 ) ) ( not ( = ?AUTO_2779 ?AUTO_2785 ) ) ( not ( = ?AUTO_2783 ?AUTO_2785 ) ) ( not ( = ?AUTO_2781 ?AUTO_2785 ) ) ( not ( = ?AUTO_2782 ?AUTO_2785 ) ) ( not ( = ?AUTO_2780 ?AUTO_2785 ) ) ( not ( = ?AUTO_2784 ?AUTO_2785 ) ) ( ON ?AUTO_2785 ?AUTO_2779 ) ( CLEAR ?AUTO_2785 ) ( HOLDING ?AUTO_2786 ) ( not ( = ?AUTO_2778 ?AUTO_2786 ) ) ( not ( = ?AUTO_2779 ?AUTO_2786 ) ) ( not ( = ?AUTO_2783 ?AUTO_2786 ) ) ( not ( = ?AUTO_2781 ?AUTO_2786 ) ) ( not ( = ?AUTO_2782 ?AUTO_2786 ) ) ( not ( = ?AUTO_2780 ?AUTO_2786 ) ) ( not ( = ?AUTO_2784 ?AUTO_2786 ) ) ( not ( = ?AUTO_2785 ?AUTO_2786 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2786 )
      ( MAKE-ON ?AUTO_2778 ?AUTO_2779 )
      ( MAKE-ON-VERIFY ?AUTO_2778 ?AUTO_2779 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2787 - BLOCK
      ?AUTO_2788 - BLOCK
    )
    :vars
    (
      ?AUTO_2793 - BLOCK
      ?AUTO_2795 - BLOCK
      ?AUTO_2794 - BLOCK
      ?AUTO_2791 - BLOCK
      ?AUTO_2789 - BLOCK
      ?AUTO_2792 - BLOCK
      ?AUTO_2790 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2787 ?AUTO_2788 ) ) ( ON ?AUTO_2787 ?AUTO_2793 ) ( not ( = ?AUTO_2787 ?AUTO_2793 ) ) ( not ( = ?AUTO_2788 ?AUTO_2793 ) ) ( not ( = ?AUTO_2787 ?AUTO_2795 ) ) ( not ( = ?AUTO_2788 ?AUTO_2795 ) ) ( not ( = ?AUTO_2793 ?AUTO_2795 ) ) ( ON ?AUTO_2795 ?AUTO_2787 ) ( CLEAR ?AUTO_2794 ) ( not ( = ?AUTO_2787 ?AUTO_2791 ) ) ( not ( = ?AUTO_2787 ?AUTO_2794 ) ) ( not ( = ?AUTO_2788 ?AUTO_2791 ) ) ( not ( = ?AUTO_2788 ?AUTO_2794 ) ) ( not ( = ?AUTO_2793 ?AUTO_2791 ) ) ( not ( = ?AUTO_2793 ?AUTO_2794 ) ) ( not ( = ?AUTO_2795 ?AUTO_2791 ) ) ( not ( = ?AUTO_2795 ?AUTO_2794 ) ) ( not ( = ?AUTO_2791 ?AUTO_2794 ) ) ( not ( = ?AUTO_2787 ?AUTO_2789 ) ) ( not ( = ?AUTO_2788 ?AUTO_2789 ) ) ( not ( = ?AUTO_2793 ?AUTO_2789 ) ) ( not ( = ?AUTO_2795 ?AUTO_2789 ) ) ( not ( = ?AUTO_2794 ?AUTO_2789 ) ) ( not ( = ?AUTO_2791 ?AUTO_2789 ) ) ( ON ?AUTO_2789 ?AUTO_2795 ) ( ON ?AUTO_2791 ?AUTO_2789 ) ( CLEAR ?AUTO_2791 ) ( not ( = ?AUTO_2787 ?AUTO_2792 ) ) ( not ( = ?AUTO_2788 ?AUTO_2792 ) ) ( not ( = ?AUTO_2793 ?AUTO_2792 ) ) ( not ( = ?AUTO_2795 ?AUTO_2792 ) ) ( not ( = ?AUTO_2794 ?AUTO_2792 ) ) ( not ( = ?AUTO_2791 ?AUTO_2792 ) ) ( not ( = ?AUTO_2789 ?AUTO_2792 ) ) ( ON ?AUTO_2792 ?AUTO_2788 ) ( not ( = ?AUTO_2787 ?AUTO_2790 ) ) ( not ( = ?AUTO_2788 ?AUTO_2790 ) ) ( not ( = ?AUTO_2793 ?AUTO_2790 ) ) ( not ( = ?AUTO_2795 ?AUTO_2790 ) ) ( not ( = ?AUTO_2794 ?AUTO_2790 ) ) ( not ( = ?AUTO_2791 ?AUTO_2790 ) ) ( not ( = ?AUTO_2789 ?AUTO_2790 ) ) ( not ( = ?AUTO_2792 ?AUTO_2790 ) ) ( ON ?AUTO_2790 ?AUTO_2792 ) ( CLEAR ?AUTO_2790 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2790 ?AUTO_2792 )
      ( MAKE-ON ?AUTO_2787 ?AUTO_2788 )
      ( MAKE-ON-VERIFY ?AUTO_2787 ?AUTO_2788 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2796 - BLOCK
      ?AUTO_2797 - BLOCK
    )
    :vars
    (
      ?AUTO_2803 - BLOCK
      ?AUTO_2799 - BLOCK
      ?AUTO_2798 - BLOCK
      ?AUTO_2800 - BLOCK
      ?AUTO_2802 - BLOCK
      ?AUTO_2804 - BLOCK
      ?AUTO_2801 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2796 ?AUTO_2797 ) ) ( ON ?AUTO_2796 ?AUTO_2803 ) ( not ( = ?AUTO_2796 ?AUTO_2803 ) ) ( not ( = ?AUTO_2797 ?AUTO_2803 ) ) ( not ( = ?AUTO_2796 ?AUTO_2799 ) ) ( not ( = ?AUTO_2797 ?AUTO_2799 ) ) ( not ( = ?AUTO_2803 ?AUTO_2799 ) ) ( ON ?AUTO_2799 ?AUTO_2796 ) ( not ( = ?AUTO_2796 ?AUTO_2798 ) ) ( not ( = ?AUTO_2796 ?AUTO_2800 ) ) ( not ( = ?AUTO_2797 ?AUTO_2798 ) ) ( not ( = ?AUTO_2797 ?AUTO_2800 ) ) ( not ( = ?AUTO_2803 ?AUTO_2798 ) ) ( not ( = ?AUTO_2803 ?AUTO_2800 ) ) ( not ( = ?AUTO_2799 ?AUTO_2798 ) ) ( not ( = ?AUTO_2799 ?AUTO_2800 ) ) ( not ( = ?AUTO_2798 ?AUTO_2800 ) ) ( not ( = ?AUTO_2796 ?AUTO_2802 ) ) ( not ( = ?AUTO_2797 ?AUTO_2802 ) ) ( not ( = ?AUTO_2803 ?AUTO_2802 ) ) ( not ( = ?AUTO_2799 ?AUTO_2802 ) ) ( not ( = ?AUTO_2800 ?AUTO_2802 ) ) ( not ( = ?AUTO_2798 ?AUTO_2802 ) ) ( ON ?AUTO_2802 ?AUTO_2799 ) ( ON ?AUTO_2798 ?AUTO_2802 ) ( CLEAR ?AUTO_2798 ) ( not ( = ?AUTO_2796 ?AUTO_2804 ) ) ( not ( = ?AUTO_2797 ?AUTO_2804 ) ) ( not ( = ?AUTO_2803 ?AUTO_2804 ) ) ( not ( = ?AUTO_2799 ?AUTO_2804 ) ) ( not ( = ?AUTO_2800 ?AUTO_2804 ) ) ( not ( = ?AUTO_2798 ?AUTO_2804 ) ) ( not ( = ?AUTO_2802 ?AUTO_2804 ) ) ( ON ?AUTO_2804 ?AUTO_2797 ) ( not ( = ?AUTO_2796 ?AUTO_2801 ) ) ( not ( = ?AUTO_2797 ?AUTO_2801 ) ) ( not ( = ?AUTO_2803 ?AUTO_2801 ) ) ( not ( = ?AUTO_2799 ?AUTO_2801 ) ) ( not ( = ?AUTO_2800 ?AUTO_2801 ) ) ( not ( = ?AUTO_2798 ?AUTO_2801 ) ) ( not ( = ?AUTO_2802 ?AUTO_2801 ) ) ( not ( = ?AUTO_2804 ?AUTO_2801 ) ) ( ON ?AUTO_2801 ?AUTO_2804 ) ( CLEAR ?AUTO_2801 ) ( HOLDING ?AUTO_2800 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2800 )
      ( MAKE-ON ?AUTO_2796 ?AUTO_2797 )
      ( MAKE-ON-VERIFY ?AUTO_2796 ?AUTO_2797 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2805 - BLOCK
      ?AUTO_2806 - BLOCK
    )
    :vars
    (
      ?AUTO_2810 - BLOCK
      ?AUTO_2812 - BLOCK
      ?AUTO_2811 - BLOCK
      ?AUTO_2809 - BLOCK
      ?AUTO_2807 - BLOCK
      ?AUTO_2813 - BLOCK
      ?AUTO_2808 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2805 ?AUTO_2806 ) ) ( ON ?AUTO_2805 ?AUTO_2810 ) ( not ( = ?AUTO_2805 ?AUTO_2810 ) ) ( not ( = ?AUTO_2806 ?AUTO_2810 ) ) ( not ( = ?AUTO_2805 ?AUTO_2812 ) ) ( not ( = ?AUTO_2806 ?AUTO_2812 ) ) ( not ( = ?AUTO_2810 ?AUTO_2812 ) ) ( ON ?AUTO_2812 ?AUTO_2805 ) ( not ( = ?AUTO_2805 ?AUTO_2811 ) ) ( not ( = ?AUTO_2805 ?AUTO_2809 ) ) ( not ( = ?AUTO_2806 ?AUTO_2811 ) ) ( not ( = ?AUTO_2806 ?AUTO_2809 ) ) ( not ( = ?AUTO_2810 ?AUTO_2811 ) ) ( not ( = ?AUTO_2810 ?AUTO_2809 ) ) ( not ( = ?AUTO_2812 ?AUTO_2811 ) ) ( not ( = ?AUTO_2812 ?AUTO_2809 ) ) ( not ( = ?AUTO_2811 ?AUTO_2809 ) ) ( not ( = ?AUTO_2805 ?AUTO_2807 ) ) ( not ( = ?AUTO_2806 ?AUTO_2807 ) ) ( not ( = ?AUTO_2810 ?AUTO_2807 ) ) ( not ( = ?AUTO_2812 ?AUTO_2807 ) ) ( not ( = ?AUTO_2809 ?AUTO_2807 ) ) ( not ( = ?AUTO_2811 ?AUTO_2807 ) ) ( ON ?AUTO_2807 ?AUTO_2812 ) ( ON ?AUTO_2811 ?AUTO_2807 ) ( CLEAR ?AUTO_2811 ) ( not ( = ?AUTO_2805 ?AUTO_2813 ) ) ( not ( = ?AUTO_2806 ?AUTO_2813 ) ) ( not ( = ?AUTO_2810 ?AUTO_2813 ) ) ( not ( = ?AUTO_2812 ?AUTO_2813 ) ) ( not ( = ?AUTO_2809 ?AUTO_2813 ) ) ( not ( = ?AUTO_2811 ?AUTO_2813 ) ) ( not ( = ?AUTO_2807 ?AUTO_2813 ) ) ( ON ?AUTO_2813 ?AUTO_2806 ) ( not ( = ?AUTO_2805 ?AUTO_2808 ) ) ( not ( = ?AUTO_2806 ?AUTO_2808 ) ) ( not ( = ?AUTO_2810 ?AUTO_2808 ) ) ( not ( = ?AUTO_2812 ?AUTO_2808 ) ) ( not ( = ?AUTO_2809 ?AUTO_2808 ) ) ( not ( = ?AUTO_2811 ?AUTO_2808 ) ) ( not ( = ?AUTO_2807 ?AUTO_2808 ) ) ( not ( = ?AUTO_2813 ?AUTO_2808 ) ) ( ON ?AUTO_2808 ?AUTO_2813 ) ( ON ?AUTO_2809 ?AUTO_2808 ) ( CLEAR ?AUTO_2809 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2809 ?AUTO_2808 )
      ( MAKE-ON ?AUTO_2805 ?AUTO_2806 )
      ( MAKE-ON-VERIFY ?AUTO_2805 ?AUTO_2806 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2816 - BLOCK
      ?AUTO_2817 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2816 ) ( CLEAR ?AUTO_2817 ) ( not ( = ?AUTO_2816 ?AUTO_2817 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2816 ?AUTO_2817 )
      ( MAKE-ON-VERIFY ?AUTO_2816 ?AUTO_2817 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2818 - BLOCK
      ?AUTO_2819 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2819 ) ( not ( = ?AUTO_2818 ?AUTO_2819 ) ) ( ON-TABLE ?AUTO_2818 ) ( CLEAR ?AUTO_2818 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_2818 )
      ( MAKE-ON ?AUTO_2818 ?AUTO_2819 )
      ( MAKE-ON-VERIFY ?AUTO_2818 ?AUTO_2819 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2820 - BLOCK
      ?AUTO_2821 - BLOCK
    )
    :vars
    (
      ?AUTO_2822 - BLOCK
      ?AUTO_2823 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2821 ) ( not ( = ?AUTO_2820 ?AUTO_2821 ) ) ( ON-TABLE ?AUTO_2820 ) ( CLEAR ?AUTO_2820 ) ( HOLDING ?AUTO_2822 ) ( CLEAR ?AUTO_2823 ) ( not ( = ?AUTO_2820 ?AUTO_2822 ) ) ( not ( = ?AUTO_2820 ?AUTO_2823 ) ) ( not ( = ?AUTO_2821 ?AUTO_2822 ) ) ( not ( = ?AUTO_2821 ?AUTO_2823 ) ) ( not ( = ?AUTO_2822 ?AUTO_2823 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2822 ?AUTO_2823 )
      ( MAKE-ON ?AUTO_2820 ?AUTO_2821 )
      ( MAKE-ON-VERIFY ?AUTO_2820 ?AUTO_2821 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2824 - BLOCK
      ?AUTO_2825 - BLOCK
    )
    :vars
    (
      ?AUTO_2826 - BLOCK
      ?AUTO_2827 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2825 ) ( not ( = ?AUTO_2824 ?AUTO_2825 ) ) ( ON-TABLE ?AUTO_2824 ) ( CLEAR ?AUTO_2826 ) ( not ( = ?AUTO_2824 ?AUTO_2827 ) ) ( not ( = ?AUTO_2824 ?AUTO_2826 ) ) ( not ( = ?AUTO_2825 ?AUTO_2827 ) ) ( not ( = ?AUTO_2825 ?AUTO_2826 ) ) ( not ( = ?AUTO_2827 ?AUTO_2826 ) ) ( ON ?AUTO_2827 ?AUTO_2824 ) ( CLEAR ?AUTO_2827 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2827 ?AUTO_2824 )
      ( MAKE-ON ?AUTO_2824 ?AUTO_2825 )
      ( MAKE-ON-VERIFY ?AUTO_2824 ?AUTO_2825 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2828 - BLOCK
      ?AUTO_2829 - BLOCK
    )
    :vars
    (
      ?AUTO_2831 - BLOCK
      ?AUTO_2830 - BLOCK
      ?AUTO_2832 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2829 ) ( not ( = ?AUTO_2828 ?AUTO_2829 ) ) ( ON-TABLE ?AUTO_2828 ) ( CLEAR ?AUTO_2831 ) ( not ( = ?AUTO_2828 ?AUTO_2830 ) ) ( not ( = ?AUTO_2828 ?AUTO_2831 ) ) ( not ( = ?AUTO_2829 ?AUTO_2830 ) ) ( not ( = ?AUTO_2829 ?AUTO_2831 ) ) ( not ( = ?AUTO_2830 ?AUTO_2831 ) ) ( ON ?AUTO_2830 ?AUTO_2828 ) ( CLEAR ?AUTO_2830 ) ( HOLDING ?AUTO_2832 ) ( not ( = ?AUTO_2828 ?AUTO_2832 ) ) ( not ( = ?AUTO_2829 ?AUTO_2832 ) ) ( not ( = ?AUTO_2831 ?AUTO_2832 ) ) ( not ( = ?AUTO_2830 ?AUTO_2832 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2832 )
      ( MAKE-ON ?AUTO_2828 ?AUTO_2829 )
      ( MAKE-ON-VERIFY ?AUTO_2828 ?AUTO_2829 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2833 - BLOCK
      ?AUTO_2834 - BLOCK
    )
    :vars
    (
      ?AUTO_2837 - BLOCK
      ?AUTO_2836 - BLOCK
      ?AUTO_2835 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2834 ) ( not ( = ?AUTO_2833 ?AUTO_2834 ) ) ( ON-TABLE ?AUTO_2833 ) ( CLEAR ?AUTO_2837 ) ( not ( = ?AUTO_2833 ?AUTO_2836 ) ) ( not ( = ?AUTO_2833 ?AUTO_2837 ) ) ( not ( = ?AUTO_2834 ?AUTO_2836 ) ) ( not ( = ?AUTO_2834 ?AUTO_2837 ) ) ( not ( = ?AUTO_2836 ?AUTO_2837 ) ) ( ON ?AUTO_2836 ?AUTO_2833 ) ( not ( = ?AUTO_2833 ?AUTO_2835 ) ) ( not ( = ?AUTO_2834 ?AUTO_2835 ) ) ( not ( = ?AUTO_2837 ?AUTO_2835 ) ) ( not ( = ?AUTO_2836 ?AUTO_2835 ) ) ( ON ?AUTO_2835 ?AUTO_2836 ) ( CLEAR ?AUTO_2835 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2835 ?AUTO_2836 )
      ( MAKE-ON ?AUTO_2833 ?AUTO_2834 )
      ( MAKE-ON-VERIFY ?AUTO_2833 ?AUTO_2834 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2838 - BLOCK
      ?AUTO_2839 - BLOCK
    )
    :vars
    (
      ?AUTO_2842 - BLOCK
      ?AUTO_2840 - BLOCK
      ?AUTO_2841 - BLOCK
      ?AUTO_2843 - BLOCK
      ?AUTO_2844 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2839 ) ( not ( = ?AUTO_2838 ?AUTO_2839 ) ) ( ON-TABLE ?AUTO_2838 ) ( CLEAR ?AUTO_2842 ) ( not ( = ?AUTO_2838 ?AUTO_2840 ) ) ( not ( = ?AUTO_2838 ?AUTO_2842 ) ) ( not ( = ?AUTO_2839 ?AUTO_2840 ) ) ( not ( = ?AUTO_2839 ?AUTO_2842 ) ) ( not ( = ?AUTO_2840 ?AUTO_2842 ) ) ( ON ?AUTO_2840 ?AUTO_2838 ) ( not ( = ?AUTO_2838 ?AUTO_2841 ) ) ( not ( = ?AUTO_2839 ?AUTO_2841 ) ) ( not ( = ?AUTO_2842 ?AUTO_2841 ) ) ( not ( = ?AUTO_2840 ?AUTO_2841 ) ) ( ON ?AUTO_2841 ?AUTO_2840 ) ( CLEAR ?AUTO_2841 ) ( HOLDING ?AUTO_2843 ) ( CLEAR ?AUTO_2844 ) ( not ( = ?AUTO_2838 ?AUTO_2843 ) ) ( not ( = ?AUTO_2838 ?AUTO_2844 ) ) ( not ( = ?AUTO_2839 ?AUTO_2843 ) ) ( not ( = ?AUTO_2839 ?AUTO_2844 ) ) ( not ( = ?AUTO_2842 ?AUTO_2843 ) ) ( not ( = ?AUTO_2842 ?AUTO_2844 ) ) ( not ( = ?AUTO_2840 ?AUTO_2843 ) ) ( not ( = ?AUTO_2840 ?AUTO_2844 ) ) ( not ( = ?AUTO_2841 ?AUTO_2843 ) ) ( not ( = ?AUTO_2841 ?AUTO_2844 ) ) ( not ( = ?AUTO_2843 ?AUTO_2844 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2843 ?AUTO_2844 )
      ( MAKE-ON ?AUTO_2838 ?AUTO_2839 )
      ( MAKE-ON-VERIFY ?AUTO_2838 ?AUTO_2839 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2845 - BLOCK
      ?AUTO_2846 - BLOCK
    )
    :vars
    (
      ?AUTO_2848 - BLOCK
      ?AUTO_2847 - BLOCK
      ?AUTO_2849 - BLOCK
      ?AUTO_2850 - BLOCK
      ?AUTO_2851 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2846 ) ( not ( = ?AUTO_2845 ?AUTO_2846 ) ) ( ON-TABLE ?AUTO_2845 ) ( CLEAR ?AUTO_2848 ) ( not ( = ?AUTO_2845 ?AUTO_2847 ) ) ( not ( = ?AUTO_2845 ?AUTO_2848 ) ) ( not ( = ?AUTO_2846 ?AUTO_2847 ) ) ( not ( = ?AUTO_2846 ?AUTO_2848 ) ) ( not ( = ?AUTO_2847 ?AUTO_2848 ) ) ( ON ?AUTO_2847 ?AUTO_2845 ) ( not ( = ?AUTO_2845 ?AUTO_2849 ) ) ( not ( = ?AUTO_2846 ?AUTO_2849 ) ) ( not ( = ?AUTO_2848 ?AUTO_2849 ) ) ( not ( = ?AUTO_2847 ?AUTO_2849 ) ) ( ON ?AUTO_2849 ?AUTO_2847 ) ( CLEAR ?AUTO_2850 ) ( not ( = ?AUTO_2845 ?AUTO_2851 ) ) ( not ( = ?AUTO_2845 ?AUTO_2850 ) ) ( not ( = ?AUTO_2846 ?AUTO_2851 ) ) ( not ( = ?AUTO_2846 ?AUTO_2850 ) ) ( not ( = ?AUTO_2848 ?AUTO_2851 ) ) ( not ( = ?AUTO_2848 ?AUTO_2850 ) ) ( not ( = ?AUTO_2847 ?AUTO_2851 ) ) ( not ( = ?AUTO_2847 ?AUTO_2850 ) ) ( not ( = ?AUTO_2849 ?AUTO_2851 ) ) ( not ( = ?AUTO_2849 ?AUTO_2850 ) ) ( not ( = ?AUTO_2851 ?AUTO_2850 ) ) ( ON ?AUTO_2851 ?AUTO_2849 ) ( CLEAR ?AUTO_2851 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2851 ?AUTO_2849 )
      ( MAKE-ON ?AUTO_2845 ?AUTO_2846 )
      ( MAKE-ON-VERIFY ?AUTO_2845 ?AUTO_2846 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2852 - BLOCK
      ?AUTO_2853 - BLOCK
    )
    :vars
    (
      ?AUTO_2854 - BLOCK
      ?AUTO_2855 - BLOCK
      ?AUTO_2856 - BLOCK
      ?AUTO_2857 - BLOCK
      ?AUTO_2858 - BLOCK
      ?AUTO_2859 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2853 ) ( not ( = ?AUTO_2852 ?AUTO_2853 ) ) ( ON-TABLE ?AUTO_2852 ) ( not ( = ?AUTO_2852 ?AUTO_2854 ) ) ( not ( = ?AUTO_2852 ?AUTO_2855 ) ) ( not ( = ?AUTO_2853 ?AUTO_2854 ) ) ( not ( = ?AUTO_2853 ?AUTO_2855 ) ) ( not ( = ?AUTO_2854 ?AUTO_2855 ) ) ( ON ?AUTO_2854 ?AUTO_2852 ) ( not ( = ?AUTO_2852 ?AUTO_2856 ) ) ( not ( = ?AUTO_2853 ?AUTO_2856 ) ) ( not ( = ?AUTO_2855 ?AUTO_2856 ) ) ( not ( = ?AUTO_2854 ?AUTO_2856 ) ) ( ON ?AUTO_2856 ?AUTO_2854 ) ( CLEAR ?AUTO_2857 ) ( not ( = ?AUTO_2852 ?AUTO_2858 ) ) ( not ( = ?AUTO_2852 ?AUTO_2857 ) ) ( not ( = ?AUTO_2853 ?AUTO_2858 ) ) ( not ( = ?AUTO_2853 ?AUTO_2857 ) ) ( not ( = ?AUTO_2855 ?AUTO_2858 ) ) ( not ( = ?AUTO_2855 ?AUTO_2857 ) ) ( not ( = ?AUTO_2854 ?AUTO_2858 ) ) ( not ( = ?AUTO_2854 ?AUTO_2857 ) ) ( not ( = ?AUTO_2856 ?AUTO_2858 ) ) ( not ( = ?AUTO_2856 ?AUTO_2857 ) ) ( not ( = ?AUTO_2858 ?AUTO_2857 ) ) ( ON ?AUTO_2858 ?AUTO_2856 ) ( CLEAR ?AUTO_2858 ) ( HOLDING ?AUTO_2855 ) ( CLEAR ?AUTO_2859 ) ( not ( = ?AUTO_2852 ?AUTO_2859 ) ) ( not ( = ?AUTO_2853 ?AUTO_2859 ) ) ( not ( = ?AUTO_2854 ?AUTO_2859 ) ) ( not ( = ?AUTO_2855 ?AUTO_2859 ) ) ( not ( = ?AUTO_2856 ?AUTO_2859 ) ) ( not ( = ?AUTO_2857 ?AUTO_2859 ) ) ( not ( = ?AUTO_2858 ?AUTO_2859 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2855 ?AUTO_2859 )
      ( MAKE-ON ?AUTO_2852 ?AUTO_2853 )
      ( MAKE-ON-VERIFY ?AUTO_2852 ?AUTO_2853 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2880 - BLOCK
      ?AUTO_2881 - BLOCK
    )
    :vars
    (
      ?AUTO_2885 - BLOCK
      ?AUTO_2886 - BLOCK
      ?AUTO_2887 - BLOCK
      ?AUTO_2884 - BLOCK
      ?AUTO_2882 - BLOCK
      ?AUTO_2883 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2881 ) ( not ( = ?AUTO_2880 ?AUTO_2881 ) ) ( ON-TABLE ?AUTO_2880 ) ( not ( = ?AUTO_2880 ?AUTO_2885 ) ) ( not ( = ?AUTO_2880 ?AUTO_2886 ) ) ( not ( = ?AUTO_2881 ?AUTO_2885 ) ) ( not ( = ?AUTO_2881 ?AUTO_2886 ) ) ( not ( = ?AUTO_2885 ?AUTO_2886 ) ) ( ON ?AUTO_2885 ?AUTO_2880 ) ( not ( = ?AUTO_2880 ?AUTO_2887 ) ) ( not ( = ?AUTO_2881 ?AUTO_2887 ) ) ( not ( = ?AUTO_2886 ?AUTO_2887 ) ) ( not ( = ?AUTO_2885 ?AUTO_2887 ) ) ( ON ?AUTO_2887 ?AUTO_2885 ) ( CLEAR ?AUTO_2884 ) ( not ( = ?AUTO_2880 ?AUTO_2882 ) ) ( not ( = ?AUTO_2880 ?AUTO_2884 ) ) ( not ( = ?AUTO_2881 ?AUTO_2882 ) ) ( not ( = ?AUTO_2881 ?AUTO_2884 ) ) ( not ( = ?AUTO_2886 ?AUTO_2882 ) ) ( not ( = ?AUTO_2886 ?AUTO_2884 ) ) ( not ( = ?AUTO_2885 ?AUTO_2882 ) ) ( not ( = ?AUTO_2885 ?AUTO_2884 ) ) ( not ( = ?AUTO_2887 ?AUTO_2882 ) ) ( not ( = ?AUTO_2887 ?AUTO_2884 ) ) ( not ( = ?AUTO_2882 ?AUTO_2884 ) ) ( ON ?AUTO_2882 ?AUTO_2887 ) ( CLEAR ?AUTO_2883 ) ( not ( = ?AUTO_2880 ?AUTO_2883 ) ) ( not ( = ?AUTO_2881 ?AUTO_2883 ) ) ( not ( = ?AUTO_2885 ?AUTO_2883 ) ) ( not ( = ?AUTO_2886 ?AUTO_2883 ) ) ( not ( = ?AUTO_2887 ?AUTO_2883 ) ) ( not ( = ?AUTO_2884 ?AUTO_2883 ) ) ( not ( = ?AUTO_2882 ?AUTO_2883 ) ) ( ON ?AUTO_2886 ?AUTO_2882 ) ( CLEAR ?AUTO_2886 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2886 ?AUTO_2882 )
      ( MAKE-ON ?AUTO_2880 ?AUTO_2881 )
      ( MAKE-ON-VERIFY ?AUTO_2880 ?AUTO_2881 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2888 - BLOCK
      ?AUTO_2889 - BLOCK
    )
    :vars
    (
      ?AUTO_2893 - BLOCK
      ?AUTO_2895 - BLOCK
      ?AUTO_2891 - BLOCK
      ?AUTO_2894 - BLOCK
      ?AUTO_2892 - BLOCK
      ?AUTO_2890 - BLOCK
      ?AUTO_2896 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2889 ) ( not ( = ?AUTO_2888 ?AUTO_2889 ) ) ( ON-TABLE ?AUTO_2888 ) ( not ( = ?AUTO_2888 ?AUTO_2893 ) ) ( not ( = ?AUTO_2888 ?AUTO_2895 ) ) ( not ( = ?AUTO_2889 ?AUTO_2893 ) ) ( not ( = ?AUTO_2889 ?AUTO_2895 ) ) ( not ( = ?AUTO_2893 ?AUTO_2895 ) ) ( ON ?AUTO_2893 ?AUTO_2888 ) ( not ( = ?AUTO_2888 ?AUTO_2891 ) ) ( not ( = ?AUTO_2889 ?AUTO_2891 ) ) ( not ( = ?AUTO_2895 ?AUTO_2891 ) ) ( not ( = ?AUTO_2893 ?AUTO_2891 ) ) ( ON ?AUTO_2891 ?AUTO_2893 ) ( CLEAR ?AUTO_2894 ) ( not ( = ?AUTO_2888 ?AUTO_2892 ) ) ( not ( = ?AUTO_2888 ?AUTO_2894 ) ) ( not ( = ?AUTO_2889 ?AUTO_2892 ) ) ( not ( = ?AUTO_2889 ?AUTO_2894 ) ) ( not ( = ?AUTO_2895 ?AUTO_2892 ) ) ( not ( = ?AUTO_2895 ?AUTO_2894 ) ) ( not ( = ?AUTO_2893 ?AUTO_2892 ) ) ( not ( = ?AUTO_2893 ?AUTO_2894 ) ) ( not ( = ?AUTO_2891 ?AUTO_2892 ) ) ( not ( = ?AUTO_2891 ?AUTO_2894 ) ) ( not ( = ?AUTO_2892 ?AUTO_2894 ) ) ( ON ?AUTO_2892 ?AUTO_2891 ) ( CLEAR ?AUTO_2890 ) ( not ( = ?AUTO_2888 ?AUTO_2890 ) ) ( not ( = ?AUTO_2889 ?AUTO_2890 ) ) ( not ( = ?AUTO_2893 ?AUTO_2890 ) ) ( not ( = ?AUTO_2895 ?AUTO_2890 ) ) ( not ( = ?AUTO_2891 ?AUTO_2890 ) ) ( not ( = ?AUTO_2894 ?AUTO_2890 ) ) ( not ( = ?AUTO_2892 ?AUTO_2890 ) ) ( ON ?AUTO_2895 ?AUTO_2892 ) ( CLEAR ?AUTO_2895 ) ( HOLDING ?AUTO_2896 ) ( not ( = ?AUTO_2888 ?AUTO_2896 ) ) ( not ( = ?AUTO_2889 ?AUTO_2896 ) ) ( not ( = ?AUTO_2893 ?AUTO_2896 ) ) ( not ( = ?AUTO_2895 ?AUTO_2896 ) ) ( not ( = ?AUTO_2891 ?AUTO_2896 ) ) ( not ( = ?AUTO_2894 ?AUTO_2896 ) ) ( not ( = ?AUTO_2892 ?AUTO_2896 ) ) ( not ( = ?AUTO_2890 ?AUTO_2896 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2896 )
      ( MAKE-ON ?AUTO_2888 ?AUTO_2889 )
      ( MAKE-ON-VERIFY ?AUTO_2888 ?AUTO_2889 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2899 - BLOCK
      ?AUTO_2900 - BLOCK
    )
    :vars
    (
      ?AUTO_2901 - BLOCK
      ?AUTO_2905 - BLOCK
      ?AUTO_2903 - BLOCK
      ?AUTO_2902 - BLOCK
      ?AUTO_2906 - BLOCK
      ?AUTO_2904 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2900 ) ( not ( = ?AUTO_2899 ?AUTO_2900 ) ) ( ON-TABLE ?AUTO_2899 ) ( not ( = ?AUTO_2899 ?AUTO_2901 ) ) ( not ( = ?AUTO_2899 ?AUTO_2905 ) ) ( not ( = ?AUTO_2900 ?AUTO_2901 ) ) ( not ( = ?AUTO_2900 ?AUTO_2905 ) ) ( not ( = ?AUTO_2901 ?AUTO_2905 ) ) ( ON ?AUTO_2901 ?AUTO_2899 ) ( not ( = ?AUTO_2899 ?AUTO_2903 ) ) ( not ( = ?AUTO_2900 ?AUTO_2903 ) ) ( not ( = ?AUTO_2905 ?AUTO_2903 ) ) ( not ( = ?AUTO_2901 ?AUTO_2903 ) ) ( ON ?AUTO_2903 ?AUTO_2901 ) ( not ( = ?AUTO_2899 ?AUTO_2902 ) ) ( not ( = ?AUTO_2899 ?AUTO_2906 ) ) ( not ( = ?AUTO_2900 ?AUTO_2902 ) ) ( not ( = ?AUTO_2900 ?AUTO_2906 ) ) ( not ( = ?AUTO_2905 ?AUTO_2902 ) ) ( not ( = ?AUTO_2905 ?AUTO_2906 ) ) ( not ( = ?AUTO_2901 ?AUTO_2902 ) ) ( not ( = ?AUTO_2901 ?AUTO_2906 ) ) ( not ( = ?AUTO_2903 ?AUTO_2902 ) ) ( not ( = ?AUTO_2903 ?AUTO_2906 ) ) ( not ( = ?AUTO_2902 ?AUTO_2906 ) ) ( ON ?AUTO_2902 ?AUTO_2903 ) ( CLEAR ?AUTO_2904 ) ( not ( = ?AUTO_2899 ?AUTO_2904 ) ) ( not ( = ?AUTO_2900 ?AUTO_2904 ) ) ( not ( = ?AUTO_2901 ?AUTO_2904 ) ) ( not ( = ?AUTO_2905 ?AUTO_2904 ) ) ( not ( = ?AUTO_2903 ?AUTO_2904 ) ) ( not ( = ?AUTO_2906 ?AUTO_2904 ) ) ( not ( = ?AUTO_2902 ?AUTO_2904 ) ) ( ON ?AUTO_2905 ?AUTO_2902 ) ( CLEAR ?AUTO_2905 ) ( HOLDING ?AUTO_2906 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2906 )
      ( MAKE-ON ?AUTO_2899 ?AUTO_2900 )
      ( MAKE-ON-VERIFY ?AUTO_2899 ?AUTO_2900 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2907 - BLOCK
      ?AUTO_2908 - BLOCK
    )
    :vars
    (
      ?AUTO_2909 - BLOCK
      ?AUTO_2911 - BLOCK
      ?AUTO_2910 - BLOCK
      ?AUTO_2913 - BLOCK
      ?AUTO_2914 - BLOCK
      ?AUTO_2912 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2908 ) ( not ( = ?AUTO_2907 ?AUTO_2908 ) ) ( ON-TABLE ?AUTO_2907 ) ( not ( = ?AUTO_2907 ?AUTO_2909 ) ) ( not ( = ?AUTO_2907 ?AUTO_2911 ) ) ( not ( = ?AUTO_2908 ?AUTO_2909 ) ) ( not ( = ?AUTO_2908 ?AUTO_2911 ) ) ( not ( = ?AUTO_2909 ?AUTO_2911 ) ) ( ON ?AUTO_2909 ?AUTO_2907 ) ( not ( = ?AUTO_2907 ?AUTO_2910 ) ) ( not ( = ?AUTO_2908 ?AUTO_2910 ) ) ( not ( = ?AUTO_2911 ?AUTO_2910 ) ) ( not ( = ?AUTO_2909 ?AUTO_2910 ) ) ( ON ?AUTO_2910 ?AUTO_2909 ) ( not ( = ?AUTO_2907 ?AUTO_2913 ) ) ( not ( = ?AUTO_2907 ?AUTO_2914 ) ) ( not ( = ?AUTO_2908 ?AUTO_2913 ) ) ( not ( = ?AUTO_2908 ?AUTO_2914 ) ) ( not ( = ?AUTO_2911 ?AUTO_2913 ) ) ( not ( = ?AUTO_2911 ?AUTO_2914 ) ) ( not ( = ?AUTO_2909 ?AUTO_2913 ) ) ( not ( = ?AUTO_2909 ?AUTO_2914 ) ) ( not ( = ?AUTO_2910 ?AUTO_2913 ) ) ( not ( = ?AUTO_2910 ?AUTO_2914 ) ) ( not ( = ?AUTO_2913 ?AUTO_2914 ) ) ( ON ?AUTO_2913 ?AUTO_2910 ) ( not ( = ?AUTO_2907 ?AUTO_2912 ) ) ( not ( = ?AUTO_2908 ?AUTO_2912 ) ) ( not ( = ?AUTO_2909 ?AUTO_2912 ) ) ( not ( = ?AUTO_2911 ?AUTO_2912 ) ) ( not ( = ?AUTO_2910 ?AUTO_2912 ) ) ( not ( = ?AUTO_2914 ?AUTO_2912 ) ) ( not ( = ?AUTO_2913 ?AUTO_2912 ) ) ( ON ?AUTO_2911 ?AUTO_2913 ) ( CLEAR ?AUTO_2911 ) ( ON ?AUTO_2914 ?AUTO_2912 ) ( CLEAR ?AUTO_2914 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2914 ?AUTO_2912 )
      ( MAKE-ON ?AUTO_2907 ?AUTO_2908 )
      ( MAKE-ON-VERIFY ?AUTO_2907 ?AUTO_2908 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2915 - BLOCK
      ?AUTO_2916 - BLOCK
    )
    :vars
    (
      ?AUTO_2922 - BLOCK
      ?AUTO_2918 - BLOCK
      ?AUTO_2921 - BLOCK
      ?AUTO_2920 - BLOCK
      ?AUTO_2919 - BLOCK
      ?AUTO_2917 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2915 ?AUTO_2916 ) ) ( ON-TABLE ?AUTO_2915 ) ( not ( = ?AUTO_2915 ?AUTO_2922 ) ) ( not ( = ?AUTO_2915 ?AUTO_2918 ) ) ( not ( = ?AUTO_2916 ?AUTO_2922 ) ) ( not ( = ?AUTO_2916 ?AUTO_2918 ) ) ( not ( = ?AUTO_2922 ?AUTO_2918 ) ) ( ON ?AUTO_2922 ?AUTO_2915 ) ( not ( = ?AUTO_2915 ?AUTO_2921 ) ) ( not ( = ?AUTO_2916 ?AUTO_2921 ) ) ( not ( = ?AUTO_2918 ?AUTO_2921 ) ) ( not ( = ?AUTO_2922 ?AUTO_2921 ) ) ( ON ?AUTO_2921 ?AUTO_2922 ) ( not ( = ?AUTO_2915 ?AUTO_2920 ) ) ( not ( = ?AUTO_2915 ?AUTO_2919 ) ) ( not ( = ?AUTO_2916 ?AUTO_2920 ) ) ( not ( = ?AUTO_2916 ?AUTO_2919 ) ) ( not ( = ?AUTO_2918 ?AUTO_2920 ) ) ( not ( = ?AUTO_2918 ?AUTO_2919 ) ) ( not ( = ?AUTO_2922 ?AUTO_2920 ) ) ( not ( = ?AUTO_2922 ?AUTO_2919 ) ) ( not ( = ?AUTO_2921 ?AUTO_2920 ) ) ( not ( = ?AUTO_2921 ?AUTO_2919 ) ) ( not ( = ?AUTO_2920 ?AUTO_2919 ) ) ( ON ?AUTO_2920 ?AUTO_2921 ) ( not ( = ?AUTO_2915 ?AUTO_2917 ) ) ( not ( = ?AUTO_2916 ?AUTO_2917 ) ) ( not ( = ?AUTO_2922 ?AUTO_2917 ) ) ( not ( = ?AUTO_2918 ?AUTO_2917 ) ) ( not ( = ?AUTO_2921 ?AUTO_2917 ) ) ( not ( = ?AUTO_2919 ?AUTO_2917 ) ) ( not ( = ?AUTO_2920 ?AUTO_2917 ) ) ( ON ?AUTO_2918 ?AUTO_2920 ) ( CLEAR ?AUTO_2918 ) ( ON ?AUTO_2919 ?AUTO_2917 ) ( CLEAR ?AUTO_2919 ) ( HOLDING ?AUTO_2916 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2916 )
      ( MAKE-ON ?AUTO_2915 ?AUTO_2916 )
      ( MAKE-ON-VERIFY ?AUTO_2915 ?AUTO_2916 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2923 - BLOCK
      ?AUTO_2924 - BLOCK
    )
    :vars
    (
      ?AUTO_2925 - BLOCK
      ?AUTO_2928 - BLOCK
      ?AUTO_2930 - BLOCK
      ?AUTO_2927 - BLOCK
      ?AUTO_2926 - BLOCK
      ?AUTO_2929 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2923 ?AUTO_2924 ) ) ( ON-TABLE ?AUTO_2923 ) ( not ( = ?AUTO_2923 ?AUTO_2925 ) ) ( not ( = ?AUTO_2923 ?AUTO_2928 ) ) ( not ( = ?AUTO_2924 ?AUTO_2925 ) ) ( not ( = ?AUTO_2924 ?AUTO_2928 ) ) ( not ( = ?AUTO_2925 ?AUTO_2928 ) ) ( ON ?AUTO_2925 ?AUTO_2923 ) ( not ( = ?AUTO_2923 ?AUTO_2930 ) ) ( not ( = ?AUTO_2924 ?AUTO_2930 ) ) ( not ( = ?AUTO_2928 ?AUTO_2930 ) ) ( not ( = ?AUTO_2925 ?AUTO_2930 ) ) ( ON ?AUTO_2930 ?AUTO_2925 ) ( not ( = ?AUTO_2923 ?AUTO_2927 ) ) ( not ( = ?AUTO_2923 ?AUTO_2926 ) ) ( not ( = ?AUTO_2924 ?AUTO_2927 ) ) ( not ( = ?AUTO_2924 ?AUTO_2926 ) ) ( not ( = ?AUTO_2928 ?AUTO_2927 ) ) ( not ( = ?AUTO_2928 ?AUTO_2926 ) ) ( not ( = ?AUTO_2925 ?AUTO_2927 ) ) ( not ( = ?AUTO_2925 ?AUTO_2926 ) ) ( not ( = ?AUTO_2930 ?AUTO_2927 ) ) ( not ( = ?AUTO_2930 ?AUTO_2926 ) ) ( not ( = ?AUTO_2927 ?AUTO_2926 ) ) ( ON ?AUTO_2927 ?AUTO_2930 ) ( not ( = ?AUTO_2923 ?AUTO_2929 ) ) ( not ( = ?AUTO_2924 ?AUTO_2929 ) ) ( not ( = ?AUTO_2925 ?AUTO_2929 ) ) ( not ( = ?AUTO_2928 ?AUTO_2929 ) ) ( not ( = ?AUTO_2930 ?AUTO_2929 ) ) ( not ( = ?AUTO_2926 ?AUTO_2929 ) ) ( not ( = ?AUTO_2927 ?AUTO_2929 ) ) ( ON ?AUTO_2928 ?AUTO_2927 ) ( CLEAR ?AUTO_2928 ) ( ON ?AUTO_2926 ?AUTO_2929 ) ( ON ?AUTO_2924 ?AUTO_2926 ) ( CLEAR ?AUTO_2924 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2924 ?AUTO_2926 )
      ( MAKE-ON ?AUTO_2923 ?AUTO_2924 )
      ( MAKE-ON-VERIFY ?AUTO_2923 ?AUTO_2924 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2933 - BLOCK
      ?AUTO_2934 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2933 ) ( CLEAR ?AUTO_2934 ) ( not ( = ?AUTO_2933 ?AUTO_2934 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2933 ?AUTO_2934 )
      ( MAKE-ON-VERIFY ?AUTO_2933 ?AUTO_2934 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2935 - BLOCK
      ?AUTO_2936 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2936 ) ( not ( = ?AUTO_2935 ?AUTO_2936 ) ) ( ON-TABLE ?AUTO_2935 ) ( CLEAR ?AUTO_2935 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_2935 )
      ( MAKE-ON ?AUTO_2935 ?AUTO_2936 )
      ( MAKE-ON-VERIFY ?AUTO_2935 ?AUTO_2936 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2937 - BLOCK
      ?AUTO_2938 - BLOCK
    )
    :vars
    (
      ?AUTO_2939 - BLOCK
      ?AUTO_2940 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2938 ) ( not ( = ?AUTO_2937 ?AUTO_2938 ) ) ( ON-TABLE ?AUTO_2937 ) ( CLEAR ?AUTO_2937 ) ( HOLDING ?AUTO_2939 ) ( CLEAR ?AUTO_2940 ) ( not ( = ?AUTO_2937 ?AUTO_2939 ) ) ( not ( = ?AUTO_2937 ?AUTO_2940 ) ) ( not ( = ?AUTO_2938 ?AUTO_2939 ) ) ( not ( = ?AUTO_2938 ?AUTO_2940 ) ) ( not ( = ?AUTO_2939 ?AUTO_2940 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2939 ?AUTO_2940 )
      ( MAKE-ON ?AUTO_2937 ?AUTO_2938 )
      ( MAKE-ON-VERIFY ?AUTO_2937 ?AUTO_2938 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2943 - BLOCK
      ?AUTO_2944 - BLOCK
    )
    :vars
    (
      ?AUTO_2945 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2943 ?AUTO_2944 ) ) ( ON-TABLE ?AUTO_2943 ) ( CLEAR ?AUTO_2943 ) ( HOLDING ?AUTO_2944 ) ( CLEAR ?AUTO_2945 ) ( not ( = ?AUTO_2943 ?AUTO_2945 ) ) ( not ( = ?AUTO_2944 ?AUTO_2945 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2944 ?AUTO_2945 )
      ( MAKE-ON ?AUTO_2943 ?AUTO_2944 )
      ( MAKE-ON-VERIFY ?AUTO_2943 ?AUTO_2944 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3014 - BLOCK
      ?AUTO_3015 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3014 ) ( CLEAR ?AUTO_3015 ) ( not ( = ?AUTO_3014 ?AUTO_3015 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3014 ?AUTO_3015 )
      ( MAKE-ON-VERIFY ?AUTO_3014 ?AUTO_3015 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3016 - BLOCK
      ?AUTO_3017 - BLOCK
    )
    :vars
    (
      ?AUTO_3018 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3017 ) ( not ( = ?AUTO_3016 ?AUTO_3017 ) ) ( ON ?AUTO_3016 ?AUTO_3018 ) ( CLEAR ?AUTO_3016 ) ( HAND-EMPTY ) ( not ( = ?AUTO_3016 ?AUTO_3018 ) ) ( not ( = ?AUTO_3017 ?AUTO_3018 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3016 ?AUTO_3018 )
      ( MAKE-ON ?AUTO_3016 ?AUTO_3017 )
      ( MAKE-ON-VERIFY ?AUTO_3016 ?AUTO_3017 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3019 - BLOCK
      ?AUTO_3020 - BLOCK
    )
    :vars
    (
      ?AUTO_3021 - BLOCK
      ?AUTO_3022 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3019 ?AUTO_3020 ) ) ( ON ?AUTO_3019 ?AUTO_3021 ) ( CLEAR ?AUTO_3019 ) ( not ( = ?AUTO_3019 ?AUTO_3021 ) ) ( not ( = ?AUTO_3020 ?AUTO_3021 ) ) ( HOLDING ?AUTO_3020 ) ( CLEAR ?AUTO_3022 ) ( not ( = ?AUTO_3019 ?AUTO_3022 ) ) ( not ( = ?AUTO_3020 ?AUTO_3022 ) ) ( not ( = ?AUTO_3021 ?AUTO_3022 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3020 ?AUTO_3022 )
      ( MAKE-ON ?AUTO_3019 ?AUTO_3020 )
      ( MAKE-ON-VERIFY ?AUTO_3019 ?AUTO_3020 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3025 - BLOCK
      ?AUTO_3026 - BLOCK
    )
    :vars
    (
      ?AUTO_3027 - BLOCK
      ?AUTO_3028 - BLOCK
      ?AUTO_3029 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3026 ) ( not ( = ?AUTO_3025 ?AUTO_3026 ) ) ( ON ?AUTO_3025 ?AUTO_3027 ) ( CLEAR ?AUTO_3025 ) ( not ( = ?AUTO_3025 ?AUTO_3027 ) ) ( not ( = ?AUTO_3026 ?AUTO_3027 ) ) ( HOLDING ?AUTO_3028 ) ( CLEAR ?AUTO_3029 ) ( not ( = ?AUTO_3025 ?AUTO_3028 ) ) ( not ( = ?AUTO_3025 ?AUTO_3029 ) ) ( not ( = ?AUTO_3026 ?AUTO_3028 ) ) ( not ( = ?AUTO_3026 ?AUTO_3029 ) ) ( not ( = ?AUTO_3027 ?AUTO_3028 ) ) ( not ( = ?AUTO_3027 ?AUTO_3029 ) ) ( not ( = ?AUTO_3028 ?AUTO_3029 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3028 ?AUTO_3029 )
      ( MAKE-ON ?AUTO_3025 ?AUTO_3026 )
      ( MAKE-ON-VERIFY ?AUTO_3025 ?AUTO_3026 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3031 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3031 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3031 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3031 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3032 - BLOCK
    )
    :vars
    (
      ?AUTO_3033 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3032 ?AUTO_3033 ) ( CLEAR ?AUTO_3032 ) ( HAND-EMPTY ) ( not ( = ?AUTO_3032 ?AUTO_3033 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3032 ?AUTO_3033 )
      ( MAKE-ON-TABLE ?AUTO_3032 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3032 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3036 - BLOCK
      ?AUTO_3037 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3036 ) ( CLEAR ?AUTO_3037 ) ( not ( = ?AUTO_3036 ?AUTO_3037 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3036 ?AUTO_3037 )
      ( MAKE-ON-VERIFY ?AUTO_3036 ?AUTO_3037 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3038 - BLOCK
      ?AUTO_3039 - BLOCK
    )
    :vars
    (
      ?AUTO_3040 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3039 ) ( not ( = ?AUTO_3038 ?AUTO_3039 ) ) ( ON ?AUTO_3038 ?AUTO_3040 ) ( CLEAR ?AUTO_3038 ) ( HAND-EMPTY ) ( not ( = ?AUTO_3038 ?AUTO_3040 ) ) ( not ( = ?AUTO_3039 ?AUTO_3040 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3038 ?AUTO_3040 )
      ( MAKE-ON ?AUTO_3038 ?AUTO_3039 )
      ( MAKE-ON-VERIFY ?AUTO_3038 ?AUTO_3039 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3041 - BLOCK
      ?AUTO_3042 - BLOCK
    )
    :vars
    (
      ?AUTO_3043 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3041 ?AUTO_3042 ) ) ( ON ?AUTO_3041 ?AUTO_3043 ) ( CLEAR ?AUTO_3041 ) ( not ( = ?AUTO_3041 ?AUTO_3043 ) ) ( not ( = ?AUTO_3042 ?AUTO_3043 ) ) ( HOLDING ?AUTO_3042 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3042 )
      ( MAKE-ON ?AUTO_3041 ?AUTO_3042 )
      ( MAKE-ON-VERIFY ?AUTO_3041 ?AUTO_3042 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3044 - BLOCK
      ?AUTO_3045 - BLOCK
    )
    :vars
    (
      ?AUTO_3046 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3044 ?AUTO_3045 ) ) ( ON ?AUTO_3044 ?AUTO_3046 ) ( not ( = ?AUTO_3044 ?AUTO_3046 ) ) ( not ( = ?AUTO_3045 ?AUTO_3046 ) ) ( ON ?AUTO_3045 ?AUTO_3044 ) ( CLEAR ?AUTO_3045 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3045 ?AUTO_3044 )
      ( MAKE-ON ?AUTO_3044 ?AUTO_3045 )
      ( MAKE-ON-VERIFY ?AUTO_3044 ?AUTO_3045 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3049 - BLOCK
      ?AUTO_3050 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3049 ) ( CLEAR ?AUTO_3050 ) ( not ( = ?AUTO_3049 ?AUTO_3050 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3049 ?AUTO_3050 )
      ( MAKE-ON-VERIFY ?AUTO_3049 ?AUTO_3050 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3051 - BLOCK
      ?AUTO_3052 - BLOCK
    )
    :vars
    (
      ?AUTO_3053 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3052 ) ( not ( = ?AUTO_3051 ?AUTO_3052 ) ) ( ON ?AUTO_3051 ?AUTO_3053 ) ( CLEAR ?AUTO_3051 ) ( HAND-EMPTY ) ( not ( = ?AUTO_3051 ?AUTO_3053 ) ) ( not ( = ?AUTO_3052 ?AUTO_3053 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3051 ?AUTO_3053 )
      ( MAKE-ON ?AUTO_3051 ?AUTO_3052 )
      ( MAKE-ON-VERIFY ?AUTO_3051 ?AUTO_3052 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3054 - BLOCK
      ?AUTO_3055 - BLOCK
    )
    :vars
    (
      ?AUTO_3056 - BLOCK
      ?AUTO_3057 - BLOCK
      ?AUTO_3058 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3055 ) ( not ( = ?AUTO_3054 ?AUTO_3055 ) ) ( ON ?AUTO_3054 ?AUTO_3056 ) ( CLEAR ?AUTO_3054 ) ( not ( = ?AUTO_3054 ?AUTO_3056 ) ) ( not ( = ?AUTO_3055 ?AUTO_3056 ) ) ( HOLDING ?AUTO_3057 ) ( CLEAR ?AUTO_3058 ) ( not ( = ?AUTO_3054 ?AUTO_3057 ) ) ( not ( = ?AUTO_3054 ?AUTO_3058 ) ) ( not ( = ?AUTO_3055 ?AUTO_3057 ) ) ( not ( = ?AUTO_3055 ?AUTO_3058 ) ) ( not ( = ?AUTO_3056 ?AUTO_3057 ) ) ( not ( = ?AUTO_3056 ?AUTO_3058 ) ) ( not ( = ?AUTO_3057 ?AUTO_3058 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3057 ?AUTO_3058 )
      ( MAKE-ON ?AUTO_3054 ?AUTO_3055 )
      ( MAKE-ON-VERIFY ?AUTO_3054 ?AUTO_3055 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3059 - BLOCK
      ?AUTO_3060 - BLOCK
    )
    :vars
    (
      ?AUTO_3061 - BLOCK
      ?AUTO_3062 - BLOCK
      ?AUTO_3063 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3059 ?AUTO_3060 ) ) ( ON ?AUTO_3059 ?AUTO_3061 ) ( CLEAR ?AUTO_3059 ) ( not ( = ?AUTO_3059 ?AUTO_3061 ) ) ( not ( = ?AUTO_3060 ?AUTO_3061 ) ) ( CLEAR ?AUTO_3062 ) ( not ( = ?AUTO_3059 ?AUTO_3063 ) ) ( not ( = ?AUTO_3059 ?AUTO_3062 ) ) ( not ( = ?AUTO_3060 ?AUTO_3063 ) ) ( not ( = ?AUTO_3060 ?AUTO_3062 ) ) ( not ( = ?AUTO_3061 ?AUTO_3063 ) ) ( not ( = ?AUTO_3061 ?AUTO_3062 ) ) ( not ( = ?AUTO_3063 ?AUTO_3062 ) ) ( ON ?AUTO_3063 ?AUTO_3060 ) ( CLEAR ?AUTO_3063 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3063 ?AUTO_3060 )
      ( MAKE-ON ?AUTO_3059 ?AUTO_3060 )
      ( MAKE-ON-VERIFY ?AUTO_3059 ?AUTO_3060 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3064 - BLOCK
      ?AUTO_3065 - BLOCK
    )
    :vars
    (
      ?AUTO_3068 - BLOCK
      ?AUTO_3067 - BLOCK
      ?AUTO_3066 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3064 ?AUTO_3065 ) ) ( ON ?AUTO_3064 ?AUTO_3068 ) ( CLEAR ?AUTO_3064 ) ( not ( = ?AUTO_3064 ?AUTO_3068 ) ) ( not ( = ?AUTO_3065 ?AUTO_3068 ) ) ( not ( = ?AUTO_3064 ?AUTO_3067 ) ) ( not ( = ?AUTO_3064 ?AUTO_3066 ) ) ( not ( = ?AUTO_3065 ?AUTO_3067 ) ) ( not ( = ?AUTO_3065 ?AUTO_3066 ) ) ( not ( = ?AUTO_3068 ?AUTO_3067 ) ) ( not ( = ?AUTO_3068 ?AUTO_3066 ) ) ( not ( = ?AUTO_3067 ?AUTO_3066 ) ) ( ON ?AUTO_3067 ?AUTO_3065 ) ( CLEAR ?AUTO_3067 ) ( HOLDING ?AUTO_3066 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3066 )
      ( MAKE-ON ?AUTO_3064 ?AUTO_3065 )
      ( MAKE-ON-VERIFY ?AUTO_3064 ?AUTO_3065 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3069 - BLOCK
      ?AUTO_3070 - BLOCK
    )
    :vars
    (
      ?AUTO_3073 - BLOCK
      ?AUTO_3071 - BLOCK
      ?AUTO_3072 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3069 ?AUTO_3070 ) ) ( ON ?AUTO_3069 ?AUTO_3073 ) ( CLEAR ?AUTO_3069 ) ( not ( = ?AUTO_3069 ?AUTO_3073 ) ) ( not ( = ?AUTO_3070 ?AUTO_3073 ) ) ( not ( = ?AUTO_3069 ?AUTO_3071 ) ) ( not ( = ?AUTO_3069 ?AUTO_3072 ) ) ( not ( = ?AUTO_3070 ?AUTO_3071 ) ) ( not ( = ?AUTO_3070 ?AUTO_3072 ) ) ( not ( = ?AUTO_3073 ?AUTO_3071 ) ) ( not ( = ?AUTO_3073 ?AUTO_3072 ) ) ( not ( = ?AUTO_3071 ?AUTO_3072 ) ) ( ON ?AUTO_3071 ?AUTO_3070 ) ( ON ?AUTO_3072 ?AUTO_3071 ) ( CLEAR ?AUTO_3072 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3072 ?AUTO_3071 )
      ( MAKE-ON ?AUTO_3069 ?AUTO_3070 )
      ( MAKE-ON-VERIFY ?AUTO_3069 ?AUTO_3070 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3075 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3075 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3075 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3075 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3076 - BLOCK
    )
    :vars
    (
      ?AUTO_3077 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3076 ?AUTO_3077 ) ( CLEAR ?AUTO_3076 ) ( HAND-EMPTY ) ( not ( = ?AUTO_3076 ?AUTO_3077 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3076 ?AUTO_3077 )
      ( MAKE-ON-TABLE ?AUTO_3076 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3076 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3078 - BLOCK
    )
    :vars
    (
      ?AUTO_3079 - BLOCK
      ?AUTO_3080 - BLOCK
      ?AUTO_3081 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3078 ?AUTO_3079 ) ( CLEAR ?AUTO_3078 ) ( not ( = ?AUTO_3078 ?AUTO_3079 ) ) ( HOLDING ?AUTO_3080 ) ( CLEAR ?AUTO_3081 ) ( not ( = ?AUTO_3078 ?AUTO_3080 ) ) ( not ( = ?AUTO_3078 ?AUTO_3081 ) ) ( not ( = ?AUTO_3079 ?AUTO_3080 ) ) ( not ( = ?AUTO_3079 ?AUTO_3081 ) ) ( not ( = ?AUTO_3080 ?AUTO_3081 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3080 ?AUTO_3081 )
      ( MAKE-ON-TABLE ?AUTO_3078 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3078 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3082 - BLOCK
    )
    :vars
    (
      ?AUTO_3083 - BLOCK
      ?AUTO_3085 - BLOCK
      ?AUTO_3084 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3082 ?AUTO_3083 ) ( not ( = ?AUTO_3082 ?AUTO_3083 ) ) ( CLEAR ?AUTO_3085 ) ( not ( = ?AUTO_3082 ?AUTO_3084 ) ) ( not ( = ?AUTO_3082 ?AUTO_3085 ) ) ( not ( = ?AUTO_3083 ?AUTO_3084 ) ) ( not ( = ?AUTO_3083 ?AUTO_3085 ) ) ( not ( = ?AUTO_3084 ?AUTO_3085 ) ) ( ON ?AUTO_3084 ?AUTO_3082 ) ( CLEAR ?AUTO_3084 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3084 ?AUTO_3082 )
      ( MAKE-ON-TABLE ?AUTO_3082 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3082 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3086 - BLOCK
    )
    :vars
    (
      ?AUTO_3087 - BLOCK
      ?AUTO_3089 - BLOCK
      ?AUTO_3088 - BLOCK
      ?AUTO_3090 - BLOCK
      ?AUTO_3091 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3086 ?AUTO_3087 ) ( not ( = ?AUTO_3086 ?AUTO_3087 ) ) ( CLEAR ?AUTO_3089 ) ( not ( = ?AUTO_3086 ?AUTO_3088 ) ) ( not ( = ?AUTO_3086 ?AUTO_3089 ) ) ( not ( = ?AUTO_3087 ?AUTO_3088 ) ) ( not ( = ?AUTO_3087 ?AUTO_3089 ) ) ( not ( = ?AUTO_3088 ?AUTO_3089 ) ) ( ON ?AUTO_3088 ?AUTO_3086 ) ( CLEAR ?AUTO_3088 ) ( HOLDING ?AUTO_3090 ) ( CLEAR ?AUTO_3091 ) ( not ( = ?AUTO_3086 ?AUTO_3090 ) ) ( not ( = ?AUTO_3086 ?AUTO_3091 ) ) ( not ( = ?AUTO_3087 ?AUTO_3090 ) ) ( not ( = ?AUTO_3087 ?AUTO_3091 ) ) ( not ( = ?AUTO_3089 ?AUTO_3090 ) ) ( not ( = ?AUTO_3089 ?AUTO_3091 ) ) ( not ( = ?AUTO_3088 ?AUTO_3090 ) ) ( not ( = ?AUTO_3088 ?AUTO_3091 ) ) ( not ( = ?AUTO_3090 ?AUTO_3091 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3090 ?AUTO_3091 )
      ( MAKE-ON-TABLE ?AUTO_3086 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3086 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3093 - BLOCK
    )
    :vars
    (
      ?AUTO_3094 - BLOCK
      ?AUTO_3095 - BLOCK
      ?AUTO_3096 - BLOCK
      ?AUTO_3097 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3093 ?AUTO_3094 ) ( not ( = ?AUTO_3093 ?AUTO_3094 ) ) ( CLEAR ?AUTO_3095 ) ( not ( = ?AUTO_3093 ?AUTO_3096 ) ) ( not ( = ?AUTO_3093 ?AUTO_3095 ) ) ( not ( = ?AUTO_3094 ?AUTO_3096 ) ) ( not ( = ?AUTO_3094 ?AUTO_3095 ) ) ( not ( = ?AUTO_3096 ?AUTO_3095 ) ) ( ON ?AUTO_3096 ?AUTO_3093 ) ( CLEAR ?AUTO_3096 ) ( HOLDING ?AUTO_3097 ) ( not ( = ?AUTO_3093 ?AUTO_3097 ) ) ( not ( = ?AUTO_3094 ?AUTO_3097 ) ) ( not ( = ?AUTO_3095 ?AUTO_3097 ) ) ( not ( = ?AUTO_3096 ?AUTO_3097 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3097 )
      ( MAKE-ON-TABLE ?AUTO_3093 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3093 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3100 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3100 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3100 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3100 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3101 - BLOCK
    )
    :vars
    (
      ?AUTO_3102 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3101 ?AUTO_3102 ) ( CLEAR ?AUTO_3101 ) ( HAND-EMPTY ) ( not ( = ?AUTO_3101 ?AUTO_3102 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3101 ?AUTO_3102 )
      ( MAKE-ON-TABLE ?AUTO_3101 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3101 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3103 - BLOCK
    )
    :vars
    (
      ?AUTO_3104 - BLOCK
      ?AUTO_3105 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3103 ?AUTO_3104 ) ( CLEAR ?AUTO_3103 ) ( not ( = ?AUTO_3103 ?AUTO_3104 ) ) ( HOLDING ?AUTO_3105 ) ( not ( = ?AUTO_3103 ?AUTO_3105 ) ) ( not ( = ?AUTO_3104 ?AUTO_3105 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3105 )
      ( MAKE-ON-TABLE ?AUTO_3103 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3103 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3115 - BLOCK
      ?AUTO_3116 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3115 ) ( CLEAR ?AUTO_3116 ) ( not ( = ?AUTO_3115 ?AUTO_3116 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3115 ?AUTO_3116 )
      ( MAKE-ON-VERIFY ?AUTO_3115 ?AUTO_3116 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3117 - BLOCK
      ?AUTO_3118 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3118 ) ( not ( = ?AUTO_3117 ?AUTO_3118 ) ) ( ON-TABLE ?AUTO_3117 ) ( CLEAR ?AUTO_3117 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_3117 )
      ( MAKE-ON ?AUTO_3117 ?AUTO_3118 )
      ( MAKE-ON-VERIFY ?AUTO_3117 ?AUTO_3118 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3119 - BLOCK
      ?AUTO_3120 - BLOCK
    )
    :vars
    (
      ?AUTO_3121 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3120 ) ( not ( = ?AUTO_3119 ?AUTO_3120 ) ) ( ON-TABLE ?AUTO_3119 ) ( CLEAR ?AUTO_3119 ) ( HOLDING ?AUTO_3121 ) ( not ( = ?AUTO_3119 ?AUTO_3121 ) ) ( not ( = ?AUTO_3120 ?AUTO_3121 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3121 )
      ( MAKE-ON ?AUTO_3119 ?AUTO_3120 )
      ( MAKE-ON-VERIFY ?AUTO_3119 ?AUTO_3120 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3122 - BLOCK
      ?AUTO_3123 - BLOCK
    )
    :vars
    (
      ?AUTO_3124 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3123 ) ( not ( = ?AUTO_3122 ?AUTO_3123 ) ) ( ON-TABLE ?AUTO_3122 ) ( not ( = ?AUTO_3122 ?AUTO_3124 ) ) ( not ( = ?AUTO_3123 ?AUTO_3124 ) ) ( ON ?AUTO_3124 ?AUTO_3122 ) ( CLEAR ?AUTO_3124 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3124 ?AUTO_3122 )
      ( MAKE-ON ?AUTO_3122 ?AUTO_3123 )
      ( MAKE-ON-VERIFY ?AUTO_3122 ?AUTO_3123 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3125 - BLOCK
      ?AUTO_3126 - BLOCK
    )
    :vars
    (
      ?AUTO_3127 - BLOCK
      ?AUTO_3128 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3126 ) ( not ( = ?AUTO_3125 ?AUTO_3126 ) ) ( ON-TABLE ?AUTO_3125 ) ( not ( = ?AUTO_3125 ?AUTO_3127 ) ) ( not ( = ?AUTO_3126 ?AUTO_3127 ) ) ( ON ?AUTO_3127 ?AUTO_3125 ) ( CLEAR ?AUTO_3127 ) ( HOLDING ?AUTO_3128 ) ( not ( = ?AUTO_3125 ?AUTO_3128 ) ) ( not ( = ?AUTO_3126 ?AUTO_3128 ) ) ( not ( = ?AUTO_3127 ?AUTO_3128 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3128 )
      ( MAKE-ON ?AUTO_3125 ?AUTO_3126 )
      ( MAKE-ON-VERIFY ?AUTO_3125 ?AUTO_3126 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3129 - BLOCK
      ?AUTO_3130 - BLOCK
    )
    :vars
    (
      ?AUTO_3131 - BLOCK
      ?AUTO_3132 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3129 ?AUTO_3130 ) ) ( ON-TABLE ?AUTO_3129 ) ( not ( = ?AUTO_3129 ?AUTO_3131 ) ) ( not ( = ?AUTO_3130 ?AUTO_3131 ) ) ( ON ?AUTO_3131 ?AUTO_3129 ) ( CLEAR ?AUTO_3131 ) ( not ( = ?AUTO_3129 ?AUTO_3132 ) ) ( not ( = ?AUTO_3130 ?AUTO_3132 ) ) ( not ( = ?AUTO_3131 ?AUTO_3132 ) ) ( ON ?AUTO_3132 ?AUTO_3130 ) ( CLEAR ?AUTO_3132 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3132 ?AUTO_3130 )
      ( MAKE-ON ?AUTO_3129 ?AUTO_3130 )
      ( MAKE-ON-VERIFY ?AUTO_3129 ?AUTO_3130 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3133 - BLOCK
      ?AUTO_3134 - BLOCK
    )
    :vars
    (
      ?AUTO_3135 - BLOCK
      ?AUTO_3136 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3133 ?AUTO_3134 ) ) ( ON-TABLE ?AUTO_3133 ) ( not ( = ?AUTO_3133 ?AUTO_3135 ) ) ( not ( = ?AUTO_3134 ?AUTO_3135 ) ) ( not ( = ?AUTO_3133 ?AUTO_3136 ) ) ( not ( = ?AUTO_3134 ?AUTO_3136 ) ) ( not ( = ?AUTO_3135 ?AUTO_3136 ) ) ( ON ?AUTO_3136 ?AUTO_3134 ) ( CLEAR ?AUTO_3136 ) ( HOLDING ?AUTO_3135 ) ( CLEAR ?AUTO_3133 ) )
    :subtasks
    ( ( !STACK ?AUTO_3135 ?AUTO_3133 )
      ( MAKE-ON ?AUTO_3133 ?AUTO_3134 )
      ( MAKE-ON-VERIFY ?AUTO_3133 ?AUTO_3134 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3137 - BLOCK
      ?AUTO_3138 - BLOCK
    )
    :vars
    (
      ?AUTO_3139 - BLOCK
      ?AUTO_3140 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3137 ?AUTO_3138 ) ) ( ON-TABLE ?AUTO_3137 ) ( not ( = ?AUTO_3137 ?AUTO_3139 ) ) ( not ( = ?AUTO_3138 ?AUTO_3139 ) ) ( not ( = ?AUTO_3137 ?AUTO_3140 ) ) ( not ( = ?AUTO_3138 ?AUTO_3140 ) ) ( not ( = ?AUTO_3139 ?AUTO_3140 ) ) ( ON ?AUTO_3140 ?AUTO_3138 ) ( CLEAR ?AUTO_3137 ) ( ON ?AUTO_3139 ?AUTO_3140 ) ( CLEAR ?AUTO_3139 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3139 ?AUTO_3140 )
      ( MAKE-ON ?AUTO_3137 ?AUTO_3138 )
      ( MAKE-ON-VERIFY ?AUTO_3137 ?AUTO_3138 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3141 - BLOCK
      ?AUTO_3142 - BLOCK
    )
    :vars
    (
      ?AUTO_3143 - BLOCK
      ?AUTO_3144 - BLOCK
      ?AUTO_3145 - BLOCK
      ?AUTO_3146 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3141 ?AUTO_3142 ) ) ( ON-TABLE ?AUTO_3141 ) ( not ( = ?AUTO_3141 ?AUTO_3143 ) ) ( not ( = ?AUTO_3142 ?AUTO_3143 ) ) ( not ( = ?AUTO_3141 ?AUTO_3144 ) ) ( not ( = ?AUTO_3142 ?AUTO_3144 ) ) ( not ( = ?AUTO_3143 ?AUTO_3144 ) ) ( ON ?AUTO_3144 ?AUTO_3142 ) ( CLEAR ?AUTO_3141 ) ( ON ?AUTO_3143 ?AUTO_3144 ) ( CLEAR ?AUTO_3143 ) ( HOLDING ?AUTO_3145 ) ( CLEAR ?AUTO_3146 ) ( not ( = ?AUTO_3141 ?AUTO_3145 ) ) ( not ( = ?AUTO_3141 ?AUTO_3146 ) ) ( not ( = ?AUTO_3142 ?AUTO_3145 ) ) ( not ( = ?AUTO_3142 ?AUTO_3146 ) ) ( not ( = ?AUTO_3143 ?AUTO_3145 ) ) ( not ( = ?AUTO_3143 ?AUTO_3146 ) ) ( not ( = ?AUTO_3144 ?AUTO_3145 ) ) ( not ( = ?AUTO_3144 ?AUTO_3146 ) ) ( not ( = ?AUTO_3145 ?AUTO_3146 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3145 ?AUTO_3146 )
      ( MAKE-ON ?AUTO_3141 ?AUTO_3142 )
      ( MAKE-ON-VERIFY ?AUTO_3141 ?AUTO_3142 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3147 - BLOCK
      ?AUTO_3148 - BLOCK
    )
    :vars
    (
      ?AUTO_3149 - BLOCK
      ?AUTO_3150 - BLOCK
      ?AUTO_3152 - BLOCK
      ?AUTO_3151 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3147 ?AUTO_3148 ) ) ( ON-TABLE ?AUTO_3147 ) ( not ( = ?AUTO_3147 ?AUTO_3149 ) ) ( not ( = ?AUTO_3148 ?AUTO_3149 ) ) ( not ( = ?AUTO_3147 ?AUTO_3150 ) ) ( not ( = ?AUTO_3148 ?AUTO_3150 ) ) ( not ( = ?AUTO_3149 ?AUTO_3150 ) ) ( ON ?AUTO_3150 ?AUTO_3148 ) ( ON ?AUTO_3149 ?AUTO_3150 ) ( CLEAR ?AUTO_3149 ) ( CLEAR ?AUTO_3152 ) ( not ( = ?AUTO_3147 ?AUTO_3151 ) ) ( not ( = ?AUTO_3147 ?AUTO_3152 ) ) ( not ( = ?AUTO_3148 ?AUTO_3151 ) ) ( not ( = ?AUTO_3148 ?AUTO_3152 ) ) ( not ( = ?AUTO_3149 ?AUTO_3151 ) ) ( not ( = ?AUTO_3149 ?AUTO_3152 ) ) ( not ( = ?AUTO_3150 ?AUTO_3151 ) ) ( not ( = ?AUTO_3150 ?AUTO_3152 ) ) ( not ( = ?AUTO_3151 ?AUTO_3152 ) ) ( ON ?AUTO_3151 ?AUTO_3147 ) ( CLEAR ?AUTO_3151 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3151 ?AUTO_3147 )
      ( MAKE-ON ?AUTO_3147 ?AUTO_3148 )
      ( MAKE-ON-VERIFY ?AUTO_3147 ?AUTO_3148 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3153 - BLOCK
      ?AUTO_3154 - BLOCK
    )
    :vars
    (
      ?AUTO_3158 - BLOCK
      ?AUTO_3155 - BLOCK
      ?AUTO_3157 - BLOCK
      ?AUTO_3156 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3153 ?AUTO_3154 ) ) ( ON-TABLE ?AUTO_3153 ) ( not ( = ?AUTO_3153 ?AUTO_3158 ) ) ( not ( = ?AUTO_3154 ?AUTO_3158 ) ) ( not ( = ?AUTO_3153 ?AUTO_3155 ) ) ( not ( = ?AUTO_3154 ?AUTO_3155 ) ) ( not ( = ?AUTO_3158 ?AUTO_3155 ) ) ( ON ?AUTO_3155 ?AUTO_3154 ) ( ON ?AUTO_3158 ?AUTO_3155 ) ( CLEAR ?AUTO_3158 ) ( not ( = ?AUTO_3153 ?AUTO_3157 ) ) ( not ( = ?AUTO_3153 ?AUTO_3156 ) ) ( not ( = ?AUTO_3154 ?AUTO_3157 ) ) ( not ( = ?AUTO_3154 ?AUTO_3156 ) ) ( not ( = ?AUTO_3158 ?AUTO_3157 ) ) ( not ( = ?AUTO_3158 ?AUTO_3156 ) ) ( not ( = ?AUTO_3155 ?AUTO_3157 ) ) ( not ( = ?AUTO_3155 ?AUTO_3156 ) ) ( not ( = ?AUTO_3157 ?AUTO_3156 ) ) ( ON ?AUTO_3157 ?AUTO_3153 ) ( CLEAR ?AUTO_3157 ) ( HOLDING ?AUTO_3156 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3156 )
      ( MAKE-ON ?AUTO_3153 ?AUTO_3154 )
      ( MAKE-ON-VERIFY ?AUTO_3153 ?AUTO_3154 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3159 - BLOCK
      ?AUTO_3160 - BLOCK
    )
    :vars
    (
      ?AUTO_3162 - BLOCK
      ?AUTO_3161 - BLOCK
      ?AUTO_3164 - BLOCK
      ?AUTO_3163 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3159 ?AUTO_3160 ) ) ( ON-TABLE ?AUTO_3159 ) ( not ( = ?AUTO_3159 ?AUTO_3162 ) ) ( not ( = ?AUTO_3160 ?AUTO_3162 ) ) ( not ( = ?AUTO_3159 ?AUTO_3161 ) ) ( not ( = ?AUTO_3160 ?AUTO_3161 ) ) ( not ( = ?AUTO_3162 ?AUTO_3161 ) ) ( ON ?AUTO_3161 ?AUTO_3160 ) ( ON ?AUTO_3162 ?AUTO_3161 ) ( CLEAR ?AUTO_3162 ) ( not ( = ?AUTO_3159 ?AUTO_3164 ) ) ( not ( = ?AUTO_3159 ?AUTO_3163 ) ) ( not ( = ?AUTO_3160 ?AUTO_3164 ) ) ( not ( = ?AUTO_3160 ?AUTO_3163 ) ) ( not ( = ?AUTO_3162 ?AUTO_3164 ) ) ( not ( = ?AUTO_3162 ?AUTO_3163 ) ) ( not ( = ?AUTO_3161 ?AUTO_3164 ) ) ( not ( = ?AUTO_3161 ?AUTO_3163 ) ) ( not ( = ?AUTO_3164 ?AUTO_3163 ) ) ( ON ?AUTO_3164 ?AUTO_3159 ) ( ON ?AUTO_3163 ?AUTO_3164 ) ( CLEAR ?AUTO_3163 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3163 ?AUTO_3164 )
      ( MAKE-ON ?AUTO_3159 ?AUTO_3160 )
      ( MAKE-ON-VERIFY ?AUTO_3159 ?AUTO_3160 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3167 - BLOCK
      ?AUTO_3168 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3167 ) ( CLEAR ?AUTO_3168 ) ( not ( = ?AUTO_3167 ?AUTO_3168 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3167 ?AUTO_3168 )
      ( MAKE-ON-VERIFY ?AUTO_3167 ?AUTO_3168 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3169 - BLOCK
      ?AUTO_3170 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3170 ) ( not ( = ?AUTO_3169 ?AUTO_3170 ) ) ( ON-TABLE ?AUTO_3169 ) ( CLEAR ?AUTO_3169 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_3169 )
      ( MAKE-ON ?AUTO_3169 ?AUTO_3170 )
      ( MAKE-ON-VERIFY ?AUTO_3169 ?AUTO_3170 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3171 - BLOCK
      ?AUTO_3172 - BLOCK
    )
    :vars
    (
      ?AUTO_3173 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3171 ?AUTO_3172 ) ) ( ON-TABLE ?AUTO_3171 ) ( CLEAR ?AUTO_3171 ) ( HOLDING ?AUTO_3172 ) ( CLEAR ?AUTO_3173 ) ( not ( = ?AUTO_3171 ?AUTO_3173 ) ) ( not ( = ?AUTO_3172 ?AUTO_3173 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3172 ?AUTO_3173 )
      ( MAKE-ON ?AUTO_3171 ?AUTO_3172 )
      ( MAKE-ON-VERIFY ?AUTO_3171 ?AUTO_3172 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3201 - BLOCK
      ?AUTO_3202 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3201 ) ( CLEAR ?AUTO_3202 ) ( not ( = ?AUTO_3201 ?AUTO_3202 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3201 ?AUTO_3202 )
      ( MAKE-ON-VERIFY ?AUTO_3201 ?AUTO_3202 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3203 - BLOCK
      ?AUTO_3204 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3204 ) ( not ( = ?AUTO_3203 ?AUTO_3204 ) ) ( ON-TABLE ?AUTO_3203 ) ( CLEAR ?AUTO_3203 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_3203 )
      ( MAKE-ON ?AUTO_3203 ?AUTO_3204 )
      ( MAKE-ON-VERIFY ?AUTO_3203 ?AUTO_3204 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3205 - BLOCK
      ?AUTO_3206 - BLOCK
    )
    :vars
    (
      ?AUTO_3207 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3205 ?AUTO_3206 ) ) ( ON-TABLE ?AUTO_3205 ) ( CLEAR ?AUTO_3205 ) ( HOLDING ?AUTO_3206 ) ( CLEAR ?AUTO_3207 ) ( not ( = ?AUTO_3205 ?AUTO_3207 ) ) ( not ( = ?AUTO_3206 ?AUTO_3207 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3206 ?AUTO_3207 )
      ( MAKE-ON ?AUTO_3205 ?AUTO_3206 )
      ( MAKE-ON-VERIFY ?AUTO_3205 ?AUTO_3206 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3210 - BLOCK
      ?AUTO_3211 - BLOCK
    )
    :vars
    (
      ?AUTO_3212 - BLOCK
      ?AUTO_3213 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3211 ) ( not ( = ?AUTO_3210 ?AUTO_3211 ) ) ( ON-TABLE ?AUTO_3210 ) ( CLEAR ?AUTO_3210 ) ( HOLDING ?AUTO_3212 ) ( CLEAR ?AUTO_3213 ) ( not ( = ?AUTO_3210 ?AUTO_3212 ) ) ( not ( = ?AUTO_3210 ?AUTO_3213 ) ) ( not ( = ?AUTO_3211 ?AUTO_3212 ) ) ( not ( = ?AUTO_3211 ?AUTO_3213 ) ) ( not ( = ?AUTO_3212 ?AUTO_3213 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3212 ?AUTO_3213 )
      ( MAKE-ON ?AUTO_3210 ?AUTO_3211 )
      ( MAKE-ON-VERIFY ?AUTO_3210 ?AUTO_3211 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3222 - BLOCK
      ?AUTO_3223 - BLOCK
    )
    :vars
    (
      ?AUTO_3224 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3223 ) ( not ( = ?AUTO_3222 ?AUTO_3223 ) ) ( ON ?AUTO_3222 ?AUTO_3224 ) ( CLEAR ?AUTO_3222 ) ( HAND-EMPTY ) ( not ( = ?AUTO_3222 ?AUTO_3224 ) ) ( not ( = ?AUTO_3223 ?AUTO_3224 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3222 ?AUTO_3224 )
      ( MAKE-ON ?AUTO_3222 ?AUTO_3223 )
      ( MAKE-ON-VERIFY ?AUTO_3222 ?AUTO_3223 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3225 - BLOCK
      ?AUTO_3226 - BLOCK
    )
    :vars
    (
      ?AUTO_3227 - BLOCK
      ?AUTO_3228 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3225 ?AUTO_3226 ) ) ( ON ?AUTO_3225 ?AUTO_3227 ) ( CLEAR ?AUTO_3225 ) ( not ( = ?AUTO_3225 ?AUTO_3227 ) ) ( not ( = ?AUTO_3226 ?AUTO_3227 ) ) ( HOLDING ?AUTO_3226 ) ( CLEAR ?AUTO_3228 ) ( not ( = ?AUTO_3225 ?AUTO_3228 ) ) ( not ( = ?AUTO_3226 ?AUTO_3228 ) ) ( not ( = ?AUTO_3227 ?AUTO_3228 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3226 ?AUTO_3228 )
      ( MAKE-ON ?AUTO_3225 ?AUTO_3226 )
      ( MAKE-ON-VERIFY ?AUTO_3225 ?AUTO_3226 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3229 - BLOCK
      ?AUTO_3230 - BLOCK
    )
    :vars
    (
      ?AUTO_3231 - BLOCK
      ?AUTO_3232 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3229 ?AUTO_3230 ) ) ( ON ?AUTO_3229 ?AUTO_3231 ) ( not ( = ?AUTO_3229 ?AUTO_3231 ) ) ( not ( = ?AUTO_3230 ?AUTO_3231 ) ) ( CLEAR ?AUTO_3232 ) ( not ( = ?AUTO_3229 ?AUTO_3232 ) ) ( not ( = ?AUTO_3230 ?AUTO_3232 ) ) ( not ( = ?AUTO_3231 ?AUTO_3232 ) ) ( ON ?AUTO_3230 ?AUTO_3229 ) ( CLEAR ?AUTO_3230 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3230 ?AUTO_3229 )
      ( MAKE-ON ?AUTO_3229 ?AUTO_3230 )
      ( MAKE-ON-VERIFY ?AUTO_3229 ?AUTO_3230 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3233 - BLOCK
      ?AUTO_3234 - BLOCK
    )
    :vars
    (
      ?AUTO_3236 - BLOCK
      ?AUTO_3235 - BLOCK
      ?AUTO_3237 - BLOCK
      ?AUTO_3238 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3233 ?AUTO_3234 ) ) ( ON ?AUTO_3233 ?AUTO_3236 ) ( not ( = ?AUTO_3233 ?AUTO_3236 ) ) ( not ( = ?AUTO_3234 ?AUTO_3236 ) ) ( CLEAR ?AUTO_3235 ) ( not ( = ?AUTO_3233 ?AUTO_3235 ) ) ( not ( = ?AUTO_3234 ?AUTO_3235 ) ) ( not ( = ?AUTO_3236 ?AUTO_3235 ) ) ( ON ?AUTO_3234 ?AUTO_3233 ) ( CLEAR ?AUTO_3234 ) ( HOLDING ?AUTO_3237 ) ( CLEAR ?AUTO_3238 ) ( not ( = ?AUTO_3233 ?AUTO_3237 ) ) ( not ( = ?AUTO_3233 ?AUTO_3238 ) ) ( not ( = ?AUTO_3234 ?AUTO_3237 ) ) ( not ( = ?AUTO_3234 ?AUTO_3238 ) ) ( not ( = ?AUTO_3236 ?AUTO_3237 ) ) ( not ( = ?AUTO_3236 ?AUTO_3238 ) ) ( not ( = ?AUTO_3235 ?AUTO_3237 ) ) ( not ( = ?AUTO_3235 ?AUTO_3238 ) ) ( not ( = ?AUTO_3237 ?AUTO_3238 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3237 ?AUTO_3238 )
      ( MAKE-ON ?AUTO_3233 ?AUTO_3234 )
      ( MAKE-ON-VERIFY ?AUTO_3233 ?AUTO_3234 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3241 - BLOCK
      ?AUTO_3242 - BLOCK
    )
    :vars
    (
      ?AUTO_3244 - BLOCK
      ?AUTO_3243 - BLOCK
      ?AUTO_3245 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3241 ?AUTO_3242 ) ) ( ON ?AUTO_3241 ?AUTO_3244 ) ( not ( = ?AUTO_3241 ?AUTO_3244 ) ) ( not ( = ?AUTO_3242 ?AUTO_3244 ) ) ( CLEAR ?AUTO_3243 ) ( not ( = ?AUTO_3241 ?AUTO_3243 ) ) ( not ( = ?AUTO_3242 ?AUTO_3243 ) ) ( not ( = ?AUTO_3244 ?AUTO_3243 ) ) ( ON ?AUTO_3242 ?AUTO_3241 ) ( CLEAR ?AUTO_3242 ) ( HOLDING ?AUTO_3245 ) ( not ( = ?AUTO_3241 ?AUTO_3245 ) ) ( not ( = ?AUTO_3242 ?AUTO_3245 ) ) ( not ( = ?AUTO_3244 ?AUTO_3245 ) ) ( not ( = ?AUTO_3243 ?AUTO_3245 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3245 )
      ( MAKE-ON ?AUTO_3241 ?AUTO_3242 )
      ( MAKE-ON-VERIFY ?AUTO_3241 ?AUTO_3242 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3248 - BLOCK
      ?AUTO_3249 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3248 ) ( CLEAR ?AUTO_3249 ) ( not ( = ?AUTO_3248 ?AUTO_3249 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3248 ?AUTO_3249 )
      ( MAKE-ON-VERIFY ?AUTO_3248 ?AUTO_3249 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3250 - BLOCK
      ?AUTO_3251 - BLOCK
    )
    :vars
    (
      ?AUTO_3252 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3251 ) ( not ( = ?AUTO_3250 ?AUTO_3251 ) ) ( ON ?AUTO_3250 ?AUTO_3252 ) ( CLEAR ?AUTO_3250 ) ( HAND-EMPTY ) ( not ( = ?AUTO_3250 ?AUTO_3252 ) ) ( not ( = ?AUTO_3251 ?AUTO_3252 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3250 ?AUTO_3252 )
      ( MAKE-ON ?AUTO_3250 ?AUTO_3251 )
      ( MAKE-ON-VERIFY ?AUTO_3250 ?AUTO_3251 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3254 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3254 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3254 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3254 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3255 - BLOCK
    )
    :vars
    (
      ?AUTO_3256 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3255 ?AUTO_3256 ) ( CLEAR ?AUTO_3255 ) ( HAND-EMPTY ) ( not ( = ?AUTO_3255 ?AUTO_3256 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3255 ?AUTO_3256 )
      ( MAKE-ON-TABLE ?AUTO_3255 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3255 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3257 - BLOCK
    )
    :vars
    (
      ?AUTO_3258 - BLOCK
      ?AUTO_3259 - BLOCK
      ?AUTO_3260 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3257 ?AUTO_3258 ) ( CLEAR ?AUTO_3257 ) ( not ( = ?AUTO_3257 ?AUTO_3258 ) ) ( HOLDING ?AUTO_3259 ) ( CLEAR ?AUTO_3260 ) ( not ( = ?AUTO_3257 ?AUTO_3259 ) ) ( not ( = ?AUTO_3257 ?AUTO_3260 ) ) ( not ( = ?AUTO_3258 ?AUTO_3259 ) ) ( not ( = ?AUTO_3258 ?AUTO_3260 ) ) ( not ( = ?AUTO_3259 ?AUTO_3260 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3259 ?AUTO_3260 )
      ( MAKE-ON-TABLE ?AUTO_3257 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3257 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3261 - BLOCK
    )
    :vars
    (
      ?AUTO_3262 - BLOCK
      ?AUTO_3264 - BLOCK
      ?AUTO_3263 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3261 ?AUTO_3262 ) ( not ( = ?AUTO_3261 ?AUTO_3262 ) ) ( CLEAR ?AUTO_3264 ) ( not ( = ?AUTO_3261 ?AUTO_3263 ) ) ( not ( = ?AUTO_3261 ?AUTO_3264 ) ) ( not ( = ?AUTO_3262 ?AUTO_3263 ) ) ( not ( = ?AUTO_3262 ?AUTO_3264 ) ) ( not ( = ?AUTO_3263 ?AUTO_3264 ) ) ( ON ?AUTO_3263 ?AUTO_3261 ) ( CLEAR ?AUTO_3263 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3263 ?AUTO_3261 )
      ( MAKE-ON-TABLE ?AUTO_3261 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3261 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3267 - BLOCK
      ?AUTO_3268 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3267 ) ( CLEAR ?AUTO_3268 ) ( not ( = ?AUTO_3267 ?AUTO_3268 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3267 ?AUTO_3268 )
      ( MAKE-ON-VERIFY ?AUTO_3267 ?AUTO_3268 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3269 - BLOCK
      ?AUTO_3270 - BLOCK
    )
    :vars
    (
      ?AUTO_3271 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3270 ) ( not ( = ?AUTO_3269 ?AUTO_3270 ) ) ( ON ?AUTO_3269 ?AUTO_3271 ) ( CLEAR ?AUTO_3269 ) ( HAND-EMPTY ) ( not ( = ?AUTO_3269 ?AUTO_3271 ) ) ( not ( = ?AUTO_3270 ?AUTO_3271 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3269 ?AUTO_3271 )
      ( MAKE-ON ?AUTO_3269 ?AUTO_3270 )
      ( MAKE-ON-VERIFY ?AUTO_3269 ?AUTO_3270 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3272 - BLOCK
      ?AUTO_3273 - BLOCK
    )
    :vars
    (
      ?AUTO_3274 - BLOCK
      ?AUTO_3275 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3273 ) ( not ( = ?AUTO_3272 ?AUTO_3273 ) ) ( ON ?AUTO_3272 ?AUTO_3274 ) ( CLEAR ?AUTO_3272 ) ( not ( = ?AUTO_3272 ?AUTO_3274 ) ) ( not ( = ?AUTO_3273 ?AUTO_3274 ) ) ( HOLDING ?AUTO_3275 ) ( not ( = ?AUTO_3272 ?AUTO_3275 ) ) ( not ( = ?AUTO_3273 ?AUTO_3275 ) ) ( not ( = ?AUTO_3274 ?AUTO_3275 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3275 )
      ( MAKE-ON ?AUTO_3272 ?AUTO_3273 )
      ( MAKE-ON-VERIFY ?AUTO_3272 ?AUTO_3273 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3276 - BLOCK
      ?AUTO_3277 - BLOCK
    )
    :vars
    (
      ?AUTO_3278 - BLOCK
      ?AUTO_3279 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3276 ?AUTO_3277 ) ) ( ON ?AUTO_3276 ?AUTO_3278 ) ( CLEAR ?AUTO_3276 ) ( not ( = ?AUTO_3276 ?AUTO_3278 ) ) ( not ( = ?AUTO_3277 ?AUTO_3278 ) ) ( not ( = ?AUTO_3276 ?AUTO_3279 ) ) ( not ( = ?AUTO_3277 ?AUTO_3279 ) ) ( not ( = ?AUTO_3278 ?AUTO_3279 ) ) ( ON ?AUTO_3279 ?AUTO_3277 ) ( CLEAR ?AUTO_3279 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3279 ?AUTO_3277 )
      ( MAKE-ON ?AUTO_3276 ?AUTO_3277 )
      ( MAKE-ON-VERIFY ?AUTO_3276 ?AUTO_3277 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3280 - BLOCK
      ?AUTO_3281 - BLOCK
    )
    :vars
    (
      ?AUTO_3282 - BLOCK
      ?AUTO_3283 - BLOCK
      ?AUTO_3284 - BLOCK
      ?AUTO_3285 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3280 ?AUTO_3281 ) ) ( ON ?AUTO_3280 ?AUTO_3282 ) ( CLEAR ?AUTO_3280 ) ( not ( = ?AUTO_3280 ?AUTO_3282 ) ) ( not ( = ?AUTO_3281 ?AUTO_3282 ) ) ( not ( = ?AUTO_3280 ?AUTO_3283 ) ) ( not ( = ?AUTO_3281 ?AUTO_3283 ) ) ( not ( = ?AUTO_3282 ?AUTO_3283 ) ) ( ON ?AUTO_3283 ?AUTO_3281 ) ( CLEAR ?AUTO_3283 ) ( HOLDING ?AUTO_3284 ) ( CLEAR ?AUTO_3285 ) ( not ( = ?AUTO_3280 ?AUTO_3284 ) ) ( not ( = ?AUTO_3280 ?AUTO_3285 ) ) ( not ( = ?AUTO_3281 ?AUTO_3284 ) ) ( not ( = ?AUTO_3281 ?AUTO_3285 ) ) ( not ( = ?AUTO_3282 ?AUTO_3284 ) ) ( not ( = ?AUTO_3282 ?AUTO_3285 ) ) ( not ( = ?AUTO_3283 ?AUTO_3284 ) ) ( not ( = ?AUTO_3283 ?AUTO_3285 ) ) ( not ( = ?AUTO_3284 ?AUTO_3285 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3284 ?AUTO_3285 )
      ( MAKE-ON ?AUTO_3280 ?AUTO_3281 )
      ( MAKE-ON-VERIFY ?AUTO_3280 ?AUTO_3281 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3286 - BLOCK
      ?AUTO_3287 - BLOCK
    )
    :vars
    (
      ?AUTO_3288 - BLOCK
      ?AUTO_3289 - BLOCK
      ?AUTO_3291 - BLOCK
      ?AUTO_3290 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3286 ?AUTO_3287 ) ) ( ON ?AUTO_3286 ?AUTO_3288 ) ( CLEAR ?AUTO_3286 ) ( not ( = ?AUTO_3286 ?AUTO_3288 ) ) ( not ( = ?AUTO_3287 ?AUTO_3288 ) ) ( not ( = ?AUTO_3286 ?AUTO_3289 ) ) ( not ( = ?AUTO_3287 ?AUTO_3289 ) ) ( not ( = ?AUTO_3288 ?AUTO_3289 ) ) ( ON ?AUTO_3289 ?AUTO_3287 ) ( CLEAR ?AUTO_3291 ) ( not ( = ?AUTO_3286 ?AUTO_3290 ) ) ( not ( = ?AUTO_3286 ?AUTO_3291 ) ) ( not ( = ?AUTO_3287 ?AUTO_3290 ) ) ( not ( = ?AUTO_3287 ?AUTO_3291 ) ) ( not ( = ?AUTO_3288 ?AUTO_3290 ) ) ( not ( = ?AUTO_3288 ?AUTO_3291 ) ) ( not ( = ?AUTO_3289 ?AUTO_3290 ) ) ( not ( = ?AUTO_3289 ?AUTO_3291 ) ) ( not ( = ?AUTO_3290 ?AUTO_3291 ) ) ( ON ?AUTO_3290 ?AUTO_3289 ) ( CLEAR ?AUTO_3290 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3290 ?AUTO_3289 )
      ( MAKE-ON ?AUTO_3286 ?AUTO_3287 )
      ( MAKE-ON-VERIFY ?AUTO_3286 ?AUTO_3287 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3294 - BLOCK
      ?AUTO_3295 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3294 ) ( CLEAR ?AUTO_3295 ) ( not ( = ?AUTO_3294 ?AUTO_3295 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3294 ?AUTO_3295 )
      ( MAKE-ON-VERIFY ?AUTO_3294 ?AUTO_3295 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3296 - BLOCK
      ?AUTO_3297 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3297 ) ( not ( = ?AUTO_3296 ?AUTO_3297 ) ) ( ON-TABLE ?AUTO_3296 ) ( CLEAR ?AUTO_3296 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_3296 )
      ( MAKE-ON ?AUTO_3296 ?AUTO_3297 )
      ( MAKE-ON-VERIFY ?AUTO_3296 ?AUTO_3297 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3298 - BLOCK
      ?AUTO_3299 - BLOCK
    )
    :vars
    (
      ?AUTO_3300 - BLOCK
      ?AUTO_3301 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3299 ) ( not ( = ?AUTO_3298 ?AUTO_3299 ) ) ( ON-TABLE ?AUTO_3298 ) ( CLEAR ?AUTO_3298 ) ( HOLDING ?AUTO_3300 ) ( CLEAR ?AUTO_3301 ) ( not ( = ?AUTO_3298 ?AUTO_3300 ) ) ( not ( = ?AUTO_3298 ?AUTO_3301 ) ) ( not ( = ?AUTO_3299 ?AUTO_3300 ) ) ( not ( = ?AUTO_3299 ?AUTO_3301 ) ) ( not ( = ?AUTO_3300 ?AUTO_3301 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3300 ?AUTO_3301 )
      ( MAKE-ON ?AUTO_3298 ?AUTO_3299 )
      ( MAKE-ON-VERIFY ?AUTO_3298 ?AUTO_3299 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3302 - BLOCK
      ?AUTO_3303 - BLOCK
    )
    :vars
    (
      ?AUTO_3304 - BLOCK
      ?AUTO_3305 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3303 ) ( not ( = ?AUTO_3302 ?AUTO_3303 ) ) ( ON-TABLE ?AUTO_3302 ) ( CLEAR ?AUTO_3304 ) ( not ( = ?AUTO_3302 ?AUTO_3305 ) ) ( not ( = ?AUTO_3302 ?AUTO_3304 ) ) ( not ( = ?AUTO_3303 ?AUTO_3305 ) ) ( not ( = ?AUTO_3303 ?AUTO_3304 ) ) ( not ( = ?AUTO_3305 ?AUTO_3304 ) ) ( ON ?AUTO_3305 ?AUTO_3302 ) ( CLEAR ?AUTO_3305 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3305 ?AUTO_3302 )
      ( MAKE-ON ?AUTO_3302 ?AUTO_3303 )
      ( MAKE-ON-VERIFY ?AUTO_3302 ?AUTO_3303 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3306 - BLOCK
      ?AUTO_3307 - BLOCK
    )
    :vars
    (
      ?AUTO_3309 - BLOCK
      ?AUTO_3308 - BLOCK
      ?AUTO_3310 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3307 ) ( not ( = ?AUTO_3306 ?AUTO_3307 ) ) ( ON-TABLE ?AUTO_3306 ) ( CLEAR ?AUTO_3309 ) ( not ( = ?AUTO_3306 ?AUTO_3308 ) ) ( not ( = ?AUTO_3306 ?AUTO_3309 ) ) ( not ( = ?AUTO_3307 ?AUTO_3308 ) ) ( not ( = ?AUTO_3307 ?AUTO_3309 ) ) ( not ( = ?AUTO_3308 ?AUTO_3309 ) ) ( ON ?AUTO_3308 ?AUTO_3306 ) ( CLEAR ?AUTO_3308 ) ( HOLDING ?AUTO_3310 ) ( not ( = ?AUTO_3306 ?AUTO_3310 ) ) ( not ( = ?AUTO_3307 ?AUTO_3310 ) ) ( not ( = ?AUTO_3309 ?AUTO_3310 ) ) ( not ( = ?AUTO_3308 ?AUTO_3310 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3310 )
      ( MAKE-ON ?AUTO_3306 ?AUTO_3307 )
      ( MAKE-ON-VERIFY ?AUTO_3306 ?AUTO_3307 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3313 - BLOCK
      ?AUTO_3314 - BLOCK
    )
    :vars
    (
      ?AUTO_3315 - BLOCK
      ?AUTO_3316 - BLOCK
      ?AUTO_3317 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3313 ?AUTO_3314 ) ) ( ON-TABLE ?AUTO_3313 ) ( CLEAR ?AUTO_3315 ) ( not ( = ?AUTO_3313 ?AUTO_3316 ) ) ( not ( = ?AUTO_3313 ?AUTO_3315 ) ) ( not ( = ?AUTO_3314 ?AUTO_3316 ) ) ( not ( = ?AUTO_3314 ?AUTO_3315 ) ) ( not ( = ?AUTO_3316 ?AUTO_3315 ) ) ( ON ?AUTO_3316 ?AUTO_3313 ) ( CLEAR ?AUTO_3316 ) ( HOLDING ?AUTO_3314 ) ( CLEAR ?AUTO_3317 ) ( not ( = ?AUTO_3313 ?AUTO_3317 ) ) ( not ( = ?AUTO_3314 ?AUTO_3317 ) ) ( not ( = ?AUTO_3315 ?AUTO_3317 ) ) ( not ( = ?AUTO_3316 ?AUTO_3317 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3314 ?AUTO_3317 )
      ( MAKE-ON ?AUTO_3313 ?AUTO_3314 )
      ( MAKE-ON-VERIFY ?AUTO_3313 ?AUTO_3314 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3321 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3321 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3321 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3321 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3322 - BLOCK
    )
    :vars
    (
      ?AUTO_3323 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3322 ?AUTO_3323 ) ( CLEAR ?AUTO_3322 ) ( HAND-EMPTY ) ( not ( = ?AUTO_3322 ?AUTO_3323 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3322 ?AUTO_3323 )
      ( MAKE-ON-TABLE ?AUTO_3322 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3322 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3324 - BLOCK
    )
    :vars
    (
      ?AUTO_3325 - BLOCK
      ?AUTO_3326 - BLOCK
      ?AUTO_3327 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3324 ?AUTO_3325 ) ( CLEAR ?AUTO_3324 ) ( not ( = ?AUTO_3324 ?AUTO_3325 ) ) ( HOLDING ?AUTO_3326 ) ( CLEAR ?AUTO_3327 ) ( not ( = ?AUTO_3324 ?AUTO_3326 ) ) ( not ( = ?AUTO_3324 ?AUTO_3327 ) ) ( not ( = ?AUTO_3325 ?AUTO_3326 ) ) ( not ( = ?AUTO_3325 ?AUTO_3327 ) ) ( not ( = ?AUTO_3326 ?AUTO_3327 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3326 ?AUTO_3327 )
      ( MAKE-ON-TABLE ?AUTO_3324 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3324 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3336 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3336 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3336 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3336 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3337 - BLOCK
    )
    :vars
    (
      ?AUTO_3338 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3337 ?AUTO_3338 ) ( CLEAR ?AUTO_3337 ) ( HAND-EMPTY ) ( not ( = ?AUTO_3337 ?AUTO_3338 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3337 ?AUTO_3338 )
      ( MAKE-ON-TABLE ?AUTO_3337 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3337 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3339 - BLOCK
    )
    :vars
    (
      ?AUTO_3340 - BLOCK
      ?AUTO_3341 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3339 ?AUTO_3340 ) ( CLEAR ?AUTO_3339 ) ( not ( = ?AUTO_3339 ?AUTO_3340 ) ) ( HOLDING ?AUTO_3341 ) ( not ( = ?AUTO_3339 ?AUTO_3341 ) ) ( not ( = ?AUTO_3340 ?AUTO_3341 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3341 )
      ( MAKE-ON-TABLE ?AUTO_3339 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3339 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3342 - BLOCK
    )
    :vars
    (
      ?AUTO_3343 - BLOCK
      ?AUTO_3344 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3342 ?AUTO_3343 ) ( not ( = ?AUTO_3342 ?AUTO_3343 ) ) ( not ( = ?AUTO_3342 ?AUTO_3344 ) ) ( not ( = ?AUTO_3343 ?AUTO_3344 ) ) ( ON ?AUTO_3344 ?AUTO_3342 ) ( CLEAR ?AUTO_3344 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3344 ?AUTO_3342 )
      ( MAKE-ON-TABLE ?AUTO_3342 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3342 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3345 - BLOCK
    )
    :vars
    (
      ?AUTO_3346 - BLOCK
      ?AUTO_3347 - BLOCK
      ?AUTO_3348 - BLOCK
      ?AUTO_3349 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3345 ?AUTO_3346 ) ( not ( = ?AUTO_3345 ?AUTO_3346 ) ) ( not ( = ?AUTO_3345 ?AUTO_3347 ) ) ( not ( = ?AUTO_3346 ?AUTO_3347 ) ) ( ON ?AUTO_3347 ?AUTO_3345 ) ( CLEAR ?AUTO_3347 ) ( HOLDING ?AUTO_3348 ) ( CLEAR ?AUTO_3349 ) ( not ( = ?AUTO_3345 ?AUTO_3348 ) ) ( not ( = ?AUTO_3345 ?AUTO_3349 ) ) ( not ( = ?AUTO_3346 ?AUTO_3348 ) ) ( not ( = ?AUTO_3346 ?AUTO_3349 ) ) ( not ( = ?AUTO_3347 ?AUTO_3348 ) ) ( not ( = ?AUTO_3347 ?AUTO_3349 ) ) ( not ( = ?AUTO_3348 ?AUTO_3349 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3348 ?AUTO_3349 )
      ( MAKE-ON-TABLE ?AUTO_3345 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3345 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3356 - BLOCK
    )
    :vars
    (
      ?AUTO_3360 - BLOCK
      ?AUTO_3359 - BLOCK
      ?AUTO_3358 - BLOCK
      ?AUTO_3357 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3356 ?AUTO_3360 ) ( not ( = ?AUTO_3356 ?AUTO_3360 ) ) ( not ( = ?AUTO_3356 ?AUTO_3359 ) ) ( not ( = ?AUTO_3360 ?AUTO_3359 ) ) ( ON ?AUTO_3359 ?AUTO_3356 ) ( CLEAR ?AUTO_3358 ) ( not ( = ?AUTO_3356 ?AUTO_3357 ) ) ( not ( = ?AUTO_3356 ?AUTO_3358 ) ) ( not ( = ?AUTO_3360 ?AUTO_3357 ) ) ( not ( = ?AUTO_3360 ?AUTO_3358 ) ) ( not ( = ?AUTO_3359 ?AUTO_3357 ) ) ( not ( = ?AUTO_3359 ?AUTO_3358 ) ) ( not ( = ?AUTO_3357 ?AUTO_3358 ) ) ( ON ?AUTO_3357 ?AUTO_3359 ) ( CLEAR ?AUTO_3357 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3357 ?AUTO_3359 )
      ( MAKE-ON-TABLE ?AUTO_3356 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3356 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3363 - BLOCK
      ?AUTO_3364 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3363 ) ( CLEAR ?AUTO_3364 ) ( not ( = ?AUTO_3363 ?AUTO_3364 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3363 ?AUTO_3364 )
      ( MAKE-ON-VERIFY ?AUTO_3363 ?AUTO_3364 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3365 - BLOCK
      ?AUTO_3366 - BLOCK
    )
    :vars
    (
      ?AUTO_3367 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3366 ) ( not ( = ?AUTO_3365 ?AUTO_3366 ) ) ( ON ?AUTO_3365 ?AUTO_3367 ) ( CLEAR ?AUTO_3365 ) ( HAND-EMPTY ) ( not ( = ?AUTO_3365 ?AUTO_3367 ) ) ( not ( = ?AUTO_3366 ?AUTO_3367 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3365 ?AUTO_3367 )
      ( MAKE-ON ?AUTO_3365 ?AUTO_3366 )
      ( MAKE-ON-VERIFY ?AUTO_3365 ?AUTO_3366 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3368 - BLOCK
      ?AUTO_3369 - BLOCK
    )
    :vars
    (
      ?AUTO_3370 - BLOCK
      ?AUTO_3371 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3369 ) ( not ( = ?AUTO_3368 ?AUTO_3369 ) ) ( ON ?AUTO_3368 ?AUTO_3370 ) ( CLEAR ?AUTO_3368 ) ( not ( = ?AUTO_3368 ?AUTO_3370 ) ) ( not ( = ?AUTO_3369 ?AUTO_3370 ) ) ( HOLDING ?AUTO_3371 ) ( not ( = ?AUTO_3368 ?AUTO_3371 ) ) ( not ( = ?AUTO_3369 ?AUTO_3371 ) ) ( not ( = ?AUTO_3370 ?AUTO_3371 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3371 )
      ( MAKE-ON ?AUTO_3368 ?AUTO_3369 )
      ( MAKE-ON-VERIFY ?AUTO_3368 ?AUTO_3369 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3372 - BLOCK
      ?AUTO_3373 - BLOCK
    )
    :vars
    (
      ?AUTO_3374 - BLOCK
      ?AUTO_3375 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3373 ) ( not ( = ?AUTO_3372 ?AUTO_3373 ) ) ( ON ?AUTO_3372 ?AUTO_3374 ) ( not ( = ?AUTO_3372 ?AUTO_3374 ) ) ( not ( = ?AUTO_3373 ?AUTO_3374 ) ) ( not ( = ?AUTO_3372 ?AUTO_3375 ) ) ( not ( = ?AUTO_3373 ?AUTO_3375 ) ) ( not ( = ?AUTO_3374 ?AUTO_3375 ) ) ( ON ?AUTO_3375 ?AUTO_3372 ) ( CLEAR ?AUTO_3375 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3375 ?AUTO_3372 )
      ( MAKE-ON ?AUTO_3372 ?AUTO_3373 )
      ( MAKE-ON-VERIFY ?AUTO_3372 ?AUTO_3373 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3376 - BLOCK
      ?AUTO_3377 - BLOCK
    )
    :vars
    (
      ?AUTO_3378 - BLOCK
      ?AUTO_3379 - BLOCK
      ?AUTO_3380 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3377 ) ( not ( = ?AUTO_3376 ?AUTO_3377 ) ) ( ON ?AUTO_3376 ?AUTO_3378 ) ( not ( = ?AUTO_3376 ?AUTO_3378 ) ) ( not ( = ?AUTO_3377 ?AUTO_3378 ) ) ( not ( = ?AUTO_3376 ?AUTO_3379 ) ) ( not ( = ?AUTO_3377 ?AUTO_3379 ) ) ( not ( = ?AUTO_3378 ?AUTO_3379 ) ) ( ON ?AUTO_3379 ?AUTO_3376 ) ( CLEAR ?AUTO_3379 ) ( HOLDING ?AUTO_3380 ) ( not ( = ?AUTO_3376 ?AUTO_3380 ) ) ( not ( = ?AUTO_3377 ?AUTO_3380 ) ) ( not ( = ?AUTO_3378 ?AUTO_3380 ) ) ( not ( = ?AUTO_3379 ?AUTO_3380 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3380 )
      ( MAKE-ON ?AUTO_3376 ?AUTO_3377 )
      ( MAKE-ON-VERIFY ?AUTO_3376 ?AUTO_3377 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3381 - BLOCK
      ?AUTO_3382 - BLOCK
    )
    :vars
    (
      ?AUTO_3383 - BLOCK
      ?AUTO_3384 - BLOCK
      ?AUTO_3385 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3382 ) ( not ( = ?AUTO_3381 ?AUTO_3382 ) ) ( ON ?AUTO_3381 ?AUTO_3383 ) ( not ( = ?AUTO_3381 ?AUTO_3383 ) ) ( not ( = ?AUTO_3382 ?AUTO_3383 ) ) ( not ( = ?AUTO_3381 ?AUTO_3384 ) ) ( not ( = ?AUTO_3382 ?AUTO_3384 ) ) ( not ( = ?AUTO_3383 ?AUTO_3384 ) ) ( ON ?AUTO_3384 ?AUTO_3381 ) ( not ( = ?AUTO_3381 ?AUTO_3385 ) ) ( not ( = ?AUTO_3382 ?AUTO_3385 ) ) ( not ( = ?AUTO_3383 ?AUTO_3385 ) ) ( not ( = ?AUTO_3384 ?AUTO_3385 ) ) ( ON ?AUTO_3385 ?AUTO_3384 ) ( CLEAR ?AUTO_3385 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3385 ?AUTO_3384 )
      ( MAKE-ON ?AUTO_3381 ?AUTO_3382 )
      ( MAKE-ON-VERIFY ?AUTO_3381 ?AUTO_3382 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3386 - BLOCK
      ?AUTO_3387 - BLOCK
    )
    :vars
    (
      ?AUTO_3388 - BLOCK
      ?AUTO_3389 - BLOCK
      ?AUTO_3390 - BLOCK
      ?AUTO_3391 - BLOCK
      ?AUTO_3392 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3387 ) ( not ( = ?AUTO_3386 ?AUTO_3387 ) ) ( ON ?AUTO_3386 ?AUTO_3388 ) ( not ( = ?AUTO_3386 ?AUTO_3388 ) ) ( not ( = ?AUTO_3387 ?AUTO_3388 ) ) ( not ( = ?AUTO_3386 ?AUTO_3389 ) ) ( not ( = ?AUTO_3387 ?AUTO_3389 ) ) ( not ( = ?AUTO_3388 ?AUTO_3389 ) ) ( ON ?AUTO_3389 ?AUTO_3386 ) ( not ( = ?AUTO_3386 ?AUTO_3390 ) ) ( not ( = ?AUTO_3387 ?AUTO_3390 ) ) ( not ( = ?AUTO_3388 ?AUTO_3390 ) ) ( not ( = ?AUTO_3389 ?AUTO_3390 ) ) ( ON ?AUTO_3390 ?AUTO_3389 ) ( CLEAR ?AUTO_3390 ) ( HOLDING ?AUTO_3391 ) ( CLEAR ?AUTO_3392 ) ( not ( = ?AUTO_3386 ?AUTO_3391 ) ) ( not ( = ?AUTO_3386 ?AUTO_3392 ) ) ( not ( = ?AUTO_3387 ?AUTO_3391 ) ) ( not ( = ?AUTO_3387 ?AUTO_3392 ) ) ( not ( = ?AUTO_3388 ?AUTO_3391 ) ) ( not ( = ?AUTO_3388 ?AUTO_3392 ) ) ( not ( = ?AUTO_3389 ?AUTO_3391 ) ) ( not ( = ?AUTO_3389 ?AUTO_3392 ) ) ( not ( = ?AUTO_3390 ?AUTO_3391 ) ) ( not ( = ?AUTO_3390 ?AUTO_3392 ) ) ( not ( = ?AUTO_3391 ?AUTO_3392 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3391 ?AUTO_3392 )
      ( MAKE-ON ?AUTO_3386 ?AUTO_3387 )
      ( MAKE-ON-VERIFY ?AUTO_3386 ?AUTO_3387 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3399 - BLOCK
      ?AUTO_3400 - BLOCK
    )
    :vars
    (
      ?AUTO_3401 - BLOCK
      ?AUTO_3402 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3399 ?AUTO_3400 ) ) ( ON ?AUTO_3399 ?AUTO_3401 ) ( not ( = ?AUTO_3399 ?AUTO_3401 ) ) ( not ( = ?AUTO_3400 ?AUTO_3401 ) ) ( not ( = ?AUTO_3399 ?AUTO_3402 ) ) ( not ( = ?AUTO_3400 ?AUTO_3402 ) ) ( not ( = ?AUTO_3401 ?AUTO_3402 ) ) ( ON ?AUTO_3402 ?AUTO_3399 ) ( CLEAR ?AUTO_3402 ) ( HOLDING ?AUTO_3400 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3400 )
      ( MAKE-ON ?AUTO_3399 ?AUTO_3400 )
      ( MAKE-ON-VERIFY ?AUTO_3399 ?AUTO_3400 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3403 - BLOCK
      ?AUTO_3404 - BLOCK
    )
    :vars
    (
      ?AUTO_3406 - BLOCK
      ?AUTO_3405 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3403 ?AUTO_3404 ) ) ( ON ?AUTO_3403 ?AUTO_3406 ) ( not ( = ?AUTO_3403 ?AUTO_3406 ) ) ( not ( = ?AUTO_3404 ?AUTO_3406 ) ) ( not ( = ?AUTO_3403 ?AUTO_3405 ) ) ( not ( = ?AUTO_3404 ?AUTO_3405 ) ) ( not ( = ?AUTO_3406 ?AUTO_3405 ) ) ( ON ?AUTO_3405 ?AUTO_3403 ) ( ON ?AUTO_3404 ?AUTO_3405 ) ( CLEAR ?AUTO_3404 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3404 ?AUTO_3405 )
      ( MAKE-ON ?AUTO_3403 ?AUTO_3404 )
      ( MAKE-ON-VERIFY ?AUTO_3403 ?AUTO_3404 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3407 - BLOCK
      ?AUTO_3408 - BLOCK
    )
    :vars
    (
      ?AUTO_3409 - BLOCK
      ?AUTO_3410 - BLOCK
      ?AUTO_3411 - BLOCK
      ?AUTO_3412 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3407 ?AUTO_3408 ) ) ( ON ?AUTO_3407 ?AUTO_3409 ) ( not ( = ?AUTO_3407 ?AUTO_3409 ) ) ( not ( = ?AUTO_3408 ?AUTO_3409 ) ) ( not ( = ?AUTO_3407 ?AUTO_3410 ) ) ( not ( = ?AUTO_3408 ?AUTO_3410 ) ) ( not ( = ?AUTO_3409 ?AUTO_3410 ) ) ( ON ?AUTO_3410 ?AUTO_3407 ) ( ON ?AUTO_3408 ?AUTO_3410 ) ( CLEAR ?AUTO_3408 ) ( HOLDING ?AUTO_3411 ) ( CLEAR ?AUTO_3412 ) ( not ( = ?AUTO_3407 ?AUTO_3411 ) ) ( not ( = ?AUTO_3407 ?AUTO_3412 ) ) ( not ( = ?AUTO_3408 ?AUTO_3411 ) ) ( not ( = ?AUTO_3408 ?AUTO_3412 ) ) ( not ( = ?AUTO_3409 ?AUTO_3411 ) ) ( not ( = ?AUTO_3409 ?AUTO_3412 ) ) ( not ( = ?AUTO_3410 ?AUTO_3411 ) ) ( not ( = ?AUTO_3410 ?AUTO_3412 ) ) ( not ( = ?AUTO_3411 ?AUTO_3412 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3411 ?AUTO_3412 )
      ( MAKE-ON ?AUTO_3407 ?AUTO_3408 )
      ( MAKE-ON-VERIFY ?AUTO_3407 ?AUTO_3408 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3413 - BLOCK
      ?AUTO_3414 - BLOCK
    )
    :vars
    (
      ?AUTO_3416 - BLOCK
      ?AUTO_3417 - BLOCK
      ?AUTO_3415 - BLOCK
      ?AUTO_3418 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3413 ?AUTO_3414 ) ) ( ON ?AUTO_3413 ?AUTO_3416 ) ( not ( = ?AUTO_3413 ?AUTO_3416 ) ) ( not ( = ?AUTO_3414 ?AUTO_3416 ) ) ( not ( = ?AUTO_3413 ?AUTO_3417 ) ) ( not ( = ?AUTO_3414 ?AUTO_3417 ) ) ( not ( = ?AUTO_3416 ?AUTO_3417 ) ) ( ON ?AUTO_3417 ?AUTO_3413 ) ( ON ?AUTO_3414 ?AUTO_3417 ) ( CLEAR ?AUTO_3415 ) ( not ( = ?AUTO_3413 ?AUTO_3418 ) ) ( not ( = ?AUTO_3413 ?AUTO_3415 ) ) ( not ( = ?AUTO_3414 ?AUTO_3418 ) ) ( not ( = ?AUTO_3414 ?AUTO_3415 ) ) ( not ( = ?AUTO_3416 ?AUTO_3418 ) ) ( not ( = ?AUTO_3416 ?AUTO_3415 ) ) ( not ( = ?AUTO_3417 ?AUTO_3418 ) ) ( not ( = ?AUTO_3417 ?AUTO_3415 ) ) ( not ( = ?AUTO_3418 ?AUTO_3415 ) ) ( ON ?AUTO_3418 ?AUTO_3414 ) ( CLEAR ?AUTO_3418 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3418 ?AUTO_3414 )
      ( MAKE-ON ?AUTO_3413 ?AUTO_3414 )
      ( MAKE-ON-VERIFY ?AUTO_3413 ?AUTO_3414 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3421 - BLOCK
      ?AUTO_3422 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3421 ) ( CLEAR ?AUTO_3422 ) ( not ( = ?AUTO_3421 ?AUTO_3422 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3421 ?AUTO_3422 )
      ( MAKE-ON-VERIFY ?AUTO_3421 ?AUTO_3422 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3423 - BLOCK
      ?AUTO_3424 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3424 ) ( not ( = ?AUTO_3423 ?AUTO_3424 ) ) ( ON-TABLE ?AUTO_3423 ) ( CLEAR ?AUTO_3423 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_3423 )
      ( MAKE-ON ?AUTO_3423 ?AUTO_3424 )
      ( MAKE-ON-VERIFY ?AUTO_3423 ?AUTO_3424 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3425 - BLOCK
      ?AUTO_3426 - BLOCK
    )
    :vars
    (
      ?AUTO_3427 - BLOCK
      ?AUTO_3428 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3426 ) ( not ( = ?AUTO_3425 ?AUTO_3426 ) ) ( ON-TABLE ?AUTO_3425 ) ( CLEAR ?AUTO_3425 ) ( HOLDING ?AUTO_3427 ) ( CLEAR ?AUTO_3428 ) ( not ( = ?AUTO_3425 ?AUTO_3427 ) ) ( not ( = ?AUTO_3425 ?AUTO_3428 ) ) ( not ( = ?AUTO_3426 ?AUTO_3427 ) ) ( not ( = ?AUTO_3426 ?AUTO_3428 ) ) ( not ( = ?AUTO_3427 ?AUTO_3428 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3427 ?AUTO_3428 )
      ( MAKE-ON ?AUTO_3425 ?AUTO_3426 )
      ( MAKE-ON-VERIFY ?AUTO_3425 ?AUTO_3426 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3431 - BLOCK
      ?AUTO_3432 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3431 ?AUTO_3432 ) ) ( ON-TABLE ?AUTO_3431 ) ( CLEAR ?AUTO_3431 ) ( HOLDING ?AUTO_3432 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3432 )
      ( MAKE-ON ?AUTO_3431 ?AUTO_3432 )
      ( MAKE-ON-VERIFY ?AUTO_3431 ?AUTO_3432 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3460 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3460 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3460 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3460 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3461 - BLOCK
    )
    :vars
    (
      ?AUTO_3462 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3461 ?AUTO_3462 ) ( CLEAR ?AUTO_3461 ) ( HAND-EMPTY ) ( not ( = ?AUTO_3461 ?AUTO_3462 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3461 ?AUTO_3462 )
      ( MAKE-ON-TABLE ?AUTO_3461 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3461 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3463 - BLOCK
    )
    :vars
    (
      ?AUTO_3464 - BLOCK
      ?AUTO_3465 - BLOCK
      ?AUTO_3466 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3463 ?AUTO_3464 ) ( CLEAR ?AUTO_3463 ) ( not ( = ?AUTO_3463 ?AUTO_3464 ) ) ( HOLDING ?AUTO_3465 ) ( CLEAR ?AUTO_3466 ) ( not ( = ?AUTO_3463 ?AUTO_3465 ) ) ( not ( = ?AUTO_3463 ?AUTO_3466 ) ) ( not ( = ?AUTO_3464 ?AUTO_3465 ) ) ( not ( = ?AUTO_3464 ?AUTO_3466 ) ) ( not ( = ?AUTO_3465 ?AUTO_3466 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3465 ?AUTO_3466 )
      ( MAKE-ON-TABLE ?AUTO_3463 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3463 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3471 - BLOCK
    )
    :vars
    (
      ?AUTO_3474 - BLOCK
      ?AUTO_3472 - BLOCK
      ?AUTO_3473 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3471 ?AUTO_3474 ) ( not ( = ?AUTO_3471 ?AUTO_3474 ) ) ( CLEAR ?AUTO_3472 ) ( not ( = ?AUTO_3471 ?AUTO_3473 ) ) ( not ( = ?AUTO_3471 ?AUTO_3472 ) ) ( not ( = ?AUTO_3474 ?AUTO_3473 ) ) ( not ( = ?AUTO_3474 ?AUTO_3472 ) ) ( not ( = ?AUTO_3473 ?AUTO_3472 ) ) ( ON ?AUTO_3473 ?AUTO_3471 ) ( CLEAR ?AUTO_3473 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3473 ?AUTO_3471 )
      ( MAKE-ON-TABLE ?AUTO_3471 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3471 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3475 - BLOCK
    )
    :vars
    (
      ?AUTO_3478 - BLOCK
      ?AUTO_3477 - BLOCK
      ?AUTO_3476 - BLOCK
      ?AUTO_3479 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3475 ?AUTO_3478 ) ( not ( = ?AUTO_3475 ?AUTO_3478 ) ) ( CLEAR ?AUTO_3477 ) ( not ( = ?AUTO_3475 ?AUTO_3476 ) ) ( not ( = ?AUTO_3475 ?AUTO_3477 ) ) ( not ( = ?AUTO_3478 ?AUTO_3476 ) ) ( not ( = ?AUTO_3478 ?AUTO_3477 ) ) ( not ( = ?AUTO_3476 ?AUTO_3477 ) ) ( ON ?AUTO_3476 ?AUTO_3475 ) ( CLEAR ?AUTO_3476 ) ( HOLDING ?AUTO_3479 ) ( not ( = ?AUTO_3475 ?AUTO_3479 ) ) ( not ( = ?AUTO_3478 ?AUTO_3479 ) ) ( not ( = ?AUTO_3477 ?AUTO_3479 ) ) ( not ( = ?AUTO_3476 ?AUTO_3479 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3479 )
      ( MAKE-ON-TABLE ?AUTO_3475 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3475 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3480 - BLOCK
    )
    :vars
    (
      ?AUTO_3484 - BLOCK
      ?AUTO_3481 - BLOCK
      ?AUTO_3483 - BLOCK
      ?AUTO_3482 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3480 ?AUTO_3484 ) ( not ( = ?AUTO_3480 ?AUTO_3484 ) ) ( CLEAR ?AUTO_3481 ) ( not ( = ?AUTO_3480 ?AUTO_3483 ) ) ( not ( = ?AUTO_3480 ?AUTO_3481 ) ) ( not ( = ?AUTO_3484 ?AUTO_3483 ) ) ( not ( = ?AUTO_3484 ?AUTO_3481 ) ) ( not ( = ?AUTO_3483 ?AUTO_3481 ) ) ( ON ?AUTO_3483 ?AUTO_3480 ) ( not ( = ?AUTO_3480 ?AUTO_3482 ) ) ( not ( = ?AUTO_3484 ?AUTO_3482 ) ) ( not ( = ?AUTO_3481 ?AUTO_3482 ) ) ( not ( = ?AUTO_3483 ?AUTO_3482 ) ) ( ON ?AUTO_3482 ?AUTO_3483 ) ( CLEAR ?AUTO_3482 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3482 ?AUTO_3483 )
      ( MAKE-ON-TABLE ?AUTO_3480 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3480 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3485 - BLOCK
    )
    :vars
    (
      ?AUTO_3486 - BLOCK
      ?AUTO_3488 - BLOCK
      ?AUTO_3487 - BLOCK
      ?AUTO_3489 - BLOCK
      ?AUTO_3490 - BLOCK
      ?AUTO_3491 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3485 ?AUTO_3486 ) ( not ( = ?AUTO_3485 ?AUTO_3486 ) ) ( CLEAR ?AUTO_3488 ) ( not ( = ?AUTO_3485 ?AUTO_3487 ) ) ( not ( = ?AUTO_3485 ?AUTO_3488 ) ) ( not ( = ?AUTO_3486 ?AUTO_3487 ) ) ( not ( = ?AUTO_3486 ?AUTO_3488 ) ) ( not ( = ?AUTO_3487 ?AUTO_3488 ) ) ( ON ?AUTO_3487 ?AUTO_3485 ) ( not ( = ?AUTO_3485 ?AUTO_3489 ) ) ( not ( = ?AUTO_3486 ?AUTO_3489 ) ) ( not ( = ?AUTO_3488 ?AUTO_3489 ) ) ( not ( = ?AUTO_3487 ?AUTO_3489 ) ) ( ON ?AUTO_3489 ?AUTO_3487 ) ( CLEAR ?AUTO_3489 ) ( HOLDING ?AUTO_3490 ) ( CLEAR ?AUTO_3491 ) ( not ( = ?AUTO_3485 ?AUTO_3490 ) ) ( not ( = ?AUTO_3485 ?AUTO_3491 ) ) ( not ( = ?AUTO_3486 ?AUTO_3490 ) ) ( not ( = ?AUTO_3486 ?AUTO_3491 ) ) ( not ( = ?AUTO_3488 ?AUTO_3490 ) ) ( not ( = ?AUTO_3488 ?AUTO_3491 ) ) ( not ( = ?AUTO_3487 ?AUTO_3490 ) ) ( not ( = ?AUTO_3487 ?AUTO_3491 ) ) ( not ( = ?AUTO_3489 ?AUTO_3490 ) ) ( not ( = ?AUTO_3489 ?AUTO_3491 ) ) ( not ( = ?AUTO_3490 ?AUTO_3491 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3490 ?AUTO_3491 )
      ( MAKE-ON-TABLE ?AUTO_3485 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3485 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3498 - BLOCK
    )
    :vars
    (
      ?AUTO_3502 - BLOCK
      ?AUTO_3504 - BLOCK
      ?AUTO_3503 - BLOCK
      ?AUTO_3501 - BLOCK
      ?AUTO_3499 - BLOCK
      ?AUTO_3500 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3498 ?AUTO_3502 ) ( not ( = ?AUTO_3498 ?AUTO_3502 ) ) ( CLEAR ?AUTO_3504 ) ( not ( = ?AUTO_3498 ?AUTO_3503 ) ) ( not ( = ?AUTO_3498 ?AUTO_3504 ) ) ( not ( = ?AUTO_3502 ?AUTO_3503 ) ) ( not ( = ?AUTO_3502 ?AUTO_3504 ) ) ( not ( = ?AUTO_3503 ?AUTO_3504 ) ) ( ON ?AUTO_3503 ?AUTO_3498 ) ( not ( = ?AUTO_3498 ?AUTO_3501 ) ) ( not ( = ?AUTO_3502 ?AUTO_3501 ) ) ( not ( = ?AUTO_3504 ?AUTO_3501 ) ) ( not ( = ?AUTO_3503 ?AUTO_3501 ) ) ( ON ?AUTO_3501 ?AUTO_3503 ) ( CLEAR ?AUTO_3499 ) ( not ( = ?AUTO_3498 ?AUTO_3500 ) ) ( not ( = ?AUTO_3498 ?AUTO_3499 ) ) ( not ( = ?AUTO_3502 ?AUTO_3500 ) ) ( not ( = ?AUTO_3502 ?AUTO_3499 ) ) ( not ( = ?AUTO_3504 ?AUTO_3500 ) ) ( not ( = ?AUTO_3504 ?AUTO_3499 ) ) ( not ( = ?AUTO_3503 ?AUTO_3500 ) ) ( not ( = ?AUTO_3503 ?AUTO_3499 ) ) ( not ( = ?AUTO_3501 ?AUTO_3500 ) ) ( not ( = ?AUTO_3501 ?AUTO_3499 ) ) ( not ( = ?AUTO_3500 ?AUTO_3499 ) ) ( ON ?AUTO_3500 ?AUTO_3501 ) ( CLEAR ?AUTO_3500 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3500 ?AUTO_3501 )
      ( MAKE-ON-TABLE ?AUTO_3498 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3498 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3507 - BLOCK
      ?AUTO_3508 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3507 ) ( CLEAR ?AUTO_3508 ) ( not ( = ?AUTO_3507 ?AUTO_3508 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3507 ?AUTO_3508 )
      ( MAKE-ON-VERIFY ?AUTO_3507 ?AUTO_3508 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3509 - BLOCK
      ?AUTO_3510 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3510 ) ( not ( = ?AUTO_3509 ?AUTO_3510 ) ) ( ON-TABLE ?AUTO_3509 ) ( CLEAR ?AUTO_3509 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_3509 )
      ( MAKE-ON ?AUTO_3509 ?AUTO_3510 )
      ( MAKE-ON-VERIFY ?AUTO_3509 ?AUTO_3510 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3511 - BLOCK
      ?AUTO_3512 - BLOCK
    )
    :vars
    (
      ?AUTO_3513 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3512 ) ( not ( = ?AUTO_3511 ?AUTO_3512 ) ) ( ON-TABLE ?AUTO_3511 ) ( CLEAR ?AUTO_3511 ) ( HOLDING ?AUTO_3513 ) ( not ( = ?AUTO_3511 ?AUTO_3513 ) ) ( not ( = ?AUTO_3512 ?AUTO_3513 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3513 )
      ( MAKE-ON ?AUTO_3511 ?AUTO_3512 )
      ( MAKE-ON-VERIFY ?AUTO_3511 ?AUTO_3512 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3514 - BLOCK
      ?AUTO_3515 - BLOCK
    )
    :vars
    (
      ?AUTO_3516 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3515 ) ( not ( = ?AUTO_3514 ?AUTO_3515 ) ) ( ON-TABLE ?AUTO_3514 ) ( not ( = ?AUTO_3514 ?AUTO_3516 ) ) ( not ( = ?AUTO_3515 ?AUTO_3516 ) ) ( ON ?AUTO_3516 ?AUTO_3514 ) ( CLEAR ?AUTO_3516 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3516 ?AUTO_3514 )
      ( MAKE-ON ?AUTO_3514 ?AUTO_3515 )
      ( MAKE-ON-VERIFY ?AUTO_3514 ?AUTO_3515 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3517 - BLOCK
      ?AUTO_3518 - BLOCK
    )
    :vars
    (
      ?AUTO_3519 - BLOCK
      ?AUTO_3520 - BLOCK
      ?AUTO_3521 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3518 ) ( not ( = ?AUTO_3517 ?AUTO_3518 ) ) ( ON-TABLE ?AUTO_3517 ) ( not ( = ?AUTO_3517 ?AUTO_3519 ) ) ( not ( = ?AUTO_3518 ?AUTO_3519 ) ) ( ON ?AUTO_3519 ?AUTO_3517 ) ( CLEAR ?AUTO_3519 ) ( HOLDING ?AUTO_3520 ) ( CLEAR ?AUTO_3521 ) ( not ( = ?AUTO_3517 ?AUTO_3520 ) ) ( not ( = ?AUTO_3517 ?AUTO_3521 ) ) ( not ( = ?AUTO_3518 ?AUTO_3520 ) ) ( not ( = ?AUTO_3518 ?AUTO_3521 ) ) ( not ( = ?AUTO_3519 ?AUTO_3520 ) ) ( not ( = ?AUTO_3519 ?AUTO_3521 ) ) ( not ( = ?AUTO_3520 ?AUTO_3521 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3520 ?AUTO_3521 )
      ( MAKE-ON ?AUTO_3517 ?AUTO_3518 )
      ( MAKE-ON-VERIFY ?AUTO_3517 ?AUTO_3518 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3526 - BLOCK
      ?AUTO_3527 - BLOCK
    )
    :vars
    (
      ?AUTO_3528 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3526 ?AUTO_3527 ) ) ( ON-TABLE ?AUTO_3526 ) ( CLEAR ?AUTO_3526 ) ( not ( = ?AUTO_3526 ?AUTO_3528 ) ) ( not ( = ?AUTO_3527 ?AUTO_3528 ) ) ( ON ?AUTO_3528 ?AUTO_3527 ) ( CLEAR ?AUTO_3528 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3528 ?AUTO_3527 )
      ( MAKE-ON ?AUTO_3526 ?AUTO_3527 )
      ( MAKE-ON-VERIFY ?AUTO_3526 ?AUTO_3527 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3529 - BLOCK
      ?AUTO_3530 - BLOCK
    )
    :vars
    (
      ?AUTO_3531 - BLOCK
      ?AUTO_3532 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3529 ?AUTO_3530 ) ) ( ON-TABLE ?AUTO_3529 ) ( CLEAR ?AUTO_3529 ) ( not ( = ?AUTO_3529 ?AUTO_3531 ) ) ( not ( = ?AUTO_3530 ?AUTO_3531 ) ) ( ON ?AUTO_3531 ?AUTO_3530 ) ( CLEAR ?AUTO_3531 ) ( HOLDING ?AUTO_3532 ) ( not ( = ?AUTO_3529 ?AUTO_3532 ) ) ( not ( = ?AUTO_3530 ?AUTO_3532 ) ) ( not ( = ?AUTO_3531 ?AUTO_3532 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3532 )
      ( MAKE-ON ?AUTO_3529 ?AUTO_3530 )
      ( MAKE-ON-VERIFY ?AUTO_3529 ?AUTO_3530 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3533 - BLOCK
      ?AUTO_3534 - BLOCK
    )
    :vars
    (
      ?AUTO_3536 - BLOCK
      ?AUTO_3535 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3533 ?AUTO_3534 ) ) ( ON-TABLE ?AUTO_3533 ) ( CLEAR ?AUTO_3533 ) ( not ( = ?AUTO_3533 ?AUTO_3536 ) ) ( not ( = ?AUTO_3534 ?AUTO_3536 ) ) ( ON ?AUTO_3536 ?AUTO_3534 ) ( not ( = ?AUTO_3533 ?AUTO_3535 ) ) ( not ( = ?AUTO_3534 ?AUTO_3535 ) ) ( not ( = ?AUTO_3536 ?AUTO_3535 ) ) ( ON ?AUTO_3535 ?AUTO_3536 ) ( CLEAR ?AUTO_3535 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3535 ?AUTO_3536 )
      ( MAKE-ON ?AUTO_3533 ?AUTO_3534 )
      ( MAKE-ON-VERIFY ?AUTO_3533 ?AUTO_3534 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3537 - BLOCK
      ?AUTO_3538 - BLOCK
    )
    :vars
    (
      ?AUTO_3539 - BLOCK
      ?AUTO_3540 - BLOCK
      ?AUTO_3541 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3537 ?AUTO_3538 ) ) ( ON-TABLE ?AUTO_3537 ) ( CLEAR ?AUTO_3537 ) ( not ( = ?AUTO_3537 ?AUTO_3539 ) ) ( not ( = ?AUTO_3538 ?AUTO_3539 ) ) ( ON ?AUTO_3539 ?AUTO_3538 ) ( not ( = ?AUTO_3537 ?AUTO_3540 ) ) ( not ( = ?AUTO_3538 ?AUTO_3540 ) ) ( not ( = ?AUTO_3539 ?AUTO_3540 ) ) ( ON ?AUTO_3540 ?AUTO_3539 ) ( CLEAR ?AUTO_3540 ) ( HOLDING ?AUTO_3541 ) ( not ( = ?AUTO_3537 ?AUTO_3541 ) ) ( not ( = ?AUTO_3538 ?AUTO_3541 ) ) ( not ( = ?AUTO_3539 ?AUTO_3541 ) ) ( not ( = ?AUTO_3540 ?AUTO_3541 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3541 )
      ( MAKE-ON ?AUTO_3537 ?AUTO_3538 )
      ( MAKE-ON-VERIFY ?AUTO_3537 ?AUTO_3538 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3542 - BLOCK
      ?AUTO_3543 - BLOCK
    )
    :vars
    (
      ?AUTO_3545 - BLOCK
      ?AUTO_3544 - BLOCK
      ?AUTO_3546 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3542 ?AUTO_3543 ) ) ( ON-TABLE ?AUTO_3542 ) ( CLEAR ?AUTO_3542 ) ( not ( = ?AUTO_3542 ?AUTO_3545 ) ) ( not ( = ?AUTO_3543 ?AUTO_3545 ) ) ( ON ?AUTO_3545 ?AUTO_3543 ) ( not ( = ?AUTO_3542 ?AUTO_3544 ) ) ( not ( = ?AUTO_3543 ?AUTO_3544 ) ) ( not ( = ?AUTO_3545 ?AUTO_3544 ) ) ( ON ?AUTO_3544 ?AUTO_3545 ) ( not ( = ?AUTO_3542 ?AUTO_3546 ) ) ( not ( = ?AUTO_3543 ?AUTO_3546 ) ) ( not ( = ?AUTO_3545 ?AUTO_3546 ) ) ( not ( = ?AUTO_3544 ?AUTO_3546 ) ) ( ON ?AUTO_3546 ?AUTO_3544 ) ( CLEAR ?AUTO_3546 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3546 ?AUTO_3544 )
      ( MAKE-ON ?AUTO_3542 ?AUTO_3543 )
      ( MAKE-ON-VERIFY ?AUTO_3542 ?AUTO_3543 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3547 - BLOCK
      ?AUTO_3548 - BLOCK
    )
    :vars
    (
      ?AUTO_3550 - BLOCK
      ?AUTO_3549 - BLOCK
      ?AUTO_3551 - BLOCK
      ?AUTO_3552 - BLOCK
      ?AUTO_3553 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3547 ?AUTO_3548 ) ) ( ON-TABLE ?AUTO_3547 ) ( CLEAR ?AUTO_3547 ) ( not ( = ?AUTO_3547 ?AUTO_3550 ) ) ( not ( = ?AUTO_3548 ?AUTO_3550 ) ) ( ON ?AUTO_3550 ?AUTO_3548 ) ( not ( = ?AUTO_3547 ?AUTO_3549 ) ) ( not ( = ?AUTO_3548 ?AUTO_3549 ) ) ( not ( = ?AUTO_3550 ?AUTO_3549 ) ) ( ON ?AUTO_3549 ?AUTO_3550 ) ( not ( = ?AUTO_3547 ?AUTO_3551 ) ) ( not ( = ?AUTO_3548 ?AUTO_3551 ) ) ( not ( = ?AUTO_3550 ?AUTO_3551 ) ) ( not ( = ?AUTO_3549 ?AUTO_3551 ) ) ( ON ?AUTO_3551 ?AUTO_3549 ) ( CLEAR ?AUTO_3551 ) ( HOLDING ?AUTO_3552 ) ( CLEAR ?AUTO_3553 ) ( not ( = ?AUTO_3547 ?AUTO_3552 ) ) ( not ( = ?AUTO_3547 ?AUTO_3553 ) ) ( not ( = ?AUTO_3548 ?AUTO_3552 ) ) ( not ( = ?AUTO_3548 ?AUTO_3553 ) ) ( not ( = ?AUTO_3550 ?AUTO_3552 ) ) ( not ( = ?AUTO_3550 ?AUTO_3553 ) ) ( not ( = ?AUTO_3549 ?AUTO_3552 ) ) ( not ( = ?AUTO_3549 ?AUTO_3553 ) ) ( not ( = ?AUTO_3551 ?AUTO_3552 ) ) ( not ( = ?AUTO_3551 ?AUTO_3553 ) ) ( not ( = ?AUTO_3552 ?AUTO_3553 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3552 ?AUTO_3553 )
      ( MAKE-ON ?AUTO_3547 ?AUTO_3548 )
      ( MAKE-ON-VERIFY ?AUTO_3547 ?AUTO_3548 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3560 - BLOCK
      ?AUTO_3561 - BLOCK
    )
    :vars
    (
      ?AUTO_3562 - BLOCK
      ?AUTO_3563 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3560 ?AUTO_3561 ) ) ( not ( = ?AUTO_3560 ?AUTO_3562 ) ) ( not ( = ?AUTO_3561 ?AUTO_3562 ) ) ( ON ?AUTO_3562 ?AUTO_3561 ) ( not ( = ?AUTO_3560 ?AUTO_3563 ) ) ( not ( = ?AUTO_3561 ?AUTO_3563 ) ) ( not ( = ?AUTO_3562 ?AUTO_3563 ) ) ( ON ?AUTO_3563 ?AUTO_3562 ) ( CLEAR ?AUTO_3563 ) ( HOLDING ?AUTO_3560 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3560 )
      ( MAKE-ON ?AUTO_3560 ?AUTO_3561 )
      ( MAKE-ON-VERIFY ?AUTO_3560 ?AUTO_3561 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3564 - BLOCK
      ?AUTO_3565 - BLOCK
    )
    :vars
    (
      ?AUTO_3567 - BLOCK
      ?AUTO_3566 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3564 ?AUTO_3565 ) ) ( not ( = ?AUTO_3564 ?AUTO_3567 ) ) ( not ( = ?AUTO_3565 ?AUTO_3567 ) ) ( ON ?AUTO_3567 ?AUTO_3565 ) ( not ( = ?AUTO_3564 ?AUTO_3566 ) ) ( not ( = ?AUTO_3565 ?AUTO_3566 ) ) ( not ( = ?AUTO_3567 ?AUTO_3566 ) ) ( ON ?AUTO_3566 ?AUTO_3567 ) ( ON ?AUTO_3564 ?AUTO_3566 ) ( CLEAR ?AUTO_3564 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3564 ?AUTO_3566 )
      ( MAKE-ON ?AUTO_3564 ?AUTO_3565 )
      ( MAKE-ON-VERIFY ?AUTO_3564 ?AUTO_3565 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3568 - BLOCK
      ?AUTO_3569 - BLOCK
    )
    :vars
    (
      ?AUTO_3571 - BLOCK
      ?AUTO_3570 - BLOCK
      ?AUTO_3572 - BLOCK
      ?AUTO_3573 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3568 ?AUTO_3569 ) ) ( not ( = ?AUTO_3568 ?AUTO_3571 ) ) ( not ( = ?AUTO_3569 ?AUTO_3571 ) ) ( ON ?AUTO_3571 ?AUTO_3569 ) ( not ( = ?AUTO_3568 ?AUTO_3570 ) ) ( not ( = ?AUTO_3569 ?AUTO_3570 ) ) ( not ( = ?AUTO_3571 ?AUTO_3570 ) ) ( ON ?AUTO_3570 ?AUTO_3571 ) ( ON ?AUTO_3568 ?AUTO_3570 ) ( CLEAR ?AUTO_3568 ) ( HOLDING ?AUTO_3572 ) ( CLEAR ?AUTO_3573 ) ( not ( = ?AUTO_3568 ?AUTO_3572 ) ) ( not ( = ?AUTO_3568 ?AUTO_3573 ) ) ( not ( = ?AUTO_3569 ?AUTO_3572 ) ) ( not ( = ?AUTO_3569 ?AUTO_3573 ) ) ( not ( = ?AUTO_3571 ?AUTO_3572 ) ) ( not ( = ?AUTO_3571 ?AUTO_3573 ) ) ( not ( = ?AUTO_3570 ?AUTO_3572 ) ) ( not ( = ?AUTO_3570 ?AUTO_3573 ) ) ( not ( = ?AUTO_3572 ?AUTO_3573 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3572 ?AUTO_3573 )
      ( MAKE-ON ?AUTO_3568 ?AUTO_3569 )
      ( MAKE-ON-VERIFY ?AUTO_3568 ?AUTO_3569 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3574 - BLOCK
      ?AUTO_3575 - BLOCK
    )
    :vars
    (
      ?AUTO_3579 - BLOCK
      ?AUTO_3578 - BLOCK
      ?AUTO_3576 - BLOCK
      ?AUTO_3577 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3574 ?AUTO_3575 ) ) ( not ( = ?AUTO_3574 ?AUTO_3579 ) ) ( not ( = ?AUTO_3575 ?AUTO_3579 ) ) ( ON ?AUTO_3579 ?AUTO_3575 ) ( not ( = ?AUTO_3574 ?AUTO_3578 ) ) ( not ( = ?AUTO_3575 ?AUTO_3578 ) ) ( not ( = ?AUTO_3579 ?AUTO_3578 ) ) ( ON ?AUTO_3578 ?AUTO_3579 ) ( ON ?AUTO_3574 ?AUTO_3578 ) ( CLEAR ?AUTO_3576 ) ( not ( = ?AUTO_3574 ?AUTO_3577 ) ) ( not ( = ?AUTO_3574 ?AUTO_3576 ) ) ( not ( = ?AUTO_3575 ?AUTO_3577 ) ) ( not ( = ?AUTO_3575 ?AUTO_3576 ) ) ( not ( = ?AUTO_3579 ?AUTO_3577 ) ) ( not ( = ?AUTO_3579 ?AUTO_3576 ) ) ( not ( = ?AUTO_3578 ?AUTO_3577 ) ) ( not ( = ?AUTO_3578 ?AUTO_3576 ) ) ( not ( = ?AUTO_3577 ?AUTO_3576 ) ) ( ON ?AUTO_3577 ?AUTO_3574 ) ( CLEAR ?AUTO_3577 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3577 ?AUTO_3574 )
      ( MAKE-ON ?AUTO_3574 ?AUTO_3575 )
      ( MAKE-ON-VERIFY ?AUTO_3574 ?AUTO_3575 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3582 - BLOCK
      ?AUTO_3583 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3582 ) ( CLEAR ?AUTO_3583 ) ( not ( = ?AUTO_3582 ?AUTO_3583 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3582 ?AUTO_3583 )
      ( MAKE-ON-VERIFY ?AUTO_3582 ?AUTO_3583 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3584 - BLOCK
      ?AUTO_3585 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3585 ) ( not ( = ?AUTO_3584 ?AUTO_3585 ) ) ( ON-TABLE ?AUTO_3584 ) ( CLEAR ?AUTO_3584 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_3584 )
      ( MAKE-ON ?AUTO_3584 ?AUTO_3585 )
      ( MAKE-ON-VERIFY ?AUTO_3584 ?AUTO_3585 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3586 - BLOCK
      ?AUTO_3587 - BLOCK
    )
    :vars
    (
      ?AUTO_3588 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3586 ?AUTO_3587 ) ) ( ON-TABLE ?AUTO_3586 ) ( CLEAR ?AUTO_3586 ) ( HOLDING ?AUTO_3587 ) ( CLEAR ?AUTO_3588 ) ( not ( = ?AUTO_3586 ?AUTO_3588 ) ) ( not ( = ?AUTO_3587 ?AUTO_3588 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3587 ?AUTO_3588 )
      ( MAKE-ON ?AUTO_3586 ?AUTO_3587 )
      ( MAKE-ON-VERIFY ?AUTO_3586 ?AUTO_3587 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3632 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3632 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3632 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3632 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3633 - BLOCK
    )
    :vars
    (
      ?AUTO_3634 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3633 ?AUTO_3634 ) ( CLEAR ?AUTO_3633 ) ( HAND-EMPTY ) ( not ( = ?AUTO_3633 ?AUTO_3634 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3633 ?AUTO_3634 )
      ( MAKE-ON-TABLE ?AUTO_3633 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3633 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3635 - BLOCK
    )
    :vars
    (
      ?AUTO_3636 - BLOCK
      ?AUTO_3637 - BLOCK
      ?AUTO_3638 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3635 ?AUTO_3636 ) ( CLEAR ?AUTO_3635 ) ( not ( = ?AUTO_3635 ?AUTO_3636 ) ) ( HOLDING ?AUTO_3637 ) ( CLEAR ?AUTO_3638 ) ( not ( = ?AUTO_3635 ?AUTO_3637 ) ) ( not ( = ?AUTO_3635 ?AUTO_3638 ) ) ( not ( = ?AUTO_3636 ?AUTO_3637 ) ) ( not ( = ?AUTO_3636 ?AUTO_3638 ) ) ( not ( = ?AUTO_3637 ?AUTO_3638 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3637 ?AUTO_3638 )
      ( MAKE-ON-TABLE ?AUTO_3635 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3635 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3675 - BLOCK
      ?AUTO_3676 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3675 ) ( CLEAR ?AUTO_3676 ) ( not ( = ?AUTO_3675 ?AUTO_3676 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3675 ?AUTO_3676 )
      ( MAKE-ON-VERIFY ?AUTO_3675 ?AUTO_3676 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3677 - BLOCK
      ?AUTO_3678 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3678 ) ( not ( = ?AUTO_3677 ?AUTO_3678 ) ) ( ON-TABLE ?AUTO_3677 ) ( CLEAR ?AUTO_3677 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_3677 )
      ( MAKE-ON ?AUTO_3677 ?AUTO_3678 )
      ( MAKE-ON-VERIFY ?AUTO_3677 ?AUTO_3678 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3679 - BLOCK
      ?AUTO_3680 - BLOCK
    )
    :vars
    (
      ?AUTO_3681 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3680 ) ( not ( = ?AUTO_3679 ?AUTO_3680 ) ) ( ON-TABLE ?AUTO_3679 ) ( CLEAR ?AUTO_3679 ) ( HOLDING ?AUTO_3681 ) ( not ( = ?AUTO_3679 ?AUTO_3681 ) ) ( not ( = ?AUTO_3680 ?AUTO_3681 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3681 )
      ( MAKE-ON ?AUTO_3679 ?AUTO_3680 )
      ( MAKE-ON-VERIFY ?AUTO_3679 ?AUTO_3680 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3682 - BLOCK
      ?AUTO_3683 - BLOCK
    )
    :vars
    (
      ?AUTO_3684 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3683 ) ( not ( = ?AUTO_3682 ?AUTO_3683 ) ) ( ON-TABLE ?AUTO_3682 ) ( not ( = ?AUTO_3682 ?AUTO_3684 ) ) ( not ( = ?AUTO_3683 ?AUTO_3684 ) ) ( ON ?AUTO_3684 ?AUTO_3682 ) ( CLEAR ?AUTO_3684 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3684 ?AUTO_3682 )
      ( MAKE-ON ?AUTO_3682 ?AUTO_3683 )
      ( MAKE-ON-VERIFY ?AUTO_3682 ?AUTO_3683 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3685 - BLOCK
      ?AUTO_3686 - BLOCK
    )
    :vars
    (
      ?AUTO_3687 - BLOCK
      ?AUTO_3688 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3685 ?AUTO_3686 ) ) ( ON-TABLE ?AUTO_3685 ) ( not ( = ?AUTO_3685 ?AUTO_3687 ) ) ( not ( = ?AUTO_3686 ?AUTO_3687 ) ) ( ON ?AUTO_3687 ?AUTO_3685 ) ( CLEAR ?AUTO_3687 ) ( HOLDING ?AUTO_3686 ) ( CLEAR ?AUTO_3688 ) ( not ( = ?AUTO_3685 ?AUTO_3688 ) ) ( not ( = ?AUTO_3686 ?AUTO_3688 ) ) ( not ( = ?AUTO_3687 ?AUTO_3688 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3686 ?AUTO_3688 )
      ( MAKE-ON ?AUTO_3685 ?AUTO_3686 )
      ( MAKE-ON-VERIFY ?AUTO_3685 ?AUTO_3686 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3691 - BLOCK
      ?AUTO_3692 - BLOCK
    )
    :vars
    (
      ?AUTO_3693 - BLOCK
      ?AUTO_3694 - BLOCK
      ?AUTO_3695 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3692 ) ( not ( = ?AUTO_3691 ?AUTO_3692 ) ) ( ON-TABLE ?AUTO_3691 ) ( not ( = ?AUTO_3691 ?AUTO_3693 ) ) ( not ( = ?AUTO_3692 ?AUTO_3693 ) ) ( ON ?AUTO_3693 ?AUTO_3691 ) ( CLEAR ?AUTO_3693 ) ( HOLDING ?AUTO_3694 ) ( CLEAR ?AUTO_3695 ) ( not ( = ?AUTO_3691 ?AUTO_3694 ) ) ( not ( = ?AUTO_3691 ?AUTO_3695 ) ) ( not ( = ?AUTO_3692 ?AUTO_3694 ) ) ( not ( = ?AUTO_3692 ?AUTO_3695 ) ) ( not ( = ?AUTO_3693 ?AUTO_3694 ) ) ( not ( = ?AUTO_3693 ?AUTO_3695 ) ) ( not ( = ?AUTO_3694 ?AUTO_3695 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3694 ?AUTO_3695 )
      ( MAKE-ON ?AUTO_3691 ?AUTO_3692 )
      ( MAKE-ON-VERIFY ?AUTO_3691 ?AUTO_3692 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3768 - BLOCK
      ?AUTO_3769 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3768 ) ( CLEAR ?AUTO_3769 ) ( not ( = ?AUTO_3768 ?AUTO_3769 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3768 ?AUTO_3769 )
      ( MAKE-ON-VERIFY ?AUTO_3768 ?AUTO_3769 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3770 - BLOCK
      ?AUTO_3771 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3771 ) ( not ( = ?AUTO_3770 ?AUTO_3771 ) ) ( ON-TABLE ?AUTO_3770 ) ( CLEAR ?AUTO_3770 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_3770 )
      ( MAKE-ON ?AUTO_3770 ?AUTO_3771 )
      ( MAKE-ON-VERIFY ?AUTO_3770 ?AUTO_3771 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3772 - BLOCK
      ?AUTO_3773 - BLOCK
    )
    :vars
    (
      ?AUTO_3774 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3772 ?AUTO_3773 ) ) ( ON-TABLE ?AUTO_3772 ) ( CLEAR ?AUTO_3772 ) ( HOLDING ?AUTO_3773 ) ( CLEAR ?AUTO_3774 ) ( not ( = ?AUTO_3772 ?AUTO_3774 ) ) ( not ( = ?AUTO_3773 ?AUTO_3774 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3773 ?AUTO_3774 )
      ( MAKE-ON ?AUTO_3772 ?AUTO_3773 )
      ( MAKE-ON-VERIFY ?AUTO_3772 ?AUTO_3773 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3776 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3776 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3776 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3776 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3777 - BLOCK
    )
    :vars
    (
      ?AUTO_3778 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3777 ?AUTO_3778 ) ( CLEAR ?AUTO_3777 ) ( HAND-EMPTY ) ( not ( = ?AUTO_3777 ?AUTO_3778 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3777 ?AUTO_3778 )
      ( MAKE-ON-TABLE ?AUTO_3777 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3777 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3781 - BLOCK
      ?AUTO_3782 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3781 ) ( CLEAR ?AUTO_3782 ) ( not ( = ?AUTO_3781 ?AUTO_3782 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3781 ?AUTO_3782 )
      ( MAKE-ON-VERIFY ?AUTO_3781 ?AUTO_3782 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3783 - BLOCK
      ?AUTO_3784 - BLOCK
    )
    :vars
    (
      ?AUTO_3785 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3784 ) ( not ( = ?AUTO_3783 ?AUTO_3784 ) ) ( ON ?AUTO_3783 ?AUTO_3785 ) ( CLEAR ?AUTO_3783 ) ( HAND-EMPTY ) ( not ( = ?AUTO_3783 ?AUTO_3785 ) ) ( not ( = ?AUTO_3784 ?AUTO_3785 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3783 ?AUTO_3785 )
      ( MAKE-ON ?AUTO_3783 ?AUTO_3784 )
      ( MAKE-ON-VERIFY ?AUTO_3783 ?AUTO_3784 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3786 - BLOCK
      ?AUTO_3787 - BLOCK
    )
    :vars
    (
      ?AUTO_3788 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3786 ?AUTO_3787 ) ) ( ON ?AUTO_3786 ?AUTO_3788 ) ( CLEAR ?AUTO_3786 ) ( not ( = ?AUTO_3786 ?AUTO_3788 ) ) ( not ( = ?AUTO_3787 ?AUTO_3788 ) ) ( HOLDING ?AUTO_3787 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3787 )
      ( MAKE-ON ?AUTO_3786 ?AUTO_3787 )
      ( MAKE-ON-VERIFY ?AUTO_3786 ?AUTO_3787 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3792 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3792 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3792 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3792 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3793 - BLOCK
    )
    :vars
    (
      ?AUTO_3794 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3793 ?AUTO_3794 ) ( CLEAR ?AUTO_3793 ) ( HAND-EMPTY ) ( not ( = ?AUTO_3793 ?AUTO_3794 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3793 ?AUTO_3794 )
      ( MAKE-ON-TABLE ?AUTO_3793 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3793 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3795 - BLOCK
    )
    :vars
    (
      ?AUTO_3796 - BLOCK
      ?AUTO_3797 - BLOCK
      ?AUTO_3798 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3795 ?AUTO_3796 ) ( CLEAR ?AUTO_3795 ) ( not ( = ?AUTO_3795 ?AUTO_3796 ) ) ( HOLDING ?AUTO_3797 ) ( CLEAR ?AUTO_3798 ) ( not ( = ?AUTO_3795 ?AUTO_3797 ) ) ( not ( = ?AUTO_3795 ?AUTO_3798 ) ) ( not ( = ?AUTO_3796 ?AUTO_3797 ) ) ( not ( = ?AUTO_3796 ?AUTO_3798 ) ) ( not ( = ?AUTO_3797 ?AUTO_3798 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3797 ?AUTO_3798 )
      ( MAKE-ON-TABLE ?AUTO_3795 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3795 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3799 - BLOCK
    )
    :vars
    (
      ?AUTO_3800 - BLOCK
      ?AUTO_3802 - BLOCK
      ?AUTO_3801 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3799 ?AUTO_3800 ) ( not ( = ?AUTO_3799 ?AUTO_3800 ) ) ( CLEAR ?AUTO_3802 ) ( not ( = ?AUTO_3799 ?AUTO_3801 ) ) ( not ( = ?AUTO_3799 ?AUTO_3802 ) ) ( not ( = ?AUTO_3800 ?AUTO_3801 ) ) ( not ( = ?AUTO_3800 ?AUTO_3802 ) ) ( not ( = ?AUTO_3801 ?AUTO_3802 ) ) ( ON ?AUTO_3801 ?AUTO_3799 ) ( CLEAR ?AUTO_3801 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3801 ?AUTO_3799 )
      ( MAKE-ON-TABLE ?AUTO_3799 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3799 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3803 - BLOCK
    )
    :vars
    (
      ?AUTO_3804 - BLOCK
      ?AUTO_3805 - BLOCK
      ?AUTO_3806 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3803 ?AUTO_3804 ) ( not ( = ?AUTO_3803 ?AUTO_3804 ) ) ( not ( = ?AUTO_3803 ?AUTO_3805 ) ) ( not ( = ?AUTO_3803 ?AUTO_3806 ) ) ( not ( = ?AUTO_3804 ?AUTO_3805 ) ) ( not ( = ?AUTO_3804 ?AUTO_3806 ) ) ( not ( = ?AUTO_3805 ?AUTO_3806 ) ) ( ON ?AUTO_3805 ?AUTO_3803 ) ( CLEAR ?AUTO_3805 ) ( HOLDING ?AUTO_3806 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3806 )
      ( MAKE-ON-TABLE ?AUTO_3803 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3803 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3810 - BLOCK
      ?AUTO_3811 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3810 ) ( CLEAR ?AUTO_3811 ) ( not ( = ?AUTO_3810 ?AUTO_3811 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3810 ?AUTO_3811 )
      ( MAKE-ON-VERIFY ?AUTO_3810 ?AUTO_3811 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3812 - BLOCK
      ?AUTO_3813 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3813 ) ( not ( = ?AUTO_3812 ?AUTO_3813 ) ) ( ON-TABLE ?AUTO_3812 ) ( CLEAR ?AUTO_3812 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_3812 )
      ( MAKE-ON ?AUTO_3812 ?AUTO_3813 )
      ( MAKE-ON-VERIFY ?AUTO_3812 ?AUTO_3813 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3814 - BLOCK
      ?AUTO_3815 - BLOCK
    )
    :vars
    (
      ?AUTO_3816 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3815 ) ( not ( = ?AUTO_3814 ?AUTO_3815 ) ) ( ON-TABLE ?AUTO_3814 ) ( CLEAR ?AUTO_3814 ) ( HOLDING ?AUTO_3816 ) ( not ( = ?AUTO_3814 ?AUTO_3816 ) ) ( not ( = ?AUTO_3815 ?AUTO_3816 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3816 )
      ( MAKE-ON ?AUTO_3814 ?AUTO_3815 )
      ( MAKE-ON-VERIFY ?AUTO_3814 ?AUTO_3815 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3817 - BLOCK
      ?AUTO_3818 - BLOCK
    )
    :vars
    (
      ?AUTO_3819 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3818 ) ( not ( = ?AUTO_3817 ?AUTO_3818 ) ) ( ON-TABLE ?AUTO_3817 ) ( not ( = ?AUTO_3817 ?AUTO_3819 ) ) ( not ( = ?AUTO_3818 ?AUTO_3819 ) ) ( ON ?AUTO_3819 ?AUTO_3817 ) ( CLEAR ?AUTO_3819 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3819 ?AUTO_3817 )
      ( MAKE-ON ?AUTO_3817 ?AUTO_3818 )
      ( MAKE-ON-VERIFY ?AUTO_3817 ?AUTO_3818 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3820 - BLOCK
      ?AUTO_3821 - BLOCK
    )
    :vars
    (
      ?AUTO_3822 - BLOCK
      ?AUTO_3823 - BLOCK
      ?AUTO_3824 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3821 ) ( not ( = ?AUTO_3820 ?AUTO_3821 ) ) ( ON-TABLE ?AUTO_3820 ) ( not ( = ?AUTO_3820 ?AUTO_3822 ) ) ( not ( = ?AUTO_3821 ?AUTO_3822 ) ) ( ON ?AUTO_3822 ?AUTO_3820 ) ( CLEAR ?AUTO_3822 ) ( HOLDING ?AUTO_3823 ) ( CLEAR ?AUTO_3824 ) ( not ( = ?AUTO_3820 ?AUTO_3823 ) ) ( not ( = ?AUTO_3820 ?AUTO_3824 ) ) ( not ( = ?AUTO_3821 ?AUTO_3823 ) ) ( not ( = ?AUTO_3821 ?AUTO_3824 ) ) ( not ( = ?AUTO_3822 ?AUTO_3823 ) ) ( not ( = ?AUTO_3822 ?AUTO_3824 ) ) ( not ( = ?AUTO_3823 ?AUTO_3824 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3823 ?AUTO_3824 )
      ( MAKE-ON ?AUTO_3820 ?AUTO_3821 )
      ( MAKE-ON-VERIFY ?AUTO_3820 ?AUTO_3821 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3825 - BLOCK
      ?AUTO_3826 - BLOCK
    )
    :vars
    (
      ?AUTO_3827 - BLOCK
      ?AUTO_3829 - BLOCK
      ?AUTO_3828 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3826 ) ( not ( = ?AUTO_3825 ?AUTO_3826 ) ) ( ON-TABLE ?AUTO_3825 ) ( not ( = ?AUTO_3825 ?AUTO_3827 ) ) ( not ( = ?AUTO_3826 ?AUTO_3827 ) ) ( ON ?AUTO_3827 ?AUTO_3825 ) ( CLEAR ?AUTO_3829 ) ( not ( = ?AUTO_3825 ?AUTO_3828 ) ) ( not ( = ?AUTO_3825 ?AUTO_3829 ) ) ( not ( = ?AUTO_3826 ?AUTO_3828 ) ) ( not ( = ?AUTO_3826 ?AUTO_3829 ) ) ( not ( = ?AUTO_3827 ?AUTO_3828 ) ) ( not ( = ?AUTO_3827 ?AUTO_3829 ) ) ( not ( = ?AUTO_3828 ?AUTO_3829 ) ) ( ON ?AUTO_3828 ?AUTO_3827 ) ( CLEAR ?AUTO_3828 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3828 ?AUTO_3827 )
      ( MAKE-ON ?AUTO_3825 ?AUTO_3826 )
      ( MAKE-ON-VERIFY ?AUTO_3825 ?AUTO_3826 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3830 - BLOCK
      ?AUTO_3831 - BLOCK
    )
    :vars
    (
      ?AUTO_3834 - BLOCK
      ?AUTO_3833 - BLOCK
      ?AUTO_3832 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3831 ) ( not ( = ?AUTO_3830 ?AUTO_3831 ) ) ( ON-TABLE ?AUTO_3830 ) ( not ( = ?AUTO_3830 ?AUTO_3834 ) ) ( not ( = ?AUTO_3831 ?AUTO_3834 ) ) ( ON ?AUTO_3834 ?AUTO_3830 ) ( not ( = ?AUTO_3830 ?AUTO_3833 ) ) ( not ( = ?AUTO_3830 ?AUTO_3832 ) ) ( not ( = ?AUTO_3831 ?AUTO_3833 ) ) ( not ( = ?AUTO_3831 ?AUTO_3832 ) ) ( not ( = ?AUTO_3834 ?AUTO_3833 ) ) ( not ( = ?AUTO_3834 ?AUTO_3832 ) ) ( not ( = ?AUTO_3833 ?AUTO_3832 ) ) ( ON ?AUTO_3833 ?AUTO_3834 ) ( CLEAR ?AUTO_3833 ) ( HOLDING ?AUTO_3832 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3832 )
      ( MAKE-ON ?AUTO_3830 ?AUTO_3831 )
      ( MAKE-ON-VERIFY ?AUTO_3830 ?AUTO_3831 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3835 - BLOCK
      ?AUTO_3836 - BLOCK
    )
    :vars
    (
      ?AUTO_3839 - BLOCK
      ?AUTO_3837 - BLOCK
      ?AUTO_3838 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3835 ?AUTO_3836 ) ) ( ON-TABLE ?AUTO_3835 ) ( not ( = ?AUTO_3835 ?AUTO_3839 ) ) ( not ( = ?AUTO_3836 ?AUTO_3839 ) ) ( ON ?AUTO_3839 ?AUTO_3835 ) ( not ( = ?AUTO_3835 ?AUTO_3837 ) ) ( not ( = ?AUTO_3835 ?AUTO_3838 ) ) ( not ( = ?AUTO_3836 ?AUTO_3837 ) ) ( not ( = ?AUTO_3836 ?AUTO_3838 ) ) ( not ( = ?AUTO_3839 ?AUTO_3837 ) ) ( not ( = ?AUTO_3839 ?AUTO_3838 ) ) ( not ( = ?AUTO_3837 ?AUTO_3838 ) ) ( ON ?AUTO_3837 ?AUTO_3839 ) ( CLEAR ?AUTO_3837 ) ( ON ?AUTO_3838 ?AUTO_3836 ) ( CLEAR ?AUTO_3838 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3838 ?AUTO_3836 )
      ( MAKE-ON ?AUTO_3835 ?AUTO_3836 )
      ( MAKE-ON-VERIFY ?AUTO_3835 ?AUTO_3836 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3841 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3841 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3841 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3841 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3842 - BLOCK
    )
    :vars
    (
      ?AUTO_3843 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3842 ?AUTO_3843 ) ( CLEAR ?AUTO_3842 ) ( HAND-EMPTY ) ( not ( = ?AUTO_3842 ?AUTO_3843 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3842 ?AUTO_3843 )
      ( MAKE-ON-TABLE ?AUTO_3842 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3842 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3845 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3845 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3845 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3845 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3846 - BLOCK
    )
    :vars
    (
      ?AUTO_3847 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3846 ?AUTO_3847 ) ( CLEAR ?AUTO_3846 ) ( HAND-EMPTY ) ( not ( = ?AUTO_3846 ?AUTO_3847 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3846 ?AUTO_3847 )
      ( MAKE-ON-TABLE ?AUTO_3846 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3846 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3848 - BLOCK
    )
    :vars
    (
      ?AUTO_3849 - BLOCK
      ?AUTO_3850 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3848 ?AUTO_3849 ) ( CLEAR ?AUTO_3848 ) ( not ( = ?AUTO_3848 ?AUTO_3849 ) ) ( HOLDING ?AUTO_3850 ) ( not ( = ?AUTO_3848 ?AUTO_3850 ) ) ( not ( = ?AUTO_3849 ?AUTO_3850 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3850 )
      ( MAKE-ON-TABLE ?AUTO_3848 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3848 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3853 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3853 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3853 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3853 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3854 - BLOCK
    )
    :vars
    (
      ?AUTO_3855 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3854 ?AUTO_3855 ) ( CLEAR ?AUTO_3854 ) ( HAND-EMPTY ) ( not ( = ?AUTO_3854 ?AUTO_3855 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3854 ?AUTO_3855 )
      ( MAKE-ON-TABLE ?AUTO_3854 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3854 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3856 - BLOCK
    )
    :vars
    (
      ?AUTO_3857 - BLOCK
      ?AUTO_3858 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3856 ?AUTO_3857 ) ( CLEAR ?AUTO_3856 ) ( not ( = ?AUTO_3856 ?AUTO_3857 ) ) ( HOLDING ?AUTO_3858 ) ( not ( = ?AUTO_3856 ?AUTO_3858 ) ) ( not ( = ?AUTO_3857 ?AUTO_3858 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3858 )
      ( MAKE-ON-TABLE ?AUTO_3856 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3856 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3859 - BLOCK
    )
    :vars
    (
      ?AUTO_3860 - BLOCK
      ?AUTO_3861 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3859 ?AUTO_3860 ) ( not ( = ?AUTO_3859 ?AUTO_3860 ) ) ( not ( = ?AUTO_3859 ?AUTO_3861 ) ) ( not ( = ?AUTO_3860 ?AUTO_3861 ) ) ( ON ?AUTO_3861 ?AUTO_3859 ) ( CLEAR ?AUTO_3861 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3861 ?AUTO_3859 )
      ( MAKE-ON-TABLE ?AUTO_3859 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3859 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3862 - BLOCK
    )
    :vars
    (
      ?AUTO_3864 - BLOCK
      ?AUTO_3863 - BLOCK
      ?AUTO_3865 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3862 ?AUTO_3864 ) ( not ( = ?AUTO_3862 ?AUTO_3864 ) ) ( not ( = ?AUTO_3862 ?AUTO_3863 ) ) ( not ( = ?AUTO_3864 ?AUTO_3863 ) ) ( ON ?AUTO_3863 ?AUTO_3862 ) ( CLEAR ?AUTO_3863 ) ( HOLDING ?AUTO_3865 ) ( not ( = ?AUTO_3862 ?AUTO_3865 ) ) ( not ( = ?AUTO_3864 ?AUTO_3865 ) ) ( not ( = ?AUTO_3863 ?AUTO_3865 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3865 )
      ( MAKE-ON-TABLE ?AUTO_3862 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3862 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3869 - BLOCK
      ?AUTO_3870 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3869 ) ( CLEAR ?AUTO_3870 ) ( not ( = ?AUTO_3869 ?AUTO_3870 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3869 ?AUTO_3870 )
      ( MAKE-ON-VERIFY ?AUTO_3869 ?AUTO_3870 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3871 - BLOCK
      ?AUTO_3872 - BLOCK
    )
    :vars
    (
      ?AUTO_3873 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3872 ) ( not ( = ?AUTO_3871 ?AUTO_3872 ) ) ( ON ?AUTO_3871 ?AUTO_3873 ) ( CLEAR ?AUTO_3871 ) ( HAND-EMPTY ) ( not ( = ?AUTO_3871 ?AUTO_3873 ) ) ( not ( = ?AUTO_3872 ?AUTO_3873 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3871 ?AUTO_3873 )
      ( MAKE-ON ?AUTO_3871 ?AUTO_3872 )
      ( MAKE-ON-VERIFY ?AUTO_3871 ?AUTO_3872 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3874 - BLOCK
      ?AUTO_3875 - BLOCK
    )
    :vars
    (
      ?AUTO_3876 - BLOCK
      ?AUTO_3877 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3875 ) ( not ( = ?AUTO_3874 ?AUTO_3875 ) ) ( ON ?AUTO_3874 ?AUTO_3876 ) ( CLEAR ?AUTO_3874 ) ( not ( = ?AUTO_3874 ?AUTO_3876 ) ) ( not ( = ?AUTO_3875 ?AUTO_3876 ) ) ( HOLDING ?AUTO_3877 ) ( not ( = ?AUTO_3874 ?AUTO_3877 ) ) ( not ( = ?AUTO_3875 ?AUTO_3877 ) ) ( not ( = ?AUTO_3876 ?AUTO_3877 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3877 )
      ( MAKE-ON ?AUTO_3874 ?AUTO_3875 )
      ( MAKE-ON-VERIFY ?AUTO_3874 ?AUTO_3875 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3878 - BLOCK
      ?AUTO_3879 - BLOCK
    )
    :vars
    (
      ?AUTO_3880 - BLOCK
      ?AUTO_3881 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3879 ) ( not ( = ?AUTO_3878 ?AUTO_3879 ) ) ( ON ?AUTO_3878 ?AUTO_3880 ) ( not ( = ?AUTO_3878 ?AUTO_3880 ) ) ( not ( = ?AUTO_3879 ?AUTO_3880 ) ) ( not ( = ?AUTO_3878 ?AUTO_3881 ) ) ( not ( = ?AUTO_3879 ?AUTO_3881 ) ) ( not ( = ?AUTO_3880 ?AUTO_3881 ) ) ( ON ?AUTO_3881 ?AUTO_3878 ) ( CLEAR ?AUTO_3881 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3881 ?AUTO_3878 )
      ( MAKE-ON ?AUTO_3878 ?AUTO_3879 )
      ( MAKE-ON-VERIFY ?AUTO_3878 ?AUTO_3879 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3882 - BLOCK
      ?AUTO_3883 - BLOCK
    )
    :vars
    (
      ?AUTO_3884 - BLOCK
      ?AUTO_3885 - BLOCK
      ?AUTO_3886 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3883 ) ( not ( = ?AUTO_3882 ?AUTO_3883 ) ) ( ON ?AUTO_3882 ?AUTO_3884 ) ( not ( = ?AUTO_3882 ?AUTO_3884 ) ) ( not ( = ?AUTO_3883 ?AUTO_3884 ) ) ( not ( = ?AUTO_3882 ?AUTO_3885 ) ) ( not ( = ?AUTO_3883 ?AUTO_3885 ) ) ( not ( = ?AUTO_3884 ?AUTO_3885 ) ) ( ON ?AUTO_3885 ?AUTO_3882 ) ( CLEAR ?AUTO_3885 ) ( HOLDING ?AUTO_3886 ) ( not ( = ?AUTO_3882 ?AUTO_3886 ) ) ( not ( = ?AUTO_3883 ?AUTO_3886 ) ) ( not ( = ?AUTO_3884 ?AUTO_3886 ) ) ( not ( = ?AUTO_3885 ?AUTO_3886 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3886 )
      ( MAKE-ON ?AUTO_3882 ?AUTO_3883 )
      ( MAKE-ON-VERIFY ?AUTO_3882 ?AUTO_3883 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3887 - BLOCK
      ?AUTO_3888 - BLOCK
    )
    :vars
    (
      ?AUTO_3889 - BLOCK
      ?AUTO_3890 - BLOCK
      ?AUTO_3891 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3888 ) ( not ( = ?AUTO_3887 ?AUTO_3888 ) ) ( ON ?AUTO_3887 ?AUTO_3889 ) ( not ( = ?AUTO_3887 ?AUTO_3889 ) ) ( not ( = ?AUTO_3888 ?AUTO_3889 ) ) ( not ( = ?AUTO_3887 ?AUTO_3890 ) ) ( not ( = ?AUTO_3888 ?AUTO_3890 ) ) ( not ( = ?AUTO_3889 ?AUTO_3890 ) ) ( ON ?AUTO_3890 ?AUTO_3887 ) ( not ( = ?AUTO_3887 ?AUTO_3891 ) ) ( not ( = ?AUTO_3888 ?AUTO_3891 ) ) ( not ( = ?AUTO_3889 ?AUTO_3891 ) ) ( not ( = ?AUTO_3890 ?AUTO_3891 ) ) ( ON ?AUTO_3891 ?AUTO_3890 ) ( CLEAR ?AUTO_3891 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3891 ?AUTO_3890 )
      ( MAKE-ON ?AUTO_3887 ?AUTO_3888 )
      ( MAKE-ON-VERIFY ?AUTO_3887 ?AUTO_3888 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3892 - BLOCK
      ?AUTO_3893 - BLOCK
    )
    :vars
    (
      ?AUTO_3894 - BLOCK
      ?AUTO_3895 - BLOCK
      ?AUTO_3896 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3892 ?AUTO_3893 ) ) ( ON ?AUTO_3892 ?AUTO_3894 ) ( not ( = ?AUTO_3892 ?AUTO_3894 ) ) ( not ( = ?AUTO_3893 ?AUTO_3894 ) ) ( not ( = ?AUTO_3892 ?AUTO_3895 ) ) ( not ( = ?AUTO_3893 ?AUTO_3895 ) ) ( not ( = ?AUTO_3894 ?AUTO_3895 ) ) ( ON ?AUTO_3895 ?AUTO_3892 ) ( not ( = ?AUTO_3892 ?AUTO_3896 ) ) ( not ( = ?AUTO_3893 ?AUTO_3896 ) ) ( not ( = ?AUTO_3894 ?AUTO_3896 ) ) ( not ( = ?AUTO_3895 ?AUTO_3896 ) ) ( ON ?AUTO_3896 ?AUTO_3895 ) ( CLEAR ?AUTO_3896 ) ( HOLDING ?AUTO_3893 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3893 )
      ( MAKE-ON ?AUTO_3892 ?AUTO_3893 )
      ( MAKE-ON-VERIFY ?AUTO_3892 ?AUTO_3893 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3901 - BLOCK
      ?AUTO_3902 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3901 ) ( CLEAR ?AUTO_3902 ) ( not ( = ?AUTO_3901 ?AUTO_3902 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3901 ?AUTO_3902 )
      ( MAKE-ON-VERIFY ?AUTO_3901 ?AUTO_3902 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3903 - BLOCK
      ?AUTO_3904 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3904 ) ( not ( = ?AUTO_3903 ?AUTO_3904 ) ) ( ON-TABLE ?AUTO_3903 ) ( CLEAR ?AUTO_3903 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_3903 )
      ( MAKE-ON ?AUTO_3903 ?AUTO_3904 )
      ( MAKE-ON-VERIFY ?AUTO_3903 ?AUTO_3904 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3905 - BLOCK
      ?AUTO_3906 - BLOCK
    )
    :vars
    (
      ?AUTO_3907 - BLOCK
      ?AUTO_3908 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3906 ) ( not ( = ?AUTO_3905 ?AUTO_3906 ) ) ( ON-TABLE ?AUTO_3905 ) ( CLEAR ?AUTO_3905 ) ( HOLDING ?AUTO_3907 ) ( CLEAR ?AUTO_3908 ) ( not ( = ?AUTO_3905 ?AUTO_3907 ) ) ( not ( = ?AUTO_3905 ?AUTO_3908 ) ) ( not ( = ?AUTO_3906 ?AUTO_3907 ) ) ( not ( = ?AUTO_3906 ?AUTO_3908 ) ) ( not ( = ?AUTO_3907 ?AUTO_3908 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3907 ?AUTO_3908 )
      ( MAKE-ON ?AUTO_3905 ?AUTO_3906 )
      ( MAKE-ON-VERIFY ?AUTO_3905 ?AUTO_3906 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3909 - BLOCK
      ?AUTO_3910 - BLOCK
    )
    :vars
    (
      ?AUTO_3911 - BLOCK
      ?AUTO_3912 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3910 ) ( not ( = ?AUTO_3909 ?AUTO_3910 ) ) ( ON-TABLE ?AUTO_3909 ) ( CLEAR ?AUTO_3911 ) ( not ( = ?AUTO_3909 ?AUTO_3912 ) ) ( not ( = ?AUTO_3909 ?AUTO_3911 ) ) ( not ( = ?AUTO_3910 ?AUTO_3912 ) ) ( not ( = ?AUTO_3910 ?AUTO_3911 ) ) ( not ( = ?AUTO_3912 ?AUTO_3911 ) ) ( ON ?AUTO_3912 ?AUTO_3909 ) ( CLEAR ?AUTO_3912 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3912 ?AUTO_3909 )
      ( MAKE-ON ?AUTO_3909 ?AUTO_3910 )
      ( MAKE-ON-VERIFY ?AUTO_3909 ?AUTO_3910 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3913 - BLOCK
      ?AUTO_3914 - BLOCK
    )
    :vars
    (
      ?AUTO_3916 - BLOCK
      ?AUTO_3915 - BLOCK
      ?AUTO_3917 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3914 ) ( not ( = ?AUTO_3913 ?AUTO_3914 ) ) ( ON-TABLE ?AUTO_3913 ) ( CLEAR ?AUTO_3916 ) ( not ( = ?AUTO_3913 ?AUTO_3915 ) ) ( not ( = ?AUTO_3913 ?AUTO_3916 ) ) ( not ( = ?AUTO_3914 ?AUTO_3915 ) ) ( not ( = ?AUTO_3914 ?AUTO_3916 ) ) ( not ( = ?AUTO_3915 ?AUTO_3916 ) ) ( ON ?AUTO_3915 ?AUTO_3913 ) ( CLEAR ?AUTO_3915 ) ( HOLDING ?AUTO_3917 ) ( not ( = ?AUTO_3913 ?AUTO_3917 ) ) ( not ( = ?AUTO_3914 ?AUTO_3917 ) ) ( not ( = ?AUTO_3916 ?AUTO_3917 ) ) ( not ( = ?AUTO_3915 ?AUTO_3917 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3917 )
      ( MAKE-ON ?AUTO_3913 ?AUTO_3914 )
      ( MAKE-ON-VERIFY ?AUTO_3913 ?AUTO_3914 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3918 - BLOCK
      ?AUTO_3919 - BLOCK
    )
    :vars
    (
      ?AUTO_3922 - BLOCK
      ?AUTO_3921 - BLOCK
      ?AUTO_3920 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3919 ) ( not ( = ?AUTO_3918 ?AUTO_3919 ) ) ( ON-TABLE ?AUTO_3918 ) ( CLEAR ?AUTO_3922 ) ( not ( = ?AUTO_3918 ?AUTO_3921 ) ) ( not ( = ?AUTO_3918 ?AUTO_3922 ) ) ( not ( = ?AUTO_3919 ?AUTO_3921 ) ) ( not ( = ?AUTO_3919 ?AUTO_3922 ) ) ( not ( = ?AUTO_3921 ?AUTO_3922 ) ) ( ON ?AUTO_3921 ?AUTO_3918 ) ( not ( = ?AUTO_3918 ?AUTO_3920 ) ) ( not ( = ?AUTO_3919 ?AUTO_3920 ) ) ( not ( = ?AUTO_3922 ?AUTO_3920 ) ) ( not ( = ?AUTO_3921 ?AUTO_3920 ) ) ( ON ?AUTO_3920 ?AUTO_3921 ) ( CLEAR ?AUTO_3920 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3920 ?AUTO_3921 )
      ( MAKE-ON ?AUTO_3918 ?AUTO_3919 )
      ( MAKE-ON-VERIFY ?AUTO_3918 ?AUTO_3919 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3923 - BLOCK
      ?AUTO_3924 - BLOCK
    )
    :vars
    (
      ?AUTO_3927 - BLOCK
      ?AUTO_3925 - BLOCK
      ?AUTO_3926 - BLOCK
      ?AUTO_3928 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3924 ) ( not ( = ?AUTO_3923 ?AUTO_3924 ) ) ( ON-TABLE ?AUTO_3923 ) ( CLEAR ?AUTO_3927 ) ( not ( = ?AUTO_3923 ?AUTO_3925 ) ) ( not ( = ?AUTO_3923 ?AUTO_3927 ) ) ( not ( = ?AUTO_3924 ?AUTO_3925 ) ) ( not ( = ?AUTO_3924 ?AUTO_3927 ) ) ( not ( = ?AUTO_3925 ?AUTO_3927 ) ) ( ON ?AUTO_3925 ?AUTO_3923 ) ( not ( = ?AUTO_3923 ?AUTO_3926 ) ) ( not ( = ?AUTO_3924 ?AUTO_3926 ) ) ( not ( = ?AUTO_3927 ?AUTO_3926 ) ) ( not ( = ?AUTO_3925 ?AUTO_3926 ) ) ( ON ?AUTO_3926 ?AUTO_3925 ) ( CLEAR ?AUTO_3926 ) ( HOLDING ?AUTO_3928 ) ( not ( = ?AUTO_3923 ?AUTO_3928 ) ) ( not ( = ?AUTO_3924 ?AUTO_3928 ) ) ( not ( = ?AUTO_3927 ?AUTO_3928 ) ) ( not ( = ?AUTO_3925 ?AUTO_3928 ) ) ( not ( = ?AUTO_3926 ?AUTO_3928 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3928 )
      ( MAKE-ON ?AUTO_3923 ?AUTO_3924 )
      ( MAKE-ON-VERIFY ?AUTO_3923 ?AUTO_3924 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3929 - BLOCK
      ?AUTO_3930 - BLOCK
    )
    :vars
    (
      ?AUTO_3934 - BLOCK
      ?AUTO_3932 - BLOCK
      ?AUTO_3931 - BLOCK
      ?AUTO_3933 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3930 ) ( not ( = ?AUTO_3929 ?AUTO_3930 ) ) ( ON-TABLE ?AUTO_3929 ) ( CLEAR ?AUTO_3934 ) ( not ( = ?AUTO_3929 ?AUTO_3932 ) ) ( not ( = ?AUTO_3929 ?AUTO_3934 ) ) ( not ( = ?AUTO_3930 ?AUTO_3932 ) ) ( not ( = ?AUTO_3930 ?AUTO_3934 ) ) ( not ( = ?AUTO_3932 ?AUTO_3934 ) ) ( ON ?AUTO_3932 ?AUTO_3929 ) ( not ( = ?AUTO_3929 ?AUTO_3931 ) ) ( not ( = ?AUTO_3930 ?AUTO_3931 ) ) ( not ( = ?AUTO_3934 ?AUTO_3931 ) ) ( not ( = ?AUTO_3932 ?AUTO_3931 ) ) ( ON ?AUTO_3931 ?AUTO_3932 ) ( not ( = ?AUTO_3929 ?AUTO_3933 ) ) ( not ( = ?AUTO_3930 ?AUTO_3933 ) ) ( not ( = ?AUTO_3934 ?AUTO_3933 ) ) ( not ( = ?AUTO_3932 ?AUTO_3933 ) ) ( not ( = ?AUTO_3931 ?AUTO_3933 ) ) ( ON ?AUTO_3933 ?AUTO_3931 ) ( CLEAR ?AUTO_3933 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3933 ?AUTO_3931 )
      ( MAKE-ON ?AUTO_3929 ?AUTO_3930 )
      ( MAKE-ON-VERIFY ?AUTO_3929 ?AUTO_3930 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3935 - BLOCK
      ?AUTO_3936 - BLOCK
    )
    :vars
    (
      ?AUTO_3939 - BLOCK
      ?AUTO_3937 - BLOCK
      ?AUTO_3938 - BLOCK
      ?AUTO_3940 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3936 ) ( not ( = ?AUTO_3935 ?AUTO_3936 ) ) ( ON-TABLE ?AUTO_3935 ) ( not ( = ?AUTO_3935 ?AUTO_3939 ) ) ( not ( = ?AUTO_3935 ?AUTO_3937 ) ) ( not ( = ?AUTO_3936 ?AUTO_3939 ) ) ( not ( = ?AUTO_3936 ?AUTO_3937 ) ) ( not ( = ?AUTO_3939 ?AUTO_3937 ) ) ( ON ?AUTO_3939 ?AUTO_3935 ) ( not ( = ?AUTO_3935 ?AUTO_3938 ) ) ( not ( = ?AUTO_3936 ?AUTO_3938 ) ) ( not ( = ?AUTO_3937 ?AUTO_3938 ) ) ( not ( = ?AUTO_3939 ?AUTO_3938 ) ) ( ON ?AUTO_3938 ?AUTO_3939 ) ( not ( = ?AUTO_3935 ?AUTO_3940 ) ) ( not ( = ?AUTO_3936 ?AUTO_3940 ) ) ( not ( = ?AUTO_3937 ?AUTO_3940 ) ) ( not ( = ?AUTO_3939 ?AUTO_3940 ) ) ( not ( = ?AUTO_3938 ?AUTO_3940 ) ) ( ON ?AUTO_3940 ?AUTO_3938 ) ( CLEAR ?AUTO_3940 ) ( HOLDING ?AUTO_3937 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3937 )
      ( MAKE-ON ?AUTO_3935 ?AUTO_3936 )
      ( MAKE-ON-VERIFY ?AUTO_3935 ?AUTO_3936 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3945 - BLOCK
      ?AUTO_3946 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3945 ) ( CLEAR ?AUTO_3946 ) ( not ( = ?AUTO_3945 ?AUTO_3946 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3945 ?AUTO_3946 )
      ( MAKE-ON-VERIFY ?AUTO_3945 ?AUTO_3946 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3947 - BLOCK
      ?AUTO_3948 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3948 ) ( not ( = ?AUTO_3947 ?AUTO_3948 ) ) ( ON-TABLE ?AUTO_3947 ) ( CLEAR ?AUTO_3947 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_3947 )
      ( MAKE-ON ?AUTO_3947 ?AUTO_3948 )
      ( MAKE-ON-VERIFY ?AUTO_3947 ?AUTO_3948 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3949 - BLOCK
      ?AUTO_3950 - BLOCK
    )
    :vars
    (
      ?AUTO_3951 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3949 ?AUTO_3950 ) ) ( ON-TABLE ?AUTO_3949 ) ( CLEAR ?AUTO_3949 ) ( HOLDING ?AUTO_3950 ) ( CLEAR ?AUTO_3951 ) ( not ( = ?AUTO_3949 ?AUTO_3951 ) ) ( not ( = ?AUTO_3950 ?AUTO_3951 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3950 ?AUTO_3951 )
      ( MAKE-ON ?AUTO_3949 ?AUTO_3950 )
      ( MAKE-ON-VERIFY ?AUTO_3949 ?AUTO_3950 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3956 - BLOCK
      ?AUTO_3957 - BLOCK
    )
    :vars
    (
      ?AUTO_3959 - BLOCK
      ?AUTO_3958 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3956 ?AUTO_3957 ) ) ( ON-TABLE ?AUTO_3956 ) ( CLEAR ?AUTO_3956 ) ( CLEAR ?AUTO_3959 ) ( not ( = ?AUTO_3956 ?AUTO_3958 ) ) ( not ( = ?AUTO_3956 ?AUTO_3959 ) ) ( not ( = ?AUTO_3957 ?AUTO_3958 ) ) ( not ( = ?AUTO_3957 ?AUTO_3959 ) ) ( not ( = ?AUTO_3958 ?AUTO_3959 ) ) ( ON ?AUTO_3958 ?AUTO_3957 ) ( CLEAR ?AUTO_3958 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3958 ?AUTO_3957 )
      ( MAKE-ON ?AUTO_3956 ?AUTO_3957 )
      ( MAKE-ON-VERIFY ?AUTO_3956 ?AUTO_3957 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3960 - BLOCK
      ?AUTO_3961 - BLOCK
    )
    :vars
    (
      ?AUTO_3962 - BLOCK
      ?AUTO_3963 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3960 ?AUTO_3961 ) ) ( CLEAR ?AUTO_3962 ) ( not ( = ?AUTO_3960 ?AUTO_3963 ) ) ( not ( = ?AUTO_3960 ?AUTO_3962 ) ) ( not ( = ?AUTO_3961 ?AUTO_3963 ) ) ( not ( = ?AUTO_3961 ?AUTO_3962 ) ) ( not ( = ?AUTO_3963 ?AUTO_3962 ) ) ( ON ?AUTO_3963 ?AUTO_3961 ) ( CLEAR ?AUTO_3963 ) ( HOLDING ?AUTO_3960 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3960 )
      ( MAKE-ON ?AUTO_3960 ?AUTO_3961 )
      ( MAKE-ON-VERIFY ?AUTO_3960 ?AUTO_3961 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3964 - BLOCK
      ?AUTO_3965 - BLOCK
    )
    :vars
    (
      ?AUTO_3966 - BLOCK
      ?AUTO_3967 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3964 ?AUTO_3965 ) ) ( CLEAR ?AUTO_3966 ) ( not ( = ?AUTO_3964 ?AUTO_3967 ) ) ( not ( = ?AUTO_3964 ?AUTO_3966 ) ) ( not ( = ?AUTO_3965 ?AUTO_3967 ) ) ( not ( = ?AUTO_3965 ?AUTO_3966 ) ) ( not ( = ?AUTO_3967 ?AUTO_3966 ) ) ( ON ?AUTO_3967 ?AUTO_3965 ) ( ON ?AUTO_3964 ?AUTO_3967 ) ( CLEAR ?AUTO_3964 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3964 ?AUTO_3967 )
      ( MAKE-ON ?AUTO_3964 ?AUTO_3965 )
      ( MAKE-ON-VERIFY ?AUTO_3964 ?AUTO_3965 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3968 - BLOCK
      ?AUTO_3969 - BLOCK
    )
    :vars
    (
      ?AUTO_3970 - BLOCK
      ?AUTO_3971 - BLOCK
      ?AUTO_3972 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3968 ?AUTO_3969 ) ) ( CLEAR ?AUTO_3970 ) ( not ( = ?AUTO_3968 ?AUTO_3971 ) ) ( not ( = ?AUTO_3968 ?AUTO_3970 ) ) ( not ( = ?AUTO_3969 ?AUTO_3971 ) ) ( not ( = ?AUTO_3969 ?AUTO_3970 ) ) ( not ( = ?AUTO_3971 ?AUTO_3970 ) ) ( ON ?AUTO_3971 ?AUTO_3969 ) ( ON ?AUTO_3968 ?AUTO_3971 ) ( CLEAR ?AUTO_3968 ) ( HOLDING ?AUTO_3972 ) ( not ( = ?AUTO_3968 ?AUTO_3972 ) ) ( not ( = ?AUTO_3969 ?AUTO_3972 ) ) ( not ( = ?AUTO_3970 ?AUTO_3972 ) ) ( not ( = ?AUTO_3971 ?AUTO_3972 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3972 )
      ( MAKE-ON ?AUTO_3968 ?AUTO_3969 )
      ( MAKE-ON-VERIFY ?AUTO_3968 ?AUTO_3969 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3973 - BLOCK
      ?AUTO_3974 - BLOCK
    )
    :vars
    (
      ?AUTO_3976 - BLOCK
      ?AUTO_3975 - BLOCK
      ?AUTO_3977 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3973 ?AUTO_3974 ) ) ( CLEAR ?AUTO_3976 ) ( not ( = ?AUTO_3973 ?AUTO_3975 ) ) ( not ( = ?AUTO_3973 ?AUTO_3976 ) ) ( not ( = ?AUTO_3974 ?AUTO_3975 ) ) ( not ( = ?AUTO_3974 ?AUTO_3976 ) ) ( not ( = ?AUTO_3975 ?AUTO_3976 ) ) ( ON ?AUTO_3975 ?AUTO_3974 ) ( ON ?AUTO_3973 ?AUTO_3975 ) ( not ( = ?AUTO_3973 ?AUTO_3977 ) ) ( not ( = ?AUTO_3974 ?AUTO_3977 ) ) ( not ( = ?AUTO_3976 ?AUTO_3977 ) ) ( not ( = ?AUTO_3975 ?AUTO_3977 ) ) ( ON ?AUTO_3977 ?AUTO_3973 ) ( CLEAR ?AUTO_3977 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3977 ?AUTO_3973 )
      ( MAKE-ON ?AUTO_3973 ?AUTO_3974 )
      ( MAKE-ON-VERIFY ?AUTO_3973 ?AUTO_3974 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3978 - BLOCK
      ?AUTO_3979 - BLOCK
    )
    :vars
    (
      ?AUTO_3981 - BLOCK
      ?AUTO_3980 - BLOCK
      ?AUTO_3982 - BLOCK
      ?AUTO_3983 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3978 ?AUTO_3979 ) ) ( CLEAR ?AUTO_3981 ) ( not ( = ?AUTO_3978 ?AUTO_3980 ) ) ( not ( = ?AUTO_3978 ?AUTO_3981 ) ) ( not ( = ?AUTO_3979 ?AUTO_3980 ) ) ( not ( = ?AUTO_3979 ?AUTO_3981 ) ) ( not ( = ?AUTO_3980 ?AUTO_3981 ) ) ( ON ?AUTO_3980 ?AUTO_3979 ) ( ON ?AUTO_3978 ?AUTO_3980 ) ( not ( = ?AUTO_3978 ?AUTO_3982 ) ) ( not ( = ?AUTO_3979 ?AUTO_3982 ) ) ( not ( = ?AUTO_3981 ?AUTO_3982 ) ) ( not ( = ?AUTO_3980 ?AUTO_3982 ) ) ( ON ?AUTO_3982 ?AUTO_3978 ) ( CLEAR ?AUTO_3982 ) ( HOLDING ?AUTO_3983 ) ( not ( = ?AUTO_3978 ?AUTO_3983 ) ) ( not ( = ?AUTO_3979 ?AUTO_3983 ) ) ( not ( = ?AUTO_3981 ?AUTO_3983 ) ) ( not ( = ?AUTO_3980 ?AUTO_3983 ) ) ( not ( = ?AUTO_3982 ?AUTO_3983 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3983 )
      ( MAKE-ON ?AUTO_3978 ?AUTO_3979 )
      ( MAKE-ON-VERIFY ?AUTO_3978 ?AUTO_3979 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3988 - BLOCK
      ?AUTO_3989 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3988 ) ( CLEAR ?AUTO_3989 ) ( not ( = ?AUTO_3988 ?AUTO_3989 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3988 ?AUTO_3989 )
      ( MAKE-ON-VERIFY ?AUTO_3988 ?AUTO_3989 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3990 - BLOCK
      ?AUTO_3991 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3991 ) ( not ( = ?AUTO_3990 ?AUTO_3991 ) ) ( ON-TABLE ?AUTO_3990 ) ( CLEAR ?AUTO_3990 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_3990 )
      ( MAKE-ON ?AUTO_3990 ?AUTO_3991 )
      ( MAKE-ON-VERIFY ?AUTO_3990 ?AUTO_3991 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3992 - BLOCK
      ?AUTO_3993 - BLOCK
    )
    :vars
    (
      ?AUTO_3994 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3992 ?AUTO_3993 ) ) ( ON-TABLE ?AUTO_3992 ) ( CLEAR ?AUTO_3992 ) ( HOLDING ?AUTO_3993 ) ( CLEAR ?AUTO_3994 ) ( not ( = ?AUTO_3992 ?AUTO_3994 ) ) ( not ( = ?AUTO_3993 ?AUTO_3994 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3993 ?AUTO_3994 )
      ( MAKE-ON ?AUTO_3992 ?AUTO_3993 )
      ( MAKE-ON-VERIFY ?AUTO_3992 ?AUTO_3993 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3997 - BLOCK
      ?AUTO_3998 - BLOCK
    )
    :vars
    (
      ?AUTO_3999 - BLOCK
      ?AUTO_4000 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3998 ) ( not ( = ?AUTO_3997 ?AUTO_3998 ) ) ( ON-TABLE ?AUTO_3997 ) ( CLEAR ?AUTO_3997 ) ( HOLDING ?AUTO_3999 ) ( CLEAR ?AUTO_4000 ) ( not ( = ?AUTO_3997 ?AUTO_3999 ) ) ( not ( = ?AUTO_3997 ?AUTO_4000 ) ) ( not ( = ?AUTO_3998 ?AUTO_3999 ) ) ( not ( = ?AUTO_3998 ?AUTO_4000 ) ) ( not ( = ?AUTO_3999 ?AUTO_4000 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3999 ?AUTO_4000 )
      ( MAKE-ON ?AUTO_3997 ?AUTO_3998 )
      ( MAKE-ON-VERIFY ?AUTO_3997 ?AUTO_3998 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4002 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4002 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4002 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4002 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4003 - BLOCK
    )
    :vars
    (
      ?AUTO_4004 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4003 ?AUTO_4004 ) ( CLEAR ?AUTO_4003 ) ( HAND-EMPTY ) ( not ( = ?AUTO_4003 ?AUTO_4004 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4003 ?AUTO_4004 )
      ( MAKE-ON-TABLE ?AUTO_4003 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4003 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4007 - BLOCK
      ?AUTO_4008 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4007 ) ( CLEAR ?AUTO_4008 ) ( not ( = ?AUTO_4007 ?AUTO_4008 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4007 ?AUTO_4008 )
      ( MAKE-ON-VERIFY ?AUTO_4007 ?AUTO_4008 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4009 - BLOCK
      ?AUTO_4010 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4010 ) ( not ( = ?AUTO_4009 ?AUTO_4010 ) ) ( ON-TABLE ?AUTO_4009 ) ( CLEAR ?AUTO_4009 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_4009 )
      ( MAKE-ON ?AUTO_4009 ?AUTO_4010 )
      ( MAKE-ON-VERIFY ?AUTO_4009 ?AUTO_4010 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4011 - BLOCK
      ?AUTO_4012 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4011 ?AUTO_4012 ) ) ( ON-TABLE ?AUTO_4011 ) ( CLEAR ?AUTO_4011 ) ( HOLDING ?AUTO_4012 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4012 )
      ( MAKE-ON ?AUTO_4011 ?AUTO_4012 )
      ( MAKE-ON-VERIFY ?AUTO_4011 ?AUTO_4012 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4017 - BLOCK
      ?AUTO_4018 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4017 ) ( CLEAR ?AUTO_4018 ) ( not ( = ?AUTO_4017 ?AUTO_4018 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4017 ?AUTO_4018 )
      ( MAKE-ON-VERIFY ?AUTO_4017 ?AUTO_4018 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4019 - BLOCK
      ?AUTO_4020 - BLOCK
    )
    :vars
    (
      ?AUTO_4021 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4020 ) ( not ( = ?AUTO_4019 ?AUTO_4020 ) ) ( ON ?AUTO_4019 ?AUTO_4021 ) ( CLEAR ?AUTO_4019 ) ( HAND-EMPTY ) ( not ( = ?AUTO_4019 ?AUTO_4021 ) ) ( not ( = ?AUTO_4020 ?AUTO_4021 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4019 ?AUTO_4021 )
      ( MAKE-ON ?AUTO_4019 ?AUTO_4020 )
      ( MAKE-ON-VERIFY ?AUTO_4019 ?AUTO_4020 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4022 - BLOCK
      ?AUTO_4023 - BLOCK
    )
    :vars
    (
      ?AUTO_4024 - BLOCK
      ?AUTO_4025 - BLOCK
      ?AUTO_4026 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4023 ) ( not ( = ?AUTO_4022 ?AUTO_4023 ) ) ( ON ?AUTO_4022 ?AUTO_4024 ) ( CLEAR ?AUTO_4022 ) ( not ( = ?AUTO_4022 ?AUTO_4024 ) ) ( not ( = ?AUTO_4023 ?AUTO_4024 ) ) ( HOLDING ?AUTO_4025 ) ( CLEAR ?AUTO_4026 ) ( not ( = ?AUTO_4022 ?AUTO_4025 ) ) ( not ( = ?AUTO_4022 ?AUTO_4026 ) ) ( not ( = ?AUTO_4023 ?AUTO_4025 ) ) ( not ( = ?AUTO_4023 ?AUTO_4026 ) ) ( not ( = ?AUTO_4024 ?AUTO_4025 ) ) ( not ( = ?AUTO_4024 ?AUTO_4026 ) ) ( not ( = ?AUTO_4025 ?AUTO_4026 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4025 ?AUTO_4026 )
      ( MAKE-ON ?AUTO_4022 ?AUTO_4023 )
      ( MAKE-ON-VERIFY ?AUTO_4022 ?AUTO_4023 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4031 - BLOCK
      ?AUTO_4032 - BLOCK
    )
    :vars
    (
      ?AUTO_4035 - BLOCK
      ?AUTO_4034 - BLOCK
      ?AUTO_4033 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4032 ) ( not ( = ?AUTO_4031 ?AUTO_4032 ) ) ( ON ?AUTO_4031 ?AUTO_4035 ) ( not ( = ?AUTO_4031 ?AUTO_4035 ) ) ( not ( = ?AUTO_4032 ?AUTO_4035 ) ) ( CLEAR ?AUTO_4034 ) ( not ( = ?AUTO_4031 ?AUTO_4033 ) ) ( not ( = ?AUTO_4031 ?AUTO_4034 ) ) ( not ( = ?AUTO_4032 ?AUTO_4033 ) ) ( not ( = ?AUTO_4032 ?AUTO_4034 ) ) ( not ( = ?AUTO_4035 ?AUTO_4033 ) ) ( not ( = ?AUTO_4035 ?AUTO_4034 ) ) ( not ( = ?AUTO_4033 ?AUTO_4034 ) ) ( ON ?AUTO_4033 ?AUTO_4031 ) ( CLEAR ?AUTO_4033 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4033 ?AUTO_4031 )
      ( MAKE-ON ?AUTO_4031 ?AUTO_4032 )
      ( MAKE-ON-VERIFY ?AUTO_4031 ?AUTO_4032 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4038 - BLOCK
      ?AUTO_4039 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4038 ) ( CLEAR ?AUTO_4039 ) ( not ( = ?AUTO_4038 ?AUTO_4039 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4038 ?AUTO_4039 )
      ( MAKE-ON-VERIFY ?AUTO_4038 ?AUTO_4039 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4040 - BLOCK
      ?AUTO_4041 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4041 ) ( not ( = ?AUTO_4040 ?AUTO_4041 ) ) ( ON-TABLE ?AUTO_4040 ) ( CLEAR ?AUTO_4040 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_4040 )
      ( MAKE-ON ?AUTO_4040 ?AUTO_4041 )
      ( MAKE-ON-VERIFY ?AUTO_4040 ?AUTO_4041 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4042 - BLOCK
      ?AUTO_4043 - BLOCK
    )
    :vars
    (
      ?AUTO_4044 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4042 ?AUTO_4043 ) ) ( ON-TABLE ?AUTO_4042 ) ( CLEAR ?AUTO_4042 ) ( HOLDING ?AUTO_4043 ) ( CLEAR ?AUTO_4044 ) ( not ( = ?AUTO_4042 ?AUTO_4044 ) ) ( not ( = ?AUTO_4043 ?AUTO_4044 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4043 ?AUTO_4044 )
      ( MAKE-ON ?AUTO_4042 ?AUTO_4043 )
      ( MAKE-ON-VERIFY ?AUTO_4042 ?AUTO_4043 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4045 - BLOCK
      ?AUTO_4046 - BLOCK
    )
    :vars
    (
      ?AUTO_4047 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4045 ?AUTO_4046 ) ) ( ON-TABLE ?AUTO_4045 ) ( CLEAR ?AUTO_4047 ) ( not ( = ?AUTO_4045 ?AUTO_4047 ) ) ( not ( = ?AUTO_4046 ?AUTO_4047 ) ) ( ON ?AUTO_4046 ?AUTO_4045 ) ( CLEAR ?AUTO_4046 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4046 ?AUTO_4045 )
      ( MAKE-ON ?AUTO_4045 ?AUTO_4046 )
      ( MAKE-ON-VERIFY ?AUTO_4045 ?AUTO_4046 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4048 - BLOCK
      ?AUTO_4049 - BLOCK
    )
    :vars
    (
      ?AUTO_4050 - BLOCK
      ?AUTO_4051 - BLOCK
      ?AUTO_4052 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4048 ?AUTO_4049 ) ) ( ON-TABLE ?AUTO_4048 ) ( CLEAR ?AUTO_4050 ) ( not ( = ?AUTO_4048 ?AUTO_4050 ) ) ( not ( = ?AUTO_4049 ?AUTO_4050 ) ) ( ON ?AUTO_4049 ?AUTO_4048 ) ( CLEAR ?AUTO_4049 ) ( HOLDING ?AUTO_4051 ) ( CLEAR ?AUTO_4052 ) ( not ( = ?AUTO_4048 ?AUTO_4051 ) ) ( not ( = ?AUTO_4048 ?AUTO_4052 ) ) ( not ( = ?AUTO_4049 ?AUTO_4051 ) ) ( not ( = ?AUTO_4049 ?AUTO_4052 ) ) ( not ( = ?AUTO_4050 ?AUTO_4051 ) ) ( not ( = ?AUTO_4050 ?AUTO_4052 ) ) ( not ( = ?AUTO_4051 ?AUTO_4052 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4051 ?AUTO_4052 )
      ( MAKE-ON ?AUTO_4048 ?AUTO_4049 )
      ( MAKE-ON-VERIFY ?AUTO_4048 ?AUTO_4049 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4057 - BLOCK
      ?AUTO_4058 - BLOCK
    )
    :vars
    (
      ?AUTO_4061 - BLOCK
      ?AUTO_4059 - BLOCK
      ?AUTO_4060 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4057 ?AUTO_4058 ) ) ( ON-TABLE ?AUTO_4057 ) ( CLEAR ?AUTO_4061 ) ( not ( = ?AUTO_4057 ?AUTO_4061 ) ) ( not ( = ?AUTO_4058 ?AUTO_4061 ) ) ( ON ?AUTO_4058 ?AUTO_4057 ) ( CLEAR ?AUTO_4059 ) ( not ( = ?AUTO_4057 ?AUTO_4060 ) ) ( not ( = ?AUTO_4057 ?AUTO_4059 ) ) ( not ( = ?AUTO_4058 ?AUTO_4060 ) ) ( not ( = ?AUTO_4058 ?AUTO_4059 ) ) ( not ( = ?AUTO_4061 ?AUTO_4060 ) ) ( not ( = ?AUTO_4061 ?AUTO_4059 ) ) ( not ( = ?AUTO_4060 ?AUTO_4059 ) ) ( ON ?AUTO_4060 ?AUTO_4058 ) ( CLEAR ?AUTO_4060 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4060 ?AUTO_4058 )
      ( MAKE-ON ?AUTO_4057 ?AUTO_4058 )
      ( MAKE-ON-VERIFY ?AUTO_4057 ?AUTO_4058 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4064 - BLOCK
      ?AUTO_4065 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4064 ) ( CLEAR ?AUTO_4065 ) ( not ( = ?AUTO_4064 ?AUTO_4065 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4064 ?AUTO_4065 )
      ( MAKE-ON-VERIFY ?AUTO_4064 ?AUTO_4065 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4066 - BLOCK
      ?AUTO_4067 - BLOCK
    )
    :vars
    (
      ?AUTO_4068 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4067 ) ( not ( = ?AUTO_4066 ?AUTO_4067 ) ) ( ON ?AUTO_4066 ?AUTO_4068 ) ( CLEAR ?AUTO_4066 ) ( HAND-EMPTY ) ( not ( = ?AUTO_4066 ?AUTO_4068 ) ) ( not ( = ?AUTO_4067 ?AUTO_4068 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4066 ?AUTO_4068 )
      ( MAKE-ON ?AUTO_4066 ?AUTO_4067 )
      ( MAKE-ON-VERIFY ?AUTO_4066 ?AUTO_4067 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4069 - BLOCK
      ?AUTO_4070 - BLOCK
    )
    :vars
    (
      ?AUTO_4071 - BLOCK
      ?AUTO_4072 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4069 ?AUTO_4070 ) ) ( ON ?AUTO_4069 ?AUTO_4071 ) ( CLEAR ?AUTO_4069 ) ( not ( = ?AUTO_4069 ?AUTO_4071 ) ) ( not ( = ?AUTO_4070 ?AUTO_4071 ) ) ( HOLDING ?AUTO_4070 ) ( CLEAR ?AUTO_4072 ) ( not ( = ?AUTO_4069 ?AUTO_4072 ) ) ( not ( = ?AUTO_4070 ?AUTO_4072 ) ) ( not ( = ?AUTO_4071 ?AUTO_4072 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4070 ?AUTO_4072 )
      ( MAKE-ON ?AUTO_4069 ?AUTO_4070 )
      ( MAKE-ON-VERIFY ?AUTO_4069 ?AUTO_4070 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4075 - BLOCK
      ?AUTO_4076 - BLOCK
    )
    :vars
    (
      ?AUTO_4077 - BLOCK
      ?AUTO_4078 - BLOCK
      ?AUTO_4079 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4076 ) ( not ( = ?AUTO_4075 ?AUTO_4076 ) ) ( ON ?AUTO_4075 ?AUTO_4077 ) ( CLEAR ?AUTO_4075 ) ( not ( = ?AUTO_4075 ?AUTO_4077 ) ) ( not ( = ?AUTO_4076 ?AUTO_4077 ) ) ( HOLDING ?AUTO_4078 ) ( CLEAR ?AUTO_4079 ) ( not ( = ?AUTO_4075 ?AUTO_4078 ) ) ( not ( = ?AUTO_4075 ?AUTO_4079 ) ) ( not ( = ?AUTO_4076 ?AUTO_4078 ) ) ( not ( = ?AUTO_4076 ?AUTO_4079 ) ) ( not ( = ?AUTO_4077 ?AUTO_4078 ) ) ( not ( = ?AUTO_4077 ?AUTO_4079 ) ) ( not ( = ?AUTO_4078 ?AUTO_4079 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4078 ?AUTO_4079 )
      ( MAKE-ON ?AUTO_4075 ?AUTO_4076 )
      ( MAKE-ON-VERIFY ?AUTO_4075 ?AUTO_4076 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4080 - BLOCK
      ?AUTO_4081 - BLOCK
    )
    :vars
    (
      ?AUTO_4082 - BLOCK
      ?AUTO_4083 - BLOCK
      ?AUTO_4084 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4080 ?AUTO_4081 ) ) ( ON ?AUTO_4080 ?AUTO_4082 ) ( CLEAR ?AUTO_4080 ) ( not ( = ?AUTO_4080 ?AUTO_4082 ) ) ( not ( = ?AUTO_4081 ?AUTO_4082 ) ) ( CLEAR ?AUTO_4083 ) ( not ( = ?AUTO_4080 ?AUTO_4084 ) ) ( not ( = ?AUTO_4080 ?AUTO_4083 ) ) ( not ( = ?AUTO_4081 ?AUTO_4084 ) ) ( not ( = ?AUTO_4081 ?AUTO_4083 ) ) ( not ( = ?AUTO_4082 ?AUTO_4084 ) ) ( not ( = ?AUTO_4082 ?AUTO_4083 ) ) ( not ( = ?AUTO_4084 ?AUTO_4083 ) ) ( ON ?AUTO_4084 ?AUTO_4081 ) ( CLEAR ?AUTO_4084 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4084 ?AUTO_4081 )
      ( MAKE-ON ?AUTO_4080 ?AUTO_4081 )
      ( MAKE-ON-VERIFY ?AUTO_4080 ?AUTO_4081 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4085 - BLOCK
      ?AUTO_4086 - BLOCK
    )
    :vars
    (
      ?AUTO_4087 - BLOCK
      ?AUTO_4088 - BLOCK
      ?AUTO_4089 - BLOCK
      ?AUTO_4090 - BLOCK
      ?AUTO_4091 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4085 ?AUTO_4086 ) ) ( ON ?AUTO_4085 ?AUTO_4087 ) ( CLEAR ?AUTO_4085 ) ( not ( = ?AUTO_4085 ?AUTO_4087 ) ) ( not ( = ?AUTO_4086 ?AUTO_4087 ) ) ( CLEAR ?AUTO_4088 ) ( not ( = ?AUTO_4085 ?AUTO_4089 ) ) ( not ( = ?AUTO_4085 ?AUTO_4088 ) ) ( not ( = ?AUTO_4086 ?AUTO_4089 ) ) ( not ( = ?AUTO_4086 ?AUTO_4088 ) ) ( not ( = ?AUTO_4087 ?AUTO_4089 ) ) ( not ( = ?AUTO_4087 ?AUTO_4088 ) ) ( not ( = ?AUTO_4089 ?AUTO_4088 ) ) ( ON ?AUTO_4089 ?AUTO_4086 ) ( CLEAR ?AUTO_4089 ) ( HOLDING ?AUTO_4090 ) ( CLEAR ?AUTO_4091 ) ( not ( = ?AUTO_4085 ?AUTO_4090 ) ) ( not ( = ?AUTO_4085 ?AUTO_4091 ) ) ( not ( = ?AUTO_4086 ?AUTO_4090 ) ) ( not ( = ?AUTO_4086 ?AUTO_4091 ) ) ( not ( = ?AUTO_4087 ?AUTO_4090 ) ) ( not ( = ?AUTO_4087 ?AUTO_4091 ) ) ( not ( = ?AUTO_4088 ?AUTO_4090 ) ) ( not ( = ?AUTO_4088 ?AUTO_4091 ) ) ( not ( = ?AUTO_4089 ?AUTO_4090 ) ) ( not ( = ?AUTO_4089 ?AUTO_4091 ) ) ( not ( = ?AUTO_4090 ?AUTO_4091 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4090 ?AUTO_4091 )
      ( MAKE-ON ?AUTO_4085 ?AUTO_4086 )
      ( MAKE-ON-VERIFY ?AUTO_4085 ?AUTO_4086 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4096 - BLOCK
      ?AUTO_4097 - BLOCK
    )
    :vars
    (
      ?AUTO_4102 - BLOCK
      ?AUTO_4101 - BLOCK
      ?AUTO_4098 - BLOCK
      ?AUTO_4099 - BLOCK
      ?AUTO_4100 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4096 ?AUTO_4097 ) ) ( ON ?AUTO_4096 ?AUTO_4102 ) ( CLEAR ?AUTO_4096 ) ( not ( = ?AUTO_4096 ?AUTO_4102 ) ) ( not ( = ?AUTO_4097 ?AUTO_4102 ) ) ( CLEAR ?AUTO_4101 ) ( not ( = ?AUTO_4096 ?AUTO_4098 ) ) ( not ( = ?AUTO_4096 ?AUTO_4101 ) ) ( not ( = ?AUTO_4097 ?AUTO_4098 ) ) ( not ( = ?AUTO_4097 ?AUTO_4101 ) ) ( not ( = ?AUTO_4102 ?AUTO_4098 ) ) ( not ( = ?AUTO_4102 ?AUTO_4101 ) ) ( not ( = ?AUTO_4098 ?AUTO_4101 ) ) ( ON ?AUTO_4098 ?AUTO_4097 ) ( CLEAR ?AUTO_4099 ) ( not ( = ?AUTO_4096 ?AUTO_4100 ) ) ( not ( = ?AUTO_4096 ?AUTO_4099 ) ) ( not ( = ?AUTO_4097 ?AUTO_4100 ) ) ( not ( = ?AUTO_4097 ?AUTO_4099 ) ) ( not ( = ?AUTO_4102 ?AUTO_4100 ) ) ( not ( = ?AUTO_4102 ?AUTO_4099 ) ) ( not ( = ?AUTO_4101 ?AUTO_4100 ) ) ( not ( = ?AUTO_4101 ?AUTO_4099 ) ) ( not ( = ?AUTO_4098 ?AUTO_4100 ) ) ( not ( = ?AUTO_4098 ?AUTO_4099 ) ) ( not ( = ?AUTO_4100 ?AUTO_4099 ) ) ( ON ?AUTO_4100 ?AUTO_4098 ) ( CLEAR ?AUTO_4100 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4100 ?AUTO_4098 )
      ( MAKE-ON ?AUTO_4096 ?AUTO_4097 )
      ( MAKE-ON-VERIFY ?AUTO_4096 ?AUTO_4097 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4104 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4104 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4104 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4104 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4105 - BLOCK
    )
    :vars
    (
      ?AUTO_4106 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4105 ?AUTO_4106 ) ( CLEAR ?AUTO_4105 ) ( HAND-EMPTY ) ( not ( = ?AUTO_4105 ?AUTO_4106 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4105 ?AUTO_4106 )
      ( MAKE-ON-TABLE ?AUTO_4105 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4105 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4107 - BLOCK
    )
    :vars
    (
      ?AUTO_4108 - BLOCK
      ?AUTO_4109 - BLOCK
      ?AUTO_4110 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4107 ?AUTO_4108 ) ( CLEAR ?AUTO_4107 ) ( not ( = ?AUTO_4107 ?AUTO_4108 ) ) ( HOLDING ?AUTO_4109 ) ( CLEAR ?AUTO_4110 ) ( not ( = ?AUTO_4107 ?AUTO_4109 ) ) ( not ( = ?AUTO_4107 ?AUTO_4110 ) ) ( not ( = ?AUTO_4108 ?AUTO_4109 ) ) ( not ( = ?AUTO_4108 ?AUTO_4110 ) ) ( not ( = ?AUTO_4109 ?AUTO_4110 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4109 ?AUTO_4110 )
      ( MAKE-ON-TABLE ?AUTO_4107 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4107 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4111 - BLOCK
    )
    :vars
    (
      ?AUTO_4112 - BLOCK
      ?AUTO_4114 - BLOCK
      ?AUTO_4113 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4111 ?AUTO_4112 ) ( not ( = ?AUTO_4111 ?AUTO_4112 ) ) ( CLEAR ?AUTO_4114 ) ( not ( = ?AUTO_4111 ?AUTO_4113 ) ) ( not ( = ?AUTO_4111 ?AUTO_4114 ) ) ( not ( = ?AUTO_4112 ?AUTO_4113 ) ) ( not ( = ?AUTO_4112 ?AUTO_4114 ) ) ( not ( = ?AUTO_4113 ?AUTO_4114 ) ) ( ON ?AUTO_4113 ?AUTO_4111 ) ( CLEAR ?AUTO_4113 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4113 ?AUTO_4111 )
      ( MAKE-ON-TABLE ?AUTO_4111 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4111 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4115 - BLOCK
    )
    :vars
    (
      ?AUTO_4116 - BLOCK
      ?AUTO_4117 - BLOCK
      ?AUTO_4118 - BLOCK
      ?AUTO_4119 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4115 ?AUTO_4116 ) ( not ( = ?AUTO_4115 ?AUTO_4116 ) ) ( not ( = ?AUTO_4115 ?AUTO_4117 ) ) ( not ( = ?AUTO_4115 ?AUTO_4118 ) ) ( not ( = ?AUTO_4116 ?AUTO_4117 ) ) ( not ( = ?AUTO_4116 ?AUTO_4118 ) ) ( not ( = ?AUTO_4117 ?AUTO_4118 ) ) ( ON ?AUTO_4117 ?AUTO_4115 ) ( CLEAR ?AUTO_4117 ) ( HOLDING ?AUTO_4118 ) ( CLEAR ?AUTO_4119 ) ( not ( = ?AUTO_4115 ?AUTO_4119 ) ) ( not ( = ?AUTO_4116 ?AUTO_4119 ) ) ( not ( = ?AUTO_4117 ?AUTO_4119 ) ) ( not ( = ?AUTO_4118 ?AUTO_4119 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4118 ?AUTO_4119 )
      ( MAKE-ON-TABLE ?AUTO_4115 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4115 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4128 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4128 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4128 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4128 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4129 - BLOCK
    )
    :vars
    (
      ?AUTO_4130 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4129 ?AUTO_4130 ) ( CLEAR ?AUTO_4129 ) ( HAND-EMPTY ) ( not ( = ?AUTO_4129 ?AUTO_4130 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4129 ?AUTO_4130 )
      ( MAKE-ON-TABLE ?AUTO_4129 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4129 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4131 - BLOCK
    )
    :vars
    (
      ?AUTO_4132 - BLOCK
      ?AUTO_4133 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4131 ?AUTO_4132 ) ( CLEAR ?AUTO_4131 ) ( not ( = ?AUTO_4131 ?AUTO_4132 ) ) ( HOLDING ?AUTO_4133 ) ( not ( = ?AUTO_4131 ?AUTO_4133 ) ) ( not ( = ?AUTO_4132 ?AUTO_4133 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4133 )
      ( MAKE-ON-TABLE ?AUTO_4131 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4131 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4134 - BLOCK
    )
    :vars
    (
      ?AUTO_4135 - BLOCK
      ?AUTO_4136 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4134 ?AUTO_4135 ) ( not ( = ?AUTO_4134 ?AUTO_4135 ) ) ( not ( = ?AUTO_4134 ?AUTO_4136 ) ) ( not ( = ?AUTO_4135 ?AUTO_4136 ) ) ( ON ?AUTO_4136 ?AUTO_4134 ) ( CLEAR ?AUTO_4136 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4136 ?AUTO_4134 )
      ( MAKE-ON-TABLE ?AUTO_4134 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4134 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4137 - BLOCK
    )
    :vars
    (
      ?AUTO_4138 - BLOCK
      ?AUTO_4139 - BLOCK
      ?AUTO_4140 - BLOCK
      ?AUTO_4141 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4137 ?AUTO_4138 ) ( not ( = ?AUTO_4137 ?AUTO_4138 ) ) ( not ( = ?AUTO_4137 ?AUTO_4139 ) ) ( not ( = ?AUTO_4138 ?AUTO_4139 ) ) ( ON ?AUTO_4139 ?AUTO_4137 ) ( CLEAR ?AUTO_4139 ) ( HOLDING ?AUTO_4140 ) ( CLEAR ?AUTO_4141 ) ( not ( = ?AUTO_4137 ?AUTO_4140 ) ) ( not ( = ?AUTO_4137 ?AUTO_4141 ) ) ( not ( = ?AUTO_4138 ?AUTO_4140 ) ) ( not ( = ?AUTO_4138 ?AUTO_4141 ) ) ( not ( = ?AUTO_4139 ?AUTO_4140 ) ) ( not ( = ?AUTO_4139 ?AUTO_4141 ) ) ( not ( = ?AUTO_4140 ?AUTO_4141 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4140 ?AUTO_4141 )
      ( MAKE-ON-TABLE ?AUTO_4137 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4137 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4142 - BLOCK
    )
    :vars
    (
      ?AUTO_4143 - BLOCK
      ?AUTO_4144 - BLOCK
      ?AUTO_4145 - BLOCK
      ?AUTO_4146 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4142 ?AUTO_4143 ) ( not ( = ?AUTO_4142 ?AUTO_4143 ) ) ( not ( = ?AUTO_4142 ?AUTO_4144 ) ) ( not ( = ?AUTO_4143 ?AUTO_4144 ) ) ( ON ?AUTO_4144 ?AUTO_4142 ) ( CLEAR ?AUTO_4145 ) ( not ( = ?AUTO_4142 ?AUTO_4146 ) ) ( not ( = ?AUTO_4142 ?AUTO_4145 ) ) ( not ( = ?AUTO_4143 ?AUTO_4146 ) ) ( not ( = ?AUTO_4143 ?AUTO_4145 ) ) ( not ( = ?AUTO_4144 ?AUTO_4146 ) ) ( not ( = ?AUTO_4144 ?AUTO_4145 ) ) ( not ( = ?AUTO_4146 ?AUTO_4145 ) ) ( ON ?AUTO_4146 ?AUTO_4144 ) ( CLEAR ?AUTO_4146 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4146 ?AUTO_4144 )
      ( MAKE-ON-TABLE ?AUTO_4142 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4142 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4147 - BLOCK
    )
    :vars
    (
      ?AUTO_4149 - BLOCK
      ?AUTO_4148 - BLOCK
      ?AUTO_4151 - BLOCK
      ?AUTO_4150 - BLOCK
      ?AUTO_4152 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4147 ?AUTO_4149 ) ( not ( = ?AUTO_4147 ?AUTO_4149 ) ) ( not ( = ?AUTO_4147 ?AUTO_4148 ) ) ( not ( = ?AUTO_4149 ?AUTO_4148 ) ) ( ON ?AUTO_4148 ?AUTO_4147 ) ( not ( = ?AUTO_4147 ?AUTO_4151 ) ) ( not ( = ?AUTO_4147 ?AUTO_4150 ) ) ( not ( = ?AUTO_4149 ?AUTO_4151 ) ) ( not ( = ?AUTO_4149 ?AUTO_4150 ) ) ( not ( = ?AUTO_4148 ?AUTO_4151 ) ) ( not ( = ?AUTO_4148 ?AUTO_4150 ) ) ( not ( = ?AUTO_4151 ?AUTO_4150 ) ) ( ON ?AUTO_4151 ?AUTO_4148 ) ( CLEAR ?AUTO_4151 ) ( HOLDING ?AUTO_4150 ) ( CLEAR ?AUTO_4152 ) ( not ( = ?AUTO_4147 ?AUTO_4152 ) ) ( not ( = ?AUTO_4149 ?AUTO_4152 ) ) ( not ( = ?AUTO_4148 ?AUTO_4152 ) ) ( not ( = ?AUTO_4151 ?AUTO_4152 ) ) ( not ( = ?AUTO_4150 ?AUTO_4152 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4150 ?AUTO_4152 )
      ( MAKE-ON-TABLE ?AUTO_4147 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4147 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4162 - BLOCK
      ?AUTO_4163 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4162 ) ( CLEAR ?AUTO_4163 ) ( not ( = ?AUTO_4162 ?AUTO_4163 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4162 ?AUTO_4163 )
      ( MAKE-ON-VERIFY ?AUTO_4162 ?AUTO_4163 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4164 - BLOCK
      ?AUTO_4165 - BLOCK
    )
    :vars
    (
      ?AUTO_4166 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4165 ) ( not ( = ?AUTO_4164 ?AUTO_4165 ) ) ( ON ?AUTO_4164 ?AUTO_4166 ) ( CLEAR ?AUTO_4164 ) ( HAND-EMPTY ) ( not ( = ?AUTO_4164 ?AUTO_4166 ) ) ( not ( = ?AUTO_4165 ?AUTO_4166 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4164 ?AUTO_4166 )
      ( MAKE-ON ?AUTO_4164 ?AUTO_4165 )
      ( MAKE-ON-VERIFY ?AUTO_4164 ?AUTO_4165 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4167 - BLOCK
      ?AUTO_4168 - BLOCK
    )
    :vars
    (
      ?AUTO_4169 - BLOCK
      ?AUTO_4170 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4168 ) ( not ( = ?AUTO_4167 ?AUTO_4168 ) ) ( ON ?AUTO_4167 ?AUTO_4169 ) ( CLEAR ?AUTO_4167 ) ( not ( = ?AUTO_4167 ?AUTO_4169 ) ) ( not ( = ?AUTO_4168 ?AUTO_4169 ) ) ( HOLDING ?AUTO_4170 ) ( not ( = ?AUTO_4167 ?AUTO_4170 ) ) ( not ( = ?AUTO_4168 ?AUTO_4170 ) ) ( not ( = ?AUTO_4169 ?AUTO_4170 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4170 )
      ( MAKE-ON ?AUTO_4167 ?AUTO_4168 )
      ( MAKE-ON-VERIFY ?AUTO_4167 ?AUTO_4168 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4171 - BLOCK
      ?AUTO_4172 - BLOCK
    )
    :vars
    (
      ?AUTO_4173 - BLOCK
      ?AUTO_4174 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4172 ) ( not ( = ?AUTO_4171 ?AUTO_4172 ) ) ( ON ?AUTO_4171 ?AUTO_4173 ) ( not ( = ?AUTO_4171 ?AUTO_4173 ) ) ( not ( = ?AUTO_4172 ?AUTO_4173 ) ) ( not ( = ?AUTO_4171 ?AUTO_4174 ) ) ( not ( = ?AUTO_4172 ?AUTO_4174 ) ) ( not ( = ?AUTO_4173 ?AUTO_4174 ) ) ( ON ?AUTO_4174 ?AUTO_4171 ) ( CLEAR ?AUTO_4174 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4174 ?AUTO_4171 )
      ( MAKE-ON ?AUTO_4171 ?AUTO_4172 )
      ( MAKE-ON-VERIFY ?AUTO_4171 ?AUTO_4172 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4175 - BLOCK
      ?AUTO_4176 - BLOCK
    )
    :vars
    (
      ?AUTO_4177 - BLOCK
      ?AUTO_4178 - BLOCK
      ?AUTO_4179 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4176 ) ( not ( = ?AUTO_4175 ?AUTO_4176 ) ) ( ON ?AUTO_4175 ?AUTO_4177 ) ( not ( = ?AUTO_4175 ?AUTO_4177 ) ) ( not ( = ?AUTO_4176 ?AUTO_4177 ) ) ( not ( = ?AUTO_4175 ?AUTO_4178 ) ) ( not ( = ?AUTO_4176 ?AUTO_4178 ) ) ( not ( = ?AUTO_4177 ?AUTO_4178 ) ) ( ON ?AUTO_4178 ?AUTO_4175 ) ( CLEAR ?AUTO_4178 ) ( HOLDING ?AUTO_4179 ) ( not ( = ?AUTO_4175 ?AUTO_4179 ) ) ( not ( = ?AUTO_4176 ?AUTO_4179 ) ) ( not ( = ?AUTO_4177 ?AUTO_4179 ) ) ( not ( = ?AUTO_4178 ?AUTO_4179 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4179 )
      ( MAKE-ON ?AUTO_4175 ?AUTO_4176 )
      ( MAKE-ON-VERIFY ?AUTO_4175 ?AUTO_4176 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4180 - BLOCK
      ?AUTO_4181 - BLOCK
    )
    :vars
    (
      ?AUTO_4182 - BLOCK
      ?AUTO_4183 - BLOCK
      ?AUTO_4184 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4181 ) ( not ( = ?AUTO_4180 ?AUTO_4181 ) ) ( ON ?AUTO_4180 ?AUTO_4182 ) ( not ( = ?AUTO_4180 ?AUTO_4182 ) ) ( not ( = ?AUTO_4181 ?AUTO_4182 ) ) ( not ( = ?AUTO_4180 ?AUTO_4183 ) ) ( not ( = ?AUTO_4181 ?AUTO_4183 ) ) ( not ( = ?AUTO_4182 ?AUTO_4183 ) ) ( ON ?AUTO_4183 ?AUTO_4180 ) ( not ( = ?AUTO_4180 ?AUTO_4184 ) ) ( not ( = ?AUTO_4181 ?AUTO_4184 ) ) ( not ( = ?AUTO_4182 ?AUTO_4184 ) ) ( not ( = ?AUTO_4183 ?AUTO_4184 ) ) ( ON ?AUTO_4184 ?AUTO_4183 ) ( CLEAR ?AUTO_4184 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4184 ?AUTO_4183 )
      ( MAKE-ON ?AUTO_4180 ?AUTO_4181 )
      ( MAKE-ON-VERIFY ?AUTO_4180 ?AUTO_4181 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4185 - BLOCK
      ?AUTO_4186 - BLOCK
    )
    :vars
    (
      ?AUTO_4188 - BLOCK
      ?AUTO_4187 - BLOCK
      ?AUTO_4189 - BLOCK
      ?AUTO_4190 - BLOCK
      ?AUTO_4191 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4186 ) ( not ( = ?AUTO_4185 ?AUTO_4186 ) ) ( ON ?AUTO_4185 ?AUTO_4188 ) ( not ( = ?AUTO_4185 ?AUTO_4188 ) ) ( not ( = ?AUTO_4186 ?AUTO_4188 ) ) ( not ( = ?AUTO_4185 ?AUTO_4187 ) ) ( not ( = ?AUTO_4186 ?AUTO_4187 ) ) ( not ( = ?AUTO_4188 ?AUTO_4187 ) ) ( ON ?AUTO_4187 ?AUTO_4185 ) ( not ( = ?AUTO_4185 ?AUTO_4189 ) ) ( not ( = ?AUTO_4186 ?AUTO_4189 ) ) ( not ( = ?AUTO_4188 ?AUTO_4189 ) ) ( not ( = ?AUTO_4187 ?AUTO_4189 ) ) ( ON ?AUTO_4189 ?AUTO_4187 ) ( CLEAR ?AUTO_4189 ) ( HOLDING ?AUTO_4190 ) ( CLEAR ?AUTO_4191 ) ( not ( = ?AUTO_4185 ?AUTO_4190 ) ) ( not ( = ?AUTO_4185 ?AUTO_4191 ) ) ( not ( = ?AUTO_4186 ?AUTO_4190 ) ) ( not ( = ?AUTO_4186 ?AUTO_4191 ) ) ( not ( = ?AUTO_4188 ?AUTO_4190 ) ) ( not ( = ?AUTO_4188 ?AUTO_4191 ) ) ( not ( = ?AUTO_4187 ?AUTO_4190 ) ) ( not ( = ?AUTO_4187 ?AUTO_4191 ) ) ( not ( = ?AUTO_4189 ?AUTO_4190 ) ) ( not ( = ?AUTO_4189 ?AUTO_4191 ) ) ( not ( = ?AUTO_4190 ?AUTO_4191 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4190 ?AUTO_4191 )
      ( MAKE-ON ?AUTO_4185 ?AUTO_4186 )
      ( MAKE-ON-VERIFY ?AUTO_4185 ?AUTO_4186 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4192 - BLOCK
      ?AUTO_4193 - BLOCK
    )
    :vars
    (
      ?AUTO_4194 - BLOCK
      ?AUTO_4195 - BLOCK
      ?AUTO_4197 - BLOCK
      ?AUTO_4198 - BLOCK
      ?AUTO_4196 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4193 ) ( not ( = ?AUTO_4192 ?AUTO_4193 ) ) ( ON ?AUTO_4192 ?AUTO_4194 ) ( not ( = ?AUTO_4192 ?AUTO_4194 ) ) ( not ( = ?AUTO_4193 ?AUTO_4194 ) ) ( not ( = ?AUTO_4192 ?AUTO_4195 ) ) ( not ( = ?AUTO_4193 ?AUTO_4195 ) ) ( not ( = ?AUTO_4194 ?AUTO_4195 ) ) ( ON ?AUTO_4195 ?AUTO_4192 ) ( not ( = ?AUTO_4192 ?AUTO_4197 ) ) ( not ( = ?AUTO_4193 ?AUTO_4197 ) ) ( not ( = ?AUTO_4194 ?AUTO_4197 ) ) ( not ( = ?AUTO_4195 ?AUTO_4197 ) ) ( ON ?AUTO_4197 ?AUTO_4195 ) ( CLEAR ?AUTO_4198 ) ( not ( = ?AUTO_4192 ?AUTO_4196 ) ) ( not ( = ?AUTO_4192 ?AUTO_4198 ) ) ( not ( = ?AUTO_4193 ?AUTO_4196 ) ) ( not ( = ?AUTO_4193 ?AUTO_4198 ) ) ( not ( = ?AUTO_4194 ?AUTO_4196 ) ) ( not ( = ?AUTO_4194 ?AUTO_4198 ) ) ( not ( = ?AUTO_4195 ?AUTO_4196 ) ) ( not ( = ?AUTO_4195 ?AUTO_4198 ) ) ( not ( = ?AUTO_4197 ?AUTO_4196 ) ) ( not ( = ?AUTO_4197 ?AUTO_4198 ) ) ( not ( = ?AUTO_4196 ?AUTO_4198 ) ) ( ON ?AUTO_4196 ?AUTO_4197 ) ( CLEAR ?AUTO_4196 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4196 ?AUTO_4197 )
      ( MAKE-ON ?AUTO_4192 ?AUTO_4193 )
      ( MAKE-ON-VERIFY ?AUTO_4192 ?AUTO_4193 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4199 - BLOCK
      ?AUTO_4200 - BLOCK
    )
    :vars
    (
      ?AUTO_4202 - BLOCK
      ?AUTO_4201 - BLOCK
      ?AUTO_4205 - BLOCK
      ?AUTO_4204 - BLOCK
      ?AUTO_4203 - BLOCK
      ?AUTO_4206 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4200 ) ( not ( = ?AUTO_4199 ?AUTO_4200 ) ) ( ON ?AUTO_4199 ?AUTO_4202 ) ( not ( = ?AUTO_4199 ?AUTO_4202 ) ) ( not ( = ?AUTO_4200 ?AUTO_4202 ) ) ( not ( = ?AUTO_4199 ?AUTO_4201 ) ) ( not ( = ?AUTO_4200 ?AUTO_4201 ) ) ( not ( = ?AUTO_4202 ?AUTO_4201 ) ) ( ON ?AUTO_4201 ?AUTO_4199 ) ( not ( = ?AUTO_4199 ?AUTO_4205 ) ) ( not ( = ?AUTO_4200 ?AUTO_4205 ) ) ( not ( = ?AUTO_4202 ?AUTO_4205 ) ) ( not ( = ?AUTO_4201 ?AUTO_4205 ) ) ( ON ?AUTO_4205 ?AUTO_4201 ) ( not ( = ?AUTO_4199 ?AUTO_4204 ) ) ( not ( = ?AUTO_4199 ?AUTO_4203 ) ) ( not ( = ?AUTO_4200 ?AUTO_4204 ) ) ( not ( = ?AUTO_4200 ?AUTO_4203 ) ) ( not ( = ?AUTO_4202 ?AUTO_4204 ) ) ( not ( = ?AUTO_4202 ?AUTO_4203 ) ) ( not ( = ?AUTO_4201 ?AUTO_4204 ) ) ( not ( = ?AUTO_4201 ?AUTO_4203 ) ) ( not ( = ?AUTO_4205 ?AUTO_4204 ) ) ( not ( = ?AUTO_4205 ?AUTO_4203 ) ) ( not ( = ?AUTO_4204 ?AUTO_4203 ) ) ( ON ?AUTO_4204 ?AUTO_4205 ) ( CLEAR ?AUTO_4204 ) ( HOLDING ?AUTO_4203 ) ( CLEAR ?AUTO_4206 ) ( not ( = ?AUTO_4199 ?AUTO_4206 ) ) ( not ( = ?AUTO_4200 ?AUTO_4206 ) ) ( not ( = ?AUTO_4202 ?AUTO_4206 ) ) ( not ( = ?AUTO_4201 ?AUTO_4206 ) ) ( not ( = ?AUTO_4205 ?AUTO_4206 ) ) ( not ( = ?AUTO_4204 ?AUTO_4206 ) ) ( not ( = ?AUTO_4203 ?AUTO_4206 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4203 ?AUTO_4206 )
      ( MAKE-ON ?AUTO_4199 ?AUTO_4200 )
      ( MAKE-ON-VERIFY ?AUTO_4199 ?AUTO_4200 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4213 - BLOCK
      ?AUTO_4214 - BLOCK
    )
    :vars
    (
      ?AUTO_4218 - BLOCK
      ?AUTO_4215 - BLOCK
      ?AUTO_4219 - BLOCK
      ?AUTO_4216 - BLOCK
      ?AUTO_4217 - BLOCK
      ?AUTO_4220 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4213 ?AUTO_4214 ) ) ( ON ?AUTO_4213 ?AUTO_4218 ) ( not ( = ?AUTO_4213 ?AUTO_4218 ) ) ( not ( = ?AUTO_4214 ?AUTO_4218 ) ) ( not ( = ?AUTO_4213 ?AUTO_4215 ) ) ( not ( = ?AUTO_4214 ?AUTO_4215 ) ) ( not ( = ?AUTO_4218 ?AUTO_4215 ) ) ( ON ?AUTO_4215 ?AUTO_4213 ) ( not ( = ?AUTO_4213 ?AUTO_4219 ) ) ( not ( = ?AUTO_4214 ?AUTO_4219 ) ) ( not ( = ?AUTO_4218 ?AUTO_4219 ) ) ( not ( = ?AUTO_4215 ?AUTO_4219 ) ) ( ON ?AUTO_4219 ?AUTO_4215 ) ( CLEAR ?AUTO_4216 ) ( not ( = ?AUTO_4213 ?AUTO_4217 ) ) ( not ( = ?AUTO_4213 ?AUTO_4216 ) ) ( not ( = ?AUTO_4214 ?AUTO_4217 ) ) ( not ( = ?AUTO_4214 ?AUTO_4216 ) ) ( not ( = ?AUTO_4218 ?AUTO_4217 ) ) ( not ( = ?AUTO_4218 ?AUTO_4216 ) ) ( not ( = ?AUTO_4215 ?AUTO_4217 ) ) ( not ( = ?AUTO_4215 ?AUTO_4216 ) ) ( not ( = ?AUTO_4219 ?AUTO_4217 ) ) ( not ( = ?AUTO_4219 ?AUTO_4216 ) ) ( not ( = ?AUTO_4217 ?AUTO_4216 ) ) ( ON ?AUTO_4217 ?AUTO_4219 ) ( CLEAR ?AUTO_4217 ) ( HOLDING ?AUTO_4214 ) ( CLEAR ?AUTO_4220 ) ( not ( = ?AUTO_4213 ?AUTO_4220 ) ) ( not ( = ?AUTO_4214 ?AUTO_4220 ) ) ( not ( = ?AUTO_4218 ?AUTO_4220 ) ) ( not ( = ?AUTO_4215 ?AUTO_4220 ) ) ( not ( = ?AUTO_4219 ?AUTO_4220 ) ) ( not ( = ?AUTO_4216 ?AUTO_4220 ) ) ( not ( = ?AUTO_4217 ?AUTO_4220 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4214 ?AUTO_4220 )
      ( MAKE-ON ?AUTO_4213 ?AUTO_4214 )
      ( MAKE-ON-VERIFY ?AUTO_4213 ?AUTO_4214 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4229 - BLOCK
      ?AUTO_4230 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4229 ) ( CLEAR ?AUTO_4230 ) ( not ( = ?AUTO_4229 ?AUTO_4230 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4229 ?AUTO_4230 )
      ( MAKE-ON-VERIFY ?AUTO_4229 ?AUTO_4230 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4231 - BLOCK
      ?AUTO_4232 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4232 ) ( not ( = ?AUTO_4231 ?AUTO_4232 ) ) ( ON-TABLE ?AUTO_4231 ) ( CLEAR ?AUTO_4231 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_4231 )
      ( MAKE-ON ?AUTO_4231 ?AUTO_4232 )
      ( MAKE-ON-VERIFY ?AUTO_4231 ?AUTO_4232 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4233 - BLOCK
      ?AUTO_4234 - BLOCK
    )
    :vars
    (
      ?AUTO_4235 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4233 ?AUTO_4234 ) ) ( ON-TABLE ?AUTO_4233 ) ( CLEAR ?AUTO_4233 ) ( HOLDING ?AUTO_4234 ) ( CLEAR ?AUTO_4235 ) ( not ( = ?AUTO_4233 ?AUTO_4235 ) ) ( not ( = ?AUTO_4234 ?AUTO_4235 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4234 ?AUTO_4235 )
      ( MAKE-ON ?AUTO_4233 ?AUTO_4234 )
      ( MAKE-ON-VERIFY ?AUTO_4233 ?AUTO_4234 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4322 - BLOCK
      ?AUTO_4323 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4322 ) ( CLEAR ?AUTO_4323 ) ( not ( = ?AUTO_4322 ?AUTO_4323 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4322 ?AUTO_4323 )
      ( MAKE-ON-VERIFY ?AUTO_4322 ?AUTO_4323 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4324 - BLOCK
      ?AUTO_4325 - BLOCK
    )
    :vars
    (
      ?AUTO_4326 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4325 ) ( not ( = ?AUTO_4324 ?AUTO_4325 ) ) ( ON ?AUTO_4324 ?AUTO_4326 ) ( CLEAR ?AUTO_4324 ) ( HAND-EMPTY ) ( not ( = ?AUTO_4324 ?AUTO_4326 ) ) ( not ( = ?AUTO_4325 ?AUTO_4326 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4324 ?AUTO_4326 )
      ( MAKE-ON ?AUTO_4324 ?AUTO_4325 )
      ( MAKE-ON-VERIFY ?AUTO_4324 ?AUTO_4325 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4327 - BLOCK
      ?AUTO_4328 - BLOCK
    )
    :vars
    (
      ?AUTO_4329 - BLOCK
      ?AUTO_4330 - BLOCK
      ?AUTO_4331 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4328 ) ( not ( = ?AUTO_4327 ?AUTO_4328 ) ) ( ON ?AUTO_4327 ?AUTO_4329 ) ( CLEAR ?AUTO_4327 ) ( not ( = ?AUTO_4327 ?AUTO_4329 ) ) ( not ( = ?AUTO_4328 ?AUTO_4329 ) ) ( HOLDING ?AUTO_4330 ) ( CLEAR ?AUTO_4331 ) ( not ( = ?AUTO_4327 ?AUTO_4330 ) ) ( not ( = ?AUTO_4327 ?AUTO_4331 ) ) ( not ( = ?AUTO_4328 ?AUTO_4330 ) ) ( not ( = ?AUTO_4328 ?AUTO_4331 ) ) ( not ( = ?AUTO_4329 ?AUTO_4330 ) ) ( not ( = ?AUTO_4329 ?AUTO_4331 ) ) ( not ( = ?AUTO_4330 ?AUTO_4331 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4330 ?AUTO_4331 )
      ( MAKE-ON ?AUTO_4327 ?AUTO_4328 )
      ( MAKE-ON-VERIFY ?AUTO_4327 ?AUTO_4328 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4336 - BLOCK
      ?AUTO_4337 - BLOCK
    )
    :vars
    (
      ?AUTO_4340 - BLOCK
      ?AUTO_4339 - BLOCK
      ?AUTO_4338 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4336 ?AUTO_4337 ) ) ( ON ?AUTO_4336 ?AUTO_4340 ) ( CLEAR ?AUTO_4336 ) ( not ( = ?AUTO_4336 ?AUTO_4340 ) ) ( not ( = ?AUTO_4337 ?AUTO_4340 ) ) ( CLEAR ?AUTO_4339 ) ( not ( = ?AUTO_4336 ?AUTO_4338 ) ) ( not ( = ?AUTO_4336 ?AUTO_4339 ) ) ( not ( = ?AUTO_4337 ?AUTO_4338 ) ) ( not ( = ?AUTO_4337 ?AUTO_4339 ) ) ( not ( = ?AUTO_4340 ?AUTO_4338 ) ) ( not ( = ?AUTO_4340 ?AUTO_4339 ) ) ( not ( = ?AUTO_4338 ?AUTO_4339 ) ) ( ON ?AUTO_4338 ?AUTO_4337 ) ( CLEAR ?AUTO_4338 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4338 ?AUTO_4337 )
      ( MAKE-ON ?AUTO_4336 ?AUTO_4337 )
      ( MAKE-ON-VERIFY ?AUTO_4336 ?AUTO_4337 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4341 - BLOCK
      ?AUTO_4342 - BLOCK
    )
    :vars
    (
      ?AUTO_4345 - BLOCK
      ?AUTO_4343 - BLOCK
      ?AUTO_4344 - BLOCK
      ?AUTO_4346 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4341 ?AUTO_4342 ) ) ( ON ?AUTO_4341 ?AUTO_4345 ) ( CLEAR ?AUTO_4341 ) ( not ( = ?AUTO_4341 ?AUTO_4345 ) ) ( not ( = ?AUTO_4342 ?AUTO_4345 ) ) ( CLEAR ?AUTO_4343 ) ( not ( = ?AUTO_4341 ?AUTO_4344 ) ) ( not ( = ?AUTO_4341 ?AUTO_4343 ) ) ( not ( = ?AUTO_4342 ?AUTO_4344 ) ) ( not ( = ?AUTO_4342 ?AUTO_4343 ) ) ( not ( = ?AUTO_4345 ?AUTO_4344 ) ) ( not ( = ?AUTO_4345 ?AUTO_4343 ) ) ( not ( = ?AUTO_4344 ?AUTO_4343 ) ) ( ON ?AUTO_4344 ?AUTO_4342 ) ( CLEAR ?AUTO_4344 ) ( HOLDING ?AUTO_4346 ) ( not ( = ?AUTO_4341 ?AUTO_4346 ) ) ( not ( = ?AUTO_4342 ?AUTO_4346 ) ) ( not ( = ?AUTO_4345 ?AUTO_4346 ) ) ( not ( = ?AUTO_4343 ?AUTO_4346 ) ) ( not ( = ?AUTO_4344 ?AUTO_4346 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4346 )
      ( MAKE-ON ?AUTO_4341 ?AUTO_4342 )
      ( MAKE-ON-VERIFY ?AUTO_4341 ?AUTO_4342 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4347 - BLOCK
      ?AUTO_4348 - BLOCK
    )
    :vars
    (
      ?AUTO_4351 - BLOCK
      ?AUTO_4349 - BLOCK
      ?AUTO_4350 - BLOCK
      ?AUTO_4352 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4347 ?AUTO_4348 ) ) ( ON ?AUTO_4347 ?AUTO_4351 ) ( CLEAR ?AUTO_4347 ) ( not ( = ?AUTO_4347 ?AUTO_4351 ) ) ( not ( = ?AUTO_4348 ?AUTO_4351 ) ) ( CLEAR ?AUTO_4349 ) ( not ( = ?AUTO_4347 ?AUTO_4350 ) ) ( not ( = ?AUTO_4347 ?AUTO_4349 ) ) ( not ( = ?AUTO_4348 ?AUTO_4350 ) ) ( not ( = ?AUTO_4348 ?AUTO_4349 ) ) ( not ( = ?AUTO_4351 ?AUTO_4350 ) ) ( not ( = ?AUTO_4351 ?AUTO_4349 ) ) ( not ( = ?AUTO_4350 ?AUTO_4349 ) ) ( ON ?AUTO_4350 ?AUTO_4348 ) ( not ( = ?AUTO_4347 ?AUTO_4352 ) ) ( not ( = ?AUTO_4348 ?AUTO_4352 ) ) ( not ( = ?AUTO_4351 ?AUTO_4352 ) ) ( not ( = ?AUTO_4349 ?AUTO_4352 ) ) ( not ( = ?AUTO_4350 ?AUTO_4352 ) ) ( ON ?AUTO_4352 ?AUTO_4350 ) ( CLEAR ?AUTO_4352 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4352 ?AUTO_4350 )
      ( MAKE-ON ?AUTO_4347 ?AUTO_4348 )
      ( MAKE-ON-VERIFY ?AUTO_4347 ?AUTO_4348 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4353 - BLOCK
      ?AUTO_4354 - BLOCK
    )
    :vars
    (
      ?AUTO_4357 - BLOCK
      ?AUTO_4356 - BLOCK
      ?AUTO_4358 - BLOCK
      ?AUTO_4355 - BLOCK
      ?AUTO_4359 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4353 ?AUTO_4354 ) ) ( ON ?AUTO_4353 ?AUTO_4357 ) ( CLEAR ?AUTO_4353 ) ( not ( = ?AUTO_4353 ?AUTO_4357 ) ) ( not ( = ?AUTO_4354 ?AUTO_4357 ) ) ( CLEAR ?AUTO_4356 ) ( not ( = ?AUTO_4353 ?AUTO_4358 ) ) ( not ( = ?AUTO_4353 ?AUTO_4356 ) ) ( not ( = ?AUTO_4354 ?AUTO_4358 ) ) ( not ( = ?AUTO_4354 ?AUTO_4356 ) ) ( not ( = ?AUTO_4357 ?AUTO_4358 ) ) ( not ( = ?AUTO_4357 ?AUTO_4356 ) ) ( not ( = ?AUTO_4358 ?AUTO_4356 ) ) ( ON ?AUTO_4358 ?AUTO_4354 ) ( not ( = ?AUTO_4353 ?AUTO_4355 ) ) ( not ( = ?AUTO_4354 ?AUTO_4355 ) ) ( not ( = ?AUTO_4357 ?AUTO_4355 ) ) ( not ( = ?AUTO_4356 ?AUTO_4355 ) ) ( not ( = ?AUTO_4358 ?AUTO_4355 ) ) ( ON ?AUTO_4355 ?AUTO_4358 ) ( CLEAR ?AUTO_4355 ) ( HOLDING ?AUTO_4359 ) ( not ( = ?AUTO_4353 ?AUTO_4359 ) ) ( not ( = ?AUTO_4354 ?AUTO_4359 ) ) ( not ( = ?AUTO_4357 ?AUTO_4359 ) ) ( not ( = ?AUTO_4356 ?AUTO_4359 ) ) ( not ( = ?AUTO_4358 ?AUTO_4359 ) ) ( not ( = ?AUTO_4355 ?AUTO_4359 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4359 )
      ( MAKE-ON ?AUTO_4353 ?AUTO_4354 )
      ( MAKE-ON-VERIFY ?AUTO_4353 ?AUTO_4354 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4360 - BLOCK
      ?AUTO_4361 - BLOCK
    )
    :vars
    (
      ?AUTO_4366 - BLOCK
      ?AUTO_4363 - BLOCK
      ?AUTO_4362 - BLOCK
      ?AUTO_4364 - BLOCK
      ?AUTO_4365 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4360 ?AUTO_4361 ) ) ( ON ?AUTO_4360 ?AUTO_4366 ) ( CLEAR ?AUTO_4360 ) ( not ( = ?AUTO_4360 ?AUTO_4366 ) ) ( not ( = ?AUTO_4361 ?AUTO_4366 ) ) ( CLEAR ?AUTO_4363 ) ( not ( = ?AUTO_4360 ?AUTO_4362 ) ) ( not ( = ?AUTO_4360 ?AUTO_4363 ) ) ( not ( = ?AUTO_4361 ?AUTO_4362 ) ) ( not ( = ?AUTO_4361 ?AUTO_4363 ) ) ( not ( = ?AUTO_4366 ?AUTO_4362 ) ) ( not ( = ?AUTO_4366 ?AUTO_4363 ) ) ( not ( = ?AUTO_4362 ?AUTO_4363 ) ) ( ON ?AUTO_4362 ?AUTO_4361 ) ( not ( = ?AUTO_4360 ?AUTO_4364 ) ) ( not ( = ?AUTO_4361 ?AUTO_4364 ) ) ( not ( = ?AUTO_4366 ?AUTO_4364 ) ) ( not ( = ?AUTO_4363 ?AUTO_4364 ) ) ( not ( = ?AUTO_4362 ?AUTO_4364 ) ) ( ON ?AUTO_4364 ?AUTO_4362 ) ( not ( = ?AUTO_4360 ?AUTO_4365 ) ) ( not ( = ?AUTO_4361 ?AUTO_4365 ) ) ( not ( = ?AUTO_4366 ?AUTO_4365 ) ) ( not ( = ?AUTO_4363 ?AUTO_4365 ) ) ( not ( = ?AUTO_4362 ?AUTO_4365 ) ) ( not ( = ?AUTO_4364 ?AUTO_4365 ) ) ( ON ?AUTO_4365 ?AUTO_4364 ) ( CLEAR ?AUTO_4365 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4365 ?AUTO_4364 )
      ( MAKE-ON ?AUTO_4360 ?AUTO_4361 )
      ( MAKE-ON-VERIFY ?AUTO_4360 ?AUTO_4361 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4367 - BLOCK
      ?AUTO_4368 - BLOCK
    )
    :vars
    (
      ?AUTO_4372 - BLOCK
      ?AUTO_4370 - BLOCK
      ?AUTO_4369 - BLOCK
      ?AUTO_4371 - BLOCK
      ?AUTO_4373 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4367 ?AUTO_4368 ) ) ( not ( = ?AUTO_4367 ?AUTO_4372 ) ) ( not ( = ?AUTO_4368 ?AUTO_4372 ) ) ( CLEAR ?AUTO_4370 ) ( not ( = ?AUTO_4367 ?AUTO_4369 ) ) ( not ( = ?AUTO_4367 ?AUTO_4370 ) ) ( not ( = ?AUTO_4368 ?AUTO_4369 ) ) ( not ( = ?AUTO_4368 ?AUTO_4370 ) ) ( not ( = ?AUTO_4372 ?AUTO_4369 ) ) ( not ( = ?AUTO_4372 ?AUTO_4370 ) ) ( not ( = ?AUTO_4369 ?AUTO_4370 ) ) ( ON ?AUTO_4369 ?AUTO_4368 ) ( not ( = ?AUTO_4367 ?AUTO_4371 ) ) ( not ( = ?AUTO_4368 ?AUTO_4371 ) ) ( not ( = ?AUTO_4372 ?AUTO_4371 ) ) ( not ( = ?AUTO_4370 ?AUTO_4371 ) ) ( not ( = ?AUTO_4369 ?AUTO_4371 ) ) ( ON ?AUTO_4371 ?AUTO_4369 ) ( not ( = ?AUTO_4367 ?AUTO_4373 ) ) ( not ( = ?AUTO_4368 ?AUTO_4373 ) ) ( not ( = ?AUTO_4372 ?AUTO_4373 ) ) ( not ( = ?AUTO_4370 ?AUTO_4373 ) ) ( not ( = ?AUTO_4369 ?AUTO_4373 ) ) ( not ( = ?AUTO_4371 ?AUTO_4373 ) ) ( ON ?AUTO_4373 ?AUTO_4371 ) ( CLEAR ?AUTO_4373 ) ( HOLDING ?AUTO_4367 ) ( CLEAR ?AUTO_4372 ) )
    :subtasks
    ( ( !STACK ?AUTO_4367 ?AUTO_4372 )
      ( MAKE-ON ?AUTO_4367 ?AUTO_4368 )
      ( MAKE-ON-VERIFY ?AUTO_4367 ?AUTO_4368 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4374 - BLOCK
      ?AUTO_4375 - BLOCK
    )
    :vars
    (
      ?AUTO_4378 - BLOCK
      ?AUTO_4377 - BLOCK
      ?AUTO_4380 - BLOCK
      ?AUTO_4379 - BLOCK
      ?AUTO_4376 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4374 ?AUTO_4375 ) ) ( not ( = ?AUTO_4374 ?AUTO_4378 ) ) ( not ( = ?AUTO_4375 ?AUTO_4378 ) ) ( CLEAR ?AUTO_4377 ) ( not ( = ?AUTO_4374 ?AUTO_4380 ) ) ( not ( = ?AUTO_4374 ?AUTO_4377 ) ) ( not ( = ?AUTO_4375 ?AUTO_4380 ) ) ( not ( = ?AUTO_4375 ?AUTO_4377 ) ) ( not ( = ?AUTO_4378 ?AUTO_4380 ) ) ( not ( = ?AUTO_4378 ?AUTO_4377 ) ) ( not ( = ?AUTO_4380 ?AUTO_4377 ) ) ( ON ?AUTO_4380 ?AUTO_4375 ) ( not ( = ?AUTO_4374 ?AUTO_4379 ) ) ( not ( = ?AUTO_4375 ?AUTO_4379 ) ) ( not ( = ?AUTO_4378 ?AUTO_4379 ) ) ( not ( = ?AUTO_4377 ?AUTO_4379 ) ) ( not ( = ?AUTO_4380 ?AUTO_4379 ) ) ( ON ?AUTO_4379 ?AUTO_4380 ) ( not ( = ?AUTO_4374 ?AUTO_4376 ) ) ( not ( = ?AUTO_4375 ?AUTO_4376 ) ) ( not ( = ?AUTO_4378 ?AUTO_4376 ) ) ( not ( = ?AUTO_4377 ?AUTO_4376 ) ) ( not ( = ?AUTO_4380 ?AUTO_4376 ) ) ( not ( = ?AUTO_4379 ?AUTO_4376 ) ) ( ON ?AUTO_4376 ?AUTO_4379 ) ( CLEAR ?AUTO_4378 ) ( ON ?AUTO_4374 ?AUTO_4376 ) ( CLEAR ?AUTO_4374 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4374 ?AUTO_4376 )
      ( MAKE-ON ?AUTO_4374 ?AUTO_4375 )
      ( MAKE-ON-VERIFY ?AUTO_4374 ?AUTO_4375 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4381 - BLOCK
      ?AUTO_4382 - BLOCK
    )
    :vars
    (
      ?AUTO_4385 - BLOCK
      ?AUTO_4383 - BLOCK
      ?AUTO_4386 - BLOCK
      ?AUTO_4387 - BLOCK
      ?AUTO_4384 - BLOCK
      ?AUTO_4388 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4381 ?AUTO_4382 ) ) ( not ( = ?AUTO_4381 ?AUTO_4385 ) ) ( not ( = ?AUTO_4382 ?AUTO_4385 ) ) ( CLEAR ?AUTO_4383 ) ( not ( = ?AUTO_4381 ?AUTO_4386 ) ) ( not ( = ?AUTO_4381 ?AUTO_4383 ) ) ( not ( = ?AUTO_4382 ?AUTO_4386 ) ) ( not ( = ?AUTO_4382 ?AUTO_4383 ) ) ( not ( = ?AUTO_4385 ?AUTO_4386 ) ) ( not ( = ?AUTO_4385 ?AUTO_4383 ) ) ( not ( = ?AUTO_4386 ?AUTO_4383 ) ) ( ON ?AUTO_4386 ?AUTO_4382 ) ( not ( = ?AUTO_4381 ?AUTO_4387 ) ) ( not ( = ?AUTO_4382 ?AUTO_4387 ) ) ( not ( = ?AUTO_4385 ?AUTO_4387 ) ) ( not ( = ?AUTO_4383 ?AUTO_4387 ) ) ( not ( = ?AUTO_4386 ?AUTO_4387 ) ) ( ON ?AUTO_4387 ?AUTO_4386 ) ( not ( = ?AUTO_4381 ?AUTO_4384 ) ) ( not ( = ?AUTO_4382 ?AUTO_4384 ) ) ( not ( = ?AUTO_4385 ?AUTO_4384 ) ) ( not ( = ?AUTO_4383 ?AUTO_4384 ) ) ( not ( = ?AUTO_4386 ?AUTO_4384 ) ) ( not ( = ?AUTO_4387 ?AUTO_4384 ) ) ( ON ?AUTO_4384 ?AUTO_4387 ) ( ON ?AUTO_4381 ?AUTO_4384 ) ( CLEAR ?AUTO_4381 ) ( HOLDING ?AUTO_4385 ) ( CLEAR ?AUTO_4388 ) ( not ( = ?AUTO_4381 ?AUTO_4388 ) ) ( not ( = ?AUTO_4382 ?AUTO_4388 ) ) ( not ( = ?AUTO_4385 ?AUTO_4388 ) ) ( not ( = ?AUTO_4383 ?AUTO_4388 ) ) ( not ( = ?AUTO_4386 ?AUTO_4388 ) ) ( not ( = ?AUTO_4387 ?AUTO_4388 ) ) ( not ( = ?AUTO_4384 ?AUTO_4388 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4385 ?AUTO_4388 )
      ( MAKE-ON ?AUTO_4381 ?AUTO_4382 )
      ( MAKE-ON-VERIFY ?AUTO_4381 ?AUTO_4382 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4405 - BLOCK
      ?AUTO_4406 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4405 ) ( CLEAR ?AUTO_4406 ) ( not ( = ?AUTO_4405 ?AUTO_4406 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4405 ?AUTO_4406 )
      ( MAKE-ON-VERIFY ?AUTO_4405 ?AUTO_4406 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4407 - BLOCK
      ?AUTO_4408 - BLOCK
    )
    :vars
    (
      ?AUTO_4409 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4408 ) ( not ( = ?AUTO_4407 ?AUTO_4408 ) ) ( ON ?AUTO_4407 ?AUTO_4409 ) ( CLEAR ?AUTO_4407 ) ( HAND-EMPTY ) ( not ( = ?AUTO_4407 ?AUTO_4409 ) ) ( not ( = ?AUTO_4408 ?AUTO_4409 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4407 ?AUTO_4409 )
      ( MAKE-ON ?AUTO_4407 ?AUTO_4408 )
      ( MAKE-ON-VERIFY ?AUTO_4407 ?AUTO_4408 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4410 - BLOCK
      ?AUTO_4411 - BLOCK
    )
    :vars
    (
      ?AUTO_4412 - BLOCK
      ?AUTO_4413 - BLOCK
      ?AUTO_4414 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4411 ) ( not ( = ?AUTO_4410 ?AUTO_4411 ) ) ( ON ?AUTO_4410 ?AUTO_4412 ) ( CLEAR ?AUTO_4410 ) ( not ( = ?AUTO_4410 ?AUTO_4412 ) ) ( not ( = ?AUTO_4411 ?AUTO_4412 ) ) ( HOLDING ?AUTO_4413 ) ( CLEAR ?AUTO_4414 ) ( not ( = ?AUTO_4410 ?AUTO_4413 ) ) ( not ( = ?AUTO_4410 ?AUTO_4414 ) ) ( not ( = ?AUTO_4411 ?AUTO_4413 ) ) ( not ( = ?AUTO_4411 ?AUTO_4414 ) ) ( not ( = ?AUTO_4412 ?AUTO_4413 ) ) ( not ( = ?AUTO_4412 ?AUTO_4414 ) ) ( not ( = ?AUTO_4413 ?AUTO_4414 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4413 ?AUTO_4414 )
      ( MAKE-ON ?AUTO_4410 ?AUTO_4411 )
      ( MAKE-ON-VERIFY ?AUTO_4410 ?AUTO_4411 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4415 - BLOCK
      ?AUTO_4416 - BLOCK
    )
    :vars
    (
      ?AUTO_4417 - BLOCK
      ?AUTO_4418 - BLOCK
      ?AUTO_4419 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4416 ) ( not ( = ?AUTO_4415 ?AUTO_4416 ) ) ( ON ?AUTO_4415 ?AUTO_4417 ) ( not ( = ?AUTO_4415 ?AUTO_4417 ) ) ( not ( = ?AUTO_4416 ?AUTO_4417 ) ) ( CLEAR ?AUTO_4418 ) ( not ( = ?AUTO_4415 ?AUTO_4419 ) ) ( not ( = ?AUTO_4415 ?AUTO_4418 ) ) ( not ( = ?AUTO_4416 ?AUTO_4419 ) ) ( not ( = ?AUTO_4416 ?AUTO_4418 ) ) ( not ( = ?AUTO_4417 ?AUTO_4419 ) ) ( not ( = ?AUTO_4417 ?AUTO_4418 ) ) ( not ( = ?AUTO_4419 ?AUTO_4418 ) ) ( ON ?AUTO_4419 ?AUTO_4415 ) ( CLEAR ?AUTO_4419 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4419 ?AUTO_4415 )
      ( MAKE-ON ?AUTO_4415 ?AUTO_4416 )
      ( MAKE-ON-VERIFY ?AUTO_4415 ?AUTO_4416 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4420 - BLOCK
      ?AUTO_4421 - BLOCK
    )
    :vars
    (
      ?AUTO_4422 - BLOCK
      ?AUTO_4424 - BLOCK
      ?AUTO_4423 - BLOCK
      ?AUTO_4425 - BLOCK
      ?AUTO_4426 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4421 ) ( not ( = ?AUTO_4420 ?AUTO_4421 ) ) ( ON ?AUTO_4420 ?AUTO_4422 ) ( not ( = ?AUTO_4420 ?AUTO_4422 ) ) ( not ( = ?AUTO_4421 ?AUTO_4422 ) ) ( CLEAR ?AUTO_4424 ) ( not ( = ?AUTO_4420 ?AUTO_4423 ) ) ( not ( = ?AUTO_4420 ?AUTO_4424 ) ) ( not ( = ?AUTO_4421 ?AUTO_4423 ) ) ( not ( = ?AUTO_4421 ?AUTO_4424 ) ) ( not ( = ?AUTO_4422 ?AUTO_4423 ) ) ( not ( = ?AUTO_4422 ?AUTO_4424 ) ) ( not ( = ?AUTO_4423 ?AUTO_4424 ) ) ( ON ?AUTO_4423 ?AUTO_4420 ) ( CLEAR ?AUTO_4423 ) ( HOLDING ?AUTO_4425 ) ( CLEAR ?AUTO_4426 ) ( not ( = ?AUTO_4420 ?AUTO_4425 ) ) ( not ( = ?AUTO_4420 ?AUTO_4426 ) ) ( not ( = ?AUTO_4421 ?AUTO_4425 ) ) ( not ( = ?AUTO_4421 ?AUTO_4426 ) ) ( not ( = ?AUTO_4422 ?AUTO_4425 ) ) ( not ( = ?AUTO_4422 ?AUTO_4426 ) ) ( not ( = ?AUTO_4424 ?AUTO_4425 ) ) ( not ( = ?AUTO_4424 ?AUTO_4426 ) ) ( not ( = ?AUTO_4423 ?AUTO_4425 ) ) ( not ( = ?AUTO_4423 ?AUTO_4426 ) ) ( not ( = ?AUTO_4425 ?AUTO_4426 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4425 ?AUTO_4426 )
      ( MAKE-ON ?AUTO_4420 ?AUTO_4421 )
      ( MAKE-ON-VERIFY ?AUTO_4420 ?AUTO_4421 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4437 - BLOCK
      ?AUTO_4438 - BLOCK
    )
    :vars
    (
      ?AUTO_4440 - BLOCK
      ?AUTO_4441 - BLOCK
      ?AUTO_4439 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4437 ?AUTO_4438 ) ) ( ON ?AUTO_4437 ?AUTO_4440 ) ( not ( = ?AUTO_4437 ?AUTO_4440 ) ) ( not ( = ?AUTO_4438 ?AUTO_4440 ) ) ( CLEAR ?AUTO_4441 ) ( not ( = ?AUTO_4437 ?AUTO_4439 ) ) ( not ( = ?AUTO_4437 ?AUTO_4441 ) ) ( not ( = ?AUTO_4438 ?AUTO_4439 ) ) ( not ( = ?AUTO_4438 ?AUTO_4441 ) ) ( not ( = ?AUTO_4440 ?AUTO_4439 ) ) ( not ( = ?AUTO_4440 ?AUTO_4441 ) ) ( not ( = ?AUTO_4439 ?AUTO_4441 ) ) ( ON ?AUTO_4439 ?AUTO_4437 ) ( CLEAR ?AUTO_4439 ) ( HOLDING ?AUTO_4438 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4438 )
      ( MAKE-ON ?AUTO_4437 ?AUTO_4438 )
      ( MAKE-ON-VERIFY ?AUTO_4437 ?AUTO_4438 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4448 - BLOCK
      ?AUTO_4449 - BLOCK
    )
    :vars
    (
      ?AUTO_4450 - BLOCK
      ?AUTO_4452 - BLOCK
      ?AUTO_4451 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4448 ?AUTO_4449 ) ) ( not ( = ?AUTO_4448 ?AUTO_4450 ) ) ( not ( = ?AUTO_4449 ?AUTO_4450 ) ) ( CLEAR ?AUTO_4452 ) ( not ( = ?AUTO_4448 ?AUTO_4451 ) ) ( not ( = ?AUTO_4448 ?AUTO_4452 ) ) ( not ( = ?AUTO_4449 ?AUTO_4451 ) ) ( not ( = ?AUTO_4449 ?AUTO_4452 ) ) ( not ( = ?AUTO_4450 ?AUTO_4451 ) ) ( not ( = ?AUTO_4450 ?AUTO_4452 ) ) ( not ( = ?AUTO_4451 ?AUTO_4452 ) ) ( ON ?AUTO_4451 ?AUTO_4449 ) ( CLEAR ?AUTO_4451 ) ( HOLDING ?AUTO_4448 ) ( CLEAR ?AUTO_4450 ) )
    :subtasks
    ( ( !STACK ?AUTO_4448 ?AUTO_4450 )
      ( MAKE-ON ?AUTO_4448 ?AUTO_4449 )
      ( MAKE-ON-VERIFY ?AUTO_4448 ?AUTO_4449 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4453 - BLOCK
      ?AUTO_4454 - BLOCK
    )
    :vars
    (
      ?AUTO_4456 - BLOCK
      ?AUTO_4457 - BLOCK
      ?AUTO_4455 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4453 ?AUTO_4454 ) ) ( not ( = ?AUTO_4453 ?AUTO_4456 ) ) ( not ( = ?AUTO_4454 ?AUTO_4456 ) ) ( CLEAR ?AUTO_4457 ) ( not ( = ?AUTO_4453 ?AUTO_4455 ) ) ( not ( = ?AUTO_4453 ?AUTO_4457 ) ) ( not ( = ?AUTO_4454 ?AUTO_4455 ) ) ( not ( = ?AUTO_4454 ?AUTO_4457 ) ) ( not ( = ?AUTO_4456 ?AUTO_4455 ) ) ( not ( = ?AUTO_4456 ?AUTO_4457 ) ) ( not ( = ?AUTO_4455 ?AUTO_4457 ) ) ( ON ?AUTO_4455 ?AUTO_4454 ) ( CLEAR ?AUTO_4455 ) ( CLEAR ?AUTO_4456 ) ( ON-TABLE ?AUTO_4453 ) ( CLEAR ?AUTO_4453 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_4453 )
      ( MAKE-ON ?AUTO_4453 ?AUTO_4454 )
      ( MAKE-ON-VERIFY ?AUTO_4453 ?AUTO_4454 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4458 - BLOCK
      ?AUTO_4459 - BLOCK
    )
    :vars
    (
      ?AUTO_4461 - BLOCK
      ?AUTO_4462 - BLOCK
      ?AUTO_4460 - BLOCK
      ?AUTO_4463 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4458 ?AUTO_4459 ) ) ( not ( = ?AUTO_4458 ?AUTO_4461 ) ) ( not ( = ?AUTO_4459 ?AUTO_4461 ) ) ( CLEAR ?AUTO_4462 ) ( not ( = ?AUTO_4458 ?AUTO_4460 ) ) ( not ( = ?AUTO_4458 ?AUTO_4462 ) ) ( not ( = ?AUTO_4459 ?AUTO_4460 ) ) ( not ( = ?AUTO_4459 ?AUTO_4462 ) ) ( not ( = ?AUTO_4461 ?AUTO_4460 ) ) ( not ( = ?AUTO_4461 ?AUTO_4462 ) ) ( not ( = ?AUTO_4460 ?AUTO_4462 ) ) ( ON ?AUTO_4460 ?AUTO_4459 ) ( CLEAR ?AUTO_4460 ) ( ON-TABLE ?AUTO_4458 ) ( CLEAR ?AUTO_4458 ) ( HOLDING ?AUTO_4461 ) ( CLEAR ?AUTO_4463 ) ( not ( = ?AUTO_4458 ?AUTO_4463 ) ) ( not ( = ?AUTO_4459 ?AUTO_4463 ) ) ( not ( = ?AUTO_4461 ?AUTO_4463 ) ) ( not ( = ?AUTO_4462 ?AUTO_4463 ) ) ( not ( = ?AUTO_4460 ?AUTO_4463 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4461 ?AUTO_4463 )
      ( MAKE-ON ?AUTO_4458 ?AUTO_4459 )
      ( MAKE-ON-VERIFY ?AUTO_4458 ?AUTO_4459 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4464 - BLOCK
      ?AUTO_4465 - BLOCK
    )
    :vars
    (
      ?AUTO_4469 - BLOCK
      ?AUTO_4466 - BLOCK
      ?AUTO_4467 - BLOCK
      ?AUTO_4468 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4464 ?AUTO_4465 ) ) ( not ( = ?AUTO_4464 ?AUTO_4469 ) ) ( not ( = ?AUTO_4465 ?AUTO_4469 ) ) ( CLEAR ?AUTO_4466 ) ( not ( = ?AUTO_4464 ?AUTO_4467 ) ) ( not ( = ?AUTO_4464 ?AUTO_4466 ) ) ( not ( = ?AUTO_4465 ?AUTO_4467 ) ) ( not ( = ?AUTO_4465 ?AUTO_4466 ) ) ( not ( = ?AUTO_4469 ?AUTO_4467 ) ) ( not ( = ?AUTO_4469 ?AUTO_4466 ) ) ( not ( = ?AUTO_4467 ?AUTO_4466 ) ) ( ON ?AUTO_4467 ?AUTO_4465 ) ( CLEAR ?AUTO_4467 ) ( ON-TABLE ?AUTO_4464 ) ( CLEAR ?AUTO_4468 ) ( not ( = ?AUTO_4464 ?AUTO_4468 ) ) ( not ( = ?AUTO_4465 ?AUTO_4468 ) ) ( not ( = ?AUTO_4469 ?AUTO_4468 ) ) ( not ( = ?AUTO_4466 ?AUTO_4468 ) ) ( not ( = ?AUTO_4467 ?AUTO_4468 ) ) ( ON ?AUTO_4469 ?AUTO_4464 ) ( CLEAR ?AUTO_4469 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4469 ?AUTO_4464 )
      ( MAKE-ON ?AUTO_4464 ?AUTO_4465 )
      ( MAKE-ON-VERIFY ?AUTO_4464 ?AUTO_4465 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4470 - BLOCK
      ?AUTO_4471 - BLOCK
    )
    :vars
    (
      ?AUTO_4472 - BLOCK
      ?AUTO_4475 - BLOCK
      ?AUTO_4474 - BLOCK
      ?AUTO_4473 - BLOCK
      ?AUTO_4476 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4470 ?AUTO_4471 ) ) ( not ( = ?AUTO_4470 ?AUTO_4472 ) ) ( not ( = ?AUTO_4471 ?AUTO_4472 ) ) ( not ( = ?AUTO_4470 ?AUTO_4475 ) ) ( not ( = ?AUTO_4470 ?AUTO_4474 ) ) ( not ( = ?AUTO_4471 ?AUTO_4475 ) ) ( not ( = ?AUTO_4471 ?AUTO_4474 ) ) ( not ( = ?AUTO_4472 ?AUTO_4475 ) ) ( not ( = ?AUTO_4472 ?AUTO_4474 ) ) ( not ( = ?AUTO_4475 ?AUTO_4474 ) ) ( ON ?AUTO_4475 ?AUTO_4471 ) ( CLEAR ?AUTO_4475 ) ( ON-TABLE ?AUTO_4470 ) ( CLEAR ?AUTO_4473 ) ( not ( = ?AUTO_4470 ?AUTO_4473 ) ) ( not ( = ?AUTO_4471 ?AUTO_4473 ) ) ( not ( = ?AUTO_4472 ?AUTO_4473 ) ) ( not ( = ?AUTO_4474 ?AUTO_4473 ) ) ( not ( = ?AUTO_4475 ?AUTO_4473 ) ) ( ON ?AUTO_4472 ?AUTO_4470 ) ( CLEAR ?AUTO_4472 ) ( HOLDING ?AUTO_4474 ) ( CLEAR ?AUTO_4476 ) ( not ( = ?AUTO_4470 ?AUTO_4476 ) ) ( not ( = ?AUTO_4471 ?AUTO_4476 ) ) ( not ( = ?AUTO_4472 ?AUTO_4476 ) ) ( not ( = ?AUTO_4475 ?AUTO_4476 ) ) ( not ( = ?AUTO_4474 ?AUTO_4476 ) ) ( not ( = ?AUTO_4473 ?AUTO_4476 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4474 ?AUTO_4476 )
      ( MAKE-ON ?AUTO_4470 ?AUTO_4471 )
      ( MAKE-ON-VERIFY ?AUTO_4470 ?AUTO_4471 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4481 - BLOCK
      ?AUTO_4482 - BLOCK
    )
    :vars
    (
      ?AUTO_4485 - BLOCK
      ?AUTO_4487 - BLOCK
      ?AUTO_4484 - BLOCK
      ?AUTO_4486 - BLOCK
      ?AUTO_4483 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4481 ?AUTO_4482 ) ) ( not ( = ?AUTO_4481 ?AUTO_4485 ) ) ( not ( = ?AUTO_4482 ?AUTO_4485 ) ) ( not ( = ?AUTO_4481 ?AUTO_4487 ) ) ( not ( = ?AUTO_4481 ?AUTO_4484 ) ) ( not ( = ?AUTO_4482 ?AUTO_4487 ) ) ( not ( = ?AUTO_4482 ?AUTO_4484 ) ) ( not ( = ?AUTO_4485 ?AUTO_4487 ) ) ( not ( = ?AUTO_4485 ?AUTO_4484 ) ) ( not ( = ?AUTO_4487 ?AUTO_4484 ) ) ( ON ?AUTO_4487 ?AUTO_4482 ) ( CLEAR ?AUTO_4487 ) ( ON-TABLE ?AUTO_4481 ) ( CLEAR ?AUTO_4486 ) ( not ( = ?AUTO_4481 ?AUTO_4486 ) ) ( not ( = ?AUTO_4482 ?AUTO_4486 ) ) ( not ( = ?AUTO_4485 ?AUTO_4486 ) ) ( not ( = ?AUTO_4484 ?AUTO_4486 ) ) ( not ( = ?AUTO_4487 ?AUTO_4486 ) ) ( ON ?AUTO_4485 ?AUTO_4481 ) ( CLEAR ?AUTO_4483 ) ( not ( = ?AUTO_4481 ?AUTO_4483 ) ) ( not ( = ?AUTO_4482 ?AUTO_4483 ) ) ( not ( = ?AUTO_4485 ?AUTO_4483 ) ) ( not ( = ?AUTO_4487 ?AUTO_4483 ) ) ( not ( = ?AUTO_4484 ?AUTO_4483 ) ) ( not ( = ?AUTO_4486 ?AUTO_4483 ) ) ( ON ?AUTO_4484 ?AUTO_4485 ) ( CLEAR ?AUTO_4484 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4484 ?AUTO_4485 )
      ( MAKE-ON ?AUTO_4481 ?AUTO_4482 )
      ( MAKE-ON-VERIFY ?AUTO_4481 ?AUTO_4482 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4490 - BLOCK
      ?AUTO_4491 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4490 ) ( CLEAR ?AUTO_4491 ) ( not ( = ?AUTO_4490 ?AUTO_4491 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4490 ?AUTO_4491 )
      ( MAKE-ON-VERIFY ?AUTO_4490 ?AUTO_4491 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4492 - BLOCK
      ?AUTO_4493 - BLOCK
    )
    :vars
    (
      ?AUTO_4494 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4493 ) ( not ( = ?AUTO_4492 ?AUTO_4493 ) ) ( ON ?AUTO_4492 ?AUTO_4494 ) ( CLEAR ?AUTO_4492 ) ( HAND-EMPTY ) ( not ( = ?AUTO_4492 ?AUTO_4494 ) ) ( not ( = ?AUTO_4493 ?AUTO_4494 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4492 ?AUTO_4494 )
      ( MAKE-ON ?AUTO_4492 ?AUTO_4493 )
      ( MAKE-ON-VERIFY ?AUTO_4492 ?AUTO_4493 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4495 - BLOCK
      ?AUTO_4496 - BLOCK
    )
    :vars
    (
      ?AUTO_4497 - BLOCK
      ?AUTO_4498 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4495 ?AUTO_4496 ) ) ( ON ?AUTO_4495 ?AUTO_4497 ) ( CLEAR ?AUTO_4495 ) ( not ( = ?AUTO_4495 ?AUTO_4497 ) ) ( not ( = ?AUTO_4496 ?AUTO_4497 ) ) ( HOLDING ?AUTO_4496 ) ( CLEAR ?AUTO_4498 ) ( not ( = ?AUTO_4495 ?AUTO_4498 ) ) ( not ( = ?AUTO_4496 ?AUTO_4498 ) ) ( not ( = ?AUTO_4497 ?AUTO_4498 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4496 ?AUTO_4498 )
      ( MAKE-ON ?AUTO_4495 ?AUTO_4496 )
      ( MAKE-ON-VERIFY ?AUTO_4495 ?AUTO_4496 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4571 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4571 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4571 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4571 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4572 - BLOCK
    )
    :vars
    (
      ?AUTO_4573 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4572 ?AUTO_4573 ) ( CLEAR ?AUTO_4572 ) ( HAND-EMPTY ) ( not ( = ?AUTO_4572 ?AUTO_4573 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4572 ?AUTO_4573 )
      ( MAKE-ON-TABLE ?AUTO_4572 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4572 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4574 - BLOCK
    )
    :vars
    (
      ?AUTO_4575 - BLOCK
      ?AUTO_4576 - BLOCK
      ?AUTO_4577 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4574 ?AUTO_4575 ) ( CLEAR ?AUTO_4574 ) ( not ( = ?AUTO_4574 ?AUTO_4575 ) ) ( HOLDING ?AUTO_4576 ) ( CLEAR ?AUTO_4577 ) ( not ( = ?AUTO_4574 ?AUTO_4576 ) ) ( not ( = ?AUTO_4574 ?AUTO_4577 ) ) ( not ( = ?AUTO_4575 ?AUTO_4576 ) ) ( not ( = ?AUTO_4575 ?AUTO_4577 ) ) ( not ( = ?AUTO_4576 ?AUTO_4577 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4576 ?AUTO_4577 )
      ( MAKE-ON-TABLE ?AUTO_4574 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4574 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4580 - BLOCK
    )
    :vars
    (
      ?AUTO_4583 - BLOCK
      ?AUTO_4581 - BLOCK
      ?AUTO_4582 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4580 ?AUTO_4583 ) ( not ( = ?AUTO_4580 ?AUTO_4583 ) ) ( CLEAR ?AUTO_4581 ) ( not ( = ?AUTO_4580 ?AUTO_4582 ) ) ( not ( = ?AUTO_4580 ?AUTO_4581 ) ) ( not ( = ?AUTO_4583 ?AUTO_4582 ) ) ( not ( = ?AUTO_4583 ?AUTO_4581 ) ) ( not ( = ?AUTO_4582 ?AUTO_4581 ) ) ( ON ?AUTO_4582 ?AUTO_4580 ) ( CLEAR ?AUTO_4582 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4582 ?AUTO_4580 )
      ( MAKE-ON-TABLE ?AUTO_4580 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4580 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4584 - BLOCK
    )
    :vars
    (
      ?AUTO_4587 - BLOCK
      ?AUTO_4586 - BLOCK
      ?AUTO_4585 - BLOCK
      ?AUTO_4588 - BLOCK
      ?AUTO_4589 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4584 ?AUTO_4587 ) ( not ( = ?AUTO_4584 ?AUTO_4587 ) ) ( CLEAR ?AUTO_4586 ) ( not ( = ?AUTO_4584 ?AUTO_4585 ) ) ( not ( = ?AUTO_4584 ?AUTO_4586 ) ) ( not ( = ?AUTO_4587 ?AUTO_4585 ) ) ( not ( = ?AUTO_4587 ?AUTO_4586 ) ) ( not ( = ?AUTO_4585 ?AUTO_4586 ) ) ( ON ?AUTO_4585 ?AUTO_4584 ) ( CLEAR ?AUTO_4585 ) ( HOLDING ?AUTO_4588 ) ( CLEAR ?AUTO_4589 ) ( not ( = ?AUTO_4584 ?AUTO_4588 ) ) ( not ( = ?AUTO_4584 ?AUTO_4589 ) ) ( not ( = ?AUTO_4587 ?AUTO_4588 ) ) ( not ( = ?AUTO_4587 ?AUTO_4589 ) ) ( not ( = ?AUTO_4586 ?AUTO_4588 ) ) ( not ( = ?AUTO_4586 ?AUTO_4589 ) ) ( not ( = ?AUTO_4585 ?AUTO_4588 ) ) ( not ( = ?AUTO_4585 ?AUTO_4589 ) ) ( not ( = ?AUTO_4588 ?AUTO_4589 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4588 ?AUTO_4589 )
      ( MAKE-ON-TABLE ?AUTO_4584 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4584 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4590 - BLOCK
    )
    :vars
    (
      ?AUTO_4595 - BLOCK
      ?AUTO_4591 - BLOCK
      ?AUTO_4592 - BLOCK
      ?AUTO_4594 - BLOCK
      ?AUTO_4593 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4590 ?AUTO_4595 ) ( not ( = ?AUTO_4590 ?AUTO_4595 ) ) ( CLEAR ?AUTO_4591 ) ( not ( = ?AUTO_4590 ?AUTO_4592 ) ) ( not ( = ?AUTO_4590 ?AUTO_4591 ) ) ( not ( = ?AUTO_4595 ?AUTO_4592 ) ) ( not ( = ?AUTO_4595 ?AUTO_4591 ) ) ( not ( = ?AUTO_4592 ?AUTO_4591 ) ) ( ON ?AUTO_4592 ?AUTO_4590 ) ( CLEAR ?AUTO_4594 ) ( not ( = ?AUTO_4590 ?AUTO_4593 ) ) ( not ( = ?AUTO_4590 ?AUTO_4594 ) ) ( not ( = ?AUTO_4595 ?AUTO_4593 ) ) ( not ( = ?AUTO_4595 ?AUTO_4594 ) ) ( not ( = ?AUTO_4591 ?AUTO_4593 ) ) ( not ( = ?AUTO_4591 ?AUTO_4594 ) ) ( not ( = ?AUTO_4592 ?AUTO_4593 ) ) ( not ( = ?AUTO_4592 ?AUTO_4594 ) ) ( not ( = ?AUTO_4593 ?AUTO_4594 ) ) ( ON ?AUTO_4593 ?AUTO_4592 ) ( CLEAR ?AUTO_4593 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4593 ?AUTO_4592 )
      ( MAKE-ON-TABLE ?AUTO_4590 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4590 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4596 - BLOCK
    )
    :vars
    (
      ?AUTO_4601 - BLOCK
      ?AUTO_4597 - BLOCK
      ?AUTO_4598 - BLOCK
      ?AUTO_4600 - BLOCK
      ?AUTO_4599 - BLOCK
      ?AUTO_4602 - BLOCK
      ?AUTO_4603 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4596 ?AUTO_4601 ) ( not ( = ?AUTO_4596 ?AUTO_4601 ) ) ( CLEAR ?AUTO_4597 ) ( not ( = ?AUTO_4596 ?AUTO_4598 ) ) ( not ( = ?AUTO_4596 ?AUTO_4597 ) ) ( not ( = ?AUTO_4601 ?AUTO_4598 ) ) ( not ( = ?AUTO_4601 ?AUTO_4597 ) ) ( not ( = ?AUTO_4598 ?AUTO_4597 ) ) ( ON ?AUTO_4598 ?AUTO_4596 ) ( CLEAR ?AUTO_4600 ) ( not ( = ?AUTO_4596 ?AUTO_4599 ) ) ( not ( = ?AUTO_4596 ?AUTO_4600 ) ) ( not ( = ?AUTO_4601 ?AUTO_4599 ) ) ( not ( = ?AUTO_4601 ?AUTO_4600 ) ) ( not ( = ?AUTO_4597 ?AUTO_4599 ) ) ( not ( = ?AUTO_4597 ?AUTO_4600 ) ) ( not ( = ?AUTO_4598 ?AUTO_4599 ) ) ( not ( = ?AUTO_4598 ?AUTO_4600 ) ) ( not ( = ?AUTO_4599 ?AUTO_4600 ) ) ( ON ?AUTO_4599 ?AUTO_4598 ) ( CLEAR ?AUTO_4599 ) ( HOLDING ?AUTO_4602 ) ( CLEAR ?AUTO_4603 ) ( not ( = ?AUTO_4596 ?AUTO_4602 ) ) ( not ( = ?AUTO_4596 ?AUTO_4603 ) ) ( not ( = ?AUTO_4601 ?AUTO_4602 ) ) ( not ( = ?AUTO_4601 ?AUTO_4603 ) ) ( not ( = ?AUTO_4597 ?AUTO_4602 ) ) ( not ( = ?AUTO_4597 ?AUTO_4603 ) ) ( not ( = ?AUTO_4598 ?AUTO_4602 ) ) ( not ( = ?AUTO_4598 ?AUTO_4603 ) ) ( not ( = ?AUTO_4600 ?AUTO_4602 ) ) ( not ( = ?AUTO_4600 ?AUTO_4603 ) ) ( not ( = ?AUTO_4599 ?AUTO_4602 ) ) ( not ( = ?AUTO_4599 ?AUTO_4603 ) ) ( not ( = ?AUTO_4602 ?AUTO_4603 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4602 ?AUTO_4603 )
      ( MAKE-ON-TABLE ?AUTO_4596 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4596 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4609 - BLOCK
    )
    :vars
    (
      ?AUTO_4612 - BLOCK
      ?AUTO_4610 - BLOCK
      ?AUTO_4613 - BLOCK
      ?AUTO_4611 - BLOCK
      ?AUTO_4614 - BLOCK
      ?AUTO_4615 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4609 ?AUTO_4612 ) ( not ( = ?AUTO_4609 ?AUTO_4612 ) ) ( CLEAR ?AUTO_4610 ) ( not ( = ?AUTO_4609 ?AUTO_4613 ) ) ( not ( = ?AUTO_4609 ?AUTO_4610 ) ) ( not ( = ?AUTO_4612 ?AUTO_4613 ) ) ( not ( = ?AUTO_4612 ?AUTO_4610 ) ) ( not ( = ?AUTO_4613 ?AUTO_4610 ) ) ( ON ?AUTO_4613 ?AUTO_4609 ) ( CLEAR ?AUTO_4611 ) ( not ( = ?AUTO_4609 ?AUTO_4614 ) ) ( not ( = ?AUTO_4609 ?AUTO_4611 ) ) ( not ( = ?AUTO_4612 ?AUTO_4614 ) ) ( not ( = ?AUTO_4612 ?AUTO_4611 ) ) ( not ( = ?AUTO_4610 ?AUTO_4614 ) ) ( not ( = ?AUTO_4610 ?AUTO_4611 ) ) ( not ( = ?AUTO_4613 ?AUTO_4614 ) ) ( not ( = ?AUTO_4613 ?AUTO_4611 ) ) ( not ( = ?AUTO_4614 ?AUTO_4611 ) ) ( ON ?AUTO_4614 ?AUTO_4613 ) ( CLEAR ?AUTO_4614 ) ( HOLDING ?AUTO_4615 ) ( not ( = ?AUTO_4609 ?AUTO_4615 ) ) ( not ( = ?AUTO_4612 ?AUTO_4615 ) ) ( not ( = ?AUTO_4610 ?AUTO_4615 ) ) ( not ( = ?AUTO_4613 ?AUTO_4615 ) ) ( not ( = ?AUTO_4611 ?AUTO_4615 ) ) ( not ( = ?AUTO_4614 ?AUTO_4615 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4615 )
      ( MAKE-ON-TABLE ?AUTO_4609 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4609 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4629 - BLOCK
      ?AUTO_4630 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4629 ) ( CLEAR ?AUTO_4630 ) ( not ( = ?AUTO_4629 ?AUTO_4630 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4629 ?AUTO_4630 )
      ( MAKE-ON-VERIFY ?AUTO_4629 ?AUTO_4630 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4631 - BLOCK
      ?AUTO_4632 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4632 ) ( not ( = ?AUTO_4631 ?AUTO_4632 ) ) ( ON-TABLE ?AUTO_4631 ) ( CLEAR ?AUTO_4631 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_4631 )
      ( MAKE-ON ?AUTO_4631 ?AUTO_4632 )
      ( MAKE-ON-VERIFY ?AUTO_4631 ?AUTO_4632 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4633 - BLOCK
      ?AUTO_4634 - BLOCK
    )
    :vars
    (
      ?AUTO_4635 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4634 ) ( not ( = ?AUTO_4633 ?AUTO_4634 ) ) ( ON-TABLE ?AUTO_4633 ) ( CLEAR ?AUTO_4633 ) ( HOLDING ?AUTO_4635 ) ( not ( = ?AUTO_4633 ?AUTO_4635 ) ) ( not ( = ?AUTO_4634 ?AUTO_4635 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4635 )
      ( MAKE-ON ?AUTO_4633 ?AUTO_4634 )
      ( MAKE-ON-VERIFY ?AUTO_4633 ?AUTO_4634 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4636 - BLOCK
      ?AUTO_4637 - BLOCK
    )
    :vars
    (
      ?AUTO_4638 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4637 ) ( not ( = ?AUTO_4636 ?AUTO_4637 ) ) ( ON-TABLE ?AUTO_4636 ) ( not ( = ?AUTO_4636 ?AUTO_4638 ) ) ( not ( = ?AUTO_4637 ?AUTO_4638 ) ) ( ON ?AUTO_4638 ?AUTO_4636 ) ( CLEAR ?AUTO_4638 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4638 ?AUTO_4636 )
      ( MAKE-ON ?AUTO_4636 ?AUTO_4637 )
      ( MAKE-ON-VERIFY ?AUTO_4636 ?AUTO_4637 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4639 - BLOCK
      ?AUTO_4640 - BLOCK
    )
    :vars
    (
      ?AUTO_4641 - BLOCK
      ?AUTO_4642 - BLOCK
      ?AUTO_4643 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4640 ) ( not ( = ?AUTO_4639 ?AUTO_4640 ) ) ( ON-TABLE ?AUTO_4639 ) ( not ( = ?AUTO_4639 ?AUTO_4641 ) ) ( not ( = ?AUTO_4640 ?AUTO_4641 ) ) ( ON ?AUTO_4641 ?AUTO_4639 ) ( CLEAR ?AUTO_4641 ) ( HOLDING ?AUTO_4642 ) ( CLEAR ?AUTO_4643 ) ( not ( = ?AUTO_4639 ?AUTO_4642 ) ) ( not ( = ?AUTO_4639 ?AUTO_4643 ) ) ( not ( = ?AUTO_4640 ?AUTO_4642 ) ) ( not ( = ?AUTO_4640 ?AUTO_4643 ) ) ( not ( = ?AUTO_4641 ?AUTO_4642 ) ) ( not ( = ?AUTO_4641 ?AUTO_4643 ) ) ( not ( = ?AUTO_4642 ?AUTO_4643 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4642 ?AUTO_4643 )
      ( MAKE-ON ?AUTO_4639 ?AUTO_4640 )
      ( MAKE-ON-VERIFY ?AUTO_4639 ?AUTO_4640 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4644 - BLOCK
      ?AUTO_4645 - BLOCK
    )
    :vars
    (
      ?AUTO_4646 - BLOCK
      ?AUTO_4648 - BLOCK
      ?AUTO_4647 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4644 ?AUTO_4645 ) ) ( ON-TABLE ?AUTO_4644 ) ( not ( = ?AUTO_4644 ?AUTO_4646 ) ) ( not ( = ?AUTO_4645 ?AUTO_4646 ) ) ( ON ?AUTO_4646 ?AUTO_4644 ) ( CLEAR ?AUTO_4646 ) ( CLEAR ?AUTO_4648 ) ( not ( = ?AUTO_4644 ?AUTO_4647 ) ) ( not ( = ?AUTO_4644 ?AUTO_4648 ) ) ( not ( = ?AUTO_4645 ?AUTO_4647 ) ) ( not ( = ?AUTO_4645 ?AUTO_4648 ) ) ( not ( = ?AUTO_4646 ?AUTO_4647 ) ) ( not ( = ?AUTO_4646 ?AUTO_4648 ) ) ( not ( = ?AUTO_4647 ?AUTO_4648 ) ) ( ON ?AUTO_4647 ?AUTO_4645 ) ( CLEAR ?AUTO_4647 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4647 ?AUTO_4645 )
      ( MAKE-ON ?AUTO_4644 ?AUTO_4645 )
      ( MAKE-ON-VERIFY ?AUTO_4644 ?AUTO_4645 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4649 - BLOCK
      ?AUTO_4650 - BLOCK
    )
    :vars
    (
      ?AUTO_4652 - BLOCK
      ?AUTO_4653 - BLOCK
      ?AUTO_4651 - BLOCK
      ?AUTO_4654 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4649 ?AUTO_4650 ) ) ( ON-TABLE ?AUTO_4649 ) ( not ( = ?AUTO_4649 ?AUTO_4652 ) ) ( not ( = ?AUTO_4650 ?AUTO_4652 ) ) ( ON ?AUTO_4652 ?AUTO_4649 ) ( CLEAR ?AUTO_4652 ) ( not ( = ?AUTO_4649 ?AUTO_4653 ) ) ( not ( = ?AUTO_4649 ?AUTO_4651 ) ) ( not ( = ?AUTO_4650 ?AUTO_4653 ) ) ( not ( = ?AUTO_4650 ?AUTO_4651 ) ) ( not ( = ?AUTO_4652 ?AUTO_4653 ) ) ( not ( = ?AUTO_4652 ?AUTO_4651 ) ) ( not ( = ?AUTO_4653 ?AUTO_4651 ) ) ( ON ?AUTO_4653 ?AUTO_4650 ) ( CLEAR ?AUTO_4653 ) ( HOLDING ?AUTO_4651 ) ( CLEAR ?AUTO_4654 ) ( not ( = ?AUTO_4649 ?AUTO_4654 ) ) ( not ( = ?AUTO_4650 ?AUTO_4654 ) ) ( not ( = ?AUTO_4652 ?AUTO_4654 ) ) ( not ( = ?AUTO_4653 ?AUTO_4654 ) ) ( not ( = ?AUTO_4651 ?AUTO_4654 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4651 ?AUTO_4654 )
      ( MAKE-ON ?AUTO_4649 ?AUTO_4650 )
      ( MAKE-ON-VERIFY ?AUTO_4649 ?AUTO_4650 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4655 - BLOCK
      ?AUTO_4656 - BLOCK
    )
    :vars
    (
      ?AUTO_4657 - BLOCK
      ?AUTO_4660 - BLOCK
      ?AUTO_4658 - BLOCK
      ?AUTO_4659 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4655 ?AUTO_4656 ) ) ( ON-TABLE ?AUTO_4655 ) ( not ( = ?AUTO_4655 ?AUTO_4657 ) ) ( not ( = ?AUTO_4656 ?AUTO_4657 ) ) ( ON ?AUTO_4657 ?AUTO_4655 ) ( not ( = ?AUTO_4655 ?AUTO_4660 ) ) ( not ( = ?AUTO_4655 ?AUTO_4658 ) ) ( not ( = ?AUTO_4656 ?AUTO_4660 ) ) ( not ( = ?AUTO_4656 ?AUTO_4658 ) ) ( not ( = ?AUTO_4657 ?AUTO_4660 ) ) ( not ( = ?AUTO_4657 ?AUTO_4658 ) ) ( not ( = ?AUTO_4660 ?AUTO_4658 ) ) ( ON ?AUTO_4660 ?AUTO_4656 ) ( CLEAR ?AUTO_4660 ) ( CLEAR ?AUTO_4659 ) ( not ( = ?AUTO_4655 ?AUTO_4659 ) ) ( not ( = ?AUTO_4656 ?AUTO_4659 ) ) ( not ( = ?AUTO_4657 ?AUTO_4659 ) ) ( not ( = ?AUTO_4660 ?AUTO_4659 ) ) ( not ( = ?AUTO_4658 ?AUTO_4659 ) ) ( ON ?AUTO_4658 ?AUTO_4657 ) ( CLEAR ?AUTO_4658 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4658 ?AUTO_4657 )
      ( MAKE-ON ?AUTO_4655 ?AUTO_4656 )
      ( MAKE-ON-VERIFY ?AUTO_4655 ?AUTO_4656 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4661 - BLOCK
      ?AUTO_4662 - BLOCK
    )
    :vars
    (
      ?AUTO_4663 - BLOCK
      ?AUTO_4665 - BLOCK
      ?AUTO_4666 - BLOCK
      ?AUTO_4664 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4661 ?AUTO_4662 ) ) ( ON-TABLE ?AUTO_4661 ) ( not ( = ?AUTO_4661 ?AUTO_4663 ) ) ( not ( = ?AUTO_4662 ?AUTO_4663 ) ) ( ON ?AUTO_4663 ?AUTO_4661 ) ( not ( = ?AUTO_4661 ?AUTO_4665 ) ) ( not ( = ?AUTO_4661 ?AUTO_4666 ) ) ( not ( = ?AUTO_4662 ?AUTO_4665 ) ) ( not ( = ?AUTO_4662 ?AUTO_4666 ) ) ( not ( = ?AUTO_4663 ?AUTO_4665 ) ) ( not ( = ?AUTO_4663 ?AUTO_4666 ) ) ( not ( = ?AUTO_4665 ?AUTO_4666 ) ) ( CLEAR ?AUTO_4664 ) ( not ( = ?AUTO_4661 ?AUTO_4664 ) ) ( not ( = ?AUTO_4662 ?AUTO_4664 ) ) ( not ( = ?AUTO_4663 ?AUTO_4664 ) ) ( not ( = ?AUTO_4665 ?AUTO_4664 ) ) ( not ( = ?AUTO_4666 ?AUTO_4664 ) ) ( ON ?AUTO_4666 ?AUTO_4663 ) ( CLEAR ?AUTO_4666 ) ( HOLDING ?AUTO_4665 ) ( CLEAR ?AUTO_4662 ) )
    :subtasks
    ( ( !STACK ?AUTO_4665 ?AUTO_4662 )
      ( MAKE-ON ?AUTO_4661 ?AUTO_4662 )
      ( MAKE-ON-VERIFY ?AUTO_4661 ?AUTO_4662 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4667 - BLOCK
      ?AUTO_4668 - BLOCK
    )
    :vars
    (
      ?AUTO_4670 - BLOCK
      ?AUTO_4672 - BLOCK
      ?AUTO_4671 - BLOCK
      ?AUTO_4669 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4667 ?AUTO_4668 ) ) ( ON-TABLE ?AUTO_4667 ) ( not ( = ?AUTO_4667 ?AUTO_4670 ) ) ( not ( = ?AUTO_4668 ?AUTO_4670 ) ) ( ON ?AUTO_4670 ?AUTO_4667 ) ( not ( = ?AUTO_4667 ?AUTO_4672 ) ) ( not ( = ?AUTO_4667 ?AUTO_4671 ) ) ( not ( = ?AUTO_4668 ?AUTO_4672 ) ) ( not ( = ?AUTO_4668 ?AUTO_4671 ) ) ( not ( = ?AUTO_4670 ?AUTO_4672 ) ) ( not ( = ?AUTO_4670 ?AUTO_4671 ) ) ( not ( = ?AUTO_4672 ?AUTO_4671 ) ) ( CLEAR ?AUTO_4669 ) ( not ( = ?AUTO_4667 ?AUTO_4669 ) ) ( not ( = ?AUTO_4668 ?AUTO_4669 ) ) ( not ( = ?AUTO_4670 ?AUTO_4669 ) ) ( not ( = ?AUTO_4672 ?AUTO_4669 ) ) ( not ( = ?AUTO_4671 ?AUTO_4669 ) ) ( ON ?AUTO_4671 ?AUTO_4670 ) ( CLEAR ?AUTO_4668 ) ( ON ?AUTO_4672 ?AUTO_4671 ) ( CLEAR ?AUTO_4672 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4672 ?AUTO_4671 )
      ( MAKE-ON ?AUTO_4667 ?AUTO_4668 )
      ( MAKE-ON-VERIFY ?AUTO_4667 ?AUTO_4668 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4673 - BLOCK
      ?AUTO_4674 - BLOCK
    )
    :vars
    (
      ?AUTO_4678 - BLOCK
      ?AUTO_4676 - BLOCK
      ?AUTO_4677 - BLOCK
      ?AUTO_4675 - BLOCK
      ?AUTO_4679 - BLOCK
      ?AUTO_4680 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4673 ?AUTO_4674 ) ) ( ON-TABLE ?AUTO_4673 ) ( not ( = ?AUTO_4673 ?AUTO_4678 ) ) ( not ( = ?AUTO_4674 ?AUTO_4678 ) ) ( ON ?AUTO_4678 ?AUTO_4673 ) ( not ( = ?AUTO_4673 ?AUTO_4676 ) ) ( not ( = ?AUTO_4673 ?AUTO_4677 ) ) ( not ( = ?AUTO_4674 ?AUTO_4676 ) ) ( not ( = ?AUTO_4674 ?AUTO_4677 ) ) ( not ( = ?AUTO_4678 ?AUTO_4676 ) ) ( not ( = ?AUTO_4678 ?AUTO_4677 ) ) ( not ( = ?AUTO_4676 ?AUTO_4677 ) ) ( CLEAR ?AUTO_4675 ) ( not ( = ?AUTO_4673 ?AUTO_4675 ) ) ( not ( = ?AUTO_4674 ?AUTO_4675 ) ) ( not ( = ?AUTO_4678 ?AUTO_4675 ) ) ( not ( = ?AUTO_4676 ?AUTO_4675 ) ) ( not ( = ?AUTO_4677 ?AUTO_4675 ) ) ( ON ?AUTO_4677 ?AUTO_4678 ) ( CLEAR ?AUTO_4674 ) ( ON ?AUTO_4676 ?AUTO_4677 ) ( CLEAR ?AUTO_4676 ) ( HOLDING ?AUTO_4679 ) ( CLEAR ?AUTO_4680 ) ( not ( = ?AUTO_4673 ?AUTO_4679 ) ) ( not ( = ?AUTO_4673 ?AUTO_4680 ) ) ( not ( = ?AUTO_4674 ?AUTO_4679 ) ) ( not ( = ?AUTO_4674 ?AUTO_4680 ) ) ( not ( = ?AUTO_4678 ?AUTO_4679 ) ) ( not ( = ?AUTO_4678 ?AUTO_4680 ) ) ( not ( = ?AUTO_4676 ?AUTO_4679 ) ) ( not ( = ?AUTO_4676 ?AUTO_4680 ) ) ( not ( = ?AUTO_4677 ?AUTO_4679 ) ) ( not ( = ?AUTO_4677 ?AUTO_4680 ) ) ( not ( = ?AUTO_4675 ?AUTO_4679 ) ) ( not ( = ?AUTO_4675 ?AUTO_4680 ) ) ( not ( = ?AUTO_4679 ?AUTO_4680 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4679 ?AUTO_4680 )
      ( MAKE-ON ?AUTO_4673 ?AUTO_4674 )
      ( MAKE-ON-VERIFY ?AUTO_4673 ?AUTO_4674 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4685 - BLOCK
      ?AUTO_4686 - BLOCK
    )
    :vars
    (
      ?AUTO_4692 - BLOCK
      ?AUTO_4691 - BLOCK
      ?AUTO_4690 - BLOCK
      ?AUTO_4688 - BLOCK
      ?AUTO_4687 - BLOCK
      ?AUTO_4689 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4685 ?AUTO_4686 ) ) ( ON-TABLE ?AUTO_4685 ) ( not ( = ?AUTO_4685 ?AUTO_4692 ) ) ( not ( = ?AUTO_4686 ?AUTO_4692 ) ) ( ON ?AUTO_4692 ?AUTO_4685 ) ( not ( = ?AUTO_4685 ?AUTO_4691 ) ) ( not ( = ?AUTO_4685 ?AUTO_4690 ) ) ( not ( = ?AUTO_4686 ?AUTO_4691 ) ) ( not ( = ?AUTO_4686 ?AUTO_4690 ) ) ( not ( = ?AUTO_4692 ?AUTO_4691 ) ) ( not ( = ?AUTO_4692 ?AUTO_4690 ) ) ( not ( = ?AUTO_4691 ?AUTO_4690 ) ) ( CLEAR ?AUTO_4688 ) ( not ( = ?AUTO_4685 ?AUTO_4688 ) ) ( not ( = ?AUTO_4686 ?AUTO_4688 ) ) ( not ( = ?AUTO_4692 ?AUTO_4688 ) ) ( not ( = ?AUTO_4691 ?AUTO_4688 ) ) ( not ( = ?AUTO_4690 ?AUTO_4688 ) ) ( ON ?AUTO_4690 ?AUTO_4692 ) ( ON ?AUTO_4691 ?AUTO_4690 ) ( CLEAR ?AUTO_4691 ) ( CLEAR ?AUTO_4687 ) ( not ( = ?AUTO_4685 ?AUTO_4689 ) ) ( not ( = ?AUTO_4685 ?AUTO_4687 ) ) ( not ( = ?AUTO_4686 ?AUTO_4689 ) ) ( not ( = ?AUTO_4686 ?AUTO_4687 ) ) ( not ( = ?AUTO_4692 ?AUTO_4689 ) ) ( not ( = ?AUTO_4692 ?AUTO_4687 ) ) ( not ( = ?AUTO_4691 ?AUTO_4689 ) ) ( not ( = ?AUTO_4691 ?AUTO_4687 ) ) ( not ( = ?AUTO_4690 ?AUTO_4689 ) ) ( not ( = ?AUTO_4690 ?AUTO_4687 ) ) ( not ( = ?AUTO_4688 ?AUTO_4689 ) ) ( not ( = ?AUTO_4688 ?AUTO_4687 ) ) ( not ( = ?AUTO_4689 ?AUTO_4687 ) ) ( ON ?AUTO_4689 ?AUTO_4686 ) ( CLEAR ?AUTO_4689 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4689 ?AUTO_4686 )
      ( MAKE-ON ?AUTO_4685 ?AUTO_4686 )
      ( MAKE-ON-VERIFY ?AUTO_4685 ?AUTO_4686 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4693 - BLOCK
      ?AUTO_4694 - BLOCK
    )
    :vars
    (
      ?AUTO_4697 - BLOCK
      ?AUTO_4695 - BLOCK
      ?AUTO_4696 - BLOCK
      ?AUTO_4698 - BLOCK
      ?AUTO_4699 - BLOCK
      ?AUTO_4700 - BLOCK
      ?AUTO_4701 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4693 ?AUTO_4694 ) ) ( ON-TABLE ?AUTO_4693 ) ( not ( = ?AUTO_4693 ?AUTO_4697 ) ) ( not ( = ?AUTO_4694 ?AUTO_4697 ) ) ( ON ?AUTO_4697 ?AUTO_4693 ) ( not ( = ?AUTO_4693 ?AUTO_4695 ) ) ( not ( = ?AUTO_4693 ?AUTO_4696 ) ) ( not ( = ?AUTO_4694 ?AUTO_4695 ) ) ( not ( = ?AUTO_4694 ?AUTO_4696 ) ) ( not ( = ?AUTO_4697 ?AUTO_4695 ) ) ( not ( = ?AUTO_4697 ?AUTO_4696 ) ) ( not ( = ?AUTO_4695 ?AUTO_4696 ) ) ( CLEAR ?AUTO_4698 ) ( not ( = ?AUTO_4693 ?AUTO_4698 ) ) ( not ( = ?AUTO_4694 ?AUTO_4698 ) ) ( not ( = ?AUTO_4697 ?AUTO_4698 ) ) ( not ( = ?AUTO_4695 ?AUTO_4698 ) ) ( not ( = ?AUTO_4696 ?AUTO_4698 ) ) ( ON ?AUTO_4696 ?AUTO_4697 ) ( ON ?AUTO_4695 ?AUTO_4696 ) ( CLEAR ?AUTO_4695 ) ( CLEAR ?AUTO_4699 ) ( not ( = ?AUTO_4693 ?AUTO_4700 ) ) ( not ( = ?AUTO_4693 ?AUTO_4699 ) ) ( not ( = ?AUTO_4694 ?AUTO_4700 ) ) ( not ( = ?AUTO_4694 ?AUTO_4699 ) ) ( not ( = ?AUTO_4697 ?AUTO_4700 ) ) ( not ( = ?AUTO_4697 ?AUTO_4699 ) ) ( not ( = ?AUTO_4695 ?AUTO_4700 ) ) ( not ( = ?AUTO_4695 ?AUTO_4699 ) ) ( not ( = ?AUTO_4696 ?AUTO_4700 ) ) ( not ( = ?AUTO_4696 ?AUTO_4699 ) ) ( not ( = ?AUTO_4698 ?AUTO_4700 ) ) ( not ( = ?AUTO_4698 ?AUTO_4699 ) ) ( not ( = ?AUTO_4700 ?AUTO_4699 ) ) ( ON ?AUTO_4700 ?AUTO_4694 ) ( CLEAR ?AUTO_4700 ) ( HOLDING ?AUTO_4701 ) ( not ( = ?AUTO_4693 ?AUTO_4701 ) ) ( not ( = ?AUTO_4694 ?AUTO_4701 ) ) ( not ( = ?AUTO_4697 ?AUTO_4701 ) ) ( not ( = ?AUTO_4695 ?AUTO_4701 ) ) ( not ( = ?AUTO_4696 ?AUTO_4701 ) ) ( not ( = ?AUTO_4698 ?AUTO_4701 ) ) ( not ( = ?AUTO_4699 ?AUTO_4701 ) ) ( not ( = ?AUTO_4700 ?AUTO_4701 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4701 )
      ( MAKE-ON ?AUTO_4693 ?AUTO_4694 )
      ( MAKE-ON-VERIFY ?AUTO_4693 ?AUTO_4694 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4702 - BLOCK
      ?AUTO_4703 - BLOCK
    )
    :vars
    (
      ?AUTO_4705 - BLOCK
      ?AUTO_4706 - BLOCK
      ?AUTO_4709 - BLOCK
      ?AUTO_4704 - BLOCK
      ?AUTO_4710 - BLOCK
      ?AUTO_4707 - BLOCK
      ?AUTO_4708 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4702 ?AUTO_4703 ) ) ( ON-TABLE ?AUTO_4702 ) ( not ( = ?AUTO_4702 ?AUTO_4705 ) ) ( not ( = ?AUTO_4703 ?AUTO_4705 ) ) ( ON ?AUTO_4705 ?AUTO_4702 ) ( not ( = ?AUTO_4702 ?AUTO_4706 ) ) ( not ( = ?AUTO_4702 ?AUTO_4709 ) ) ( not ( = ?AUTO_4703 ?AUTO_4706 ) ) ( not ( = ?AUTO_4703 ?AUTO_4709 ) ) ( not ( = ?AUTO_4705 ?AUTO_4706 ) ) ( not ( = ?AUTO_4705 ?AUTO_4709 ) ) ( not ( = ?AUTO_4706 ?AUTO_4709 ) ) ( CLEAR ?AUTO_4704 ) ( not ( = ?AUTO_4702 ?AUTO_4704 ) ) ( not ( = ?AUTO_4703 ?AUTO_4704 ) ) ( not ( = ?AUTO_4705 ?AUTO_4704 ) ) ( not ( = ?AUTO_4706 ?AUTO_4704 ) ) ( not ( = ?AUTO_4709 ?AUTO_4704 ) ) ( ON ?AUTO_4709 ?AUTO_4705 ) ( ON ?AUTO_4706 ?AUTO_4709 ) ( CLEAR ?AUTO_4706 ) ( CLEAR ?AUTO_4710 ) ( not ( = ?AUTO_4702 ?AUTO_4707 ) ) ( not ( = ?AUTO_4702 ?AUTO_4710 ) ) ( not ( = ?AUTO_4703 ?AUTO_4707 ) ) ( not ( = ?AUTO_4703 ?AUTO_4710 ) ) ( not ( = ?AUTO_4705 ?AUTO_4707 ) ) ( not ( = ?AUTO_4705 ?AUTO_4710 ) ) ( not ( = ?AUTO_4706 ?AUTO_4707 ) ) ( not ( = ?AUTO_4706 ?AUTO_4710 ) ) ( not ( = ?AUTO_4709 ?AUTO_4707 ) ) ( not ( = ?AUTO_4709 ?AUTO_4710 ) ) ( not ( = ?AUTO_4704 ?AUTO_4707 ) ) ( not ( = ?AUTO_4704 ?AUTO_4710 ) ) ( not ( = ?AUTO_4707 ?AUTO_4710 ) ) ( ON ?AUTO_4707 ?AUTO_4703 ) ( not ( = ?AUTO_4702 ?AUTO_4708 ) ) ( not ( = ?AUTO_4703 ?AUTO_4708 ) ) ( not ( = ?AUTO_4705 ?AUTO_4708 ) ) ( not ( = ?AUTO_4706 ?AUTO_4708 ) ) ( not ( = ?AUTO_4709 ?AUTO_4708 ) ) ( not ( = ?AUTO_4704 ?AUTO_4708 ) ) ( not ( = ?AUTO_4710 ?AUTO_4708 ) ) ( not ( = ?AUTO_4707 ?AUTO_4708 ) ) ( ON ?AUTO_4708 ?AUTO_4707 ) ( CLEAR ?AUTO_4708 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4708 ?AUTO_4707 )
      ( MAKE-ON ?AUTO_4702 ?AUTO_4703 )
      ( MAKE-ON-VERIFY ?AUTO_4702 ?AUTO_4703 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4711 - BLOCK
      ?AUTO_4712 - BLOCK
    )
    :vars
    (
      ?AUTO_4716 - BLOCK
      ?AUTO_4719 - BLOCK
      ?AUTO_4715 - BLOCK
      ?AUTO_4713 - BLOCK
      ?AUTO_4714 - BLOCK
      ?AUTO_4718 - BLOCK
      ?AUTO_4717 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4711 ?AUTO_4712 ) ) ( ON-TABLE ?AUTO_4711 ) ( not ( = ?AUTO_4711 ?AUTO_4716 ) ) ( not ( = ?AUTO_4712 ?AUTO_4716 ) ) ( ON ?AUTO_4716 ?AUTO_4711 ) ( not ( = ?AUTO_4711 ?AUTO_4719 ) ) ( not ( = ?AUTO_4711 ?AUTO_4715 ) ) ( not ( = ?AUTO_4712 ?AUTO_4719 ) ) ( not ( = ?AUTO_4712 ?AUTO_4715 ) ) ( not ( = ?AUTO_4716 ?AUTO_4719 ) ) ( not ( = ?AUTO_4716 ?AUTO_4715 ) ) ( not ( = ?AUTO_4719 ?AUTO_4715 ) ) ( not ( = ?AUTO_4711 ?AUTO_4713 ) ) ( not ( = ?AUTO_4712 ?AUTO_4713 ) ) ( not ( = ?AUTO_4716 ?AUTO_4713 ) ) ( not ( = ?AUTO_4719 ?AUTO_4713 ) ) ( not ( = ?AUTO_4715 ?AUTO_4713 ) ) ( ON ?AUTO_4715 ?AUTO_4716 ) ( ON ?AUTO_4719 ?AUTO_4715 ) ( CLEAR ?AUTO_4719 ) ( CLEAR ?AUTO_4714 ) ( not ( = ?AUTO_4711 ?AUTO_4718 ) ) ( not ( = ?AUTO_4711 ?AUTO_4714 ) ) ( not ( = ?AUTO_4712 ?AUTO_4718 ) ) ( not ( = ?AUTO_4712 ?AUTO_4714 ) ) ( not ( = ?AUTO_4716 ?AUTO_4718 ) ) ( not ( = ?AUTO_4716 ?AUTO_4714 ) ) ( not ( = ?AUTO_4719 ?AUTO_4718 ) ) ( not ( = ?AUTO_4719 ?AUTO_4714 ) ) ( not ( = ?AUTO_4715 ?AUTO_4718 ) ) ( not ( = ?AUTO_4715 ?AUTO_4714 ) ) ( not ( = ?AUTO_4713 ?AUTO_4718 ) ) ( not ( = ?AUTO_4713 ?AUTO_4714 ) ) ( not ( = ?AUTO_4718 ?AUTO_4714 ) ) ( ON ?AUTO_4718 ?AUTO_4712 ) ( not ( = ?AUTO_4711 ?AUTO_4717 ) ) ( not ( = ?AUTO_4712 ?AUTO_4717 ) ) ( not ( = ?AUTO_4716 ?AUTO_4717 ) ) ( not ( = ?AUTO_4719 ?AUTO_4717 ) ) ( not ( = ?AUTO_4715 ?AUTO_4717 ) ) ( not ( = ?AUTO_4713 ?AUTO_4717 ) ) ( not ( = ?AUTO_4714 ?AUTO_4717 ) ) ( not ( = ?AUTO_4718 ?AUTO_4717 ) ) ( ON ?AUTO_4717 ?AUTO_4718 ) ( CLEAR ?AUTO_4717 ) ( HOLDING ?AUTO_4713 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4713 )
      ( MAKE-ON ?AUTO_4711 ?AUTO_4712 )
      ( MAKE-ON-VERIFY ?AUTO_4711 ?AUTO_4712 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4720 - BLOCK
      ?AUTO_4721 - BLOCK
    )
    :vars
    (
      ?AUTO_4723 - BLOCK
      ?AUTO_4727 - BLOCK
      ?AUTO_4724 - BLOCK
      ?AUTO_4728 - BLOCK
      ?AUTO_4726 - BLOCK
      ?AUTO_4725 - BLOCK
      ?AUTO_4722 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4720 ?AUTO_4721 ) ) ( ON-TABLE ?AUTO_4720 ) ( not ( = ?AUTO_4720 ?AUTO_4723 ) ) ( not ( = ?AUTO_4721 ?AUTO_4723 ) ) ( ON ?AUTO_4723 ?AUTO_4720 ) ( not ( = ?AUTO_4720 ?AUTO_4727 ) ) ( not ( = ?AUTO_4720 ?AUTO_4724 ) ) ( not ( = ?AUTO_4721 ?AUTO_4727 ) ) ( not ( = ?AUTO_4721 ?AUTO_4724 ) ) ( not ( = ?AUTO_4723 ?AUTO_4727 ) ) ( not ( = ?AUTO_4723 ?AUTO_4724 ) ) ( not ( = ?AUTO_4727 ?AUTO_4724 ) ) ( not ( = ?AUTO_4720 ?AUTO_4728 ) ) ( not ( = ?AUTO_4721 ?AUTO_4728 ) ) ( not ( = ?AUTO_4723 ?AUTO_4728 ) ) ( not ( = ?AUTO_4727 ?AUTO_4728 ) ) ( not ( = ?AUTO_4724 ?AUTO_4728 ) ) ( ON ?AUTO_4724 ?AUTO_4723 ) ( ON ?AUTO_4727 ?AUTO_4724 ) ( CLEAR ?AUTO_4727 ) ( CLEAR ?AUTO_4726 ) ( not ( = ?AUTO_4720 ?AUTO_4725 ) ) ( not ( = ?AUTO_4720 ?AUTO_4726 ) ) ( not ( = ?AUTO_4721 ?AUTO_4725 ) ) ( not ( = ?AUTO_4721 ?AUTO_4726 ) ) ( not ( = ?AUTO_4723 ?AUTO_4725 ) ) ( not ( = ?AUTO_4723 ?AUTO_4726 ) ) ( not ( = ?AUTO_4727 ?AUTO_4725 ) ) ( not ( = ?AUTO_4727 ?AUTO_4726 ) ) ( not ( = ?AUTO_4724 ?AUTO_4725 ) ) ( not ( = ?AUTO_4724 ?AUTO_4726 ) ) ( not ( = ?AUTO_4728 ?AUTO_4725 ) ) ( not ( = ?AUTO_4728 ?AUTO_4726 ) ) ( not ( = ?AUTO_4725 ?AUTO_4726 ) ) ( ON ?AUTO_4725 ?AUTO_4721 ) ( not ( = ?AUTO_4720 ?AUTO_4722 ) ) ( not ( = ?AUTO_4721 ?AUTO_4722 ) ) ( not ( = ?AUTO_4723 ?AUTO_4722 ) ) ( not ( = ?AUTO_4727 ?AUTO_4722 ) ) ( not ( = ?AUTO_4724 ?AUTO_4722 ) ) ( not ( = ?AUTO_4728 ?AUTO_4722 ) ) ( not ( = ?AUTO_4726 ?AUTO_4722 ) ) ( not ( = ?AUTO_4725 ?AUTO_4722 ) ) ( ON ?AUTO_4722 ?AUTO_4725 ) ( ON ?AUTO_4728 ?AUTO_4722 ) ( CLEAR ?AUTO_4728 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4728 ?AUTO_4722 )
      ( MAKE-ON ?AUTO_4720 ?AUTO_4721 )
      ( MAKE-ON-VERIFY ?AUTO_4720 ?AUTO_4721 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4729 - BLOCK
      ?AUTO_4730 - BLOCK
    )
    :vars
    (
      ?AUTO_4736 - BLOCK
      ?AUTO_4734 - BLOCK
      ?AUTO_4732 - BLOCK
      ?AUTO_4737 - BLOCK
      ?AUTO_4735 - BLOCK
      ?AUTO_4731 - BLOCK
      ?AUTO_4733 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4729 ?AUTO_4730 ) ) ( ON-TABLE ?AUTO_4729 ) ( not ( = ?AUTO_4729 ?AUTO_4736 ) ) ( not ( = ?AUTO_4730 ?AUTO_4736 ) ) ( ON ?AUTO_4736 ?AUTO_4729 ) ( not ( = ?AUTO_4729 ?AUTO_4734 ) ) ( not ( = ?AUTO_4729 ?AUTO_4732 ) ) ( not ( = ?AUTO_4730 ?AUTO_4734 ) ) ( not ( = ?AUTO_4730 ?AUTO_4732 ) ) ( not ( = ?AUTO_4736 ?AUTO_4734 ) ) ( not ( = ?AUTO_4736 ?AUTO_4732 ) ) ( not ( = ?AUTO_4734 ?AUTO_4732 ) ) ( not ( = ?AUTO_4729 ?AUTO_4737 ) ) ( not ( = ?AUTO_4730 ?AUTO_4737 ) ) ( not ( = ?AUTO_4736 ?AUTO_4737 ) ) ( not ( = ?AUTO_4734 ?AUTO_4737 ) ) ( not ( = ?AUTO_4732 ?AUTO_4737 ) ) ( ON ?AUTO_4732 ?AUTO_4736 ) ( CLEAR ?AUTO_4735 ) ( not ( = ?AUTO_4729 ?AUTO_4731 ) ) ( not ( = ?AUTO_4729 ?AUTO_4735 ) ) ( not ( = ?AUTO_4730 ?AUTO_4731 ) ) ( not ( = ?AUTO_4730 ?AUTO_4735 ) ) ( not ( = ?AUTO_4736 ?AUTO_4731 ) ) ( not ( = ?AUTO_4736 ?AUTO_4735 ) ) ( not ( = ?AUTO_4734 ?AUTO_4731 ) ) ( not ( = ?AUTO_4734 ?AUTO_4735 ) ) ( not ( = ?AUTO_4732 ?AUTO_4731 ) ) ( not ( = ?AUTO_4732 ?AUTO_4735 ) ) ( not ( = ?AUTO_4737 ?AUTO_4731 ) ) ( not ( = ?AUTO_4737 ?AUTO_4735 ) ) ( not ( = ?AUTO_4731 ?AUTO_4735 ) ) ( ON ?AUTO_4731 ?AUTO_4730 ) ( not ( = ?AUTO_4729 ?AUTO_4733 ) ) ( not ( = ?AUTO_4730 ?AUTO_4733 ) ) ( not ( = ?AUTO_4736 ?AUTO_4733 ) ) ( not ( = ?AUTO_4734 ?AUTO_4733 ) ) ( not ( = ?AUTO_4732 ?AUTO_4733 ) ) ( not ( = ?AUTO_4737 ?AUTO_4733 ) ) ( not ( = ?AUTO_4735 ?AUTO_4733 ) ) ( not ( = ?AUTO_4731 ?AUTO_4733 ) ) ( ON ?AUTO_4733 ?AUTO_4731 ) ( ON ?AUTO_4737 ?AUTO_4733 ) ( CLEAR ?AUTO_4737 ) ( HOLDING ?AUTO_4734 ) ( CLEAR ?AUTO_4732 ) )
    :subtasks
    ( ( !STACK ?AUTO_4734 ?AUTO_4732 )
      ( MAKE-ON ?AUTO_4729 ?AUTO_4730 )
      ( MAKE-ON-VERIFY ?AUTO_4729 ?AUTO_4730 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4738 - BLOCK
      ?AUTO_4739 - BLOCK
    )
    :vars
    (
      ?AUTO_4743 - BLOCK
      ?AUTO_4741 - BLOCK
      ?AUTO_4740 - BLOCK
      ?AUTO_4744 - BLOCK
      ?AUTO_4745 - BLOCK
      ?AUTO_4742 - BLOCK
      ?AUTO_4746 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4738 ?AUTO_4739 ) ) ( ON-TABLE ?AUTO_4738 ) ( not ( = ?AUTO_4738 ?AUTO_4743 ) ) ( not ( = ?AUTO_4739 ?AUTO_4743 ) ) ( ON ?AUTO_4743 ?AUTO_4738 ) ( not ( = ?AUTO_4738 ?AUTO_4741 ) ) ( not ( = ?AUTO_4738 ?AUTO_4740 ) ) ( not ( = ?AUTO_4739 ?AUTO_4741 ) ) ( not ( = ?AUTO_4739 ?AUTO_4740 ) ) ( not ( = ?AUTO_4743 ?AUTO_4741 ) ) ( not ( = ?AUTO_4743 ?AUTO_4740 ) ) ( not ( = ?AUTO_4741 ?AUTO_4740 ) ) ( not ( = ?AUTO_4738 ?AUTO_4744 ) ) ( not ( = ?AUTO_4739 ?AUTO_4744 ) ) ( not ( = ?AUTO_4743 ?AUTO_4744 ) ) ( not ( = ?AUTO_4741 ?AUTO_4744 ) ) ( not ( = ?AUTO_4740 ?AUTO_4744 ) ) ( ON ?AUTO_4740 ?AUTO_4743 ) ( CLEAR ?AUTO_4745 ) ( not ( = ?AUTO_4738 ?AUTO_4742 ) ) ( not ( = ?AUTO_4738 ?AUTO_4745 ) ) ( not ( = ?AUTO_4739 ?AUTO_4742 ) ) ( not ( = ?AUTO_4739 ?AUTO_4745 ) ) ( not ( = ?AUTO_4743 ?AUTO_4742 ) ) ( not ( = ?AUTO_4743 ?AUTO_4745 ) ) ( not ( = ?AUTO_4741 ?AUTO_4742 ) ) ( not ( = ?AUTO_4741 ?AUTO_4745 ) ) ( not ( = ?AUTO_4740 ?AUTO_4742 ) ) ( not ( = ?AUTO_4740 ?AUTO_4745 ) ) ( not ( = ?AUTO_4744 ?AUTO_4742 ) ) ( not ( = ?AUTO_4744 ?AUTO_4745 ) ) ( not ( = ?AUTO_4742 ?AUTO_4745 ) ) ( ON ?AUTO_4742 ?AUTO_4739 ) ( not ( = ?AUTO_4738 ?AUTO_4746 ) ) ( not ( = ?AUTO_4739 ?AUTO_4746 ) ) ( not ( = ?AUTO_4743 ?AUTO_4746 ) ) ( not ( = ?AUTO_4741 ?AUTO_4746 ) ) ( not ( = ?AUTO_4740 ?AUTO_4746 ) ) ( not ( = ?AUTO_4744 ?AUTO_4746 ) ) ( not ( = ?AUTO_4745 ?AUTO_4746 ) ) ( not ( = ?AUTO_4742 ?AUTO_4746 ) ) ( ON ?AUTO_4746 ?AUTO_4742 ) ( ON ?AUTO_4744 ?AUTO_4746 ) ( CLEAR ?AUTO_4740 ) ( ON ?AUTO_4741 ?AUTO_4744 ) ( CLEAR ?AUTO_4741 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4741 ?AUTO_4744 )
      ( MAKE-ON ?AUTO_4738 ?AUTO_4739 )
      ( MAKE-ON-VERIFY ?AUTO_4738 ?AUTO_4739 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4747 - BLOCK
      ?AUTO_4748 - BLOCK
    )
    :vars
    (
      ?AUTO_4752 - BLOCK
      ?AUTO_4754 - BLOCK
      ?AUTO_4755 - BLOCK
      ?AUTO_4750 - BLOCK
      ?AUTO_4749 - BLOCK
      ?AUTO_4753 - BLOCK
      ?AUTO_4751 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4747 ?AUTO_4748 ) ) ( ON-TABLE ?AUTO_4747 ) ( not ( = ?AUTO_4747 ?AUTO_4752 ) ) ( not ( = ?AUTO_4748 ?AUTO_4752 ) ) ( ON ?AUTO_4752 ?AUTO_4747 ) ( not ( = ?AUTO_4747 ?AUTO_4754 ) ) ( not ( = ?AUTO_4747 ?AUTO_4755 ) ) ( not ( = ?AUTO_4748 ?AUTO_4754 ) ) ( not ( = ?AUTO_4748 ?AUTO_4755 ) ) ( not ( = ?AUTO_4752 ?AUTO_4754 ) ) ( not ( = ?AUTO_4752 ?AUTO_4755 ) ) ( not ( = ?AUTO_4754 ?AUTO_4755 ) ) ( not ( = ?AUTO_4747 ?AUTO_4750 ) ) ( not ( = ?AUTO_4748 ?AUTO_4750 ) ) ( not ( = ?AUTO_4752 ?AUTO_4750 ) ) ( not ( = ?AUTO_4754 ?AUTO_4750 ) ) ( not ( = ?AUTO_4755 ?AUTO_4750 ) ) ( CLEAR ?AUTO_4749 ) ( not ( = ?AUTO_4747 ?AUTO_4753 ) ) ( not ( = ?AUTO_4747 ?AUTO_4749 ) ) ( not ( = ?AUTO_4748 ?AUTO_4753 ) ) ( not ( = ?AUTO_4748 ?AUTO_4749 ) ) ( not ( = ?AUTO_4752 ?AUTO_4753 ) ) ( not ( = ?AUTO_4752 ?AUTO_4749 ) ) ( not ( = ?AUTO_4754 ?AUTO_4753 ) ) ( not ( = ?AUTO_4754 ?AUTO_4749 ) ) ( not ( = ?AUTO_4755 ?AUTO_4753 ) ) ( not ( = ?AUTO_4755 ?AUTO_4749 ) ) ( not ( = ?AUTO_4750 ?AUTO_4753 ) ) ( not ( = ?AUTO_4750 ?AUTO_4749 ) ) ( not ( = ?AUTO_4753 ?AUTO_4749 ) ) ( ON ?AUTO_4753 ?AUTO_4748 ) ( not ( = ?AUTO_4747 ?AUTO_4751 ) ) ( not ( = ?AUTO_4748 ?AUTO_4751 ) ) ( not ( = ?AUTO_4752 ?AUTO_4751 ) ) ( not ( = ?AUTO_4754 ?AUTO_4751 ) ) ( not ( = ?AUTO_4755 ?AUTO_4751 ) ) ( not ( = ?AUTO_4750 ?AUTO_4751 ) ) ( not ( = ?AUTO_4749 ?AUTO_4751 ) ) ( not ( = ?AUTO_4753 ?AUTO_4751 ) ) ( ON ?AUTO_4751 ?AUTO_4753 ) ( ON ?AUTO_4750 ?AUTO_4751 ) ( ON ?AUTO_4754 ?AUTO_4750 ) ( CLEAR ?AUTO_4754 ) ( HOLDING ?AUTO_4755 ) ( CLEAR ?AUTO_4752 ) )
    :subtasks
    ( ( !STACK ?AUTO_4755 ?AUTO_4752 )
      ( MAKE-ON ?AUTO_4747 ?AUTO_4748 )
      ( MAKE-ON-VERIFY ?AUTO_4747 ?AUTO_4748 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4756 - BLOCK
      ?AUTO_4757 - BLOCK
    )
    :vars
    (
      ?AUTO_4759 - BLOCK
      ?AUTO_4763 - BLOCK
      ?AUTO_4758 - BLOCK
      ?AUTO_4761 - BLOCK
      ?AUTO_4764 - BLOCK
      ?AUTO_4762 - BLOCK
      ?AUTO_4760 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4756 ?AUTO_4757 ) ) ( ON-TABLE ?AUTO_4756 ) ( not ( = ?AUTO_4756 ?AUTO_4759 ) ) ( not ( = ?AUTO_4757 ?AUTO_4759 ) ) ( ON ?AUTO_4759 ?AUTO_4756 ) ( not ( = ?AUTO_4756 ?AUTO_4763 ) ) ( not ( = ?AUTO_4756 ?AUTO_4758 ) ) ( not ( = ?AUTO_4757 ?AUTO_4763 ) ) ( not ( = ?AUTO_4757 ?AUTO_4758 ) ) ( not ( = ?AUTO_4759 ?AUTO_4763 ) ) ( not ( = ?AUTO_4759 ?AUTO_4758 ) ) ( not ( = ?AUTO_4763 ?AUTO_4758 ) ) ( not ( = ?AUTO_4756 ?AUTO_4761 ) ) ( not ( = ?AUTO_4757 ?AUTO_4761 ) ) ( not ( = ?AUTO_4759 ?AUTO_4761 ) ) ( not ( = ?AUTO_4763 ?AUTO_4761 ) ) ( not ( = ?AUTO_4758 ?AUTO_4761 ) ) ( CLEAR ?AUTO_4764 ) ( not ( = ?AUTO_4756 ?AUTO_4762 ) ) ( not ( = ?AUTO_4756 ?AUTO_4764 ) ) ( not ( = ?AUTO_4757 ?AUTO_4762 ) ) ( not ( = ?AUTO_4757 ?AUTO_4764 ) ) ( not ( = ?AUTO_4759 ?AUTO_4762 ) ) ( not ( = ?AUTO_4759 ?AUTO_4764 ) ) ( not ( = ?AUTO_4763 ?AUTO_4762 ) ) ( not ( = ?AUTO_4763 ?AUTO_4764 ) ) ( not ( = ?AUTO_4758 ?AUTO_4762 ) ) ( not ( = ?AUTO_4758 ?AUTO_4764 ) ) ( not ( = ?AUTO_4761 ?AUTO_4762 ) ) ( not ( = ?AUTO_4761 ?AUTO_4764 ) ) ( not ( = ?AUTO_4762 ?AUTO_4764 ) ) ( ON ?AUTO_4762 ?AUTO_4757 ) ( not ( = ?AUTO_4756 ?AUTO_4760 ) ) ( not ( = ?AUTO_4757 ?AUTO_4760 ) ) ( not ( = ?AUTO_4759 ?AUTO_4760 ) ) ( not ( = ?AUTO_4763 ?AUTO_4760 ) ) ( not ( = ?AUTO_4758 ?AUTO_4760 ) ) ( not ( = ?AUTO_4761 ?AUTO_4760 ) ) ( not ( = ?AUTO_4764 ?AUTO_4760 ) ) ( not ( = ?AUTO_4762 ?AUTO_4760 ) ) ( ON ?AUTO_4760 ?AUTO_4762 ) ( ON ?AUTO_4761 ?AUTO_4760 ) ( ON ?AUTO_4763 ?AUTO_4761 ) ( CLEAR ?AUTO_4763 ) ( CLEAR ?AUTO_4759 ) ( ON-TABLE ?AUTO_4758 ) ( CLEAR ?AUTO_4758 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_4758 )
      ( MAKE-ON ?AUTO_4756 ?AUTO_4757 )
      ( MAKE-ON-VERIFY ?AUTO_4756 ?AUTO_4757 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4765 - BLOCK
      ?AUTO_4766 - BLOCK
    )
    :vars
    (
      ?AUTO_4767 - BLOCK
      ?AUTO_4771 - BLOCK
      ?AUTO_4773 - BLOCK
      ?AUTO_4769 - BLOCK
      ?AUTO_4768 - BLOCK
      ?AUTO_4772 - BLOCK
      ?AUTO_4770 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4765 ?AUTO_4766 ) ) ( ON-TABLE ?AUTO_4765 ) ( not ( = ?AUTO_4765 ?AUTO_4767 ) ) ( not ( = ?AUTO_4766 ?AUTO_4767 ) ) ( not ( = ?AUTO_4765 ?AUTO_4771 ) ) ( not ( = ?AUTO_4765 ?AUTO_4773 ) ) ( not ( = ?AUTO_4766 ?AUTO_4771 ) ) ( not ( = ?AUTO_4766 ?AUTO_4773 ) ) ( not ( = ?AUTO_4767 ?AUTO_4771 ) ) ( not ( = ?AUTO_4767 ?AUTO_4773 ) ) ( not ( = ?AUTO_4771 ?AUTO_4773 ) ) ( not ( = ?AUTO_4765 ?AUTO_4769 ) ) ( not ( = ?AUTO_4766 ?AUTO_4769 ) ) ( not ( = ?AUTO_4767 ?AUTO_4769 ) ) ( not ( = ?AUTO_4771 ?AUTO_4769 ) ) ( not ( = ?AUTO_4773 ?AUTO_4769 ) ) ( CLEAR ?AUTO_4768 ) ( not ( = ?AUTO_4765 ?AUTO_4772 ) ) ( not ( = ?AUTO_4765 ?AUTO_4768 ) ) ( not ( = ?AUTO_4766 ?AUTO_4772 ) ) ( not ( = ?AUTO_4766 ?AUTO_4768 ) ) ( not ( = ?AUTO_4767 ?AUTO_4772 ) ) ( not ( = ?AUTO_4767 ?AUTO_4768 ) ) ( not ( = ?AUTO_4771 ?AUTO_4772 ) ) ( not ( = ?AUTO_4771 ?AUTO_4768 ) ) ( not ( = ?AUTO_4773 ?AUTO_4772 ) ) ( not ( = ?AUTO_4773 ?AUTO_4768 ) ) ( not ( = ?AUTO_4769 ?AUTO_4772 ) ) ( not ( = ?AUTO_4769 ?AUTO_4768 ) ) ( not ( = ?AUTO_4772 ?AUTO_4768 ) ) ( ON ?AUTO_4772 ?AUTO_4766 ) ( not ( = ?AUTO_4765 ?AUTO_4770 ) ) ( not ( = ?AUTO_4766 ?AUTO_4770 ) ) ( not ( = ?AUTO_4767 ?AUTO_4770 ) ) ( not ( = ?AUTO_4771 ?AUTO_4770 ) ) ( not ( = ?AUTO_4773 ?AUTO_4770 ) ) ( not ( = ?AUTO_4769 ?AUTO_4770 ) ) ( not ( = ?AUTO_4768 ?AUTO_4770 ) ) ( not ( = ?AUTO_4772 ?AUTO_4770 ) ) ( ON ?AUTO_4770 ?AUTO_4772 ) ( ON ?AUTO_4769 ?AUTO_4770 ) ( ON ?AUTO_4771 ?AUTO_4769 ) ( CLEAR ?AUTO_4771 ) ( ON-TABLE ?AUTO_4773 ) ( CLEAR ?AUTO_4773 ) ( HOLDING ?AUTO_4767 ) ( CLEAR ?AUTO_4765 ) )
    :subtasks
    ( ( !STACK ?AUTO_4767 ?AUTO_4765 )
      ( MAKE-ON ?AUTO_4765 ?AUTO_4766 )
      ( MAKE-ON-VERIFY ?AUTO_4765 ?AUTO_4766 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4774 - BLOCK
      ?AUTO_4775 - BLOCK
    )
    :vars
    (
      ?AUTO_4778 - BLOCK
      ?AUTO_4782 - BLOCK
      ?AUTO_4781 - BLOCK
      ?AUTO_4777 - BLOCK
      ?AUTO_4780 - BLOCK
      ?AUTO_4779 - BLOCK
      ?AUTO_4776 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4774 ?AUTO_4775 ) ) ( ON-TABLE ?AUTO_4774 ) ( not ( = ?AUTO_4774 ?AUTO_4778 ) ) ( not ( = ?AUTO_4775 ?AUTO_4778 ) ) ( not ( = ?AUTO_4774 ?AUTO_4782 ) ) ( not ( = ?AUTO_4774 ?AUTO_4781 ) ) ( not ( = ?AUTO_4775 ?AUTO_4782 ) ) ( not ( = ?AUTO_4775 ?AUTO_4781 ) ) ( not ( = ?AUTO_4778 ?AUTO_4782 ) ) ( not ( = ?AUTO_4778 ?AUTO_4781 ) ) ( not ( = ?AUTO_4782 ?AUTO_4781 ) ) ( not ( = ?AUTO_4774 ?AUTO_4777 ) ) ( not ( = ?AUTO_4775 ?AUTO_4777 ) ) ( not ( = ?AUTO_4778 ?AUTO_4777 ) ) ( not ( = ?AUTO_4782 ?AUTO_4777 ) ) ( not ( = ?AUTO_4781 ?AUTO_4777 ) ) ( CLEAR ?AUTO_4780 ) ( not ( = ?AUTO_4774 ?AUTO_4779 ) ) ( not ( = ?AUTO_4774 ?AUTO_4780 ) ) ( not ( = ?AUTO_4775 ?AUTO_4779 ) ) ( not ( = ?AUTO_4775 ?AUTO_4780 ) ) ( not ( = ?AUTO_4778 ?AUTO_4779 ) ) ( not ( = ?AUTO_4778 ?AUTO_4780 ) ) ( not ( = ?AUTO_4782 ?AUTO_4779 ) ) ( not ( = ?AUTO_4782 ?AUTO_4780 ) ) ( not ( = ?AUTO_4781 ?AUTO_4779 ) ) ( not ( = ?AUTO_4781 ?AUTO_4780 ) ) ( not ( = ?AUTO_4777 ?AUTO_4779 ) ) ( not ( = ?AUTO_4777 ?AUTO_4780 ) ) ( not ( = ?AUTO_4779 ?AUTO_4780 ) ) ( ON ?AUTO_4779 ?AUTO_4775 ) ( not ( = ?AUTO_4774 ?AUTO_4776 ) ) ( not ( = ?AUTO_4775 ?AUTO_4776 ) ) ( not ( = ?AUTO_4778 ?AUTO_4776 ) ) ( not ( = ?AUTO_4782 ?AUTO_4776 ) ) ( not ( = ?AUTO_4781 ?AUTO_4776 ) ) ( not ( = ?AUTO_4777 ?AUTO_4776 ) ) ( not ( = ?AUTO_4780 ?AUTO_4776 ) ) ( not ( = ?AUTO_4779 ?AUTO_4776 ) ) ( ON ?AUTO_4776 ?AUTO_4779 ) ( ON ?AUTO_4777 ?AUTO_4776 ) ( ON ?AUTO_4782 ?AUTO_4777 ) ( CLEAR ?AUTO_4782 ) ( ON-TABLE ?AUTO_4781 ) ( CLEAR ?AUTO_4774 ) ( ON ?AUTO_4778 ?AUTO_4781 ) ( CLEAR ?AUTO_4778 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4778 ?AUTO_4781 )
      ( MAKE-ON ?AUTO_4774 ?AUTO_4775 )
      ( MAKE-ON-VERIFY ?AUTO_4774 ?AUTO_4775 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4789 - BLOCK
      ?AUTO_4790 - BLOCK
    )
    :vars
    (
      ?AUTO_4797 - BLOCK
      ?AUTO_4796 - BLOCK
      ?AUTO_4794 - BLOCK
      ?AUTO_4793 - BLOCK
      ?AUTO_4795 - BLOCK
      ?AUTO_4791 - BLOCK
      ?AUTO_4792 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4789 ?AUTO_4790 ) ) ( ON-TABLE ?AUTO_4789 ) ( not ( = ?AUTO_4789 ?AUTO_4797 ) ) ( not ( = ?AUTO_4790 ?AUTO_4797 ) ) ( not ( = ?AUTO_4789 ?AUTO_4796 ) ) ( not ( = ?AUTO_4789 ?AUTO_4794 ) ) ( not ( = ?AUTO_4790 ?AUTO_4796 ) ) ( not ( = ?AUTO_4790 ?AUTO_4794 ) ) ( not ( = ?AUTO_4797 ?AUTO_4796 ) ) ( not ( = ?AUTO_4797 ?AUTO_4794 ) ) ( not ( = ?AUTO_4796 ?AUTO_4794 ) ) ( not ( = ?AUTO_4789 ?AUTO_4793 ) ) ( not ( = ?AUTO_4790 ?AUTO_4793 ) ) ( not ( = ?AUTO_4797 ?AUTO_4793 ) ) ( not ( = ?AUTO_4796 ?AUTO_4793 ) ) ( not ( = ?AUTO_4794 ?AUTO_4793 ) ) ( not ( = ?AUTO_4789 ?AUTO_4795 ) ) ( not ( = ?AUTO_4789 ?AUTO_4791 ) ) ( not ( = ?AUTO_4790 ?AUTO_4795 ) ) ( not ( = ?AUTO_4790 ?AUTO_4791 ) ) ( not ( = ?AUTO_4797 ?AUTO_4795 ) ) ( not ( = ?AUTO_4797 ?AUTO_4791 ) ) ( not ( = ?AUTO_4796 ?AUTO_4795 ) ) ( not ( = ?AUTO_4796 ?AUTO_4791 ) ) ( not ( = ?AUTO_4794 ?AUTO_4795 ) ) ( not ( = ?AUTO_4794 ?AUTO_4791 ) ) ( not ( = ?AUTO_4793 ?AUTO_4795 ) ) ( not ( = ?AUTO_4793 ?AUTO_4791 ) ) ( not ( = ?AUTO_4795 ?AUTO_4791 ) ) ( ON ?AUTO_4795 ?AUTO_4790 ) ( not ( = ?AUTO_4789 ?AUTO_4792 ) ) ( not ( = ?AUTO_4790 ?AUTO_4792 ) ) ( not ( = ?AUTO_4797 ?AUTO_4792 ) ) ( not ( = ?AUTO_4796 ?AUTO_4792 ) ) ( not ( = ?AUTO_4794 ?AUTO_4792 ) ) ( not ( = ?AUTO_4793 ?AUTO_4792 ) ) ( not ( = ?AUTO_4791 ?AUTO_4792 ) ) ( not ( = ?AUTO_4795 ?AUTO_4792 ) ) ( ON ?AUTO_4792 ?AUTO_4795 ) ( ON ?AUTO_4793 ?AUTO_4792 ) ( ON ?AUTO_4796 ?AUTO_4793 ) ( CLEAR ?AUTO_4796 ) ( ON-TABLE ?AUTO_4794 ) ( CLEAR ?AUTO_4794 ) ( CLEAR ?AUTO_4789 ) ( ON ?AUTO_4797 ?AUTO_4791 ) ( CLEAR ?AUTO_4797 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4797 ?AUTO_4791 )
      ( MAKE-ON ?AUTO_4789 ?AUTO_4790 )
      ( MAKE-ON-VERIFY ?AUTO_4789 ?AUTO_4790 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4800 - BLOCK
      ?AUTO_4801 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4800 ) ( CLEAR ?AUTO_4801 ) ( not ( = ?AUTO_4800 ?AUTO_4801 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4800 ?AUTO_4801 )
      ( MAKE-ON-VERIFY ?AUTO_4800 ?AUTO_4801 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4802 - BLOCK
      ?AUTO_4803 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4803 ) ( not ( = ?AUTO_4802 ?AUTO_4803 ) ) ( ON-TABLE ?AUTO_4802 ) ( CLEAR ?AUTO_4802 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_4802 )
      ( MAKE-ON ?AUTO_4802 ?AUTO_4803 )
      ( MAKE-ON-VERIFY ?AUTO_4802 ?AUTO_4803 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4804 - BLOCK
      ?AUTO_4805 - BLOCK
    )
    :vars
    (
      ?AUTO_4806 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4804 ?AUTO_4805 ) ) ( ON-TABLE ?AUTO_4804 ) ( CLEAR ?AUTO_4804 ) ( HOLDING ?AUTO_4805 ) ( CLEAR ?AUTO_4806 ) ( not ( = ?AUTO_4804 ?AUTO_4806 ) ) ( not ( = ?AUTO_4805 ?AUTO_4806 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4805 ?AUTO_4806 )
      ( MAKE-ON ?AUTO_4804 ?AUTO_4805 )
      ( MAKE-ON-VERIFY ?AUTO_4804 ?AUTO_4805 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4964 - BLOCK
      ?AUTO_4965 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4964 ) ( CLEAR ?AUTO_4965 ) ( not ( = ?AUTO_4964 ?AUTO_4965 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4964 ?AUTO_4965 )
      ( MAKE-ON-VERIFY ?AUTO_4964 ?AUTO_4965 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4966 - BLOCK
      ?AUTO_4967 - BLOCK
    )
    :vars
    (
      ?AUTO_4968 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4967 ) ( not ( = ?AUTO_4966 ?AUTO_4967 ) ) ( ON ?AUTO_4966 ?AUTO_4968 ) ( CLEAR ?AUTO_4966 ) ( HAND-EMPTY ) ( not ( = ?AUTO_4966 ?AUTO_4968 ) ) ( not ( = ?AUTO_4967 ?AUTO_4968 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4966 ?AUTO_4968 )
      ( MAKE-ON ?AUTO_4966 ?AUTO_4967 )
      ( MAKE-ON-VERIFY ?AUTO_4966 ?AUTO_4967 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4969 - BLOCK
      ?AUTO_4970 - BLOCK
    )
    :vars
    (
      ?AUTO_4971 - BLOCK
      ?AUTO_4972 - BLOCK
      ?AUTO_4973 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4970 ) ( not ( = ?AUTO_4969 ?AUTO_4970 ) ) ( ON ?AUTO_4969 ?AUTO_4971 ) ( CLEAR ?AUTO_4969 ) ( not ( = ?AUTO_4969 ?AUTO_4971 ) ) ( not ( = ?AUTO_4970 ?AUTO_4971 ) ) ( HOLDING ?AUTO_4972 ) ( CLEAR ?AUTO_4973 ) ( not ( = ?AUTO_4969 ?AUTO_4972 ) ) ( not ( = ?AUTO_4969 ?AUTO_4973 ) ) ( not ( = ?AUTO_4970 ?AUTO_4972 ) ) ( not ( = ?AUTO_4970 ?AUTO_4973 ) ) ( not ( = ?AUTO_4971 ?AUTO_4972 ) ) ( not ( = ?AUTO_4971 ?AUTO_4973 ) ) ( not ( = ?AUTO_4972 ?AUTO_4973 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4972 ?AUTO_4973 )
      ( MAKE-ON ?AUTO_4969 ?AUTO_4970 )
      ( MAKE-ON-VERIFY ?AUTO_4969 ?AUTO_4970 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5012 - BLOCK
      ?AUTO_5013 - BLOCK
    )
    :vars
    (
      ?AUTO_5014 - BLOCK
      ?AUTO_5016 - BLOCK
      ?AUTO_5015 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5012 ?AUTO_5013 ) ) ( not ( = ?AUTO_5012 ?AUTO_5014 ) ) ( not ( = ?AUTO_5013 ?AUTO_5014 ) ) ( CLEAR ?AUTO_5016 ) ( not ( = ?AUTO_5012 ?AUTO_5015 ) ) ( not ( = ?AUTO_5012 ?AUTO_5016 ) ) ( not ( = ?AUTO_5013 ?AUTO_5015 ) ) ( not ( = ?AUTO_5013 ?AUTO_5016 ) ) ( not ( = ?AUTO_5014 ?AUTO_5015 ) ) ( not ( = ?AUTO_5014 ?AUTO_5016 ) ) ( not ( = ?AUTO_5015 ?AUTO_5016 ) ) ( ON ?AUTO_5015 ?AUTO_5013 ) ( CLEAR ?AUTO_5015 ) ( HOLDING ?AUTO_5012 ) ( CLEAR ?AUTO_5014 ) )
    :subtasks
    ( ( !STACK ?AUTO_5012 ?AUTO_5014 )
      ( MAKE-ON ?AUTO_5012 ?AUTO_5013 )
      ( MAKE-ON-VERIFY ?AUTO_5012 ?AUTO_5013 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5017 - BLOCK
      ?AUTO_5018 - BLOCK
    )
    :vars
    (
      ?AUTO_5021 - BLOCK
      ?AUTO_5019 - BLOCK
      ?AUTO_5020 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5017 ?AUTO_5018 ) ) ( not ( = ?AUTO_5017 ?AUTO_5021 ) ) ( not ( = ?AUTO_5018 ?AUTO_5021 ) ) ( CLEAR ?AUTO_5019 ) ( not ( = ?AUTO_5017 ?AUTO_5020 ) ) ( not ( = ?AUTO_5017 ?AUTO_5019 ) ) ( not ( = ?AUTO_5018 ?AUTO_5020 ) ) ( not ( = ?AUTO_5018 ?AUTO_5019 ) ) ( not ( = ?AUTO_5021 ?AUTO_5020 ) ) ( not ( = ?AUTO_5021 ?AUTO_5019 ) ) ( not ( = ?AUTO_5020 ?AUTO_5019 ) ) ( ON ?AUTO_5020 ?AUTO_5018 ) ( CLEAR ?AUTO_5021 ) ( ON ?AUTO_5017 ?AUTO_5020 ) ( CLEAR ?AUTO_5017 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5017 ?AUTO_5020 )
      ( MAKE-ON ?AUTO_5017 ?AUTO_5018 )
      ( MAKE-ON-VERIFY ?AUTO_5017 ?AUTO_5018 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5022 - BLOCK
      ?AUTO_5023 - BLOCK
    )
    :vars
    (
      ?AUTO_5026 - BLOCK
      ?AUTO_5025 - BLOCK
      ?AUTO_5024 - BLOCK
      ?AUTO_5027 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5022 ?AUTO_5023 ) ) ( not ( = ?AUTO_5022 ?AUTO_5026 ) ) ( not ( = ?AUTO_5023 ?AUTO_5026 ) ) ( CLEAR ?AUTO_5025 ) ( not ( = ?AUTO_5022 ?AUTO_5024 ) ) ( not ( = ?AUTO_5022 ?AUTO_5025 ) ) ( not ( = ?AUTO_5023 ?AUTO_5024 ) ) ( not ( = ?AUTO_5023 ?AUTO_5025 ) ) ( not ( = ?AUTO_5026 ?AUTO_5024 ) ) ( not ( = ?AUTO_5026 ?AUTO_5025 ) ) ( not ( = ?AUTO_5024 ?AUTO_5025 ) ) ( ON ?AUTO_5024 ?AUTO_5023 ) ( ON ?AUTO_5022 ?AUTO_5024 ) ( CLEAR ?AUTO_5022 ) ( HOLDING ?AUTO_5026 ) ( CLEAR ?AUTO_5027 ) ( not ( = ?AUTO_5022 ?AUTO_5027 ) ) ( not ( = ?AUTO_5023 ?AUTO_5027 ) ) ( not ( = ?AUTO_5026 ?AUTO_5027 ) ) ( not ( = ?AUTO_5025 ?AUTO_5027 ) ) ( not ( = ?AUTO_5024 ?AUTO_5027 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5026 ?AUTO_5027 )
      ( MAKE-ON ?AUTO_5022 ?AUTO_5023 )
      ( MAKE-ON-VERIFY ?AUTO_5022 ?AUTO_5023 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5044 - BLOCK
      ?AUTO_5045 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5044 ) ( CLEAR ?AUTO_5045 ) ( not ( = ?AUTO_5044 ?AUTO_5045 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5044 ?AUTO_5045 )
      ( MAKE-ON-VERIFY ?AUTO_5044 ?AUTO_5045 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5046 - BLOCK
      ?AUTO_5047 - BLOCK
    )
    :vars
    (
      ?AUTO_5048 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5047 ) ( not ( = ?AUTO_5046 ?AUTO_5047 ) ) ( ON ?AUTO_5046 ?AUTO_5048 ) ( CLEAR ?AUTO_5046 ) ( HAND-EMPTY ) ( not ( = ?AUTO_5046 ?AUTO_5048 ) ) ( not ( = ?AUTO_5047 ?AUTO_5048 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5046 ?AUTO_5048 )
      ( MAKE-ON ?AUTO_5046 ?AUTO_5047 )
      ( MAKE-ON-VERIFY ?AUTO_5046 ?AUTO_5047 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5049 - BLOCK
      ?AUTO_5050 - BLOCK
    )
    :vars
    (
      ?AUTO_5051 - BLOCK
      ?AUTO_5052 - BLOCK
      ?AUTO_5053 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5050 ) ( not ( = ?AUTO_5049 ?AUTO_5050 ) ) ( ON ?AUTO_5049 ?AUTO_5051 ) ( CLEAR ?AUTO_5049 ) ( not ( = ?AUTO_5049 ?AUTO_5051 ) ) ( not ( = ?AUTO_5050 ?AUTO_5051 ) ) ( HOLDING ?AUTO_5052 ) ( CLEAR ?AUTO_5053 ) ( not ( = ?AUTO_5049 ?AUTO_5052 ) ) ( not ( = ?AUTO_5049 ?AUTO_5053 ) ) ( not ( = ?AUTO_5050 ?AUTO_5052 ) ) ( not ( = ?AUTO_5050 ?AUTO_5053 ) ) ( not ( = ?AUTO_5051 ?AUTO_5052 ) ) ( not ( = ?AUTO_5051 ?AUTO_5053 ) ) ( not ( = ?AUTO_5052 ?AUTO_5053 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5052 ?AUTO_5053 )
      ( MAKE-ON ?AUTO_5049 ?AUTO_5050 )
      ( MAKE-ON-VERIFY ?AUTO_5049 ?AUTO_5050 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5054 - BLOCK
      ?AUTO_5055 - BLOCK
    )
    :vars
    (
      ?AUTO_5056 - BLOCK
      ?AUTO_5057 - BLOCK
      ?AUTO_5058 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5055 ) ( not ( = ?AUTO_5054 ?AUTO_5055 ) ) ( ON ?AUTO_5054 ?AUTO_5056 ) ( not ( = ?AUTO_5054 ?AUTO_5056 ) ) ( not ( = ?AUTO_5055 ?AUTO_5056 ) ) ( CLEAR ?AUTO_5057 ) ( not ( = ?AUTO_5054 ?AUTO_5058 ) ) ( not ( = ?AUTO_5054 ?AUTO_5057 ) ) ( not ( = ?AUTO_5055 ?AUTO_5058 ) ) ( not ( = ?AUTO_5055 ?AUTO_5057 ) ) ( not ( = ?AUTO_5056 ?AUTO_5058 ) ) ( not ( = ?AUTO_5056 ?AUTO_5057 ) ) ( not ( = ?AUTO_5058 ?AUTO_5057 ) ) ( ON ?AUTO_5058 ?AUTO_5054 ) ( CLEAR ?AUTO_5058 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5058 ?AUTO_5054 )
      ( MAKE-ON ?AUTO_5054 ?AUTO_5055 )
      ( MAKE-ON-VERIFY ?AUTO_5054 ?AUTO_5055 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5059 - BLOCK
      ?AUTO_5060 - BLOCK
    )
    :vars
    (
      ?AUTO_5061 - BLOCK
      ?AUTO_5063 - BLOCK
      ?AUTO_5062 - BLOCK
      ?AUTO_5064 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5059 ?AUTO_5060 ) ) ( ON ?AUTO_5059 ?AUTO_5061 ) ( not ( = ?AUTO_5059 ?AUTO_5061 ) ) ( not ( = ?AUTO_5060 ?AUTO_5061 ) ) ( CLEAR ?AUTO_5063 ) ( not ( = ?AUTO_5059 ?AUTO_5062 ) ) ( not ( = ?AUTO_5059 ?AUTO_5063 ) ) ( not ( = ?AUTO_5060 ?AUTO_5062 ) ) ( not ( = ?AUTO_5060 ?AUTO_5063 ) ) ( not ( = ?AUTO_5061 ?AUTO_5062 ) ) ( not ( = ?AUTO_5061 ?AUTO_5063 ) ) ( not ( = ?AUTO_5062 ?AUTO_5063 ) ) ( ON ?AUTO_5062 ?AUTO_5059 ) ( CLEAR ?AUTO_5062 ) ( HOLDING ?AUTO_5060 ) ( CLEAR ?AUTO_5064 ) ( not ( = ?AUTO_5059 ?AUTO_5064 ) ) ( not ( = ?AUTO_5060 ?AUTO_5064 ) ) ( not ( = ?AUTO_5061 ?AUTO_5064 ) ) ( not ( = ?AUTO_5063 ?AUTO_5064 ) ) ( not ( = ?AUTO_5062 ?AUTO_5064 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5060 ?AUTO_5064 )
      ( MAKE-ON ?AUTO_5059 ?AUTO_5060 )
      ( MAKE-ON-VERIFY ?AUTO_5059 ?AUTO_5060 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5067 - BLOCK
      ?AUTO_5068 - BLOCK
    )
    :vars
    (
      ?AUTO_5071 - BLOCK
      ?AUTO_5070 - BLOCK
      ?AUTO_5069 - BLOCK
      ?AUTO_5072 - BLOCK
      ?AUTO_5073 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5068 ) ( not ( = ?AUTO_5067 ?AUTO_5068 ) ) ( ON ?AUTO_5067 ?AUTO_5071 ) ( not ( = ?AUTO_5067 ?AUTO_5071 ) ) ( not ( = ?AUTO_5068 ?AUTO_5071 ) ) ( CLEAR ?AUTO_5070 ) ( not ( = ?AUTO_5067 ?AUTO_5069 ) ) ( not ( = ?AUTO_5067 ?AUTO_5070 ) ) ( not ( = ?AUTO_5068 ?AUTO_5069 ) ) ( not ( = ?AUTO_5068 ?AUTO_5070 ) ) ( not ( = ?AUTO_5071 ?AUTO_5069 ) ) ( not ( = ?AUTO_5071 ?AUTO_5070 ) ) ( not ( = ?AUTO_5069 ?AUTO_5070 ) ) ( ON ?AUTO_5069 ?AUTO_5067 ) ( CLEAR ?AUTO_5069 ) ( HOLDING ?AUTO_5072 ) ( CLEAR ?AUTO_5073 ) ( not ( = ?AUTO_5067 ?AUTO_5072 ) ) ( not ( = ?AUTO_5067 ?AUTO_5073 ) ) ( not ( = ?AUTO_5068 ?AUTO_5072 ) ) ( not ( = ?AUTO_5068 ?AUTO_5073 ) ) ( not ( = ?AUTO_5071 ?AUTO_5072 ) ) ( not ( = ?AUTO_5071 ?AUTO_5073 ) ) ( not ( = ?AUTO_5070 ?AUTO_5072 ) ) ( not ( = ?AUTO_5070 ?AUTO_5073 ) ) ( not ( = ?AUTO_5069 ?AUTO_5072 ) ) ( not ( = ?AUTO_5069 ?AUTO_5073 ) ) ( not ( = ?AUTO_5072 ?AUTO_5073 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5072 ?AUTO_5073 )
      ( MAKE-ON ?AUTO_5067 ?AUTO_5068 )
      ( MAKE-ON-VERIFY ?AUTO_5067 ?AUTO_5068 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5186 - BLOCK
      ?AUTO_5187 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5186 ) ( CLEAR ?AUTO_5187 ) ( not ( = ?AUTO_5186 ?AUTO_5187 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5186 ?AUTO_5187 )
      ( MAKE-ON-VERIFY ?AUTO_5186 ?AUTO_5187 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5188 - BLOCK
      ?AUTO_5189 - BLOCK
    )
    :vars
    (
      ?AUTO_5190 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5189 ) ( not ( = ?AUTO_5188 ?AUTO_5189 ) ) ( ON ?AUTO_5188 ?AUTO_5190 ) ( CLEAR ?AUTO_5188 ) ( HAND-EMPTY ) ( not ( = ?AUTO_5188 ?AUTO_5190 ) ) ( not ( = ?AUTO_5189 ?AUTO_5190 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5188 ?AUTO_5190 )
      ( MAKE-ON ?AUTO_5188 ?AUTO_5189 )
      ( MAKE-ON-VERIFY ?AUTO_5188 ?AUTO_5189 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5191 - BLOCK
      ?AUTO_5192 - BLOCK
    )
    :vars
    (
      ?AUTO_5193 - BLOCK
      ?AUTO_5194 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5191 ?AUTO_5192 ) ) ( ON ?AUTO_5191 ?AUTO_5193 ) ( CLEAR ?AUTO_5191 ) ( not ( = ?AUTO_5191 ?AUTO_5193 ) ) ( not ( = ?AUTO_5192 ?AUTO_5193 ) ) ( HOLDING ?AUTO_5192 ) ( CLEAR ?AUTO_5194 ) ( not ( = ?AUTO_5191 ?AUTO_5194 ) ) ( not ( = ?AUTO_5192 ?AUTO_5194 ) ) ( not ( = ?AUTO_5193 ?AUTO_5194 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5192 ?AUTO_5194 )
      ( MAKE-ON ?AUTO_5191 ?AUTO_5192 )
      ( MAKE-ON-VERIFY ?AUTO_5191 ?AUTO_5192 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5196 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5196 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5196 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5196 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5197 - BLOCK
    )
    :vars
    (
      ?AUTO_5198 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5197 ?AUTO_5198 ) ( CLEAR ?AUTO_5197 ) ( HAND-EMPTY ) ( not ( = ?AUTO_5197 ?AUTO_5198 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5197 ?AUTO_5198 )
      ( MAKE-ON-TABLE ?AUTO_5197 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5197 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5201 - BLOCK
      ?AUTO_5202 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5201 ) ( CLEAR ?AUTO_5202 ) ( not ( = ?AUTO_5201 ?AUTO_5202 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5201 ?AUTO_5202 )
      ( MAKE-ON-VERIFY ?AUTO_5201 ?AUTO_5202 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5203 - BLOCK
      ?AUTO_5204 - BLOCK
    )
    :vars
    (
      ?AUTO_5205 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5204 ) ( not ( = ?AUTO_5203 ?AUTO_5204 ) ) ( ON ?AUTO_5203 ?AUTO_5205 ) ( CLEAR ?AUTO_5203 ) ( HAND-EMPTY ) ( not ( = ?AUTO_5203 ?AUTO_5205 ) ) ( not ( = ?AUTO_5204 ?AUTO_5205 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5203 ?AUTO_5205 )
      ( MAKE-ON ?AUTO_5203 ?AUTO_5204 )
      ( MAKE-ON-VERIFY ?AUTO_5203 ?AUTO_5204 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5206 - BLOCK
      ?AUTO_5207 - BLOCK
    )
    :vars
    (
      ?AUTO_5208 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5206 ?AUTO_5207 ) ) ( ON ?AUTO_5206 ?AUTO_5208 ) ( CLEAR ?AUTO_5206 ) ( not ( = ?AUTO_5206 ?AUTO_5208 ) ) ( not ( = ?AUTO_5207 ?AUTO_5208 ) ) ( HOLDING ?AUTO_5207 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5207 )
      ( MAKE-ON ?AUTO_5206 ?AUTO_5207 )
      ( MAKE-ON-VERIFY ?AUTO_5206 ?AUTO_5207 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5209 - BLOCK
      ?AUTO_5210 - BLOCK
    )
    :vars
    (
      ?AUTO_5211 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5209 ?AUTO_5210 ) ) ( ON ?AUTO_5209 ?AUTO_5211 ) ( not ( = ?AUTO_5209 ?AUTO_5211 ) ) ( not ( = ?AUTO_5210 ?AUTO_5211 ) ) ( ON ?AUTO_5210 ?AUTO_5209 ) ( CLEAR ?AUTO_5210 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5210 ?AUTO_5209 )
      ( MAKE-ON ?AUTO_5209 ?AUTO_5210 )
      ( MAKE-ON-VERIFY ?AUTO_5209 ?AUTO_5210 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5214 - BLOCK
      ?AUTO_5215 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5214 ) ( CLEAR ?AUTO_5215 ) ( not ( = ?AUTO_5214 ?AUTO_5215 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5214 ?AUTO_5215 )
      ( MAKE-ON-VERIFY ?AUTO_5214 ?AUTO_5215 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5216 - BLOCK
      ?AUTO_5217 - BLOCK
    )
    :vars
    (
      ?AUTO_5218 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5217 ) ( not ( = ?AUTO_5216 ?AUTO_5217 ) ) ( ON ?AUTO_5216 ?AUTO_5218 ) ( CLEAR ?AUTO_5216 ) ( HAND-EMPTY ) ( not ( = ?AUTO_5216 ?AUTO_5218 ) ) ( not ( = ?AUTO_5217 ?AUTO_5218 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5216 ?AUTO_5218 )
      ( MAKE-ON ?AUTO_5216 ?AUTO_5217 )
      ( MAKE-ON-VERIFY ?AUTO_5216 ?AUTO_5217 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5219 - BLOCK
      ?AUTO_5220 - BLOCK
    )
    :vars
    (
      ?AUTO_5221 - BLOCK
      ?AUTO_5222 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5219 ?AUTO_5220 ) ) ( ON ?AUTO_5219 ?AUTO_5221 ) ( CLEAR ?AUTO_5219 ) ( not ( = ?AUTO_5219 ?AUTO_5221 ) ) ( not ( = ?AUTO_5220 ?AUTO_5221 ) ) ( HOLDING ?AUTO_5220 ) ( CLEAR ?AUTO_5222 ) ( not ( = ?AUTO_5219 ?AUTO_5222 ) ) ( not ( = ?AUTO_5220 ?AUTO_5222 ) ) ( not ( = ?AUTO_5221 ?AUTO_5222 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5220 ?AUTO_5222 )
      ( MAKE-ON ?AUTO_5219 ?AUTO_5220 )
      ( MAKE-ON-VERIFY ?AUTO_5219 ?AUTO_5220 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5225 - BLOCK
      ?AUTO_5226 - BLOCK
    )
    :vars
    (
      ?AUTO_5227 - BLOCK
      ?AUTO_5228 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5226 ) ( not ( = ?AUTO_5225 ?AUTO_5226 ) ) ( ON ?AUTO_5225 ?AUTO_5227 ) ( CLEAR ?AUTO_5225 ) ( not ( = ?AUTO_5225 ?AUTO_5227 ) ) ( not ( = ?AUTO_5226 ?AUTO_5227 ) ) ( HOLDING ?AUTO_5228 ) ( not ( = ?AUTO_5225 ?AUTO_5228 ) ) ( not ( = ?AUTO_5226 ?AUTO_5228 ) ) ( not ( = ?AUTO_5227 ?AUTO_5228 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5228 )
      ( MAKE-ON ?AUTO_5225 ?AUTO_5226 )
      ( MAKE-ON-VERIFY ?AUTO_5225 ?AUTO_5226 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5229 - BLOCK
      ?AUTO_5230 - BLOCK
    )
    :vars
    (
      ?AUTO_5231 - BLOCK
      ?AUTO_5232 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5229 ?AUTO_5230 ) ) ( ON ?AUTO_5229 ?AUTO_5231 ) ( CLEAR ?AUTO_5229 ) ( not ( = ?AUTO_5229 ?AUTO_5231 ) ) ( not ( = ?AUTO_5230 ?AUTO_5231 ) ) ( not ( = ?AUTO_5229 ?AUTO_5232 ) ) ( not ( = ?AUTO_5230 ?AUTO_5232 ) ) ( not ( = ?AUTO_5231 ?AUTO_5232 ) ) ( ON ?AUTO_5232 ?AUTO_5230 ) ( CLEAR ?AUTO_5232 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5232 ?AUTO_5230 )
      ( MAKE-ON ?AUTO_5229 ?AUTO_5230 )
      ( MAKE-ON-VERIFY ?AUTO_5229 ?AUTO_5230 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5235 - BLOCK
      ?AUTO_5236 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5235 ) ( CLEAR ?AUTO_5236 ) ( not ( = ?AUTO_5235 ?AUTO_5236 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5235 ?AUTO_5236 )
      ( MAKE-ON-VERIFY ?AUTO_5235 ?AUTO_5236 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5237 - BLOCK
      ?AUTO_5238 - BLOCK
    )
    :vars
    (
      ?AUTO_5239 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5238 ) ( not ( = ?AUTO_5237 ?AUTO_5238 ) ) ( ON ?AUTO_5237 ?AUTO_5239 ) ( CLEAR ?AUTO_5237 ) ( HAND-EMPTY ) ( not ( = ?AUTO_5237 ?AUTO_5239 ) ) ( not ( = ?AUTO_5238 ?AUTO_5239 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5237 ?AUTO_5239 )
      ( MAKE-ON ?AUTO_5237 ?AUTO_5238 )
      ( MAKE-ON-VERIFY ?AUTO_5237 ?AUTO_5238 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5240 - BLOCK
      ?AUTO_5241 - BLOCK
    )
    :vars
    (
      ?AUTO_5242 - BLOCK
      ?AUTO_5243 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5240 ?AUTO_5241 ) ) ( ON ?AUTO_5240 ?AUTO_5242 ) ( CLEAR ?AUTO_5240 ) ( not ( = ?AUTO_5240 ?AUTO_5242 ) ) ( not ( = ?AUTO_5241 ?AUTO_5242 ) ) ( HOLDING ?AUTO_5241 ) ( CLEAR ?AUTO_5243 ) ( not ( = ?AUTO_5240 ?AUTO_5243 ) ) ( not ( = ?AUTO_5241 ?AUTO_5243 ) ) ( not ( = ?AUTO_5242 ?AUTO_5243 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5241 ?AUTO_5243 )
      ( MAKE-ON ?AUTO_5240 ?AUTO_5241 )
      ( MAKE-ON-VERIFY ?AUTO_5240 ?AUTO_5241 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5244 - BLOCK
      ?AUTO_5245 - BLOCK
    )
    :vars
    (
      ?AUTO_5246 - BLOCK
      ?AUTO_5247 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5244 ?AUTO_5245 ) ) ( ON ?AUTO_5244 ?AUTO_5246 ) ( not ( = ?AUTO_5244 ?AUTO_5246 ) ) ( not ( = ?AUTO_5245 ?AUTO_5246 ) ) ( CLEAR ?AUTO_5247 ) ( not ( = ?AUTO_5244 ?AUTO_5247 ) ) ( not ( = ?AUTO_5245 ?AUTO_5247 ) ) ( not ( = ?AUTO_5246 ?AUTO_5247 ) ) ( ON ?AUTO_5245 ?AUTO_5244 ) ( CLEAR ?AUTO_5245 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5245 ?AUTO_5244 )
      ( MAKE-ON ?AUTO_5244 ?AUTO_5245 )
      ( MAKE-ON-VERIFY ?AUTO_5244 ?AUTO_5245 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5248 - BLOCK
      ?AUTO_5249 - BLOCK
    )
    :vars
    (
      ?AUTO_5250 - BLOCK
      ?AUTO_5251 - BLOCK
      ?AUTO_5252 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5248 ?AUTO_5249 ) ) ( ON ?AUTO_5248 ?AUTO_5250 ) ( not ( = ?AUTO_5248 ?AUTO_5250 ) ) ( not ( = ?AUTO_5249 ?AUTO_5250 ) ) ( not ( = ?AUTO_5248 ?AUTO_5251 ) ) ( not ( = ?AUTO_5249 ?AUTO_5251 ) ) ( not ( = ?AUTO_5250 ?AUTO_5251 ) ) ( ON ?AUTO_5249 ?AUTO_5248 ) ( CLEAR ?AUTO_5249 ) ( HOLDING ?AUTO_5251 ) ( CLEAR ?AUTO_5252 ) ( not ( = ?AUTO_5248 ?AUTO_5252 ) ) ( not ( = ?AUTO_5249 ?AUTO_5252 ) ) ( not ( = ?AUTO_5250 ?AUTO_5252 ) ) ( not ( = ?AUTO_5251 ?AUTO_5252 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5251 ?AUTO_5252 )
      ( MAKE-ON ?AUTO_5248 ?AUTO_5249 )
      ( MAKE-ON-VERIFY ?AUTO_5248 ?AUTO_5249 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5260 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5260 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5260 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5260 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5261 - BLOCK
    )
    :vars
    (
      ?AUTO_5262 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5261 ?AUTO_5262 ) ( CLEAR ?AUTO_5261 ) ( HAND-EMPTY ) ( not ( = ?AUTO_5261 ?AUTO_5262 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5261 ?AUTO_5262 )
      ( MAKE-ON-TABLE ?AUTO_5261 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5261 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5263 - BLOCK
    )
    :vars
    (
      ?AUTO_5264 - BLOCK
      ?AUTO_5265 - BLOCK
      ?AUTO_5266 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5263 ?AUTO_5264 ) ( CLEAR ?AUTO_5263 ) ( not ( = ?AUTO_5263 ?AUTO_5264 ) ) ( HOLDING ?AUTO_5265 ) ( CLEAR ?AUTO_5266 ) ( not ( = ?AUTO_5263 ?AUTO_5265 ) ) ( not ( = ?AUTO_5263 ?AUTO_5266 ) ) ( not ( = ?AUTO_5264 ?AUTO_5265 ) ) ( not ( = ?AUTO_5264 ?AUTO_5266 ) ) ( not ( = ?AUTO_5265 ?AUTO_5266 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5265 ?AUTO_5266 )
      ( MAKE-ON-TABLE ?AUTO_5263 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5263 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5271 - BLOCK
    )
    :vars
    (
      ?AUTO_5272 - BLOCK
      ?AUTO_5274 - BLOCK
      ?AUTO_5273 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5271 ?AUTO_5272 ) ( not ( = ?AUTO_5271 ?AUTO_5272 ) ) ( CLEAR ?AUTO_5274 ) ( not ( = ?AUTO_5271 ?AUTO_5273 ) ) ( not ( = ?AUTO_5271 ?AUTO_5274 ) ) ( not ( = ?AUTO_5272 ?AUTO_5273 ) ) ( not ( = ?AUTO_5272 ?AUTO_5274 ) ) ( not ( = ?AUTO_5273 ?AUTO_5274 ) ) ( ON ?AUTO_5273 ?AUTO_5271 ) ( CLEAR ?AUTO_5273 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5273 ?AUTO_5271 )
      ( MAKE-ON-TABLE ?AUTO_5271 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5271 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5275 - BLOCK
    )
    :vars
    (
      ?AUTO_5277 - BLOCK
      ?AUTO_5278 - BLOCK
      ?AUTO_5276 - BLOCK
      ?AUTO_5279 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5275 ?AUTO_5277 ) ( not ( = ?AUTO_5275 ?AUTO_5277 ) ) ( CLEAR ?AUTO_5278 ) ( not ( = ?AUTO_5275 ?AUTO_5276 ) ) ( not ( = ?AUTO_5275 ?AUTO_5278 ) ) ( not ( = ?AUTO_5277 ?AUTO_5276 ) ) ( not ( = ?AUTO_5277 ?AUTO_5278 ) ) ( not ( = ?AUTO_5276 ?AUTO_5278 ) ) ( ON ?AUTO_5276 ?AUTO_5275 ) ( CLEAR ?AUTO_5276 ) ( HOLDING ?AUTO_5279 ) ( not ( = ?AUTO_5275 ?AUTO_5279 ) ) ( not ( = ?AUTO_5277 ?AUTO_5279 ) ) ( not ( = ?AUTO_5278 ?AUTO_5279 ) ) ( not ( = ?AUTO_5276 ?AUTO_5279 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5279 )
      ( MAKE-ON-TABLE ?AUTO_5275 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5275 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5280 - BLOCK
    )
    :vars
    (
      ?AUTO_5281 - BLOCK
      ?AUTO_5284 - BLOCK
      ?AUTO_5283 - BLOCK
      ?AUTO_5282 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5280 ?AUTO_5281 ) ( not ( = ?AUTO_5280 ?AUTO_5281 ) ) ( CLEAR ?AUTO_5284 ) ( not ( = ?AUTO_5280 ?AUTO_5283 ) ) ( not ( = ?AUTO_5280 ?AUTO_5284 ) ) ( not ( = ?AUTO_5281 ?AUTO_5283 ) ) ( not ( = ?AUTO_5281 ?AUTO_5284 ) ) ( not ( = ?AUTO_5283 ?AUTO_5284 ) ) ( ON ?AUTO_5283 ?AUTO_5280 ) ( not ( = ?AUTO_5280 ?AUTO_5282 ) ) ( not ( = ?AUTO_5281 ?AUTO_5282 ) ) ( not ( = ?AUTO_5284 ?AUTO_5282 ) ) ( not ( = ?AUTO_5283 ?AUTO_5282 ) ) ( ON ?AUTO_5282 ?AUTO_5283 ) ( CLEAR ?AUTO_5282 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5282 ?AUTO_5283 )
      ( MAKE-ON-TABLE ?AUTO_5280 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5280 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5286 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5286 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5286 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5286 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5287 - BLOCK
    )
    :vars
    (
      ?AUTO_5288 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5287 ?AUTO_5288 ) ( CLEAR ?AUTO_5287 ) ( HAND-EMPTY ) ( not ( = ?AUTO_5287 ?AUTO_5288 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5287 ?AUTO_5288 )
      ( MAKE-ON-TABLE ?AUTO_5287 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5287 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5289 - BLOCK
    )
    :vars
    (
      ?AUTO_5290 - BLOCK
      ?AUTO_5291 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5289 ?AUTO_5290 ) ( CLEAR ?AUTO_5289 ) ( not ( = ?AUTO_5289 ?AUTO_5290 ) ) ( HOLDING ?AUTO_5291 ) ( not ( = ?AUTO_5289 ?AUTO_5291 ) ) ( not ( = ?AUTO_5290 ?AUTO_5291 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5291 )
      ( MAKE-ON-TABLE ?AUTO_5289 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5289 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5292 - BLOCK
    )
    :vars
    (
      ?AUTO_5293 - BLOCK
      ?AUTO_5294 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5292 ?AUTO_5293 ) ( not ( = ?AUTO_5292 ?AUTO_5293 ) ) ( not ( = ?AUTO_5292 ?AUTO_5294 ) ) ( not ( = ?AUTO_5293 ?AUTO_5294 ) ) ( ON ?AUTO_5294 ?AUTO_5292 ) ( CLEAR ?AUTO_5294 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5294 ?AUTO_5292 )
      ( MAKE-ON-TABLE ?AUTO_5292 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5292 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5295 - BLOCK
    )
    :vars
    (
      ?AUTO_5296 - BLOCK
      ?AUTO_5297 - BLOCK
      ?AUTO_5298 - BLOCK
      ?AUTO_5299 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5295 ?AUTO_5296 ) ( not ( = ?AUTO_5295 ?AUTO_5296 ) ) ( not ( = ?AUTO_5295 ?AUTO_5297 ) ) ( not ( = ?AUTO_5296 ?AUTO_5297 ) ) ( ON ?AUTO_5297 ?AUTO_5295 ) ( CLEAR ?AUTO_5297 ) ( HOLDING ?AUTO_5298 ) ( CLEAR ?AUTO_5299 ) ( not ( = ?AUTO_5295 ?AUTO_5298 ) ) ( not ( = ?AUTO_5295 ?AUTO_5299 ) ) ( not ( = ?AUTO_5296 ?AUTO_5298 ) ) ( not ( = ?AUTO_5296 ?AUTO_5299 ) ) ( not ( = ?AUTO_5297 ?AUTO_5298 ) ) ( not ( = ?AUTO_5297 ?AUTO_5299 ) ) ( not ( = ?AUTO_5298 ?AUTO_5299 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5298 ?AUTO_5299 )
      ( MAKE-ON-TABLE ?AUTO_5295 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5295 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5304 - BLOCK
    )
    :vars
    (
      ?AUTO_5305 - BLOCK
      ?AUTO_5306 - BLOCK
      ?AUTO_5307 - BLOCK
      ?AUTO_5308 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5304 ?AUTO_5305 ) ( not ( = ?AUTO_5304 ?AUTO_5305 ) ) ( not ( = ?AUTO_5304 ?AUTO_5306 ) ) ( not ( = ?AUTO_5305 ?AUTO_5306 ) ) ( ON ?AUTO_5306 ?AUTO_5304 ) ( CLEAR ?AUTO_5307 ) ( not ( = ?AUTO_5304 ?AUTO_5308 ) ) ( not ( = ?AUTO_5304 ?AUTO_5307 ) ) ( not ( = ?AUTO_5305 ?AUTO_5308 ) ) ( not ( = ?AUTO_5305 ?AUTO_5307 ) ) ( not ( = ?AUTO_5306 ?AUTO_5308 ) ) ( not ( = ?AUTO_5306 ?AUTO_5307 ) ) ( not ( = ?AUTO_5308 ?AUTO_5307 ) ) ( ON ?AUTO_5308 ?AUTO_5306 ) ( CLEAR ?AUTO_5308 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5308 ?AUTO_5306 )
      ( MAKE-ON-TABLE ?AUTO_5304 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5304 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5309 - BLOCK
    )
    :vars
    (
      ?AUTO_5311 - BLOCK
      ?AUTO_5310 - BLOCK
      ?AUTO_5312 - BLOCK
      ?AUTO_5313 - BLOCK
      ?AUTO_5314 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5309 ?AUTO_5311 ) ( not ( = ?AUTO_5309 ?AUTO_5311 ) ) ( not ( = ?AUTO_5309 ?AUTO_5310 ) ) ( not ( = ?AUTO_5311 ?AUTO_5310 ) ) ( ON ?AUTO_5310 ?AUTO_5309 ) ( CLEAR ?AUTO_5312 ) ( not ( = ?AUTO_5309 ?AUTO_5313 ) ) ( not ( = ?AUTO_5309 ?AUTO_5312 ) ) ( not ( = ?AUTO_5311 ?AUTO_5313 ) ) ( not ( = ?AUTO_5311 ?AUTO_5312 ) ) ( not ( = ?AUTO_5310 ?AUTO_5313 ) ) ( not ( = ?AUTO_5310 ?AUTO_5312 ) ) ( not ( = ?AUTO_5313 ?AUTO_5312 ) ) ( ON ?AUTO_5313 ?AUTO_5310 ) ( CLEAR ?AUTO_5313 ) ( HOLDING ?AUTO_5314 ) ( not ( = ?AUTO_5309 ?AUTO_5314 ) ) ( not ( = ?AUTO_5311 ?AUTO_5314 ) ) ( not ( = ?AUTO_5310 ?AUTO_5314 ) ) ( not ( = ?AUTO_5312 ?AUTO_5314 ) ) ( not ( = ?AUTO_5313 ?AUTO_5314 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5314 )
      ( MAKE-ON-TABLE ?AUTO_5309 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5309 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5315 - BLOCK
    )
    :vars
    (
      ?AUTO_5317 - BLOCK
      ?AUTO_5318 - BLOCK
      ?AUTO_5320 - BLOCK
      ?AUTO_5316 - BLOCK
      ?AUTO_5319 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5315 ?AUTO_5317 ) ( not ( = ?AUTO_5315 ?AUTO_5317 ) ) ( not ( = ?AUTO_5315 ?AUTO_5318 ) ) ( not ( = ?AUTO_5317 ?AUTO_5318 ) ) ( ON ?AUTO_5318 ?AUTO_5315 ) ( CLEAR ?AUTO_5320 ) ( not ( = ?AUTO_5315 ?AUTO_5316 ) ) ( not ( = ?AUTO_5315 ?AUTO_5320 ) ) ( not ( = ?AUTO_5317 ?AUTO_5316 ) ) ( not ( = ?AUTO_5317 ?AUTO_5320 ) ) ( not ( = ?AUTO_5318 ?AUTO_5316 ) ) ( not ( = ?AUTO_5318 ?AUTO_5320 ) ) ( not ( = ?AUTO_5316 ?AUTO_5320 ) ) ( ON ?AUTO_5316 ?AUTO_5318 ) ( not ( = ?AUTO_5315 ?AUTO_5319 ) ) ( not ( = ?AUTO_5317 ?AUTO_5319 ) ) ( not ( = ?AUTO_5318 ?AUTO_5319 ) ) ( not ( = ?AUTO_5320 ?AUTO_5319 ) ) ( not ( = ?AUTO_5316 ?AUTO_5319 ) ) ( ON ?AUTO_5319 ?AUTO_5316 ) ( CLEAR ?AUTO_5319 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5319 ?AUTO_5316 )
      ( MAKE-ON-TABLE ?AUTO_5315 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5315 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5323 - BLOCK
      ?AUTO_5324 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5323 ) ( CLEAR ?AUTO_5324 ) ( not ( = ?AUTO_5323 ?AUTO_5324 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5323 ?AUTO_5324 )
      ( MAKE-ON-VERIFY ?AUTO_5323 ?AUTO_5324 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5325 - BLOCK
      ?AUTO_5326 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5326 ) ( not ( = ?AUTO_5325 ?AUTO_5326 ) ) ( ON-TABLE ?AUTO_5325 ) ( CLEAR ?AUTO_5325 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_5325 )
      ( MAKE-ON ?AUTO_5325 ?AUTO_5326 )
      ( MAKE-ON-VERIFY ?AUTO_5325 ?AUTO_5326 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5327 - BLOCK
      ?AUTO_5328 - BLOCK
    )
    :vars
    (
      ?AUTO_5329 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5328 ) ( not ( = ?AUTO_5327 ?AUTO_5328 ) ) ( ON-TABLE ?AUTO_5327 ) ( CLEAR ?AUTO_5327 ) ( HOLDING ?AUTO_5329 ) ( not ( = ?AUTO_5327 ?AUTO_5329 ) ) ( not ( = ?AUTO_5328 ?AUTO_5329 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5329 )
      ( MAKE-ON ?AUTO_5327 ?AUTO_5328 )
      ( MAKE-ON-VERIFY ?AUTO_5327 ?AUTO_5328 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5330 - BLOCK
      ?AUTO_5331 - BLOCK
    )
    :vars
    (
      ?AUTO_5332 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5330 ?AUTO_5331 ) ) ( ON-TABLE ?AUTO_5330 ) ( CLEAR ?AUTO_5330 ) ( not ( = ?AUTO_5330 ?AUTO_5332 ) ) ( not ( = ?AUTO_5331 ?AUTO_5332 ) ) ( ON ?AUTO_5332 ?AUTO_5331 ) ( CLEAR ?AUTO_5332 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5332 ?AUTO_5331 )
      ( MAKE-ON ?AUTO_5330 ?AUTO_5331 )
      ( MAKE-ON-VERIFY ?AUTO_5330 ?AUTO_5331 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5333 - BLOCK
      ?AUTO_5334 - BLOCK
    )
    :vars
    (
      ?AUTO_5335 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5333 ?AUTO_5334 ) ) ( not ( = ?AUTO_5333 ?AUTO_5335 ) ) ( not ( = ?AUTO_5334 ?AUTO_5335 ) ) ( ON ?AUTO_5335 ?AUTO_5334 ) ( CLEAR ?AUTO_5335 ) ( HOLDING ?AUTO_5333 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5333 )
      ( MAKE-ON ?AUTO_5333 ?AUTO_5334 )
      ( MAKE-ON-VERIFY ?AUTO_5333 ?AUTO_5334 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5336 - BLOCK
      ?AUTO_5337 - BLOCK
    )
    :vars
    (
      ?AUTO_5338 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5336 ?AUTO_5337 ) ) ( not ( = ?AUTO_5336 ?AUTO_5338 ) ) ( not ( = ?AUTO_5337 ?AUTO_5338 ) ) ( ON ?AUTO_5338 ?AUTO_5337 ) ( ON ?AUTO_5336 ?AUTO_5338 ) ( CLEAR ?AUTO_5336 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5336 ?AUTO_5338 )
      ( MAKE-ON ?AUTO_5336 ?AUTO_5337 )
      ( MAKE-ON-VERIFY ?AUTO_5336 ?AUTO_5337 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5339 - BLOCK
      ?AUTO_5340 - BLOCK
    )
    :vars
    (
      ?AUTO_5341 - BLOCK
      ?AUTO_5342 - BLOCK
      ?AUTO_5343 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5339 ?AUTO_5340 ) ) ( not ( = ?AUTO_5339 ?AUTO_5341 ) ) ( not ( = ?AUTO_5340 ?AUTO_5341 ) ) ( ON ?AUTO_5341 ?AUTO_5340 ) ( ON ?AUTO_5339 ?AUTO_5341 ) ( CLEAR ?AUTO_5339 ) ( HOLDING ?AUTO_5342 ) ( CLEAR ?AUTO_5343 ) ( not ( = ?AUTO_5339 ?AUTO_5342 ) ) ( not ( = ?AUTO_5339 ?AUTO_5343 ) ) ( not ( = ?AUTO_5340 ?AUTO_5342 ) ) ( not ( = ?AUTO_5340 ?AUTO_5343 ) ) ( not ( = ?AUTO_5341 ?AUTO_5342 ) ) ( not ( = ?AUTO_5341 ?AUTO_5343 ) ) ( not ( = ?AUTO_5342 ?AUTO_5343 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5342 ?AUTO_5343 )
      ( MAKE-ON ?AUTO_5339 ?AUTO_5340 )
      ( MAKE-ON-VERIFY ?AUTO_5339 ?AUTO_5340 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5352 - BLOCK
      ?AUTO_5353 - BLOCK
    )
    :vars
    (
      ?AUTO_5354 - BLOCK
      ?AUTO_5356 - BLOCK
      ?AUTO_5355 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5352 ?AUTO_5353 ) ) ( not ( = ?AUTO_5352 ?AUTO_5354 ) ) ( not ( = ?AUTO_5353 ?AUTO_5354 ) ) ( ON ?AUTO_5354 ?AUTO_5353 ) ( ON ?AUTO_5352 ?AUTO_5354 ) ( CLEAR ?AUTO_5356 ) ( not ( = ?AUTO_5352 ?AUTO_5355 ) ) ( not ( = ?AUTO_5352 ?AUTO_5356 ) ) ( not ( = ?AUTO_5353 ?AUTO_5355 ) ) ( not ( = ?AUTO_5353 ?AUTO_5356 ) ) ( not ( = ?AUTO_5354 ?AUTO_5355 ) ) ( not ( = ?AUTO_5354 ?AUTO_5356 ) ) ( not ( = ?AUTO_5355 ?AUTO_5356 ) ) ( ON ?AUTO_5355 ?AUTO_5352 ) ( CLEAR ?AUTO_5355 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5355 ?AUTO_5352 )
      ( MAKE-ON ?AUTO_5352 ?AUTO_5353 )
      ( MAKE-ON-VERIFY ?AUTO_5352 ?AUTO_5353 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5357 - BLOCK
      ?AUTO_5358 - BLOCK
    )
    :vars
    (
      ?AUTO_5360 - BLOCK
      ?AUTO_5361 - BLOCK
      ?AUTO_5359 - BLOCK
      ?AUTO_5362 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5357 ?AUTO_5358 ) ) ( not ( = ?AUTO_5357 ?AUTO_5360 ) ) ( not ( = ?AUTO_5358 ?AUTO_5360 ) ) ( ON ?AUTO_5360 ?AUTO_5358 ) ( ON ?AUTO_5357 ?AUTO_5360 ) ( CLEAR ?AUTO_5361 ) ( not ( = ?AUTO_5357 ?AUTO_5359 ) ) ( not ( = ?AUTO_5357 ?AUTO_5361 ) ) ( not ( = ?AUTO_5358 ?AUTO_5359 ) ) ( not ( = ?AUTO_5358 ?AUTO_5361 ) ) ( not ( = ?AUTO_5360 ?AUTO_5359 ) ) ( not ( = ?AUTO_5360 ?AUTO_5361 ) ) ( not ( = ?AUTO_5359 ?AUTO_5361 ) ) ( ON ?AUTO_5359 ?AUTO_5357 ) ( CLEAR ?AUTO_5359 ) ( HOLDING ?AUTO_5362 ) ( not ( = ?AUTO_5357 ?AUTO_5362 ) ) ( not ( = ?AUTO_5358 ?AUTO_5362 ) ) ( not ( = ?AUTO_5360 ?AUTO_5362 ) ) ( not ( = ?AUTO_5361 ?AUTO_5362 ) ) ( not ( = ?AUTO_5359 ?AUTO_5362 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5362 )
      ( MAKE-ON ?AUTO_5357 ?AUTO_5358 )
      ( MAKE-ON-VERIFY ?AUTO_5357 ?AUTO_5358 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5363 - BLOCK
      ?AUTO_5364 - BLOCK
    )
    :vars
    (
      ?AUTO_5365 - BLOCK
      ?AUTO_5367 - BLOCK
      ?AUTO_5366 - BLOCK
      ?AUTO_5368 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5363 ?AUTO_5364 ) ) ( not ( = ?AUTO_5363 ?AUTO_5365 ) ) ( not ( = ?AUTO_5364 ?AUTO_5365 ) ) ( ON ?AUTO_5365 ?AUTO_5364 ) ( ON ?AUTO_5363 ?AUTO_5365 ) ( CLEAR ?AUTO_5367 ) ( not ( = ?AUTO_5363 ?AUTO_5366 ) ) ( not ( = ?AUTO_5363 ?AUTO_5367 ) ) ( not ( = ?AUTO_5364 ?AUTO_5366 ) ) ( not ( = ?AUTO_5364 ?AUTO_5367 ) ) ( not ( = ?AUTO_5365 ?AUTO_5366 ) ) ( not ( = ?AUTO_5365 ?AUTO_5367 ) ) ( not ( = ?AUTO_5366 ?AUTO_5367 ) ) ( ON ?AUTO_5366 ?AUTO_5363 ) ( not ( = ?AUTO_5363 ?AUTO_5368 ) ) ( not ( = ?AUTO_5364 ?AUTO_5368 ) ) ( not ( = ?AUTO_5365 ?AUTO_5368 ) ) ( not ( = ?AUTO_5367 ?AUTO_5368 ) ) ( not ( = ?AUTO_5366 ?AUTO_5368 ) ) ( ON ?AUTO_5368 ?AUTO_5366 ) ( CLEAR ?AUTO_5368 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5368 ?AUTO_5366 )
      ( MAKE-ON ?AUTO_5363 ?AUTO_5364 )
      ( MAKE-ON-VERIFY ?AUTO_5363 ?AUTO_5364 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5371 - BLOCK
      ?AUTO_5372 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5371 ) ( CLEAR ?AUTO_5372 ) ( not ( = ?AUTO_5371 ?AUTO_5372 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5371 ?AUTO_5372 )
      ( MAKE-ON-VERIFY ?AUTO_5371 ?AUTO_5372 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5373 - BLOCK
      ?AUTO_5374 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5374 ) ( not ( = ?AUTO_5373 ?AUTO_5374 ) ) ( ON-TABLE ?AUTO_5373 ) ( CLEAR ?AUTO_5373 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_5373 )
      ( MAKE-ON ?AUTO_5373 ?AUTO_5374 )
      ( MAKE-ON-VERIFY ?AUTO_5373 ?AUTO_5374 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5375 - BLOCK
      ?AUTO_5376 - BLOCK
    )
    :vars
    (
      ?AUTO_5377 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5375 ?AUTO_5376 ) ) ( ON-TABLE ?AUTO_5375 ) ( CLEAR ?AUTO_5375 ) ( HOLDING ?AUTO_5376 ) ( CLEAR ?AUTO_5377 ) ( not ( = ?AUTO_5375 ?AUTO_5377 ) ) ( not ( = ?AUTO_5376 ?AUTO_5377 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5376 ?AUTO_5377 )
      ( MAKE-ON ?AUTO_5375 ?AUTO_5376 )
      ( MAKE-ON-VERIFY ?AUTO_5375 ?AUTO_5376 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5382 - BLOCK
      ?AUTO_5383 - BLOCK
    )
    :vars
    (
      ?AUTO_5384 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5383 ) ( not ( = ?AUTO_5382 ?AUTO_5383 ) ) ( ON ?AUTO_5382 ?AUTO_5384 ) ( CLEAR ?AUTO_5382 ) ( HAND-EMPTY ) ( not ( = ?AUTO_5382 ?AUTO_5384 ) ) ( not ( = ?AUTO_5383 ?AUTO_5384 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5382 ?AUTO_5384 )
      ( MAKE-ON ?AUTO_5382 ?AUTO_5383 )
      ( MAKE-ON-VERIFY ?AUTO_5382 ?AUTO_5383 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5385 - BLOCK
      ?AUTO_5386 - BLOCK
    )
    :vars
    (
      ?AUTO_5387 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5385 ?AUTO_5386 ) ) ( ON ?AUTO_5385 ?AUTO_5387 ) ( CLEAR ?AUTO_5385 ) ( not ( = ?AUTO_5385 ?AUTO_5387 ) ) ( not ( = ?AUTO_5386 ?AUTO_5387 ) ) ( HOLDING ?AUTO_5386 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5386 )
      ( MAKE-ON ?AUTO_5385 ?AUTO_5386 )
      ( MAKE-ON-VERIFY ?AUTO_5385 ?AUTO_5386 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5388 - BLOCK
      ?AUTO_5389 - BLOCK
    )
    :vars
    (
      ?AUTO_5390 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5388 ?AUTO_5389 ) ) ( ON ?AUTO_5388 ?AUTO_5390 ) ( not ( = ?AUTO_5388 ?AUTO_5390 ) ) ( not ( = ?AUTO_5389 ?AUTO_5390 ) ) ( ON ?AUTO_5389 ?AUTO_5388 ) ( CLEAR ?AUTO_5389 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5389 ?AUTO_5388 )
      ( MAKE-ON ?AUTO_5388 ?AUTO_5389 )
      ( MAKE-ON-VERIFY ?AUTO_5388 ?AUTO_5389 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5391 - BLOCK
      ?AUTO_5392 - BLOCK
    )
    :vars
    (
      ?AUTO_5393 - BLOCK
      ?AUTO_5394 - BLOCK
      ?AUTO_5395 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5391 ?AUTO_5392 ) ) ( ON ?AUTO_5391 ?AUTO_5393 ) ( not ( = ?AUTO_5391 ?AUTO_5393 ) ) ( not ( = ?AUTO_5392 ?AUTO_5393 ) ) ( ON ?AUTO_5392 ?AUTO_5391 ) ( CLEAR ?AUTO_5392 ) ( HOLDING ?AUTO_5394 ) ( CLEAR ?AUTO_5395 ) ( not ( = ?AUTO_5391 ?AUTO_5394 ) ) ( not ( = ?AUTO_5391 ?AUTO_5395 ) ) ( not ( = ?AUTO_5392 ?AUTO_5394 ) ) ( not ( = ?AUTO_5392 ?AUTO_5395 ) ) ( not ( = ?AUTO_5393 ?AUTO_5394 ) ) ( not ( = ?AUTO_5393 ?AUTO_5395 ) ) ( not ( = ?AUTO_5394 ?AUTO_5395 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5394 ?AUTO_5395 )
      ( MAKE-ON ?AUTO_5391 ?AUTO_5392 )
      ( MAKE-ON-VERIFY ?AUTO_5391 ?AUTO_5392 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5404 - BLOCK
      ?AUTO_5405 - BLOCK
    )
    :vars
    (
      ?AUTO_5406 - BLOCK
      ?AUTO_5407 - BLOCK
      ?AUTO_5408 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5404 ?AUTO_5405 ) ) ( ON ?AUTO_5404 ?AUTO_5406 ) ( not ( = ?AUTO_5404 ?AUTO_5406 ) ) ( not ( = ?AUTO_5405 ?AUTO_5406 ) ) ( ON ?AUTO_5405 ?AUTO_5404 ) ( CLEAR ?AUTO_5407 ) ( not ( = ?AUTO_5404 ?AUTO_5408 ) ) ( not ( = ?AUTO_5404 ?AUTO_5407 ) ) ( not ( = ?AUTO_5405 ?AUTO_5408 ) ) ( not ( = ?AUTO_5405 ?AUTO_5407 ) ) ( not ( = ?AUTO_5406 ?AUTO_5408 ) ) ( not ( = ?AUTO_5406 ?AUTO_5407 ) ) ( not ( = ?AUTO_5408 ?AUTO_5407 ) ) ( ON ?AUTO_5408 ?AUTO_5405 ) ( CLEAR ?AUTO_5408 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5408 ?AUTO_5405 )
      ( MAKE-ON ?AUTO_5404 ?AUTO_5405 )
      ( MAKE-ON-VERIFY ?AUTO_5404 ?AUTO_5405 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5409 - BLOCK
      ?AUTO_5410 - BLOCK
    )
    :vars
    (
      ?AUTO_5412 - BLOCK
      ?AUTO_5413 - BLOCK
      ?AUTO_5411 - BLOCK
      ?AUTO_5414 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5409 ?AUTO_5410 ) ) ( ON ?AUTO_5409 ?AUTO_5412 ) ( not ( = ?AUTO_5409 ?AUTO_5412 ) ) ( not ( = ?AUTO_5410 ?AUTO_5412 ) ) ( ON ?AUTO_5410 ?AUTO_5409 ) ( CLEAR ?AUTO_5413 ) ( not ( = ?AUTO_5409 ?AUTO_5411 ) ) ( not ( = ?AUTO_5409 ?AUTO_5413 ) ) ( not ( = ?AUTO_5410 ?AUTO_5411 ) ) ( not ( = ?AUTO_5410 ?AUTO_5413 ) ) ( not ( = ?AUTO_5412 ?AUTO_5411 ) ) ( not ( = ?AUTO_5412 ?AUTO_5413 ) ) ( not ( = ?AUTO_5411 ?AUTO_5413 ) ) ( ON ?AUTO_5411 ?AUTO_5410 ) ( CLEAR ?AUTO_5411 ) ( HOLDING ?AUTO_5414 ) ( not ( = ?AUTO_5409 ?AUTO_5414 ) ) ( not ( = ?AUTO_5410 ?AUTO_5414 ) ) ( not ( = ?AUTO_5412 ?AUTO_5414 ) ) ( not ( = ?AUTO_5413 ?AUTO_5414 ) ) ( not ( = ?AUTO_5411 ?AUTO_5414 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5414 )
      ( MAKE-ON ?AUTO_5409 ?AUTO_5410 )
      ( MAKE-ON-VERIFY ?AUTO_5409 ?AUTO_5410 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5415 - BLOCK
      ?AUTO_5416 - BLOCK
    )
    :vars
    (
      ?AUTO_5417 - BLOCK
      ?AUTO_5419 - BLOCK
      ?AUTO_5418 - BLOCK
      ?AUTO_5420 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5415 ?AUTO_5416 ) ) ( ON ?AUTO_5415 ?AUTO_5417 ) ( not ( = ?AUTO_5415 ?AUTO_5417 ) ) ( not ( = ?AUTO_5416 ?AUTO_5417 ) ) ( ON ?AUTO_5416 ?AUTO_5415 ) ( CLEAR ?AUTO_5419 ) ( not ( = ?AUTO_5415 ?AUTO_5418 ) ) ( not ( = ?AUTO_5415 ?AUTO_5419 ) ) ( not ( = ?AUTO_5416 ?AUTO_5418 ) ) ( not ( = ?AUTO_5416 ?AUTO_5419 ) ) ( not ( = ?AUTO_5417 ?AUTO_5418 ) ) ( not ( = ?AUTO_5417 ?AUTO_5419 ) ) ( not ( = ?AUTO_5418 ?AUTO_5419 ) ) ( ON ?AUTO_5418 ?AUTO_5416 ) ( not ( = ?AUTO_5415 ?AUTO_5420 ) ) ( not ( = ?AUTO_5416 ?AUTO_5420 ) ) ( not ( = ?AUTO_5417 ?AUTO_5420 ) ) ( not ( = ?AUTO_5419 ?AUTO_5420 ) ) ( not ( = ?AUTO_5418 ?AUTO_5420 ) ) ( ON ?AUTO_5420 ?AUTO_5418 ) ( CLEAR ?AUTO_5420 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5420 ?AUTO_5418 )
      ( MAKE-ON ?AUTO_5415 ?AUTO_5416 )
      ( MAKE-ON-VERIFY ?AUTO_5415 ?AUTO_5416 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5422 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5422 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5422 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5422 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5423 - BLOCK
    )
    :vars
    (
      ?AUTO_5424 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5423 ?AUTO_5424 ) ( CLEAR ?AUTO_5423 ) ( HAND-EMPTY ) ( not ( = ?AUTO_5423 ?AUTO_5424 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5423 ?AUTO_5424 )
      ( MAKE-ON-TABLE ?AUTO_5423 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5423 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5426 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5426 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5426 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5426 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5427 - BLOCK
    )
    :vars
    (
      ?AUTO_5428 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5427 ?AUTO_5428 ) ( CLEAR ?AUTO_5427 ) ( HAND-EMPTY ) ( not ( = ?AUTO_5427 ?AUTO_5428 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5427 ?AUTO_5428 )
      ( MAKE-ON-TABLE ?AUTO_5427 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5427 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5429 - BLOCK
    )
    :vars
    (
      ?AUTO_5430 - BLOCK
      ?AUTO_5431 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5429 ?AUTO_5430 ) ( CLEAR ?AUTO_5429 ) ( not ( = ?AUTO_5429 ?AUTO_5430 ) ) ( HOLDING ?AUTO_5431 ) ( not ( = ?AUTO_5429 ?AUTO_5431 ) ) ( not ( = ?AUTO_5430 ?AUTO_5431 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5431 )
      ( MAKE-ON-TABLE ?AUTO_5429 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5429 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5435 - BLOCK
      ?AUTO_5436 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5435 ) ( CLEAR ?AUTO_5436 ) ( not ( = ?AUTO_5435 ?AUTO_5436 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5435 ?AUTO_5436 )
      ( MAKE-ON-VERIFY ?AUTO_5435 ?AUTO_5436 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5437 - BLOCK
      ?AUTO_5438 - BLOCK
    )
    :vars
    (
      ?AUTO_5439 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5438 ) ( not ( = ?AUTO_5437 ?AUTO_5438 ) ) ( ON ?AUTO_5437 ?AUTO_5439 ) ( CLEAR ?AUTO_5437 ) ( HAND-EMPTY ) ( not ( = ?AUTO_5437 ?AUTO_5439 ) ) ( not ( = ?AUTO_5438 ?AUTO_5439 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5437 ?AUTO_5439 )
      ( MAKE-ON ?AUTO_5437 ?AUTO_5438 )
      ( MAKE-ON-VERIFY ?AUTO_5437 ?AUTO_5438 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5440 - BLOCK
      ?AUTO_5441 - BLOCK
    )
    :vars
    (
      ?AUTO_5442 - BLOCK
      ?AUTO_5443 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5441 ) ( not ( = ?AUTO_5440 ?AUTO_5441 ) ) ( ON ?AUTO_5440 ?AUTO_5442 ) ( CLEAR ?AUTO_5440 ) ( not ( = ?AUTO_5440 ?AUTO_5442 ) ) ( not ( = ?AUTO_5441 ?AUTO_5442 ) ) ( HOLDING ?AUTO_5443 ) ( not ( = ?AUTO_5440 ?AUTO_5443 ) ) ( not ( = ?AUTO_5441 ?AUTO_5443 ) ) ( not ( = ?AUTO_5442 ?AUTO_5443 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5443 )
      ( MAKE-ON ?AUTO_5440 ?AUTO_5441 )
      ( MAKE-ON-VERIFY ?AUTO_5440 ?AUTO_5441 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5446 - BLOCK
      ?AUTO_5447 - BLOCK
    )
    :vars
    (
      ?AUTO_5448 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5446 ?AUTO_5447 ) ) ( ON ?AUTO_5446 ?AUTO_5448 ) ( CLEAR ?AUTO_5446 ) ( not ( = ?AUTO_5446 ?AUTO_5448 ) ) ( not ( = ?AUTO_5447 ?AUTO_5448 ) ) ( HOLDING ?AUTO_5447 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5447 )
      ( MAKE-ON ?AUTO_5446 ?AUTO_5447 )
      ( MAKE-ON-VERIFY ?AUTO_5446 ?AUTO_5447 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5452 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5452 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5452 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5452 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5453 - BLOCK
    )
    :vars
    (
      ?AUTO_5454 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5453 ?AUTO_5454 ) ( CLEAR ?AUTO_5453 ) ( HAND-EMPTY ) ( not ( = ?AUTO_5453 ?AUTO_5454 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5453 ?AUTO_5454 )
      ( MAKE-ON-TABLE ?AUTO_5453 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5453 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5455 - BLOCK
    )
    :vars
    (
      ?AUTO_5456 - BLOCK
      ?AUTO_5457 - BLOCK
      ?AUTO_5458 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5455 ?AUTO_5456 ) ( CLEAR ?AUTO_5455 ) ( not ( = ?AUTO_5455 ?AUTO_5456 ) ) ( HOLDING ?AUTO_5457 ) ( CLEAR ?AUTO_5458 ) ( not ( = ?AUTO_5455 ?AUTO_5457 ) ) ( not ( = ?AUTO_5455 ?AUTO_5458 ) ) ( not ( = ?AUTO_5456 ?AUTO_5457 ) ) ( not ( = ?AUTO_5456 ?AUTO_5458 ) ) ( not ( = ?AUTO_5457 ?AUTO_5458 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5457 ?AUTO_5458 )
      ( MAKE-ON-TABLE ?AUTO_5455 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5455 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5463 - BLOCK
    )
    :vars
    (
      ?AUTO_5464 - BLOCK
      ?AUTO_5466 - BLOCK
      ?AUTO_5465 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5463 ?AUTO_5464 ) ( not ( = ?AUTO_5463 ?AUTO_5464 ) ) ( CLEAR ?AUTO_5466 ) ( not ( = ?AUTO_5463 ?AUTO_5465 ) ) ( not ( = ?AUTO_5463 ?AUTO_5466 ) ) ( not ( = ?AUTO_5464 ?AUTO_5465 ) ) ( not ( = ?AUTO_5464 ?AUTO_5466 ) ) ( not ( = ?AUTO_5465 ?AUTO_5466 ) ) ( ON ?AUTO_5465 ?AUTO_5463 ) ( CLEAR ?AUTO_5465 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5465 ?AUTO_5463 )
      ( MAKE-ON-TABLE ?AUTO_5463 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5463 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5469 - BLOCK
      ?AUTO_5470 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5469 ) ( CLEAR ?AUTO_5470 ) ( not ( = ?AUTO_5469 ?AUTO_5470 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5469 ?AUTO_5470 )
      ( MAKE-ON-VERIFY ?AUTO_5469 ?AUTO_5470 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5471 - BLOCK
      ?AUTO_5472 - BLOCK
    )
    :vars
    (
      ?AUTO_5473 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5472 ) ( not ( = ?AUTO_5471 ?AUTO_5472 ) ) ( ON ?AUTO_5471 ?AUTO_5473 ) ( CLEAR ?AUTO_5471 ) ( HAND-EMPTY ) ( not ( = ?AUTO_5471 ?AUTO_5473 ) ) ( not ( = ?AUTO_5472 ?AUTO_5473 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5471 ?AUTO_5473 )
      ( MAKE-ON ?AUTO_5471 ?AUTO_5472 )
      ( MAKE-ON-VERIFY ?AUTO_5471 ?AUTO_5472 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5474 - BLOCK
      ?AUTO_5475 - BLOCK
    )
    :vars
    (
      ?AUTO_5476 - BLOCK
      ?AUTO_5477 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5475 ) ( not ( = ?AUTO_5474 ?AUTO_5475 ) ) ( ON ?AUTO_5474 ?AUTO_5476 ) ( CLEAR ?AUTO_5474 ) ( not ( = ?AUTO_5474 ?AUTO_5476 ) ) ( not ( = ?AUTO_5475 ?AUTO_5476 ) ) ( HOLDING ?AUTO_5477 ) ( not ( = ?AUTO_5474 ?AUTO_5477 ) ) ( not ( = ?AUTO_5475 ?AUTO_5477 ) ) ( not ( = ?AUTO_5476 ?AUTO_5477 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5477 )
      ( MAKE-ON ?AUTO_5474 ?AUTO_5475 )
      ( MAKE-ON-VERIFY ?AUTO_5474 ?AUTO_5475 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5478 - BLOCK
      ?AUTO_5479 - BLOCK
    )
    :vars
    (
      ?AUTO_5480 - BLOCK
      ?AUTO_5481 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5479 ) ( not ( = ?AUTO_5478 ?AUTO_5479 ) ) ( ON ?AUTO_5478 ?AUTO_5480 ) ( not ( = ?AUTO_5478 ?AUTO_5480 ) ) ( not ( = ?AUTO_5479 ?AUTO_5480 ) ) ( not ( = ?AUTO_5478 ?AUTO_5481 ) ) ( not ( = ?AUTO_5479 ?AUTO_5481 ) ) ( not ( = ?AUTO_5480 ?AUTO_5481 ) ) ( ON ?AUTO_5481 ?AUTO_5478 ) ( CLEAR ?AUTO_5481 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5481 ?AUTO_5478 )
      ( MAKE-ON ?AUTO_5478 ?AUTO_5479 )
      ( MAKE-ON-VERIFY ?AUTO_5478 ?AUTO_5479 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5482 - BLOCK
      ?AUTO_5483 - BLOCK
    )
    :vars
    (
      ?AUTO_5484 - BLOCK
      ?AUTO_5485 - BLOCK
      ?AUTO_5486 - BLOCK
      ?AUTO_5487 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5483 ) ( not ( = ?AUTO_5482 ?AUTO_5483 ) ) ( ON ?AUTO_5482 ?AUTO_5484 ) ( not ( = ?AUTO_5482 ?AUTO_5484 ) ) ( not ( = ?AUTO_5483 ?AUTO_5484 ) ) ( not ( = ?AUTO_5482 ?AUTO_5485 ) ) ( not ( = ?AUTO_5483 ?AUTO_5485 ) ) ( not ( = ?AUTO_5484 ?AUTO_5485 ) ) ( ON ?AUTO_5485 ?AUTO_5482 ) ( CLEAR ?AUTO_5485 ) ( HOLDING ?AUTO_5486 ) ( CLEAR ?AUTO_5487 ) ( not ( = ?AUTO_5482 ?AUTO_5486 ) ) ( not ( = ?AUTO_5482 ?AUTO_5487 ) ) ( not ( = ?AUTO_5483 ?AUTO_5486 ) ) ( not ( = ?AUTO_5483 ?AUTO_5487 ) ) ( not ( = ?AUTO_5484 ?AUTO_5486 ) ) ( not ( = ?AUTO_5484 ?AUTO_5487 ) ) ( not ( = ?AUTO_5485 ?AUTO_5486 ) ) ( not ( = ?AUTO_5485 ?AUTO_5487 ) ) ( not ( = ?AUTO_5486 ?AUTO_5487 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5486 ?AUTO_5487 )
      ( MAKE-ON ?AUTO_5482 ?AUTO_5483 )
      ( MAKE-ON-VERIFY ?AUTO_5482 ?AUTO_5483 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5490 - BLOCK
      ?AUTO_5491 - BLOCK
    )
    :vars
    (
      ?AUTO_5493 - BLOCK
      ?AUTO_5492 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5490 ?AUTO_5491 ) ) ( ON ?AUTO_5490 ?AUTO_5493 ) ( not ( = ?AUTO_5490 ?AUTO_5493 ) ) ( not ( = ?AUTO_5491 ?AUTO_5493 ) ) ( not ( = ?AUTO_5490 ?AUTO_5492 ) ) ( not ( = ?AUTO_5491 ?AUTO_5492 ) ) ( not ( = ?AUTO_5493 ?AUTO_5492 ) ) ( ON ?AUTO_5492 ?AUTO_5490 ) ( CLEAR ?AUTO_5492 ) ( HOLDING ?AUTO_5491 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5491 )
      ( MAKE-ON ?AUTO_5490 ?AUTO_5491 )
      ( MAKE-ON-VERIFY ?AUTO_5490 ?AUTO_5491 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5498 - BLOCK
      ?AUTO_5499 - BLOCK
    )
    :vars
    (
      ?AUTO_5503 - BLOCK
      ?AUTO_5500 - BLOCK
      ?AUTO_5501 - BLOCK
      ?AUTO_5502 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5499 ) ( not ( = ?AUTO_5498 ?AUTO_5499 ) ) ( ON ?AUTO_5498 ?AUTO_5503 ) ( not ( = ?AUTO_5498 ?AUTO_5503 ) ) ( not ( = ?AUTO_5499 ?AUTO_5503 ) ) ( not ( = ?AUTO_5498 ?AUTO_5500 ) ) ( not ( = ?AUTO_5499 ?AUTO_5500 ) ) ( not ( = ?AUTO_5503 ?AUTO_5500 ) ) ( ON ?AUTO_5500 ?AUTO_5498 ) ( CLEAR ?AUTO_5501 ) ( not ( = ?AUTO_5498 ?AUTO_5502 ) ) ( not ( = ?AUTO_5498 ?AUTO_5501 ) ) ( not ( = ?AUTO_5499 ?AUTO_5502 ) ) ( not ( = ?AUTO_5499 ?AUTO_5501 ) ) ( not ( = ?AUTO_5503 ?AUTO_5502 ) ) ( not ( = ?AUTO_5503 ?AUTO_5501 ) ) ( not ( = ?AUTO_5500 ?AUTO_5502 ) ) ( not ( = ?AUTO_5500 ?AUTO_5501 ) ) ( not ( = ?AUTO_5502 ?AUTO_5501 ) ) ( ON ?AUTO_5502 ?AUTO_5500 ) ( CLEAR ?AUTO_5502 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5502 ?AUTO_5500 )
      ( MAKE-ON ?AUTO_5498 ?AUTO_5499 )
      ( MAKE-ON-VERIFY ?AUTO_5498 ?AUTO_5499 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5506 - BLOCK
      ?AUTO_5507 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5506 ) ( CLEAR ?AUTO_5507 ) ( not ( = ?AUTO_5506 ?AUTO_5507 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5506 ?AUTO_5507 )
      ( MAKE-ON-VERIFY ?AUTO_5506 ?AUTO_5507 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5508 - BLOCK
      ?AUTO_5509 - BLOCK
    )
    :vars
    (
      ?AUTO_5510 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5509 ) ( not ( = ?AUTO_5508 ?AUTO_5509 ) ) ( ON ?AUTO_5508 ?AUTO_5510 ) ( CLEAR ?AUTO_5508 ) ( HAND-EMPTY ) ( not ( = ?AUTO_5508 ?AUTO_5510 ) ) ( not ( = ?AUTO_5509 ?AUTO_5510 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5508 ?AUTO_5510 )
      ( MAKE-ON ?AUTO_5508 ?AUTO_5509 )
      ( MAKE-ON-VERIFY ?AUTO_5508 ?AUTO_5509 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5511 - BLOCK
      ?AUTO_5512 - BLOCK
    )
    :vars
    (
      ?AUTO_5513 - BLOCK
      ?AUTO_5514 - BLOCK
      ?AUTO_5515 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5512 ) ( not ( = ?AUTO_5511 ?AUTO_5512 ) ) ( ON ?AUTO_5511 ?AUTO_5513 ) ( CLEAR ?AUTO_5511 ) ( not ( = ?AUTO_5511 ?AUTO_5513 ) ) ( not ( = ?AUTO_5512 ?AUTO_5513 ) ) ( HOLDING ?AUTO_5514 ) ( CLEAR ?AUTO_5515 ) ( not ( = ?AUTO_5511 ?AUTO_5514 ) ) ( not ( = ?AUTO_5511 ?AUTO_5515 ) ) ( not ( = ?AUTO_5512 ?AUTO_5514 ) ) ( not ( = ?AUTO_5512 ?AUTO_5515 ) ) ( not ( = ?AUTO_5513 ?AUTO_5514 ) ) ( not ( = ?AUTO_5513 ?AUTO_5515 ) ) ( not ( = ?AUTO_5514 ?AUTO_5515 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5514 ?AUTO_5515 )
      ( MAKE-ON ?AUTO_5511 ?AUTO_5512 )
      ( MAKE-ON-VERIFY ?AUTO_5511 ?AUTO_5512 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5516 - BLOCK
      ?AUTO_5517 - BLOCK
    )
    :vars
    (
      ?AUTO_5518 - BLOCK
      ?AUTO_5519 - BLOCK
      ?AUTO_5520 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5516 ?AUTO_5517 ) ) ( ON ?AUTO_5516 ?AUTO_5518 ) ( CLEAR ?AUTO_5516 ) ( not ( = ?AUTO_5516 ?AUTO_5518 ) ) ( not ( = ?AUTO_5517 ?AUTO_5518 ) ) ( CLEAR ?AUTO_5519 ) ( not ( = ?AUTO_5516 ?AUTO_5520 ) ) ( not ( = ?AUTO_5516 ?AUTO_5519 ) ) ( not ( = ?AUTO_5517 ?AUTO_5520 ) ) ( not ( = ?AUTO_5517 ?AUTO_5519 ) ) ( not ( = ?AUTO_5518 ?AUTO_5520 ) ) ( not ( = ?AUTO_5518 ?AUTO_5519 ) ) ( not ( = ?AUTO_5520 ?AUTO_5519 ) ) ( ON ?AUTO_5520 ?AUTO_5517 ) ( CLEAR ?AUTO_5520 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5520 ?AUTO_5517 )
      ( MAKE-ON ?AUTO_5516 ?AUTO_5517 )
      ( MAKE-ON-VERIFY ?AUTO_5516 ?AUTO_5517 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5521 - BLOCK
      ?AUTO_5522 - BLOCK
    )
    :vars
    (
      ?AUTO_5525 - BLOCK
      ?AUTO_5523 - BLOCK
      ?AUTO_5524 - BLOCK
      ?AUTO_5526 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5521 ?AUTO_5522 ) ) ( ON ?AUTO_5521 ?AUTO_5525 ) ( CLEAR ?AUTO_5521 ) ( not ( = ?AUTO_5521 ?AUTO_5525 ) ) ( not ( = ?AUTO_5522 ?AUTO_5525 ) ) ( CLEAR ?AUTO_5523 ) ( not ( = ?AUTO_5521 ?AUTO_5524 ) ) ( not ( = ?AUTO_5521 ?AUTO_5523 ) ) ( not ( = ?AUTO_5522 ?AUTO_5524 ) ) ( not ( = ?AUTO_5522 ?AUTO_5523 ) ) ( not ( = ?AUTO_5525 ?AUTO_5524 ) ) ( not ( = ?AUTO_5525 ?AUTO_5523 ) ) ( not ( = ?AUTO_5524 ?AUTO_5523 ) ) ( ON ?AUTO_5524 ?AUTO_5522 ) ( CLEAR ?AUTO_5524 ) ( HOLDING ?AUTO_5526 ) ( not ( = ?AUTO_5521 ?AUTO_5526 ) ) ( not ( = ?AUTO_5522 ?AUTO_5526 ) ) ( not ( = ?AUTO_5525 ?AUTO_5526 ) ) ( not ( = ?AUTO_5523 ?AUTO_5526 ) ) ( not ( = ?AUTO_5524 ?AUTO_5526 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5526 )
      ( MAKE-ON ?AUTO_5521 ?AUTO_5522 )
      ( MAKE-ON-VERIFY ?AUTO_5521 ?AUTO_5522 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5527 - BLOCK
      ?AUTO_5528 - BLOCK
    )
    :vars
    (
      ?AUTO_5531 - BLOCK
      ?AUTO_5529 - BLOCK
      ?AUTO_5530 - BLOCK
      ?AUTO_5532 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5527 ?AUTO_5528 ) ) ( ON ?AUTO_5527 ?AUTO_5531 ) ( CLEAR ?AUTO_5527 ) ( not ( = ?AUTO_5527 ?AUTO_5531 ) ) ( not ( = ?AUTO_5528 ?AUTO_5531 ) ) ( CLEAR ?AUTO_5529 ) ( not ( = ?AUTO_5527 ?AUTO_5530 ) ) ( not ( = ?AUTO_5527 ?AUTO_5529 ) ) ( not ( = ?AUTO_5528 ?AUTO_5530 ) ) ( not ( = ?AUTO_5528 ?AUTO_5529 ) ) ( not ( = ?AUTO_5531 ?AUTO_5530 ) ) ( not ( = ?AUTO_5531 ?AUTO_5529 ) ) ( not ( = ?AUTO_5530 ?AUTO_5529 ) ) ( ON ?AUTO_5530 ?AUTO_5528 ) ( not ( = ?AUTO_5527 ?AUTO_5532 ) ) ( not ( = ?AUTO_5528 ?AUTO_5532 ) ) ( not ( = ?AUTO_5531 ?AUTO_5532 ) ) ( not ( = ?AUTO_5529 ?AUTO_5532 ) ) ( not ( = ?AUTO_5530 ?AUTO_5532 ) ) ( ON ?AUTO_5532 ?AUTO_5530 ) ( CLEAR ?AUTO_5532 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5532 ?AUTO_5530 )
      ( MAKE-ON ?AUTO_5527 ?AUTO_5528 )
      ( MAKE-ON-VERIFY ?AUTO_5527 ?AUTO_5528 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5533 - BLOCK
      ?AUTO_5534 - BLOCK
    )
    :vars
    (
      ?AUTO_5537 - BLOCK
      ?AUTO_5538 - BLOCK
      ?AUTO_5536 - BLOCK
      ?AUTO_5535 - BLOCK
      ?AUTO_5539 - BLOCK
      ?AUTO_5540 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5533 ?AUTO_5534 ) ) ( ON ?AUTO_5533 ?AUTO_5537 ) ( CLEAR ?AUTO_5533 ) ( not ( = ?AUTO_5533 ?AUTO_5537 ) ) ( not ( = ?AUTO_5534 ?AUTO_5537 ) ) ( CLEAR ?AUTO_5538 ) ( not ( = ?AUTO_5533 ?AUTO_5536 ) ) ( not ( = ?AUTO_5533 ?AUTO_5538 ) ) ( not ( = ?AUTO_5534 ?AUTO_5536 ) ) ( not ( = ?AUTO_5534 ?AUTO_5538 ) ) ( not ( = ?AUTO_5537 ?AUTO_5536 ) ) ( not ( = ?AUTO_5537 ?AUTO_5538 ) ) ( not ( = ?AUTO_5536 ?AUTO_5538 ) ) ( ON ?AUTO_5536 ?AUTO_5534 ) ( not ( = ?AUTO_5533 ?AUTO_5535 ) ) ( not ( = ?AUTO_5534 ?AUTO_5535 ) ) ( not ( = ?AUTO_5537 ?AUTO_5535 ) ) ( not ( = ?AUTO_5538 ?AUTO_5535 ) ) ( not ( = ?AUTO_5536 ?AUTO_5535 ) ) ( ON ?AUTO_5535 ?AUTO_5536 ) ( CLEAR ?AUTO_5535 ) ( HOLDING ?AUTO_5539 ) ( CLEAR ?AUTO_5540 ) ( not ( = ?AUTO_5533 ?AUTO_5539 ) ) ( not ( = ?AUTO_5533 ?AUTO_5540 ) ) ( not ( = ?AUTO_5534 ?AUTO_5539 ) ) ( not ( = ?AUTO_5534 ?AUTO_5540 ) ) ( not ( = ?AUTO_5537 ?AUTO_5539 ) ) ( not ( = ?AUTO_5537 ?AUTO_5540 ) ) ( not ( = ?AUTO_5538 ?AUTO_5539 ) ) ( not ( = ?AUTO_5538 ?AUTO_5540 ) ) ( not ( = ?AUTO_5536 ?AUTO_5539 ) ) ( not ( = ?AUTO_5536 ?AUTO_5540 ) ) ( not ( = ?AUTO_5535 ?AUTO_5539 ) ) ( not ( = ?AUTO_5535 ?AUTO_5540 ) ) ( not ( = ?AUTO_5539 ?AUTO_5540 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5539 ?AUTO_5540 )
      ( MAKE-ON ?AUTO_5533 ?AUTO_5534 )
      ( MAKE-ON-VERIFY ?AUTO_5533 ?AUTO_5534 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5541 - BLOCK
      ?AUTO_5542 - BLOCK
    )
    :vars
    (
      ?AUTO_5548 - BLOCK
      ?AUTO_5543 - BLOCK
      ?AUTO_5546 - BLOCK
      ?AUTO_5547 - BLOCK
      ?AUTO_5544 - BLOCK
      ?AUTO_5545 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5541 ?AUTO_5542 ) ) ( ON ?AUTO_5541 ?AUTO_5548 ) ( not ( = ?AUTO_5541 ?AUTO_5548 ) ) ( not ( = ?AUTO_5542 ?AUTO_5548 ) ) ( CLEAR ?AUTO_5543 ) ( not ( = ?AUTO_5541 ?AUTO_5546 ) ) ( not ( = ?AUTO_5541 ?AUTO_5543 ) ) ( not ( = ?AUTO_5542 ?AUTO_5546 ) ) ( not ( = ?AUTO_5542 ?AUTO_5543 ) ) ( not ( = ?AUTO_5548 ?AUTO_5546 ) ) ( not ( = ?AUTO_5548 ?AUTO_5543 ) ) ( not ( = ?AUTO_5546 ?AUTO_5543 ) ) ( ON ?AUTO_5546 ?AUTO_5542 ) ( not ( = ?AUTO_5541 ?AUTO_5547 ) ) ( not ( = ?AUTO_5542 ?AUTO_5547 ) ) ( not ( = ?AUTO_5548 ?AUTO_5547 ) ) ( not ( = ?AUTO_5543 ?AUTO_5547 ) ) ( not ( = ?AUTO_5546 ?AUTO_5547 ) ) ( ON ?AUTO_5547 ?AUTO_5546 ) ( CLEAR ?AUTO_5547 ) ( CLEAR ?AUTO_5544 ) ( not ( = ?AUTO_5541 ?AUTO_5545 ) ) ( not ( = ?AUTO_5541 ?AUTO_5544 ) ) ( not ( = ?AUTO_5542 ?AUTO_5545 ) ) ( not ( = ?AUTO_5542 ?AUTO_5544 ) ) ( not ( = ?AUTO_5548 ?AUTO_5545 ) ) ( not ( = ?AUTO_5548 ?AUTO_5544 ) ) ( not ( = ?AUTO_5543 ?AUTO_5545 ) ) ( not ( = ?AUTO_5543 ?AUTO_5544 ) ) ( not ( = ?AUTO_5546 ?AUTO_5545 ) ) ( not ( = ?AUTO_5546 ?AUTO_5544 ) ) ( not ( = ?AUTO_5547 ?AUTO_5545 ) ) ( not ( = ?AUTO_5547 ?AUTO_5544 ) ) ( not ( = ?AUTO_5545 ?AUTO_5544 ) ) ( ON ?AUTO_5545 ?AUTO_5541 ) ( CLEAR ?AUTO_5545 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5545 ?AUTO_5541 )
      ( MAKE-ON ?AUTO_5541 ?AUTO_5542 )
      ( MAKE-ON-VERIFY ?AUTO_5541 ?AUTO_5542 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5549 - BLOCK
      ?AUTO_5550 - BLOCK
    )
    :vars
    (
      ?AUTO_5554 - BLOCK
      ?AUTO_5555 - BLOCK
      ?AUTO_5553 - BLOCK
      ?AUTO_5551 - BLOCK
      ?AUTO_5552 - BLOCK
      ?AUTO_5556 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5549 ?AUTO_5550 ) ) ( ON ?AUTO_5549 ?AUTO_5554 ) ( not ( = ?AUTO_5549 ?AUTO_5554 ) ) ( not ( = ?AUTO_5550 ?AUTO_5554 ) ) ( not ( = ?AUTO_5549 ?AUTO_5555 ) ) ( not ( = ?AUTO_5549 ?AUTO_5553 ) ) ( not ( = ?AUTO_5550 ?AUTO_5555 ) ) ( not ( = ?AUTO_5550 ?AUTO_5553 ) ) ( not ( = ?AUTO_5554 ?AUTO_5555 ) ) ( not ( = ?AUTO_5554 ?AUTO_5553 ) ) ( not ( = ?AUTO_5555 ?AUTO_5553 ) ) ( ON ?AUTO_5555 ?AUTO_5550 ) ( not ( = ?AUTO_5549 ?AUTO_5551 ) ) ( not ( = ?AUTO_5550 ?AUTO_5551 ) ) ( not ( = ?AUTO_5554 ?AUTO_5551 ) ) ( not ( = ?AUTO_5553 ?AUTO_5551 ) ) ( not ( = ?AUTO_5555 ?AUTO_5551 ) ) ( ON ?AUTO_5551 ?AUTO_5555 ) ( CLEAR ?AUTO_5551 ) ( CLEAR ?AUTO_5552 ) ( not ( = ?AUTO_5549 ?AUTO_5556 ) ) ( not ( = ?AUTO_5549 ?AUTO_5552 ) ) ( not ( = ?AUTO_5550 ?AUTO_5556 ) ) ( not ( = ?AUTO_5550 ?AUTO_5552 ) ) ( not ( = ?AUTO_5554 ?AUTO_5556 ) ) ( not ( = ?AUTO_5554 ?AUTO_5552 ) ) ( not ( = ?AUTO_5553 ?AUTO_5556 ) ) ( not ( = ?AUTO_5553 ?AUTO_5552 ) ) ( not ( = ?AUTO_5555 ?AUTO_5556 ) ) ( not ( = ?AUTO_5555 ?AUTO_5552 ) ) ( not ( = ?AUTO_5551 ?AUTO_5556 ) ) ( not ( = ?AUTO_5551 ?AUTO_5552 ) ) ( not ( = ?AUTO_5556 ?AUTO_5552 ) ) ( ON ?AUTO_5556 ?AUTO_5549 ) ( CLEAR ?AUTO_5556 ) ( HOLDING ?AUTO_5553 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5553 )
      ( MAKE-ON ?AUTO_5549 ?AUTO_5550 )
      ( MAKE-ON-VERIFY ?AUTO_5549 ?AUTO_5550 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5561 - BLOCK
      ?AUTO_5562 - BLOCK
    )
    :vars
    (
      ?AUTO_5567 - BLOCK
      ?AUTO_5563 - BLOCK
      ?AUTO_5566 - BLOCK
      ?AUTO_5565 - BLOCK
      ?AUTO_5564 - BLOCK
      ?AUTO_5568 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5561 ?AUTO_5562 ) ) ( ON ?AUTO_5561 ?AUTO_5567 ) ( not ( = ?AUTO_5561 ?AUTO_5567 ) ) ( not ( = ?AUTO_5562 ?AUTO_5567 ) ) ( not ( = ?AUTO_5561 ?AUTO_5563 ) ) ( not ( = ?AUTO_5561 ?AUTO_5566 ) ) ( not ( = ?AUTO_5562 ?AUTO_5563 ) ) ( not ( = ?AUTO_5562 ?AUTO_5566 ) ) ( not ( = ?AUTO_5567 ?AUTO_5563 ) ) ( not ( = ?AUTO_5567 ?AUTO_5566 ) ) ( not ( = ?AUTO_5563 ?AUTO_5566 ) ) ( ON ?AUTO_5563 ?AUTO_5562 ) ( not ( = ?AUTO_5561 ?AUTO_5565 ) ) ( not ( = ?AUTO_5562 ?AUTO_5565 ) ) ( not ( = ?AUTO_5567 ?AUTO_5565 ) ) ( not ( = ?AUTO_5566 ?AUTO_5565 ) ) ( not ( = ?AUTO_5563 ?AUTO_5565 ) ) ( ON ?AUTO_5565 ?AUTO_5563 ) ( CLEAR ?AUTO_5564 ) ( not ( = ?AUTO_5561 ?AUTO_5568 ) ) ( not ( = ?AUTO_5561 ?AUTO_5564 ) ) ( not ( = ?AUTO_5562 ?AUTO_5568 ) ) ( not ( = ?AUTO_5562 ?AUTO_5564 ) ) ( not ( = ?AUTO_5567 ?AUTO_5568 ) ) ( not ( = ?AUTO_5567 ?AUTO_5564 ) ) ( not ( = ?AUTO_5566 ?AUTO_5568 ) ) ( not ( = ?AUTO_5566 ?AUTO_5564 ) ) ( not ( = ?AUTO_5563 ?AUTO_5568 ) ) ( not ( = ?AUTO_5563 ?AUTO_5564 ) ) ( not ( = ?AUTO_5565 ?AUTO_5568 ) ) ( not ( = ?AUTO_5565 ?AUTO_5564 ) ) ( not ( = ?AUTO_5568 ?AUTO_5564 ) ) ( ON ?AUTO_5568 ?AUTO_5561 ) ( CLEAR ?AUTO_5568 ) ( ON ?AUTO_5566 ?AUTO_5565 ) ( CLEAR ?AUTO_5566 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5566 ?AUTO_5565 )
      ( MAKE-ON ?AUTO_5561 ?AUTO_5562 )
      ( MAKE-ON-VERIFY ?AUTO_5561 ?AUTO_5562 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5571 - BLOCK
      ?AUTO_5572 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5571 ) ( CLEAR ?AUTO_5572 ) ( not ( = ?AUTO_5571 ?AUTO_5572 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5571 ?AUTO_5572 )
      ( MAKE-ON-VERIFY ?AUTO_5571 ?AUTO_5572 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5573 - BLOCK
      ?AUTO_5574 - BLOCK
    )
    :vars
    (
      ?AUTO_5575 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5574 ) ( not ( = ?AUTO_5573 ?AUTO_5574 ) ) ( ON ?AUTO_5573 ?AUTO_5575 ) ( CLEAR ?AUTO_5573 ) ( HAND-EMPTY ) ( not ( = ?AUTO_5573 ?AUTO_5575 ) ) ( not ( = ?AUTO_5574 ?AUTO_5575 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5573 ?AUTO_5575 )
      ( MAKE-ON ?AUTO_5573 ?AUTO_5574 )
      ( MAKE-ON-VERIFY ?AUTO_5573 ?AUTO_5574 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5576 - BLOCK
      ?AUTO_5577 - BLOCK
    )
    :vars
    (
      ?AUTO_5578 - BLOCK
      ?AUTO_5579 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5576 ?AUTO_5577 ) ) ( ON ?AUTO_5576 ?AUTO_5578 ) ( CLEAR ?AUTO_5576 ) ( not ( = ?AUTO_5576 ?AUTO_5578 ) ) ( not ( = ?AUTO_5577 ?AUTO_5578 ) ) ( HOLDING ?AUTO_5577 ) ( CLEAR ?AUTO_5579 ) ( not ( = ?AUTO_5576 ?AUTO_5579 ) ) ( not ( = ?AUTO_5577 ?AUTO_5579 ) ) ( not ( = ?AUTO_5578 ?AUTO_5579 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5577 ?AUTO_5579 )
      ( MAKE-ON ?AUTO_5576 ?AUTO_5577 )
      ( MAKE-ON-VERIFY ?AUTO_5576 ?AUTO_5577 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5580 - BLOCK
      ?AUTO_5581 - BLOCK
    )
    :vars
    (
      ?AUTO_5582 - BLOCK
      ?AUTO_5583 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5580 ?AUTO_5581 ) ) ( ON ?AUTO_5580 ?AUTO_5582 ) ( not ( = ?AUTO_5580 ?AUTO_5582 ) ) ( not ( = ?AUTO_5581 ?AUTO_5582 ) ) ( CLEAR ?AUTO_5583 ) ( not ( = ?AUTO_5580 ?AUTO_5583 ) ) ( not ( = ?AUTO_5581 ?AUTO_5583 ) ) ( not ( = ?AUTO_5582 ?AUTO_5583 ) ) ( ON ?AUTO_5581 ?AUTO_5580 ) ( CLEAR ?AUTO_5581 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5581 ?AUTO_5580 )
      ( MAKE-ON ?AUTO_5580 ?AUTO_5581 )
      ( MAKE-ON-VERIFY ?AUTO_5580 ?AUTO_5581 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5584 - BLOCK
      ?AUTO_5585 - BLOCK
    )
    :vars
    (
      ?AUTO_5586 - BLOCK
      ?AUTO_5587 - BLOCK
      ?AUTO_5588 - BLOCK
      ?AUTO_5589 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5584 ?AUTO_5585 ) ) ( ON ?AUTO_5584 ?AUTO_5586 ) ( not ( = ?AUTO_5584 ?AUTO_5586 ) ) ( not ( = ?AUTO_5585 ?AUTO_5586 ) ) ( CLEAR ?AUTO_5587 ) ( not ( = ?AUTO_5584 ?AUTO_5587 ) ) ( not ( = ?AUTO_5585 ?AUTO_5587 ) ) ( not ( = ?AUTO_5586 ?AUTO_5587 ) ) ( ON ?AUTO_5585 ?AUTO_5584 ) ( CLEAR ?AUTO_5585 ) ( HOLDING ?AUTO_5588 ) ( CLEAR ?AUTO_5589 ) ( not ( = ?AUTO_5584 ?AUTO_5588 ) ) ( not ( = ?AUTO_5584 ?AUTO_5589 ) ) ( not ( = ?AUTO_5585 ?AUTO_5588 ) ) ( not ( = ?AUTO_5585 ?AUTO_5589 ) ) ( not ( = ?AUTO_5586 ?AUTO_5588 ) ) ( not ( = ?AUTO_5586 ?AUTO_5589 ) ) ( not ( = ?AUTO_5587 ?AUTO_5588 ) ) ( not ( = ?AUTO_5587 ?AUTO_5589 ) ) ( not ( = ?AUTO_5588 ?AUTO_5589 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5588 ?AUTO_5589 )
      ( MAKE-ON ?AUTO_5584 ?AUTO_5585 )
      ( MAKE-ON-VERIFY ?AUTO_5584 ?AUTO_5585 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5598 - BLOCK
      ?AUTO_5599 - BLOCK
    )
    :vars
    (
      ?AUTO_5600 - BLOCK
      ?AUTO_5601 - BLOCK
      ?AUTO_5603 - BLOCK
      ?AUTO_5602 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5598 ?AUTO_5599 ) ) ( ON ?AUTO_5598 ?AUTO_5600 ) ( not ( = ?AUTO_5598 ?AUTO_5600 ) ) ( not ( = ?AUTO_5599 ?AUTO_5600 ) ) ( CLEAR ?AUTO_5601 ) ( not ( = ?AUTO_5598 ?AUTO_5601 ) ) ( not ( = ?AUTO_5599 ?AUTO_5601 ) ) ( not ( = ?AUTO_5600 ?AUTO_5601 ) ) ( ON ?AUTO_5599 ?AUTO_5598 ) ( CLEAR ?AUTO_5603 ) ( not ( = ?AUTO_5598 ?AUTO_5602 ) ) ( not ( = ?AUTO_5598 ?AUTO_5603 ) ) ( not ( = ?AUTO_5599 ?AUTO_5602 ) ) ( not ( = ?AUTO_5599 ?AUTO_5603 ) ) ( not ( = ?AUTO_5600 ?AUTO_5602 ) ) ( not ( = ?AUTO_5600 ?AUTO_5603 ) ) ( not ( = ?AUTO_5601 ?AUTO_5602 ) ) ( not ( = ?AUTO_5601 ?AUTO_5603 ) ) ( not ( = ?AUTO_5602 ?AUTO_5603 ) ) ( ON ?AUTO_5602 ?AUTO_5599 ) ( CLEAR ?AUTO_5602 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5602 ?AUTO_5599 )
      ( MAKE-ON ?AUTO_5598 ?AUTO_5599 )
      ( MAKE-ON-VERIFY ?AUTO_5598 ?AUTO_5599 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5604 - BLOCK
      ?AUTO_5605 - BLOCK
    )
    :vars
    (
      ?AUTO_5607 - BLOCK
      ?AUTO_5606 - BLOCK
      ?AUTO_5609 - BLOCK
      ?AUTO_5608 - BLOCK
      ?AUTO_5610 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5604 ?AUTO_5605 ) ) ( ON ?AUTO_5604 ?AUTO_5607 ) ( not ( = ?AUTO_5604 ?AUTO_5607 ) ) ( not ( = ?AUTO_5605 ?AUTO_5607 ) ) ( CLEAR ?AUTO_5606 ) ( not ( = ?AUTO_5604 ?AUTO_5606 ) ) ( not ( = ?AUTO_5605 ?AUTO_5606 ) ) ( not ( = ?AUTO_5607 ?AUTO_5606 ) ) ( ON ?AUTO_5605 ?AUTO_5604 ) ( CLEAR ?AUTO_5609 ) ( not ( = ?AUTO_5604 ?AUTO_5608 ) ) ( not ( = ?AUTO_5604 ?AUTO_5609 ) ) ( not ( = ?AUTO_5605 ?AUTO_5608 ) ) ( not ( = ?AUTO_5605 ?AUTO_5609 ) ) ( not ( = ?AUTO_5607 ?AUTO_5608 ) ) ( not ( = ?AUTO_5607 ?AUTO_5609 ) ) ( not ( = ?AUTO_5606 ?AUTO_5608 ) ) ( not ( = ?AUTO_5606 ?AUTO_5609 ) ) ( not ( = ?AUTO_5608 ?AUTO_5609 ) ) ( ON ?AUTO_5608 ?AUTO_5605 ) ( CLEAR ?AUTO_5608 ) ( HOLDING ?AUTO_5610 ) ( not ( = ?AUTO_5604 ?AUTO_5610 ) ) ( not ( = ?AUTO_5605 ?AUTO_5610 ) ) ( not ( = ?AUTO_5607 ?AUTO_5610 ) ) ( not ( = ?AUTO_5606 ?AUTO_5610 ) ) ( not ( = ?AUTO_5609 ?AUTO_5610 ) ) ( not ( = ?AUTO_5608 ?AUTO_5610 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5610 )
      ( MAKE-ON ?AUTO_5604 ?AUTO_5605 )
      ( MAKE-ON-VERIFY ?AUTO_5604 ?AUTO_5605 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5619 - BLOCK
      ?AUTO_5620 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5619 ) ( CLEAR ?AUTO_5620 ) ( not ( = ?AUTO_5619 ?AUTO_5620 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5619 ?AUTO_5620 )
      ( MAKE-ON-VERIFY ?AUTO_5619 ?AUTO_5620 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5621 - BLOCK
      ?AUTO_5622 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5622 ) ( not ( = ?AUTO_5621 ?AUTO_5622 ) ) ( ON-TABLE ?AUTO_5621 ) ( CLEAR ?AUTO_5621 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_5621 )
      ( MAKE-ON ?AUTO_5621 ?AUTO_5622 )
      ( MAKE-ON-VERIFY ?AUTO_5621 ?AUTO_5622 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5623 - BLOCK
      ?AUTO_5624 - BLOCK
    )
    :vars
    (
      ?AUTO_5625 - BLOCK
      ?AUTO_5626 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5624 ) ( not ( = ?AUTO_5623 ?AUTO_5624 ) ) ( ON-TABLE ?AUTO_5623 ) ( CLEAR ?AUTO_5623 ) ( HOLDING ?AUTO_5625 ) ( CLEAR ?AUTO_5626 ) ( not ( = ?AUTO_5623 ?AUTO_5625 ) ) ( not ( = ?AUTO_5623 ?AUTO_5626 ) ) ( not ( = ?AUTO_5624 ?AUTO_5625 ) ) ( not ( = ?AUTO_5624 ?AUTO_5626 ) ) ( not ( = ?AUTO_5625 ?AUTO_5626 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5625 ?AUTO_5626 )
      ( MAKE-ON ?AUTO_5623 ?AUTO_5624 )
      ( MAKE-ON-VERIFY ?AUTO_5623 ?AUTO_5624 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5627 - BLOCK
      ?AUTO_5628 - BLOCK
    )
    :vars
    (
      ?AUTO_5629 - BLOCK
      ?AUTO_5630 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5627 ?AUTO_5628 ) ) ( ON-TABLE ?AUTO_5627 ) ( CLEAR ?AUTO_5627 ) ( CLEAR ?AUTO_5629 ) ( not ( = ?AUTO_5627 ?AUTO_5630 ) ) ( not ( = ?AUTO_5627 ?AUTO_5629 ) ) ( not ( = ?AUTO_5628 ?AUTO_5630 ) ) ( not ( = ?AUTO_5628 ?AUTO_5629 ) ) ( not ( = ?AUTO_5630 ?AUTO_5629 ) ) ( ON ?AUTO_5630 ?AUTO_5628 ) ( CLEAR ?AUTO_5630 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5630 ?AUTO_5628 )
      ( MAKE-ON ?AUTO_5627 ?AUTO_5628 )
      ( MAKE-ON-VERIFY ?AUTO_5627 ?AUTO_5628 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5631 - BLOCK
      ?AUTO_5632 - BLOCK
    )
    :vars
    (
      ?AUTO_5634 - BLOCK
      ?AUTO_5633 - BLOCK
      ?AUTO_5635 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5631 ?AUTO_5632 ) ) ( ON-TABLE ?AUTO_5631 ) ( CLEAR ?AUTO_5631 ) ( not ( = ?AUTO_5631 ?AUTO_5634 ) ) ( not ( = ?AUTO_5631 ?AUTO_5633 ) ) ( not ( = ?AUTO_5632 ?AUTO_5634 ) ) ( not ( = ?AUTO_5632 ?AUTO_5633 ) ) ( not ( = ?AUTO_5634 ?AUTO_5633 ) ) ( ON ?AUTO_5634 ?AUTO_5632 ) ( CLEAR ?AUTO_5634 ) ( HOLDING ?AUTO_5633 ) ( CLEAR ?AUTO_5635 ) ( not ( = ?AUTO_5631 ?AUTO_5635 ) ) ( not ( = ?AUTO_5632 ?AUTO_5635 ) ) ( not ( = ?AUTO_5634 ?AUTO_5635 ) ) ( not ( = ?AUTO_5633 ?AUTO_5635 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5633 ?AUTO_5635 )
      ( MAKE-ON ?AUTO_5631 ?AUTO_5632 )
      ( MAKE-ON-VERIFY ?AUTO_5631 ?AUTO_5632 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5636 - BLOCK
      ?AUTO_5637 - BLOCK
    )
    :vars
    (
      ?AUTO_5638 - BLOCK
      ?AUTO_5639 - BLOCK
      ?AUTO_5640 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5636 ?AUTO_5637 ) ) ( ON-TABLE ?AUTO_5636 ) ( CLEAR ?AUTO_5636 ) ( not ( = ?AUTO_5636 ?AUTO_5638 ) ) ( not ( = ?AUTO_5636 ?AUTO_5639 ) ) ( not ( = ?AUTO_5637 ?AUTO_5638 ) ) ( not ( = ?AUTO_5637 ?AUTO_5639 ) ) ( not ( = ?AUTO_5638 ?AUTO_5639 ) ) ( ON ?AUTO_5638 ?AUTO_5637 ) ( CLEAR ?AUTO_5640 ) ( not ( = ?AUTO_5636 ?AUTO_5640 ) ) ( not ( = ?AUTO_5637 ?AUTO_5640 ) ) ( not ( = ?AUTO_5638 ?AUTO_5640 ) ) ( not ( = ?AUTO_5639 ?AUTO_5640 ) ) ( ON ?AUTO_5639 ?AUTO_5638 ) ( CLEAR ?AUTO_5639 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5639 ?AUTO_5638 )
      ( MAKE-ON ?AUTO_5636 ?AUTO_5637 )
      ( MAKE-ON-VERIFY ?AUTO_5636 ?AUTO_5637 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5641 - BLOCK
      ?AUTO_5642 - BLOCK
    )
    :vars
    (
      ?AUTO_5643 - BLOCK
      ?AUTO_5644 - BLOCK
      ?AUTO_5645 - BLOCK
      ?AUTO_5646 - BLOCK
      ?AUTO_5647 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5641 ?AUTO_5642 ) ) ( ON-TABLE ?AUTO_5641 ) ( CLEAR ?AUTO_5641 ) ( not ( = ?AUTO_5641 ?AUTO_5643 ) ) ( not ( = ?AUTO_5641 ?AUTO_5644 ) ) ( not ( = ?AUTO_5642 ?AUTO_5643 ) ) ( not ( = ?AUTO_5642 ?AUTO_5644 ) ) ( not ( = ?AUTO_5643 ?AUTO_5644 ) ) ( ON ?AUTO_5643 ?AUTO_5642 ) ( CLEAR ?AUTO_5645 ) ( not ( = ?AUTO_5641 ?AUTO_5645 ) ) ( not ( = ?AUTO_5642 ?AUTO_5645 ) ) ( not ( = ?AUTO_5643 ?AUTO_5645 ) ) ( not ( = ?AUTO_5644 ?AUTO_5645 ) ) ( ON ?AUTO_5644 ?AUTO_5643 ) ( CLEAR ?AUTO_5644 ) ( HOLDING ?AUTO_5646 ) ( CLEAR ?AUTO_5647 ) ( not ( = ?AUTO_5641 ?AUTO_5646 ) ) ( not ( = ?AUTO_5641 ?AUTO_5647 ) ) ( not ( = ?AUTO_5642 ?AUTO_5646 ) ) ( not ( = ?AUTO_5642 ?AUTO_5647 ) ) ( not ( = ?AUTO_5643 ?AUTO_5646 ) ) ( not ( = ?AUTO_5643 ?AUTO_5647 ) ) ( not ( = ?AUTO_5644 ?AUTO_5646 ) ) ( not ( = ?AUTO_5644 ?AUTO_5647 ) ) ( not ( = ?AUTO_5645 ?AUTO_5646 ) ) ( not ( = ?AUTO_5645 ?AUTO_5647 ) ) ( not ( = ?AUTO_5646 ?AUTO_5647 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5646 ?AUTO_5647 )
      ( MAKE-ON ?AUTO_5641 ?AUTO_5642 )
      ( MAKE-ON-VERIFY ?AUTO_5641 ?AUTO_5642 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5650 - BLOCK
      ?AUTO_5651 - BLOCK
    )
    :vars
    (
      ?AUTO_5652 - BLOCK
      ?AUTO_5653 - BLOCK
      ?AUTO_5654 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5650 ?AUTO_5651 ) ) ( not ( = ?AUTO_5650 ?AUTO_5652 ) ) ( not ( = ?AUTO_5650 ?AUTO_5653 ) ) ( not ( = ?AUTO_5651 ?AUTO_5652 ) ) ( not ( = ?AUTO_5651 ?AUTO_5653 ) ) ( not ( = ?AUTO_5652 ?AUTO_5653 ) ) ( ON ?AUTO_5652 ?AUTO_5651 ) ( CLEAR ?AUTO_5654 ) ( not ( = ?AUTO_5650 ?AUTO_5654 ) ) ( not ( = ?AUTO_5651 ?AUTO_5654 ) ) ( not ( = ?AUTO_5652 ?AUTO_5654 ) ) ( not ( = ?AUTO_5653 ?AUTO_5654 ) ) ( ON ?AUTO_5653 ?AUTO_5652 ) ( CLEAR ?AUTO_5653 ) ( HOLDING ?AUTO_5650 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5650 )
      ( MAKE-ON ?AUTO_5650 ?AUTO_5651 )
      ( MAKE-ON-VERIFY ?AUTO_5650 ?AUTO_5651 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5659 - BLOCK
      ?AUTO_5660 - BLOCK
    )
    :vars
    (
      ?AUTO_5661 - BLOCK
      ?AUTO_5665 - BLOCK
      ?AUTO_5663 - BLOCK
      ?AUTO_5662 - BLOCK
      ?AUTO_5666 - BLOCK
      ?AUTO_5664 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5659 ?AUTO_5660 ) ) ( ON ?AUTO_5659 ?AUTO_5661 ) ( CLEAR ?AUTO_5659 ) ( not ( = ?AUTO_5659 ?AUTO_5661 ) ) ( not ( = ?AUTO_5660 ?AUTO_5661 ) ) ( CLEAR ?AUTO_5665 ) ( not ( = ?AUTO_5659 ?AUTO_5663 ) ) ( not ( = ?AUTO_5659 ?AUTO_5665 ) ) ( not ( = ?AUTO_5660 ?AUTO_5663 ) ) ( not ( = ?AUTO_5660 ?AUTO_5665 ) ) ( not ( = ?AUTO_5661 ?AUTO_5663 ) ) ( not ( = ?AUTO_5661 ?AUTO_5665 ) ) ( not ( = ?AUTO_5663 ?AUTO_5665 ) ) ( ON ?AUTO_5663 ?AUTO_5660 ) ( not ( = ?AUTO_5659 ?AUTO_5662 ) ) ( not ( = ?AUTO_5660 ?AUTO_5662 ) ) ( not ( = ?AUTO_5661 ?AUTO_5662 ) ) ( not ( = ?AUTO_5665 ?AUTO_5662 ) ) ( not ( = ?AUTO_5663 ?AUTO_5662 ) ) ( ON ?AUTO_5662 ?AUTO_5663 ) ( CLEAR ?AUTO_5666 ) ( not ( = ?AUTO_5659 ?AUTO_5664 ) ) ( not ( = ?AUTO_5659 ?AUTO_5666 ) ) ( not ( = ?AUTO_5660 ?AUTO_5664 ) ) ( not ( = ?AUTO_5660 ?AUTO_5666 ) ) ( not ( = ?AUTO_5661 ?AUTO_5664 ) ) ( not ( = ?AUTO_5661 ?AUTO_5666 ) ) ( not ( = ?AUTO_5665 ?AUTO_5664 ) ) ( not ( = ?AUTO_5665 ?AUTO_5666 ) ) ( not ( = ?AUTO_5663 ?AUTO_5664 ) ) ( not ( = ?AUTO_5663 ?AUTO_5666 ) ) ( not ( = ?AUTO_5662 ?AUTO_5664 ) ) ( not ( = ?AUTO_5662 ?AUTO_5666 ) ) ( not ( = ?AUTO_5664 ?AUTO_5666 ) ) ( ON ?AUTO_5664 ?AUTO_5662 ) ( CLEAR ?AUTO_5664 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5664 ?AUTO_5662 )
      ( MAKE-ON ?AUTO_5659 ?AUTO_5660 )
      ( MAKE-ON-VERIFY ?AUTO_5659 ?AUTO_5660 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5667 - BLOCK
      ?AUTO_5668 - BLOCK
    )
    :vars
    (
      ?AUTO_5673 - BLOCK
      ?AUTO_5670 - BLOCK
      ?AUTO_5674 - BLOCK
      ?AUTO_5672 - BLOCK
      ?AUTO_5669 - BLOCK
      ?AUTO_5671 - BLOCK
      ?AUTO_5675 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5667 ?AUTO_5668 ) ) ( ON ?AUTO_5667 ?AUTO_5673 ) ( CLEAR ?AUTO_5667 ) ( not ( = ?AUTO_5667 ?AUTO_5673 ) ) ( not ( = ?AUTO_5668 ?AUTO_5673 ) ) ( CLEAR ?AUTO_5670 ) ( not ( = ?AUTO_5667 ?AUTO_5674 ) ) ( not ( = ?AUTO_5667 ?AUTO_5670 ) ) ( not ( = ?AUTO_5668 ?AUTO_5674 ) ) ( not ( = ?AUTO_5668 ?AUTO_5670 ) ) ( not ( = ?AUTO_5673 ?AUTO_5674 ) ) ( not ( = ?AUTO_5673 ?AUTO_5670 ) ) ( not ( = ?AUTO_5674 ?AUTO_5670 ) ) ( ON ?AUTO_5674 ?AUTO_5668 ) ( not ( = ?AUTO_5667 ?AUTO_5672 ) ) ( not ( = ?AUTO_5668 ?AUTO_5672 ) ) ( not ( = ?AUTO_5673 ?AUTO_5672 ) ) ( not ( = ?AUTO_5670 ?AUTO_5672 ) ) ( not ( = ?AUTO_5674 ?AUTO_5672 ) ) ( ON ?AUTO_5672 ?AUTO_5674 ) ( CLEAR ?AUTO_5669 ) ( not ( = ?AUTO_5667 ?AUTO_5671 ) ) ( not ( = ?AUTO_5667 ?AUTO_5669 ) ) ( not ( = ?AUTO_5668 ?AUTO_5671 ) ) ( not ( = ?AUTO_5668 ?AUTO_5669 ) ) ( not ( = ?AUTO_5673 ?AUTO_5671 ) ) ( not ( = ?AUTO_5673 ?AUTO_5669 ) ) ( not ( = ?AUTO_5670 ?AUTO_5671 ) ) ( not ( = ?AUTO_5670 ?AUTO_5669 ) ) ( not ( = ?AUTO_5674 ?AUTO_5671 ) ) ( not ( = ?AUTO_5674 ?AUTO_5669 ) ) ( not ( = ?AUTO_5672 ?AUTO_5671 ) ) ( not ( = ?AUTO_5672 ?AUTO_5669 ) ) ( not ( = ?AUTO_5671 ?AUTO_5669 ) ) ( ON ?AUTO_5671 ?AUTO_5672 ) ( CLEAR ?AUTO_5671 ) ( HOLDING ?AUTO_5675 ) ( not ( = ?AUTO_5667 ?AUTO_5675 ) ) ( not ( = ?AUTO_5668 ?AUTO_5675 ) ) ( not ( = ?AUTO_5673 ?AUTO_5675 ) ) ( not ( = ?AUTO_5670 ?AUTO_5675 ) ) ( not ( = ?AUTO_5674 ?AUTO_5675 ) ) ( not ( = ?AUTO_5672 ?AUTO_5675 ) ) ( not ( = ?AUTO_5669 ?AUTO_5675 ) ) ( not ( = ?AUTO_5671 ?AUTO_5675 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5675 )
      ( MAKE-ON ?AUTO_5667 ?AUTO_5668 )
      ( MAKE-ON-VERIFY ?AUTO_5667 ?AUTO_5668 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5678 - BLOCK
      ?AUTO_5679 - BLOCK
    )
    :vars
    (
      ?AUTO_5682 - BLOCK
      ?AUTO_5685 - BLOCK
      ?AUTO_5684 - BLOCK
      ?AUTO_5681 - BLOCK
      ?AUTO_5680 - BLOCK
      ?AUTO_5683 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5678 ?AUTO_5679 ) ) ( ON ?AUTO_5678 ?AUTO_5682 ) ( CLEAR ?AUTO_5678 ) ( not ( = ?AUTO_5678 ?AUTO_5682 ) ) ( not ( = ?AUTO_5679 ?AUTO_5682 ) ) ( not ( = ?AUTO_5678 ?AUTO_5685 ) ) ( not ( = ?AUTO_5678 ?AUTO_5684 ) ) ( not ( = ?AUTO_5679 ?AUTO_5685 ) ) ( not ( = ?AUTO_5679 ?AUTO_5684 ) ) ( not ( = ?AUTO_5682 ?AUTO_5685 ) ) ( not ( = ?AUTO_5682 ?AUTO_5684 ) ) ( not ( = ?AUTO_5685 ?AUTO_5684 ) ) ( ON ?AUTO_5685 ?AUTO_5679 ) ( not ( = ?AUTO_5678 ?AUTO_5681 ) ) ( not ( = ?AUTO_5679 ?AUTO_5681 ) ) ( not ( = ?AUTO_5682 ?AUTO_5681 ) ) ( not ( = ?AUTO_5684 ?AUTO_5681 ) ) ( not ( = ?AUTO_5685 ?AUTO_5681 ) ) ( ON ?AUTO_5681 ?AUTO_5685 ) ( CLEAR ?AUTO_5680 ) ( not ( = ?AUTO_5678 ?AUTO_5683 ) ) ( not ( = ?AUTO_5678 ?AUTO_5680 ) ) ( not ( = ?AUTO_5679 ?AUTO_5683 ) ) ( not ( = ?AUTO_5679 ?AUTO_5680 ) ) ( not ( = ?AUTO_5682 ?AUTO_5683 ) ) ( not ( = ?AUTO_5682 ?AUTO_5680 ) ) ( not ( = ?AUTO_5684 ?AUTO_5683 ) ) ( not ( = ?AUTO_5684 ?AUTO_5680 ) ) ( not ( = ?AUTO_5685 ?AUTO_5683 ) ) ( not ( = ?AUTO_5685 ?AUTO_5680 ) ) ( not ( = ?AUTO_5681 ?AUTO_5683 ) ) ( not ( = ?AUTO_5681 ?AUTO_5680 ) ) ( not ( = ?AUTO_5683 ?AUTO_5680 ) ) ( ON ?AUTO_5683 ?AUTO_5681 ) ( CLEAR ?AUTO_5683 ) ( HOLDING ?AUTO_5684 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5684 )
      ( MAKE-ON ?AUTO_5678 ?AUTO_5679 )
      ( MAKE-ON-VERIFY ?AUTO_5678 ?AUTO_5679 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5690 - BLOCK
      ?AUTO_5691 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5690 ) ( CLEAR ?AUTO_5691 ) ( not ( = ?AUTO_5690 ?AUTO_5691 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5690 ?AUTO_5691 )
      ( MAKE-ON-VERIFY ?AUTO_5690 ?AUTO_5691 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5692 - BLOCK
      ?AUTO_5693 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5693 ) ( not ( = ?AUTO_5692 ?AUTO_5693 ) ) ( ON-TABLE ?AUTO_5692 ) ( CLEAR ?AUTO_5692 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_5692 )
      ( MAKE-ON ?AUTO_5692 ?AUTO_5693 )
      ( MAKE-ON-VERIFY ?AUTO_5692 ?AUTO_5693 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5694 - BLOCK
      ?AUTO_5695 - BLOCK
    )
    :vars
    (
      ?AUTO_5696 - BLOCK
      ?AUTO_5697 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5695 ) ( not ( = ?AUTO_5694 ?AUTO_5695 ) ) ( ON-TABLE ?AUTO_5694 ) ( CLEAR ?AUTO_5694 ) ( HOLDING ?AUTO_5696 ) ( CLEAR ?AUTO_5697 ) ( not ( = ?AUTO_5694 ?AUTO_5696 ) ) ( not ( = ?AUTO_5694 ?AUTO_5697 ) ) ( not ( = ?AUTO_5695 ?AUTO_5696 ) ) ( not ( = ?AUTO_5695 ?AUTO_5697 ) ) ( not ( = ?AUTO_5696 ?AUTO_5697 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5696 ?AUTO_5697 )
      ( MAKE-ON ?AUTO_5694 ?AUTO_5695 )
      ( MAKE-ON-VERIFY ?AUTO_5694 ?AUTO_5695 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5708 - BLOCK
      ?AUTO_5709 - BLOCK
    )
    :vars
    (
      ?AUTO_5710 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5708 ?AUTO_5709 ) ) ( ON-TABLE ?AUTO_5708 ) ( CLEAR ?AUTO_5708 ) ( HOLDING ?AUTO_5709 ) ( CLEAR ?AUTO_5710 ) ( not ( = ?AUTO_5708 ?AUTO_5710 ) ) ( not ( = ?AUTO_5709 ?AUTO_5710 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5709 ?AUTO_5710 )
      ( MAKE-ON ?AUTO_5708 ?AUTO_5709 )
      ( MAKE-ON-VERIFY ?AUTO_5708 ?AUTO_5709 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5723 - BLOCK
      ?AUTO_5724 - BLOCK
    )
    :vars
    (
      ?AUTO_5725 - BLOCK
      ?AUTO_5726 - BLOCK
      ?AUTO_5727 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5723 ?AUTO_5724 ) ) ( ON-TABLE ?AUTO_5723 ) ( not ( = ?AUTO_5723 ?AUTO_5725 ) ) ( not ( = ?AUTO_5723 ?AUTO_5726 ) ) ( not ( = ?AUTO_5724 ?AUTO_5725 ) ) ( not ( = ?AUTO_5724 ?AUTO_5726 ) ) ( not ( = ?AUTO_5725 ?AUTO_5726 ) ) ( ON ?AUTO_5725 ?AUTO_5724 ) ( CLEAR ?AUTO_5725 ) ( CLEAR ?AUTO_5727 ) ( not ( = ?AUTO_5723 ?AUTO_5727 ) ) ( not ( = ?AUTO_5724 ?AUTO_5727 ) ) ( not ( = ?AUTO_5725 ?AUTO_5727 ) ) ( not ( = ?AUTO_5726 ?AUTO_5727 ) ) ( ON ?AUTO_5726 ?AUTO_5723 ) ( CLEAR ?AUTO_5726 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5726 ?AUTO_5723 )
      ( MAKE-ON ?AUTO_5723 ?AUTO_5724 )
      ( MAKE-ON-VERIFY ?AUTO_5723 ?AUTO_5724 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5728 - BLOCK
      ?AUTO_5729 - BLOCK
    )
    :vars
    (
      ?AUTO_5731 - BLOCK
      ?AUTO_5730 - BLOCK
      ?AUTO_5732 - BLOCK
      ?AUTO_5733 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5728 ?AUTO_5729 ) ) ( ON-TABLE ?AUTO_5728 ) ( not ( = ?AUTO_5728 ?AUTO_5731 ) ) ( not ( = ?AUTO_5728 ?AUTO_5730 ) ) ( not ( = ?AUTO_5729 ?AUTO_5731 ) ) ( not ( = ?AUTO_5729 ?AUTO_5730 ) ) ( not ( = ?AUTO_5731 ?AUTO_5730 ) ) ( ON ?AUTO_5731 ?AUTO_5729 ) ( CLEAR ?AUTO_5731 ) ( CLEAR ?AUTO_5732 ) ( not ( = ?AUTO_5728 ?AUTO_5732 ) ) ( not ( = ?AUTO_5729 ?AUTO_5732 ) ) ( not ( = ?AUTO_5731 ?AUTO_5732 ) ) ( not ( = ?AUTO_5730 ?AUTO_5732 ) ) ( ON ?AUTO_5730 ?AUTO_5728 ) ( CLEAR ?AUTO_5730 ) ( HOLDING ?AUTO_5733 ) ( not ( = ?AUTO_5728 ?AUTO_5733 ) ) ( not ( = ?AUTO_5729 ?AUTO_5733 ) ) ( not ( = ?AUTO_5731 ?AUTO_5733 ) ) ( not ( = ?AUTO_5730 ?AUTO_5733 ) ) ( not ( = ?AUTO_5732 ?AUTO_5733 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5733 )
      ( MAKE-ON ?AUTO_5728 ?AUTO_5729 )
      ( MAKE-ON-VERIFY ?AUTO_5728 ?AUTO_5729 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5734 - BLOCK
      ?AUTO_5735 - BLOCK
    )
    :vars
    (
      ?AUTO_5737 - BLOCK
      ?AUTO_5736 - BLOCK
      ?AUTO_5738 - BLOCK
      ?AUTO_5739 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5734 ?AUTO_5735 ) ) ( ON-TABLE ?AUTO_5734 ) ( not ( = ?AUTO_5734 ?AUTO_5737 ) ) ( not ( = ?AUTO_5734 ?AUTO_5736 ) ) ( not ( = ?AUTO_5735 ?AUTO_5737 ) ) ( not ( = ?AUTO_5735 ?AUTO_5736 ) ) ( not ( = ?AUTO_5737 ?AUTO_5736 ) ) ( ON ?AUTO_5737 ?AUTO_5735 ) ( CLEAR ?AUTO_5738 ) ( not ( = ?AUTO_5734 ?AUTO_5738 ) ) ( not ( = ?AUTO_5735 ?AUTO_5738 ) ) ( not ( = ?AUTO_5737 ?AUTO_5738 ) ) ( not ( = ?AUTO_5736 ?AUTO_5738 ) ) ( ON ?AUTO_5736 ?AUTO_5734 ) ( CLEAR ?AUTO_5736 ) ( not ( = ?AUTO_5734 ?AUTO_5739 ) ) ( not ( = ?AUTO_5735 ?AUTO_5739 ) ) ( not ( = ?AUTO_5737 ?AUTO_5739 ) ) ( not ( = ?AUTO_5736 ?AUTO_5739 ) ) ( not ( = ?AUTO_5738 ?AUTO_5739 ) ) ( ON ?AUTO_5739 ?AUTO_5737 ) ( CLEAR ?AUTO_5739 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5739 ?AUTO_5737 )
      ( MAKE-ON ?AUTO_5734 ?AUTO_5735 )
      ( MAKE-ON-VERIFY ?AUTO_5734 ?AUTO_5735 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5741 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5741 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5741 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5741 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5742 - BLOCK
    )
    :vars
    (
      ?AUTO_5743 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5742 ?AUTO_5743 ) ( CLEAR ?AUTO_5742 ) ( HAND-EMPTY ) ( not ( = ?AUTO_5742 ?AUTO_5743 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5742 ?AUTO_5743 )
      ( MAKE-ON-TABLE ?AUTO_5742 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5742 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5745 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5745 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5745 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5745 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5746 - BLOCK
    )
    :vars
    (
      ?AUTO_5747 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5746 ?AUTO_5747 ) ( CLEAR ?AUTO_5746 ) ( HAND-EMPTY ) ( not ( = ?AUTO_5746 ?AUTO_5747 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5746 ?AUTO_5747 )
      ( MAKE-ON-TABLE ?AUTO_5746 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5746 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5748 - BLOCK
    )
    :vars
    (
      ?AUTO_5749 - BLOCK
      ?AUTO_5750 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5748 ?AUTO_5749 ) ( CLEAR ?AUTO_5748 ) ( not ( = ?AUTO_5748 ?AUTO_5749 ) ) ( HOLDING ?AUTO_5750 ) ( not ( = ?AUTO_5748 ?AUTO_5750 ) ) ( not ( = ?AUTO_5749 ?AUTO_5750 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5750 )
      ( MAKE-ON-TABLE ?AUTO_5748 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5748 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5753 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5753 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5753 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5753 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5754 - BLOCK
    )
    :vars
    (
      ?AUTO_5755 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5754 ?AUTO_5755 ) ( CLEAR ?AUTO_5754 ) ( HAND-EMPTY ) ( not ( = ?AUTO_5754 ?AUTO_5755 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5754 ?AUTO_5755 )
      ( MAKE-ON-TABLE ?AUTO_5754 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5754 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5756 - BLOCK
    )
    :vars
    (
      ?AUTO_5757 - BLOCK
      ?AUTO_5758 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5756 ?AUTO_5757 ) ( CLEAR ?AUTO_5756 ) ( not ( = ?AUTO_5756 ?AUTO_5757 ) ) ( HOLDING ?AUTO_5758 ) ( not ( = ?AUTO_5756 ?AUTO_5758 ) ) ( not ( = ?AUTO_5757 ?AUTO_5758 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5758 )
      ( MAKE-ON-TABLE ?AUTO_5756 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5756 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5759 - BLOCK
    )
    :vars
    (
      ?AUTO_5760 - BLOCK
      ?AUTO_5761 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5759 ?AUTO_5760 ) ( not ( = ?AUTO_5759 ?AUTO_5760 ) ) ( not ( = ?AUTO_5759 ?AUTO_5761 ) ) ( not ( = ?AUTO_5760 ?AUTO_5761 ) ) ( ON ?AUTO_5761 ?AUTO_5759 ) ( CLEAR ?AUTO_5761 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5761 ?AUTO_5759 )
      ( MAKE-ON-TABLE ?AUTO_5759 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5759 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5762 - BLOCK
    )
    :vars
    (
      ?AUTO_5763 - BLOCK
      ?AUTO_5764 - BLOCK
      ?AUTO_5765 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5762 ?AUTO_5763 ) ( not ( = ?AUTO_5762 ?AUTO_5763 ) ) ( not ( = ?AUTO_5762 ?AUTO_5764 ) ) ( not ( = ?AUTO_5763 ?AUTO_5764 ) ) ( ON ?AUTO_5764 ?AUTO_5762 ) ( CLEAR ?AUTO_5764 ) ( HOLDING ?AUTO_5765 ) ( not ( = ?AUTO_5762 ?AUTO_5765 ) ) ( not ( = ?AUTO_5763 ?AUTO_5765 ) ) ( not ( = ?AUTO_5764 ?AUTO_5765 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5765 )
      ( MAKE-ON-TABLE ?AUTO_5762 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5762 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5769 - BLOCK
      ?AUTO_5770 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5769 ) ( CLEAR ?AUTO_5770 ) ( not ( = ?AUTO_5769 ?AUTO_5770 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5769 ?AUTO_5770 )
      ( MAKE-ON-VERIFY ?AUTO_5769 ?AUTO_5770 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5771 - BLOCK
      ?AUTO_5772 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5772 ) ( not ( = ?AUTO_5771 ?AUTO_5772 ) ) ( ON-TABLE ?AUTO_5771 ) ( CLEAR ?AUTO_5771 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_5771 )
      ( MAKE-ON ?AUTO_5771 ?AUTO_5772 )
      ( MAKE-ON-VERIFY ?AUTO_5771 ?AUTO_5772 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5773 - BLOCK
      ?AUTO_5774 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5773 ?AUTO_5774 ) ) ( ON-TABLE ?AUTO_5773 ) ( CLEAR ?AUTO_5773 ) ( HOLDING ?AUTO_5774 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5774 )
      ( MAKE-ON ?AUTO_5773 ?AUTO_5774 )
      ( MAKE-ON-VERIFY ?AUTO_5773 ?AUTO_5774 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5789 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5789 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5789 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5789 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5790 - BLOCK
    )
    :vars
    (
      ?AUTO_5791 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5790 ?AUTO_5791 ) ( CLEAR ?AUTO_5790 ) ( HAND-EMPTY ) ( not ( = ?AUTO_5790 ?AUTO_5791 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5790 ?AUTO_5791 )
      ( MAKE-ON-TABLE ?AUTO_5790 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5790 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5792 - BLOCK
    )
    :vars
    (
      ?AUTO_5793 - BLOCK
      ?AUTO_5794 - BLOCK
      ?AUTO_5795 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5792 ?AUTO_5793 ) ( CLEAR ?AUTO_5792 ) ( not ( = ?AUTO_5792 ?AUTO_5793 ) ) ( HOLDING ?AUTO_5794 ) ( CLEAR ?AUTO_5795 ) ( not ( = ?AUTO_5792 ?AUTO_5794 ) ) ( not ( = ?AUTO_5792 ?AUTO_5795 ) ) ( not ( = ?AUTO_5793 ?AUTO_5794 ) ) ( not ( = ?AUTO_5793 ?AUTO_5795 ) ) ( not ( = ?AUTO_5794 ?AUTO_5795 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5794 ?AUTO_5795 )
      ( MAKE-ON-TABLE ?AUTO_5792 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5792 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5798 - BLOCK
    )
    :vars
    (
      ?AUTO_5801 - BLOCK
      ?AUTO_5799 - BLOCK
      ?AUTO_5800 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5798 ?AUTO_5801 ) ( not ( = ?AUTO_5798 ?AUTO_5801 ) ) ( CLEAR ?AUTO_5799 ) ( not ( = ?AUTO_5798 ?AUTO_5800 ) ) ( not ( = ?AUTO_5798 ?AUTO_5799 ) ) ( not ( = ?AUTO_5801 ?AUTO_5800 ) ) ( not ( = ?AUTO_5801 ?AUTO_5799 ) ) ( not ( = ?AUTO_5800 ?AUTO_5799 ) ) ( ON ?AUTO_5800 ?AUTO_5798 ) ( CLEAR ?AUTO_5800 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5800 ?AUTO_5798 )
      ( MAKE-ON-TABLE ?AUTO_5798 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5798 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5802 - BLOCK
    )
    :vars
    (
      ?AUTO_5805 - BLOCK
      ?AUTO_5804 - BLOCK
      ?AUTO_5803 - BLOCK
      ?AUTO_5806 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5802 ?AUTO_5805 ) ( not ( = ?AUTO_5802 ?AUTO_5805 ) ) ( CLEAR ?AUTO_5804 ) ( not ( = ?AUTO_5802 ?AUTO_5803 ) ) ( not ( = ?AUTO_5802 ?AUTO_5804 ) ) ( not ( = ?AUTO_5805 ?AUTO_5803 ) ) ( not ( = ?AUTO_5805 ?AUTO_5804 ) ) ( not ( = ?AUTO_5803 ?AUTO_5804 ) ) ( ON ?AUTO_5803 ?AUTO_5802 ) ( CLEAR ?AUTO_5803 ) ( HOLDING ?AUTO_5806 ) ( not ( = ?AUTO_5802 ?AUTO_5806 ) ) ( not ( = ?AUTO_5805 ?AUTO_5806 ) ) ( not ( = ?AUTO_5804 ?AUTO_5806 ) ) ( not ( = ?AUTO_5803 ?AUTO_5806 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5806 )
      ( MAKE-ON-TABLE ?AUTO_5802 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5802 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5807 - BLOCK
    )
    :vars
    (
      ?AUTO_5811 - BLOCK
      ?AUTO_5808 - BLOCK
      ?AUTO_5810 - BLOCK
      ?AUTO_5809 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5807 ?AUTO_5811 ) ( not ( = ?AUTO_5807 ?AUTO_5811 ) ) ( CLEAR ?AUTO_5808 ) ( not ( = ?AUTO_5807 ?AUTO_5810 ) ) ( not ( = ?AUTO_5807 ?AUTO_5808 ) ) ( not ( = ?AUTO_5811 ?AUTO_5810 ) ) ( not ( = ?AUTO_5811 ?AUTO_5808 ) ) ( not ( = ?AUTO_5810 ?AUTO_5808 ) ) ( ON ?AUTO_5810 ?AUTO_5807 ) ( not ( = ?AUTO_5807 ?AUTO_5809 ) ) ( not ( = ?AUTO_5811 ?AUTO_5809 ) ) ( not ( = ?AUTO_5808 ?AUTO_5809 ) ) ( not ( = ?AUTO_5810 ?AUTO_5809 ) ) ( ON ?AUTO_5809 ?AUTO_5810 ) ( CLEAR ?AUTO_5809 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5809 ?AUTO_5810 )
      ( MAKE-ON-TABLE ?AUTO_5807 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5807 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5812 - BLOCK
    )
    :vars
    (
      ?AUTO_5813 - BLOCK
      ?AUTO_5816 - BLOCK
      ?AUTO_5814 - BLOCK
      ?AUTO_5815 - BLOCK
      ?AUTO_5817 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5812 ?AUTO_5813 ) ( not ( = ?AUTO_5812 ?AUTO_5813 ) ) ( CLEAR ?AUTO_5816 ) ( not ( = ?AUTO_5812 ?AUTO_5814 ) ) ( not ( = ?AUTO_5812 ?AUTO_5816 ) ) ( not ( = ?AUTO_5813 ?AUTO_5814 ) ) ( not ( = ?AUTO_5813 ?AUTO_5816 ) ) ( not ( = ?AUTO_5814 ?AUTO_5816 ) ) ( ON ?AUTO_5814 ?AUTO_5812 ) ( not ( = ?AUTO_5812 ?AUTO_5815 ) ) ( not ( = ?AUTO_5813 ?AUTO_5815 ) ) ( not ( = ?AUTO_5816 ?AUTO_5815 ) ) ( not ( = ?AUTO_5814 ?AUTO_5815 ) ) ( ON ?AUTO_5815 ?AUTO_5814 ) ( CLEAR ?AUTO_5815 ) ( HOLDING ?AUTO_5817 ) ( not ( = ?AUTO_5812 ?AUTO_5817 ) ) ( not ( = ?AUTO_5813 ?AUTO_5817 ) ) ( not ( = ?AUTO_5816 ?AUTO_5817 ) ) ( not ( = ?AUTO_5814 ?AUTO_5817 ) ) ( not ( = ?AUTO_5815 ?AUTO_5817 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5817 )
      ( MAKE-ON-TABLE ?AUTO_5812 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5812 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5820 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5820 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5820 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5820 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5821 - BLOCK
    )
    :vars
    (
      ?AUTO_5822 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5821 ?AUTO_5822 ) ( CLEAR ?AUTO_5821 ) ( HAND-EMPTY ) ( not ( = ?AUTO_5821 ?AUTO_5822 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5821 ?AUTO_5822 )
      ( MAKE-ON-TABLE ?AUTO_5821 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5821 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5823 - BLOCK
    )
    :vars
    (
      ?AUTO_5824 - BLOCK
      ?AUTO_5825 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5823 ?AUTO_5824 ) ( CLEAR ?AUTO_5823 ) ( not ( = ?AUTO_5823 ?AUTO_5824 ) ) ( HOLDING ?AUTO_5825 ) ( not ( = ?AUTO_5823 ?AUTO_5825 ) ) ( not ( = ?AUTO_5824 ?AUTO_5825 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5825 )
      ( MAKE-ON-TABLE ?AUTO_5823 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5823 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5826 - BLOCK
    )
    :vars
    (
      ?AUTO_5828 - BLOCK
      ?AUTO_5827 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5826 ?AUTO_5828 ) ( not ( = ?AUTO_5826 ?AUTO_5828 ) ) ( not ( = ?AUTO_5826 ?AUTO_5827 ) ) ( not ( = ?AUTO_5828 ?AUTO_5827 ) ) ( ON ?AUTO_5827 ?AUTO_5826 ) ( CLEAR ?AUTO_5827 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5827 ?AUTO_5826 )
      ( MAKE-ON-TABLE ?AUTO_5826 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5826 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5829 - BLOCK
    )
    :vars
    (
      ?AUTO_5830 - BLOCK
      ?AUTO_5831 - BLOCK
      ?AUTO_5832 - BLOCK
      ?AUTO_5833 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5829 ?AUTO_5830 ) ( not ( = ?AUTO_5829 ?AUTO_5830 ) ) ( not ( = ?AUTO_5829 ?AUTO_5831 ) ) ( not ( = ?AUTO_5830 ?AUTO_5831 ) ) ( ON ?AUTO_5831 ?AUTO_5829 ) ( CLEAR ?AUTO_5831 ) ( HOLDING ?AUTO_5832 ) ( CLEAR ?AUTO_5833 ) ( not ( = ?AUTO_5829 ?AUTO_5832 ) ) ( not ( = ?AUTO_5829 ?AUTO_5833 ) ) ( not ( = ?AUTO_5830 ?AUTO_5832 ) ) ( not ( = ?AUTO_5830 ?AUTO_5833 ) ) ( not ( = ?AUTO_5831 ?AUTO_5832 ) ) ( not ( = ?AUTO_5831 ?AUTO_5833 ) ) ( not ( = ?AUTO_5832 ?AUTO_5833 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5832 ?AUTO_5833 )
      ( MAKE-ON-TABLE ?AUTO_5829 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5829 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5836 - BLOCK
    )
    :vars
    (
      ?AUTO_5840 - BLOCK
      ?AUTO_5839 - BLOCK
      ?AUTO_5838 - BLOCK
      ?AUTO_5837 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5836 ?AUTO_5840 ) ( not ( = ?AUTO_5836 ?AUTO_5840 ) ) ( not ( = ?AUTO_5836 ?AUTO_5839 ) ) ( not ( = ?AUTO_5840 ?AUTO_5839 ) ) ( ON ?AUTO_5839 ?AUTO_5836 ) ( CLEAR ?AUTO_5838 ) ( not ( = ?AUTO_5836 ?AUTO_5837 ) ) ( not ( = ?AUTO_5836 ?AUTO_5838 ) ) ( not ( = ?AUTO_5840 ?AUTO_5837 ) ) ( not ( = ?AUTO_5840 ?AUTO_5838 ) ) ( not ( = ?AUTO_5839 ?AUTO_5837 ) ) ( not ( = ?AUTO_5839 ?AUTO_5838 ) ) ( not ( = ?AUTO_5837 ?AUTO_5838 ) ) ( ON ?AUTO_5837 ?AUTO_5839 ) ( CLEAR ?AUTO_5837 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5837 ?AUTO_5839 )
      ( MAKE-ON-TABLE ?AUTO_5836 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5836 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5841 - BLOCK
    )
    :vars
    (
      ?AUTO_5842 - BLOCK
      ?AUTO_5843 - BLOCK
      ?AUTO_5845 - BLOCK
      ?AUTO_5844 - BLOCK
      ?AUTO_5846 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5841 ?AUTO_5842 ) ( not ( = ?AUTO_5841 ?AUTO_5842 ) ) ( not ( = ?AUTO_5841 ?AUTO_5843 ) ) ( not ( = ?AUTO_5842 ?AUTO_5843 ) ) ( ON ?AUTO_5843 ?AUTO_5841 ) ( CLEAR ?AUTO_5845 ) ( not ( = ?AUTO_5841 ?AUTO_5844 ) ) ( not ( = ?AUTO_5841 ?AUTO_5845 ) ) ( not ( = ?AUTO_5842 ?AUTO_5844 ) ) ( not ( = ?AUTO_5842 ?AUTO_5845 ) ) ( not ( = ?AUTO_5843 ?AUTO_5844 ) ) ( not ( = ?AUTO_5843 ?AUTO_5845 ) ) ( not ( = ?AUTO_5844 ?AUTO_5845 ) ) ( ON ?AUTO_5844 ?AUTO_5843 ) ( CLEAR ?AUTO_5844 ) ( HOLDING ?AUTO_5846 ) ( not ( = ?AUTO_5841 ?AUTO_5846 ) ) ( not ( = ?AUTO_5842 ?AUTO_5846 ) ) ( not ( = ?AUTO_5843 ?AUTO_5846 ) ) ( not ( = ?AUTO_5845 ?AUTO_5846 ) ) ( not ( = ?AUTO_5844 ?AUTO_5846 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5846 )
      ( MAKE-ON-TABLE ?AUTO_5841 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5841 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5847 - BLOCK
    )
    :vars
    (
      ?AUTO_5849 - BLOCK
      ?AUTO_5848 - BLOCK
      ?AUTO_5850 - BLOCK
      ?AUTO_5851 - BLOCK
      ?AUTO_5852 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5847 ?AUTO_5849 ) ( not ( = ?AUTO_5847 ?AUTO_5849 ) ) ( not ( = ?AUTO_5847 ?AUTO_5848 ) ) ( not ( = ?AUTO_5849 ?AUTO_5848 ) ) ( ON ?AUTO_5848 ?AUTO_5847 ) ( CLEAR ?AUTO_5850 ) ( not ( = ?AUTO_5847 ?AUTO_5851 ) ) ( not ( = ?AUTO_5847 ?AUTO_5850 ) ) ( not ( = ?AUTO_5849 ?AUTO_5851 ) ) ( not ( = ?AUTO_5849 ?AUTO_5850 ) ) ( not ( = ?AUTO_5848 ?AUTO_5851 ) ) ( not ( = ?AUTO_5848 ?AUTO_5850 ) ) ( not ( = ?AUTO_5851 ?AUTO_5850 ) ) ( ON ?AUTO_5851 ?AUTO_5848 ) ( not ( = ?AUTO_5847 ?AUTO_5852 ) ) ( not ( = ?AUTO_5849 ?AUTO_5852 ) ) ( not ( = ?AUTO_5848 ?AUTO_5852 ) ) ( not ( = ?AUTO_5850 ?AUTO_5852 ) ) ( not ( = ?AUTO_5851 ?AUTO_5852 ) ) ( ON ?AUTO_5852 ?AUTO_5851 ) ( CLEAR ?AUTO_5852 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5852 ?AUTO_5851 )
      ( MAKE-ON-TABLE ?AUTO_5847 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5847 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5853 - BLOCK
    )
    :vars
    (
      ?AUTO_5857 - BLOCK
      ?AUTO_5855 - BLOCK
      ?AUTO_5854 - BLOCK
      ?AUTO_5856 - BLOCK
      ?AUTO_5858 - BLOCK
      ?AUTO_5859 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5853 ?AUTO_5857 ) ( not ( = ?AUTO_5853 ?AUTO_5857 ) ) ( not ( = ?AUTO_5853 ?AUTO_5855 ) ) ( not ( = ?AUTO_5857 ?AUTO_5855 ) ) ( ON ?AUTO_5855 ?AUTO_5853 ) ( CLEAR ?AUTO_5854 ) ( not ( = ?AUTO_5853 ?AUTO_5856 ) ) ( not ( = ?AUTO_5853 ?AUTO_5854 ) ) ( not ( = ?AUTO_5857 ?AUTO_5856 ) ) ( not ( = ?AUTO_5857 ?AUTO_5854 ) ) ( not ( = ?AUTO_5855 ?AUTO_5856 ) ) ( not ( = ?AUTO_5855 ?AUTO_5854 ) ) ( not ( = ?AUTO_5856 ?AUTO_5854 ) ) ( ON ?AUTO_5856 ?AUTO_5855 ) ( not ( = ?AUTO_5853 ?AUTO_5858 ) ) ( not ( = ?AUTO_5857 ?AUTO_5858 ) ) ( not ( = ?AUTO_5855 ?AUTO_5858 ) ) ( not ( = ?AUTO_5854 ?AUTO_5858 ) ) ( not ( = ?AUTO_5856 ?AUTO_5858 ) ) ( ON ?AUTO_5858 ?AUTO_5856 ) ( CLEAR ?AUTO_5858 ) ( HOLDING ?AUTO_5859 ) ( not ( = ?AUTO_5853 ?AUTO_5859 ) ) ( not ( = ?AUTO_5857 ?AUTO_5859 ) ) ( not ( = ?AUTO_5855 ?AUTO_5859 ) ) ( not ( = ?AUTO_5854 ?AUTO_5859 ) ) ( not ( = ?AUTO_5856 ?AUTO_5859 ) ) ( not ( = ?AUTO_5858 ?AUTO_5859 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5859 )
      ( MAKE-ON-TABLE ?AUTO_5853 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5853 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5863 - BLOCK
      ?AUTO_5864 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5863 ) ( CLEAR ?AUTO_5864 ) ( not ( = ?AUTO_5863 ?AUTO_5864 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5863 ?AUTO_5864 )
      ( MAKE-ON-VERIFY ?AUTO_5863 ?AUTO_5864 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5865 - BLOCK
      ?AUTO_5866 - BLOCK
    )
    :vars
    (
      ?AUTO_5867 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5866 ) ( not ( = ?AUTO_5865 ?AUTO_5866 ) ) ( ON ?AUTO_5865 ?AUTO_5867 ) ( CLEAR ?AUTO_5865 ) ( HAND-EMPTY ) ( not ( = ?AUTO_5865 ?AUTO_5867 ) ) ( not ( = ?AUTO_5866 ?AUTO_5867 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5865 ?AUTO_5867 )
      ( MAKE-ON ?AUTO_5865 ?AUTO_5866 )
      ( MAKE-ON-VERIFY ?AUTO_5865 ?AUTO_5866 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5868 - BLOCK
      ?AUTO_5869 - BLOCK
    )
    :vars
    (
      ?AUTO_5870 - BLOCK
      ?AUTO_5871 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5869 ) ( not ( = ?AUTO_5868 ?AUTO_5869 ) ) ( ON ?AUTO_5868 ?AUTO_5870 ) ( CLEAR ?AUTO_5868 ) ( not ( = ?AUTO_5868 ?AUTO_5870 ) ) ( not ( = ?AUTO_5869 ?AUTO_5870 ) ) ( HOLDING ?AUTO_5871 ) ( not ( = ?AUTO_5868 ?AUTO_5871 ) ) ( not ( = ?AUTO_5869 ?AUTO_5871 ) ) ( not ( = ?AUTO_5870 ?AUTO_5871 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5871 )
      ( MAKE-ON ?AUTO_5868 ?AUTO_5869 )
      ( MAKE-ON-VERIFY ?AUTO_5868 ?AUTO_5869 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5872 - BLOCK
      ?AUTO_5873 - BLOCK
    )
    :vars
    (
      ?AUTO_5874 - BLOCK
      ?AUTO_5875 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5872 ?AUTO_5873 ) ) ( ON ?AUTO_5872 ?AUTO_5874 ) ( CLEAR ?AUTO_5872 ) ( not ( = ?AUTO_5872 ?AUTO_5874 ) ) ( not ( = ?AUTO_5873 ?AUTO_5874 ) ) ( not ( = ?AUTO_5872 ?AUTO_5875 ) ) ( not ( = ?AUTO_5873 ?AUTO_5875 ) ) ( not ( = ?AUTO_5874 ?AUTO_5875 ) ) ( ON ?AUTO_5875 ?AUTO_5873 ) ( CLEAR ?AUTO_5875 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5875 ?AUTO_5873 )
      ( MAKE-ON ?AUTO_5872 ?AUTO_5873 )
      ( MAKE-ON-VERIFY ?AUTO_5872 ?AUTO_5873 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5876 - BLOCK
      ?AUTO_5877 - BLOCK
    )
    :vars
    (
      ?AUTO_5878 - BLOCK
      ?AUTO_5879 - BLOCK
      ?AUTO_5880 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5876 ?AUTO_5877 ) ) ( ON ?AUTO_5876 ?AUTO_5878 ) ( CLEAR ?AUTO_5876 ) ( not ( = ?AUTO_5876 ?AUTO_5878 ) ) ( not ( = ?AUTO_5877 ?AUTO_5878 ) ) ( not ( = ?AUTO_5876 ?AUTO_5879 ) ) ( not ( = ?AUTO_5877 ?AUTO_5879 ) ) ( not ( = ?AUTO_5878 ?AUTO_5879 ) ) ( ON ?AUTO_5879 ?AUTO_5877 ) ( CLEAR ?AUTO_5879 ) ( HOLDING ?AUTO_5880 ) ( not ( = ?AUTO_5876 ?AUTO_5880 ) ) ( not ( = ?AUTO_5877 ?AUTO_5880 ) ) ( not ( = ?AUTO_5878 ?AUTO_5880 ) ) ( not ( = ?AUTO_5879 ?AUTO_5880 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5880 )
      ( MAKE-ON ?AUTO_5876 ?AUTO_5877 )
      ( MAKE-ON-VERIFY ?AUTO_5876 ?AUTO_5877 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5881 - BLOCK
      ?AUTO_5882 - BLOCK
    )
    :vars
    (
      ?AUTO_5883 - BLOCK
      ?AUTO_5884 - BLOCK
      ?AUTO_5885 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5881 ?AUTO_5882 ) ) ( ON ?AUTO_5881 ?AUTO_5883 ) ( CLEAR ?AUTO_5881 ) ( not ( = ?AUTO_5881 ?AUTO_5883 ) ) ( not ( = ?AUTO_5882 ?AUTO_5883 ) ) ( not ( = ?AUTO_5881 ?AUTO_5884 ) ) ( not ( = ?AUTO_5882 ?AUTO_5884 ) ) ( not ( = ?AUTO_5883 ?AUTO_5884 ) ) ( ON ?AUTO_5884 ?AUTO_5882 ) ( not ( = ?AUTO_5881 ?AUTO_5885 ) ) ( not ( = ?AUTO_5882 ?AUTO_5885 ) ) ( not ( = ?AUTO_5883 ?AUTO_5885 ) ) ( not ( = ?AUTO_5884 ?AUTO_5885 ) ) ( ON ?AUTO_5885 ?AUTO_5884 ) ( CLEAR ?AUTO_5885 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5885 ?AUTO_5884 )
      ( MAKE-ON ?AUTO_5881 ?AUTO_5882 )
      ( MAKE-ON-VERIFY ?AUTO_5881 ?AUTO_5882 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5886 - BLOCK
      ?AUTO_5887 - BLOCK
    )
    :vars
    (
      ?AUTO_5889 - BLOCK
      ?AUTO_5888 - BLOCK
      ?AUTO_5890 - BLOCK
      ?AUTO_5891 - BLOCK
      ?AUTO_5892 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5886 ?AUTO_5887 ) ) ( ON ?AUTO_5886 ?AUTO_5889 ) ( CLEAR ?AUTO_5886 ) ( not ( = ?AUTO_5886 ?AUTO_5889 ) ) ( not ( = ?AUTO_5887 ?AUTO_5889 ) ) ( not ( = ?AUTO_5886 ?AUTO_5888 ) ) ( not ( = ?AUTO_5887 ?AUTO_5888 ) ) ( not ( = ?AUTO_5889 ?AUTO_5888 ) ) ( ON ?AUTO_5888 ?AUTO_5887 ) ( not ( = ?AUTO_5886 ?AUTO_5890 ) ) ( not ( = ?AUTO_5887 ?AUTO_5890 ) ) ( not ( = ?AUTO_5889 ?AUTO_5890 ) ) ( not ( = ?AUTO_5888 ?AUTO_5890 ) ) ( ON ?AUTO_5890 ?AUTO_5888 ) ( CLEAR ?AUTO_5890 ) ( HOLDING ?AUTO_5891 ) ( CLEAR ?AUTO_5892 ) ( not ( = ?AUTO_5886 ?AUTO_5891 ) ) ( not ( = ?AUTO_5886 ?AUTO_5892 ) ) ( not ( = ?AUTO_5887 ?AUTO_5891 ) ) ( not ( = ?AUTO_5887 ?AUTO_5892 ) ) ( not ( = ?AUTO_5889 ?AUTO_5891 ) ) ( not ( = ?AUTO_5889 ?AUTO_5892 ) ) ( not ( = ?AUTO_5888 ?AUTO_5891 ) ) ( not ( = ?AUTO_5888 ?AUTO_5892 ) ) ( not ( = ?AUTO_5890 ?AUTO_5891 ) ) ( not ( = ?AUTO_5890 ?AUTO_5892 ) ) ( not ( = ?AUTO_5891 ?AUTO_5892 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5891 ?AUTO_5892 )
      ( MAKE-ON ?AUTO_5886 ?AUTO_5887 )
      ( MAKE-ON-VERIFY ?AUTO_5886 ?AUTO_5887 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5897 - BLOCK
      ?AUTO_5898 - BLOCK
    )
    :vars
    (
      ?AUTO_5902 - BLOCK
      ?AUTO_5901 - BLOCK
      ?AUTO_5903 - BLOCK
      ?AUTO_5900 - BLOCK
      ?AUTO_5899 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5897 ?AUTO_5898 ) ) ( ON ?AUTO_5897 ?AUTO_5902 ) ( CLEAR ?AUTO_5897 ) ( not ( = ?AUTO_5897 ?AUTO_5902 ) ) ( not ( = ?AUTO_5898 ?AUTO_5902 ) ) ( not ( = ?AUTO_5897 ?AUTO_5901 ) ) ( not ( = ?AUTO_5898 ?AUTO_5901 ) ) ( not ( = ?AUTO_5902 ?AUTO_5901 ) ) ( ON ?AUTO_5901 ?AUTO_5898 ) ( not ( = ?AUTO_5897 ?AUTO_5903 ) ) ( not ( = ?AUTO_5898 ?AUTO_5903 ) ) ( not ( = ?AUTO_5902 ?AUTO_5903 ) ) ( not ( = ?AUTO_5901 ?AUTO_5903 ) ) ( ON ?AUTO_5903 ?AUTO_5901 ) ( CLEAR ?AUTO_5900 ) ( not ( = ?AUTO_5897 ?AUTO_5899 ) ) ( not ( = ?AUTO_5897 ?AUTO_5900 ) ) ( not ( = ?AUTO_5898 ?AUTO_5899 ) ) ( not ( = ?AUTO_5898 ?AUTO_5900 ) ) ( not ( = ?AUTO_5902 ?AUTO_5899 ) ) ( not ( = ?AUTO_5902 ?AUTO_5900 ) ) ( not ( = ?AUTO_5901 ?AUTO_5899 ) ) ( not ( = ?AUTO_5901 ?AUTO_5900 ) ) ( not ( = ?AUTO_5903 ?AUTO_5899 ) ) ( not ( = ?AUTO_5903 ?AUTO_5900 ) ) ( not ( = ?AUTO_5899 ?AUTO_5900 ) ) ( ON ?AUTO_5899 ?AUTO_5903 ) ( CLEAR ?AUTO_5899 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5899 ?AUTO_5903 )
      ( MAKE-ON ?AUTO_5897 ?AUTO_5898 )
      ( MAKE-ON-VERIFY ?AUTO_5897 ?AUTO_5898 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5904 - BLOCK
      ?AUTO_5905 - BLOCK
    )
    :vars
    (
      ?AUTO_5906 - BLOCK
      ?AUTO_5909 - BLOCK
      ?AUTO_5908 - BLOCK
      ?AUTO_5907 - BLOCK
      ?AUTO_5910 - BLOCK
      ?AUTO_5911 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5904 ?AUTO_5905 ) ) ( ON ?AUTO_5904 ?AUTO_5906 ) ( CLEAR ?AUTO_5904 ) ( not ( = ?AUTO_5904 ?AUTO_5906 ) ) ( not ( = ?AUTO_5905 ?AUTO_5906 ) ) ( not ( = ?AUTO_5904 ?AUTO_5909 ) ) ( not ( = ?AUTO_5905 ?AUTO_5909 ) ) ( not ( = ?AUTO_5906 ?AUTO_5909 ) ) ( ON ?AUTO_5909 ?AUTO_5905 ) ( not ( = ?AUTO_5904 ?AUTO_5908 ) ) ( not ( = ?AUTO_5905 ?AUTO_5908 ) ) ( not ( = ?AUTO_5906 ?AUTO_5908 ) ) ( not ( = ?AUTO_5909 ?AUTO_5908 ) ) ( ON ?AUTO_5908 ?AUTO_5909 ) ( CLEAR ?AUTO_5907 ) ( not ( = ?AUTO_5904 ?AUTO_5910 ) ) ( not ( = ?AUTO_5904 ?AUTO_5907 ) ) ( not ( = ?AUTO_5905 ?AUTO_5910 ) ) ( not ( = ?AUTO_5905 ?AUTO_5907 ) ) ( not ( = ?AUTO_5906 ?AUTO_5910 ) ) ( not ( = ?AUTO_5906 ?AUTO_5907 ) ) ( not ( = ?AUTO_5909 ?AUTO_5910 ) ) ( not ( = ?AUTO_5909 ?AUTO_5907 ) ) ( not ( = ?AUTO_5908 ?AUTO_5910 ) ) ( not ( = ?AUTO_5908 ?AUTO_5907 ) ) ( not ( = ?AUTO_5910 ?AUTO_5907 ) ) ( ON ?AUTO_5910 ?AUTO_5908 ) ( CLEAR ?AUTO_5910 ) ( HOLDING ?AUTO_5911 ) ( not ( = ?AUTO_5904 ?AUTO_5911 ) ) ( not ( = ?AUTO_5905 ?AUTO_5911 ) ) ( not ( = ?AUTO_5906 ?AUTO_5911 ) ) ( not ( = ?AUTO_5909 ?AUTO_5911 ) ) ( not ( = ?AUTO_5908 ?AUTO_5911 ) ) ( not ( = ?AUTO_5907 ?AUTO_5911 ) ) ( not ( = ?AUTO_5910 ?AUTO_5911 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5911 )
      ( MAKE-ON ?AUTO_5904 ?AUTO_5905 )
      ( MAKE-ON-VERIFY ?AUTO_5904 ?AUTO_5905 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5912 - BLOCK
      ?AUTO_5913 - BLOCK
    )
    :vars
    (
      ?AUTO_5916 - BLOCK
      ?AUTO_5918 - BLOCK
      ?AUTO_5915 - BLOCK
      ?AUTO_5917 - BLOCK
      ?AUTO_5919 - BLOCK
      ?AUTO_5914 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5912 ?AUTO_5913 ) ) ( ON ?AUTO_5912 ?AUTO_5916 ) ( CLEAR ?AUTO_5912 ) ( not ( = ?AUTO_5912 ?AUTO_5916 ) ) ( not ( = ?AUTO_5913 ?AUTO_5916 ) ) ( not ( = ?AUTO_5912 ?AUTO_5918 ) ) ( not ( = ?AUTO_5913 ?AUTO_5918 ) ) ( not ( = ?AUTO_5916 ?AUTO_5918 ) ) ( ON ?AUTO_5918 ?AUTO_5913 ) ( not ( = ?AUTO_5912 ?AUTO_5915 ) ) ( not ( = ?AUTO_5913 ?AUTO_5915 ) ) ( not ( = ?AUTO_5916 ?AUTO_5915 ) ) ( not ( = ?AUTO_5918 ?AUTO_5915 ) ) ( ON ?AUTO_5915 ?AUTO_5918 ) ( CLEAR ?AUTO_5917 ) ( not ( = ?AUTO_5912 ?AUTO_5919 ) ) ( not ( = ?AUTO_5912 ?AUTO_5917 ) ) ( not ( = ?AUTO_5913 ?AUTO_5919 ) ) ( not ( = ?AUTO_5913 ?AUTO_5917 ) ) ( not ( = ?AUTO_5916 ?AUTO_5919 ) ) ( not ( = ?AUTO_5916 ?AUTO_5917 ) ) ( not ( = ?AUTO_5918 ?AUTO_5919 ) ) ( not ( = ?AUTO_5918 ?AUTO_5917 ) ) ( not ( = ?AUTO_5915 ?AUTO_5919 ) ) ( not ( = ?AUTO_5915 ?AUTO_5917 ) ) ( not ( = ?AUTO_5919 ?AUTO_5917 ) ) ( ON ?AUTO_5919 ?AUTO_5915 ) ( not ( = ?AUTO_5912 ?AUTO_5914 ) ) ( not ( = ?AUTO_5913 ?AUTO_5914 ) ) ( not ( = ?AUTO_5916 ?AUTO_5914 ) ) ( not ( = ?AUTO_5918 ?AUTO_5914 ) ) ( not ( = ?AUTO_5915 ?AUTO_5914 ) ) ( not ( = ?AUTO_5917 ?AUTO_5914 ) ) ( not ( = ?AUTO_5919 ?AUTO_5914 ) ) ( ON ?AUTO_5914 ?AUTO_5919 ) ( CLEAR ?AUTO_5914 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5914 ?AUTO_5919 )
      ( MAKE-ON ?AUTO_5912 ?AUTO_5913 )
      ( MAKE-ON-VERIFY ?AUTO_5912 ?AUTO_5913 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5920 - BLOCK
      ?AUTO_5921 - BLOCK
    )
    :vars
    (
      ?AUTO_5923 - BLOCK
      ?AUTO_5926 - BLOCK
      ?AUTO_5924 - BLOCK
      ?AUTO_5927 - BLOCK
      ?AUTO_5925 - BLOCK
      ?AUTO_5922 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5920 ?AUTO_5921 ) ) ( ON ?AUTO_5920 ?AUTO_5923 ) ( CLEAR ?AUTO_5920 ) ( not ( = ?AUTO_5920 ?AUTO_5923 ) ) ( not ( = ?AUTO_5921 ?AUTO_5923 ) ) ( not ( = ?AUTO_5920 ?AUTO_5926 ) ) ( not ( = ?AUTO_5921 ?AUTO_5926 ) ) ( not ( = ?AUTO_5923 ?AUTO_5926 ) ) ( ON ?AUTO_5926 ?AUTO_5921 ) ( not ( = ?AUTO_5920 ?AUTO_5924 ) ) ( not ( = ?AUTO_5921 ?AUTO_5924 ) ) ( not ( = ?AUTO_5923 ?AUTO_5924 ) ) ( not ( = ?AUTO_5926 ?AUTO_5924 ) ) ( ON ?AUTO_5924 ?AUTO_5926 ) ( not ( = ?AUTO_5920 ?AUTO_5927 ) ) ( not ( = ?AUTO_5920 ?AUTO_5925 ) ) ( not ( = ?AUTO_5921 ?AUTO_5927 ) ) ( not ( = ?AUTO_5921 ?AUTO_5925 ) ) ( not ( = ?AUTO_5923 ?AUTO_5927 ) ) ( not ( = ?AUTO_5923 ?AUTO_5925 ) ) ( not ( = ?AUTO_5926 ?AUTO_5927 ) ) ( not ( = ?AUTO_5926 ?AUTO_5925 ) ) ( not ( = ?AUTO_5924 ?AUTO_5927 ) ) ( not ( = ?AUTO_5924 ?AUTO_5925 ) ) ( not ( = ?AUTO_5927 ?AUTO_5925 ) ) ( ON ?AUTO_5927 ?AUTO_5924 ) ( not ( = ?AUTO_5920 ?AUTO_5922 ) ) ( not ( = ?AUTO_5921 ?AUTO_5922 ) ) ( not ( = ?AUTO_5923 ?AUTO_5922 ) ) ( not ( = ?AUTO_5926 ?AUTO_5922 ) ) ( not ( = ?AUTO_5924 ?AUTO_5922 ) ) ( not ( = ?AUTO_5925 ?AUTO_5922 ) ) ( not ( = ?AUTO_5927 ?AUTO_5922 ) ) ( ON ?AUTO_5922 ?AUTO_5927 ) ( CLEAR ?AUTO_5922 ) ( HOLDING ?AUTO_5925 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5925 )
      ( MAKE-ON ?AUTO_5920 ?AUTO_5921 )
      ( MAKE-ON-VERIFY ?AUTO_5920 ?AUTO_5921 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5928 - BLOCK
      ?AUTO_5929 - BLOCK
    )
    :vars
    (
      ?AUTO_5931 - BLOCK
      ?AUTO_5930 - BLOCK
      ?AUTO_5933 - BLOCK
      ?AUTO_5934 - BLOCK
      ?AUTO_5935 - BLOCK
      ?AUTO_5932 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5928 ?AUTO_5929 ) ) ( ON ?AUTO_5928 ?AUTO_5931 ) ( not ( = ?AUTO_5928 ?AUTO_5931 ) ) ( not ( = ?AUTO_5929 ?AUTO_5931 ) ) ( not ( = ?AUTO_5928 ?AUTO_5930 ) ) ( not ( = ?AUTO_5929 ?AUTO_5930 ) ) ( not ( = ?AUTO_5931 ?AUTO_5930 ) ) ( ON ?AUTO_5930 ?AUTO_5929 ) ( not ( = ?AUTO_5928 ?AUTO_5933 ) ) ( not ( = ?AUTO_5929 ?AUTO_5933 ) ) ( not ( = ?AUTO_5931 ?AUTO_5933 ) ) ( not ( = ?AUTO_5930 ?AUTO_5933 ) ) ( ON ?AUTO_5933 ?AUTO_5930 ) ( not ( = ?AUTO_5928 ?AUTO_5934 ) ) ( not ( = ?AUTO_5928 ?AUTO_5935 ) ) ( not ( = ?AUTO_5929 ?AUTO_5934 ) ) ( not ( = ?AUTO_5929 ?AUTO_5935 ) ) ( not ( = ?AUTO_5931 ?AUTO_5934 ) ) ( not ( = ?AUTO_5931 ?AUTO_5935 ) ) ( not ( = ?AUTO_5930 ?AUTO_5934 ) ) ( not ( = ?AUTO_5930 ?AUTO_5935 ) ) ( not ( = ?AUTO_5933 ?AUTO_5934 ) ) ( not ( = ?AUTO_5933 ?AUTO_5935 ) ) ( not ( = ?AUTO_5934 ?AUTO_5935 ) ) ( ON ?AUTO_5934 ?AUTO_5933 ) ( not ( = ?AUTO_5928 ?AUTO_5932 ) ) ( not ( = ?AUTO_5929 ?AUTO_5932 ) ) ( not ( = ?AUTO_5931 ?AUTO_5932 ) ) ( not ( = ?AUTO_5930 ?AUTO_5932 ) ) ( not ( = ?AUTO_5933 ?AUTO_5932 ) ) ( not ( = ?AUTO_5935 ?AUTO_5932 ) ) ( not ( = ?AUTO_5934 ?AUTO_5932 ) ) ( ON ?AUTO_5932 ?AUTO_5934 ) ( CLEAR ?AUTO_5932 ) ( ON ?AUTO_5935 ?AUTO_5928 ) ( CLEAR ?AUTO_5935 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5935 ?AUTO_5928 )
      ( MAKE-ON ?AUTO_5928 ?AUTO_5929 )
      ( MAKE-ON-VERIFY ?AUTO_5928 ?AUTO_5929 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5938 - BLOCK
      ?AUTO_5939 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5938 ) ( CLEAR ?AUTO_5939 ) ( not ( = ?AUTO_5938 ?AUTO_5939 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5938 ?AUTO_5939 )
      ( MAKE-ON-VERIFY ?AUTO_5938 ?AUTO_5939 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5940 - BLOCK
      ?AUTO_5941 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5941 ) ( not ( = ?AUTO_5940 ?AUTO_5941 ) ) ( ON-TABLE ?AUTO_5940 ) ( CLEAR ?AUTO_5940 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_5940 )
      ( MAKE-ON ?AUTO_5940 ?AUTO_5941 )
      ( MAKE-ON-VERIFY ?AUTO_5940 ?AUTO_5941 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5942 - BLOCK
      ?AUTO_5943 - BLOCK
    )
    :vars
    (
      ?AUTO_5944 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5942 ?AUTO_5943 ) ) ( ON-TABLE ?AUTO_5942 ) ( CLEAR ?AUTO_5942 ) ( HOLDING ?AUTO_5943 ) ( CLEAR ?AUTO_5944 ) ( not ( = ?AUTO_5942 ?AUTO_5944 ) ) ( not ( = ?AUTO_5943 ?AUTO_5944 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5943 ?AUTO_5944 )
      ( MAKE-ON ?AUTO_5942 ?AUTO_5943 )
      ( MAKE-ON-VERIFY ?AUTO_5942 ?AUTO_5943 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5953 - BLOCK
      ?AUTO_5954 - BLOCK
    )
    :vars
    (
      ?AUTO_5956 - BLOCK
      ?AUTO_5955 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5954 ) ( not ( = ?AUTO_5953 ?AUTO_5954 ) ) ( ON ?AUTO_5953 ?AUTO_5956 ) ( not ( = ?AUTO_5953 ?AUTO_5956 ) ) ( not ( = ?AUTO_5954 ?AUTO_5956 ) ) ( not ( = ?AUTO_5953 ?AUTO_5955 ) ) ( not ( = ?AUTO_5954 ?AUTO_5955 ) ) ( not ( = ?AUTO_5956 ?AUTO_5955 ) ) ( ON ?AUTO_5955 ?AUTO_5953 ) ( CLEAR ?AUTO_5955 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5955 ?AUTO_5953 )
      ( MAKE-ON ?AUTO_5953 ?AUTO_5954 )
      ( MAKE-ON-VERIFY ?AUTO_5953 ?AUTO_5954 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5957 - BLOCK
      ?AUTO_5958 - BLOCK
    )
    :vars
    (
      ?AUTO_5959 - BLOCK
      ?AUTO_5960 - BLOCK
      ?AUTO_5961 - BLOCK
      ?AUTO_5962 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5958 ) ( not ( = ?AUTO_5957 ?AUTO_5958 ) ) ( ON ?AUTO_5957 ?AUTO_5959 ) ( not ( = ?AUTO_5957 ?AUTO_5959 ) ) ( not ( = ?AUTO_5958 ?AUTO_5959 ) ) ( not ( = ?AUTO_5957 ?AUTO_5960 ) ) ( not ( = ?AUTO_5958 ?AUTO_5960 ) ) ( not ( = ?AUTO_5959 ?AUTO_5960 ) ) ( ON ?AUTO_5960 ?AUTO_5957 ) ( CLEAR ?AUTO_5960 ) ( HOLDING ?AUTO_5961 ) ( CLEAR ?AUTO_5962 ) ( not ( = ?AUTO_5957 ?AUTO_5961 ) ) ( not ( = ?AUTO_5957 ?AUTO_5962 ) ) ( not ( = ?AUTO_5958 ?AUTO_5961 ) ) ( not ( = ?AUTO_5958 ?AUTO_5962 ) ) ( not ( = ?AUTO_5959 ?AUTO_5961 ) ) ( not ( = ?AUTO_5959 ?AUTO_5962 ) ) ( not ( = ?AUTO_5960 ?AUTO_5961 ) ) ( not ( = ?AUTO_5960 ?AUTO_5962 ) ) ( not ( = ?AUTO_5961 ?AUTO_5962 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5961 ?AUTO_5962 )
      ( MAKE-ON ?AUTO_5957 ?AUTO_5958 )
      ( MAKE-ON-VERIFY ?AUTO_5957 ?AUTO_5958 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5967 - BLOCK
      ?AUTO_5968 - BLOCK
    )
    :vars
    (
      ?AUTO_5969 - BLOCK
      ?AUTO_5972 - BLOCK
      ?AUTO_5970 - BLOCK
      ?AUTO_5971 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5968 ) ( not ( = ?AUTO_5967 ?AUTO_5968 ) ) ( ON ?AUTO_5967 ?AUTO_5969 ) ( not ( = ?AUTO_5967 ?AUTO_5969 ) ) ( not ( = ?AUTO_5968 ?AUTO_5969 ) ) ( not ( = ?AUTO_5967 ?AUTO_5972 ) ) ( not ( = ?AUTO_5968 ?AUTO_5972 ) ) ( not ( = ?AUTO_5969 ?AUTO_5972 ) ) ( ON ?AUTO_5972 ?AUTO_5967 ) ( CLEAR ?AUTO_5970 ) ( not ( = ?AUTO_5967 ?AUTO_5971 ) ) ( not ( = ?AUTO_5967 ?AUTO_5970 ) ) ( not ( = ?AUTO_5968 ?AUTO_5971 ) ) ( not ( = ?AUTO_5968 ?AUTO_5970 ) ) ( not ( = ?AUTO_5969 ?AUTO_5971 ) ) ( not ( = ?AUTO_5969 ?AUTO_5970 ) ) ( not ( = ?AUTO_5972 ?AUTO_5971 ) ) ( not ( = ?AUTO_5972 ?AUTO_5970 ) ) ( not ( = ?AUTO_5971 ?AUTO_5970 ) ) ( ON ?AUTO_5971 ?AUTO_5972 ) ( CLEAR ?AUTO_5971 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5971 ?AUTO_5972 )
      ( MAKE-ON ?AUTO_5967 ?AUTO_5968 )
      ( MAKE-ON-VERIFY ?AUTO_5967 ?AUTO_5968 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5973 - BLOCK
      ?AUTO_5974 - BLOCK
    )
    :vars
    (
      ?AUTO_5977 - BLOCK
      ?AUTO_5975 - BLOCK
      ?AUTO_5976 - BLOCK
      ?AUTO_5978 - BLOCK
      ?AUTO_5979 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5974 ) ( not ( = ?AUTO_5973 ?AUTO_5974 ) ) ( ON ?AUTO_5973 ?AUTO_5977 ) ( not ( = ?AUTO_5973 ?AUTO_5977 ) ) ( not ( = ?AUTO_5974 ?AUTO_5977 ) ) ( not ( = ?AUTO_5973 ?AUTO_5975 ) ) ( not ( = ?AUTO_5974 ?AUTO_5975 ) ) ( not ( = ?AUTO_5977 ?AUTO_5975 ) ) ( ON ?AUTO_5975 ?AUTO_5973 ) ( CLEAR ?AUTO_5976 ) ( not ( = ?AUTO_5973 ?AUTO_5978 ) ) ( not ( = ?AUTO_5973 ?AUTO_5976 ) ) ( not ( = ?AUTO_5974 ?AUTO_5978 ) ) ( not ( = ?AUTO_5974 ?AUTO_5976 ) ) ( not ( = ?AUTO_5977 ?AUTO_5978 ) ) ( not ( = ?AUTO_5977 ?AUTO_5976 ) ) ( not ( = ?AUTO_5975 ?AUTO_5978 ) ) ( not ( = ?AUTO_5975 ?AUTO_5976 ) ) ( not ( = ?AUTO_5978 ?AUTO_5976 ) ) ( ON ?AUTO_5978 ?AUTO_5975 ) ( CLEAR ?AUTO_5978 ) ( HOLDING ?AUTO_5979 ) ( not ( = ?AUTO_5973 ?AUTO_5979 ) ) ( not ( = ?AUTO_5974 ?AUTO_5979 ) ) ( not ( = ?AUTO_5977 ?AUTO_5979 ) ) ( not ( = ?AUTO_5975 ?AUTO_5979 ) ) ( not ( = ?AUTO_5976 ?AUTO_5979 ) ) ( not ( = ?AUTO_5978 ?AUTO_5979 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5979 )
      ( MAKE-ON ?AUTO_5973 ?AUTO_5974 )
      ( MAKE-ON-VERIFY ?AUTO_5973 ?AUTO_5974 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5980 - BLOCK
      ?AUTO_5981 - BLOCK
    )
    :vars
    (
      ?AUTO_5985 - BLOCK
      ?AUTO_5986 - BLOCK
      ?AUTO_5984 - BLOCK
      ?AUTO_5982 - BLOCK
      ?AUTO_5983 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5981 ) ( not ( = ?AUTO_5980 ?AUTO_5981 ) ) ( ON ?AUTO_5980 ?AUTO_5985 ) ( not ( = ?AUTO_5980 ?AUTO_5985 ) ) ( not ( = ?AUTO_5981 ?AUTO_5985 ) ) ( not ( = ?AUTO_5980 ?AUTO_5986 ) ) ( not ( = ?AUTO_5981 ?AUTO_5986 ) ) ( not ( = ?AUTO_5985 ?AUTO_5986 ) ) ( ON ?AUTO_5986 ?AUTO_5980 ) ( CLEAR ?AUTO_5984 ) ( not ( = ?AUTO_5980 ?AUTO_5982 ) ) ( not ( = ?AUTO_5980 ?AUTO_5984 ) ) ( not ( = ?AUTO_5981 ?AUTO_5982 ) ) ( not ( = ?AUTO_5981 ?AUTO_5984 ) ) ( not ( = ?AUTO_5985 ?AUTO_5982 ) ) ( not ( = ?AUTO_5985 ?AUTO_5984 ) ) ( not ( = ?AUTO_5986 ?AUTO_5982 ) ) ( not ( = ?AUTO_5986 ?AUTO_5984 ) ) ( not ( = ?AUTO_5982 ?AUTO_5984 ) ) ( ON ?AUTO_5982 ?AUTO_5986 ) ( not ( = ?AUTO_5980 ?AUTO_5983 ) ) ( not ( = ?AUTO_5981 ?AUTO_5983 ) ) ( not ( = ?AUTO_5985 ?AUTO_5983 ) ) ( not ( = ?AUTO_5986 ?AUTO_5983 ) ) ( not ( = ?AUTO_5984 ?AUTO_5983 ) ) ( not ( = ?AUTO_5982 ?AUTO_5983 ) ) ( ON ?AUTO_5983 ?AUTO_5982 ) ( CLEAR ?AUTO_5983 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5983 ?AUTO_5982 )
      ( MAKE-ON ?AUTO_5980 ?AUTO_5981 )
      ( MAKE-ON-VERIFY ?AUTO_5980 ?AUTO_5981 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5987 - BLOCK
      ?AUTO_5988 - BLOCK
    )
    :vars
    (
      ?AUTO_5991 - BLOCK
      ?AUTO_5990 - BLOCK
      ?AUTO_5993 - BLOCK
      ?AUTO_5992 - BLOCK
      ?AUTO_5989 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5988 ) ( not ( = ?AUTO_5987 ?AUTO_5988 ) ) ( ON ?AUTO_5987 ?AUTO_5991 ) ( not ( = ?AUTO_5987 ?AUTO_5991 ) ) ( not ( = ?AUTO_5988 ?AUTO_5991 ) ) ( not ( = ?AUTO_5987 ?AUTO_5990 ) ) ( not ( = ?AUTO_5988 ?AUTO_5990 ) ) ( not ( = ?AUTO_5991 ?AUTO_5990 ) ) ( ON ?AUTO_5990 ?AUTO_5987 ) ( not ( = ?AUTO_5987 ?AUTO_5993 ) ) ( not ( = ?AUTO_5987 ?AUTO_5992 ) ) ( not ( = ?AUTO_5988 ?AUTO_5993 ) ) ( not ( = ?AUTO_5988 ?AUTO_5992 ) ) ( not ( = ?AUTO_5991 ?AUTO_5993 ) ) ( not ( = ?AUTO_5991 ?AUTO_5992 ) ) ( not ( = ?AUTO_5990 ?AUTO_5993 ) ) ( not ( = ?AUTO_5990 ?AUTO_5992 ) ) ( not ( = ?AUTO_5993 ?AUTO_5992 ) ) ( ON ?AUTO_5993 ?AUTO_5990 ) ( not ( = ?AUTO_5987 ?AUTO_5989 ) ) ( not ( = ?AUTO_5988 ?AUTO_5989 ) ) ( not ( = ?AUTO_5991 ?AUTO_5989 ) ) ( not ( = ?AUTO_5990 ?AUTO_5989 ) ) ( not ( = ?AUTO_5992 ?AUTO_5989 ) ) ( not ( = ?AUTO_5993 ?AUTO_5989 ) ) ( ON ?AUTO_5989 ?AUTO_5993 ) ( CLEAR ?AUTO_5989 ) ( HOLDING ?AUTO_5992 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5992 )
      ( MAKE-ON ?AUTO_5987 ?AUTO_5988 )
      ( MAKE-ON-VERIFY ?AUTO_5987 ?AUTO_5988 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5994 - BLOCK
      ?AUTO_5995 - BLOCK
    )
    :vars
    (
      ?AUTO_5997 - BLOCK
      ?AUTO_5998 - BLOCK
      ?AUTO_6000 - BLOCK
      ?AUTO_5996 - BLOCK
      ?AUTO_5999 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5994 ?AUTO_5995 ) ) ( ON ?AUTO_5994 ?AUTO_5997 ) ( not ( = ?AUTO_5994 ?AUTO_5997 ) ) ( not ( = ?AUTO_5995 ?AUTO_5997 ) ) ( not ( = ?AUTO_5994 ?AUTO_5998 ) ) ( not ( = ?AUTO_5995 ?AUTO_5998 ) ) ( not ( = ?AUTO_5997 ?AUTO_5998 ) ) ( ON ?AUTO_5998 ?AUTO_5994 ) ( not ( = ?AUTO_5994 ?AUTO_6000 ) ) ( not ( = ?AUTO_5994 ?AUTO_5996 ) ) ( not ( = ?AUTO_5995 ?AUTO_6000 ) ) ( not ( = ?AUTO_5995 ?AUTO_5996 ) ) ( not ( = ?AUTO_5997 ?AUTO_6000 ) ) ( not ( = ?AUTO_5997 ?AUTO_5996 ) ) ( not ( = ?AUTO_5998 ?AUTO_6000 ) ) ( not ( = ?AUTO_5998 ?AUTO_5996 ) ) ( not ( = ?AUTO_6000 ?AUTO_5996 ) ) ( ON ?AUTO_6000 ?AUTO_5998 ) ( not ( = ?AUTO_5994 ?AUTO_5999 ) ) ( not ( = ?AUTO_5995 ?AUTO_5999 ) ) ( not ( = ?AUTO_5997 ?AUTO_5999 ) ) ( not ( = ?AUTO_5998 ?AUTO_5999 ) ) ( not ( = ?AUTO_5996 ?AUTO_5999 ) ) ( not ( = ?AUTO_6000 ?AUTO_5999 ) ) ( ON ?AUTO_5999 ?AUTO_6000 ) ( CLEAR ?AUTO_5999 ) ( ON ?AUTO_5996 ?AUTO_5995 ) ( CLEAR ?AUTO_5996 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5996 ?AUTO_5995 )
      ( MAKE-ON ?AUTO_5994 ?AUTO_5995 )
      ( MAKE-ON-VERIFY ?AUTO_5994 ?AUTO_5995 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6003 - BLOCK
      ?AUTO_6004 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6003 ) ( CLEAR ?AUTO_6004 ) ( not ( = ?AUTO_6003 ?AUTO_6004 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_6003 ?AUTO_6004 )
      ( MAKE-ON-VERIFY ?AUTO_6003 ?AUTO_6004 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6005 - BLOCK
      ?AUTO_6006 - BLOCK
    )
    :vars
    (
      ?AUTO_6007 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6006 ) ( not ( = ?AUTO_6005 ?AUTO_6006 ) ) ( ON ?AUTO_6005 ?AUTO_6007 ) ( CLEAR ?AUTO_6005 ) ( HAND-EMPTY ) ( not ( = ?AUTO_6005 ?AUTO_6007 ) ) ( not ( = ?AUTO_6006 ?AUTO_6007 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6005 ?AUTO_6007 )
      ( MAKE-ON ?AUTO_6005 ?AUTO_6006 )
      ( MAKE-ON-VERIFY ?AUTO_6005 ?AUTO_6006 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6008 - BLOCK
      ?AUTO_6009 - BLOCK
    )
    :vars
    (
      ?AUTO_6010 - BLOCK
      ?AUTO_6011 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6008 ?AUTO_6009 ) ) ( ON ?AUTO_6008 ?AUTO_6010 ) ( CLEAR ?AUTO_6008 ) ( not ( = ?AUTO_6008 ?AUTO_6010 ) ) ( not ( = ?AUTO_6009 ?AUTO_6010 ) ) ( HOLDING ?AUTO_6009 ) ( CLEAR ?AUTO_6011 ) ( not ( = ?AUTO_6008 ?AUTO_6011 ) ) ( not ( = ?AUTO_6009 ?AUTO_6011 ) ) ( not ( = ?AUTO_6010 ?AUTO_6011 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_6009 ?AUTO_6011 )
      ( MAKE-ON ?AUTO_6008 ?AUTO_6009 )
      ( MAKE-ON-VERIFY ?AUTO_6008 ?AUTO_6009 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6014 - BLOCK
      ?AUTO_6015 - BLOCK
    )
    :vars
    (
      ?AUTO_6016 - BLOCK
      ?AUTO_6017 - BLOCK
      ?AUTO_6018 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6015 ) ( not ( = ?AUTO_6014 ?AUTO_6015 ) ) ( ON ?AUTO_6014 ?AUTO_6016 ) ( CLEAR ?AUTO_6014 ) ( not ( = ?AUTO_6014 ?AUTO_6016 ) ) ( not ( = ?AUTO_6015 ?AUTO_6016 ) ) ( HOLDING ?AUTO_6017 ) ( CLEAR ?AUTO_6018 ) ( not ( = ?AUTO_6014 ?AUTO_6017 ) ) ( not ( = ?AUTO_6014 ?AUTO_6018 ) ) ( not ( = ?AUTO_6015 ?AUTO_6017 ) ) ( not ( = ?AUTO_6015 ?AUTO_6018 ) ) ( not ( = ?AUTO_6016 ?AUTO_6017 ) ) ( not ( = ?AUTO_6016 ?AUTO_6018 ) ) ( not ( = ?AUTO_6017 ?AUTO_6018 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_6017 ?AUTO_6018 )
      ( MAKE-ON ?AUTO_6014 ?AUTO_6015 )
      ( MAKE-ON-VERIFY ?AUTO_6014 ?AUTO_6015 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6019 - BLOCK
      ?AUTO_6020 - BLOCK
    )
    :vars
    (
      ?AUTO_6021 - BLOCK
      ?AUTO_6022 - BLOCK
      ?AUTO_6023 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6020 ) ( not ( = ?AUTO_6019 ?AUTO_6020 ) ) ( ON ?AUTO_6019 ?AUTO_6021 ) ( not ( = ?AUTO_6019 ?AUTO_6021 ) ) ( not ( = ?AUTO_6020 ?AUTO_6021 ) ) ( CLEAR ?AUTO_6022 ) ( not ( = ?AUTO_6019 ?AUTO_6023 ) ) ( not ( = ?AUTO_6019 ?AUTO_6022 ) ) ( not ( = ?AUTO_6020 ?AUTO_6023 ) ) ( not ( = ?AUTO_6020 ?AUTO_6022 ) ) ( not ( = ?AUTO_6021 ?AUTO_6023 ) ) ( not ( = ?AUTO_6021 ?AUTO_6022 ) ) ( not ( = ?AUTO_6023 ?AUTO_6022 ) ) ( ON ?AUTO_6023 ?AUTO_6019 ) ( CLEAR ?AUTO_6023 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6023 ?AUTO_6019 )
      ( MAKE-ON ?AUTO_6019 ?AUTO_6020 )
      ( MAKE-ON-VERIFY ?AUTO_6019 ?AUTO_6020 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6024 - BLOCK
      ?AUTO_6025 - BLOCK
    )
    :vars
    (
      ?AUTO_6026 - BLOCK
      ?AUTO_6027 - BLOCK
      ?AUTO_6028 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6024 ?AUTO_6025 ) ) ( ON ?AUTO_6024 ?AUTO_6026 ) ( not ( = ?AUTO_6024 ?AUTO_6026 ) ) ( not ( = ?AUTO_6025 ?AUTO_6026 ) ) ( CLEAR ?AUTO_6027 ) ( not ( = ?AUTO_6024 ?AUTO_6028 ) ) ( not ( = ?AUTO_6024 ?AUTO_6027 ) ) ( not ( = ?AUTO_6025 ?AUTO_6028 ) ) ( not ( = ?AUTO_6025 ?AUTO_6027 ) ) ( not ( = ?AUTO_6026 ?AUTO_6028 ) ) ( not ( = ?AUTO_6026 ?AUTO_6027 ) ) ( not ( = ?AUTO_6028 ?AUTO_6027 ) ) ( ON ?AUTO_6028 ?AUTO_6024 ) ( CLEAR ?AUTO_6028 ) ( HOLDING ?AUTO_6025 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6025 )
      ( MAKE-ON ?AUTO_6024 ?AUTO_6025 )
      ( MAKE-ON-VERIFY ?AUTO_6024 ?AUTO_6025 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6031 - BLOCK
      ?AUTO_6032 - BLOCK
    )
    :vars
    (
      ?AUTO_6033 - BLOCK
      ?AUTO_6035 - BLOCK
      ?AUTO_6034 - BLOCK
      ?AUTO_6036 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6032 ) ( not ( = ?AUTO_6031 ?AUTO_6032 ) ) ( ON ?AUTO_6031 ?AUTO_6033 ) ( not ( = ?AUTO_6031 ?AUTO_6033 ) ) ( not ( = ?AUTO_6032 ?AUTO_6033 ) ) ( CLEAR ?AUTO_6035 ) ( not ( = ?AUTO_6031 ?AUTO_6034 ) ) ( not ( = ?AUTO_6031 ?AUTO_6035 ) ) ( not ( = ?AUTO_6032 ?AUTO_6034 ) ) ( not ( = ?AUTO_6032 ?AUTO_6035 ) ) ( not ( = ?AUTO_6033 ?AUTO_6034 ) ) ( not ( = ?AUTO_6033 ?AUTO_6035 ) ) ( not ( = ?AUTO_6034 ?AUTO_6035 ) ) ( ON ?AUTO_6034 ?AUTO_6031 ) ( CLEAR ?AUTO_6034 ) ( HOLDING ?AUTO_6036 ) ( not ( = ?AUTO_6031 ?AUTO_6036 ) ) ( not ( = ?AUTO_6032 ?AUTO_6036 ) ) ( not ( = ?AUTO_6033 ?AUTO_6036 ) ) ( not ( = ?AUTO_6035 ?AUTO_6036 ) ) ( not ( = ?AUTO_6034 ?AUTO_6036 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6036 )
      ( MAKE-ON ?AUTO_6031 ?AUTO_6032 )
      ( MAKE-ON-VERIFY ?AUTO_6031 ?AUTO_6032 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6037 - BLOCK
      ?AUTO_6038 - BLOCK
    )
    :vars
    (
      ?AUTO_6040 - BLOCK
      ?AUTO_6041 - BLOCK
      ?AUTO_6039 - BLOCK
      ?AUTO_6042 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6037 ?AUTO_6038 ) ) ( ON ?AUTO_6037 ?AUTO_6040 ) ( not ( = ?AUTO_6037 ?AUTO_6040 ) ) ( not ( = ?AUTO_6038 ?AUTO_6040 ) ) ( CLEAR ?AUTO_6041 ) ( not ( = ?AUTO_6037 ?AUTO_6039 ) ) ( not ( = ?AUTO_6037 ?AUTO_6041 ) ) ( not ( = ?AUTO_6038 ?AUTO_6039 ) ) ( not ( = ?AUTO_6038 ?AUTO_6041 ) ) ( not ( = ?AUTO_6040 ?AUTO_6039 ) ) ( not ( = ?AUTO_6040 ?AUTO_6041 ) ) ( not ( = ?AUTO_6039 ?AUTO_6041 ) ) ( ON ?AUTO_6039 ?AUTO_6037 ) ( CLEAR ?AUTO_6039 ) ( not ( = ?AUTO_6037 ?AUTO_6042 ) ) ( not ( = ?AUTO_6038 ?AUTO_6042 ) ) ( not ( = ?AUTO_6040 ?AUTO_6042 ) ) ( not ( = ?AUTO_6041 ?AUTO_6042 ) ) ( not ( = ?AUTO_6039 ?AUTO_6042 ) ) ( ON ?AUTO_6042 ?AUTO_6038 ) ( CLEAR ?AUTO_6042 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6042 ?AUTO_6038 )
      ( MAKE-ON ?AUTO_6037 ?AUTO_6038 )
      ( MAKE-ON-VERIFY ?AUTO_6037 ?AUTO_6038 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6043 - BLOCK
      ?AUTO_6044 - BLOCK
    )
    :vars
    (
      ?AUTO_6045 - BLOCK
      ?AUTO_6046 - BLOCK
      ?AUTO_6048 - BLOCK
      ?AUTO_6047 - BLOCK
      ?AUTO_6049 - BLOCK
      ?AUTO_6050 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6043 ?AUTO_6044 ) ) ( ON ?AUTO_6043 ?AUTO_6045 ) ( not ( = ?AUTO_6043 ?AUTO_6045 ) ) ( not ( = ?AUTO_6044 ?AUTO_6045 ) ) ( CLEAR ?AUTO_6046 ) ( not ( = ?AUTO_6043 ?AUTO_6048 ) ) ( not ( = ?AUTO_6043 ?AUTO_6046 ) ) ( not ( = ?AUTO_6044 ?AUTO_6048 ) ) ( not ( = ?AUTO_6044 ?AUTO_6046 ) ) ( not ( = ?AUTO_6045 ?AUTO_6048 ) ) ( not ( = ?AUTO_6045 ?AUTO_6046 ) ) ( not ( = ?AUTO_6048 ?AUTO_6046 ) ) ( ON ?AUTO_6048 ?AUTO_6043 ) ( CLEAR ?AUTO_6048 ) ( not ( = ?AUTO_6043 ?AUTO_6047 ) ) ( not ( = ?AUTO_6044 ?AUTO_6047 ) ) ( not ( = ?AUTO_6045 ?AUTO_6047 ) ) ( not ( = ?AUTO_6046 ?AUTO_6047 ) ) ( not ( = ?AUTO_6048 ?AUTO_6047 ) ) ( ON ?AUTO_6047 ?AUTO_6044 ) ( CLEAR ?AUTO_6047 ) ( HOLDING ?AUTO_6049 ) ( CLEAR ?AUTO_6050 ) ( not ( = ?AUTO_6043 ?AUTO_6049 ) ) ( not ( = ?AUTO_6043 ?AUTO_6050 ) ) ( not ( = ?AUTO_6044 ?AUTO_6049 ) ) ( not ( = ?AUTO_6044 ?AUTO_6050 ) ) ( not ( = ?AUTO_6045 ?AUTO_6049 ) ) ( not ( = ?AUTO_6045 ?AUTO_6050 ) ) ( not ( = ?AUTO_6046 ?AUTO_6049 ) ) ( not ( = ?AUTO_6046 ?AUTO_6050 ) ) ( not ( = ?AUTO_6048 ?AUTO_6049 ) ) ( not ( = ?AUTO_6048 ?AUTO_6050 ) ) ( not ( = ?AUTO_6047 ?AUTO_6049 ) ) ( not ( = ?AUTO_6047 ?AUTO_6050 ) ) ( not ( = ?AUTO_6049 ?AUTO_6050 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_6049 ?AUTO_6050 )
      ( MAKE-ON ?AUTO_6043 ?AUTO_6044 )
      ( MAKE-ON-VERIFY ?AUTO_6043 ?AUTO_6044 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6055 - BLOCK
      ?AUTO_6056 - BLOCK
    )
    :vars
    (
      ?AUTO_6057 - BLOCK
      ?AUTO_6059 - BLOCK
      ?AUTO_6060 - BLOCK
      ?AUTO_6058 - BLOCK
      ?AUTO_6062 - BLOCK
      ?AUTO_6061 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6055 ?AUTO_6056 ) ) ( ON ?AUTO_6055 ?AUTO_6057 ) ( not ( = ?AUTO_6055 ?AUTO_6057 ) ) ( not ( = ?AUTO_6056 ?AUTO_6057 ) ) ( CLEAR ?AUTO_6059 ) ( not ( = ?AUTO_6055 ?AUTO_6060 ) ) ( not ( = ?AUTO_6055 ?AUTO_6059 ) ) ( not ( = ?AUTO_6056 ?AUTO_6060 ) ) ( not ( = ?AUTO_6056 ?AUTO_6059 ) ) ( not ( = ?AUTO_6057 ?AUTO_6060 ) ) ( not ( = ?AUTO_6057 ?AUTO_6059 ) ) ( not ( = ?AUTO_6060 ?AUTO_6059 ) ) ( ON ?AUTO_6060 ?AUTO_6055 ) ( CLEAR ?AUTO_6060 ) ( not ( = ?AUTO_6055 ?AUTO_6058 ) ) ( not ( = ?AUTO_6056 ?AUTO_6058 ) ) ( not ( = ?AUTO_6057 ?AUTO_6058 ) ) ( not ( = ?AUTO_6059 ?AUTO_6058 ) ) ( not ( = ?AUTO_6060 ?AUTO_6058 ) ) ( ON ?AUTO_6058 ?AUTO_6056 ) ( CLEAR ?AUTO_6062 ) ( not ( = ?AUTO_6055 ?AUTO_6061 ) ) ( not ( = ?AUTO_6055 ?AUTO_6062 ) ) ( not ( = ?AUTO_6056 ?AUTO_6061 ) ) ( not ( = ?AUTO_6056 ?AUTO_6062 ) ) ( not ( = ?AUTO_6057 ?AUTO_6061 ) ) ( not ( = ?AUTO_6057 ?AUTO_6062 ) ) ( not ( = ?AUTO_6059 ?AUTO_6061 ) ) ( not ( = ?AUTO_6059 ?AUTO_6062 ) ) ( not ( = ?AUTO_6060 ?AUTO_6061 ) ) ( not ( = ?AUTO_6060 ?AUTO_6062 ) ) ( not ( = ?AUTO_6058 ?AUTO_6061 ) ) ( not ( = ?AUTO_6058 ?AUTO_6062 ) ) ( not ( = ?AUTO_6061 ?AUTO_6062 ) ) ( ON ?AUTO_6061 ?AUTO_6058 ) ( CLEAR ?AUTO_6061 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6061 ?AUTO_6058 )
      ( MAKE-ON ?AUTO_6055 ?AUTO_6056 )
      ( MAKE-ON-VERIFY ?AUTO_6055 ?AUTO_6056 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6063 - BLOCK
      ?AUTO_6064 - BLOCK
    )
    :vars
    (
      ?AUTO_6065 - BLOCK
      ?AUTO_6070 - BLOCK
      ?AUTO_6068 - BLOCK
      ?AUTO_6066 - BLOCK
      ?AUTO_6067 - BLOCK
      ?AUTO_6069 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6063 ?AUTO_6064 ) ) ( ON ?AUTO_6063 ?AUTO_6065 ) ( not ( = ?AUTO_6063 ?AUTO_6065 ) ) ( not ( = ?AUTO_6064 ?AUTO_6065 ) ) ( CLEAR ?AUTO_6070 ) ( not ( = ?AUTO_6063 ?AUTO_6068 ) ) ( not ( = ?AUTO_6063 ?AUTO_6070 ) ) ( not ( = ?AUTO_6064 ?AUTO_6068 ) ) ( not ( = ?AUTO_6064 ?AUTO_6070 ) ) ( not ( = ?AUTO_6065 ?AUTO_6068 ) ) ( not ( = ?AUTO_6065 ?AUTO_6070 ) ) ( not ( = ?AUTO_6068 ?AUTO_6070 ) ) ( ON ?AUTO_6068 ?AUTO_6063 ) ( CLEAR ?AUTO_6068 ) ( not ( = ?AUTO_6063 ?AUTO_6066 ) ) ( not ( = ?AUTO_6064 ?AUTO_6066 ) ) ( not ( = ?AUTO_6065 ?AUTO_6066 ) ) ( not ( = ?AUTO_6070 ?AUTO_6066 ) ) ( not ( = ?AUTO_6068 ?AUTO_6066 ) ) ( ON ?AUTO_6066 ?AUTO_6064 ) ( not ( = ?AUTO_6063 ?AUTO_6067 ) ) ( not ( = ?AUTO_6063 ?AUTO_6069 ) ) ( not ( = ?AUTO_6064 ?AUTO_6067 ) ) ( not ( = ?AUTO_6064 ?AUTO_6069 ) ) ( not ( = ?AUTO_6065 ?AUTO_6067 ) ) ( not ( = ?AUTO_6065 ?AUTO_6069 ) ) ( not ( = ?AUTO_6070 ?AUTO_6067 ) ) ( not ( = ?AUTO_6070 ?AUTO_6069 ) ) ( not ( = ?AUTO_6068 ?AUTO_6067 ) ) ( not ( = ?AUTO_6068 ?AUTO_6069 ) ) ( not ( = ?AUTO_6066 ?AUTO_6067 ) ) ( not ( = ?AUTO_6066 ?AUTO_6069 ) ) ( not ( = ?AUTO_6067 ?AUTO_6069 ) ) ( ON ?AUTO_6067 ?AUTO_6066 ) ( CLEAR ?AUTO_6067 ) ( HOLDING ?AUTO_6069 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6069 )
      ( MAKE-ON ?AUTO_6063 ?AUTO_6064 )
      ( MAKE-ON-VERIFY ?AUTO_6063 ?AUTO_6064 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6071 - BLOCK
      ?AUTO_6072 - BLOCK
    )
    :vars
    (
      ?AUTO_6078 - BLOCK
      ?AUTO_6073 - BLOCK
      ?AUTO_6075 - BLOCK
      ?AUTO_6076 - BLOCK
      ?AUTO_6077 - BLOCK
      ?AUTO_6074 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6071 ?AUTO_6072 ) ) ( ON ?AUTO_6071 ?AUTO_6078 ) ( not ( = ?AUTO_6071 ?AUTO_6078 ) ) ( not ( = ?AUTO_6072 ?AUTO_6078 ) ) ( CLEAR ?AUTO_6073 ) ( not ( = ?AUTO_6071 ?AUTO_6075 ) ) ( not ( = ?AUTO_6071 ?AUTO_6073 ) ) ( not ( = ?AUTO_6072 ?AUTO_6075 ) ) ( not ( = ?AUTO_6072 ?AUTO_6073 ) ) ( not ( = ?AUTO_6078 ?AUTO_6075 ) ) ( not ( = ?AUTO_6078 ?AUTO_6073 ) ) ( not ( = ?AUTO_6075 ?AUTO_6073 ) ) ( ON ?AUTO_6075 ?AUTO_6071 ) ( CLEAR ?AUTO_6075 ) ( not ( = ?AUTO_6071 ?AUTO_6076 ) ) ( not ( = ?AUTO_6072 ?AUTO_6076 ) ) ( not ( = ?AUTO_6078 ?AUTO_6076 ) ) ( not ( = ?AUTO_6073 ?AUTO_6076 ) ) ( not ( = ?AUTO_6075 ?AUTO_6076 ) ) ( ON ?AUTO_6076 ?AUTO_6072 ) ( not ( = ?AUTO_6071 ?AUTO_6077 ) ) ( not ( = ?AUTO_6071 ?AUTO_6074 ) ) ( not ( = ?AUTO_6072 ?AUTO_6077 ) ) ( not ( = ?AUTO_6072 ?AUTO_6074 ) ) ( not ( = ?AUTO_6078 ?AUTO_6077 ) ) ( not ( = ?AUTO_6078 ?AUTO_6074 ) ) ( not ( = ?AUTO_6073 ?AUTO_6077 ) ) ( not ( = ?AUTO_6073 ?AUTO_6074 ) ) ( not ( = ?AUTO_6075 ?AUTO_6077 ) ) ( not ( = ?AUTO_6075 ?AUTO_6074 ) ) ( not ( = ?AUTO_6076 ?AUTO_6077 ) ) ( not ( = ?AUTO_6076 ?AUTO_6074 ) ) ( not ( = ?AUTO_6077 ?AUTO_6074 ) ) ( ON ?AUTO_6077 ?AUTO_6076 ) ( ON ?AUTO_6074 ?AUTO_6077 ) ( CLEAR ?AUTO_6074 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6074 ?AUTO_6077 )
      ( MAKE-ON ?AUTO_6071 ?AUTO_6072 )
      ( MAKE-ON-VERIFY ?AUTO_6071 ?AUTO_6072 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6079 - BLOCK
      ?AUTO_6080 - BLOCK
    )
    :vars
    (
      ?AUTO_6083 - BLOCK
      ?AUTO_6084 - BLOCK
      ?AUTO_6081 - BLOCK
      ?AUTO_6086 - BLOCK
      ?AUTO_6085 - BLOCK
      ?AUTO_6082 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6079 ?AUTO_6080 ) ) ( ON ?AUTO_6079 ?AUTO_6083 ) ( not ( = ?AUTO_6079 ?AUTO_6083 ) ) ( not ( = ?AUTO_6080 ?AUTO_6083 ) ) ( not ( = ?AUTO_6079 ?AUTO_6084 ) ) ( not ( = ?AUTO_6079 ?AUTO_6081 ) ) ( not ( = ?AUTO_6080 ?AUTO_6084 ) ) ( not ( = ?AUTO_6080 ?AUTO_6081 ) ) ( not ( = ?AUTO_6083 ?AUTO_6084 ) ) ( not ( = ?AUTO_6083 ?AUTO_6081 ) ) ( not ( = ?AUTO_6084 ?AUTO_6081 ) ) ( ON ?AUTO_6084 ?AUTO_6079 ) ( CLEAR ?AUTO_6084 ) ( not ( = ?AUTO_6079 ?AUTO_6086 ) ) ( not ( = ?AUTO_6080 ?AUTO_6086 ) ) ( not ( = ?AUTO_6083 ?AUTO_6086 ) ) ( not ( = ?AUTO_6081 ?AUTO_6086 ) ) ( not ( = ?AUTO_6084 ?AUTO_6086 ) ) ( ON ?AUTO_6086 ?AUTO_6080 ) ( not ( = ?AUTO_6079 ?AUTO_6085 ) ) ( not ( = ?AUTO_6079 ?AUTO_6082 ) ) ( not ( = ?AUTO_6080 ?AUTO_6085 ) ) ( not ( = ?AUTO_6080 ?AUTO_6082 ) ) ( not ( = ?AUTO_6083 ?AUTO_6085 ) ) ( not ( = ?AUTO_6083 ?AUTO_6082 ) ) ( not ( = ?AUTO_6081 ?AUTO_6085 ) ) ( not ( = ?AUTO_6081 ?AUTO_6082 ) ) ( not ( = ?AUTO_6084 ?AUTO_6085 ) ) ( not ( = ?AUTO_6084 ?AUTO_6082 ) ) ( not ( = ?AUTO_6086 ?AUTO_6085 ) ) ( not ( = ?AUTO_6086 ?AUTO_6082 ) ) ( not ( = ?AUTO_6085 ?AUTO_6082 ) ) ( ON ?AUTO_6085 ?AUTO_6086 ) ( ON ?AUTO_6082 ?AUTO_6085 ) ( CLEAR ?AUTO_6082 ) ( HOLDING ?AUTO_6081 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6081 )
      ( MAKE-ON ?AUTO_6079 ?AUTO_6080 )
      ( MAKE-ON-VERIFY ?AUTO_6079 ?AUTO_6080 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6087 - BLOCK
      ?AUTO_6088 - BLOCK
    )
    :vars
    (
      ?AUTO_6093 - BLOCK
      ?AUTO_6094 - BLOCK
      ?AUTO_6089 - BLOCK
      ?AUTO_6091 - BLOCK
      ?AUTO_6090 - BLOCK
      ?AUTO_6092 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6087 ?AUTO_6088 ) ) ( ON ?AUTO_6087 ?AUTO_6093 ) ( not ( = ?AUTO_6087 ?AUTO_6093 ) ) ( not ( = ?AUTO_6088 ?AUTO_6093 ) ) ( not ( = ?AUTO_6087 ?AUTO_6094 ) ) ( not ( = ?AUTO_6087 ?AUTO_6089 ) ) ( not ( = ?AUTO_6088 ?AUTO_6094 ) ) ( not ( = ?AUTO_6088 ?AUTO_6089 ) ) ( not ( = ?AUTO_6093 ?AUTO_6094 ) ) ( not ( = ?AUTO_6093 ?AUTO_6089 ) ) ( not ( = ?AUTO_6094 ?AUTO_6089 ) ) ( ON ?AUTO_6094 ?AUTO_6087 ) ( not ( = ?AUTO_6087 ?AUTO_6091 ) ) ( not ( = ?AUTO_6088 ?AUTO_6091 ) ) ( not ( = ?AUTO_6093 ?AUTO_6091 ) ) ( not ( = ?AUTO_6089 ?AUTO_6091 ) ) ( not ( = ?AUTO_6094 ?AUTO_6091 ) ) ( ON ?AUTO_6091 ?AUTO_6088 ) ( not ( = ?AUTO_6087 ?AUTO_6090 ) ) ( not ( = ?AUTO_6087 ?AUTO_6092 ) ) ( not ( = ?AUTO_6088 ?AUTO_6090 ) ) ( not ( = ?AUTO_6088 ?AUTO_6092 ) ) ( not ( = ?AUTO_6093 ?AUTO_6090 ) ) ( not ( = ?AUTO_6093 ?AUTO_6092 ) ) ( not ( = ?AUTO_6089 ?AUTO_6090 ) ) ( not ( = ?AUTO_6089 ?AUTO_6092 ) ) ( not ( = ?AUTO_6094 ?AUTO_6090 ) ) ( not ( = ?AUTO_6094 ?AUTO_6092 ) ) ( not ( = ?AUTO_6091 ?AUTO_6090 ) ) ( not ( = ?AUTO_6091 ?AUTO_6092 ) ) ( not ( = ?AUTO_6090 ?AUTO_6092 ) ) ( ON ?AUTO_6090 ?AUTO_6091 ) ( ON ?AUTO_6092 ?AUTO_6090 ) ( CLEAR ?AUTO_6092 ) ( ON ?AUTO_6089 ?AUTO_6094 ) ( CLEAR ?AUTO_6089 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6089 ?AUTO_6094 )
      ( MAKE-ON ?AUTO_6087 ?AUTO_6088 )
      ( MAKE-ON-VERIFY ?AUTO_6087 ?AUTO_6088 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6097 - BLOCK
      ?AUTO_6098 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6097 ) ( CLEAR ?AUTO_6098 ) ( not ( = ?AUTO_6097 ?AUTO_6098 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_6097 ?AUTO_6098 )
      ( MAKE-ON-VERIFY ?AUTO_6097 ?AUTO_6098 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6099 - BLOCK
      ?AUTO_6100 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6100 ) ( not ( = ?AUTO_6099 ?AUTO_6100 ) ) ( ON-TABLE ?AUTO_6099 ) ( CLEAR ?AUTO_6099 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_6099 )
      ( MAKE-ON ?AUTO_6099 ?AUTO_6100 )
      ( MAKE-ON-VERIFY ?AUTO_6099 ?AUTO_6100 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6101 - BLOCK
      ?AUTO_6102 - BLOCK
    )
    :vars
    (
      ?AUTO_6103 - BLOCK
      ?AUTO_6104 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6102 ) ( not ( = ?AUTO_6101 ?AUTO_6102 ) ) ( ON-TABLE ?AUTO_6101 ) ( CLEAR ?AUTO_6101 ) ( HOLDING ?AUTO_6103 ) ( CLEAR ?AUTO_6104 ) ( not ( = ?AUTO_6101 ?AUTO_6103 ) ) ( not ( = ?AUTO_6101 ?AUTO_6104 ) ) ( not ( = ?AUTO_6102 ?AUTO_6103 ) ) ( not ( = ?AUTO_6102 ?AUTO_6104 ) ) ( not ( = ?AUTO_6103 ?AUTO_6104 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_6103 ?AUTO_6104 )
      ( MAKE-ON ?AUTO_6101 ?AUTO_6102 )
      ( MAKE-ON-VERIFY ?AUTO_6101 ?AUTO_6102 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6105 - BLOCK
      ?AUTO_6106 - BLOCK
    )
    :vars
    (
      ?AUTO_6107 - BLOCK
      ?AUTO_6108 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6106 ) ( not ( = ?AUTO_6105 ?AUTO_6106 ) ) ( ON-TABLE ?AUTO_6105 ) ( CLEAR ?AUTO_6107 ) ( not ( = ?AUTO_6105 ?AUTO_6108 ) ) ( not ( = ?AUTO_6105 ?AUTO_6107 ) ) ( not ( = ?AUTO_6106 ?AUTO_6108 ) ) ( not ( = ?AUTO_6106 ?AUTO_6107 ) ) ( not ( = ?AUTO_6108 ?AUTO_6107 ) ) ( ON ?AUTO_6108 ?AUTO_6105 ) ( CLEAR ?AUTO_6108 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6108 ?AUTO_6105 )
      ( MAKE-ON ?AUTO_6105 ?AUTO_6106 )
      ( MAKE-ON-VERIFY ?AUTO_6105 ?AUTO_6106 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6109 - BLOCK
      ?AUTO_6110 - BLOCK
    )
    :vars
    (
      ?AUTO_6111 - BLOCK
      ?AUTO_6112 - BLOCK
      ?AUTO_6113 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6110 ) ( not ( = ?AUTO_6109 ?AUTO_6110 ) ) ( ON-TABLE ?AUTO_6109 ) ( not ( = ?AUTO_6109 ?AUTO_6111 ) ) ( not ( = ?AUTO_6109 ?AUTO_6112 ) ) ( not ( = ?AUTO_6110 ?AUTO_6111 ) ) ( not ( = ?AUTO_6110 ?AUTO_6112 ) ) ( not ( = ?AUTO_6111 ?AUTO_6112 ) ) ( ON ?AUTO_6111 ?AUTO_6109 ) ( CLEAR ?AUTO_6111 ) ( HOLDING ?AUTO_6112 ) ( CLEAR ?AUTO_6113 ) ( not ( = ?AUTO_6109 ?AUTO_6113 ) ) ( not ( = ?AUTO_6110 ?AUTO_6113 ) ) ( not ( = ?AUTO_6111 ?AUTO_6113 ) ) ( not ( = ?AUTO_6112 ?AUTO_6113 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_6112 ?AUTO_6113 )
      ( MAKE-ON ?AUTO_6109 ?AUTO_6110 )
      ( MAKE-ON-VERIFY ?AUTO_6109 ?AUTO_6110 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6118 - BLOCK
      ?AUTO_6119 - BLOCK
    )
    :vars
    (
      ?AUTO_6122 - BLOCK
      ?AUTO_6121 - BLOCK
      ?AUTO_6120 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6119 ) ( not ( = ?AUTO_6118 ?AUTO_6119 ) ) ( ON-TABLE ?AUTO_6118 ) ( not ( = ?AUTO_6118 ?AUTO_6122 ) ) ( not ( = ?AUTO_6118 ?AUTO_6121 ) ) ( not ( = ?AUTO_6119 ?AUTO_6122 ) ) ( not ( = ?AUTO_6119 ?AUTO_6121 ) ) ( not ( = ?AUTO_6122 ?AUTO_6121 ) ) ( ON ?AUTO_6122 ?AUTO_6118 ) ( CLEAR ?AUTO_6120 ) ( not ( = ?AUTO_6118 ?AUTO_6120 ) ) ( not ( = ?AUTO_6119 ?AUTO_6120 ) ) ( not ( = ?AUTO_6122 ?AUTO_6120 ) ) ( not ( = ?AUTO_6121 ?AUTO_6120 ) ) ( ON ?AUTO_6121 ?AUTO_6122 ) ( CLEAR ?AUTO_6121 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6121 ?AUTO_6122 )
      ( MAKE-ON ?AUTO_6118 ?AUTO_6119 )
      ( MAKE-ON-VERIFY ?AUTO_6118 ?AUTO_6119 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6123 - BLOCK
      ?AUTO_6124 - BLOCK
    )
    :vars
    (
      ?AUTO_6127 - BLOCK
      ?AUTO_6126 - BLOCK
      ?AUTO_6125 - BLOCK
      ?AUTO_6128 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6124 ) ( not ( = ?AUTO_6123 ?AUTO_6124 ) ) ( ON-TABLE ?AUTO_6123 ) ( not ( = ?AUTO_6123 ?AUTO_6127 ) ) ( not ( = ?AUTO_6123 ?AUTO_6126 ) ) ( not ( = ?AUTO_6124 ?AUTO_6127 ) ) ( not ( = ?AUTO_6124 ?AUTO_6126 ) ) ( not ( = ?AUTO_6127 ?AUTO_6126 ) ) ( ON ?AUTO_6127 ?AUTO_6123 ) ( CLEAR ?AUTO_6125 ) ( not ( = ?AUTO_6123 ?AUTO_6125 ) ) ( not ( = ?AUTO_6124 ?AUTO_6125 ) ) ( not ( = ?AUTO_6127 ?AUTO_6125 ) ) ( not ( = ?AUTO_6126 ?AUTO_6125 ) ) ( ON ?AUTO_6126 ?AUTO_6127 ) ( CLEAR ?AUTO_6126 ) ( HOLDING ?AUTO_6128 ) ( not ( = ?AUTO_6123 ?AUTO_6128 ) ) ( not ( = ?AUTO_6124 ?AUTO_6128 ) ) ( not ( = ?AUTO_6127 ?AUTO_6128 ) ) ( not ( = ?AUTO_6126 ?AUTO_6128 ) ) ( not ( = ?AUTO_6125 ?AUTO_6128 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6128 )
      ( MAKE-ON ?AUTO_6123 ?AUTO_6124 )
      ( MAKE-ON-VERIFY ?AUTO_6123 ?AUTO_6124 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6135 - BLOCK
      ?AUTO_6136 - BLOCK
    )
    :vars
    (
      ?AUTO_6139 - BLOCK
      ?AUTO_6137 - BLOCK
      ?AUTO_6138 - BLOCK
      ?AUTO_6140 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6135 ?AUTO_6136 ) ) ( ON-TABLE ?AUTO_6135 ) ( not ( = ?AUTO_6135 ?AUTO_6139 ) ) ( not ( = ?AUTO_6135 ?AUTO_6137 ) ) ( not ( = ?AUTO_6136 ?AUTO_6139 ) ) ( not ( = ?AUTO_6136 ?AUTO_6137 ) ) ( not ( = ?AUTO_6139 ?AUTO_6137 ) ) ( ON ?AUTO_6139 ?AUTO_6135 ) ( CLEAR ?AUTO_6138 ) ( not ( = ?AUTO_6135 ?AUTO_6138 ) ) ( not ( = ?AUTO_6136 ?AUTO_6138 ) ) ( not ( = ?AUTO_6139 ?AUTO_6138 ) ) ( not ( = ?AUTO_6137 ?AUTO_6138 ) ) ( ON ?AUTO_6137 ?AUTO_6139 ) ( CLEAR ?AUTO_6137 ) ( HOLDING ?AUTO_6136 ) ( CLEAR ?AUTO_6140 ) ( not ( = ?AUTO_6135 ?AUTO_6140 ) ) ( not ( = ?AUTO_6136 ?AUTO_6140 ) ) ( not ( = ?AUTO_6139 ?AUTO_6140 ) ) ( not ( = ?AUTO_6137 ?AUTO_6140 ) ) ( not ( = ?AUTO_6138 ?AUTO_6140 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_6136 ?AUTO_6140 )
      ( MAKE-ON ?AUTO_6135 ?AUTO_6136 )
      ( MAKE-ON-VERIFY ?AUTO_6135 ?AUTO_6136 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6151 - BLOCK
      ?AUTO_6152 - BLOCK
    )
    :vars
    (
      ?AUTO_6153 - BLOCK
      ?AUTO_6155 - BLOCK
      ?AUTO_6154 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6152 ) ( not ( = ?AUTO_6151 ?AUTO_6152 ) ) ( ON-TABLE ?AUTO_6151 ) ( not ( = ?AUTO_6151 ?AUTO_6153 ) ) ( not ( = ?AUTO_6151 ?AUTO_6155 ) ) ( not ( = ?AUTO_6152 ?AUTO_6153 ) ) ( not ( = ?AUTO_6152 ?AUTO_6155 ) ) ( not ( = ?AUTO_6153 ?AUTO_6155 ) ) ( ON ?AUTO_6153 ?AUTO_6151 ) ( not ( = ?AUTO_6151 ?AUTO_6154 ) ) ( not ( = ?AUTO_6152 ?AUTO_6154 ) ) ( not ( = ?AUTO_6153 ?AUTO_6154 ) ) ( not ( = ?AUTO_6155 ?AUTO_6154 ) ) ( ON ?AUTO_6155 ?AUTO_6153 ) ( CLEAR ?AUTO_6155 ) ( HOLDING ?AUTO_6154 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6154 )
      ( MAKE-ON ?AUTO_6151 ?AUTO_6152 )
      ( MAKE-ON-VERIFY ?AUTO_6151 ?AUTO_6152 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6156 - BLOCK
      ?AUTO_6157 - BLOCK
    )
    :vars
    (
      ?AUTO_6158 - BLOCK
      ?AUTO_6160 - BLOCK
      ?AUTO_6159 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6157 ) ( not ( = ?AUTO_6156 ?AUTO_6157 ) ) ( ON-TABLE ?AUTO_6156 ) ( not ( = ?AUTO_6156 ?AUTO_6158 ) ) ( not ( = ?AUTO_6156 ?AUTO_6160 ) ) ( not ( = ?AUTO_6157 ?AUTO_6158 ) ) ( not ( = ?AUTO_6157 ?AUTO_6160 ) ) ( not ( = ?AUTO_6158 ?AUTO_6160 ) ) ( ON ?AUTO_6158 ?AUTO_6156 ) ( not ( = ?AUTO_6156 ?AUTO_6159 ) ) ( not ( = ?AUTO_6157 ?AUTO_6159 ) ) ( not ( = ?AUTO_6158 ?AUTO_6159 ) ) ( not ( = ?AUTO_6160 ?AUTO_6159 ) ) ( ON ?AUTO_6160 ?AUTO_6158 ) ( ON ?AUTO_6159 ?AUTO_6160 ) ( CLEAR ?AUTO_6159 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6159 ?AUTO_6160 )
      ( MAKE-ON ?AUTO_6156 ?AUTO_6157 )
      ( MAKE-ON-VERIFY ?AUTO_6156 ?AUTO_6157 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6163 - BLOCK
      ?AUTO_6164 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6163 ) ( CLEAR ?AUTO_6164 ) ( not ( = ?AUTO_6163 ?AUTO_6164 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_6163 ?AUTO_6164 )
      ( MAKE-ON-VERIFY ?AUTO_6163 ?AUTO_6164 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6165 - BLOCK
      ?AUTO_6166 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6166 ) ( not ( = ?AUTO_6165 ?AUTO_6166 ) ) ( ON-TABLE ?AUTO_6165 ) ( CLEAR ?AUTO_6165 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_6165 )
      ( MAKE-ON ?AUTO_6165 ?AUTO_6166 )
      ( MAKE-ON-VERIFY ?AUTO_6165 ?AUTO_6166 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6167 - BLOCK
      ?AUTO_6168 - BLOCK
    )
    :vars
    (
      ?AUTO_6169 - BLOCK
      ?AUTO_6170 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6168 ) ( not ( = ?AUTO_6167 ?AUTO_6168 ) ) ( ON-TABLE ?AUTO_6167 ) ( CLEAR ?AUTO_6167 ) ( HOLDING ?AUTO_6169 ) ( CLEAR ?AUTO_6170 ) ( not ( = ?AUTO_6167 ?AUTO_6169 ) ) ( not ( = ?AUTO_6167 ?AUTO_6170 ) ) ( not ( = ?AUTO_6168 ?AUTO_6169 ) ) ( not ( = ?AUTO_6168 ?AUTO_6170 ) ) ( not ( = ?AUTO_6169 ?AUTO_6170 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_6169 ?AUTO_6170 )
      ( MAKE-ON ?AUTO_6167 ?AUTO_6168 )
      ( MAKE-ON-VERIFY ?AUTO_6167 ?AUTO_6168 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6173 - BLOCK
      ?AUTO_6174 - BLOCK
    )
    :vars
    (
      ?AUTO_6175 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6173 ?AUTO_6174 ) ) ( ON-TABLE ?AUTO_6173 ) ( CLEAR ?AUTO_6173 ) ( HOLDING ?AUTO_6174 ) ( CLEAR ?AUTO_6175 ) ( not ( = ?AUTO_6173 ?AUTO_6175 ) ) ( not ( = ?AUTO_6174 ?AUTO_6175 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_6174 ?AUTO_6175 )
      ( MAKE-ON ?AUTO_6173 ?AUTO_6174 )
      ( MAKE-ON-VERIFY ?AUTO_6173 ?AUTO_6174 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6184 - BLOCK
      ?AUTO_6185 - BLOCK
    )
    :vars
    (
      ?AUTO_6186 - BLOCK
      ?AUTO_6187 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6184 ?AUTO_6185 ) ) ( ON-TABLE ?AUTO_6184 ) ( CLEAR ?AUTO_6184 ) ( CLEAR ?AUTO_6186 ) ( not ( = ?AUTO_6184 ?AUTO_6187 ) ) ( not ( = ?AUTO_6184 ?AUTO_6186 ) ) ( not ( = ?AUTO_6185 ?AUTO_6187 ) ) ( not ( = ?AUTO_6185 ?AUTO_6186 ) ) ( not ( = ?AUTO_6187 ?AUTO_6186 ) ) ( ON ?AUTO_6187 ?AUTO_6185 ) ( CLEAR ?AUTO_6187 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6187 ?AUTO_6185 )
      ( MAKE-ON ?AUTO_6184 ?AUTO_6185 )
      ( MAKE-ON-VERIFY ?AUTO_6184 ?AUTO_6185 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6188 - BLOCK
      ?AUTO_6189 - BLOCK
    )
    :vars
    (
      ?AUTO_6190 - BLOCK
      ?AUTO_6191 - BLOCK
      ?AUTO_6192 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6188 ?AUTO_6189 ) ) ( ON-TABLE ?AUTO_6188 ) ( CLEAR ?AUTO_6188 ) ( CLEAR ?AUTO_6190 ) ( not ( = ?AUTO_6188 ?AUTO_6191 ) ) ( not ( = ?AUTO_6188 ?AUTO_6190 ) ) ( not ( = ?AUTO_6189 ?AUTO_6191 ) ) ( not ( = ?AUTO_6189 ?AUTO_6190 ) ) ( not ( = ?AUTO_6191 ?AUTO_6190 ) ) ( ON ?AUTO_6191 ?AUTO_6189 ) ( CLEAR ?AUTO_6191 ) ( HOLDING ?AUTO_6192 ) ( not ( = ?AUTO_6188 ?AUTO_6192 ) ) ( not ( = ?AUTO_6189 ?AUTO_6192 ) ) ( not ( = ?AUTO_6190 ?AUTO_6192 ) ) ( not ( = ?AUTO_6191 ?AUTO_6192 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6192 )
      ( MAKE-ON ?AUTO_6188 ?AUTO_6189 )
      ( MAKE-ON-VERIFY ?AUTO_6188 ?AUTO_6189 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6195 - BLOCK
      ?AUTO_6196 - BLOCK
    )
    :vars
    (
      ?AUTO_6197 - BLOCK
      ?AUTO_6198 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6195 ?AUTO_6196 ) ) ( CLEAR ?AUTO_6197 ) ( not ( = ?AUTO_6195 ?AUTO_6198 ) ) ( not ( = ?AUTO_6195 ?AUTO_6197 ) ) ( not ( = ?AUTO_6196 ?AUTO_6198 ) ) ( not ( = ?AUTO_6196 ?AUTO_6197 ) ) ( not ( = ?AUTO_6198 ?AUTO_6197 ) ) ( ON ?AUTO_6198 ?AUTO_6196 ) ( CLEAR ?AUTO_6198 ) ( HOLDING ?AUTO_6195 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6195 )
      ( MAKE-ON ?AUTO_6195 ?AUTO_6196 )
      ( MAKE-ON-VERIFY ?AUTO_6195 ?AUTO_6196 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6209 - BLOCK
      ?AUTO_6210 - BLOCK
    )
    :vars
    (
      ?AUTO_6211 - BLOCK
      ?AUTO_6213 - BLOCK
      ?AUTO_6212 - BLOCK
      ?AUTO_6214 - BLOCK
      ?AUTO_6215 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6209 ?AUTO_6210 ) ) ( ON ?AUTO_6209 ?AUTO_6211 ) ( not ( = ?AUTO_6209 ?AUTO_6211 ) ) ( not ( = ?AUTO_6210 ?AUTO_6211 ) ) ( CLEAR ?AUTO_6213 ) ( not ( = ?AUTO_6209 ?AUTO_6212 ) ) ( not ( = ?AUTO_6209 ?AUTO_6213 ) ) ( not ( = ?AUTO_6210 ?AUTO_6212 ) ) ( not ( = ?AUTO_6210 ?AUTO_6213 ) ) ( not ( = ?AUTO_6211 ?AUTO_6212 ) ) ( not ( = ?AUTO_6211 ?AUTO_6213 ) ) ( not ( = ?AUTO_6212 ?AUTO_6213 ) ) ( ON ?AUTO_6212 ?AUTO_6209 ) ( CLEAR ?AUTO_6212 ) ( not ( = ?AUTO_6209 ?AUTO_6214 ) ) ( not ( = ?AUTO_6210 ?AUTO_6214 ) ) ( not ( = ?AUTO_6211 ?AUTO_6214 ) ) ( not ( = ?AUTO_6213 ?AUTO_6214 ) ) ( not ( = ?AUTO_6212 ?AUTO_6214 ) ) ( ON ?AUTO_6214 ?AUTO_6210 ) ( CLEAR ?AUTO_6214 ) ( HOLDING ?AUTO_6215 ) ( not ( = ?AUTO_6209 ?AUTO_6215 ) ) ( not ( = ?AUTO_6210 ?AUTO_6215 ) ) ( not ( = ?AUTO_6211 ?AUTO_6215 ) ) ( not ( = ?AUTO_6213 ?AUTO_6215 ) ) ( not ( = ?AUTO_6212 ?AUTO_6215 ) ) ( not ( = ?AUTO_6214 ?AUTO_6215 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6215 )
      ( MAKE-ON ?AUTO_6209 ?AUTO_6210 )
      ( MAKE-ON-VERIFY ?AUTO_6209 ?AUTO_6210 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6216 - BLOCK
      ?AUTO_6217 - BLOCK
    )
    :vars
    (
      ?AUTO_6222 - BLOCK
      ?AUTO_6219 - BLOCK
      ?AUTO_6221 - BLOCK
      ?AUTO_6218 - BLOCK
      ?AUTO_6220 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6216 ?AUTO_6217 ) ) ( ON ?AUTO_6216 ?AUTO_6222 ) ( not ( = ?AUTO_6216 ?AUTO_6222 ) ) ( not ( = ?AUTO_6217 ?AUTO_6222 ) ) ( CLEAR ?AUTO_6219 ) ( not ( = ?AUTO_6216 ?AUTO_6221 ) ) ( not ( = ?AUTO_6216 ?AUTO_6219 ) ) ( not ( = ?AUTO_6217 ?AUTO_6221 ) ) ( not ( = ?AUTO_6217 ?AUTO_6219 ) ) ( not ( = ?AUTO_6222 ?AUTO_6221 ) ) ( not ( = ?AUTO_6222 ?AUTO_6219 ) ) ( not ( = ?AUTO_6221 ?AUTO_6219 ) ) ( ON ?AUTO_6221 ?AUTO_6216 ) ( not ( = ?AUTO_6216 ?AUTO_6218 ) ) ( not ( = ?AUTO_6217 ?AUTO_6218 ) ) ( not ( = ?AUTO_6222 ?AUTO_6218 ) ) ( not ( = ?AUTO_6219 ?AUTO_6218 ) ) ( not ( = ?AUTO_6221 ?AUTO_6218 ) ) ( ON ?AUTO_6218 ?AUTO_6217 ) ( CLEAR ?AUTO_6218 ) ( not ( = ?AUTO_6216 ?AUTO_6220 ) ) ( not ( = ?AUTO_6217 ?AUTO_6220 ) ) ( not ( = ?AUTO_6222 ?AUTO_6220 ) ) ( not ( = ?AUTO_6219 ?AUTO_6220 ) ) ( not ( = ?AUTO_6221 ?AUTO_6220 ) ) ( not ( = ?AUTO_6218 ?AUTO_6220 ) ) ( ON ?AUTO_6220 ?AUTO_6221 ) ( CLEAR ?AUTO_6220 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6220 ?AUTO_6221 )
      ( MAKE-ON ?AUTO_6216 ?AUTO_6217 )
      ( MAKE-ON-VERIFY ?AUTO_6216 ?AUTO_6217 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6223 - BLOCK
      ?AUTO_6224 - BLOCK
    )
    :vars
    (
      ?AUTO_6227 - BLOCK
      ?AUTO_6228 - BLOCK
      ?AUTO_6226 - BLOCK
      ?AUTO_6225 - BLOCK
      ?AUTO_6229 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6223 ?AUTO_6224 ) ) ( ON ?AUTO_6223 ?AUTO_6227 ) ( not ( = ?AUTO_6223 ?AUTO_6227 ) ) ( not ( = ?AUTO_6224 ?AUTO_6227 ) ) ( not ( = ?AUTO_6223 ?AUTO_6228 ) ) ( not ( = ?AUTO_6223 ?AUTO_6226 ) ) ( not ( = ?AUTO_6224 ?AUTO_6228 ) ) ( not ( = ?AUTO_6224 ?AUTO_6226 ) ) ( not ( = ?AUTO_6227 ?AUTO_6228 ) ) ( not ( = ?AUTO_6227 ?AUTO_6226 ) ) ( not ( = ?AUTO_6228 ?AUTO_6226 ) ) ( ON ?AUTO_6228 ?AUTO_6223 ) ( not ( = ?AUTO_6223 ?AUTO_6225 ) ) ( not ( = ?AUTO_6224 ?AUTO_6225 ) ) ( not ( = ?AUTO_6227 ?AUTO_6225 ) ) ( not ( = ?AUTO_6226 ?AUTO_6225 ) ) ( not ( = ?AUTO_6228 ?AUTO_6225 ) ) ( ON ?AUTO_6225 ?AUTO_6224 ) ( CLEAR ?AUTO_6225 ) ( not ( = ?AUTO_6223 ?AUTO_6229 ) ) ( not ( = ?AUTO_6224 ?AUTO_6229 ) ) ( not ( = ?AUTO_6227 ?AUTO_6229 ) ) ( not ( = ?AUTO_6226 ?AUTO_6229 ) ) ( not ( = ?AUTO_6228 ?AUTO_6229 ) ) ( not ( = ?AUTO_6225 ?AUTO_6229 ) ) ( ON ?AUTO_6229 ?AUTO_6228 ) ( CLEAR ?AUTO_6229 ) ( HOLDING ?AUTO_6226 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6226 )
      ( MAKE-ON ?AUTO_6223 ?AUTO_6224 )
      ( MAKE-ON-VERIFY ?AUTO_6223 ?AUTO_6224 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6230 - BLOCK
      ?AUTO_6231 - BLOCK
    )
    :vars
    (
      ?AUTO_6236 - BLOCK
      ?AUTO_6235 - BLOCK
      ?AUTO_6232 - BLOCK
      ?AUTO_6233 - BLOCK
      ?AUTO_6234 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6230 ?AUTO_6231 ) ) ( ON ?AUTO_6230 ?AUTO_6236 ) ( not ( = ?AUTO_6230 ?AUTO_6236 ) ) ( not ( = ?AUTO_6231 ?AUTO_6236 ) ) ( not ( = ?AUTO_6230 ?AUTO_6235 ) ) ( not ( = ?AUTO_6230 ?AUTO_6232 ) ) ( not ( = ?AUTO_6231 ?AUTO_6235 ) ) ( not ( = ?AUTO_6231 ?AUTO_6232 ) ) ( not ( = ?AUTO_6236 ?AUTO_6235 ) ) ( not ( = ?AUTO_6236 ?AUTO_6232 ) ) ( not ( = ?AUTO_6235 ?AUTO_6232 ) ) ( ON ?AUTO_6235 ?AUTO_6230 ) ( not ( = ?AUTO_6230 ?AUTO_6233 ) ) ( not ( = ?AUTO_6231 ?AUTO_6233 ) ) ( not ( = ?AUTO_6236 ?AUTO_6233 ) ) ( not ( = ?AUTO_6232 ?AUTO_6233 ) ) ( not ( = ?AUTO_6235 ?AUTO_6233 ) ) ( ON ?AUTO_6233 ?AUTO_6231 ) ( not ( = ?AUTO_6230 ?AUTO_6234 ) ) ( not ( = ?AUTO_6231 ?AUTO_6234 ) ) ( not ( = ?AUTO_6236 ?AUTO_6234 ) ) ( not ( = ?AUTO_6232 ?AUTO_6234 ) ) ( not ( = ?AUTO_6235 ?AUTO_6234 ) ) ( not ( = ?AUTO_6233 ?AUTO_6234 ) ) ( ON ?AUTO_6234 ?AUTO_6235 ) ( CLEAR ?AUTO_6234 ) ( ON ?AUTO_6232 ?AUTO_6233 ) ( CLEAR ?AUTO_6232 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6232 ?AUTO_6233 )
      ( MAKE-ON ?AUTO_6230 ?AUTO_6231 )
      ( MAKE-ON-VERIFY ?AUTO_6230 ?AUTO_6231 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6238 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6238 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6238 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6238 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6239 - BLOCK
    )
    :vars
    (
      ?AUTO_6240 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6239 ?AUTO_6240 ) ( CLEAR ?AUTO_6239 ) ( HAND-EMPTY ) ( not ( = ?AUTO_6239 ?AUTO_6240 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6239 ?AUTO_6240 )
      ( MAKE-ON-TABLE ?AUTO_6239 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6239 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6242 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6242 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6242 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6242 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6243 - BLOCK
    )
    :vars
    (
      ?AUTO_6244 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6243 ?AUTO_6244 ) ( CLEAR ?AUTO_6243 ) ( HAND-EMPTY ) ( not ( = ?AUTO_6243 ?AUTO_6244 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6243 ?AUTO_6244 )
      ( MAKE-ON-TABLE ?AUTO_6243 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6243 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6245 - BLOCK
    )
    :vars
    (
      ?AUTO_6246 - BLOCK
      ?AUTO_6247 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6245 ?AUTO_6246 ) ( CLEAR ?AUTO_6245 ) ( not ( = ?AUTO_6245 ?AUTO_6246 ) ) ( HOLDING ?AUTO_6247 ) ( not ( = ?AUTO_6245 ?AUTO_6247 ) ) ( not ( = ?AUTO_6246 ?AUTO_6247 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6247 )
      ( MAKE-ON-TABLE ?AUTO_6245 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6245 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6248 - BLOCK
    )
    :vars
    (
      ?AUTO_6249 - BLOCK
      ?AUTO_6250 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6248 ?AUTO_6249 ) ( not ( = ?AUTO_6248 ?AUTO_6249 ) ) ( not ( = ?AUTO_6248 ?AUTO_6250 ) ) ( not ( = ?AUTO_6249 ?AUTO_6250 ) ) ( ON ?AUTO_6250 ?AUTO_6248 ) ( CLEAR ?AUTO_6250 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6250 ?AUTO_6248 )
      ( MAKE-ON-TABLE ?AUTO_6248 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6248 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6252 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6252 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6252 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6252 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6253 - BLOCK
    )
    :vars
    (
      ?AUTO_6254 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6253 ?AUTO_6254 ) ( CLEAR ?AUTO_6253 ) ( HAND-EMPTY ) ( not ( = ?AUTO_6253 ?AUTO_6254 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6253 ?AUTO_6254 )
      ( MAKE-ON-TABLE ?AUTO_6253 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6253 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6255 - BLOCK
    )
    :vars
    (
      ?AUTO_6256 - BLOCK
      ?AUTO_6257 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6255 ?AUTO_6256 ) ( CLEAR ?AUTO_6255 ) ( not ( = ?AUTO_6255 ?AUTO_6256 ) ) ( HOLDING ?AUTO_6257 ) ( not ( = ?AUTO_6255 ?AUTO_6257 ) ) ( not ( = ?AUTO_6256 ?AUTO_6257 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6257 )
      ( MAKE-ON-TABLE ?AUTO_6255 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6255 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6258 - BLOCK
    )
    :vars
    (
      ?AUTO_6259 - BLOCK
      ?AUTO_6260 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6258 ?AUTO_6259 ) ( not ( = ?AUTO_6258 ?AUTO_6259 ) ) ( not ( = ?AUTO_6258 ?AUTO_6260 ) ) ( not ( = ?AUTO_6259 ?AUTO_6260 ) ) ( ON ?AUTO_6260 ?AUTO_6258 ) ( CLEAR ?AUTO_6260 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6260 ?AUTO_6258 )
      ( MAKE-ON-TABLE ?AUTO_6258 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6258 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6261 - BLOCK
    )
    :vars
    (
      ?AUTO_6262 - BLOCK
      ?AUTO_6263 - BLOCK
      ?AUTO_6264 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6261 ?AUTO_6262 ) ( not ( = ?AUTO_6261 ?AUTO_6262 ) ) ( not ( = ?AUTO_6261 ?AUTO_6263 ) ) ( not ( = ?AUTO_6262 ?AUTO_6263 ) ) ( ON ?AUTO_6263 ?AUTO_6261 ) ( CLEAR ?AUTO_6263 ) ( HOLDING ?AUTO_6264 ) ( not ( = ?AUTO_6261 ?AUTO_6264 ) ) ( not ( = ?AUTO_6262 ?AUTO_6264 ) ) ( not ( = ?AUTO_6263 ?AUTO_6264 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6264 )
      ( MAKE-ON-TABLE ?AUTO_6261 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6261 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6265 - BLOCK
    )
    :vars
    (
      ?AUTO_6266 - BLOCK
      ?AUTO_6267 - BLOCK
      ?AUTO_6268 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6265 ?AUTO_6266 ) ( not ( = ?AUTO_6265 ?AUTO_6266 ) ) ( not ( = ?AUTO_6265 ?AUTO_6267 ) ) ( not ( = ?AUTO_6266 ?AUTO_6267 ) ) ( ON ?AUTO_6267 ?AUTO_6265 ) ( not ( = ?AUTO_6265 ?AUTO_6268 ) ) ( not ( = ?AUTO_6266 ?AUTO_6268 ) ) ( not ( = ?AUTO_6267 ?AUTO_6268 ) ) ( ON ?AUTO_6268 ?AUTO_6267 ) ( CLEAR ?AUTO_6268 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6268 ?AUTO_6267 )
      ( MAKE-ON-TABLE ?AUTO_6265 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6265 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6271 - BLOCK
      ?AUTO_6272 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6271 ) ( CLEAR ?AUTO_6272 ) ( not ( = ?AUTO_6271 ?AUTO_6272 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_6271 ?AUTO_6272 )
      ( MAKE-ON-VERIFY ?AUTO_6271 ?AUTO_6272 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6273 - BLOCK
      ?AUTO_6274 - BLOCK
    )
    :vars
    (
      ?AUTO_6275 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6274 ) ( not ( = ?AUTO_6273 ?AUTO_6274 ) ) ( ON ?AUTO_6273 ?AUTO_6275 ) ( CLEAR ?AUTO_6273 ) ( HAND-EMPTY ) ( not ( = ?AUTO_6273 ?AUTO_6275 ) ) ( not ( = ?AUTO_6274 ?AUTO_6275 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6273 ?AUTO_6275 )
      ( MAKE-ON ?AUTO_6273 ?AUTO_6274 )
      ( MAKE-ON-VERIFY ?AUTO_6273 ?AUTO_6274 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6276 - BLOCK
      ?AUTO_6277 - BLOCK
    )
    :vars
    (
      ?AUTO_6278 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6276 ?AUTO_6277 ) ) ( ON ?AUTO_6276 ?AUTO_6278 ) ( CLEAR ?AUTO_6276 ) ( not ( = ?AUTO_6276 ?AUTO_6278 ) ) ( not ( = ?AUTO_6277 ?AUTO_6278 ) ) ( HOLDING ?AUTO_6277 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6277 )
      ( MAKE-ON ?AUTO_6276 ?AUTO_6277 )
      ( MAKE-ON-VERIFY ?AUTO_6276 ?AUTO_6277 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6279 - BLOCK
      ?AUTO_6280 - BLOCK
    )
    :vars
    (
      ?AUTO_6281 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6279 ?AUTO_6280 ) ) ( ON ?AUTO_6279 ?AUTO_6281 ) ( not ( = ?AUTO_6279 ?AUTO_6281 ) ) ( not ( = ?AUTO_6280 ?AUTO_6281 ) ) ( ON ?AUTO_6280 ?AUTO_6279 ) ( CLEAR ?AUTO_6280 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6280 ?AUTO_6279 )
      ( MAKE-ON ?AUTO_6279 ?AUTO_6280 )
      ( MAKE-ON-VERIFY ?AUTO_6279 ?AUTO_6280 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6282 - BLOCK
      ?AUTO_6283 - BLOCK
    )
    :vars
    (
      ?AUTO_6284 - BLOCK
      ?AUTO_6285 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6282 ?AUTO_6283 ) ) ( ON ?AUTO_6282 ?AUTO_6284 ) ( not ( = ?AUTO_6282 ?AUTO_6284 ) ) ( not ( = ?AUTO_6283 ?AUTO_6284 ) ) ( ON ?AUTO_6283 ?AUTO_6282 ) ( CLEAR ?AUTO_6283 ) ( HOLDING ?AUTO_6285 ) ( not ( = ?AUTO_6282 ?AUTO_6285 ) ) ( not ( = ?AUTO_6283 ?AUTO_6285 ) ) ( not ( = ?AUTO_6284 ?AUTO_6285 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6285 )
      ( MAKE-ON ?AUTO_6282 ?AUTO_6283 )
      ( MAKE-ON-VERIFY ?AUTO_6282 ?AUTO_6283 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6286 - BLOCK
      ?AUTO_6287 - BLOCK
    )
    :vars
    (
      ?AUTO_6288 - BLOCK
      ?AUTO_6289 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6286 ?AUTO_6287 ) ) ( ON ?AUTO_6286 ?AUTO_6288 ) ( not ( = ?AUTO_6286 ?AUTO_6288 ) ) ( not ( = ?AUTO_6287 ?AUTO_6288 ) ) ( ON ?AUTO_6287 ?AUTO_6286 ) ( not ( = ?AUTO_6286 ?AUTO_6289 ) ) ( not ( = ?AUTO_6287 ?AUTO_6289 ) ) ( not ( = ?AUTO_6288 ?AUTO_6289 ) ) ( ON ?AUTO_6289 ?AUTO_6287 ) ( CLEAR ?AUTO_6289 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6289 ?AUTO_6287 )
      ( MAKE-ON ?AUTO_6286 ?AUTO_6287 )
      ( MAKE-ON-VERIFY ?AUTO_6286 ?AUTO_6287 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6290 - BLOCK
      ?AUTO_6291 - BLOCK
    )
    :vars
    (
      ?AUTO_6293 - BLOCK
      ?AUTO_6292 - BLOCK
      ?AUTO_6294 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6290 ?AUTO_6291 ) ) ( ON ?AUTO_6290 ?AUTO_6293 ) ( not ( = ?AUTO_6290 ?AUTO_6293 ) ) ( not ( = ?AUTO_6291 ?AUTO_6293 ) ) ( ON ?AUTO_6291 ?AUTO_6290 ) ( not ( = ?AUTO_6290 ?AUTO_6292 ) ) ( not ( = ?AUTO_6291 ?AUTO_6292 ) ) ( not ( = ?AUTO_6293 ?AUTO_6292 ) ) ( ON ?AUTO_6292 ?AUTO_6291 ) ( CLEAR ?AUTO_6292 ) ( HOLDING ?AUTO_6294 ) ( not ( = ?AUTO_6290 ?AUTO_6294 ) ) ( not ( = ?AUTO_6291 ?AUTO_6294 ) ) ( not ( = ?AUTO_6293 ?AUTO_6294 ) ) ( not ( = ?AUTO_6292 ?AUTO_6294 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6294 )
      ( MAKE-ON ?AUTO_6290 ?AUTO_6291 )
      ( MAKE-ON-VERIFY ?AUTO_6290 ?AUTO_6291 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6295 - BLOCK
      ?AUTO_6296 - BLOCK
    )
    :vars
    (
      ?AUTO_6298 - BLOCK
      ?AUTO_6297 - BLOCK
      ?AUTO_6299 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6295 ?AUTO_6296 ) ) ( ON ?AUTO_6295 ?AUTO_6298 ) ( not ( = ?AUTO_6295 ?AUTO_6298 ) ) ( not ( = ?AUTO_6296 ?AUTO_6298 ) ) ( ON ?AUTO_6296 ?AUTO_6295 ) ( not ( = ?AUTO_6295 ?AUTO_6297 ) ) ( not ( = ?AUTO_6296 ?AUTO_6297 ) ) ( not ( = ?AUTO_6298 ?AUTO_6297 ) ) ( ON ?AUTO_6297 ?AUTO_6296 ) ( not ( = ?AUTO_6295 ?AUTO_6299 ) ) ( not ( = ?AUTO_6296 ?AUTO_6299 ) ) ( not ( = ?AUTO_6298 ?AUTO_6299 ) ) ( not ( = ?AUTO_6297 ?AUTO_6299 ) ) ( ON ?AUTO_6299 ?AUTO_6297 ) ( CLEAR ?AUTO_6299 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6299 ?AUTO_6297 )
      ( MAKE-ON ?AUTO_6295 ?AUTO_6296 )
      ( MAKE-ON-VERIFY ?AUTO_6295 ?AUTO_6296 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6302 - BLOCK
      ?AUTO_6303 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6302 ) ( CLEAR ?AUTO_6303 ) ( not ( = ?AUTO_6302 ?AUTO_6303 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_6302 ?AUTO_6303 )
      ( MAKE-ON-VERIFY ?AUTO_6302 ?AUTO_6303 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6304 - BLOCK
      ?AUTO_6305 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6305 ) ( not ( = ?AUTO_6304 ?AUTO_6305 ) ) ( ON-TABLE ?AUTO_6304 ) ( CLEAR ?AUTO_6304 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_6304 )
      ( MAKE-ON ?AUTO_6304 ?AUTO_6305 )
      ( MAKE-ON-VERIFY ?AUTO_6304 ?AUTO_6305 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6306 - BLOCK
      ?AUTO_6307 - BLOCK
    )
    :vars
    (
      ?AUTO_6308 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6306 ?AUTO_6307 ) ) ( ON-TABLE ?AUTO_6306 ) ( CLEAR ?AUTO_6306 ) ( HOLDING ?AUTO_6307 ) ( CLEAR ?AUTO_6308 ) ( not ( = ?AUTO_6306 ?AUTO_6308 ) ) ( not ( = ?AUTO_6307 ?AUTO_6308 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_6307 ?AUTO_6308 )
      ( MAKE-ON ?AUTO_6306 ?AUTO_6307 )
      ( MAKE-ON-VERIFY ?AUTO_6306 ?AUTO_6307 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6311 - BLOCK
      ?AUTO_6312 - BLOCK
    )
    :vars
    (
      ?AUTO_6313 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6312 ) ( not ( = ?AUTO_6311 ?AUTO_6312 ) ) ( ON-TABLE ?AUTO_6311 ) ( CLEAR ?AUTO_6311 ) ( HOLDING ?AUTO_6313 ) ( not ( = ?AUTO_6311 ?AUTO_6313 ) ) ( not ( = ?AUTO_6312 ?AUTO_6313 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6313 )
      ( MAKE-ON ?AUTO_6311 ?AUTO_6312 )
      ( MAKE-ON-VERIFY ?AUTO_6311 ?AUTO_6312 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6314 - BLOCK
      ?AUTO_6315 - BLOCK
    )
    :vars
    (
      ?AUTO_6316 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6314 ?AUTO_6315 ) ) ( ON-TABLE ?AUTO_6314 ) ( CLEAR ?AUTO_6314 ) ( not ( = ?AUTO_6314 ?AUTO_6316 ) ) ( not ( = ?AUTO_6315 ?AUTO_6316 ) ) ( ON ?AUTO_6316 ?AUTO_6315 ) ( CLEAR ?AUTO_6316 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6316 ?AUTO_6315 )
      ( MAKE-ON ?AUTO_6314 ?AUTO_6315 )
      ( MAKE-ON-VERIFY ?AUTO_6314 ?AUTO_6315 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6317 - BLOCK
      ?AUTO_6318 - BLOCK
    )
    :vars
    (
      ?AUTO_6319 - BLOCK
      ?AUTO_6320 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6317 ?AUTO_6318 ) ) ( ON-TABLE ?AUTO_6317 ) ( CLEAR ?AUTO_6317 ) ( not ( = ?AUTO_6317 ?AUTO_6319 ) ) ( not ( = ?AUTO_6318 ?AUTO_6319 ) ) ( ON ?AUTO_6319 ?AUTO_6318 ) ( CLEAR ?AUTO_6319 ) ( HOLDING ?AUTO_6320 ) ( not ( = ?AUTO_6317 ?AUTO_6320 ) ) ( not ( = ?AUTO_6318 ?AUTO_6320 ) ) ( not ( = ?AUTO_6319 ?AUTO_6320 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6320 )
      ( MAKE-ON ?AUTO_6317 ?AUTO_6318 )
      ( MAKE-ON-VERIFY ?AUTO_6317 ?AUTO_6318 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6321 - BLOCK
      ?AUTO_6322 - BLOCK
    )
    :vars
    (
      ?AUTO_6323 - BLOCK
      ?AUTO_6324 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6321 ?AUTO_6322 ) ) ( ON-TABLE ?AUTO_6321 ) ( CLEAR ?AUTO_6321 ) ( not ( = ?AUTO_6321 ?AUTO_6323 ) ) ( not ( = ?AUTO_6322 ?AUTO_6323 ) ) ( ON ?AUTO_6323 ?AUTO_6322 ) ( not ( = ?AUTO_6321 ?AUTO_6324 ) ) ( not ( = ?AUTO_6322 ?AUTO_6324 ) ) ( not ( = ?AUTO_6323 ?AUTO_6324 ) ) ( ON ?AUTO_6324 ?AUTO_6323 ) ( CLEAR ?AUTO_6324 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6324 ?AUTO_6323 )
      ( MAKE-ON ?AUTO_6321 ?AUTO_6322 )
      ( MAKE-ON-VERIFY ?AUTO_6321 ?AUTO_6322 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6325 - BLOCK
      ?AUTO_6326 - BLOCK
    )
    :vars
    (
      ?AUTO_6328 - BLOCK
      ?AUTO_6327 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6325 ?AUTO_6326 ) ) ( not ( = ?AUTO_6325 ?AUTO_6328 ) ) ( not ( = ?AUTO_6326 ?AUTO_6328 ) ) ( ON ?AUTO_6328 ?AUTO_6326 ) ( not ( = ?AUTO_6325 ?AUTO_6327 ) ) ( not ( = ?AUTO_6326 ?AUTO_6327 ) ) ( not ( = ?AUTO_6328 ?AUTO_6327 ) ) ( ON ?AUTO_6327 ?AUTO_6328 ) ( CLEAR ?AUTO_6327 ) ( HOLDING ?AUTO_6325 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6325 )
      ( MAKE-ON ?AUTO_6325 ?AUTO_6326 )
      ( MAKE-ON-VERIFY ?AUTO_6325 ?AUTO_6326 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6329 - BLOCK
      ?AUTO_6330 - BLOCK
    )
    :vars
    (
      ?AUTO_6332 - BLOCK
      ?AUTO_6331 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6329 ?AUTO_6330 ) ) ( not ( = ?AUTO_6329 ?AUTO_6332 ) ) ( not ( = ?AUTO_6330 ?AUTO_6332 ) ) ( ON ?AUTO_6332 ?AUTO_6330 ) ( not ( = ?AUTO_6329 ?AUTO_6331 ) ) ( not ( = ?AUTO_6330 ?AUTO_6331 ) ) ( not ( = ?AUTO_6332 ?AUTO_6331 ) ) ( ON ?AUTO_6331 ?AUTO_6332 ) ( ON ?AUTO_6329 ?AUTO_6331 ) ( CLEAR ?AUTO_6329 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6329 ?AUTO_6331 )
      ( MAKE-ON ?AUTO_6329 ?AUTO_6330 )
      ( MAKE-ON-VERIFY ?AUTO_6329 ?AUTO_6330 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6335 - BLOCK
      ?AUTO_6336 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6335 ) ( CLEAR ?AUTO_6336 ) ( not ( = ?AUTO_6335 ?AUTO_6336 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_6335 ?AUTO_6336 )
      ( MAKE-ON-VERIFY ?AUTO_6335 ?AUTO_6336 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6337 - BLOCK
      ?AUTO_6338 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6338 ) ( not ( = ?AUTO_6337 ?AUTO_6338 ) ) ( ON-TABLE ?AUTO_6337 ) ( CLEAR ?AUTO_6337 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_6337 )
      ( MAKE-ON ?AUTO_6337 ?AUTO_6338 )
      ( MAKE-ON-VERIFY ?AUTO_6337 ?AUTO_6338 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6339 - BLOCK
      ?AUTO_6340 - BLOCK
    )
    :vars
    (
      ?AUTO_6341 - BLOCK
      ?AUTO_6342 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6340 ) ( not ( = ?AUTO_6339 ?AUTO_6340 ) ) ( ON-TABLE ?AUTO_6339 ) ( CLEAR ?AUTO_6339 ) ( HOLDING ?AUTO_6341 ) ( CLEAR ?AUTO_6342 ) ( not ( = ?AUTO_6339 ?AUTO_6341 ) ) ( not ( = ?AUTO_6339 ?AUTO_6342 ) ) ( not ( = ?AUTO_6340 ?AUTO_6341 ) ) ( not ( = ?AUTO_6340 ?AUTO_6342 ) ) ( not ( = ?AUTO_6341 ?AUTO_6342 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_6341 ?AUTO_6342 )
      ( MAKE-ON ?AUTO_6339 ?AUTO_6340 )
      ( MAKE-ON-VERIFY ?AUTO_6339 ?AUTO_6340 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6363 - BLOCK
      ?AUTO_6364 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6363 ) ( CLEAR ?AUTO_6364 ) ( not ( = ?AUTO_6363 ?AUTO_6364 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_6363 ?AUTO_6364 )
      ( MAKE-ON-VERIFY ?AUTO_6363 ?AUTO_6364 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6365 - BLOCK
      ?AUTO_6366 - BLOCK
    )
    :vars
    (
      ?AUTO_6367 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6366 ) ( not ( = ?AUTO_6365 ?AUTO_6366 ) ) ( ON ?AUTO_6365 ?AUTO_6367 ) ( CLEAR ?AUTO_6365 ) ( HAND-EMPTY ) ( not ( = ?AUTO_6365 ?AUTO_6367 ) ) ( not ( = ?AUTO_6366 ?AUTO_6367 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6365 ?AUTO_6367 )
      ( MAKE-ON ?AUTO_6365 ?AUTO_6366 )
      ( MAKE-ON-VERIFY ?AUTO_6365 ?AUTO_6366 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6368 - BLOCK
      ?AUTO_6369 - BLOCK
    )
    :vars
    (
      ?AUTO_6370 - BLOCK
      ?AUTO_6371 - BLOCK
      ?AUTO_6372 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6369 ) ( not ( = ?AUTO_6368 ?AUTO_6369 ) ) ( ON ?AUTO_6368 ?AUTO_6370 ) ( CLEAR ?AUTO_6368 ) ( not ( = ?AUTO_6368 ?AUTO_6370 ) ) ( not ( = ?AUTO_6369 ?AUTO_6370 ) ) ( HOLDING ?AUTO_6371 ) ( CLEAR ?AUTO_6372 ) ( not ( = ?AUTO_6368 ?AUTO_6371 ) ) ( not ( = ?AUTO_6368 ?AUTO_6372 ) ) ( not ( = ?AUTO_6369 ?AUTO_6371 ) ) ( not ( = ?AUTO_6369 ?AUTO_6372 ) ) ( not ( = ?AUTO_6370 ?AUTO_6371 ) ) ( not ( = ?AUTO_6370 ?AUTO_6372 ) ) ( not ( = ?AUTO_6371 ?AUTO_6372 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_6371 ?AUTO_6372 )
      ( MAKE-ON ?AUTO_6368 ?AUTO_6369 )
      ( MAKE-ON-VERIFY ?AUTO_6368 ?AUTO_6369 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6381 - BLOCK
      ?AUTO_6382 - BLOCK
    )
    :vars
    (
      ?AUTO_6383 - BLOCK
      ?AUTO_6384 - BLOCK
      ?AUTO_6385 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6381 ?AUTO_6382 ) ) ( ON ?AUTO_6381 ?AUTO_6383 ) ( CLEAR ?AUTO_6381 ) ( not ( = ?AUTO_6381 ?AUTO_6383 ) ) ( not ( = ?AUTO_6382 ?AUTO_6383 ) ) ( CLEAR ?AUTO_6384 ) ( not ( = ?AUTO_6381 ?AUTO_6385 ) ) ( not ( = ?AUTO_6381 ?AUTO_6384 ) ) ( not ( = ?AUTO_6382 ?AUTO_6385 ) ) ( not ( = ?AUTO_6382 ?AUTO_6384 ) ) ( not ( = ?AUTO_6383 ?AUTO_6385 ) ) ( not ( = ?AUTO_6383 ?AUTO_6384 ) ) ( not ( = ?AUTO_6385 ?AUTO_6384 ) ) ( ON ?AUTO_6385 ?AUTO_6382 ) ( CLEAR ?AUTO_6385 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6385 ?AUTO_6382 )
      ( MAKE-ON ?AUTO_6381 ?AUTO_6382 )
      ( MAKE-ON-VERIFY ?AUTO_6381 ?AUTO_6382 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6386 - BLOCK
      ?AUTO_6387 - BLOCK
    )
    :vars
    (
      ?AUTO_6389 - BLOCK
      ?AUTO_6388 - BLOCK
      ?AUTO_6390 - BLOCK
      ?AUTO_6391 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6386 ?AUTO_6387 ) ) ( ON ?AUTO_6386 ?AUTO_6389 ) ( CLEAR ?AUTO_6386 ) ( not ( = ?AUTO_6386 ?AUTO_6389 ) ) ( not ( = ?AUTO_6387 ?AUTO_6389 ) ) ( CLEAR ?AUTO_6388 ) ( not ( = ?AUTO_6386 ?AUTO_6390 ) ) ( not ( = ?AUTO_6386 ?AUTO_6388 ) ) ( not ( = ?AUTO_6387 ?AUTO_6390 ) ) ( not ( = ?AUTO_6387 ?AUTO_6388 ) ) ( not ( = ?AUTO_6389 ?AUTO_6390 ) ) ( not ( = ?AUTO_6389 ?AUTO_6388 ) ) ( not ( = ?AUTO_6390 ?AUTO_6388 ) ) ( ON ?AUTO_6390 ?AUTO_6387 ) ( CLEAR ?AUTO_6390 ) ( HOLDING ?AUTO_6391 ) ( not ( = ?AUTO_6386 ?AUTO_6391 ) ) ( not ( = ?AUTO_6387 ?AUTO_6391 ) ) ( not ( = ?AUTO_6389 ?AUTO_6391 ) ) ( not ( = ?AUTO_6388 ?AUTO_6391 ) ) ( not ( = ?AUTO_6390 ?AUTO_6391 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6391 )
      ( MAKE-ON ?AUTO_6386 ?AUTO_6387 )
      ( MAKE-ON-VERIFY ?AUTO_6386 ?AUTO_6387 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6392 - BLOCK
      ?AUTO_6393 - BLOCK
    )
    :vars
    (
      ?AUTO_6394 - BLOCK
      ?AUTO_6395 - BLOCK
      ?AUTO_6396 - BLOCK
      ?AUTO_6397 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6392 ?AUTO_6393 ) ) ( ON ?AUTO_6392 ?AUTO_6394 ) ( CLEAR ?AUTO_6392 ) ( not ( = ?AUTO_6392 ?AUTO_6394 ) ) ( not ( = ?AUTO_6393 ?AUTO_6394 ) ) ( CLEAR ?AUTO_6395 ) ( not ( = ?AUTO_6392 ?AUTO_6396 ) ) ( not ( = ?AUTO_6392 ?AUTO_6395 ) ) ( not ( = ?AUTO_6393 ?AUTO_6396 ) ) ( not ( = ?AUTO_6393 ?AUTO_6395 ) ) ( not ( = ?AUTO_6394 ?AUTO_6396 ) ) ( not ( = ?AUTO_6394 ?AUTO_6395 ) ) ( not ( = ?AUTO_6396 ?AUTO_6395 ) ) ( ON ?AUTO_6396 ?AUTO_6393 ) ( not ( = ?AUTO_6392 ?AUTO_6397 ) ) ( not ( = ?AUTO_6393 ?AUTO_6397 ) ) ( not ( = ?AUTO_6394 ?AUTO_6397 ) ) ( not ( = ?AUTO_6395 ?AUTO_6397 ) ) ( not ( = ?AUTO_6396 ?AUTO_6397 ) ) ( ON ?AUTO_6397 ?AUTO_6396 ) ( CLEAR ?AUTO_6397 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6397 ?AUTO_6396 )
      ( MAKE-ON ?AUTO_6392 ?AUTO_6393 )
      ( MAKE-ON-VERIFY ?AUTO_6392 ?AUTO_6393 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6398 - BLOCK
      ?AUTO_6399 - BLOCK
    )
    :vars
    (
      ?AUTO_6401 - BLOCK
      ?AUTO_6402 - BLOCK
      ?AUTO_6400 - BLOCK
      ?AUTO_6403 - BLOCK
      ?AUTO_6404 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6398 ?AUTO_6399 ) ) ( ON ?AUTO_6398 ?AUTO_6401 ) ( CLEAR ?AUTO_6398 ) ( not ( = ?AUTO_6398 ?AUTO_6401 ) ) ( not ( = ?AUTO_6399 ?AUTO_6401 ) ) ( CLEAR ?AUTO_6402 ) ( not ( = ?AUTO_6398 ?AUTO_6400 ) ) ( not ( = ?AUTO_6398 ?AUTO_6402 ) ) ( not ( = ?AUTO_6399 ?AUTO_6400 ) ) ( not ( = ?AUTO_6399 ?AUTO_6402 ) ) ( not ( = ?AUTO_6401 ?AUTO_6400 ) ) ( not ( = ?AUTO_6401 ?AUTO_6402 ) ) ( not ( = ?AUTO_6400 ?AUTO_6402 ) ) ( ON ?AUTO_6400 ?AUTO_6399 ) ( not ( = ?AUTO_6398 ?AUTO_6403 ) ) ( not ( = ?AUTO_6399 ?AUTO_6403 ) ) ( not ( = ?AUTO_6401 ?AUTO_6403 ) ) ( not ( = ?AUTO_6402 ?AUTO_6403 ) ) ( not ( = ?AUTO_6400 ?AUTO_6403 ) ) ( ON ?AUTO_6403 ?AUTO_6400 ) ( CLEAR ?AUTO_6403 ) ( HOLDING ?AUTO_6404 ) ( not ( = ?AUTO_6398 ?AUTO_6404 ) ) ( not ( = ?AUTO_6399 ?AUTO_6404 ) ) ( not ( = ?AUTO_6401 ?AUTO_6404 ) ) ( not ( = ?AUTO_6402 ?AUTO_6404 ) ) ( not ( = ?AUTO_6400 ?AUTO_6404 ) ) ( not ( = ?AUTO_6403 ?AUTO_6404 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6404 )
      ( MAKE-ON ?AUTO_6398 ?AUTO_6399 )
      ( MAKE-ON-VERIFY ?AUTO_6398 ?AUTO_6399 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6405 - BLOCK
      ?AUTO_6406 - BLOCK
    )
    :vars
    (
      ?AUTO_6408 - BLOCK
      ?AUTO_6411 - BLOCK
      ?AUTO_6407 - BLOCK
      ?AUTO_6410 - BLOCK
      ?AUTO_6409 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6405 ?AUTO_6406 ) ) ( ON ?AUTO_6405 ?AUTO_6408 ) ( CLEAR ?AUTO_6405 ) ( not ( = ?AUTO_6405 ?AUTO_6408 ) ) ( not ( = ?AUTO_6406 ?AUTO_6408 ) ) ( CLEAR ?AUTO_6411 ) ( not ( = ?AUTO_6405 ?AUTO_6407 ) ) ( not ( = ?AUTO_6405 ?AUTO_6411 ) ) ( not ( = ?AUTO_6406 ?AUTO_6407 ) ) ( not ( = ?AUTO_6406 ?AUTO_6411 ) ) ( not ( = ?AUTO_6408 ?AUTO_6407 ) ) ( not ( = ?AUTO_6408 ?AUTO_6411 ) ) ( not ( = ?AUTO_6407 ?AUTO_6411 ) ) ( ON ?AUTO_6407 ?AUTO_6406 ) ( not ( = ?AUTO_6405 ?AUTO_6410 ) ) ( not ( = ?AUTO_6406 ?AUTO_6410 ) ) ( not ( = ?AUTO_6408 ?AUTO_6410 ) ) ( not ( = ?AUTO_6411 ?AUTO_6410 ) ) ( not ( = ?AUTO_6407 ?AUTO_6410 ) ) ( ON ?AUTO_6410 ?AUTO_6407 ) ( not ( = ?AUTO_6405 ?AUTO_6409 ) ) ( not ( = ?AUTO_6406 ?AUTO_6409 ) ) ( not ( = ?AUTO_6408 ?AUTO_6409 ) ) ( not ( = ?AUTO_6411 ?AUTO_6409 ) ) ( not ( = ?AUTO_6407 ?AUTO_6409 ) ) ( not ( = ?AUTO_6410 ?AUTO_6409 ) ) ( ON ?AUTO_6409 ?AUTO_6410 ) ( CLEAR ?AUTO_6409 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6409 ?AUTO_6410 )
      ( MAKE-ON ?AUTO_6405 ?AUTO_6406 )
      ( MAKE-ON-VERIFY ?AUTO_6405 ?AUTO_6406 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6412 - BLOCK
      ?AUTO_6413 - BLOCK
    )
    :vars
    (
      ?AUTO_6414 - BLOCK
      ?AUTO_6417 - BLOCK
      ?AUTO_6415 - BLOCK
      ?AUTO_6418 - BLOCK
      ?AUTO_6416 - BLOCK
      ?AUTO_6419 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6412 ?AUTO_6413 ) ) ( ON ?AUTO_6412 ?AUTO_6414 ) ( CLEAR ?AUTO_6412 ) ( not ( = ?AUTO_6412 ?AUTO_6414 ) ) ( not ( = ?AUTO_6413 ?AUTO_6414 ) ) ( CLEAR ?AUTO_6417 ) ( not ( = ?AUTO_6412 ?AUTO_6415 ) ) ( not ( = ?AUTO_6412 ?AUTO_6417 ) ) ( not ( = ?AUTO_6413 ?AUTO_6415 ) ) ( not ( = ?AUTO_6413 ?AUTO_6417 ) ) ( not ( = ?AUTO_6414 ?AUTO_6415 ) ) ( not ( = ?AUTO_6414 ?AUTO_6417 ) ) ( not ( = ?AUTO_6415 ?AUTO_6417 ) ) ( ON ?AUTO_6415 ?AUTO_6413 ) ( not ( = ?AUTO_6412 ?AUTO_6418 ) ) ( not ( = ?AUTO_6413 ?AUTO_6418 ) ) ( not ( = ?AUTO_6414 ?AUTO_6418 ) ) ( not ( = ?AUTO_6417 ?AUTO_6418 ) ) ( not ( = ?AUTO_6415 ?AUTO_6418 ) ) ( ON ?AUTO_6418 ?AUTO_6415 ) ( not ( = ?AUTO_6412 ?AUTO_6416 ) ) ( not ( = ?AUTO_6413 ?AUTO_6416 ) ) ( not ( = ?AUTO_6414 ?AUTO_6416 ) ) ( not ( = ?AUTO_6417 ?AUTO_6416 ) ) ( not ( = ?AUTO_6415 ?AUTO_6416 ) ) ( not ( = ?AUTO_6418 ?AUTO_6416 ) ) ( ON ?AUTO_6416 ?AUTO_6418 ) ( CLEAR ?AUTO_6416 ) ( HOLDING ?AUTO_6419 ) ( not ( = ?AUTO_6412 ?AUTO_6419 ) ) ( not ( = ?AUTO_6413 ?AUTO_6419 ) ) ( not ( = ?AUTO_6414 ?AUTO_6419 ) ) ( not ( = ?AUTO_6417 ?AUTO_6419 ) ) ( not ( = ?AUTO_6415 ?AUTO_6419 ) ) ( not ( = ?AUTO_6418 ?AUTO_6419 ) ) ( not ( = ?AUTO_6416 ?AUTO_6419 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6419 )
      ( MAKE-ON ?AUTO_6412 ?AUTO_6413 )
      ( MAKE-ON-VERIFY ?AUTO_6412 ?AUTO_6413 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6420 - BLOCK
      ?AUTO_6421 - BLOCK
    )
    :vars
    (
      ?AUTO_6424 - BLOCK
      ?AUTO_6427 - BLOCK
      ?AUTO_6423 - BLOCK
      ?AUTO_6422 - BLOCK
      ?AUTO_6425 - BLOCK
      ?AUTO_6426 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6420 ?AUTO_6421 ) ) ( ON ?AUTO_6420 ?AUTO_6424 ) ( CLEAR ?AUTO_6420 ) ( not ( = ?AUTO_6420 ?AUTO_6424 ) ) ( not ( = ?AUTO_6421 ?AUTO_6424 ) ) ( CLEAR ?AUTO_6427 ) ( not ( = ?AUTO_6420 ?AUTO_6423 ) ) ( not ( = ?AUTO_6420 ?AUTO_6427 ) ) ( not ( = ?AUTO_6421 ?AUTO_6423 ) ) ( not ( = ?AUTO_6421 ?AUTO_6427 ) ) ( not ( = ?AUTO_6424 ?AUTO_6423 ) ) ( not ( = ?AUTO_6424 ?AUTO_6427 ) ) ( not ( = ?AUTO_6423 ?AUTO_6427 ) ) ( ON ?AUTO_6423 ?AUTO_6421 ) ( not ( = ?AUTO_6420 ?AUTO_6422 ) ) ( not ( = ?AUTO_6421 ?AUTO_6422 ) ) ( not ( = ?AUTO_6424 ?AUTO_6422 ) ) ( not ( = ?AUTO_6427 ?AUTO_6422 ) ) ( not ( = ?AUTO_6423 ?AUTO_6422 ) ) ( ON ?AUTO_6422 ?AUTO_6423 ) ( not ( = ?AUTO_6420 ?AUTO_6425 ) ) ( not ( = ?AUTO_6421 ?AUTO_6425 ) ) ( not ( = ?AUTO_6424 ?AUTO_6425 ) ) ( not ( = ?AUTO_6427 ?AUTO_6425 ) ) ( not ( = ?AUTO_6423 ?AUTO_6425 ) ) ( not ( = ?AUTO_6422 ?AUTO_6425 ) ) ( ON ?AUTO_6425 ?AUTO_6422 ) ( not ( = ?AUTO_6420 ?AUTO_6426 ) ) ( not ( = ?AUTO_6421 ?AUTO_6426 ) ) ( not ( = ?AUTO_6424 ?AUTO_6426 ) ) ( not ( = ?AUTO_6427 ?AUTO_6426 ) ) ( not ( = ?AUTO_6423 ?AUTO_6426 ) ) ( not ( = ?AUTO_6422 ?AUTO_6426 ) ) ( not ( = ?AUTO_6425 ?AUTO_6426 ) ) ( ON ?AUTO_6426 ?AUTO_6425 ) ( CLEAR ?AUTO_6426 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6426 ?AUTO_6425 )
      ( MAKE-ON ?AUTO_6420 ?AUTO_6421 )
      ( MAKE-ON-VERIFY ?AUTO_6420 ?AUTO_6421 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6429 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6429 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6429 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6429 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6430 - BLOCK
    )
    :vars
    (
      ?AUTO_6431 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6430 ?AUTO_6431 ) ( CLEAR ?AUTO_6430 ) ( HAND-EMPTY ) ( not ( = ?AUTO_6430 ?AUTO_6431 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6430 ?AUTO_6431 )
      ( MAKE-ON-TABLE ?AUTO_6430 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6430 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6432 - BLOCK
    )
    :vars
    (
      ?AUTO_6433 - BLOCK
      ?AUTO_6434 - BLOCK
      ?AUTO_6435 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6432 ?AUTO_6433 ) ( CLEAR ?AUTO_6432 ) ( not ( = ?AUTO_6432 ?AUTO_6433 ) ) ( HOLDING ?AUTO_6434 ) ( CLEAR ?AUTO_6435 ) ( not ( = ?AUTO_6432 ?AUTO_6434 ) ) ( not ( = ?AUTO_6432 ?AUTO_6435 ) ) ( not ( = ?AUTO_6433 ?AUTO_6434 ) ) ( not ( = ?AUTO_6433 ?AUTO_6435 ) ) ( not ( = ?AUTO_6434 ?AUTO_6435 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_6434 ?AUTO_6435 )
      ( MAKE-ON-TABLE ?AUTO_6432 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6432 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6436 - BLOCK
    )
    :vars
    (
      ?AUTO_6437 - BLOCK
      ?AUTO_6439 - BLOCK
      ?AUTO_6438 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6436 ?AUTO_6437 ) ( not ( = ?AUTO_6436 ?AUTO_6437 ) ) ( CLEAR ?AUTO_6439 ) ( not ( = ?AUTO_6436 ?AUTO_6438 ) ) ( not ( = ?AUTO_6436 ?AUTO_6439 ) ) ( not ( = ?AUTO_6437 ?AUTO_6438 ) ) ( not ( = ?AUTO_6437 ?AUTO_6439 ) ) ( not ( = ?AUTO_6438 ?AUTO_6439 ) ) ( ON ?AUTO_6438 ?AUTO_6436 ) ( CLEAR ?AUTO_6438 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6438 ?AUTO_6436 )
      ( MAKE-ON-TABLE ?AUTO_6436 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6436 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6440 - BLOCK
    )
    :vars
    (
      ?AUTO_6441 - BLOCK
      ?AUTO_6443 - BLOCK
      ?AUTO_6442 - BLOCK
      ?AUTO_6444 - BLOCK
      ?AUTO_6445 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6440 ?AUTO_6441 ) ( not ( = ?AUTO_6440 ?AUTO_6441 ) ) ( CLEAR ?AUTO_6443 ) ( not ( = ?AUTO_6440 ?AUTO_6442 ) ) ( not ( = ?AUTO_6440 ?AUTO_6443 ) ) ( not ( = ?AUTO_6441 ?AUTO_6442 ) ) ( not ( = ?AUTO_6441 ?AUTO_6443 ) ) ( not ( = ?AUTO_6442 ?AUTO_6443 ) ) ( ON ?AUTO_6442 ?AUTO_6440 ) ( CLEAR ?AUTO_6442 ) ( HOLDING ?AUTO_6444 ) ( CLEAR ?AUTO_6445 ) ( not ( = ?AUTO_6440 ?AUTO_6444 ) ) ( not ( = ?AUTO_6440 ?AUTO_6445 ) ) ( not ( = ?AUTO_6441 ?AUTO_6444 ) ) ( not ( = ?AUTO_6441 ?AUTO_6445 ) ) ( not ( = ?AUTO_6443 ?AUTO_6444 ) ) ( not ( = ?AUTO_6443 ?AUTO_6445 ) ) ( not ( = ?AUTO_6442 ?AUTO_6444 ) ) ( not ( = ?AUTO_6442 ?AUTO_6445 ) ) ( not ( = ?AUTO_6444 ?AUTO_6445 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_6444 ?AUTO_6445 )
      ( MAKE-ON-TABLE ?AUTO_6440 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6440 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6458 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6458 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6458 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6458 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6459 - BLOCK
    )
    :vars
    (
      ?AUTO_6460 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6459 ?AUTO_6460 ) ( CLEAR ?AUTO_6459 ) ( HAND-EMPTY ) ( not ( = ?AUTO_6459 ?AUTO_6460 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6459 ?AUTO_6460 )
      ( MAKE-ON-TABLE ?AUTO_6459 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6459 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6461 - BLOCK
    )
    :vars
    (
      ?AUTO_6462 - BLOCK
      ?AUTO_6463 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6461 ?AUTO_6462 ) ( CLEAR ?AUTO_6461 ) ( not ( = ?AUTO_6461 ?AUTO_6462 ) ) ( HOLDING ?AUTO_6463 ) ( not ( = ?AUTO_6461 ?AUTO_6463 ) ) ( not ( = ?AUTO_6462 ?AUTO_6463 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6463 )
      ( MAKE-ON-TABLE ?AUTO_6461 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6461 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6464 - BLOCK
    )
    :vars
    (
      ?AUTO_6465 - BLOCK
      ?AUTO_6466 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6464 ?AUTO_6465 ) ( not ( = ?AUTO_6464 ?AUTO_6465 ) ) ( not ( = ?AUTO_6464 ?AUTO_6466 ) ) ( not ( = ?AUTO_6465 ?AUTO_6466 ) ) ( ON ?AUTO_6466 ?AUTO_6464 ) ( CLEAR ?AUTO_6466 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6466 ?AUTO_6464 )
      ( MAKE-ON-TABLE ?AUTO_6464 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6464 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6467 - BLOCK
    )
    :vars
    (
      ?AUTO_6468 - BLOCK
      ?AUTO_6469 - BLOCK
      ?AUTO_6470 - BLOCK
      ?AUTO_6471 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6467 ?AUTO_6468 ) ( not ( = ?AUTO_6467 ?AUTO_6468 ) ) ( not ( = ?AUTO_6467 ?AUTO_6469 ) ) ( not ( = ?AUTO_6468 ?AUTO_6469 ) ) ( ON ?AUTO_6469 ?AUTO_6467 ) ( CLEAR ?AUTO_6469 ) ( HOLDING ?AUTO_6470 ) ( CLEAR ?AUTO_6471 ) ( not ( = ?AUTO_6467 ?AUTO_6470 ) ) ( not ( = ?AUTO_6467 ?AUTO_6471 ) ) ( not ( = ?AUTO_6468 ?AUTO_6470 ) ) ( not ( = ?AUTO_6468 ?AUTO_6471 ) ) ( not ( = ?AUTO_6469 ?AUTO_6470 ) ) ( not ( = ?AUTO_6469 ?AUTO_6471 ) ) ( not ( = ?AUTO_6470 ?AUTO_6471 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_6470 ?AUTO_6471 )
      ( MAKE-ON-TABLE ?AUTO_6467 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6467 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6472 - BLOCK
    )
    :vars
    (
      ?AUTO_6473 - BLOCK
      ?AUTO_6474 - BLOCK
      ?AUTO_6475 - BLOCK
      ?AUTO_6476 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6472 ?AUTO_6473 ) ( not ( = ?AUTO_6472 ?AUTO_6473 ) ) ( not ( = ?AUTO_6472 ?AUTO_6474 ) ) ( not ( = ?AUTO_6473 ?AUTO_6474 ) ) ( ON ?AUTO_6474 ?AUTO_6472 ) ( CLEAR ?AUTO_6475 ) ( not ( = ?AUTO_6472 ?AUTO_6476 ) ) ( not ( = ?AUTO_6472 ?AUTO_6475 ) ) ( not ( = ?AUTO_6473 ?AUTO_6476 ) ) ( not ( = ?AUTO_6473 ?AUTO_6475 ) ) ( not ( = ?AUTO_6474 ?AUTO_6476 ) ) ( not ( = ?AUTO_6474 ?AUTO_6475 ) ) ( not ( = ?AUTO_6476 ?AUTO_6475 ) ) ( ON ?AUTO_6476 ?AUTO_6474 ) ( CLEAR ?AUTO_6476 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6476 ?AUTO_6474 )
      ( MAKE-ON-TABLE ?AUTO_6472 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6472 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6477 - BLOCK
    )
    :vars
    (
      ?AUTO_6478 - BLOCK
      ?AUTO_6479 - BLOCK
      ?AUTO_6480 - BLOCK
      ?AUTO_6481 - BLOCK
      ?AUTO_6482 - BLOCK
      ?AUTO_6483 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6477 ?AUTO_6478 ) ( not ( = ?AUTO_6477 ?AUTO_6478 ) ) ( not ( = ?AUTO_6477 ?AUTO_6479 ) ) ( not ( = ?AUTO_6478 ?AUTO_6479 ) ) ( ON ?AUTO_6479 ?AUTO_6477 ) ( CLEAR ?AUTO_6480 ) ( not ( = ?AUTO_6477 ?AUTO_6481 ) ) ( not ( = ?AUTO_6477 ?AUTO_6480 ) ) ( not ( = ?AUTO_6478 ?AUTO_6481 ) ) ( not ( = ?AUTO_6478 ?AUTO_6480 ) ) ( not ( = ?AUTO_6479 ?AUTO_6481 ) ) ( not ( = ?AUTO_6479 ?AUTO_6480 ) ) ( not ( = ?AUTO_6481 ?AUTO_6480 ) ) ( ON ?AUTO_6481 ?AUTO_6479 ) ( CLEAR ?AUTO_6481 ) ( HOLDING ?AUTO_6482 ) ( CLEAR ?AUTO_6483 ) ( not ( = ?AUTO_6477 ?AUTO_6482 ) ) ( not ( = ?AUTO_6477 ?AUTO_6483 ) ) ( not ( = ?AUTO_6478 ?AUTO_6482 ) ) ( not ( = ?AUTO_6478 ?AUTO_6483 ) ) ( not ( = ?AUTO_6479 ?AUTO_6482 ) ) ( not ( = ?AUTO_6479 ?AUTO_6483 ) ) ( not ( = ?AUTO_6480 ?AUTO_6482 ) ) ( not ( = ?AUTO_6480 ?AUTO_6483 ) ) ( not ( = ?AUTO_6481 ?AUTO_6482 ) ) ( not ( = ?AUTO_6481 ?AUTO_6483 ) ) ( not ( = ?AUTO_6482 ?AUTO_6483 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_6482 ?AUTO_6483 )
      ( MAKE-ON-TABLE ?AUTO_6477 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6477 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6497 - BLOCK
      ?AUTO_6498 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6497 ) ( CLEAR ?AUTO_6498 ) ( not ( = ?AUTO_6497 ?AUTO_6498 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_6497 ?AUTO_6498 )
      ( MAKE-ON-VERIFY ?AUTO_6497 ?AUTO_6498 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6499 - BLOCK
      ?AUTO_6500 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6500 ) ( not ( = ?AUTO_6499 ?AUTO_6500 ) ) ( ON-TABLE ?AUTO_6499 ) ( CLEAR ?AUTO_6499 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_6499 )
      ( MAKE-ON ?AUTO_6499 ?AUTO_6500 )
      ( MAKE-ON-VERIFY ?AUTO_6499 ?AUTO_6500 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6501 - BLOCK
      ?AUTO_6502 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6501 ?AUTO_6502 ) ) ( ON-TABLE ?AUTO_6501 ) ( CLEAR ?AUTO_6501 ) ( HOLDING ?AUTO_6502 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6502 )
      ( MAKE-ON ?AUTO_6501 ?AUTO_6502 )
      ( MAKE-ON-VERIFY ?AUTO_6501 ?AUTO_6502 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6619 - BLOCK
      ?AUTO_6620 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6619 ) ( CLEAR ?AUTO_6620 ) ( not ( = ?AUTO_6619 ?AUTO_6620 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_6619 ?AUTO_6620 )
      ( MAKE-ON-VERIFY ?AUTO_6619 ?AUTO_6620 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6621 - BLOCK
      ?AUTO_6622 - BLOCK
    )
    :vars
    (
      ?AUTO_6623 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6622 ) ( not ( = ?AUTO_6621 ?AUTO_6622 ) ) ( ON ?AUTO_6621 ?AUTO_6623 ) ( CLEAR ?AUTO_6621 ) ( HAND-EMPTY ) ( not ( = ?AUTO_6621 ?AUTO_6623 ) ) ( not ( = ?AUTO_6622 ?AUTO_6623 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6621 ?AUTO_6623 )
      ( MAKE-ON ?AUTO_6621 ?AUTO_6622 )
      ( MAKE-ON-VERIFY ?AUTO_6621 ?AUTO_6622 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6624 - BLOCK
      ?AUTO_6625 - BLOCK
    )
    :vars
    (
      ?AUTO_6626 - BLOCK
      ?AUTO_6627 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6624 ?AUTO_6625 ) ) ( ON ?AUTO_6624 ?AUTO_6626 ) ( CLEAR ?AUTO_6624 ) ( not ( = ?AUTO_6624 ?AUTO_6626 ) ) ( not ( = ?AUTO_6625 ?AUTO_6626 ) ) ( HOLDING ?AUTO_6625 ) ( CLEAR ?AUTO_6627 ) ( not ( = ?AUTO_6624 ?AUTO_6627 ) ) ( not ( = ?AUTO_6625 ?AUTO_6627 ) ) ( not ( = ?AUTO_6626 ?AUTO_6627 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_6625 ?AUTO_6627 )
      ( MAKE-ON ?AUTO_6624 ?AUTO_6625 )
      ( MAKE-ON-VERIFY ?AUTO_6624 ?AUTO_6625 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6630 - BLOCK
      ?AUTO_6631 - BLOCK
    )
    :vars
    (
      ?AUTO_6632 - BLOCK
      ?AUTO_6633 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6631 ) ( not ( = ?AUTO_6630 ?AUTO_6631 ) ) ( ON ?AUTO_6630 ?AUTO_6632 ) ( CLEAR ?AUTO_6630 ) ( not ( = ?AUTO_6630 ?AUTO_6632 ) ) ( not ( = ?AUTO_6631 ?AUTO_6632 ) ) ( HOLDING ?AUTO_6633 ) ( not ( = ?AUTO_6630 ?AUTO_6633 ) ) ( not ( = ?AUTO_6631 ?AUTO_6633 ) ) ( not ( = ?AUTO_6632 ?AUTO_6633 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6633 )
      ( MAKE-ON ?AUTO_6630 ?AUTO_6631 )
      ( MAKE-ON-VERIFY ?AUTO_6630 ?AUTO_6631 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6729 - BLOCK
      ?AUTO_6730 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6729 ) ( CLEAR ?AUTO_6730 ) ( not ( = ?AUTO_6729 ?AUTO_6730 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_6729 ?AUTO_6730 )
      ( MAKE-ON-VERIFY ?AUTO_6729 ?AUTO_6730 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6731 - BLOCK
      ?AUTO_6732 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6732 ) ( not ( = ?AUTO_6731 ?AUTO_6732 ) ) ( ON-TABLE ?AUTO_6731 ) ( CLEAR ?AUTO_6731 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_6731 )
      ( MAKE-ON ?AUTO_6731 ?AUTO_6732 )
      ( MAKE-ON-VERIFY ?AUTO_6731 ?AUTO_6732 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6733 - BLOCK
      ?AUTO_6734 - BLOCK
    )
    :vars
    (
      ?AUTO_6735 - BLOCK
      ?AUTO_6736 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6734 ) ( not ( = ?AUTO_6733 ?AUTO_6734 ) ) ( ON-TABLE ?AUTO_6733 ) ( CLEAR ?AUTO_6733 ) ( HOLDING ?AUTO_6735 ) ( CLEAR ?AUTO_6736 ) ( not ( = ?AUTO_6733 ?AUTO_6735 ) ) ( not ( = ?AUTO_6733 ?AUTO_6736 ) ) ( not ( = ?AUTO_6734 ?AUTO_6735 ) ) ( not ( = ?AUTO_6734 ?AUTO_6736 ) ) ( not ( = ?AUTO_6735 ?AUTO_6736 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_6735 ?AUTO_6736 )
      ( MAKE-ON ?AUTO_6733 ?AUTO_6734 )
      ( MAKE-ON-VERIFY ?AUTO_6733 ?AUTO_6734 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6737 - BLOCK
      ?AUTO_6738 - BLOCK
    )
    :vars
    (
      ?AUTO_6739 - BLOCK
      ?AUTO_6740 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6738 ) ( not ( = ?AUTO_6737 ?AUTO_6738 ) ) ( ON-TABLE ?AUTO_6737 ) ( CLEAR ?AUTO_6739 ) ( not ( = ?AUTO_6737 ?AUTO_6740 ) ) ( not ( = ?AUTO_6737 ?AUTO_6739 ) ) ( not ( = ?AUTO_6738 ?AUTO_6740 ) ) ( not ( = ?AUTO_6738 ?AUTO_6739 ) ) ( not ( = ?AUTO_6740 ?AUTO_6739 ) ) ( ON ?AUTO_6740 ?AUTO_6737 ) ( CLEAR ?AUTO_6740 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6740 ?AUTO_6737 )
      ( MAKE-ON ?AUTO_6737 ?AUTO_6738 )
      ( MAKE-ON-VERIFY ?AUTO_6737 ?AUTO_6738 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6741 - BLOCK
      ?AUTO_6742 - BLOCK
    )
    :vars
    (
      ?AUTO_6743 - BLOCK
      ?AUTO_6744 - BLOCK
      ?AUTO_6745 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6742 ) ( not ( = ?AUTO_6741 ?AUTO_6742 ) ) ( ON-TABLE ?AUTO_6741 ) ( not ( = ?AUTO_6741 ?AUTO_6743 ) ) ( not ( = ?AUTO_6741 ?AUTO_6744 ) ) ( not ( = ?AUTO_6742 ?AUTO_6743 ) ) ( not ( = ?AUTO_6742 ?AUTO_6744 ) ) ( not ( = ?AUTO_6743 ?AUTO_6744 ) ) ( ON ?AUTO_6743 ?AUTO_6741 ) ( CLEAR ?AUTO_6743 ) ( HOLDING ?AUTO_6744 ) ( CLEAR ?AUTO_6745 ) ( not ( = ?AUTO_6741 ?AUTO_6745 ) ) ( not ( = ?AUTO_6742 ?AUTO_6745 ) ) ( not ( = ?AUTO_6743 ?AUTO_6745 ) ) ( not ( = ?AUTO_6744 ?AUTO_6745 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_6744 ?AUTO_6745 )
      ( MAKE-ON ?AUTO_6741 ?AUTO_6742 )
      ( MAKE-ON-VERIFY ?AUTO_6741 ?AUTO_6742 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6750 - BLOCK
      ?AUTO_6751 - BLOCK
    )
    :vars
    (
      ?AUTO_6754 - BLOCK
      ?AUTO_6753 - BLOCK
      ?AUTO_6752 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6750 ?AUTO_6751 ) ) ( ON-TABLE ?AUTO_6750 ) ( not ( = ?AUTO_6750 ?AUTO_6754 ) ) ( not ( = ?AUTO_6750 ?AUTO_6753 ) ) ( not ( = ?AUTO_6751 ?AUTO_6754 ) ) ( not ( = ?AUTO_6751 ?AUTO_6753 ) ) ( not ( = ?AUTO_6754 ?AUTO_6753 ) ) ( ON ?AUTO_6754 ?AUTO_6750 ) ( CLEAR ?AUTO_6754 ) ( CLEAR ?AUTO_6752 ) ( not ( = ?AUTO_6750 ?AUTO_6752 ) ) ( not ( = ?AUTO_6751 ?AUTO_6752 ) ) ( not ( = ?AUTO_6754 ?AUTO_6752 ) ) ( not ( = ?AUTO_6753 ?AUTO_6752 ) ) ( ON ?AUTO_6753 ?AUTO_6751 ) ( CLEAR ?AUTO_6753 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6753 ?AUTO_6751 )
      ( MAKE-ON ?AUTO_6750 ?AUTO_6751 )
      ( MAKE-ON-VERIFY ?AUTO_6750 ?AUTO_6751 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6755 - BLOCK
      ?AUTO_6756 - BLOCK
    )
    :vars
    (
      ?AUTO_6759 - BLOCK
      ?AUTO_6757 - BLOCK
      ?AUTO_6758 - BLOCK
      ?AUTO_6760 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6755 ?AUTO_6756 ) ) ( ON-TABLE ?AUTO_6755 ) ( not ( = ?AUTO_6755 ?AUTO_6759 ) ) ( not ( = ?AUTO_6755 ?AUTO_6757 ) ) ( not ( = ?AUTO_6756 ?AUTO_6759 ) ) ( not ( = ?AUTO_6756 ?AUTO_6757 ) ) ( not ( = ?AUTO_6759 ?AUTO_6757 ) ) ( ON ?AUTO_6759 ?AUTO_6755 ) ( CLEAR ?AUTO_6759 ) ( CLEAR ?AUTO_6758 ) ( not ( = ?AUTO_6755 ?AUTO_6758 ) ) ( not ( = ?AUTO_6756 ?AUTO_6758 ) ) ( not ( = ?AUTO_6759 ?AUTO_6758 ) ) ( not ( = ?AUTO_6757 ?AUTO_6758 ) ) ( ON ?AUTO_6757 ?AUTO_6756 ) ( CLEAR ?AUTO_6757 ) ( HOLDING ?AUTO_6760 ) ( not ( = ?AUTO_6755 ?AUTO_6760 ) ) ( not ( = ?AUTO_6756 ?AUTO_6760 ) ) ( not ( = ?AUTO_6759 ?AUTO_6760 ) ) ( not ( = ?AUTO_6757 ?AUTO_6760 ) ) ( not ( = ?AUTO_6758 ?AUTO_6760 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6760 )
      ( MAKE-ON ?AUTO_6755 ?AUTO_6756 )
      ( MAKE-ON-VERIFY ?AUTO_6755 ?AUTO_6756 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6761 - BLOCK
      ?AUTO_6762 - BLOCK
    )
    :vars
    (
      ?AUTO_6766 - BLOCK
      ?AUTO_6763 - BLOCK
      ?AUTO_6764 - BLOCK
      ?AUTO_6765 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6761 ?AUTO_6762 ) ) ( ON-TABLE ?AUTO_6761 ) ( not ( = ?AUTO_6761 ?AUTO_6766 ) ) ( not ( = ?AUTO_6761 ?AUTO_6763 ) ) ( not ( = ?AUTO_6762 ?AUTO_6766 ) ) ( not ( = ?AUTO_6762 ?AUTO_6763 ) ) ( not ( = ?AUTO_6766 ?AUTO_6763 ) ) ( ON ?AUTO_6766 ?AUTO_6761 ) ( CLEAR ?AUTO_6766 ) ( CLEAR ?AUTO_6764 ) ( not ( = ?AUTO_6761 ?AUTO_6764 ) ) ( not ( = ?AUTO_6762 ?AUTO_6764 ) ) ( not ( = ?AUTO_6766 ?AUTO_6764 ) ) ( not ( = ?AUTO_6763 ?AUTO_6764 ) ) ( ON ?AUTO_6763 ?AUTO_6762 ) ( not ( = ?AUTO_6761 ?AUTO_6765 ) ) ( not ( = ?AUTO_6762 ?AUTO_6765 ) ) ( not ( = ?AUTO_6766 ?AUTO_6765 ) ) ( not ( = ?AUTO_6763 ?AUTO_6765 ) ) ( not ( = ?AUTO_6764 ?AUTO_6765 ) ) ( ON ?AUTO_6765 ?AUTO_6763 ) ( CLEAR ?AUTO_6765 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6765 ?AUTO_6763 )
      ( MAKE-ON ?AUTO_6761 ?AUTO_6762 )
      ( MAKE-ON-VERIFY ?AUTO_6761 ?AUTO_6762 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6767 - BLOCK
      ?AUTO_6768 - BLOCK
    )
    :vars
    (
      ?AUTO_6771 - BLOCK
      ?AUTO_6772 - BLOCK
      ?AUTO_6770 - BLOCK
      ?AUTO_6769 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6767 ?AUTO_6768 ) ) ( ON-TABLE ?AUTO_6767 ) ( not ( = ?AUTO_6767 ?AUTO_6771 ) ) ( not ( = ?AUTO_6767 ?AUTO_6772 ) ) ( not ( = ?AUTO_6768 ?AUTO_6771 ) ) ( not ( = ?AUTO_6768 ?AUTO_6772 ) ) ( not ( = ?AUTO_6771 ?AUTO_6772 ) ) ( CLEAR ?AUTO_6770 ) ( not ( = ?AUTO_6767 ?AUTO_6770 ) ) ( not ( = ?AUTO_6768 ?AUTO_6770 ) ) ( not ( = ?AUTO_6771 ?AUTO_6770 ) ) ( not ( = ?AUTO_6772 ?AUTO_6770 ) ) ( ON ?AUTO_6772 ?AUTO_6768 ) ( not ( = ?AUTO_6767 ?AUTO_6769 ) ) ( not ( = ?AUTO_6768 ?AUTO_6769 ) ) ( not ( = ?AUTO_6771 ?AUTO_6769 ) ) ( not ( = ?AUTO_6772 ?AUTO_6769 ) ) ( not ( = ?AUTO_6770 ?AUTO_6769 ) ) ( ON ?AUTO_6769 ?AUTO_6772 ) ( CLEAR ?AUTO_6769 ) ( HOLDING ?AUTO_6771 ) ( CLEAR ?AUTO_6767 ) )
    :subtasks
    ( ( !STACK ?AUTO_6771 ?AUTO_6767 )
      ( MAKE-ON ?AUTO_6767 ?AUTO_6768 )
      ( MAKE-ON-VERIFY ?AUTO_6767 ?AUTO_6768 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6773 - BLOCK
      ?AUTO_6774 - BLOCK
    )
    :vars
    (
      ?AUTO_6778 - BLOCK
      ?AUTO_6775 - BLOCK
      ?AUTO_6776 - BLOCK
      ?AUTO_6777 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6773 ?AUTO_6774 ) ) ( ON-TABLE ?AUTO_6773 ) ( not ( = ?AUTO_6773 ?AUTO_6778 ) ) ( not ( = ?AUTO_6773 ?AUTO_6775 ) ) ( not ( = ?AUTO_6774 ?AUTO_6778 ) ) ( not ( = ?AUTO_6774 ?AUTO_6775 ) ) ( not ( = ?AUTO_6778 ?AUTO_6775 ) ) ( CLEAR ?AUTO_6776 ) ( not ( = ?AUTO_6773 ?AUTO_6776 ) ) ( not ( = ?AUTO_6774 ?AUTO_6776 ) ) ( not ( = ?AUTO_6778 ?AUTO_6776 ) ) ( not ( = ?AUTO_6775 ?AUTO_6776 ) ) ( ON ?AUTO_6775 ?AUTO_6774 ) ( not ( = ?AUTO_6773 ?AUTO_6777 ) ) ( not ( = ?AUTO_6774 ?AUTO_6777 ) ) ( not ( = ?AUTO_6778 ?AUTO_6777 ) ) ( not ( = ?AUTO_6775 ?AUTO_6777 ) ) ( not ( = ?AUTO_6776 ?AUTO_6777 ) ) ( ON ?AUTO_6777 ?AUTO_6775 ) ( CLEAR ?AUTO_6773 ) ( ON ?AUTO_6778 ?AUTO_6777 ) ( CLEAR ?AUTO_6778 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6778 ?AUTO_6777 )
      ( MAKE-ON ?AUTO_6773 ?AUTO_6774 )
      ( MAKE-ON-VERIFY ?AUTO_6773 ?AUTO_6774 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6779 - BLOCK
      ?AUTO_6780 - BLOCK
    )
    :vars
    (
      ?AUTO_6783 - BLOCK
      ?AUTO_6784 - BLOCK
      ?AUTO_6781 - BLOCK
      ?AUTO_6782 - BLOCK
      ?AUTO_6785 - BLOCK
      ?AUTO_6786 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6779 ?AUTO_6780 ) ) ( ON-TABLE ?AUTO_6779 ) ( not ( = ?AUTO_6779 ?AUTO_6783 ) ) ( not ( = ?AUTO_6779 ?AUTO_6784 ) ) ( not ( = ?AUTO_6780 ?AUTO_6783 ) ) ( not ( = ?AUTO_6780 ?AUTO_6784 ) ) ( not ( = ?AUTO_6783 ?AUTO_6784 ) ) ( CLEAR ?AUTO_6781 ) ( not ( = ?AUTO_6779 ?AUTO_6781 ) ) ( not ( = ?AUTO_6780 ?AUTO_6781 ) ) ( not ( = ?AUTO_6783 ?AUTO_6781 ) ) ( not ( = ?AUTO_6784 ?AUTO_6781 ) ) ( ON ?AUTO_6784 ?AUTO_6780 ) ( not ( = ?AUTO_6779 ?AUTO_6782 ) ) ( not ( = ?AUTO_6780 ?AUTO_6782 ) ) ( not ( = ?AUTO_6783 ?AUTO_6782 ) ) ( not ( = ?AUTO_6784 ?AUTO_6782 ) ) ( not ( = ?AUTO_6781 ?AUTO_6782 ) ) ( ON ?AUTO_6782 ?AUTO_6784 ) ( CLEAR ?AUTO_6779 ) ( ON ?AUTO_6783 ?AUTO_6782 ) ( CLEAR ?AUTO_6783 ) ( HOLDING ?AUTO_6785 ) ( CLEAR ?AUTO_6786 ) ( not ( = ?AUTO_6779 ?AUTO_6785 ) ) ( not ( = ?AUTO_6779 ?AUTO_6786 ) ) ( not ( = ?AUTO_6780 ?AUTO_6785 ) ) ( not ( = ?AUTO_6780 ?AUTO_6786 ) ) ( not ( = ?AUTO_6783 ?AUTO_6785 ) ) ( not ( = ?AUTO_6783 ?AUTO_6786 ) ) ( not ( = ?AUTO_6784 ?AUTO_6785 ) ) ( not ( = ?AUTO_6784 ?AUTO_6786 ) ) ( not ( = ?AUTO_6781 ?AUTO_6785 ) ) ( not ( = ?AUTO_6781 ?AUTO_6786 ) ) ( not ( = ?AUTO_6782 ?AUTO_6785 ) ) ( not ( = ?AUTO_6782 ?AUTO_6786 ) ) ( not ( = ?AUTO_6785 ?AUTO_6786 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_6785 ?AUTO_6786 )
      ( MAKE-ON ?AUTO_6779 ?AUTO_6780 )
      ( MAKE-ON-VERIFY ?AUTO_6779 ?AUTO_6780 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6795 - BLOCK
      ?AUTO_6796 - BLOCK
    )
    :vars
    (
      ?AUTO_6799 - BLOCK
      ?AUTO_6801 - BLOCK
      ?AUTO_6802 - BLOCK
      ?AUTO_6797 - BLOCK
      ?AUTO_6800 - BLOCK
      ?AUTO_6798 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6795 ?AUTO_6796 ) ) ( ON-TABLE ?AUTO_6795 ) ( not ( = ?AUTO_6795 ?AUTO_6799 ) ) ( not ( = ?AUTO_6795 ?AUTO_6801 ) ) ( not ( = ?AUTO_6796 ?AUTO_6799 ) ) ( not ( = ?AUTO_6796 ?AUTO_6801 ) ) ( not ( = ?AUTO_6799 ?AUTO_6801 ) ) ( CLEAR ?AUTO_6802 ) ( not ( = ?AUTO_6795 ?AUTO_6802 ) ) ( not ( = ?AUTO_6796 ?AUTO_6802 ) ) ( not ( = ?AUTO_6799 ?AUTO_6802 ) ) ( not ( = ?AUTO_6801 ?AUTO_6802 ) ) ( ON ?AUTO_6801 ?AUTO_6796 ) ( not ( = ?AUTO_6795 ?AUTO_6797 ) ) ( not ( = ?AUTO_6796 ?AUTO_6797 ) ) ( not ( = ?AUTO_6799 ?AUTO_6797 ) ) ( not ( = ?AUTO_6801 ?AUTO_6797 ) ) ( not ( = ?AUTO_6802 ?AUTO_6797 ) ) ( ON ?AUTO_6797 ?AUTO_6801 ) ( ON ?AUTO_6799 ?AUTO_6797 ) ( CLEAR ?AUTO_6799 ) ( CLEAR ?AUTO_6800 ) ( not ( = ?AUTO_6795 ?AUTO_6798 ) ) ( not ( = ?AUTO_6795 ?AUTO_6800 ) ) ( not ( = ?AUTO_6796 ?AUTO_6798 ) ) ( not ( = ?AUTO_6796 ?AUTO_6800 ) ) ( not ( = ?AUTO_6799 ?AUTO_6798 ) ) ( not ( = ?AUTO_6799 ?AUTO_6800 ) ) ( not ( = ?AUTO_6801 ?AUTO_6798 ) ) ( not ( = ?AUTO_6801 ?AUTO_6800 ) ) ( not ( = ?AUTO_6802 ?AUTO_6798 ) ) ( not ( = ?AUTO_6802 ?AUTO_6800 ) ) ( not ( = ?AUTO_6797 ?AUTO_6798 ) ) ( not ( = ?AUTO_6797 ?AUTO_6800 ) ) ( not ( = ?AUTO_6798 ?AUTO_6800 ) ) ( ON ?AUTO_6798 ?AUTO_6795 ) ( CLEAR ?AUTO_6798 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6798 ?AUTO_6795 )
      ( MAKE-ON ?AUTO_6795 ?AUTO_6796 )
      ( MAKE-ON-VERIFY ?AUTO_6795 ?AUTO_6796 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6803 - BLOCK
      ?AUTO_6804 - BLOCK
    )
    :vars
    (
      ?AUTO_6805 - BLOCK
      ?AUTO_6809 - BLOCK
      ?AUTO_6806 - BLOCK
      ?AUTO_6808 - BLOCK
      ?AUTO_6810 - BLOCK
      ?AUTO_6807 - BLOCK
      ?AUTO_6811 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6803 ?AUTO_6804 ) ) ( ON-TABLE ?AUTO_6803 ) ( not ( = ?AUTO_6803 ?AUTO_6805 ) ) ( not ( = ?AUTO_6803 ?AUTO_6809 ) ) ( not ( = ?AUTO_6804 ?AUTO_6805 ) ) ( not ( = ?AUTO_6804 ?AUTO_6809 ) ) ( not ( = ?AUTO_6805 ?AUTO_6809 ) ) ( CLEAR ?AUTO_6806 ) ( not ( = ?AUTO_6803 ?AUTO_6806 ) ) ( not ( = ?AUTO_6804 ?AUTO_6806 ) ) ( not ( = ?AUTO_6805 ?AUTO_6806 ) ) ( not ( = ?AUTO_6809 ?AUTO_6806 ) ) ( ON ?AUTO_6809 ?AUTO_6804 ) ( not ( = ?AUTO_6803 ?AUTO_6808 ) ) ( not ( = ?AUTO_6804 ?AUTO_6808 ) ) ( not ( = ?AUTO_6805 ?AUTO_6808 ) ) ( not ( = ?AUTO_6809 ?AUTO_6808 ) ) ( not ( = ?AUTO_6806 ?AUTO_6808 ) ) ( ON ?AUTO_6808 ?AUTO_6809 ) ( ON ?AUTO_6805 ?AUTO_6808 ) ( CLEAR ?AUTO_6805 ) ( CLEAR ?AUTO_6810 ) ( not ( = ?AUTO_6803 ?AUTO_6807 ) ) ( not ( = ?AUTO_6803 ?AUTO_6810 ) ) ( not ( = ?AUTO_6804 ?AUTO_6807 ) ) ( not ( = ?AUTO_6804 ?AUTO_6810 ) ) ( not ( = ?AUTO_6805 ?AUTO_6807 ) ) ( not ( = ?AUTO_6805 ?AUTO_6810 ) ) ( not ( = ?AUTO_6809 ?AUTO_6807 ) ) ( not ( = ?AUTO_6809 ?AUTO_6810 ) ) ( not ( = ?AUTO_6806 ?AUTO_6807 ) ) ( not ( = ?AUTO_6806 ?AUTO_6810 ) ) ( not ( = ?AUTO_6808 ?AUTO_6807 ) ) ( not ( = ?AUTO_6808 ?AUTO_6810 ) ) ( not ( = ?AUTO_6807 ?AUTO_6810 ) ) ( ON ?AUTO_6807 ?AUTO_6803 ) ( CLEAR ?AUTO_6807 ) ( HOLDING ?AUTO_6811 ) ( not ( = ?AUTO_6803 ?AUTO_6811 ) ) ( not ( = ?AUTO_6804 ?AUTO_6811 ) ) ( not ( = ?AUTO_6805 ?AUTO_6811 ) ) ( not ( = ?AUTO_6809 ?AUTO_6811 ) ) ( not ( = ?AUTO_6806 ?AUTO_6811 ) ) ( not ( = ?AUTO_6808 ?AUTO_6811 ) ) ( not ( = ?AUTO_6810 ?AUTO_6811 ) ) ( not ( = ?AUTO_6807 ?AUTO_6811 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6811 )
      ( MAKE-ON ?AUTO_6803 ?AUTO_6804 )
      ( MAKE-ON-VERIFY ?AUTO_6803 ?AUTO_6804 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6812 - BLOCK
      ?AUTO_6813 - BLOCK
    )
    :vars
    (
      ?AUTO_6820 - BLOCK
      ?AUTO_6818 - BLOCK
      ?AUTO_6817 - BLOCK
      ?AUTO_6819 - BLOCK
      ?AUTO_6815 - BLOCK
      ?AUTO_6816 - BLOCK
      ?AUTO_6814 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6812 ?AUTO_6813 ) ) ( ON-TABLE ?AUTO_6812 ) ( not ( = ?AUTO_6812 ?AUTO_6820 ) ) ( not ( = ?AUTO_6812 ?AUTO_6818 ) ) ( not ( = ?AUTO_6813 ?AUTO_6820 ) ) ( not ( = ?AUTO_6813 ?AUTO_6818 ) ) ( not ( = ?AUTO_6820 ?AUTO_6818 ) ) ( CLEAR ?AUTO_6817 ) ( not ( = ?AUTO_6812 ?AUTO_6817 ) ) ( not ( = ?AUTO_6813 ?AUTO_6817 ) ) ( not ( = ?AUTO_6820 ?AUTO_6817 ) ) ( not ( = ?AUTO_6818 ?AUTO_6817 ) ) ( ON ?AUTO_6818 ?AUTO_6813 ) ( not ( = ?AUTO_6812 ?AUTO_6819 ) ) ( not ( = ?AUTO_6813 ?AUTO_6819 ) ) ( not ( = ?AUTO_6820 ?AUTO_6819 ) ) ( not ( = ?AUTO_6818 ?AUTO_6819 ) ) ( not ( = ?AUTO_6817 ?AUTO_6819 ) ) ( ON ?AUTO_6819 ?AUTO_6818 ) ( ON ?AUTO_6820 ?AUTO_6819 ) ( CLEAR ?AUTO_6820 ) ( CLEAR ?AUTO_6815 ) ( not ( = ?AUTO_6812 ?AUTO_6816 ) ) ( not ( = ?AUTO_6812 ?AUTO_6815 ) ) ( not ( = ?AUTO_6813 ?AUTO_6816 ) ) ( not ( = ?AUTO_6813 ?AUTO_6815 ) ) ( not ( = ?AUTO_6820 ?AUTO_6816 ) ) ( not ( = ?AUTO_6820 ?AUTO_6815 ) ) ( not ( = ?AUTO_6818 ?AUTO_6816 ) ) ( not ( = ?AUTO_6818 ?AUTO_6815 ) ) ( not ( = ?AUTO_6817 ?AUTO_6816 ) ) ( not ( = ?AUTO_6817 ?AUTO_6815 ) ) ( not ( = ?AUTO_6819 ?AUTO_6816 ) ) ( not ( = ?AUTO_6819 ?AUTO_6815 ) ) ( not ( = ?AUTO_6816 ?AUTO_6815 ) ) ( ON ?AUTO_6816 ?AUTO_6812 ) ( not ( = ?AUTO_6812 ?AUTO_6814 ) ) ( not ( = ?AUTO_6813 ?AUTO_6814 ) ) ( not ( = ?AUTO_6820 ?AUTO_6814 ) ) ( not ( = ?AUTO_6818 ?AUTO_6814 ) ) ( not ( = ?AUTO_6817 ?AUTO_6814 ) ) ( not ( = ?AUTO_6819 ?AUTO_6814 ) ) ( not ( = ?AUTO_6815 ?AUTO_6814 ) ) ( not ( = ?AUTO_6816 ?AUTO_6814 ) ) ( ON ?AUTO_6814 ?AUTO_6816 ) ( CLEAR ?AUTO_6814 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6814 ?AUTO_6816 )
      ( MAKE-ON ?AUTO_6812 ?AUTO_6813 )
      ( MAKE-ON-VERIFY ?AUTO_6812 ?AUTO_6813 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6821 - BLOCK
      ?AUTO_6822 - BLOCK
    )
    :vars
    (
      ?AUTO_6825 - BLOCK
      ?AUTO_6827 - BLOCK
      ?AUTO_6828 - BLOCK
      ?AUTO_6826 - BLOCK
      ?AUTO_6823 - BLOCK
      ?AUTO_6829 - BLOCK
      ?AUTO_6824 - BLOCK
      ?AUTO_6830 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6821 ?AUTO_6822 ) ) ( ON-TABLE ?AUTO_6821 ) ( not ( = ?AUTO_6821 ?AUTO_6825 ) ) ( not ( = ?AUTO_6821 ?AUTO_6827 ) ) ( not ( = ?AUTO_6822 ?AUTO_6825 ) ) ( not ( = ?AUTO_6822 ?AUTO_6827 ) ) ( not ( = ?AUTO_6825 ?AUTO_6827 ) ) ( CLEAR ?AUTO_6828 ) ( not ( = ?AUTO_6821 ?AUTO_6828 ) ) ( not ( = ?AUTO_6822 ?AUTO_6828 ) ) ( not ( = ?AUTO_6825 ?AUTO_6828 ) ) ( not ( = ?AUTO_6827 ?AUTO_6828 ) ) ( ON ?AUTO_6827 ?AUTO_6822 ) ( not ( = ?AUTO_6821 ?AUTO_6826 ) ) ( not ( = ?AUTO_6822 ?AUTO_6826 ) ) ( not ( = ?AUTO_6825 ?AUTO_6826 ) ) ( not ( = ?AUTO_6827 ?AUTO_6826 ) ) ( not ( = ?AUTO_6828 ?AUTO_6826 ) ) ( ON ?AUTO_6826 ?AUTO_6827 ) ( ON ?AUTO_6825 ?AUTO_6826 ) ( CLEAR ?AUTO_6825 ) ( CLEAR ?AUTO_6823 ) ( not ( = ?AUTO_6821 ?AUTO_6829 ) ) ( not ( = ?AUTO_6821 ?AUTO_6823 ) ) ( not ( = ?AUTO_6822 ?AUTO_6829 ) ) ( not ( = ?AUTO_6822 ?AUTO_6823 ) ) ( not ( = ?AUTO_6825 ?AUTO_6829 ) ) ( not ( = ?AUTO_6825 ?AUTO_6823 ) ) ( not ( = ?AUTO_6827 ?AUTO_6829 ) ) ( not ( = ?AUTO_6827 ?AUTO_6823 ) ) ( not ( = ?AUTO_6828 ?AUTO_6829 ) ) ( not ( = ?AUTO_6828 ?AUTO_6823 ) ) ( not ( = ?AUTO_6826 ?AUTO_6829 ) ) ( not ( = ?AUTO_6826 ?AUTO_6823 ) ) ( not ( = ?AUTO_6829 ?AUTO_6823 ) ) ( ON ?AUTO_6829 ?AUTO_6821 ) ( not ( = ?AUTO_6821 ?AUTO_6824 ) ) ( not ( = ?AUTO_6822 ?AUTO_6824 ) ) ( not ( = ?AUTO_6825 ?AUTO_6824 ) ) ( not ( = ?AUTO_6827 ?AUTO_6824 ) ) ( not ( = ?AUTO_6828 ?AUTO_6824 ) ) ( not ( = ?AUTO_6826 ?AUTO_6824 ) ) ( not ( = ?AUTO_6823 ?AUTO_6824 ) ) ( not ( = ?AUTO_6829 ?AUTO_6824 ) ) ( ON ?AUTO_6824 ?AUTO_6829 ) ( CLEAR ?AUTO_6824 ) ( HOLDING ?AUTO_6830 ) ( not ( = ?AUTO_6821 ?AUTO_6830 ) ) ( not ( = ?AUTO_6822 ?AUTO_6830 ) ) ( not ( = ?AUTO_6825 ?AUTO_6830 ) ) ( not ( = ?AUTO_6827 ?AUTO_6830 ) ) ( not ( = ?AUTO_6828 ?AUTO_6830 ) ) ( not ( = ?AUTO_6826 ?AUTO_6830 ) ) ( not ( = ?AUTO_6823 ?AUTO_6830 ) ) ( not ( = ?AUTO_6829 ?AUTO_6830 ) ) ( not ( = ?AUTO_6824 ?AUTO_6830 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6830 )
      ( MAKE-ON ?AUTO_6821 ?AUTO_6822 )
      ( MAKE-ON-VERIFY ?AUTO_6821 ?AUTO_6822 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6831 - BLOCK
      ?AUTO_6832 - BLOCK
    )
    :vars
    (
      ?AUTO_6835 - BLOCK
      ?AUTO_6839 - BLOCK
      ?AUTO_6836 - BLOCK
      ?AUTO_6834 - BLOCK
      ?AUTO_6838 - BLOCK
      ?AUTO_6833 - BLOCK
      ?AUTO_6837 - BLOCK
      ?AUTO_6840 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6831 ?AUTO_6832 ) ) ( ON-TABLE ?AUTO_6831 ) ( not ( = ?AUTO_6831 ?AUTO_6835 ) ) ( not ( = ?AUTO_6831 ?AUTO_6839 ) ) ( not ( = ?AUTO_6832 ?AUTO_6835 ) ) ( not ( = ?AUTO_6832 ?AUTO_6839 ) ) ( not ( = ?AUTO_6835 ?AUTO_6839 ) ) ( CLEAR ?AUTO_6836 ) ( not ( = ?AUTO_6831 ?AUTO_6836 ) ) ( not ( = ?AUTO_6832 ?AUTO_6836 ) ) ( not ( = ?AUTO_6835 ?AUTO_6836 ) ) ( not ( = ?AUTO_6839 ?AUTO_6836 ) ) ( ON ?AUTO_6839 ?AUTO_6832 ) ( not ( = ?AUTO_6831 ?AUTO_6834 ) ) ( not ( = ?AUTO_6832 ?AUTO_6834 ) ) ( not ( = ?AUTO_6835 ?AUTO_6834 ) ) ( not ( = ?AUTO_6839 ?AUTO_6834 ) ) ( not ( = ?AUTO_6836 ?AUTO_6834 ) ) ( ON ?AUTO_6834 ?AUTO_6839 ) ( ON ?AUTO_6835 ?AUTO_6834 ) ( CLEAR ?AUTO_6835 ) ( CLEAR ?AUTO_6838 ) ( not ( = ?AUTO_6831 ?AUTO_6833 ) ) ( not ( = ?AUTO_6831 ?AUTO_6838 ) ) ( not ( = ?AUTO_6832 ?AUTO_6833 ) ) ( not ( = ?AUTO_6832 ?AUTO_6838 ) ) ( not ( = ?AUTO_6835 ?AUTO_6833 ) ) ( not ( = ?AUTO_6835 ?AUTO_6838 ) ) ( not ( = ?AUTO_6839 ?AUTO_6833 ) ) ( not ( = ?AUTO_6839 ?AUTO_6838 ) ) ( not ( = ?AUTO_6836 ?AUTO_6833 ) ) ( not ( = ?AUTO_6836 ?AUTO_6838 ) ) ( not ( = ?AUTO_6834 ?AUTO_6833 ) ) ( not ( = ?AUTO_6834 ?AUTO_6838 ) ) ( not ( = ?AUTO_6833 ?AUTO_6838 ) ) ( ON ?AUTO_6833 ?AUTO_6831 ) ( not ( = ?AUTO_6831 ?AUTO_6837 ) ) ( not ( = ?AUTO_6832 ?AUTO_6837 ) ) ( not ( = ?AUTO_6835 ?AUTO_6837 ) ) ( not ( = ?AUTO_6839 ?AUTO_6837 ) ) ( not ( = ?AUTO_6836 ?AUTO_6837 ) ) ( not ( = ?AUTO_6834 ?AUTO_6837 ) ) ( not ( = ?AUTO_6838 ?AUTO_6837 ) ) ( not ( = ?AUTO_6833 ?AUTO_6837 ) ) ( ON ?AUTO_6837 ?AUTO_6833 ) ( not ( = ?AUTO_6831 ?AUTO_6840 ) ) ( not ( = ?AUTO_6832 ?AUTO_6840 ) ) ( not ( = ?AUTO_6835 ?AUTO_6840 ) ) ( not ( = ?AUTO_6839 ?AUTO_6840 ) ) ( not ( = ?AUTO_6836 ?AUTO_6840 ) ) ( not ( = ?AUTO_6834 ?AUTO_6840 ) ) ( not ( = ?AUTO_6838 ?AUTO_6840 ) ) ( not ( = ?AUTO_6833 ?AUTO_6840 ) ) ( not ( = ?AUTO_6837 ?AUTO_6840 ) ) ( ON ?AUTO_6840 ?AUTO_6837 ) ( CLEAR ?AUTO_6840 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6840 ?AUTO_6837 )
      ( MAKE-ON ?AUTO_6831 ?AUTO_6832 )
      ( MAKE-ON-VERIFY ?AUTO_6831 ?AUTO_6832 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6841 - BLOCK
      ?AUTO_6842 - BLOCK
    )
    :vars
    (
      ?AUTO_6850 - BLOCK
      ?AUTO_6846 - BLOCK
      ?AUTO_6849 - BLOCK
      ?AUTO_6844 - BLOCK
      ?AUTO_6847 - BLOCK
      ?AUTO_6843 - BLOCK
      ?AUTO_6848 - BLOCK
      ?AUTO_6845 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6841 ?AUTO_6842 ) ) ( ON-TABLE ?AUTO_6841 ) ( not ( = ?AUTO_6841 ?AUTO_6850 ) ) ( not ( = ?AUTO_6841 ?AUTO_6846 ) ) ( not ( = ?AUTO_6842 ?AUTO_6850 ) ) ( not ( = ?AUTO_6842 ?AUTO_6846 ) ) ( not ( = ?AUTO_6850 ?AUTO_6846 ) ) ( not ( = ?AUTO_6841 ?AUTO_6849 ) ) ( not ( = ?AUTO_6842 ?AUTO_6849 ) ) ( not ( = ?AUTO_6850 ?AUTO_6849 ) ) ( not ( = ?AUTO_6846 ?AUTO_6849 ) ) ( ON ?AUTO_6846 ?AUTO_6842 ) ( not ( = ?AUTO_6841 ?AUTO_6844 ) ) ( not ( = ?AUTO_6842 ?AUTO_6844 ) ) ( not ( = ?AUTO_6850 ?AUTO_6844 ) ) ( not ( = ?AUTO_6846 ?AUTO_6844 ) ) ( not ( = ?AUTO_6849 ?AUTO_6844 ) ) ( ON ?AUTO_6844 ?AUTO_6846 ) ( ON ?AUTO_6850 ?AUTO_6844 ) ( CLEAR ?AUTO_6850 ) ( CLEAR ?AUTO_6847 ) ( not ( = ?AUTO_6841 ?AUTO_6843 ) ) ( not ( = ?AUTO_6841 ?AUTO_6847 ) ) ( not ( = ?AUTO_6842 ?AUTO_6843 ) ) ( not ( = ?AUTO_6842 ?AUTO_6847 ) ) ( not ( = ?AUTO_6850 ?AUTO_6843 ) ) ( not ( = ?AUTO_6850 ?AUTO_6847 ) ) ( not ( = ?AUTO_6846 ?AUTO_6843 ) ) ( not ( = ?AUTO_6846 ?AUTO_6847 ) ) ( not ( = ?AUTO_6849 ?AUTO_6843 ) ) ( not ( = ?AUTO_6849 ?AUTO_6847 ) ) ( not ( = ?AUTO_6844 ?AUTO_6843 ) ) ( not ( = ?AUTO_6844 ?AUTO_6847 ) ) ( not ( = ?AUTO_6843 ?AUTO_6847 ) ) ( ON ?AUTO_6843 ?AUTO_6841 ) ( not ( = ?AUTO_6841 ?AUTO_6848 ) ) ( not ( = ?AUTO_6842 ?AUTO_6848 ) ) ( not ( = ?AUTO_6850 ?AUTO_6848 ) ) ( not ( = ?AUTO_6846 ?AUTO_6848 ) ) ( not ( = ?AUTO_6849 ?AUTO_6848 ) ) ( not ( = ?AUTO_6844 ?AUTO_6848 ) ) ( not ( = ?AUTO_6847 ?AUTO_6848 ) ) ( not ( = ?AUTO_6843 ?AUTO_6848 ) ) ( ON ?AUTO_6848 ?AUTO_6843 ) ( not ( = ?AUTO_6841 ?AUTO_6845 ) ) ( not ( = ?AUTO_6842 ?AUTO_6845 ) ) ( not ( = ?AUTO_6850 ?AUTO_6845 ) ) ( not ( = ?AUTO_6846 ?AUTO_6845 ) ) ( not ( = ?AUTO_6849 ?AUTO_6845 ) ) ( not ( = ?AUTO_6844 ?AUTO_6845 ) ) ( not ( = ?AUTO_6847 ?AUTO_6845 ) ) ( not ( = ?AUTO_6843 ?AUTO_6845 ) ) ( not ( = ?AUTO_6848 ?AUTO_6845 ) ) ( ON ?AUTO_6845 ?AUTO_6848 ) ( CLEAR ?AUTO_6845 ) ( HOLDING ?AUTO_6849 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6849 )
      ( MAKE-ON ?AUTO_6841 ?AUTO_6842 )
      ( MAKE-ON-VERIFY ?AUTO_6841 ?AUTO_6842 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6851 - BLOCK
      ?AUTO_6852 - BLOCK
    )
    :vars
    (
      ?AUTO_6857 - BLOCK
      ?AUTO_6855 - BLOCK
      ?AUTO_6858 - BLOCK
      ?AUTO_6856 - BLOCK
      ?AUTO_6854 - BLOCK
      ?AUTO_6853 - BLOCK
      ?AUTO_6859 - BLOCK
      ?AUTO_6860 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6851 ?AUTO_6852 ) ) ( ON-TABLE ?AUTO_6851 ) ( not ( = ?AUTO_6851 ?AUTO_6857 ) ) ( not ( = ?AUTO_6851 ?AUTO_6855 ) ) ( not ( = ?AUTO_6852 ?AUTO_6857 ) ) ( not ( = ?AUTO_6852 ?AUTO_6855 ) ) ( not ( = ?AUTO_6857 ?AUTO_6855 ) ) ( not ( = ?AUTO_6851 ?AUTO_6858 ) ) ( not ( = ?AUTO_6852 ?AUTO_6858 ) ) ( not ( = ?AUTO_6857 ?AUTO_6858 ) ) ( not ( = ?AUTO_6855 ?AUTO_6858 ) ) ( ON ?AUTO_6855 ?AUTO_6852 ) ( not ( = ?AUTO_6851 ?AUTO_6856 ) ) ( not ( = ?AUTO_6852 ?AUTO_6856 ) ) ( not ( = ?AUTO_6857 ?AUTO_6856 ) ) ( not ( = ?AUTO_6855 ?AUTO_6856 ) ) ( not ( = ?AUTO_6858 ?AUTO_6856 ) ) ( ON ?AUTO_6856 ?AUTO_6855 ) ( ON ?AUTO_6857 ?AUTO_6856 ) ( CLEAR ?AUTO_6857 ) ( CLEAR ?AUTO_6854 ) ( not ( = ?AUTO_6851 ?AUTO_6853 ) ) ( not ( = ?AUTO_6851 ?AUTO_6854 ) ) ( not ( = ?AUTO_6852 ?AUTO_6853 ) ) ( not ( = ?AUTO_6852 ?AUTO_6854 ) ) ( not ( = ?AUTO_6857 ?AUTO_6853 ) ) ( not ( = ?AUTO_6857 ?AUTO_6854 ) ) ( not ( = ?AUTO_6855 ?AUTO_6853 ) ) ( not ( = ?AUTO_6855 ?AUTO_6854 ) ) ( not ( = ?AUTO_6858 ?AUTO_6853 ) ) ( not ( = ?AUTO_6858 ?AUTO_6854 ) ) ( not ( = ?AUTO_6856 ?AUTO_6853 ) ) ( not ( = ?AUTO_6856 ?AUTO_6854 ) ) ( not ( = ?AUTO_6853 ?AUTO_6854 ) ) ( ON ?AUTO_6853 ?AUTO_6851 ) ( not ( = ?AUTO_6851 ?AUTO_6859 ) ) ( not ( = ?AUTO_6852 ?AUTO_6859 ) ) ( not ( = ?AUTO_6857 ?AUTO_6859 ) ) ( not ( = ?AUTO_6855 ?AUTO_6859 ) ) ( not ( = ?AUTO_6858 ?AUTO_6859 ) ) ( not ( = ?AUTO_6856 ?AUTO_6859 ) ) ( not ( = ?AUTO_6854 ?AUTO_6859 ) ) ( not ( = ?AUTO_6853 ?AUTO_6859 ) ) ( ON ?AUTO_6859 ?AUTO_6853 ) ( not ( = ?AUTO_6851 ?AUTO_6860 ) ) ( not ( = ?AUTO_6852 ?AUTO_6860 ) ) ( not ( = ?AUTO_6857 ?AUTO_6860 ) ) ( not ( = ?AUTO_6855 ?AUTO_6860 ) ) ( not ( = ?AUTO_6858 ?AUTO_6860 ) ) ( not ( = ?AUTO_6856 ?AUTO_6860 ) ) ( not ( = ?AUTO_6854 ?AUTO_6860 ) ) ( not ( = ?AUTO_6853 ?AUTO_6860 ) ) ( not ( = ?AUTO_6859 ?AUTO_6860 ) ) ( ON ?AUTO_6860 ?AUTO_6859 ) ( ON ?AUTO_6858 ?AUTO_6860 ) ( CLEAR ?AUTO_6858 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6858 ?AUTO_6860 )
      ( MAKE-ON ?AUTO_6851 ?AUTO_6852 )
      ( MAKE-ON-VERIFY ?AUTO_6851 ?AUTO_6852 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6862 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6862 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6862 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6862 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6863 - BLOCK
    )
    :vars
    (
      ?AUTO_6864 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6863 ?AUTO_6864 ) ( CLEAR ?AUTO_6863 ) ( HAND-EMPTY ) ( not ( = ?AUTO_6863 ?AUTO_6864 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6863 ?AUTO_6864 )
      ( MAKE-ON-TABLE ?AUTO_6863 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6863 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6867 - BLOCK
      ?AUTO_6868 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6867 ) ( CLEAR ?AUTO_6868 ) ( not ( = ?AUTO_6867 ?AUTO_6868 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_6867 ?AUTO_6868 )
      ( MAKE-ON-VERIFY ?AUTO_6867 ?AUTO_6868 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6869 - BLOCK
      ?AUTO_6870 - BLOCK
    )
    :vars
    (
      ?AUTO_6871 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6870 ) ( not ( = ?AUTO_6869 ?AUTO_6870 ) ) ( ON ?AUTO_6869 ?AUTO_6871 ) ( CLEAR ?AUTO_6869 ) ( HAND-EMPTY ) ( not ( = ?AUTO_6869 ?AUTO_6871 ) ) ( not ( = ?AUTO_6870 ?AUTO_6871 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6869 ?AUTO_6871 )
      ( MAKE-ON ?AUTO_6869 ?AUTO_6870 )
      ( MAKE-ON-VERIFY ?AUTO_6869 ?AUTO_6870 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6872 - BLOCK
      ?AUTO_6873 - BLOCK
    )
    :vars
    (
      ?AUTO_6874 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6872 ?AUTO_6873 ) ) ( ON ?AUTO_6872 ?AUTO_6874 ) ( CLEAR ?AUTO_6872 ) ( not ( = ?AUTO_6872 ?AUTO_6874 ) ) ( not ( = ?AUTO_6873 ?AUTO_6874 ) ) ( HOLDING ?AUTO_6873 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6873 )
      ( MAKE-ON ?AUTO_6872 ?AUTO_6873 )
      ( MAKE-ON-VERIFY ?AUTO_6872 ?AUTO_6873 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6875 - BLOCK
      ?AUTO_6876 - BLOCK
    )
    :vars
    (
      ?AUTO_6877 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6875 ?AUTO_6876 ) ) ( ON ?AUTO_6875 ?AUTO_6877 ) ( not ( = ?AUTO_6875 ?AUTO_6877 ) ) ( not ( = ?AUTO_6876 ?AUTO_6877 ) ) ( ON ?AUTO_6876 ?AUTO_6875 ) ( CLEAR ?AUTO_6876 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6876 ?AUTO_6875 )
      ( MAKE-ON ?AUTO_6875 ?AUTO_6876 )
      ( MAKE-ON-VERIFY ?AUTO_6875 ?AUTO_6876 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6879 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6879 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6879 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6879 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6880 - BLOCK
    )
    :vars
    (
      ?AUTO_6881 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6880 ?AUTO_6881 ) ( CLEAR ?AUTO_6880 ) ( HAND-EMPTY ) ( not ( = ?AUTO_6880 ?AUTO_6881 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6880 ?AUTO_6881 )
      ( MAKE-ON-TABLE ?AUTO_6880 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6880 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6882 - BLOCK
    )
    :vars
    (
      ?AUTO_6883 - BLOCK
      ?AUTO_6884 - BLOCK
      ?AUTO_6885 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6882 ?AUTO_6883 ) ( CLEAR ?AUTO_6882 ) ( not ( = ?AUTO_6882 ?AUTO_6883 ) ) ( HOLDING ?AUTO_6884 ) ( CLEAR ?AUTO_6885 ) ( not ( = ?AUTO_6882 ?AUTO_6884 ) ) ( not ( = ?AUTO_6882 ?AUTO_6885 ) ) ( not ( = ?AUTO_6883 ?AUTO_6884 ) ) ( not ( = ?AUTO_6883 ?AUTO_6885 ) ) ( not ( = ?AUTO_6884 ?AUTO_6885 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_6884 ?AUTO_6885 )
      ( MAKE-ON-TABLE ?AUTO_6882 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6882 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6886 - BLOCK
    )
    :vars
    (
      ?AUTO_6887 - BLOCK
      ?AUTO_6889 - BLOCK
      ?AUTO_6888 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6886 ?AUTO_6887 ) ( not ( = ?AUTO_6886 ?AUTO_6887 ) ) ( CLEAR ?AUTO_6889 ) ( not ( = ?AUTO_6886 ?AUTO_6888 ) ) ( not ( = ?AUTO_6886 ?AUTO_6889 ) ) ( not ( = ?AUTO_6887 ?AUTO_6888 ) ) ( not ( = ?AUTO_6887 ?AUTO_6889 ) ) ( not ( = ?AUTO_6888 ?AUTO_6889 ) ) ( ON ?AUTO_6888 ?AUTO_6886 ) ( CLEAR ?AUTO_6888 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6888 ?AUTO_6886 )
      ( MAKE-ON-TABLE ?AUTO_6886 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6886 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6890 - BLOCK
    )
    :vars
    (
      ?AUTO_6891 - BLOCK
      ?AUTO_6892 - BLOCK
      ?AUTO_6893 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6890 ?AUTO_6891 ) ( not ( = ?AUTO_6890 ?AUTO_6891 ) ) ( not ( = ?AUTO_6890 ?AUTO_6892 ) ) ( not ( = ?AUTO_6890 ?AUTO_6893 ) ) ( not ( = ?AUTO_6891 ?AUTO_6892 ) ) ( not ( = ?AUTO_6891 ?AUTO_6893 ) ) ( not ( = ?AUTO_6892 ?AUTO_6893 ) ) ( ON ?AUTO_6892 ?AUTO_6890 ) ( CLEAR ?AUTO_6892 ) ( HOLDING ?AUTO_6893 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6893 )
      ( MAKE-ON-TABLE ?AUTO_6890 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6890 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6894 - BLOCK
    )
    :vars
    (
      ?AUTO_6895 - BLOCK
      ?AUTO_6896 - BLOCK
      ?AUTO_6897 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6894 ?AUTO_6895 ) ( not ( = ?AUTO_6894 ?AUTO_6895 ) ) ( not ( = ?AUTO_6894 ?AUTO_6896 ) ) ( not ( = ?AUTO_6894 ?AUTO_6897 ) ) ( not ( = ?AUTO_6895 ?AUTO_6896 ) ) ( not ( = ?AUTO_6895 ?AUTO_6897 ) ) ( not ( = ?AUTO_6896 ?AUTO_6897 ) ) ( ON ?AUTO_6896 ?AUTO_6894 ) ( ON ?AUTO_6897 ?AUTO_6896 ) ( CLEAR ?AUTO_6897 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6897 ?AUTO_6896 )
      ( MAKE-ON-TABLE ?AUTO_6894 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6894 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6899 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6899 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6899 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6899 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6900 - BLOCK
    )
    :vars
    (
      ?AUTO_6901 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6900 ?AUTO_6901 ) ( CLEAR ?AUTO_6900 ) ( HAND-EMPTY ) ( not ( = ?AUTO_6900 ?AUTO_6901 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6900 ?AUTO_6901 )
      ( MAKE-ON-TABLE ?AUTO_6900 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6900 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6902 - BLOCK
    )
    :vars
    (
      ?AUTO_6903 - BLOCK
      ?AUTO_6904 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6902 ?AUTO_6903 ) ( CLEAR ?AUTO_6902 ) ( not ( = ?AUTO_6902 ?AUTO_6903 ) ) ( HOLDING ?AUTO_6904 ) ( not ( = ?AUTO_6902 ?AUTO_6904 ) ) ( not ( = ?AUTO_6903 ?AUTO_6904 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6904 )
      ( MAKE-ON-TABLE ?AUTO_6902 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6902 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6905 - BLOCK
    )
    :vars
    (
      ?AUTO_6907 - BLOCK
      ?AUTO_6906 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6905 ?AUTO_6907 ) ( not ( = ?AUTO_6905 ?AUTO_6907 ) ) ( not ( = ?AUTO_6905 ?AUTO_6906 ) ) ( not ( = ?AUTO_6907 ?AUTO_6906 ) ) ( ON ?AUTO_6906 ?AUTO_6905 ) ( CLEAR ?AUTO_6906 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6906 ?AUTO_6905 )
      ( MAKE-ON-TABLE ?AUTO_6905 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6905 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6908 - BLOCK
    )
    :vars
    (
      ?AUTO_6910 - BLOCK
      ?AUTO_6909 - BLOCK
      ?AUTO_6911 - BLOCK
      ?AUTO_6912 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6908 ?AUTO_6910 ) ( not ( = ?AUTO_6908 ?AUTO_6910 ) ) ( not ( = ?AUTO_6908 ?AUTO_6909 ) ) ( not ( = ?AUTO_6910 ?AUTO_6909 ) ) ( ON ?AUTO_6909 ?AUTO_6908 ) ( CLEAR ?AUTO_6909 ) ( HOLDING ?AUTO_6911 ) ( CLEAR ?AUTO_6912 ) ( not ( = ?AUTO_6908 ?AUTO_6911 ) ) ( not ( = ?AUTO_6908 ?AUTO_6912 ) ) ( not ( = ?AUTO_6910 ?AUTO_6911 ) ) ( not ( = ?AUTO_6910 ?AUTO_6912 ) ) ( not ( = ?AUTO_6909 ?AUTO_6911 ) ) ( not ( = ?AUTO_6909 ?AUTO_6912 ) ) ( not ( = ?AUTO_6911 ?AUTO_6912 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_6911 ?AUTO_6912 )
      ( MAKE-ON-TABLE ?AUTO_6908 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6908 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6913 - BLOCK
    )
    :vars
    (
      ?AUTO_6915 - BLOCK
      ?AUTO_6914 - BLOCK
      ?AUTO_6916 - BLOCK
      ?AUTO_6917 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6913 ?AUTO_6915 ) ( not ( = ?AUTO_6913 ?AUTO_6915 ) ) ( not ( = ?AUTO_6913 ?AUTO_6914 ) ) ( not ( = ?AUTO_6915 ?AUTO_6914 ) ) ( ON ?AUTO_6914 ?AUTO_6913 ) ( CLEAR ?AUTO_6916 ) ( not ( = ?AUTO_6913 ?AUTO_6917 ) ) ( not ( = ?AUTO_6913 ?AUTO_6916 ) ) ( not ( = ?AUTO_6915 ?AUTO_6917 ) ) ( not ( = ?AUTO_6915 ?AUTO_6916 ) ) ( not ( = ?AUTO_6914 ?AUTO_6917 ) ) ( not ( = ?AUTO_6914 ?AUTO_6916 ) ) ( not ( = ?AUTO_6917 ?AUTO_6916 ) ) ( ON ?AUTO_6917 ?AUTO_6914 ) ( CLEAR ?AUTO_6917 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6917 ?AUTO_6914 )
      ( MAKE-ON-TABLE ?AUTO_6913 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6913 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6918 - BLOCK
    )
    :vars
    (
      ?AUTO_6919 - BLOCK
      ?AUTO_6922 - BLOCK
      ?AUTO_6921 - BLOCK
      ?AUTO_6920 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6918 ?AUTO_6919 ) ( not ( = ?AUTO_6918 ?AUTO_6919 ) ) ( not ( = ?AUTO_6918 ?AUTO_6922 ) ) ( not ( = ?AUTO_6919 ?AUTO_6922 ) ) ( ON ?AUTO_6922 ?AUTO_6918 ) ( not ( = ?AUTO_6918 ?AUTO_6921 ) ) ( not ( = ?AUTO_6918 ?AUTO_6920 ) ) ( not ( = ?AUTO_6919 ?AUTO_6921 ) ) ( not ( = ?AUTO_6919 ?AUTO_6920 ) ) ( not ( = ?AUTO_6922 ?AUTO_6921 ) ) ( not ( = ?AUTO_6922 ?AUTO_6920 ) ) ( not ( = ?AUTO_6921 ?AUTO_6920 ) ) ( ON ?AUTO_6921 ?AUTO_6922 ) ( CLEAR ?AUTO_6921 ) ( HOLDING ?AUTO_6920 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6920 )
      ( MAKE-ON-TABLE ?AUTO_6918 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6918 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6923 - BLOCK
    )
    :vars
    (
      ?AUTO_6926 - BLOCK
      ?AUTO_6927 - BLOCK
      ?AUTO_6924 - BLOCK
      ?AUTO_6925 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6923 ?AUTO_6926 ) ( not ( = ?AUTO_6923 ?AUTO_6926 ) ) ( not ( = ?AUTO_6923 ?AUTO_6927 ) ) ( not ( = ?AUTO_6926 ?AUTO_6927 ) ) ( ON ?AUTO_6927 ?AUTO_6923 ) ( not ( = ?AUTO_6923 ?AUTO_6924 ) ) ( not ( = ?AUTO_6923 ?AUTO_6925 ) ) ( not ( = ?AUTO_6926 ?AUTO_6924 ) ) ( not ( = ?AUTO_6926 ?AUTO_6925 ) ) ( not ( = ?AUTO_6927 ?AUTO_6924 ) ) ( not ( = ?AUTO_6927 ?AUTO_6925 ) ) ( not ( = ?AUTO_6924 ?AUTO_6925 ) ) ( ON ?AUTO_6924 ?AUTO_6927 ) ( ON ?AUTO_6925 ?AUTO_6924 ) ( CLEAR ?AUTO_6925 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6925 ?AUTO_6924 )
      ( MAKE-ON-TABLE ?AUTO_6923 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6923 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6930 - BLOCK
      ?AUTO_6931 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6930 ) ( CLEAR ?AUTO_6931 ) ( not ( = ?AUTO_6930 ?AUTO_6931 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_6930 ?AUTO_6931 )
      ( MAKE-ON-VERIFY ?AUTO_6930 ?AUTO_6931 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6932 - BLOCK
      ?AUTO_6933 - BLOCK
    )
    :vars
    (
      ?AUTO_6934 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6933 ) ( not ( = ?AUTO_6932 ?AUTO_6933 ) ) ( ON ?AUTO_6932 ?AUTO_6934 ) ( CLEAR ?AUTO_6932 ) ( HAND-EMPTY ) ( not ( = ?AUTO_6932 ?AUTO_6934 ) ) ( not ( = ?AUTO_6933 ?AUTO_6934 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6932 ?AUTO_6934 )
      ( MAKE-ON ?AUTO_6932 ?AUTO_6933 )
      ( MAKE-ON-VERIFY ?AUTO_6932 ?AUTO_6933 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6935 - BLOCK
      ?AUTO_6936 - BLOCK
    )
    :vars
    (
      ?AUTO_6937 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6935 ?AUTO_6936 ) ) ( ON ?AUTO_6935 ?AUTO_6937 ) ( CLEAR ?AUTO_6935 ) ( not ( = ?AUTO_6935 ?AUTO_6937 ) ) ( not ( = ?AUTO_6936 ?AUTO_6937 ) ) ( HOLDING ?AUTO_6936 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6936 )
      ( MAKE-ON ?AUTO_6935 ?AUTO_6936 )
      ( MAKE-ON-VERIFY ?AUTO_6935 ?AUTO_6936 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6940 - BLOCK
      ?AUTO_6941 - BLOCK
    )
    :vars
    (
      ?AUTO_6942 - BLOCK
      ?AUTO_6943 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6941 ) ( not ( = ?AUTO_6940 ?AUTO_6941 ) ) ( ON ?AUTO_6940 ?AUTO_6942 ) ( CLEAR ?AUTO_6940 ) ( not ( = ?AUTO_6940 ?AUTO_6942 ) ) ( not ( = ?AUTO_6941 ?AUTO_6942 ) ) ( HOLDING ?AUTO_6943 ) ( not ( = ?AUTO_6940 ?AUTO_6943 ) ) ( not ( = ?AUTO_6941 ?AUTO_6943 ) ) ( not ( = ?AUTO_6942 ?AUTO_6943 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6943 )
      ( MAKE-ON ?AUTO_6940 ?AUTO_6941 )
      ( MAKE-ON-VERIFY ?AUTO_6940 ?AUTO_6941 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6944 - BLOCK
      ?AUTO_6945 - BLOCK
    )
    :vars
    (
      ?AUTO_6946 - BLOCK
      ?AUTO_6947 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6944 ?AUTO_6945 ) ) ( ON ?AUTO_6944 ?AUTO_6946 ) ( CLEAR ?AUTO_6944 ) ( not ( = ?AUTO_6944 ?AUTO_6946 ) ) ( not ( = ?AUTO_6945 ?AUTO_6946 ) ) ( not ( = ?AUTO_6944 ?AUTO_6947 ) ) ( not ( = ?AUTO_6945 ?AUTO_6947 ) ) ( not ( = ?AUTO_6946 ?AUTO_6947 ) ) ( ON ?AUTO_6947 ?AUTO_6945 ) ( CLEAR ?AUTO_6947 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6947 ?AUTO_6945 )
      ( MAKE-ON ?AUTO_6944 ?AUTO_6945 )
      ( MAKE-ON-VERIFY ?AUTO_6944 ?AUTO_6945 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6948 - BLOCK
      ?AUTO_6949 - BLOCK
    )
    :vars
    (
      ?AUTO_6951 - BLOCK
      ?AUTO_6950 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6948 ?AUTO_6949 ) ) ( not ( = ?AUTO_6948 ?AUTO_6951 ) ) ( not ( = ?AUTO_6949 ?AUTO_6951 ) ) ( not ( = ?AUTO_6948 ?AUTO_6950 ) ) ( not ( = ?AUTO_6949 ?AUTO_6950 ) ) ( not ( = ?AUTO_6951 ?AUTO_6950 ) ) ( ON ?AUTO_6950 ?AUTO_6949 ) ( CLEAR ?AUTO_6950 ) ( HOLDING ?AUTO_6948 ) ( CLEAR ?AUTO_6951 ) )
    :subtasks
    ( ( !STACK ?AUTO_6948 ?AUTO_6951 )
      ( MAKE-ON ?AUTO_6948 ?AUTO_6949 )
      ( MAKE-ON-VERIFY ?AUTO_6948 ?AUTO_6949 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6952 - BLOCK
      ?AUTO_6953 - BLOCK
    )
    :vars
    (
      ?AUTO_6955 - BLOCK
      ?AUTO_6954 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6952 ?AUTO_6953 ) ) ( not ( = ?AUTO_6952 ?AUTO_6955 ) ) ( not ( = ?AUTO_6953 ?AUTO_6955 ) ) ( not ( = ?AUTO_6952 ?AUTO_6954 ) ) ( not ( = ?AUTO_6953 ?AUTO_6954 ) ) ( not ( = ?AUTO_6955 ?AUTO_6954 ) ) ( ON ?AUTO_6954 ?AUTO_6953 ) ( CLEAR ?AUTO_6955 ) ( ON ?AUTO_6952 ?AUTO_6954 ) ( CLEAR ?AUTO_6952 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6952 ?AUTO_6954 )
      ( MAKE-ON ?AUTO_6952 ?AUTO_6953 )
      ( MAKE-ON-VERIFY ?AUTO_6952 ?AUTO_6953 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6956 - BLOCK
      ?AUTO_6957 - BLOCK
    )
    :vars
    (
      ?AUTO_6959 - BLOCK
      ?AUTO_6958 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6956 ?AUTO_6957 ) ) ( not ( = ?AUTO_6956 ?AUTO_6959 ) ) ( not ( = ?AUTO_6957 ?AUTO_6959 ) ) ( not ( = ?AUTO_6956 ?AUTO_6958 ) ) ( not ( = ?AUTO_6957 ?AUTO_6958 ) ) ( not ( = ?AUTO_6959 ?AUTO_6958 ) ) ( ON ?AUTO_6958 ?AUTO_6957 ) ( ON ?AUTO_6956 ?AUTO_6958 ) ( CLEAR ?AUTO_6956 ) ( HOLDING ?AUTO_6959 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6959 )
      ( MAKE-ON ?AUTO_6956 ?AUTO_6957 )
      ( MAKE-ON-VERIFY ?AUTO_6956 ?AUTO_6957 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6960 - BLOCK
      ?AUTO_6961 - BLOCK
    )
    :vars
    (
      ?AUTO_6962 - BLOCK
      ?AUTO_6963 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6960 ?AUTO_6961 ) ) ( not ( = ?AUTO_6960 ?AUTO_6962 ) ) ( not ( = ?AUTO_6961 ?AUTO_6962 ) ) ( not ( = ?AUTO_6960 ?AUTO_6963 ) ) ( not ( = ?AUTO_6961 ?AUTO_6963 ) ) ( not ( = ?AUTO_6962 ?AUTO_6963 ) ) ( ON ?AUTO_6963 ?AUTO_6961 ) ( ON ?AUTO_6960 ?AUTO_6963 ) ( ON ?AUTO_6962 ?AUTO_6960 ) ( CLEAR ?AUTO_6962 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6962 ?AUTO_6960 )
      ( MAKE-ON ?AUTO_6960 ?AUTO_6961 )
      ( MAKE-ON-VERIFY ?AUTO_6960 ?AUTO_6961 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6966 - BLOCK
      ?AUTO_6967 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6966 ) ( CLEAR ?AUTO_6967 ) ( not ( = ?AUTO_6966 ?AUTO_6967 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_6966 ?AUTO_6967 )
      ( MAKE-ON-VERIFY ?AUTO_6966 ?AUTO_6967 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6968 - BLOCK
      ?AUTO_6969 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6969 ) ( not ( = ?AUTO_6968 ?AUTO_6969 ) ) ( ON-TABLE ?AUTO_6968 ) ( CLEAR ?AUTO_6968 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_6968 )
      ( MAKE-ON ?AUTO_6968 ?AUTO_6969 )
      ( MAKE-ON-VERIFY ?AUTO_6968 ?AUTO_6969 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6970 - BLOCK
      ?AUTO_6971 - BLOCK
    )
    :vars
    (
      ?AUTO_6972 - BLOCK
      ?AUTO_6973 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6971 ) ( not ( = ?AUTO_6970 ?AUTO_6971 ) ) ( ON-TABLE ?AUTO_6970 ) ( CLEAR ?AUTO_6970 ) ( HOLDING ?AUTO_6972 ) ( CLEAR ?AUTO_6973 ) ( not ( = ?AUTO_6970 ?AUTO_6972 ) ) ( not ( = ?AUTO_6970 ?AUTO_6973 ) ) ( not ( = ?AUTO_6971 ?AUTO_6972 ) ) ( not ( = ?AUTO_6971 ?AUTO_6973 ) ) ( not ( = ?AUTO_6972 ?AUTO_6973 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_6972 ?AUTO_6973 )
      ( MAKE-ON ?AUTO_6970 ?AUTO_6971 )
      ( MAKE-ON-VERIFY ?AUTO_6970 ?AUTO_6971 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6974 - BLOCK
      ?AUTO_6975 - BLOCK
    )
    :vars
    (
      ?AUTO_6976 - BLOCK
      ?AUTO_6977 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6975 ) ( not ( = ?AUTO_6974 ?AUTO_6975 ) ) ( ON-TABLE ?AUTO_6974 ) ( CLEAR ?AUTO_6976 ) ( not ( = ?AUTO_6974 ?AUTO_6977 ) ) ( not ( = ?AUTO_6974 ?AUTO_6976 ) ) ( not ( = ?AUTO_6975 ?AUTO_6977 ) ) ( not ( = ?AUTO_6975 ?AUTO_6976 ) ) ( not ( = ?AUTO_6977 ?AUTO_6976 ) ) ( ON ?AUTO_6977 ?AUTO_6974 ) ( CLEAR ?AUTO_6977 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6977 ?AUTO_6974 )
      ( MAKE-ON ?AUTO_6974 ?AUTO_6975 )
      ( MAKE-ON-VERIFY ?AUTO_6974 ?AUTO_6975 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6978 - BLOCK
      ?AUTO_6979 - BLOCK
    )
    :vars
    (
      ?AUTO_6980 - BLOCK
      ?AUTO_6981 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6979 ) ( not ( = ?AUTO_6978 ?AUTO_6979 ) ) ( ON-TABLE ?AUTO_6978 ) ( not ( = ?AUTO_6978 ?AUTO_6980 ) ) ( not ( = ?AUTO_6978 ?AUTO_6981 ) ) ( not ( = ?AUTO_6979 ?AUTO_6980 ) ) ( not ( = ?AUTO_6979 ?AUTO_6981 ) ) ( not ( = ?AUTO_6980 ?AUTO_6981 ) ) ( ON ?AUTO_6980 ?AUTO_6978 ) ( CLEAR ?AUTO_6980 ) ( HOLDING ?AUTO_6981 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6981 )
      ( MAKE-ON ?AUTO_6978 ?AUTO_6979 )
      ( MAKE-ON-VERIFY ?AUTO_6978 ?AUTO_6979 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6982 - BLOCK
      ?AUTO_6983 - BLOCK
    )
    :vars
    (
      ?AUTO_6984 - BLOCK
      ?AUTO_6985 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6982 ?AUTO_6983 ) ) ( ON-TABLE ?AUTO_6982 ) ( not ( = ?AUTO_6982 ?AUTO_6984 ) ) ( not ( = ?AUTO_6982 ?AUTO_6985 ) ) ( not ( = ?AUTO_6983 ?AUTO_6984 ) ) ( not ( = ?AUTO_6983 ?AUTO_6985 ) ) ( not ( = ?AUTO_6984 ?AUTO_6985 ) ) ( ON ?AUTO_6984 ?AUTO_6982 ) ( CLEAR ?AUTO_6984 ) ( ON ?AUTO_6985 ?AUTO_6983 ) ( CLEAR ?AUTO_6985 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6985 ?AUTO_6983 )
      ( MAKE-ON ?AUTO_6982 ?AUTO_6983 )
      ( MAKE-ON-VERIFY ?AUTO_6982 ?AUTO_6983 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6986 - BLOCK
      ?AUTO_6987 - BLOCK
    )
    :vars
    (
      ?AUTO_6989 - BLOCK
      ?AUTO_6988 - BLOCK
      ?AUTO_6990 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6986 ?AUTO_6987 ) ) ( ON-TABLE ?AUTO_6986 ) ( not ( = ?AUTO_6986 ?AUTO_6989 ) ) ( not ( = ?AUTO_6986 ?AUTO_6988 ) ) ( not ( = ?AUTO_6987 ?AUTO_6989 ) ) ( not ( = ?AUTO_6987 ?AUTO_6988 ) ) ( not ( = ?AUTO_6989 ?AUTO_6988 ) ) ( ON ?AUTO_6989 ?AUTO_6986 ) ( CLEAR ?AUTO_6989 ) ( ON ?AUTO_6988 ?AUTO_6987 ) ( CLEAR ?AUTO_6988 ) ( HOLDING ?AUTO_6990 ) ( not ( = ?AUTO_6986 ?AUTO_6990 ) ) ( not ( = ?AUTO_6987 ?AUTO_6990 ) ) ( not ( = ?AUTO_6989 ?AUTO_6990 ) ) ( not ( = ?AUTO_6988 ?AUTO_6990 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6990 )
      ( MAKE-ON ?AUTO_6986 ?AUTO_6987 )
      ( MAKE-ON-VERIFY ?AUTO_6986 ?AUTO_6987 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6991 - BLOCK
      ?AUTO_6992 - BLOCK
    )
    :vars
    (
      ?AUTO_6995 - BLOCK
      ?AUTO_6993 - BLOCK
      ?AUTO_6994 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6991 ?AUTO_6992 ) ) ( ON-TABLE ?AUTO_6991 ) ( not ( = ?AUTO_6991 ?AUTO_6995 ) ) ( not ( = ?AUTO_6991 ?AUTO_6993 ) ) ( not ( = ?AUTO_6992 ?AUTO_6995 ) ) ( not ( = ?AUTO_6992 ?AUTO_6993 ) ) ( not ( = ?AUTO_6995 ?AUTO_6993 ) ) ( ON ?AUTO_6995 ?AUTO_6991 ) ( CLEAR ?AUTO_6995 ) ( ON ?AUTO_6993 ?AUTO_6992 ) ( not ( = ?AUTO_6991 ?AUTO_6994 ) ) ( not ( = ?AUTO_6992 ?AUTO_6994 ) ) ( not ( = ?AUTO_6995 ?AUTO_6994 ) ) ( not ( = ?AUTO_6993 ?AUTO_6994 ) ) ( ON ?AUTO_6994 ?AUTO_6993 ) ( CLEAR ?AUTO_6994 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6994 ?AUTO_6993 )
      ( MAKE-ON ?AUTO_6991 ?AUTO_6992 )
      ( MAKE-ON-VERIFY ?AUTO_6991 ?AUTO_6992 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6996 - BLOCK
      ?AUTO_6997 - BLOCK
    )
    :vars
    (
      ?AUTO_7000 - BLOCK
      ?AUTO_6999 - BLOCK
      ?AUTO_6998 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6996 ?AUTO_6997 ) ) ( ON-TABLE ?AUTO_6996 ) ( not ( = ?AUTO_6996 ?AUTO_7000 ) ) ( not ( = ?AUTO_6996 ?AUTO_6999 ) ) ( not ( = ?AUTO_6997 ?AUTO_7000 ) ) ( not ( = ?AUTO_6997 ?AUTO_6999 ) ) ( not ( = ?AUTO_7000 ?AUTO_6999 ) ) ( ON ?AUTO_6999 ?AUTO_6997 ) ( not ( = ?AUTO_6996 ?AUTO_6998 ) ) ( not ( = ?AUTO_6997 ?AUTO_6998 ) ) ( not ( = ?AUTO_7000 ?AUTO_6998 ) ) ( not ( = ?AUTO_6999 ?AUTO_6998 ) ) ( ON ?AUTO_6998 ?AUTO_6999 ) ( CLEAR ?AUTO_6998 ) ( HOLDING ?AUTO_7000 ) ( CLEAR ?AUTO_6996 ) )
    :subtasks
    ( ( !STACK ?AUTO_7000 ?AUTO_6996 )
      ( MAKE-ON ?AUTO_6996 ?AUTO_6997 )
      ( MAKE-ON-VERIFY ?AUTO_6996 ?AUTO_6997 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7001 - BLOCK
      ?AUTO_7002 - BLOCK
    )
    :vars
    (
      ?AUTO_7005 - BLOCK
      ?AUTO_7004 - BLOCK
      ?AUTO_7003 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_7001 ?AUTO_7002 ) ) ( ON-TABLE ?AUTO_7001 ) ( not ( = ?AUTO_7001 ?AUTO_7005 ) ) ( not ( = ?AUTO_7001 ?AUTO_7004 ) ) ( not ( = ?AUTO_7002 ?AUTO_7005 ) ) ( not ( = ?AUTO_7002 ?AUTO_7004 ) ) ( not ( = ?AUTO_7005 ?AUTO_7004 ) ) ( ON ?AUTO_7004 ?AUTO_7002 ) ( not ( = ?AUTO_7001 ?AUTO_7003 ) ) ( not ( = ?AUTO_7002 ?AUTO_7003 ) ) ( not ( = ?AUTO_7005 ?AUTO_7003 ) ) ( not ( = ?AUTO_7004 ?AUTO_7003 ) ) ( ON ?AUTO_7003 ?AUTO_7004 ) ( CLEAR ?AUTO_7001 ) ( ON ?AUTO_7005 ?AUTO_7003 ) ( CLEAR ?AUTO_7005 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7005 ?AUTO_7003 )
      ( MAKE-ON ?AUTO_7001 ?AUTO_7002 )
      ( MAKE-ON-VERIFY ?AUTO_7001 ?AUTO_7002 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7006 - BLOCK
      ?AUTO_7007 - BLOCK
    )
    :vars
    (
      ?AUTO_7010 - BLOCK
      ?AUTO_7008 - BLOCK
      ?AUTO_7009 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_7006 ?AUTO_7007 ) ) ( not ( = ?AUTO_7006 ?AUTO_7010 ) ) ( not ( = ?AUTO_7006 ?AUTO_7008 ) ) ( not ( = ?AUTO_7007 ?AUTO_7010 ) ) ( not ( = ?AUTO_7007 ?AUTO_7008 ) ) ( not ( = ?AUTO_7010 ?AUTO_7008 ) ) ( ON ?AUTO_7008 ?AUTO_7007 ) ( not ( = ?AUTO_7006 ?AUTO_7009 ) ) ( not ( = ?AUTO_7007 ?AUTO_7009 ) ) ( not ( = ?AUTO_7010 ?AUTO_7009 ) ) ( not ( = ?AUTO_7008 ?AUTO_7009 ) ) ( ON ?AUTO_7009 ?AUTO_7008 ) ( ON ?AUTO_7010 ?AUTO_7009 ) ( CLEAR ?AUTO_7010 ) ( HOLDING ?AUTO_7006 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7006 )
      ( MAKE-ON ?AUTO_7006 ?AUTO_7007 )
      ( MAKE-ON-VERIFY ?AUTO_7006 ?AUTO_7007 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7011 - BLOCK
      ?AUTO_7012 - BLOCK
    )
    :vars
    (
      ?AUTO_7015 - BLOCK
      ?AUTO_7014 - BLOCK
      ?AUTO_7013 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_7011 ?AUTO_7012 ) ) ( not ( = ?AUTO_7011 ?AUTO_7015 ) ) ( not ( = ?AUTO_7011 ?AUTO_7014 ) ) ( not ( = ?AUTO_7012 ?AUTO_7015 ) ) ( not ( = ?AUTO_7012 ?AUTO_7014 ) ) ( not ( = ?AUTO_7015 ?AUTO_7014 ) ) ( ON ?AUTO_7014 ?AUTO_7012 ) ( not ( = ?AUTO_7011 ?AUTO_7013 ) ) ( not ( = ?AUTO_7012 ?AUTO_7013 ) ) ( not ( = ?AUTO_7015 ?AUTO_7013 ) ) ( not ( = ?AUTO_7014 ?AUTO_7013 ) ) ( ON ?AUTO_7013 ?AUTO_7014 ) ( ON ?AUTO_7015 ?AUTO_7013 ) ( ON ?AUTO_7011 ?AUTO_7015 ) ( CLEAR ?AUTO_7011 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7011 ?AUTO_7015 )
      ( MAKE-ON ?AUTO_7011 ?AUTO_7012 )
      ( MAKE-ON-VERIFY ?AUTO_7011 ?AUTO_7012 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7018 - BLOCK
      ?AUTO_7019 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_7018 ) ( CLEAR ?AUTO_7019 ) ( not ( = ?AUTO_7018 ?AUTO_7019 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_7018 ?AUTO_7019 )
      ( MAKE-ON-VERIFY ?AUTO_7018 ?AUTO_7019 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7020 - BLOCK
      ?AUTO_7021 - BLOCK
    )
    :vars
    (
      ?AUTO_7022 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7021 ) ( not ( = ?AUTO_7020 ?AUTO_7021 ) ) ( ON ?AUTO_7020 ?AUTO_7022 ) ( CLEAR ?AUTO_7020 ) ( HAND-EMPTY ) ( not ( = ?AUTO_7020 ?AUTO_7022 ) ) ( not ( = ?AUTO_7021 ?AUTO_7022 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7020 ?AUTO_7022 )
      ( MAKE-ON ?AUTO_7020 ?AUTO_7021 )
      ( MAKE-ON-VERIFY ?AUTO_7020 ?AUTO_7021 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7023 - BLOCK
      ?AUTO_7024 - BLOCK
    )
    :vars
    (
      ?AUTO_7025 - BLOCK
      ?AUTO_7026 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_7023 ?AUTO_7024 ) ) ( ON ?AUTO_7023 ?AUTO_7025 ) ( CLEAR ?AUTO_7023 ) ( not ( = ?AUTO_7023 ?AUTO_7025 ) ) ( not ( = ?AUTO_7024 ?AUTO_7025 ) ) ( HOLDING ?AUTO_7024 ) ( CLEAR ?AUTO_7026 ) ( not ( = ?AUTO_7023 ?AUTO_7026 ) ) ( not ( = ?AUTO_7024 ?AUTO_7026 ) ) ( not ( = ?AUTO_7025 ?AUTO_7026 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_7024 ?AUTO_7026 )
      ( MAKE-ON ?AUTO_7023 ?AUTO_7024 )
      ( MAKE-ON-VERIFY ?AUTO_7023 ?AUTO_7024 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7060 - BLOCK
      ?AUTO_7061 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_7060 ) ( CLEAR ?AUTO_7061 ) ( not ( = ?AUTO_7060 ?AUTO_7061 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_7060 ?AUTO_7061 )
      ( MAKE-ON-VERIFY ?AUTO_7060 ?AUTO_7061 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7062 - BLOCK
      ?AUTO_7063 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7063 ) ( not ( = ?AUTO_7062 ?AUTO_7063 ) ) ( ON-TABLE ?AUTO_7062 ) ( CLEAR ?AUTO_7062 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_7062 )
      ( MAKE-ON ?AUTO_7062 ?AUTO_7063 )
      ( MAKE-ON-VERIFY ?AUTO_7062 ?AUTO_7063 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7064 - BLOCK
      ?AUTO_7065 - BLOCK
    )
    :vars
    (
      ?AUTO_7066 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_7064 ?AUTO_7065 ) ) ( ON-TABLE ?AUTO_7064 ) ( CLEAR ?AUTO_7064 ) ( HOLDING ?AUTO_7065 ) ( CLEAR ?AUTO_7066 ) ( not ( = ?AUTO_7064 ?AUTO_7066 ) ) ( not ( = ?AUTO_7065 ?AUTO_7066 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_7065 ?AUTO_7066 )
      ( MAKE-ON ?AUTO_7064 ?AUTO_7065 )
      ( MAKE-ON-VERIFY ?AUTO_7064 ?AUTO_7065 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7067 - BLOCK
      ?AUTO_7068 - BLOCK
    )
    :vars
    (
      ?AUTO_7069 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_7067 ?AUTO_7068 ) ) ( ON-TABLE ?AUTO_7067 ) ( CLEAR ?AUTO_7069 ) ( not ( = ?AUTO_7067 ?AUTO_7069 ) ) ( not ( = ?AUTO_7068 ?AUTO_7069 ) ) ( ON ?AUTO_7068 ?AUTO_7067 ) ( CLEAR ?AUTO_7068 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7068 ?AUTO_7067 )
      ( MAKE-ON ?AUTO_7067 ?AUTO_7068 )
      ( MAKE-ON-VERIFY ?AUTO_7067 ?AUTO_7068 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7070 - BLOCK
      ?AUTO_7071 - BLOCK
    )
    :vars
    (
      ?AUTO_7072 - BLOCK
      ?AUTO_7073 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_7070 ?AUTO_7071 ) ) ( ON-TABLE ?AUTO_7070 ) ( not ( = ?AUTO_7070 ?AUTO_7072 ) ) ( not ( = ?AUTO_7071 ?AUTO_7072 ) ) ( ON ?AUTO_7071 ?AUTO_7070 ) ( CLEAR ?AUTO_7071 ) ( HOLDING ?AUTO_7072 ) ( CLEAR ?AUTO_7073 ) ( not ( = ?AUTO_7070 ?AUTO_7073 ) ) ( not ( = ?AUTO_7071 ?AUTO_7073 ) ) ( not ( = ?AUTO_7072 ?AUTO_7073 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_7072 ?AUTO_7073 )
      ( MAKE-ON ?AUTO_7070 ?AUTO_7071 )
      ( MAKE-ON-VERIFY ?AUTO_7070 ?AUTO_7071 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7086 - BLOCK
      ?AUTO_7087 - BLOCK
    )
    :vars
    (
      ?AUTO_7089 - BLOCK
      ?AUTO_7088 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7087 ) ( not ( = ?AUTO_7086 ?AUTO_7087 ) ) ( ON ?AUTO_7086 ?AUTO_7089 ) ( not ( = ?AUTO_7086 ?AUTO_7089 ) ) ( not ( = ?AUTO_7087 ?AUTO_7089 ) ) ( not ( = ?AUTO_7086 ?AUTO_7088 ) ) ( not ( = ?AUTO_7087 ?AUTO_7088 ) ) ( not ( = ?AUTO_7089 ?AUTO_7088 ) ) ( ON ?AUTO_7088 ?AUTO_7086 ) ( CLEAR ?AUTO_7088 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7088 ?AUTO_7086 )
      ( MAKE-ON ?AUTO_7086 ?AUTO_7087 )
      ( MAKE-ON-VERIFY ?AUTO_7086 ?AUTO_7087 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7090 - BLOCK
      ?AUTO_7091 - BLOCK
    )
    :vars
    (
      ?AUTO_7092 - BLOCK
      ?AUTO_7093 - BLOCK
      ?AUTO_7094 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_7090 ?AUTO_7091 ) ) ( ON ?AUTO_7090 ?AUTO_7092 ) ( not ( = ?AUTO_7090 ?AUTO_7092 ) ) ( not ( = ?AUTO_7091 ?AUTO_7092 ) ) ( not ( = ?AUTO_7090 ?AUTO_7093 ) ) ( not ( = ?AUTO_7091 ?AUTO_7093 ) ) ( not ( = ?AUTO_7092 ?AUTO_7093 ) ) ( ON ?AUTO_7093 ?AUTO_7090 ) ( CLEAR ?AUTO_7093 ) ( HOLDING ?AUTO_7091 ) ( CLEAR ?AUTO_7094 ) ( not ( = ?AUTO_7090 ?AUTO_7094 ) ) ( not ( = ?AUTO_7091 ?AUTO_7094 ) ) ( not ( = ?AUTO_7092 ?AUTO_7094 ) ) ( not ( = ?AUTO_7093 ?AUTO_7094 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_7091 ?AUTO_7094 )
      ( MAKE-ON ?AUTO_7090 ?AUTO_7091 )
      ( MAKE-ON-VERIFY ?AUTO_7090 ?AUTO_7091 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7095 - BLOCK
      ?AUTO_7096 - BLOCK
    )
    :vars
    (
      ?AUTO_7098 - BLOCK
      ?AUTO_7097 - BLOCK
      ?AUTO_7099 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_7095 ?AUTO_7096 ) ) ( ON ?AUTO_7095 ?AUTO_7098 ) ( not ( = ?AUTO_7095 ?AUTO_7098 ) ) ( not ( = ?AUTO_7096 ?AUTO_7098 ) ) ( not ( = ?AUTO_7095 ?AUTO_7097 ) ) ( not ( = ?AUTO_7096 ?AUTO_7097 ) ) ( not ( = ?AUTO_7098 ?AUTO_7097 ) ) ( ON ?AUTO_7097 ?AUTO_7095 ) ( CLEAR ?AUTO_7099 ) ( not ( = ?AUTO_7095 ?AUTO_7099 ) ) ( not ( = ?AUTO_7096 ?AUTO_7099 ) ) ( not ( = ?AUTO_7098 ?AUTO_7099 ) ) ( not ( = ?AUTO_7097 ?AUTO_7099 ) ) ( ON ?AUTO_7096 ?AUTO_7097 ) ( CLEAR ?AUTO_7096 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7096 ?AUTO_7097 )
      ( MAKE-ON ?AUTO_7095 ?AUTO_7096 )
      ( MAKE-ON-VERIFY ?AUTO_7095 ?AUTO_7096 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7100 - BLOCK
      ?AUTO_7101 - BLOCK
    )
    :vars
    (
      ?AUTO_7102 - BLOCK
      ?AUTO_7103 - BLOCK
      ?AUTO_7104 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_7100 ?AUTO_7101 ) ) ( ON ?AUTO_7100 ?AUTO_7102 ) ( not ( = ?AUTO_7100 ?AUTO_7102 ) ) ( not ( = ?AUTO_7101 ?AUTO_7102 ) ) ( not ( = ?AUTO_7100 ?AUTO_7103 ) ) ( not ( = ?AUTO_7101 ?AUTO_7103 ) ) ( not ( = ?AUTO_7102 ?AUTO_7103 ) ) ( ON ?AUTO_7103 ?AUTO_7100 ) ( not ( = ?AUTO_7100 ?AUTO_7104 ) ) ( not ( = ?AUTO_7101 ?AUTO_7104 ) ) ( not ( = ?AUTO_7102 ?AUTO_7104 ) ) ( not ( = ?AUTO_7103 ?AUTO_7104 ) ) ( ON ?AUTO_7101 ?AUTO_7103 ) ( CLEAR ?AUTO_7101 ) ( HOLDING ?AUTO_7104 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7104 )
      ( MAKE-ON ?AUTO_7100 ?AUTO_7101 )
      ( MAKE-ON-VERIFY ?AUTO_7100 ?AUTO_7101 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7105 - BLOCK
      ?AUTO_7106 - BLOCK
    )
    :vars
    (
      ?AUTO_7108 - BLOCK
      ?AUTO_7107 - BLOCK
      ?AUTO_7109 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_7105 ?AUTO_7106 ) ) ( ON ?AUTO_7105 ?AUTO_7108 ) ( not ( = ?AUTO_7105 ?AUTO_7108 ) ) ( not ( = ?AUTO_7106 ?AUTO_7108 ) ) ( not ( = ?AUTO_7105 ?AUTO_7107 ) ) ( not ( = ?AUTO_7106 ?AUTO_7107 ) ) ( not ( = ?AUTO_7108 ?AUTO_7107 ) ) ( ON ?AUTO_7107 ?AUTO_7105 ) ( not ( = ?AUTO_7105 ?AUTO_7109 ) ) ( not ( = ?AUTO_7106 ?AUTO_7109 ) ) ( not ( = ?AUTO_7108 ?AUTO_7109 ) ) ( not ( = ?AUTO_7107 ?AUTO_7109 ) ) ( ON ?AUTO_7106 ?AUTO_7107 ) ( ON ?AUTO_7109 ?AUTO_7106 ) ( CLEAR ?AUTO_7109 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7109 ?AUTO_7106 )
      ( MAKE-ON ?AUTO_7105 ?AUTO_7106 )
      ( MAKE-ON-VERIFY ?AUTO_7105 ?AUTO_7106 ) )
  )

)

