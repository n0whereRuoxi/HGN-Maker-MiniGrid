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

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2 - BLOCK
      ?AUTO_3 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2 ) ( CLEAR ?AUTO_3 ) ( not ( = ?AUTO_2 ?AUTO_3 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2 ?AUTO_3 )
      ( MAKE-ON-VERIFY ?AUTO_2 ?AUTO_3 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4 - BLOCK
      ?AUTO_5 - BLOCK
    )
    :vars
    (
      ?AUTO_6 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5 ) ( not ( = ?AUTO_4 ?AUTO_5 ) ) ( ON ?AUTO_4 ?AUTO_6 ) ( CLEAR ?AUTO_4 ) ( HAND-EMPTY ) ( not ( = ?AUTO_4 ?AUTO_6 ) ) ( not ( = ?AUTO_5 ?AUTO_6 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4 ?AUTO_6 )
      ( MAKE-ON ?AUTO_4 ?AUTO_5 )
      ( MAKE-ON-VERIFY ?AUTO_4 ?AUTO_5 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_8 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_8 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_8 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_8 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_9 - BLOCK
    )
    :vars
    (
      ?AUTO_10 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_9 ?AUTO_10 ) ( CLEAR ?AUTO_9 ) ( HAND-EMPTY ) ( not ( = ?AUTO_9 ?AUTO_10 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_9 ?AUTO_10 )
      ( MAKE-ON-TABLE ?AUTO_9 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_9 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_11 - BLOCK
    )
    :vars
    (
      ?AUTO_12 - BLOCK
      ?AUTO_13 - BLOCK
      ?AUTO_14 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_11 ?AUTO_12 ) ( CLEAR ?AUTO_11 ) ( not ( = ?AUTO_11 ?AUTO_12 ) ) ( HOLDING ?AUTO_13 ) ( CLEAR ?AUTO_14 ) ( not ( = ?AUTO_11 ?AUTO_13 ) ) ( not ( = ?AUTO_11 ?AUTO_14 ) ) ( not ( = ?AUTO_12 ?AUTO_13 ) ) ( not ( = ?AUTO_12 ?AUTO_14 ) ) ( not ( = ?AUTO_13 ?AUTO_14 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_13 ?AUTO_14 )
      ( MAKE-ON-TABLE ?AUTO_11 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_11 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_15 - BLOCK
    )
    :vars
    (
      ?AUTO_16 - BLOCK
      ?AUTO_18 - BLOCK
      ?AUTO_17 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_15 ?AUTO_16 ) ( not ( = ?AUTO_15 ?AUTO_16 ) ) ( CLEAR ?AUTO_18 ) ( not ( = ?AUTO_15 ?AUTO_17 ) ) ( not ( = ?AUTO_15 ?AUTO_18 ) ) ( not ( = ?AUTO_16 ?AUTO_17 ) ) ( not ( = ?AUTO_16 ?AUTO_18 ) ) ( not ( = ?AUTO_17 ?AUTO_18 ) ) ( ON ?AUTO_17 ?AUTO_15 ) ( CLEAR ?AUTO_17 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_17 ?AUTO_15 )
      ( MAKE-ON-TABLE ?AUTO_15 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_15 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_20 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_20 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_20 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_20 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_21 - BLOCK
    )
    :vars
    (
      ?AUTO_22 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_21 ?AUTO_22 ) ( CLEAR ?AUTO_21 ) ( HAND-EMPTY ) ( not ( = ?AUTO_21 ?AUTO_22 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_21 ?AUTO_22 )
      ( MAKE-ON-TABLE ?AUTO_21 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_21 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_23 - BLOCK
    )
    :vars
    (
      ?AUTO_24 - BLOCK
      ?AUTO_25 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_23 ?AUTO_24 ) ( CLEAR ?AUTO_23 ) ( not ( = ?AUTO_23 ?AUTO_24 ) ) ( HOLDING ?AUTO_25 ) ( not ( = ?AUTO_23 ?AUTO_25 ) ) ( not ( = ?AUTO_24 ?AUTO_25 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_25 )
      ( MAKE-ON-TABLE ?AUTO_23 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_23 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_31 - BLOCK
      ?AUTO_32 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_31 ) ( CLEAR ?AUTO_32 ) ( not ( = ?AUTO_31 ?AUTO_32 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_31 ?AUTO_32 )
      ( MAKE-ON-VERIFY ?AUTO_31 ?AUTO_32 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_33 - BLOCK
      ?AUTO_34 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_34 ) ( not ( = ?AUTO_33 ?AUTO_34 ) ) ( ON-TABLE ?AUTO_33 ) ( CLEAR ?AUTO_33 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_33 )
      ( MAKE-ON ?AUTO_33 ?AUTO_34 )
      ( MAKE-ON-VERIFY ?AUTO_33 ?AUTO_34 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_35 - BLOCK
      ?AUTO_36 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_35 ?AUTO_36 ) ) ( ON-TABLE ?AUTO_35 ) ( CLEAR ?AUTO_35 ) ( HOLDING ?AUTO_36 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_36 )
      ( MAKE-ON ?AUTO_35 ?AUTO_36 )
      ( MAKE-ON-VERIFY ?AUTO_35 ?AUTO_36 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_37 - BLOCK
      ?AUTO_38 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_37 ?AUTO_38 ) ) ( ON-TABLE ?AUTO_37 ) ( ON ?AUTO_38 ?AUTO_37 ) ( CLEAR ?AUTO_38 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_38 ?AUTO_37 )
      ( MAKE-ON ?AUTO_37 ?AUTO_38 )
      ( MAKE-ON-VERIFY ?AUTO_37 ?AUTO_38 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_39 - BLOCK
      ?AUTO_40 - BLOCK
    )
    :vars
    (
      ?AUTO_41 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_39 ?AUTO_40 ) ) ( ON-TABLE ?AUTO_39 ) ( ON ?AUTO_40 ?AUTO_39 ) ( CLEAR ?AUTO_40 ) ( HOLDING ?AUTO_41 ) ( not ( = ?AUTO_39 ?AUTO_41 ) ) ( not ( = ?AUTO_40 ?AUTO_41 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_41 )
      ( MAKE-ON ?AUTO_39 ?AUTO_40 )
      ( MAKE-ON-VERIFY ?AUTO_39 ?AUTO_40 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_49 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_49 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_49 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_49 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_50 - BLOCK
    )
    :vars
    (
      ?AUTO_51 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_50 ?AUTO_51 ) ( CLEAR ?AUTO_50 ) ( HAND-EMPTY ) ( not ( = ?AUTO_50 ?AUTO_51 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_50 ?AUTO_51 )
      ( MAKE-ON-TABLE ?AUTO_50 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_50 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_52 - BLOCK
    )
    :vars
    (
      ?AUTO_53 - BLOCK
      ?AUTO_54 - BLOCK
      ?AUTO_55 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_52 ?AUTO_53 ) ( CLEAR ?AUTO_52 ) ( not ( = ?AUTO_52 ?AUTO_53 ) ) ( HOLDING ?AUTO_54 ) ( CLEAR ?AUTO_55 ) ( not ( = ?AUTO_52 ?AUTO_54 ) ) ( not ( = ?AUTO_52 ?AUTO_55 ) ) ( not ( = ?AUTO_53 ?AUTO_54 ) ) ( not ( = ?AUTO_53 ?AUTO_55 ) ) ( not ( = ?AUTO_54 ?AUTO_55 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_54 ?AUTO_55 )
      ( MAKE-ON-TABLE ?AUTO_52 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_52 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_65 - BLOCK
      ?AUTO_66 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_65 ) ( CLEAR ?AUTO_66 ) ( not ( = ?AUTO_65 ?AUTO_66 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_65 ?AUTO_66 )
      ( MAKE-ON-VERIFY ?AUTO_65 ?AUTO_66 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_67 - BLOCK
      ?AUTO_68 - BLOCK
    )
    :vars
    (
      ?AUTO_69 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_68 ) ( not ( = ?AUTO_67 ?AUTO_68 ) ) ( ON ?AUTO_67 ?AUTO_69 ) ( CLEAR ?AUTO_67 ) ( HAND-EMPTY ) ( not ( = ?AUTO_67 ?AUTO_69 ) ) ( not ( = ?AUTO_68 ?AUTO_69 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_67 ?AUTO_69 )
      ( MAKE-ON ?AUTO_67 ?AUTO_68 )
      ( MAKE-ON-VERIFY ?AUTO_67 ?AUTO_68 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_70 - BLOCK
      ?AUTO_71 - BLOCK
    )
    :vars
    (
      ?AUTO_72 - BLOCK
      ?AUTO_73 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_71 ) ( not ( = ?AUTO_70 ?AUTO_71 ) ) ( ON ?AUTO_70 ?AUTO_72 ) ( CLEAR ?AUTO_70 ) ( not ( = ?AUTO_70 ?AUTO_72 ) ) ( not ( = ?AUTO_71 ?AUTO_72 ) ) ( HOLDING ?AUTO_73 ) ( not ( = ?AUTO_70 ?AUTO_73 ) ) ( not ( = ?AUTO_71 ?AUTO_73 ) ) ( not ( = ?AUTO_72 ?AUTO_73 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_73 )
      ( MAKE-ON ?AUTO_70 ?AUTO_71 )
      ( MAKE-ON-VERIFY ?AUTO_70 ?AUTO_71 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_74 - BLOCK
      ?AUTO_75 - BLOCK
    )
    :vars
    (
      ?AUTO_77 - BLOCK
      ?AUTO_76 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_75 ) ( not ( = ?AUTO_74 ?AUTO_75 ) ) ( ON ?AUTO_74 ?AUTO_77 ) ( not ( = ?AUTO_74 ?AUTO_77 ) ) ( not ( = ?AUTO_75 ?AUTO_77 ) ) ( not ( = ?AUTO_74 ?AUTO_76 ) ) ( not ( = ?AUTO_75 ?AUTO_76 ) ) ( not ( = ?AUTO_77 ?AUTO_76 ) ) ( ON ?AUTO_76 ?AUTO_74 ) ( CLEAR ?AUTO_76 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_76 ?AUTO_74 )
      ( MAKE-ON ?AUTO_74 ?AUTO_75 )
      ( MAKE-ON-VERIFY ?AUTO_74 ?AUTO_75 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_78 - BLOCK
      ?AUTO_79 - BLOCK
    )
    :vars
    (
      ?AUTO_81 - BLOCK
      ?AUTO_80 - BLOCK
      ?AUTO_82 - BLOCK
      ?AUTO_83 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_79 ) ( not ( = ?AUTO_78 ?AUTO_79 ) ) ( ON ?AUTO_78 ?AUTO_81 ) ( not ( = ?AUTO_78 ?AUTO_81 ) ) ( not ( = ?AUTO_79 ?AUTO_81 ) ) ( not ( = ?AUTO_78 ?AUTO_80 ) ) ( not ( = ?AUTO_79 ?AUTO_80 ) ) ( not ( = ?AUTO_81 ?AUTO_80 ) ) ( ON ?AUTO_80 ?AUTO_78 ) ( CLEAR ?AUTO_80 ) ( HOLDING ?AUTO_82 ) ( CLEAR ?AUTO_83 ) ( not ( = ?AUTO_78 ?AUTO_82 ) ) ( not ( = ?AUTO_78 ?AUTO_83 ) ) ( not ( = ?AUTO_79 ?AUTO_82 ) ) ( not ( = ?AUTO_79 ?AUTO_83 ) ) ( not ( = ?AUTO_81 ?AUTO_82 ) ) ( not ( = ?AUTO_81 ?AUTO_83 ) ) ( not ( = ?AUTO_80 ?AUTO_82 ) ) ( not ( = ?AUTO_80 ?AUTO_83 ) ) ( not ( = ?AUTO_82 ?AUTO_83 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_82 ?AUTO_83 )
      ( MAKE-ON ?AUTO_78 ?AUTO_79 )
      ( MAKE-ON-VERIFY ?AUTO_78 ?AUTO_79 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_92 - BLOCK
      ?AUTO_93 - BLOCK
    )
    :vars
    (
      ?AUTO_96 - BLOCK
      ?AUTO_97 - BLOCK
      ?AUTO_95 - BLOCK
      ?AUTO_94 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_92 ?AUTO_93 ) ) ( ON ?AUTO_92 ?AUTO_96 ) ( not ( = ?AUTO_92 ?AUTO_96 ) ) ( not ( = ?AUTO_93 ?AUTO_96 ) ) ( not ( = ?AUTO_92 ?AUTO_97 ) ) ( not ( = ?AUTO_93 ?AUTO_97 ) ) ( not ( = ?AUTO_96 ?AUTO_97 ) ) ( ON ?AUTO_97 ?AUTO_92 ) ( CLEAR ?AUTO_97 ) ( CLEAR ?AUTO_95 ) ( not ( = ?AUTO_92 ?AUTO_94 ) ) ( not ( = ?AUTO_92 ?AUTO_95 ) ) ( not ( = ?AUTO_93 ?AUTO_94 ) ) ( not ( = ?AUTO_93 ?AUTO_95 ) ) ( not ( = ?AUTO_96 ?AUTO_94 ) ) ( not ( = ?AUTO_96 ?AUTO_95 ) ) ( not ( = ?AUTO_97 ?AUTO_94 ) ) ( not ( = ?AUTO_97 ?AUTO_95 ) ) ( not ( = ?AUTO_94 ?AUTO_95 ) ) ( ON ?AUTO_94 ?AUTO_93 ) ( CLEAR ?AUTO_94 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_94 ?AUTO_93 )
      ( MAKE-ON ?AUTO_92 ?AUTO_93 )
      ( MAKE-ON-VERIFY ?AUTO_92 ?AUTO_93 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_98 - BLOCK
      ?AUTO_99 - BLOCK
    )
    :vars
    (
      ?AUTO_103 - BLOCK
      ?AUTO_102 - BLOCK
      ?AUTO_100 - BLOCK
      ?AUTO_101 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_98 ?AUTO_99 ) ) ( ON ?AUTO_98 ?AUTO_103 ) ( not ( = ?AUTO_98 ?AUTO_103 ) ) ( not ( = ?AUTO_99 ?AUTO_103 ) ) ( not ( = ?AUTO_98 ?AUTO_102 ) ) ( not ( = ?AUTO_99 ?AUTO_102 ) ) ( not ( = ?AUTO_103 ?AUTO_102 ) ) ( CLEAR ?AUTO_100 ) ( not ( = ?AUTO_98 ?AUTO_101 ) ) ( not ( = ?AUTO_98 ?AUTO_100 ) ) ( not ( = ?AUTO_99 ?AUTO_101 ) ) ( not ( = ?AUTO_99 ?AUTO_100 ) ) ( not ( = ?AUTO_103 ?AUTO_101 ) ) ( not ( = ?AUTO_103 ?AUTO_100 ) ) ( not ( = ?AUTO_102 ?AUTO_101 ) ) ( not ( = ?AUTO_102 ?AUTO_100 ) ) ( not ( = ?AUTO_101 ?AUTO_100 ) ) ( ON ?AUTO_101 ?AUTO_99 ) ( CLEAR ?AUTO_101 ) ( HOLDING ?AUTO_102 ) ( CLEAR ?AUTO_98 ) )
    :subtasks
    ( ( !STACK ?AUTO_102 ?AUTO_98 )
      ( MAKE-ON ?AUTO_98 ?AUTO_99 )
      ( MAKE-ON-VERIFY ?AUTO_98 ?AUTO_99 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_104 - BLOCK
      ?AUTO_105 - BLOCK
    )
    :vars
    (
      ?AUTO_106 - BLOCK
      ?AUTO_109 - BLOCK
      ?AUTO_108 - BLOCK
      ?AUTO_107 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_104 ?AUTO_105 ) ) ( ON ?AUTO_104 ?AUTO_106 ) ( not ( = ?AUTO_104 ?AUTO_106 ) ) ( not ( = ?AUTO_105 ?AUTO_106 ) ) ( not ( = ?AUTO_104 ?AUTO_109 ) ) ( not ( = ?AUTO_105 ?AUTO_109 ) ) ( not ( = ?AUTO_106 ?AUTO_109 ) ) ( CLEAR ?AUTO_108 ) ( not ( = ?AUTO_104 ?AUTO_107 ) ) ( not ( = ?AUTO_104 ?AUTO_108 ) ) ( not ( = ?AUTO_105 ?AUTO_107 ) ) ( not ( = ?AUTO_105 ?AUTO_108 ) ) ( not ( = ?AUTO_106 ?AUTO_107 ) ) ( not ( = ?AUTO_106 ?AUTO_108 ) ) ( not ( = ?AUTO_109 ?AUTO_107 ) ) ( not ( = ?AUTO_109 ?AUTO_108 ) ) ( not ( = ?AUTO_107 ?AUTO_108 ) ) ( ON ?AUTO_107 ?AUTO_105 ) ( CLEAR ?AUTO_104 ) ( ON ?AUTO_109 ?AUTO_107 ) ( CLEAR ?AUTO_109 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_109 ?AUTO_107 )
      ( MAKE-ON ?AUTO_104 ?AUTO_105 )
      ( MAKE-ON-VERIFY ?AUTO_104 ?AUTO_105 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_112 - BLOCK
      ?AUTO_113 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_112 ) ( CLEAR ?AUTO_113 ) ( not ( = ?AUTO_112 ?AUTO_113 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_112 ?AUTO_113 )
      ( MAKE-ON-VERIFY ?AUTO_112 ?AUTO_113 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_114 - BLOCK
      ?AUTO_115 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_115 ) ( not ( = ?AUTO_114 ?AUTO_115 ) ) ( ON-TABLE ?AUTO_114 ) ( CLEAR ?AUTO_114 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_114 )
      ( MAKE-ON ?AUTO_114 ?AUTO_115 )
      ( MAKE-ON-VERIFY ?AUTO_114 ?AUTO_115 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_116 - BLOCK
      ?AUTO_117 - BLOCK
    )
    :vars
    (
      ?AUTO_118 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_116 ?AUTO_117 ) ) ( ON-TABLE ?AUTO_116 ) ( CLEAR ?AUTO_116 ) ( HOLDING ?AUTO_117 ) ( CLEAR ?AUTO_118 ) ( not ( = ?AUTO_116 ?AUTO_118 ) ) ( not ( = ?AUTO_117 ?AUTO_118 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_117 ?AUTO_118 )
      ( MAKE-ON ?AUTO_116 ?AUTO_117 )
      ( MAKE-ON-VERIFY ?AUTO_116 ?AUTO_117 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_158 - BLOCK
      ?AUTO_159 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_158 ) ( CLEAR ?AUTO_159 ) ( not ( = ?AUTO_158 ?AUTO_159 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_158 ?AUTO_159 )
      ( MAKE-ON-VERIFY ?AUTO_158 ?AUTO_159 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_160 - BLOCK
      ?AUTO_161 - BLOCK
    )
    :vars
    (
      ?AUTO_162 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_161 ) ( not ( = ?AUTO_160 ?AUTO_161 ) ) ( ON ?AUTO_160 ?AUTO_162 ) ( CLEAR ?AUTO_160 ) ( HAND-EMPTY ) ( not ( = ?AUTO_160 ?AUTO_162 ) ) ( not ( = ?AUTO_161 ?AUTO_162 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_160 ?AUTO_162 )
      ( MAKE-ON ?AUTO_160 ?AUTO_161 )
      ( MAKE-ON-VERIFY ?AUTO_160 ?AUTO_161 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_163 - BLOCK
      ?AUTO_164 - BLOCK
    )
    :vars
    (
      ?AUTO_165 - BLOCK
      ?AUTO_166 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_163 ?AUTO_164 ) ) ( ON ?AUTO_163 ?AUTO_165 ) ( CLEAR ?AUTO_163 ) ( not ( = ?AUTO_163 ?AUTO_165 ) ) ( not ( = ?AUTO_164 ?AUTO_165 ) ) ( HOLDING ?AUTO_164 ) ( CLEAR ?AUTO_166 ) ( not ( = ?AUTO_163 ?AUTO_166 ) ) ( not ( = ?AUTO_164 ?AUTO_166 ) ) ( not ( = ?AUTO_165 ?AUTO_166 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_164 ?AUTO_166 )
      ( MAKE-ON ?AUTO_163 ?AUTO_164 )
      ( MAKE-ON-VERIFY ?AUTO_163 ?AUTO_164 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_169 - BLOCK
      ?AUTO_170 - BLOCK
    )
    :vars
    (
      ?AUTO_171 - BLOCK
      ?AUTO_172 - BLOCK
      ?AUTO_173 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_170 ) ( not ( = ?AUTO_169 ?AUTO_170 ) ) ( ON ?AUTO_169 ?AUTO_171 ) ( CLEAR ?AUTO_169 ) ( not ( = ?AUTO_169 ?AUTO_171 ) ) ( not ( = ?AUTO_170 ?AUTO_171 ) ) ( HOLDING ?AUTO_172 ) ( CLEAR ?AUTO_173 ) ( not ( = ?AUTO_169 ?AUTO_172 ) ) ( not ( = ?AUTO_169 ?AUTO_173 ) ) ( not ( = ?AUTO_170 ?AUTO_172 ) ) ( not ( = ?AUTO_170 ?AUTO_173 ) ) ( not ( = ?AUTO_171 ?AUTO_172 ) ) ( not ( = ?AUTO_171 ?AUTO_173 ) ) ( not ( = ?AUTO_172 ?AUTO_173 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_172 ?AUTO_173 )
      ( MAKE-ON ?AUTO_169 ?AUTO_170 )
      ( MAKE-ON-VERIFY ?AUTO_169 ?AUTO_170 ) )
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
      ?AUTO_177 - BLOCK
      ?AUTO_178 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_175 ) ( not ( = ?AUTO_174 ?AUTO_175 ) ) ( ON ?AUTO_174 ?AUTO_176 ) ( not ( = ?AUTO_174 ?AUTO_176 ) ) ( not ( = ?AUTO_175 ?AUTO_176 ) ) ( CLEAR ?AUTO_177 ) ( not ( = ?AUTO_174 ?AUTO_178 ) ) ( not ( = ?AUTO_174 ?AUTO_177 ) ) ( not ( = ?AUTO_175 ?AUTO_178 ) ) ( not ( = ?AUTO_175 ?AUTO_177 ) ) ( not ( = ?AUTO_176 ?AUTO_178 ) ) ( not ( = ?AUTO_176 ?AUTO_177 ) ) ( not ( = ?AUTO_178 ?AUTO_177 ) ) ( ON ?AUTO_178 ?AUTO_174 ) ( CLEAR ?AUTO_178 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_178 ?AUTO_174 )
      ( MAKE-ON ?AUTO_174 ?AUTO_175 )
      ( MAKE-ON-VERIFY ?AUTO_174 ?AUTO_175 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_179 - BLOCK
      ?AUTO_180 - BLOCK
    )
    :vars
    (
      ?AUTO_181 - BLOCK
      ?AUTO_182 - BLOCK
      ?AUTO_183 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_179 ?AUTO_180 ) ) ( ON ?AUTO_179 ?AUTO_181 ) ( not ( = ?AUTO_179 ?AUTO_181 ) ) ( not ( = ?AUTO_180 ?AUTO_181 ) ) ( CLEAR ?AUTO_182 ) ( not ( = ?AUTO_179 ?AUTO_183 ) ) ( not ( = ?AUTO_179 ?AUTO_182 ) ) ( not ( = ?AUTO_180 ?AUTO_183 ) ) ( not ( = ?AUTO_180 ?AUTO_182 ) ) ( not ( = ?AUTO_181 ?AUTO_183 ) ) ( not ( = ?AUTO_181 ?AUTO_182 ) ) ( not ( = ?AUTO_183 ?AUTO_182 ) ) ( ON ?AUTO_183 ?AUTO_179 ) ( CLEAR ?AUTO_183 ) ( HOLDING ?AUTO_180 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_180 )
      ( MAKE-ON ?AUTO_179 ?AUTO_180 )
      ( MAKE-ON-VERIFY ?AUTO_179 ?AUTO_180 ) )
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
      ?AUTO_188 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_184 ?AUTO_185 ) ) ( ON ?AUTO_184 ?AUTO_186 ) ( not ( = ?AUTO_184 ?AUTO_186 ) ) ( not ( = ?AUTO_185 ?AUTO_186 ) ) ( CLEAR ?AUTO_187 ) ( not ( = ?AUTO_184 ?AUTO_188 ) ) ( not ( = ?AUTO_184 ?AUTO_187 ) ) ( not ( = ?AUTO_185 ?AUTO_188 ) ) ( not ( = ?AUTO_185 ?AUTO_187 ) ) ( not ( = ?AUTO_186 ?AUTO_188 ) ) ( not ( = ?AUTO_186 ?AUTO_187 ) ) ( not ( = ?AUTO_188 ?AUTO_187 ) ) ( ON ?AUTO_188 ?AUTO_184 ) ( ON ?AUTO_185 ?AUTO_188 ) ( CLEAR ?AUTO_185 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_185 ?AUTO_188 )
      ( MAKE-ON ?AUTO_184 ?AUTO_185 )
      ( MAKE-ON-VERIFY ?AUTO_184 ?AUTO_185 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_189 - BLOCK
      ?AUTO_190 - BLOCK
    )
    :vars
    (
      ?AUTO_191 - BLOCK
      ?AUTO_192 - BLOCK
      ?AUTO_193 - BLOCK
      ?AUTO_194 - BLOCK
      ?AUTO_195 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_189 ?AUTO_190 ) ) ( ON ?AUTO_189 ?AUTO_191 ) ( not ( = ?AUTO_189 ?AUTO_191 ) ) ( not ( = ?AUTO_190 ?AUTO_191 ) ) ( CLEAR ?AUTO_192 ) ( not ( = ?AUTO_189 ?AUTO_193 ) ) ( not ( = ?AUTO_189 ?AUTO_192 ) ) ( not ( = ?AUTO_190 ?AUTO_193 ) ) ( not ( = ?AUTO_190 ?AUTO_192 ) ) ( not ( = ?AUTO_191 ?AUTO_193 ) ) ( not ( = ?AUTO_191 ?AUTO_192 ) ) ( not ( = ?AUTO_193 ?AUTO_192 ) ) ( ON ?AUTO_193 ?AUTO_189 ) ( ON ?AUTO_190 ?AUTO_193 ) ( CLEAR ?AUTO_190 ) ( HOLDING ?AUTO_194 ) ( CLEAR ?AUTO_195 ) ( not ( = ?AUTO_189 ?AUTO_194 ) ) ( not ( = ?AUTO_189 ?AUTO_195 ) ) ( not ( = ?AUTO_190 ?AUTO_194 ) ) ( not ( = ?AUTO_190 ?AUTO_195 ) ) ( not ( = ?AUTO_191 ?AUTO_194 ) ) ( not ( = ?AUTO_191 ?AUTO_195 ) ) ( not ( = ?AUTO_192 ?AUTO_194 ) ) ( not ( = ?AUTO_192 ?AUTO_195 ) ) ( not ( = ?AUTO_193 ?AUTO_194 ) ) ( not ( = ?AUTO_193 ?AUTO_195 ) ) ( not ( = ?AUTO_194 ?AUTO_195 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_194 ?AUTO_195 )
      ( MAKE-ON ?AUTO_189 ?AUTO_190 )
      ( MAKE-ON-VERIFY ?AUTO_189 ?AUTO_190 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_212 - BLOCK
      ?AUTO_213 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_212 ) ( CLEAR ?AUTO_213 ) ( not ( = ?AUTO_212 ?AUTO_213 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_212 ?AUTO_213 )
      ( MAKE-ON-VERIFY ?AUTO_212 ?AUTO_213 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_214 - BLOCK
      ?AUTO_215 - BLOCK
    )
    :vars
    (
      ?AUTO_216 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_215 ) ( not ( = ?AUTO_214 ?AUTO_215 ) ) ( ON ?AUTO_214 ?AUTO_216 ) ( CLEAR ?AUTO_214 ) ( HAND-EMPTY ) ( not ( = ?AUTO_214 ?AUTO_216 ) ) ( not ( = ?AUTO_215 ?AUTO_216 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_214 ?AUTO_216 )
      ( MAKE-ON ?AUTO_214 ?AUTO_215 )
      ( MAKE-ON-VERIFY ?AUTO_214 ?AUTO_215 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_217 - BLOCK
      ?AUTO_218 - BLOCK
    )
    :vars
    (
      ?AUTO_219 - BLOCK
      ?AUTO_220 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_217 ?AUTO_218 ) ) ( ON ?AUTO_217 ?AUTO_219 ) ( CLEAR ?AUTO_217 ) ( not ( = ?AUTO_217 ?AUTO_219 ) ) ( not ( = ?AUTO_218 ?AUTO_219 ) ) ( HOLDING ?AUTO_218 ) ( CLEAR ?AUTO_220 ) ( not ( = ?AUTO_217 ?AUTO_220 ) ) ( not ( = ?AUTO_218 ?AUTO_220 ) ) ( not ( = ?AUTO_219 ?AUTO_220 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_218 ?AUTO_220 )
      ( MAKE-ON ?AUTO_217 ?AUTO_218 )
      ( MAKE-ON-VERIFY ?AUTO_217 ?AUTO_218 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_223 - BLOCK
      ?AUTO_224 - BLOCK
    )
    :vars
    (
      ?AUTO_225 - BLOCK
      ?AUTO_226 - BLOCK
      ?AUTO_227 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_224 ) ( not ( = ?AUTO_223 ?AUTO_224 ) ) ( ON ?AUTO_223 ?AUTO_225 ) ( CLEAR ?AUTO_223 ) ( not ( = ?AUTO_223 ?AUTO_225 ) ) ( not ( = ?AUTO_224 ?AUTO_225 ) ) ( HOLDING ?AUTO_226 ) ( CLEAR ?AUTO_227 ) ( not ( = ?AUTO_223 ?AUTO_226 ) ) ( not ( = ?AUTO_223 ?AUTO_227 ) ) ( not ( = ?AUTO_224 ?AUTO_226 ) ) ( not ( = ?AUTO_224 ?AUTO_227 ) ) ( not ( = ?AUTO_225 ?AUTO_226 ) ) ( not ( = ?AUTO_225 ?AUTO_227 ) ) ( not ( = ?AUTO_226 ?AUTO_227 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_226 ?AUTO_227 )
      ( MAKE-ON ?AUTO_223 ?AUTO_224 )
      ( MAKE-ON-VERIFY ?AUTO_223 ?AUTO_224 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_232 - BLOCK
      ?AUTO_233 - BLOCK
    )
    :vars
    (
      ?AUTO_236 - BLOCK
      ?AUTO_235 - BLOCK
      ?AUTO_234 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_232 ?AUTO_233 ) ) ( ON ?AUTO_232 ?AUTO_236 ) ( CLEAR ?AUTO_232 ) ( not ( = ?AUTO_232 ?AUTO_236 ) ) ( not ( = ?AUTO_233 ?AUTO_236 ) ) ( CLEAR ?AUTO_235 ) ( not ( = ?AUTO_232 ?AUTO_234 ) ) ( not ( = ?AUTO_232 ?AUTO_235 ) ) ( not ( = ?AUTO_233 ?AUTO_234 ) ) ( not ( = ?AUTO_233 ?AUTO_235 ) ) ( not ( = ?AUTO_236 ?AUTO_234 ) ) ( not ( = ?AUTO_236 ?AUTO_235 ) ) ( not ( = ?AUTO_234 ?AUTO_235 ) ) ( ON ?AUTO_234 ?AUTO_233 ) ( CLEAR ?AUTO_234 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_234 ?AUTO_233 )
      ( MAKE-ON ?AUTO_232 ?AUTO_233 )
      ( MAKE-ON-VERIFY ?AUTO_232 ?AUTO_233 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_237 - BLOCK
      ?AUTO_238 - BLOCK
    )
    :vars
    (
      ?AUTO_241 - BLOCK
      ?AUTO_239 - BLOCK
      ?AUTO_240 - BLOCK
      ?AUTO_242 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_237 ?AUTO_238 ) ) ( ON ?AUTO_237 ?AUTO_241 ) ( CLEAR ?AUTO_237 ) ( not ( = ?AUTO_237 ?AUTO_241 ) ) ( not ( = ?AUTO_238 ?AUTO_241 ) ) ( CLEAR ?AUTO_239 ) ( not ( = ?AUTO_237 ?AUTO_240 ) ) ( not ( = ?AUTO_237 ?AUTO_239 ) ) ( not ( = ?AUTO_238 ?AUTO_240 ) ) ( not ( = ?AUTO_238 ?AUTO_239 ) ) ( not ( = ?AUTO_241 ?AUTO_240 ) ) ( not ( = ?AUTO_241 ?AUTO_239 ) ) ( not ( = ?AUTO_240 ?AUTO_239 ) ) ( ON ?AUTO_240 ?AUTO_238 ) ( CLEAR ?AUTO_240 ) ( HOLDING ?AUTO_242 ) ( not ( = ?AUTO_237 ?AUTO_242 ) ) ( not ( = ?AUTO_238 ?AUTO_242 ) ) ( not ( = ?AUTO_241 ?AUTO_242 ) ) ( not ( = ?AUTO_239 ?AUTO_242 ) ) ( not ( = ?AUTO_240 ?AUTO_242 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_242 )
      ( MAKE-ON ?AUTO_237 ?AUTO_238 )
      ( MAKE-ON-VERIFY ?AUTO_237 ?AUTO_238 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_243 - BLOCK
      ?AUTO_244 - BLOCK
    )
    :vars
    (
      ?AUTO_248 - BLOCK
      ?AUTO_246 - BLOCK
      ?AUTO_245 - BLOCK
      ?AUTO_247 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_243 ?AUTO_244 ) ) ( ON ?AUTO_243 ?AUTO_248 ) ( CLEAR ?AUTO_243 ) ( not ( = ?AUTO_243 ?AUTO_248 ) ) ( not ( = ?AUTO_244 ?AUTO_248 ) ) ( CLEAR ?AUTO_246 ) ( not ( = ?AUTO_243 ?AUTO_245 ) ) ( not ( = ?AUTO_243 ?AUTO_246 ) ) ( not ( = ?AUTO_244 ?AUTO_245 ) ) ( not ( = ?AUTO_244 ?AUTO_246 ) ) ( not ( = ?AUTO_248 ?AUTO_245 ) ) ( not ( = ?AUTO_248 ?AUTO_246 ) ) ( not ( = ?AUTO_245 ?AUTO_246 ) ) ( ON ?AUTO_245 ?AUTO_244 ) ( not ( = ?AUTO_243 ?AUTO_247 ) ) ( not ( = ?AUTO_244 ?AUTO_247 ) ) ( not ( = ?AUTO_248 ?AUTO_247 ) ) ( not ( = ?AUTO_246 ?AUTO_247 ) ) ( not ( = ?AUTO_245 ?AUTO_247 ) ) ( ON ?AUTO_247 ?AUTO_245 ) ( CLEAR ?AUTO_247 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_247 ?AUTO_245 )
      ( MAKE-ON ?AUTO_243 ?AUTO_244 )
      ( MAKE-ON-VERIFY ?AUTO_243 ?AUTO_244 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_249 - BLOCK
      ?AUTO_250 - BLOCK
    )
    :vars
    (
      ?AUTO_252 - BLOCK
      ?AUTO_253 - BLOCK
      ?AUTO_254 - BLOCK
      ?AUTO_251 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_249 ?AUTO_250 ) ) ( not ( = ?AUTO_249 ?AUTO_252 ) ) ( not ( = ?AUTO_250 ?AUTO_252 ) ) ( CLEAR ?AUTO_253 ) ( not ( = ?AUTO_249 ?AUTO_254 ) ) ( not ( = ?AUTO_249 ?AUTO_253 ) ) ( not ( = ?AUTO_250 ?AUTO_254 ) ) ( not ( = ?AUTO_250 ?AUTO_253 ) ) ( not ( = ?AUTO_252 ?AUTO_254 ) ) ( not ( = ?AUTO_252 ?AUTO_253 ) ) ( not ( = ?AUTO_254 ?AUTO_253 ) ) ( ON ?AUTO_254 ?AUTO_250 ) ( not ( = ?AUTO_249 ?AUTO_251 ) ) ( not ( = ?AUTO_250 ?AUTO_251 ) ) ( not ( = ?AUTO_252 ?AUTO_251 ) ) ( not ( = ?AUTO_253 ?AUTO_251 ) ) ( not ( = ?AUTO_254 ?AUTO_251 ) ) ( ON ?AUTO_251 ?AUTO_254 ) ( CLEAR ?AUTO_251 ) ( HOLDING ?AUTO_249 ) ( CLEAR ?AUTO_252 ) )
    :subtasks
    ( ( !STACK ?AUTO_249 ?AUTO_252 )
      ( MAKE-ON ?AUTO_249 ?AUTO_250 )
      ( MAKE-ON-VERIFY ?AUTO_249 ?AUTO_250 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_255 - BLOCK
      ?AUTO_256 - BLOCK
    )
    :vars
    (
      ?AUTO_260 - BLOCK
      ?AUTO_259 - BLOCK
      ?AUTO_257 - BLOCK
      ?AUTO_258 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_255 ?AUTO_256 ) ) ( not ( = ?AUTO_255 ?AUTO_260 ) ) ( not ( = ?AUTO_256 ?AUTO_260 ) ) ( CLEAR ?AUTO_259 ) ( not ( = ?AUTO_255 ?AUTO_257 ) ) ( not ( = ?AUTO_255 ?AUTO_259 ) ) ( not ( = ?AUTO_256 ?AUTO_257 ) ) ( not ( = ?AUTO_256 ?AUTO_259 ) ) ( not ( = ?AUTO_260 ?AUTO_257 ) ) ( not ( = ?AUTO_260 ?AUTO_259 ) ) ( not ( = ?AUTO_257 ?AUTO_259 ) ) ( ON ?AUTO_257 ?AUTO_256 ) ( not ( = ?AUTO_255 ?AUTO_258 ) ) ( not ( = ?AUTO_256 ?AUTO_258 ) ) ( not ( = ?AUTO_260 ?AUTO_258 ) ) ( not ( = ?AUTO_259 ?AUTO_258 ) ) ( not ( = ?AUTO_257 ?AUTO_258 ) ) ( ON ?AUTO_258 ?AUTO_257 ) ( CLEAR ?AUTO_258 ) ( CLEAR ?AUTO_260 ) ( ON-TABLE ?AUTO_255 ) ( CLEAR ?AUTO_255 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_255 )
      ( MAKE-ON ?AUTO_255 ?AUTO_256 )
      ( MAKE-ON-VERIFY ?AUTO_255 ?AUTO_256 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_261 - BLOCK
      ?AUTO_262 - BLOCK
    )
    :vars
    (
      ?AUTO_266 - BLOCK
      ?AUTO_265 - BLOCK
      ?AUTO_264 - BLOCK
      ?AUTO_263 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_261 ?AUTO_262 ) ) ( not ( = ?AUTO_261 ?AUTO_266 ) ) ( not ( = ?AUTO_262 ?AUTO_266 ) ) ( CLEAR ?AUTO_265 ) ( not ( = ?AUTO_261 ?AUTO_264 ) ) ( not ( = ?AUTO_261 ?AUTO_265 ) ) ( not ( = ?AUTO_262 ?AUTO_264 ) ) ( not ( = ?AUTO_262 ?AUTO_265 ) ) ( not ( = ?AUTO_266 ?AUTO_264 ) ) ( not ( = ?AUTO_266 ?AUTO_265 ) ) ( not ( = ?AUTO_264 ?AUTO_265 ) ) ( ON ?AUTO_264 ?AUTO_262 ) ( not ( = ?AUTO_261 ?AUTO_263 ) ) ( not ( = ?AUTO_262 ?AUTO_263 ) ) ( not ( = ?AUTO_266 ?AUTO_263 ) ) ( not ( = ?AUTO_265 ?AUTO_263 ) ) ( not ( = ?AUTO_264 ?AUTO_263 ) ) ( ON ?AUTO_263 ?AUTO_264 ) ( CLEAR ?AUTO_263 ) ( ON-TABLE ?AUTO_261 ) ( CLEAR ?AUTO_261 ) ( HOLDING ?AUTO_266 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_266 )
      ( MAKE-ON ?AUTO_261 ?AUTO_262 )
      ( MAKE-ON-VERIFY ?AUTO_261 ?AUTO_262 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_267 - BLOCK
      ?AUTO_268 - BLOCK
    )
    :vars
    (
      ?AUTO_271 - BLOCK
      ?AUTO_272 - BLOCK
      ?AUTO_269 - BLOCK
      ?AUTO_270 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_267 ?AUTO_268 ) ) ( not ( = ?AUTO_267 ?AUTO_271 ) ) ( not ( = ?AUTO_268 ?AUTO_271 ) ) ( CLEAR ?AUTO_272 ) ( not ( = ?AUTO_267 ?AUTO_269 ) ) ( not ( = ?AUTO_267 ?AUTO_272 ) ) ( not ( = ?AUTO_268 ?AUTO_269 ) ) ( not ( = ?AUTO_268 ?AUTO_272 ) ) ( not ( = ?AUTO_271 ?AUTO_269 ) ) ( not ( = ?AUTO_271 ?AUTO_272 ) ) ( not ( = ?AUTO_269 ?AUTO_272 ) ) ( ON ?AUTO_269 ?AUTO_268 ) ( not ( = ?AUTO_267 ?AUTO_270 ) ) ( not ( = ?AUTO_268 ?AUTO_270 ) ) ( not ( = ?AUTO_271 ?AUTO_270 ) ) ( not ( = ?AUTO_272 ?AUTO_270 ) ) ( not ( = ?AUTO_269 ?AUTO_270 ) ) ( ON ?AUTO_270 ?AUTO_269 ) ( CLEAR ?AUTO_270 ) ( ON-TABLE ?AUTO_267 ) ( ON ?AUTO_271 ?AUTO_267 ) ( CLEAR ?AUTO_271 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_271 ?AUTO_267 )
      ( MAKE-ON ?AUTO_267 ?AUTO_268 )
      ( MAKE-ON-VERIFY ?AUTO_267 ?AUTO_268 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_273 - BLOCK
      ?AUTO_274 - BLOCK
    )
    :vars
    (
      ?AUTO_277 - BLOCK
      ?AUTO_278 - BLOCK
      ?AUTO_276 - BLOCK
      ?AUTO_275 - BLOCK
      ?AUTO_279 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_273 ?AUTO_274 ) ) ( not ( = ?AUTO_273 ?AUTO_277 ) ) ( not ( = ?AUTO_274 ?AUTO_277 ) ) ( CLEAR ?AUTO_278 ) ( not ( = ?AUTO_273 ?AUTO_276 ) ) ( not ( = ?AUTO_273 ?AUTO_278 ) ) ( not ( = ?AUTO_274 ?AUTO_276 ) ) ( not ( = ?AUTO_274 ?AUTO_278 ) ) ( not ( = ?AUTO_277 ?AUTO_276 ) ) ( not ( = ?AUTO_277 ?AUTO_278 ) ) ( not ( = ?AUTO_276 ?AUTO_278 ) ) ( ON ?AUTO_276 ?AUTO_274 ) ( not ( = ?AUTO_273 ?AUTO_275 ) ) ( not ( = ?AUTO_274 ?AUTO_275 ) ) ( not ( = ?AUTO_277 ?AUTO_275 ) ) ( not ( = ?AUTO_278 ?AUTO_275 ) ) ( not ( = ?AUTO_276 ?AUTO_275 ) ) ( ON ?AUTO_275 ?AUTO_276 ) ( CLEAR ?AUTO_275 ) ( ON-TABLE ?AUTO_273 ) ( ON ?AUTO_277 ?AUTO_273 ) ( CLEAR ?AUTO_277 ) ( HOLDING ?AUTO_279 ) ( not ( = ?AUTO_273 ?AUTO_279 ) ) ( not ( = ?AUTO_274 ?AUTO_279 ) ) ( not ( = ?AUTO_277 ?AUTO_279 ) ) ( not ( = ?AUTO_278 ?AUTO_279 ) ) ( not ( = ?AUTO_276 ?AUTO_279 ) ) ( not ( = ?AUTO_275 ?AUTO_279 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_279 )
      ( MAKE-ON ?AUTO_273 ?AUTO_274 )
      ( MAKE-ON-VERIFY ?AUTO_273 ?AUTO_274 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_282 - BLOCK
      ?AUTO_283 - BLOCK
    )
    :vars
    (
      ?AUTO_287 - BLOCK
      ?AUTO_284 - BLOCK
      ?AUTO_286 - BLOCK
      ?AUTO_285 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_282 ?AUTO_283 ) ) ( not ( = ?AUTO_282 ?AUTO_287 ) ) ( not ( = ?AUTO_283 ?AUTO_287 ) ) ( CLEAR ?AUTO_284 ) ( not ( = ?AUTO_282 ?AUTO_286 ) ) ( not ( = ?AUTO_282 ?AUTO_284 ) ) ( not ( = ?AUTO_283 ?AUTO_286 ) ) ( not ( = ?AUTO_283 ?AUTO_284 ) ) ( not ( = ?AUTO_287 ?AUTO_286 ) ) ( not ( = ?AUTO_287 ?AUTO_284 ) ) ( not ( = ?AUTO_286 ?AUTO_284 ) ) ( ON ?AUTO_286 ?AUTO_283 ) ( not ( = ?AUTO_282 ?AUTO_285 ) ) ( not ( = ?AUTO_283 ?AUTO_285 ) ) ( not ( = ?AUTO_287 ?AUTO_285 ) ) ( not ( = ?AUTO_284 ?AUTO_285 ) ) ( not ( = ?AUTO_286 ?AUTO_285 ) ) ( ON-TABLE ?AUTO_282 ) ( ON ?AUTO_287 ?AUTO_282 ) ( CLEAR ?AUTO_287 ) ( HOLDING ?AUTO_285 ) ( CLEAR ?AUTO_286 ) )
    :subtasks
    ( ( !STACK ?AUTO_285 ?AUTO_286 )
      ( MAKE-ON ?AUTO_282 ?AUTO_283 )
      ( MAKE-ON-VERIFY ?AUTO_282 ?AUTO_283 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_288 - BLOCK
      ?AUTO_289 - BLOCK
    )
    :vars
    (
      ?AUTO_292 - BLOCK
      ?AUTO_293 - BLOCK
      ?AUTO_290 - BLOCK
      ?AUTO_291 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_288 ?AUTO_289 ) ) ( not ( = ?AUTO_288 ?AUTO_292 ) ) ( not ( = ?AUTO_289 ?AUTO_292 ) ) ( not ( = ?AUTO_288 ?AUTO_293 ) ) ( not ( = ?AUTO_288 ?AUTO_290 ) ) ( not ( = ?AUTO_289 ?AUTO_293 ) ) ( not ( = ?AUTO_289 ?AUTO_290 ) ) ( not ( = ?AUTO_292 ?AUTO_293 ) ) ( not ( = ?AUTO_292 ?AUTO_290 ) ) ( not ( = ?AUTO_293 ?AUTO_290 ) ) ( ON ?AUTO_293 ?AUTO_289 ) ( not ( = ?AUTO_288 ?AUTO_291 ) ) ( not ( = ?AUTO_289 ?AUTO_291 ) ) ( not ( = ?AUTO_292 ?AUTO_291 ) ) ( not ( = ?AUTO_290 ?AUTO_291 ) ) ( not ( = ?AUTO_293 ?AUTO_291 ) ) ( ON-TABLE ?AUTO_288 ) ( ON ?AUTO_292 ?AUTO_288 ) ( CLEAR ?AUTO_292 ) ( CLEAR ?AUTO_293 ) ( ON ?AUTO_291 ?AUTO_290 ) ( CLEAR ?AUTO_291 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_291 ?AUTO_290 )
      ( MAKE-ON ?AUTO_288 ?AUTO_289 )
      ( MAKE-ON-VERIFY ?AUTO_288 ?AUTO_289 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_296 - BLOCK
      ?AUTO_297 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_296 ) ( CLEAR ?AUTO_297 ) ( not ( = ?AUTO_296 ?AUTO_297 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_296 ?AUTO_297 )
      ( MAKE-ON-VERIFY ?AUTO_296 ?AUTO_297 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_298 - BLOCK
      ?AUTO_299 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_299 ) ( not ( = ?AUTO_298 ?AUTO_299 ) ) ( ON-TABLE ?AUTO_298 ) ( CLEAR ?AUTO_298 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_298 )
      ( MAKE-ON ?AUTO_298 ?AUTO_299 )
      ( MAKE-ON-VERIFY ?AUTO_298 ?AUTO_299 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_300 - BLOCK
      ?AUTO_301 - BLOCK
    )
    :vars
    (
      ?AUTO_302 - BLOCK
      ?AUTO_303 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_301 ) ( not ( = ?AUTO_300 ?AUTO_301 ) ) ( ON-TABLE ?AUTO_300 ) ( CLEAR ?AUTO_300 ) ( HOLDING ?AUTO_302 ) ( CLEAR ?AUTO_303 ) ( not ( = ?AUTO_300 ?AUTO_302 ) ) ( not ( = ?AUTO_300 ?AUTO_303 ) ) ( not ( = ?AUTO_301 ?AUTO_302 ) ) ( not ( = ?AUTO_301 ?AUTO_303 ) ) ( not ( = ?AUTO_302 ?AUTO_303 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_302 ?AUTO_303 )
      ( MAKE-ON ?AUTO_300 ?AUTO_301 )
      ( MAKE-ON-VERIFY ?AUTO_300 ?AUTO_301 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_304 - BLOCK
      ?AUTO_305 - BLOCK
    )
    :vars
    (
      ?AUTO_306 - BLOCK
      ?AUTO_307 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_305 ) ( not ( = ?AUTO_304 ?AUTO_305 ) ) ( ON-TABLE ?AUTO_304 ) ( CLEAR ?AUTO_306 ) ( not ( = ?AUTO_304 ?AUTO_307 ) ) ( not ( = ?AUTO_304 ?AUTO_306 ) ) ( not ( = ?AUTO_305 ?AUTO_307 ) ) ( not ( = ?AUTO_305 ?AUTO_306 ) ) ( not ( = ?AUTO_307 ?AUTO_306 ) ) ( ON ?AUTO_307 ?AUTO_304 ) ( CLEAR ?AUTO_307 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_307 ?AUTO_304 )
      ( MAKE-ON ?AUTO_304 ?AUTO_305 )
      ( MAKE-ON-VERIFY ?AUTO_304 ?AUTO_305 ) )
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
      ?AUTO_311 - BLOCK
      ?AUTO_312 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_309 ) ( not ( = ?AUTO_308 ?AUTO_309 ) ) ( ON-TABLE ?AUTO_308 ) ( not ( = ?AUTO_308 ?AUTO_310 ) ) ( not ( = ?AUTO_308 ?AUTO_311 ) ) ( not ( = ?AUTO_309 ?AUTO_310 ) ) ( not ( = ?AUTO_309 ?AUTO_311 ) ) ( not ( = ?AUTO_310 ?AUTO_311 ) ) ( ON ?AUTO_310 ?AUTO_308 ) ( CLEAR ?AUTO_310 ) ( HOLDING ?AUTO_311 ) ( CLEAR ?AUTO_312 ) ( not ( = ?AUTO_308 ?AUTO_312 ) ) ( not ( = ?AUTO_309 ?AUTO_312 ) ) ( not ( = ?AUTO_310 ?AUTO_312 ) ) ( not ( = ?AUTO_311 ?AUTO_312 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_311 ?AUTO_312 )
      ( MAKE-ON ?AUTO_308 ?AUTO_309 )
      ( MAKE-ON-VERIFY ?AUTO_308 ?AUTO_309 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_313 - BLOCK
      ?AUTO_314 - BLOCK
    )
    :vars
    (
      ?AUTO_315 - BLOCK
      ?AUTO_316 - BLOCK
      ?AUTO_317 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_313 ?AUTO_314 ) ) ( ON-TABLE ?AUTO_313 ) ( not ( = ?AUTO_313 ?AUTO_315 ) ) ( not ( = ?AUTO_313 ?AUTO_316 ) ) ( not ( = ?AUTO_314 ?AUTO_315 ) ) ( not ( = ?AUTO_314 ?AUTO_316 ) ) ( not ( = ?AUTO_315 ?AUTO_316 ) ) ( ON ?AUTO_315 ?AUTO_313 ) ( CLEAR ?AUTO_315 ) ( CLEAR ?AUTO_317 ) ( not ( = ?AUTO_313 ?AUTO_317 ) ) ( not ( = ?AUTO_314 ?AUTO_317 ) ) ( not ( = ?AUTO_315 ?AUTO_317 ) ) ( not ( = ?AUTO_316 ?AUTO_317 ) ) ( ON ?AUTO_316 ?AUTO_314 ) ( CLEAR ?AUTO_316 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_316 ?AUTO_314 )
      ( MAKE-ON ?AUTO_313 ?AUTO_314 )
      ( MAKE-ON-VERIFY ?AUTO_313 ?AUTO_314 ) )
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
      ?AUTO_321 - BLOCK
      ?AUTO_322 - BLOCK
      ?AUTO_323 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_318 ?AUTO_319 ) ) ( ON-TABLE ?AUTO_318 ) ( not ( = ?AUTO_318 ?AUTO_320 ) ) ( not ( = ?AUTO_318 ?AUTO_321 ) ) ( not ( = ?AUTO_319 ?AUTO_320 ) ) ( not ( = ?AUTO_319 ?AUTO_321 ) ) ( not ( = ?AUTO_320 ?AUTO_321 ) ) ( ON ?AUTO_320 ?AUTO_318 ) ( CLEAR ?AUTO_320 ) ( not ( = ?AUTO_318 ?AUTO_322 ) ) ( not ( = ?AUTO_319 ?AUTO_322 ) ) ( not ( = ?AUTO_320 ?AUTO_322 ) ) ( not ( = ?AUTO_321 ?AUTO_322 ) ) ( ON ?AUTO_321 ?AUTO_319 ) ( CLEAR ?AUTO_321 ) ( HOLDING ?AUTO_322 ) ( CLEAR ?AUTO_323 ) ( not ( = ?AUTO_318 ?AUTO_323 ) ) ( not ( = ?AUTO_319 ?AUTO_323 ) ) ( not ( = ?AUTO_320 ?AUTO_323 ) ) ( not ( = ?AUTO_321 ?AUTO_323 ) ) ( not ( = ?AUTO_322 ?AUTO_323 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_322 ?AUTO_323 )
      ( MAKE-ON ?AUTO_318 ?AUTO_319 )
      ( MAKE-ON-VERIFY ?AUTO_318 ?AUTO_319 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_328 - BLOCK
      ?AUTO_329 - BLOCK
    )
    :vars
    (
      ?AUTO_332 - BLOCK
      ?AUTO_330 - BLOCK
      ?AUTO_331 - BLOCK
      ?AUTO_333 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_328 ?AUTO_329 ) ) ( ON-TABLE ?AUTO_328 ) ( not ( = ?AUTO_328 ?AUTO_332 ) ) ( not ( = ?AUTO_328 ?AUTO_330 ) ) ( not ( = ?AUTO_329 ?AUTO_332 ) ) ( not ( = ?AUTO_329 ?AUTO_330 ) ) ( not ( = ?AUTO_332 ?AUTO_330 ) ) ( ON ?AUTO_332 ?AUTO_328 ) ( CLEAR ?AUTO_332 ) ( not ( = ?AUTO_328 ?AUTO_331 ) ) ( not ( = ?AUTO_329 ?AUTO_331 ) ) ( not ( = ?AUTO_332 ?AUTO_331 ) ) ( not ( = ?AUTO_330 ?AUTO_331 ) ) ( ON ?AUTO_330 ?AUTO_329 ) ( CLEAR ?AUTO_333 ) ( not ( = ?AUTO_328 ?AUTO_333 ) ) ( not ( = ?AUTO_329 ?AUTO_333 ) ) ( not ( = ?AUTO_332 ?AUTO_333 ) ) ( not ( = ?AUTO_330 ?AUTO_333 ) ) ( not ( = ?AUTO_331 ?AUTO_333 ) ) ( ON ?AUTO_331 ?AUTO_330 ) ( CLEAR ?AUTO_331 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_331 ?AUTO_330 )
      ( MAKE-ON ?AUTO_328 ?AUTO_329 )
      ( MAKE-ON-VERIFY ?AUTO_328 ?AUTO_329 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_334 - BLOCK
      ?AUTO_335 - BLOCK
    )
    :vars
    (
      ?AUTO_339 - BLOCK
      ?AUTO_336 - BLOCK
      ?AUTO_337 - BLOCK
      ?AUTO_338 - BLOCK
      ?AUTO_340 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_334 ?AUTO_335 ) ) ( ON-TABLE ?AUTO_334 ) ( not ( = ?AUTO_334 ?AUTO_339 ) ) ( not ( = ?AUTO_334 ?AUTO_336 ) ) ( not ( = ?AUTO_335 ?AUTO_339 ) ) ( not ( = ?AUTO_335 ?AUTO_336 ) ) ( not ( = ?AUTO_339 ?AUTO_336 ) ) ( ON ?AUTO_339 ?AUTO_334 ) ( CLEAR ?AUTO_339 ) ( not ( = ?AUTO_334 ?AUTO_337 ) ) ( not ( = ?AUTO_335 ?AUTO_337 ) ) ( not ( = ?AUTO_339 ?AUTO_337 ) ) ( not ( = ?AUTO_336 ?AUTO_337 ) ) ( ON ?AUTO_336 ?AUTO_335 ) ( CLEAR ?AUTO_338 ) ( not ( = ?AUTO_334 ?AUTO_338 ) ) ( not ( = ?AUTO_335 ?AUTO_338 ) ) ( not ( = ?AUTO_339 ?AUTO_338 ) ) ( not ( = ?AUTO_336 ?AUTO_338 ) ) ( not ( = ?AUTO_337 ?AUTO_338 ) ) ( ON ?AUTO_337 ?AUTO_336 ) ( CLEAR ?AUTO_337 ) ( HOLDING ?AUTO_340 ) ( not ( = ?AUTO_334 ?AUTO_340 ) ) ( not ( = ?AUTO_335 ?AUTO_340 ) ) ( not ( = ?AUTO_339 ?AUTO_340 ) ) ( not ( = ?AUTO_336 ?AUTO_340 ) ) ( not ( = ?AUTO_337 ?AUTO_340 ) ) ( not ( = ?AUTO_338 ?AUTO_340 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_340 )
      ( MAKE-ON ?AUTO_334 ?AUTO_335 )
      ( MAKE-ON-VERIFY ?AUTO_334 ?AUTO_335 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_341 - BLOCK
      ?AUTO_342 - BLOCK
    )
    :vars
    (
      ?AUTO_346 - BLOCK
      ?AUTO_344 - BLOCK
      ?AUTO_345 - BLOCK
      ?AUTO_343 - BLOCK
      ?AUTO_347 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_341 ?AUTO_342 ) ) ( ON-TABLE ?AUTO_341 ) ( not ( = ?AUTO_341 ?AUTO_346 ) ) ( not ( = ?AUTO_341 ?AUTO_344 ) ) ( not ( = ?AUTO_342 ?AUTO_346 ) ) ( not ( = ?AUTO_342 ?AUTO_344 ) ) ( not ( = ?AUTO_346 ?AUTO_344 ) ) ( ON ?AUTO_346 ?AUTO_341 ) ( CLEAR ?AUTO_346 ) ( not ( = ?AUTO_341 ?AUTO_345 ) ) ( not ( = ?AUTO_342 ?AUTO_345 ) ) ( not ( = ?AUTO_346 ?AUTO_345 ) ) ( not ( = ?AUTO_344 ?AUTO_345 ) ) ( ON ?AUTO_344 ?AUTO_342 ) ( CLEAR ?AUTO_343 ) ( not ( = ?AUTO_341 ?AUTO_343 ) ) ( not ( = ?AUTO_342 ?AUTO_343 ) ) ( not ( = ?AUTO_346 ?AUTO_343 ) ) ( not ( = ?AUTO_344 ?AUTO_343 ) ) ( not ( = ?AUTO_345 ?AUTO_343 ) ) ( ON ?AUTO_345 ?AUTO_344 ) ( not ( = ?AUTO_341 ?AUTO_347 ) ) ( not ( = ?AUTO_342 ?AUTO_347 ) ) ( not ( = ?AUTO_346 ?AUTO_347 ) ) ( not ( = ?AUTO_344 ?AUTO_347 ) ) ( not ( = ?AUTO_345 ?AUTO_347 ) ) ( not ( = ?AUTO_343 ?AUTO_347 ) ) ( ON ?AUTO_347 ?AUTO_345 ) ( CLEAR ?AUTO_347 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_347 ?AUTO_345 )
      ( MAKE-ON ?AUTO_341 ?AUTO_342 )
      ( MAKE-ON-VERIFY ?AUTO_341 ?AUTO_342 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_348 - BLOCK
      ?AUTO_349 - BLOCK
    )
    :vars
    (
      ?AUTO_351 - BLOCK
      ?AUTO_354 - BLOCK
      ?AUTO_353 - BLOCK
      ?AUTO_352 - BLOCK
      ?AUTO_350 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_348 ?AUTO_349 ) ) ( ON-TABLE ?AUTO_348 ) ( not ( = ?AUTO_348 ?AUTO_351 ) ) ( not ( = ?AUTO_348 ?AUTO_354 ) ) ( not ( = ?AUTO_349 ?AUTO_351 ) ) ( not ( = ?AUTO_349 ?AUTO_354 ) ) ( not ( = ?AUTO_351 ?AUTO_354 ) ) ( not ( = ?AUTO_348 ?AUTO_353 ) ) ( not ( = ?AUTO_349 ?AUTO_353 ) ) ( not ( = ?AUTO_351 ?AUTO_353 ) ) ( not ( = ?AUTO_354 ?AUTO_353 ) ) ( ON ?AUTO_354 ?AUTO_349 ) ( CLEAR ?AUTO_352 ) ( not ( = ?AUTO_348 ?AUTO_352 ) ) ( not ( = ?AUTO_349 ?AUTO_352 ) ) ( not ( = ?AUTO_351 ?AUTO_352 ) ) ( not ( = ?AUTO_354 ?AUTO_352 ) ) ( not ( = ?AUTO_353 ?AUTO_352 ) ) ( ON ?AUTO_353 ?AUTO_354 ) ( not ( = ?AUTO_348 ?AUTO_350 ) ) ( not ( = ?AUTO_349 ?AUTO_350 ) ) ( not ( = ?AUTO_351 ?AUTO_350 ) ) ( not ( = ?AUTO_354 ?AUTO_350 ) ) ( not ( = ?AUTO_353 ?AUTO_350 ) ) ( not ( = ?AUTO_352 ?AUTO_350 ) ) ( ON ?AUTO_350 ?AUTO_353 ) ( CLEAR ?AUTO_350 ) ( HOLDING ?AUTO_351 ) ( CLEAR ?AUTO_348 ) )
    :subtasks
    ( ( !STACK ?AUTO_351 ?AUTO_348 )
      ( MAKE-ON ?AUTO_348 ?AUTO_349 )
      ( MAKE-ON-VERIFY ?AUTO_348 ?AUTO_349 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_355 - BLOCK
      ?AUTO_356 - BLOCK
    )
    :vars
    (
      ?AUTO_358 - BLOCK
      ?AUTO_359 - BLOCK
      ?AUTO_361 - BLOCK
      ?AUTO_360 - BLOCK
      ?AUTO_357 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_355 ?AUTO_356 ) ) ( ON-TABLE ?AUTO_355 ) ( not ( = ?AUTO_355 ?AUTO_358 ) ) ( not ( = ?AUTO_355 ?AUTO_359 ) ) ( not ( = ?AUTO_356 ?AUTO_358 ) ) ( not ( = ?AUTO_356 ?AUTO_359 ) ) ( not ( = ?AUTO_358 ?AUTO_359 ) ) ( not ( = ?AUTO_355 ?AUTO_361 ) ) ( not ( = ?AUTO_356 ?AUTO_361 ) ) ( not ( = ?AUTO_358 ?AUTO_361 ) ) ( not ( = ?AUTO_359 ?AUTO_361 ) ) ( ON ?AUTO_359 ?AUTO_356 ) ( CLEAR ?AUTO_360 ) ( not ( = ?AUTO_355 ?AUTO_360 ) ) ( not ( = ?AUTO_356 ?AUTO_360 ) ) ( not ( = ?AUTO_358 ?AUTO_360 ) ) ( not ( = ?AUTO_359 ?AUTO_360 ) ) ( not ( = ?AUTO_361 ?AUTO_360 ) ) ( ON ?AUTO_361 ?AUTO_359 ) ( not ( = ?AUTO_355 ?AUTO_357 ) ) ( not ( = ?AUTO_356 ?AUTO_357 ) ) ( not ( = ?AUTO_358 ?AUTO_357 ) ) ( not ( = ?AUTO_359 ?AUTO_357 ) ) ( not ( = ?AUTO_361 ?AUTO_357 ) ) ( not ( = ?AUTO_360 ?AUTO_357 ) ) ( ON ?AUTO_357 ?AUTO_361 ) ( CLEAR ?AUTO_357 ) ( CLEAR ?AUTO_355 ) ( ON-TABLE ?AUTO_358 ) ( CLEAR ?AUTO_358 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_358 )
      ( MAKE-ON ?AUTO_355 ?AUTO_356 )
      ( MAKE-ON-VERIFY ?AUTO_355 ?AUTO_356 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_362 - BLOCK
      ?AUTO_363 - BLOCK
    )
    :vars
    (
      ?AUTO_365 - BLOCK
      ?AUTO_367 - BLOCK
      ?AUTO_366 - BLOCK
      ?AUTO_368 - BLOCK
      ?AUTO_364 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_362 ?AUTO_363 ) ) ( not ( = ?AUTO_362 ?AUTO_365 ) ) ( not ( = ?AUTO_362 ?AUTO_367 ) ) ( not ( = ?AUTO_363 ?AUTO_365 ) ) ( not ( = ?AUTO_363 ?AUTO_367 ) ) ( not ( = ?AUTO_365 ?AUTO_367 ) ) ( not ( = ?AUTO_362 ?AUTO_366 ) ) ( not ( = ?AUTO_363 ?AUTO_366 ) ) ( not ( = ?AUTO_365 ?AUTO_366 ) ) ( not ( = ?AUTO_367 ?AUTO_366 ) ) ( ON ?AUTO_367 ?AUTO_363 ) ( CLEAR ?AUTO_368 ) ( not ( = ?AUTO_362 ?AUTO_368 ) ) ( not ( = ?AUTO_363 ?AUTO_368 ) ) ( not ( = ?AUTO_365 ?AUTO_368 ) ) ( not ( = ?AUTO_367 ?AUTO_368 ) ) ( not ( = ?AUTO_366 ?AUTO_368 ) ) ( ON ?AUTO_366 ?AUTO_367 ) ( not ( = ?AUTO_362 ?AUTO_364 ) ) ( not ( = ?AUTO_363 ?AUTO_364 ) ) ( not ( = ?AUTO_365 ?AUTO_364 ) ) ( not ( = ?AUTO_367 ?AUTO_364 ) ) ( not ( = ?AUTO_366 ?AUTO_364 ) ) ( not ( = ?AUTO_368 ?AUTO_364 ) ) ( ON ?AUTO_364 ?AUTO_366 ) ( CLEAR ?AUTO_364 ) ( ON-TABLE ?AUTO_365 ) ( CLEAR ?AUTO_365 ) ( HOLDING ?AUTO_362 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_362 )
      ( MAKE-ON ?AUTO_362 ?AUTO_363 )
      ( MAKE-ON-VERIFY ?AUTO_362 ?AUTO_363 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_369 - BLOCK
      ?AUTO_370 - BLOCK
    )
    :vars
    (
      ?AUTO_374 - BLOCK
      ?AUTO_371 - BLOCK
      ?AUTO_372 - BLOCK
      ?AUTO_373 - BLOCK
      ?AUTO_375 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_369 ?AUTO_370 ) ) ( not ( = ?AUTO_369 ?AUTO_374 ) ) ( not ( = ?AUTO_369 ?AUTO_371 ) ) ( not ( = ?AUTO_370 ?AUTO_374 ) ) ( not ( = ?AUTO_370 ?AUTO_371 ) ) ( not ( = ?AUTO_374 ?AUTO_371 ) ) ( not ( = ?AUTO_369 ?AUTO_372 ) ) ( not ( = ?AUTO_370 ?AUTO_372 ) ) ( not ( = ?AUTO_374 ?AUTO_372 ) ) ( not ( = ?AUTO_371 ?AUTO_372 ) ) ( ON ?AUTO_371 ?AUTO_370 ) ( CLEAR ?AUTO_373 ) ( not ( = ?AUTO_369 ?AUTO_373 ) ) ( not ( = ?AUTO_370 ?AUTO_373 ) ) ( not ( = ?AUTO_374 ?AUTO_373 ) ) ( not ( = ?AUTO_371 ?AUTO_373 ) ) ( not ( = ?AUTO_372 ?AUTO_373 ) ) ( ON ?AUTO_372 ?AUTO_371 ) ( not ( = ?AUTO_369 ?AUTO_375 ) ) ( not ( = ?AUTO_370 ?AUTO_375 ) ) ( not ( = ?AUTO_374 ?AUTO_375 ) ) ( not ( = ?AUTO_371 ?AUTO_375 ) ) ( not ( = ?AUTO_372 ?AUTO_375 ) ) ( not ( = ?AUTO_373 ?AUTO_375 ) ) ( ON ?AUTO_375 ?AUTO_372 ) ( CLEAR ?AUTO_375 ) ( ON-TABLE ?AUTO_374 ) ( ON ?AUTO_369 ?AUTO_374 ) ( CLEAR ?AUTO_369 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_369 ?AUTO_374 )
      ( MAKE-ON ?AUTO_369 ?AUTO_370 )
      ( MAKE-ON-VERIFY ?AUTO_369 ?AUTO_370 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_376 - BLOCK
      ?AUTO_377 - BLOCK
    )
    :vars
    (
      ?AUTO_382 - BLOCK
      ?AUTO_380 - BLOCK
      ?AUTO_381 - BLOCK
      ?AUTO_379 - BLOCK
      ?AUTO_378 - BLOCK
      ?AUTO_383 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_376 ?AUTO_377 ) ) ( not ( = ?AUTO_376 ?AUTO_382 ) ) ( not ( = ?AUTO_376 ?AUTO_380 ) ) ( not ( = ?AUTO_377 ?AUTO_382 ) ) ( not ( = ?AUTO_377 ?AUTO_380 ) ) ( not ( = ?AUTO_382 ?AUTO_380 ) ) ( not ( = ?AUTO_376 ?AUTO_381 ) ) ( not ( = ?AUTO_377 ?AUTO_381 ) ) ( not ( = ?AUTO_382 ?AUTO_381 ) ) ( not ( = ?AUTO_380 ?AUTO_381 ) ) ( ON ?AUTO_380 ?AUTO_377 ) ( CLEAR ?AUTO_379 ) ( not ( = ?AUTO_376 ?AUTO_379 ) ) ( not ( = ?AUTO_377 ?AUTO_379 ) ) ( not ( = ?AUTO_382 ?AUTO_379 ) ) ( not ( = ?AUTO_380 ?AUTO_379 ) ) ( not ( = ?AUTO_381 ?AUTO_379 ) ) ( ON ?AUTO_381 ?AUTO_380 ) ( not ( = ?AUTO_376 ?AUTO_378 ) ) ( not ( = ?AUTO_377 ?AUTO_378 ) ) ( not ( = ?AUTO_382 ?AUTO_378 ) ) ( not ( = ?AUTO_380 ?AUTO_378 ) ) ( not ( = ?AUTO_381 ?AUTO_378 ) ) ( not ( = ?AUTO_379 ?AUTO_378 ) ) ( ON ?AUTO_378 ?AUTO_381 ) ( CLEAR ?AUTO_378 ) ( ON-TABLE ?AUTO_382 ) ( ON ?AUTO_376 ?AUTO_382 ) ( CLEAR ?AUTO_376 ) ( HOLDING ?AUTO_383 ) ( not ( = ?AUTO_376 ?AUTO_383 ) ) ( not ( = ?AUTO_377 ?AUTO_383 ) ) ( not ( = ?AUTO_382 ?AUTO_383 ) ) ( not ( = ?AUTO_380 ?AUTO_383 ) ) ( not ( = ?AUTO_381 ?AUTO_383 ) ) ( not ( = ?AUTO_379 ?AUTO_383 ) ) ( not ( = ?AUTO_378 ?AUTO_383 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_383 )
      ( MAKE-ON ?AUTO_376 ?AUTO_377 )
      ( MAKE-ON-VERIFY ?AUTO_376 ?AUTO_377 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_386 - BLOCK
      ?AUTO_387 - BLOCK
    )
    :vars
    (
      ?AUTO_388 - BLOCK
      ?AUTO_392 - BLOCK
      ?AUTO_390 - BLOCK
      ?AUTO_391 - BLOCK
      ?AUTO_389 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_386 ?AUTO_387 ) ) ( not ( = ?AUTO_386 ?AUTO_388 ) ) ( not ( = ?AUTO_386 ?AUTO_392 ) ) ( not ( = ?AUTO_387 ?AUTO_388 ) ) ( not ( = ?AUTO_387 ?AUTO_392 ) ) ( not ( = ?AUTO_388 ?AUTO_392 ) ) ( not ( = ?AUTO_386 ?AUTO_390 ) ) ( not ( = ?AUTO_387 ?AUTO_390 ) ) ( not ( = ?AUTO_388 ?AUTO_390 ) ) ( not ( = ?AUTO_392 ?AUTO_390 ) ) ( ON ?AUTO_392 ?AUTO_387 ) ( CLEAR ?AUTO_391 ) ( not ( = ?AUTO_386 ?AUTO_391 ) ) ( not ( = ?AUTO_387 ?AUTO_391 ) ) ( not ( = ?AUTO_388 ?AUTO_391 ) ) ( not ( = ?AUTO_392 ?AUTO_391 ) ) ( not ( = ?AUTO_390 ?AUTO_391 ) ) ( ON ?AUTO_390 ?AUTO_392 ) ( not ( = ?AUTO_386 ?AUTO_389 ) ) ( not ( = ?AUTO_387 ?AUTO_389 ) ) ( not ( = ?AUTO_388 ?AUTO_389 ) ) ( not ( = ?AUTO_392 ?AUTO_389 ) ) ( not ( = ?AUTO_390 ?AUTO_389 ) ) ( not ( = ?AUTO_391 ?AUTO_389 ) ) ( ON-TABLE ?AUTO_388 ) ( ON ?AUTO_386 ?AUTO_388 ) ( CLEAR ?AUTO_386 ) ( HOLDING ?AUTO_389 ) ( CLEAR ?AUTO_390 ) )
    :subtasks
    ( ( !STACK ?AUTO_389 ?AUTO_390 )
      ( MAKE-ON ?AUTO_386 ?AUTO_387 )
      ( MAKE-ON-VERIFY ?AUTO_386 ?AUTO_387 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_397 - BLOCK
      ?AUTO_398 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_397 ) ( CLEAR ?AUTO_398 ) ( not ( = ?AUTO_397 ?AUTO_398 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_397 ?AUTO_398 )
      ( MAKE-ON-VERIFY ?AUTO_397 ?AUTO_398 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_399 - BLOCK
      ?AUTO_400 - BLOCK
    )
    :vars
    (
      ?AUTO_401 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_400 ) ( not ( = ?AUTO_399 ?AUTO_400 ) ) ( ON ?AUTO_399 ?AUTO_401 ) ( CLEAR ?AUTO_399 ) ( HAND-EMPTY ) ( not ( = ?AUTO_399 ?AUTO_401 ) ) ( not ( = ?AUTO_400 ?AUTO_401 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_399 ?AUTO_401 )
      ( MAKE-ON ?AUTO_399 ?AUTO_400 )
      ( MAKE-ON-VERIFY ?AUTO_399 ?AUTO_400 ) )
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
    )
    :precondition
    ( and ( not ( = ?AUTO_402 ?AUTO_403 ) ) ( ON ?AUTO_402 ?AUTO_404 ) ( CLEAR ?AUTO_402 ) ( not ( = ?AUTO_402 ?AUTO_404 ) ) ( not ( = ?AUTO_403 ?AUTO_404 ) ) ( HOLDING ?AUTO_403 ) ( CLEAR ?AUTO_405 ) ( not ( = ?AUTO_402 ?AUTO_405 ) ) ( not ( = ?AUTO_403 ?AUTO_405 ) ) ( not ( = ?AUTO_404 ?AUTO_405 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_403 ?AUTO_405 )
      ( MAKE-ON ?AUTO_402 ?AUTO_403 )
      ( MAKE-ON-VERIFY ?AUTO_402 ?AUTO_403 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_407 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_407 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_407 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_407 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_408 - BLOCK
    )
    :vars
    (
      ?AUTO_409 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_408 ?AUTO_409 ) ( CLEAR ?AUTO_408 ) ( HAND-EMPTY ) ( not ( = ?AUTO_408 ?AUTO_409 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_408 ?AUTO_409 )
      ( MAKE-ON-TABLE ?AUTO_408 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_408 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_411 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_411 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_411 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_411 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_412 - BLOCK
    )
    :vars
    (
      ?AUTO_413 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_412 ?AUTO_413 ) ( CLEAR ?AUTO_412 ) ( HAND-EMPTY ) ( not ( = ?AUTO_412 ?AUTO_413 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_412 ?AUTO_413 )
      ( MAKE-ON-TABLE ?AUTO_412 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_412 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_414 - BLOCK
    )
    :vars
    (
      ?AUTO_415 - BLOCK
      ?AUTO_416 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_414 ?AUTO_415 ) ( CLEAR ?AUTO_414 ) ( not ( = ?AUTO_414 ?AUTO_415 ) ) ( HOLDING ?AUTO_416 ) ( not ( = ?AUTO_414 ?AUTO_416 ) ) ( not ( = ?AUTO_415 ?AUTO_416 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_416 )
      ( MAKE-ON-TABLE ?AUTO_414 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_414 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_419 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_419 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_419 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_419 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_420 - BLOCK
    )
    :vars
    (
      ?AUTO_421 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_420 ?AUTO_421 ) ( CLEAR ?AUTO_420 ) ( HAND-EMPTY ) ( not ( = ?AUTO_420 ?AUTO_421 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_420 ?AUTO_421 )
      ( MAKE-ON-TABLE ?AUTO_420 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_420 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_422 - BLOCK
    )
    :vars
    (
      ?AUTO_423 - BLOCK
      ?AUTO_424 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_422 ?AUTO_423 ) ( CLEAR ?AUTO_422 ) ( not ( = ?AUTO_422 ?AUTO_423 ) ) ( HOLDING ?AUTO_424 ) ( not ( = ?AUTO_422 ?AUTO_424 ) ) ( not ( = ?AUTO_423 ?AUTO_424 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_424 )
      ( MAKE-ON-TABLE ?AUTO_422 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_422 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_425 - BLOCK
    )
    :vars
    (
      ?AUTO_426 - BLOCK
      ?AUTO_427 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_425 ?AUTO_426 ) ( not ( = ?AUTO_425 ?AUTO_426 ) ) ( not ( = ?AUTO_425 ?AUTO_427 ) ) ( not ( = ?AUTO_426 ?AUTO_427 ) ) ( ON ?AUTO_427 ?AUTO_425 ) ( CLEAR ?AUTO_427 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_427 ?AUTO_425 )
      ( MAKE-ON-TABLE ?AUTO_425 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_425 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_428 - BLOCK
    )
    :vars
    (
      ?AUTO_429 - BLOCK
      ?AUTO_430 - BLOCK
      ?AUTO_431 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_428 ?AUTO_429 ) ( not ( = ?AUTO_428 ?AUTO_429 ) ) ( not ( = ?AUTO_428 ?AUTO_430 ) ) ( not ( = ?AUTO_429 ?AUTO_430 ) ) ( ON ?AUTO_430 ?AUTO_428 ) ( CLEAR ?AUTO_430 ) ( HOLDING ?AUTO_431 ) ( not ( = ?AUTO_428 ?AUTO_431 ) ) ( not ( = ?AUTO_429 ?AUTO_431 ) ) ( not ( = ?AUTO_430 ?AUTO_431 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_431 )
      ( MAKE-ON-TABLE ?AUTO_428 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_428 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_435 - BLOCK
      ?AUTO_436 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_435 ) ( CLEAR ?AUTO_436 ) ( not ( = ?AUTO_435 ?AUTO_436 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_435 ?AUTO_436 )
      ( MAKE-ON-VERIFY ?AUTO_435 ?AUTO_436 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_437 - BLOCK
      ?AUTO_438 - BLOCK
    )
    :vars
    (
      ?AUTO_439 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_438 ) ( not ( = ?AUTO_437 ?AUTO_438 ) ) ( ON ?AUTO_437 ?AUTO_439 ) ( CLEAR ?AUTO_437 ) ( HAND-EMPTY ) ( not ( = ?AUTO_437 ?AUTO_439 ) ) ( not ( = ?AUTO_438 ?AUTO_439 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_437 ?AUTO_439 )
      ( MAKE-ON ?AUTO_437 ?AUTO_438 )
      ( MAKE-ON-VERIFY ?AUTO_437 ?AUTO_438 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_440 - BLOCK
      ?AUTO_441 - BLOCK
    )
    :vars
    (
      ?AUTO_442 - BLOCK
      ?AUTO_443 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_441 ) ( not ( = ?AUTO_440 ?AUTO_441 ) ) ( ON ?AUTO_440 ?AUTO_442 ) ( CLEAR ?AUTO_440 ) ( not ( = ?AUTO_440 ?AUTO_442 ) ) ( not ( = ?AUTO_441 ?AUTO_442 ) ) ( HOLDING ?AUTO_443 ) ( not ( = ?AUTO_440 ?AUTO_443 ) ) ( not ( = ?AUTO_441 ?AUTO_443 ) ) ( not ( = ?AUTO_442 ?AUTO_443 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_443 )
      ( MAKE-ON ?AUTO_440 ?AUTO_441 )
      ( MAKE-ON-VERIFY ?AUTO_440 ?AUTO_441 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_444 - BLOCK
      ?AUTO_445 - BLOCK
    )
    :vars
    (
      ?AUTO_446 - BLOCK
      ?AUTO_447 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_445 ) ( not ( = ?AUTO_444 ?AUTO_445 ) ) ( ON ?AUTO_444 ?AUTO_446 ) ( not ( = ?AUTO_444 ?AUTO_446 ) ) ( not ( = ?AUTO_445 ?AUTO_446 ) ) ( not ( = ?AUTO_444 ?AUTO_447 ) ) ( not ( = ?AUTO_445 ?AUTO_447 ) ) ( not ( = ?AUTO_446 ?AUTO_447 ) ) ( ON ?AUTO_447 ?AUTO_444 ) ( CLEAR ?AUTO_447 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_447 ?AUTO_444 )
      ( MAKE-ON ?AUTO_444 ?AUTO_445 )
      ( MAKE-ON-VERIFY ?AUTO_444 ?AUTO_445 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_448 - BLOCK
      ?AUTO_449 - BLOCK
    )
    :vars
    (
      ?AUTO_451 - BLOCK
      ?AUTO_450 - BLOCK
      ?AUTO_452 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_449 ) ( not ( = ?AUTO_448 ?AUTO_449 ) ) ( ON ?AUTO_448 ?AUTO_451 ) ( not ( = ?AUTO_448 ?AUTO_451 ) ) ( not ( = ?AUTO_449 ?AUTO_451 ) ) ( not ( = ?AUTO_448 ?AUTO_450 ) ) ( not ( = ?AUTO_449 ?AUTO_450 ) ) ( not ( = ?AUTO_451 ?AUTO_450 ) ) ( ON ?AUTO_450 ?AUTO_448 ) ( CLEAR ?AUTO_450 ) ( HOLDING ?AUTO_452 ) ( not ( = ?AUTO_448 ?AUTO_452 ) ) ( not ( = ?AUTO_449 ?AUTO_452 ) ) ( not ( = ?AUTO_451 ?AUTO_452 ) ) ( not ( = ?AUTO_450 ?AUTO_452 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_452 )
      ( MAKE-ON ?AUTO_448 ?AUTO_449 )
      ( MAKE-ON-VERIFY ?AUTO_448 ?AUTO_449 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_453 - BLOCK
      ?AUTO_454 - BLOCK
    )
    :vars
    (
      ?AUTO_455 - BLOCK
      ?AUTO_456 - BLOCK
      ?AUTO_457 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_454 ) ( not ( = ?AUTO_453 ?AUTO_454 ) ) ( ON ?AUTO_453 ?AUTO_455 ) ( not ( = ?AUTO_453 ?AUTO_455 ) ) ( not ( = ?AUTO_454 ?AUTO_455 ) ) ( not ( = ?AUTO_453 ?AUTO_456 ) ) ( not ( = ?AUTO_454 ?AUTO_456 ) ) ( not ( = ?AUTO_455 ?AUTO_456 ) ) ( ON ?AUTO_456 ?AUTO_453 ) ( not ( = ?AUTO_453 ?AUTO_457 ) ) ( not ( = ?AUTO_454 ?AUTO_457 ) ) ( not ( = ?AUTO_455 ?AUTO_457 ) ) ( not ( = ?AUTO_456 ?AUTO_457 ) ) ( ON ?AUTO_457 ?AUTO_456 ) ( CLEAR ?AUTO_457 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_457 ?AUTO_456 )
      ( MAKE-ON ?AUTO_453 ?AUTO_454 )
      ( MAKE-ON-VERIFY ?AUTO_453 ?AUTO_454 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_458 - BLOCK
      ?AUTO_459 - BLOCK
    )
    :vars
    (
      ?AUTO_461 - BLOCK
      ?AUTO_460 - BLOCK
      ?AUTO_462 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_458 ?AUTO_459 ) ) ( ON ?AUTO_458 ?AUTO_461 ) ( not ( = ?AUTO_458 ?AUTO_461 ) ) ( not ( = ?AUTO_459 ?AUTO_461 ) ) ( not ( = ?AUTO_458 ?AUTO_460 ) ) ( not ( = ?AUTO_459 ?AUTO_460 ) ) ( not ( = ?AUTO_461 ?AUTO_460 ) ) ( ON ?AUTO_460 ?AUTO_458 ) ( not ( = ?AUTO_458 ?AUTO_462 ) ) ( not ( = ?AUTO_459 ?AUTO_462 ) ) ( not ( = ?AUTO_461 ?AUTO_462 ) ) ( not ( = ?AUTO_460 ?AUTO_462 ) ) ( ON ?AUTO_462 ?AUTO_460 ) ( CLEAR ?AUTO_462 ) ( HOLDING ?AUTO_459 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_459 )
      ( MAKE-ON ?AUTO_458 ?AUTO_459 )
      ( MAKE-ON-VERIFY ?AUTO_458 ?AUTO_459 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_467 - BLOCK
      ?AUTO_468 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_467 ) ( CLEAR ?AUTO_468 ) ( not ( = ?AUTO_467 ?AUTO_468 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_467 ?AUTO_468 )
      ( MAKE-ON-VERIFY ?AUTO_467 ?AUTO_468 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_469 - BLOCK
      ?AUTO_470 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_470 ) ( not ( = ?AUTO_469 ?AUTO_470 ) ) ( ON-TABLE ?AUTO_469 ) ( CLEAR ?AUTO_469 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_469 )
      ( MAKE-ON ?AUTO_469 ?AUTO_470 )
      ( MAKE-ON-VERIFY ?AUTO_469 ?AUTO_470 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_471 - BLOCK
      ?AUTO_472 - BLOCK
    )
    :vars
    (
      ?AUTO_473 - BLOCK
      ?AUTO_474 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_472 ) ( not ( = ?AUTO_471 ?AUTO_472 ) ) ( ON-TABLE ?AUTO_471 ) ( CLEAR ?AUTO_471 ) ( HOLDING ?AUTO_473 ) ( CLEAR ?AUTO_474 ) ( not ( = ?AUTO_471 ?AUTO_473 ) ) ( not ( = ?AUTO_471 ?AUTO_474 ) ) ( not ( = ?AUTO_472 ?AUTO_473 ) ) ( not ( = ?AUTO_472 ?AUTO_474 ) ) ( not ( = ?AUTO_473 ?AUTO_474 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_473 ?AUTO_474 )
      ( MAKE-ON ?AUTO_471 ?AUTO_472 )
      ( MAKE-ON-VERIFY ?AUTO_471 ?AUTO_472 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_475 - BLOCK
      ?AUTO_476 - BLOCK
    )
    :vars
    (
      ?AUTO_477 - BLOCK
      ?AUTO_478 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_476 ) ( not ( = ?AUTO_475 ?AUTO_476 ) ) ( ON-TABLE ?AUTO_475 ) ( CLEAR ?AUTO_477 ) ( not ( = ?AUTO_475 ?AUTO_478 ) ) ( not ( = ?AUTO_475 ?AUTO_477 ) ) ( not ( = ?AUTO_476 ?AUTO_478 ) ) ( not ( = ?AUTO_476 ?AUTO_477 ) ) ( not ( = ?AUTO_478 ?AUTO_477 ) ) ( ON ?AUTO_478 ?AUTO_475 ) ( CLEAR ?AUTO_478 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_478 ?AUTO_475 )
      ( MAKE-ON ?AUTO_475 ?AUTO_476 )
      ( MAKE-ON-VERIFY ?AUTO_475 ?AUTO_476 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_479 - BLOCK
      ?AUTO_480 - BLOCK
    )
    :vars
    (
      ?AUTO_482 - BLOCK
      ?AUTO_481 - BLOCK
      ?AUTO_483 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_480 ) ( not ( = ?AUTO_479 ?AUTO_480 ) ) ( ON-TABLE ?AUTO_479 ) ( CLEAR ?AUTO_482 ) ( not ( = ?AUTO_479 ?AUTO_481 ) ) ( not ( = ?AUTO_479 ?AUTO_482 ) ) ( not ( = ?AUTO_480 ?AUTO_481 ) ) ( not ( = ?AUTO_480 ?AUTO_482 ) ) ( not ( = ?AUTO_481 ?AUTO_482 ) ) ( ON ?AUTO_481 ?AUTO_479 ) ( CLEAR ?AUTO_481 ) ( HOLDING ?AUTO_483 ) ( not ( = ?AUTO_479 ?AUTO_483 ) ) ( not ( = ?AUTO_480 ?AUTO_483 ) ) ( not ( = ?AUTO_482 ?AUTO_483 ) ) ( not ( = ?AUTO_481 ?AUTO_483 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_483 )
      ( MAKE-ON ?AUTO_479 ?AUTO_480 )
      ( MAKE-ON-VERIFY ?AUTO_479 ?AUTO_480 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_484 - BLOCK
      ?AUTO_485 - BLOCK
    )
    :vars
    (
      ?AUTO_487 - BLOCK
      ?AUTO_486 - BLOCK
      ?AUTO_488 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_485 ) ( not ( = ?AUTO_484 ?AUTO_485 ) ) ( ON-TABLE ?AUTO_484 ) ( CLEAR ?AUTO_487 ) ( not ( = ?AUTO_484 ?AUTO_486 ) ) ( not ( = ?AUTO_484 ?AUTO_487 ) ) ( not ( = ?AUTO_485 ?AUTO_486 ) ) ( not ( = ?AUTO_485 ?AUTO_487 ) ) ( not ( = ?AUTO_486 ?AUTO_487 ) ) ( ON ?AUTO_486 ?AUTO_484 ) ( not ( = ?AUTO_484 ?AUTO_488 ) ) ( not ( = ?AUTO_485 ?AUTO_488 ) ) ( not ( = ?AUTO_487 ?AUTO_488 ) ) ( not ( = ?AUTO_486 ?AUTO_488 ) ) ( ON ?AUTO_488 ?AUTO_486 ) ( CLEAR ?AUTO_488 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_488 ?AUTO_486 )
      ( MAKE-ON ?AUTO_484 ?AUTO_485 )
      ( MAKE-ON-VERIFY ?AUTO_484 ?AUTO_485 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_489 - BLOCK
      ?AUTO_490 - BLOCK
    )
    :vars
    (
      ?AUTO_491 - BLOCK
      ?AUTO_492 - BLOCK
      ?AUTO_493 - BLOCK
      ?AUTO_494 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_490 ) ( not ( = ?AUTO_489 ?AUTO_490 ) ) ( ON-TABLE ?AUTO_489 ) ( CLEAR ?AUTO_491 ) ( not ( = ?AUTO_489 ?AUTO_492 ) ) ( not ( = ?AUTO_489 ?AUTO_491 ) ) ( not ( = ?AUTO_490 ?AUTO_492 ) ) ( not ( = ?AUTO_490 ?AUTO_491 ) ) ( not ( = ?AUTO_492 ?AUTO_491 ) ) ( ON ?AUTO_492 ?AUTO_489 ) ( not ( = ?AUTO_489 ?AUTO_493 ) ) ( not ( = ?AUTO_490 ?AUTO_493 ) ) ( not ( = ?AUTO_491 ?AUTO_493 ) ) ( not ( = ?AUTO_492 ?AUTO_493 ) ) ( ON ?AUTO_493 ?AUTO_492 ) ( CLEAR ?AUTO_493 ) ( HOLDING ?AUTO_494 ) ( not ( = ?AUTO_489 ?AUTO_494 ) ) ( not ( = ?AUTO_490 ?AUTO_494 ) ) ( not ( = ?AUTO_491 ?AUTO_494 ) ) ( not ( = ?AUTO_492 ?AUTO_494 ) ) ( not ( = ?AUTO_493 ?AUTO_494 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_494 )
      ( MAKE-ON ?AUTO_489 ?AUTO_490 )
      ( MAKE-ON-VERIFY ?AUTO_489 ?AUTO_490 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_495 - BLOCK
      ?AUTO_496 - BLOCK
    )
    :vars
    (
      ?AUTO_498 - BLOCK
      ?AUTO_497 - BLOCK
      ?AUTO_500 - BLOCK
      ?AUTO_499 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_496 ) ( not ( = ?AUTO_495 ?AUTO_496 ) ) ( ON-TABLE ?AUTO_495 ) ( CLEAR ?AUTO_498 ) ( not ( = ?AUTO_495 ?AUTO_497 ) ) ( not ( = ?AUTO_495 ?AUTO_498 ) ) ( not ( = ?AUTO_496 ?AUTO_497 ) ) ( not ( = ?AUTO_496 ?AUTO_498 ) ) ( not ( = ?AUTO_497 ?AUTO_498 ) ) ( ON ?AUTO_497 ?AUTO_495 ) ( not ( = ?AUTO_495 ?AUTO_500 ) ) ( not ( = ?AUTO_496 ?AUTO_500 ) ) ( not ( = ?AUTO_498 ?AUTO_500 ) ) ( not ( = ?AUTO_497 ?AUTO_500 ) ) ( ON ?AUTO_500 ?AUTO_497 ) ( not ( = ?AUTO_495 ?AUTO_499 ) ) ( not ( = ?AUTO_496 ?AUTO_499 ) ) ( not ( = ?AUTO_498 ?AUTO_499 ) ) ( not ( = ?AUTO_497 ?AUTO_499 ) ) ( not ( = ?AUTO_500 ?AUTO_499 ) ) ( ON ?AUTO_499 ?AUTO_500 ) ( CLEAR ?AUTO_499 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_499 ?AUTO_500 )
      ( MAKE-ON ?AUTO_495 ?AUTO_496 )
      ( MAKE-ON-VERIFY ?AUTO_495 ?AUTO_496 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_501 - BLOCK
      ?AUTO_502 - BLOCK
    )
    :vars
    (
      ?AUTO_503 - BLOCK
      ?AUTO_505 - BLOCK
      ?AUTO_504 - BLOCK
      ?AUTO_506 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_502 ) ( not ( = ?AUTO_501 ?AUTO_502 ) ) ( ON-TABLE ?AUTO_501 ) ( not ( = ?AUTO_501 ?AUTO_503 ) ) ( not ( = ?AUTO_501 ?AUTO_505 ) ) ( not ( = ?AUTO_502 ?AUTO_503 ) ) ( not ( = ?AUTO_502 ?AUTO_505 ) ) ( not ( = ?AUTO_503 ?AUTO_505 ) ) ( ON ?AUTO_503 ?AUTO_501 ) ( not ( = ?AUTO_501 ?AUTO_504 ) ) ( not ( = ?AUTO_502 ?AUTO_504 ) ) ( not ( = ?AUTO_505 ?AUTO_504 ) ) ( not ( = ?AUTO_503 ?AUTO_504 ) ) ( ON ?AUTO_504 ?AUTO_503 ) ( not ( = ?AUTO_501 ?AUTO_506 ) ) ( not ( = ?AUTO_502 ?AUTO_506 ) ) ( not ( = ?AUTO_505 ?AUTO_506 ) ) ( not ( = ?AUTO_503 ?AUTO_506 ) ) ( not ( = ?AUTO_504 ?AUTO_506 ) ) ( ON ?AUTO_506 ?AUTO_504 ) ( CLEAR ?AUTO_506 ) ( HOLDING ?AUTO_505 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_505 )
      ( MAKE-ON ?AUTO_501 ?AUTO_502 )
      ( MAKE-ON-VERIFY ?AUTO_501 ?AUTO_502 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_511 - BLOCK
      ?AUTO_512 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_511 ) ( CLEAR ?AUTO_512 ) ( not ( = ?AUTO_511 ?AUTO_512 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_511 ?AUTO_512 )
      ( MAKE-ON-VERIFY ?AUTO_511 ?AUTO_512 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_513 - BLOCK
      ?AUTO_514 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_514 ) ( not ( = ?AUTO_513 ?AUTO_514 ) ) ( ON-TABLE ?AUTO_513 ) ( CLEAR ?AUTO_513 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_513 )
      ( MAKE-ON ?AUTO_513 ?AUTO_514 )
      ( MAKE-ON-VERIFY ?AUTO_513 ?AUTO_514 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_515 - BLOCK
      ?AUTO_516 - BLOCK
    )
    :vars
    (
      ?AUTO_517 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_515 ?AUTO_516 ) ) ( ON-TABLE ?AUTO_515 ) ( CLEAR ?AUTO_515 ) ( HOLDING ?AUTO_516 ) ( CLEAR ?AUTO_517 ) ( not ( = ?AUTO_515 ?AUTO_517 ) ) ( not ( = ?AUTO_516 ?AUTO_517 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_516 ?AUTO_517 )
      ( MAKE-ON ?AUTO_515 ?AUTO_516 )
      ( MAKE-ON-VERIFY ?AUTO_515 ?AUTO_516 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_522 - BLOCK
      ?AUTO_523 - BLOCK
    )
    :vars
    (
      ?AUTO_525 - BLOCK
      ?AUTO_524 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_522 ?AUTO_523 ) ) ( ON-TABLE ?AUTO_522 ) ( CLEAR ?AUTO_522 ) ( CLEAR ?AUTO_525 ) ( not ( = ?AUTO_522 ?AUTO_524 ) ) ( not ( = ?AUTO_522 ?AUTO_525 ) ) ( not ( = ?AUTO_523 ?AUTO_524 ) ) ( not ( = ?AUTO_523 ?AUTO_525 ) ) ( not ( = ?AUTO_524 ?AUTO_525 ) ) ( ON ?AUTO_524 ?AUTO_523 ) ( CLEAR ?AUTO_524 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_524 ?AUTO_523 )
      ( MAKE-ON ?AUTO_522 ?AUTO_523 )
      ( MAKE-ON-VERIFY ?AUTO_522 ?AUTO_523 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_526 - BLOCK
      ?AUTO_527 - BLOCK
    )
    :vars
    (
      ?AUTO_528 - BLOCK
      ?AUTO_529 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_526 ?AUTO_527 ) ) ( CLEAR ?AUTO_528 ) ( not ( = ?AUTO_526 ?AUTO_529 ) ) ( not ( = ?AUTO_526 ?AUTO_528 ) ) ( not ( = ?AUTO_527 ?AUTO_529 ) ) ( not ( = ?AUTO_527 ?AUTO_528 ) ) ( not ( = ?AUTO_529 ?AUTO_528 ) ) ( ON ?AUTO_529 ?AUTO_527 ) ( CLEAR ?AUTO_529 ) ( HOLDING ?AUTO_526 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_526 )
      ( MAKE-ON ?AUTO_526 ?AUTO_527 )
      ( MAKE-ON-VERIFY ?AUTO_526 ?AUTO_527 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_530 - BLOCK
      ?AUTO_531 - BLOCK
    )
    :vars
    (
      ?AUTO_532 - BLOCK
      ?AUTO_533 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_530 ?AUTO_531 ) ) ( CLEAR ?AUTO_532 ) ( not ( = ?AUTO_530 ?AUTO_533 ) ) ( not ( = ?AUTO_530 ?AUTO_532 ) ) ( not ( = ?AUTO_531 ?AUTO_533 ) ) ( not ( = ?AUTO_531 ?AUTO_532 ) ) ( not ( = ?AUTO_533 ?AUTO_532 ) ) ( ON ?AUTO_533 ?AUTO_531 ) ( ON ?AUTO_530 ?AUTO_533 ) ( CLEAR ?AUTO_530 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_530 ?AUTO_533 )
      ( MAKE-ON ?AUTO_530 ?AUTO_531 )
      ( MAKE-ON-VERIFY ?AUTO_530 ?AUTO_531 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_534 - BLOCK
      ?AUTO_535 - BLOCK
    )
    :vars
    (
      ?AUTO_536 - BLOCK
      ?AUTO_537 - BLOCK
      ?AUTO_538 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_534 ?AUTO_535 ) ) ( CLEAR ?AUTO_536 ) ( not ( = ?AUTO_534 ?AUTO_537 ) ) ( not ( = ?AUTO_534 ?AUTO_536 ) ) ( not ( = ?AUTO_535 ?AUTO_537 ) ) ( not ( = ?AUTO_535 ?AUTO_536 ) ) ( not ( = ?AUTO_537 ?AUTO_536 ) ) ( ON ?AUTO_537 ?AUTO_535 ) ( ON ?AUTO_534 ?AUTO_537 ) ( CLEAR ?AUTO_534 ) ( HOLDING ?AUTO_538 ) ( not ( = ?AUTO_534 ?AUTO_538 ) ) ( not ( = ?AUTO_535 ?AUTO_538 ) ) ( not ( = ?AUTO_536 ?AUTO_538 ) ) ( not ( = ?AUTO_537 ?AUTO_538 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_538 )
      ( MAKE-ON ?AUTO_534 ?AUTO_535 )
      ( MAKE-ON-VERIFY ?AUTO_534 ?AUTO_535 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_539 - BLOCK
      ?AUTO_540 - BLOCK
    )
    :vars
    (
      ?AUTO_542 - BLOCK
      ?AUTO_541 - BLOCK
      ?AUTO_543 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_539 ?AUTO_540 ) ) ( CLEAR ?AUTO_542 ) ( not ( = ?AUTO_539 ?AUTO_541 ) ) ( not ( = ?AUTO_539 ?AUTO_542 ) ) ( not ( = ?AUTO_540 ?AUTO_541 ) ) ( not ( = ?AUTO_540 ?AUTO_542 ) ) ( not ( = ?AUTO_541 ?AUTO_542 ) ) ( ON ?AUTO_541 ?AUTO_540 ) ( ON ?AUTO_539 ?AUTO_541 ) ( not ( = ?AUTO_539 ?AUTO_543 ) ) ( not ( = ?AUTO_540 ?AUTO_543 ) ) ( not ( = ?AUTO_542 ?AUTO_543 ) ) ( not ( = ?AUTO_541 ?AUTO_543 ) ) ( ON ?AUTO_543 ?AUTO_539 ) ( CLEAR ?AUTO_543 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_543 ?AUTO_539 )
      ( MAKE-ON ?AUTO_539 ?AUTO_540 )
      ( MAKE-ON-VERIFY ?AUTO_539 ?AUTO_540 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_544 - BLOCK
      ?AUTO_545 - BLOCK
    )
    :vars
    (
      ?AUTO_547 - BLOCK
      ?AUTO_546 - BLOCK
      ?AUTO_548 - BLOCK
      ?AUTO_549 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_544 ?AUTO_545 ) ) ( CLEAR ?AUTO_547 ) ( not ( = ?AUTO_544 ?AUTO_546 ) ) ( not ( = ?AUTO_544 ?AUTO_547 ) ) ( not ( = ?AUTO_545 ?AUTO_546 ) ) ( not ( = ?AUTO_545 ?AUTO_547 ) ) ( not ( = ?AUTO_546 ?AUTO_547 ) ) ( ON ?AUTO_546 ?AUTO_545 ) ( ON ?AUTO_544 ?AUTO_546 ) ( not ( = ?AUTO_544 ?AUTO_548 ) ) ( not ( = ?AUTO_545 ?AUTO_548 ) ) ( not ( = ?AUTO_547 ?AUTO_548 ) ) ( not ( = ?AUTO_546 ?AUTO_548 ) ) ( ON ?AUTO_548 ?AUTO_544 ) ( CLEAR ?AUTO_548 ) ( HOLDING ?AUTO_549 ) ( not ( = ?AUTO_544 ?AUTO_549 ) ) ( not ( = ?AUTO_545 ?AUTO_549 ) ) ( not ( = ?AUTO_547 ?AUTO_549 ) ) ( not ( = ?AUTO_546 ?AUTO_549 ) ) ( not ( = ?AUTO_548 ?AUTO_549 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_549 )
      ( MAKE-ON ?AUTO_544 ?AUTO_545 )
      ( MAKE-ON-VERIFY ?AUTO_544 ?AUTO_545 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_554 - BLOCK
      ?AUTO_555 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_554 ) ( CLEAR ?AUTO_555 ) ( not ( = ?AUTO_554 ?AUTO_555 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_554 ?AUTO_555 )
      ( MAKE-ON-VERIFY ?AUTO_554 ?AUTO_555 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_556 - BLOCK
      ?AUTO_557 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_557 ) ( not ( = ?AUTO_556 ?AUTO_557 ) ) ( ON-TABLE ?AUTO_556 ) ( CLEAR ?AUTO_556 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_556 )
      ( MAKE-ON ?AUTO_556 ?AUTO_557 )
      ( MAKE-ON-VERIFY ?AUTO_556 ?AUTO_557 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_558 - BLOCK
      ?AUTO_559 - BLOCK
    )
    :vars
    (
      ?AUTO_560 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_558 ?AUTO_559 ) ) ( ON-TABLE ?AUTO_558 ) ( CLEAR ?AUTO_558 ) ( HOLDING ?AUTO_559 ) ( CLEAR ?AUTO_560 ) ( not ( = ?AUTO_558 ?AUTO_560 ) ) ( not ( = ?AUTO_559 ?AUTO_560 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_559 ?AUTO_560 )
      ( MAKE-ON ?AUTO_558 ?AUTO_559 )
      ( MAKE-ON-VERIFY ?AUTO_558 ?AUTO_559 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_563 - BLOCK
      ?AUTO_564 - BLOCK
    )
    :vars
    (
      ?AUTO_565 - BLOCK
      ?AUTO_566 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_564 ) ( not ( = ?AUTO_563 ?AUTO_564 ) ) ( ON-TABLE ?AUTO_563 ) ( CLEAR ?AUTO_563 ) ( HOLDING ?AUTO_565 ) ( CLEAR ?AUTO_566 ) ( not ( = ?AUTO_563 ?AUTO_565 ) ) ( not ( = ?AUTO_563 ?AUTO_566 ) ) ( not ( = ?AUTO_564 ?AUTO_565 ) ) ( not ( = ?AUTO_564 ?AUTO_566 ) ) ( not ( = ?AUTO_565 ?AUTO_566 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_565 ?AUTO_566 )
      ( MAKE-ON ?AUTO_563 ?AUTO_564 )
      ( MAKE-ON-VERIFY ?AUTO_563 ?AUTO_564 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_568 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_568 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_568 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_568 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_569 - BLOCK
    )
    :vars
    (
      ?AUTO_570 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_569 ?AUTO_570 ) ( CLEAR ?AUTO_569 ) ( HAND-EMPTY ) ( not ( = ?AUTO_569 ?AUTO_570 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_569 ?AUTO_570 )
      ( MAKE-ON-TABLE ?AUTO_569 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_569 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_572 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_572 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_572 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_572 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_573 - BLOCK
    )
    :vars
    (
      ?AUTO_574 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_573 ?AUTO_574 ) ( CLEAR ?AUTO_573 ) ( HAND-EMPTY ) ( not ( = ?AUTO_573 ?AUTO_574 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_573 ?AUTO_574 )
      ( MAKE-ON-TABLE ?AUTO_573 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_573 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_575 - BLOCK
    )
    :vars
    (
      ?AUTO_576 - BLOCK
      ?AUTO_577 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_575 ?AUTO_576 ) ( CLEAR ?AUTO_575 ) ( not ( = ?AUTO_575 ?AUTO_576 ) ) ( HOLDING ?AUTO_577 ) ( not ( = ?AUTO_575 ?AUTO_577 ) ) ( not ( = ?AUTO_576 ?AUTO_577 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_577 )
      ( MAKE-ON-TABLE ?AUTO_575 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_575 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_580 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_580 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_580 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_580 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_581 - BLOCK
    )
    :vars
    (
      ?AUTO_582 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_581 ?AUTO_582 ) ( CLEAR ?AUTO_581 ) ( HAND-EMPTY ) ( not ( = ?AUTO_581 ?AUTO_582 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_581 ?AUTO_582 )
      ( MAKE-ON-TABLE ?AUTO_581 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_581 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_583 - BLOCK
    )
    :vars
    (
      ?AUTO_584 - BLOCK
      ?AUTO_585 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_583 ?AUTO_584 ) ( CLEAR ?AUTO_583 ) ( not ( = ?AUTO_583 ?AUTO_584 ) ) ( HOLDING ?AUTO_585 ) ( not ( = ?AUTO_583 ?AUTO_585 ) ) ( not ( = ?AUTO_584 ?AUTO_585 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_585 )
      ( MAKE-ON-TABLE ?AUTO_583 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_583 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_586 - BLOCK
    )
    :vars
    (
      ?AUTO_587 - BLOCK
      ?AUTO_588 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_586 ?AUTO_587 ) ( not ( = ?AUTO_586 ?AUTO_587 ) ) ( not ( = ?AUTO_586 ?AUTO_588 ) ) ( not ( = ?AUTO_587 ?AUTO_588 ) ) ( ON ?AUTO_588 ?AUTO_586 ) ( CLEAR ?AUTO_588 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_588 ?AUTO_586 )
      ( MAKE-ON-TABLE ?AUTO_586 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_586 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_589 - BLOCK
    )
    :vars
    (
      ?AUTO_590 - BLOCK
      ?AUTO_591 - BLOCK
      ?AUTO_592 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_589 ?AUTO_590 ) ( not ( = ?AUTO_589 ?AUTO_590 ) ) ( not ( = ?AUTO_589 ?AUTO_591 ) ) ( not ( = ?AUTO_590 ?AUTO_591 ) ) ( ON ?AUTO_591 ?AUTO_589 ) ( CLEAR ?AUTO_591 ) ( HOLDING ?AUTO_592 ) ( not ( = ?AUTO_589 ?AUTO_592 ) ) ( not ( = ?AUTO_590 ?AUTO_592 ) ) ( not ( = ?AUTO_591 ?AUTO_592 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_592 )
      ( MAKE-ON-TABLE ?AUTO_589 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_589 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_596 - BLOCK
      ?AUTO_597 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_596 ) ( CLEAR ?AUTO_597 ) ( not ( = ?AUTO_596 ?AUTO_597 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_596 ?AUTO_597 )
      ( MAKE-ON-VERIFY ?AUTO_596 ?AUTO_597 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_598 - BLOCK
      ?AUTO_599 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_599 ) ( not ( = ?AUTO_598 ?AUTO_599 ) ) ( ON-TABLE ?AUTO_598 ) ( CLEAR ?AUTO_598 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_598 )
      ( MAKE-ON ?AUTO_598 ?AUTO_599 )
      ( MAKE-ON-VERIFY ?AUTO_598 ?AUTO_599 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_600 - BLOCK
      ?AUTO_601 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_600 ?AUTO_601 ) ) ( ON-TABLE ?AUTO_600 ) ( CLEAR ?AUTO_600 ) ( HOLDING ?AUTO_601 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_601 )
      ( MAKE-ON ?AUTO_600 ?AUTO_601 )
      ( MAKE-ON-VERIFY ?AUTO_600 ?AUTO_601 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_604 - BLOCK
      ?AUTO_605 - BLOCK
    )
    :vars
    (
      ?AUTO_606 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_605 ) ( not ( = ?AUTO_604 ?AUTO_605 ) ) ( ON-TABLE ?AUTO_604 ) ( CLEAR ?AUTO_604 ) ( HOLDING ?AUTO_606 ) ( not ( = ?AUTO_604 ?AUTO_606 ) ) ( not ( = ?AUTO_605 ?AUTO_606 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_606 )
      ( MAKE-ON ?AUTO_604 ?AUTO_605 )
      ( MAKE-ON-VERIFY ?AUTO_604 ?AUTO_605 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_607 - BLOCK
      ?AUTO_608 - BLOCK
    )
    :vars
    (
      ?AUTO_609 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_607 ?AUTO_608 ) ) ( ON-TABLE ?AUTO_607 ) ( CLEAR ?AUTO_607 ) ( not ( = ?AUTO_607 ?AUTO_609 ) ) ( not ( = ?AUTO_608 ?AUTO_609 ) ) ( ON ?AUTO_609 ?AUTO_608 ) ( CLEAR ?AUTO_609 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_609 ?AUTO_608 )
      ( MAKE-ON ?AUTO_607 ?AUTO_608 )
      ( MAKE-ON-VERIFY ?AUTO_607 ?AUTO_608 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_610 - BLOCK
      ?AUTO_611 - BLOCK
    )
    :vars
    (
      ?AUTO_612 - BLOCK
      ?AUTO_613 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_610 ?AUTO_611 ) ) ( ON-TABLE ?AUTO_610 ) ( CLEAR ?AUTO_610 ) ( not ( = ?AUTO_610 ?AUTO_612 ) ) ( not ( = ?AUTO_611 ?AUTO_612 ) ) ( ON ?AUTO_612 ?AUTO_611 ) ( CLEAR ?AUTO_612 ) ( HOLDING ?AUTO_613 ) ( not ( = ?AUTO_610 ?AUTO_613 ) ) ( not ( = ?AUTO_611 ?AUTO_613 ) ) ( not ( = ?AUTO_612 ?AUTO_613 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_613 )
      ( MAKE-ON ?AUTO_610 ?AUTO_611 )
      ( MAKE-ON-VERIFY ?AUTO_610 ?AUTO_611 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_618 - BLOCK
      ?AUTO_619 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_618 ) ( CLEAR ?AUTO_619 ) ( not ( = ?AUTO_618 ?AUTO_619 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_618 ?AUTO_619 )
      ( MAKE-ON-VERIFY ?AUTO_618 ?AUTO_619 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_620 - BLOCK
      ?AUTO_621 - BLOCK
    )
    :vars
    (
      ?AUTO_622 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_621 ) ( not ( = ?AUTO_620 ?AUTO_621 ) ) ( ON ?AUTO_620 ?AUTO_622 ) ( CLEAR ?AUTO_620 ) ( HAND-EMPTY ) ( not ( = ?AUTO_620 ?AUTO_622 ) ) ( not ( = ?AUTO_621 ?AUTO_622 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_620 ?AUTO_622 )
      ( MAKE-ON ?AUTO_620 ?AUTO_621 )
      ( MAKE-ON-VERIFY ?AUTO_620 ?AUTO_621 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_623 - BLOCK
      ?AUTO_624 - BLOCK
    )
    :vars
    (
      ?AUTO_625 - BLOCK
      ?AUTO_626 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_623 ?AUTO_624 ) ) ( ON ?AUTO_623 ?AUTO_625 ) ( CLEAR ?AUTO_623 ) ( not ( = ?AUTO_623 ?AUTO_625 ) ) ( not ( = ?AUTO_624 ?AUTO_625 ) ) ( HOLDING ?AUTO_624 ) ( CLEAR ?AUTO_626 ) ( not ( = ?AUTO_623 ?AUTO_626 ) ) ( not ( = ?AUTO_624 ?AUTO_626 ) ) ( not ( = ?AUTO_625 ?AUTO_626 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_624 ?AUTO_626 )
      ( MAKE-ON ?AUTO_623 ?AUTO_624 )
      ( MAKE-ON-VERIFY ?AUTO_623 ?AUTO_624 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_629 - BLOCK
      ?AUTO_630 - BLOCK
    )
    :vars
    (
      ?AUTO_631 - BLOCK
      ?AUTO_632 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_630 ) ( not ( = ?AUTO_629 ?AUTO_630 ) ) ( ON ?AUTO_629 ?AUTO_631 ) ( CLEAR ?AUTO_629 ) ( not ( = ?AUTO_629 ?AUTO_631 ) ) ( not ( = ?AUTO_630 ?AUTO_631 ) ) ( HOLDING ?AUTO_632 ) ( not ( = ?AUTO_629 ?AUTO_632 ) ) ( not ( = ?AUTO_630 ?AUTO_632 ) ) ( not ( = ?AUTO_631 ?AUTO_632 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_632 )
      ( MAKE-ON ?AUTO_629 ?AUTO_630 )
      ( MAKE-ON-VERIFY ?AUTO_629 ?AUTO_630 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_633 - BLOCK
      ?AUTO_634 - BLOCK
    )
    :vars
    (
      ?AUTO_635 - BLOCK
      ?AUTO_636 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_634 ) ( not ( = ?AUTO_633 ?AUTO_634 ) ) ( ON ?AUTO_633 ?AUTO_635 ) ( not ( = ?AUTO_633 ?AUTO_635 ) ) ( not ( = ?AUTO_634 ?AUTO_635 ) ) ( not ( = ?AUTO_633 ?AUTO_636 ) ) ( not ( = ?AUTO_634 ?AUTO_636 ) ) ( not ( = ?AUTO_635 ?AUTO_636 ) ) ( ON ?AUTO_636 ?AUTO_633 ) ( CLEAR ?AUTO_636 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_636 ?AUTO_633 )
      ( MAKE-ON ?AUTO_633 ?AUTO_634 )
      ( MAKE-ON-VERIFY ?AUTO_633 ?AUTO_634 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_637 - BLOCK
      ?AUTO_638 - BLOCK
    )
    :vars
    (
      ?AUTO_640 - BLOCK
      ?AUTO_639 - BLOCK
      ?AUTO_641 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_638 ) ( not ( = ?AUTO_637 ?AUTO_638 ) ) ( ON ?AUTO_637 ?AUTO_640 ) ( not ( = ?AUTO_637 ?AUTO_640 ) ) ( not ( = ?AUTO_638 ?AUTO_640 ) ) ( not ( = ?AUTO_637 ?AUTO_639 ) ) ( not ( = ?AUTO_638 ?AUTO_639 ) ) ( not ( = ?AUTO_640 ?AUTO_639 ) ) ( ON ?AUTO_639 ?AUTO_637 ) ( CLEAR ?AUTO_639 ) ( HOLDING ?AUTO_641 ) ( not ( = ?AUTO_637 ?AUTO_641 ) ) ( not ( = ?AUTO_638 ?AUTO_641 ) ) ( not ( = ?AUTO_640 ?AUTO_641 ) ) ( not ( = ?AUTO_639 ?AUTO_641 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_641 )
      ( MAKE-ON ?AUTO_637 ?AUTO_638 )
      ( MAKE-ON-VERIFY ?AUTO_637 ?AUTO_638 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_642 - BLOCK
      ?AUTO_643 - BLOCK
    )
    :vars
    (
      ?AUTO_645 - BLOCK
      ?AUTO_644 - BLOCK
      ?AUTO_646 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_643 ) ( not ( = ?AUTO_642 ?AUTO_643 ) ) ( ON ?AUTO_642 ?AUTO_645 ) ( not ( = ?AUTO_642 ?AUTO_645 ) ) ( not ( = ?AUTO_643 ?AUTO_645 ) ) ( not ( = ?AUTO_642 ?AUTO_644 ) ) ( not ( = ?AUTO_643 ?AUTO_644 ) ) ( not ( = ?AUTO_645 ?AUTO_644 ) ) ( ON ?AUTO_644 ?AUTO_642 ) ( not ( = ?AUTO_642 ?AUTO_646 ) ) ( not ( = ?AUTO_643 ?AUTO_646 ) ) ( not ( = ?AUTO_645 ?AUTO_646 ) ) ( not ( = ?AUTO_644 ?AUTO_646 ) ) ( ON ?AUTO_646 ?AUTO_644 ) ( CLEAR ?AUTO_646 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_646 ?AUTO_644 )
      ( MAKE-ON ?AUTO_642 ?AUTO_643 )
      ( MAKE-ON-VERIFY ?AUTO_642 ?AUTO_643 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_647 - BLOCK
      ?AUTO_648 - BLOCK
    )
    :vars
    (
      ?AUTO_650 - BLOCK
      ?AUTO_649 - BLOCK
      ?AUTO_651 - BLOCK
      ?AUTO_652 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_648 ) ( not ( = ?AUTO_647 ?AUTO_648 ) ) ( ON ?AUTO_647 ?AUTO_650 ) ( not ( = ?AUTO_647 ?AUTO_650 ) ) ( not ( = ?AUTO_648 ?AUTO_650 ) ) ( not ( = ?AUTO_647 ?AUTO_649 ) ) ( not ( = ?AUTO_648 ?AUTO_649 ) ) ( not ( = ?AUTO_650 ?AUTO_649 ) ) ( ON ?AUTO_649 ?AUTO_647 ) ( not ( = ?AUTO_647 ?AUTO_651 ) ) ( not ( = ?AUTO_648 ?AUTO_651 ) ) ( not ( = ?AUTO_650 ?AUTO_651 ) ) ( not ( = ?AUTO_649 ?AUTO_651 ) ) ( ON ?AUTO_651 ?AUTO_649 ) ( CLEAR ?AUTO_651 ) ( HOLDING ?AUTO_652 ) ( not ( = ?AUTO_647 ?AUTO_652 ) ) ( not ( = ?AUTO_648 ?AUTO_652 ) ) ( not ( = ?AUTO_650 ?AUTO_652 ) ) ( not ( = ?AUTO_649 ?AUTO_652 ) ) ( not ( = ?AUTO_651 ?AUTO_652 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_652 )
      ( MAKE-ON ?AUTO_647 ?AUTO_648 )
      ( MAKE-ON-VERIFY ?AUTO_647 ?AUTO_648 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_657 - BLOCK
      ?AUTO_658 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_657 ) ( CLEAR ?AUTO_658 ) ( not ( = ?AUTO_657 ?AUTO_658 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_657 ?AUTO_658 )
      ( MAKE-ON-VERIFY ?AUTO_657 ?AUTO_658 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_659 - BLOCK
      ?AUTO_660 - BLOCK
    )
    :vars
    (
      ?AUTO_661 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_660 ) ( not ( = ?AUTO_659 ?AUTO_660 ) ) ( ON ?AUTO_659 ?AUTO_661 ) ( CLEAR ?AUTO_659 ) ( HAND-EMPTY ) ( not ( = ?AUTO_659 ?AUTO_661 ) ) ( not ( = ?AUTO_660 ?AUTO_661 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_659 ?AUTO_661 )
      ( MAKE-ON ?AUTO_659 ?AUTO_660 )
      ( MAKE-ON-VERIFY ?AUTO_659 ?AUTO_660 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_662 - BLOCK
      ?AUTO_663 - BLOCK
    )
    :vars
    (
      ?AUTO_664 - BLOCK
      ?AUTO_665 - BLOCK
      ?AUTO_666 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_663 ) ( not ( = ?AUTO_662 ?AUTO_663 ) ) ( ON ?AUTO_662 ?AUTO_664 ) ( CLEAR ?AUTO_662 ) ( not ( = ?AUTO_662 ?AUTO_664 ) ) ( not ( = ?AUTO_663 ?AUTO_664 ) ) ( HOLDING ?AUTO_665 ) ( CLEAR ?AUTO_666 ) ( not ( = ?AUTO_662 ?AUTO_665 ) ) ( not ( = ?AUTO_662 ?AUTO_666 ) ) ( not ( = ?AUTO_663 ?AUTO_665 ) ) ( not ( = ?AUTO_663 ?AUTO_666 ) ) ( not ( = ?AUTO_664 ?AUTO_665 ) ) ( not ( = ?AUTO_664 ?AUTO_666 ) ) ( not ( = ?AUTO_665 ?AUTO_666 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_665 ?AUTO_666 )
      ( MAKE-ON ?AUTO_662 ?AUTO_663 )
      ( MAKE-ON-VERIFY ?AUTO_662 ?AUTO_663 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_667 - BLOCK
      ?AUTO_668 - BLOCK
    )
    :vars
    (
      ?AUTO_669 - BLOCK
      ?AUTO_670 - BLOCK
      ?AUTO_671 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_668 ) ( not ( = ?AUTO_667 ?AUTO_668 ) ) ( ON ?AUTO_667 ?AUTO_669 ) ( not ( = ?AUTO_667 ?AUTO_669 ) ) ( not ( = ?AUTO_668 ?AUTO_669 ) ) ( CLEAR ?AUTO_670 ) ( not ( = ?AUTO_667 ?AUTO_671 ) ) ( not ( = ?AUTO_667 ?AUTO_670 ) ) ( not ( = ?AUTO_668 ?AUTO_671 ) ) ( not ( = ?AUTO_668 ?AUTO_670 ) ) ( not ( = ?AUTO_669 ?AUTO_671 ) ) ( not ( = ?AUTO_669 ?AUTO_670 ) ) ( not ( = ?AUTO_671 ?AUTO_670 ) ) ( ON ?AUTO_671 ?AUTO_667 ) ( CLEAR ?AUTO_671 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_671 ?AUTO_667 )
      ( MAKE-ON ?AUTO_667 ?AUTO_668 )
      ( MAKE-ON-VERIFY ?AUTO_667 ?AUTO_668 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_672 - BLOCK
      ?AUTO_673 - BLOCK
    )
    :vars
    (
      ?AUTO_674 - BLOCK
      ?AUTO_675 - BLOCK
      ?AUTO_676 - BLOCK
      ?AUTO_677 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_673 ) ( not ( = ?AUTO_672 ?AUTO_673 ) ) ( ON ?AUTO_672 ?AUTO_674 ) ( not ( = ?AUTO_672 ?AUTO_674 ) ) ( not ( = ?AUTO_673 ?AUTO_674 ) ) ( not ( = ?AUTO_672 ?AUTO_675 ) ) ( not ( = ?AUTO_672 ?AUTO_676 ) ) ( not ( = ?AUTO_673 ?AUTO_675 ) ) ( not ( = ?AUTO_673 ?AUTO_676 ) ) ( not ( = ?AUTO_674 ?AUTO_675 ) ) ( not ( = ?AUTO_674 ?AUTO_676 ) ) ( not ( = ?AUTO_675 ?AUTO_676 ) ) ( ON ?AUTO_675 ?AUTO_672 ) ( CLEAR ?AUTO_675 ) ( HOLDING ?AUTO_676 ) ( CLEAR ?AUTO_677 ) ( not ( = ?AUTO_672 ?AUTO_677 ) ) ( not ( = ?AUTO_673 ?AUTO_677 ) ) ( not ( = ?AUTO_674 ?AUTO_677 ) ) ( not ( = ?AUTO_675 ?AUTO_677 ) ) ( not ( = ?AUTO_676 ?AUTO_677 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_676 ?AUTO_677 )
      ( MAKE-ON ?AUTO_672 ?AUTO_673 )
      ( MAKE-ON-VERIFY ?AUTO_672 ?AUTO_673 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_682 - BLOCK
      ?AUTO_683 - BLOCK
    )
    :vars
    (
      ?AUTO_687 - BLOCK
      ?AUTO_686 - BLOCK
      ?AUTO_685 - BLOCK
      ?AUTO_684 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_683 ) ( not ( = ?AUTO_682 ?AUTO_683 ) ) ( ON ?AUTO_682 ?AUTO_687 ) ( not ( = ?AUTO_682 ?AUTO_687 ) ) ( not ( = ?AUTO_683 ?AUTO_687 ) ) ( not ( = ?AUTO_682 ?AUTO_686 ) ) ( not ( = ?AUTO_682 ?AUTO_685 ) ) ( not ( = ?AUTO_683 ?AUTO_686 ) ) ( not ( = ?AUTO_683 ?AUTO_685 ) ) ( not ( = ?AUTO_687 ?AUTO_686 ) ) ( not ( = ?AUTO_687 ?AUTO_685 ) ) ( not ( = ?AUTO_686 ?AUTO_685 ) ) ( ON ?AUTO_686 ?AUTO_682 ) ( CLEAR ?AUTO_684 ) ( not ( = ?AUTO_682 ?AUTO_684 ) ) ( not ( = ?AUTO_683 ?AUTO_684 ) ) ( not ( = ?AUTO_687 ?AUTO_684 ) ) ( not ( = ?AUTO_686 ?AUTO_684 ) ) ( not ( = ?AUTO_685 ?AUTO_684 ) ) ( ON ?AUTO_685 ?AUTO_686 ) ( CLEAR ?AUTO_685 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_685 ?AUTO_686 )
      ( MAKE-ON ?AUTO_682 ?AUTO_683 )
      ( MAKE-ON-VERIFY ?AUTO_682 ?AUTO_683 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_688 - BLOCK
      ?AUTO_689 - BLOCK
    )
    :vars
    (
      ?AUTO_691 - BLOCK
      ?AUTO_690 - BLOCK
      ?AUTO_693 - BLOCK
      ?AUTO_692 - BLOCK
      ?AUTO_694 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_689 ) ( not ( = ?AUTO_688 ?AUTO_689 ) ) ( ON ?AUTO_688 ?AUTO_691 ) ( not ( = ?AUTO_688 ?AUTO_691 ) ) ( not ( = ?AUTO_689 ?AUTO_691 ) ) ( not ( = ?AUTO_688 ?AUTO_690 ) ) ( not ( = ?AUTO_688 ?AUTO_693 ) ) ( not ( = ?AUTO_689 ?AUTO_690 ) ) ( not ( = ?AUTO_689 ?AUTO_693 ) ) ( not ( = ?AUTO_691 ?AUTO_690 ) ) ( not ( = ?AUTO_691 ?AUTO_693 ) ) ( not ( = ?AUTO_690 ?AUTO_693 ) ) ( ON ?AUTO_690 ?AUTO_688 ) ( CLEAR ?AUTO_692 ) ( not ( = ?AUTO_688 ?AUTO_692 ) ) ( not ( = ?AUTO_689 ?AUTO_692 ) ) ( not ( = ?AUTO_691 ?AUTO_692 ) ) ( not ( = ?AUTO_690 ?AUTO_692 ) ) ( not ( = ?AUTO_693 ?AUTO_692 ) ) ( ON ?AUTO_693 ?AUTO_690 ) ( CLEAR ?AUTO_693 ) ( HOLDING ?AUTO_694 ) ( not ( = ?AUTO_688 ?AUTO_694 ) ) ( not ( = ?AUTO_689 ?AUTO_694 ) ) ( not ( = ?AUTO_691 ?AUTO_694 ) ) ( not ( = ?AUTO_690 ?AUTO_694 ) ) ( not ( = ?AUTO_693 ?AUTO_694 ) ) ( not ( = ?AUTO_692 ?AUTO_694 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_694 )
      ( MAKE-ON ?AUTO_688 ?AUTO_689 )
      ( MAKE-ON-VERIFY ?AUTO_688 ?AUTO_689 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_695 - BLOCK
      ?AUTO_696 - BLOCK
    )
    :vars
    (
      ?AUTO_699 - BLOCK
      ?AUTO_698 - BLOCK
      ?AUTO_700 - BLOCK
      ?AUTO_697 - BLOCK
      ?AUTO_701 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_696 ) ( not ( = ?AUTO_695 ?AUTO_696 ) ) ( ON ?AUTO_695 ?AUTO_699 ) ( not ( = ?AUTO_695 ?AUTO_699 ) ) ( not ( = ?AUTO_696 ?AUTO_699 ) ) ( not ( = ?AUTO_695 ?AUTO_698 ) ) ( not ( = ?AUTO_695 ?AUTO_700 ) ) ( not ( = ?AUTO_696 ?AUTO_698 ) ) ( not ( = ?AUTO_696 ?AUTO_700 ) ) ( not ( = ?AUTO_699 ?AUTO_698 ) ) ( not ( = ?AUTO_699 ?AUTO_700 ) ) ( not ( = ?AUTO_698 ?AUTO_700 ) ) ( ON ?AUTO_698 ?AUTO_695 ) ( CLEAR ?AUTO_697 ) ( not ( = ?AUTO_695 ?AUTO_697 ) ) ( not ( = ?AUTO_696 ?AUTO_697 ) ) ( not ( = ?AUTO_699 ?AUTO_697 ) ) ( not ( = ?AUTO_698 ?AUTO_697 ) ) ( not ( = ?AUTO_700 ?AUTO_697 ) ) ( ON ?AUTO_700 ?AUTO_698 ) ( not ( = ?AUTO_695 ?AUTO_701 ) ) ( not ( = ?AUTO_696 ?AUTO_701 ) ) ( not ( = ?AUTO_699 ?AUTO_701 ) ) ( not ( = ?AUTO_698 ?AUTO_701 ) ) ( not ( = ?AUTO_700 ?AUTO_701 ) ) ( not ( = ?AUTO_697 ?AUTO_701 ) ) ( ON ?AUTO_701 ?AUTO_700 ) ( CLEAR ?AUTO_701 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_701 ?AUTO_700 )
      ( MAKE-ON ?AUTO_695 ?AUTO_696 )
      ( MAKE-ON-VERIFY ?AUTO_695 ?AUTO_696 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_702 - BLOCK
      ?AUTO_703 - BLOCK
    )
    :vars
    (
      ?AUTO_708 - BLOCK
      ?AUTO_705 - BLOCK
      ?AUTO_707 - BLOCK
      ?AUTO_704 - BLOCK
      ?AUTO_706 - BLOCK
      ?AUTO_709 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_703 ) ( not ( = ?AUTO_702 ?AUTO_703 ) ) ( ON ?AUTO_702 ?AUTO_708 ) ( not ( = ?AUTO_702 ?AUTO_708 ) ) ( not ( = ?AUTO_703 ?AUTO_708 ) ) ( not ( = ?AUTO_702 ?AUTO_705 ) ) ( not ( = ?AUTO_702 ?AUTO_707 ) ) ( not ( = ?AUTO_703 ?AUTO_705 ) ) ( not ( = ?AUTO_703 ?AUTO_707 ) ) ( not ( = ?AUTO_708 ?AUTO_705 ) ) ( not ( = ?AUTO_708 ?AUTO_707 ) ) ( not ( = ?AUTO_705 ?AUTO_707 ) ) ( ON ?AUTO_705 ?AUTO_702 ) ( CLEAR ?AUTO_704 ) ( not ( = ?AUTO_702 ?AUTO_704 ) ) ( not ( = ?AUTO_703 ?AUTO_704 ) ) ( not ( = ?AUTO_708 ?AUTO_704 ) ) ( not ( = ?AUTO_705 ?AUTO_704 ) ) ( not ( = ?AUTO_707 ?AUTO_704 ) ) ( ON ?AUTO_707 ?AUTO_705 ) ( not ( = ?AUTO_702 ?AUTO_706 ) ) ( not ( = ?AUTO_703 ?AUTO_706 ) ) ( not ( = ?AUTO_708 ?AUTO_706 ) ) ( not ( = ?AUTO_705 ?AUTO_706 ) ) ( not ( = ?AUTO_707 ?AUTO_706 ) ) ( not ( = ?AUTO_704 ?AUTO_706 ) ) ( ON ?AUTO_706 ?AUTO_707 ) ( CLEAR ?AUTO_706 ) ( HOLDING ?AUTO_709 ) ( not ( = ?AUTO_702 ?AUTO_709 ) ) ( not ( = ?AUTO_703 ?AUTO_709 ) ) ( not ( = ?AUTO_708 ?AUTO_709 ) ) ( not ( = ?AUTO_705 ?AUTO_709 ) ) ( not ( = ?AUTO_707 ?AUTO_709 ) ) ( not ( = ?AUTO_704 ?AUTO_709 ) ) ( not ( = ?AUTO_706 ?AUTO_709 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_709 )
      ( MAKE-ON ?AUTO_702 ?AUTO_703 )
      ( MAKE-ON-VERIFY ?AUTO_702 ?AUTO_703 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_710 - BLOCK
      ?AUTO_711 - BLOCK
    )
    :vars
    (
      ?AUTO_716 - BLOCK
      ?AUTO_712 - BLOCK
      ?AUTO_715 - BLOCK
      ?AUTO_714 - BLOCK
      ?AUTO_713 - BLOCK
      ?AUTO_717 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_710 ?AUTO_711 ) ) ( ON ?AUTO_710 ?AUTO_716 ) ( not ( = ?AUTO_710 ?AUTO_716 ) ) ( not ( = ?AUTO_711 ?AUTO_716 ) ) ( not ( = ?AUTO_710 ?AUTO_712 ) ) ( not ( = ?AUTO_710 ?AUTO_715 ) ) ( not ( = ?AUTO_711 ?AUTO_712 ) ) ( not ( = ?AUTO_711 ?AUTO_715 ) ) ( not ( = ?AUTO_716 ?AUTO_712 ) ) ( not ( = ?AUTO_716 ?AUTO_715 ) ) ( not ( = ?AUTO_712 ?AUTO_715 ) ) ( ON ?AUTO_712 ?AUTO_710 ) ( CLEAR ?AUTO_714 ) ( not ( = ?AUTO_710 ?AUTO_714 ) ) ( not ( = ?AUTO_711 ?AUTO_714 ) ) ( not ( = ?AUTO_716 ?AUTO_714 ) ) ( not ( = ?AUTO_712 ?AUTO_714 ) ) ( not ( = ?AUTO_715 ?AUTO_714 ) ) ( ON ?AUTO_715 ?AUTO_712 ) ( not ( = ?AUTO_710 ?AUTO_713 ) ) ( not ( = ?AUTO_711 ?AUTO_713 ) ) ( not ( = ?AUTO_716 ?AUTO_713 ) ) ( not ( = ?AUTO_712 ?AUTO_713 ) ) ( not ( = ?AUTO_715 ?AUTO_713 ) ) ( not ( = ?AUTO_714 ?AUTO_713 ) ) ( ON ?AUTO_713 ?AUTO_715 ) ( CLEAR ?AUTO_713 ) ( not ( = ?AUTO_710 ?AUTO_717 ) ) ( not ( = ?AUTO_711 ?AUTO_717 ) ) ( not ( = ?AUTO_716 ?AUTO_717 ) ) ( not ( = ?AUTO_712 ?AUTO_717 ) ) ( not ( = ?AUTO_715 ?AUTO_717 ) ) ( not ( = ?AUTO_714 ?AUTO_717 ) ) ( not ( = ?AUTO_713 ?AUTO_717 ) ) ( ON ?AUTO_717 ?AUTO_711 ) ( CLEAR ?AUTO_717 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_717 ?AUTO_711 )
      ( MAKE-ON ?AUTO_710 ?AUTO_711 )
      ( MAKE-ON-VERIFY ?AUTO_710 ?AUTO_711 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_720 - BLOCK
      ?AUTO_721 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_720 ) ( CLEAR ?AUTO_721 ) ( not ( = ?AUTO_720 ?AUTO_721 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_720 ?AUTO_721 )
      ( MAKE-ON-VERIFY ?AUTO_720 ?AUTO_721 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_722 - BLOCK
      ?AUTO_723 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_723 ) ( not ( = ?AUTO_722 ?AUTO_723 ) ) ( ON-TABLE ?AUTO_722 ) ( CLEAR ?AUTO_722 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_722 )
      ( MAKE-ON ?AUTO_722 ?AUTO_723 )
      ( MAKE-ON-VERIFY ?AUTO_722 ?AUTO_723 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_724 - BLOCK
      ?AUTO_725 - BLOCK
    )
    :vars
    (
      ?AUTO_726 - BLOCK
      ?AUTO_727 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_725 ) ( not ( = ?AUTO_724 ?AUTO_725 ) ) ( ON-TABLE ?AUTO_724 ) ( CLEAR ?AUTO_724 ) ( HOLDING ?AUTO_726 ) ( CLEAR ?AUTO_727 ) ( not ( = ?AUTO_724 ?AUTO_726 ) ) ( not ( = ?AUTO_724 ?AUTO_727 ) ) ( not ( = ?AUTO_725 ?AUTO_726 ) ) ( not ( = ?AUTO_725 ?AUTO_727 ) ) ( not ( = ?AUTO_726 ?AUTO_727 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_726 ?AUTO_727 )
      ( MAKE-ON ?AUTO_724 ?AUTO_725 )
      ( MAKE-ON-VERIFY ?AUTO_724 ?AUTO_725 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_728 - BLOCK
      ?AUTO_729 - BLOCK
    )
    :vars
    (
      ?AUTO_730 - BLOCK
      ?AUTO_731 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_729 ) ( not ( = ?AUTO_728 ?AUTO_729 ) ) ( ON-TABLE ?AUTO_728 ) ( CLEAR ?AUTO_730 ) ( not ( = ?AUTO_728 ?AUTO_731 ) ) ( not ( = ?AUTO_728 ?AUTO_730 ) ) ( not ( = ?AUTO_729 ?AUTO_731 ) ) ( not ( = ?AUTO_729 ?AUTO_730 ) ) ( not ( = ?AUTO_731 ?AUTO_730 ) ) ( ON ?AUTO_731 ?AUTO_728 ) ( CLEAR ?AUTO_731 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_731 ?AUTO_728 )
      ( MAKE-ON ?AUTO_728 ?AUTO_729 )
      ( MAKE-ON-VERIFY ?AUTO_728 ?AUTO_729 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_732 - BLOCK
      ?AUTO_733 - BLOCK
    )
    :vars
    (
      ?AUTO_735 - BLOCK
      ?AUTO_734 - BLOCK
      ?AUTO_736 - BLOCK
      ?AUTO_737 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_733 ) ( not ( = ?AUTO_732 ?AUTO_733 ) ) ( ON-TABLE ?AUTO_732 ) ( CLEAR ?AUTO_735 ) ( not ( = ?AUTO_732 ?AUTO_734 ) ) ( not ( = ?AUTO_732 ?AUTO_735 ) ) ( not ( = ?AUTO_733 ?AUTO_734 ) ) ( not ( = ?AUTO_733 ?AUTO_735 ) ) ( not ( = ?AUTO_734 ?AUTO_735 ) ) ( ON ?AUTO_734 ?AUTO_732 ) ( CLEAR ?AUTO_734 ) ( HOLDING ?AUTO_736 ) ( CLEAR ?AUTO_737 ) ( not ( = ?AUTO_732 ?AUTO_736 ) ) ( not ( = ?AUTO_732 ?AUTO_737 ) ) ( not ( = ?AUTO_733 ?AUTO_736 ) ) ( not ( = ?AUTO_733 ?AUTO_737 ) ) ( not ( = ?AUTO_735 ?AUTO_736 ) ) ( not ( = ?AUTO_735 ?AUTO_737 ) ) ( not ( = ?AUTO_734 ?AUTO_736 ) ) ( not ( = ?AUTO_734 ?AUTO_737 ) ) ( not ( = ?AUTO_736 ?AUTO_737 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_736 ?AUTO_737 )
      ( MAKE-ON ?AUTO_732 ?AUTO_733 )
      ( MAKE-ON-VERIFY ?AUTO_732 ?AUTO_733 ) )
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
      ?AUTO_743 - BLOCK
      ?AUTO_742 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_739 ) ( not ( = ?AUTO_738 ?AUTO_739 ) ) ( ON-TABLE ?AUTO_738 ) ( CLEAR ?AUTO_741 ) ( not ( = ?AUTO_738 ?AUTO_740 ) ) ( not ( = ?AUTO_738 ?AUTO_741 ) ) ( not ( = ?AUTO_739 ?AUTO_740 ) ) ( not ( = ?AUTO_739 ?AUTO_741 ) ) ( not ( = ?AUTO_740 ?AUTO_741 ) ) ( ON ?AUTO_740 ?AUTO_738 ) ( CLEAR ?AUTO_743 ) ( not ( = ?AUTO_738 ?AUTO_742 ) ) ( not ( = ?AUTO_738 ?AUTO_743 ) ) ( not ( = ?AUTO_739 ?AUTO_742 ) ) ( not ( = ?AUTO_739 ?AUTO_743 ) ) ( not ( = ?AUTO_741 ?AUTO_742 ) ) ( not ( = ?AUTO_741 ?AUTO_743 ) ) ( not ( = ?AUTO_740 ?AUTO_742 ) ) ( not ( = ?AUTO_740 ?AUTO_743 ) ) ( not ( = ?AUTO_742 ?AUTO_743 ) ) ( ON ?AUTO_742 ?AUTO_740 ) ( CLEAR ?AUTO_742 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_742 ?AUTO_740 )
      ( MAKE-ON ?AUTO_738 ?AUTO_739 )
      ( MAKE-ON-VERIFY ?AUTO_738 ?AUTO_739 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_744 - BLOCK
      ?AUTO_745 - BLOCK
    )
    :vars
    (
      ?AUTO_747 - BLOCK
      ?AUTO_746 - BLOCK
      ?AUTO_749 - BLOCK
      ?AUTO_748 - BLOCK
      ?AUTO_750 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_745 ) ( not ( = ?AUTO_744 ?AUTO_745 ) ) ( ON-TABLE ?AUTO_744 ) ( CLEAR ?AUTO_747 ) ( not ( = ?AUTO_744 ?AUTO_746 ) ) ( not ( = ?AUTO_744 ?AUTO_747 ) ) ( not ( = ?AUTO_745 ?AUTO_746 ) ) ( not ( = ?AUTO_745 ?AUTO_747 ) ) ( not ( = ?AUTO_746 ?AUTO_747 ) ) ( ON ?AUTO_746 ?AUTO_744 ) ( not ( = ?AUTO_744 ?AUTO_749 ) ) ( not ( = ?AUTO_744 ?AUTO_748 ) ) ( not ( = ?AUTO_745 ?AUTO_749 ) ) ( not ( = ?AUTO_745 ?AUTO_748 ) ) ( not ( = ?AUTO_747 ?AUTO_749 ) ) ( not ( = ?AUTO_747 ?AUTO_748 ) ) ( not ( = ?AUTO_746 ?AUTO_749 ) ) ( not ( = ?AUTO_746 ?AUTO_748 ) ) ( not ( = ?AUTO_749 ?AUTO_748 ) ) ( ON ?AUTO_749 ?AUTO_746 ) ( CLEAR ?AUTO_749 ) ( HOLDING ?AUTO_748 ) ( CLEAR ?AUTO_750 ) ( not ( = ?AUTO_744 ?AUTO_750 ) ) ( not ( = ?AUTO_745 ?AUTO_750 ) ) ( not ( = ?AUTO_747 ?AUTO_750 ) ) ( not ( = ?AUTO_746 ?AUTO_750 ) ) ( not ( = ?AUTO_749 ?AUTO_750 ) ) ( not ( = ?AUTO_748 ?AUTO_750 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_748 ?AUTO_750 )
      ( MAKE-ON ?AUTO_744 ?AUTO_745 )
      ( MAKE-ON-VERIFY ?AUTO_744 ?AUTO_745 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_755 - BLOCK
      ?AUTO_756 - BLOCK
    )
    :vars
    (
      ?AUTO_757 - BLOCK
      ?AUTO_761 - BLOCK
      ?AUTO_759 - BLOCK
      ?AUTO_760 - BLOCK
      ?AUTO_758 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_756 ) ( not ( = ?AUTO_755 ?AUTO_756 ) ) ( ON-TABLE ?AUTO_755 ) ( CLEAR ?AUTO_757 ) ( not ( = ?AUTO_755 ?AUTO_761 ) ) ( not ( = ?AUTO_755 ?AUTO_757 ) ) ( not ( = ?AUTO_756 ?AUTO_761 ) ) ( not ( = ?AUTO_756 ?AUTO_757 ) ) ( not ( = ?AUTO_761 ?AUTO_757 ) ) ( ON ?AUTO_761 ?AUTO_755 ) ( not ( = ?AUTO_755 ?AUTO_759 ) ) ( not ( = ?AUTO_755 ?AUTO_760 ) ) ( not ( = ?AUTO_756 ?AUTO_759 ) ) ( not ( = ?AUTO_756 ?AUTO_760 ) ) ( not ( = ?AUTO_757 ?AUTO_759 ) ) ( not ( = ?AUTO_757 ?AUTO_760 ) ) ( not ( = ?AUTO_761 ?AUTO_759 ) ) ( not ( = ?AUTO_761 ?AUTO_760 ) ) ( not ( = ?AUTO_759 ?AUTO_760 ) ) ( ON ?AUTO_759 ?AUTO_761 ) ( CLEAR ?AUTO_758 ) ( not ( = ?AUTO_755 ?AUTO_758 ) ) ( not ( = ?AUTO_756 ?AUTO_758 ) ) ( not ( = ?AUTO_757 ?AUTO_758 ) ) ( not ( = ?AUTO_761 ?AUTO_758 ) ) ( not ( = ?AUTO_759 ?AUTO_758 ) ) ( not ( = ?AUTO_760 ?AUTO_758 ) ) ( ON ?AUTO_760 ?AUTO_759 ) ( CLEAR ?AUTO_760 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_760 ?AUTO_759 )
      ( MAKE-ON ?AUTO_755 ?AUTO_756 )
      ( MAKE-ON-VERIFY ?AUTO_755 ?AUTO_756 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_762 - BLOCK
      ?AUTO_763 - BLOCK
    )
    :vars
    (
      ?AUTO_765 - BLOCK
      ?AUTO_766 - BLOCK
      ?AUTO_767 - BLOCK
      ?AUTO_768 - BLOCK
      ?AUTO_764 - BLOCK
      ?AUTO_769 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_763 ) ( not ( = ?AUTO_762 ?AUTO_763 ) ) ( ON-TABLE ?AUTO_762 ) ( CLEAR ?AUTO_765 ) ( not ( = ?AUTO_762 ?AUTO_766 ) ) ( not ( = ?AUTO_762 ?AUTO_765 ) ) ( not ( = ?AUTO_763 ?AUTO_766 ) ) ( not ( = ?AUTO_763 ?AUTO_765 ) ) ( not ( = ?AUTO_766 ?AUTO_765 ) ) ( ON ?AUTO_766 ?AUTO_762 ) ( not ( = ?AUTO_762 ?AUTO_767 ) ) ( not ( = ?AUTO_762 ?AUTO_768 ) ) ( not ( = ?AUTO_763 ?AUTO_767 ) ) ( not ( = ?AUTO_763 ?AUTO_768 ) ) ( not ( = ?AUTO_765 ?AUTO_767 ) ) ( not ( = ?AUTO_765 ?AUTO_768 ) ) ( not ( = ?AUTO_766 ?AUTO_767 ) ) ( not ( = ?AUTO_766 ?AUTO_768 ) ) ( not ( = ?AUTO_767 ?AUTO_768 ) ) ( ON ?AUTO_767 ?AUTO_766 ) ( CLEAR ?AUTO_764 ) ( not ( = ?AUTO_762 ?AUTO_764 ) ) ( not ( = ?AUTO_763 ?AUTO_764 ) ) ( not ( = ?AUTO_765 ?AUTO_764 ) ) ( not ( = ?AUTO_766 ?AUTO_764 ) ) ( not ( = ?AUTO_767 ?AUTO_764 ) ) ( not ( = ?AUTO_768 ?AUTO_764 ) ) ( ON ?AUTO_768 ?AUTO_767 ) ( CLEAR ?AUTO_768 ) ( HOLDING ?AUTO_769 ) ( not ( = ?AUTO_762 ?AUTO_769 ) ) ( not ( = ?AUTO_763 ?AUTO_769 ) ) ( not ( = ?AUTO_765 ?AUTO_769 ) ) ( not ( = ?AUTO_766 ?AUTO_769 ) ) ( not ( = ?AUTO_767 ?AUTO_769 ) ) ( not ( = ?AUTO_768 ?AUTO_769 ) ) ( not ( = ?AUTO_764 ?AUTO_769 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_769 )
      ( MAKE-ON ?AUTO_762 ?AUTO_763 )
      ( MAKE-ON-VERIFY ?AUTO_762 ?AUTO_763 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_770 - BLOCK
      ?AUTO_771 - BLOCK
    )
    :vars
    (
      ?AUTO_773 - BLOCK
      ?AUTO_776 - BLOCK
      ?AUTO_775 - BLOCK
      ?AUTO_772 - BLOCK
      ?AUTO_774 - BLOCK
      ?AUTO_777 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_771 ) ( not ( = ?AUTO_770 ?AUTO_771 ) ) ( ON-TABLE ?AUTO_770 ) ( CLEAR ?AUTO_773 ) ( not ( = ?AUTO_770 ?AUTO_776 ) ) ( not ( = ?AUTO_770 ?AUTO_773 ) ) ( not ( = ?AUTO_771 ?AUTO_776 ) ) ( not ( = ?AUTO_771 ?AUTO_773 ) ) ( not ( = ?AUTO_776 ?AUTO_773 ) ) ( ON ?AUTO_776 ?AUTO_770 ) ( not ( = ?AUTO_770 ?AUTO_775 ) ) ( not ( = ?AUTO_770 ?AUTO_772 ) ) ( not ( = ?AUTO_771 ?AUTO_775 ) ) ( not ( = ?AUTO_771 ?AUTO_772 ) ) ( not ( = ?AUTO_773 ?AUTO_775 ) ) ( not ( = ?AUTO_773 ?AUTO_772 ) ) ( not ( = ?AUTO_776 ?AUTO_775 ) ) ( not ( = ?AUTO_776 ?AUTO_772 ) ) ( not ( = ?AUTO_775 ?AUTO_772 ) ) ( ON ?AUTO_775 ?AUTO_776 ) ( CLEAR ?AUTO_774 ) ( not ( = ?AUTO_770 ?AUTO_774 ) ) ( not ( = ?AUTO_771 ?AUTO_774 ) ) ( not ( = ?AUTO_773 ?AUTO_774 ) ) ( not ( = ?AUTO_776 ?AUTO_774 ) ) ( not ( = ?AUTO_775 ?AUTO_774 ) ) ( not ( = ?AUTO_772 ?AUTO_774 ) ) ( ON ?AUTO_772 ?AUTO_775 ) ( not ( = ?AUTO_770 ?AUTO_777 ) ) ( not ( = ?AUTO_771 ?AUTO_777 ) ) ( not ( = ?AUTO_773 ?AUTO_777 ) ) ( not ( = ?AUTO_776 ?AUTO_777 ) ) ( not ( = ?AUTO_775 ?AUTO_777 ) ) ( not ( = ?AUTO_772 ?AUTO_777 ) ) ( not ( = ?AUTO_774 ?AUTO_777 ) ) ( ON ?AUTO_777 ?AUTO_772 ) ( CLEAR ?AUTO_777 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_777 ?AUTO_772 )
      ( MAKE-ON ?AUTO_770 ?AUTO_771 )
      ( MAKE-ON-VERIFY ?AUTO_770 ?AUTO_771 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_778 - BLOCK
      ?AUTO_779 - BLOCK
    )
    :vars
    (
      ?AUTO_785 - BLOCK
      ?AUTO_781 - BLOCK
      ?AUTO_780 - BLOCK
      ?AUTO_782 - BLOCK
      ?AUTO_784 - BLOCK
      ?AUTO_783 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_778 ?AUTO_779 ) ) ( ON-TABLE ?AUTO_778 ) ( CLEAR ?AUTO_785 ) ( not ( = ?AUTO_778 ?AUTO_781 ) ) ( not ( = ?AUTO_778 ?AUTO_785 ) ) ( not ( = ?AUTO_779 ?AUTO_781 ) ) ( not ( = ?AUTO_779 ?AUTO_785 ) ) ( not ( = ?AUTO_781 ?AUTO_785 ) ) ( ON ?AUTO_781 ?AUTO_778 ) ( not ( = ?AUTO_778 ?AUTO_780 ) ) ( not ( = ?AUTO_778 ?AUTO_782 ) ) ( not ( = ?AUTO_779 ?AUTO_780 ) ) ( not ( = ?AUTO_779 ?AUTO_782 ) ) ( not ( = ?AUTO_785 ?AUTO_780 ) ) ( not ( = ?AUTO_785 ?AUTO_782 ) ) ( not ( = ?AUTO_781 ?AUTO_780 ) ) ( not ( = ?AUTO_781 ?AUTO_782 ) ) ( not ( = ?AUTO_780 ?AUTO_782 ) ) ( ON ?AUTO_780 ?AUTO_781 ) ( CLEAR ?AUTO_784 ) ( not ( = ?AUTO_778 ?AUTO_784 ) ) ( not ( = ?AUTO_779 ?AUTO_784 ) ) ( not ( = ?AUTO_785 ?AUTO_784 ) ) ( not ( = ?AUTO_781 ?AUTO_784 ) ) ( not ( = ?AUTO_780 ?AUTO_784 ) ) ( not ( = ?AUTO_782 ?AUTO_784 ) ) ( ON ?AUTO_782 ?AUTO_780 ) ( not ( = ?AUTO_778 ?AUTO_783 ) ) ( not ( = ?AUTO_779 ?AUTO_783 ) ) ( not ( = ?AUTO_785 ?AUTO_783 ) ) ( not ( = ?AUTO_781 ?AUTO_783 ) ) ( not ( = ?AUTO_780 ?AUTO_783 ) ) ( not ( = ?AUTO_782 ?AUTO_783 ) ) ( not ( = ?AUTO_784 ?AUTO_783 ) ) ( ON ?AUTO_783 ?AUTO_782 ) ( CLEAR ?AUTO_783 ) ( HOLDING ?AUTO_779 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_779 )
      ( MAKE-ON ?AUTO_778 ?AUTO_779 )
      ( MAKE-ON-VERIFY ?AUTO_778 ?AUTO_779 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_786 - BLOCK
      ?AUTO_787 - BLOCK
    )
    :vars
    (
      ?AUTO_793 - BLOCK
      ?AUTO_792 - BLOCK
      ?AUTO_791 - BLOCK
      ?AUTO_789 - BLOCK
      ?AUTO_790 - BLOCK
      ?AUTO_788 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_786 ?AUTO_787 ) ) ( ON-TABLE ?AUTO_786 ) ( not ( = ?AUTO_786 ?AUTO_793 ) ) ( not ( = ?AUTO_786 ?AUTO_792 ) ) ( not ( = ?AUTO_787 ?AUTO_793 ) ) ( not ( = ?AUTO_787 ?AUTO_792 ) ) ( not ( = ?AUTO_793 ?AUTO_792 ) ) ( ON ?AUTO_793 ?AUTO_786 ) ( not ( = ?AUTO_786 ?AUTO_791 ) ) ( not ( = ?AUTO_786 ?AUTO_789 ) ) ( not ( = ?AUTO_787 ?AUTO_791 ) ) ( not ( = ?AUTO_787 ?AUTO_789 ) ) ( not ( = ?AUTO_792 ?AUTO_791 ) ) ( not ( = ?AUTO_792 ?AUTO_789 ) ) ( not ( = ?AUTO_793 ?AUTO_791 ) ) ( not ( = ?AUTO_793 ?AUTO_789 ) ) ( not ( = ?AUTO_791 ?AUTO_789 ) ) ( ON ?AUTO_791 ?AUTO_793 ) ( CLEAR ?AUTO_790 ) ( not ( = ?AUTO_786 ?AUTO_790 ) ) ( not ( = ?AUTO_787 ?AUTO_790 ) ) ( not ( = ?AUTO_792 ?AUTO_790 ) ) ( not ( = ?AUTO_793 ?AUTO_790 ) ) ( not ( = ?AUTO_791 ?AUTO_790 ) ) ( not ( = ?AUTO_789 ?AUTO_790 ) ) ( ON ?AUTO_789 ?AUTO_791 ) ( not ( = ?AUTO_786 ?AUTO_788 ) ) ( not ( = ?AUTO_787 ?AUTO_788 ) ) ( not ( = ?AUTO_792 ?AUTO_788 ) ) ( not ( = ?AUTO_793 ?AUTO_788 ) ) ( not ( = ?AUTO_791 ?AUTO_788 ) ) ( not ( = ?AUTO_789 ?AUTO_788 ) ) ( not ( = ?AUTO_790 ?AUTO_788 ) ) ( ON ?AUTO_788 ?AUTO_789 ) ( CLEAR ?AUTO_788 ) ( ON ?AUTO_787 ?AUTO_792 ) ( CLEAR ?AUTO_787 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_787 ?AUTO_792 )
      ( MAKE-ON ?AUTO_786 ?AUTO_787 )
      ( MAKE-ON-VERIFY ?AUTO_786 ?AUTO_787 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_795 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_795 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_795 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_795 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_796 - BLOCK
    )
    :vars
    (
      ?AUTO_797 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_796 ?AUTO_797 ) ( CLEAR ?AUTO_796 ) ( HAND-EMPTY ) ( not ( = ?AUTO_796 ?AUTO_797 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_796 ?AUTO_797 )
      ( MAKE-ON-TABLE ?AUTO_796 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_796 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_798 - BLOCK
    )
    :vars
    (
      ?AUTO_799 - BLOCK
      ?AUTO_800 - BLOCK
      ?AUTO_801 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_798 ?AUTO_799 ) ( CLEAR ?AUTO_798 ) ( not ( = ?AUTO_798 ?AUTO_799 ) ) ( HOLDING ?AUTO_800 ) ( CLEAR ?AUTO_801 ) ( not ( = ?AUTO_798 ?AUTO_800 ) ) ( not ( = ?AUTO_798 ?AUTO_801 ) ) ( not ( = ?AUTO_799 ?AUTO_800 ) ) ( not ( = ?AUTO_799 ?AUTO_801 ) ) ( not ( = ?AUTO_800 ?AUTO_801 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_800 ?AUTO_801 )
      ( MAKE-ON-TABLE ?AUTO_798 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_798 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_810 - BLOCK
    )
    :vars
    (
      ?AUTO_812 - BLOCK
      ?AUTO_813 - BLOCK
      ?AUTO_811 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_810 ?AUTO_812 ) ( not ( = ?AUTO_810 ?AUTO_812 ) ) ( CLEAR ?AUTO_813 ) ( not ( = ?AUTO_810 ?AUTO_811 ) ) ( not ( = ?AUTO_810 ?AUTO_813 ) ) ( not ( = ?AUTO_812 ?AUTO_811 ) ) ( not ( = ?AUTO_812 ?AUTO_813 ) ) ( not ( = ?AUTO_811 ?AUTO_813 ) ) ( ON ?AUTO_811 ?AUTO_810 ) ( CLEAR ?AUTO_811 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_811 ?AUTO_810 )
      ( MAKE-ON-TABLE ?AUTO_810 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_810 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_814 - BLOCK
    )
    :vars
    (
      ?AUTO_815 - BLOCK
      ?AUTO_817 - BLOCK
      ?AUTO_816 - BLOCK
      ?AUTO_818 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_814 ?AUTO_815 ) ( not ( = ?AUTO_814 ?AUTO_815 ) ) ( CLEAR ?AUTO_817 ) ( not ( = ?AUTO_814 ?AUTO_816 ) ) ( not ( = ?AUTO_814 ?AUTO_817 ) ) ( not ( = ?AUTO_815 ?AUTO_816 ) ) ( not ( = ?AUTO_815 ?AUTO_817 ) ) ( not ( = ?AUTO_816 ?AUTO_817 ) ) ( ON ?AUTO_816 ?AUTO_814 ) ( CLEAR ?AUTO_816 ) ( HOLDING ?AUTO_818 ) ( not ( = ?AUTO_814 ?AUTO_818 ) ) ( not ( = ?AUTO_815 ?AUTO_818 ) ) ( not ( = ?AUTO_817 ?AUTO_818 ) ) ( not ( = ?AUTO_816 ?AUTO_818 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_818 )
      ( MAKE-ON-TABLE ?AUTO_814 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_814 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_819 - BLOCK
    )
    :vars
    (
      ?AUTO_822 - BLOCK
      ?AUTO_823 - BLOCK
      ?AUTO_820 - BLOCK
      ?AUTO_821 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_819 ?AUTO_822 ) ( not ( = ?AUTO_819 ?AUTO_822 ) ) ( CLEAR ?AUTO_823 ) ( not ( = ?AUTO_819 ?AUTO_820 ) ) ( not ( = ?AUTO_819 ?AUTO_823 ) ) ( not ( = ?AUTO_822 ?AUTO_820 ) ) ( not ( = ?AUTO_822 ?AUTO_823 ) ) ( not ( = ?AUTO_820 ?AUTO_823 ) ) ( ON ?AUTO_820 ?AUTO_819 ) ( not ( = ?AUTO_819 ?AUTO_821 ) ) ( not ( = ?AUTO_822 ?AUTO_821 ) ) ( not ( = ?AUTO_823 ?AUTO_821 ) ) ( not ( = ?AUTO_820 ?AUTO_821 ) ) ( ON ?AUTO_821 ?AUTO_820 ) ( CLEAR ?AUTO_821 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_821 ?AUTO_820 )
      ( MAKE-ON-TABLE ?AUTO_819 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_819 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_824 - BLOCK
    )
    :vars
    (
      ?AUTO_826 - BLOCK
      ?AUTO_825 - BLOCK
      ?AUTO_827 - BLOCK
      ?AUTO_828 - BLOCK
      ?AUTO_829 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_824 ?AUTO_826 ) ( not ( = ?AUTO_824 ?AUTO_826 ) ) ( CLEAR ?AUTO_825 ) ( not ( = ?AUTO_824 ?AUTO_827 ) ) ( not ( = ?AUTO_824 ?AUTO_825 ) ) ( not ( = ?AUTO_826 ?AUTO_827 ) ) ( not ( = ?AUTO_826 ?AUTO_825 ) ) ( not ( = ?AUTO_827 ?AUTO_825 ) ) ( ON ?AUTO_827 ?AUTO_824 ) ( not ( = ?AUTO_824 ?AUTO_828 ) ) ( not ( = ?AUTO_826 ?AUTO_828 ) ) ( not ( = ?AUTO_825 ?AUTO_828 ) ) ( not ( = ?AUTO_827 ?AUTO_828 ) ) ( ON ?AUTO_828 ?AUTO_827 ) ( CLEAR ?AUTO_828 ) ( HOLDING ?AUTO_829 ) ( not ( = ?AUTO_824 ?AUTO_829 ) ) ( not ( = ?AUTO_826 ?AUTO_829 ) ) ( not ( = ?AUTO_825 ?AUTO_829 ) ) ( not ( = ?AUTO_827 ?AUTO_829 ) ) ( not ( = ?AUTO_828 ?AUTO_829 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_829 )
      ( MAKE-ON-TABLE ?AUTO_824 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_824 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_833 - BLOCK
      ?AUTO_834 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_833 ) ( CLEAR ?AUTO_834 ) ( not ( = ?AUTO_833 ?AUTO_834 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_833 ?AUTO_834 )
      ( MAKE-ON-VERIFY ?AUTO_833 ?AUTO_834 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_835 - BLOCK
      ?AUTO_836 - BLOCK
    )
    :vars
    (
      ?AUTO_837 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_836 ) ( not ( = ?AUTO_835 ?AUTO_836 ) ) ( ON ?AUTO_835 ?AUTO_837 ) ( CLEAR ?AUTO_835 ) ( HAND-EMPTY ) ( not ( = ?AUTO_835 ?AUTO_837 ) ) ( not ( = ?AUTO_836 ?AUTO_837 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_835 ?AUTO_837 )
      ( MAKE-ON ?AUTO_835 ?AUTO_836 )
      ( MAKE-ON-VERIFY ?AUTO_835 ?AUTO_836 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_838 - BLOCK
      ?AUTO_839 - BLOCK
    )
    :vars
    (
      ?AUTO_840 - BLOCK
      ?AUTO_841 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_839 ) ( not ( = ?AUTO_838 ?AUTO_839 ) ) ( ON ?AUTO_838 ?AUTO_840 ) ( CLEAR ?AUTO_838 ) ( not ( = ?AUTO_838 ?AUTO_840 ) ) ( not ( = ?AUTO_839 ?AUTO_840 ) ) ( HOLDING ?AUTO_841 ) ( not ( = ?AUTO_838 ?AUTO_841 ) ) ( not ( = ?AUTO_839 ?AUTO_841 ) ) ( not ( = ?AUTO_840 ?AUTO_841 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_841 )
      ( MAKE-ON ?AUTO_838 ?AUTO_839 )
      ( MAKE-ON-VERIFY ?AUTO_838 ?AUTO_839 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_842 - BLOCK
      ?AUTO_843 - BLOCK
    )
    :vars
    (
      ?AUTO_845 - BLOCK
      ?AUTO_844 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_843 ) ( not ( = ?AUTO_842 ?AUTO_843 ) ) ( ON ?AUTO_842 ?AUTO_845 ) ( not ( = ?AUTO_842 ?AUTO_845 ) ) ( not ( = ?AUTO_843 ?AUTO_845 ) ) ( not ( = ?AUTO_842 ?AUTO_844 ) ) ( not ( = ?AUTO_843 ?AUTO_844 ) ) ( not ( = ?AUTO_845 ?AUTO_844 ) ) ( ON ?AUTO_844 ?AUTO_842 ) ( CLEAR ?AUTO_844 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_844 ?AUTO_842 )
      ( MAKE-ON ?AUTO_842 ?AUTO_843 )
      ( MAKE-ON-VERIFY ?AUTO_842 ?AUTO_843 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_846 - BLOCK
      ?AUTO_847 - BLOCK
    )
    :vars
    (
      ?AUTO_849 - BLOCK
      ?AUTO_848 - BLOCK
      ?AUTO_850 - BLOCK
      ?AUTO_851 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_847 ) ( not ( = ?AUTO_846 ?AUTO_847 ) ) ( ON ?AUTO_846 ?AUTO_849 ) ( not ( = ?AUTO_846 ?AUTO_849 ) ) ( not ( = ?AUTO_847 ?AUTO_849 ) ) ( not ( = ?AUTO_846 ?AUTO_848 ) ) ( not ( = ?AUTO_847 ?AUTO_848 ) ) ( not ( = ?AUTO_849 ?AUTO_848 ) ) ( ON ?AUTO_848 ?AUTO_846 ) ( CLEAR ?AUTO_848 ) ( HOLDING ?AUTO_850 ) ( CLEAR ?AUTO_851 ) ( not ( = ?AUTO_846 ?AUTO_850 ) ) ( not ( = ?AUTO_846 ?AUTO_851 ) ) ( not ( = ?AUTO_847 ?AUTO_850 ) ) ( not ( = ?AUTO_847 ?AUTO_851 ) ) ( not ( = ?AUTO_849 ?AUTO_850 ) ) ( not ( = ?AUTO_849 ?AUTO_851 ) ) ( not ( = ?AUTO_848 ?AUTO_850 ) ) ( not ( = ?AUTO_848 ?AUTO_851 ) ) ( not ( = ?AUTO_850 ?AUTO_851 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_850 ?AUTO_851 )
      ( MAKE-ON ?AUTO_846 ?AUTO_847 )
      ( MAKE-ON-VERIFY ?AUTO_846 ?AUTO_847 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_854 - BLOCK
      ?AUTO_855 - BLOCK
    )
    :vars
    (
      ?AUTO_857 - BLOCK
      ?AUTO_856 - BLOCK
      ?AUTO_858 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_854 ?AUTO_855 ) ) ( ON ?AUTO_854 ?AUTO_857 ) ( not ( = ?AUTO_854 ?AUTO_857 ) ) ( not ( = ?AUTO_855 ?AUTO_857 ) ) ( not ( = ?AUTO_854 ?AUTO_856 ) ) ( not ( = ?AUTO_855 ?AUTO_856 ) ) ( not ( = ?AUTO_857 ?AUTO_856 ) ) ( ON ?AUTO_856 ?AUTO_854 ) ( CLEAR ?AUTO_856 ) ( HOLDING ?AUTO_855 ) ( CLEAR ?AUTO_858 ) ( not ( = ?AUTO_854 ?AUTO_858 ) ) ( not ( = ?AUTO_855 ?AUTO_858 ) ) ( not ( = ?AUTO_857 ?AUTO_858 ) ) ( not ( = ?AUTO_856 ?AUTO_858 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_855 ?AUTO_858 )
      ( MAKE-ON ?AUTO_854 ?AUTO_855 )
      ( MAKE-ON-VERIFY ?AUTO_854 ?AUTO_855 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_863 - BLOCK
      ?AUTO_864 - BLOCK
    )
    :vars
    (
      ?AUTO_866 - BLOCK
      ?AUTO_865 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_863 ?AUTO_864 ) ) ( ON ?AUTO_863 ?AUTO_866 ) ( CLEAR ?AUTO_863 ) ( not ( = ?AUTO_863 ?AUTO_866 ) ) ( not ( = ?AUTO_864 ?AUTO_866 ) ) ( not ( = ?AUTO_863 ?AUTO_865 ) ) ( not ( = ?AUTO_864 ?AUTO_865 ) ) ( not ( = ?AUTO_866 ?AUTO_865 ) ) ( ON ?AUTO_865 ?AUTO_864 ) ( CLEAR ?AUTO_865 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_865 ?AUTO_864 )
      ( MAKE-ON ?AUTO_863 ?AUTO_864 )
      ( MAKE-ON-VERIFY ?AUTO_863 ?AUTO_864 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_867 - BLOCK
      ?AUTO_868 - BLOCK
    )
    :vars
    (
      ?AUTO_870 - BLOCK
      ?AUTO_869 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_867 ?AUTO_868 ) ) ( not ( = ?AUTO_867 ?AUTO_870 ) ) ( not ( = ?AUTO_868 ?AUTO_870 ) ) ( not ( = ?AUTO_867 ?AUTO_869 ) ) ( not ( = ?AUTO_868 ?AUTO_869 ) ) ( not ( = ?AUTO_870 ?AUTO_869 ) ) ( ON ?AUTO_869 ?AUTO_868 ) ( CLEAR ?AUTO_869 ) ( HOLDING ?AUTO_867 ) ( CLEAR ?AUTO_870 ) )
    :subtasks
    ( ( !STACK ?AUTO_867 ?AUTO_870 )
      ( MAKE-ON ?AUTO_867 ?AUTO_868 )
      ( MAKE-ON-VERIFY ?AUTO_867 ?AUTO_868 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_871 - BLOCK
      ?AUTO_872 - BLOCK
    )
    :vars
    (
      ?AUTO_873 - BLOCK
      ?AUTO_874 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_871 ?AUTO_872 ) ) ( not ( = ?AUTO_871 ?AUTO_873 ) ) ( not ( = ?AUTO_872 ?AUTO_873 ) ) ( not ( = ?AUTO_871 ?AUTO_874 ) ) ( not ( = ?AUTO_872 ?AUTO_874 ) ) ( not ( = ?AUTO_873 ?AUTO_874 ) ) ( ON ?AUTO_874 ?AUTO_872 ) ( CLEAR ?AUTO_874 ) ( CLEAR ?AUTO_873 ) ( ON-TABLE ?AUTO_871 ) ( CLEAR ?AUTO_871 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_871 )
      ( MAKE-ON ?AUTO_871 ?AUTO_872 )
      ( MAKE-ON-VERIFY ?AUTO_871 ?AUTO_872 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_875 - BLOCK
      ?AUTO_876 - BLOCK
    )
    :vars
    (
      ?AUTO_877 - BLOCK
      ?AUTO_878 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_875 ?AUTO_876 ) ) ( not ( = ?AUTO_875 ?AUTO_877 ) ) ( not ( = ?AUTO_876 ?AUTO_877 ) ) ( not ( = ?AUTO_875 ?AUTO_878 ) ) ( not ( = ?AUTO_876 ?AUTO_878 ) ) ( not ( = ?AUTO_877 ?AUTO_878 ) ) ( ON ?AUTO_878 ?AUTO_876 ) ( CLEAR ?AUTO_878 ) ( ON-TABLE ?AUTO_875 ) ( CLEAR ?AUTO_875 ) ( HOLDING ?AUTO_877 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_877 )
      ( MAKE-ON ?AUTO_875 ?AUTO_876 )
      ( MAKE-ON-VERIFY ?AUTO_875 ?AUTO_876 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_879 - BLOCK
      ?AUTO_880 - BLOCK
    )
    :vars
    (
      ?AUTO_881 - BLOCK
      ?AUTO_882 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_879 ?AUTO_880 ) ) ( not ( = ?AUTO_879 ?AUTO_881 ) ) ( not ( = ?AUTO_880 ?AUTO_881 ) ) ( not ( = ?AUTO_879 ?AUTO_882 ) ) ( not ( = ?AUTO_880 ?AUTO_882 ) ) ( not ( = ?AUTO_881 ?AUTO_882 ) ) ( ON ?AUTO_882 ?AUTO_880 ) ( ON-TABLE ?AUTO_879 ) ( CLEAR ?AUTO_879 ) ( ON ?AUTO_881 ?AUTO_882 ) ( CLEAR ?AUTO_881 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_881 ?AUTO_882 )
      ( MAKE-ON ?AUTO_879 ?AUTO_880 )
      ( MAKE-ON-VERIFY ?AUTO_879 ?AUTO_880 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_883 - BLOCK
      ?AUTO_884 - BLOCK
    )
    :vars
    (
      ?AUTO_886 - BLOCK
      ?AUTO_885 - BLOCK
      ?AUTO_887 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_883 ?AUTO_884 ) ) ( not ( = ?AUTO_883 ?AUTO_886 ) ) ( not ( = ?AUTO_884 ?AUTO_886 ) ) ( not ( = ?AUTO_883 ?AUTO_885 ) ) ( not ( = ?AUTO_884 ?AUTO_885 ) ) ( not ( = ?AUTO_886 ?AUTO_885 ) ) ( ON ?AUTO_885 ?AUTO_884 ) ( ON-TABLE ?AUTO_883 ) ( CLEAR ?AUTO_883 ) ( ON ?AUTO_886 ?AUTO_885 ) ( CLEAR ?AUTO_886 ) ( HOLDING ?AUTO_887 ) ( not ( = ?AUTO_883 ?AUTO_887 ) ) ( not ( = ?AUTO_884 ?AUTO_887 ) ) ( not ( = ?AUTO_886 ?AUTO_887 ) ) ( not ( = ?AUTO_885 ?AUTO_887 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_887 )
      ( MAKE-ON ?AUTO_883 ?AUTO_884 )
      ( MAKE-ON-VERIFY ?AUTO_883 ?AUTO_884 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_888 - BLOCK
      ?AUTO_889 - BLOCK
    )
    :vars
    (
      ?AUTO_890 - BLOCK
      ?AUTO_891 - BLOCK
      ?AUTO_892 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_888 ?AUTO_889 ) ) ( not ( = ?AUTO_888 ?AUTO_890 ) ) ( not ( = ?AUTO_889 ?AUTO_890 ) ) ( not ( = ?AUTO_888 ?AUTO_891 ) ) ( not ( = ?AUTO_889 ?AUTO_891 ) ) ( not ( = ?AUTO_890 ?AUTO_891 ) ) ( ON ?AUTO_891 ?AUTO_889 ) ( ON-TABLE ?AUTO_888 ) ( CLEAR ?AUTO_888 ) ( ON ?AUTO_890 ?AUTO_891 ) ( not ( = ?AUTO_888 ?AUTO_892 ) ) ( not ( = ?AUTO_889 ?AUTO_892 ) ) ( not ( = ?AUTO_890 ?AUTO_892 ) ) ( not ( = ?AUTO_891 ?AUTO_892 ) ) ( ON ?AUTO_892 ?AUTO_890 ) ( CLEAR ?AUTO_892 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_892 ?AUTO_890 )
      ( MAKE-ON ?AUTO_888 ?AUTO_889 )
      ( MAKE-ON-VERIFY ?AUTO_888 ?AUTO_889 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_893 - BLOCK
      ?AUTO_894 - BLOCK
    )
    :vars
    (
      ?AUTO_895 - BLOCK
      ?AUTO_897 - BLOCK
      ?AUTO_896 - BLOCK
      ?AUTO_898 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_893 ?AUTO_894 ) ) ( not ( = ?AUTO_893 ?AUTO_895 ) ) ( not ( = ?AUTO_894 ?AUTO_895 ) ) ( not ( = ?AUTO_893 ?AUTO_897 ) ) ( not ( = ?AUTO_894 ?AUTO_897 ) ) ( not ( = ?AUTO_895 ?AUTO_897 ) ) ( ON ?AUTO_897 ?AUTO_894 ) ( ON-TABLE ?AUTO_893 ) ( CLEAR ?AUTO_893 ) ( ON ?AUTO_895 ?AUTO_897 ) ( not ( = ?AUTO_893 ?AUTO_896 ) ) ( not ( = ?AUTO_894 ?AUTO_896 ) ) ( not ( = ?AUTO_895 ?AUTO_896 ) ) ( not ( = ?AUTO_897 ?AUTO_896 ) ) ( ON ?AUTO_896 ?AUTO_895 ) ( CLEAR ?AUTO_896 ) ( HOLDING ?AUTO_898 ) ( not ( = ?AUTO_893 ?AUTO_898 ) ) ( not ( = ?AUTO_894 ?AUTO_898 ) ) ( not ( = ?AUTO_895 ?AUTO_898 ) ) ( not ( = ?AUTO_897 ?AUTO_898 ) ) ( not ( = ?AUTO_896 ?AUTO_898 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_898 )
      ( MAKE-ON ?AUTO_893 ?AUTO_894 )
      ( MAKE-ON-VERIFY ?AUTO_893 ?AUTO_894 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_903 - BLOCK
      ?AUTO_904 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_903 ) ( CLEAR ?AUTO_904 ) ( not ( = ?AUTO_903 ?AUTO_904 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_903 ?AUTO_904 )
      ( MAKE-ON-VERIFY ?AUTO_903 ?AUTO_904 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_905 - BLOCK
      ?AUTO_906 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_906 ) ( not ( = ?AUTO_905 ?AUTO_906 ) ) ( ON-TABLE ?AUTO_905 ) ( CLEAR ?AUTO_905 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_905 )
      ( MAKE-ON ?AUTO_905 ?AUTO_906 )
      ( MAKE-ON-VERIFY ?AUTO_905 ?AUTO_906 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_907 - BLOCK
      ?AUTO_908 - BLOCK
    )
    :vars
    (
      ?AUTO_909 - BLOCK
      ?AUTO_910 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_908 ) ( not ( = ?AUTO_907 ?AUTO_908 ) ) ( ON-TABLE ?AUTO_907 ) ( CLEAR ?AUTO_907 ) ( HOLDING ?AUTO_909 ) ( CLEAR ?AUTO_910 ) ( not ( = ?AUTO_907 ?AUTO_909 ) ) ( not ( = ?AUTO_907 ?AUTO_910 ) ) ( not ( = ?AUTO_908 ?AUTO_909 ) ) ( not ( = ?AUTO_908 ?AUTO_910 ) ) ( not ( = ?AUTO_909 ?AUTO_910 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_909 ?AUTO_910 )
      ( MAKE-ON ?AUTO_907 ?AUTO_908 )
      ( MAKE-ON-VERIFY ?AUTO_907 ?AUTO_908 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_911 - BLOCK
      ?AUTO_912 - BLOCK
    )
    :vars
    (
      ?AUTO_913 - BLOCK
      ?AUTO_914 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_912 ) ( not ( = ?AUTO_911 ?AUTO_912 ) ) ( ON-TABLE ?AUTO_911 ) ( CLEAR ?AUTO_913 ) ( not ( = ?AUTO_911 ?AUTO_914 ) ) ( not ( = ?AUTO_911 ?AUTO_913 ) ) ( not ( = ?AUTO_912 ?AUTO_914 ) ) ( not ( = ?AUTO_912 ?AUTO_913 ) ) ( not ( = ?AUTO_914 ?AUTO_913 ) ) ( ON ?AUTO_914 ?AUTO_911 ) ( CLEAR ?AUTO_914 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_914 ?AUTO_911 )
      ( MAKE-ON ?AUTO_911 ?AUTO_912 )
      ( MAKE-ON-VERIFY ?AUTO_911 ?AUTO_912 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_915 - BLOCK
      ?AUTO_916 - BLOCK
    )
    :vars
    (
      ?AUTO_918 - BLOCK
      ?AUTO_917 - BLOCK
      ?AUTO_919 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_916 ) ( not ( = ?AUTO_915 ?AUTO_916 ) ) ( ON-TABLE ?AUTO_915 ) ( CLEAR ?AUTO_918 ) ( not ( = ?AUTO_915 ?AUTO_917 ) ) ( not ( = ?AUTO_915 ?AUTO_918 ) ) ( not ( = ?AUTO_916 ?AUTO_917 ) ) ( not ( = ?AUTO_916 ?AUTO_918 ) ) ( not ( = ?AUTO_917 ?AUTO_918 ) ) ( ON ?AUTO_917 ?AUTO_915 ) ( CLEAR ?AUTO_917 ) ( HOLDING ?AUTO_919 ) ( not ( = ?AUTO_915 ?AUTO_919 ) ) ( not ( = ?AUTO_916 ?AUTO_919 ) ) ( not ( = ?AUTO_918 ?AUTO_919 ) ) ( not ( = ?AUTO_917 ?AUTO_919 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_919 )
      ( MAKE-ON ?AUTO_915 ?AUTO_916 )
      ( MAKE-ON-VERIFY ?AUTO_915 ?AUTO_916 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_920 - BLOCK
      ?AUTO_921 - BLOCK
    )
    :vars
    (
      ?AUTO_923 - BLOCK
      ?AUTO_922 - BLOCK
      ?AUTO_924 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_921 ) ( not ( = ?AUTO_920 ?AUTO_921 ) ) ( ON-TABLE ?AUTO_920 ) ( CLEAR ?AUTO_923 ) ( not ( = ?AUTO_920 ?AUTO_922 ) ) ( not ( = ?AUTO_920 ?AUTO_923 ) ) ( not ( = ?AUTO_921 ?AUTO_922 ) ) ( not ( = ?AUTO_921 ?AUTO_923 ) ) ( not ( = ?AUTO_922 ?AUTO_923 ) ) ( ON ?AUTO_922 ?AUTO_920 ) ( not ( = ?AUTO_920 ?AUTO_924 ) ) ( not ( = ?AUTO_921 ?AUTO_924 ) ) ( not ( = ?AUTO_923 ?AUTO_924 ) ) ( not ( = ?AUTO_922 ?AUTO_924 ) ) ( ON ?AUTO_924 ?AUTO_922 ) ( CLEAR ?AUTO_924 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_924 ?AUTO_922 )
      ( MAKE-ON ?AUTO_920 ?AUTO_921 )
      ( MAKE-ON-VERIFY ?AUTO_920 ?AUTO_921 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_925 - BLOCK
      ?AUTO_926 - BLOCK
    )
    :vars
    (
      ?AUTO_927 - BLOCK
      ?AUTO_928 - BLOCK
      ?AUTO_929 - BLOCK
      ?AUTO_930 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_925 ?AUTO_926 ) ) ( ON-TABLE ?AUTO_925 ) ( CLEAR ?AUTO_927 ) ( not ( = ?AUTO_925 ?AUTO_928 ) ) ( not ( = ?AUTO_925 ?AUTO_927 ) ) ( not ( = ?AUTO_926 ?AUTO_928 ) ) ( not ( = ?AUTO_926 ?AUTO_927 ) ) ( not ( = ?AUTO_928 ?AUTO_927 ) ) ( ON ?AUTO_928 ?AUTO_925 ) ( not ( = ?AUTO_925 ?AUTO_929 ) ) ( not ( = ?AUTO_926 ?AUTO_929 ) ) ( not ( = ?AUTO_927 ?AUTO_929 ) ) ( not ( = ?AUTO_928 ?AUTO_929 ) ) ( ON ?AUTO_929 ?AUTO_928 ) ( CLEAR ?AUTO_929 ) ( HOLDING ?AUTO_926 ) ( CLEAR ?AUTO_930 ) ( not ( = ?AUTO_925 ?AUTO_930 ) ) ( not ( = ?AUTO_926 ?AUTO_930 ) ) ( not ( = ?AUTO_927 ?AUTO_930 ) ) ( not ( = ?AUTO_928 ?AUTO_930 ) ) ( not ( = ?AUTO_929 ?AUTO_930 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_926 ?AUTO_930 )
      ( MAKE-ON ?AUTO_925 ?AUTO_926 )
      ( MAKE-ON-VERIFY ?AUTO_925 ?AUTO_926 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_933 - BLOCK
      ?AUTO_934 - BLOCK
    )
    :vars
    (
      ?AUTO_936 - BLOCK
      ?AUTO_937 - BLOCK
      ?AUTO_935 - BLOCK
      ?AUTO_938 - BLOCK
      ?AUTO_939 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_934 ) ( not ( = ?AUTO_933 ?AUTO_934 ) ) ( ON-TABLE ?AUTO_933 ) ( CLEAR ?AUTO_936 ) ( not ( = ?AUTO_933 ?AUTO_937 ) ) ( not ( = ?AUTO_933 ?AUTO_936 ) ) ( not ( = ?AUTO_934 ?AUTO_937 ) ) ( not ( = ?AUTO_934 ?AUTO_936 ) ) ( not ( = ?AUTO_937 ?AUTO_936 ) ) ( ON ?AUTO_937 ?AUTO_933 ) ( not ( = ?AUTO_933 ?AUTO_935 ) ) ( not ( = ?AUTO_934 ?AUTO_935 ) ) ( not ( = ?AUTO_936 ?AUTO_935 ) ) ( not ( = ?AUTO_937 ?AUTO_935 ) ) ( ON ?AUTO_935 ?AUTO_937 ) ( CLEAR ?AUTO_935 ) ( HOLDING ?AUTO_938 ) ( CLEAR ?AUTO_939 ) ( not ( = ?AUTO_933 ?AUTO_938 ) ) ( not ( = ?AUTO_933 ?AUTO_939 ) ) ( not ( = ?AUTO_934 ?AUTO_938 ) ) ( not ( = ?AUTO_934 ?AUTO_939 ) ) ( not ( = ?AUTO_936 ?AUTO_938 ) ) ( not ( = ?AUTO_936 ?AUTO_939 ) ) ( not ( = ?AUTO_937 ?AUTO_938 ) ) ( not ( = ?AUTO_937 ?AUTO_939 ) ) ( not ( = ?AUTO_935 ?AUTO_938 ) ) ( not ( = ?AUTO_935 ?AUTO_939 ) ) ( not ( = ?AUTO_938 ?AUTO_939 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_938 ?AUTO_939 )
      ( MAKE-ON ?AUTO_933 ?AUTO_934 )
      ( MAKE-ON-VERIFY ?AUTO_933 ?AUTO_934 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_940 - BLOCK
      ?AUTO_941 - BLOCK
    )
    :vars
    (
      ?AUTO_942 - BLOCK
      ?AUTO_943 - BLOCK
      ?AUTO_944 - BLOCK
      ?AUTO_946 - BLOCK
      ?AUTO_945 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_940 ?AUTO_941 ) ) ( ON-TABLE ?AUTO_940 ) ( CLEAR ?AUTO_942 ) ( not ( = ?AUTO_940 ?AUTO_943 ) ) ( not ( = ?AUTO_940 ?AUTO_942 ) ) ( not ( = ?AUTO_941 ?AUTO_943 ) ) ( not ( = ?AUTO_941 ?AUTO_942 ) ) ( not ( = ?AUTO_943 ?AUTO_942 ) ) ( ON ?AUTO_943 ?AUTO_940 ) ( not ( = ?AUTO_940 ?AUTO_944 ) ) ( not ( = ?AUTO_941 ?AUTO_944 ) ) ( not ( = ?AUTO_942 ?AUTO_944 ) ) ( not ( = ?AUTO_943 ?AUTO_944 ) ) ( ON ?AUTO_944 ?AUTO_943 ) ( CLEAR ?AUTO_944 ) ( CLEAR ?AUTO_946 ) ( not ( = ?AUTO_940 ?AUTO_945 ) ) ( not ( = ?AUTO_940 ?AUTO_946 ) ) ( not ( = ?AUTO_941 ?AUTO_945 ) ) ( not ( = ?AUTO_941 ?AUTO_946 ) ) ( not ( = ?AUTO_942 ?AUTO_945 ) ) ( not ( = ?AUTO_942 ?AUTO_946 ) ) ( not ( = ?AUTO_943 ?AUTO_945 ) ) ( not ( = ?AUTO_943 ?AUTO_946 ) ) ( not ( = ?AUTO_944 ?AUTO_945 ) ) ( not ( = ?AUTO_944 ?AUTO_946 ) ) ( not ( = ?AUTO_945 ?AUTO_946 ) ) ( ON ?AUTO_945 ?AUTO_941 ) ( CLEAR ?AUTO_945 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_945 ?AUTO_941 )
      ( MAKE-ON ?AUTO_940 ?AUTO_941 )
      ( MAKE-ON-VERIFY ?AUTO_940 ?AUTO_941 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_947 - BLOCK
      ?AUTO_948 - BLOCK
    )
    :vars
    (
      ?AUTO_950 - BLOCK
      ?AUTO_949 - BLOCK
      ?AUTO_953 - BLOCK
      ?AUTO_951 - BLOCK
      ?AUTO_952 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_947 ?AUTO_948 ) ) ( ON-TABLE ?AUTO_947 ) ( CLEAR ?AUTO_950 ) ( not ( = ?AUTO_947 ?AUTO_949 ) ) ( not ( = ?AUTO_947 ?AUTO_950 ) ) ( not ( = ?AUTO_948 ?AUTO_949 ) ) ( not ( = ?AUTO_948 ?AUTO_950 ) ) ( not ( = ?AUTO_949 ?AUTO_950 ) ) ( ON ?AUTO_949 ?AUTO_947 ) ( not ( = ?AUTO_947 ?AUTO_953 ) ) ( not ( = ?AUTO_948 ?AUTO_953 ) ) ( not ( = ?AUTO_950 ?AUTO_953 ) ) ( not ( = ?AUTO_949 ?AUTO_953 ) ) ( CLEAR ?AUTO_951 ) ( not ( = ?AUTO_947 ?AUTO_952 ) ) ( not ( = ?AUTO_947 ?AUTO_951 ) ) ( not ( = ?AUTO_948 ?AUTO_952 ) ) ( not ( = ?AUTO_948 ?AUTO_951 ) ) ( not ( = ?AUTO_950 ?AUTO_952 ) ) ( not ( = ?AUTO_950 ?AUTO_951 ) ) ( not ( = ?AUTO_949 ?AUTO_952 ) ) ( not ( = ?AUTO_949 ?AUTO_951 ) ) ( not ( = ?AUTO_953 ?AUTO_952 ) ) ( not ( = ?AUTO_953 ?AUTO_951 ) ) ( not ( = ?AUTO_952 ?AUTO_951 ) ) ( ON ?AUTO_952 ?AUTO_948 ) ( CLEAR ?AUTO_952 ) ( HOLDING ?AUTO_953 ) ( CLEAR ?AUTO_949 ) )
    :subtasks
    ( ( !STACK ?AUTO_953 ?AUTO_949 )
      ( MAKE-ON ?AUTO_947 ?AUTO_948 )
      ( MAKE-ON-VERIFY ?AUTO_947 ?AUTO_948 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_954 - BLOCK
      ?AUTO_955 - BLOCK
    )
    :vars
    (
      ?AUTO_956 - BLOCK
      ?AUTO_957 - BLOCK
      ?AUTO_958 - BLOCK
      ?AUTO_960 - BLOCK
      ?AUTO_959 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_954 ?AUTO_955 ) ) ( ON-TABLE ?AUTO_954 ) ( CLEAR ?AUTO_956 ) ( not ( = ?AUTO_954 ?AUTO_957 ) ) ( not ( = ?AUTO_954 ?AUTO_956 ) ) ( not ( = ?AUTO_955 ?AUTO_957 ) ) ( not ( = ?AUTO_955 ?AUTO_956 ) ) ( not ( = ?AUTO_957 ?AUTO_956 ) ) ( ON ?AUTO_957 ?AUTO_954 ) ( not ( = ?AUTO_954 ?AUTO_958 ) ) ( not ( = ?AUTO_955 ?AUTO_958 ) ) ( not ( = ?AUTO_956 ?AUTO_958 ) ) ( not ( = ?AUTO_957 ?AUTO_958 ) ) ( CLEAR ?AUTO_960 ) ( not ( = ?AUTO_954 ?AUTO_959 ) ) ( not ( = ?AUTO_954 ?AUTO_960 ) ) ( not ( = ?AUTO_955 ?AUTO_959 ) ) ( not ( = ?AUTO_955 ?AUTO_960 ) ) ( not ( = ?AUTO_956 ?AUTO_959 ) ) ( not ( = ?AUTO_956 ?AUTO_960 ) ) ( not ( = ?AUTO_957 ?AUTO_959 ) ) ( not ( = ?AUTO_957 ?AUTO_960 ) ) ( not ( = ?AUTO_958 ?AUTO_959 ) ) ( not ( = ?AUTO_958 ?AUTO_960 ) ) ( not ( = ?AUTO_959 ?AUTO_960 ) ) ( ON ?AUTO_959 ?AUTO_955 ) ( CLEAR ?AUTO_957 ) ( ON ?AUTO_958 ?AUTO_959 ) ( CLEAR ?AUTO_958 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_958 ?AUTO_959 )
      ( MAKE-ON ?AUTO_954 ?AUTO_955 )
      ( MAKE-ON-VERIFY ?AUTO_954 ?AUTO_955 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_961 - BLOCK
      ?AUTO_962 - BLOCK
    )
    :vars
    (
      ?AUTO_964 - BLOCK
      ?AUTO_963 - BLOCK
      ?AUTO_966 - BLOCK
      ?AUTO_965 - BLOCK
      ?AUTO_967 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_961 ?AUTO_962 ) ) ( ON-TABLE ?AUTO_961 ) ( CLEAR ?AUTO_964 ) ( not ( = ?AUTO_961 ?AUTO_963 ) ) ( not ( = ?AUTO_961 ?AUTO_964 ) ) ( not ( = ?AUTO_962 ?AUTO_963 ) ) ( not ( = ?AUTO_962 ?AUTO_964 ) ) ( not ( = ?AUTO_963 ?AUTO_964 ) ) ( not ( = ?AUTO_961 ?AUTO_966 ) ) ( not ( = ?AUTO_962 ?AUTO_966 ) ) ( not ( = ?AUTO_964 ?AUTO_966 ) ) ( not ( = ?AUTO_963 ?AUTO_966 ) ) ( CLEAR ?AUTO_965 ) ( not ( = ?AUTO_961 ?AUTO_967 ) ) ( not ( = ?AUTO_961 ?AUTO_965 ) ) ( not ( = ?AUTO_962 ?AUTO_967 ) ) ( not ( = ?AUTO_962 ?AUTO_965 ) ) ( not ( = ?AUTO_964 ?AUTO_967 ) ) ( not ( = ?AUTO_964 ?AUTO_965 ) ) ( not ( = ?AUTO_963 ?AUTO_967 ) ) ( not ( = ?AUTO_963 ?AUTO_965 ) ) ( not ( = ?AUTO_966 ?AUTO_967 ) ) ( not ( = ?AUTO_966 ?AUTO_965 ) ) ( not ( = ?AUTO_967 ?AUTO_965 ) ) ( ON ?AUTO_967 ?AUTO_962 ) ( ON ?AUTO_966 ?AUTO_967 ) ( CLEAR ?AUTO_966 ) ( HOLDING ?AUTO_963 ) ( CLEAR ?AUTO_961 ) )
    :subtasks
    ( ( !STACK ?AUTO_963 ?AUTO_961 )
      ( MAKE-ON ?AUTO_961 ?AUTO_962 )
      ( MAKE-ON-VERIFY ?AUTO_961 ?AUTO_962 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_968 - BLOCK
      ?AUTO_969 - BLOCK
    )
    :vars
    (
      ?AUTO_971 - BLOCK
      ?AUTO_972 - BLOCK
      ?AUTO_973 - BLOCK
      ?AUTO_974 - BLOCK
      ?AUTO_970 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_968 ?AUTO_969 ) ) ( ON-TABLE ?AUTO_968 ) ( CLEAR ?AUTO_971 ) ( not ( = ?AUTO_968 ?AUTO_972 ) ) ( not ( = ?AUTO_968 ?AUTO_971 ) ) ( not ( = ?AUTO_969 ?AUTO_972 ) ) ( not ( = ?AUTO_969 ?AUTO_971 ) ) ( not ( = ?AUTO_972 ?AUTO_971 ) ) ( not ( = ?AUTO_968 ?AUTO_973 ) ) ( not ( = ?AUTO_969 ?AUTO_973 ) ) ( not ( = ?AUTO_971 ?AUTO_973 ) ) ( not ( = ?AUTO_972 ?AUTO_973 ) ) ( CLEAR ?AUTO_974 ) ( not ( = ?AUTO_968 ?AUTO_970 ) ) ( not ( = ?AUTO_968 ?AUTO_974 ) ) ( not ( = ?AUTO_969 ?AUTO_970 ) ) ( not ( = ?AUTO_969 ?AUTO_974 ) ) ( not ( = ?AUTO_971 ?AUTO_970 ) ) ( not ( = ?AUTO_971 ?AUTO_974 ) ) ( not ( = ?AUTO_972 ?AUTO_970 ) ) ( not ( = ?AUTO_972 ?AUTO_974 ) ) ( not ( = ?AUTO_973 ?AUTO_970 ) ) ( not ( = ?AUTO_973 ?AUTO_974 ) ) ( not ( = ?AUTO_970 ?AUTO_974 ) ) ( ON ?AUTO_970 ?AUTO_969 ) ( ON ?AUTO_973 ?AUTO_970 ) ( CLEAR ?AUTO_973 ) ( CLEAR ?AUTO_968 ) ( ON-TABLE ?AUTO_972 ) ( CLEAR ?AUTO_972 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_972 )
      ( MAKE-ON ?AUTO_968 ?AUTO_969 )
      ( MAKE-ON-VERIFY ?AUTO_968 ?AUTO_969 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_975 - BLOCK
      ?AUTO_976 - BLOCK
    )
    :vars
    (
      ?AUTO_978 - BLOCK
      ?AUTO_979 - BLOCK
      ?AUTO_980 - BLOCK
      ?AUTO_981 - BLOCK
      ?AUTO_977 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_975 ?AUTO_976 ) ) ( CLEAR ?AUTO_978 ) ( not ( = ?AUTO_975 ?AUTO_979 ) ) ( not ( = ?AUTO_975 ?AUTO_978 ) ) ( not ( = ?AUTO_976 ?AUTO_979 ) ) ( not ( = ?AUTO_976 ?AUTO_978 ) ) ( not ( = ?AUTO_979 ?AUTO_978 ) ) ( not ( = ?AUTO_975 ?AUTO_980 ) ) ( not ( = ?AUTO_976 ?AUTO_980 ) ) ( not ( = ?AUTO_978 ?AUTO_980 ) ) ( not ( = ?AUTO_979 ?AUTO_980 ) ) ( CLEAR ?AUTO_981 ) ( not ( = ?AUTO_975 ?AUTO_977 ) ) ( not ( = ?AUTO_975 ?AUTO_981 ) ) ( not ( = ?AUTO_976 ?AUTO_977 ) ) ( not ( = ?AUTO_976 ?AUTO_981 ) ) ( not ( = ?AUTO_978 ?AUTO_977 ) ) ( not ( = ?AUTO_978 ?AUTO_981 ) ) ( not ( = ?AUTO_979 ?AUTO_977 ) ) ( not ( = ?AUTO_979 ?AUTO_981 ) ) ( not ( = ?AUTO_980 ?AUTO_977 ) ) ( not ( = ?AUTO_980 ?AUTO_981 ) ) ( not ( = ?AUTO_977 ?AUTO_981 ) ) ( ON ?AUTO_977 ?AUTO_976 ) ( ON ?AUTO_980 ?AUTO_977 ) ( CLEAR ?AUTO_980 ) ( ON-TABLE ?AUTO_979 ) ( CLEAR ?AUTO_979 ) ( HOLDING ?AUTO_975 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_975 )
      ( MAKE-ON ?AUTO_975 ?AUTO_976 )
      ( MAKE-ON-VERIFY ?AUTO_975 ?AUTO_976 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_982 - BLOCK
      ?AUTO_983 - BLOCK
    )
    :vars
    (
      ?AUTO_984 - BLOCK
      ?AUTO_985 - BLOCK
      ?AUTO_987 - BLOCK
      ?AUTO_986 - BLOCK
      ?AUTO_988 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_982 ?AUTO_983 ) ) ( CLEAR ?AUTO_984 ) ( not ( = ?AUTO_982 ?AUTO_985 ) ) ( not ( = ?AUTO_982 ?AUTO_984 ) ) ( not ( = ?AUTO_983 ?AUTO_985 ) ) ( not ( = ?AUTO_983 ?AUTO_984 ) ) ( not ( = ?AUTO_985 ?AUTO_984 ) ) ( not ( = ?AUTO_982 ?AUTO_987 ) ) ( not ( = ?AUTO_983 ?AUTO_987 ) ) ( not ( = ?AUTO_984 ?AUTO_987 ) ) ( not ( = ?AUTO_985 ?AUTO_987 ) ) ( CLEAR ?AUTO_986 ) ( not ( = ?AUTO_982 ?AUTO_988 ) ) ( not ( = ?AUTO_982 ?AUTO_986 ) ) ( not ( = ?AUTO_983 ?AUTO_988 ) ) ( not ( = ?AUTO_983 ?AUTO_986 ) ) ( not ( = ?AUTO_984 ?AUTO_988 ) ) ( not ( = ?AUTO_984 ?AUTO_986 ) ) ( not ( = ?AUTO_985 ?AUTO_988 ) ) ( not ( = ?AUTO_985 ?AUTO_986 ) ) ( not ( = ?AUTO_987 ?AUTO_988 ) ) ( not ( = ?AUTO_987 ?AUTO_986 ) ) ( not ( = ?AUTO_988 ?AUTO_986 ) ) ( ON ?AUTO_988 ?AUTO_983 ) ( ON ?AUTO_987 ?AUTO_988 ) ( ON-TABLE ?AUTO_985 ) ( CLEAR ?AUTO_985 ) ( ON ?AUTO_982 ?AUTO_987 ) ( CLEAR ?AUTO_982 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_982 ?AUTO_987 )
      ( MAKE-ON ?AUTO_982 ?AUTO_983 )
      ( MAKE-ON-VERIFY ?AUTO_982 ?AUTO_983 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_989 - BLOCK
      ?AUTO_990 - BLOCK
    )
    :vars
    (
      ?AUTO_991 - BLOCK
      ?AUTO_993 - BLOCK
      ?AUTO_994 - BLOCK
      ?AUTO_995 - BLOCK
      ?AUTO_992 - BLOCK
      ?AUTO_996 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_989 ?AUTO_990 ) ) ( CLEAR ?AUTO_991 ) ( not ( = ?AUTO_989 ?AUTO_993 ) ) ( not ( = ?AUTO_989 ?AUTO_991 ) ) ( not ( = ?AUTO_990 ?AUTO_993 ) ) ( not ( = ?AUTO_990 ?AUTO_991 ) ) ( not ( = ?AUTO_993 ?AUTO_991 ) ) ( not ( = ?AUTO_989 ?AUTO_994 ) ) ( not ( = ?AUTO_990 ?AUTO_994 ) ) ( not ( = ?AUTO_991 ?AUTO_994 ) ) ( not ( = ?AUTO_993 ?AUTO_994 ) ) ( CLEAR ?AUTO_995 ) ( not ( = ?AUTO_989 ?AUTO_992 ) ) ( not ( = ?AUTO_989 ?AUTO_995 ) ) ( not ( = ?AUTO_990 ?AUTO_992 ) ) ( not ( = ?AUTO_990 ?AUTO_995 ) ) ( not ( = ?AUTO_991 ?AUTO_992 ) ) ( not ( = ?AUTO_991 ?AUTO_995 ) ) ( not ( = ?AUTO_993 ?AUTO_992 ) ) ( not ( = ?AUTO_993 ?AUTO_995 ) ) ( not ( = ?AUTO_994 ?AUTO_992 ) ) ( not ( = ?AUTO_994 ?AUTO_995 ) ) ( not ( = ?AUTO_992 ?AUTO_995 ) ) ( ON ?AUTO_992 ?AUTO_990 ) ( ON ?AUTO_994 ?AUTO_992 ) ( ON-TABLE ?AUTO_993 ) ( CLEAR ?AUTO_993 ) ( ON ?AUTO_989 ?AUTO_994 ) ( CLEAR ?AUTO_989 ) ( HOLDING ?AUTO_996 ) ( not ( = ?AUTO_989 ?AUTO_996 ) ) ( not ( = ?AUTO_990 ?AUTO_996 ) ) ( not ( = ?AUTO_991 ?AUTO_996 ) ) ( not ( = ?AUTO_993 ?AUTO_996 ) ) ( not ( = ?AUTO_994 ?AUTO_996 ) ) ( not ( = ?AUTO_995 ?AUTO_996 ) ) ( not ( = ?AUTO_992 ?AUTO_996 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_996 )
      ( MAKE-ON ?AUTO_989 ?AUTO_990 )
      ( MAKE-ON-VERIFY ?AUTO_989 ?AUTO_990 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_997 - BLOCK
      ?AUTO_998 - BLOCK
    )
    :vars
    (
      ?AUTO_1000 - BLOCK
      ?AUTO_1004 - BLOCK
      ?AUTO_1002 - BLOCK
      ?AUTO_999 - BLOCK
      ?AUTO_1001 - BLOCK
      ?AUTO_1003 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_997 ?AUTO_998 ) ) ( CLEAR ?AUTO_1000 ) ( not ( = ?AUTO_997 ?AUTO_1004 ) ) ( not ( = ?AUTO_997 ?AUTO_1000 ) ) ( not ( = ?AUTO_998 ?AUTO_1004 ) ) ( not ( = ?AUTO_998 ?AUTO_1000 ) ) ( not ( = ?AUTO_1004 ?AUTO_1000 ) ) ( not ( = ?AUTO_997 ?AUTO_1002 ) ) ( not ( = ?AUTO_998 ?AUTO_1002 ) ) ( not ( = ?AUTO_1000 ?AUTO_1002 ) ) ( not ( = ?AUTO_1004 ?AUTO_1002 ) ) ( CLEAR ?AUTO_999 ) ( not ( = ?AUTO_997 ?AUTO_1001 ) ) ( not ( = ?AUTO_997 ?AUTO_999 ) ) ( not ( = ?AUTO_998 ?AUTO_1001 ) ) ( not ( = ?AUTO_998 ?AUTO_999 ) ) ( not ( = ?AUTO_1000 ?AUTO_1001 ) ) ( not ( = ?AUTO_1000 ?AUTO_999 ) ) ( not ( = ?AUTO_1004 ?AUTO_1001 ) ) ( not ( = ?AUTO_1004 ?AUTO_999 ) ) ( not ( = ?AUTO_1002 ?AUTO_1001 ) ) ( not ( = ?AUTO_1002 ?AUTO_999 ) ) ( not ( = ?AUTO_1001 ?AUTO_999 ) ) ( ON ?AUTO_1001 ?AUTO_998 ) ( ON ?AUTO_1002 ?AUTO_1001 ) ( ON-TABLE ?AUTO_1004 ) ( CLEAR ?AUTO_1004 ) ( ON ?AUTO_997 ?AUTO_1002 ) ( not ( = ?AUTO_997 ?AUTO_1003 ) ) ( not ( = ?AUTO_998 ?AUTO_1003 ) ) ( not ( = ?AUTO_1000 ?AUTO_1003 ) ) ( not ( = ?AUTO_1004 ?AUTO_1003 ) ) ( not ( = ?AUTO_1002 ?AUTO_1003 ) ) ( not ( = ?AUTO_999 ?AUTO_1003 ) ) ( not ( = ?AUTO_1001 ?AUTO_1003 ) ) ( ON ?AUTO_1003 ?AUTO_997 ) ( CLEAR ?AUTO_1003 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1003 ?AUTO_997 )
      ( MAKE-ON ?AUTO_997 ?AUTO_998 )
      ( MAKE-ON-VERIFY ?AUTO_997 ?AUTO_998 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1005 - BLOCK
      ?AUTO_1006 - BLOCK
    )
    :vars
    (
      ?AUTO_1008 - BLOCK
      ?AUTO_1007 - BLOCK
      ?AUTO_1010 - BLOCK
      ?AUTO_1012 - BLOCK
      ?AUTO_1011 - BLOCK
      ?AUTO_1009 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1005 ?AUTO_1006 ) ) ( not ( = ?AUTO_1005 ?AUTO_1008 ) ) ( not ( = ?AUTO_1005 ?AUTO_1007 ) ) ( not ( = ?AUTO_1006 ?AUTO_1008 ) ) ( not ( = ?AUTO_1006 ?AUTO_1007 ) ) ( not ( = ?AUTO_1008 ?AUTO_1007 ) ) ( not ( = ?AUTO_1005 ?AUTO_1010 ) ) ( not ( = ?AUTO_1006 ?AUTO_1010 ) ) ( not ( = ?AUTO_1007 ?AUTO_1010 ) ) ( not ( = ?AUTO_1008 ?AUTO_1010 ) ) ( CLEAR ?AUTO_1012 ) ( not ( = ?AUTO_1005 ?AUTO_1011 ) ) ( not ( = ?AUTO_1005 ?AUTO_1012 ) ) ( not ( = ?AUTO_1006 ?AUTO_1011 ) ) ( not ( = ?AUTO_1006 ?AUTO_1012 ) ) ( not ( = ?AUTO_1007 ?AUTO_1011 ) ) ( not ( = ?AUTO_1007 ?AUTO_1012 ) ) ( not ( = ?AUTO_1008 ?AUTO_1011 ) ) ( not ( = ?AUTO_1008 ?AUTO_1012 ) ) ( not ( = ?AUTO_1010 ?AUTO_1011 ) ) ( not ( = ?AUTO_1010 ?AUTO_1012 ) ) ( not ( = ?AUTO_1011 ?AUTO_1012 ) ) ( ON ?AUTO_1011 ?AUTO_1006 ) ( ON ?AUTO_1010 ?AUTO_1011 ) ( ON-TABLE ?AUTO_1008 ) ( CLEAR ?AUTO_1008 ) ( ON ?AUTO_1005 ?AUTO_1010 ) ( not ( = ?AUTO_1005 ?AUTO_1009 ) ) ( not ( = ?AUTO_1006 ?AUTO_1009 ) ) ( not ( = ?AUTO_1007 ?AUTO_1009 ) ) ( not ( = ?AUTO_1008 ?AUTO_1009 ) ) ( not ( = ?AUTO_1010 ?AUTO_1009 ) ) ( not ( = ?AUTO_1012 ?AUTO_1009 ) ) ( not ( = ?AUTO_1011 ?AUTO_1009 ) ) ( ON ?AUTO_1009 ?AUTO_1005 ) ( CLEAR ?AUTO_1009 ) ( HOLDING ?AUTO_1007 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1007 )
      ( MAKE-ON ?AUTO_1005 ?AUTO_1006 )
      ( MAKE-ON-VERIFY ?AUTO_1005 ?AUTO_1006 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1013 - BLOCK
      ?AUTO_1014 - BLOCK
    )
    :vars
    (
      ?AUTO_1017 - BLOCK
      ?AUTO_1016 - BLOCK
      ?AUTO_1018 - BLOCK
      ?AUTO_1020 - BLOCK
      ?AUTO_1015 - BLOCK
      ?AUTO_1019 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1013 ?AUTO_1014 ) ) ( not ( = ?AUTO_1013 ?AUTO_1017 ) ) ( not ( = ?AUTO_1013 ?AUTO_1016 ) ) ( not ( = ?AUTO_1014 ?AUTO_1017 ) ) ( not ( = ?AUTO_1014 ?AUTO_1016 ) ) ( not ( = ?AUTO_1017 ?AUTO_1016 ) ) ( not ( = ?AUTO_1013 ?AUTO_1018 ) ) ( not ( = ?AUTO_1014 ?AUTO_1018 ) ) ( not ( = ?AUTO_1016 ?AUTO_1018 ) ) ( not ( = ?AUTO_1017 ?AUTO_1018 ) ) ( not ( = ?AUTO_1013 ?AUTO_1020 ) ) ( not ( = ?AUTO_1013 ?AUTO_1015 ) ) ( not ( = ?AUTO_1014 ?AUTO_1020 ) ) ( not ( = ?AUTO_1014 ?AUTO_1015 ) ) ( not ( = ?AUTO_1016 ?AUTO_1020 ) ) ( not ( = ?AUTO_1016 ?AUTO_1015 ) ) ( not ( = ?AUTO_1017 ?AUTO_1020 ) ) ( not ( = ?AUTO_1017 ?AUTO_1015 ) ) ( not ( = ?AUTO_1018 ?AUTO_1020 ) ) ( not ( = ?AUTO_1018 ?AUTO_1015 ) ) ( not ( = ?AUTO_1020 ?AUTO_1015 ) ) ( ON ?AUTO_1020 ?AUTO_1014 ) ( ON ?AUTO_1018 ?AUTO_1020 ) ( ON-TABLE ?AUTO_1017 ) ( CLEAR ?AUTO_1017 ) ( ON ?AUTO_1013 ?AUTO_1018 ) ( not ( = ?AUTO_1013 ?AUTO_1019 ) ) ( not ( = ?AUTO_1014 ?AUTO_1019 ) ) ( not ( = ?AUTO_1016 ?AUTO_1019 ) ) ( not ( = ?AUTO_1017 ?AUTO_1019 ) ) ( not ( = ?AUTO_1018 ?AUTO_1019 ) ) ( not ( = ?AUTO_1015 ?AUTO_1019 ) ) ( not ( = ?AUTO_1020 ?AUTO_1019 ) ) ( ON ?AUTO_1019 ?AUTO_1013 ) ( CLEAR ?AUTO_1019 ) ( ON ?AUTO_1016 ?AUTO_1015 ) ( CLEAR ?AUTO_1016 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1016 ?AUTO_1015 )
      ( MAKE-ON ?AUTO_1013 ?AUTO_1014 )
      ( MAKE-ON-VERIFY ?AUTO_1013 ?AUTO_1014 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1023 - BLOCK
      ?AUTO_1024 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1023 ) ( CLEAR ?AUTO_1024 ) ( not ( = ?AUTO_1023 ?AUTO_1024 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1023 ?AUTO_1024 )
      ( MAKE-ON-VERIFY ?AUTO_1023 ?AUTO_1024 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1025 - BLOCK
      ?AUTO_1026 - BLOCK
    )
    :vars
    (
      ?AUTO_1027 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1026 ) ( not ( = ?AUTO_1025 ?AUTO_1026 ) ) ( ON ?AUTO_1025 ?AUTO_1027 ) ( CLEAR ?AUTO_1025 ) ( HAND-EMPTY ) ( not ( = ?AUTO_1025 ?AUTO_1027 ) ) ( not ( = ?AUTO_1026 ?AUTO_1027 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1025 ?AUTO_1027 )
      ( MAKE-ON ?AUTO_1025 ?AUTO_1026 )
      ( MAKE-ON-VERIFY ?AUTO_1025 ?AUTO_1026 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1028 - BLOCK
      ?AUTO_1029 - BLOCK
    )
    :vars
    (
      ?AUTO_1030 - BLOCK
      ?AUTO_1031 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1028 ?AUTO_1029 ) ) ( ON ?AUTO_1028 ?AUTO_1030 ) ( CLEAR ?AUTO_1028 ) ( not ( = ?AUTO_1028 ?AUTO_1030 ) ) ( not ( = ?AUTO_1029 ?AUTO_1030 ) ) ( HOLDING ?AUTO_1029 ) ( CLEAR ?AUTO_1031 ) ( not ( = ?AUTO_1028 ?AUTO_1031 ) ) ( not ( = ?AUTO_1029 ?AUTO_1031 ) ) ( not ( = ?AUTO_1030 ?AUTO_1031 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1029 ?AUTO_1031 )
      ( MAKE-ON ?AUTO_1028 ?AUTO_1029 )
      ( MAKE-ON-VERIFY ?AUTO_1028 ?AUTO_1029 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1100 - BLOCK
      ?AUTO_1101 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1100 ) ( CLEAR ?AUTO_1101 ) ( not ( = ?AUTO_1100 ?AUTO_1101 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1100 ?AUTO_1101 )
      ( MAKE-ON-VERIFY ?AUTO_1100 ?AUTO_1101 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1102 - BLOCK
      ?AUTO_1103 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1103 ) ( not ( = ?AUTO_1102 ?AUTO_1103 ) ) ( ON-TABLE ?AUTO_1102 ) ( CLEAR ?AUTO_1102 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_1102 )
      ( MAKE-ON ?AUTO_1102 ?AUTO_1103 )
      ( MAKE-ON-VERIFY ?AUTO_1102 ?AUTO_1103 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1104 - BLOCK
      ?AUTO_1105 - BLOCK
    )
    :vars
    (
      ?AUTO_1106 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1104 ?AUTO_1105 ) ) ( ON-TABLE ?AUTO_1104 ) ( CLEAR ?AUTO_1104 ) ( HOLDING ?AUTO_1105 ) ( CLEAR ?AUTO_1106 ) ( not ( = ?AUTO_1104 ?AUTO_1106 ) ) ( not ( = ?AUTO_1105 ?AUTO_1106 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1105 ?AUTO_1106 )
      ( MAKE-ON ?AUTO_1104 ?AUTO_1105 )
      ( MAKE-ON-VERIFY ?AUTO_1104 ?AUTO_1105 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1109 - BLOCK
      ?AUTO_1110 - BLOCK
    )
    :vars
    (
      ?AUTO_1111 - BLOCK
      ?AUTO_1112 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1110 ) ( not ( = ?AUTO_1109 ?AUTO_1110 ) ) ( ON-TABLE ?AUTO_1109 ) ( CLEAR ?AUTO_1109 ) ( HOLDING ?AUTO_1111 ) ( CLEAR ?AUTO_1112 ) ( not ( = ?AUTO_1109 ?AUTO_1111 ) ) ( not ( = ?AUTO_1109 ?AUTO_1112 ) ) ( not ( = ?AUTO_1110 ?AUTO_1111 ) ) ( not ( = ?AUTO_1110 ?AUTO_1112 ) ) ( not ( = ?AUTO_1111 ?AUTO_1112 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1111 ?AUTO_1112 )
      ( MAKE-ON ?AUTO_1109 ?AUTO_1110 )
      ( MAKE-ON-VERIFY ?AUTO_1109 ?AUTO_1110 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1114 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1114 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1114 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1114 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1115 - BLOCK
    )
    :vars
    (
      ?AUTO_1116 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1115 ?AUTO_1116 ) ( CLEAR ?AUTO_1115 ) ( HAND-EMPTY ) ( not ( = ?AUTO_1115 ?AUTO_1116 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1115 ?AUTO_1116 )
      ( MAKE-ON-TABLE ?AUTO_1115 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1115 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1118 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1118 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1118 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1118 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1119 - BLOCK
    )
    :vars
    (
      ?AUTO_1120 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1119 ?AUTO_1120 ) ( CLEAR ?AUTO_1119 ) ( HAND-EMPTY ) ( not ( = ?AUTO_1119 ?AUTO_1120 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1119 ?AUTO_1120 )
      ( MAKE-ON-TABLE ?AUTO_1119 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1119 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1121 - BLOCK
    )
    :vars
    (
      ?AUTO_1122 - BLOCK
      ?AUTO_1123 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1121 ?AUTO_1122 ) ( CLEAR ?AUTO_1121 ) ( not ( = ?AUTO_1121 ?AUTO_1122 ) ) ( HOLDING ?AUTO_1123 ) ( not ( = ?AUTO_1121 ?AUTO_1123 ) ) ( not ( = ?AUTO_1122 ?AUTO_1123 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1123 )
      ( MAKE-ON-TABLE ?AUTO_1121 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1121 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1127 - BLOCK
      ?AUTO_1128 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1127 ) ( CLEAR ?AUTO_1128 ) ( not ( = ?AUTO_1127 ?AUTO_1128 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1127 ?AUTO_1128 )
      ( MAKE-ON-VERIFY ?AUTO_1127 ?AUTO_1128 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1129 - BLOCK
      ?AUTO_1130 - BLOCK
    )
    :vars
    (
      ?AUTO_1131 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1130 ) ( not ( = ?AUTO_1129 ?AUTO_1130 ) ) ( ON ?AUTO_1129 ?AUTO_1131 ) ( CLEAR ?AUTO_1129 ) ( HAND-EMPTY ) ( not ( = ?AUTO_1129 ?AUTO_1131 ) ) ( not ( = ?AUTO_1130 ?AUTO_1131 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1129 ?AUTO_1131 )
      ( MAKE-ON ?AUTO_1129 ?AUTO_1130 )
      ( MAKE-ON-VERIFY ?AUTO_1129 ?AUTO_1130 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1132 - BLOCK
      ?AUTO_1133 - BLOCK
    )
    :vars
    (
      ?AUTO_1134 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1132 ?AUTO_1133 ) ) ( ON ?AUTO_1132 ?AUTO_1134 ) ( CLEAR ?AUTO_1132 ) ( not ( = ?AUTO_1132 ?AUTO_1134 ) ) ( not ( = ?AUTO_1133 ?AUTO_1134 ) ) ( HOLDING ?AUTO_1133 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1133 )
      ( MAKE-ON ?AUTO_1132 ?AUTO_1133 )
      ( MAKE-ON-VERIFY ?AUTO_1132 ?AUTO_1133 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1135 - BLOCK
      ?AUTO_1136 - BLOCK
    )
    :vars
    (
      ?AUTO_1137 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1135 ?AUTO_1136 ) ) ( ON ?AUTO_1135 ?AUTO_1137 ) ( not ( = ?AUTO_1135 ?AUTO_1137 ) ) ( not ( = ?AUTO_1136 ?AUTO_1137 ) ) ( ON ?AUTO_1136 ?AUTO_1135 ) ( CLEAR ?AUTO_1136 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1136 ?AUTO_1135 )
      ( MAKE-ON ?AUTO_1135 ?AUTO_1136 )
      ( MAKE-ON-VERIFY ?AUTO_1135 ?AUTO_1136 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1138 - BLOCK
      ?AUTO_1139 - BLOCK
    )
    :vars
    (
      ?AUTO_1140 - BLOCK
      ?AUTO_1141 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1138 ?AUTO_1139 ) ) ( ON ?AUTO_1138 ?AUTO_1140 ) ( not ( = ?AUTO_1138 ?AUTO_1140 ) ) ( not ( = ?AUTO_1139 ?AUTO_1140 ) ) ( ON ?AUTO_1139 ?AUTO_1138 ) ( CLEAR ?AUTO_1139 ) ( HOLDING ?AUTO_1141 ) ( not ( = ?AUTO_1138 ?AUTO_1141 ) ) ( not ( = ?AUTO_1139 ?AUTO_1141 ) ) ( not ( = ?AUTO_1140 ?AUTO_1141 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1141 )
      ( MAKE-ON ?AUTO_1138 ?AUTO_1139 )
      ( MAKE-ON-VERIFY ?AUTO_1138 ?AUTO_1139 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1146 - BLOCK
      ?AUTO_1147 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1146 ) ( CLEAR ?AUTO_1147 ) ( not ( = ?AUTO_1146 ?AUTO_1147 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1146 ?AUTO_1147 )
      ( MAKE-ON-VERIFY ?AUTO_1146 ?AUTO_1147 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1148 - BLOCK
      ?AUTO_1149 - BLOCK
    )
    :vars
    (
      ?AUTO_1150 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1149 ) ( not ( = ?AUTO_1148 ?AUTO_1149 ) ) ( ON ?AUTO_1148 ?AUTO_1150 ) ( CLEAR ?AUTO_1148 ) ( HAND-EMPTY ) ( not ( = ?AUTO_1148 ?AUTO_1150 ) ) ( not ( = ?AUTO_1149 ?AUTO_1150 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1148 ?AUTO_1150 )
      ( MAKE-ON ?AUTO_1148 ?AUTO_1149 )
      ( MAKE-ON-VERIFY ?AUTO_1148 ?AUTO_1149 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1151 - BLOCK
      ?AUTO_1152 - BLOCK
    )
    :vars
    (
      ?AUTO_1153 - BLOCK
      ?AUTO_1154 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1151 ?AUTO_1152 ) ) ( ON ?AUTO_1151 ?AUTO_1153 ) ( CLEAR ?AUTO_1151 ) ( not ( = ?AUTO_1151 ?AUTO_1153 ) ) ( not ( = ?AUTO_1152 ?AUTO_1153 ) ) ( HOLDING ?AUTO_1152 ) ( CLEAR ?AUTO_1154 ) ( not ( = ?AUTO_1151 ?AUTO_1154 ) ) ( not ( = ?AUTO_1152 ?AUTO_1154 ) ) ( not ( = ?AUTO_1153 ?AUTO_1154 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1152 ?AUTO_1154 )
      ( MAKE-ON ?AUTO_1151 ?AUTO_1152 )
      ( MAKE-ON-VERIFY ?AUTO_1151 ?AUTO_1152 ) )
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
    ( and ( CLEAR ?AUTO_1158 ) ( not ( = ?AUTO_1157 ?AUTO_1158 ) ) ( ON ?AUTO_1157 ?AUTO_1159 ) ( CLEAR ?AUTO_1157 ) ( not ( = ?AUTO_1157 ?AUTO_1159 ) ) ( not ( = ?AUTO_1158 ?AUTO_1159 ) ) ( HOLDING ?AUTO_1160 ) ( not ( = ?AUTO_1157 ?AUTO_1160 ) ) ( not ( = ?AUTO_1158 ?AUTO_1160 ) ) ( not ( = ?AUTO_1159 ?AUTO_1160 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1160 )
      ( MAKE-ON ?AUTO_1157 ?AUTO_1158 )
      ( MAKE-ON-VERIFY ?AUTO_1157 ?AUTO_1158 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1161 - BLOCK
      ?AUTO_1162 - BLOCK
    )
    :vars
    (
      ?AUTO_1163 - BLOCK
      ?AUTO_1164 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1161 ?AUTO_1162 ) ) ( ON ?AUTO_1161 ?AUTO_1163 ) ( CLEAR ?AUTO_1161 ) ( not ( = ?AUTO_1161 ?AUTO_1163 ) ) ( not ( = ?AUTO_1162 ?AUTO_1163 ) ) ( not ( = ?AUTO_1161 ?AUTO_1164 ) ) ( not ( = ?AUTO_1162 ?AUTO_1164 ) ) ( not ( = ?AUTO_1163 ?AUTO_1164 ) ) ( ON ?AUTO_1164 ?AUTO_1162 ) ( CLEAR ?AUTO_1164 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1164 ?AUTO_1162 )
      ( MAKE-ON ?AUTO_1161 ?AUTO_1162 )
      ( MAKE-ON-VERIFY ?AUTO_1161 ?AUTO_1162 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1165 - BLOCK
      ?AUTO_1166 - BLOCK
    )
    :vars
    (
      ?AUTO_1167 - BLOCK
      ?AUTO_1168 - BLOCK
      ?AUTO_1169 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1165 ?AUTO_1166 ) ) ( ON ?AUTO_1165 ?AUTO_1167 ) ( CLEAR ?AUTO_1165 ) ( not ( = ?AUTO_1165 ?AUTO_1167 ) ) ( not ( = ?AUTO_1166 ?AUTO_1167 ) ) ( not ( = ?AUTO_1165 ?AUTO_1168 ) ) ( not ( = ?AUTO_1166 ?AUTO_1168 ) ) ( not ( = ?AUTO_1167 ?AUTO_1168 ) ) ( ON ?AUTO_1168 ?AUTO_1166 ) ( CLEAR ?AUTO_1168 ) ( HOLDING ?AUTO_1169 ) ( not ( = ?AUTO_1165 ?AUTO_1169 ) ) ( not ( = ?AUTO_1166 ?AUTO_1169 ) ) ( not ( = ?AUTO_1167 ?AUTO_1169 ) ) ( not ( = ?AUTO_1168 ?AUTO_1169 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1169 )
      ( MAKE-ON ?AUTO_1165 ?AUTO_1166 )
      ( MAKE-ON-VERIFY ?AUTO_1165 ?AUTO_1166 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1170 - BLOCK
      ?AUTO_1171 - BLOCK
    )
    :vars
    (
      ?AUTO_1172 - BLOCK
      ?AUTO_1173 - BLOCK
      ?AUTO_1174 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1170 ?AUTO_1171 ) ) ( ON ?AUTO_1170 ?AUTO_1172 ) ( not ( = ?AUTO_1170 ?AUTO_1172 ) ) ( not ( = ?AUTO_1171 ?AUTO_1172 ) ) ( not ( = ?AUTO_1170 ?AUTO_1173 ) ) ( not ( = ?AUTO_1171 ?AUTO_1173 ) ) ( not ( = ?AUTO_1172 ?AUTO_1173 ) ) ( ON ?AUTO_1173 ?AUTO_1171 ) ( CLEAR ?AUTO_1173 ) ( not ( = ?AUTO_1170 ?AUTO_1174 ) ) ( not ( = ?AUTO_1171 ?AUTO_1174 ) ) ( not ( = ?AUTO_1172 ?AUTO_1174 ) ) ( not ( = ?AUTO_1173 ?AUTO_1174 ) ) ( ON ?AUTO_1174 ?AUTO_1170 ) ( CLEAR ?AUTO_1174 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1174 ?AUTO_1170 )
      ( MAKE-ON ?AUTO_1170 ?AUTO_1171 )
      ( MAKE-ON-VERIFY ?AUTO_1170 ?AUTO_1171 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1177 - BLOCK
      ?AUTO_1178 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1177 ) ( CLEAR ?AUTO_1178 ) ( not ( = ?AUTO_1177 ?AUTO_1178 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1177 ?AUTO_1178 )
      ( MAKE-ON-VERIFY ?AUTO_1177 ?AUTO_1178 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1179 - BLOCK
      ?AUTO_1180 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1180 ) ( not ( = ?AUTO_1179 ?AUTO_1180 ) ) ( ON-TABLE ?AUTO_1179 ) ( CLEAR ?AUTO_1179 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_1179 )
      ( MAKE-ON ?AUTO_1179 ?AUTO_1180 )
      ( MAKE-ON-VERIFY ?AUTO_1179 ?AUTO_1180 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1181 - BLOCK
      ?AUTO_1182 - BLOCK
    )
    :vars
    (
      ?AUTO_1183 - BLOCK
      ?AUTO_1184 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1182 ) ( not ( = ?AUTO_1181 ?AUTO_1182 ) ) ( ON-TABLE ?AUTO_1181 ) ( CLEAR ?AUTO_1181 ) ( HOLDING ?AUTO_1183 ) ( CLEAR ?AUTO_1184 ) ( not ( = ?AUTO_1181 ?AUTO_1183 ) ) ( not ( = ?AUTO_1181 ?AUTO_1184 ) ) ( not ( = ?AUTO_1182 ?AUTO_1183 ) ) ( not ( = ?AUTO_1182 ?AUTO_1184 ) ) ( not ( = ?AUTO_1183 ?AUTO_1184 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1183 ?AUTO_1184 )
      ( MAKE-ON ?AUTO_1181 ?AUTO_1182 )
      ( MAKE-ON-VERIFY ?AUTO_1181 ?AUTO_1182 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1185 - BLOCK
      ?AUTO_1186 - BLOCK
    )
    :vars
    (
      ?AUTO_1187 - BLOCK
      ?AUTO_1188 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1186 ) ( not ( = ?AUTO_1185 ?AUTO_1186 ) ) ( ON-TABLE ?AUTO_1185 ) ( CLEAR ?AUTO_1187 ) ( not ( = ?AUTO_1185 ?AUTO_1188 ) ) ( not ( = ?AUTO_1185 ?AUTO_1187 ) ) ( not ( = ?AUTO_1186 ?AUTO_1188 ) ) ( not ( = ?AUTO_1186 ?AUTO_1187 ) ) ( not ( = ?AUTO_1188 ?AUTO_1187 ) ) ( ON ?AUTO_1188 ?AUTO_1185 ) ( CLEAR ?AUTO_1188 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1188 ?AUTO_1185 )
      ( MAKE-ON ?AUTO_1185 ?AUTO_1186 )
      ( MAKE-ON-VERIFY ?AUTO_1185 ?AUTO_1186 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1189 - BLOCK
      ?AUTO_1190 - BLOCK
    )
    :vars
    (
      ?AUTO_1192 - BLOCK
      ?AUTO_1191 - BLOCK
      ?AUTO_1193 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1190 ) ( not ( = ?AUTO_1189 ?AUTO_1190 ) ) ( ON-TABLE ?AUTO_1189 ) ( not ( = ?AUTO_1189 ?AUTO_1192 ) ) ( not ( = ?AUTO_1189 ?AUTO_1191 ) ) ( not ( = ?AUTO_1190 ?AUTO_1192 ) ) ( not ( = ?AUTO_1190 ?AUTO_1191 ) ) ( not ( = ?AUTO_1192 ?AUTO_1191 ) ) ( ON ?AUTO_1192 ?AUTO_1189 ) ( CLEAR ?AUTO_1192 ) ( HOLDING ?AUTO_1191 ) ( CLEAR ?AUTO_1193 ) ( not ( = ?AUTO_1189 ?AUTO_1193 ) ) ( not ( = ?AUTO_1190 ?AUTO_1193 ) ) ( not ( = ?AUTO_1192 ?AUTO_1193 ) ) ( not ( = ?AUTO_1191 ?AUTO_1193 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1191 ?AUTO_1193 )
      ( MAKE-ON ?AUTO_1189 ?AUTO_1190 )
      ( MAKE-ON-VERIFY ?AUTO_1189 ?AUTO_1190 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1200 - BLOCK
      ?AUTO_1201 - BLOCK
    )
    :vars
    (
      ?AUTO_1202 - BLOCK
      ?AUTO_1203 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1200 ?AUTO_1201 ) ) ( ON-TABLE ?AUTO_1200 ) ( CLEAR ?AUTO_1202 ) ( not ( = ?AUTO_1200 ?AUTO_1203 ) ) ( not ( = ?AUTO_1200 ?AUTO_1202 ) ) ( not ( = ?AUTO_1201 ?AUTO_1203 ) ) ( not ( = ?AUTO_1201 ?AUTO_1202 ) ) ( not ( = ?AUTO_1203 ?AUTO_1202 ) ) ( ON ?AUTO_1203 ?AUTO_1200 ) ( CLEAR ?AUTO_1203 ) ( HOLDING ?AUTO_1201 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1201 )
      ( MAKE-ON ?AUTO_1200 ?AUTO_1201 )
      ( MAKE-ON-VERIFY ?AUTO_1200 ?AUTO_1201 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1204 - BLOCK
      ?AUTO_1205 - BLOCK
    )
    :vars
    (
      ?AUTO_1207 - BLOCK
      ?AUTO_1206 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1204 ?AUTO_1205 ) ) ( ON-TABLE ?AUTO_1204 ) ( CLEAR ?AUTO_1207 ) ( not ( = ?AUTO_1204 ?AUTO_1206 ) ) ( not ( = ?AUTO_1204 ?AUTO_1207 ) ) ( not ( = ?AUTO_1205 ?AUTO_1206 ) ) ( not ( = ?AUTO_1205 ?AUTO_1207 ) ) ( not ( = ?AUTO_1206 ?AUTO_1207 ) ) ( ON ?AUTO_1206 ?AUTO_1204 ) ( ON ?AUTO_1205 ?AUTO_1206 ) ( CLEAR ?AUTO_1205 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1205 ?AUTO_1206 )
      ( MAKE-ON ?AUTO_1204 ?AUTO_1205 )
      ( MAKE-ON-VERIFY ?AUTO_1204 ?AUTO_1205 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1209 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1209 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1209 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1209 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1210 - BLOCK
    )
    :vars
    (
      ?AUTO_1211 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1210 ?AUTO_1211 ) ( CLEAR ?AUTO_1210 ) ( HAND-EMPTY ) ( not ( = ?AUTO_1210 ?AUTO_1211 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1210 ?AUTO_1211 )
      ( MAKE-ON-TABLE ?AUTO_1210 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1210 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1212 - BLOCK
    )
    :vars
    (
      ?AUTO_1213 - BLOCK
      ?AUTO_1214 - BLOCK
      ?AUTO_1215 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1212 ?AUTO_1213 ) ( CLEAR ?AUTO_1212 ) ( not ( = ?AUTO_1212 ?AUTO_1213 ) ) ( HOLDING ?AUTO_1214 ) ( CLEAR ?AUTO_1215 ) ( not ( = ?AUTO_1212 ?AUTO_1214 ) ) ( not ( = ?AUTO_1212 ?AUTO_1215 ) ) ( not ( = ?AUTO_1213 ?AUTO_1214 ) ) ( not ( = ?AUTO_1213 ?AUTO_1215 ) ) ( not ( = ?AUTO_1214 ?AUTO_1215 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1214 ?AUTO_1215 )
      ( MAKE-ON-TABLE ?AUTO_1212 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1212 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1220 - BLOCK
    )
    :vars
    (
      ?AUTO_1221 - BLOCK
      ?AUTO_1223 - BLOCK
      ?AUTO_1222 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1220 ?AUTO_1221 ) ( not ( = ?AUTO_1220 ?AUTO_1221 ) ) ( CLEAR ?AUTO_1223 ) ( not ( = ?AUTO_1220 ?AUTO_1222 ) ) ( not ( = ?AUTO_1220 ?AUTO_1223 ) ) ( not ( = ?AUTO_1221 ?AUTO_1222 ) ) ( not ( = ?AUTO_1221 ?AUTO_1223 ) ) ( not ( = ?AUTO_1222 ?AUTO_1223 ) ) ( ON ?AUTO_1222 ?AUTO_1220 ) ( CLEAR ?AUTO_1222 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1222 ?AUTO_1220 )
      ( MAKE-ON-TABLE ?AUTO_1220 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1220 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1224 - BLOCK
    )
    :vars
    (
      ?AUTO_1226 - BLOCK
      ?AUTO_1227 - BLOCK
      ?AUTO_1225 - BLOCK
      ?AUTO_1228 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1224 ?AUTO_1226 ) ( not ( = ?AUTO_1224 ?AUTO_1226 ) ) ( CLEAR ?AUTO_1227 ) ( not ( = ?AUTO_1224 ?AUTO_1225 ) ) ( not ( = ?AUTO_1224 ?AUTO_1227 ) ) ( not ( = ?AUTO_1226 ?AUTO_1225 ) ) ( not ( = ?AUTO_1226 ?AUTO_1227 ) ) ( not ( = ?AUTO_1225 ?AUTO_1227 ) ) ( ON ?AUTO_1225 ?AUTO_1224 ) ( CLEAR ?AUTO_1225 ) ( HOLDING ?AUTO_1228 ) ( not ( = ?AUTO_1224 ?AUTO_1228 ) ) ( not ( = ?AUTO_1226 ?AUTO_1228 ) ) ( not ( = ?AUTO_1227 ?AUTO_1228 ) ) ( not ( = ?AUTO_1225 ?AUTO_1228 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1228 )
      ( MAKE-ON-TABLE ?AUTO_1224 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1224 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1229 - BLOCK
    )
    :vars
    (
      ?AUTO_1230 - BLOCK
      ?AUTO_1233 - BLOCK
      ?AUTO_1232 - BLOCK
      ?AUTO_1231 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1229 ?AUTO_1230 ) ( not ( = ?AUTO_1229 ?AUTO_1230 ) ) ( CLEAR ?AUTO_1233 ) ( not ( = ?AUTO_1229 ?AUTO_1232 ) ) ( not ( = ?AUTO_1229 ?AUTO_1233 ) ) ( not ( = ?AUTO_1230 ?AUTO_1232 ) ) ( not ( = ?AUTO_1230 ?AUTO_1233 ) ) ( not ( = ?AUTO_1232 ?AUTO_1233 ) ) ( ON ?AUTO_1232 ?AUTO_1229 ) ( not ( = ?AUTO_1229 ?AUTO_1231 ) ) ( not ( = ?AUTO_1230 ?AUTO_1231 ) ) ( not ( = ?AUTO_1233 ?AUTO_1231 ) ) ( not ( = ?AUTO_1232 ?AUTO_1231 ) ) ( ON ?AUTO_1231 ?AUTO_1232 ) ( CLEAR ?AUTO_1231 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1231 ?AUTO_1232 )
      ( MAKE-ON-TABLE ?AUTO_1229 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1229 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1234 - BLOCK
    )
    :vars
    (
      ?AUTO_1238 - BLOCK
      ?AUTO_1237 - BLOCK
      ?AUTO_1235 - BLOCK
      ?AUTO_1236 - BLOCK
      ?AUTO_1239 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1234 ?AUTO_1238 ) ( not ( = ?AUTO_1234 ?AUTO_1238 ) ) ( CLEAR ?AUTO_1237 ) ( not ( = ?AUTO_1234 ?AUTO_1235 ) ) ( not ( = ?AUTO_1234 ?AUTO_1237 ) ) ( not ( = ?AUTO_1238 ?AUTO_1235 ) ) ( not ( = ?AUTO_1238 ?AUTO_1237 ) ) ( not ( = ?AUTO_1235 ?AUTO_1237 ) ) ( ON ?AUTO_1235 ?AUTO_1234 ) ( not ( = ?AUTO_1234 ?AUTO_1236 ) ) ( not ( = ?AUTO_1238 ?AUTO_1236 ) ) ( not ( = ?AUTO_1237 ?AUTO_1236 ) ) ( not ( = ?AUTO_1235 ?AUTO_1236 ) ) ( ON ?AUTO_1236 ?AUTO_1235 ) ( CLEAR ?AUTO_1236 ) ( HOLDING ?AUTO_1239 ) ( not ( = ?AUTO_1234 ?AUTO_1239 ) ) ( not ( = ?AUTO_1238 ?AUTO_1239 ) ) ( not ( = ?AUTO_1237 ?AUTO_1239 ) ) ( not ( = ?AUTO_1235 ?AUTO_1239 ) ) ( not ( = ?AUTO_1236 ?AUTO_1239 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1239 )
      ( MAKE-ON-TABLE ?AUTO_1234 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1234 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1242 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1242 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1242 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1242 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1243 - BLOCK
    )
    :vars
    (
      ?AUTO_1244 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1243 ?AUTO_1244 ) ( CLEAR ?AUTO_1243 ) ( HAND-EMPTY ) ( not ( = ?AUTO_1243 ?AUTO_1244 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1243 ?AUTO_1244 )
      ( MAKE-ON-TABLE ?AUTO_1243 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1243 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1245 - BLOCK
    )
    :vars
    (
      ?AUTO_1246 - BLOCK
      ?AUTO_1247 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1245 ?AUTO_1246 ) ( CLEAR ?AUTO_1245 ) ( not ( = ?AUTO_1245 ?AUTO_1246 ) ) ( HOLDING ?AUTO_1247 ) ( not ( = ?AUTO_1245 ?AUTO_1247 ) ) ( not ( = ?AUTO_1246 ?AUTO_1247 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1247 )
      ( MAKE-ON-TABLE ?AUTO_1245 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1245 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1248 - BLOCK
    )
    :vars
    (
      ?AUTO_1249 - BLOCK
      ?AUTO_1250 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1248 ?AUTO_1249 ) ( not ( = ?AUTO_1248 ?AUTO_1249 ) ) ( not ( = ?AUTO_1248 ?AUTO_1250 ) ) ( not ( = ?AUTO_1249 ?AUTO_1250 ) ) ( ON ?AUTO_1250 ?AUTO_1248 ) ( CLEAR ?AUTO_1250 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1250 ?AUTO_1248 )
      ( MAKE-ON-TABLE ?AUTO_1248 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1248 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1251 - BLOCK
    )
    :vars
    (
      ?AUTO_1252 - BLOCK
      ?AUTO_1253 - BLOCK
      ?AUTO_1254 - BLOCK
      ?AUTO_1255 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1251 ?AUTO_1252 ) ( not ( = ?AUTO_1251 ?AUTO_1252 ) ) ( not ( = ?AUTO_1251 ?AUTO_1253 ) ) ( not ( = ?AUTO_1252 ?AUTO_1253 ) ) ( ON ?AUTO_1253 ?AUTO_1251 ) ( CLEAR ?AUTO_1253 ) ( HOLDING ?AUTO_1254 ) ( CLEAR ?AUTO_1255 ) ( not ( = ?AUTO_1251 ?AUTO_1254 ) ) ( not ( = ?AUTO_1251 ?AUTO_1255 ) ) ( not ( = ?AUTO_1252 ?AUTO_1254 ) ) ( not ( = ?AUTO_1252 ?AUTO_1255 ) ) ( not ( = ?AUTO_1253 ?AUTO_1254 ) ) ( not ( = ?AUTO_1253 ?AUTO_1255 ) ) ( not ( = ?AUTO_1254 ?AUTO_1255 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1254 ?AUTO_1255 )
      ( MAKE-ON-TABLE ?AUTO_1251 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1251 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1260 - BLOCK
    )
    :vars
    (
      ?AUTO_1261 - BLOCK
      ?AUTO_1262 - BLOCK
      ?AUTO_1263 - BLOCK
      ?AUTO_1264 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1260 ?AUTO_1261 ) ( not ( = ?AUTO_1260 ?AUTO_1261 ) ) ( not ( = ?AUTO_1260 ?AUTO_1262 ) ) ( not ( = ?AUTO_1261 ?AUTO_1262 ) ) ( ON ?AUTO_1262 ?AUTO_1260 ) ( CLEAR ?AUTO_1263 ) ( not ( = ?AUTO_1260 ?AUTO_1264 ) ) ( not ( = ?AUTO_1260 ?AUTO_1263 ) ) ( not ( = ?AUTO_1261 ?AUTO_1264 ) ) ( not ( = ?AUTO_1261 ?AUTO_1263 ) ) ( not ( = ?AUTO_1262 ?AUTO_1264 ) ) ( not ( = ?AUTO_1262 ?AUTO_1263 ) ) ( not ( = ?AUTO_1264 ?AUTO_1263 ) ) ( ON ?AUTO_1264 ?AUTO_1262 ) ( CLEAR ?AUTO_1264 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1264 ?AUTO_1262 )
      ( MAKE-ON-TABLE ?AUTO_1260 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1260 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1265 - BLOCK
    )
    :vars
    (
      ?AUTO_1267 - BLOCK
      ?AUTO_1266 - BLOCK
      ?AUTO_1268 - BLOCK
      ?AUTO_1269 - BLOCK
      ?AUTO_1270 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1265 ?AUTO_1267 ) ( not ( = ?AUTO_1265 ?AUTO_1267 ) ) ( not ( = ?AUTO_1265 ?AUTO_1266 ) ) ( not ( = ?AUTO_1267 ?AUTO_1266 ) ) ( ON ?AUTO_1266 ?AUTO_1265 ) ( CLEAR ?AUTO_1268 ) ( not ( = ?AUTO_1265 ?AUTO_1269 ) ) ( not ( = ?AUTO_1265 ?AUTO_1268 ) ) ( not ( = ?AUTO_1267 ?AUTO_1269 ) ) ( not ( = ?AUTO_1267 ?AUTO_1268 ) ) ( not ( = ?AUTO_1266 ?AUTO_1269 ) ) ( not ( = ?AUTO_1266 ?AUTO_1268 ) ) ( not ( = ?AUTO_1269 ?AUTO_1268 ) ) ( ON ?AUTO_1269 ?AUTO_1266 ) ( CLEAR ?AUTO_1269 ) ( HOLDING ?AUTO_1270 ) ( not ( = ?AUTO_1265 ?AUTO_1270 ) ) ( not ( = ?AUTO_1267 ?AUTO_1270 ) ) ( not ( = ?AUTO_1266 ?AUTO_1270 ) ) ( not ( = ?AUTO_1268 ?AUTO_1270 ) ) ( not ( = ?AUTO_1269 ?AUTO_1270 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1270 )
      ( MAKE-ON-TABLE ?AUTO_1265 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1265 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1271 - BLOCK
    )
    :vars
    (
      ?AUTO_1275 - BLOCK
      ?AUTO_1273 - BLOCK
      ?AUTO_1272 - BLOCK
      ?AUTO_1274 - BLOCK
      ?AUTO_1276 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1271 ?AUTO_1275 ) ( not ( = ?AUTO_1271 ?AUTO_1275 ) ) ( not ( = ?AUTO_1271 ?AUTO_1273 ) ) ( not ( = ?AUTO_1275 ?AUTO_1273 ) ) ( ON ?AUTO_1273 ?AUTO_1271 ) ( CLEAR ?AUTO_1272 ) ( not ( = ?AUTO_1271 ?AUTO_1274 ) ) ( not ( = ?AUTO_1271 ?AUTO_1272 ) ) ( not ( = ?AUTO_1275 ?AUTO_1274 ) ) ( not ( = ?AUTO_1275 ?AUTO_1272 ) ) ( not ( = ?AUTO_1273 ?AUTO_1274 ) ) ( not ( = ?AUTO_1273 ?AUTO_1272 ) ) ( not ( = ?AUTO_1274 ?AUTO_1272 ) ) ( ON ?AUTO_1274 ?AUTO_1273 ) ( not ( = ?AUTO_1271 ?AUTO_1276 ) ) ( not ( = ?AUTO_1275 ?AUTO_1276 ) ) ( not ( = ?AUTO_1273 ?AUTO_1276 ) ) ( not ( = ?AUTO_1272 ?AUTO_1276 ) ) ( not ( = ?AUTO_1274 ?AUTO_1276 ) ) ( ON ?AUTO_1276 ?AUTO_1274 ) ( CLEAR ?AUTO_1276 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1276 ?AUTO_1274 )
      ( MAKE-ON-TABLE ?AUTO_1271 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1271 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1277 - BLOCK
    )
    :vars
    (
      ?AUTO_1281 - BLOCK
      ?AUTO_1278 - BLOCK
      ?AUTO_1279 - BLOCK
      ?AUTO_1280 - BLOCK
      ?AUTO_1282 - BLOCK
      ?AUTO_1283 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1277 ?AUTO_1281 ) ( not ( = ?AUTO_1277 ?AUTO_1281 ) ) ( not ( = ?AUTO_1277 ?AUTO_1278 ) ) ( not ( = ?AUTO_1281 ?AUTO_1278 ) ) ( ON ?AUTO_1278 ?AUTO_1277 ) ( CLEAR ?AUTO_1279 ) ( not ( = ?AUTO_1277 ?AUTO_1280 ) ) ( not ( = ?AUTO_1277 ?AUTO_1279 ) ) ( not ( = ?AUTO_1281 ?AUTO_1280 ) ) ( not ( = ?AUTO_1281 ?AUTO_1279 ) ) ( not ( = ?AUTO_1278 ?AUTO_1280 ) ) ( not ( = ?AUTO_1278 ?AUTO_1279 ) ) ( not ( = ?AUTO_1280 ?AUTO_1279 ) ) ( ON ?AUTO_1280 ?AUTO_1278 ) ( not ( = ?AUTO_1277 ?AUTO_1282 ) ) ( not ( = ?AUTO_1281 ?AUTO_1282 ) ) ( not ( = ?AUTO_1278 ?AUTO_1282 ) ) ( not ( = ?AUTO_1279 ?AUTO_1282 ) ) ( not ( = ?AUTO_1280 ?AUTO_1282 ) ) ( ON ?AUTO_1282 ?AUTO_1280 ) ( CLEAR ?AUTO_1282 ) ( HOLDING ?AUTO_1283 ) ( not ( = ?AUTO_1277 ?AUTO_1283 ) ) ( not ( = ?AUTO_1281 ?AUTO_1283 ) ) ( not ( = ?AUTO_1278 ?AUTO_1283 ) ) ( not ( = ?AUTO_1279 ?AUTO_1283 ) ) ( not ( = ?AUTO_1280 ?AUTO_1283 ) ) ( not ( = ?AUTO_1282 ?AUTO_1283 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1283 )
      ( MAKE-ON-TABLE ?AUTO_1277 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1277 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1287 - BLOCK
      ?AUTO_1288 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1287 ) ( CLEAR ?AUTO_1288 ) ( not ( = ?AUTO_1287 ?AUTO_1288 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1287 ?AUTO_1288 )
      ( MAKE-ON-VERIFY ?AUTO_1287 ?AUTO_1288 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1289 - BLOCK
      ?AUTO_1290 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1290 ) ( not ( = ?AUTO_1289 ?AUTO_1290 ) ) ( ON-TABLE ?AUTO_1289 ) ( CLEAR ?AUTO_1289 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_1289 )
      ( MAKE-ON ?AUTO_1289 ?AUTO_1290 )
      ( MAKE-ON-VERIFY ?AUTO_1289 ?AUTO_1290 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1291 - BLOCK
      ?AUTO_1292 - BLOCK
    )
    :vars
    (
      ?AUTO_1293 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1292 ) ( not ( = ?AUTO_1291 ?AUTO_1292 ) ) ( ON-TABLE ?AUTO_1291 ) ( CLEAR ?AUTO_1291 ) ( HOLDING ?AUTO_1293 ) ( not ( = ?AUTO_1291 ?AUTO_1293 ) ) ( not ( = ?AUTO_1292 ?AUTO_1293 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1293 )
      ( MAKE-ON ?AUTO_1291 ?AUTO_1292 )
      ( MAKE-ON-VERIFY ?AUTO_1291 ?AUTO_1292 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1294 - BLOCK
      ?AUTO_1295 - BLOCK
    )
    :vars
    (
      ?AUTO_1296 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1295 ) ( not ( = ?AUTO_1294 ?AUTO_1295 ) ) ( ON-TABLE ?AUTO_1294 ) ( not ( = ?AUTO_1294 ?AUTO_1296 ) ) ( not ( = ?AUTO_1295 ?AUTO_1296 ) ) ( ON ?AUTO_1296 ?AUTO_1294 ) ( CLEAR ?AUTO_1296 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1296 ?AUTO_1294 )
      ( MAKE-ON ?AUTO_1294 ?AUTO_1295 )
      ( MAKE-ON-VERIFY ?AUTO_1294 ?AUTO_1295 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1297 - BLOCK
      ?AUTO_1298 - BLOCK
    )
    :vars
    (
      ?AUTO_1299 - BLOCK
      ?AUTO_1300 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1298 ) ( not ( = ?AUTO_1297 ?AUTO_1298 ) ) ( ON-TABLE ?AUTO_1297 ) ( not ( = ?AUTO_1297 ?AUTO_1299 ) ) ( not ( = ?AUTO_1298 ?AUTO_1299 ) ) ( ON ?AUTO_1299 ?AUTO_1297 ) ( CLEAR ?AUTO_1299 ) ( HOLDING ?AUTO_1300 ) ( not ( = ?AUTO_1297 ?AUTO_1300 ) ) ( not ( = ?AUTO_1298 ?AUTO_1300 ) ) ( not ( = ?AUTO_1299 ?AUTO_1300 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1300 )
      ( MAKE-ON ?AUTO_1297 ?AUTO_1298 )
      ( MAKE-ON-VERIFY ?AUTO_1297 ?AUTO_1298 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1301 - BLOCK
      ?AUTO_1302 - BLOCK
    )
    :vars
    (
      ?AUTO_1303 - BLOCK
      ?AUTO_1304 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1302 ) ( not ( = ?AUTO_1301 ?AUTO_1302 ) ) ( ON-TABLE ?AUTO_1301 ) ( not ( = ?AUTO_1301 ?AUTO_1303 ) ) ( not ( = ?AUTO_1302 ?AUTO_1303 ) ) ( ON ?AUTO_1303 ?AUTO_1301 ) ( not ( = ?AUTO_1301 ?AUTO_1304 ) ) ( not ( = ?AUTO_1302 ?AUTO_1304 ) ) ( not ( = ?AUTO_1303 ?AUTO_1304 ) ) ( ON ?AUTO_1304 ?AUTO_1303 ) ( CLEAR ?AUTO_1304 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1304 ?AUTO_1303 )
      ( MAKE-ON ?AUTO_1301 ?AUTO_1302 )
      ( MAKE-ON-VERIFY ?AUTO_1301 ?AUTO_1302 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1305 - BLOCK
      ?AUTO_1306 - BLOCK
    )
    :vars
    (
      ?AUTO_1308 - BLOCK
      ?AUTO_1307 - BLOCK
      ?AUTO_1309 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1305 ?AUTO_1306 ) ) ( ON-TABLE ?AUTO_1305 ) ( not ( = ?AUTO_1305 ?AUTO_1308 ) ) ( not ( = ?AUTO_1306 ?AUTO_1308 ) ) ( ON ?AUTO_1308 ?AUTO_1305 ) ( not ( = ?AUTO_1305 ?AUTO_1307 ) ) ( not ( = ?AUTO_1306 ?AUTO_1307 ) ) ( not ( = ?AUTO_1308 ?AUTO_1307 ) ) ( ON ?AUTO_1307 ?AUTO_1308 ) ( CLEAR ?AUTO_1307 ) ( HOLDING ?AUTO_1306 ) ( CLEAR ?AUTO_1309 ) ( not ( = ?AUTO_1305 ?AUTO_1309 ) ) ( not ( = ?AUTO_1306 ?AUTO_1309 ) ) ( not ( = ?AUTO_1308 ?AUTO_1309 ) ) ( not ( = ?AUTO_1307 ?AUTO_1309 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1306 ?AUTO_1309 )
      ( MAKE-ON ?AUTO_1305 ?AUTO_1306 )
      ( MAKE-ON-VERIFY ?AUTO_1305 ?AUTO_1306 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1312 - BLOCK
      ?AUTO_1313 - BLOCK
    )
    :vars
    (
      ?AUTO_1314 - BLOCK
      ?AUTO_1315 - BLOCK
      ?AUTO_1316 - BLOCK
      ?AUTO_1317 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1313 ) ( not ( = ?AUTO_1312 ?AUTO_1313 ) ) ( ON-TABLE ?AUTO_1312 ) ( not ( = ?AUTO_1312 ?AUTO_1314 ) ) ( not ( = ?AUTO_1313 ?AUTO_1314 ) ) ( ON ?AUTO_1314 ?AUTO_1312 ) ( not ( = ?AUTO_1312 ?AUTO_1315 ) ) ( not ( = ?AUTO_1313 ?AUTO_1315 ) ) ( not ( = ?AUTO_1314 ?AUTO_1315 ) ) ( ON ?AUTO_1315 ?AUTO_1314 ) ( CLEAR ?AUTO_1315 ) ( HOLDING ?AUTO_1316 ) ( CLEAR ?AUTO_1317 ) ( not ( = ?AUTO_1312 ?AUTO_1316 ) ) ( not ( = ?AUTO_1312 ?AUTO_1317 ) ) ( not ( = ?AUTO_1313 ?AUTO_1316 ) ) ( not ( = ?AUTO_1313 ?AUTO_1317 ) ) ( not ( = ?AUTO_1314 ?AUTO_1316 ) ) ( not ( = ?AUTO_1314 ?AUTO_1317 ) ) ( not ( = ?AUTO_1315 ?AUTO_1316 ) ) ( not ( = ?AUTO_1315 ?AUTO_1317 ) ) ( not ( = ?AUTO_1316 ?AUTO_1317 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1316 ?AUTO_1317 )
      ( MAKE-ON ?AUTO_1312 ?AUTO_1313 )
      ( MAKE-ON-VERIFY ?AUTO_1312 ?AUTO_1313 ) )
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
      ?AUTO_1323 - BLOCK
      ?AUTO_1322 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1318 ?AUTO_1319 ) ) ( ON-TABLE ?AUTO_1318 ) ( not ( = ?AUTO_1318 ?AUTO_1321 ) ) ( not ( = ?AUTO_1319 ?AUTO_1321 ) ) ( ON ?AUTO_1321 ?AUTO_1318 ) ( not ( = ?AUTO_1318 ?AUTO_1320 ) ) ( not ( = ?AUTO_1319 ?AUTO_1320 ) ) ( not ( = ?AUTO_1321 ?AUTO_1320 ) ) ( ON ?AUTO_1320 ?AUTO_1321 ) ( CLEAR ?AUTO_1320 ) ( CLEAR ?AUTO_1323 ) ( not ( = ?AUTO_1318 ?AUTO_1322 ) ) ( not ( = ?AUTO_1318 ?AUTO_1323 ) ) ( not ( = ?AUTO_1319 ?AUTO_1322 ) ) ( not ( = ?AUTO_1319 ?AUTO_1323 ) ) ( not ( = ?AUTO_1321 ?AUTO_1322 ) ) ( not ( = ?AUTO_1321 ?AUTO_1323 ) ) ( not ( = ?AUTO_1320 ?AUTO_1322 ) ) ( not ( = ?AUTO_1320 ?AUTO_1323 ) ) ( not ( = ?AUTO_1322 ?AUTO_1323 ) ) ( ON ?AUTO_1322 ?AUTO_1319 ) ( CLEAR ?AUTO_1322 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1322 ?AUTO_1319 )
      ( MAKE-ON ?AUTO_1318 ?AUTO_1319 )
      ( MAKE-ON-VERIFY ?AUTO_1318 ?AUTO_1319 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1324 - BLOCK
      ?AUTO_1325 - BLOCK
    )
    :vars
    (
      ?AUTO_1326 - BLOCK
      ?AUTO_1327 - BLOCK
      ?AUTO_1328 - BLOCK
      ?AUTO_1329 - BLOCK
      ?AUTO_1330 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1324 ?AUTO_1325 ) ) ( ON-TABLE ?AUTO_1324 ) ( not ( = ?AUTO_1324 ?AUTO_1326 ) ) ( not ( = ?AUTO_1325 ?AUTO_1326 ) ) ( ON ?AUTO_1326 ?AUTO_1324 ) ( not ( = ?AUTO_1324 ?AUTO_1327 ) ) ( not ( = ?AUTO_1325 ?AUTO_1327 ) ) ( not ( = ?AUTO_1326 ?AUTO_1327 ) ) ( ON ?AUTO_1327 ?AUTO_1326 ) ( CLEAR ?AUTO_1327 ) ( not ( = ?AUTO_1324 ?AUTO_1328 ) ) ( not ( = ?AUTO_1324 ?AUTO_1329 ) ) ( not ( = ?AUTO_1325 ?AUTO_1328 ) ) ( not ( = ?AUTO_1325 ?AUTO_1329 ) ) ( not ( = ?AUTO_1326 ?AUTO_1328 ) ) ( not ( = ?AUTO_1326 ?AUTO_1329 ) ) ( not ( = ?AUTO_1327 ?AUTO_1328 ) ) ( not ( = ?AUTO_1327 ?AUTO_1329 ) ) ( not ( = ?AUTO_1328 ?AUTO_1329 ) ) ( ON ?AUTO_1328 ?AUTO_1325 ) ( CLEAR ?AUTO_1328 ) ( HOLDING ?AUTO_1329 ) ( CLEAR ?AUTO_1330 ) ( not ( = ?AUTO_1324 ?AUTO_1330 ) ) ( not ( = ?AUTO_1325 ?AUTO_1330 ) ) ( not ( = ?AUTO_1326 ?AUTO_1330 ) ) ( not ( = ?AUTO_1327 ?AUTO_1330 ) ) ( not ( = ?AUTO_1328 ?AUTO_1330 ) ) ( not ( = ?AUTO_1329 ?AUTO_1330 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1329 ?AUTO_1330 )
      ( MAKE-ON ?AUTO_1324 ?AUTO_1325 )
      ( MAKE-ON-VERIFY ?AUTO_1324 ?AUTO_1325 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1331 - BLOCK
      ?AUTO_1332 - BLOCK
    )
    :vars
    (
      ?AUTO_1334 - BLOCK
      ?AUTO_1333 - BLOCK
      ?AUTO_1336 - BLOCK
      ?AUTO_1335 - BLOCK
      ?AUTO_1337 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1331 ?AUTO_1332 ) ) ( ON-TABLE ?AUTO_1331 ) ( not ( = ?AUTO_1331 ?AUTO_1334 ) ) ( not ( = ?AUTO_1332 ?AUTO_1334 ) ) ( ON ?AUTO_1334 ?AUTO_1331 ) ( not ( = ?AUTO_1331 ?AUTO_1333 ) ) ( not ( = ?AUTO_1332 ?AUTO_1333 ) ) ( not ( = ?AUTO_1334 ?AUTO_1333 ) ) ( ON ?AUTO_1333 ?AUTO_1334 ) ( not ( = ?AUTO_1331 ?AUTO_1336 ) ) ( not ( = ?AUTO_1331 ?AUTO_1335 ) ) ( not ( = ?AUTO_1332 ?AUTO_1336 ) ) ( not ( = ?AUTO_1332 ?AUTO_1335 ) ) ( not ( = ?AUTO_1334 ?AUTO_1336 ) ) ( not ( = ?AUTO_1334 ?AUTO_1335 ) ) ( not ( = ?AUTO_1333 ?AUTO_1336 ) ) ( not ( = ?AUTO_1333 ?AUTO_1335 ) ) ( not ( = ?AUTO_1336 ?AUTO_1335 ) ) ( ON ?AUTO_1336 ?AUTO_1332 ) ( CLEAR ?AUTO_1336 ) ( CLEAR ?AUTO_1337 ) ( not ( = ?AUTO_1331 ?AUTO_1337 ) ) ( not ( = ?AUTO_1332 ?AUTO_1337 ) ) ( not ( = ?AUTO_1334 ?AUTO_1337 ) ) ( not ( = ?AUTO_1333 ?AUTO_1337 ) ) ( not ( = ?AUTO_1336 ?AUTO_1337 ) ) ( not ( = ?AUTO_1335 ?AUTO_1337 ) ) ( ON ?AUTO_1335 ?AUTO_1333 ) ( CLEAR ?AUTO_1335 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1335 ?AUTO_1333 )
      ( MAKE-ON ?AUTO_1331 ?AUTO_1332 )
      ( MAKE-ON-VERIFY ?AUTO_1331 ?AUTO_1332 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1338 - BLOCK
      ?AUTO_1339 - BLOCK
    )
    :vars
    (
      ?AUTO_1343 - BLOCK
      ?AUTO_1341 - BLOCK
      ?AUTO_1344 - BLOCK
      ?AUTO_1342 - BLOCK
      ?AUTO_1340 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1338 ?AUTO_1339 ) ) ( ON-TABLE ?AUTO_1338 ) ( not ( = ?AUTO_1338 ?AUTO_1343 ) ) ( not ( = ?AUTO_1339 ?AUTO_1343 ) ) ( ON ?AUTO_1343 ?AUTO_1338 ) ( not ( = ?AUTO_1338 ?AUTO_1341 ) ) ( not ( = ?AUTO_1339 ?AUTO_1341 ) ) ( not ( = ?AUTO_1343 ?AUTO_1341 ) ) ( ON ?AUTO_1341 ?AUTO_1343 ) ( not ( = ?AUTO_1338 ?AUTO_1344 ) ) ( not ( = ?AUTO_1338 ?AUTO_1342 ) ) ( not ( = ?AUTO_1339 ?AUTO_1344 ) ) ( not ( = ?AUTO_1339 ?AUTO_1342 ) ) ( not ( = ?AUTO_1343 ?AUTO_1344 ) ) ( not ( = ?AUTO_1343 ?AUTO_1342 ) ) ( not ( = ?AUTO_1341 ?AUTO_1344 ) ) ( not ( = ?AUTO_1341 ?AUTO_1342 ) ) ( not ( = ?AUTO_1344 ?AUTO_1342 ) ) ( ON ?AUTO_1344 ?AUTO_1339 ) ( CLEAR ?AUTO_1344 ) ( not ( = ?AUTO_1338 ?AUTO_1340 ) ) ( not ( = ?AUTO_1339 ?AUTO_1340 ) ) ( not ( = ?AUTO_1343 ?AUTO_1340 ) ) ( not ( = ?AUTO_1341 ?AUTO_1340 ) ) ( not ( = ?AUTO_1344 ?AUTO_1340 ) ) ( not ( = ?AUTO_1342 ?AUTO_1340 ) ) ( ON ?AUTO_1342 ?AUTO_1341 ) ( CLEAR ?AUTO_1342 ) ( HOLDING ?AUTO_1340 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1340 )
      ( MAKE-ON ?AUTO_1338 ?AUTO_1339 )
      ( MAKE-ON-VERIFY ?AUTO_1338 ?AUTO_1339 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1345 - BLOCK
      ?AUTO_1346 - BLOCK
    )
    :vars
    (
      ?AUTO_1347 - BLOCK
      ?AUTO_1349 - BLOCK
      ?AUTO_1348 - BLOCK
      ?AUTO_1351 - BLOCK
      ?AUTO_1350 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1345 ?AUTO_1346 ) ) ( ON-TABLE ?AUTO_1345 ) ( not ( = ?AUTO_1345 ?AUTO_1347 ) ) ( not ( = ?AUTO_1346 ?AUTO_1347 ) ) ( ON ?AUTO_1347 ?AUTO_1345 ) ( not ( = ?AUTO_1345 ?AUTO_1349 ) ) ( not ( = ?AUTO_1346 ?AUTO_1349 ) ) ( not ( = ?AUTO_1347 ?AUTO_1349 ) ) ( ON ?AUTO_1349 ?AUTO_1347 ) ( not ( = ?AUTO_1345 ?AUTO_1348 ) ) ( not ( = ?AUTO_1345 ?AUTO_1351 ) ) ( not ( = ?AUTO_1346 ?AUTO_1348 ) ) ( not ( = ?AUTO_1346 ?AUTO_1351 ) ) ( not ( = ?AUTO_1347 ?AUTO_1348 ) ) ( not ( = ?AUTO_1347 ?AUTO_1351 ) ) ( not ( = ?AUTO_1349 ?AUTO_1348 ) ) ( not ( = ?AUTO_1349 ?AUTO_1351 ) ) ( not ( = ?AUTO_1348 ?AUTO_1351 ) ) ( ON ?AUTO_1348 ?AUTO_1346 ) ( CLEAR ?AUTO_1348 ) ( not ( = ?AUTO_1345 ?AUTO_1350 ) ) ( not ( = ?AUTO_1346 ?AUTO_1350 ) ) ( not ( = ?AUTO_1347 ?AUTO_1350 ) ) ( not ( = ?AUTO_1349 ?AUTO_1350 ) ) ( not ( = ?AUTO_1348 ?AUTO_1350 ) ) ( not ( = ?AUTO_1351 ?AUTO_1350 ) ) ( ON ?AUTO_1351 ?AUTO_1349 ) ( ON ?AUTO_1350 ?AUTO_1351 ) ( CLEAR ?AUTO_1350 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1350 ?AUTO_1351 )
      ( MAKE-ON ?AUTO_1345 ?AUTO_1346 )
      ( MAKE-ON-VERIFY ?AUTO_1345 ?AUTO_1346 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1352 - BLOCK
      ?AUTO_1353 - BLOCK
    )
    :vars
    (
      ?AUTO_1355 - BLOCK
      ?AUTO_1354 - BLOCK
      ?AUTO_1358 - BLOCK
      ?AUTO_1357 - BLOCK
      ?AUTO_1356 - BLOCK
      ?AUTO_1359 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1352 ?AUTO_1353 ) ) ( ON-TABLE ?AUTO_1352 ) ( not ( = ?AUTO_1352 ?AUTO_1355 ) ) ( not ( = ?AUTO_1353 ?AUTO_1355 ) ) ( ON ?AUTO_1355 ?AUTO_1352 ) ( not ( = ?AUTO_1352 ?AUTO_1354 ) ) ( not ( = ?AUTO_1353 ?AUTO_1354 ) ) ( not ( = ?AUTO_1355 ?AUTO_1354 ) ) ( ON ?AUTO_1354 ?AUTO_1355 ) ( not ( = ?AUTO_1352 ?AUTO_1358 ) ) ( not ( = ?AUTO_1352 ?AUTO_1357 ) ) ( not ( = ?AUTO_1353 ?AUTO_1358 ) ) ( not ( = ?AUTO_1353 ?AUTO_1357 ) ) ( not ( = ?AUTO_1355 ?AUTO_1358 ) ) ( not ( = ?AUTO_1355 ?AUTO_1357 ) ) ( not ( = ?AUTO_1354 ?AUTO_1358 ) ) ( not ( = ?AUTO_1354 ?AUTO_1357 ) ) ( not ( = ?AUTO_1358 ?AUTO_1357 ) ) ( ON ?AUTO_1358 ?AUTO_1353 ) ( CLEAR ?AUTO_1358 ) ( not ( = ?AUTO_1352 ?AUTO_1356 ) ) ( not ( = ?AUTO_1353 ?AUTO_1356 ) ) ( not ( = ?AUTO_1355 ?AUTO_1356 ) ) ( not ( = ?AUTO_1354 ?AUTO_1356 ) ) ( not ( = ?AUTO_1358 ?AUTO_1356 ) ) ( not ( = ?AUTO_1357 ?AUTO_1356 ) ) ( ON ?AUTO_1357 ?AUTO_1354 ) ( ON ?AUTO_1356 ?AUTO_1357 ) ( CLEAR ?AUTO_1356 ) ( HOLDING ?AUTO_1359 ) ( not ( = ?AUTO_1352 ?AUTO_1359 ) ) ( not ( = ?AUTO_1353 ?AUTO_1359 ) ) ( not ( = ?AUTO_1355 ?AUTO_1359 ) ) ( not ( = ?AUTO_1354 ?AUTO_1359 ) ) ( not ( = ?AUTO_1358 ?AUTO_1359 ) ) ( not ( = ?AUTO_1357 ?AUTO_1359 ) ) ( not ( = ?AUTO_1356 ?AUTO_1359 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1359 )
      ( MAKE-ON ?AUTO_1352 ?AUTO_1353 )
      ( MAKE-ON-VERIFY ?AUTO_1352 ?AUTO_1353 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1360 - BLOCK
      ?AUTO_1361 - BLOCK
    )
    :vars
    (
      ?AUTO_1364 - BLOCK
      ?AUTO_1363 - BLOCK
      ?AUTO_1362 - BLOCK
      ?AUTO_1367 - BLOCK
      ?AUTO_1366 - BLOCK
      ?AUTO_1365 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1360 ?AUTO_1361 ) ) ( ON-TABLE ?AUTO_1360 ) ( not ( = ?AUTO_1360 ?AUTO_1364 ) ) ( not ( = ?AUTO_1361 ?AUTO_1364 ) ) ( ON ?AUTO_1364 ?AUTO_1360 ) ( not ( = ?AUTO_1360 ?AUTO_1363 ) ) ( not ( = ?AUTO_1361 ?AUTO_1363 ) ) ( not ( = ?AUTO_1364 ?AUTO_1363 ) ) ( ON ?AUTO_1363 ?AUTO_1364 ) ( not ( = ?AUTO_1360 ?AUTO_1362 ) ) ( not ( = ?AUTO_1360 ?AUTO_1367 ) ) ( not ( = ?AUTO_1361 ?AUTO_1362 ) ) ( not ( = ?AUTO_1361 ?AUTO_1367 ) ) ( not ( = ?AUTO_1364 ?AUTO_1362 ) ) ( not ( = ?AUTO_1364 ?AUTO_1367 ) ) ( not ( = ?AUTO_1363 ?AUTO_1362 ) ) ( not ( = ?AUTO_1363 ?AUTO_1367 ) ) ( not ( = ?AUTO_1362 ?AUTO_1367 ) ) ( ON ?AUTO_1362 ?AUTO_1361 ) ( not ( = ?AUTO_1360 ?AUTO_1366 ) ) ( not ( = ?AUTO_1361 ?AUTO_1366 ) ) ( not ( = ?AUTO_1364 ?AUTO_1366 ) ) ( not ( = ?AUTO_1363 ?AUTO_1366 ) ) ( not ( = ?AUTO_1362 ?AUTO_1366 ) ) ( not ( = ?AUTO_1367 ?AUTO_1366 ) ) ( ON ?AUTO_1367 ?AUTO_1363 ) ( ON ?AUTO_1366 ?AUTO_1367 ) ( CLEAR ?AUTO_1366 ) ( not ( = ?AUTO_1360 ?AUTO_1365 ) ) ( not ( = ?AUTO_1361 ?AUTO_1365 ) ) ( not ( = ?AUTO_1364 ?AUTO_1365 ) ) ( not ( = ?AUTO_1363 ?AUTO_1365 ) ) ( not ( = ?AUTO_1362 ?AUTO_1365 ) ) ( not ( = ?AUTO_1367 ?AUTO_1365 ) ) ( not ( = ?AUTO_1366 ?AUTO_1365 ) ) ( ON ?AUTO_1365 ?AUTO_1362 ) ( CLEAR ?AUTO_1365 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1365 ?AUTO_1362 )
      ( MAKE-ON ?AUTO_1360 ?AUTO_1361 )
      ( MAKE-ON-VERIFY ?AUTO_1360 ?AUTO_1361 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1370 - BLOCK
      ?AUTO_1371 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1370 ) ( CLEAR ?AUTO_1371 ) ( not ( = ?AUTO_1370 ?AUTO_1371 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1370 ?AUTO_1371 )
      ( MAKE-ON-VERIFY ?AUTO_1370 ?AUTO_1371 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1372 - BLOCK
      ?AUTO_1373 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1373 ) ( not ( = ?AUTO_1372 ?AUTO_1373 ) ) ( ON-TABLE ?AUTO_1372 ) ( CLEAR ?AUTO_1372 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_1372 )
      ( MAKE-ON ?AUTO_1372 ?AUTO_1373 )
      ( MAKE-ON-VERIFY ?AUTO_1372 ?AUTO_1373 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1374 - BLOCK
      ?AUTO_1375 - BLOCK
    )
    :vars
    (
      ?AUTO_1376 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1374 ?AUTO_1375 ) ) ( ON-TABLE ?AUTO_1374 ) ( CLEAR ?AUTO_1374 ) ( HOLDING ?AUTO_1375 ) ( CLEAR ?AUTO_1376 ) ( not ( = ?AUTO_1374 ?AUTO_1376 ) ) ( not ( = ?AUTO_1375 ?AUTO_1376 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1375 ?AUTO_1376 )
      ( MAKE-ON ?AUTO_1374 ?AUTO_1375 )
      ( MAKE-ON-VERIFY ?AUTO_1374 ?AUTO_1375 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1381 - BLOCK
      ?AUTO_1382 - BLOCK
    )
    :vars
    (
      ?AUTO_1383 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1381 ?AUTO_1382 ) ) ( ON-TABLE ?AUTO_1381 ) ( CLEAR ?AUTO_1381 ) ( not ( = ?AUTO_1381 ?AUTO_1383 ) ) ( not ( = ?AUTO_1382 ?AUTO_1383 ) ) ( ON ?AUTO_1383 ?AUTO_1382 ) ( CLEAR ?AUTO_1383 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1383 ?AUTO_1382 )
      ( MAKE-ON ?AUTO_1381 ?AUTO_1382 )
      ( MAKE-ON-VERIFY ?AUTO_1381 ?AUTO_1382 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1384 - BLOCK
      ?AUTO_1385 - BLOCK
    )
    :vars
    (
      ?AUTO_1386 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1384 ?AUTO_1385 ) ) ( not ( = ?AUTO_1384 ?AUTO_1386 ) ) ( not ( = ?AUTO_1385 ?AUTO_1386 ) ) ( ON ?AUTO_1386 ?AUTO_1385 ) ( CLEAR ?AUTO_1386 ) ( HOLDING ?AUTO_1384 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1384 )
      ( MAKE-ON ?AUTO_1384 ?AUTO_1385 )
      ( MAKE-ON-VERIFY ?AUTO_1384 ?AUTO_1385 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1387 - BLOCK
      ?AUTO_1388 - BLOCK
    )
    :vars
    (
      ?AUTO_1389 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1387 ?AUTO_1388 ) ) ( not ( = ?AUTO_1387 ?AUTO_1389 ) ) ( not ( = ?AUTO_1388 ?AUTO_1389 ) ) ( ON ?AUTO_1389 ?AUTO_1388 ) ( ON ?AUTO_1387 ?AUTO_1389 ) ( CLEAR ?AUTO_1387 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1387 ?AUTO_1389 )
      ( MAKE-ON ?AUTO_1387 ?AUTO_1388 )
      ( MAKE-ON-VERIFY ?AUTO_1387 ?AUTO_1388 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1390 - BLOCK
      ?AUTO_1391 - BLOCK
    )
    :vars
    (
      ?AUTO_1392 - BLOCK
      ?AUTO_1393 - BLOCK
      ?AUTO_1394 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1390 ?AUTO_1391 ) ) ( not ( = ?AUTO_1390 ?AUTO_1392 ) ) ( not ( = ?AUTO_1391 ?AUTO_1392 ) ) ( ON ?AUTO_1392 ?AUTO_1391 ) ( ON ?AUTO_1390 ?AUTO_1392 ) ( CLEAR ?AUTO_1390 ) ( HOLDING ?AUTO_1393 ) ( CLEAR ?AUTO_1394 ) ( not ( = ?AUTO_1390 ?AUTO_1393 ) ) ( not ( = ?AUTO_1390 ?AUTO_1394 ) ) ( not ( = ?AUTO_1391 ?AUTO_1393 ) ) ( not ( = ?AUTO_1391 ?AUTO_1394 ) ) ( not ( = ?AUTO_1392 ?AUTO_1393 ) ) ( not ( = ?AUTO_1392 ?AUTO_1394 ) ) ( not ( = ?AUTO_1393 ?AUTO_1394 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1393 ?AUTO_1394 )
      ( MAKE-ON ?AUTO_1390 ?AUTO_1391 )
      ( MAKE-ON-VERIFY ?AUTO_1390 ?AUTO_1391 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1403 - BLOCK
      ?AUTO_1404 - BLOCK
    )
    :vars
    (
      ?AUTO_1405 - BLOCK
      ?AUTO_1407 - BLOCK
      ?AUTO_1406 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1403 ?AUTO_1404 ) ) ( not ( = ?AUTO_1403 ?AUTO_1405 ) ) ( not ( = ?AUTO_1404 ?AUTO_1405 ) ) ( ON ?AUTO_1405 ?AUTO_1404 ) ( ON ?AUTO_1403 ?AUTO_1405 ) ( CLEAR ?AUTO_1407 ) ( not ( = ?AUTO_1403 ?AUTO_1406 ) ) ( not ( = ?AUTO_1403 ?AUTO_1407 ) ) ( not ( = ?AUTO_1404 ?AUTO_1406 ) ) ( not ( = ?AUTO_1404 ?AUTO_1407 ) ) ( not ( = ?AUTO_1405 ?AUTO_1406 ) ) ( not ( = ?AUTO_1405 ?AUTO_1407 ) ) ( not ( = ?AUTO_1406 ?AUTO_1407 ) ) ( ON ?AUTO_1406 ?AUTO_1403 ) ( CLEAR ?AUTO_1406 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1406 ?AUTO_1403 )
      ( MAKE-ON ?AUTO_1403 ?AUTO_1404 )
      ( MAKE-ON-VERIFY ?AUTO_1403 ?AUTO_1404 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1408 - BLOCK
      ?AUTO_1409 - BLOCK
    )
    :vars
    (
      ?AUTO_1410 - BLOCK
      ?AUTO_1412 - BLOCK
      ?AUTO_1411 - BLOCK
      ?AUTO_1413 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1408 ?AUTO_1409 ) ) ( not ( = ?AUTO_1408 ?AUTO_1410 ) ) ( not ( = ?AUTO_1409 ?AUTO_1410 ) ) ( ON ?AUTO_1410 ?AUTO_1409 ) ( ON ?AUTO_1408 ?AUTO_1410 ) ( CLEAR ?AUTO_1412 ) ( not ( = ?AUTO_1408 ?AUTO_1411 ) ) ( not ( = ?AUTO_1408 ?AUTO_1412 ) ) ( not ( = ?AUTO_1409 ?AUTO_1411 ) ) ( not ( = ?AUTO_1409 ?AUTO_1412 ) ) ( not ( = ?AUTO_1410 ?AUTO_1411 ) ) ( not ( = ?AUTO_1410 ?AUTO_1412 ) ) ( not ( = ?AUTO_1411 ?AUTO_1412 ) ) ( ON ?AUTO_1411 ?AUTO_1408 ) ( CLEAR ?AUTO_1411 ) ( HOLDING ?AUTO_1413 ) ( not ( = ?AUTO_1408 ?AUTO_1413 ) ) ( not ( = ?AUTO_1409 ?AUTO_1413 ) ) ( not ( = ?AUTO_1410 ?AUTO_1413 ) ) ( not ( = ?AUTO_1412 ?AUTO_1413 ) ) ( not ( = ?AUTO_1411 ?AUTO_1413 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1413 )
      ( MAKE-ON ?AUTO_1408 ?AUTO_1409 )
      ( MAKE-ON-VERIFY ?AUTO_1408 ?AUTO_1409 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1414 - BLOCK
      ?AUTO_1415 - BLOCK
    )
    :vars
    (
      ?AUTO_1417 - BLOCK
      ?AUTO_1418 - BLOCK
      ?AUTO_1416 - BLOCK
      ?AUTO_1419 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1414 ?AUTO_1415 ) ) ( not ( = ?AUTO_1414 ?AUTO_1417 ) ) ( not ( = ?AUTO_1415 ?AUTO_1417 ) ) ( ON ?AUTO_1417 ?AUTO_1415 ) ( ON ?AUTO_1414 ?AUTO_1417 ) ( CLEAR ?AUTO_1418 ) ( not ( = ?AUTO_1414 ?AUTO_1416 ) ) ( not ( = ?AUTO_1414 ?AUTO_1418 ) ) ( not ( = ?AUTO_1415 ?AUTO_1416 ) ) ( not ( = ?AUTO_1415 ?AUTO_1418 ) ) ( not ( = ?AUTO_1417 ?AUTO_1416 ) ) ( not ( = ?AUTO_1417 ?AUTO_1418 ) ) ( not ( = ?AUTO_1416 ?AUTO_1418 ) ) ( ON ?AUTO_1416 ?AUTO_1414 ) ( not ( = ?AUTO_1414 ?AUTO_1419 ) ) ( not ( = ?AUTO_1415 ?AUTO_1419 ) ) ( not ( = ?AUTO_1417 ?AUTO_1419 ) ) ( not ( = ?AUTO_1418 ?AUTO_1419 ) ) ( not ( = ?AUTO_1416 ?AUTO_1419 ) ) ( ON ?AUTO_1419 ?AUTO_1416 ) ( CLEAR ?AUTO_1419 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1419 ?AUTO_1416 )
      ( MAKE-ON ?AUTO_1414 ?AUTO_1415 )
      ( MAKE-ON-VERIFY ?AUTO_1414 ?AUTO_1415 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1420 - BLOCK
      ?AUTO_1421 - BLOCK
    )
    :vars
    (
      ?AUTO_1423 - BLOCK
      ?AUTO_1424 - BLOCK
      ?AUTO_1422 - BLOCK
      ?AUTO_1425 - BLOCK
      ?AUTO_1426 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1420 ?AUTO_1421 ) ) ( not ( = ?AUTO_1420 ?AUTO_1423 ) ) ( not ( = ?AUTO_1421 ?AUTO_1423 ) ) ( ON ?AUTO_1423 ?AUTO_1421 ) ( ON ?AUTO_1420 ?AUTO_1423 ) ( CLEAR ?AUTO_1424 ) ( not ( = ?AUTO_1420 ?AUTO_1422 ) ) ( not ( = ?AUTO_1420 ?AUTO_1424 ) ) ( not ( = ?AUTO_1421 ?AUTO_1422 ) ) ( not ( = ?AUTO_1421 ?AUTO_1424 ) ) ( not ( = ?AUTO_1423 ?AUTO_1422 ) ) ( not ( = ?AUTO_1423 ?AUTO_1424 ) ) ( not ( = ?AUTO_1422 ?AUTO_1424 ) ) ( ON ?AUTO_1422 ?AUTO_1420 ) ( not ( = ?AUTO_1420 ?AUTO_1425 ) ) ( not ( = ?AUTO_1421 ?AUTO_1425 ) ) ( not ( = ?AUTO_1423 ?AUTO_1425 ) ) ( not ( = ?AUTO_1424 ?AUTO_1425 ) ) ( not ( = ?AUTO_1422 ?AUTO_1425 ) ) ( ON ?AUTO_1425 ?AUTO_1422 ) ( CLEAR ?AUTO_1425 ) ( HOLDING ?AUTO_1426 ) ( not ( = ?AUTO_1420 ?AUTO_1426 ) ) ( not ( = ?AUTO_1421 ?AUTO_1426 ) ) ( not ( = ?AUTO_1423 ?AUTO_1426 ) ) ( not ( = ?AUTO_1424 ?AUTO_1426 ) ) ( not ( = ?AUTO_1422 ?AUTO_1426 ) ) ( not ( = ?AUTO_1425 ?AUTO_1426 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1426 )
      ( MAKE-ON ?AUTO_1420 ?AUTO_1421 )
      ( MAKE-ON-VERIFY ?AUTO_1420 ?AUTO_1421 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1429 - BLOCK
      ?AUTO_1430 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1429 ) ( CLEAR ?AUTO_1430 ) ( not ( = ?AUTO_1429 ?AUTO_1430 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1429 ?AUTO_1430 )
      ( MAKE-ON-VERIFY ?AUTO_1429 ?AUTO_1430 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1431 - BLOCK
      ?AUTO_1432 - BLOCK
    )
    :vars
    (
      ?AUTO_1433 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1432 ) ( not ( = ?AUTO_1431 ?AUTO_1432 ) ) ( ON ?AUTO_1431 ?AUTO_1433 ) ( CLEAR ?AUTO_1431 ) ( HAND-EMPTY ) ( not ( = ?AUTO_1431 ?AUTO_1433 ) ) ( not ( = ?AUTO_1432 ?AUTO_1433 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1431 ?AUTO_1433 )
      ( MAKE-ON ?AUTO_1431 ?AUTO_1432 )
      ( MAKE-ON-VERIFY ?AUTO_1431 ?AUTO_1432 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1435 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1435 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1435 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1435 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1436 - BLOCK
    )
    :vars
    (
      ?AUTO_1437 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1436 ?AUTO_1437 ) ( CLEAR ?AUTO_1436 ) ( HAND-EMPTY ) ( not ( = ?AUTO_1436 ?AUTO_1437 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1436 ?AUTO_1437 )
      ( MAKE-ON-TABLE ?AUTO_1436 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1436 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1438 - BLOCK
    )
    :vars
    (
      ?AUTO_1439 - BLOCK
      ?AUTO_1440 - BLOCK
      ?AUTO_1441 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1438 ?AUTO_1439 ) ( CLEAR ?AUTO_1438 ) ( not ( = ?AUTO_1438 ?AUTO_1439 ) ) ( HOLDING ?AUTO_1440 ) ( CLEAR ?AUTO_1441 ) ( not ( = ?AUTO_1438 ?AUTO_1440 ) ) ( not ( = ?AUTO_1438 ?AUTO_1441 ) ) ( not ( = ?AUTO_1439 ?AUTO_1440 ) ) ( not ( = ?AUTO_1439 ?AUTO_1441 ) ) ( not ( = ?AUTO_1440 ?AUTO_1441 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1440 ?AUTO_1441 )
      ( MAKE-ON-TABLE ?AUTO_1438 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1438 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1442 - BLOCK
    )
    :vars
    (
      ?AUTO_1443 - BLOCK
      ?AUTO_1445 - BLOCK
      ?AUTO_1444 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1442 ?AUTO_1443 ) ( not ( = ?AUTO_1442 ?AUTO_1443 ) ) ( CLEAR ?AUTO_1445 ) ( not ( = ?AUTO_1442 ?AUTO_1444 ) ) ( not ( = ?AUTO_1442 ?AUTO_1445 ) ) ( not ( = ?AUTO_1443 ?AUTO_1444 ) ) ( not ( = ?AUTO_1443 ?AUTO_1445 ) ) ( not ( = ?AUTO_1444 ?AUTO_1445 ) ) ( ON ?AUTO_1444 ?AUTO_1442 ) ( CLEAR ?AUTO_1444 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1444 ?AUTO_1442 )
      ( MAKE-ON-TABLE ?AUTO_1442 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1442 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1448 - BLOCK
      ?AUTO_1449 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1448 ) ( CLEAR ?AUTO_1449 ) ( not ( = ?AUTO_1448 ?AUTO_1449 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1448 ?AUTO_1449 )
      ( MAKE-ON-VERIFY ?AUTO_1448 ?AUTO_1449 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1450 - BLOCK
      ?AUTO_1451 - BLOCK
    )
    :vars
    (
      ?AUTO_1452 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1451 ) ( not ( = ?AUTO_1450 ?AUTO_1451 ) ) ( ON ?AUTO_1450 ?AUTO_1452 ) ( CLEAR ?AUTO_1450 ) ( HAND-EMPTY ) ( not ( = ?AUTO_1450 ?AUTO_1452 ) ) ( not ( = ?AUTO_1451 ?AUTO_1452 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1450 ?AUTO_1452 )
      ( MAKE-ON ?AUTO_1450 ?AUTO_1451 )
      ( MAKE-ON-VERIFY ?AUTO_1450 ?AUTO_1451 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1453 - BLOCK
      ?AUTO_1454 - BLOCK
    )
    :vars
    (
      ?AUTO_1455 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1453 ?AUTO_1454 ) ) ( ON ?AUTO_1453 ?AUTO_1455 ) ( CLEAR ?AUTO_1453 ) ( not ( = ?AUTO_1453 ?AUTO_1455 ) ) ( not ( = ?AUTO_1454 ?AUTO_1455 ) ) ( HOLDING ?AUTO_1454 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1454 )
      ( MAKE-ON ?AUTO_1453 ?AUTO_1454 )
      ( MAKE-ON-VERIFY ?AUTO_1453 ?AUTO_1454 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1456 - BLOCK
      ?AUTO_1457 - BLOCK
    )
    :vars
    (
      ?AUTO_1458 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1456 ?AUTO_1457 ) ) ( ON ?AUTO_1456 ?AUTO_1458 ) ( not ( = ?AUTO_1456 ?AUTO_1458 ) ) ( not ( = ?AUTO_1457 ?AUTO_1458 ) ) ( ON ?AUTO_1457 ?AUTO_1456 ) ( CLEAR ?AUTO_1457 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1457 ?AUTO_1456 )
      ( MAKE-ON ?AUTO_1456 ?AUTO_1457 )
      ( MAKE-ON-VERIFY ?AUTO_1456 ?AUTO_1457 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1459 - BLOCK
      ?AUTO_1460 - BLOCK
    )
    :vars
    (
      ?AUTO_1461 - BLOCK
      ?AUTO_1462 - BLOCK
      ?AUTO_1463 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1459 ?AUTO_1460 ) ) ( ON ?AUTO_1459 ?AUTO_1461 ) ( not ( = ?AUTO_1459 ?AUTO_1461 ) ) ( not ( = ?AUTO_1460 ?AUTO_1461 ) ) ( ON ?AUTO_1460 ?AUTO_1459 ) ( CLEAR ?AUTO_1460 ) ( HOLDING ?AUTO_1462 ) ( CLEAR ?AUTO_1463 ) ( not ( = ?AUTO_1459 ?AUTO_1462 ) ) ( not ( = ?AUTO_1459 ?AUTO_1463 ) ) ( not ( = ?AUTO_1460 ?AUTO_1462 ) ) ( not ( = ?AUTO_1460 ?AUTO_1463 ) ) ( not ( = ?AUTO_1461 ?AUTO_1462 ) ) ( not ( = ?AUTO_1461 ?AUTO_1463 ) ) ( not ( = ?AUTO_1462 ?AUTO_1463 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1462 ?AUTO_1463 )
      ( MAKE-ON ?AUTO_1459 ?AUTO_1460 )
      ( MAKE-ON-VERIFY ?AUTO_1459 ?AUTO_1460 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1464 - BLOCK
      ?AUTO_1465 - BLOCK
    )
    :vars
    (
      ?AUTO_1466 - BLOCK
      ?AUTO_1467 - BLOCK
      ?AUTO_1468 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1464 ?AUTO_1465 ) ) ( ON ?AUTO_1464 ?AUTO_1466 ) ( not ( = ?AUTO_1464 ?AUTO_1466 ) ) ( not ( = ?AUTO_1465 ?AUTO_1466 ) ) ( ON ?AUTO_1465 ?AUTO_1464 ) ( CLEAR ?AUTO_1467 ) ( not ( = ?AUTO_1464 ?AUTO_1468 ) ) ( not ( = ?AUTO_1464 ?AUTO_1467 ) ) ( not ( = ?AUTO_1465 ?AUTO_1468 ) ) ( not ( = ?AUTO_1465 ?AUTO_1467 ) ) ( not ( = ?AUTO_1466 ?AUTO_1468 ) ) ( not ( = ?AUTO_1466 ?AUTO_1467 ) ) ( not ( = ?AUTO_1468 ?AUTO_1467 ) ) ( ON ?AUTO_1468 ?AUTO_1465 ) ( CLEAR ?AUTO_1468 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1468 ?AUTO_1465 )
      ( MAKE-ON ?AUTO_1464 ?AUTO_1465 )
      ( MAKE-ON-VERIFY ?AUTO_1464 ?AUTO_1465 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1471 - BLOCK
      ?AUTO_1472 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1471 ) ( CLEAR ?AUTO_1472 ) ( not ( = ?AUTO_1471 ?AUTO_1472 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1471 ?AUTO_1472 )
      ( MAKE-ON-VERIFY ?AUTO_1471 ?AUTO_1472 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1473 - BLOCK
      ?AUTO_1474 - BLOCK
    )
    :vars
    (
      ?AUTO_1475 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1474 ) ( not ( = ?AUTO_1473 ?AUTO_1474 ) ) ( ON ?AUTO_1473 ?AUTO_1475 ) ( CLEAR ?AUTO_1473 ) ( HAND-EMPTY ) ( not ( = ?AUTO_1473 ?AUTO_1475 ) ) ( not ( = ?AUTO_1474 ?AUTO_1475 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1473 ?AUTO_1475 )
      ( MAKE-ON ?AUTO_1473 ?AUTO_1474 )
      ( MAKE-ON-VERIFY ?AUTO_1473 ?AUTO_1474 ) )
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
      ?AUTO_1480 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1477 ) ( not ( = ?AUTO_1476 ?AUTO_1477 ) ) ( ON ?AUTO_1476 ?AUTO_1478 ) ( CLEAR ?AUTO_1476 ) ( not ( = ?AUTO_1476 ?AUTO_1478 ) ) ( not ( = ?AUTO_1477 ?AUTO_1478 ) ) ( HOLDING ?AUTO_1479 ) ( CLEAR ?AUTO_1480 ) ( not ( = ?AUTO_1476 ?AUTO_1479 ) ) ( not ( = ?AUTO_1476 ?AUTO_1480 ) ) ( not ( = ?AUTO_1477 ?AUTO_1479 ) ) ( not ( = ?AUTO_1477 ?AUTO_1480 ) ) ( not ( = ?AUTO_1478 ?AUTO_1479 ) ) ( not ( = ?AUTO_1478 ?AUTO_1480 ) ) ( not ( = ?AUTO_1479 ?AUTO_1480 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1479 ?AUTO_1480 )
      ( MAKE-ON ?AUTO_1476 ?AUTO_1477 )
      ( MAKE-ON-VERIFY ?AUTO_1476 ?AUTO_1477 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1481 - BLOCK
      ?AUTO_1482 - BLOCK
    )
    :vars
    (
      ?AUTO_1483 - BLOCK
      ?AUTO_1484 - BLOCK
      ?AUTO_1485 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1481 ?AUTO_1482 ) ) ( ON ?AUTO_1481 ?AUTO_1483 ) ( CLEAR ?AUTO_1481 ) ( not ( = ?AUTO_1481 ?AUTO_1483 ) ) ( not ( = ?AUTO_1482 ?AUTO_1483 ) ) ( CLEAR ?AUTO_1484 ) ( not ( = ?AUTO_1481 ?AUTO_1485 ) ) ( not ( = ?AUTO_1481 ?AUTO_1484 ) ) ( not ( = ?AUTO_1482 ?AUTO_1485 ) ) ( not ( = ?AUTO_1482 ?AUTO_1484 ) ) ( not ( = ?AUTO_1483 ?AUTO_1485 ) ) ( not ( = ?AUTO_1483 ?AUTO_1484 ) ) ( not ( = ?AUTO_1485 ?AUTO_1484 ) ) ( ON ?AUTO_1485 ?AUTO_1482 ) ( CLEAR ?AUTO_1485 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1485 ?AUTO_1482 )
      ( MAKE-ON ?AUTO_1481 ?AUTO_1482 )
      ( MAKE-ON-VERIFY ?AUTO_1481 ?AUTO_1482 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1486 - BLOCK
      ?AUTO_1487 - BLOCK
    )
    :vars
    (
      ?AUTO_1490 - BLOCK
      ?AUTO_1489 - BLOCK
      ?AUTO_1488 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1486 ?AUTO_1487 ) ) ( ON ?AUTO_1486 ?AUTO_1490 ) ( CLEAR ?AUTO_1486 ) ( not ( = ?AUTO_1486 ?AUTO_1490 ) ) ( not ( = ?AUTO_1487 ?AUTO_1490 ) ) ( not ( = ?AUTO_1486 ?AUTO_1489 ) ) ( not ( = ?AUTO_1486 ?AUTO_1488 ) ) ( not ( = ?AUTO_1487 ?AUTO_1489 ) ) ( not ( = ?AUTO_1487 ?AUTO_1488 ) ) ( not ( = ?AUTO_1490 ?AUTO_1489 ) ) ( not ( = ?AUTO_1490 ?AUTO_1488 ) ) ( not ( = ?AUTO_1489 ?AUTO_1488 ) ) ( ON ?AUTO_1489 ?AUTO_1487 ) ( CLEAR ?AUTO_1489 ) ( HOLDING ?AUTO_1488 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1488 )
      ( MAKE-ON ?AUTO_1486 ?AUTO_1487 )
      ( MAKE-ON-VERIFY ?AUTO_1486 ?AUTO_1487 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1491 - BLOCK
      ?AUTO_1492 - BLOCK
    )
    :vars
    (
      ?AUTO_1495 - BLOCK
      ?AUTO_1493 - BLOCK
      ?AUTO_1494 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1491 ?AUTO_1492 ) ) ( ON ?AUTO_1491 ?AUTO_1495 ) ( CLEAR ?AUTO_1491 ) ( not ( = ?AUTO_1491 ?AUTO_1495 ) ) ( not ( = ?AUTO_1492 ?AUTO_1495 ) ) ( not ( = ?AUTO_1491 ?AUTO_1493 ) ) ( not ( = ?AUTO_1491 ?AUTO_1494 ) ) ( not ( = ?AUTO_1492 ?AUTO_1493 ) ) ( not ( = ?AUTO_1492 ?AUTO_1494 ) ) ( not ( = ?AUTO_1495 ?AUTO_1493 ) ) ( not ( = ?AUTO_1495 ?AUTO_1494 ) ) ( not ( = ?AUTO_1493 ?AUTO_1494 ) ) ( ON ?AUTO_1493 ?AUTO_1492 ) ( ON ?AUTO_1494 ?AUTO_1493 ) ( CLEAR ?AUTO_1494 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1494 ?AUTO_1493 )
      ( MAKE-ON ?AUTO_1491 ?AUTO_1492 )
      ( MAKE-ON-VERIFY ?AUTO_1491 ?AUTO_1492 ) )
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
      ?AUTO_1500 - BLOCK
      ?AUTO_1498 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1496 ?AUTO_1497 ) ) ( not ( = ?AUTO_1496 ?AUTO_1499 ) ) ( not ( = ?AUTO_1497 ?AUTO_1499 ) ) ( not ( = ?AUTO_1496 ?AUTO_1500 ) ) ( not ( = ?AUTO_1496 ?AUTO_1498 ) ) ( not ( = ?AUTO_1497 ?AUTO_1500 ) ) ( not ( = ?AUTO_1497 ?AUTO_1498 ) ) ( not ( = ?AUTO_1499 ?AUTO_1500 ) ) ( not ( = ?AUTO_1499 ?AUTO_1498 ) ) ( not ( = ?AUTO_1500 ?AUTO_1498 ) ) ( ON ?AUTO_1500 ?AUTO_1497 ) ( ON ?AUTO_1498 ?AUTO_1500 ) ( CLEAR ?AUTO_1498 ) ( HOLDING ?AUTO_1496 ) ( CLEAR ?AUTO_1499 ) )
    :subtasks
    ( ( !STACK ?AUTO_1496 ?AUTO_1499 )
      ( MAKE-ON ?AUTO_1496 ?AUTO_1497 )
      ( MAKE-ON-VERIFY ?AUTO_1496 ?AUTO_1497 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1501 - BLOCK
      ?AUTO_1502 - BLOCK
    )
    :vars
    (
      ?AUTO_1504 - BLOCK
      ?AUTO_1503 - BLOCK
      ?AUTO_1505 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1501 ?AUTO_1502 ) ) ( not ( = ?AUTO_1501 ?AUTO_1504 ) ) ( not ( = ?AUTO_1502 ?AUTO_1504 ) ) ( not ( = ?AUTO_1501 ?AUTO_1503 ) ) ( not ( = ?AUTO_1501 ?AUTO_1505 ) ) ( not ( = ?AUTO_1502 ?AUTO_1503 ) ) ( not ( = ?AUTO_1502 ?AUTO_1505 ) ) ( not ( = ?AUTO_1504 ?AUTO_1503 ) ) ( not ( = ?AUTO_1504 ?AUTO_1505 ) ) ( not ( = ?AUTO_1503 ?AUTO_1505 ) ) ( ON ?AUTO_1503 ?AUTO_1502 ) ( ON ?AUTO_1505 ?AUTO_1503 ) ( CLEAR ?AUTO_1504 ) ( ON ?AUTO_1501 ?AUTO_1505 ) ( CLEAR ?AUTO_1501 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1501 ?AUTO_1505 )
      ( MAKE-ON ?AUTO_1501 ?AUTO_1502 )
      ( MAKE-ON-VERIFY ?AUTO_1501 ?AUTO_1502 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1508 - BLOCK
      ?AUTO_1509 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1508 ) ( CLEAR ?AUTO_1509 ) ( not ( = ?AUTO_1508 ?AUTO_1509 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1508 ?AUTO_1509 )
      ( MAKE-ON-VERIFY ?AUTO_1508 ?AUTO_1509 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1510 - BLOCK
      ?AUTO_1511 - BLOCK
    )
    :vars
    (
      ?AUTO_1512 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1511 ) ( not ( = ?AUTO_1510 ?AUTO_1511 ) ) ( ON ?AUTO_1510 ?AUTO_1512 ) ( CLEAR ?AUTO_1510 ) ( HAND-EMPTY ) ( not ( = ?AUTO_1510 ?AUTO_1512 ) ) ( not ( = ?AUTO_1511 ?AUTO_1512 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1510 ?AUTO_1512 )
      ( MAKE-ON ?AUTO_1510 ?AUTO_1511 )
      ( MAKE-ON-VERIFY ?AUTO_1510 ?AUTO_1511 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1513 - BLOCK
      ?AUTO_1514 - BLOCK
    )
    :vars
    (
      ?AUTO_1515 - BLOCK
      ?AUTO_1516 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1513 ?AUTO_1514 ) ) ( ON ?AUTO_1513 ?AUTO_1515 ) ( CLEAR ?AUTO_1513 ) ( not ( = ?AUTO_1513 ?AUTO_1515 ) ) ( not ( = ?AUTO_1514 ?AUTO_1515 ) ) ( HOLDING ?AUTO_1514 ) ( CLEAR ?AUTO_1516 ) ( not ( = ?AUTO_1513 ?AUTO_1516 ) ) ( not ( = ?AUTO_1514 ?AUTO_1516 ) ) ( not ( = ?AUTO_1515 ?AUTO_1516 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1514 ?AUTO_1516 )
      ( MAKE-ON ?AUTO_1513 ?AUTO_1514 )
      ( MAKE-ON-VERIFY ?AUTO_1513 ?AUTO_1514 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1525 - BLOCK
      ?AUTO_1526 - BLOCK
    )
    :vars
    (
      ?AUTO_1529 - BLOCK
      ?AUTO_1528 - BLOCK
      ?AUTO_1527 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1526 ) ( not ( = ?AUTO_1525 ?AUTO_1526 ) ) ( ON ?AUTO_1525 ?AUTO_1529 ) ( not ( = ?AUTO_1525 ?AUTO_1529 ) ) ( not ( = ?AUTO_1526 ?AUTO_1529 ) ) ( CLEAR ?AUTO_1528 ) ( not ( = ?AUTO_1525 ?AUTO_1527 ) ) ( not ( = ?AUTO_1525 ?AUTO_1528 ) ) ( not ( = ?AUTO_1526 ?AUTO_1527 ) ) ( not ( = ?AUTO_1526 ?AUTO_1528 ) ) ( not ( = ?AUTO_1529 ?AUTO_1527 ) ) ( not ( = ?AUTO_1529 ?AUTO_1528 ) ) ( not ( = ?AUTO_1527 ?AUTO_1528 ) ) ( ON ?AUTO_1527 ?AUTO_1525 ) ( CLEAR ?AUTO_1527 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1527 ?AUTO_1525 )
      ( MAKE-ON ?AUTO_1525 ?AUTO_1526 )
      ( MAKE-ON-VERIFY ?AUTO_1525 ?AUTO_1526 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1530 - BLOCK
      ?AUTO_1531 - BLOCK
    )
    :vars
    (
      ?AUTO_1534 - BLOCK
      ?AUTO_1533 - BLOCK
      ?AUTO_1532 - BLOCK
      ?AUTO_1535 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1530 ?AUTO_1531 ) ) ( ON ?AUTO_1530 ?AUTO_1534 ) ( not ( = ?AUTO_1530 ?AUTO_1534 ) ) ( not ( = ?AUTO_1531 ?AUTO_1534 ) ) ( CLEAR ?AUTO_1533 ) ( not ( = ?AUTO_1530 ?AUTO_1532 ) ) ( not ( = ?AUTO_1530 ?AUTO_1533 ) ) ( not ( = ?AUTO_1531 ?AUTO_1532 ) ) ( not ( = ?AUTO_1531 ?AUTO_1533 ) ) ( not ( = ?AUTO_1534 ?AUTO_1532 ) ) ( not ( = ?AUTO_1534 ?AUTO_1533 ) ) ( not ( = ?AUTO_1532 ?AUTO_1533 ) ) ( ON ?AUTO_1532 ?AUTO_1530 ) ( CLEAR ?AUTO_1532 ) ( HOLDING ?AUTO_1531 ) ( CLEAR ?AUTO_1535 ) ( not ( = ?AUTO_1530 ?AUTO_1535 ) ) ( not ( = ?AUTO_1531 ?AUTO_1535 ) ) ( not ( = ?AUTO_1534 ?AUTO_1535 ) ) ( not ( = ?AUTO_1533 ?AUTO_1535 ) ) ( not ( = ?AUTO_1532 ?AUTO_1535 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1531 ?AUTO_1535 )
      ( MAKE-ON ?AUTO_1530 ?AUTO_1531 )
      ( MAKE-ON-VERIFY ?AUTO_1530 ?AUTO_1531 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1536 - BLOCK
      ?AUTO_1537 - BLOCK
    )
    :vars
    (
      ?AUTO_1541 - BLOCK
      ?AUTO_1539 - BLOCK
      ?AUTO_1538 - BLOCK
      ?AUTO_1540 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1536 ?AUTO_1537 ) ) ( ON ?AUTO_1536 ?AUTO_1541 ) ( not ( = ?AUTO_1536 ?AUTO_1541 ) ) ( not ( = ?AUTO_1537 ?AUTO_1541 ) ) ( CLEAR ?AUTO_1539 ) ( not ( = ?AUTO_1536 ?AUTO_1538 ) ) ( not ( = ?AUTO_1536 ?AUTO_1539 ) ) ( not ( = ?AUTO_1537 ?AUTO_1538 ) ) ( not ( = ?AUTO_1537 ?AUTO_1539 ) ) ( not ( = ?AUTO_1541 ?AUTO_1538 ) ) ( not ( = ?AUTO_1541 ?AUTO_1539 ) ) ( not ( = ?AUTO_1538 ?AUTO_1539 ) ) ( ON ?AUTO_1538 ?AUTO_1536 ) ( CLEAR ?AUTO_1540 ) ( not ( = ?AUTO_1536 ?AUTO_1540 ) ) ( not ( = ?AUTO_1537 ?AUTO_1540 ) ) ( not ( = ?AUTO_1541 ?AUTO_1540 ) ) ( not ( = ?AUTO_1539 ?AUTO_1540 ) ) ( not ( = ?AUTO_1538 ?AUTO_1540 ) ) ( ON ?AUTO_1537 ?AUTO_1538 ) ( CLEAR ?AUTO_1537 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1537 ?AUTO_1538 )
      ( MAKE-ON ?AUTO_1536 ?AUTO_1537 )
      ( MAKE-ON-VERIFY ?AUTO_1536 ?AUTO_1537 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1544 - BLOCK
      ?AUTO_1545 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1544 ) ( CLEAR ?AUTO_1545 ) ( not ( = ?AUTO_1544 ?AUTO_1545 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1544 ?AUTO_1545 )
      ( MAKE-ON-VERIFY ?AUTO_1544 ?AUTO_1545 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1546 - BLOCK
      ?AUTO_1547 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1547 ) ( not ( = ?AUTO_1546 ?AUTO_1547 ) ) ( ON-TABLE ?AUTO_1546 ) ( CLEAR ?AUTO_1546 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_1546 )
      ( MAKE-ON ?AUTO_1546 ?AUTO_1547 )
      ( MAKE-ON-VERIFY ?AUTO_1546 ?AUTO_1547 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1548 - BLOCK
      ?AUTO_1549 - BLOCK
    )
    :vars
    (
      ?AUTO_1550 - BLOCK
      ?AUTO_1551 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1549 ) ( not ( = ?AUTO_1548 ?AUTO_1549 ) ) ( ON-TABLE ?AUTO_1548 ) ( CLEAR ?AUTO_1548 ) ( HOLDING ?AUTO_1550 ) ( CLEAR ?AUTO_1551 ) ( not ( = ?AUTO_1548 ?AUTO_1550 ) ) ( not ( = ?AUTO_1548 ?AUTO_1551 ) ) ( not ( = ?AUTO_1549 ?AUTO_1550 ) ) ( not ( = ?AUTO_1549 ?AUTO_1551 ) ) ( not ( = ?AUTO_1550 ?AUTO_1551 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1550 ?AUTO_1551 )
      ( MAKE-ON ?AUTO_1548 ?AUTO_1549 )
      ( MAKE-ON-VERIFY ?AUTO_1548 ?AUTO_1549 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1552 - BLOCK
      ?AUTO_1553 - BLOCK
    )
    :vars
    (
      ?AUTO_1554 - BLOCK
      ?AUTO_1555 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1552 ?AUTO_1553 ) ) ( ON-TABLE ?AUTO_1552 ) ( CLEAR ?AUTO_1552 ) ( CLEAR ?AUTO_1554 ) ( not ( = ?AUTO_1552 ?AUTO_1555 ) ) ( not ( = ?AUTO_1552 ?AUTO_1554 ) ) ( not ( = ?AUTO_1553 ?AUTO_1555 ) ) ( not ( = ?AUTO_1553 ?AUTO_1554 ) ) ( not ( = ?AUTO_1555 ?AUTO_1554 ) ) ( ON ?AUTO_1555 ?AUTO_1553 ) ( CLEAR ?AUTO_1555 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1555 ?AUTO_1553 )
      ( MAKE-ON ?AUTO_1552 ?AUTO_1553 )
      ( MAKE-ON-VERIFY ?AUTO_1552 ?AUTO_1553 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1556 - BLOCK
      ?AUTO_1557 - BLOCK
    )
    :vars
    (
      ?AUTO_1559 - BLOCK
      ?AUTO_1558 - BLOCK
      ?AUTO_1560 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1556 ?AUTO_1557 ) ) ( ON-TABLE ?AUTO_1556 ) ( CLEAR ?AUTO_1556 ) ( not ( = ?AUTO_1556 ?AUTO_1559 ) ) ( not ( = ?AUTO_1556 ?AUTO_1558 ) ) ( not ( = ?AUTO_1557 ?AUTO_1559 ) ) ( not ( = ?AUTO_1557 ?AUTO_1558 ) ) ( not ( = ?AUTO_1559 ?AUTO_1558 ) ) ( ON ?AUTO_1559 ?AUTO_1557 ) ( CLEAR ?AUTO_1559 ) ( HOLDING ?AUTO_1558 ) ( CLEAR ?AUTO_1560 ) ( not ( = ?AUTO_1556 ?AUTO_1560 ) ) ( not ( = ?AUTO_1557 ?AUTO_1560 ) ) ( not ( = ?AUTO_1559 ?AUTO_1560 ) ) ( not ( = ?AUTO_1558 ?AUTO_1560 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1558 ?AUTO_1560 )
      ( MAKE-ON ?AUTO_1556 ?AUTO_1557 )
      ( MAKE-ON-VERIFY ?AUTO_1556 ?AUTO_1557 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1567 - BLOCK
      ?AUTO_1568 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1567 ?AUTO_1568 ) ) ( ON-TABLE ?AUTO_1567 ) ( CLEAR ?AUTO_1567 ) ( HOLDING ?AUTO_1568 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1568 )
      ( MAKE-ON ?AUTO_1567 ?AUTO_1568 )
      ( MAKE-ON-VERIFY ?AUTO_1567 ?AUTO_1568 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1577 - BLOCK
      ?AUTO_1578 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1577 ) ( CLEAR ?AUTO_1578 ) ( not ( = ?AUTO_1577 ?AUTO_1578 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1577 ?AUTO_1578 )
      ( MAKE-ON-VERIFY ?AUTO_1577 ?AUTO_1578 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1579 - BLOCK
      ?AUTO_1580 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1580 ) ( not ( = ?AUTO_1579 ?AUTO_1580 ) ) ( ON-TABLE ?AUTO_1579 ) ( CLEAR ?AUTO_1579 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_1579 )
      ( MAKE-ON ?AUTO_1579 ?AUTO_1580 )
      ( MAKE-ON-VERIFY ?AUTO_1579 ?AUTO_1580 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1581 - BLOCK
      ?AUTO_1582 - BLOCK
    )
    :vars
    (
      ?AUTO_1583 - BLOCK
      ?AUTO_1584 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1582 ) ( not ( = ?AUTO_1581 ?AUTO_1582 ) ) ( ON-TABLE ?AUTO_1581 ) ( CLEAR ?AUTO_1581 ) ( HOLDING ?AUTO_1583 ) ( CLEAR ?AUTO_1584 ) ( not ( = ?AUTO_1581 ?AUTO_1583 ) ) ( not ( = ?AUTO_1581 ?AUTO_1584 ) ) ( not ( = ?AUTO_1582 ?AUTO_1583 ) ) ( not ( = ?AUTO_1582 ?AUTO_1584 ) ) ( not ( = ?AUTO_1583 ?AUTO_1584 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1583 ?AUTO_1584 )
      ( MAKE-ON ?AUTO_1581 ?AUTO_1582 )
      ( MAKE-ON-VERIFY ?AUTO_1581 ?AUTO_1582 ) )
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
    )
    :precondition
    ( and ( not ( = ?AUTO_1587 ?AUTO_1588 ) ) ( ON-TABLE ?AUTO_1587 ) ( CLEAR ?AUTO_1587 ) ( HOLDING ?AUTO_1588 ) ( CLEAR ?AUTO_1589 ) ( not ( = ?AUTO_1587 ?AUTO_1589 ) ) ( not ( = ?AUTO_1588 ?AUTO_1589 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1588 ?AUTO_1589 )
      ( MAKE-ON ?AUTO_1587 ?AUTO_1588 )
      ( MAKE-ON-VERIFY ?AUTO_1587 ?AUTO_1588 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1594 - BLOCK
      ?AUTO_1595 - BLOCK
    )
    :vars
    (
      ?AUTO_1597 - BLOCK
      ?AUTO_1596 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1595 ) ( not ( = ?AUTO_1594 ?AUTO_1595 ) ) ( ON-TABLE ?AUTO_1594 ) ( CLEAR ?AUTO_1597 ) ( not ( = ?AUTO_1594 ?AUTO_1596 ) ) ( not ( = ?AUTO_1594 ?AUTO_1597 ) ) ( not ( = ?AUTO_1595 ?AUTO_1596 ) ) ( not ( = ?AUTO_1595 ?AUTO_1597 ) ) ( not ( = ?AUTO_1596 ?AUTO_1597 ) ) ( ON ?AUTO_1596 ?AUTO_1594 ) ( CLEAR ?AUTO_1596 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1596 ?AUTO_1594 )
      ( MAKE-ON ?AUTO_1594 ?AUTO_1595 )
      ( MAKE-ON-VERIFY ?AUTO_1594 ?AUTO_1595 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1598 - BLOCK
      ?AUTO_1599 - BLOCK
    )
    :vars
    (
      ?AUTO_1600 - BLOCK
      ?AUTO_1601 - BLOCK
      ?AUTO_1602 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1598 ?AUTO_1599 ) ) ( ON-TABLE ?AUTO_1598 ) ( CLEAR ?AUTO_1600 ) ( not ( = ?AUTO_1598 ?AUTO_1601 ) ) ( not ( = ?AUTO_1598 ?AUTO_1600 ) ) ( not ( = ?AUTO_1599 ?AUTO_1601 ) ) ( not ( = ?AUTO_1599 ?AUTO_1600 ) ) ( not ( = ?AUTO_1601 ?AUTO_1600 ) ) ( ON ?AUTO_1601 ?AUTO_1598 ) ( CLEAR ?AUTO_1601 ) ( HOLDING ?AUTO_1599 ) ( CLEAR ?AUTO_1602 ) ( not ( = ?AUTO_1598 ?AUTO_1602 ) ) ( not ( = ?AUTO_1599 ?AUTO_1602 ) ) ( not ( = ?AUTO_1600 ?AUTO_1602 ) ) ( not ( = ?AUTO_1601 ?AUTO_1602 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1599 ?AUTO_1602 )
      ( MAKE-ON ?AUTO_1598 ?AUTO_1599 )
      ( MAKE-ON-VERIFY ?AUTO_1598 ?AUTO_1599 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1605 - BLOCK
      ?AUTO_1606 - BLOCK
    )
    :vars
    (
      ?AUTO_1607 - BLOCK
      ?AUTO_1608 - BLOCK
      ?AUTO_1609 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1606 ) ( not ( = ?AUTO_1605 ?AUTO_1606 ) ) ( ON-TABLE ?AUTO_1605 ) ( CLEAR ?AUTO_1607 ) ( not ( = ?AUTO_1605 ?AUTO_1608 ) ) ( not ( = ?AUTO_1605 ?AUTO_1607 ) ) ( not ( = ?AUTO_1606 ?AUTO_1608 ) ) ( not ( = ?AUTO_1606 ?AUTO_1607 ) ) ( not ( = ?AUTO_1608 ?AUTO_1607 ) ) ( ON ?AUTO_1608 ?AUTO_1605 ) ( CLEAR ?AUTO_1608 ) ( HOLDING ?AUTO_1609 ) ( not ( = ?AUTO_1605 ?AUTO_1609 ) ) ( not ( = ?AUTO_1606 ?AUTO_1609 ) ) ( not ( = ?AUTO_1607 ?AUTO_1609 ) ) ( not ( = ?AUTO_1608 ?AUTO_1609 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1609 )
      ( MAKE-ON ?AUTO_1605 ?AUTO_1606 )
      ( MAKE-ON-VERIFY ?AUTO_1605 ?AUTO_1606 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1610 - BLOCK
      ?AUTO_1611 - BLOCK
    )
    :vars
    (
      ?AUTO_1613 - BLOCK
      ?AUTO_1612 - BLOCK
      ?AUTO_1614 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1610 ?AUTO_1611 ) ) ( ON-TABLE ?AUTO_1610 ) ( CLEAR ?AUTO_1613 ) ( not ( = ?AUTO_1610 ?AUTO_1612 ) ) ( not ( = ?AUTO_1610 ?AUTO_1613 ) ) ( not ( = ?AUTO_1611 ?AUTO_1612 ) ) ( not ( = ?AUTO_1611 ?AUTO_1613 ) ) ( not ( = ?AUTO_1612 ?AUTO_1613 ) ) ( ON ?AUTO_1612 ?AUTO_1610 ) ( CLEAR ?AUTO_1612 ) ( not ( = ?AUTO_1610 ?AUTO_1614 ) ) ( not ( = ?AUTO_1611 ?AUTO_1614 ) ) ( not ( = ?AUTO_1613 ?AUTO_1614 ) ) ( not ( = ?AUTO_1612 ?AUTO_1614 ) ) ( ON ?AUTO_1614 ?AUTO_1611 ) ( CLEAR ?AUTO_1614 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1614 ?AUTO_1611 )
      ( MAKE-ON ?AUTO_1610 ?AUTO_1611 )
      ( MAKE-ON-VERIFY ?AUTO_1610 ?AUTO_1611 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1617 - BLOCK
      ?AUTO_1618 - BLOCK
    )
    :vars
    (
      ?AUTO_1619 - BLOCK
      ?AUTO_1620 - BLOCK
      ?AUTO_1621 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1617 ?AUTO_1618 ) ) ( ON-TABLE ?AUTO_1617 ) ( CLEAR ?AUTO_1617 ) ( not ( = ?AUTO_1617 ?AUTO_1619 ) ) ( not ( = ?AUTO_1617 ?AUTO_1620 ) ) ( not ( = ?AUTO_1618 ?AUTO_1619 ) ) ( not ( = ?AUTO_1618 ?AUTO_1620 ) ) ( not ( = ?AUTO_1619 ?AUTO_1620 ) ) ( ON ?AUTO_1619 ?AUTO_1618 ) ( CLEAR ?AUTO_1621 ) ( not ( = ?AUTO_1617 ?AUTO_1621 ) ) ( not ( = ?AUTO_1618 ?AUTO_1621 ) ) ( not ( = ?AUTO_1619 ?AUTO_1621 ) ) ( not ( = ?AUTO_1620 ?AUTO_1621 ) ) ( ON ?AUTO_1620 ?AUTO_1619 ) ( CLEAR ?AUTO_1620 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1620 ?AUTO_1619 )
      ( MAKE-ON ?AUTO_1617 ?AUTO_1618 )
      ( MAKE-ON-VERIFY ?AUTO_1617 ?AUTO_1618 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1623 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1623 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1623 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1623 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1624 - BLOCK
    )
    :vars
    (
      ?AUTO_1625 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1624 ?AUTO_1625 ) ( CLEAR ?AUTO_1624 ) ( HAND-EMPTY ) ( not ( = ?AUTO_1624 ?AUTO_1625 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1624 ?AUTO_1625 )
      ( MAKE-ON-TABLE ?AUTO_1624 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1624 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1627 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1627 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1627 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1627 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1628 - BLOCK
    )
    :vars
    (
      ?AUTO_1629 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1628 ?AUTO_1629 ) ( CLEAR ?AUTO_1628 ) ( HAND-EMPTY ) ( not ( = ?AUTO_1628 ?AUTO_1629 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1628 ?AUTO_1629 )
      ( MAKE-ON-TABLE ?AUTO_1628 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1628 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1630 - BLOCK
    )
    :vars
    (
      ?AUTO_1631 - BLOCK
      ?AUTO_1632 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1630 ?AUTO_1631 ) ( CLEAR ?AUTO_1630 ) ( not ( = ?AUTO_1630 ?AUTO_1631 ) ) ( HOLDING ?AUTO_1632 ) ( not ( = ?AUTO_1630 ?AUTO_1632 ) ) ( not ( = ?AUTO_1631 ?AUTO_1632 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1632 )
      ( MAKE-ON-TABLE ?AUTO_1630 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1630 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1633 - BLOCK
    )
    :vars
    (
      ?AUTO_1634 - BLOCK
      ?AUTO_1635 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1633 ?AUTO_1634 ) ( not ( = ?AUTO_1633 ?AUTO_1634 ) ) ( not ( = ?AUTO_1633 ?AUTO_1635 ) ) ( not ( = ?AUTO_1634 ?AUTO_1635 ) ) ( ON ?AUTO_1635 ?AUTO_1633 ) ( CLEAR ?AUTO_1635 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1635 ?AUTO_1633 )
      ( MAKE-ON-TABLE ?AUTO_1633 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1633 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1637 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1637 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1637 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1637 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1638 - BLOCK
    )
    :vars
    (
      ?AUTO_1639 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1638 ?AUTO_1639 ) ( CLEAR ?AUTO_1638 ) ( HAND-EMPTY ) ( not ( = ?AUTO_1638 ?AUTO_1639 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1638 ?AUTO_1639 )
      ( MAKE-ON-TABLE ?AUTO_1638 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1638 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1640 - BLOCK
    )
    :vars
    (
      ?AUTO_1641 - BLOCK
      ?AUTO_1642 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1640 ?AUTO_1641 ) ( CLEAR ?AUTO_1640 ) ( not ( = ?AUTO_1640 ?AUTO_1641 ) ) ( HOLDING ?AUTO_1642 ) ( not ( = ?AUTO_1640 ?AUTO_1642 ) ) ( not ( = ?AUTO_1641 ?AUTO_1642 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1642 )
      ( MAKE-ON-TABLE ?AUTO_1640 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1640 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1643 - BLOCK
    )
    :vars
    (
      ?AUTO_1644 - BLOCK
      ?AUTO_1645 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1643 ?AUTO_1644 ) ( not ( = ?AUTO_1643 ?AUTO_1644 ) ) ( not ( = ?AUTO_1643 ?AUTO_1645 ) ) ( not ( = ?AUTO_1644 ?AUTO_1645 ) ) ( ON ?AUTO_1645 ?AUTO_1643 ) ( CLEAR ?AUTO_1645 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1645 ?AUTO_1643 )
      ( MAKE-ON-TABLE ?AUTO_1643 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1643 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1646 - BLOCK
    )
    :vars
    (
      ?AUTO_1647 - BLOCK
      ?AUTO_1648 - BLOCK
      ?AUTO_1649 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1646 ?AUTO_1647 ) ( not ( = ?AUTO_1646 ?AUTO_1647 ) ) ( not ( = ?AUTO_1646 ?AUTO_1648 ) ) ( not ( = ?AUTO_1647 ?AUTO_1648 ) ) ( ON ?AUTO_1648 ?AUTO_1646 ) ( CLEAR ?AUTO_1648 ) ( HOLDING ?AUTO_1649 ) ( not ( = ?AUTO_1646 ?AUTO_1649 ) ) ( not ( = ?AUTO_1647 ?AUTO_1649 ) ) ( not ( = ?AUTO_1648 ?AUTO_1649 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1649 )
      ( MAKE-ON-TABLE ?AUTO_1646 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1646 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1650 - BLOCK
    )
    :vars
    (
      ?AUTO_1651 - BLOCK
      ?AUTO_1652 - BLOCK
      ?AUTO_1653 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1650 ?AUTO_1651 ) ( not ( = ?AUTO_1650 ?AUTO_1651 ) ) ( not ( = ?AUTO_1650 ?AUTO_1652 ) ) ( not ( = ?AUTO_1651 ?AUTO_1652 ) ) ( ON ?AUTO_1652 ?AUTO_1650 ) ( not ( = ?AUTO_1650 ?AUTO_1653 ) ) ( not ( = ?AUTO_1651 ?AUTO_1653 ) ) ( not ( = ?AUTO_1652 ?AUTO_1653 ) ) ( ON ?AUTO_1653 ?AUTO_1652 ) ( CLEAR ?AUTO_1653 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1653 ?AUTO_1652 )
      ( MAKE-ON-TABLE ?AUTO_1650 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1650 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1656 - BLOCK
      ?AUTO_1657 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1656 ) ( CLEAR ?AUTO_1657 ) ( not ( = ?AUTO_1656 ?AUTO_1657 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1656 ?AUTO_1657 )
      ( MAKE-ON-VERIFY ?AUTO_1656 ?AUTO_1657 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1658 - BLOCK
      ?AUTO_1659 - BLOCK
    )
    :vars
    (
      ?AUTO_1660 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1659 ) ( not ( = ?AUTO_1658 ?AUTO_1659 ) ) ( ON ?AUTO_1658 ?AUTO_1660 ) ( CLEAR ?AUTO_1658 ) ( HAND-EMPTY ) ( not ( = ?AUTO_1658 ?AUTO_1660 ) ) ( not ( = ?AUTO_1659 ?AUTO_1660 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1658 ?AUTO_1660 )
      ( MAKE-ON ?AUTO_1658 ?AUTO_1659 )
      ( MAKE-ON-VERIFY ?AUTO_1658 ?AUTO_1659 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1661 - BLOCK
      ?AUTO_1662 - BLOCK
    )
    :vars
    (
      ?AUTO_1663 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1661 ?AUTO_1662 ) ) ( ON ?AUTO_1661 ?AUTO_1663 ) ( CLEAR ?AUTO_1661 ) ( not ( = ?AUTO_1661 ?AUTO_1663 ) ) ( not ( = ?AUTO_1662 ?AUTO_1663 ) ) ( HOLDING ?AUTO_1662 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1662 )
      ( MAKE-ON ?AUTO_1661 ?AUTO_1662 )
      ( MAKE-ON-VERIFY ?AUTO_1661 ?AUTO_1662 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1664 - BLOCK
      ?AUTO_1665 - BLOCK
    )
    :vars
    (
      ?AUTO_1666 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1664 ?AUTO_1665 ) ) ( ON ?AUTO_1664 ?AUTO_1666 ) ( not ( = ?AUTO_1664 ?AUTO_1666 ) ) ( not ( = ?AUTO_1665 ?AUTO_1666 ) ) ( ON ?AUTO_1665 ?AUTO_1664 ) ( CLEAR ?AUTO_1665 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1665 ?AUTO_1664 )
      ( MAKE-ON ?AUTO_1664 ?AUTO_1665 )
      ( MAKE-ON-VERIFY ?AUTO_1664 ?AUTO_1665 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1667 - BLOCK
      ?AUTO_1668 - BLOCK
    )
    :vars
    (
      ?AUTO_1669 - BLOCK
      ?AUTO_1670 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1667 ?AUTO_1668 ) ) ( ON ?AUTO_1667 ?AUTO_1669 ) ( not ( = ?AUTO_1667 ?AUTO_1669 ) ) ( not ( = ?AUTO_1668 ?AUTO_1669 ) ) ( ON ?AUTO_1668 ?AUTO_1667 ) ( CLEAR ?AUTO_1668 ) ( HOLDING ?AUTO_1670 ) ( not ( = ?AUTO_1667 ?AUTO_1670 ) ) ( not ( = ?AUTO_1668 ?AUTO_1670 ) ) ( not ( = ?AUTO_1669 ?AUTO_1670 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1670 )
      ( MAKE-ON ?AUTO_1667 ?AUTO_1668 )
      ( MAKE-ON-VERIFY ?AUTO_1667 ?AUTO_1668 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1671 - BLOCK
      ?AUTO_1672 - BLOCK
    )
    :vars
    (
      ?AUTO_1673 - BLOCK
      ?AUTO_1674 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1671 ?AUTO_1672 ) ) ( ON ?AUTO_1671 ?AUTO_1673 ) ( not ( = ?AUTO_1671 ?AUTO_1673 ) ) ( not ( = ?AUTO_1672 ?AUTO_1673 ) ) ( ON ?AUTO_1672 ?AUTO_1671 ) ( not ( = ?AUTO_1671 ?AUTO_1674 ) ) ( not ( = ?AUTO_1672 ?AUTO_1674 ) ) ( not ( = ?AUTO_1673 ?AUTO_1674 ) ) ( ON ?AUTO_1674 ?AUTO_1672 ) ( CLEAR ?AUTO_1674 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1674 ?AUTO_1672 )
      ( MAKE-ON ?AUTO_1671 ?AUTO_1672 )
      ( MAKE-ON-VERIFY ?AUTO_1671 ?AUTO_1672 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1675 - BLOCK
      ?AUTO_1676 - BLOCK
    )
    :vars
    (
      ?AUTO_1678 - BLOCK
      ?AUTO_1677 - BLOCK
      ?AUTO_1679 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1675 ?AUTO_1676 ) ) ( ON ?AUTO_1675 ?AUTO_1678 ) ( not ( = ?AUTO_1675 ?AUTO_1678 ) ) ( not ( = ?AUTO_1676 ?AUTO_1678 ) ) ( ON ?AUTO_1676 ?AUTO_1675 ) ( not ( = ?AUTO_1675 ?AUTO_1677 ) ) ( not ( = ?AUTO_1676 ?AUTO_1677 ) ) ( not ( = ?AUTO_1678 ?AUTO_1677 ) ) ( ON ?AUTO_1677 ?AUTO_1676 ) ( CLEAR ?AUTO_1677 ) ( HOLDING ?AUTO_1679 ) ( not ( = ?AUTO_1675 ?AUTO_1679 ) ) ( not ( = ?AUTO_1676 ?AUTO_1679 ) ) ( not ( = ?AUTO_1678 ?AUTO_1679 ) ) ( not ( = ?AUTO_1677 ?AUTO_1679 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1679 )
      ( MAKE-ON ?AUTO_1675 ?AUTO_1676 )
      ( MAKE-ON-VERIFY ?AUTO_1675 ?AUTO_1676 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1680 - BLOCK
      ?AUTO_1681 - BLOCK
    )
    :vars
    (
      ?AUTO_1683 - BLOCK
      ?AUTO_1682 - BLOCK
      ?AUTO_1684 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1680 ?AUTO_1681 ) ) ( ON ?AUTO_1680 ?AUTO_1683 ) ( not ( = ?AUTO_1680 ?AUTO_1683 ) ) ( not ( = ?AUTO_1681 ?AUTO_1683 ) ) ( ON ?AUTO_1681 ?AUTO_1680 ) ( not ( = ?AUTO_1680 ?AUTO_1682 ) ) ( not ( = ?AUTO_1681 ?AUTO_1682 ) ) ( not ( = ?AUTO_1683 ?AUTO_1682 ) ) ( ON ?AUTO_1682 ?AUTO_1681 ) ( not ( = ?AUTO_1680 ?AUTO_1684 ) ) ( not ( = ?AUTO_1681 ?AUTO_1684 ) ) ( not ( = ?AUTO_1683 ?AUTO_1684 ) ) ( not ( = ?AUTO_1682 ?AUTO_1684 ) ) ( ON ?AUTO_1684 ?AUTO_1682 ) ( CLEAR ?AUTO_1684 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1684 ?AUTO_1682 )
      ( MAKE-ON ?AUTO_1680 ?AUTO_1681 )
      ( MAKE-ON-VERIFY ?AUTO_1680 ?AUTO_1681 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1687 - BLOCK
      ?AUTO_1688 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1687 ) ( CLEAR ?AUTO_1688 ) ( not ( = ?AUTO_1687 ?AUTO_1688 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1687 ?AUTO_1688 )
      ( MAKE-ON-VERIFY ?AUTO_1687 ?AUTO_1688 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1689 - BLOCK
      ?AUTO_1690 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1690 ) ( not ( = ?AUTO_1689 ?AUTO_1690 ) ) ( ON-TABLE ?AUTO_1689 ) ( CLEAR ?AUTO_1689 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_1689 )
      ( MAKE-ON ?AUTO_1689 ?AUTO_1690 )
      ( MAKE-ON-VERIFY ?AUTO_1689 ?AUTO_1690 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1691 - BLOCK
      ?AUTO_1692 - BLOCK
    )
    :vars
    (
      ?AUTO_1693 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1691 ?AUTO_1692 ) ) ( ON-TABLE ?AUTO_1691 ) ( CLEAR ?AUTO_1691 ) ( HOLDING ?AUTO_1692 ) ( CLEAR ?AUTO_1693 ) ( not ( = ?AUTO_1691 ?AUTO_1693 ) ) ( not ( = ?AUTO_1692 ?AUTO_1693 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1692 ?AUTO_1693 )
      ( MAKE-ON ?AUTO_1691 ?AUTO_1692 )
      ( MAKE-ON-VERIFY ?AUTO_1691 ?AUTO_1692 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1696 - BLOCK
      ?AUTO_1697 - BLOCK
    )
    :vars
    (
      ?AUTO_1698 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1697 ) ( not ( = ?AUTO_1696 ?AUTO_1697 ) ) ( ON-TABLE ?AUTO_1696 ) ( CLEAR ?AUTO_1696 ) ( HOLDING ?AUTO_1698 ) ( not ( = ?AUTO_1696 ?AUTO_1698 ) ) ( not ( = ?AUTO_1697 ?AUTO_1698 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1698 )
      ( MAKE-ON ?AUTO_1696 ?AUTO_1697 )
      ( MAKE-ON-VERIFY ?AUTO_1696 ?AUTO_1697 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1699 - BLOCK
      ?AUTO_1700 - BLOCK
    )
    :vars
    (
      ?AUTO_1701 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1699 ?AUTO_1700 ) ) ( ON-TABLE ?AUTO_1699 ) ( CLEAR ?AUTO_1699 ) ( not ( = ?AUTO_1699 ?AUTO_1701 ) ) ( not ( = ?AUTO_1700 ?AUTO_1701 ) ) ( ON ?AUTO_1701 ?AUTO_1700 ) ( CLEAR ?AUTO_1701 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1701 ?AUTO_1700 )
      ( MAKE-ON ?AUTO_1699 ?AUTO_1700 )
      ( MAKE-ON-VERIFY ?AUTO_1699 ?AUTO_1700 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1702 - BLOCK
      ?AUTO_1703 - BLOCK
    )
    :vars
    (
      ?AUTO_1704 - BLOCK
      ?AUTO_1705 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1702 ?AUTO_1703 ) ) ( ON-TABLE ?AUTO_1702 ) ( CLEAR ?AUTO_1702 ) ( not ( = ?AUTO_1702 ?AUTO_1704 ) ) ( not ( = ?AUTO_1703 ?AUTO_1704 ) ) ( ON ?AUTO_1704 ?AUTO_1703 ) ( CLEAR ?AUTO_1704 ) ( HOLDING ?AUTO_1705 ) ( not ( = ?AUTO_1702 ?AUTO_1705 ) ) ( not ( = ?AUTO_1703 ?AUTO_1705 ) ) ( not ( = ?AUTO_1704 ?AUTO_1705 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1705 )
      ( MAKE-ON ?AUTO_1702 ?AUTO_1703 )
      ( MAKE-ON-VERIFY ?AUTO_1702 ?AUTO_1703 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1706 - BLOCK
      ?AUTO_1707 - BLOCK
    )
    :vars
    (
      ?AUTO_1708 - BLOCK
      ?AUTO_1709 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1706 ?AUTO_1707 ) ) ( ON-TABLE ?AUTO_1706 ) ( CLEAR ?AUTO_1706 ) ( not ( = ?AUTO_1706 ?AUTO_1708 ) ) ( not ( = ?AUTO_1707 ?AUTO_1708 ) ) ( ON ?AUTO_1708 ?AUTO_1707 ) ( not ( = ?AUTO_1706 ?AUTO_1709 ) ) ( not ( = ?AUTO_1707 ?AUTO_1709 ) ) ( not ( = ?AUTO_1708 ?AUTO_1709 ) ) ( ON ?AUTO_1709 ?AUTO_1708 ) ( CLEAR ?AUTO_1709 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1709 ?AUTO_1708 )
      ( MAKE-ON ?AUTO_1706 ?AUTO_1707 )
      ( MAKE-ON-VERIFY ?AUTO_1706 ?AUTO_1707 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1710 - BLOCK
      ?AUTO_1711 - BLOCK
    )
    :vars
    (
      ?AUTO_1713 - BLOCK
      ?AUTO_1712 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1710 ?AUTO_1711 ) ) ( not ( = ?AUTO_1710 ?AUTO_1713 ) ) ( not ( = ?AUTO_1711 ?AUTO_1713 ) ) ( ON ?AUTO_1713 ?AUTO_1711 ) ( not ( = ?AUTO_1710 ?AUTO_1712 ) ) ( not ( = ?AUTO_1711 ?AUTO_1712 ) ) ( not ( = ?AUTO_1713 ?AUTO_1712 ) ) ( ON ?AUTO_1712 ?AUTO_1713 ) ( CLEAR ?AUTO_1712 ) ( HOLDING ?AUTO_1710 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1710 )
      ( MAKE-ON ?AUTO_1710 ?AUTO_1711 )
      ( MAKE-ON-VERIFY ?AUTO_1710 ?AUTO_1711 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1714 - BLOCK
      ?AUTO_1715 - BLOCK
    )
    :vars
    (
      ?AUTO_1717 - BLOCK
      ?AUTO_1716 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1714 ?AUTO_1715 ) ) ( not ( = ?AUTO_1714 ?AUTO_1717 ) ) ( not ( = ?AUTO_1715 ?AUTO_1717 ) ) ( ON ?AUTO_1717 ?AUTO_1715 ) ( not ( = ?AUTO_1714 ?AUTO_1716 ) ) ( not ( = ?AUTO_1715 ?AUTO_1716 ) ) ( not ( = ?AUTO_1717 ?AUTO_1716 ) ) ( ON ?AUTO_1716 ?AUTO_1717 ) ( ON ?AUTO_1714 ?AUTO_1716 ) ( CLEAR ?AUTO_1714 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1714 ?AUTO_1716 )
      ( MAKE-ON ?AUTO_1714 ?AUTO_1715 )
      ( MAKE-ON-VERIFY ?AUTO_1714 ?AUTO_1715 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1720 - BLOCK
      ?AUTO_1721 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1720 ) ( CLEAR ?AUTO_1721 ) ( not ( = ?AUTO_1720 ?AUTO_1721 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1720 ?AUTO_1721 )
      ( MAKE-ON-VERIFY ?AUTO_1720 ?AUTO_1721 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1722 - BLOCK
      ?AUTO_1723 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1723 ) ( not ( = ?AUTO_1722 ?AUTO_1723 ) ) ( ON-TABLE ?AUTO_1722 ) ( CLEAR ?AUTO_1722 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_1722 )
      ( MAKE-ON ?AUTO_1722 ?AUTO_1723 )
      ( MAKE-ON-VERIFY ?AUTO_1722 ?AUTO_1723 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1724 - BLOCK
      ?AUTO_1725 - BLOCK
    )
    :vars
    (
      ?AUTO_1726 - BLOCK
      ?AUTO_1727 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1725 ) ( not ( = ?AUTO_1724 ?AUTO_1725 ) ) ( ON-TABLE ?AUTO_1724 ) ( CLEAR ?AUTO_1724 ) ( HOLDING ?AUTO_1726 ) ( CLEAR ?AUTO_1727 ) ( not ( = ?AUTO_1724 ?AUTO_1726 ) ) ( not ( = ?AUTO_1724 ?AUTO_1727 ) ) ( not ( = ?AUTO_1725 ?AUTO_1726 ) ) ( not ( = ?AUTO_1725 ?AUTO_1727 ) ) ( not ( = ?AUTO_1726 ?AUTO_1727 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1726 ?AUTO_1727 )
      ( MAKE-ON ?AUTO_1724 ?AUTO_1725 )
      ( MAKE-ON-VERIFY ?AUTO_1724 ?AUTO_1725 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1748 - BLOCK
      ?AUTO_1749 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1748 ) ( CLEAR ?AUTO_1749 ) ( not ( = ?AUTO_1748 ?AUTO_1749 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1748 ?AUTO_1749 )
      ( MAKE-ON-VERIFY ?AUTO_1748 ?AUTO_1749 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1750 - BLOCK
      ?AUTO_1751 - BLOCK
    )
    :vars
    (
      ?AUTO_1752 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1751 ) ( not ( = ?AUTO_1750 ?AUTO_1751 ) ) ( ON ?AUTO_1750 ?AUTO_1752 ) ( CLEAR ?AUTO_1750 ) ( HAND-EMPTY ) ( not ( = ?AUTO_1750 ?AUTO_1752 ) ) ( not ( = ?AUTO_1751 ?AUTO_1752 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1750 ?AUTO_1752 )
      ( MAKE-ON ?AUTO_1750 ?AUTO_1751 )
      ( MAKE-ON-VERIFY ?AUTO_1750 ?AUTO_1751 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1753 - BLOCK
      ?AUTO_1754 - BLOCK
    )
    :vars
    (
      ?AUTO_1755 - BLOCK
      ?AUTO_1756 - BLOCK
      ?AUTO_1757 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1754 ) ( not ( = ?AUTO_1753 ?AUTO_1754 ) ) ( ON ?AUTO_1753 ?AUTO_1755 ) ( CLEAR ?AUTO_1753 ) ( not ( = ?AUTO_1753 ?AUTO_1755 ) ) ( not ( = ?AUTO_1754 ?AUTO_1755 ) ) ( HOLDING ?AUTO_1756 ) ( CLEAR ?AUTO_1757 ) ( not ( = ?AUTO_1753 ?AUTO_1756 ) ) ( not ( = ?AUTO_1753 ?AUTO_1757 ) ) ( not ( = ?AUTO_1754 ?AUTO_1756 ) ) ( not ( = ?AUTO_1754 ?AUTO_1757 ) ) ( not ( = ?AUTO_1755 ?AUTO_1756 ) ) ( not ( = ?AUTO_1755 ?AUTO_1757 ) ) ( not ( = ?AUTO_1756 ?AUTO_1757 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1756 ?AUTO_1757 )
      ( MAKE-ON ?AUTO_1753 ?AUTO_1754 )
      ( MAKE-ON-VERIFY ?AUTO_1753 ?AUTO_1754 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1766 - BLOCK
      ?AUTO_1767 - BLOCK
    )
    :vars
    (
      ?AUTO_1768 - BLOCK
      ?AUTO_1769 - BLOCK
      ?AUTO_1770 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1766 ?AUTO_1767 ) ) ( ON ?AUTO_1766 ?AUTO_1768 ) ( CLEAR ?AUTO_1766 ) ( not ( = ?AUTO_1766 ?AUTO_1768 ) ) ( not ( = ?AUTO_1767 ?AUTO_1768 ) ) ( CLEAR ?AUTO_1769 ) ( not ( = ?AUTO_1766 ?AUTO_1770 ) ) ( not ( = ?AUTO_1766 ?AUTO_1769 ) ) ( not ( = ?AUTO_1767 ?AUTO_1770 ) ) ( not ( = ?AUTO_1767 ?AUTO_1769 ) ) ( not ( = ?AUTO_1768 ?AUTO_1770 ) ) ( not ( = ?AUTO_1768 ?AUTO_1769 ) ) ( not ( = ?AUTO_1770 ?AUTO_1769 ) ) ( ON ?AUTO_1770 ?AUTO_1767 ) ( CLEAR ?AUTO_1770 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1770 ?AUTO_1767 )
      ( MAKE-ON ?AUTO_1766 ?AUTO_1767 )
      ( MAKE-ON-VERIFY ?AUTO_1766 ?AUTO_1767 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1771 - BLOCK
      ?AUTO_1772 - BLOCK
    )
    :vars
    (
      ?AUTO_1774 - BLOCK
      ?AUTO_1773 - BLOCK
      ?AUTO_1775 - BLOCK
      ?AUTO_1776 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1771 ?AUTO_1772 ) ) ( ON ?AUTO_1771 ?AUTO_1774 ) ( CLEAR ?AUTO_1771 ) ( not ( = ?AUTO_1771 ?AUTO_1774 ) ) ( not ( = ?AUTO_1772 ?AUTO_1774 ) ) ( CLEAR ?AUTO_1773 ) ( not ( = ?AUTO_1771 ?AUTO_1775 ) ) ( not ( = ?AUTO_1771 ?AUTO_1773 ) ) ( not ( = ?AUTO_1772 ?AUTO_1775 ) ) ( not ( = ?AUTO_1772 ?AUTO_1773 ) ) ( not ( = ?AUTO_1774 ?AUTO_1775 ) ) ( not ( = ?AUTO_1774 ?AUTO_1773 ) ) ( not ( = ?AUTO_1775 ?AUTO_1773 ) ) ( ON ?AUTO_1775 ?AUTO_1772 ) ( CLEAR ?AUTO_1775 ) ( HOLDING ?AUTO_1776 ) ( not ( = ?AUTO_1771 ?AUTO_1776 ) ) ( not ( = ?AUTO_1772 ?AUTO_1776 ) ) ( not ( = ?AUTO_1774 ?AUTO_1776 ) ) ( not ( = ?AUTO_1773 ?AUTO_1776 ) ) ( not ( = ?AUTO_1775 ?AUTO_1776 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1776 )
      ( MAKE-ON ?AUTO_1771 ?AUTO_1772 )
      ( MAKE-ON-VERIFY ?AUTO_1771 ?AUTO_1772 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1777 - BLOCK
      ?AUTO_1778 - BLOCK
    )
    :vars
    (
      ?AUTO_1779 - BLOCK
      ?AUTO_1780 - BLOCK
      ?AUTO_1781 - BLOCK
      ?AUTO_1782 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1777 ?AUTO_1778 ) ) ( ON ?AUTO_1777 ?AUTO_1779 ) ( CLEAR ?AUTO_1777 ) ( not ( = ?AUTO_1777 ?AUTO_1779 ) ) ( not ( = ?AUTO_1778 ?AUTO_1779 ) ) ( CLEAR ?AUTO_1780 ) ( not ( = ?AUTO_1777 ?AUTO_1781 ) ) ( not ( = ?AUTO_1777 ?AUTO_1780 ) ) ( not ( = ?AUTO_1778 ?AUTO_1781 ) ) ( not ( = ?AUTO_1778 ?AUTO_1780 ) ) ( not ( = ?AUTO_1779 ?AUTO_1781 ) ) ( not ( = ?AUTO_1779 ?AUTO_1780 ) ) ( not ( = ?AUTO_1781 ?AUTO_1780 ) ) ( ON ?AUTO_1781 ?AUTO_1778 ) ( not ( = ?AUTO_1777 ?AUTO_1782 ) ) ( not ( = ?AUTO_1778 ?AUTO_1782 ) ) ( not ( = ?AUTO_1779 ?AUTO_1782 ) ) ( not ( = ?AUTO_1780 ?AUTO_1782 ) ) ( not ( = ?AUTO_1781 ?AUTO_1782 ) ) ( ON ?AUTO_1782 ?AUTO_1781 ) ( CLEAR ?AUTO_1782 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1782 ?AUTO_1781 )
      ( MAKE-ON ?AUTO_1777 ?AUTO_1778 )
      ( MAKE-ON-VERIFY ?AUTO_1777 ?AUTO_1778 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1783 - BLOCK
      ?AUTO_1784 - BLOCK
    )
    :vars
    (
      ?AUTO_1786 - BLOCK
      ?AUTO_1787 - BLOCK
      ?AUTO_1785 - BLOCK
      ?AUTO_1788 - BLOCK
      ?AUTO_1789 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1783 ?AUTO_1784 ) ) ( ON ?AUTO_1783 ?AUTO_1786 ) ( CLEAR ?AUTO_1783 ) ( not ( = ?AUTO_1783 ?AUTO_1786 ) ) ( not ( = ?AUTO_1784 ?AUTO_1786 ) ) ( CLEAR ?AUTO_1787 ) ( not ( = ?AUTO_1783 ?AUTO_1785 ) ) ( not ( = ?AUTO_1783 ?AUTO_1787 ) ) ( not ( = ?AUTO_1784 ?AUTO_1785 ) ) ( not ( = ?AUTO_1784 ?AUTO_1787 ) ) ( not ( = ?AUTO_1786 ?AUTO_1785 ) ) ( not ( = ?AUTO_1786 ?AUTO_1787 ) ) ( not ( = ?AUTO_1785 ?AUTO_1787 ) ) ( ON ?AUTO_1785 ?AUTO_1784 ) ( not ( = ?AUTO_1783 ?AUTO_1788 ) ) ( not ( = ?AUTO_1784 ?AUTO_1788 ) ) ( not ( = ?AUTO_1786 ?AUTO_1788 ) ) ( not ( = ?AUTO_1787 ?AUTO_1788 ) ) ( not ( = ?AUTO_1785 ?AUTO_1788 ) ) ( ON ?AUTO_1788 ?AUTO_1785 ) ( CLEAR ?AUTO_1788 ) ( HOLDING ?AUTO_1789 ) ( not ( = ?AUTO_1783 ?AUTO_1789 ) ) ( not ( = ?AUTO_1784 ?AUTO_1789 ) ) ( not ( = ?AUTO_1786 ?AUTO_1789 ) ) ( not ( = ?AUTO_1787 ?AUTO_1789 ) ) ( not ( = ?AUTO_1785 ?AUTO_1789 ) ) ( not ( = ?AUTO_1788 ?AUTO_1789 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1789 )
      ( MAKE-ON ?AUTO_1783 ?AUTO_1784 )
      ( MAKE-ON-VERIFY ?AUTO_1783 ?AUTO_1784 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1790 - BLOCK
      ?AUTO_1791 - BLOCK
    )
    :vars
    (
      ?AUTO_1793 - BLOCK
      ?AUTO_1796 - BLOCK
      ?AUTO_1792 - BLOCK
      ?AUTO_1795 - BLOCK
      ?AUTO_1794 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1790 ?AUTO_1791 ) ) ( ON ?AUTO_1790 ?AUTO_1793 ) ( CLEAR ?AUTO_1790 ) ( not ( = ?AUTO_1790 ?AUTO_1793 ) ) ( not ( = ?AUTO_1791 ?AUTO_1793 ) ) ( CLEAR ?AUTO_1796 ) ( not ( = ?AUTO_1790 ?AUTO_1792 ) ) ( not ( = ?AUTO_1790 ?AUTO_1796 ) ) ( not ( = ?AUTO_1791 ?AUTO_1792 ) ) ( not ( = ?AUTO_1791 ?AUTO_1796 ) ) ( not ( = ?AUTO_1793 ?AUTO_1792 ) ) ( not ( = ?AUTO_1793 ?AUTO_1796 ) ) ( not ( = ?AUTO_1792 ?AUTO_1796 ) ) ( ON ?AUTO_1792 ?AUTO_1791 ) ( not ( = ?AUTO_1790 ?AUTO_1795 ) ) ( not ( = ?AUTO_1791 ?AUTO_1795 ) ) ( not ( = ?AUTO_1793 ?AUTO_1795 ) ) ( not ( = ?AUTO_1796 ?AUTO_1795 ) ) ( not ( = ?AUTO_1792 ?AUTO_1795 ) ) ( ON ?AUTO_1795 ?AUTO_1792 ) ( not ( = ?AUTO_1790 ?AUTO_1794 ) ) ( not ( = ?AUTO_1791 ?AUTO_1794 ) ) ( not ( = ?AUTO_1793 ?AUTO_1794 ) ) ( not ( = ?AUTO_1796 ?AUTO_1794 ) ) ( not ( = ?AUTO_1792 ?AUTO_1794 ) ) ( not ( = ?AUTO_1795 ?AUTO_1794 ) ) ( ON ?AUTO_1794 ?AUTO_1795 ) ( CLEAR ?AUTO_1794 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1794 ?AUTO_1795 )
      ( MAKE-ON ?AUTO_1790 ?AUTO_1791 )
      ( MAKE-ON-VERIFY ?AUTO_1790 ?AUTO_1791 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1797 - BLOCK
      ?AUTO_1798 - BLOCK
    )
    :vars
    (
      ?AUTO_1799 - BLOCK
      ?AUTO_1802 - BLOCK
      ?AUTO_1800 - BLOCK
      ?AUTO_1803 - BLOCK
      ?AUTO_1801 - BLOCK
      ?AUTO_1804 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1797 ?AUTO_1798 ) ) ( ON ?AUTO_1797 ?AUTO_1799 ) ( CLEAR ?AUTO_1797 ) ( not ( = ?AUTO_1797 ?AUTO_1799 ) ) ( not ( = ?AUTO_1798 ?AUTO_1799 ) ) ( CLEAR ?AUTO_1802 ) ( not ( = ?AUTO_1797 ?AUTO_1800 ) ) ( not ( = ?AUTO_1797 ?AUTO_1802 ) ) ( not ( = ?AUTO_1798 ?AUTO_1800 ) ) ( not ( = ?AUTO_1798 ?AUTO_1802 ) ) ( not ( = ?AUTO_1799 ?AUTO_1800 ) ) ( not ( = ?AUTO_1799 ?AUTO_1802 ) ) ( not ( = ?AUTO_1800 ?AUTO_1802 ) ) ( ON ?AUTO_1800 ?AUTO_1798 ) ( not ( = ?AUTO_1797 ?AUTO_1803 ) ) ( not ( = ?AUTO_1798 ?AUTO_1803 ) ) ( not ( = ?AUTO_1799 ?AUTO_1803 ) ) ( not ( = ?AUTO_1802 ?AUTO_1803 ) ) ( not ( = ?AUTO_1800 ?AUTO_1803 ) ) ( ON ?AUTO_1803 ?AUTO_1800 ) ( not ( = ?AUTO_1797 ?AUTO_1801 ) ) ( not ( = ?AUTO_1798 ?AUTO_1801 ) ) ( not ( = ?AUTO_1799 ?AUTO_1801 ) ) ( not ( = ?AUTO_1802 ?AUTO_1801 ) ) ( not ( = ?AUTO_1800 ?AUTO_1801 ) ) ( not ( = ?AUTO_1803 ?AUTO_1801 ) ) ( ON ?AUTO_1801 ?AUTO_1803 ) ( CLEAR ?AUTO_1801 ) ( HOLDING ?AUTO_1804 ) ( not ( = ?AUTO_1797 ?AUTO_1804 ) ) ( not ( = ?AUTO_1798 ?AUTO_1804 ) ) ( not ( = ?AUTO_1799 ?AUTO_1804 ) ) ( not ( = ?AUTO_1802 ?AUTO_1804 ) ) ( not ( = ?AUTO_1800 ?AUTO_1804 ) ) ( not ( = ?AUTO_1803 ?AUTO_1804 ) ) ( not ( = ?AUTO_1801 ?AUTO_1804 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1804 )
      ( MAKE-ON ?AUTO_1797 ?AUTO_1798 )
      ( MAKE-ON-VERIFY ?AUTO_1797 ?AUTO_1798 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1805 - BLOCK
      ?AUTO_1806 - BLOCK
    )
    :vars
    (
      ?AUTO_1809 - BLOCK
      ?AUTO_1812 - BLOCK
      ?AUTO_1808 - BLOCK
      ?AUTO_1807 - BLOCK
      ?AUTO_1810 - BLOCK
      ?AUTO_1811 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1805 ?AUTO_1806 ) ) ( ON ?AUTO_1805 ?AUTO_1809 ) ( CLEAR ?AUTO_1805 ) ( not ( = ?AUTO_1805 ?AUTO_1809 ) ) ( not ( = ?AUTO_1806 ?AUTO_1809 ) ) ( CLEAR ?AUTO_1812 ) ( not ( = ?AUTO_1805 ?AUTO_1808 ) ) ( not ( = ?AUTO_1805 ?AUTO_1812 ) ) ( not ( = ?AUTO_1806 ?AUTO_1808 ) ) ( not ( = ?AUTO_1806 ?AUTO_1812 ) ) ( not ( = ?AUTO_1809 ?AUTO_1808 ) ) ( not ( = ?AUTO_1809 ?AUTO_1812 ) ) ( not ( = ?AUTO_1808 ?AUTO_1812 ) ) ( ON ?AUTO_1808 ?AUTO_1806 ) ( not ( = ?AUTO_1805 ?AUTO_1807 ) ) ( not ( = ?AUTO_1806 ?AUTO_1807 ) ) ( not ( = ?AUTO_1809 ?AUTO_1807 ) ) ( not ( = ?AUTO_1812 ?AUTO_1807 ) ) ( not ( = ?AUTO_1808 ?AUTO_1807 ) ) ( ON ?AUTO_1807 ?AUTO_1808 ) ( not ( = ?AUTO_1805 ?AUTO_1810 ) ) ( not ( = ?AUTO_1806 ?AUTO_1810 ) ) ( not ( = ?AUTO_1809 ?AUTO_1810 ) ) ( not ( = ?AUTO_1812 ?AUTO_1810 ) ) ( not ( = ?AUTO_1808 ?AUTO_1810 ) ) ( not ( = ?AUTO_1807 ?AUTO_1810 ) ) ( ON ?AUTO_1810 ?AUTO_1807 ) ( not ( = ?AUTO_1805 ?AUTO_1811 ) ) ( not ( = ?AUTO_1806 ?AUTO_1811 ) ) ( not ( = ?AUTO_1809 ?AUTO_1811 ) ) ( not ( = ?AUTO_1812 ?AUTO_1811 ) ) ( not ( = ?AUTO_1808 ?AUTO_1811 ) ) ( not ( = ?AUTO_1807 ?AUTO_1811 ) ) ( not ( = ?AUTO_1810 ?AUTO_1811 ) ) ( ON ?AUTO_1811 ?AUTO_1810 ) ( CLEAR ?AUTO_1811 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1811 ?AUTO_1810 )
      ( MAKE-ON ?AUTO_1805 ?AUTO_1806 )
      ( MAKE-ON-VERIFY ?AUTO_1805 ?AUTO_1806 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1814 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1814 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1814 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1814 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1815 - BLOCK
    )
    :vars
    (
      ?AUTO_1816 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1815 ?AUTO_1816 ) ( CLEAR ?AUTO_1815 ) ( HAND-EMPTY ) ( not ( = ?AUTO_1815 ?AUTO_1816 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1815 ?AUTO_1816 )
      ( MAKE-ON-TABLE ?AUTO_1815 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1815 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1817 - BLOCK
    )
    :vars
    (
      ?AUTO_1818 - BLOCK
      ?AUTO_1819 - BLOCK
      ?AUTO_1820 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1817 ?AUTO_1818 ) ( CLEAR ?AUTO_1817 ) ( not ( = ?AUTO_1817 ?AUTO_1818 ) ) ( HOLDING ?AUTO_1819 ) ( CLEAR ?AUTO_1820 ) ( not ( = ?AUTO_1817 ?AUTO_1819 ) ) ( not ( = ?AUTO_1817 ?AUTO_1820 ) ) ( not ( = ?AUTO_1818 ?AUTO_1819 ) ) ( not ( = ?AUTO_1818 ?AUTO_1820 ) ) ( not ( = ?AUTO_1819 ?AUTO_1820 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1819 ?AUTO_1820 )
      ( MAKE-ON-TABLE ?AUTO_1817 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1817 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1821 - BLOCK
    )
    :vars
    (
      ?AUTO_1822 - BLOCK
      ?AUTO_1824 - BLOCK
      ?AUTO_1823 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1821 ?AUTO_1822 ) ( not ( = ?AUTO_1821 ?AUTO_1822 ) ) ( CLEAR ?AUTO_1824 ) ( not ( = ?AUTO_1821 ?AUTO_1823 ) ) ( not ( = ?AUTO_1821 ?AUTO_1824 ) ) ( not ( = ?AUTO_1822 ?AUTO_1823 ) ) ( not ( = ?AUTO_1822 ?AUTO_1824 ) ) ( not ( = ?AUTO_1823 ?AUTO_1824 ) ) ( ON ?AUTO_1823 ?AUTO_1821 ) ( CLEAR ?AUTO_1823 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1823 ?AUTO_1821 )
      ( MAKE-ON-TABLE ?AUTO_1821 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1821 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1825 - BLOCK
    )
    :vars
    (
      ?AUTO_1826 - BLOCK
      ?AUTO_1828 - BLOCK
      ?AUTO_1827 - BLOCK
      ?AUTO_1829 - BLOCK
      ?AUTO_1830 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1825 ?AUTO_1826 ) ( not ( = ?AUTO_1825 ?AUTO_1826 ) ) ( CLEAR ?AUTO_1828 ) ( not ( = ?AUTO_1825 ?AUTO_1827 ) ) ( not ( = ?AUTO_1825 ?AUTO_1828 ) ) ( not ( = ?AUTO_1826 ?AUTO_1827 ) ) ( not ( = ?AUTO_1826 ?AUTO_1828 ) ) ( not ( = ?AUTO_1827 ?AUTO_1828 ) ) ( ON ?AUTO_1827 ?AUTO_1825 ) ( CLEAR ?AUTO_1827 ) ( HOLDING ?AUTO_1829 ) ( CLEAR ?AUTO_1830 ) ( not ( = ?AUTO_1825 ?AUTO_1829 ) ) ( not ( = ?AUTO_1825 ?AUTO_1830 ) ) ( not ( = ?AUTO_1826 ?AUTO_1829 ) ) ( not ( = ?AUTO_1826 ?AUTO_1830 ) ) ( not ( = ?AUTO_1828 ?AUTO_1829 ) ) ( not ( = ?AUTO_1828 ?AUTO_1830 ) ) ( not ( = ?AUTO_1827 ?AUTO_1829 ) ) ( not ( = ?AUTO_1827 ?AUTO_1830 ) ) ( not ( = ?AUTO_1829 ?AUTO_1830 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1829 ?AUTO_1830 )
      ( MAKE-ON-TABLE ?AUTO_1825 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1825 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1843 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1843 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1843 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1843 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1844 - BLOCK
    )
    :vars
    (
      ?AUTO_1845 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1844 ?AUTO_1845 ) ( CLEAR ?AUTO_1844 ) ( HAND-EMPTY ) ( not ( = ?AUTO_1844 ?AUTO_1845 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1844 ?AUTO_1845 )
      ( MAKE-ON-TABLE ?AUTO_1844 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1844 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1846 - BLOCK
    )
    :vars
    (
      ?AUTO_1847 - BLOCK
      ?AUTO_1848 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1846 ?AUTO_1847 ) ( CLEAR ?AUTO_1846 ) ( not ( = ?AUTO_1846 ?AUTO_1847 ) ) ( HOLDING ?AUTO_1848 ) ( not ( = ?AUTO_1846 ?AUTO_1848 ) ) ( not ( = ?AUTO_1847 ?AUTO_1848 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1848 )
      ( MAKE-ON-TABLE ?AUTO_1846 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1846 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1849 - BLOCK
    )
    :vars
    (
      ?AUTO_1850 - BLOCK
      ?AUTO_1851 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1849 ?AUTO_1850 ) ( not ( = ?AUTO_1849 ?AUTO_1850 ) ) ( not ( = ?AUTO_1849 ?AUTO_1851 ) ) ( not ( = ?AUTO_1850 ?AUTO_1851 ) ) ( ON ?AUTO_1851 ?AUTO_1849 ) ( CLEAR ?AUTO_1851 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1851 ?AUTO_1849 )
      ( MAKE-ON-TABLE ?AUTO_1849 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1849 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1852 - BLOCK
    )
    :vars
    (
      ?AUTO_1853 - BLOCK
      ?AUTO_1854 - BLOCK
      ?AUTO_1855 - BLOCK
      ?AUTO_1856 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1852 ?AUTO_1853 ) ( not ( = ?AUTO_1852 ?AUTO_1853 ) ) ( not ( = ?AUTO_1852 ?AUTO_1854 ) ) ( not ( = ?AUTO_1853 ?AUTO_1854 ) ) ( ON ?AUTO_1854 ?AUTO_1852 ) ( CLEAR ?AUTO_1854 ) ( HOLDING ?AUTO_1855 ) ( CLEAR ?AUTO_1856 ) ( not ( = ?AUTO_1852 ?AUTO_1855 ) ) ( not ( = ?AUTO_1852 ?AUTO_1856 ) ) ( not ( = ?AUTO_1853 ?AUTO_1855 ) ) ( not ( = ?AUTO_1853 ?AUTO_1856 ) ) ( not ( = ?AUTO_1854 ?AUTO_1855 ) ) ( not ( = ?AUTO_1854 ?AUTO_1856 ) ) ( not ( = ?AUTO_1855 ?AUTO_1856 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1855 ?AUTO_1856 )
      ( MAKE-ON-TABLE ?AUTO_1852 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1852 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1857 - BLOCK
    )
    :vars
    (
      ?AUTO_1858 - BLOCK
      ?AUTO_1859 - BLOCK
      ?AUTO_1860 - BLOCK
      ?AUTO_1861 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1857 ?AUTO_1858 ) ( not ( = ?AUTO_1857 ?AUTO_1858 ) ) ( not ( = ?AUTO_1857 ?AUTO_1859 ) ) ( not ( = ?AUTO_1858 ?AUTO_1859 ) ) ( ON ?AUTO_1859 ?AUTO_1857 ) ( CLEAR ?AUTO_1860 ) ( not ( = ?AUTO_1857 ?AUTO_1861 ) ) ( not ( = ?AUTO_1857 ?AUTO_1860 ) ) ( not ( = ?AUTO_1858 ?AUTO_1861 ) ) ( not ( = ?AUTO_1858 ?AUTO_1860 ) ) ( not ( = ?AUTO_1859 ?AUTO_1861 ) ) ( not ( = ?AUTO_1859 ?AUTO_1860 ) ) ( not ( = ?AUTO_1861 ?AUTO_1860 ) ) ( ON ?AUTO_1861 ?AUTO_1859 ) ( CLEAR ?AUTO_1861 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1861 ?AUTO_1859 )
      ( MAKE-ON-TABLE ?AUTO_1857 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1857 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1862 - BLOCK
    )
    :vars
    (
      ?AUTO_1866 - BLOCK
      ?AUTO_1863 - BLOCK
      ?AUTO_1864 - BLOCK
      ?AUTO_1865 - BLOCK
      ?AUTO_1867 - BLOCK
      ?AUTO_1868 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1862 ?AUTO_1866 ) ( not ( = ?AUTO_1862 ?AUTO_1866 ) ) ( not ( = ?AUTO_1862 ?AUTO_1863 ) ) ( not ( = ?AUTO_1866 ?AUTO_1863 ) ) ( ON ?AUTO_1863 ?AUTO_1862 ) ( CLEAR ?AUTO_1864 ) ( not ( = ?AUTO_1862 ?AUTO_1865 ) ) ( not ( = ?AUTO_1862 ?AUTO_1864 ) ) ( not ( = ?AUTO_1866 ?AUTO_1865 ) ) ( not ( = ?AUTO_1866 ?AUTO_1864 ) ) ( not ( = ?AUTO_1863 ?AUTO_1865 ) ) ( not ( = ?AUTO_1863 ?AUTO_1864 ) ) ( not ( = ?AUTO_1865 ?AUTO_1864 ) ) ( ON ?AUTO_1865 ?AUTO_1863 ) ( CLEAR ?AUTO_1865 ) ( HOLDING ?AUTO_1867 ) ( CLEAR ?AUTO_1868 ) ( not ( = ?AUTO_1862 ?AUTO_1867 ) ) ( not ( = ?AUTO_1862 ?AUTO_1868 ) ) ( not ( = ?AUTO_1866 ?AUTO_1867 ) ) ( not ( = ?AUTO_1866 ?AUTO_1868 ) ) ( not ( = ?AUTO_1863 ?AUTO_1867 ) ) ( not ( = ?AUTO_1863 ?AUTO_1868 ) ) ( not ( = ?AUTO_1864 ?AUTO_1867 ) ) ( not ( = ?AUTO_1864 ?AUTO_1868 ) ) ( not ( = ?AUTO_1865 ?AUTO_1867 ) ) ( not ( = ?AUTO_1865 ?AUTO_1868 ) ) ( not ( = ?AUTO_1867 ?AUTO_1868 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1867 ?AUTO_1868 )
      ( MAKE-ON-TABLE ?AUTO_1862 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1862 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1882 - BLOCK
      ?AUTO_1883 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1882 ) ( CLEAR ?AUTO_1883 ) ( not ( = ?AUTO_1882 ?AUTO_1883 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1882 ?AUTO_1883 )
      ( MAKE-ON-VERIFY ?AUTO_1882 ?AUTO_1883 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1884 - BLOCK
      ?AUTO_1885 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1885 ) ( not ( = ?AUTO_1884 ?AUTO_1885 ) ) ( ON-TABLE ?AUTO_1884 ) ( CLEAR ?AUTO_1884 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_1884 )
      ( MAKE-ON ?AUTO_1884 ?AUTO_1885 )
      ( MAKE-ON-VERIFY ?AUTO_1884 ?AUTO_1885 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1886 - BLOCK
      ?AUTO_1887 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1886 ?AUTO_1887 ) ) ( ON-TABLE ?AUTO_1886 ) ( CLEAR ?AUTO_1886 ) ( HOLDING ?AUTO_1887 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1887 )
      ( MAKE-ON ?AUTO_1886 ?AUTO_1887 )
      ( MAKE-ON-VERIFY ?AUTO_1886 ?AUTO_1887 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2004 - BLOCK
      ?AUTO_2005 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2004 ) ( CLEAR ?AUTO_2005 ) ( not ( = ?AUTO_2004 ?AUTO_2005 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2004 ?AUTO_2005 )
      ( MAKE-ON-VERIFY ?AUTO_2004 ?AUTO_2005 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2006 - BLOCK
      ?AUTO_2007 - BLOCK
    )
    :vars
    (
      ?AUTO_2008 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2007 ) ( not ( = ?AUTO_2006 ?AUTO_2007 ) ) ( ON ?AUTO_2006 ?AUTO_2008 ) ( CLEAR ?AUTO_2006 ) ( HAND-EMPTY ) ( not ( = ?AUTO_2006 ?AUTO_2008 ) ) ( not ( = ?AUTO_2007 ?AUTO_2008 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2006 ?AUTO_2008 )
      ( MAKE-ON ?AUTO_2006 ?AUTO_2007 )
      ( MAKE-ON-VERIFY ?AUTO_2006 ?AUTO_2007 ) )
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
    ( and ( not ( = ?AUTO_2009 ?AUTO_2010 ) ) ( ON ?AUTO_2009 ?AUTO_2011 ) ( CLEAR ?AUTO_2009 ) ( not ( = ?AUTO_2009 ?AUTO_2011 ) ) ( not ( = ?AUTO_2010 ?AUTO_2011 ) ) ( HOLDING ?AUTO_2010 ) ( CLEAR ?AUTO_2012 ) ( not ( = ?AUTO_2009 ?AUTO_2012 ) ) ( not ( = ?AUTO_2010 ?AUTO_2012 ) ) ( not ( = ?AUTO_2011 ?AUTO_2012 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2010 ?AUTO_2012 )
      ( MAKE-ON ?AUTO_2009 ?AUTO_2010 )
      ( MAKE-ON-VERIFY ?AUTO_2009 ?AUTO_2010 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2015 - BLOCK
      ?AUTO_2016 - BLOCK
    )
    :vars
    (
      ?AUTO_2017 - BLOCK
      ?AUTO_2018 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2016 ) ( not ( = ?AUTO_2015 ?AUTO_2016 ) ) ( ON ?AUTO_2015 ?AUTO_2017 ) ( CLEAR ?AUTO_2015 ) ( not ( = ?AUTO_2015 ?AUTO_2017 ) ) ( not ( = ?AUTO_2016 ?AUTO_2017 ) ) ( HOLDING ?AUTO_2018 ) ( not ( = ?AUTO_2015 ?AUTO_2018 ) ) ( not ( = ?AUTO_2016 ?AUTO_2018 ) ) ( not ( = ?AUTO_2017 ?AUTO_2018 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2018 )
      ( MAKE-ON ?AUTO_2015 ?AUTO_2016 )
      ( MAKE-ON-VERIFY ?AUTO_2015 ?AUTO_2016 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2114 - BLOCK
      ?AUTO_2115 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2114 ) ( CLEAR ?AUTO_2115 ) ( not ( = ?AUTO_2114 ?AUTO_2115 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2114 ?AUTO_2115 )
      ( MAKE-ON-VERIFY ?AUTO_2114 ?AUTO_2115 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2116 - BLOCK
      ?AUTO_2117 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2117 ) ( not ( = ?AUTO_2116 ?AUTO_2117 ) ) ( ON-TABLE ?AUTO_2116 ) ( CLEAR ?AUTO_2116 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_2116 )
      ( MAKE-ON ?AUTO_2116 ?AUTO_2117 )
      ( MAKE-ON-VERIFY ?AUTO_2116 ?AUTO_2117 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2118 - BLOCK
      ?AUTO_2119 - BLOCK
    )
    :vars
    (
      ?AUTO_2120 - BLOCK
      ?AUTO_2121 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2119 ) ( not ( = ?AUTO_2118 ?AUTO_2119 ) ) ( ON-TABLE ?AUTO_2118 ) ( CLEAR ?AUTO_2118 ) ( HOLDING ?AUTO_2120 ) ( CLEAR ?AUTO_2121 ) ( not ( = ?AUTO_2118 ?AUTO_2120 ) ) ( not ( = ?AUTO_2118 ?AUTO_2121 ) ) ( not ( = ?AUTO_2119 ?AUTO_2120 ) ) ( not ( = ?AUTO_2119 ?AUTO_2121 ) ) ( not ( = ?AUTO_2120 ?AUTO_2121 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2120 ?AUTO_2121 )
      ( MAKE-ON ?AUTO_2118 ?AUTO_2119 )
      ( MAKE-ON-VERIFY ?AUTO_2118 ?AUTO_2119 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2122 - BLOCK
      ?AUTO_2123 - BLOCK
    )
    :vars
    (
      ?AUTO_2124 - BLOCK
      ?AUTO_2125 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2123 ) ( not ( = ?AUTO_2122 ?AUTO_2123 ) ) ( ON-TABLE ?AUTO_2122 ) ( CLEAR ?AUTO_2124 ) ( not ( = ?AUTO_2122 ?AUTO_2125 ) ) ( not ( = ?AUTO_2122 ?AUTO_2124 ) ) ( not ( = ?AUTO_2123 ?AUTO_2125 ) ) ( not ( = ?AUTO_2123 ?AUTO_2124 ) ) ( not ( = ?AUTO_2125 ?AUTO_2124 ) ) ( ON ?AUTO_2125 ?AUTO_2122 ) ( CLEAR ?AUTO_2125 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2125 ?AUTO_2122 )
      ( MAKE-ON ?AUTO_2122 ?AUTO_2123 )
      ( MAKE-ON-VERIFY ?AUTO_2122 ?AUTO_2123 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2126 - BLOCK
      ?AUTO_2127 - BLOCK
    )
    :vars
    (
      ?AUTO_2128 - BLOCK
      ?AUTO_2129 - BLOCK
      ?AUTO_2130 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2127 ) ( not ( = ?AUTO_2126 ?AUTO_2127 ) ) ( ON-TABLE ?AUTO_2126 ) ( not ( = ?AUTO_2126 ?AUTO_2128 ) ) ( not ( = ?AUTO_2126 ?AUTO_2129 ) ) ( not ( = ?AUTO_2127 ?AUTO_2128 ) ) ( not ( = ?AUTO_2127 ?AUTO_2129 ) ) ( not ( = ?AUTO_2128 ?AUTO_2129 ) ) ( ON ?AUTO_2128 ?AUTO_2126 ) ( CLEAR ?AUTO_2128 ) ( HOLDING ?AUTO_2129 ) ( CLEAR ?AUTO_2130 ) ( not ( = ?AUTO_2126 ?AUTO_2130 ) ) ( not ( = ?AUTO_2127 ?AUTO_2130 ) ) ( not ( = ?AUTO_2128 ?AUTO_2130 ) ) ( not ( = ?AUTO_2129 ?AUTO_2130 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2129 ?AUTO_2130 )
      ( MAKE-ON ?AUTO_2126 ?AUTO_2127 )
      ( MAKE-ON-VERIFY ?AUTO_2126 ?AUTO_2127 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2135 - BLOCK
      ?AUTO_2136 - BLOCK
    )
    :vars
    (
      ?AUTO_2139 - BLOCK
      ?AUTO_2138 - BLOCK
      ?AUTO_2137 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2135 ?AUTO_2136 ) ) ( ON-TABLE ?AUTO_2135 ) ( not ( = ?AUTO_2135 ?AUTO_2139 ) ) ( not ( = ?AUTO_2135 ?AUTO_2138 ) ) ( not ( = ?AUTO_2136 ?AUTO_2139 ) ) ( not ( = ?AUTO_2136 ?AUTO_2138 ) ) ( not ( = ?AUTO_2139 ?AUTO_2138 ) ) ( ON ?AUTO_2139 ?AUTO_2135 ) ( CLEAR ?AUTO_2139 ) ( CLEAR ?AUTO_2137 ) ( not ( = ?AUTO_2135 ?AUTO_2137 ) ) ( not ( = ?AUTO_2136 ?AUTO_2137 ) ) ( not ( = ?AUTO_2139 ?AUTO_2137 ) ) ( not ( = ?AUTO_2138 ?AUTO_2137 ) ) ( ON ?AUTO_2138 ?AUTO_2136 ) ( CLEAR ?AUTO_2138 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2138 ?AUTO_2136 )
      ( MAKE-ON ?AUTO_2135 ?AUTO_2136 )
      ( MAKE-ON-VERIFY ?AUTO_2135 ?AUTO_2136 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2140 - BLOCK
      ?AUTO_2141 - BLOCK
    )
    :vars
    (
      ?AUTO_2144 - BLOCK
      ?AUTO_2142 - BLOCK
      ?AUTO_2143 - BLOCK
      ?AUTO_2145 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2140 ?AUTO_2141 ) ) ( ON-TABLE ?AUTO_2140 ) ( not ( = ?AUTO_2140 ?AUTO_2144 ) ) ( not ( = ?AUTO_2140 ?AUTO_2142 ) ) ( not ( = ?AUTO_2141 ?AUTO_2144 ) ) ( not ( = ?AUTO_2141 ?AUTO_2142 ) ) ( not ( = ?AUTO_2144 ?AUTO_2142 ) ) ( ON ?AUTO_2144 ?AUTO_2140 ) ( CLEAR ?AUTO_2144 ) ( CLEAR ?AUTO_2143 ) ( not ( = ?AUTO_2140 ?AUTO_2143 ) ) ( not ( = ?AUTO_2141 ?AUTO_2143 ) ) ( not ( = ?AUTO_2144 ?AUTO_2143 ) ) ( not ( = ?AUTO_2142 ?AUTO_2143 ) ) ( ON ?AUTO_2142 ?AUTO_2141 ) ( CLEAR ?AUTO_2142 ) ( HOLDING ?AUTO_2145 ) ( not ( = ?AUTO_2140 ?AUTO_2145 ) ) ( not ( = ?AUTO_2141 ?AUTO_2145 ) ) ( not ( = ?AUTO_2144 ?AUTO_2145 ) ) ( not ( = ?AUTO_2142 ?AUTO_2145 ) ) ( not ( = ?AUTO_2143 ?AUTO_2145 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2145 )
      ( MAKE-ON ?AUTO_2140 ?AUTO_2141 )
      ( MAKE-ON-VERIFY ?AUTO_2140 ?AUTO_2141 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2146 - BLOCK
      ?AUTO_2147 - BLOCK
    )
    :vars
    (
      ?AUTO_2151 - BLOCK
      ?AUTO_2148 - BLOCK
      ?AUTO_2149 - BLOCK
      ?AUTO_2150 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2146 ?AUTO_2147 ) ) ( ON-TABLE ?AUTO_2146 ) ( not ( = ?AUTO_2146 ?AUTO_2151 ) ) ( not ( = ?AUTO_2146 ?AUTO_2148 ) ) ( not ( = ?AUTO_2147 ?AUTO_2151 ) ) ( not ( = ?AUTO_2147 ?AUTO_2148 ) ) ( not ( = ?AUTO_2151 ?AUTO_2148 ) ) ( ON ?AUTO_2151 ?AUTO_2146 ) ( CLEAR ?AUTO_2151 ) ( CLEAR ?AUTO_2149 ) ( not ( = ?AUTO_2146 ?AUTO_2149 ) ) ( not ( = ?AUTO_2147 ?AUTO_2149 ) ) ( not ( = ?AUTO_2151 ?AUTO_2149 ) ) ( not ( = ?AUTO_2148 ?AUTO_2149 ) ) ( ON ?AUTO_2148 ?AUTO_2147 ) ( not ( = ?AUTO_2146 ?AUTO_2150 ) ) ( not ( = ?AUTO_2147 ?AUTO_2150 ) ) ( not ( = ?AUTO_2151 ?AUTO_2150 ) ) ( not ( = ?AUTO_2148 ?AUTO_2150 ) ) ( not ( = ?AUTO_2149 ?AUTO_2150 ) ) ( ON ?AUTO_2150 ?AUTO_2148 ) ( CLEAR ?AUTO_2150 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2150 ?AUTO_2148 )
      ( MAKE-ON ?AUTO_2146 ?AUTO_2147 )
      ( MAKE-ON-VERIFY ?AUTO_2146 ?AUTO_2147 ) )
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
    ( and ( not ( = ?AUTO_2152 ?AUTO_2153 ) ) ( ON-TABLE ?AUTO_2152 ) ( not ( = ?AUTO_2152 ?AUTO_2156 ) ) ( not ( = ?AUTO_2152 ?AUTO_2157 ) ) ( not ( = ?AUTO_2153 ?AUTO_2156 ) ) ( not ( = ?AUTO_2153 ?AUTO_2157 ) ) ( not ( = ?AUTO_2156 ?AUTO_2157 ) ) ( CLEAR ?AUTO_2155 ) ( not ( = ?AUTO_2152 ?AUTO_2155 ) ) ( not ( = ?AUTO_2153 ?AUTO_2155 ) ) ( not ( = ?AUTO_2156 ?AUTO_2155 ) ) ( not ( = ?AUTO_2157 ?AUTO_2155 ) ) ( ON ?AUTO_2157 ?AUTO_2153 ) ( not ( = ?AUTO_2152 ?AUTO_2154 ) ) ( not ( = ?AUTO_2153 ?AUTO_2154 ) ) ( not ( = ?AUTO_2156 ?AUTO_2154 ) ) ( not ( = ?AUTO_2157 ?AUTO_2154 ) ) ( not ( = ?AUTO_2155 ?AUTO_2154 ) ) ( ON ?AUTO_2154 ?AUTO_2157 ) ( CLEAR ?AUTO_2154 ) ( HOLDING ?AUTO_2156 ) ( CLEAR ?AUTO_2152 ) )
    :subtasks
    ( ( !STACK ?AUTO_2156 ?AUTO_2152 )
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
      ?AUTO_2161 - BLOCK
      ?AUTO_2162 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2158 ?AUTO_2159 ) ) ( ON-TABLE ?AUTO_2158 ) ( not ( = ?AUTO_2158 ?AUTO_2163 ) ) ( not ( = ?AUTO_2158 ?AUTO_2160 ) ) ( not ( = ?AUTO_2159 ?AUTO_2163 ) ) ( not ( = ?AUTO_2159 ?AUTO_2160 ) ) ( not ( = ?AUTO_2163 ?AUTO_2160 ) ) ( CLEAR ?AUTO_2161 ) ( not ( = ?AUTO_2158 ?AUTO_2161 ) ) ( not ( = ?AUTO_2159 ?AUTO_2161 ) ) ( not ( = ?AUTO_2163 ?AUTO_2161 ) ) ( not ( = ?AUTO_2160 ?AUTO_2161 ) ) ( ON ?AUTO_2160 ?AUTO_2159 ) ( not ( = ?AUTO_2158 ?AUTO_2162 ) ) ( not ( = ?AUTO_2159 ?AUTO_2162 ) ) ( not ( = ?AUTO_2163 ?AUTO_2162 ) ) ( not ( = ?AUTO_2160 ?AUTO_2162 ) ) ( not ( = ?AUTO_2161 ?AUTO_2162 ) ) ( ON ?AUTO_2162 ?AUTO_2160 ) ( CLEAR ?AUTO_2158 ) ( ON ?AUTO_2163 ?AUTO_2162 ) ( CLEAR ?AUTO_2163 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2163 ?AUTO_2162 )
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
      ?AUTO_2168 - BLOCK
      ?AUTO_2169 - BLOCK
      ?AUTO_2166 - BLOCK
      ?AUTO_2167 - BLOCK
      ?AUTO_2170 - BLOCK
      ?AUTO_2171 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2164 ?AUTO_2165 ) ) ( ON-TABLE ?AUTO_2164 ) ( not ( = ?AUTO_2164 ?AUTO_2168 ) ) ( not ( = ?AUTO_2164 ?AUTO_2169 ) ) ( not ( = ?AUTO_2165 ?AUTO_2168 ) ) ( not ( = ?AUTO_2165 ?AUTO_2169 ) ) ( not ( = ?AUTO_2168 ?AUTO_2169 ) ) ( CLEAR ?AUTO_2166 ) ( not ( = ?AUTO_2164 ?AUTO_2166 ) ) ( not ( = ?AUTO_2165 ?AUTO_2166 ) ) ( not ( = ?AUTO_2168 ?AUTO_2166 ) ) ( not ( = ?AUTO_2169 ?AUTO_2166 ) ) ( ON ?AUTO_2169 ?AUTO_2165 ) ( not ( = ?AUTO_2164 ?AUTO_2167 ) ) ( not ( = ?AUTO_2165 ?AUTO_2167 ) ) ( not ( = ?AUTO_2168 ?AUTO_2167 ) ) ( not ( = ?AUTO_2169 ?AUTO_2167 ) ) ( not ( = ?AUTO_2166 ?AUTO_2167 ) ) ( ON ?AUTO_2167 ?AUTO_2169 ) ( CLEAR ?AUTO_2164 ) ( ON ?AUTO_2168 ?AUTO_2167 ) ( CLEAR ?AUTO_2168 ) ( HOLDING ?AUTO_2170 ) ( CLEAR ?AUTO_2171 ) ( not ( = ?AUTO_2164 ?AUTO_2170 ) ) ( not ( = ?AUTO_2164 ?AUTO_2171 ) ) ( not ( = ?AUTO_2165 ?AUTO_2170 ) ) ( not ( = ?AUTO_2165 ?AUTO_2171 ) ) ( not ( = ?AUTO_2168 ?AUTO_2170 ) ) ( not ( = ?AUTO_2168 ?AUTO_2171 ) ) ( not ( = ?AUTO_2169 ?AUTO_2170 ) ) ( not ( = ?AUTO_2169 ?AUTO_2171 ) ) ( not ( = ?AUTO_2166 ?AUTO_2170 ) ) ( not ( = ?AUTO_2166 ?AUTO_2171 ) ) ( not ( = ?AUTO_2167 ?AUTO_2170 ) ) ( not ( = ?AUTO_2167 ?AUTO_2171 ) ) ( not ( = ?AUTO_2170 ?AUTO_2171 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2170 ?AUTO_2171 )
      ( MAKE-ON ?AUTO_2164 ?AUTO_2165 )
      ( MAKE-ON-VERIFY ?AUTO_2164 ?AUTO_2165 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2180 - BLOCK
      ?AUTO_2181 - BLOCK
    )
    :vars
    (
      ?AUTO_2184 - BLOCK
      ?AUTO_2186 - BLOCK
      ?AUTO_2187 - BLOCK
      ?AUTO_2182 - BLOCK
      ?AUTO_2185 - BLOCK
      ?AUTO_2183 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2180 ?AUTO_2181 ) ) ( ON-TABLE ?AUTO_2180 ) ( not ( = ?AUTO_2180 ?AUTO_2184 ) ) ( not ( = ?AUTO_2180 ?AUTO_2186 ) ) ( not ( = ?AUTO_2181 ?AUTO_2184 ) ) ( not ( = ?AUTO_2181 ?AUTO_2186 ) ) ( not ( = ?AUTO_2184 ?AUTO_2186 ) ) ( CLEAR ?AUTO_2187 ) ( not ( = ?AUTO_2180 ?AUTO_2187 ) ) ( not ( = ?AUTO_2181 ?AUTO_2187 ) ) ( not ( = ?AUTO_2184 ?AUTO_2187 ) ) ( not ( = ?AUTO_2186 ?AUTO_2187 ) ) ( ON ?AUTO_2186 ?AUTO_2181 ) ( not ( = ?AUTO_2180 ?AUTO_2182 ) ) ( not ( = ?AUTO_2181 ?AUTO_2182 ) ) ( not ( = ?AUTO_2184 ?AUTO_2182 ) ) ( not ( = ?AUTO_2186 ?AUTO_2182 ) ) ( not ( = ?AUTO_2187 ?AUTO_2182 ) ) ( ON ?AUTO_2182 ?AUTO_2186 ) ( ON ?AUTO_2184 ?AUTO_2182 ) ( CLEAR ?AUTO_2184 ) ( CLEAR ?AUTO_2185 ) ( not ( = ?AUTO_2180 ?AUTO_2183 ) ) ( not ( = ?AUTO_2180 ?AUTO_2185 ) ) ( not ( = ?AUTO_2181 ?AUTO_2183 ) ) ( not ( = ?AUTO_2181 ?AUTO_2185 ) ) ( not ( = ?AUTO_2184 ?AUTO_2183 ) ) ( not ( = ?AUTO_2184 ?AUTO_2185 ) ) ( not ( = ?AUTO_2186 ?AUTO_2183 ) ) ( not ( = ?AUTO_2186 ?AUTO_2185 ) ) ( not ( = ?AUTO_2187 ?AUTO_2183 ) ) ( not ( = ?AUTO_2187 ?AUTO_2185 ) ) ( not ( = ?AUTO_2182 ?AUTO_2183 ) ) ( not ( = ?AUTO_2182 ?AUTO_2185 ) ) ( not ( = ?AUTO_2183 ?AUTO_2185 ) ) ( ON ?AUTO_2183 ?AUTO_2180 ) ( CLEAR ?AUTO_2183 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2183 ?AUTO_2180 )
      ( MAKE-ON ?AUTO_2180 ?AUTO_2181 )
      ( MAKE-ON-VERIFY ?AUTO_2180 ?AUTO_2181 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2188 - BLOCK
      ?AUTO_2189 - BLOCK
    )
    :vars
    (
      ?AUTO_2190 - BLOCK
      ?AUTO_2194 - BLOCK
      ?AUTO_2191 - BLOCK
      ?AUTO_2193 - BLOCK
      ?AUTO_2195 - BLOCK
      ?AUTO_2192 - BLOCK
      ?AUTO_2196 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2188 ?AUTO_2189 ) ) ( ON-TABLE ?AUTO_2188 ) ( not ( = ?AUTO_2188 ?AUTO_2190 ) ) ( not ( = ?AUTO_2188 ?AUTO_2194 ) ) ( not ( = ?AUTO_2189 ?AUTO_2190 ) ) ( not ( = ?AUTO_2189 ?AUTO_2194 ) ) ( not ( = ?AUTO_2190 ?AUTO_2194 ) ) ( CLEAR ?AUTO_2191 ) ( not ( = ?AUTO_2188 ?AUTO_2191 ) ) ( not ( = ?AUTO_2189 ?AUTO_2191 ) ) ( not ( = ?AUTO_2190 ?AUTO_2191 ) ) ( not ( = ?AUTO_2194 ?AUTO_2191 ) ) ( ON ?AUTO_2194 ?AUTO_2189 ) ( not ( = ?AUTO_2188 ?AUTO_2193 ) ) ( not ( = ?AUTO_2189 ?AUTO_2193 ) ) ( not ( = ?AUTO_2190 ?AUTO_2193 ) ) ( not ( = ?AUTO_2194 ?AUTO_2193 ) ) ( not ( = ?AUTO_2191 ?AUTO_2193 ) ) ( ON ?AUTO_2193 ?AUTO_2194 ) ( ON ?AUTO_2190 ?AUTO_2193 ) ( CLEAR ?AUTO_2190 ) ( CLEAR ?AUTO_2195 ) ( not ( = ?AUTO_2188 ?AUTO_2192 ) ) ( not ( = ?AUTO_2188 ?AUTO_2195 ) ) ( not ( = ?AUTO_2189 ?AUTO_2192 ) ) ( not ( = ?AUTO_2189 ?AUTO_2195 ) ) ( not ( = ?AUTO_2190 ?AUTO_2192 ) ) ( not ( = ?AUTO_2190 ?AUTO_2195 ) ) ( not ( = ?AUTO_2194 ?AUTO_2192 ) ) ( not ( = ?AUTO_2194 ?AUTO_2195 ) ) ( not ( = ?AUTO_2191 ?AUTO_2192 ) ) ( not ( = ?AUTO_2191 ?AUTO_2195 ) ) ( not ( = ?AUTO_2193 ?AUTO_2192 ) ) ( not ( = ?AUTO_2193 ?AUTO_2195 ) ) ( not ( = ?AUTO_2192 ?AUTO_2195 ) ) ( ON ?AUTO_2192 ?AUTO_2188 ) ( CLEAR ?AUTO_2192 ) ( HOLDING ?AUTO_2196 ) ( not ( = ?AUTO_2188 ?AUTO_2196 ) ) ( not ( = ?AUTO_2189 ?AUTO_2196 ) ) ( not ( = ?AUTO_2190 ?AUTO_2196 ) ) ( not ( = ?AUTO_2194 ?AUTO_2196 ) ) ( not ( = ?AUTO_2191 ?AUTO_2196 ) ) ( not ( = ?AUTO_2193 ?AUTO_2196 ) ) ( not ( = ?AUTO_2195 ?AUTO_2196 ) ) ( not ( = ?AUTO_2192 ?AUTO_2196 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2196 )
      ( MAKE-ON ?AUTO_2188 ?AUTO_2189 )
      ( MAKE-ON-VERIFY ?AUTO_2188 ?AUTO_2189 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2197 - BLOCK
      ?AUTO_2198 - BLOCK
    )
    :vars
    (
      ?AUTO_2205 - BLOCK
      ?AUTO_2203 - BLOCK
      ?AUTO_2202 - BLOCK
      ?AUTO_2204 - BLOCK
      ?AUTO_2200 - BLOCK
      ?AUTO_2201 - BLOCK
      ?AUTO_2199 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2197 ?AUTO_2198 ) ) ( ON-TABLE ?AUTO_2197 ) ( not ( = ?AUTO_2197 ?AUTO_2205 ) ) ( not ( = ?AUTO_2197 ?AUTO_2203 ) ) ( not ( = ?AUTO_2198 ?AUTO_2205 ) ) ( not ( = ?AUTO_2198 ?AUTO_2203 ) ) ( not ( = ?AUTO_2205 ?AUTO_2203 ) ) ( CLEAR ?AUTO_2202 ) ( not ( = ?AUTO_2197 ?AUTO_2202 ) ) ( not ( = ?AUTO_2198 ?AUTO_2202 ) ) ( not ( = ?AUTO_2205 ?AUTO_2202 ) ) ( not ( = ?AUTO_2203 ?AUTO_2202 ) ) ( ON ?AUTO_2203 ?AUTO_2198 ) ( not ( = ?AUTO_2197 ?AUTO_2204 ) ) ( not ( = ?AUTO_2198 ?AUTO_2204 ) ) ( not ( = ?AUTO_2205 ?AUTO_2204 ) ) ( not ( = ?AUTO_2203 ?AUTO_2204 ) ) ( not ( = ?AUTO_2202 ?AUTO_2204 ) ) ( ON ?AUTO_2204 ?AUTO_2203 ) ( ON ?AUTO_2205 ?AUTO_2204 ) ( CLEAR ?AUTO_2205 ) ( CLEAR ?AUTO_2200 ) ( not ( = ?AUTO_2197 ?AUTO_2201 ) ) ( not ( = ?AUTO_2197 ?AUTO_2200 ) ) ( not ( = ?AUTO_2198 ?AUTO_2201 ) ) ( not ( = ?AUTO_2198 ?AUTO_2200 ) ) ( not ( = ?AUTO_2205 ?AUTO_2201 ) ) ( not ( = ?AUTO_2205 ?AUTO_2200 ) ) ( not ( = ?AUTO_2203 ?AUTO_2201 ) ) ( not ( = ?AUTO_2203 ?AUTO_2200 ) ) ( not ( = ?AUTO_2202 ?AUTO_2201 ) ) ( not ( = ?AUTO_2202 ?AUTO_2200 ) ) ( not ( = ?AUTO_2204 ?AUTO_2201 ) ) ( not ( = ?AUTO_2204 ?AUTO_2200 ) ) ( not ( = ?AUTO_2201 ?AUTO_2200 ) ) ( ON ?AUTO_2201 ?AUTO_2197 ) ( not ( = ?AUTO_2197 ?AUTO_2199 ) ) ( not ( = ?AUTO_2198 ?AUTO_2199 ) ) ( not ( = ?AUTO_2205 ?AUTO_2199 ) ) ( not ( = ?AUTO_2203 ?AUTO_2199 ) ) ( not ( = ?AUTO_2202 ?AUTO_2199 ) ) ( not ( = ?AUTO_2204 ?AUTO_2199 ) ) ( not ( = ?AUTO_2200 ?AUTO_2199 ) ) ( not ( = ?AUTO_2201 ?AUTO_2199 ) ) ( ON ?AUTO_2199 ?AUTO_2201 ) ( CLEAR ?AUTO_2199 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2199 ?AUTO_2201 )
      ( MAKE-ON ?AUTO_2197 ?AUTO_2198 )
      ( MAKE-ON-VERIFY ?AUTO_2197 ?AUTO_2198 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2206 - BLOCK
      ?AUTO_2207 - BLOCK
    )
    :vars
    (
      ?AUTO_2214 - BLOCK
      ?AUTO_2209 - BLOCK
      ?AUTO_2210 - BLOCK
      ?AUTO_2208 - BLOCK
      ?AUTO_2212 - BLOCK
      ?AUTO_2211 - BLOCK
      ?AUTO_2213 - BLOCK
      ?AUTO_2215 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2206 ?AUTO_2207 ) ) ( ON-TABLE ?AUTO_2206 ) ( not ( = ?AUTO_2206 ?AUTO_2214 ) ) ( not ( = ?AUTO_2206 ?AUTO_2209 ) ) ( not ( = ?AUTO_2207 ?AUTO_2214 ) ) ( not ( = ?AUTO_2207 ?AUTO_2209 ) ) ( not ( = ?AUTO_2214 ?AUTO_2209 ) ) ( CLEAR ?AUTO_2210 ) ( not ( = ?AUTO_2206 ?AUTO_2210 ) ) ( not ( = ?AUTO_2207 ?AUTO_2210 ) ) ( not ( = ?AUTO_2214 ?AUTO_2210 ) ) ( not ( = ?AUTO_2209 ?AUTO_2210 ) ) ( ON ?AUTO_2209 ?AUTO_2207 ) ( not ( = ?AUTO_2206 ?AUTO_2208 ) ) ( not ( = ?AUTO_2207 ?AUTO_2208 ) ) ( not ( = ?AUTO_2214 ?AUTO_2208 ) ) ( not ( = ?AUTO_2209 ?AUTO_2208 ) ) ( not ( = ?AUTO_2210 ?AUTO_2208 ) ) ( ON ?AUTO_2208 ?AUTO_2209 ) ( ON ?AUTO_2214 ?AUTO_2208 ) ( CLEAR ?AUTO_2214 ) ( CLEAR ?AUTO_2212 ) ( not ( = ?AUTO_2206 ?AUTO_2211 ) ) ( not ( = ?AUTO_2206 ?AUTO_2212 ) ) ( not ( = ?AUTO_2207 ?AUTO_2211 ) ) ( not ( = ?AUTO_2207 ?AUTO_2212 ) ) ( not ( = ?AUTO_2214 ?AUTO_2211 ) ) ( not ( = ?AUTO_2214 ?AUTO_2212 ) ) ( not ( = ?AUTO_2209 ?AUTO_2211 ) ) ( not ( = ?AUTO_2209 ?AUTO_2212 ) ) ( not ( = ?AUTO_2210 ?AUTO_2211 ) ) ( not ( = ?AUTO_2210 ?AUTO_2212 ) ) ( not ( = ?AUTO_2208 ?AUTO_2211 ) ) ( not ( = ?AUTO_2208 ?AUTO_2212 ) ) ( not ( = ?AUTO_2211 ?AUTO_2212 ) ) ( ON ?AUTO_2211 ?AUTO_2206 ) ( not ( = ?AUTO_2206 ?AUTO_2213 ) ) ( not ( = ?AUTO_2207 ?AUTO_2213 ) ) ( not ( = ?AUTO_2214 ?AUTO_2213 ) ) ( not ( = ?AUTO_2209 ?AUTO_2213 ) ) ( not ( = ?AUTO_2210 ?AUTO_2213 ) ) ( not ( = ?AUTO_2208 ?AUTO_2213 ) ) ( not ( = ?AUTO_2212 ?AUTO_2213 ) ) ( not ( = ?AUTO_2211 ?AUTO_2213 ) ) ( ON ?AUTO_2213 ?AUTO_2211 ) ( CLEAR ?AUTO_2213 ) ( HOLDING ?AUTO_2215 ) ( not ( = ?AUTO_2206 ?AUTO_2215 ) ) ( not ( = ?AUTO_2207 ?AUTO_2215 ) ) ( not ( = ?AUTO_2214 ?AUTO_2215 ) ) ( not ( = ?AUTO_2209 ?AUTO_2215 ) ) ( not ( = ?AUTO_2210 ?AUTO_2215 ) ) ( not ( = ?AUTO_2208 ?AUTO_2215 ) ) ( not ( = ?AUTO_2212 ?AUTO_2215 ) ) ( not ( = ?AUTO_2211 ?AUTO_2215 ) ) ( not ( = ?AUTO_2213 ?AUTO_2215 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2215 )
      ( MAKE-ON ?AUTO_2206 ?AUTO_2207 )
      ( MAKE-ON-VERIFY ?AUTO_2206 ?AUTO_2207 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2216 - BLOCK
      ?AUTO_2217 - BLOCK
    )
    :vars
    (
      ?AUTO_2222 - BLOCK
      ?AUTO_2220 - BLOCK
      ?AUTO_2218 - BLOCK
      ?AUTO_2221 - BLOCK
      ?AUTO_2219 - BLOCK
      ?AUTO_2224 - BLOCK
      ?AUTO_2223 - BLOCK
      ?AUTO_2225 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2216 ?AUTO_2217 ) ) ( ON-TABLE ?AUTO_2216 ) ( not ( = ?AUTO_2216 ?AUTO_2222 ) ) ( not ( = ?AUTO_2216 ?AUTO_2220 ) ) ( not ( = ?AUTO_2217 ?AUTO_2222 ) ) ( not ( = ?AUTO_2217 ?AUTO_2220 ) ) ( not ( = ?AUTO_2222 ?AUTO_2220 ) ) ( CLEAR ?AUTO_2218 ) ( not ( = ?AUTO_2216 ?AUTO_2218 ) ) ( not ( = ?AUTO_2217 ?AUTO_2218 ) ) ( not ( = ?AUTO_2222 ?AUTO_2218 ) ) ( not ( = ?AUTO_2220 ?AUTO_2218 ) ) ( ON ?AUTO_2220 ?AUTO_2217 ) ( not ( = ?AUTO_2216 ?AUTO_2221 ) ) ( not ( = ?AUTO_2217 ?AUTO_2221 ) ) ( not ( = ?AUTO_2222 ?AUTO_2221 ) ) ( not ( = ?AUTO_2220 ?AUTO_2221 ) ) ( not ( = ?AUTO_2218 ?AUTO_2221 ) ) ( ON ?AUTO_2221 ?AUTO_2220 ) ( ON ?AUTO_2222 ?AUTO_2221 ) ( CLEAR ?AUTO_2222 ) ( CLEAR ?AUTO_2219 ) ( not ( = ?AUTO_2216 ?AUTO_2224 ) ) ( not ( = ?AUTO_2216 ?AUTO_2219 ) ) ( not ( = ?AUTO_2217 ?AUTO_2224 ) ) ( not ( = ?AUTO_2217 ?AUTO_2219 ) ) ( not ( = ?AUTO_2222 ?AUTO_2224 ) ) ( not ( = ?AUTO_2222 ?AUTO_2219 ) ) ( not ( = ?AUTO_2220 ?AUTO_2224 ) ) ( not ( = ?AUTO_2220 ?AUTO_2219 ) ) ( not ( = ?AUTO_2218 ?AUTO_2224 ) ) ( not ( = ?AUTO_2218 ?AUTO_2219 ) ) ( not ( = ?AUTO_2221 ?AUTO_2224 ) ) ( not ( = ?AUTO_2221 ?AUTO_2219 ) ) ( not ( = ?AUTO_2224 ?AUTO_2219 ) ) ( ON ?AUTO_2224 ?AUTO_2216 ) ( not ( = ?AUTO_2216 ?AUTO_2223 ) ) ( not ( = ?AUTO_2217 ?AUTO_2223 ) ) ( not ( = ?AUTO_2222 ?AUTO_2223 ) ) ( not ( = ?AUTO_2220 ?AUTO_2223 ) ) ( not ( = ?AUTO_2218 ?AUTO_2223 ) ) ( not ( = ?AUTO_2221 ?AUTO_2223 ) ) ( not ( = ?AUTO_2219 ?AUTO_2223 ) ) ( not ( = ?AUTO_2224 ?AUTO_2223 ) ) ( ON ?AUTO_2223 ?AUTO_2224 ) ( not ( = ?AUTO_2216 ?AUTO_2225 ) ) ( not ( = ?AUTO_2217 ?AUTO_2225 ) ) ( not ( = ?AUTO_2222 ?AUTO_2225 ) ) ( not ( = ?AUTO_2220 ?AUTO_2225 ) ) ( not ( = ?AUTO_2218 ?AUTO_2225 ) ) ( not ( = ?AUTO_2221 ?AUTO_2225 ) ) ( not ( = ?AUTO_2219 ?AUTO_2225 ) ) ( not ( = ?AUTO_2224 ?AUTO_2225 ) ) ( not ( = ?AUTO_2223 ?AUTO_2225 ) ) ( ON ?AUTO_2225 ?AUTO_2223 ) ( CLEAR ?AUTO_2225 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2225 ?AUTO_2223 )
      ( MAKE-ON ?AUTO_2216 ?AUTO_2217 )
      ( MAKE-ON-VERIFY ?AUTO_2216 ?AUTO_2217 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2226 - BLOCK
      ?AUTO_2227 - BLOCK
    )
    :vars
    (
      ?AUTO_2233 - BLOCK
      ?AUTO_2235 - BLOCK
      ?AUTO_2229 - BLOCK
      ?AUTO_2234 - BLOCK
      ?AUTO_2228 - BLOCK
      ?AUTO_2231 - BLOCK
      ?AUTO_2232 - BLOCK
      ?AUTO_2230 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2226 ?AUTO_2227 ) ) ( ON-TABLE ?AUTO_2226 ) ( not ( = ?AUTO_2226 ?AUTO_2233 ) ) ( not ( = ?AUTO_2226 ?AUTO_2235 ) ) ( not ( = ?AUTO_2227 ?AUTO_2233 ) ) ( not ( = ?AUTO_2227 ?AUTO_2235 ) ) ( not ( = ?AUTO_2233 ?AUTO_2235 ) ) ( not ( = ?AUTO_2226 ?AUTO_2229 ) ) ( not ( = ?AUTO_2227 ?AUTO_2229 ) ) ( not ( = ?AUTO_2233 ?AUTO_2229 ) ) ( not ( = ?AUTO_2235 ?AUTO_2229 ) ) ( ON ?AUTO_2235 ?AUTO_2227 ) ( not ( = ?AUTO_2226 ?AUTO_2234 ) ) ( not ( = ?AUTO_2227 ?AUTO_2234 ) ) ( not ( = ?AUTO_2233 ?AUTO_2234 ) ) ( not ( = ?AUTO_2235 ?AUTO_2234 ) ) ( not ( = ?AUTO_2229 ?AUTO_2234 ) ) ( ON ?AUTO_2234 ?AUTO_2235 ) ( ON ?AUTO_2233 ?AUTO_2234 ) ( CLEAR ?AUTO_2233 ) ( CLEAR ?AUTO_2228 ) ( not ( = ?AUTO_2226 ?AUTO_2231 ) ) ( not ( = ?AUTO_2226 ?AUTO_2228 ) ) ( not ( = ?AUTO_2227 ?AUTO_2231 ) ) ( not ( = ?AUTO_2227 ?AUTO_2228 ) ) ( not ( = ?AUTO_2233 ?AUTO_2231 ) ) ( not ( = ?AUTO_2233 ?AUTO_2228 ) ) ( not ( = ?AUTO_2235 ?AUTO_2231 ) ) ( not ( = ?AUTO_2235 ?AUTO_2228 ) ) ( not ( = ?AUTO_2229 ?AUTO_2231 ) ) ( not ( = ?AUTO_2229 ?AUTO_2228 ) ) ( not ( = ?AUTO_2234 ?AUTO_2231 ) ) ( not ( = ?AUTO_2234 ?AUTO_2228 ) ) ( not ( = ?AUTO_2231 ?AUTO_2228 ) ) ( ON ?AUTO_2231 ?AUTO_2226 ) ( not ( = ?AUTO_2226 ?AUTO_2232 ) ) ( not ( = ?AUTO_2227 ?AUTO_2232 ) ) ( not ( = ?AUTO_2233 ?AUTO_2232 ) ) ( not ( = ?AUTO_2235 ?AUTO_2232 ) ) ( not ( = ?AUTO_2229 ?AUTO_2232 ) ) ( not ( = ?AUTO_2234 ?AUTO_2232 ) ) ( not ( = ?AUTO_2228 ?AUTO_2232 ) ) ( not ( = ?AUTO_2231 ?AUTO_2232 ) ) ( ON ?AUTO_2232 ?AUTO_2231 ) ( not ( = ?AUTO_2226 ?AUTO_2230 ) ) ( not ( = ?AUTO_2227 ?AUTO_2230 ) ) ( not ( = ?AUTO_2233 ?AUTO_2230 ) ) ( not ( = ?AUTO_2235 ?AUTO_2230 ) ) ( not ( = ?AUTO_2229 ?AUTO_2230 ) ) ( not ( = ?AUTO_2234 ?AUTO_2230 ) ) ( not ( = ?AUTO_2228 ?AUTO_2230 ) ) ( not ( = ?AUTO_2231 ?AUTO_2230 ) ) ( not ( = ?AUTO_2232 ?AUTO_2230 ) ) ( ON ?AUTO_2230 ?AUTO_2232 ) ( CLEAR ?AUTO_2230 ) ( HOLDING ?AUTO_2229 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2229 )
      ( MAKE-ON ?AUTO_2226 ?AUTO_2227 )
      ( MAKE-ON-VERIFY ?AUTO_2226 ?AUTO_2227 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2236 - BLOCK
      ?AUTO_2237 - BLOCK
    )
    :vars
    (
      ?AUTO_2243 - BLOCK
      ?AUTO_2245 - BLOCK
      ?AUTO_2240 - BLOCK
      ?AUTO_2244 - BLOCK
      ?AUTO_2241 - BLOCK
      ?AUTO_2239 - BLOCK
      ?AUTO_2238 - BLOCK
      ?AUTO_2242 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2236 ?AUTO_2237 ) ) ( ON-TABLE ?AUTO_2236 ) ( not ( = ?AUTO_2236 ?AUTO_2243 ) ) ( not ( = ?AUTO_2236 ?AUTO_2245 ) ) ( not ( = ?AUTO_2237 ?AUTO_2243 ) ) ( not ( = ?AUTO_2237 ?AUTO_2245 ) ) ( not ( = ?AUTO_2243 ?AUTO_2245 ) ) ( not ( = ?AUTO_2236 ?AUTO_2240 ) ) ( not ( = ?AUTO_2237 ?AUTO_2240 ) ) ( not ( = ?AUTO_2243 ?AUTO_2240 ) ) ( not ( = ?AUTO_2245 ?AUTO_2240 ) ) ( ON ?AUTO_2245 ?AUTO_2237 ) ( not ( = ?AUTO_2236 ?AUTO_2244 ) ) ( not ( = ?AUTO_2237 ?AUTO_2244 ) ) ( not ( = ?AUTO_2243 ?AUTO_2244 ) ) ( not ( = ?AUTO_2245 ?AUTO_2244 ) ) ( not ( = ?AUTO_2240 ?AUTO_2244 ) ) ( ON ?AUTO_2244 ?AUTO_2245 ) ( ON ?AUTO_2243 ?AUTO_2244 ) ( CLEAR ?AUTO_2243 ) ( CLEAR ?AUTO_2241 ) ( not ( = ?AUTO_2236 ?AUTO_2239 ) ) ( not ( = ?AUTO_2236 ?AUTO_2241 ) ) ( not ( = ?AUTO_2237 ?AUTO_2239 ) ) ( not ( = ?AUTO_2237 ?AUTO_2241 ) ) ( not ( = ?AUTO_2243 ?AUTO_2239 ) ) ( not ( = ?AUTO_2243 ?AUTO_2241 ) ) ( not ( = ?AUTO_2245 ?AUTO_2239 ) ) ( not ( = ?AUTO_2245 ?AUTO_2241 ) ) ( not ( = ?AUTO_2240 ?AUTO_2239 ) ) ( not ( = ?AUTO_2240 ?AUTO_2241 ) ) ( not ( = ?AUTO_2244 ?AUTO_2239 ) ) ( not ( = ?AUTO_2244 ?AUTO_2241 ) ) ( not ( = ?AUTO_2239 ?AUTO_2241 ) ) ( ON ?AUTO_2239 ?AUTO_2236 ) ( not ( = ?AUTO_2236 ?AUTO_2238 ) ) ( not ( = ?AUTO_2237 ?AUTO_2238 ) ) ( not ( = ?AUTO_2243 ?AUTO_2238 ) ) ( not ( = ?AUTO_2245 ?AUTO_2238 ) ) ( not ( = ?AUTO_2240 ?AUTO_2238 ) ) ( not ( = ?AUTO_2244 ?AUTO_2238 ) ) ( not ( = ?AUTO_2241 ?AUTO_2238 ) ) ( not ( = ?AUTO_2239 ?AUTO_2238 ) ) ( ON ?AUTO_2238 ?AUTO_2239 ) ( not ( = ?AUTO_2236 ?AUTO_2242 ) ) ( not ( = ?AUTO_2237 ?AUTO_2242 ) ) ( not ( = ?AUTO_2243 ?AUTO_2242 ) ) ( not ( = ?AUTO_2245 ?AUTO_2242 ) ) ( not ( = ?AUTO_2240 ?AUTO_2242 ) ) ( not ( = ?AUTO_2244 ?AUTO_2242 ) ) ( not ( = ?AUTO_2241 ?AUTO_2242 ) ) ( not ( = ?AUTO_2239 ?AUTO_2242 ) ) ( not ( = ?AUTO_2238 ?AUTO_2242 ) ) ( ON ?AUTO_2242 ?AUTO_2238 ) ( ON ?AUTO_2240 ?AUTO_2242 ) ( CLEAR ?AUTO_2240 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2240 ?AUTO_2242 )
      ( MAKE-ON ?AUTO_2236 ?AUTO_2237 )
      ( MAKE-ON-VERIFY ?AUTO_2236 ?AUTO_2237 ) )
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

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2260 - BLOCK
      ?AUTO_2261 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2260 ) ( CLEAR ?AUTO_2261 ) ( not ( = ?AUTO_2260 ?AUTO_2261 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2260 ?AUTO_2261 )
      ( MAKE-ON-VERIFY ?AUTO_2260 ?AUTO_2261 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2262 - BLOCK
      ?AUTO_2263 - BLOCK
    )
    :vars
    (
      ?AUTO_2264 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2263 ) ( not ( = ?AUTO_2262 ?AUTO_2263 ) ) ( ON ?AUTO_2262 ?AUTO_2264 ) ( CLEAR ?AUTO_2262 ) ( HAND-EMPTY ) ( not ( = ?AUTO_2262 ?AUTO_2264 ) ) ( not ( = ?AUTO_2263 ?AUTO_2264 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2262 ?AUTO_2264 )
      ( MAKE-ON ?AUTO_2262 ?AUTO_2263 )
      ( MAKE-ON-VERIFY ?AUTO_2262 ?AUTO_2263 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2265 - BLOCK
      ?AUTO_2266 - BLOCK
    )
    :vars
    (
      ?AUTO_2267 - BLOCK
      ?AUTO_2268 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2266 ) ( not ( = ?AUTO_2265 ?AUTO_2266 ) ) ( ON ?AUTO_2265 ?AUTO_2267 ) ( CLEAR ?AUTO_2265 ) ( not ( = ?AUTO_2265 ?AUTO_2267 ) ) ( not ( = ?AUTO_2266 ?AUTO_2267 ) ) ( HOLDING ?AUTO_2268 ) ( not ( = ?AUTO_2265 ?AUTO_2268 ) ) ( not ( = ?AUTO_2266 ?AUTO_2268 ) ) ( not ( = ?AUTO_2267 ?AUTO_2268 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2268 )
      ( MAKE-ON ?AUTO_2265 ?AUTO_2266 )
      ( MAKE-ON-VERIFY ?AUTO_2265 ?AUTO_2266 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2271 - BLOCK
      ?AUTO_2272 - BLOCK
    )
    :vars
    (
      ?AUTO_2273 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2271 ?AUTO_2272 ) ) ( ON ?AUTO_2271 ?AUTO_2273 ) ( CLEAR ?AUTO_2271 ) ( not ( = ?AUTO_2271 ?AUTO_2273 ) ) ( not ( = ?AUTO_2272 ?AUTO_2273 ) ) ( HOLDING ?AUTO_2272 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2272 )
      ( MAKE-ON ?AUTO_2271 ?AUTO_2272 )
      ( MAKE-ON-VERIFY ?AUTO_2271 ?AUTO_2272 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2277 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2277 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2277 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2277 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2278 - BLOCK
    )
    :vars
    (
      ?AUTO_2279 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2278 ?AUTO_2279 ) ( CLEAR ?AUTO_2278 ) ( HAND-EMPTY ) ( not ( = ?AUTO_2278 ?AUTO_2279 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2278 ?AUTO_2279 )
      ( MAKE-ON-TABLE ?AUTO_2278 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2278 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2280 - BLOCK
    )
    :vars
    (
      ?AUTO_2281 - BLOCK
      ?AUTO_2282 - BLOCK
      ?AUTO_2283 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2280 ?AUTO_2281 ) ( CLEAR ?AUTO_2280 ) ( not ( = ?AUTO_2280 ?AUTO_2281 ) ) ( HOLDING ?AUTO_2282 ) ( CLEAR ?AUTO_2283 ) ( not ( = ?AUTO_2280 ?AUTO_2282 ) ) ( not ( = ?AUTO_2280 ?AUTO_2283 ) ) ( not ( = ?AUTO_2281 ?AUTO_2282 ) ) ( not ( = ?AUTO_2281 ?AUTO_2283 ) ) ( not ( = ?AUTO_2282 ?AUTO_2283 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2282 ?AUTO_2283 )
      ( MAKE-ON-TABLE ?AUTO_2280 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2280 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2288 - BLOCK
    )
    :vars
    (
      ?AUTO_2289 - BLOCK
      ?AUTO_2291 - BLOCK
      ?AUTO_2290 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2288 ?AUTO_2289 ) ( not ( = ?AUTO_2288 ?AUTO_2289 ) ) ( CLEAR ?AUTO_2291 ) ( not ( = ?AUTO_2288 ?AUTO_2290 ) ) ( not ( = ?AUTO_2288 ?AUTO_2291 ) ) ( not ( = ?AUTO_2289 ?AUTO_2290 ) ) ( not ( = ?AUTO_2289 ?AUTO_2291 ) ) ( not ( = ?AUTO_2290 ?AUTO_2291 ) ) ( ON ?AUTO_2290 ?AUTO_2288 ) ( CLEAR ?AUTO_2290 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2290 ?AUTO_2288 )
      ( MAKE-ON-TABLE ?AUTO_2288 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2288 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2294 - BLOCK
      ?AUTO_2295 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2294 ) ( CLEAR ?AUTO_2295 ) ( not ( = ?AUTO_2294 ?AUTO_2295 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2294 ?AUTO_2295 )
      ( MAKE-ON-VERIFY ?AUTO_2294 ?AUTO_2295 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2296 - BLOCK
      ?AUTO_2297 - BLOCK
    )
    :vars
    (
      ?AUTO_2298 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2297 ) ( not ( = ?AUTO_2296 ?AUTO_2297 ) ) ( ON ?AUTO_2296 ?AUTO_2298 ) ( CLEAR ?AUTO_2296 ) ( HAND-EMPTY ) ( not ( = ?AUTO_2296 ?AUTO_2298 ) ) ( not ( = ?AUTO_2297 ?AUTO_2298 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2296 ?AUTO_2298 )
      ( MAKE-ON ?AUTO_2296 ?AUTO_2297 )
      ( MAKE-ON-VERIFY ?AUTO_2296 ?AUTO_2297 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2299 - BLOCK
      ?AUTO_2300 - BLOCK
    )
    :vars
    (
      ?AUTO_2301 - BLOCK
      ?AUTO_2302 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2300 ) ( not ( = ?AUTO_2299 ?AUTO_2300 ) ) ( ON ?AUTO_2299 ?AUTO_2301 ) ( CLEAR ?AUTO_2299 ) ( not ( = ?AUTO_2299 ?AUTO_2301 ) ) ( not ( = ?AUTO_2300 ?AUTO_2301 ) ) ( HOLDING ?AUTO_2302 ) ( not ( = ?AUTO_2299 ?AUTO_2302 ) ) ( not ( = ?AUTO_2300 ?AUTO_2302 ) ) ( not ( = ?AUTO_2301 ?AUTO_2302 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2302 )
      ( MAKE-ON ?AUTO_2299 ?AUTO_2300 )
      ( MAKE-ON-VERIFY ?AUTO_2299 ?AUTO_2300 ) )
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
    )
    :precondition
    ( and ( CLEAR ?AUTO_2304 ) ( not ( = ?AUTO_2303 ?AUTO_2304 ) ) ( ON ?AUTO_2303 ?AUTO_2305 ) ( not ( = ?AUTO_2303 ?AUTO_2305 ) ) ( not ( = ?AUTO_2304 ?AUTO_2305 ) ) ( not ( = ?AUTO_2303 ?AUTO_2306 ) ) ( not ( = ?AUTO_2304 ?AUTO_2306 ) ) ( not ( = ?AUTO_2305 ?AUTO_2306 ) ) ( ON ?AUTO_2306 ?AUTO_2303 ) ( CLEAR ?AUTO_2306 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2306 ?AUTO_2303 )
      ( MAKE-ON ?AUTO_2303 ?AUTO_2304 )
      ( MAKE-ON-VERIFY ?AUTO_2303 ?AUTO_2304 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2307 - BLOCK
      ?AUTO_2308 - BLOCK
    )
    :vars
    (
      ?AUTO_2309 - BLOCK
      ?AUTO_2310 - BLOCK
      ?AUTO_2311 - BLOCK
      ?AUTO_2312 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2308 ) ( not ( = ?AUTO_2307 ?AUTO_2308 ) ) ( ON ?AUTO_2307 ?AUTO_2309 ) ( not ( = ?AUTO_2307 ?AUTO_2309 ) ) ( not ( = ?AUTO_2308 ?AUTO_2309 ) ) ( not ( = ?AUTO_2307 ?AUTO_2310 ) ) ( not ( = ?AUTO_2308 ?AUTO_2310 ) ) ( not ( = ?AUTO_2309 ?AUTO_2310 ) ) ( ON ?AUTO_2310 ?AUTO_2307 ) ( CLEAR ?AUTO_2310 ) ( HOLDING ?AUTO_2311 ) ( CLEAR ?AUTO_2312 ) ( not ( = ?AUTO_2307 ?AUTO_2311 ) ) ( not ( = ?AUTO_2307 ?AUTO_2312 ) ) ( not ( = ?AUTO_2308 ?AUTO_2311 ) ) ( not ( = ?AUTO_2308 ?AUTO_2312 ) ) ( not ( = ?AUTO_2309 ?AUTO_2311 ) ) ( not ( = ?AUTO_2309 ?AUTO_2312 ) ) ( not ( = ?AUTO_2310 ?AUTO_2311 ) ) ( not ( = ?AUTO_2310 ?AUTO_2312 ) ) ( not ( = ?AUTO_2311 ?AUTO_2312 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2311 ?AUTO_2312 )
      ( MAKE-ON ?AUTO_2307 ?AUTO_2308 )
      ( MAKE-ON-VERIFY ?AUTO_2307 ?AUTO_2308 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2315 - BLOCK
      ?AUTO_2316 - BLOCK
    )
    :vars
    (
      ?AUTO_2318 - BLOCK
      ?AUTO_2317 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2315 ?AUTO_2316 ) ) ( ON ?AUTO_2315 ?AUTO_2318 ) ( not ( = ?AUTO_2315 ?AUTO_2318 ) ) ( not ( = ?AUTO_2316 ?AUTO_2318 ) ) ( not ( = ?AUTO_2315 ?AUTO_2317 ) ) ( not ( = ?AUTO_2316 ?AUTO_2317 ) ) ( not ( = ?AUTO_2318 ?AUTO_2317 ) ) ( ON ?AUTO_2317 ?AUTO_2315 ) ( CLEAR ?AUTO_2317 ) ( HOLDING ?AUTO_2316 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2316 )
      ( MAKE-ON ?AUTO_2315 ?AUTO_2316 )
      ( MAKE-ON-VERIFY ?AUTO_2315 ?AUTO_2316 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2323 - BLOCK
      ?AUTO_2324 - BLOCK
    )
    :vars
    (
      ?AUTO_2328 - BLOCK
      ?AUTO_2325 - BLOCK
      ?AUTO_2326 - BLOCK
      ?AUTO_2327 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2324 ) ( not ( = ?AUTO_2323 ?AUTO_2324 ) ) ( ON ?AUTO_2323 ?AUTO_2328 ) ( not ( = ?AUTO_2323 ?AUTO_2328 ) ) ( not ( = ?AUTO_2324 ?AUTO_2328 ) ) ( not ( = ?AUTO_2323 ?AUTO_2325 ) ) ( not ( = ?AUTO_2324 ?AUTO_2325 ) ) ( not ( = ?AUTO_2328 ?AUTO_2325 ) ) ( ON ?AUTO_2325 ?AUTO_2323 ) ( CLEAR ?AUTO_2326 ) ( not ( = ?AUTO_2323 ?AUTO_2327 ) ) ( not ( = ?AUTO_2323 ?AUTO_2326 ) ) ( not ( = ?AUTO_2324 ?AUTO_2327 ) ) ( not ( = ?AUTO_2324 ?AUTO_2326 ) ) ( not ( = ?AUTO_2328 ?AUTO_2327 ) ) ( not ( = ?AUTO_2328 ?AUTO_2326 ) ) ( not ( = ?AUTO_2325 ?AUTO_2327 ) ) ( not ( = ?AUTO_2325 ?AUTO_2326 ) ) ( not ( = ?AUTO_2327 ?AUTO_2326 ) ) ( ON ?AUTO_2327 ?AUTO_2325 ) ( CLEAR ?AUTO_2327 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2327 ?AUTO_2325 )
      ( MAKE-ON ?AUTO_2323 ?AUTO_2324 )
      ( MAKE-ON-VERIFY ?AUTO_2323 ?AUTO_2324 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2331 - BLOCK
      ?AUTO_2332 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2331 ) ( CLEAR ?AUTO_2332 ) ( not ( = ?AUTO_2331 ?AUTO_2332 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2331 ?AUTO_2332 )
      ( MAKE-ON-VERIFY ?AUTO_2331 ?AUTO_2332 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2333 - BLOCK
      ?AUTO_2334 - BLOCK
    )
    :vars
    (
      ?AUTO_2335 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2334 ) ( not ( = ?AUTO_2333 ?AUTO_2334 ) ) ( ON ?AUTO_2333 ?AUTO_2335 ) ( CLEAR ?AUTO_2333 ) ( HAND-EMPTY ) ( not ( = ?AUTO_2333 ?AUTO_2335 ) ) ( not ( = ?AUTO_2334 ?AUTO_2335 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2333 ?AUTO_2335 )
      ( MAKE-ON ?AUTO_2333 ?AUTO_2334 )
      ( MAKE-ON-VERIFY ?AUTO_2333 ?AUTO_2334 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2336 - BLOCK
      ?AUTO_2337 - BLOCK
    )
    :vars
    (
      ?AUTO_2338 - BLOCK
      ?AUTO_2339 - BLOCK
      ?AUTO_2340 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2337 ) ( not ( = ?AUTO_2336 ?AUTO_2337 ) ) ( ON ?AUTO_2336 ?AUTO_2338 ) ( CLEAR ?AUTO_2336 ) ( not ( = ?AUTO_2336 ?AUTO_2338 ) ) ( not ( = ?AUTO_2337 ?AUTO_2338 ) ) ( HOLDING ?AUTO_2339 ) ( CLEAR ?AUTO_2340 ) ( not ( = ?AUTO_2336 ?AUTO_2339 ) ) ( not ( = ?AUTO_2336 ?AUTO_2340 ) ) ( not ( = ?AUTO_2337 ?AUTO_2339 ) ) ( not ( = ?AUTO_2337 ?AUTO_2340 ) ) ( not ( = ?AUTO_2338 ?AUTO_2339 ) ) ( not ( = ?AUTO_2338 ?AUTO_2340 ) ) ( not ( = ?AUTO_2339 ?AUTO_2340 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2339 ?AUTO_2340 )
      ( MAKE-ON ?AUTO_2336 ?AUTO_2337 )
      ( MAKE-ON-VERIFY ?AUTO_2336 ?AUTO_2337 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2341 - BLOCK
      ?AUTO_2342 - BLOCK
    )
    :vars
    (
      ?AUTO_2343 - BLOCK
      ?AUTO_2344 - BLOCK
      ?AUTO_2345 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2341 ?AUTO_2342 ) ) ( ON ?AUTO_2341 ?AUTO_2343 ) ( CLEAR ?AUTO_2341 ) ( not ( = ?AUTO_2341 ?AUTO_2343 ) ) ( not ( = ?AUTO_2342 ?AUTO_2343 ) ) ( CLEAR ?AUTO_2344 ) ( not ( = ?AUTO_2341 ?AUTO_2345 ) ) ( not ( = ?AUTO_2341 ?AUTO_2344 ) ) ( not ( = ?AUTO_2342 ?AUTO_2345 ) ) ( not ( = ?AUTO_2342 ?AUTO_2344 ) ) ( not ( = ?AUTO_2343 ?AUTO_2345 ) ) ( not ( = ?AUTO_2343 ?AUTO_2344 ) ) ( not ( = ?AUTO_2345 ?AUTO_2344 ) ) ( ON ?AUTO_2345 ?AUTO_2342 ) ( CLEAR ?AUTO_2345 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2345 ?AUTO_2342 )
      ( MAKE-ON ?AUTO_2341 ?AUTO_2342 )
      ( MAKE-ON-VERIFY ?AUTO_2341 ?AUTO_2342 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2346 - BLOCK
      ?AUTO_2347 - BLOCK
    )
    :vars
    (
      ?AUTO_2350 - BLOCK
      ?AUTO_2348 - BLOCK
      ?AUTO_2349 - BLOCK
      ?AUTO_2351 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2346 ?AUTO_2347 ) ) ( ON ?AUTO_2346 ?AUTO_2350 ) ( CLEAR ?AUTO_2346 ) ( not ( = ?AUTO_2346 ?AUTO_2350 ) ) ( not ( = ?AUTO_2347 ?AUTO_2350 ) ) ( CLEAR ?AUTO_2348 ) ( not ( = ?AUTO_2346 ?AUTO_2349 ) ) ( not ( = ?AUTO_2346 ?AUTO_2348 ) ) ( not ( = ?AUTO_2347 ?AUTO_2349 ) ) ( not ( = ?AUTO_2347 ?AUTO_2348 ) ) ( not ( = ?AUTO_2350 ?AUTO_2349 ) ) ( not ( = ?AUTO_2350 ?AUTO_2348 ) ) ( not ( = ?AUTO_2349 ?AUTO_2348 ) ) ( ON ?AUTO_2349 ?AUTO_2347 ) ( CLEAR ?AUTO_2349 ) ( HOLDING ?AUTO_2351 ) ( not ( = ?AUTO_2346 ?AUTO_2351 ) ) ( not ( = ?AUTO_2347 ?AUTO_2351 ) ) ( not ( = ?AUTO_2350 ?AUTO_2351 ) ) ( not ( = ?AUTO_2348 ?AUTO_2351 ) ) ( not ( = ?AUTO_2349 ?AUTO_2351 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2351 )
      ( MAKE-ON ?AUTO_2346 ?AUTO_2347 )
      ( MAKE-ON-VERIFY ?AUTO_2346 ?AUTO_2347 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2352 - BLOCK
      ?AUTO_2353 - BLOCK
    )
    :vars
    (
      ?AUTO_2356 - BLOCK
      ?AUTO_2354 - BLOCK
      ?AUTO_2355 - BLOCK
      ?AUTO_2357 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2352 ?AUTO_2353 ) ) ( ON ?AUTO_2352 ?AUTO_2356 ) ( CLEAR ?AUTO_2352 ) ( not ( = ?AUTO_2352 ?AUTO_2356 ) ) ( not ( = ?AUTO_2353 ?AUTO_2356 ) ) ( CLEAR ?AUTO_2354 ) ( not ( = ?AUTO_2352 ?AUTO_2355 ) ) ( not ( = ?AUTO_2352 ?AUTO_2354 ) ) ( not ( = ?AUTO_2353 ?AUTO_2355 ) ) ( not ( = ?AUTO_2353 ?AUTO_2354 ) ) ( not ( = ?AUTO_2356 ?AUTO_2355 ) ) ( not ( = ?AUTO_2356 ?AUTO_2354 ) ) ( not ( = ?AUTO_2355 ?AUTO_2354 ) ) ( ON ?AUTO_2355 ?AUTO_2353 ) ( not ( = ?AUTO_2352 ?AUTO_2357 ) ) ( not ( = ?AUTO_2353 ?AUTO_2357 ) ) ( not ( = ?AUTO_2356 ?AUTO_2357 ) ) ( not ( = ?AUTO_2354 ?AUTO_2357 ) ) ( not ( = ?AUTO_2355 ?AUTO_2357 ) ) ( ON ?AUTO_2357 ?AUTO_2355 ) ( CLEAR ?AUTO_2357 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2357 ?AUTO_2355 )
      ( MAKE-ON ?AUTO_2352 ?AUTO_2353 )
      ( MAKE-ON-VERIFY ?AUTO_2352 ?AUTO_2353 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2358 - BLOCK
      ?AUTO_2359 - BLOCK
    )
    :vars
    (
      ?AUTO_2362 - BLOCK
      ?AUTO_2363 - BLOCK
      ?AUTO_2361 - BLOCK
      ?AUTO_2360 - BLOCK
      ?AUTO_2364 - BLOCK
      ?AUTO_2365 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2358 ?AUTO_2359 ) ) ( ON ?AUTO_2358 ?AUTO_2362 ) ( CLEAR ?AUTO_2358 ) ( not ( = ?AUTO_2358 ?AUTO_2362 ) ) ( not ( = ?AUTO_2359 ?AUTO_2362 ) ) ( CLEAR ?AUTO_2363 ) ( not ( = ?AUTO_2358 ?AUTO_2361 ) ) ( not ( = ?AUTO_2358 ?AUTO_2363 ) ) ( not ( = ?AUTO_2359 ?AUTO_2361 ) ) ( not ( = ?AUTO_2359 ?AUTO_2363 ) ) ( not ( = ?AUTO_2362 ?AUTO_2361 ) ) ( not ( = ?AUTO_2362 ?AUTO_2363 ) ) ( not ( = ?AUTO_2361 ?AUTO_2363 ) ) ( ON ?AUTO_2361 ?AUTO_2359 ) ( not ( = ?AUTO_2358 ?AUTO_2360 ) ) ( not ( = ?AUTO_2359 ?AUTO_2360 ) ) ( not ( = ?AUTO_2362 ?AUTO_2360 ) ) ( not ( = ?AUTO_2363 ?AUTO_2360 ) ) ( not ( = ?AUTO_2361 ?AUTO_2360 ) ) ( ON ?AUTO_2360 ?AUTO_2361 ) ( CLEAR ?AUTO_2360 ) ( HOLDING ?AUTO_2364 ) ( CLEAR ?AUTO_2365 ) ( not ( = ?AUTO_2358 ?AUTO_2364 ) ) ( not ( = ?AUTO_2358 ?AUTO_2365 ) ) ( not ( = ?AUTO_2359 ?AUTO_2364 ) ) ( not ( = ?AUTO_2359 ?AUTO_2365 ) ) ( not ( = ?AUTO_2362 ?AUTO_2364 ) ) ( not ( = ?AUTO_2362 ?AUTO_2365 ) ) ( not ( = ?AUTO_2363 ?AUTO_2364 ) ) ( not ( = ?AUTO_2363 ?AUTO_2365 ) ) ( not ( = ?AUTO_2361 ?AUTO_2364 ) ) ( not ( = ?AUTO_2361 ?AUTO_2365 ) ) ( not ( = ?AUTO_2360 ?AUTO_2364 ) ) ( not ( = ?AUTO_2360 ?AUTO_2365 ) ) ( not ( = ?AUTO_2364 ?AUTO_2365 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2364 ?AUTO_2365 )
      ( MAKE-ON ?AUTO_2358 ?AUTO_2359 )
      ( MAKE-ON-VERIFY ?AUTO_2358 ?AUTO_2359 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2366 - BLOCK
      ?AUTO_2367 - BLOCK
    )
    :vars
    (
      ?AUTO_2373 - BLOCK
      ?AUTO_2368 - BLOCK
      ?AUTO_2371 - BLOCK
      ?AUTO_2372 - BLOCK
      ?AUTO_2369 - BLOCK
      ?AUTO_2370 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2366 ?AUTO_2367 ) ) ( ON ?AUTO_2366 ?AUTO_2373 ) ( not ( = ?AUTO_2366 ?AUTO_2373 ) ) ( not ( = ?AUTO_2367 ?AUTO_2373 ) ) ( CLEAR ?AUTO_2368 ) ( not ( = ?AUTO_2366 ?AUTO_2371 ) ) ( not ( = ?AUTO_2366 ?AUTO_2368 ) ) ( not ( = ?AUTO_2367 ?AUTO_2371 ) ) ( not ( = ?AUTO_2367 ?AUTO_2368 ) ) ( not ( = ?AUTO_2373 ?AUTO_2371 ) ) ( not ( = ?AUTO_2373 ?AUTO_2368 ) ) ( not ( = ?AUTO_2371 ?AUTO_2368 ) ) ( ON ?AUTO_2371 ?AUTO_2367 ) ( not ( = ?AUTO_2366 ?AUTO_2372 ) ) ( not ( = ?AUTO_2367 ?AUTO_2372 ) ) ( not ( = ?AUTO_2373 ?AUTO_2372 ) ) ( not ( = ?AUTO_2368 ?AUTO_2372 ) ) ( not ( = ?AUTO_2371 ?AUTO_2372 ) ) ( ON ?AUTO_2372 ?AUTO_2371 ) ( CLEAR ?AUTO_2372 ) ( CLEAR ?AUTO_2369 ) ( not ( = ?AUTO_2366 ?AUTO_2370 ) ) ( not ( = ?AUTO_2366 ?AUTO_2369 ) ) ( not ( = ?AUTO_2367 ?AUTO_2370 ) ) ( not ( = ?AUTO_2367 ?AUTO_2369 ) ) ( not ( = ?AUTO_2373 ?AUTO_2370 ) ) ( not ( = ?AUTO_2373 ?AUTO_2369 ) ) ( not ( = ?AUTO_2368 ?AUTO_2370 ) ) ( not ( = ?AUTO_2368 ?AUTO_2369 ) ) ( not ( = ?AUTO_2371 ?AUTO_2370 ) ) ( not ( = ?AUTO_2371 ?AUTO_2369 ) ) ( not ( = ?AUTO_2372 ?AUTO_2370 ) ) ( not ( = ?AUTO_2372 ?AUTO_2369 ) ) ( not ( = ?AUTO_2370 ?AUTO_2369 ) ) ( ON ?AUTO_2370 ?AUTO_2366 ) ( CLEAR ?AUTO_2370 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2370 ?AUTO_2366 )
      ( MAKE-ON ?AUTO_2366 ?AUTO_2367 )
      ( MAKE-ON-VERIFY ?AUTO_2366 ?AUTO_2367 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2374 - BLOCK
      ?AUTO_2375 - BLOCK
    )
    :vars
    (
      ?AUTO_2379 - BLOCK
      ?AUTO_2380 - BLOCK
      ?AUTO_2378 - BLOCK
      ?AUTO_2376 - BLOCK
      ?AUTO_2377 - BLOCK
      ?AUTO_2381 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2374 ?AUTO_2375 ) ) ( ON ?AUTO_2374 ?AUTO_2379 ) ( not ( = ?AUTO_2374 ?AUTO_2379 ) ) ( not ( = ?AUTO_2375 ?AUTO_2379 ) ) ( not ( = ?AUTO_2374 ?AUTO_2380 ) ) ( not ( = ?AUTO_2374 ?AUTO_2378 ) ) ( not ( = ?AUTO_2375 ?AUTO_2380 ) ) ( not ( = ?AUTO_2375 ?AUTO_2378 ) ) ( not ( = ?AUTO_2379 ?AUTO_2380 ) ) ( not ( = ?AUTO_2379 ?AUTO_2378 ) ) ( not ( = ?AUTO_2380 ?AUTO_2378 ) ) ( ON ?AUTO_2380 ?AUTO_2375 ) ( not ( = ?AUTO_2374 ?AUTO_2376 ) ) ( not ( = ?AUTO_2375 ?AUTO_2376 ) ) ( not ( = ?AUTO_2379 ?AUTO_2376 ) ) ( not ( = ?AUTO_2378 ?AUTO_2376 ) ) ( not ( = ?AUTO_2380 ?AUTO_2376 ) ) ( ON ?AUTO_2376 ?AUTO_2380 ) ( CLEAR ?AUTO_2376 ) ( CLEAR ?AUTO_2377 ) ( not ( = ?AUTO_2374 ?AUTO_2381 ) ) ( not ( = ?AUTO_2374 ?AUTO_2377 ) ) ( not ( = ?AUTO_2375 ?AUTO_2381 ) ) ( not ( = ?AUTO_2375 ?AUTO_2377 ) ) ( not ( = ?AUTO_2379 ?AUTO_2381 ) ) ( not ( = ?AUTO_2379 ?AUTO_2377 ) ) ( not ( = ?AUTO_2378 ?AUTO_2381 ) ) ( not ( = ?AUTO_2378 ?AUTO_2377 ) ) ( not ( = ?AUTO_2380 ?AUTO_2381 ) ) ( not ( = ?AUTO_2380 ?AUTO_2377 ) ) ( not ( = ?AUTO_2376 ?AUTO_2381 ) ) ( not ( = ?AUTO_2376 ?AUTO_2377 ) ) ( not ( = ?AUTO_2381 ?AUTO_2377 ) ) ( ON ?AUTO_2381 ?AUTO_2374 ) ( CLEAR ?AUTO_2381 ) ( HOLDING ?AUTO_2378 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2378 )
      ( MAKE-ON ?AUTO_2374 ?AUTO_2375 )
      ( MAKE-ON-VERIFY ?AUTO_2374 ?AUTO_2375 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2386 - BLOCK
      ?AUTO_2387 - BLOCK
    )
    :vars
    (
      ?AUTO_2390 - BLOCK
      ?AUTO_2392 - BLOCK
      ?AUTO_2389 - BLOCK
      ?AUTO_2391 - BLOCK
      ?AUTO_2393 - BLOCK
      ?AUTO_2388 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2386 ?AUTO_2387 ) ) ( ON ?AUTO_2386 ?AUTO_2390 ) ( not ( = ?AUTO_2386 ?AUTO_2390 ) ) ( not ( = ?AUTO_2387 ?AUTO_2390 ) ) ( not ( = ?AUTO_2386 ?AUTO_2392 ) ) ( not ( = ?AUTO_2386 ?AUTO_2389 ) ) ( not ( = ?AUTO_2387 ?AUTO_2392 ) ) ( not ( = ?AUTO_2387 ?AUTO_2389 ) ) ( not ( = ?AUTO_2390 ?AUTO_2392 ) ) ( not ( = ?AUTO_2390 ?AUTO_2389 ) ) ( not ( = ?AUTO_2392 ?AUTO_2389 ) ) ( ON ?AUTO_2392 ?AUTO_2387 ) ( not ( = ?AUTO_2386 ?AUTO_2391 ) ) ( not ( = ?AUTO_2387 ?AUTO_2391 ) ) ( not ( = ?AUTO_2390 ?AUTO_2391 ) ) ( not ( = ?AUTO_2389 ?AUTO_2391 ) ) ( not ( = ?AUTO_2392 ?AUTO_2391 ) ) ( ON ?AUTO_2391 ?AUTO_2392 ) ( CLEAR ?AUTO_2393 ) ( not ( = ?AUTO_2386 ?AUTO_2388 ) ) ( not ( = ?AUTO_2386 ?AUTO_2393 ) ) ( not ( = ?AUTO_2387 ?AUTO_2388 ) ) ( not ( = ?AUTO_2387 ?AUTO_2393 ) ) ( not ( = ?AUTO_2390 ?AUTO_2388 ) ) ( not ( = ?AUTO_2390 ?AUTO_2393 ) ) ( not ( = ?AUTO_2389 ?AUTO_2388 ) ) ( not ( = ?AUTO_2389 ?AUTO_2393 ) ) ( not ( = ?AUTO_2392 ?AUTO_2388 ) ) ( not ( = ?AUTO_2392 ?AUTO_2393 ) ) ( not ( = ?AUTO_2391 ?AUTO_2388 ) ) ( not ( = ?AUTO_2391 ?AUTO_2393 ) ) ( not ( = ?AUTO_2388 ?AUTO_2393 ) ) ( ON ?AUTO_2388 ?AUTO_2386 ) ( CLEAR ?AUTO_2388 ) ( ON ?AUTO_2389 ?AUTO_2391 ) ( CLEAR ?AUTO_2389 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2389 ?AUTO_2391 )
      ( MAKE-ON ?AUTO_2386 ?AUTO_2387 )
      ( MAKE-ON-VERIFY ?AUTO_2386 ?AUTO_2387 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2396 - BLOCK
      ?AUTO_2397 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2396 ) ( CLEAR ?AUTO_2397 ) ( not ( = ?AUTO_2396 ?AUTO_2397 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2396 ?AUTO_2397 )
      ( MAKE-ON-VERIFY ?AUTO_2396 ?AUTO_2397 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2398 - BLOCK
      ?AUTO_2399 - BLOCK
    )
    :vars
    (
      ?AUTO_2400 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2399 ) ( not ( = ?AUTO_2398 ?AUTO_2399 ) ) ( ON ?AUTO_2398 ?AUTO_2400 ) ( CLEAR ?AUTO_2398 ) ( HAND-EMPTY ) ( not ( = ?AUTO_2398 ?AUTO_2400 ) ) ( not ( = ?AUTO_2399 ?AUTO_2400 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2398 ?AUTO_2400 )
      ( MAKE-ON ?AUTO_2398 ?AUTO_2399 )
      ( MAKE-ON-VERIFY ?AUTO_2398 ?AUTO_2399 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2401 - BLOCK
      ?AUTO_2402 - BLOCK
    )
    :vars
    (
      ?AUTO_2403 - BLOCK
      ?AUTO_2404 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2401 ?AUTO_2402 ) ) ( ON ?AUTO_2401 ?AUTO_2403 ) ( CLEAR ?AUTO_2401 ) ( not ( = ?AUTO_2401 ?AUTO_2403 ) ) ( not ( = ?AUTO_2402 ?AUTO_2403 ) ) ( HOLDING ?AUTO_2402 ) ( CLEAR ?AUTO_2404 ) ( not ( = ?AUTO_2401 ?AUTO_2404 ) ) ( not ( = ?AUTO_2402 ?AUTO_2404 ) ) ( not ( = ?AUTO_2403 ?AUTO_2404 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2402 ?AUTO_2404 )
      ( MAKE-ON ?AUTO_2401 ?AUTO_2402 )
      ( MAKE-ON-VERIFY ?AUTO_2401 ?AUTO_2402 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2405 - BLOCK
      ?AUTO_2406 - BLOCK
    )
    :vars
    (
      ?AUTO_2407 - BLOCK
      ?AUTO_2408 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2405 ?AUTO_2406 ) ) ( ON ?AUTO_2405 ?AUTO_2407 ) ( not ( = ?AUTO_2405 ?AUTO_2407 ) ) ( not ( = ?AUTO_2406 ?AUTO_2407 ) ) ( CLEAR ?AUTO_2408 ) ( not ( = ?AUTO_2405 ?AUTO_2408 ) ) ( not ( = ?AUTO_2406 ?AUTO_2408 ) ) ( not ( = ?AUTO_2407 ?AUTO_2408 ) ) ( ON ?AUTO_2406 ?AUTO_2405 ) ( CLEAR ?AUTO_2406 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2406 ?AUTO_2405 )
      ( MAKE-ON ?AUTO_2405 ?AUTO_2406 )
      ( MAKE-ON-VERIFY ?AUTO_2405 ?AUTO_2406 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2409 - BLOCK
      ?AUTO_2410 - BLOCK
    )
    :vars
    (
      ?AUTO_2411 - BLOCK
      ?AUTO_2412 - BLOCK
      ?AUTO_2413 - BLOCK
      ?AUTO_2414 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2409 ?AUTO_2410 ) ) ( ON ?AUTO_2409 ?AUTO_2411 ) ( not ( = ?AUTO_2409 ?AUTO_2411 ) ) ( not ( = ?AUTO_2410 ?AUTO_2411 ) ) ( CLEAR ?AUTO_2412 ) ( not ( = ?AUTO_2409 ?AUTO_2412 ) ) ( not ( = ?AUTO_2410 ?AUTO_2412 ) ) ( not ( = ?AUTO_2411 ?AUTO_2412 ) ) ( ON ?AUTO_2410 ?AUTO_2409 ) ( CLEAR ?AUTO_2410 ) ( HOLDING ?AUTO_2413 ) ( CLEAR ?AUTO_2414 ) ( not ( = ?AUTO_2409 ?AUTO_2413 ) ) ( not ( = ?AUTO_2409 ?AUTO_2414 ) ) ( not ( = ?AUTO_2410 ?AUTO_2413 ) ) ( not ( = ?AUTO_2410 ?AUTO_2414 ) ) ( not ( = ?AUTO_2411 ?AUTO_2413 ) ) ( not ( = ?AUTO_2411 ?AUTO_2414 ) ) ( not ( = ?AUTO_2412 ?AUTO_2413 ) ) ( not ( = ?AUTO_2412 ?AUTO_2414 ) ) ( not ( = ?AUTO_2413 ?AUTO_2414 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2413 ?AUTO_2414 )
      ( MAKE-ON ?AUTO_2409 ?AUTO_2410 )
      ( MAKE-ON-VERIFY ?AUTO_2409 ?AUTO_2410 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2423 - BLOCK
      ?AUTO_2424 - BLOCK
    )
    :vars
    (
      ?AUTO_2425 - BLOCK
      ?AUTO_2426 - BLOCK
      ?AUTO_2428 - BLOCK
      ?AUTO_2427 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2423 ?AUTO_2424 ) ) ( ON ?AUTO_2423 ?AUTO_2425 ) ( not ( = ?AUTO_2423 ?AUTO_2425 ) ) ( not ( = ?AUTO_2424 ?AUTO_2425 ) ) ( CLEAR ?AUTO_2426 ) ( not ( = ?AUTO_2423 ?AUTO_2426 ) ) ( not ( = ?AUTO_2424 ?AUTO_2426 ) ) ( not ( = ?AUTO_2425 ?AUTO_2426 ) ) ( ON ?AUTO_2424 ?AUTO_2423 ) ( CLEAR ?AUTO_2428 ) ( not ( = ?AUTO_2423 ?AUTO_2427 ) ) ( not ( = ?AUTO_2423 ?AUTO_2428 ) ) ( not ( = ?AUTO_2424 ?AUTO_2427 ) ) ( not ( = ?AUTO_2424 ?AUTO_2428 ) ) ( not ( = ?AUTO_2425 ?AUTO_2427 ) ) ( not ( = ?AUTO_2425 ?AUTO_2428 ) ) ( not ( = ?AUTO_2426 ?AUTO_2427 ) ) ( not ( = ?AUTO_2426 ?AUTO_2428 ) ) ( not ( = ?AUTO_2427 ?AUTO_2428 ) ) ( ON ?AUTO_2427 ?AUTO_2424 ) ( CLEAR ?AUTO_2427 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2427 ?AUTO_2424 )
      ( MAKE-ON ?AUTO_2423 ?AUTO_2424 )
      ( MAKE-ON-VERIFY ?AUTO_2423 ?AUTO_2424 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2429 - BLOCK
      ?AUTO_2430 - BLOCK
    )
    :vars
    (
      ?AUTO_2432 - BLOCK
      ?AUTO_2431 - BLOCK
      ?AUTO_2434 - BLOCK
      ?AUTO_2433 - BLOCK
      ?AUTO_2435 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2429 ?AUTO_2430 ) ) ( ON ?AUTO_2429 ?AUTO_2432 ) ( not ( = ?AUTO_2429 ?AUTO_2432 ) ) ( not ( = ?AUTO_2430 ?AUTO_2432 ) ) ( CLEAR ?AUTO_2431 ) ( not ( = ?AUTO_2429 ?AUTO_2431 ) ) ( not ( = ?AUTO_2430 ?AUTO_2431 ) ) ( not ( = ?AUTO_2432 ?AUTO_2431 ) ) ( ON ?AUTO_2430 ?AUTO_2429 ) ( CLEAR ?AUTO_2434 ) ( not ( = ?AUTO_2429 ?AUTO_2433 ) ) ( not ( = ?AUTO_2429 ?AUTO_2434 ) ) ( not ( = ?AUTO_2430 ?AUTO_2433 ) ) ( not ( = ?AUTO_2430 ?AUTO_2434 ) ) ( not ( = ?AUTO_2432 ?AUTO_2433 ) ) ( not ( = ?AUTO_2432 ?AUTO_2434 ) ) ( not ( = ?AUTO_2431 ?AUTO_2433 ) ) ( not ( = ?AUTO_2431 ?AUTO_2434 ) ) ( not ( = ?AUTO_2433 ?AUTO_2434 ) ) ( ON ?AUTO_2433 ?AUTO_2430 ) ( CLEAR ?AUTO_2433 ) ( HOLDING ?AUTO_2435 ) ( not ( = ?AUTO_2429 ?AUTO_2435 ) ) ( not ( = ?AUTO_2430 ?AUTO_2435 ) ) ( not ( = ?AUTO_2432 ?AUTO_2435 ) ) ( not ( = ?AUTO_2431 ?AUTO_2435 ) ) ( not ( = ?AUTO_2434 ?AUTO_2435 ) ) ( not ( = ?AUTO_2433 ?AUTO_2435 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2435 )
      ( MAKE-ON ?AUTO_2429 ?AUTO_2430 )
      ( MAKE-ON-VERIFY ?AUTO_2429 ?AUTO_2430 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2444 - BLOCK
      ?AUTO_2445 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2444 ) ( CLEAR ?AUTO_2445 ) ( not ( = ?AUTO_2444 ?AUTO_2445 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2444 ?AUTO_2445 )
      ( MAKE-ON-VERIFY ?AUTO_2444 ?AUTO_2445 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2446 - BLOCK
      ?AUTO_2447 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2447 ) ( not ( = ?AUTO_2446 ?AUTO_2447 ) ) ( ON-TABLE ?AUTO_2446 ) ( CLEAR ?AUTO_2446 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_2446 )
      ( MAKE-ON ?AUTO_2446 ?AUTO_2447 )
      ( MAKE-ON-VERIFY ?AUTO_2446 ?AUTO_2447 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2448 - BLOCK
      ?AUTO_2449 - BLOCK
    )
    :vars
    (
      ?AUTO_2450 - BLOCK
      ?AUTO_2451 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2449 ) ( not ( = ?AUTO_2448 ?AUTO_2449 ) ) ( ON-TABLE ?AUTO_2448 ) ( CLEAR ?AUTO_2448 ) ( HOLDING ?AUTO_2450 ) ( CLEAR ?AUTO_2451 ) ( not ( = ?AUTO_2448 ?AUTO_2450 ) ) ( not ( = ?AUTO_2448 ?AUTO_2451 ) ) ( not ( = ?AUTO_2449 ?AUTO_2450 ) ) ( not ( = ?AUTO_2449 ?AUTO_2451 ) ) ( not ( = ?AUTO_2450 ?AUTO_2451 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2450 ?AUTO_2451 )
      ( MAKE-ON ?AUTO_2448 ?AUTO_2449 )
      ( MAKE-ON-VERIFY ?AUTO_2448 ?AUTO_2449 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2452 - BLOCK
      ?AUTO_2453 - BLOCK
    )
    :vars
    (
      ?AUTO_2454 - BLOCK
      ?AUTO_2455 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2452 ?AUTO_2453 ) ) ( ON-TABLE ?AUTO_2452 ) ( CLEAR ?AUTO_2452 ) ( CLEAR ?AUTO_2454 ) ( not ( = ?AUTO_2452 ?AUTO_2455 ) ) ( not ( = ?AUTO_2452 ?AUTO_2454 ) ) ( not ( = ?AUTO_2453 ?AUTO_2455 ) ) ( not ( = ?AUTO_2453 ?AUTO_2454 ) ) ( not ( = ?AUTO_2455 ?AUTO_2454 ) ) ( ON ?AUTO_2455 ?AUTO_2453 ) ( CLEAR ?AUTO_2455 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2455 ?AUTO_2453 )
      ( MAKE-ON ?AUTO_2452 ?AUTO_2453 )
      ( MAKE-ON-VERIFY ?AUTO_2452 ?AUTO_2453 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2456 - BLOCK
      ?AUTO_2457 - BLOCK
    )
    :vars
    (
      ?AUTO_2459 - BLOCK
      ?AUTO_2458 - BLOCK
      ?AUTO_2460 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2456 ?AUTO_2457 ) ) ( ON-TABLE ?AUTO_2456 ) ( CLEAR ?AUTO_2456 ) ( not ( = ?AUTO_2456 ?AUTO_2459 ) ) ( not ( = ?AUTO_2456 ?AUTO_2458 ) ) ( not ( = ?AUTO_2457 ?AUTO_2459 ) ) ( not ( = ?AUTO_2457 ?AUTO_2458 ) ) ( not ( = ?AUTO_2459 ?AUTO_2458 ) ) ( ON ?AUTO_2459 ?AUTO_2457 ) ( CLEAR ?AUTO_2459 ) ( HOLDING ?AUTO_2458 ) ( CLEAR ?AUTO_2460 ) ( not ( = ?AUTO_2456 ?AUTO_2460 ) ) ( not ( = ?AUTO_2457 ?AUTO_2460 ) ) ( not ( = ?AUTO_2459 ?AUTO_2460 ) ) ( not ( = ?AUTO_2458 ?AUTO_2460 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2458 ?AUTO_2460 )
      ( MAKE-ON ?AUTO_2456 ?AUTO_2457 )
      ( MAKE-ON-VERIFY ?AUTO_2456 ?AUTO_2457 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2461 - BLOCK
      ?AUTO_2462 - BLOCK
    )
    :vars
    (
      ?AUTO_2463 - BLOCK
      ?AUTO_2464 - BLOCK
      ?AUTO_2465 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2461 ?AUTO_2462 ) ) ( ON-TABLE ?AUTO_2461 ) ( CLEAR ?AUTO_2461 ) ( not ( = ?AUTO_2461 ?AUTO_2463 ) ) ( not ( = ?AUTO_2461 ?AUTO_2464 ) ) ( not ( = ?AUTO_2462 ?AUTO_2463 ) ) ( not ( = ?AUTO_2462 ?AUTO_2464 ) ) ( not ( = ?AUTO_2463 ?AUTO_2464 ) ) ( ON ?AUTO_2463 ?AUTO_2462 ) ( CLEAR ?AUTO_2465 ) ( not ( = ?AUTO_2461 ?AUTO_2465 ) ) ( not ( = ?AUTO_2462 ?AUTO_2465 ) ) ( not ( = ?AUTO_2463 ?AUTO_2465 ) ) ( not ( = ?AUTO_2464 ?AUTO_2465 ) ) ( ON ?AUTO_2464 ?AUTO_2463 ) ( CLEAR ?AUTO_2464 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2464 ?AUTO_2463 )
      ( MAKE-ON ?AUTO_2461 ?AUTO_2462 )
      ( MAKE-ON-VERIFY ?AUTO_2461 ?AUTO_2462 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2466 - BLOCK
      ?AUTO_2467 - BLOCK
    )
    :vars
    (
      ?AUTO_2468 - BLOCK
      ?AUTO_2469 - BLOCK
      ?AUTO_2470 - BLOCK
      ?AUTO_2471 - BLOCK
      ?AUTO_2472 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2466 ?AUTO_2467 ) ) ( ON-TABLE ?AUTO_2466 ) ( CLEAR ?AUTO_2466 ) ( not ( = ?AUTO_2466 ?AUTO_2468 ) ) ( not ( = ?AUTO_2466 ?AUTO_2469 ) ) ( not ( = ?AUTO_2467 ?AUTO_2468 ) ) ( not ( = ?AUTO_2467 ?AUTO_2469 ) ) ( not ( = ?AUTO_2468 ?AUTO_2469 ) ) ( ON ?AUTO_2468 ?AUTO_2467 ) ( CLEAR ?AUTO_2470 ) ( not ( = ?AUTO_2466 ?AUTO_2470 ) ) ( not ( = ?AUTO_2467 ?AUTO_2470 ) ) ( not ( = ?AUTO_2468 ?AUTO_2470 ) ) ( not ( = ?AUTO_2469 ?AUTO_2470 ) ) ( ON ?AUTO_2469 ?AUTO_2468 ) ( CLEAR ?AUTO_2469 ) ( HOLDING ?AUTO_2471 ) ( CLEAR ?AUTO_2472 ) ( not ( = ?AUTO_2466 ?AUTO_2471 ) ) ( not ( = ?AUTO_2466 ?AUTO_2472 ) ) ( not ( = ?AUTO_2467 ?AUTO_2471 ) ) ( not ( = ?AUTO_2467 ?AUTO_2472 ) ) ( not ( = ?AUTO_2468 ?AUTO_2471 ) ) ( not ( = ?AUTO_2468 ?AUTO_2472 ) ) ( not ( = ?AUTO_2469 ?AUTO_2471 ) ) ( not ( = ?AUTO_2469 ?AUTO_2472 ) ) ( not ( = ?AUTO_2470 ?AUTO_2471 ) ) ( not ( = ?AUTO_2470 ?AUTO_2472 ) ) ( not ( = ?AUTO_2471 ?AUTO_2472 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2471 ?AUTO_2472 )
      ( MAKE-ON ?AUTO_2466 ?AUTO_2467 )
      ( MAKE-ON-VERIFY ?AUTO_2466 ?AUTO_2467 ) )
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
    ( and ( not ( = ?AUTO_2475 ?AUTO_2476 ) ) ( not ( = ?AUTO_2475 ?AUTO_2477 ) ) ( not ( = ?AUTO_2475 ?AUTO_2478 ) ) ( not ( = ?AUTO_2476 ?AUTO_2477 ) ) ( not ( = ?AUTO_2476 ?AUTO_2478 ) ) ( not ( = ?AUTO_2477 ?AUTO_2478 ) ) ( ON ?AUTO_2477 ?AUTO_2476 ) ( CLEAR ?AUTO_2479 ) ( not ( = ?AUTO_2475 ?AUTO_2479 ) ) ( not ( = ?AUTO_2476 ?AUTO_2479 ) ) ( not ( = ?AUTO_2477 ?AUTO_2479 ) ) ( not ( = ?AUTO_2478 ?AUTO_2479 ) ) ( ON ?AUTO_2478 ?AUTO_2477 ) ( CLEAR ?AUTO_2478 ) ( HOLDING ?AUTO_2475 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2475 )
      ( MAKE-ON ?AUTO_2475 ?AUTO_2476 )
      ( MAKE-ON-VERIFY ?AUTO_2475 ?AUTO_2476 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2484 - BLOCK
      ?AUTO_2485 - BLOCK
    )
    :vars
    (
      ?AUTO_2486 - BLOCK
      ?AUTO_2490 - BLOCK
      ?AUTO_2488 - BLOCK
      ?AUTO_2487 - BLOCK
      ?AUTO_2491 - BLOCK
      ?AUTO_2489 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2484 ?AUTO_2485 ) ) ( ON ?AUTO_2484 ?AUTO_2486 ) ( CLEAR ?AUTO_2484 ) ( not ( = ?AUTO_2484 ?AUTO_2486 ) ) ( not ( = ?AUTO_2485 ?AUTO_2486 ) ) ( CLEAR ?AUTO_2490 ) ( not ( = ?AUTO_2484 ?AUTO_2488 ) ) ( not ( = ?AUTO_2484 ?AUTO_2490 ) ) ( not ( = ?AUTO_2485 ?AUTO_2488 ) ) ( not ( = ?AUTO_2485 ?AUTO_2490 ) ) ( not ( = ?AUTO_2486 ?AUTO_2488 ) ) ( not ( = ?AUTO_2486 ?AUTO_2490 ) ) ( not ( = ?AUTO_2488 ?AUTO_2490 ) ) ( ON ?AUTO_2488 ?AUTO_2485 ) ( not ( = ?AUTO_2484 ?AUTO_2487 ) ) ( not ( = ?AUTO_2485 ?AUTO_2487 ) ) ( not ( = ?AUTO_2486 ?AUTO_2487 ) ) ( not ( = ?AUTO_2490 ?AUTO_2487 ) ) ( not ( = ?AUTO_2488 ?AUTO_2487 ) ) ( ON ?AUTO_2487 ?AUTO_2488 ) ( CLEAR ?AUTO_2491 ) ( not ( = ?AUTO_2484 ?AUTO_2489 ) ) ( not ( = ?AUTO_2484 ?AUTO_2491 ) ) ( not ( = ?AUTO_2485 ?AUTO_2489 ) ) ( not ( = ?AUTO_2485 ?AUTO_2491 ) ) ( not ( = ?AUTO_2486 ?AUTO_2489 ) ) ( not ( = ?AUTO_2486 ?AUTO_2491 ) ) ( not ( = ?AUTO_2490 ?AUTO_2489 ) ) ( not ( = ?AUTO_2490 ?AUTO_2491 ) ) ( not ( = ?AUTO_2488 ?AUTO_2489 ) ) ( not ( = ?AUTO_2488 ?AUTO_2491 ) ) ( not ( = ?AUTO_2487 ?AUTO_2489 ) ) ( not ( = ?AUTO_2487 ?AUTO_2491 ) ) ( not ( = ?AUTO_2489 ?AUTO_2491 ) ) ( ON ?AUTO_2489 ?AUTO_2487 ) ( CLEAR ?AUTO_2489 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2489 ?AUTO_2487 )
      ( MAKE-ON ?AUTO_2484 ?AUTO_2485 )
      ( MAKE-ON-VERIFY ?AUTO_2484 ?AUTO_2485 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2492 - BLOCK
      ?AUTO_2493 - BLOCK
    )
    :vars
    (
      ?AUTO_2496 - BLOCK
      ?AUTO_2497 - BLOCK
      ?AUTO_2494 - BLOCK
      ?AUTO_2495 - BLOCK
      ?AUTO_2499 - BLOCK
      ?AUTO_2498 - BLOCK
      ?AUTO_2500 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2492 ?AUTO_2493 ) ) ( ON ?AUTO_2492 ?AUTO_2496 ) ( CLEAR ?AUTO_2492 ) ( not ( = ?AUTO_2492 ?AUTO_2496 ) ) ( not ( = ?AUTO_2493 ?AUTO_2496 ) ) ( CLEAR ?AUTO_2497 ) ( not ( = ?AUTO_2492 ?AUTO_2494 ) ) ( not ( = ?AUTO_2492 ?AUTO_2497 ) ) ( not ( = ?AUTO_2493 ?AUTO_2494 ) ) ( not ( = ?AUTO_2493 ?AUTO_2497 ) ) ( not ( = ?AUTO_2496 ?AUTO_2494 ) ) ( not ( = ?AUTO_2496 ?AUTO_2497 ) ) ( not ( = ?AUTO_2494 ?AUTO_2497 ) ) ( ON ?AUTO_2494 ?AUTO_2493 ) ( not ( = ?AUTO_2492 ?AUTO_2495 ) ) ( not ( = ?AUTO_2493 ?AUTO_2495 ) ) ( not ( = ?AUTO_2496 ?AUTO_2495 ) ) ( not ( = ?AUTO_2497 ?AUTO_2495 ) ) ( not ( = ?AUTO_2494 ?AUTO_2495 ) ) ( ON ?AUTO_2495 ?AUTO_2494 ) ( CLEAR ?AUTO_2499 ) ( not ( = ?AUTO_2492 ?AUTO_2498 ) ) ( not ( = ?AUTO_2492 ?AUTO_2499 ) ) ( not ( = ?AUTO_2493 ?AUTO_2498 ) ) ( not ( = ?AUTO_2493 ?AUTO_2499 ) ) ( not ( = ?AUTO_2496 ?AUTO_2498 ) ) ( not ( = ?AUTO_2496 ?AUTO_2499 ) ) ( not ( = ?AUTO_2497 ?AUTO_2498 ) ) ( not ( = ?AUTO_2497 ?AUTO_2499 ) ) ( not ( = ?AUTO_2494 ?AUTO_2498 ) ) ( not ( = ?AUTO_2494 ?AUTO_2499 ) ) ( not ( = ?AUTO_2495 ?AUTO_2498 ) ) ( not ( = ?AUTO_2495 ?AUTO_2499 ) ) ( not ( = ?AUTO_2498 ?AUTO_2499 ) ) ( ON ?AUTO_2498 ?AUTO_2495 ) ( CLEAR ?AUTO_2498 ) ( HOLDING ?AUTO_2500 ) ( not ( = ?AUTO_2492 ?AUTO_2500 ) ) ( not ( = ?AUTO_2493 ?AUTO_2500 ) ) ( not ( = ?AUTO_2496 ?AUTO_2500 ) ) ( not ( = ?AUTO_2497 ?AUTO_2500 ) ) ( not ( = ?AUTO_2494 ?AUTO_2500 ) ) ( not ( = ?AUTO_2495 ?AUTO_2500 ) ) ( not ( = ?AUTO_2499 ?AUTO_2500 ) ) ( not ( = ?AUTO_2498 ?AUTO_2500 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2500 )
      ( MAKE-ON ?AUTO_2492 ?AUTO_2493 )
      ( MAKE-ON-VERIFY ?AUTO_2492 ?AUTO_2493 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2503 - BLOCK
      ?AUTO_2504 - BLOCK
    )
    :vars
    (
      ?AUTO_2505 - BLOCK
      ?AUTO_2510 - BLOCK
      ?AUTO_2509 - BLOCK
      ?AUTO_2506 - BLOCK
      ?AUTO_2507 - BLOCK
      ?AUTO_2508 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2503 ?AUTO_2504 ) ) ( ON ?AUTO_2503 ?AUTO_2505 ) ( CLEAR ?AUTO_2503 ) ( not ( = ?AUTO_2503 ?AUTO_2505 ) ) ( not ( = ?AUTO_2504 ?AUTO_2505 ) ) ( not ( = ?AUTO_2503 ?AUTO_2510 ) ) ( not ( = ?AUTO_2503 ?AUTO_2509 ) ) ( not ( = ?AUTO_2504 ?AUTO_2510 ) ) ( not ( = ?AUTO_2504 ?AUTO_2509 ) ) ( not ( = ?AUTO_2505 ?AUTO_2510 ) ) ( not ( = ?AUTO_2505 ?AUTO_2509 ) ) ( not ( = ?AUTO_2510 ?AUTO_2509 ) ) ( ON ?AUTO_2510 ?AUTO_2504 ) ( not ( = ?AUTO_2503 ?AUTO_2506 ) ) ( not ( = ?AUTO_2504 ?AUTO_2506 ) ) ( not ( = ?AUTO_2505 ?AUTO_2506 ) ) ( not ( = ?AUTO_2509 ?AUTO_2506 ) ) ( not ( = ?AUTO_2510 ?AUTO_2506 ) ) ( ON ?AUTO_2506 ?AUTO_2510 ) ( CLEAR ?AUTO_2507 ) ( not ( = ?AUTO_2503 ?AUTO_2508 ) ) ( not ( = ?AUTO_2503 ?AUTO_2507 ) ) ( not ( = ?AUTO_2504 ?AUTO_2508 ) ) ( not ( = ?AUTO_2504 ?AUTO_2507 ) ) ( not ( = ?AUTO_2505 ?AUTO_2508 ) ) ( not ( = ?AUTO_2505 ?AUTO_2507 ) ) ( not ( = ?AUTO_2509 ?AUTO_2508 ) ) ( not ( = ?AUTO_2509 ?AUTO_2507 ) ) ( not ( = ?AUTO_2510 ?AUTO_2508 ) ) ( not ( = ?AUTO_2510 ?AUTO_2507 ) ) ( not ( = ?AUTO_2506 ?AUTO_2508 ) ) ( not ( = ?AUTO_2506 ?AUTO_2507 ) ) ( not ( = ?AUTO_2508 ?AUTO_2507 ) ) ( ON ?AUTO_2508 ?AUTO_2506 ) ( CLEAR ?AUTO_2508 ) ( HOLDING ?AUTO_2509 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2509 )
      ( MAKE-ON ?AUTO_2503 ?AUTO_2504 )
      ( MAKE-ON-VERIFY ?AUTO_2503 ?AUTO_2504 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2515 - BLOCK
      ?AUTO_2516 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2515 ) ( CLEAR ?AUTO_2516 ) ( not ( = ?AUTO_2515 ?AUTO_2516 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2515 ?AUTO_2516 )
      ( MAKE-ON-VERIFY ?AUTO_2515 ?AUTO_2516 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2517 - BLOCK
      ?AUTO_2518 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2518 ) ( not ( = ?AUTO_2517 ?AUTO_2518 ) ) ( ON-TABLE ?AUTO_2517 ) ( CLEAR ?AUTO_2517 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_2517 )
      ( MAKE-ON ?AUTO_2517 ?AUTO_2518 )
      ( MAKE-ON-VERIFY ?AUTO_2517 ?AUTO_2518 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2519 - BLOCK
      ?AUTO_2520 - BLOCK
    )
    :vars
    (
      ?AUTO_2521 - BLOCK
      ?AUTO_2522 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2520 ) ( not ( = ?AUTO_2519 ?AUTO_2520 ) ) ( ON-TABLE ?AUTO_2519 ) ( CLEAR ?AUTO_2519 ) ( HOLDING ?AUTO_2521 ) ( CLEAR ?AUTO_2522 ) ( not ( = ?AUTO_2519 ?AUTO_2521 ) ) ( not ( = ?AUTO_2519 ?AUTO_2522 ) ) ( not ( = ?AUTO_2520 ?AUTO_2521 ) ) ( not ( = ?AUTO_2520 ?AUTO_2522 ) ) ( not ( = ?AUTO_2521 ?AUTO_2522 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2521 ?AUTO_2522 )
      ( MAKE-ON ?AUTO_2519 ?AUTO_2520 )
      ( MAKE-ON-VERIFY ?AUTO_2519 ?AUTO_2520 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2533 - BLOCK
      ?AUTO_2534 - BLOCK
    )
    :vars
    (
      ?AUTO_2535 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2533 ?AUTO_2534 ) ) ( ON-TABLE ?AUTO_2533 ) ( CLEAR ?AUTO_2533 ) ( HOLDING ?AUTO_2534 ) ( CLEAR ?AUTO_2535 ) ( not ( = ?AUTO_2533 ?AUTO_2535 ) ) ( not ( = ?AUTO_2534 ?AUTO_2535 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2534 ?AUTO_2535 )
      ( MAKE-ON ?AUTO_2533 ?AUTO_2534 )
      ( MAKE-ON-VERIFY ?AUTO_2533 ?AUTO_2534 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2548 - BLOCK
      ?AUTO_2549 - BLOCK
    )
    :vars
    (
      ?AUTO_2550 - BLOCK
      ?AUTO_2551 - BLOCK
      ?AUTO_2552 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2548 ?AUTO_2549 ) ) ( ON-TABLE ?AUTO_2548 ) ( not ( = ?AUTO_2548 ?AUTO_2550 ) ) ( not ( = ?AUTO_2548 ?AUTO_2551 ) ) ( not ( = ?AUTO_2549 ?AUTO_2550 ) ) ( not ( = ?AUTO_2549 ?AUTO_2551 ) ) ( not ( = ?AUTO_2550 ?AUTO_2551 ) ) ( ON ?AUTO_2550 ?AUTO_2549 ) ( CLEAR ?AUTO_2550 ) ( CLEAR ?AUTO_2552 ) ( not ( = ?AUTO_2548 ?AUTO_2552 ) ) ( not ( = ?AUTO_2549 ?AUTO_2552 ) ) ( not ( = ?AUTO_2550 ?AUTO_2552 ) ) ( not ( = ?AUTO_2551 ?AUTO_2552 ) ) ( ON ?AUTO_2551 ?AUTO_2548 ) ( CLEAR ?AUTO_2551 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2551 ?AUTO_2548 )
      ( MAKE-ON ?AUTO_2548 ?AUTO_2549 )
      ( MAKE-ON-VERIFY ?AUTO_2548 ?AUTO_2549 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2553 - BLOCK
      ?AUTO_2554 - BLOCK
    )
    :vars
    (
      ?AUTO_2556 - BLOCK
      ?AUTO_2555 - BLOCK
      ?AUTO_2557 - BLOCK
      ?AUTO_2558 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2553 ?AUTO_2554 ) ) ( ON-TABLE ?AUTO_2553 ) ( not ( = ?AUTO_2553 ?AUTO_2556 ) ) ( not ( = ?AUTO_2553 ?AUTO_2555 ) ) ( not ( = ?AUTO_2554 ?AUTO_2556 ) ) ( not ( = ?AUTO_2554 ?AUTO_2555 ) ) ( not ( = ?AUTO_2556 ?AUTO_2555 ) ) ( ON ?AUTO_2556 ?AUTO_2554 ) ( CLEAR ?AUTO_2556 ) ( CLEAR ?AUTO_2557 ) ( not ( = ?AUTO_2553 ?AUTO_2557 ) ) ( not ( = ?AUTO_2554 ?AUTO_2557 ) ) ( not ( = ?AUTO_2556 ?AUTO_2557 ) ) ( not ( = ?AUTO_2555 ?AUTO_2557 ) ) ( ON ?AUTO_2555 ?AUTO_2553 ) ( CLEAR ?AUTO_2555 ) ( HOLDING ?AUTO_2558 ) ( not ( = ?AUTO_2553 ?AUTO_2558 ) ) ( not ( = ?AUTO_2554 ?AUTO_2558 ) ) ( not ( = ?AUTO_2556 ?AUTO_2558 ) ) ( not ( = ?AUTO_2555 ?AUTO_2558 ) ) ( not ( = ?AUTO_2557 ?AUTO_2558 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2558 )
      ( MAKE-ON ?AUTO_2553 ?AUTO_2554 )
      ( MAKE-ON-VERIFY ?AUTO_2553 ?AUTO_2554 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2559 - BLOCK
      ?AUTO_2560 - BLOCK
    )
    :vars
    (
      ?AUTO_2562 - BLOCK
      ?AUTO_2561 - BLOCK
      ?AUTO_2563 - BLOCK
      ?AUTO_2564 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2559 ?AUTO_2560 ) ) ( ON-TABLE ?AUTO_2559 ) ( not ( = ?AUTO_2559 ?AUTO_2562 ) ) ( not ( = ?AUTO_2559 ?AUTO_2561 ) ) ( not ( = ?AUTO_2560 ?AUTO_2562 ) ) ( not ( = ?AUTO_2560 ?AUTO_2561 ) ) ( not ( = ?AUTO_2562 ?AUTO_2561 ) ) ( ON ?AUTO_2562 ?AUTO_2560 ) ( CLEAR ?AUTO_2563 ) ( not ( = ?AUTO_2559 ?AUTO_2563 ) ) ( not ( = ?AUTO_2560 ?AUTO_2563 ) ) ( not ( = ?AUTO_2562 ?AUTO_2563 ) ) ( not ( = ?AUTO_2561 ?AUTO_2563 ) ) ( ON ?AUTO_2561 ?AUTO_2559 ) ( CLEAR ?AUTO_2561 ) ( not ( = ?AUTO_2559 ?AUTO_2564 ) ) ( not ( = ?AUTO_2560 ?AUTO_2564 ) ) ( not ( = ?AUTO_2562 ?AUTO_2564 ) ) ( not ( = ?AUTO_2561 ?AUTO_2564 ) ) ( not ( = ?AUTO_2563 ?AUTO_2564 ) ) ( ON ?AUTO_2564 ?AUTO_2562 ) ( CLEAR ?AUTO_2564 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2564 ?AUTO_2562 )
      ( MAKE-ON ?AUTO_2559 ?AUTO_2560 )
      ( MAKE-ON-VERIFY ?AUTO_2559 ?AUTO_2560 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2566 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2566 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2566 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2566 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2567 - BLOCK
    )
    :vars
    (
      ?AUTO_2568 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2567 ?AUTO_2568 ) ( CLEAR ?AUTO_2567 ) ( HAND-EMPTY ) ( not ( = ?AUTO_2567 ?AUTO_2568 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2567 ?AUTO_2568 )
      ( MAKE-ON-TABLE ?AUTO_2567 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2567 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2571 - BLOCK
      ?AUTO_2572 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2571 ) ( CLEAR ?AUTO_2572 ) ( not ( = ?AUTO_2571 ?AUTO_2572 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2571 ?AUTO_2572 )
      ( MAKE-ON-VERIFY ?AUTO_2571 ?AUTO_2572 ) )
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
    )
    :precondition
    ( and ( CLEAR ?AUTO_2574 ) ( not ( = ?AUTO_2573 ?AUTO_2574 ) ) ( ON ?AUTO_2573 ?AUTO_2575 ) ( CLEAR ?AUTO_2573 ) ( HAND-EMPTY ) ( not ( = ?AUTO_2573 ?AUTO_2575 ) ) ( not ( = ?AUTO_2574 ?AUTO_2575 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2573 ?AUTO_2575 )
      ( MAKE-ON ?AUTO_2573 ?AUTO_2574 )
      ( MAKE-ON-VERIFY ?AUTO_2573 ?AUTO_2574 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2576 - BLOCK
      ?AUTO_2577 - BLOCK
    )
    :vars
    (
      ?AUTO_2578 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2576 ?AUTO_2577 ) ) ( ON ?AUTO_2576 ?AUTO_2578 ) ( CLEAR ?AUTO_2576 ) ( not ( = ?AUTO_2576 ?AUTO_2578 ) ) ( not ( = ?AUTO_2577 ?AUTO_2578 ) ) ( HOLDING ?AUTO_2577 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2577 )
      ( MAKE-ON ?AUTO_2576 ?AUTO_2577 )
      ( MAKE-ON-VERIFY ?AUTO_2576 ?AUTO_2577 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2579 - BLOCK
      ?AUTO_2580 - BLOCK
    )
    :vars
    (
      ?AUTO_2581 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2579 ?AUTO_2580 ) ) ( ON ?AUTO_2579 ?AUTO_2581 ) ( not ( = ?AUTO_2579 ?AUTO_2581 ) ) ( not ( = ?AUTO_2580 ?AUTO_2581 ) ) ( ON ?AUTO_2580 ?AUTO_2579 ) ( CLEAR ?AUTO_2580 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2580 ?AUTO_2579 )
      ( MAKE-ON ?AUTO_2579 ?AUTO_2580 )
      ( MAKE-ON-VERIFY ?AUTO_2579 ?AUTO_2580 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2584 - BLOCK
      ?AUTO_2585 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2584 ) ( CLEAR ?AUTO_2585 ) ( not ( = ?AUTO_2584 ?AUTO_2585 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2584 ?AUTO_2585 )
      ( MAKE-ON-VERIFY ?AUTO_2584 ?AUTO_2585 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2586 - BLOCK
      ?AUTO_2587 - BLOCK
    )
    :vars
    (
      ?AUTO_2588 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2587 ) ( not ( = ?AUTO_2586 ?AUTO_2587 ) ) ( ON ?AUTO_2586 ?AUTO_2588 ) ( CLEAR ?AUTO_2586 ) ( HAND-EMPTY ) ( not ( = ?AUTO_2586 ?AUTO_2588 ) ) ( not ( = ?AUTO_2587 ?AUTO_2588 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2586 ?AUTO_2588 )
      ( MAKE-ON ?AUTO_2586 ?AUTO_2587 )
      ( MAKE-ON-VERIFY ?AUTO_2586 ?AUTO_2587 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2589 - BLOCK
      ?AUTO_2590 - BLOCK
    )
    :vars
    (
      ?AUTO_2591 - BLOCK
      ?AUTO_2592 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2589 ?AUTO_2590 ) ) ( ON ?AUTO_2589 ?AUTO_2591 ) ( CLEAR ?AUTO_2589 ) ( not ( = ?AUTO_2589 ?AUTO_2591 ) ) ( not ( = ?AUTO_2590 ?AUTO_2591 ) ) ( HOLDING ?AUTO_2590 ) ( CLEAR ?AUTO_2592 ) ( not ( = ?AUTO_2589 ?AUTO_2592 ) ) ( not ( = ?AUTO_2590 ?AUTO_2592 ) ) ( not ( = ?AUTO_2591 ?AUTO_2592 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2590 ?AUTO_2592 )
      ( MAKE-ON ?AUTO_2589 ?AUTO_2590 )
      ( MAKE-ON-VERIFY ?AUTO_2589 ?AUTO_2590 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2595 - BLOCK
      ?AUTO_2596 - BLOCK
    )
    :vars
    (
      ?AUTO_2597 - BLOCK
      ?AUTO_2598 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2596 ) ( not ( = ?AUTO_2595 ?AUTO_2596 ) ) ( ON ?AUTO_2595 ?AUTO_2597 ) ( CLEAR ?AUTO_2595 ) ( not ( = ?AUTO_2595 ?AUTO_2597 ) ) ( not ( = ?AUTO_2596 ?AUTO_2597 ) ) ( HOLDING ?AUTO_2598 ) ( not ( = ?AUTO_2595 ?AUTO_2598 ) ) ( not ( = ?AUTO_2596 ?AUTO_2598 ) ) ( not ( = ?AUTO_2597 ?AUTO_2598 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2598 )
      ( MAKE-ON ?AUTO_2595 ?AUTO_2596 )
      ( MAKE-ON-VERIFY ?AUTO_2595 ?AUTO_2596 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2599 - BLOCK
      ?AUTO_2600 - BLOCK
    )
    :vars
    (
      ?AUTO_2601 - BLOCK
      ?AUTO_2602 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2599 ?AUTO_2600 ) ) ( ON ?AUTO_2599 ?AUTO_2601 ) ( CLEAR ?AUTO_2599 ) ( not ( = ?AUTO_2599 ?AUTO_2601 ) ) ( not ( = ?AUTO_2600 ?AUTO_2601 ) ) ( not ( = ?AUTO_2599 ?AUTO_2602 ) ) ( not ( = ?AUTO_2600 ?AUTO_2602 ) ) ( not ( = ?AUTO_2601 ?AUTO_2602 ) ) ( ON ?AUTO_2602 ?AUTO_2600 ) ( CLEAR ?AUTO_2602 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2602 ?AUTO_2600 )
      ( MAKE-ON ?AUTO_2599 ?AUTO_2600 )
      ( MAKE-ON-VERIFY ?AUTO_2599 ?AUTO_2600 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2605 - BLOCK
      ?AUTO_2606 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2605 ) ( CLEAR ?AUTO_2606 ) ( not ( = ?AUTO_2605 ?AUTO_2606 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2605 ?AUTO_2606 )
      ( MAKE-ON-VERIFY ?AUTO_2605 ?AUTO_2606 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2607 - BLOCK
      ?AUTO_2608 - BLOCK
    )
    :vars
    (
      ?AUTO_2609 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2608 ) ( not ( = ?AUTO_2607 ?AUTO_2608 ) ) ( ON ?AUTO_2607 ?AUTO_2609 ) ( CLEAR ?AUTO_2607 ) ( HAND-EMPTY ) ( not ( = ?AUTO_2607 ?AUTO_2609 ) ) ( not ( = ?AUTO_2608 ?AUTO_2609 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2607 ?AUTO_2609 )
      ( MAKE-ON ?AUTO_2607 ?AUTO_2608 )
      ( MAKE-ON-VERIFY ?AUTO_2607 ?AUTO_2608 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2610 - BLOCK
      ?AUTO_2611 - BLOCK
    )
    :vars
    (
      ?AUTO_2612 - BLOCK
      ?AUTO_2613 - BLOCK
      ?AUTO_2614 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2611 ) ( not ( = ?AUTO_2610 ?AUTO_2611 ) ) ( ON ?AUTO_2610 ?AUTO_2612 ) ( CLEAR ?AUTO_2610 ) ( not ( = ?AUTO_2610 ?AUTO_2612 ) ) ( not ( = ?AUTO_2611 ?AUTO_2612 ) ) ( HOLDING ?AUTO_2613 ) ( CLEAR ?AUTO_2614 ) ( not ( = ?AUTO_2610 ?AUTO_2613 ) ) ( not ( = ?AUTO_2610 ?AUTO_2614 ) ) ( not ( = ?AUTO_2611 ?AUTO_2613 ) ) ( not ( = ?AUTO_2611 ?AUTO_2614 ) ) ( not ( = ?AUTO_2612 ?AUTO_2613 ) ) ( not ( = ?AUTO_2612 ?AUTO_2614 ) ) ( not ( = ?AUTO_2613 ?AUTO_2614 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2613 ?AUTO_2614 )
      ( MAKE-ON ?AUTO_2610 ?AUTO_2611 )
      ( MAKE-ON-VERIFY ?AUTO_2610 ?AUTO_2611 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2615 - BLOCK
      ?AUTO_2616 - BLOCK
    )
    :vars
    (
      ?AUTO_2617 - BLOCK
      ?AUTO_2618 - BLOCK
      ?AUTO_2619 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2615 ?AUTO_2616 ) ) ( ON ?AUTO_2615 ?AUTO_2617 ) ( CLEAR ?AUTO_2615 ) ( not ( = ?AUTO_2615 ?AUTO_2617 ) ) ( not ( = ?AUTO_2616 ?AUTO_2617 ) ) ( CLEAR ?AUTO_2618 ) ( not ( = ?AUTO_2615 ?AUTO_2619 ) ) ( not ( = ?AUTO_2615 ?AUTO_2618 ) ) ( not ( = ?AUTO_2616 ?AUTO_2619 ) ) ( not ( = ?AUTO_2616 ?AUTO_2618 ) ) ( not ( = ?AUTO_2617 ?AUTO_2619 ) ) ( not ( = ?AUTO_2617 ?AUTO_2618 ) ) ( not ( = ?AUTO_2619 ?AUTO_2618 ) ) ( ON ?AUTO_2619 ?AUTO_2616 ) ( CLEAR ?AUTO_2619 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2619 ?AUTO_2616 )
      ( MAKE-ON ?AUTO_2615 ?AUTO_2616 )
      ( MAKE-ON-VERIFY ?AUTO_2615 ?AUTO_2616 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2620 - BLOCK
      ?AUTO_2621 - BLOCK
    )
    :vars
    (
      ?AUTO_2624 - BLOCK
      ?AUTO_2623 - BLOCK
      ?AUTO_2622 - BLOCK
      ?AUTO_2625 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2620 ?AUTO_2621 ) ) ( ON ?AUTO_2620 ?AUTO_2624 ) ( CLEAR ?AUTO_2620 ) ( not ( = ?AUTO_2620 ?AUTO_2624 ) ) ( not ( = ?AUTO_2621 ?AUTO_2624 ) ) ( not ( = ?AUTO_2620 ?AUTO_2623 ) ) ( not ( = ?AUTO_2620 ?AUTO_2622 ) ) ( not ( = ?AUTO_2621 ?AUTO_2623 ) ) ( not ( = ?AUTO_2621 ?AUTO_2622 ) ) ( not ( = ?AUTO_2624 ?AUTO_2623 ) ) ( not ( = ?AUTO_2624 ?AUTO_2622 ) ) ( not ( = ?AUTO_2623 ?AUTO_2622 ) ) ( ON ?AUTO_2623 ?AUTO_2621 ) ( CLEAR ?AUTO_2623 ) ( HOLDING ?AUTO_2622 ) ( CLEAR ?AUTO_2625 ) ( not ( = ?AUTO_2620 ?AUTO_2625 ) ) ( not ( = ?AUTO_2621 ?AUTO_2625 ) ) ( not ( = ?AUTO_2624 ?AUTO_2625 ) ) ( not ( = ?AUTO_2623 ?AUTO_2625 ) ) ( not ( = ?AUTO_2622 ?AUTO_2625 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2622 ?AUTO_2625 )
      ( MAKE-ON ?AUTO_2620 ?AUTO_2621 )
      ( MAKE-ON-VERIFY ?AUTO_2620 ?AUTO_2621 ) )
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
      ?AUTO_2629 - BLOCK
      ?AUTO_2630 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2626 ?AUTO_2627 ) ) ( ON ?AUTO_2626 ?AUTO_2631 ) ( not ( = ?AUTO_2626 ?AUTO_2631 ) ) ( not ( = ?AUTO_2627 ?AUTO_2631 ) ) ( not ( = ?AUTO_2626 ?AUTO_2628 ) ) ( not ( = ?AUTO_2626 ?AUTO_2629 ) ) ( not ( = ?AUTO_2627 ?AUTO_2628 ) ) ( not ( = ?AUTO_2627 ?AUTO_2629 ) ) ( not ( = ?AUTO_2631 ?AUTO_2628 ) ) ( not ( = ?AUTO_2631 ?AUTO_2629 ) ) ( not ( = ?AUTO_2628 ?AUTO_2629 ) ) ( ON ?AUTO_2628 ?AUTO_2627 ) ( CLEAR ?AUTO_2628 ) ( CLEAR ?AUTO_2630 ) ( not ( = ?AUTO_2626 ?AUTO_2630 ) ) ( not ( = ?AUTO_2627 ?AUTO_2630 ) ) ( not ( = ?AUTO_2631 ?AUTO_2630 ) ) ( not ( = ?AUTO_2628 ?AUTO_2630 ) ) ( not ( = ?AUTO_2629 ?AUTO_2630 ) ) ( ON ?AUTO_2629 ?AUTO_2626 ) ( CLEAR ?AUTO_2629 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2629 ?AUTO_2626 )
      ( MAKE-ON ?AUTO_2626 ?AUTO_2627 )
      ( MAKE-ON-VERIFY ?AUTO_2626 ?AUTO_2627 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2632 - BLOCK
      ?AUTO_2633 - BLOCK
    )
    :vars
    (
      ?AUTO_2637 - BLOCK
      ?AUTO_2635 - BLOCK
      ?AUTO_2634 - BLOCK
      ?AUTO_2636 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2632 ?AUTO_2633 ) ) ( ON ?AUTO_2632 ?AUTO_2637 ) ( not ( = ?AUTO_2632 ?AUTO_2637 ) ) ( not ( = ?AUTO_2633 ?AUTO_2637 ) ) ( not ( = ?AUTO_2632 ?AUTO_2635 ) ) ( not ( = ?AUTO_2632 ?AUTO_2634 ) ) ( not ( = ?AUTO_2633 ?AUTO_2635 ) ) ( not ( = ?AUTO_2633 ?AUTO_2634 ) ) ( not ( = ?AUTO_2637 ?AUTO_2635 ) ) ( not ( = ?AUTO_2637 ?AUTO_2634 ) ) ( not ( = ?AUTO_2635 ?AUTO_2634 ) ) ( ON ?AUTO_2635 ?AUTO_2633 ) ( CLEAR ?AUTO_2635 ) ( not ( = ?AUTO_2632 ?AUTO_2636 ) ) ( not ( = ?AUTO_2633 ?AUTO_2636 ) ) ( not ( = ?AUTO_2637 ?AUTO_2636 ) ) ( not ( = ?AUTO_2635 ?AUTO_2636 ) ) ( not ( = ?AUTO_2634 ?AUTO_2636 ) ) ( ON ?AUTO_2634 ?AUTO_2632 ) ( CLEAR ?AUTO_2634 ) ( HOLDING ?AUTO_2636 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2636 )
      ( MAKE-ON ?AUTO_2632 ?AUTO_2633 )
      ( MAKE-ON-VERIFY ?AUTO_2632 ?AUTO_2633 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2638 - BLOCK
      ?AUTO_2639 - BLOCK
    )
    :vars
    (
      ?AUTO_2641 - BLOCK
      ?AUTO_2640 - BLOCK
      ?AUTO_2642 - BLOCK
      ?AUTO_2643 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2638 ?AUTO_2639 ) ) ( ON ?AUTO_2638 ?AUTO_2641 ) ( not ( = ?AUTO_2638 ?AUTO_2641 ) ) ( not ( = ?AUTO_2639 ?AUTO_2641 ) ) ( not ( = ?AUTO_2638 ?AUTO_2640 ) ) ( not ( = ?AUTO_2638 ?AUTO_2642 ) ) ( not ( = ?AUTO_2639 ?AUTO_2640 ) ) ( not ( = ?AUTO_2639 ?AUTO_2642 ) ) ( not ( = ?AUTO_2641 ?AUTO_2640 ) ) ( not ( = ?AUTO_2641 ?AUTO_2642 ) ) ( not ( = ?AUTO_2640 ?AUTO_2642 ) ) ( ON ?AUTO_2640 ?AUTO_2639 ) ( CLEAR ?AUTO_2640 ) ( not ( = ?AUTO_2638 ?AUTO_2643 ) ) ( not ( = ?AUTO_2639 ?AUTO_2643 ) ) ( not ( = ?AUTO_2641 ?AUTO_2643 ) ) ( not ( = ?AUTO_2640 ?AUTO_2643 ) ) ( not ( = ?AUTO_2642 ?AUTO_2643 ) ) ( ON ?AUTO_2642 ?AUTO_2638 ) ( ON ?AUTO_2643 ?AUTO_2642 ) ( CLEAR ?AUTO_2643 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2643 ?AUTO_2642 )
      ( MAKE-ON ?AUTO_2638 ?AUTO_2639 )
      ( MAKE-ON-VERIFY ?AUTO_2638 ?AUTO_2639 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2646 - BLOCK
      ?AUTO_2647 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2646 ) ( CLEAR ?AUTO_2647 ) ( not ( = ?AUTO_2646 ?AUTO_2647 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2646 ?AUTO_2647 )
      ( MAKE-ON-VERIFY ?AUTO_2646 ?AUTO_2647 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2648 - BLOCK
      ?AUTO_2649 - BLOCK
    )
    :vars
    (
      ?AUTO_2650 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2649 ) ( not ( = ?AUTO_2648 ?AUTO_2649 ) ) ( ON ?AUTO_2648 ?AUTO_2650 ) ( CLEAR ?AUTO_2648 ) ( HAND-EMPTY ) ( not ( = ?AUTO_2648 ?AUTO_2650 ) ) ( not ( = ?AUTO_2649 ?AUTO_2650 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2648 ?AUTO_2650 )
      ( MAKE-ON ?AUTO_2648 ?AUTO_2649 )
      ( MAKE-ON-VERIFY ?AUTO_2648 ?AUTO_2649 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2651 - BLOCK
      ?AUTO_2652 - BLOCK
    )
    :vars
    (
      ?AUTO_2653 - BLOCK
      ?AUTO_2654 - BLOCK
      ?AUTO_2655 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2652 ) ( not ( = ?AUTO_2651 ?AUTO_2652 ) ) ( ON ?AUTO_2651 ?AUTO_2653 ) ( CLEAR ?AUTO_2651 ) ( not ( = ?AUTO_2651 ?AUTO_2653 ) ) ( not ( = ?AUTO_2652 ?AUTO_2653 ) ) ( HOLDING ?AUTO_2654 ) ( CLEAR ?AUTO_2655 ) ( not ( = ?AUTO_2651 ?AUTO_2654 ) ) ( not ( = ?AUTO_2651 ?AUTO_2655 ) ) ( not ( = ?AUTO_2652 ?AUTO_2654 ) ) ( not ( = ?AUTO_2652 ?AUTO_2655 ) ) ( not ( = ?AUTO_2653 ?AUTO_2654 ) ) ( not ( = ?AUTO_2653 ?AUTO_2655 ) ) ( not ( = ?AUTO_2654 ?AUTO_2655 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2654 ?AUTO_2655 )
      ( MAKE-ON ?AUTO_2651 ?AUTO_2652 )
      ( MAKE-ON-VERIFY ?AUTO_2651 ?AUTO_2652 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2656 - BLOCK
      ?AUTO_2657 - BLOCK
    )
    :vars
    (
      ?AUTO_2658 - BLOCK
      ?AUTO_2659 - BLOCK
      ?AUTO_2660 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2656 ?AUTO_2657 ) ) ( ON ?AUTO_2656 ?AUTO_2658 ) ( CLEAR ?AUTO_2656 ) ( not ( = ?AUTO_2656 ?AUTO_2658 ) ) ( not ( = ?AUTO_2657 ?AUTO_2658 ) ) ( CLEAR ?AUTO_2659 ) ( not ( = ?AUTO_2656 ?AUTO_2660 ) ) ( not ( = ?AUTO_2656 ?AUTO_2659 ) ) ( not ( = ?AUTO_2657 ?AUTO_2660 ) ) ( not ( = ?AUTO_2657 ?AUTO_2659 ) ) ( not ( = ?AUTO_2658 ?AUTO_2660 ) ) ( not ( = ?AUTO_2658 ?AUTO_2659 ) ) ( not ( = ?AUTO_2660 ?AUTO_2659 ) ) ( ON ?AUTO_2660 ?AUTO_2657 ) ( CLEAR ?AUTO_2660 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2660 ?AUTO_2657 )
      ( MAKE-ON ?AUTO_2656 ?AUTO_2657 )
      ( MAKE-ON-VERIFY ?AUTO_2656 ?AUTO_2657 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2661 - BLOCK
      ?AUTO_2662 - BLOCK
    )
    :vars
    (
      ?AUTO_2663 - BLOCK
      ?AUTO_2664 - BLOCK
      ?AUTO_2665 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2661 ?AUTO_2662 ) ) ( not ( = ?AUTO_2661 ?AUTO_2663 ) ) ( not ( = ?AUTO_2662 ?AUTO_2663 ) ) ( CLEAR ?AUTO_2664 ) ( not ( = ?AUTO_2661 ?AUTO_2665 ) ) ( not ( = ?AUTO_2661 ?AUTO_2664 ) ) ( not ( = ?AUTO_2662 ?AUTO_2665 ) ) ( not ( = ?AUTO_2662 ?AUTO_2664 ) ) ( not ( = ?AUTO_2663 ?AUTO_2665 ) ) ( not ( = ?AUTO_2663 ?AUTO_2664 ) ) ( not ( = ?AUTO_2665 ?AUTO_2664 ) ) ( ON ?AUTO_2665 ?AUTO_2662 ) ( CLEAR ?AUTO_2665 ) ( HOLDING ?AUTO_2661 ) ( CLEAR ?AUTO_2663 ) )
    :subtasks
    ( ( !STACK ?AUTO_2661 ?AUTO_2663 )
      ( MAKE-ON ?AUTO_2661 ?AUTO_2662 )
      ( MAKE-ON-VERIFY ?AUTO_2661 ?AUTO_2662 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2670 - BLOCK
      ?AUTO_2671 - BLOCK
    )
    :vars
    (
      ?AUTO_2673 - BLOCK
      ?AUTO_2674 - BLOCK
      ?AUTO_2675 - BLOCK
      ?AUTO_2672 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2670 ?AUTO_2671 ) ) ( ON ?AUTO_2670 ?AUTO_2673 ) ( CLEAR ?AUTO_2670 ) ( not ( = ?AUTO_2670 ?AUTO_2673 ) ) ( not ( = ?AUTO_2671 ?AUTO_2673 ) ) ( not ( = ?AUTO_2670 ?AUTO_2674 ) ) ( not ( = ?AUTO_2670 ?AUTO_2675 ) ) ( not ( = ?AUTO_2671 ?AUTO_2674 ) ) ( not ( = ?AUTO_2671 ?AUTO_2675 ) ) ( not ( = ?AUTO_2673 ?AUTO_2674 ) ) ( not ( = ?AUTO_2673 ?AUTO_2675 ) ) ( not ( = ?AUTO_2674 ?AUTO_2675 ) ) ( ON ?AUTO_2674 ?AUTO_2671 ) ( CLEAR ?AUTO_2672 ) ( not ( = ?AUTO_2670 ?AUTO_2672 ) ) ( not ( = ?AUTO_2671 ?AUTO_2672 ) ) ( not ( = ?AUTO_2673 ?AUTO_2672 ) ) ( not ( = ?AUTO_2674 ?AUTO_2672 ) ) ( not ( = ?AUTO_2675 ?AUTO_2672 ) ) ( ON ?AUTO_2675 ?AUTO_2674 ) ( CLEAR ?AUTO_2675 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2675 ?AUTO_2674 )
      ( MAKE-ON ?AUTO_2670 ?AUTO_2671 )
      ( MAKE-ON-VERIFY ?AUTO_2670 ?AUTO_2671 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2676 - BLOCK
      ?AUTO_2677 - BLOCK
    )
    :vars
    (
      ?AUTO_2681 - BLOCK
      ?AUTO_2679 - BLOCK
      ?AUTO_2678 - BLOCK
      ?AUTO_2680 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2676 ?AUTO_2677 ) ) ( ON ?AUTO_2676 ?AUTO_2681 ) ( CLEAR ?AUTO_2676 ) ( not ( = ?AUTO_2676 ?AUTO_2681 ) ) ( not ( = ?AUTO_2677 ?AUTO_2681 ) ) ( not ( = ?AUTO_2676 ?AUTO_2679 ) ) ( not ( = ?AUTO_2676 ?AUTO_2678 ) ) ( not ( = ?AUTO_2677 ?AUTO_2679 ) ) ( not ( = ?AUTO_2677 ?AUTO_2678 ) ) ( not ( = ?AUTO_2681 ?AUTO_2679 ) ) ( not ( = ?AUTO_2681 ?AUTO_2678 ) ) ( not ( = ?AUTO_2679 ?AUTO_2678 ) ) ( ON ?AUTO_2679 ?AUTO_2677 ) ( not ( = ?AUTO_2676 ?AUTO_2680 ) ) ( not ( = ?AUTO_2677 ?AUTO_2680 ) ) ( not ( = ?AUTO_2681 ?AUTO_2680 ) ) ( not ( = ?AUTO_2679 ?AUTO_2680 ) ) ( not ( = ?AUTO_2678 ?AUTO_2680 ) ) ( ON ?AUTO_2678 ?AUTO_2679 ) ( CLEAR ?AUTO_2678 ) ( HOLDING ?AUTO_2680 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2680 )
      ( MAKE-ON ?AUTO_2676 ?AUTO_2677 )
      ( MAKE-ON-VERIFY ?AUTO_2676 ?AUTO_2677 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2682 - BLOCK
      ?AUTO_2683 - BLOCK
    )
    :vars
    (
      ?AUTO_2686 - BLOCK
      ?AUTO_2687 - BLOCK
      ?AUTO_2685 - BLOCK
      ?AUTO_2684 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2682 ?AUTO_2683 ) ) ( ON ?AUTO_2682 ?AUTO_2686 ) ( CLEAR ?AUTO_2682 ) ( not ( = ?AUTO_2682 ?AUTO_2686 ) ) ( not ( = ?AUTO_2683 ?AUTO_2686 ) ) ( not ( = ?AUTO_2682 ?AUTO_2687 ) ) ( not ( = ?AUTO_2682 ?AUTO_2685 ) ) ( not ( = ?AUTO_2683 ?AUTO_2687 ) ) ( not ( = ?AUTO_2683 ?AUTO_2685 ) ) ( not ( = ?AUTO_2686 ?AUTO_2687 ) ) ( not ( = ?AUTO_2686 ?AUTO_2685 ) ) ( not ( = ?AUTO_2687 ?AUTO_2685 ) ) ( ON ?AUTO_2687 ?AUTO_2683 ) ( not ( = ?AUTO_2682 ?AUTO_2684 ) ) ( not ( = ?AUTO_2683 ?AUTO_2684 ) ) ( not ( = ?AUTO_2686 ?AUTO_2684 ) ) ( not ( = ?AUTO_2687 ?AUTO_2684 ) ) ( not ( = ?AUTO_2685 ?AUTO_2684 ) ) ( ON ?AUTO_2685 ?AUTO_2687 ) ( ON ?AUTO_2684 ?AUTO_2685 ) ( CLEAR ?AUTO_2684 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2684 ?AUTO_2685 )
      ( MAKE-ON ?AUTO_2682 ?AUTO_2683 )
      ( MAKE-ON-VERIFY ?AUTO_2682 ?AUTO_2683 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2690 - BLOCK
      ?AUTO_2691 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2690 ) ( CLEAR ?AUTO_2691 ) ( not ( = ?AUTO_2690 ?AUTO_2691 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2690 ?AUTO_2691 )
      ( MAKE-ON-VERIFY ?AUTO_2690 ?AUTO_2691 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2692 - BLOCK
      ?AUTO_2693 - BLOCK
    )
    :vars
    (
      ?AUTO_2694 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2693 ) ( not ( = ?AUTO_2692 ?AUTO_2693 ) ) ( ON ?AUTO_2692 ?AUTO_2694 ) ( CLEAR ?AUTO_2692 ) ( HAND-EMPTY ) ( not ( = ?AUTO_2692 ?AUTO_2694 ) ) ( not ( = ?AUTO_2693 ?AUTO_2694 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2692 ?AUTO_2694 )
      ( MAKE-ON ?AUTO_2692 ?AUTO_2693 )
      ( MAKE-ON-VERIFY ?AUTO_2692 ?AUTO_2693 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2695 - BLOCK
      ?AUTO_2696 - BLOCK
    )
    :vars
    (
      ?AUTO_2697 - BLOCK
      ?AUTO_2698 - BLOCK
      ?AUTO_2699 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2696 ) ( not ( = ?AUTO_2695 ?AUTO_2696 ) ) ( ON ?AUTO_2695 ?AUTO_2697 ) ( CLEAR ?AUTO_2695 ) ( not ( = ?AUTO_2695 ?AUTO_2697 ) ) ( not ( = ?AUTO_2696 ?AUTO_2697 ) ) ( HOLDING ?AUTO_2698 ) ( CLEAR ?AUTO_2699 ) ( not ( = ?AUTO_2695 ?AUTO_2698 ) ) ( not ( = ?AUTO_2695 ?AUTO_2699 ) ) ( not ( = ?AUTO_2696 ?AUTO_2698 ) ) ( not ( = ?AUTO_2696 ?AUTO_2699 ) ) ( not ( = ?AUTO_2697 ?AUTO_2698 ) ) ( not ( = ?AUTO_2697 ?AUTO_2699 ) ) ( not ( = ?AUTO_2698 ?AUTO_2699 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2698 ?AUTO_2699 )
      ( MAKE-ON ?AUTO_2695 ?AUTO_2696 )
      ( MAKE-ON-VERIFY ?AUTO_2695 ?AUTO_2696 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2700 - BLOCK
      ?AUTO_2701 - BLOCK
    )
    :vars
    (
      ?AUTO_2702 - BLOCK
      ?AUTO_2703 - BLOCK
      ?AUTO_2704 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2701 ) ( not ( = ?AUTO_2700 ?AUTO_2701 ) ) ( ON ?AUTO_2700 ?AUTO_2702 ) ( not ( = ?AUTO_2700 ?AUTO_2702 ) ) ( not ( = ?AUTO_2701 ?AUTO_2702 ) ) ( CLEAR ?AUTO_2703 ) ( not ( = ?AUTO_2700 ?AUTO_2704 ) ) ( not ( = ?AUTO_2700 ?AUTO_2703 ) ) ( not ( = ?AUTO_2701 ?AUTO_2704 ) ) ( not ( = ?AUTO_2701 ?AUTO_2703 ) ) ( not ( = ?AUTO_2702 ?AUTO_2704 ) ) ( not ( = ?AUTO_2702 ?AUTO_2703 ) ) ( not ( = ?AUTO_2704 ?AUTO_2703 ) ) ( ON ?AUTO_2704 ?AUTO_2700 ) ( CLEAR ?AUTO_2704 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2704 ?AUTO_2700 )
      ( MAKE-ON ?AUTO_2700 ?AUTO_2701 )
      ( MAKE-ON-VERIFY ?AUTO_2700 ?AUTO_2701 ) )
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
      ?AUTO_2709 - BLOCK
      ?AUTO_2708 - BLOCK
      ?AUTO_2710 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2705 ?AUTO_2706 ) ) ( ON ?AUTO_2705 ?AUTO_2707 ) ( not ( = ?AUTO_2705 ?AUTO_2707 ) ) ( not ( = ?AUTO_2706 ?AUTO_2707 ) ) ( CLEAR ?AUTO_2709 ) ( not ( = ?AUTO_2705 ?AUTO_2708 ) ) ( not ( = ?AUTO_2705 ?AUTO_2709 ) ) ( not ( = ?AUTO_2706 ?AUTO_2708 ) ) ( not ( = ?AUTO_2706 ?AUTO_2709 ) ) ( not ( = ?AUTO_2707 ?AUTO_2708 ) ) ( not ( = ?AUTO_2707 ?AUTO_2709 ) ) ( not ( = ?AUTO_2708 ?AUTO_2709 ) ) ( ON ?AUTO_2708 ?AUTO_2705 ) ( CLEAR ?AUTO_2708 ) ( HOLDING ?AUTO_2706 ) ( CLEAR ?AUTO_2710 ) ( not ( = ?AUTO_2705 ?AUTO_2710 ) ) ( not ( = ?AUTO_2706 ?AUTO_2710 ) ) ( not ( = ?AUTO_2707 ?AUTO_2710 ) ) ( not ( = ?AUTO_2709 ?AUTO_2710 ) ) ( not ( = ?AUTO_2708 ?AUTO_2710 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2706 ?AUTO_2710 )
      ( MAKE-ON ?AUTO_2705 ?AUTO_2706 )
      ( MAKE-ON-VERIFY ?AUTO_2705 ?AUTO_2706 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2729 - BLOCK
      ?AUTO_2730 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2729 ) ( CLEAR ?AUTO_2730 ) ( not ( = ?AUTO_2729 ?AUTO_2730 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2729 ?AUTO_2730 )
      ( MAKE-ON-VERIFY ?AUTO_2729 ?AUTO_2730 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2731 - BLOCK
      ?AUTO_2732 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2732 ) ( not ( = ?AUTO_2731 ?AUTO_2732 ) ) ( ON-TABLE ?AUTO_2731 ) ( CLEAR ?AUTO_2731 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_2731 )
      ( MAKE-ON ?AUTO_2731 ?AUTO_2732 )
      ( MAKE-ON-VERIFY ?AUTO_2731 ?AUTO_2732 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2733 - BLOCK
      ?AUTO_2734 - BLOCK
    )
    :vars
    (
      ?AUTO_2735 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2733 ?AUTO_2734 ) ) ( ON-TABLE ?AUTO_2733 ) ( CLEAR ?AUTO_2733 ) ( HOLDING ?AUTO_2734 ) ( CLEAR ?AUTO_2735 ) ( not ( = ?AUTO_2733 ?AUTO_2735 ) ) ( not ( = ?AUTO_2734 ?AUTO_2735 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2734 ?AUTO_2735 )
      ( MAKE-ON ?AUTO_2733 ?AUTO_2734 )
      ( MAKE-ON-VERIFY ?AUTO_2733 ?AUTO_2734 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2736 - BLOCK
      ?AUTO_2737 - BLOCK
    )
    :vars
    (
      ?AUTO_2738 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2736 ?AUTO_2737 ) ) ( ON-TABLE ?AUTO_2736 ) ( CLEAR ?AUTO_2738 ) ( not ( = ?AUTO_2736 ?AUTO_2738 ) ) ( not ( = ?AUTO_2737 ?AUTO_2738 ) ) ( ON ?AUTO_2737 ?AUTO_2736 ) ( CLEAR ?AUTO_2737 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2737 ?AUTO_2736 )
      ( MAKE-ON ?AUTO_2736 ?AUTO_2737 )
      ( MAKE-ON-VERIFY ?AUTO_2736 ?AUTO_2737 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2739 - BLOCK
      ?AUTO_2740 - BLOCK
    )
    :vars
    (
      ?AUTO_2741 - BLOCK
      ?AUTO_2742 - BLOCK
      ?AUTO_2743 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2739 ?AUTO_2740 ) ) ( ON-TABLE ?AUTO_2739 ) ( CLEAR ?AUTO_2741 ) ( not ( = ?AUTO_2739 ?AUTO_2741 ) ) ( not ( = ?AUTO_2740 ?AUTO_2741 ) ) ( ON ?AUTO_2740 ?AUTO_2739 ) ( CLEAR ?AUTO_2740 ) ( HOLDING ?AUTO_2742 ) ( CLEAR ?AUTO_2743 ) ( not ( = ?AUTO_2739 ?AUTO_2742 ) ) ( not ( = ?AUTO_2739 ?AUTO_2743 ) ) ( not ( = ?AUTO_2740 ?AUTO_2742 ) ) ( not ( = ?AUTO_2740 ?AUTO_2743 ) ) ( not ( = ?AUTO_2741 ?AUTO_2742 ) ) ( not ( = ?AUTO_2741 ?AUTO_2743 ) ) ( not ( = ?AUTO_2742 ?AUTO_2743 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2742 ?AUTO_2743 )
      ( MAKE-ON ?AUTO_2739 ?AUTO_2740 )
      ( MAKE-ON-VERIFY ?AUTO_2739 ?AUTO_2740 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2744 - BLOCK
      ?AUTO_2745 - BLOCK
    )
    :vars
    (
      ?AUTO_2746 - BLOCK
      ?AUTO_2748 - BLOCK
      ?AUTO_2747 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2744 ?AUTO_2745 ) ) ( ON-TABLE ?AUTO_2744 ) ( CLEAR ?AUTO_2746 ) ( not ( = ?AUTO_2744 ?AUTO_2746 ) ) ( not ( = ?AUTO_2745 ?AUTO_2746 ) ) ( ON ?AUTO_2745 ?AUTO_2744 ) ( CLEAR ?AUTO_2748 ) ( not ( = ?AUTO_2744 ?AUTO_2747 ) ) ( not ( = ?AUTO_2744 ?AUTO_2748 ) ) ( not ( = ?AUTO_2745 ?AUTO_2747 ) ) ( not ( = ?AUTO_2745 ?AUTO_2748 ) ) ( not ( = ?AUTO_2746 ?AUTO_2747 ) ) ( not ( = ?AUTO_2746 ?AUTO_2748 ) ) ( not ( = ?AUTO_2747 ?AUTO_2748 ) ) ( ON ?AUTO_2747 ?AUTO_2745 ) ( CLEAR ?AUTO_2747 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2747 ?AUTO_2745 )
      ( MAKE-ON ?AUTO_2744 ?AUTO_2745 )
      ( MAKE-ON-VERIFY ?AUTO_2744 ?AUTO_2745 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2749 - BLOCK
      ?AUTO_2750 - BLOCK
    )
    :vars
    (
      ?AUTO_2753 - BLOCK
      ?AUTO_2751 - BLOCK
      ?AUTO_2752 - BLOCK
      ?AUTO_2754 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2749 ?AUTO_2750 ) ) ( ON-TABLE ?AUTO_2749 ) ( not ( = ?AUTO_2749 ?AUTO_2753 ) ) ( not ( = ?AUTO_2750 ?AUTO_2753 ) ) ( ON ?AUTO_2750 ?AUTO_2749 ) ( CLEAR ?AUTO_2751 ) ( not ( = ?AUTO_2749 ?AUTO_2752 ) ) ( not ( = ?AUTO_2749 ?AUTO_2751 ) ) ( not ( = ?AUTO_2750 ?AUTO_2752 ) ) ( not ( = ?AUTO_2750 ?AUTO_2751 ) ) ( not ( = ?AUTO_2753 ?AUTO_2752 ) ) ( not ( = ?AUTO_2753 ?AUTO_2751 ) ) ( not ( = ?AUTO_2752 ?AUTO_2751 ) ) ( ON ?AUTO_2752 ?AUTO_2750 ) ( CLEAR ?AUTO_2752 ) ( HOLDING ?AUTO_2753 ) ( CLEAR ?AUTO_2754 ) ( not ( = ?AUTO_2749 ?AUTO_2754 ) ) ( not ( = ?AUTO_2750 ?AUTO_2754 ) ) ( not ( = ?AUTO_2753 ?AUTO_2754 ) ) ( not ( = ?AUTO_2751 ?AUTO_2754 ) ) ( not ( = ?AUTO_2752 ?AUTO_2754 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2753 ?AUTO_2754 )
      ( MAKE-ON ?AUTO_2749 ?AUTO_2750 )
      ( MAKE-ON-VERIFY ?AUTO_2749 ?AUTO_2750 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2756 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2756 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2756 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2756 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2757 - BLOCK
    )
    :vars
    (
      ?AUTO_2758 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2757 ?AUTO_2758 ) ( CLEAR ?AUTO_2757 ) ( HAND-EMPTY ) ( not ( = ?AUTO_2757 ?AUTO_2758 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2757 ?AUTO_2758 )
      ( MAKE-ON-TABLE ?AUTO_2757 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2757 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2760 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2760 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2760 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2760 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2761 - BLOCK
    )
    :vars
    (
      ?AUTO_2762 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2761 ?AUTO_2762 ) ( CLEAR ?AUTO_2761 ) ( HAND-EMPTY ) ( not ( = ?AUTO_2761 ?AUTO_2762 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2761 ?AUTO_2762 )
      ( MAKE-ON-TABLE ?AUTO_2761 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2761 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2763 - BLOCK
    )
    :vars
    (
      ?AUTO_2764 - BLOCK
      ?AUTO_2765 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2763 ?AUTO_2764 ) ( CLEAR ?AUTO_2763 ) ( not ( = ?AUTO_2763 ?AUTO_2764 ) ) ( HOLDING ?AUTO_2765 ) ( not ( = ?AUTO_2763 ?AUTO_2765 ) ) ( not ( = ?AUTO_2764 ?AUTO_2765 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2765 )
      ( MAKE-ON-TABLE ?AUTO_2763 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2763 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2766 - BLOCK
    )
    :vars
    (
      ?AUTO_2767 - BLOCK
      ?AUTO_2768 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2766 ?AUTO_2767 ) ( not ( = ?AUTO_2766 ?AUTO_2767 ) ) ( not ( = ?AUTO_2766 ?AUTO_2768 ) ) ( not ( = ?AUTO_2767 ?AUTO_2768 ) ) ( ON ?AUTO_2768 ?AUTO_2766 ) ( CLEAR ?AUTO_2768 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2768 ?AUTO_2766 )
      ( MAKE-ON-TABLE ?AUTO_2766 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2766 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2770 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2770 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2770 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2770 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2771 - BLOCK
    )
    :vars
    (
      ?AUTO_2772 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2771 ?AUTO_2772 ) ( CLEAR ?AUTO_2771 ) ( HAND-EMPTY ) ( not ( = ?AUTO_2771 ?AUTO_2772 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2771 ?AUTO_2772 )
      ( MAKE-ON-TABLE ?AUTO_2771 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2771 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2773 - BLOCK
    )
    :vars
    (
      ?AUTO_2774 - BLOCK
      ?AUTO_2775 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2773 ?AUTO_2774 ) ( CLEAR ?AUTO_2773 ) ( not ( = ?AUTO_2773 ?AUTO_2774 ) ) ( HOLDING ?AUTO_2775 ) ( not ( = ?AUTO_2773 ?AUTO_2775 ) ) ( not ( = ?AUTO_2774 ?AUTO_2775 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2775 )
      ( MAKE-ON-TABLE ?AUTO_2773 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2773 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2776 - BLOCK
    )
    :vars
    (
      ?AUTO_2777 - BLOCK
      ?AUTO_2778 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2776 ?AUTO_2777 ) ( not ( = ?AUTO_2776 ?AUTO_2777 ) ) ( not ( = ?AUTO_2776 ?AUTO_2778 ) ) ( not ( = ?AUTO_2777 ?AUTO_2778 ) ) ( ON ?AUTO_2778 ?AUTO_2776 ) ( CLEAR ?AUTO_2778 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2778 ?AUTO_2776 )
      ( MAKE-ON-TABLE ?AUTO_2776 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2776 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2779 - BLOCK
    )
    :vars
    (
      ?AUTO_2780 - BLOCK
      ?AUTO_2781 - BLOCK
      ?AUTO_2782 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2779 ?AUTO_2780 ) ( not ( = ?AUTO_2779 ?AUTO_2780 ) ) ( not ( = ?AUTO_2779 ?AUTO_2781 ) ) ( not ( = ?AUTO_2780 ?AUTO_2781 ) ) ( ON ?AUTO_2781 ?AUTO_2779 ) ( CLEAR ?AUTO_2781 ) ( HOLDING ?AUTO_2782 ) ( not ( = ?AUTO_2779 ?AUTO_2782 ) ) ( not ( = ?AUTO_2780 ?AUTO_2782 ) ) ( not ( = ?AUTO_2781 ?AUTO_2782 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2782 )
      ( MAKE-ON-TABLE ?AUTO_2779 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2779 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2783 - BLOCK
    )
    :vars
    (
      ?AUTO_2784 - BLOCK
      ?AUTO_2785 - BLOCK
      ?AUTO_2786 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2783 ?AUTO_2784 ) ( not ( = ?AUTO_2783 ?AUTO_2784 ) ) ( not ( = ?AUTO_2783 ?AUTO_2785 ) ) ( not ( = ?AUTO_2784 ?AUTO_2785 ) ) ( ON ?AUTO_2785 ?AUTO_2783 ) ( not ( = ?AUTO_2783 ?AUTO_2786 ) ) ( not ( = ?AUTO_2784 ?AUTO_2786 ) ) ( not ( = ?AUTO_2785 ?AUTO_2786 ) ) ( ON ?AUTO_2786 ?AUTO_2785 ) ( CLEAR ?AUTO_2786 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2786 ?AUTO_2785 )
      ( MAKE-ON-TABLE ?AUTO_2783 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2783 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2789 - BLOCK
      ?AUTO_2790 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2789 ) ( CLEAR ?AUTO_2790 ) ( not ( = ?AUTO_2789 ?AUTO_2790 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2789 ?AUTO_2790 )
      ( MAKE-ON-VERIFY ?AUTO_2789 ?AUTO_2790 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2791 - BLOCK
      ?AUTO_2792 - BLOCK
    )
    :vars
    (
      ?AUTO_2793 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2792 ) ( not ( = ?AUTO_2791 ?AUTO_2792 ) ) ( ON ?AUTO_2791 ?AUTO_2793 ) ( CLEAR ?AUTO_2791 ) ( HAND-EMPTY ) ( not ( = ?AUTO_2791 ?AUTO_2793 ) ) ( not ( = ?AUTO_2792 ?AUTO_2793 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2791 ?AUTO_2793 )
      ( MAKE-ON ?AUTO_2791 ?AUTO_2792 )
      ( MAKE-ON-VERIFY ?AUTO_2791 ?AUTO_2792 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2794 - BLOCK
      ?AUTO_2795 - BLOCK
    )
    :vars
    (
      ?AUTO_2796 - BLOCK
      ?AUTO_2797 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2795 ) ( not ( = ?AUTO_2794 ?AUTO_2795 ) ) ( ON ?AUTO_2794 ?AUTO_2796 ) ( CLEAR ?AUTO_2794 ) ( not ( = ?AUTO_2794 ?AUTO_2796 ) ) ( not ( = ?AUTO_2795 ?AUTO_2796 ) ) ( HOLDING ?AUTO_2797 ) ( not ( = ?AUTO_2794 ?AUTO_2797 ) ) ( not ( = ?AUTO_2795 ?AUTO_2797 ) ) ( not ( = ?AUTO_2796 ?AUTO_2797 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2797 )
      ( MAKE-ON ?AUTO_2794 ?AUTO_2795 )
      ( MAKE-ON-VERIFY ?AUTO_2794 ?AUTO_2795 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2798 - BLOCK
      ?AUTO_2799 - BLOCK
    )
    :vars
    (
      ?AUTO_2800 - BLOCK
      ?AUTO_2801 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2799 ) ( not ( = ?AUTO_2798 ?AUTO_2799 ) ) ( ON ?AUTO_2798 ?AUTO_2800 ) ( not ( = ?AUTO_2798 ?AUTO_2800 ) ) ( not ( = ?AUTO_2799 ?AUTO_2800 ) ) ( not ( = ?AUTO_2798 ?AUTO_2801 ) ) ( not ( = ?AUTO_2799 ?AUTO_2801 ) ) ( not ( = ?AUTO_2800 ?AUTO_2801 ) ) ( ON ?AUTO_2801 ?AUTO_2798 ) ( CLEAR ?AUTO_2801 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2801 ?AUTO_2798 )
      ( MAKE-ON ?AUTO_2798 ?AUTO_2799 )
      ( MAKE-ON-VERIFY ?AUTO_2798 ?AUTO_2799 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2802 - BLOCK
      ?AUTO_2803 - BLOCK
    )
    :vars
    (
      ?AUTO_2804 - BLOCK
      ?AUTO_2805 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2802 ?AUTO_2803 ) ) ( ON ?AUTO_2802 ?AUTO_2804 ) ( not ( = ?AUTO_2802 ?AUTO_2804 ) ) ( not ( = ?AUTO_2803 ?AUTO_2804 ) ) ( not ( = ?AUTO_2802 ?AUTO_2805 ) ) ( not ( = ?AUTO_2803 ?AUTO_2805 ) ) ( not ( = ?AUTO_2804 ?AUTO_2805 ) ) ( ON ?AUTO_2805 ?AUTO_2802 ) ( CLEAR ?AUTO_2805 ) ( HOLDING ?AUTO_2803 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2803 )
      ( MAKE-ON ?AUTO_2802 ?AUTO_2803 )
      ( MAKE-ON-VERIFY ?AUTO_2802 ?AUTO_2803 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2806 - BLOCK
      ?AUTO_2807 - BLOCK
    )
    :vars
    (
      ?AUTO_2809 - BLOCK
      ?AUTO_2808 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2806 ?AUTO_2807 ) ) ( ON ?AUTO_2806 ?AUTO_2809 ) ( not ( = ?AUTO_2806 ?AUTO_2809 ) ) ( not ( = ?AUTO_2807 ?AUTO_2809 ) ) ( not ( = ?AUTO_2806 ?AUTO_2808 ) ) ( not ( = ?AUTO_2807 ?AUTO_2808 ) ) ( not ( = ?AUTO_2809 ?AUTO_2808 ) ) ( ON ?AUTO_2808 ?AUTO_2806 ) ( ON ?AUTO_2807 ?AUTO_2808 ) ( CLEAR ?AUTO_2807 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2807 ?AUTO_2808 )
      ( MAKE-ON ?AUTO_2806 ?AUTO_2807 )
      ( MAKE-ON-VERIFY ?AUTO_2806 ?AUTO_2807 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2810 - BLOCK
      ?AUTO_2811 - BLOCK
    )
    :vars
    (
      ?AUTO_2812 - BLOCK
      ?AUTO_2813 - BLOCK
      ?AUTO_2814 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2810 ?AUTO_2811 ) ) ( ON ?AUTO_2810 ?AUTO_2812 ) ( not ( = ?AUTO_2810 ?AUTO_2812 ) ) ( not ( = ?AUTO_2811 ?AUTO_2812 ) ) ( not ( = ?AUTO_2810 ?AUTO_2813 ) ) ( not ( = ?AUTO_2811 ?AUTO_2813 ) ) ( not ( = ?AUTO_2812 ?AUTO_2813 ) ) ( ON ?AUTO_2813 ?AUTO_2810 ) ( ON ?AUTO_2811 ?AUTO_2813 ) ( CLEAR ?AUTO_2811 ) ( HOLDING ?AUTO_2814 ) ( not ( = ?AUTO_2810 ?AUTO_2814 ) ) ( not ( = ?AUTO_2811 ?AUTO_2814 ) ) ( not ( = ?AUTO_2812 ?AUTO_2814 ) ) ( not ( = ?AUTO_2813 ?AUTO_2814 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2814 )
      ( MAKE-ON ?AUTO_2810 ?AUTO_2811 )
      ( MAKE-ON-VERIFY ?AUTO_2810 ?AUTO_2811 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2815 - BLOCK
      ?AUTO_2816 - BLOCK
    )
    :vars
    (
      ?AUTO_2818 - BLOCK
      ?AUTO_2817 - BLOCK
      ?AUTO_2819 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2815 ?AUTO_2816 ) ) ( ON ?AUTO_2815 ?AUTO_2818 ) ( not ( = ?AUTO_2815 ?AUTO_2818 ) ) ( not ( = ?AUTO_2816 ?AUTO_2818 ) ) ( not ( = ?AUTO_2815 ?AUTO_2817 ) ) ( not ( = ?AUTO_2816 ?AUTO_2817 ) ) ( not ( = ?AUTO_2818 ?AUTO_2817 ) ) ( ON ?AUTO_2817 ?AUTO_2815 ) ( ON ?AUTO_2816 ?AUTO_2817 ) ( not ( = ?AUTO_2815 ?AUTO_2819 ) ) ( not ( = ?AUTO_2816 ?AUTO_2819 ) ) ( not ( = ?AUTO_2818 ?AUTO_2819 ) ) ( not ( = ?AUTO_2817 ?AUTO_2819 ) ) ( ON ?AUTO_2819 ?AUTO_2816 ) ( CLEAR ?AUTO_2819 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2819 ?AUTO_2816 )
      ( MAKE-ON ?AUTO_2815 ?AUTO_2816 )
      ( MAKE-ON-VERIFY ?AUTO_2815 ?AUTO_2816 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2822 - BLOCK
      ?AUTO_2823 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2822 ) ( CLEAR ?AUTO_2823 ) ( not ( = ?AUTO_2822 ?AUTO_2823 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2822 ?AUTO_2823 )
      ( MAKE-ON-VERIFY ?AUTO_2822 ?AUTO_2823 ) )
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
    )
    :precondition
    ( and ( CLEAR ?AUTO_2825 ) ( not ( = ?AUTO_2824 ?AUTO_2825 ) ) ( ON ?AUTO_2824 ?AUTO_2826 ) ( CLEAR ?AUTO_2824 ) ( HAND-EMPTY ) ( not ( = ?AUTO_2824 ?AUTO_2826 ) ) ( not ( = ?AUTO_2825 ?AUTO_2826 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2824 ?AUTO_2826 )
      ( MAKE-ON ?AUTO_2824 ?AUTO_2825 )
      ( MAKE-ON-VERIFY ?AUTO_2824 ?AUTO_2825 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2827 - BLOCK
      ?AUTO_2828 - BLOCK
    )
    :vars
    (
      ?AUTO_2829 - BLOCK
      ?AUTO_2830 - BLOCK
      ?AUTO_2831 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2828 ) ( not ( = ?AUTO_2827 ?AUTO_2828 ) ) ( ON ?AUTO_2827 ?AUTO_2829 ) ( CLEAR ?AUTO_2827 ) ( not ( = ?AUTO_2827 ?AUTO_2829 ) ) ( not ( = ?AUTO_2828 ?AUTO_2829 ) ) ( HOLDING ?AUTO_2830 ) ( CLEAR ?AUTO_2831 ) ( not ( = ?AUTO_2827 ?AUTO_2830 ) ) ( not ( = ?AUTO_2827 ?AUTO_2831 ) ) ( not ( = ?AUTO_2828 ?AUTO_2830 ) ) ( not ( = ?AUTO_2828 ?AUTO_2831 ) ) ( not ( = ?AUTO_2829 ?AUTO_2830 ) ) ( not ( = ?AUTO_2829 ?AUTO_2831 ) ) ( not ( = ?AUTO_2830 ?AUTO_2831 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2830 ?AUTO_2831 )
      ( MAKE-ON ?AUTO_2827 ?AUTO_2828 )
      ( MAKE-ON-VERIFY ?AUTO_2827 ?AUTO_2828 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2832 - BLOCK
      ?AUTO_2833 - BLOCK
    )
    :vars
    (
      ?AUTO_2834 - BLOCK
      ?AUTO_2835 - BLOCK
      ?AUTO_2836 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2832 ?AUTO_2833 ) ) ( ON ?AUTO_2832 ?AUTO_2834 ) ( CLEAR ?AUTO_2832 ) ( not ( = ?AUTO_2832 ?AUTO_2834 ) ) ( not ( = ?AUTO_2833 ?AUTO_2834 ) ) ( CLEAR ?AUTO_2835 ) ( not ( = ?AUTO_2832 ?AUTO_2836 ) ) ( not ( = ?AUTO_2832 ?AUTO_2835 ) ) ( not ( = ?AUTO_2833 ?AUTO_2836 ) ) ( not ( = ?AUTO_2833 ?AUTO_2835 ) ) ( not ( = ?AUTO_2834 ?AUTO_2836 ) ) ( not ( = ?AUTO_2834 ?AUTO_2835 ) ) ( not ( = ?AUTO_2836 ?AUTO_2835 ) ) ( ON ?AUTO_2836 ?AUTO_2833 ) ( CLEAR ?AUTO_2836 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2836 ?AUTO_2833 )
      ( MAKE-ON ?AUTO_2832 ?AUTO_2833 )
      ( MAKE-ON-VERIFY ?AUTO_2832 ?AUTO_2833 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2837 - BLOCK
      ?AUTO_2838 - BLOCK
    )
    :vars
    (
      ?AUTO_2841 - BLOCK
      ?AUTO_2839 - BLOCK
      ?AUTO_2840 - BLOCK
      ?AUTO_2842 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2837 ?AUTO_2838 ) ) ( ON ?AUTO_2837 ?AUTO_2841 ) ( CLEAR ?AUTO_2837 ) ( not ( = ?AUTO_2837 ?AUTO_2841 ) ) ( not ( = ?AUTO_2838 ?AUTO_2841 ) ) ( CLEAR ?AUTO_2839 ) ( not ( = ?AUTO_2837 ?AUTO_2840 ) ) ( not ( = ?AUTO_2837 ?AUTO_2839 ) ) ( not ( = ?AUTO_2838 ?AUTO_2840 ) ) ( not ( = ?AUTO_2838 ?AUTO_2839 ) ) ( not ( = ?AUTO_2841 ?AUTO_2840 ) ) ( not ( = ?AUTO_2841 ?AUTO_2839 ) ) ( not ( = ?AUTO_2840 ?AUTO_2839 ) ) ( ON ?AUTO_2840 ?AUTO_2838 ) ( CLEAR ?AUTO_2840 ) ( HOLDING ?AUTO_2842 ) ( not ( = ?AUTO_2837 ?AUTO_2842 ) ) ( not ( = ?AUTO_2838 ?AUTO_2842 ) ) ( not ( = ?AUTO_2841 ?AUTO_2842 ) ) ( not ( = ?AUTO_2839 ?AUTO_2842 ) ) ( not ( = ?AUTO_2840 ?AUTO_2842 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2842 )
      ( MAKE-ON ?AUTO_2837 ?AUTO_2838 )
      ( MAKE-ON-VERIFY ?AUTO_2837 ?AUTO_2838 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2843 - BLOCK
      ?AUTO_2844 - BLOCK
    )
    :vars
    (
      ?AUTO_2848 - BLOCK
      ?AUTO_2845 - BLOCK
      ?AUTO_2847 - BLOCK
      ?AUTO_2846 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2843 ?AUTO_2844 ) ) ( ON ?AUTO_2843 ?AUTO_2848 ) ( CLEAR ?AUTO_2843 ) ( not ( = ?AUTO_2843 ?AUTO_2848 ) ) ( not ( = ?AUTO_2844 ?AUTO_2848 ) ) ( CLEAR ?AUTO_2845 ) ( not ( = ?AUTO_2843 ?AUTO_2847 ) ) ( not ( = ?AUTO_2843 ?AUTO_2845 ) ) ( not ( = ?AUTO_2844 ?AUTO_2847 ) ) ( not ( = ?AUTO_2844 ?AUTO_2845 ) ) ( not ( = ?AUTO_2848 ?AUTO_2847 ) ) ( not ( = ?AUTO_2848 ?AUTO_2845 ) ) ( not ( = ?AUTO_2847 ?AUTO_2845 ) ) ( ON ?AUTO_2847 ?AUTO_2844 ) ( not ( = ?AUTO_2843 ?AUTO_2846 ) ) ( not ( = ?AUTO_2844 ?AUTO_2846 ) ) ( not ( = ?AUTO_2848 ?AUTO_2846 ) ) ( not ( = ?AUTO_2845 ?AUTO_2846 ) ) ( not ( = ?AUTO_2847 ?AUTO_2846 ) ) ( ON ?AUTO_2846 ?AUTO_2847 ) ( CLEAR ?AUTO_2846 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2846 ?AUTO_2847 )
      ( MAKE-ON ?AUTO_2843 ?AUTO_2844 )
      ( MAKE-ON-VERIFY ?AUTO_2843 ?AUTO_2844 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2849 - BLOCK
      ?AUTO_2850 - BLOCK
    )
    :vars
    (
      ?AUTO_2851 - BLOCK
      ?AUTO_2853 - BLOCK
      ?AUTO_2854 - BLOCK
      ?AUTO_2852 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2849 ?AUTO_2850 ) ) ( ON ?AUTO_2849 ?AUTO_2851 ) ( CLEAR ?AUTO_2849 ) ( not ( = ?AUTO_2849 ?AUTO_2851 ) ) ( not ( = ?AUTO_2850 ?AUTO_2851 ) ) ( not ( = ?AUTO_2849 ?AUTO_2853 ) ) ( not ( = ?AUTO_2849 ?AUTO_2854 ) ) ( not ( = ?AUTO_2850 ?AUTO_2853 ) ) ( not ( = ?AUTO_2850 ?AUTO_2854 ) ) ( not ( = ?AUTO_2851 ?AUTO_2853 ) ) ( not ( = ?AUTO_2851 ?AUTO_2854 ) ) ( not ( = ?AUTO_2853 ?AUTO_2854 ) ) ( ON ?AUTO_2853 ?AUTO_2850 ) ( not ( = ?AUTO_2849 ?AUTO_2852 ) ) ( not ( = ?AUTO_2850 ?AUTO_2852 ) ) ( not ( = ?AUTO_2851 ?AUTO_2852 ) ) ( not ( = ?AUTO_2854 ?AUTO_2852 ) ) ( not ( = ?AUTO_2853 ?AUTO_2852 ) ) ( ON ?AUTO_2852 ?AUTO_2853 ) ( CLEAR ?AUTO_2852 ) ( HOLDING ?AUTO_2854 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2854 )
      ( MAKE-ON ?AUTO_2849 ?AUTO_2850 )
      ( MAKE-ON-VERIFY ?AUTO_2849 ?AUTO_2850 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2855 - BLOCK
      ?AUTO_2856 - BLOCK
    )
    :vars
    (
      ?AUTO_2859 - BLOCK
      ?AUTO_2860 - BLOCK
      ?AUTO_2857 - BLOCK
      ?AUTO_2858 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2855 ?AUTO_2856 ) ) ( ON ?AUTO_2855 ?AUTO_2859 ) ( CLEAR ?AUTO_2855 ) ( not ( = ?AUTO_2855 ?AUTO_2859 ) ) ( not ( = ?AUTO_2856 ?AUTO_2859 ) ) ( not ( = ?AUTO_2855 ?AUTO_2860 ) ) ( not ( = ?AUTO_2855 ?AUTO_2857 ) ) ( not ( = ?AUTO_2856 ?AUTO_2860 ) ) ( not ( = ?AUTO_2856 ?AUTO_2857 ) ) ( not ( = ?AUTO_2859 ?AUTO_2860 ) ) ( not ( = ?AUTO_2859 ?AUTO_2857 ) ) ( not ( = ?AUTO_2860 ?AUTO_2857 ) ) ( ON ?AUTO_2860 ?AUTO_2856 ) ( not ( = ?AUTO_2855 ?AUTO_2858 ) ) ( not ( = ?AUTO_2856 ?AUTO_2858 ) ) ( not ( = ?AUTO_2859 ?AUTO_2858 ) ) ( not ( = ?AUTO_2857 ?AUTO_2858 ) ) ( not ( = ?AUTO_2860 ?AUTO_2858 ) ) ( ON ?AUTO_2858 ?AUTO_2860 ) ( ON ?AUTO_2857 ?AUTO_2858 ) ( CLEAR ?AUTO_2857 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2857 ?AUTO_2858 )
      ( MAKE-ON ?AUTO_2855 ?AUTO_2856 )
      ( MAKE-ON-VERIFY ?AUTO_2855 ?AUTO_2856 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2861 - BLOCK
      ?AUTO_2862 - BLOCK
    )
    :vars
    (
      ?AUTO_2866 - BLOCK
      ?AUTO_2863 - BLOCK
      ?AUTO_2864 - BLOCK
      ?AUTO_2865 - BLOCK
      ?AUTO_2867 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2861 ?AUTO_2862 ) ) ( ON ?AUTO_2861 ?AUTO_2866 ) ( CLEAR ?AUTO_2861 ) ( not ( = ?AUTO_2861 ?AUTO_2866 ) ) ( not ( = ?AUTO_2862 ?AUTO_2866 ) ) ( not ( = ?AUTO_2861 ?AUTO_2863 ) ) ( not ( = ?AUTO_2861 ?AUTO_2864 ) ) ( not ( = ?AUTO_2862 ?AUTO_2863 ) ) ( not ( = ?AUTO_2862 ?AUTO_2864 ) ) ( not ( = ?AUTO_2866 ?AUTO_2863 ) ) ( not ( = ?AUTO_2866 ?AUTO_2864 ) ) ( not ( = ?AUTO_2863 ?AUTO_2864 ) ) ( ON ?AUTO_2863 ?AUTO_2862 ) ( not ( = ?AUTO_2861 ?AUTO_2865 ) ) ( not ( = ?AUTO_2862 ?AUTO_2865 ) ) ( not ( = ?AUTO_2866 ?AUTO_2865 ) ) ( not ( = ?AUTO_2864 ?AUTO_2865 ) ) ( not ( = ?AUTO_2863 ?AUTO_2865 ) ) ( ON ?AUTO_2865 ?AUTO_2863 ) ( ON ?AUTO_2864 ?AUTO_2865 ) ( CLEAR ?AUTO_2864 ) ( HOLDING ?AUTO_2867 ) ( not ( = ?AUTO_2861 ?AUTO_2867 ) ) ( not ( = ?AUTO_2862 ?AUTO_2867 ) ) ( not ( = ?AUTO_2866 ?AUTO_2867 ) ) ( not ( = ?AUTO_2863 ?AUTO_2867 ) ) ( not ( = ?AUTO_2864 ?AUTO_2867 ) ) ( not ( = ?AUTO_2865 ?AUTO_2867 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2867 )
      ( MAKE-ON ?AUTO_2861 ?AUTO_2862 )
      ( MAKE-ON-VERIFY ?AUTO_2861 ?AUTO_2862 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2868 - BLOCK
      ?AUTO_2869 - BLOCK
    )
    :vars
    (
      ?AUTO_2870 - BLOCK
      ?AUTO_2871 - BLOCK
      ?AUTO_2872 - BLOCK
      ?AUTO_2873 - BLOCK
      ?AUTO_2874 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2868 ?AUTO_2869 ) ) ( ON ?AUTO_2868 ?AUTO_2870 ) ( CLEAR ?AUTO_2868 ) ( not ( = ?AUTO_2868 ?AUTO_2870 ) ) ( not ( = ?AUTO_2869 ?AUTO_2870 ) ) ( not ( = ?AUTO_2868 ?AUTO_2871 ) ) ( not ( = ?AUTO_2868 ?AUTO_2872 ) ) ( not ( = ?AUTO_2869 ?AUTO_2871 ) ) ( not ( = ?AUTO_2869 ?AUTO_2872 ) ) ( not ( = ?AUTO_2870 ?AUTO_2871 ) ) ( not ( = ?AUTO_2870 ?AUTO_2872 ) ) ( not ( = ?AUTO_2871 ?AUTO_2872 ) ) ( ON ?AUTO_2871 ?AUTO_2869 ) ( not ( = ?AUTO_2868 ?AUTO_2873 ) ) ( not ( = ?AUTO_2869 ?AUTO_2873 ) ) ( not ( = ?AUTO_2870 ?AUTO_2873 ) ) ( not ( = ?AUTO_2872 ?AUTO_2873 ) ) ( not ( = ?AUTO_2871 ?AUTO_2873 ) ) ( ON ?AUTO_2873 ?AUTO_2871 ) ( ON ?AUTO_2872 ?AUTO_2873 ) ( not ( = ?AUTO_2868 ?AUTO_2874 ) ) ( not ( = ?AUTO_2869 ?AUTO_2874 ) ) ( not ( = ?AUTO_2870 ?AUTO_2874 ) ) ( not ( = ?AUTO_2871 ?AUTO_2874 ) ) ( not ( = ?AUTO_2872 ?AUTO_2874 ) ) ( not ( = ?AUTO_2873 ?AUTO_2874 ) ) ( ON ?AUTO_2874 ?AUTO_2872 ) ( CLEAR ?AUTO_2874 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2874 ?AUTO_2872 )
      ( MAKE-ON ?AUTO_2868 ?AUTO_2869 )
      ( MAKE-ON-VERIFY ?AUTO_2868 ?AUTO_2869 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2877 - BLOCK
      ?AUTO_2878 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2877 ) ( CLEAR ?AUTO_2878 ) ( not ( = ?AUTO_2877 ?AUTO_2878 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2877 ?AUTO_2878 )
      ( MAKE-ON-VERIFY ?AUTO_2877 ?AUTO_2878 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2879 - BLOCK
      ?AUTO_2880 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2880 ) ( not ( = ?AUTO_2879 ?AUTO_2880 ) ) ( ON-TABLE ?AUTO_2879 ) ( CLEAR ?AUTO_2879 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_2879 )
      ( MAKE-ON ?AUTO_2879 ?AUTO_2880 )
      ( MAKE-ON-VERIFY ?AUTO_2879 ?AUTO_2880 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2881 - BLOCK
      ?AUTO_2882 - BLOCK
    )
    :vars
    (
      ?AUTO_2883 - BLOCK
      ?AUTO_2884 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2882 ) ( not ( = ?AUTO_2881 ?AUTO_2882 ) ) ( ON-TABLE ?AUTO_2881 ) ( CLEAR ?AUTO_2881 ) ( HOLDING ?AUTO_2883 ) ( CLEAR ?AUTO_2884 ) ( not ( = ?AUTO_2881 ?AUTO_2883 ) ) ( not ( = ?AUTO_2881 ?AUTO_2884 ) ) ( not ( = ?AUTO_2882 ?AUTO_2883 ) ) ( not ( = ?AUTO_2882 ?AUTO_2884 ) ) ( not ( = ?AUTO_2883 ?AUTO_2884 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2883 ?AUTO_2884 )
      ( MAKE-ON ?AUTO_2881 ?AUTO_2882 )
      ( MAKE-ON-VERIFY ?AUTO_2881 ?AUTO_2882 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2891 - BLOCK
      ?AUTO_2892 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2891 ?AUTO_2892 ) ) ( ON-TABLE ?AUTO_2891 ) ( CLEAR ?AUTO_2891 ) ( HOLDING ?AUTO_2892 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2892 )
      ( MAKE-ON ?AUTO_2891 ?AUTO_2892 )
      ( MAKE-ON-VERIFY ?AUTO_2891 ?AUTO_2892 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2897 - BLOCK
      ?AUTO_2898 - BLOCK
    )
    :vars
    (
      ?AUTO_2899 - BLOCK
      ?AUTO_2900 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2897 ?AUTO_2898 ) ) ( ON-TABLE ?AUTO_2897 ) ( CLEAR ?AUTO_2897 ) ( CLEAR ?AUTO_2899 ) ( not ( = ?AUTO_2897 ?AUTO_2900 ) ) ( not ( = ?AUTO_2897 ?AUTO_2899 ) ) ( not ( = ?AUTO_2898 ?AUTO_2900 ) ) ( not ( = ?AUTO_2898 ?AUTO_2899 ) ) ( not ( = ?AUTO_2900 ?AUTO_2899 ) ) ( ON ?AUTO_2900 ?AUTO_2898 ) ( CLEAR ?AUTO_2900 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2900 ?AUTO_2898 )
      ( MAKE-ON ?AUTO_2897 ?AUTO_2898 )
      ( MAKE-ON-VERIFY ?AUTO_2897 ?AUTO_2898 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2901 - BLOCK
      ?AUTO_2902 - BLOCK
    )
    :vars
    (
      ?AUTO_2903 - BLOCK
      ?AUTO_2904 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2901 ?AUTO_2902 ) ) ( CLEAR ?AUTO_2903 ) ( not ( = ?AUTO_2901 ?AUTO_2904 ) ) ( not ( = ?AUTO_2901 ?AUTO_2903 ) ) ( not ( = ?AUTO_2902 ?AUTO_2904 ) ) ( not ( = ?AUTO_2902 ?AUTO_2903 ) ) ( not ( = ?AUTO_2904 ?AUTO_2903 ) ) ( ON ?AUTO_2904 ?AUTO_2902 ) ( CLEAR ?AUTO_2904 ) ( HOLDING ?AUTO_2901 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2901 )
      ( MAKE-ON ?AUTO_2901 ?AUTO_2902 )
      ( MAKE-ON-VERIFY ?AUTO_2901 ?AUTO_2902 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2905 - BLOCK
      ?AUTO_2906 - BLOCK
    )
    :vars
    (
      ?AUTO_2908 - BLOCK
      ?AUTO_2907 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2905 ?AUTO_2906 ) ) ( CLEAR ?AUTO_2908 ) ( not ( = ?AUTO_2905 ?AUTO_2907 ) ) ( not ( = ?AUTO_2905 ?AUTO_2908 ) ) ( not ( = ?AUTO_2906 ?AUTO_2907 ) ) ( not ( = ?AUTO_2906 ?AUTO_2908 ) ) ( not ( = ?AUTO_2907 ?AUTO_2908 ) ) ( ON ?AUTO_2907 ?AUTO_2906 ) ( ON ?AUTO_2905 ?AUTO_2907 ) ( CLEAR ?AUTO_2905 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2905 ?AUTO_2907 )
      ( MAKE-ON ?AUTO_2905 ?AUTO_2906 )
      ( MAKE-ON-VERIFY ?AUTO_2905 ?AUTO_2906 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2910 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2910 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2910 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2910 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2911 - BLOCK
    )
    :vars
    (
      ?AUTO_2912 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2911 ?AUTO_2912 ) ( CLEAR ?AUTO_2911 ) ( HAND-EMPTY ) ( not ( = ?AUTO_2911 ?AUTO_2912 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2911 ?AUTO_2912 )
      ( MAKE-ON-TABLE ?AUTO_2911 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2911 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2914 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2914 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2914 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2914 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2915 - BLOCK
    )
    :vars
    (
      ?AUTO_2916 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2915 ?AUTO_2916 ) ( CLEAR ?AUTO_2915 ) ( HAND-EMPTY ) ( not ( = ?AUTO_2915 ?AUTO_2916 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2915 ?AUTO_2916 )
      ( MAKE-ON-TABLE ?AUTO_2915 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2915 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2917 - BLOCK
    )
    :vars
    (
      ?AUTO_2918 - BLOCK
      ?AUTO_2919 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2917 ?AUTO_2918 ) ( CLEAR ?AUTO_2917 ) ( not ( = ?AUTO_2917 ?AUTO_2918 ) ) ( HOLDING ?AUTO_2919 ) ( not ( = ?AUTO_2917 ?AUTO_2919 ) ) ( not ( = ?AUTO_2918 ?AUTO_2919 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2919 )
      ( MAKE-ON-TABLE ?AUTO_2917 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2917 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2920 - BLOCK
    )
    :vars
    (
      ?AUTO_2921 - BLOCK
      ?AUTO_2922 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2920 ?AUTO_2921 ) ( not ( = ?AUTO_2920 ?AUTO_2921 ) ) ( not ( = ?AUTO_2920 ?AUTO_2922 ) ) ( not ( = ?AUTO_2921 ?AUTO_2922 ) ) ( ON ?AUTO_2922 ?AUTO_2920 ) ( CLEAR ?AUTO_2922 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2922 ?AUTO_2920 )
      ( MAKE-ON-TABLE ?AUTO_2920 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2920 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2924 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2924 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2924 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2924 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2925 - BLOCK
    )
    :vars
    (
      ?AUTO_2926 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2925 ?AUTO_2926 ) ( CLEAR ?AUTO_2925 ) ( HAND-EMPTY ) ( not ( = ?AUTO_2925 ?AUTO_2926 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2925 ?AUTO_2926 )
      ( MAKE-ON-TABLE ?AUTO_2925 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2925 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2927 - BLOCK
    )
    :vars
    (
      ?AUTO_2928 - BLOCK
      ?AUTO_2929 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2927 ?AUTO_2928 ) ( CLEAR ?AUTO_2927 ) ( not ( = ?AUTO_2927 ?AUTO_2928 ) ) ( HOLDING ?AUTO_2929 ) ( not ( = ?AUTO_2927 ?AUTO_2929 ) ) ( not ( = ?AUTO_2928 ?AUTO_2929 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2929 )
      ( MAKE-ON-TABLE ?AUTO_2927 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2927 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2935 - BLOCK
      ?AUTO_2936 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2935 ) ( CLEAR ?AUTO_2936 ) ( not ( = ?AUTO_2935 ?AUTO_2936 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2935 ?AUTO_2936 )
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
    )
    :precondition
    ( and ( CLEAR ?AUTO_2938 ) ( not ( = ?AUTO_2937 ?AUTO_2938 ) ) ( ON ?AUTO_2937 ?AUTO_2939 ) ( CLEAR ?AUTO_2937 ) ( HAND-EMPTY ) ( not ( = ?AUTO_2937 ?AUTO_2939 ) ) ( not ( = ?AUTO_2938 ?AUTO_2939 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2937 ?AUTO_2939 )
      ( MAKE-ON ?AUTO_2937 ?AUTO_2938 )
      ( MAKE-ON-VERIFY ?AUTO_2937 ?AUTO_2938 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2940 - BLOCK
      ?AUTO_2941 - BLOCK
    )
    :vars
    (
      ?AUTO_2942 - BLOCK
      ?AUTO_2943 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2941 ) ( not ( = ?AUTO_2940 ?AUTO_2941 ) ) ( ON ?AUTO_2940 ?AUTO_2942 ) ( CLEAR ?AUTO_2940 ) ( not ( = ?AUTO_2940 ?AUTO_2942 ) ) ( not ( = ?AUTO_2941 ?AUTO_2942 ) ) ( HOLDING ?AUTO_2943 ) ( not ( = ?AUTO_2940 ?AUTO_2943 ) ) ( not ( = ?AUTO_2941 ?AUTO_2943 ) ) ( not ( = ?AUTO_2942 ?AUTO_2943 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2943 )
      ( MAKE-ON ?AUTO_2940 ?AUTO_2941 )
      ( MAKE-ON-VERIFY ?AUTO_2940 ?AUTO_2941 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2944 - BLOCK
      ?AUTO_2945 - BLOCK
    )
    :vars
    (
      ?AUTO_2946 - BLOCK
      ?AUTO_2947 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2945 ) ( not ( = ?AUTO_2944 ?AUTO_2945 ) ) ( ON ?AUTO_2944 ?AUTO_2946 ) ( not ( = ?AUTO_2944 ?AUTO_2946 ) ) ( not ( = ?AUTO_2945 ?AUTO_2946 ) ) ( not ( = ?AUTO_2944 ?AUTO_2947 ) ) ( not ( = ?AUTO_2945 ?AUTO_2947 ) ) ( not ( = ?AUTO_2946 ?AUTO_2947 ) ) ( ON ?AUTO_2947 ?AUTO_2944 ) ( CLEAR ?AUTO_2947 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2947 ?AUTO_2944 )
      ( MAKE-ON ?AUTO_2944 ?AUTO_2945 )
      ( MAKE-ON-VERIFY ?AUTO_2944 ?AUTO_2945 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2948 - BLOCK
      ?AUTO_2949 - BLOCK
    )
    :vars
    (
      ?AUTO_2950 - BLOCK
      ?AUTO_2951 - BLOCK
      ?AUTO_2952 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2949 ) ( not ( = ?AUTO_2948 ?AUTO_2949 ) ) ( ON ?AUTO_2948 ?AUTO_2950 ) ( not ( = ?AUTO_2948 ?AUTO_2950 ) ) ( not ( = ?AUTO_2949 ?AUTO_2950 ) ) ( not ( = ?AUTO_2948 ?AUTO_2951 ) ) ( not ( = ?AUTO_2949 ?AUTO_2951 ) ) ( not ( = ?AUTO_2950 ?AUTO_2951 ) ) ( ON ?AUTO_2951 ?AUTO_2948 ) ( CLEAR ?AUTO_2951 ) ( HOLDING ?AUTO_2952 ) ( not ( = ?AUTO_2948 ?AUTO_2952 ) ) ( not ( = ?AUTO_2949 ?AUTO_2952 ) ) ( not ( = ?AUTO_2950 ?AUTO_2952 ) ) ( not ( = ?AUTO_2951 ?AUTO_2952 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2952 )
      ( MAKE-ON ?AUTO_2948 ?AUTO_2949 )
      ( MAKE-ON-VERIFY ?AUTO_2948 ?AUTO_2949 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2960 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2960 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2960 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2960 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2961 - BLOCK
    )
    :vars
    (
      ?AUTO_2962 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2961 ?AUTO_2962 ) ( CLEAR ?AUTO_2961 ) ( HAND-EMPTY ) ( not ( = ?AUTO_2961 ?AUTO_2962 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2961 ?AUTO_2962 )
      ( MAKE-ON-TABLE ?AUTO_2961 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2961 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2963 - BLOCK
    )
    :vars
    (
      ?AUTO_2964 - BLOCK
      ?AUTO_2965 - BLOCK
      ?AUTO_2966 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2963 ?AUTO_2964 ) ( CLEAR ?AUTO_2963 ) ( not ( = ?AUTO_2963 ?AUTO_2964 ) ) ( HOLDING ?AUTO_2965 ) ( CLEAR ?AUTO_2966 ) ( not ( = ?AUTO_2963 ?AUTO_2965 ) ) ( not ( = ?AUTO_2963 ?AUTO_2966 ) ) ( not ( = ?AUTO_2964 ?AUTO_2965 ) ) ( not ( = ?AUTO_2964 ?AUTO_2966 ) ) ( not ( = ?AUTO_2965 ?AUTO_2966 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2965 ?AUTO_2966 )
      ( MAKE-ON-TABLE ?AUTO_2963 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2963 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2967 - BLOCK
    )
    :vars
    (
      ?AUTO_2968 - BLOCK
      ?AUTO_2970 - BLOCK
      ?AUTO_2969 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2967 ?AUTO_2968 ) ( not ( = ?AUTO_2967 ?AUTO_2968 ) ) ( CLEAR ?AUTO_2970 ) ( not ( = ?AUTO_2967 ?AUTO_2969 ) ) ( not ( = ?AUTO_2967 ?AUTO_2970 ) ) ( not ( = ?AUTO_2968 ?AUTO_2969 ) ) ( not ( = ?AUTO_2968 ?AUTO_2970 ) ) ( not ( = ?AUTO_2969 ?AUTO_2970 ) ) ( ON ?AUTO_2969 ?AUTO_2967 ) ( CLEAR ?AUTO_2969 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2969 ?AUTO_2967 )
      ( MAKE-ON-TABLE ?AUTO_2967 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2967 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2971 - BLOCK
    )
    :vars
    (
      ?AUTO_2973 - BLOCK
      ?AUTO_2974 - BLOCK
      ?AUTO_2972 - BLOCK
      ?AUTO_2975 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2971 ?AUTO_2973 ) ( not ( = ?AUTO_2971 ?AUTO_2973 ) ) ( CLEAR ?AUTO_2974 ) ( not ( = ?AUTO_2971 ?AUTO_2972 ) ) ( not ( = ?AUTO_2971 ?AUTO_2974 ) ) ( not ( = ?AUTO_2973 ?AUTO_2972 ) ) ( not ( = ?AUTO_2973 ?AUTO_2974 ) ) ( not ( = ?AUTO_2972 ?AUTO_2974 ) ) ( ON ?AUTO_2972 ?AUTO_2971 ) ( CLEAR ?AUTO_2972 ) ( HOLDING ?AUTO_2975 ) ( not ( = ?AUTO_2971 ?AUTO_2975 ) ) ( not ( = ?AUTO_2973 ?AUTO_2975 ) ) ( not ( = ?AUTO_2974 ?AUTO_2975 ) ) ( not ( = ?AUTO_2972 ?AUTO_2975 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2975 )
      ( MAKE-ON-TABLE ?AUTO_2971 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2971 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2976 - BLOCK
    )
    :vars
    (
      ?AUTO_2978 - BLOCK
      ?AUTO_2980 - BLOCK
      ?AUTO_2977 - BLOCK
      ?AUTO_2979 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2976 ?AUTO_2978 ) ( not ( = ?AUTO_2976 ?AUTO_2978 ) ) ( CLEAR ?AUTO_2980 ) ( not ( = ?AUTO_2976 ?AUTO_2977 ) ) ( not ( = ?AUTO_2976 ?AUTO_2980 ) ) ( not ( = ?AUTO_2978 ?AUTO_2977 ) ) ( not ( = ?AUTO_2978 ?AUTO_2980 ) ) ( not ( = ?AUTO_2977 ?AUTO_2980 ) ) ( ON ?AUTO_2977 ?AUTO_2976 ) ( not ( = ?AUTO_2976 ?AUTO_2979 ) ) ( not ( = ?AUTO_2978 ?AUTO_2979 ) ) ( not ( = ?AUTO_2980 ?AUTO_2979 ) ) ( not ( = ?AUTO_2977 ?AUTO_2979 ) ) ( ON ?AUTO_2979 ?AUTO_2977 ) ( CLEAR ?AUTO_2979 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2979 ?AUTO_2977 )
      ( MAKE-ON-TABLE ?AUTO_2976 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2976 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2981 - BLOCK
    )
    :vars
    (
      ?AUTO_2983 - BLOCK
      ?AUTO_2984 - BLOCK
      ?AUTO_2985 - BLOCK
      ?AUTO_2982 - BLOCK
      ?AUTO_2986 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2981 ?AUTO_2983 ) ( not ( = ?AUTO_2981 ?AUTO_2983 ) ) ( CLEAR ?AUTO_2984 ) ( not ( = ?AUTO_2981 ?AUTO_2985 ) ) ( not ( = ?AUTO_2981 ?AUTO_2984 ) ) ( not ( = ?AUTO_2983 ?AUTO_2985 ) ) ( not ( = ?AUTO_2983 ?AUTO_2984 ) ) ( not ( = ?AUTO_2985 ?AUTO_2984 ) ) ( ON ?AUTO_2985 ?AUTO_2981 ) ( not ( = ?AUTO_2981 ?AUTO_2982 ) ) ( not ( = ?AUTO_2983 ?AUTO_2982 ) ) ( not ( = ?AUTO_2984 ?AUTO_2982 ) ) ( not ( = ?AUTO_2985 ?AUTO_2982 ) ) ( ON ?AUTO_2982 ?AUTO_2985 ) ( CLEAR ?AUTO_2982 ) ( HOLDING ?AUTO_2986 ) ( not ( = ?AUTO_2981 ?AUTO_2986 ) ) ( not ( = ?AUTO_2983 ?AUTO_2986 ) ) ( not ( = ?AUTO_2984 ?AUTO_2986 ) ) ( not ( = ?AUTO_2985 ?AUTO_2986 ) ) ( not ( = ?AUTO_2982 ?AUTO_2986 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2986 )
      ( MAKE-ON-TABLE ?AUTO_2981 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2981 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2992 - BLOCK
      ?AUTO_2993 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2992 ) ( CLEAR ?AUTO_2993 ) ( not ( = ?AUTO_2992 ?AUTO_2993 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2992 ?AUTO_2993 )
      ( MAKE-ON-VERIFY ?AUTO_2992 ?AUTO_2993 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2994 - BLOCK
      ?AUTO_2995 - BLOCK
    )
    :vars
    (
      ?AUTO_2996 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2995 ) ( not ( = ?AUTO_2994 ?AUTO_2995 ) ) ( ON ?AUTO_2994 ?AUTO_2996 ) ( CLEAR ?AUTO_2994 ) ( HAND-EMPTY ) ( not ( = ?AUTO_2994 ?AUTO_2996 ) ) ( not ( = ?AUTO_2995 ?AUTO_2996 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2994 ?AUTO_2996 )
      ( MAKE-ON ?AUTO_2994 ?AUTO_2995 )
      ( MAKE-ON-VERIFY ?AUTO_2994 ?AUTO_2995 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2997 - BLOCK
      ?AUTO_2998 - BLOCK
    )
    :vars
    (
      ?AUTO_2999 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2997 ?AUTO_2998 ) ) ( ON ?AUTO_2997 ?AUTO_2999 ) ( CLEAR ?AUTO_2997 ) ( not ( = ?AUTO_2997 ?AUTO_2999 ) ) ( not ( = ?AUTO_2998 ?AUTO_2999 ) ) ( HOLDING ?AUTO_2998 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2998 )
      ( MAKE-ON ?AUTO_2997 ?AUTO_2998 )
      ( MAKE-ON-VERIFY ?AUTO_2997 ?AUTO_2998 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3002 - BLOCK
      ?AUTO_3003 - BLOCK
    )
    :vars
    (
      ?AUTO_3004 - BLOCK
      ?AUTO_3005 - BLOCK
      ?AUTO_3006 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3003 ) ( not ( = ?AUTO_3002 ?AUTO_3003 ) ) ( ON ?AUTO_3002 ?AUTO_3004 ) ( CLEAR ?AUTO_3002 ) ( not ( = ?AUTO_3002 ?AUTO_3004 ) ) ( not ( = ?AUTO_3003 ?AUTO_3004 ) ) ( HOLDING ?AUTO_3005 ) ( CLEAR ?AUTO_3006 ) ( not ( = ?AUTO_3002 ?AUTO_3005 ) ) ( not ( = ?AUTO_3002 ?AUTO_3006 ) ) ( not ( = ?AUTO_3003 ?AUTO_3005 ) ) ( not ( = ?AUTO_3003 ?AUTO_3006 ) ) ( not ( = ?AUTO_3004 ?AUTO_3005 ) ) ( not ( = ?AUTO_3004 ?AUTO_3006 ) ) ( not ( = ?AUTO_3005 ?AUTO_3006 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3005 ?AUTO_3006 )
      ( MAKE-ON ?AUTO_3002 ?AUTO_3003 )
      ( MAKE-ON-VERIFY ?AUTO_3002 ?AUTO_3003 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3007 - BLOCK
      ?AUTO_3008 - BLOCK
    )
    :vars
    (
      ?AUTO_3009 - BLOCK
      ?AUTO_3010 - BLOCK
      ?AUTO_3011 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3007 ?AUTO_3008 ) ) ( ON ?AUTO_3007 ?AUTO_3009 ) ( CLEAR ?AUTO_3007 ) ( not ( = ?AUTO_3007 ?AUTO_3009 ) ) ( not ( = ?AUTO_3008 ?AUTO_3009 ) ) ( CLEAR ?AUTO_3010 ) ( not ( = ?AUTO_3007 ?AUTO_3011 ) ) ( not ( = ?AUTO_3007 ?AUTO_3010 ) ) ( not ( = ?AUTO_3008 ?AUTO_3011 ) ) ( not ( = ?AUTO_3008 ?AUTO_3010 ) ) ( not ( = ?AUTO_3009 ?AUTO_3011 ) ) ( not ( = ?AUTO_3009 ?AUTO_3010 ) ) ( not ( = ?AUTO_3011 ?AUTO_3010 ) ) ( ON ?AUTO_3011 ?AUTO_3008 ) ( CLEAR ?AUTO_3011 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3011 ?AUTO_3008 )
      ( MAKE-ON ?AUTO_3007 ?AUTO_3008 )
      ( MAKE-ON-VERIFY ?AUTO_3007 ?AUTO_3008 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3012 - BLOCK
      ?AUTO_3013 - BLOCK
    )
    :vars
    (
      ?AUTO_3014 - BLOCK
      ?AUTO_3015 - BLOCK
      ?AUTO_3016 - BLOCK
      ?AUTO_3017 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3012 ?AUTO_3013 ) ) ( ON ?AUTO_3012 ?AUTO_3014 ) ( CLEAR ?AUTO_3012 ) ( not ( = ?AUTO_3012 ?AUTO_3014 ) ) ( not ( = ?AUTO_3013 ?AUTO_3014 ) ) ( CLEAR ?AUTO_3015 ) ( not ( = ?AUTO_3012 ?AUTO_3016 ) ) ( not ( = ?AUTO_3012 ?AUTO_3015 ) ) ( not ( = ?AUTO_3013 ?AUTO_3016 ) ) ( not ( = ?AUTO_3013 ?AUTO_3015 ) ) ( not ( = ?AUTO_3014 ?AUTO_3016 ) ) ( not ( = ?AUTO_3014 ?AUTO_3015 ) ) ( not ( = ?AUTO_3016 ?AUTO_3015 ) ) ( ON ?AUTO_3016 ?AUTO_3013 ) ( CLEAR ?AUTO_3016 ) ( HOLDING ?AUTO_3017 ) ( not ( = ?AUTO_3012 ?AUTO_3017 ) ) ( not ( = ?AUTO_3013 ?AUTO_3017 ) ) ( not ( = ?AUTO_3014 ?AUTO_3017 ) ) ( not ( = ?AUTO_3015 ?AUTO_3017 ) ) ( not ( = ?AUTO_3016 ?AUTO_3017 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3017 )
      ( MAKE-ON ?AUTO_3012 ?AUTO_3013 )
      ( MAKE-ON-VERIFY ?AUTO_3012 ?AUTO_3013 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3018 - BLOCK
      ?AUTO_3019 - BLOCK
    )
    :vars
    (
      ?AUTO_3021 - BLOCK
      ?AUTO_3020 - BLOCK
      ?AUTO_3022 - BLOCK
      ?AUTO_3023 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3018 ?AUTO_3019 ) ) ( ON ?AUTO_3018 ?AUTO_3021 ) ( CLEAR ?AUTO_3018 ) ( not ( = ?AUTO_3018 ?AUTO_3021 ) ) ( not ( = ?AUTO_3019 ?AUTO_3021 ) ) ( CLEAR ?AUTO_3020 ) ( not ( = ?AUTO_3018 ?AUTO_3022 ) ) ( not ( = ?AUTO_3018 ?AUTO_3020 ) ) ( not ( = ?AUTO_3019 ?AUTO_3022 ) ) ( not ( = ?AUTO_3019 ?AUTO_3020 ) ) ( not ( = ?AUTO_3021 ?AUTO_3022 ) ) ( not ( = ?AUTO_3021 ?AUTO_3020 ) ) ( not ( = ?AUTO_3022 ?AUTO_3020 ) ) ( ON ?AUTO_3022 ?AUTO_3019 ) ( not ( = ?AUTO_3018 ?AUTO_3023 ) ) ( not ( = ?AUTO_3019 ?AUTO_3023 ) ) ( not ( = ?AUTO_3021 ?AUTO_3023 ) ) ( not ( = ?AUTO_3020 ?AUTO_3023 ) ) ( not ( = ?AUTO_3022 ?AUTO_3023 ) ) ( ON ?AUTO_3023 ?AUTO_3022 ) ( CLEAR ?AUTO_3023 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3023 ?AUTO_3022 )
      ( MAKE-ON ?AUTO_3018 ?AUTO_3019 )
      ( MAKE-ON-VERIFY ?AUTO_3018 ?AUTO_3019 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3024 - BLOCK
      ?AUTO_3025 - BLOCK
    )
    :vars
    (
      ?AUTO_3029 - BLOCK
      ?AUTO_3028 - BLOCK
      ?AUTO_3026 - BLOCK
      ?AUTO_3027 - BLOCK
      ?AUTO_3030 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3024 ?AUTO_3025 ) ) ( ON ?AUTO_3024 ?AUTO_3029 ) ( CLEAR ?AUTO_3024 ) ( not ( = ?AUTO_3024 ?AUTO_3029 ) ) ( not ( = ?AUTO_3025 ?AUTO_3029 ) ) ( CLEAR ?AUTO_3028 ) ( not ( = ?AUTO_3024 ?AUTO_3026 ) ) ( not ( = ?AUTO_3024 ?AUTO_3028 ) ) ( not ( = ?AUTO_3025 ?AUTO_3026 ) ) ( not ( = ?AUTO_3025 ?AUTO_3028 ) ) ( not ( = ?AUTO_3029 ?AUTO_3026 ) ) ( not ( = ?AUTO_3029 ?AUTO_3028 ) ) ( not ( = ?AUTO_3026 ?AUTO_3028 ) ) ( ON ?AUTO_3026 ?AUTO_3025 ) ( not ( = ?AUTO_3024 ?AUTO_3027 ) ) ( not ( = ?AUTO_3025 ?AUTO_3027 ) ) ( not ( = ?AUTO_3029 ?AUTO_3027 ) ) ( not ( = ?AUTO_3028 ?AUTO_3027 ) ) ( not ( = ?AUTO_3026 ?AUTO_3027 ) ) ( ON ?AUTO_3027 ?AUTO_3026 ) ( CLEAR ?AUTO_3027 ) ( HOLDING ?AUTO_3030 ) ( not ( = ?AUTO_3024 ?AUTO_3030 ) ) ( not ( = ?AUTO_3025 ?AUTO_3030 ) ) ( not ( = ?AUTO_3029 ?AUTO_3030 ) ) ( not ( = ?AUTO_3028 ?AUTO_3030 ) ) ( not ( = ?AUTO_3026 ?AUTO_3030 ) ) ( not ( = ?AUTO_3027 ?AUTO_3030 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3030 )
      ( MAKE-ON ?AUTO_3024 ?AUTO_3025 )
      ( MAKE-ON-VERIFY ?AUTO_3024 ?AUTO_3025 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3031 - BLOCK
      ?AUTO_3032 - BLOCK
    )
    :vars
    (
      ?AUTO_3033 - BLOCK
      ?AUTO_3037 - BLOCK
      ?AUTO_3035 - BLOCK
      ?AUTO_3036 - BLOCK
      ?AUTO_3034 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3031 ?AUTO_3032 ) ) ( ON ?AUTO_3031 ?AUTO_3033 ) ( not ( = ?AUTO_3031 ?AUTO_3033 ) ) ( not ( = ?AUTO_3032 ?AUTO_3033 ) ) ( CLEAR ?AUTO_3037 ) ( not ( = ?AUTO_3031 ?AUTO_3035 ) ) ( not ( = ?AUTO_3031 ?AUTO_3037 ) ) ( not ( = ?AUTO_3032 ?AUTO_3035 ) ) ( not ( = ?AUTO_3032 ?AUTO_3037 ) ) ( not ( = ?AUTO_3033 ?AUTO_3035 ) ) ( not ( = ?AUTO_3033 ?AUTO_3037 ) ) ( not ( = ?AUTO_3035 ?AUTO_3037 ) ) ( ON ?AUTO_3035 ?AUTO_3032 ) ( not ( = ?AUTO_3031 ?AUTO_3036 ) ) ( not ( = ?AUTO_3032 ?AUTO_3036 ) ) ( not ( = ?AUTO_3033 ?AUTO_3036 ) ) ( not ( = ?AUTO_3037 ?AUTO_3036 ) ) ( not ( = ?AUTO_3035 ?AUTO_3036 ) ) ( ON ?AUTO_3036 ?AUTO_3035 ) ( CLEAR ?AUTO_3036 ) ( not ( = ?AUTO_3031 ?AUTO_3034 ) ) ( not ( = ?AUTO_3032 ?AUTO_3034 ) ) ( not ( = ?AUTO_3033 ?AUTO_3034 ) ) ( not ( = ?AUTO_3037 ?AUTO_3034 ) ) ( not ( = ?AUTO_3035 ?AUTO_3034 ) ) ( not ( = ?AUTO_3036 ?AUTO_3034 ) ) ( ON ?AUTO_3034 ?AUTO_3031 ) ( CLEAR ?AUTO_3034 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3034 ?AUTO_3031 )
      ( MAKE-ON ?AUTO_3031 ?AUTO_3032 )
      ( MAKE-ON-VERIFY ?AUTO_3031 ?AUTO_3032 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3038 - BLOCK
      ?AUTO_3039 - BLOCK
    )
    :vars
    (
      ?AUTO_3042 - BLOCK
      ?AUTO_3044 - BLOCK
      ?AUTO_3041 - BLOCK
      ?AUTO_3040 - BLOCK
      ?AUTO_3043 - BLOCK
      ?AUTO_3045 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3038 ?AUTO_3039 ) ) ( ON ?AUTO_3038 ?AUTO_3042 ) ( not ( = ?AUTO_3038 ?AUTO_3042 ) ) ( not ( = ?AUTO_3039 ?AUTO_3042 ) ) ( CLEAR ?AUTO_3044 ) ( not ( = ?AUTO_3038 ?AUTO_3041 ) ) ( not ( = ?AUTO_3038 ?AUTO_3044 ) ) ( not ( = ?AUTO_3039 ?AUTO_3041 ) ) ( not ( = ?AUTO_3039 ?AUTO_3044 ) ) ( not ( = ?AUTO_3042 ?AUTO_3041 ) ) ( not ( = ?AUTO_3042 ?AUTO_3044 ) ) ( not ( = ?AUTO_3041 ?AUTO_3044 ) ) ( ON ?AUTO_3041 ?AUTO_3039 ) ( not ( = ?AUTO_3038 ?AUTO_3040 ) ) ( not ( = ?AUTO_3039 ?AUTO_3040 ) ) ( not ( = ?AUTO_3042 ?AUTO_3040 ) ) ( not ( = ?AUTO_3044 ?AUTO_3040 ) ) ( not ( = ?AUTO_3041 ?AUTO_3040 ) ) ( ON ?AUTO_3040 ?AUTO_3041 ) ( CLEAR ?AUTO_3040 ) ( not ( = ?AUTO_3038 ?AUTO_3043 ) ) ( not ( = ?AUTO_3039 ?AUTO_3043 ) ) ( not ( = ?AUTO_3042 ?AUTO_3043 ) ) ( not ( = ?AUTO_3044 ?AUTO_3043 ) ) ( not ( = ?AUTO_3041 ?AUTO_3043 ) ) ( not ( = ?AUTO_3040 ?AUTO_3043 ) ) ( ON ?AUTO_3043 ?AUTO_3038 ) ( CLEAR ?AUTO_3043 ) ( HOLDING ?AUTO_3045 ) ( not ( = ?AUTO_3038 ?AUTO_3045 ) ) ( not ( = ?AUTO_3039 ?AUTO_3045 ) ) ( not ( = ?AUTO_3042 ?AUTO_3045 ) ) ( not ( = ?AUTO_3044 ?AUTO_3045 ) ) ( not ( = ?AUTO_3041 ?AUTO_3045 ) ) ( not ( = ?AUTO_3040 ?AUTO_3045 ) ) ( not ( = ?AUTO_3043 ?AUTO_3045 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3045 )
      ( MAKE-ON ?AUTO_3038 ?AUTO_3039 )
      ( MAKE-ON-VERIFY ?AUTO_3038 ?AUTO_3039 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3046 - BLOCK
      ?AUTO_3047 - BLOCK
    )
    :vars
    (
      ?AUTO_3053 - BLOCK
      ?AUTO_3049 - BLOCK
      ?AUTO_3051 - BLOCK
      ?AUTO_3050 - BLOCK
      ?AUTO_3048 - BLOCK
      ?AUTO_3052 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3046 ?AUTO_3047 ) ) ( ON ?AUTO_3046 ?AUTO_3053 ) ( not ( = ?AUTO_3046 ?AUTO_3053 ) ) ( not ( = ?AUTO_3047 ?AUTO_3053 ) ) ( CLEAR ?AUTO_3049 ) ( not ( = ?AUTO_3046 ?AUTO_3051 ) ) ( not ( = ?AUTO_3046 ?AUTO_3049 ) ) ( not ( = ?AUTO_3047 ?AUTO_3051 ) ) ( not ( = ?AUTO_3047 ?AUTO_3049 ) ) ( not ( = ?AUTO_3053 ?AUTO_3051 ) ) ( not ( = ?AUTO_3053 ?AUTO_3049 ) ) ( not ( = ?AUTO_3051 ?AUTO_3049 ) ) ( ON ?AUTO_3051 ?AUTO_3047 ) ( not ( = ?AUTO_3046 ?AUTO_3050 ) ) ( not ( = ?AUTO_3047 ?AUTO_3050 ) ) ( not ( = ?AUTO_3053 ?AUTO_3050 ) ) ( not ( = ?AUTO_3049 ?AUTO_3050 ) ) ( not ( = ?AUTO_3051 ?AUTO_3050 ) ) ( ON ?AUTO_3050 ?AUTO_3051 ) ( CLEAR ?AUTO_3050 ) ( not ( = ?AUTO_3046 ?AUTO_3048 ) ) ( not ( = ?AUTO_3047 ?AUTO_3048 ) ) ( not ( = ?AUTO_3053 ?AUTO_3048 ) ) ( not ( = ?AUTO_3049 ?AUTO_3048 ) ) ( not ( = ?AUTO_3051 ?AUTO_3048 ) ) ( not ( = ?AUTO_3050 ?AUTO_3048 ) ) ( ON ?AUTO_3048 ?AUTO_3046 ) ( not ( = ?AUTO_3046 ?AUTO_3052 ) ) ( not ( = ?AUTO_3047 ?AUTO_3052 ) ) ( not ( = ?AUTO_3053 ?AUTO_3052 ) ) ( not ( = ?AUTO_3049 ?AUTO_3052 ) ) ( not ( = ?AUTO_3051 ?AUTO_3052 ) ) ( not ( = ?AUTO_3050 ?AUTO_3052 ) ) ( not ( = ?AUTO_3048 ?AUTO_3052 ) ) ( ON ?AUTO_3052 ?AUTO_3048 ) ( CLEAR ?AUTO_3052 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3052 ?AUTO_3048 )
      ( MAKE-ON ?AUTO_3046 ?AUTO_3047 )
      ( MAKE-ON-VERIFY ?AUTO_3046 ?AUTO_3047 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3056 - BLOCK
      ?AUTO_3057 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3056 ) ( CLEAR ?AUTO_3057 ) ( not ( = ?AUTO_3056 ?AUTO_3057 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3056 ?AUTO_3057 )
      ( MAKE-ON-VERIFY ?AUTO_3056 ?AUTO_3057 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3058 - BLOCK
      ?AUTO_3059 - BLOCK
    )
    :vars
    (
      ?AUTO_3060 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3059 ) ( not ( = ?AUTO_3058 ?AUTO_3059 ) ) ( ON ?AUTO_3058 ?AUTO_3060 ) ( CLEAR ?AUTO_3058 ) ( HAND-EMPTY ) ( not ( = ?AUTO_3058 ?AUTO_3060 ) ) ( not ( = ?AUTO_3059 ?AUTO_3060 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3058 ?AUTO_3060 )
      ( MAKE-ON ?AUTO_3058 ?AUTO_3059 )
      ( MAKE-ON-VERIFY ?AUTO_3058 ?AUTO_3059 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3061 - BLOCK
      ?AUTO_3062 - BLOCK
    )
    :vars
    (
      ?AUTO_3063 - BLOCK
      ?AUTO_3064 - BLOCK
      ?AUTO_3065 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3062 ) ( not ( = ?AUTO_3061 ?AUTO_3062 ) ) ( ON ?AUTO_3061 ?AUTO_3063 ) ( CLEAR ?AUTO_3061 ) ( not ( = ?AUTO_3061 ?AUTO_3063 ) ) ( not ( = ?AUTO_3062 ?AUTO_3063 ) ) ( HOLDING ?AUTO_3064 ) ( CLEAR ?AUTO_3065 ) ( not ( = ?AUTO_3061 ?AUTO_3064 ) ) ( not ( = ?AUTO_3061 ?AUTO_3065 ) ) ( not ( = ?AUTO_3062 ?AUTO_3064 ) ) ( not ( = ?AUTO_3062 ?AUTO_3065 ) ) ( not ( = ?AUTO_3063 ?AUTO_3064 ) ) ( not ( = ?AUTO_3063 ?AUTO_3065 ) ) ( not ( = ?AUTO_3064 ?AUTO_3065 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3064 ?AUTO_3065 )
      ( MAKE-ON ?AUTO_3061 ?AUTO_3062 )
      ( MAKE-ON-VERIFY ?AUTO_3061 ?AUTO_3062 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3066 - BLOCK
      ?AUTO_3067 - BLOCK
    )
    :vars
    (
      ?AUTO_3068 - BLOCK
      ?AUTO_3070 - BLOCK
      ?AUTO_3069 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3066 ?AUTO_3067 ) ) ( ON ?AUTO_3066 ?AUTO_3068 ) ( CLEAR ?AUTO_3066 ) ( not ( = ?AUTO_3066 ?AUTO_3068 ) ) ( not ( = ?AUTO_3067 ?AUTO_3068 ) ) ( CLEAR ?AUTO_3070 ) ( not ( = ?AUTO_3066 ?AUTO_3069 ) ) ( not ( = ?AUTO_3066 ?AUTO_3070 ) ) ( not ( = ?AUTO_3067 ?AUTO_3069 ) ) ( not ( = ?AUTO_3067 ?AUTO_3070 ) ) ( not ( = ?AUTO_3068 ?AUTO_3069 ) ) ( not ( = ?AUTO_3068 ?AUTO_3070 ) ) ( not ( = ?AUTO_3069 ?AUTO_3070 ) ) ( ON ?AUTO_3069 ?AUTO_3067 ) ( CLEAR ?AUTO_3069 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3069 ?AUTO_3067 )
      ( MAKE-ON ?AUTO_3066 ?AUTO_3067 )
      ( MAKE-ON-VERIFY ?AUTO_3066 ?AUTO_3067 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3071 - BLOCK
      ?AUTO_3072 - BLOCK
    )
    :vars
    (
      ?AUTO_3075 - BLOCK
      ?AUTO_3073 - BLOCK
      ?AUTO_3074 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3071 ?AUTO_3072 ) ) ( ON ?AUTO_3071 ?AUTO_3075 ) ( CLEAR ?AUTO_3071 ) ( not ( = ?AUTO_3071 ?AUTO_3075 ) ) ( not ( = ?AUTO_3072 ?AUTO_3075 ) ) ( not ( = ?AUTO_3071 ?AUTO_3073 ) ) ( not ( = ?AUTO_3071 ?AUTO_3074 ) ) ( not ( = ?AUTO_3072 ?AUTO_3073 ) ) ( not ( = ?AUTO_3072 ?AUTO_3074 ) ) ( not ( = ?AUTO_3075 ?AUTO_3073 ) ) ( not ( = ?AUTO_3075 ?AUTO_3074 ) ) ( not ( = ?AUTO_3073 ?AUTO_3074 ) ) ( ON ?AUTO_3073 ?AUTO_3072 ) ( CLEAR ?AUTO_3073 ) ( HOLDING ?AUTO_3074 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3074 )
      ( MAKE-ON ?AUTO_3071 ?AUTO_3072 )
      ( MAKE-ON-VERIFY ?AUTO_3071 ?AUTO_3072 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3076 - BLOCK
      ?AUTO_3077 - BLOCK
    )
    :vars
    (
      ?AUTO_3080 - BLOCK
      ?AUTO_3079 - BLOCK
      ?AUTO_3078 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3076 ?AUTO_3077 ) ) ( ON ?AUTO_3076 ?AUTO_3080 ) ( not ( = ?AUTO_3076 ?AUTO_3080 ) ) ( not ( = ?AUTO_3077 ?AUTO_3080 ) ) ( not ( = ?AUTO_3076 ?AUTO_3079 ) ) ( not ( = ?AUTO_3076 ?AUTO_3078 ) ) ( not ( = ?AUTO_3077 ?AUTO_3079 ) ) ( not ( = ?AUTO_3077 ?AUTO_3078 ) ) ( not ( = ?AUTO_3080 ?AUTO_3079 ) ) ( not ( = ?AUTO_3080 ?AUTO_3078 ) ) ( not ( = ?AUTO_3079 ?AUTO_3078 ) ) ( ON ?AUTO_3079 ?AUTO_3077 ) ( CLEAR ?AUTO_3079 ) ( ON ?AUTO_3078 ?AUTO_3076 ) ( CLEAR ?AUTO_3078 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3078 ?AUTO_3076 )
      ( MAKE-ON ?AUTO_3076 ?AUTO_3077 )
      ( MAKE-ON-VERIFY ?AUTO_3076 ?AUTO_3077 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3081 - BLOCK
      ?AUTO_3082 - BLOCK
    )
    :vars
    (
      ?AUTO_3084 - BLOCK
      ?AUTO_3083 - BLOCK
      ?AUTO_3085 - BLOCK
      ?AUTO_3086 - BLOCK
      ?AUTO_3087 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3081 ?AUTO_3082 ) ) ( ON ?AUTO_3081 ?AUTO_3084 ) ( not ( = ?AUTO_3081 ?AUTO_3084 ) ) ( not ( = ?AUTO_3082 ?AUTO_3084 ) ) ( not ( = ?AUTO_3081 ?AUTO_3083 ) ) ( not ( = ?AUTO_3081 ?AUTO_3085 ) ) ( not ( = ?AUTO_3082 ?AUTO_3083 ) ) ( not ( = ?AUTO_3082 ?AUTO_3085 ) ) ( not ( = ?AUTO_3084 ?AUTO_3083 ) ) ( not ( = ?AUTO_3084 ?AUTO_3085 ) ) ( not ( = ?AUTO_3083 ?AUTO_3085 ) ) ( ON ?AUTO_3083 ?AUTO_3082 ) ( CLEAR ?AUTO_3083 ) ( ON ?AUTO_3085 ?AUTO_3081 ) ( CLEAR ?AUTO_3085 ) ( HOLDING ?AUTO_3086 ) ( CLEAR ?AUTO_3087 ) ( not ( = ?AUTO_3081 ?AUTO_3086 ) ) ( not ( = ?AUTO_3081 ?AUTO_3087 ) ) ( not ( = ?AUTO_3082 ?AUTO_3086 ) ) ( not ( = ?AUTO_3082 ?AUTO_3087 ) ) ( not ( = ?AUTO_3084 ?AUTO_3086 ) ) ( not ( = ?AUTO_3084 ?AUTO_3087 ) ) ( not ( = ?AUTO_3083 ?AUTO_3086 ) ) ( not ( = ?AUTO_3083 ?AUTO_3087 ) ) ( not ( = ?AUTO_3085 ?AUTO_3086 ) ) ( not ( = ?AUTO_3085 ?AUTO_3087 ) ) ( not ( = ?AUTO_3086 ?AUTO_3087 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3086 ?AUTO_3087 )
      ( MAKE-ON ?AUTO_3081 ?AUTO_3082 )
      ( MAKE-ON-VERIFY ?AUTO_3081 ?AUTO_3082 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3088 - BLOCK
      ?AUTO_3089 - BLOCK
    )
    :vars
    (
      ?AUTO_3092 - BLOCK
      ?AUTO_3090 - BLOCK
      ?AUTO_3091 - BLOCK
      ?AUTO_3094 - BLOCK
      ?AUTO_3093 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3088 ?AUTO_3089 ) ) ( ON ?AUTO_3088 ?AUTO_3092 ) ( not ( = ?AUTO_3088 ?AUTO_3092 ) ) ( not ( = ?AUTO_3089 ?AUTO_3092 ) ) ( not ( = ?AUTO_3088 ?AUTO_3090 ) ) ( not ( = ?AUTO_3088 ?AUTO_3091 ) ) ( not ( = ?AUTO_3089 ?AUTO_3090 ) ) ( not ( = ?AUTO_3089 ?AUTO_3091 ) ) ( not ( = ?AUTO_3092 ?AUTO_3090 ) ) ( not ( = ?AUTO_3092 ?AUTO_3091 ) ) ( not ( = ?AUTO_3090 ?AUTO_3091 ) ) ( ON ?AUTO_3090 ?AUTO_3089 ) ( CLEAR ?AUTO_3090 ) ( ON ?AUTO_3091 ?AUTO_3088 ) ( CLEAR ?AUTO_3094 ) ( not ( = ?AUTO_3088 ?AUTO_3093 ) ) ( not ( = ?AUTO_3088 ?AUTO_3094 ) ) ( not ( = ?AUTO_3089 ?AUTO_3093 ) ) ( not ( = ?AUTO_3089 ?AUTO_3094 ) ) ( not ( = ?AUTO_3092 ?AUTO_3093 ) ) ( not ( = ?AUTO_3092 ?AUTO_3094 ) ) ( not ( = ?AUTO_3090 ?AUTO_3093 ) ) ( not ( = ?AUTO_3090 ?AUTO_3094 ) ) ( not ( = ?AUTO_3091 ?AUTO_3093 ) ) ( not ( = ?AUTO_3091 ?AUTO_3094 ) ) ( not ( = ?AUTO_3093 ?AUTO_3094 ) ) ( ON ?AUTO_3093 ?AUTO_3091 ) ( CLEAR ?AUTO_3093 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3093 ?AUTO_3091 )
      ( MAKE-ON ?AUTO_3088 ?AUTO_3089 )
      ( MAKE-ON-VERIFY ?AUTO_3088 ?AUTO_3089 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3095 - BLOCK
      ?AUTO_3096 - BLOCK
    )
    :vars
    (
      ?AUTO_3101 - BLOCK
      ?AUTO_3099 - BLOCK
      ?AUTO_3100 - BLOCK
      ?AUTO_3097 - BLOCK
      ?AUTO_3098 - BLOCK
      ?AUTO_3102 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3095 ?AUTO_3096 ) ) ( ON ?AUTO_3095 ?AUTO_3101 ) ( not ( = ?AUTO_3095 ?AUTO_3101 ) ) ( not ( = ?AUTO_3096 ?AUTO_3101 ) ) ( not ( = ?AUTO_3095 ?AUTO_3099 ) ) ( not ( = ?AUTO_3095 ?AUTO_3100 ) ) ( not ( = ?AUTO_3096 ?AUTO_3099 ) ) ( not ( = ?AUTO_3096 ?AUTO_3100 ) ) ( not ( = ?AUTO_3101 ?AUTO_3099 ) ) ( not ( = ?AUTO_3101 ?AUTO_3100 ) ) ( not ( = ?AUTO_3099 ?AUTO_3100 ) ) ( ON ?AUTO_3099 ?AUTO_3096 ) ( CLEAR ?AUTO_3099 ) ( ON ?AUTO_3100 ?AUTO_3095 ) ( CLEAR ?AUTO_3097 ) ( not ( = ?AUTO_3095 ?AUTO_3098 ) ) ( not ( = ?AUTO_3095 ?AUTO_3097 ) ) ( not ( = ?AUTO_3096 ?AUTO_3098 ) ) ( not ( = ?AUTO_3096 ?AUTO_3097 ) ) ( not ( = ?AUTO_3101 ?AUTO_3098 ) ) ( not ( = ?AUTO_3101 ?AUTO_3097 ) ) ( not ( = ?AUTO_3099 ?AUTO_3098 ) ) ( not ( = ?AUTO_3099 ?AUTO_3097 ) ) ( not ( = ?AUTO_3100 ?AUTO_3098 ) ) ( not ( = ?AUTO_3100 ?AUTO_3097 ) ) ( not ( = ?AUTO_3098 ?AUTO_3097 ) ) ( ON ?AUTO_3098 ?AUTO_3100 ) ( CLEAR ?AUTO_3098 ) ( HOLDING ?AUTO_3102 ) ( not ( = ?AUTO_3095 ?AUTO_3102 ) ) ( not ( = ?AUTO_3096 ?AUTO_3102 ) ) ( not ( = ?AUTO_3101 ?AUTO_3102 ) ) ( not ( = ?AUTO_3099 ?AUTO_3102 ) ) ( not ( = ?AUTO_3100 ?AUTO_3102 ) ) ( not ( = ?AUTO_3097 ?AUTO_3102 ) ) ( not ( = ?AUTO_3098 ?AUTO_3102 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3102 )
      ( MAKE-ON ?AUTO_3095 ?AUTO_3096 )
      ( MAKE-ON-VERIFY ?AUTO_3095 ?AUTO_3096 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3103 - BLOCK
      ?AUTO_3104 - BLOCK
    )
    :vars
    (
      ?AUTO_3107 - BLOCK
      ?AUTO_3109 - BLOCK
      ?AUTO_3108 - BLOCK
      ?AUTO_3105 - BLOCK
      ?AUTO_3106 - BLOCK
      ?AUTO_3110 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3103 ?AUTO_3104 ) ) ( ON ?AUTO_3103 ?AUTO_3107 ) ( not ( = ?AUTO_3103 ?AUTO_3107 ) ) ( not ( = ?AUTO_3104 ?AUTO_3107 ) ) ( not ( = ?AUTO_3103 ?AUTO_3109 ) ) ( not ( = ?AUTO_3103 ?AUTO_3108 ) ) ( not ( = ?AUTO_3104 ?AUTO_3109 ) ) ( not ( = ?AUTO_3104 ?AUTO_3108 ) ) ( not ( = ?AUTO_3107 ?AUTO_3109 ) ) ( not ( = ?AUTO_3107 ?AUTO_3108 ) ) ( not ( = ?AUTO_3109 ?AUTO_3108 ) ) ( ON ?AUTO_3109 ?AUTO_3104 ) ( CLEAR ?AUTO_3109 ) ( ON ?AUTO_3108 ?AUTO_3103 ) ( CLEAR ?AUTO_3105 ) ( not ( = ?AUTO_3103 ?AUTO_3106 ) ) ( not ( = ?AUTO_3103 ?AUTO_3105 ) ) ( not ( = ?AUTO_3104 ?AUTO_3106 ) ) ( not ( = ?AUTO_3104 ?AUTO_3105 ) ) ( not ( = ?AUTO_3107 ?AUTO_3106 ) ) ( not ( = ?AUTO_3107 ?AUTO_3105 ) ) ( not ( = ?AUTO_3109 ?AUTO_3106 ) ) ( not ( = ?AUTO_3109 ?AUTO_3105 ) ) ( not ( = ?AUTO_3108 ?AUTO_3106 ) ) ( not ( = ?AUTO_3108 ?AUTO_3105 ) ) ( not ( = ?AUTO_3106 ?AUTO_3105 ) ) ( ON ?AUTO_3106 ?AUTO_3108 ) ( not ( = ?AUTO_3103 ?AUTO_3110 ) ) ( not ( = ?AUTO_3104 ?AUTO_3110 ) ) ( not ( = ?AUTO_3107 ?AUTO_3110 ) ) ( not ( = ?AUTO_3109 ?AUTO_3110 ) ) ( not ( = ?AUTO_3108 ?AUTO_3110 ) ) ( not ( = ?AUTO_3105 ?AUTO_3110 ) ) ( not ( = ?AUTO_3106 ?AUTO_3110 ) ) ( ON ?AUTO_3110 ?AUTO_3106 ) ( CLEAR ?AUTO_3110 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3110 ?AUTO_3106 )
      ( MAKE-ON ?AUTO_3103 ?AUTO_3104 )
      ( MAKE-ON-VERIFY ?AUTO_3103 ?AUTO_3104 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3111 - BLOCK
      ?AUTO_3112 - BLOCK
    )
    :vars
    (
      ?AUTO_3117 - BLOCK
      ?AUTO_3118 - BLOCK
      ?AUTO_3114 - BLOCK
      ?AUTO_3113 - BLOCK
      ?AUTO_3116 - BLOCK
      ?AUTO_3115 - BLOCK
      ?AUTO_3119 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3111 ?AUTO_3112 ) ) ( ON ?AUTO_3111 ?AUTO_3117 ) ( not ( = ?AUTO_3111 ?AUTO_3117 ) ) ( not ( = ?AUTO_3112 ?AUTO_3117 ) ) ( not ( = ?AUTO_3111 ?AUTO_3118 ) ) ( not ( = ?AUTO_3111 ?AUTO_3114 ) ) ( not ( = ?AUTO_3112 ?AUTO_3118 ) ) ( not ( = ?AUTO_3112 ?AUTO_3114 ) ) ( not ( = ?AUTO_3117 ?AUTO_3118 ) ) ( not ( = ?AUTO_3117 ?AUTO_3114 ) ) ( not ( = ?AUTO_3118 ?AUTO_3114 ) ) ( ON ?AUTO_3118 ?AUTO_3112 ) ( CLEAR ?AUTO_3118 ) ( ON ?AUTO_3114 ?AUTO_3111 ) ( CLEAR ?AUTO_3113 ) ( not ( = ?AUTO_3111 ?AUTO_3116 ) ) ( not ( = ?AUTO_3111 ?AUTO_3113 ) ) ( not ( = ?AUTO_3112 ?AUTO_3116 ) ) ( not ( = ?AUTO_3112 ?AUTO_3113 ) ) ( not ( = ?AUTO_3117 ?AUTO_3116 ) ) ( not ( = ?AUTO_3117 ?AUTO_3113 ) ) ( not ( = ?AUTO_3118 ?AUTO_3116 ) ) ( not ( = ?AUTO_3118 ?AUTO_3113 ) ) ( not ( = ?AUTO_3114 ?AUTO_3116 ) ) ( not ( = ?AUTO_3114 ?AUTO_3113 ) ) ( not ( = ?AUTO_3116 ?AUTO_3113 ) ) ( ON ?AUTO_3116 ?AUTO_3114 ) ( not ( = ?AUTO_3111 ?AUTO_3115 ) ) ( not ( = ?AUTO_3112 ?AUTO_3115 ) ) ( not ( = ?AUTO_3117 ?AUTO_3115 ) ) ( not ( = ?AUTO_3118 ?AUTO_3115 ) ) ( not ( = ?AUTO_3114 ?AUTO_3115 ) ) ( not ( = ?AUTO_3113 ?AUTO_3115 ) ) ( not ( = ?AUTO_3116 ?AUTO_3115 ) ) ( ON ?AUTO_3115 ?AUTO_3116 ) ( CLEAR ?AUTO_3115 ) ( HOLDING ?AUTO_3119 ) ( not ( = ?AUTO_3111 ?AUTO_3119 ) ) ( not ( = ?AUTO_3112 ?AUTO_3119 ) ) ( not ( = ?AUTO_3117 ?AUTO_3119 ) ) ( not ( = ?AUTO_3118 ?AUTO_3119 ) ) ( not ( = ?AUTO_3114 ?AUTO_3119 ) ) ( not ( = ?AUTO_3113 ?AUTO_3119 ) ) ( not ( = ?AUTO_3116 ?AUTO_3119 ) ) ( not ( = ?AUTO_3115 ?AUTO_3119 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3119 )
      ( MAKE-ON ?AUTO_3111 ?AUTO_3112 )
      ( MAKE-ON-VERIFY ?AUTO_3111 ?AUTO_3112 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3120 - BLOCK
      ?AUTO_3121 - BLOCK
    )
    :vars
    (
      ?AUTO_3126 - BLOCK
      ?AUTO_3122 - BLOCK
      ?AUTO_3123 - BLOCK
      ?AUTO_3124 - BLOCK
      ?AUTO_3125 - BLOCK
      ?AUTO_3127 - BLOCK
      ?AUTO_3128 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3120 ?AUTO_3121 ) ) ( ON ?AUTO_3120 ?AUTO_3126 ) ( not ( = ?AUTO_3120 ?AUTO_3126 ) ) ( not ( = ?AUTO_3121 ?AUTO_3126 ) ) ( not ( = ?AUTO_3120 ?AUTO_3122 ) ) ( not ( = ?AUTO_3120 ?AUTO_3123 ) ) ( not ( = ?AUTO_3121 ?AUTO_3122 ) ) ( not ( = ?AUTO_3121 ?AUTO_3123 ) ) ( not ( = ?AUTO_3126 ?AUTO_3122 ) ) ( not ( = ?AUTO_3126 ?AUTO_3123 ) ) ( not ( = ?AUTO_3122 ?AUTO_3123 ) ) ( ON ?AUTO_3122 ?AUTO_3121 ) ( ON ?AUTO_3123 ?AUTO_3120 ) ( CLEAR ?AUTO_3124 ) ( not ( = ?AUTO_3120 ?AUTO_3125 ) ) ( not ( = ?AUTO_3120 ?AUTO_3124 ) ) ( not ( = ?AUTO_3121 ?AUTO_3125 ) ) ( not ( = ?AUTO_3121 ?AUTO_3124 ) ) ( not ( = ?AUTO_3126 ?AUTO_3125 ) ) ( not ( = ?AUTO_3126 ?AUTO_3124 ) ) ( not ( = ?AUTO_3122 ?AUTO_3125 ) ) ( not ( = ?AUTO_3122 ?AUTO_3124 ) ) ( not ( = ?AUTO_3123 ?AUTO_3125 ) ) ( not ( = ?AUTO_3123 ?AUTO_3124 ) ) ( not ( = ?AUTO_3125 ?AUTO_3124 ) ) ( ON ?AUTO_3125 ?AUTO_3123 ) ( not ( = ?AUTO_3120 ?AUTO_3127 ) ) ( not ( = ?AUTO_3121 ?AUTO_3127 ) ) ( not ( = ?AUTO_3126 ?AUTO_3127 ) ) ( not ( = ?AUTO_3122 ?AUTO_3127 ) ) ( not ( = ?AUTO_3123 ?AUTO_3127 ) ) ( not ( = ?AUTO_3124 ?AUTO_3127 ) ) ( not ( = ?AUTO_3125 ?AUTO_3127 ) ) ( ON ?AUTO_3127 ?AUTO_3125 ) ( CLEAR ?AUTO_3127 ) ( not ( = ?AUTO_3120 ?AUTO_3128 ) ) ( not ( = ?AUTO_3121 ?AUTO_3128 ) ) ( not ( = ?AUTO_3126 ?AUTO_3128 ) ) ( not ( = ?AUTO_3122 ?AUTO_3128 ) ) ( not ( = ?AUTO_3123 ?AUTO_3128 ) ) ( not ( = ?AUTO_3124 ?AUTO_3128 ) ) ( not ( = ?AUTO_3125 ?AUTO_3128 ) ) ( not ( = ?AUTO_3127 ?AUTO_3128 ) ) ( ON ?AUTO_3128 ?AUTO_3122 ) ( CLEAR ?AUTO_3128 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3128 ?AUTO_3122 )
      ( MAKE-ON ?AUTO_3120 ?AUTO_3121 )
      ( MAKE-ON-VERIFY ?AUTO_3120 ?AUTO_3121 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3129 - BLOCK
      ?AUTO_3130 - BLOCK
    )
    :vars
    (
      ?AUTO_3134 - BLOCK
      ?AUTO_3135 - BLOCK
      ?AUTO_3131 - BLOCK
      ?AUTO_3137 - BLOCK
      ?AUTO_3136 - BLOCK
      ?AUTO_3133 - BLOCK
      ?AUTO_3132 - BLOCK
      ?AUTO_3138 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3129 ?AUTO_3130 ) ) ( ON ?AUTO_3129 ?AUTO_3134 ) ( not ( = ?AUTO_3129 ?AUTO_3134 ) ) ( not ( = ?AUTO_3130 ?AUTO_3134 ) ) ( not ( = ?AUTO_3129 ?AUTO_3135 ) ) ( not ( = ?AUTO_3129 ?AUTO_3131 ) ) ( not ( = ?AUTO_3130 ?AUTO_3135 ) ) ( not ( = ?AUTO_3130 ?AUTO_3131 ) ) ( not ( = ?AUTO_3134 ?AUTO_3135 ) ) ( not ( = ?AUTO_3134 ?AUTO_3131 ) ) ( not ( = ?AUTO_3135 ?AUTO_3131 ) ) ( ON ?AUTO_3135 ?AUTO_3130 ) ( ON ?AUTO_3131 ?AUTO_3129 ) ( CLEAR ?AUTO_3137 ) ( not ( = ?AUTO_3129 ?AUTO_3136 ) ) ( not ( = ?AUTO_3129 ?AUTO_3137 ) ) ( not ( = ?AUTO_3130 ?AUTO_3136 ) ) ( not ( = ?AUTO_3130 ?AUTO_3137 ) ) ( not ( = ?AUTO_3134 ?AUTO_3136 ) ) ( not ( = ?AUTO_3134 ?AUTO_3137 ) ) ( not ( = ?AUTO_3135 ?AUTO_3136 ) ) ( not ( = ?AUTO_3135 ?AUTO_3137 ) ) ( not ( = ?AUTO_3131 ?AUTO_3136 ) ) ( not ( = ?AUTO_3131 ?AUTO_3137 ) ) ( not ( = ?AUTO_3136 ?AUTO_3137 ) ) ( ON ?AUTO_3136 ?AUTO_3131 ) ( not ( = ?AUTO_3129 ?AUTO_3133 ) ) ( not ( = ?AUTO_3130 ?AUTO_3133 ) ) ( not ( = ?AUTO_3134 ?AUTO_3133 ) ) ( not ( = ?AUTO_3135 ?AUTO_3133 ) ) ( not ( = ?AUTO_3131 ?AUTO_3133 ) ) ( not ( = ?AUTO_3137 ?AUTO_3133 ) ) ( not ( = ?AUTO_3136 ?AUTO_3133 ) ) ( ON ?AUTO_3133 ?AUTO_3136 ) ( CLEAR ?AUTO_3133 ) ( not ( = ?AUTO_3129 ?AUTO_3132 ) ) ( not ( = ?AUTO_3130 ?AUTO_3132 ) ) ( not ( = ?AUTO_3134 ?AUTO_3132 ) ) ( not ( = ?AUTO_3135 ?AUTO_3132 ) ) ( not ( = ?AUTO_3131 ?AUTO_3132 ) ) ( not ( = ?AUTO_3137 ?AUTO_3132 ) ) ( not ( = ?AUTO_3136 ?AUTO_3132 ) ) ( not ( = ?AUTO_3133 ?AUTO_3132 ) ) ( ON ?AUTO_3132 ?AUTO_3135 ) ( CLEAR ?AUTO_3132 ) ( HOLDING ?AUTO_3138 ) ( not ( = ?AUTO_3129 ?AUTO_3138 ) ) ( not ( = ?AUTO_3130 ?AUTO_3138 ) ) ( not ( = ?AUTO_3134 ?AUTO_3138 ) ) ( not ( = ?AUTO_3135 ?AUTO_3138 ) ) ( not ( = ?AUTO_3131 ?AUTO_3138 ) ) ( not ( = ?AUTO_3137 ?AUTO_3138 ) ) ( not ( = ?AUTO_3136 ?AUTO_3138 ) ) ( not ( = ?AUTO_3133 ?AUTO_3138 ) ) ( not ( = ?AUTO_3132 ?AUTO_3138 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3138 )
      ( MAKE-ON ?AUTO_3129 ?AUTO_3130 )
      ( MAKE-ON-VERIFY ?AUTO_3129 ?AUTO_3130 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3139 - BLOCK
      ?AUTO_3140 - BLOCK
    )
    :vars
    (
      ?AUTO_3145 - BLOCK
      ?AUTO_3144 - BLOCK
      ?AUTO_3142 - BLOCK
      ?AUTO_3147 - BLOCK
      ?AUTO_3143 - BLOCK
      ?AUTO_3146 - BLOCK
      ?AUTO_3141 - BLOCK
      ?AUTO_3148 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3139 ?AUTO_3140 ) ) ( ON ?AUTO_3139 ?AUTO_3145 ) ( not ( = ?AUTO_3139 ?AUTO_3145 ) ) ( not ( = ?AUTO_3140 ?AUTO_3145 ) ) ( not ( = ?AUTO_3139 ?AUTO_3144 ) ) ( not ( = ?AUTO_3139 ?AUTO_3142 ) ) ( not ( = ?AUTO_3140 ?AUTO_3144 ) ) ( not ( = ?AUTO_3140 ?AUTO_3142 ) ) ( not ( = ?AUTO_3145 ?AUTO_3144 ) ) ( not ( = ?AUTO_3145 ?AUTO_3142 ) ) ( not ( = ?AUTO_3144 ?AUTO_3142 ) ) ( ON ?AUTO_3144 ?AUTO_3140 ) ( ON ?AUTO_3142 ?AUTO_3139 ) ( CLEAR ?AUTO_3147 ) ( not ( = ?AUTO_3139 ?AUTO_3143 ) ) ( not ( = ?AUTO_3139 ?AUTO_3147 ) ) ( not ( = ?AUTO_3140 ?AUTO_3143 ) ) ( not ( = ?AUTO_3140 ?AUTO_3147 ) ) ( not ( = ?AUTO_3145 ?AUTO_3143 ) ) ( not ( = ?AUTO_3145 ?AUTO_3147 ) ) ( not ( = ?AUTO_3144 ?AUTO_3143 ) ) ( not ( = ?AUTO_3144 ?AUTO_3147 ) ) ( not ( = ?AUTO_3142 ?AUTO_3143 ) ) ( not ( = ?AUTO_3142 ?AUTO_3147 ) ) ( not ( = ?AUTO_3143 ?AUTO_3147 ) ) ( ON ?AUTO_3143 ?AUTO_3142 ) ( not ( = ?AUTO_3139 ?AUTO_3146 ) ) ( not ( = ?AUTO_3140 ?AUTO_3146 ) ) ( not ( = ?AUTO_3145 ?AUTO_3146 ) ) ( not ( = ?AUTO_3144 ?AUTO_3146 ) ) ( not ( = ?AUTO_3142 ?AUTO_3146 ) ) ( not ( = ?AUTO_3147 ?AUTO_3146 ) ) ( not ( = ?AUTO_3143 ?AUTO_3146 ) ) ( ON ?AUTO_3146 ?AUTO_3143 ) ( CLEAR ?AUTO_3146 ) ( not ( = ?AUTO_3139 ?AUTO_3141 ) ) ( not ( = ?AUTO_3140 ?AUTO_3141 ) ) ( not ( = ?AUTO_3145 ?AUTO_3141 ) ) ( not ( = ?AUTO_3144 ?AUTO_3141 ) ) ( not ( = ?AUTO_3142 ?AUTO_3141 ) ) ( not ( = ?AUTO_3147 ?AUTO_3141 ) ) ( not ( = ?AUTO_3143 ?AUTO_3141 ) ) ( not ( = ?AUTO_3146 ?AUTO_3141 ) ) ( ON ?AUTO_3141 ?AUTO_3144 ) ( not ( = ?AUTO_3139 ?AUTO_3148 ) ) ( not ( = ?AUTO_3140 ?AUTO_3148 ) ) ( not ( = ?AUTO_3145 ?AUTO_3148 ) ) ( not ( = ?AUTO_3144 ?AUTO_3148 ) ) ( not ( = ?AUTO_3142 ?AUTO_3148 ) ) ( not ( = ?AUTO_3147 ?AUTO_3148 ) ) ( not ( = ?AUTO_3143 ?AUTO_3148 ) ) ( not ( = ?AUTO_3146 ?AUTO_3148 ) ) ( not ( = ?AUTO_3141 ?AUTO_3148 ) ) ( ON ?AUTO_3148 ?AUTO_3141 ) ( CLEAR ?AUTO_3148 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3148 ?AUTO_3141 )
      ( MAKE-ON ?AUTO_3139 ?AUTO_3140 )
      ( MAKE-ON-VERIFY ?AUTO_3139 ?AUTO_3140 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3150 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3150 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3150 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3150 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3151 - BLOCK
    )
    :vars
    (
      ?AUTO_3152 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3151 ?AUTO_3152 ) ( CLEAR ?AUTO_3151 ) ( HAND-EMPTY ) ( not ( = ?AUTO_3151 ?AUTO_3152 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3151 ?AUTO_3152 )
      ( MAKE-ON-TABLE ?AUTO_3151 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3151 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3154 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3154 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3154 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3154 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3155 - BLOCK
    )
    :vars
    (
      ?AUTO_3156 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3155 ?AUTO_3156 ) ( CLEAR ?AUTO_3155 ) ( HAND-EMPTY ) ( not ( = ?AUTO_3155 ?AUTO_3156 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3155 ?AUTO_3156 )
      ( MAKE-ON-TABLE ?AUTO_3155 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3155 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3157 - BLOCK
    )
    :vars
    (
      ?AUTO_3158 - BLOCK
      ?AUTO_3159 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3157 ?AUTO_3158 ) ( CLEAR ?AUTO_3157 ) ( not ( = ?AUTO_3157 ?AUTO_3158 ) ) ( HOLDING ?AUTO_3159 ) ( not ( = ?AUTO_3157 ?AUTO_3159 ) ) ( not ( = ?AUTO_3158 ?AUTO_3159 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3159 )
      ( MAKE-ON-TABLE ?AUTO_3157 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3157 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3160 - BLOCK
    )
    :vars
    (
      ?AUTO_3162 - BLOCK
      ?AUTO_3161 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3160 ?AUTO_3162 ) ( not ( = ?AUTO_3160 ?AUTO_3162 ) ) ( not ( = ?AUTO_3160 ?AUTO_3161 ) ) ( not ( = ?AUTO_3162 ?AUTO_3161 ) ) ( ON ?AUTO_3161 ?AUTO_3160 ) ( CLEAR ?AUTO_3161 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3161 ?AUTO_3160 )
      ( MAKE-ON-TABLE ?AUTO_3160 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3160 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3164 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3164 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3164 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3164 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3165 - BLOCK
    )
    :vars
    (
      ?AUTO_3166 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3165 ?AUTO_3166 ) ( CLEAR ?AUTO_3165 ) ( HAND-EMPTY ) ( not ( = ?AUTO_3165 ?AUTO_3166 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3165 ?AUTO_3166 )
      ( MAKE-ON-TABLE ?AUTO_3165 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3165 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3167 - BLOCK
    )
    :vars
    (
      ?AUTO_3168 - BLOCK
      ?AUTO_3169 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3167 ?AUTO_3168 ) ( CLEAR ?AUTO_3167 ) ( not ( = ?AUTO_3167 ?AUTO_3168 ) ) ( HOLDING ?AUTO_3169 ) ( not ( = ?AUTO_3167 ?AUTO_3169 ) ) ( not ( = ?AUTO_3168 ?AUTO_3169 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3169 )
      ( MAKE-ON-TABLE ?AUTO_3167 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3167 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3170 - BLOCK
    )
    :vars
    (
      ?AUTO_3172 - BLOCK
      ?AUTO_3171 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3170 ?AUTO_3172 ) ( not ( = ?AUTO_3170 ?AUTO_3172 ) ) ( not ( = ?AUTO_3170 ?AUTO_3171 ) ) ( not ( = ?AUTO_3172 ?AUTO_3171 ) ) ( ON ?AUTO_3171 ?AUTO_3170 ) ( CLEAR ?AUTO_3171 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3171 ?AUTO_3170 )
      ( MAKE-ON-TABLE ?AUTO_3170 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3170 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3173 - BLOCK
    )
    :vars
    (
      ?AUTO_3175 - BLOCK
      ?AUTO_3174 - BLOCK
      ?AUTO_3176 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3173 ?AUTO_3175 ) ( not ( = ?AUTO_3173 ?AUTO_3175 ) ) ( not ( = ?AUTO_3173 ?AUTO_3174 ) ) ( not ( = ?AUTO_3175 ?AUTO_3174 ) ) ( ON ?AUTO_3174 ?AUTO_3173 ) ( CLEAR ?AUTO_3174 ) ( HOLDING ?AUTO_3176 ) ( not ( = ?AUTO_3173 ?AUTO_3176 ) ) ( not ( = ?AUTO_3175 ?AUTO_3176 ) ) ( not ( = ?AUTO_3174 ?AUTO_3176 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3176 )
      ( MAKE-ON-TABLE ?AUTO_3173 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3173 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3177 - BLOCK
    )
    :vars
    (
      ?AUTO_3179 - BLOCK
      ?AUTO_3178 - BLOCK
      ?AUTO_3180 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3177 ?AUTO_3179 ) ( not ( = ?AUTO_3177 ?AUTO_3179 ) ) ( not ( = ?AUTO_3177 ?AUTO_3178 ) ) ( not ( = ?AUTO_3179 ?AUTO_3178 ) ) ( ON ?AUTO_3178 ?AUTO_3177 ) ( not ( = ?AUTO_3177 ?AUTO_3180 ) ) ( not ( = ?AUTO_3179 ?AUTO_3180 ) ) ( not ( = ?AUTO_3178 ?AUTO_3180 ) ) ( ON ?AUTO_3180 ?AUTO_3178 ) ( CLEAR ?AUTO_3180 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3180 ?AUTO_3178 )
      ( MAKE-ON-TABLE ?AUTO_3177 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3177 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3183 - BLOCK
      ?AUTO_3184 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3183 ) ( CLEAR ?AUTO_3184 ) ( not ( = ?AUTO_3183 ?AUTO_3184 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3183 ?AUTO_3184 )
      ( MAKE-ON-VERIFY ?AUTO_3183 ?AUTO_3184 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3185 - BLOCK
      ?AUTO_3186 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3186 ) ( not ( = ?AUTO_3185 ?AUTO_3186 ) ) ( ON-TABLE ?AUTO_3185 ) ( CLEAR ?AUTO_3185 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_3185 )
      ( MAKE-ON ?AUTO_3185 ?AUTO_3186 )
      ( MAKE-ON-VERIFY ?AUTO_3185 ?AUTO_3186 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3187 - BLOCK
      ?AUTO_3188 - BLOCK
    )
    :vars
    (
      ?AUTO_3189 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3188 ) ( not ( = ?AUTO_3187 ?AUTO_3188 ) ) ( ON-TABLE ?AUTO_3187 ) ( CLEAR ?AUTO_3187 ) ( HOLDING ?AUTO_3189 ) ( not ( = ?AUTO_3187 ?AUTO_3189 ) ) ( not ( = ?AUTO_3188 ?AUTO_3189 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3189 )
      ( MAKE-ON ?AUTO_3187 ?AUTO_3188 )
      ( MAKE-ON-VERIFY ?AUTO_3187 ?AUTO_3188 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3190 - BLOCK
      ?AUTO_3191 - BLOCK
    )
    :vars
    (
      ?AUTO_3192 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3190 ?AUTO_3191 ) ) ( ON-TABLE ?AUTO_3190 ) ( CLEAR ?AUTO_3190 ) ( not ( = ?AUTO_3190 ?AUTO_3192 ) ) ( not ( = ?AUTO_3191 ?AUTO_3192 ) ) ( ON ?AUTO_3192 ?AUTO_3191 ) ( CLEAR ?AUTO_3192 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3192 ?AUTO_3191 )
      ( MAKE-ON ?AUTO_3190 ?AUTO_3191 )
      ( MAKE-ON-VERIFY ?AUTO_3190 ?AUTO_3191 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3193 - BLOCK
      ?AUTO_3194 - BLOCK
    )
    :vars
    (
      ?AUTO_3195 - BLOCK
      ?AUTO_3196 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3193 ?AUTO_3194 ) ) ( ON-TABLE ?AUTO_3193 ) ( CLEAR ?AUTO_3193 ) ( not ( = ?AUTO_3193 ?AUTO_3195 ) ) ( not ( = ?AUTO_3194 ?AUTO_3195 ) ) ( ON ?AUTO_3195 ?AUTO_3194 ) ( CLEAR ?AUTO_3195 ) ( HOLDING ?AUTO_3196 ) ( not ( = ?AUTO_3193 ?AUTO_3196 ) ) ( not ( = ?AUTO_3194 ?AUTO_3196 ) ) ( not ( = ?AUTO_3195 ?AUTO_3196 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3196 )
      ( MAKE-ON ?AUTO_3193 ?AUTO_3194 )
      ( MAKE-ON-VERIFY ?AUTO_3193 ?AUTO_3194 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3197 - BLOCK
      ?AUTO_3198 - BLOCK
    )
    :vars
    (
      ?AUTO_3199 - BLOCK
      ?AUTO_3200 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3197 ?AUTO_3198 ) ) ( ON-TABLE ?AUTO_3197 ) ( CLEAR ?AUTO_3197 ) ( not ( = ?AUTO_3197 ?AUTO_3199 ) ) ( not ( = ?AUTO_3198 ?AUTO_3199 ) ) ( ON ?AUTO_3199 ?AUTO_3198 ) ( not ( = ?AUTO_3197 ?AUTO_3200 ) ) ( not ( = ?AUTO_3198 ?AUTO_3200 ) ) ( not ( = ?AUTO_3199 ?AUTO_3200 ) ) ( ON ?AUTO_3200 ?AUTO_3199 ) ( CLEAR ?AUTO_3200 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3200 ?AUTO_3199 )
      ( MAKE-ON ?AUTO_3197 ?AUTO_3198 )
      ( MAKE-ON-VERIFY ?AUTO_3197 ?AUTO_3198 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3201 - BLOCK
      ?AUTO_3202 - BLOCK
    )
    :vars
    (
      ?AUTO_3203 - BLOCK
      ?AUTO_3204 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3201 ?AUTO_3202 ) ) ( not ( = ?AUTO_3201 ?AUTO_3203 ) ) ( not ( = ?AUTO_3202 ?AUTO_3203 ) ) ( ON ?AUTO_3203 ?AUTO_3202 ) ( not ( = ?AUTO_3201 ?AUTO_3204 ) ) ( not ( = ?AUTO_3202 ?AUTO_3204 ) ) ( not ( = ?AUTO_3203 ?AUTO_3204 ) ) ( ON ?AUTO_3204 ?AUTO_3203 ) ( CLEAR ?AUTO_3204 ) ( HOLDING ?AUTO_3201 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3201 )
      ( MAKE-ON ?AUTO_3201 ?AUTO_3202 )
      ( MAKE-ON-VERIFY ?AUTO_3201 ?AUTO_3202 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3205 - BLOCK
      ?AUTO_3206 - BLOCK
    )
    :vars
    (
      ?AUTO_3208 - BLOCK
      ?AUTO_3207 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3205 ?AUTO_3206 ) ) ( not ( = ?AUTO_3205 ?AUTO_3208 ) ) ( not ( = ?AUTO_3206 ?AUTO_3208 ) ) ( ON ?AUTO_3208 ?AUTO_3206 ) ( not ( = ?AUTO_3205 ?AUTO_3207 ) ) ( not ( = ?AUTO_3206 ?AUTO_3207 ) ) ( not ( = ?AUTO_3208 ?AUTO_3207 ) ) ( ON ?AUTO_3207 ?AUTO_3208 ) ( ON ?AUTO_3205 ?AUTO_3207 ) ( CLEAR ?AUTO_3205 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3205 ?AUTO_3207 )
      ( MAKE-ON ?AUTO_3205 ?AUTO_3206 )
      ( MAKE-ON-VERIFY ?AUTO_3205 ?AUTO_3206 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3211 - BLOCK
      ?AUTO_3212 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3211 ) ( CLEAR ?AUTO_3212 ) ( not ( = ?AUTO_3211 ?AUTO_3212 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3211 ?AUTO_3212 )
      ( MAKE-ON-VERIFY ?AUTO_3211 ?AUTO_3212 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3213 - BLOCK
      ?AUTO_3214 - BLOCK
    )
    :vars
    (
      ?AUTO_3215 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3214 ) ( not ( = ?AUTO_3213 ?AUTO_3214 ) ) ( ON ?AUTO_3213 ?AUTO_3215 ) ( CLEAR ?AUTO_3213 ) ( HAND-EMPTY ) ( not ( = ?AUTO_3213 ?AUTO_3215 ) ) ( not ( = ?AUTO_3214 ?AUTO_3215 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3213 ?AUTO_3215 )
      ( MAKE-ON ?AUTO_3213 ?AUTO_3214 )
      ( MAKE-ON-VERIFY ?AUTO_3213 ?AUTO_3214 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3216 - BLOCK
      ?AUTO_3217 - BLOCK
    )
    :vars
    (
      ?AUTO_3218 - BLOCK
      ?AUTO_3219 - BLOCK
      ?AUTO_3220 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3217 ) ( not ( = ?AUTO_3216 ?AUTO_3217 ) ) ( ON ?AUTO_3216 ?AUTO_3218 ) ( CLEAR ?AUTO_3216 ) ( not ( = ?AUTO_3216 ?AUTO_3218 ) ) ( not ( = ?AUTO_3217 ?AUTO_3218 ) ) ( HOLDING ?AUTO_3219 ) ( CLEAR ?AUTO_3220 ) ( not ( = ?AUTO_3216 ?AUTO_3219 ) ) ( not ( = ?AUTO_3216 ?AUTO_3220 ) ) ( not ( = ?AUTO_3217 ?AUTO_3219 ) ) ( not ( = ?AUTO_3217 ?AUTO_3220 ) ) ( not ( = ?AUTO_3218 ?AUTO_3219 ) ) ( not ( = ?AUTO_3218 ?AUTO_3220 ) ) ( not ( = ?AUTO_3219 ?AUTO_3220 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3219 ?AUTO_3220 )
      ( MAKE-ON ?AUTO_3216 ?AUTO_3217 )
      ( MAKE-ON-VERIFY ?AUTO_3216 ?AUTO_3217 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3223 - BLOCK
      ?AUTO_3224 - BLOCK
    )
    :vars
    (
      ?AUTO_3225 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3223 ?AUTO_3224 ) ) ( ON ?AUTO_3223 ?AUTO_3225 ) ( CLEAR ?AUTO_3223 ) ( not ( = ?AUTO_3223 ?AUTO_3225 ) ) ( not ( = ?AUTO_3224 ?AUTO_3225 ) ) ( HOLDING ?AUTO_3224 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3224 )
      ( MAKE-ON ?AUTO_3223 ?AUTO_3224 )
      ( MAKE-ON-VERIFY ?AUTO_3223 ?AUTO_3224 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3230 - BLOCK
      ?AUTO_3231 - BLOCK
    )
    :vars
    (
      ?AUTO_3234 - BLOCK
      ?AUTO_3233 - BLOCK
      ?AUTO_3232 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3230 ?AUTO_3231 ) ) ( ON ?AUTO_3230 ?AUTO_3234 ) ( CLEAR ?AUTO_3230 ) ( not ( = ?AUTO_3230 ?AUTO_3234 ) ) ( not ( = ?AUTO_3231 ?AUTO_3234 ) ) ( CLEAR ?AUTO_3233 ) ( not ( = ?AUTO_3230 ?AUTO_3232 ) ) ( not ( = ?AUTO_3230 ?AUTO_3233 ) ) ( not ( = ?AUTO_3231 ?AUTO_3232 ) ) ( not ( = ?AUTO_3231 ?AUTO_3233 ) ) ( not ( = ?AUTO_3234 ?AUTO_3232 ) ) ( not ( = ?AUTO_3234 ?AUTO_3233 ) ) ( not ( = ?AUTO_3232 ?AUTO_3233 ) ) ( ON ?AUTO_3232 ?AUTO_3231 ) ( CLEAR ?AUTO_3232 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3232 ?AUTO_3231 )
      ( MAKE-ON ?AUTO_3230 ?AUTO_3231 )
      ( MAKE-ON-VERIFY ?AUTO_3230 ?AUTO_3231 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3235 - BLOCK
      ?AUTO_3236 - BLOCK
    )
    :vars
    (
      ?AUTO_3239 - BLOCK
      ?AUTO_3237 - BLOCK
      ?AUTO_3238 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3235 ?AUTO_3236 ) ) ( ON ?AUTO_3235 ?AUTO_3239 ) ( CLEAR ?AUTO_3235 ) ( not ( = ?AUTO_3235 ?AUTO_3239 ) ) ( not ( = ?AUTO_3236 ?AUTO_3239 ) ) ( not ( = ?AUTO_3235 ?AUTO_3237 ) ) ( not ( = ?AUTO_3235 ?AUTO_3238 ) ) ( not ( = ?AUTO_3236 ?AUTO_3237 ) ) ( not ( = ?AUTO_3236 ?AUTO_3238 ) ) ( not ( = ?AUTO_3239 ?AUTO_3237 ) ) ( not ( = ?AUTO_3239 ?AUTO_3238 ) ) ( not ( = ?AUTO_3237 ?AUTO_3238 ) ) ( ON ?AUTO_3237 ?AUTO_3236 ) ( CLEAR ?AUTO_3237 ) ( HOLDING ?AUTO_3238 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3238 )
      ( MAKE-ON ?AUTO_3235 ?AUTO_3236 )
      ( MAKE-ON-VERIFY ?AUTO_3235 ?AUTO_3236 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3240 - BLOCK
      ?AUTO_3241 - BLOCK
    )
    :vars
    (
      ?AUTO_3244 - BLOCK
      ?AUTO_3242 - BLOCK
      ?AUTO_3243 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3240 ?AUTO_3241 ) ) ( ON ?AUTO_3240 ?AUTO_3244 ) ( CLEAR ?AUTO_3240 ) ( not ( = ?AUTO_3240 ?AUTO_3244 ) ) ( not ( = ?AUTO_3241 ?AUTO_3244 ) ) ( not ( = ?AUTO_3240 ?AUTO_3242 ) ) ( not ( = ?AUTO_3240 ?AUTO_3243 ) ) ( not ( = ?AUTO_3241 ?AUTO_3242 ) ) ( not ( = ?AUTO_3241 ?AUTO_3243 ) ) ( not ( = ?AUTO_3244 ?AUTO_3242 ) ) ( not ( = ?AUTO_3244 ?AUTO_3243 ) ) ( not ( = ?AUTO_3242 ?AUTO_3243 ) ) ( ON ?AUTO_3242 ?AUTO_3241 ) ( ON ?AUTO_3243 ?AUTO_3242 ) ( CLEAR ?AUTO_3243 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3243 ?AUTO_3242 )
      ( MAKE-ON ?AUTO_3240 ?AUTO_3241 )
      ( MAKE-ON-VERIFY ?AUTO_3240 ?AUTO_3241 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3246 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3246 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3246 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3246 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3247 - BLOCK
    )
    :vars
    (
      ?AUTO_3248 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3247 ?AUTO_3248 ) ( CLEAR ?AUTO_3247 ) ( HAND-EMPTY ) ( not ( = ?AUTO_3247 ?AUTO_3248 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3247 ?AUTO_3248 )
      ( MAKE-ON-TABLE ?AUTO_3247 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3247 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3249 - BLOCK
    )
    :vars
    (
      ?AUTO_3250 - BLOCK
      ?AUTO_3251 - BLOCK
      ?AUTO_3252 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3249 ?AUTO_3250 ) ( CLEAR ?AUTO_3249 ) ( not ( = ?AUTO_3249 ?AUTO_3250 ) ) ( HOLDING ?AUTO_3251 ) ( CLEAR ?AUTO_3252 ) ( not ( = ?AUTO_3249 ?AUTO_3251 ) ) ( not ( = ?AUTO_3249 ?AUTO_3252 ) ) ( not ( = ?AUTO_3250 ?AUTO_3251 ) ) ( not ( = ?AUTO_3250 ?AUTO_3252 ) ) ( not ( = ?AUTO_3251 ?AUTO_3252 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3251 ?AUTO_3252 )
      ( MAKE-ON-TABLE ?AUTO_3249 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3249 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3253 - BLOCK
    )
    :vars
    (
      ?AUTO_3254 - BLOCK
      ?AUTO_3256 - BLOCK
      ?AUTO_3255 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3253 ?AUTO_3254 ) ( not ( = ?AUTO_3253 ?AUTO_3254 ) ) ( CLEAR ?AUTO_3256 ) ( not ( = ?AUTO_3253 ?AUTO_3255 ) ) ( not ( = ?AUTO_3253 ?AUTO_3256 ) ) ( not ( = ?AUTO_3254 ?AUTO_3255 ) ) ( not ( = ?AUTO_3254 ?AUTO_3256 ) ) ( not ( = ?AUTO_3255 ?AUTO_3256 ) ) ( ON ?AUTO_3255 ?AUTO_3253 ) ( CLEAR ?AUTO_3255 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3255 ?AUTO_3253 )
      ( MAKE-ON-TABLE ?AUTO_3253 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3253 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3257 - BLOCK
    )
    :vars
    (
      ?AUTO_3258 - BLOCK
      ?AUTO_3260 - BLOCK
      ?AUTO_3259 - BLOCK
      ?AUTO_3261 - BLOCK
      ?AUTO_3262 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3257 ?AUTO_3258 ) ( not ( = ?AUTO_3257 ?AUTO_3258 ) ) ( CLEAR ?AUTO_3260 ) ( not ( = ?AUTO_3257 ?AUTO_3259 ) ) ( not ( = ?AUTO_3257 ?AUTO_3260 ) ) ( not ( = ?AUTO_3258 ?AUTO_3259 ) ) ( not ( = ?AUTO_3258 ?AUTO_3260 ) ) ( not ( = ?AUTO_3259 ?AUTO_3260 ) ) ( ON ?AUTO_3259 ?AUTO_3257 ) ( CLEAR ?AUTO_3259 ) ( HOLDING ?AUTO_3261 ) ( CLEAR ?AUTO_3262 ) ( not ( = ?AUTO_3257 ?AUTO_3261 ) ) ( not ( = ?AUTO_3257 ?AUTO_3262 ) ) ( not ( = ?AUTO_3258 ?AUTO_3261 ) ) ( not ( = ?AUTO_3258 ?AUTO_3262 ) ) ( not ( = ?AUTO_3260 ?AUTO_3261 ) ) ( not ( = ?AUTO_3260 ?AUTO_3262 ) ) ( not ( = ?AUTO_3259 ?AUTO_3261 ) ) ( not ( = ?AUTO_3259 ?AUTO_3262 ) ) ( not ( = ?AUTO_3261 ?AUTO_3262 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3261 ?AUTO_3262 )
      ( MAKE-ON-TABLE ?AUTO_3257 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3257 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3272 - BLOCK
      ?AUTO_3273 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3272 ) ( CLEAR ?AUTO_3273 ) ( not ( = ?AUTO_3272 ?AUTO_3273 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3272 ?AUTO_3273 )
      ( MAKE-ON-VERIFY ?AUTO_3272 ?AUTO_3273 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3274 - BLOCK
      ?AUTO_3275 - BLOCK
    )
    :vars
    (
      ?AUTO_3276 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3275 ) ( not ( = ?AUTO_3274 ?AUTO_3275 ) ) ( ON ?AUTO_3274 ?AUTO_3276 ) ( CLEAR ?AUTO_3274 ) ( HAND-EMPTY ) ( not ( = ?AUTO_3274 ?AUTO_3276 ) ) ( not ( = ?AUTO_3275 ?AUTO_3276 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3274 ?AUTO_3276 )
      ( MAKE-ON ?AUTO_3274 ?AUTO_3275 )
      ( MAKE-ON-VERIFY ?AUTO_3274 ?AUTO_3275 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3277 - BLOCK
      ?AUTO_3278 - BLOCK
    )
    :vars
    (
      ?AUTO_3279 - BLOCK
      ?AUTO_3280 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3278 ) ( not ( = ?AUTO_3277 ?AUTO_3278 ) ) ( ON ?AUTO_3277 ?AUTO_3279 ) ( CLEAR ?AUTO_3277 ) ( not ( = ?AUTO_3277 ?AUTO_3279 ) ) ( not ( = ?AUTO_3278 ?AUTO_3279 ) ) ( HOLDING ?AUTO_3280 ) ( not ( = ?AUTO_3277 ?AUTO_3280 ) ) ( not ( = ?AUTO_3278 ?AUTO_3280 ) ) ( not ( = ?AUTO_3279 ?AUTO_3280 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3280 )
      ( MAKE-ON ?AUTO_3277 ?AUTO_3278 )
      ( MAKE-ON-VERIFY ?AUTO_3277 ?AUTO_3278 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3281 - BLOCK
      ?AUTO_3282 - BLOCK
    )
    :vars
    (
      ?AUTO_3283 - BLOCK
      ?AUTO_3284 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3282 ) ( not ( = ?AUTO_3281 ?AUTO_3282 ) ) ( ON ?AUTO_3281 ?AUTO_3283 ) ( not ( = ?AUTO_3281 ?AUTO_3283 ) ) ( not ( = ?AUTO_3282 ?AUTO_3283 ) ) ( not ( = ?AUTO_3281 ?AUTO_3284 ) ) ( not ( = ?AUTO_3282 ?AUTO_3284 ) ) ( not ( = ?AUTO_3283 ?AUTO_3284 ) ) ( ON ?AUTO_3284 ?AUTO_3281 ) ( CLEAR ?AUTO_3284 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3284 ?AUTO_3281 )
      ( MAKE-ON ?AUTO_3281 ?AUTO_3282 )
      ( MAKE-ON-VERIFY ?AUTO_3281 ?AUTO_3282 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3285 - BLOCK
      ?AUTO_3286 - BLOCK
    )
    :vars
    (
      ?AUTO_3287 - BLOCK
      ?AUTO_3288 - BLOCK
      ?AUTO_3289 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3285 ?AUTO_3286 ) ) ( ON ?AUTO_3285 ?AUTO_3287 ) ( not ( = ?AUTO_3285 ?AUTO_3287 ) ) ( not ( = ?AUTO_3286 ?AUTO_3287 ) ) ( not ( = ?AUTO_3285 ?AUTO_3288 ) ) ( not ( = ?AUTO_3286 ?AUTO_3288 ) ) ( not ( = ?AUTO_3287 ?AUTO_3288 ) ) ( ON ?AUTO_3288 ?AUTO_3285 ) ( CLEAR ?AUTO_3288 ) ( HOLDING ?AUTO_3286 ) ( CLEAR ?AUTO_3289 ) ( not ( = ?AUTO_3285 ?AUTO_3289 ) ) ( not ( = ?AUTO_3286 ?AUTO_3289 ) ) ( not ( = ?AUTO_3287 ?AUTO_3289 ) ) ( not ( = ?AUTO_3288 ?AUTO_3289 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3286 ?AUTO_3289 )
      ( MAKE-ON ?AUTO_3285 ?AUTO_3286 )
      ( MAKE-ON-VERIFY ?AUTO_3285 ?AUTO_3286 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3290 - BLOCK
      ?AUTO_3291 - BLOCK
    )
    :vars
    (
      ?AUTO_3293 - BLOCK
      ?AUTO_3292 - BLOCK
      ?AUTO_3294 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3290 ?AUTO_3291 ) ) ( ON ?AUTO_3290 ?AUTO_3293 ) ( not ( = ?AUTO_3290 ?AUTO_3293 ) ) ( not ( = ?AUTO_3291 ?AUTO_3293 ) ) ( not ( = ?AUTO_3290 ?AUTO_3292 ) ) ( not ( = ?AUTO_3291 ?AUTO_3292 ) ) ( not ( = ?AUTO_3293 ?AUTO_3292 ) ) ( ON ?AUTO_3292 ?AUTO_3290 ) ( CLEAR ?AUTO_3294 ) ( not ( = ?AUTO_3290 ?AUTO_3294 ) ) ( not ( = ?AUTO_3291 ?AUTO_3294 ) ) ( not ( = ?AUTO_3293 ?AUTO_3294 ) ) ( not ( = ?AUTO_3292 ?AUTO_3294 ) ) ( ON ?AUTO_3291 ?AUTO_3292 ) ( CLEAR ?AUTO_3291 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3291 ?AUTO_3292 )
      ( MAKE-ON ?AUTO_3290 ?AUTO_3291 )
      ( MAKE-ON-VERIFY ?AUTO_3290 ?AUTO_3291 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3295 - BLOCK
      ?AUTO_3296 - BLOCK
    )
    :vars
    (
      ?AUTO_3298 - BLOCK
      ?AUTO_3297 - BLOCK
      ?AUTO_3299 - BLOCK
      ?AUTO_3300 - BLOCK
      ?AUTO_3301 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3295 ?AUTO_3296 ) ) ( ON ?AUTO_3295 ?AUTO_3298 ) ( not ( = ?AUTO_3295 ?AUTO_3298 ) ) ( not ( = ?AUTO_3296 ?AUTO_3298 ) ) ( not ( = ?AUTO_3295 ?AUTO_3297 ) ) ( not ( = ?AUTO_3296 ?AUTO_3297 ) ) ( not ( = ?AUTO_3298 ?AUTO_3297 ) ) ( ON ?AUTO_3297 ?AUTO_3295 ) ( CLEAR ?AUTO_3299 ) ( not ( = ?AUTO_3295 ?AUTO_3299 ) ) ( not ( = ?AUTO_3296 ?AUTO_3299 ) ) ( not ( = ?AUTO_3298 ?AUTO_3299 ) ) ( not ( = ?AUTO_3297 ?AUTO_3299 ) ) ( ON ?AUTO_3296 ?AUTO_3297 ) ( CLEAR ?AUTO_3296 ) ( HOLDING ?AUTO_3300 ) ( CLEAR ?AUTO_3301 ) ( not ( = ?AUTO_3295 ?AUTO_3300 ) ) ( not ( = ?AUTO_3295 ?AUTO_3301 ) ) ( not ( = ?AUTO_3296 ?AUTO_3300 ) ) ( not ( = ?AUTO_3296 ?AUTO_3301 ) ) ( not ( = ?AUTO_3298 ?AUTO_3300 ) ) ( not ( = ?AUTO_3298 ?AUTO_3301 ) ) ( not ( = ?AUTO_3297 ?AUTO_3300 ) ) ( not ( = ?AUTO_3297 ?AUTO_3301 ) ) ( not ( = ?AUTO_3299 ?AUTO_3300 ) ) ( not ( = ?AUTO_3299 ?AUTO_3301 ) ) ( not ( = ?AUTO_3300 ?AUTO_3301 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3300 ?AUTO_3301 )
      ( MAKE-ON ?AUTO_3295 ?AUTO_3296 )
      ( MAKE-ON-VERIFY ?AUTO_3295 ?AUTO_3296 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3312 - BLOCK
      ?AUTO_3313 - BLOCK
    )
    :vars
    (
      ?AUTO_3314 - BLOCK
      ?AUTO_3315 - BLOCK
      ?AUTO_3316 - BLOCK
      ?AUTO_3317 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3312 ?AUTO_3313 ) ) ( ON ?AUTO_3312 ?AUTO_3314 ) ( not ( = ?AUTO_3312 ?AUTO_3314 ) ) ( not ( = ?AUTO_3313 ?AUTO_3314 ) ) ( not ( = ?AUTO_3312 ?AUTO_3315 ) ) ( not ( = ?AUTO_3313 ?AUTO_3315 ) ) ( not ( = ?AUTO_3314 ?AUTO_3315 ) ) ( ON ?AUTO_3315 ?AUTO_3312 ) ( CLEAR ?AUTO_3316 ) ( not ( = ?AUTO_3312 ?AUTO_3316 ) ) ( not ( = ?AUTO_3313 ?AUTO_3316 ) ) ( not ( = ?AUTO_3314 ?AUTO_3316 ) ) ( not ( = ?AUTO_3315 ?AUTO_3316 ) ) ( ON ?AUTO_3313 ?AUTO_3315 ) ( CLEAR ?AUTO_3313 ) ( HOLDING ?AUTO_3317 ) ( not ( = ?AUTO_3312 ?AUTO_3317 ) ) ( not ( = ?AUTO_3313 ?AUTO_3317 ) ) ( not ( = ?AUTO_3314 ?AUTO_3317 ) ) ( not ( = ?AUTO_3315 ?AUTO_3317 ) ) ( not ( = ?AUTO_3316 ?AUTO_3317 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3317 )
      ( MAKE-ON ?AUTO_3312 ?AUTO_3313 )
      ( MAKE-ON-VERIFY ?AUTO_3312 ?AUTO_3313 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3322 - BLOCK
      ?AUTO_3323 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3322 ) ( CLEAR ?AUTO_3323 ) ( not ( = ?AUTO_3322 ?AUTO_3323 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3322 ?AUTO_3323 )
      ( MAKE-ON-VERIFY ?AUTO_3322 ?AUTO_3323 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3324 - BLOCK
      ?AUTO_3325 - BLOCK
    )
    :vars
    (
      ?AUTO_3326 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3325 ) ( not ( = ?AUTO_3324 ?AUTO_3325 ) ) ( ON ?AUTO_3324 ?AUTO_3326 ) ( CLEAR ?AUTO_3324 ) ( HAND-EMPTY ) ( not ( = ?AUTO_3324 ?AUTO_3326 ) ) ( not ( = ?AUTO_3325 ?AUTO_3326 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3324 ?AUTO_3326 )
      ( MAKE-ON ?AUTO_3324 ?AUTO_3325 )
      ( MAKE-ON-VERIFY ?AUTO_3324 ?AUTO_3325 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3327 - BLOCK
      ?AUTO_3328 - BLOCK
    )
    :vars
    (
      ?AUTO_3329 - BLOCK
      ?AUTO_3330 - BLOCK
      ?AUTO_3331 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3328 ) ( not ( = ?AUTO_3327 ?AUTO_3328 ) ) ( ON ?AUTO_3327 ?AUTO_3329 ) ( CLEAR ?AUTO_3327 ) ( not ( = ?AUTO_3327 ?AUTO_3329 ) ) ( not ( = ?AUTO_3328 ?AUTO_3329 ) ) ( HOLDING ?AUTO_3330 ) ( CLEAR ?AUTO_3331 ) ( not ( = ?AUTO_3327 ?AUTO_3330 ) ) ( not ( = ?AUTO_3327 ?AUTO_3331 ) ) ( not ( = ?AUTO_3328 ?AUTO_3330 ) ) ( not ( = ?AUTO_3328 ?AUTO_3331 ) ) ( not ( = ?AUTO_3329 ?AUTO_3330 ) ) ( not ( = ?AUTO_3329 ?AUTO_3331 ) ) ( not ( = ?AUTO_3330 ?AUTO_3331 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3330 ?AUTO_3331 )
      ( MAKE-ON ?AUTO_3327 ?AUTO_3328 )
      ( MAKE-ON-VERIFY ?AUTO_3327 ?AUTO_3328 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3332 - BLOCK
      ?AUTO_3333 - BLOCK
    )
    :vars
    (
      ?AUTO_3334 - BLOCK
      ?AUTO_3335 - BLOCK
      ?AUTO_3336 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3333 ) ( not ( = ?AUTO_3332 ?AUTO_3333 ) ) ( ON ?AUTO_3332 ?AUTO_3334 ) ( not ( = ?AUTO_3332 ?AUTO_3334 ) ) ( not ( = ?AUTO_3333 ?AUTO_3334 ) ) ( CLEAR ?AUTO_3335 ) ( not ( = ?AUTO_3332 ?AUTO_3336 ) ) ( not ( = ?AUTO_3332 ?AUTO_3335 ) ) ( not ( = ?AUTO_3333 ?AUTO_3336 ) ) ( not ( = ?AUTO_3333 ?AUTO_3335 ) ) ( not ( = ?AUTO_3334 ?AUTO_3336 ) ) ( not ( = ?AUTO_3334 ?AUTO_3335 ) ) ( not ( = ?AUTO_3336 ?AUTO_3335 ) ) ( ON ?AUTO_3336 ?AUTO_3332 ) ( CLEAR ?AUTO_3336 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3336 ?AUTO_3332 )
      ( MAKE-ON ?AUTO_3332 ?AUTO_3333 )
      ( MAKE-ON-VERIFY ?AUTO_3332 ?AUTO_3333 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3337 - BLOCK
      ?AUTO_3338 - BLOCK
    )
    :vars
    (
      ?AUTO_3339 - BLOCK
      ?AUTO_3341 - BLOCK
      ?AUTO_3340 - BLOCK
      ?AUTO_3342 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3338 ) ( not ( = ?AUTO_3337 ?AUTO_3338 ) ) ( ON ?AUTO_3337 ?AUTO_3339 ) ( not ( = ?AUTO_3337 ?AUTO_3339 ) ) ( not ( = ?AUTO_3338 ?AUTO_3339 ) ) ( CLEAR ?AUTO_3341 ) ( not ( = ?AUTO_3337 ?AUTO_3340 ) ) ( not ( = ?AUTO_3337 ?AUTO_3341 ) ) ( not ( = ?AUTO_3338 ?AUTO_3340 ) ) ( not ( = ?AUTO_3338 ?AUTO_3341 ) ) ( not ( = ?AUTO_3339 ?AUTO_3340 ) ) ( not ( = ?AUTO_3339 ?AUTO_3341 ) ) ( not ( = ?AUTO_3340 ?AUTO_3341 ) ) ( ON ?AUTO_3340 ?AUTO_3337 ) ( CLEAR ?AUTO_3340 ) ( HOLDING ?AUTO_3342 ) ( not ( = ?AUTO_3337 ?AUTO_3342 ) ) ( not ( = ?AUTO_3338 ?AUTO_3342 ) ) ( not ( = ?AUTO_3339 ?AUTO_3342 ) ) ( not ( = ?AUTO_3341 ?AUTO_3342 ) ) ( not ( = ?AUTO_3340 ?AUTO_3342 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3342 )
      ( MAKE-ON ?AUTO_3337 ?AUTO_3338 )
      ( MAKE-ON-VERIFY ?AUTO_3337 ?AUTO_3338 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3343 - BLOCK
      ?AUTO_3344 - BLOCK
    )
    :vars
    (
      ?AUTO_3345 - BLOCK
      ?AUTO_3347 - BLOCK
      ?AUTO_3346 - BLOCK
      ?AUTO_3348 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3344 ) ( not ( = ?AUTO_3343 ?AUTO_3344 ) ) ( ON ?AUTO_3343 ?AUTO_3345 ) ( not ( = ?AUTO_3343 ?AUTO_3345 ) ) ( not ( = ?AUTO_3344 ?AUTO_3345 ) ) ( CLEAR ?AUTO_3347 ) ( not ( = ?AUTO_3343 ?AUTO_3346 ) ) ( not ( = ?AUTO_3343 ?AUTO_3347 ) ) ( not ( = ?AUTO_3344 ?AUTO_3346 ) ) ( not ( = ?AUTO_3344 ?AUTO_3347 ) ) ( not ( = ?AUTO_3345 ?AUTO_3346 ) ) ( not ( = ?AUTO_3345 ?AUTO_3347 ) ) ( not ( = ?AUTO_3346 ?AUTO_3347 ) ) ( ON ?AUTO_3346 ?AUTO_3343 ) ( not ( = ?AUTO_3343 ?AUTO_3348 ) ) ( not ( = ?AUTO_3344 ?AUTO_3348 ) ) ( not ( = ?AUTO_3345 ?AUTO_3348 ) ) ( not ( = ?AUTO_3347 ?AUTO_3348 ) ) ( not ( = ?AUTO_3346 ?AUTO_3348 ) ) ( ON ?AUTO_3348 ?AUTO_3346 ) ( CLEAR ?AUTO_3348 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3348 ?AUTO_3346 )
      ( MAKE-ON ?AUTO_3343 ?AUTO_3344 )
      ( MAKE-ON-VERIFY ?AUTO_3343 ?AUTO_3344 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3349 - BLOCK
      ?AUTO_3350 - BLOCK
    )
    :vars
    (
      ?AUTO_3354 - BLOCK
      ?AUTO_3353 - BLOCK
      ?AUTO_3352 - BLOCK
      ?AUTO_3351 - BLOCK
      ?AUTO_3355 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3350 ) ( not ( = ?AUTO_3349 ?AUTO_3350 ) ) ( ON ?AUTO_3349 ?AUTO_3354 ) ( not ( = ?AUTO_3349 ?AUTO_3354 ) ) ( not ( = ?AUTO_3350 ?AUTO_3354 ) ) ( not ( = ?AUTO_3349 ?AUTO_3353 ) ) ( not ( = ?AUTO_3349 ?AUTO_3352 ) ) ( not ( = ?AUTO_3350 ?AUTO_3353 ) ) ( not ( = ?AUTO_3350 ?AUTO_3352 ) ) ( not ( = ?AUTO_3354 ?AUTO_3353 ) ) ( not ( = ?AUTO_3354 ?AUTO_3352 ) ) ( not ( = ?AUTO_3353 ?AUTO_3352 ) ) ( ON ?AUTO_3353 ?AUTO_3349 ) ( not ( = ?AUTO_3349 ?AUTO_3351 ) ) ( not ( = ?AUTO_3350 ?AUTO_3351 ) ) ( not ( = ?AUTO_3354 ?AUTO_3351 ) ) ( not ( = ?AUTO_3352 ?AUTO_3351 ) ) ( not ( = ?AUTO_3353 ?AUTO_3351 ) ) ( ON ?AUTO_3351 ?AUTO_3353 ) ( CLEAR ?AUTO_3351 ) ( HOLDING ?AUTO_3352 ) ( CLEAR ?AUTO_3355 ) ( not ( = ?AUTO_3349 ?AUTO_3355 ) ) ( not ( = ?AUTO_3350 ?AUTO_3355 ) ) ( not ( = ?AUTO_3354 ?AUTO_3355 ) ) ( not ( = ?AUTO_3353 ?AUTO_3355 ) ) ( not ( = ?AUTO_3352 ?AUTO_3355 ) ) ( not ( = ?AUTO_3351 ?AUTO_3355 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3352 ?AUTO_3355 )
      ( MAKE-ON ?AUTO_3349 ?AUTO_3350 )
      ( MAKE-ON-VERIFY ?AUTO_3349 ?AUTO_3350 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3356 - BLOCK
      ?AUTO_3357 - BLOCK
    )
    :vars
    (
      ?AUTO_3358 - BLOCK
      ?AUTO_3362 - BLOCK
      ?AUTO_3360 - BLOCK
      ?AUTO_3359 - BLOCK
      ?AUTO_3361 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3357 ) ( not ( = ?AUTO_3356 ?AUTO_3357 ) ) ( ON ?AUTO_3356 ?AUTO_3358 ) ( not ( = ?AUTO_3356 ?AUTO_3358 ) ) ( not ( = ?AUTO_3357 ?AUTO_3358 ) ) ( not ( = ?AUTO_3356 ?AUTO_3362 ) ) ( not ( = ?AUTO_3356 ?AUTO_3360 ) ) ( not ( = ?AUTO_3357 ?AUTO_3362 ) ) ( not ( = ?AUTO_3357 ?AUTO_3360 ) ) ( not ( = ?AUTO_3358 ?AUTO_3362 ) ) ( not ( = ?AUTO_3358 ?AUTO_3360 ) ) ( not ( = ?AUTO_3362 ?AUTO_3360 ) ) ( ON ?AUTO_3362 ?AUTO_3356 ) ( not ( = ?AUTO_3356 ?AUTO_3359 ) ) ( not ( = ?AUTO_3357 ?AUTO_3359 ) ) ( not ( = ?AUTO_3358 ?AUTO_3359 ) ) ( not ( = ?AUTO_3360 ?AUTO_3359 ) ) ( not ( = ?AUTO_3362 ?AUTO_3359 ) ) ( ON ?AUTO_3359 ?AUTO_3362 ) ( CLEAR ?AUTO_3361 ) ( not ( = ?AUTO_3356 ?AUTO_3361 ) ) ( not ( = ?AUTO_3357 ?AUTO_3361 ) ) ( not ( = ?AUTO_3358 ?AUTO_3361 ) ) ( not ( = ?AUTO_3362 ?AUTO_3361 ) ) ( not ( = ?AUTO_3360 ?AUTO_3361 ) ) ( not ( = ?AUTO_3359 ?AUTO_3361 ) ) ( ON ?AUTO_3360 ?AUTO_3359 ) ( CLEAR ?AUTO_3360 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3360 ?AUTO_3359 )
      ( MAKE-ON ?AUTO_3356 ?AUTO_3357 )
      ( MAKE-ON-VERIFY ?AUTO_3356 ?AUTO_3357 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3363 - BLOCK
      ?AUTO_3364 - BLOCK
    )
    :vars
    (
      ?AUTO_3365 - BLOCK
      ?AUTO_3368 - BLOCK
      ?AUTO_3367 - BLOCK
      ?AUTO_3366 - BLOCK
      ?AUTO_3369 - BLOCK
      ?AUTO_3370 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3363 ?AUTO_3364 ) ) ( ON ?AUTO_3363 ?AUTO_3365 ) ( not ( = ?AUTO_3363 ?AUTO_3365 ) ) ( not ( = ?AUTO_3364 ?AUTO_3365 ) ) ( not ( = ?AUTO_3363 ?AUTO_3368 ) ) ( not ( = ?AUTO_3363 ?AUTO_3367 ) ) ( not ( = ?AUTO_3364 ?AUTO_3368 ) ) ( not ( = ?AUTO_3364 ?AUTO_3367 ) ) ( not ( = ?AUTO_3365 ?AUTO_3368 ) ) ( not ( = ?AUTO_3365 ?AUTO_3367 ) ) ( not ( = ?AUTO_3368 ?AUTO_3367 ) ) ( ON ?AUTO_3368 ?AUTO_3363 ) ( not ( = ?AUTO_3363 ?AUTO_3366 ) ) ( not ( = ?AUTO_3364 ?AUTO_3366 ) ) ( not ( = ?AUTO_3365 ?AUTO_3366 ) ) ( not ( = ?AUTO_3367 ?AUTO_3366 ) ) ( not ( = ?AUTO_3368 ?AUTO_3366 ) ) ( ON ?AUTO_3366 ?AUTO_3368 ) ( CLEAR ?AUTO_3369 ) ( not ( = ?AUTO_3363 ?AUTO_3369 ) ) ( not ( = ?AUTO_3364 ?AUTO_3369 ) ) ( not ( = ?AUTO_3365 ?AUTO_3369 ) ) ( not ( = ?AUTO_3368 ?AUTO_3369 ) ) ( not ( = ?AUTO_3367 ?AUTO_3369 ) ) ( not ( = ?AUTO_3366 ?AUTO_3369 ) ) ( ON ?AUTO_3367 ?AUTO_3366 ) ( CLEAR ?AUTO_3367 ) ( HOLDING ?AUTO_3364 ) ( CLEAR ?AUTO_3370 ) ( not ( = ?AUTO_3363 ?AUTO_3370 ) ) ( not ( = ?AUTO_3364 ?AUTO_3370 ) ) ( not ( = ?AUTO_3365 ?AUTO_3370 ) ) ( not ( = ?AUTO_3368 ?AUTO_3370 ) ) ( not ( = ?AUTO_3367 ?AUTO_3370 ) ) ( not ( = ?AUTO_3366 ?AUTO_3370 ) ) ( not ( = ?AUTO_3369 ?AUTO_3370 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3364 ?AUTO_3370 )
      ( MAKE-ON ?AUTO_3363 ?AUTO_3364 )
      ( MAKE-ON-VERIFY ?AUTO_3363 ?AUTO_3364 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3373 - BLOCK
      ?AUTO_3374 - BLOCK
    )
    :vars
    (
      ?AUTO_3379 - BLOCK
      ?AUTO_3377 - BLOCK
      ?AUTO_3375 - BLOCK
      ?AUTO_3378 - BLOCK
      ?AUTO_3376 - BLOCK
      ?AUTO_3380 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3374 ) ( not ( = ?AUTO_3373 ?AUTO_3374 ) ) ( ON ?AUTO_3373 ?AUTO_3379 ) ( not ( = ?AUTO_3373 ?AUTO_3379 ) ) ( not ( = ?AUTO_3374 ?AUTO_3379 ) ) ( not ( = ?AUTO_3373 ?AUTO_3377 ) ) ( not ( = ?AUTO_3373 ?AUTO_3375 ) ) ( not ( = ?AUTO_3374 ?AUTO_3377 ) ) ( not ( = ?AUTO_3374 ?AUTO_3375 ) ) ( not ( = ?AUTO_3379 ?AUTO_3377 ) ) ( not ( = ?AUTO_3379 ?AUTO_3375 ) ) ( not ( = ?AUTO_3377 ?AUTO_3375 ) ) ( ON ?AUTO_3377 ?AUTO_3373 ) ( not ( = ?AUTO_3373 ?AUTO_3378 ) ) ( not ( = ?AUTO_3374 ?AUTO_3378 ) ) ( not ( = ?AUTO_3379 ?AUTO_3378 ) ) ( not ( = ?AUTO_3375 ?AUTO_3378 ) ) ( not ( = ?AUTO_3377 ?AUTO_3378 ) ) ( ON ?AUTO_3378 ?AUTO_3377 ) ( CLEAR ?AUTO_3376 ) ( not ( = ?AUTO_3373 ?AUTO_3376 ) ) ( not ( = ?AUTO_3374 ?AUTO_3376 ) ) ( not ( = ?AUTO_3379 ?AUTO_3376 ) ) ( not ( = ?AUTO_3377 ?AUTO_3376 ) ) ( not ( = ?AUTO_3375 ?AUTO_3376 ) ) ( not ( = ?AUTO_3378 ?AUTO_3376 ) ) ( ON ?AUTO_3375 ?AUTO_3378 ) ( CLEAR ?AUTO_3375 ) ( HOLDING ?AUTO_3380 ) ( not ( = ?AUTO_3373 ?AUTO_3380 ) ) ( not ( = ?AUTO_3374 ?AUTO_3380 ) ) ( not ( = ?AUTO_3379 ?AUTO_3380 ) ) ( not ( = ?AUTO_3377 ?AUTO_3380 ) ) ( not ( = ?AUTO_3375 ?AUTO_3380 ) ) ( not ( = ?AUTO_3378 ?AUTO_3380 ) ) ( not ( = ?AUTO_3376 ?AUTO_3380 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3380 )
      ( MAKE-ON ?AUTO_3373 ?AUTO_3374 )
      ( MAKE-ON-VERIFY ?AUTO_3373 ?AUTO_3374 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3387 - BLOCK
      ?AUTO_3388 - BLOCK
    )
    :vars
    (
      ?AUTO_3390 - BLOCK
      ?AUTO_3393 - BLOCK
      ?AUTO_3391 - BLOCK
      ?AUTO_3389 - BLOCK
      ?AUTO_3392 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3387 ?AUTO_3388 ) ) ( ON ?AUTO_3387 ?AUTO_3390 ) ( not ( = ?AUTO_3387 ?AUTO_3390 ) ) ( not ( = ?AUTO_3388 ?AUTO_3390 ) ) ( not ( = ?AUTO_3387 ?AUTO_3393 ) ) ( not ( = ?AUTO_3387 ?AUTO_3391 ) ) ( not ( = ?AUTO_3388 ?AUTO_3393 ) ) ( not ( = ?AUTO_3388 ?AUTO_3391 ) ) ( not ( = ?AUTO_3390 ?AUTO_3393 ) ) ( not ( = ?AUTO_3390 ?AUTO_3391 ) ) ( not ( = ?AUTO_3393 ?AUTO_3391 ) ) ( ON ?AUTO_3393 ?AUTO_3387 ) ( not ( = ?AUTO_3387 ?AUTO_3389 ) ) ( not ( = ?AUTO_3388 ?AUTO_3389 ) ) ( not ( = ?AUTO_3390 ?AUTO_3389 ) ) ( not ( = ?AUTO_3391 ?AUTO_3389 ) ) ( not ( = ?AUTO_3393 ?AUTO_3389 ) ) ( ON ?AUTO_3389 ?AUTO_3393 ) ( CLEAR ?AUTO_3392 ) ( not ( = ?AUTO_3387 ?AUTO_3392 ) ) ( not ( = ?AUTO_3388 ?AUTO_3392 ) ) ( not ( = ?AUTO_3390 ?AUTO_3392 ) ) ( not ( = ?AUTO_3393 ?AUTO_3392 ) ) ( not ( = ?AUTO_3391 ?AUTO_3392 ) ) ( not ( = ?AUTO_3389 ?AUTO_3392 ) ) ( ON ?AUTO_3391 ?AUTO_3389 ) ( CLEAR ?AUTO_3391 ) ( HOLDING ?AUTO_3388 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3388 )
      ( MAKE-ON ?AUTO_3387 ?AUTO_3388 )
      ( MAKE-ON-VERIFY ?AUTO_3387 ?AUTO_3388 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3394 - BLOCK
      ?AUTO_3395 - BLOCK
    )
    :vars
    (
      ?AUTO_3398 - BLOCK
      ?AUTO_3396 - BLOCK
      ?AUTO_3400 - BLOCK
      ?AUTO_3397 - BLOCK
      ?AUTO_3399 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3394 ?AUTO_3395 ) ) ( ON ?AUTO_3394 ?AUTO_3398 ) ( not ( = ?AUTO_3394 ?AUTO_3398 ) ) ( not ( = ?AUTO_3395 ?AUTO_3398 ) ) ( not ( = ?AUTO_3394 ?AUTO_3396 ) ) ( not ( = ?AUTO_3394 ?AUTO_3400 ) ) ( not ( = ?AUTO_3395 ?AUTO_3396 ) ) ( not ( = ?AUTO_3395 ?AUTO_3400 ) ) ( not ( = ?AUTO_3398 ?AUTO_3396 ) ) ( not ( = ?AUTO_3398 ?AUTO_3400 ) ) ( not ( = ?AUTO_3396 ?AUTO_3400 ) ) ( ON ?AUTO_3396 ?AUTO_3394 ) ( not ( = ?AUTO_3394 ?AUTO_3397 ) ) ( not ( = ?AUTO_3395 ?AUTO_3397 ) ) ( not ( = ?AUTO_3398 ?AUTO_3397 ) ) ( not ( = ?AUTO_3400 ?AUTO_3397 ) ) ( not ( = ?AUTO_3396 ?AUTO_3397 ) ) ( ON ?AUTO_3397 ?AUTO_3396 ) ( not ( = ?AUTO_3394 ?AUTO_3399 ) ) ( not ( = ?AUTO_3395 ?AUTO_3399 ) ) ( not ( = ?AUTO_3398 ?AUTO_3399 ) ) ( not ( = ?AUTO_3396 ?AUTO_3399 ) ) ( not ( = ?AUTO_3400 ?AUTO_3399 ) ) ( not ( = ?AUTO_3397 ?AUTO_3399 ) ) ( ON ?AUTO_3400 ?AUTO_3397 ) ( CLEAR ?AUTO_3400 ) ( ON ?AUTO_3395 ?AUTO_3399 ) ( CLEAR ?AUTO_3395 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3395 ?AUTO_3399 )
      ( MAKE-ON ?AUTO_3394 ?AUTO_3395 )
      ( MAKE-ON-VERIFY ?AUTO_3394 ?AUTO_3395 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3403 - BLOCK
      ?AUTO_3404 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3403 ) ( CLEAR ?AUTO_3404 ) ( not ( = ?AUTO_3403 ?AUTO_3404 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3403 ?AUTO_3404 )
      ( MAKE-ON-VERIFY ?AUTO_3403 ?AUTO_3404 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3405 - BLOCK
      ?AUTO_3406 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3406 ) ( not ( = ?AUTO_3405 ?AUTO_3406 ) ) ( ON-TABLE ?AUTO_3405 ) ( CLEAR ?AUTO_3405 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_3405 )
      ( MAKE-ON ?AUTO_3405 ?AUTO_3406 )
      ( MAKE-ON-VERIFY ?AUTO_3405 ?AUTO_3406 ) )
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
    )
    :precondition
    ( and ( CLEAR ?AUTO_3408 ) ( not ( = ?AUTO_3407 ?AUTO_3408 ) ) ( ON-TABLE ?AUTO_3407 ) ( CLEAR ?AUTO_3407 ) ( HOLDING ?AUTO_3409 ) ( CLEAR ?AUTO_3410 ) ( not ( = ?AUTO_3407 ?AUTO_3409 ) ) ( not ( = ?AUTO_3407 ?AUTO_3410 ) ) ( not ( = ?AUTO_3408 ?AUTO_3409 ) ) ( not ( = ?AUTO_3408 ?AUTO_3410 ) ) ( not ( = ?AUTO_3409 ?AUTO_3410 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3409 ?AUTO_3410 )
      ( MAKE-ON ?AUTO_3407 ?AUTO_3408 )
      ( MAKE-ON-VERIFY ?AUTO_3407 ?AUTO_3408 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3411 - BLOCK
      ?AUTO_3412 - BLOCK
    )
    :vars
    (
      ?AUTO_3413 - BLOCK
      ?AUTO_3414 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3411 ?AUTO_3412 ) ) ( ON-TABLE ?AUTO_3411 ) ( CLEAR ?AUTO_3411 ) ( CLEAR ?AUTO_3413 ) ( not ( = ?AUTO_3411 ?AUTO_3414 ) ) ( not ( = ?AUTO_3411 ?AUTO_3413 ) ) ( not ( = ?AUTO_3412 ?AUTO_3414 ) ) ( not ( = ?AUTO_3412 ?AUTO_3413 ) ) ( not ( = ?AUTO_3414 ?AUTO_3413 ) ) ( ON ?AUTO_3414 ?AUTO_3412 ) ( CLEAR ?AUTO_3414 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3414 ?AUTO_3412 )
      ( MAKE-ON ?AUTO_3411 ?AUTO_3412 )
      ( MAKE-ON-VERIFY ?AUTO_3411 ?AUTO_3412 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3415 - BLOCK
      ?AUTO_3416 - BLOCK
    )
    :vars
    (
      ?AUTO_3417 - BLOCK
      ?AUTO_3418 - BLOCK
      ?AUTO_3419 - BLOCK
      ?AUTO_3420 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3415 ?AUTO_3416 ) ) ( ON-TABLE ?AUTO_3415 ) ( CLEAR ?AUTO_3415 ) ( CLEAR ?AUTO_3417 ) ( not ( = ?AUTO_3415 ?AUTO_3418 ) ) ( not ( = ?AUTO_3415 ?AUTO_3417 ) ) ( not ( = ?AUTO_3416 ?AUTO_3418 ) ) ( not ( = ?AUTO_3416 ?AUTO_3417 ) ) ( not ( = ?AUTO_3418 ?AUTO_3417 ) ) ( ON ?AUTO_3418 ?AUTO_3416 ) ( CLEAR ?AUTO_3418 ) ( HOLDING ?AUTO_3419 ) ( CLEAR ?AUTO_3420 ) ( not ( = ?AUTO_3415 ?AUTO_3419 ) ) ( not ( = ?AUTO_3415 ?AUTO_3420 ) ) ( not ( = ?AUTO_3416 ?AUTO_3419 ) ) ( not ( = ?AUTO_3416 ?AUTO_3420 ) ) ( not ( = ?AUTO_3417 ?AUTO_3419 ) ) ( not ( = ?AUTO_3417 ?AUTO_3420 ) ) ( not ( = ?AUTO_3418 ?AUTO_3419 ) ) ( not ( = ?AUTO_3418 ?AUTO_3420 ) ) ( not ( = ?AUTO_3419 ?AUTO_3420 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3419 ?AUTO_3420 )
      ( MAKE-ON ?AUTO_3415 ?AUTO_3416 )
      ( MAKE-ON-VERIFY ?AUTO_3415 ?AUTO_3416 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3421 - BLOCK
      ?AUTO_3422 - BLOCK
    )
    :vars
    (
      ?AUTO_3424 - BLOCK
      ?AUTO_3423 - BLOCK
      ?AUTO_3426 - BLOCK
      ?AUTO_3425 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3421 ?AUTO_3422 ) ) ( ON-TABLE ?AUTO_3421 ) ( CLEAR ?AUTO_3421 ) ( CLEAR ?AUTO_3424 ) ( not ( = ?AUTO_3421 ?AUTO_3423 ) ) ( not ( = ?AUTO_3421 ?AUTO_3424 ) ) ( not ( = ?AUTO_3422 ?AUTO_3423 ) ) ( not ( = ?AUTO_3422 ?AUTO_3424 ) ) ( not ( = ?AUTO_3423 ?AUTO_3424 ) ) ( ON ?AUTO_3423 ?AUTO_3422 ) ( CLEAR ?AUTO_3426 ) ( not ( = ?AUTO_3421 ?AUTO_3425 ) ) ( not ( = ?AUTO_3421 ?AUTO_3426 ) ) ( not ( = ?AUTO_3422 ?AUTO_3425 ) ) ( not ( = ?AUTO_3422 ?AUTO_3426 ) ) ( not ( = ?AUTO_3424 ?AUTO_3425 ) ) ( not ( = ?AUTO_3424 ?AUTO_3426 ) ) ( not ( = ?AUTO_3423 ?AUTO_3425 ) ) ( not ( = ?AUTO_3423 ?AUTO_3426 ) ) ( not ( = ?AUTO_3425 ?AUTO_3426 ) ) ( ON ?AUTO_3425 ?AUTO_3423 ) ( CLEAR ?AUTO_3425 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3425 ?AUTO_3423 )
      ( MAKE-ON ?AUTO_3421 ?AUTO_3422 )
      ( MAKE-ON-VERIFY ?AUTO_3421 ?AUTO_3422 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3427 - BLOCK
      ?AUTO_3428 - BLOCK
    )
    :vars
    (
      ?AUTO_3429 - BLOCK
      ?AUTO_3432 - BLOCK
      ?AUTO_3430 - BLOCK
      ?AUTO_3431 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3427 ?AUTO_3428 ) ) ( CLEAR ?AUTO_3429 ) ( not ( = ?AUTO_3427 ?AUTO_3432 ) ) ( not ( = ?AUTO_3427 ?AUTO_3429 ) ) ( not ( = ?AUTO_3428 ?AUTO_3432 ) ) ( not ( = ?AUTO_3428 ?AUTO_3429 ) ) ( not ( = ?AUTO_3432 ?AUTO_3429 ) ) ( ON ?AUTO_3432 ?AUTO_3428 ) ( CLEAR ?AUTO_3430 ) ( not ( = ?AUTO_3427 ?AUTO_3431 ) ) ( not ( = ?AUTO_3427 ?AUTO_3430 ) ) ( not ( = ?AUTO_3428 ?AUTO_3431 ) ) ( not ( = ?AUTO_3428 ?AUTO_3430 ) ) ( not ( = ?AUTO_3429 ?AUTO_3431 ) ) ( not ( = ?AUTO_3429 ?AUTO_3430 ) ) ( not ( = ?AUTO_3432 ?AUTO_3431 ) ) ( not ( = ?AUTO_3432 ?AUTO_3430 ) ) ( not ( = ?AUTO_3431 ?AUTO_3430 ) ) ( ON ?AUTO_3431 ?AUTO_3432 ) ( CLEAR ?AUTO_3431 ) ( HOLDING ?AUTO_3427 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3427 )
      ( MAKE-ON ?AUTO_3427 ?AUTO_3428 )
      ( MAKE-ON-VERIFY ?AUTO_3427 ?AUTO_3428 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3433 - BLOCK
      ?AUTO_3434 - BLOCK
    )
    :vars
    (
      ?AUTO_3437 - BLOCK
      ?AUTO_3435 - BLOCK
      ?AUTO_3436 - BLOCK
      ?AUTO_3438 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3433 ?AUTO_3434 ) ) ( CLEAR ?AUTO_3437 ) ( not ( = ?AUTO_3433 ?AUTO_3435 ) ) ( not ( = ?AUTO_3433 ?AUTO_3437 ) ) ( not ( = ?AUTO_3434 ?AUTO_3435 ) ) ( not ( = ?AUTO_3434 ?AUTO_3437 ) ) ( not ( = ?AUTO_3435 ?AUTO_3437 ) ) ( ON ?AUTO_3435 ?AUTO_3434 ) ( CLEAR ?AUTO_3436 ) ( not ( = ?AUTO_3433 ?AUTO_3438 ) ) ( not ( = ?AUTO_3433 ?AUTO_3436 ) ) ( not ( = ?AUTO_3434 ?AUTO_3438 ) ) ( not ( = ?AUTO_3434 ?AUTO_3436 ) ) ( not ( = ?AUTO_3437 ?AUTO_3438 ) ) ( not ( = ?AUTO_3437 ?AUTO_3436 ) ) ( not ( = ?AUTO_3435 ?AUTO_3438 ) ) ( not ( = ?AUTO_3435 ?AUTO_3436 ) ) ( not ( = ?AUTO_3438 ?AUTO_3436 ) ) ( ON ?AUTO_3438 ?AUTO_3435 ) ( ON ?AUTO_3433 ?AUTO_3438 ) ( CLEAR ?AUTO_3433 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3433 ?AUTO_3438 )
      ( MAKE-ON ?AUTO_3433 ?AUTO_3434 )
      ( MAKE-ON-VERIFY ?AUTO_3433 ?AUTO_3434 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3439 - BLOCK
      ?AUTO_3440 - BLOCK
    )
    :vars
    (
      ?AUTO_3442 - BLOCK
      ?AUTO_3441 - BLOCK
      ?AUTO_3444 - BLOCK
      ?AUTO_3443 - BLOCK
      ?AUTO_3445 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3439 ?AUTO_3440 ) ) ( CLEAR ?AUTO_3442 ) ( not ( = ?AUTO_3439 ?AUTO_3441 ) ) ( not ( = ?AUTO_3439 ?AUTO_3442 ) ) ( not ( = ?AUTO_3440 ?AUTO_3441 ) ) ( not ( = ?AUTO_3440 ?AUTO_3442 ) ) ( not ( = ?AUTO_3441 ?AUTO_3442 ) ) ( ON ?AUTO_3441 ?AUTO_3440 ) ( not ( = ?AUTO_3439 ?AUTO_3444 ) ) ( not ( = ?AUTO_3439 ?AUTO_3443 ) ) ( not ( = ?AUTO_3440 ?AUTO_3444 ) ) ( not ( = ?AUTO_3440 ?AUTO_3443 ) ) ( not ( = ?AUTO_3442 ?AUTO_3444 ) ) ( not ( = ?AUTO_3442 ?AUTO_3443 ) ) ( not ( = ?AUTO_3441 ?AUTO_3444 ) ) ( not ( = ?AUTO_3441 ?AUTO_3443 ) ) ( not ( = ?AUTO_3444 ?AUTO_3443 ) ) ( ON ?AUTO_3444 ?AUTO_3441 ) ( ON ?AUTO_3439 ?AUTO_3444 ) ( CLEAR ?AUTO_3439 ) ( HOLDING ?AUTO_3443 ) ( CLEAR ?AUTO_3445 ) ( not ( = ?AUTO_3439 ?AUTO_3445 ) ) ( not ( = ?AUTO_3440 ?AUTO_3445 ) ) ( not ( = ?AUTO_3442 ?AUTO_3445 ) ) ( not ( = ?AUTO_3441 ?AUTO_3445 ) ) ( not ( = ?AUTO_3444 ?AUTO_3445 ) ) ( not ( = ?AUTO_3443 ?AUTO_3445 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3443 ?AUTO_3445 )
      ( MAKE-ON ?AUTO_3439 ?AUTO_3440 )
      ( MAKE-ON-VERIFY ?AUTO_3439 ?AUTO_3440 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3446 - BLOCK
      ?AUTO_3447 - BLOCK
    )
    :vars
    (
      ?AUTO_3448 - BLOCK
      ?AUTO_3449 - BLOCK
      ?AUTO_3452 - BLOCK
      ?AUTO_3451 - BLOCK
      ?AUTO_3450 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3446 ?AUTO_3447 ) ) ( CLEAR ?AUTO_3448 ) ( not ( = ?AUTO_3446 ?AUTO_3449 ) ) ( not ( = ?AUTO_3446 ?AUTO_3448 ) ) ( not ( = ?AUTO_3447 ?AUTO_3449 ) ) ( not ( = ?AUTO_3447 ?AUTO_3448 ) ) ( not ( = ?AUTO_3449 ?AUTO_3448 ) ) ( ON ?AUTO_3449 ?AUTO_3447 ) ( not ( = ?AUTO_3446 ?AUTO_3452 ) ) ( not ( = ?AUTO_3446 ?AUTO_3451 ) ) ( not ( = ?AUTO_3447 ?AUTO_3452 ) ) ( not ( = ?AUTO_3447 ?AUTO_3451 ) ) ( not ( = ?AUTO_3448 ?AUTO_3452 ) ) ( not ( = ?AUTO_3448 ?AUTO_3451 ) ) ( not ( = ?AUTO_3449 ?AUTO_3452 ) ) ( not ( = ?AUTO_3449 ?AUTO_3451 ) ) ( not ( = ?AUTO_3452 ?AUTO_3451 ) ) ( ON ?AUTO_3452 ?AUTO_3449 ) ( ON ?AUTO_3446 ?AUTO_3452 ) ( CLEAR ?AUTO_3450 ) ( not ( = ?AUTO_3446 ?AUTO_3450 ) ) ( not ( = ?AUTO_3447 ?AUTO_3450 ) ) ( not ( = ?AUTO_3448 ?AUTO_3450 ) ) ( not ( = ?AUTO_3449 ?AUTO_3450 ) ) ( not ( = ?AUTO_3452 ?AUTO_3450 ) ) ( not ( = ?AUTO_3451 ?AUTO_3450 ) ) ( ON ?AUTO_3451 ?AUTO_3446 ) ( CLEAR ?AUTO_3451 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3451 ?AUTO_3446 )
      ( MAKE-ON ?AUTO_3446 ?AUTO_3447 )
      ( MAKE-ON-VERIFY ?AUTO_3446 ?AUTO_3447 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3453 - BLOCK
      ?AUTO_3454 - BLOCK
    )
    :vars
    (
      ?AUTO_3455 - BLOCK
      ?AUTO_3456 - BLOCK
      ?AUTO_3459 - BLOCK
      ?AUTO_3458 - BLOCK
      ?AUTO_3457 - BLOCK
      ?AUTO_3460 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3453 ?AUTO_3454 ) ) ( not ( = ?AUTO_3453 ?AUTO_3455 ) ) ( not ( = ?AUTO_3453 ?AUTO_3456 ) ) ( not ( = ?AUTO_3454 ?AUTO_3455 ) ) ( not ( = ?AUTO_3454 ?AUTO_3456 ) ) ( not ( = ?AUTO_3455 ?AUTO_3456 ) ) ( ON ?AUTO_3455 ?AUTO_3454 ) ( not ( = ?AUTO_3453 ?AUTO_3459 ) ) ( not ( = ?AUTO_3453 ?AUTO_3458 ) ) ( not ( = ?AUTO_3454 ?AUTO_3459 ) ) ( not ( = ?AUTO_3454 ?AUTO_3458 ) ) ( not ( = ?AUTO_3456 ?AUTO_3459 ) ) ( not ( = ?AUTO_3456 ?AUTO_3458 ) ) ( not ( = ?AUTO_3455 ?AUTO_3459 ) ) ( not ( = ?AUTO_3455 ?AUTO_3458 ) ) ( not ( = ?AUTO_3459 ?AUTO_3458 ) ) ( ON ?AUTO_3459 ?AUTO_3455 ) ( ON ?AUTO_3453 ?AUTO_3459 ) ( CLEAR ?AUTO_3457 ) ( not ( = ?AUTO_3453 ?AUTO_3457 ) ) ( not ( = ?AUTO_3454 ?AUTO_3457 ) ) ( not ( = ?AUTO_3456 ?AUTO_3457 ) ) ( not ( = ?AUTO_3455 ?AUTO_3457 ) ) ( not ( = ?AUTO_3459 ?AUTO_3457 ) ) ( not ( = ?AUTO_3458 ?AUTO_3457 ) ) ( ON ?AUTO_3458 ?AUTO_3453 ) ( CLEAR ?AUTO_3458 ) ( HOLDING ?AUTO_3456 ) ( CLEAR ?AUTO_3460 ) ( not ( = ?AUTO_3453 ?AUTO_3460 ) ) ( not ( = ?AUTO_3454 ?AUTO_3460 ) ) ( not ( = ?AUTO_3455 ?AUTO_3460 ) ) ( not ( = ?AUTO_3456 ?AUTO_3460 ) ) ( not ( = ?AUTO_3459 ?AUTO_3460 ) ) ( not ( = ?AUTO_3458 ?AUTO_3460 ) ) ( not ( = ?AUTO_3457 ?AUTO_3460 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3456 ?AUTO_3460 )
      ( MAKE-ON ?AUTO_3453 ?AUTO_3454 )
      ( MAKE-ON-VERIFY ?AUTO_3453 ?AUTO_3454 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3471 - BLOCK
      ?AUTO_3472 - BLOCK
    )
    :vars
    (
      ?AUTO_3473 - BLOCK
      ?AUTO_3476 - BLOCK
      ?AUTO_3475 - BLOCK
      ?AUTO_3474 - BLOCK
      ?AUTO_3477 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3471 ?AUTO_3472 ) ) ( not ( = ?AUTO_3471 ?AUTO_3473 ) ) ( not ( = ?AUTO_3471 ?AUTO_3476 ) ) ( not ( = ?AUTO_3472 ?AUTO_3473 ) ) ( not ( = ?AUTO_3472 ?AUTO_3476 ) ) ( not ( = ?AUTO_3473 ?AUTO_3476 ) ) ( ON ?AUTO_3473 ?AUTO_3472 ) ( not ( = ?AUTO_3471 ?AUTO_3475 ) ) ( not ( = ?AUTO_3471 ?AUTO_3474 ) ) ( not ( = ?AUTO_3472 ?AUTO_3475 ) ) ( not ( = ?AUTO_3472 ?AUTO_3474 ) ) ( not ( = ?AUTO_3476 ?AUTO_3475 ) ) ( not ( = ?AUTO_3476 ?AUTO_3474 ) ) ( not ( = ?AUTO_3473 ?AUTO_3475 ) ) ( not ( = ?AUTO_3473 ?AUTO_3474 ) ) ( not ( = ?AUTO_3475 ?AUTO_3474 ) ) ( ON ?AUTO_3475 ?AUTO_3473 ) ( ON ?AUTO_3471 ?AUTO_3475 ) ( CLEAR ?AUTO_3477 ) ( not ( = ?AUTO_3471 ?AUTO_3477 ) ) ( not ( = ?AUTO_3472 ?AUTO_3477 ) ) ( not ( = ?AUTO_3476 ?AUTO_3477 ) ) ( not ( = ?AUTO_3473 ?AUTO_3477 ) ) ( not ( = ?AUTO_3475 ?AUTO_3477 ) ) ( not ( = ?AUTO_3474 ?AUTO_3477 ) ) ( ON ?AUTO_3474 ?AUTO_3471 ) ( CLEAR ?AUTO_3474 ) ( HOLDING ?AUTO_3476 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3476 )
      ( MAKE-ON ?AUTO_3471 ?AUTO_3472 )
      ( MAKE-ON-VERIFY ?AUTO_3471 ?AUTO_3472 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3478 - BLOCK
      ?AUTO_3479 - BLOCK
    )
    :vars
    (
      ?AUTO_3481 - BLOCK
      ?AUTO_3483 - BLOCK
      ?AUTO_3484 - BLOCK
      ?AUTO_3480 - BLOCK
      ?AUTO_3482 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3478 ?AUTO_3479 ) ) ( not ( = ?AUTO_3478 ?AUTO_3481 ) ) ( not ( = ?AUTO_3478 ?AUTO_3483 ) ) ( not ( = ?AUTO_3479 ?AUTO_3481 ) ) ( not ( = ?AUTO_3479 ?AUTO_3483 ) ) ( not ( = ?AUTO_3481 ?AUTO_3483 ) ) ( ON ?AUTO_3481 ?AUTO_3479 ) ( not ( = ?AUTO_3478 ?AUTO_3484 ) ) ( not ( = ?AUTO_3478 ?AUTO_3480 ) ) ( not ( = ?AUTO_3479 ?AUTO_3484 ) ) ( not ( = ?AUTO_3479 ?AUTO_3480 ) ) ( not ( = ?AUTO_3483 ?AUTO_3484 ) ) ( not ( = ?AUTO_3483 ?AUTO_3480 ) ) ( not ( = ?AUTO_3481 ?AUTO_3484 ) ) ( not ( = ?AUTO_3481 ?AUTO_3480 ) ) ( not ( = ?AUTO_3484 ?AUTO_3480 ) ) ( ON ?AUTO_3484 ?AUTO_3481 ) ( ON ?AUTO_3478 ?AUTO_3484 ) ( not ( = ?AUTO_3478 ?AUTO_3482 ) ) ( not ( = ?AUTO_3479 ?AUTO_3482 ) ) ( not ( = ?AUTO_3483 ?AUTO_3482 ) ) ( not ( = ?AUTO_3481 ?AUTO_3482 ) ) ( not ( = ?AUTO_3484 ?AUTO_3482 ) ) ( not ( = ?AUTO_3480 ?AUTO_3482 ) ) ( ON ?AUTO_3480 ?AUTO_3478 ) ( CLEAR ?AUTO_3480 ) ( ON ?AUTO_3483 ?AUTO_3482 ) ( CLEAR ?AUTO_3483 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3483 ?AUTO_3482 )
      ( MAKE-ON ?AUTO_3478 ?AUTO_3479 )
      ( MAKE-ON-VERIFY ?AUTO_3478 ?AUTO_3479 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3486 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3486 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3486 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3486 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3487 - BLOCK
    )
    :vars
    (
      ?AUTO_3488 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3487 ?AUTO_3488 ) ( CLEAR ?AUTO_3487 ) ( HAND-EMPTY ) ( not ( = ?AUTO_3487 ?AUTO_3488 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3487 ?AUTO_3488 )
      ( MAKE-ON-TABLE ?AUTO_3487 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3487 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3489 - BLOCK
    )
    :vars
    (
      ?AUTO_3490 - BLOCK
      ?AUTO_3491 - BLOCK
      ?AUTO_3492 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3489 ?AUTO_3490 ) ( CLEAR ?AUTO_3489 ) ( not ( = ?AUTO_3489 ?AUTO_3490 ) ) ( HOLDING ?AUTO_3491 ) ( CLEAR ?AUTO_3492 ) ( not ( = ?AUTO_3489 ?AUTO_3491 ) ) ( not ( = ?AUTO_3489 ?AUTO_3492 ) ) ( not ( = ?AUTO_3490 ?AUTO_3491 ) ) ( not ( = ?AUTO_3490 ?AUTO_3492 ) ) ( not ( = ?AUTO_3491 ?AUTO_3492 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3491 ?AUTO_3492 )
      ( MAKE-ON-TABLE ?AUTO_3489 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3489 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3499 - BLOCK
    )
    :vars
    (
      ?AUTO_3500 - BLOCK
      ?AUTO_3502 - BLOCK
      ?AUTO_3501 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3499 ?AUTO_3500 ) ( not ( = ?AUTO_3499 ?AUTO_3500 ) ) ( CLEAR ?AUTO_3502 ) ( not ( = ?AUTO_3499 ?AUTO_3501 ) ) ( not ( = ?AUTO_3499 ?AUTO_3502 ) ) ( not ( = ?AUTO_3500 ?AUTO_3501 ) ) ( not ( = ?AUTO_3500 ?AUTO_3502 ) ) ( not ( = ?AUTO_3501 ?AUTO_3502 ) ) ( ON ?AUTO_3501 ?AUTO_3499 ) ( CLEAR ?AUTO_3501 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3501 ?AUTO_3499 )
      ( MAKE-ON-TABLE ?AUTO_3499 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3499 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3503 - BLOCK
    )
    :vars
    (
      ?AUTO_3505 - BLOCK
      ?AUTO_3506 - BLOCK
      ?AUTO_3504 - BLOCK
      ?AUTO_3507 - BLOCK
      ?AUTO_3508 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3503 ?AUTO_3505 ) ( not ( = ?AUTO_3503 ?AUTO_3505 ) ) ( CLEAR ?AUTO_3506 ) ( not ( = ?AUTO_3503 ?AUTO_3504 ) ) ( not ( = ?AUTO_3503 ?AUTO_3506 ) ) ( not ( = ?AUTO_3505 ?AUTO_3504 ) ) ( not ( = ?AUTO_3505 ?AUTO_3506 ) ) ( not ( = ?AUTO_3504 ?AUTO_3506 ) ) ( ON ?AUTO_3504 ?AUTO_3503 ) ( CLEAR ?AUTO_3504 ) ( HOLDING ?AUTO_3507 ) ( CLEAR ?AUTO_3508 ) ( not ( = ?AUTO_3503 ?AUTO_3507 ) ) ( not ( = ?AUTO_3503 ?AUTO_3508 ) ) ( not ( = ?AUTO_3505 ?AUTO_3507 ) ) ( not ( = ?AUTO_3505 ?AUTO_3508 ) ) ( not ( = ?AUTO_3506 ?AUTO_3507 ) ) ( not ( = ?AUTO_3506 ?AUTO_3508 ) ) ( not ( = ?AUTO_3504 ?AUTO_3507 ) ) ( not ( = ?AUTO_3504 ?AUTO_3508 ) ) ( not ( = ?AUTO_3507 ?AUTO_3508 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3507 ?AUTO_3508 )
      ( MAKE-ON-TABLE ?AUTO_3503 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3503 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3509 - BLOCK
    )
    :vars
    (
      ?AUTO_3510 - BLOCK
      ?AUTO_3514 - BLOCK
      ?AUTO_3511 - BLOCK
      ?AUTO_3513 - BLOCK
      ?AUTO_3512 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3509 ?AUTO_3510 ) ( not ( = ?AUTO_3509 ?AUTO_3510 ) ) ( CLEAR ?AUTO_3514 ) ( not ( = ?AUTO_3509 ?AUTO_3511 ) ) ( not ( = ?AUTO_3509 ?AUTO_3514 ) ) ( not ( = ?AUTO_3510 ?AUTO_3511 ) ) ( not ( = ?AUTO_3510 ?AUTO_3514 ) ) ( not ( = ?AUTO_3511 ?AUTO_3514 ) ) ( ON ?AUTO_3511 ?AUTO_3509 ) ( CLEAR ?AUTO_3513 ) ( not ( = ?AUTO_3509 ?AUTO_3512 ) ) ( not ( = ?AUTO_3509 ?AUTO_3513 ) ) ( not ( = ?AUTO_3510 ?AUTO_3512 ) ) ( not ( = ?AUTO_3510 ?AUTO_3513 ) ) ( not ( = ?AUTO_3514 ?AUTO_3512 ) ) ( not ( = ?AUTO_3514 ?AUTO_3513 ) ) ( not ( = ?AUTO_3511 ?AUTO_3512 ) ) ( not ( = ?AUTO_3511 ?AUTO_3513 ) ) ( not ( = ?AUTO_3512 ?AUTO_3513 ) ) ( ON ?AUTO_3512 ?AUTO_3511 ) ( CLEAR ?AUTO_3512 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3512 ?AUTO_3511 )
      ( MAKE-ON-TABLE ?AUTO_3509 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3509 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3515 - BLOCK
    )
    :vars
    (
      ?AUTO_3516 - BLOCK
      ?AUTO_3520 - BLOCK
      ?AUTO_3517 - BLOCK
      ?AUTO_3519 - BLOCK
      ?AUTO_3518 - BLOCK
      ?AUTO_3521 - BLOCK
      ?AUTO_3522 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3515 ?AUTO_3516 ) ( not ( = ?AUTO_3515 ?AUTO_3516 ) ) ( CLEAR ?AUTO_3520 ) ( not ( = ?AUTO_3515 ?AUTO_3517 ) ) ( not ( = ?AUTO_3515 ?AUTO_3520 ) ) ( not ( = ?AUTO_3516 ?AUTO_3517 ) ) ( not ( = ?AUTO_3516 ?AUTO_3520 ) ) ( not ( = ?AUTO_3517 ?AUTO_3520 ) ) ( ON ?AUTO_3517 ?AUTO_3515 ) ( CLEAR ?AUTO_3519 ) ( not ( = ?AUTO_3515 ?AUTO_3518 ) ) ( not ( = ?AUTO_3515 ?AUTO_3519 ) ) ( not ( = ?AUTO_3516 ?AUTO_3518 ) ) ( not ( = ?AUTO_3516 ?AUTO_3519 ) ) ( not ( = ?AUTO_3520 ?AUTO_3518 ) ) ( not ( = ?AUTO_3520 ?AUTO_3519 ) ) ( not ( = ?AUTO_3517 ?AUTO_3518 ) ) ( not ( = ?AUTO_3517 ?AUTO_3519 ) ) ( not ( = ?AUTO_3518 ?AUTO_3519 ) ) ( ON ?AUTO_3518 ?AUTO_3517 ) ( CLEAR ?AUTO_3518 ) ( HOLDING ?AUTO_3521 ) ( CLEAR ?AUTO_3522 ) ( not ( = ?AUTO_3515 ?AUTO_3521 ) ) ( not ( = ?AUTO_3515 ?AUTO_3522 ) ) ( not ( = ?AUTO_3516 ?AUTO_3521 ) ) ( not ( = ?AUTO_3516 ?AUTO_3522 ) ) ( not ( = ?AUTO_3520 ?AUTO_3521 ) ) ( not ( = ?AUTO_3520 ?AUTO_3522 ) ) ( not ( = ?AUTO_3517 ?AUTO_3521 ) ) ( not ( = ?AUTO_3517 ?AUTO_3522 ) ) ( not ( = ?AUTO_3519 ?AUTO_3521 ) ) ( not ( = ?AUTO_3519 ?AUTO_3522 ) ) ( not ( = ?AUTO_3518 ?AUTO_3521 ) ) ( not ( = ?AUTO_3518 ?AUTO_3522 ) ) ( not ( = ?AUTO_3521 ?AUTO_3522 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3521 ?AUTO_3522 )
      ( MAKE-ON-TABLE ?AUTO_3515 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3515 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3526 - BLOCK
    )
    :vars
    (
      ?AUTO_3527 - BLOCK
      ?AUTO_3528 - BLOCK
      ?AUTO_3529 - BLOCK
      ?AUTO_3531 - BLOCK
      ?AUTO_3530 - BLOCK
      ?AUTO_3532 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3526 ?AUTO_3527 ) ( not ( = ?AUTO_3526 ?AUTO_3527 ) ) ( CLEAR ?AUTO_3528 ) ( not ( = ?AUTO_3526 ?AUTO_3529 ) ) ( not ( = ?AUTO_3526 ?AUTO_3528 ) ) ( not ( = ?AUTO_3527 ?AUTO_3529 ) ) ( not ( = ?AUTO_3527 ?AUTO_3528 ) ) ( not ( = ?AUTO_3529 ?AUTO_3528 ) ) ( ON ?AUTO_3529 ?AUTO_3526 ) ( CLEAR ?AUTO_3531 ) ( not ( = ?AUTO_3526 ?AUTO_3530 ) ) ( not ( = ?AUTO_3526 ?AUTO_3531 ) ) ( not ( = ?AUTO_3527 ?AUTO_3530 ) ) ( not ( = ?AUTO_3527 ?AUTO_3531 ) ) ( not ( = ?AUTO_3528 ?AUTO_3530 ) ) ( not ( = ?AUTO_3528 ?AUTO_3531 ) ) ( not ( = ?AUTO_3529 ?AUTO_3530 ) ) ( not ( = ?AUTO_3529 ?AUTO_3531 ) ) ( not ( = ?AUTO_3530 ?AUTO_3531 ) ) ( ON ?AUTO_3530 ?AUTO_3529 ) ( CLEAR ?AUTO_3530 ) ( HOLDING ?AUTO_3532 ) ( not ( = ?AUTO_3526 ?AUTO_3532 ) ) ( not ( = ?AUTO_3527 ?AUTO_3532 ) ) ( not ( = ?AUTO_3528 ?AUTO_3532 ) ) ( not ( = ?AUTO_3529 ?AUTO_3532 ) ) ( not ( = ?AUTO_3531 ?AUTO_3532 ) ) ( not ( = ?AUTO_3530 ?AUTO_3532 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3532 )
      ( MAKE-ON-TABLE ?AUTO_3526 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3526 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3534 - BLOCK
    )
    :vars
    (
      ?AUTO_3539 - BLOCK
      ?AUTO_3537 - BLOCK
      ?AUTO_3538 - BLOCK
      ?AUTO_3536 - BLOCK
      ?AUTO_3535 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3534 ?AUTO_3539 ) ( not ( = ?AUTO_3534 ?AUTO_3539 ) ) ( not ( = ?AUTO_3534 ?AUTO_3537 ) ) ( not ( = ?AUTO_3534 ?AUTO_3538 ) ) ( not ( = ?AUTO_3539 ?AUTO_3537 ) ) ( not ( = ?AUTO_3539 ?AUTO_3538 ) ) ( not ( = ?AUTO_3537 ?AUTO_3538 ) ) ( ON ?AUTO_3537 ?AUTO_3534 ) ( CLEAR ?AUTO_3536 ) ( not ( = ?AUTO_3534 ?AUTO_3535 ) ) ( not ( = ?AUTO_3534 ?AUTO_3536 ) ) ( not ( = ?AUTO_3539 ?AUTO_3535 ) ) ( not ( = ?AUTO_3539 ?AUTO_3536 ) ) ( not ( = ?AUTO_3538 ?AUTO_3535 ) ) ( not ( = ?AUTO_3538 ?AUTO_3536 ) ) ( not ( = ?AUTO_3537 ?AUTO_3535 ) ) ( not ( = ?AUTO_3537 ?AUTO_3536 ) ) ( not ( = ?AUTO_3535 ?AUTO_3536 ) ) ( ON ?AUTO_3535 ?AUTO_3537 ) ( CLEAR ?AUTO_3535 ) ( HOLDING ?AUTO_3538 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3538 )
      ( MAKE-ON-TABLE ?AUTO_3534 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3534 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3543 - BLOCK
      ?AUTO_3544 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3543 ) ( CLEAR ?AUTO_3544 ) ( not ( = ?AUTO_3543 ?AUTO_3544 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3543 ?AUTO_3544 )
      ( MAKE-ON-VERIFY ?AUTO_3543 ?AUTO_3544 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3545 - BLOCK
      ?AUTO_3546 - BLOCK
    )
    :vars
    (
      ?AUTO_3547 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3546 ) ( not ( = ?AUTO_3545 ?AUTO_3546 ) ) ( ON ?AUTO_3545 ?AUTO_3547 ) ( CLEAR ?AUTO_3545 ) ( HAND-EMPTY ) ( not ( = ?AUTO_3545 ?AUTO_3547 ) ) ( not ( = ?AUTO_3546 ?AUTO_3547 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3545 ?AUTO_3547 )
      ( MAKE-ON ?AUTO_3545 ?AUTO_3546 )
      ( MAKE-ON-VERIFY ?AUTO_3545 ?AUTO_3546 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3548 - BLOCK
      ?AUTO_3549 - BLOCK
    )
    :vars
    (
      ?AUTO_3550 - BLOCK
      ?AUTO_3551 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3549 ) ( not ( = ?AUTO_3548 ?AUTO_3549 ) ) ( ON ?AUTO_3548 ?AUTO_3550 ) ( CLEAR ?AUTO_3548 ) ( not ( = ?AUTO_3548 ?AUTO_3550 ) ) ( not ( = ?AUTO_3549 ?AUTO_3550 ) ) ( HOLDING ?AUTO_3551 ) ( not ( = ?AUTO_3548 ?AUTO_3551 ) ) ( not ( = ?AUTO_3549 ?AUTO_3551 ) ) ( not ( = ?AUTO_3550 ?AUTO_3551 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3551 )
      ( MAKE-ON ?AUTO_3548 ?AUTO_3549 )
      ( MAKE-ON-VERIFY ?AUTO_3548 ?AUTO_3549 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3552 - BLOCK
      ?AUTO_3553 - BLOCK
    )
    :vars
    (
      ?AUTO_3554 - BLOCK
      ?AUTO_3555 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3553 ) ( not ( = ?AUTO_3552 ?AUTO_3553 ) ) ( ON ?AUTO_3552 ?AUTO_3554 ) ( not ( = ?AUTO_3552 ?AUTO_3554 ) ) ( not ( = ?AUTO_3553 ?AUTO_3554 ) ) ( not ( = ?AUTO_3552 ?AUTO_3555 ) ) ( not ( = ?AUTO_3553 ?AUTO_3555 ) ) ( not ( = ?AUTO_3554 ?AUTO_3555 ) ) ( ON ?AUTO_3555 ?AUTO_3552 ) ( CLEAR ?AUTO_3555 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3555 ?AUTO_3552 )
      ( MAKE-ON ?AUTO_3552 ?AUTO_3553 )
      ( MAKE-ON-VERIFY ?AUTO_3552 ?AUTO_3553 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3556 - BLOCK
      ?AUTO_3557 - BLOCK
    )
    :vars
    (
      ?AUTO_3558 - BLOCK
      ?AUTO_3559 - BLOCK
      ?AUTO_3560 - BLOCK
      ?AUTO_3561 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3557 ) ( not ( = ?AUTO_3556 ?AUTO_3557 ) ) ( ON ?AUTO_3556 ?AUTO_3558 ) ( not ( = ?AUTO_3556 ?AUTO_3558 ) ) ( not ( = ?AUTO_3557 ?AUTO_3558 ) ) ( not ( = ?AUTO_3556 ?AUTO_3559 ) ) ( not ( = ?AUTO_3557 ?AUTO_3559 ) ) ( not ( = ?AUTO_3558 ?AUTO_3559 ) ) ( ON ?AUTO_3559 ?AUTO_3556 ) ( CLEAR ?AUTO_3559 ) ( HOLDING ?AUTO_3560 ) ( CLEAR ?AUTO_3561 ) ( not ( = ?AUTO_3556 ?AUTO_3560 ) ) ( not ( = ?AUTO_3556 ?AUTO_3561 ) ) ( not ( = ?AUTO_3557 ?AUTO_3560 ) ) ( not ( = ?AUTO_3557 ?AUTO_3561 ) ) ( not ( = ?AUTO_3558 ?AUTO_3560 ) ) ( not ( = ?AUTO_3558 ?AUTO_3561 ) ) ( not ( = ?AUTO_3559 ?AUTO_3560 ) ) ( not ( = ?AUTO_3559 ?AUTO_3561 ) ) ( not ( = ?AUTO_3560 ?AUTO_3561 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3560 ?AUTO_3561 )
      ( MAKE-ON ?AUTO_3556 ?AUTO_3557 )
      ( MAKE-ON-VERIFY ?AUTO_3556 ?AUTO_3557 ) )
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
      ?AUTO_3568 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3564 ?AUTO_3565 ) ) ( ON ?AUTO_3564 ?AUTO_3567 ) ( not ( = ?AUTO_3564 ?AUTO_3567 ) ) ( not ( = ?AUTO_3565 ?AUTO_3567 ) ) ( not ( = ?AUTO_3564 ?AUTO_3566 ) ) ( not ( = ?AUTO_3565 ?AUTO_3566 ) ) ( not ( = ?AUTO_3567 ?AUTO_3566 ) ) ( ON ?AUTO_3566 ?AUTO_3564 ) ( CLEAR ?AUTO_3566 ) ( HOLDING ?AUTO_3565 ) ( CLEAR ?AUTO_3568 ) ( not ( = ?AUTO_3564 ?AUTO_3568 ) ) ( not ( = ?AUTO_3565 ?AUTO_3568 ) ) ( not ( = ?AUTO_3567 ?AUTO_3568 ) ) ( not ( = ?AUTO_3566 ?AUTO_3568 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3565 ?AUTO_3568 )
      ( MAKE-ON ?AUTO_3564 ?AUTO_3565 )
      ( MAKE-ON-VERIFY ?AUTO_3564 ?AUTO_3565 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3573 - BLOCK
      ?AUTO_3574 - BLOCK
    )
    :vars
    (
      ?AUTO_3575 - BLOCK
      ?AUTO_3576 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3573 ?AUTO_3574 ) ) ( ON ?AUTO_3573 ?AUTO_3575 ) ( CLEAR ?AUTO_3573 ) ( not ( = ?AUTO_3573 ?AUTO_3575 ) ) ( not ( = ?AUTO_3574 ?AUTO_3575 ) ) ( not ( = ?AUTO_3573 ?AUTO_3576 ) ) ( not ( = ?AUTO_3574 ?AUTO_3576 ) ) ( not ( = ?AUTO_3575 ?AUTO_3576 ) ) ( ON ?AUTO_3576 ?AUTO_3574 ) ( CLEAR ?AUTO_3576 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3576 ?AUTO_3574 )
      ( MAKE-ON ?AUTO_3573 ?AUTO_3574 )
      ( MAKE-ON-VERIFY ?AUTO_3573 ?AUTO_3574 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3577 - BLOCK
      ?AUTO_3578 - BLOCK
    )
    :vars
    (
      ?AUTO_3580 - BLOCK
      ?AUTO_3579 - BLOCK
      ?AUTO_3581 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3577 ?AUTO_3578 ) ) ( ON ?AUTO_3577 ?AUTO_3580 ) ( CLEAR ?AUTO_3577 ) ( not ( = ?AUTO_3577 ?AUTO_3580 ) ) ( not ( = ?AUTO_3578 ?AUTO_3580 ) ) ( not ( = ?AUTO_3577 ?AUTO_3579 ) ) ( not ( = ?AUTO_3578 ?AUTO_3579 ) ) ( not ( = ?AUTO_3580 ?AUTO_3579 ) ) ( ON ?AUTO_3579 ?AUTO_3578 ) ( CLEAR ?AUTO_3579 ) ( HOLDING ?AUTO_3581 ) ( not ( = ?AUTO_3577 ?AUTO_3581 ) ) ( not ( = ?AUTO_3578 ?AUTO_3581 ) ) ( not ( = ?AUTO_3580 ?AUTO_3581 ) ) ( not ( = ?AUTO_3579 ?AUTO_3581 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3581 )
      ( MAKE-ON ?AUTO_3577 ?AUTO_3578 )
      ( MAKE-ON-VERIFY ?AUTO_3577 ?AUTO_3578 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3582 - BLOCK
      ?AUTO_3583 - BLOCK
    )
    :vars
    (
      ?AUTO_3585 - BLOCK
      ?AUTO_3586 - BLOCK
      ?AUTO_3584 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3582 ?AUTO_3583 ) ) ( ON ?AUTO_3582 ?AUTO_3585 ) ( CLEAR ?AUTO_3582 ) ( not ( = ?AUTO_3582 ?AUTO_3585 ) ) ( not ( = ?AUTO_3583 ?AUTO_3585 ) ) ( not ( = ?AUTO_3582 ?AUTO_3586 ) ) ( not ( = ?AUTO_3583 ?AUTO_3586 ) ) ( not ( = ?AUTO_3585 ?AUTO_3586 ) ) ( ON ?AUTO_3586 ?AUTO_3583 ) ( not ( = ?AUTO_3582 ?AUTO_3584 ) ) ( not ( = ?AUTO_3583 ?AUTO_3584 ) ) ( not ( = ?AUTO_3585 ?AUTO_3584 ) ) ( not ( = ?AUTO_3586 ?AUTO_3584 ) ) ( ON ?AUTO_3584 ?AUTO_3586 ) ( CLEAR ?AUTO_3584 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3584 ?AUTO_3586 )
      ( MAKE-ON ?AUTO_3582 ?AUTO_3583 )
      ( MAKE-ON-VERIFY ?AUTO_3582 ?AUTO_3583 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3603 - BLOCK
      ?AUTO_3604 - BLOCK
    )
    :vars
    (
      ?AUTO_3605 - BLOCK
      ?AUTO_3608 - BLOCK
      ?AUTO_3607 - BLOCK
      ?AUTO_3606 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3603 ?AUTO_3604 ) ) ( not ( = ?AUTO_3603 ?AUTO_3605 ) ) ( not ( = ?AUTO_3603 ?AUTO_3608 ) ) ( not ( = ?AUTO_3604 ?AUTO_3605 ) ) ( not ( = ?AUTO_3604 ?AUTO_3608 ) ) ( not ( = ?AUTO_3605 ?AUTO_3608 ) ) ( ON ?AUTO_3605 ?AUTO_3604 ) ( CLEAR ?AUTO_3607 ) ( not ( = ?AUTO_3603 ?AUTO_3606 ) ) ( not ( = ?AUTO_3603 ?AUTO_3607 ) ) ( not ( = ?AUTO_3604 ?AUTO_3606 ) ) ( not ( = ?AUTO_3604 ?AUTO_3607 ) ) ( not ( = ?AUTO_3608 ?AUTO_3606 ) ) ( not ( = ?AUTO_3608 ?AUTO_3607 ) ) ( not ( = ?AUTO_3605 ?AUTO_3606 ) ) ( not ( = ?AUTO_3605 ?AUTO_3607 ) ) ( not ( = ?AUTO_3606 ?AUTO_3607 ) ) ( ON ?AUTO_3606 ?AUTO_3605 ) ( ON ?AUTO_3603 ?AUTO_3606 ) ( CLEAR ?AUTO_3603 ) ( HOLDING ?AUTO_3608 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3608 )
      ( MAKE-ON ?AUTO_3603 ?AUTO_3604 )
      ( MAKE-ON-VERIFY ?AUTO_3603 ?AUTO_3604 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3613 - BLOCK
      ?AUTO_3614 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3613 ) ( CLEAR ?AUTO_3614 ) ( not ( = ?AUTO_3613 ?AUTO_3614 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3613 ?AUTO_3614 )
      ( MAKE-ON-VERIFY ?AUTO_3613 ?AUTO_3614 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3615 - BLOCK
      ?AUTO_3616 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3616 ) ( not ( = ?AUTO_3615 ?AUTO_3616 ) ) ( ON-TABLE ?AUTO_3615 ) ( CLEAR ?AUTO_3615 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_3615 )
      ( MAKE-ON ?AUTO_3615 ?AUTO_3616 )
      ( MAKE-ON-VERIFY ?AUTO_3615 ?AUTO_3616 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3617 - BLOCK
      ?AUTO_3618 - BLOCK
    )
    :vars
    (
      ?AUTO_3619 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3617 ?AUTO_3618 ) ) ( ON-TABLE ?AUTO_3617 ) ( CLEAR ?AUTO_3617 ) ( HOLDING ?AUTO_3618 ) ( CLEAR ?AUTO_3619 ) ( not ( = ?AUTO_3617 ?AUTO_3619 ) ) ( not ( = ?AUTO_3618 ?AUTO_3619 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3618 ?AUTO_3619 )
      ( MAKE-ON ?AUTO_3617 ?AUTO_3618 )
      ( MAKE-ON-VERIFY ?AUTO_3617 ?AUTO_3618 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3675 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3675 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3675 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3675 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3676 - BLOCK
    )
    :vars
    (
      ?AUTO_3677 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3676 ?AUTO_3677 ) ( CLEAR ?AUTO_3676 ) ( HAND-EMPTY ) ( not ( = ?AUTO_3676 ?AUTO_3677 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3676 ?AUTO_3677 )
      ( MAKE-ON-TABLE ?AUTO_3676 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3676 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3678 - BLOCK
    )
    :vars
    (
      ?AUTO_3679 - BLOCK
      ?AUTO_3680 - BLOCK
      ?AUTO_3681 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3678 ?AUTO_3679 ) ( CLEAR ?AUTO_3678 ) ( not ( = ?AUTO_3678 ?AUTO_3679 ) ) ( HOLDING ?AUTO_3680 ) ( CLEAR ?AUTO_3681 ) ( not ( = ?AUTO_3678 ?AUTO_3680 ) ) ( not ( = ?AUTO_3678 ?AUTO_3681 ) ) ( not ( = ?AUTO_3679 ?AUTO_3680 ) ) ( not ( = ?AUTO_3679 ?AUTO_3681 ) ) ( not ( = ?AUTO_3680 ?AUTO_3681 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3680 ?AUTO_3681 )
      ( MAKE-ON-TABLE ?AUTO_3678 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3678 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3722 - BLOCK
      ?AUTO_3723 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3722 ) ( CLEAR ?AUTO_3723 ) ( not ( = ?AUTO_3722 ?AUTO_3723 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3722 ?AUTO_3723 )
      ( MAKE-ON-VERIFY ?AUTO_3722 ?AUTO_3723 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3724 - BLOCK
      ?AUTO_3725 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3725 ) ( not ( = ?AUTO_3724 ?AUTO_3725 ) ) ( ON-TABLE ?AUTO_3724 ) ( CLEAR ?AUTO_3724 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_3724 )
      ( MAKE-ON ?AUTO_3724 ?AUTO_3725 )
      ( MAKE-ON-VERIFY ?AUTO_3724 ?AUTO_3725 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3726 - BLOCK
      ?AUTO_3727 - BLOCK
    )
    :vars
    (
      ?AUTO_3728 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3727 ) ( not ( = ?AUTO_3726 ?AUTO_3727 ) ) ( ON-TABLE ?AUTO_3726 ) ( CLEAR ?AUTO_3726 ) ( HOLDING ?AUTO_3728 ) ( not ( = ?AUTO_3726 ?AUTO_3728 ) ) ( not ( = ?AUTO_3727 ?AUTO_3728 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3728 )
      ( MAKE-ON ?AUTO_3726 ?AUTO_3727 )
      ( MAKE-ON-VERIFY ?AUTO_3726 ?AUTO_3727 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3729 - BLOCK
      ?AUTO_3730 - BLOCK
    )
    :vars
    (
      ?AUTO_3731 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3730 ) ( not ( = ?AUTO_3729 ?AUTO_3730 ) ) ( ON-TABLE ?AUTO_3729 ) ( not ( = ?AUTO_3729 ?AUTO_3731 ) ) ( not ( = ?AUTO_3730 ?AUTO_3731 ) ) ( ON ?AUTO_3731 ?AUTO_3729 ) ( CLEAR ?AUTO_3731 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3731 ?AUTO_3729 )
      ( MAKE-ON ?AUTO_3729 ?AUTO_3730 )
      ( MAKE-ON-VERIFY ?AUTO_3729 ?AUTO_3730 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3732 - BLOCK
      ?AUTO_3733 - BLOCK
    )
    :vars
    (
      ?AUTO_3734 - BLOCK
      ?AUTO_3735 - BLOCK
      ?AUTO_3736 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3733 ) ( not ( = ?AUTO_3732 ?AUTO_3733 ) ) ( ON-TABLE ?AUTO_3732 ) ( not ( = ?AUTO_3732 ?AUTO_3734 ) ) ( not ( = ?AUTO_3733 ?AUTO_3734 ) ) ( ON ?AUTO_3734 ?AUTO_3732 ) ( CLEAR ?AUTO_3734 ) ( HOLDING ?AUTO_3735 ) ( CLEAR ?AUTO_3736 ) ( not ( = ?AUTO_3732 ?AUTO_3735 ) ) ( not ( = ?AUTO_3732 ?AUTO_3736 ) ) ( not ( = ?AUTO_3733 ?AUTO_3735 ) ) ( not ( = ?AUTO_3733 ?AUTO_3736 ) ) ( not ( = ?AUTO_3734 ?AUTO_3735 ) ) ( not ( = ?AUTO_3734 ?AUTO_3736 ) ) ( not ( = ?AUTO_3735 ?AUTO_3736 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3735 ?AUTO_3736 )
      ( MAKE-ON ?AUTO_3732 ?AUTO_3733 )
      ( MAKE-ON-VERIFY ?AUTO_3732 ?AUTO_3733 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3741 - BLOCK
      ?AUTO_3742 - BLOCK
    )
    :vars
    (
      ?AUTO_3745 - BLOCK
      ?AUTO_3743 - BLOCK
      ?AUTO_3744 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3741 ?AUTO_3742 ) ) ( ON-TABLE ?AUTO_3741 ) ( not ( = ?AUTO_3741 ?AUTO_3745 ) ) ( not ( = ?AUTO_3742 ?AUTO_3745 ) ) ( ON ?AUTO_3745 ?AUTO_3741 ) ( CLEAR ?AUTO_3745 ) ( CLEAR ?AUTO_3743 ) ( not ( = ?AUTO_3741 ?AUTO_3744 ) ) ( not ( = ?AUTO_3741 ?AUTO_3743 ) ) ( not ( = ?AUTO_3742 ?AUTO_3744 ) ) ( not ( = ?AUTO_3742 ?AUTO_3743 ) ) ( not ( = ?AUTO_3745 ?AUTO_3744 ) ) ( not ( = ?AUTO_3745 ?AUTO_3743 ) ) ( not ( = ?AUTO_3744 ?AUTO_3743 ) ) ( ON ?AUTO_3744 ?AUTO_3742 ) ( CLEAR ?AUTO_3744 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3744 ?AUTO_3742 )
      ( MAKE-ON ?AUTO_3741 ?AUTO_3742 )
      ( MAKE-ON-VERIFY ?AUTO_3741 ?AUTO_3742 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3746 - BLOCK
      ?AUTO_3747 - BLOCK
    )
    :vars
    (
      ?AUTO_3750 - BLOCK
      ?AUTO_3749 - BLOCK
      ?AUTO_3748 - BLOCK
      ?AUTO_3751 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3746 ?AUTO_3747 ) ) ( ON-TABLE ?AUTO_3746 ) ( not ( = ?AUTO_3746 ?AUTO_3750 ) ) ( not ( = ?AUTO_3747 ?AUTO_3750 ) ) ( ON ?AUTO_3750 ?AUTO_3746 ) ( CLEAR ?AUTO_3750 ) ( CLEAR ?AUTO_3749 ) ( not ( = ?AUTO_3746 ?AUTO_3748 ) ) ( not ( = ?AUTO_3746 ?AUTO_3749 ) ) ( not ( = ?AUTO_3747 ?AUTO_3748 ) ) ( not ( = ?AUTO_3747 ?AUTO_3749 ) ) ( not ( = ?AUTO_3750 ?AUTO_3748 ) ) ( not ( = ?AUTO_3750 ?AUTO_3749 ) ) ( not ( = ?AUTO_3748 ?AUTO_3749 ) ) ( ON ?AUTO_3748 ?AUTO_3747 ) ( CLEAR ?AUTO_3748 ) ( HOLDING ?AUTO_3751 ) ( not ( = ?AUTO_3746 ?AUTO_3751 ) ) ( not ( = ?AUTO_3747 ?AUTO_3751 ) ) ( not ( = ?AUTO_3750 ?AUTO_3751 ) ) ( not ( = ?AUTO_3749 ?AUTO_3751 ) ) ( not ( = ?AUTO_3748 ?AUTO_3751 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3751 )
      ( MAKE-ON ?AUTO_3746 ?AUTO_3747 )
      ( MAKE-ON-VERIFY ?AUTO_3746 ?AUTO_3747 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3752 - BLOCK
      ?AUTO_3753 - BLOCK
    )
    :vars
    (
      ?AUTO_3756 - BLOCK
      ?AUTO_3755 - BLOCK
      ?AUTO_3754 - BLOCK
      ?AUTO_3757 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3752 ?AUTO_3753 ) ) ( ON-TABLE ?AUTO_3752 ) ( not ( = ?AUTO_3752 ?AUTO_3756 ) ) ( not ( = ?AUTO_3753 ?AUTO_3756 ) ) ( ON ?AUTO_3756 ?AUTO_3752 ) ( CLEAR ?AUTO_3756 ) ( CLEAR ?AUTO_3755 ) ( not ( = ?AUTO_3752 ?AUTO_3754 ) ) ( not ( = ?AUTO_3752 ?AUTO_3755 ) ) ( not ( = ?AUTO_3753 ?AUTO_3754 ) ) ( not ( = ?AUTO_3753 ?AUTO_3755 ) ) ( not ( = ?AUTO_3756 ?AUTO_3754 ) ) ( not ( = ?AUTO_3756 ?AUTO_3755 ) ) ( not ( = ?AUTO_3754 ?AUTO_3755 ) ) ( ON ?AUTO_3754 ?AUTO_3753 ) ( not ( = ?AUTO_3752 ?AUTO_3757 ) ) ( not ( = ?AUTO_3753 ?AUTO_3757 ) ) ( not ( = ?AUTO_3756 ?AUTO_3757 ) ) ( not ( = ?AUTO_3755 ?AUTO_3757 ) ) ( not ( = ?AUTO_3754 ?AUTO_3757 ) ) ( ON ?AUTO_3757 ?AUTO_3754 ) ( CLEAR ?AUTO_3757 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3757 ?AUTO_3754 )
      ( MAKE-ON ?AUTO_3752 ?AUTO_3753 )
      ( MAKE-ON-VERIFY ?AUTO_3752 ?AUTO_3753 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3758 - BLOCK
      ?AUTO_3759 - BLOCK
    )
    :vars
    (
      ?AUTO_3762 - BLOCK
      ?AUTO_3760 - BLOCK
      ?AUTO_3761 - BLOCK
      ?AUTO_3763 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3758 ?AUTO_3759 ) ) ( ON-TABLE ?AUTO_3758 ) ( not ( = ?AUTO_3758 ?AUTO_3762 ) ) ( not ( = ?AUTO_3759 ?AUTO_3762 ) ) ( CLEAR ?AUTO_3760 ) ( not ( = ?AUTO_3758 ?AUTO_3761 ) ) ( not ( = ?AUTO_3758 ?AUTO_3760 ) ) ( not ( = ?AUTO_3759 ?AUTO_3761 ) ) ( not ( = ?AUTO_3759 ?AUTO_3760 ) ) ( not ( = ?AUTO_3762 ?AUTO_3761 ) ) ( not ( = ?AUTO_3762 ?AUTO_3760 ) ) ( not ( = ?AUTO_3761 ?AUTO_3760 ) ) ( ON ?AUTO_3761 ?AUTO_3759 ) ( not ( = ?AUTO_3758 ?AUTO_3763 ) ) ( not ( = ?AUTO_3759 ?AUTO_3763 ) ) ( not ( = ?AUTO_3762 ?AUTO_3763 ) ) ( not ( = ?AUTO_3760 ?AUTO_3763 ) ) ( not ( = ?AUTO_3761 ?AUTO_3763 ) ) ( ON ?AUTO_3763 ?AUTO_3761 ) ( CLEAR ?AUTO_3763 ) ( HOLDING ?AUTO_3762 ) ( CLEAR ?AUTO_3758 ) )
    :subtasks
    ( ( !STACK ?AUTO_3762 ?AUTO_3758 )
      ( MAKE-ON ?AUTO_3758 ?AUTO_3759 )
      ( MAKE-ON-VERIFY ?AUTO_3758 ?AUTO_3759 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3764 - BLOCK
      ?AUTO_3765 - BLOCK
    )
    :vars
    (
      ?AUTO_3767 - BLOCK
      ?AUTO_3766 - BLOCK
      ?AUTO_3769 - BLOCK
      ?AUTO_3768 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3764 ?AUTO_3765 ) ) ( ON-TABLE ?AUTO_3764 ) ( not ( = ?AUTO_3764 ?AUTO_3767 ) ) ( not ( = ?AUTO_3765 ?AUTO_3767 ) ) ( CLEAR ?AUTO_3766 ) ( not ( = ?AUTO_3764 ?AUTO_3769 ) ) ( not ( = ?AUTO_3764 ?AUTO_3766 ) ) ( not ( = ?AUTO_3765 ?AUTO_3769 ) ) ( not ( = ?AUTO_3765 ?AUTO_3766 ) ) ( not ( = ?AUTO_3767 ?AUTO_3769 ) ) ( not ( = ?AUTO_3767 ?AUTO_3766 ) ) ( not ( = ?AUTO_3769 ?AUTO_3766 ) ) ( ON ?AUTO_3769 ?AUTO_3765 ) ( not ( = ?AUTO_3764 ?AUTO_3768 ) ) ( not ( = ?AUTO_3765 ?AUTO_3768 ) ) ( not ( = ?AUTO_3767 ?AUTO_3768 ) ) ( not ( = ?AUTO_3766 ?AUTO_3768 ) ) ( not ( = ?AUTO_3769 ?AUTO_3768 ) ) ( ON ?AUTO_3768 ?AUTO_3769 ) ( CLEAR ?AUTO_3768 ) ( CLEAR ?AUTO_3764 ) ( ON-TABLE ?AUTO_3767 ) ( CLEAR ?AUTO_3767 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_3767 )
      ( MAKE-ON ?AUTO_3764 ?AUTO_3765 )
      ( MAKE-ON-VERIFY ?AUTO_3764 ?AUTO_3765 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3776 - BLOCK
      ?AUTO_3777 - BLOCK
    )
    :vars
    (
      ?AUTO_3778 - BLOCK
      ?AUTO_3781 - BLOCK
      ?AUTO_3780 - BLOCK
      ?AUTO_3779 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3776 ?AUTO_3777 ) ) ( ON-TABLE ?AUTO_3776 ) ( not ( = ?AUTO_3776 ?AUTO_3778 ) ) ( not ( = ?AUTO_3777 ?AUTO_3778 ) ) ( ON ?AUTO_3778 ?AUTO_3776 ) ( CLEAR ?AUTO_3781 ) ( not ( = ?AUTO_3776 ?AUTO_3780 ) ) ( not ( = ?AUTO_3776 ?AUTO_3781 ) ) ( not ( = ?AUTO_3777 ?AUTO_3780 ) ) ( not ( = ?AUTO_3777 ?AUTO_3781 ) ) ( not ( = ?AUTO_3778 ?AUTO_3780 ) ) ( not ( = ?AUTO_3778 ?AUTO_3781 ) ) ( not ( = ?AUTO_3780 ?AUTO_3781 ) ) ( ON ?AUTO_3780 ?AUTO_3777 ) ( CLEAR ?AUTO_3780 ) ( not ( = ?AUTO_3776 ?AUTO_3779 ) ) ( not ( = ?AUTO_3777 ?AUTO_3779 ) ) ( not ( = ?AUTO_3778 ?AUTO_3779 ) ) ( not ( = ?AUTO_3781 ?AUTO_3779 ) ) ( not ( = ?AUTO_3780 ?AUTO_3779 ) ) ( ON ?AUTO_3779 ?AUTO_3778 ) ( CLEAR ?AUTO_3779 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3779 ?AUTO_3778 )
      ( MAKE-ON ?AUTO_3776 ?AUTO_3777 )
      ( MAKE-ON-VERIFY ?AUTO_3776 ?AUTO_3777 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3782 - BLOCK
      ?AUTO_3783 - BLOCK
    )
    :vars
    (
      ?AUTO_3784 - BLOCK
      ?AUTO_3786 - BLOCK
      ?AUTO_3787 - BLOCK
      ?AUTO_3785 - BLOCK
      ?AUTO_3788 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3782 ?AUTO_3783 ) ) ( ON-TABLE ?AUTO_3782 ) ( not ( = ?AUTO_3782 ?AUTO_3784 ) ) ( not ( = ?AUTO_3783 ?AUTO_3784 ) ) ( ON ?AUTO_3784 ?AUTO_3782 ) ( CLEAR ?AUTO_3786 ) ( not ( = ?AUTO_3782 ?AUTO_3787 ) ) ( not ( = ?AUTO_3782 ?AUTO_3786 ) ) ( not ( = ?AUTO_3783 ?AUTO_3787 ) ) ( not ( = ?AUTO_3783 ?AUTO_3786 ) ) ( not ( = ?AUTO_3784 ?AUTO_3787 ) ) ( not ( = ?AUTO_3784 ?AUTO_3786 ) ) ( not ( = ?AUTO_3787 ?AUTO_3786 ) ) ( ON ?AUTO_3787 ?AUTO_3783 ) ( CLEAR ?AUTO_3787 ) ( not ( = ?AUTO_3782 ?AUTO_3785 ) ) ( not ( = ?AUTO_3783 ?AUTO_3785 ) ) ( not ( = ?AUTO_3784 ?AUTO_3785 ) ) ( not ( = ?AUTO_3786 ?AUTO_3785 ) ) ( not ( = ?AUTO_3787 ?AUTO_3785 ) ) ( ON ?AUTO_3785 ?AUTO_3784 ) ( CLEAR ?AUTO_3785 ) ( HOLDING ?AUTO_3788 ) ( not ( = ?AUTO_3782 ?AUTO_3788 ) ) ( not ( = ?AUTO_3783 ?AUTO_3788 ) ) ( not ( = ?AUTO_3784 ?AUTO_3788 ) ) ( not ( = ?AUTO_3786 ?AUTO_3788 ) ) ( not ( = ?AUTO_3787 ?AUTO_3788 ) ) ( not ( = ?AUTO_3785 ?AUTO_3788 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3788 )
      ( MAKE-ON ?AUTO_3782 ?AUTO_3783 )
      ( MAKE-ON-VERIFY ?AUTO_3782 ?AUTO_3783 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3789 - BLOCK
      ?AUTO_3790 - BLOCK
    )
    :vars
    (
      ?AUTO_3792 - BLOCK
      ?AUTO_3794 - BLOCK
      ?AUTO_3793 - BLOCK
      ?AUTO_3791 - BLOCK
      ?AUTO_3795 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3789 ?AUTO_3790 ) ) ( ON-TABLE ?AUTO_3789 ) ( not ( = ?AUTO_3789 ?AUTO_3792 ) ) ( not ( = ?AUTO_3790 ?AUTO_3792 ) ) ( ON ?AUTO_3792 ?AUTO_3789 ) ( CLEAR ?AUTO_3794 ) ( not ( = ?AUTO_3789 ?AUTO_3793 ) ) ( not ( = ?AUTO_3789 ?AUTO_3794 ) ) ( not ( = ?AUTO_3790 ?AUTO_3793 ) ) ( not ( = ?AUTO_3790 ?AUTO_3794 ) ) ( not ( = ?AUTO_3792 ?AUTO_3793 ) ) ( not ( = ?AUTO_3792 ?AUTO_3794 ) ) ( not ( = ?AUTO_3793 ?AUTO_3794 ) ) ( ON ?AUTO_3793 ?AUTO_3790 ) ( CLEAR ?AUTO_3793 ) ( not ( = ?AUTO_3789 ?AUTO_3791 ) ) ( not ( = ?AUTO_3790 ?AUTO_3791 ) ) ( not ( = ?AUTO_3792 ?AUTO_3791 ) ) ( not ( = ?AUTO_3794 ?AUTO_3791 ) ) ( not ( = ?AUTO_3793 ?AUTO_3791 ) ) ( ON ?AUTO_3791 ?AUTO_3792 ) ( not ( = ?AUTO_3789 ?AUTO_3795 ) ) ( not ( = ?AUTO_3790 ?AUTO_3795 ) ) ( not ( = ?AUTO_3792 ?AUTO_3795 ) ) ( not ( = ?AUTO_3794 ?AUTO_3795 ) ) ( not ( = ?AUTO_3793 ?AUTO_3795 ) ) ( not ( = ?AUTO_3791 ?AUTO_3795 ) ) ( ON ?AUTO_3795 ?AUTO_3791 ) ( CLEAR ?AUTO_3795 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3795 ?AUTO_3791 )
      ( MAKE-ON ?AUTO_3789 ?AUTO_3790 )
      ( MAKE-ON-VERIFY ?AUTO_3789 ?AUTO_3790 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3796 - BLOCK
      ?AUTO_3797 - BLOCK
    )
    :vars
    (
      ?AUTO_3798 - BLOCK
      ?AUTO_3802 - BLOCK
      ?AUTO_3800 - BLOCK
      ?AUTO_3799 - BLOCK
      ?AUTO_3801 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3796 ?AUTO_3797 ) ) ( ON-TABLE ?AUTO_3796 ) ( not ( = ?AUTO_3796 ?AUTO_3798 ) ) ( not ( = ?AUTO_3797 ?AUTO_3798 ) ) ( ON ?AUTO_3798 ?AUTO_3796 ) ( CLEAR ?AUTO_3802 ) ( not ( = ?AUTO_3796 ?AUTO_3800 ) ) ( not ( = ?AUTO_3796 ?AUTO_3802 ) ) ( not ( = ?AUTO_3797 ?AUTO_3800 ) ) ( not ( = ?AUTO_3797 ?AUTO_3802 ) ) ( not ( = ?AUTO_3798 ?AUTO_3800 ) ) ( not ( = ?AUTO_3798 ?AUTO_3802 ) ) ( not ( = ?AUTO_3800 ?AUTO_3802 ) ) ( not ( = ?AUTO_3796 ?AUTO_3799 ) ) ( not ( = ?AUTO_3797 ?AUTO_3799 ) ) ( not ( = ?AUTO_3798 ?AUTO_3799 ) ) ( not ( = ?AUTO_3802 ?AUTO_3799 ) ) ( not ( = ?AUTO_3800 ?AUTO_3799 ) ) ( ON ?AUTO_3799 ?AUTO_3798 ) ( not ( = ?AUTO_3796 ?AUTO_3801 ) ) ( not ( = ?AUTO_3797 ?AUTO_3801 ) ) ( not ( = ?AUTO_3798 ?AUTO_3801 ) ) ( not ( = ?AUTO_3802 ?AUTO_3801 ) ) ( not ( = ?AUTO_3800 ?AUTO_3801 ) ) ( not ( = ?AUTO_3799 ?AUTO_3801 ) ) ( ON ?AUTO_3801 ?AUTO_3799 ) ( CLEAR ?AUTO_3801 ) ( HOLDING ?AUTO_3800 ) ( CLEAR ?AUTO_3797 ) )
    :subtasks
    ( ( !STACK ?AUTO_3800 ?AUTO_3797 )
      ( MAKE-ON ?AUTO_3796 ?AUTO_3797 )
      ( MAKE-ON-VERIFY ?AUTO_3796 ?AUTO_3797 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3803 - BLOCK
      ?AUTO_3804 - BLOCK
    )
    :vars
    (
      ?AUTO_3805 - BLOCK
      ?AUTO_3807 - BLOCK
      ?AUTO_3809 - BLOCK
      ?AUTO_3808 - BLOCK
      ?AUTO_3806 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3803 ?AUTO_3804 ) ) ( ON-TABLE ?AUTO_3803 ) ( not ( = ?AUTO_3803 ?AUTO_3805 ) ) ( not ( = ?AUTO_3804 ?AUTO_3805 ) ) ( ON ?AUTO_3805 ?AUTO_3803 ) ( CLEAR ?AUTO_3807 ) ( not ( = ?AUTO_3803 ?AUTO_3809 ) ) ( not ( = ?AUTO_3803 ?AUTO_3807 ) ) ( not ( = ?AUTO_3804 ?AUTO_3809 ) ) ( not ( = ?AUTO_3804 ?AUTO_3807 ) ) ( not ( = ?AUTO_3805 ?AUTO_3809 ) ) ( not ( = ?AUTO_3805 ?AUTO_3807 ) ) ( not ( = ?AUTO_3809 ?AUTO_3807 ) ) ( not ( = ?AUTO_3803 ?AUTO_3808 ) ) ( not ( = ?AUTO_3804 ?AUTO_3808 ) ) ( not ( = ?AUTO_3805 ?AUTO_3808 ) ) ( not ( = ?AUTO_3807 ?AUTO_3808 ) ) ( not ( = ?AUTO_3809 ?AUTO_3808 ) ) ( ON ?AUTO_3808 ?AUTO_3805 ) ( not ( = ?AUTO_3803 ?AUTO_3806 ) ) ( not ( = ?AUTO_3804 ?AUTO_3806 ) ) ( not ( = ?AUTO_3805 ?AUTO_3806 ) ) ( not ( = ?AUTO_3807 ?AUTO_3806 ) ) ( not ( = ?AUTO_3809 ?AUTO_3806 ) ) ( not ( = ?AUTO_3808 ?AUTO_3806 ) ) ( ON ?AUTO_3806 ?AUTO_3808 ) ( CLEAR ?AUTO_3804 ) ( ON ?AUTO_3809 ?AUTO_3806 ) ( CLEAR ?AUTO_3809 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3809 ?AUTO_3806 )
      ( MAKE-ON ?AUTO_3803 ?AUTO_3804 )
      ( MAKE-ON-VERIFY ?AUTO_3803 ?AUTO_3804 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3810 - BLOCK
      ?AUTO_3811 - BLOCK
    )
    :vars
    (
      ?AUTO_3813 - BLOCK
      ?AUTO_3814 - BLOCK
      ?AUTO_3815 - BLOCK
      ?AUTO_3816 - BLOCK
      ?AUTO_3812 - BLOCK
      ?AUTO_3817 - BLOCK
      ?AUTO_3818 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3810 ?AUTO_3811 ) ) ( ON-TABLE ?AUTO_3810 ) ( not ( = ?AUTO_3810 ?AUTO_3813 ) ) ( not ( = ?AUTO_3811 ?AUTO_3813 ) ) ( ON ?AUTO_3813 ?AUTO_3810 ) ( CLEAR ?AUTO_3814 ) ( not ( = ?AUTO_3810 ?AUTO_3815 ) ) ( not ( = ?AUTO_3810 ?AUTO_3814 ) ) ( not ( = ?AUTO_3811 ?AUTO_3815 ) ) ( not ( = ?AUTO_3811 ?AUTO_3814 ) ) ( not ( = ?AUTO_3813 ?AUTO_3815 ) ) ( not ( = ?AUTO_3813 ?AUTO_3814 ) ) ( not ( = ?AUTO_3815 ?AUTO_3814 ) ) ( not ( = ?AUTO_3810 ?AUTO_3816 ) ) ( not ( = ?AUTO_3811 ?AUTO_3816 ) ) ( not ( = ?AUTO_3813 ?AUTO_3816 ) ) ( not ( = ?AUTO_3814 ?AUTO_3816 ) ) ( not ( = ?AUTO_3815 ?AUTO_3816 ) ) ( ON ?AUTO_3816 ?AUTO_3813 ) ( not ( = ?AUTO_3810 ?AUTO_3812 ) ) ( not ( = ?AUTO_3811 ?AUTO_3812 ) ) ( not ( = ?AUTO_3813 ?AUTO_3812 ) ) ( not ( = ?AUTO_3814 ?AUTO_3812 ) ) ( not ( = ?AUTO_3815 ?AUTO_3812 ) ) ( not ( = ?AUTO_3816 ?AUTO_3812 ) ) ( ON ?AUTO_3812 ?AUTO_3816 ) ( CLEAR ?AUTO_3811 ) ( ON ?AUTO_3815 ?AUTO_3812 ) ( CLEAR ?AUTO_3815 ) ( HOLDING ?AUTO_3817 ) ( CLEAR ?AUTO_3818 ) ( not ( = ?AUTO_3810 ?AUTO_3817 ) ) ( not ( = ?AUTO_3810 ?AUTO_3818 ) ) ( not ( = ?AUTO_3811 ?AUTO_3817 ) ) ( not ( = ?AUTO_3811 ?AUTO_3818 ) ) ( not ( = ?AUTO_3813 ?AUTO_3817 ) ) ( not ( = ?AUTO_3813 ?AUTO_3818 ) ) ( not ( = ?AUTO_3814 ?AUTO_3817 ) ) ( not ( = ?AUTO_3814 ?AUTO_3818 ) ) ( not ( = ?AUTO_3815 ?AUTO_3817 ) ) ( not ( = ?AUTO_3815 ?AUTO_3818 ) ) ( not ( = ?AUTO_3816 ?AUTO_3817 ) ) ( not ( = ?AUTO_3816 ?AUTO_3818 ) ) ( not ( = ?AUTO_3812 ?AUTO_3817 ) ) ( not ( = ?AUTO_3812 ?AUTO_3818 ) ) ( not ( = ?AUTO_3817 ?AUTO_3818 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3817 ?AUTO_3818 )
      ( MAKE-ON ?AUTO_3810 ?AUTO_3811 )
      ( MAKE-ON-VERIFY ?AUTO_3810 ?AUTO_3811 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3821 - BLOCK
      ?AUTO_3822 - BLOCK
    )
    :vars
    (
      ?AUTO_3827 - BLOCK
      ?AUTO_3825 - BLOCK
      ?AUTO_3826 - BLOCK
      ?AUTO_3824 - BLOCK
      ?AUTO_3823 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3821 ?AUTO_3822 ) ) ( ON-TABLE ?AUTO_3821 ) ( not ( = ?AUTO_3821 ?AUTO_3827 ) ) ( not ( = ?AUTO_3822 ?AUTO_3827 ) ) ( ON ?AUTO_3827 ?AUTO_3821 ) ( CLEAR ?AUTO_3825 ) ( not ( = ?AUTO_3821 ?AUTO_3826 ) ) ( not ( = ?AUTO_3821 ?AUTO_3825 ) ) ( not ( = ?AUTO_3822 ?AUTO_3826 ) ) ( not ( = ?AUTO_3822 ?AUTO_3825 ) ) ( not ( = ?AUTO_3827 ?AUTO_3826 ) ) ( not ( = ?AUTO_3827 ?AUTO_3825 ) ) ( not ( = ?AUTO_3826 ?AUTO_3825 ) ) ( not ( = ?AUTO_3821 ?AUTO_3824 ) ) ( not ( = ?AUTO_3822 ?AUTO_3824 ) ) ( not ( = ?AUTO_3827 ?AUTO_3824 ) ) ( not ( = ?AUTO_3825 ?AUTO_3824 ) ) ( not ( = ?AUTO_3826 ?AUTO_3824 ) ) ( ON ?AUTO_3824 ?AUTO_3827 ) ( not ( = ?AUTO_3821 ?AUTO_3823 ) ) ( not ( = ?AUTO_3822 ?AUTO_3823 ) ) ( not ( = ?AUTO_3827 ?AUTO_3823 ) ) ( not ( = ?AUTO_3825 ?AUTO_3823 ) ) ( not ( = ?AUTO_3826 ?AUTO_3823 ) ) ( not ( = ?AUTO_3824 ?AUTO_3823 ) ) ( ON ?AUTO_3823 ?AUTO_3824 ) ( ON ?AUTO_3826 ?AUTO_3823 ) ( CLEAR ?AUTO_3826 ) ( HOLDING ?AUTO_3822 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3822 )
      ( MAKE-ON ?AUTO_3821 ?AUTO_3822 )
      ( MAKE-ON-VERIFY ?AUTO_3821 ?AUTO_3822 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3830 - BLOCK
      ?AUTO_3831 - BLOCK
    )
    :vars
    (
      ?AUTO_3832 - BLOCK
      ?AUTO_3834 - BLOCK
      ?AUTO_3833 - BLOCK
      ?AUTO_3835 - BLOCK
      ?AUTO_3836 - BLOCK
      ?AUTO_3837 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3830 ?AUTO_3831 ) ) ( ON-TABLE ?AUTO_3830 ) ( not ( = ?AUTO_3830 ?AUTO_3832 ) ) ( not ( = ?AUTO_3831 ?AUTO_3832 ) ) ( ON ?AUTO_3832 ?AUTO_3830 ) ( CLEAR ?AUTO_3834 ) ( not ( = ?AUTO_3830 ?AUTO_3833 ) ) ( not ( = ?AUTO_3830 ?AUTO_3834 ) ) ( not ( = ?AUTO_3831 ?AUTO_3833 ) ) ( not ( = ?AUTO_3831 ?AUTO_3834 ) ) ( not ( = ?AUTO_3832 ?AUTO_3833 ) ) ( not ( = ?AUTO_3832 ?AUTO_3834 ) ) ( not ( = ?AUTO_3833 ?AUTO_3834 ) ) ( not ( = ?AUTO_3830 ?AUTO_3835 ) ) ( not ( = ?AUTO_3831 ?AUTO_3835 ) ) ( not ( = ?AUTO_3832 ?AUTO_3835 ) ) ( not ( = ?AUTO_3834 ?AUTO_3835 ) ) ( not ( = ?AUTO_3833 ?AUTO_3835 ) ) ( ON ?AUTO_3835 ?AUTO_3832 ) ( not ( = ?AUTO_3830 ?AUTO_3836 ) ) ( not ( = ?AUTO_3831 ?AUTO_3836 ) ) ( not ( = ?AUTO_3832 ?AUTO_3836 ) ) ( not ( = ?AUTO_3834 ?AUTO_3836 ) ) ( not ( = ?AUTO_3833 ?AUTO_3836 ) ) ( not ( = ?AUTO_3835 ?AUTO_3836 ) ) ( ON ?AUTO_3836 ?AUTO_3835 ) ( CLEAR ?AUTO_3831 ) ( ON ?AUTO_3833 ?AUTO_3836 ) ( CLEAR ?AUTO_3833 ) ( HOLDING ?AUTO_3837 ) ( not ( = ?AUTO_3830 ?AUTO_3837 ) ) ( not ( = ?AUTO_3831 ?AUTO_3837 ) ) ( not ( = ?AUTO_3832 ?AUTO_3837 ) ) ( not ( = ?AUTO_3834 ?AUTO_3837 ) ) ( not ( = ?AUTO_3833 ?AUTO_3837 ) ) ( not ( = ?AUTO_3835 ?AUTO_3837 ) ) ( not ( = ?AUTO_3836 ?AUTO_3837 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3837 )
      ( MAKE-ON ?AUTO_3830 ?AUTO_3831 )
      ( MAKE-ON-VERIFY ?AUTO_3830 ?AUTO_3831 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3838 - BLOCK
      ?AUTO_3839 - BLOCK
    )
    :vars
    (
      ?AUTO_3842 - BLOCK
      ?AUTO_3840 - BLOCK
      ?AUTO_3841 - BLOCK
      ?AUTO_3843 - BLOCK
      ?AUTO_3844 - BLOCK
      ?AUTO_3845 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3838 ?AUTO_3839 ) ) ( ON-TABLE ?AUTO_3838 ) ( not ( = ?AUTO_3838 ?AUTO_3842 ) ) ( not ( = ?AUTO_3839 ?AUTO_3842 ) ) ( ON ?AUTO_3842 ?AUTO_3838 ) ( CLEAR ?AUTO_3840 ) ( not ( = ?AUTO_3838 ?AUTO_3841 ) ) ( not ( = ?AUTO_3838 ?AUTO_3840 ) ) ( not ( = ?AUTO_3839 ?AUTO_3841 ) ) ( not ( = ?AUTO_3839 ?AUTO_3840 ) ) ( not ( = ?AUTO_3842 ?AUTO_3841 ) ) ( not ( = ?AUTO_3842 ?AUTO_3840 ) ) ( not ( = ?AUTO_3841 ?AUTO_3840 ) ) ( not ( = ?AUTO_3838 ?AUTO_3843 ) ) ( not ( = ?AUTO_3839 ?AUTO_3843 ) ) ( not ( = ?AUTO_3842 ?AUTO_3843 ) ) ( not ( = ?AUTO_3840 ?AUTO_3843 ) ) ( not ( = ?AUTO_3841 ?AUTO_3843 ) ) ( ON ?AUTO_3843 ?AUTO_3842 ) ( not ( = ?AUTO_3838 ?AUTO_3844 ) ) ( not ( = ?AUTO_3839 ?AUTO_3844 ) ) ( not ( = ?AUTO_3842 ?AUTO_3844 ) ) ( not ( = ?AUTO_3840 ?AUTO_3844 ) ) ( not ( = ?AUTO_3841 ?AUTO_3844 ) ) ( not ( = ?AUTO_3843 ?AUTO_3844 ) ) ( ON ?AUTO_3844 ?AUTO_3843 ) ( ON ?AUTO_3841 ?AUTO_3844 ) ( CLEAR ?AUTO_3841 ) ( not ( = ?AUTO_3838 ?AUTO_3845 ) ) ( not ( = ?AUTO_3839 ?AUTO_3845 ) ) ( not ( = ?AUTO_3842 ?AUTO_3845 ) ) ( not ( = ?AUTO_3840 ?AUTO_3845 ) ) ( not ( = ?AUTO_3841 ?AUTO_3845 ) ) ( not ( = ?AUTO_3843 ?AUTO_3845 ) ) ( not ( = ?AUTO_3844 ?AUTO_3845 ) ) ( ON ?AUTO_3845 ?AUTO_3839 ) ( CLEAR ?AUTO_3845 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3845 ?AUTO_3839 )
      ( MAKE-ON ?AUTO_3838 ?AUTO_3839 )
      ( MAKE-ON-VERIFY ?AUTO_3838 ?AUTO_3839 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3846 - BLOCK
      ?AUTO_3847 - BLOCK
    )
    :vars
    (
      ?AUTO_3848 - BLOCK
      ?AUTO_3851 - BLOCK
      ?AUTO_3853 - BLOCK
      ?AUTO_3852 - BLOCK
      ?AUTO_3849 - BLOCK
      ?AUTO_3850 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3846 ?AUTO_3847 ) ) ( ON-TABLE ?AUTO_3846 ) ( not ( = ?AUTO_3846 ?AUTO_3848 ) ) ( not ( = ?AUTO_3847 ?AUTO_3848 ) ) ( ON ?AUTO_3848 ?AUTO_3846 ) ( not ( = ?AUTO_3846 ?AUTO_3851 ) ) ( not ( = ?AUTO_3846 ?AUTO_3853 ) ) ( not ( = ?AUTO_3847 ?AUTO_3851 ) ) ( not ( = ?AUTO_3847 ?AUTO_3853 ) ) ( not ( = ?AUTO_3848 ?AUTO_3851 ) ) ( not ( = ?AUTO_3848 ?AUTO_3853 ) ) ( not ( = ?AUTO_3851 ?AUTO_3853 ) ) ( not ( = ?AUTO_3846 ?AUTO_3852 ) ) ( not ( = ?AUTO_3847 ?AUTO_3852 ) ) ( not ( = ?AUTO_3848 ?AUTO_3852 ) ) ( not ( = ?AUTO_3853 ?AUTO_3852 ) ) ( not ( = ?AUTO_3851 ?AUTO_3852 ) ) ( ON ?AUTO_3852 ?AUTO_3848 ) ( not ( = ?AUTO_3846 ?AUTO_3849 ) ) ( not ( = ?AUTO_3847 ?AUTO_3849 ) ) ( not ( = ?AUTO_3848 ?AUTO_3849 ) ) ( not ( = ?AUTO_3853 ?AUTO_3849 ) ) ( not ( = ?AUTO_3851 ?AUTO_3849 ) ) ( not ( = ?AUTO_3852 ?AUTO_3849 ) ) ( ON ?AUTO_3849 ?AUTO_3852 ) ( ON ?AUTO_3851 ?AUTO_3849 ) ( CLEAR ?AUTO_3851 ) ( not ( = ?AUTO_3846 ?AUTO_3850 ) ) ( not ( = ?AUTO_3847 ?AUTO_3850 ) ) ( not ( = ?AUTO_3848 ?AUTO_3850 ) ) ( not ( = ?AUTO_3853 ?AUTO_3850 ) ) ( not ( = ?AUTO_3851 ?AUTO_3850 ) ) ( not ( = ?AUTO_3852 ?AUTO_3850 ) ) ( not ( = ?AUTO_3849 ?AUTO_3850 ) ) ( ON ?AUTO_3850 ?AUTO_3847 ) ( CLEAR ?AUTO_3850 ) ( HOLDING ?AUTO_3853 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3853 )
      ( MAKE-ON ?AUTO_3846 ?AUTO_3847 )
      ( MAKE-ON-VERIFY ?AUTO_3846 ?AUTO_3847 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3854 - BLOCK
      ?AUTO_3855 - BLOCK
    )
    :vars
    (
      ?AUTO_3857 - BLOCK
      ?AUTO_3858 - BLOCK
      ?AUTO_3860 - BLOCK
      ?AUTO_3859 - BLOCK
      ?AUTO_3856 - BLOCK
      ?AUTO_3861 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3854 ?AUTO_3855 ) ) ( ON-TABLE ?AUTO_3854 ) ( not ( = ?AUTO_3854 ?AUTO_3857 ) ) ( not ( = ?AUTO_3855 ?AUTO_3857 ) ) ( ON ?AUTO_3857 ?AUTO_3854 ) ( not ( = ?AUTO_3854 ?AUTO_3858 ) ) ( not ( = ?AUTO_3854 ?AUTO_3860 ) ) ( not ( = ?AUTO_3855 ?AUTO_3858 ) ) ( not ( = ?AUTO_3855 ?AUTO_3860 ) ) ( not ( = ?AUTO_3857 ?AUTO_3858 ) ) ( not ( = ?AUTO_3857 ?AUTO_3860 ) ) ( not ( = ?AUTO_3858 ?AUTO_3860 ) ) ( not ( = ?AUTO_3854 ?AUTO_3859 ) ) ( not ( = ?AUTO_3855 ?AUTO_3859 ) ) ( not ( = ?AUTO_3857 ?AUTO_3859 ) ) ( not ( = ?AUTO_3860 ?AUTO_3859 ) ) ( not ( = ?AUTO_3858 ?AUTO_3859 ) ) ( ON ?AUTO_3859 ?AUTO_3857 ) ( not ( = ?AUTO_3854 ?AUTO_3856 ) ) ( not ( = ?AUTO_3855 ?AUTO_3856 ) ) ( not ( = ?AUTO_3857 ?AUTO_3856 ) ) ( not ( = ?AUTO_3860 ?AUTO_3856 ) ) ( not ( = ?AUTO_3858 ?AUTO_3856 ) ) ( not ( = ?AUTO_3859 ?AUTO_3856 ) ) ( ON ?AUTO_3856 ?AUTO_3859 ) ( ON ?AUTO_3858 ?AUTO_3856 ) ( CLEAR ?AUTO_3858 ) ( not ( = ?AUTO_3854 ?AUTO_3861 ) ) ( not ( = ?AUTO_3855 ?AUTO_3861 ) ) ( not ( = ?AUTO_3857 ?AUTO_3861 ) ) ( not ( = ?AUTO_3860 ?AUTO_3861 ) ) ( not ( = ?AUTO_3858 ?AUTO_3861 ) ) ( not ( = ?AUTO_3859 ?AUTO_3861 ) ) ( not ( = ?AUTO_3856 ?AUTO_3861 ) ) ( ON ?AUTO_3861 ?AUTO_3855 ) ( ON ?AUTO_3860 ?AUTO_3861 ) ( CLEAR ?AUTO_3860 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3860 ?AUTO_3861 )
      ( MAKE-ON ?AUTO_3854 ?AUTO_3855 )
      ( MAKE-ON-VERIFY ?AUTO_3854 ?AUTO_3855 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3864 - BLOCK
      ?AUTO_3865 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3864 ) ( CLEAR ?AUTO_3865 ) ( not ( = ?AUTO_3864 ?AUTO_3865 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3864 ?AUTO_3865 )
      ( MAKE-ON-VERIFY ?AUTO_3864 ?AUTO_3865 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3866 - BLOCK
      ?AUTO_3867 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3867 ) ( not ( = ?AUTO_3866 ?AUTO_3867 ) ) ( ON-TABLE ?AUTO_3866 ) ( CLEAR ?AUTO_3866 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_3866 )
      ( MAKE-ON ?AUTO_3866 ?AUTO_3867 )
      ( MAKE-ON-VERIFY ?AUTO_3866 ?AUTO_3867 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3868 - BLOCK
      ?AUTO_3869 - BLOCK
    )
    :vars
    (
      ?AUTO_3870 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3868 ?AUTO_3869 ) ) ( ON-TABLE ?AUTO_3868 ) ( CLEAR ?AUTO_3868 ) ( HOLDING ?AUTO_3869 ) ( CLEAR ?AUTO_3870 ) ( not ( = ?AUTO_3868 ?AUTO_3870 ) ) ( not ( = ?AUTO_3869 ?AUTO_3870 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3869 ?AUTO_3870 )
      ( MAKE-ON ?AUTO_3868 ?AUTO_3869 )
      ( MAKE-ON-VERIFY ?AUTO_3868 ?AUTO_3869 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3872 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3872 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3872 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3872 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3873 - BLOCK
    )
    :vars
    (
      ?AUTO_3874 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3873 ?AUTO_3874 ) ( CLEAR ?AUTO_3873 ) ( HAND-EMPTY ) ( not ( = ?AUTO_3873 ?AUTO_3874 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3873 ?AUTO_3874 )
      ( MAKE-ON-TABLE ?AUTO_3873 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3873 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3877 - BLOCK
      ?AUTO_3878 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3877 ) ( CLEAR ?AUTO_3878 ) ( not ( = ?AUTO_3877 ?AUTO_3878 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3877 ?AUTO_3878 )
      ( MAKE-ON-VERIFY ?AUTO_3877 ?AUTO_3878 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3879 - BLOCK
      ?AUTO_3880 - BLOCK
    )
    :vars
    (
      ?AUTO_3881 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3880 ) ( not ( = ?AUTO_3879 ?AUTO_3880 ) ) ( ON ?AUTO_3879 ?AUTO_3881 ) ( CLEAR ?AUTO_3879 ) ( HAND-EMPTY ) ( not ( = ?AUTO_3879 ?AUTO_3881 ) ) ( not ( = ?AUTO_3880 ?AUTO_3881 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3879 ?AUTO_3881 )
      ( MAKE-ON ?AUTO_3879 ?AUTO_3880 )
      ( MAKE-ON-VERIFY ?AUTO_3879 ?AUTO_3880 ) )
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
    )
    :precondition
    ( and ( not ( = ?AUTO_3882 ?AUTO_3883 ) ) ( ON ?AUTO_3882 ?AUTO_3884 ) ( CLEAR ?AUTO_3882 ) ( not ( = ?AUTO_3882 ?AUTO_3884 ) ) ( not ( = ?AUTO_3883 ?AUTO_3884 ) ) ( HOLDING ?AUTO_3883 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3883 )
      ( MAKE-ON ?AUTO_3882 ?AUTO_3883 )
      ( MAKE-ON-VERIFY ?AUTO_3882 ?AUTO_3883 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3888 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3888 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3888 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3888 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3889 - BLOCK
    )
    :vars
    (
      ?AUTO_3890 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3889 ?AUTO_3890 ) ( CLEAR ?AUTO_3889 ) ( HAND-EMPTY ) ( not ( = ?AUTO_3889 ?AUTO_3890 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3889 ?AUTO_3890 )
      ( MAKE-ON-TABLE ?AUTO_3889 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3889 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3891 - BLOCK
    )
    :vars
    (
      ?AUTO_3892 - BLOCK
      ?AUTO_3893 - BLOCK
      ?AUTO_3894 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3891 ?AUTO_3892 ) ( CLEAR ?AUTO_3891 ) ( not ( = ?AUTO_3891 ?AUTO_3892 ) ) ( HOLDING ?AUTO_3893 ) ( CLEAR ?AUTO_3894 ) ( not ( = ?AUTO_3891 ?AUTO_3893 ) ) ( not ( = ?AUTO_3891 ?AUTO_3894 ) ) ( not ( = ?AUTO_3892 ?AUTO_3893 ) ) ( not ( = ?AUTO_3892 ?AUTO_3894 ) ) ( not ( = ?AUTO_3893 ?AUTO_3894 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3893 ?AUTO_3894 )
      ( MAKE-ON-TABLE ?AUTO_3891 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3891 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3895 - BLOCK
    )
    :vars
    (
      ?AUTO_3896 - BLOCK
      ?AUTO_3898 - BLOCK
      ?AUTO_3897 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3895 ?AUTO_3896 ) ( not ( = ?AUTO_3895 ?AUTO_3896 ) ) ( CLEAR ?AUTO_3898 ) ( not ( = ?AUTO_3895 ?AUTO_3897 ) ) ( not ( = ?AUTO_3895 ?AUTO_3898 ) ) ( not ( = ?AUTO_3896 ?AUTO_3897 ) ) ( not ( = ?AUTO_3896 ?AUTO_3898 ) ) ( not ( = ?AUTO_3897 ?AUTO_3898 ) ) ( ON ?AUTO_3897 ?AUTO_3895 ) ( CLEAR ?AUTO_3897 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3897 ?AUTO_3895 )
      ( MAKE-ON-TABLE ?AUTO_3895 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3895 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3899 - BLOCK
    )
    :vars
    (
      ?AUTO_3900 - BLOCK
      ?AUTO_3901 - BLOCK
      ?AUTO_3902 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3899 ?AUTO_3900 ) ( not ( = ?AUTO_3899 ?AUTO_3900 ) ) ( not ( = ?AUTO_3899 ?AUTO_3901 ) ) ( not ( = ?AUTO_3899 ?AUTO_3902 ) ) ( not ( = ?AUTO_3900 ?AUTO_3901 ) ) ( not ( = ?AUTO_3900 ?AUTO_3902 ) ) ( not ( = ?AUTO_3901 ?AUTO_3902 ) ) ( ON ?AUTO_3901 ?AUTO_3899 ) ( CLEAR ?AUTO_3901 ) ( HOLDING ?AUTO_3902 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3902 )
      ( MAKE-ON-TABLE ?AUTO_3899 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3899 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3906 - BLOCK
      ?AUTO_3907 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3906 ) ( CLEAR ?AUTO_3907 ) ( not ( = ?AUTO_3906 ?AUTO_3907 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3906 ?AUTO_3907 )
      ( MAKE-ON-VERIFY ?AUTO_3906 ?AUTO_3907 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3908 - BLOCK
      ?AUTO_3909 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3909 ) ( not ( = ?AUTO_3908 ?AUTO_3909 ) ) ( ON-TABLE ?AUTO_3908 ) ( CLEAR ?AUTO_3908 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_3908 )
      ( MAKE-ON ?AUTO_3908 ?AUTO_3909 )
      ( MAKE-ON-VERIFY ?AUTO_3908 ?AUTO_3909 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3910 - BLOCK
      ?AUTO_3911 - BLOCK
    )
    :vars
    (
      ?AUTO_3912 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3911 ) ( not ( = ?AUTO_3910 ?AUTO_3911 ) ) ( ON-TABLE ?AUTO_3910 ) ( CLEAR ?AUTO_3910 ) ( HOLDING ?AUTO_3912 ) ( not ( = ?AUTO_3910 ?AUTO_3912 ) ) ( not ( = ?AUTO_3911 ?AUTO_3912 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3912 )
      ( MAKE-ON ?AUTO_3910 ?AUTO_3911 )
      ( MAKE-ON-VERIFY ?AUTO_3910 ?AUTO_3911 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3913 - BLOCK
      ?AUTO_3914 - BLOCK
    )
    :vars
    (
      ?AUTO_3915 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3914 ) ( not ( = ?AUTO_3913 ?AUTO_3914 ) ) ( ON-TABLE ?AUTO_3913 ) ( not ( = ?AUTO_3913 ?AUTO_3915 ) ) ( not ( = ?AUTO_3914 ?AUTO_3915 ) ) ( ON ?AUTO_3915 ?AUTO_3913 ) ( CLEAR ?AUTO_3915 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3915 ?AUTO_3913 )
      ( MAKE-ON ?AUTO_3913 ?AUTO_3914 )
      ( MAKE-ON-VERIFY ?AUTO_3913 ?AUTO_3914 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3916 - BLOCK
      ?AUTO_3917 - BLOCK
    )
    :vars
    (
      ?AUTO_3918 - BLOCK
      ?AUTO_3919 - BLOCK
      ?AUTO_3920 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3917 ) ( not ( = ?AUTO_3916 ?AUTO_3917 ) ) ( ON-TABLE ?AUTO_3916 ) ( not ( = ?AUTO_3916 ?AUTO_3918 ) ) ( not ( = ?AUTO_3917 ?AUTO_3918 ) ) ( ON ?AUTO_3918 ?AUTO_3916 ) ( CLEAR ?AUTO_3918 ) ( HOLDING ?AUTO_3919 ) ( CLEAR ?AUTO_3920 ) ( not ( = ?AUTO_3916 ?AUTO_3919 ) ) ( not ( = ?AUTO_3916 ?AUTO_3920 ) ) ( not ( = ?AUTO_3917 ?AUTO_3919 ) ) ( not ( = ?AUTO_3917 ?AUTO_3920 ) ) ( not ( = ?AUTO_3918 ?AUTO_3919 ) ) ( not ( = ?AUTO_3918 ?AUTO_3920 ) ) ( not ( = ?AUTO_3919 ?AUTO_3920 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3919 ?AUTO_3920 )
      ( MAKE-ON ?AUTO_3916 ?AUTO_3917 )
      ( MAKE-ON-VERIFY ?AUTO_3916 ?AUTO_3917 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3921 - BLOCK
      ?AUTO_3922 - BLOCK
    )
    :vars
    (
      ?AUTO_3923 - BLOCK
      ?AUTO_3925 - BLOCK
      ?AUTO_3924 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3922 ) ( not ( = ?AUTO_3921 ?AUTO_3922 ) ) ( ON-TABLE ?AUTO_3921 ) ( not ( = ?AUTO_3921 ?AUTO_3923 ) ) ( not ( = ?AUTO_3922 ?AUTO_3923 ) ) ( ON ?AUTO_3923 ?AUTO_3921 ) ( CLEAR ?AUTO_3925 ) ( not ( = ?AUTO_3921 ?AUTO_3924 ) ) ( not ( = ?AUTO_3921 ?AUTO_3925 ) ) ( not ( = ?AUTO_3922 ?AUTO_3924 ) ) ( not ( = ?AUTO_3922 ?AUTO_3925 ) ) ( not ( = ?AUTO_3923 ?AUTO_3924 ) ) ( not ( = ?AUTO_3923 ?AUTO_3925 ) ) ( not ( = ?AUTO_3924 ?AUTO_3925 ) ) ( ON ?AUTO_3924 ?AUTO_3923 ) ( CLEAR ?AUTO_3924 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3924 ?AUTO_3923 )
      ( MAKE-ON ?AUTO_3921 ?AUTO_3922 )
      ( MAKE-ON-VERIFY ?AUTO_3921 ?AUTO_3922 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3926 - BLOCK
      ?AUTO_3927 - BLOCK
    )
    :vars
    (
      ?AUTO_3930 - BLOCK
      ?AUTO_3929 - BLOCK
      ?AUTO_3928 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3927 ) ( not ( = ?AUTO_3926 ?AUTO_3927 ) ) ( ON-TABLE ?AUTO_3926 ) ( not ( = ?AUTO_3926 ?AUTO_3930 ) ) ( not ( = ?AUTO_3927 ?AUTO_3930 ) ) ( ON ?AUTO_3930 ?AUTO_3926 ) ( not ( = ?AUTO_3926 ?AUTO_3929 ) ) ( not ( = ?AUTO_3926 ?AUTO_3928 ) ) ( not ( = ?AUTO_3927 ?AUTO_3929 ) ) ( not ( = ?AUTO_3927 ?AUTO_3928 ) ) ( not ( = ?AUTO_3930 ?AUTO_3929 ) ) ( not ( = ?AUTO_3930 ?AUTO_3928 ) ) ( not ( = ?AUTO_3929 ?AUTO_3928 ) ) ( ON ?AUTO_3929 ?AUTO_3930 ) ( CLEAR ?AUTO_3929 ) ( HOLDING ?AUTO_3928 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3928 )
      ( MAKE-ON ?AUTO_3926 ?AUTO_3927 )
      ( MAKE-ON-VERIFY ?AUTO_3926 ?AUTO_3927 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3931 - BLOCK
      ?AUTO_3932 - BLOCK
    )
    :vars
    (
      ?AUTO_3935 - BLOCK
      ?AUTO_3933 - BLOCK
      ?AUTO_3934 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3931 ?AUTO_3932 ) ) ( ON-TABLE ?AUTO_3931 ) ( not ( = ?AUTO_3931 ?AUTO_3935 ) ) ( not ( = ?AUTO_3932 ?AUTO_3935 ) ) ( ON ?AUTO_3935 ?AUTO_3931 ) ( not ( = ?AUTO_3931 ?AUTO_3933 ) ) ( not ( = ?AUTO_3931 ?AUTO_3934 ) ) ( not ( = ?AUTO_3932 ?AUTO_3933 ) ) ( not ( = ?AUTO_3932 ?AUTO_3934 ) ) ( not ( = ?AUTO_3935 ?AUTO_3933 ) ) ( not ( = ?AUTO_3935 ?AUTO_3934 ) ) ( not ( = ?AUTO_3933 ?AUTO_3934 ) ) ( ON ?AUTO_3933 ?AUTO_3935 ) ( CLEAR ?AUTO_3933 ) ( ON ?AUTO_3934 ?AUTO_3932 ) ( CLEAR ?AUTO_3934 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3934 ?AUTO_3932 )
      ( MAKE-ON ?AUTO_3931 ?AUTO_3932 )
      ( MAKE-ON-VERIFY ?AUTO_3931 ?AUTO_3932 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3937 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3937 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3937 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3937 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3938 - BLOCK
    )
    :vars
    (
      ?AUTO_3939 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3938 ?AUTO_3939 ) ( CLEAR ?AUTO_3938 ) ( HAND-EMPTY ) ( not ( = ?AUTO_3938 ?AUTO_3939 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3938 ?AUTO_3939 )
      ( MAKE-ON-TABLE ?AUTO_3938 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3938 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3941 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3941 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3941 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3941 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3942 - BLOCK
    )
    :vars
    (
      ?AUTO_3943 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3942 ?AUTO_3943 ) ( CLEAR ?AUTO_3942 ) ( HAND-EMPTY ) ( not ( = ?AUTO_3942 ?AUTO_3943 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3942 ?AUTO_3943 )
      ( MAKE-ON-TABLE ?AUTO_3942 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3942 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3944 - BLOCK
    )
    :vars
    (
      ?AUTO_3945 - BLOCK
      ?AUTO_3946 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3944 ?AUTO_3945 ) ( CLEAR ?AUTO_3944 ) ( not ( = ?AUTO_3944 ?AUTO_3945 ) ) ( HOLDING ?AUTO_3946 ) ( not ( = ?AUTO_3944 ?AUTO_3946 ) ) ( not ( = ?AUTO_3945 ?AUTO_3946 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3946 )
      ( MAKE-ON-TABLE ?AUTO_3944 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3944 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3947 - BLOCK
    )
    :vars
    (
      ?AUTO_3948 - BLOCK
      ?AUTO_3949 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3947 ?AUTO_3948 ) ( not ( = ?AUTO_3947 ?AUTO_3948 ) ) ( not ( = ?AUTO_3947 ?AUTO_3949 ) ) ( not ( = ?AUTO_3948 ?AUTO_3949 ) ) ( ON ?AUTO_3949 ?AUTO_3947 ) ( CLEAR ?AUTO_3949 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3949 ?AUTO_3947 )
      ( MAKE-ON-TABLE ?AUTO_3947 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3947 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3952 - BLOCK
      ?AUTO_3953 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3952 ) ( CLEAR ?AUTO_3953 ) ( not ( = ?AUTO_3952 ?AUTO_3953 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3952 ?AUTO_3953 )
      ( MAKE-ON-VERIFY ?AUTO_3952 ?AUTO_3953 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3954 - BLOCK
      ?AUTO_3955 - BLOCK
    )
    :vars
    (
      ?AUTO_3956 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3955 ) ( not ( = ?AUTO_3954 ?AUTO_3955 ) ) ( ON ?AUTO_3954 ?AUTO_3956 ) ( CLEAR ?AUTO_3954 ) ( HAND-EMPTY ) ( not ( = ?AUTO_3954 ?AUTO_3956 ) ) ( not ( = ?AUTO_3955 ?AUTO_3956 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3954 ?AUTO_3956 )
      ( MAKE-ON ?AUTO_3954 ?AUTO_3955 )
      ( MAKE-ON-VERIFY ?AUTO_3954 ?AUTO_3955 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3957 - BLOCK
      ?AUTO_3958 - BLOCK
    )
    :vars
    (
      ?AUTO_3959 - BLOCK
      ?AUTO_3960 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3958 ) ( not ( = ?AUTO_3957 ?AUTO_3958 ) ) ( ON ?AUTO_3957 ?AUTO_3959 ) ( CLEAR ?AUTO_3957 ) ( not ( = ?AUTO_3957 ?AUTO_3959 ) ) ( not ( = ?AUTO_3958 ?AUTO_3959 ) ) ( HOLDING ?AUTO_3960 ) ( not ( = ?AUTO_3957 ?AUTO_3960 ) ) ( not ( = ?AUTO_3958 ?AUTO_3960 ) ) ( not ( = ?AUTO_3959 ?AUTO_3960 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3960 )
      ( MAKE-ON ?AUTO_3957 ?AUTO_3958 )
      ( MAKE-ON-VERIFY ?AUTO_3957 ?AUTO_3958 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3961 - BLOCK
      ?AUTO_3962 - BLOCK
    )
    :vars
    (
      ?AUTO_3963 - BLOCK
      ?AUTO_3964 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3962 ) ( not ( = ?AUTO_3961 ?AUTO_3962 ) ) ( ON ?AUTO_3961 ?AUTO_3963 ) ( not ( = ?AUTO_3961 ?AUTO_3963 ) ) ( not ( = ?AUTO_3962 ?AUTO_3963 ) ) ( not ( = ?AUTO_3961 ?AUTO_3964 ) ) ( not ( = ?AUTO_3962 ?AUTO_3964 ) ) ( not ( = ?AUTO_3963 ?AUTO_3964 ) ) ( ON ?AUTO_3964 ?AUTO_3961 ) ( CLEAR ?AUTO_3964 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3964 ?AUTO_3961 )
      ( MAKE-ON ?AUTO_3961 ?AUTO_3962 )
      ( MAKE-ON-VERIFY ?AUTO_3961 ?AUTO_3962 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3965 - BLOCK
      ?AUTO_3966 - BLOCK
    )
    :vars
    (
      ?AUTO_3967 - BLOCK
      ?AUTO_3968 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3965 ?AUTO_3966 ) ) ( ON ?AUTO_3965 ?AUTO_3967 ) ( not ( = ?AUTO_3965 ?AUTO_3967 ) ) ( not ( = ?AUTO_3966 ?AUTO_3967 ) ) ( not ( = ?AUTO_3965 ?AUTO_3968 ) ) ( not ( = ?AUTO_3966 ?AUTO_3968 ) ) ( not ( = ?AUTO_3967 ?AUTO_3968 ) ) ( ON ?AUTO_3968 ?AUTO_3965 ) ( CLEAR ?AUTO_3968 ) ( HOLDING ?AUTO_3966 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3966 )
      ( MAKE-ON ?AUTO_3965 ?AUTO_3966 )
      ( MAKE-ON-VERIFY ?AUTO_3965 ?AUTO_3966 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3969 - BLOCK
      ?AUTO_3970 - BLOCK
    )
    :vars
    (
      ?AUTO_3971 - BLOCK
      ?AUTO_3972 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3969 ?AUTO_3970 ) ) ( ON ?AUTO_3969 ?AUTO_3971 ) ( not ( = ?AUTO_3969 ?AUTO_3971 ) ) ( not ( = ?AUTO_3970 ?AUTO_3971 ) ) ( not ( = ?AUTO_3969 ?AUTO_3972 ) ) ( not ( = ?AUTO_3970 ?AUTO_3972 ) ) ( not ( = ?AUTO_3971 ?AUTO_3972 ) ) ( ON ?AUTO_3972 ?AUTO_3969 ) ( ON ?AUTO_3970 ?AUTO_3972 ) ( CLEAR ?AUTO_3970 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3970 ?AUTO_3972 )
      ( MAKE-ON ?AUTO_3969 ?AUTO_3970 )
      ( MAKE-ON-VERIFY ?AUTO_3969 ?AUTO_3970 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3974 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3974 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3974 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3974 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3975 - BLOCK
    )
    :vars
    (
      ?AUTO_3976 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3975 ?AUTO_3976 ) ( CLEAR ?AUTO_3975 ) ( HAND-EMPTY ) ( not ( = ?AUTO_3975 ?AUTO_3976 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3975 ?AUTO_3976 )
      ( MAKE-ON-TABLE ?AUTO_3975 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3975 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3977 - BLOCK
    )
    :vars
    (
      ?AUTO_3978 - BLOCK
      ?AUTO_3979 - BLOCK
      ?AUTO_3980 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3977 ?AUTO_3978 ) ( CLEAR ?AUTO_3977 ) ( not ( = ?AUTO_3977 ?AUTO_3978 ) ) ( HOLDING ?AUTO_3979 ) ( CLEAR ?AUTO_3980 ) ( not ( = ?AUTO_3977 ?AUTO_3979 ) ) ( not ( = ?AUTO_3977 ?AUTO_3980 ) ) ( not ( = ?AUTO_3978 ?AUTO_3979 ) ) ( not ( = ?AUTO_3978 ?AUTO_3980 ) ) ( not ( = ?AUTO_3979 ?AUTO_3980 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3979 ?AUTO_3980 )
      ( MAKE-ON-TABLE ?AUTO_3977 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3977 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3981 - BLOCK
    )
    :vars
    (
      ?AUTO_3982 - BLOCK
      ?AUTO_3984 - BLOCK
      ?AUTO_3983 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3981 ?AUTO_3982 ) ( not ( = ?AUTO_3981 ?AUTO_3982 ) ) ( CLEAR ?AUTO_3984 ) ( not ( = ?AUTO_3981 ?AUTO_3983 ) ) ( not ( = ?AUTO_3981 ?AUTO_3984 ) ) ( not ( = ?AUTO_3982 ?AUTO_3983 ) ) ( not ( = ?AUTO_3982 ?AUTO_3984 ) ) ( not ( = ?AUTO_3983 ?AUTO_3984 ) ) ( ON ?AUTO_3983 ?AUTO_3981 ) ( CLEAR ?AUTO_3983 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3983 ?AUTO_3981 )
      ( MAKE-ON-TABLE ?AUTO_3981 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3981 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3985 - BLOCK
    )
    :vars
    (
      ?AUTO_3986 - BLOCK
      ?AUTO_3988 - BLOCK
      ?AUTO_3987 - BLOCK
      ?AUTO_3989 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3985 ?AUTO_3986 ) ( not ( = ?AUTO_3985 ?AUTO_3986 ) ) ( CLEAR ?AUTO_3988 ) ( not ( = ?AUTO_3985 ?AUTO_3987 ) ) ( not ( = ?AUTO_3985 ?AUTO_3988 ) ) ( not ( = ?AUTO_3986 ?AUTO_3987 ) ) ( not ( = ?AUTO_3986 ?AUTO_3988 ) ) ( not ( = ?AUTO_3987 ?AUTO_3988 ) ) ( ON ?AUTO_3987 ?AUTO_3985 ) ( CLEAR ?AUTO_3987 ) ( HOLDING ?AUTO_3989 ) ( not ( = ?AUTO_3985 ?AUTO_3989 ) ) ( not ( = ?AUTO_3986 ?AUTO_3989 ) ) ( not ( = ?AUTO_3988 ?AUTO_3989 ) ) ( not ( = ?AUTO_3987 ?AUTO_3989 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3989 )
      ( MAKE-ON-TABLE ?AUTO_3985 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3985 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3990 - BLOCK
    )
    :vars
    (
      ?AUTO_3991 - BLOCK
      ?AUTO_3994 - BLOCK
      ?AUTO_3992 - BLOCK
      ?AUTO_3993 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3990 ?AUTO_3991 ) ( not ( = ?AUTO_3990 ?AUTO_3991 ) ) ( CLEAR ?AUTO_3994 ) ( not ( = ?AUTO_3990 ?AUTO_3992 ) ) ( not ( = ?AUTO_3990 ?AUTO_3994 ) ) ( not ( = ?AUTO_3991 ?AUTO_3992 ) ) ( not ( = ?AUTO_3991 ?AUTO_3994 ) ) ( not ( = ?AUTO_3992 ?AUTO_3994 ) ) ( ON ?AUTO_3992 ?AUTO_3990 ) ( not ( = ?AUTO_3990 ?AUTO_3993 ) ) ( not ( = ?AUTO_3991 ?AUTO_3993 ) ) ( not ( = ?AUTO_3994 ?AUTO_3993 ) ) ( not ( = ?AUTO_3992 ?AUTO_3993 ) ) ( ON ?AUTO_3993 ?AUTO_3992 ) ( CLEAR ?AUTO_3993 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3993 ?AUTO_3992 )
      ( MAKE-ON-TABLE ?AUTO_3990 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3990 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3995 - BLOCK
    )
    :vars
    (
      ?AUTO_3999 - BLOCK
      ?AUTO_3997 - BLOCK
      ?AUTO_3998 - BLOCK
      ?AUTO_3996 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3995 ?AUTO_3999 ) ( not ( = ?AUTO_3995 ?AUTO_3999 ) ) ( not ( = ?AUTO_3995 ?AUTO_3997 ) ) ( not ( = ?AUTO_3995 ?AUTO_3998 ) ) ( not ( = ?AUTO_3999 ?AUTO_3997 ) ) ( not ( = ?AUTO_3999 ?AUTO_3998 ) ) ( not ( = ?AUTO_3997 ?AUTO_3998 ) ) ( ON ?AUTO_3997 ?AUTO_3995 ) ( not ( = ?AUTO_3995 ?AUTO_3996 ) ) ( not ( = ?AUTO_3999 ?AUTO_3996 ) ) ( not ( = ?AUTO_3998 ?AUTO_3996 ) ) ( not ( = ?AUTO_3997 ?AUTO_3996 ) ) ( ON ?AUTO_3996 ?AUTO_3997 ) ( CLEAR ?AUTO_3996 ) ( HOLDING ?AUTO_3998 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3998 )
      ( MAKE-ON-TABLE ?AUTO_3995 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3995 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4000 - BLOCK
    )
    :vars
    (
      ?AUTO_4003 - BLOCK
      ?AUTO_4001 - BLOCK
      ?AUTO_4004 - BLOCK
      ?AUTO_4002 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4000 ?AUTO_4003 ) ( not ( = ?AUTO_4000 ?AUTO_4003 ) ) ( not ( = ?AUTO_4000 ?AUTO_4001 ) ) ( not ( = ?AUTO_4000 ?AUTO_4004 ) ) ( not ( = ?AUTO_4003 ?AUTO_4001 ) ) ( not ( = ?AUTO_4003 ?AUTO_4004 ) ) ( not ( = ?AUTO_4001 ?AUTO_4004 ) ) ( ON ?AUTO_4001 ?AUTO_4000 ) ( not ( = ?AUTO_4000 ?AUTO_4002 ) ) ( not ( = ?AUTO_4003 ?AUTO_4002 ) ) ( not ( = ?AUTO_4004 ?AUTO_4002 ) ) ( not ( = ?AUTO_4001 ?AUTO_4002 ) ) ( ON ?AUTO_4002 ?AUTO_4001 ) ( ON ?AUTO_4004 ?AUTO_4002 ) ( CLEAR ?AUTO_4004 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4004 ?AUTO_4002 )
      ( MAKE-ON-TABLE ?AUTO_4000 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4000 ) )
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
    :vars
    (
      ?AUTO_4013 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4012 ) ( not ( = ?AUTO_4011 ?AUTO_4012 ) ) ( ON-TABLE ?AUTO_4011 ) ( CLEAR ?AUTO_4011 ) ( HOLDING ?AUTO_4013 ) ( not ( = ?AUTO_4011 ?AUTO_4013 ) ) ( not ( = ?AUTO_4012 ?AUTO_4013 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4013 )
      ( MAKE-ON ?AUTO_4011 ?AUTO_4012 )
      ( MAKE-ON-VERIFY ?AUTO_4011 ?AUTO_4012 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4014 - BLOCK
      ?AUTO_4015 - BLOCK
    )
    :vars
    (
      ?AUTO_4016 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4015 ) ( not ( = ?AUTO_4014 ?AUTO_4015 ) ) ( ON-TABLE ?AUTO_4014 ) ( not ( = ?AUTO_4014 ?AUTO_4016 ) ) ( not ( = ?AUTO_4015 ?AUTO_4016 ) ) ( ON ?AUTO_4016 ?AUTO_4014 ) ( CLEAR ?AUTO_4016 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4016 ?AUTO_4014 )
      ( MAKE-ON ?AUTO_4014 ?AUTO_4015 )
      ( MAKE-ON-VERIFY ?AUTO_4014 ?AUTO_4015 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4017 - BLOCK
      ?AUTO_4018 - BLOCK
    )
    :vars
    (
      ?AUTO_4019 - BLOCK
      ?AUTO_4020 - BLOCK
      ?AUTO_4021 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4018 ) ( not ( = ?AUTO_4017 ?AUTO_4018 ) ) ( ON-TABLE ?AUTO_4017 ) ( not ( = ?AUTO_4017 ?AUTO_4019 ) ) ( not ( = ?AUTO_4018 ?AUTO_4019 ) ) ( ON ?AUTO_4019 ?AUTO_4017 ) ( CLEAR ?AUTO_4019 ) ( HOLDING ?AUTO_4020 ) ( CLEAR ?AUTO_4021 ) ( not ( = ?AUTO_4017 ?AUTO_4020 ) ) ( not ( = ?AUTO_4017 ?AUTO_4021 ) ) ( not ( = ?AUTO_4018 ?AUTO_4020 ) ) ( not ( = ?AUTO_4018 ?AUTO_4021 ) ) ( not ( = ?AUTO_4019 ?AUTO_4020 ) ) ( not ( = ?AUTO_4019 ?AUTO_4021 ) ) ( not ( = ?AUTO_4020 ?AUTO_4021 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4020 ?AUTO_4021 )
      ( MAKE-ON ?AUTO_4017 ?AUTO_4018 )
      ( MAKE-ON-VERIFY ?AUTO_4017 ?AUTO_4018 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4022 - BLOCK
      ?AUTO_4023 - BLOCK
    )
    :vars
    (
      ?AUTO_4026 - BLOCK
      ?AUTO_4025 - BLOCK
      ?AUTO_4024 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4023 ) ( not ( = ?AUTO_4022 ?AUTO_4023 ) ) ( ON-TABLE ?AUTO_4022 ) ( not ( = ?AUTO_4022 ?AUTO_4026 ) ) ( not ( = ?AUTO_4023 ?AUTO_4026 ) ) ( ON ?AUTO_4026 ?AUTO_4022 ) ( CLEAR ?AUTO_4025 ) ( not ( = ?AUTO_4022 ?AUTO_4024 ) ) ( not ( = ?AUTO_4022 ?AUTO_4025 ) ) ( not ( = ?AUTO_4023 ?AUTO_4024 ) ) ( not ( = ?AUTO_4023 ?AUTO_4025 ) ) ( not ( = ?AUTO_4026 ?AUTO_4024 ) ) ( not ( = ?AUTO_4026 ?AUTO_4025 ) ) ( not ( = ?AUTO_4024 ?AUTO_4025 ) ) ( ON ?AUTO_4024 ?AUTO_4026 ) ( CLEAR ?AUTO_4024 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4024 ?AUTO_4026 )
      ( MAKE-ON ?AUTO_4022 ?AUTO_4023 )
      ( MAKE-ON-VERIFY ?AUTO_4022 ?AUTO_4023 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4027 - BLOCK
      ?AUTO_4028 - BLOCK
    )
    :vars
    (
      ?AUTO_4029 - BLOCK
      ?AUTO_4030 - BLOCK
      ?AUTO_4031 - BLOCK
      ?AUTO_4032 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4028 ) ( not ( = ?AUTO_4027 ?AUTO_4028 ) ) ( ON-TABLE ?AUTO_4027 ) ( not ( = ?AUTO_4027 ?AUTO_4029 ) ) ( not ( = ?AUTO_4028 ?AUTO_4029 ) ) ( ON ?AUTO_4029 ?AUTO_4027 ) ( CLEAR ?AUTO_4030 ) ( not ( = ?AUTO_4027 ?AUTO_4031 ) ) ( not ( = ?AUTO_4027 ?AUTO_4030 ) ) ( not ( = ?AUTO_4028 ?AUTO_4031 ) ) ( not ( = ?AUTO_4028 ?AUTO_4030 ) ) ( not ( = ?AUTO_4029 ?AUTO_4031 ) ) ( not ( = ?AUTO_4029 ?AUTO_4030 ) ) ( not ( = ?AUTO_4031 ?AUTO_4030 ) ) ( ON ?AUTO_4031 ?AUTO_4029 ) ( CLEAR ?AUTO_4031 ) ( HOLDING ?AUTO_4032 ) ( not ( = ?AUTO_4027 ?AUTO_4032 ) ) ( not ( = ?AUTO_4028 ?AUTO_4032 ) ) ( not ( = ?AUTO_4029 ?AUTO_4032 ) ) ( not ( = ?AUTO_4030 ?AUTO_4032 ) ) ( not ( = ?AUTO_4031 ?AUTO_4032 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4032 )
      ( MAKE-ON ?AUTO_4027 ?AUTO_4028 )
      ( MAKE-ON-VERIFY ?AUTO_4027 ?AUTO_4028 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4033 - BLOCK
      ?AUTO_4034 - BLOCK
    )
    :vars
    (
      ?AUTO_4036 - BLOCK
      ?AUTO_4035 - BLOCK
      ?AUTO_4037 - BLOCK
      ?AUTO_4038 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4034 ) ( not ( = ?AUTO_4033 ?AUTO_4034 ) ) ( ON-TABLE ?AUTO_4033 ) ( not ( = ?AUTO_4033 ?AUTO_4036 ) ) ( not ( = ?AUTO_4034 ?AUTO_4036 ) ) ( ON ?AUTO_4036 ?AUTO_4033 ) ( CLEAR ?AUTO_4035 ) ( not ( = ?AUTO_4033 ?AUTO_4037 ) ) ( not ( = ?AUTO_4033 ?AUTO_4035 ) ) ( not ( = ?AUTO_4034 ?AUTO_4037 ) ) ( not ( = ?AUTO_4034 ?AUTO_4035 ) ) ( not ( = ?AUTO_4036 ?AUTO_4037 ) ) ( not ( = ?AUTO_4036 ?AUTO_4035 ) ) ( not ( = ?AUTO_4037 ?AUTO_4035 ) ) ( ON ?AUTO_4037 ?AUTO_4036 ) ( not ( = ?AUTO_4033 ?AUTO_4038 ) ) ( not ( = ?AUTO_4034 ?AUTO_4038 ) ) ( not ( = ?AUTO_4036 ?AUTO_4038 ) ) ( not ( = ?AUTO_4035 ?AUTO_4038 ) ) ( not ( = ?AUTO_4037 ?AUTO_4038 ) ) ( ON ?AUTO_4038 ?AUTO_4037 ) ( CLEAR ?AUTO_4038 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4038 ?AUTO_4037 )
      ( MAKE-ON ?AUTO_4033 ?AUTO_4034 )
      ( MAKE-ON-VERIFY ?AUTO_4033 ?AUTO_4034 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4039 - BLOCK
      ?AUTO_4040 - BLOCK
    )
    :vars
    (
      ?AUTO_4042 - BLOCK
      ?AUTO_4044 - BLOCK
      ?AUTO_4043 - BLOCK
      ?AUTO_4041 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4040 ) ( not ( = ?AUTO_4039 ?AUTO_4040 ) ) ( ON-TABLE ?AUTO_4039 ) ( not ( = ?AUTO_4039 ?AUTO_4042 ) ) ( not ( = ?AUTO_4040 ?AUTO_4042 ) ) ( ON ?AUTO_4042 ?AUTO_4039 ) ( not ( = ?AUTO_4039 ?AUTO_4044 ) ) ( not ( = ?AUTO_4039 ?AUTO_4043 ) ) ( not ( = ?AUTO_4040 ?AUTO_4044 ) ) ( not ( = ?AUTO_4040 ?AUTO_4043 ) ) ( not ( = ?AUTO_4042 ?AUTO_4044 ) ) ( not ( = ?AUTO_4042 ?AUTO_4043 ) ) ( not ( = ?AUTO_4044 ?AUTO_4043 ) ) ( ON ?AUTO_4044 ?AUTO_4042 ) ( not ( = ?AUTO_4039 ?AUTO_4041 ) ) ( not ( = ?AUTO_4040 ?AUTO_4041 ) ) ( not ( = ?AUTO_4042 ?AUTO_4041 ) ) ( not ( = ?AUTO_4043 ?AUTO_4041 ) ) ( not ( = ?AUTO_4044 ?AUTO_4041 ) ) ( ON ?AUTO_4041 ?AUTO_4044 ) ( CLEAR ?AUTO_4041 ) ( HOLDING ?AUTO_4043 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4043 )
      ( MAKE-ON ?AUTO_4039 ?AUTO_4040 )
      ( MAKE-ON-VERIFY ?AUTO_4039 ?AUTO_4040 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4045 - BLOCK
      ?AUTO_4046 - BLOCK
    )
    :vars
    (
      ?AUTO_4049 - BLOCK
      ?AUTO_4047 - BLOCK
      ?AUTO_4050 - BLOCK
      ?AUTO_4048 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4046 ) ( not ( = ?AUTO_4045 ?AUTO_4046 ) ) ( ON-TABLE ?AUTO_4045 ) ( not ( = ?AUTO_4045 ?AUTO_4049 ) ) ( not ( = ?AUTO_4046 ?AUTO_4049 ) ) ( ON ?AUTO_4049 ?AUTO_4045 ) ( not ( = ?AUTO_4045 ?AUTO_4047 ) ) ( not ( = ?AUTO_4045 ?AUTO_4050 ) ) ( not ( = ?AUTO_4046 ?AUTO_4047 ) ) ( not ( = ?AUTO_4046 ?AUTO_4050 ) ) ( not ( = ?AUTO_4049 ?AUTO_4047 ) ) ( not ( = ?AUTO_4049 ?AUTO_4050 ) ) ( not ( = ?AUTO_4047 ?AUTO_4050 ) ) ( ON ?AUTO_4047 ?AUTO_4049 ) ( not ( = ?AUTO_4045 ?AUTO_4048 ) ) ( not ( = ?AUTO_4046 ?AUTO_4048 ) ) ( not ( = ?AUTO_4049 ?AUTO_4048 ) ) ( not ( = ?AUTO_4050 ?AUTO_4048 ) ) ( not ( = ?AUTO_4047 ?AUTO_4048 ) ) ( ON ?AUTO_4048 ?AUTO_4047 ) ( ON ?AUTO_4050 ?AUTO_4048 ) ( CLEAR ?AUTO_4050 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4050 ?AUTO_4048 )
      ( MAKE-ON ?AUTO_4045 ?AUTO_4046 )
      ( MAKE-ON-VERIFY ?AUTO_4045 ?AUTO_4046 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4052 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4052 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4052 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4052 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4053 - BLOCK
    )
    :vars
    (
      ?AUTO_4054 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4053 ?AUTO_4054 ) ( CLEAR ?AUTO_4053 ) ( HAND-EMPTY ) ( not ( = ?AUTO_4053 ?AUTO_4054 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4053 ?AUTO_4054 )
      ( MAKE-ON-TABLE ?AUTO_4053 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4053 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4057 - BLOCK
      ?AUTO_4058 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4057 ) ( CLEAR ?AUTO_4058 ) ( not ( = ?AUTO_4057 ?AUTO_4058 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4057 ?AUTO_4058 )
      ( MAKE-ON-VERIFY ?AUTO_4057 ?AUTO_4058 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4059 - BLOCK
      ?AUTO_4060 - BLOCK
    )
    :vars
    (
      ?AUTO_4061 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4060 ) ( not ( = ?AUTO_4059 ?AUTO_4060 ) ) ( ON ?AUTO_4059 ?AUTO_4061 ) ( CLEAR ?AUTO_4059 ) ( HAND-EMPTY ) ( not ( = ?AUTO_4059 ?AUTO_4061 ) ) ( not ( = ?AUTO_4060 ?AUTO_4061 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4059 ?AUTO_4061 )
      ( MAKE-ON ?AUTO_4059 ?AUTO_4060 )
      ( MAKE-ON-VERIFY ?AUTO_4059 ?AUTO_4060 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4062 - BLOCK
      ?AUTO_4063 - BLOCK
    )
    :vars
    (
      ?AUTO_4064 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4062 ?AUTO_4063 ) ) ( ON ?AUTO_4062 ?AUTO_4064 ) ( CLEAR ?AUTO_4062 ) ( not ( = ?AUTO_4062 ?AUTO_4064 ) ) ( not ( = ?AUTO_4063 ?AUTO_4064 ) ) ( HOLDING ?AUTO_4063 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4063 )
      ( MAKE-ON ?AUTO_4062 ?AUTO_4063 )
      ( MAKE-ON-VERIFY ?AUTO_4062 ?AUTO_4063 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4065 - BLOCK
      ?AUTO_4066 - BLOCK
    )
    :vars
    (
      ?AUTO_4067 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4065 ?AUTO_4066 ) ) ( ON ?AUTO_4065 ?AUTO_4067 ) ( not ( = ?AUTO_4065 ?AUTO_4067 ) ) ( not ( = ?AUTO_4066 ?AUTO_4067 ) ) ( ON ?AUTO_4066 ?AUTO_4065 ) ( CLEAR ?AUTO_4066 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4066 ?AUTO_4065 )
      ( MAKE-ON ?AUTO_4065 ?AUTO_4066 )
      ( MAKE-ON-VERIFY ?AUTO_4065 ?AUTO_4066 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4070 - BLOCK
      ?AUTO_4071 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4070 ) ( CLEAR ?AUTO_4071 ) ( not ( = ?AUTO_4070 ?AUTO_4071 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4070 ?AUTO_4071 )
      ( MAKE-ON-VERIFY ?AUTO_4070 ?AUTO_4071 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4072 - BLOCK
      ?AUTO_4073 - BLOCK
    )
    :vars
    (
      ?AUTO_4074 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4073 ) ( not ( = ?AUTO_4072 ?AUTO_4073 ) ) ( ON ?AUTO_4072 ?AUTO_4074 ) ( CLEAR ?AUTO_4072 ) ( HAND-EMPTY ) ( not ( = ?AUTO_4072 ?AUTO_4074 ) ) ( not ( = ?AUTO_4073 ?AUTO_4074 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4072 ?AUTO_4074 )
      ( MAKE-ON ?AUTO_4072 ?AUTO_4073 )
      ( MAKE-ON-VERIFY ?AUTO_4072 ?AUTO_4073 ) )
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
    )
    :precondition
    ( and ( not ( = ?AUTO_4075 ?AUTO_4076 ) ) ( ON ?AUTO_4075 ?AUTO_4077 ) ( CLEAR ?AUTO_4075 ) ( not ( = ?AUTO_4075 ?AUTO_4077 ) ) ( not ( = ?AUTO_4076 ?AUTO_4077 ) ) ( HOLDING ?AUTO_4076 ) ( CLEAR ?AUTO_4078 ) ( not ( = ?AUTO_4075 ?AUTO_4078 ) ) ( not ( = ?AUTO_4076 ?AUTO_4078 ) ) ( not ( = ?AUTO_4077 ?AUTO_4078 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4076 ?AUTO_4078 )
      ( MAKE-ON ?AUTO_4075 ?AUTO_4076 )
      ( MAKE-ON-VERIFY ?AUTO_4075 ?AUTO_4076 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4081 - BLOCK
      ?AUTO_4082 - BLOCK
    )
    :vars
    (
      ?AUTO_4083 - BLOCK
      ?AUTO_4084 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4082 ) ( not ( = ?AUTO_4081 ?AUTO_4082 ) ) ( ON ?AUTO_4081 ?AUTO_4083 ) ( CLEAR ?AUTO_4081 ) ( not ( = ?AUTO_4081 ?AUTO_4083 ) ) ( not ( = ?AUTO_4082 ?AUTO_4083 ) ) ( HOLDING ?AUTO_4084 ) ( not ( = ?AUTO_4081 ?AUTO_4084 ) ) ( not ( = ?AUTO_4082 ?AUTO_4084 ) ) ( not ( = ?AUTO_4083 ?AUTO_4084 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4084 )
      ( MAKE-ON ?AUTO_4081 ?AUTO_4082 )
      ( MAKE-ON-VERIFY ?AUTO_4081 ?AUTO_4082 ) )
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
    )
    :precondition
    ( and ( not ( = ?AUTO_4085 ?AUTO_4086 ) ) ( ON ?AUTO_4085 ?AUTO_4087 ) ( CLEAR ?AUTO_4085 ) ( not ( = ?AUTO_4085 ?AUTO_4087 ) ) ( not ( = ?AUTO_4086 ?AUTO_4087 ) ) ( not ( = ?AUTO_4085 ?AUTO_4088 ) ) ( not ( = ?AUTO_4086 ?AUTO_4088 ) ) ( not ( = ?AUTO_4087 ?AUTO_4088 ) ) ( ON ?AUTO_4088 ?AUTO_4086 ) ( CLEAR ?AUTO_4088 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4088 ?AUTO_4086 )
      ( MAKE-ON ?AUTO_4085 ?AUTO_4086 )
      ( MAKE-ON-VERIFY ?AUTO_4085 ?AUTO_4086 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4090 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4090 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4090 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4090 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4091 - BLOCK
    )
    :vars
    (
      ?AUTO_4092 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4091 ?AUTO_4092 ) ( CLEAR ?AUTO_4091 ) ( HAND-EMPTY ) ( not ( = ?AUTO_4091 ?AUTO_4092 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4091 ?AUTO_4092 )
      ( MAKE-ON-TABLE ?AUTO_4091 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4091 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4093 - BLOCK
    )
    :vars
    (
      ?AUTO_4094 - BLOCK
      ?AUTO_4095 - BLOCK
      ?AUTO_4096 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4093 ?AUTO_4094 ) ( CLEAR ?AUTO_4093 ) ( not ( = ?AUTO_4093 ?AUTO_4094 ) ) ( HOLDING ?AUTO_4095 ) ( CLEAR ?AUTO_4096 ) ( not ( = ?AUTO_4093 ?AUTO_4095 ) ) ( not ( = ?AUTO_4093 ?AUTO_4096 ) ) ( not ( = ?AUTO_4094 ?AUTO_4095 ) ) ( not ( = ?AUTO_4094 ?AUTO_4096 ) ) ( not ( = ?AUTO_4095 ?AUTO_4096 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4095 ?AUTO_4096 )
      ( MAKE-ON-TABLE ?AUTO_4093 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4093 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4099 - BLOCK
    )
    :vars
    (
      ?AUTO_4102 - BLOCK
      ?AUTO_4100 - BLOCK
      ?AUTO_4101 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4099 ?AUTO_4102 ) ( not ( = ?AUTO_4099 ?AUTO_4102 ) ) ( CLEAR ?AUTO_4100 ) ( not ( = ?AUTO_4099 ?AUTO_4101 ) ) ( not ( = ?AUTO_4099 ?AUTO_4100 ) ) ( not ( = ?AUTO_4102 ?AUTO_4101 ) ) ( not ( = ?AUTO_4102 ?AUTO_4100 ) ) ( not ( = ?AUTO_4101 ?AUTO_4100 ) ) ( ON ?AUTO_4101 ?AUTO_4099 ) ( CLEAR ?AUTO_4101 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4101 ?AUTO_4099 )
      ( MAKE-ON-TABLE ?AUTO_4099 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4099 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4103 - BLOCK
    )
    :vars
    (
      ?AUTO_4106 - BLOCK
      ?AUTO_4105 - BLOCK
      ?AUTO_4104 - BLOCK
      ?AUTO_4107 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4103 ?AUTO_4106 ) ( not ( = ?AUTO_4103 ?AUTO_4106 ) ) ( CLEAR ?AUTO_4105 ) ( not ( = ?AUTO_4103 ?AUTO_4104 ) ) ( not ( = ?AUTO_4103 ?AUTO_4105 ) ) ( not ( = ?AUTO_4106 ?AUTO_4104 ) ) ( not ( = ?AUTO_4106 ?AUTO_4105 ) ) ( not ( = ?AUTO_4104 ?AUTO_4105 ) ) ( ON ?AUTO_4104 ?AUTO_4103 ) ( CLEAR ?AUTO_4104 ) ( HOLDING ?AUTO_4107 ) ( not ( = ?AUTO_4103 ?AUTO_4107 ) ) ( not ( = ?AUTO_4106 ?AUTO_4107 ) ) ( not ( = ?AUTO_4105 ?AUTO_4107 ) ) ( not ( = ?AUTO_4104 ?AUTO_4107 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4107 )
      ( MAKE-ON-TABLE ?AUTO_4103 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4103 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4108 - BLOCK
    )
    :vars
    (
      ?AUTO_4112 - BLOCK
      ?AUTO_4109 - BLOCK
      ?AUTO_4110 - BLOCK
      ?AUTO_4111 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4108 ?AUTO_4112 ) ( not ( = ?AUTO_4108 ?AUTO_4112 ) ) ( CLEAR ?AUTO_4109 ) ( not ( = ?AUTO_4108 ?AUTO_4110 ) ) ( not ( = ?AUTO_4108 ?AUTO_4109 ) ) ( not ( = ?AUTO_4112 ?AUTO_4110 ) ) ( not ( = ?AUTO_4112 ?AUTO_4109 ) ) ( not ( = ?AUTO_4110 ?AUTO_4109 ) ) ( ON ?AUTO_4110 ?AUTO_4108 ) ( not ( = ?AUTO_4108 ?AUTO_4111 ) ) ( not ( = ?AUTO_4112 ?AUTO_4111 ) ) ( not ( = ?AUTO_4109 ?AUTO_4111 ) ) ( not ( = ?AUTO_4110 ?AUTO_4111 ) ) ( ON ?AUTO_4111 ?AUTO_4110 ) ( CLEAR ?AUTO_4111 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4111 ?AUTO_4110 )
      ( MAKE-ON-TABLE ?AUTO_4108 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4108 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4115 - BLOCK
      ?AUTO_4116 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4115 ) ( CLEAR ?AUTO_4116 ) ( not ( = ?AUTO_4115 ?AUTO_4116 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4115 ?AUTO_4116 )
      ( MAKE-ON-VERIFY ?AUTO_4115 ?AUTO_4116 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4117 - BLOCK
      ?AUTO_4118 - BLOCK
    )
    :vars
    (
      ?AUTO_4119 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4118 ) ( not ( = ?AUTO_4117 ?AUTO_4118 ) ) ( ON ?AUTO_4117 ?AUTO_4119 ) ( CLEAR ?AUTO_4117 ) ( HAND-EMPTY ) ( not ( = ?AUTO_4117 ?AUTO_4119 ) ) ( not ( = ?AUTO_4118 ?AUTO_4119 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4117 ?AUTO_4119 )
      ( MAKE-ON ?AUTO_4117 ?AUTO_4118 )
      ( MAKE-ON-VERIFY ?AUTO_4117 ?AUTO_4118 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4120 - BLOCK
      ?AUTO_4121 - BLOCK
    )
    :vars
    (
      ?AUTO_4122 - BLOCK
      ?AUTO_4123 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4121 ) ( not ( = ?AUTO_4120 ?AUTO_4121 ) ) ( ON ?AUTO_4120 ?AUTO_4122 ) ( CLEAR ?AUTO_4120 ) ( not ( = ?AUTO_4120 ?AUTO_4122 ) ) ( not ( = ?AUTO_4121 ?AUTO_4122 ) ) ( HOLDING ?AUTO_4123 ) ( not ( = ?AUTO_4120 ?AUTO_4123 ) ) ( not ( = ?AUTO_4121 ?AUTO_4123 ) ) ( not ( = ?AUTO_4122 ?AUTO_4123 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4123 )
      ( MAKE-ON ?AUTO_4120 ?AUTO_4121 )
      ( MAKE-ON-VERIFY ?AUTO_4120 ?AUTO_4121 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4124 - BLOCK
      ?AUTO_4125 - BLOCK
    )
    :vars
    (
      ?AUTO_4126 - BLOCK
      ?AUTO_4127 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4125 ) ( not ( = ?AUTO_4124 ?AUTO_4125 ) ) ( ON ?AUTO_4124 ?AUTO_4126 ) ( not ( = ?AUTO_4124 ?AUTO_4126 ) ) ( not ( = ?AUTO_4125 ?AUTO_4126 ) ) ( not ( = ?AUTO_4124 ?AUTO_4127 ) ) ( not ( = ?AUTO_4125 ?AUTO_4127 ) ) ( not ( = ?AUTO_4126 ?AUTO_4127 ) ) ( ON ?AUTO_4127 ?AUTO_4124 ) ( CLEAR ?AUTO_4127 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4127 ?AUTO_4124 )
      ( MAKE-ON ?AUTO_4124 ?AUTO_4125 )
      ( MAKE-ON-VERIFY ?AUTO_4124 ?AUTO_4125 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4128 - BLOCK
      ?AUTO_4129 - BLOCK
    )
    :vars
    (
      ?AUTO_4130 - BLOCK
      ?AUTO_4131 - BLOCK
      ?AUTO_4132 - BLOCK
      ?AUTO_4133 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4129 ) ( not ( = ?AUTO_4128 ?AUTO_4129 ) ) ( ON ?AUTO_4128 ?AUTO_4130 ) ( not ( = ?AUTO_4128 ?AUTO_4130 ) ) ( not ( = ?AUTO_4129 ?AUTO_4130 ) ) ( not ( = ?AUTO_4128 ?AUTO_4131 ) ) ( not ( = ?AUTO_4129 ?AUTO_4131 ) ) ( not ( = ?AUTO_4130 ?AUTO_4131 ) ) ( ON ?AUTO_4131 ?AUTO_4128 ) ( CLEAR ?AUTO_4131 ) ( HOLDING ?AUTO_4132 ) ( CLEAR ?AUTO_4133 ) ( not ( = ?AUTO_4128 ?AUTO_4132 ) ) ( not ( = ?AUTO_4128 ?AUTO_4133 ) ) ( not ( = ?AUTO_4129 ?AUTO_4132 ) ) ( not ( = ?AUTO_4129 ?AUTO_4133 ) ) ( not ( = ?AUTO_4130 ?AUTO_4132 ) ) ( not ( = ?AUTO_4130 ?AUTO_4133 ) ) ( not ( = ?AUTO_4131 ?AUTO_4132 ) ) ( not ( = ?AUTO_4131 ?AUTO_4133 ) ) ( not ( = ?AUTO_4132 ?AUTO_4133 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4132 ?AUTO_4133 )
      ( MAKE-ON ?AUTO_4128 ?AUTO_4129 )
      ( MAKE-ON-VERIFY ?AUTO_4128 ?AUTO_4129 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4134 - BLOCK
      ?AUTO_4135 - BLOCK
    )
    :vars
    (
      ?AUTO_4136 - BLOCK
      ?AUTO_4137 - BLOCK
      ?AUTO_4139 - BLOCK
      ?AUTO_4138 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4134 ?AUTO_4135 ) ) ( ON ?AUTO_4134 ?AUTO_4136 ) ( not ( = ?AUTO_4134 ?AUTO_4136 ) ) ( not ( = ?AUTO_4135 ?AUTO_4136 ) ) ( not ( = ?AUTO_4134 ?AUTO_4137 ) ) ( not ( = ?AUTO_4135 ?AUTO_4137 ) ) ( not ( = ?AUTO_4136 ?AUTO_4137 ) ) ( ON ?AUTO_4137 ?AUTO_4134 ) ( CLEAR ?AUTO_4137 ) ( CLEAR ?AUTO_4139 ) ( not ( = ?AUTO_4134 ?AUTO_4138 ) ) ( not ( = ?AUTO_4134 ?AUTO_4139 ) ) ( not ( = ?AUTO_4135 ?AUTO_4138 ) ) ( not ( = ?AUTO_4135 ?AUTO_4139 ) ) ( not ( = ?AUTO_4136 ?AUTO_4138 ) ) ( not ( = ?AUTO_4136 ?AUTO_4139 ) ) ( not ( = ?AUTO_4137 ?AUTO_4138 ) ) ( not ( = ?AUTO_4137 ?AUTO_4139 ) ) ( not ( = ?AUTO_4138 ?AUTO_4139 ) ) ( ON ?AUTO_4138 ?AUTO_4135 ) ( CLEAR ?AUTO_4138 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4138 ?AUTO_4135 )
      ( MAKE-ON ?AUTO_4134 ?AUTO_4135 )
      ( MAKE-ON-VERIFY ?AUTO_4134 ?AUTO_4135 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4140 - BLOCK
      ?AUTO_4141 - BLOCK
    )
    :vars
    (
      ?AUTO_4142 - BLOCK
      ?AUTO_4145 - BLOCK
      ?AUTO_4144 - BLOCK
      ?AUTO_4143 - BLOCK
      ?AUTO_4146 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4140 ?AUTO_4141 ) ) ( ON ?AUTO_4140 ?AUTO_4142 ) ( not ( = ?AUTO_4140 ?AUTO_4142 ) ) ( not ( = ?AUTO_4141 ?AUTO_4142 ) ) ( not ( = ?AUTO_4140 ?AUTO_4145 ) ) ( not ( = ?AUTO_4141 ?AUTO_4145 ) ) ( not ( = ?AUTO_4142 ?AUTO_4145 ) ) ( ON ?AUTO_4145 ?AUTO_4140 ) ( CLEAR ?AUTO_4145 ) ( not ( = ?AUTO_4140 ?AUTO_4144 ) ) ( not ( = ?AUTO_4140 ?AUTO_4143 ) ) ( not ( = ?AUTO_4141 ?AUTO_4144 ) ) ( not ( = ?AUTO_4141 ?AUTO_4143 ) ) ( not ( = ?AUTO_4142 ?AUTO_4144 ) ) ( not ( = ?AUTO_4142 ?AUTO_4143 ) ) ( not ( = ?AUTO_4145 ?AUTO_4144 ) ) ( not ( = ?AUTO_4145 ?AUTO_4143 ) ) ( not ( = ?AUTO_4144 ?AUTO_4143 ) ) ( ON ?AUTO_4144 ?AUTO_4141 ) ( CLEAR ?AUTO_4144 ) ( HOLDING ?AUTO_4143 ) ( CLEAR ?AUTO_4146 ) ( not ( = ?AUTO_4140 ?AUTO_4146 ) ) ( not ( = ?AUTO_4141 ?AUTO_4146 ) ) ( not ( = ?AUTO_4142 ?AUTO_4146 ) ) ( not ( = ?AUTO_4145 ?AUTO_4146 ) ) ( not ( = ?AUTO_4144 ?AUTO_4146 ) ) ( not ( = ?AUTO_4143 ?AUTO_4146 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4143 ?AUTO_4146 )
      ( MAKE-ON ?AUTO_4140 ?AUTO_4141 )
      ( MAKE-ON-VERIFY ?AUTO_4140 ?AUTO_4141 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4147 - BLOCK
      ?AUTO_4148 - BLOCK
    )
    :vars
    (
      ?AUTO_4151 - BLOCK
      ?AUTO_4150 - BLOCK
      ?AUTO_4152 - BLOCK
      ?AUTO_4149 - BLOCK
      ?AUTO_4153 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4147 ?AUTO_4148 ) ) ( ON ?AUTO_4147 ?AUTO_4151 ) ( not ( = ?AUTO_4147 ?AUTO_4151 ) ) ( not ( = ?AUTO_4148 ?AUTO_4151 ) ) ( not ( = ?AUTO_4147 ?AUTO_4150 ) ) ( not ( = ?AUTO_4148 ?AUTO_4150 ) ) ( not ( = ?AUTO_4151 ?AUTO_4150 ) ) ( ON ?AUTO_4150 ?AUTO_4147 ) ( not ( = ?AUTO_4147 ?AUTO_4152 ) ) ( not ( = ?AUTO_4147 ?AUTO_4149 ) ) ( not ( = ?AUTO_4148 ?AUTO_4152 ) ) ( not ( = ?AUTO_4148 ?AUTO_4149 ) ) ( not ( = ?AUTO_4151 ?AUTO_4152 ) ) ( not ( = ?AUTO_4151 ?AUTO_4149 ) ) ( not ( = ?AUTO_4150 ?AUTO_4152 ) ) ( not ( = ?AUTO_4150 ?AUTO_4149 ) ) ( not ( = ?AUTO_4152 ?AUTO_4149 ) ) ( ON ?AUTO_4152 ?AUTO_4148 ) ( CLEAR ?AUTO_4152 ) ( CLEAR ?AUTO_4153 ) ( not ( = ?AUTO_4147 ?AUTO_4153 ) ) ( not ( = ?AUTO_4148 ?AUTO_4153 ) ) ( not ( = ?AUTO_4151 ?AUTO_4153 ) ) ( not ( = ?AUTO_4150 ?AUTO_4153 ) ) ( not ( = ?AUTO_4152 ?AUTO_4153 ) ) ( not ( = ?AUTO_4149 ?AUTO_4153 ) ) ( ON ?AUTO_4149 ?AUTO_4150 ) ( CLEAR ?AUTO_4149 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4149 ?AUTO_4150 )
      ( MAKE-ON ?AUTO_4147 ?AUTO_4148 )
      ( MAKE-ON-VERIFY ?AUTO_4147 ?AUTO_4148 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4154 - BLOCK
      ?AUTO_4155 - BLOCK
    )
    :vars
    (
      ?AUTO_4159 - BLOCK
      ?AUTO_4156 - BLOCK
      ?AUTO_4158 - BLOCK
      ?AUTO_4157 - BLOCK
      ?AUTO_4160 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4154 ?AUTO_4155 ) ) ( ON ?AUTO_4154 ?AUTO_4159 ) ( not ( = ?AUTO_4154 ?AUTO_4159 ) ) ( not ( = ?AUTO_4155 ?AUTO_4159 ) ) ( not ( = ?AUTO_4154 ?AUTO_4156 ) ) ( not ( = ?AUTO_4155 ?AUTO_4156 ) ) ( not ( = ?AUTO_4159 ?AUTO_4156 ) ) ( ON ?AUTO_4156 ?AUTO_4154 ) ( not ( = ?AUTO_4154 ?AUTO_4158 ) ) ( not ( = ?AUTO_4154 ?AUTO_4157 ) ) ( not ( = ?AUTO_4155 ?AUTO_4158 ) ) ( not ( = ?AUTO_4155 ?AUTO_4157 ) ) ( not ( = ?AUTO_4159 ?AUTO_4158 ) ) ( not ( = ?AUTO_4159 ?AUTO_4157 ) ) ( not ( = ?AUTO_4156 ?AUTO_4158 ) ) ( not ( = ?AUTO_4156 ?AUTO_4157 ) ) ( not ( = ?AUTO_4158 ?AUTO_4157 ) ) ( ON ?AUTO_4158 ?AUTO_4155 ) ( CLEAR ?AUTO_4158 ) ( not ( = ?AUTO_4154 ?AUTO_4160 ) ) ( not ( = ?AUTO_4155 ?AUTO_4160 ) ) ( not ( = ?AUTO_4159 ?AUTO_4160 ) ) ( not ( = ?AUTO_4156 ?AUTO_4160 ) ) ( not ( = ?AUTO_4158 ?AUTO_4160 ) ) ( not ( = ?AUTO_4157 ?AUTO_4160 ) ) ( ON ?AUTO_4157 ?AUTO_4156 ) ( CLEAR ?AUTO_4157 ) ( HOLDING ?AUTO_4160 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4160 )
      ( MAKE-ON ?AUTO_4154 ?AUTO_4155 )
      ( MAKE-ON-VERIFY ?AUTO_4154 ?AUTO_4155 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4161 - BLOCK
      ?AUTO_4162 - BLOCK
    )
    :vars
    (
      ?AUTO_4165 - BLOCK
      ?AUTO_4166 - BLOCK
      ?AUTO_4167 - BLOCK
      ?AUTO_4163 - BLOCK
      ?AUTO_4164 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4161 ?AUTO_4162 ) ) ( ON ?AUTO_4161 ?AUTO_4165 ) ( not ( = ?AUTO_4161 ?AUTO_4165 ) ) ( not ( = ?AUTO_4162 ?AUTO_4165 ) ) ( not ( = ?AUTO_4161 ?AUTO_4166 ) ) ( not ( = ?AUTO_4162 ?AUTO_4166 ) ) ( not ( = ?AUTO_4165 ?AUTO_4166 ) ) ( ON ?AUTO_4166 ?AUTO_4161 ) ( not ( = ?AUTO_4161 ?AUTO_4167 ) ) ( not ( = ?AUTO_4161 ?AUTO_4163 ) ) ( not ( = ?AUTO_4162 ?AUTO_4167 ) ) ( not ( = ?AUTO_4162 ?AUTO_4163 ) ) ( not ( = ?AUTO_4165 ?AUTO_4167 ) ) ( not ( = ?AUTO_4165 ?AUTO_4163 ) ) ( not ( = ?AUTO_4166 ?AUTO_4167 ) ) ( not ( = ?AUTO_4166 ?AUTO_4163 ) ) ( not ( = ?AUTO_4167 ?AUTO_4163 ) ) ( ON ?AUTO_4167 ?AUTO_4162 ) ( CLEAR ?AUTO_4167 ) ( not ( = ?AUTO_4161 ?AUTO_4164 ) ) ( not ( = ?AUTO_4162 ?AUTO_4164 ) ) ( not ( = ?AUTO_4165 ?AUTO_4164 ) ) ( not ( = ?AUTO_4166 ?AUTO_4164 ) ) ( not ( = ?AUTO_4167 ?AUTO_4164 ) ) ( not ( = ?AUTO_4163 ?AUTO_4164 ) ) ( ON ?AUTO_4163 ?AUTO_4166 ) ( ON ?AUTO_4164 ?AUTO_4163 ) ( CLEAR ?AUTO_4164 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4164 ?AUTO_4163 )
      ( MAKE-ON ?AUTO_4161 ?AUTO_4162 )
      ( MAKE-ON-VERIFY ?AUTO_4161 ?AUTO_4162 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4170 - BLOCK
      ?AUTO_4171 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4170 ) ( CLEAR ?AUTO_4171 ) ( not ( = ?AUTO_4170 ?AUTO_4171 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4170 ?AUTO_4171 )
      ( MAKE-ON-VERIFY ?AUTO_4170 ?AUTO_4171 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4172 - BLOCK
      ?AUTO_4173 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4173 ) ( not ( = ?AUTO_4172 ?AUTO_4173 ) ) ( ON-TABLE ?AUTO_4172 ) ( CLEAR ?AUTO_4172 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_4172 )
      ( MAKE-ON ?AUTO_4172 ?AUTO_4173 )
      ( MAKE-ON-VERIFY ?AUTO_4172 ?AUTO_4173 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4174 - BLOCK
      ?AUTO_4175 - BLOCK
    )
    :vars
    (
      ?AUTO_4176 - BLOCK
      ?AUTO_4177 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4175 ) ( not ( = ?AUTO_4174 ?AUTO_4175 ) ) ( ON-TABLE ?AUTO_4174 ) ( CLEAR ?AUTO_4174 ) ( HOLDING ?AUTO_4176 ) ( CLEAR ?AUTO_4177 ) ( not ( = ?AUTO_4174 ?AUTO_4176 ) ) ( not ( = ?AUTO_4174 ?AUTO_4177 ) ) ( not ( = ?AUTO_4175 ?AUTO_4176 ) ) ( not ( = ?AUTO_4175 ?AUTO_4177 ) ) ( not ( = ?AUTO_4176 ?AUTO_4177 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4176 ?AUTO_4177 )
      ( MAKE-ON ?AUTO_4174 ?AUTO_4175 )
      ( MAKE-ON-VERIFY ?AUTO_4174 ?AUTO_4175 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4178 - BLOCK
      ?AUTO_4179 - BLOCK
    )
    :vars
    (
      ?AUTO_4180 - BLOCK
      ?AUTO_4181 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4179 ) ( not ( = ?AUTO_4178 ?AUTO_4179 ) ) ( ON-TABLE ?AUTO_4178 ) ( CLEAR ?AUTO_4180 ) ( not ( = ?AUTO_4178 ?AUTO_4181 ) ) ( not ( = ?AUTO_4178 ?AUTO_4180 ) ) ( not ( = ?AUTO_4179 ?AUTO_4181 ) ) ( not ( = ?AUTO_4179 ?AUTO_4180 ) ) ( not ( = ?AUTO_4181 ?AUTO_4180 ) ) ( ON ?AUTO_4181 ?AUTO_4178 ) ( CLEAR ?AUTO_4181 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4181 ?AUTO_4178 )
      ( MAKE-ON ?AUTO_4178 ?AUTO_4179 )
      ( MAKE-ON-VERIFY ?AUTO_4178 ?AUTO_4179 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4182 - BLOCK
      ?AUTO_4183 - BLOCK
    )
    :vars
    (
      ?AUTO_4185 - BLOCK
      ?AUTO_4184 - BLOCK
      ?AUTO_4186 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4183 ) ( not ( = ?AUTO_4182 ?AUTO_4183 ) ) ( ON-TABLE ?AUTO_4182 ) ( CLEAR ?AUTO_4185 ) ( not ( = ?AUTO_4182 ?AUTO_4184 ) ) ( not ( = ?AUTO_4182 ?AUTO_4185 ) ) ( not ( = ?AUTO_4183 ?AUTO_4184 ) ) ( not ( = ?AUTO_4183 ?AUTO_4185 ) ) ( not ( = ?AUTO_4184 ?AUTO_4185 ) ) ( ON ?AUTO_4184 ?AUTO_4182 ) ( CLEAR ?AUTO_4184 ) ( HOLDING ?AUTO_4186 ) ( not ( = ?AUTO_4182 ?AUTO_4186 ) ) ( not ( = ?AUTO_4183 ?AUTO_4186 ) ) ( not ( = ?AUTO_4185 ?AUTO_4186 ) ) ( not ( = ?AUTO_4184 ?AUTO_4186 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4186 )
      ( MAKE-ON ?AUTO_4182 ?AUTO_4183 )
      ( MAKE-ON-VERIFY ?AUTO_4182 ?AUTO_4183 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4187 - BLOCK
      ?AUTO_4188 - BLOCK
    )
    :vars
    (
      ?AUTO_4191 - BLOCK
      ?AUTO_4190 - BLOCK
      ?AUTO_4189 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4188 ) ( not ( = ?AUTO_4187 ?AUTO_4188 ) ) ( ON-TABLE ?AUTO_4187 ) ( CLEAR ?AUTO_4191 ) ( not ( = ?AUTO_4187 ?AUTO_4190 ) ) ( not ( = ?AUTO_4187 ?AUTO_4191 ) ) ( not ( = ?AUTO_4188 ?AUTO_4190 ) ) ( not ( = ?AUTO_4188 ?AUTO_4191 ) ) ( not ( = ?AUTO_4190 ?AUTO_4191 ) ) ( ON ?AUTO_4190 ?AUTO_4187 ) ( not ( = ?AUTO_4187 ?AUTO_4189 ) ) ( not ( = ?AUTO_4188 ?AUTO_4189 ) ) ( not ( = ?AUTO_4191 ?AUTO_4189 ) ) ( not ( = ?AUTO_4190 ?AUTO_4189 ) ) ( ON ?AUTO_4189 ?AUTO_4190 ) ( CLEAR ?AUTO_4189 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4189 ?AUTO_4190 )
      ( MAKE-ON ?AUTO_4187 ?AUTO_4188 )
      ( MAKE-ON-VERIFY ?AUTO_4187 ?AUTO_4188 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4192 - BLOCK
      ?AUTO_4193 - BLOCK
    )
    :vars
    (
      ?AUTO_4196 - BLOCK
      ?AUTO_4194 - BLOCK
      ?AUTO_4195 - BLOCK
      ?AUTO_4197 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4192 ?AUTO_4193 ) ) ( ON-TABLE ?AUTO_4192 ) ( CLEAR ?AUTO_4196 ) ( not ( = ?AUTO_4192 ?AUTO_4194 ) ) ( not ( = ?AUTO_4192 ?AUTO_4196 ) ) ( not ( = ?AUTO_4193 ?AUTO_4194 ) ) ( not ( = ?AUTO_4193 ?AUTO_4196 ) ) ( not ( = ?AUTO_4194 ?AUTO_4196 ) ) ( ON ?AUTO_4194 ?AUTO_4192 ) ( not ( = ?AUTO_4192 ?AUTO_4195 ) ) ( not ( = ?AUTO_4193 ?AUTO_4195 ) ) ( not ( = ?AUTO_4196 ?AUTO_4195 ) ) ( not ( = ?AUTO_4194 ?AUTO_4195 ) ) ( ON ?AUTO_4195 ?AUTO_4194 ) ( CLEAR ?AUTO_4195 ) ( HOLDING ?AUTO_4193 ) ( CLEAR ?AUTO_4197 ) ( not ( = ?AUTO_4192 ?AUTO_4197 ) ) ( not ( = ?AUTO_4193 ?AUTO_4197 ) ) ( not ( = ?AUTO_4196 ?AUTO_4197 ) ) ( not ( = ?AUTO_4194 ?AUTO_4197 ) ) ( not ( = ?AUTO_4195 ?AUTO_4197 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4193 ?AUTO_4197 )
      ( MAKE-ON ?AUTO_4192 ?AUTO_4193 )
      ( MAKE-ON-VERIFY ?AUTO_4192 ?AUTO_4193 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4200 - BLOCK
      ?AUTO_4201 - BLOCK
    )
    :vars
    (
      ?AUTO_4203 - BLOCK
      ?AUTO_4202 - BLOCK
      ?AUTO_4204 - BLOCK
      ?AUTO_4205 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4201 ) ( not ( = ?AUTO_4200 ?AUTO_4201 ) ) ( ON-TABLE ?AUTO_4200 ) ( not ( = ?AUTO_4200 ?AUTO_4203 ) ) ( not ( = ?AUTO_4200 ?AUTO_4202 ) ) ( not ( = ?AUTO_4201 ?AUTO_4203 ) ) ( not ( = ?AUTO_4201 ?AUTO_4202 ) ) ( not ( = ?AUTO_4203 ?AUTO_4202 ) ) ( ON ?AUTO_4203 ?AUTO_4200 ) ( not ( = ?AUTO_4200 ?AUTO_4204 ) ) ( not ( = ?AUTO_4201 ?AUTO_4204 ) ) ( not ( = ?AUTO_4202 ?AUTO_4204 ) ) ( not ( = ?AUTO_4203 ?AUTO_4204 ) ) ( ON ?AUTO_4204 ?AUTO_4203 ) ( CLEAR ?AUTO_4204 ) ( HOLDING ?AUTO_4202 ) ( CLEAR ?AUTO_4205 ) ( not ( = ?AUTO_4200 ?AUTO_4205 ) ) ( not ( = ?AUTO_4201 ?AUTO_4205 ) ) ( not ( = ?AUTO_4203 ?AUTO_4205 ) ) ( not ( = ?AUTO_4202 ?AUTO_4205 ) ) ( not ( = ?AUTO_4204 ?AUTO_4205 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4202 ?AUTO_4205 )
      ( MAKE-ON ?AUTO_4200 ?AUTO_4201 )
      ( MAKE-ON-VERIFY ?AUTO_4200 ?AUTO_4201 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4206 - BLOCK
      ?AUTO_4207 - BLOCK
    )
    :vars
    (
      ?AUTO_4209 - BLOCK
      ?AUTO_4211 - BLOCK
      ?AUTO_4210 - BLOCK
      ?AUTO_4208 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4207 ) ( not ( = ?AUTO_4206 ?AUTO_4207 ) ) ( ON-TABLE ?AUTO_4206 ) ( not ( = ?AUTO_4206 ?AUTO_4209 ) ) ( not ( = ?AUTO_4206 ?AUTO_4211 ) ) ( not ( = ?AUTO_4207 ?AUTO_4209 ) ) ( not ( = ?AUTO_4207 ?AUTO_4211 ) ) ( not ( = ?AUTO_4209 ?AUTO_4211 ) ) ( ON ?AUTO_4209 ?AUTO_4206 ) ( not ( = ?AUTO_4206 ?AUTO_4210 ) ) ( not ( = ?AUTO_4207 ?AUTO_4210 ) ) ( not ( = ?AUTO_4211 ?AUTO_4210 ) ) ( not ( = ?AUTO_4209 ?AUTO_4210 ) ) ( ON ?AUTO_4210 ?AUTO_4209 ) ( CLEAR ?AUTO_4208 ) ( not ( = ?AUTO_4206 ?AUTO_4208 ) ) ( not ( = ?AUTO_4207 ?AUTO_4208 ) ) ( not ( = ?AUTO_4209 ?AUTO_4208 ) ) ( not ( = ?AUTO_4211 ?AUTO_4208 ) ) ( not ( = ?AUTO_4210 ?AUTO_4208 ) ) ( ON ?AUTO_4211 ?AUTO_4210 ) ( CLEAR ?AUTO_4211 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4211 ?AUTO_4210 )
      ( MAKE-ON ?AUTO_4206 ?AUTO_4207 )
      ( MAKE-ON-VERIFY ?AUTO_4206 ?AUTO_4207 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4212 - BLOCK
      ?AUTO_4213 - BLOCK
    )
    :vars
    (
      ?AUTO_4216 - BLOCK
      ?AUTO_4214 - BLOCK
      ?AUTO_4215 - BLOCK
      ?AUTO_4217 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4213 ) ( not ( = ?AUTO_4212 ?AUTO_4213 ) ) ( ON-TABLE ?AUTO_4212 ) ( not ( = ?AUTO_4212 ?AUTO_4216 ) ) ( not ( = ?AUTO_4212 ?AUTO_4214 ) ) ( not ( = ?AUTO_4213 ?AUTO_4216 ) ) ( not ( = ?AUTO_4213 ?AUTO_4214 ) ) ( not ( = ?AUTO_4216 ?AUTO_4214 ) ) ( ON ?AUTO_4216 ?AUTO_4212 ) ( not ( = ?AUTO_4212 ?AUTO_4215 ) ) ( not ( = ?AUTO_4213 ?AUTO_4215 ) ) ( not ( = ?AUTO_4214 ?AUTO_4215 ) ) ( not ( = ?AUTO_4216 ?AUTO_4215 ) ) ( ON ?AUTO_4215 ?AUTO_4216 ) ( not ( = ?AUTO_4212 ?AUTO_4217 ) ) ( not ( = ?AUTO_4213 ?AUTO_4217 ) ) ( not ( = ?AUTO_4216 ?AUTO_4217 ) ) ( not ( = ?AUTO_4214 ?AUTO_4217 ) ) ( not ( = ?AUTO_4215 ?AUTO_4217 ) ) ( ON ?AUTO_4214 ?AUTO_4215 ) ( CLEAR ?AUTO_4214 ) ( HOLDING ?AUTO_4217 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4217 )
      ( MAKE-ON ?AUTO_4212 ?AUTO_4213 )
      ( MAKE-ON-VERIFY ?AUTO_4212 ?AUTO_4213 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4218 - BLOCK
      ?AUTO_4219 - BLOCK
    )
    :vars
    (
      ?AUTO_4223 - BLOCK
      ?AUTO_4221 - BLOCK
      ?AUTO_4222 - BLOCK
      ?AUTO_4220 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4219 ) ( not ( = ?AUTO_4218 ?AUTO_4219 ) ) ( ON-TABLE ?AUTO_4218 ) ( not ( = ?AUTO_4218 ?AUTO_4223 ) ) ( not ( = ?AUTO_4218 ?AUTO_4221 ) ) ( not ( = ?AUTO_4219 ?AUTO_4223 ) ) ( not ( = ?AUTO_4219 ?AUTO_4221 ) ) ( not ( = ?AUTO_4223 ?AUTO_4221 ) ) ( ON ?AUTO_4223 ?AUTO_4218 ) ( not ( = ?AUTO_4218 ?AUTO_4222 ) ) ( not ( = ?AUTO_4219 ?AUTO_4222 ) ) ( not ( = ?AUTO_4221 ?AUTO_4222 ) ) ( not ( = ?AUTO_4223 ?AUTO_4222 ) ) ( ON ?AUTO_4222 ?AUTO_4223 ) ( not ( = ?AUTO_4218 ?AUTO_4220 ) ) ( not ( = ?AUTO_4219 ?AUTO_4220 ) ) ( not ( = ?AUTO_4223 ?AUTO_4220 ) ) ( not ( = ?AUTO_4221 ?AUTO_4220 ) ) ( not ( = ?AUTO_4222 ?AUTO_4220 ) ) ( ON ?AUTO_4221 ?AUTO_4222 ) ( ON ?AUTO_4220 ?AUTO_4221 ) ( CLEAR ?AUTO_4220 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4220 ?AUTO_4221 )
      ( MAKE-ON ?AUTO_4218 ?AUTO_4219 )
      ( MAKE-ON-VERIFY ?AUTO_4218 ?AUTO_4219 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4226 - BLOCK
      ?AUTO_4227 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4226 ) ( CLEAR ?AUTO_4227 ) ( not ( = ?AUTO_4226 ?AUTO_4227 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4226 ?AUTO_4227 )
      ( MAKE-ON-VERIFY ?AUTO_4226 ?AUTO_4227 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4228 - BLOCK
      ?AUTO_4229 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4229 ) ( not ( = ?AUTO_4228 ?AUTO_4229 ) ) ( ON-TABLE ?AUTO_4228 ) ( CLEAR ?AUTO_4228 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_4228 )
      ( MAKE-ON ?AUTO_4228 ?AUTO_4229 )
      ( MAKE-ON-VERIFY ?AUTO_4228 ?AUTO_4229 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4230 - BLOCK
      ?AUTO_4231 - BLOCK
    )
    :vars
    (
      ?AUTO_4232 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4230 ?AUTO_4231 ) ) ( ON-TABLE ?AUTO_4230 ) ( CLEAR ?AUTO_4230 ) ( HOLDING ?AUTO_4231 ) ( CLEAR ?AUTO_4232 ) ( not ( = ?AUTO_4230 ?AUTO_4232 ) ) ( not ( = ?AUTO_4231 ?AUTO_4232 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4231 ?AUTO_4232 )
      ( MAKE-ON ?AUTO_4230 ?AUTO_4231 )
      ( MAKE-ON-VERIFY ?AUTO_4230 ?AUTO_4231 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4237 - BLOCK
      ?AUTO_4238 - BLOCK
    )
    :vars
    (
      ?AUTO_4240 - BLOCK
      ?AUTO_4239 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4237 ?AUTO_4238 ) ) ( ON-TABLE ?AUTO_4237 ) ( CLEAR ?AUTO_4237 ) ( CLEAR ?AUTO_4240 ) ( not ( = ?AUTO_4237 ?AUTO_4239 ) ) ( not ( = ?AUTO_4237 ?AUTO_4240 ) ) ( not ( = ?AUTO_4238 ?AUTO_4239 ) ) ( not ( = ?AUTO_4238 ?AUTO_4240 ) ) ( not ( = ?AUTO_4239 ?AUTO_4240 ) ) ( ON ?AUTO_4239 ?AUTO_4238 ) ( CLEAR ?AUTO_4239 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4239 ?AUTO_4238 )
      ( MAKE-ON ?AUTO_4237 ?AUTO_4238 )
      ( MAKE-ON-VERIFY ?AUTO_4237 ?AUTO_4238 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4241 - BLOCK
      ?AUTO_4242 - BLOCK
    )
    :vars
    (
      ?AUTO_4244 - BLOCK
      ?AUTO_4243 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4241 ?AUTO_4242 ) ) ( CLEAR ?AUTO_4244 ) ( not ( = ?AUTO_4241 ?AUTO_4243 ) ) ( not ( = ?AUTO_4241 ?AUTO_4244 ) ) ( not ( = ?AUTO_4242 ?AUTO_4243 ) ) ( not ( = ?AUTO_4242 ?AUTO_4244 ) ) ( not ( = ?AUTO_4243 ?AUTO_4244 ) ) ( ON ?AUTO_4243 ?AUTO_4242 ) ( CLEAR ?AUTO_4243 ) ( HOLDING ?AUTO_4241 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4241 )
      ( MAKE-ON ?AUTO_4241 ?AUTO_4242 )
      ( MAKE-ON-VERIFY ?AUTO_4241 ?AUTO_4242 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4245 - BLOCK
      ?AUTO_4246 - BLOCK
    )
    :vars
    (
      ?AUTO_4248 - BLOCK
      ?AUTO_4247 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4245 ?AUTO_4246 ) ) ( CLEAR ?AUTO_4248 ) ( not ( = ?AUTO_4245 ?AUTO_4247 ) ) ( not ( = ?AUTO_4245 ?AUTO_4248 ) ) ( not ( = ?AUTO_4246 ?AUTO_4247 ) ) ( not ( = ?AUTO_4246 ?AUTO_4248 ) ) ( not ( = ?AUTO_4247 ?AUTO_4248 ) ) ( ON ?AUTO_4247 ?AUTO_4246 ) ( ON ?AUTO_4245 ?AUTO_4247 ) ( CLEAR ?AUTO_4245 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4245 ?AUTO_4247 )
      ( MAKE-ON ?AUTO_4245 ?AUTO_4246 )
      ( MAKE-ON-VERIFY ?AUTO_4245 ?AUTO_4246 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4249 - BLOCK
      ?AUTO_4250 - BLOCK
    )
    :vars
    (
      ?AUTO_4252 - BLOCK
      ?AUTO_4251 - BLOCK
      ?AUTO_4253 - BLOCK
      ?AUTO_4254 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4249 ?AUTO_4250 ) ) ( CLEAR ?AUTO_4252 ) ( not ( = ?AUTO_4249 ?AUTO_4251 ) ) ( not ( = ?AUTO_4249 ?AUTO_4252 ) ) ( not ( = ?AUTO_4250 ?AUTO_4251 ) ) ( not ( = ?AUTO_4250 ?AUTO_4252 ) ) ( not ( = ?AUTO_4251 ?AUTO_4252 ) ) ( ON ?AUTO_4251 ?AUTO_4250 ) ( ON ?AUTO_4249 ?AUTO_4251 ) ( CLEAR ?AUTO_4249 ) ( HOLDING ?AUTO_4253 ) ( CLEAR ?AUTO_4254 ) ( not ( = ?AUTO_4249 ?AUTO_4253 ) ) ( not ( = ?AUTO_4249 ?AUTO_4254 ) ) ( not ( = ?AUTO_4250 ?AUTO_4253 ) ) ( not ( = ?AUTO_4250 ?AUTO_4254 ) ) ( not ( = ?AUTO_4252 ?AUTO_4253 ) ) ( not ( = ?AUTO_4252 ?AUTO_4254 ) ) ( not ( = ?AUTO_4251 ?AUTO_4253 ) ) ( not ( = ?AUTO_4251 ?AUTO_4254 ) ) ( not ( = ?AUTO_4253 ?AUTO_4254 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4253 ?AUTO_4254 )
      ( MAKE-ON ?AUTO_4249 ?AUTO_4250 )
      ( MAKE-ON-VERIFY ?AUTO_4249 ?AUTO_4250 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4259 - BLOCK
      ?AUTO_4260 - BLOCK
    )
    :vars
    (
      ?AUTO_4263 - BLOCK
      ?AUTO_4264 - BLOCK
      ?AUTO_4262 - BLOCK
      ?AUTO_4261 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4259 ?AUTO_4260 ) ) ( CLEAR ?AUTO_4263 ) ( not ( = ?AUTO_4259 ?AUTO_4264 ) ) ( not ( = ?AUTO_4259 ?AUTO_4263 ) ) ( not ( = ?AUTO_4260 ?AUTO_4264 ) ) ( not ( = ?AUTO_4260 ?AUTO_4263 ) ) ( not ( = ?AUTO_4264 ?AUTO_4263 ) ) ( ON ?AUTO_4264 ?AUTO_4260 ) ( ON ?AUTO_4259 ?AUTO_4264 ) ( CLEAR ?AUTO_4262 ) ( not ( = ?AUTO_4259 ?AUTO_4261 ) ) ( not ( = ?AUTO_4259 ?AUTO_4262 ) ) ( not ( = ?AUTO_4260 ?AUTO_4261 ) ) ( not ( = ?AUTO_4260 ?AUTO_4262 ) ) ( not ( = ?AUTO_4263 ?AUTO_4261 ) ) ( not ( = ?AUTO_4263 ?AUTO_4262 ) ) ( not ( = ?AUTO_4264 ?AUTO_4261 ) ) ( not ( = ?AUTO_4264 ?AUTO_4262 ) ) ( not ( = ?AUTO_4261 ?AUTO_4262 ) ) ( ON ?AUTO_4261 ?AUTO_4259 ) ( CLEAR ?AUTO_4261 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4261 ?AUTO_4259 )
      ( MAKE-ON ?AUTO_4259 ?AUTO_4260 )
      ( MAKE-ON-VERIFY ?AUTO_4259 ?AUTO_4260 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4265 - BLOCK
      ?AUTO_4266 - BLOCK
    )
    :vars
    (
      ?AUTO_4270 - BLOCK
      ?AUTO_4268 - BLOCK
      ?AUTO_4267 - BLOCK
      ?AUTO_4269 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4265 ?AUTO_4266 ) ) ( not ( = ?AUTO_4265 ?AUTO_4270 ) ) ( not ( = ?AUTO_4265 ?AUTO_4268 ) ) ( not ( = ?AUTO_4266 ?AUTO_4270 ) ) ( not ( = ?AUTO_4266 ?AUTO_4268 ) ) ( not ( = ?AUTO_4270 ?AUTO_4268 ) ) ( ON ?AUTO_4270 ?AUTO_4266 ) ( ON ?AUTO_4265 ?AUTO_4270 ) ( CLEAR ?AUTO_4267 ) ( not ( = ?AUTO_4265 ?AUTO_4269 ) ) ( not ( = ?AUTO_4265 ?AUTO_4267 ) ) ( not ( = ?AUTO_4266 ?AUTO_4269 ) ) ( not ( = ?AUTO_4266 ?AUTO_4267 ) ) ( not ( = ?AUTO_4268 ?AUTO_4269 ) ) ( not ( = ?AUTO_4268 ?AUTO_4267 ) ) ( not ( = ?AUTO_4270 ?AUTO_4269 ) ) ( not ( = ?AUTO_4270 ?AUTO_4267 ) ) ( not ( = ?AUTO_4269 ?AUTO_4267 ) ) ( ON ?AUTO_4269 ?AUTO_4265 ) ( CLEAR ?AUTO_4269 ) ( HOLDING ?AUTO_4268 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4268 )
      ( MAKE-ON ?AUTO_4265 ?AUTO_4266 )
      ( MAKE-ON-VERIFY ?AUTO_4265 ?AUTO_4266 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4271 - BLOCK
      ?AUTO_4272 - BLOCK
    )
    :vars
    (
      ?AUTO_4274 - BLOCK
      ?AUTO_4275 - BLOCK
      ?AUTO_4276 - BLOCK
      ?AUTO_4273 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4271 ?AUTO_4272 ) ) ( not ( = ?AUTO_4271 ?AUTO_4274 ) ) ( not ( = ?AUTO_4271 ?AUTO_4275 ) ) ( not ( = ?AUTO_4272 ?AUTO_4274 ) ) ( not ( = ?AUTO_4272 ?AUTO_4275 ) ) ( not ( = ?AUTO_4274 ?AUTO_4275 ) ) ( ON ?AUTO_4274 ?AUTO_4272 ) ( ON ?AUTO_4271 ?AUTO_4274 ) ( CLEAR ?AUTO_4276 ) ( not ( = ?AUTO_4271 ?AUTO_4273 ) ) ( not ( = ?AUTO_4271 ?AUTO_4276 ) ) ( not ( = ?AUTO_4272 ?AUTO_4273 ) ) ( not ( = ?AUTO_4272 ?AUTO_4276 ) ) ( not ( = ?AUTO_4275 ?AUTO_4273 ) ) ( not ( = ?AUTO_4275 ?AUTO_4276 ) ) ( not ( = ?AUTO_4274 ?AUTO_4273 ) ) ( not ( = ?AUTO_4274 ?AUTO_4276 ) ) ( not ( = ?AUTO_4273 ?AUTO_4276 ) ) ( ON ?AUTO_4273 ?AUTO_4271 ) ( ON ?AUTO_4275 ?AUTO_4273 ) ( CLEAR ?AUTO_4275 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4275 ?AUTO_4273 )
      ( MAKE-ON ?AUTO_4271 ?AUTO_4272 )
      ( MAKE-ON-VERIFY ?AUTO_4271 ?AUTO_4272 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4278 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4278 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4278 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4278 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4279 - BLOCK
    )
    :vars
    (
      ?AUTO_4280 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4279 ?AUTO_4280 ) ( CLEAR ?AUTO_4279 ) ( HAND-EMPTY ) ( not ( = ?AUTO_4279 ?AUTO_4280 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4279 ?AUTO_4280 )
      ( MAKE-ON-TABLE ?AUTO_4279 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4279 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4282 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4282 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4282 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4282 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4283 - BLOCK
    )
    :vars
    (
      ?AUTO_4284 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4283 ?AUTO_4284 ) ( CLEAR ?AUTO_4283 ) ( HAND-EMPTY ) ( not ( = ?AUTO_4283 ?AUTO_4284 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4283 ?AUTO_4284 )
      ( MAKE-ON-TABLE ?AUTO_4283 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4283 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4285 - BLOCK
    )
    :vars
    (
      ?AUTO_4286 - BLOCK
      ?AUTO_4287 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4285 ?AUTO_4286 ) ( CLEAR ?AUTO_4285 ) ( not ( = ?AUTO_4285 ?AUTO_4286 ) ) ( HOLDING ?AUTO_4287 ) ( not ( = ?AUTO_4285 ?AUTO_4287 ) ) ( not ( = ?AUTO_4286 ?AUTO_4287 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4287 )
      ( MAKE-ON-TABLE ?AUTO_4285 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4285 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4291 - BLOCK
      ?AUTO_4292 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4291 ) ( CLEAR ?AUTO_4292 ) ( not ( = ?AUTO_4291 ?AUTO_4292 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4291 ?AUTO_4292 )
      ( MAKE-ON-VERIFY ?AUTO_4291 ?AUTO_4292 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4293 - BLOCK
      ?AUTO_4294 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4294 ) ( not ( = ?AUTO_4293 ?AUTO_4294 ) ) ( ON-TABLE ?AUTO_4293 ) ( CLEAR ?AUTO_4293 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_4293 )
      ( MAKE-ON ?AUTO_4293 ?AUTO_4294 )
      ( MAKE-ON-VERIFY ?AUTO_4293 ?AUTO_4294 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4295 - BLOCK
      ?AUTO_4296 - BLOCK
    )
    :vars
    (
      ?AUTO_4297 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4296 ) ( not ( = ?AUTO_4295 ?AUTO_4296 ) ) ( ON-TABLE ?AUTO_4295 ) ( CLEAR ?AUTO_4295 ) ( HOLDING ?AUTO_4297 ) ( not ( = ?AUTO_4295 ?AUTO_4297 ) ) ( not ( = ?AUTO_4296 ?AUTO_4297 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4297 )
      ( MAKE-ON ?AUTO_4295 ?AUTO_4296 )
      ( MAKE-ON-VERIFY ?AUTO_4295 ?AUTO_4296 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4298 - BLOCK
      ?AUTO_4299 - BLOCK
    )
    :vars
    (
      ?AUTO_4300 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4298 ?AUTO_4299 ) ) ( ON-TABLE ?AUTO_4298 ) ( CLEAR ?AUTO_4298 ) ( not ( = ?AUTO_4298 ?AUTO_4300 ) ) ( not ( = ?AUTO_4299 ?AUTO_4300 ) ) ( ON ?AUTO_4300 ?AUTO_4299 ) ( CLEAR ?AUTO_4300 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4300 ?AUTO_4299 )
      ( MAKE-ON ?AUTO_4298 ?AUTO_4299 )
      ( MAKE-ON-VERIFY ?AUTO_4298 ?AUTO_4299 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4301 - BLOCK
      ?AUTO_4302 - BLOCK
    )
    :vars
    (
      ?AUTO_4303 - BLOCK
      ?AUTO_4304 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4301 ?AUTO_4302 ) ) ( ON-TABLE ?AUTO_4301 ) ( CLEAR ?AUTO_4301 ) ( not ( = ?AUTO_4301 ?AUTO_4303 ) ) ( not ( = ?AUTO_4302 ?AUTO_4303 ) ) ( ON ?AUTO_4303 ?AUTO_4302 ) ( CLEAR ?AUTO_4303 ) ( HOLDING ?AUTO_4304 ) ( not ( = ?AUTO_4301 ?AUTO_4304 ) ) ( not ( = ?AUTO_4302 ?AUTO_4304 ) ) ( not ( = ?AUTO_4303 ?AUTO_4304 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4304 )
      ( MAKE-ON ?AUTO_4301 ?AUTO_4302 )
      ( MAKE-ON-VERIFY ?AUTO_4301 ?AUTO_4302 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4309 - BLOCK
      ?AUTO_4310 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4309 ) ( CLEAR ?AUTO_4310 ) ( not ( = ?AUTO_4309 ?AUTO_4310 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4309 ?AUTO_4310 )
      ( MAKE-ON-VERIFY ?AUTO_4309 ?AUTO_4310 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4311 - BLOCK
      ?AUTO_4312 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4312 ) ( not ( = ?AUTO_4311 ?AUTO_4312 ) ) ( ON-TABLE ?AUTO_4311 ) ( CLEAR ?AUTO_4311 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_4311 )
      ( MAKE-ON ?AUTO_4311 ?AUTO_4312 )
      ( MAKE-ON-VERIFY ?AUTO_4311 ?AUTO_4312 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4313 - BLOCK
      ?AUTO_4314 - BLOCK
    )
    :vars
    (
      ?AUTO_4315 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4313 ?AUTO_4314 ) ) ( ON-TABLE ?AUTO_4313 ) ( CLEAR ?AUTO_4313 ) ( HOLDING ?AUTO_4314 ) ( CLEAR ?AUTO_4315 ) ( not ( = ?AUTO_4313 ?AUTO_4315 ) ) ( not ( = ?AUTO_4314 ?AUTO_4315 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4314 ?AUTO_4315 )
      ( MAKE-ON ?AUTO_4313 ?AUTO_4314 )
      ( MAKE-ON-VERIFY ?AUTO_4313 ?AUTO_4314 ) )
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
    ( and ( CLEAR ?AUTO_4325 ) ( not ( = ?AUTO_4324 ?AUTO_4325 ) ) ( ON-TABLE ?AUTO_4324 ) ( not ( = ?AUTO_4324 ?AUTO_4326 ) ) ( not ( = ?AUTO_4325 ?AUTO_4326 ) ) ( ON ?AUTO_4326 ?AUTO_4324 ) ( CLEAR ?AUTO_4326 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4326 ?AUTO_4324 )
      ( MAKE-ON ?AUTO_4324 ?AUTO_4325 )
      ( MAKE-ON-VERIFY ?AUTO_4324 ?AUTO_4325 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4328 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4328 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4328 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4328 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4329 - BLOCK
    )
    :vars
    (
      ?AUTO_4330 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4329 ?AUTO_4330 ) ( CLEAR ?AUTO_4329 ) ( HAND-EMPTY ) ( not ( = ?AUTO_4329 ?AUTO_4330 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4329 ?AUTO_4330 )
      ( MAKE-ON-TABLE ?AUTO_4329 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4329 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4331 - BLOCK
    )
    :vars
    (
      ?AUTO_4332 - BLOCK
      ?AUTO_4333 - BLOCK
      ?AUTO_4334 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4331 ?AUTO_4332 ) ( CLEAR ?AUTO_4331 ) ( not ( = ?AUTO_4331 ?AUTO_4332 ) ) ( HOLDING ?AUTO_4333 ) ( CLEAR ?AUTO_4334 ) ( not ( = ?AUTO_4331 ?AUTO_4333 ) ) ( not ( = ?AUTO_4331 ?AUTO_4334 ) ) ( not ( = ?AUTO_4332 ?AUTO_4333 ) ) ( not ( = ?AUTO_4332 ?AUTO_4334 ) ) ( not ( = ?AUTO_4333 ?AUTO_4334 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4333 ?AUTO_4334 )
      ( MAKE-ON-TABLE ?AUTO_4331 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4331 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4344 - BLOCK
      ?AUTO_4345 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4344 ) ( CLEAR ?AUTO_4345 ) ( not ( = ?AUTO_4344 ?AUTO_4345 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4344 ?AUTO_4345 )
      ( MAKE-ON-VERIFY ?AUTO_4344 ?AUTO_4345 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4346 - BLOCK
      ?AUTO_4347 - BLOCK
    )
    :vars
    (
      ?AUTO_4348 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4347 ) ( not ( = ?AUTO_4346 ?AUTO_4347 ) ) ( ON ?AUTO_4346 ?AUTO_4348 ) ( CLEAR ?AUTO_4346 ) ( HAND-EMPTY ) ( not ( = ?AUTO_4346 ?AUTO_4348 ) ) ( not ( = ?AUTO_4347 ?AUTO_4348 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4346 ?AUTO_4348 )
      ( MAKE-ON ?AUTO_4346 ?AUTO_4347 )
      ( MAKE-ON-VERIFY ?AUTO_4346 ?AUTO_4347 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4349 - BLOCK
      ?AUTO_4350 - BLOCK
    )
    :vars
    (
      ?AUTO_4351 - BLOCK
      ?AUTO_4352 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4350 ) ( not ( = ?AUTO_4349 ?AUTO_4350 ) ) ( ON ?AUTO_4349 ?AUTO_4351 ) ( CLEAR ?AUTO_4349 ) ( not ( = ?AUTO_4349 ?AUTO_4351 ) ) ( not ( = ?AUTO_4350 ?AUTO_4351 ) ) ( HOLDING ?AUTO_4352 ) ( not ( = ?AUTO_4349 ?AUTO_4352 ) ) ( not ( = ?AUTO_4350 ?AUTO_4352 ) ) ( not ( = ?AUTO_4351 ?AUTO_4352 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4352 )
      ( MAKE-ON ?AUTO_4349 ?AUTO_4350 )
      ( MAKE-ON-VERIFY ?AUTO_4349 ?AUTO_4350 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4353 - BLOCK
      ?AUTO_4354 - BLOCK
    )
    :vars
    (
      ?AUTO_4355 - BLOCK
      ?AUTO_4356 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4354 ) ( not ( = ?AUTO_4353 ?AUTO_4354 ) ) ( ON ?AUTO_4353 ?AUTO_4355 ) ( not ( = ?AUTO_4353 ?AUTO_4355 ) ) ( not ( = ?AUTO_4354 ?AUTO_4355 ) ) ( not ( = ?AUTO_4353 ?AUTO_4356 ) ) ( not ( = ?AUTO_4354 ?AUTO_4356 ) ) ( not ( = ?AUTO_4355 ?AUTO_4356 ) ) ( ON ?AUTO_4356 ?AUTO_4353 ) ( CLEAR ?AUTO_4356 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4356 ?AUTO_4353 )
      ( MAKE-ON ?AUTO_4353 ?AUTO_4354 )
      ( MAKE-ON-VERIFY ?AUTO_4353 ?AUTO_4354 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4357 - BLOCK
      ?AUTO_4358 - BLOCK
    )
    :vars
    (
      ?AUTO_4359 - BLOCK
      ?AUTO_4360 - BLOCK
      ?AUTO_4361 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4357 ?AUTO_4358 ) ) ( ON ?AUTO_4357 ?AUTO_4359 ) ( not ( = ?AUTO_4357 ?AUTO_4359 ) ) ( not ( = ?AUTO_4358 ?AUTO_4359 ) ) ( not ( = ?AUTO_4357 ?AUTO_4360 ) ) ( not ( = ?AUTO_4358 ?AUTO_4360 ) ) ( not ( = ?AUTO_4359 ?AUTO_4360 ) ) ( ON ?AUTO_4360 ?AUTO_4357 ) ( CLEAR ?AUTO_4360 ) ( HOLDING ?AUTO_4358 ) ( CLEAR ?AUTO_4361 ) ( not ( = ?AUTO_4357 ?AUTO_4361 ) ) ( not ( = ?AUTO_4358 ?AUTO_4361 ) ) ( not ( = ?AUTO_4359 ?AUTO_4361 ) ) ( not ( = ?AUTO_4360 ?AUTO_4361 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4358 ?AUTO_4361 )
      ( MAKE-ON ?AUTO_4357 ?AUTO_4358 )
      ( MAKE-ON-VERIFY ?AUTO_4357 ?AUTO_4358 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4364 - BLOCK
      ?AUTO_4365 - BLOCK
    )
    :vars
    (
      ?AUTO_4366 - BLOCK
      ?AUTO_4367 - BLOCK
      ?AUTO_4368 - BLOCK
      ?AUTO_4369 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4365 ) ( not ( = ?AUTO_4364 ?AUTO_4365 ) ) ( ON ?AUTO_4364 ?AUTO_4366 ) ( not ( = ?AUTO_4364 ?AUTO_4366 ) ) ( not ( = ?AUTO_4365 ?AUTO_4366 ) ) ( not ( = ?AUTO_4364 ?AUTO_4367 ) ) ( not ( = ?AUTO_4365 ?AUTO_4367 ) ) ( not ( = ?AUTO_4366 ?AUTO_4367 ) ) ( ON ?AUTO_4367 ?AUTO_4364 ) ( CLEAR ?AUTO_4367 ) ( HOLDING ?AUTO_4368 ) ( CLEAR ?AUTO_4369 ) ( not ( = ?AUTO_4364 ?AUTO_4368 ) ) ( not ( = ?AUTO_4364 ?AUTO_4369 ) ) ( not ( = ?AUTO_4365 ?AUTO_4368 ) ) ( not ( = ?AUTO_4365 ?AUTO_4369 ) ) ( not ( = ?AUTO_4366 ?AUTO_4368 ) ) ( not ( = ?AUTO_4366 ?AUTO_4369 ) ) ( not ( = ?AUTO_4367 ?AUTO_4368 ) ) ( not ( = ?AUTO_4367 ?AUTO_4369 ) ) ( not ( = ?AUTO_4368 ?AUTO_4369 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4368 ?AUTO_4369 )
      ( MAKE-ON ?AUTO_4364 ?AUTO_4365 )
      ( MAKE-ON-VERIFY ?AUTO_4364 ?AUTO_4365 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4378 - BLOCK
      ?AUTO_4379 - BLOCK
    )
    :vars
    (
      ?AUTO_4382 - BLOCK
      ?AUTO_4383 - BLOCK
      ?AUTO_4381 - BLOCK
      ?AUTO_4380 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4378 ?AUTO_4379 ) ) ( ON ?AUTO_4378 ?AUTO_4382 ) ( not ( = ?AUTO_4378 ?AUTO_4382 ) ) ( not ( = ?AUTO_4379 ?AUTO_4382 ) ) ( not ( = ?AUTO_4378 ?AUTO_4383 ) ) ( not ( = ?AUTO_4379 ?AUTO_4383 ) ) ( not ( = ?AUTO_4382 ?AUTO_4383 ) ) ( ON ?AUTO_4383 ?AUTO_4378 ) ( CLEAR ?AUTO_4383 ) ( CLEAR ?AUTO_4381 ) ( not ( = ?AUTO_4378 ?AUTO_4380 ) ) ( not ( = ?AUTO_4378 ?AUTO_4381 ) ) ( not ( = ?AUTO_4379 ?AUTO_4380 ) ) ( not ( = ?AUTO_4379 ?AUTO_4381 ) ) ( not ( = ?AUTO_4382 ?AUTO_4380 ) ) ( not ( = ?AUTO_4382 ?AUTO_4381 ) ) ( not ( = ?AUTO_4383 ?AUTO_4380 ) ) ( not ( = ?AUTO_4383 ?AUTO_4381 ) ) ( not ( = ?AUTO_4380 ?AUTO_4381 ) ) ( ON ?AUTO_4380 ?AUTO_4379 ) ( CLEAR ?AUTO_4380 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4380 ?AUTO_4379 )
      ( MAKE-ON ?AUTO_4378 ?AUTO_4379 )
      ( MAKE-ON-VERIFY ?AUTO_4378 ?AUTO_4379 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4385 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4385 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4385 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4385 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4386 - BLOCK
    )
    :vars
    (
      ?AUTO_4387 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4386 ?AUTO_4387 ) ( CLEAR ?AUTO_4386 ) ( HAND-EMPTY ) ( not ( = ?AUTO_4386 ?AUTO_4387 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4386 ?AUTO_4387 )
      ( MAKE-ON-TABLE ?AUTO_4386 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4386 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4388 - BLOCK
    )
    :vars
    (
      ?AUTO_4389 - BLOCK
      ?AUTO_4390 - BLOCK
      ?AUTO_4391 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4388 ?AUTO_4389 ) ( CLEAR ?AUTO_4388 ) ( not ( = ?AUTO_4388 ?AUTO_4389 ) ) ( HOLDING ?AUTO_4390 ) ( CLEAR ?AUTO_4391 ) ( not ( = ?AUTO_4388 ?AUTO_4390 ) ) ( not ( = ?AUTO_4388 ?AUTO_4391 ) ) ( not ( = ?AUTO_4389 ?AUTO_4390 ) ) ( not ( = ?AUTO_4389 ?AUTO_4391 ) ) ( not ( = ?AUTO_4390 ?AUTO_4391 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4390 ?AUTO_4391 )
      ( MAKE-ON-TABLE ?AUTO_4388 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4388 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4392 - BLOCK
    )
    :vars
    (
      ?AUTO_4393 - BLOCK
      ?AUTO_4395 - BLOCK
      ?AUTO_4394 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4392 ?AUTO_4393 ) ( not ( = ?AUTO_4392 ?AUTO_4393 ) ) ( CLEAR ?AUTO_4395 ) ( not ( = ?AUTO_4392 ?AUTO_4394 ) ) ( not ( = ?AUTO_4392 ?AUTO_4395 ) ) ( not ( = ?AUTO_4393 ?AUTO_4394 ) ) ( not ( = ?AUTO_4393 ?AUTO_4395 ) ) ( not ( = ?AUTO_4394 ?AUTO_4395 ) ) ( ON ?AUTO_4394 ?AUTO_4392 ) ( CLEAR ?AUTO_4394 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4394 ?AUTO_4392 )
      ( MAKE-ON-TABLE ?AUTO_4392 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4392 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4396 - BLOCK
    )
    :vars
    (
      ?AUTO_4398 - BLOCK
      ?AUTO_4399 - BLOCK
      ?AUTO_4397 - BLOCK
      ?AUTO_4400 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4396 ?AUTO_4398 ) ( not ( = ?AUTO_4396 ?AUTO_4398 ) ) ( CLEAR ?AUTO_4399 ) ( not ( = ?AUTO_4396 ?AUTO_4397 ) ) ( not ( = ?AUTO_4396 ?AUTO_4399 ) ) ( not ( = ?AUTO_4398 ?AUTO_4397 ) ) ( not ( = ?AUTO_4398 ?AUTO_4399 ) ) ( not ( = ?AUTO_4397 ?AUTO_4399 ) ) ( ON ?AUTO_4397 ?AUTO_4396 ) ( CLEAR ?AUTO_4397 ) ( HOLDING ?AUTO_4400 ) ( not ( = ?AUTO_4396 ?AUTO_4400 ) ) ( not ( = ?AUTO_4398 ?AUTO_4400 ) ) ( not ( = ?AUTO_4399 ?AUTO_4400 ) ) ( not ( = ?AUTO_4397 ?AUTO_4400 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4400 )
      ( MAKE-ON-TABLE ?AUTO_4396 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4396 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4401 - BLOCK
    )
    :vars
    (
      ?AUTO_4403 - BLOCK
      ?AUTO_4405 - BLOCK
      ?AUTO_4402 - BLOCK
      ?AUTO_4404 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4401 ?AUTO_4403 ) ( not ( = ?AUTO_4401 ?AUTO_4403 ) ) ( CLEAR ?AUTO_4405 ) ( not ( = ?AUTO_4401 ?AUTO_4402 ) ) ( not ( = ?AUTO_4401 ?AUTO_4405 ) ) ( not ( = ?AUTO_4403 ?AUTO_4402 ) ) ( not ( = ?AUTO_4403 ?AUTO_4405 ) ) ( not ( = ?AUTO_4402 ?AUTO_4405 ) ) ( ON ?AUTO_4402 ?AUTO_4401 ) ( not ( = ?AUTO_4401 ?AUTO_4404 ) ) ( not ( = ?AUTO_4403 ?AUTO_4404 ) ) ( not ( = ?AUTO_4405 ?AUTO_4404 ) ) ( not ( = ?AUTO_4402 ?AUTO_4404 ) ) ( ON ?AUTO_4404 ?AUTO_4402 ) ( CLEAR ?AUTO_4404 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4404 ?AUTO_4402 )
      ( MAKE-ON-TABLE ?AUTO_4401 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4401 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4406 - BLOCK
    )
    :vars
    (
      ?AUTO_4408 - BLOCK
      ?AUTO_4410 - BLOCK
      ?AUTO_4409 - BLOCK
      ?AUTO_4407 - BLOCK
      ?AUTO_4411 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4406 ?AUTO_4408 ) ( not ( = ?AUTO_4406 ?AUTO_4408 ) ) ( not ( = ?AUTO_4406 ?AUTO_4410 ) ) ( not ( = ?AUTO_4406 ?AUTO_4409 ) ) ( not ( = ?AUTO_4408 ?AUTO_4410 ) ) ( not ( = ?AUTO_4408 ?AUTO_4409 ) ) ( not ( = ?AUTO_4410 ?AUTO_4409 ) ) ( ON ?AUTO_4410 ?AUTO_4406 ) ( not ( = ?AUTO_4406 ?AUTO_4407 ) ) ( not ( = ?AUTO_4408 ?AUTO_4407 ) ) ( not ( = ?AUTO_4409 ?AUTO_4407 ) ) ( not ( = ?AUTO_4410 ?AUTO_4407 ) ) ( ON ?AUTO_4407 ?AUTO_4410 ) ( CLEAR ?AUTO_4407 ) ( HOLDING ?AUTO_4409 ) ( CLEAR ?AUTO_4411 ) ( not ( = ?AUTO_4406 ?AUTO_4411 ) ) ( not ( = ?AUTO_4408 ?AUTO_4411 ) ) ( not ( = ?AUTO_4410 ?AUTO_4411 ) ) ( not ( = ?AUTO_4409 ?AUTO_4411 ) ) ( not ( = ?AUTO_4407 ?AUTO_4411 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4409 ?AUTO_4411 )
      ( MAKE-ON-TABLE ?AUTO_4406 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4406 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4421 - BLOCK
      ?AUTO_4422 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4421 ) ( CLEAR ?AUTO_4422 ) ( not ( = ?AUTO_4421 ?AUTO_4422 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4421 ?AUTO_4422 )
      ( MAKE-ON-VERIFY ?AUTO_4421 ?AUTO_4422 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4423 - BLOCK
      ?AUTO_4424 - BLOCK
    )
    :vars
    (
      ?AUTO_4425 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4424 ) ( not ( = ?AUTO_4423 ?AUTO_4424 ) ) ( ON ?AUTO_4423 ?AUTO_4425 ) ( CLEAR ?AUTO_4423 ) ( HAND-EMPTY ) ( not ( = ?AUTO_4423 ?AUTO_4425 ) ) ( not ( = ?AUTO_4424 ?AUTO_4425 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4423 ?AUTO_4425 )
      ( MAKE-ON ?AUTO_4423 ?AUTO_4424 )
      ( MAKE-ON-VERIFY ?AUTO_4423 ?AUTO_4424 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4426 - BLOCK
      ?AUTO_4427 - BLOCK
    )
    :vars
    (
      ?AUTO_4428 - BLOCK
      ?AUTO_4429 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4427 ) ( not ( = ?AUTO_4426 ?AUTO_4427 ) ) ( ON ?AUTO_4426 ?AUTO_4428 ) ( CLEAR ?AUTO_4426 ) ( not ( = ?AUTO_4426 ?AUTO_4428 ) ) ( not ( = ?AUTO_4427 ?AUTO_4428 ) ) ( HOLDING ?AUTO_4429 ) ( not ( = ?AUTO_4426 ?AUTO_4429 ) ) ( not ( = ?AUTO_4427 ?AUTO_4429 ) ) ( not ( = ?AUTO_4428 ?AUTO_4429 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4429 )
      ( MAKE-ON ?AUTO_4426 ?AUTO_4427 )
      ( MAKE-ON-VERIFY ?AUTO_4426 ?AUTO_4427 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4430 - BLOCK
      ?AUTO_4431 - BLOCK
    )
    :vars
    (
      ?AUTO_4432 - BLOCK
      ?AUTO_4433 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4431 ) ( not ( = ?AUTO_4430 ?AUTO_4431 ) ) ( ON ?AUTO_4430 ?AUTO_4432 ) ( not ( = ?AUTO_4430 ?AUTO_4432 ) ) ( not ( = ?AUTO_4431 ?AUTO_4432 ) ) ( not ( = ?AUTO_4430 ?AUTO_4433 ) ) ( not ( = ?AUTO_4431 ?AUTO_4433 ) ) ( not ( = ?AUTO_4432 ?AUTO_4433 ) ) ( ON ?AUTO_4433 ?AUTO_4430 ) ( CLEAR ?AUTO_4433 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4433 ?AUTO_4430 )
      ( MAKE-ON ?AUTO_4430 ?AUTO_4431 )
      ( MAKE-ON-VERIFY ?AUTO_4430 ?AUTO_4431 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4434 - BLOCK
      ?AUTO_4435 - BLOCK
    )
    :vars
    (
      ?AUTO_4436 - BLOCK
      ?AUTO_4437 - BLOCK
      ?AUTO_4438 - BLOCK
      ?AUTO_4439 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4435 ) ( not ( = ?AUTO_4434 ?AUTO_4435 ) ) ( ON ?AUTO_4434 ?AUTO_4436 ) ( not ( = ?AUTO_4434 ?AUTO_4436 ) ) ( not ( = ?AUTO_4435 ?AUTO_4436 ) ) ( not ( = ?AUTO_4434 ?AUTO_4437 ) ) ( not ( = ?AUTO_4435 ?AUTO_4437 ) ) ( not ( = ?AUTO_4436 ?AUTO_4437 ) ) ( ON ?AUTO_4437 ?AUTO_4434 ) ( CLEAR ?AUTO_4437 ) ( HOLDING ?AUTO_4438 ) ( CLEAR ?AUTO_4439 ) ( not ( = ?AUTO_4434 ?AUTO_4438 ) ) ( not ( = ?AUTO_4434 ?AUTO_4439 ) ) ( not ( = ?AUTO_4435 ?AUTO_4438 ) ) ( not ( = ?AUTO_4435 ?AUTO_4439 ) ) ( not ( = ?AUTO_4436 ?AUTO_4438 ) ) ( not ( = ?AUTO_4436 ?AUTO_4439 ) ) ( not ( = ?AUTO_4437 ?AUTO_4438 ) ) ( not ( = ?AUTO_4437 ?AUTO_4439 ) ) ( not ( = ?AUTO_4438 ?AUTO_4439 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4438 ?AUTO_4439 )
      ( MAKE-ON ?AUTO_4434 ?AUTO_4435 )
      ( MAKE-ON-VERIFY ?AUTO_4434 ?AUTO_4435 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4440 - BLOCK
      ?AUTO_4441 - BLOCK
    )
    :vars
    (
      ?AUTO_4442 - BLOCK
      ?AUTO_4443 - BLOCK
      ?AUTO_4445 - BLOCK
      ?AUTO_4444 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4441 ) ( not ( = ?AUTO_4440 ?AUTO_4441 ) ) ( ON ?AUTO_4440 ?AUTO_4442 ) ( not ( = ?AUTO_4440 ?AUTO_4442 ) ) ( not ( = ?AUTO_4441 ?AUTO_4442 ) ) ( not ( = ?AUTO_4440 ?AUTO_4443 ) ) ( not ( = ?AUTO_4441 ?AUTO_4443 ) ) ( not ( = ?AUTO_4442 ?AUTO_4443 ) ) ( ON ?AUTO_4443 ?AUTO_4440 ) ( CLEAR ?AUTO_4445 ) ( not ( = ?AUTO_4440 ?AUTO_4444 ) ) ( not ( = ?AUTO_4440 ?AUTO_4445 ) ) ( not ( = ?AUTO_4441 ?AUTO_4444 ) ) ( not ( = ?AUTO_4441 ?AUTO_4445 ) ) ( not ( = ?AUTO_4442 ?AUTO_4444 ) ) ( not ( = ?AUTO_4442 ?AUTO_4445 ) ) ( not ( = ?AUTO_4443 ?AUTO_4444 ) ) ( not ( = ?AUTO_4443 ?AUTO_4445 ) ) ( not ( = ?AUTO_4444 ?AUTO_4445 ) ) ( ON ?AUTO_4444 ?AUTO_4443 ) ( CLEAR ?AUTO_4444 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4444 ?AUTO_4443 )
      ( MAKE-ON ?AUTO_4440 ?AUTO_4441 )
      ( MAKE-ON-VERIFY ?AUTO_4440 ?AUTO_4441 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4446 - BLOCK
      ?AUTO_4447 - BLOCK
    )
    :vars
    (
      ?AUTO_4448 - BLOCK
      ?AUTO_4449 - BLOCK
      ?AUTO_4451 - BLOCK
      ?AUTO_4450 - BLOCK
      ?AUTO_4452 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4447 ) ( not ( = ?AUTO_4446 ?AUTO_4447 ) ) ( ON ?AUTO_4446 ?AUTO_4448 ) ( not ( = ?AUTO_4446 ?AUTO_4448 ) ) ( not ( = ?AUTO_4447 ?AUTO_4448 ) ) ( not ( = ?AUTO_4446 ?AUTO_4449 ) ) ( not ( = ?AUTO_4447 ?AUTO_4449 ) ) ( not ( = ?AUTO_4448 ?AUTO_4449 ) ) ( ON ?AUTO_4449 ?AUTO_4446 ) ( CLEAR ?AUTO_4451 ) ( not ( = ?AUTO_4446 ?AUTO_4450 ) ) ( not ( = ?AUTO_4446 ?AUTO_4451 ) ) ( not ( = ?AUTO_4447 ?AUTO_4450 ) ) ( not ( = ?AUTO_4447 ?AUTO_4451 ) ) ( not ( = ?AUTO_4448 ?AUTO_4450 ) ) ( not ( = ?AUTO_4448 ?AUTO_4451 ) ) ( not ( = ?AUTO_4449 ?AUTO_4450 ) ) ( not ( = ?AUTO_4449 ?AUTO_4451 ) ) ( not ( = ?AUTO_4450 ?AUTO_4451 ) ) ( ON ?AUTO_4450 ?AUTO_4449 ) ( CLEAR ?AUTO_4450 ) ( HOLDING ?AUTO_4452 ) ( not ( = ?AUTO_4446 ?AUTO_4452 ) ) ( not ( = ?AUTO_4447 ?AUTO_4452 ) ) ( not ( = ?AUTO_4448 ?AUTO_4452 ) ) ( not ( = ?AUTO_4449 ?AUTO_4452 ) ) ( not ( = ?AUTO_4451 ?AUTO_4452 ) ) ( not ( = ?AUTO_4450 ?AUTO_4452 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4452 )
      ( MAKE-ON ?AUTO_4446 ?AUTO_4447 )
      ( MAKE-ON-VERIFY ?AUTO_4446 ?AUTO_4447 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4453 - BLOCK
      ?AUTO_4454 - BLOCK
    )
    :vars
    (
      ?AUTO_4458 - BLOCK
      ?AUTO_4455 - BLOCK
      ?AUTO_4457 - BLOCK
      ?AUTO_4459 - BLOCK
      ?AUTO_4456 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4454 ) ( not ( = ?AUTO_4453 ?AUTO_4454 ) ) ( ON ?AUTO_4453 ?AUTO_4458 ) ( not ( = ?AUTO_4453 ?AUTO_4458 ) ) ( not ( = ?AUTO_4454 ?AUTO_4458 ) ) ( not ( = ?AUTO_4453 ?AUTO_4455 ) ) ( not ( = ?AUTO_4454 ?AUTO_4455 ) ) ( not ( = ?AUTO_4458 ?AUTO_4455 ) ) ( ON ?AUTO_4455 ?AUTO_4453 ) ( CLEAR ?AUTO_4457 ) ( not ( = ?AUTO_4453 ?AUTO_4459 ) ) ( not ( = ?AUTO_4453 ?AUTO_4457 ) ) ( not ( = ?AUTO_4454 ?AUTO_4459 ) ) ( not ( = ?AUTO_4454 ?AUTO_4457 ) ) ( not ( = ?AUTO_4458 ?AUTO_4459 ) ) ( not ( = ?AUTO_4458 ?AUTO_4457 ) ) ( not ( = ?AUTO_4455 ?AUTO_4459 ) ) ( not ( = ?AUTO_4455 ?AUTO_4457 ) ) ( not ( = ?AUTO_4459 ?AUTO_4457 ) ) ( ON ?AUTO_4459 ?AUTO_4455 ) ( not ( = ?AUTO_4453 ?AUTO_4456 ) ) ( not ( = ?AUTO_4454 ?AUTO_4456 ) ) ( not ( = ?AUTO_4458 ?AUTO_4456 ) ) ( not ( = ?AUTO_4455 ?AUTO_4456 ) ) ( not ( = ?AUTO_4457 ?AUTO_4456 ) ) ( not ( = ?AUTO_4459 ?AUTO_4456 ) ) ( ON ?AUTO_4456 ?AUTO_4459 ) ( CLEAR ?AUTO_4456 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4456 ?AUTO_4459 )
      ( MAKE-ON ?AUTO_4453 ?AUTO_4454 )
      ( MAKE-ON-VERIFY ?AUTO_4453 ?AUTO_4454 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4460 - BLOCK
      ?AUTO_4461 - BLOCK
    )
    :vars
    (
      ?AUTO_4466 - BLOCK
      ?AUTO_4462 - BLOCK
      ?AUTO_4465 - BLOCK
      ?AUTO_4464 - BLOCK
      ?AUTO_4463 - BLOCK
      ?AUTO_4467 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4461 ) ( not ( = ?AUTO_4460 ?AUTO_4461 ) ) ( ON ?AUTO_4460 ?AUTO_4466 ) ( not ( = ?AUTO_4460 ?AUTO_4466 ) ) ( not ( = ?AUTO_4461 ?AUTO_4466 ) ) ( not ( = ?AUTO_4460 ?AUTO_4462 ) ) ( not ( = ?AUTO_4461 ?AUTO_4462 ) ) ( not ( = ?AUTO_4466 ?AUTO_4462 ) ) ( ON ?AUTO_4462 ?AUTO_4460 ) ( not ( = ?AUTO_4460 ?AUTO_4465 ) ) ( not ( = ?AUTO_4460 ?AUTO_4464 ) ) ( not ( = ?AUTO_4461 ?AUTO_4465 ) ) ( not ( = ?AUTO_4461 ?AUTO_4464 ) ) ( not ( = ?AUTO_4466 ?AUTO_4465 ) ) ( not ( = ?AUTO_4466 ?AUTO_4464 ) ) ( not ( = ?AUTO_4462 ?AUTO_4465 ) ) ( not ( = ?AUTO_4462 ?AUTO_4464 ) ) ( not ( = ?AUTO_4465 ?AUTO_4464 ) ) ( ON ?AUTO_4465 ?AUTO_4462 ) ( not ( = ?AUTO_4460 ?AUTO_4463 ) ) ( not ( = ?AUTO_4461 ?AUTO_4463 ) ) ( not ( = ?AUTO_4466 ?AUTO_4463 ) ) ( not ( = ?AUTO_4462 ?AUTO_4463 ) ) ( not ( = ?AUTO_4464 ?AUTO_4463 ) ) ( not ( = ?AUTO_4465 ?AUTO_4463 ) ) ( ON ?AUTO_4463 ?AUTO_4465 ) ( CLEAR ?AUTO_4463 ) ( HOLDING ?AUTO_4464 ) ( CLEAR ?AUTO_4467 ) ( not ( = ?AUTO_4460 ?AUTO_4467 ) ) ( not ( = ?AUTO_4461 ?AUTO_4467 ) ) ( not ( = ?AUTO_4466 ?AUTO_4467 ) ) ( not ( = ?AUTO_4462 ?AUTO_4467 ) ) ( not ( = ?AUTO_4465 ?AUTO_4467 ) ) ( not ( = ?AUTO_4464 ?AUTO_4467 ) ) ( not ( = ?AUTO_4463 ?AUTO_4467 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4464 ?AUTO_4467 )
      ( MAKE-ON ?AUTO_4460 ?AUTO_4461 )
      ( MAKE-ON-VERIFY ?AUTO_4460 ?AUTO_4461 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4474 - BLOCK
      ?AUTO_4475 - BLOCK
    )
    :vars
    (
      ?AUTO_4476 - BLOCK
      ?AUTO_4479 - BLOCK
      ?AUTO_4477 - BLOCK
      ?AUTO_4480 - BLOCK
      ?AUTO_4478 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4474 ?AUTO_4475 ) ) ( ON ?AUTO_4474 ?AUTO_4476 ) ( not ( = ?AUTO_4474 ?AUTO_4476 ) ) ( not ( = ?AUTO_4475 ?AUTO_4476 ) ) ( not ( = ?AUTO_4474 ?AUTO_4479 ) ) ( not ( = ?AUTO_4475 ?AUTO_4479 ) ) ( not ( = ?AUTO_4476 ?AUTO_4479 ) ) ( ON ?AUTO_4479 ?AUTO_4474 ) ( CLEAR ?AUTO_4477 ) ( not ( = ?AUTO_4474 ?AUTO_4480 ) ) ( not ( = ?AUTO_4474 ?AUTO_4477 ) ) ( not ( = ?AUTO_4475 ?AUTO_4480 ) ) ( not ( = ?AUTO_4475 ?AUTO_4477 ) ) ( not ( = ?AUTO_4476 ?AUTO_4480 ) ) ( not ( = ?AUTO_4476 ?AUTO_4477 ) ) ( not ( = ?AUTO_4479 ?AUTO_4480 ) ) ( not ( = ?AUTO_4479 ?AUTO_4477 ) ) ( not ( = ?AUTO_4480 ?AUTO_4477 ) ) ( ON ?AUTO_4480 ?AUTO_4479 ) ( not ( = ?AUTO_4474 ?AUTO_4478 ) ) ( not ( = ?AUTO_4475 ?AUTO_4478 ) ) ( not ( = ?AUTO_4476 ?AUTO_4478 ) ) ( not ( = ?AUTO_4479 ?AUTO_4478 ) ) ( not ( = ?AUTO_4477 ?AUTO_4478 ) ) ( not ( = ?AUTO_4480 ?AUTO_4478 ) ) ( ON ?AUTO_4478 ?AUTO_4480 ) ( CLEAR ?AUTO_4478 ) ( HOLDING ?AUTO_4475 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4475 )
      ( MAKE-ON ?AUTO_4474 ?AUTO_4475 )
      ( MAKE-ON-VERIFY ?AUTO_4474 ?AUTO_4475 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4489 - BLOCK
      ?AUTO_4490 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4489 ) ( CLEAR ?AUTO_4490 ) ( not ( = ?AUTO_4489 ?AUTO_4490 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4489 ?AUTO_4490 )
      ( MAKE-ON-VERIFY ?AUTO_4489 ?AUTO_4490 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4491 - BLOCK
      ?AUTO_4492 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4492 ) ( not ( = ?AUTO_4491 ?AUTO_4492 ) ) ( ON-TABLE ?AUTO_4491 ) ( CLEAR ?AUTO_4491 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_4491 )
      ( MAKE-ON ?AUTO_4491 ?AUTO_4492 )
      ( MAKE-ON-VERIFY ?AUTO_4491 ?AUTO_4492 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4493 - BLOCK
      ?AUTO_4494 - BLOCK
    )
    :vars
    (
      ?AUTO_4495 - BLOCK
      ?AUTO_4496 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4494 ) ( not ( = ?AUTO_4493 ?AUTO_4494 ) ) ( ON-TABLE ?AUTO_4493 ) ( CLEAR ?AUTO_4493 ) ( HOLDING ?AUTO_4495 ) ( CLEAR ?AUTO_4496 ) ( not ( = ?AUTO_4493 ?AUTO_4495 ) ) ( not ( = ?AUTO_4493 ?AUTO_4496 ) ) ( not ( = ?AUTO_4494 ?AUTO_4495 ) ) ( not ( = ?AUTO_4494 ?AUTO_4496 ) ) ( not ( = ?AUTO_4495 ?AUTO_4496 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4495 ?AUTO_4496 )
      ( MAKE-ON ?AUTO_4493 ?AUTO_4494 )
      ( MAKE-ON-VERIFY ?AUTO_4493 ?AUTO_4494 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4497 - BLOCK
      ?AUTO_4498 - BLOCK
    )
    :vars
    (
      ?AUTO_4499 - BLOCK
      ?AUTO_4500 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4497 ?AUTO_4498 ) ) ( ON-TABLE ?AUTO_4497 ) ( CLEAR ?AUTO_4497 ) ( CLEAR ?AUTO_4499 ) ( not ( = ?AUTO_4497 ?AUTO_4500 ) ) ( not ( = ?AUTO_4497 ?AUTO_4499 ) ) ( not ( = ?AUTO_4498 ?AUTO_4500 ) ) ( not ( = ?AUTO_4498 ?AUTO_4499 ) ) ( not ( = ?AUTO_4500 ?AUTO_4499 ) ) ( ON ?AUTO_4500 ?AUTO_4498 ) ( CLEAR ?AUTO_4500 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4500 ?AUTO_4498 )
      ( MAKE-ON ?AUTO_4497 ?AUTO_4498 )
      ( MAKE-ON-VERIFY ?AUTO_4497 ?AUTO_4498 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4501 - BLOCK
      ?AUTO_4502 - BLOCK
    )
    :vars
    (
      ?AUTO_4503 - BLOCK
      ?AUTO_4504 - BLOCK
      ?AUTO_4505 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4501 ?AUTO_4502 ) ) ( ON-TABLE ?AUTO_4501 ) ( CLEAR ?AUTO_4501 ) ( CLEAR ?AUTO_4503 ) ( not ( = ?AUTO_4501 ?AUTO_4504 ) ) ( not ( = ?AUTO_4501 ?AUTO_4503 ) ) ( not ( = ?AUTO_4502 ?AUTO_4504 ) ) ( not ( = ?AUTO_4502 ?AUTO_4503 ) ) ( not ( = ?AUTO_4504 ?AUTO_4503 ) ) ( ON ?AUTO_4504 ?AUTO_4502 ) ( CLEAR ?AUTO_4504 ) ( HOLDING ?AUTO_4505 ) ( not ( = ?AUTO_4501 ?AUTO_4505 ) ) ( not ( = ?AUTO_4502 ?AUTO_4505 ) ) ( not ( = ?AUTO_4503 ?AUTO_4505 ) ) ( not ( = ?AUTO_4504 ?AUTO_4505 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4505 )
      ( MAKE-ON ?AUTO_4501 ?AUTO_4502 )
      ( MAKE-ON-VERIFY ?AUTO_4501 ?AUTO_4502 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4506 - BLOCK
      ?AUTO_4507 - BLOCK
    )
    :vars
    (
      ?AUTO_4510 - BLOCK
      ?AUTO_4509 - BLOCK
      ?AUTO_4508 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4506 ?AUTO_4507 ) ) ( ON-TABLE ?AUTO_4506 ) ( CLEAR ?AUTO_4506 ) ( CLEAR ?AUTO_4510 ) ( not ( = ?AUTO_4506 ?AUTO_4509 ) ) ( not ( = ?AUTO_4506 ?AUTO_4510 ) ) ( not ( = ?AUTO_4507 ?AUTO_4509 ) ) ( not ( = ?AUTO_4507 ?AUTO_4510 ) ) ( not ( = ?AUTO_4509 ?AUTO_4510 ) ) ( ON ?AUTO_4509 ?AUTO_4507 ) ( not ( = ?AUTO_4506 ?AUTO_4508 ) ) ( not ( = ?AUTO_4507 ?AUTO_4508 ) ) ( not ( = ?AUTO_4510 ?AUTO_4508 ) ) ( not ( = ?AUTO_4509 ?AUTO_4508 ) ) ( ON ?AUTO_4508 ?AUTO_4509 ) ( CLEAR ?AUTO_4508 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4508 ?AUTO_4509 )
      ( MAKE-ON ?AUTO_4506 ?AUTO_4507 )
      ( MAKE-ON-VERIFY ?AUTO_4506 ?AUTO_4507 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4511 - BLOCK
      ?AUTO_4512 - BLOCK
    )
    :vars
    (
      ?AUTO_4515 - BLOCK
      ?AUTO_4513 - BLOCK
      ?AUTO_4514 - BLOCK
      ?AUTO_4516 - BLOCK
      ?AUTO_4517 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4511 ?AUTO_4512 ) ) ( ON-TABLE ?AUTO_4511 ) ( CLEAR ?AUTO_4511 ) ( CLEAR ?AUTO_4515 ) ( not ( = ?AUTO_4511 ?AUTO_4513 ) ) ( not ( = ?AUTO_4511 ?AUTO_4515 ) ) ( not ( = ?AUTO_4512 ?AUTO_4513 ) ) ( not ( = ?AUTO_4512 ?AUTO_4515 ) ) ( not ( = ?AUTO_4513 ?AUTO_4515 ) ) ( ON ?AUTO_4513 ?AUTO_4512 ) ( not ( = ?AUTO_4511 ?AUTO_4514 ) ) ( not ( = ?AUTO_4512 ?AUTO_4514 ) ) ( not ( = ?AUTO_4515 ?AUTO_4514 ) ) ( not ( = ?AUTO_4513 ?AUTO_4514 ) ) ( ON ?AUTO_4514 ?AUTO_4513 ) ( CLEAR ?AUTO_4514 ) ( HOLDING ?AUTO_4516 ) ( CLEAR ?AUTO_4517 ) ( not ( = ?AUTO_4511 ?AUTO_4516 ) ) ( not ( = ?AUTO_4511 ?AUTO_4517 ) ) ( not ( = ?AUTO_4512 ?AUTO_4516 ) ) ( not ( = ?AUTO_4512 ?AUTO_4517 ) ) ( not ( = ?AUTO_4515 ?AUTO_4516 ) ) ( not ( = ?AUTO_4515 ?AUTO_4517 ) ) ( not ( = ?AUTO_4513 ?AUTO_4516 ) ) ( not ( = ?AUTO_4513 ?AUTO_4517 ) ) ( not ( = ?AUTO_4514 ?AUTO_4516 ) ) ( not ( = ?AUTO_4514 ?AUTO_4517 ) ) ( not ( = ?AUTO_4516 ?AUTO_4517 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4516 ?AUTO_4517 )
      ( MAKE-ON ?AUTO_4511 ?AUTO_4512 )
      ( MAKE-ON-VERIFY ?AUTO_4511 ?AUTO_4512 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4518 - BLOCK
      ?AUTO_4519 - BLOCK
    )
    :vars
    (
      ?AUTO_4524 - BLOCK
      ?AUTO_4521 - BLOCK
      ?AUTO_4520 - BLOCK
      ?AUTO_4522 - BLOCK
      ?AUTO_4523 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4518 ?AUTO_4519 ) ) ( ON-TABLE ?AUTO_4518 ) ( CLEAR ?AUTO_4518 ) ( CLEAR ?AUTO_4524 ) ( not ( = ?AUTO_4518 ?AUTO_4521 ) ) ( not ( = ?AUTO_4518 ?AUTO_4524 ) ) ( not ( = ?AUTO_4519 ?AUTO_4521 ) ) ( not ( = ?AUTO_4519 ?AUTO_4524 ) ) ( not ( = ?AUTO_4521 ?AUTO_4524 ) ) ( ON ?AUTO_4521 ?AUTO_4519 ) ( not ( = ?AUTO_4518 ?AUTO_4520 ) ) ( not ( = ?AUTO_4519 ?AUTO_4520 ) ) ( not ( = ?AUTO_4524 ?AUTO_4520 ) ) ( not ( = ?AUTO_4521 ?AUTO_4520 ) ) ( ON ?AUTO_4520 ?AUTO_4521 ) ( CLEAR ?AUTO_4522 ) ( not ( = ?AUTO_4518 ?AUTO_4523 ) ) ( not ( = ?AUTO_4518 ?AUTO_4522 ) ) ( not ( = ?AUTO_4519 ?AUTO_4523 ) ) ( not ( = ?AUTO_4519 ?AUTO_4522 ) ) ( not ( = ?AUTO_4524 ?AUTO_4523 ) ) ( not ( = ?AUTO_4524 ?AUTO_4522 ) ) ( not ( = ?AUTO_4521 ?AUTO_4523 ) ) ( not ( = ?AUTO_4521 ?AUTO_4522 ) ) ( not ( = ?AUTO_4520 ?AUTO_4523 ) ) ( not ( = ?AUTO_4520 ?AUTO_4522 ) ) ( not ( = ?AUTO_4523 ?AUTO_4522 ) ) ( ON ?AUTO_4523 ?AUTO_4520 ) ( CLEAR ?AUTO_4523 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4523 ?AUTO_4520 )
      ( MAKE-ON ?AUTO_4518 ?AUTO_4519 )
      ( MAKE-ON-VERIFY ?AUTO_4518 ?AUTO_4519 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4525 - BLOCK
      ?AUTO_4526 - BLOCK
    )
    :vars
    (
      ?AUTO_4531 - BLOCK
      ?AUTO_4527 - BLOCK
      ?AUTO_4528 - BLOCK
      ?AUTO_4529 - BLOCK
      ?AUTO_4530 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4525 ?AUTO_4526 ) ) ( CLEAR ?AUTO_4531 ) ( not ( = ?AUTO_4525 ?AUTO_4527 ) ) ( not ( = ?AUTO_4525 ?AUTO_4531 ) ) ( not ( = ?AUTO_4526 ?AUTO_4527 ) ) ( not ( = ?AUTO_4526 ?AUTO_4531 ) ) ( not ( = ?AUTO_4527 ?AUTO_4531 ) ) ( ON ?AUTO_4527 ?AUTO_4526 ) ( not ( = ?AUTO_4525 ?AUTO_4528 ) ) ( not ( = ?AUTO_4526 ?AUTO_4528 ) ) ( not ( = ?AUTO_4531 ?AUTO_4528 ) ) ( not ( = ?AUTO_4527 ?AUTO_4528 ) ) ( ON ?AUTO_4528 ?AUTO_4527 ) ( CLEAR ?AUTO_4529 ) ( not ( = ?AUTO_4525 ?AUTO_4530 ) ) ( not ( = ?AUTO_4525 ?AUTO_4529 ) ) ( not ( = ?AUTO_4526 ?AUTO_4530 ) ) ( not ( = ?AUTO_4526 ?AUTO_4529 ) ) ( not ( = ?AUTO_4531 ?AUTO_4530 ) ) ( not ( = ?AUTO_4531 ?AUTO_4529 ) ) ( not ( = ?AUTO_4527 ?AUTO_4530 ) ) ( not ( = ?AUTO_4527 ?AUTO_4529 ) ) ( not ( = ?AUTO_4528 ?AUTO_4530 ) ) ( not ( = ?AUTO_4528 ?AUTO_4529 ) ) ( not ( = ?AUTO_4530 ?AUTO_4529 ) ) ( ON ?AUTO_4530 ?AUTO_4528 ) ( CLEAR ?AUTO_4530 ) ( HOLDING ?AUTO_4525 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4525 )
      ( MAKE-ON ?AUTO_4525 ?AUTO_4526 )
      ( MAKE-ON-VERIFY ?AUTO_4525 ?AUTO_4526 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4532 - BLOCK
      ?AUTO_4533 - BLOCK
    )
    :vars
    (
      ?AUTO_4536 - BLOCK
      ?AUTO_4535 - BLOCK
      ?AUTO_4537 - BLOCK
      ?AUTO_4538 - BLOCK
      ?AUTO_4534 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4532 ?AUTO_4533 ) ) ( CLEAR ?AUTO_4536 ) ( not ( = ?AUTO_4532 ?AUTO_4535 ) ) ( not ( = ?AUTO_4532 ?AUTO_4536 ) ) ( not ( = ?AUTO_4533 ?AUTO_4535 ) ) ( not ( = ?AUTO_4533 ?AUTO_4536 ) ) ( not ( = ?AUTO_4535 ?AUTO_4536 ) ) ( ON ?AUTO_4535 ?AUTO_4533 ) ( not ( = ?AUTO_4532 ?AUTO_4537 ) ) ( not ( = ?AUTO_4533 ?AUTO_4537 ) ) ( not ( = ?AUTO_4536 ?AUTO_4537 ) ) ( not ( = ?AUTO_4535 ?AUTO_4537 ) ) ( ON ?AUTO_4537 ?AUTO_4535 ) ( CLEAR ?AUTO_4538 ) ( not ( = ?AUTO_4532 ?AUTO_4534 ) ) ( not ( = ?AUTO_4532 ?AUTO_4538 ) ) ( not ( = ?AUTO_4533 ?AUTO_4534 ) ) ( not ( = ?AUTO_4533 ?AUTO_4538 ) ) ( not ( = ?AUTO_4536 ?AUTO_4534 ) ) ( not ( = ?AUTO_4536 ?AUTO_4538 ) ) ( not ( = ?AUTO_4535 ?AUTO_4534 ) ) ( not ( = ?AUTO_4535 ?AUTO_4538 ) ) ( not ( = ?AUTO_4537 ?AUTO_4534 ) ) ( not ( = ?AUTO_4537 ?AUTO_4538 ) ) ( not ( = ?AUTO_4534 ?AUTO_4538 ) ) ( ON ?AUTO_4534 ?AUTO_4537 ) ( ON ?AUTO_4532 ?AUTO_4534 ) ( CLEAR ?AUTO_4532 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4532 ?AUTO_4534 )
      ( MAKE-ON ?AUTO_4532 ?AUTO_4533 )
      ( MAKE-ON-VERIFY ?AUTO_4532 ?AUTO_4533 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4539 - BLOCK
      ?AUTO_4540 - BLOCK
    )
    :vars
    (
      ?AUTO_4543 - BLOCK
      ?AUTO_4542 - BLOCK
      ?AUTO_4545 - BLOCK
      ?AUTO_4541 - BLOCK
      ?AUTO_4544 - BLOCK
      ?AUTO_4546 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4539 ?AUTO_4540 ) ) ( CLEAR ?AUTO_4543 ) ( not ( = ?AUTO_4539 ?AUTO_4542 ) ) ( not ( = ?AUTO_4539 ?AUTO_4543 ) ) ( not ( = ?AUTO_4540 ?AUTO_4542 ) ) ( not ( = ?AUTO_4540 ?AUTO_4543 ) ) ( not ( = ?AUTO_4542 ?AUTO_4543 ) ) ( ON ?AUTO_4542 ?AUTO_4540 ) ( not ( = ?AUTO_4539 ?AUTO_4545 ) ) ( not ( = ?AUTO_4540 ?AUTO_4545 ) ) ( not ( = ?AUTO_4543 ?AUTO_4545 ) ) ( not ( = ?AUTO_4542 ?AUTO_4545 ) ) ( ON ?AUTO_4545 ?AUTO_4542 ) ( not ( = ?AUTO_4539 ?AUTO_4541 ) ) ( not ( = ?AUTO_4539 ?AUTO_4544 ) ) ( not ( = ?AUTO_4540 ?AUTO_4541 ) ) ( not ( = ?AUTO_4540 ?AUTO_4544 ) ) ( not ( = ?AUTO_4543 ?AUTO_4541 ) ) ( not ( = ?AUTO_4543 ?AUTO_4544 ) ) ( not ( = ?AUTO_4542 ?AUTO_4541 ) ) ( not ( = ?AUTO_4542 ?AUTO_4544 ) ) ( not ( = ?AUTO_4545 ?AUTO_4541 ) ) ( not ( = ?AUTO_4545 ?AUTO_4544 ) ) ( not ( = ?AUTO_4541 ?AUTO_4544 ) ) ( ON ?AUTO_4541 ?AUTO_4545 ) ( ON ?AUTO_4539 ?AUTO_4541 ) ( CLEAR ?AUTO_4539 ) ( HOLDING ?AUTO_4544 ) ( CLEAR ?AUTO_4546 ) ( not ( = ?AUTO_4539 ?AUTO_4546 ) ) ( not ( = ?AUTO_4540 ?AUTO_4546 ) ) ( not ( = ?AUTO_4543 ?AUTO_4546 ) ) ( not ( = ?AUTO_4542 ?AUTO_4546 ) ) ( not ( = ?AUTO_4545 ?AUTO_4546 ) ) ( not ( = ?AUTO_4541 ?AUTO_4546 ) ) ( not ( = ?AUTO_4544 ?AUTO_4546 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4544 ?AUTO_4546 )
      ( MAKE-ON ?AUTO_4539 ?AUTO_4540 )
      ( MAKE-ON-VERIFY ?AUTO_4539 ?AUTO_4540 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4563 - BLOCK
      ?AUTO_4564 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4563 ) ( CLEAR ?AUTO_4564 ) ( not ( = ?AUTO_4563 ?AUTO_4564 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4563 ?AUTO_4564 )
      ( MAKE-ON-VERIFY ?AUTO_4563 ?AUTO_4564 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4565 - BLOCK
      ?AUTO_4566 - BLOCK
    )
    :vars
    (
      ?AUTO_4567 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4566 ) ( not ( = ?AUTO_4565 ?AUTO_4566 ) ) ( ON ?AUTO_4565 ?AUTO_4567 ) ( CLEAR ?AUTO_4565 ) ( HAND-EMPTY ) ( not ( = ?AUTO_4565 ?AUTO_4567 ) ) ( not ( = ?AUTO_4566 ?AUTO_4567 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4565 ?AUTO_4567 )
      ( MAKE-ON ?AUTO_4565 ?AUTO_4566 )
      ( MAKE-ON-VERIFY ?AUTO_4565 ?AUTO_4566 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4568 - BLOCK
      ?AUTO_4569 - BLOCK
    )
    :vars
    (
      ?AUTO_4570 - BLOCK
      ?AUTO_4571 - BLOCK
      ?AUTO_4572 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4569 ) ( not ( = ?AUTO_4568 ?AUTO_4569 ) ) ( ON ?AUTO_4568 ?AUTO_4570 ) ( CLEAR ?AUTO_4568 ) ( not ( = ?AUTO_4568 ?AUTO_4570 ) ) ( not ( = ?AUTO_4569 ?AUTO_4570 ) ) ( HOLDING ?AUTO_4571 ) ( CLEAR ?AUTO_4572 ) ( not ( = ?AUTO_4568 ?AUTO_4571 ) ) ( not ( = ?AUTO_4568 ?AUTO_4572 ) ) ( not ( = ?AUTO_4569 ?AUTO_4571 ) ) ( not ( = ?AUTO_4569 ?AUTO_4572 ) ) ( not ( = ?AUTO_4570 ?AUTO_4571 ) ) ( not ( = ?AUTO_4570 ?AUTO_4572 ) ) ( not ( = ?AUTO_4571 ?AUTO_4572 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4571 ?AUTO_4572 )
      ( MAKE-ON ?AUTO_4568 ?AUTO_4569 )
      ( MAKE-ON-VERIFY ?AUTO_4568 ?AUTO_4569 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4575 - BLOCK
      ?AUTO_4576 - BLOCK
    )
    :vars
    (
      ?AUTO_4577 - BLOCK
      ?AUTO_4578 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4575 ?AUTO_4576 ) ) ( ON ?AUTO_4575 ?AUTO_4577 ) ( CLEAR ?AUTO_4575 ) ( not ( = ?AUTO_4575 ?AUTO_4577 ) ) ( not ( = ?AUTO_4576 ?AUTO_4577 ) ) ( HOLDING ?AUTO_4576 ) ( CLEAR ?AUTO_4578 ) ( not ( = ?AUTO_4575 ?AUTO_4578 ) ) ( not ( = ?AUTO_4576 ?AUTO_4578 ) ) ( not ( = ?AUTO_4577 ?AUTO_4578 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4576 ?AUTO_4578 )
      ( MAKE-ON ?AUTO_4575 ?AUTO_4576 )
      ( MAKE-ON-VERIFY ?AUTO_4575 ?AUTO_4576 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4583 - BLOCK
      ?AUTO_4584 - BLOCK
    )
    :vars
    (
      ?AUTO_4587 - BLOCK
      ?AUTO_4586 - BLOCK
      ?AUTO_4585 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4583 ?AUTO_4584 ) ) ( ON ?AUTO_4583 ?AUTO_4587 ) ( CLEAR ?AUTO_4583 ) ( not ( = ?AUTO_4583 ?AUTO_4587 ) ) ( not ( = ?AUTO_4584 ?AUTO_4587 ) ) ( CLEAR ?AUTO_4586 ) ( not ( = ?AUTO_4583 ?AUTO_4585 ) ) ( not ( = ?AUTO_4583 ?AUTO_4586 ) ) ( not ( = ?AUTO_4584 ?AUTO_4585 ) ) ( not ( = ?AUTO_4584 ?AUTO_4586 ) ) ( not ( = ?AUTO_4587 ?AUTO_4585 ) ) ( not ( = ?AUTO_4587 ?AUTO_4586 ) ) ( not ( = ?AUTO_4585 ?AUTO_4586 ) ) ( ON ?AUTO_4585 ?AUTO_4584 ) ( CLEAR ?AUTO_4585 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4585 ?AUTO_4584 )
      ( MAKE-ON ?AUTO_4583 ?AUTO_4584 )
      ( MAKE-ON-VERIFY ?AUTO_4583 ?AUTO_4584 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4588 - BLOCK
      ?AUTO_4589 - BLOCK
    )
    :vars
    (
      ?AUTO_4592 - BLOCK
      ?AUTO_4590 - BLOCK
      ?AUTO_4591 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4588 ?AUTO_4589 ) ) ( not ( = ?AUTO_4588 ?AUTO_4592 ) ) ( not ( = ?AUTO_4589 ?AUTO_4592 ) ) ( CLEAR ?AUTO_4590 ) ( not ( = ?AUTO_4588 ?AUTO_4591 ) ) ( not ( = ?AUTO_4588 ?AUTO_4590 ) ) ( not ( = ?AUTO_4589 ?AUTO_4591 ) ) ( not ( = ?AUTO_4589 ?AUTO_4590 ) ) ( not ( = ?AUTO_4592 ?AUTO_4591 ) ) ( not ( = ?AUTO_4592 ?AUTO_4590 ) ) ( not ( = ?AUTO_4591 ?AUTO_4590 ) ) ( ON ?AUTO_4591 ?AUTO_4589 ) ( CLEAR ?AUTO_4591 ) ( HOLDING ?AUTO_4588 ) ( CLEAR ?AUTO_4592 ) )
    :subtasks
    ( ( !STACK ?AUTO_4588 ?AUTO_4592 )
      ( MAKE-ON ?AUTO_4588 ?AUTO_4589 )
      ( MAKE-ON-VERIFY ?AUTO_4588 ?AUTO_4589 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4593 - BLOCK
      ?AUTO_4594 - BLOCK
    )
    :vars
    (
      ?AUTO_4597 - BLOCK
      ?AUTO_4595 - BLOCK
      ?AUTO_4596 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4593 ?AUTO_4594 ) ) ( not ( = ?AUTO_4593 ?AUTO_4597 ) ) ( not ( = ?AUTO_4594 ?AUTO_4597 ) ) ( CLEAR ?AUTO_4595 ) ( not ( = ?AUTO_4593 ?AUTO_4596 ) ) ( not ( = ?AUTO_4593 ?AUTO_4595 ) ) ( not ( = ?AUTO_4594 ?AUTO_4596 ) ) ( not ( = ?AUTO_4594 ?AUTO_4595 ) ) ( not ( = ?AUTO_4597 ?AUTO_4596 ) ) ( not ( = ?AUTO_4597 ?AUTO_4595 ) ) ( not ( = ?AUTO_4596 ?AUTO_4595 ) ) ( ON ?AUTO_4596 ?AUTO_4594 ) ( CLEAR ?AUTO_4597 ) ( ON ?AUTO_4593 ?AUTO_4596 ) ( CLEAR ?AUTO_4593 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4593 ?AUTO_4596 )
      ( MAKE-ON ?AUTO_4593 ?AUTO_4594 )
      ( MAKE-ON-VERIFY ?AUTO_4593 ?AUTO_4594 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4598 - BLOCK
      ?AUTO_4599 - BLOCK
    )
    :vars
    (
      ?AUTO_4600 - BLOCK
      ?AUTO_4601 - BLOCK
      ?AUTO_4602 - BLOCK
      ?AUTO_4603 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4598 ?AUTO_4599 ) ) ( not ( = ?AUTO_4598 ?AUTO_4600 ) ) ( not ( = ?AUTO_4599 ?AUTO_4600 ) ) ( CLEAR ?AUTO_4601 ) ( not ( = ?AUTO_4598 ?AUTO_4602 ) ) ( not ( = ?AUTO_4598 ?AUTO_4601 ) ) ( not ( = ?AUTO_4599 ?AUTO_4602 ) ) ( not ( = ?AUTO_4599 ?AUTO_4601 ) ) ( not ( = ?AUTO_4600 ?AUTO_4602 ) ) ( not ( = ?AUTO_4600 ?AUTO_4601 ) ) ( not ( = ?AUTO_4602 ?AUTO_4601 ) ) ( ON ?AUTO_4602 ?AUTO_4599 ) ( CLEAR ?AUTO_4600 ) ( ON ?AUTO_4598 ?AUTO_4602 ) ( CLEAR ?AUTO_4598 ) ( HOLDING ?AUTO_4603 ) ( not ( = ?AUTO_4598 ?AUTO_4603 ) ) ( not ( = ?AUTO_4599 ?AUTO_4603 ) ) ( not ( = ?AUTO_4600 ?AUTO_4603 ) ) ( not ( = ?AUTO_4601 ?AUTO_4603 ) ) ( not ( = ?AUTO_4602 ?AUTO_4603 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4603 )
      ( MAKE-ON ?AUTO_4598 ?AUTO_4599 )
      ( MAKE-ON-VERIFY ?AUTO_4598 ?AUTO_4599 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4604 - BLOCK
      ?AUTO_4605 - BLOCK
    )
    :vars
    (
      ?AUTO_4607 - BLOCK
      ?AUTO_4609 - BLOCK
      ?AUTO_4608 - BLOCK
      ?AUTO_4606 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4604 ?AUTO_4605 ) ) ( not ( = ?AUTO_4604 ?AUTO_4607 ) ) ( not ( = ?AUTO_4605 ?AUTO_4607 ) ) ( CLEAR ?AUTO_4609 ) ( not ( = ?AUTO_4604 ?AUTO_4608 ) ) ( not ( = ?AUTO_4604 ?AUTO_4609 ) ) ( not ( = ?AUTO_4605 ?AUTO_4608 ) ) ( not ( = ?AUTO_4605 ?AUTO_4609 ) ) ( not ( = ?AUTO_4607 ?AUTO_4608 ) ) ( not ( = ?AUTO_4607 ?AUTO_4609 ) ) ( not ( = ?AUTO_4608 ?AUTO_4609 ) ) ( ON ?AUTO_4608 ?AUTO_4605 ) ( CLEAR ?AUTO_4607 ) ( ON ?AUTO_4604 ?AUTO_4608 ) ( not ( = ?AUTO_4604 ?AUTO_4606 ) ) ( not ( = ?AUTO_4605 ?AUTO_4606 ) ) ( not ( = ?AUTO_4607 ?AUTO_4606 ) ) ( not ( = ?AUTO_4609 ?AUTO_4606 ) ) ( not ( = ?AUTO_4608 ?AUTO_4606 ) ) ( ON ?AUTO_4606 ?AUTO_4604 ) ( CLEAR ?AUTO_4606 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4606 ?AUTO_4604 )
      ( MAKE-ON ?AUTO_4604 ?AUTO_4605 )
      ( MAKE-ON-VERIFY ?AUTO_4604 ?AUTO_4605 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4610 - BLOCK
      ?AUTO_4611 - BLOCK
    )
    :vars
    (
      ?AUTO_4615 - BLOCK
      ?AUTO_4614 - BLOCK
      ?AUTO_4613 - BLOCK
      ?AUTO_4612 - BLOCK
      ?AUTO_4616 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4610 ?AUTO_4611 ) ) ( not ( = ?AUTO_4610 ?AUTO_4615 ) ) ( not ( = ?AUTO_4611 ?AUTO_4615 ) ) ( CLEAR ?AUTO_4614 ) ( not ( = ?AUTO_4610 ?AUTO_4613 ) ) ( not ( = ?AUTO_4610 ?AUTO_4614 ) ) ( not ( = ?AUTO_4611 ?AUTO_4613 ) ) ( not ( = ?AUTO_4611 ?AUTO_4614 ) ) ( not ( = ?AUTO_4615 ?AUTO_4613 ) ) ( not ( = ?AUTO_4615 ?AUTO_4614 ) ) ( not ( = ?AUTO_4613 ?AUTO_4614 ) ) ( ON ?AUTO_4613 ?AUTO_4611 ) ( ON ?AUTO_4610 ?AUTO_4613 ) ( not ( = ?AUTO_4610 ?AUTO_4612 ) ) ( not ( = ?AUTO_4611 ?AUTO_4612 ) ) ( not ( = ?AUTO_4615 ?AUTO_4612 ) ) ( not ( = ?AUTO_4614 ?AUTO_4612 ) ) ( not ( = ?AUTO_4613 ?AUTO_4612 ) ) ( ON ?AUTO_4612 ?AUTO_4610 ) ( CLEAR ?AUTO_4612 ) ( HOLDING ?AUTO_4615 ) ( CLEAR ?AUTO_4616 ) ( not ( = ?AUTO_4610 ?AUTO_4616 ) ) ( not ( = ?AUTO_4611 ?AUTO_4616 ) ) ( not ( = ?AUTO_4615 ?AUTO_4616 ) ) ( not ( = ?AUTO_4614 ?AUTO_4616 ) ) ( not ( = ?AUTO_4613 ?AUTO_4616 ) ) ( not ( = ?AUTO_4612 ?AUTO_4616 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4615 ?AUTO_4616 )
      ( MAKE-ON ?AUTO_4610 ?AUTO_4611 )
      ( MAKE-ON-VERIFY ?AUTO_4610 ?AUTO_4611 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4633 - BLOCK
      ?AUTO_4634 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4633 ) ( CLEAR ?AUTO_4634 ) ( not ( = ?AUTO_4633 ?AUTO_4634 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4633 ?AUTO_4634 )
      ( MAKE-ON-VERIFY ?AUTO_4633 ?AUTO_4634 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4635 - BLOCK
      ?AUTO_4636 - BLOCK
    )
    :vars
    (
      ?AUTO_4637 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4636 ) ( not ( = ?AUTO_4635 ?AUTO_4636 ) ) ( ON ?AUTO_4635 ?AUTO_4637 ) ( CLEAR ?AUTO_4635 ) ( HAND-EMPTY ) ( not ( = ?AUTO_4635 ?AUTO_4637 ) ) ( not ( = ?AUTO_4636 ?AUTO_4637 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4635 ?AUTO_4637 )
      ( MAKE-ON ?AUTO_4635 ?AUTO_4636 )
      ( MAKE-ON-VERIFY ?AUTO_4635 ?AUTO_4636 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4638 - BLOCK
      ?AUTO_4639 - BLOCK
    )
    :vars
    (
      ?AUTO_4640 - BLOCK
      ?AUTO_4641 - BLOCK
      ?AUTO_4642 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4639 ) ( not ( = ?AUTO_4638 ?AUTO_4639 ) ) ( ON ?AUTO_4638 ?AUTO_4640 ) ( CLEAR ?AUTO_4638 ) ( not ( = ?AUTO_4638 ?AUTO_4640 ) ) ( not ( = ?AUTO_4639 ?AUTO_4640 ) ) ( HOLDING ?AUTO_4641 ) ( CLEAR ?AUTO_4642 ) ( not ( = ?AUTO_4638 ?AUTO_4641 ) ) ( not ( = ?AUTO_4638 ?AUTO_4642 ) ) ( not ( = ?AUTO_4639 ?AUTO_4641 ) ) ( not ( = ?AUTO_4639 ?AUTO_4642 ) ) ( not ( = ?AUTO_4640 ?AUTO_4641 ) ) ( not ( = ?AUTO_4640 ?AUTO_4642 ) ) ( not ( = ?AUTO_4641 ?AUTO_4642 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4641 ?AUTO_4642 )
      ( MAKE-ON ?AUTO_4638 ?AUTO_4639 )
      ( MAKE-ON-VERIFY ?AUTO_4638 ?AUTO_4639 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4643 - BLOCK
      ?AUTO_4644 - BLOCK
    )
    :vars
    (
      ?AUTO_4645 - BLOCK
      ?AUTO_4646 - BLOCK
      ?AUTO_4647 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4644 ) ( not ( = ?AUTO_4643 ?AUTO_4644 ) ) ( ON ?AUTO_4643 ?AUTO_4645 ) ( not ( = ?AUTO_4643 ?AUTO_4645 ) ) ( not ( = ?AUTO_4644 ?AUTO_4645 ) ) ( CLEAR ?AUTO_4646 ) ( not ( = ?AUTO_4643 ?AUTO_4647 ) ) ( not ( = ?AUTO_4643 ?AUTO_4646 ) ) ( not ( = ?AUTO_4644 ?AUTO_4647 ) ) ( not ( = ?AUTO_4644 ?AUTO_4646 ) ) ( not ( = ?AUTO_4645 ?AUTO_4647 ) ) ( not ( = ?AUTO_4645 ?AUTO_4646 ) ) ( not ( = ?AUTO_4647 ?AUTO_4646 ) ) ( ON ?AUTO_4647 ?AUTO_4643 ) ( CLEAR ?AUTO_4647 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4647 ?AUTO_4643 )
      ( MAKE-ON ?AUTO_4643 ?AUTO_4644 )
      ( MAKE-ON-VERIFY ?AUTO_4643 ?AUTO_4644 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4648 - BLOCK
      ?AUTO_4649 - BLOCK
    )
    :vars
    (
      ?AUTO_4650 - BLOCK
      ?AUTO_4652 - BLOCK
      ?AUTO_4651 - BLOCK
      ?AUTO_4653 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4648 ?AUTO_4649 ) ) ( ON ?AUTO_4648 ?AUTO_4650 ) ( not ( = ?AUTO_4648 ?AUTO_4650 ) ) ( not ( = ?AUTO_4649 ?AUTO_4650 ) ) ( CLEAR ?AUTO_4652 ) ( not ( = ?AUTO_4648 ?AUTO_4651 ) ) ( not ( = ?AUTO_4648 ?AUTO_4652 ) ) ( not ( = ?AUTO_4649 ?AUTO_4651 ) ) ( not ( = ?AUTO_4649 ?AUTO_4652 ) ) ( not ( = ?AUTO_4650 ?AUTO_4651 ) ) ( not ( = ?AUTO_4650 ?AUTO_4652 ) ) ( not ( = ?AUTO_4651 ?AUTO_4652 ) ) ( ON ?AUTO_4651 ?AUTO_4648 ) ( CLEAR ?AUTO_4651 ) ( HOLDING ?AUTO_4649 ) ( CLEAR ?AUTO_4653 ) ( not ( = ?AUTO_4648 ?AUTO_4653 ) ) ( not ( = ?AUTO_4649 ?AUTO_4653 ) ) ( not ( = ?AUTO_4650 ?AUTO_4653 ) ) ( not ( = ?AUTO_4652 ?AUTO_4653 ) ) ( not ( = ?AUTO_4651 ?AUTO_4653 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4649 ?AUTO_4653 )
      ( MAKE-ON ?AUTO_4648 ?AUTO_4649 )
      ( MAKE-ON-VERIFY ?AUTO_4648 ?AUTO_4649 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4656 - BLOCK
      ?AUTO_4657 - BLOCK
    )
    :vars
    (
      ?AUTO_4660 - BLOCK
      ?AUTO_4659 - BLOCK
      ?AUTO_4658 - BLOCK
      ?AUTO_4661 - BLOCK
      ?AUTO_4662 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4657 ) ( not ( = ?AUTO_4656 ?AUTO_4657 ) ) ( ON ?AUTO_4656 ?AUTO_4660 ) ( not ( = ?AUTO_4656 ?AUTO_4660 ) ) ( not ( = ?AUTO_4657 ?AUTO_4660 ) ) ( CLEAR ?AUTO_4659 ) ( not ( = ?AUTO_4656 ?AUTO_4658 ) ) ( not ( = ?AUTO_4656 ?AUTO_4659 ) ) ( not ( = ?AUTO_4657 ?AUTO_4658 ) ) ( not ( = ?AUTO_4657 ?AUTO_4659 ) ) ( not ( = ?AUTO_4660 ?AUTO_4658 ) ) ( not ( = ?AUTO_4660 ?AUTO_4659 ) ) ( not ( = ?AUTO_4658 ?AUTO_4659 ) ) ( ON ?AUTO_4658 ?AUTO_4656 ) ( CLEAR ?AUTO_4658 ) ( HOLDING ?AUTO_4661 ) ( CLEAR ?AUTO_4662 ) ( not ( = ?AUTO_4656 ?AUTO_4661 ) ) ( not ( = ?AUTO_4656 ?AUTO_4662 ) ) ( not ( = ?AUTO_4657 ?AUTO_4661 ) ) ( not ( = ?AUTO_4657 ?AUTO_4662 ) ) ( not ( = ?AUTO_4660 ?AUTO_4661 ) ) ( not ( = ?AUTO_4660 ?AUTO_4662 ) ) ( not ( = ?AUTO_4659 ?AUTO_4661 ) ) ( not ( = ?AUTO_4659 ?AUTO_4662 ) ) ( not ( = ?AUTO_4658 ?AUTO_4661 ) ) ( not ( = ?AUTO_4658 ?AUTO_4662 ) ) ( not ( = ?AUTO_4661 ?AUTO_4662 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4661 ?AUTO_4662 )
      ( MAKE-ON ?AUTO_4656 ?AUTO_4657 )
      ( MAKE-ON-VERIFY ?AUTO_4656 ?AUTO_4657 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4695 - BLOCK
      ?AUTO_4696 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4695 ) ( CLEAR ?AUTO_4696 ) ( not ( = ?AUTO_4695 ?AUTO_4696 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4695 ?AUTO_4696 )
      ( MAKE-ON-VERIFY ?AUTO_4695 ?AUTO_4696 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4697 - BLOCK
      ?AUTO_4698 - BLOCK
    )
    :vars
    (
      ?AUTO_4699 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4698 ) ( not ( = ?AUTO_4697 ?AUTO_4698 ) ) ( ON ?AUTO_4697 ?AUTO_4699 ) ( CLEAR ?AUTO_4697 ) ( HAND-EMPTY ) ( not ( = ?AUTO_4697 ?AUTO_4699 ) ) ( not ( = ?AUTO_4698 ?AUTO_4699 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4697 ?AUTO_4699 )
      ( MAKE-ON ?AUTO_4697 ?AUTO_4698 )
      ( MAKE-ON-VERIFY ?AUTO_4697 ?AUTO_4698 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4700 - BLOCK
      ?AUTO_4701 - BLOCK
    )
    :vars
    (
      ?AUTO_4702 - BLOCK
      ?AUTO_4703 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4700 ?AUTO_4701 ) ) ( ON ?AUTO_4700 ?AUTO_4702 ) ( CLEAR ?AUTO_4700 ) ( not ( = ?AUTO_4700 ?AUTO_4702 ) ) ( not ( = ?AUTO_4701 ?AUTO_4702 ) ) ( HOLDING ?AUTO_4701 ) ( CLEAR ?AUTO_4703 ) ( not ( = ?AUTO_4700 ?AUTO_4703 ) ) ( not ( = ?AUTO_4701 ?AUTO_4703 ) ) ( not ( = ?AUTO_4702 ?AUTO_4703 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4701 ?AUTO_4703 )
      ( MAKE-ON ?AUTO_4700 ?AUTO_4701 )
      ( MAKE-ON-VERIFY ?AUTO_4700 ?AUTO_4701 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4770 - BLOCK
      ?AUTO_4771 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4770 ) ( CLEAR ?AUTO_4771 ) ( not ( = ?AUTO_4770 ?AUTO_4771 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4770 ?AUTO_4771 )
      ( MAKE-ON-VERIFY ?AUTO_4770 ?AUTO_4771 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4772 - BLOCK
      ?AUTO_4773 - BLOCK
    )
    :vars
    (
      ?AUTO_4774 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4773 ) ( not ( = ?AUTO_4772 ?AUTO_4773 ) ) ( ON ?AUTO_4772 ?AUTO_4774 ) ( CLEAR ?AUTO_4772 ) ( HAND-EMPTY ) ( not ( = ?AUTO_4772 ?AUTO_4774 ) ) ( not ( = ?AUTO_4773 ?AUTO_4774 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4772 ?AUTO_4774 )
      ( MAKE-ON ?AUTO_4772 ?AUTO_4773 )
      ( MAKE-ON-VERIFY ?AUTO_4772 ?AUTO_4773 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4775 - BLOCK
      ?AUTO_4776 - BLOCK
    )
    :vars
    (
      ?AUTO_4777 - BLOCK
      ?AUTO_4778 - BLOCK
      ?AUTO_4779 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4776 ) ( not ( = ?AUTO_4775 ?AUTO_4776 ) ) ( ON ?AUTO_4775 ?AUTO_4777 ) ( CLEAR ?AUTO_4775 ) ( not ( = ?AUTO_4775 ?AUTO_4777 ) ) ( not ( = ?AUTO_4776 ?AUTO_4777 ) ) ( HOLDING ?AUTO_4778 ) ( CLEAR ?AUTO_4779 ) ( not ( = ?AUTO_4775 ?AUTO_4778 ) ) ( not ( = ?AUTO_4775 ?AUTO_4779 ) ) ( not ( = ?AUTO_4776 ?AUTO_4778 ) ) ( not ( = ?AUTO_4776 ?AUTO_4779 ) ) ( not ( = ?AUTO_4777 ?AUTO_4778 ) ) ( not ( = ?AUTO_4777 ?AUTO_4779 ) ) ( not ( = ?AUTO_4778 ?AUTO_4779 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4778 ?AUTO_4779 )
      ( MAKE-ON ?AUTO_4775 ?AUTO_4776 )
      ( MAKE-ON-VERIFY ?AUTO_4775 ?AUTO_4776 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4780 - BLOCK
      ?AUTO_4781 - BLOCK
    )
    :vars
    (
      ?AUTO_4782 - BLOCK
      ?AUTO_4783 - BLOCK
      ?AUTO_4784 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4780 ?AUTO_4781 ) ) ( ON ?AUTO_4780 ?AUTO_4782 ) ( CLEAR ?AUTO_4780 ) ( not ( = ?AUTO_4780 ?AUTO_4782 ) ) ( not ( = ?AUTO_4781 ?AUTO_4782 ) ) ( CLEAR ?AUTO_4783 ) ( not ( = ?AUTO_4780 ?AUTO_4784 ) ) ( not ( = ?AUTO_4780 ?AUTO_4783 ) ) ( not ( = ?AUTO_4781 ?AUTO_4784 ) ) ( not ( = ?AUTO_4781 ?AUTO_4783 ) ) ( not ( = ?AUTO_4782 ?AUTO_4784 ) ) ( not ( = ?AUTO_4782 ?AUTO_4783 ) ) ( not ( = ?AUTO_4784 ?AUTO_4783 ) ) ( ON ?AUTO_4784 ?AUTO_4781 ) ( CLEAR ?AUTO_4784 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4784 ?AUTO_4781 )
      ( MAKE-ON ?AUTO_4780 ?AUTO_4781 )
      ( MAKE-ON-VERIFY ?AUTO_4780 ?AUTO_4781 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4785 - BLOCK
      ?AUTO_4786 - BLOCK
    )
    :vars
    (
      ?AUTO_4789 - BLOCK
      ?AUTO_4788 - BLOCK
      ?AUTO_4787 - BLOCK
      ?AUTO_4790 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4785 ?AUTO_4786 ) ) ( ON ?AUTO_4785 ?AUTO_4789 ) ( CLEAR ?AUTO_4785 ) ( not ( = ?AUTO_4785 ?AUTO_4789 ) ) ( not ( = ?AUTO_4786 ?AUTO_4789 ) ) ( not ( = ?AUTO_4785 ?AUTO_4788 ) ) ( not ( = ?AUTO_4785 ?AUTO_4787 ) ) ( not ( = ?AUTO_4786 ?AUTO_4788 ) ) ( not ( = ?AUTO_4786 ?AUTO_4787 ) ) ( not ( = ?AUTO_4789 ?AUTO_4788 ) ) ( not ( = ?AUTO_4789 ?AUTO_4787 ) ) ( not ( = ?AUTO_4788 ?AUTO_4787 ) ) ( ON ?AUTO_4788 ?AUTO_4786 ) ( CLEAR ?AUTO_4788 ) ( HOLDING ?AUTO_4787 ) ( CLEAR ?AUTO_4790 ) ( not ( = ?AUTO_4785 ?AUTO_4790 ) ) ( not ( = ?AUTO_4786 ?AUTO_4790 ) ) ( not ( = ?AUTO_4789 ?AUTO_4790 ) ) ( not ( = ?AUTO_4788 ?AUTO_4790 ) ) ( not ( = ?AUTO_4787 ?AUTO_4790 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4787 ?AUTO_4790 )
      ( MAKE-ON ?AUTO_4785 ?AUTO_4786 )
      ( MAKE-ON-VERIFY ?AUTO_4785 ?AUTO_4786 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4791 - BLOCK
      ?AUTO_4792 - BLOCK
    )
    :vars
    (
      ?AUTO_4796 - BLOCK
      ?AUTO_4793 - BLOCK
      ?AUTO_4794 - BLOCK
      ?AUTO_4795 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4791 ?AUTO_4792 ) ) ( ON ?AUTO_4791 ?AUTO_4796 ) ( not ( = ?AUTO_4791 ?AUTO_4796 ) ) ( not ( = ?AUTO_4792 ?AUTO_4796 ) ) ( not ( = ?AUTO_4791 ?AUTO_4793 ) ) ( not ( = ?AUTO_4791 ?AUTO_4794 ) ) ( not ( = ?AUTO_4792 ?AUTO_4793 ) ) ( not ( = ?AUTO_4792 ?AUTO_4794 ) ) ( not ( = ?AUTO_4796 ?AUTO_4793 ) ) ( not ( = ?AUTO_4796 ?AUTO_4794 ) ) ( not ( = ?AUTO_4793 ?AUTO_4794 ) ) ( ON ?AUTO_4793 ?AUTO_4792 ) ( CLEAR ?AUTO_4793 ) ( CLEAR ?AUTO_4795 ) ( not ( = ?AUTO_4791 ?AUTO_4795 ) ) ( not ( = ?AUTO_4792 ?AUTO_4795 ) ) ( not ( = ?AUTO_4796 ?AUTO_4795 ) ) ( not ( = ?AUTO_4793 ?AUTO_4795 ) ) ( not ( = ?AUTO_4794 ?AUTO_4795 ) ) ( ON ?AUTO_4794 ?AUTO_4791 ) ( CLEAR ?AUTO_4794 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4794 ?AUTO_4791 )
      ( MAKE-ON ?AUTO_4791 ?AUTO_4792 )
      ( MAKE-ON-VERIFY ?AUTO_4791 ?AUTO_4792 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4797 - BLOCK
      ?AUTO_4798 - BLOCK
    )
    :vars
    (
      ?AUTO_4802 - BLOCK
      ?AUTO_4800 - BLOCK
      ?AUTO_4799 - BLOCK
      ?AUTO_4801 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4797 ?AUTO_4798 ) ) ( ON ?AUTO_4797 ?AUTO_4802 ) ( not ( = ?AUTO_4797 ?AUTO_4802 ) ) ( not ( = ?AUTO_4798 ?AUTO_4802 ) ) ( not ( = ?AUTO_4797 ?AUTO_4800 ) ) ( not ( = ?AUTO_4797 ?AUTO_4799 ) ) ( not ( = ?AUTO_4798 ?AUTO_4800 ) ) ( not ( = ?AUTO_4798 ?AUTO_4799 ) ) ( not ( = ?AUTO_4802 ?AUTO_4800 ) ) ( not ( = ?AUTO_4802 ?AUTO_4799 ) ) ( not ( = ?AUTO_4800 ?AUTO_4799 ) ) ( CLEAR ?AUTO_4801 ) ( not ( = ?AUTO_4797 ?AUTO_4801 ) ) ( not ( = ?AUTO_4798 ?AUTO_4801 ) ) ( not ( = ?AUTO_4802 ?AUTO_4801 ) ) ( not ( = ?AUTO_4800 ?AUTO_4801 ) ) ( not ( = ?AUTO_4799 ?AUTO_4801 ) ) ( ON ?AUTO_4799 ?AUTO_4797 ) ( CLEAR ?AUTO_4799 ) ( HOLDING ?AUTO_4800 ) ( CLEAR ?AUTO_4798 ) )
    :subtasks
    ( ( !STACK ?AUTO_4800 ?AUTO_4798 )
      ( MAKE-ON ?AUTO_4797 ?AUTO_4798 )
      ( MAKE-ON-VERIFY ?AUTO_4797 ?AUTO_4798 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4803 - BLOCK
      ?AUTO_4804 - BLOCK
    )
    :vars
    (
      ?AUTO_4805 - BLOCK
      ?AUTO_4806 - BLOCK
      ?AUTO_4808 - BLOCK
      ?AUTO_4807 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4803 ?AUTO_4804 ) ) ( ON ?AUTO_4803 ?AUTO_4805 ) ( not ( = ?AUTO_4803 ?AUTO_4805 ) ) ( not ( = ?AUTO_4804 ?AUTO_4805 ) ) ( not ( = ?AUTO_4803 ?AUTO_4806 ) ) ( not ( = ?AUTO_4803 ?AUTO_4808 ) ) ( not ( = ?AUTO_4804 ?AUTO_4806 ) ) ( not ( = ?AUTO_4804 ?AUTO_4808 ) ) ( not ( = ?AUTO_4805 ?AUTO_4806 ) ) ( not ( = ?AUTO_4805 ?AUTO_4808 ) ) ( not ( = ?AUTO_4806 ?AUTO_4808 ) ) ( CLEAR ?AUTO_4807 ) ( not ( = ?AUTO_4803 ?AUTO_4807 ) ) ( not ( = ?AUTO_4804 ?AUTO_4807 ) ) ( not ( = ?AUTO_4805 ?AUTO_4807 ) ) ( not ( = ?AUTO_4806 ?AUTO_4807 ) ) ( not ( = ?AUTO_4808 ?AUTO_4807 ) ) ( ON ?AUTO_4808 ?AUTO_4803 ) ( CLEAR ?AUTO_4804 ) ( ON ?AUTO_4806 ?AUTO_4808 ) ( CLEAR ?AUTO_4806 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4806 ?AUTO_4808 )
      ( MAKE-ON ?AUTO_4803 ?AUTO_4804 )
      ( MAKE-ON-VERIFY ?AUTO_4803 ?AUTO_4804 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4809 - BLOCK
      ?AUTO_4810 - BLOCK
    )
    :vars
    (
      ?AUTO_4811 - BLOCK
      ?AUTO_4812 - BLOCK
      ?AUTO_4814 - BLOCK
      ?AUTO_4813 - BLOCK
      ?AUTO_4815 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4809 ?AUTO_4810 ) ) ( ON ?AUTO_4809 ?AUTO_4811 ) ( not ( = ?AUTO_4809 ?AUTO_4811 ) ) ( not ( = ?AUTO_4810 ?AUTO_4811 ) ) ( not ( = ?AUTO_4809 ?AUTO_4812 ) ) ( not ( = ?AUTO_4809 ?AUTO_4814 ) ) ( not ( = ?AUTO_4810 ?AUTO_4812 ) ) ( not ( = ?AUTO_4810 ?AUTO_4814 ) ) ( not ( = ?AUTO_4811 ?AUTO_4812 ) ) ( not ( = ?AUTO_4811 ?AUTO_4814 ) ) ( not ( = ?AUTO_4812 ?AUTO_4814 ) ) ( not ( = ?AUTO_4809 ?AUTO_4813 ) ) ( not ( = ?AUTO_4810 ?AUTO_4813 ) ) ( not ( = ?AUTO_4811 ?AUTO_4813 ) ) ( not ( = ?AUTO_4812 ?AUTO_4813 ) ) ( not ( = ?AUTO_4814 ?AUTO_4813 ) ) ( ON ?AUTO_4814 ?AUTO_4809 ) ( CLEAR ?AUTO_4810 ) ( ON ?AUTO_4812 ?AUTO_4814 ) ( CLEAR ?AUTO_4812 ) ( HOLDING ?AUTO_4813 ) ( CLEAR ?AUTO_4815 ) ( not ( = ?AUTO_4809 ?AUTO_4815 ) ) ( not ( = ?AUTO_4810 ?AUTO_4815 ) ) ( not ( = ?AUTO_4811 ?AUTO_4815 ) ) ( not ( = ?AUTO_4812 ?AUTO_4815 ) ) ( not ( = ?AUTO_4814 ?AUTO_4815 ) ) ( not ( = ?AUTO_4813 ?AUTO_4815 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4813 ?AUTO_4815 )
      ( MAKE-ON ?AUTO_4809 ?AUTO_4810 )
      ( MAKE-ON-VERIFY ?AUTO_4809 ?AUTO_4810 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4818 - BLOCK
      ?AUTO_4819 - BLOCK
    )
    :vars
    (
      ?AUTO_4823 - BLOCK
      ?AUTO_4822 - BLOCK
      ?AUTO_4821 - BLOCK
      ?AUTO_4820 - BLOCK
      ?AUTO_4824 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4818 ?AUTO_4819 ) ) ( ON ?AUTO_4818 ?AUTO_4823 ) ( not ( = ?AUTO_4818 ?AUTO_4823 ) ) ( not ( = ?AUTO_4819 ?AUTO_4823 ) ) ( not ( = ?AUTO_4818 ?AUTO_4822 ) ) ( not ( = ?AUTO_4818 ?AUTO_4821 ) ) ( not ( = ?AUTO_4819 ?AUTO_4822 ) ) ( not ( = ?AUTO_4819 ?AUTO_4821 ) ) ( not ( = ?AUTO_4823 ?AUTO_4822 ) ) ( not ( = ?AUTO_4823 ?AUTO_4821 ) ) ( not ( = ?AUTO_4822 ?AUTO_4821 ) ) ( CLEAR ?AUTO_4820 ) ( not ( = ?AUTO_4818 ?AUTO_4820 ) ) ( not ( = ?AUTO_4819 ?AUTO_4820 ) ) ( not ( = ?AUTO_4823 ?AUTO_4820 ) ) ( not ( = ?AUTO_4822 ?AUTO_4820 ) ) ( not ( = ?AUTO_4821 ?AUTO_4820 ) ) ( ON ?AUTO_4821 ?AUTO_4818 ) ( ON ?AUTO_4822 ?AUTO_4821 ) ( CLEAR ?AUTO_4822 ) ( HOLDING ?AUTO_4819 ) ( CLEAR ?AUTO_4824 ) ( not ( = ?AUTO_4818 ?AUTO_4824 ) ) ( not ( = ?AUTO_4819 ?AUTO_4824 ) ) ( not ( = ?AUTO_4823 ?AUTO_4824 ) ) ( not ( = ?AUTO_4822 ?AUTO_4824 ) ) ( not ( = ?AUTO_4821 ?AUTO_4824 ) ) ( not ( = ?AUTO_4820 ?AUTO_4824 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4819 ?AUTO_4824 )
      ( MAKE-ON ?AUTO_4818 ?AUTO_4819 )
      ( MAKE-ON-VERIFY ?AUTO_4818 ?AUTO_4819 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4829 - BLOCK
      ?AUTO_4830 - BLOCK
    )
    :vars
    (
      ?AUTO_4831 - BLOCK
      ?AUTO_4834 - BLOCK
      ?AUTO_4833 - BLOCK
      ?AUTO_4835 - BLOCK
      ?AUTO_4832 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4829 ?AUTO_4830 ) ) ( ON ?AUTO_4829 ?AUTO_4831 ) ( not ( = ?AUTO_4829 ?AUTO_4831 ) ) ( not ( = ?AUTO_4830 ?AUTO_4831 ) ) ( not ( = ?AUTO_4829 ?AUTO_4834 ) ) ( not ( = ?AUTO_4829 ?AUTO_4833 ) ) ( not ( = ?AUTO_4830 ?AUTO_4834 ) ) ( not ( = ?AUTO_4830 ?AUTO_4833 ) ) ( not ( = ?AUTO_4831 ?AUTO_4834 ) ) ( not ( = ?AUTO_4831 ?AUTO_4833 ) ) ( not ( = ?AUTO_4834 ?AUTO_4833 ) ) ( not ( = ?AUTO_4829 ?AUTO_4835 ) ) ( not ( = ?AUTO_4830 ?AUTO_4835 ) ) ( not ( = ?AUTO_4831 ?AUTO_4835 ) ) ( not ( = ?AUTO_4834 ?AUTO_4835 ) ) ( not ( = ?AUTO_4833 ?AUTO_4835 ) ) ( ON ?AUTO_4833 ?AUTO_4829 ) ( ON ?AUTO_4834 ?AUTO_4833 ) ( CLEAR ?AUTO_4834 ) ( CLEAR ?AUTO_4832 ) ( not ( = ?AUTO_4829 ?AUTO_4832 ) ) ( not ( = ?AUTO_4830 ?AUTO_4832 ) ) ( not ( = ?AUTO_4831 ?AUTO_4832 ) ) ( not ( = ?AUTO_4834 ?AUTO_4832 ) ) ( not ( = ?AUTO_4833 ?AUTO_4832 ) ) ( not ( = ?AUTO_4835 ?AUTO_4832 ) ) ( ON ?AUTO_4835 ?AUTO_4830 ) ( CLEAR ?AUTO_4835 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4835 ?AUTO_4830 )
      ( MAKE-ON ?AUTO_4829 ?AUTO_4830 )
      ( MAKE-ON-VERIFY ?AUTO_4829 ?AUTO_4830 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4836 - BLOCK
      ?AUTO_4837 - BLOCK
    )
    :vars
    (
      ?AUTO_4841 - BLOCK
      ?AUTO_4842 - BLOCK
      ?AUTO_4838 - BLOCK
      ?AUTO_4839 - BLOCK
      ?AUTO_4840 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4836 ?AUTO_4837 ) ) ( ON ?AUTO_4836 ?AUTO_4841 ) ( not ( = ?AUTO_4836 ?AUTO_4841 ) ) ( not ( = ?AUTO_4837 ?AUTO_4841 ) ) ( not ( = ?AUTO_4836 ?AUTO_4842 ) ) ( not ( = ?AUTO_4836 ?AUTO_4838 ) ) ( not ( = ?AUTO_4837 ?AUTO_4842 ) ) ( not ( = ?AUTO_4837 ?AUTO_4838 ) ) ( not ( = ?AUTO_4841 ?AUTO_4842 ) ) ( not ( = ?AUTO_4841 ?AUTO_4838 ) ) ( not ( = ?AUTO_4842 ?AUTO_4838 ) ) ( not ( = ?AUTO_4836 ?AUTO_4839 ) ) ( not ( = ?AUTO_4837 ?AUTO_4839 ) ) ( not ( = ?AUTO_4841 ?AUTO_4839 ) ) ( not ( = ?AUTO_4842 ?AUTO_4839 ) ) ( not ( = ?AUTO_4838 ?AUTO_4839 ) ) ( ON ?AUTO_4838 ?AUTO_4836 ) ( CLEAR ?AUTO_4840 ) ( not ( = ?AUTO_4836 ?AUTO_4840 ) ) ( not ( = ?AUTO_4837 ?AUTO_4840 ) ) ( not ( = ?AUTO_4841 ?AUTO_4840 ) ) ( not ( = ?AUTO_4842 ?AUTO_4840 ) ) ( not ( = ?AUTO_4838 ?AUTO_4840 ) ) ( not ( = ?AUTO_4839 ?AUTO_4840 ) ) ( ON ?AUTO_4839 ?AUTO_4837 ) ( CLEAR ?AUTO_4839 ) ( HOLDING ?AUTO_4842 ) ( CLEAR ?AUTO_4838 ) )
    :subtasks
    ( ( !STACK ?AUTO_4842 ?AUTO_4838 )
      ( MAKE-ON ?AUTO_4836 ?AUTO_4837 )
      ( MAKE-ON-VERIFY ?AUTO_4836 ?AUTO_4837 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4843 - BLOCK
      ?AUTO_4844 - BLOCK
    )
    :vars
    (
      ?AUTO_4847 - BLOCK
      ?AUTO_4846 - BLOCK
      ?AUTO_4848 - BLOCK
      ?AUTO_4845 - BLOCK
      ?AUTO_4849 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4843 ?AUTO_4844 ) ) ( ON ?AUTO_4843 ?AUTO_4847 ) ( not ( = ?AUTO_4843 ?AUTO_4847 ) ) ( not ( = ?AUTO_4844 ?AUTO_4847 ) ) ( not ( = ?AUTO_4843 ?AUTO_4846 ) ) ( not ( = ?AUTO_4843 ?AUTO_4848 ) ) ( not ( = ?AUTO_4844 ?AUTO_4846 ) ) ( not ( = ?AUTO_4844 ?AUTO_4848 ) ) ( not ( = ?AUTO_4847 ?AUTO_4846 ) ) ( not ( = ?AUTO_4847 ?AUTO_4848 ) ) ( not ( = ?AUTO_4846 ?AUTO_4848 ) ) ( not ( = ?AUTO_4843 ?AUTO_4845 ) ) ( not ( = ?AUTO_4844 ?AUTO_4845 ) ) ( not ( = ?AUTO_4847 ?AUTO_4845 ) ) ( not ( = ?AUTO_4846 ?AUTO_4845 ) ) ( not ( = ?AUTO_4848 ?AUTO_4845 ) ) ( ON ?AUTO_4848 ?AUTO_4843 ) ( CLEAR ?AUTO_4849 ) ( not ( = ?AUTO_4843 ?AUTO_4849 ) ) ( not ( = ?AUTO_4844 ?AUTO_4849 ) ) ( not ( = ?AUTO_4847 ?AUTO_4849 ) ) ( not ( = ?AUTO_4846 ?AUTO_4849 ) ) ( not ( = ?AUTO_4848 ?AUTO_4849 ) ) ( not ( = ?AUTO_4845 ?AUTO_4849 ) ) ( ON ?AUTO_4845 ?AUTO_4844 ) ( CLEAR ?AUTO_4848 ) ( ON ?AUTO_4846 ?AUTO_4845 ) ( CLEAR ?AUTO_4846 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4846 ?AUTO_4845 )
      ( MAKE-ON ?AUTO_4843 ?AUTO_4844 )
      ( MAKE-ON-VERIFY ?AUTO_4843 ?AUTO_4844 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4850 - BLOCK
      ?AUTO_4851 - BLOCK
    )
    :vars
    (
      ?AUTO_4854 - BLOCK
      ?AUTO_4853 - BLOCK
      ?AUTO_4856 - BLOCK
      ?AUTO_4852 - BLOCK
      ?AUTO_4855 - BLOCK
      ?AUTO_4857 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4850 ?AUTO_4851 ) ) ( ON ?AUTO_4850 ?AUTO_4854 ) ( not ( = ?AUTO_4850 ?AUTO_4854 ) ) ( not ( = ?AUTO_4851 ?AUTO_4854 ) ) ( not ( = ?AUTO_4850 ?AUTO_4853 ) ) ( not ( = ?AUTO_4850 ?AUTO_4856 ) ) ( not ( = ?AUTO_4851 ?AUTO_4853 ) ) ( not ( = ?AUTO_4851 ?AUTO_4856 ) ) ( not ( = ?AUTO_4854 ?AUTO_4853 ) ) ( not ( = ?AUTO_4854 ?AUTO_4856 ) ) ( not ( = ?AUTO_4853 ?AUTO_4856 ) ) ( not ( = ?AUTO_4850 ?AUTO_4852 ) ) ( not ( = ?AUTO_4851 ?AUTO_4852 ) ) ( not ( = ?AUTO_4854 ?AUTO_4852 ) ) ( not ( = ?AUTO_4853 ?AUTO_4852 ) ) ( not ( = ?AUTO_4856 ?AUTO_4852 ) ) ( ON ?AUTO_4856 ?AUTO_4850 ) ( CLEAR ?AUTO_4855 ) ( not ( = ?AUTO_4850 ?AUTO_4855 ) ) ( not ( = ?AUTO_4851 ?AUTO_4855 ) ) ( not ( = ?AUTO_4854 ?AUTO_4855 ) ) ( not ( = ?AUTO_4853 ?AUTO_4855 ) ) ( not ( = ?AUTO_4856 ?AUTO_4855 ) ) ( not ( = ?AUTO_4852 ?AUTO_4855 ) ) ( ON ?AUTO_4852 ?AUTO_4851 ) ( CLEAR ?AUTO_4856 ) ( ON ?AUTO_4853 ?AUTO_4852 ) ( CLEAR ?AUTO_4853 ) ( HOLDING ?AUTO_4857 ) ( not ( = ?AUTO_4850 ?AUTO_4857 ) ) ( not ( = ?AUTO_4851 ?AUTO_4857 ) ) ( not ( = ?AUTO_4854 ?AUTO_4857 ) ) ( not ( = ?AUTO_4853 ?AUTO_4857 ) ) ( not ( = ?AUTO_4856 ?AUTO_4857 ) ) ( not ( = ?AUTO_4852 ?AUTO_4857 ) ) ( not ( = ?AUTO_4855 ?AUTO_4857 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4857 )
      ( MAKE-ON ?AUTO_4850 ?AUTO_4851 )
      ( MAKE-ON-VERIFY ?AUTO_4850 ?AUTO_4851 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4858 - BLOCK
      ?AUTO_4859 - BLOCK
    )
    :vars
    (
      ?AUTO_4860 - BLOCK
      ?AUTO_4862 - BLOCK
      ?AUTO_4863 - BLOCK
      ?AUTO_4861 - BLOCK
      ?AUTO_4865 - BLOCK
      ?AUTO_4864 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4858 ?AUTO_4859 ) ) ( ON ?AUTO_4858 ?AUTO_4860 ) ( not ( = ?AUTO_4858 ?AUTO_4860 ) ) ( not ( = ?AUTO_4859 ?AUTO_4860 ) ) ( not ( = ?AUTO_4858 ?AUTO_4862 ) ) ( not ( = ?AUTO_4858 ?AUTO_4863 ) ) ( not ( = ?AUTO_4859 ?AUTO_4862 ) ) ( not ( = ?AUTO_4859 ?AUTO_4863 ) ) ( not ( = ?AUTO_4860 ?AUTO_4862 ) ) ( not ( = ?AUTO_4860 ?AUTO_4863 ) ) ( not ( = ?AUTO_4862 ?AUTO_4863 ) ) ( not ( = ?AUTO_4858 ?AUTO_4861 ) ) ( not ( = ?AUTO_4859 ?AUTO_4861 ) ) ( not ( = ?AUTO_4860 ?AUTO_4861 ) ) ( not ( = ?AUTO_4862 ?AUTO_4861 ) ) ( not ( = ?AUTO_4863 ?AUTO_4861 ) ) ( ON ?AUTO_4863 ?AUTO_4858 ) ( CLEAR ?AUTO_4865 ) ( not ( = ?AUTO_4858 ?AUTO_4865 ) ) ( not ( = ?AUTO_4859 ?AUTO_4865 ) ) ( not ( = ?AUTO_4860 ?AUTO_4865 ) ) ( not ( = ?AUTO_4862 ?AUTO_4865 ) ) ( not ( = ?AUTO_4863 ?AUTO_4865 ) ) ( not ( = ?AUTO_4861 ?AUTO_4865 ) ) ( ON ?AUTO_4861 ?AUTO_4859 ) ( CLEAR ?AUTO_4863 ) ( ON ?AUTO_4862 ?AUTO_4861 ) ( not ( = ?AUTO_4858 ?AUTO_4864 ) ) ( not ( = ?AUTO_4859 ?AUTO_4864 ) ) ( not ( = ?AUTO_4860 ?AUTO_4864 ) ) ( not ( = ?AUTO_4862 ?AUTO_4864 ) ) ( not ( = ?AUTO_4863 ?AUTO_4864 ) ) ( not ( = ?AUTO_4861 ?AUTO_4864 ) ) ( not ( = ?AUTO_4865 ?AUTO_4864 ) ) ( ON ?AUTO_4864 ?AUTO_4862 ) ( CLEAR ?AUTO_4864 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4864 ?AUTO_4862 )
      ( MAKE-ON ?AUTO_4858 ?AUTO_4859 )
      ( MAKE-ON-VERIFY ?AUTO_4858 ?AUTO_4859 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4866 - BLOCK
      ?AUTO_4867 - BLOCK
    )
    :vars
    (
      ?AUTO_4870 - BLOCK
      ?AUTO_4869 - BLOCK
      ?AUTO_4868 - BLOCK
      ?AUTO_4872 - BLOCK
      ?AUTO_4871 - BLOCK
      ?AUTO_4873 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4866 ?AUTO_4867 ) ) ( ON ?AUTO_4866 ?AUTO_4870 ) ( not ( = ?AUTO_4866 ?AUTO_4870 ) ) ( not ( = ?AUTO_4867 ?AUTO_4870 ) ) ( not ( = ?AUTO_4866 ?AUTO_4869 ) ) ( not ( = ?AUTO_4866 ?AUTO_4868 ) ) ( not ( = ?AUTO_4867 ?AUTO_4869 ) ) ( not ( = ?AUTO_4867 ?AUTO_4868 ) ) ( not ( = ?AUTO_4870 ?AUTO_4869 ) ) ( not ( = ?AUTO_4870 ?AUTO_4868 ) ) ( not ( = ?AUTO_4869 ?AUTO_4868 ) ) ( not ( = ?AUTO_4866 ?AUTO_4872 ) ) ( not ( = ?AUTO_4867 ?AUTO_4872 ) ) ( not ( = ?AUTO_4870 ?AUTO_4872 ) ) ( not ( = ?AUTO_4869 ?AUTO_4872 ) ) ( not ( = ?AUTO_4868 ?AUTO_4872 ) ) ( CLEAR ?AUTO_4871 ) ( not ( = ?AUTO_4866 ?AUTO_4871 ) ) ( not ( = ?AUTO_4867 ?AUTO_4871 ) ) ( not ( = ?AUTO_4870 ?AUTO_4871 ) ) ( not ( = ?AUTO_4869 ?AUTO_4871 ) ) ( not ( = ?AUTO_4868 ?AUTO_4871 ) ) ( not ( = ?AUTO_4872 ?AUTO_4871 ) ) ( ON ?AUTO_4872 ?AUTO_4867 ) ( ON ?AUTO_4869 ?AUTO_4872 ) ( not ( = ?AUTO_4866 ?AUTO_4873 ) ) ( not ( = ?AUTO_4867 ?AUTO_4873 ) ) ( not ( = ?AUTO_4870 ?AUTO_4873 ) ) ( not ( = ?AUTO_4869 ?AUTO_4873 ) ) ( not ( = ?AUTO_4868 ?AUTO_4873 ) ) ( not ( = ?AUTO_4872 ?AUTO_4873 ) ) ( not ( = ?AUTO_4871 ?AUTO_4873 ) ) ( ON ?AUTO_4873 ?AUTO_4869 ) ( CLEAR ?AUTO_4873 ) ( HOLDING ?AUTO_4868 ) ( CLEAR ?AUTO_4866 ) )
    :subtasks
    ( ( !STACK ?AUTO_4868 ?AUTO_4866 )
      ( MAKE-ON ?AUTO_4866 ?AUTO_4867 )
      ( MAKE-ON-VERIFY ?AUTO_4866 ?AUTO_4867 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4874 - BLOCK
      ?AUTO_4875 - BLOCK
    )
    :vars
    (
      ?AUTO_4878 - BLOCK
      ?AUTO_4879 - BLOCK
      ?AUTO_4880 - BLOCK
      ?AUTO_4881 - BLOCK
      ?AUTO_4877 - BLOCK
      ?AUTO_4876 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4874 ?AUTO_4875 ) ) ( ON ?AUTO_4874 ?AUTO_4878 ) ( not ( = ?AUTO_4874 ?AUTO_4878 ) ) ( not ( = ?AUTO_4875 ?AUTO_4878 ) ) ( not ( = ?AUTO_4874 ?AUTO_4879 ) ) ( not ( = ?AUTO_4874 ?AUTO_4880 ) ) ( not ( = ?AUTO_4875 ?AUTO_4879 ) ) ( not ( = ?AUTO_4875 ?AUTO_4880 ) ) ( not ( = ?AUTO_4878 ?AUTO_4879 ) ) ( not ( = ?AUTO_4878 ?AUTO_4880 ) ) ( not ( = ?AUTO_4879 ?AUTO_4880 ) ) ( not ( = ?AUTO_4874 ?AUTO_4881 ) ) ( not ( = ?AUTO_4875 ?AUTO_4881 ) ) ( not ( = ?AUTO_4878 ?AUTO_4881 ) ) ( not ( = ?AUTO_4879 ?AUTO_4881 ) ) ( not ( = ?AUTO_4880 ?AUTO_4881 ) ) ( CLEAR ?AUTO_4877 ) ( not ( = ?AUTO_4874 ?AUTO_4877 ) ) ( not ( = ?AUTO_4875 ?AUTO_4877 ) ) ( not ( = ?AUTO_4878 ?AUTO_4877 ) ) ( not ( = ?AUTO_4879 ?AUTO_4877 ) ) ( not ( = ?AUTO_4880 ?AUTO_4877 ) ) ( not ( = ?AUTO_4881 ?AUTO_4877 ) ) ( ON ?AUTO_4881 ?AUTO_4875 ) ( ON ?AUTO_4879 ?AUTO_4881 ) ( not ( = ?AUTO_4874 ?AUTO_4876 ) ) ( not ( = ?AUTO_4875 ?AUTO_4876 ) ) ( not ( = ?AUTO_4878 ?AUTO_4876 ) ) ( not ( = ?AUTO_4879 ?AUTO_4876 ) ) ( not ( = ?AUTO_4880 ?AUTO_4876 ) ) ( not ( = ?AUTO_4881 ?AUTO_4876 ) ) ( not ( = ?AUTO_4877 ?AUTO_4876 ) ) ( ON ?AUTO_4876 ?AUTO_4879 ) ( CLEAR ?AUTO_4876 ) ( CLEAR ?AUTO_4874 ) ( ON-TABLE ?AUTO_4880 ) ( CLEAR ?AUTO_4880 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_4880 )
      ( MAKE-ON ?AUTO_4874 ?AUTO_4875 )
      ( MAKE-ON-VERIFY ?AUTO_4874 ?AUTO_4875 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4886 - BLOCK
      ?AUTO_4887 - BLOCK
    )
    :vars
    (
      ?AUTO_4892 - BLOCK
      ?AUTO_4890 - BLOCK
      ?AUTO_4888 - BLOCK
      ?AUTO_4889 - BLOCK
      ?AUTO_4891 - BLOCK
      ?AUTO_4893 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4886 ?AUTO_4887 ) ) ( ON-TABLE ?AUTO_4886 ) ( CLEAR ?AUTO_4886 ) ( CLEAR ?AUTO_4892 ) ( not ( = ?AUTO_4886 ?AUTO_4890 ) ) ( not ( = ?AUTO_4886 ?AUTO_4892 ) ) ( not ( = ?AUTO_4887 ?AUTO_4890 ) ) ( not ( = ?AUTO_4887 ?AUTO_4892 ) ) ( not ( = ?AUTO_4890 ?AUTO_4892 ) ) ( ON ?AUTO_4890 ?AUTO_4887 ) ( not ( = ?AUTO_4886 ?AUTO_4888 ) ) ( not ( = ?AUTO_4887 ?AUTO_4888 ) ) ( not ( = ?AUTO_4892 ?AUTO_4888 ) ) ( not ( = ?AUTO_4890 ?AUTO_4888 ) ) ( ON ?AUTO_4888 ?AUTO_4890 ) ( CLEAR ?AUTO_4889 ) ( not ( = ?AUTO_4886 ?AUTO_4891 ) ) ( not ( = ?AUTO_4886 ?AUTO_4889 ) ) ( not ( = ?AUTO_4887 ?AUTO_4891 ) ) ( not ( = ?AUTO_4887 ?AUTO_4889 ) ) ( not ( = ?AUTO_4892 ?AUTO_4891 ) ) ( not ( = ?AUTO_4892 ?AUTO_4889 ) ) ( not ( = ?AUTO_4890 ?AUTO_4891 ) ) ( not ( = ?AUTO_4890 ?AUTO_4889 ) ) ( not ( = ?AUTO_4888 ?AUTO_4891 ) ) ( not ( = ?AUTO_4888 ?AUTO_4889 ) ) ( not ( = ?AUTO_4891 ?AUTO_4889 ) ) ( ON ?AUTO_4891 ?AUTO_4888 ) ( CLEAR ?AUTO_4891 ) ( HOLDING ?AUTO_4893 ) ( not ( = ?AUTO_4886 ?AUTO_4893 ) ) ( not ( = ?AUTO_4887 ?AUTO_4893 ) ) ( not ( = ?AUTO_4892 ?AUTO_4893 ) ) ( not ( = ?AUTO_4890 ?AUTO_4893 ) ) ( not ( = ?AUTO_4888 ?AUTO_4893 ) ) ( not ( = ?AUTO_4889 ?AUTO_4893 ) ) ( not ( = ?AUTO_4891 ?AUTO_4893 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4893 )
      ( MAKE-ON ?AUTO_4886 ?AUTO_4887 )
      ( MAKE-ON-VERIFY ?AUTO_4886 ?AUTO_4887 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4902 - BLOCK
      ?AUTO_4903 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4902 ) ( CLEAR ?AUTO_4903 ) ( not ( = ?AUTO_4902 ?AUTO_4903 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4902 ?AUTO_4903 )
      ( MAKE-ON-VERIFY ?AUTO_4902 ?AUTO_4903 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4904 - BLOCK
      ?AUTO_4905 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4905 ) ( not ( = ?AUTO_4904 ?AUTO_4905 ) ) ( ON-TABLE ?AUTO_4904 ) ( CLEAR ?AUTO_4904 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_4904 )
      ( MAKE-ON ?AUTO_4904 ?AUTO_4905 )
      ( MAKE-ON-VERIFY ?AUTO_4904 ?AUTO_4905 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4906 - BLOCK
      ?AUTO_4907 - BLOCK
    )
    :vars
    (
      ?AUTO_4908 - BLOCK
      ?AUTO_4909 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4907 ) ( not ( = ?AUTO_4906 ?AUTO_4907 ) ) ( ON-TABLE ?AUTO_4906 ) ( CLEAR ?AUTO_4906 ) ( HOLDING ?AUTO_4908 ) ( CLEAR ?AUTO_4909 ) ( not ( = ?AUTO_4906 ?AUTO_4908 ) ) ( not ( = ?AUTO_4906 ?AUTO_4909 ) ) ( not ( = ?AUTO_4907 ?AUTO_4908 ) ) ( not ( = ?AUTO_4907 ?AUTO_4909 ) ) ( not ( = ?AUTO_4908 ?AUTO_4909 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4908 ?AUTO_4909 )
      ( MAKE-ON ?AUTO_4906 ?AUTO_4907 )
      ( MAKE-ON-VERIFY ?AUTO_4906 ?AUTO_4907 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4910 - BLOCK
      ?AUTO_4911 - BLOCK
    )
    :vars
    (
      ?AUTO_4912 - BLOCK
      ?AUTO_4913 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4911 ) ( not ( = ?AUTO_4910 ?AUTO_4911 ) ) ( ON-TABLE ?AUTO_4910 ) ( CLEAR ?AUTO_4912 ) ( not ( = ?AUTO_4910 ?AUTO_4913 ) ) ( not ( = ?AUTO_4910 ?AUTO_4912 ) ) ( not ( = ?AUTO_4911 ?AUTO_4913 ) ) ( not ( = ?AUTO_4911 ?AUTO_4912 ) ) ( not ( = ?AUTO_4913 ?AUTO_4912 ) ) ( ON ?AUTO_4913 ?AUTO_4910 ) ( CLEAR ?AUTO_4913 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4913 ?AUTO_4910 )
      ( MAKE-ON ?AUTO_4910 ?AUTO_4911 )
      ( MAKE-ON-VERIFY ?AUTO_4910 ?AUTO_4911 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4914 - BLOCK
      ?AUTO_4915 - BLOCK
    )
    :vars
    (
      ?AUTO_4917 - BLOCK
      ?AUTO_4916 - BLOCK
      ?AUTO_4918 - BLOCK
      ?AUTO_4919 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4915 ) ( not ( = ?AUTO_4914 ?AUTO_4915 ) ) ( ON-TABLE ?AUTO_4914 ) ( CLEAR ?AUTO_4917 ) ( not ( = ?AUTO_4914 ?AUTO_4916 ) ) ( not ( = ?AUTO_4914 ?AUTO_4917 ) ) ( not ( = ?AUTO_4915 ?AUTO_4916 ) ) ( not ( = ?AUTO_4915 ?AUTO_4917 ) ) ( not ( = ?AUTO_4916 ?AUTO_4917 ) ) ( ON ?AUTO_4916 ?AUTO_4914 ) ( CLEAR ?AUTO_4916 ) ( HOLDING ?AUTO_4918 ) ( CLEAR ?AUTO_4919 ) ( not ( = ?AUTO_4914 ?AUTO_4918 ) ) ( not ( = ?AUTO_4914 ?AUTO_4919 ) ) ( not ( = ?AUTO_4915 ?AUTO_4918 ) ) ( not ( = ?AUTO_4915 ?AUTO_4919 ) ) ( not ( = ?AUTO_4917 ?AUTO_4918 ) ) ( not ( = ?AUTO_4917 ?AUTO_4919 ) ) ( not ( = ?AUTO_4916 ?AUTO_4918 ) ) ( not ( = ?AUTO_4916 ?AUTO_4919 ) ) ( not ( = ?AUTO_4918 ?AUTO_4919 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4918 ?AUTO_4919 )
      ( MAKE-ON ?AUTO_4914 ?AUTO_4915 )
      ( MAKE-ON-VERIFY ?AUTO_4914 ?AUTO_4915 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4924 - BLOCK
      ?AUTO_4925 - BLOCK
    )
    :vars
    (
      ?AUTO_4926 - BLOCK
      ?AUTO_4927 - BLOCK
      ?AUTO_4928 - BLOCK
      ?AUTO_4929 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4925 ) ( not ( = ?AUTO_4924 ?AUTO_4925 ) ) ( ON-TABLE ?AUTO_4924 ) ( CLEAR ?AUTO_4926 ) ( not ( = ?AUTO_4924 ?AUTO_4927 ) ) ( not ( = ?AUTO_4924 ?AUTO_4926 ) ) ( not ( = ?AUTO_4925 ?AUTO_4927 ) ) ( not ( = ?AUTO_4925 ?AUTO_4926 ) ) ( not ( = ?AUTO_4927 ?AUTO_4926 ) ) ( ON ?AUTO_4927 ?AUTO_4924 ) ( CLEAR ?AUTO_4928 ) ( not ( = ?AUTO_4924 ?AUTO_4929 ) ) ( not ( = ?AUTO_4924 ?AUTO_4928 ) ) ( not ( = ?AUTO_4925 ?AUTO_4929 ) ) ( not ( = ?AUTO_4925 ?AUTO_4928 ) ) ( not ( = ?AUTO_4926 ?AUTO_4929 ) ) ( not ( = ?AUTO_4926 ?AUTO_4928 ) ) ( not ( = ?AUTO_4927 ?AUTO_4929 ) ) ( not ( = ?AUTO_4927 ?AUTO_4928 ) ) ( not ( = ?AUTO_4929 ?AUTO_4928 ) ) ( ON ?AUTO_4929 ?AUTO_4927 ) ( CLEAR ?AUTO_4929 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4929 ?AUTO_4927 )
      ( MAKE-ON ?AUTO_4924 ?AUTO_4925 )
      ( MAKE-ON-VERIFY ?AUTO_4924 ?AUTO_4925 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4930 - BLOCK
      ?AUTO_4931 - BLOCK
    )
    :vars
    (
      ?AUTO_4932 - BLOCK
      ?AUTO_4934 - BLOCK
      ?AUTO_4935 - BLOCK
      ?AUTO_4933 - BLOCK
      ?AUTO_4936 - BLOCK
      ?AUTO_4937 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4931 ) ( not ( = ?AUTO_4930 ?AUTO_4931 ) ) ( ON-TABLE ?AUTO_4930 ) ( CLEAR ?AUTO_4932 ) ( not ( = ?AUTO_4930 ?AUTO_4934 ) ) ( not ( = ?AUTO_4930 ?AUTO_4932 ) ) ( not ( = ?AUTO_4931 ?AUTO_4934 ) ) ( not ( = ?AUTO_4931 ?AUTO_4932 ) ) ( not ( = ?AUTO_4934 ?AUTO_4932 ) ) ( ON ?AUTO_4934 ?AUTO_4930 ) ( CLEAR ?AUTO_4935 ) ( not ( = ?AUTO_4930 ?AUTO_4933 ) ) ( not ( = ?AUTO_4930 ?AUTO_4935 ) ) ( not ( = ?AUTO_4931 ?AUTO_4933 ) ) ( not ( = ?AUTO_4931 ?AUTO_4935 ) ) ( not ( = ?AUTO_4932 ?AUTO_4933 ) ) ( not ( = ?AUTO_4932 ?AUTO_4935 ) ) ( not ( = ?AUTO_4934 ?AUTO_4933 ) ) ( not ( = ?AUTO_4934 ?AUTO_4935 ) ) ( not ( = ?AUTO_4933 ?AUTO_4935 ) ) ( ON ?AUTO_4933 ?AUTO_4934 ) ( CLEAR ?AUTO_4933 ) ( HOLDING ?AUTO_4936 ) ( CLEAR ?AUTO_4937 ) ( not ( = ?AUTO_4930 ?AUTO_4936 ) ) ( not ( = ?AUTO_4930 ?AUTO_4937 ) ) ( not ( = ?AUTO_4931 ?AUTO_4936 ) ) ( not ( = ?AUTO_4931 ?AUTO_4937 ) ) ( not ( = ?AUTO_4932 ?AUTO_4936 ) ) ( not ( = ?AUTO_4932 ?AUTO_4937 ) ) ( not ( = ?AUTO_4934 ?AUTO_4936 ) ) ( not ( = ?AUTO_4934 ?AUTO_4937 ) ) ( not ( = ?AUTO_4935 ?AUTO_4936 ) ) ( not ( = ?AUTO_4935 ?AUTO_4937 ) ) ( not ( = ?AUTO_4933 ?AUTO_4936 ) ) ( not ( = ?AUTO_4933 ?AUTO_4937 ) ) ( not ( = ?AUTO_4936 ?AUTO_4937 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4936 ?AUTO_4937 )
      ( MAKE-ON ?AUTO_4930 ?AUTO_4931 )
      ( MAKE-ON-VERIFY ?AUTO_4930 ?AUTO_4931 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4938 - BLOCK
      ?AUTO_4939 - BLOCK
    )
    :vars
    (
      ?AUTO_4943 - BLOCK
      ?AUTO_4945 - BLOCK
      ?AUTO_4944 - BLOCK
      ?AUTO_4940 - BLOCK
      ?AUTO_4941 - BLOCK
      ?AUTO_4942 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4939 ) ( not ( = ?AUTO_4938 ?AUTO_4939 ) ) ( ON-TABLE ?AUTO_4938 ) ( CLEAR ?AUTO_4943 ) ( not ( = ?AUTO_4938 ?AUTO_4945 ) ) ( not ( = ?AUTO_4938 ?AUTO_4943 ) ) ( not ( = ?AUTO_4939 ?AUTO_4945 ) ) ( not ( = ?AUTO_4939 ?AUTO_4943 ) ) ( not ( = ?AUTO_4945 ?AUTO_4943 ) ) ( ON ?AUTO_4945 ?AUTO_4938 ) ( CLEAR ?AUTO_4944 ) ( not ( = ?AUTO_4938 ?AUTO_4940 ) ) ( not ( = ?AUTO_4938 ?AUTO_4944 ) ) ( not ( = ?AUTO_4939 ?AUTO_4940 ) ) ( not ( = ?AUTO_4939 ?AUTO_4944 ) ) ( not ( = ?AUTO_4943 ?AUTO_4940 ) ) ( not ( = ?AUTO_4943 ?AUTO_4944 ) ) ( not ( = ?AUTO_4945 ?AUTO_4940 ) ) ( not ( = ?AUTO_4945 ?AUTO_4944 ) ) ( not ( = ?AUTO_4940 ?AUTO_4944 ) ) ( ON ?AUTO_4940 ?AUTO_4945 ) ( CLEAR ?AUTO_4941 ) ( not ( = ?AUTO_4938 ?AUTO_4942 ) ) ( not ( = ?AUTO_4938 ?AUTO_4941 ) ) ( not ( = ?AUTO_4939 ?AUTO_4942 ) ) ( not ( = ?AUTO_4939 ?AUTO_4941 ) ) ( not ( = ?AUTO_4943 ?AUTO_4942 ) ) ( not ( = ?AUTO_4943 ?AUTO_4941 ) ) ( not ( = ?AUTO_4945 ?AUTO_4942 ) ) ( not ( = ?AUTO_4945 ?AUTO_4941 ) ) ( not ( = ?AUTO_4944 ?AUTO_4942 ) ) ( not ( = ?AUTO_4944 ?AUTO_4941 ) ) ( not ( = ?AUTO_4940 ?AUTO_4942 ) ) ( not ( = ?AUTO_4940 ?AUTO_4941 ) ) ( not ( = ?AUTO_4942 ?AUTO_4941 ) ) ( ON ?AUTO_4942 ?AUTO_4940 ) ( CLEAR ?AUTO_4942 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4942 ?AUTO_4940 )
      ( MAKE-ON ?AUTO_4938 ?AUTO_4939 )
      ( MAKE-ON-VERIFY ?AUTO_4938 ?AUTO_4939 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4946 - BLOCK
      ?AUTO_4947 - BLOCK
    )
    :vars
    (
      ?AUTO_4953 - BLOCK
      ?AUTO_4952 - BLOCK
      ?AUTO_4951 - BLOCK
      ?AUTO_4948 - BLOCK
      ?AUTO_4949 - BLOCK
      ?AUTO_4950 - BLOCK
      ?AUTO_4954 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4947 ) ( not ( = ?AUTO_4946 ?AUTO_4947 ) ) ( ON-TABLE ?AUTO_4946 ) ( not ( = ?AUTO_4946 ?AUTO_4953 ) ) ( not ( = ?AUTO_4946 ?AUTO_4952 ) ) ( not ( = ?AUTO_4947 ?AUTO_4953 ) ) ( not ( = ?AUTO_4947 ?AUTO_4952 ) ) ( not ( = ?AUTO_4953 ?AUTO_4952 ) ) ( ON ?AUTO_4953 ?AUTO_4946 ) ( CLEAR ?AUTO_4951 ) ( not ( = ?AUTO_4946 ?AUTO_4948 ) ) ( not ( = ?AUTO_4946 ?AUTO_4951 ) ) ( not ( = ?AUTO_4947 ?AUTO_4948 ) ) ( not ( = ?AUTO_4947 ?AUTO_4951 ) ) ( not ( = ?AUTO_4952 ?AUTO_4948 ) ) ( not ( = ?AUTO_4952 ?AUTO_4951 ) ) ( not ( = ?AUTO_4953 ?AUTO_4948 ) ) ( not ( = ?AUTO_4953 ?AUTO_4951 ) ) ( not ( = ?AUTO_4948 ?AUTO_4951 ) ) ( ON ?AUTO_4948 ?AUTO_4953 ) ( CLEAR ?AUTO_4949 ) ( not ( = ?AUTO_4946 ?AUTO_4950 ) ) ( not ( = ?AUTO_4946 ?AUTO_4949 ) ) ( not ( = ?AUTO_4947 ?AUTO_4950 ) ) ( not ( = ?AUTO_4947 ?AUTO_4949 ) ) ( not ( = ?AUTO_4952 ?AUTO_4950 ) ) ( not ( = ?AUTO_4952 ?AUTO_4949 ) ) ( not ( = ?AUTO_4953 ?AUTO_4950 ) ) ( not ( = ?AUTO_4953 ?AUTO_4949 ) ) ( not ( = ?AUTO_4951 ?AUTO_4950 ) ) ( not ( = ?AUTO_4951 ?AUTO_4949 ) ) ( not ( = ?AUTO_4948 ?AUTO_4950 ) ) ( not ( = ?AUTO_4948 ?AUTO_4949 ) ) ( not ( = ?AUTO_4950 ?AUTO_4949 ) ) ( ON ?AUTO_4950 ?AUTO_4948 ) ( CLEAR ?AUTO_4950 ) ( HOLDING ?AUTO_4952 ) ( CLEAR ?AUTO_4954 ) ( not ( = ?AUTO_4946 ?AUTO_4954 ) ) ( not ( = ?AUTO_4947 ?AUTO_4954 ) ) ( not ( = ?AUTO_4953 ?AUTO_4954 ) ) ( not ( = ?AUTO_4952 ?AUTO_4954 ) ) ( not ( = ?AUTO_4951 ?AUTO_4954 ) ) ( not ( = ?AUTO_4948 ?AUTO_4954 ) ) ( not ( = ?AUTO_4949 ?AUTO_4954 ) ) ( not ( = ?AUTO_4950 ?AUTO_4954 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4952 ?AUTO_4954 )
      ( MAKE-ON ?AUTO_4946 ?AUTO_4947 )
      ( MAKE-ON-VERIFY ?AUTO_4946 ?AUTO_4947 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4961 - BLOCK
      ?AUTO_4962 - BLOCK
    )
    :vars
    (
      ?AUTO_4966 - BLOCK
      ?AUTO_4968 - BLOCK
      ?AUTO_4964 - BLOCK
      ?AUTO_4965 - BLOCK
      ?AUTO_4967 - BLOCK
      ?AUTO_4963 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4961 ?AUTO_4962 ) ) ( ON-TABLE ?AUTO_4961 ) ( CLEAR ?AUTO_4966 ) ( not ( = ?AUTO_4961 ?AUTO_4968 ) ) ( not ( = ?AUTO_4961 ?AUTO_4966 ) ) ( not ( = ?AUTO_4962 ?AUTO_4968 ) ) ( not ( = ?AUTO_4962 ?AUTO_4966 ) ) ( not ( = ?AUTO_4968 ?AUTO_4966 ) ) ( ON ?AUTO_4968 ?AUTO_4961 ) ( CLEAR ?AUTO_4964 ) ( not ( = ?AUTO_4961 ?AUTO_4965 ) ) ( not ( = ?AUTO_4961 ?AUTO_4964 ) ) ( not ( = ?AUTO_4962 ?AUTO_4965 ) ) ( not ( = ?AUTO_4962 ?AUTO_4964 ) ) ( not ( = ?AUTO_4966 ?AUTO_4965 ) ) ( not ( = ?AUTO_4966 ?AUTO_4964 ) ) ( not ( = ?AUTO_4968 ?AUTO_4965 ) ) ( not ( = ?AUTO_4968 ?AUTO_4964 ) ) ( not ( = ?AUTO_4965 ?AUTO_4964 ) ) ( ON ?AUTO_4965 ?AUTO_4968 ) ( CLEAR ?AUTO_4967 ) ( not ( = ?AUTO_4961 ?AUTO_4963 ) ) ( not ( = ?AUTO_4961 ?AUTO_4967 ) ) ( not ( = ?AUTO_4962 ?AUTO_4963 ) ) ( not ( = ?AUTO_4962 ?AUTO_4967 ) ) ( not ( = ?AUTO_4966 ?AUTO_4963 ) ) ( not ( = ?AUTO_4966 ?AUTO_4967 ) ) ( not ( = ?AUTO_4968 ?AUTO_4963 ) ) ( not ( = ?AUTO_4968 ?AUTO_4967 ) ) ( not ( = ?AUTO_4964 ?AUTO_4963 ) ) ( not ( = ?AUTO_4964 ?AUTO_4967 ) ) ( not ( = ?AUTO_4965 ?AUTO_4963 ) ) ( not ( = ?AUTO_4965 ?AUTO_4967 ) ) ( not ( = ?AUTO_4963 ?AUTO_4967 ) ) ( ON ?AUTO_4963 ?AUTO_4965 ) ( CLEAR ?AUTO_4963 ) ( HOLDING ?AUTO_4962 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4962 )
      ( MAKE-ON ?AUTO_4961 ?AUTO_4962 )
      ( MAKE-ON-VERIFY ?AUTO_4961 ?AUTO_4962 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4973 - BLOCK
      ?AUTO_4974 - BLOCK
    )
    :vars
    (
      ?AUTO_4977 - BLOCK
      ?AUTO_4975 - BLOCK
      ?AUTO_4976 - BLOCK
      ?AUTO_4980 - BLOCK
      ?AUTO_4979 - BLOCK
      ?AUTO_4978 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4973 ?AUTO_4974 ) ) ( ON-TABLE ?AUTO_4973 ) ( CLEAR ?AUTO_4977 ) ( not ( = ?AUTO_4973 ?AUTO_4975 ) ) ( not ( = ?AUTO_4973 ?AUTO_4977 ) ) ( not ( = ?AUTO_4974 ?AUTO_4975 ) ) ( not ( = ?AUTO_4974 ?AUTO_4977 ) ) ( not ( = ?AUTO_4975 ?AUTO_4977 ) ) ( ON ?AUTO_4975 ?AUTO_4973 ) ( CLEAR ?AUTO_4976 ) ( not ( = ?AUTO_4973 ?AUTO_4980 ) ) ( not ( = ?AUTO_4973 ?AUTO_4976 ) ) ( not ( = ?AUTO_4974 ?AUTO_4980 ) ) ( not ( = ?AUTO_4974 ?AUTO_4976 ) ) ( not ( = ?AUTO_4977 ?AUTO_4980 ) ) ( not ( = ?AUTO_4977 ?AUTO_4976 ) ) ( not ( = ?AUTO_4975 ?AUTO_4980 ) ) ( not ( = ?AUTO_4975 ?AUTO_4976 ) ) ( not ( = ?AUTO_4980 ?AUTO_4976 ) ) ( ON ?AUTO_4980 ?AUTO_4975 ) ( CLEAR ?AUTO_4980 ) ( CLEAR ?AUTO_4979 ) ( not ( = ?AUTO_4973 ?AUTO_4978 ) ) ( not ( = ?AUTO_4973 ?AUTO_4979 ) ) ( not ( = ?AUTO_4974 ?AUTO_4978 ) ) ( not ( = ?AUTO_4974 ?AUTO_4979 ) ) ( not ( = ?AUTO_4977 ?AUTO_4978 ) ) ( not ( = ?AUTO_4977 ?AUTO_4979 ) ) ( not ( = ?AUTO_4975 ?AUTO_4978 ) ) ( not ( = ?AUTO_4975 ?AUTO_4979 ) ) ( not ( = ?AUTO_4976 ?AUTO_4978 ) ) ( not ( = ?AUTO_4976 ?AUTO_4979 ) ) ( not ( = ?AUTO_4980 ?AUTO_4978 ) ) ( not ( = ?AUTO_4980 ?AUTO_4979 ) ) ( not ( = ?AUTO_4978 ?AUTO_4979 ) ) ( ON ?AUTO_4978 ?AUTO_4974 ) ( CLEAR ?AUTO_4978 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4978 ?AUTO_4974 )
      ( MAKE-ON ?AUTO_4973 ?AUTO_4974 )
      ( MAKE-ON-VERIFY ?AUTO_4973 ?AUTO_4974 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4981 - BLOCK
      ?AUTO_4982 - BLOCK
    )
    :vars
    (
      ?AUTO_4986 - BLOCK
      ?AUTO_4985 - BLOCK
      ?AUTO_4987 - BLOCK
      ?AUTO_4988 - BLOCK
      ?AUTO_4983 - BLOCK
      ?AUTO_4984 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4981 ?AUTO_4982 ) ) ( ON-TABLE ?AUTO_4981 ) ( CLEAR ?AUTO_4986 ) ( not ( = ?AUTO_4981 ?AUTO_4985 ) ) ( not ( = ?AUTO_4981 ?AUTO_4986 ) ) ( not ( = ?AUTO_4982 ?AUTO_4985 ) ) ( not ( = ?AUTO_4982 ?AUTO_4986 ) ) ( not ( = ?AUTO_4985 ?AUTO_4986 ) ) ( ON ?AUTO_4985 ?AUTO_4981 ) ( not ( = ?AUTO_4981 ?AUTO_4987 ) ) ( not ( = ?AUTO_4981 ?AUTO_4988 ) ) ( not ( = ?AUTO_4982 ?AUTO_4987 ) ) ( not ( = ?AUTO_4982 ?AUTO_4988 ) ) ( not ( = ?AUTO_4986 ?AUTO_4987 ) ) ( not ( = ?AUTO_4986 ?AUTO_4988 ) ) ( not ( = ?AUTO_4985 ?AUTO_4987 ) ) ( not ( = ?AUTO_4985 ?AUTO_4988 ) ) ( not ( = ?AUTO_4987 ?AUTO_4988 ) ) ( ON ?AUTO_4987 ?AUTO_4985 ) ( CLEAR ?AUTO_4987 ) ( CLEAR ?AUTO_4983 ) ( not ( = ?AUTO_4981 ?AUTO_4984 ) ) ( not ( = ?AUTO_4981 ?AUTO_4983 ) ) ( not ( = ?AUTO_4982 ?AUTO_4984 ) ) ( not ( = ?AUTO_4982 ?AUTO_4983 ) ) ( not ( = ?AUTO_4986 ?AUTO_4984 ) ) ( not ( = ?AUTO_4986 ?AUTO_4983 ) ) ( not ( = ?AUTO_4985 ?AUTO_4984 ) ) ( not ( = ?AUTO_4985 ?AUTO_4983 ) ) ( not ( = ?AUTO_4988 ?AUTO_4984 ) ) ( not ( = ?AUTO_4988 ?AUTO_4983 ) ) ( not ( = ?AUTO_4987 ?AUTO_4984 ) ) ( not ( = ?AUTO_4987 ?AUTO_4983 ) ) ( not ( = ?AUTO_4984 ?AUTO_4983 ) ) ( ON ?AUTO_4984 ?AUTO_4982 ) ( CLEAR ?AUTO_4984 ) ( HOLDING ?AUTO_4988 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4988 )
      ( MAKE-ON ?AUTO_4981 ?AUTO_4982 )
      ( MAKE-ON-VERIFY ?AUTO_4981 ?AUTO_4982 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4989 - BLOCK
      ?AUTO_4990 - BLOCK
    )
    :vars
    (
      ?AUTO_4993 - BLOCK
      ?AUTO_4992 - BLOCK
      ?AUTO_4995 - BLOCK
      ?AUTO_4994 - BLOCK
      ?AUTO_4996 - BLOCK
      ?AUTO_4991 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4989 ?AUTO_4990 ) ) ( ON-TABLE ?AUTO_4989 ) ( CLEAR ?AUTO_4993 ) ( not ( = ?AUTO_4989 ?AUTO_4992 ) ) ( not ( = ?AUTO_4989 ?AUTO_4993 ) ) ( not ( = ?AUTO_4990 ?AUTO_4992 ) ) ( not ( = ?AUTO_4990 ?AUTO_4993 ) ) ( not ( = ?AUTO_4992 ?AUTO_4993 ) ) ( ON ?AUTO_4992 ?AUTO_4989 ) ( not ( = ?AUTO_4989 ?AUTO_4995 ) ) ( not ( = ?AUTO_4989 ?AUTO_4994 ) ) ( not ( = ?AUTO_4990 ?AUTO_4995 ) ) ( not ( = ?AUTO_4990 ?AUTO_4994 ) ) ( not ( = ?AUTO_4993 ?AUTO_4995 ) ) ( not ( = ?AUTO_4993 ?AUTO_4994 ) ) ( not ( = ?AUTO_4992 ?AUTO_4995 ) ) ( not ( = ?AUTO_4992 ?AUTO_4994 ) ) ( not ( = ?AUTO_4995 ?AUTO_4994 ) ) ( ON ?AUTO_4995 ?AUTO_4992 ) ( CLEAR ?AUTO_4995 ) ( CLEAR ?AUTO_4996 ) ( not ( = ?AUTO_4989 ?AUTO_4991 ) ) ( not ( = ?AUTO_4989 ?AUTO_4996 ) ) ( not ( = ?AUTO_4990 ?AUTO_4991 ) ) ( not ( = ?AUTO_4990 ?AUTO_4996 ) ) ( not ( = ?AUTO_4993 ?AUTO_4991 ) ) ( not ( = ?AUTO_4993 ?AUTO_4996 ) ) ( not ( = ?AUTO_4992 ?AUTO_4991 ) ) ( not ( = ?AUTO_4992 ?AUTO_4996 ) ) ( not ( = ?AUTO_4994 ?AUTO_4991 ) ) ( not ( = ?AUTO_4994 ?AUTO_4996 ) ) ( not ( = ?AUTO_4995 ?AUTO_4991 ) ) ( not ( = ?AUTO_4995 ?AUTO_4996 ) ) ( not ( = ?AUTO_4991 ?AUTO_4996 ) ) ( ON ?AUTO_4991 ?AUTO_4990 ) ( ON ?AUTO_4994 ?AUTO_4991 ) ( CLEAR ?AUTO_4994 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4994 ?AUTO_4991 )
      ( MAKE-ON ?AUTO_4989 ?AUTO_4990 )
      ( MAKE-ON-VERIFY ?AUTO_4989 ?AUTO_4990 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4997 - BLOCK
      ?AUTO_4998 - BLOCK
    )
    :vars
    (
      ?AUTO_5004 - BLOCK
      ?AUTO_5000 - BLOCK
      ?AUTO_5001 - BLOCK
      ?AUTO_5003 - BLOCK
      ?AUTO_4999 - BLOCK
      ?AUTO_5002 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4997 ?AUTO_4998 ) ) ( ON-TABLE ?AUTO_4997 ) ( CLEAR ?AUTO_5004 ) ( not ( = ?AUTO_4997 ?AUTO_5000 ) ) ( not ( = ?AUTO_4997 ?AUTO_5004 ) ) ( not ( = ?AUTO_4998 ?AUTO_5000 ) ) ( not ( = ?AUTO_4998 ?AUTO_5004 ) ) ( not ( = ?AUTO_5000 ?AUTO_5004 ) ) ( ON ?AUTO_5000 ?AUTO_4997 ) ( not ( = ?AUTO_4997 ?AUTO_5001 ) ) ( not ( = ?AUTO_4997 ?AUTO_5003 ) ) ( not ( = ?AUTO_4998 ?AUTO_5001 ) ) ( not ( = ?AUTO_4998 ?AUTO_5003 ) ) ( not ( = ?AUTO_5004 ?AUTO_5001 ) ) ( not ( = ?AUTO_5004 ?AUTO_5003 ) ) ( not ( = ?AUTO_5000 ?AUTO_5001 ) ) ( not ( = ?AUTO_5000 ?AUTO_5003 ) ) ( not ( = ?AUTO_5001 ?AUTO_5003 ) ) ( CLEAR ?AUTO_4999 ) ( not ( = ?AUTO_4997 ?AUTO_5002 ) ) ( not ( = ?AUTO_4997 ?AUTO_4999 ) ) ( not ( = ?AUTO_4998 ?AUTO_5002 ) ) ( not ( = ?AUTO_4998 ?AUTO_4999 ) ) ( not ( = ?AUTO_5004 ?AUTO_5002 ) ) ( not ( = ?AUTO_5004 ?AUTO_4999 ) ) ( not ( = ?AUTO_5000 ?AUTO_5002 ) ) ( not ( = ?AUTO_5000 ?AUTO_4999 ) ) ( not ( = ?AUTO_5003 ?AUTO_5002 ) ) ( not ( = ?AUTO_5003 ?AUTO_4999 ) ) ( not ( = ?AUTO_5001 ?AUTO_5002 ) ) ( not ( = ?AUTO_5001 ?AUTO_4999 ) ) ( not ( = ?AUTO_5002 ?AUTO_4999 ) ) ( ON ?AUTO_5002 ?AUTO_4998 ) ( ON ?AUTO_5003 ?AUTO_5002 ) ( CLEAR ?AUTO_5003 ) ( HOLDING ?AUTO_5001 ) ( CLEAR ?AUTO_5000 ) )
    :subtasks
    ( ( !STACK ?AUTO_5001 ?AUTO_5000 )
      ( MAKE-ON ?AUTO_4997 ?AUTO_4998 )
      ( MAKE-ON-VERIFY ?AUTO_4997 ?AUTO_4998 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5005 - BLOCK
      ?AUTO_5006 - BLOCK
    )
    :vars
    (
      ?AUTO_5009 - BLOCK
      ?AUTO_5011 - BLOCK
      ?AUTO_5010 - BLOCK
      ?AUTO_5007 - BLOCK
      ?AUTO_5012 - BLOCK
      ?AUTO_5008 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5005 ?AUTO_5006 ) ) ( ON-TABLE ?AUTO_5005 ) ( CLEAR ?AUTO_5009 ) ( not ( = ?AUTO_5005 ?AUTO_5011 ) ) ( not ( = ?AUTO_5005 ?AUTO_5009 ) ) ( not ( = ?AUTO_5006 ?AUTO_5011 ) ) ( not ( = ?AUTO_5006 ?AUTO_5009 ) ) ( not ( = ?AUTO_5011 ?AUTO_5009 ) ) ( ON ?AUTO_5011 ?AUTO_5005 ) ( not ( = ?AUTO_5005 ?AUTO_5010 ) ) ( not ( = ?AUTO_5005 ?AUTO_5007 ) ) ( not ( = ?AUTO_5006 ?AUTO_5010 ) ) ( not ( = ?AUTO_5006 ?AUTO_5007 ) ) ( not ( = ?AUTO_5009 ?AUTO_5010 ) ) ( not ( = ?AUTO_5009 ?AUTO_5007 ) ) ( not ( = ?AUTO_5011 ?AUTO_5010 ) ) ( not ( = ?AUTO_5011 ?AUTO_5007 ) ) ( not ( = ?AUTO_5010 ?AUTO_5007 ) ) ( CLEAR ?AUTO_5012 ) ( not ( = ?AUTO_5005 ?AUTO_5008 ) ) ( not ( = ?AUTO_5005 ?AUTO_5012 ) ) ( not ( = ?AUTO_5006 ?AUTO_5008 ) ) ( not ( = ?AUTO_5006 ?AUTO_5012 ) ) ( not ( = ?AUTO_5009 ?AUTO_5008 ) ) ( not ( = ?AUTO_5009 ?AUTO_5012 ) ) ( not ( = ?AUTO_5011 ?AUTO_5008 ) ) ( not ( = ?AUTO_5011 ?AUTO_5012 ) ) ( not ( = ?AUTO_5007 ?AUTO_5008 ) ) ( not ( = ?AUTO_5007 ?AUTO_5012 ) ) ( not ( = ?AUTO_5010 ?AUTO_5008 ) ) ( not ( = ?AUTO_5010 ?AUTO_5012 ) ) ( not ( = ?AUTO_5008 ?AUTO_5012 ) ) ( ON ?AUTO_5008 ?AUTO_5006 ) ( ON ?AUTO_5007 ?AUTO_5008 ) ( CLEAR ?AUTO_5007 ) ( CLEAR ?AUTO_5011 ) ( ON-TABLE ?AUTO_5010 ) ( CLEAR ?AUTO_5010 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_5010 )
      ( MAKE-ON ?AUTO_5005 ?AUTO_5006 )
      ( MAKE-ON-VERIFY ?AUTO_5005 ?AUTO_5006 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5023 - BLOCK
      ?AUTO_5024 - BLOCK
    )
    :vars
    (
      ?AUTO_5026 - BLOCK
      ?AUTO_5028 - BLOCK
      ?AUTO_5027 - BLOCK
      ?AUTO_5030 - BLOCK
      ?AUTO_5025 - BLOCK
      ?AUTO_5029 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5023 ?AUTO_5024 ) ) ( ON-TABLE ?AUTO_5023 ) ( not ( = ?AUTO_5023 ?AUTO_5026 ) ) ( not ( = ?AUTO_5023 ?AUTO_5028 ) ) ( not ( = ?AUTO_5024 ?AUTO_5026 ) ) ( not ( = ?AUTO_5024 ?AUTO_5028 ) ) ( not ( = ?AUTO_5026 ?AUTO_5028 ) ) ( ON ?AUTO_5026 ?AUTO_5023 ) ( not ( = ?AUTO_5023 ?AUTO_5027 ) ) ( not ( = ?AUTO_5023 ?AUTO_5030 ) ) ( not ( = ?AUTO_5024 ?AUTO_5027 ) ) ( not ( = ?AUTO_5024 ?AUTO_5030 ) ) ( not ( = ?AUTO_5028 ?AUTO_5027 ) ) ( not ( = ?AUTO_5028 ?AUTO_5030 ) ) ( not ( = ?AUTO_5026 ?AUTO_5027 ) ) ( not ( = ?AUTO_5026 ?AUTO_5030 ) ) ( not ( = ?AUTO_5027 ?AUTO_5030 ) ) ( CLEAR ?AUTO_5025 ) ( not ( = ?AUTO_5023 ?AUTO_5029 ) ) ( not ( = ?AUTO_5023 ?AUTO_5025 ) ) ( not ( = ?AUTO_5024 ?AUTO_5029 ) ) ( not ( = ?AUTO_5024 ?AUTO_5025 ) ) ( not ( = ?AUTO_5028 ?AUTO_5029 ) ) ( not ( = ?AUTO_5028 ?AUTO_5025 ) ) ( not ( = ?AUTO_5026 ?AUTO_5029 ) ) ( not ( = ?AUTO_5026 ?AUTO_5025 ) ) ( not ( = ?AUTO_5030 ?AUTO_5029 ) ) ( not ( = ?AUTO_5030 ?AUTO_5025 ) ) ( not ( = ?AUTO_5027 ?AUTO_5029 ) ) ( not ( = ?AUTO_5027 ?AUTO_5025 ) ) ( not ( = ?AUTO_5029 ?AUTO_5025 ) ) ( ON ?AUTO_5029 ?AUTO_5024 ) ( ON ?AUTO_5030 ?AUTO_5029 ) ( CLEAR ?AUTO_5030 ) ( CLEAR ?AUTO_5026 ) ( ON ?AUTO_5027 ?AUTO_5028 ) ( CLEAR ?AUTO_5027 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5027 ?AUTO_5028 )
      ( MAKE-ON ?AUTO_5023 ?AUTO_5024 )
      ( MAKE-ON-VERIFY ?AUTO_5023 ?AUTO_5024 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5033 - BLOCK
      ?AUTO_5034 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5033 ) ( CLEAR ?AUTO_5034 ) ( not ( = ?AUTO_5033 ?AUTO_5034 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5033 ?AUTO_5034 )
      ( MAKE-ON-VERIFY ?AUTO_5033 ?AUTO_5034 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5035 - BLOCK
      ?AUTO_5036 - BLOCK
    )
    :vars
    (
      ?AUTO_5037 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5036 ) ( not ( = ?AUTO_5035 ?AUTO_5036 ) ) ( ON ?AUTO_5035 ?AUTO_5037 ) ( CLEAR ?AUTO_5035 ) ( HAND-EMPTY ) ( not ( = ?AUTO_5035 ?AUTO_5037 ) ) ( not ( = ?AUTO_5036 ?AUTO_5037 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5035 ?AUTO_5037 )
      ( MAKE-ON ?AUTO_5035 ?AUTO_5036 )
      ( MAKE-ON-VERIFY ?AUTO_5035 ?AUTO_5036 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5038 - BLOCK
      ?AUTO_5039 - BLOCK
    )
    :vars
    (
      ?AUTO_5040 - BLOCK
      ?AUTO_5041 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5038 ?AUTO_5039 ) ) ( ON ?AUTO_5038 ?AUTO_5040 ) ( CLEAR ?AUTO_5038 ) ( not ( = ?AUTO_5038 ?AUTO_5040 ) ) ( not ( = ?AUTO_5039 ?AUTO_5040 ) ) ( HOLDING ?AUTO_5039 ) ( CLEAR ?AUTO_5041 ) ( not ( = ?AUTO_5038 ?AUTO_5041 ) ) ( not ( = ?AUTO_5039 ?AUTO_5041 ) ) ( not ( = ?AUTO_5040 ?AUTO_5041 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5039 ?AUTO_5041 )
      ( MAKE-ON ?AUTO_5038 ?AUTO_5039 )
      ( MAKE-ON-VERIFY ?AUTO_5038 ?AUTO_5039 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5187 - BLOCK
      ?AUTO_5188 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5187 ) ( CLEAR ?AUTO_5188 ) ( not ( = ?AUTO_5187 ?AUTO_5188 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5187 ?AUTO_5188 )
      ( MAKE-ON-VERIFY ?AUTO_5187 ?AUTO_5188 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5189 - BLOCK
      ?AUTO_5190 - BLOCK
    )
    :vars
    (
      ?AUTO_5191 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5190 ) ( not ( = ?AUTO_5189 ?AUTO_5190 ) ) ( ON ?AUTO_5189 ?AUTO_5191 ) ( CLEAR ?AUTO_5189 ) ( HAND-EMPTY ) ( not ( = ?AUTO_5189 ?AUTO_5191 ) ) ( not ( = ?AUTO_5190 ?AUTO_5191 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5189 ?AUTO_5191 )
      ( MAKE-ON ?AUTO_5189 ?AUTO_5190 )
      ( MAKE-ON-VERIFY ?AUTO_5189 ?AUTO_5190 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5192 - BLOCK
      ?AUTO_5193 - BLOCK
    )
    :vars
    (
      ?AUTO_5194 - BLOCK
      ?AUTO_5195 - BLOCK
      ?AUTO_5196 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5193 ) ( not ( = ?AUTO_5192 ?AUTO_5193 ) ) ( ON ?AUTO_5192 ?AUTO_5194 ) ( CLEAR ?AUTO_5192 ) ( not ( = ?AUTO_5192 ?AUTO_5194 ) ) ( not ( = ?AUTO_5193 ?AUTO_5194 ) ) ( HOLDING ?AUTO_5195 ) ( CLEAR ?AUTO_5196 ) ( not ( = ?AUTO_5192 ?AUTO_5195 ) ) ( not ( = ?AUTO_5192 ?AUTO_5196 ) ) ( not ( = ?AUTO_5193 ?AUTO_5195 ) ) ( not ( = ?AUTO_5193 ?AUTO_5196 ) ) ( not ( = ?AUTO_5194 ?AUTO_5195 ) ) ( not ( = ?AUTO_5194 ?AUTO_5196 ) ) ( not ( = ?AUTO_5195 ?AUTO_5196 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5195 ?AUTO_5196 )
      ( MAKE-ON ?AUTO_5192 ?AUTO_5193 )
      ( MAKE-ON-VERIFY ?AUTO_5192 ?AUTO_5193 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5197 - BLOCK
      ?AUTO_5198 - BLOCK
    )
    :vars
    (
      ?AUTO_5199 - BLOCK
      ?AUTO_5200 - BLOCK
      ?AUTO_5201 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5197 ?AUTO_5198 ) ) ( ON ?AUTO_5197 ?AUTO_5199 ) ( CLEAR ?AUTO_5197 ) ( not ( = ?AUTO_5197 ?AUTO_5199 ) ) ( not ( = ?AUTO_5198 ?AUTO_5199 ) ) ( CLEAR ?AUTO_5200 ) ( not ( = ?AUTO_5197 ?AUTO_5201 ) ) ( not ( = ?AUTO_5197 ?AUTO_5200 ) ) ( not ( = ?AUTO_5198 ?AUTO_5201 ) ) ( not ( = ?AUTO_5198 ?AUTO_5200 ) ) ( not ( = ?AUTO_5199 ?AUTO_5201 ) ) ( not ( = ?AUTO_5199 ?AUTO_5200 ) ) ( not ( = ?AUTO_5201 ?AUTO_5200 ) ) ( ON ?AUTO_5201 ?AUTO_5198 ) ( CLEAR ?AUTO_5201 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5201 ?AUTO_5198 )
      ( MAKE-ON ?AUTO_5197 ?AUTO_5198 )
      ( MAKE-ON-VERIFY ?AUTO_5197 ?AUTO_5198 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5202 - BLOCK
      ?AUTO_5203 - BLOCK
    )
    :vars
    (
      ?AUTO_5206 - BLOCK
      ?AUTO_5205 - BLOCK
      ?AUTO_5204 - BLOCK
      ?AUTO_5207 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5202 ?AUTO_5203 ) ) ( ON ?AUTO_5202 ?AUTO_5206 ) ( CLEAR ?AUTO_5202 ) ( not ( = ?AUTO_5202 ?AUTO_5206 ) ) ( not ( = ?AUTO_5203 ?AUTO_5206 ) ) ( not ( = ?AUTO_5202 ?AUTO_5205 ) ) ( not ( = ?AUTO_5202 ?AUTO_5204 ) ) ( not ( = ?AUTO_5203 ?AUTO_5205 ) ) ( not ( = ?AUTO_5203 ?AUTO_5204 ) ) ( not ( = ?AUTO_5206 ?AUTO_5205 ) ) ( not ( = ?AUTO_5206 ?AUTO_5204 ) ) ( not ( = ?AUTO_5205 ?AUTO_5204 ) ) ( ON ?AUTO_5205 ?AUTO_5203 ) ( CLEAR ?AUTO_5205 ) ( HOLDING ?AUTO_5204 ) ( CLEAR ?AUTO_5207 ) ( not ( = ?AUTO_5202 ?AUTO_5207 ) ) ( not ( = ?AUTO_5203 ?AUTO_5207 ) ) ( not ( = ?AUTO_5206 ?AUTO_5207 ) ) ( not ( = ?AUTO_5205 ?AUTO_5207 ) ) ( not ( = ?AUTO_5204 ?AUTO_5207 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5204 ?AUTO_5207 )
      ( MAKE-ON ?AUTO_5202 ?AUTO_5203 )
      ( MAKE-ON-VERIFY ?AUTO_5202 ?AUTO_5203 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5269 - BLOCK
      ?AUTO_5270 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5269 ) ( CLEAR ?AUTO_5270 ) ( not ( = ?AUTO_5269 ?AUTO_5270 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5269 ?AUTO_5270 )
      ( MAKE-ON-VERIFY ?AUTO_5269 ?AUTO_5270 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5271 - BLOCK
      ?AUTO_5272 - BLOCK
    )
    :vars
    (
      ?AUTO_5273 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5272 ) ( not ( = ?AUTO_5271 ?AUTO_5272 ) ) ( ON ?AUTO_5271 ?AUTO_5273 ) ( CLEAR ?AUTO_5271 ) ( HAND-EMPTY ) ( not ( = ?AUTO_5271 ?AUTO_5273 ) ) ( not ( = ?AUTO_5272 ?AUTO_5273 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5271 ?AUTO_5273 )
      ( MAKE-ON ?AUTO_5271 ?AUTO_5272 )
      ( MAKE-ON-VERIFY ?AUTO_5271 ?AUTO_5272 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5274 - BLOCK
      ?AUTO_5275 - BLOCK
    )
    :vars
    (
      ?AUTO_5276 - BLOCK
      ?AUTO_5277 - BLOCK
      ?AUTO_5278 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5275 ) ( not ( = ?AUTO_5274 ?AUTO_5275 ) ) ( ON ?AUTO_5274 ?AUTO_5276 ) ( CLEAR ?AUTO_5274 ) ( not ( = ?AUTO_5274 ?AUTO_5276 ) ) ( not ( = ?AUTO_5275 ?AUTO_5276 ) ) ( HOLDING ?AUTO_5277 ) ( CLEAR ?AUTO_5278 ) ( not ( = ?AUTO_5274 ?AUTO_5277 ) ) ( not ( = ?AUTO_5274 ?AUTO_5278 ) ) ( not ( = ?AUTO_5275 ?AUTO_5277 ) ) ( not ( = ?AUTO_5275 ?AUTO_5278 ) ) ( not ( = ?AUTO_5276 ?AUTO_5277 ) ) ( not ( = ?AUTO_5276 ?AUTO_5278 ) ) ( not ( = ?AUTO_5277 ?AUTO_5278 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5277 ?AUTO_5278 )
      ( MAKE-ON ?AUTO_5274 ?AUTO_5275 )
      ( MAKE-ON-VERIFY ?AUTO_5274 ?AUTO_5275 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5279 - BLOCK
      ?AUTO_5280 - BLOCK
    )
    :vars
    (
      ?AUTO_5281 - BLOCK
      ?AUTO_5282 - BLOCK
      ?AUTO_5283 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5280 ) ( not ( = ?AUTO_5279 ?AUTO_5280 ) ) ( ON ?AUTO_5279 ?AUTO_5281 ) ( not ( = ?AUTO_5279 ?AUTO_5281 ) ) ( not ( = ?AUTO_5280 ?AUTO_5281 ) ) ( CLEAR ?AUTO_5282 ) ( not ( = ?AUTO_5279 ?AUTO_5283 ) ) ( not ( = ?AUTO_5279 ?AUTO_5282 ) ) ( not ( = ?AUTO_5280 ?AUTO_5283 ) ) ( not ( = ?AUTO_5280 ?AUTO_5282 ) ) ( not ( = ?AUTO_5281 ?AUTO_5283 ) ) ( not ( = ?AUTO_5281 ?AUTO_5282 ) ) ( not ( = ?AUTO_5283 ?AUTO_5282 ) ) ( ON ?AUTO_5283 ?AUTO_5279 ) ( CLEAR ?AUTO_5283 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5283 ?AUTO_5279 )
      ( MAKE-ON ?AUTO_5279 ?AUTO_5280 )
      ( MAKE-ON-VERIFY ?AUTO_5279 ?AUTO_5280 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5284 - BLOCK
      ?AUTO_5285 - BLOCK
    )
    :vars
    (
      ?AUTO_5286 - BLOCK
      ?AUTO_5288 - BLOCK
      ?AUTO_5287 - BLOCK
      ?AUTO_5289 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5284 ?AUTO_5285 ) ) ( ON ?AUTO_5284 ?AUTO_5286 ) ( not ( = ?AUTO_5284 ?AUTO_5286 ) ) ( not ( = ?AUTO_5285 ?AUTO_5286 ) ) ( CLEAR ?AUTO_5288 ) ( not ( = ?AUTO_5284 ?AUTO_5287 ) ) ( not ( = ?AUTO_5284 ?AUTO_5288 ) ) ( not ( = ?AUTO_5285 ?AUTO_5287 ) ) ( not ( = ?AUTO_5285 ?AUTO_5288 ) ) ( not ( = ?AUTO_5286 ?AUTO_5287 ) ) ( not ( = ?AUTO_5286 ?AUTO_5288 ) ) ( not ( = ?AUTO_5287 ?AUTO_5288 ) ) ( ON ?AUTO_5287 ?AUTO_5284 ) ( CLEAR ?AUTO_5287 ) ( HOLDING ?AUTO_5285 ) ( CLEAR ?AUTO_5289 ) ( not ( = ?AUTO_5284 ?AUTO_5289 ) ) ( not ( = ?AUTO_5285 ?AUTO_5289 ) ) ( not ( = ?AUTO_5286 ?AUTO_5289 ) ) ( not ( = ?AUTO_5288 ?AUTO_5289 ) ) ( not ( = ?AUTO_5287 ?AUTO_5289 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5285 ?AUTO_5289 )
      ( MAKE-ON ?AUTO_5284 ?AUTO_5285 )
      ( MAKE-ON-VERIFY ?AUTO_5284 ?AUTO_5285 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5292 - BLOCK
      ?AUTO_5293 - BLOCK
    )
    :vars
    (
      ?AUTO_5296 - BLOCK
      ?AUTO_5295 - BLOCK
      ?AUTO_5294 - BLOCK
      ?AUTO_5297 - BLOCK
      ?AUTO_5298 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5293 ) ( not ( = ?AUTO_5292 ?AUTO_5293 ) ) ( ON ?AUTO_5292 ?AUTO_5296 ) ( not ( = ?AUTO_5292 ?AUTO_5296 ) ) ( not ( = ?AUTO_5293 ?AUTO_5296 ) ) ( CLEAR ?AUTO_5295 ) ( not ( = ?AUTO_5292 ?AUTO_5294 ) ) ( not ( = ?AUTO_5292 ?AUTO_5295 ) ) ( not ( = ?AUTO_5293 ?AUTO_5294 ) ) ( not ( = ?AUTO_5293 ?AUTO_5295 ) ) ( not ( = ?AUTO_5296 ?AUTO_5294 ) ) ( not ( = ?AUTO_5296 ?AUTO_5295 ) ) ( not ( = ?AUTO_5294 ?AUTO_5295 ) ) ( ON ?AUTO_5294 ?AUTO_5292 ) ( CLEAR ?AUTO_5294 ) ( HOLDING ?AUTO_5297 ) ( CLEAR ?AUTO_5298 ) ( not ( = ?AUTO_5292 ?AUTO_5297 ) ) ( not ( = ?AUTO_5292 ?AUTO_5298 ) ) ( not ( = ?AUTO_5293 ?AUTO_5297 ) ) ( not ( = ?AUTO_5293 ?AUTO_5298 ) ) ( not ( = ?AUTO_5296 ?AUTO_5297 ) ) ( not ( = ?AUTO_5296 ?AUTO_5298 ) ) ( not ( = ?AUTO_5295 ?AUTO_5297 ) ) ( not ( = ?AUTO_5295 ?AUTO_5298 ) ) ( not ( = ?AUTO_5294 ?AUTO_5297 ) ) ( not ( = ?AUTO_5294 ?AUTO_5298 ) ) ( not ( = ?AUTO_5297 ?AUTO_5298 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5297 ?AUTO_5298 )
      ( MAKE-ON ?AUTO_5292 ?AUTO_5293 )
      ( MAKE-ON-VERIFY ?AUTO_5292 ?AUTO_5293 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5413 - BLOCK
      ?AUTO_5414 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5413 ) ( CLEAR ?AUTO_5414 ) ( not ( = ?AUTO_5413 ?AUTO_5414 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5413 ?AUTO_5414 )
      ( MAKE-ON-VERIFY ?AUTO_5413 ?AUTO_5414 ) )
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
    )
    :precondition
    ( and ( CLEAR ?AUTO_5416 ) ( not ( = ?AUTO_5415 ?AUTO_5416 ) ) ( ON ?AUTO_5415 ?AUTO_5417 ) ( CLEAR ?AUTO_5415 ) ( HAND-EMPTY ) ( not ( = ?AUTO_5415 ?AUTO_5417 ) ) ( not ( = ?AUTO_5416 ?AUTO_5417 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5415 ?AUTO_5417 )
      ( MAKE-ON ?AUTO_5415 ?AUTO_5416 )
      ( MAKE-ON-VERIFY ?AUTO_5415 ?AUTO_5416 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5418 - BLOCK
      ?AUTO_5419 - BLOCK
    )
    :vars
    (
      ?AUTO_5420 - BLOCK
      ?AUTO_5421 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5418 ?AUTO_5419 ) ) ( ON ?AUTO_5418 ?AUTO_5420 ) ( CLEAR ?AUTO_5418 ) ( not ( = ?AUTO_5418 ?AUTO_5420 ) ) ( not ( = ?AUTO_5419 ?AUTO_5420 ) ) ( HOLDING ?AUTO_5419 ) ( CLEAR ?AUTO_5421 ) ( not ( = ?AUTO_5418 ?AUTO_5421 ) ) ( not ( = ?AUTO_5419 ?AUTO_5421 ) ) ( not ( = ?AUTO_5420 ?AUTO_5421 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5419 ?AUTO_5421 )
      ( MAKE-ON ?AUTO_5418 ?AUTO_5419 )
      ( MAKE-ON-VERIFY ?AUTO_5418 ?AUTO_5419 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5423 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5423 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5423 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5423 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5424 - BLOCK
    )
    :vars
    (
      ?AUTO_5425 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5424 ?AUTO_5425 ) ( CLEAR ?AUTO_5424 ) ( HAND-EMPTY ) ( not ( = ?AUTO_5424 ?AUTO_5425 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5424 ?AUTO_5425 )
      ( MAKE-ON-TABLE ?AUTO_5424 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5424 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5427 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5427 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5427 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5427 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5428 - BLOCK
    )
    :vars
    (
      ?AUTO_5429 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5428 ?AUTO_5429 ) ( CLEAR ?AUTO_5428 ) ( HAND-EMPTY ) ( not ( = ?AUTO_5428 ?AUTO_5429 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5428 ?AUTO_5429 )
      ( MAKE-ON-TABLE ?AUTO_5428 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5428 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5430 - BLOCK
    )
    :vars
    (
      ?AUTO_5431 - BLOCK
      ?AUTO_5432 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5430 ?AUTO_5431 ) ( CLEAR ?AUTO_5430 ) ( not ( = ?AUTO_5430 ?AUTO_5431 ) ) ( HOLDING ?AUTO_5432 ) ( not ( = ?AUTO_5430 ?AUTO_5432 ) ) ( not ( = ?AUTO_5431 ?AUTO_5432 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5432 )
      ( MAKE-ON-TABLE ?AUTO_5430 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5430 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5435 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5435 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5435 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5435 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5436 - BLOCK
    )
    :vars
    (
      ?AUTO_5437 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5436 ?AUTO_5437 ) ( CLEAR ?AUTO_5436 ) ( HAND-EMPTY ) ( not ( = ?AUTO_5436 ?AUTO_5437 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5436 ?AUTO_5437 )
      ( MAKE-ON-TABLE ?AUTO_5436 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5436 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5438 - BLOCK
    )
    :vars
    (
      ?AUTO_5439 - BLOCK
      ?AUTO_5440 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5438 ?AUTO_5439 ) ( CLEAR ?AUTO_5438 ) ( not ( = ?AUTO_5438 ?AUTO_5439 ) ) ( HOLDING ?AUTO_5440 ) ( not ( = ?AUTO_5438 ?AUTO_5440 ) ) ( not ( = ?AUTO_5439 ?AUTO_5440 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5440 )
      ( MAKE-ON-TABLE ?AUTO_5438 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5438 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5441 - BLOCK
    )
    :vars
    (
      ?AUTO_5442 - BLOCK
      ?AUTO_5443 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5441 ?AUTO_5442 ) ( not ( = ?AUTO_5441 ?AUTO_5442 ) ) ( not ( = ?AUTO_5441 ?AUTO_5443 ) ) ( not ( = ?AUTO_5442 ?AUTO_5443 ) ) ( ON ?AUTO_5443 ?AUTO_5441 ) ( CLEAR ?AUTO_5443 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5443 ?AUTO_5441 )
      ( MAKE-ON-TABLE ?AUTO_5441 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5441 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5444 - BLOCK
    )
    :vars
    (
      ?AUTO_5445 - BLOCK
      ?AUTO_5446 - BLOCK
      ?AUTO_5447 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5444 ?AUTO_5445 ) ( not ( = ?AUTO_5444 ?AUTO_5445 ) ) ( not ( = ?AUTO_5444 ?AUTO_5446 ) ) ( not ( = ?AUTO_5445 ?AUTO_5446 ) ) ( ON ?AUTO_5446 ?AUTO_5444 ) ( CLEAR ?AUTO_5446 ) ( HOLDING ?AUTO_5447 ) ( not ( = ?AUTO_5444 ?AUTO_5447 ) ) ( not ( = ?AUTO_5445 ?AUTO_5447 ) ) ( not ( = ?AUTO_5446 ?AUTO_5447 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5447 )
      ( MAKE-ON-TABLE ?AUTO_5444 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5444 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5451 - BLOCK
      ?AUTO_5452 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5451 ) ( CLEAR ?AUTO_5452 ) ( not ( = ?AUTO_5451 ?AUTO_5452 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5451 ?AUTO_5452 )
      ( MAKE-ON-VERIFY ?AUTO_5451 ?AUTO_5452 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5453 - BLOCK
      ?AUTO_5454 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5454 ) ( not ( = ?AUTO_5453 ?AUTO_5454 ) ) ( ON-TABLE ?AUTO_5453 ) ( CLEAR ?AUTO_5453 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_5453 )
      ( MAKE-ON ?AUTO_5453 ?AUTO_5454 )
      ( MAKE-ON-VERIFY ?AUTO_5453 ?AUTO_5454 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5455 - BLOCK
      ?AUTO_5456 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5455 ?AUTO_5456 ) ) ( ON-TABLE ?AUTO_5455 ) ( CLEAR ?AUTO_5455 ) ( HOLDING ?AUTO_5456 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5456 )
      ( MAKE-ON ?AUTO_5455 ?AUTO_5456 )
      ( MAKE-ON-VERIFY ?AUTO_5455 ?AUTO_5456 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5471 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5471 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5471 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5471 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5472 - BLOCK
    )
    :vars
    (
      ?AUTO_5473 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5472 ?AUTO_5473 ) ( CLEAR ?AUTO_5472 ) ( HAND-EMPTY ) ( not ( = ?AUTO_5472 ?AUTO_5473 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5472 ?AUTO_5473 )
      ( MAKE-ON-TABLE ?AUTO_5472 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5472 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5474 - BLOCK
    )
    :vars
    (
      ?AUTO_5475 - BLOCK
      ?AUTO_5476 - BLOCK
      ?AUTO_5477 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5474 ?AUTO_5475 ) ( CLEAR ?AUTO_5474 ) ( not ( = ?AUTO_5474 ?AUTO_5475 ) ) ( HOLDING ?AUTO_5476 ) ( CLEAR ?AUTO_5477 ) ( not ( = ?AUTO_5474 ?AUTO_5476 ) ) ( not ( = ?AUTO_5474 ?AUTO_5477 ) ) ( not ( = ?AUTO_5475 ?AUTO_5476 ) ) ( not ( = ?AUTO_5475 ?AUTO_5477 ) ) ( not ( = ?AUTO_5476 ?AUTO_5477 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5476 ?AUTO_5477 )
      ( MAKE-ON-TABLE ?AUTO_5474 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5474 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5480 - BLOCK
    )
    :vars
    (
      ?AUTO_5483 - BLOCK
      ?AUTO_5481 - BLOCK
      ?AUTO_5482 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5480 ?AUTO_5483 ) ( not ( = ?AUTO_5480 ?AUTO_5483 ) ) ( CLEAR ?AUTO_5481 ) ( not ( = ?AUTO_5480 ?AUTO_5482 ) ) ( not ( = ?AUTO_5480 ?AUTO_5481 ) ) ( not ( = ?AUTO_5483 ?AUTO_5482 ) ) ( not ( = ?AUTO_5483 ?AUTO_5481 ) ) ( not ( = ?AUTO_5482 ?AUTO_5481 ) ) ( ON ?AUTO_5482 ?AUTO_5480 ) ( CLEAR ?AUTO_5482 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5482 ?AUTO_5480 )
      ( MAKE-ON-TABLE ?AUTO_5480 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5480 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5484 - BLOCK
    )
    :vars
    (
      ?AUTO_5487 - BLOCK
      ?AUTO_5486 - BLOCK
      ?AUTO_5485 - BLOCK
      ?AUTO_5488 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5484 ?AUTO_5487 ) ( not ( = ?AUTO_5484 ?AUTO_5487 ) ) ( CLEAR ?AUTO_5486 ) ( not ( = ?AUTO_5484 ?AUTO_5485 ) ) ( not ( = ?AUTO_5484 ?AUTO_5486 ) ) ( not ( = ?AUTO_5487 ?AUTO_5485 ) ) ( not ( = ?AUTO_5487 ?AUTO_5486 ) ) ( not ( = ?AUTO_5485 ?AUTO_5486 ) ) ( ON ?AUTO_5485 ?AUTO_5484 ) ( CLEAR ?AUTO_5485 ) ( HOLDING ?AUTO_5488 ) ( not ( = ?AUTO_5484 ?AUTO_5488 ) ) ( not ( = ?AUTO_5487 ?AUTO_5488 ) ) ( not ( = ?AUTO_5486 ?AUTO_5488 ) ) ( not ( = ?AUTO_5485 ?AUTO_5488 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5488 )
      ( MAKE-ON-TABLE ?AUTO_5484 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5484 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5489 - BLOCK
    )
    :vars
    (
      ?AUTO_5493 - BLOCK
      ?AUTO_5490 - BLOCK
      ?AUTO_5492 - BLOCK
      ?AUTO_5491 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5489 ?AUTO_5493 ) ( not ( = ?AUTO_5489 ?AUTO_5493 ) ) ( CLEAR ?AUTO_5490 ) ( not ( = ?AUTO_5489 ?AUTO_5492 ) ) ( not ( = ?AUTO_5489 ?AUTO_5490 ) ) ( not ( = ?AUTO_5493 ?AUTO_5492 ) ) ( not ( = ?AUTO_5493 ?AUTO_5490 ) ) ( not ( = ?AUTO_5492 ?AUTO_5490 ) ) ( ON ?AUTO_5492 ?AUTO_5489 ) ( not ( = ?AUTO_5489 ?AUTO_5491 ) ) ( not ( = ?AUTO_5493 ?AUTO_5491 ) ) ( not ( = ?AUTO_5490 ?AUTO_5491 ) ) ( not ( = ?AUTO_5492 ?AUTO_5491 ) ) ( ON ?AUTO_5491 ?AUTO_5492 ) ( CLEAR ?AUTO_5491 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5491 ?AUTO_5492 )
      ( MAKE-ON-TABLE ?AUTO_5489 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5489 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5494 - BLOCK
    )
    :vars
    (
      ?AUTO_5495 - BLOCK
      ?AUTO_5498 - BLOCK
      ?AUTO_5496 - BLOCK
      ?AUTO_5497 - BLOCK
      ?AUTO_5499 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5494 ?AUTO_5495 ) ( not ( = ?AUTO_5494 ?AUTO_5495 ) ) ( CLEAR ?AUTO_5498 ) ( not ( = ?AUTO_5494 ?AUTO_5496 ) ) ( not ( = ?AUTO_5494 ?AUTO_5498 ) ) ( not ( = ?AUTO_5495 ?AUTO_5496 ) ) ( not ( = ?AUTO_5495 ?AUTO_5498 ) ) ( not ( = ?AUTO_5496 ?AUTO_5498 ) ) ( ON ?AUTO_5496 ?AUTO_5494 ) ( not ( = ?AUTO_5494 ?AUTO_5497 ) ) ( not ( = ?AUTO_5495 ?AUTO_5497 ) ) ( not ( = ?AUTO_5498 ?AUTO_5497 ) ) ( not ( = ?AUTO_5496 ?AUTO_5497 ) ) ( ON ?AUTO_5497 ?AUTO_5496 ) ( CLEAR ?AUTO_5497 ) ( HOLDING ?AUTO_5499 ) ( not ( = ?AUTO_5494 ?AUTO_5499 ) ) ( not ( = ?AUTO_5495 ?AUTO_5499 ) ) ( not ( = ?AUTO_5498 ?AUTO_5499 ) ) ( not ( = ?AUTO_5496 ?AUTO_5499 ) ) ( not ( = ?AUTO_5497 ?AUTO_5499 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5499 )
      ( MAKE-ON-TABLE ?AUTO_5494 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5494 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5502 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5502 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5502 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5502 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5503 - BLOCK
    )
    :vars
    (
      ?AUTO_5504 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5503 ?AUTO_5504 ) ( CLEAR ?AUTO_5503 ) ( HAND-EMPTY ) ( not ( = ?AUTO_5503 ?AUTO_5504 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5503 ?AUTO_5504 )
      ( MAKE-ON-TABLE ?AUTO_5503 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5503 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5505 - BLOCK
    )
    :vars
    (
      ?AUTO_5506 - BLOCK
      ?AUTO_5507 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5505 ?AUTO_5506 ) ( CLEAR ?AUTO_5505 ) ( not ( = ?AUTO_5505 ?AUTO_5506 ) ) ( HOLDING ?AUTO_5507 ) ( not ( = ?AUTO_5505 ?AUTO_5507 ) ) ( not ( = ?AUTO_5506 ?AUTO_5507 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5507 )
      ( MAKE-ON-TABLE ?AUTO_5505 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5505 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5508 - BLOCK
    )
    :vars
    (
      ?AUTO_5509 - BLOCK
      ?AUTO_5510 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5508 ?AUTO_5509 ) ( not ( = ?AUTO_5508 ?AUTO_5509 ) ) ( not ( = ?AUTO_5508 ?AUTO_5510 ) ) ( not ( = ?AUTO_5509 ?AUTO_5510 ) ) ( ON ?AUTO_5510 ?AUTO_5508 ) ( CLEAR ?AUTO_5510 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5510 ?AUTO_5508 )
      ( MAKE-ON-TABLE ?AUTO_5508 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5508 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5511 - BLOCK
    )
    :vars
    (
      ?AUTO_5512 - BLOCK
      ?AUTO_5513 - BLOCK
      ?AUTO_5514 - BLOCK
      ?AUTO_5515 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5511 ?AUTO_5512 ) ( not ( = ?AUTO_5511 ?AUTO_5512 ) ) ( not ( = ?AUTO_5511 ?AUTO_5513 ) ) ( not ( = ?AUTO_5512 ?AUTO_5513 ) ) ( ON ?AUTO_5513 ?AUTO_5511 ) ( CLEAR ?AUTO_5513 ) ( HOLDING ?AUTO_5514 ) ( CLEAR ?AUTO_5515 ) ( not ( = ?AUTO_5511 ?AUTO_5514 ) ) ( not ( = ?AUTO_5511 ?AUTO_5515 ) ) ( not ( = ?AUTO_5512 ?AUTO_5514 ) ) ( not ( = ?AUTO_5512 ?AUTO_5515 ) ) ( not ( = ?AUTO_5513 ?AUTO_5514 ) ) ( not ( = ?AUTO_5513 ?AUTO_5515 ) ) ( not ( = ?AUTO_5514 ?AUTO_5515 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5514 ?AUTO_5515 )
      ( MAKE-ON-TABLE ?AUTO_5511 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5511 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5518 - BLOCK
    )
    :vars
    (
      ?AUTO_5522 - BLOCK
      ?AUTO_5521 - BLOCK
      ?AUTO_5520 - BLOCK
      ?AUTO_5519 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5518 ?AUTO_5522 ) ( not ( = ?AUTO_5518 ?AUTO_5522 ) ) ( not ( = ?AUTO_5518 ?AUTO_5521 ) ) ( not ( = ?AUTO_5522 ?AUTO_5521 ) ) ( ON ?AUTO_5521 ?AUTO_5518 ) ( CLEAR ?AUTO_5520 ) ( not ( = ?AUTO_5518 ?AUTO_5519 ) ) ( not ( = ?AUTO_5518 ?AUTO_5520 ) ) ( not ( = ?AUTO_5522 ?AUTO_5519 ) ) ( not ( = ?AUTO_5522 ?AUTO_5520 ) ) ( not ( = ?AUTO_5521 ?AUTO_5519 ) ) ( not ( = ?AUTO_5521 ?AUTO_5520 ) ) ( not ( = ?AUTO_5519 ?AUTO_5520 ) ) ( ON ?AUTO_5519 ?AUTO_5521 ) ( CLEAR ?AUTO_5519 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5519 ?AUTO_5521 )
      ( MAKE-ON-TABLE ?AUTO_5518 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5518 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5523 - BLOCK
    )
    :vars
    (
      ?AUTO_5524 - BLOCK
      ?AUTO_5525 - BLOCK
      ?AUTO_5527 - BLOCK
      ?AUTO_5526 - BLOCK
      ?AUTO_5528 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5523 ?AUTO_5524 ) ( not ( = ?AUTO_5523 ?AUTO_5524 ) ) ( not ( = ?AUTO_5523 ?AUTO_5525 ) ) ( not ( = ?AUTO_5524 ?AUTO_5525 ) ) ( ON ?AUTO_5525 ?AUTO_5523 ) ( CLEAR ?AUTO_5527 ) ( not ( = ?AUTO_5523 ?AUTO_5526 ) ) ( not ( = ?AUTO_5523 ?AUTO_5527 ) ) ( not ( = ?AUTO_5524 ?AUTO_5526 ) ) ( not ( = ?AUTO_5524 ?AUTO_5527 ) ) ( not ( = ?AUTO_5525 ?AUTO_5526 ) ) ( not ( = ?AUTO_5525 ?AUTO_5527 ) ) ( not ( = ?AUTO_5526 ?AUTO_5527 ) ) ( ON ?AUTO_5526 ?AUTO_5525 ) ( CLEAR ?AUTO_5526 ) ( HOLDING ?AUTO_5528 ) ( not ( = ?AUTO_5523 ?AUTO_5528 ) ) ( not ( = ?AUTO_5524 ?AUTO_5528 ) ) ( not ( = ?AUTO_5525 ?AUTO_5528 ) ) ( not ( = ?AUTO_5527 ?AUTO_5528 ) ) ( not ( = ?AUTO_5526 ?AUTO_5528 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5528 )
      ( MAKE-ON-TABLE ?AUTO_5523 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5523 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5529 - BLOCK
    )
    :vars
    (
      ?AUTO_5531 - BLOCK
      ?AUTO_5530 - BLOCK
      ?AUTO_5532 - BLOCK
      ?AUTO_5533 - BLOCK
      ?AUTO_5534 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5529 ?AUTO_5531 ) ( not ( = ?AUTO_5529 ?AUTO_5531 ) ) ( not ( = ?AUTO_5529 ?AUTO_5530 ) ) ( not ( = ?AUTO_5531 ?AUTO_5530 ) ) ( ON ?AUTO_5530 ?AUTO_5529 ) ( CLEAR ?AUTO_5532 ) ( not ( = ?AUTO_5529 ?AUTO_5533 ) ) ( not ( = ?AUTO_5529 ?AUTO_5532 ) ) ( not ( = ?AUTO_5531 ?AUTO_5533 ) ) ( not ( = ?AUTO_5531 ?AUTO_5532 ) ) ( not ( = ?AUTO_5530 ?AUTO_5533 ) ) ( not ( = ?AUTO_5530 ?AUTO_5532 ) ) ( not ( = ?AUTO_5533 ?AUTO_5532 ) ) ( ON ?AUTO_5533 ?AUTO_5530 ) ( not ( = ?AUTO_5529 ?AUTO_5534 ) ) ( not ( = ?AUTO_5531 ?AUTO_5534 ) ) ( not ( = ?AUTO_5530 ?AUTO_5534 ) ) ( not ( = ?AUTO_5532 ?AUTO_5534 ) ) ( not ( = ?AUTO_5533 ?AUTO_5534 ) ) ( ON ?AUTO_5534 ?AUTO_5533 ) ( CLEAR ?AUTO_5534 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5534 ?AUTO_5533 )
      ( MAKE-ON-TABLE ?AUTO_5529 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5529 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5535 - BLOCK
    )
    :vars
    (
      ?AUTO_5539 - BLOCK
      ?AUTO_5537 - BLOCK
      ?AUTO_5536 - BLOCK
      ?AUTO_5538 - BLOCK
      ?AUTO_5540 - BLOCK
      ?AUTO_5541 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5535 ?AUTO_5539 ) ( not ( = ?AUTO_5535 ?AUTO_5539 ) ) ( not ( = ?AUTO_5535 ?AUTO_5537 ) ) ( not ( = ?AUTO_5539 ?AUTO_5537 ) ) ( ON ?AUTO_5537 ?AUTO_5535 ) ( CLEAR ?AUTO_5536 ) ( not ( = ?AUTO_5535 ?AUTO_5538 ) ) ( not ( = ?AUTO_5535 ?AUTO_5536 ) ) ( not ( = ?AUTO_5539 ?AUTO_5538 ) ) ( not ( = ?AUTO_5539 ?AUTO_5536 ) ) ( not ( = ?AUTO_5537 ?AUTO_5538 ) ) ( not ( = ?AUTO_5537 ?AUTO_5536 ) ) ( not ( = ?AUTO_5538 ?AUTO_5536 ) ) ( ON ?AUTO_5538 ?AUTO_5537 ) ( not ( = ?AUTO_5535 ?AUTO_5540 ) ) ( not ( = ?AUTO_5539 ?AUTO_5540 ) ) ( not ( = ?AUTO_5537 ?AUTO_5540 ) ) ( not ( = ?AUTO_5536 ?AUTO_5540 ) ) ( not ( = ?AUTO_5538 ?AUTO_5540 ) ) ( ON ?AUTO_5540 ?AUTO_5538 ) ( CLEAR ?AUTO_5540 ) ( HOLDING ?AUTO_5541 ) ( not ( = ?AUTO_5535 ?AUTO_5541 ) ) ( not ( = ?AUTO_5539 ?AUTO_5541 ) ) ( not ( = ?AUTO_5537 ?AUTO_5541 ) ) ( not ( = ?AUTO_5536 ?AUTO_5541 ) ) ( not ( = ?AUTO_5538 ?AUTO_5541 ) ) ( not ( = ?AUTO_5540 ?AUTO_5541 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5541 )
      ( MAKE-ON-TABLE ?AUTO_5535 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5535 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5545 - BLOCK
      ?AUTO_5546 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5545 ) ( CLEAR ?AUTO_5546 ) ( not ( = ?AUTO_5545 ?AUTO_5546 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5545 ?AUTO_5546 )
      ( MAKE-ON-VERIFY ?AUTO_5545 ?AUTO_5546 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5547 - BLOCK
      ?AUTO_5548 - BLOCK
    )
    :vars
    (
      ?AUTO_5549 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5548 ) ( not ( = ?AUTO_5547 ?AUTO_5548 ) ) ( ON ?AUTO_5547 ?AUTO_5549 ) ( CLEAR ?AUTO_5547 ) ( HAND-EMPTY ) ( not ( = ?AUTO_5547 ?AUTO_5549 ) ) ( not ( = ?AUTO_5548 ?AUTO_5549 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5547 ?AUTO_5549 )
      ( MAKE-ON ?AUTO_5547 ?AUTO_5548 )
      ( MAKE-ON-VERIFY ?AUTO_5547 ?AUTO_5548 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5550 - BLOCK
      ?AUTO_5551 - BLOCK
    )
    :vars
    (
      ?AUTO_5552 - BLOCK
      ?AUTO_5553 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5551 ) ( not ( = ?AUTO_5550 ?AUTO_5551 ) ) ( ON ?AUTO_5550 ?AUTO_5552 ) ( CLEAR ?AUTO_5550 ) ( not ( = ?AUTO_5550 ?AUTO_5552 ) ) ( not ( = ?AUTO_5551 ?AUTO_5552 ) ) ( HOLDING ?AUTO_5553 ) ( not ( = ?AUTO_5550 ?AUTO_5553 ) ) ( not ( = ?AUTO_5551 ?AUTO_5553 ) ) ( not ( = ?AUTO_5552 ?AUTO_5553 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5553 )
      ( MAKE-ON ?AUTO_5550 ?AUTO_5551 )
      ( MAKE-ON-VERIFY ?AUTO_5550 ?AUTO_5551 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5554 - BLOCK
      ?AUTO_5555 - BLOCK
    )
    :vars
    (
      ?AUTO_5556 - BLOCK
      ?AUTO_5557 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5554 ?AUTO_5555 ) ) ( ON ?AUTO_5554 ?AUTO_5556 ) ( CLEAR ?AUTO_5554 ) ( not ( = ?AUTO_5554 ?AUTO_5556 ) ) ( not ( = ?AUTO_5555 ?AUTO_5556 ) ) ( not ( = ?AUTO_5554 ?AUTO_5557 ) ) ( not ( = ?AUTO_5555 ?AUTO_5557 ) ) ( not ( = ?AUTO_5556 ?AUTO_5557 ) ) ( ON ?AUTO_5557 ?AUTO_5555 ) ( CLEAR ?AUTO_5557 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5557 ?AUTO_5555 )
      ( MAKE-ON ?AUTO_5554 ?AUTO_5555 )
      ( MAKE-ON-VERIFY ?AUTO_5554 ?AUTO_5555 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5558 - BLOCK
      ?AUTO_5559 - BLOCK
    )
    :vars
    (
      ?AUTO_5560 - BLOCK
      ?AUTO_5561 - BLOCK
      ?AUTO_5562 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5558 ?AUTO_5559 ) ) ( ON ?AUTO_5558 ?AUTO_5560 ) ( CLEAR ?AUTO_5558 ) ( not ( = ?AUTO_5558 ?AUTO_5560 ) ) ( not ( = ?AUTO_5559 ?AUTO_5560 ) ) ( not ( = ?AUTO_5558 ?AUTO_5561 ) ) ( not ( = ?AUTO_5559 ?AUTO_5561 ) ) ( not ( = ?AUTO_5560 ?AUTO_5561 ) ) ( ON ?AUTO_5561 ?AUTO_5559 ) ( CLEAR ?AUTO_5561 ) ( HOLDING ?AUTO_5562 ) ( not ( = ?AUTO_5558 ?AUTO_5562 ) ) ( not ( = ?AUTO_5559 ?AUTO_5562 ) ) ( not ( = ?AUTO_5560 ?AUTO_5562 ) ) ( not ( = ?AUTO_5561 ?AUTO_5562 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5562 )
      ( MAKE-ON ?AUTO_5558 ?AUTO_5559 )
      ( MAKE-ON-VERIFY ?AUTO_5558 ?AUTO_5559 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5563 - BLOCK
      ?AUTO_5564 - BLOCK
    )
    :vars
    (
      ?AUTO_5565 - BLOCK
      ?AUTO_5566 - BLOCK
      ?AUTO_5567 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5563 ?AUTO_5564 ) ) ( ON ?AUTO_5563 ?AUTO_5565 ) ( CLEAR ?AUTO_5563 ) ( not ( = ?AUTO_5563 ?AUTO_5565 ) ) ( not ( = ?AUTO_5564 ?AUTO_5565 ) ) ( not ( = ?AUTO_5563 ?AUTO_5566 ) ) ( not ( = ?AUTO_5564 ?AUTO_5566 ) ) ( not ( = ?AUTO_5565 ?AUTO_5566 ) ) ( ON ?AUTO_5566 ?AUTO_5564 ) ( not ( = ?AUTO_5563 ?AUTO_5567 ) ) ( not ( = ?AUTO_5564 ?AUTO_5567 ) ) ( not ( = ?AUTO_5565 ?AUTO_5567 ) ) ( not ( = ?AUTO_5566 ?AUTO_5567 ) ) ( ON ?AUTO_5567 ?AUTO_5566 ) ( CLEAR ?AUTO_5567 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5567 ?AUTO_5566 )
      ( MAKE-ON ?AUTO_5563 ?AUTO_5564 )
      ( MAKE-ON-VERIFY ?AUTO_5563 ?AUTO_5564 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5568 - BLOCK
      ?AUTO_5569 - BLOCK
    )
    :vars
    (
      ?AUTO_5571 - BLOCK
      ?AUTO_5570 - BLOCK
      ?AUTO_5572 - BLOCK
      ?AUTO_5573 - BLOCK
      ?AUTO_5574 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5568 ?AUTO_5569 ) ) ( ON ?AUTO_5568 ?AUTO_5571 ) ( CLEAR ?AUTO_5568 ) ( not ( = ?AUTO_5568 ?AUTO_5571 ) ) ( not ( = ?AUTO_5569 ?AUTO_5571 ) ) ( not ( = ?AUTO_5568 ?AUTO_5570 ) ) ( not ( = ?AUTO_5569 ?AUTO_5570 ) ) ( not ( = ?AUTO_5571 ?AUTO_5570 ) ) ( ON ?AUTO_5570 ?AUTO_5569 ) ( not ( = ?AUTO_5568 ?AUTO_5572 ) ) ( not ( = ?AUTO_5569 ?AUTO_5572 ) ) ( not ( = ?AUTO_5571 ?AUTO_5572 ) ) ( not ( = ?AUTO_5570 ?AUTO_5572 ) ) ( ON ?AUTO_5572 ?AUTO_5570 ) ( CLEAR ?AUTO_5572 ) ( HOLDING ?AUTO_5573 ) ( CLEAR ?AUTO_5574 ) ( not ( = ?AUTO_5568 ?AUTO_5573 ) ) ( not ( = ?AUTO_5568 ?AUTO_5574 ) ) ( not ( = ?AUTO_5569 ?AUTO_5573 ) ) ( not ( = ?AUTO_5569 ?AUTO_5574 ) ) ( not ( = ?AUTO_5571 ?AUTO_5573 ) ) ( not ( = ?AUTO_5571 ?AUTO_5574 ) ) ( not ( = ?AUTO_5570 ?AUTO_5573 ) ) ( not ( = ?AUTO_5570 ?AUTO_5574 ) ) ( not ( = ?AUTO_5572 ?AUTO_5573 ) ) ( not ( = ?AUTO_5572 ?AUTO_5574 ) ) ( not ( = ?AUTO_5573 ?AUTO_5574 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5573 ?AUTO_5574 )
      ( MAKE-ON ?AUTO_5568 ?AUTO_5569 )
      ( MAKE-ON-VERIFY ?AUTO_5568 ?AUTO_5569 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5579 - BLOCK
      ?AUTO_5580 - BLOCK
    )
    :vars
    (
      ?AUTO_5583 - BLOCK
      ?AUTO_5584 - BLOCK
      ?AUTO_5582 - BLOCK
      ?AUTO_5585 - BLOCK
      ?AUTO_5581 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5579 ?AUTO_5580 ) ) ( ON ?AUTO_5579 ?AUTO_5583 ) ( CLEAR ?AUTO_5579 ) ( not ( = ?AUTO_5579 ?AUTO_5583 ) ) ( not ( = ?AUTO_5580 ?AUTO_5583 ) ) ( not ( = ?AUTO_5579 ?AUTO_5584 ) ) ( not ( = ?AUTO_5580 ?AUTO_5584 ) ) ( not ( = ?AUTO_5583 ?AUTO_5584 ) ) ( ON ?AUTO_5584 ?AUTO_5580 ) ( not ( = ?AUTO_5579 ?AUTO_5582 ) ) ( not ( = ?AUTO_5580 ?AUTO_5582 ) ) ( not ( = ?AUTO_5583 ?AUTO_5582 ) ) ( not ( = ?AUTO_5584 ?AUTO_5582 ) ) ( ON ?AUTO_5582 ?AUTO_5584 ) ( CLEAR ?AUTO_5585 ) ( not ( = ?AUTO_5579 ?AUTO_5581 ) ) ( not ( = ?AUTO_5579 ?AUTO_5585 ) ) ( not ( = ?AUTO_5580 ?AUTO_5581 ) ) ( not ( = ?AUTO_5580 ?AUTO_5585 ) ) ( not ( = ?AUTO_5583 ?AUTO_5581 ) ) ( not ( = ?AUTO_5583 ?AUTO_5585 ) ) ( not ( = ?AUTO_5584 ?AUTO_5581 ) ) ( not ( = ?AUTO_5584 ?AUTO_5585 ) ) ( not ( = ?AUTO_5582 ?AUTO_5581 ) ) ( not ( = ?AUTO_5582 ?AUTO_5585 ) ) ( not ( = ?AUTO_5581 ?AUTO_5585 ) ) ( ON ?AUTO_5581 ?AUTO_5582 ) ( CLEAR ?AUTO_5581 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5581 ?AUTO_5582 )
      ( MAKE-ON ?AUTO_5579 ?AUTO_5580 )
      ( MAKE-ON-VERIFY ?AUTO_5579 ?AUTO_5580 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5586 - BLOCK
      ?AUTO_5587 - BLOCK
    )
    :vars
    (
      ?AUTO_5592 - BLOCK
      ?AUTO_5590 - BLOCK
      ?AUTO_5589 - BLOCK
      ?AUTO_5588 - BLOCK
      ?AUTO_5591 - BLOCK
      ?AUTO_5593 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5586 ?AUTO_5587 ) ) ( ON ?AUTO_5586 ?AUTO_5592 ) ( CLEAR ?AUTO_5586 ) ( not ( = ?AUTO_5586 ?AUTO_5592 ) ) ( not ( = ?AUTO_5587 ?AUTO_5592 ) ) ( not ( = ?AUTO_5586 ?AUTO_5590 ) ) ( not ( = ?AUTO_5587 ?AUTO_5590 ) ) ( not ( = ?AUTO_5592 ?AUTO_5590 ) ) ( ON ?AUTO_5590 ?AUTO_5587 ) ( not ( = ?AUTO_5586 ?AUTO_5589 ) ) ( not ( = ?AUTO_5587 ?AUTO_5589 ) ) ( not ( = ?AUTO_5592 ?AUTO_5589 ) ) ( not ( = ?AUTO_5590 ?AUTO_5589 ) ) ( ON ?AUTO_5589 ?AUTO_5590 ) ( CLEAR ?AUTO_5588 ) ( not ( = ?AUTO_5586 ?AUTO_5591 ) ) ( not ( = ?AUTO_5586 ?AUTO_5588 ) ) ( not ( = ?AUTO_5587 ?AUTO_5591 ) ) ( not ( = ?AUTO_5587 ?AUTO_5588 ) ) ( not ( = ?AUTO_5592 ?AUTO_5591 ) ) ( not ( = ?AUTO_5592 ?AUTO_5588 ) ) ( not ( = ?AUTO_5590 ?AUTO_5591 ) ) ( not ( = ?AUTO_5590 ?AUTO_5588 ) ) ( not ( = ?AUTO_5589 ?AUTO_5591 ) ) ( not ( = ?AUTO_5589 ?AUTO_5588 ) ) ( not ( = ?AUTO_5591 ?AUTO_5588 ) ) ( ON ?AUTO_5591 ?AUTO_5589 ) ( CLEAR ?AUTO_5591 ) ( HOLDING ?AUTO_5593 ) ( not ( = ?AUTO_5586 ?AUTO_5593 ) ) ( not ( = ?AUTO_5587 ?AUTO_5593 ) ) ( not ( = ?AUTO_5592 ?AUTO_5593 ) ) ( not ( = ?AUTO_5590 ?AUTO_5593 ) ) ( not ( = ?AUTO_5589 ?AUTO_5593 ) ) ( not ( = ?AUTO_5588 ?AUTO_5593 ) ) ( not ( = ?AUTO_5591 ?AUTO_5593 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5593 )
      ( MAKE-ON ?AUTO_5586 ?AUTO_5587 )
      ( MAKE-ON-VERIFY ?AUTO_5586 ?AUTO_5587 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5594 - BLOCK
      ?AUTO_5595 - BLOCK
    )
    :vars
    (
      ?AUTO_5597 - BLOCK
      ?AUTO_5596 - BLOCK
      ?AUTO_5600 - BLOCK
      ?AUTO_5599 - BLOCK
      ?AUTO_5598 - BLOCK
      ?AUTO_5601 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5594 ?AUTO_5595 ) ) ( ON ?AUTO_5594 ?AUTO_5597 ) ( CLEAR ?AUTO_5594 ) ( not ( = ?AUTO_5594 ?AUTO_5597 ) ) ( not ( = ?AUTO_5595 ?AUTO_5597 ) ) ( not ( = ?AUTO_5594 ?AUTO_5596 ) ) ( not ( = ?AUTO_5595 ?AUTO_5596 ) ) ( not ( = ?AUTO_5597 ?AUTO_5596 ) ) ( ON ?AUTO_5596 ?AUTO_5595 ) ( not ( = ?AUTO_5594 ?AUTO_5600 ) ) ( not ( = ?AUTO_5595 ?AUTO_5600 ) ) ( not ( = ?AUTO_5597 ?AUTO_5600 ) ) ( not ( = ?AUTO_5596 ?AUTO_5600 ) ) ( ON ?AUTO_5600 ?AUTO_5596 ) ( CLEAR ?AUTO_5599 ) ( not ( = ?AUTO_5594 ?AUTO_5598 ) ) ( not ( = ?AUTO_5594 ?AUTO_5599 ) ) ( not ( = ?AUTO_5595 ?AUTO_5598 ) ) ( not ( = ?AUTO_5595 ?AUTO_5599 ) ) ( not ( = ?AUTO_5597 ?AUTO_5598 ) ) ( not ( = ?AUTO_5597 ?AUTO_5599 ) ) ( not ( = ?AUTO_5596 ?AUTO_5598 ) ) ( not ( = ?AUTO_5596 ?AUTO_5599 ) ) ( not ( = ?AUTO_5600 ?AUTO_5598 ) ) ( not ( = ?AUTO_5600 ?AUTO_5599 ) ) ( not ( = ?AUTO_5598 ?AUTO_5599 ) ) ( ON ?AUTO_5598 ?AUTO_5600 ) ( not ( = ?AUTO_5594 ?AUTO_5601 ) ) ( not ( = ?AUTO_5595 ?AUTO_5601 ) ) ( not ( = ?AUTO_5597 ?AUTO_5601 ) ) ( not ( = ?AUTO_5596 ?AUTO_5601 ) ) ( not ( = ?AUTO_5600 ?AUTO_5601 ) ) ( not ( = ?AUTO_5599 ?AUTO_5601 ) ) ( not ( = ?AUTO_5598 ?AUTO_5601 ) ) ( ON ?AUTO_5601 ?AUTO_5598 ) ( CLEAR ?AUTO_5601 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5601 ?AUTO_5598 )
      ( MAKE-ON ?AUTO_5594 ?AUTO_5595 )
      ( MAKE-ON-VERIFY ?AUTO_5594 ?AUTO_5595 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5602 - BLOCK
      ?AUTO_5603 - BLOCK
    )
    :vars
    (
      ?AUTO_5609 - BLOCK
      ?AUTO_5607 - BLOCK
      ?AUTO_5604 - BLOCK
      ?AUTO_5605 - BLOCK
      ?AUTO_5606 - BLOCK
      ?AUTO_5608 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5602 ?AUTO_5603 ) ) ( ON ?AUTO_5602 ?AUTO_5609 ) ( CLEAR ?AUTO_5602 ) ( not ( = ?AUTO_5602 ?AUTO_5609 ) ) ( not ( = ?AUTO_5603 ?AUTO_5609 ) ) ( not ( = ?AUTO_5602 ?AUTO_5607 ) ) ( not ( = ?AUTO_5603 ?AUTO_5607 ) ) ( not ( = ?AUTO_5609 ?AUTO_5607 ) ) ( ON ?AUTO_5607 ?AUTO_5603 ) ( not ( = ?AUTO_5602 ?AUTO_5604 ) ) ( not ( = ?AUTO_5603 ?AUTO_5604 ) ) ( not ( = ?AUTO_5609 ?AUTO_5604 ) ) ( not ( = ?AUTO_5607 ?AUTO_5604 ) ) ( ON ?AUTO_5604 ?AUTO_5607 ) ( not ( = ?AUTO_5602 ?AUTO_5605 ) ) ( not ( = ?AUTO_5602 ?AUTO_5606 ) ) ( not ( = ?AUTO_5603 ?AUTO_5605 ) ) ( not ( = ?AUTO_5603 ?AUTO_5606 ) ) ( not ( = ?AUTO_5609 ?AUTO_5605 ) ) ( not ( = ?AUTO_5609 ?AUTO_5606 ) ) ( not ( = ?AUTO_5607 ?AUTO_5605 ) ) ( not ( = ?AUTO_5607 ?AUTO_5606 ) ) ( not ( = ?AUTO_5604 ?AUTO_5605 ) ) ( not ( = ?AUTO_5604 ?AUTO_5606 ) ) ( not ( = ?AUTO_5605 ?AUTO_5606 ) ) ( ON ?AUTO_5605 ?AUTO_5604 ) ( not ( = ?AUTO_5602 ?AUTO_5608 ) ) ( not ( = ?AUTO_5603 ?AUTO_5608 ) ) ( not ( = ?AUTO_5609 ?AUTO_5608 ) ) ( not ( = ?AUTO_5607 ?AUTO_5608 ) ) ( not ( = ?AUTO_5604 ?AUTO_5608 ) ) ( not ( = ?AUTO_5606 ?AUTO_5608 ) ) ( not ( = ?AUTO_5605 ?AUTO_5608 ) ) ( ON ?AUTO_5608 ?AUTO_5605 ) ( CLEAR ?AUTO_5608 ) ( HOLDING ?AUTO_5606 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5606 )
      ( MAKE-ON ?AUTO_5602 ?AUTO_5603 )
      ( MAKE-ON-VERIFY ?AUTO_5602 ?AUTO_5603 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5610 - BLOCK
      ?AUTO_5611 - BLOCK
    )
    :vars
    (
      ?AUTO_5616 - BLOCK
      ?AUTO_5614 - BLOCK
      ?AUTO_5613 - BLOCK
      ?AUTO_5612 - BLOCK
      ?AUTO_5617 - BLOCK
      ?AUTO_5615 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5610 ?AUTO_5611 ) ) ( ON ?AUTO_5610 ?AUTO_5616 ) ( not ( = ?AUTO_5610 ?AUTO_5616 ) ) ( not ( = ?AUTO_5611 ?AUTO_5616 ) ) ( not ( = ?AUTO_5610 ?AUTO_5614 ) ) ( not ( = ?AUTO_5611 ?AUTO_5614 ) ) ( not ( = ?AUTO_5616 ?AUTO_5614 ) ) ( ON ?AUTO_5614 ?AUTO_5611 ) ( not ( = ?AUTO_5610 ?AUTO_5613 ) ) ( not ( = ?AUTO_5611 ?AUTO_5613 ) ) ( not ( = ?AUTO_5616 ?AUTO_5613 ) ) ( not ( = ?AUTO_5614 ?AUTO_5613 ) ) ( ON ?AUTO_5613 ?AUTO_5614 ) ( not ( = ?AUTO_5610 ?AUTO_5612 ) ) ( not ( = ?AUTO_5610 ?AUTO_5617 ) ) ( not ( = ?AUTO_5611 ?AUTO_5612 ) ) ( not ( = ?AUTO_5611 ?AUTO_5617 ) ) ( not ( = ?AUTO_5616 ?AUTO_5612 ) ) ( not ( = ?AUTO_5616 ?AUTO_5617 ) ) ( not ( = ?AUTO_5614 ?AUTO_5612 ) ) ( not ( = ?AUTO_5614 ?AUTO_5617 ) ) ( not ( = ?AUTO_5613 ?AUTO_5612 ) ) ( not ( = ?AUTO_5613 ?AUTO_5617 ) ) ( not ( = ?AUTO_5612 ?AUTO_5617 ) ) ( ON ?AUTO_5612 ?AUTO_5613 ) ( not ( = ?AUTO_5610 ?AUTO_5615 ) ) ( not ( = ?AUTO_5611 ?AUTO_5615 ) ) ( not ( = ?AUTO_5616 ?AUTO_5615 ) ) ( not ( = ?AUTO_5614 ?AUTO_5615 ) ) ( not ( = ?AUTO_5613 ?AUTO_5615 ) ) ( not ( = ?AUTO_5617 ?AUTO_5615 ) ) ( not ( = ?AUTO_5612 ?AUTO_5615 ) ) ( ON ?AUTO_5615 ?AUTO_5612 ) ( CLEAR ?AUTO_5615 ) ( ON ?AUTO_5617 ?AUTO_5610 ) ( CLEAR ?AUTO_5617 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5617 ?AUTO_5610 )
      ( MAKE-ON ?AUTO_5610 ?AUTO_5611 )
      ( MAKE-ON-VERIFY ?AUTO_5610 ?AUTO_5611 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5620 - BLOCK
      ?AUTO_5621 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5620 ) ( CLEAR ?AUTO_5621 ) ( not ( = ?AUTO_5620 ?AUTO_5621 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5620 ?AUTO_5621 )
      ( MAKE-ON-VERIFY ?AUTO_5620 ?AUTO_5621 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5622 - BLOCK
      ?AUTO_5623 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5623 ) ( not ( = ?AUTO_5622 ?AUTO_5623 ) ) ( ON-TABLE ?AUTO_5622 ) ( CLEAR ?AUTO_5622 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_5622 )
      ( MAKE-ON ?AUTO_5622 ?AUTO_5623 )
      ( MAKE-ON-VERIFY ?AUTO_5622 ?AUTO_5623 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5624 - BLOCK
      ?AUTO_5625 - BLOCK
    )
    :vars
    (
      ?AUTO_5626 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5624 ?AUTO_5625 ) ) ( ON-TABLE ?AUTO_5624 ) ( CLEAR ?AUTO_5624 ) ( HOLDING ?AUTO_5625 ) ( CLEAR ?AUTO_5626 ) ( not ( = ?AUTO_5624 ?AUTO_5626 ) ) ( not ( = ?AUTO_5625 ?AUTO_5626 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5625 ?AUTO_5626 )
      ( MAKE-ON ?AUTO_5624 ?AUTO_5625 )
      ( MAKE-ON-VERIFY ?AUTO_5624 ?AUTO_5625 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5635 - BLOCK
      ?AUTO_5636 - BLOCK
    )
    :vars
    (
      ?AUTO_5638 - BLOCK
      ?AUTO_5637 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5636 ) ( not ( = ?AUTO_5635 ?AUTO_5636 ) ) ( ON ?AUTO_5635 ?AUTO_5638 ) ( not ( = ?AUTO_5635 ?AUTO_5638 ) ) ( not ( = ?AUTO_5636 ?AUTO_5638 ) ) ( not ( = ?AUTO_5635 ?AUTO_5637 ) ) ( not ( = ?AUTO_5636 ?AUTO_5637 ) ) ( not ( = ?AUTO_5638 ?AUTO_5637 ) ) ( ON ?AUTO_5637 ?AUTO_5635 ) ( CLEAR ?AUTO_5637 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5637 ?AUTO_5635 )
      ( MAKE-ON ?AUTO_5635 ?AUTO_5636 )
      ( MAKE-ON-VERIFY ?AUTO_5635 ?AUTO_5636 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5639 - BLOCK
      ?AUTO_5640 - BLOCK
    )
    :vars
    (
      ?AUTO_5641 - BLOCK
      ?AUTO_5642 - BLOCK
      ?AUTO_5643 - BLOCK
      ?AUTO_5644 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5640 ) ( not ( = ?AUTO_5639 ?AUTO_5640 ) ) ( ON ?AUTO_5639 ?AUTO_5641 ) ( not ( = ?AUTO_5639 ?AUTO_5641 ) ) ( not ( = ?AUTO_5640 ?AUTO_5641 ) ) ( not ( = ?AUTO_5639 ?AUTO_5642 ) ) ( not ( = ?AUTO_5640 ?AUTO_5642 ) ) ( not ( = ?AUTO_5641 ?AUTO_5642 ) ) ( ON ?AUTO_5642 ?AUTO_5639 ) ( CLEAR ?AUTO_5642 ) ( HOLDING ?AUTO_5643 ) ( CLEAR ?AUTO_5644 ) ( not ( = ?AUTO_5639 ?AUTO_5643 ) ) ( not ( = ?AUTO_5639 ?AUTO_5644 ) ) ( not ( = ?AUTO_5640 ?AUTO_5643 ) ) ( not ( = ?AUTO_5640 ?AUTO_5644 ) ) ( not ( = ?AUTO_5641 ?AUTO_5643 ) ) ( not ( = ?AUTO_5641 ?AUTO_5644 ) ) ( not ( = ?AUTO_5642 ?AUTO_5643 ) ) ( not ( = ?AUTO_5642 ?AUTO_5644 ) ) ( not ( = ?AUTO_5643 ?AUTO_5644 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5643 ?AUTO_5644 )
      ( MAKE-ON ?AUTO_5639 ?AUTO_5640 )
      ( MAKE-ON-VERIFY ?AUTO_5639 ?AUTO_5640 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5649 - BLOCK
      ?AUTO_5650 - BLOCK
    )
    :vars
    (
      ?AUTO_5651 - BLOCK
      ?AUTO_5654 - BLOCK
      ?AUTO_5652 - BLOCK
      ?AUTO_5653 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5650 ) ( not ( = ?AUTO_5649 ?AUTO_5650 ) ) ( ON ?AUTO_5649 ?AUTO_5651 ) ( not ( = ?AUTO_5649 ?AUTO_5651 ) ) ( not ( = ?AUTO_5650 ?AUTO_5651 ) ) ( not ( = ?AUTO_5649 ?AUTO_5654 ) ) ( not ( = ?AUTO_5650 ?AUTO_5654 ) ) ( not ( = ?AUTO_5651 ?AUTO_5654 ) ) ( ON ?AUTO_5654 ?AUTO_5649 ) ( CLEAR ?AUTO_5652 ) ( not ( = ?AUTO_5649 ?AUTO_5653 ) ) ( not ( = ?AUTO_5649 ?AUTO_5652 ) ) ( not ( = ?AUTO_5650 ?AUTO_5653 ) ) ( not ( = ?AUTO_5650 ?AUTO_5652 ) ) ( not ( = ?AUTO_5651 ?AUTO_5653 ) ) ( not ( = ?AUTO_5651 ?AUTO_5652 ) ) ( not ( = ?AUTO_5654 ?AUTO_5653 ) ) ( not ( = ?AUTO_5654 ?AUTO_5652 ) ) ( not ( = ?AUTO_5653 ?AUTO_5652 ) ) ( ON ?AUTO_5653 ?AUTO_5654 ) ( CLEAR ?AUTO_5653 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5653 ?AUTO_5654 )
      ( MAKE-ON ?AUTO_5649 ?AUTO_5650 )
      ( MAKE-ON-VERIFY ?AUTO_5649 ?AUTO_5650 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5655 - BLOCK
      ?AUTO_5656 - BLOCK
    )
    :vars
    (
      ?AUTO_5659 - BLOCK
      ?AUTO_5657 - BLOCK
      ?AUTO_5658 - BLOCK
      ?AUTO_5660 - BLOCK
      ?AUTO_5661 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5656 ) ( not ( = ?AUTO_5655 ?AUTO_5656 ) ) ( ON ?AUTO_5655 ?AUTO_5659 ) ( not ( = ?AUTO_5655 ?AUTO_5659 ) ) ( not ( = ?AUTO_5656 ?AUTO_5659 ) ) ( not ( = ?AUTO_5655 ?AUTO_5657 ) ) ( not ( = ?AUTO_5656 ?AUTO_5657 ) ) ( not ( = ?AUTO_5659 ?AUTO_5657 ) ) ( ON ?AUTO_5657 ?AUTO_5655 ) ( CLEAR ?AUTO_5658 ) ( not ( = ?AUTO_5655 ?AUTO_5660 ) ) ( not ( = ?AUTO_5655 ?AUTO_5658 ) ) ( not ( = ?AUTO_5656 ?AUTO_5660 ) ) ( not ( = ?AUTO_5656 ?AUTO_5658 ) ) ( not ( = ?AUTO_5659 ?AUTO_5660 ) ) ( not ( = ?AUTO_5659 ?AUTO_5658 ) ) ( not ( = ?AUTO_5657 ?AUTO_5660 ) ) ( not ( = ?AUTO_5657 ?AUTO_5658 ) ) ( not ( = ?AUTO_5660 ?AUTO_5658 ) ) ( ON ?AUTO_5660 ?AUTO_5657 ) ( CLEAR ?AUTO_5660 ) ( HOLDING ?AUTO_5661 ) ( not ( = ?AUTO_5655 ?AUTO_5661 ) ) ( not ( = ?AUTO_5656 ?AUTO_5661 ) ) ( not ( = ?AUTO_5659 ?AUTO_5661 ) ) ( not ( = ?AUTO_5657 ?AUTO_5661 ) ) ( not ( = ?AUTO_5658 ?AUTO_5661 ) ) ( not ( = ?AUTO_5660 ?AUTO_5661 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5661 )
      ( MAKE-ON ?AUTO_5655 ?AUTO_5656 )
      ( MAKE-ON-VERIFY ?AUTO_5655 ?AUTO_5656 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5662 - BLOCK
      ?AUTO_5663 - BLOCK
    )
    :vars
    (
      ?AUTO_5664 - BLOCK
      ?AUTO_5668 - BLOCK
      ?AUTO_5667 - BLOCK
      ?AUTO_5665 - BLOCK
      ?AUTO_5666 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5663 ) ( not ( = ?AUTO_5662 ?AUTO_5663 ) ) ( ON ?AUTO_5662 ?AUTO_5664 ) ( not ( = ?AUTO_5662 ?AUTO_5664 ) ) ( not ( = ?AUTO_5663 ?AUTO_5664 ) ) ( not ( = ?AUTO_5662 ?AUTO_5668 ) ) ( not ( = ?AUTO_5663 ?AUTO_5668 ) ) ( not ( = ?AUTO_5664 ?AUTO_5668 ) ) ( ON ?AUTO_5668 ?AUTO_5662 ) ( CLEAR ?AUTO_5667 ) ( not ( = ?AUTO_5662 ?AUTO_5665 ) ) ( not ( = ?AUTO_5662 ?AUTO_5667 ) ) ( not ( = ?AUTO_5663 ?AUTO_5665 ) ) ( not ( = ?AUTO_5663 ?AUTO_5667 ) ) ( not ( = ?AUTO_5664 ?AUTO_5665 ) ) ( not ( = ?AUTO_5664 ?AUTO_5667 ) ) ( not ( = ?AUTO_5668 ?AUTO_5665 ) ) ( not ( = ?AUTO_5668 ?AUTO_5667 ) ) ( not ( = ?AUTO_5665 ?AUTO_5667 ) ) ( ON ?AUTO_5665 ?AUTO_5668 ) ( not ( = ?AUTO_5662 ?AUTO_5666 ) ) ( not ( = ?AUTO_5663 ?AUTO_5666 ) ) ( not ( = ?AUTO_5664 ?AUTO_5666 ) ) ( not ( = ?AUTO_5668 ?AUTO_5666 ) ) ( not ( = ?AUTO_5667 ?AUTO_5666 ) ) ( not ( = ?AUTO_5665 ?AUTO_5666 ) ) ( ON ?AUTO_5666 ?AUTO_5665 ) ( CLEAR ?AUTO_5666 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5666 ?AUTO_5665 )
      ( MAKE-ON ?AUTO_5662 ?AUTO_5663 )
      ( MAKE-ON-VERIFY ?AUTO_5662 ?AUTO_5663 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5669 - BLOCK
      ?AUTO_5670 - BLOCK
    )
    :vars
    (
      ?AUTO_5675 - BLOCK
      ?AUTO_5672 - BLOCK
      ?AUTO_5671 - BLOCK
      ?AUTO_5673 - BLOCK
      ?AUTO_5674 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5670 ) ( not ( = ?AUTO_5669 ?AUTO_5670 ) ) ( ON ?AUTO_5669 ?AUTO_5675 ) ( not ( = ?AUTO_5669 ?AUTO_5675 ) ) ( not ( = ?AUTO_5670 ?AUTO_5675 ) ) ( not ( = ?AUTO_5669 ?AUTO_5672 ) ) ( not ( = ?AUTO_5670 ?AUTO_5672 ) ) ( not ( = ?AUTO_5675 ?AUTO_5672 ) ) ( ON ?AUTO_5672 ?AUTO_5669 ) ( not ( = ?AUTO_5669 ?AUTO_5671 ) ) ( not ( = ?AUTO_5669 ?AUTO_5673 ) ) ( not ( = ?AUTO_5670 ?AUTO_5671 ) ) ( not ( = ?AUTO_5670 ?AUTO_5673 ) ) ( not ( = ?AUTO_5675 ?AUTO_5671 ) ) ( not ( = ?AUTO_5675 ?AUTO_5673 ) ) ( not ( = ?AUTO_5672 ?AUTO_5671 ) ) ( not ( = ?AUTO_5672 ?AUTO_5673 ) ) ( not ( = ?AUTO_5671 ?AUTO_5673 ) ) ( ON ?AUTO_5671 ?AUTO_5672 ) ( not ( = ?AUTO_5669 ?AUTO_5674 ) ) ( not ( = ?AUTO_5670 ?AUTO_5674 ) ) ( not ( = ?AUTO_5675 ?AUTO_5674 ) ) ( not ( = ?AUTO_5672 ?AUTO_5674 ) ) ( not ( = ?AUTO_5673 ?AUTO_5674 ) ) ( not ( = ?AUTO_5671 ?AUTO_5674 ) ) ( ON ?AUTO_5674 ?AUTO_5671 ) ( CLEAR ?AUTO_5674 ) ( HOLDING ?AUTO_5673 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5673 )
      ( MAKE-ON ?AUTO_5669 ?AUTO_5670 )
      ( MAKE-ON-VERIFY ?AUTO_5669 ?AUTO_5670 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5676 - BLOCK
      ?AUTO_5677 - BLOCK
    )
    :vars
    (
      ?AUTO_5678 - BLOCK
      ?AUTO_5679 - BLOCK
      ?AUTO_5680 - BLOCK
      ?AUTO_5682 - BLOCK
      ?AUTO_5681 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5676 ?AUTO_5677 ) ) ( ON ?AUTO_5676 ?AUTO_5678 ) ( not ( = ?AUTO_5676 ?AUTO_5678 ) ) ( not ( = ?AUTO_5677 ?AUTO_5678 ) ) ( not ( = ?AUTO_5676 ?AUTO_5679 ) ) ( not ( = ?AUTO_5677 ?AUTO_5679 ) ) ( not ( = ?AUTO_5678 ?AUTO_5679 ) ) ( ON ?AUTO_5679 ?AUTO_5676 ) ( not ( = ?AUTO_5676 ?AUTO_5680 ) ) ( not ( = ?AUTO_5676 ?AUTO_5682 ) ) ( not ( = ?AUTO_5677 ?AUTO_5680 ) ) ( not ( = ?AUTO_5677 ?AUTO_5682 ) ) ( not ( = ?AUTO_5678 ?AUTO_5680 ) ) ( not ( = ?AUTO_5678 ?AUTO_5682 ) ) ( not ( = ?AUTO_5679 ?AUTO_5680 ) ) ( not ( = ?AUTO_5679 ?AUTO_5682 ) ) ( not ( = ?AUTO_5680 ?AUTO_5682 ) ) ( ON ?AUTO_5680 ?AUTO_5679 ) ( not ( = ?AUTO_5676 ?AUTO_5681 ) ) ( not ( = ?AUTO_5677 ?AUTO_5681 ) ) ( not ( = ?AUTO_5678 ?AUTO_5681 ) ) ( not ( = ?AUTO_5679 ?AUTO_5681 ) ) ( not ( = ?AUTO_5682 ?AUTO_5681 ) ) ( not ( = ?AUTO_5680 ?AUTO_5681 ) ) ( ON ?AUTO_5681 ?AUTO_5680 ) ( CLEAR ?AUTO_5681 ) ( ON ?AUTO_5682 ?AUTO_5677 ) ( CLEAR ?AUTO_5682 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5682 ?AUTO_5677 )
      ( MAKE-ON ?AUTO_5676 ?AUTO_5677 )
      ( MAKE-ON-VERIFY ?AUTO_5676 ?AUTO_5677 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5685 - BLOCK
      ?AUTO_5686 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5685 ) ( CLEAR ?AUTO_5686 ) ( not ( = ?AUTO_5685 ?AUTO_5686 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5685 ?AUTO_5686 )
      ( MAKE-ON-VERIFY ?AUTO_5685 ?AUTO_5686 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5687 - BLOCK
      ?AUTO_5688 - BLOCK
    )
    :vars
    (
      ?AUTO_5689 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5688 ) ( not ( = ?AUTO_5687 ?AUTO_5688 ) ) ( ON ?AUTO_5687 ?AUTO_5689 ) ( CLEAR ?AUTO_5687 ) ( HAND-EMPTY ) ( not ( = ?AUTO_5687 ?AUTO_5689 ) ) ( not ( = ?AUTO_5688 ?AUTO_5689 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5687 ?AUTO_5689 )
      ( MAKE-ON ?AUTO_5687 ?AUTO_5688 )
      ( MAKE-ON-VERIFY ?AUTO_5687 ?AUTO_5688 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5690 - BLOCK
      ?AUTO_5691 - BLOCK
    )
    :vars
    (
      ?AUTO_5692 - BLOCK
      ?AUTO_5693 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5690 ?AUTO_5691 ) ) ( ON ?AUTO_5690 ?AUTO_5692 ) ( CLEAR ?AUTO_5690 ) ( not ( = ?AUTO_5690 ?AUTO_5692 ) ) ( not ( = ?AUTO_5691 ?AUTO_5692 ) ) ( HOLDING ?AUTO_5691 ) ( CLEAR ?AUTO_5693 ) ( not ( = ?AUTO_5690 ?AUTO_5693 ) ) ( not ( = ?AUTO_5691 ?AUTO_5693 ) ) ( not ( = ?AUTO_5692 ?AUTO_5693 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5691 ?AUTO_5693 )
      ( MAKE-ON ?AUTO_5690 ?AUTO_5691 )
      ( MAKE-ON-VERIFY ?AUTO_5690 ?AUTO_5691 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5696 - BLOCK
      ?AUTO_5697 - BLOCK
    )
    :vars
    (
      ?AUTO_5698 - BLOCK
      ?AUTO_5699 - BLOCK
      ?AUTO_5700 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5697 ) ( not ( = ?AUTO_5696 ?AUTO_5697 ) ) ( ON ?AUTO_5696 ?AUTO_5698 ) ( CLEAR ?AUTO_5696 ) ( not ( = ?AUTO_5696 ?AUTO_5698 ) ) ( not ( = ?AUTO_5697 ?AUTO_5698 ) ) ( HOLDING ?AUTO_5699 ) ( CLEAR ?AUTO_5700 ) ( not ( = ?AUTO_5696 ?AUTO_5699 ) ) ( not ( = ?AUTO_5696 ?AUTO_5700 ) ) ( not ( = ?AUTO_5697 ?AUTO_5699 ) ) ( not ( = ?AUTO_5697 ?AUTO_5700 ) ) ( not ( = ?AUTO_5698 ?AUTO_5699 ) ) ( not ( = ?AUTO_5698 ?AUTO_5700 ) ) ( not ( = ?AUTO_5699 ?AUTO_5700 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5699 ?AUTO_5700 )
      ( MAKE-ON ?AUTO_5696 ?AUTO_5697 )
      ( MAKE-ON-VERIFY ?AUTO_5696 ?AUTO_5697 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5701 - BLOCK
      ?AUTO_5702 - BLOCK
    )
    :vars
    (
      ?AUTO_5703 - BLOCK
      ?AUTO_5704 - BLOCK
      ?AUTO_5705 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5702 ) ( not ( = ?AUTO_5701 ?AUTO_5702 ) ) ( ON ?AUTO_5701 ?AUTO_5703 ) ( not ( = ?AUTO_5701 ?AUTO_5703 ) ) ( not ( = ?AUTO_5702 ?AUTO_5703 ) ) ( CLEAR ?AUTO_5704 ) ( not ( = ?AUTO_5701 ?AUTO_5705 ) ) ( not ( = ?AUTO_5701 ?AUTO_5704 ) ) ( not ( = ?AUTO_5702 ?AUTO_5705 ) ) ( not ( = ?AUTO_5702 ?AUTO_5704 ) ) ( not ( = ?AUTO_5703 ?AUTO_5705 ) ) ( not ( = ?AUTO_5703 ?AUTO_5704 ) ) ( not ( = ?AUTO_5705 ?AUTO_5704 ) ) ( ON ?AUTO_5705 ?AUTO_5701 ) ( CLEAR ?AUTO_5705 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5705 ?AUTO_5701 )
      ( MAKE-ON ?AUTO_5701 ?AUTO_5702 )
      ( MAKE-ON-VERIFY ?AUTO_5701 ?AUTO_5702 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5706 - BLOCK
      ?AUTO_5707 - BLOCK
    )
    :vars
    (
      ?AUTO_5708 - BLOCK
      ?AUTO_5709 - BLOCK
      ?AUTO_5710 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5706 ?AUTO_5707 ) ) ( ON ?AUTO_5706 ?AUTO_5708 ) ( not ( = ?AUTO_5706 ?AUTO_5708 ) ) ( not ( = ?AUTO_5707 ?AUTO_5708 ) ) ( CLEAR ?AUTO_5709 ) ( not ( = ?AUTO_5706 ?AUTO_5710 ) ) ( not ( = ?AUTO_5706 ?AUTO_5709 ) ) ( not ( = ?AUTO_5707 ?AUTO_5710 ) ) ( not ( = ?AUTO_5707 ?AUTO_5709 ) ) ( not ( = ?AUTO_5708 ?AUTO_5710 ) ) ( not ( = ?AUTO_5708 ?AUTO_5709 ) ) ( not ( = ?AUTO_5710 ?AUTO_5709 ) ) ( ON ?AUTO_5710 ?AUTO_5706 ) ( CLEAR ?AUTO_5710 ) ( HOLDING ?AUTO_5707 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5707 )
      ( MAKE-ON ?AUTO_5706 ?AUTO_5707 )
      ( MAKE-ON-VERIFY ?AUTO_5706 ?AUTO_5707 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5713 - BLOCK
      ?AUTO_5714 - BLOCK
    )
    :vars
    (
      ?AUTO_5715 - BLOCK
      ?AUTO_5717 - BLOCK
      ?AUTO_5716 - BLOCK
      ?AUTO_5718 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5714 ) ( not ( = ?AUTO_5713 ?AUTO_5714 ) ) ( ON ?AUTO_5713 ?AUTO_5715 ) ( not ( = ?AUTO_5713 ?AUTO_5715 ) ) ( not ( = ?AUTO_5714 ?AUTO_5715 ) ) ( CLEAR ?AUTO_5717 ) ( not ( = ?AUTO_5713 ?AUTO_5716 ) ) ( not ( = ?AUTO_5713 ?AUTO_5717 ) ) ( not ( = ?AUTO_5714 ?AUTO_5716 ) ) ( not ( = ?AUTO_5714 ?AUTO_5717 ) ) ( not ( = ?AUTO_5715 ?AUTO_5716 ) ) ( not ( = ?AUTO_5715 ?AUTO_5717 ) ) ( not ( = ?AUTO_5716 ?AUTO_5717 ) ) ( ON ?AUTO_5716 ?AUTO_5713 ) ( CLEAR ?AUTO_5716 ) ( HOLDING ?AUTO_5718 ) ( not ( = ?AUTO_5713 ?AUTO_5718 ) ) ( not ( = ?AUTO_5714 ?AUTO_5718 ) ) ( not ( = ?AUTO_5715 ?AUTO_5718 ) ) ( not ( = ?AUTO_5717 ?AUTO_5718 ) ) ( not ( = ?AUTO_5716 ?AUTO_5718 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5718 )
      ( MAKE-ON ?AUTO_5713 ?AUTO_5714 )
      ( MAKE-ON-VERIFY ?AUTO_5713 ?AUTO_5714 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5719 - BLOCK
      ?AUTO_5720 - BLOCK
    )
    :vars
    (
      ?AUTO_5722 - BLOCK
      ?AUTO_5723 - BLOCK
      ?AUTO_5721 - BLOCK
      ?AUTO_5724 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5719 ?AUTO_5720 ) ) ( ON ?AUTO_5719 ?AUTO_5722 ) ( not ( = ?AUTO_5719 ?AUTO_5722 ) ) ( not ( = ?AUTO_5720 ?AUTO_5722 ) ) ( CLEAR ?AUTO_5723 ) ( not ( = ?AUTO_5719 ?AUTO_5721 ) ) ( not ( = ?AUTO_5719 ?AUTO_5723 ) ) ( not ( = ?AUTO_5720 ?AUTO_5721 ) ) ( not ( = ?AUTO_5720 ?AUTO_5723 ) ) ( not ( = ?AUTO_5722 ?AUTO_5721 ) ) ( not ( = ?AUTO_5722 ?AUTO_5723 ) ) ( not ( = ?AUTO_5721 ?AUTO_5723 ) ) ( ON ?AUTO_5721 ?AUTO_5719 ) ( CLEAR ?AUTO_5721 ) ( not ( = ?AUTO_5719 ?AUTO_5724 ) ) ( not ( = ?AUTO_5720 ?AUTO_5724 ) ) ( not ( = ?AUTO_5722 ?AUTO_5724 ) ) ( not ( = ?AUTO_5723 ?AUTO_5724 ) ) ( not ( = ?AUTO_5721 ?AUTO_5724 ) ) ( ON ?AUTO_5724 ?AUTO_5720 ) ( CLEAR ?AUTO_5724 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5724 ?AUTO_5720 )
      ( MAKE-ON ?AUTO_5719 ?AUTO_5720 )
      ( MAKE-ON-VERIFY ?AUTO_5719 ?AUTO_5720 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5725 - BLOCK
      ?AUTO_5726 - BLOCK
    )
    :vars
    (
      ?AUTO_5727 - BLOCK
      ?AUTO_5728 - BLOCK
      ?AUTO_5730 - BLOCK
      ?AUTO_5729 - BLOCK
      ?AUTO_5731 - BLOCK
      ?AUTO_5732 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5725 ?AUTO_5726 ) ) ( ON ?AUTO_5725 ?AUTO_5727 ) ( not ( = ?AUTO_5725 ?AUTO_5727 ) ) ( not ( = ?AUTO_5726 ?AUTO_5727 ) ) ( CLEAR ?AUTO_5728 ) ( not ( = ?AUTO_5725 ?AUTO_5730 ) ) ( not ( = ?AUTO_5725 ?AUTO_5728 ) ) ( not ( = ?AUTO_5726 ?AUTO_5730 ) ) ( not ( = ?AUTO_5726 ?AUTO_5728 ) ) ( not ( = ?AUTO_5727 ?AUTO_5730 ) ) ( not ( = ?AUTO_5727 ?AUTO_5728 ) ) ( not ( = ?AUTO_5730 ?AUTO_5728 ) ) ( ON ?AUTO_5730 ?AUTO_5725 ) ( CLEAR ?AUTO_5730 ) ( not ( = ?AUTO_5725 ?AUTO_5729 ) ) ( not ( = ?AUTO_5726 ?AUTO_5729 ) ) ( not ( = ?AUTO_5727 ?AUTO_5729 ) ) ( not ( = ?AUTO_5728 ?AUTO_5729 ) ) ( not ( = ?AUTO_5730 ?AUTO_5729 ) ) ( ON ?AUTO_5729 ?AUTO_5726 ) ( CLEAR ?AUTO_5729 ) ( HOLDING ?AUTO_5731 ) ( CLEAR ?AUTO_5732 ) ( not ( = ?AUTO_5725 ?AUTO_5731 ) ) ( not ( = ?AUTO_5725 ?AUTO_5732 ) ) ( not ( = ?AUTO_5726 ?AUTO_5731 ) ) ( not ( = ?AUTO_5726 ?AUTO_5732 ) ) ( not ( = ?AUTO_5727 ?AUTO_5731 ) ) ( not ( = ?AUTO_5727 ?AUTO_5732 ) ) ( not ( = ?AUTO_5728 ?AUTO_5731 ) ) ( not ( = ?AUTO_5728 ?AUTO_5732 ) ) ( not ( = ?AUTO_5730 ?AUTO_5731 ) ) ( not ( = ?AUTO_5730 ?AUTO_5732 ) ) ( not ( = ?AUTO_5729 ?AUTO_5731 ) ) ( not ( = ?AUTO_5729 ?AUTO_5732 ) ) ( not ( = ?AUTO_5731 ?AUTO_5732 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5731 ?AUTO_5732 )
      ( MAKE-ON ?AUTO_5725 ?AUTO_5726 )
      ( MAKE-ON-VERIFY ?AUTO_5725 ?AUTO_5726 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5737 - BLOCK
      ?AUTO_5738 - BLOCK
    )
    :vars
    (
      ?AUTO_5739 - BLOCK
      ?AUTO_5741 - BLOCK
      ?AUTO_5742 - BLOCK
      ?AUTO_5740 - BLOCK
      ?AUTO_5744 - BLOCK
      ?AUTO_5743 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5737 ?AUTO_5738 ) ) ( ON ?AUTO_5737 ?AUTO_5739 ) ( not ( = ?AUTO_5737 ?AUTO_5739 ) ) ( not ( = ?AUTO_5738 ?AUTO_5739 ) ) ( CLEAR ?AUTO_5741 ) ( not ( = ?AUTO_5737 ?AUTO_5742 ) ) ( not ( = ?AUTO_5737 ?AUTO_5741 ) ) ( not ( = ?AUTO_5738 ?AUTO_5742 ) ) ( not ( = ?AUTO_5738 ?AUTO_5741 ) ) ( not ( = ?AUTO_5739 ?AUTO_5742 ) ) ( not ( = ?AUTO_5739 ?AUTO_5741 ) ) ( not ( = ?AUTO_5742 ?AUTO_5741 ) ) ( ON ?AUTO_5742 ?AUTO_5737 ) ( CLEAR ?AUTO_5742 ) ( not ( = ?AUTO_5737 ?AUTO_5740 ) ) ( not ( = ?AUTO_5738 ?AUTO_5740 ) ) ( not ( = ?AUTO_5739 ?AUTO_5740 ) ) ( not ( = ?AUTO_5741 ?AUTO_5740 ) ) ( not ( = ?AUTO_5742 ?AUTO_5740 ) ) ( ON ?AUTO_5740 ?AUTO_5738 ) ( CLEAR ?AUTO_5744 ) ( not ( = ?AUTO_5737 ?AUTO_5743 ) ) ( not ( = ?AUTO_5737 ?AUTO_5744 ) ) ( not ( = ?AUTO_5738 ?AUTO_5743 ) ) ( not ( = ?AUTO_5738 ?AUTO_5744 ) ) ( not ( = ?AUTO_5739 ?AUTO_5743 ) ) ( not ( = ?AUTO_5739 ?AUTO_5744 ) ) ( not ( = ?AUTO_5741 ?AUTO_5743 ) ) ( not ( = ?AUTO_5741 ?AUTO_5744 ) ) ( not ( = ?AUTO_5742 ?AUTO_5743 ) ) ( not ( = ?AUTO_5742 ?AUTO_5744 ) ) ( not ( = ?AUTO_5740 ?AUTO_5743 ) ) ( not ( = ?AUTO_5740 ?AUTO_5744 ) ) ( not ( = ?AUTO_5743 ?AUTO_5744 ) ) ( ON ?AUTO_5743 ?AUTO_5740 ) ( CLEAR ?AUTO_5743 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5743 ?AUTO_5740 )
      ( MAKE-ON ?AUTO_5737 ?AUTO_5738 )
      ( MAKE-ON-VERIFY ?AUTO_5737 ?AUTO_5738 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5745 - BLOCK
      ?AUTO_5746 - BLOCK
    )
    :vars
    (
      ?AUTO_5747 - BLOCK
      ?AUTO_5750 - BLOCK
      ?AUTO_5752 - BLOCK
      ?AUTO_5748 - BLOCK
      ?AUTO_5751 - BLOCK
      ?AUTO_5749 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5745 ?AUTO_5746 ) ) ( ON ?AUTO_5745 ?AUTO_5747 ) ( not ( = ?AUTO_5745 ?AUTO_5747 ) ) ( not ( = ?AUTO_5746 ?AUTO_5747 ) ) ( CLEAR ?AUTO_5750 ) ( not ( = ?AUTO_5745 ?AUTO_5752 ) ) ( not ( = ?AUTO_5745 ?AUTO_5750 ) ) ( not ( = ?AUTO_5746 ?AUTO_5752 ) ) ( not ( = ?AUTO_5746 ?AUTO_5750 ) ) ( not ( = ?AUTO_5747 ?AUTO_5752 ) ) ( not ( = ?AUTO_5747 ?AUTO_5750 ) ) ( not ( = ?AUTO_5752 ?AUTO_5750 ) ) ( ON ?AUTO_5752 ?AUTO_5745 ) ( CLEAR ?AUTO_5752 ) ( not ( = ?AUTO_5745 ?AUTO_5748 ) ) ( not ( = ?AUTO_5746 ?AUTO_5748 ) ) ( not ( = ?AUTO_5747 ?AUTO_5748 ) ) ( not ( = ?AUTO_5750 ?AUTO_5748 ) ) ( not ( = ?AUTO_5752 ?AUTO_5748 ) ) ( ON ?AUTO_5748 ?AUTO_5746 ) ( not ( = ?AUTO_5745 ?AUTO_5751 ) ) ( not ( = ?AUTO_5745 ?AUTO_5749 ) ) ( not ( = ?AUTO_5746 ?AUTO_5751 ) ) ( not ( = ?AUTO_5746 ?AUTO_5749 ) ) ( not ( = ?AUTO_5747 ?AUTO_5751 ) ) ( not ( = ?AUTO_5747 ?AUTO_5749 ) ) ( not ( = ?AUTO_5750 ?AUTO_5751 ) ) ( not ( = ?AUTO_5750 ?AUTO_5749 ) ) ( not ( = ?AUTO_5752 ?AUTO_5751 ) ) ( not ( = ?AUTO_5752 ?AUTO_5749 ) ) ( not ( = ?AUTO_5748 ?AUTO_5751 ) ) ( not ( = ?AUTO_5748 ?AUTO_5749 ) ) ( not ( = ?AUTO_5751 ?AUTO_5749 ) ) ( ON ?AUTO_5751 ?AUTO_5748 ) ( CLEAR ?AUTO_5751 ) ( HOLDING ?AUTO_5749 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5749 )
      ( MAKE-ON ?AUTO_5745 ?AUTO_5746 )
      ( MAKE-ON-VERIFY ?AUTO_5745 ?AUTO_5746 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5753 - BLOCK
      ?AUTO_5754 - BLOCK
    )
    :vars
    (
      ?AUTO_5759 - BLOCK
      ?AUTO_5757 - BLOCK
      ?AUTO_5756 - BLOCK
      ?AUTO_5755 - BLOCK
      ?AUTO_5760 - BLOCK
      ?AUTO_5758 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5753 ?AUTO_5754 ) ) ( ON ?AUTO_5753 ?AUTO_5759 ) ( not ( = ?AUTO_5753 ?AUTO_5759 ) ) ( not ( = ?AUTO_5754 ?AUTO_5759 ) ) ( CLEAR ?AUTO_5757 ) ( not ( = ?AUTO_5753 ?AUTO_5756 ) ) ( not ( = ?AUTO_5753 ?AUTO_5757 ) ) ( not ( = ?AUTO_5754 ?AUTO_5756 ) ) ( not ( = ?AUTO_5754 ?AUTO_5757 ) ) ( not ( = ?AUTO_5759 ?AUTO_5756 ) ) ( not ( = ?AUTO_5759 ?AUTO_5757 ) ) ( not ( = ?AUTO_5756 ?AUTO_5757 ) ) ( ON ?AUTO_5756 ?AUTO_5753 ) ( CLEAR ?AUTO_5756 ) ( not ( = ?AUTO_5753 ?AUTO_5755 ) ) ( not ( = ?AUTO_5754 ?AUTO_5755 ) ) ( not ( = ?AUTO_5759 ?AUTO_5755 ) ) ( not ( = ?AUTO_5757 ?AUTO_5755 ) ) ( not ( = ?AUTO_5756 ?AUTO_5755 ) ) ( ON ?AUTO_5755 ?AUTO_5754 ) ( not ( = ?AUTO_5753 ?AUTO_5760 ) ) ( not ( = ?AUTO_5753 ?AUTO_5758 ) ) ( not ( = ?AUTO_5754 ?AUTO_5760 ) ) ( not ( = ?AUTO_5754 ?AUTO_5758 ) ) ( not ( = ?AUTO_5759 ?AUTO_5760 ) ) ( not ( = ?AUTO_5759 ?AUTO_5758 ) ) ( not ( = ?AUTO_5757 ?AUTO_5760 ) ) ( not ( = ?AUTO_5757 ?AUTO_5758 ) ) ( not ( = ?AUTO_5756 ?AUTO_5760 ) ) ( not ( = ?AUTO_5756 ?AUTO_5758 ) ) ( not ( = ?AUTO_5755 ?AUTO_5760 ) ) ( not ( = ?AUTO_5755 ?AUTO_5758 ) ) ( not ( = ?AUTO_5760 ?AUTO_5758 ) ) ( ON ?AUTO_5760 ?AUTO_5755 ) ( ON ?AUTO_5758 ?AUTO_5760 ) ( CLEAR ?AUTO_5758 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5758 ?AUTO_5760 )
      ( MAKE-ON ?AUTO_5753 ?AUTO_5754 )
      ( MAKE-ON-VERIFY ?AUTO_5753 ?AUTO_5754 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5761 - BLOCK
      ?AUTO_5762 - BLOCK
    )
    :vars
    (
      ?AUTO_5766 - BLOCK
      ?AUTO_5767 - BLOCK
      ?AUTO_5765 - BLOCK
      ?AUTO_5768 - BLOCK
      ?AUTO_5763 - BLOCK
      ?AUTO_5764 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5761 ?AUTO_5762 ) ) ( ON ?AUTO_5761 ?AUTO_5766 ) ( not ( = ?AUTO_5761 ?AUTO_5766 ) ) ( not ( = ?AUTO_5762 ?AUTO_5766 ) ) ( not ( = ?AUTO_5761 ?AUTO_5767 ) ) ( not ( = ?AUTO_5761 ?AUTO_5765 ) ) ( not ( = ?AUTO_5762 ?AUTO_5767 ) ) ( not ( = ?AUTO_5762 ?AUTO_5765 ) ) ( not ( = ?AUTO_5766 ?AUTO_5767 ) ) ( not ( = ?AUTO_5766 ?AUTO_5765 ) ) ( not ( = ?AUTO_5767 ?AUTO_5765 ) ) ( ON ?AUTO_5767 ?AUTO_5761 ) ( CLEAR ?AUTO_5767 ) ( not ( = ?AUTO_5761 ?AUTO_5768 ) ) ( not ( = ?AUTO_5762 ?AUTO_5768 ) ) ( not ( = ?AUTO_5766 ?AUTO_5768 ) ) ( not ( = ?AUTO_5765 ?AUTO_5768 ) ) ( not ( = ?AUTO_5767 ?AUTO_5768 ) ) ( ON ?AUTO_5768 ?AUTO_5762 ) ( not ( = ?AUTO_5761 ?AUTO_5763 ) ) ( not ( = ?AUTO_5761 ?AUTO_5764 ) ) ( not ( = ?AUTO_5762 ?AUTO_5763 ) ) ( not ( = ?AUTO_5762 ?AUTO_5764 ) ) ( not ( = ?AUTO_5766 ?AUTO_5763 ) ) ( not ( = ?AUTO_5766 ?AUTO_5764 ) ) ( not ( = ?AUTO_5765 ?AUTO_5763 ) ) ( not ( = ?AUTO_5765 ?AUTO_5764 ) ) ( not ( = ?AUTO_5767 ?AUTO_5763 ) ) ( not ( = ?AUTO_5767 ?AUTO_5764 ) ) ( not ( = ?AUTO_5768 ?AUTO_5763 ) ) ( not ( = ?AUTO_5768 ?AUTO_5764 ) ) ( not ( = ?AUTO_5763 ?AUTO_5764 ) ) ( ON ?AUTO_5763 ?AUTO_5768 ) ( ON ?AUTO_5764 ?AUTO_5763 ) ( CLEAR ?AUTO_5764 ) ( HOLDING ?AUTO_5765 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5765 )
      ( MAKE-ON ?AUTO_5761 ?AUTO_5762 )
      ( MAKE-ON-VERIFY ?AUTO_5761 ?AUTO_5762 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5769 - BLOCK
      ?AUTO_5770 - BLOCK
    )
    :vars
    (
      ?AUTO_5774 - BLOCK
      ?AUTO_5773 - BLOCK
      ?AUTO_5775 - BLOCK
      ?AUTO_5776 - BLOCK
      ?AUTO_5771 - BLOCK
      ?AUTO_5772 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5769 ?AUTO_5770 ) ) ( ON ?AUTO_5769 ?AUTO_5774 ) ( not ( = ?AUTO_5769 ?AUTO_5774 ) ) ( not ( = ?AUTO_5770 ?AUTO_5774 ) ) ( not ( = ?AUTO_5769 ?AUTO_5773 ) ) ( not ( = ?AUTO_5769 ?AUTO_5775 ) ) ( not ( = ?AUTO_5770 ?AUTO_5773 ) ) ( not ( = ?AUTO_5770 ?AUTO_5775 ) ) ( not ( = ?AUTO_5774 ?AUTO_5773 ) ) ( not ( = ?AUTO_5774 ?AUTO_5775 ) ) ( not ( = ?AUTO_5773 ?AUTO_5775 ) ) ( ON ?AUTO_5773 ?AUTO_5769 ) ( not ( = ?AUTO_5769 ?AUTO_5776 ) ) ( not ( = ?AUTO_5770 ?AUTO_5776 ) ) ( not ( = ?AUTO_5774 ?AUTO_5776 ) ) ( not ( = ?AUTO_5775 ?AUTO_5776 ) ) ( not ( = ?AUTO_5773 ?AUTO_5776 ) ) ( ON ?AUTO_5776 ?AUTO_5770 ) ( not ( = ?AUTO_5769 ?AUTO_5771 ) ) ( not ( = ?AUTO_5769 ?AUTO_5772 ) ) ( not ( = ?AUTO_5770 ?AUTO_5771 ) ) ( not ( = ?AUTO_5770 ?AUTO_5772 ) ) ( not ( = ?AUTO_5774 ?AUTO_5771 ) ) ( not ( = ?AUTO_5774 ?AUTO_5772 ) ) ( not ( = ?AUTO_5775 ?AUTO_5771 ) ) ( not ( = ?AUTO_5775 ?AUTO_5772 ) ) ( not ( = ?AUTO_5773 ?AUTO_5771 ) ) ( not ( = ?AUTO_5773 ?AUTO_5772 ) ) ( not ( = ?AUTO_5776 ?AUTO_5771 ) ) ( not ( = ?AUTO_5776 ?AUTO_5772 ) ) ( not ( = ?AUTO_5771 ?AUTO_5772 ) ) ( ON ?AUTO_5771 ?AUTO_5776 ) ( ON ?AUTO_5772 ?AUTO_5771 ) ( CLEAR ?AUTO_5772 ) ( ON ?AUTO_5775 ?AUTO_5773 ) ( CLEAR ?AUTO_5775 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5775 ?AUTO_5773 )
      ( MAKE-ON ?AUTO_5769 ?AUTO_5770 )
      ( MAKE-ON-VERIFY ?AUTO_5769 ?AUTO_5770 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5779 - BLOCK
      ?AUTO_5780 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5779 ) ( CLEAR ?AUTO_5780 ) ( not ( = ?AUTO_5779 ?AUTO_5780 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5779 ?AUTO_5780 )
      ( MAKE-ON-VERIFY ?AUTO_5779 ?AUTO_5780 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5781 - BLOCK
      ?AUTO_5782 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5782 ) ( not ( = ?AUTO_5781 ?AUTO_5782 ) ) ( ON-TABLE ?AUTO_5781 ) ( CLEAR ?AUTO_5781 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_5781 )
      ( MAKE-ON ?AUTO_5781 ?AUTO_5782 )
      ( MAKE-ON-VERIFY ?AUTO_5781 ?AUTO_5782 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5783 - BLOCK
      ?AUTO_5784 - BLOCK
    )
    :vars
    (
      ?AUTO_5785 - BLOCK
      ?AUTO_5786 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5784 ) ( not ( = ?AUTO_5783 ?AUTO_5784 ) ) ( ON-TABLE ?AUTO_5783 ) ( CLEAR ?AUTO_5783 ) ( HOLDING ?AUTO_5785 ) ( CLEAR ?AUTO_5786 ) ( not ( = ?AUTO_5783 ?AUTO_5785 ) ) ( not ( = ?AUTO_5783 ?AUTO_5786 ) ) ( not ( = ?AUTO_5784 ?AUTO_5785 ) ) ( not ( = ?AUTO_5784 ?AUTO_5786 ) ) ( not ( = ?AUTO_5785 ?AUTO_5786 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5785 ?AUTO_5786 )
      ( MAKE-ON ?AUTO_5783 ?AUTO_5784 )
      ( MAKE-ON-VERIFY ?AUTO_5783 ?AUTO_5784 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5787 - BLOCK
      ?AUTO_5788 - BLOCK
    )
    :vars
    (
      ?AUTO_5789 - BLOCK
      ?AUTO_5790 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5788 ) ( not ( = ?AUTO_5787 ?AUTO_5788 ) ) ( ON-TABLE ?AUTO_5787 ) ( CLEAR ?AUTO_5789 ) ( not ( = ?AUTO_5787 ?AUTO_5790 ) ) ( not ( = ?AUTO_5787 ?AUTO_5789 ) ) ( not ( = ?AUTO_5788 ?AUTO_5790 ) ) ( not ( = ?AUTO_5788 ?AUTO_5789 ) ) ( not ( = ?AUTO_5790 ?AUTO_5789 ) ) ( ON ?AUTO_5790 ?AUTO_5787 ) ( CLEAR ?AUTO_5790 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5790 ?AUTO_5787 )
      ( MAKE-ON ?AUTO_5787 ?AUTO_5788 )
      ( MAKE-ON-VERIFY ?AUTO_5787 ?AUTO_5788 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5791 - BLOCK
      ?AUTO_5792 - BLOCK
    )
    :vars
    (
      ?AUTO_5793 - BLOCK
      ?AUTO_5794 - BLOCK
      ?AUTO_5795 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5792 ) ( not ( = ?AUTO_5791 ?AUTO_5792 ) ) ( ON-TABLE ?AUTO_5791 ) ( not ( = ?AUTO_5791 ?AUTO_5793 ) ) ( not ( = ?AUTO_5791 ?AUTO_5794 ) ) ( not ( = ?AUTO_5792 ?AUTO_5793 ) ) ( not ( = ?AUTO_5792 ?AUTO_5794 ) ) ( not ( = ?AUTO_5793 ?AUTO_5794 ) ) ( ON ?AUTO_5793 ?AUTO_5791 ) ( CLEAR ?AUTO_5793 ) ( HOLDING ?AUTO_5794 ) ( CLEAR ?AUTO_5795 ) ( not ( = ?AUTO_5791 ?AUTO_5795 ) ) ( not ( = ?AUTO_5792 ?AUTO_5795 ) ) ( not ( = ?AUTO_5793 ?AUTO_5795 ) ) ( not ( = ?AUTO_5794 ?AUTO_5795 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5794 ?AUTO_5795 )
      ( MAKE-ON ?AUTO_5791 ?AUTO_5792 )
      ( MAKE-ON-VERIFY ?AUTO_5791 ?AUTO_5792 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5800 - BLOCK
      ?AUTO_5801 - BLOCK
    )
    :vars
    (
      ?AUTO_5804 - BLOCK
      ?AUTO_5803 - BLOCK
      ?AUTO_5802 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5801 ) ( not ( = ?AUTO_5800 ?AUTO_5801 ) ) ( ON-TABLE ?AUTO_5800 ) ( not ( = ?AUTO_5800 ?AUTO_5804 ) ) ( not ( = ?AUTO_5800 ?AUTO_5803 ) ) ( not ( = ?AUTO_5801 ?AUTO_5804 ) ) ( not ( = ?AUTO_5801 ?AUTO_5803 ) ) ( not ( = ?AUTO_5804 ?AUTO_5803 ) ) ( ON ?AUTO_5804 ?AUTO_5800 ) ( CLEAR ?AUTO_5802 ) ( not ( = ?AUTO_5800 ?AUTO_5802 ) ) ( not ( = ?AUTO_5801 ?AUTO_5802 ) ) ( not ( = ?AUTO_5804 ?AUTO_5802 ) ) ( not ( = ?AUTO_5803 ?AUTO_5802 ) ) ( ON ?AUTO_5803 ?AUTO_5804 ) ( CLEAR ?AUTO_5803 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5803 ?AUTO_5804 )
      ( MAKE-ON ?AUTO_5800 ?AUTO_5801 )
      ( MAKE-ON-VERIFY ?AUTO_5800 ?AUTO_5801 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5805 - BLOCK
      ?AUTO_5806 - BLOCK
    )
    :vars
    (
      ?AUTO_5809 - BLOCK
      ?AUTO_5808 - BLOCK
      ?AUTO_5807 - BLOCK
      ?AUTO_5810 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5806 ) ( not ( = ?AUTO_5805 ?AUTO_5806 ) ) ( ON-TABLE ?AUTO_5805 ) ( not ( = ?AUTO_5805 ?AUTO_5809 ) ) ( not ( = ?AUTO_5805 ?AUTO_5808 ) ) ( not ( = ?AUTO_5806 ?AUTO_5809 ) ) ( not ( = ?AUTO_5806 ?AUTO_5808 ) ) ( not ( = ?AUTO_5809 ?AUTO_5808 ) ) ( ON ?AUTO_5809 ?AUTO_5805 ) ( CLEAR ?AUTO_5807 ) ( not ( = ?AUTO_5805 ?AUTO_5807 ) ) ( not ( = ?AUTO_5806 ?AUTO_5807 ) ) ( not ( = ?AUTO_5809 ?AUTO_5807 ) ) ( not ( = ?AUTO_5808 ?AUTO_5807 ) ) ( ON ?AUTO_5808 ?AUTO_5809 ) ( CLEAR ?AUTO_5808 ) ( HOLDING ?AUTO_5810 ) ( not ( = ?AUTO_5805 ?AUTO_5810 ) ) ( not ( = ?AUTO_5806 ?AUTO_5810 ) ) ( not ( = ?AUTO_5809 ?AUTO_5810 ) ) ( not ( = ?AUTO_5808 ?AUTO_5810 ) ) ( not ( = ?AUTO_5807 ?AUTO_5810 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5810 )
      ( MAKE-ON ?AUTO_5805 ?AUTO_5806 )
      ( MAKE-ON-VERIFY ?AUTO_5805 ?AUTO_5806 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5817 - BLOCK
      ?AUTO_5818 - BLOCK
    )
    :vars
    (
      ?AUTO_5821 - BLOCK
      ?AUTO_5819 - BLOCK
      ?AUTO_5820 - BLOCK
      ?AUTO_5822 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5817 ?AUTO_5818 ) ) ( ON-TABLE ?AUTO_5817 ) ( not ( = ?AUTO_5817 ?AUTO_5821 ) ) ( not ( = ?AUTO_5817 ?AUTO_5819 ) ) ( not ( = ?AUTO_5818 ?AUTO_5821 ) ) ( not ( = ?AUTO_5818 ?AUTO_5819 ) ) ( not ( = ?AUTO_5821 ?AUTO_5819 ) ) ( ON ?AUTO_5821 ?AUTO_5817 ) ( CLEAR ?AUTO_5820 ) ( not ( = ?AUTO_5817 ?AUTO_5820 ) ) ( not ( = ?AUTO_5818 ?AUTO_5820 ) ) ( not ( = ?AUTO_5821 ?AUTO_5820 ) ) ( not ( = ?AUTO_5819 ?AUTO_5820 ) ) ( ON ?AUTO_5819 ?AUTO_5821 ) ( CLEAR ?AUTO_5819 ) ( HOLDING ?AUTO_5818 ) ( CLEAR ?AUTO_5822 ) ( not ( = ?AUTO_5817 ?AUTO_5822 ) ) ( not ( = ?AUTO_5818 ?AUTO_5822 ) ) ( not ( = ?AUTO_5821 ?AUTO_5822 ) ) ( not ( = ?AUTO_5819 ?AUTO_5822 ) ) ( not ( = ?AUTO_5820 ?AUTO_5822 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5818 ?AUTO_5822 )
      ( MAKE-ON ?AUTO_5817 ?AUTO_5818 )
      ( MAKE-ON-VERIFY ?AUTO_5817 ?AUTO_5818 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5833 - BLOCK
      ?AUTO_5834 - BLOCK
    )
    :vars
    (
      ?AUTO_5835 - BLOCK
      ?AUTO_5837 - BLOCK
      ?AUTO_5836 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5834 ) ( not ( = ?AUTO_5833 ?AUTO_5834 ) ) ( ON-TABLE ?AUTO_5833 ) ( not ( = ?AUTO_5833 ?AUTO_5835 ) ) ( not ( = ?AUTO_5833 ?AUTO_5837 ) ) ( not ( = ?AUTO_5834 ?AUTO_5835 ) ) ( not ( = ?AUTO_5834 ?AUTO_5837 ) ) ( not ( = ?AUTO_5835 ?AUTO_5837 ) ) ( ON ?AUTO_5835 ?AUTO_5833 ) ( not ( = ?AUTO_5833 ?AUTO_5836 ) ) ( not ( = ?AUTO_5834 ?AUTO_5836 ) ) ( not ( = ?AUTO_5835 ?AUTO_5836 ) ) ( not ( = ?AUTO_5837 ?AUTO_5836 ) ) ( ON ?AUTO_5837 ?AUTO_5835 ) ( CLEAR ?AUTO_5837 ) ( HOLDING ?AUTO_5836 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5836 )
      ( MAKE-ON ?AUTO_5833 ?AUTO_5834 )
      ( MAKE-ON-VERIFY ?AUTO_5833 ?AUTO_5834 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5838 - BLOCK
      ?AUTO_5839 - BLOCK
    )
    :vars
    (
      ?AUTO_5840 - BLOCK
      ?AUTO_5842 - BLOCK
      ?AUTO_5841 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5839 ) ( not ( = ?AUTO_5838 ?AUTO_5839 ) ) ( ON-TABLE ?AUTO_5838 ) ( not ( = ?AUTO_5838 ?AUTO_5840 ) ) ( not ( = ?AUTO_5838 ?AUTO_5842 ) ) ( not ( = ?AUTO_5839 ?AUTO_5840 ) ) ( not ( = ?AUTO_5839 ?AUTO_5842 ) ) ( not ( = ?AUTO_5840 ?AUTO_5842 ) ) ( ON ?AUTO_5840 ?AUTO_5838 ) ( not ( = ?AUTO_5838 ?AUTO_5841 ) ) ( not ( = ?AUTO_5839 ?AUTO_5841 ) ) ( not ( = ?AUTO_5840 ?AUTO_5841 ) ) ( not ( = ?AUTO_5842 ?AUTO_5841 ) ) ( ON ?AUTO_5842 ?AUTO_5840 ) ( ON ?AUTO_5841 ?AUTO_5842 ) ( CLEAR ?AUTO_5841 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5841 ?AUTO_5842 )
      ( MAKE-ON ?AUTO_5838 ?AUTO_5839 )
      ( MAKE-ON-VERIFY ?AUTO_5838 ?AUTO_5839 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5845 - BLOCK
      ?AUTO_5846 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5845 ) ( CLEAR ?AUTO_5846 ) ( not ( = ?AUTO_5845 ?AUTO_5846 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5845 ?AUTO_5846 )
      ( MAKE-ON-VERIFY ?AUTO_5845 ?AUTO_5846 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5847 - BLOCK
      ?AUTO_5848 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5848 ) ( not ( = ?AUTO_5847 ?AUTO_5848 ) ) ( ON-TABLE ?AUTO_5847 ) ( CLEAR ?AUTO_5847 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_5847 )
      ( MAKE-ON ?AUTO_5847 ?AUTO_5848 )
      ( MAKE-ON-VERIFY ?AUTO_5847 ?AUTO_5848 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5849 - BLOCK
      ?AUTO_5850 - BLOCK
    )
    :vars
    (
      ?AUTO_5851 - BLOCK
      ?AUTO_5852 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5850 ) ( not ( = ?AUTO_5849 ?AUTO_5850 ) ) ( ON-TABLE ?AUTO_5849 ) ( CLEAR ?AUTO_5849 ) ( HOLDING ?AUTO_5851 ) ( CLEAR ?AUTO_5852 ) ( not ( = ?AUTO_5849 ?AUTO_5851 ) ) ( not ( = ?AUTO_5849 ?AUTO_5852 ) ) ( not ( = ?AUTO_5850 ?AUTO_5851 ) ) ( not ( = ?AUTO_5850 ?AUTO_5852 ) ) ( not ( = ?AUTO_5851 ?AUTO_5852 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5851 ?AUTO_5852 )
      ( MAKE-ON ?AUTO_5849 ?AUTO_5850 )
      ( MAKE-ON-VERIFY ?AUTO_5849 ?AUTO_5850 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5855 - BLOCK
      ?AUTO_5856 - BLOCK
    )
    :vars
    (
      ?AUTO_5857 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5855 ?AUTO_5856 ) ) ( ON-TABLE ?AUTO_5855 ) ( CLEAR ?AUTO_5855 ) ( HOLDING ?AUTO_5856 ) ( CLEAR ?AUTO_5857 ) ( not ( = ?AUTO_5855 ?AUTO_5857 ) ) ( not ( = ?AUTO_5856 ?AUTO_5857 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5856 ?AUTO_5857 )
      ( MAKE-ON ?AUTO_5855 ?AUTO_5856 )
      ( MAKE-ON-VERIFY ?AUTO_5855 ?AUTO_5856 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5866 - BLOCK
      ?AUTO_5867 - BLOCK
    )
    :vars
    (
      ?AUTO_5868 - BLOCK
      ?AUTO_5869 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5866 ?AUTO_5867 ) ) ( ON-TABLE ?AUTO_5866 ) ( CLEAR ?AUTO_5866 ) ( CLEAR ?AUTO_5868 ) ( not ( = ?AUTO_5866 ?AUTO_5869 ) ) ( not ( = ?AUTO_5866 ?AUTO_5868 ) ) ( not ( = ?AUTO_5867 ?AUTO_5869 ) ) ( not ( = ?AUTO_5867 ?AUTO_5868 ) ) ( not ( = ?AUTO_5869 ?AUTO_5868 ) ) ( ON ?AUTO_5869 ?AUTO_5867 ) ( CLEAR ?AUTO_5869 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5869 ?AUTO_5867 )
      ( MAKE-ON ?AUTO_5866 ?AUTO_5867 )
      ( MAKE-ON-VERIFY ?AUTO_5866 ?AUTO_5867 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5870 - BLOCK
      ?AUTO_5871 - BLOCK
    )
    :vars
    (
      ?AUTO_5872 - BLOCK
      ?AUTO_5873 - BLOCK
      ?AUTO_5874 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5870 ?AUTO_5871 ) ) ( ON-TABLE ?AUTO_5870 ) ( CLEAR ?AUTO_5870 ) ( CLEAR ?AUTO_5872 ) ( not ( = ?AUTO_5870 ?AUTO_5873 ) ) ( not ( = ?AUTO_5870 ?AUTO_5872 ) ) ( not ( = ?AUTO_5871 ?AUTO_5873 ) ) ( not ( = ?AUTO_5871 ?AUTO_5872 ) ) ( not ( = ?AUTO_5873 ?AUTO_5872 ) ) ( ON ?AUTO_5873 ?AUTO_5871 ) ( CLEAR ?AUTO_5873 ) ( HOLDING ?AUTO_5874 ) ( not ( = ?AUTO_5870 ?AUTO_5874 ) ) ( not ( = ?AUTO_5871 ?AUTO_5874 ) ) ( not ( = ?AUTO_5872 ?AUTO_5874 ) ) ( not ( = ?AUTO_5873 ?AUTO_5874 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5874 )
      ( MAKE-ON ?AUTO_5870 ?AUTO_5871 )
      ( MAKE-ON-VERIFY ?AUTO_5870 ?AUTO_5871 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5877 - BLOCK
      ?AUTO_5878 - BLOCK
    )
    :vars
    (
      ?AUTO_5879 - BLOCK
      ?AUTO_5880 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5877 ?AUTO_5878 ) ) ( CLEAR ?AUTO_5879 ) ( not ( = ?AUTO_5877 ?AUTO_5880 ) ) ( not ( = ?AUTO_5877 ?AUTO_5879 ) ) ( not ( = ?AUTO_5878 ?AUTO_5880 ) ) ( not ( = ?AUTO_5878 ?AUTO_5879 ) ) ( not ( = ?AUTO_5880 ?AUTO_5879 ) ) ( ON ?AUTO_5880 ?AUTO_5878 ) ( CLEAR ?AUTO_5880 ) ( HOLDING ?AUTO_5877 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5877 )
      ( MAKE-ON ?AUTO_5877 ?AUTO_5878 )
      ( MAKE-ON-VERIFY ?AUTO_5877 ?AUTO_5878 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5891 - BLOCK
      ?AUTO_5892 - BLOCK
    )
    :vars
    (
      ?AUTO_5893 - BLOCK
      ?AUTO_5895 - BLOCK
      ?AUTO_5894 - BLOCK
      ?AUTO_5896 - BLOCK
      ?AUTO_5897 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5891 ?AUTO_5892 ) ) ( ON ?AUTO_5891 ?AUTO_5893 ) ( not ( = ?AUTO_5891 ?AUTO_5893 ) ) ( not ( = ?AUTO_5892 ?AUTO_5893 ) ) ( CLEAR ?AUTO_5895 ) ( not ( = ?AUTO_5891 ?AUTO_5894 ) ) ( not ( = ?AUTO_5891 ?AUTO_5895 ) ) ( not ( = ?AUTO_5892 ?AUTO_5894 ) ) ( not ( = ?AUTO_5892 ?AUTO_5895 ) ) ( not ( = ?AUTO_5893 ?AUTO_5894 ) ) ( not ( = ?AUTO_5893 ?AUTO_5895 ) ) ( not ( = ?AUTO_5894 ?AUTO_5895 ) ) ( ON ?AUTO_5894 ?AUTO_5891 ) ( CLEAR ?AUTO_5894 ) ( not ( = ?AUTO_5891 ?AUTO_5896 ) ) ( not ( = ?AUTO_5892 ?AUTO_5896 ) ) ( not ( = ?AUTO_5893 ?AUTO_5896 ) ) ( not ( = ?AUTO_5895 ?AUTO_5896 ) ) ( not ( = ?AUTO_5894 ?AUTO_5896 ) ) ( ON ?AUTO_5896 ?AUTO_5892 ) ( CLEAR ?AUTO_5896 ) ( HOLDING ?AUTO_5897 ) ( not ( = ?AUTO_5891 ?AUTO_5897 ) ) ( not ( = ?AUTO_5892 ?AUTO_5897 ) ) ( not ( = ?AUTO_5893 ?AUTO_5897 ) ) ( not ( = ?AUTO_5895 ?AUTO_5897 ) ) ( not ( = ?AUTO_5894 ?AUTO_5897 ) ) ( not ( = ?AUTO_5896 ?AUTO_5897 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5897 )
      ( MAKE-ON ?AUTO_5891 ?AUTO_5892 )
      ( MAKE-ON-VERIFY ?AUTO_5891 ?AUTO_5892 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5898 - BLOCK
      ?AUTO_5899 - BLOCK
    )
    :vars
    (
      ?AUTO_5904 - BLOCK
      ?AUTO_5901 - BLOCK
      ?AUTO_5903 - BLOCK
      ?AUTO_5900 - BLOCK
      ?AUTO_5902 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5898 ?AUTO_5899 ) ) ( ON ?AUTO_5898 ?AUTO_5904 ) ( not ( = ?AUTO_5898 ?AUTO_5904 ) ) ( not ( = ?AUTO_5899 ?AUTO_5904 ) ) ( CLEAR ?AUTO_5901 ) ( not ( = ?AUTO_5898 ?AUTO_5903 ) ) ( not ( = ?AUTO_5898 ?AUTO_5901 ) ) ( not ( = ?AUTO_5899 ?AUTO_5903 ) ) ( not ( = ?AUTO_5899 ?AUTO_5901 ) ) ( not ( = ?AUTO_5904 ?AUTO_5903 ) ) ( not ( = ?AUTO_5904 ?AUTO_5901 ) ) ( not ( = ?AUTO_5903 ?AUTO_5901 ) ) ( ON ?AUTO_5903 ?AUTO_5898 ) ( not ( = ?AUTO_5898 ?AUTO_5900 ) ) ( not ( = ?AUTO_5899 ?AUTO_5900 ) ) ( not ( = ?AUTO_5904 ?AUTO_5900 ) ) ( not ( = ?AUTO_5901 ?AUTO_5900 ) ) ( not ( = ?AUTO_5903 ?AUTO_5900 ) ) ( ON ?AUTO_5900 ?AUTO_5899 ) ( CLEAR ?AUTO_5900 ) ( not ( = ?AUTO_5898 ?AUTO_5902 ) ) ( not ( = ?AUTO_5899 ?AUTO_5902 ) ) ( not ( = ?AUTO_5904 ?AUTO_5902 ) ) ( not ( = ?AUTO_5901 ?AUTO_5902 ) ) ( not ( = ?AUTO_5903 ?AUTO_5902 ) ) ( not ( = ?AUTO_5900 ?AUTO_5902 ) ) ( ON ?AUTO_5902 ?AUTO_5903 ) ( CLEAR ?AUTO_5902 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5902 ?AUTO_5903 )
      ( MAKE-ON ?AUTO_5898 ?AUTO_5899 )
      ( MAKE-ON-VERIFY ?AUTO_5898 ?AUTO_5899 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5905 - BLOCK
      ?AUTO_5906 - BLOCK
    )
    :vars
    (
      ?AUTO_5909 - BLOCK
      ?AUTO_5910 - BLOCK
      ?AUTO_5908 - BLOCK
      ?AUTO_5907 - BLOCK
      ?AUTO_5911 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5905 ?AUTO_5906 ) ) ( ON ?AUTO_5905 ?AUTO_5909 ) ( not ( = ?AUTO_5905 ?AUTO_5909 ) ) ( not ( = ?AUTO_5906 ?AUTO_5909 ) ) ( not ( = ?AUTO_5905 ?AUTO_5910 ) ) ( not ( = ?AUTO_5905 ?AUTO_5908 ) ) ( not ( = ?AUTO_5906 ?AUTO_5910 ) ) ( not ( = ?AUTO_5906 ?AUTO_5908 ) ) ( not ( = ?AUTO_5909 ?AUTO_5910 ) ) ( not ( = ?AUTO_5909 ?AUTO_5908 ) ) ( not ( = ?AUTO_5910 ?AUTO_5908 ) ) ( ON ?AUTO_5910 ?AUTO_5905 ) ( not ( = ?AUTO_5905 ?AUTO_5907 ) ) ( not ( = ?AUTO_5906 ?AUTO_5907 ) ) ( not ( = ?AUTO_5909 ?AUTO_5907 ) ) ( not ( = ?AUTO_5908 ?AUTO_5907 ) ) ( not ( = ?AUTO_5910 ?AUTO_5907 ) ) ( ON ?AUTO_5907 ?AUTO_5906 ) ( CLEAR ?AUTO_5907 ) ( not ( = ?AUTO_5905 ?AUTO_5911 ) ) ( not ( = ?AUTO_5906 ?AUTO_5911 ) ) ( not ( = ?AUTO_5909 ?AUTO_5911 ) ) ( not ( = ?AUTO_5908 ?AUTO_5911 ) ) ( not ( = ?AUTO_5910 ?AUTO_5911 ) ) ( not ( = ?AUTO_5907 ?AUTO_5911 ) ) ( ON ?AUTO_5911 ?AUTO_5910 ) ( CLEAR ?AUTO_5911 ) ( HOLDING ?AUTO_5908 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5908 )
      ( MAKE-ON ?AUTO_5905 ?AUTO_5906 )
      ( MAKE-ON-VERIFY ?AUTO_5905 ?AUTO_5906 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5912 - BLOCK
      ?AUTO_5913 - BLOCK
    )
    :vars
    (
      ?AUTO_5918 - BLOCK
      ?AUTO_5917 - BLOCK
      ?AUTO_5914 - BLOCK
      ?AUTO_5915 - BLOCK
      ?AUTO_5916 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5912 ?AUTO_5913 ) ) ( ON ?AUTO_5912 ?AUTO_5918 ) ( not ( = ?AUTO_5912 ?AUTO_5918 ) ) ( not ( = ?AUTO_5913 ?AUTO_5918 ) ) ( not ( = ?AUTO_5912 ?AUTO_5917 ) ) ( not ( = ?AUTO_5912 ?AUTO_5914 ) ) ( not ( = ?AUTO_5913 ?AUTO_5917 ) ) ( not ( = ?AUTO_5913 ?AUTO_5914 ) ) ( not ( = ?AUTO_5918 ?AUTO_5917 ) ) ( not ( = ?AUTO_5918 ?AUTO_5914 ) ) ( not ( = ?AUTO_5917 ?AUTO_5914 ) ) ( ON ?AUTO_5917 ?AUTO_5912 ) ( not ( = ?AUTO_5912 ?AUTO_5915 ) ) ( not ( = ?AUTO_5913 ?AUTO_5915 ) ) ( not ( = ?AUTO_5918 ?AUTO_5915 ) ) ( not ( = ?AUTO_5914 ?AUTO_5915 ) ) ( not ( = ?AUTO_5917 ?AUTO_5915 ) ) ( ON ?AUTO_5915 ?AUTO_5913 ) ( not ( = ?AUTO_5912 ?AUTO_5916 ) ) ( not ( = ?AUTO_5913 ?AUTO_5916 ) ) ( not ( = ?AUTO_5918 ?AUTO_5916 ) ) ( not ( = ?AUTO_5914 ?AUTO_5916 ) ) ( not ( = ?AUTO_5917 ?AUTO_5916 ) ) ( not ( = ?AUTO_5915 ?AUTO_5916 ) ) ( ON ?AUTO_5916 ?AUTO_5917 ) ( CLEAR ?AUTO_5916 ) ( ON ?AUTO_5914 ?AUTO_5915 ) ( CLEAR ?AUTO_5914 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5914 ?AUTO_5915 )
      ( MAKE-ON ?AUTO_5912 ?AUTO_5913 )
      ( MAKE-ON-VERIFY ?AUTO_5912 ?AUTO_5913 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5920 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5920 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5920 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5920 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5921 - BLOCK
    )
    :vars
    (
      ?AUTO_5922 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5921 ?AUTO_5922 ) ( CLEAR ?AUTO_5921 ) ( HAND-EMPTY ) ( not ( = ?AUTO_5921 ?AUTO_5922 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5921 ?AUTO_5922 )
      ( MAKE-ON-TABLE ?AUTO_5921 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5921 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5924 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5924 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5924 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5924 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5925 - BLOCK
    )
    :vars
    (
      ?AUTO_5926 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5925 ?AUTO_5926 ) ( CLEAR ?AUTO_5925 ) ( HAND-EMPTY ) ( not ( = ?AUTO_5925 ?AUTO_5926 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5925 ?AUTO_5926 )
      ( MAKE-ON-TABLE ?AUTO_5925 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5925 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5927 - BLOCK
    )
    :vars
    (
      ?AUTO_5928 - BLOCK
      ?AUTO_5929 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5927 ?AUTO_5928 ) ( CLEAR ?AUTO_5927 ) ( not ( = ?AUTO_5927 ?AUTO_5928 ) ) ( HOLDING ?AUTO_5929 ) ( not ( = ?AUTO_5927 ?AUTO_5929 ) ) ( not ( = ?AUTO_5928 ?AUTO_5929 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5929 )
      ( MAKE-ON-TABLE ?AUTO_5927 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5927 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5930 - BLOCK
    )
    :vars
    (
      ?AUTO_5931 - BLOCK
      ?AUTO_5932 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5930 ?AUTO_5931 ) ( not ( = ?AUTO_5930 ?AUTO_5931 ) ) ( not ( = ?AUTO_5930 ?AUTO_5932 ) ) ( not ( = ?AUTO_5931 ?AUTO_5932 ) ) ( ON ?AUTO_5932 ?AUTO_5930 ) ( CLEAR ?AUTO_5932 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5932 ?AUTO_5930 )
      ( MAKE-ON-TABLE ?AUTO_5930 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5930 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5934 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5934 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5934 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5934 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5935 - BLOCK
    )
    :vars
    (
      ?AUTO_5936 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5935 ?AUTO_5936 ) ( CLEAR ?AUTO_5935 ) ( HAND-EMPTY ) ( not ( = ?AUTO_5935 ?AUTO_5936 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5935 ?AUTO_5936 )
      ( MAKE-ON-TABLE ?AUTO_5935 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5935 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5937 - BLOCK
    )
    :vars
    (
      ?AUTO_5938 - BLOCK
      ?AUTO_5939 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5937 ?AUTO_5938 ) ( CLEAR ?AUTO_5937 ) ( not ( = ?AUTO_5937 ?AUTO_5938 ) ) ( HOLDING ?AUTO_5939 ) ( not ( = ?AUTO_5937 ?AUTO_5939 ) ) ( not ( = ?AUTO_5938 ?AUTO_5939 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5939 )
      ( MAKE-ON-TABLE ?AUTO_5937 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5937 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5940 - BLOCK
    )
    :vars
    (
      ?AUTO_5941 - BLOCK
      ?AUTO_5942 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5940 ?AUTO_5941 ) ( not ( = ?AUTO_5940 ?AUTO_5941 ) ) ( not ( = ?AUTO_5940 ?AUTO_5942 ) ) ( not ( = ?AUTO_5941 ?AUTO_5942 ) ) ( ON ?AUTO_5942 ?AUTO_5940 ) ( CLEAR ?AUTO_5942 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5942 ?AUTO_5940 )
      ( MAKE-ON-TABLE ?AUTO_5940 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5940 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5943 - BLOCK
    )
    :vars
    (
      ?AUTO_5944 - BLOCK
      ?AUTO_5945 - BLOCK
      ?AUTO_5946 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5943 ?AUTO_5944 ) ( not ( = ?AUTO_5943 ?AUTO_5944 ) ) ( not ( = ?AUTO_5943 ?AUTO_5945 ) ) ( not ( = ?AUTO_5944 ?AUTO_5945 ) ) ( ON ?AUTO_5945 ?AUTO_5943 ) ( CLEAR ?AUTO_5945 ) ( HOLDING ?AUTO_5946 ) ( not ( = ?AUTO_5943 ?AUTO_5946 ) ) ( not ( = ?AUTO_5944 ?AUTO_5946 ) ) ( not ( = ?AUTO_5945 ?AUTO_5946 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5946 )
      ( MAKE-ON-TABLE ?AUTO_5943 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5943 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5947 - BLOCK
    )
    :vars
    (
      ?AUTO_5948 - BLOCK
      ?AUTO_5949 - BLOCK
      ?AUTO_5950 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5947 ?AUTO_5948 ) ( not ( = ?AUTO_5947 ?AUTO_5948 ) ) ( not ( = ?AUTO_5947 ?AUTO_5949 ) ) ( not ( = ?AUTO_5948 ?AUTO_5949 ) ) ( ON ?AUTO_5949 ?AUTO_5947 ) ( not ( = ?AUTO_5947 ?AUTO_5950 ) ) ( not ( = ?AUTO_5948 ?AUTO_5950 ) ) ( not ( = ?AUTO_5949 ?AUTO_5950 ) ) ( ON ?AUTO_5950 ?AUTO_5949 ) ( CLEAR ?AUTO_5950 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5950 ?AUTO_5949 )
      ( MAKE-ON-TABLE ?AUTO_5947 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5947 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5952 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5952 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5952 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5952 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5953 - BLOCK
    )
    :vars
    (
      ?AUTO_5954 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5953 ?AUTO_5954 ) ( CLEAR ?AUTO_5953 ) ( HAND-EMPTY ) ( not ( = ?AUTO_5953 ?AUTO_5954 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5953 ?AUTO_5954 )
      ( MAKE-ON-TABLE ?AUTO_5953 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5953 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5955 - BLOCK
    )
    :vars
    (
      ?AUTO_5956 - BLOCK
      ?AUTO_5957 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5955 ?AUTO_5956 ) ( CLEAR ?AUTO_5955 ) ( not ( = ?AUTO_5955 ?AUTO_5956 ) ) ( HOLDING ?AUTO_5957 ) ( not ( = ?AUTO_5955 ?AUTO_5957 ) ) ( not ( = ?AUTO_5956 ?AUTO_5957 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5957 )
      ( MAKE-ON-TABLE ?AUTO_5955 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5955 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5958 - BLOCK
    )
    :vars
    (
      ?AUTO_5959 - BLOCK
      ?AUTO_5960 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5958 ?AUTO_5959 ) ( not ( = ?AUTO_5958 ?AUTO_5959 ) ) ( not ( = ?AUTO_5958 ?AUTO_5960 ) ) ( not ( = ?AUTO_5959 ?AUTO_5960 ) ) ( ON ?AUTO_5960 ?AUTO_5958 ) ( CLEAR ?AUTO_5960 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5960 ?AUTO_5958 )
      ( MAKE-ON-TABLE ?AUTO_5958 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5958 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5961 - BLOCK
    )
    :vars
    (
      ?AUTO_5963 - BLOCK
      ?AUTO_5962 - BLOCK
      ?AUTO_5964 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5961 ?AUTO_5963 ) ( not ( = ?AUTO_5961 ?AUTO_5963 ) ) ( not ( = ?AUTO_5961 ?AUTO_5962 ) ) ( not ( = ?AUTO_5963 ?AUTO_5962 ) ) ( ON ?AUTO_5962 ?AUTO_5961 ) ( CLEAR ?AUTO_5962 ) ( HOLDING ?AUTO_5964 ) ( not ( = ?AUTO_5961 ?AUTO_5964 ) ) ( not ( = ?AUTO_5963 ?AUTO_5964 ) ) ( not ( = ?AUTO_5962 ?AUTO_5964 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5964 )
      ( MAKE-ON-TABLE ?AUTO_5961 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5961 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5965 - BLOCK
    )
    :vars
    (
      ?AUTO_5967 - BLOCK
      ?AUTO_5966 - BLOCK
      ?AUTO_5968 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5965 ?AUTO_5967 ) ( not ( = ?AUTO_5965 ?AUTO_5967 ) ) ( not ( = ?AUTO_5965 ?AUTO_5966 ) ) ( not ( = ?AUTO_5967 ?AUTO_5966 ) ) ( ON ?AUTO_5966 ?AUTO_5965 ) ( not ( = ?AUTO_5965 ?AUTO_5968 ) ) ( not ( = ?AUTO_5967 ?AUTO_5968 ) ) ( not ( = ?AUTO_5966 ?AUTO_5968 ) ) ( ON ?AUTO_5968 ?AUTO_5966 ) ( CLEAR ?AUTO_5968 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5968 ?AUTO_5966 )
      ( MAKE-ON-TABLE ?AUTO_5965 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5965 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5969 - BLOCK
    )
    :vars
    (
      ?AUTO_5970 - BLOCK
      ?AUTO_5972 - BLOCK
      ?AUTO_5971 - BLOCK
      ?AUTO_5973 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5969 ?AUTO_5970 ) ( not ( = ?AUTO_5969 ?AUTO_5970 ) ) ( not ( = ?AUTO_5969 ?AUTO_5972 ) ) ( not ( = ?AUTO_5970 ?AUTO_5972 ) ) ( ON ?AUTO_5972 ?AUTO_5969 ) ( not ( = ?AUTO_5969 ?AUTO_5971 ) ) ( not ( = ?AUTO_5970 ?AUTO_5971 ) ) ( not ( = ?AUTO_5972 ?AUTO_5971 ) ) ( ON ?AUTO_5971 ?AUTO_5972 ) ( CLEAR ?AUTO_5971 ) ( HOLDING ?AUTO_5973 ) ( not ( = ?AUTO_5969 ?AUTO_5973 ) ) ( not ( = ?AUTO_5970 ?AUTO_5973 ) ) ( not ( = ?AUTO_5972 ?AUTO_5973 ) ) ( not ( = ?AUTO_5971 ?AUTO_5973 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5973 )
      ( MAKE-ON-TABLE ?AUTO_5969 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5969 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5974 - BLOCK
    )
    :vars
    (
      ?AUTO_5977 - BLOCK
      ?AUTO_5978 - BLOCK
      ?AUTO_5975 - BLOCK
      ?AUTO_5976 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5974 ?AUTO_5977 ) ( not ( = ?AUTO_5974 ?AUTO_5977 ) ) ( not ( = ?AUTO_5974 ?AUTO_5978 ) ) ( not ( = ?AUTO_5977 ?AUTO_5978 ) ) ( ON ?AUTO_5978 ?AUTO_5974 ) ( not ( = ?AUTO_5974 ?AUTO_5975 ) ) ( not ( = ?AUTO_5977 ?AUTO_5975 ) ) ( not ( = ?AUTO_5978 ?AUTO_5975 ) ) ( ON ?AUTO_5975 ?AUTO_5978 ) ( not ( = ?AUTO_5974 ?AUTO_5976 ) ) ( not ( = ?AUTO_5977 ?AUTO_5976 ) ) ( not ( = ?AUTO_5978 ?AUTO_5976 ) ) ( not ( = ?AUTO_5975 ?AUTO_5976 ) ) ( ON ?AUTO_5976 ?AUTO_5975 ) ( CLEAR ?AUTO_5976 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5976 ?AUTO_5975 )
      ( MAKE-ON-TABLE ?AUTO_5974 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5974 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5981 - BLOCK
      ?AUTO_5982 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5981 ) ( CLEAR ?AUTO_5982 ) ( not ( = ?AUTO_5981 ?AUTO_5982 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5981 ?AUTO_5982 )
      ( MAKE-ON-VERIFY ?AUTO_5981 ?AUTO_5982 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5983 - BLOCK
      ?AUTO_5984 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5984 ) ( not ( = ?AUTO_5983 ?AUTO_5984 ) ) ( ON-TABLE ?AUTO_5983 ) ( CLEAR ?AUTO_5983 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_5983 )
      ( MAKE-ON ?AUTO_5983 ?AUTO_5984 )
      ( MAKE-ON-VERIFY ?AUTO_5983 ?AUTO_5984 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5985 - BLOCK
      ?AUTO_5986 - BLOCK
    )
    :vars
    (
      ?AUTO_5987 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5986 ) ( not ( = ?AUTO_5985 ?AUTO_5986 ) ) ( ON-TABLE ?AUTO_5985 ) ( CLEAR ?AUTO_5985 ) ( HOLDING ?AUTO_5987 ) ( not ( = ?AUTO_5985 ?AUTO_5987 ) ) ( not ( = ?AUTO_5986 ?AUTO_5987 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5987 )
      ( MAKE-ON ?AUTO_5985 ?AUTO_5986 )
      ( MAKE-ON-VERIFY ?AUTO_5985 ?AUTO_5986 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5988 - BLOCK
      ?AUTO_5989 - BLOCK
    )
    :vars
    (
      ?AUTO_5990 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5988 ?AUTO_5989 ) ) ( ON-TABLE ?AUTO_5988 ) ( CLEAR ?AUTO_5988 ) ( not ( = ?AUTO_5988 ?AUTO_5990 ) ) ( not ( = ?AUTO_5989 ?AUTO_5990 ) ) ( ON ?AUTO_5990 ?AUTO_5989 ) ( CLEAR ?AUTO_5990 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5990 ?AUTO_5989 )
      ( MAKE-ON ?AUTO_5988 ?AUTO_5989 )
      ( MAKE-ON-VERIFY ?AUTO_5988 ?AUTO_5989 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5991 - BLOCK
      ?AUTO_5992 - BLOCK
    )
    :vars
    (
      ?AUTO_5993 - BLOCK
      ?AUTO_5994 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5991 ?AUTO_5992 ) ) ( ON-TABLE ?AUTO_5991 ) ( CLEAR ?AUTO_5991 ) ( not ( = ?AUTO_5991 ?AUTO_5993 ) ) ( not ( = ?AUTO_5992 ?AUTO_5993 ) ) ( ON ?AUTO_5993 ?AUTO_5992 ) ( CLEAR ?AUTO_5993 ) ( HOLDING ?AUTO_5994 ) ( not ( = ?AUTO_5991 ?AUTO_5994 ) ) ( not ( = ?AUTO_5992 ?AUTO_5994 ) ) ( not ( = ?AUTO_5993 ?AUTO_5994 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5994 )
      ( MAKE-ON ?AUTO_5991 ?AUTO_5992 )
      ( MAKE-ON-VERIFY ?AUTO_5991 ?AUTO_5992 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5995 - BLOCK
      ?AUTO_5996 - BLOCK
    )
    :vars
    (
      ?AUTO_5997 - BLOCK
      ?AUTO_5998 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5995 ?AUTO_5996 ) ) ( ON-TABLE ?AUTO_5995 ) ( CLEAR ?AUTO_5995 ) ( not ( = ?AUTO_5995 ?AUTO_5997 ) ) ( not ( = ?AUTO_5996 ?AUTO_5997 ) ) ( ON ?AUTO_5997 ?AUTO_5996 ) ( not ( = ?AUTO_5995 ?AUTO_5998 ) ) ( not ( = ?AUTO_5996 ?AUTO_5998 ) ) ( not ( = ?AUTO_5997 ?AUTO_5998 ) ) ( ON ?AUTO_5998 ?AUTO_5997 ) ( CLEAR ?AUTO_5998 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5998 ?AUTO_5997 )
      ( MAKE-ON ?AUTO_5995 ?AUTO_5996 )
      ( MAKE-ON-VERIFY ?AUTO_5995 ?AUTO_5996 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5999 - BLOCK
      ?AUTO_6000 - BLOCK
    )
    :vars
    (
      ?AUTO_6001 - BLOCK
      ?AUTO_6002 - BLOCK
      ?AUTO_6003 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5999 ?AUTO_6000 ) ) ( ON-TABLE ?AUTO_5999 ) ( CLEAR ?AUTO_5999 ) ( not ( = ?AUTO_5999 ?AUTO_6001 ) ) ( not ( = ?AUTO_6000 ?AUTO_6001 ) ) ( ON ?AUTO_6001 ?AUTO_6000 ) ( not ( = ?AUTO_5999 ?AUTO_6002 ) ) ( not ( = ?AUTO_6000 ?AUTO_6002 ) ) ( not ( = ?AUTO_6001 ?AUTO_6002 ) ) ( ON ?AUTO_6002 ?AUTO_6001 ) ( CLEAR ?AUTO_6002 ) ( HOLDING ?AUTO_6003 ) ( not ( = ?AUTO_5999 ?AUTO_6003 ) ) ( not ( = ?AUTO_6000 ?AUTO_6003 ) ) ( not ( = ?AUTO_6001 ?AUTO_6003 ) ) ( not ( = ?AUTO_6002 ?AUTO_6003 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6003 )
      ( MAKE-ON ?AUTO_5999 ?AUTO_6000 )
      ( MAKE-ON-VERIFY ?AUTO_5999 ?AUTO_6000 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6004 - BLOCK
      ?AUTO_6005 - BLOCK
    )
    :vars
    (
      ?AUTO_6006 - BLOCK
      ?AUTO_6007 - BLOCK
      ?AUTO_6008 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6004 ?AUTO_6005 ) ) ( ON-TABLE ?AUTO_6004 ) ( CLEAR ?AUTO_6004 ) ( not ( = ?AUTO_6004 ?AUTO_6006 ) ) ( not ( = ?AUTO_6005 ?AUTO_6006 ) ) ( ON ?AUTO_6006 ?AUTO_6005 ) ( not ( = ?AUTO_6004 ?AUTO_6007 ) ) ( not ( = ?AUTO_6005 ?AUTO_6007 ) ) ( not ( = ?AUTO_6006 ?AUTO_6007 ) ) ( ON ?AUTO_6007 ?AUTO_6006 ) ( not ( = ?AUTO_6004 ?AUTO_6008 ) ) ( not ( = ?AUTO_6005 ?AUTO_6008 ) ) ( not ( = ?AUTO_6006 ?AUTO_6008 ) ) ( not ( = ?AUTO_6007 ?AUTO_6008 ) ) ( ON ?AUTO_6008 ?AUTO_6007 ) ( CLEAR ?AUTO_6008 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6008 ?AUTO_6007 )
      ( MAKE-ON ?AUTO_6004 ?AUTO_6005 )
      ( MAKE-ON-VERIFY ?AUTO_6004 ?AUTO_6005 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6009 - BLOCK
      ?AUTO_6010 - BLOCK
    )
    :vars
    (
      ?AUTO_6011 - BLOCK
      ?AUTO_6012 - BLOCK
      ?AUTO_6013 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6009 ?AUTO_6010 ) ) ( not ( = ?AUTO_6009 ?AUTO_6011 ) ) ( not ( = ?AUTO_6010 ?AUTO_6011 ) ) ( ON ?AUTO_6011 ?AUTO_6010 ) ( not ( = ?AUTO_6009 ?AUTO_6012 ) ) ( not ( = ?AUTO_6010 ?AUTO_6012 ) ) ( not ( = ?AUTO_6011 ?AUTO_6012 ) ) ( ON ?AUTO_6012 ?AUTO_6011 ) ( not ( = ?AUTO_6009 ?AUTO_6013 ) ) ( not ( = ?AUTO_6010 ?AUTO_6013 ) ) ( not ( = ?AUTO_6011 ?AUTO_6013 ) ) ( not ( = ?AUTO_6012 ?AUTO_6013 ) ) ( ON ?AUTO_6013 ?AUTO_6012 ) ( CLEAR ?AUTO_6013 ) ( HOLDING ?AUTO_6009 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6009 )
      ( MAKE-ON ?AUTO_6009 ?AUTO_6010 )
      ( MAKE-ON-VERIFY ?AUTO_6009 ?AUTO_6010 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6014 - BLOCK
      ?AUTO_6015 - BLOCK
    )
    :vars
    (
      ?AUTO_6017 - BLOCK
      ?AUTO_6016 - BLOCK
      ?AUTO_6018 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6014 ?AUTO_6015 ) ) ( not ( = ?AUTO_6014 ?AUTO_6017 ) ) ( not ( = ?AUTO_6015 ?AUTO_6017 ) ) ( ON ?AUTO_6017 ?AUTO_6015 ) ( not ( = ?AUTO_6014 ?AUTO_6016 ) ) ( not ( = ?AUTO_6015 ?AUTO_6016 ) ) ( not ( = ?AUTO_6017 ?AUTO_6016 ) ) ( ON ?AUTO_6016 ?AUTO_6017 ) ( not ( = ?AUTO_6014 ?AUTO_6018 ) ) ( not ( = ?AUTO_6015 ?AUTO_6018 ) ) ( not ( = ?AUTO_6017 ?AUTO_6018 ) ) ( not ( = ?AUTO_6016 ?AUTO_6018 ) ) ( ON ?AUTO_6018 ?AUTO_6016 ) ( ON ?AUTO_6014 ?AUTO_6018 ) ( CLEAR ?AUTO_6014 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6014 ?AUTO_6018 )
      ( MAKE-ON ?AUTO_6014 ?AUTO_6015 )
      ( MAKE-ON-VERIFY ?AUTO_6014 ?AUTO_6015 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6020 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6020 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6020 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6020 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6021 - BLOCK
    )
    :vars
    (
      ?AUTO_6022 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6021 ?AUTO_6022 ) ( CLEAR ?AUTO_6021 ) ( HAND-EMPTY ) ( not ( = ?AUTO_6021 ?AUTO_6022 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6021 ?AUTO_6022 )
      ( MAKE-ON-TABLE ?AUTO_6021 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6021 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6024 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6024 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6024 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6024 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6025 - BLOCK
    )
    :vars
    (
      ?AUTO_6026 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6025 ?AUTO_6026 ) ( CLEAR ?AUTO_6025 ) ( HAND-EMPTY ) ( not ( = ?AUTO_6025 ?AUTO_6026 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6025 ?AUTO_6026 )
      ( MAKE-ON-TABLE ?AUTO_6025 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6025 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6027 - BLOCK
    )
    :vars
    (
      ?AUTO_6028 - BLOCK
      ?AUTO_6029 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6027 ?AUTO_6028 ) ( CLEAR ?AUTO_6027 ) ( not ( = ?AUTO_6027 ?AUTO_6028 ) ) ( HOLDING ?AUTO_6029 ) ( not ( = ?AUTO_6027 ?AUTO_6029 ) ) ( not ( = ?AUTO_6028 ?AUTO_6029 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6029 )
      ( MAKE-ON-TABLE ?AUTO_6027 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6027 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6032 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6032 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6032 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6032 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6033 - BLOCK
    )
    :vars
    (
      ?AUTO_6034 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6033 ?AUTO_6034 ) ( CLEAR ?AUTO_6033 ) ( HAND-EMPTY ) ( not ( = ?AUTO_6033 ?AUTO_6034 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6033 ?AUTO_6034 )
      ( MAKE-ON-TABLE ?AUTO_6033 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6033 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6035 - BLOCK
    )
    :vars
    (
      ?AUTO_6036 - BLOCK
      ?AUTO_6037 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6035 ?AUTO_6036 ) ( CLEAR ?AUTO_6035 ) ( not ( = ?AUTO_6035 ?AUTO_6036 ) ) ( HOLDING ?AUTO_6037 ) ( not ( = ?AUTO_6035 ?AUTO_6037 ) ) ( not ( = ?AUTO_6036 ?AUTO_6037 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6037 )
      ( MAKE-ON-TABLE ?AUTO_6035 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6035 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6038 - BLOCK
    )
    :vars
    (
      ?AUTO_6039 - BLOCK
      ?AUTO_6040 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6038 ?AUTO_6039 ) ( not ( = ?AUTO_6038 ?AUTO_6039 ) ) ( not ( = ?AUTO_6038 ?AUTO_6040 ) ) ( not ( = ?AUTO_6039 ?AUTO_6040 ) ) ( ON ?AUTO_6040 ?AUTO_6038 ) ( CLEAR ?AUTO_6040 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6040 ?AUTO_6038 )
      ( MAKE-ON-TABLE ?AUTO_6038 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6038 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6041 - BLOCK
    )
    :vars
    (
      ?AUTO_6042 - BLOCK
      ?AUTO_6043 - BLOCK
      ?AUTO_6044 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6041 ?AUTO_6042 ) ( not ( = ?AUTO_6041 ?AUTO_6042 ) ) ( not ( = ?AUTO_6041 ?AUTO_6043 ) ) ( not ( = ?AUTO_6042 ?AUTO_6043 ) ) ( ON ?AUTO_6043 ?AUTO_6041 ) ( CLEAR ?AUTO_6043 ) ( HOLDING ?AUTO_6044 ) ( not ( = ?AUTO_6041 ?AUTO_6044 ) ) ( not ( = ?AUTO_6042 ?AUTO_6044 ) ) ( not ( = ?AUTO_6043 ?AUTO_6044 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6044 )
      ( MAKE-ON-TABLE ?AUTO_6041 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6041 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6047 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6047 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6047 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6047 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6048 - BLOCK
    )
    :vars
    (
      ?AUTO_6049 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6048 ?AUTO_6049 ) ( CLEAR ?AUTO_6048 ) ( HAND-EMPTY ) ( not ( = ?AUTO_6048 ?AUTO_6049 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6048 ?AUTO_6049 )
      ( MAKE-ON-TABLE ?AUTO_6048 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6048 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6050 - BLOCK
    )
    :vars
    (
      ?AUTO_6051 - BLOCK
      ?AUTO_6052 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6050 ?AUTO_6051 ) ( CLEAR ?AUTO_6050 ) ( not ( = ?AUTO_6050 ?AUTO_6051 ) ) ( HOLDING ?AUTO_6052 ) ( not ( = ?AUTO_6050 ?AUTO_6052 ) ) ( not ( = ?AUTO_6051 ?AUTO_6052 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6052 )
      ( MAKE-ON-TABLE ?AUTO_6050 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6050 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6060 - BLOCK
      ?AUTO_6061 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6060 ) ( CLEAR ?AUTO_6061 ) ( not ( = ?AUTO_6060 ?AUTO_6061 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_6060 ?AUTO_6061 )
      ( MAKE-ON-VERIFY ?AUTO_6060 ?AUTO_6061 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6062 - BLOCK
      ?AUTO_6063 - BLOCK
    )
    :vars
    (
      ?AUTO_6064 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6063 ) ( not ( = ?AUTO_6062 ?AUTO_6063 ) ) ( ON ?AUTO_6062 ?AUTO_6064 ) ( CLEAR ?AUTO_6062 ) ( HAND-EMPTY ) ( not ( = ?AUTO_6062 ?AUTO_6064 ) ) ( not ( = ?AUTO_6063 ?AUTO_6064 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6062 ?AUTO_6064 )
      ( MAKE-ON ?AUTO_6062 ?AUTO_6063 )
      ( MAKE-ON-VERIFY ?AUTO_6062 ?AUTO_6063 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6065 - BLOCK
      ?AUTO_6066 - BLOCK
    )
    :vars
    (
      ?AUTO_6067 - BLOCK
      ?AUTO_6068 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6066 ) ( not ( = ?AUTO_6065 ?AUTO_6066 ) ) ( ON ?AUTO_6065 ?AUTO_6067 ) ( CLEAR ?AUTO_6065 ) ( not ( = ?AUTO_6065 ?AUTO_6067 ) ) ( not ( = ?AUTO_6066 ?AUTO_6067 ) ) ( HOLDING ?AUTO_6068 ) ( not ( = ?AUTO_6065 ?AUTO_6068 ) ) ( not ( = ?AUTO_6066 ?AUTO_6068 ) ) ( not ( = ?AUTO_6067 ?AUTO_6068 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6068 )
      ( MAKE-ON ?AUTO_6065 ?AUTO_6066 )
      ( MAKE-ON-VERIFY ?AUTO_6065 ?AUTO_6066 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6069 - BLOCK
      ?AUTO_6070 - BLOCK
    )
    :vars
    (
      ?AUTO_6071 - BLOCK
      ?AUTO_6072 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6070 ) ( not ( = ?AUTO_6069 ?AUTO_6070 ) ) ( ON ?AUTO_6069 ?AUTO_6071 ) ( not ( = ?AUTO_6069 ?AUTO_6071 ) ) ( not ( = ?AUTO_6070 ?AUTO_6071 ) ) ( not ( = ?AUTO_6069 ?AUTO_6072 ) ) ( not ( = ?AUTO_6070 ?AUTO_6072 ) ) ( not ( = ?AUTO_6071 ?AUTO_6072 ) ) ( ON ?AUTO_6072 ?AUTO_6069 ) ( CLEAR ?AUTO_6072 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6072 ?AUTO_6069 )
      ( MAKE-ON ?AUTO_6069 ?AUTO_6070 )
      ( MAKE-ON-VERIFY ?AUTO_6069 ?AUTO_6070 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6073 - BLOCK
      ?AUTO_6074 - BLOCK
    )
    :vars
    (
      ?AUTO_6075 - BLOCK
      ?AUTO_6076 - BLOCK
      ?AUTO_6077 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6074 ) ( not ( = ?AUTO_6073 ?AUTO_6074 ) ) ( ON ?AUTO_6073 ?AUTO_6075 ) ( not ( = ?AUTO_6073 ?AUTO_6075 ) ) ( not ( = ?AUTO_6074 ?AUTO_6075 ) ) ( not ( = ?AUTO_6073 ?AUTO_6076 ) ) ( not ( = ?AUTO_6074 ?AUTO_6076 ) ) ( not ( = ?AUTO_6075 ?AUTO_6076 ) ) ( ON ?AUTO_6076 ?AUTO_6073 ) ( CLEAR ?AUTO_6076 ) ( HOLDING ?AUTO_6077 ) ( not ( = ?AUTO_6073 ?AUTO_6077 ) ) ( not ( = ?AUTO_6074 ?AUTO_6077 ) ) ( not ( = ?AUTO_6075 ?AUTO_6077 ) ) ( not ( = ?AUTO_6076 ?AUTO_6077 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6077 )
      ( MAKE-ON ?AUTO_6073 ?AUTO_6074 )
      ( MAKE-ON-VERIFY ?AUTO_6073 ?AUTO_6074 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6080 - BLOCK
      ?AUTO_6081 - BLOCK
    )
    :vars
    (
      ?AUTO_6083 - BLOCK
      ?AUTO_6082 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6080 ?AUTO_6081 ) ) ( ON ?AUTO_6080 ?AUTO_6083 ) ( not ( = ?AUTO_6080 ?AUTO_6083 ) ) ( not ( = ?AUTO_6081 ?AUTO_6083 ) ) ( not ( = ?AUTO_6080 ?AUTO_6082 ) ) ( not ( = ?AUTO_6081 ?AUTO_6082 ) ) ( not ( = ?AUTO_6083 ?AUTO_6082 ) ) ( ON ?AUTO_6082 ?AUTO_6080 ) ( CLEAR ?AUTO_6082 ) ( HOLDING ?AUTO_6081 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6081 )
      ( MAKE-ON ?AUTO_6080 ?AUTO_6081 )
      ( MAKE-ON-VERIFY ?AUTO_6080 ?AUTO_6081 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6088 - BLOCK
      ?AUTO_6089 - BLOCK
    )
    :vars
    (
      ?AUTO_6092 - BLOCK
      ?AUTO_6091 - BLOCK
      ?AUTO_6090 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6089 ) ( not ( = ?AUTO_6088 ?AUTO_6089 ) ) ( ON ?AUTO_6088 ?AUTO_6092 ) ( not ( = ?AUTO_6088 ?AUTO_6092 ) ) ( not ( = ?AUTO_6089 ?AUTO_6092 ) ) ( not ( = ?AUTO_6088 ?AUTO_6091 ) ) ( not ( = ?AUTO_6089 ?AUTO_6091 ) ) ( not ( = ?AUTO_6092 ?AUTO_6091 ) ) ( ON ?AUTO_6091 ?AUTO_6088 ) ( not ( = ?AUTO_6088 ?AUTO_6090 ) ) ( not ( = ?AUTO_6089 ?AUTO_6090 ) ) ( not ( = ?AUTO_6092 ?AUTO_6090 ) ) ( not ( = ?AUTO_6091 ?AUTO_6090 ) ) ( ON ?AUTO_6090 ?AUTO_6091 ) ( CLEAR ?AUTO_6090 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6090 ?AUTO_6091 )
      ( MAKE-ON ?AUTO_6088 ?AUTO_6089 )
      ( MAKE-ON-VERIFY ?AUTO_6088 ?AUTO_6089 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6095 - BLOCK
      ?AUTO_6096 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6095 ) ( CLEAR ?AUTO_6096 ) ( not ( = ?AUTO_6095 ?AUTO_6096 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_6095 ?AUTO_6096 )
      ( MAKE-ON-VERIFY ?AUTO_6095 ?AUTO_6096 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6097 - BLOCK
      ?AUTO_6098 - BLOCK
    )
    :vars
    (
      ?AUTO_6099 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6098 ) ( not ( = ?AUTO_6097 ?AUTO_6098 ) ) ( ON ?AUTO_6097 ?AUTO_6099 ) ( CLEAR ?AUTO_6097 ) ( HAND-EMPTY ) ( not ( = ?AUTO_6097 ?AUTO_6099 ) ) ( not ( = ?AUTO_6098 ?AUTO_6099 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6097 ?AUTO_6099 )
      ( MAKE-ON ?AUTO_6097 ?AUTO_6098 )
      ( MAKE-ON-VERIFY ?AUTO_6097 ?AUTO_6098 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6100 - BLOCK
      ?AUTO_6101 - BLOCK
    )
    :vars
    (
      ?AUTO_6102 - BLOCK
      ?AUTO_6103 - BLOCK
      ?AUTO_6104 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6101 ) ( not ( = ?AUTO_6100 ?AUTO_6101 ) ) ( ON ?AUTO_6100 ?AUTO_6102 ) ( CLEAR ?AUTO_6100 ) ( not ( = ?AUTO_6100 ?AUTO_6102 ) ) ( not ( = ?AUTO_6101 ?AUTO_6102 ) ) ( HOLDING ?AUTO_6103 ) ( CLEAR ?AUTO_6104 ) ( not ( = ?AUTO_6100 ?AUTO_6103 ) ) ( not ( = ?AUTO_6100 ?AUTO_6104 ) ) ( not ( = ?AUTO_6101 ?AUTO_6103 ) ) ( not ( = ?AUTO_6101 ?AUTO_6104 ) ) ( not ( = ?AUTO_6102 ?AUTO_6103 ) ) ( not ( = ?AUTO_6102 ?AUTO_6104 ) ) ( not ( = ?AUTO_6103 ?AUTO_6104 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_6103 ?AUTO_6104 )
      ( MAKE-ON ?AUTO_6100 ?AUTO_6101 )
      ( MAKE-ON-VERIFY ?AUTO_6100 ?AUTO_6101 ) )
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
      ?AUTO_6109 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6106 ) ( not ( = ?AUTO_6105 ?AUTO_6106 ) ) ( ON ?AUTO_6105 ?AUTO_6107 ) ( not ( = ?AUTO_6105 ?AUTO_6107 ) ) ( not ( = ?AUTO_6106 ?AUTO_6107 ) ) ( CLEAR ?AUTO_6108 ) ( not ( = ?AUTO_6105 ?AUTO_6109 ) ) ( not ( = ?AUTO_6105 ?AUTO_6108 ) ) ( not ( = ?AUTO_6106 ?AUTO_6109 ) ) ( not ( = ?AUTO_6106 ?AUTO_6108 ) ) ( not ( = ?AUTO_6107 ?AUTO_6109 ) ) ( not ( = ?AUTO_6107 ?AUTO_6108 ) ) ( not ( = ?AUTO_6109 ?AUTO_6108 ) ) ( ON ?AUTO_6109 ?AUTO_6105 ) ( CLEAR ?AUTO_6109 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6109 ?AUTO_6105 )
      ( MAKE-ON ?AUTO_6105 ?AUTO_6106 )
      ( MAKE-ON-VERIFY ?AUTO_6105 ?AUTO_6106 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6110 - BLOCK
      ?AUTO_6111 - BLOCK
    )
    :vars
    (
      ?AUTO_6112 - BLOCK
      ?AUTO_6114 - BLOCK
      ?AUTO_6113 - BLOCK
      ?AUTO_6115 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6111 ) ( not ( = ?AUTO_6110 ?AUTO_6111 ) ) ( ON ?AUTO_6110 ?AUTO_6112 ) ( not ( = ?AUTO_6110 ?AUTO_6112 ) ) ( not ( = ?AUTO_6111 ?AUTO_6112 ) ) ( CLEAR ?AUTO_6114 ) ( not ( = ?AUTO_6110 ?AUTO_6113 ) ) ( not ( = ?AUTO_6110 ?AUTO_6114 ) ) ( not ( = ?AUTO_6111 ?AUTO_6113 ) ) ( not ( = ?AUTO_6111 ?AUTO_6114 ) ) ( not ( = ?AUTO_6112 ?AUTO_6113 ) ) ( not ( = ?AUTO_6112 ?AUTO_6114 ) ) ( not ( = ?AUTO_6113 ?AUTO_6114 ) ) ( ON ?AUTO_6113 ?AUTO_6110 ) ( CLEAR ?AUTO_6113 ) ( HOLDING ?AUTO_6115 ) ( not ( = ?AUTO_6110 ?AUTO_6115 ) ) ( not ( = ?AUTO_6111 ?AUTO_6115 ) ) ( not ( = ?AUTO_6112 ?AUTO_6115 ) ) ( not ( = ?AUTO_6114 ?AUTO_6115 ) ) ( not ( = ?AUTO_6113 ?AUTO_6115 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6115 )
      ( MAKE-ON ?AUTO_6110 ?AUTO_6111 )
      ( MAKE-ON-VERIFY ?AUTO_6110 ?AUTO_6111 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6116 - BLOCK
      ?AUTO_6117 - BLOCK
    )
    :vars
    (
      ?AUTO_6119 - BLOCK
      ?AUTO_6120 - BLOCK
      ?AUTO_6118 - BLOCK
      ?AUTO_6121 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6117 ) ( not ( = ?AUTO_6116 ?AUTO_6117 ) ) ( ON ?AUTO_6116 ?AUTO_6119 ) ( not ( = ?AUTO_6116 ?AUTO_6119 ) ) ( not ( = ?AUTO_6117 ?AUTO_6119 ) ) ( CLEAR ?AUTO_6120 ) ( not ( = ?AUTO_6116 ?AUTO_6118 ) ) ( not ( = ?AUTO_6116 ?AUTO_6120 ) ) ( not ( = ?AUTO_6117 ?AUTO_6118 ) ) ( not ( = ?AUTO_6117 ?AUTO_6120 ) ) ( not ( = ?AUTO_6119 ?AUTO_6118 ) ) ( not ( = ?AUTO_6119 ?AUTO_6120 ) ) ( not ( = ?AUTO_6118 ?AUTO_6120 ) ) ( ON ?AUTO_6118 ?AUTO_6116 ) ( not ( = ?AUTO_6116 ?AUTO_6121 ) ) ( not ( = ?AUTO_6117 ?AUTO_6121 ) ) ( not ( = ?AUTO_6119 ?AUTO_6121 ) ) ( not ( = ?AUTO_6120 ?AUTO_6121 ) ) ( not ( = ?AUTO_6118 ?AUTO_6121 ) ) ( ON ?AUTO_6121 ?AUTO_6118 ) ( CLEAR ?AUTO_6121 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6121 ?AUTO_6118 )
      ( MAKE-ON ?AUTO_6116 ?AUTO_6117 )
      ( MAKE-ON-VERIFY ?AUTO_6116 ?AUTO_6117 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6122 - BLOCK
      ?AUTO_6123 - BLOCK
    )
    :vars
    (
      ?AUTO_6126 - BLOCK
      ?AUTO_6125 - BLOCK
      ?AUTO_6127 - BLOCK
      ?AUTO_6124 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6122 ?AUTO_6123 ) ) ( ON ?AUTO_6122 ?AUTO_6126 ) ( not ( = ?AUTO_6122 ?AUTO_6126 ) ) ( not ( = ?AUTO_6123 ?AUTO_6126 ) ) ( CLEAR ?AUTO_6125 ) ( not ( = ?AUTO_6122 ?AUTO_6127 ) ) ( not ( = ?AUTO_6122 ?AUTO_6125 ) ) ( not ( = ?AUTO_6123 ?AUTO_6127 ) ) ( not ( = ?AUTO_6123 ?AUTO_6125 ) ) ( not ( = ?AUTO_6126 ?AUTO_6127 ) ) ( not ( = ?AUTO_6126 ?AUTO_6125 ) ) ( not ( = ?AUTO_6127 ?AUTO_6125 ) ) ( ON ?AUTO_6127 ?AUTO_6122 ) ( not ( = ?AUTO_6122 ?AUTO_6124 ) ) ( not ( = ?AUTO_6123 ?AUTO_6124 ) ) ( not ( = ?AUTO_6126 ?AUTO_6124 ) ) ( not ( = ?AUTO_6125 ?AUTO_6124 ) ) ( not ( = ?AUTO_6127 ?AUTO_6124 ) ) ( ON ?AUTO_6124 ?AUTO_6127 ) ( CLEAR ?AUTO_6124 ) ( HOLDING ?AUTO_6123 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6123 )
      ( MAKE-ON ?AUTO_6122 ?AUTO_6123 )
      ( MAKE-ON-VERIFY ?AUTO_6122 ?AUTO_6123 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6130 - BLOCK
      ?AUTO_6131 - BLOCK
    )
    :vars
    (
      ?AUTO_6135 - BLOCK
      ?AUTO_6132 - BLOCK
      ?AUTO_6133 - BLOCK
      ?AUTO_6134 - BLOCK
      ?AUTO_6136 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6131 ) ( not ( = ?AUTO_6130 ?AUTO_6131 ) ) ( ON ?AUTO_6130 ?AUTO_6135 ) ( not ( = ?AUTO_6130 ?AUTO_6135 ) ) ( not ( = ?AUTO_6131 ?AUTO_6135 ) ) ( CLEAR ?AUTO_6132 ) ( not ( = ?AUTO_6130 ?AUTO_6133 ) ) ( not ( = ?AUTO_6130 ?AUTO_6132 ) ) ( not ( = ?AUTO_6131 ?AUTO_6133 ) ) ( not ( = ?AUTO_6131 ?AUTO_6132 ) ) ( not ( = ?AUTO_6135 ?AUTO_6133 ) ) ( not ( = ?AUTO_6135 ?AUTO_6132 ) ) ( not ( = ?AUTO_6133 ?AUTO_6132 ) ) ( ON ?AUTO_6133 ?AUTO_6130 ) ( not ( = ?AUTO_6130 ?AUTO_6134 ) ) ( not ( = ?AUTO_6131 ?AUTO_6134 ) ) ( not ( = ?AUTO_6135 ?AUTO_6134 ) ) ( not ( = ?AUTO_6132 ?AUTO_6134 ) ) ( not ( = ?AUTO_6133 ?AUTO_6134 ) ) ( ON ?AUTO_6134 ?AUTO_6133 ) ( CLEAR ?AUTO_6134 ) ( HOLDING ?AUTO_6136 ) ( not ( = ?AUTO_6130 ?AUTO_6136 ) ) ( not ( = ?AUTO_6131 ?AUTO_6136 ) ) ( not ( = ?AUTO_6135 ?AUTO_6136 ) ) ( not ( = ?AUTO_6132 ?AUTO_6136 ) ) ( not ( = ?AUTO_6133 ?AUTO_6136 ) ) ( not ( = ?AUTO_6134 ?AUTO_6136 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6136 )
      ( MAKE-ON ?AUTO_6130 ?AUTO_6131 )
      ( MAKE-ON-VERIFY ?AUTO_6130 ?AUTO_6131 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6137 - BLOCK
      ?AUTO_6138 - BLOCK
    )
    :vars
    (
      ?AUTO_6143 - BLOCK
      ?AUTO_6140 - BLOCK
      ?AUTO_6139 - BLOCK
      ?AUTO_6141 - BLOCK
      ?AUTO_6142 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6137 ?AUTO_6138 ) ) ( ON ?AUTO_6137 ?AUTO_6143 ) ( not ( = ?AUTO_6137 ?AUTO_6143 ) ) ( not ( = ?AUTO_6138 ?AUTO_6143 ) ) ( CLEAR ?AUTO_6140 ) ( not ( = ?AUTO_6137 ?AUTO_6139 ) ) ( not ( = ?AUTO_6137 ?AUTO_6140 ) ) ( not ( = ?AUTO_6138 ?AUTO_6139 ) ) ( not ( = ?AUTO_6138 ?AUTO_6140 ) ) ( not ( = ?AUTO_6143 ?AUTO_6139 ) ) ( not ( = ?AUTO_6143 ?AUTO_6140 ) ) ( not ( = ?AUTO_6139 ?AUTO_6140 ) ) ( ON ?AUTO_6139 ?AUTO_6137 ) ( not ( = ?AUTO_6137 ?AUTO_6141 ) ) ( not ( = ?AUTO_6138 ?AUTO_6141 ) ) ( not ( = ?AUTO_6143 ?AUTO_6141 ) ) ( not ( = ?AUTO_6140 ?AUTO_6141 ) ) ( not ( = ?AUTO_6139 ?AUTO_6141 ) ) ( ON ?AUTO_6141 ?AUTO_6139 ) ( CLEAR ?AUTO_6141 ) ( not ( = ?AUTO_6137 ?AUTO_6142 ) ) ( not ( = ?AUTO_6138 ?AUTO_6142 ) ) ( not ( = ?AUTO_6143 ?AUTO_6142 ) ) ( not ( = ?AUTO_6140 ?AUTO_6142 ) ) ( not ( = ?AUTO_6139 ?AUTO_6142 ) ) ( not ( = ?AUTO_6141 ?AUTO_6142 ) ) ( ON ?AUTO_6142 ?AUTO_6138 ) ( CLEAR ?AUTO_6142 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6142 ?AUTO_6138 )
      ( MAKE-ON ?AUTO_6137 ?AUTO_6138 )
      ( MAKE-ON-VERIFY ?AUTO_6137 ?AUTO_6138 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6144 - BLOCK
      ?AUTO_6145 - BLOCK
    )
    :vars
    (
      ?AUTO_6150 - BLOCK
      ?AUTO_6147 - BLOCK
      ?AUTO_6148 - BLOCK
      ?AUTO_6146 - BLOCK
      ?AUTO_6149 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6144 ?AUTO_6145 ) ) ( ON ?AUTO_6144 ?AUTO_6150 ) ( not ( = ?AUTO_6144 ?AUTO_6150 ) ) ( not ( = ?AUTO_6145 ?AUTO_6150 ) ) ( not ( = ?AUTO_6144 ?AUTO_6147 ) ) ( not ( = ?AUTO_6144 ?AUTO_6148 ) ) ( not ( = ?AUTO_6145 ?AUTO_6147 ) ) ( not ( = ?AUTO_6145 ?AUTO_6148 ) ) ( not ( = ?AUTO_6150 ?AUTO_6147 ) ) ( not ( = ?AUTO_6150 ?AUTO_6148 ) ) ( not ( = ?AUTO_6147 ?AUTO_6148 ) ) ( ON ?AUTO_6147 ?AUTO_6144 ) ( not ( = ?AUTO_6144 ?AUTO_6146 ) ) ( not ( = ?AUTO_6145 ?AUTO_6146 ) ) ( not ( = ?AUTO_6150 ?AUTO_6146 ) ) ( not ( = ?AUTO_6148 ?AUTO_6146 ) ) ( not ( = ?AUTO_6147 ?AUTO_6146 ) ) ( ON ?AUTO_6146 ?AUTO_6147 ) ( CLEAR ?AUTO_6146 ) ( not ( = ?AUTO_6144 ?AUTO_6149 ) ) ( not ( = ?AUTO_6145 ?AUTO_6149 ) ) ( not ( = ?AUTO_6150 ?AUTO_6149 ) ) ( not ( = ?AUTO_6148 ?AUTO_6149 ) ) ( not ( = ?AUTO_6147 ?AUTO_6149 ) ) ( not ( = ?AUTO_6146 ?AUTO_6149 ) ) ( ON ?AUTO_6149 ?AUTO_6145 ) ( CLEAR ?AUTO_6149 ) ( HOLDING ?AUTO_6148 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6148 )
      ( MAKE-ON ?AUTO_6144 ?AUTO_6145 )
      ( MAKE-ON-VERIFY ?AUTO_6144 ?AUTO_6145 ) )
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
      ?AUTO_6157 - BLOCK
      ?AUTO_6156 - BLOCK
      ?AUTO_6154 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6151 ?AUTO_6152 ) ) ( ON ?AUTO_6151 ?AUTO_6153 ) ( not ( = ?AUTO_6151 ?AUTO_6153 ) ) ( not ( = ?AUTO_6152 ?AUTO_6153 ) ) ( not ( = ?AUTO_6151 ?AUTO_6155 ) ) ( not ( = ?AUTO_6151 ?AUTO_6157 ) ) ( not ( = ?AUTO_6152 ?AUTO_6155 ) ) ( not ( = ?AUTO_6152 ?AUTO_6157 ) ) ( not ( = ?AUTO_6153 ?AUTO_6155 ) ) ( not ( = ?AUTO_6153 ?AUTO_6157 ) ) ( not ( = ?AUTO_6155 ?AUTO_6157 ) ) ( ON ?AUTO_6155 ?AUTO_6151 ) ( not ( = ?AUTO_6151 ?AUTO_6156 ) ) ( not ( = ?AUTO_6152 ?AUTO_6156 ) ) ( not ( = ?AUTO_6153 ?AUTO_6156 ) ) ( not ( = ?AUTO_6157 ?AUTO_6156 ) ) ( not ( = ?AUTO_6155 ?AUTO_6156 ) ) ( ON ?AUTO_6156 ?AUTO_6155 ) ( not ( = ?AUTO_6151 ?AUTO_6154 ) ) ( not ( = ?AUTO_6152 ?AUTO_6154 ) ) ( not ( = ?AUTO_6153 ?AUTO_6154 ) ) ( not ( = ?AUTO_6157 ?AUTO_6154 ) ) ( not ( = ?AUTO_6155 ?AUTO_6154 ) ) ( not ( = ?AUTO_6156 ?AUTO_6154 ) ) ( ON ?AUTO_6154 ?AUTO_6152 ) ( CLEAR ?AUTO_6154 ) ( ON ?AUTO_6157 ?AUTO_6156 ) ( CLEAR ?AUTO_6157 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6157 ?AUTO_6156 )
      ( MAKE-ON ?AUTO_6151 ?AUTO_6152 )
      ( MAKE-ON-VERIFY ?AUTO_6151 ?AUTO_6152 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6160 - BLOCK
      ?AUTO_6161 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6160 ) ( CLEAR ?AUTO_6161 ) ( not ( = ?AUTO_6160 ?AUTO_6161 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_6160 ?AUTO_6161 )
      ( MAKE-ON-VERIFY ?AUTO_6160 ?AUTO_6161 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6162 - BLOCK
      ?AUTO_6163 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6163 ) ( not ( = ?AUTO_6162 ?AUTO_6163 ) ) ( ON-TABLE ?AUTO_6162 ) ( CLEAR ?AUTO_6162 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_6162 )
      ( MAKE-ON ?AUTO_6162 ?AUTO_6163 )
      ( MAKE-ON-VERIFY ?AUTO_6162 ?AUTO_6163 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6164 - BLOCK
      ?AUTO_6165 - BLOCK
    )
    :vars
    (
      ?AUTO_6166 - BLOCK
      ?AUTO_6167 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6165 ) ( not ( = ?AUTO_6164 ?AUTO_6165 ) ) ( ON-TABLE ?AUTO_6164 ) ( CLEAR ?AUTO_6164 ) ( HOLDING ?AUTO_6166 ) ( CLEAR ?AUTO_6167 ) ( not ( = ?AUTO_6164 ?AUTO_6166 ) ) ( not ( = ?AUTO_6164 ?AUTO_6167 ) ) ( not ( = ?AUTO_6165 ?AUTO_6166 ) ) ( not ( = ?AUTO_6165 ?AUTO_6167 ) ) ( not ( = ?AUTO_6166 ?AUTO_6167 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_6166 ?AUTO_6167 )
      ( MAKE-ON ?AUTO_6164 ?AUTO_6165 )
      ( MAKE-ON-VERIFY ?AUTO_6164 ?AUTO_6165 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6168 - BLOCK
      ?AUTO_6169 - BLOCK
    )
    :vars
    (
      ?AUTO_6170 - BLOCK
      ?AUTO_6171 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6168 ?AUTO_6169 ) ) ( ON-TABLE ?AUTO_6168 ) ( CLEAR ?AUTO_6168 ) ( CLEAR ?AUTO_6170 ) ( not ( = ?AUTO_6168 ?AUTO_6171 ) ) ( not ( = ?AUTO_6168 ?AUTO_6170 ) ) ( not ( = ?AUTO_6169 ?AUTO_6171 ) ) ( not ( = ?AUTO_6169 ?AUTO_6170 ) ) ( not ( = ?AUTO_6171 ?AUTO_6170 ) ) ( ON ?AUTO_6171 ?AUTO_6169 ) ( CLEAR ?AUTO_6171 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6171 ?AUTO_6169 )
      ( MAKE-ON ?AUTO_6168 ?AUTO_6169 )
      ( MAKE-ON-VERIFY ?AUTO_6168 ?AUTO_6169 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6172 - BLOCK
      ?AUTO_6173 - BLOCK
    )
    :vars
    (
      ?AUTO_6174 - BLOCK
      ?AUTO_6175 - BLOCK
      ?AUTO_6176 - BLOCK
      ?AUTO_6177 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6172 ?AUTO_6173 ) ) ( ON-TABLE ?AUTO_6172 ) ( CLEAR ?AUTO_6172 ) ( CLEAR ?AUTO_6174 ) ( not ( = ?AUTO_6172 ?AUTO_6175 ) ) ( not ( = ?AUTO_6172 ?AUTO_6174 ) ) ( not ( = ?AUTO_6173 ?AUTO_6175 ) ) ( not ( = ?AUTO_6173 ?AUTO_6174 ) ) ( not ( = ?AUTO_6175 ?AUTO_6174 ) ) ( ON ?AUTO_6175 ?AUTO_6173 ) ( CLEAR ?AUTO_6175 ) ( HOLDING ?AUTO_6176 ) ( CLEAR ?AUTO_6177 ) ( not ( = ?AUTO_6172 ?AUTO_6176 ) ) ( not ( = ?AUTO_6172 ?AUTO_6177 ) ) ( not ( = ?AUTO_6173 ?AUTO_6176 ) ) ( not ( = ?AUTO_6173 ?AUTO_6177 ) ) ( not ( = ?AUTO_6174 ?AUTO_6176 ) ) ( not ( = ?AUTO_6174 ?AUTO_6177 ) ) ( not ( = ?AUTO_6175 ?AUTO_6176 ) ) ( not ( = ?AUTO_6175 ?AUTO_6177 ) ) ( not ( = ?AUTO_6176 ?AUTO_6177 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_6176 ?AUTO_6177 )
      ( MAKE-ON ?AUTO_6172 ?AUTO_6173 )
      ( MAKE-ON-VERIFY ?AUTO_6172 ?AUTO_6173 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6178 - BLOCK
      ?AUTO_6179 - BLOCK
    )
    :vars
    (
      ?AUTO_6181 - BLOCK
      ?AUTO_6180 - BLOCK
      ?AUTO_6183 - BLOCK
      ?AUTO_6182 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6178 ?AUTO_6179 ) ) ( ON-TABLE ?AUTO_6178 ) ( CLEAR ?AUTO_6178 ) ( CLEAR ?AUTO_6181 ) ( not ( = ?AUTO_6178 ?AUTO_6180 ) ) ( not ( = ?AUTO_6178 ?AUTO_6181 ) ) ( not ( = ?AUTO_6179 ?AUTO_6180 ) ) ( not ( = ?AUTO_6179 ?AUTO_6181 ) ) ( not ( = ?AUTO_6180 ?AUTO_6181 ) ) ( ON ?AUTO_6180 ?AUTO_6179 ) ( CLEAR ?AUTO_6183 ) ( not ( = ?AUTO_6178 ?AUTO_6182 ) ) ( not ( = ?AUTO_6178 ?AUTO_6183 ) ) ( not ( = ?AUTO_6179 ?AUTO_6182 ) ) ( not ( = ?AUTO_6179 ?AUTO_6183 ) ) ( not ( = ?AUTO_6181 ?AUTO_6182 ) ) ( not ( = ?AUTO_6181 ?AUTO_6183 ) ) ( not ( = ?AUTO_6180 ?AUTO_6182 ) ) ( not ( = ?AUTO_6180 ?AUTO_6183 ) ) ( not ( = ?AUTO_6182 ?AUTO_6183 ) ) ( ON ?AUTO_6182 ?AUTO_6180 ) ( CLEAR ?AUTO_6182 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6182 ?AUTO_6180 )
      ( MAKE-ON ?AUTO_6178 ?AUTO_6179 )
      ( MAKE-ON-VERIFY ?AUTO_6178 ?AUTO_6179 ) )
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
      ?AUTO_6189 - BLOCK
      ?AUTO_6187 - BLOCK
      ?AUTO_6188 - BLOCK
      ?AUTO_6190 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6184 ?AUTO_6185 ) ) ( ON-TABLE ?AUTO_6184 ) ( CLEAR ?AUTO_6184 ) ( CLEAR ?AUTO_6186 ) ( not ( = ?AUTO_6184 ?AUTO_6189 ) ) ( not ( = ?AUTO_6184 ?AUTO_6186 ) ) ( not ( = ?AUTO_6185 ?AUTO_6189 ) ) ( not ( = ?AUTO_6185 ?AUTO_6186 ) ) ( not ( = ?AUTO_6189 ?AUTO_6186 ) ) ( ON ?AUTO_6189 ?AUTO_6185 ) ( CLEAR ?AUTO_6187 ) ( not ( = ?AUTO_6184 ?AUTO_6188 ) ) ( not ( = ?AUTO_6184 ?AUTO_6187 ) ) ( not ( = ?AUTO_6185 ?AUTO_6188 ) ) ( not ( = ?AUTO_6185 ?AUTO_6187 ) ) ( not ( = ?AUTO_6186 ?AUTO_6188 ) ) ( not ( = ?AUTO_6186 ?AUTO_6187 ) ) ( not ( = ?AUTO_6189 ?AUTO_6188 ) ) ( not ( = ?AUTO_6189 ?AUTO_6187 ) ) ( not ( = ?AUTO_6188 ?AUTO_6187 ) ) ( ON ?AUTO_6188 ?AUTO_6189 ) ( CLEAR ?AUTO_6188 ) ( HOLDING ?AUTO_6190 ) ( not ( = ?AUTO_6184 ?AUTO_6190 ) ) ( not ( = ?AUTO_6185 ?AUTO_6190 ) ) ( not ( = ?AUTO_6186 ?AUTO_6190 ) ) ( not ( = ?AUTO_6189 ?AUTO_6190 ) ) ( not ( = ?AUTO_6187 ?AUTO_6190 ) ) ( not ( = ?AUTO_6188 ?AUTO_6190 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6190 )
      ( MAKE-ON ?AUTO_6184 ?AUTO_6185 )
      ( MAKE-ON-VERIFY ?AUTO_6184 ?AUTO_6185 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6191 - BLOCK
      ?AUTO_6192 - BLOCK
    )
    :vars
    (
      ?AUTO_6195 - BLOCK
      ?AUTO_6194 - BLOCK
      ?AUTO_6193 - BLOCK
      ?AUTO_6196 - BLOCK
      ?AUTO_6197 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6191 ?AUTO_6192 ) ) ( ON-TABLE ?AUTO_6191 ) ( CLEAR ?AUTO_6191 ) ( CLEAR ?AUTO_6195 ) ( not ( = ?AUTO_6191 ?AUTO_6194 ) ) ( not ( = ?AUTO_6191 ?AUTO_6195 ) ) ( not ( = ?AUTO_6192 ?AUTO_6194 ) ) ( not ( = ?AUTO_6192 ?AUTO_6195 ) ) ( not ( = ?AUTO_6194 ?AUTO_6195 ) ) ( ON ?AUTO_6194 ?AUTO_6192 ) ( CLEAR ?AUTO_6193 ) ( not ( = ?AUTO_6191 ?AUTO_6196 ) ) ( not ( = ?AUTO_6191 ?AUTO_6193 ) ) ( not ( = ?AUTO_6192 ?AUTO_6196 ) ) ( not ( = ?AUTO_6192 ?AUTO_6193 ) ) ( not ( = ?AUTO_6195 ?AUTO_6196 ) ) ( not ( = ?AUTO_6195 ?AUTO_6193 ) ) ( not ( = ?AUTO_6194 ?AUTO_6196 ) ) ( not ( = ?AUTO_6194 ?AUTO_6193 ) ) ( not ( = ?AUTO_6196 ?AUTO_6193 ) ) ( ON ?AUTO_6196 ?AUTO_6194 ) ( not ( = ?AUTO_6191 ?AUTO_6197 ) ) ( not ( = ?AUTO_6192 ?AUTO_6197 ) ) ( not ( = ?AUTO_6195 ?AUTO_6197 ) ) ( not ( = ?AUTO_6194 ?AUTO_6197 ) ) ( not ( = ?AUTO_6193 ?AUTO_6197 ) ) ( not ( = ?AUTO_6196 ?AUTO_6197 ) ) ( ON ?AUTO_6197 ?AUTO_6196 ) ( CLEAR ?AUTO_6197 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6197 ?AUTO_6196 )
      ( MAKE-ON ?AUTO_6191 ?AUTO_6192 )
      ( MAKE-ON-VERIFY ?AUTO_6191 ?AUTO_6192 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6198 - BLOCK
      ?AUTO_6199 - BLOCK
    )
    :vars
    (
      ?AUTO_6201 - BLOCK
      ?AUTO_6200 - BLOCK
      ?AUTO_6202 - BLOCK
      ?AUTO_6204 - BLOCK
      ?AUTO_6203 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6198 ?AUTO_6199 ) ) ( ON-TABLE ?AUTO_6198 ) ( CLEAR ?AUTO_6198 ) ( not ( = ?AUTO_6198 ?AUTO_6201 ) ) ( not ( = ?AUTO_6198 ?AUTO_6200 ) ) ( not ( = ?AUTO_6199 ?AUTO_6201 ) ) ( not ( = ?AUTO_6199 ?AUTO_6200 ) ) ( not ( = ?AUTO_6201 ?AUTO_6200 ) ) ( ON ?AUTO_6201 ?AUTO_6199 ) ( CLEAR ?AUTO_6202 ) ( not ( = ?AUTO_6198 ?AUTO_6204 ) ) ( not ( = ?AUTO_6198 ?AUTO_6202 ) ) ( not ( = ?AUTO_6199 ?AUTO_6204 ) ) ( not ( = ?AUTO_6199 ?AUTO_6202 ) ) ( not ( = ?AUTO_6200 ?AUTO_6204 ) ) ( not ( = ?AUTO_6200 ?AUTO_6202 ) ) ( not ( = ?AUTO_6201 ?AUTO_6204 ) ) ( not ( = ?AUTO_6201 ?AUTO_6202 ) ) ( not ( = ?AUTO_6204 ?AUTO_6202 ) ) ( ON ?AUTO_6204 ?AUTO_6201 ) ( not ( = ?AUTO_6198 ?AUTO_6203 ) ) ( not ( = ?AUTO_6199 ?AUTO_6203 ) ) ( not ( = ?AUTO_6200 ?AUTO_6203 ) ) ( not ( = ?AUTO_6201 ?AUTO_6203 ) ) ( not ( = ?AUTO_6202 ?AUTO_6203 ) ) ( not ( = ?AUTO_6204 ?AUTO_6203 ) ) ( ON ?AUTO_6203 ?AUTO_6204 ) ( CLEAR ?AUTO_6203 ) ( HOLDING ?AUTO_6200 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6200 )
      ( MAKE-ON ?AUTO_6198 ?AUTO_6199 )
      ( MAKE-ON-VERIFY ?AUTO_6198 ?AUTO_6199 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6205 - BLOCK
      ?AUTO_6206 - BLOCK
    )
    :vars
    (
      ?AUTO_6209 - BLOCK
      ?AUTO_6207 - BLOCK
      ?AUTO_6211 - BLOCK
      ?AUTO_6210 - BLOCK
      ?AUTO_6208 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6205 ?AUTO_6206 ) ) ( ON-TABLE ?AUTO_6205 ) ( not ( = ?AUTO_6205 ?AUTO_6209 ) ) ( not ( = ?AUTO_6205 ?AUTO_6207 ) ) ( not ( = ?AUTO_6206 ?AUTO_6209 ) ) ( not ( = ?AUTO_6206 ?AUTO_6207 ) ) ( not ( = ?AUTO_6209 ?AUTO_6207 ) ) ( ON ?AUTO_6209 ?AUTO_6206 ) ( CLEAR ?AUTO_6211 ) ( not ( = ?AUTO_6205 ?AUTO_6210 ) ) ( not ( = ?AUTO_6205 ?AUTO_6211 ) ) ( not ( = ?AUTO_6206 ?AUTO_6210 ) ) ( not ( = ?AUTO_6206 ?AUTO_6211 ) ) ( not ( = ?AUTO_6207 ?AUTO_6210 ) ) ( not ( = ?AUTO_6207 ?AUTO_6211 ) ) ( not ( = ?AUTO_6209 ?AUTO_6210 ) ) ( not ( = ?AUTO_6209 ?AUTO_6211 ) ) ( not ( = ?AUTO_6210 ?AUTO_6211 ) ) ( ON ?AUTO_6210 ?AUTO_6209 ) ( not ( = ?AUTO_6205 ?AUTO_6208 ) ) ( not ( = ?AUTO_6206 ?AUTO_6208 ) ) ( not ( = ?AUTO_6207 ?AUTO_6208 ) ) ( not ( = ?AUTO_6209 ?AUTO_6208 ) ) ( not ( = ?AUTO_6211 ?AUTO_6208 ) ) ( not ( = ?AUTO_6210 ?AUTO_6208 ) ) ( ON ?AUTO_6208 ?AUTO_6210 ) ( CLEAR ?AUTO_6208 ) ( ON ?AUTO_6207 ?AUTO_6205 ) ( CLEAR ?AUTO_6207 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6207 ?AUTO_6205 )
      ( MAKE-ON ?AUTO_6205 ?AUTO_6206 )
      ( MAKE-ON-VERIFY ?AUTO_6205 ?AUTO_6206 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6212 - BLOCK
      ?AUTO_6213 - BLOCK
    )
    :vars
    (
      ?AUTO_6217 - BLOCK
      ?AUTO_6215 - BLOCK
      ?AUTO_6218 - BLOCK
      ?AUTO_6216 - BLOCK
      ?AUTO_6214 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6212 ?AUTO_6213 ) ) ( ON-TABLE ?AUTO_6212 ) ( not ( = ?AUTO_6212 ?AUTO_6217 ) ) ( not ( = ?AUTO_6212 ?AUTO_6215 ) ) ( not ( = ?AUTO_6213 ?AUTO_6217 ) ) ( not ( = ?AUTO_6213 ?AUTO_6215 ) ) ( not ( = ?AUTO_6217 ?AUTO_6215 ) ) ( ON ?AUTO_6217 ?AUTO_6213 ) ( not ( = ?AUTO_6212 ?AUTO_6218 ) ) ( not ( = ?AUTO_6212 ?AUTO_6216 ) ) ( not ( = ?AUTO_6213 ?AUTO_6218 ) ) ( not ( = ?AUTO_6213 ?AUTO_6216 ) ) ( not ( = ?AUTO_6215 ?AUTO_6218 ) ) ( not ( = ?AUTO_6215 ?AUTO_6216 ) ) ( not ( = ?AUTO_6217 ?AUTO_6218 ) ) ( not ( = ?AUTO_6217 ?AUTO_6216 ) ) ( not ( = ?AUTO_6218 ?AUTO_6216 ) ) ( ON ?AUTO_6218 ?AUTO_6217 ) ( not ( = ?AUTO_6212 ?AUTO_6214 ) ) ( not ( = ?AUTO_6213 ?AUTO_6214 ) ) ( not ( = ?AUTO_6215 ?AUTO_6214 ) ) ( not ( = ?AUTO_6217 ?AUTO_6214 ) ) ( not ( = ?AUTO_6216 ?AUTO_6214 ) ) ( not ( = ?AUTO_6218 ?AUTO_6214 ) ) ( ON ?AUTO_6214 ?AUTO_6218 ) ( CLEAR ?AUTO_6214 ) ( ON ?AUTO_6215 ?AUTO_6212 ) ( CLEAR ?AUTO_6215 ) ( HOLDING ?AUTO_6216 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6216 )
      ( MAKE-ON ?AUTO_6212 ?AUTO_6213 )
      ( MAKE-ON-VERIFY ?AUTO_6212 ?AUTO_6213 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6219 - BLOCK
      ?AUTO_6220 - BLOCK
    )
    :vars
    (
      ?AUTO_6224 - BLOCK
      ?AUTO_6222 - BLOCK
      ?AUTO_6223 - BLOCK
      ?AUTO_6225 - BLOCK
      ?AUTO_6221 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6219 ?AUTO_6220 ) ) ( ON-TABLE ?AUTO_6219 ) ( not ( = ?AUTO_6219 ?AUTO_6224 ) ) ( not ( = ?AUTO_6219 ?AUTO_6222 ) ) ( not ( = ?AUTO_6220 ?AUTO_6224 ) ) ( not ( = ?AUTO_6220 ?AUTO_6222 ) ) ( not ( = ?AUTO_6224 ?AUTO_6222 ) ) ( ON ?AUTO_6224 ?AUTO_6220 ) ( not ( = ?AUTO_6219 ?AUTO_6223 ) ) ( not ( = ?AUTO_6219 ?AUTO_6225 ) ) ( not ( = ?AUTO_6220 ?AUTO_6223 ) ) ( not ( = ?AUTO_6220 ?AUTO_6225 ) ) ( not ( = ?AUTO_6222 ?AUTO_6223 ) ) ( not ( = ?AUTO_6222 ?AUTO_6225 ) ) ( not ( = ?AUTO_6224 ?AUTO_6223 ) ) ( not ( = ?AUTO_6224 ?AUTO_6225 ) ) ( not ( = ?AUTO_6223 ?AUTO_6225 ) ) ( ON ?AUTO_6223 ?AUTO_6224 ) ( not ( = ?AUTO_6219 ?AUTO_6221 ) ) ( not ( = ?AUTO_6220 ?AUTO_6221 ) ) ( not ( = ?AUTO_6222 ?AUTO_6221 ) ) ( not ( = ?AUTO_6224 ?AUTO_6221 ) ) ( not ( = ?AUTO_6225 ?AUTO_6221 ) ) ( not ( = ?AUTO_6223 ?AUTO_6221 ) ) ( ON ?AUTO_6221 ?AUTO_6223 ) ( CLEAR ?AUTO_6221 ) ( ON ?AUTO_6222 ?AUTO_6219 ) ( ON ?AUTO_6225 ?AUTO_6222 ) ( CLEAR ?AUTO_6225 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6225 ?AUTO_6222 )
      ( MAKE-ON ?AUTO_6219 ?AUTO_6220 )
      ( MAKE-ON-VERIFY ?AUTO_6219 ?AUTO_6220 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6226 - BLOCK
      ?AUTO_6227 - BLOCK
    )
    :vars
    (
      ?AUTO_6230 - BLOCK
      ?AUTO_6229 - BLOCK
      ?AUTO_6232 - BLOCK
      ?AUTO_6231 - BLOCK
      ?AUTO_6228 - BLOCK
      ?AUTO_6233 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6226 ?AUTO_6227 ) ) ( ON-TABLE ?AUTO_6226 ) ( not ( = ?AUTO_6226 ?AUTO_6230 ) ) ( not ( = ?AUTO_6226 ?AUTO_6229 ) ) ( not ( = ?AUTO_6227 ?AUTO_6230 ) ) ( not ( = ?AUTO_6227 ?AUTO_6229 ) ) ( not ( = ?AUTO_6230 ?AUTO_6229 ) ) ( ON ?AUTO_6230 ?AUTO_6227 ) ( not ( = ?AUTO_6226 ?AUTO_6232 ) ) ( not ( = ?AUTO_6226 ?AUTO_6231 ) ) ( not ( = ?AUTO_6227 ?AUTO_6232 ) ) ( not ( = ?AUTO_6227 ?AUTO_6231 ) ) ( not ( = ?AUTO_6229 ?AUTO_6232 ) ) ( not ( = ?AUTO_6229 ?AUTO_6231 ) ) ( not ( = ?AUTO_6230 ?AUTO_6232 ) ) ( not ( = ?AUTO_6230 ?AUTO_6231 ) ) ( not ( = ?AUTO_6232 ?AUTO_6231 ) ) ( ON ?AUTO_6232 ?AUTO_6230 ) ( not ( = ?AUTO_6226 ?AUTO_6228 ) ) ( not ( = ?AUTO_6227 ?AUTO_6228 ) ) ( not ( = ?AUTO_6229 ?AUTO_6228 ) ) ( not ( = ?AUTO_6230 ?AUTO_6228 ) ) ( not ( = ?AUTO_6231 ?AUTO_6228 ) ) ( not ( = ?AUTO_6232 ?AUTO_6228 ) ) ( ON ?AUTO_6228 ?AUTO_6232 ) ( CLEAR ?AUTO_6228 ) ( ON ?AUTO_6229 ?AUTO_6226 ) ( ON ?AUTO_6231 ?AUTO_6229 ) ( CLEAR ?AUTO_6231 ) ( HOLDING ?AUTO_6233 ) ( not ( = ?AUTO_6226 ?AUTO_6233 ) ) ( not ( = ?AUTO_6227 ?AUTO_6233 ) ) ( not ( = ?AUTO_6230 ?AUTO_6233 ) ) ( not ( = ?AUTO_6229 ?AUTO_6233 ) ) ( not ( = ?AUTO_6232 ?AUTO_6233 ) ) ( not ( = ?AUTO_6231 ?AUTO_6233 ) ) ( not ( = ?AUTO_6228 ?AUTO_6233 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6233 )
      ( MAKE-ON ?AUTO_6226 ?AUTO_6227 )
      ( MAKE-ON-VERIFY ?AUTO_6226 ?AUTO_6227 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6234 - BLOCK
      ?AUTO_6235 - BLOCK
    )
    :vars
    (
      ?AUTO_6241 - BLOCK
      ?AUTO_6236 - BLOCK
      ?AUTO_6239 - BLOCK
      ?AUTO_6240 - BLOCK
      ?AUTO_6237 - BLOCK
      ?AUTO_6238 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6234 ?AUTO_6235 ) ) ( ON-TABLE ?AUTO_6234 ) ( not ( = ?AUTO_6234 ?AUTO_6241 ) ) ( not ( = ?AUTO_6234 ?AUTO_6236 ) ) ( not ( = ?AUTO_6235 ?AUTO_6241 ) ) ( not ( = ?AUTO_6235 ?AUTO_6236 ) ) ( not ( = ?AUTO_6241 ?AUTO_6236 ) ) ( ON ?AUTO_6241 ?AUTO_6235 ) ( not ( = ?AUTO_6234 ?AUTO_6239 ) ) ( not ( = ?AUTO_6234 ?AUTO_6240 ) ) ( not ( = ?AUTO_6235 ?AUTO_6239 ) ) ( not ( = ?AUTO_6235 ?AUTO_6240 ) ) ( not ( = ?AUTO_6236 ?AUTO_6239 ) ) ( not ( = ?AUTO_6236 ?AUTO_6240 ) ) ( not ( = ?AUTO_6241 ?AUTO_6239 ) ) ( not ( = ?AUTO_6241 ?AUTO_6240 ) ) ( not ( = ?AUTO_6239 ?AUTO_6240 ) ) ( ON ?AUTO_6239 ?AUTO_6241 ) ( not ( = ?AUTO_6234 ?AUTO_6237 ) ) ( not ( = ?AUTO_6235 ?AUTO_6237 ) ) ( not ( = ?AUTO_6236 ?AUTO_6237 ) ) ( not ( = ?AUTO_6241 ?AUTO_6237 ) ) ( not ( = ?AUTO_6240 ?AUTO_6237 ) ) ( not ( = ?AUTO_6239 ?AUTO_6237 ) ) ( ON ?AUTO_6237 ?AUTO_6239 ) ( ON ?AUTO_6236 ?AUTO_6234 ) ( ON ?AUTO_6240 ?AUTO_6236 ) ( CLEAR ?AUTO_6240 ) ( not ( = ?AUTO_6234 ?AUTO_6238 ) ) ( not ( = ?AUTO_6235 ?AUTO_6238 ) ) ( not ( = ?AUTO_6241 ?AUTO_6238 ) ) ( not ( = ?AUTO_6236 ?AUTO_6238 ) ) ( not ( = ?AUTO_6239 ?AUTO_6238 ) ) ( not ( = ?AUTO_6240 ?AUTO_6238 ) ) ( not ( = ?AUTO_6237 ?AUTO_6238 ) ) ( ON ?AUTO_6238 ?AUTO_6237 ) ( CLEAR ?AUTO_6238 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6238 ?AUTO_6237 )
      ( MAKE-ON ?AUTO_6234 ?AUTO_6235 )
      ( MAKE-ON-VERIFY ?AUTO_6234 ?AUTO_6235 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6243 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6243 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6243 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6243 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6244 - BLOCK
    )
    :vars
    (
      ?AUTO_6245 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6244 ?AUTO_6245 ) ( CLEAR ?AUTO_6244 ) ( HAND-EMPTY ) ( not ( = ?AUTO_6244 ?AUTO_6245 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6244 ?AUTO_6245 )
      ( MAKE-ON-TABLE ?AUTO_6244 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6244 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6246 - BLOCK
    )
    :vars
    (
      ?AUTO_6247 - BLOCK
      ?AUTO_6248 - BLOCK
      ?AUTO_6249 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6246 ?AUTO_6247 ) ( CLEAR ?AUTO_6246 ) ( not ( = ?AUTO_6246 ?AUTO_6247 ) ) ( HOLDING ?AUTO_6248 ) ( CLEAR ?AUTO_6249 ) ( not ( = ?AUTO_6246 ?AUTO_6248 ) ) ( not ( = ?AUTO_6246 ?AUTO_6249 ) ) ( not ( = ?AUTO_6247 ?AUTO_6248 ) ) ( not ( = ?AUTO_6247 ?AUTO_6249 ) ) ( not ( = ?AUTO_6248 ?AUTO_6249 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_6248 ?AUTO_6249 )
      ( MAKE-ON-TABLE ?AUTO_6246 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6246 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6256 - BLOCK
    )
    :vars
    (
      ?AUTO_6257 - BLOCK
      ?AUTO_6259 - BLOCK
      ?AUTO_6258 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6256 ?AUTO_6257 ) ( not ( = ?AUTO_6256 ?AUTO_6257 ) ) ( CLEAR ?AUTO_6259 ) ( not ( = ?AUTO_6256 ?AUTO_6258 ) ) ( not ( = ?AUTO_6256 ?AUTO_6259 ) ) ( not ( = ?AUTO_6257 ?AUTO_6258 ) ) ( not ( = ?AUTO_6257 ?AUTO_6259 ) ) ( not ( = ?AUTO_6258 ?AUTO_6259 ) ) ( ON ?AUTO_6258 ?AUTO_6256 ) ( CLEAR ?AUTO_6258 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6258 ?AUTO_6256 )
      ( MAKE-ON-TABLE ?AUTO_6256 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6256 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6260 - BLOCK
    )
    :vars
    (
      ?AUTO_6262 - BLOCK
      ?AUTO_6263 - BLOCK
      ?AUTO_6261 - BLOCK
      ?AUTO_6264 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6260 ?AUTO_6262 ) ( not ( = ?AUTO_6260 ?AUTO_6262 ) ) ( CLEAR ?AUTO_6263 ) ( not ( = ?AUTO_6260 ?AUTO_6261 ) ) ( not ( = ?AUTO_6260 ?AUTO_6263 ) ) ( not ( = ?AUTO_6262 ?AUTO_6261 ) ) ( not ( = ?AUTO_6262 ?AUTO_6263 ) ) ( not ( = ?AUTO_6261 ?AUTO_6263 ) ) ( ON ?AUTO_6261 ?AUTO_6260 ) ( CLEAR ?AUTO_6261 ) ( HOLDING ?AUTO_6264 ) ( not ( = ?AUTO_6260 ?AUTO_6264 ) ) ( not ( = ?AUTO_6262 ?AUTO_6264 ) ) ( not ( = ?AUTO_6263 ?AUTO_6264 ) ) ( not ( = ?AUTO_6261 ?AUTO_6264 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6264 )
      ( MAKE-ON-TABLE ?AUTO_6260 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6260 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6269 - BLOCK
    )
    :vars
    (
      ?AUTO_6271 - BLOCK
      ?AUTO_6272 - BLOCK
      ?AUTO_6270 - BLOCK
      ?AUTO_6273 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6269 ?AUTO_6271 ) ( not ( = ?AUTO_6269 ?AUTO_6271 ) ) ( CLEAR ?AUTO_6272 ) ( not ( = ?AUTO_6269 ?AUTO_6270 ) ) ( not ( = ?AUTO_6269 ?AUTO_6272 ) ) ( not ( = ?AUTO_6271 ?AUTO_6270 ) ) ( not ( = ?AUTO_6271 ?AUTO_6272 ) ) ( not ( = ?AUTO_6270 ?AUTO_6272 ) ) ( ON ?AUTO_6270 ?AUTO_6269 ) ( not ( = ?AUTO_6269 ?AUTO_6273 ) ) ( not ( = ?AUTO_6271 ?AUTO_6273 ) ) ( not ( = ?AUTO_6272 ?AUTO_6273 ) ) ( not ( = ?AUTO_6270 ?AUTO_6273 ) ) ( ON ?AUTO_6273 ?AUTO_6270 ) ( CLEAR ?AUTO_6273 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6273 ?AUTO_6270 )
      ( MAKE-ON-TABLE ?AUTO_6269 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6269 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6276 - BLOCK
      ?AUTO_6277 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6276 ) ( CLEAR ?AUTO_6277 ) ( not ( = ?AUTO_6276 ?AUTO_6277 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_6276 ?AUTO_6277 )
      ( MAKE-ON-VERIFY ?AUTO_6276 ?AUTO_6277 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6278 - BLOCK
      ?AUTO_6279 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6279 ) ( not ( = ?AUTO_6278 ?AUTO_6279 ) ) ( ON-TABLE ?AUTO_6278 ) ( CLEAR ?AUTO_6278 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_6278 )
      ( MAKE-ON ?AUTO_6278 ?AUTO_6279 )
      ( MAKE-ON-VERIFY ?AUTO_6278 ?AUTO_6279 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6280 - BLOCK
      ?AUTO_6281 - BLOCK
    )
    :vars
    (
      ?AUTO_6282 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6281 ) ( not ( = ?AUTO_6280 ?AUTO_6281 ) ) ( ON-TABLE ?AUTO_6280 ) ( CLEAR ?AUTO_6280 ) ( HOLDING ?AUTO_6282 ) ( not ( = ?AUTO_6280 ?AUTO_6282 ) ) ( not ( = ?AUTO_6281 ?AUTO_6282 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6282 )
      ( MAKE-ON ?AUTO_6280 ?AUTO_6281 )
      ( MAKE-ON-VERIFY ?AUTO_6280 ?AUTO_6281 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6283 - BLOCK
      ?AUTO_6284 - BLOCK
    )
    :vars
    (
      ?AUTO_6285 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6284 ) ( not ( = ?AUTO_6283 ?AUTO_6284 ) ) ( ON-TABLE ?AUTO_6283 ) ( not ( = ?AUTO_6283 ?AUTO_6285 ) ) ( not ( = ?AUTO_6284 ?AUTO_6285 ) ) ( ON ?AUTO_6285 ?AUTO_6283 ) ( CLEAR ?AUTO_6285 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6285 ?AUTO_6283 )
      ( MAKE-ON ?AUTO_6283 ?AUTO_6284 )
      ( MAKE-ON-VERIFY ?AUTO_6283 ?AUTO_6284 ) )
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
      ?AUTO_6290 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6287 ) ( not ( = ?AUTO_6286 ?AUTO_6287 ) ) ( ON-TABLE ?AUTO_6286 ) ( not ( = ?AUTO_6286 ?AUTO_6288 ) ) ( not ( = ?AUTO_6287 ?AUTO_6288 ) ) ( ON ?AUTO_6288 ?AUTO_6286 ) ( CLEAR ?AUTO_6288 ) ( HOLDING ?AUTO_6289 ) ( CLEAR ?AUTO_6290 ) ( not ( = ?AUTO_6286 ?AUTO_6289 ) ) ( not ( = ?AUTO_6286 ?AUTO_6290 ) ) ( not ( = ?AUTO_6287 ?AUTO_6289 ) ) ( not ( = ?AUTO_6287 ?AUTO_6290 ) ) ( not ( = ?AUTO_6288 ?AUTO_6289 ) ) ( not ( = ?AUTO_6288 ?AUTO_6290 ) ) ( not ( = ?AUTO_6289 ?AUTO_6290 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_6289 ?AUTO_6290 )
      ( MAKE-ON ?AUTO_6286 ?AUTO_6287 )
      ( MAKE-ON-VERIFY ?AUTO_6286 ?AUTO_6287 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6293 - BLOCK
      ?AUTO_6294 - BLOCK
    )
    :vars
    (
      ?AUTO_6295 - BLOCK
      ?AUTO_6296 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6293 ?AUTO_6294 ) ) ( ON-TABLE ?AUTO_6293 ) ( not ( = ?AUTO_6293 ?AUTO_6295 ) ) ( not ( = ?AUTO_6294 ?AUTO_6295 ) ) ( ON ?AUTO_6295 ?AUTO_6293 ) ( CLEAR ?AUTO_6295 ) ( HOLDING ?AUTO_6294 ) ( CLEAR ?AUTO_6296 ) ( not ( = ?AUTO_6293 ?AUTO_6296 ) ) ( not ( = ?AUTO_6294 ?AUTO_6296 ) ) ( not ( = ?AUTO_6295 ?AUTO_6296 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_6294 ?AUTO_6296 )
      ( MAKE-ON ?AUTO_6293 ?AUTO_6294 )
      ( MAKE-ON-VERIFY ?AUTO_6293 ?AUTO_6294 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6311 - BLOCK
      ?AUTO_6312 - BLOCK
    )
    :vars
    (
      ?AUTO_6315 - BLOCK
      ?AUTO_6316 - BLOCK
      ?AUTO_6314 - BLOCK
      ?AUTO_6313 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6311 ?AUTO_6312 ) ) ( CLEAR ?AUTO_6315 ) ( not ( = ?AUTO_6311 ?AUTO_6316 ) ) ( not ( = ?AUTO_6311 ?AUTO_6315 ) ) ( not ( = ?AUTO_6312 ?AUTO_6316 ) ) ( not ( = ?AUTO_6312 ?AUTO_6315 ) ) ( not ( = ?AUTO_6316 ?AUTO_6315 ) ) ( ON ?AUTO_6316 ?AUTO_6312 ) ( CLEAR ?AUTO_6314 ) ( not ( = ?AUTO_6311 ?AUTO_6313 ) ) ( not ( = ?AUTO_6311 ?AUTO_6314 ) ) ( not ( = ?AUTO_6312 ?AUTO_6313 ) ) ( not ( = ?AUTO_6312 ?AUTO_6314 ) ) ( not ( = ?AUTO_6315 ?AUTO_6313 ) ) ( not ( = ?AUTO_6315 ?AUTO_6314 ) ) ( not ( = ?AUTO_6316 ?AUTO_6313 ) ) ( not ( = ?AUTO_6316 ?AUTO_6314 ) ) ( not ( = ?AUTO_6313 ?AUTO_6314 ) ) ( ON ?AUTO_6313 ?AUTO_6316 ) ( CLEAR ?AUTO_6313 ) ( HOLDING ?AUTO_6311 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6311 )
      ( MAKE-ON ?AUTO_6311 ?AUTO_6312 )
      ( MAKE-ON-VERIFY ?AUTO_6311 ?AUTO_6312 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6317 - BLOCK
      ?AUTO_6318 - BLOCK
    )
    :vars
    (
      ?AUTO_6322 - BLOCK
      ?AUTO_6321 - BLOCK
      ?AUTO_6320 - BLOCK
      ?AUTO_6319 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6317 ?AUTO_6318 ) ) ( not ( = ?AUTO_6317 ?AUTO_6322 ) ) ( not ( = ?AUTO_6317 ?AUTO_6321 ) ) ( not ( = ?AUTO_6318 ?AUTO_6322 ) ) ( not ( = ?AUTO_6318 ?AUTO_6321 ) ) ( not ( = ?AUTO_6322 ?AUTO_6321 ) ) ( ON ?AUTO_6322 ?AUTO_6318 ) ( CLEAR ?AUTO_6320 ) ( not ( = ?AUTO_6317 ?AUTO_6319 ) ) ( not ( = ?AUTO_6317 ?AUTO_6320 ) ) ( not ( = ?AUTO_6318 ?AUTO_6319 ) ) ( not ( = ?AUTO_6318 ?AUTO_6320 ) ) ( not ( = ?AUTO_6321 ?AUTO_6319 ) ) ( not ( = ?AUTO_6321 ?AUTO_6320 ) ) ( not ( = ?AUTO_6322 ?AUTO_6319 ) ) ( not ( = ?AUTO_6322 ?AUTO_6320 ) ) ( not ( = ?AUTO_6319 ?AUTO_6320 ) ) ( ON ?AUTO_6319 ?AUTO_6322 ) ( CLEAR ?AUTO_6319 ) ( ON ?AUTO_6317 ?AUTO_6321 ) ( CLEAR ?AUTO_6317 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6317 ?AUTO_6321 )
      ( MAKE-ON ?AUTO_6317 ?AUTO_6318 )
      ( MAKE-ON-VERIFY ?AUTO_6317 ?AUTO_6318 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6323 - BLOCK
      ?AUTO_6324 - BLOCK
    )
    :vars
    (
      ?AUTO_6328 - BLOCK
      ?AUTO_6327 - BLOCK
      ?AUTO_6325 - BLOCK
      ?AUTO_6326 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6323 ?AUTO_6324 ) ) ( not ( = ?AUTO_6323 ?AUTO_6328 ) ) ( not ( = ?AUTO_6323 ?AUTO_6327 ) ) ( not ( = ?AUTO_6324 ?AUTO_6328 ) ) ( not ( = ?AUTO_6324 ?AUTO_6327 ) ) ( not ( = ?AUTO_6328 ?AUTO_6327 ) ) ( ON ?AUTO_6328 ?AUTO_6324 ) ( not ( = ?AUTO_6323 ?AUTO_6325 ) ) ( not ( = ?AUTO_6323 ?AUTO_6326 ) ) ( not ( = ?AUTO_6324 ?AUTO_6325 ) ) ( not ( = ?AUTO_6324 ?AUTO_6326 ) ) ( not ( = ?AUTO_6327 ?AUTO_6325 ) ) ( not ( = ?AUTO_6327 ?AUTO_6326 ) ) ( not ( = ?AUTO_6328 ?AUTO_6325 ) ) ( not ( = ?AUTO_6328 ?AUTO_6326 ) ) ( not ( = ?AUTO_6325 ?AUTO_6326 ) ) ( ON ?AUTO_6325 ?AUTO_6328 ) ( CLEAR ?AUTO_6325 ) ( ON ?AUTO_6323 ?AUTO_6327 ) ( CLEAR ?AUTO_6323 ) ( HOLDING ?AUTO_6326 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6326 )
      ( MAKE-ON ?AUTO_6323 ?AUTO_6324 )
      ( MAKE-ON-VERIFY ?AUTO_6323 ?AUTO_6324 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6329 - BLOCK
      ?AUTO_6330 - BLOCK
    )
    :vars
    (
      ?AUTO_6334 - BLOCK
      ?AUTO_6333 - BLOCK
      ?AUTO_6332 - BLOCK
      ?AUTO_6331 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6329 ?AUTO_6330 ) ) ( not ( = ?AUTO_6329 ?AUTO_6334 ) ) ( not ( = ?AUTO_6329 ?AUTO_6333 ) ) ( not ( = ?AUTO_6330 ?AUTO_6334 ) ) ( not ( = ?AUTO_6330 ?AUTO_6333 ) ) ( not ( = ?AUTO_6334 ?AUTO_6333 ) ) ( ON ?AUTO_6334 ?AUTO_6330 ) ( not ( = ?AUTO_6329 ?AUTO_6332 ) ) ( not ( = ?AUTO_6329 ?AUTO_6331 ) ) ( not ( = ?AUTO_6330 ?AUTO_6332 ) ) ( not ( = ?AUTO_6330 ?AUTO_6331 ) ) ( not ( = ?AUTO_6333 ?AUTO_6332 ) ) ( not ( = ?AUTO_6333 ?AUTO_6331 ) ) ( not ( = ?AUTO_6334 ?AUTO_6332 ) ) ( not ( = ?AUTO_6334 ?AUTO_6331 ) ) ( not ( = ?AUTO_6332 ?AUTO_6331 ) ) ( ON ?AUTO_6332 ?AUTO_6334 ) ( ON ?AUTO_6329 ?AUTO_6333 ) ( CLEAR ?AUTO_6329 ) ( ON ?AUTO_6331 ?AUTO_6332 ) ( CLEAR ?AUTO_6331 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6331 ?AUTO_6332 )
      ( MAKE-ON ?AUTO_6329 ?AUTO_6330 )
      ( MAKE-ON-VERIFY ?AUTO_6329 ?AUTO_6330 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6337 - BLOCK
      ?AUTO_6338 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6337 ) ( CLEAR ?AUTO_6338 ) ( not ( = ?AUTO_6337 ?AUTO_6338 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_6337 ?AUTO_6338 )
      ( MAKE-ON-VERIFY ?AUTO_6337 ?AUTO_6338 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6339 - BLOCK
      ?AUTO_6340 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6340 ) ( not ( = ?AUTO_6339 ?AUTO_6340 ) ) ( ON-TABLE ?AUTO_6339 ) ( CLEAR ?AUTO_6339 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_6339 )
      ( MAKE-ON ?AUTO_6339 ?AUTO_6340 )
      ( MAKE-ON-VERIFY ?AUTO_6339 ?AUTO_6340 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6341 - BLOCK
      ?AUTO_6342 - BLOCK
    )
    :vars
    (
      ?AUTO_6343 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6341 ?AUTO_6342 ) ) ( ON-TABLE ?AUTO_6341 ) ( CLEAR ?AUTO_6341 ) ( HOLDING ?AUTO_6342 ) ( CLEAR ?AUTO_6343 ) ( not ( = ?AUTO_6341 ?AUTO_6343 ) ) ( not ( = ?AUTO_6342 ?AUTO_6343 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_6342 ?AUTO_6343 )
      ( MAKE-ON ?AUTO_6341 ?AUTO_6342 )
      ( MAKE-ON-VERIFY ?AUTO_6341 ?AUTO_6342 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6392 - BLOCK
      ?AUTO_6393 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6392 ) ( CLEAR ?AUTO_6393 ) ( not ( = ?AUTO_6392 ?AUTO_6393 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_6392 ?AUTO_6393 )
      ( MAKE-ON-VERIFY ?AUTO_6392 ?AUTO_6393 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6394 - BLOCK
      ?AUTO_6395 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6395 ) ( not ( = ?AUTO_6394 ?AUTO_6395 ) ) ( ON-TABLE ?AUTO_6394 ) ( CLEAR ?AUTO_6394 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_6394 )
      ( MAKE-ON ?AUTO_6394 ?AUTO_6395 )
      ( MAKE-ON-VERIFY ?AUTO_6394 ?AUTO_6395 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6396 - BLOCK
      ?AUTO_6397 - BLOCK
    )
    :vars
    (
      ?AUTO_6398 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6396 ?AUTO_6397 ) ) ( ON-TABLE ?AUTO_6396 ) ( CLEAR ?AUTO_6396 ) ( HOLDING ?AUTO_6397 ) ( CLEAR ?AUTO_6398 ) ( not ( = ?AUTO_6396 ?AUTO_6398 ) ) ( not ( = ?AUTO_6397 ?AUTO_6398 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_6397 ?AUTO_6398 )
      ( MAKE-ON ?AUTO_6396 ?AUTO_6397 )
      ( MAKE-ON-VERIFY ?AUTO_6396 ?AUTO_6397 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6401 - BLOCK
      ?AUTO_6402 - BLOCK
    )
    :vars
    (
      ?AUTO_6403 - BLOCK
      ?AUTO_6404 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6402 ) ( not ( = ?AUTO_6401 ?AUTO_6402 ) ) ( ON-TABLE ?AUTO_6401 ) ( CLEAR ?AUTO_6401 ) ( HOLDING ?AUTO_6403 ) ( CLEAR ?AUTO_6404 ) ( not ( = ?AUTO_6401 ?AUTO_6403 ) ) ( not ( = ?AUTO_6401 ?AUTO_6404 ) ) ( not ( = ?AUTO_6402 ?AUTO_6403 ) ) ( not ( = ?AUTO_6402 ?AUTO_6404 ) ) ( not ( = ?AUTO_6403 ?AUTO_6404 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_6403 ?AUTO_6404 )
      ( MAKE-ON ?AUTO_6401 ?AUTO_6402 )
      ( MAKE-ON-VERIFY ?AUTO_6401 ?AUTO_6402 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6406 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6406 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6406 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6406 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6407 - BLOCK
    )
    :vars
    (
      ?AUTO_6408 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6407 ?AUTO_6408 ) ( CLEAR ?AUTO_6407 ) ( HAND-EMPTY ) ( not ( = ?AUTO_6407 ?AUTO_6408 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6407 ?AUTO_6408 )
      ( MAKE-ON-TABLE ?AUTO_6407 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6407 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6411 - BLOCK
      ?AUTO_6412 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6411 ) ( CLEAR ?AUTO_6412 ) ( not ( = ?AUTO_6411 ?AUTO_6412 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_6411 ?AUTO_6412 )
      ( MAKE-ON-VERIFY ?AUTO_6411 ?AUTO_6412 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6413 - BLOCK
      ?AUTO_6414 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6414 ) ( not ( = ?AUTO_6413 ?AUTO_6414 ) ) ( ON-TABLE ?AUTO_6413 ) ( CLEAR ?AUTO_6413 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_6413 )
      ( MAKE-ON ?AUTO_6413 ?AUTO_6414 )
      ( MAKE-ON-VERIFY ?AUTO_6413 ?AUTO_6414 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6415 - BLOCK
      ?AUTO_6416 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6415 ?AUTO_6416 ) ) ( ON-TABLE ?AUTO_6415 ) ( CLEAR ?AUTO_6415 ) ( HOLDING ?AUTO_6416 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6416 )
      ( MAKE-ON ?AUTO_6415 ?AUTO_6416 )
      ( MAKE-ON-VERIFY ?AUTO_6415 ?AUTO_6416 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6421 - BLOCK
      ?AUTO_6422 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6421 ) ( CLEAR ?AUTO_6422 ) ( not ( = ?AUTO_6421 ?AUTO_6422 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_6421 ?AUTO_6422 )
      ( MAKE-ON-VERIFY ?AUTO_6421 ?AUTO_6422 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6423 - BLOCK
      ?AUTO_6424 - BLOCK
    )
    :vars
    (
      ?AUTO_6425 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6424 ) ( not ( = ?AUTO_6423 ?AUTO_6424 ) ) ( ON ?AUTO_6423 ?AUTO_6425 ) ( CLEAR ?AUTO_6423 ) ( HAND-EMPTY ) ( not ( = ?AUTO_6423 ?AUTO_6425 ) ) ( not ( = ?AUTO_6424 ?AUTO_6425 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6423 ?AUTO_6425 )
      ( MAKE-ON ?AUTO_6423 ?AUTO_6424 )
      ( MAKE-ON-VERIFY ?AUTO_6423 ?AUTO_6424 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6426 - BLOCK
      ?AUTO_6427 - BLOCK
    )
    :vars
    (
      ?AUTO_6428 - BLOCK
      ?AUTO_6429 - BLOCK
      ?AUTO_6430 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6427 ) ( not ( = ?AUTO_6426 ?AUTO_6427 ) ) ( ON ?AUTO_6426 ?AUTO_6428 ) ( CLEAR ?AUTO_6426 ) ( not ( = ?AUTO_6426 ?AUTO_6428 ) ) ( not ( = ?AUTO_6427 ?AUTO_6428 ) ) ( HOLDING ?AUTO_6429 ) ( CLEAR ?AUTO_6430 ) ( not ( = ?AUTO_6426 ?AUTO_6429 ) ) ( not ( = ?AUTO_6426 ?AUTO_6430 ) ) ( not ( = ?AUTO_6427 ?AUTO_6429 ) ) ( not ( = ?AUTO_6427 ?AUTO_6430 ) ) ( not ( = ?AUTO_6428 ?AUTO_6429 ) ) ( not ( = ?AUTO_6428 ?AUTO_6430 ) ) ( not ( = ?AUTO_6429 ?AUTO_6430 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_6429 ?AUTO_6430 )
      ( MAKE-ON ?AUTO_6426 ?AUTO_6427 )
      ( MAKE-ON-VERIFY ?AUTO_6426 ?AUTO_6427 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6435 - BLOCK
      ?AUTO_6436 - BLOCK
    )
    :vars
    (
      ?AUTO_6439 - BLOCK
      ?AUTO_6438 - BLOCK
      ?AUTO_6437 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6436 ) ( not ( = ?AUTO_6435 ?AUTO_6436 ) ) ( ON ?AUTO_6435 ?AUTO_6439 ) ( not ( = ?AUTO_6435 ?AUTO_6439 ) ) ( not ( = ?AUTO_6436 ?AUTO_6439 ) ) ( CLEAR ?AUTO_6438 ) ( not ( = ?AUTO_6435 ?AUTO_6437 ) ) ( not ( = ?AUTO_6435 ?AUTO_6438 ) ) ( not ( = ?AUTO_6436 ?AUTO_6437 ) ) ( not ( = ?AUTO_6436 ?AUTO_6438 ) ) ( not ( = ?AUTO_6439 ?AUTO_6437 ) ) ( not ( = ?AUTO_6439 ?AUTO_6438 ) ) ( not ( = ?AUTO_6437 ?AUTO_6438 ) ) ( ON ?AUTO_6437 ?AUTO_6435 ) ( CLEAR ?AUTO_6437 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6437 ?AUTO_6435 )
      ( MAKE-ON ?AUTO_6435 ?AUTO_6436 )
      ( MAKE-ON-VERIFY ?AUTO_6435 ?AUTO_6436 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6442 - BLOCK
      ?AUTO_6443 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6442 ) ( CLEAR ?AUTO_6443 ) ( not ( = ?AUTO_6442 ?AUTO_6443 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_6442 ?AUTO_6443 )
      ( MAKE-ON-VERIFY ?AUTO_6442 ?AUTO_6443 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6444 - BLOCK
      ?AUTO_6445 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6445 ) ( not ( = ?AUTO_6444 ?AUTO_6445 ) ) ( ON-TABLE ?AUTO_6444 ) ( CLEAR ?AUTO_6444 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_6444 )
      ( MAKE-ON ?AUTO_6444 ?AUTO_6445 )
      ( MAKE-ON-VERIFY ?AUTO_6444 ?AUTO_6445 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6446 - BLOCK
      ?AUTO_6447 - BLOCK
    )
    :vars
    (
      ?AUTO_6448 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6446 ?AUTO_6447 ) ) ( ON-TABLE ?AUTO_6446 ) ( CLEAR ?AUTO_6446 ) ( HOLDING ?AUTO_6447 ) ( CLEAR ?AUTO_6448 ) ( not ( = ?AUTO_6446 ?AUTO_6448 ) ) ( not ( = ?AUTO_6447 ?AUTO_6448 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_6447 ?AUTO_6448 )
      ( MAKE-ON ?AUTO_6446 ?AUTO_6447 )
      ( MAKE-ON-VERIFY ?AUTO_6446 ?AUTO_6447 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6449 - BLOCK
      ?AUTO_6450 - BLOCK
    )
    :vars
    (
      ?AUTO_6451 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6449 ?AUTO_6450 ) ) ( ON-TABLE ?AUTO_6449 ) ( CLEAR ?AUTO_6451 ) ( not ( = ?AUTO_6449 ?AUTO_6451 ) ) ( not ( = ?AUTO_6450 ?AUTO_6451 ) ) ( ON ?AUTO_6450 ?AUTO_6449 ) ( CLEAR ?AUTO_6450 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6450 ?AUTO_6449 )
      ( MAKE-ON ?AUTO_6449 ?AUTO_6450 )
      ( MAKE-ON-VERIFY ?AUTO_6449 ?AUTO_6450 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6452 - BLOCK
      ?AUTO_6453 - BLOCK
    )
    :vars
    (
      ?AUTO_6454 - BLOCK
      ?AUTO_6455 - BLOCK
      ?AUTO_6456 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6452 ?AUTO_6453 ) ) ( ON-TABLE ?AUTO_6452 ) ( CLEAR ?AUTO_6454 ) ( not ( = ?AUTO_6452 ?AUTO_6454 ) ) ( not ( = ?AUTO_6453 ?AUTO_6454 ) ) ( ON ?AUTO_6453 ?AUTO_6452 ) ( CLEAR ?AUTO_6453 ) ( HOLDING ?AUTO_6455 ) ( CLEAR ?AUTO_6456 ) ( not ( = ?AUTO_6452 ?AUTO_6455 ) ) ( not ( = ?AUTO_6452 ?AUTO_6456 ) ) ( not ( = ?AUTO_6453 ?AUTO_6455 ) ) ( not ( = ?AUTO_6453 ?AUTO_6456 ) ) ( not ( = ?AUTO_6454 ?AUTO_6455 ) ) ( not ( = ?AUTO_6454 ?AUTO_6456 ) ) ( not ( = ?AUTO_6455 ?AUTO_6456 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_6455 ?AUTO_6456 )
      ( MAKE-ON ?AUTO_6452 ?AUTO_6453 )
      ( MAKE-ON-VERIFY ?AUTO_6452 ?AUTO_6453 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6461 - BLOCK
      ?AUTO_6462 - BLOCK
    )
    :vars
    (
      ?AUTO_6465 - BLOCK
      ?AUTO_6463 - BLOCK
      ?AUTO_6464 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6461 ?AUTO_6462 ) ) ( ON-TABLE ?AUTO_6461 ) ( CLEAR ?AUTO_6465 ) ( not ( = ?AUTO_6461 ?AUTO_6465 ) ) ( not ( = ?AUTO_6462 ?AUTO_6465 ) ) ( ON ?AUTO_6462 ?AUTO_6461 ) ( CLEAR ?AUTO_6463 ) ( not ( = ?AUTO_6461 ?AUTO_6464 ) ) ( not ( = ?AUTO_6461 ?AUTO_6463 ) ) ( not ( = ?AUTO_6462 ?AUTO_6464 ) ) ( not ( = ?AUTO_6462 ?AUTO_6463 ) ) ( not ( = ?AUTO_6465 ?AUTO_6464 ) ) ( not ( = ?AUTO_6465 ?AUTO_6463 ) ) ( not ( = ?AUTO_6464 ?AUTO_6463 ) ) ( ON ?AUTO_6464 ?AUTO_6462 ) ( CLEAR ?AUTO_6464 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6464 ?AUTO_6462 )
      ( MAKE-ON ?AUTO_6461 ?AUTO_6462 )
      ( MAKE-ON-VERIFY ?AUTO_6461 ?AUTO_6462 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6468 - BLOCK
      ?AUTO_6469 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6468 ) ( CLEAR ?AUTO_6469 ) ( not ( = ?AUTO_6468 ?AUTO_6469 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_6468 ?AUTO_6469 )
      ( MAKE-ON-VERIFY ?AUTO_6468 ?AUTO_6469 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6470 - BLOCK
      ?AUTO_6471 - BLOCK
    )
    :vars
    (
      ?AUTO_6472 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6471 ) ( not ( = ?AUTO_6470 ?AUTO_6471 ) ) ( ON ?AUTO_6470 ?AUTO_6472 ) ( CLEAR ?AUTO_6470 ) ( HAND-EMPTY ) ( not ( = ?AUTO_6470 ?AUTO_6472 ) ) ( not ( = ?AUTO_6471 ?AUTO_6472 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6470 ?AUTO_6472 )
      ( MAKE-ON ?AUTO_6470 ?AUTO_6471 )
      ( MAKE-ON-VERIFY ?AUTO_6470 ?AUTO_6471 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6473 - BLOCK
      ?AUTO_6474 - BLOCK
    )
    :vars
    (
      ?AUTO_6475 - BLOCK
      ?AUTO_6476 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6473 ?AUTO_6474 ) ) ( ON ?AUTO_6473 ?AUTO_6475 ) ( CLEAR ?AUTO_6473 ) ( not ( = ?AUTO_6473 ?AUTO_6475 ) ) ( not ( = ?AUTO_6474 ?AUTO_6475 ) ) ( HOLDING ?AUTO_6474 ) ( CLEAR ?AUTO_6476 ) ( not ( = ?AUTO_6473 ?AUTO_6476 ) ) ( not ( = ?AUTO_6474 ?AUTO_6476 ) ) ( not ( = ?AUTO_6475 ?AUTO_6476 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_6474 ?AUTO_6476 )
      ( MAKE-ON ?AUTO_6473 ?AUTO_6474 )
      ( MAKE-ON-VERIFY ?AUTO_6473 ?AUTO_6474 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6479 - BLOCK
      ?AUTO_6480 - BLOCK
    )
    :vars
    (
      ?AUTO_6481 - BLOCK
      ?AUTO_6482 - BLOCK
      ?AUTO_6483 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6480 ) ( not ( = ?AUTO_6479 ?AUTO_6480 ) ) ( ON ?AUTO_6479 ?AUTO_6481 ) ( CLEAR ?AUTO_6479 ) ( not ( = ?AUTO_6479 ?AUTO_6481 ) ) ( not ( = ?AUTO_6480 ?AUTO_6481 ) ) ( HOLDING ?AUTO_6482 ) ( CLEAR ?AUTO_6483 ) ( not ( = ?AUTO_6479 ?AUTO_6482 ) ) ( not ( = ?AUTO_6479 ?AUTO_6483 ) ) ( not ( = ?AUTO_6480 ?AUTO_6482 ) ) ( not ( = ?AUTO_6480 ?AUTO_6483 ) ) ( not ( = ?AUTO_6481 ?AUTO_6482 ) ) ( not ( = ?AUTO_6481 ?AUTO_6483 ) ) ( not ( = ?AUTO_6482 ?AUTO_6483 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_6482 ?AUTO_6483 )
      ( MAKE-ON ?AUTO_6479 ?AUTO_6480 )
      ( MAKE-ON-VERIFY ?AUTO_6479 ?AUTO_6480 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6484 - BLOCK
      ?AUTO_6485 - BLOCK
    )
    :vars
    (
      ?AUTO_6486 - BLOCK
      ?AUTO_6487 - BLOCK
      ?AUTO_6488 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6484 ?AUTO_6485 ) ) ( ON ?AUTO_6484 ?AUTO_6486 ) ( CLEAR ?AUTO_6484 ) ( not ( = ?AUTO_6484 ?AUTO_6486 ) ) ( not ( = ?AUTO_6485 ?AUTO_6486 ) ) ( CLEAR ?AUTO_6487 ) ( not ( = ?AUTO_6484 ?AUTO_6488 ) ) ( not ( = ?AUTO_6484 ?AUTO_6487 ) ) ( not ( = ?AUTO_6485 ?AUTO_6488 ) ) ( not ( = ?AUTO_6485 ?AUTO_6487 ) ) ( not ( = ?AUTO_6486 ?AUTO_6488 ) ) ( not ( = ?AUTO_6486 ?AUTO_6487 ) ) ( not ( = ?AUTO_6488 ?AUTO_6487 ) ) ( ON ?AUTO_6488 ?AUTO_6485 ) ( CLEAR ?AUTO_6488 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6488 ?AUTO_6485 )
      ( MAKE-ON ?AUTO_6484 ?AUTO_6485 )
      ( MAKE-ON-VERIFY ?AUTO_6484 ?AUTO_6485 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6489 - BLOCK
      ?AUTO_6490 - BLOCK
    )
    :vars
    (
      ?AUTO_6491 - BLOCK
      ?AUTO_6492 - BLOCK
      ?AUTO_6493 - BLOCK
      ?AUTO_6494 - BLOCK
      ?AUTO_6495 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6489 ?AUTO_6490 ) ) ( ON ?AUTO_6489 ?AUTO_6491 ) ( CLEAR ?AUTO_6489 ) ( not ( = ?AUTO_6489 ?AUTO_6491 ) ) ( not ( = ?AUTO_6490 ?AUTO_6491 ) ) ( CLEAR ?AUTO_6492 ) ( not ( = ?AUTO_6489 ?AUTO_6493 ) ) ( not ( = ?AUTO_6489 ?AUTO_6492 ) ) ( not ( = ?AUTO_6490 ?AUTO_6493 ) ) ( not ( = ?AUTO_6490 ?AUTO_6492 ) ) ( not ( = ?AUTO_6491 ?AUTO_6493 ) ) ( not ( = ?AUTO_6491 ?AUTO_6492 ) ) ( not ( = ?AUTO_6493 ?AUTO_6492 ) ) ( ON ?AUTO_6493 ?AUTO_6490 ) ( CLEAR ?AUTO_6493 ) ( HOLDING ?AUTO_6494 ) ( CLEAR ?AUTO_6495 ) ( not ( = ?AUTO_6489 ?AUTO_6494 ) ) ( not ( = ?AUTO_6489 ?AUTO_6495 ) ) ( not ( = ?AUTO_6490 ?AUTO_6494 ) ) ( not ( = ?AUTO_6490 ?AUTO_6495 ) ) ( not ( = ?AUTO_6491 ?AUTO_6494 ) ) ( not ( = ?AUTO_6491 ?AUTO_6495 ) ) ( not ( = ?AUTO_6492 ?AUTO_6494 ) ) ( not ( = ?AUTO_6492 ?AUTO_6495 ) ) ( not ( = ?AUTO_6493 ?AUTO_6494 ) ) ( not ( = ?AUTO_6493 ?AUTO_6495 ) ) ( not ( = ?AUTO_6494 ?AUTO_6495 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_6494 ?AUTO_6495 )
      ( MAKE-ON ?AUTO_6489 ?AUTO_6490 )
      ( MAKE-ON-VERIFY ?AUTO_6489 ?AUTO_6490 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6500 - BLOCK
      ?AUTO_6501 - BLOCK
    )
    :vars
    (
      ?AUTO_6506 - BLOCK
      ?AUTO_6505 - BLOCK
      ?AUTO_6502 - BLOCK
      ?AUTO_6503 - BLOCK
      ?AUTO_6504 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6500 ?AUTO_6501 ) ) ( ON ?AUTO_6500 ?AUTO_6506 ) ( CLEAR ?AUTO_6500 ) ( not ( = ?AUTO_6500 ?AUTO_6506 ) ) ( not ( = ?AUTO_6501 ?AUTO_6506 ) ) ( CLEAR ?AUTO_6505 ) ( not ( = ?AUTO_6500 ?AUTO_6502 ) ) ( not ( = ?AUTO_6500 ?AUTO_6505 ) ) ( not ( = ?AUTO_6501 ?AUTO_6502 ) ) ( not ( = ?AUTO_6501 ?AUTO_6505 ) ) ( not ( = ?AUTO_6506 ?AUTO_6502 ) ) ( not ( = ?AUTO_6506 ?AUTO_6505 ) ) ( not ( = ?AUTO_6502 ?AUTO_6505 ) ) ( ON ?AUTO_6502 ?AUTO_6501 ) ( CLEAR ?AUTO_6503 ) ( not ( = ?AUTO_6500 ?AUTO_6504 ) ) ( not ( = ?AUTO_6500 ?AUTO_6503 ) ) ( not ( = ?AUTO_6501 ?AUTO_6504 ) ) ( not ( = ?AUTO_6501 ?AUTO_6503 ) ) ( not ( = ?AUTO_6506 ?AUTO_6504 ) ) ( not ( = ?AUTO_6506 ?AUTO_6503 ) ) ( not ( = ?AUTO_6505 ?AUTO_6504 ) ) ( not ( = ?AUTO_6505 ?AUTO_6503 ) ) ( not ( = ?AUTO_6502 ?AUTO_6504 ) ) ( not ( = ?AUTO_6502 ?AUTO_6503 ) ) ( not ( = ?AUTO_6504 ?AUTO_6503 ) ) ( ON ?AUTO_6504 ?AUTO_6502 ) ( CLEAR ?AUTO_6504 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6504 ?AUTO_6502 )
      ( MAKE-ON ?AUTO_6500 ?AUTO_6501 )
      ( MAKE-ON-VERIFY ?AUTO_6500 ?AUTO_6501 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6508 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6508 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6508 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6508 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6509 - BLOCK
    )
    :vars
    (
      ?AUTO_6510 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6509 ?AUTO_6510 ) ( CLEAR ?AUTO_6509 ) ( HAND-EMPTY ) ( not ( = ?AUTO_6509 ?AUTO_6510 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6509 ?AUTO_6510 )
      ( MAKE-ON-TABLE ?AUTO_6509 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6509 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6511 - BLOCK
    )
    :vars
    (
      ?AUTO_6512 - BLOCK
      ?AUTO_6513 - BLOCK
      ?AUTO_6514 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6511 ?AUTO_6512 ) ( CLEAR ?AUTO_6511 ) ( not ( = ?AUTO_6511 ?AUTO_6512 ) ) ( HOLDING ?AUTO_6513 ) ( CLEAR ?AUTO_6514 ) ( not ( = ?AUTO_6511 ?AUTO_6513 ) ) ( not ( = ?AUTO_6511 ?AUTO_6514 ) ) ( not ( = ?AUTO_6512 ?AUTO_6513 ) ) ( not ( = ?AUTO_6512 ?AUTO_6514 ) ) ( not ( = ?AUTO_6513 ?AUTO_6514 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_6513 ?AUTO_6514 )
      ( MAKE-ON-TABLE ?AUTO_6511 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6511 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6515 - BLOCK
    )
    :vars
    (
      ?AUTO_6516 - BLOCK
      ?AUTO_6518 - BLOCK
      ?AUTO_6517 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6515 ?AUTO_6516 ) ( not ( = ?AUTO_6515 ?AUTO_6516 ) ) ( CLEAR ?AUTO_6518 ) ( not ( = ?AUTO_6515 ?AUTO_6517 ) ) ( not ( = ?AUTO_6515 ?AUTO_6518 ) ) ( not ( = ?AUTO_6516 ?AUTO_6517 ) ) ( not ( = ?AUTO_6516 ?AUTO_6518 ) ) ( not ( = ?AUTO_6517 ?AUTO_6518 ) ) ( ON ?AUTO_6517 ?AUTO_6515 ) ( CLEAR ?AUTO_6517 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6517 ?AUTO_6515 )
      ( MAKE-ON-TABLE ?AUTO_6515 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6515 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6519 - BLOCK
    )
    :vars
    (
      ?AUTO_6520 - BLOCK
      ?AUTO_6521 - BLOCK
      ?AUTO_6522 - BLOCK
      ?AUTO_6523 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6519 ?AUTO_6520 ) ( not ( = ?AUTO_6519 ?AUTO_6520 ) ) ( not ( = ?AUTO_6519 ?AUTO_6521 ) ) ( not ( = ?AUTO_6519 ?AUTO_6522 ) ) ( not ( = ?AUTO_6520 ?AUTO_6521 ) ) ( not ( = ?AUTO_6520 ?AUTO_6522 ) ) ( not ( = ?AUTO_6521 ?AUTO_6522 ) ) ( ON ?AUTO_6521 ?AUTO_6519 ) ( CLEAR ?AUTO_6521 ) ( HOLDING ?AUTO_6522 ) ( CLEAR ?AUTO_6523 ) ( not ( = ?AUTO_6519 ?AUTO_6523 ) ) ( not ( = ?AUTO_6520 ?AUTO_6523 ) ) ( not ( = ?AUTO_6521 ?AUTO_6523 ) ) ( not ( = ?AUTO_6522 ?AUTO_6523 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_6522 ?AUTO_6523 )
      ( MAKE-ON-TABLE ?AUTO_6519 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6519 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6532 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6532 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6532 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6532 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6533 - BLOCK
    )
    :vars
    (
      ?AUTO_6534 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6533 ?AUTO_6534 ) ( CLEAR ?AUTO_6533 ) ( HAND-EMPTY ) ( not ( = ?AUTO_6533 ?AUTO_6534 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6533 ?AUTO_6534 )
      ( MAKE-ON-TABLE ?AUTO_6533 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6533 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6535 - BLOCK
    )
    :vars
    (
      ?AUTO_6536 - BLOCK
      ?AUTO_6537 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6535 ?AUTO_6536 ) ( CLEAR ?AUTO_6535 ) ( not ( = ?AUTO_6535 ?AUTO_6536 ) ) ( HOLDING ?AUTO_6537 ) ( not ( = ?AUTO_6535 ?AUTO_6537 ) ) ( not ( = ?AUTO_6536 ?AUTO_6537 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6537 )
      ( MAKE-ON-TABLE ?AUTO_6535 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6535 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6538 - BLOCK
    )
    :vars
    (
      ?AUTO_6539 - BLOCK
      ?AUTO_6540 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6538 ?AUTO_6539 ) ( not ( = ?AUTO_6538 ?AUTO_6539 ) ) ( not ( = ?AUTO_6538 ?AUTO_6540 ) ) ( not ( = ?AUTO_6539 ?AUTO_6540 ) ) ( ON ?AUTO_6540 ?AUTO_6538 ) ( CLEAR ?AUTO_6540 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6540 ?AUTO_6538 )
      ( MAKE-ON-TABLE ?AUTO_6538 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6538 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6541 - BLOCK
    )
    :vars
    (
      ?AUTO_6543 - BLOCK
      ?AUTO_6542 - BLOCK
      ?AUTO_6544 - BLOCK
      ?AUTO_6545 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6541 ?AUTO_6543 ) ( not ( = ?AUTO_6541 ?AUTO_6543 ) ) ( not ( = ?AUTO_6541 ?AUTO_6542 ) ) ( not ( = ?AUTO_6543 ?AUTO_6542 ) ) ( ON ?AUTO_6542 ?AUTO_6541 ) ( CLEAR ?AUTO_6542 ) ( HOLDING ?AUTO_6544 ) ( CLEAR ?AUTO_6545 ) ( not ( = ?AUTO_6541 ?AUTO_6544 ) ) ( not ( = ?AUTO_6541 ?AUTO_6545 ) ) ( not ( = ?AUTO_6543 ?AUTO_6544 ) ) ( not ( = ?AUTO_6543 ?AUTO_6545 ) ) ( not ( = ?AUTO_6542 ?AUTO_6544 ) ) ( not ( = ?AUTO_6542 ?AUTO_6545 ) ) ( not ( = ?AUTO_6544 ?AUTO_6545 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_6544 ?AUTO_6545 )
      ( MAKE-ON-TABLE ?AUTO_6541 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6541 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6546 - BLOCK
    )
    :vars
    (
      ?AUTO_6548 - BLOCK
      ?AUTO_6547 - BLOCK
      ?AUTO_6549 - BLOCK
      ?AUTO_6550 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6546 ?AUTO_6548 ) ( not ( = ?AUTO_6546 ?AUTO_6548 ) ) ( not ( = ?AUTO_6546 ?AUTO_6547 ) ) ( not ( = ?AUTO_6548 ?AUTO_6547 ) ) ( ON ?AUTO_6547 ?AUTO_6546 ) ( CLEAR ?AUTO_6549 ) ( not ( = ?AUTO_6546 ?AUTO_6550 ) ) ( not ( = ?AUTO_6546 ?AUTO_6549 ) ) ( not ( = ?AUTO_6548 ?AUTO_6550 ) ) ( not ( = ?AUTO_6548 ?AUTO_6549 ) ) ( not ( = ?AUTO_6547 ?AUTO_6550 ) ) ( not ( = ?AUTO_6547 ?AUTO_6549 ) ) ( not ( = ?AUTO_6550 ?AUTO_6549 ) ) ( ON ?AUTO_6550 ?AUTO_6547 ) ( CLEAR ?AUTO_6550 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6550 ?AUTO_6547 )
      ( MAKE-ON-TABLE ?AUTO_6546 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6546 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6551 - BLOCK
    )
    :vars
    (
      ?AUTO_6552 - BLOCK
      ?AUTO_6555 - BLOCK
      ?AUTO_6554 - BLOCK
      ?AUTO_6553 - BLOCK
      ?AUTO_6556 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6551 ?AUTO_6552 ) ( not ( = ?AUTO_6551 ?AUTO_6552 ) ) ( not ( = ?AUTO_6551 ?AUTO_6555 ) ) ( not ( = ?AUTO_6552 ?AUTO_6555 ) ) ( ON ?AUTO_6555 ?AUTO_6551 ) ( not ( = ?AUTO_6551 ?AUTO_6554 ) ) ( not ( = ?AUTO_6551 ?AUTO_6553 ) ) ( not ( = ?AUTO_6552 ?AUTO_6554 ) ) ( not ( = ?AUTO_6552 ?AUTO_6553 ) ) ( not ( = ?AUTO_6555 ?AUTO_6554 ) ) ( not ( = ?AUTO_6555 ?AUTO_6553 ) ) ( not ( = ?AUTO_6554 ?AUTO_6553 ) ) ( ON ?AUTO_6554 ?AUTO_6555 ) ( CLEAR ?AUTO_6554 ) ( HOLDING ?AUTO_6553 ) ( CLEAR ?AUTO_6556 ) ( not ( = ?AUTO_6551 ?AUTO_6556 ) ) ( not ( = ?AUTO_6552 ?AUTO_6556 ) ) ( not ( = ?AUTO_6555 ?AUTO_6556 ) ) ( not ( = ?AUTO_6554 ?AUTO_6556 ) ) ( not ( = ?AUTO_6553 ?AUTO_6556 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_6553 ?AUTO_6556 )
      ( MAKE-ON-TABLE ?AUTO_6551 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6551 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6566 - BLOCK
      ?AUTO_6567 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6566 ) ( CLEAR ?AUTO_6567 ) ( not ( = ?AUTO_6566 ?AUTO_6567 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_6566 ?AUTO_6567 )
      ( MAKE-ON-VERIFY ?AUTO_6566 ?AUTO_6567 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6568 - BLOCK
      ?AUTO_6569 - BLOCK
    )
    :vars
    (
      ?AUTO_6570 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6569 ) ( not ( = ?AUTO_6568 ?AUTO_6569 ) ) ( ON ?AUTO_6568 ?AUTO_6570 ) ( CLEAR ?AUTO_6568 ) ( HAND-EMPTY ) ( not ( = ?AUTO_6568 ?AUTO_6570 ) ) ( not ( = ?AUTO_6569 ?AUTO_6570 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6568 ?AUTO_6570 )
      ( MAKE-ON ?AUTO_6568 ?AUTO_6569 )
      ( MAKE-ON-VERIFY ?AUTO_6568 ?AUTO_6569 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6571 - BLOCK
      ?AUTO_6572 - BLOCK
    )
    :vars
    (
      ?AUTO_6573 - BLOCK
      ?AUTO_6574 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6572 ) ( not ( = ?AUTO_6571 ?AUTO_6572 ) ) ( ON ?AUTO_6571 ?AUTO_6573 ) ( CLEAR ?AUTO_6571 ) ( not ( = ?AUTO_6571 ?AUTO_6573 ) ) ( not ( = ?AUTO_6572 ?AUTO_6573 ) ) ( HOLDING ?AUTO_6574 ) ( not ( = ?AUTO_6571 ?AUTO_6574 ) ) ( not ( = ?AUTO_6572 ?AUTO_6574 ) ) ( not ( = ?AUTO_6573 ?AUTO_6574 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6574 )
      ( MAKE-ON ?AUTO_6571 ?AUTO_6572 )
      ( MAKE-ON-VERIFY ?AUTO_6571 ?AUTO_6572 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6575 - BLOCK
      ?AUTO_6576 - BLOCK
    )
    :vars
    (
      ?AUTO_6577 - BLOCK
      ?AUTO_6578 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6576 ) ( not ( = ?AUTO_6575 ?AUTO_6576 ) ) ( ON ?AUTO_6575 ?AUTO_6577 ) ( not ( = ?AUTO_6575 ?AUTO_6577 ) ) ( not ( = ?AUTO_6576 ?AUTO_6577 ) ) ( not ( = ?AUTO_6575 ?AUTO_6578 ) ) ( not ( = ?AUTO_6576 ?AUTO_6578 ) ) ( not ( = ?AUTO_6577 ?AUTO_6578 ) ) ( ON ?AUTO_6578 ?AUTO_6575 ) ( CLEAR ?AUTO_6578 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6578 ?AUTO_6575 )
      ( MAKE-ON ?AUTO_6575 ?AUTO_6576 )
      ( MAKE-ON-VERIFY ?AUTO_6575 ?AUTO_6576 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6579 - BLOCK
      ?AUTO_6580 - BLOCK
    )
    :vars
    (
      ?AUTO_6581 - BLOCK
      ?AUTO_6582 - BLOCK
      ?AUTO_6583 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6580 ) ( not ( = ?AUTO_6579 ?AUTO_6580 ) ) ( ON ?AUTO_6579 ?AUTO_6581 ) ( not ( = ?AUTO_6579 ?AUTO_6581 ) ) ( not ( = ?AUTO_6580 ?AUTO_6581 ) ) ( not ( = ?AUTO_6579 ?AUTO_6582 ) ) ( not ( = ?AUTO_6580 ?AUTO_6582 ) ) ( not ( = ?AUTO_6581 ?AUTO_6582 ) ) ( ON ?AUTO_6582 ?AUTO_6579 ) ( CLEAR ?AUTO_6582 ) ( HOLDING ?AUTO_6583 ) ( not ( = ?AUTO_6579 ?AUTO_6583 ) ) ( not ( = ?AUTO_6580 ?AUTO_6583 ) ) ( not ( = ?AUTO_6581 ?AUTO_6583 ) ) ( not ( = ?AUTO_6582 ?AUTO_6583 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6583 )
      ( MAKE-ON ?AUTO_6579 ?AUTO_6580 )
      ( MAKE-ON-VERIFY ?AUTO_6579 ?AUTO_6580 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6584 - BLOCK
      ?AUTO_6585 - BLOCK
    )
    :vars
    (
      ?AUTO_6586 - BLOCK
      ?AUTO_6587 - BLOCK
      ?AUTO_6588 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6585 ) ( not ( = ?AUTO_6584 ?AUTO_6585 ) ) ( ON ?AUTO_6584 ?AUTO_6586 ) ( not ( = ?AUTO_6584 ?AUTO_6586 ) ) ( not ( = ?AUTO_6585 ?AUTO_6586 ) ) ( not ( = ?AUTO_6584 ?AUTO_6587 ) ) ( not ( = ?AUTO_6585 ?AUTO_6587 ) ) ( not ( = ?AUTO_6586 ?AUTO_6587 ) ) ( ON ?AUTO_6587 ?AUTO_6584 ) ( not ( = ?AUTO_6584 ?AUTO_6588 ) ) ( not ( = ?AUTO_6585 ?AUTO_6588 ) ) ( not ( = ?AUTO_6586 ?AUTO_6588 ) ) ( not ( = ?AUTO_6587 ?AUTO_6588 ) ) ( ON ?AUTO_6588 ?AUTO_6587 ) ( CLEAR ?AUTO_6588 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6588 ?AUTO_6587 )
      ( MAKE-ON ?AUTO_6584 ?AUTO_6585 )
      ( MAKE-ON-VERIFY ?AUTO_6584 ?AUTO_6585 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6589 - BLOCK
      ?AUTO_6590 - BLOCK
    )
    :vars
    (
      ?AUTO_6592 - BLOCK
      ?AUTO_6591 - BLOCK
      ?AUTO_6593 - BLOCK
      ?AUTO_6594 - BLOCK
      ?AUTO_6595 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6590 ) ( not ( = ?AUTO_6589 ?AUTO_6590 ) ) ( ON ?AUTO_6589 ?AUTO_6592 ) ( not ( = ?AUTO_6589 ?AUTO_6592 ) ) ( not ( = ?AUTO_6590 ?AUTO_6592 ) ) ( not ( = ?AUTO_6589 ?AUTO_6591 ) ) ( not ( = ?AUTO_6590 ?AUTO_6591 ) ) ( not ( = ?AUTO_6592 ?AUTO_6591 ) ) ( ON ?AUTO_6591 ?AUTO_6589 ) ( not ( = ?AUTO_6589 ?AUTO_6593 ) ) ( not ( = ?AUTO_6590 ?AUTO_6593 ) ) ( not ( = ?AUTO_6592 ?AUTO_6593 ) ) ( not ( = ?AUTO_6591 ?AUTO_6593 ) ) ( ON ?AUTO_6593 ?AUTO_6591 ) ( CLEAR ?AUTO_6593 ) ( HOLDING ?AUTO_6594 ) ( CLEAR ?AUTO_6595 ) ( not ( = ?AUTO_6589 ?AUTO_6594 ) ) ( not ( = ?AUTO_6589 ?AUTO_6595 ) ) ( not ( = ?AUTO_6590 ?AUTO_6594 ) ) ( not ( = ?AUTO_6590 ?AUTO_6595 ) ) ( not ( = ?AUTO_6592 ?AUTO_6594 ) ) ( not ( = ?AUTO_6592 ?AUTO_6595 ) ) ( not ( = ?AUTO_6591 ?AUTO_6594 ) ) ( not ( = ?AUTO_6591 ?AUTO_6595 ) ) ( not ( = ?AUTO_6593 ?AUTO_6594 ) ) ( not ( = ?AUTO_6593 ?AUTO_6595 ) ) ( not ( = ?AUTO_6594 ?AUTO_6595 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_6594 ?AUTO_6595 )
      ( MAKE-ON ?AUTO_6589 ?AUTO_6590 )
      ( MAKE-ON-VERIFY ?AUTO_6589 ?AUTO_6590 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6596 - BLOCK
      ?AUTO_6597 - BLOCK
    )
    :vars
    (
      ?AUTO_6598 - BLOCK
      ?AUTO_6599 - BLOCK
      ?AUTO_6601 - BLOCK
      ?AUTO_6602 - BLOCK
      ?AUTO_6600 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6597 ) ( not ( = ?AUTO_6596 ?AUTO_6597 ) ) ( ON ?AUTO_6596 ?AUTO_6598 ) ( not ( = ?AUTO_6596 ?AUTO_6598 ) ) ( not ( = ?AUTO_6597 ?AUTO_6598 ) ) ( not ( = ?AUTO_6596 ?AUTO_6599 ) ) ( not ( = ?AUTO_6597 ?AUTO_6599 ) ) ( not ( = ?AUTO_6598 ?AUTO_6599 ) ) ( ON ?AUTO_6599 ?AUTO_6596 ) ( not ( = ?AUTO_6596 ?AUTO_6601 ) ) ( not ( = ?AUTO_6597 ?AUTO_6601 ) ) ( not ( = ?AUTO_6598 ?AUTO_6601 ) ) ( not ( = ?AUTO_6599 ?AUTO_6601 ) ) ( ON ?AUTO_6601 ?AUTO_6599 ) ( CLEAR ?AUTO_6602 ) ( not ( = ?AUTO_6596 ?AUTO_6600 ) ) ( not ( = ?AUTO_6596 ?AUTO_6602 ) ) ( not ( = ?AUTO_6597 ?AUTO_6600 ) ) ( not ( = ?AUTO_6597 ?AUTO_6602 ) ) ( not ( = ?AUTO_6598 ?AUTO_6600 ) ) ( not ( = ?AUTO_6598 ?AUTO_6602 ) ) ( not ( = ?AUTO_6599 ?AUTO_6600 ) ) ( not ( = ?AUTO_6599 ?AUTO_6602 ) ) ( not ( = ?AUTO_6601 ?AUTO_6600 ) ) ( not ( = ?AUTO_6601 ?AUTO_6602 ) ) ( not ( = ?AUTO_6600 ?AUTO_6602 ) ) ( ON ?AUTO_6600 ?AUTO_6601 ) ( CLEAR ?AUTO_6600 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6600 ?AUTO_6601 )
      ( MAKE-ON ?AUTO_6596 ?AUTO_6597 )
      ( MAKE-ON-VERIFY ?AUTO_6596 ?AUTO_6597 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6603 - BLOCK
      ?AUTO_6604 - BLOCK
    )
    :vars
    (
      ?AUTO_6606 - BLOCK
      ?AUTO_6605 - BLOCK
      ?AUTO_6609 - BLOCK
      ?AUTO_6608 - BLOCK
      ?AUTO_6607 - BLOCK
      ?AUTO_6610 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6604 ) ( not ( = ?AUTO_6603 ?AUTO_6604 ) ) ( ON ?AUTO_6603 ?AUTO_6606 ) ( not ( = ?AUTO_6603 ?AUTO_6606 ) ) ( not ( = ?AUTO_6604 ?AUTO_6606 ) ) ( not ( = ?AUTO_6603 ?AUTO_6605 ) ) ( not ( = ?AUTO_6604 ?AUTO_6605 ) ) ( not ( = ?AUTO_6606 ?AUTO_6605 ) ) ( ON ?AUTO_6605 ?AUTO_6603 ) ( not ( = ?AUTO_6603 ?AUTO_6609 ) ) ( not ( = ?AUTO_6604 ?AUTO_6609 ) ) ( not ( = ?AUTO_6606 ?AUTO_6609 ) ) ( not ( = ?AUTO_6605 ?AUTO_6609 ) ) ( ON ?AUTO_6609 ?AUTO_6605 ) ( not ( = ?AUTO_6603 ?AUTO_6608 ) ) ( not ( = ?AUTO_6603 ?AUTO_6607 ) ) ( not ( = ?AUTO_6604 ?AUTO_6608 ) ) ( not ( = ?AUTO_6604 ?AUTO_6607 ) ) ( not ( = ?AUTO_6606 ?AUTO_6608 ) ) ( not ( = ?AUTO_6606 ?AUTO_6607 ) ) ( not ( = ?AUTO_6605 ?AUTO_6608 ) ) ( not ( = ?AUTO_6605 ?AUTO_6607 ) ) ( not ( = ?AUTO_6609 ?AUTO_6608 ) ) ( not ( = ?AUTO_6609 ?AUTO_6607 ) ) ( not ( = ?AUTO_6608 ?AUTO_6607 ) ) ( ON ?AUTO_6608 ?AUTO_6609 ) ( CLEAR ?AUTO_6608 ) ( HOLDING ?AUTO_6607 ) ( CLEAR ?AUTO_6610 ) ( not ( = ?AUTO_6603 ?AUTO_6610 ) ) ( not ( = ?AUTO_6604 ?AUTO_6610 ) ) ( not ( = ?AUTO_6606 ?AUTO_6610 ) ) ( not ( = ?AUTO_6605 ?AUTO_6610 ) ) ( not ( = ?AUTO_6609 ?AUTO_6610 ) ) ( not ( = ?AUTO_6608 ?AUTO_6610 ) ) ( not ( = ?AUTO_6607 ?AUTO_6610 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_6607 ?AUTO_6610 )
      ( MAKE-ON ?AUTO_6603 ?AUTO_6604 )
      ( MAKE-ON-VERIFY ?AUTO_6603 ?AUTO_6604 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6617 - BLOCK
      ?AUTO_6618 - BLOCK
    )
    :vars
    (
      ?AUTO_6619 - BLOCK
      ?AUTO_6622 - BLOCK
      ?AUTO_6623 - BLOCK
      ?AUTO_6620 - BLOCK
      ?AUTO_6621 - BLOCK
      ?AUTO_6624 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6617 ?AUTO_6618 ) ) ( ON ?AUTO_6617 ?AUTO_6619 ) ( not ( = ?AUTO_6617 ?AUTO_6619 ) ) ( not ( = ?AUTO_6618 ?AUTO_6619 ) ) ( not ( = ?AUTO_6617 ?AUTO_6622 ) ) ( not ( = ?AUTO_6618 ?AUTO_6622 ) ) ( not ( = ?AUTO_6619 ?AUTO_6622 ) ) ( ON ?AUTO_6622 ?AUTO_6617 ) ( not ( = ?AUTO_6617 ?AUTO_6623 ) ) ( not ( = ?AUTO_6618 ?AUTO_6623 ) ) ( not ( = ?AUTO_6619 ?AUTO_6623 ) ) ( not ( = ?AUTO_6622 ?AUTO_6623 ) ) ( ON ?AUTO_6623 ?AUTO_6622 ) ( CLEAR ?AUTO_6620 ) ( not ( = ?AUTO_6617 ?AUTO_6621 ) ) ( not ( = ?AUTO_6617 ?AUTO_6620 ) ) ( not ( = ?AUTO_6618 ?AUTO_6621 ) ) ( not ( = ?AUTO_6618 ?AUTO_6620 ) ) ( not ( = ?AUTO_6619 ?AUTO_6621 ) ) ( not ( = ?AUTO_6619 ?AUTO_6620 ) ) ( not ( = ?AUTO_6622 ?AUTO_6621 ) ) ( not ( = ?AUTO_6622 ?AUTO_6620 ) ) ( not ( = ?AUTO_6623 ?AUTO_6621 ) ) ( not ( = ?AUTO_6623 ?AUTO_6620 ) ) ( not ( = ?AUTO_6621 ?AUTO_6620 ) ) ( ON ?AUTO_6621 ?AUTO_6623 ) ( CLEAR ?AUTO_6621 ) ( HOLDING ?AUTO_6618 ) ( CLEAR ?AUTO_6624 ) ( not ( = ?AUTO_6617 ?AUTO_6624 ) ) ( not ( = ?AUTO_6618 ?AUTO_6624 ) ) ( not ( = ?AUTO_6619 ?AUTO_6624 ) ) ( not ( = ?AUTO_6622 ?AUTO_6624 ) ) ( not ( = ?AUTO_6623 ?AUTO_6624 ) ) ( not ( = ?AUTO_6620 ?AUTO_6624 ) ) ( not ( = ?AUTO_6621 ?AUTO_6624 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_6618 ?AUTO_6624 )
      ( MAKE-ON ?AUTO_6617 ?AUTO_6618 )
      ( MAKE-ON-VERIFY ?AUTO_6617 ?AUTO_6618 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6633 - BLOCK
      ?AUTO_6634 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6633 ) ( CLEAR ?AUTO_6634 ) ( not ( = ?AUTO_6633 ?AUTO_6634 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_6633 ?AUTO_6634 )
      ( MAKE-ON-VERIFY ?AUTO_6633 ?AUTO_6634 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6635 - BLOCK
      ?AUTO_6636 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6636 ) ( not ( = ?AUTO_6635 ?AUTO_6636 ) ) ( ON-TABLE ?AUTO_6635 ) ( CLEAR ?AUTO_6635 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_6635 )
      ( MAKE-ON ?AUTO_6635 ?AUTO_6636 )
      ( MAKE-ON-VERIFY ?AUTO_6635 ?AUTO_6636 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6637 - BLOCK
      ?AUTO_6638 - BLOCK
    )
    :vars
    (
      ?AUTO_6639 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6637 ?AUTO_6638 ) ) ( ON-TABLE ?AUTO_6637 ) ( CLEAR ?AUTO_6637 ) ( HOLDING ?AUTO_6638 ) ( CLEAR ?AUTO_6639 ) ( not ( = ?AUTO_6637 ?AUTO_6639 ) ) ( not ( = ?AUTO_6638 ?AUTO_6639 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_6638 ?AUTO_6639 )
      ( MAKE-ON ?AUTO_6637 ?AUTO_6638 )
      ( MAKE-ON-VERIFY ?AUTO_6637 ?AUTO_6638 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6726 - BLOCK
      ?AUTO_6727 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6726 ) ( CLEAR ?AUTO_6727 ) ( not ( = ?AUTO_6726 ?AUTO_6727 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_6726 ?AUTO_6727 )
      ( MAKE-ON-VERIFY ?AUTO_6726 ?AUTO_6727 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6728 - BLOCK
      ?AUTO_6729 - BLOCK
    )
    :vars
    (
      ?AUTO_6730 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6729 ) ( not ( = ?AUTO_6728 ?AUTO_6729 ) ) ( ON ?AUTO_6728 ?AUTO_6730 ) ( CLEAR ?AUTO_6728 ) ( HAND-EMPTY ) ( not ( = ?AUTO_6728 ?AUTO_6730 ) ) ( not ( = ?AUTO_6729 ?AUTO_6730 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6728 ?AUTO_6730 )
      ( MAKE-ON ?AUTO_6728 ?AUTO_6729 )
      ( MAKE-ON-VERIFY ?AUTO_6728 ?AUTO_6729 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6731 - BLOCK
      ?AUTO_6732 - BLOCK
    )
    :vars
    (
      ?AUTO_6733 - BLOCK
      ?AUTO_6734 - BLOCK
      ?AUTO_6735 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6732 ) ( not ( = ?AUTO_6731 ?AUTO_6732 ) ) ( ON ?AUTO_6731 ?AUTO_6733 ) ( CLEAR ?AUTO_6731 ) ( not ( = ?AUTO_6731 ?AUTO_6733 ) ) ( not ( = ?AUTO_6732 ?AUTO_6733 ) ) ( HOLDING ?AUTO_6734 ) ( CLEAR ?AUTO_6735 ) ( not ( = ?AUTO_6731 ?AUTO_6734 ) ) ( not ( = ?AUTO_6731 ?AUTO_6735 ) ) ( not ( = ?AUTO_6732 ?AUTO_6734 ) ) ( not ( = ?AUTO_6732 ?AUTO_6735 ) ) ( not ( = ?AUTO_6733 ?AUTO_6734 ) ) ( not ( = ?AUTO_6733 ?AUTO_6735 ) ) ( not ( = ?AUTO_6734 ?AUTO_6735 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_6734 ?AUTO_6735 )
      ( MAKE-ON ?AUTO_6731 ?AUTO_6732 )
      ( MAKE-ON-VERIFY ?AUTO_6731 ?AUTO_6732 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6740 - BLOCK
      ?AUTO_6741 - BLOCK
    )
    :vars
    (
      ?AUTO_6744 - BLOCK
      ?AUTO_6743 - BLOCK
      ?AUTO_6742 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6740 ?AUTO_6741 ) ) ( ON ?AUTO_6740 ?AUTO_6744 ) ( CLEAR ?AUTO_6740 ) ( not ( = ?AUTO_6740 ?AUTO_6744 ) ) ( not ( = ?AUTO_6741 ?AUTO_6744 ) ) ( CLEAR ?AUTO_6743 ) ( not ( = ?AUTO_6740 ?AUTO_6742 ) ) ( not ( = ?AUTO_6740 ?AUTO_6743 ) ) ( not ( = ?AUTO_6741 ?AUTO_6742 ) ) ( not ( = ?AUTO_6741 ?AUTO_6743 ) ) ( not ( = ?AUTO_6744 ?AUTO_6742 ) ) ( not ( = ?AUTO_6744 ?AUTO_6743 ) ) ( not ( = ?AUTO_6742 ?AUTO_6743 ) ) ( ON ?AUTO_6742 ?AUTO_6741 ) ( CLEAR ?AUTO_6742 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6742 ?AUTO_6741 )
      ( MAKE-ON ?AUTO_6740 ?AUTO_6741 )
      ( MAKE-ON-VERIFY ?AUTO_6740 ?AUTO_6741 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6745 - BLOCK
      ?AUTO_6746 - BLOCK
    )
    :vars
    (
      ?AUTO_6749 - BLOCK
      ?AUTO_6747 - BLOCK
      ?AUTO_6748 - BLOCK
      ?AUTO_6750 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6745 ?AUTO_6746 ) ) ( ON ?AUTO_6745 ?AUTO_6749 ) ( CLEAR ?AUTO_6745 ) ( not ( = ?AUTO_6745 ?AUTO_6749 ) ) ( not ( = ?AUTO_6746 ?AUTO_6749 ) ) ( CLEAR ?AUTO_6747 ) ( not ( = ?AUTO_6745 ?AUTO_6748 ) ) ( not ( = ?AUTO_6745 ?AUTO_6747 ) ) ( not ( = ?AUTO_6746 ?AUTO_6748 ) ) ( not ( = ?AUTO_6746 ?AUTO_6747 ) ) ( not ( = ?AUTO_6749 ?AUTO_6748 ) ) ( not ( = ?AUTO_6749 ?AUTO_6747 ) ) ( not ( = ?AUTO_6748 ?AUTO_6747 ) ) ( ON ?AUTO_6748 ?AUTO_6746 ) ( CLEAR ?AUTO_6748 ) ( HOLDING ?AUTO_6750 ) ( not ( = ?AUTO_6745 ?AUTO_6750 ) ) ( not ( = ?AUTO_6746 ?AUTO_6750 ) ) ( not ( = ?AUTO_6749 ?AUTO_6750 ) ) ( not ( = ?AUTO_6747 ?AUTO_6750 ) ) ( not ( = ?AUTO_6748 ?AUTO_6750 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6750 )
      ( MAKE-ON ?AUTO_6745 ?AUTO_6746 )
      ( MAKE-ON-VERIFY ?AUTO_6745 ?AUTO_6746 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6751 - BLOCK
      ?AUTO_6752 - BLOCK
    )
    :vars
    (
      ?AUTO_6755 - BLOCK
      ?AUTO_6753 - BLOCK
      ?AUTO_6754 - BLOCK
      ?AUTO_6756 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6751 ?AUTO_6752 ) ) ( ON ?AUTO_6751 ?AUTO_6755 ) ( CLEAR ?AUTO_6751 ) ( not ( = ?AUTO_6751 ?AUTO_6755 ) ) ( not ( = ?AUTO_6752 ?AUTO_6755 ) ) ( CLEAR ?AUTO_6753 ) ( not ( = ?AUTO_6751 ?AUTO_6754 ) ) ( not ( = ?AUTO_6751 ?AUTO_6753 ) ) ( not ( = ?AUTO_6752 ?AUTO_6754 ) ) ( not ( = ?AUTO_6752 ?AUTO_6753 ) ) ( not ( = ?AUTO_6755 ?AUTO_6754 ) ) ( not ( = ?AUTO_6755 ?AUTO_6753 ) ) ( not ( = ?AUTO_6754 ?AUTO_6753 ) ) ( ON ?AUTO_6754 ?AUTO_6752 ) ( not ( = ?AUTO_6751 ?AUTO_6756 ) ) ( not ( = ?AUTO_6752 ?AUTO_6756 ) ) ( not ( = ?AUTO_6755 ?AUTO_6756 ) ) ( not ( = ?AUTO_6753 ?AUTO_6756 ) ) ( not ( = ?AUTO_6754 ?AUTO_6756 ) ) ( ON ?AUTO_6756 ?AUTO_6754 ) ( CLEAR ?AUTO_6756 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6756 ?AUTO_6754 )
      ( MAKE-ON ?AUTO_6751 ?AUTO_6752 )
      ( MAKE-ON-VERIFY ?AUTO_6751 ?AUTO_6752 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6757 - BLOCK
      ?AUTO_6758 - BLOCK
    )
    :vars
    (
      ?AUTO_6761 - BLOCK
      ?AUTO_6760 - BLOCK
      ?AUTO_6762 - BLOCK
      ?AUTO_6759 - BLOCK
      ?AUTO_6763 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6757 ?AUTO_6758 ) ) ( ON ?AUTO_6757 ?AUTO_6761 ) ( CLEAR ?AUTO_6757 ) ( not ( = ?AUTO_6757 ?AUTO_6761 ) ) ( not ( = ?AUTO_6758 ?AUTO_6761 ) ) ( CLEAR ?AUTO_6760 ) ( not ( = ?AUTO_6757 ?AUTO_6762 ) ) ( not ( = ?AUTO_6757 ?AUTO_6760 ) ) ( not ( = ?AUTO_6758 ?AUTO_6762 ) ) ( not ( = ?AUTO_6758 ?AUTO_6760 ) ) ( not ( = ?AUTO_6761 ?AUTO_6762 ) ) ( not ( = ?AUTO_6761 ?AUTO_6760 ) ) ( not ( = ?AUTO_6762 ?AUTO_6760 ) ) ( ON ?AUTO_6762 ?AUTO_6758 ) ( not ( = ?AUTO_6757 ?AUTO_6759 ) ) ( not ( = ?AUTO_6758 ?AUTO_6759 ) ) ( not ( = ?AUTO_6761 ?AUTO_6759 ) ) ( not ( = ?AUTO_6760 ?AUTO_6759 ) ) ( not ( = ?AUTO_6762 ?AUTO_6759 ) ) ( ON ?AUTO_6759 ?AUTO_6762 ) ( CLEAR ?AUTO_6759 ) ( HOLDING ?AUTO_6763 ) ( not ( = ?AUTO_6757 ?AUTO_6763 ) ) ( not ( = ?AUTO_6758 ?AUTO_6763 ) ) ( not ( = ?AUTO_6761 ?AUTO_6763 ) ) ( not ( = ?AUTO_6760 ?AUTO_6763 ) ) ( not ( = ?AUTO_6762 ?AUTO_6763 ) ) ( not ( = ?AUTO_6759 ?AUTO_6763 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6763 )
      ( MAKE-ON ?AUTO_6757 ?AUTO_6758 )
      ( MAKE-ON-VERIFY ?AUTO_6757 ?AUTO_6758 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6764 - BLOCK
      ?AUTO_6765 - BLOCK
    )
    :vars
    (
      ?AUTO_6770 - BLOCK
      ?AUTO_6767 - BLOCK
      ?AUTO_6766 - BLOCK
      ?AUTO_6768 - BLOCK
      ?AUTO_6769 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6764 ?AUTO_6765 ) ) ( ON ?AUTO_6764 ?AUTO_6770 ) ( CLEAR ?AUTO_6764 ) ( not ( = ?AUTO_6764 ?AUTO_6770 ) ) ( not ( = ?AUTO_6765 ?AUTO_6770 ) ) ( CLEAR ?AUTO_6767 ) ( not ( = ?AUTO_6764 ?AUTO_6766 ) ) ( not ( = ?AUTO_6764 ?AUTO_6767 ) ) ( not ( = ?AUTO_6765 ?AUTO_6766 ) ) ( not ( = ?AUTO_6765 ?AUTO_6767 ) ) ( not ( = ?AUTO_6770 ?AUTO_6766 ) ) ( not ( = ?AUTO_6770 ?AUTO_6767 ) ) ( not ( = ?AUTO_6766 ?AUTO_6767 ) ) ( ON ?AUTO_6766 ?AUTO_6765 ) ( not ( = ?AUTO_6764 ?AUTO_6768 ) ) ( not ( = ?AUTO_6765 ?AUTO_6768 ) ) ( not ( = ?AUTO_6770 ?AUTO_6768 ) ) ( not ( = ?AUTO_6767 ?AUTO_6768 ) ) ( not ( = ?AUTO_6766 ?AUTO_6768 ) ) ( ON ?AUTO_6768 ?AUTO_6766 ) ( not ( = ?AUTO_6764 ?AUTO_6769 ) ) ( not ( = ?AUTO_6765 ?AUTO_6769 ) ) ( not ( = ?AUTO_6770 ?AUTO_6769 ) ) ( not ( = ?AUTO_6767 ?AUTO_6769 ) ) ( not ( = ?AUTO_6766 ?AUTO_6769 ) ) ( not ( = ?AUTO_6768 ?AUTO_6769 ) ) ( ON ?AUTO_6769 ?AUTO_6768 ) ( CLEAR ?AUTO_6769 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6769 ?AUTO_6768 )
      ( MAKE-ON ?AUTO_6764 ?AUTO_6765 )
      ( MAKE-ON-VERIFY ?AUTO_6764 ?AUTO_6765 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6771 - BLOCK
      ?AUTO_6772 - BLOCK
    )
    :vars
    (
      ?AUTO_6776 - BLOCK
      ?AUTO_6774 - BLOCK
      ?AUTO_6773 - BLOCK
      ?AUTO_6775 - BLOCK
      ?AUTO_6777 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6771 ?AUTO_6772 ) ) ( not ( = ?AUTO_6771 ?AUTO_6776 ) ) ( not ( = ?AUTO_6772 ?AUTO_6776 ) ) ( CLEAR ?AUTO_6774 ) ( not ( = ?AUTO_6771 ?AUTO_6773 ) ) ( not ( = ?AUTO_6771 ?AUTO_6774 ) ) ( not ( = ?AUTO_6772 ?AUTO_6773 ) ) ( not ( = ?AUTO_6772 ?AUTO_6774 ) ) ( not ( = ?AUTO_6776 ?AUTO_6773 ) ) ( not ( = ?AUTO_6776 ?AUTO_6774 ) ) ( not ( = ?AUTO_6773 ?AUTO_6774 ) ) ( ON ?AUTO_6773 ?AUTO_6772 ) ( not ( = ?AUTO_6771 ?AUTO_6775 ) ) ( not ( = ?AUTO_6772 ?AUTO_6775 ) ) ( not ( = ?AUTO_6776 ?AUTO_6775 ) ) ( not ( = ?AUTO_6774 ?AUTO_6775 ) ) ( not ( = ?AUTO_6773 ?AUTO_6775 ) ) ( ON ?AUTO_6775 ?AUTO_6773 ) ( not ( = ?AUTO_6771 ?AUTO_6777 ) ) ( not ( = ?AUTO_6772 ?AUTO_6777 ) ) ( not ( = ?AUTO_6776 ?AUTO_6777 ) ) ( not ( = ?AUTO_6774 ?AUTO_6777 ) ) ( not ( = ?AUTO_6773 ?AUTO_6777 ) ) ( not ( = ?AUTO_6775 ?AUTO_6777 ) ) ( ON ?AUTO_6777 ?AUTO_6775 ) ( CLEAR ?AUTO_6777 ) ( HOLDING ?AUTO_6771 ) ( CLEAR ?AUTO_6776 ) )
    :subtasks
    ( ( !STACK ?AUTO_6771 ?AUTO_6776 )
      ( MAKE-ON ?AUTO_6771 ?AUTO_6772 )
      ( MAKE-ON-VERIFY ?AUTO_6771 ?AUTO_6772 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6778 - BLOCK
      ?AUTO_6779 - BLOCK
    )
    :vars
    (
      ?AUTO_6782 - BLOCK
      ?AUTO_6781 - BLOCK
      ?AUTO_6784 - BLOCK
      ?AUTO_6783 - BLOCK
      ?AUTO_6780 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6778 ?AUTO_6779 ) ) ( not ( = ?AUTO_6778 ?AUTO_6782 ) ) ( not ( = ?AUTO_6779 ?AUTO_6782 ) ) ( CLEAR ?AUTO_6781 ) ( not ( = ?AUTO_6778 ?AUTO_6784 ) ) ( not ( = ?AUTO_6778 ?AUTO_6781 ) ) ( not ( = ?AUTO_6779 ?AUTO_6784 ) ) ( not ( = ?AUTO_6779 ?AUTO_6781 ) ) ( not ( = ?AUTO_6782 ?AUTO_6784 ) ) ( not ( = ?AUTO_6782 ?AUTO_6781 ) ) ( not ( = ?AUTO_6784 ?AUTO_6781 ) ) ( ON ?AUTO_6784 ?AUTO_6779 ) ( not ( = ?AUTO_6778 ?AUTO_6783 ) ) ( not ( = ?AUTO_6779 ?AUTO_6783 ) ) ( not ( = ?AUTO_6782 ?AUTO_6783 ) ) ( not ( = ?AUTO_6781 ?AUTO_6783 ) ) ( not ( = ?AUTO_6784 ?AUTO_6783 ) ) ( ON ?AUTO_6783 ?AUTO_6784 ) ( not ( = ?AUTO_6778 ?AUTO_6780 ) ) ( not ( = ?AUTO_6779 ?AUTO_6780 ) ) ( not ( = ?AUTO_6782 ?AUTO_6780 ) ) ( not ( = ?AUTO_6781 ?AUTO_6780 ) ) ( not ( = ?AUTO_6784 ?AUTO_6780 ) ) ( not ( = ?AUTO_6783 ?AUTO_6780 ) ) ( ON ?AUTO_6780 ?AUTO_6783 ) ( CLEAR ?AUTO_6782 ) ( ON ?AUTO_6778 ?AUTO_6780 ) ( CLEAR ?AUTO_6778 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6778 ?AUTO_6780 )
      ( MAKE-ON ?AUTO_6778 ?AUTO_6779 )
      ( MAKE-ON-VERIFY ?AUTO_6778 ?AUTO_6779 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6785 - BLOCK
      ?AUTO_6786 - BLOCK
    )
    :vars
    (
      ?AUTO_6789 - BLOCK
      ?AUTO_6787 - BLOCK
      ?AUTO_6790 - BLOCK
      ?AUTO_6791 - BLOCK
      ?AUTO_6788 - BLOCK
      ?AUTO_6792 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6785 ?AUTO_6786 ) ) ( not ( = ?AUTO_6785 ?AUTO_6789 ) ) ( not ( = ?AUTO_6786 ?AUTO_6789 ) ) ( CLEAR ?AUTO_6787 ) ( not ( = ?AUTO_6785 ?AUTO_6790 ) ) ( not ( = ?AUTO_6785 ?AUTO_6787 ) ) ( not ( = ?AUTO_6786 ?AUTO_6790 ) ) ( not ( = ?AUTO_6786 ?AUTO_6787 ) ) ( not ( = ?AUTO_6789 ?AUTO_6790 ) ) ( not ( = ?AUTO_6789 ?AUTO_6787 ) ) ( not ( = ?AUTO_6790 ?AUTO_6787 ) ) ( ON ?AUTO_6790 ?AUTO_6786 ) ( not ( = ?AUTO_6785 ?AUTO_6791 ) ) ( not ( = ?AUTO_6786 ?AUTO_6791 ) ) ( not ( = ?AUTO_6789 ?AUTO_6791 ) ) ( not ( = ?AUTO_6787 ?AUTO_6791 ) ) ( not ( = ?AUTO_6790 ?AUTO_6791 ) ) ( ON ?AUTO_6791 ?AUTO_6790 ) ( not ( = ?AUTO_6785 ?AUTO_6788 ) ) ( not ( = ?AUTO_6786 ?AUTO_6788 ) ) ( not ( = ?AUTO_6789 ?AUTO_6788 ) ) ( not ( = ?AUTO_6787 ?AUTO_6788 ) ) ( not ( = ?AUTO_6790 ?AUTO_6788 ) ) ( not ( = ?AUTO_6791 ?AUTO_6788 ) ) ( ON ?AUTO_6788 ?AUTO_6791 ) ( ON ?AUTO_6785 ?AUTO_6788 ) ( CLEAR ?AUTO_6785 ) ( HOLDING ?AUTO_6789 ) ( CLEAR ?AUTO_6792 ) ( not ( = ?AUTO_6785 ?AUTO_6792 ) ) ( not ( = ?AUTO_6786 ?AUTO_6792 ) ) ( not ( = ?AUTO_6789 ?AUTO_6792 ) ) ( not ( = ?AUTO_6787 ?AUTO_6792 ) ) ( not ( = ?AUTO_6790 ?AUTO_6792 ) ) ( not ( = ?AUTO_6791 ?AUTO_6792 ) ) ( not ( = ?AUTO_6788 ?AUTO_6792 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_6789 ?AUTO_6792 )
      ( MAKE-ON ?AUTO_6785 ?AUTO_6786 )
      ( MAKE-ON-VERIFY ?AUTO_6785 ?AUTO_6786 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6809 - BLOCK
      ?AUTO_6810 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6809 ) ( CLEAR ?AUTO_6810 ) ( not ( = ?AUTO_6809 ?AUTO_6810 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_6809 ?AUTO_6810 )
      ( MAKE-ON-VERIFY ?AUTO_6809 ?AUTO_6810 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6811 - BLOCK
      ?AUTO_6812 - BLOCK
    )
    :vars
    (
      ?AUTO_6813 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6812 ) ( not ( = ?AUTO_6811 ?AUTO_6812 ) ) ( ON ?AUTO_6811 ?AUTO_6813 ) ( CLEAR ?AUTO_6811 ) ( HAND-EMPTY ) ( not ( = ?AUTO_6811 ?AUTO_6813 ) ) ( not ( = ?AUTO_6812 ?AUTO_6813 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6811 ?AUTO_6813 )
      ( MAKE-ON ?AUTO_6811 ?AUTO_6812 )
      ( MAKE-ON-VERIFY ?AUTO_6811 ?AUTO_6812 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6814 - BLOCK
      ?AUTO_6815 - BLOCK
    )
    :vars
    (
      ?AUTO_6816 - BLOCK
      ?AUTO_6817 - BLOCK
      ?AUTO_6818 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6815 ) ( not ( = ?AUTO_6814 ?AUTO_6815 ) ) ( ON ?AUTO_6814 ?AUTO_6816 ) ( CLEAR ?AUTO_6814 ) ( not ( = ?AUTO_6814 ?AUTO_6816 ) ) ( not ( = ?AUTO_6815 ?AUTO_6816 ) ) ( HOLDING ?AUTO_6817 ) ( CLEAR ?AUTO_6818 ) ( not ( = ?AUTO_6814 ?AUTO_6817 ) ) ( not ( = ?AUTO_6814 ?AUTO_6818 ) ) ( not ( = ?AUTO_6815 ?AUTO_6817 ) ) ( not ( = ?AUTO_6815 ?AUTO_6818 ) ) ( not ( = ?AUTO_6816 ?AUTO_6817 ) ) ( not ( = ?AUTO_6816 ?AUTO_6818 ) ) ( not ( = ?AUTO_6817 ?AUTO_6818 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_6817 ?AUTO_6818 )
      ( MAKE-ON ?AUTO_6814 ?AUTO_6815 )
      ( MAKE-ON-VERIFY ?AUTO_6814 ?AUTO_6815 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6819 - BLOCK
      ?AUTO_6820 - BLOCK
    )
    :vars
    (
      ?AUTO_6821 - BLOCK
      ?AUTO_6822 - BLOCK
      ?AUTO_6823 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6820 ) ( not ( = ?AUTO_6819 ?AUTO_6820 ) ) ( ON ?AUTO_6819 ?AUTO_6821 ) ( not ( = ?AUTO_6819 ?AUTO_6821 ) ) ( not ( = ?AUTO_6820 ?AUTO_6821 ) ) ( CLEAR ?AUTO_6822 ) ( not ( = ?AUTO_6819 ?AUTO_6823 ) ) ( not ( = ?AUTO_6819 ?AUTO_6822 ) ) ( not ( = ?AUTO_6820 ?AUTO_6823 ) ) ( not ( = ?AUTO_6820 ?AUTO_6822 ) ) ( not ( = ?AUTO_6821 ?AUTO_6823 ) ) ( not ( = ?AUTO_6821 ?AUTO_6822 ) ) ( not ( = ?AUTO_6823 ?AUTO_6822 ) ) ( ON ?AUTO_6823 ?AUTO_6819 ) ( CLEAR ?AUTO_6823 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6823 ?AUTO_6819 )
      ( MAKE-ON ?AUTO_6819 ?AUTO_6820 )
      ( MAKE-ON-VERIFY ?AUTO_6819 ?AUTO_6820 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6824 - BLOCK
      ?AUTO_6825 - BLOCK
    )
    :vars
    (
      ?AUTO_6826 - BLOCK
      ?AUTO_6828 - BLOCK
      ?AUTO_6827 - BLOCK
      ?AUTO_6829 - BLOCK
      ?AUTO_6830 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6825 ) ( not ( = ?AUTO_6824 ?AUTO_6825 ) ) ( ON ?AUTO_6824 ?AUTO_6826 ) ( not ( = ?AUTO_6824 ?AUTO_6826 ) ) ( not ( = ?AUTO_6825 ?AUTO_6826 ) ) ( CLEAR ?AUTO_6828 ) ( not ( = ?AUTO_6824 ?AUTO_6827 ) ) ( not ( = ?AUTO_6824 ?AUTO_6828 ) ) ( not ( = ?AUTO_6825 ?AUTO_6827 ) ) ( not ( = ?AUTO_6825 ?AUTO_6828 ) ) ( not ( = ?AUTO_6826 ?AUTO_6827 ) ) ( not ( = ?AUTO_6826 ?AUTO_6828 ) ) ( not ( = ?AUTO_6827 ?AUTO_6828 ) ) ( ON ?AUTO_6827 ?AUTO_6824 ) ( CLEAR ?AUTO_6827 ) ( HOLDING ?AUTO_6829 ) ( CLEAR ?AUTO_6830 ) ( not ( = ?AUTO_6824 ?AUTO_6829 ) ) ( not ( = ?AUTO_6824 ?AUTO_6830 ) ) ( not ( = ?AUTO_6825 ?AUTO_6829 ) ) ( not ( = ?AUTO_6825 ?AUTO_6830 ) ) ( not ( = ?AUTO_6826 ?AUTO_6829 ) ) ( not ( = ?AUTO_6826 ?AUTO_6830 ) ) ( not ( = ?AUTO_6828 ?AUTO_6829 ) ) ( not ( = ?AUTO_6828 ?AUTO_6830 ) ) ( not ( = ?AUTO_6827 ?AUTO_6829 ) ) ( not ( = ?AUTO_6827 ?AUTO_6830 ) ) ( not ( = ?AUTO_6829 ?AUTO_6830 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_6829 ?AUTO_6830 )
      ( MAKE-ON ?AUTO_6824 ?AUTO_6825 )
      ( MAKE-ON-VERIFY ?AUTO_6824 ?AUTO_6825 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6841 - BLOCK
      ?AUTO_6842 - BLOCK
    )
    :vars
    (
      ?AUTO_6844 - BLOCK
      ?AUTO_6845 - BLOCK
      ?AUTO_6843 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6841 ?AUTO_6842 ) ) ( ON ?AUTO_6841 ?AUTO_6844 ) ( not ( = ?AUTO_6841 ?AUTO_6844 ) ) ( not ( = ?AUTO_6842 ?AUTO_6844 ) ) ( CLEAR ?AUTO_6845 ) ( not ( = ?AUTO_6841 ?AUTO_6843 ) ) ( not ( = ?AUTO_6841 ?AUTO_6845 ) ) ( not ( = ?AUTO_6842 ?AUTO_6843 ) ) ( not ( = ?AUTO_6842 ?AUTO_6845 ) ) ( not ( = ?AUTO_6844 ?AUTO_6843 ) ) ( not ( = ?AUTO_6844 ?AUTO_6845 ) ) ( not ( = ?AUTO_6843 ?AUTO_6845 ) ) ( ON ?AUTO_6843 ?AUTO_6841 ) ( CLEAR ?AUTO_6843 ) ( HOLDING ?AUTO_6842 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6842 )
      ( MAKE-ON ?AUTO_6841 ?AUTO_6842 )
      ( MAKE-ON-VERIFY ?AUTO_6841 ?AUTO_6842 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6852 - BLOCK
      ?AUTO_6853 - BLOCK
    )
    :vars
    (
      ?AUTO_6854 - BLOCK
      ?AUTO_6856 - BLOCK
      ?AUTO_6855 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6852 ?AUTO_6853 ) ) ( not ( = ?AUTO_6852 ?AUTO_6854 ) ) ( not ( = ?AUTO_6853 ?AUTO_6854 ) ) ( CLEAR ?AUTO_6856 ) ( not ( = ?AUTO_6852 ?AUTO_6855 ) ) ( not ( = ?AUTO_6852 ?AUTO_6856 ) ) ( not ( = ?AUTO_6853 ?AUTO_6855 ) ) ( not ( = ?AUTO_6853 ?AUTO_6856 ) ) ( not ( = ?AUTO_6854 ?AUTO_6855 ) ) ( not ( = ?AUTO_6854 ?AUTO_6856 ) ) ( not ( = ?AUTO_6855 ?AUTO_6856 ) ) ( ON ?AUTO_6855 ?AUTO_6853 ) ( CLEAR ?AUTO_6855 ) ( HOLDING ?AUTO_6852 ) ( CLEAR ?AUTO_6854 ) )
    :subtasks
    ( ( !STACK ?AUTO_6852 ?AUTO_6854 )
      ( MAKE-ON ?AUTO_6852 ?AUTO_6853 )
      ( MAKE-ON-VERIFY ?AUTO_6852 ?AUTO_6853 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6857 - BLOCK
      ?AUTO_6858 - BLOCK
    )
    :vars
    (
      ?AUTO_6860 - BLOCK
      ?AUTO_6861 - BLOCK
      ?AUTO_6859 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6857 ?AUTO_6858 ) ) ( not ( = ?AUTO_6857 ?AUTO_6860 ) ) ( not ( = ?AUTO_6858 ?AUTO_6860 ) ) ( CLEAR ?AUTO_6861 ) ( not ( = ?AUTO_6857 ?AUTO_6859 ) ) ( not ( = ?AUTO_6857 ?AUTO_6861 ) ) ( not ( = ?AUTO_6858 ?AUTO_6859 ) ) ( not ( = ?AUTO_6858 ?AUTO_6861 ) ) ( not ( = ?AUTO_6860 ?AUTO_6859 ) ) ( not ( = ?AUTO_6860 ?AUTO_6861 ) ) ( not ( = ?AUTO_6859 ?AUTO_6861 ) ) ( ON ?AUTO_6859 ?AUTO_6858 ) ( CLEAR ?AUTO_6859 ) ( CLEAR ?AUTO_6860 ) ( ON-TABLE ?AUTO_6857 ) ( CLEAR ?AUTO_6857 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_6857 )
      ( MAKE-ON ?AUTO_6857 ?AUTO_6858 )
      ( MAKE-ON-VERIFY ?AUTO_6857 ?AUTO_6858 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6862 - BLOCK
      ?AUTO_6863 - BLOCK
    )
    :vars
    (
      ?AUTO_6864 - BLOCK
      ?AUTO_6866 - BLOCK
      ?AUTO_6865 - BLOCK
      ?AUTO_6867 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6862 ?AUTO_6863 ) ) ( not ( = ?AUTO_6862 ?AUTO_6864 ) ) ( not ( = ?AUTO_6863 ?AUTO_6864 ) ) ( CLEAR ?AUTO_6866 ) ( not ( = ?AUTO_6862 ?AUTO_6865 ) ) ( not ( = ?AUTO_6862 ?AUTO_6866 ) ) ( not ( = ?AUTO_6863 ?AUTO_6865 ) ) ( not ( = ?AUTO_6863 ?AUTO_6866 ) ) ( not ( = ?AUTO_6864 ?AUTO_6865 ) ) ( not ( = ?AUTO_6864 ?AUTO_6866 ) ) ( not ( = ?AUTO_6865 ?AUTO_6866 ) ) ( ON ?AUTO_6865 ?AUTO_6863 ) ( CLEAR ?AUTO_6865 ) ( ON-TABLE ?AUTO_6862 ) ( CLEAR ?AUTO_6862 ) ( HOLDING ?AUTO_6864 ) ( CLEAR ?AUTO_6867 ) ( not ( = ?AUTO_6862 ?AUTO_6867 ) ) ( not ( = ?AUTO_6863 ?AUTO_6867 ) ) ( not ( = ?AUTO_6864 ?AUTO_6867 ) ) ( not ( = ?AUTO_6866 ?AUTO_6867 ) ) ( not ( = ?AUTO_6865 ?AUTO_6867 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_6864 ?AUTO_6867 )
      ( MAKE-ON ?AUTO_6862 ?AUTO_6863 )
      ( MAKE-ON-VERIFY ?AUTO_6862 ?AUTO_6863 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6868 - BLOCK
      ?AUTO_6869 - BLOCK
    )
    :vars
    (
      ?AUTO_6871 - BLOCK
      ?AUTO_6870 - BLOCK
      ?AUTO_6872 - BLOCK
      ?AUTO_6873 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6868 ?AUTO_6869 ) ) ( not ( = ?AUTO_6868 ?AUTO_6871 ) ) ( not ( = ?AUTO_6869 ?AUTO_6871 ) ) ( CLEAR ?AUTO_6870 ) ( not ( = ?AUTO_6868 ?AUTO_6872 ) ) ( not ( = ?AUTO_6868 ?AUTO_6870 ) ) ( not ( = ?AUTO_6869 ?AUTO_6872 ) ) ( not ( = ?AUTO_6869 ?AUTO_6870 ) ) ( not ( = ?AUTO_6871 ?AUTO_6872 ) ) ( not ( = ?AUTO_6871 ?AUTO_6870 ) ) ( not ( = ?AUTO_6872 ?AUTO_6870 ) ) ( ON ?AUTO_6872 ?AUTO_6869 ) ( CLEAR ?AUTO_6872 ) ( ON-TABLE ?AUTO_6868 ) ( CLEAR ?AUTO_6873 ) ( not ( = ?AUTO_6868 ?AUTO_6873 ) ) ( not ( = ?AUTO_6869 ?AUTO_6873 ) ) ( not ( = ?AUTO_6871 ?AUTO_6873 ) ) ( not ( = ?AUTO_6870 ?AUTO_6873 ) ) ( not ( = ?AUTO_6872 ?AUTO_6873 ) ) ( ON ?AUTO_6871 ?AUTO_6868 ) ( CLEAR ?AUTO_6871 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6871 ?AUTO_6868 )
      ( MAKE-ON ?AUTO_6868 ?AUTO_6869 )
      ( MAKE-ON-VERIFY ?AUTO_6868 ?AUTO_6869 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6874 - BLOCK
      ?AUTO_6875 - BLOCK
    )
    :vars
    (
      ?AUTO_6877 - BLOCK
      ?AUTO_6878 - BLOCK
      ?AUTO_6879 - BLOCK
      ?AUTO_6876 - BLOCK
      ?AUTO_6880 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6874 ?AUTO_6875 ) ) ( not ( = ?AUTO_6874 ?AUTO_6877 ) ) ( not ( = ?AUTO_6875 ?AUTO_6877 ) ) ( not ( = ?AUTO_6874 ?AUTO_6878 ) ) ( not ( = ?AUTO_6874 ?AUTO_6879 ) ) ( not ( = ?AUTO_6875 ?AUTO_6878 ) ) ( not ( = ?AUTO_6875 ?AUTO_6879 ) ) ( not ( = ?AUTO_6877 ?AUTO_6878 ) ) ( not ( = ?AUTO_6877 ?AUTO_6879 ) ) ( not ( = ?AUTO_6878 ?AUTO_6879 ) ) ( ON ?AUTO_6878 ?AUTO_6875 ) ( CLEAR ?AUTO_6878 ) ( ON-TABLE ?AUTO_6874 ) ( CLEAR ?AUTO_6876 ) ( not ( = ?AUTO_6874 ?AUTO_6876 ) ) ( not ( = ?AUTO_6875 ?AUTO_6876 ) ) ( not ( = ?AUTO_6877 ?AUTO_6876 ) ) ( not ( = ?AUTO_6879 ?AUTO_6876 ) ) ( not ( = ?AUTO_6878 ?AUTO_6876 ) ) ( ON ?AUTO_6877 ?AUTO_6874 ) ( CLEAR ?AUTO_6877 ) ( HOLDING ?AUTO_6879 ) ( CLEAR ?AUTO_6880 ) ( not ( = ?AUTO_6874 ?AUTO_6880 ) ) ( not ( = ?AUTO_6875 ?AUTO_6880 ) ) ( not ( = ?AUTO_6877 ?AUTO_6880 ) ) ( not ( = ?AUTO_6878 ?AUTO_6880 ) ) ( not ( = ?AUTO_6879 ?AUTO_6880 ) ) ( not ( = ?AUTO_6876 ?AUTO_6880 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_6879 ?AUTO_6880 )
      ( MAKE-ON ?AUTO_6874 ?AUTO_6875 )
      ( MAKE-ON-VERIFY ?AUTO_6874 ?AUTO_6875 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6885 - BLOCK
      ?AUTO_6886 - BLOCK
    )
    :vars
    (
      ?AUTO_6889 - BLOCK
      ?AUTO_6888 - BLOCK
      ?AUTO_6891 - BLOCK
      ?AUTO_6890 - BLOCK
      ?AUTO_6887 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6885 ?AUTO_6886 ) ) ( not ( = ?AUTO_6885 ?AUTO_6889 ) ) ( not ( = ?AUTO_6886 ?AUTO_6889 ) ) ( not ( = ?AUTO_6885 ?AUTO_6888 ) ) ( not ( = ?AUTO_6885 ?AUTO_6891 ) ) ( not ( = ?AUTO_6886 ?AUTO_6888 ) ) ( not ( = ?AUTO_6886 ?AUTO_6891 ) ) ( not ( = ?AUTO_6889 ?AUTO_6888 ) ) ( not ( = ?AUTO_6889 ?AUTO_6891 ) ) ( not ( = ?AUTO_6888 ?AUTO_6891 ) ) ( ON ?AUTO_6888 ?AUTO_6886 ) ( CLEAR ?AUTO_6888 ) ( ON-TABLE ?AUTO_6885 ) ( CLEAR ?AUTO_6890 ) ( not ( = ?AUTO_6885 ?AUTO_6890 ) ) ( not ( = ?AUTO_6886 ?AUTO_6890 ) ) ( not ( = ?AUTO_6889 ?AUTO_6890 ) ) ( not ( = ?AUTO_6891 ?AUTO_6890 ) ) ( not ( = ?AUTO_6888 ?AUTO_6890 ) ) ( ON ?AUTO_6889 ?AUTO_6885 ) ( CLEAR ?AUTO_6887 ) ( not ( = ?AUTO_6885 ?AUTO_6887 ) ) ( not ( = ?AUTO_6886 ?AUTO_6887 ) ) ( not ( = ?AUTO_6889 ?AUTO_6887 ) ) ( not ( = ?AUTO_6888 ?AUTO_6887 ) ) ( not ( = ?AUTO_6891 ?AUTO_6887 ) ) ( not ( = ?AUTO_6890 ?AUTO_6887 ) ) ( ON ?AUTO_6891 ?AUTO_6889 ) ( CLEAR ?AUTO_6891 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6891 ?AUTO_6889 )
      ( MAKE-ON ?AUTO_6885 ?AUTO_6886 )
      ( MAKE-ON-VERIFY ?AUTO_6885 ?AUTO_6886 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6894 - BLOCK
      ?AUTO_6895 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6894 ) ( CLEAR ?AUTO_6895 ) ( not ( = ?AUTO_6894 ?AUTO_6895 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_6894 ?AUTO_6895 )
      ( MAKE-ON-VERIFY ?AUTO_6894 ?AUTO_6895 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6896 - BLOCK
      ?AUTO_6897 - BLOCK
    )
    :vars
    (
      ?AUTO_6898 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6897 ) ( not ( = ?AUTO_6896 ?AUTO_6897 ) ) ( ON ?AUTO_6896 ?AUTO_6898 ) ( CLEAR ?AUTO_6896 ) ( HAND-EMPTY ) ( not ( = ?AUTO_6896 ?AUTO_6898 ) ) ( not ( = ?AUTO_6897 ?AUTO_6898 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6896 ?AUTO_6898 )
      ( MAKE-ON ?AUTO_6896 ?AUTO_6897 )
      ( MAKE-ON-VERIFY ?AUTO_6896 ?AUTO_6897 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6899 - BLOCK
      ?AUTO_6900 - BLOCK
    )
    :vars
    (
      ?AUTO_6901 - BLOCK
      ?AUTO_6902 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_6899 ?AUTO_6900 ) ) ( ON ?AUTO_6899 ?AUTO_6901 ) ( CLEAR ?AUTO_6899 ) ( not ( = ?AUTO_6899 ?AUTO_6901 ) ) ( not ( = ?AUTO_6900 ?AUTO_6901 ) ) ( HOLDING ?AUTO_6900 ) ( CLEAR ?AUTO_6902 ) ( not ( = ?AUTO_6899 ?AUTO_6902 ) ) ( not ( = ?AUTO_6900 ?AUTO_6902 ) ) ( not ( = ?AUTO_6901 ?AUTO_6902 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_6900 ?AUTO_6902 )
      ( MAKE-ON ?AUTO_6899 ?AUTO_6900 )
      ( MAKE-ON-VERIFY ?AUTO_6899 ?AUTO_6900 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6975 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6975 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6975 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6975 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6976 - BLOCK
    )
    :vars
    (
      ?AUTO_6977 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6976 ?AUTO_6977 ) ( CLEAR ?AUTO_6976 ) ( HAND-EMPTY ) ( not ( = ?AUTO_6976 ?AUTO_6977 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6976 ?AUTO_6977 )
      ( MAKE-ON-TABLE ?AUTO_6976 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6976 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6978 - BLOCK
    )
    :vars
    (
      ?AUTO_6979 - BLOCK
      ?AUTO_6980 - BLOCK
      ?AUTO_6981 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6978 ?AUTO_6979 ) ( CLEAR ?AUTO_6978 ) ( not ( = ?AUTO_6978 ?AUTO_6979 ) ) ( HOLDING ?AUTO_6980 ) ( CLEAR ?AUTO_6981 ) ( not ( = ?AUTO_6978 ?AUTO_6980 ) ) ( not ( = ?AUTO_6978 ?AUTO_6981 ) ) ( not ( = ?AUTO_6979 ?AUTO_6980 ) ) ( not ( = ?AUTO_6979 ?AUTO_6981 ) ) ( not ( = ?AUTO_6980 ?AUTO_6981 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_6980 ?AUTO_6981 )
      ( MAKE-ON-TABLE ?AUTO_6978 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6978 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6984 - BLOCK
    )
    :vars
    (
      ?AUTO_6987 - BLOCK
      ?AUTO_6985 - BLOCK
      ?AUTO_6986 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6984 ?AUTO_6987 ) ( not ( = ?AUTO_6984 ?AUTO_6987 ) ) ( CLEAR ?AUTO_6985 ) ( not ( = ?AUTO_6984 ?AUTO_6986 ) ) ( not ( = ?AUTO_6984 ?AUTO_6985 ) ) ( not ( = ?AUTO_6987 ?AUTO_6986 ) ) ( not ( = ?AUTO_6987 ?AUTO_6985 ) ) ( not ( = ?AUTO_6986 ?AUTO_6985 ) ) ( ON ?AUTO_6986 ?AUTO_6984 ) ( CLEAR ?AUTO_6986 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6986 ?AUTO_6984 )
      ( MAKE-ON-TABLE ?AUTO_6984 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6984 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6988 - BLOCK
    )
    :vars
    (
      ?AUTO_6991 - BLOCK
      ?AUTO_6990 - BLOCK
      ?AUTO_6989 - BLOCK
      ?AUTO_6992 - BLOCK
      ?AUTO_6993 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6988 ?AUTO_6991 ) ( not ( = ?AUTO_6988 ?AUTO_6991 ) ) ( CLEAR ?AUTO_6990 ) ( not ( = ?AUTO_6988 ?AUTO_6989 ) ) ( not ( = ?AUTO_6988 ?AUTO_6990 ) ) ( not ( = ?AUTO_6991 ?AUTO_6989 ) ) ( not ( = ?AUTO_6991 ?AUTO_6990 ) ) ( not ( = ?AUTO_6989 ?AUTO_6990 ) ) ( ON ?AUTO_6989 ?AUTO_6988 ) ( CLEAR ?AUTO_6989 ) ( HOLDING ?AUTO_6992 ) ( CLEAR ?AUTO_6993 ) ( not ( = ?AUTO_6988 ?AUTO_6992 ) ) ( not ( = ?AUTO_6988 ?AUTO_6993 ) ) ( not ( = ?AUTO_6991 ?AUTO_6992 ) ) ( not ( = ?AUTO_6991 ?AUTO_6993 ) ) ( not ( = ?AUTO_6990 ?AUTO_6992 ) ) ( not ( = ?AUTO_6990 ?AUTO_6993 ) ) ( not ( = ?AUTO_6989 ?AUTO_6992 ) ) ( not ( = ?AUTO_6989 ?AUTO_6993 ) ) ( not ( = ?AUTO_6992 ?AUTO_6993 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_6992 ?AUTO_6993 )
      ( MAKE-ON-TABLE ?AUTO_6988 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6988 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6994 - BLOCK
    )
    :vars
    (
      ?AUTO_6999 - BLOCK
      ?AUTO_6995 - BLOCK
      ?AUTO_6996 - BLOCK
      ?AUTO_6998 - BLOCK
      ?AUTO_6997 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6994 ?AUTO_6999 ) ( not ( = ?AUTO_6994 ?AUTO_6999 ) ) ( CLEAR ?AUTO_6995 ) ( not ( = ?AUTO_6994 ?AUTO_6996 ) ) ( not ( = ?AUTO_6994 ?AUTO_6995 ) ) ( not ( = ?AUTO_6999 ?AUTO_6996 ) ) ( not ( = ?AUTO_6999 ?AUTO_6995 ) ) ( not ( = ?AUTO_6996 ?AUTO_6995 ) ) ( ON ?AUTO_6996 ?AUTO_6994 ) ( CLEAR ?AUTO_6998 ) ( not ( = ?AUTO_6994 ?AUTO_6997 ) ) ( not ( = ?AUTO_6994 ?AUTO_6998 ) ) ( not ( = ?AUTO_6999 ?AUTO_6997 ) ) ( not ( = ?AUTO_6999 ?AUTO_6998 ) ) ( not ( = ?AUTO_6995 ?AUTO_6997 ) ) ( not ( = ?AUTO_6995 ?AUTO_6998 ) ) ( not ( = ?AUTO_6996 ?AUTO_6997 ) ) ( not ( = ?AUTO_6996 ?AUTO_6998 ) ) ( not ( = ?AUTO_6997 ?AUTO_6998 ) ) ( ON ?AUTO_6997 ?AUTO_6996 ) ( CLEAR ?AUTO_6997 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6997 ?AUTO_6996 )
      ( MAKE-ON-TABLE ?AUTO_6994 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6994 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_7000 - BLOCK
    )
    :vars
    (
      ?AUTO_7005 - BLOCK
      ?AUTO_7001 - BLOCK
      ?AUTO_7002 - BLOCK
      ?AUTO_7004 - BLOCK
      ?AUTO_7003 - BLOCK
      ?AUTO_7006 - BLOCK
      ?AUTO_7007 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7000 ?AUTO_7005 ) ( not ( = ?AUTO_7000 ?AUTO_7005 ) ) ( CLEAR ?AUTO_7001 ) ( not ( = ?AUTO_7000 ?AUTO_7002 ) ) ( not ( = ?AUTO_7000 ?AUTO_7001 ) ) ( not ( = ?AUTO_7005 ?AUTO_7002 ) ) ( not ( = ?AUTO_7005 ?AUTO_7001 ) ) ( not ( = ?AUTO_7002 ?AUTO_7001 ) ) ( ON ?AUTO_7002 ?AUTO_7000 ) ( CLEAR ?AUTO_7004 ) ( not ( = ?AUTO_7000 ?AUTO_7003 ) ) ( not ( = ?AUTO_7000 ?AUTO_7004 ) ) ( not ( = ?AUTO_7005 ?AUTO_7003 ) ) ( not ( = ?AUTO_7005 ?AUTO_7004 ) ) ( not ( = ?AUTO_7001 ?AUTO_7003 ) ) ( not ( = ?AUTO_7001 ?AUTO_7004 ) ) ( not ( = ?AUTO_7002 ?AUTO_7003 ) ) ( not ( = ?AUTO_7002 ?AUTO_7004 ) ) ( not ( = ?AUTO_7003 ?AUTO_7004 ) ) ( ON ?AUTO_7003 ?AUTO_7002 ) ( CLEAR ?AUTO_7003 ) ( HOLDING ?AUTO_7006 ) ( CLEAR ?AUTO_7007 ) ( not ( = ?AUTO_7000 ?AUTO_7006 ) ) ( not ( = ?AUTO_7000 ?AUTO_7007 ) ) ( not ( = ?AUTO_7005 ?AUTO_7006 ) ) ( not ( = ?AUTO_7005 ?AUTO_7007 ) ) ( not ( = ?AUTO_7001 ?AUTO_7006 ) ) ( not ( = ?AUTO_7001 ?AUTO_7007 ) ) ( not ( = ?AUTO_7002 ?AUTO_7006 ) ) ( not ( = ?AUTO_7002 ?AUTO_7007 ) ) ( not ( = ?AUTO_7004 ?AUTO_7006 ) ) ( not ( = ?AUTO_7004 ?AUTO_7007 ) ) ( not ( = ?AUTO_7003 ?AUTO_7006 ) ) ( not ( = ?AUTO_7003 ?AUTO_7007 ) ) ( not ( = ?AUTO_7006 ?AUTO_7007 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_7006 ?AUTO_7007 )
      ( MAKE-ON-TABLE ?AUTO_7000 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_7000 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_7013 - BLOCK
    )
    :vars
    (
      ?AUTO_7016 - BLOCK
      ?AUTO_7015 - BLOCK
      ?AUTO_7017 - BLOCK
      ?AUTO_7014 - BLOCK
      ?AUTO_7018 - BLOCK
      ?AUTO_7019 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7013 ?AUTO_7016 ) ( not ( = ?AUTO_7013 ?AUTO_7016 ) ) ( CLEAR ?AUTO_7015 ) ( not ( = ?AUTO_7013 ?AUTO_7017 ) ) ( not ( = ?AUTO_7013 ?AUTO_7015 ) ) ( not ( = ?AUTO_7016 ?AUTO_7017 ) ) ( not ( = ?AUTO_7016 ?AUTO_7015 ) ) ( not ( = ?AUTO_7017 ?AUTO_7015 ) ) ( ON ?AUTO_7017 ?AUTO_7013 ) ( CLEAR ?AUTO_7014 ) ( not ( = ?AUTO_7013 ?AUTO_7018 ) ) ( not ( = ?AUTO_7013 ?AUTO_7014 ) ) ( not ( = ?AUTO_7016 ?AUTO_7018 ) ) ( not ( = ?AUTO_7016 ?AUTO_7014 ) ) ( not ( = ?AUTO_7015 ?AUTO_7018 ) ) ( not ( = ?AUTO_7015 ?AUTO_7014 ) ) ( not ( = ?AUTO_7017 ?AUTO_7018 ) ) ( not ( = ?AUTO_7017 ?AUTO_7014 ) ) ( not ( = ?AUTO_7018 ?AUTO_7014 ) ) ( ON ?AUTO_7018 ?AUTO_7017 ) ( CLEAR ?AUTO_7018 ) ( HOLDING ?AUTO_7019 ) ( not ( = ?AUTO_7013 ?AUTO_7019 ) ) ( not ( = ?AUTO_7016 ?AUTO_7019 ) ) ( not ( = ?AUTO_7015 ?AUTO_7019 ) ) ( not ( = ?AUTO_7017 ?AUTO_7019 ) ) ( not ( = ?AUTO_7014 ?AUTO_7019 ) ) ( not ( = ?AUTO_7018 ?AUTO_7019 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7019 )
      ( MAKE-ON-TABLE ?AUTO_7013 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_7013 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7033 - BLOCK
      ?AUTO_7034 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_7033 ) ( CLEAR ?AUTO_7034 ) ( not ( = ?AUTO_7033 ?AUTO_7034 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_7033 ?AUTO_7034 )
      ( MAKE-ON-VERIFY ?AUTO_7033 ?AUTO_7034 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7035 - BLOCK
      ?AUTO_7036 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7036 ) ( not ( = ?AUTO_7035 ?AUTO_7036 ) ) ( ON-TABLE ?AUTO_7035 ) ( CLEAR ?AUTO_7035 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_7035 )
      ( MAKE-ON ?AUTO_7035 ?AUTO_7036 )
      ( MAKE-ON-VERIFY ?AUTO_7035 ?AUTO_7036 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7037 - BLOCK
      ?AUTO_7038 - BLOCK
    )
    :vars
    (
      ?AUTO_7039 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7038 ) ( not ( = ?AUTO_7037 ?AUTO_7038 ) ) ( ON-TABLE ?AUTO_7037 ) ( CLEAR ?AUTO_7037 ) ( HOLDING ?AUTO_7039 ) ( not ( = ?AUTO_7037 ?AUTO_7039 ) ) ( not ( = ?AUTO_7038 ?AUTO_7039 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7039 )
      ( MAKE-ON ?AUTO_7037 ?AUTO_7038 )
      ( MAKE-ON-VERIFY ?AUTO_7037 ?AUTO_7038 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7040 - BLOCK
      ?AUTO_7041 - BLOCK
    )
    :vars
    (
      ?AUTO_7042 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7041 ) ( not ( = ?AUTO_7040 ?AUTO_7041 ) ) ( ON-TABLE ?AUTO_7040 ) ( not ( = ?AUTO_7040 ?AUTO_7042 ) ) ( not ( = ?AUTO_7041 ?AUTO_7042 ) ) ( ON ?AUTO_7042 ?AUTO_7040 ) ( CLEAR ?AUTO_7042 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7042 ?AUTO_7040 )
      ( MAKE-ON ?AUTO_7040 ?AUTO_7041 )
      ( MAKE-ON-VERIFY ?AUTO_7040 ?AUTO_7041 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7043 - BLOCK
      ?AUTO_7044 - BLOCK
    )
    :vars
    (
      ?AUTO_7045 - BLOCK
      ?AUTO_7046 - BLOCK
      ?AUTO_7047 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7044 ) ( not ( = ?AUTO_7043 ?AUTO_7044 ) ) ( ON-TABLE ?AUTO_7043 ) ( not ( = ?AUTO_7043 ?AUTO_7045 ) ) ( not ( = ?AUTO_7044 ?AUTO_7045 ) ) ( ON ?AUTO_7045 ?AUTO_7043 ) ( CLEAR ?AUTO_7045 ) ( HOLDING ?AUTO_7046 ) ( CLEAR ?AUTO_7047 ) ( not ( = ?AUTO_7043 ?AUTO_7046 ) ) ( not ( = ?AUTO_7043 ?AUTO_7047 ) ) ( not ( = ?AUTO_7044 ?AUTO_7046 ) ) ( not ( = ?AUTO_7044 ?AUTO_7047 ) ) ( not ( = ?AUTO_7045 ?AUTO_7046 ) ) ( not ( = ?AUTO_7045 ?AUTO_7047 ) ) ( not ( = ?AUTO_7046 ?AUTO_7047 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_7046 ?AUTO_7047 )
      ( MAKE-ON ?AUTO_7043 ?AUTO_7044 )
      ( MAKE-ON-VERIFY ?AUTO_7043 ?AUTO_7044 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7048 - BLOCK
      ?AUTO_7049 - BLOCK
    )
    :vars
    (
      ?AUTO_7050 - BLOCK
      ?AUTO_7052 - BLOCK
      ?AUTO_7051 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_7048 ?AUTO_7049 ) ) ( ON-TABLE ?AUTO_7048 ) ( not ( = ?AUTO_7048 ?AUTO_7050 ) ) ( not ( = ?AUTO_7049 ?AUTO_7050 ) ) ( ON ?AUTO_7050 ?AUTO_7048 ) ( CLEAR ?AUTO_7050 ) ( CLEAR ?AUTO_7052 ) ( not ( = ?AUTO_7048 ?AUTO_7051 ) ) ( not ( = ?AUTO_7048 ?AUTO_7052 ) ) ( not ( = ?AUTO_7049 ?AUTO_7051 ) ) ( not ( = ?AUTO_7049 ?AUTO_7052 ) ) ( not ( = ?AUTO_7050 ?AUTO_7051 ) ) ( not ( = ?AUTO_7050 ?AUTO_7052 ) ) ( not ( = ?AUTO_7051 ?AUTO_7052 ) ) ( ON ?AUTO_7051 ?AUTO_7049 ) ( CLEAR ?AUTO_7051 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7051 ?AUTO_7049 )
      ( MAKE-ON ?AUTO_7048 ?AUTO_7049 )
      ( MAKE-ON-VERIFY ?AUTO_7048 ?AUTO_7049 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7053 - BLOCK
      ?AUTO_7054 - BLOCK
    )
    :vars
    (
      ?AUTO_7056 - BLOCK
      ?AUTO_7057 - BLOCK
      ?AUTO_7055 - BLOCK
      ?AUTO_7058 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_7053 ?AUTO_7054 ) ) ( ON-TABLE ?AUTO_7053 ) ( not ( = ?AUTO_7053 ?AUTO_7056 ) ) ( not ( = ?AUTO_7054 ?AUTO_7056 ) ) ( ON ?AUTO_7056 ?AUTO_7053 ) ( CLEAR ?AUTO_7056 ) ( not ( = ?AUTO_7053 ?AUTO_7057 ) ) ( not ( = ?AUTO_7053 ?AUTO_7055 ) ) ( not ( = ?AUTO_7054 ?AUTO_7057 ) ) ( not ( = ?AUTO_7054 ?AUTO_7055 ) ) ( not ( = ?AUTO_7056 ?AUTO_7057 ) ) ( not ( = ?AUTO_7056 ?AUTO_7055 ) ) ( not ( = ?AUTO_7057 ?AUTO_7055 ) ) ( ON ?AUTO_7057 ?AUTO_7054 ) ( CLEAR ?AUTO_7057 ) ( HOLDING ?AUTO_7055 ) ( CLEAR ?AUTO_7058 ) ( not ( = ?AUTO_7053 ?AUTO_7058 ) ) ( not ( = ?AUTO_7054 ?AUTO_7058 ) ) ( not ( = ?AUTO_7056 ?AUTO_7058 ) ) ( not ( = ?AUTO_7057 ?AUTO_7058 ) ) ( not ( = ?AUTO_7055 ?AUTO_7058 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_7055 ?AUTO_7058 )
      ( MAKE-ON ?AUTO_7053 ?AUTO_7054 )
      ( MAKE-ON-VERIFY ?AUTO_7053 ?AUTO_7054 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7059 - BLOCK
      ?AUTO_7060 - BLOCK
    )
    :vars
    (
      ?AUTO_7061 - BLOCK
      ?AUTO_7064 - BLOCK
      ?AUTO_7062 - BLOCK
      ?AUTO_7063 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_7059 ?AUTO_7060 ) ) ( ON-TABLE ?AUTO_7059 ) ( not ( = ?AUTO_7059 ?AUTO_7061 ) ) ( not ( = ?AUTO_7060 ?AUTO_7061 ) ) ( ON ?AUTO_7061 ?AUTO_7059 ) ( not ( = ?AUTO_7059 ?AUTO_7064 ) ) ( not ( = ?AUTO_7059 ?AUTO_7062 ) ) ( not ( = ?AUTO_7060 ?AUTO_7064 ) ) ( not ( = ?AUTO_7060 ?AUTO_7062 ) ) ( not ( = ?AUTO_7061 ?AUTO_7064 ) ) ( not ( = ?AUTO_7061 ?AUTO_7062 ) ) ( not ( = ?AUTO_7064 ?AUTO_7062 ) ) ( ON ?AUTO_7064 ?AUTO_7060 ) ( CLEAR ?AUTO_7064 ) ( CLEAR ?AUTO_7063 ) ( not ( = ?AUTO_7059 ?AUTO_7063 ) ) ( not ( = ?AUTO_7060 ?AUTO_7063 ) ) ( not ( = ?AUTO_7061 ?AUTO_7063 ) ) ( not ( = ?AUTO_7064 ?AUTO_7063 ) ) ( not ( = ?AUTO_7062 ?AUTO_7063 ) ) ( ON ?AUTO_7062 ?AUTO_7061 ) ( CLEAR ?AUTO_7062 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7062 ?AUTO_7061 )
      ( MAKE-ON ?AUTO_7059 ?AUTO_7060 )
      ( MAKE-ON-VERIFY ?AUTO_7059 ?AUTO_7060 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7065 - BLOCK
      ?AUTO_7066 - BLOCK
    )
    :vars
    (
      ?AUTO_7067 - BLOCK
      ?AUTO_7069 - BLOCK
      ?AUTO_7070 - BLOCK
      ?AUTO_7068 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_7065 ?AUTO_7066 ) ) ( ON-TABLE ?AUTO_7065 ) ( not ( = ?AUTO_7065 ?AUTO_7067 ) ) ( not ( = ?AUTO_7066 ?AUTO_7067 ) ) ( ON ?AUTO_7067 ?AUTO_7065 ) ( not ( = ?AUTO_7065 ?AUTO_7069 ) ) ( not ( = ?AUTO_7065 ?AUTO_7070 ) ) ( not ( = ?AUTO_7066 ?AUTO_7069 ) ) ( not ( = ?AUTO_7066 ?AUTO_7070 ) ) ( not ( = ?AUTO_7067 ?AUTO_7069 ) ) ( not ( = ?AUTO_7067 ?AUTO_7070 ) ) ( not ( = ?AUTO_7069 ?AUTO_7070 ) ) ( CLEAR ?AUTO_7068 ) ( not ( = ?AUTO_7065 ?AUTO_7068 ) ) ( not ( = ?AUTO_7066 ?AUTO_7068 ) ) ( not ( = ?AUTO_7067 ?AUTO_7068 ) ) ( not ( = ?AUTO_7069 ?AUTO_7068 ) ) ( not ( = ?AUTO_7070 ?AUTO_7068 ) ) ( ON ?AUTO_7070 ?AUTO_7067 ) ( CLEAR ?AUTO_7070 ) ( HOLDING ?AUTO_7069 ) ( CLEAR ?AUTO_7066 ) )
    :subtasks
    ( ( !STACK ?AUTO_7069 ?AUTO_7066 )
      ( MAKE-ON ?AUTO_7065 ?AUTO_7066 )
      ( MAKE-ON-VERIFY ?AUTO_7065 ?AUTO_7066 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7071 - BLOCK
      ?AUTO_7072 - BLOCK
    )
    :vars
    (
      ?AUTO_7074 - BLOCK
      ?AUTO_7076 - BLOCK
      ?AUTO_7075 - BLOCK
      ?AUTO_7073 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_7071 ?AUTO_7072 ) ) ( ON-TABLE ?AUTO_7071 ) ( not ( = ?AUTO_7071 ?AUTO_7074 ) ) ( not ( = ?AUTO_7072 ?AUTO_7074 ) ) ( ON ?AUTO_7074 ?AUTO_7071 ) ( not ( = ?AUTO_7071 ?AUTO_7076 ) ) ( not ( = ?AUTO_7071 ?AUTO_7075 ) ) ( not ( = ?AUTO_7072 ?AUTO_7076 ) ) ( not ( = ?AUTO_7072 ?AUTO_7075 ) ) ( not ( = ?AUTO_7074 ?AUTO_7076 ) ) ( not ( = ?AUTO_7074 ?AUTO_7075 ) ) ( not ( = ?AUTO_7076 ?AUTO_7075 ) ) ( CLEAR ?AUTO_7073 ) ( not ( = ?AUTO_7071 ?AUTO_7073 ) ) ( not ( = ?AUTO_7072 ?AUTO_7073 ) ) ( not ( = ?AUTO_7074 ?AUTO_7073 ) ) ( not ( = ?AUTO_7076 ?AUTO_7073 ) ) ( not ( = ?AUTO_7075 ?AUTO_7073 ) ) ( ON ?AUTO_7075 ?AUTO_7074 ) ( CLEAR ?AUTO_7072 ) ( ON ?AUTO_7076 ?AUTO_7075 ) ( CLEAR ?AUTO_7076 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7076 ?AUTO_7075 )
      ( MAKE-ON ?AUTO_7071 ?AUTO_7072 )
      ( MAKE-ON-VERIFY ?AUTO_7071 ?AUTO_7072 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7077 - BLOCK
      ?AUTO_7078 - BLOCK
    )
    :vars
    (
      ?AUTO_7079 - BLOCK
      ?AUTO_7081 - BLOCK
      ?AUTO_7082 - BLOCK
      ?AUTO_7080 - BLOCK
      ?AUTO_7083 - BLOCK
      ?AUTO_7084 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_7077 ?AUTO_7078 ) ) ( ON-TABLE ?AUTO_7077 ) ( not ( = ?AUTO_7077 ?AUTO_7079 ) ) ( not ( = ?AUTO_7078 ?AUTO_7079 ) ) ( ON ?AUTO_7079 ?AUTO_7077 ) ( not ( = ?AUTO_7077 ?AUTO_7081 ) ) ( not ( = ?AUTO_7077 ?AUTO_7082 ) ) ( not ( = ?AUTO_7078 ?AUTO_7081 ) ) ( not ( = ?AUTO_7078 ?AUTO_7082 ) ) ( not ( = ?AUTO_7079 ?AUTO_7081 ) ) ( not ( = ?AUTO_7079 ?AUTO_7082 ) ) ( not ( = ?AUTO_7081 ?AUTO_7082 ) ) ( CLEAR ?AUTO_7080 ) ( not ( = ?AUTO_7077 ?AUTO_7080 ) ) ( not ( = ?AUTO_7078 ?AUTO_7080 ) ) ( not ( = ?AUTO_7079 ?AUTO_7080 ) ) ( not ( = ?AUTO_7081 ?AUTO_7080 ) ) ( not ( = ?AUTO_7082 ?AUTO_7080 ) ) ( ON ?AUTO_7082 ?AUTO_7079 ) ( CLEAR ?AUTO_7078 ) ( ON ?AUTO_7081 ?AUTO_7082 ) ( CLEAR ?AUTO_7081 ) ( HOLDING ?AUTO_7083 ) ( CLEAR ?AUTO_7084 ) ( not ( = ?AUTO_7077 ?AUTO_7083 ) ) ( not ( = ?AUTO_7077 ?AUTO_7084 ) ) ( not ( = ?AUTO_7078 ?AUTO_7083 ) ) ( not ( = ?AUTO_7078 ?AUTO_7084 ) ) ( not ( = ?AUTO_7079 ?AUTO_7083 ) ) ( not ( = ?AUTO_7079 ?AUTO_7084 ) ) ( not ( = ?AUTO_7081 ?AUTO_7083 ) ) ( not ( = ?AUTO_7081 ?AUTO_7084 ) ) ( not ( = ?AUTO_7082 ?AUTO_7083 ) ) ( not ( = ?AUTO_7082 ?AUTO_7084 ) ) ( not ( = ?AUTO_7080 ?AUTO_7083 ) ) ( not ( = ?AUTO_7080 ?AUTO_7084 ) ) ( not ( = ?AUTO_7083 ?AUTO_7084 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_7083 ?AUTO_7084 )
      ( MAKE-ON ?AUTO_7077 ?AUTO_7078 )
      ( MAKE-ON-VERIFY ?AUTO_7077 ?AUTO_7078 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7089 - BLOCK
      ?AUTO_7090 - BLOCK
    )
    :vars
    (
      ?AUTO_7091 - BLOCK
      ?AUTO_7096 - BLOCK
      ?AUTO_7095 - BLOCK
      ?AUTO_7093 - BLOCK
      ?AUTO_7092 - BLOCK
      ?AUTO_7094 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_7089 ?AUTO_7090 ) ) ( ON-TABLE ?AUTO_7089 ) ( not ( = ?AUTO_7089 ?AUTO_7091 ) ) ( not ( = ?AUTO_7090 ?AUTO_7091 ) ) ( ON ?AUTO_7091 ?AUTO_7089 ) ( not ( = ?AUTO_7089 ?AUTO_7096 ) ) ( not ( = ?AUTO_7089 ?AUTO_7095 ) ) ( not ( = ?AUTO_7090 ?AUTO_7096 ) ) ( not ( = ?AUTO_7090 ?AUTO_7095 ) ) ( not ( = ?AUTO_7091 ?AUTO_7096 ) ) ( not ( = ?AUTO_7091 ?AUTO_7095 ) ) ( not ( = ?AUTO_7096 ?AUTO_7095 ) ) ( CLEAR ?AUTO_7093 ) ( not ( = ?AUTO_7089 ?AUTO_7093 ) ) ( not ( = ?AUTO_7090 ?AUTO_7093 ) ) ( not ( = ?AUTO_7091 ?AUTO_7093 ) ) ( not ( = ?AUTO_7096 ?AUTO_7093 ) ) ( not ( = ?AUTO_7095 ?AUTO_7093 ) ) ( ON ?AUTO_7095 ?AUTO_7091 ) ( ON ?AUTO_7096 ?AUTO_7095 ) ( CLEAR ?AUTO_7096 ) ( CLEAR ?AUTO_7092 ) ( not ( = ?AUTO_7089 ?AUTO_7094 ) ) ( not ( = ?AUTO_7089 ?AUTO_7092 ) ) ( not ( = ?AUTO_7090 ?AUTO_7094 ) ) ( not ( = ?AUTO_7090 ?AUTO_7092 ) ) ( not ( = ?AUTO_7091 ?AUTO_7094 ) ) ( not ( = ?AUTO_7091 ?AUTO_7092 ) ) ( not ( = ?AUTO_7096 ?AUTO_7094 ) ) ( not ( = ?AUTO_7096 ?AUTO_7092 ) ) ( not ( = ?AUTO_7095 ?AUTO_7094 ) ) ( not ( = ?AUTO_7095 ?AUTO_7092 ) ) ( not ( = ?AUTO_7093 ?AUTO_7094 ) ) ( not ( = ?AUTO_7093 ?AUTO_7092 ) ) ( not ( = ?AUTO_7094 ?AUTO_7092 ) ) ( ON ?AUTO_7094 ?AUTO_7090 ) ( CLEAR ?AUTO_7094 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7094 ?AUTO_7090 )
      ( MAKE-ON ?AUTO_7089 ?AUTO_7090 )
      ( MAKE-ON-VERIFY ?AUTO_7089 ?AUTO_7090 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7097 - BLOCK
      ?AUTO_7098 - BLOCK
    )
    :vars
    (
      ?AUTO_7101 - BLOCK
      ?AUTO_7103 - BLOCK
      ?AUTO_7099 - BLOCK
      ?AUTO_7104 - BLOCK
      ?AUTO_7102 - BLOCK
      ?AUTO_7100 - BLOCK
      ?AUTO_7105 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_7097 ?AUTO_7098 ) ) ( ON-TABLE ?AUTO_7097 ) ( not ( = ?AUTO_7097 ?AUTO_7101 ) ) ( not ( = ?AUTO_7098 ?AUTO_7101 ) ) ( ON ?AUTO_7101 ?AUTO_7097 ) ( not ( = ?AUTO_7097 ?AUTO_7103 ) ) ( not ( = ?AUTO_7097 ?AUTO_7099 ) ) ( not ( = ?AUTO_7098 ?AUTO_7103 ) ) ( not ( = ?AUTO_7098 ?AUTO_7099 ) ) ( not ( = ?AUTO_7101 ?AUTO_7103 ) ) ( not ( = ?AUTO_7101 ?AUTO_7099 ) ) ( not ( = ?AUTO_7103 ?AUTO_7099 ) ) ( CLEAR ?AUTO_7104 ) ( not ( = ?AUTO_7097 ?AUTO_7104 ) ) ( not ( = ?AUTO_7098 ?AUTO_7104 ) ) ( not ( = ?AUTO_7101 ?AUTO_7104 ) ) ( not ( = ?AUTO_7103 ?AUTO_7104 ) ) ( not ( = ?AUTO_7099 ?AUTO_7104 ) ) ( ON ?AUTO_7099 ?AUTO_7101 ) ( ON ?AUTO_7103 ?AUTO_7099 ) ( CLEAR ?AUTO_7103 ) ( CLEAR ?AUTO_7102 ) ( not ( = ?AUTO_7097 ?AUTO_7100 ) ) ( not ( = ?AUTO_7097 ?AUTO_7102 ) ) ( not ( = ?AUTO_7098 ?AUTO_7100 ) ) ( not ( = ?AUTO_7098 ?AUTO_7102 ) ) ( not ( = ?AUTO_7101 ?AUTO_7100 ) ) ( not ( = ?AUTO_7101 ?AUTO_7102 ) ) ( not ( = ?AUTO_7103 ?AUTO_7100 ) ) ( not ( = ?AUTO_7103 ?AUTO_7102 ) ) ( not ( = ?AUTO_7099 ?AUTO_7100 ) ) ( not ( = ?AUTO_7099 ?AUTO_7102 ) ) ( not ( = ?AUTO_7104 ?AUTO_7100 ) ) ( not ( = ?AUTO_7104 ?AUTO_7102 ) ) ( not ( = ?AUTO_7100 ?AUTO_7102 ) ) ( ON ?AUTO_7100 ?AUTO_7098 ) ( CLEAR ?AUTO_7100 ) ( HOLDING ?AUTO_7105 ) ( not ( = ?AUTO_7097 ?AUTO_7105 ) ) ( not ( = ?AUTO_7098 ?AUTO_7105 ) ) ( not ( = ?AUTO_7101 ?AUTO_7105 ) ) ( not ( = ?AUTO_7103 ?AUTO_7105 ) ) ( not ( = ?AUTO_7099 ?AUTO_7105 ) ) ( not ( = ?AUTO_7104 ?AUTO_7105 ) ) ( not ( = ?AUTO_7102 ?AUTO_7105 ) ) ( not ( = ?AUTO_7100 ?AUTO_7105 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7105 )
      ( MAKE-ON ?AUTO_7097 ?AUTO_7098 )
      ( MAKE-ON-VERIFY ?AUTO_7097 ?AUTO_7098 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7106 - BLOCK
      ?AUTO_7107 - BLOCK
    )
    :vars
    (
      ?AUTO_7108 - BLOCK
      ?AUTO_7111 - BLOCK
      ?AUTO_7110 - BLOCK
      ?AUTO_7109 - BLOCK
      ?AUTO_7114 - BLOCK
      ?AUTO_7112 - BLOCK
      ?AUTO_7113 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_7106 ?AUTO_7107 ) ) ( ON-TABLE ?AUTO_7106 ) ( not ( = ?AUTO_7106 ?AUTO_7108 ) ) ( not ( = ?AUTO_7107 ?AUTO_7108 ) ) ( ON ?AUTO_7108 ?AUTO_7106 ) ( not ( = ?AUTO_7106 ?AUTO_7111 ) ) ( not ( = ?AUTO_7106 ?AUTO_7110 ) ) ( not ( = ?AUTO_7107 ?AUTO_7111 ) ) ( not ( = ?AUTO_7107 ?AUTO_7110 ) ) ( not ( = ?AUTO_7108 ?AUTO_7111 ) ) ( not ( = ?AUTO_7108 ?AUTO_7110 ) ) ( not ( = ?AUTO_7111 ?AUTO_7110 ) ) ( CLEAR ?AUTO_7109 ) ( not ( = ?AUTO_7106 ?AUTO_7109 ) ) ( not ( = ?AUTO_7107 ?AUTO_7109 ) ) ( not ( = ?AUTO_7108 ?AUTO_7109 ) ) ( not ( = ?AUTO_7111 ?AUTO_7109 ) ) ( not ( = ?AUTO_7110 ?AUTO_7109 ) ) ( ON ?AUTO_7110 ?AUTO_7108 ) ( ON ?AUTO_7111 ?AUTO_7110 ) ( CLEAR ?AUTO_7111 ) ( CLEAR ?AUTO_7114 ) ( not ( = ?AUTO_7106 ?AUTO_7112 ) ) ( not ( = ?AUTO_7106 ?AUTO_7114 ) ) ( not ( = ?AUTO_7107 ?AUTO_7112 ) ) ( not ( = ?AUTO_7107 ?AUTO_7114 ) ) ( not ( = ?AUTO_7108 ?AUTO_7112 ) ) ( not ( = ?AUTO_7108 ?AUTO_7114 ) ) ( not ( = ?AUTO_7111 ?AUTO_7112 ) ) ( not ( = ?AUTO_7111 ?AUTO_7114 ) ) ( not ( = ?AUTO_7110 ?AUTO_7112 ) ) ( not ( = ?AUTO_7110 ?AUTO_7114 ) ) ( not ( = ?AUTO_7109 ?AUTO_7112 ) ) ( not ( = ?AUTO_7109 ?AUTO_7114 ) ) ( not ( = ?AUTO_7112 ?AUTO_7114 ) ) ( ON ?AUTO_7112 ?AUTO_7107 ) ( not ( = ?AUTO_7106 ?AUTO_7113 ) ) ( not ( = ?AUTO_7107 ?AUTO_7113 ) ) ( not ( = ?AUTO_7108 ?AUTO_7113 ) ) ( not ( = ?AUTO_7111 ?AUTO_7113 ) ) ( not ( = ?AUTO_7110 ?AUTO_7113 ) ) ( not ( = ?AUTO_7109 ?AUTO_7113 ) ) ( not ( = ?AUTO_7114 ?AUTO_7113 ) ) ( not ( = ?AUTO_7112 ?AUTO_7113 ) ) ( ON ?AUTO_7113 ?AUTO_7112 ) ( CLEAR ?AUTO_7113 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7113 ?AUTO_7112 )
      ( MAKE-ON ?AUTO_7106 ?AUTO_7107 )
      ( MAKE-ON-VERIFY ?AUTO_7106 ?AUTO_7107 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7115 - BLOCK
      ?AUTO_7116 - BLOCK
    )
    :vars
    (
      ?AUTO_7117 - BLOCK
      ?AUTO_7122 - BLOCK
      ?AUTO_7118 - BLOCK
      ?AUTO_7123 - BLOCK
      ?AUTO_7119 - BLOCK
      ?AUTO_7121 - BLOCK
      ?AUTO_7120 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_7115 ?AUTO_7116 ) ) ( ON-TABLE ?AUTO_7115 ) ( not ( = ?AUTO_7115 ?AUTO_7117 ) ) ( not ( = ?AUTO_7116 ?AUTO_7117 ) ) ( ON ?AUTO_7117 ?AUTO_7115 ) ( not ( = ?AUTO_7115 ?AUTO_7122 ) ) ( not ( = ?AUTO_7115 ?AUTO_7118 ) ) ( not ( = ?AUTO_7116 ?AUTO_7122 ) ) ( not ( = ?AUTO_7116 ?AUTO_7118 ) ) ( not ( = ?AUTO_7117 ?AUTO_7122 ) ) ( not ( = ?AUTO_7117 ?AUTO_7118 ) ) ( not ( = ?AUTO_7122 ?AUTO_7118 ) ) ( not ( = ?AUTO_7115 ?AUTO_7123 ) ) ( not ( = ?AUTO_7116 ?AUTO_7123 ) ) ( not ( = ?AUTO_7117 ?AUTO_7123 ) ) ( not ( = ?AUTO_7122 ?AUTO_7123 ) ) ( not ( = ?AUTO_7118 ?AUTO_7123 ) ) ( ON ?AUTO_7118 ?AUTO_7117 ) ( ON ?AUTO_7122 ?AUTO_7118 ) ( CLEAR ?AUTO_7122 ) ( CLEAR ?AUTO_7119 ) ( not ( = ?AUTO_7115 ?AUTO_7121 ) ) ( not ( = ?AUTO_7115 ?AUTO_7119 ) ) ( not ( = ?AUTO_7116 ?AUTO_7121 ) ) ( not ( = ?AUTO_7116 ?AUTO_7119 ) ) ( not ( = ?AUTO_7117 ?AUTO_7121 ) ) ( not ( = ?AUTO_7117 ?AUTO_7119 ) ) ( not ( = ?AUTO_7122 ?AUTO_7121 ) ) ( not ( = ?AUTO_7122 ?AUTO_7119 ) ) ( not ( = ?AUTO_7118 ?AUTO_7121 ) ) ( not ( = ?AUTO_7118 ?AUTO_7119 ) ) ( not ( = ?AUTO_7123 ?AUTO_7121 ) ) ( not ( = ?AUTO_7123 ?AUTO_7119 ) ) ( not ( = ?AUTO_7121 ?AUTO_7119 ) ) ( ON ?AUTO_7121 ?AUTO_7116 ) ( not ( = ?AUTO_7115 ?AUTO_7120 ) ) ( not ( = ?AUTO_7116 ?AUTO_7120 ) ) ( not ( = ?AUTO_7117 ?AUTO_7120 ) ) ( not ( = ?AUTO_7122 ?AUTO_7120 ) ) ( not ( = ?AUTO_7118 ?AUTO_7120 ) ) ( not ( = ?AUTO_7123 ?AUTO_7120 ) ) ( not ( = ?AUTO_7119 ?AUTO_7120 ) ) ( not ( = ?AUTO_7121 ?AUTO_7120 ) ) ( ON ?AUTO_7120 ?AUTO_7121 ) ( CLEAR ?AUTO_7120 ) ( HOLDING ?AUTO_7123 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7123 )
      ( MAKE-ON ?AUTO_7115 ?AUTO_7116 )
      ( MAKE-ON-VERIFY ?AUTO_7115 ?AUTO_7116 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7124 - BLOCK
      ?AUTO_7125 - BLOCK
    )
    :vars
    (
      ?AUTO_7131 - BLOCK
      ?AUTO_7128 - BLOCK
      ?AUTO_7130 - BLOCK
      ?AUTO_7129 - BLOCK
      ?AUTO_7127 - BLOCK
      ?AUTO_7132 - BLOCK
      ?AUTO_7126 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_7124 ?AUTO_7125 ) ) ( ON-TABLE ?AUTO_7124 ) ( not ( = ?AUTO_7124 ?AUTO_7131 ) ) ( not ( = ?AUTO_7125 ?AUTO_7131 ) ) ( ON ?AUTO_7131 ?AUTO_7124 ) ( not ( = ?AUTO_7124 ?AUTO_7128 ) ) ( not ( = ?AUTO_7124 ?AUTO_7130 ) ) ( not ( = ?AUTO_7125 ?AUTO_7128 ) ) ( not ( = ?AUTO_7125 ?AUTO_7130 ) ) ( not ( = ?AUTO_7131 ?AUTO_7128 ) ) ( not ( = ?AUTO_7131 ?AUTO_7130 ) ) ( not ( = ?AUTO_7128 ?AUTO_7130 ) ) ( not ( = ?AUTO_7124 ?AUTO_7129 ) ) ( not ( = ?AUTO_7125 ?AUTO_7129 ) ) ( not ( = ?AUTO_7131 ?AUTO_7129 ) ) ( not ( = ?AUTO_7128 ?AUTO_7129 ) ) ( not ( = ?AUTO_7130 ?AUTO_7129 ) ) ( ON ?AUTO_7130 ?AUTO_7131 ) ( ON ?AUTO_7128 ?AUTO_7130 ) ( CLEAR ?AUTO_7128 ) ( CLEAR ?AUTO_7127 ) ( not ( = ?AUTO_7124 ?AUTO_7132 ) ) ( not ( = ?AUTO_7124 ?AUTO_7127 ) ) ( not ( = ?AUTO_7125 ?AUTO_7132 ) ) ( not ( = ?AUTO_7125 ?AUTO_7127 ) ) ( not ( = ?AUTO_7131 ?AUTO_7132 ) ) ( not ( = ?AUTO_7131 ?AUTO_7127 ) ) ( not ( = ?AUTO_7128 ?AUTO_7132 ) ) ( not ( = ?AUTO_7128 ?AUTO_7127 ) ) ( not ( = ?AUTO_7130 ?AUTO_7132 ) ) ( not ( = ?AUTO_7130 ?AUTO_7127 ) ) ( not ( = ?AUTO_7129 ?AUTO_7132 ) ) ( not ( = ?AUTO_7129 ?AUTO_7127 ) ) ( not ( = ?AUTO_7132 ?AUTO_7127 ) ) ( ON ?AUTO_7132 ?AUTO_7125 ) ( not ( = ?AUTO_7124 ?AUTO_7126 ) ) ( not ( = ?AUTO_7125 ?AUTO_7126 ) ) ( not ( = ?AUTO_7131 ?AUTO_7126 ) ) ( not ( = ?AUTO_7128 ?AUTO_7126 ) ) ( not ( = ?AUTO_7130 ?AUTO_7126 ) ) ( not ( = ?AUTO_7129 ?AUTO_7126 ) ) ( not ( = ?AUTO_7127 ?AUTO_7126 ) ) ( not ( = ?AUTO_7132 ?AUTO_7126 ) ) ( ON ?AUTO_7126 ?AUTO_7132 ) ( ON ?AUTO_7129 ?AUTO_7126 ) ( CLEAR ?AUTO_7129 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7129 ?AUTO_7126 )
      ( MAKE-ON ?AUTO_7124 ?AUTO_7125 )
      ( MAKE-ON-VERIFY ?AUTO_7124 ?AUTO_7125 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7133 - BLOCK
      ?AUTO_7134 - BLOCK
    )
    :vars
    (
      ?AUTO_7136 - BLOCK
      ?AUTO_7138 - BLOCK
      ?AUTO_7139 - BLOCK
      ?AUTO_7137 - BLOCK
      ?AUTO_7141 - BLOCK
      ?AUTO_7140 - BLOCK
      ?AUTO_7135 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_7133 ?AUTO_7134 ) ) ( ON-TABLE ?AUTO_7133 ) ( not ( = ?AUTO_7133 ?AUTO_7136 ) ) ( not ( = ?AUTO_7134 ?AUTO_7136 ) ) ( ON ?AUTO_7136 ?AUTO_7133 ) ( not ( = ?AUTO_7133 ?AUTO_7138 ) ) ( not ( = ?AUTO_7133 ?AUTO_7139 ) ) ( not ( = ?AUTO_7134 ?AUTO_7138 ) ) ( not ( = ?AUTO_7134 ?AUTO_7139 ) ) ( not ( = ?AUTO_7136 ?AUTO_7138 ) ) ( not ( = ?AUTO_7136 ?AUTO_7139 ) ) ( not ( = ?AUTO_7138 ?AUTO_7139 ) ) ( not ( = ?AUTO_7133 ?AUTO_7137 ) ) ( not ( = ?AUTO_7134 ?AUTO_7137 ) ) ( not ( = ?AUTO_7136 ?AUTO_7137 ) ) ( not ( = ?AUTO_7138 ?AUTO_7137 ) ) ( not ( = ?AUTO_7139 ?AUTO_7137 ) ) ( ON ?AUTO_7139 ?AUTO_7136 ) ( CLEAR ?AUTO_7141 ) ( not ( = ?AUTO_7133 ?AUTO_7140 ) ) ( not ( = ?AUTO_7133 ?AUTO_7141 ) ) ( not ( = ?AUTO_7134 ?AUTO_7140 ) ) ( not ( = ?AUTO_7134 ?AUTO_7141 ) ) ( not ( = ?AUTO_7136 ?AUTO_7140 ) ) ( not ( = ?AUTO_7136 ?AUTO_7141 ) ) ( not ( = ?AUTO_7138 ?AUTO_7140 ) ) ( not ( = ?AUTO_7138 ?AUTO_7141 ) ) ( not ( = ?AUTO_7139 ?AUTO_7140 ) ) ( not ( = ?AUTO_7139 ?AUTO_7141 ) ) ( not ( = ?AUTO_7137 ?AUTO_7140 ) ) ( not ( = ?AUTO_7137 ?AUTO_7141 ) ) ( not ( = ?AUTO_7140 ?AUTO_7141 ) ) ( ON ?AUTO_7140 ?AUTO_7134 ) ( not ( = ?AUTO_7133 ?AUTO_7135 ) ) ( not ( = ?AUTO_7134 ?AUTO_7135 ) ) ( not ( = ?AUTO_7136 ?AUTO_7135 ) ) ( not ( = ?AUTO_7138 ?AUTO_7135 ) ) ( not ( = ?AUTO_7139 ?AUTO_7135 ) ) ( not ( = ?AUTO_7137 ?AUTO_7135 ) ) ( not ( = ?AUTO_7141 ?AUTO_7135 ) ) ( not ( = ?AUTO_7140 ?AUTO_7135 ) ) ( ON ?AUTO_7135 ?AUTO_7140 ) ( ON ?AUTO_7137 ?AUTO_7135 ) ( CLEAR ?AUTO_7137 ) ( HOLDING ?AUTO_7138 ) ( CLEAR ?AUTO_7139 ) )
    :subtasks
    ( ( !STACK ?AUTO_7138 ?AUTO_7139 )
      ( MAKE-ON ?AUTO_7133 ?AUTO_7134 )
      ( MAKE-ON-VERIFY ?AUTO_7133 ?AUTO_7134 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7142 - BLOCK
      ?AUTO_7143 - BLOCK
    )
    :vars
    (
      ?AUTO_7149 - BLOCK
      ?AUTO_7147 - BLOCK
      ?AUTO_7150 - BLOCK
      ?AUTO_7145 - BLOCK
      ?AUTO_7146 - BLOCK
      ?AUTO_7148 - BLOCK
      ?AUTO_7144 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_7142 ?AUTO_7143 ) ) ( ON-TABLE ?AUTO_7142 ) ( not ( = ?AUTO_7142 ?AUTO_7149 ) ) ( not ( = ?AUTO_7143 ?AUTO_7149 ) ) ( ON ?AUTO_7149 ?AUTO_7142 ) ( not ( = ?AUTO_7142 ?AUTO_7147 ) ) ( not ( = ?AUTO_7142 ?AUTO_7150 ) ) ( not ( = ?AUTO_7143 ?AUTO_7147 ) ) ( not ( = ?AUTO_7143 ?AUTO_7150 ) ) ( not ( = ?AUTO_7149 ?AUTO_7147 ) ) ( not ( = ?AUTO_7149 ?AUTO_7150 ) ) ( not ( = ?AUTO_7147 ?AUTO_7150 ) ) ( not ( = ?AUTO_7142 ?AUTO_7145 ) ) ( not ( = ?AUTO_7143 ?AUTO_7145 ) ) ( not ( = ?AUTO_7149 ?AUTO_7145 ) ) ( not ( = ?AUTO_7147 ?AUTO_7145 ) ) ( not ( = ?AUTO_7150 ?AUTO_7145 ) ) ( ON ?AUTO_7150 ?AUTO_7149 ) ( CLEAR ?AUTO_7146 ) ( not ( = ?AUTO_7142 ?AUTO_7148 ) ) ( not ( = ?AUTO_7142 ?AUTO_7146 ) ) ( not ( = ?AUTO_7143 ?AUTO_7148 ) ) ( not ( = ?AUTO_7143 ?AUTO_7146 ) ) ( not ( = ?AUTO_7149 ?AUTO_7148 ) ) ( not ( = ?AUTO_7149 ?AUTO_7146 ) ) ( not ( = ?AUTO_7147 ?AUTO_7148 ) ) ( not ( = ?AUTO_7147 ?AUTO_7146 ) ) ( not ( = ?AUTO_7150 ?AUTO_7148 ) ) ( not ( = ?AUTO_7150 ?AUTO_7146 ) ) ( not ( = ?AUTO_7145 ?AUTO_7148 ) ) ( not ( = ?AUTO_7145 ?AUTO_7146 ) ) ( not ( = ?AUTO_7148 ?AUTO_7146 ) ) ( ON ?AUTO_7148 ?AUTO_7143 ) ( not ( = ?AUTO_7142 ?AUTO_7144 ) ) ( not ( = ?AUTO_7143 ?AUTO_7144 ) ) ( not ( = ?AUTO_7149 ?AUTO_7144 ) ) ( not ( = ?AUTO_7147 ?AUTO_7144 ) ) ( not ( = ?AUTO_7150 ?AUTO_7144 ) ) ( not ( = ?AUTO_7145 ?AUTO_7144 ) ) ( not ( = ?AUTO_7146 ?AUTO_7144 ) ) ( not ( = ?AUTO_7148 ?AUTO_7144 ) ) ( ON ?AUTO_7144 ?AUTO_7148 ) ( ON ?AUTO_7145 ?AUTO_7144 ) ( CLEAR ?AUTO_7150 ) ( ON ?AUTO_7147 ?AUTO_7145 ) ( CLEAR ?AUTO_7147 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7147 ?AUTO_7145 )
      ( MAKE-ON ?AUTO_7142 ?AUTO_7143 )
      ( MAKE-ON-VERIFY ?AUTO_7142 ?AUTO_7143 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7151 - BLOCK
      ?AUTO_7152 - BLOCK
    )
    :vars
    (
      ?AUTO_7157 - BLOCK
      ?AUTO_7154 - BLOCK
      ?AUTO_7159 - BLOCK
      ?AUTO_7153 - BLOCK
      ?AUTO_7155 - BLOCK
      ?AUTO_7158 - BLOCK
      ?AUTO_7156 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_7151 ?AUTO_7152 ) ) ( ON-TABLE ?AUTO_7151 ) ( not ( = ?AUTO_7151 ?AUTO_7157 ) ) ( not ( = ?AUTO_7152 ?AUTO_7157 ) ) ( ON ?AUTO_7157 ?AUTO_7151 ) ( not ( = ?AUTO_7151 ?AUTO_7154 ) ) ( not ( = ?AUTO_7151 ?AUTO_7159 ) ) ( not ( = ?AUTO_7152 ?AUTO_7154 ) ) ( not ( = ?AUTO_7152 ?AUTO_7159 ) ) ( not ( = ?AUTO_7157 ?AUTO_7154 ) ) ( not ( = ?AUTO_7157 ?AUTO_7159 ) ) ( not ( = ?AUTO_7154 ?AUTO_7159 ) ) ( not ( = ?AUTO_7151 ?AUTO_7153 ) ) ( not ( = ?AUTO_7152 ?AUTO_7153 ) ) ( not ( = ?AUTO_7157 ?AUTO_7153 ) ) ( not ( = ?AUTO_7154 ?AUTO_7153 ) ) ( not ( = ?AUTO_7159 ?AUTO_7153 ) ) ( CLEAR ?AUTO_7155 ) ( not ( = ?AUTO_7151 ?AUTO_7158 ) ) ( not ( = ?AUTO_7151 ?AUTO_7155 ) ) ( not ( = ?AUTO_7152 ?AUTO_7158 ) ) ( not ( = ?AUTO_7152 ?AUTO_7155 ) ) ( not ( = ?AUTO_7157 ?AUTO_7158 ) ) ( not ( = ?AUTO_7157 ?AUTO_7155 ) ) ( not ( = ?AUTO_7154 ?AUTO_7158 ) ) ( not ( = ?AUTO_7154 ?AUTO_7155 ) ) ( not ( = ?AUTO_7159 ?AUTO_7158 ) ) ( not ( = ?AUTO_7159 ?AUTO_7155 ) ) ( not ( = ?AUTO_7153 ?AUTO_7158 ) ) ( not ( = ?AUTO_7153 ?AUTO_7155 ) ) ( not ( = ?AUTO_7158 ?AUTO_7155 ) ) ( ON ?AUTO_7158 ?AUTO_7152 ) ( not ( = ?AUTO_7151 ?AUTO_7156 ) ) ( not ( = ?AUTO_7152 ?AUTO_7156 ) ) ( not ( = ?AUTO_7157 ?AUTO_7156 ) ) ( not ( = ?AUTO_7154 ?AUTO_7156 ) ) ( not ( = ?AUTO_7159 ?AUTO_7156 ) ) ( not ( = ?AUTO_7153 ?AUTO_7156 ) ) ( not ( = ?AUTO_7155 ?AUTO_7156 ) ) ( not ( = ?AUTO_7158 ?AUTO_7156 ) ) ( ON ?AUTO_7156 ?AUTO_7158 ) ( ON ?AUTO_7153 ?AUTO_7156 ) ( ON ?AUTO_7154 ?AUTO_7153 ) ( CLEAR ?AUTO_7154 ) ( HOLDING ?AUTO_7159 ) ( CLEAR ?AUTO_7157 ) )
    :subtasks
    ( ( !STACK ?AUTO_7159 ?AUTO_7157 )
      ( MAKE-ON ?AUTO_7151 ?AUTO_7152 )
      ( MAKE-ON-VERIFY ?AUTO_7151 ?AUTO_7152 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7160 - BLOCK
      ?AUTO_7161 - BLOCK
    )
    :vars
    (
      ?AUTO_7165 - BLOCK
      ?AUTO_7168 - BLOCK
      ?AUTO_7167 - BLOCK
      ?AUTO_7166 - BLOCK
      ?AUTO_7163 - BLOCK
      ?AUTO_7164 - BLOCK
      ?AUTO_7162 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_7160 ?AUTO_7161 ) ) ( ON-TABLE ?AUTO_7160 ) ( not ( = ?AUTO_7160 ?AUTO_7165 ) ) ( not ( = ?AUTO_7161 ?AUTO_7165 ) ) ( ON ?AUTO_7165 ?AUTO_7160 ) ( not ( = ?AUTO_7160 ?AUTO_7168 ) ) ( not ( = ?AUTO_7160 ?AUTO_7167 ) ) ( not ( = ?AUTO_7161 ?AUTO_7168 ) ) ( not ( = ?AUTO_7161 ?AUTO_7167 ) ) ( not ( = ?AUTO_7165 ?AUTO_7168 ) ) ( not ( = ?AUTO_7165 ?AUTO_7167 ) ) ( not ( = ?AUTO_7168 ?AUTO_7167 ) ) ( not ( = ?AUTO_7160 ?AUTO_7166 ) ) ( not ( = ?AUTO_7161 ?AUTO_7166 ) ) ( not ( = ?AUTO_7165 ?AUTO_7166 ) ) ( not ( = ?AUTO_7168 ?AUTO_7166 ) ) ( not ( = ?AUTO_7167 ?AUTO_7166 ) ) ( CLEAR ?AUTO_7163 ) ( not ( = ?AUTO_7160 ?AUTO_7164 ) ) ( not ( = ?AUTO_7160 ?AUTO_7163 ) ) ( not ( = ?AUTO_7161 ?AUTO_7164 ) ) ( not ( = ?AUTO_7161 ?AUTO_7163 ) ) ( not ( = ?AUTO_7165 ?AUTO_7164 ) ) ( not ( = ?AUTO_7165 ?AUTO_7163 ) ) ( not ( = ?AUTO_7168 ?AUTO_7164 ) ) ( not ( = ?AUTO_7168 ?AUTO_7163 ) ) ( not ( = ?AUTO_7167 ?AUTO_7164 ) ) ( not ( = ?AUTO_7167 ?AUTO_7163 ) ) ( not ( = ?AUTO_7166 ?AUTO_7164 ) ) ( not ( = ?AUTO_7166 ?AUTO_7163 ) ) ( not ( = ?AUTO_7164 ?AUTO_7163 ) ) ( ON ?AUTO_7164 ?AUTO_7161 ) ( not ( = ?AUTO_7160 ?AUTO_7162 ) ) ( not ( = ?AUTO_7161 ?AUTO_7162 ) ) ( not ( = ?AUTO_7165 ?AUTO_7162 ) ) ( not ( = ?AUTO_7168 ?AUTO_7162 ) ) ( not ( = ?AUTO_7167 ?AUTO_7162 ) ) ( not ( = ?AUTO_7166 ?AUTO_7162 ) ) ( not ( = ?AUTO_7163 ?AUTO_7162 ) ) ( not ( = ?AUTO_7164 ?AUTO_7162 ) ) ( ON ?AUTO_7162 ?AUTO_7164 ) ( ON ?AUTO_7166 ?AUTO_7162 ) ( ON ?AUTO_7168 ?AUTO_7166 ) ( CLEAR ?AUTO_7168 ) ( CLEAR ?AUTO_7165 ) ( ON-TABLE ?AUTO_7167 ) ( CLEAR ?AUTO_7167 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_7167 )
      ( MAKE-ON ?AUTO_7160 ?AUTO_7161 )
      ( MAKE-ON-VERIFY ?AUTO_7160 ?AUTO_7161 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7169 - BLOCK
      ?AUTO_7170 - BLOCK
    )
    :vars
    (
      ?AUTO_7171 - BLOCK
      ?AUTO_7175 - BLOCK
      ?AUTO_7173 - BLOCK
      ?AUTO_7174 - BLOCK
      ?AUTO_7177 - BLOCK
      ?AUTO_7172 - BLOCK
      ?AUTO_7176 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_7169 ?AUTO_7170 ) ) ( ON-TABLE ?AUTO_7169 ) ( not ( = ?AUTO_7169 ?AUTO_7171 ) ) ( not ( = ?AUTO_7170 ?AUTO_7171 ) ) ( not ( = ?AUTO_7169 ?AUTO_7175 ) ) ( not ( = ?AUTO_7169 ?AUTO_7173 ) ) ( not ( = ?AUTO_7170 ?AUTO_7175 ) ) ( not ( = ?AUTO_7170 ?AUTO_7173 ) ) ( not ( = ?AUTO_7171 ?AUTO_7175 ) ) ( not ( = ?AUTO_7171 ?AUTO_7173 ) ) ( not ( = ?AUTO_7175 ?AUTO_7173 ) ) ( not ( = ?AUTO_7169 ?AUTO_7174 ) ) ( not ( = ?AUTO_7170 ?AUTO_7174 ) ) ( not ( = ?AUTO_7171 ?AUTO_7174 ) ) ( not ( = ?AUTO_7175 ?AUTO_7174 ) ) ( not ( = ?AUTO_7173 ?AUTO_7174 ) ) ( CLEAR ?AUTO_7177 ) ( not ( = ?AUTO_7169 ?AUTO_7172 ) ) ( not ( = ?AUTO_7169 ?AUTO_7177 ) ) ( not ( = ?AUTO_7170 ?AUTO_7172 ) ) ( not ( = ?AUTO_7170 ?AUTO_7177 ) ) ( not ( = ?AUTO_7171 ?AUTO_7172 ) ) ( not ( = ?AUTO_7171 ?AUTO_7177 ) ) ( not ( = ?AUTO_7175 ?AUTO_7172 ) ) ( not ( = ?AUTO_7175 ?AUTO_7177 ) ) ( not ( = ?AUTO_7173 ?AUTO_7172 ) ) ( not ( = ?AUTO_7173 ?AUTO_7177 ) ) ( not ( = ?AUTO_7174 ?AUTO_7172 ) ) ( not ( = ?AUTO_7174 ?AUTO_7177 ) ) ( not ( = ?AUTO_7172 ?AUTO_7177 ) ) ( ON ?AUTO_7172 ?AUTO_7170 ) ( not ( = ?AUTO_7169 ?AUTO_7176 ) ) ( not ( = ?AUTO_7170 ?AUTO_7176 ) ) ( not ( = ?AUTO_7171 ?AUTO_7176 ) ) ( not ( = ?AUTO_7175 ?AUTO_7176 ) ) ( not ( = ?AUTO_7173 ?AUTO_7176 ) ) ( not ( = ?AUTO_7174 ?AUTO_7176 ) ) ( not ( = ?AUTO_7177 ?AUTO_7176 ) ) ( not ( = ?AUTO_7172 ?AUTO_7176 ) ) ( ON ?AUTO_7176 ?AUTO_7172 ) ( ON ?AUTO_7174 ?AUTO_7176 ) ( ON ?AUTO_7175 ?AUTO_7174 ) ( CLEAR ?AUTO_7175 ) ( ON-TABLE ?AUTO_7173 ) ( CLEAR ?AUTO_7173 ) ( HOLDING ?AUTO_7171 ) ( CLEAR ?AUTO_7169 ) )
    :subtasks
    ( ( !STACK ?AUTO_7171 ?AUTO_7169 )
      ( MAKE-ON ?AUTO_7169 ?AUTO_7170 )
      ( MAKE-ON-VERIFY ?AUTO_7169 ?AUTO_7170 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7178 - BLOCK
      ?AUTO_7179 - BLOCK
    )
    :vars
    (
      ?AUTO_7180 - BLOCK
      ?AUTO_7185 - BLOCK
      ?AUTO_7184 - BLOCK
      ?AUTO_7186 - BLOCK
      ?AUTO_7183 - BLOCK
      ?AUTO_7182 - BLOCK
      ?AUTO_7181 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_7178 ?AUTO_7179 ) ) ( ON-TABLE ?AUTO_7178 ) ( not ( = ?AUTO_7178 ?AUTO_7180 ) ) ( not ( = ?AUTO_7179 ?AUTO_7180 ) ) ( not ( = ?AUTO_7178 ?AUTO_7185 ) ) ( not ( = ?AUTO_7178 ?AUTO_7184 ) ) ( not ( = ?AUTO_7179 ?AUTO_7185 ) ) ( not ( = ?AUTO_7179 ?AUTO_7184 ) ) ( not ( = ?AUTO_7180 ?AUTO_7185 ) ) ( not ( = ?AUTO_7180 ?AUTO_7184 ) ) ( not ( = ?AUTO_7185 ?AUTO_7184 ) ) ( not ( = ?AUTO_7178 ?AUTO_7186 ) ) ( not ( = ?AUTO_7179 ?AUTO_7186 ) ) ( not ( = ?AUTO_7180 ?AUTO_7186 ) ) ( not ( = ?AUTO_7185 ?AUTO_7186 ) ) ( not ( = ?AUTO_7184 ?AUTO_7186 ) ) ( CLEAR ?AUTO_7183 ) ( not ( = ?AUTO_7178 ?AUTO_7182 ) ) ( not ( = ?AUTO_7178 ?AUTO_7183 ) ) ( not ( = ?AUTO_7179 ?AUTO_7182 ) ) ( not ( = ?AUTO_7179 ?AUTO_7183 ) ) ( not ( = ?AUTO_7180 ?AUTO_7182 ) ) ( not ( = ?AUTO_7180 ?AUTO_7183 ) ) ( not ( = ?AUTO_7185 ?AUTO_7182 ) ) ( not ( = ?AUTO_7185 ?AUTO_7183 ) ) ( not ( = ?AUTO_7184 ?AUTO_7182 ) ) ( not ( = ?AUTO_7184 ?AUTO_7183 ) ) ( not ( = ?AUTO_7186 ?AUTO_7182 ) ) ( not ( = ?AUTO_7186 ?AUTO_7183 ) ) ( not ( = ?AUTO_7182 ?AUTO_7183 ) ) ( ON ?AUTO_7182 ?AUTO_7179 ) ( not ( = ?AUTO_7178 ?AUTO_7181 ) ) ( not ( = ?AUTO_7179 ?AUTO_7181 ) ) ( not ( = ?AUTO_7180 ?AUTO_7181 ) ) ( not ( = ?AUTO_7185 ?AUTO_7181 ) ) ( not ( = ?AUTO_7184 ?AUTO_7181 ) ) ( not ( = ?AUTO_7186 ?AUTO_7181 ) ) ( not ( = ?AUTO_7183 ?AUTO_7181 ) ) ( not ( = ?AUTO_7182 ?AUTO_7181 ) ) ( ON ?AUTO_7181 ?AUTO_7182 ) ( ON ?AUTO_7186 ?AUTO_7181 ) ( ON ?AUTO_7185 ?AUTO_7186 ) ( CLEAR ?AUTO_7185 ) ( ON-TABLE ?AUTO_7184 ) ( CLEAR ?AUTO_7178 ) ( ON ?AUTO_7180 ?AUTO_7184 ) ( CLEAR ?AUTO_7180 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7180 ?AUTO_7184 )
      ( MAKE-ON ?AUTO_7178 ?AUTO_7179 )
      ( MAKE-ON-VERIFY ?AUTO_7178 ?AUTO_7179 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7193 - BLOCK
      ?AUTO_7194 - BLOCK
    )
    :vars
    (
      ?AUTO_7200 - BLOCK
      ?AUTO_7199 - BLOCK
      ?AUTO_7196 - BLOCK
      ?AUTO_7195 - BLOCK
      ?AUTO_7197 - BLOCK
      ?AUTO_7201 - BLOCK
      ?AUTO_7198 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_7193 ?AUTO_7194 ) ) ( ON-TABLE ?AUTO_7193 ) ( not ( = ?AUTO_7193 ?AUTO_7200 ) ) ( not ( = ?AUTO_7194 ?AUTO_7200 ) ) ( not ( = ?AUTO_7193 ?AUTO_7199 ) ) ( not ( = ?AUTO_7193 ?AUTO_7196 ) ) ( not ( = ?AUTO_7194 ?AUTO_7199 ) ) ( not ( = ?AUTO_7194 ?AUTO_7196 ) ) ( not ( = ?AUTO_7200 ?AUTO_7199 ) ) ( not ( = ?AUTO_7200 ?AUTO_7196 ) ) ( not ( = ?AUTO_7199 ?AUTO_7196 ) ) ( not ( = ?AUTO_7193 ?AUTO_7195 ) ) ( not ( = ?AUTO_7194 ?AUTO_7195 ) ) ( not ( = ?AUTO_7200 ?AUTO_7195 ) ) ( not ( = ?AUTO_7199 ?AUTO_7195 ) ) ( not ( = ?AUTO_7196 ?AUTO_7195 ) ) ( not ( = ?AUTO_7193 ?AUTO_7197 ) ) ( not ( = ?AUTO_7193 ?AUTO_7201 ) ) ( not ( = ?AUTO_7194 ?AUTO_7197 ) ) ( not ( = ?AUTO_7194 ?AUTO_7201 ) ) ( not ( = ?AUTO_7200 ?AUTO_7197 ) ) ( not ( = ?AUTO_7200 ?AUTO_7201 ) ) ( not ( = ?AUTO_7199 ?AUTO_7197 ) ) ( not ( = ?AUTO_7199 ?AUTO_7201 ) ) ( not ( = ?AUTO_7196 ?AUTO_7197 ) ) ( not ( = ?AUTO_7196 ?AUTO_7201 ) ) ( not ( = ?AUTO_7195 ?AUTO_7197 ) ) ( not ( = ?AUTO_7195 ?AUTO_7201 ) ) ( not ( = ?AUTO_7197 ?AUTO_7201 ) ) ( ON ?AUTO_7197 ?AUTO_7194 ) ( not ( = ?AUTO_7193 ?AUTO_7198 ) ) ( not ( = ?AUTO_7194 ?AUTO_7198 ) ) ( not ( = ?AUTO_7200 ?AUTO_7198 ) ) ( not ( = ?AUTO_7199 ?AUTO_7198 ) ) ( not ( = ?AUTO_7196 ?AUTO_7198 ) ) ( not ( = ?AUTO_7195 ?AUTO_7198 ) ) ( not ( = ?AUTO_7201 ?AUTO_7198 ) ) ( not ( = ?AUTO_7197 ?AUTO_7198 ) ) ( ON ?AUTO_7198 ?AUTO_7197 ) ( ON ?AUTO_7195 ?AUTO_7198 ) ( ON ?AUTO_7199 ?AUTO_7195 ) ( CLEAR ?AUTO_7199 ) ( ON-TABLE ?AUTO_7196 ) ( CLEAR ?AUTO_7196 ) ( CLEAR ?AUTO_7193 ) ( ON ?AUTO_7200 ?AUTO_7201 ) ( CLEAR ?AUTO_7200 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7200 ?AUTO_7201 )
      ( MAKE-ON ?AUTO_7193 ?AUTO_7194 )
      ( MAKE-ON-VERIFY ?AUTO_7193 ?AUTO_7194 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7204 - BLOCK
      ?AUTO_7205 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_7204 ) ( CLEAR ?AUTO_7205 ) ( not ( = ?AUTO_7204 ?AUTO_7205 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_7204 ?AUTO_7205 )
      ( MAKE-ON-VERIFY ?AUTO_7204 ?AUTO_7205 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7206 - BLOCK
      ?AUTO_7207 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7207 ) ( not ( = ?AUTO_7206 ?AUTO_7207 ) ) ( ON-TABLE ?AUTO_7206 ) ( CLEAR ?AUTO_7206 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_7206 )
      ( MAKE-ON ?AUTO_7206 ?AUTO_7207 )
      ( MAKE-ON-VERIFY ?AUTO_7206 ?AUTO_7207 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7208 - BLOCK
      ?AUTO_7209 - BLOCK
    )
    :vars
    (
      ?AUTO_7210 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_7208 ?AUTO_7209 ) ) ( ON-TABLE ?AUTO_7208 ) ( CLEAR ?AUTO_7208 ) ( HOLDING ?AUTO_7209 ) ( CLEAR ?AUTO_7210 ) ( not ( = ?AUTO_7208 ?AUTO_7210 ) ) ( not ( = ?AUTO_7209 ?AUTO_7210 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_7209 ?AUTO_7210 )
      ( MAKE-ON ?AUTO_7208 ?AUTO_7209 )
      ( MAKE-ON-VERIFY ?AUTO_7208 ?AUTO_7209 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7368 - BLOCK
      ?AUTO_7369 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_7368 ) ( CLEAR ?AUTO_7369 ) ( not ( = ?AUTO_7368 ?AUTO_7369 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_7368 ?AUTO_7369 )
      ( MAKE-ON-VERIFY ?AUTO_7368 ?AUTO_7369 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7370 - BLOCK
      ?AUTO_7371 - BLOCK
    )
    :vars
    (
      ?AUTO_7372 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7371 ) ( not ( = ?AUTO_7370 ?AUTO_7371 ) ) ( ON ?AUTO_7370 ?AUTO_7372 ) ( CLEAR ?AUTO_7370 ) ( HAND-EMPTY ) ( not ( = ?AUTO_7370 ?AUTO_7372 ) ) ( not ( = ?AUTO_7371 ?AUTO_7372 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7370 ?AUTO_7372 )
      ( MAKE-ON ?AUTO_7370 ?AUTO_7371 )
      ( MAKE-ON-VERIFY ?AUTO_7370 ?AUTO_7371 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7373 - BLOCK
      ?AUTO_7374 - BLOCK
    )
    :vars
    (
      ?AUTO_7375 - BLOCK
      ?AUTO_7376 - BLOCK
      ?AUTO_7377 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7374 ) ( not ( = ?AUTO_7373 ?AUTO_7374 ) ) ( ON ?AUTO_7373 ?AUTO_7375 ) ( CLEAR ?AUTO_7373 ) ( not ( = ?AUTO_7373 ?AUTO_7375 ) ) ( not ( = ?AUTO_7374 ?AUTO_7375 ) ) ( HOLDING ?AUTO_7376 ) ( CLEAR ?AUTO_7377 ) ( not ( = ?AUTO_7373 ?AUTO_7376 ) ) ( not ( = ?AUTO_7373 ?AUTO_7377 ) ) ( not ( = ?AUTO_7374 ?AUTO_7376 ) ) ( not ( = ?AUTO_7374 ?AUTO_7377 ) ) ( not ( = ?AUTO_7375 ?AUTO_7376 ) ) ( not ( = ?AUTO_7375 ?AUTO_7377 ) ) ( not ( = ?AUTO_7376 ?AUTO_7377 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_7376 ?AUTO_7377 )
      ( MAKE-ON ?AUTO_7373 ?AUTO_7374 )
      ( MAKE-ON-VERIFY ?AUTO_7373 ?AUTO_7374 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7416 - BLOCK
      ?AUTO_7417 - BLOCK
    )
    :vars
    (
      ?AUTO_7418 - BLOCK
      ?AUTO_7420 - BLOCK
      ?AUTO_7419 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_7416 ?AUTO_7417 ) ) ( not ( = ?AUTO_7416 ?AUTO_7418 ) ) ( not ( = ?AUTO_7417 ?AUTO_7418 ) ) ( CLEAR ?AUTO_7420 ) ( not ( = ?AUTO_7416 ?AUTO_7419 ) ) ( not ( = ?AUTO_7416 ?AUTO_7420 ) ) ( not ( = ?AUTO_7417 ?AUTO_7419 ) ) ( not ( = ?AUTO_7417 ?AUTO_7420 ) ) ( not ( = ?AUTO_7418 ?AUTO_7419 ) ) ( not ( = ?AUTO_7418 ?AUTO_7420 ) ) ( not ( = ?AUTO_7419 ?AUTO_7420 ) ) ( ON ?AUTO_7419 ?AUTO_7417 ) ( CLEAR ?AUTO_7419 ) ( HOLDING ?AUTO_7416 ) ( CLEAR ?AUTO_7418 ) )
    :subtasks
    ( ( !STACK ?AUTO_7416 ?AUTO_7418 )
      ( MAKE-ON ?AUTO_7416 ?AUTO_7417 )
      ( MAKE-ON-VERIFY ?AUTO_7416 ?AUTO_7417 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7421 - BLOCK
      ?AUTO_7422 - BLOCK
    )
    :vars
    (
      ?AUTO_7425 - BLOCK
      ?AUTO_7423 - BLOCK
      ?AUTO_7424 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_7421 ?AUTO_7422 ) ) ( not ( = ?AUTO_7421 ?AUTO_7425 ) ) ( not ( = ?AUTO_7422 ?AUTO_7425 ) ) ( CLEAR ?AUTO_7423 ) ( not ( = ?AUTO_7421 ?AUTO_7424 ) ) ( not ( = ?AUTO_7421 ?AUTO_7423 ) ) ( not ( = ?AUTO_7422 ?AUTO_7424 ) ) ( not ( = ?AUTO_7422 ?AUTO_7423 ) ) ( not ( = ?AUTO_7425 ?AUTO_7424 ) ) ( not ( = ?AUTO_7425 ?AUTO_7423 ) ) ( not ( = ?AUTO_7424 ?AUTO_7423 ) ) ( ON ?AUTO_7424 ?AUTO_7422 ) ( CLEAR ?AUTO_7425 ) ( ON ?AUTO_7421 ?AUTO_7424 ) ( CLEAR ?AUTO_7421 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7421 ?AUTO_7424 )
      ( MAKE-ON ?AUTO_7421 ?AUTO_7422 )
      ( MAKE-ON-VERIFY ?AUTO_7421 ?AUTO_7422 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7426 - BLOCK
      ?AUTO_7427 - BLOCK
    )
    :vars
    (
      ?AUTO_7430 - BLOCK
      ?AUTO_7428 - BLOCK
      ?AUTO_7429 - BLOCK
      ?AUTO_7431 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_7426 ?AUTO_7427 ) ) ( not ( = ?AUTO_7426 ?AUTO_7430 ) ) ( not ( = ?AUTO_7427 ?AUTO_7430 ) ) ( CLEAR ?AUTO_7428 ) ( not ( = ?AUTO_7426 ?AUTO_7429 ) ) ( not ( = ?AUTO_7426 ?AUTO_7428 ) ) ( not ( = ?AUTO_7427 ?AUTO_7429 ) ) ( not ( = ?AUTO_7427 ?AUTO_7428 ) ) ( not ( = ?AUTO_7430 ?AUTO_7429 ) ) ( not ( = ?AUTO_7430 ?AUTO_7428 ) ) ( not ( = ?AUTO_7429 ?AUTO_7428 ) ) ( ON ?AUTO_7429 ?AUTO_7427 ) ( ON ?AUTO_7426 ?AUTO_7429 ) ( CLEAR ?AUTO_7426 ) ( HOLDING ?AUTO_7430 ) ( CLEAR ?AUTO_7431 ) ( not ( = ?AUTO_7426 ?AUTO_7431 ) ) ( not ( = ?AUTO_7427 ?AUTO_7431 ) ) ( not ( = ?AUTO_7430 ?AUTO_7431 ) ) ( not ( = ?AUTO_7428 ?AUTO_7431 ) ) ( not ( = ?AUTO_7429 ?AUTO_7431 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_7430 ?AUTO_7431 )
      ( MAKE-ON ?AUTO_7426 ?AUTO_7427 )
      ( MAKE-ON-VERIFY ?AUTO_7426 ?AUTO_7427 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7448 - BLOCK
      ?AUTO_7449 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_7448 ) ( CLEAR ?AUTO_7449 ) ( not ( = ?AUTO_7448 ?AUTO_7449 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_7448 ?AUTO_7449 )
      ( MAKE-ON-VERIFY ?AUTO_7448 ?AUTO_7449 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7450 - BLOCK
      ?AUTO_7451 - BLOCK
    )
    :vars
    (
      ?AUTO_7452 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7451 ) ( not ( = ?AUTO_7450 ?AUTO_7451 ) ) ( ON ?AUTO_7450 ?AUTO_7452 ) ( CLEAR ?AUTO_7450 ) ( HAND-EMPTY ) ( not ( = ?AUTO_7450 ?AUTO_7452 ) ) ( not ( = ?AUTO_7451 ?AUTO_7452 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7450 ?AUTO_7452 )
      ( MAKE-ON ?AUTO_7450 ?AUTO_7451 )
      ( MAKE-ON-VERIFY ?AUTO_7450 ?AUTO_7451 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7453 - BLOCK
      ?AUTO_7454 - BLOCK
    )
    :vars
    (
      ?AUTO_7455 - BLOCK
      ?AUTO_7456 - BLOCK
      ?AUTO_7457 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7454 ) ( not ( = ?AUTO_7453 ?AUTO_7454 ) ) ( ON ?AUTO_7453 ?AUTO_7455 ) ( CLEAR ?AUTO_7453 ) ( not ( = ?AUTO_7453 ?AUTO_7455 ) ) ( not ( = ?AUTO_7454 ?AUTO_7455 ) ) ( HOLDING ?AUTO_7456 ) ( CLEAR ?AUTO_7457 ) ( not ( = ?AUTO_7453 ?AUTO_7456 ) ) ( not ( = ?AUTO_7453 ?AUTO_7457 ) ) ( not ( = ?AUTO_7454 ?AUTO_7456 ) ) ( not ( = ?AUTO_7454 ?AUTO_7457 ) ) ( not ( = ?AUTO_7455 ?AUTO_7456 ) ) ( not ( = ?AUTO_7455 ?AUTO_7457 ) ) ( not ( = ?AUTO_7456 ?AUTO_7457 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_7456 ?AUTO_7457 )
      ( MAKE-ON ?AUTO_7453 ?AUTO_7454 )
      ( MAKE-ON-VERIFY ?AUTO_7453 ?AUTO_7454 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7458 - BLOCK
      ?AUTO_7459 - BLOCK
    )
    :vars
    (
      ?AUTO_7460 - BLOCK
      ?AUTO_7461 - BLOCK
      ?AUTO_7462 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7459 ) ( not ( = ?AUTO_7458 ?AUTO_7459 ) ) ( ON ?AUTO_7458 ?AUTO_7460 ) ( not ( = ?AUTO_7458 ?AUTO_7460 ) ) ( not ( = ?AUTO_7459 ?AUTO_7460 ) ) ( CLEAR ?AUTO_7461 ) ( not ( = ?AUTO_7458 ?AUTO_7462 ) ) ( not ( = ?AUTO_7458 ?AUTO_7461 ) ) ( not ( = ?AUTO_7459 ?AUTO_7462 ) ) ( not ( = ?AUTO_7459 ?AUTO_7461 ) ) ( not ( = ?AUTO_7460 ?AUTO_7462 ) ) ( not ( = ?AUTO_7460 ?AUTO_7461 ) ) ( not ( = ?AUTO_7462 ?AUTO_7461 ) ) ( ON ?AUTO_7462 ?AUTO_7458 ) ( CLEAR ?AUTO_7462 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7462 ?AUTO_7458 )
      ( MAKE-ON ?AUTO_7458 ?AUTO_7459 )
      ( MAKE-ON-VERIFY ?AUTO_7458 ?AUTO_7459 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7463 - BLOCK
      ?AUTO_7464 - BLOCK
    )
    :vars
    (
      ?AUTO_7465 - BLOCK
      ?AUTO_7467 - BLOCK
      ?AUTO_7466 - BLOCK
      ?AUTO_7468 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_7463 ?AUTO_7464 ) ) ( ON ?AUTO_7463 ?AUTO_7465 ) ( not ( = ?AUTO_7463 ?AUTO_7465 ) ) ( not ( = ?AUTO_7464 ?AUTO_7465 ) ) ( CLEAR ?AUTO_7467 ) ( not ( = ?AUTO_7463 ?AUTO_7466 ) ) ( not ( = ?AUTO_7463 ?AUTO_7467 ) ) ( not ( = ?AUTO_7464 ?AUTO_7466 ) ) ( not ( = ?AUTO_7464 ?AUTO_7467 ) ) ( not ( = ?AUTO_7465 ?AUTO_7466 ) ) ( not ( = ?AUTO_7465 ?AUTO_7467 ) ) ( not ( = ?AUTO_7466 ?AUTO_7467 ) ) ( ON ?AUTO_7466 ?AUTO_7463 ) ( CLEAR ?AUTO_7466 ) ( HOLDING ?AUTO_7464 ) ( CLEAR ?AUTO_7468 ) ( not ( = ?AUTO_7463 ?AUTO_7468 ) ) ( not ( = ?AUTO_7464 ?AUTO_7468 ) ) ( not ( = ?AUTO_7465 ?AUTO_7468 ) ) ( not ( = ?AUTO_7467 ?AUTO_7468 ) ) ( not ( = ?AUTO_7466 ?AUTO_7468 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_7464 ?AUTO_7468 )
      ( MAKE-ON ?AUTO_7463 ?AUTO_7464 )
      ( MAKE-ON-VERIFY ?AUTO_7463 ?AUTO_7464 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7471 - BLOCK
      ?AUTO_7472 - BLOCK
    )
    :vars
    (
      ?AUTO_7475 - BLOCK
      ?AUTO_7474 - BLOCK
      ?AUTO_7473 - BLOCK
      ?AUTO_7476 - BLOCK
      ?AUTO_7477 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7472 ) ( not ( = ?AUTO_7471 ?AUTO_7472 ) ) ( ON ?AUTO_7471 ?AUTO_7475 ) ( not ( = ?AUTO_7471 ?AUTO_7475 ) ) ( not ( = ?AUTO_7472 ?AUTO_7475 ) ) ( CLEAR ?AUTO_7474 ) ( not ( = ?AUTO_7471 ?AUTO_7473 ) ) ( not ( = ?AUTO_7471 ?AUTO_7474 ) ) ( not ( = ?AUTO_7472 ?AUTO_7473 ) ) ( not ( = ?AUTO_7472 ?AUTO_7474 ) ) ( not ( = ?AUTO_7475 ?AUTO_7473 ) ) ( not ( = ?AUTO_7475 ?AUTO_7474 ) ) ( not ( = ?AUTO_7473 ?AUTO_7474 ) ) ( ON ?AUTO_7473 ?AUTO_7471 ) ( CLEAR ?AUTO_7473 ) ( HOLDING ?AUTO_7476 ) ( CLEAR ?AUTO_7477 ) ( not ( = ?AUTO_7471 ?AUTO_7476 ) ) ( not ( = ?AUTO_7471 ?AUTO_7477 ) ) ( not ( = ?AUTO_7472 ?AUTO_7476 ) ) ( not ( = ?AUTO_7472 ?AUTO_7477 ) ) ( not ( = ?AUTO_7475 ?AUTO_7476 ) ) ( not ( = ?AUTO_7475 ?AUTO_7477 ) ) ( not ( = ?AUTO_7474 ?AUTO_7476 ) ) ( not ( = ?AUTO_7474 ?AUTO_7477 ) ) ( not ( = ?AUTO_7473 ?AUTO_7476 ) ) ( not ( = ?AUTO_7473 ?AUTO_7477 ) ) ( not ( = ?AUTO_7476 ?AUTO_7477 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_7476 ?AUTO_7477 )
      ( MAKE-ON ?AUTO_7471 ?AUTO_7472 )
      ( MAKE-ON-VERIFY ?AUTO_7471 ?AUTO_7472 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7590 - BLOCK
      ?AUTO_7591 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_7590 ) ( CLEAR ?AUTO_7591 ) ( not ( = ?AUTO_7590 ?AUTO_7591 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_7590 ?AUTO_7591 )
      ( MAKE-ON-VERIFY ?AUTO_7590 ?AUTO_7591 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7592 - BLOCK
      ?AUTO_7593 - BLOCK
    )
    :vars
    (
      ?AUTO_7594 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7593 ) ( not ( = ?AUTO_7592 ?AUTO_7593 ) ) ( ON ?AUTO_7592 ?AUTO_7594 ) ( CLEAR ?AUTO_7592 ) ( HAND-EMPTY ) ( not ( = ?AUTO_7592 ?AUTO_7594 ) ) ( not ( = ?AUTO_7593 ?AUTO_7594 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7592 ?AUTO_7594 )
      ( MAKE-ON ?AUTO_7592 ?AUTO_7593 )
      ( MAKE-ON-VERIFY ?AUTO_7592 ?AUTO_7593 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7595 - BLOCK
      ?AUTO_7596 - BLOCK
    )
    :vars
    (
      ?AUTO_7597 - BLOCK
      ?AUTO_7598 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_7595 ?AUTO_7596 ) ) ( ON ?AUTO_7595 ?AUTO_7597 ) ( CLEAR ?AUTO_7595 ) ( not ( = ?AUTO_7595 ?AUTO_7597 ) ) ( not ( = ?AUTO_7596 ?AUTO_7597 ) ) ( HOLDING ?AUTO_7596 ) ( CLEAR ?AUTO_7598 ) ( not ( = ?AUTO_7595 ?AUTO_7598 ) ) ( not ( = ?AUTO_7596 ?AUTO_7598 ) ) ( not ( = ?AUTO_7597 ?AUTO_7598 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_7596 ?AUTO_7598 )
      ( MAKE-ON ?AUTO_7595 ?AUTO_7596 )
      ( MAKE-ON-VERIFY ?AUTO_7595 ?AUTO_7596 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_7600 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_7600 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7600 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_7600 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_7601 - BLOCK
    )
    :vars
    (
      ?AUTO_7602 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7601 ?AUTO_7602 ) ( CLEAR ?AUTO_7601 ) ( HAND-EMPTY ) ( not ( = ?AUTO_7601 ?AUTO_7602 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7601 ?AUTO_7602 )
      ( MAKE-ON-TABLE ?AUTO_7601 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_7601 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7605 - BLOCK
      ?AUTO_7606 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_7605 ) ( CLEAR ?AUTO_7606 ) ( not ( = ?AUTO_7605 ?AUTO_7606 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_7605 ?AUTO_7606 )
      ( MAKE-ON-VERIFY ?AUTO_7605 ?AUTO_7606 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7607 - BLOCK
      ?AUTO_7608 - BLOCK
    )
    :vars
    (
      ?AUTO_7609 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7608 ) ( not ( = ?AUTO_7607 ?AUTO_7608 ) ) ( ON ?AUTO_7607 ?AUTO_7609 ) ( CLEAR ?AUTO_7607 ) ( HAND-EMPTY ) ( not ( = ?AUTO_7607 ?AUTO_7609 ) ) ( not ( = ?AUTO_7608 ?AUTO_7609 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7607 ?AUTO_7609 )
      ( MAKE-ON ?AUTO_7607 ?AUTO_7608 )
      ( MAKE-ON-VERIFY ?AUTO_7607 ?AUTO_7608 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7610 - BLOCK
      ?AUTO_7611 - BLOCK
    )
    :vars
    (
      ?AUTO_7612 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_7610 ?AUTO_7611 ) ) ( ON ?AUTO_7610 ?AUTO_7612 ) ( CLEAR ?AUTO_7610 ) ( not ( = ?AUTO_7610 ?AUTO_7612 ) ) ( not ( = ?AUTO_7611 ?AUTO_7612 ) ) ( HOLDING ?AUTO_7611 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7611 )
      ( MAKE-ON ?AUTO_7610 ?AUTO_7611 )
      ( MAKE-ON-VERIFY ?AUTO_7610 ?AUTO_7611 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7617 - BLOCK
      ?AUTO_7618 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_7617 ) ( CLEAR ?AUTO_7618 ) ( not ( = ?AUTO_7617 ?AUTO_7618 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_7617 ?AUTO_7618 )
      ( MAKE-ON-VERIFY ?AUTO_7617 ?AUTO_7618 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7619 - BLOCK
      ?AUTO_7620 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7620 ) ( not ( = ?AUTO_7619 ?AUTO_7620 ) ) ( ON-TABLE ?AUTO_7619 ) ( CLEAR ?AUTO_7619 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_7619 )
      ( MAKE-ON ?AUTO_7619 ?AUTO_7620 )
      ( MAKE-ON-VERIFY ?AUTO_7619 ?AUTO_7620 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7621 - BLOCK
      ?AUTO_7622 - BLOCK
    )
    :vars
    (
      ?AUTO_7623 - BLOCK
      ?AUTO_7624 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7622 ) ( not ( = ?AUTO_7621 ?AUTO_7622 ) ) ( ON-TABLE ?AUTO_7621 ) ( CLEAR ?AUTO_7621 ) ( HOLDING ?AUTO_7623 ) ( CLEAR ?AUTO_7624 ) ( not ( = ?AUTO_7621 ?AUTO_7623 ) ) ( not ( = ?AUTO_7621 ?AUTO_7624 ) ) ( not ( = ?AUTO_7622 ?AUTO_7623 ) ) ( not ( = ?AUTO_7622 ?AUTO_7624 ) ) ( not ( = ?AUTO_7623 ?AUTO_7624 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_7623 ?AUTO_7624 )
      ( MAKE-ON ?AUTO_7621 ?AUTO_7622 )
      ( MAKE-ON-VERIFY ?AUTO_7621 ?AUTO_7622 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7625 - BLOCK
      ?AUTO_7626 - BLOCK
    )
    :vars
    (
      ?AUTO_7627 - BLOCK
      ?AUTO_7628 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_7625 ?AUTO_7626 ) ) ( ON-TABLE ?AUTO_7625 ) ( CLEAR ?AUTO_7625 ) ( CLEAR ?AUTO_7627 ) ( not ( = ?AUTO_7625 ?AUTO_7628 ) ) ( not ( = ?AUTO_7625 ?AUTO_7627 ) ) ( not ( = ?AUTO_7626 ?AUTO_7628 ) ) ( not ( = ?AUTO_7626 ?AUTO_7627 ) ) ( not ( = ?AUTO_7628 ?AUTO_7627 ) ) ( ON ?AUTO_7628 ?AUTO_7626 ) ( CLEAR ?AUTO_7628 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7628 ?AUTO_7626 )
      ( MAKE-ON ?AUTO_7625 ?AUTO_7626 )
      ( MAKE-ON-VERIFY ?AUTO_7625 ?AUTO_7626 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7629 - BLOCK
      ?AUTO_7630 - BLOCK
    )
    :vars
    (
      ?AUTO_7632 - BLOCK
      ?AUTO_7631 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_7629 ?AUTO_7630 ) ) ( ON-TABLE ?AUTO_7629 ) ( CLEAR ?AUTO_7629 ) ( not ( = ?AUTO_7629 ?AUTO_7632 ) ) ( not ( = ?AUTO_7629 ?AUTO_7631 ) ) ( not ( = ?AUTO_7630 ?AUTO_7632 ) ) ( not ( = ?AUTO_7630 ?AUTO_7631 ) ) ( not ( = ?AUTO_7632 ?AUTO_7631 ) ) ( ON ?AUTO_7632 ?AUTO_7630 ) ( CLEAR ?AUTO_7632 ) ( HOLDING ?AUTO_7631 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7631 )
      ( MAKE-ON ?AUTO_7629 ?AUTO_7630 )
      ( MAKE-ON-VERIFY ?AUTO_7629 ?AUTO_7630 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7633 - BLOCK
      ?AUTO_7634 - BLOCK
    )
    :vars
    (
      ?AUTO_7635 - BLOCK
      ?AUTO_7636 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_7633 ?AUTO_7634 ) ) ( ON-TABLE ?AUTO_7633 ) ( not ( = ?AUTO_7633 ?AUTO_7635 ) ) ( not ( = ?AUTO_7633 ?AUTO_7636 ) ) ( not ( = ?AUTO_7634 ?AUTO_7635 ) ) ( not ( = ?AUTO_7634 ?AUTO_7636 ) ) ( not ( = ?AUTO_7635 ?AUTO_7636 ) ) ( ON ?AUTO_7635 ?AUTO_7634 ) ( CLEAR ?AUTO_7635 ) ( ON ?AUTO_7636 ?AUTO_7633 ) ( CLEAR ?AUTO_7636 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7636 ?AUTO_7633 )
      ( MAKE-ON ?AUTO_7633 ?AUTO_7634 )
      ( MAKE-ON-VERIFY ?AUTO_7633 ?AUTO_7634 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7639 - BLOCK
      ?AUTO_7640 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_7639 ) ( CLEAR ?AUTO_7640 ) ( not ( = ?AUTO_7639 ?AUTO_7640 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_7639 ?AUTO_7640 )
      ( MAKE-ON-VERIFY ?AUTO_7639 ?AUTO_7640 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7641 - BLOCK
      ?AUTO_7642 - BLOCK
    )
    :vars
    (
      ?AUTO_7643 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7642 ) ( not ( = ?AUTO_7641 ?AUTO_7642 ) ) ( ON ?AUTO_7641 ?AUTO_7643 ) ( CLEAR ?AUTO_7641 ) ( HAND-EMPTY ) ( not ( = ?AUTO_7641 ?AUTO_7643 ) ) ( not ( = ?AUTO_7642 ?AUTO_7643 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7641 ?AUTO_7643 )
      ( MAKE-ON ?AUTO_7641 ?AUTO_7642 )
      ( MAKE-ON-VERIFY ?AUTO_7641 ?AUTO_7642 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7644 - BLOCK
      ?AUTO_7645 - BLOCK
    )
    :vars
    (
      ?AUTO_7646 - BLOCK
      ?AUTO_7647 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_7644 ?AUTO_7645 ) ) ( ON ?AUTO_7644 ?AUTO_7646 ) ( CLEAR ?AUTO_7644 ) ( not ( = ?AUTO_7644 ?AUTO_7646 ) ) ( not ( = ?AUTO_7645 ?AUTO_7646 ) ) ( HOLDING ?AUTO_7645 ) ( CLEAR ?AUTO_7647 ) ( not ( = ?AUTO_7644 ?AUTO_7647 ) ) ( not ( = ?AUTO_7645 ?AUTO_7647 ) ) ( not ( = ?AUTO_7646 ?AUTO_7647 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_7645 ?AUTO_7647 )
      ( MAKE-ON ?AUTO_7644 ?AUTO_7645 )
      ( MAKE-ON-VERIFY ?AUTO_7644 ?AUTO_7645 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7654 - BLOCK
      ?AUTO_7655 - BLOCK
    )
    :vars
    (
      ?AUTO_7656 - BLOCK
      ?AUTO_7657 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7655 ) ( not ( = ?AUTO_7654 ?AUTO_7655 ) ) ( ON ?AUTO_7654 ?AUTO_7656 ) ( CLEAR ?AUTO_7654 ) ( not ( = ?AUTO_7654 ?AUTO_7656 ) ) ( not ( = ?AUTO_7655 ?AUTO_7656 ) ) ( HOLDING ?AUTO_7657 ) ( not ( = ?AUTO_7654 ?AUTO_7657 ) ) ( not ( = ?AUTO_7655 ?AUTO_7657 ) ) ( not ( = ?AUTO_7656 ?AUTO_7657 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7657 )
      ( MAKE-ON ?AUTO_7654 ?AUTO_7655 )
      ( MAKE-ON-VERIFY ?AUTO_7654 ?AUTO_7655 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7658 - BLOCK
      ?AUTO_7659 - BLOCK
    )
    :vars
    (
      ?AUTO_7660 - BLOCK
      ?AUTO_7661 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_7658 ?AUTO_7659 ) ) ( ON ?AUTO_7658 ?AUTO_7660 ) ( CLEAR ?AUTO_7658 ) ( not ( = ?AUTO_7658 ?AUTO_7660 ) ) ( not ( = ?AUTO_7659 ?AUTO_7660 ) ) ( not ( = ?AUTO_7658 ?AUTO_7661 ) ) ( not ( = ?AUTO_7659 ?AUTO_7661 ) ) ( not ( = ?AUTO_7660 ?AUTO_7661 ) ) ( ON ?AUTO_7661 ?AUTO_7659 ) ( CLEAR ?AUTO_7661 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7661 ?AUTO_7659 )
      ( MAKE-ON ?AUTO_7658 ?AUTO_7659 )
      ( MAKE-ON-VERIFY ?AUTO_7658 ?AUTO_7659 ) )
  )

)

