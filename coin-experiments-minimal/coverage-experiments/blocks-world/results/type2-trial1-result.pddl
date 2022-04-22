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

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_8 - BLOCK
    )
    :vars
    (
      ?AUTO_9 - BLOCK
      ?AUTO_10 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8 ?AUTO_9 ) ( CLEAR ?AUTO_8 ) ( not ( = ?AUTO_8 ?AUTO_9 ) ) ( HOLDING ?AUTO_10 ) ( not ( = ?AUTO_8 ?AUTO_10 ) ) ( not ( = ?AUTO_9 ?AUTO_10 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_10 )
      ( MAKE-ON-TABLE ?AUTO_8 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_8 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_14 - BLOCK
      ?AUTO_15 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_14 ) ( CLEAR ?AUTO_15 ) ( not ( = ?AUTO_14 ?AUTO_15 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_14 ?AUTO_15 )
      ( MAKE-ON-VERIFY ?AUTO_14 ?AUTO_15 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_16 - BLOCK
      ?AUTO_17 - BLOCK
    )
    :vars
    (
      ?AUTO_18 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_17 ) ( not ( = ?AUTO_16 ?AUTO_17 ) ) ( ON ?AUTO_16 ?AUTO_18 ) ( CLEAR ?AUTO_16 ) ( HAND-EMPTY ) ( not ( = ?AUTO_16 ?AUTO_18 ) ) ( not ( = ?AUTO_17 ?AUTO_18 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_16 ?AUTO_18 )
      ( MAKE-ON ?AUTO_16 ?AUTO_17 )
      ( MAKE-ON-VERIFY ?AUTO_16 ?AUTO_17 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_19 - BLOCK
      ?AUTO_20 - BLOCK
    )
    :vars
    (
      ?AUTO_21 - BLOCK
      ?AUTO_22 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_20 ) ( not ( = ?AUTO_19 ?AUTO_20 ) ) ( ON ?AUTO_19 ?AUTO_21 ) ( CLEAR ?AUTO_19 ) ( not ( = ?AUTO_19 ?AUTO_21 ) ) ( not ( = ?AUTO_20 ?AUTO_21 ) ) ( HOLDING ?AUTO_22 ) ( not ( = ?AUTO_19 ?AUTO_22 ) ) ( not ( = ?AUTO_20 ?AUTO_22 ) ) ( not ( = ?AUTO_21 ?AUTO_22 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_22 )
      ( MAKE-ON ?AUTO_19 ?AUTO_20 )
      ( MAKE-ON-VERIFY ?AUTO_19 ?AUTO_20 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_23 - BLOCK
      ?AUTO_24 - BLOCK
    )
    :vars
    (
      ?AUTO_25 - BLOCK
      ?AUTO_26 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_24 ) ( not ( = ?AUTO_23 ?AUTO_24 ) ) ( ON ?AUTO_23 ?AUTO_25 ) ( not ( = ?AUTO_23 ?AUTO_25 ) ) ( not ( = ?AUTO_24 ?AUTO_25 ) ) ( not ( = ?AUTO_23 ?AUTO_26 ) ) ( not ( = ?AUTO_24 ?AUTO_26 ) ) ( not ( = ?AUTO_25 ?AUTO_26 ) ) ( ON ?AUTO_26 ?AUTO_23 ) ( CLEAR ?AUTO_26 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_26 ?AUTO_23 )
      ( MAKE-ON ?AUTO_23 ?AUTO_24 )
      ( MAKE-ON-VERIFY ?AUTO_23 ?AUTO_24 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_27 - BLOCK
      ?AUTO_28 - BLOCK
    )
    :vars
    (
      ?AUTO_29 - BLOCK
      ?AUTO_30 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_27 ?AUTO_28 ) ) ( ON ?AUTO_27 ?AUTO_29 ) ( not ( = ?AUTO_27 ?AUTO_29 ) ) ( not ( = ?AUTO_28 ?AUTO_29 ) ) ( not ( = ?AUTO_27 ?AUTO_30 ) ) ( not ( = ?AUTO_28 ?AUTO_30 ) ) ( not ( = ?AUTO_29 ?AUTO_30 ) ) ( ON ?AUTO_30 ?AUTO_27 ) ( CLEAR ?AUTO_30 ) ( HOLDING ?AUTO_28 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_28 )
      ( MAKE-ON ?AUTO_27 ?AUTO_28 )
      ( MAKE-ON-VERIFY ?AUTO_27 ?AUTO_28 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_37 - BLOCK
      ?AUTO_38 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_38 ) ( not ( = ?AUTO_37 ?AUTO_38 ) ) ( ON-TABLE ?AUTO_37 ) ( CLEAR ?AUTO_37 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_37 )
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
      ?AUTO_42 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_40 ) ( not ( = ?AUTO_39 ?AUTO_40 ) ) ( ON-TABLE ?AUTO_39 ) ( CLEAR ?AUTO_39 ) ( HOLDING ?AUTO_41 ) ( CLEAR ?AUTO_42 ) ( not ( = ?AUTO_39 ?AUTO_41 ) ) ( not ( = ?AUTO_39 ?AUTO_42 ) ) ( not ( = ?AUTO_40 ?AUTO_41 ) ) ( not ( = ?AUTO_40 ?AUTO_42 ) ) ( not ( = ?AUTO_41 ?AUTO_42 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_41 ?AUTO_42 )
      ( MAKE-ON ?AUTO_39 ?AUTO_40 )
      ( MAKE-ON-VERIFY ?AUTO_39 ?AUTO_40 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_136 - BLOCK
      ?AUTO_137 - BLOCK
    )
    :vars
    (
      ?AUTO_138 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_137 ) ( not ( = ?AUTO_136 ?AUTO_137 ) ) ( ON-TABLE ?AUTO_136 ) ( not ( = ?AUTO_136 ?AUTO_138 ) ) ( not ( = ?AUTO_137 ?AUTO_138 ) ) ( ON ?AUTO_138 ?AUTO_136 ) ( CLEAR ?AUTO_138 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_138 ?AUTO_136 )
      ( MAKE-ON ?AUTO_136 ?AUTO_137 )
      ( MAKE-ON-VERIFY ?AUTO_136 ?AUTO_137 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_47 - BLOCK
      ?AUTO_48 - BLOCK
    )
    :vars
    (
      ?AUTO_50 - BLOCK
      ?AUTO_49 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_47 ?AUTO_48 ) ) ( ON-TABLE ?AUTO_47 ) ( CLEAR ?AUTO_50 ) ( not ( = ?AUTO_47 ?AUTO_49 ) ) ( not ( = ?AUTO_47 ?AUTO_50 ) ) ( not ( = ?AUTO_48 ?AUTO_49 ) ) ( not ( = ?AUTO_48 ?AUTO_50 ) ) ( not ( = ?AUTO_49 ?AUTO_50 ) ) ( ON ?AUTO_49 ?AUTO_47 ) ( CLEAR ?AUTO_49 ) ( HOLDING ?AUTO_48 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_48 )
      ( MAKE-ON ?AUTO_47 ?AUTO_48 )
      ( MAKE-ON-VERIFY ?AUTO_47 ?AUTO_48 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_51 - BLOCK
      ?AUTO_52 - BLOCK
    )
    :vars
    (
      ?AUTO_54 - BLOCK
      ?AUTO_53 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_51 ?AUTO_52 ) ) ( ON-TABLE ?AUTO_51 ) ( CLEAR ?AUTO_54 ) ( not ( = ?AUTO_51 ?AUTO_53 ) ) ( not ( = ?AUTO_51 ?AUTO_54 ) ) ( not ( = ?AUTO_52 ?AUTO_53 ) ) ( not ( = ?AUTO_52 ?AUTO_54 ) ) ( not ( = ?AUTO_53 ?AUTO_54 ) ) ( ON ?AUTO_53 ?AUTO_51 ) ( ON ?AUTO_52 ?AUTO_53 ) ( CLEAR ?AUTO_52 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_52 ?AUTO_53 )
      ( MAKE-ON ?AUTO_51 ?AUTO_52 )
      ( MAKE-ON-VERIFY ?AUTO_51 ?AUTO_52 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_55 - BLOCK
      ?AUTO_56 - BLOCK
    )
    :vars
    (
      ?AUTO_58 - BLOCK
      ?AUTO_57 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_55 ?AUTO_56 ) ) ( ON-TABLE ?AUTO_55 ) ( not ( = ?AUTO_55 ?AUTO_58 ) ) ( not ( = ?AUTO_55 ?AUTO_57 ) ) ( not ( = ?AUTO_56 ?AUTO_58 ) ) ( not ( = ?AUTO_56 ?AUTO_57 ) ) ( not ( = ?AUTO_58 ?AUTO_57 ) ) ( ON ?AUTO_58 ?AUTO_55 ) ( ON ?AUTO_56 ?AUTO_58 ) ( CLEAR ?AUTO_56 ) ( HOLDING ?AUTO_57 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_57 )
      ( MAKE-ON ?AUTO_55 ?AUTO_56 )
      ( MAKE-ON-VERIFY ?AUTO_55 ?AUTO_56 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_73 - BLOCK
      ?AUTO_74 - BLOCK
    )
    :vars
    (
      ?AUTO_75 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_73 ?AUTO_74 ) ) ( ON-TABLE ?AUTO_73 ) ( CLEAR ?AUTO_73 ) ( HOLDING ?AUTO_74 ) ( CLEAR ?AUTO_75 ) ( not ( = ?AUTO_73 ?AUTO_75 ) ) ( not ( = ?AUTO_74 ?AUTO_75 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_74 ?AUTO_75 )
      ( MAKE-ON ?AUTO_73 ?AUTO_74 )
      ( MAKE-ON-VERIFY ?AUTO_73 ?AUTO_74 ) )
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
    )
    :precondition
    ( and ( not ( = ?AUTO_444 ?AUTO_445 ) ) ( ON-TABLE ?AUTO_444 ) ( CLEAR ?AUTO_444 ) ( not ( = ?AUTO_444 ?AUTO_446 ) ) ( not ( = ?AUTO_445 ?AUTO_446 ) ) ( ON ?AUTO_446 ?AUTO_445 ) ( CLEAR ?AUTO_446 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_446 ?AUTO_445 )
      ( MAKE-ON ?AUTO_444 ?AUTO_445 )
      ( MAKE-ON-VERIFY ?AUTO_444 ?AUTO_445 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_84 - BLOCK
      ?AUTO_85 - BLOCK
    )
    :vars
    (
      ?AUTO_86 - BLOCK
      ?AUTO_87 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_84 ?AUTO_85 ) ) ( ON-TABLE ?AUTO_84 ) ( CLEAR ?AUTO_84 ) ( not ( = ?AUTO_84 ?AUTO_86 ) ) ( not ( = ?AUTO_84 ?AUTO_87 ) ) ( not ( = ?AUTO_85 ?AUTO_86 ) ) ( not ( = ?AUTO_85 ?AUTO_87 ) ) ( not ( = ?AUTO_86 ?AUTO_87 ) ) ( ON ?AUTO_86 ?AUTO_85 ) ( CLEAR ?AUTO_86 ) ( HOLDING ?AUTO_87 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_87 )
      ( MAKE-ON ?AUTO_84 ?AUTO_85 )
      ( MAKE-ON-VERIFY ?AUTO_84 ?AUTO_85 ) )
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
      ?AUTO_91 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_88 ?AUTO_89 ) ) ( ON-TABLE ?AUTO_88 ) ( not ( = ?AUTO_88 ?AUTO_90 ) ) ( not ( = ?AUTO_88 ?AUTO_91 ) ) ( not ( = ?AUTO_89 ?AUTO_90 ) ) ( not ( = ?AUTO_89 ?AUTO_91 ) ) ( not ( = ?AUTO_90 ?AUTO_91 ) ) ( ON ?AUTO_90 ?AUTO_89 ) ( CLEAR ?AUTO_90 ) ( ON ?AUTO_91 ?AUTO_88 ) ( CLEAR ?AUTO_91 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_91 ?AUTO_88 )
      ( MAKE-ON ?AUTO_88 ?AUTO_89 )
      ( MAKE-ON-VERIFY ?AUTO_88 ?AUTO_89 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_113 - BLOCK
    )
    :vars
    (
      ?AUTO_114 - BLOCK
      ?AUTO_115 - BLOCK
      ?AUTO_116 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_113 ?AUTO_114 ) ( CLEAR ?AUTO_113 ) ( not ( = ?AUTO_113 ?AUTO_114 ) ) ( HOLDING ?AUTO_115 ) ( CLEAR ?AUTO_116 ) ( not ( = ?AUTO_113 ?AUTO_115 ) ) ( not ( = ?AUTO_113 ?AUTO_116 ) ) ( not ( = ?AUTO_114 ?AUTO_115 ) ) ( not ( = ?AUTO_114 ?AUTO_116 ) ) ( not ( = ?AUTO_115 ?AUTO_116 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_115 ?AUTO_116 )
      ( MAKE-ON-TABLE ?AUTO_113 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_113 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_514 - BLOCK
    )
    :vars
    (
      ?AUTO_515 - BLOCK
      ?AUTO_516 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_514 ?AUTO_515 ) ( not ( = ?AUTO_514 ?AUTO_515 ) ) ( not ( = ?AUTO_514 ?AUTO_516 ) ) ( not ( = ?AUTO_515 ?AUTO_516 ) ) ( ON ?AUTO_516 ?AUTO_514 ) ( CLEAR ?AUTO_516 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_516 ?AUTO_514 )
      ( MAKE-ON-TABLE ?AUTO_514 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_514 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_412 - BLOCK
    )
    :vars
    (
      ?AUTO_415 - BLOCK
      ?AUTO_414 - BLOCK
      ?AUTO_413 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_412 ?AUTO_415 ) ( not ( = ?AUTO_412 ?AUTO_415 ) ) ( not ( = ?AUTO_412 ?AUTO_414 ) ) ( not ( = ?AUTO_412 ?AUTO_413 ) ) ( not ( = ?AUTO_415 ?AUTO_414 ) ) ( not ( = ?AUTO_415 ?AUTO_413 ) ) ( not ( = ?AUTO_414 ?AUTO_413 ) ) ( ON ?AUTO_414 ?AUTO_412 ) ( CLEAR ?AUTO_414 ) ( HOLDING ?AUTO_413 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_413 )
      ( MAKE-ON-TABLE ?AUTO_412 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_412 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_133 - BLOCK
      ?AUTO_134 - BLOCK
    )
    :vars
    (
      ?AUTO_135 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_134 ) ( not ( = ?AUTO_133 ?AUTO_134 ) ) ( ON-TABLE ?AUTO_133 ) ( CLEAR ?AUTO_133 ) ( HOLDING ?AUTO_135 ) ( not ( = ?AUTO_133 ?AUTO_135 ) ) ( not ( = ?AUTO_134 ?AUTO_135 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_135 )
      ( MAKE-ON ?AUTO_133 ?AUTO_134 )
      ( MAKE-ON-VERIFY ?AUTO_133 ?AUTO_134 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_139 - BLOCK
      ?AUTO_140 - BLOCK
    )
    :vars
    (
      ?AUTO_141 - BLOCK
      ?AUTO_142 - BLOCK
      ?AUTO_143 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_140 ) ( not ( = ?AUTO_139 ?AUTO_140 ) ) ( ON-TABLE ?AUTO_139 ) ( not ( = ?AUTO_139 ?AUTO_141 ) ) ( not ( = ?AUTO_140 ?AUTO_141 ) ) ( ON ?AUTO_141 ?AUTO_139 ) ( CLEAR ?AUTO_141 ) ( HOLDING ?AUTO_142 ) ( CLEAR ?AUTO_143 ) ( not ( = ?AUTO_139 ?AUTO_142 ) ) ( not ( = ?AUTO_139 ?AUTO_143 ) ) ( not ( = ?AUTO_140 ?AUTO_142 ) ) ( not ( = ?AUTO_140 ?AUTO_143 ) ) ( not ( = ?AUTO_141 ?AUTO_142 ) ) ( not ( = ?AUTO_141 ?AUTO_143 ) ) ( not ( = ?AUTO_142 ?AUTO_143 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_142 ?AUTO_143 )
      ( MAKE-ON ?AUTO_139 ?AUTO_140 )
      ( MAKE-ON-VERIFY ?AUTO_139 ?AUTO_140 ) )
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
      ?AUTO_146 - BLOCK
      ?AUTO_147 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_145 ) ( not ( = ?AUTO_144 ?AUTO_145 ) ) ( ON-TABLE ?AUTO_144 ) ( not ( = ?AUTO_144 ?AUTO_148 ) ) ( not ( = ?AUTO_145 ?AUTO_148 ) ) ( ON ?AUTO_148 ?AUTO_144 ) ( CLEAR ?AUTO_146 ) ( not ( = ?AUTO_144 ?AUTO_147 ) ) ( not ( = ?AUTO_144 ?AUTO_146 ) ) ( not ( = ?AUTO_145 ?AUTO_147 ) ) ( not ( = ?AUTO_145 ?AUTO_146 ) ) ( not ( = ?AUTO_148 ?AUTO_147 ) ) ( not ( = ?AUTO_148 ?AUTO_146 ) ) ( not ( = ?AUTO_147 ?AUTO_146 ) ) ( ON ?AUTO_147 ?AUTO_148 ) ( CLEAR ?AUTO_147 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_147 ?AUTO_148 )
      ( MAKE-ON ?AUTO_144 ?AUTO_145 )
      ( MAKE-ON-VERIFY ?AUTO_144 ?AUTO_145 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_149 - BLOCK
      ?AUTO_150 - BLOCK
    )
    :vars
    (
      ?AUTO_153 - BLOCK
      ?AUTO_152 - BLOCK
      ?AUTO_151 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_149 ?AUTO_150 ) ) ( ON-TABLE ?AUTO_149 ) ( not ( = ?AUTO_149 ?AUTO_153 ) ) ( not ( = ?AUTO_150 ?AUTO_153 ) ) ( ON ?AUTO_153 ?AUTO_149 ) ( CLEAR ?AUTO_152 ) ( not ( = ?AUTO_149 ?AUTO_151 ) ) ( not ( = ?AUTO_149 ?AUTO_152 ) ) ( not ( = ?AUTO_150 ?AUTO_151 ) ) ( not ( = ?AUTO_150 ?AUTO_152 ) ) ( not ( = ?AUTO_153 ?AUTO_151 ) ) ( not ( = ?AUTO_153 ?AUTO_152 ) ) ( not ( = ?AUTO_151 ?AUTO_152 ) ) ( ON ?AUTO_151 ?AUTO_153 ) ( CLEAR ?AUTO_151 ) ( HOLDING ?AUTO_150 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_150 )
      ( MAKE-ON ?AUTO_149 ?AUTO_150 )
      ( MAKE-ON-VERIFY ?AUTO_149 ?AUTO_150 ) )
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
      ?AUTO_167 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_164 ) ( not ( = ?AUTO_163 ?AUTO_164 ) ) ( ON ?AUTO_163 ?AUTO_165 ) ( CLEAR ?AUTO_163 ) ( not ( = ?AUTO_163 ?AUTO_165 ) ) ( not ( = ?AUTO_164 ?AUTO_165 ) ) ( HOLDING ?AUTO_166 ) ( CLEAR ?AUTO_167 ) ( not ( = ?AUTO_163 ?AUTO_166 ) ) ( not ( = ?AUTO_163 ?AUTO_167 ) ) ( not ( = ?AUTO_164 ?AUTO_166 ) ) ( not ( = ?AUTO_164 ?AUTO_167 ) ) ( not ( = ?AUTO_165 ?AUTO_166 ) ) ( not ( = ?AUTO_165 ?AUTO_167 ) ) ( not ( = ?AUTO_166 ?AUTO_167 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_166 ?AUTO_167 )
      ( MAKE-ON ?AUTO_163 ?AUTO_164 )
      ( MAKE-ON-VERIFY ?AUTO_163 ?AUTO_164 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1011 - BLOCK
      ?AUTO_1012 - BLOCK
    )
    :vars
    (
      ?AUTO_1013 - BLOCK
      ?AUTO_1014 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1011 ?AUTO_1012 ) ) ( ON ?AUTO_1011 ?AUTO_1013 ) ( CLEAR ?AUTO_1011 ) ( not ( = ?AUTO_1011 ?AUTO_1013 ) ) ( not ( = ?AUTO_1012 ?AUTO_1013 ) ) ( not ( = ?AUTO_1011 ?AUTO_1014 ) ) ( not ( = ?AUTO_1012 ?AUTO_1014 ) ) ( not ( = ?AUTO_1013 ?AUTO_1014 ) ) ( ON ?AUTO_1014 ?AUTO_1012 ) ( CLEAR ?AUTO_1014 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1014 ?AUTO_1012 )
      ( MAKE-ON ?AUTO_1011 ?AUTO_1012 )
      ( MAKE-ON-VERIFY ?AUTO_1011 ?AUTO_1012 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1034 - BLOCK
      ?AUTO_1035 - BLOCK
    )
    :vars
    (
      ?AUTO_1036 - BLOCK
      ?AUTO_1037 - BLOCK
      ?AUTO_1038 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1034 ?AUTO_1035 ) ) ( ON-TABLE ?AUTO_1034 ) ( not ( = ?AUTO_1034 ?AUTO_1036 ) ) ( not ( = ?AUTO_1034 ?AUTO_1037 ) ) ( not ( = ?AUTO_1035 ?AUTO_1036 ) ) ( not ( = ?AUTO_1035 ?AUTO_1037 ) ) ( not ( = ?AUTO_1036 ?AUTO_1037 ) ) ( ON ?AUTO_1036 ?AUTO_1034 ) ( CLEAR ?AUTO_1036 ) ( CLEAR ?AUTO_1038 ) ( not ( = ?AUTO_1034 ?AUTO_1038 ) ) ( not ( = ?AUTO_1035 ?AUTO_1038 ) ) ( not ( = ?AUTO_1036 ?AUTO_1038 ) ) ( not ( = ?AUTO_1037 ?AUTO_1038 ) ) ( ON ?AUTO_1037 ?AUTO_1035 ) ( CLEAR ?AUTO_1037 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1037 ?AUTO_1035 )
      ( MAKE-ON ?AUTO_1034 ?AUTO_1035 )
      ( MAKE-ON-VERIFY ?AUTO_1034 ?AUTO_1035 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1039 - BLOCK
      ?AUTO_1040 - BLOCK
    )
    :vars
    (
      ?AUTO_1041 - BLOCK
      ?AUTO_1042 - BLOCK
      ?AUTO_1043 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1039 ?AUTO_1040 ) ) ( ON-TABLE ?AUTO_1039 ) ( not ( = ?AUTO_1039 ?AUTO_1041 ) ) ( not ( = ?AUTO_1039 ?AUTO_1042 ) ) ( not ( = ?AUTO_1040 ?AUTO_1041 ) ) ( not ( = ?AUTO_1040 ?AUTO_1042 ) ) ( not ( = ?AUTO_1041 ?AUTO_1042 ) ) ( ON ?AUTO_1041 ?AUTO_1039 ) ( CLEAR ?AUTO_1041 ) ( not ( = ?AUTO_1039 ?AUTO_1043 ) ) ( not ( = ?AUTO_1040 ?AUTO_1043 ) ) ( not ( = ?AUTO_1041 ?AUTO_1043 ) ) ( not ( = ?AUTO_1042 ?AUTO_1043 ) ) ( ON ?AUTO_1042 ?AUTO_1040 ) ( CLEAR ?AUTO_1042 ) ( HOLDING ?AUTO_1043 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1043 )
      ( MAKE-ON ?AUTO_1039 ?AUTO_1040 )
      ( MAKE-ON-VERIFY ?AUTO_1039 ?AUTO_1040 ) )
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
      ?AUTO_251 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_248 ?AUTO_249 ) ) ( ON ?AUTO_248 ?AUTO_250 ) ( CLEAR ?AUTO_248 ) ( not ( = ?AUTO_248 ?AUTO_250 ) ) ( not ( = ?AUTO_249 ?AUTO_250 ) ) ( HOLDING ?AUTO_249 ) ( CLEAR ?AUTO_251 ) ( not ( = ?AUTO_248 ?AUTO_251 ) ) ( not ( = ?AUTO_249 ?AUTO_251 ) ) ( not ( = ?AUTO_250 ?AUTO_251 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_249 ?AUTO_251 )
      ( MAKE-ON ?AUTO_248 ?AUTO_249 )
      ( MAKE-ON-VERIFY ?AUTO_248 ?AUTO_249 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1437 - BLOCK
      ?AUTO_1438 - BLOCK
    )
    :vars
    (
      ?AUTO_1440 - BLOCK
      ?AUTO_1439 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1437 ?AUTO_1438 ) ) ( not ( = ?AUTO_1437 ?AUTO_1440 ) ) ( not ( = ?AUTO_1438 ?AUTO_1440 ) ) ( not ( = ?AUTO_1437 ?AUTO_1439 ) ) ( not ( = ?AUTO_1438 ?AUTO_1439 ) ) ( not ( = ?AUTO_1440 ?AUTO_1439 ) ) ( ON ?AUTO_1439 ?AUTO_1438 ) ( CLEAR ?AUTO_1439 ) ( HOLDING ?AUTO_1437 ) ( CLEAR ?AUTO_1440 ) )
    :subtasks
    ( ( !STACK ?AUTO_1437 ?AUTO_1440 )
      ( MAKE-ON ?AUTO_1437 ?AUTO_1438 )
      ( MAKE-ON-VERIFY ?AUTO_1437 ?AUTO_1438 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1266 - BLOCK
      ?AUTO_1267 - BLOCK
    )
    :vars
    (
      ?AUTO_1269 - BLOCK
      ?AUTO_1268 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1266 ?AUTO_1267 ) ) ( CLEAR ?AUTO_1269 ) ( not ( = ?AUTO_1266 ?AUTO_1268 ) ) ( not ( = ?AUTO_1266 ?AUTO_1269 ) ) ( not ( = ?AUTO_1267 ?AUTO_1268 ) ) ( not ( = ?AUTO_1267 ?AUTO_1269 ) ) ( not ( = ?AUTO_1268 ?AUTO_1269 ) ) ( ON ?AUTO_1268 ?AUTO_1267 ) ( ON ?AUTO_1266 ?AUTO_1268 ) ( CLEAR ?AUTO_1266 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1266 ?AUTO_1268 )
      ( MAKE-ON ?AUTO_1266 ?AUTO_1267 )
      ( MAKE-ON-VERIFY ?AUTO_1266 ?AUTO_1267 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1445 - BLOCK
      ?AUTO_1446 - BLOCK
    )
    :vars
    (
      ?AUTO_1447 - BLOCK
      ?AUTO_1448 - BLOCK
      ?AUTO_1449 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1445 ?AUTO_1446 ) ) ( not ( = ?AUTO_1445 ?AUTO_1447 ) ) ( not ( = ?AUTO_1446 ?AUTO_1447 ) ) ( not ( = ?AUTO_1445 ?AUTO_1448 ) ) ( not ( = ?AUTO_1446 ?AUTO_1448 ) ) ( not ( = ?AUTO_1447 ?AUTO_1448 ) ) ( ON ?AUTO_1448 ?AUTO_1446 ) ( CLEAR ?AUTO_1447 ) ( ON ?AUTO_1445 ?AUTO_1448 ) ( CLEAR ?AUTO_1445 ) ( HOLDING ?AUTO_1449 ) ( not ( = ?AUTO_1445 ?AUTO_1449 ) ) ( not ( = ?AUTO_1446 ?AUTO_1449 ) ) ( not ( = ?AUTO_1447 ?AUTO_1449 ) ) ( not ( = ?AUTO_1448 ?AUTO_1449 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1449 )
      ( MAKE-ON ?AUTO_1445 ?AUTO_1446 )
      ( MAKE-ON-VERIFY ?AUTO_1445 ?AUTO_1446 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_364 - BLOCK
      ?AUTO_365 - BLOCK
    )
    :vars
    (
      ?AUTO_366 - BLOCK
      ?AUTO_367 - BLOCK
      ?AUTO_368 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_364 ?AUTO_365 ) ) ( ON-TABLE ?AUTO_364 ) ( CLEAR ?AUTO_366 ) ( not ( = ?AUTO_364 ?AUTO_367 ) ) ( not ( = ?AUTO_364 ?AUTO_366 ) ) ( not ( = ?AUTO_365 ?AUTO_367 ) ) ( not ( = ?AUTO_365 ?AUTO_366 ) ) ( not ( = ?AUTO_367 ?AUTO_366 ) ) ( ON ?AUTO_367 ?AUTO_364 ) ( CLEAR ?AUTO_367 ) ( HOLDING ?AUTO_365 ) ( CLEAR ?AUTO_368 ) ( not ( = ?AUTO_364 ?AUTO_368 ) ) ( not ( = ?AUTO_365 ?AUTO_368 ) ) ( not ( = ?AUTO_366 ?AUTO_368 ) ) ( not ( = ?AUTO_367 ?AUTO_368 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_365 ?AUTO_368 )
      ( MAKE-ON ?AUTO_364 ?AUTO_365 )
      ( MAKE-ON-VERIFY ?AUTO_364 ?AUTO_365 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_388 - BLOCK
      ?AUTO_389 - BLOCK
    )
    :vars
    (
      ?AUTO_390 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_388 ?AUTO_389 ) ) ( ON ?AUTO_388 ?AUTO_390 ) ( CLEAR ?AUTO_388 ) ( not ( = ?AUTO_388 ?AUTO_390 ) ) ( not ( = ?AUTO_389 ?AUTO_390 ) ) ( HOLDING ?AUTO_389 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_389 )
      ( MAKE-ON ?AUTO_388 ?AUTO_389 )
      ( MAKE-ON-VERIFY ?AUTO_388 ?AUTO_389 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_391 - BLOCK
      ?AUTO_392 - BLOCK
    )
    :vars
    (
      ?AUTO_393 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_391 ?AUTO_392 ) ) ( ON ?AUTO_391 ?AUTO_393 ) ( not ( = ?AUTO_391 ?AUTO_393 ) ) ( not ( = ?AUTO_392 ?AUTO_393 ) ) ( ON ?AUTO_392 ?AUTO_391 ) ( CLEAR ?AUTO_392 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_392 ?AUTO_391 )
      ( MAKE-ON ?AUTO_391 ?AUTO_392 )
      ( MAKE-ON-VERIFY ?AUTO_391 ?AUTO_392 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_394 - BLOCK
      ?AUTO_395 - BLOCK
    )
    :vars
    (
      ?AUTO_396 - BLOCK
      ?AUTO_397 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_394 ?AUTO_395 ) ) ( ON ?AUTO_394 ?AUTO_396 ) ( not ( = ?AUTO_394 ?AUTO_396 ) ) ( not ( = ?AUTO_395 ?AUTO_396 ) ) ( ON ?AUTO_395 ?AUTO_394 ) ( CLEAR ?AUTO_395 ) ( HOLDING ?AUTO_397 ) ( not ( = ?AUTO_394 ?AUTO_397 ) ) ( not ( = ?AUTO_395 ?AUTO_397 ) ) ( not ( = ?AUTO_396 ?AUTO_397 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_397 )
      ( MAKE-ON ?AUTO_394 ?AUTO_395 )
      ( MAKE-ON-VERIFY ?AUTO_394 ?AUTO_395 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_416 - BLOCK
    )
    :vars
    (
      ?AUTO_419 - BLOCK
      ?AUTO_418 - BLOCK
      ?AUTO_417 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_416 ?AUTO_419 ) ( not ( = ?AUTO_416 ?AUTO_419 ) ) ( not ( = ?AUTO_416 ?AUTO_418 ) ) ( not ( = ?AUTO_416 ?AUTO_417 ) ) ( not ( = ?AUTO_419 ?AUTO_418 ) ) ( not ( = ?AUTO_419 ?AUTO_417 ) ) ( not ( = ?AUTO_418 ?AUTO_417 ) ) ( ON ?AUTO_418 ?AUTO_416 ) ( ON ?AUTO_417 ?AUTO_418 ) ( CLEAR ?AUTO_417 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_417 ?AUTO_418 )
      ( MAKE-ON-TABLE ?AUTO_416 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_416 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_420 - BLOCK
    )
    :vars
    (
      ?AUTO_421 - BLOCK
      ?AUTO_422 - BLOCK
      ?AUTO_423 - BLOCK
      ?AUTO_424 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_420 ?AUTO_421 ) ( not ( = ?AUTO_420 ?AUTO_421 ) ) ( not ( = ?AUTO_420 ?AUTO_422 ) ) ( not ( = ?AUTO_420 ?AUTO_423 ) ) ( not ( = ?AUTO_421 ?AUTO_422 ) ) ( not ( = ?AUTO_421 ?AUTO_423 ) ) ( not ( = ?AUTO_422 ?AUTO_423 ) ) ( ON ?AUTO_422 ?AUTO_420 ) ( ON ?AUTO_423 ?AUTO_422 ) ( CLEAR ?AUTO_423 ) ( HOLDING ?AUTO_424 ) ( not ( = ?AUTO_420 ?AUTO_424 ) ) ( not ( = ?AUTO_421 ?AUTO_424 ) ) ( not ( = ?AUTO_422 ?AUTO_424 ) ) ( not ( = ?AUTO_423 ?AUTO_424 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_424 )
      ( MAKE-ON-TABLE ?AUTO_420 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_420 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_481 - BLOCK
      ?AUTO_482 - BLOCK
    )
    :vars
    (
      ?AUTO_483 - BLOCK
      ?AUTO_485 - BLOCK
      ?AUTO_484 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_482 ) ( not ( = ?AUTO_481 ?AUTO_482 ) ) ( ON-TABLE ?AUTO_481 ) ( not ( = ?AUTO_481 ?AUTO_483 ) ) ( not ( = ?AUTO_482 ?AUTO_483 ) ) ( ON ?AUTO_483 ?AUTO_481 ) ( not ( = ?AUTO_481 ?AUTO_485 ) ) ( not ( = ?AUTO_481 ?AUTO_484 ) ) ( not ( = ?AUTO_482 ?AUTO_485 ) ) ( not ( = ?AUTO_482 ?AUTO_484 ) ) ( not ( = ?AUTO_483 ?AUTO_485 ) ) ( not ( = ?AUTO_483 ?AUTO_484 ) ) ( not ( = ?AUTO_485 ?AUTO_484 ) ) ( ON ?AUTO_485 ?AUTO_483 ) ( CLEAR ?AUTO_485 ) ( HOLDING ?AUTO_484 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_484 )
      ( MAKE-ON ?AUTO_481 ?AUTO_482 )
      ( MAKE-ON-VERIFY ?AUTO_481 ?AUTO_482 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_486 - BLOCK
      ?AUTO_487 - BLOCK
    )
    :vars
    (
      ?AUTO_490 - BLOCK
      ?AUTO_488 - BLOCK
      ?AUTO_489 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_487 ) ( not ( = ?AUTO_486 ?AUTO_487 ) ) ( ON-TABLE ?AUTO_486 ) ( not ( = ?AUTO_486 ?AUTO_490 ) ) ( not ( = ?AUTO_487 ?AUTO_490 ) ) ( ON ?AUTO_490 ?AUTO_486 ) ( not ( = ?AUTO_486 ?AUTO_488 ) ) ( not ( = ?AUTO_486 ?AUTO_489 ) ) ( not ( = ?AUTO_487 ?AUTO_488 ) ) ( not ( = ?AUTO_487 ?AUTO_489 ) ) ( not ( = ?AUTO_490 ?AUTO_488 ) ) ( not ( = ?AUTO_490 ?AUTO_489 ) ) ( not ( = ?AUTO_488 ?AUTO_489 ) ) ( ON ?AUTO_488 ?AUTO_490 ) ( ON ?AUTO_489 ?AUTO_488 ) ( CLEAR ?AUTO_489 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_489 ?AUTO_488 )
      ( MAKE-ON ?AUTO_486 ?AUTO_487 )
      ( MAKE-ON-VERIFY ?AUTO_486 ?AUTO_487 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_491 - BLOCK
      ?AUTO_492 - BLOCK
    )
    :vars
    (
      ?AUTO_495 - BLOCK
      ?AUTO_494 - BLOCK
      ?AUTO_493 - BLOCK
      ?AUTO_496 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_492 ) ( not ( = ?AUTO_491 ?AUTO_492 ) ) ( ON-TABLE ?AUTO_491 ) ( not ( = ?AUTO_491 ?AUTO_495 ) ) ( not ( = ?AUTO_492 ?AUTO_495 ) ) ( ON ?AUTO_495 ?AUTO_491 ) ( not ( = ?AUTO_491 ?AUTO_494 ) ) ( not ( = ?AUTO_491 ?AUTO_493 ) ) ( not ( = ?AUTO_492 ?AUTO_494 ) ) ( not ( = ?AUTO_492 ?AUTO_493 ) ) ( not ( = ?AUTO_495 ?AUTO_494 ) ) ( not ( = ?AUTO_495 ?AUTO_493 ) ) ( not ( = ?AUTO_494 ?AUTO_493 ) ) ( ON ?AUTO_494 ?AUTO_495 ) ( ON ?AUTO_493 ?AUTO_494 ) ( CLEAR ?AUTO_493 ) ( HOLDING ?AUTO_496 ) ( not ( = ?AUTO_491 ?AUTO_496 ) ) ( not ( = ?AUTO_492 ?AUTO_496 ) ) ( not ( = ?AUTO_495 ?AUTO_496 ) ) ( not ( = ?AUTO_494 ?AUTO_496 ) ) ( not ( = ?AUTO_493 ?AUTO_496 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_496 )
      ( MAKE-ON ?AUTO_491 ?AUTO_492 )
      ( MAKE-ON-VERIFY ?AUTO_491 ?AUTO_492 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_497 - BLOCK
      ?AUTO_498 - BLOCK
    )
    :vars
    (
      ?AUTO_502 - BLOCK
      ?AUTO_499 - BLOCK
      ?AUTO_500 - BLOCK
      ?AUTO_501 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_497 ?AUTO_498 ) ) ( ON-TABLE ?AUTO_497 ) ( not ( = ?AUTO_497 ?AUTO_502 ) ) ( not ( = ?AUTO_498 ?AUTO_502 ) ) ( ON ?AUTO_502 ?AUTO_497 ) ( not ( = ?AUTO_497 ?AUTO_499 ) ) ( not ( = ?AUTO_497 ?AUTO_500 ) ) ( not ( = ?AUTO_498 ?AUTO_499 ) ) ( not ( = ?AUTO_498 ?AUTO_500 ) ) ( not ( = ?AUTO_502 ?AUTO_499 ) ) ( not ( = ?AUTO_502 ?AUTO_500 ) ) ( not ( = ?AUTO_499 ?AUTO_500 ) ) ( ON ?AUTO_499 ?AUTO_502 ) ( ON ?AUTO_500 ?AUTO_499 ) ( CLEAR ?AUTO_500 ) ( not ( = ?AUTO_497 ?AUTO_501 ) ) ( not ( = ?AUTO_498 ?AUTO_501 ) ) ( not ( = ?AUTO_502 ?AUTO_501 ) ) ( not ( = ?AUTO_499 ?AUTO_501 ) ) ( not ( = ?AUTO_500 ?AUTO_501 ) ) ( ON ?AUTO_501 ?AUTO_498 ) ( CLEAR ?AUTO_501 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_501 ?AUTO_498 )
      ( MAKE-ON ?AUTO_497 ?AUTO_498 )
      ( MAKE-ON-VERIFY ?AUTO_497 ?AUTO_498 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_558 - BLOCK
    )
    :vars
    (
      ?AUTO_560 - BLOCK
      ?AUTO_561 - BLOCK
      ?AUTO_559 - BLOCK
      ?AUTO_562 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_558 ?AUTO_560 ) ( not ( = ?AUTO_558 ?AUTO_560 ) ) ( not ( = ?AUTO_558 ?AUTO_561 ) ) ( not ( = ?AUTO_560 ?AUTO_561 ) ) ( ON ?AUTO_561 ?AUTO_558 ) ( not ( = ?AUTO_558 ?AUTO_559 ) ) ( not ( = ?AUTO_560 ?AUTO_559 ) ) ( not ( = ?AUTO_561 ?AUTO_559 ) ) ( ON ?AUTO_559 ?AUTO_561 ) ( not ( = ?AUTO_558 ?AUTO_562 ) ) ( not ( = ?AUTO_560 ?AUTO_562 ) ) ( not ( = ?AUTO_561 ?AUTO_562 ) ) ( not ( = ?AUTO_559 ?AUTO_562 ) ) ( ON ?AUTO_562 ?AUTO_559 ) ( CLEAR ?AUTO_562 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_562 ?AUTO_559 )
      ( MAKE-ON-TABLE ?AUTO_558 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_558 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_569 - BLOCK
      ?AUTO_570 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_569 ?AUTO_570 ) ) ( ON-TABLE ?AUTO_569 ) ( CLEAR ?AUTO_569 ) ( HOLDING ?AUTO_570 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_570 )
      ( MAKE-ON ?AUTO_569 ?AUTO_570 )
      ( MAKE-ON-VERIFY ?AUTO_569 ?AUTO_570 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_571 - BLOCK
      ?AUTO_572 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_571 ?AUTO_572 ) ) ( ON-TABLE ?AUTO_571 ) ( ON ?AUTO_572 ?AUTO_571 ) ( CLEAR ?AUTO_572 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_572 ?AUTO_571 )
      ( MAKE-ON ?AUTO_571 ?AUTO_572 )
      ( MAKE-ON-VERIFY ?AUTO_571 ?AUTO_572 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_573 - BLOCK
      ?AUTO_574 - BLOCK
    )
    :vars
    (
      ?AUTO_575 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_573 ?AUTO_574 ) ) ( ON-TABLE ?AUTO_573 ) ( ON ?AUTO_574 ?AUTO_573 ) ( CLEAR ?AUTO_574 ) ( HOLDING ?AUTO_575 ) ( not ( = ?AUTO_573 ?AUTO_575 ) ) ( not ( = ?AUTO_574 ?AUTO_575 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_575 )
      ( MAKE-ON ?AUTO_573 ?AUTO_574 )
      ( MAKE-ON-VERIFY ?AUTO_573 ?AUTO_574 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_576 - BLOCK
      ?AUTO_577 - BLOCK
    )
    :vars
    (
      ?AUTO_578 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_576 ?AUTO_577 ) ) ( ON-TABLE ?AUTO_576 ) ( ON ?AUTO_577 ?AUTO_576 ) ( not ( = ?AUTO_576 ?AUTO_578 ) ) ( not ( = ?AUTO_577 ?AUTO_578 ) ) ( ON ?AUTO_578 ?AUTO_577 ) ( CLEAR ?AUTO_578 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_578 ?AUTO_577 )
      ( MAKE-ON ?AUTO_576 ?AUTO_577 )
      ( MAKE-ON-VERIFY ?AUTO_576 ?AUTO_577 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_579 - BLOCK
      ?AUTO_580 - BLOCK
    )
    :vars
    (
      ?AUTO_581 - BLOCK
      ?AUTO_582 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_579 ?AUTO_580 ) ) ( ON-TABLE ?AUTO_579 ) ( ON ?AUTO_580 ?AUTO_579 ) ( not ( = ?AUTO_579 ?AUTO_581 ) ) ( not ( = ?AUTO_580 ?AUTO_581 ) ) ( ON ?AUTO_581 ?AUTO_580 ) ( CLEAR ?AUTO_581 ) ( HOLDING ?AUTO_582 ) ( not ( = ?AUTO_579 ?AUTO_582 ) ) ( not ( = ?AUTO_580 ?AUTO_582 ) ) ( not ( = ?AUTO_581 ?AUTO_582 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_582 )
      ( MAKE-ON ?AUTO_579 ?AUTO_580 )
      ( MAKE-ON-VERIFY ?AUTO_579 ?AUTO_580 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_583 - BLOCK
      ?AUTO_584 - BLOCK
    )
    :vars
    (
      ?AUTO_585 - BLOCK
      ?AUTO_586 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_583 ?AUTO_584 ) ) ( ON-TABLE ?AUTO_583 ) ( ON ?AUTO_584 ?AUTO_583 ) ( not ( = ?AUTO_583 ?AUTO_585 ) ) ( not ( = ?AUTO_584 ?AUTO_585 ) ) ( ON ?AUTO_585 ?AUTO_584 ) ( not ( = ?AUTO_583 ?AUTO_586 ) ) ( not ( = ?AUTO_584 ?AUTO_586 ) ) ( not ( = ?AUTO_585 ?AUTO_586 ) ) ( ON ?AUTO_586 ?AUTO_585 ) ( CLEAR ?AUTO_586 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_586 ?AUTO_585 )
      ( MAKE-ON ?AUTO_583 ?AUTO_584 )
      ( MAKE-ON-VERIFY ?AUTO_583 ?AUTO_584 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_587 - BLOCK
      ?AUTO_588 - BLOCK
    )
    :vars
    (
      ?AUTO_590 - BLOCK
      ?AUTO_589 - BLOCK
      ?AUTO_591 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_587 ?AUTO_588 ) ) ( ON-TABLE ?AUTO_587 ) ( ON ?AUTO_588 ?AUTO_587 ) ( not ( = ?AUTO_587 ?AUTO_590 ) ) ( not ( = ?AUTO_588 ?AUTO_590 ) ) ( ON ?AUTO_590 ?AUTO_588 ) ( not ( = ?AUTO_587 ?AUTO_589 ) ) ( not ( = ?AUTO_588 ?AUTO_589 ) ) ( not ( = ?AUTO_590 ?AUTO_589 ) ) ( ON ?AUTO_589 ?AUTO_590 ) ( CLEAR ?AUTO_589 ) ( HOLDING ?AUTO_591 ) ( not ( = ?AUTO_587 ?AUTO_591 ) ) ( not ( = ?AUTO_588 ?AUTO_591 ) ) ( not ( = ?AUTO_590 ?AUTO_591 ) ) ( not ( = ?AUTO_589 ?AUTO_591 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_591 )
      ( MAKE-ON ?AUTO_587 ?AUTO_588 )
      ( MAKE-ON-VERIFY ?AUTO_587 ?AUTO_588 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_592 - BLOCK
      ?AUTO_593 - BLOCK
    )
    :vars
    (
      ?AUTO_595 - BLOCK
      ?AUTO_594 - BLOCK
      ?AUTO_596 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_592 ?AUTO_593 ) ) ( ON-TABLE ?AUTO_592 ) ( ON ?AUTO_593 ?AUTO_592 ) ( not ( = ?AUTO_592 ?AUTO_595 ) ) ( not ( = ?AUTO_593 ?AUTO_595 ) ) ( ON ?AUTO_595 ?AUTO_593 ) ( not ( = ?AUTO_592 ?AUTO_594 ) ) ( not ( = ?AUTO_593 ?AUTO_594 ) ) ( not ( = ?AUTO_595 ?AUTO_594 ) ) ( ON ?AUTO_594 ?AUTO_595 ) ( not ( = ?AUTO_592 ?AUTO_596 ) ) ( not ( = ?AUTO_593 ?AUTO_596 ) ) ( not ( = ?AUTO_595 ?AUTO_596 ) ) ( not ( = ?AUTO_594 ?AUTO_596 ) ) ( ON ?AUTO_596 ?AUTO_594 ) ( CLEAR ?AUTO_596 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_596 ?AUTO_594 )
      ( MAKE-ON ?AUTO_592 ?AUTO_593 )
      ( MAKE-ON-VERIFY ?AUTO_592 ?AUTO_593 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_636 - BLOCK
      ?AUTO_637 - BLOCK
    )
    :vars
    (
      ?AUTO_639 - BLOCK
      ?AUTO_638 - BLOCK
      ?AUTO_640 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_637 ) ( not ( = ?AUTO_636 ?AUTO_637 ) ) ( ON ?AUTO_636 ?AUTO_639 ) ( not ( = ?AUTO_636 ?AUTO_639 ) ) ( not ( = ?AUTO_637 ?AUTO_639 ) ) ( not ( = ?AUTO_636 ?AUTO_638 ) ) ( not ( = ?AUTO_637 ?AUTO_638 ) ) ( not ( = ?AUTO_639 ?AUTO_638 ) ) ( ON ?AUTO_638 ?AUTO_636 ) ( CLEAR ?AUTO_638 ) ( HOLDING ?AUTO_640 ) ( not ( = ?AUTO_636 ?AUTO_640 ) ) ( not ( = ?AUTO_637 ?AUTO_640 ) ) ( not ( = ?AUTO_639 ?AUTO_640 ) ) ( not ( = ?AUTO_638 ?AUTO_640 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_640 )
      ( MAKE-ON ?AUTO_636 ?AUTO_637 )
      ( MAKE-ON-VERIFY ?AUTO_636 ?AUTO_637 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_759 - BLOCK
      ?AUTO_760 - BLOCK
    )
    :vars
    (
      ?AUTO_761 - BLOCK
      ?AUTO_763 - BLOCK
      ?AUTO_762 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_759 ?AUTO_760 ) ) ( ON ?AUTO_759 ?AUTO_761 ) ( CLEAR ?AUTO_759 ) ( not ( = ?AUTO_759 ?AUTO_761 ) ) ( not ( = ?AUTO_760 ?AUTO_761 ) ) ( not ( = ?AUTO_759 ?AUTO_763 ) ) ( not ( = ?AUTO_759 ?AUTO_762 ) ) ( not ( = ?AUTO_760 ?AUTO_763 ) ) ( not ( = ?AUTO_760 ?AUTO_762 ) ) ( not ( = ?AUTO_761 ?AUTO_763 ) ) ( not ( = ?AUTO_761 ?AUTO_762 ) ) ( not ( = ?AUTO_763 ?AUTO_762 ) ) ( ON ?AUTO_763 ?AUTO_760 ) ( CLEAR ?AUTO_763 ) ( HOLDING ?AUTO_762 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_762 )
      ( MAKE-ON ?AUTO_759 ?AUTO_760 )
      ( MAKE-ON-VERIFY ?AUTO_759 ?AUTO_760 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2688 - BLOCK
      ?AUTO_2689 - BLOCK
    )
    :vars
    (
      ?AUTO_2690 - BLOCK
      ?AUTO_2691 - BLOCK
      ?AUTO_2692 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2688 ?AUTO_2689 ) ) ( ON ?AUTO_2688 ?AUTO_2690 ) ( CLEAR ?AUTO_2688 ) ( not ( = ?AUTO_2688 ?AUTO_2690 ) ) ( not ( = ?AUTO_2689 ?AUTO_2690 ) ) ( not ( = ?AUTO_2688 ?AUTO_2691 ) ) ( not ( = ?AUTO_2689 ?AUTO_2691 ) ) ( not ( = ?AUTO_2690 ?AUTO_2691 ) ) ( ON ?AUTO_2691 ?AUTO_2689 ) ( not ( = ?AUTO_2688 ?AUTO_2692 ) ) ( not ( = ?AUTO_2689 ?AUTO_2692 ) ) ( not ( = ?AUTO_2690 ?AUTO_2692 ) ) ( not ( = ?AUTO_2691 ?AUTO_2692 ) ) ( ON ?AUTO_2692 ?AUTO_2691 ) ( CLEAR ?AUTO_2692 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2692 ?AUTO_2691 )
      ( MAKE-ON ?AUTO_2688 ?AUTO_2689 )
      ( MAKE-ON-VERIFY ?AUTO_2688 ?AUTO_2689 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3238 - BLOCK
      ?AUTO_3239 - BLOCK
    )
    :vars
    (
      ?AUTO_3240 - BLOCK
      ?AUTO_3242 - BLOCK
      ?AUTO_3241 - BLOCK
      ?AUTO_3243 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3238 ?AUTO_3239 ) ) ( ON ?AUTO_3238 ?AUTO_3240 ) ( CLEAR ?AUTO_3238 ) ( not ( = ?AUTO_3238 ?AUTO_3240 ) ) ( not ( = ?AUTO_3239 ?AUTO_3240 ) ) ( not ( = ?AUTO_3238 ?AUTO_3242 ) ) ( not ( = ?AUTO_3238 ?AUTO_3241 ) ) ( not ( = ?AUTO_3239 ?AUTO_3242 ) ) ( not ( = ?AUTO_3239 ?AUTO_3241 ) ) ( not ( = ?AUTO_3240 ?AUTO_3242 ) ) ( not ( = ?AUTO_3240 ?AUTO_3241 ) ) ( not ( = ?AUTO_3242 ?AUTO_3241 ) ) ( ON ?AUTO_3242 ?AUTO_3239 ) ( not ( = ?AUTO_3238 ?AUTO_3243 ) ) ( not ( = ?AUTO_3239 ?AUTO_3243 ) ) ( not ( = ?AUTO_3240 ?AUTO_3243 ) ) ( not ( = ?AUTO_3241 ?AUTO_3243 ) ) ( not ( = ?AUTO_3242 ?AUTO_3243 ) ) ( ON ?AUTO_3243 ?AUTO_3242 ) ( CLEAR ?AUTO_3243 ) ( HOLDING ?AUTO_3241 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3241 )
      ( MAKE-ON ?AUTO_3238 ?AUTO_3239 )
      ( MAKE-ON-VERIFY ?AUTO_3238 ?AUTO_3239 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_719 - BLOCK
      ?AUTO_720 - BLOCK
    )
    :vars
    (
      ?AUTO_723 - BLOCK
      ?AUTO_722 - BLOCK
      ?AUTO_721 - BLOCK
      ?AUTO_725 - BLOCK
      ?AUTO_724 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_719 ?AUTO_720 ) ) ( ON ?AUTO_719 ?AUTO_723 ) ( not ( = ?AUTO_719 ?AUTO_723 ) ) ( not ( = ?AUTO_720 ?AUTO_723 ) ) ( CLEAR ?AUTO_722 ) ( not ( = ?AUTO_719 ?AUTO_721 ) ) ( not ( = ?AUTO_719 ?AUTO_722 ) ) ( not ( = ?AUTO_720 ?AUTO_721 ) ) ( not ( = ?AUTO_720 ?AUTO_722 ) ) ( not ( = ?AUTO_723 ?AUTO_721 ) ) ( not ( = ?AUTO_723 ?AUTO_722 ) ) ( not ( = ?AUTO_721 ?AUTO_722 ) ) ( ON ?AUTO_721 ?AUTO_720 ) ( not ( = ?AUTO_719 ?AUTO_725 ) ) ( not ( = ?AUTO_720 ?AUTO_725 ) ) ( not ( = ?AUTO_723 ?AUTO_725 ) ) ( not ( = ?AUTO_722 ?AUTO_725 ) ) ( not ( = ?AUTO_721 ?AUTO_725 ) ) ( ON ?AUTO_725 ?AUTO_721 ) ( CLEAR ?AUTO_725 ) ( not ( = ?AUTO_719 ?AUTO_724 ) ) ( not ( = ?AUTO_720 ?AUTO_724 ) ) ( not ( = ?AUTO_723 ?AUTO_724 ) ) ( not ( = ?AUTO_722 ?AUTO_724 ) ) ( not ( = ?AUTO_721 ?AUTO_724 ) ) ( not ( = ?AUTO_725 ?AUTO_724 ) ) ( ON ?AUTO_724 ?AUTO_719 ) ( CLEAR ?AUTO_724 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_724 ?AUTO_719 )
      ( MAKE-ON ?AUTO_719 ?AUTO_720 )
      ( MAKE-ON-VERIFY ?AUTO_719 ?AUTO_720 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_726 - BLOCK
      ?AUTO_727 - BLOCK
    )
    :vars
    (
      ?AUTO_730 - BLOCK
      ?AUTO_728 - BLOCK
      ?AUTO_729 - BLOCK
      ?AUTO_732 - BLOCK
      ?AUTO_731 - BLOCK
      ?AUTO_733 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_726 ?AUTO_727 ) ) ( ON ?AUTO_726 ?AUTO_730 ) ( not ( = ?AUTO_726 ?AUTO_730 ) ) ( not ( = ?AUTO_727 ?AUTO_730 ) ) ( CLEAR ?AUTO_728 ) ( not ( = ?AUTO_726 ?AUTO_729 ) ) ( not ( = ?AUTO_726 ?AUTO_728 ) ) ( not ( = ?AUTO_727 ?AUTO_729 ) ) ( not ( = ?AUTO_727 ?AUTO_728 ) ) ( not ( = ?AUTO_730 ?AUTO_729 ) ) ( not ( = ?AUTO_730 ?AUTO_728 ) ) ( not ( = ?AUTO_729 ?AUTO_728 ) ) ( ON ?AUTO_729 ?AUTO_727 ) ( not ( = ?AUTO_726 ?AUTO_732 ) ) ( not ( = ?AUTO_727 ?AUTO_732 ) ) ( not ( = ?AUTO_730 ?AUTO_732 ) ) ( not ( = ?AUTO_728 ?AUTO_732 ) ) ( not ( = ?AUTO_729 ?AUTO_732 ) ) ( ON ?AUTO_732 ?AUTO_729 ) ( CLEAR ?AUTO_732 ) ( not ( = ?AUTO_726 ?AUTO_731 ) ) ( not ( = ?AUTO_727 ?AUTO_731 ) ) ( not ( = ?AUTO_730 ?AUTO_731 ) ) ( not ( = ?AUTO_728 ?AUTO_731 ) ) ( not ( = ?AUTO_729 ?AUTO_731 ) ) ( not ( = ?AUTO_732 ?AUTO_731 ) ) ( ON ?AUTO_731 ?AUTO_726 ) ( CLEAR ?AUTO_731 ) ( HOLDING ?AUTO_733 ) ( not ( = ?AUTO_726 ?AUTO_733 ) ) ( not ( = ?AUTO_727 ?AUTO_733 ) ) ( not ( = ?AUTO_730 ?AUTO_733 ) ) ( not ( = ?AUTO_728 ?AUTO_733 ) ) ( not ( = ?AUTO_729 ?AUTO_733 ) ) ( not ( = ?AUTO_732 ?AUTO_733 ) ) ( not ( = ?AUTO_731 ?AUTO_733 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_733 )
      ( MAKE-ON ?AUTO_726 ?AUTO_727 )
      ( MAKE-ON-VERIFY ?AUTO_726 ?AUTO_727 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_734 - BLOCK
      ?AUTO_735 - BLOCK
    )
    :vars
    (
      ?AUTO_740 - BLOCK
      ?AUTO_738 - BLOCK
      ?AUTO_739 - BLOCK
      ?AUTO_736 - BLOCK
      ?AUTO_737 - BLOCK
      ?AUTO_741 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_734 ?AUTO_735 ) ) ( ON ?AUTO_734 ?AUTO_740 ) ( not ( = ?AUTO_734 ?AUTO_740 ) ) ( not ( = ?AUTO_735 ?AUTO_740 ) ) ( CLEAR ?AUTO_738 ) ( not ( = ?AUTO_734 ?AUTO_739 ) ) ( not ( = ?AUTO_734 ?AUTO_738 ) ) ( not ( = ?AUTO_735 ?AUTO_739 ) ) ( not ( = ?AUTO_735 ?AUTO_738 ) ) ( not ( = ?AUTO_740 ?AUTO_739 ) ) ( not ( = ?AUTO_740 ?AUTO_738 ) ) ( not ( = ?AUTO_739 ?AUTO_738 ) ) ( ON ?AUTO_739 ?AUTO_735 ) ( not ( = ?AUTO_734 ?AUTO_736 ) ) ( not ( = ?AUTO_735 ?AUTO_736 ) ) ( not ( = ?AUTO_740 ?AUTO_736 ) ) ( not ( = ?AUTO_738 ?AUTO_736 ) ) ( not ( = ?AUTO_739 ?AUTO_736 ) ) ( ON ?AUTO_736 ?AUTO_739 ) ( CLEAR ?AUTO_736 ) ( not ( = ?AUTO_734 ?AUTO_737 ) ) ( not ( = ?AUTO_735 ?AUTO_737 ) ) ( not ( = ?AUTO_740 ?AUTO_737 ) ) ( not ( = ?AUTO_738 ?AUTO_737 ) ) ( not ( = ?AUTO_739 ?AUTO_737 ) ) ( not ( = ?AUTO_736 ?AUTO_737 ) ) ( ON ?AUTO_737 ?AUTO_734 ) ( not ( = ?AUTO_734 ?AUTO_741 ) ) ( not ( = ?AUTO_735 ?AUTO_741 ) ) ( not ( = ?AUTO_740 ?AUTO_741 ) ) ( not ( = ?AUTO_738 ?AUTO_741 ) ) ( not ( = ?AUTO_739 ?AUTO_741 ) ) ( not ( = ?AUTO_736 ?AUTO_741 ) ) ( not ( = ?AUTO_737 ?AUTO_741 ) ) ( ON ?AUTO_741 ?AUTO_737 ) ( CLEAR ?AUTO_741 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_741 ?AUTO_737 )
      ( MAKE-ON ?AUTO_734 ?AUTO_735 )
      ( MAKE-ON-VERIFY ?AUTO_734 ?AUTO_735 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_764 - BLOCK
      ?AUTO_765 - BLOCK
    )
    :vars
    (
      ?AUTO_766 - BLOCK
      ?AUTO_767 - BLOCK
      ?AUTO_768 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_764 ?AUTO_765 ) ) ( ON ?AUTO_764 ?AUTO_766 ) ( not ( = ?AUTO_764 ?AUTO_766 ) ) ( not ( = ?AUTO_765 ?AUTO_766 ) ) ( not ( = ?AUTO_764 ?AUTO_767 ) ) ( not ( = ?AUTO_764 ?AUTO_768 ) ) ( not ( = ?AUTO_765 ?AUTO_767 ) ) ( not ( = ?AUTO_765 ?AUTO_768 ) ) ( not ( = ?AUTO_766 ?AUTO_767 ) ) ( not ( = ?AUTO_766 ?AUTO_768 ) ) ( not ( = ?AUTO_767 ?AUTO_768 ) ) ( ON ?AUTO_767 ?AUTO_765 ) ( CLEAR ?AUTO_767 ) ( ON ?AUTO_768 ?AUTO_764 ) ( CLEAR ?AUTO_768 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_768 ?AUTO_764 )
      ( MAKE-ON ?AUTO_764 ?AUTO_765 )
      ( MAKE-ON-VERIFY ?AUTO_764 ?AUTO_765 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_769 - BLOCK
      ?AUTO_770 - BLOCK
    )
    :vars
    (
      ?AUTO_773 - BLOCK
      ?AUTO_772 - BLOCK
      ?AUTO_771 - BLOCK
      ?AUTO_774 - BLOCK
      ?AUTO_775 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_769 ?AUTO_770 ) ) ( ON ?AUTO_769 ?AUTO_773 ) ( not ( = ?AUTO_769 ?AUTO_773 ) ) ( not ( = ?AUTO_770 ?AUTO_773 ) ) ( not ( = ?AUTO_769 ?AUTO_772 ) ) ( not ( = ?AUTO_769 ?AUTO_771 ) ) ( not ( = ?AUTO_770 ?AUTO_772 ) ) ( not ( = ?AUTO_770 ?AUTO_771 ) ) ( not ( = ?AUTO_773 ?AUTO_772 ) ) ( not ( = ?AUTO_773 ?AUTO_771 ) ) ( not ( = ?AUTO_772 ?AUTO_771 ) ) ( ON ?AUTO_772 ?AUTO_770 ) ( CLEAR ?AUTO_772 ) ( ON ?AUTO_771 ?AUTO_769 ) ( CLEAR ?AUTO_771 ) ( HOLDING ?AUTO_774 ) ( CLEAR ?AUTO_775 ) ( not ( = ?AUTO_769 ?AUTO_774 ) ) ( not ( = ?AUTO_769 ?AUTO_775 ) ) ( not ( = ?AUTO_770 ?AUTO_774 ) ) ( not ( = ?AUTO_770 ?AUTO_775 ) ) ( not ( = ?AUTO_773 ?AUTO_774 ) ) ( not ( = ?AUTO_773 ?AUTO_775 ) ) ( not ( = ?AUTO_772 ?AUTO_774 ) ) ( not ( = ?AUTO_772 ?AUTO_775 ) ) ( not ( = ?AUTO_771 ?AUTO_774 ) ) ( not ( = ?AUTO_771 ?AUTO_775 ) ) ( not ( = ?AUTO_774 ?AUTO_775 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_774 ?AUTO_775 )
      ( MAKE-ON ?AUTO_769 ?AUTO_770 )
      ( MAKE-ON-VERIFY ?AUTO_769 ?AUTO_770 ) )
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
      ?AUTO_4129 - BLOCK
      ?AUTO_4128 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4124 ?AUTO_4125 ) ) ( ON ?AUTO_4124 ?AUTO_4126 ) ( not ( = ?AUTO_4124 ?AUTO_4126 ) ) ( not ( = ?AUTO_4125 ?AUTO_4126 ) ) ( not ( = ?AUTO_4124 ?AUTO_4127 ) ) ( not ( = ?AUTO_4125 ?AUTO_4127 ) ) ( not ( = ?AUTO_4126 ?AUTO_4127 ) ) ( ON ?AUTO_4127 ?AUTO_4124 ) ( not ( = ?AUTO_4124 ?AUTO_4129 ) ) ( not ( = ?AUTO_4124 ?AUTO_4128 ) ) ( not ( = ?AUTO_4125 ?AUTO_4129 ) ) ( not ( = ?AUTO_4125 ?AUTO_4128 ) ) ( not ( = ?AUTO_4126 ?AUTO_4129 ) ) ( not ( = ?AUTO_4126 ?AUTO_4128 ) ) ( not ( = ?AUTO_4127 ?AUTO_4129 ) ) ( not ( = ?AUTO_4127 ?AUTO_4128 ) ) ( not ( = ?AUTO_4129 ?AUTO_4128 ) ) ( ON ?AUTO_4129 ?AUTO_4125 ) ( CLEAR ?AUTO_4129 ) ( ON ?AUTO_4128 ?AUTO_4127 ) ( CLEAR ?AUTO_4128 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4128 ?AUTO_4127 )
      ( MAKE-ON ?AUTO_4124 ?AUTO_4125 )
      ( MAKE-ON-VERIFY ?AUTO_4124 ?AUTO_4125 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1175 - BLOCK
      ?AUTO_1176 - BLOCK
    )
    :vars
    (
      ?AUTO_1179 - BLOCK
      ?AUTO_1180 - BLOCK
      ?AUTO_1177 - BLOCK
      ?AUTO_1181 - BLOCK
      ?AUTO_1178 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1175 ?AUTO_1176 ) ) ( ON ?AUTO_1175 ?AUTO_1179 ) ( not ( = ?AUTO_1175 ?AUTO_1179 ) ) ( not ( = ?AUTO_1176 ?AUTO_1179 ) ) ( not ( = ?AUTO_1175 ?AUTO_1180 ) ) ( not ( = ?AUTO_1176 ?AUTO_1180 ) ) ( not ( = ?AUTO_1179 ?AUTO_1180 ) ) ( ON ?AUTO_1180 ?AUTO_1175 ) ( not ( = ?AUTO_1175 ?AUTO_1177 ) ) ( not ( = ?AUTO_1175 ?AUTO_1181 ) ) ( not ( = ?AUTO_1176 ?AUTO_1177 ) ) ( not ( = ?AUTO_1176 ?AUTO_1181 ) ) ( not ( = ?AUTO_1179 ?AUTO_1177 ) ) ( not ( = ?AUTO_1179 ?AUTO_1181 ) ) ( not ( = ?AUTO_1180 ?AUTO_1177 ) ) ( not ( = ?AUTO_1180 ?AUTO_1181 ) ) ( not ( = ?AUTO_1177 ?AUTO_1181 ) ) ( ON ?AUTO_1177 ?AUTO_1176 ) ( CLEAR ?AUTO_1177 ) ( not ( = ?AUTO_1175 ?AUTO_1178 ) ) ( not ( = ?AUTO_1176 ?AUTO_1178 ) ) ( not ( = ?AUTO_1179 ?AUTO_1178 ) ) ( not ( = ?AUTO_1180 ?AUTO_1178 ) ) ( not ( = ?AUTO_1177 ?AUTO_1178 ) ) ( not ( = ?AUTO_1181 ?AUTO_1178 ) ) ( ON ?AUTO_1181 ?AUTO_1180 ) ( CLEAR ?AUTO_1181 ) ( HOLDING ?AUTO_1178 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1178 )
      ( MAKE-ON ?AUTO_1175 ?AUTO_1176 )
      ( MAKE-ON-VERIFY ?AUTO_1175 ?AUTO_1176 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1182 - BLOCK
      ?AUTO_1183 - BLOCK
    )
    :vars
    (
      ?AUTO_1185 - BLOCK
      ?AUTO_1187 - BLOCK
      ?AUTO_1186 - BLOCK
      ?AUTO_1184 - BLOCK
      ?AUTO_1188 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1182 ?AUTO_1183 ) ) ( ON ?AUTO_1182 ?AUTO_1185 ) ( not ( = ?AUTO_1182 ?AUTO_1185 ) ) ( not ( = ?AUTO_1183 ?AUTO_1185 ) ) ( not ( = ?AUTO_1182 ?AUTO_1187 ) ) ( not ( = ?AUTO_1183 ?AUTO_1187 ) ) ( not ( = ?AUTO_1185 ?AUTO_1187 ) ) ( ON ?AUTO_1187 ?AUTO_1182 ) ( not ( = ?AUTO_1182 ?AUTO_1186 ) ) ( not ( = ?AUTO_1182 ?AUTO_1184 ) ) ( not ( = ?AUTO_1183 ?AUTO_1186 ) ) ( not ( = ?AUTO_1183 ?AUTO_1184 ) ) ( not ( = ?AUTO_1185 ?AUTO_1186 ) ) ( not ( = ?AUTO_1185 ?AUTO_1184 ) ) ( not ( = ?AUTO_1187 ?AUTO_1186 ) ) ( not ( = ?AUTO_1187 ?AUTO_1184 ) ) ( not ( = ?AUTO_1186 ?AUTO_1184 ) ) ( ON ?AUTO_1186 ?AUTO_1183 ) ( CLEAR ?AUTO_1186 ) ( not ( = ?AUTO_1182 ?AUTO_1188 ) ) ( not ( = ?AUTO_1183 ?AUTO_1188 ) ) ( not ( = ?AUTO_1185 ?AUTO_1188 ) ) ( not ( = ?AUTO_1187 ?AUTO_1188 ) ) ( not ( = ?AUTO_1186 ?AUTO_1188 ) ) ( not ( = ?AUTO_1184 ?AUTO_1188 ) ) ( ON ?AUTO_1184 ?AUTO_1187 ) ( ON ?AUTO_1188 ?AUTO_1184 ) ( CLEAR ?AUTO_1188 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1188 ?AUTO_1184 )
      ( MAKE-ON ?AUTO_1182 ?AUTO_1183 )
      ( MAKE-ON-VERIFY ?AUTO_1182 ?AUTO_1183 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_799 - BLOCK
      ?AUTO_800 - BLOCK
    )
    :vars
    (
      ?AUTO_802 - BLOCK
      ?AUTO_804 - BLOCK
      ?AUTO_805 - BLOCK
      ?AUTO_801 - BLOCK
      ?AUTO_806 - BLOCK
      ?AUTO_803 - BLOCK
      ?AUTO_807 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_799 ?AUTO_800 ) ) ( ON ?AUTO_799 ?AUTO_802 ) ( not ( = ?AUTO_799 ?AUTO_802 ) ) ( not ( = ?AUTO_800 ?AUTO_802 ) ) ( not ( = ?AUTO_799 ?AUTO_804 ) ) ( not ( = ?AUTO_799 ?AUTO_805 ) ) ( not ( = ?AUTO_800 ?AUTO_804 ) ) ( not ( = ?AUTO_800 ?AUTO_805 ) ) ( not ( = ?AUTO_802 ?AUTO_804 ) ) ( not ( = ?AUTO_802 ?AUTO_805 ) ) ( not ( = ?AUTO_804 ?AUTO_805 ) ) ( ON ?AUTO_804 ?AUTO_800 ) ( CLEAR ?AUTO_804 ) ( ON ?AUTO_805 ?AUTO_799 ) ( CLEAR ?AUTO_801 ) ( not ( = ?AUTO_799 ?AUTO_806 ) ) ( not ( = ?AUTO_799 ?AUTO_801 ) ) ( not ( = ?AUTO_800 ?AUTO_806 ) ) ( not ( = ?AUTO_800 ?AUTO_801 ) ) ( not ( = ?AUTO_802 ?AUTO_806 ) ) ( not ( = ?AUTO_802 ?AUTO_801 ) ) ( not ( = ?AUTO_804 ?AUTO_806 ) ) ( not ( = ?AUTO_804 ?AUTO_801 ) ) ( not ( = ?AUTO_805 ?AUTO_806 ) ) ( not ( = ?AUTO_805 ?AUTO_801 ) ) ( not ( = ?AUTO_806 ?AUTO_801 ) ) ( ON ?AUTO_806 ?AUTO_805 ) ( not ( = ?AUTO_799 ?AUTO_803 ) ) ( not ( = ?AUTO_800 ?AUTO_803 ) ) ( not ( = ?AUTO_802 ?AUTO_803 ) ) ( not ( = ?AUTO_804 ?AUTO_803 ) ) ( not ( = ?AUTO_805 ?AUTO_803 ) ) ( not ( = ?AUTO_801 ?AUTO_803 ) ) ( not ( = ?AUTO_806 ?AUTO_803 ) ) ( ON ?AUTO_803 ?AUTO_806 ) ( CLEAR ?AUTO_803 ) ( HOLDING ?AUTO_807 ) ( not ( = ?AUTO_799 ?AUTO_807 ) ) ( not ( = ?AUTO_800 ?AUTO_807 ) ) ( not ( = ?AUTO_802 ?AUTO_807 ) ) ( not ( = ?AUTO_804 ?AUTO_807 ) ) ( not ( = ?AUTO_805 ?AUTO_807 ) ) ( not ( = ?AUTO_801 ?AUTO_807 ) ) ( not ( = ?AUTO_806 ?AUTO_807 ) ) ( not ( = ?AUTO_803 ?AUTO_807 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_807 )
      ( MAKE-ON ?AUTO_799 ?AUTO_800 )
      ( MAKE-ON-VERIFY ?AUTO_799 ?AUTO_800 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_808 - BLOCK
      ?AUTO_809 - BLOCK
    )
    :vars
    (
      ?AUTO_814 - BLOCK
      ?AUTO_816 - BLOCK
      ?AUTO_812 - BLOCK
      ?AUTO_815 - BLOCK
      ?AUTO_811 - BLOCK
      ?AUTO_813 - BLOCK
      ?AUTO_810 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_808 ?AUTO_809 ) ) ( ON ?AUTO_808 ?AUTO_814 ) ( not ( = ?AUTO_808 ?AUTO_814 ) ) ( not ( = ?AUTO_809 ?AUTO_814 ) ) ( not ( = ?AUTO_808 ?AUTO_816 ) ) ( not ( = ?AUTO_808 ?AUTO_812 ) ) ( not ( = ?AUTO_809 ?AUTO_816 ) ) ( not ( = ?AUTO_809 ?AUTO_812 ) ) ( not ( = ?AUTO_814 ?AUTO_816 ) ) ( not ( = ?AUTO_814 ?AUTO_812 ) ) ( not ( = ?AUTO_816 ?AUTO_812 ) ) ( ON ?AUTO_816 ?AUTO_809 ) ( ON ?AUTO_812 ?AUTO_808 ) ( CLEAR ?AUTO_815 ) ( not ( = ?AUTO_808 ?AUTO_811 ) ) ( not ( = ?AUTO_808 ?AUTO_815 ) ) ( not ( = ?AUTO_809 ?AUTO_811 ) ) ( not ( = ?AUTO_809 ?AUTO_815 ) ) ( not ( = ?AUTO_814 ?AUTO_811 ) ) ( not ( = ?AUTO_814 ?AUTO_815 ) ) ( not ( = ?AUTO_816 ?AUTO_811 ) ) ( not ( = ?AUTO_816 ?AUTO_815 ) ) ( not ( = ?AUTO_812 ?AUTO_811 ) ) ( not ( = ?AUTO_812 ?AUTO_815 ) ) ( not ( = ?AUTO_811 ?AUTO_815 ) ) ( ON ?AUTO_811 ?AUTO_812 ) ( not ( = ?AUTO_808 ?AUTO_813 ) ) ( not ( = ?AUTO_809 ?AUTO_813 ) ) ( not ( = ?AUTO_814 ?AUTO_813 ) ) ( not ( = ?AUTO_816 ?AUTO_813 ) ) ( not ( = ?AUTO_812 ?AUTO_813 ) ) ( not ( = ?AUTO_815 ?AUTO_813 ) ) ( not ( = ?AUTO_811 ?AUTO_813 ) ) ( ON ?AUTO_813 ?AUTO_811 ) ( CLEAR ?AUTO_813 ) ( not ( = ?AUTO_808 ?AUTO_810 ) ) ( not ( = ?AUTO_809 ?AUTO_810 ) ) ( not ( = ?AUTO_814 ?AUTO_810 ) ) ( not ( = ?AUTO_816 ?AUTO_810 ) ) ( not ( = ?AUTO_812 ?AUTO_810 ) ) ( not ( = ?AUTO_815 ?AUTO_810 ) ) ( not ( = ?AUTO_811 ?AUTO_810 ) ) ( not ( = ?AUTO_813 ?AUTO_810 ) ) ( ON ?AUTO_810 ?AUTO_816 ) ( CLEAR ?AUTO_810 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_810 ?AUTO_816 )
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
      ?AUTO_821 - BLOCK
      ?AUTO_824 - BLOCK
      ?AUTO_822 - BLOCK
      ?AUTO_823 - BLOCK
      ?AUTO_820 - BLOCK
      ?AUTO_819 - BLOCK
      ?AUTO_825 - BLOCK
      ?AUTO_826 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_817 ?AUTO_818 ) ) ( ON ?AUTO_817 ?AUTO_821 ) ( not ( = ?AUTO_817 ?AUTO_821 ) ) ( not ( = ?AUTO_818 ?AUTO_821 ) ) ( not ( = ?AUTO_817 ?AUTO_824 ) ) ( not ( = ?AUTO_817 ?AUTO_822 ) ) ( not ( = ?AUTO_818 ?AUTO_824 ) ) ( not ( = ?AUTO_818 ?AUTO_822 ) ) ( not ( = ?AUTO_821 ?AUTO_824 ) ) ( not ( = ?AUTO_821 ?AUTO_822 ) ) ( not ( = ?AUTO_824 ?AUTO_822 ) ) ( ON ?AUTO_824 ?AUTO_818 ) ( ON ?AUTO_822 ?AUTO_817 ) ( CLEAR ?AUTO_823 ) ( not ( = ?AUTO_817 ?AUTO_820 ) ) ( not ( = ?AUTO_817 ?AUTO_823 ) ) ( not ( = ?AUTO_818 ?AUTO_820 ) ) ( not ( = ?AUTO_818 ?AUTO_823 ) ) ( not ( = ?AUTO_821 ?AUTO_820 ) ) ( not ( = ?AUTO_821 ?AUTO_823 ) ) ( not ( = ?AUTO_824 ?AUTO_820 ) ) ( not ( = ?AUTO_824 ?AUTO_823 ) ) ( not ( = ?AUTO_822 ?AUTO_820 ) ) ( not ( = ?AUTO_822 ?AUTO_823 ) ) ( not ( = ?AUTO_820 ?AUTO_823 ) ) ( ON ?AUTO_820 ?AUTO_822 ) ( not ( = ?AUTO_817 ?AUTO_819 ) ) ( not ( = ?AUTO_818 ?AUTO_819 ) ) ( not ( = ?AUTO_821 ?AUTO_819 ) ) ( not ( = ?AUTO_824 ?AUTO_819 ) ) ( not ( = ?AUTO_822 ?AUTO_819 ) ) ( not ( = ?AUTO_823 ?AUTO_819 ) ) ( not ( = ?AUTO_820 ?AUTO_819 ) ) ( ON ?AUTO_819 ?AUTO_820 ) ( CLEAR ?AUTO_819 ) ( not ( = ?AUTO_817 ?AUTO_825 ) ) ( not ( = ?AUTO_818 ?AUTO_825 ) ) ( not ( = ?AUTO_821 ?AUTO_825 ) ) ( not ( = ?AUTO_824 ?AUTO_825 ) ) ( not ( = ?AUTO_822 ?AUTO_825 ) ) ( not ( = ?AUTO_823 ?AUTO_825 ) ) ( not ( = ?AUTO_820 ?AUTO_825 ) ) ( not ( = ?AUTO_819 ?AUTO_825 ) ) ( ON ?AUTO_825 ?AUTO_824 ) ( CLEAR ?AUTO_825 ) ( HOLDING ?AUTO_826 ) ( not ( = ?AUTO_817 ?AUTO_826 ) ) ( not ( = ?AUTO_818 ?AUTO_826 ) ) ( not ( = ?AUTO_821 ?AUTO_826 ) ) ( not ( = ?AUTO_824 ?AUTO_826 ) ) ( not ( = ?AUTO_822 ?AUTO_826 ) ) ( not ( = ?AUTO_823 ?AUTO_826 ) ) ( not ( = ?AUTO_820 ?AUTO_826 ) ) ( not ( = ?AUTO_819 ?AUTO_826 ) ) ( not ( = ?AUTO_825 ?AUTO_826 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_826 )
      ( MAKE-ON ?AUTO_817 ?AUTO_818 )
      ( MAKE-ON-VERIFY ?AUTO_817 ?AUTO_818 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_827 - BLOCK
      ?AUTO_828 - BLOCK
    )
    :vars
    (
      ?AUTO_831 - BLOCK
      ?AUTO_835 - BLOCK
      ?AUTO_829 - BLOCK
      ?AUTO_834 - BLOCK
      ?AUTO_830 - BLOCK
      ?AUTO_832 - BLOCK
      ?AUTO_833 - BLOCK
      ?AUTO_836 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_827 ?AUTO_828 ) ) ( ON ?AUTO_827 ?AUTO_831 ) ( not ( = ?AUTO_827 ?AUTO_831 ) ) ( not ( = ?AUTO_828 ?AUTO_831 ) ) ( not ( = ?AUTO_827 ?AUTO_835 ) ) ( not ( = ?AUTO_827 ?AUTO_829 ) ) ( not ( = ?AUTO_828 ?AUTO_835 ) ) ( not ( = ?AUTO_828 ?AUTO_829 ) ) ( not ( = ?AUTO_831 ?AUTO_835 ) ) ( not ( = ?AUTO_831 ?AUTO_829 ) ) ( not ( = ?AUTO_835 ?AUTO_829 ) ) ( ON ?AUTO_835 ?AUTO_828 ) ( ON ?AUTO_829 ?AUTO_827 ) ( CLEAR ?AUTO_834 ) ( not ( = ?AUTO_827 ?AUTO_830 ) ) ( not ( = ?AUTO_827 ?AUTO_834 ) ) ( not ( = ?AUTO_828 ?AUTO_830 ) ) ( not ( = ?AUTO_828 ?AUTO_834 ) ) ( not ( = ?AUTO_831 ?AUTO_830 ) ) ( not ( = ?AUTO_831 ?AUTO_834 ) ) ( not ( = ?AUTO_835 ?AUTO_830 ) ) ( not ( = ?AUTO_835 ?AUTO_834 ) ) ( not ( = ?AUTO_829 ?AUTO_830 ) ) ( not ( = ?AUTO_829 ?AUTO_834 ) ) ( not ( = ?AUTO_830 ?AUTO_834 ) ) ( ON ?AUTO_830 ?AUTO_829 ) ( not ( = ?AUTO_827 ?AUTO_832 ) ) ( not ( = ?AUTO_828 ?AUTO_832 ) ) ( not ( = ?AUTO_831 ?AUTO_832 ) ) ( not ( = ?AUTO_835 ?AUTO_832 ) ) ( not ( = ?AUTO_829 ?AUTO_832 ) ) ( not ( = ?AUTO_834 ?AUTO_832 ) ) ( not ( = ?AUTO_830 ?AUTO_832 ) ) ( ON ?AUTO_832 ?AUTO_830 ) ( CLEAR ?AUTO_832 ) ( not ( = ?AUTO_827 ?AUTO_833 ) ) ( not ( = ?AUTO_828 ?AUTO_833 ) ) ( not ( = ?AUTO_831 ?AUTO_833 ) ) ( not ( = ?AUTO_835 ?AUTO_833 ) ) ( not ( = ?AUTO_829 ?AUTO_833 ) ) ( not ( = ?AUTO_834 ?AUTO_833 ) ) ( not ( = ?AUTO_830 ?AUTO_833 ) ) ( not ( = ?AUTO_832 ?AUTO_833 ) ) ( ON ?AUTO_833 ?AUTO_835 ) ( not ( = ?AUTO_827 ?AUTO_836 ) ) ( not ( = ?AUTO_828 ?AUTO_836 ) ) ( not ( = ?AUTO_831 ?AUTO_836 ) ) ( not ( = ?AUTO_835 ?AUTO_836 ) ) ( not ( = ?AUTO_829 ?AUTO_836 ) ) ( not ( = ?AUTO_834 ?AUTO_836 ) ) ( not ( = ?AUTO_830 ?AUTO_836 ) ) ( not ( = ?AUTO_832 ?AUTO_836 ) ) ( not ( = ?AUTO_833 ?AUTO_836 ) ) ( ON ?AUTO_836 ?AUTO_833 ) ( CLEAR ?AUTO_836 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_836 ?AUTO_833 )
      ( MAKE-ON ?AUTO_827 ?AUTO_828 )
      ( MAKE-ON-VERIFY ?AUTO_827 ?AUTO_828 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_884 - BLOCK
      ?AUTO_885 - BLOCK
    )
    :vars
    (
      ?AUTO_886 - BLOCK
      ?AUTO_887 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_885 ) ( not ( = ?AUTO_884 ?AUTO_885 ) ) ( ON-TABLE ?AUTO_884 ) ( not ( = ?AUTO_884 ?AUTO_886 ) ) ( not ( = ?AUTO_885 ?AUTO_886 ) ) ( ON ?AUTO_886 ?AUTO_884 ) ( CLEAR ?AUTO_886 ) ( HOLDING ?AUTO_887 ) ( not ( = ?AUTO_884 ?AUTO_887 ) ) ( not ( = ?AUTO_885 ?AUTO_887 ) ) ( not ( = ?AUTO_886 ?AUTO_887 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_887 )
      ( MAKE-ON ?AUTO_884 ?AUTO_885 )
      ( MAKE-ON-VERIFY ?AUTO_884 ?AUTO_885 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_919 - BLOCK
      ?AUTO_920 - BLOCK
    )
    :vars
    (
      ?AUTO_924 - BLOCK
      ?AUTO_921 - BLOCK
      ?AUTO_923 - BLOCK
      ?AUTO_922 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_919 ?AUTO_920 ) ) ( ON ?AUTO_919 ?AUTO_924 ) ( not ( = ?AUTO_919 ?AUTO_924 ) ) ( not ( = ?AUTO_920 ?AUTO_924 ) ) ( CLEAR ?AUTO_921 ) ( not ( = ?AUTO_919 ?AUTO_923 ) ) ( not ( = ?AUTO_919 ?AUTO_921 ) ) ( not ( = ?AUTO_920 ?AUTO_923 ) ) ( not ( = ?AUTO_920 ?AUTO_921 ) ) ( not ( = ?AUTO_924 ?AUTO_923 ) ) ( not ( = ?AUTO_924 ?AUTO_921 ) ) ( not ( = ?AUTO_923 ?AUTO_921 ) ) ( ON ?AUTO_923 ?AUTO_919 ) ( CLEAR ?AUTO_923 ) ( not ( = ?AUTO_919 ?AUTO_922 ) ) ( not ( = ?AUTO_920 ?AUTO_922 ) ) ( not ( = ?AUTO_924 ?AUTO_922 ) ) ( not ( = ?AUTO_921 ?AUTO_922 ) ) ( not ( = ?AUTO_923 ?AUTO_922 ) ) ( ON ?AUTO_922 ?AUTO_920 ) ( CLEAR ?AUTO_922 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_922 ?AUTO_920 )
      ( MAKE-ON ?AUTO_919 ?AUTO_920 )
      ( MAKE-ON-VERIFY ?AUTO_919 ?AUTO_920 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_925 - BLOCK
      ?AUTO_926 - BLOCK
    )
    :vars
    (
      ?AUTO_930 - BLOCK
      ?AUTO_929 - BLOCK
      ?AUTO_927 - BLOCK
      ?AUTO_928 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_925 ?AUTO_926 ) ) ( ON ?AUTO_925 ?AUTO_930 ) ( not ( = ?AUTO_925 ?AUTO_930 ) ) ( not ( = ?AUTO_926 ?AUTO_930 ) ) ( not ( = ?AUTO_925 ?AUTO_929 ) ) ( not ( = ?AUTO_925 ?AUTO_927 ) ) ( not ( = ?AUTO_926 ?AUTO_929 ) ) ( not ( = ?AUTO_926 ?AUTO_927 ) ) ( not ( = ?AUTO_930 ?AUTO_929 ) ) ( not ( = ?AUTO_930 ?AUTO_927 ) ) ( not ( = ?AUTO_929 ?AUTO_927 ) ) ( ON ?AUTO_929 ?AUTO_925 ) ( CLEAR ?AUTO_929 ) ( not ( = ?AUTO_925 ?AUTO_928 ) ) ( not ( = ?AUTO_926 ?AUTO_928 ) ) ( not ( = ?AUTO_930 ?AUTO_928 ) ) ( not ( = ?AUTO_927 ?AUTO_928 ) ) ( not ( = ?AUTO_929 ?AUTO_928 ) ) ( ON ?AUTO_928 ?AUTO_926 ) ( CLEAR ?AUTO_928 ) ( HOLDING ?AUTO_927 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_927 )
      ( MAKE-ON ?AUTO_925 ?AUTO_926 )
      ( MAKE-ON-VERIFY ?AUTO_925 ?AUTO_926 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2542 - BLOCK
      ?AUTO_2543 - BLOCK
    )
    :vars
    (
      ?AUTO_2545 - BLOCK
      ?AUTO_2544 - BLOCK
      ?AUTO_2546 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2542 ?AUTO_2543 ) ) ( ON-TABLE ?AUTO_2542 ) ( not ( = ?AUTO_2542 ?AUTO_2545 ) ) ( not ( = ?AUTO_2543 ?AUTO_2545 ) ) ( ON ?AUTO_2545 ?AUTO_2542 ) ( not ( = ?AUTO_2542 ?AUTO_2544 ) ) ( not ( = ?AUTO_2542 ?AUTO_2546 ) ) ( not ( = ?AUTO_2543 ?AUTO_2544 ) ) ( not ( = ?AUTO_2543 ?AUTO_2546 ) ) ( not ( = ?AUTO_2545 ?AUTO_2544 ) ) ( not ( = ?AUTO_2545 ?AUTO_2546 ) ) ( not ( = ?AUTO_2544 ?AUTO_2546 ) ) ( ON ?AUTO_2544 ?AUTO_2545 ) ( CLEAR ?AUTO_2544 ) ( ON ?AUTO_2546 ?AUTO_2543 ) ( CLEAR ?AUTO_2546 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2546 ?AUTO_2543 )
      ( MAKE-ON ?AUTO_2542 ?AUTO_2543 )
      ( MAKE-ON-VERIFY ?AUTO_2542 ?AUTO_2543 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1044 - BLOCK
      ?AUTO_1045 - BLOCK
    )
    :vars
    (
      ?AUTO_1047 - BLOCK
      ?AUTO_1048 - BLOCK
      ?AUTO_1046 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1044 ?AUTO_1045 ) ) ( ON-TABLE ?AUTO_1044 ) ( not ( = ?AUTO_1044 ?AUTO_1047 ) ) ( not ( = ?AUTO_1044 ?AUTO_1048 ) ) ( not ( = ?AUTO_1045 ?AUTO_1047 ) ) ( not ( = ?AUTO_1045 ?AUTO_1048 ) ) ( not ( = ?AUTO_1047 ?AUTO_1048 ) ) ( ON ?AUTO_1047 ?AUTO_1044 ) ( CLEAR ?AUTO_1047 ) ( not ( = ?AUTO_1044 ?AUTO_1046 ) ) ( not ( = ?AUTO_1045 ?AUTO_1046 ) ) ( not ( = ?AUTO_1047 ?AUTO_1046 ) ) ( not ( = ?AUTO_1048 ?AUTO_1046 ) ) ( ON ?AUTO_1048 ?AUTO_1045 ) ( ON ?AUTO_1046 ?AUTO_1048 ) ( CLEAR ?AUTO_1046 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1046 ?AUTO_1048 )
      ( MAKE-ON ?AUTO_1044 ?AUTO_1045 )
      ( MAKE-ON-VERIFY ?AUTO_1044 ?AUTO_1045 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1066 - BLOCK
      ?AUTO_1067 - BLOCK
    )
    :vars
    (
      ?AUTO_1068 - BLOCK
      ?AUTO_1069 - BLOCK
      ?AUTO_1070 - BLOCK
      ?AUTO_1071 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1066 ?AUTO_1067 ) ) ( ON-TABLE ?AUTO_1066 ) ( CLEAR ?AUTO_1066 ) ( CLEAR ?AUTO_1068 ) ( not ( = ?AUTO_1066 ?AUTO_1069 ) ) ( not ( = ?AUTO_1066 ?AUTO_1068 ) ) ( not ( = ?AUTO_1067 ?AUTO_1069 ) ) ( not ( = ?AUTO_1067 ?AUTO_1068 ) ) ( not ( = ?AUTO_1069 ?AUTO_1068 ) ) ( ON ?AUTO_1069 ?AUTO_1067 ) ( CLEAR ?AUTO_1069 ) ( HOLDING ?AUTO_1070 ) ( CLEAR ?AUTO_1071 ) ( not ( = ?AUTO_1066 ?AUTO_1070 ) ) ( not ( = ?AUTO_1066 ?AUTO_1071 ) ) ( not ( = ?AUTO_1067 ?AUTO_1070 ) ) ( not ( = ?AUTO_1067 ?AUTO_1071 ) ) ( not ( = ?AUTO_1068 ?AUTO_1070 ) ) ( not ( = ?AUTO_1068 ?AUTO_1071 ) ) ( not ( = ?AUTO_1069 ?AUTO_1070 ) ) ( not ( = ?AUTO_1069 ?AUTO_1071 ) ) ( not ( = ?AUTO_1070 ?AUTO_1071 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1070 ?AUTO_1071 )
      ( MAKE-ON ?AUTO_1066 ?AUTO_1067 )
      ( MAKE-ON-VERIFY ?AUTO_1066 ?AUTO_1067 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1149 - BLOCK
      ?AUTO_1150 - BLOCK
    )
    :vars
    (
      ?AUTO_1151 - BLOCK
      ?AUTO_1152 - BLOCK
      ?AUTO_1153 - BLOCK
      ?AUTO_1154 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1150 ) ( not ( = ?AUTO_1149 ?AUTO_1150 ) ) ( ON ?AUTO_1149 ?AUTO_1151 ) ( not ( = ?AUTO_1149 ?AUTO_1151 ) ) ( not ( = ?AUTO_1150 ?AUTO_1151 ) ) ( not ( = ?AUTO_1149 ?AUTO_1152 ) ) ( not ( = ?AUTO_1150 ?AUTO_1152 ) ) ( not ( = ?AUTO_1151 ?AUTO_1152 ) ) ( ON ?AUTO_1152 ?AUTO_1149 ) ( CLEAR ?AUTO_1152 ) ( HOLDING ?AUTO_1153 ) ( CLEAR ?AUTO_1154 ) ( not ( = ?AUTO_1149 ?AUTO_1153 ) ) ( not ( = ?AUTO_1149 ?AUTO_1154 ) ) ( not ( = ?AUTO_1150 ?AUTO_1153 ) ) ( not ( = ?AUTO_1150 ?AUTO_1154 ) ) ( not ( = ?AUTO_1151 ?AUTO_1153 ) ) ( not ( = ?AUTO_1151 ?AUTO_1154 ) ) ( not ( = ?AUTO_1152 ?AUTO_1153 ) ) ( not ( = ?AUTO_1152 ?AUTO_1154 ) ) ( not ( = ?AUTO_1153 ?AUTO_1154 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1153 ?AUTO_1154 )
      ( MAKE-ON ?AUTO_1149 ?AUTO_1150 )
      ( MAKE-ON-VERIFY ?AUTO_1149 ?AUTO_1150 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1213 - BLOCK
      ?AUTO_1214 - BLOCK
    )
    :vars
    (
      ?AUTO_1217 - BLOCK
      ?AUTO_1216 - BLOCK
      ?AUTO_1215 - BLOCK
      ?AUTO_1218 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1213 ?AUTO_1214 ) ) ( ON-TABLE ?AUTO_1213 ) ( CLEAR ?AUTO_1217 ) ( not ( = ?AUTO_1213 ?AUTO_1216 ) ) ( not ( = ?AUTO_1213 ?AUTO_1217 ) ) ( not ( = ?AUTO_1214 ?AUTO_1216 ) ) ( not ( = ?AUTO_1214 ?AUTO_1217 ) ) ( not ( = ?AUTO_1216 ?AUTO_1217 ) ) ( ON ?AUTO_1216 ?AUTO_1213 ) ( not ( = ?AUTO_1213 ?AUTO_1215 ) ) ( not ( = ?AUTO_1214 ?AUTO_1215 ) ) ( not ( = ?AUTO_1217 ?AUTO_1215 ) ) ( not ( = ?AUTO_1216 ?AUTO_1215 ) ) ( ON ?AUTO_1215 ?AUTO_1216 ) ( CLEAR ?AUTO_1215 ) ( HOLDING ?AUTO_1214 ) ( CLEAR ?AUTO_1218 ) ( not ( = ?AUTO_1213 ?AUTO_1218 ) ) ( not ( = ?AUTO_1214 ?AUTO_1218 ) ) ( not ( = ?AUTO_1217 ?AUTO_1218 ) ) ( not ( = ?AUTO_1216 ?AUTO_1218 ) ) ( not ( = ?AUTO_1215 ?AUTO_1218 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1214 ?AUTO_1218 )
      ( MAKE-ON ?AUTO_1213 ?AUTO_1214 )
      ( MAKE-ON-VERIFY ?AUTO_1213 ?AUTO_1214 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1221 - BLOCK
      ?AUTO_1222 - BLOCK
    )
    :vars
    (
      ?AUTO_1224 - BLOCK
      ?AUTO_1225 - BLOCK
      ?AUTO_1223 - BLOCK
      ?AUTO_1226 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1222 ) ( not ( = ?AUTO_1221 ?AUTO_1222 ) ) ( ON-TABLE ?AUTO_1221 ) ( not ( = ?AUTO_1221 ?AUTO_1224 ) ) ( not ( = ?AUTO_1221 ?AUTO_1225 ) ) ( not ( = ?AUTO_1222 ?AUTO_1224 ) ) ( not ( = ?AUTO_1222 ?AUTO_1225 ) ) ( not ( = ?AUTO_1224 ?AUTO_1225 ) ) ( ON ?AUTO_1224 ?AUTO_1221 ) ( not ( = ?AUTO_1221 ?AUTO_1223 ) ) ( not ( = ?AUTO_1222 ?AUTO_1223 ) ) ( not ( = ?AUTO_1225 ?AUTO_1223 ) ) ( not ( = ?AUTO_1224 ?AUTO_1223 ) ) ( ON ?AUTO_1223 ?AUTO_1224 ) ( CLEAR ?AUTO_1223 ) ( HOLDING ?AUTO_1225 ) ( CLEAR ?AUTO_1226 ) ( not ( = ?AUTO_1221 ?AUTO_1226 ) ) ( not ( = ?AUTO_1222 ?AUTO_1226 ) ) ( not ( = ?AUTO_1224 ?AUTO_1226 ) ) ( not ( = ?AUTO_1225 ?AUTO_1226 ) ) ( not ( = ?AUTO_1223 ?AUTO_1226 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1225 ?AUTO_1226 )
      ( MAKE-ON ?AUTO_1221 ?AUTO_1222 )
      ( MAKE-ON-VERIFY ?AUTO_1221 ?AUTO_1222 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1239 - BLOCK
      ?AUTO_1240 - BLOCK
    )
    :vars
    (
      ?AUTO_1241 - BLOCK
      ?AUTO_1242 - BLOCK
      ?AUTO_1244 - BLOCK
      ?AUTO_1243 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1240 ) ( not ( = ?AUTO_1239 ?AUTO_1240 ) ) ( ON-TABLE ?AUTO_1239 ) ( not ( = ?AUTO_1239 ?AUTO_1241 ) ) ( not ( = ?AUTO_1239 ?AUTO_1242 ) ) ( not ( = ?AUTO_1240 ?AUTO_1241 ) ) ( not ( = ?AUTO_1240 ?AUTO_1242 ) ) ( not ( = ?AUTO_1241 ?AUTO_1242 ) ) ( ON ?AUTO_1241 ?AUTO_1239 ) ( not ( = ?AUTO_1239 ?AUTO_1244 ) ) ( not ( = ?AUTO_1240 ?AUTO_1244 ) ) ( not ( = ?AUTO_1242 ?AUTO_1244 ) ) ( not ( = ?AUTO_1241 ?AUTO_1244 ) ) ( ON ?AUTO_1244 ?AUTO_1241 ) ( not ( = ?AUTO_1239 ?AUTO_1243 ) ) ( not ( = ?AUTO_1240 ?AUTO_1243 ) ) ( not ( = ?AUTO_1241 ?AUTO_1243 ) ) ( not ( = ?AUTO_1242 ?AUTO_1243 ) ) ( not ( = ?AUTO_1244 ?AUTO_1243 ) ) ( ON ?AUTO_1242 ?AUTO_1244 ) ( ON ?AUTO_1243 ?AUTO_1242 ) ( CLEAR ?AUTO_1243 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1243 ?AUTO_1242 )
      ( MAKE-ON ?AUTO_1239 ?AUTO_1240 )
      ( MAKE-ON-VERIFY ?AUTO_1239 ?AUTO_1240 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1262 - BLOCK
      ?AUTO_1263 - BLOCK
    )
    :vars
    (
      ?AUTO_1265 - BLOCK
      ?AUTO_1264 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1262 ?AUTO_1263 ) ) ( CLEAR ?AUTO_1265 ) ( not ( = ?AUTO_1262 ?AUTO_1264 ) ) ( not ( = ?AUTO_1262 ?AUTO_1265 ) ) ( not ( = ?AUTO_1263 ?AUTO_1264 ) ) ( not ( = ?AUTO_1263 ?AUTO_1265 ) ) ( not ( = ?AUTO_1264 ?AUTO_1265 ) ) ( ON ?AUTO_1264 ?AUTO_1263 ) ( CLEAR ?AUTO_1264 ) ( HOLDING ?AUTO_1262 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1262 )
      ( MAKE-ON ?AUTO_1262 ?AUTO_1263 )
      ( MAKE-ON-VERIFY ?AUTO_1262 ?AUTO_1263 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1270 - BLOCK
      ?AUTO_1271 - BLOCK
    )
    :vars
    (
      ?AUTO_1273 - BLOCK
      ?AUTO_1272 - BLOCK
      ?AUTO_1274 - BLOCK
      ?AUTO_1275 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1270 ?AUTO_1271 ) ) ( CLEAR ?AUTO_1273 ) ( not ( = ?AUTO_1270 ?AUTO_1272 ) ) ( not ( = ?AUTO_1270 ?AUTO_1273 ) ) ( not ( = ?AUTO_1271 ?AUTO_1272 ) ) ( not ( = ?AUTO_1271 ?AUTO_1273 ) ) ( not ( = ?AUTO_1272 ?AUTO_1273 ) ) ( ON ?AUTO_1272 ?AUTO_1271 ) ( ON ?AUTO_1270 ?AUTO_1272 ) ( CLEAR ?AUTO_1270 ) ( HOLDING ?AUTO_1274 ) ( CLEAR ?AUTO_1275 ) ( not ( = ?AUTO_1270 ?AUTO_1274 ) ) ( not ( = ?AUTO_1270 ?AUTO_1275 ) ) ( not ( = ?AUTO_1271 ?AUTO_1274 ) ) ( not ( = ?AUTO_1271 ?AUTO_1275 ) ) ( not ( = ?AUTO_1273 ?AUTO_1274 ) ) ( not ( = ?AUTO_1273 ?AUTO_1275 ) ) ( not ( = ?AUTO_1272 ?AUTO_1274 ) ) ( not ( = ?AUTO_1272 ?AUTO_1275 ) ) ( not ( = ?AUTO_1274 ?AUTO_1275 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1274 ?AUTO_1275 )
      ( MAKE-ON ?AUTO_1270 ?AUTO_1271 )
      ( MAKE-ON-VERIFY ?AUTO_1270 ?AUTO_1271 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1450 - BLOCK
      ?AUTO_1451 - BLOCK
    )
    :vars
    (
      ?AUTO_1453 - BLOCK
      ?AUTO_1454 - BLOCK
      ?AUTO_1452 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1450 ?AUTO_1451 ) ) ( not ( = ?AUTO_1450 ?AUTO_1453 ) ) ( not ( = ?AUTO_1451 ?AUTO_1453 ) ) ( not ( = ?AUTO_1450 ?AUTO_1454 ) ) ( not ( = ?AUTO_1451 ?AUTO_1454 ) ) ( not ( = ?AUTO_1453 ?AUTO_1454 ) ) ( ON ?AUTO_1454 ?AUTO_1451 ) ( CLEAR ?AUTO_1453 ) ( ON ?AUTO_1450 ?AUTO_1454 ) ( not ( = ?AUTO_1450 ?AUTO_1452 ) ) ( not ( = ?AUTO_1451 ?AUTO_1452 ) ) ( not ( = ?AUTO_1453 ?AUTO_1452 ) ) ( not ( = ?AUTO_1454 ?AUTO_1452 ) ) ( ON ?AUTO_1452 ?AUTO_1450 ) ( CLEAR ?AUTO_1452 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1452 ?AUTO_1450 )
      ( MAKE-ON ?AUTO_1450 ?AUTO_1451 )
      ( MAKE-ON-VERIFY ?AUTO_1450 ?AUTO_1451 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1286 - BLOCK
      ?AUTO_1287 - BLOCK
    )
    :vars
    (
      ?AUTO_1289 - BLOCK
      ?AUTO_1288 - BLOCK
      ?AUTO_1290 - BLOCK
      ?AUTO_1291 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1286 ?AUTO_1287 ) ) ( not ( = ?AUTO_1286 ?AUTO_1289 ) ) ( not ( = ?AUTO_1286 ?AUTO_1288 ) ) ( not ( = ?AUTO_1287 ?AUTO_1289 ) ) ( not ( = ?AUTO_1287 ?AUTO_1288 ) ) ( not ( = ?AUTO_1289 ?AUTO_1288 ) ) ( ON ?AUTO_1289 ?AUTO_1287 ) ( ON ?AUTO_1286 ?AUTO_1289 ) ( CLEAR ?AUTO_1290 ) ( not ( = ?AUTO_1286 ?AUTO_1291 ) ) ( not ( = ?AUTO_1286 ?AUTO_1290 ) ) ( not ( = ?AUTO_1287 ?AUTO_1291 ) ) ( not ( = ?AUTO_1287 ?AUTO_1290 ) ) ( not ( = ?AUTO_1288 ?AUTO_1291 ) ) ( not ( = ?AUTO_1288 ?AUTO_1290 ) ) ( not ( = ?AUTO_1289 ?AUTO_1291 ) ) ( not ( = ?AUTO_1289 ?AUTO_1290 ) ) ( not ( = ?AUTO_1291 ?AUTO_1290 ) ) ( ON ?AUTO_1291 ?AUTO_1286 ) ( CLEAR ?AUTO_1291 ) ( HOLDING ?AUTO_1288 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1288 )
      ( MAKE-ON ?AUTO_1286 ?AUTO_1287 )
      ( MAKE-ON-VERIFY ?AUTO_1286 ?AUTO_1287 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1292 - BLOCK
      ?AUTO_1293 - BLOCK
    )
    :vars
    (
      ?AUTO_1296 - BLOCK
      ?AUTO_1295 - BLOCK
      ?AUTO_1294 - BLOCK
      ?AUTO_1297 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1292 ?AUTO_1293 ) ) ( not ( = ?AUTO_1292 ?AUTO_1296 ) ) ( not ( = ?AUTO_1292 ?AUTO_1295 ) ) ( not ( = ?AUTO_1293 ?AUTO_1296 ) ) ( not ( = ?AUTO_1293 ?AUTO_1295 ) ) ( not ( = ?AUTO_1296 ?AUTO_1295 ) ) ( ON ?AUTO_1296 ?AUTO_1293 ) ( ON ?AUTO_1292 ?AUTO_1296 ) ( CLEAR ?AUTO_1294 ) ( not ( = ?AUTO_1292 ?AUTO_1297 ) ) ( not ( = ?AUTO_1292 ?AUTO_1294 ) ) ( not ( = ?AUTO_1293 ?AUTO_1297 ) ) ( not ( = ?AUTO_1293 ?AUTO_1294 ) ) ( not ( = ?AUTO_1295 ?AUTO_1297 ) ) ( not ( = ?AUTO_1295 ?AUTO_1294 ) ) ( not ( = ?AUTO_1296 ?AUTO_1297 ) ) ( not ( = ?AUTO_1296 ?AUTO_1294 ) ) ( not ( = ?AUTO_1297 ?AUTO_1294 ) ) ( ON ?AUTO_1297 ?AUTO_1292 ) ( ON ?AUTO_1295 ?AUTO_1297 ) ( CLEAR ?AUTO_1295 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1295 ?AUTO_1297 )
      ( MAKE-ON ?AUTO_1292 ?AUTO_1293 )
      ( MAKE-ON-VERIFY ?AUTO_1292 ?AUTO_1293 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1907 - BLOCK
      ?AUTO_1908 - BLOCK
    )
    :vars
    (
      ?AUTO_1910 - BLOCK
      ?AUTO_1909 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1907 ?AUTO_1908 ) ) ( ON ?AUTO_1907 ?AUTO_1910 ) ( not ( = ?AUTO_1907 ?AUTO_1910 ) ) ( not ( = ?AUTO_1908 ?AUTO_1910 ) ) ( ON ?AUTO_1908 ?AUTO_1907 ) ( not ( = ?AUTO_1907 ?AUTO_1909 ) ) ( not ( = ?AUTO_1908 ?AUTO_1909 ) ) ( not ( = ?AUTO_1910 ?AUTO_1909 ) ) ( ON ?AUTO_1909 ?AUTO_1908 ) ( CLEAR ?AUTO_1909 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1909 ?AUTO_1908 )
      ( MAKE-ON ?AUTO_1907 ?AUTO_1908 )
      ( MAKE-ON-VERIFY ?AUTO_1907 ?AUTO_1908 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1723 - BLOCK
      ?AUTO_1724 - BLOCK
    )
    :vars
    (
      ?AUTO_1725 - BLOCK
      ?AUTO_1726 - BLOCK
      ?AUTO_1727 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1724 ) ( not ( = ?AUTO_1723 ?AUTO_1724 ) ) ( ON ?AUTO_1723 ?AUTO_1725 ) ( not ( = ?AUTO_1723 ?AUTO_1725 ) ) ( not ( = ?AUTO_1724 ?AUTO_1725 ) ) ( not ( = ?AUTO_1723 ?AUTO_1726 ) ) ( not ( = ?AUTO_1724 ?AUTO_1726 ) ) ( not ( = ?AUTO_1725 ?AUTO_1726 ) ) ( ON ?AUTO_1726 ?AUTO_1723 ) ( not ( = ?AUTO_1723 ?AUTO_1727 ) ) ( not ( = ?AUTO_1724 ?AUTO_1727 ) ) ( not ( = ?AUTO_1725 ?AUTO_1727 ) ) ( not ( = ?AUTO_1726 ?AUTO_1727 ) ) ( ON ?AUTO_1727 ?AUTO_1726 ) ( CLEAR ?AUTO_1727 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1727 ?AUTO_1726 )
      ( MAKE-ON ?AUTO_1723 ?AUTO_1724 )
      ( MAKE-ON-VERIFY ?AUTO_1723 ?AUTO_1724 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1371 - BLOCK
      ?AUTO_1372 - BLOCK
    )
    :vars
    (
      ?AUTO_1376 - BLOCK
      ?AUTO_1374 - BLOCK
      ?AUTO_1373 - BLOCK
      ?AUTO_1375 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1371 ?AUTO_1372 ) ) ( ON ?AUTO_1371 ?AUTO_1376 ) ( not ( = ?AUTO_1371 ?AUTO_1376 ) ) ( not ( = ?AUTO_1372 ?AUTO_1376 ) ) ( not ( = ?AUTO_1371 ?AUTO_1374 ) ) ( not ( = ?AUTO_1371 ?AUTO_1373 ) ) ( not ( = ?AUTO_1372 ?AUTO_1374 ) ) ( not ( = ?AUTO_1372 ?AUTO_1373 ) ) ( not ( = ?AUTO_1376 ?AUTO_1374 ) ) ( not ( = ?AUTO_1376 ?AUTO_1373 ) ) ( not ( = ?AUTO_1374 ?AUTO_1373 ) ) ( ON ?AUTO_1374 ?AUTO_1371 ) ( CLEAR ?AUTO_1375 ) ( not ( = ?AUTO_1371 ?AUTO_1375 ) ) ( not ( = ?AUTO_1372 ?AUTO_1375 ) ) ( not ( = ?AUTO_1376 ?AUTO_1375 ) ) ( not ( = ?AUTO_1374 ?AUTO_1375 ) ) ( not ( = ?AUTO_1373 ?AUTO_1375 ) ) ( ON ?AUTO_1373 ?AUTO_1374 ) ( CLEAR ?AUTO_1373 ) ( HOLDING ?AUTO_1372 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1372 )
      ( MAKE-ON ?AUTO_1371 ?AUTO_1372 )
      ( MAKE-ON-VERIFY ?AUTO_1371 ?AUTO_1372 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1377 - BLOCK
      ?AUTO_1378 - BLOCK
    )
    :vars
    (
      ?AUTO_1379 - BLOCK
      ?AUTO_1381 - BLOCK
      ?AUTO_1380 - BLOCK
      ?AUTO_1382 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1377 ?AUTO_1378 ) ) ( ON ?AUTO_1377 ?AUTO_1379 ) ( not ( = ?AUTO_1377 ?AUTO_1379 ) ) ( not ( = ?AUTO_1378 ?AUTO_1379 ) ) ( not ( = ?AUTO_1377 ?AUTO_1381 ) ) ( not ( = ?AUTO_1377 ?AUTO_1380 ) ) ( not ( = ?AUTO_1378 ?AUTO_1381 ) ) ( not ( = ?AUTO_1378 ?AUTO_1380 ) ) ( not ( = ?AUTO_1379 ?AUTO_1381 ) ) ( not ( = ?AUTO_1379 ?AUTO_1380 ) ) ( not ( = ?AUTO_1381 ?AUTO_1380 ) ) ( ON ?AUTO_1381 ?AUTO_1377 ) ( CLEAR ?AUTO_1382 ) ( not ( = ?AUTO_1377 ?AUTO_1382 ) ) ( not ( = ?AUTO_1378 ?AUTO_1382 ) ) ( not ( = ?AUTO_1379 ?AUTO_1382 ) ) ( not ( = ?AUTO_1381 ?AUTO_1382 ) ) ( not ( = ?AUTO_1380 ?AUTO_1382 ) ) ( ON ?AUTO_1380 ?AUTO_1381 ) ( ON ?AUTO_1378 ?AUTO_1380 ) ( CLEAR ?AUTO_1378 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1378 ?AUTO_1380 )
      ( MAKE-ON ?AUTO_1377 ?AUTO_1378 )
      ( MAKE-ON-VERIFY ?AUTO_1377 ?AUTO_1378 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1424 - BLOCK
      ?AUTO_1425 - BLOCK
    )
    :vars
    (
      ?AUTO_1426 - BLOCK
      ?AUTO_1427 - BLOCK
      ?AUTO_1428 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1424 ?AUTO_1425 ) ) ( ON ?AUTO_1424 ?AUTO_1426 ) ( not ( = ?AUTO_1424 ?AUTO_1426 ) ) ( not ( = ?AUTO_1425 ?AUTO_1426 ) ) ( not ( = ?AUTO_1424 ?AUTO_1427 ) ) ( not ( = ?AUTO_1425 ?AUTO_1427 ) ) ( not ( = ?AUTO_1426 ?AUTO_1427 ) ) ( ON ?AUTO_1427 ?AUTO_1424 ) ( CLEAR ?AUTO_1427 ) ( HOLDING ?AUTO_1425 ) ( CLEAR ?AUTO_1428 ) ( not ( = ?AUTO_1424 ?AUTO_1428 ) ) ( not ( = ?AUTO_1425 ?AUTO_1428 ) ) ( not ( = ?AUTO_1426 ?AUTO_1428 ) ) ( not ( = ?AUTO_1427 ?AUTO_1428 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1425 ?AUTO_1428 )
      ( MAKE-ON ?AUTO_1424 ?AUTO_1425 )
      ( MAKE-ON-VERIFY ?AUTO_1424 ?AUTO_1425 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1528 - BLOCK
      ?AUTO_1529 - BLOCK
    )
    :vars
    (
      ?AUTO_1530 - BLOCK
      ?AUTO_1531 - BLOCK
      ?AUTO_1532 - BLOCK
      ?AUTO_1533 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1528 ?AUTO_1529 ) ) ( ON-TABLE ?AUTO_1528 ) ( CLEAR ?AUTO_1530 ) ( not ( = ?AUTO_1528 ?AUTO_1531 ) ) ( not ( = ?AUTO_1528 ?AUTO_1530 ) ) ( not ( = ?AUTO_1529 ?AUTO_1531 ) ) ( not ( = ?AUTO_1529 ?AUTO_1530 ) ) ( not ( = ?AUTO_1531 ?AUTO_1530 ) ) ( ON ?AUTO_1531 ?AUTO_1528 ) ( not ( = ?AUTO_1528 ?AUTO_1532 ) ) ( not ( = ?AUTO_1529 ?AUTO_1532 ) ) ( not ( = ?AUTO_1530 ?AUTO_1532 ) ) ( not ( = ?AUTO_1531 ?AUTO_1532 ) ) ( ON ?AUTO_1529 ?AUTO_1531 ) ( CLEAR ?AUTO_1529 ) ( HOLDING ?AUTO_1532 ) ( CLEAR ?AUTO_1533 ) ( not ( = ?AUTO_1528 ?AUTO_1533 ) ) ( not ( = ?AUTO_1529 ?AUTO_1533 ) ) ( not ( = ?AUTO_1530 ?AUTO_1533 ) ) ( not ( = ?AUTO_1531 ?AUTO_1533 ) ) ( not ( = ?AUTO_1532 ?AUTO_1533 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1532 ?AUTO_1533 )
      ( MAKE-ON ?AUTO_1528 ?AUTO_1529 )
      ( MAKE-ON-VERIFY ?AUTO_1528 ?AUTO_1529 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1534 - BLOCK
      ?AUTO_1535 - BLOCK
    )
    :vars
    (
      ?AUTO_1538 - BLOCK
      ?AUTO_1539 - BLOCK
      ?AUTO_1536 - BLOCK
      ?AUTO_1537 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1534 ?AUTO_1535 ) ) ( ON-TABLE ?AUTO_1534 ) ( CLEAR ?AUTO_1538 ) ( not ( = ?AUTO_1534 ?AUTO_1539 ) ) ( not ( = ?AUTO_1534 ?AUTO_1538 ) ) ( not ( = ?AUTO_1535 ?AUTO_1539 ) ) ( not ( = ?AUTO_1535 ?AUTO_1538 ) ) ( not ( = ?AUTO_1539 ?AUTO_1538 ) ) ( ON ?AUTO_1539 ?AUTO_1534 ) ( not ( = ?AUTO_1534 ?AUTO_1536 ) ) ( not ( = ?AUTO_1535 ?AUTO_1536 ) ) ( not ( = ?AUTO_1538 ?AUTO_1536 ) ) ( not ( = ?AUTO_1539 ?AUTO_1536 ) ) ( ON ?AUTO_1535 ?AUTO_1539 ) ( CLEAR ?AUTO_1537 ) ( not ( = ?AUTO_1534 ?AUTO_1537 ) ) ( not ( = ?AUTO_1535 ?AUTO_1537 ) ) ( not ( = ?AUTO_1538 ?AUTO_1537 ) ) ( not ( = ?AUTO_1539 ?AUTO_1537 ) ) ( not ( = ?AUTO_1536 ?AUTO_1537 ) ) ( ON ?AUTO_1536 ?AUTO_1535 ) ( CLEAR ?AUTO_1536 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1536 ?AUTO_1535 )
      ( MAKE-ON ?AUTO_1534 ?AUTO_1535 )
      ( MAKE-ON-VERIFY ?AUTO_1534 ?AUTO_1535 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1540 - BLOCK
      ?AUTO_1541 - BLOCK
    )
    :vars
    (
      ?AUTO_1543 - BLOCK
      ?AUTO_1542 - BLOCK
      ?AUTO_1545 - BLOCK
      ?AUTO_1544 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1540 ?AUTO_1541 ) ) ( ON-TABLE ?AUTO_1540 ) ( not ( = ?AUTO_1540 ?AUTO_1543 ) ) ( not ( = ?AUTO_1540 ?AUTO_1542 ) ) ( not ( = ?AUTO_1541 ?AUTO_1543 ) ) ( not ( = ?AUTO_1541 ?AUTO_1542 ) ) ( not ( = ?AUTO_1543 ?AUTO_1542 ) ) ( ON ?AUTO_1543 ?AUTO_1540 ) ( not ( = ?AUTO_1540 ?AUTO_1545 ) ) ( not ( = ?AUTO_1541 ?AUTO_1545 ) ) ( not ( = ?AUTO_1542 ?AUTO_1545 ) ) ( not ( = ?AUTO_1543 ?AUTO_1545 ) ) ( ON ?AUTO_1541 ?AUTO_1543 ) ( CLEAR ?AUTO_1544 ) ( not ( = ?AUTO_1540 ?AUTO_1544 ) ) ( not ( = ?AUTO_1541 ?AUTO_1544 ) ) ( not ( = ?AUTO_1542 ?AUTO_1544 ) ) ( not ( = ?AUTO_1543 ?AUTO_1544 ) ) ( not ( = ?AUTO_1545 ?AUTO_1544 ) ) ( ON ?AUTO_1545 ?AUTO_1541 ) ( CLEAR ?AUTO_1545 ) ( HOLDING ?AUTO_1542 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1542 )
      ( MAKE-ON ?AUTO_1540 ?AUTO_1541 )
      ( MAKE-ON-VERIFY ?AUTO_1540 ?AUTO_1541 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1546 - BLOCK
      ?AUTO_1547 - BLOCK
    )
    :vars
    (
      ?AUTO_1551 - BLOCK
      ?AUTO_1548 - BLOCK
      ?AUTO_1549 - BLOCK
      ?AUTO_1550 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1546 ?AUTO_1547 ) ) ( ON-TABLE ?AUTO_1546 ) ( not ( = ?AUTO_1546 ?AUTO_1551 ) ) ( not ( = ?AUTO_1546 ?AUTO_1548 ) ) ( not ( = ?AUTO_1547 ?AUTO_1551 ) ) ( not ( = ?AUTO_1547 ?AUTO_1548 ) ) ( not ( = ?AUTO_1551 ?AUTO_1548 ) ) ( ON ?AUTO_1551 ?AUTO_1546 ) ( not ( = ?AUTO_1546 ?AUTO_1549 ) ) ( not ( = ?AUTO_1547 ?AUTO_1549 ) ) ( not ( = ?AUTO_1548 ?AUTO_1549 ) ) ( not ( = ?AUTO_1551 ?AUTO_1549 ) ) ( ON ?AUTO_1547 ?AUTO_1551 ) ( CLEAR ?AUTO_1550 ) ( not ( = ?AUTO_1546 ?AUTO_1550 ) ) ( not ( = ?AUTO_1547 ?AUTO_1550 ) ) ( not ( = ?AUTO_1548 ?AUTO_1550 ) ) ( not ( = ?AUTO_1551 ?AUTO_1550 ) ) ( not ( = ?AUTO_1549 ?AUTO_1550 ) ) ( ON ?AUTO_1549 ?AUTO_1547 ) ( ON ?AUTO_1548 ?AUTO_1549 ) ( CLEAR ?AUTO_1548 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1548 ?AUTO_1549 )
      ( MAKE-ON ?AUTO_1546 ?AUTO_1547 )
      ( MAKE-ON-VERIFY ?AUTO_1546 ?AUTO_1547 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1696 - BLOCK
    )
    :vars
    (
      ?AUTO_1698 - BLOCK
      ?AUTO_1699 - BLOCK
      ?AUTO_1697 - BLOCK
      ?AUTO_1700 - BLOCK
      ?AUTO_1701 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1696 ?AUTO_1698 ) ( not ( = ?AUTO_1696 ?AUTO_1698 ) ) ( not ( = ?AUTO_1696 ?AUTO_1699 ) ) ( not ( = ?AUTO_1698 ?AUTO_1699 ) ) ( ON ?AUTO_1699 ?AUTO_1696 ) ( not ( = ?AUTO_1696 ?AUTO_1697 ) ) ( not ( = ?AUTO_1698 ?AUTO_1697 ) ) ( not ( = ?AUTO_1699 ?AUTO_1697 ) ) ( ON ?AUTO_1697 ?AUTO_1699 ) ( CLEAR ?AUTO_1697 ) ( HOLDING ?AUTO_1700 ) ( CLEAR ?AUTO_1701 ) ( not ( = ?AUTO_1696 ?AUTO_1700 ) ) ( not ( = ?AUTO_1696 ?AUTO_1701 ) ) ( not ( = ?AUTO_1698 ?AUTO_1700 ) ) ( not ( = ?AUTO_1698 ?AUTO_1701 ) ) ( not ( = ?AUTO_1699 ?AUTO_1700 ) ) ( not ( = ?AUTO_1699 ?AUTO_1701 ) ) ( not ( = ?AUTO_1697 ?AUTO_1700 ) ) ( not ( = ?AUTO_1697 ?AUTO_1701 ) ) ( not ( = ?AUTO_1700 ?AUTO_1701 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1700 ?AUTO_1701 )
      ( MAKE-ON-TABLE ?AUTO_1696 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1696 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1633 - BLOCK
      ?AUTO_1634 - BLOCK
    )
    :vars
    (
      ?AUTO_1635 - BLOCK
      ?AUTO_1636 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1633 ?AUTO_1634 ) ) ( ON-TABLE ?AUTO_1633 ) ( CLEAR ?AUTO_1633 ) ( not ( = ?AUTO_1633 ?AUTO_1635 ) ) ( not ( = ?AUTO_1634 ?AUTO_1635 ) ) ( ON ?AUTO_1635 ?AUTO_1634 ) ( not ( = ?AUTO_1633 ?AUTO_1636 ) ) ( not ( = ?AUTO_1634 ?AUTO_1636 ) ) ( not ( = ?AUTO_1635 ?AUTO_1636 ) ) ( ON ?AUTO_1636 ?AUTO_1635 ) ( CLEAR ?AUTO_1636 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1636 ?AUTO_1635 )
      ( MAKE-ON ?AUTO_1633 ?AUTO_1634 )
      ( MAKE-ON-VERIFY ?AUTO_1633 ?AUTO_1634 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1637 - BLOCK
      ?AUTO_1638 - BLOCK
    )
    :vars
    (
      ?AUTO_1640 - BLOCK
      ?AUTO_1639 - BLOCK
      ?AUTO_1641 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1637 ?AUTO_1638 ) ) ( ON-TABLE ?AUTO_1637 ) ( CLEAR ?AUTO_1637 ) ( not ( = ?AUTO_1637 ?AUTO_1640 ) ) ( not ( = ?AUTO_1638 ?AUTO_1640 ) ) ( ON ?AUTO_1640 ?AUTO_1638 ) ( not ( = ?AUTO_1637 ?AUTO_1639 ) ) ( not ( = ?AUTO_1638 ?AUTO_1639 ) ) ( not ( = ?AUTO_1640 ?AUTO_1639 ) ) ( ON ?AUTO_1639 ?AUTO_1640 ) ( CLEAR ?AUTO_1639 ) ( HOLDING ?AUTO_1641 ) ( not ( = ?AUTO_1637 ?AUTO_1641 ) ) ( not ( = ?AUTO_1638 ?AUTO_1641 ) ) ( not ( = ?AUTO_1640 ?AUTO_1641 ) ) ( not ( = ?AUTO_1639 ?AUTO_1641 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1641 )
      ( MAKE-ON ?AUTO_1637 ?AUTO_1638 )
      ( MAKE-ON-VERIFY ?AUTO_1637 ?AUTO_1638 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1642 - BLOCK
      ?AUTO_1643 - BLOCK
    )
    :vars
    (
      ?AUTO_1645 - BLOCK
      ?AUTO_1644 - BLOCK
      ?AUTO_1646 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1642 ?AUTO_1643 ) ) ( ON-TABLE ?AUTO_1642 ) ( CLEAR ?AUTO_1642 ) ( not ( = ?AUTO_1642 ?AUTO_1645 ) ) ( not ( = ?AUTO_1643 ?AUTO_1645 ) ) ( ON ?AUTO_1645 ?AUTO_1643 ) ( not ( = ?AUTO_1642 ?AUTO_1644 ) ) ( not ( = ?AUTO_1643 ?AUTO_1644 ) ) ( not ( = ?AUTO_1645 ?AUTO_1644 ) ) ( ON ?AUTO_1644 ?AUTO_1645 ) ( not ( = ?AUTO_1642 ?AUTO_1646 ) ) ( not ( = ?AUTO_1643 ?AUTO_1646 ) ) ( not ( = ?AUTO_1645 ?AUTO_1646 ) ) ( not ( = ?AUTO_1644 ?AUTO_1646 ) ) ( ON ?AUTO_1646 ?AUTO_1644 ) ( CLEAR ?AUTO_1646 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1646 ?AUTO_1644 )
      ( MAKE-ON ?AUTO_1642 ?AUTO_1643 )
      ( MAKE-ON-VERIFY ?AUTO_1642 ?AUTO_1643 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1672 - BLOCK
    )
    :vars
    (
      ?AUTO_1673 - BLOCK
      ?AUTO_1674 - BLOCK
      ?AUTO_1675 - BLOCK
      ?AUTO_1676 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1672 ?AUTO_1673 ) ( not ( = ?AUTO_1672 ?AUTO_1673 ) ) ( not ( = ?AUTO_1672 ?AUTO_1674 ) ) ( not ( = ?AUTO_1673 ?AUTO_1674 ) ) ( ON ?AUTO_1674 ?AUTO_1672 ) ( CLEAR ?AUTO_1674 ) ( HOLDING ?AUTO_1675 ) ( CLEAR ?AUTO_1676 ) ( not ( = ?AUTO_1672 ?AUTO_1675 ) ) ( not ( = ?AUTO_1672 ?AUTO_1676 ) ) ( not ( = ?AUTO_1673 ?AUTO_1675 ) ) ( not ( = ?AUTO_1673 ?AUTO_1676 ) ) ( not ( = ?AUTO_1674 ?AUTO_1675 ) ) ( not ( = ?AUTO_1674 ?AUTO_1676 ) ) ( not ( = ?AUTO_1675 ?AUTO_1676 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1675 ?AUTO_1676 )
      ( MAKE-ON-TABLE ?AUTO_1672 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1672 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1728 - BLOCK
      ?AUTO_1729 - BLOCK
    )
    :vars
    (
      ?AUTO_1732 - BLOCK
      ?AUTO_1731 - BLOCK
      ?AUTO_1730 - BLOCK
      ?AUTO_1733 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1729 ) ( not ( = ?AUTO_1728 ?AUTO_1729 ) ) ( ON ?AUTO_1728 ?AUTO_1732 ) ( not ( = ?AUTO_1728 ?AUTO_1732 ) ) ( not ( = ?AUTO_1729 ?AUTO_1732 ) ) ( not ( = ?AUTO_1728 ?AUTO_1731 ) ) ( not ( = ?AUTO_1729 ?AUTO_1731 ) ) ( not ( = ?AUTO_1732 ?AUTO_1731 ) ) ( ON ?AUTO_1731 ?AUTO_1728 ) ( not ( = ?AUTO_1728 ?AUTO_1730 ) ) ( not ( = ?AUTO_1729 ?AUTO_1730 ) ) ( not ( = ?AUTO_1732 ?AUTO_1730 ) ) ( not ( = ?AUTO_1731 ?AUTO_1730 ) ) ( ON ?AUTO_1730 ?AUTO_1731 ) ( CLEAR ?AUTO_1730 ) ( HOLDING ?AUTO_1733 ) ( not ( = ?AUTO_1728 ?AUTO_1733 ) ) ( not ( = ?AUTO_1729 ?AUTO_1733 ) ) ( not ( = ?AUTO_1732 ?AUTO_1733 ) ) ( not ( = ?AUTO_1731 ?AUTO_1733 ) ) ( not ( = ?AUTO_1730 ?AUTO_1733 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1733 )
      ( MAKE-ON ?AUTO_1728 ?AUTO_1729 )
      ( MAKE-ON-VERIFY ?AUTO_1728 ?AUTO_1729 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1734 - BLOCK
      ?AUTO_1735 - BLOCK
    )
    :vars
    (
      ?AUTO_1739 - BLOCK
      ?AUTO_1737 - BLOCK
      ?AUTO_1738 - BLOCK
      ?AUTO_1736 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1735 ) ( not ( = ?AUTO_1734 ?AUTO_1735 ) ) ( ON ?AUTO_1734 ?AUTO_1739 ) ( not ( = ?AUTO_1734 ?AUTO_1739 ) ) ( not ( = ?AUTO_1735 ?AUTO_1739 ) ) ( not ( = ?AUTO_1734 ?AUTO_1737 ) ) ( not ( = ?AUTO_1735 ?AUTO_1737 ) ) ( not ( = ?AUTO_1739 ?AUTO_1737 ) ) ( ON ?AUTO_1737 ?AUTO_1734 ) ( not ( = ?AUTO_1734 ?AUTO_1738 ) ) ( not ( = ?AUTO_1735 ?AUTO_1738 ) ) ( not ( = ?AUTO_1739 ?AUTO_1738 ) ) ( not ( = ?AUTO_1737 ?AUTO_1738 ) ) ( ON ?AUTO_1738 ?AUTO_1737 ) ( not ( = ?AUTO_1734 ?AUTO_1736 ) ) ( not ( = ?AUTO_1735 ?AUTO_1736 ) ) ( not ( = ?AUTO_1739 ?AUTO_1736 ) ) ( not ( = ?AUTO_1737 ?AUTO_1736 ) ) ( not ( = ?AUTO_1738 ?AUTO_1736 ) ) ( ON ?AUTO_1736 ?AUTO_1738 ) ( CLEAR ?AUTO_1736 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1736 ?AUTO_1738 )
      ( MAKE-ON ?AUTO_1734 ?AUTO_1735 )
      ( MAKE-ON-VERIFY ?AUTO_1734 ?AUTO_1735 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1740 - BLOCK
      ?AUTO_1741 - BLOCK
    )
    :vars
    (
      ?AUTO_1745 - BLOCK
      ?AUTO_1743 - BLOCK
      ?AUTO_1744 - BLOCK
      ?AUTO_1742 - BLOCK
      ?AUTO_1746 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1740 ?AUTO_1741 ) ) ( ON ?AUTO_1740 ?AUTO_1745 ) ( not ( = ?AUTO_1740 ?AUTO_1745 ) ) ( not ( = ?AUTO_1741 ?AUTO_1745 ) ) ( not ( = ?AUTO_1740 ?AUTO_1743 ) ) ( not ( = ?AUTO_1741 ?AUTO_1743 ) ) ( not ( = ?AUTO_1745 ?AUTO_1743 ) ) ( ON ?AUTO_1743 ?AUTO_1740 ) ( not ( = ?AUTO_1740 ?AUTO_1744 ) ) ( not ( = ?AUTO_1741 ?AUTO_1744 ) ) ( not ( = ?AUTO_1745 ?AUTO_1744 ) ) ( not ( = ?AUTO_1743 ?AUTO_1744 ) ) ( ON ?AUTO_1744 ?AUTO_1743 ) ( not ( = ?AUTO_1740 ?AUTO_1742 ) ) ( not ( = ?AUTO_1741 ?AUTO_1742 ) ) ( not ( = ?AUTO_1745 ?AUTO_1742 ) ) ( not ( = ?AUTO_1743 ?AUTO_1742 ) ) ( not ( = ?AUTO_1744 ?AUTO_1742 ) ) ( ON ?AUTO_1742 ?AUTO_1744 ) ( CLEAR ?AUTO_1742 ) ( HOLDING ?AUTO_1741 ) ( CLEAR ?AUTO_1746 ) ( not ( = ?AUTO_1740 ?AUTO_1746 ) ) ( not ( = ?AUTO_1741 ?AUTO_1746 ) ) ( not ( = ?AUTO_1745 ?AUTO_1746 ) ) ( not ( = ?AUTO_1743 ?AUTO_1746 ) ) ( not ( = ?AUTO_1744 ?AUTO_1746 ) ) ( not ( = ?AUTO_1742 ?AUTO_1746 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1741 ?AUTO_1746 )
      ( MAKE-ON ?AUTO_1740 ?AUTO_1741 )
      ( MAKE-ON-VERIFY ?AUTO_1740 ?AUTO_1741 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1791 - BLOCK
      ?AUTO_1792 - BLOCK
    )
    :vars
    (
      ?AUTO_1794 - BLOCK
      ?AUTO_1796 - BLOCK
      ?AUTO_1795 - BLOCK
      ?AUTO_1793 - BLOCK
      ?AUTO_1797 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1791 ?AUTO_1792 ) ) ( ON-TABLE ?AUTO_1791 ) ( not ( = ?AUTO_1791 ?AUTO_1794 ) ) ( not ( = ?AUTO_1792 ?AUTO_1794 ) ) ( ON ?AUTO_1792 ?AUTO_1791 ) ( not ( = ?AUTO_1791 ?AUTO_1796 ) ) ( not ( = ?AUTO_1792 ?AUTO_1796 ) ) ( not ( = ?AUTO_1794 ?AUTO_1796 ) ) ( ON ?AUTO_1796 ?AUTO_1792 ) ( not ( = ?AUTO_1791 ?AUTO_1795 ) ) ( not ( = ?AUTO_1792 ?AUTO_1795 ) ) ( not ( = ?AUTO_1794 ?AUTO_1795 ) ) ( not ( = ?AUTO_1796 ?AUTO_1795 ) ) ( ON ?AUTO_1795 ?AUTO_1796 ) ( not ( = ?AUTO_1791 ?AUTO_1793 ) ) ( not ( = ?AUTO_1792 ?AUTO_1793 ) ) ( not ( = ?AUTO_1794 ?AUTO_1793 ) ) ( not ( = ?AUTO_1796 ?AUTO_1793 ) ) ( not ( = ?AUTO_1795 ?AUTO_1793 ) ) ( ON ?AUTO_1793 ?AUTO_1795 ) ( CLEAR ?AUTO_1793 ) ( HOLDING ?AUTO_1794 ) ( CLEAR ?AUTO_1797 ) ( not ( = ?AUTO_1791 ?AUTO_1797 ) ) ( not ( = ?AUTO_1792 ?AUTO_1797 ) ) ( not ( = ?AUTO_1794 ?AUTO_1797 ) ) ( not ( = ?AUTO_1796 ?AUTO_1797 ) ) ( not ( = ?AUTO_1795 ?AUTO_1797 ) ) ( not ( = ?AUTO_1793 ?AUTO_1797 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1794 ?AUTO_1797 )
      ( MAKE-ON ?AUTO_1791 ?AUTO_1792 )
      ( MAKE-ON-VERIFY ?AUTO_1791 ?AUTO_1792 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1946 - BLOCK
      ?AUTO_1947 - BLOCK
    )
    :vars
    (
      ?AUTO_1949 - BLOCK
      ?AUTO_1948 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1946 ?AUTO_1947 ) ) ( not ( = ?AUTO_1946 ?AUTO_1949 ) ) ( not ( = ?AUTO_1947 ?AUTO_1949 ) ) ( ON ?AUTO_1949 ?AUTO_1947 ) ( not ( = ?AUTO_1946 ?AUTO_1948 ) ) ( not ( = ?AUTO_1947 ?AUTO_1948 ) ) ( not ( = ?AUTO_1949 ?AUTO_1948 ) ) ( ON ?AUTO_1948 ?AUTO_1949 ) ( CLEAR ?AUTO_1948 ) ( HOLDING ?AUTO_1946 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1946 )
      ( MAKE-ON ?AUTO_1946 ?AUTO_1947 )
      ( MAKE-ON-VERIFY ?AUTO_1946 ?AUTO_1947 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1950 - BLOCK
      ?AUTO_1951 - BLOCK
    )
    :vars
    (
      ?AUTO_1953 - BLOCK
      ?AUTO_1952 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1950 ?AUTO_1951 ) ) ( not ( = ?AUTO_1950 ?AUTO_1953 ) ) ( not ( = ?AUTO_1951 ?AUTO_1953 ) ) ( ON ?AUTO_1953 ?AUTO_1951 ) ( not ( = ?AUTO_1950 ?AUTO_1952 ) ) ( not ( = ?AUTO_1951 ?AUTO_1952 ) ) ( not ( = ?AUTO_1953 ?AUTO_1952 ) ) ( ON ?AUTO_1952 ?AUTO_1953 ) ( ON ?AUTO_1950 ?AUTO_1952 ) ( CLEAR ?AUTO_1950 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1950 ?AUTO_1952 )
      ( MAKE-ON ?AUTO_1950 ?AUTO_1951 )
      ( MAKE-ON-VERIFY ?AUTO_1950 ?AUTO_1951 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1839 - BLOCK
      ?AUTO_1840 - BLOCK
    )
    :vars
    (
      ?AUTO_1842 - BLOCK
      ?AUTO_1841 - BLOCK
      ?AUTO_1843 - BLOCK
      ?AUTO_1844 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1839 ?AUTO_1840 ) ) ( CLEAR ?AUTO_1842 ) ( not ( = ?AUTO_1839 ?AUTO_1841 ) ) ( not ( = ?AUTO_1839 ?AUTO_1842 ) ) ( not ( = ?AUTO_1840 ?AUTO_1841 ) ) ( not ( = ?AUTO_1840 ?AUTO_1842 ) ) ( not ( = ?AUTO_1841 ?AUTO_1842 ) ) ( ON ?AUTO_1841 ?AUTO_1840 ) ( not ( = ?AUTO_1839 ?AUTO_1843 ) ) ( not ( = ?AUTO_1840 ?AUTO_1843 ) ) ( not ( = ?AUTO_1842 ?AUTO_1843 ) ) ( not ( = ?AUTO_1841 ?AUTO_1843 ) ) ( ON ?AUTO_1843 ?AUTO_1841 ) ( ON ?AUTO_1839 ?AUTO_1843 ) ( CLEAR ?AUTO_1839 ) ( HOLDING ?AUTO_1844 ) ( not ( = ?AUTO_1839 ?AUTO_1844 ) ) ( not ( = ?AUTO_1840 ?AUTO_1844 ) ) ( not ( = ?AUTO_1842 ?AUTO_1844 ) ) ( not ( = ?AUTO_1841 ?AUTO_1844 ) ) ( not ( = ?AUTO_1843 ?AUTO_1844 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1844 )
      ( MAKE-ON ?AUTO_1839 ?AUTO_1840 )
      ( MAKE-ON-VERIFY ?AUTO_1839 ?AUTO_1840 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1845 - BLOCK
      ?AUTO_1846 - BLOCK
    )
    :vars
    (
      ?AUTO_1848 - BLOCK
      ?AUTO_1847 - BLOCK
      ?AUTO_1849 - BLOCK
      ?AUTO_1850 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1845 ?AUTO_1846 ) ) ( CLEAR ?AUTO_1848 ) ( not ( = ?AUTO_1845 ?AUTO_1847 ) ) ( not ( = ?AUTO_1845 ?AUTO_1848 ) ) ( not ( = ?AUTO_1846 ?AUTO_1847 ) ) ( not ( = ?AUTO_1846 ?AUTO_1848 ) ) ( not ( = ?AUTO_1847 ?AUTO_1848 ) ) ( ON ?AUTO_1847 ?AUTO_1846 ) ( not ( = ?AUTO_1845 ?AUTO_1849 ) ) ( not ( = ?AUTO_1846 ?AUTO_1849 ) ) ( not ( = ?AUTO_1848 ?AUTO_1849 ) ) ( not ( = ?AUTO_1847 ?AUTO_1849 ) ) ( ON ?AUTO_1849 ?AUTO_1847 ) ( ON ?AUTO_1845 ?AUTO_1849 ) ( not ( = ?AUTO_1845 ?AUTO_1850 ) ) ( not ( = ?AUTO_1846 ?AUTO_1850 ) ) ( not ( = ?AUTO_1848 ?AUTO_1850 ) ) ( not ( = ?AUTO_1847 ?AUTO_1850 ) ) ( not ( = ?AUTO_1849 ?AUTO_1850 ) ) ( ON ?AUTO_1850 ?AUTO_1845 ) ( CLEAR ?AUTO_1850 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1850 ?AUTO_1845 )
      ( MAKE-ON ?AUTO_1845 ?AUTO_1846 )
      ( MAKE-ON-VERIFY ?AUTO_1845 ?AUTO_1846 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1851 - BLOCK
      ?AUTO_1852 - BLOCK
    )
    :vars
    (
      ?AUTO_1854 - BLOCK
      ?AUTO_1853 - BLOCK
      ?AUTO_1855 - BLOCK
      ?AUTO_1856 - BLOCK
      ?AUTO_1857 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1851 ?AUTO_1852 ) ) ( not ( = ?AUTO_1851 ?AUTO_1854 ) ) ( not ( = ?AUTO_1851 ?AUTO_1853 ) ) ( not ( = ?AUTO_1852 ?AUTO_1854 ) ) ( not ( = ?AUTO_1852 ?AUTO_1853 ) ) ( not ( = ?AUTO_1854 ?AUTO_1853 ) ) ( ON ?AUTO_1854 ?AUTO_1852 ) ( not ( = ?AUTO_1851 ?AUTO_1855 ) ) ( not ( = ?AUTO_1852 ?AUTO_1855 ) ) ( not ( = ?AUTO_1853 ?AUTO_1855 ) ) ( not ( = ?AUTO_1854 ?AUTO_1855 ) ) ( ON ?AUTO_1855 ?AUTO_1854 ) ( ON ?AUTO_1851 ?AUTO_1855 ) ( not ( = ?AUTO_1851 ?AUTO_1856 ) ) ( not ( = ?AUTO_1852 ?AUTO_1856 ) ) ( not ( = ?AUTO_1853 ?AUTO_1856 ) ) ( not ( = ?AUTO_1854 ?AUTO_1856 ) ) ( not ( = ?AUTO_1855 ?AUTO_1856 ) ) ( ON ?AUTO_1856 ?AUTO_1851 ) ( CLEAR ?AUTO_1856 ) ( HOLDING ?AUTO_1853 ) ( CLEAR ?AUTO_1857 ) ( not ( = ?AUTO_1851 ?AUTO_1857 ) ) ( not ( = ?AUTO_1852 ?AUTO_1857 ) ) ( not ( = ?AUTO_1854 ?AUTO_1857 ) ) ( not ( = ?AUTO_1853 ?AUTO_1857 ) ) ( not ( = ?AUTO_1855 ?AUTO_1857 ) ) ( not ( = ?AUTO_1856 ?AUTO_1857 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1853 ?AUTO_1857 )
      ( MAKE-ON ?AUTO_1851 ?AUTO_1852 )
      ( MAKE-ON-VERIFY ?AUTO_1851 ?AUTO_1852 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1911 - BLOCK
      ?AUTO_1912 - BLOCK
    )
    :vars
    (
      ?AUTO_1914 - BLOCK
      ?AUTO_1913 - BLOCK
      ?AUTO_1915 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1911 ?AUTO_1912 ) ) ( ON ?AUTO_1911 ?AUTO_1914 ) ( not ( = ?AUTO_1911 ?AUTO_1914 ) ) ( not ( = ?AUTO_1912 ?AUTO_1914 ) ) ( ON ?AUTO_1912 ?AUTO_1911 ) ( not ( = ?AUTO_1911 ?AUTO_1913 ) ) ( not ( = ?AUTO_1912 ?AUTO_1913 ) ) ( not ( = ?AUTO_1914 ?AUTO_1913 ) ) ( ON ?AUTO_1913 ?AUTO_1912 ) ( CLEAR ?AUTO_1913 ) ( HOLDING ?AUTO_1915 ) ( not ( = ?AUTO_1911 ?AUTO_1915 ) ) ( not ( = ?AUTO_1912 ?AUTO_1915 ) ) ( not ( = ?AUTO_1914 ?AUTO_1915 ) ) ( not ( = ?AUTO_1913 ?AUTO_1915 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1915 )
      ( MAKE-ON ?AUTO_1911 ?AUTO_1912 )
      ( MAKE-ON-VERIFY ?AUTO_1911 ?AUTO_1912 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1916 - BLOCK
      ?AUTO_1917 - BLOCK
    )
    :vars
    (
      ?AUTO_1919 - BLOCK
      ?AUTO_1918 - BLOCK
      ?AUTO_1920 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1916 ?AUTO_1917 ) ) ( ON ?AUTO_1916 ?AUTO_1919 ) ( not ( = ?AUTO_1916 ?AUTO_1919 ) ) ( not ( = ?AUTO_1917 ?AUTO_1919 ) ) ( ON ?AUTO_1917 ?AUTO_1916 ) ( not ( = ?AUTO_1916 ?AUTO_1918 ) ) ( not ( = ?AUTO_1917 ?AUTO_1918 ) ) ( not ( = ?AUTO_1919 ?AUTO_1918 ) ) ( ON ?AUTO_1918 ?AUTO_1917 ) ( not ( = ?AUTO_1916 ?AUTO_1920 ) ) ( not ( = ?AUTO_1917 ?AUTO_1920 ) ) ( not ( = ?AUTO_1919 ?AUTO_1920 ) ) ( not ( = ?AUTO_1918 ?AUTO_1920 ) ) ( ON ?AUTO_1920 ?AUTO_1918 ) ( CLEAR ?AUTO_1920 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1920 ?AUTO_1918 )
      ( MAKE-ON ?AUTO_1916 ?AUTO_1917 )
      ( MAKE-ON-VERIFY ?AUTO_1916 ?AUTO_1917 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3244 - BLOCK
      ?AUTO_3245 - BLOCK
    )
    :vars
    (
      ?AUTO_3247 - BLOCK
      ?AUTO_3249 - BLOCK
      ?AUTO_3248 - BLOCK
      ?AUTO_3246 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3244 ?AUTO_3245 ) ) ( ON ?AUTO_3244 ?AUTO_3247 ) ( CLEAR ?AUTO_3244 ) ( not ( = ?AUTO_3244 ?AUTO_3247 ) ) ( not ( = ?AUTO_3245 ?AUTO_3247 ) ) ( not ( = ?AUTO_3244 ?AUTO_3249 ) ) ( not ( = ?AUTO_3244 ?AUTO_3248 ) ) ( not ( = ?AUTO_3245 ?AUTO_3249 ) ) ( not ( = ?AUTO_3245 ?AUTO_3248 ) ) ( not ( = ?AUTO_3247 ?AUTO_3249 ) ) ( not ( = ?AUTO_3247 ?AUTO_3248 ) ) ( not ( = ?AUTO_3249 ?AUTO_3248 ) ) ( ON ?AUTO_3249 ?AUTO_3245 ) ( not ( = ?AUTO_3244 ?AUTO_3246 ) ) ( not ( = ?AUTO_3245 ?AUTO_3246 ) ) ( not ( = ?AUTO_3247 ?AUTO_3246 ) ) ( not ( = ?AUTO_3248 ?AUTO_3246 ) ) ( not ( = ?AUTO_3249 ?AUTO_3246 ) ) ( ON ?AUTO_3246 ?AUTO_3249 ) ( ON ?AUTO_3248 ?AUTO_3246 ) ( CLEAR ?AUTO_3248 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3248 ?AUTO_3246 )
      ( MAKE-ON ?AUTO_3244 ?AUTO_3245 )
      ( MAKE-ON-VERIFY ?AUTO_3244 ?AUTO_3245 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3250 - BLOCK
      ?AUTO_3251 - BLOCK
    )
    :vars
    (
      ?AUTO_3254 - BLOCK
      ?AUTO_3252 - BLOCK
      ?AUTO_3255 - BLOCK
      ?AUTO_3253 - BLOCK
      ?AUTO_3256 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3250 ?AUTO_3251 ) ) ( ON ?AUTO_3250 ?AUTO_3254 ) ( CLEAR ?AUTO_3250 ) ( not ( = ?AUTO_3250 ?AUTO_3254 ) ) ( not ( = ?AUTO_3251 ?AUTO_3254 ) ) ( not ( = ?AUTO_3250 ?AUTO_3252 ) ) ( not ( = ?AUTO_3250 ?AUTO_3255 ) ) ( not ( = ?AUTO_3251 ?AUTO_3252 ) ) ( not ( = ?AUTO_3251 ?AUTO_3255 ) ) ( not ( = ?AUTO_3254 ?AUTO_3252 ) ) ( not ( = ?AUTO_3254 ?AUTO_3255 ) ) ( not ( = ?AUTO_3252 ?AUTO_3255 ) ) ( ON ?AUTO_3252 ?AUTO_3251 ) ( not ( = ?AUTO_3250 ?AUTO_3253 ) ) ( not ( = ?AUTO_3251 ?AUTO_3253 ) ) ( not ( = ?AUTO_3254 ?AUTO_3253 ) ) ( not ( = ?AUTO_3255 ?AUTO_3253 ) ) ( not ( = ?AUTO_3252 ?AUTO_3253 ) ) ( ON ?AUTO_3253 ?AUTO_3252 ) ( ON ?AUTO_3255 ?AUTO_3253 ) ( CLEAR ?AUTO_3255 ) ( HOLDING ?AUTO_3256 ) ( not ( = ?AUTO_3250 ?AUTO_3256 ) ) ( not ( = ?AUTO_3251 ?AUTO_3256 ) ) ( not ( = ?AUTO_3254 ?AUTO_3256 ) ) ( not ( = ?AUTO_3252 ?AUTO_3256 ) ) ( not ( = ?AUTO_3255 ?AUTO_3256 ) ) ( not ( = ?AUTO_3253 ?AUTO_3256 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3256 )
      ( MAKE-ON ?AUTO_3250 ?AUTO_3251 )
      ( MAKE-ON-VERIFY ?AUTO_3250 ?AUTO_3251 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3257 - BLOCK
      ?AUTO_3258 - BLOCK
    )
    :vars
    (
      ?AUTO_3263 - BLOCK
      ?AUTO_3260 - BLOCK
      ?AUTO_3259 - BLOCK
      ?AUTO_3261 - BLOCK
      ?AUTO_3262 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3257 ?AUTO_3258 ) ) ( ON ?AUTO_3257 ?AUTO_3263 ) ( CLEAR ?AUTO_3257 ) ( not ( = ?AUTO_3257 ?AUTO_3263 ) ) ( not ( = ?AUTO_3258 ?AUTO_3263 ) ) ( not ( = ?AUTO_3257 ?AUTO_3260 ) ) ( not ( = ?AUTO_3257 ?AUTO_3259 ) ) ( not ( = ?AUTO_3258 ?AUTO_3260 ) ) ( not ( = ?AUTO_3258 ?AUTO_3259 ) ) ( not ( = ?AUTO_3263 ?AUTO_3260 ) ) ( not ( = ?AUTO_3263 ?AUTO_3259 ) ) ( not ( = ?AUTO_3260 ?AUTO_3259 ) ) ( ON ?AUTO_3260 ?AUTO_3258 ) ( not ( = ?AUTO_3257 ?AUTO_3261 ) ) ( not ( = ?AUTO_3258 ?AUTO_3261 ) ) ( not ( = ?AUTO_3263 ?AUTO_3261 ) ) ( not ( = ?AUTO_3259 ?AUTO_3261 ) ) ( not ( = ?AUTO_3260 ?AUTO_3261 ) ) ( ON ?AUTO_3261 ?AUTO_3260 ) ( ON ?AUTO_3259 ?AUTO_3261 ) ( not ( = ?AUTO_3257 ?AUTO_3262 ) ) ( not ( = ?AUTO_3258 ?AUTO_3262 ) ) ( not ( = ?AUTO_3263 ?AUTO_3262 ) ) ( not ( = ?AUTO_3260 ?AUTO_3262 ) ) ( not ( = ?AUTO_3259 ?AUTO_3262 ) ) ( not ( = ?AUTO_3261 ?AUTO_3262 ) ) ( ON ?AUTO_3262 ?AUTO_3259 ) ( CLEAR ?AUTO_3262 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3262 ?AUTO_3259 )
      ( MAKE-ON ?AUTO_3257 ?AUTO_3258 )
      ( MAKE-ON-VERIFY ?AUTO_3257 ?AUTO_3258 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2388 - BLOCK
      ?AUTO_2389 - BLOCK
    )
    :vars
    (
      ?AUTO_2391 - BLOCK
      ?AUTO_2393 - BLOCK
      ?AUTO_2390 - BLOCK
      ?AUTO_2392 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2388 ?AUTO_2389 ) ) ( ON-TABLE ?AUTO_2388 ) ( not ( = ?AUTO_2388 ?AUTO_2391 ) ) ( not ( = ?AUTO_2388 ?AUTO_2393 ) ) ( not ( = ?AUTO_2389 ?AUTO_2391 ) ) ( not ( = ?AUTO_2389 ?AUTO_2393 ) ) ( not ( = ?AUTO_2391 ?AUTO_2393 ) ) ( CLEAR ?AUTO_2390 ) ( not ( = ?AUTO_2388 ?AUTO_2390 ) ) ( not ( = ?AUTO_2389 ?AUTO_2390 ) ) ( not ( = ?AUTO_2391 ?AUTO_2390 ) ) ( not ( = ?AUTO_2393 ?AUTO_2390 ) ) ( ON ?AUTO_2393 ?AUTO_2389 ) ( not ( = ?AUTO_2388 ?AUTO_2392 ) ) ( not ( = ?AUTO_2389 ?AUTO_2392 ) ) ( not ( = ?AUTO_2391 ?AUTO_2392 ) ) ( not ( = ?AUTO_2393 ?AUTO_2392 ) ) ( not ( = ?AUTO_2390 ?AUTO_2392 ) ) ( ON ?AUTO_2392 ?AUTO_2393 ) ( CLEAR ?AUTO_2392 ) ( HOLDING ?AUTO_2391 ) ( CLEAR ?AUTO_2388 ) )
    :subtasks
    ( ( !STACK ?AUTO_2391 ?AUTO_2388 )
      ( MAKE-ON ?AUTO_2388 ?AUTO_2389 )
      ( MAKE-ON-VERIFY ?AUTO_2388 ?AUTO_2389 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2400 - BLOCK
      ?AUTO_2401 - BLOCK
    )
    :vars
    (
      ?AUTO_2403 - BLOCK
      ?AUTO_2402 - BLOCK
      ?AUTO_2404 - BLOCK
      ?AUTO_2405 - BLOCK
      ?AUTO_2406 - BLOCK
      ?AUTO_2407 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2400 ?AUTO_2401 ) ) ( ON-TABLE ?AUTO_2400 ) ( not ( = ?AUTO_2400 ?AUTO_2403 ) ) ( not ( = ?AUTO_2400 ?AUTO_2402 ) ) ( not ( = ?AUTO_2401 ?AUTO_2403 ) ) ( not ( = ?AUTO_2401 ?AUTO_2402 ) ) ( not ( = ?AUTO_2403 ?AUTO_2402 ) ) ( CLEAR ?AUTO_2404 ) ( not ( = ?AUTO_2400 ?AUTO_2404 ) ) ( not ( = ?AUTO_2401 ?AUTO_2404 ) ) ( not ( = ?AUTO_2403 ?AUTO_2404 ) ) ( not ( = ?AUTO_2402 ?AUTO_2404 ) ) ( ON ?AUTO_2402 ?AUTO_2401 ) ( not ( = ?AUTO_2400 ?AUTO_2405 ) ) ( not ( = ?AUTO_2401 ?AUTO_2405 ) ) ( not ( = ?AUTO_2403 ?AUTO_2405 ) ) ( not ( = ?AUTO_2402 ?AUTO_2405 ) ) ( not ( = ?AUTO_2404 ?AUTO_2405 ) ) ( ON ?AUTO_2405 ?AUTO_2402 ) ( CLEAR ?AUTO_2400 ) ( ON ?AUTO_2403 ?AUTO_2405 ) ( CLEAR ?AUTO_2403 ) ( HOLDING ?AUTO_2406 ) ( CLEAR ?AUTO_2407 ) ( not ( = ?AUTO_2400 ?AUTO_2406 ) ) ( not ( = ?AUTO_2400 ?AUTO_2407 ) ) ( not ( = ?AUTO_2401 ?AUTO_2406 ) ) ( not ( = ?AUTO_2401 ?AUTO_2407 ) ) ( not ( = ?AUTO_2403 ?AUTO_2406 ) ) ( not ( = ?AUTO_2403 ?AUTO_2407 ) ) ( not ( = ?AUTO_2402 ?AUTO_2406 ) ) ( not ( = ?AUTO_2402 ?AUTO_2407 ) ) ( not ( = ?AUTO_2404 ?AUTO_2406 ) ) ( not ( = ?AUTO_2404 ?AUTO_2407 ) ) ( not ( = ?AUTO_2405 ?AUTO_2406 ) ) ( not ( = ?AUTO_2405 ?AUTO_2407 ) ) ( not ( = ?AUTO_2406 ?AUTO_2407 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2406 ?AUTO_2407 )
      ( MAKE-ON ?AUTO_2400 ?AUTO_2401 )
      ( MAKE-ON-VERIFY ?AUTO_2400 ?AUTO_2401 ) )
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
      ?AUTO_2422 - BLOCK
      ?AUTO_2423 - BLOCK
      ?AUTO_2419 - BLOCK
      ?AUTO_2421 - BLOCK
      ?AUTO_2420 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2416 ?AUTO_2417 ) ) ( ON-TABLE ?AUTO_2416 ) ( not ( = ?AUTO_2416 ?AUTO_2418 ) ) ( not ( = ?AUTO_2416 ?AUTO_2422 ) ) ( not ( = ?AUTO_2417 ?AUTO_2418 ) ) ( not ( = ?AUTO_2417 ?AUTO_2422 ) ) ( not ( = ?AUTO_2418 ?AUTO_2422 ) ) ( CLEAR ?AUTO_2423 ) ( not ( = ?AUTO_2416 ?AUTO_2423 ) ) ( not ( = ?AUTO_2417 ?AUTO_2423 ) ) ( not ( = ?AUTO_2418 ?AUTO_2423 ) ) ( not ( = ?AUTO_2422 ?AUTO_2423 ) ) ( ON ?AUTO_2422 ?AUTO_2417 ) ( not ( = ?AUTO_2416 ?AUTO_2419 ) ) ( not ( = ?AUTO_2417 ?AUTO_2419 ) ) ( not ( = ?AUTO_2418 ?AUTO_2419 ) ) ( not ( = ?AUTO_2422 ?AUTO_2419 ) ) ( not ( = ?AUTO_2423 ?AUTO_2419 ) ) ( ON ?AUTO_2419 ?AUTO_2422 ) ( ON ?AUTO_2418 ?AUTO_2419 ) ( CLEAR ?AUTO_2418 ) ( CLEAR ?AUTO_2421 ) ( not ( = ?AUTO_2416 ?AUTO_2420 ) ) ( not ( = ?AUTO_2416 ?AUTO_2421 ) ) ( not ( = ?AUTO_2417 ?AUTO_2420 ) ) ( not ( = ?AUTO_2417 ?AUTO_2421 ) ) ( not ( = ?AUTO_2418 ?AUTO_2420 ) ) ( not ( = ?AUTO_2418 ?AUTO_2421 ) ) ( not ( = ?AUTO_2422 ?AUTO_2420 ) ) ( not ( = ?AUTO_2422 ?AUTO_2421 ) ) ( not ( = ?AUTO_2423 ?AUTO_2420 ) ) ( not ( = ?AUTO_2423 ?AUTO_2421 ) ) ( not ( = ?AUTO_2419 ?AUTO_2420 ) ) ( not ( = ?AUTO_2419 ?AUTO_2421 ) ) ( not ( = ?AUTO_2420 ?AUTO_2421 ) ) ( ON ?AUTO_2420 ?AUTO_2416 ) ( CLEAR ?AUTO_2420 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2420 ?AUTO_2416 )
      ( MAKE-ON ?AUTO_2416 ?AUTO_2417 )
      ( MAKE-ON-VERIFY ?AUTO_2416 ?AUTO_2417 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2424 - BLOCK
      ?AUTO_2425 - BLOCK
    )
    :vars
    (
      ?AUTO_2428 - BLOCK
      ?AUTO_2430 - BLOCK
      ?AUTO_2431 - BLOCK
      ?AUTO_2426 - BLOCK
      ?AUTO_2427 - BLOCK
      ?AUTO_2429 - BLOCK
      ?AUTO_2432 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2424 ?AUTO_2425 ) ) ( ON-TABLE ?AUTO_2424 ) ( not ( = ?AUTO_2424 ?AUTO_2428 ) ) ( not ( = ?AUTO_2424 ?AUTO_2430 ) ) ( not ( = ?AUTO_2425 ?AUTO_2428 ) ) ( not ( = ?AUTO_2425 ?AUTO_2430 ) ) ( not ( = ?AUTO_2428 ?AUTO_2430 ) ) ( CLEAR ?AUTO_2431 ) ( not ( = ?AUTO_2424 ?AUTO_2431 ) ) ( not ( = ?AUTO_2425 ?AUTO_2431 ) ) ( not ( = ?AUTO_2428 ?AUTO_2431 ) ) ( not ( = ?AUTO_2430 ?AUTO_2431 ) ) ( ON ?AUTO_2430 ?AUTO_2425 ) ( not ( = ?AUTO_2424 ?AUTO_2426 ) ) ( not ( = ?AUTO_2425 ?AUTO_2426 ) ) ( not ( = ?AUTO_2428 ?AUTO_2426 ) ) ( not ( = ?AUTO_2430 ?AUTO_2426 ) ) ( not ( = ?AUTO_2431 ?AUTO_2426 ) ) ( ON ?AUTO_2426 ?AUTO_2430 ) ( ON ?AUTO_2428 ?AUTO_2426 ) ( CLEAR ?AUTO_2428 ) ( CLEAR ?AUTO_2427 ) ( not ( = ?AUTO_2424 ?AUTO_2429 ) ) ( not ( = ?AUTO_2424 ?AUTO_2427 ) ) ( not ( = ?AUTO_2425 ?AUTO_2429 ) ) ( not ( = ?AUTO_2425 ?AUTO_2427 ) ) ( not ( = ?AUTO_2428 ?AUTO_2429 ) ) ( not ( = ?AUTO_2428 ?AUTO_2427 ) ) ( not ( = ?AUTO_2430 ?AUTO_2429 ) ) ( not ( = ?AUTO_2430 ?AUTO_2427 ) ) ( not ( = ?AUTO_2431 ?AUTO_2429 ) ) ( not ( = ?AUTO_2431 ?AUTO_2427 ) ) ( not ( = ?AUTO_2426 ?AUTO_2429 ) ) ( not ( = ?AUTO_2426 ?AUTO_2427 ) ) ( not ( = ?AUTO_2429 ?AUTO_2427 ) ) ( ON ?AUTO_2429 ?AUTO_2424 ) ( CLEAR ?AUTO_2429 ) ( HOLDING ?AUTO_2432 ) ( not ( = ?AUTO_2424 ?AUTO_2432 ) ) ( not ( = ?AUTO_2425 ?AUTO_2432 ) ) ( not ( = ?AUTO_2428 ?AUTO_2432 ) ) ( not ( = ?AUTO_2430 ?AUTO_2432 ) ) ( not ( = ?AUTO_2431 ?AUTO_2432 ) ) ( not ( = ?AUTO_2426 ?AUTO_2432 ) ) ( not ( = ?AUTO_2427 ?AUTO_2432 ) ) ( not ( = ?AUTO_2429 ?AUTO_2432 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2432 )
      ( MAKE-ON ?AUTO_2424 ?AUTO_2425 )
      ( MAKE-ON-VERIFY ?AUTO_2424 ?AUTO_2425 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2433 - BLOCK
      ?AUTO_2434 - BLOCK
    )
    :vars
    (
      ?AUTO_2439 - BLOCK
      ?AUTO_2441 - BLOCK
      ?AUTO_2440 - BLOCK
      ?AUTO_2438 - BLOCK
      ?AUTO_2435 - BLOCK
      ?AUTO_2436 - BLOCK
      ?AUTO_2437 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2433 ?AUTO_2434 ) ) ( ON-TABLE ?AUTO_2433 ) ( not ( = ?AUTO_2433 ?AUTO_2439 ) ) ( not ( = ?AUTO_2433 ?AUTO_2441 ) ) ( not ( = ?AUTO_2434 ?AUTO_2439 ) ) ( not ( = ?AUTO_2434 ?AUTO_2441 ) ) ( not ( = ?AUTO_2439 ?AUTO_2441 ) ) ( CLEAR ?AUTO_2440 ) ( not ( = ?AUTO_2433 ?AUTO_2440 ) ) ( not ( = ?AUTO_2434 ?AUTO_2440 ) ) ( not ( = ?AUTO_2439 ?AUTO_2440 ) ) ( not ( = ?AUTO_2441 ?AUTO_2440 ) ) ( ON ?AUTO_2441 ?AUTO_2434 ) ( not ( = ?AUTO_2433 ?AUTO_2438 ) ) ( not ( = ?AUTO_2434 ?AUTO_2438 ) ) ( not ( = ?AUTO_2439 ?AUTO_2438 ) ) ( not ( = ?AUTO_2441 ?AUTO_2438 ) ) ( not ( = ?AUTO_2440 ?AUTO_2438 ) ) ( ON ?AUTO_2438 ?AUTO_2441 ) ( ON ?AUTO_2439 ?AUTO_2438 ) ( CLEAR ?AUTO_2439 ) ( CLEAR ?AUTO_2435 ) ( not ( = ?AUTO_2433 ?AUTO_2436 ) ) ( not ( = ?AUTO_2433 ?AUTO_2435 ) ) ( not ( = ?AUTO_2434 ?AUTO_2436 ) ) ( not ( = ?AUTO_2434 ?AUTO_2435 ) ) ( not ( = ?AUTO_2439 ?AUTO_2436 ) ) ( not ( = ?AUTO_2439 ?AUTO_2435 ) ) ( not ( = ?AUTO_2441 ?AUTO_2436 ) ) ( not ( = ?AUTO_2441 ?AUTO_2435 ) ) ( not ( = ?AUTO_2440 ?AUTO_2436 ) ) ( not ( = ?AUTO_2440 ?AUTO_2435 ) ) ( not ( = ?AUTO_2438 ?AUTO_2436 ) ) ( not ( = ?AUTO_2438 ?AUTO_2435 ) ) ( not ( = ?AUTO_2436 ?AUTO_2435 ) ) ( ON ?AUTO_2436 ?AUTO_2433 ) ( not ( = ?AUTO_2433 ?AUTO_2437 ) ) ( not ( = ?AUTO_2434 ?AUTO_2437 ) ) ( not ( = ?AUTO_2439 ?AUTO_2437 ) ) ( not ( = ?AUTO_2441 ?AUTO_2437 ) ) ( not ( = ?AUTO_2440 ?AUTO_2437 ) ) ( not ( = ?AUTO_2438 ?AUTO_2437 ) ) ( not ( = ?AUTO_2435 ?AUTO_2437 ) ) ( not ( = ?AUTO_2436 ?AUTO_2437 ) ) ( ON ?AUTO_2437 ?AUTO_2436 ) ( CLEAR ?AUTO_2437 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2437 ?AUTO_2436 )
      ( MAKE-ON ?AUTO_2433 ?AUTO_2434 )
      ( MAKE-ON-VERIFY ?AUTO_2433 ?AUTO_2434 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2442 - BLOCK
      ?AUTO_2443 - BLOCK
    )
    :vars
    (
      ?AUTO_2447 - BLOCK
      ?AUTO_2445 - BLOCK
      ?AUTO_2446 - BLOCK
      ?AUTO_2448 - BLOCK
      ?AUTO_2444 - BLOCK
      ?AUTO_2450 - BLOCK
      ?AUTO_2449 - BLOCK
      ?AUTO_2451 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2442 ?AUTO_2443 ) ) ( ON-TABLE ?AUTO_2442 ) ( not ( = ?AUTO_2442 ?AUTO_2447 ) ) ( not ( = ?AUTO_2442 ?AUTO_2445 ) ) ( not ( = ?AUTO_2443 ?AUTO_2447 ) ) ( not ( = ?AUTO_2443 ?AUTO_2445 ) ) ( not ( = ?AUTO_2447 ?AUTO_2445 ) ) ( CLEAR ?AUTO_2446 ) ( not ( = ?AUTO_2442 ?AUTO_2446 ) ) ( not ( = ?AUTO_2443 ?AUTO_2446 ) ) ( not ( = ?AUTO_2447 ?AUTO_2446 ) ) ( not ( = ?AUTO_2445 ?AUTO_2446 ) ) ( ON ?AUTO_2445 ?AUTO_2443 ) ( not ( = ?AUTO_2442 ?AUTO_2448 ) ) ( not ( = ?AUTO_2443 ?AUTO_2448 ) ) ( not ( = ?AUTO_2447 ?AUTO_2448 ) ) ( not ( = ?AUTO_2445 ?AUTO_2448 ) ) ( not ( = ?AUTO_2446 ?AUTO_2448 ) ) ( ON ?AUTO_2448 ?AUTO_2445 ) ( ON ?AUTO_2447 ?AUTO_2448 ) ( CLEAR ?AUTO_2447 ) ( CLEAR ?AUTO_2444 ) ( not ( = ?AUTO_2442 ?AUTO_2450 ) ) ( not ( = ?AUTO_2442 ?AUTO_2444 ) ) ( not ( = ?AUTO_2443 ?AUTO_2450 ) ) ( not ( = ?AUTO_2443 ?AUTO_2444 ) ) ( not ( = ?AUTO_2447 ?AUTO_2450 ) ) ( not ( = ?AUTO_2447 ?AUTO_2444 ) ) ( not ( = ?AUTO_2445 ?AUTO_2450 ) ) ( not ( = ?AUTO_2445 ?AUTO_2444 ) ) ( not ( = ?AUTO_2446 ?AUTO_2450 ) ) ( not ( = ?AUTO_2446 ?AUTO_2444 ) ) ( not ( = ?AUTO_2448 ?AUTO_2450 ) ) ( not ( = ?AUTO_2448 ?AUTO_2444 ) ) ( not ( = ?AUTO_2450 ?AUTO_2444 ) ) ( ON ?AUTO_2450 ?AUTO_2442 ) ( not ( = ?AUTO_2442 ?AUTO_2449 ) ) ( not ( = ?AUTO_2443 ?AUTO_2449 ) ) ( not ( = ?AUTO_2447 ?AUTO_2449 ) ) ( not ( = ?AUTO_2445 ?AUTO_2449 ) ) ( not ( = ?AUTO_2446 ?AUTO_2449 ) ) ( not ( = ?AUTO_2448 ?AUTO_2449 ) ) ( not ( = ?AUTO_2444 ?AUTO_2449 ) ) ( not ( = ?AUTO_2450 ?AUTO_2449 ) ) ( ON ?AUTO_2449 ?AUTO_2450 ) ( CLEAR ?AUTO_2449 ) ( HOLDING ?AUTO_2451 ) ( not ( = ?AUTO_2442 ?AUTO_2451 ) ) ( not ( = ?AUTO_2443 ?AUTO_2451 ) ) ( not ( = ?AUTO_2447 ?AUTO_2451 ) ) ( not ( = ?AUTO_2445 ?AUTO_2451 ) ) ( not ( = ?AUTO_2446 ?AUTO_2451 ) ) ( not ( = ?AUTO_2448 ?AUTO_2451 ) ) ( not ( = ?AUTO_2444 ?AUTO_2451 ) ) ( not ( = ?AUTO_2450 ?AUTO_2451 ) ) ( not ( = ?AUTO_2449 ?AUTO_2451 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2451 )
      ( MAKE-ON ?AUTO_2442 ?AUTO_2443 )
      ( MAKE-ON-VERIFY ?AUTO_2442 ?AUTO_2443 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2452 - BLOCK
      ?AUTO_2453 - BLOCK
    )
    :vars
    (
      ?AUTO_2458 - BLOCK
      ?AUTO_2461 - BLOCK
      ?AUTO_2456 - BLOCK
      ?AUTO_2454 - BLOCK
      ?AUTO_2460 - BLOCK
      ?AUTO_2459 - BLOCK
      ?AUTO_2455 - BLOCK
      ?AUTO_2457 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2452 ?AUTO_2453 ) ) ( ON-TABLE ?AUTO_2452 ) ( not ( = ?AUTO_2452 ?AUTO_2458 ) ) ( not ( = ?AUTO_2452 ?AUTO_2461 ) ) ( not ( = ?AUTO_2453 ?AUTO_2458 ) ) ( not ( = ?AUTO_2453 ?AUTO_2461 ) ) ( not ( = ?AUTO_2458 ?AUTO_2461 ) ) ( CLEAR ?AUTO_2456 ) ( not ( = ?AUTO_2452 ?AUTO_2456 ) ) ( not ( = ?AUTO_2453 ?AUTO_2456 ) ) ( not ( = ?AUTO_2458 ?AUTO_2456 ) ) ( not ( = ?AUTO_2461 ?AUTO_2456 ) ) ( ON ?AUTO_2461 ?AUTO_2453 ) ( not ( = ?AUTO_2452 ?AUTO_2454 ) ) ( not ( = ?AUTO_2453 ?AUTO_2454 ) ) ( not ( = ?AUTO_2458 ?AUTO_2454 ) ) ( not ( = ?AUTO_2461 ?AUTO_2454 ) ) ( not ( = ?AUTO_2456 ?AUTO_2454 ) ) ( ON ?AUTO_2454 ?AUTO_2461 ) ( ON ?AUTO_2458 ?AUTO_2454 ) ( CLEAR ?AUTO_2458 ) ( CLEAR ?AUTO_2460 ) ( not ( = ?AUTO_2452 ?AUTO_2459 ) ) ( not ( = ?AUTO_2452 ?AUTO_2460 ) ) ( not ( = ?AUTO_2453 ?AUTO_2459 ) ) ( not ( = ?AUTO_2453 ?AUTO_2460 ) ) ( not ( = ?AUTO_2458 ?AUTO_2459 ) ) ( not ( = ?AUTO_2458 ?AUTO_2460 ) ) ( not ( = ?AUTO_2461 ?AUTO_2459 ) ) ( not ( = ?AUTO_2461 ?AUTO_2460 ) ) ( not ( = ?AUTO_2456 ?AUTO_2459 ) ) ( not ( = ?AUTO_2456 ?AUTO_2460 ) ) ( not ( = ?AUTO_2454 ?AUTO_2459 ) ) ( not ( = ?AUTO_2454 ?AUTO_2460 ) ) ( not ( = ?AUTO_2459 ?AUTO_2460 ) ) ( ON ?AUTO_2459 ?AUTO_2452 ) ( not ( = ?AUTO_2452 ?AUTO_2455 ) ) ( not ( = ?AUTO_2453 ?AUTO_2455 ) ) ( not ( = ?AUTO_2458 ?AUTO_2455 ) ) ( not ( = ?AUTO_2461 ?AUTO_2455 ) ) ( not ( = ?AUTO_2456 ?AUTO_2455 ) ) ( not ( = ?AUTO_2454 ?AUTO_2455 ) ) ( not ( = ?AUTO_2460 ?AUTO_2455 ) ) ( not ( = ?AUTO_2459 ?AUTO_2455 ) ) ( ON ?AUTO_2455 ?AUTO_2459 ) ( not ( = ?AUTO_2452 ?AUTO_2457 ) ) ( not ( = ?AUTO_2453 ?AUTO_2457 ) ) ( not ( = ?AUTO_2458 ?AUTO_2457 ) ) ( not ( = ?AUTO_2461 ?AUTO_2457 ) ) ( not ( = ?AUTO_2456 ?AUTO_2457 ) ) ( not ( = ?AUTO_2454 ?AUTO_2457 ) ) ( not ( = ?AUTO_2460 ?AUTO_2457 ) ) ( not ( = ?AUTO_2459 ?AUTO_2457 ) ) ( not ( = ?AUTO_2455 ?AUTO_2457 ) ) ( ON ?AUTO_2457 ?AUTO_2455 ) ( CLEAR ?AUTO_2457 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2457 ?AUTO_2455 )
      ( MAKE-ON ?AUTO_2452 ?AUTO_2453 )
      ( MAKE-ON-VERIFY ?AUTO_2452 ?AUTO_2453 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2462 - BLOCK
      ?AUTO_2463 - BLOCK
    )
    :vars
    (
      ?AUTO_2469 - BLOCK
      ?AUTO_2466 - BLOCK
      ?AUTO_2471 - BLOCK
      ?AUTO_2465 - BLOCK
      ?AUTO_2468 - BLOCK
      ?AUTO_2464 - BLOCK
      ?AUTO_2467 - BLOCK
      ?AUTO_2470 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2462 ?AUTO_2463 ) ) ( ON-TABLE ?AUTO_2462 ) ( not ( = ?AUTO_2462 ?AUTO_2469 ) ) ( not ( = ?AUTO_2462 ?AUTO_2466 ) ) ( not ( = ?AUTO_2463 ?AUTO_2469 ) ) ( not ( = ?AUTO_2463 ?AUTO_2466 ) ) ( not ( = ?AUTO_2469 ?AUTO_2466 ) ) ( not ( = ?AUTO_2462 ?AUTO_2471 ) ) ( not ( = ?AUTO_2463 ?AUTO_2471 ) ) ( not ( = ?AUTO_2469 ?AUTO_2471 ) ) ( not ( = ?AUTO_2466 ?AUTO_2471 ) ) ( ON ?AUTO_2466 ?AUTO_2463 ) ( not ( = ?AUTO_2462 ?AUTO_2465 ) ) ( not ( = ?AUTO_2463 ?AUTO_2465 ) ) ( not ( = ?AUTO_2469 ?AUTO_2465 ) ) ( not ( = ?AUTO_2466 ?AUTO_2465 ) ) ( not ( = ?AUTO_2471 ?AUTO_2465 ) ) ( ON ?AUTO_2465 ?AUTO_2466 ) ( ON ?AUTO_2469 ?AUTO_2465 ) ( CLEAR ?AUTO_2469 ) ( CLEAR ?AUTO_2468 ) ( not ( = ?AUTO_2462 ?AUTO_2464 ) ) ( not ( = ?AUTO_2462 ?AUTO_2468 ) ) ( not ( = ?AUTO_2463 ?AUTO_2464 ) ) ( not ( = ?AUTO_2463 ?AUTO_2468 ) ) ( not ( = ?AUTO_2469 ?AUTO_2464 ) ) ( not ( = ?AUTO_2469 ?AUTO_2468 ) ) ( not ( = ?AUTO_2466 ?AUTO_2464 ) ) ( not ( = ?AUTO_2466 ?AUTO_2468 ) ) ( not ( = ?AUTO_2471 ?AUTO_2464 ) ) ( not ( = ?AUTO_2471 ?AUTO_2468 ) ) ( not ( = ?AUTO_2465 ?AUTO_2464 ) ) ( not ( = ?AUTO_2465 ?AUTO_2468 ) ) ( not ( = ?AUTO_2464 ?AUTO_2468 ) ) ( ON ?AUTO_2464 ?AUTO_2462 ) ( not ( = ?AUTO_2462 ?AUTO_2467 ) ) ( not ( = ?AUTO_2463 ?AUTO_2467 ) ) ( not ( = ?AUTO_2469 ?AUTO_2467 ) ) ( not ( = ?AUTO_2466 ?AUTO_2467 ) ) ( not ( = ?AUTO_2471 ?AUTO_2467 ) ) ( not ( = ?AUTO_2465 ?AUTO_2467 ) ) ( not ( = ?AUTO_2468 ?AUTO_2467 ) ) ( not ( = ?AUTO_2464 ?AUTO_2467 ) ) ( ON ?AUTO_2467 ?AUTO_2464 ) ( not ( = ?AUTO_2462 ?AUTO_2470 ) ) ( not ( = ?AUTO_2463 ?AUTO_2470 ) ) ( not ( = ?AUTO_2469 ?AUTO_2470 ) ) ( not ( = ?AUTO_2466 ?AUTO_2470 ) ) ( not ( = ?AUTO_2471 ?AUTO_2470 ) ) ( not ( = ?AUTO_2465 ?AUTO_2470 ) ) ( not ( = ?AUTO_2468 ?AUTO_2470 ) ) ( not ( = ?AUTO_2464 ?AUTO_2470 ) ) ( not ( = ?AUTO_2467 ?AUTO_2470 ) ) ( ON ?AUTO_2470 ?AUTO_2467 ) ( CLEAR ?AUTO_2470 ) ( HOLDING ?AUTO_2471 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2471 )
      ( MAKE-ON ?AUTO_2462 ?AUTO_2463 )
      ( MAKE-ON-VERIFY ?AUTO_2462 ?AUTO_2463 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2472 - BLOCK
      ?AUTO_2473 - BLOCK
    )
    :vars
    (
      ?AUTO_2478 - BLOCK
      ?AUTO_2475 - BLOCK
      ?AUTO_2474 - BLOCK
      ?AUTO_2481 - BLOCK
      ?AUTO_2479 - BLOCK
      ?AUTO_2480 - BLOCK
      ?AUTO_2476 - BLOCK
      ?AUTO_2477 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2472 ?AUTO_2473 ) ) ( ON-TABLE ?AUTO_2472 ) ( not ( = ?AUTO_2472 ?AUTO_2478 ) ) ( not ( = ?AUTO_2472 ?AUTO_2475 ) ) ( not ( = ?AUTO_2473 ?AUTO_2478 ) ) ( not ( = ?AUTO_2473 ?AUTO_2475 ) ) ( not ( = ?AUTO_2478 ?AUTO_2475 ) ) ( not ( = ?AUTO_2472 ?AUTO_2474 ) ) ( not ( = ?AUTO_2473 ?AUTO_2474 ) ) ( not ( = ?AUTO_2478 ?AUTO_2474 ) ) ( not ( = ?AUTO_2475 ?AUTO_2474 ) ) ( ON ?AUTO_2475 ?AUTO_2473 ) ( not ( = ?AUTO_2472 ?AUTO_2481 ) ) ( not ( = ?AUTO_2473 ?AUTO_2481 ) ) ( not ( = ?AUTO_2478 ?AUTO_2481 ) ) ( not ( = ?AUTO_2475 ?AUTO_2481 ) ) ( not ( = ?AUTO_2474 ?AUTO_2481 ) ) ( ON ?AUTO_2481 ?AUTO_2475 ) ( ON ?AUTO_2478 ?AUTO_2481 ) ( CLEAR ?AUTO_2478 ) ( CLEAR ?AUTO_2479 ) ( not ( = ?AUTO_2472 ?AUTO_2480 ) ) ( not ( = ?AUTO_2472 ?AUTO_2479 ) ) ( not ( = ?AUTO_2473 ?AUTO_2480 ) ) ( not ( = ?AUTO_2473 ?AUTO_2479 ) ) ( not ( = ?AUTO_2478 ?AUTO_2480 ) ) ( not ( = ?AUTO_2478 ?AUTO_2479 ) ) ( not ( = ?AUTO_2475 ?AUTO_2480 ) ) ( not ( = ?AUTO_2475 ?AUTO_2479 ) ) ( not ( = ?AUTO_2474 ?AUTO_2480 ) ) ( not ( = ?AUTO_2474 ?AUTO_2479 ) ) ( not ( = ?AUTO_2481 ?AUTO_2480 ) ) ( not ( = ?AUTO_2481 ?AUTO_2479 ) ) ( not ( = ?AUTO_2480 ?AUTO_2479 ) ) ( ON ?AUTO_2480 ?AUTO_2472 ) ( not ( = ?AUTO_2472 ?AUTO_2476 ) ) ( not ( = ?AUTO_2473 ?AUTO_2476 ) ) ( not ( = ?AUTO_2478 ?AUTO_2476 ) ) ( not ( = ?AUTO_2475 ?AUTO_2476 ) ) ( not ( = ?AUTO_2474 ?AUTO_2476 ) ) ( not ( = ?AUTO_2481 ?AUTO_2476 ) ) ( not ( = ?AUTO_2479 ?AUTO_2476 ) ) ( not ( = ?AUTO_2480 ?AUTO_2476 ) ) ( ON ?AUTO_2476 ?AUTO_2480 ) ( not ( = ?AUTO_2472 ?AUTO_2477 ) ) ( not ( = ?AUTO_2473 ?AUTO_2477 ) ) ( not ( = ?AUTO_2478 ?AUTO_2477 ) ) ( not ( = ?AUTO_2475 ?AUTO_2477 ) ) ( not ( = ?AUTO_2474 ?AUTO_2477 ) ) ( not ( = ?AUTO_2481 ?AUTO_2477 ) ) ( not ( = ?AUTO_2479 ?AUTO_2477 ) ) ( not ( = ?AUTO_2480 ?AUTO_2477 ) ) ( not ( = ?AUTO_2476 ?AUTO_2477 ) ) ( ON ?AUTO_2477 ?AUTO_2476 ) ( ON ?AUTO_2474 ?AUTO_2477 ) ( CLEAR ?AUTO_2474 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2474 ?AUTO_2477 )
      ( MAKE-ON ?AUTO_2472 ?AUTO_2473 )
      ( MAKE-ON-VERIFY ?AUTO_2472 ?AUTO_2473 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2660 - BLOCK
    )
    :vars
    (
      ?AUTO_2664 - BLOCK
      ?AUTO_2662 - BLOCK
      ?AUTO_2661 - BLOCK
      ?AUTO_2663 - BLOCK
      ?AUTO_2665 - BLOCK
      ?AUTO_2666 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2660 ?AUTO_2664 ) ( not ( = ?AUTO_2660 ?AUTO_2664 ) ) ( not ( = ?AUTO_2660 ?AUTO_2662 ) ) ( not ( = ?AUTO_2664 ?AUTO_2662 ) ) ( ON ?AUTO_2662 ?AUTO_2660 ) ( CLEAR ?AUTO_2661 ) ( not ( = ?AUTO_2660 ?AUTO_2663 ) ) ( not ( = ?AUTO_2660 ?AUTO_2661 ) ) ( not ( = ?AUTO_2664 ?AUTO_2663 ) ) ( not ( = ?AUTO_2664 ?AUTO_2661 ) ) ( not ( = ?AUTO_2662 ?AUTO_2663 ) ) ( not ( = ?AUTO_2662 ?AUTO_2661 ) ) ( not ( = ?AUTO_2663 ?AUTO_2661 ) ) ( ON ?AUTO_2663 ?AUTO_2662 ) ( not ( = ?AUTO_2660 ?AUTO_2665 ) ) ( not ( = ?AUTO_2664 ?AUTO_2665 ) ) ( not ( = ?AUTO_2662 ?AUTO_2665 ) ) ( not ( = ?AUTO_2661 ?AUTO_2665 ) ) ( not ( = ?AUTO_2663 ?AUTO_2665 ) ) ( ON ?AUTO_2665 ?AUTO_2663 ) ( CLEAR ?AUTO_2665 ) ( HOLDING ?AUTO_2666 ) ( not ( = ?AUTO_2660 ?AUTO_2666 ) ) ( not ( = ?AUTO_2664 ?AUTO_2666 ) ) ( not ( = ?AUTO_2662 ?AUTO_2666 ) ) ( not ( = ?AUTO_2661 ?AUTO_2666 ) ) ( not ( = ?AUTO_2663 ?AUTO_2666 ) ) ( not ( = ?AUTO_2665 ?AUTO_2666 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2666 )
      ( MAKE-ON-TABLE ?AUTO_2660 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2660 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2693 - BLOCK
      ?AUTO_2694 - BLOCK
    )
    :vars
    (
      ?AUTO_2696 - BLOCK
      ?AUTO_2695 - BLOCK
      ?AUTO_2697 - BLOCK
      ?AUTO_2698 - BLOCK
      ?AUTO_2699 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2693 ?AUTO_2694 ) ) ( ON ?AUTO_2693 ?AUTO_2696 ) ( CLEAR ?AUTO_2693 ) ( not ( = ?AUTO_2693 ?AUTO_2696 ) ) ( not ( = ?AUTO_2694 ?AUTO_2696 ) ) ( not ( = ?AUTO_2693 ?AUTO_2695 ) ) ( not ( = ?AUTO_2694 ?AUTO_2695 ) ) ( not ( = ?AUTO_2696 ?AUTO_2695 ) ) ( ON ?AUTO_2695 ?AUTO_2694 ) ( not ( = ?AUTO_2693 ?AUTO_2697 ) ) ( not ( = ?AUTO_2694 ?AUTO_2697 ) ) ( not ( = ?AUTO_2696 ?AUTO_2697 ) ) ( not ( = ?AUTO_2695 ?AUTO_2697 ) ) ( ON ?AUTO_2697 ?AUTO_2695 ) ( CLEAR ?AUTO_2697 ) ( HOLDING ?AUTO_2698 ) ( CLEAR ?AUTO_2699 ) ( not ( = ?AUTO_2693 ?AUTO_2698 ) ) ( not ( = ?AUTO_2693 ?AUTO_2699 ) ) ( not ( = ?AUTO_2694 ?AUTO_2698 ) ) ( not ( = ?AUTO_2694 ?AUTO_2699 ) ) ( not ( = ?AUTO_2696 ?AUTO_2698 ) ) ( not ( = ?AUTO_2696 ?AUTO_2699 ) ) ( not ( = ?AUTO_2695 ?AUTO_2698 ) ) ( not ( = ?AUTO_2695 ?AUTO_2699 ) ) ( not ( = ?AUTO_2697 ?AUTO_2698 ) ) ( not ( = ?AUTO_2697 ?AUTO_2699 ) ) ( not ( = ?AUTO_2698 ?AUTO_2699 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2698 ?AUTO_2699 )
      ( MAKE-ON ?AUTO_2693 ?AUTO_2694 )
      ( MAKE-ON-VERIFY ?AUTO_2693 ?AUTO_2694 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2727 - BLOCK
      ?AUTO_2728 - BLOCK
    )
    :vars
    (
      ?AUTO_2730 - BLOCK
      ?AUTO_2731 - BLOCK
      ?AUTO_2732 - BLOCK
      ?AUTO_2733 - BLOCK
      ?AUTO_2734 - BLOCK
      ?AUTO_2729 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2727 ?AUTO_2728 ) ) ( ON ?AUTO_2727 ?AUTO_2730 ) ( CLEAR ?AUTO_2727 ) ( not ( = ?AUTO_2727 ?AUTO_2730 ) ) ( not ( = ?AUTO_2728 ?AUTO_2730 ) ) ( not ( = ?AUTO_2727 ?AUTO_2731 ) ) ( not ( = ?AUTO_2728 ?AUTO_2731 ) ) ( not ( = ?AUTO_2730 ?AUTO_2731 ) ) ( ON ?AUTO_2731 ?AUTO_2728 ) ( not ( = ?AUTO_2727 ?AUTO_2732 ) ) ( not ( = ?AUTO_2728 ?AUTO_2732 ) ) ( not ( = ?AUTO_2730 ?AUTO_2732 ) ) ( not ( = ?AUTO_2731 ?AUTO_2732 ) ) ( ON ?AUTO_2732 ?AUTO_2731 ) ( not ( = ?AUTO_2727 ?AUTO_2733 ) ) ( not ( = ?AUTO_2727 ?AUTO_2734 ) ) ( not ( = ?AUTO_2728 ?AUTO_2733 ) ) ( not ( = ?AUTO_2728 ?AUTO_2734 ) ) ( not ( = ?AUTO_2730 ?AUTO_2733 ) ) ( not ( = ?AUTO_2730 ?AUTO_2734 ) ) ( not ( = ?AUTO_2731 ?AUTO_2733 ) ) ( not ( = ?AUTO_2731 ?AUTO_2734 ) ) ( not ( = ?AUTO_2732 ?AUTO_2733 ) ) ( not ( = ?AUTO_2732 ?AUTO_2734 ) ) ( not ( = ?AUTO_2733 ?AUTO_2734 ) ) ( ON ?AUTO_2733 ?AUTO_2732 ) ( not ( = ?AUTO_2727 ?AUTO_2729 ) ) ( not ( = ?AUTO_2728 ?AUTO_2729 ) ) ( not ( = ?AUTO_2730 ?AUTO_2729 ) ) ( not ( = ?AUTO_2731 ?AUTO_2729 ) ) ( not ( = ?AUTO_2732 ?AUTO_2729 ) ) ( not ( = ?AUTO_2734 ?AUTO_2729 ) ) ( not ( = ?AUTO_2733 ?AUTO_2729 ) ) ( ON ?AUTO_2729 ?AUTO_2733 ) ( CLEAR ?AUTO_2729 ) ( HOLDING ?AUTO_2734 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2734 )
      ( MAKE-ON ?AUTO_2727 ?AUTO_2728 )
      ( MAKE-ON-VERIFY ?AUTO_2727 ?AUTO_2728 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2735 - BLOCK
      ?AUTO_2736 - BLOCK
    )
    :vars
    (
      ?AUTO_2740 - BLOCK
      ?AUTO_2737 - BLOCK
      ?AUTO_2738 - BLOCK
      ?AUTO_2741 - BLOCK
      ?AUTO_2739 - BLOCK
      ?AUTO_2742 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2735 ?AUTO_2736 ) ) ( ON ?AUTO_2735 ?AUTO_2740 ) ( not ( = ?AUTO_2735 ?AUTO_2740 ) ) ( not ( = ?AUTO_2736 ?AUTO_2740 ) ) ( not ( = ?AUTO_2735 ?AUTO_2737 ) ) ( not ( = ?AUTO_2736 ?AUTO_2737 ) ) ( not ( = ?AUTO_2740 ?AUTO_2737 ) ) ( ON ?AUTO_2737 ?AUTO_2736 ) ( not ( = ?AUTO_2735 ?AUTO_2738 ) ) ( not ( = ?AUTO_2736 ?AUTO_2738 ) ) ( not ( = ?AUTO_2740 ?AUTO_2738 ) ) ( not ( = ?AUTO_2737 ?AUTO_2738 ) ) ( ON ?AUTO_2738 ?AUTO_2737 ) ( not ( = ?AUTO_2735 ?AUTO_2741 ) ) ( not ( = ?AUTO_2735 ?AUTO_2739 ) ) ( not ( = ?AUTO_2736 ?AUTO_2741 ) ) ( not ( = ?AUTO_2736 ?AUTO_2739 ) ) ( not ( = ?AUTO_2740 ?AUTO_2741 ) ) ( not ( = ?AUTO_2740 ?AUTO_2739 ) ) ( not ( = ?AUTO_2737 ?AUTO_2741 ) ) ( not ( = ?AUTO_2737 ?AUTO_2739 ) ) ( not ( = ?AUTO_2738 ?AUTO_2741 ) ) ( not ( = ?AUTO_2738 ?AUTO_2739 ) ) ( not ( = ?AUTO_2741 ?AUTO_2739 ) ) ( ON ?AUTO_2741 ?AUTO_2738 ) ( not ( = ?AUTO_2735 ?AUTO_2742 ) ) ( not ( = ?AUTO_2736 ?AUTO_2742 ) ) ( not ( = ?AUTO_2740 ?AUTO_2742 ) ) ( not ( = ?AUTO_2737 ?AUTO_2742 ) ) ( not ( = ?AUTO_2738 ?AUTO_2742 ) ) ( not ( = ?AUTO_2739 ?AUTO_2742 ) ) ( not ( = ?AUTO_2741 ?AUTO_2742 ) ) ( ON ?AUTO_2742 ?AUTO_2741 ) ( CLEAR ?AUTO_2742 ) ( ON ?AUTO_2739 ?AUTO_2735 ) ( CLEAR ?AUTO_2739 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2739 ?AUTO_2735 )
      ( MAKE-ON ?AUTO_2735 ?AUTO_2736 )
      ( MAKE-ON-VERIFY ?AUTO_2735 ?AUTO_2736 ) )
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
      ?AUTO_2800 - BLOCK
      ?AUTO_2799 - BLOCK
      ?AUTO_2797 - BLOCK
      ?AUTO_2798 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2795 ) ( not ( = ?AUTO_2794 ?AUTO_2795 ) ) ( ON ?AUTO_2794 ?AUTO_2796 ) ( not ( = ?AUTO_2794 ?AUTO_2796 ) ) ( not ( = ?AUTO_2795 ?AUTO_2796 ) ) ( not ( = ?AUTO_2794 ?AUTO_2800 ) ) ( not ( = ?AUTO_2795 ?AUTO_2800 ) ) ( not ( = ?AUTO_2796 ?AUTO_2800 ) ) ( ON ?AUTO_2800 ?AUTO_2794 ) ( not ( = ?AUTO_2794 ?AUTO_2799 ) ) ( not ( = ?AUTO_2794 ?AUTO_2797 ) ) ( not ( = ?AUTO_2795 ?AUTO_2799 ) ) ( not ( = ?AUTO_2795 ?AUTO_2797 ) ) ( not ( = ?AUTO_2796 ?AUTO_2799 ) ) ( not ( = ?AUTO_2796 ?AUTO_2797 ) ) ( not ( = ?AUTO_2800 ?AUTO_2799 ) ) ( not ( = ?AUTO_2800 ?AUTO_2797 ) ) ( not ( = ?AUTO_2799 ?AUTO_2797 ) ) ( ON ?AUTO_2799 ?AUTO_2800 ) ( not ( = ?AUTO_2794 ?AUTO_2798 ) ) ( not ( = ?AUTO_2795 ?AUTO_2798 ) ) ( not ( = ?AUTO_2796 ?AUTO_2798 ) ) ( not ( = ?AUTO_2800 ?AUTO_2798 ) ) ( not ( = ?AUTO_2797 ?AUTO_2798 ) ) ( not ( = ?AUTO_2799 ?AUTO_2798 ) ) ( ON ?AUTO_2798 ?AUTO_2799 ) ( CLEAR ?AUTO_2798 ) ( HOLDING ?AUTO_2797 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2797 )
      ( MAKE-ON ?AUTO_2794 ?AUTO_2795 )
      ( MAKE-ON-VERIFY ?AUTO_2794 ?AUTO_2795 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2801 - BLOCK
      ?AUTO_2802 - BLOCK
    )
    :vars
    (
      ?AUTO_2806 - BLOCK
      ?AUTO_2803 - BLOCK
      ?AUTO_2807 - BLOCK
      ?AUTO_2805 - BLOCK
      ?AUTO_2804 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2801 ?AUTO_2802 ) ) ( ON ?AUTO_2801 ?AUTO_2806 ) ( not ( = ?AUTO_2801 ?AUTO_2806 ) ) ( not ( = ?AUTO_2802 ?AUTO_2806 ) ) ( not ( = ?AUTO_2801 ?AUTO_2803 ) ) ( not ( = ?AUTO_2802 ?AUTO_2803 ) ) ( not ( = ?AUTO_2806 ?AUTO_2803 ) ) ( ON ?AUTO_2803 ?AUTO_2801 ) ( not ( = ?AUTO_2801 ?AUTO_2807 ) ) ( not ( = ?AUTO_2801 ?AUTO_2805 ) ) ( not ( = ?AUTO_2802 ?AUTO_2807 ) ) ( not ( = ?AUTO_2802 ?AUTO_2805 ) ) ( not ( = ?AUTO_2806 ?AUTO_2807 ) ) ( not ( = ?AUTO_2806 ?AUTO_2805 ) ) ( not ( = ?AUTO_2803 ?AUTO_2807 ) ) ( not ( = ?AUTO_2803 ?AUTO_2805 ) ) ( not ( = ?AUTO_2807 ?AUTO_2805 ) ) ( ON ?AUTO_2807 ?AUTO_2803 ) ( not ( = ?AUTO_2801 ?AUTO_2804 ) ) ( not ( = ?AUTO_2802 ?AUTO_2804 ) ) ( not ( = ?AUTO_2806 ?AUTO_2804 ) ) ( not ( = ?AUTO_2803 ?AUTO_2804 ) ) ( not ( = ?AUTO_2805 ?AUTO_2804 ) ) ( not ( = ?AUTO_2807 ?AUTO_2804 ) ) ( ON ?AUTO_2804 ?AUTO_2807 ) ( CLEAR ?AUTO_2804 ) ( ON ?AUTO_2805 ?AUTO_2802 ) ( CLEAR ?AUTO_2805 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2805 ?AUTO_2802 )
      ( MAKE-ON ?AUTO_2801 ?AUTO_2802 )
      ( MAKE-ON-VERIFY ?AUTO_2801 ?AUTO_2802 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2862 - BLOCK
      ?AUTO_2863 - BLOCK
    )
    :vars
    (
      ?AUTO_2865 - BLOCK
      ?AUTO_2866 - BLOCK
      ?AUTO_2867 - BLOCK
      ?AUTO_2868 - BLOCK
      ?AUTO_2869 - BLOCK
      ?AUTO_2864 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2862 ?AUTO_2863 ) ) ( ON ?AUTO_2862 ?AUTO_2865 ) ( not ( = ?AUTO_2862 ?AUTO_2865 ) ) ( not ( = ?AUTO_2863 ?AUTO_2865 ) ) ( CLEAR ?AUTO_2866 ) ( not ( = ?AUTO_2862 ?AUTO_2867 ) ) ( not ( = ?AUTO_2862 ?AUTO_2866 ) ) ( not ( = ?AUTO_2863 ?AUTO_2867 ) ) ( not ( = ?AUTO_2863 ?AUTO_2866 ) ) ( not ( = ?AUTO_2865 ?AUTO_2867 ) ) ( not ( = ?AUTO_2865 ?AUTO_2866 ) ) ( not ( = ?AUTO_2867 ?AUTO_2866 ) ) ( ON ?AUTO_2867 ?AUTO_2862 ) ( CLEAR ?AUTO_2867 ) ( not ( = ?AUTO_2862 ?AUTO_2868 ) ) ( not ( = ?AUTO_2863 ?AUTO_2868 ) ) ( not ( = ?AUTO_2865 ?AUTO_2868 ) ) ( not ( = ?AUTO_2866 ?AUTO_2868 ) ) ( not ( = ?AUTO_2867 ?AUTO_2868 ) ) ( ON ?AUTO_2868 ?AUTO_2863 ) ( CLEAR ?AUTO_2869 ) ( not ( = ?AUTO_2862 ?AUTO_2864 ) ) ( not ( = ?AUTO_2862 ?AUTO_2869 ) ) ( not ( = ?AUTO_2863 ?AUTO_2864 ) ) ( not ( = ?AUTO_2863 ?AUTO_2869 ) ) ( not ( = ?AUTO_2865 ?AUTO_2864 ) ) ( not ( = ?AUTO_2865 ?AUTO_2869 ) ) ( not ( = ?AUTO_2866 ?AUTO_2864 ) ) ( not ( = ?AUTO_2866 ?AUTO_2869 ) ) ( not ( = ?AUTO_2867 ?AUTO_2864 ) ) ( not ( = ?AUTO_2867 ?AUTO_2869 ) ) ( not ( = ?AUTO_2868 ?AUTO_2864 ) ) ( not ( = ?AUTO_2868 ?AUTO_2869 ) ) ( not ( = ?AUTO_2864 ?AUTO_2869 ) ) ( ON ?AUTO_2864 ?AUTO_2868 ) ( CLEAR ?AUTO_2864 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2864 ?AUTO_2868 )
      ( MAKE-ON ?AUTO_2862 ?AUTO_2863 )
      ( MAKE-ON-VERIFY ?AUTO_2862 ?AUTO_2863 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2878 - BLOCK
      ?AUTO_2879 - BLOCK
    )
    :vars
    (
      ?AUTO_2882 - BLOCK
      ?AUTO_2881 - BLOCK
      ?AUTO_2880 - BLOCK
      ?AUTO_2885 - BLOCK
      ?AUTO_2884 - BLOCK
      ?AUTO_2883 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2878 ?AUTO_2879 ) ) ( ON ?AUTO_2878 ?AUTO_2882 ) ( not ( = ?AUTO_2878 ?AUTO_2882 ) ) ( not ( = ?AUTO_2879 ?AUTO_2882 ) ) ( CLEAR ?AUTO_2881 ) ( not ( = ?AUTO_2878 ?AUTO_2880 ) ) ( not ( = ?AUTO_2878 ?AUTO_2881 ) ) ( not ( = ?AUTO_2879 ?AUTO_2880 ) ) ( not ( = ?AUTO_2879 ?AUTO_2881 ) ) ( not ( = ?AUTO_2882 ?AUTO_2880 ) ) ( not ( = ?AUTO_2882 ?AUTO_2881 ) ) ( not ( = ?AUTO_2880 ?AUTO_2881 ) ) ( ON ?AUTO_2880 ?AUTO_2878 ) ( CLEAR ?AUTO_2880 ) ( not ( = ?AUTO_2878 ?AUTO_2885 ) ) ( not ( = ?AUTO_2879 ?AUTO_2885 ) ) ( not ( = ?AUTO_2882 ?AUTO_2885 ) ) ( not ( = ?AUTO_2881 ?AUTO_2885 ) ) ( not ( = ?AUTO_2880 ?AUTO_2885 ) ) ( ON ?AUTO_2885 ?AUTO_2879 ) ( not ( = ?AUTO_2878 ?AUTO_2884 ) ) ( not ( = ?AUTO_2878 ?AUTO_2883 ) ) ( not ( = ?AUTO_2879 ?AUTO_2884 ) ) ( not ( = ?AUTO_2879 ?AUTO_2883 ) ) ( not ( = ?AUTO_2882 ?AUTO_2884 ) ) ( not ( = ?AUTO_2882 ?AUTO_2883 ) ) ( not ( = ?AUTO_2881 ?AUTO_2884 ) ) ( not ( = ?AUTO_2881 ?AUTO_2883 ) ) ( not ( = ?AUTO_2880 ?AUTO_2884 ) ) ( not ( = ?AUTO_2880 ?AUTO_2883 ) ) ( not ( = ?AUTO_2885 ?AUTO_2884 ) ) ( not ( = ?AUTO_2885 ?AUTO_2883 ) ) ( not ( = ?AUTO_2884 ?AUTO_2883 ) ) ( ON ?AUTO_2884 ?AUTO_2885 ) ( ON ?AUTO_2883 ?AUTO_2884 ) ( CLEAR ?AUTO_2883 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2883 ?AUTO_2884 )
      ( MAKE-ON ?AUTO_2878 ?AUTO_2879 )
      ( MAKE-ON-VERIFY ?AUTO_2878 ?AUTO_2879 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2886 - BLOCK
      ?AUTO_2887 - BLOCK
    )
    :vars
    (
      ?AUTO_2892 - BLOCK
      ?AUTO_2889 - BLOCK
      ?AUTO_2893 - BLOCK
      ?AUTO_2888 - BLOCK
      ?AUTO_2890 - BLOCK
      ?AUTO_2891 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2886 ?AUTO_2887 ) ) ( ON ?AUTO_2886 ?AUTO_2892 ) ( not ( = ?AUTO_2886 ?AUTO_2892 ) ) ( not ( = ?AUTO_2887 ?AUTO_2892 ) ) ( not ( = ?AUTO_2886 ?AUTO_2889 ) ) ( not ( = ?AUTO_2886 ?AUTO_2893 ) ) ( not ( = ?AUTO_2887 ?AUTO_2889 ) ) ( not ( = ?AUTO_2887 ?AUTO_2893 ) ) ( not ( = ?AUTO_2892 ?AUTO_2889 ) ) ( not ( = ?AUTO_2892 ?AUTO_2893 ) ) ( not ( = ?AUTO_2889 ?AUTO_2893 ) ) ( ON ?AUTO_2889 ?AUTO_2886 ) ( CLEAR ?AUTO_2889 ) ( not ( = ?AUTO_2886 ?AUTO_2888 ) ) ( not ( = ?AUTO_2887 ?AUTO_2888 ) ) ( not ( = ?AUTO_2892 ?AUTO_2888 ) ) ( not ( = ?AUTO_2893 ?AUTO_2888 ) ) ( not ( = ?AUTO_2889 ?AUTO_2888 ) ) ( ON ?AUTO_2888 ?AUTO_2887 ) ( not ( = ?AUTO_2886 ?AUTO_2890 ) ) ( not ( = ?AUTO_2886 ?AUTO_2891 ) ) ( not ( = ?AUTO_2887 ?AUTO_2890 ) ) ( not ( = ?AUTO_2887 ?AUTO_2891 ) ) ( not ( = ?AUTO_2892 ?AUTO_2890 ) ) ( not ( = ?AUTO_2892 ?AUTO_2891 ) ) ( not ( = ?AUTO_2893 ?AUTO_2890 ) ) ( not ( = ?AUTO_2893 ?AUTO_2891 ) ) ( not ( = ?AUTO_2889 ?AUTO_2890 ) ) ( not ( = ?AUTO_2889 ?AUTO_2891 ) ) ( not ( = ?AUTO_2888 ?AUTO_2890 ) ) ( not ( = ?AUTO_2888 ?AUTO_2891 ) ) ( not ( = ?AUTO_2890 ?AUTO_2891 ) ) ( ON ?AUTO_2890 ?AUTO_2888 ) ( ON ?AUTO_2891 ?AUTO_2890 ) ( CLEAR ?AUTO_2891 ) ( HOLDING ?AUTO_2893 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2893 )
      ( MAKE-ON ?AUTO_2886 ?AUTO_2887 )
      ( MAKE-ON-VERIFY ?AUTO_2886 ?AUTO_2887 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2894 - BLOCK
      ?AUTO_2895 - BLOCK
    )
    :vars
    (
      ?AUTO_2900 - BLOCK
      ?AUTO_2899 - BLOCK
      ?AUTO_2901 - BLOCK
      ?AUTO_2896 - BLOCK
      ?AUTO_2898 - BLOCK
      ?AUTO_2897 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2894 ?AUTO_2895 ) ) ( ON ?AUTO_2894 ?AUTO_2900 ) ( not ( = ?AUTO_2894 ?AUTO_2900 ) ) ( not ( = ?AUTO_2895 ?AUTO_2900 ) ) ( not ( = ?AUTO_2894 ?AUTO_2899 ) ) ( not ( = ?AUTO_2894 ?AUTO_2901 ) ) ( not ( = ?AUTO_2895 ?AUTO_2899 ) ) ( not ( = ?AUTO_2895 ?AUTO_2901 ) ) ( not ( = ?AUTO_2900 ?AUTO_2899 ) ) ( not ( = ?AUTO_2900 ?AUTO_2901 ) ) ( not ( = ?AUTO_2899 ?AUTO_2901 ) ) ( ON ?AUTO_2899 ?AUTO_2894 ) ( not ( = ?AUTO_2894 ?AUTO_2896 ) ) ( not ( = ?AUTO_2895 ?AUTO_2896 ) ) ( not ( = ?AUTO_2900 ?AUTO_2896 ) ) ( not ( = ?AUTO_2901 ?AUTO_2896 ) ) ( not ( = ?AUTO_2899 ?AUTO_2896 ) ) ( ON ?AUTO_2896 ?AUTO_2895 ) ( not ( = ?AUTO_2894 ?AUTO_2898 ) ) ( not ( = ?AUTO_2894 ?AUTO_2897 ) ) ( not ( = ?AUTO_2895 ?AUTO_2898 ) ) ( not ( = ?AUTO_2895 ?AUTO_2897 ) ) ( not ( = ?AUTO_2900 ?AUTO_2898 ) ) ( not ( = ?AUTO_2900 ?AUTO_2897 ) ) ( not ( = ?AUTO_2901 ?AUTO_2898 ) ) ( not ( = ?AUTO_2901 ?AUTO_2897 ) ) ( not ( = ?AUTO_2899 ?AUTO_2898 ) ) ( not ( = ?AUTO_2899 ?AUTO_2897 ) ) ( not ( = ?AUTO_2896 ?AUTO_2898 ) ) ( not ( = ?AUTO_2896 ?AUTO_2897 ) ) ( not ( = ?AUTO_2898 ?AUTO_2897 ) ) ( ON ?AUTO_2898 ?AUTO_2896 ) ( ON ?AUTO_2897 ?AUTO_2898 ) ( CLEAR ?AUTO_2897 ) ( ON ?AUTO_2901 ?AUTO_2899 ) ( CLEAR ?AUTO_2901 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2901 ?AUTO_2899 )
      ( MAKE-ON ?AUTO_2894 ?AUTO_2895 )
      ( MAKE-ON-VERIFY ?AUTO_2894 ?AUTO_2895 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3037 - BLOCK
      ?AUTO_3038 - BLOCK
    )
    :vars
    (
      ?AUTO_3040 - BLOCK
      ?AUTO_3041 - BLOCK
      ?AUTO_3042 - BLOCK
      ?AUTO_3043 - BLOCK
      ?AUTO_3039 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3037 ?AUTO_3038 ) ) ( ON ?AUTO_3037 ?AUTO_3040 ) ( not ( = ?AUTO_3037 ?AUTO_3040 ) ) ( not ( = ?AUTO_3038 ?AUTO_3040 ) ) ( not ( = ?AUTO_3037 ?AUTO_3041 ) ) ( not ( = ?AUTO_3037 ?AUTO_3042 ) ) ( not ( = ?AUTO_3038 ?AUTO_3041 ) ) ( not ( = ?AUTO_3038 ?AUTO_3042 ) ) ( not ( = ?AUTO_3040 ?AUTO_3041 ) ) ( not ( = ?AUTO_3040 ?AUTO_3042 ) ) ( not ( = ?AUTO_3041 ?AUTO_3042 ) ) ( ON ?AUTO_3041 ?AUTO_3037 ) ( not ( = ?AUTO_3037 ?AUTO_3043 ) ) ( not ( = ?AUTO_3038 ?AUTO_3043 ) ) ( not ( = ?AUTO_3040 ?AUTO_3043 ) ) ( not ( = ?AUTO_3042 ?AUTO_3043 ) ) ( not ( = ?AUTO_3041 ?AUTO_3043 ) ) ( ON ?AUTO_3043 ?AUTO_3038 ) ( not ( = ?AUTO_3037 ?AUTO_3039 ) ) ( not ( = ?AUTO_3038 ?AUTO_3039 ) ) ( not ( = ?AUTO_3040 ?AUTO_3039 ) ) ( not ( = ?AUTO_3042 ?AUTO_3039 ) ) ( not ( = ?AUTO_3041 ?AUTO_3039 ) ) ( not ( = ?AUTO_3043 ?AUTO_3039 ) ) ( ON ?AUTO_3039 ?AUTO_3041 ) ( CLEAR ?AUTO_3039 ) ( ON ?AUTO_3042 ?AUTO_3043 ) ( CLEAR ?AUTO_3042 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3042 ?AUTO_3043 )
      ( MAKE-ON ?AUTO_3037 ?AUTO_3038 )
      ( MAKE-ON-VERIFY ?AUTO_3037 ?AUTO_3038 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3134 - BLOCK
      ?AUTO_3135 - BLOCK
    )
    :vars
    (
      ?AUTO_3136 - BLOCK
      ?AUTO_3137 - BLOCK
      ?AUTO_3138 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3134 ?AUTO_3135 ) ) ( not ( = ?AUTO_3134 ?AUTO_3136 ) ) ( not ( = ?AUTO_3135 ?AUTO_3136 ) ) ( ON ?AUTO_3136 ?AUTO_3135 ) ( not ( = ?AUTO_3134 ?AUTO_3137 ) ) ( not ( = ?AUTO_3135 ?AUTO_3137 ) ) ( not ( = ?AUTO_3136 ?AUTO_3137 ) ) ( ON ?AUTO_3137 ?AUTO_3136 ) ( not ( = ?AUTO_3134 ?AUTO_3138 ) ) ( not ( = ?AUTO_3135 ?AUTO_3138 ) ) ( not ( = ?AUTO_3136 ?AUTO_3138 ) ) ( not ( = ?AUTO_3137 ?AUTO_3138 ) ) ( ON ?AUTO_3138 ?AUTO_3137 ) ( CLEAR ?AUTO_3138 ) ( HOLDING ?AUTO_3134 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3134 )
      ( MAKE-ON ?AUTO_3134 ?AUTO_3135 )
      ( MAKE-ON-VERIFY ?AUTO_3134 ?AUTO_3135 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3139 - BLOCK
      ?AUTO_3140 - BLOCK
    )
    :vars
    (
      ?AUTO_3143 - BLOCK
      ?AUTO_3142 - BLOCK
      ?AUTO_3141 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3139 ?AUTO_3140 ) ) ( not ( = ?AUTO_3139 ?AUTO_3143 ) ) ( not ( = ?AUTO_3140 ?AUTO_3143 ) ) ( ON ?AUTO_3143 ?AUTO_3140 ) ( not ( = ?AUTO_3139 ?AUTO_3142 ) ) ( not ( = ?AUTO_3140 ?AUTO_3142 ) ) ( not ( = ?AUTO_3143 ?AUTO_3142 ) ) ( ON ?AUTO_3142 ?AUTO_3143 ) ( not ( = ?AUTO_3139 ?AUTO_3141 ) ) ( not ( = ?AUTO_3140 ?AUTO_3141 ) ) ( not ( = ?AUTO_3143 ?AUTO_3141 ) ) ( not ( = ?AUTO_3142 ?AUTO_3141 ) ) ( ON ?AUTO_3141 ?AUTO_3142 ) ( ON ?AUTO_3139 ?AUTO_3141 ) ( CLEAR ?AUTO_3139 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3139 ?AUTO_3141 )
      ( MAKE-ON ?AUTO_3139 ?AUTO_3140 )
      ( MAKE-ON-VERIFY ?AUTO_3139 ?AUTO_3140 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3195 - BLOCK
      ?AUTO_3196 - BLOCK
    )
    :vars
    (
      ?AUTO_3197 - BLOCK
      ?AUTO_3198 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3195 ?AUTO_3196 ) ) ( ON ?AUTO_3195 ?AUTO_3197 ) ( not ( = ?AUTO_3195 ?AUTO_3197 ) ) ( not ( = ?AUTO_3196 ?AUTO_3197 ) ) ( not ( = ?AUTO_3195 ?AUTO_3198 ) ) ( not ( = ?AUTO_3196 ?AUTO_3198 ) ) ( not ( = ?AUTO_3197 ?AUTO_3198 ) ) ( ON ?AUTO_3198 ?AUTO_3195 ) ( ON ?AUTO_3196 ?AUTO_3198 ) ( CLEAR ?AUTO_3196 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3196 ?AUTO_3198 )
      ( MAKE-ON ?AUTO_3195 ?AUTO_3196 )
      ( MAKE-ON-VERIFY ?AUTO_3195 ?AUTO_3196 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3199 - BLOCK
      ?AUTO_3200 - BLOCK
    )
    :vars
    (
      ?AUTO_3201 - BLOCK
      ?AUTO_3202 - BLOCK
      ?AUTO_3203 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3199 ?AUTO_3200 ) ) ( ON ?AUTO_3199 ?AUTO_3201 ) ( not ( = ?AUTO_3199 ?AUTO_3201 ) ) ( not ( = ?AUTO_3200 ?AUTO_3201 ) ) ( not ( = ?AUTO_3199 ?AUTO_3202 ) ) ( not ( = ?AUTO_3200 ?AUTO_3202 ) ) ( not ( = ?AUTO_3201 ?AUTO_3202 ) ) ( ON ?AUTO_3202 ?AUTO_3199 ) ( ON ?AUTO_3200 ?AUTO_3202 ) ( CLEAR ?AUTO_3200 ) ( HOLDING ?AUTO_3203 ) ( not ( = ?AUTO_3199 ?AUTO_3203 ) ) ( not ( = ?AUTO_3200 ?AUTO_3203 ) ) ( not ( = ?AUTO_3201 ?AUTO_3203 ) ) ( not ( = ?AUTO_3202 ?AUTO_3203 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3203 )
      ( MAKE-ON ?AUTO_3199 ?AUTO_3200 )
      ( MAKE-ON-VERIFY ?AUTO_3199 ?AUTO_3200 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3204 - BLOCK
      ?AUTO_3205 - BLOCK
    )
    :vars
    (
      ?AUTO_3207 - BLOCK
      ?AUTO_3206 - BLOCK
      ?AUTO_3208 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3204 ?AUTO_3205 ) ) ( ON ?AUTO_3204 ?AUTO_3207 ) ( not ( = ?AUTO_3204 ?AUTO_3207 ) ) ( not ( = ?AUTO_3205 ?AUTO_3207 ) ) ( not ( = ?AUTO_3204 ?AUTO_3206 ) ) ( not ( = ?AUTO_3205 ?AUTO_3206 ) ) ( not ( = ?AUTO_3207 ?AUTO_3206 ) ) ( ON ?AUTO_3206 ?AUTO_3204 ) ( ON ?AUTO_3205 ?AUTO_3206 ) ( not ( = ?AUTO_3204 ?AUTO_3208 ) ) ( not ( = ?AUTO_3205 ?AUTO_3208 ) ) ( not ( = ?AUTO_3207 ?AUTO_3208 ) ) ( not ( = ?AUTO_3206 ?AUTO_3208 ) ) ( ON ?AUTO_3208 ?AUTO_3205 ) ( CLEAR ?AUTO_3208 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3208 ?AUTO_3205 )
      ( MAKE-ON ?AUTO_3204 ?AUTO_3205 )
      ( MAKE-ON-VERIFY ?AUTO_3204 ?AUTO_3205 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3311 - BLOCK
      ?AUTO_3312 - BLOCK
    )
    :vars
    (
      ?AUTO_3313 - BLOCK
      ?AUTO_3314 - BLOCK
      ?AUTO_3315 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3311 ?AUTO_3312 ) ) ( ON-TABLE ?AUTO_3311 ) ( CLEAR ?AUTO_3313 ) ( not ( = ?AUTO_3311 ?AUTO_3313 ) ) ( not ( = ?AUTO_3312 ?AUTO_3313 ) ) ( ON ?AUTO_3312 ?AUTO_3311 ) ( CLEAR ?AUTO_3312 ) ( HOLDING ?AUTO_3314 ) ( CLEAR ?AUTO_3315 ) ( not ( = ?AUTO_3311 ?AUTO_3314 ) ) ( not ( = ?AUTO_3311 ?AUTO_3315 ) ) ( not ( = ?AUTO_3312 ?AUTO_3314 ) ) ( not ( = ?AUTO_3312 ?AUTO_3315 ) ) ( not ( = ?AUTO_3313 ?AUTO_3314 ) ) ( not ( = ?AUTO_3313 ?AUTO_3315 ) ) ( not ( = ?AUTO_3314 ?AUTO_3315 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3314 ?AUTO_3315 )
      ( MAKE-ON ?AUTO_3311 ?AUTO_3312 )
      ( MAKE-ON-VERIFY ?AUTO_3311 ?AUTO_3312 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3348 - BLOCK
      ?AUTO_3349 - BLOCK
    )
    :vars
    (
      ?AUTO_3350 - BLOCK
      ?AUTO_3351 - BLOCK
      ?AUTO_3352 - BLOCK
      ?AUTO_3353 - BLOCK
      ?AUTO_3354 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3348 ?AUTO_3349 ) ) ( ON ?AUTO_3348 ?AUTO_3350 ) ( CLEAR ?AUTO_3348 ) ( not ( = ?AUTO_3348 ?AUTO_3350 ) ) ( not ( = ?AUTO_3349 ?AUTO_3350 ) ) ( CLEAR ?AUTO_3351 ) ( not ( = ?AUTO_3348 ?AUTO_3352 ) ) ( not ( = ?AUTO_3348 ?AUTO_3351 ) ) ( not ( = ?AUTO_3349 ?AUTO_3352 ) ) ( not ( = ?AUTO_3349 ?AUTO_3351 ) ) ( not ( = ?AUTO_3350 ?AUTO_3352 ) ) ( not ( = ?AUTO_3350 ?AUTO_3351 ) ) ( not ( = ?AUTO_3352 ?AUTO_3351 ) ) ( ON ?AUTO_3352 ?AUTO_3349 ) ( CLEAR ?AUTO_3352 ) ( HOLDING ?AUTO_3353 ) ( CLEAR ?AUTO_3354 ) ( not ( = ?AUTO_3348 ?AUTO_3353 ) ) ( not ( = ?AUTO_3348 ?AUTO_3354 ) ) ( not ( = ?AUTO_3349 ?AUTO_3353 ) ) ( not ( = ?AUTO_3349 ?AUTO_3354 ) ) ( not ( = ?AUTO_3350 ?AUTO_3353 ) ) ( not ( = ?AUTO_3350 ?AUTO_3354 ) ) ( not ( = ?AUTO_3351 ?AUTO_3353 ) ) ( not ( = ?AUTO_3351 ?AUTO_3354 ) ) ( not ( = ?AUTO_3352 ?AUTO_3353 ) ) ( not ( = ?AUTO_3352 ?AUTO_3354 ) ) ( not ( = ?AUTO_3353 ?AUTO_3354 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3353 ?AUTO_3354 )
      ( MAKE-ON ?AUTO_3348 ?AUTO_3349 )
      ( MAKE-ON-VERIFY ?AUTO_3348 ?AUTO_3349 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3448 - BLOCK
      ?AUTO_3449 - BLOCK
    )
    :vars
    (
      ?AUTO_3450 - BLOCK
      ?AUTO_3452 - BLOCK
      ?AUTO_3451 - BLOCK
      ?AUTO_3453 - BLOCK
      ?AUTO_3454 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3449 ) ( not ( = ?AUTO_3448 ?AUTO_3449 ) ) ( ON ?AUTO_3448 ?AUTO_3450 ) ( not ( = ?AUTO_3448 ?AUTO_3450 ) ) ( not ( = ?AUTO_3449 ?AUTO_3450 ) ) ( not ( = ?AUTO_3448 ?AUTO_3452 ) ) ( not ( = ?AUTO_3449 ?AUTO_3452 ) ) ( not ( = ?AUTO_3450 ?AUTO_3452 ) ) ( ON ?AUTO_3452 ?AUTO_3448 ) ( not ( = ?AUTO_3448 ?AUTO_3451 ) ) ( not ( = ?AUTO_3449 ?AUTO_3451 ) ) ( not ( = ?AUTO_3450 ?AUTO_3451 ) ) ( not ( = ?AUTO_3452 ?AUTO_3451 ) ) ( ON ?AUTO_3451 ?AUTO_3452 ) ( CLEAR ?AUTO_3451 ) ( HOLDING ?AUTO_3453 ) ( CLEAR ?AUTO_3454 ) ( not ( = ?AUTO_3448 ?AUTO_3453 ) ) ( not ( = ?AUTO_3448 ?AUTO_3454 ) ) ( not ( = ?AUTO_3449 ?AUTO_3453 ) ) ( not ( = ?AUTO_3449 ?AUTO_3454 ) ) ( not ( = ?AUTO_3450 ?AUTO_3453 ) ) ( not ( = ?AUTO_3450 ?AUTO_3454 ) ) ( not ( = ?AUTO_3452 ?AUTO_3453 ) ) ( not ( = ?AUTO_3452 ?AUTO_3454 ) ) ( not ( = ?AUTO_3451 ?AUTO_3453 ) ) ( not ( = ?AUTO_3451 ?AUTO_3454 ) ) ( not ( = ?AUTO_3453 ?AUTO_3454 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3453 ?AUTO_3454 )
      ( MAKE-ON ?AUTO_3448 ?AUTO_3449 )
      ( MAKE-ON-VERIFY ?AUTO_3448 ?AUTO_3449 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3462 - BLOCK
      ?AUTO_3463 - BLOCK
    )
    :vars
    (
      ?AUTO_3464 - BLOCK
      ?AUTO_3468 - BLOCK
      ?AUTO_3465 - BLOCK
      ?AUTO_3466 - BLOCK
      ?AUTO_3467 - BLOCK
      ?AUTO_3469 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3463 ) ( not ( = ?AUTO_3462 ?AUTO_3463 ) ) ( ON ?AUTO_3462 ?AUTO_3464 ) ( not ( = ?AUTO_3462 ?AUTO_3464 ) ) ( not ( = ?AUTO_3463 ?AUTO_3464 ) ) ( not ( = ?AUTO_3462 ?AUTO_3468 ) ) ( not ( = ?AUTO_3463 ?AUTO_3468 ) ) ( not ( = ?AUTO_3464 ?AUTO_3468 ) ) ( ON ?AUTO_3468 ?AUTO_3462 ) ( not ( = ?AUTO_3462 ?AUTO_3465 ) ) ( not ( = ?AUTO_3463 ?AUTO_3465 ) ) ( not ( = ?AUTO_3464 ?AUTO_3465 ) ) ( not ( = ?AUTO_3468 ?AUTO_3465 ) ) ( ON ?AUTO_3465 ?AUTO_3468 ) ( not ( = ?AUTO_3462 ?AUTO_3466 ) ) ( not ( = ?AUTO_3462 ?AUTO_3467 ) ) ( not ( = ?AUTO_3463 ?AUTO_3466 ) ) ( not ( = ?AUTO_3463 ?AUTO_3467 ) ) ( not ( = ?AUTO_3464 ?AUTO_3466 ) ) ( not ( = ?AUTO_3464 ?AUTO_3467 ) ) ( not ( = ?AUTO_3468 ?AUTO_3466 ) ) ( not ( = ?AUTO_3468 ?AUTO_3467 ) ) ( not ( = ?AUTO_3465 ?AUTO_3466 ) ) ( not ( = ?AUTO_3465 ?AUTO_3467 ) ) ( not ( = ?AUTO_3466 ?AUTO_3467 ) ) ( ON ?AUTO_3466 ?AUTO_3465 ) ( CLEAR ?AUTO_3466 ) ( HOLDING ?AUTO_3467 ) ( CLEAR ?AUTO_3469 ) ( not ( = ?AUTO_3462 ?AUTO_3469 ) ) ( not ( = ?AUTO_3463 ?AUTO_3469 ) ) ( not ( = ?AUTO_3464 ?AUTO_3469 ) ) ( not ( = ?AUTO_3468 ?AUTO_3469 ) ) ( not ( = ?AUTO_3465 ?AUTO_3469 ) ) ( not ( = ?AUTO_3466 ?AUTO_3469 ) ) ( not ( = ?AUTO_3467 ?AUTO_3469 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3467 ?AUTO_3469 )
      ( MAKE-ON ?AUTO_3462 ?AUTO_3463 )
      ( MAKE-ON-VERIFY ?AUTO_3462 ?AUTO_3463 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3630 - BLOCK
      ?AUTO_3631 - BLOCK
    )
    :vars
    (
      ?AUTO_3635 - BLOCK
      ?AUTO_3634 - BLOCK
      ?AUTO_3632 - BLOCK
      ?AUTO_3633 - BLOCK
      ?AUTO_3636 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3630 ?AUTO_3631 ) ) ( not ( = ?AUTO_3630 ?AUTO_3635 ) ) ( not ( = ?AUTO_3631 ?AUTO_3635 ) ) ( CLEAR ?AUTO_3634 ) ( not ( = ?AUTO_3630 ?AUTO_3632 ) ) ( not ( = ?AUTO_3630 ?AUTO_3634 ) ) ( not ( = ?AUTO_3631 ?AUTO_3632 ) ) ( not ( = ?AUTO_3631 ?AUTO_3634 ) ) ( not ( = ?AUTO_3635 ?AUTO_3632 ) ) ( not ( = ?AUTO_3635 ?AUTO_3634 ) ) ( not ( = ?AUTO_3632 ?AUTO_3634 ) ) ( ON ?AUTO_3632 ?AUTO_3631 ) ( not ( = ?AUTO_3630 ?AUTO_3633 ) ) ( not ( = ?AUTO_3631 ?AUTO_3633 ) ) ( not ( = ?AUTO_3635 ?AUTO_3633 ) ) ( not ( = ?AUTO_3634 ?AUTO_3633 ) ) ( not ( = ?AUTO_3632 ?AUTO_3633 ) ) ( ON ?AUTO_3633 ?AUTO_3632 ) ( not ( = ?AUTO_3630 ?AUTO_3636 ) ) ( not ( = ?AUTO_3631 ?AUTO_3636 ) ) ( not ( = ?AUTO_3635 ?AUTO_3636 ) ) ( not ( = ?AUTO_3634 ?AUTO_3636 ) ) ( not ( = ?AUTO_3632 ?AUTO_3636 ) ) ( not ( = ?AUTO_3633 ?AUTO_3636 ) ) ( ON ?AUTO_3636 ?AUTO_3633 ) ( CLEAR ?AUTO_3636 ) ( HOLDING ?AUTO_3630 ) ( CLEAR ?AUTO_3635 ) )
    :subtasks
    ( ( !STACK ?AUTO_3630 ?AUTO_3635 )
      ( MAKE-ON ?AUTO_3630 ?AUTO_3631 )
      ( MAKE-ON-VERIFY ?AUTO_3630 ?AUTO_3631 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3644 - BLOCK
      ?AUTO_3645 - BLOCK
    )
    :vars
    (
      ?AUTO_3647 - BLOCK
      ?AUTO_3646 - BLOCK
      ?AUTO_3650 - BLOCK
      ?AUTO_3649 - BLOCK
      ?AUTO_3648 - BLOCK
      ?AUTO_3651 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3644 ?AUTO_3645 ) ) ( not ( = ?AUTO_3644 ?AUTO_3647 ) ) ( not ( = ?AUTO_3645 ?AUTO_3647 ) ) ( CLEAR ?AUTO_3646 ) ( not ( = ?AUTO_3644 ?AUTO_3650 ) ) ( not ( = ?AUTO_3644 ?AUTO_3646 ) ) ( not ( = ?AUTO_3645 ?AUTO_3650 ) ) ( not ( = ?AUTO_3645 ?AUTO_3646 ) ) ( not ( = ?AUTO_3647 ?AUTO_3650 ) ) ( not ( = ?AUTO_3647 ?AUTO_3646 ) ) ( not ( = ?AUTO_3650 ?AUTO_3646 ) ) ( ON ?AUTO_3650 ?AUTO_3645 ) ( not ( = ?AUTO_3644 ?AUTO_3649 ) ) ( not ( = ?AUTO_3645 ?AUTO_3649 ) ) ( not ( = ?AUTO_3647 ?AUTO_3649 ) ) ( not ( = ?AUTO_3646 ?AUTO_3649 ) ) ( not ( = ?AUTO_3650 ?AUTO_3649 ) ) ( ON ?AUTO_3649 ?AUTO_3650 ) ( not ( = ?AUTO_3644 ?AUTO_3648 ) ) ( not ( = ?AUTO_3645 ?AUTO_3648 ) ) ( not ( = ?AUTO_3647 ?AUTO_3648 ) ) ( not ( = ?AUTO_3646 ?AUTO_3648 ) ) ( not ( = ?AUTO_3650 ?AUTO_3648 ) ) ( not ( = ?AUTO_3649 ?AUTO_3648 ) ) ( ON ?AUTO_3648 ?AUTO_3649 ) ( ON ?AUTO_3644 ?AUTO_3648 ) ( CLEAR ?AUTO_3644 ) ( HOLDING ?AUTO_3647 ) ( CLEAR ?AUTO_3651 ) ( not ( = ?AUTO_3644 ?AUTO_3651 ) ) ( not ( = ?AUTO_3645 ?AUTO_3651 ) ) ( not ( = ?AUTO_3647 ?AUTO_3651 ) ) ( not ( = ?AUTO_3646 ?AUTO_3651 ) ) ( not ( = ?AUTO_3650 ?AUTO_3651 ) ) ( not ( = ?AUTO_3649 ?AUTO_3651 ) ) ( not ( = ?AUTO_3648 ?AUTO_3651 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3647 ?AUTO_3651 )
      ( MAKE-ON ?AUTO_3644 ?AUTO_3645 )
      ( MAKE-ON-VERIFY ?AUTO_3644 ?AUTO_3645 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3716 - BLOCK
      ?AUTO_3717 - BLOCK
    )
    :vars
    (
      ?AUTO_3719 - BLOCK
      ?AUTO_3720 - BLOCK
      ?AUTO_3718 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3716 ?AUTO_3717 ) ) ( not ( = ?AUTO_3716 ?AUTO_3719 ) ) ( not ( = ?AUTO_3717 ?AUTO_3719 ) ) ( CLEAR ?AUTO_3720 ) ( not ( = ?AUTO_3716 ?AUTO_3718 ) ) ( not ( = ?AUTO_3716 ?AUTO_3720 ) ) ( not ( = ?AUTO_3717 ?AUTO_3718 ) ) ( not ( = ?AUTO_3717 ?AUTO_3720 ) ) ( not ( = ?AUTO_3719 ?AUTO_3718 ) ) ( not ( = ?AUTO_3719 ?AUTO_3720 ) ) ( not ( = ?AUTO_3718 ?AUTO_3720 ) ) ( ON ?AUTO_3718 ?AUTO_3717 ) ( CLEAR ?AUTO_3718 ) ( CLEAR ?AUTO_3719 ) ( ON-TABLE ?AUTO_3716 ) ( CLEAR ?AUTO_3716 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_3716 )
      ( MAKE-ON ?AUTO_3716 ?AUTO_3717 )
      ( MAKE-ON-VERIFY ?AUTO_3716 ?AUTO_3717 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3912 - BLOCK
      ?AUTO_3913 - BLOCK
    )
    :vars
    (
      ?AUTO_3914 - BLOCK
      ?AUTO_3915 - BLOCK
      ?AUTO_3916 - BLOCK
      ?AUTO_3917 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3912 ?AUTO_3913 ) ) ( ON-TABLE ?AUTO_3912 ) ( not ( = ?AUTO_3912 ?AUTO_3914 ) ) ( not ( = ?AUTO_3913 ?AUTO_3914 ) ) ( ON ?AUTO_3914 ?AUTO_3912 ) ( CLEAR ?AUTO_3914 ) ( not ( = ?AUTO_3912 ?AUTO_3915 ) ) ( not ( = ?AUTO_3912 ?AUTO_3916 ) ) ( not ( = ?AUTO_3913 ?AUTO_3915 ) ) ( not ( = ?AUTO_3913 ?AUTO_3916 ) ) ( not ( = ?AUTO_3914 ?AUTO_3915 ) ) ( not ( = ?AUTO_3914 ?AUTO_3916 ) ) ( not ( = ?AUTO_3915 ?AUTO_3916 ) ) ( ON ?AUTO_3915 ?AUTO_3913 ) ( CLEAR ?AUTO_3915 ) ( HOLDING ?AUTO_3916 ) ( CLEAR ?AUTO_3917 ) ( not ( = ?AUTO_3912 ?AUTO_3917 ) ) ( not ( = ?AUTO_3913 ?AUTO_3917 ) ) ( not ( = ?AUTO_3914 ?AUTO_3917 ) ) ( not ( = ?AUTO_3915 ?AUTO_3917 ) ) ( not ( = ?AUTO_3916 ?AUTO_3917 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3916 ?AUTO_3917 )
      ( MAKE-ON ?AUTO_3912 ?AUTO_3913 )
      ( MAKE-ON-VERIFY ?AUTO_3912 ?AUTO_3913 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3918 - BLOCK
      ?AUTO_3919 - BLOCK
    )
    :vars
    (
      ?AUTO_3921 - BLOCK
      ?AUTO_3922 - BLOCK
      ?AUTO_3923 - BLOCK
      ?AUTO_3920 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3918 ?AUTO_3919 ) ) ( ON-TABLE ?AUTO_3918 ) ( not ( = ?AUTO_3918 ?AUTO_3921 ) ) ( not ( = ?AUTO_3919 ?AUTO_3921 ) ) ( ON ?AUTO_3921 ?AUTO_3918 ) ( not ( = ?AUTO_3918 ?AUTO_3922 ) ) ( not ( = ?AUTO_3918 ?AUTO_3923 ) ) ( not ( = ?AUTO_3919 ?AUTO_3922 ) ) ( not ( = ?AUTO_3919 ?AUTO_3923 ) ) ( not ( = ?AUTO_3921 ?AUTO_3922 ) ) ( not ( = ?AUTO_3921 ?AUTO_3923 ) ) ( not ( = ?AUTO_3922 ?AUTO_3923 ) ) ( ON ?AUTO_3922 ?AUTO_3919 ) ( CLEAR ?AUTO_3922 ) ( CLEAR ?AUTO_3920 ) ( not ( = ?AUTO_3918 ?AUTO_3920 ) ) ( not ( = ?AUTO_3919 ?AUTO_3920 ) ) ( not ( = ?AUTO_3921 ?AUTO_3920 ) ) ( not ( = ?AUTO_3922 ?AUTO_3920 ) ) ( not ( = ?AUTO_3923 ?AUTO_3920 ) ) ( ON ?AUTO_3923 ?AUTO_3921 ) ( CLEAR ?AUTO_3923 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3923 ?AUTO_3921 )
      ( MAKE-ON ?AUTO_3918 ?AUTO_3919 )
      ( MAKE-ON-VERIFY ?AUTO_3918 ?AUTO_3919 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3924 - BLOCK
      ?AUTO_3925 - BLOCK
    )
    :vars
    (
      ?AUTO_3927 - BLOCK
      ?AUTO_3928 - BLOCK
      ?AUTO_3929 - BLOCK
      ?AUTO_3926 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3924 ?AUTO_3925 ) ) ( ON-TABLE ?AUTO_3924 ) ( not ( = ?AUTO_3924 ?AUTO_3927 ) ) ( not ( = ?AUTO_3925 ?AUTO_3927 ) ) ( ON ?AUTO_3927 ?AUTO_3924 ) ( not ( = ?AUTO_3924 ?AUTO_3928 ) ) ( not ( = ?AUTO_3924 ?AUTO_3929 ) ) ( not ( = ?AUTO_3925 ?AUTO_3928 ) ) ( not ( = ?AUTO_3925 ?AUTO_3929 ) ) ( not ( = ?AUTO_3927 ?AUTO_3928 ) ) ( not ( = ?AUTO_3927 ?AUTO_3929 ) ) ( not ( = ?AUTO_3928 ?AUTO_3929 ) ) ( CLEAR ?AUTO_3926 ) ( not ( = ?AUTO_3924 ?AUTO_3926 ) ) ( not ( = ?AUTO_3925 ?AUTO_3926 ) ) ( not ( = ?AUTO_3927 ?AUTO_3926 ) ) ( not ( = ?AUTO_3928 ?AUTO_3926 ) ) ( not ( = ?AUTO_3929 ?AUTO_3926 ) ) ( ON ?AUTO_3929 ?AUTO_3927 ) ( CLEAR ?AUTO_3929 ) ( HOLDING ?AUTO_3928 ) ( CLEAR ?AUTO_3925 ) )
    :subtasks
    ( ( !STACK ?AUTO_3928 ?AUTO_3925 )
      ( MAKE-ON ?AUTO_3924 ?AUTO_3925 )
      ( MAKE-ON-VERIFY ?AUTO_3924 ?AUTO_3925 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3936 - BLOCK
      ?AUTO_3937 - BLOCK
    )
    :vars
    (
      ?AUTO_3939 - BLOCK
      ?AUTO_3940 - BLOCK
      ?AUTO_3941 - BLOCK
      ?AUTO_3938 - BLOCK
      ?AUTO_3942 - BLOCK
      ?AUTO_3943 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3936 ?AUTO_3937 ) ) ( ON-TABLE ?AUTO_3936 ) ( not ( = ?AUTO_3936 ?AUTO_3939 ) ) ( not ( = ?AUTO_3937 ?AUTO_3939 ) ) ( ON ?AUTO_3939 ?AUTO_3936 ) ( not ( = ?AUTO_3936 ?AUTO_3940 ) ) ( not ( = ?AUTO_3936 ?AUTO_3941 ) ) ( not ( = ?AUTO_3937 ?AUTO_3940 ) ) ( not ( = ?AUTO_3937 ?AUTO_3941 ) ) ( not ( = ?AUTO_3939 ?AUTO_3940 ) ) ( not ( = ?AUTO_3939 ?AUTO_3941 ) ) ( not ( = ?AUTO_3940 ?AUTO_3941 ) ) ( CLEAR ?AUTO_3938 ) ( not ( = ?AUTO_3936 ?AUTO_3938 ) ) ( not ( = ?AUTO_3937 ?AUTO_3938 ) ) ( not ( = ?AUTO_3939 ?AUTO_3938 ) ) ( not ( = ?AUTO_3940 ?AUTO_3938 ) ) ( not ( = ?AUTO_3941 ?AUTO_3938 ) ) ( ON ?AUTO_3941 ?AUTO_3939 ) ( CLEAR ?AUTO_3937 ) ( ON ?AUTO_3940 ?AUTO_3941 ) ( CLEAR ?AUTO_3940 ) ( HOLDING ?AUTO_3942 ) ( CLEAR ?AUTO_3943 ) ( not ( = ?AUTO_3936 ?AUTO_3942 ) ) ( not ( = ?AUTO_3936 ?AUTO_3943 ) ) ( not ( = ?AUTO_3937 ?AUTO_3942 ) ) ( not ( = ?AUTO_3937 ?AUTO_3943 ) ) ( not ( = ?AUTO_3939 ?AUTO_3942 ) ) ( not ( = ?AUTO_3939 ?AUTO_3943 ) ) ( not ( = ?AUTO_3940 ?AUTO_3942 ) ) ( not ( = ?AUTO_3940 ?AUTO_3943 ) ) ( not ( = ?AUTO_3941 ?AUTO_3942 ) ) ( not ( = ?AUTO_3941 ?AUTO_3943 ) ) ( not ( = ?AUTO_3938 ?AUTO_3942 ) ) ( not ( = ?AUTO_3938 ?AUTO_3943 ) ) ( not ( = ?AUTO_3942 ?AUTO_3943 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3942 ?AUTO_3943 )
      ( MAKE-ON ?AUTO_3936 ?AUTO_3937 )
      ( MAKE-ON-VERIFY ?AUTO_3936 ?AUTO_3937 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3956 - BLOCK
      ?AUTO_3957 - BLOCK
    )
    :vars
    (
      ?AUTO_3958 - BLOCK
      ?AUTO_3963 - BLOCK
      ?AUTO_3962 - BLOCK
      ?AUTO_3959 - BLOCK
      ?AUTO_3960 - BLOCK
      ?AUTO_3961 - BLOCK
      ?AUTO_3964 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3956 ?AUTO_3957 ) ) ( ON-TABLE ?AUTO_3956 ) ( not ( = ?AUTO_3956 ?AUTO_3958 ) ) ( not ( = ?AUTO_3957 ?AUTO_3958 ) ) ( ON ?AUTO_3958 ?AUTO_3956 ) ( not ( = ?AUTO_3956 ?AUTO_3963 ) ) ( not ( = ?AUTO_3956 ?AUTO_3962 ) ) ( not ( = ?AUTO_3957 ?AUTO_3963 ) ) ( not ( = ?AUTO_3957 ?AUTO_3962 ) ) ( not ( = ?AUTO_3958 ?AUTO_3963 ) ) ( not ( = ?AUTO_3958 ?AUTO_3962 ) ) ( not ( = ?AUTO_3963 ?AUTO_3962 ) ) ( CLEAR ?AUTO_3959 ) ( not ( = ?AUTO_3956 ?AUTO_3959 ) ) ( not ( = ?AUTO_3957 ?AUTO_3959 ) ) ( not ( = ?AUTO_3958 ?AUTO_3959 ) ) ( not ( = ?AUTO_3963 ?AUTO_3959 ) ) ( not ( = ?AUTO_3962 ?AUTO_3959 ) ) ( ON ?AUTO_3962 ?AUTO_3958 ) ( ON ?AUTO_3963 ?AUTO_3962 ) ( CLEAR ?AUTO_3963 ) ( CLEAR ?AUTO_3960 ) ( not ( = ?AUTO_3956 ?AUTO_3961 ) ) ( not ( = ?AUTO_3956 ?AUTO_3960 ) ) ( not ( = ?AUTO_3957 ?AUTO_3961 ) ) ( not ( = ?AUTO_3957 ?AUTO_3960 ) ) ( not ( = ?AUTO_3958 ?AUTO_3961 ) ) ( not ( = ?AUTO_3958 ?AUTO_3960 ) ) ( not ( = ?AUTO_3963 ?AUTO_3961 ) ) ( not ( = ?AUTO_3963 ?AUTO_3960 ) ) ( not ( = ?AUTO_3962 ?AUTO_3961 ) ) ( not ( = ?AUTO_3962 ?AUTO_3960 ) ) ( not ( = ?AUTO_3959 ?AUTO_3961 ) ) ( not ( = ?AUTO_3959 ?AUTO_3960 ) ) ( not ( = ?AUTO_3961 ?AUTO_3960 ) ) ( ON ?AUTO_3961 ?AUTO_3957 ) ( CLEAR ?AUTO_3961 ) ( HOLDING ?AUTO_3964 ) ( not ( = ?AUTO_3956 ?AUTO_3964 ) ) ( not ( = ?AUTO_3957 ?AUTO_3964 ) ) ( not ( = ?AUTO_3958 ?AUTO_3964 ) ) ( not ( = ?AUTO_3963 ?AUTO_3964 ) ) ( not ( = ?AUTO_3962 ?AUTO_3964 ) ) ( not ( = ?AUTO_3959 ?AUTO_3964 ) ) ( not ( = ?AUTO_3960 ?AUTO_3964 ) ) ( not ( = ?AUTO_3961 ?AUTO_3964 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3964 )
      ( MAKE-ON ?AUTO_3956 ?AUTO_3957 )
      ( MAKE-ON-VERIFY ?AUTO_3956 ?AUTO_3957 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3965 - BLOCK
      ?AUTO_3966 - BLOCK
    )
    :vars
    (
      ?AUTO_3968 - BLOCK
      ?AUTO_3971 - BLOCK
      ?AUTO_3970 - BLOCK
      ?AUTO_3972 - BLOCK
      ?AUTO_3973 - BLOCK
      ?AUTO_3969 - BLOCK
      ?AUTO_3967 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3965 ?AUTO_3966 ) ) ( ON-TABLE ?AUTO_3965 ) ( not ( = ?AUTO_3965 ?AUTO_3968 ) ) ( not ( = ?AUTO_3966 ?AUTO_3968 ) ) ( ON ?AUTO_3968 ?AUTO_3965 ) ( not ( = ?AUTO_3965 ?AUTO_3971 ) ) ( not ( = ?AUTO_3965 ?AUTO_3970 ) ) ( not ( = ?AUTO_3966 ?AUTO_3971 ) ) ( not ( = ?AUTO_3966 ?AUTO_3970 ) ) ( not ( = ?AUTO_3968 ?AUTO_3971 ) ) ( not ( = ?AUTO_3968 ?AUTO_3970 ) ) ( not ( = ?AUTO_3971 ?AUTO_3970 ) ) ( CLEAR ?AUTO_3972 ) ( not ( = ?AUTO_3965 ?AUTO_3972 ) ) ( not ( = ?AUTO_3966 ?AUTO_3972 ) ) ( not ( = ?AUTO_3968 ?AUTO_3972 ) ) ( not ( = ?AUTO_3971 ?AUTO_3972 ) ) ( not ( = ?AUTO_3970 ?AUTO_3972 ) ) ( ON ?AUTO_3970 ?AUTO_3968 ) ( ON ?AUTO_3971 ?AUTO_3970 ) ( CLEAR ?AUTO_3971 ) ( CLEAR ?AUTO_3973 ) ( not ( = ?AUTO_3965 ?AUTO_3969 ) ) ( not ( = ?AUTO_3965 ?AUTO_3973 ) ) ( not ( = ?AUTO_3966 ?AUTO_3969 ) ) ( not ( = ?AUTO_3966 ?AUTO_3973 ) ) ( not ( = ?AUTO_3968 ?AUTO_3969 ) ) ( not ( = ?AUTO_3968 ?AUTO_3973 ) ) ( not ( = ?AUTO_3971 ?AUTO_3969 ) ) ( not ( = ?AUTO_3971 ?AUTO_3973 ) ) ( not ( = ?AUTO_3970 ?AUTO_3969 ) ) ( not ( = ?AUTO_3970 ?AUTO_3973 ) ) ( not ( = ?AUTO_3972 ?AUTO_3969 ) ) ( not ( = ?AUTO_3972 ?AUTO_3973 ) ) ( not ( = ?AUTO_3969 ?AUTO_3973 ) ) ( ON ?AUTO_3969 ?AUTO_3966 ) ( not ( = ?AUTO_3965 ?AUTO_3967 ) ) ( not ( = ?AUTO_3966 ?AUTO_3967 ) ) ( not ( = ?AUTO_3968 ?AUTO_3967 ) ) ( not ( = ?AUTO_3971 ?AUTO_3967 ) ) ( not ( = ?AUTO_3970 ?AUTO_3967 ) ) ( not ( = ?AUTO_3972 ?AUTO_3967 ) ) ( not ( = ?AUTO_3973 ?AUTO_3967 ) ) ( not ( = ?AUTO_3969 ?AUTO_3967 ) ) ( ON ?AUTO_3967 ?AUTO_3969 ) ( CLEAR ?AUTO_3967 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3967 ?AUTO_3969 )
      ( MAKE-ON ?AUTO_3965 ?AUTO_3966 )
      ( MAKE-ON-VERIFY ?AUTO_3965 ?AUTO_3966 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3974 - BLOCK
      ?AUTO_3975 - BLOCK
    )
    :vars
    (
      ?AUTO_3979 - BLOCK
      ?AUTO_3980 - BLOCK
      ?AUTO_3976 - BLOCK
      ?AUTO_3977 - BLOCK
      ?AUTO_3978 - BLOCK
      ?AUTO_3981 - BLOCK
      ?AUTO_3982 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3974 ?AUTO_3975 ) ) ( ON-TABLE ?AUTO_3974 ) ( not ( = ?AUTO_3974 ?AUTO_3979 ) ) ( not ( = ?AUTO_3975 ?AUTO_3979 ) ) ( ON ?AUTO_3979 ?AUTO_3974 ) ( not ( = ?AUTO_3974 ?AUTO_3980 ) ) ( not ( = ?AUTO_3974 ?AUTO_3976 ) ) ( not ( = ?AUTO_3975 ?AUTO_3980 ) ) ( not ( = ?AUTO_3975 ?AUTO_3976 ) ) ( not ( = ?AUTO_3979 ?AUTO_3980 ) ) ( not ( = ?AUTO_3979 ?AUTO_3976 ) ) ( not ( = ?AUTO_3980 ?AUTO_3976 ) ) ( not ( = ?AUTO_3974 ?AUTO_3977 ) ) ( not ( = ?AUTO_3975 ?AUTO_3977 ) ) ( not ( = ?AUTO_3979 ?AUTO_3977 ) ) ( not ( = ?AUTO_3980 ?AUTO_3977 ) ) ( not ( = ?AUTO_3976 ?AUTO_3977 ) ) ( ON ?AUTO_3976 ?AUTO_3979 ) ( ON ?AUTO_3980 ?AUTO_3976 ) ( CLEAR ?AUTO_3980 ) ( CLEAR ?AUTO_3978 ) ( not ( = ?AUTO_3974 ?AUTO_3981 ) ) ( not ( = ?AUTO_3974 ?AUTO_3978 ) ) ( not ( = ?AUTO_3975 ?AUTO_3981 ) ) ( not ( = ?AUTO_3975 ?AUTO_3978 ) ) ( not ( = ?AUTO_3979 ?AUTO_3981 ) ) ( not ( = ?AUTO_3979 ?AUTO_3978 ) ) ( not ( = ?AUTO_3980 ?AUTO_3981 ) ) ( not ( = ?AUTO_3980 ?AUTO_3978 ) ) ( not ( = ?AUTO_3976 ?AUTO_3981 ) ) ( not ( = ?AUTO_3976 ?AUTO_3978 ) ) ( not ( = ?AUTO_3977 ?AUTO_3981 ) ) ( not ( = ?AUTO_3977 ?AUTO_3978 ) ) ( not ( = ?AUTO_3981 ?AUTO_3978 ) ) ( ON ?AUTO_3981 ?AUTO_3975 ) ( not ( = ?AUTO_3974 ?AUTO_3982 ) ) ( not ( = ?AUTO_3975 ?AUTO_3982 ) ) ( not ( = ?AUTO_3979 ?AUTO_3982 ) ) ( not ( = ?AUTO_3980 ?AUTO_3982 ) ) ( not ( = ?AUTO_3976 ?AUTO_3982 ) ) ( not ( = ?AUTO_3977 ?AUTO_3982 ) ) ( not ( = ?AUTO_3978 ?AUTO_3982 ) ) ( not ( = ?AUTO_3981 ?AUTO_3982 ) ) ( ON ?AUTO_3982 ?AUTO_3981 ) ( CLEAR ?AUTO_3982 ) ( HOLDING ?AUTO_3977 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3977 )
      ( MAKE-ON ?AUTO_3974 ?AUTO_3975 )
      ( MAKE-ON-VERIFY ?AUTO_3974 ?AUTO_3975 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3983 - BLOCK
      ?AUTO_3984 - BLOCK
    )
    :vars
    (
      ?AUTO_3987 - BLOCK
      ?AUTO_3989 - BLOCK
      ?AUTO_3991 - BLOCK
      ?AUTO_3986 - BLOCK
      ?AUTO_3990 - BLOCK
      ?AUTO_3985 - BLOCK
      ?AUTO_3988 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3983 ?AUTO_3984 ) ) ( ON-TABLE ?AUTO_3983 ) ( not ( = ?AUTO_3983 ?AUTO_3987 ) ) ( not ( = ?AUTO_3984 ?AUTO_3987 ) ) ( ON ?AUTO_3987 ?AUTO_3983 ) ( not ( = ?AUTO_3983 ?AUTO_3989 ) ) ( not ( = ?AUTO_3983 ?AUTO_3991 ) ) ( not ( = ?AUTO_3984 ?AUTO_3989 ) ) ( not ( = ?AUTO_3984 ?AUTO_3991 ) ) ( not ( = ?AUTO_3987 ?AUTO_3989 ) ) ( not ( = ?AUTO_3987 ?AUTO_3991 ) ) ( not ( = ?AUTO_3989 ?AUTO_3991 ) ) ( not ( = ?AUTO_3983 ?AUTO_3986 ) ) ( not ( = ?AUTO_3984 ?AUTO_3986 ) ) ( not ( = ?AUTO_3987 ?AUTO_3986 ) ) ( not ( = ?AUTO_3989 ?AUTO_3986 ) ) ( not ( = ?AUTO_3991 ?AUTO_3986 ) ) ( ON ?AUTO_3991 ?AUTO_3987 ) ( ON ?AUTO_3989 ?AUTO_3991 ) ( CLEAR ?AUTO_3989 ) ( CLEAR ?AUTO_3990 ) ( not ( = ?AUTO_3983 ?AUTO_3985 ) ) ( not ( = ?AUTO_3983 ?AUTO_3990 ) ) ( not ( = ?AUTO_3984 ?AUTO_3985 ) ) ( not ( = ?AUTO_3984 ?AUTO_3990 ) ) ( not ( = ?AUTO_3987 ?AUTO_3985 ) ) ( not ( = ?AUTO_3987 ?AUTO_3990 ) ) ( not ( = ?AUTO_3989 ?AUTO_3985 ) ) ( not ( = ?AUTO_3989 ?AUTO_3990 ) ) ( not ( = ?AUTO_3991 ?AUTO_3985 ) ) ( not ( = ?AUTO_3991 ?AUTO_3990 ) ) ( not ( = ?AUTO_3986 ?AUTO_3985 ) ) ( not ( = ?AUTO_3986 ?AUTO_3990 ) ) ( not ( = ?AUTO_3985 ?AUTO_3990 ) ) ( ON ?AUTO_3985 ?AUTO_3984 ) ( not ( = ?AUTO_3983 ?AUTO_3988 ) ) ( not ( = ?AUTO_3984 ?AUTO_3988 ) ) ( not ( = ?AUTO_3987 ?AUTO_3988 ) ) ( not ( = ?AUTO_3989 ?AUTO_3988 ) ) ( not ( = ?AUTO_3991 ?AUTO_3988 ) ) ( not ( = ?AUTO_3986 ?AUTO_3988 ) ) ( not ( = ?AUTO_3990 ?AUTO_3988 ) ) ( not ( = ?AUTO_3985 ?AUTO_3988 ) ) ( ON ?AUTO_3988 ?AUTO_3985 ) ( ON ?AUTO_3986 ?AUTO_3988 ) ( CLEAR ?AUTO_3986 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3986 ?AUTO_3988 )
      ( MAKE-ON ?AUTO_3983 ?AUTO_3984 )
      ( MAKE-ON-VERIFY ?AUTO_3983 ?AUTO_3984 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3992 - BLOCK
      ?AUTO_3993 - BLOCK
    )
    :vars
    (
      ?AUTO_3995 - BLOCK
      ?AUTO_4000 - BLOCK
      ?AUTO_3998 - BLOCK
      ?AUTO_3994 - BLOCK
      ?AUTO_3999 - BLOCK
      ?AUTO_3996 - BLOCK
      ?AUTO_3997 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3992 ?AUTO_3993 ) ) ( ON-TABLE ?AUTO_3992 ) ( not ( = ?AUTO_3992 ?AUTO_3995 ) ) ( not ( = ?AUTO_3993 ?AUTO_3995 ) ) ( ON ?AUTO_3995 ?AUTO_3992 ) ( not ( = ?AUTO_3992 ?AUTO_4000 ) ) ( not ( = ?AUTO_3992 ?AUTO_3998 ) ) ( not ( = ?AUTO_3993 ?AUTO_4000 ) ) ( not ( = ?AUTO_3993 ?AUTO_3998 ) ) ( not ( = ?AUTO_3995 ?AUTO_4000 ) ) ( not ( = ?AUTO_3995 ?AUTO_3998 ) ) ( not ( = ?AUTO_4000 ?AUTO_3998 ) ) ( not ( = ?AUTO_3992 ?AUTO_3994 ) ) ( not ( = ?AUTO_3993 ?AUTO_3994 ) ) ( not ( = ?AUTO_3995 ?AUTO_3994 ) ) ( not ( = ?AUTO_4000 ?AUTO_3994 ) ) ( not ( = ?AUTO_3998 ?AUTO_3994 ) ) ( ON ?AUTO_3998 ?AUTO_3995 ) ( CLEAR ?AUTO_3999 ) ( not ( = ?AUTO_3992 ?AUTO_3996 ) ) ( not ( = ?AUTO_3992 ?AUTO_3999 ) ) ( not ( = ?AUTO_3993 ?AUTO_3996 ) ) ( not ( = ?AUTO_3993 ?AUTO_3999 ) ) ( not ( = ?AUTO_3995 ?AUTO_3996 ) ) ( not ( = ?AUTO_3995 ?AUTO_3999 ) ) ( not ( = ?AUTO_4000 ?AUTO_3996 ) ) ( not ( = ?AUTO_4000 ?AUTO_3999 ) ) ( not ( = ?AUTO_3998 ?AUTO_3996 ) ) ( not ( = ?AUTO_3998 ?AUTO_3999 ) ) ( not ( = ?AUTO_3994 ?AUTO_3996 ) ) ( not ( = ?AUTO_3994 ?AUTO_3999 ) ) ( not ( = ?AUTO_3996 ?AUTO_3999 ) ) ( ON ?AUTO_3996 ?AUTO_3993 ) ( not ( = ?AUTO_3992 ?AUTO_3997 ) ) ( not ( = ?AUTO_3993 ?AUTO_3997 ) ) ( not ( = ?AUTO_3995 ?AUTO_3997 ) ) ( not ( = ?AUTO_4000 ?AUTO_3997 ) ) ( not ( = ?AUTO_3998 ?AUTO_3997 ) ) ( not ( = ?AUTO_3994 ?AUTO_3997 ) ) ( not ( = ?AUTO_3999 ?AUTO_3997 ) ) ( not ( = ?AUTO_3996 ?AUTO_3997 ) ) ( ON ?AUTO_3997 ?AUTO_3996 ) ( ON ?AUTO_3994 ?AUTO_3997 ) ( CLEAR ?AUTO_3994 ) ( HOLDING ?AUTO_4000 ) ( CLEAR ?AUTO_3998 ) )
    :subtasks
    ( ( !STACK ?AUTO_4000 ?AUTO_3998 )
      ( MAKE-ON ?AUTO_3992 ?AUTO_3993 )
      ( MAKE-ON-VERIFY ?AUTO_3992 ?AUTO_3993 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4001 - BLOCK
      ?AUTO_4002 - BLOCK
    )
    :vars
    (
      ?AUTO_4009 - BLOCK
      ?AUTO_4003 - BLOCK
      ?AUTO_4005 - BLOCK
      ?AUTO_4008 - BLOCK
      ?AUTO_4006 - BLOCK
      ?AUTO_4007 - BLOCK
      ?AUTO_4004 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4001 ?AUTO_4002 ) ) ( ON-TABLE ?AUTO_4001 ) ( not ( = ?AUTO_4001 ?AUTO_4009 ) ) ( not ( = ?AUTO_4002 ?AUTO_4009 ) ) ( ON ?AUTO_4009 ?AUTO_4001 ) ( not ( = ?AUTO_4001 ?AUTO_4003 ) ) ( not ( = ?AUTO_4001 ?AUTO_4005 ) ) ( not ( = ?AUTO_4002 ?AUTO_4003 ) ) ( not ( = ?AUTO_4002 ?AUTO_4005 ) ) ( not ( = ?AUTO_4009 ?AUTO_4003 ) ) ( not ( = ?AUTO_4009 ?AUTO_4005 ) ) ( not ( = ?AUTO_4003 ?AUTO_4005 ) ) ( not ( = ?AUTO_4001 ?AUTO_4008 ) ) ( not ( = ?AUTO_4002 ?AUTO_4008 ) ) ( not ( = ?AUTO_4009 ?AUTO_4008 ) ) ( not ( = ?AUTO_4003 ?AUTO_4008 ) ) ( not ( = ?AUTO_4005 ?AUTO_4008 ) ) ( ON ?AUTO_4005 ?AUTO_4009 ) ( CLEAR ?AUTO_4006 ) ( not ( = ?AUTO_4001 ?AUTO_4007 ) ) ( not ( = ?AUTO_4001 ?AUTO_4006 ) ) ( not ( = ?AUTO_4002 ?AUTO_4007 ) ) ( not ( = ?AUTO_4002 ?AUTO_4006 ) ) ( not ( = ?AUTO_4009 ?AUTO_4007 ) ) ( not ( = ?AUTO_4009 ?AUTO_4006 ) ) ( not ( = ?AUTO_4003 ?AUTO_4007 ) ) ( not ( = ?AUTO_4003 ?AUTO_4006 ) ) ( not ( = ?AUTO_4005 ?AUTO_4007 ) ) ( not ( = ?AUTO_4005 ?AUTO_4006 ) ) ( not ( = ?AUTO_4008 ?AUTO_4007 ) ) ( not ( = ?AUTO_4008 ?AUTO_4006 ) ) ( not ( = ?AUTO_4007 ?AUTO_4006 ) ) ( ON ?AUTO_4007 ?AUTO_4002 ) ( not ( = ?AUTO_4001 ?AUTO_4004 ) ) ( not ( = ?AUTO_4002 ?AUTO_4004 ) ) ( not ( = ?AUTO_4009 ?AUTO_4004 ) ) ( not ( = ?AUTO_4003 ?AUTO_4004 ) ) ( not ( = ?AUTO_4005 ?AUTO_4004 ) ) ( not ( = ?AUTO_4008 ?AUTO_4004 ) ) ( not ( = ?AUTO_4006 ?AUTO_4004 ) ) ( not ( = ?AUTO_4007 ?AUTO_4004 ) ) ( ON ?AUTO_4004 ?AUTO_4007 ) ( ON ?AUTO_4008 ?AUTO_4004 ) ( CLEAR ?AUTO_4005 ) ( ON ?AUTO_4003 ?AUTO_4008 ) ( CLEAR ?AUTO_4003 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4003 ?AUTO_4008 )
      ( MAKE-ON ?AUTO_4001 ?AUTO_4002 )
      ( MAKE-ON-VERIFY ?AUTO_4001 ?AUTO_4002 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4010 - BLOCK
      ?AUTO_4011 - BLOCK
    )
    :vars
    (
      ?AUTO_4017 - BLOCK
      ?AUTO_4018 - BLOCK
      ?AUTO_4013 - BLOCK
      ?AUTO_4012 - BLOCK
      ?AUTO_4016 - BLOCK
      ?AUTO_4015 - BLOCK
      ?AUTO_4014 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4010 ?AUTO_4011 ) ) ( ON-TABLE ?AUTO_4010 ) ( not ( = ?AUTO_4010 ?AUTO_4017 ) ) ( not ( = ?AUTO_4011 ?AUTO_4017 ) ) ( ON ?AUTO_4017 ?AUTO_4010 ) ( not ( = ?AUTO_4010 ?AUTO_4018 ) ) ( not ( = ?AUTO_4010 ?AUTO_4013 ) ) ( not ( = ?AUTO_4011 ?AUTO_4018 ) ) ( not ( = ?AUTO_4011 ?AUTO_4013 ) ) ( not ( = ?AUTO_4017 ?AUTO_4018 ) ) ( not ( = ?AUTO_4017 ?AUTO_4013 ) ) ( not ( = ?AUTO_4018 ?AUTO_4013 ) ) ( not ( = ?AUTO_4010 ?AUTO_4012 ) ) ( not ( = ?AUTO_4011 ?AUTO_4012 ) ) ( not ( = ?AUTO_4017 ?AUTO_4012 ) ) ( not ( = ?AUTO_4018 ?AUTO_4012 ) ) ( not ( = ?AUTO_4013 ?AUTO_4012 ) ) ( CLEAR ?AUTO_4016 ) ( not ( = ?AUTO_4010 ?AUTO_4015 ) ) ( not ( = ?AUTO_4010 ?AUTO_4016 ) ) ( not ( = ?AUTO_4011 ?AUTO_4015 ) ) ( not ( = ?AUTO_4011 ?AUTO_4016 ) ) ( not ( = ?AUTO_4017 ?AUTO_4015 ) ) ( not ( = ?AUTO_4017 ?AUTO_4016 ) ) ( not ( = ?AUTO_4018 ?AUTO_4015 ) ) ( not ( = ?AUTO_4018 ?AUTO_4016 ) ) ( not ( = ?AUTO_4013 ?AUTO_4015 ) ) ( not ( = ?AUTO_4013 ?AUTO_4016 ) ) ( not ( = ?AUTO_4012 ?AUTO_4015 ) ) ( not ( = ?AUTO_4012 ?AUTO_4016 ) ) ( not ( = ?AUTO_4015 ?AUTO_4016 ) ) ( ON ?AUTO_4015 ?AUTO_4011 ) ( not ( = ?AUTO_4010 ?AUTO_4014 ) ) ( not ( = ?AUTO_4011 ?AUTO_4014 ) ) ( not ( = ?AUTO_4017 ?AUTO_4014 ) ) ( not ( = ?AUTO_4018 ?AUTO_4014 ) ) ( not ( = ?AUTO_4013 ?AUTO_4014 ) ) ( not ( = ?AUTO_4012 ?AUTO_4014 ) ) ( not ( = ?AUTO_4016 ?AUTO_4014 ) ) ( not ( = ?AUTO_4015 ?AUTO_4014 ) ) ( ON ?AUTO_4014 ?AUTO_4015 ) ( ON ?AUTO_4012 ?AUTO_4014 ) ( ON ?AUTO_4018 ?AUTO_4012 ) ( CLEAR ?AUTO_4018 ) ( HOLDING ?AUTO_4013 ) ( CLEAR ?AUTO_4017 ) )
    :subtasks
    ( ( !STACK ?AUTO_4013 ?AUTO_4017 )
      ( MAKE-ON ?AUTO_4010 ?AUTO_4011 )
      ( MAKE-ON-VERIFY ?AUTO_4010 ?AUTO_4011 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4019 - BLOCK
      ?AUTO_4020 - BLOCK
    )
    :vars
    (
      ?AUTO_4023 - BLOCK
      ?AUTO_4027 - BLOCK
      ?AUTO_4024 - BLOCK
      ?AUTO_4022 - BLOCK
      ?AUTO_4025 - BLOCK
      ?AUTO_4021 - BLOCK
      ?AUTO_4026 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4019 ?AUTO_4020 ) ) ( ON-TABLE ?AUTO_4019 ) ( not ( = ?AUTO_4019 ?AUTO_4023 ) ) ( not ( = ?AUTO_4020 ?AUTO_4023 ) ) ( ON ?AUTO_4023 ?AUTO_4019 ) ( not ( = ?AUTO_4019 ?AUTO_4027 ) ) ( not ( = ?AUTO_4019 ?AUTO_4024 ) ) ( not ( = ?AUTO_4020 ?AUTO_4027 ) ) ( not ( = ?AUTO_4020 ?AUTO_4024 ) ) ( not ( = ?AUTO_4023 ?AUTO_4027 ) ) ( not ( = ?AUTO_4023 ?AUTO_4024 ) ) ( not ( = ?AUTO_4027 ?AUTO_4024 ) ) ( not ( = ?AUTO_4019 ?AUTO_4022 ) ) ( not ( = ?AUTO_4020 ?AUTO_4022 ) ) ( not ( = ?AUTO_4023 ?AUTO_4022 ) ) ( not ( = ?AUTO_4027 ?AUTO_4022 ) ) ( not ( = ?AUTO_4024 ?AUTO_4022 ) ) ( CLEAR ?AUTO_4025 ) ( not ( = ?AUTO_4019 ?AUTO_4021 ) ) ( not ( = ?AUTO_4019 ?AUTO_4025 ) ) ( not ( = ?AUTO_4020 ?AUTO_4021 ) ) ( not ( = ?AUTO_4020 ?AUTO_4025 ) ) ( not ( = ?AUTO_4023 ?AUTO_4021 ) ) ( not ( = ?AUTO_4023 ?AUTO_4025 ) ) ( not ( = ?AUTO_4027 ?AUTO_4021 ) ) ( not ( = ?AUTO_4027 ?AUTO_4025 ) ) ( not ( = ?AUTO_4024 ?AUTO_4021 ) ) ( not ( = ?AUTO_4024 ?AUTO_4025 ) ) ( not ( = ?AUTO_4022 ?AUTO_4021 ) ) ( not ( = ?AUTO_4022 ?AUTO_4025 ) ) ( not ( = ?AUTO_4021 ?AUTO_4025 ) ) ( ON ?AUTO_4021 ?AUTO_4020 ) ( not ( = ?AUTO_4019 ?AUTO_4026 ) ) ( not ( = ?AUTO_4020 ?AUTO_4026 ) ) ( not ( = ?AUTO_4023 ?AUTO_4026 ) ) ( not ( = ?AUTO_4027 ?AUTO_4026 ) ) ( not ( = ?AUTO_4024 ?AUTO_4026 ) ) ( not ( = ?AUTO_4022 ?AUTO_4026 ) ) ( not ( = ?AUTO_4025 ?AUTO_4026 ) ) ( not ( = ?AUTO_4021 ?AUTO_4026 ) ) ( ON ?AUTO_4026 ?AUTO_4021 ) ( ON ?AUTO_4022 ?AUTO_4026 ) ( ON ?AUTO_4027 ?AUTO_4022 ) ( CLEAR ?AUTO_4027 ) ( CLEAR ?AUTO_4023 ) ( ON-TABLE ?AUTO_4024 ) ( CLEAR ?AUTO_4024 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_4024 )
      ( MAKE-ON ?AUTO_4019 ?AUTO_4020 )
      ( MAKE-ON-VERIFY ?AUTO_4019 ?AUTO_4020 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4028 - BLOCK
      ?AUTO_4029 - BLOCK
    )
    :vars
    (
      ?AUTO_4036 - BLOCK
      ?AUTO_4034 - BLOCK
      ?AUTO_4030 - BLOCK
      ?AUTO_4031 - BLOCK
      ?AUTO_4035 - BLOCK
      ?AUTO_4033 - BLOCK
      ?AUTO_4032 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4028 ?AUTO_4029 ) ) ( ON-TABLE ?AUTO_4028 ) ( not ( = ?AUTO_4028 ?AUTO_4036 ) ) ( not ( = ?AUTO_4029 ?AUTO_4036 ) ) ( not ( = ?AUTO_4028 ?AUTO_4034 ) ) ( not ( = ?AUTO_4028 ?AUTO_4030 ) ) ( not ( = ?AUTO_4029 ?AUTO_4034 ) ) ( not ( = ?AUTO_4029 ?AUTO_4030 ) ) ( not ( = ?AUTO_4036 ?AUTO_4034 ) ) ( not ( = ?AUTO_4036 ?AUTO_4030 ) ) ( not ( = ?AUTO_4034 ?AUTO_4030 ) ) ( not ( = ?AUTO_4028 ?AUTO_4031 ) ) ( not ( = ?AUTO_4029 ?AUTO_4031 ) ) ( not ( = ?AUTO_4036 ?AUTO_4031 ) ) ( not ( = ?AUTO_4034 ?AUTO_4031 ) ) ( not ( = ?AUTO_4030 ?AUTO_4031 ) ) ( CLEAR ?AUTO_4035 ) ( not ( = ?AUTO_4028 ?AUTO_4033 ) ) ( not ( = ?AUTO_4028 ?AUTO_4035 ) ) ( not ( = ?AUTO_4029 ?AUTO_4033 ) ) ( not ( = ?AUTO_4029 ?AUTO_4035 ) ) ( not ( = ?AUTO_4036 ?AUTO_4033 ) ) ( not ( = ?AUTO_4036 ?AUTO_4035 ) ) ( not ( = ?AUTO_4034 ?AUTO_4033 ) ) ( not ( = ?AUTO_4034 ?AUTO_4035 ) ) ( not ( = ?AUTO_4030 ?AUTO_4033 ) ) ( not ( = ?AUTO_4030 ?AUTO_4035 ) ) ( not ( = ?AUTO_4031 ?AUTO_4033 ) ) ( not ( = ?AUTO_4031 ?AUTO_4035 ) ) ( not ( = ?AUTO_4033 ?AUTO_4035 ) ) ( ON ?AUTO_4033 ?AUTO_4029 ) ( not ( = ?AUTO_4028 ?AUTO_4032 ) ) ( not ( = ?AUTO_4029 ?AUTO_4032 ) ) ( not ( = ?AUTO_4036 ?AUTO_4032 ) ) ( not ( = ?AUTO_4034 ?AUTO_4032 ) ) ( not ( = ?AUTO_4030 ?AUTO_4032 ) ) ( not ( = ?AUTO_4031 ?AUTO_4032 ) ) ( not ( = ?AUTO_4035 ?AUTO_4032 ) ) ( not ( = ?AUTO_4033 ?AUTO_4032 ) ) ( ON ?AUTO_4032 ?AUTO_4033 ) ( ON ?AUTO_4031 ?AUTO_4032 ) ( ON ?AUTO_4034 ?AUTO_4031 ) ( CLEAR ?AUTO_4034 ) ( ON-TABLE ?AUTO_4030 ) ( CLEAR ?AUTO_4030 ) ( HOLDING ?AUTO_4036 ) ( CLEAR ?AUTO_4028 ) )
    :subtasks
    ( ( !STACK ?AUTO_4036 ?AUTO_4028 )
      ( MAKE-ON ?AUTO_4028 ?AUTO_4029 )
      ( MAKE-ON-VERIFY ?AUTO_4028 ?AUTO_4029 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4037 - BLOCK
      ?AUTO_4038 - BLOCK
    )
    :vars
    (
      ?AUTO_4040 - BLOCK
      ?AUTO_4039 - BLOCK
      ?AUTO_4042 - BLOCK
      ?AUTO_4044 - BLOCK
      ?AUTO_4045 - BLOCK
      ?AUTO_4043 - BLOCK
      ?AUTO_4041 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4037 ?AUTO_4038 ) ) ( ON-TABLE ?AUTO_4037 ) ( not ( = ?AUTO_4037 ?AUTO_4040 ) ) ( not ( = ?AUTO_4038 ?AUTO_4040 ) ) ( not ( = ?AUTO_4037 ?AUTO_4039 ) ) ( not ( = ?AUTO_4037 ?AUTO_4042 ) ) ( not ( = ?AUTO_4038 ?AUTO_4039 ) ) ( not ( = ?AUTO_4038 ?AUTO_4042 ) ) ( not ( = ?AUTO_4040 ?AUTO_4039 ) ) ( not ( = ?AUTO_4040 ?AUTO_4042 ) ) ( not ( = ?AUTO_4039 ?AUTO_4042 ) ) ( not ( = ?AUTO_4037 ?AUTO_4044 ) ) ( not ( = ?AUTO_4038 ?AUTO_4044 ) ) ( not ( = ?AUTO_4040 ?AUTO_4044 ) ) ( not ( = ?AUTO_4039 ?AUTO_4044 ) ) ( not ( = ?AUTO_4042 ?AUTO_4044 ) ) ( CLEAR ?AUTO_4045 ) ( not ( = ?AUTO_4037 ?AUTO_4043 ) ) ( not ( = ?AUTO_4037 ?AUTO_4045 ) ) ( not ( = ?AUTO_4038 ?AUTO_4043 ) ) ( not ( = ?AUTO_4038 ?AUTO_4045 ) ) ( not ( = ?AUTO_4040 ?AUTO_4043 ) ) ( not ( = ?AUTO_4040 ?AUTO_4045 ) ) ( not ( = ?AUTO_4039 ?AUTO_4043 ) ) ( not ( = ?AUTO_4039 ?AUTO_4045 ) ) ( not ( = ?AUTO_4042 ?AUTO_4043 ) ) ( not ( = ?AUTO_4042 ?AUTO_4045 ) ) ( not ( = ?AUTO_4044 ?AUTO_4043 ) ) ( not ( = ?AUTO_4044 ?AUTO_4045 ) ) ( not ( = ?AUTO_4043 ?AUTO_4045 ) ) ( ON ?AUTO_4043 ?AUTO_4038 ) ( not ( = ?AUTO_4037 ?AUTO_4041 ) ) ( not ( = ?AUTO_4038 ?AUTO_4041 ) ) ( not ( = ?AUTO_4040 ?AUTO_4041 ) ) ( not ( = ?AUTO_4039 ?AUTO_4041 ) ) ( not ( = ?AUTO_4042 ?AUTO_4041 ) ) ( not ( = ?AUTO_4044 ?AUTO_4041 ) ) ( not ( = ?AUTO_4045 ?AUTO_4041 ) ) ( not ( = ?AUTO_4043 ?AUTO_4041 ) ) ( ON ?AUTO_4041 ?AUTO_4043 ) ( ON ?AUTO_4044 ?AUTO_4041 ) ( ON ?AUTO_4039 ?AUTO_4044 ) ( CLEAR ?AUTO_4039 ) ( ON-TABLE ?AUTO_4042 ) ( CLEAR ?AUTO_4037 ) ( ON ?AUTO_4040 ?AUTO_4042 ) ( CLEAR ?AUTO_4040 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4040 ?AUTO_4042 )
      ( MAKE-ON ?AUTO_4037 ?AUTO_4038 )
      ( MAKE-ON-VERIFY ?AUTO_4037 ?AUTO_4038 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4052 - BLOCK
      ?AUTO_4053 - BLOCK
    )
    :vars
    (
      ?AUTO_4058 - BLOCK
      ?AUTO_4054 - BLOCK
      ?AUTO_4057 - BLOCK
      ?AUTO_4056 - BLOCK
      ?AUTO_4055 - BLOCK
      ?AUTO_4060 - BLOCK
      ?AUTO_4059 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4052 ?AUTO_4053 ) ) ( ON-TABLE ?AUTO_4052 ) ( not ( = ?AUTO_4052 ?AUTO_4058 ) ) ( not ( = ?AUTO_4053 ?AUTO_4058 ) ) ( not ( = ?AUTO_4052 ?AUTO_4054 ) ) ( not ( = ?AUTO_4052 ?AUTO_4057 ) ) ( not ( = ?AUTO_4053 ?AUTO_4054 ) ) ( not ( = ?AUTO_4053 ?AUTO_4057 ) ) ( not ( = ?AUTO_4058 ?AUTO_4054 ) ) ( not ( = ?AUTO_4058 ?AUTO_4057 ) ) ( not ( = ?AUTO_4054 ?AUTO_4057 ) ) ( not ( = ?AUTO_4052 ?AUTO_4056 ) ) ( not ( = ?AUTO_4053 ?AUTO_4056 ) ) ( not ( = ?AUTO_4058 ?AUTO_4056 ) ) ( not ( = ?AUTO_4054 ?AUTO_4056 ) ) ( not ( = ?AUTO_4057 ?AUTO_4056 ) ) ( not ( = ?AUTO_4052 ?AUTO_4055 ) ) ( not ( = ?AUTO_4052 ?AUTO_4060 ) ) ( not ( = ?AUTO_4053 ?AUTO_4055 ) ) ( not ( = ?AUTO_4053 ?AUTO_4060 ) ) ( not ( = ?AUTO_4058 ?AUTO_4055 ) ) ( not ( = ?AUTO_4058 ?AUTO_4060 ) ) ( not ( = ?AUTO_4054 ?AUTO_4055 ) ) ( not ( = ?AUTO_4054 ?AUTO_4060 ) ) ( not ( = ?AUTO_4057 ?AUTO_4055 ) ) ( not ( = ?AUTO_4057 ?AUTO_4060 ) ) ( not ( = ?AUTO_4056 ?AUTO_4055 ) ) ( not ( = ?AUTO_4056 ?AUTO_4060 ) ) ( not ( = ?AUTO_4055 ?AUTO_4060 ) ) ( ON ?AUTO_4055 ?AUTO_4053 ) ( not ( = ?AUTO_4052 ?AUTO_4059 ) ) ( not ( = ?AUTO_4053 ?AUTO_4059 ) ) ( not ( = ?AUTO_4058 ?AUTO_4059 ) ) ( not ( = ?AUTO_4054 ?AUTO_4059 ) ) ( not ( = ?AUTO_4057 ?AUTO_4059 ) ) ( not ( = ?AUTO_4056 ?AUTO_4059 ) ) ( not ( = ?AUTO_4060 ?AUTO_4059 ) ) ( not ( = ?AUTO_4055 ?AUTO_4059 ) ) ( ON ?AUTO_4059 ?AUTO_4055 ) ( ON ?AUTO_4056 ?AUTO_4059 ) ( ON ?AUTO_4054 ?AUTO_4056 ) ( CLEAR ?AUTO_4054 ) ( ON-TABLE ?AUTO_4057 ) ( CLEAR ?AUTO_4057 ) ( CLEAR ?AUTO_4052 ) ( ON ?AUTO_4058 ?AUTO_4060 ) ( CLEAR ?AUTO_4058 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4058 ?AUTO_4060 )
      ( MAKE-ON ?AUTO_4052 ?AUTO_4053 )
      ( MAKE-ON-VERIFY ?AUTO_4052 ?AUTO_4053 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4150 - BLOCK
      ?AUTO_4151 - BLOCK
    )
    :vars
    (
      ?AUTO_4152 - BLOCK
      ?AUTO_4153 - BLOCK
      ?AUTO_4154 - BLOCK
      ?AUTO_4155 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4150 ?AUTO_4151 ) ) ( ON-TABLE ?AUTO_4150 ) ( CLEAR ?AUTO_4152 ) ( not ( = ?AUTO_4150 ?AUTO_4152 ) ) ( not ( = ?AUTO_4151 ?AUTO_4152 ) ) ( ON ?AUTO_4151 ?AUTO_4150 ) ( not ( = ?AUTO_4150 ?AUTO_4153 ) ) ( not ( = ?AUTO_4151 ?AUTO_4153 ) ) ( not ( = ?AUTO_4152 ?AUTO_4153 ) ) ( ON ?AUTO_4153 ?AUTO_4151 ) ( CLEAR ?AUTO_4153 ) ( HOLDING ?AUTO_4154 ) ( CLEAR ?AUTO_4155 ) ( not ( = ?AUTO_4150 ?AUTO_4154 ) ) ( not ( = ?AUTO_4150 ?AUTO_4155 ) ) ( not ( = ?AUTO_4151 ?AUTO_4154 ) ) ( not ( = ?AUTO_4151 ?AUTO_4155 ) ) ( not ( = ?AUTO_4152 ?AUTO_4154 ) ) ( not ( = ?AUTO_4152 ?AUTO_4155 ) ) ( not ( = ?AUTO_4153 ?AUTO_4154 ) ) ( not ( = ?AUTO_4153 ?AUTO_4155 ) ) ( not ( = ?AUTO_4154 ?AUTO_4155 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4154 ?AUTO_4155 )
      ( MAKE-ON ?AUTO_4150 ?AUTO_4151 )
      ( MAKE-ON-VERIFY ?AUTO_4150 ?AUTO_4151 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4261 - BLOCK
      ?AUTO_4262 - BLOCK
    )
    :vars
    (
      ?AUTO_4263 - BLOCK
      ?AUTO_4264 - BLOCK
      ?AUTO_4265 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4261 ?AUTO_4262 ) ) ( ON ?AUTO_4261 ?AUTO_4263 ) ( not ( = ?AUTO_4261 ?AUTO_4263 ) ) ( not ( = ?AUTO_4262 ?AUTO_4263 ) ) ( ON ?AUTO_4262 ?AUTO_4261 ) ( CLEAR ?AUTO_4262 ) ( HOLDING ?AUTO_4264 ) ( CLEAR ?AUTO_4265 ) ( not ( = ?AUTO_4261 ?AUTO_4264 ) ) ( not ( = ?AUTO_4261 ?AUTO_4265 ) ) ( not ( = ?AUTO_4262 ?AUTO_4264 ) ) ( not ( = ?AUTO_4262 ?AUTO_4265 ) ) ( not ( = ?AUTO_4263 ?AUTO_4264 ) ) ( not ( = ?AUTO_4263 ?AUTO_4265 ) ) ( not ( = ?AUTO_4264 ?AUTO_4265 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4264 ?AUTO_4265 )
      ( MAKE-ON ?AUTO_4261 ?AUTO_4262 )
      ( MAKE-ON-VERIFY ?AUTO_4261 ?AUTO_4262 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4275 - BLOCK
      ?AUTO_4276 - BLOCK
    )
    :vars
    (
      ?AUTO_4277 - BLOCK
      ?AUTO_4279 - BLOCK
      ?AUTO_4278 - BLOCK
      ?AUTO_4280 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4275 ?AUTO_4276 ) ) ( ON ?AUTO_4275 ?AUTO_4277 ) ( not ( = ?AUTO_4275 ?AUTO_4277 ) ) ( not ( = ?AUTO_4276 ?AUTO_4277 ) ) ( ON ?AUTO_4276 ?AUTO_4275 ) ( not ( = ?AUTO_4275 ?AUTO_4279 ) ) ( not ( = ?AUTO_4275 ?AUTO_4278 ) ) ( not ( = ?AUTO_4276 ?AUTO_4279 ) ) ( not ( = ?AUTO_4276 ?AUTO_4278 ) ) ( not ( = ?AUTO_4277 ?AUTO_4279 ) ) ( not ( = ?AUTO_4277 ?AUTO_4278 ) ) ( not ( = ?AUTO_4279 ?AUTO_4278 ) ) ( ON ?AUTO_4279 ?AUTO_4276 ) ( CLEAR ?AUTO_4279 ) ( HOLDING ?AUTO_4278 ) ( CLEAR ?AUTO_4280 ) ( not ( = ?AUTO_4275 ?AUTO_4280 ) ) ( not ( = ?AUTO_4276 ?AUTO_4280 ) ) ( not ( = ?AUTO_4277 ?AUTO_4280 ) ) ( not ( = ?AUTO_4279 ?AUTO_4280 ) ) ( not ( = ?AUTO_4278 ?AUTO_4280 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4278 ?AUTO_4280 )
      ( MAKE-ON ?AUTO_4275 ?AUTO_4276 )
      ( MAKE-ON-VERIFY ?AUTO_4275 ?AUTO_4276 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4330 - BLOCK
      ?AUTO_4331 - BLOCK
    )
    :vars
    (
      ?AUTO_4332 - BLOCK
      ?AUTO_4333 - BLOCK
      ?AUTO_4334 - BLOCK
      ?AUTO_4335 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4330 ?AUTO_4331 ) ) ( ON-TABLE ?AUTO_4330 ) ( not ( = ?AUTO_4330 ?AUTO_4332 ) ) ( not ( = ?AUTO_4330 ?AUTO_4333 ) ) ( not ( = ?AUTO_4331 ?AUTO_4332 ) ) ( not ( = ?AUTO_4331 ?AUTO_4333 ) ) ( not ( = ?AUTO_4332 ?AUTO_4333 ) ) ( ON ?AUTO_4332 ?AUTO_4330 ) ( not ( = ?AUTO_4330 ?AUTO_4334 ) ) ( not ( = ?AUTO_4331 ?AUTO_4334 ) ) ( not ( = ?AUTO_4333 ?AUTO_4334 ) ) ( not ( = ?AUTO_4332 ?AUTO_4334 ) ) ( ON ?AUTO_4334 ?AUTO_4332 ) ( CLEAR ?AUTO_4334 ) ( not ( = ?AUTO_4330 ?AUTO_4335 ) ) ( not ( = ?AUTO_4331 ?AUTO_4335 ) ) ( not ( = ?AUTO_4332 ?AUTO_4335 ) ) ( not ( = ?AUTO_4333 ?AUTO_4335 ) ) ( not ( = ?AUTO_4334 ?AUTO_4335 ) ) ( ON ?AUTO_4333 ?AUTO_4331 ) ( CLEAR ?AUTO_4333 ) ( HOLDING ?AUTO_4335 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4335 )
      ( MAKE-ON ?AUTO_4330 ?AUTO_4331 )
      ( MAKE-ON-VERIFY ?AUTO_4330 ?AUTO_4331 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4336 - BLOCK
      ?AUTO_4337 - BLOCK
    )
    :vars
    (
      ?AUTO_4338 - BLOCK
      ?AUTO_4340 - BLOCK
      ?AUTO_4341 - BLOCK
      ?AUTO_4339 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4336 ?AUTO_4337 ) ) ( ON-TABLE ?AUTO_4336 ) ( not ( = ?AUTO_4336 ?AUTO_4338 ) ) ( not ( = ?AUTO_4336 ?AUTO_4340 ) ) ( not ( = ?AUTO_4337 ?AUTO_4338 ) ) ( not ( = ?AUTO_4337 ?AUTO_4340 ) ) ( not ( = ?AUTO_4338 ?AUTO_4340 ) ) ( ON ?AUTO_4338 ?AUTO_4336 ) ( not ( = ?AUTO_4336 ?AUTO_4341 ) ) ( not ( = ?AUTO_4337 ?AUTO_4341 ) ) ( not ( = ?AUTO_4340 ?AUTO_4341 ) ) ( not ( = ?AUTO_4338 ?AUTO_4341 ) ) ( ON ?AUTO_4341 ?AUTO_4338 ) ( not ( = ?AUTO_4336 ?AUTO_4339 ) ) ( not ( = ?AUTO_4337 ?AUTO_4339 ) ) ( not ( = ?AUTO_4338 ?AUTO_4339 ) ) ( not ( = ?AUTO_4340 ?AUTO_4339 ) ) ( not ( = ?AUTO_4341 ?AUTO_4339 ) ) ( ON ?AUTO_4340 ?AUTO_4337 ) ( CLEAR ?AUTO_4340 ) ( ON ?AUTO_4339 ?AUTO_4341 ) ( CLEAR ?AUTO_4339 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4339 ?AUTO_4341 )
      ( MAKE-ON ?AUTO_4336 ?AUTO_4337 )
      ( MAKE-ON-VERIFY ?AUTO_4336 ?AUTO_4337 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4342 - BLOCK
      ?AUTO_4343 - BLOCK
    )
    :vars
    (
      ?AUTO_4347 - BLOCK
      ?AUTO_4346 - BLOCK
      ?AUTO_4344 - BLOCK
      ?AUTO_4345 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4342 ?AUTO_4343 ) ) ( ON-TABLE ?AUTO_4342 ) ( not ( = ?AUTO_4342 ?AUTO_4347 ) ) ( not ( = ?AUTO_4342 ?AUTO_4346 ) ) ( not ( = ?AUTO_4343 ?AUTO_4347 ) ) ( not ( = ?AUTO_4343 ?AUTO_4346 ) ) ( not ( = ?AUTO_4347 ?AUTO_4346 ) ) ( ON ?AUTO_4347 ?AUTO_4342 ) ( not ( = ?AUTO_4342 ?AUTO_4344 ) ) ( not ( = ?AUTO_4343 ?AUTO_4344 ) ) ( not ( = ?AUTO_4346 ?AUTO_4344 ) ) ( not ( = ?AUTO_4347 ?AUTO_4344 ) ) ( ON ?AUTO_4344 ?AUTO_4347 ) ( not ( = ?AUTO_4342 ?AUTO_4345 ) ) ( not ( = ?AUTO_4343 ?AUTO_4345 ) ) ( not ( = ?AUTO_4347 ?AUTO_4345 ) ) ( not ( = ?AUTO_4346 ?AUTO_4345 ) ) ( not ( = ?AUTO_4344 ?AUTO_4345 ) ) ( ON ?AUTO_4345 ?AUTO_4344 ) ( CLEAR ?AUTO_4345 ) ( HOLDING ?AUTO_4346 ) ( CLEAR ?AUTO_4343 ) )
    :subtasks
    ( ( !STACK ?AUTO_4346 ?AUTO_4343 )
      ( MAKE-ON ?AUTO_4342 ?AUTO_4343 )
      ( MAKE-ON-VERIFY ?AUTO_4342 ?AUTO_4343 ) )
  )

)

