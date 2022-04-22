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
      ?AUTO_412 - BLOCK
    )
    :vars
    (
      ?AUTO_413 - BLOCK
      ?AUTO_414 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_412 ?AUTO_413 ) ( not ( = ?AUTO_412 ?AUTO_413 ) ) ( not ( = ?AUTO_412 ?AUTO_414 ) ) ( not ( = ?AUTO_413 ?AUTO_414 ) ) ( ON ?AUTO_414 ?AUTO_412 ) ( CLEAR ?AUTO_414 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_414 ?AUTO_412 )
      ( MAKE-ON-TABLE ?AUTO_412 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_412 ) )
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
      ?AUTO_76 - BLOCK
      ?AUTO_77 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_75 ) ( not ( = ?AUTO_74 ?AUTO_75 ) ) ( ON ?AUTO_74 ?AUTO_76 ) ( not ( = ?AUTO_74 ?AUTO_76 ) ) ( not ( = ?AUTO_75 ?AUTO_76 ) ) ( not ( = ?AUTO_74 ?AUTO_77 ) ) ( not ( = ?AUTO_75 ?AUTO_77 ) ) ( not ( = ?AUTO_76 ?AUTO_77 ) ) ( ON ?AUTO_77 ?AUTO_74 ) ( CLEAR ?AUTO_77 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_77 ?AUTO_74 )
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
      ?AUTO_80 - BLOCK
      ?AUTO_81 - BLOCK
      ?AUTO_82 - BLOCK
      ?AUTO_83 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_79 ) ( not ( = ?AUTO_78 ?AUTO_79 ) ) ( ON ?AUTO_78 ?AUTO_80 ) ( not ( = ?AUTO_78 ?AUTO_80 ) ) ( not ( = ?AUTO_79 ?AUTO_80 ) ) ( not ( = ?AUTO_78 ?AUTO_81 ) ) ( not ( = ?AUTO_79 ?AUTO_81 ) ) ( not ( = ?AUTO_80 ?AUTO_81 ) ) ( ON ?AUTO_81 ?AUTO_78 ) ( CLEAR ?AUTO_81 ) ( HOLDING ?AUTO_82 ) ( CLEAR ?AUTO_83 ) ( not ( = ?AUTO_78 ?AUTO_82 ) ) ( not ( = ?AUTO_78 ?AUTO_83 ) ) ( not ( = ?AUTO_79 ?AUTO_82 ) ) ( not ( = ?AUTO_79 ?AUTO_83 ) ) ( not ( = ?AUTO_80 ?AUTO_82 ) ) ( not ( = ?AUTO_80 ?AUTO_83 ) ) ( not ( = ?AUTO_81 ?AUTO_82 ) ) ( not ( = ?AUTO_81 ?AUTO_83 ) ) ( not ( = ?AUTO_82 ?AUTO_83 ) ) )
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
      ?AUTO_1369 - BLOCK
      ?AUTO_1370 - BLOCK
    )
    :vars
    (
      ?AUTO_1371 - BLOCK
      ?AUTO_1373 - BLOCK
      ?AUTO_1372 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1369 ?AUTO_1370 ) ) ( ON ?AUTO_1369 ?AUTO_1371 ) ( CLEAR ?AUTO_1369 ) ( not ( = ?AUTO_1369 ?AUTO_1371 ) ) ( not ( = ?AUTO_1370 ?AUTO_1371 ) ) ( not ( = ?AUTO_1369 ?AUTO_1373 ) ) ( not ( = ?AUTO_1369 ?AUTO_1372 ) ) ( not ( = ?AUTO_1370 ?AUTO_1373 ) ) ( not ( = ?AUTO_1370 ?AUTO_1372 ) ) ( not ( = ?AUTO_1371 ?AUTO_1373 ) ) ( not ( = ?AUTO_1371 ?AUTO_1372 ) ) ( not ( = ?AUTO_1373 ?AUTO_1372 ) ) ( ON ?AUTO_1373 ?AUTO_1370 ) ( ON ?AUTO_1372 ?AUTO_1373 ) ( CLEAR ?AUTO_1372 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1372 ?AUTO_1373 )
      ( MAKE-ON ?AUTO_1369 ?AUTO_1370 )
      ( MAKE-ON-VERIFY ?AUTO_1369 ?AUTO_1370 ) )
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
      ?AUTO_2174 - BLOCK
      ?AUTO_2175 - BLOCK
    )
    :vars
    (
      ?AUTO_2176 - BLOCK
      ?AUTO_2177 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2174 ?AUTO_2175 ) ) ( ON ?AUTO_2174 ?AUTO_2176 ) ( not ( = ?AUTO_2174 ?AUTO_2176 ) ) ( not ( = ?AUTO_2175 ?AUTO_2176 ) ) ( not ( = ?AUTO_2174 ?AUTO_2177 ) ) ( not ( = ?AUTO_2175 ?AUTO_2177 ) ) ( not ( = ?AUTO_2176 ?AUTO_2177 ) ) ( ON ?AUTO_2177 ?AUTO_2174 ) ( CLEAR ?AUTO_2177 ) ( HOLDING ?AUTO_2175 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2175 )
      ( MAKE-ON ?AUTO_2174 ?AUTO_2175 )
      ( MAKE-ON-VERIFY ?AUTO_2174 ?AUTO_2175 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2653 - BLOCK
      ?AUTO_2654 - BLOCK
    )
    :vars
    (
      ?AUTO_2656 - BLOCK
      ?AUTO_2655 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2653 ?AUTO_2654 ) ) ( ON ?AUTO_2653 ?AUTO_2656 ) ( not ( = ?AUTO_2653 ?AUTO_2656 ) ) ( not ( = ?AUTO_2654 ?AUTO_2656 ) ) ( not ( = ?AUTO_2653 ?AUTO_2655 ) ) ( not ( = ?AUTO_2654 ?AUTO_2655 ) ) ( not ( = ?AUTO_2656 ?AUTO_2655 ) ) ( ON ?AUTO_2655 ?AUTO_2653 ) ( ON ?AUTO_2654 ?AUTO_2655 ) ( CLEAR ?AUTO_2654 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2654 ?AUTO_2655 )
      ( MAKE-ON ?AUTO_2653 ?AUTO_2654 )
      ( MAKE-ON-VERIFY ?AUTO_2653 ?AUTO_2654 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_189 - BLOCK
      ?AUTO_190 - BLOCK
    )
    :vars
    (
      ?AUTO_193 - BLOCK
      ?AUTO_191 - BLOCK
      ?AUTO_192 - BLOCK
      ?AUTO_194 - BLOCK
      ?AUTO_195 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_189 ?AUTO_190 ) ) ( ON ?AUTO_189 ?AUTO_193 ) ( not ( = ?AUTO_189 ?AUTO_193 ) ) ( not ( = ?AUTO_190 ?AUTO_193 ) ) ( CLEAR ?AUTO_191 ) ( not ( = ?AUTO_189 ?AUTO_192 ) ) ( not ( = ?AUTO_189 ?AUTO_191 ) ) ( not ( = ?AUTO_190 ?AUTO_192 ) ) ( not ( = ?AUTO_190 ?AUTO_191 ) ) ( not ( = ?AUTO_193 ?AUTO_192 ) ) ( not ( = ?AUTO_193 ?AUTO_191 ) ) ( not ( = ?AUTO_192 ?AUTO_191 ) ) ( ON ?AUTO_192 ?AUTO_189 ) ( ON ?AUTO_190 ?AUTO_192 ) ( CLEAR ?AUTO_190 ) ( HOLDING ?AUTO_194 ) ( CLEAR ?AUTO_195 ) ( not ( = ?AUTO_189 ?AUTO_194 ) ) ( not ( = ?AUTO_189 ?AUTO_195 ) ) ( not ( = ?AUTO_190 ?AUTO_194 ) ) ( not ( = ?AUTO_190 ?AUTO_195 ) ) ( not ( = ?AUTO_193 ?AUTO_194 ) ) ( not ( = ?AUTO_193 ?AUTO_195 ) ) ( not ( = ?AUTO_191 ?AUTO_194 ) ) ( not ( = ?AUTO_191 ?AUTO_195 ) ) ( not ( = ?AUTO_192 ?AUTO_194 ) ) ( not ( = ?AUTO_192 ?AUTO_195 ) ) ( not ( = ?AUTO_194 ?AUTO_195 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_194 ?AUTO_195 )
      ( MAKE-ON ?AUTO_189 ?AUTO_190 )
      ( MAKE-ON-VERIFY ?AUTO_189 ?AUTO_190 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_833 - BLOCK
      ?AUTO_834 - BLOCK
    )
    :vars
    (
      ?AUTO_835 - BLOCK
      ?AUTO_836 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_833 ?AUTO_834 ) ) ( ON ?AUTO_833 ?AUTO_835 ) ( CLEAR ?AUTO_833 ) ( not ( = ?AUTO_833 ?AUTO_835 ) ) ( not ( = ?AUTO_834 ?AUTO_835 ) ) ( not ( = ?AUTO_833 ?AUTO_836 ) ) ( not ( = ?AUTO_834 ?AUTO_836 ) ) ( not ( = ?AUTO_835 ?AUTO_836 ) ) ( ON ?AUTO_836 ?AUTO_834 ) ( CLEAR ?AUTO_836 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_836 ?AUTO_834 )
      ( MAKE-ON ?AUTO_833 ?AUTO_834 )
      ( MAKE-ON-VERIFY ?AUTO_833 ?AUTO_834 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1043 - BLOCK
      ?AUTO_1044 - BLOCK
    )
    :vars
    (
      ?AUTO_1046 - BLOCK
      ?AUTO_1045 - BLOCK
      ?AUTO_1047 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1043 ?AUTO_1044 ) ) ( ON ?AUTO_1043 ?AUTO_1046 ) ( CLEAR ?AUTO_1043 ) ( not ( = ?AUTO_1043 ?AUTO_1046 ) ) ( not ( = ?AUTO_1044 ?AUTO_1046 ) ) ( not ( = ?AUTO_1043 ?AUTO_1045 ) ) ( not ( = ?AUTO_1044 ?AUTO_1045 ) ) ( not ( = ?AUTO_1046 ?AUTO_1045 ) ) ( ON ?AUTO_1045 ?AUTO_1044 ) ( CLEAR ?AUTO_1045 ) ( HOLDING ?AUTO_1047 ) ( not ( = ?AUTO_1043 ?AUTO_1047 ) ) ( not ( = ?AUTO_1044 ?AUTO_1047 ) ) ( not ( = ?AUTO_1046 ?AUTO_1047 ) ) ( not ( = ?AUTO_1045 ?AUTO_1047 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1047 )
      ( MAKE-ON ?AUTO_1043 ?AUTO_1044 )
      ( MAKE-ON-VERIFY ?AUTO_1043 ?AUTO_1044 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1374 - BLOCK
      ?AUTO_1375 - BLOCK
    )
    :vars
    (
      ?AUTO_1377 - BLOCK
      ?AUTO_1378 - BLOCK
      ?AUTO_1376 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1374 ?AUTO_1375 ) ) ( not ( = ?AUTO_1374 ?AUTO_1377 ) ) ( not ( = ?AUTO_1375 ?AUTO_1377 ) ) ( not ( = ?AUTO_1374 ?AUTO_1378 ) ) ( not ( = ?AUTO_1374 ?AUTO_1376 ) ) ( not ( = ?AUTO_1375 ?AUTO_1378 ) ) ( not ( = ?AUTO_1375 ?AUTO_1376 ) ) ( not ( = ?AUTO_1377 ?AUTO_1378 ) ) ( not ( = ?AUTO_1377 ?AUTO_1376 ) ) ( not ( = ?AUTO_1378 ?AUTO_1376 ) ) ( ON ?AUTO_1378 ?AUTO_1375 ) ( ON ?AUTO_1376 ?AUTO_1378 ) ( CLEAR ?AUTO_1376 ) ( HOLDING ?AUTO_1374 ) ( CLEAR ?AUTO_1377 ) )
    :subtasks
    ( ( !STACK ?AUTO_1374 ?AUTO_1377 )
      ( MAKE-ON ?AUTO_1374 ?AUTO_1375 )
      ( MAKE-ON-VERIFY ?AUTO_1374 ?AUTO_1375 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_255 - BLOCK
      ?AUTO_256 - BLOCK
    )
    :vars
    (
      ?AUTO_258 - BLOCK
      ?AUTO_259 - BLOCK
      ?AUTO_260 - BLOCK
      ?AUTO_257 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_255 ?AUTO_256 ) ) ( not ( = ?AUTO_255 ?AUTO_258 ) ) ( not ( = ?AUTO_256 ?AUTO_258 ) ) ( CLEAR ?AUTO_259 ) ( not ( = ?AUTO_255 ?AUTO_260 ) ) ( not ( = ?AUTO_255 ?AUTO_259 ) ) ( not ( = ?AUTO_256 ?AUTO_260 ) ) ( not ( = ?AUTO_256 ?AUTO_259 ) ) ( not ( = ?AUTO_258 ?AUTO_260 ) ) ( not ( = ?AUTO_258 ?AUTO_259 ) ) ( not ( = ?AUTO_260 ?AUTO_259 ) ) ( ON ?AUTO_260 ?AUTO_256 ) ( not ( = ?AUTO_255 ?AUTO_257 ) ) ( not ( = ?AUTO_256 ?AUTO_257 ) ) ( not ( = ?AUTO_258 ?AUTO_257 ) ) ( not ( = ?AUTO_259 ?AUTO_257 ) ) ( not ( = ?AUTO_260 ?AUTO_257 ) ) ( ON ?AUTO_257 ?AUTO_260 ) ( CLEAR ?AUTO_257 ) ( CLEAR ?AUTO_258 ) ( ON-TABLE ?AUTO_255 ) ( CLEAR ?AUTO_255 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_255 )
      ( MAKE-ON ?AUTO_255 ?AUTO_256 )
      ( MAKE-ON-VERIFY ?AUTO_255 ?AUTO_256 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_853 - BLOCK
      ?AUTO_854 - BLOCK
    )
    :vars
    (
      ?AUTO_856 - BLOCK
      ?AUTO_855 - BLOCK
      ?AUTO_857 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_853 ?AUTO_854 ) ) ( not ( = ?AUTO_853 ?AUTO_856 ) ) ( not ( = ?AUTO_854 ?AUTO_856 ) ) ( not ( = ?AUTO_853 ?AUTO_855 ) ) ( not ( = ?AUTO_854 ?AUTO_855 ) ) ( not ( = ?AUTO_856 ?AUTO_855 ) ) ( ON ?AUTO_855 ?AUTO_854 ) ( ON-TABLE ?AUTO_853 ) ( CLEAR ?AUTO_853 ) ( ON ?AUTO_856 ?AUTO_855 ) ( CLEAR ?AUTO_856 ) ( HOLDING ?AUTO_857 ) ( not ( = ?AUTO_853 ?AUTO_857 ) ) ( not ( = ?AUTO_854 ?AUTO_857 ) ) ( not ( = ?AUTO_856 ?AUTO_857 ) ) ( not ( = ?AUTO_855 ?AUTO_857 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_857 )
      ( MAKE-ON ?AUTO_853 ?AUTO_854 )
      ( MAKE-ON-VERIFY ?AUTO_853 ?AUTO_854 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_267 - BLOCK
      ?AUTO_268 - BLOCK
    )
    :vars
    (
      ?AUTO_269 - BLOCK
      ?AUTO_271 - BLOCK
      ?AUTO_270 - BLOCK
      ?AUTO_272 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_267 ?AUTO_268 ) ) ( not ( = ?AUTO_267 ?AUTO_269 ) ) ( not ( = ?AUTO_268 ?AUTO_269 ) ) ( CLEAR ?AUTO_271 ) ( not ( = ?AUTO_267 ?AUTO_270 ) ) ( not ( = ?AUTO_267 ?AUTO_271 ) ) ( not ( = ?AUTO_268 ?AUTO_270 ) ) ( not ( = ?AUTO_268 ?AUTO_271 ) ) ( not ( = ?AUTO_269 ?AUTO_270 ) ) ( not ( = ?AUTO_269 ?AUTO_271 ) ) ( not ( = ?AUTO_270 ?AUTO_271 ) ) ( ON ?AUTO_270 ?AUTO_268 ) ( not ( = ?AUTO_267 ?AUTO_272 ) ) ( not ( = ?AUTO_268 ?AUTO_272 ) ) ( not ( = ?AUTO_269 ?AUTO_272 ) ) ( not ( = ?AUTO_271 ?AUTO_272 ) ) ( not ( = ?AUTO_270 ?AUTO_272 ) ) ( ON ?AUTO_272 ?AUTO_270 ) ( CLEAR ?AUTO_272 ) ( ON-TABLE ?AUTO_267 ) ( ON ?AUTO_269 ?AUTO_267 ) ( CLEAR ?AUTO_269 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_269 ?AUTO_267 )
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
      ?AUTO_276 - BLOCK
      ?AUTO_277 - BLOCK
      ?AUTO_275 - BLOCK
      ?AUTO_278 - BLOCK
      ?AUTO_279 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_273 ?AUTO_274 ) ) ( not ( = ?AUTO_273 ?AUTO_276 ) ) ( not ( = ?AUTO_274 ?AUTO_276 ) ) ( CLEAR ?AUTO_277 ) ( not ( = ?AUTO_273 ?AUTO_275 ) ) ( not ( = ?AUTO_273 ?AUTO_277 ) ) ( not ( = ?AUTO_274 ?AUTO_275 ) ) ( not ( = ?AUTO_274 ?AUTO_277 ) ) ( not ( = ?AUTO_276 ?AUTO_275 ) ) ( not ( = ?AUTO_276 ?AUTO_277 ) ) ( not ( = ?AUTO_275 ?AUTO_277 ) ) ( ON ?AUTO_275 ?AUTO_274 ) ( not ( = ?AUTO_273 ?AUTO_278 ) ) ( not ( = ?AUTO_274 ?AUTO_278 ) ) ( not ( = ?AUTO_276 ?AUTO_278 ) ) ( not ( = ?AUTO_277 ?AUTO_278 ) ) ( not ( = ?AUTO_275 ?AUTO_278 ) ) ( ON ?AUTO_278 ?AUTO_275 ) ( CLEAR ?AUTO_278 ) ( ON-TABLE ?AUTO_273 ) ( ON ?AUTO_276 ?AUTO_273 ) ( CLEAR ?AUTO_276 ) ( HOLDING ?AUTO_279 ) ( not ( = ?AUTO_273 ?AUTO_279 ) ) ( not ( = ?AUTO_274 ?AUTO_279 ) ) ( not ( = ?AUTO_276 ?AUTO_279 ) ) ( not ( = ?AUTO_277 ?AUTO_279 ) ) ( not ( = ?AUTO_275 ?AUTO_279 ) ) ( not ( = ?AUTO_278 ?AUTO_279 ) ) )
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
      ?AUTO_285 - BLOCK
      ?AUTO_287 - BLOCK
      ?AUTO_286 - BLOCK
      ?AUTO_284 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_282 ?AUTO_283 ) ) ( not ( = ?AUTO_282 ?AUTO_285 ) ) ( not ( = ?AUTO_283 ?AUTO_285 ) ) ( CLEAR ?AUTO_287 ) ( not ( = ?AUTO_282 ?AUTO_286 ) ) ( not ( = ?AUTO_282 ?AUTO_287 ) ) ( not ( = ?AUTO_283 ?AUTO_286 ) ) ( not ( = ?AUTO_283 ?AUTO_287 ) ) ( not ( = ?AUTO_285 ?AUTO_286 ) ) ( not ( = ?AUTO_285 ?AUTO_287 ) ) ( not ( = ?AUTO_286 ?AUTO_287 ) ) ( ON ?AUTO_286 ?AUTO_283 ) ( not ( = ?AUTO_282 ?AUTO_284 ) ) ( not ( = ?AUTO_283 ?AUTO_284 ) ) ( not ( = ?AUTO_285 ?AUTO_284 ) ) ( not ( = ?AUTO_287 ?AUTO_284 ) ) ( not ( = ?AUTO_286 ?AUTO_284 ) ) ( ON-TABLE ?AUTO_282 ) ( ON ?AUTO_285 ?AUTO_282 ) ( CLEAR ?AUTO_285 ) ( HOLDING ?AUTO_284 ) ( CLEAR ?AUTO_286 ) )
    :subtasks
    ( ( !STACK ?AUTO_284 ?AUTO_286 )
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
      ?AUTO_293 - BLOCK
      ?AUTO_291 - BLOCK
      ?AUTO_290 - BLOCK
      ?AUTO_292 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_288 ?AUTO_289 ) ) ( not ( = ?AUTO_288 ?AUTO_293 ) ) ( not ( = ?AUTO_289 ?AUTO_293 ) ) ( not ( = ?AUTO_288 ?AUTO_291 ) ) ( not ( = ?AUTO_288 ?AUTO_290 ) ) ( not ( = ?AUTO_289 ?AUTO_291 ) ) ( not ( = ?AUTO_289 ?AUTO_290 ) ) ( not ( = ?AUTO_293 ?AUTO_291 ) ) ( not ( = ?AUTO_293 ?AUTO_290 ) ) ( not ( = ?AUTO_291 ?AUTO_290 ) ) ( ON ?AUTO_291 ?AUTO_289 ) ( not ( = ?AUTO_288 ?AUTO_292 ) ) ( not ( = ?AUTO_289 ?AUTO_292 ) ) ( not ( = ?AUTO_293 ?AUTO_292 ) ) ( not ( = ?AUTO_290 ?AUTO_292 ) ) ( not ( = ?AUTO_291 ?AUTO_292 ) ) ( ON-TABLE ?AUTO_288 ) ( ON ?AUTO_293 ?AUTO_288 ) ( CLEAR ?AUTO_293 ) ( CLEAR ?AUTO_291 ) ( ON ?AUTO_292 ?AUTO_290 ) ( CLEAR ?AUTO_292 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_292 ?AUTO_290 )
      ( MAKE-ON ?AUTO_288 ?AUTO_289 )
      ( MAKE-ON-VERIFY ?AUTO_288 ?AUTO_289 ) )
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
      ?AUTO_1172 - BLOCK
      ?AUTO_1173 - BLOCK
    )
    :vars
    (
      ?AUTO_1174 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1173 ) ( not ( = ?AUTO_1172 ?AUTO_1173 ) ) ( ON-TABLE ?AUTO_1172 ) ( not ( = ?AUTO_1172 ?AUTO_1174 ) ) ( not ( = ?AUTO_1173 ?AUTO_1174 ) ) ( ON ?AUTO_1174 ?AUTO_1172 ) ( CLEAR ?AUTO_1174 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1174 ?AUTO_1172 )
      ( MAKE-ON ?AUTO_1172 ?AUTO_1173 )
      ( MAKE-ON-VERIFY ?AUTO_1172 ?AUTO_1173 ) )
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
      ?AUTO_321 - BLOCK
      ?AUTO_320 - BLOCK
      ?AUTO_322 - BLOCK
      ?AUTO_323 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_318 ?AUTO_319 ) ) ( ON-TABLE ?AUTO_318 ) ( not ( = ?AUTO_318 ?AUTO_321 ) ) ( not ( = ?AUTO_318 ?AUTO_320 ) ) ( not ( = ?AUTO_319 ?AUTO_321 ) ) ( not ( = ?AUTO_319 ?AUTO_320 ) ) ( not ( = ?AUTO_321 ?AUTO_320 ) ) ( ON ?AUTO_321 ?AUTO_318 ) ( CLEAR ?AUTO_321 ) ( not ( = ?AUTO_318 ?AUTO_322 ) ) ( not ( = ?AUTO_319 ?AUTO_322 ) ) ( not ( = ?AUTO_321 ?AUTO_322 ) ) ( not ( = ?AUTO_320 ?AUTO_322 ) ) ( ON ?AUTO_320 ?AUTO_319 ) ( CLEAR ?AUTO_320 ) ( HOLDING ?AUTO_322 ) ( CLEAR ?AUTO_323 ) ( not ( = ?AUTO_318 ?AUTO_323 ) ) ( not ( = ?AUTO_319 ?AUTO_323 ) ) ( not ( = ?AUTO_321 ?AUTO_323 ) ) ( not ( = ?AUTO_320 ?AUTO_323 ) ) ( not ( = ?AUTO_322 ?AUTO_323 ) ) )
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
      ?AUTO_330 - BLOCK
      ?AUTO_332 - BLOCK
      ?AUTO_333 - BLOCK
      ?AUTO_331 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_328 ?AUTO_329 ) ) ( ON-TABLE ?AUTO_328 ) ( not ( = ?AUTO_328 ?AUTO_330 ) ) ( not ( = ?AUTO_328 ?AUTO_332 ) ) ( not ( = ?AUTO_329 ?AUTO_330 ) ) ( not ( = ?AUTO_329 ?AUTO_332 ) ) ( not ( = ?AUTO_330 ?AUTO_332 ) ) ( ON ?AUTO_330 ?AUTO_328 ) ( CLEAR ?AUTO_330 ) ( not ( = ?AUTO_328 ?AUTO_333 ) ) ( not ( = ?AUTO_329 ?AUTO_333 ) ) ( not ( = ?AUTO_330 ?AUTO_333 ) ) ( not ( = ?AUTO_332 ?AUTO_333 ) ) ( ON ?AUTO_332 ?AUTO_329 ) ( CLEAR ?AUTO_331 ) ( not ( = ?AUTO_328 ?AUTO_331 ) ) ( not ( = ?AUTO_329 ?AUTO_331 ) ) ( not ( = ?AUTO_330 ?AUTO_331 ) ) ( not ( = ?AUTO_332 ?AUTO_331 ) ) ( not ( = ?AUTO_333 ?AUTO_331 ) ) ( ON ?AUTO_333 ?AUTO_332 ) ( CLEAR ?AUTO_333 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_333 ?AUTO_332 )
      ( MAKE-ON ?AUTO_328 ?AUTO_329 )
      ( MAKE-ON-VERIFY ?AUTO_328 ?AUTO_329 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_341 - BLOCK
      ?AUTO_342 - BLOCK
    )
    :vars
    (
      ?AUTO_344 - BLOCK
      ?AUTO_346 - BLOCK
      ?AUTO_343 - BLOCK
      ?AUTO_345 - BLOCK
      ?AUTO_347 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_341 ?AUTO_342 ) ) ( ON-TABLE ?AUTO_341 ) ( not ( = ?AUTO_341 ?AUTO_344 ) ) ( not ( = ?AUTO_341 ?AUTO_346 ) ) ( not ( = ?AUTO_342 ?AUTO_344 ) ) ( not ( = ?AUTO_342 ?AUTO_346 ) ) ( not ( = ?AUTO_344 ?AUTO_346 ) ) ( ON ?AUTO_344 ?AUTO_341 ) ( CLEAR ?AUTO_344 ) ( not ( = ?AUTO_341 ?AUTO_343 ) ) ( not ( = ?AUTO_342 ?AUTO_343 ) ) ( not ( = ?AUTO_344 ?AUTO_343 ) ) ( not ( = ?AUTO_346 ?AUTO_343 ) ) ( ON ?AUTO_346 ?AUTO_342 ) ( CLEAR ?AUTO_345 ) ( not ( = ?AUTO_341 ?AUTO_345 ) ) ( not ( = ?AUTO_342 ?AUTO_345 ) ) ( not ( = ?AUTO_344 ?AUTO_345 ) ) ( not ( = ?AUTO_346 ?AUTO_345 ) ) ( not ( = ?AUTO_343 ?AUTO_345 ) ) ( ON ?AUTO_343 ?AUTO_346 ) ( not ( = ?AUTO_341 ?AUTO_347 ) ) ( not ( = ?AUTO_342 ?AUTO_347 ) ) ( not ( = ?AUTO_344 ?AUTO_347 ) ) ( not ( = ?AUTO_346 ?AUTO_347 ) ) ( not ( = ?AUTO_343 ?AUTO_347 ) ) ( not ( = ?AUTO_345 ?AUTO_347 ) ) ( ON ?AUTO_347 ?AUTO_343 ) ( CLEAR ?AUTO_347 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_347 ?AUTO_343 )
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
      ?AUTO_353 - BLOCK
      ?AUTO_351 - BLOCK
      ?AUTO_354 - BLOCK
      ?AUTO_352 - BLOCK
      ?AUTO_350 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_348 ?AUTO_349 ) ) ( ON-TABLE ?AUTO_348 ) ( not ( = ?AUTO_348 ?AUTO_353 ) ) ( not ( = ?AUTO_348 ?AUTO_351 ) ) ( not ( = ?AUTO_349 ?AUTO_353 ) ) ( not ( = ?AUTO_349 ?AUTO_351 ) ) ( not ( = ?AUTO_353 ?AUTO_351 ) ) ( not ( = ?AUTO_348 ?AUTO_354 ) ) ( not ( = ?AUTO_349 ?AUTO_354 ) ) ( not ( = ?AUTO_353 ?AUTO_354 ) ) ( not ( = ?AUTO_351 ?AUTO_354 ) ) ( ON ?AUTO_351 ?AUTO_349 ) ( CLEAR ?AUTO_352 ) ( not ( = ?AUTO_348 ?AUTO_352 ) ) ( not ( = ?AUTO_349 ?AUTO_352 ) ) ( not ( = ?AUTO_353 ?AUTO_352 ) ) ( not ( = ?AUTO_351 ?AUTO_352 ) ) ( not ( = ?AUTO_354 ?AUTO_352 ) ) ( ON ?AUTO_354 ?AUTO_351 ) ( not ( = ?AUTO_348 ?AUTO_350 ) ) ( not ( = ?AUTO_349 ?AUTO_350 ) ) ( not ( = ?AUTO_353 ?AUTO_350 ) ) ( not ( = ?AUTO_351 ?AUTO_350 ) ) ( not ( = ?AUTO_354 ?AUTO_350 ) ) ( not ( = ?AUTO_352 ?AUTO_350 ) ) ( ON ?AUTO_350 ?AUTO_354 ) ( CLEAR ?AUTO_350 ) ( HOLDING ?AUTO_353 ) ( CLEAR ?AUTO_348 ) )
    :subtasks
    ( ( !STACK ?AUTO_353 ?AUTO_348 )
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
      ?AUTO_360 - BLOCK
      ?AUTO_358 - BLOCK
      ?AUTO_359 - BLOCK
      ?AUTO_361 - BLOCK
      ?AUTO_357 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_355 ?AUTO_356 ) ) ( ON-TABLE ?AUTO_355 ) ( not ( = ?AUTO_355 ?AUTO_360 ) ) ( not ( = ?AUTO_355 ?AUTO_358 ) ) ( not ( = ?AUTO_356 ?AUTO_360 ) ) ( not ( = ?AUTO_356 ?AUTO_358 ) ) ( not ( = ?AUTO_360 ?AUTO_358 ) ) ( not ( = ?AUTO_355 ?AUTO_359 ) ) ( not ( = ?AUTO_356 ?AUTO_359 ) ) ( not ( = ?AUTO_360 ?AUTO_359 ) ) ( not ( = ?AUTO_358 ?AUTO_359 ) ) ( ON ?AUTO_358 ?AUTO_356 ) ( CLEAR ?AUTO_361 ) ( not ( = ?AUTO_355 ?AUTO_361 ) ) ( not ( = ?AUTO_356 ?AUTO_361 ) ) ( not ( = ?AUTO_360 ?AUTO_361 ) ) ( not ( = ?AUTO_358 ?AUTO_361 ) ) ( not ( = ?AUTO_359 ?AUTO_361 ) ) ( ON ?AUTO_359 ?AUTO_358 ) ( not ( = ?AUTO_355 ?AUTO_357 ) ) ( not ( = ?AUTO_356 ?AUTO_357 ) ) ( not ( = ?AUTO_360 ?AUTO_357 ) ) ( not ( = ?AUTO_358 ?AUTO_357 ) ) ( not ( = ?AUTO_359 ?AUTO_357 ) ) ( not ( = ?AUTO_361 ?AUTO_357 ) ) ( ON ?AUTO_357 ?AUTO_359 ) ( CLEAR ?AUTO_357 ) ( CLEAR ?AUTO_355 ) ( ON-TABLE ?AUTO_360 ) ( CLEAR ?AUTO_360 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_360 )
      ( MAKE-ON ?AUTO_355 ?AUTO_356 )
      ( MAKE-ON-VERIFY ?AUTO_355 ?AUTO_356 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4600 - BLOCK
      ?AUTO_4601 - BLOCK
    )
    :vars
    (
      ?AUTO_4604 - BLOCK
      ?AUTO_4602 - BLOCK
      ?AUTO_4603 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4600 ?AUTO_4601 ) ) ( not ( = ?AUTO_4600 ?AUTO_4604 ) ) ( not ( = ?AUTO_4601 ?AUTO_4604 ) ) ( ON ?AUTO_4604 ?AUTO_4601 ) ( not ( = ?AUTO_4600 ?AUTO_4602 ) ) ( not ( = ?AUTO_4601 ?AUTO_4602 ) ) ( not ( = ?AUTO_4604 ?AUTO_4602 ) ) ( ON ?AUTO_4602 ?AUTO_4604 ) ( not ( = ?AUTO_4600 ?AUTO_4603 ) ) ( not ( = ?AUTO_4601 ?AUTO_4603 ) ) ( not ( = ?AUTO_4604 ?AUTO_4603 ) ) ( not ( = ?AUTO_4602 ?AUTO_4603 ) ) ( ON ?AUTO_4603 ?AUTO_4602 ) ( CLEAR ?AUTO_4603 ) ( HOLDING ?AUTO_4600 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4600 )
      ( MAKE-ON ?AUTO_4600 ?AUTO_4601 )
      ( MAKE-ON-VERIFY ?AUTO_4600 ?AUTO_4601 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_369 - BLOCK
      ?AUTO_370 - BLOCK
    )
    :vars
    (
      ?AUTO_372 - BLOCK
      ?AUTO_371 - BLOCK
      ?AUTO_373 - BLOCK
      ?AUTO_375 - BLOCK
      ?AUTO_374 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_369 ?AUTO_370 ) ) ( not ( = ?AUTO_369 ?AUTO_372 ) ) ( not ( = ?AUTO_369 ?AUTO_371 ) ) ( not ( = ?AUTO_370 ?AUTO_372 ) ) ( not ( = ?AUTO_370 ?AUTO_371 ) ) ( not ( = ?AUTO_372 ?AUTO_371 ) ) ( not ( = ?AUTO_369 ?AUTO_373 ) ) ( not ( = ?AUTO_370 ?AUTO_373 ) ) ( not ( = ?AUTO_372 ?AUTO_373 ) ) ( not ( = ?AUTO_371 ?AUTO_373 ) ) ( ON ?AUTO_371 ?AUTO_370 ) ( CLEAR ?AUTO_375 ) ( not ( = ?AUTO_369 ?AUTO_375 ) ) ( not ( = ?AUTO_370 ?AUTO_375 ) ) ( not ( = ?AUTO_372 ?AUTO_375 ) ) ( not ( = ?AUTO_371 ?AUTO_375 ) ) ( not ( = ?AUTO_373 ?AUTO_375 ) ) ( ON ?AUTO_373 ?AUTO_371 ) ( not ( = ?AUTO_369 ?AUTO_374 ) ) ( not ( = ?AUTO_370 ?AUTO_374 ) ) ( not ( = ?AUTO_372 ?AUTO_374 ) ) ( not ( = ?AUTO_371 ?AUTO_374 ) ) ( not ( = ?AUTO_373 ?AUTO_374 ) ) ( not ( = ?AUTO_375 ?AUTO_374 ) ) ( ON ?AUTO_374 ?AUTO_373 ) ( CLEAR ?AUTO_374 ) ( ON-TABLE ?AUTO_372 ) ( ON ?AUTO_369 ?AUTO_372 ) ( CLEAR ?AUTO_369 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_369 ?AUTO_372 )
      ( MAKE-ON ?AUTO_369 ?AUTO_370 )
      ( MAKE-ON-VERIFY ?AUTO_369 ?AUTO_370 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2708 - BLOCK
      ?AUTO_2709 - BLOCK
    )
    :vars
    (
      ?AUTO_2710 - BLOCK
      ?AUTO_2713 - BLOCK
      ?AUTO_2712 - BLOCK
      ?AUTO_2711 - BLOCK
      ?AUTO_2714 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2708 ?AUTO_2709 ) ) ( ON ?AUTO_2708 ?AUTO_2710 ) ( CLEAR ?AUTO_2708 ) ( not ( = ?AUTO_2708 ?AUTO_2710 ) ) ( not ( = ?AUTO_2709 ?AUTO_2710 ) ) ( not ( = ?AUTO_2708 ?AUTO_2713 ) ) ( not ( = ?AUTO_2708 ?AUTO_2712 ) ) ( not ( = ?AUTO_2709 ?AUTO_2713 ) ) ( not ( = ?AUTO_2709 ?AUTO_2712 ) ) ( not ( = ?AUTO_2710 ?AUTO_2713 ) ) ( not ( = ?AUTO_2710 ?AUTO_2712 ) ) ( not ( = ?AUTO_2713 ?AUTO_2712 ) ) ( ON ?AUTO_2713 ?AUTO_2709 ) ( not ( = ?AUTO_2708 ?AUTO_2711 ) ) ( not ( = ?AUTO_2709 ?AUTO_2711 ) ) ( not ( = ?AUTO_2710 ?AUTO_2711 ) ) ( not ( = ?AUTO_2712 ?AUTO_2711 ) ) ( not ( = ?AUTO_2713 ?AUTO_2711 ) ) ( ON ?AUTO_2711 ?AUTO_2713 ) ( ON ?AUTO_2712 ?AUTO_2711 ) ( CLEAR ?AUTO_2712 ) ( HOLDING ?AUTO_2714 ) ( not ( = ?AUTO_2708 ?AUTO_2714 ) ) ( not ( = ?AUTO_2709 ?AUTO_2714 ) ) ( not ( = ?AUTO_2710 ?AUTO_2714 ) ) ( not ( = ?AUTO_2713 ?AUTO_2714 ) ) ( not ( = ?AUTO_2712 ?AUTO_2714 ) ) ( not ( = ?AUTO_2711 ?AUTO_2714 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2714 )
      ( MAKE-ON ?AUTO_2708 ?AUTO_2709 )
      ( MAKE-ON-VERIFY ?AUTO_2708 ?AUTO_2709 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_386 - BLOCK
      ?AUTO_387 - BLOCK
    )
    :vars
    (
      ?AUTO_392 - BLOCK
      ?AUTO_389 - BLOCK
      ?AUTO_391 - BLOCK
      ?AUTO_388 - BLOCK
      ?AUTO_390 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_386 ?AUTO_387 ) ) ( not ( = ?AUTO_386 ?AUTO_392 ) ) ( not ( = ?AUTO_386 ?AUTO_389 ) ) ( not ( = ?AUTO_387 ?AUTO_392 ) ) ( not ( = ?AUTO_387 ?AUTO_389 ) ) ( not ( = ?AUTO_392 ?AUTO_389 ) ) ( not ( = ?AUTO_386 ?AUTO_391 ) ) ( not ( = ?AUTO_387 ?AUTO_391 ) ) ( not ( = ?AUTO_392 ?AUTO_391 ) ) ( not ( = ?AUTO_389 ?AUTO_391 ) ) ( ON ?AUTO_389 ?AUTO_387 ) ( CLEAR ?AUTO_388 ) ( not ( = ?AUTO_386 ?AUTO_388 ) ) ( not ( = ?AUTO_387 ?AUTO_388 ) ) ( not ( = ?AUTO_392 ?AUTO_388 ) ) ( not ( = ?AUTO_389 ?AUTO_388 ) ) ( not ( = ?AUTO_391 ?AUTO_388 ) ) ( ON ?AUTO_391 ?AUTO_389 ) ( not ( = ?AUTO_386 ?AUTO_390 ) ) ( not ( = ?AUTO_387 ?AUTO_390 ) ) ( not ( = ?AUTO_392 ?AUTO_390 ) ) ( not ( = ?AUTO_389 ?AUTO_390 ) ) ( not ( = ?AUTO_391 ?AUTO_390 ) ) ( not ( = ?AUTO_388 ?AUTO_390 ) ) ( ON-TABLE ?AUTO_392 ) ( ON ?AUTO_386 ?AUTO_392 ) ( CLEAR ?AUTO_386 ) ( HOLDING ?AUTO_390 ) ( CLEAR ?AUTO_391 ) )
    :subtasks
    ( ( !STACK ?AUTO_390 ?AUTO_391 )
      ( MAKE-ON ?AUTO_386 ?AUTO_387 )
      ( MAKE-ON-VERIFY ?AUTO_386 ?AUTO_387 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_415 - BLOCK
    )
    :vars
    (
      ?AUTO_416 - BLOCK
      ?AUTO_417 - BLOCK
      ?AUTO_418 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_415 ?AUTO_416 ) ( not ( = ?AUTO_415 ?AUTO_416 ) ) ( not ( = ?AUTO_415 ?AUTO_417 ) ) ( not ( = ?AUTO_416 ?AUTO_417 ) ) ( ON ?AUTO_417 ?AUTO_415 ) ( CLEAR ?AUTO_417 ) ( HOLDING ?AUTO_418 ) ( not ( = ?AUTO_415 ?AUTO_418 ) ) ( not ( = ?AUTO_416 ?AUTO_418 ) ) ( not ( = ?AUTO_417 ?AUTO_418 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_418 )
      ( MAKE-ON-TABLE ?AUTO_415 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_415 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_435 - BLOCK
      ?AUTO_436 - BLOCK
    )
    :vars
    (
      ?AUTO_438 - BLOCK
      ?AUTO_437 - BLOCK
      ?AUTO_439 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_436 ) ( not ( = ?AUTO_435 ?AUTO_436 ) ) ( ON ?AUTO_435 ?AUTO_438 ) ( not ( = ?AUTO_435 ?AUTO_438 ) ) ( not ( = ?AUTO_436 ?AUTO_438 ) ) ( not ( = ?AUTO_435 ?AUTO_437 ) ) ( not ( = ?AUTO_436 ?AUTO_437 ) ) ( not ( = ?AUTO_438 ?AUTO_437 ) ) ( ON ?AUTO_437 ?AUTO_435 ) ( CLEAR ?AUTO_437 ) ( HOLDING ?AUTO_439 ) ( not ( = ?AUTO_435 ?AUTO_439 ) ) ( not ( = ?AUTO_436 ?AUTO_439 ) ) ( not ( = ?AUTO_438 ?AUTO_439 ) ) ( not ( = ?AUTO_437 ?AUTO_439 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_439 )
      ( MAKE-ON ?AUTO_435 ?AUTO_436 )
      ( MAKE-ON-VERIFY ?AUTO_435 ?AUTO_436 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_440 - BLOCK
      ?AUTO_441 - BLOCK
    )
    :vars
    (
      ?AUTO_444 - BLOCK
      ?AUTO_442 - BLOCK
      ?AUTO_443 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_441 ) ( not ( = ?AUTO_440 ?AUTO_441 ) ) ( ON ?AUTO_440 ?AUTO_444 ) ( not ( = ?AUTO_440 ?AUTO_444 ) ) ( not ( = ?AUTO_441 ?AUTO_444 ) ) ( not ( = ?AUTO_440 ?AUTO_442 ) ) ( not ( = ?AUTO_441 ?AUTO_442 ) ) ( not ( = ?AUTO_444 ?AUTO_442 ) ) ( ON ?AUTO_442 ?AUTO_440 ) ( not ( = ?AUTO_440 ?AUTO_443 ) ) ( not ( = ?AUTO_441 ?AUTO_443 ) ) ( not ( = ?AUTO_444 ?AUTO_443 ) ) ( not ( = ?AUTO_442 ?AUTO_443 ) ) ( ON ?AUTO_443 ?AUTO_442 ) ( CLEAR ?AUTO_443 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_443 ?AUTO_442 )
      ( MAKE-ON ?AUTO_440 ?AUTO_441 )
      ( MAKE-ON-VERIFY ?AUTO_440 ?AUTO_441 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_445 - BLOCK
      ?AUTO_446 - BLOCK
    )
    :vars
    (
      ?AUTO_449 - BLOCK
      ?AUTO_448 - BLOCK
      ?AUTO_447 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_445 ?AUTO_446 ) ) ( ON ?AUTO_445 ?AUTO_449 ) ( not ( = ?AUTO_445 ?AUTO_449 ) ) ( not ( = ?AUTO_446 ?AUTO_449 ) ) ( not ( = ?AUTO_445 ?AUTO_448 ) ) ( not ( = ?AUTO_446 ?AUTO_448 ) ) ( not ( = ?AUTO_449 ?AUTO_448 ) ) ( ON ?AUTO_448 ?AUTO_445 ) ( not ( = ?AUTO_445 ?AUTO_447 ) ) ( not ( = ?AUTO_446 ?AUTO_447 ) ) ( not ( = ?AUTO_449 ?AUTO_447 ) ) ( not ( = ?AUTO_448 ?AUTO_447 ) ) ( ON ?AUTO_447 ?AUTO_448 ) ( CLEAR ?AUTO_447 ) ( HOLDING ?AUTO_446 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_446 )
      ( MAKE-ON ?AUTO_445 ?AUTO_446 )
      ( MAKE-ON-VERIFY ?AUTO_445 ?AUTO_446 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1175 - BLOCK
      ?AUTO_1176 - BLOCK
    )
    :vars
    (
      ?AUTO_1177 - BLOCK
      ?AUTO_1178 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1176 ) ( not ( = ?AUTO_1175 ?AUTO_1176 ) ) ( ON-TABLE ?AUTO_1175 ) ( not ( = ?AUTO_1175 ?AUTO_1177 ) ) ( not ( = ?AUTO_1176 ?AUTO_1177 ) ) ( ON ?AUTO_1177 ?AUTO_1175 ) ( CLEAR ?AUTO_1177 ) ( HOLDING ?AUTO_1178 ) ( not ( = ?AUTO_1175 ?AUTO_1178 ) ) ( not ( = ?AUTO_1176 ?AUTO_1178 ) ) ( not ( = ?AUTO_1177 ?AUTO_1178 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1178 )
      ( MAKE-ON ?AUTO_1175 ?AUTO_1176 )
      ( MAKE-ON-VERIFY ?AUTO_1175 ?AUTO_1176 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1179 - BLOCK
      ?AUTO_1180 - BLOCK
    )
    :vars
    (
      ?AUTO_1182 - BLOCK
      ?AUTO_1181 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1180 ) ( not ( = ?AUTO_1179 ?AUTO_1180 ) ) ( ON-TABLE ?AUTO_1179 ) ( not ( = ?AUTO_1179 ?AUTO_1182 ) ) ( not ( = ?AUTO_1180 ?AUTO_1182 ) ) ( ON ?AUTO_1182 ?AUTO_1179 ) ( not ( = ?AUTO_1179 ?AUTO_1181 ) ) ( not ( = ?AUTO_1180 ?AUTO_1181 ) ) ( not ( = ?AUTO_1182 ?AUTO_1181 ) ) ( ON ?AUTO_1181 ?AUTO_1182 ) ( CLEAR ?AUTO_1181 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1181 ?AUTO_1182 )
      ( MAKE-ON ?AUTO_1179 ?AUTO_1180 )
      ( MAKE-ON-VERIFY ?AUTO_1179 ?AUTO_1180 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3017 - BLOCK
      ?AUTO_3018 - BLOCK
    )
    :vars
    (
      ?AUTO_3021 - BLOCK
      ?AUTO_3020 - BLOCK
      ?AUTO_3019 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3018 ) ( not ( = ?AUTO_3017 ?AUTO_3018 ) ) ( ON-TABLE ?AUTO_3017 ) ( not ( = ?AUTO_3017 ?AUTO_3021 ) ) ( not ( = ?AUTO_3018 ?AUTO_3021 ) ) ( ON ?AUTO_3021 ?AUTO_3017 ) ( not ( = ?AUTO_3017 ?AUTO_3020 ) ) ( not ( = ?AUTO_3017 ?AUTO_3019 ) ) ( not ( = ?AUTO_3018 ?AUTO_3020 ) ) ( not ( = ?AUTO_3018 ?AUTO_3019 ) ) ( not ( = ?AUTO_3021 ?AUTO_3020 ) ) ( not ( = ?AUTO_3021 ?AUTO_3019 ) ) ( not ( = ?AUTO_3020 ?AUTO_3019 ) ) ( ON ?AUTO_3020 ?AUTO_3021 ) ( CLEAR ?AUTO_3020 ) ( HOLDING ?AUTO_3019 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3019 )
      ( MAKE-ON ?AUTO_3017 ?AUTO_3018 )
      ( MAKE-ON-VERIFY ?AUTO_3017 ?AUTO_3018 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4429 - BLOCK
      ?AUTO_4430 - BLOCK
    )
    :vars
    (
      ?AUTO_4431 - BLOCK
      ?AUTO_4433 - BLOCK
      ?AUTO_4432 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4430 ) ( not ( = ?AUTO_4429 ?AUTO_4430 ) ) ( ON-TABLE ?AUTO_4429 ) ( not ( = ?AUTO_4429 ?AUTO_4431 ) ) ( not ( = ?AUTO_4429 ?AUTO_4433 ) ) ( not ( = ?AUTO_4430 ?AUTO_4431 ) ) ( not ( = ?AUTO_4430 ?AUTO_4433 ) ) ( not ( = ?AUTO_4431 ?AUTO_4433 ) ) ( ON ?AUTO_4431 ?AUTO_4429 ) ( not ( = ?AUTO_4429 ?AUTO_4432 ) ) ( not ( = ?AUTO_4430 ?AUTO_4432 ) ) ( not ( = ?AUTO_4431 ?AUTO_4432 ) ) ( not ( = ?AUTO_4433 ?AUTO_4432 ) ) ( ON ?AUTO_4433 ?AUTO_4431 ) ( ON ?AUTO_4432 ?AUTO_4433 ) ( CLEAR ?AUTO_4432 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4432 ?AUTO_4433 )
      ( MAKE-ON ?AUTO_4429 ?AUTO_4430 )
      ( MAKE-ON-VERIFY ?AUTO_4429 ?AUTO_4430 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_488 - BLOCK
      ?AUTO_489 - BLOCK
    )
    :vars
    (
      ?AUTO_492 - BLOCK
      ?AUTO_491 - BLOCK
      ?AUTO_493 - BLOCK
      ?AUTO_490 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_489 ) ( not ( = ?AUTO_488 ?AUTO_489 ) ) ( ON-TABLE ?AUTO_488 ) ( not ( = ?AUTO_488 ?AUTO_492 ) ) ( not ( = ?AUTO_488 ?AUTO_491 ) ) ( not ( = ?AUTO_489 ?AUTO_492 ) ) ( not ( = ?AUTO_489 ?AUTO_491 ) ) ( not ( = ?AUTO_492 ?AUTO_491 ) ) ( ON ?AUTO_492 ?AUTO_488 ) ( not ( = ?AUTO_488 ?AUTO_493 ) ) ( not ( = ?AUTO_489 ?AUTO_493 ) ) ( not ( = ?AUTO_491 ?AUTO_493 ) ) ( not ( = ?AUTO_492 ?AUTO_493 ) ) ( ON ?AUTO_493 ?AUTO_492 ) ( not ( = ?AUTO_488 ?AUTO_490 ) ) ( not ( = ?AUTO_489 ?AUTO_490 ) ) ( not ( = ?AUTO_491 ?AUTO_490 ) ) ( not ( = ?AUTO_492 ?AUTO_490 ) ) ( not ( = ?AUTO_493 ?AUTO_490 ) ) ( ON ?AUTO_490 ?AUTO_493 ) ( CLEAR ?AUTO_490 ) ( HOLDING ?AUTO_491 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_491 )
      ( MAKE-ON ?AUTO_488 ?AUTO_489 )
      ( MAKE-ON-VERIFY ?AUTO_488 ?AUTO_489 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_577 - BLOCK
      ?AUTO_578 - BLOCK
    )
    :vars
    (
      ?AUTO_579 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_577 ?AUTO_578 ) ) ( ON-TABLE ?AUTO_577 ) ( CLEAR ?AUTO_577 ) ( not ( = ?AUTO_577 ?AUTO_579 ) ) ( not ( = ?AUTO_578 ?AUTO_579 ) ) ( ON ?AUTO_579 ?AUTO_578 ) ( CLEAR ?AUTO_579 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_579 ?AUTO_578 )
      ( MAKE-ON ?AUTO_577 ?AUTO_578 )
      ( MAKE-ON-VERIFY ?AUTO_577 ?AUTO_578 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1262 - BLOCK
      ?AUTO_1263 - BLOCK
    )
    :vars
    (
      ?AUTO_1264 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1262 ?AUTO_1263 ) ) ( not ( = ?AUTO_1262 ?AUTO_1264 ) ) ( not ( = ?AUTO_1263 ?AUTO_1264 ) ) ( ON ?AUTO_1264 ?AUTO_1263 ) ( CLEAR ?AUTO_1264 ) ( HOLDING ?AUTO_1262 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1262 )
      ( MAKE-ON ?AUTO_1262 ?AUTO_1263 )
      ( MAKE-ON-VERIFY ?AUTO_1262 ?AUTO_1263 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1265 - BLOCK
      ?AUTO_1266 - BLOCK
    )
    :vars
    (
      ?AUTO_1267 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1265 ?AUTO_1266 ) ) ( not ( = ?AUTO_1265 ?AUTO_1267 ) ) ( not ( = ?AUTO_1266 ?AUTO_1267 ) ) ( ON ?AUTO_1267 ?AUTO_1266 ) ( ON ?AUTO_1265 ?AUTO_1267 ) ( CLEAR ?AUTO_1265 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1265 ?AUTO_1267 )
      ( MAKE-ON ?AUTO_1265 ?AUTO_1266 )
      ( MAKE-ON-VERIFY ?AUTO_1265 ?AUTO_1266 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_521 - BLOCK
      ?AUTO_522 - BLOCK
    )
    :vars
    (
      ?AUTO_524 - BLOCK
      ?AUTO_523 - BLOCK
      ?AUTO_525 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_521 ?AUTO_522 ) ) ( CLEAR ?AUTO_524 ) ( not ( = ?AUTO_521 ?AUTO_523 ) ) ( not ( = ?AUTO_521 ?AUTO_524 ) ) ( not ( = ?AUTO_522 ?AUTO_523 ) ) ( not ( = ?AUTO_522 ?AUTO_524 ) ) ( not ( = ?AUTO_523 ?AUTO_524 ) ) ( ON ?AUTO_523 ?AUTO_522 ) ( ON ?AUTO_521 ?AUTO_523 ) ( CLEAR ?AUTO_521 ) ( HOLDING ?AUTO_525 ) ( not ( = ?AUTO_521 ?AUTO_525 ) ) ( not ( = ?AUTO_522 ?AUTO_525 ) ) ( not ( = ?AUTO_524 ?AUTO_525 ) ) ( not ( = ?AUTO_523 ?AUTO_525 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_525 )
      ( MAKE-ON ?AUTO_521 ?AUTO_522 )
      ( MAKE-ON-VERIFY ?AUTO_521 ?AUTO_522 ) )
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
      ?AUTO_530 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_526 ?AUTO_527 ) ) ( CLEAR ?AUTO_528 ) ( not ( = ?AUTO_526 ?AUTO_529 ) ) ( not ( = ?AUTO_526 ?AUTO_528 ) ) ( not ( = ?AUTO_527 ?AUTO_529 ) ) ( not ( = ?AUTO_527 ?AUTO_528 ) ) ( not ( = ?AUTO_529 ?AUTO_528 ) ) ( ON ?AUTO_529 ?AUTO_527 ) ( ON ?AUTO_526 ?AUTO_529 ) ( not ( = ?AUTO_526 ?AUTO_530 ) ) ( not ( = ?AUTO_527 ?AUTO_530 ) ) ( not ( = ?AUTO_528 ?AUTO_530 ) ) ( not ( = ?AUTO_529 ?AUTO_530 ) ) ( ON ?AUTO_530 ?AUTO_526 ) ( CLEAR ?AUTO_530 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_530 ?AUTO_526 )
      ( MAKE-ON ?AUTO_526 ?AUTO_527 )
      ( MAKE-ON-VERIFY ?AUTO_526 ?AUTO_527 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_531 - BLOCK
      ?AUTO_532 - BLOCK
    )
    :vars
    (
      ?AUTO_533 - BLOCK
      ?AUTO_534 - BLOCK
      ?AUTO_535 - BLOCK
      ?AUTO_536 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_531 ?AUTO_532 ) ) ( CLEAR ?AUTO_533 ) ( not ( = ?AUTO_531 ?AUTO_534 ) ) ( not ( = ?AUTO_531 ?AUTO_533 ) ) ( not ( = ?AUTO_532 ?AUTO_534 ) ) ( not ( = ?AUTO_532 ?AUTO_533 ) ) ( not ( = ?AUTO_534 ?AUTO_533 ) ) ( ON ?AUTO_534 ?AUTO_532 ) ( ON ?AUTO_531 ?AUTO_534 ) ( not ( = ?AUTO_531 ?AUTO_535 ) ) ( not ( = ?AUTO_532 ?AUTO_535 ) ) ( not ( = ?AUTO_533 ?AUTO_535 ) ) ( not ( = ?AUTO_534 ?AUTO_535 ) ) ( ON ?AUTO_535 ?AUTO_531 ) ( CLEAR ?AUTO_535 ) ( HOLDING ?AUTO_536 ) ( not ( = ?AUTO_531 ?AUTO_536 ) ) ( not ( = ?AUTO_532 ?AUTO_536 ) ) ( not ( = ?AUTO_533 ?AUTO_536 ) ) ( not ( = ?AUTO_534 ?AUTO_536 ) ) ( not ( = ?AUTO_535 ?AUTO_536 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_536 )
      ( MAKE-ON ?AUTO_531 ?AUTO_532 )
      ( MAKE-ON-VERIFY ?AUTO_531 ?AUTO_532 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_574 - BLOCK
      ?AUTO_575 - BLOCK
    )
    :vars
    (
      ?AUTO_576 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_575 ) ( not ( = ?AUTO_574 ?AUTO_575 ) ) ( ON-TABLE ?AUTO_574 ) ( CLEAR ?AUTO_574 ) ( HOLDING ?AUTO_576 ) ( not ( = ?AUTO_574 ?AUTO_576 ) ) ( not ( = ?AUTO_575 ?AUTO_576 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_576 )
      ( MAKE-ON ?AUTO_574 ?AUTO_575 )
      ( MAKE-ON-VERIFY ?AUTO_574 ?AUTO_575 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_580 - BLOCK
      ?AUTO_581 - BLOCK
    )
    :vars
    (
      ?AUTO_582 - BLOCK
      ?AUTO_583 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_580 ?AUTO_581 ) ) ( ON-TABLE ?AUTO_580 ) ( CLEAR ?AUTO_580 ) ( not ( = ?AUTO_580 ?AUTO_582 ) ) ( not ( = ?AUTO_581 ?AUTO_582 ) ) ( ON ?AUTO_582 ?AUTO_581 ) ( CLEAR ?AUTO_582 ) ( HOLDING ?AUTO_583 ) ( not ( = ?AUTO_580 ?AUTO_583 ) ) ( not ( = ?AUTO_581 ?AUTO_583 ) ) ( not ( = ?AUTO_582 ?AUTO_583 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_583 )
      ( MAKE-ON ?AUTO_580 ?AUTO_581 )
      ( MAKE-ON-VERIFY ?AUTO_580 ?AUTO_581 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_617 - BLOCK
      ?AUTO_618 - BLOCK
    )
    :vars
    (
      ?AUTO_621 - BLOCK
      ?AUTO_620 - BLOCK
      ?AUTO_619 - BLOCK
      ?AUTO_622 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_618 ) ( not ( = ?AUTO_617 ?AUTO_618 ) ) ( ON ?AUTO_617 ?AUTO_621 ) ( not ( = ?AUTO_617 ?AUTO_621 ) ) ( not ( = ?AUTO_618 ?AUTO_621 ) ) ( not ( = ?AUTO_617 ?AUTO_620 ) ) ( not ( = ?AUTO_618 ?AUTO_620 ) ) ( not ( = ?AUTO_621 ?AUTO_620 ) ) ( ON ?AUTO_620 ?AUTO_617 ) ( not ( = ?AUTO_617 ?AUTO_619 ) ) ( not ( = ?AUTO_618 ?AUTO_619 ) ) ( not ( = ?AUTO_621 ?AUTO_619 ) ) ( not ( = ?AUTO_620 ?AUTO_619 ) ) ( ON ?AUTO_619 ?AUTO_620 ) ( CLEAR ?AUTO_619 ) ( HOLDING ?AUTO_622 ) ( not ( = ?AUTO_617 ?AUTO_622 ) ) ( not ( = ?AUTO_618 ?AUTO_622 ) ) ( not ( = ?AUTO_621 ?AUTO_622 ) ) ( not ( = ?AUTO_620 ?AUTO_622 ) ) ( not ( = ?AUTO_619 ?AUTO_622 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_622 )
      ( MAKE-ON ?AUTO_617 ?AUTO_618 )
      ( MAKE-ON-VERIFY ?AUTO_617 ?AUTO_618 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_665 - BLOCK
      ?AUTO_666 - BLOCK
    )
    :vars
    (
      ?AUTO_667 - BLOCK
      ?AUTO_669 - BLOCK
      ?AUTO_668 - BLOCK
      ?AUTO_671 - BLOCK
      ?AUTO_670 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_666 ) ( not ( = ?AUTO_665 ?AUTO_666 ) ) ( ON ?AUTO_665 ?AUTO_667 ) ( not ( = ?AUTO_665 ?AUTO_667 ) ) ( not ( = ?AUTO_666 ?AUTO_667 ) ) ( not ( = ?AUTO_665 ?AUTO_669 ) ) ( not ( = ?AUTO_665 ?AUTO_668 ) ) ( not ( = ?AUTO_666 ?AUTO_669 ) ) ( not ( = ?AUTO_666 ?AUTO_668 ) ) ( not ( = ?AUTO_667 ?AUTO_669 ) ) ( not ( = ?AUTO_667 ?AUTO_668 ) ) ( not ( = ?AUTO_669 ?AUTO_668 ) ) ( ON ?AUTO_669 ?AUTO_665 ) ( CLEAR ?AUTO_671 ) ( not ( = ?AUTO_665 ?AUTO_671 ) ) ( not ( = ?AUTO_666 ?AUTO_671 ) ) ( not ( = ?AUTO_667 ?AUTO_671 ) ) ( not ( = ?AUTO_669 ?AUTO_671 ) ) ( not ( = ?AUTO_668 ?AUTO_671 ) ) ( ON ?AUTO_668 ?AUTO_669 ) ( not ( = ?AUTO_665 ?AUTO_670 ) ) ( not ( = ?AUTO_666 ?AUTO_670 ) ) ( not ( = ?AUTO_667 ?AUTO_670 ) ) ( not ( = ?AUTO_669 ?AUTO_670 ) ) ( not ( = ?AUTO_668 ?AUTO_670 ) ) ( not ( = ?AUTO_671 ?AUTO_670 ) ) ( ON ?AUTO_670 ?AUTO_668 ) ( CLEAR ?AUTO_670 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_670 ?AUTO_668 )
      ( MAKE-ON ?AUTO_665 ?AUTO_666 )
      ( MAKE-ON-VERIFY ?AUTO_665 ?AUTO_666 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4260 - BLOCK
      ?AUTO_4261 - BLOCK
    )
    :vars
    (
      ?AUTO_4262 - BLOCK
      ?AUTO_4266 - BLOCK
      ?AUTO_4264 - BLOCK
      ?AUTO_4265 - BLOCK
      ?AUTO_4263 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4261 ) ( not ( = ?AUTO_4260 ?AUTO_4261 ) ) ( ON ?AUTO_4260 ?AUTO_4262 ) ( not ( = ?AUTO_4260 ?AUTO_4262 ) ) ( not ( = ?AUTO_4261 ?AUTO_4262 ) ) ( not ( = ?AUTO_4260 ?AUTO_4266 ) ) ( not ( = ?AUTO_4261 ?AUTO_4266 ) ) ( not ( = ?AUTO_4262 ?AUTO_4266 ) ) ( ON ?AUTO_4266 ?AUTO_4260 ) ( not ( = ?AUTO_4260 ?AUTO_4264 ) ) ( not ( = ?AUTO_4260 ?AUTO_4265 ) ) ( not ( = ?AUTO_4261 ?AUTO_4264 ) ) ( not ( = ?AUTO_4261 ?AUTO_4265 ) ) ( not ( = ?AUTO_4262 ?AUTO_4264 ) ) ( not ( = ?AUTO_4262 ?AUTO_4265 ) ) ( not ( = ?AUTO_4266 ?AUTO_4264 ) ) ( not ( = ?AUTO_4266 ?AUTO_4265 ) ) ( not ( = ?AUTO_4264 ?AUTO_4265 ) ) ( ON ?AUTO_4264 ?AUTO_4266 ) ( not ( = ?AUTO_4260 ?AUTO_4263 ) ) ( not ( = ?AUTO_4261 ?AUTO_4263 ) ) ( not ( = ?AUTO_4262 ?AUTO_4263 ) ) ( not ( = ?AUTO_4266 ?AUTO_4263 ) ) ( not ( = ?AUTO_4265 ?AUTO_4263 ) ) ( not ( = ?AUTO_4264 ?AUTO_4263 ) ) ( ON ?AUTO_4263 ?AUTO_4264 ) ( CLEAR ?AUTO_4263 ) ( HOLDING ?AUTO_4265 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4265 )
      ( MAKE-ON ?AUTO_4260 ?AUTO_4261 )
      ( MAKE-ON-VERIFY ?AUTO_4260 ?AUTO_4261 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4267 - BLOCK
      ?AUTO_4268 - BLOCK
    )
    :vars
    (
      ?AUTO_4269 - BLOCK
      ?AUTO_4270 - BLOCK
      ?AUTO_4273 - BLOCK
      ?AUTO_4271 - BLOCK
      ?AUTO_4272 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4267 ?AUTO_4268 ) ) ( ON ?AUTO_4267 ?AUTO_4269 ) ( not ( = ?AUTO_4267 ?AUTO_4269 ) ) ( not ( = ?AUTO_4268 ?AUTO_4269 ) ) ( not ( = ?AUTO_4267 ?AUTO_4270 ) ) ( not ( = ?AUTO_4268 ?AUTO_4270 ) ) ( not ( = ?AUTO_4269 ?AUTO_4270 ) ) ( ON ?AUTO_4270 ?AUTO_4267 ) ( not ( = ?AUTO_4267 ?AUTO_4273 ) ) ( not ( = ?AUTO_4267 ?AUTO_4271 ) ) ( not ( = ?AUTO_4268 ?AUTO_4273 ) ) ( not ( = ?AUTO_4268 ?AUTO_4271 ) ) ( not ( = ?AUTO_4269 ?AUTO_4273 ) ) ( not ( = ?AUTO_4269 ?AUTO_4271 ) ) ( not ( = ?AUTO_4270 ?AUTO_4273 ) ) ( not ( = ?AUTO_4270 ?AUTO_4271 ) ) ( not ( = ?AUTO_4273 ?AUTO_4271 ) ) ( ON ?AUTO_4273 ?AUTO_4270 ) ( not ( = ?AUTO_4267 ?AUTO_4272 ) ) ( not ( = ?AUTO_4268 ?AUTO_4272 ) ) ( not ( = ?AUTO_4269 ?AUTO_4272 ) ) ( not ( = ?AUTO_4270 ?AUTO_4272 ) ) ( not ( = ?AUTO_4271 ?AUTO_4272 ) ) ( not ( = ?AUTO_4273 ?AUTO_4272 ) ) ( ON ?AUTO_4272 ?AUTO_4273 ) ( CLEAR ?AUTO_4272 ) ( ON ?AUTO_4271 ?AUTO_4268 ) ( CLEAR ?AUTO_4271 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4271 ?AUTO_4268 )
      ( MAKE-ON ?AUTO_4267 ?AUTO_4268 )
      ( MAKE-ON-VERIFY ?AUTO_4267 ?AUTO_4268 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1190 - BLOCK
      ?AUTO_1191 - BLOCK
    )
    :vars
    (
      ?AUTO_1192 - BLOCK
      ?AUTO_1193 - BLOCK
      ?AUTO_1194 - BLOCK
      ?AUTO_1195 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1191 ) ( not ( = ?AUTO_1190 ?AUTO_1191 ) ) ( ON-TABLE ?AUTO_1190 ) ( not ( = ?AUTO_1190 ?AUTO_1192 ) ) ( not ( = ?AUTO_1191 ?AUTO_1192 ) ) ( ON ?AUTO_1192 ?AUTO_1190 ) ( not ( = ?AUTO_1190 ?AUTO_1193 ) ) ( not ( = ?AUTO_1191 ?AUTO_1193 ) ) ( not ( = ?AUTO_1192 ?AUTO_1193 ) ) ( ON ?AUTO_1193 ?AUTO_1192 ) ( CLEAR ?AUTO_1193 ) ( HOLDING ?AUTO_1194 ) ( CLEAR ?AUTO_1195 ) ( not ( = ?AUTO_1190 ?AUTO_1194 ) ) ( not ( = ?AUTO_1190 ?AUTO_1195 ) ) ( not ( = ?AUTO_1191 ?AUTO_1194 ) ) ( not ( = ?AUTO_1191 ?AUTO_1195 ) ) ( not ( = ?AUTO_1192 ?AUTO_1194 ) ) ( not ( = ?AUTO_1192 ?AUTO_1195 ) ) ( not ( = ?AUTO_1193 ?AUTO_1194 ) ) ( not ( = ?AUTO_1193 ?AUTO_1195 ) ) ( not ( = ?AUTO_1194 ?AUTO_1195 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1194 ?AUTO_1195 )
      ( MAKE-ON ?AUTO_1190 ?AUTO_1191 )
      ( MAKE-ON-VERIFY ?AUTO_1190 ?AUTO_1191 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3136 - BLOCK
      ?AUTO_3137 - BLOCK
    )
    :vars
    (
      ?AUTO_3140 - BLOCK
      ?AUTO_3141 - BLOCK
      ?AUTO_3138 - BLOCK
      ?AUTO_3139 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3137 ) ( not ( = ?AUTO_3136 ?AUTO_3137 ) ) ( ON-TABLE ?AUTO_3136 ) ( not ( = ?AUTO_3136 ?AUTO_3140 ) ) ( not ( = ?AUTO_3137 ?AUTO_3140 ) ) ( ON ?AUTO_3140 ?AUTO_3136 ) ( not ( = ?AUTO_3136 ?AUTO_3141 ) ) ( not ( = ?AUTO_3136 ?AUTO_3138 ) ) ( not ( = ?AUTO_3137 ?AUTO_3141 ) ) ( not ( = ?AUTO_3137 ?AUTO_3138 ) ) ( not ( = ?AUTO_3140 ?AUTO_3141 ) ) ( not ( = ?AUTO_3140 ?AUTO_3138 ) ) ( not ( = ?AUTO_3141 ?AUTO_3138 ) ) ( ON ?AUTO_3141 ?AUTO_3140 ) ( not ( = ?AUTO_3136 ?AUTO_3139 ) ) ( not ( = ?AUTO_3137 ?AUTO_3139 ) ) ( not ( = ?AUTO_3140 ?AUTO_3139 ) ) ( not ( = ?AUTO_3138 ?AUTO_3139 ) ) ( not ( = ?AUTO_3141 ?AUTO_3139 ) ) ( ON ?AUTO_3139 ?AUTO_3141 ) ( ON ?AUTO_3138 ?AUTO_3139 ) ( CLEAR ?AUTO_3138 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3138 ?AUTO_3139 )
      ( MAKE-ON ?AUTO_3136 ?AUTO_3137 )
      ( MAKE-ON-VERIFY ?AUTO_3136 ?AUTO_3137 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_748 - BLOCK
      ?AUTO_749 - BLOCK
    )
    :vars
    (
      ?AUTO_750 - BLOCK
      ?AUTO_754 - BLOCK
      ?AUTO_752 - BLOCK
      ?AUTO_751 - BLOCK
      ?AUTO_753 - BLOCK
      ?AUTO_755 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_748 ?AUTO_749 ) ) ( ON-TABLE ?AUTO_748 ) ( CLEAR ?AUTO_750 ) ( not ( = ?AUTO_748 ?AUTO_754 ) ) ( not ( = ?AUTO_748 ?AUTO_750 ) ) ( not ( = ?AUTO_749 ?AUTO_754 ) ) ( not ( = ?AUTO_749 ?AUTO_750 ) ) ( not ( = ?AUTO_754 ?AUTO_750 ) ) ( ON ?AUTO_754 ?AUTO_748 ) ( not ( = ?AUTO_748 ?AUTO_752 ) ) ( not ( = ?AUTO_748 ?AUTO_751 ) ) ( not ( = ?AUTO_749 ?AUTO_752 ) ) ( not ( = ?AUTO_749 ?AUTO_751 ) ) ( not ( = ?AUTO_750 ?AUTO_752 ) ) ( not ( = ?AUTO_750 ?AUTO_751 ) ) ( not ( = ?AUTO_754 ?AUTO_752 ) ) ( not ( = ?AUTO_754 ?AUTO_751 ) ) ( not ( = ?AUTO_752 ?AUTO_751 ) ) ( ON ?AUTO_752 ?AUTO_754 ) ( CLEAR ?AUTO_753 ) ( not ( = ?AUTO_748 ?AUTO_753 ) ) ( not ( = ?AUTO_749 ?AUTO_753 ) ) ( not ( = ?AUTO_750 ?AUTO_753 ) ) ( not ( = ?AUTO_754 ?AUTO_753 ) ) ( not ( = ?AUTO_752 ?AUTO_753 ) ) ( not ( = ?AUTO_751 ?AUTO_753 ) ) ( ON ?AUTO_751 ?AUTO_752 ) ( not ( = ?AUTO_748 ?AUTO_755 ) ) ( not ( = ?AUTO_749 ?AUTO_755 ) ) ( not ( = ?AUTO_750 ?AUTO_755 ) ) ( not ( = ?AUTO_754 ?AUTO_755 ) ) ( not ( = ?AUTO_752 ?AUTO_755 ) ) ( not ( = ?AUTO_751 ?AUTO_755 ) ) ( not ( = ?AUTO_753 ?AUTO_755 ) ) ( ON ?AUTO_755 ?AUTO_751 ) ( CLEAR ?AUTO_755 ) ( HOLDING ?AUTO_749 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_749 )
      ( MAKE-ON ?AUTO_748 ?AUTO_749 )
      ( MAKE-ON-VERIFY ?AUTO_748 ?AUTO_749 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_756 - BLOCK
      ?AUTO_757 - BLOCK
    )
    :vars
    (
      ?AUTO_762 - BLOCK
      ?AUTO_763 - BLOCK
      ?AUTO_758 - BLOCK
      ?AUTO_759 - BLOCK
      ?AUTO_760 - BLOCK
      ?AUTO_761 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_756 ?AUTO_757 ) ) ( ON-TABLE ?AUTO_756 ) ( not ( = ?AUTO_756 ?AUTO_762 ) ) ( not ( = ?AUTO_756 ?AUTO_763 ) ) ( not ( = ?AUTO_757 ?AUTO_762 ) ) ( not ( = ?AUTO_757 ?AUTO_763 ) ) ( not ( = ?AUTO_762 ?AUTO_763 ) ) ( ON ?AUTO_762 ?AUTO_756 ) ( not ( = ?AUTO_756 ?AUTO_758 ) ) ( not ( = ?AUTO_756 ?AUTO_759 ) ) ( not ( = ?AUTO_757 ?AUTO_758 ) ) ( not ( = ?AUTO_757 ?AUTO_759 ) ) ( not ( = ?AUTO_763 ?AUTO_758 ) ) ( not ( = ?AUTO_763 ?AUTO_759 ) ) ( not ( = ?AUTO_762 ?AUTO_758 ) ) ( not ( = ?AUTO_762 ?AUTO_759 ) ) ( not ( = ?AUTO_758 ?AUTO_759 ) ) ( ON ?AUTO_758 ?AUTO_762 ) ( CLEAR ?AUTO_760 ) ( not ( = ?AUTO_756 ?AUTO_760 ) ) ( not ( = ?AUTO_757 ?AUTO_760 ) ) ( not ( = ?AUTO_763 ?AUTO_760 ) ) ( not ( = ?AUTO_762 ?AUTO_760 ) ) ( not ( = ?AUTO_758 ?AUTO_760 ) ) ( not ( = ?AUTO_759 ?AUTO_760 ) ) ( ON ?AUTO_759 ?AUTO_758 ) ( not ( = ?AUTO_756 ?AUTO_761 ) ) ( not ( = ?AUTO_757 ?AUTO_761 ) ) ( not ( = ?AUTO_763 ?AUTO_761 ) ) ( not ( = ?AUTO_762 ?AUTO_761 ) ) ( not ( = ?AUTO_758 ?AUTO_761 ) ) ( not ( = ?AUTO_759 ?AUTO_761 ) ) ( not ( = ?AUTO_760 ?AUTO_761 ) ) ( ON ?AUTO_761 ?AUTO_759 ) ( CLEAR ?AUTO_761 ) ( ON ?AUTO_757 ?AUTO_763 ) ( CLEAR ?AUTO_757 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_757 ?AUTO_763 )
      ( MAKE-ON ?AUTO_756 ?AUTO_757 )
      ( MAKE-ON-VERIFY ?AUTO_756 ?AUTO_757 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1509 - BLOCK
    )
    :vars
    (
      ?AUTO_1511 - BLOCK
      ?AUTO_1510 - BLOCK
      ?AUTO_1512 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1509 ?AUTO_1511 ) ( not ( = ?AUTO_1509 ?AUTO_1511 ) ) ( not ( = ?AUTO_1509 ?AUTO_1510 ) ) ( not ( = ?AUTO_1511 ?AUTO_1510 ) ) ( ON ?AUTO_1510 ?AUTO_1509 ) ( not ( = ?AUTO_1509 ?AUTO_1512 ) ) ( not ( = ?AUTO_1511 ?AUTO_1512 ) ) ( not ( = ?AUTO_1510 ?AUTO_1512 ) ) ( ON ?AUTO_1512 ?AUTO_1510 ) ( CLEAR ?AUTO_1512 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1512 ?AUTO_1510 )
      ( MAKE-ON-TABLE ?AUTO_1509 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1509 ) )
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
    )
    :precondition
    ( and ( ON ?AUTO_3086 ?AUTO_3087 ) ( not ( = ?AUTO_3086 ?AUTO_3087 ) ) ( not ( = ?AUTO_3086 ?AUTO_3089 ) ) ( not ( = ?AUTO_3086 ?AUTO_3088 ) ) ( not ( = ?AUTO_3087 ?AUTO_3089 ) ) ( not ( = ?AUTO_3087 ?AUTO_3088 ) ) ( not ( = ?AUTO_3089 ?AUTO_3088 ) ) ( ON ?AUTO_3089 ?AUTO_3086 ) ( not ( = ?AUTO_3086 ?AUTO_3090 ) ) ( not ( = ?AUTO_3087 ?AUTO_3090 ) ) ( not ( = ?AUTO_3088 ?AUTO_3090 ) ) ( not ( = ?AUTO_3089 ?AUTO_3090 ) ) ( ON ?AUTO_3090 ?AUTO_3089 ) ( CLEAR ?AUTO_3090 ) ( HOLDING ?AUTO_3088 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3088 )
      ( MAKE-ON-TABLE ?AUTO_3086 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3086 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_824 - BLOCK
      ?AUTO_825 - BLOCK
    )
    :vars
    (
      ?AUTO_827 - BLOCK
      ?AUTO_826 - BLOCK
      ?AUTO_828 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_824 ?AUTO_825 ) ) ( ON ?AUTO_824 ?AUTO_827 ) ( not ( = ?AUTO_824 ?AUTO_827 ) ) ( not ( = ?AUTO_825 ?AUTO_827 ) ) ( not ( = ?AUTO_824 ?AUTO_826 ) ) ( not ( = ?AUTO_825 ?AUTO_826 ) ) ( not ( = ?AUTO_827 ?AUTO_826 ) ) ( ON ?AUTO_826 ?AUTO_824 ) ( CLEAR ?AUTO_826 ) ( HOLDING ?AUTO_825 ) ( CLEAR ?AUTO_828 ) ( not ( = ?AUTO_824 ?AUTO_828 ) ) ( not ( = ?AUTO_825 ?AUTO_828 ) ) ( not ( = ?AUTO_827 ?AUTO_828 ) ) ( not ( = ?AUTO_826 ?AUTO_828 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_825 ?AUTO_828 )
      ( MAKE-ON ?AUTO_824 ?AUTO_825 )
      ( MAKE-ON-VERIFY ?AUTO_824 ?AUTO_825 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_837 - BLOCK
      ?AUTO_838 - BLOCK
    )
    :vars
    (
      ?AUTO_839 - BLOCK
      ?AUTO_840 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_837 ?AUTO_838 ) ) ( not ( = ?AUTO_837 ?AUTO_839 ) ) ( not ( = ?AUTO_838 ?AUTO_839 ) ) ( not ( = ?AUTO_837 ?AUTO_840 ) ) ( not ( = ?AUTO_838 ?AUTO_840 ) ) ( not ( = ?AUTO_839 ?AUTO_840 ) ) ( ON ?AUTO_840 ?AUTO_838 ) ( CLEAR ?AUTO_840 ) ( HOLDING ?AUTO_837 ) ( CLEAR ?AUTO_839 ) )
    :subtasks
    ( ( !STACK ?AUTO_837 ?AUTO_839 )
      ( MAKE-ON ?AUTO_837 ?AUTO_838 )
      ( MAKE-ON-VERIFY ?AUTO_837 ?AUTO_838 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_841 - BLOCK
      ?AUTO_842 - BLOCK
    )
    :vars
    (
      ?AUTO_844 - BLOCK
      ?AUTO_843 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_841 ?AUTO_842 ) ) ( not ( = ?AUTO_841 ?AUTO_844 ) ) ( not ( = ?AUTO_842 ?AUTO_844 ) ) ( not ( = ?AUTO_841 ?AUTO_843 ) ) ( not ( = ?AUTO_842 ?AUTO_843 ) ) ( not ( = ?AUTO_844 ?AUTO_843 ) ) ( ON ?AUTO_843 ?AUTO_842 ) ( CLEAR ?AUTO_843 ) ( CLEAR ?AUTO_844 ) ( ON-TABLE ?AUTO_841 ) ( CLEAR ?AUTO_841 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_841 )
      ( MAKE-ON ?AUTO_841 ?AUTO_842 )
      ( MAKE-ON-VERIFY ?AUTO_841 ?AUTO_842 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_849 - BLOCK
      ?AUTO_850 - BLOCK
    )
    :vars
    (
      ?AUTO_852 - BLOCK
      ?AUTO_851 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_849 ?AUTO_850 ) ) ( not ( = ?AUTO_849 ?AUTO_852 ) ) ( not ( = ?AUTO_850 ?AUTO_852 ) ) ( not ( = ?AUTO_849 ?AUTO_851 ) ) ( not ( = ?AUTO_850 ?AUTO_851 ) ) ( not ( = ?AUTO_852 ?AUTO_851 ) ) ( ON ?AUTO_851 ?AUTO_850 ) ( ON-TABLE ?AUTO_849 ) ( CLEAR ?AUTO_849 ) ( ON ?AUTO_852 ?AUTO_851 ) ( CLEAR ?AUTO_852 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_852 ?AUTO_851 )
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
      ?AUTO_860 - BLOCK
      ?AUTO_862 - BLOCK
      ?AUTO_861 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_858 ?AUTO_859 ) ) ( not ( = ?AUTO_858 ?AUTO_860 ) ) ( not ( = ?AUTO_859 ?AUTO_860 ) ) ( not ( = ?AUTO_858 ?AUTO_862 ) ) ( not ( = ?AUTO_859 ?AUTO_862 ) ) ( not ( = ?AUTO_860 ?AUTO_862 ) ) ( ON ?AUTO_862 ?AUTO_859 ) ( ON-TABLE ?AUTO_858 ) ( CLEAR ?AUTO_858 ) ( ON ?AUTO_860 ?AUTO_862 ) ( not ( = ?AUTO_858 ?AUTO_861 ) ) ( not ( = ?AUTO_859 ?AUTO_861 ) ) ( not ( = ?AUTO_860 ?AUTO_861 ) ) ( not ( = ?AUTO_862 ?AUTO_861 ) ) ( ON ?AUTO_861 ?AUTO_860 ) ( CLEAR ?AUTO_861 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_861 ?AUTO_860 )
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
    ( and ( not ( = ?AUTO_863 ?AUTO_864 ) ) ( not ( = ?AUTO_863 ?AUTO_865 ) ) ( not ( = ?AUTO_864 ?AUTO_865 ) ) ( not ( = ?AUTO_863 ?AUTO_866 ) ) ( not ( = ?AUTO_864 ?AUTO_866 ) ) ( not ( = ?AUTO_865 ?AUTO_866 ) ) ( ON ?AUTO_866 ?AUTO_864 ) ( ON-TABLE ?AUTO_863 ) ( CLEAR ?AUTO_863 ) ( ON ?AUTO_865 ?AUTO_866 ) ( not ( = ?AUTO_863 ?AUTO_867 ) ) ( not ( = ?AUTO_864 ?AUTO_867 ) ) ( not ( = ?AUTO_865 ?AUTO_867 ) ) ( not ( = ?AUTO_866 ?AUTO_867 ) ) ( ON ?AUTO_867 ?AUTO_865 ) ( CLEAR ?AUTO_867 ) ( HOLDING ?AUTO_868 ) ( not ( = ?AUTO_863 ?AUTO_868 ) ) ( not ( = ?AUTO_864 ?AUTO_868 ) ) ( not ( = ?AUTO_865 ?AUTO_868 ) ) ( not ( = ?AUTO_866 ?AUTO_868 ) ) ( not ( = ?AUTO_867 ?AUTO_868 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_868 )
      ( MAKE-ON ?AUTO_863 ?AUTO_864 )
      ( MAKE-ON-VERIFY ?AUTO_863 ?AUTO_864 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1183 - BLOCK
      ?AUTO_1184 - BLOCK
    )
    :vars
    (
      ?AUTO_1186 - BLOCK
      ?AUTO_1185 - BLOCK
      ?AUTO_1187 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1183 ?AUTO_1184 ) ) ( ON-TABLE ?AUTO_1183 ) ( not ( = ?AUTO_1183 ?AUTO_1186 ) ) ( not ( = ?AUTO_1184 ?AUTO_1186 ) ) ( ON ?AUTO_1186 ?AUTO_1183 ) ( not ( = ?AUTO_1183 ?AUTO_1185 ) ) ( not ( = ?AUTO_1184 ?AUTO_1185 ) ) ( not ( = ?AUTO_1186 ?AUTO_1185 ) ) ( ON ?AUTO_1185 ?AUTO_1186 ) ( CLEAR ?AUTO_1185 ) ( HOLDING ?AUTO_1184 ) ( CLEAR ?AUTO_1187 ) ( not ( = ?AUTO_1183 ?AUTO_1187 ) ) ( not ( = ?AUTO_1184 ?AUTO_1187 ) ) ( not ( = ?AUTO_1186 ?AUTO_1187 ) ) ( not ( = ?AUTO_1185 ?AUTO_1187 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1184 ?AUTO_1187 )
      ( MAKE-ON ?AUTO_1183 ?AUTO_1184 )
      ( MAKE-ON-VERIFY ?AUTO_1183 ?AUTO_1184 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3022 - BLOCK
      ?AUTO_3023 - BLOCK
    )
    :vars
    (
      ?AUTO_3025 - BLOCK
      ?AUTO_3026 - BLOCK
      ?AUTO_3024 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3022 ?AUTO_3023 ) ) ( ON-TABLE ?AUTO_3022 ) ( not ( = ?AUTO_3022 ?AUTO_3025 ) ) ( not ( = ?AUTO_3023 ?AUTO_3025 ) ) ( ON ?AUTO_3025 ?AUTO_3022 ) ( not ( = ?AUTO_3022 ?AUTO_3026 ) ) ( not ( = ?AUTO_3022 ?AUTO_3024 ) ) ( not ( = ?AUTO_3023 ?AUTO_3026 ) ) ( not ( = ?AUTO_3023 ?AUTO_3024 ) ) ( not ( = ?AUTO_3025 ?AUTO_3026 ) ) ( not ( = ?AUTO_3025 ?AUTO_3024 ) ) ( not ( = ?AUTO_3026 ?AUTO_3024 ) ) ( ON ?AUTO_3026 ?AUTO_3025 ) ( CLEAR ?AUTO_3026 ) ( ON ?AUTO_3024 ?AUTO_3023 ) ( CLEAR ?AUTO_3024 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3024 ?AUTO_3023 )
      ( MAKE-ON ?AUTO_3022 ?AUTO_3023 )
      ( MAKE-ON-VERIFY ?AUTO_3022 ?AUTO_3023 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_917 - BLOCK
      ?AUTO_918 - BLOCK
    )
    :vars
    (
      ?AUTO_920 - BLOCK
      ?AUTO_919 - BLOCK
      ?AUTO_922 - BLOCK
      ?AUTO_923 - BLOCK
      ?AUTO_921 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_917 ?AUTO_918 ) ) ( ON-TABLE ?AUTO_917 ) ( CLEAR ?AUTO_920 ) ( not ( = ?AUTO_917 ?AUTO_919 ) ) ( not ( = ?AUTO_917 ?AUTO_920 ) ) ( not ( = ?AUTO_918 ?AUTO_919 ) ) ( not ( = ?AUTO_918 ?AUTO_920 ) ) ( not ( = ?AUTO_919 ?AUTO_920 ) ) ( ON ?AUTO_919 ?AUTO_917 ) ( not ( = ?AUTO_917 ?AUTO_922 ) ) ( not ( = ?AUTO_918 ?AUTO_922 ) ) ( not ( = ?AUTO_920 ?AUTO_922 ) ) ( not ( = ?AUTO_919 ?AUTO_922 ) ) ( CLEAR ?AUTO_923 ) ( not ( = ?AUTO_917 ?AUTO_921 ) ) ( not ( = ?AUTO_917 ?AUTO_923 ) ) ( not ( = ?AUTO_918 ?AUTO_921 ) ) ( not ( = ?AUTO_918 ?AUTO_923 ) ) ( not ( = ?AUTO_920 ?AUTO_921 ) ) ( not ( = ?AUTO_920 ?AUTO_923 ) ) ( not ( = ?AUTO_919 ?AUTO_921 ) ) ( not ( = ?AUTO_919 ?AUTO_923 ) ) ( not ( = ?AUTO_922 ?AUTO_921 ) ) ( not ( = ?AUTO_922 ?AUTO_923 ) ) ( not ( = ?AUTO_921 ?AUTO_923 ) ) ( ON ?AUTO_921 ?AUTO_918 ) ( CLEAR ?AUTO_921 ) ( HOLDING ?AUTO_922 ) ( CLEAR ?AUTO_919 ) )
    :subtasks
    ( ( !STACK ?AUTO_922 ?AUTO_919 )
      ( MAKE-ON ?AUTO_917 ?AUTO_918 )
      ( MAKE-ON-VERIFY ?AUTO_917 ?AUTO_918 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2011 - BLOCK
      ?AUTO_2012 - BLOCK
    )
    :vars
    (
      ?AUTO_2014 - BLOCK
      ?AUTO_2015 - BLOCK
      ?AUTO_2013 - BLOCK
      ?AUTO_2016 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2011 ?AUTO_2012 ) ) ( ON-TABLE ?AUTO_2011 ) ( not ( = ?AUTO_2011 ?AUTO_2014 ) ) ( not ( = ?AUTO_2011 ?AUTO_2015 ) ) ( not ( = ?AUTO_2012 ?AUTO_2014 ) ) ( not ( = ?AUTO_2012 ?AUTO_2015 ) ) ( not ( = ?AUTO_2014 ?AUTO_2015 ) ) ( CLEAR ?AUTO_2013 ) ( not ( = ?AUTO_2011 ?AUTO_2013 ) ) ( not ( = ?AUTO_2012 ?AUTO_2013 ) ) ( not ( = ?AUTO_2014 ?AUTO_2013 ) ) ( not ( = ?AUTO_2015 ?AUTO_2013 ) ) ( ON ?AUTO_2015 ?AUTO_2012 ) ( not ( = ?AUTO_2011 ?AUTO_2016 ) ) ( not ( = ?AUTO_2012 ?AUTO_2016 ) ) ( not ( = ?AUTO_2014 ?AUTO_2016 ) ) ( not ( = ?AUTO_2015 ?AUTO_2016 ) ) ( not ( = ?AUTO_2013 ?AUTO_2016 ) ) ( ON ?AUTO_2016 ?AUTO_2015 ) ( CLEAR ?AUTO_2016 ) ( HOLDING ?AUTO_2014 ) ( CLEAR ?AUTO_2011 ) )
    :subtasks
    ( ( !STACK ?AUTO_2014 ?AUTO_2011 )
      ( MAKE-ON ?AUTO_2011 ?AUTO_2012 )
      ( MAKE-ON-VERIFY ?AUTO_2011 ?AUTO_2012 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_938 - BLOCK
      ?AUTO_939 - BLOCK
    )
    :vars
    (
      ?AUTO_941 - BLOCK
      ?AUTO_940 - BLOCK
      ?AUTO_943 - BLOCK
      ?AUTO_942 - BLOCK
      ?AUTO_944 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_938 ?AUTO_939 ) ) ( ON-TABLE ?AUTO_938 ) ( CLEAR ?AUTO_941 ) ( not ( = ?AUTO_938 ?AUTO_940 ) ) ( not ( = ?AUTO_938 ?AUTO_941 ) ) ( not ( = ?AUTO_939 ?AUTO_940 ) ) ( not ( = ?AUTO_939 ?AUTO_941 ) ) ( not ( = ?AUTO_940 ?AUTO_941 ) ) ( not ( = ?AUTO_938 ?AUTO_943 ) ) ( not ( = ?AUTO_939 ?AUTO_943 ) ) ( not ( = ?AUTO_941 ?AUTO_943 ) ) ( not ( = ?AUTO_940 ?AUTO_943 ) ) ( CLEAR ?AUTO_942 ) ( not ( = ?AUTO_938 ?AUTO_944 ) ) ( not ( = ?AUTO_938 ?AUTO_942 ) ) ( not ( = ?AUTO_939 ?AUTO_944 ) ) ( not ( = ?AUTO_939 ?AUTO_942 ) ) ( not ( = ?AUTO_941 ?AUTO_944 ) ) ( not ( = ?AUTO_941 ?AUTO_942 ) ) ( not ( = ?AUTO_940 ?AUTO_944 ) ) ( not ( = ?AUTO_940 ?AUTO_942 ) ) ( not ( = ?AUTO_943 ?AUTO_944 ) ) ( not ( = ?AUTO_943 ?AUTO_942 ) ) ( not ( = ?AUTO_944 ?AUTO_942 ) ) ( ON ?AUTO_944 ?AUTO_939 ) ( ON ?AUTO_943 ?AUTO_944 ) ( CLEAR ?AUTO_943 ) ( CLEAR ?AUTO_938 ) ( ON-TABLE ?AUTO_940 ) ( CLEAR ?AUTO_940 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_940 )
      ( MAKE-ON ?AUTO_938 ?AUTO_939 )
      ( MAKE-ON-VERIFY ?AUTO_938 ?AUTO_939 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1569 - BLOCK
      ?AUTO_1570 - BLOCK
    )
    :vars
    (
      ?AUTO_1571 - BLOCK
      ?AUTO_1572 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1569 ?AUTO_1570 ) ) ( not ( = ?AUTO_1569 ?AUTO_1571 ) ) ( not ( = ?AUTO_1570 ?AUTO_1571 ) ) ( ON ?AUTO_1571 ?AUTO_1570 ) ( not ( = ?AUTO_1569 ?AUTO_1572 ) ) ( not ( = ?AUTO_1570 ?AUTO_1572 ) ) ( not ( = ?AUTO_1571 ?AUTO_1572 ) ) ( ON ?AUTO_1572 ?AUTO_1571 ) ( CLEAR ?AUTO_1572 ) ( HOLDING ?AUTO_1569 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1569 )
      ( MAKE-ON ?AUTO_1569 ?AUTO_1570 )
      ( MAKE-ON-VERIFY ?AUTO_1569 ?AUTO_1570 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1573 - BLOCK
      ?AUTO_1574 - BLOCK
    )
    :vars
    (
      ?AUTO_1575 - BLOCK
      ?AUTO_1576 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1573 ?AUTO_1574 ) ) ( not ( = ?AUTO_1573 ?AUTO_1575 ) ) ( not ( = ?AUTO_1574 ?AUTO_1575 ) ) ( ON ?AUTO_1575 ?AUTO_1574 ) ( not ( = ?AUTO_1573 ?AUTO_1576 ) ) ( not ( = ?AUTO_1574 ?AUTO_1576 ) ) ( not ( = ?AUTO_1575 ?AUTO_1576 ) ) ( ON ?AUTO_1576 ?AUTO_1575 ) ( ON ?AUTO_1573 ?AUTO_1576 ) ( CLEAR ?AUTO_1573 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1573 ?AUTO_1576 )
      ( MAKE-ON ?AUTO_1573 ?AUTO_1574 )
      ( MAKE-ON-VERIFY ?AUTO_1573 ?AUTO_1574 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_959 - BLOCK
      ?AUTO_960 - BLOCK
    )
    :vars
    (
      ?AUTO_964 - BLOCK
      ?AUTO_962 - BLOCK
      ?AUTO_965 - BLOCK
      ?AUTO_961 - BLOCK
      ?AUTO_963 - BLOCK
      ?AUTO_966 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_959 ?AUTO_960 ) ) ( CLEAR ?AUTO_964 ) ( not ( = ?AUTO_959 ?AUTO_962 ) ) ( not ( = ?AUTO_959 ?AUTO_964 ) ) ( not ( = ?AUTO_960 ?AUTO_962 ) ) ( not ( = ?AUTO_960 ?AUTO_964 ) ) ( not ( = ?AUTO_962 ?AUTO_964 ) ) ( not ( = ?AUTO_959 ?AUTO_965 ) ) ( not ( = ?AUTO_960 ?AUTO_965 ) ) ( not ( = ?AUTO_964 ?AUTO_965 ) ) ( not ( = ?AUTO_962 ?AUTO_965 ) ) ( CLEAR ?AUTO_961 ) ( not ( = ?AUTO_959 ?AUTO_963 ) ) ( not ( = ?AUTO_959 ?AUTO_961 ) ) ( not ( = ?AUTO_960 ?AUTO_963 ) ) ( not ( = ?AUTO_960 ?AUTO_961 ) ) ( not ( = ?AUTO_964 ?AUTO_963 ) ) ( not ( = ?AUTO_964 ?AUTO_961 ) ) ( not ( = ?AUTO_962 ?AUTO_963 ) ) ( not ( = ?AUTO_962 ?AUTO_961 ) ) ( not ( = ?AUTO_965 ?AUTO_963 ) ) ( not ( = ?AUTO_965 ?AUTO_961 ) ) ( not ( = ?AUTO_963 ?AUTO_961 ) ) ( ON ?AUTO_963 ?AUTO_960 ) ( ON ?AUTO_965 ?AUTO_963 ) ( ON-TABLE ?AUTO_962 ) ( CLEAR ?AUTO_962 ) ( ON ?AUTO_959 ?AUTO_965 ) ( CLEAR ?AUTO_959 ) ( HOLDING ?AUTO_966 ) ( not ( = ?AUTO_959 ?AUTO_966 ) ) ( not ( = ?AUTO_960 ?AUTO_966 ) ) ( not ( = ?AUTO_964 ?AUTO_966 ) ) ( not ( = ?AUTO_962 ?AUTO_966 ) ) ( not ( = ?AUTO_965 ?AUTO_966 ) ) ( not ( = ?AUTO_961 ?AUTO_966 ) ) ( not ( = ?AUTO_963 ?AUTO_966 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_966 )
      ( MAKE-ON ?AUTO_959 ?AUTO_960 )
      ( MAKE-ON-VERIFY ?AUTO_959 ?AUTO_960 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_967 - BLOCK
      ?AUTO_968 - BLOCK
    )
    :vars
    (
      ?AUTO_972 - BLOCK
      ?AUTO_969 - BLOCK
      ?AUTO_973 - BLOCK
      ?AUTO_970 - BLOCK
      ?AUTO_974 - BLOCK
      ?AUTO_971 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_967 ?AUTO_968 ) ) ( CLEAR ?AUTO_972 ) ( not ( = ?AUTO_967 ?AUTO_969 ) ) ( not ( = ?AUTO_967 ?AUTO_972 ) ) ( not ( = ?AUTO_968 ?AUTO_969 ) ) ( not ( = ?AUTO_968 ?AUTO_972 ) ) ( not ( = ?AUTO_969 ?AUTO_972 ) ) ( not ( = ?AUTO_967 ?AUTO_973 ) ) ( not ( = ?AUTO_968 ?AUTO_973 ) ) ( not ( = ?AUTO_972 ?AUTO_973 ) ) ( not ( = ?AUTO_969 ?AUTO_973 ) ) ( CLEAR ?AUTO_970 ) ( not ( = ?AUTO_967 ?AUTO_974 ) ) ( not ( = ?AUTO_967 ?AUTO_970 ) ) ( not ( = ?AUTO_968 ?AUTO_974 ) ) ( not ( = ?AUTO_968 ?AUTO_970 ) ) ( not ( = ?AUTO_972 ?AUTO_974 ) ) ( not ( = ?AUTO_972 ?AUTO_970 ) ) ( not ( = ?AUTO_969 ?AUTO_974 ) ) ( not ( = ?AUTO_969 ?AUTO_970 ) ) ( not ( = ?AUTO_973 ?AUTO_974 ) ) ( not ( = ?AUTO_973 ?AUTO_970 ) ) ( not ( = ?AUTO_974 ?AUTO_970 ) ) ( ON ?AUTO_974 ?AUTO_968 ) ( ON ?AUTO_973 ?AUTO_974 ) ( ON-TABLE ?AUTO_969 ) ( CLEAR ?AUTO_969 ) ( ON ?AUTO_967 ?AUTO_973 ) ( not ( = ?AUTO_967 ?AUTO_971 ) ) ( not ( = ?AUTO_968 ?AUTO_971 ) ) ( not ( = ?AUTO_972 ?AUTO_971 ) ) ( not ( = ?AUTO_969 ?AUTO_971 ) ) ( not ( = ?AUTO_973 ?AUTO_971 ) ) ( not ( = ?AUTO_970 ?AUTO_971 ) ) ( not ( = ?AUTO_974 ?AUTO_971 ) ) ( ON ?AUTO_971 ?AUTO_967 ) ( CLEAR ?AUTO_971 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_971 ?AUTO_967 )
      ( MAKE-ON ?AUTO_967 ?AUTO_968 )
      ( MAKE-ON-VERIFY ?AUTO_967 ?AUTO_968 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_975 - BLOCK
      ?AUTO_976 - BLOCK
    )
    :vars
    (
      ?AUTO_977 - BLOCK
      ?AUTO_979 - BLOCK
      ?AUTO_982 - BLOCK
      ?AUTO_978 - BLOCK
      ?AUTO_981 - BLOCK
      ?AUTO_980 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_975 ?AUTO_976 ) ) ( not ( = ?AUTO_975 ?AUTO_977 ) ) ( not ( = ?AUTO_975 ?AUTO_979 ) ) ( not ( = ?AUTO_976 ?AUTO_977 ) ) ( not ( = ?AUTO_976 ?AUTO_979 ) ) ( not ( = ?AUTO_977 ?AUTO_979 ) ) ( not ( = ?AUTO_975 ?AUTO_982 ) ) ( not ( = ?AUTO_976 ?AUTO_982 ) ) ( not ( = ?AUTO_979 ?AUTO_982 ) ) ( not ( = ?AUTO_977 ?AUTO_982 ) ) ( CLEAR ?AUTO_978 ) ( not ( = ?AUTO_975 ?AUTO_981 ) ) ( not ( = ?AUTO_975 ?AUTO_978 ) ) ( not ( = ?AUTO_976 ?AUTO_981 ) ) ( not ( = ?AUTO_976 ?AUTO_978 ) ) ( not ( = ?AUTO_979 ?AUTO_981 ) ) ( not ( = ?AUTO_979 ?AUTO_978 ) ) ( not ( = ?AUTO_977 ?AUTO_981 ) ) ( not ( = ?AUTO_977 ?AUTO_978 ) ) ( not ( = ?AUTO_982 ?AUTO_981 ) ) ( not ( = ?AUTO_982 ?AUTO_978 ) ) ( not ( = ?AUTO_981 ?AUTO_978 ) ) ( ON ?AUTO_981 ?AUTO_976 ) ( ON ?AUTO_982 ?AUTO_981 ) ( ON-TABLE ?AUTO_977 ) ( CLEAR ?AUTO_977 ) ( ON ?AUTO_975 ?AUTO_982 ) ( not ( = ?AUTO_975 ?AUTO_980 ) ) ( not ( = ?AUTO_976 ?AUTO_980 ) ) ( not ( = ?AUTO_979 ?AUTO_980 ) ) ( not ( = ?AUTO_977 ?AUTO_980 ) ) ( not ( = ?AUTO_982 ?AUTO_980 ) ) ( not ( = ?AUTO_978 ?AUTO_980 ) ) ( not ( = ?AUTO_981 ?AUTO_980 ) ) ( ON ?AUTO_980 ?AUTO_975 ) ( CLEAR ?AUTO_980 ) ( HOLDING ?AUTO_979 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_979 )
      ( MAKE-ON ?AUTO_975 ?AUTO_976 )
      ( MAKE-ON-VERIFY ?AUTO_975 ?AUTO_976 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_983 - BLOCK
      ?AUTO_984 - BLOCK
    )
    :vars
    (
      ?AUTO_986 - BLOCK
      ?AUTO_989 - BLOCK
      ?AUTO_987 - BLOCK
      ?AUTO_990 - BLOCK
      ?AUTO_985 - BLOCK
      ?AUTO_988 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_983 ?AUTO_984 ) ) ( not ( = ?AUTO_983 ?AUTO_986 ) ) ( not ( = ?AUTO_983 ?AUTO_989 ) ) ( not ( = ?AUTO_984 ?AUTO_986 ) ) ( not ( = ?AUTO_984 ?AUTO_989 ) ) ( not ( = ?AUTO_986 ?AUTO_989 ) ) ( not ( = ?AUTO_983 ?AUTO_987 ) ) ( not ( = ?AUTO_984 ?AUTO_987 ) ) ( not ( = ?AUTO_989 ?AUTO_987 ) ) ( not ( = ?AUTO_986 ?AUTO_987 ) ) ( not ( = ?AUTO_983 ?AUTO_990 ) ) ( not ( = ?AUTO_983 ?AUTO_985 ) ) ( not ( = ?AUTO_984 ?AUTO_990 ) ) ( not ( = ?AUTO_984 ?AUTO_985 ) ) ( not ( = ?AUTO_989 ?AUTO_990 ) ) ( not ( = ?AUTO_989 ?AUTO_985 ) ) ( not ( = ?AUTO_986 ?AUTO_990 ) ) ( not ( = ?AUTO_986 ?AUTO_985 ) ) ( not ( = ?AUTO_987 ?AUTO_990 ) ) ( not ( = ?AUTO_987 ?AUTO_985 ) ) ( not ( = ?AUTO_990 ?AUTO_985 ) ) ( ON ?AUTO_990 ?AUTO_984 ) ( ON ?AUTO_987 ?AUTO_990 ) ( ON-TABLE ?AUTO_986 ) ( CLEAR ?AUTO_986 ) ( ON ?AUTO_983 ?AUTO_987 ) ( not ( = ?AUTO_983 ?AUTO_988 ) ) ( not ( = ?AUTO_984 ?AUTO_988 ) ) ( not ( = ?AUTO_989 ?AUTO_988 ) ) ( not ( = ?AUTO_986 ?AUTO_988 ) ) ( not ( = ?AUTO_987 ?AUTO_988 ) ) ( not ( = ?AUTO_985 ?AUTO_988 ) ) ( not ( = ?AUTO_990 ?AUTO_988 ) ) ( ON ?AUTO_988 ?AUTO_983 ) ( CLEAR ?AUTO_988 ) ( ON ?AUTO_989 ?AUTO_985 ) ( CLEAR ?AUTO_989 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_989 ?AUTO_985 )
      ( MAKE-ON ?AUTO_983 ?AUTO_984 )
      ( MAKE-ON-VERIFY ?AUTO_983 ?AUTO_984 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1010 - BLOCK
      ?AUTO_1011 - BLOCK
    )
    :vars
    (
      ?AUTO_1012 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1010 ?AUTO_1011 ) ) ( ON ?AUTO_1010 ?AUTO_1012 ) ( CLEAR ?AUTO_1010 ) ( not ( = ?AUTO_1010 ?AUTO_1012 ) ) ( not ( = ?AUTO_1011 ?AUTO_1012 ) ) ( HOLDING ?AUTO_1011 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1011 )
      ( MAKE-ON ?AUTO_1010 ?AUTO_1011 )
      ( MAKE-ON-VERIFY ?AUTO_1010 ?AUTO_1011 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1013 - BLOCK
      ?AUTO_1014 - BLOCK
    )
    :vars
    (
      ?AUTO_1015 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1013 ?AUTO_1014 ) ) ( ON ?AUTO_1013 ?AUTO_1015 ) ( not ( = ?AUTO_1013 ?AUTO_1015 ) ) ( not ( = ?AUTO_1014 ?AUTO_1015 ) ) ( ON ?AUTO_1014 ?AUTO_1013 ) ( CLEAR ?AUTO_1014 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1014 ?AUTO_1013 )
      ( MAKE-ON ?AUTO_1013 ?AUTO_1014 )
      ( MAKE-ON-VERIFY ?AUTO_1013 ?AUTO_1014 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1016 - BLOCK
      ?AUTO_1017 - BLOCK
    )
    :vars
    (
      ?AUTO_1018 - BLOCK
      ?AUTO_1019 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1016 ?AUTO_1017 ) ) ( ON ?AUTO_1016 ?AUTO_1018 ) ( not ( = ?AUTO_1016 ?AUTO_1018 ) ) ( not ( = ?AUTO_1017 ?AUTO_1018 ) ) ( ON ?AUTO_1017 ?AUTO_1016 ) ( CLEAR ?AUTO_1017 ) ( HOLDING ?AUTO_1019 ) ( not ( = ?AUTO_1016 ?AUTO_1019 ) ) ( not ( = ?AUTO_1017 ?AUTO_1019 ) ) ( not ( = ?AUTO_1018 ?AUTO_1019 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1019 )
      ( MAKE-ON ?AUTO_1016 ?AUTO_1017 )
      ( MAKE-ON-VERIFY ?AUTO_1016 ?AUTO_1017 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1048 - BLOCK
      ?AUTO_1049 - BLOCK
    )
    :vars
    (
      ?AUTO_1051 - BLOCK
      ?AUTO_1050 - BLOCK
      ?AUTO_1052 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1048 ?AUTO_1049 ) ) ( ON ?AUTO_1048 ?AUTO_1051 ) ( not ( = ?AUTO_1048 ?AUTO_1051 ) ) ( not ( = ?AUTO_1049 ?AUTO_1051 ) ) ( not ( = ?AUTO_1048 ?AUTO_1050 ) ) ( not ( = ?AUTO_1049 ?AUTO_1050 ) ) ( not ( = ?AUTO_1051 ?AUTO_1050 ) ) ( ON ?AUTO_1050 ?AUTO_1049 ) ( CLEAR ?AUTO_1050 ) ( not ( = ?AUTO_1048 ?AUTO_1052 ) ) ( not ( = ?AUTO_1049 ?AUTO_1052 ) ) ( not ( = ?AUTO_1051 ?AUTO_1052 ) ) ( not ( = ?AUTO_1050 ?AUTO_1052 ) ) ( ON ?AUTO_1052 ?AUTO_1048 ) ( CLEAR ?AUTO_1052 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1052 ?AUTO_1048 )
      ( MAKE-ON ?AUTO_1048 ?AUTO_1049 )
      ( MAKE-ON-VERIFY ?AUTO_1048 ?AUTO_1049 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1078 - BLOCK
      ?AUTO_1079 - BLOCK
    )
    :vars
    (
      ?AUTO_1080 - BLOCK
      ?AUTO_1081 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1078 ?AUTO_1079 ) ) ( ON-TABLE ?AUTO_1078 ) ( CLEAR ?AUTO_1080 ) ( not ( = ?AUTO_1078 ?AUTO_1081 ) ) ( not ( = ?AUTO_1078 ?AUTO_1080 ) ) ( not ( = ?AUTO_1079 ?AUTO_1081 ) ) ( not ( = ?AUTO_1079 ?AUTO_1080 ) ) ( not ( = ?AUTO_1081 ?AUTO_1080 ) ) ( ON ?AUTO_1081 ?AUTO_1078 ) ( CLEAR ?AUTO_1081 ) ( HOLDING ?AUTO_1079 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1079 )
      ( MAKE-ON ?AUTO_1078 ?AUTO_1079 )
      ( MAKE-ON-VERIFY ?AUTO_1078 ?AUTO_1079 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1082 - BLOCK
      ?AUTO_1083 - BLOCK
    )
    :vars
    (
      ?AUTO_1085 - BLOCK
      ?AUTO_1084 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1082 ?AUTO_1083 ) ) ( ON-TABLE ?AUTO_1082 ) ( CLEAR ?AUTO_1085 ) ( not ( = ?AUTO_1082 ?AUTO_1084 ) ) ( not ( = ?AUTO_1082 ?AUTO_1085 ) ) ( not ( = ?AUTO_1083 ?AUTO_1084 ) ) ( not ( = ?AUTO_1083 ?AUTO_1085 ) ) ( not ( = ?AUTO_1084 ?AUTO_1085 ) ) ( ON ?AUTO_1084 ?AUTO_1082 ) ( ON ?AUTO_1083 ?AUTO_1084 ) ( CLEAR ?AUTO_1083 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1083 ?AUTO_1084 )
      ( MAKE-ON ?AUTO_1082 ?AUTO_1083 )
      ( MAKE-ON-VERIFY ?AUTO_1082 ?AUTO_1083 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1129 - BLOCK
    )
    :vars
    (
      ?AUTO_1130 - BLOCK
      ?AUTO_1131 - BLOCK
      ?AUTO_1132 - BLOCK
      ?AUTO_1133 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1129 ?AUTO_1130 ) ( not ( = ?AUTO_1129 ?AUTO_1130 ) ) ( not ( = ?AUTO_1129 ?AUTO_1131 ) ) ( not ( = ?AUTO_1130 ?AUTO_1131 ) ) ( ON ?AUTO_1131 ?AUTO_1129 ) ( CLEAR ?AUTO_1131 ) ( HOLDING ?AUTO_1132 ) ( CLEAR ?AUTO_1133 ) ( not ( = ?AUTO_1129 ?AUTO_1132 ) ) ( not ( = ?AUTO_1129 ?AUTO_1133 ) ) ( not ( = ?AUTO_1130 ?AUTO_1132 ) ) ( not ( = ?AUTO_1130 ?AUTO_1133 ) ) ( not ( = ?AUTO_1131 ?AUTO_1132 ) ) ( not ( = ?AUTO_1131 ?AUTO_1133 ) ) ( not ( = ?AUTO_1132 ?AUTO_1133 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1132 ?AUTO_1133 )
      ( MAKE-ON-TABLE ?AUTO_1129 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1129 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3091 - BLOCK
    )
    :vars
    (
      ?AUTO_3092 - BLOCK
      ?AUTO_3095 - BLOCK
      ?AUTO_3094 - BLOCK
      ?AUTO_3093 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3091 ?AUTO_3092 ) ( not ( = ?AUTO_3091 ?AUTO_3092 ) ) ( not ( = ?AUTO_3091 ?AUTO_3095 ) ) ( not ( = ?AUTO_3091 ?AUTO_3094 ) ) ( not ( = ?AUTO_3092 ?AUTO_3095 ) ) ( not ( = ?AUTO_3092 ?AUTO_3094 ) ) ( not ( = ?AUTO_3095 ?AUTO_3094 ) ) ( ON ?AUTO_3095 ?AUTO_3091 ) ( not ( = ?AUTO_3091 ?AUTO_3093 ) ) ( not ( = ?AUTO_3092 ?AUTO_3093 ) ) ( not ( = ?AUTO_3094 ?AUTO_3093 ) ) ( not ( = ?AUTO_3095 ?AUTO_3093 ) ) ( ON ?AUTO_3093 ?AUTO_3095 ) ( ON ?AUTO_3094 ?AUTO_3093 ) ( CLEAR ?AUTO_3094 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3094 ?AUTO_3093 )
      ( MAKE-ON-TABLE ?AUTO_3091 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3091 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1155 - BLOCK
    )
    :vars
    (
      ?AUTO_1156 - BLOCK
      ?AUTO_1160 - BLOCK
      ?AUTO_1157 - BLOCK
      ?AUTO_1159 - BLOCK
      ?AUTO_1158 - BLOCK
      ?AUTO_1161 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1155 ?AUTO_1156 ) ( not ( = ?AUTO_1155 ?AUTO_1156 ) ) ( not ( = ?AUTO_1155 ?AUTO_1160 ) ) ( not ( = ?AUTO_1156 ?AUTO_1160 ) ) ( ON ?AUTO_1160 ?AUTO_1155 ) ( CLEAR ?AUTO_1157 ) ( not ( = ?AUTO_1155 ?AUTO_1159 ) ) ( not ( = ?AUTO_1155 ?AUTO_1157 ) ) ( not ( = ?AUTO_1156 ?AUTO_1159 ) ) ( not ( = ?AUTO_1156 ?AUTO_1157 ) ) ( not ( = ?AUTO_1160 ?AUTO_1159 ) ) ( not ( = ?AUTO_1160 ?AUTO_1157 ) ) ( not ( = ?AUTO_1159 ?AUTO_1157 ) ) ( ON ?AUTO_1159 ?AUTO_1160 ) ( not ( = ?AUTO_1155 ?AUTO_1158 ) ) ( not ( = ?AUTO_1156 ?AUTO_1158 ) ) ( not ( = ?AUTO_1160 ?AUTO_1158 ) ) ( not ( = ?AUTO_1157 ?AUTO_1158 ) ) ( not ( = ?AUTO_1159 ?AUTO_1158 ) ) ( ON ?AUTO_1158 ?AUTO_1159 ) ( CLEAR ?AUTO_1158 ) ( HOLDING ?AUTO_1161 ) ( not ( = ?AUTO_1155 ?AUTO_1161 ) ) ( not ( = ?AUTO_1156 ?AUTO_1161 ) ) ( not ( = ?AUTO_1160 ?AUTO_1161 ) ) ( not ( = ?AUTO_1157 ?AUTO_1161 ) ) ( not ( = ?AUTO_1159 ?AUTO_1161 ) ) ( not ( = ?AUTO_1158 ?AUTO_1161 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1161 )
      ( MAKE-ON-TABLE ?AUTO_1155 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1155 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1202 - BLOCK
      ?AUTO_1203 - BLOCK
    )
    :vars
    (
      ?AUTO_1204 - BLOCK
      ?AUTO_1205 - BLOCK
      ?AUTO_1206 - BLOCK
      ?AUTO_1207 - BLOCK
      ?AUTO_1208 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1202 ?AUTO_1203 ) ) ( ON-TABLE ?AUTO_1202 ) ( not ( = ?AUTO_1202 ?AUTO_1204 ) ) ( not ( = ?AUTO_1203 ?AUTO_1204 ) ) ( ON ?AUTO_1204 ?AUTO_1202 ) ( not ( = ?AUTO_1202 ?AUTO_1205 ) ) ( not ( = ?AUTO_1203 ?AUTO_1205 ) ) ( not ( = ?AUTO_1204 ?AUTO_1205 ) ) ( ON ?AUTO_1205 ?AUTO_1204 ) ( CLEAR ?AUTO_1205 ) ( not ( = ?AUTO_1202 ?AUTO_1206 ) ) ( not ( = ?AUTO_1202 ?AUTO_1207 ) ) ( not ( = ?AUTO_1203 ?AUTO_1206 ) ) ( not ( = ?AUTO_1203 ?AUTO_1207 ) ) ( not ( = ?AUTO_1204 ?AUTO_1206 ) ) ( not ( = ?AUTO_1204 ?AUTO_1207 ) ) ( not ( = ?AUTO_1205 ?AUTO_1206 ) ) ( not ( = ?AUTO_1205 ?AUTO_1207 ) ) ( not ( = ?AUTO_1206 ?AUTO_1207 ) ) ( ON ?AUTO_1206 ?AUTO_1203 ) ( CLEAR ?AUTO_1206 ) ( HOLDING ?AUTO_1207 ) ( CLEAR ?AUTO_1208 ) ( not ( = ?AUTO_1202 ?AUTO_1208 ) ) ( not ( = ?AUTO_1203 ?AUTO_1208 ) ) ( not ( = ?AUTO_1204 ?AUTO_1208 ) ) ( not ( = ?AUTO_1205 ?AUTO_1208 ) ) ( not ( = ?AUTO_1206 ?AUTO_1208 ) ) ( not ( = ?AUTO_1207 ?AUTO_1208 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1207 ?AUTO_1208 )
      ( MAKE-ON ?AUTO_1202 ?AUTO_1203 )
      ( MAKE-ON-VERIFY ?AUTO_1202 ?AUTO_1203 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1209 - BLOCK
      ?AUTO_1210 - BLOCK
    )
    :vars
    (
      ?AUTO_1213 - BLOCK
      ?AUTO_1214 - BLOCK
      ?AUTO_1211 - BLOCK
      ?AUTO_1215 - BLOCK
      ?AUTO_1212 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1209 ?AUTO_1210 ) ) ( ON-TABLE ?AUTO_1209 ) ( not ( = ?AUTO_1209 ?AUTO_1213 ) ) ( not ( = ?AUTO_1210 ?AUTO_1213 ) ) ( ON ?AUTO_1213 ?AUTO_1209 ) ( not ( = ?AUTO_1209 ?AUTO_1214 ) ) ( not ( = ?AUTO_1210 ?AUTO_1214 ) ) ( not ( = ?AUTO_1213 ?AUTO_1214 ) ) ( ON ?AUTO_1214 ?AUTO_1213 ) ( not ( = ?AUTO_1209 ?AUTO_1211 ) ) ( not ( = ?AUTO_1209 ?AUTO_1215 ) ) ( not ( = ?AUTO_1210 ?AUTO_1211 ) ) ( not ( = ?AUTO_1210 ?AUTO_1215 ) ) ( not ( = ?AUTO_1213 ?AUTO_1211 ) ) ( not ( = ?AUTO_1213 ?AUTO_1215 ) ) ( not ( = ?AUTO_1214 ?AUTO_1211 ) ) ( not ( = ?AUTO_1214 ?AUTO_1215 ) ) ( not ( = ?AUTO_1211 ?AUTO_1215 ) ) ( ON ?AUTO_1211 ?AUTO_1210 ) ( CLEAR ?AUTO_1211 ) ( CLEAR ?AUTO_1212 ) ( not ( = ?AUTO_1209 ?AUTO_1212 ) ) ( not ( = ?AUTO_1210 ?AUTO_1212 ) ) ( not ( = ?AUTO_1213 ?AUTO_1212 ) ) ( not ( = ?AUTO_1214 ?AUTO_1212 ) ) ( not ( = ?AUTO_1211 ?AUTO_1212 ) ) ( not ( = ?AUTO_1215 ?AUTO_1212 ) ) ( ON ?AUTO_1215 ?AUTO_1214 ) ( CLEAR ?AUTO_1215 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1215 ?AUTO_1214 )
      ( MAKE-ON ?AUTO_1209 ?AUTO_1210 )
      ( MAKE-ON-VERIFY ?AUTO_1209 ?AUTO_1210 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1216 - BLOCK
      ?AUTO_1217 - BLOCK
    )
    :vars
    (
      ?AUTO_1220 - BLOCK
      ?AUTO_1221 - BLOCK
      ?AUTO_1219 - BLOCK
      ?AUTO_1218 - BLOCK
      ?AUTO_1222 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1216 ?AUTO_1217 ) ) ( ON-TABLE ?AUTO_1216 ) ( not ( = ?AUTO_1216 ?AUTO_1220 ) ) ( not ( = ?AUTO_1217 ?AUTO_1220 ) ) ( ON ?AUTO_1220 ?AUTO_1216 ) ( not ( = ?AUTO_1216 ?AUTO_1221 ) ) ( not ( = ?AUTO_1217 ?AUTO_1221 ) ) ( not ( = ?AUTO_1220 ?AUTO_1221 ) ) ( ON ?AUTO_1221 ?AUTO_1220 ) ( not ( = ?AUTO_1216 ?AUTO_1219 ) ) ( not ( = ?AUTO_1216 ?AUTO_1218 ) ) ( not ( = ?AUTO_1217 ?AUTO_1219 ) ) ( not ( = ?AUTO_1217 ?AUTO_1218 ) ) ( not ( = ?AUTO_1220 ?AUTO_1219 ) ) ( not ( = ?AUTO_1220 ?AUTO_1218 ) ) ( not ( = ?AUTO_1221 ?AUTO_1219 ) ) ( not ( = ?AUTO_1221 ?AUTO_1218 ) ) ( not ( = ?AUTO_1219 ?AUTO_1218 ) ) ( ON ?AUTO_1219 ?AUTO_1217 ) ( CLEAR ?AUTO_1219 ) ( not ( = ?AUTO_1216 ?AUTO_1222 ) ) ( not ( = ?AUTO_1217 ?AUTO_1222 ) ) ( not ( = ?AUTO_1220 ?AUTO_1222 ) ) ( not ( = ?AUTO_1221 ?AUTO_1222 ) ) ( not ( = ?AUTO_1219 ?AUTO_1222 ) ) ( not ( = ?AUTO_1218 ?AUTO_1222 ) ) ( ON ?AUTO_1218 ?AUTO_1221 ) ( CLEAR ?AUTO_1218 ) ( HOLDING ?AUTO_1222 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1222 )
      ( MAKE-ON ?AUTO_1216 ?AUTO_1217 )
      ( MAKE-ON-VERIFY ?AUTO_1216 ?AUTO_1217 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1223 - BLOCK
      ?AUTO_1224 - BLOCK
    )
    :vars
    (
      ?AUTO_1229 - BLOCK
      ?AUTO_1228 - BLOCK
      ?AUTO_1225 - BLOCK
      ?AUTO_1226 - BLOCK
      ?AUTO_1227 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1223 ?AUTO_1224 ) ) ( ON-TABLE ?AUTO_1223 ) ( not ( = ?AUTO_1223 ?AUTO_1229 ) ) ( not ( = ?AUTO_1224 ?AUTO_1229 ) ) ( ON ?AUTO_1229 ?AUTO_1223 ) ( not ( = ?AUTO_1223 ?AUTO_1228 ) ) ( not ( = ?AUTO_1224 ?AUTO_1228 ) ) ( not ( = ?AUTO_1229 ?AUTO_1228 ) ) ( ON ?AUTO_1228 ?AUTO_1229 ) ( not ( = ?AUTO_1223 ?AUTO_1225 ) ) ( not ( = ?AUTO_1223 ?AUTO_1226 ) ) ( not ( = ?AUTO_1224 ?AUTO_1225 ) ) ( not ( = ?AUTO_1224 ?AUTO_1226 ) ) ( not ( = ?AUTO_1229 ?AUTO_1225 ) ) ( not ( = ?AUTO_1229 ?AUTO_1226 ) ) ( not ( = ?AUTO_1228 ?AUTO_1225 ) ) ( not ( = ?AUTO_1228 ?AUTO_1226 ) ) ( not ( = ?AUTO_1225 ?AUTO_1226 ) ) ( ON ?AUTO_1225 ?AUTO_1224 ) ( CLEAR ?AUTO_1225 ) ( not ( = ?AUTO_1223 ?AUTO_1227 ) ) ( not ( = ?AUTO_1224 ?AUTO_1227 ) ) ( not ( = ?AUTO_1229 ?AUTO_1227 ) ) ( not ( = ?AUTO_1228 ?AUTO_1227 ) ) ( not ( = ?AUTO_1225 ?AUTO_1227 ) ) ( not ( = ?AUTO_1226 ?AUTO_1227 ) ) ( ON ?AUTO_1226 ?AUTO_1228 ) ( ON ?AUTO_1227 ?AUTO_1226 ) ( CLEAR ?AUTO_1227 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1227 ?AUTO_1226 )
      ( MAKE-ON ?AUTO_1223 ?AUTO_1224 )
      ( MAKE-ON-VERIFY ?AUTO_1223 ?AUTO_1224 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1230 - BLOCK
      ?AUTO_1231 - BLOCK
    )
    :vars
    (
      ?AUTO_1232 - BLOCK
      ?AUTO_1234 - BLOCK
      ?AUTO_1233 - BLOCK
      ?AUTO_1236 - BLOCK
      ?AUTO_1235 - BLOCK
      ?AUTO_1237 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1230 ?AUTO_1231 ) ) ( ON-TABLE ?AUTO_1230 ) ( not ( = ?AUTO_1230 ?AUTO_1232 ) ) ( not ( = ?AUTO_1231 ?AUTO_1232 ) ) ( ON ?AUTO_1232 ?AUTO_1230 ) ( not ( = ?AUTO_1230 ?AUTO_1234 ) ) ( not ( = ?AUTO_1231 ?AUTO_1234 ) ) ( not ( = ?AUTO_1232 ?AUTO_1234 ) ) ( ON ?AUTO_1234 ?AUTO_1232 ) ( not ( = ?AUTO_1230 ?AUTO_1233 ) ) ( not ( = ?AUTO_1230 ?AUTO_1236 ) ) ( not ( = ?AUTO_1231 ?AUTO_1233 ) ) ( not ( = ?AUTO_1231 ?AUTO_1236 ) ) ( not ( = ?AUTO_1232 ?AUTO_1233 ) ) ( not ( = ?AUTO_1232 ?AUTO_1236 ) ) ( not ( = ?AUTO_1234 ?AUTO_1233 ) ) ( not ( = ?AUTO_1234 ?AUTO_1236 ) ) ( not ( = ?AUTO_1233 ?AUTO_1236 ) ) ( ON ?AUTO_1233 ?AUTO_1231 ) ( CLEAR ?AUTO_1233 ) ( not ( = ?AUTO_1230 ?AUTO_1235 ) ) ( not ( = ?AUTO_1231 ?AUTO_1235 ) ) ( not ( = ?AUTO_1232 ?AUTO_1235 ) ) ( not ( = ?AUTO_1234 ?AUTO_1235 ) ) ( not ( = ?AUTO_1233 ?AUTO_1235 ) ) ( not ( = ?AUTO_1236 ?AUTO_1235 ) ) ( ON ?AUTO_1236 ?AUTO_1234 ) ( ON ?AUTO_1235 ?AUTO_1236 ) ( CLEAR ?AUTO_1235 ) ( HOLDING ?AUTO_1237 ) ( not ( = ?AUTO_1230 ?AUTO_1237 ) ) ( not ( = ?AUTO_1231 ?AUTO_1237 ) ) ( not ( = ?AUTO_1232 ?AUTO_1237 ) ) ( not ( = ?AUTO_1234 ?AUTO_1237 ) ) ( not ( = ?AUTO_1233 ?AUTO_1237 ) ) ( not ( = ?AUTO_1236 ?AUTO_1237 ) ) ( not ( = ?AUTO_1235 ?AUTO_1237 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1237 )
      ( MAKE-ON ?AUTO_1230 ?AUTO_1231 )
      ( MAKE-ON-VERIFY ?AUTO_1230 ?AUTO_1231 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1238 - BLOCK
      ?AUTO_1239 - BLOCK
    )
    :vars
    (
      ?AUTO_1241 - BLOCK
      ?AUTO_1245 - BLOCK
      ?AUTO_1242 - BLOCK
      ?AUTO_1240 - BLOCK
      ?AUTO_1244 - BLOCK
      ?AUTO_1243 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1238 ?AUTO_1239 ) ) ( ON-TABLE ?AUTO_1238 ) ( not ( = ?AUTO_1238 ?AUTO_1241 ) ) ( not ( = ?AUTO_1239 ?AUTO_1241 ) ) ( ON ?AUTO_1241 ?AUTO_1238 ) ( not ( = ?AUTO_1238 ?AUTO_1245 ) ) ( not ( = ?AUTO_1239 ?AUTO_1245 ) ) ( not ( = ?AUTO_1241 ?AUTO_1245 ) ) ( ON ?AUTO_1245 ?AUTO_1241 ) ( not ( = ?AUTO_1238 ?AUTO_1242 ) ) ( not ( = ?AUTO_1238 ?AUTO_1240 ) ) ( not ( = ?AUTO_1239 ?AUTO_1242 ) ) ( not ( = ?AUTO_1239 ?AUTO_1240 ) ) ( not ( = ?AUTO_1241 ?AUTO_1242 ) ) ( not ( = ?AUTO_1241 ?AUTO_1240 ) ) ( not ( = ?AUTO_1245 ?AUTO_1242 ) ) ( not ( = ?AUTO_1245 ?AUTO_1240 ) ) ( not ( = ?AUTO_1242 ?AUTO_1240 ) ) ( ON ?AUTO_1242 ?AUTO_1239 ) ( not ( = ?AUTO_1238 ?AUTO_1244 ) ) ( not ( = ?AUTO_1239 ?AUTO_1244 ) ) ( not ( = ?AUTO_1241 ?AUTO_1244 ) ) ( not ( = ?AUTO_1245 ?AUTO_1244 ) ) ( not ( = ?AUTO_1242 ?AUTO_1244 ) ) ( not ( = ?AUTO_1240 ?AUTO_1244 ) ) ( ON ?AUTO_1240 ?AUTO_1245 ) ( ON ?AUTO_1244 ?AUTO_1240 ) ( CLEAR ?AUTO_1244 ) ( not ( = ?AUTO_1238 ?AUTO_1243 ) ) ( not ( = ?AUTO_1239 ?AUTO_1243 ) ) ( not ( = ?AUTO_1241 ?AUTO_1243 ) ) ( not ( = ?AUTO_1245 ?AUTO_1243 ) ) ( not ( = ?AUTO_1242 ?AUTO_1243 ) ) ( not ( = ?AUTO_1240 ?AUTO_1243 ) ) ( not ( = ?AUTO_1244 ?AUTO_1243 ) ) ( ON ?AUTO_1243 ?AUTO_1242 ) ( CLEAR ?AUTO_1243 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1243 ?AUTO_1242 )
      ( MAKE-ON ?AUTO_1238 ?AUTO_1239 )
      ( MAKE-ON-VERIFY ?AUTO_1238 ?AUTO_1239 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1268 - BLOCK
      ?AUTO_1269 - BLOCK
    )
    :vars
    (
      ?AUTO_1270 - BLOCK
      ?AUTO_1271 - BLOCK
      ?AUTO_1272 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1268 ?AUTO_1269 ) ) ( not ( = ?AUTO_1268 ?AUTO_1270 ) ) ( not ( = ?AUTO_1269 ?AUTO_1270 ) ) ( ON ?AUTO_1270 ?AUTO_1269 ) ( ON ?AUTO_1268 ?AUTO_1270 ) ( CLEAR ?AUTO_1268 ) ( HOLDING ?AUTO_1271 ) ( CLEAR ?AUTO_1272 ) ( not ( = ?AUTO_1268 ?AUTO_1271 ) ) ( not ( = ?AUTO_1268 ?AUTO_1272 ) ) ( not ( = ?AUTO_1269 ?AUTO_1271 ) ) ( not ( = ?AUTO_1269 ?AUTO_1272 ) ) ( not ( = ?AUTO_1270 ?AUTO_1271 ) ) ( not ( = ?AUTO_1270 ?AUTO_1272 ) ) ( not ( = ?AUTO_1271 ?AUTO_1272 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1271 ?AUTO_1272 )
      ( MAKE-ON ?AUTO_1268 ?AUTO_1269 )
      ( MAKE-ON-VERIFY ?AUTO_1268 ?AUTO_1269 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1292 - BLOCK
      ?AUTO_1293 - BLOCK
    )
    :vars
    (
      ?AUTO_1295 - BLOCK
      ?AUTO_1296 - BLOCK
      ?AUTO_1294 - BLOCK
      ?AUTO_1297 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1292 ?AUTO_1293 ) ) ( not ( = ?AUTO_1292 ?AUTO_1295 ) ) ( not ( = ?AUTO_1293 ?AUTO_1295 ) ) ( ON ?AUTO_1295 ?AUTO_1293 ) ( ON ?AUTO_1292 ?AUTO_1295 ) ( CLEAR ?AUTO_1296 ) ( not ( = ?AUTO_1292 ?AUTO_1294 ) ) ( not ( = ?AUTO_1292 ?AUTO_1296 ) ) ( not ( = ?AUTO_1293 ?AUTO_1294 ) ) ( not ( = ?AUTO_1293 ?AUTO_1296 ) ) ( not ( = ?AUTO_1295 ?AUTO_1294 ) ) ( not ( = ?AUTO_1295 ?AUTO_1296 ) ) ( not ( = ?AUTO_1294 ?AUTO_1296 ) ) ( ON ?AUTO_1294 ?AUTO_1292 ) ( not ( = ?AUTO_1292 ?AUTO_1297 ) ) ( not ( = ?AUTO_1293 ?AUTO_1297 ) ) ( not ( = ?AUTO_1295 ?AUTO_1297 ) ) ( not ( = ?AUTO_1296 ?AUTO_1297 ) ) ( not ( = ?AUTO_1294 ?AUTO_1297 ) ) ( ON ?AUTO_1297 ?AUTO_1294 ) ( CLEAR ?AUTO_1297 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1297 ?AUTO_1294 )
      ( MAKE-ON ?AUTO_1292 ?AUTO_1293 )
      ( MAKE-ON-VERIFY ?AUTO_1292 ?AUTO_1293 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1298 - BLOCK
      ?AUTO_1299 - BLOCK
    )
    :vars
    (
      ?AUTO_1303 - BLOCK
      ?AUTO_1300 - BLOCK
      ?AUTO_1301 - BLOCK
      ?AUTO_1302 - BLOCK
      ?AUTO_1304 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1298 ?AUTO_1299 ) ) ( not ( = ?AUTO_1298 ?AUTO_1303 ) ) ( not ( = ?AUTO_1299 ?AUTO_1303 ) ) ( ON ?AUTO_1303 ?AUTO_1299 ) ( ON ?AUTO_1298 ?AUTO_1303 ) ( CLEAR ?AUTO_1300 ) ( not ( = ?AUTO_1298 ?AUTO_1301 ) ) ( not ( = ?AUTO_1298 ?AUTO_1300 ) ) ( not ( = ?AUTO_1299 ?AUTO_1301 ) ) ( not ( = ?AUTO_1299 ?AUTO_1300 ) ) ( not ( = ?AUTO_1303 ?AUTO_1301 ) ) ( not ( = ?AUTO_1303 ?AUTO_1300 ) ) ( not ( = ?AUTO_1301 ?AUTO_1300 ) ) ( ON ?AUTO_1301 ?AUTO_1298 ) ( not ( = ?AUTO_1298 ?AUTO_1302 ) ) ( not ( = ?AUTO_1299 ?AUTO_1302 ) ) ( not ( = ?AUTO_1303 ?AUTO_1302 ) ) ( not ( = ?AUTO_1300 ?AUTO_1302 ) ) ( not ( = ?AUTO_1301 ?AUTO_1302 ) ) ( ON ?AUTO_1302 ?AUTO_1301 ) ( CLEAR ?AUTO_1302 ) ( HOLDING ?AUTO_1304 ) ( not ( = ?AUTO_1298 ?AUTO_1304 ) ) ( not ( = ?AUTO_1299 ?AUTO_1304 ) ) ( not ( = ?AUTO_1303 ?AUTO_1304 ) ) ( not ( = ?AUTO_1300 ?AUTO_1304 ) ) ( not ( = ?AUTO_1301 ?AUTO_1304 ) ) ( not ( = ?AUTO_1302 ?AUTO_1304 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1304 )
      ( MAKE-ON ?AUTO_1298 ?AUTO_1299 )
      ( MAKE-ON-VERIFY ?AUTO_1298 ?AUTO_1299 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1337 - BLOCK
      ?AUTO_1338 - BLOCK
    )
    :vars
    (
      ?AUTO_1339 - BLOCK
      ?AUTO_1340 - BLOCK
      ?AUTO_1341 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1337 ?AUTO_1338 ) ) ( ON ?AUTO_1337 ?AUTO_1339 ) ( not ( = ?AUTO_1337 ?AUTO_1339 ) ) ( not ( = ?AUTO_1338 ?AUTO_1339 ) ) ( ON ?AUTO_1338 ?AUTO_1337 ) ( CLEAR ?AUTO_1338 ) ( HOLDING ?AUTO_1340 ) ( CLEAR ?AUTO_1341 ) ( not ( = ?AUTO_1337 ?AUTO_1340 ) ) ( not ( = ?AUTO_1337 ?AUTO_1341 ) ) ( not ( = ?AUTO_1338 ?AUTO_1340 ) ) ( not ( = ?AUTO_1338 ?AUTO_1341 ) ) ( not ( = ?AUTO_1339 ?AUTO_1340 ) ) ( not ( = ?AUTO_1339 ?AUTO_1341 ) ) ( not ( = ?AUTO_1340 ?AUTO_1341 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1340 ?AUTO_1341 )
      ( MAKE-ON ?AUTO_1337 ?AUTO_1338 )
      ( MAKE-ON-VERIFY ?AUTO_1337 ?AUTO_1338 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1530 - BLOCK
      ?AUTO_1531 - BLOCK
    )
    :vars
    (
      ?AUTO_1533 - BLOCK
      ?AUTO_1532 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1530 ?AUTO_1531 ) ) ( ON ?AUTO_1530 ?AUTO_1533 ) ( not ( = ?AUTO_1530 ?AUTO_1533 ) ) ( not ( = ?AUTO_1531 ?AUTO_1533 ) ) ( ON ?AUTO_1531 ?AUTO_1530 ) ( not ( = ?AUTO_1530 ?AUTO_1532 ) ) ( not ( = ?AUTO_1531 ?AUTO_1532 ) ) ( not ( = ?AUTO_1533 ?AUTO_1532 ) ) ( ON ?AUTO_1532 ?AUTO_1531 ) ( CLEAR ?AUTO_1532 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1532 ?AUTO_1531 )
      ( MAKE-ON ?AUTO_1530 ?AUTO_1531 )
      ( MAKE-ON-VERIFY ?AUTO_1530 ?AUTO_1531 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1434 - BLOCK
      ?AUTO_1435 - BLOCK
    )
    :vars
    (
      ?AUTO_1437 - BLOCK
      ?AUTO_1436 - BLOCK
      ?AUTO_1438 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1434 ?AUTO_1435 ) ) ( ON-TABLE ?AUTO_1434 ) ( CLEAR ?AUTO_1434 ) ( not ( = ?AUTO_1434 ?AUTO_1437 ) ) ( not ( = ?AUTO_1434 ?AUTO_1436 ) ) ( not ( = ?AUTO_1435 ?AUTO_1437 ) ) ( not ( = ?AUTO_1435 ?AUTO_1436 ) ) ( not ( = ?AUTO_1437 ?AUTO_1436 ) ) ( ON ?AUTO_1437 ?AUTO_1435 ) ( CLEAR ?AUTO_1437 ) ( HOLDING ?AUTO_1436 ) ( CLEAR ?AUTO_1438 ) ( not ( = ?AUTO_1434 ?AUTO_1438 ) ) ( not ( = ?AUTO_1435 ?AUTO_1438 ) ) ( not ( = ?AUTO_1437 ?AUTO_1438 ) ) ( not ( = ?AUTO_1436 ?AUTO_1438 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1436 ?AUTO_1438 )
      ( MAKE-ON ?AUTO_1434 ?AUTO_1435 )
      ( MAKE-ON-VERIFY ?AUTO_1434 ?AUTO_1435 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4884 - BLOCK
      ?AUTO_4885 - BLOCK
    )
    :vars
    (
      ?AUTO_4886 - BLOCK
      ?AUTO_4887 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4884 ?AUTO_4885 ) ) ( ON-TABLE ?AUTO_4884 ) ( not ( = ?AUTO_4884 ?AUTO_4886 ) ) ( not ( = ?AUTO_4885 ?AUTO_4886 ) ) ( ON ?AUTO_4886 ?AUTO_4884 ) ( CLEAR ?AUTO_4886 ) ( HOLDING ?AUTO_4885 ) ( CLEAR ?AUTO_4887 ) ( not ( = ?AUTO_4884 ?AUTO_4887 ) ) ( not ( = ?AUTO_4885 ?AUTO_4887 ) ) ( not ( = ?AUTO_4886 ?AUTO_4887 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4885 ?AUTO_4887 )
      ( MAKE-ON ?AUTO_4884 ?AUTO_4885 )
      ( MAKE-ON-VERIFY ?AUTO_4884 ?AUTO_4885 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1534 - BLOCK
      ?AUTO_1535 - BLOCK
    )
    :vars
    (
      ?AUTO_1536 - BLOCK
      ?AUTO_1537 - BLOCK
      ?AUTO_1538 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1534 ?AUTO_1535 ) ) ( ON ?AUTO_1534 ?AUTO_1536 ) ( not ( = ?AUTO_1534 ?AUTO_1536 ) ) ( not ( = ?AUTO_1535 ?AUTO_1536 ) ) ( ON ?AUTO_1535 ?AUTO_1534 ) ( not ( = ?AUTO_1534 ?AUTO_1537 ) ) ( not ( = ?AUTO_1535 ?AUTO_1537 ) ) ( not ( = ?AUTO_1536 ?AUTO_1537 ) ) ( ON ?AUTO_1537 ?AUTO_1535 ) ( CLEAR ?AUTO_1537 ) ( HOLDING ?AUTO_1538 ) ( not ( = ?AUTO_1534 ?AUTO_1538 ) ) ( not ( = ?AUTO_1535 ?AUTO_1538 ) ) ( not ( = ?AUTO_1536 ?AUTO_1538 ) ) ( not ( = ?AUTO_1537 ?AUTO_1538 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1538 )
      ( MAKE-ON ?AUTO_1534 ?AUTO_1535 )
      ( MAKE-ON-VERIFY ?AUTO_1534 ?AUTO_1535 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1539 - BLOCK
      ?AUTO_1540 - BLOCK
    )
    :vars
    (
      ?AUTO_1541 - BLOCK
      ?AUTO_1542 - BLOCK
      ?AUTO_1543 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1539 ?AUTO_1540 ) ) ( ON ?AUTO_1539 ?AUTO_1541 ) ( not ( = ?AUTO_1539 ?AUTO_1541 ) ) ( not ( = ?AUTO_1540 ?AUTO_1541 ) ) ( ON ?AUTO_1540 ?AUTO_1539 ) ( not ( = ?AUTO_1539 ?AUTO_1542 ) ) ( not ( = ?AUTO_1540 ?AUTO_1542 ) ) ( not ( = ?AUTO_1541 ?AUTO_1542 ) ) ( ON ?AUTO_1542 ?AUTO_1540 ) ( not ( = ?AUTO_1539 ?AUTO_1543 ) ) ( not ( = ?AUTO_1540 ?AUTO_1543 ) ) ( not ( = ?AUTO_1541 ?AUTO_1543 ) ) ( not ( = ?AUTO_1542 ?AUTO_1543 ) ) ( ON ?AUTO_1543 ?AUTO_1542 ) ( CLEAR ?AUTO_1543 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1543 ?AUTO_1542 )
      ( MAKE-ON ?AUTO_1539 ?AUTO_1540 )
      ( MAKE-ON-VERIFY ?AUTO_1539 ?AUTO_1540 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2523 - BLOCK
      ?AUTO_2524 - BLOCK
    )
    :vars
    (
      ?AUTO_2527 - BLOCK
      ?AUTO_2528 - BLOCK
      ?AUTO_2525 - BLOCK
      ?AUTO_2526 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2523 ?AUTO_2524 ) ) ( ON ?AUTO_2523 ?AUTO_2527 ) ( CLEAR ?AUTO_2523 ) ( not ( = ?AUTO_2523 ?AUTO_2527 ) ) ( not ( = ?AUTO_2524 ?AUTO_2527 ) ) ( not ( = ?AUTO_2523 ?AUTO_2528 ) ) ( not ( = ?AUTO_2523 ?AUTO_2525 ) ) ( not ( = ?AUTO_2524 ?AUTO_2528 ) ) ( not ( = ?AUTO_2524 ?AUTO_2525 ) ) ( not ( = ?AUTO_2527 ?AUTO_2528 ) ) ( not ( = ?AUTO_2527 ?AUTO_2525 ) ) ( not ( = ?AUTO_2528 ?AUTO_2525 ) ) ( ON ?AUTO_2528 ?AUTO_2524 ) ( not ( = ?AUTO_2523 ?AUTO_2526 ) ) ( not ( = ?AUTO_2524 ?AUTO_2526 ) ) ( not ( = ?AUTO_2527 ?AUTO_2526 ) ) ( not ( = ?AUTO_2528 ?AUTO_2526 ) ) ( not ( = ?AUTO_2525 ?AUTO_2526 ) ) ( ON ?AUTO_2525 ?AUTO_2528 ) ( CLEAR ?AUTO_2525 ) ( HOLDING ?AUTO_2526 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2526 )
      ( MAKE-ON ?AUTO_2523 ?AUTO_2524 )
      ( MAKE-ON-VERIFY ?AUTO_2523 ?AUTO_2524 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2529 - BLOCK
      ?AUTO_2530 - BLOCK
    )
    :vars
    (
      ?AUTO_2534 - BLOCK
      ?AUTO_2533 - BLOCK
      ?AUTO_2532 - BLOCK
      ?AUTO_2531 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2529 ?AUTO_2530 ) ) ( ON ?AUTO_2529 ?AUTO_2534 ) ( CLEAR ?AUTO_2529 ) ( not ( = ?AUTO_2529 ?AUTO_2534 ) ) ( not ( = ?AUTO_2530 ?AUTO_2534 ) ) ( not ( = ?AUTO_2529 ?AUTO_2533 ) ) ( not ( = ?AUTO_2529 ?AUTO_2532 ) ) ( not ( = ?AUTO_2530 ?AUTO_2533 ) ) ( not ( = ?AUTO_2530 ?AUTO_2532 ) ) ( not ( = ?AUTO_2534 ?AUTO_2533 ) ) ( not ( = ?AUTO_2534 ?AUTO_2532 ) ) ( not ( = ?AUTO_2533 ?AUTO_2532 ) ) ( ON ?AUTO_2533 ?AUTO_2530 ) ( not ( = ?AUTO_2529 ?AUTO_2531 ) ) ( not ( = ?AUTO_2530 ?AUTO_2531 ) ) ( not ( = ?AUTO_2534 ?AUTO_2531 ) ) ( not ( = ?AUTO_2533 ?AUTO_2531 ) ) ( not ( = ?AUTO_2532 ?AUTO_2531 ) ) ( ON ?AUTO_2532 ?AUTO_2533 ) ( ON ?AUTO_2531 ?AUTO_2532 ) ( CLEAR ?AUTO_2531 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2531 ?AUTO_2532 )
      ( MAKE-ON ?AUTO_2529 ?AUTO_2530 )
      ( MAKE-ON-VERIFY ?AUTO_2529 ?AUTO_2530 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2715 - BLOCK
      ?AUTO_2716 - BLOCK
    )
    :vars
    (
      ?AUTO_2717 - BLOCK
      ?AUTO_2719 - BLOCK
      ?AUTO_2720 - BLOCK
      ?AUTO_2718 - BLOCK
      ?AUTO_2721 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2715 ?AUTO_2716 ) ) ( ON ?AUTO_2715 ?AUTO_2717 ) ( CLEAR ?AUTO_2715 ) ( not ( = ?AUTO_2715 ?AUTO_2717 ) ) ( not ( = ?AUTO_2716 ?AUTO_2717 ) ) ( not ( = ?AUTO_2715 ?AUTO_2719 ) ) ( not ( = ?AUTO_2715 ?AUTO_2720 ) ) ( not ( = ?AUTO_2716 ?AUTO_2719 ) ) ( not ( = ?AUTO_2716 ?AUTO_2720 ) ) ( not ( = ?AUTO_2717 ?AUTO_2719 ) ) ( not ( = ?AUTO_2717 ?AUTO_2720 ) ) ( not ( = ?AUTO_2719 ?AUTO_2720 ) ) ( ON ?AUTO_2719 ?AUTO_2716 ) ( not ( = ?AUTO_2715 ?AUTO_2718 ) ) ( not ( = ?AUTO_2716 ?AUTO_2718 ) ) ( not ( = ?AUTO_2717 ?AUTO_2718 ) ) ( not ( = ?AUTO_2720 ?AUTO_2718 ) ) ( not ( = ?AUTO_2719 ?AUTO_2718 ) ) ( ON ?AUTO_2718 ?AUTO_2719 ) ( ON ?AUTO_2720 ?AUTO_2718 ) ( not ( = ?AUTO_2715 ?AUTO_2721 ) ) ( not ( = ?AUTO_2716 ?AUTO_2721 ) ) ( not ( = ?AUTO_2717 ?AUTO_2721 ) ) ( not ( = ?AUTO_2719 ?AUTO_2721 ) ) ( not ( = ?AUTO_2720 ?AUTO_2721 ) ) ( not ( = ?AUTO_2718 ?AUTO_2721 ) ) ( ON ?AUTO_2721 ?AUTO_2720 ) ( CLEAR ?AUTO_2721 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2721 ?AUTO_2720 )
      ( MAKE-ON ?AUTO_2715 ?AUTO_2716 )
      ( MAKE-ON-VERIFY ?AUTO_2715 ?AUTO_2716 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3388 - BLOCK
    )
    :vars
    (
      ?AUTO_3389 - BLOCK
      ?AUTO_3390 - BLOCK
      ?AUTO_3392 - BLOCK
      ?AUTO_3391 - BLOCK
      ?AUTO_3393 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3388 ?AUTO_3389 ) ( not ( = ?AUTO_3388 ?AUTO_3389 ) ) ( not ( = ?AUTO_3388 ?AUTO_3390 ) ) ( not ( = ?AUTO_3388 ?AUTO_3392 ) ) ( not ( = ?AUTO_3389 ?AUTO_3390 ) ) ( not ( = ?AUTO_3389 ?AUTO_3392 ) ) ( not ( = ?AUTO_3390 ?AUTO_3392 ) ) ( ON ?AUTO_3390 ?AUTO_3388 ) ( not ( = ?AUTO_3388 ?AUTO_3391 ) ) ( not ( = ?AUTO_3389 ?AUTO_3391 ) ) ( not ( = ?AUTO_3392 ?AUTO_3391 ) ) ( not ( = ?AUTO_3390 ?AUTO_3391 ) ) ( ON ?AUTO_3391 ?AUTO_3390 ) ( CLEAR ?AUTO_3391 ) ( HOLDING ?AUTO_3392 ) ( CLEAR ?AUTO_3393 ) ( not ( = ?AUTO_3388 ?AUTO_3393 ) ) ( not ( = ?AUTO_3389 ?AUTO_3393 ) ) ( not ( = ?AUTO_3390 ?AUTO_3393 ) ) ( not ( = ?AUTO_3392 ?AUTO_3393 ) ) ( not ( = ?AUTO_3391 ?AUTO_3393 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3392 ?AUTO_3393 )
      ( MAKE-ON-TABLE ?AUTO_3388 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3388 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1999 - BLOCK
      ?AUTO_2000 - BLOCK
    )
    :vars
    (
      ?AUTO_2003 - BLOCK
      ?AUTO_2002 - BLOCK
      ?AUTO_2001 - BLOCK
      ?AUTO_2004 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1999 ?AUTO_2000 ) ) ( ON-TABLE ?AUTO_1999 ) ( not ( = ?AUTO_1999 ?AUTO_2003 ) ) ( not ( = ?AUTO_1999 ?AUTO_2002 ) ) ( not ( = ?AUTO_2000 ?AUTO_2003 ) ) ( not ( = ?AUTO_2000 ?AUTO_2002 ) ) ( not ( = ?AUTO_2003 ?AUTO_2002 ) ) ( ON ?AUTO_2003 ?AUTO_1999 ) ( CLEAR ?AUTO_2003 ) ( CLEAR ?AUTO_2001 ) ( not ( = ?AUTO_1999 ?AUTO_2001 ) ) ( not ( = ?AUTO_2000 ?AUTO_2001 ) ) ( not ( = ?AUTO_2003 ?AUTO_2001 ) ) ( not ( = ?AUTO_2002 ?AUTO_2001 ) ) ( ON ?AUTO_2002 ?AUTO_2000 ) ( CLEAR ?AUTO_2002 ) ( HOLDING ?AUTO_2004 ) ( not ( = ?AUTO_1999 ?AUTO_2004 ) ) ( not ( = ?AUTO_2000 ?AUTO_2004 ) ) ( not ( = ?AUTO_2003 ?AUTO_2004 ) ) ( not ( = ?AUTO_2002 ?AUTO_2004 ) ) ( not ( = ?AUTO_2001 ?AUTO_2004 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2004 )
      ( MAKE-ON ?AUTO_1999 ?AUTO_2000 )
      ( MAKE-ON-VERIFY ?AUTO_1999 ?AUTO_2000 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2023 - BLOCK
      ?AUTO_2024 - BLOCK
    )
    :vars
    (
      ?AUTO_2027 - BLOCK
      ?AUTO_2028 - BLOCK
      ?AUTO_2026 - BLOCK
      ?AUTO_2025 - BLOCK
      ?AUTO_2029 - BLOCK
      ?AUTO_2030 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2023 ?AUTO_2024 ) ) ( ON-TABLE ?AUTO_2023 ) ( not ( = ?AUTO_2023 ?AUTO_2027 ) ) ( not ( = ?AUTO_2023 ?AUTO_2028 ) ) ( not ( = ?AUTO_2024 ?AUTO_2027 ) ) ( not ( = ?AUTO_2024 ?AUTO_2028 ) ) ( not ( = ?AUTO_2027 ?AUTO_2028 ) ) ( CLEAR ?AUTO_2026 ) ( not ( = ?AUTO_2023 ?AUTO_2026 ) ) ( not ( = ?AUTO_2024 ?AUTO_2026 ) ) ( not ( = ?AUTO_2027 ?AUTO_2026 ) ) ( not ( = ?AUTO_2028 ?AUTO_2026 ) ) ( ON ?AUTO_2028 ?AUTO_2024 ) ( not ( = ?AUTO_2023 ?AUTO_2025 ) ) ( not ( = ?AUTO_2024 ?AUTO_2025 ) ) ( not ( = ?AUTO_2027 ?AUTO_2025 ) ) ( not ( = ?AUTO_2028 ?AUTO_2025 ) ) ( not ( = ?AUTO_2026 ?AUTO_2025 ) ) ( ON ?AUTO_2025 ?AUTO_2028 ) ( CLEAR ?AUTO_2023 ) ( ON ?AUTO_2027 ?AUTO_2025 ) ( CLEAR ?AUTO_2027 ) ( HOLDING ?AUTO_2029 ) ( CLEAR ?AUTO_2030 ) ( not ( = ?AUTO_2023 ?AUTO_2029 ) ) ( not ( = ?AUTO_2023 ?AUTO_2030 ) ) ( not ( = ?AUTO_2024 ?AUTO_2029 ) ) ( not ( = ?AUTO_2024 ?AUTO_2030 ) ) ( not ( = ?AUTO_2027 ?AUTO_2029 ) ) ( not ( = ?AUTO_2027 ?AUTO_2030 ) ) ( not ( = ?AUTO_2028 ?AUTO_2029 ) ) ( not ( = ?AUTO_2028 ?AUTO_2030 ) ) ( not ( = ?AUTO_2026 ?AUTO_2029 ) ) ( not ( = ?AUTO_2026 ?AUTO_2030 ) ) ( not ( = ?AUTO_2025 ?AUTO_2029 ) ) ( not ( = ?AUTO_2025 ?AUTO_2030 ) ) ( not ( = ?AUTO_2029 ?AUTO_2030 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2029 ?AUTO_2030 )
      ( MAKE-ON ?AUTO_2023 ?AUTO_2024 )
      ( MAKE-ON-VERIFY ?AUTO_2023 ?AUTO_2024 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4796 - BLOCK
      ?AUTO_4797 - BLOCK
    )
    :vars
    (
      ?AUTO_4798 - BLOCK
      ?AUTO_4802 - BLOCK
      ?AUTO_4800 - BLOCK
      ?AUTO_4801 - BLOCK
      ?AUTO_4799 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4796 ?AUTO_4797 ) ) ( ON-TABLE ?AUTO_4796 ) ( not ( = ?AUTO_4796 ?AUTO_4798 ) ) ( not ( = ?AUTO_4796 ?AUTO_4802 ) ) ( not ( = ?AUTO_4797 ?AUTO_4798 ) ) ( not ( = ?AUTO_4797 ?AUTO_4802 ) ) ( not ( = ?AUTO_4798 ?AUTO_4802 ) ) ( ON ?AUTO_4798 ?AUTO_4797 ) ( CLEAR ?AUTO_4800 ) ( not ( = ?AUTO_4796 ?AUTO_4801 ) ) ( not ( = ?AUTO_4796 ?AUTO_4800 ) ) ( not ( = ?AUTO_4797 ?AUTO_4801 ) ) ( not ( = ?AUTO_4797 ?AUTO_4800 ) ) ( not ( = ?AUTO_4802 ?AUTO_4801 ) ) ( not ( = ?AUTO_4802 ?AUTO_4800 ) ) ( not ( = ?AUTO_4798 ?AUTO_4801 ) ) ( not ( = ?AUTO_4798 ?AUTO_4800 ) ) ( not ( = ?AUTO_4801 ?AUTO_4800 ) ) ( ON ?AUTO_4801 ?AUTO_4798 ) ( not ( = ?AUTO_4796 ?AUTO_4799 ) ) ( not ( = ?AUTO_4797 ?AUTO_4799 ) ) ( not ( = ?AUTO_4802 ?AUTO_4799 ) ) ( not ( = ?AUTO_4798 ?AUTO_4799 ) ) ( not ( = ?AUTO_4800 ?AUTO_4799 ) ) ( not ( = ?AUTO_4801 ?AUTO_4799 ) ) ( ON ?AUTO_4799 ?AUTO_4801 ) ( CLEAR ?AUTO_4799 ) ( ON ?AUTO_4802 ?AUTO_4796 ) ( CLEAR ?AUTO_4802 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4802 ?AUTO_4796 )
      ( MAKE-ON ?AUTO_4796 ?AUTO_4797 )
      ( MAKE-ON-VERIFY ?AUTO_4796 ?AUTO_4797 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4803 - BLOCK
      ?AUTO_4804 - BLOCK
    )
    :vars
    (
      ?AUTO_4806 - BLOCK
      ?AUTO_4805 - BLOCK
      ?AUTO_4809 - BLOCK
      ?AUTO_4808 - BLOCK
      ?AUTO_4807 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4803 ?AUTO_4804 ) ) ( ON-TABLE ?AUTO_4803 ) ( not ( = ?AUTO_4803 ?AUTO_4806 ) ) ( not ( = ?AUTO_4803 ?AUTO_4805 ) ) ( not ( = ?AUTO_4804 ?AUTO_4806 ) ) ( not ( = ?AUTO_4804 ?AUTO_4805 ) ) ( not ( = ?AUTO_4806 ?AUTO_4805 ) ) ( ON ?AUTO_4806 ?AUTO_4804 ) ( not ( = ?AUTO_4803 ?AUTO_4809 ) ) ( not ( = ?AUTO_4803 ?AUTO_4808 ) ) ( not ( = ?AUTO_4804 ?AUTO_4809 ) ) ( not ( = ?AUTO_4804 ?AUTO_4808 ) ) ( not ( = ?AUTO_4805 ?AUTO_4809 ) ) ( not ( = ?AUTO_4805 ?AUTO_4808 ) ) ( not ( = ?AUTO_4806 ?AUTO_4809 ) ) ( not ( = ?AUTO_4806 ?AUTO_4808 ) ) ( not ( = ?AUTO_4809 ?AUTO_4808 ) ) ( ON ?AUTO_4809 ?AUTO_4806 ) ( not ( = ?AUTO_4803 ?AUTO_4807 ) ) ( not ( = ?AUTO_4804 ?AUTO_4807 ) ) ( not ( = ?AUTO_4805 ?AUTO_4807 ) ) ( not ( = ?AUTO_4806 ?AUTO_4807 ) ) ( not ( = ?AUTO_4808 ?AUTO_4807 ) ) ( not ( = ?AUTO_4809 ?AUTO_4807 ) ) ( ON ?AUTO_4807 ?AUTO_4809 ) ( CLEAR ?AUTO_4807 ) ( ON ?AUTO_4805 ?AUTO_4803 ) ( CLEAR ?AUTO_4805 ) ( HOLDING ?AUTO_4808 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4808 )
      ( MAKE-ON ?AUTO_4803 ?AUTO_4804 )
      ( MAKE-ON-VERIFY ?AUTO_4803 ?AUTO_4804 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4810 - BLOCK
      ?AUTO_4811 - BLOCK
    )
    :vars
    (
      ?AUTO_4813 - BLOCK
      ?AUTO_4812 - BLOCK
      ?AUTO_4814 - BLOCK
      ?AUTO_4815 - BLOCK
      ?AUTO_4816 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4810 ?AUTO_4811 ) ) ( ON-TABLE ?AUTO_4810 ) ( not ( = ?AUTO_4810 ?AUTO_4813 ) ) ( not ( = ?AUTO_4810 ?AUTO_4812 ) ) ( not ( = ?AUTO_4811 ?AUTO_4813 ) ) ( not ( = ?AUTO_4811 ?AUTO_4812 ) ) ( not ( = ?AUTO_4813 ?AUTO_4812 ) ) ( ON ?AUTO_4813 ?AUTO_4811 ) ( not ( = ?AUTO_4810 ?AUTO_4814 ) ) ( not ( = ?AUTO_4810 ?AUTO_4815 ) ) ( not ( = ?AUTO_4811 ?AUTO_4814 ) ) ( not ( = ?AUTO_4811 ?AUTO_4815 ) ) ( not ( = ?AUTO_4812 ?AUTO_4814 ) ) ( not ( = ?AUTO_4812 ?AUTO_4815 ) ) ( not ( = ?AUTO_4813 ?AUTO_4814 ) ) ( not ( = ?AUTO_4813 ?AUTO_4815 ) ) ( not ( = ?AUTO_4814 ?AUTO_4815 ) ) ( ON ?AUTO_4814 ?AUTO_4813 ) ( not ( = ?AUTO_4810 ?AUTO_4816 ) ) ( not ( = ?AUTO_4811 ?AUTO_4816 ) ) ( not ( = ?AUTO_4812 ?AUTO_4816 ) ) ( not ( = ?AUTO_4813 ?AUTO_4816 ) ) ( not ( = ?AUTO_4815 ?AUTO_4816 ) ) ( not ( = ?AUTO_4814 ?AUTO_4816 ) ) ( ON ?AUTO_4816 ?AUTO_4814 ) ( CLEAR ?AUTO_4816 ) ( ON ?AUTO_4812 ?AUTO_4810 ) ( ON ?AUTO_4815 ?AUTO_4812 ) ( CLEAR ?AUTO_4815 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4815 ?AUTO_4812 )
      ( MAKE-ON ?AUTO_4810 ?AUTO_4811 )
      ( MAKE-ON-VERIFY ?AUTO_4810 ?AUTO_4811 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4817 - BLOCK
      ?AUTO_4818 - BLOCK
    )
    :vars
    (
      ?AUTO_4820 - BLOCK
      ?AUTO_4821 - BLOCK
      ?AUTO_4823 - BLOCK
      ?AUTO_4822 - BLOCK
      ?AUTO_4819 - BLOCK
      ?AUTO_4824 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4817 ?AUTO_4818 ) ) ( ON-TABLE ?AUTO_4817 ) ( not ( = ?AUTO_4817 ?AUTO_4820 ) ) ( not ( = ?AUTO_4817 ?AUTO_4821 ) ) ( not ( = ?AUTO_4818 ?AUTO_4820 ) ) ( not ( = ?AUTO_4818 ?AUTO_4821 ) ) ( not ( = ?AUTO_4820 ?AUTO_4821 ) ) ( ON ?AUTO_4820 ?AUTO_4818 ) ( not ( = ?AUTO_4817 ?AUTO_4823 ) ) ( not ( = ?AUTO_4817 ?AUTO_4822 ) ) ( not ( = ?AUTO_4818 ?AUTO_4823 ) ) ( not ( = ?AUTO_4818 ?AUTO_4822 ) ) ( not ( = ?AUTO_4821 ?AUTO_4823 ) ) ( not ( = ?AUTO_4821 ?AUTO_4822 ) ) ( not ( = ?AUTO_4820 ?AUTO_4823 ) ) ( not ( = ?AUTO_4820 ?AUTO_4822 ) ) ( not ( = ?AUTO_4823 ?AUTO_4822 ) ) ( ON ?AUTO_4823 ?AUTO_4820 ) ( not ( = ?AUTO_4817 ?AUTO_4819 ) ) ( not ( = ?AUTO_4818 ?AUTO_4819 ) ) ( not ( = ?AUTO_4821 ?AUTO_4819 ) ) ( not ( = ?AUTO_4820 ?AUTO_4819 ) ) ( not ( = ?AUTO_4822 ?AUTO_4819 ) ) ( not ( = ?AUTO_4823 ?AUTO_4819 ) ) ( ON ?AUTO_4819 ?AUTO_4823 ) ( CLEAR ?AUTO_4819 ) ( ON ?AUTO_4821 ?AUTO_4817 ) ( ON ?AUTO_4822 ?AUTO_4821 ) ( CLEAR ?AUTO_4822 ) ( HOLDING ?AUTO_4824 ) ( not ( = ?AUTO_4817 ?AUTO_4824 ) ) ( not ( = ?AUTO_4818 ?AUTO_4824 ) ) ( not ( = ?AUTO_4820 ?AUTO_4824 ) ) ( not ( = ?AUTO_4821 ?AUTO_4824 ) ) ( not ( = ?AUTO_4823 ?AUTO_4824 ) ) ( not ( = ?AUTO_4822 ?AUTO_4824 ) ) ( not ( = ?AUTO_4819 ?AUTO_4824 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4824 )
      ( MAKE-ON ?AUTO_4817 ?AUTO_4818 )
      ( MAKE-ON-VERIFY ?AUTO_4817 ?AUTO_4818 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2075 - BLOCK
      ?AUTO_2076 - BLOCK
    )
    :vars
    (
      ?AUTO_2081 - BLOCK
      ?AUTO_2082 - BLOCK
      ?AUTO_2083 - BLOCK
      ?AUTO_2077 - BLOCK
      ?AUTO_2078 - BLOCK
      ?AUTO_2080 - BLOCK
      ?AUTO_2079 - BLOCK
      ?AUTO_2084 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2075 ?AUTO_2076 ) ) ( ON-TABLE ?AUTO_2075 ) ( not ( = ?AUTO_2075 ?AUTO_2081 ) ) ( not ( = ?AUTO_2075 ?AUTO_2082 ) ) ( not ( = ?AUTO_2076 ?AUTO_2081 ) ) ( not ( = ?AUTO_2076 ?AUTO_2082 ) ) ( not ( = ?AUTO_2081 ?AUTO_2082 ) ) ( CLEAR ?AUTO_2083 ) ( not ( = ?AUTO_2075 ?AUTO_2083 ) ) ( not ( = ?AUTO_2076 ?AUTO_2083 ) ) ( not ( = ?AUTO_2081 ?AUTO_2083 ) ) ( not ( = ?AUTO_2082 ?AUTO_2083 ) ) ( ON ?AUTO_2082 ?AUTO_2076 ) ( not ( = ?AUTO_2075 ?AUTO_2077 ) ) ( not ( = ?AUTO_2076 ?AUTO_2077 ) ) ( not ( = ?AUTO_2081 ?AUTO_2077 ) ) ( not ( = ?AUTO_2082 ?AUTO_2077 ) ) ( not ( = ?AUTO_2083 ?AUTO_2077 ) ) ( ON ?AUTO_2077 ?AUTO_2082 ) ( ON ?AUTO_2081 ?AUTO_2077 ) ( CLEAR ?AUTO_2081 ) ( CLEAR ?AUTO_2078 ) ( not ( = ?AUTO_2075 ?AUTO_2080 ) ) ( not ( = ?AUTO_2075 ?AUTO_2078 ) ) ( not ( = ?AUTO_2076 ?AUTO_2080 ) ) ( not ( = ?AUTO_2076 ?AUTO_2078 ) ) ( not ( = ?AUTO_2081 ?AUTO_2080 ) ) ( not ( = ?AUTO_2081 ?AUTO_2078 ) ) ( not ( = ?AUTO_2082 ?AUTO_2080 ) ) ( not ( = ?AUTO_2082 ?AUTO_2078 ) ) ( not ( = ?AUTO_2083 ?AUTO_2080 ) ) ( not ( = ?AUTO_2083 ?AUTO_2078 ) ) ( not ( = ?AUTO_2077 ?AUTO_2080 ) ) ( not ( = ?AUTO_2077 ?AUTO_2078 ) ) ( not ( = ?AUTO_2080 ?AUTO_2078 ) ) ( ON ?AUTO_2080 ?AUTO_2075 ) ( not ( = ?AUTO_2075 ?AUTO_2079 ) ) ( not ( = ?AUTO_2076 ?AUTO_2079 ) ) ( not ( = ?AUTO_2081 ?AUTO_2079 ) ) ( not ( = ?AUTO_2082 ?AUTO_2079 ) ) ( not ( = ?AUTO_2083 ?AUTO_2079 ) ) ( not ( = ?AUTO_2077 ?AUTO_2079 ) ) ( not ( = ?AUTO_2078 ?AUTO_2079 ) ) ( not ( = ?AUTO_2080 ?AUTO_2079 ) ) ( ON ?AUTO_2079 ?AUTO_2080 ) ( not ( = ?AUTO_2075 ?AUTO_2084 ) ) ( not ( = ?AUTO_2076 ?AUTO_2084 ) ) ( not ( = ?AUTO_2081 ?AUTO_2084 ) ) ( not ( = ?AUTO_2082 ?AUTO_2084 ) ) ( not ( = ?AUTO_2083 ?AUTO_2084 ) ) ( not ( = ?AUTO_2077 ?AUTO_2084 ) ) ( not ( = ?AUTO_2078 ?AUTO_2084 ) ) ( not ( = ?AUTO_2080 ?AUTO_2084 ) ) ( not ( = ?AUTO_2079 ?AUTO_2084 ) ) ( ON ?AUTO_2084 ?AUTO_2079 ) ( CLEAR ?AUTO_2084 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2084 ?AUTO_2079 )
      ( MAKE-ON ?AUTO_2075 ?AUTO_2076 )
      ( MAKE-ON-VERIFY ?AUTO_2075 ?AUTO_2076 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2085 - BLOCK
      ?AUTO_2086 - BLOCK
    )
    :vars
    (
      ?AUTO_2092 - BLOCK
      ?AUTO_2091 - BLOCK
      ?AUTO_2094 - BLOCK
      ?AUTO_2089 - BLOCK
      ?AUTO_2090 - BLOCK
      ?AUTO_2093 - BLOCK
      ?AUTO_2087 - BLOCK
      ?AUTO_2088 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2085 ?AUTO_2086 ) ) ( ON-TABLE ?AUTO_2085 ) ( not ( = ?AUTO_2085 ?AUTO_2092 ) ) ( not ( = ?AUTO_2085 ?AUTO_2091 ) ) ( not ( = ?AUTO_2086 ?AUTO_2092 ) ) ( not ( = ?AUTO_2086 ?AUTO_2091 ) ) ( not ( = ?AUTO_2092 ?AUTO_2091 ) ) ( not ( = ?AUTO_2085 ?AUTO_2094 ) ) ( not ( = ?AUTO_2086 ?AUTO_2094 ) ) ( not ( = ?AUTO_2092 ?AUTO_2094 ) ) ( not ( = ?AUTO_2091 ?AUTO_2094 ) ) ( ON ?AUTO_2091 ?AUTO_2086 ) ( not ( = ?AUTO_2085 ?AUTO_2089 ) ) ( not ( = ?AUTO_2086 ?AUTO_2089 ) ) ( not ( = ?AUTO_2092 ?AUTO_2089 ) ) ( not ( = ?AUTO_2091 ?AUTO_2089 ) ) ( not ( = ?AUTO_2094 ?AUTO_2089 ) ) ( ON ?AUTO_2089 ?AUTO_2091 ) ( ON ?AUTO_2092 ?AUTO_2089 ) ( CLEAR ?AUTO_2092 ) ( CLEAR ?AUTO_2090 ) ( not ( = ?AUTO_2085 ?AUTO_2093 ) ) ( not ( = ?AUTO_2085 ?AUTO_2090 ) ) ( not ( = ?AUTO_2086 ?AUTO_2093 ) ) ( not ( = ?AUTO_2086 ?AUTO_2090 ) ) ( not ( = ?AUTO_2092 ?AUTO_2093 ) ) ( not ( = ?AUTO_2092 ?AUTO_2090 ) ) ( not ( = ?AUTO_2091 ?AUTO_2093 ) ) ( not ( = ?AUTO_2091 ?AUTO_2090 ) ) ( not ( = ?AUTO_2094 ?AUTO_2093 ) ) ( not ( = ?AUTO_2094 ?AUTO_2090 ) ) ( not ( = ?AUTO_2089 ?AUTO_2093 ) ) ( not ( = ?AUTO_2089 ?AUTO_2090 ) ) ( not ( = ?AUTO_2093 ?AUTO_2090 ) ) ( ON ?AUTO_2093 ?AUTO_2085 ) ( not ( = ?AUTO_2085 ?AUTO_2087 ) ) ( not ( = ?AUTO_2086 ?AUTO_2087 ) ) ( not ( = ?AUTO_2092 ?AUTO_2087 ) ) ( not ( = ?AUTO_2091 ?AUTO_2087 ) ) ( not ( = ?AUTO_2094 ?AUTO_2087 ) ) ( not ( = ?AUTO_2089 ?AUTO_2087 ) ) ( not ( = ?AUTO_2090 ?AUTO_2087 ) ) ( not ( = ?AUTO_2093 ?AUTO_2087 ) ) ( ON ?AUTO_2087 ?AUTO_2093 ) ( not ( = ?AUTO_2085 ?AUTO_2088 ) ) ( not ( = ?AUTO_2086 ?AUTO_2088 ) ) ( not ( = ?AUTO_2092 ?AUTO_2088 ) ) ( not ( = ?AUTO_2091 ?AUTO_2088 ) ) ( not ( = ?AUTO_2094 ?AUTO_2088 ) ) ( not ( = ?AUTO_2089 ?AUTO_2088 ) ) ( not ( = ?AUTO_2090 ?AUTO_2088 ) ) ( not ( = ?AUTO_2093 ?AUTO_2088 ) ) ( not ( = ?AUTO_2087 ?AUTO_2088 ) ) ( ON ?AUTO_2088 ?AUTO_2087 ) ( CLEAR ?AUTO_2088 ) ( HOLDING ?AUTO_2094 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2094 )
      ( MAKE-ON ?AUTO_2085 ?AUTO_2086 )
      ( MAKE-ON-VERIFY ?AUTO_2085 ?AUTO_2086 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2095 - BLOCK
      ?AUTO_2096 - BLOCK
    )
    :vars
    (
      ?AUTO_2100 - BLOCK
      ?AUTO_2097 - BLOCK
      ?AUTO_2102 - BLOCK
      ?AUTO_2098 - BLOCK
      ?AUTO_2099 - BLOCK
      ?AUTO_2103 - BLOCK
      ?AUTO_2101 - BLOCK
      ?AUTO_2104 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2095 ?AUTO_2096 ) ) ( ON-TABLE ?AUTO_2095 ) ( not ( = ?AUTO_2095 ?AUTO_2100 ) ) ( not ( = ?AUTO_2095 ?AUTO_2097 ) ) ( not ( = ?AUTO_2096 ?AUTO_2100 ) ) ( not ( = ?AUTO_2096 ?AUTO_2097 ) ) ( not ( = ?AUTO_2100 ?AUTO_2097 ) ) ( not ( = ?AUTO_2095 ?AUTO_2102 ) ) ( not ( = ?AUTO_2096 ?AUTO_2102 ) ) ( not ( = ?AUTO_2100 ?AUTO_2102 ) ) ( not ( = ?AUTO_2097 ?AUTO_2102 ) ) ( ON ?AUTO_2097 ?AUTO_2096 ) ( not ( = ?AUTO_2095 ?AUTO_2098 ) ) ( not ( = ?AUTO_2096 ?AUTO_2098 ) ) ( not ( = ?AUTO_2100 ?AUTO_2098 ) ) ( not ( = ?AUTO_2097 ?AUTO_2098 ) ) ( not ( = ?AUTO_2102 ?AUTO_2098 ) ) ( ON ?AUTO_2098 ?AUTO_2097 ) ( ON ?AUTO_2100 ?AUTO_2098 ) ( CLEAR ?AUTO_2100 ) ( CLEAR ?AUTO_2099 ) ( not ( = ?AUTO_2095 ?AUTO_2103 ) ) ( not ( = ?AUTO_2095 ?AUTO_2099 ) ) ( not ( = ?AUTO_2096 ?AUTO_2103 ) ) ( not ( = ?AUTO_2096 ?AUTO_2099 ) ) ( not ( = ?AUTO_2100 ?AUTO_2103 ) ) ( not ( = ?AUTO_2100 ?AUTO_2099 ) ) ( not ( = ?AUTO_2097 ?AUTO_2103 ) ) ( not ( = ?AUTO_2097 ?AUTO_2099 ) ) ( not ( = ?AUTO_2102 ?AUTO_2103 ) ) ( not ( = ?AUTO_2102 ?AUTO_2099 ) ) ( not ( = ?AUTO_2098 ?AUTO_2103 ) ) ( not ( = ?AUTO_2098 ?AUTO_2099 ) ) ( not ( = ?AUTO_2103 ?AUTO_2099 ) ) ( ON ?AUTO_2103 ?AUTO_2095 ) ( not ( = ?AUTO_2095 ?AUTO_2101 ) ) ( not ( = ?AUTO_2096 ?AUTO_2101 ) ) ( not ( = ?AUTO_2100 ?AUTO_2101 ) ) ( not ( = ?AUTO_2097 ?AUTO_2101 ) ) ( not ( = ?AUTO_2102 ?AUTO_2101 ) ) ( not ( = ?AUTO_2098 ?AUTO_2101 ) ) ( not ( = ?AUTO_2099 ?AUTO_2101 ) ) ( not ( = ?AUTO_2103 ?AUTO_2101 ) ) ( ON ?AUTO_2101 ?AUTO_2103 ) ( not ( = ?AUTO_2095 ?AUTO_2104 ) ) ( not ( = ?AUTO_2096 ?AUTO_2104 ) ) ( not ( = ?AUTO_2100 ?AUTO_2104 ) ) ( not ( = ?AUTO_2097 ?AUTO_2104 ) ) ( not ( = ?AUTO_2102 ?AUTO_2104 ) ) ( not ( = ?AUTO_2098 ?AUTO_2104 ) ) ( not ( = ?AUTO_2099 ?AUTO_2104 ) ) ( not ( = ?AUTO_2103 ?AUTO_2104 ) ) ( not ( = ?AUTO_2101 ?AUTO_2104 ) ) ( ON ?AUTO_2104 ?AUTO_2101 ) ( ON ?AUTO_2102 ?AUTO_2104 ) ( CLEAR ?AUTO_2102 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2102 ?AUTO_2104 )
      ( MAKE-ON ?AUTO_2095 ?AUTO_2096 )
      ( MAKE-ON-VERIFY ?AUTO_2095 ?AUTO_2096 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4159 - BLOCK
      ?AUTO_4160 - BLOCK
    )
    :vars
    (
      ?AUTO_4163 - BLOCK
      ?AUTO_4161 - BLOCK
      ?AUTO_4162 - BLOCK
      ?AUTO_4164 - BLOCK
      ?AUTO_4165 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4159 ?AUTO_4160 ) ) ( ON ?AUTO_4159 ?AUTO_4163 ) ( CLEAR ?AUTO_4159 ) ( not ( = ?AUTO_4159 ?AUTO_4163 ) ) ( not ( = ?AUTO_4160 ?AUTO_4163 ) ) ( not ( = ?AUTO_4159 ?AUTO_4161 ) ) ( not ( = ?AUTO_4160 ?AUTO_4161 ) ) ( not ( = ?AUTO_4163 ?AUTO_4161 ) ) ( ON ?AUTO_4161 ?AUTO_4160 ) ( not ( = ?AUTO_4159 ?AUTO_4162 ) ) ( not ( = ?AUTO_4160 ?AUTO_4162 ) ) ( not ( = ?AUTO_4163 ?AUTO_4162 ) ) ( not ( = ?AUTO_4161 ?AUTO_4162 ) ) ( ON ?AUTO_4162 ?AUTO_4161 ) ( CLEAR ?AUTO_4162 ) ( HOLDING ?AUTO_4164 ) ( CLEAR ?AUTO_4165 ) ( not ( = ?AUTO_4159 ?AUTO_4164 ) ) ( not ( = ?AUTO_4159 ?AUTO_4165 ) ) ( not ( = ?AUTO_4160 ?AUTO_4164 ) ) ( not ( = ?AUTO_4160 ?AUTO_4165 ) ) ( not ( = ?AUTO_4163 ?AUTO_4164 ) ) ( not ( = ?AUTO_4163 ?AUTO_4165 ) ) ( not ( = ?AUTO_4161 ?AUTO_4164 ) ) ( not ( = ?AUTO_4161 ?AUTO_4165 ) ) ( not ( = ?AUTO_4162 ?AUTO_4164 ) ) ( not ( = ?AUTO_4162 ?AUTO_4165 ) ) ( not ( = ?AUTO_4164 ?AUTO_4165 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4164 ?AUTO_4165 )
      ( MAKE-ON ?AUTO_4159 ?AUTO_4160 )
      ( MAKE-ON-VERIFY ?AUTO_4159 ?AUTO_4160 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2844 - BLOCK
      ?AUTO_2845 - BLOCK
    )
    :vars
    (
      ?AUTO_2847 - BLOCK
      ?AUTO_2846 - BLOCK
      ?AUTO_2848 - BLOCK
      ?AUTO_2849 - BLOCK
      ?AUTO_2850 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2844 ?AUTO_2845 ) ) ( ON ?AUTO_2844 ?AUTO_2847 ) ( not ( = ?AUTO_2844 ?AUTO_2847 ) ) ( not ( = ?AUTO_2845 ?AUTO_2847 ) ) ( CLEAR ?AUTO_2846 ) ( not ( = ?AUTO_2844 ?AUTO_2848 ) ) ( not ( = ?AUTO_2844 ?AUTO_2846 ) ) ( not ( = ?AUTO_2845 ?AUTO_2848 ) ) ( not ( = ?AUTO_2845 ?AUTO_2846 ) ) ( not ( = ?AUTO_2847 ?AUTO_2848 ) ) ( not ( = ?AUTO_2847 ?AUTO_2846 ) ) ( not ( = ?AUTO_2848 ?AUTO_2846 ) ) ( ON ?AUTO_2848 ?AUTO_2845 ) ( not ( = ?AUTO_2844 ?AUTO_2849 ) ) ( not ( = ?AUTO_2845 ?AUTO_2849 ) ) ( not ( = ?AUTO_2847 ?AUTO_2849 ) ) ( not ( = ?AUTO_2846 ?AUTO_2849 ) ) ( not ( = ?AUTO_2848 ?AUTO_2849 ) ) ( ON ?AUTO_2849 ?AUTO_2848 ) ( CLEAR ?AUTO_2849 ) ( not ( = ?AUTO_2844 ?AUTO_2850 ) ) ( not ( = ?AUTO_2845 ?AUTO_2850 ) ) ( not ( = ?AUTO_2847 ?AUTO_2850 ) ) ( not ( = ?AUTO_2846 ?AUTO_2850 ) ) ( not ( = ?AUTO_2848 ?AUTO_2850 ) ) ( not ( = ?AUTO_2849 ?AUTO_2850 ) ) ( ON ?AUTO_2850 ?AUTO_2844 ) ( CLEAR ?AUTO_2850 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2850 ?AUTO_2844 )
      ( MAKE-ON ?AUTO_2844 ?AUTO_2845 )
      ( MAKE-ON-VERIFY ?AUTO_2844 ?AUTO_2845 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2233 - BLOCK
      ?AUTO_2234 - BLOCK
    )
    :vars
    (
      ?AUTO_2238 - BLOCK
      ?AUTO_2236 - BLOCK
      ?AUTO_2240 - BLOCK
      ?AUTO_2235 - BLOCK
      ?AUTO_2239 - BLOCK
      ?AUTO_2237 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2233 ?AUTO_2234 ) ) ( ON ?AUTO_2233 ?AUTO_2238 ) ( not ( = ?AUTO_2233 ?AUTO_2238 ) ) ( not ( = ?AUTO_2234 ?AUTO_2238 ) ) ( not ( = ?AUTO_2233 ?AUTO_2236 ) ) ( not ( = ?AUTO_2233 ?AUTO_2240 ) ) ( not ( = ?AUTO_2234 ?AUTO_2236 ) ) ( not ( = ?AUTO_2234 ?AUTO_2240 ) ) ( not ( = ?AUTO_2238 ?AUTO_2236 ) ) ( not ( = ?AUTO_2238 ?AUTO_2240 ) ) ( not ( = ?AUTO_2236 ?AUTO_2240 ) ) ( ON ?AUTO_2236 ?AUTO_2234 ) ( not ( = ?AUTO_2233 ?AUTO_2235 ) ) ( not ( = ?AUTO_2234 ?AUTO_2235 ) ) ( not ( = ?AUTO_2238 ?AUTO_2235 ) ) ( not ( = ?AUTO_2240 ?AUTO_2235 ) ) ( not ( = ?AUTO_2236 ?AUTO_2235 ) ) ( ON ?AUTO_2235 ?AUTO_2236 ) ( CLEAR ?AUTO_2235 ) ( CLEAR ?AUTO_2239 ) ( not ( = ?AUTO_2233 ?AUTO_2237 ) ) ( not ( = ?AUTO_2233 ?AUTO_2239 ) ) ( not ( = ?AUTO_2234 ?AUTO_2237 ) ) ( not ( = ?AUTO_2234 ?AUTO_2239 ) ) ( not ( = ?AUTO_2238 ?AUTO_2237 ) ) ( not ( = ?AUTO_2238 ?AUTO_2239 ) ) ( not ( = ?AUTO_2240 ?AUTO_2237 ) ) ( not ( = ?AUTO_2240 ?AUTO_2239 ) ) ( not ( = ?AUTO_2236 ?AUTO_2237 ) ) ( not ( = ?AUTO_2236 ?AUTO_2239 ) ) ( not ( = ?AUTO_2235 ?AUTO_2237 ) ) ( not ( = ?AUTO_2235 ?AUTO_2239 ) ) ( not ( = ?AUTO_2237 ?AUTO_2239 ) ) ( ON ?AUTO_2237 ?AUTO_2233 ) ( CLEAR ?AUTO_2237 ) ( HOLDING ?AUTO_2240 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2240 )
      ( MAKE-ON ?AUTO_2233 ?AUTO_2234 )
      ( MAKE-ON-VERIFY ?AUTO_2233 ?AUTO_2234 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2245 - BLOCK
      ?AUTO_2246 - BLOCK
    )
    :vars
    (
      ?AUTO_2252 - BLOCK
      ?AUTO_2250 - BLOCK
      ?AUTO_2251 - BLOCK
      ?AUTO_2249 - BLOCK
      ?AUTO_2247 - BLOCK
      ?AUTO_2248 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2245 ?AUTO_2246 ) ) ( ON ?AUTO_2245 ?AUTO_2252 ) ( not ( = ?AUTO_2245 ?AUTO_2252 ) ) ( not ( = ?AUTO_2246 ?AUTO_2252 ) ) ( not ( = ?AUTO_2245 ?AUTO_2250 ) ) ( not ( = ?AUTO_2245 ?AUTO_2251 ) ) ( not ( = ?AUTO_2246 ?AUTO_2250 ) ) ( not ( = ?AUTO_2246 ?AUTO_2251 ) ) ( not ( = ?AUTO_2252 ?AUTO_2250 ) ) ( not ( = ?AUTO_2252 ?AUTO_2251 ) ) ( not ( = ?AUTO_2250 ?AUTO_2251 ) ) ( ON ?AUTO_2250 ?AUTO_2246 ) ( not ( = ?AUTO_2245 ?AUTO_2249 ) ) ( not ( = ?AUTO_2246 ?AUTO_2249 ) ) ( not ( = ?AUTO_2252 ?AUTO_2249 ) ) ( not ( = ?AUTO_2251 ?AUTO_2249 ) ) ( not ( = ?AUTO_2250 ?AUTO_2249 ) ) ( ON ?AUTO_2249 ?AUTO_2250 ) ( CLEAR ?AUTO_2247 ) ( not ( = ?AUTO_2245 ?AUTO_2248 ) ) ( not ( = ?AUTO_2245 ?AUTO_2247 ) ) ( not ( = ?AUTO_2246 ?AUTO_2248 ) ) ( not ( = ?AUTO_2246 ?AUTO_2247 ) ) ( not ( = ?AUTO_2252 ?AUTO_2248 ) ) ( not ( = ?AUTO_2252 ?AUTO_2247 ) ) ( not ( = ?AUTO_2251 ?AUTO_2248 ) ) ( not ( = ?AUTO_2251 ?AUTO_2247 ) ) ( not ( = ?AUTO_2250 ?AUTO_2248 ) ) ( not ( = ?AUTO_2250 ?AUTO_2247 ) ) ( not ( = ?AUTO_2249 ?AUTO_2248 ) ) ( not ( = ?AUTO_2249 ?AUTO_2247 ) ) ( not ( = ?AUTO_2248 ?AUTO_2247 ) ) ( ON ?AUTO_2248 ?AUTO_2245 ) ( CLEAR ?AUTO_2248 ) ( ON ?AUTO_2251 ?AUTO_2249 ) ( CLEAR ?AUTO_2251 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2251 ?AUTO_2249 )
      ( MAKE-ON ?AUTO_2245 ?AUTO_2246 )
      ( MAKE-ON-VERIFY ?AUTO_2245 ?AUTO_2246 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2325 - BLOCK
      ?AUTO_2326 - BLOCK
    )
    :vars
    (
      ?AUTO_2329 - BLOCK
      ?AUTO_2327 - BLOCK
      ?AUTO_2328 - BLOCK
      ?AUTO_2330 - BLOCK
      ?AUTO_2331 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2325 ?AUTO_2326 ) ) ( ON-TABLE ?AUTO_2325 ) ( CLEAR ?AUTO_2325 ) ( not ( = ?AUTO_2325 ?AUTO_2329 ) ) ( not ( = ?AUTO_2325 ?AUTO_2327 ) ) ( not ( = ?AUTO_2326 ?AUTO_2329 ) ) ( not ( = ?AUTO_2326 ?AUTO_2327 ) ) ( not ( = ?AUTO_2329 ?AUTO_2327 ) ) ( ON ?AUTO_2329 ?AUTO_2326 ) ( CLEAR ?AUTO_2328 ) ( not ( = ?AUTO_2325 ?AUTO_2328 ) ) ( not ( = ?AUTO_2326 ?AUTO_2328 ) ) ( not ( = ?AUTO_2329 ?AUTO_2328 ) ) ( not ( = ?AUTO_2327 ?AUTO_2328 ) ) ( ON ?AUTO_2327 ?AUTO_2329 ) ( CLEAR ?AUTO_2327 ) ( HOLDING ?AUTO_2330 ) ( CLEAR ?AUTO_2331 ) ( not ( = ?AUTO_2325 ?AUTO_2330 ) ) ( not ( = ?AUTO_2325 ?AUTO_2331 ) ) ( not ( = ?AUTO_2326 ?AUTO_2330 ) ) ( not ( = ?AUTO_2326 ?AUTO_2331 ) ) ( not ( = ?AUTO_2329 ?AUTO_2330 ) ) ( not ( = ?AUTO_2329 ?AUTO_2331 ) ) ( not ( = ?AUTO_2327 ?AUTO_2330 ) ) ( not ( = ?AUTO_2327 ?AUTO_2331 ) ) ( not ( = ?AUTO_2328 ?AUTO_2330 ) ) ( not ( = ?AUTO_2328 ?AUTO_2331 ) ) ( not ( = ?AUTO_2330 ?AUTO_2331 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2330 ?AUTO_2331 )
      ( MAKE-ON ?AUTO_2325 ?AUTO_2326 )
      ( MAKE-ON-VERIFY ?AUTO_2325 ?AUTO_2326 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5745 - BLOCK
      ?AUTO_5746 - BLOCK
    )
    :vars
    (
      ?AUTO_5748 - BLOCK
      ?AUTO_5747 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5745 ?AUTO_5746 ) ) ( ON-TABLE ?AUTO_5745 ) ( not ( = ?AUTO_5745 ?AUTO_5748 ) ) ( not ( = ?AUTO_5745 ?AUTO_5747 ) ) ( not ( = ?AUTO_5746 ?AUTO_5748 ) ) ( not ( = ?AUTO_5746 ?AUTO_5747 ) ) ( not ( = ?AUTO_5748 ?AUTO_5747 ) ) ( ON ?AUTO_5748 ?AUTO_5746 ) ( CLEAR ?AUTO_5748 ) ( ON ?AUTO_5747 ?AUTO_5745 ) ( CLEAR ?AUTO_5747 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5747 ?AUTO_5745 )
      ( MAKE-ON ?AUTO_5745 ?AUTO_5746 )
      ( MAKE-ON-VERIFY ?AUTO_5745 ?AUTO_5746 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2467 - BLOCK
      ?AUTO_2468 - BLOCK
    )
    :vars
    (
      ?AUTO_2470 - BLOCK
      ?AUTO_2469 - BLOCK
      ?AUTO_2471 - BLOCK
      ?AUTO_2472 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2467 ?AUTO_2468 ) ) ( ON ?AUTO_2467 ?AUTO_2470 ) ( CLEAR ?AUTO_2467 ) ( not ( = ?AUTO_2467 ?AUTO_2470 ) ) ( not ( = ?AUTO_2468 ?AUTO_2470 ) ) ( not ( = ?AUTO_2467 ?AUTO_2469 ) ) ( not ( = ?AUTO_2467 ?AUTO_2471 ) ) ( not ( = ?AUTO_2468 ?AUTO_2469 ) ) ( not ( = ?AUTO_2468 ?AUTO_2471 ) ) ( not ( = ?AUTO_2470 ?AUTO_2469 ) ) ( not ( = ?AUTO_2470 ?AUTO_2471 ) ) ( not ( = ?AUTO_2469 ?AUTO_2471 ) ) ( ON ?AUTO_2469 ?AUTO_2468 ) ( CLEAR ?AUTO_2469 ) ( HOLDING ?AUTO_2471 ) ( CLEAR ?AUTO_2472 ) ( not ( = ?AUTO_2467 ?AUTO_2472 ) ) ( not ( = ?AUTO_2468 ?AUTO_2472 ) ) ( not ( = ?AUTO_2470 ?AUTO_2472 ) ) ( not ( = ?AUTO_2469 ?AUTO_2472 ) ) ( not ( = ?AUTO_2471 ?AUTO_2472 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2471 ?AUTO_2472 )
      ( MAKE-ON ?AUTO_2467 ?AUTO_2468 )
      ( MAKE-ON-VERIFY ?AUTO_2467 ?AUTO_2468 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2479 - BLOCK
      ?AUTO_2480 - BLOCK
    )
    :vars
    (
      ?AUTO_2481 - BLOCK
      ?AUTO_2482 - BLOCK
      ?AUTO_2484 - BLOCK
      ?AUTO_2483 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2479 ?AUTO_2480 ) ) ( ON ?AUTO_2479 ?AUTO_2481 ) ( not ( = ?AUTO_2479 ?AUTO_2481 ) ) ( not ( = ?AUTO_2480 ?AUTO_2481 ) ) ( not ( = ?AUTO_2479 ?AUTO_2482 ) ) ( not ( = ?AUTO_2479 ?AUTO_2484 ) ) ( not ( = ?AUTO_2480 ?AUTO_2482 ) ) ( not ( = ?AUTO_2480 ?AUTO_2484 ) ) ( not ( = ?AUTO_2481 ?AUTO_2482 ) ) ( not ( = ?AUTO_2481 ?AUTO_2484 ) ) ( not ( = ?AUTO_2482 ?AUTO_2484 ) ) ( ON ?AUTO_2482 ?AUTO_2480 ) ( CLEAR ?AUTO_2482 ) ( not ( = ?AUTO_2479 ?AUTO_2483 ) ) ( not ( = ?AUTO_2480 ?AUTO_2483 ) ) ( not ( = ?AUTO_2481 ?AUTO_2483 ) ) ( not ( = ?AUTO_2482 ?AUTO_2483 ) ) ( not ( = ?AUTO_2484 ?AUTO_2483 ) ) ( ON ?AUTO_2484 ?AUTO_2479 ) ( CLEAR ?AUTO_2484 ) ( HOLDING ?AUTO_2483 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2483 )
      ( MAKE-ON ?AUTO_2479 ?AUTO_2480 )
      ( MAKE-ON-VERIFY ?AUTO_2479 ?AUTO_2480 ) )
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
      ?AUTO_2489 - BLOCK
      ?AUTO_2488 - BLOCK
      ?AUTO_2490 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2485 ?AUTO_2486 ) ) ( ON ?AUTO_2485 ?AUTO_2487 ) ( not ( = ?AUTO_2485 ?AUTO_2487 ) ) ( not ( = ?AUTO_2486 ?AUTO_2487 ) ) ( not ( = ?AUTO_2485 ?AUTO_2489 ) ) ( not ( = ?AUTO_2485 ?AUTO_2488 ) ) ( not ( = ?AUTO_2486 ?AUTO_2489 ) ) ( not ( = ?AUTO_2486 ?AUTO_2488 ) ) ( not ( = ?AUTO_2487 ?AUTO_2489 ) ) ( not ( = ?AUTO_2487 ?AUTO_2488 ) ) ( not ( = ?AUTO_2489 ?AUTO_2488 ) ) ( ON ?AUTO_2489 ?AUTO_2486 ) ( CLEAR ?AUTO_2489 ) ( not ( = ?AUTO_2485 ?AUTO_2490 ) ) ( not ( = ?AUTO_2486 ?AUTO_2490 ) ) ( not ( = ?AUTO_2487 ?AUTO_2490 ) ) ( not ( = ?AUTO_2489 ?AUTO_2490 ) ) ( not ( = ?AUTO_2488 ?AUTO_2490 ) ) ( ON ?AUTO_2488 ?AUTO_2485 ) ( ON ?AUTO_2490 ?AUTO_2488 ) ( CLEAR ?AUTO_2490 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2490 ?AUTO_2488 )
      ( MAKE-ON ?AUTO_2485 ?AUTO_2486 )
      ( MAKE-ON-VERIFY ?AUTO_2485 ?AUTO_2486 ) )
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
      ?AUTO_2589 - BLOCK
      ?AUTO_2590 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2586 ?AUTO_2587 ) ) ( ON-TABLE ?AUTO_2586 ) ( CLEAR ?AUTO_2588 ) ( not ( = ?AUTO_2586 ?AUTO_2588 ) ) ( not ( = ?AUTO_2587 ?AUTO_2588 ) ) ( ON ?AUTO_2587 ?AUTO_2586 ) ( CLEAR ?AUTO_2587 ) ( HOLDING ?AUTO_2589 ) ( CLEAR ?AUTO_2590 ) ( not ( = ?AUTO_2586 ?AUTO_2589 ) ) ( not ( = ?AUTO_2586 ?AUTO_2590 ) ) ( not ( = ?AUTO_2587 ?AUTO_2589 ) ) ( not ( = ?AUTO_2587 ?AUTO_2590 ) ) ( not ( = ?AUTO_2588 ?AUTO_2589 ) ) ( not ( = ?AUTO_2588 ?AUTO_2590 ) ) ( not ( = ?AUTO_2589 ?AUTO_2590 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2589 ?AUTO_2590 )
      ( MAKE-ON ?AUTO_2586 ?AUTO_2587 )
      ( MAKE-ON-VERIFY ?AUTO_2586 ?AUTO_2587 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2591 - BLOCK
      ?AUTO_2592 - BLOCK
    )
    :vars
    (
      ?AUTO_2594 - BLOCK
      ?AUTO_2595 - BLOCK
      ?AUTO_2593 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2591 ?AUTO_2592 ) ) ( ON-TABLE ?AUTO_2591 ) ( CLEAR ?AUTO_2594 ) ( not ( = ?AUTO_2591 ?AUTO_2594 ) ) ( not ( = ?AUTO_2592 ?AUTO_2594 ) ) ( ON ?AUTO_2592 ?AUTO_2591 ) ( CLEAR ?AUTO_2595 ) ( not ( = ?AUTO_2591 ?AUTO_2593 ) ) ( not ( = ?AUTO_2591 ?AUTO_2595 ) ) ( not ( = ?AUTO_2592 ?AUTO_2593 ) ) ( not ( = ?AUTO_2592 ?AUTO_2595 ) ) ( not ( = ?AUTO_2594 ?AUTO_2593 ) ) ( not ( = ?AUTO_2594 ?AUTO_2595 ) ) ( not ( = ?AUTO_2593 ?AUTO_2595 ) ) ( ON ?AUTO_2593 ?AUTO_2592 ) ( CLEAR ?AUTO_2593 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2593 ?AUTO_2592 )
      ( MAKE-ON ?AUTO_2591 ?AUTO_2592 )
      ( MAKE-ON-VERIFY ?AUTO_2591 ?AUTO_2592 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2596 - BLOCK
      ?AUTO_2597 - BLOCK
    )
    :vars
    (
      ?AUTO_2600 - BLOCK
      ?AUTO_2598 - BLOCK
      ?AUTO_2599 - BLOCK
      ?AUTO_2601 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2596 ?AUTO_2597 ) ) ( ON-TABLE ?AUTO_2596 ) ( not ( = ?AUTO_2596 ?AUTO_2600 ) ) ( not ( = ?AUTO_2597 ?AUTO_2600 ) ) ( ON ?AUTO_2597 ?AUTO_2596 ) ( CLEAR ?AUTO_2598 ) ( not ( = ?AUTO_2596 ?AUTO_2599 ) ) ( not ( = ?AUTO_2596 ?AUTO_2598 ) ) ( not ( = ?AUTO_2597 ?AUTO_2599 ) ) ( not ( = ?AUTO_2597 ?AUTO_2598 ) ) ( not ( = ?AUTO_2600 ?AUTO_2599 ) ) ( not ( = ?AUTO_2600 ?AUTO_2598 ) ) ( not ( = ?AUTO_2599 ?AUTO_2598 ) ) ( ON ?AUTO_2599 ?AUTO_2597 ) ( CLEAR ?AUTO_2599 ) ( HOLDING ?AUTO_2600 ) ( CLEAR ?AUTO_2601 ) ( not ( = ?AUTO_2596 ?AUTO_2601 ) ) ( not ( = ?AUTO_2597 ?AUTO_2601 ) ) ( not ( = ?AUTO_2600 ?AUTO_2601 ) ) ( not ( = ?AUTO_2598 ?AUTO_2601 ) ) ( not ( = ?AUTO_2599 ?AUTO_2601 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2600 ?AUTO_2601 )
      ( MAKE-ON ?AUTO_2596 ?AUTO_2597 )
      ( MAKE-ON-VERIFY ?AUTO_2596 ?AUTO_2597 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2657 - BLOCK
      ?AUTO_2658 - BLOCK
    )
    :vars
    (
      ?AUTO_2659 - BLOCK
      ?AUTO_2660 - BLOCK
      ?AUTO_2661 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2657 ?AUTO_2658 ) ) ( ON ?AUTO_2657 ?AUTO_2659 ) ( not ( = ?AUTO_2657 ?AUTO_2659 ) ) ( not ( = ?AUTO_2658 ?AUTO_2659 ) ) ( not ( = ?AUTO_2657 ?AUTO_2660 ) ) ( not ( = ?AUTO_2658 ?AUTO_2660 ) ) ( not ( = ?AUTO_2659 ?AUTO_2660 ) ) ( ON ?AUTO_2660 ?AUTO_2657 ) ( ON ?AUTO_2658 ?AUTO_2660 ) ( CLEAR ?AUTO_2658 ) ( HOLDING ?AUTO_2661 ) ( not ( = ?AUTO_2657 ?AUTO_2661 ) ) ( not ( = ?AUTO_2658 ?AUTO_2661 ) ) ( not ( = ?AUTO_2659 ?AUTO_2661 ) ) ( not ( = ?AUTO_2660 ?AUTO_2661 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2661 )
      ( MAKE-ON ?AUTO_2657 ?AUTO_2658 )
      ( MAKE-ON-VERIFY ?AUTO_2657 ?AUTO_2658 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2662 - BLOCK
      ?AUTO_2663 - BLOCK
    )
    :vars
    (
      ?AUTO_2664 - BLOCK
      ?AUTO_2665 - BLOCK
      ?AUTO_2666 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2662 ?AUTO_2663 ) ) ( ON ?AUTO_2662 ?AUTO_2664 ) ( not ( = ?AUTO_2662 ?AUTO_2664 ) ) ( not ( = ?AUTO_2663 ?AUTO_2664 ) ) ( not ( = ?AUTO_2662 ?AUTO_2665 ) ) ( not ( = ?AUTO_2663 ?AUTO_2665 ) ) ( not ( = ?AUTO_2664 ?AUTO_2665 ) ) ( ON ?AUTO_2665 ?AUTO_2662 ) ( ON ?AUTO_2663 ?AUTO_2665 ) ( not ( = ?AUTO_2662 ?AUTO_2666 ) ) ( not ( = ?AUTO_2663 ?AUTO_2666 ) ) ( not ( = ?AUTO_2664 ?AUTO_2666 ) ) ( not ( = ?AUTO_2665 ?AUTO_2666 ) ) ( ON ?AUTO_2666 ?AUTO_2663 ) ( CLEAR ?AUTO_2666 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2666 ?AUTO_2663 )
      ( MAKE-ON ?AUTO_2662 ?AUTO_2663 )
      ( MAKE-ON-VERIFY ?AUTO_2662 ?AUTO_2663 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2859 - BLOCK
      ?AUTO_2860 - BLOCK
    )
    :vars
    (
      ?AUTO_2864 - BLOCK
      ?AUTO_2863 - BLOCK
      ?AUTO_2865 - BLOCK
      ?AUTO_2861 - BLOCK
      ?AUTO_2862 - BLOCK
      ?AUTO_2866 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2859 ?AUTO_2860 ) ) ( ON ?AUTO_2859 ?AUTO_2864 ) ( not ( = ?AUTO_2859 ?AUTO_2864 ) ) ( not ( = ?AUTO_2860 ?AUTO_2864 ) ) ( CLEAR ?AUTO_2863 ) ( not ( = ?AUTO_2859 ?AUTO_2865 ) ) ( not ( = ?AUTO_2859 ?AUTO_2863 ) ) ( not ( = ?AUTO_2860 ?AUTO_2865 ) ) ( not ( = ?AUTO_2860 ?AUTO_2863 ) ) ( not ( = ?AUTO_2864 ?AUTO_2865 ) ) ( not ( = ?AUTO_2864 ?AUTO_2863 ) ) ( not ( = ?AUTO_2865 ?AUTO_2863 ) ) ( ON ?AUTO_2865 ?AUTO_2860 ) ( not ( = ?AUTO_2859 ?AUTO_2861 ) ) ( not ( = ?AUTO_2860 ?AUTO_2861 ) ) ( not ( = ?AUTO_2864 ?AUTO_2861 ) ) ( not ( = ?AUTO_2863 ?AUTO_2861 ) ) ( not ( = ?AUTO_2865 ?AUTO_2861 ) ) ( ON ?AUTO_2861 ?AUTO_2865 ) ( CLEAR ?AUTO_2861 ) ( not ( = ?AUTO_2859 ?AUTO_2862 ) ) ( not ( = ?AUTO_2860 ?AUTO_2862 ) ) ( not ( = ?AUTO_2864 ?AUTO_2862 ) ) ( not ( = ?AUTO_2863 ?AUTO_2862 ) ) ( not ( = ?AUTO_2865 ?AUTO_2862 ) ) ( not ( = ?AUTO_2861 ?AUTO_2862 ) ) ( ON ?AUTO_2862 ?AUTO_2859 ) ( not ( = ?AUTO_2859 ?AUTO_2866 ) ) ( not ( = ?AUTO_2860 ?AUTO_2866 ) ) ( not ( = ?AUTO_2864 ?AUTO_2866 ) ) ( not ( = ?AUTO_2863 ?AUTO_2866 ) ) ( not ( = ?AUTO_2865 ?AUTO_2866 ) ) ( not ( = ?AUTO_2861 ?AUTO_2866 ) ) ( not ( = ?AUTO_2862 ?AUTO_2866 ) ) ( ON ?AUTO_2866 ?AUTO_2862 ) ( CLEAR ?AUTO_2866 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2866 ?AUTO_2862 )
      ( MAKE-ON ?AUTO_2859 ?AUTO_2860 )
      ( MAKE-ON-VERIFY ?AUTO_2859 ?AUTO_2860 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2894 - BLOCK
      ?AUTO_2895 - BLOCK
    )
    :vars
    (
      ?AUTO_2896 - BLOCK
      ?AUTO_2897 - BLOCK
      ?AUTO_2898 - BLOCK
      ?AUTO_2899 - BLOCK
      ?AUTO_2900 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2894 ?AUTO_2895 ) ) ( ON ?AUTO_2894 ?AUTO_2896 ) ( not ( = ?AUTO_2894 ?AUTO_2896 ) ) ( not ( = ?AUTO_2895 ?AUTO_2896 ) ) ( not ( = ?AUTO_2894 ?AUTO_2897 ) ) ( not ( = ?AUTO_2894 ?AUTO_2898 ) ) ( not ( = ?AUTO_2895 ?AUTO_2897 ) ) ( not ( = ?AUTO_2895 ?AUTO_2898 ) ) ( not ( = ?AUTO_2896 ?AUTO_2897 ) ) ( not ( = ?AUTO_2896 ?AUTO_2898 ) ) ( not ( = ?AUTO_2897 ?AUTO_2898 ) ) ( ON ?AUTO_2897 ?AUTO_2895 ) ( CLEAR ?AUTO_2897 ) ( ON ?AUTO_2898 ?AUTO_2894 ) ( CLEAR ?AUTO_2898 ) ( HOLDING ?AUTO_2899 ) ( CLEAR ?AUTO_2900 ) ( not ( = ?AUTO_2894 ?AUTO_2899 ) ) ( not ( = ?AUTO_2894 ?AUTO_2900 ) ) ( not ( = ?AUTO_2895 ?AUTO_2899 ) ) ( not ( = ?AUTO_2895 ?AUTO_2900 ) ) ( not ( = ?AUTO_2896 ?AUTO_2899 ) ) ( not ( = ?AUTO_2896 ?AUTO_2900 ) ) ( not ( = ?AUTO_2897 ?AUTO_2899 ) ) ( not ( = ?AUTO_2897 ?AUTO_2900 ) ) ( not ( = ?AUTO_2898 ?AUTO_2899 ) ) ( not ( = ?AUTO_2898 ?AUTO_2900 ) ) ( not ( = ?AUTO_2899 ?AUTO_2900 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2899 ?AUTO_2900 )
      ( MAKE-ON ?AUTO_2894 ?AUTO_2895 )
      ( MAKE-ON-VERIFY ?AUTO_2894 ?AUTO_2895 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3245 - BLOCK
      ?AUTO_3246 - BLOCK
    )
    :vars
    (
      ?AUTO_3249 - BLOCK
      ?AUTO_3250 - BLOCK
      ?AUTO_3248 - BLOCK
      ?AUTO_3251 - BLOCK
      ?AUTO_3247 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3245 ?AUTO_3246 ) ) ( ON ?AUTO_3245 ?AUTO_3249 ) ( not ( = ?AUTO_3245 ?AUTO_3249 ) ) ( not ( = ?AUTO_3246 ?AUTO_3249 ) ) ( not ( = ?AUTO_3245 ?AUTO_3250 ) ) ( not ( = ?AUTO_3246 ?AUTO_3250 ) ) ( not ( = ?AUTO_3249 ?AUTO_3250 ) ) ( ON ?AUTO_3250 ?AUTO_3245 ) ( not ( = ?AUTO_3245 ?AUTO_3248 ) ) ( not ( = ?AUTO_3245 ?AUTO_3251 ) ) ( not ( = ?AUTO_3246 ?AUTO_3248 ) ) ( not ( = ?AUTO_3246 ?AUTO_3251 ) ) ( not ( = ?AUTO_3249 ?AUTO_3248 ) ) ( not ( = ?AUTO_3249 ?AUTO_3251 ) ) ( not ( = ?AUTO_3250 ?AUTO_3248 ) ) ( not ( = ?AUTO_3250 ?AUTO_3251 ) ) ( not ( = ?AUTO_3248 ?AUTO_3251 ) ) ( ON ?AUTO_3248 ?AUTO_3246 ) ( CLEAR ?AUTO_3248 ) ( not ( = ?AUTO_3245 ?AUTO_3247 ) ) ( not ( = ?AUTO_3246 ?AUTO_3247 ) ) ( not ( = ?AUTO_3249 ?AUTO_3247 ) ) ( not ( = ?AUTO_3250 ?AUTO_3247 ) ) ( not ( = ?AUTO_3248 ?AUTO_3247 ) ) ( not ( = ?AUTO_3251 ?AUTO_3247 ) ) ( ON ?AUTO_3251 ?AUTO_3250 ) ( CLEAR ?AUTO_3251 ) ( HOLDING ?AUTO_3247 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3247 )
      ( MAKE-ON ?AUTO_3245 ?AUTO_3246 )
      ( MAKE-ON-VERIFY ?AUTO_3245 ?AUTO_3246 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3252 - BLOCK
      ?AUTO_3253 - BLOCK
    )
    :vars
    (
      ?AUTO_3257 - BLOCK
      ?AUTO_3256 - BLOCK
      ?AUTO_3255 - BLOCK
      ?AUTO_3254 - BLOCK
      ?AUTO_3258 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3252 ?AUTO_3253 ) ) ( ON ?AUTO_3252 ?AUTO_3257 ) ( not ( = ?AUTO_3252 ?AUTO_3257 ) ) ( not ( = ?AUTO_3253 ?AUTO_3257 ) ) ( not ( = ?AUTO_3252 ?AUTO_3256 ) ) ( not ( = ?AUTO_3253 ?AUTO_3256 ) ) ( not ( = ?AUTO_3257 ?AUTO_3256 ) ) ( ON ?AUTO_3256 ?AUTO_3252 ) ( not ( = ?AUTO_3252 ?AUTO_3255 ) ) ( not ( = ?AUTO_3252 ?AUTO_3254 ) ) ( not ( = ?AUTO_3253 ?AUTO_3255 ) ) ( not ( = ?AUTO_3253 ?AUTO_3254 ) ) ( not ( = ?AUTO_3257 ?AUTO_3255 ) ) ( not ( = ?AUTO_3257 ?AUTO_3254 ) ) ( not ( = ?AUTO_3256 ?AUTO_3255 ) ) ( not ( = ?AUTO_3256 ?AUTO_3254 ) ) ( not ( = ?AUTO_3255 ?AUTO_3254 ) ) ( ON ?AUTO_3255 ?AUTO_3253 ) ( CLEAR ?AUTO_3255 ) ( not ( = ?AUTO_3252 ?AUTO_3258 ) ) ( not ( = ?AUTO_3253 ?AUTO_3258 ) ) ( not ( = ?AUTO_3257 ?AUTO_3258 ) ) ( not ( = ?AUTO_3256 ?AUTO_3258 ) ) ( not ( = ?AUTO_3255 ?AUTO_3258 ) ) ( not ( = ?AUTO_3254 ?AUTO_3258 ) ) ( ON ?AUTO_3254 ?AUTO_3256 ) ( ON ?AUTO_3258 ?AUTO_3254 ) ( CLEAR ?AUTO_3258 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3258 ?AUTO_3254 )
      ( MAKE-ON ?AUTO_3252 ?AUTO_3253 )
      ( MAKE-ON-VERIFY ?AUTO_3252 ?AUTO_3253 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2924 - BLOCK
      ?AUTO_2925 - BLOCK
    )
    :vars
    (
      ?AUTO_2931 - BLOCK
      ?AUTO_2926 - BLOCK
      ?AUTO_2929 - BLOCK
      ?AUTO_2930 - BLOCK
      ?AUTO_2928 - BLOCK
      ?AUTO_2927 - BLOCK
      ?AUTO_2932 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2924 ?AUTO_2925 ) ) ( ON ?AUTO_2924 ?AUTO_2931 ) ( not ( = ?AUTO_2924 ?AUTO_2931 ) ) ( not ( = ?AUTO_2925 ?AUTO_2931 ) ) ( not ( = ?AUTO_2924 ?AUTO_2926 ) ) ( not ( = ?AUTO_2924 ?AUTO_2929 ) ) ( not ( = ?AUTO_2925 ?AUTO_2926 ) ) ( not ( = ?AUTO_2925 ?AUTO_2929 ) ) ( not ( = ?AUTO_2931 ?AUTO_2926 ) ) ( not ( = ?AUTO_2931 ?AUTO_2929 ) ) ( not ( = ?AUTO_2926 ?AUTO_2929 ) ) ( ON ?AUTO_2926 ?AUTO_2925 ) ( CLEAR ?AUTO_2926 ) ( ON ?AUTO_2929 ?AUTO_2924 ) ( CLEAR ?AUTO_2930 ) ( not ( = ?AUTO_2924 ?AUTO_2928 ) ) ( not ( = ?AUTO_2924 ?AUTO_2930 ) ) ( not ( = ?AUTO_2925 ?AUTO_2928 ) ) ( not ( = ?AUTO_2925 ?AUTO_2930 ) ) ( not ( = ?AUTO_2931 ?AUTO_2928 ) ) ( not ( = ?AUTO_2931 ?AUTO_2930 ) ) ( not ( = ?AUTO_2926 ?AUTO_2928 ) ) ( not ( = ?AUTO_2926 ?AUTO_2930 ) ) ( not ( = ?AUTO_2929 ?AUTO_2928 ) ) ( not ( = ?AUTO_2929 ?AUTO_2930 ) ) ( not ( = ?AUTO_2928 ?AUTO_2930 ) ) ( ON ?AUTO_2928 ?AUTO_2929 ) ( not ( = ?AUTO_2924 ?AUTO_2927 ) ) ( not ( = ?AUTO_2925 ?AUTO_2927 ) ) ( not ( = ?AUTO_2931 ?AUTO_2927 ) ) ( not ( = ?AUTO_2926 ?AUTO_2927 ) ) ( not ( = ?AUTO_2929 ?AUTO_2927 ) ) ( not ( = ?AUTO_2930 ?AUTO_2927 ) ) ( not ( = ?AUTO_2928 ?AUTO_2927 ) ) ( ON ?AUTO_2927 ?AUTO_2928 ) ( CLEAR ?AUTO_2927 ) ( HOLDING ?AUTO_2932 ) ( not ( = ?AUTO_2924 ?AUTO_2932 ) ) ( not ( = ?AUTO_2925 ?AUTO_2932 ) ) ( not ( = ?AUTO_2931 ?AUTO_2932 ) ) ( not ( = ?AUTO_2926 ?AUTO_2932 ) ) ( not ( = ?AUTO_2929 ?AUTO_2932 ) ) ( not ( = ?AUTO_2930 ?AUTO_2932 ) ) ( not ( = ?AUTO_2928 ?AUTO_2932 ) ) ( not ( = ?AUTO_2927 ?AUTO_2932 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2932 )
      ( MAKE-ON ?AUTO_2924 ?AUTO_2925 )
      ( MAKE-ON-VERIFY ?AUTO_2924 ?AUTO_2925 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2933 - BLOCK
      ?AUTO_2934 - BLOCK
    )
    :vars
    (
      ?AUTO_2940 - BLOCK
      ?AUTO_2937 - BLOCK
      ?AUTO_2938 - BLOCK
      ?AUTO_2936 - BLOCK
      ?AUTO_2939 - BLOCK
      ?AUTO_2935 - BLOCK
      ?AUTO_2941 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2933 ?AUTO_2934 ) ) ( ON ?AUTO_2933 ?AUTO_2940 ) ( not ( = ?AUTO_2933 ?AUTO_2940 ) ) ( not ( = ?AUTO_2934 ?AUTO_2940 ) ) ( not ( = ?AUTO_2933 ?AUTO_2937 ) ) ( not ( = ?AUTO_2933 ?AUTO_2938 ) ) ( not ( = ?AUTO_2934 ?AUTO_2937 ) ) ( not ( = ?AUTO_2934 ?AUTO_2938 ) ) ( not ( = ?AUTO_2940 ?AUTO_2937 ) ) ( not ( = ?AUTO_2940 ?AUTO_2938 ) ) ( not ( = ?AUTO_2937 ?AUTO_2938 ) ) ( ON ?AUTO_2937 ?AUTO_2934 ) ( ON ?AUTO_2938 ?AUTO_2933 ) ( CLEAR ?AUTO_2936 ) ( not ( = ?AUTO_2933 ?AUTO_2939 ) ) ( not ( = ?AUTO_2933 ?AUTO_2936 ) ) ( not ( = ?AUTO_2934 ?AUTO_2939 ) ) ( not ( = ?AUTO_2934 ?AUTO_2936 ) ) ( not ( = ?AUTO_2940 ?AUTO_2939 ) ) ( not ( = ?AUTO_2940 ?AUTO_2936 ) ) ( not ( = ?AUTO_2937 ?AUTO_2939 ) ) ( not ( = ?AUTO_2937 ?AUTO_2936 ) ) ( not ( = ?AUTO_2938 ?AUTO_2939 ) ) ( not ( = ?AUTO_2938 ?AUTO_2936 ) ) ( not ( = ?AUTO_2939 ?AUTO_2936 ) ) ( ON ?AUTO_2939 ?AUTO_2938 ) ( not ( = ?AUTO_2933 ?AUTO_2935 ) ) ( not ( = ?AUTO_2934 ?AUTO_2935 ) ) ( not ( = ?AUTO_2940 ?AUTO_2935 ) ) ( not ( = ?AUTO_2937 ?AUTO_2935 ) ) ( not ( = ?AUTO_2938 ?AUTO_2935 ) ) ( not ( = ?AUTO_2936 ?AUTO_2935 ) ) ( not ( = ?AUTO_2939 ?AUTO_2935 ) ) ( ON ?AUTO_2935 ?AUTO_2939 ) ( CLEAR ?AUTO_2935 ) ( not ( = ?AUTO_2933 ?AUTO_2941 ) ) ( not ( = ?AUTO_2934 ?AUTO_2941 ) ) ( not ( = ?AUTO_2940 ?AUTO_2941 ) ) ( not ( = ?AUTO_2937 ?AUTO_2941 ) ) ( not ( = ?AUTO_2938 ?AUTO_2941 ) ) ( not ( = ?AUTO_2936 ?AUTO_2941 ) ) ( not ( = ?AUTO_2939 ?AUTO_2941 ) ) ( not ( = ?AUTO_2935 ?AUTO_2941 ) ) ( ON ?AUTO_2941 ?AUTO_2937 ) ( CLEAR ?AUTO_2941 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2941 ?AUTO_2937 )
      ( MAKE-ON ?AUTO_2933 ?AUTO_2934 )
      ( MAKE-ON-VERIFY ?AUTO_2933 ?AUTO_2934 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2942 - BLOCK
      ?AUTO_2943 - BLOCK
    )
    :vars
    (
      ?AUTO_2950 - BLOCK
      ?AUTO_2945 - BLOCK
      ?AUTO_2946 - BLOCK
      ?AUTO_2947 - BLOCK
      ?AUTO_2949 - BLOCK
      ?AUTO_2944 - BLOCK
      ?AUTO_2948 - BLOCK
      ?AUTO_2951 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2942 ?AUTO_2943 ) ) ( ON ?AUTO_2942 ?AUTO_2950 ) ( not ( = ?AUTO_2942 ?AUTO_2950 ) ) ( not ( = ?AUTO_2943 ?AUTO_2950 ) ) ( not ( = ?AUTO_2942 ?AUTO_2945 ) ) ( not ( = ?AUTO_2942 ?AUTO_2946 ) ) ( not ( = ?AUTO_2943 ?AUTO_2945 ) ) ( not ( = ?AUTO_2943 ?AUTO_2946 ) ) ( not ( = ?AUTO_2950 ?AUTO_2945 ) ) ( not ( = ?AUTO_2950 ?AUTO_2946 ) ) ( not ( = ?AUTO_2945 ?AUTO_2946 ) ) ( ON ?AUTO_2945 ?AUTO_2943 ) ( ON ?AUTO_2946 ?AUTO_2942 ) ( CLEAR ?AUTO_2947 ) ( not ( = ?AUTO_2942 ?AUTO_2949 ) ) ( not ( = ?AUTO_2942 ?AUTO_2947 ) ) ( not ( = ?AUTO_2943 ?AUTO_2949 ) ) ( not ( = ?AUTO_2943 ?AUTO_2947 ) ) ( not ( = ?AUTO_2950 ?AUTO_2949 ) ) ( not ( = ?AUTO_2950 ?AUTO_2947 ) ) ( not ( = ?AUTO_2945 ?AUTO_2949 ) ) ( not ( = ?AUTO_2945 ?AUTO_2947 ) ) ( not ( = ?AUTO_2946 ?AUTO_2949 ) ) ( not ( = ?AUTO_2946 ?AUTO_2947 ) ) ( not ( = ?AUTO_2949 ?AUTO_2947 ) ) ( ON ?AUTO_2949 ?AUTO_2946 ) ( not ( = ?AUTO_2942 ?AUTO_2944 ) ) ( not ( = ?AUTO_2943 ?AUTO_2944 ) ) ( not ( = ?AUTO_2950 ?AUTO_2944 ) ) ( not ( = ?AUTO_2945 ?AUTO_2944 ) ) ( not ( = ?AUTO_2946 ?AUTO_2944 ) ) ( not ( = ?AUTO_2947 ?AUTO_2944 ) ) ( not ( = ?AUTO_2949 ?AUTO_2944 ) ) ( ON ?AUTO_2944 ?AUTO_2949 ) ( CLEAR ?AUTO_2944 ) ( not ( = ?AUTO_2942 ?AUTO_2948 ) ) ( not ( = ?AUTO_2943 ?AUTO_2948 ) ) ( not ( = ?AUTO_2950 ?AUTO_2948 ) ) ( not ( = ?AUTO_2945 ?AUTO_2948 ) ) ( not ( = ?AUTO_2946 ?AUTO_2948 ) ) ( not ( = ?AUTO_2947 ?AUTO_2948 ) ) ( not ( = ?AUTO_2949 ?AUTO_2948 ) ) ( not ( = ?AUTO_2944 ?AUTO_2948 ) ) ( ON ?AUTO_2948 ?AUTO_2945 ) ( CLEAR ?AUTO_2948 ) ( HOLDING ?AUTO_2951 ) ( not ( = ?AUTO_2942 ?AUTO_2951 ) ) ( not ( = ?AUTO_2943 ?AUTO_2951 ) ) ( not ( = ?AUTO_2950 ?AUTO_2951 ) ) ( not ( = ?AUTO_2945 ?AUTO_2951 ) ) ( not ( = ?AUTO_2946 ?AUTO_2951 ) ) ( not ( = ?AUTO_2947 ?AUTO_2951 ) ) ( not ( = ?AUTO_2949 ?AUTO_2951 ) ) ( not ( = ?AUTO_2944 ?AUTO_2951 ) ) ( not ( = ?AUTO_2948 ?AUTO_2951 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2951 )
      ( MAKE-ON ?AUTO_2942 ?AUTO_2943 )
      ( MAKE-ON-VERIFY ?AUTO_2942 ?AUTO_2943 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2952 - BLOCK
      ?AUTO_2953 - BLOCK
    )
    :vars
    (
      ?AUTO_2959 - BLOCK
      ?AUTO_2956 - BLOCK
      ?AUTO_2955 - BLOCK
      ?AUTO_2957 - BLOCK
      ?AUTO_2960 - BLOCK
      ?AUTO_2954 - BLOCK
      ?AUTO_2958 - BLOCK
      ?AUTO_2961 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2952 ?AUTO_2953 ) ) ( ON ?AUTO_2952 ?AUTO_2959 ) ( not ( = ?AUTO_2952 ?AUTO_2959 ) ) ( not ( = ?AUTO_2953 ?AUTO_2959 ) ) ( not ( = ?AUTO_2952 ?AUTO_2956 ) ) ( not ( = ?AUTO_2952 ?AUTO_2955 ) ) ( not ( = ?AUTO_2953 ?AUTO_2956 ) ) ( not ( = ?AUTO_2953 ?AUTO_2955 ) ) ( not ( = ?AUTO_2959 ?AUTO_2956 ) ) ( not ( = ?AUTO_2959 ?AUTO_2955 ) ) ( not ( = ?AUTO_2956 ?AUTO_2955 ) ) ( ON ?AUTO_2956 ?AUTO_2953 ) ( ON ?AUTO_2955 ?AUTO_2952 ) ( CLEAR ?AUTO_2957 ) ( not ( = ?AUTO_2952 ?AUTO_2960 ) ) ( not ( = ?AUTO_2952 ?AUTO_2957 ) ) ( not ( = ?AUTO_2953 ?AUTO_2960 ) ) ( not ( = ?AUTO_2953 ?AUTO_2957 ) ) ( not ( = ?AUTO_2959 ?AUTO_2960 ) ) ( not ( = ?AUTO_2959 ?AUTO_2957 ) ) ( not ( = ?AUTO_2956 ?AUTO_2960 ) ) ( not ( = ?AUTO_2956 ?AUTO_2957 ) ) ( not ( = ?AUTO_2955 ?AUTO_2960 ) ) ( not ( = ?AUTO_2955 ?AUTO_2957 ) ) ( not ( = ?AUTO_2960 ?AUTO_2957 ) ) ( ON ?AUTO_2960 ?AUTO_2955 ) ( not ( = ?AUTO_2952 ?AUTO_2954 ) ) ( not ( = ?AUTO_2953 ?AUTO_2954 ) ) ( not ( = ?AUTO_2959 ?AUTO_2954 ) ) ( not ( = ?AUTO_2956 ?AUTO_2954 ) ) ( not ( = ?AUTO_2955 ?AUTO_2954 ) ) ( not ( = ?AUTO_2957 ?AUTO_2954 ) ) ( not ( = ?AUTO_2960 ?AUTO_2954 ) ) ( ON ?AUTO_2954 ?AUTO_2960 ) ( CLEAR ?AUTO_2954 ) ( not ( = ?AUTO_2952 ?AUTO_2958 ) ) ( not ( = ?AUTO_2953 ?AUTO_2958 ) ) ( not ( = ?AUTO_2959 ?AUTO_2958 ) ) ( not ( = ?AUTO_2956 ?AUTO_2958 ) ) ( not ( = ?AUTO_2955 ?AUTO_2958 ) ) ( not ( = ?AUTO_2957 ?AUTO_2958 ) ) ( not ( = ?AUTO_2960 ?AUTO_2958 ) ) ( not ( = ?AUTO_2954 ?AUTO_2958 ) ) ( ON ?AUTO_2958 ?AUTO_2956 ) ( not ( = ?AUTO_2952 ?AUTO_2961 ) ) ( not ( = ?AUTO_2953 ?AUTO_2961 ) ) ( not ( = ?AUTO_2959 ?AUTO_2961 ) ) ( not ( = ?AUTO_2956 ?AUTO_2961 ) ) ( not ( = ?AUTO_2955 ?AUTO_2961 ) ) ( not ( = ?AUTO_2957 ?AUTO_2961 ) ) ( not ( = ?AUTO_2960 ?AUTO_2961 ) ) ( not ( = ?AUTO_2954 ?AUTO_2961 ) ) ( not ( = ?AUTO_2958 ?AUTO_2961 ) ) ( ON ?AUTO_2961 ?AUTO_2958 ) ( CLEAR ?AUTO_2961 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2961 ?AUTO_2958 )
      ( MAKE-ON ?AUTO_2952 ?AUTO_2953 )
      ( MAKE-ON-VERIFY ?AUTO_2952 ?AUTO_2953 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3442 - BLOCK
      ?AUTO_3443 - BLOCK
    )
    :vars
    (
      ?AUTO_3447 - BLOCK
      ?AUTO_3445 - BLOCK
      ?AUTO_3444 - BLOCK
      ?AUTO_3448 - BLOCK
      ?AUTO_3446 - BLOCK
      ?AUTO_3449 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3443 ) ( not ( = ?AUTO_3442 ?AUTO_3443 ) ) ( ON ?AUTO_3442 ?AUTO_3447 ) ( not ( = ?AUTO_3442 ?AUTO_3447 ) ) ( not ( = ?AUTO_3443 ?AUTO_3447 ) ) ( not ( = ?AUTO_3442 ?AUTO_3445 ) ) ( not ( = ?AUTO_3443 ?AUTO_3445 ) ) ( not ( = ?AUTO_3447 ?AUTO_3445 ) ) ( ON ?AUTO_3445 ?AUTO_3442 ) ( not ( = ?AUTO_3442 ?AUTO_3444 ) ) ( not ( = ?AUTO_3442 ?AUTO_3448 ) ) ( not ( = ?AUTO_3443 ?AUTO_3444 ) ) ( not ( = ?AUTO_3443 ?AUTO_3448 ) ) ( not ( = ?AUTO_3447 ?AUTO_3444 ) ) ( not ( = ?AUTO_3447 ?AUTO_3448 ) ) ( not ( = ?AUTO_3445 ?AUTO_3444 ) ) ( not ( = ?AUTO_3445 ?AUTO_3448 ) ) ( not ( = ?AUTO_3444 ?AUTO_3448 ) ) ( ON ?AUTO_3444 ?AUTO_3445 ) ( not ( = ?AUTO_3442 ?AUTO_3446 ) ) ( not ( = ?AUTO_3443 ?AUTO_3446 ) ) ( not ( = ?AUTO_3447 ?AUTO_3446 ) ) ( not ( = ?AUTO_3445 ?AUTO_3446 ) ) ( not ( = ?AUTO_3448 ?AUTO_3446 ) ) ( not ( = ?AUTO_3444 ?AUTO_3446 ) ) ( ON ?AUTO_3446 ?AUTO_3444 ) ( CLEAR ?AUTO_3446 ) ( HOLDING ?AUTO_3448 ) ( CLEAR ?AUTO_3449 ) ( not ( = ?AUTO_3442 ?AUTO_3449 ) ) ( not ( = ?AUTO_3443 ?AUTO_3449 ) ) ( not ( = ?AUTO_3447 ?AUTO_3449 ) ) ( not ( = ?AUTO_3445 ?AUTO_3449 ) ) ( not ( = ?AUTO_3444 ?AUTO_3449 ) ) ( not ( = ?AUTO_3448 ?AUTO_3449 ) ) ( not ( = ?AUTO_3446 ?AUTO_3449 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3448 ?AUTO_3449 )
      ( MAKE-ON ?AUTO_3442 ?AUTO_3443 )
      ( MAKE-ON-VERIFY ?AUTO_3442 ?AUTO_3443 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3456 - BLOCK
      ?AUTO_3457 - BLOCK
    )
    :vars
    (
      ?AUTO_3461 - BLOCK
      ?AUTO_3458 - BLOCK
      ?AUTO_3460 - BLOCK
      ?AUTO_3462 - BLOCK
      ?AUTO_3459 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3456 ?AUTO_3457 ) ) ( ON ?AUTO_3456 ?AUTO_3461 ) ( not ( = ?AUTO_3456 ?AUTO_3461 ) ) ( not ( = ?AUTO_3457 ?AUTO_3461 ) ) ( not ( = ?AUTO_3456 ?AUTO_3458 ) ) ( not ( = ?AUTO_3457 ?AUTO_3458 ) ) ( not ( = ?AUTO_3461 ?AUTO_3458 ) ) ( ON ?AUTO_3458 ?AUTO_3456 ) ( CLEAR ?AUTO_3460 ) ( not ( = ?AUTO_3456 ?AUTO_3462 ) ) ( not ( = ?AUTO_3456 ?AUTO_3460 ) ) ( not ( = ?AUTO_3457 ?AUTO_3462 ) ) ( not ( = ?AUTO_3457 ?AUTO_3460 ) ) ( not ( = ?AUTO_3461 ?AUTO_3462 ) ) ( not ( = ?AUTO_3461 ?AUTO_3460 ) ) ( not ( = ?AUTO_3458 ?AUTO_3462 ) ) ( not ( = ?AUTO_3458 ?AUTO_3460 ) ) ( not ( = ?AUTO_3462 ?AUTO_3460 ) ) ( ON ?AUTO_3462 ?AUTO_3458 ) ( not ( = ?AUTO_3456 ?AUTO_3459 ) ) ( not ( = ?AUTO_3457 ?AUTO_3459 ) ) ( not ( = ?AUTO_3461 ?AUTO_3459 ) ) ( not ( = ?AUTO_3458 ?AUTO_3459 ) ) ( not ( = ?AUTO_3460 ?AUTO_3459 ) ) ( not ( = ?AUTO_3462 ?AUTO_3459 ) ) ( ON ?AUTO_3459 ?AUTO_3462 ) ( CLEAR ?AUTO_3459 ) ( HOLDING ?AUTO_3457 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3457 )
      ( MAKE-ON ?AUTO_3456 ?AUTO_3457 )
      ( MAKE-ON-VERIFY ?AUTO_3456 ?AUTO_3457 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4605 - BLOCK
      ?AUTO_4606 - BLOCK
    )
    :vars
    (
      ?AUTO_4608 - BLOCK
      ?AUTO_4607 - BLOCK
      ?AUTO_4609 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4605 ?AUTO_4606 ) ) ( not ( = ?AUTO_4605 ?AUTO_4608 ) ) ( not ( = ?AUTO_4606 ?AUTO_4608 ) ) ( ON ?AUTO_4608 ?AUTO_4606 ) ( not ( = ?AUTO_4605 ?AUTO_4607 ) ) ( not ( = ?AUTO_4606 ?AUTO_4607 ) ) ( not ( = ?AUTO_4608 ?AUTO_4607 ) ) ( ON ?AUTO_4607 ?AUTO_4608 ) ( not ( = ?AUTO_4605 ?AUTO_4609 ) ) ( not ( = ?AUTO_4606 ?AUTO_4609 ) ) ( not ( = ?AUTO_4608 ?AUTO_4609 ) ) ( not ( = ?AUTO_4607 ?AUTO_4609 ) ) ( ON ?AUTO_4609 ?AUTO_4607 ) ( ON ?AUTO_4605 ?AUTO_4609 ) ( CLEAR ?AUTO_4605 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4605 ?AUTO_4609 )
      ( MAKE-ON ?AUTO_4605 ?AUTO_4606 )
      ( MAKE-ON-VERIFY ?AUTO_4605 ?AUTO_4606 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3521 - BLOCK
      ?AUTO_3522 - BLOCK
    )
    :vars
    (
      ?AUTO_3527 - BLOCK
      ?AUTO_3526 - BLOCK
      ?AUTO_3523 - BLOCK
      ?AUTO_3525 - BLOCK
      ?AUTO_3524 - BLOCK
      ?AUTO_3528 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3521 ?AUTO_3522 ) ) ( CLEAR ?AUTO_3527 ) ( not ( = ?AUTO_3521 ?AUTO_3526 ) ) ( not ( = ?AUTO_3521 ?AUTO_3527 ) ) ( not ( = ?AUTO_3522 ?AUTO_3526 ) ) ( not ( = ?AUTO_3522 ?AUTO_3527 ) ) ( not ( = ?AUTO_3526 ?AUTO_3527 ) ) ( ON ?AUTO_3526 ?AUTO_3522 ) ( not ( = ?AUTO_3521 ?AUTO_3523 ) ) ( not ( = ?AUTO_3522 ?AUTO_3523 ) ) ( not ( = ?AUTO_3527 ?AUTO_3523 ) ) ( not ( = ?AUTO_3526 ?AUTO_3523 ) ) ( ON ?AUTO_3523 ?AUTO_3526 ) ( not ( = ?AUTO_3521 ?AUTO_3525 ) ) ( not ( = ?AUTO_3521 ?AUTO_3524 ) ) ( not ( = ?AUTO_3522 ?AUTO_3525 ) ) ( not ( = ?AUTO_3522 ?AUTO_3524 ) ) ( not ( = ?AUTO_3527 ?AUTO_3525 ) ) ( not ( = ?AUTO_3527 ?AUTO_3524 ) ) ( not ( = ?AUTO_3526 ?AUTO_3525 ) ) ( not ( = ?AUTO_3526 ?AUTO_3524 ) ) ( not ( = ?AUTO_3523 ?AUTO_3525 ) ) ( not ( = ?AUTO_3523 ?AUTO_3524 ) ) ( not ( = ?AUTO_3525 ?AUTO_3524 ) ) ( ON ?AUTO_3525 ?AUTO_3523 ) ( ON ?AUTO_3521 ?AUTO_3525 ) ( CLEAR ?AUTO_3521 ) ( HOLDING ?AUTO_3524 ) ( CLEAR ?AUTO_3528 ) ( not ( = ?AUTO_3521 ?AUTO_3528 ) ) ( not ( = ?AUTO_3522 ?AUTO_3528 ) ) ( not ( = ?AUTO_3527 ?AUTO_3528 ) ) ( not ( = ?AUTO_3526 ?AUTO_3528 ) ) ( not ( = ?AUTO_3523 ?AUTO_3528 ) ) ( not ( = ?AUTO_3525 ?AUTO_3528 ) ) ( not ( = ?AUTO_3524 ?AUTO_3528 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3524 ?AUTO_3528 )
      ( MAKE-ON ?AUTO_3521 ?AUTO_3522 )
      ( MAKE-ON-VERIFY ?AUTO_3521 ?AUTO_3522 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3592 - BLOCK
      ?AUTO_3593 - BLOCK
    )
    :vars
    (
      ?AUTO_3594 - BLOCK
      ?AUTO_3596 - BLOCK
      ?AUTO_3595 - BLOCK
      ?AUTO_3597 - BLOCK
      ?AUTO_3598 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3592 ?AUTO_3593 ) ) ( not ( = ?AUTO_3592 ?AUTO_3594 ) ) ( not ( = ?AUTO_3593 ?AUTO_3594 ) ) ( CLEAR ?AUTO_3596 ) ( not ( = ?AUTO_3592 ?AUTO_3595 ) ) ( not ( = ?AUTO_3592 ?AUTO_3596 ) ) ( not ( = ?AUTO_3593 ?AUTO_3595 ) ) ( not ( = ?AUTO_3593 ?AUTO_3596 ) ) ( not ( = ?AUTO_3594 ?AUTO_3595 ) ) ( not ( = ?AUTO_3594 ?AUTO_3596 ) ) ( not ( = ?AUTO_3595 ?AUTO_3596 ) ) ( ON ?AUTO_3595 ?AUTO_3593 ) ( ON ?AUTO_3592 ?AUTO_3595 ) ( not ( = ?AUTO_3592 ?AUTO_3597 ) ) ( not ( = ?AUTO_3593 ?AUTO_3597 ) ) ( not ( = ?AUTO_3594 ?AUTO_3597 ) ) ( not ( = ?AUTO_3596 ?AUTO_3597 ) ) ( not ( = ?AUTO_3595 ?AUTO_3597 ) ) ( ON ?AUTO_3597 ?AUTO_3592 ) ( CLEAR ?AUTO_3597 ) ( HOLDING ?AUTO_3594 ) ( CLEAR ?AUTO_3598 ) ( not ( = ?AUTO_3592 ?AUTO_3598 ) ) ( not ( = ?AUTO_3593 ?AUTO_3598 ) ) ( not ( = ?AUTO_3594 ?AUTO_3598 ) ) ( not ( = ?AUTO_3596 ?AUTO_3598 ) ) ( not ( = ?AUTO_3595 ?AUTO_3598 ) ) ( not ( = ?AUTO_3597 ?AUTO_3598 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3594 ?AUTO_3598 )
      ( MAKE-ON ?AUTO_3592 ?AUTO_3593 )
      ( MAKE-ON-VERIFY ?AUTO_3592 ?AUTO_3593 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3779 - BLOCK
      ?AUTO_3780 - BLOCK
    )
    :vars
    (
      ?AUTO_3781 - BLOCK
      ?AUTO_3783 - BLOCK
      ?AUTO_3784 - BLOCK
      ?AUTO_3782 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3779 ?AUTO_3780 ) ) ( ON ?AUTO_3779 ?AUTO_3781 ) ( not ( = ?AUTO_3779 ?AUTO_3781 ) ) ( not ( = ?AUTO_3780 ?AUTO_3781 ) ) ( not ( = ?AUTO_3779 ?AUTO_3783 ) ) ( not ( = ?AUTO_3779 ?AUTO_3784 ) ) ( not ( = ?AUTO_3780 ?AUTO_3783 ) ) ( not ( = ?AUTO_3780 ?AUTO_3784 ) ) ( not ( = ?AUTO_3781 ?AUTO_3783 ) ) ( not ( = ?AUTO_3781 ?AUTO_3784 ) ) ( not ( = ?AUTO_3783 ?AUTO_3784 ) ) ( CLEAR ?AUTO_3782 ) ( not ( = ?AUTO_3779 ?AUTO_3782 ) ) ( not ( = ?AUTO_3780 ?AUTO_3782 ) ) ( not ( = ?AUTO_3781 ?AUTO_3782 ) ) ( not ( = ?AUTO_3783 ?AUTO_3782 ) ) ( not ( = ?AUTO_3784 ?AUTO_3782 ) ) ( ON ?AUTO_3784 ?AUTO_3779 ) ( CLEAR ?AUTO_3784 ) ( HOLDING ?AUTO_3783 ) ( CLEAR ?AUTO_3780 ) )
    :subtasks
    ( ( !STACK ?AUTO_3783 ?AUTO_3780 )
      ( MAKE-ON ?AUTO_3779 ?AUTO_3780 )
      ( MAKE-ON-VERIFY ?AUTO_3779 ?AUTO_3780 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3791 - BLOCK
      ?AUTO_3792 - BLOCK
    )
    :vars
    (
      ?AUTO_3796 - BLOCK
      ?AUTO_3793 - BLOCK
      ?AUTO_3794 - BLOCK
      ?AUTO_3795 - BLOCK
      ?AUTO_3797 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3791 ?AUTO_3792 ) ) ( ON ?AUTO_3791 ?AUTO_3796 ) ( not ( = ?AUTO_3791 ?AUTO_3796 ) ) ( not ( = ?AUTO_3792 ?AUTO_3796 ) ) ( not ( = ?AUTO_3791 ?AUTO_3793 ) ) ( not ( = ?AUTO_3791 ?AUTO_3794 ) ) ( not ( = ?AUTO_3792 ?AUTO_3793 ) ) ( not ( = ?AUTO_3792 ?AUTO_3794 ) ) ( not ( = ?AUTO_3796 ?AUTO_3793 ) ) ( not ( = ?AUTO_3796 ?AUTO_3794 ) ) ( not ( = ?AUTO_3793 ?AUTO_3794 ) ) ( not ( = ?AUTO_3791 ?AUTO_3795 ) ) ( not ( = ?AUTO_3792 ?AUTO_3795 ) ) ( not ( = ?AUTO_3796 ?AUTO_3795 ) ) ( not ( = ?AUTO_3793 ?AUTO_3795 ) ) ( not ( = ?AUTO_3794 ?AUTO_3795 ) ) ( ON ?AUTO_3794 ?AUTO_3791 ) ( CLEAR ?AUTO_3792 ) ( ON ?AUTO_3793 ?AUTO_3794 ) ( CLEAR ?AUTO_3793 ) ( HOLDING ?AUTO_3795 ) ( CLEAR ?AUTO_3797 ) ( not ( = ?AUTO_3791 ?AUTO_3797 ) ) ( not ( = ?AUTO_3792 ?AUTO_3797 ) ) ( not ( = ?AUTO_3796 ?AUTO_3797 ) ) ( not ( = ?AUTO_3793 ?AUTO_3797 ) ) ( not ( = ?AUTO_3794 ?AUTO_3797 ) ) ( not ( = ?AUTO_3795 ?AUTO_3797 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3795 ?AUTO_3797 )
      ( MAKE-ON ?AUTO_3791 ?AUTO_3792 )
      ( MAKE-ON-VERIFY ?AUTO_3791 ?AUTO_3792 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3800 - BLOCK
      ?AUTO_3801 - BLOCK
    )
    :vars
    (
      ?AUTO_3802 - BLOCK
      ?AUTO_3803 - BLOCK
      ?AUTO_3805 - BLOCK
      ?AUTO_3804 - BLOCK
      ?AUTO_3806 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3800 ?AUTO_3801 ) ) ( ON ?AUTO_3800 ?AUTO_3802 ) ( not ( = ?AUTO_3800 ?AUTO_3802 ) ) ( not ( = ?AUTO_3801 ?AUTO_3802 ) ) ( not ( = ?AUTO_3800 ?AUTO_3803 ) ) ( not ( = ?AUTO_3800 ?AUTO_3805 ) ) ( not ( = ?AUTO_3801 ?AUTO_3803 ) ) ( not ( = ?AUTO_3801 ?AUTO_3805 ) ) ( not ( = ?AUTO_3802 ?AUTO_3803 ) ) ( not ( = ?AUTO_3802 ?AUTO_3805 ) ) ( not ( = ?AUTO_3803 ?AUTO_3805 ) ) ( CLEAR ?AUTO_3804 ) ( not ( = ?AUTO_3800 ?AUTO_3804 ) ) ( not ( = ?AUTO_3801 ?AUTO_3804 ) ) ( not ( = ?AUTO_3802 ?AUTO_3804 ) ) ( not ( = ?AUTO_3803 ?AUTO_3804 ) ) ( not ( = ?AUTO_3805 ?AUTO_3804 ) ) ( ON ?AUTO_3805 ?AUTO_3800 ) ( ON ?AUTO_3803 ?AUTO_3805 ) ( CLEAR ?AUTO_3803 ) ( HOLDING ?AUTO_3801 ) ( CLEAR ?AUTO_3806 ) ( not ( = ?AUTO_3800 ?AUTO_3806 ) ) ( not ( = ?AUTO_3801 ?AUTO_3806 ) ) ( not ( = ?AUTO_3802 ?AUTO_3806 ) ) ( not ( = ?AUTO_3803 ?AUTO_3806 ) ) ( not ( = ?AUTO_3805 ?AUTO_3806 ) ) ( not ( = ?AUTO_3804 ?AUTO_3806 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3801 ?AUTO_3806 )
      ( MAKE-ON ?AUTO_3800 ?AUTO_3801 )
      ( MAKE-ON-VERIFY ?AUTO_3800 ?AUTO_3801 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3811 - BLOCK
      ?AUTO_3812 - BLOCK
    )
    :vars
    (
      ?AUTO_3815 - BLOCK
      ?AUTO_3814 - BLOCK
      ?AUTO_3817 - BLOCK
      ?AUTO_3816 - BLOCK
      ?AUTO_3813 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3811 ?AUTO_3812 ) ) ( ON ?AUTO_3811 ?AUTO_3815 ) ( not ( = ?AUTO_3811 ?AUTO_3815 ) ) ( not ( = ?AUTO_3812 ?AUTO_3815 ) ) ( not ( = ?AUTO_3811 ?AUTO_3814 ) ) ( not ( = ?AUTO_3811 ?AUTO_3817 ) ) ( not ( = ?AUTO_3812 ?AUTO_3814 ) ) ( not ( = ?AUTO_3812 ?AUTO_3817 ) ) ( not ( = ?AUTO_3815 ?AUTO_3814 ) ) ( not ( = ?AUTO_3815 ?AUTO_3817 ) ) ( not ( = ?AUTO_3814 ?AUTO_3817 ) ) ( not ( = ?AUTO_3811 ?AUTO_3816 ) ) ( not ( = ?AUTO_3812 ?AUTO_3816 ) ) ( not ( = ?AUTO_3815 ?AUTO_3816 ) ) ( not ( = ?AUTO_3814 ?AUTO_3816 ) ) ( not ( = ?AUTO_3817 ?AUTO_3816 ) ) ( ON ?AUTO_3817 ?AUTO_3811 ) ( ON ?AUTO_3814 ?AUTO_3817 ) ( CLEAR ?AUTO_3814 ) ( CLEAR ?AUTO_3813 ) ( not ( = ?AUTO_3811 ?AUTO_3813 ) ) ( not ( = ?AUTO_3812 ?AUTO_3813 ) ) ( not ( = ?AUTO_3815 ?AUTO_3813 ) ) ( not ( = ?AUTO_3814 ?AUTO_3813 ) ) ( not ( = ?AUTO_3817 ?AUTO_3813 ) ) ( not ( = ?AUTO_3816 ?AUTO_3813 ) ) ( ON ?AUTO_3816 ?AUTO_3812 ) ( CLEAR ?AUTO_3816 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3816 ?AUTO_3812 )
      ( MAKE-ON ?AUTO_3811 ?AUTO_3812 )
      ( MAKE-ON-VERIFY ?AUTO_3811 ?AUTO_3812 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3818 - BLOCK
      ?AUTO_3819 - BLOCK
    )
    :vars
    (
      ?AUTO_3820 - BLOCK
      ?AUTO_3822 - BLOCK
      ?AUTO_3821 - BLOCK
      ?AUTO_3824 - BLOCK
      ?AUTO_3823 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3818 ?AUTO_3819 ) ) ( ON ?AUTO_3818 ?AUTO_3820 ) ( not ( = ?AUTO_3818 ?AUTO_3820 ) ) ( not ( = ?AUTO_3819 ?AUTO_3820 ) ) ( not ( = ?AUTO_3818 ?AUTO_3822 ) ) ( not ( = ?AUTO_3818 ?AUTO_3821 ) ) ( not ( = ?AUTO_3819 ?AUTO_3822 ) ) ( not ( = ?AUTO_3819 ?AUTO_3821 ) ) ( not ( = ?AUTO_3820 ?AUTO_3822 ) ) ( not ( = ?AUTO_3820 ?AUTO_3821 ) ) ( not ( = ?AUTO_3822 ?AUTO_3821 ) ) ( not ( = ?AUTO_3818 ?AUTO_3824 ) ) ( not ( = ?AUTO_3819 ?AUTO_3824 ) ) ( not ( = ?AUTO_3820 ?AUTO_3824 ) ) ( not ( = ?AUTO_3822 ?AUTO_3824 ) ) ( not ( = ?AUTO_3821 ?AUTO_3824 ) ) ( ON ?AUTO_3821 ?AUTO_3818 ) ( CLEAR ?AUTO_3823 ) ( not ( = ?AUTO_3818 ?AUTO_3823 ) ) ( not ( = ?AUTO_3819 ?AUTO_3823 ) ) ( not ( = ?AUTO_3820 ?AUTO_3823 ) ) ( not ( = ?AUTO_3822 ?AUTO_3823 ) ) ( not ( = ?AUTO_3821 ?AUTO_3823 ) ) ( not ( = ?AUTO_3824 ?AUTO_3823 ) ) ( ON ?AUTO_3824 ?AUTO_3819 ) ( CLEAR ?AUTO_3824 ) ( HOLDING ?AUTO_3822 ) ( CLEAR ?AUTO_3821 ) )
    :subtasks
    ( ( !STACK ?AUTO_3822 ?AUTO_3821 )
      ( MAKE-ON ?AUTO_3818 ?AUTO_3819 )
      ( MAKE-ON-VERIFY ?AUTO_3818 ?AUTO_3819 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3825 - BLOCK
      ?AUTO_3826 - BLOCK
    )
    :vars
    (
      ?AUTO_3830 - BLOCK
      ?AUTO_3831 - BLOCK
      ?AUTO_3827 - BLOCK
      ?AUTO_3828 - BLOCK
      ?AUTO_3829 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3825 ?AUTO_3826 ) ) ( ON ?AUTO_3825 ?AUTO_3830 ) ( not ( = ?AUTO_3825 ?AUTO_3830 ) ) ( not ( = ?AUTO_3826 ?AUTO_3830 ) ) ( not ( = ?AUTO_3825 ?AUTO_3831 ) ) ( not ( = ?AUTO_3825 ?AUTO_3827 ) ) ( not ( = ?AUTO_3826 ?AUTO_3831 ) ) ( not ( = ?AUTO_3826 ?AUTO_3827 ) ) ( not ( = ?AUTO_3830 ?AUTO_3831 ) ) ( not ( = ?AUTO_3830 ?AUTO_3827 ) ) ( not ( = ?AUTO_3831 ?AUTO_3827 ) ) ( not ( = ?AUTO_3825 ?AUTO_3828 ) ) ( not ( = ?AUTO_3826 ?AUTO_3828 ) ) ( not ( = ?AUTO_3830 ?AUTO_3828 ) ) ( not ( = ?AUTO_3831 ?AUTO_3828 ) ) ( not ( = ?AUTO_3827 ?AUTO_3828 ) ) ( ON ?AUTO_3827 ?AUTO_3825 ) ( CLEAR ?AUTO_3829 ) ( not ( = ?AUTO_3825 ?AUTO_3829 ) ) ( not ( = ?AUTO_3826 ?AUTO_3829 ) ) ( not ( = ?AUTO_3830 ?AUTO_3829 ) ) ( not ( = ?AUTO_3831 ?AUTO_3829 ) ) ( not ( = ?AUTO_3827 ?AUTO_3829 ) ) ( not ( = ?AUTO_3828 ?AUTO_3829 ) ) ( ON ?AUTO_3828 ?AUTO_3826 ) ( CLEAR ?AUTO_3827 ) ( ON ?AUTO_3831 ?AUTO_3828 ) ( CLEAR ?AUTO_3831 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3831 ?AUTO_3828 )
      ( MAKE-ON ?AUTO_3825 ?AUTO_3826 )
      ( MAKE-ON-VERIFY ?AUTO_3825 ?AUTO_3826 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3848 - BLOCK
      ?AUTO_3849 - BLOCK
    )
    :vars
    (
      ?AUTO_3850 - BLOCK
      ?AUTO_3851 - BLOCK
      ?AUTO_3853 - BLOCK
      ?AUTO_3854 - BLOCK
      ?AUTO_3855 - BLOCK
      ?AUTO_3852 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3848 ?AUTO_3849 ) ) ( ON ?AUTO_3848 ?AUTO_3850 ) ( not ( = ?AUTO_3848 ?AUTO_3850 ) ) ( not ( = ?AUTO_3849 ?AUTO_3850 ) ) ( not ( = ?AUTO_3848 ?AUTO_3851 ) ) ( not ( = ?AUTO_3848 ?AUTO_3853 ) ) ( not ( = ?AUTO_3849 ?AUTO_3851 ) ) ( not ( = ?AUTO_3849 ?AUTO_3853 ) ) ( not ( = ?AUTO_3850 ?AUTO_3851 ) ) ( not ( = ?AUTO_3850 ?AUTO_3853 ) ) ( not ( = ?AUTO_3851 ?AUTO_3853 ) ) ( not ( = ?AUTO_3848 ?AUTO_3854 ) ) ( not ( = ?AUTO_3849 ?AUTO_3854 ) ) ( not ( = ?AUTO_3850 ?AUTO_3854 ) ) ( not ( = ?AUTO_3851 ?AUTO_3854 ) ) ( not ( = ?AUTO_3853 ?AUTO_3854 ) ) ( CLEAR ?AUTO_3855 ) ( not ( = ?AUTO_3848 ?AUTO_3855 ) ) ( not ( = ?AUTO_3849 ?AUTO_3855 ) ) ( not ( = ?AUTO_3850 ?AUTO_3855 ) ) ( not ( = ?AUTO_3851 ?AUTO_3855 ) ) ( not ( = ?AUTO_3853 ?AUTO_3855 ) ) ( not ( = ?AUTO_3854 ?AUTO_3855 ) ) ( ON ?AUTO_3854 ?AUTO_3849 ) ( ON ?AUTO_3851 ?AUTO_3854 ) ( not ( = ?AUTO_3848 ?AUTO_3852 ) ) ( not ( = ?AUTO_3849 ?AUTO_3852 ) ) ( not ( = ?AUTO_3850 ?AUTO_3852 ) ) ( not ( = ?AUTO_3851 ?AUTO_3852 ) ) ( not ( = ?AUTO_3853 ?AUTO_3852 ) ) ( not ( = ?AUTO_3854 ?AUTO_3852 ) ) ( not ( = ?AUTO_3855 ?AUTO_3852 ) ) ( ON ?AUTO_3852 ?AUTO_3851 ) ( CLEAR ?AUTO_3852 ) ( HOLDING ?AUTO_3853 ) ( CLEAR ?AUTO_3848 ) )
    :subtasks
    ( ( !STACK ?AUTO_3853 ?AUTO_3848 )
      ( MAKE-ON ?AUTO_3848 ?AUTO_3849 )
      ( MAKE-ON-VERIFY ?AUTO_3848 ?AUTO_3849 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3856 - BLOCK
      ?AUTO_3857 - BLOCK
    )
    :vars
    (
      ?AUTO_3862 - BLOCK
      ?AUTO_3858 - BLOCK
      ?AUTO_3860 - BLOCK
      ?AUTO_3861 - BLOCK
      ?AUTO_3859 - BLOCK
      ?AUTO_3863 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3856 ?AUTO_3857 ) ) ( ON ?AUTO_3856 ?AUTO_3862 ) ( not ( = ?AUTO_3856 ?AUTO_3862 ) ) ( not ( = ?AUTO_3857 ?AUTO_3862 ) ) ( not ( = ?AUTO_3856 ?AUTO_3858 ) ) ( not ( = ?AUTO_3856 ?AUTO_3860 ) ) ( not ( = ?AUTO_3857 ?AUTO_3858 ) ) ( not ( = ?AUTO_3857 ?AUTO_3860 ) ) ( not ( = ?AUTO_3862 ?AUTO_3858 ) ) ( not ( = ?AUTO_3862 ?AUTO_3860 ) ) ( not ( = ?AUTO_3858 ?AUTO_3860 ) ) ( not ( = ?AUTO_3856 ?AUTO_3861 ) ) ( not ( = ?AUTO_3857 ?AUTO_3861 ) ) ( not ( = ?AUTO_3862 ?AUTO_3861 ) ) ( not ( = ?AUTO_3858 ?AUTO_3861 ) ) ( not ( = ?AUTO_3860 ?AUTO_3861 ) ) ( CLEAR ?AUTO_3859 ) ( not ( = ?AUTO_3856 ?AUTO_3859 ) ) ( not ( = ?AUTO_3857 ?AUTO_3859 ) ) ( not ( = ?AUTO_3862 ?AUTO_3859 ) ) ( not ( = ?AUTO_3858 ?AUTO_3859 ) ) ( not ( = ?AUTO_3860 ?AUTO_3859 ) ) ( not ( = ?AUTO_3861 ?AUTO_3859 ) ) ( ON ?AUTO_3861 ?AUTO_3857 ) ( ON ?AUTO_3858 ?AUTO_3861 ) ( not ( = ?AUTO_3856 ?AUTO_3863 ) ) ( not ( = ?AUTO_3857 ?AUTO_3863 ) ) ( not ( = ?AUTO_3862 ?AUTO_3863 ) ) ( not ( = ?AUTO_3858 ?AUTO_3863 ) ) ( not ( = ?AUTO_3860 ?AUTO_3863 ) ) ( not ( = ?AUTO_3861 ?AUTO_3863 ) ) ( not ( = ?AUTO_3859 ?AUTO_3863 ) ) ( ON ?AUTO_3863 ?AUTO_3858 ) ( CLEAR ?AUTO_3863 ) ( CLEAR ?AUTO_3856 ) ( ON-TABLE ?AUTO_3860 ) ( CLEAR ?AUTO_3860 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_3860 )
      ( MAKE-ON ?AUTO_3856 ?AUTO_3857 )
      ( MAKE-ON-VERIFY ?AUTO_3856 ?AUTO_3857 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5586 - BLOCK
      ?AUTO_5587 - BLOCK
    )
    :vars
    (
      ?AUTO_5589 - BLOCK
      ?AUTO_5588 - BLOCK
      ?AUTO_5590 - BLOCK
      ?AUTO_5591 - BLOCK
      ?AUTO_5592 - BLOCK
      ?AUTO_5593 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5586 ?AUTO_5587 ) ) ( ON-TABLE ?AUTO_5586 ) ( not ( = ?AUTO_5586 ?AUTO_5589 ) ) ( not ( = ?AUTO_5587 ?AUTO_5589 ) ) ( ON ?AUTO_5589 ?AUTO_5586 ) ( not ( = ?AUTO_5586 ?AUTO_5588 ) ) ( not ( = ?AUTO_5586 ?AUTO_5590 ) ) ( not ( = ?AUTO_5587 ?AUTO_5588 ) ) ( not ( = ?AUTO_5587 ?AUTO_5590 ) ) ( not ( = ?AUTO_5589 ?AUTO_5588 ) ) ( not ( = ?AUTO_5589 ?AUTO_5590 ) ) ( not ( = ?AUTO_5588 ?AUTO_5590 ) ) ( CLEAR ?AUTO_5591 ) ( not ( = ?AUTO_5586 ?AUTO_5591 ) ) ( not ( = ?AUTO_5587 ?AUTO_5591 ) ) ( not ( = ?AUTO_5589 ?AUTO_5591 ) ) ( not ( = ?AUTO_5588 ?AUTO_5591 ) ) ( not ( = ?AUTO_5590 ?AUTO_5591 ) ) ( ON ?AUTO_5590 ?AUTO_5589 ) ( CLEAR ?AUTO_5587 ) ( ON ?AUTO_5588 ?AUTO_5590 ) ( CLEAR ?AUTO_5588 ) ( HOLDING ?AUTO_5592 ) ( CLEAR ?AUTO_5593 ) ( not ( = ?AUTO_5586 ?AUTO_5592 ) ) ( not ( = ?AUTO_5586 ?AUTO_5593 ) ) ( not ( = ?AUTO_5587 ?AUTO_5592 ) ) ( not ( = ?AUTO_5587 ?AUTO_5593 ) ) ( not ( = ?AUTO_5589 ?AUTO_5592 ) ) ( not ( = ?AUTO_5589 ?AUTO_5593 ) ) ( not ( = ?AUTO_5588 ?AUTO_5592 ) ) ( not ( = ?AUTO_5588 ?AUTO_5593 ) ) ( not ( = ?AUTO_5590 ?AUTO_5592 ) ) ( not ( = ?AUTO_5590 ?AUTO_5593 ) ) ( not ( = ?AUTO_5591 ?AUTO_5592 ) ) ( not ( = ?AUTO_5591 ?AUTO_5593 ) ) ( not ( = ?AUTO_5592 ?AUTO_5593 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5592 ?AUTO_5593 )
      ( MAKE-ON ?AUTO_5586 ?AUTO_5587 )
      ( MAKE-ON-VERIFY ?AUTO_5586 ?AUTO_5587 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3943 - BLOCK
      ?AUTO_3944 - BLOCK
    )
    :vars
    (
      ?AUTO_3946 - BLOCK
      ?AUTO_3948 - BLOCK
      ?AUTO_3945 - BLOCK
      ?AUTO_3949 - BLOCK
      ?AUTO_3950 - BLOCK
      ?AUTO_3947 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3943 ?AUTO_3944 ) ) ( ON-TABLE ?AUTO_3943 ) ( CLEAR ?AUTO_3946 ) ( not ( = ?AUTO_3943 ?AUTO_3948 ) ) ( not ( = ?AUTO_3943 ?AUTO_3946 ) ) ( not ( = ?AUTO_3944 ?AUTO_3948 ) ) ( not ( = ?AUTO_3944 ?AUTO_3946 ) ) ( not ( = ?AUTO_3948 ?AUTO_3946 ) ) ( ON ?AUTO_3948 ?AUTO_3943 ) ( CLEAR ?AUTO_3945 ) ( not ( = ?AUTO_3943 ?AUTO_3949 ) ) ( not ( = ?AUTO_3943 ?AUTO_3945 ) ) ( not ( = ?AUTO_3944 ?AUTO_3949 ) ) ( not ( = ?AUTO_3944 ?AUTO_3945 ) ) ( not ( = ?AUTO_3946 ?AUTO_3949 ) ) ( not ( = ?AUTO_3946 ?AUTO_3945 ) ) ( not ( = ?AUTO_3948 ?AUTO_3949 ) ) ( not ( = ?AUTO_3948 ?AUTO_3945 ) ) ( not ( = ?AUTO_3949 ?AUTO_3945 ) ) ( ON ?AUTO_3949 ?AUTO_3948 ) ( CLEAR ?AUTO_3950 ) ( not ( = ?AUTO_3943 ?AUTO_3947 ) ) ( not ( = ?AUTO_3943 ?AUTO_3950 ) ) ( not ( = ?AUTO_3944 ?AUTO_3947 ) ) ( not ( = ?AUTO_3944 ?AUTO_3950 ) ) ( not ( = ?AUTO_3946 ?AUTO_3947 ) ) ( not ( = ?AUTO_3946 ?AUTO_3950 ) ) ( not ( = ?AUTO_3948 ?AUTO_3947 ) ) ( not ( = ?AUTO_3948 ?AUTO_3950 ) ) ( not ( = ?AUTO_3945 ?AUTO_3947 ) ) ( not ( = ?AUTO_3945 ?AUTO_3950 ) ) ( not ( = ?AUTO_3949 ?AUTO_3947 ) ) ( not ( = ?AUTO_3949 ?AUTO_3950 ) ) ( not ( = ?AUTO_3947 ?AUTO_3950 ) ) ( ON ?AUTO_3947 ?AUTO_3949 ) ( CLEAR ?AUTO_3947 ) ( HOLDING ?AUTO_3944 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3944 )
      ( MAKE-ON ?AUTO_3943 ?AUTO_3944 )
      ( MAKE-ON-VERIFY ?AUTO_3943 ?AUTO_3944 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3963 - BLOCK
      ?AUTO_3964 - BLOCK
    )
    :vars
    (
      ?AUTO_3968 - BLOCK
      ?AUTO_3970 - BLOCK
      ?AUTO_3969 - BLOCK
      ?AUTO_3966 - BLOCK
      ?AUTO_3965 - BLOCK
      ?AUTO_3967 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3963 ?AUTO_3964 ) ) ( ON-TABLE ?AUTO_3963 ) ( CLEAR ?AUTO_3968 ) ( not ( = ?AUTO_3963 ?AUTO_3970 ) ) ( not ( = ?AUTO_3963 ?AUTO_3968 ) ) ( not ( = ?AUTO_3964 ?AUTO_3970 ) ) ( not ( = ?AUTO_3964 ?AUTO_3968 ) ) ( not ( = ?AUTO_3970 ?AUTO_3968 ) ) ( ON ?AUTO_3970 ?AUTO_3963 ) ( not ( = ?AUTO_3963 ?AUTO_3969 ) ) ( not ( = ?AUTO_3963 ?AUTO_3966 ) ) ( not ( = ?AUTO_3964 ?AUTO_3969 ) ) ( not ( = ?AUTO_3964 ?AUTO_3966 ) ) ( not ( = ?AUTO_3968 ?AUTO_3969 ) ) ( not ( = ?AUTO_3968 ?AUTO_3966 ) ) ( not ( = ?AUTO_3970 ?AUTO_3969 ) ) ( not ( = ?AUTO_3970 ?AUTO_3966 ) ) ( not ( = ?AUTO_3969 ?AUTO_3966 ) ) ( ON ?AUTO_3969 ?AUTO_3970 ) ( CLEAR ?AUTO_3969 ) ( CLEAR ?AUTO_3965 ) ( not ( = ?AUTO_3963 ?AUTO_3967 ) ) ( not ( = ?AUTO_3963 ?AUTO_3965 ) ) ( not ( = ?AUTO_3964 ?AUTO_3967 ) ) ( not ( = ?AUTO_3964 ?AUTO_3965 ) ) ( not ( = ?AUTO_3968 ?AUTO_3967 ) ) ( not ( = ?AUTO_3968 ?AUTO_3965 ) ) ( not ( = ?AUTO_3970 ?AUTO_3967 ) ) ( not ( = ?AUTO_3970 ?AUTO_3965 ) ) ( not ( = ?AUTO_3966 ?AUTO_3967 ) ) ( not ( = ?AUTO_3966 ?AUTO_3965 ) ) ( not ( = ?AUTO_3969 ?AUTO_3967 ) ) ( not ( = ?AUTO_3969 ?AUTO_3965 ) ) ( not ( = ?AUTO_3967 ?AUTO_3965 ) ) ( ON ?AUTO_3967 ?AUTO_3964 ) ( CLEAR ?AUTO_3967 ) ( HOLDING ?AUTO_3966 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3966 )
      ( MAKE-ON ?AUTO_3963 ?AUTO_3964 )
      ( MAKE-ON-VERIFY ?AUTO_3963 ?AUTO_3964 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3971 - BLOCK
      ?AUTO_3972 - BLOCK
    )
    :vars
    (
      ?AUTO_3976 - BLOCK
      ?AUTO_3975 - BLOCK
      ?AUTO_3973 - BLOCK
      ?AUTO_3977 - BLOCK
      ?AUTO_3974 - BLOCK
      ?AUTO_3978 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3971 ?AUTO_3972 ) ) ( ON-TABLE ?AUTO_3971 ) ( CLEAR ?AUTO_3976 ) ( not ( = ?AUTO_3971 ?AUTO_3975 ) ) ( not ( = ?AUTO_3971 ?AUTO_3976 ) ) ( not ( = ?AUTO_3972 ?AUTO_3975 ) ) ( not ( = ?AUTO_3972 ?AUTO_3976 ) ) ( not ( = ?AUTO_3975 ?AUTO_3976 ) ) ( ON ?AUTO_3975 ?AUTO_3971 ) ( not ( = ?AUTO_3971 ?AUTO_3973 ) ) ( not ( = ?AUTO_3971 ?AUTO_3977 ) ) ( not ( = ?AUTO_3972 ?AUTO_3973 ) ) ( not ( = ?AUTO_3972 ?AUTO_3977 ) ) ( not ( = ?AUTO_3976 ?AUTO_3973 ) ) ( not ( = ?AUTO_3976 ?AUTO_3977 ) ) ( not ( = ?AUTO_3975 ?AUTO_3973 ) ) ( not ( = ?AUTO_3975 ?AUTO_3977 ) ) ( not ( = ?AUTO_3973 ?AUTO_3977 ) ) ( ON ?AUTO_3973 ?AUTO_3975 ) ( CLEAR ?AUTO_3973 ) ( CLEAR ?AUTO_3974 ) ( not ( = ?AUTO_3971 ?AUTO_3978 ) ) ( not ( = ?AUTO_3971 ?AUTO_3974 ) ) ( not ( = ?AUTO_3972 ?AUTO_3978 ) ) ( not ( = ?AUTO_3972 ?AUTO_3974 ) ) ( not ( = ?AUTO_3976 ?AUTO_3978 ) ) ( not ( = ?AUTO_3976 ?AUTO_3974 ) ) ( not ( = ?AUTO_3975 ?AUTO_3978 ) ) ( not ( = ?AUTO_3975 ?AUTO_3974 ) ) ( not ( = ?AUTO_3977 ?AUTO_3978 ) ) ( not ( = ?AUTO_3977 ?AUTO_3974 ) ) ( not ( = ?AUTO_3973 ?AUTO_3978 ) ) ( not ( = ?AUTO_3973 ?AUTO_3974 ) ) ( not ( = ?AUTO_3978 ?AUTO_3974 ) ) ( ON ?AUTO_3978 ?AUTO_3972 ) ( ON ?AUTO_3977 ?AUTO_3978 ) ( CLEAR ?AUTO_3977 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3977 ?AUTO_3978 )
      ( MAKE-ON ?AUTO_3971 ?AUTO_3972 )
      ( MAKE-ON-VERIFY ?AUTO_3971 ?AUTO_3972 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3979 - BLOCK
      ?AUTO_3980 - BLOCK
    )
    :vars
    (
      ?AUTO_3986 - BLOCK
      ?AUTO_3981 - BLOCK
      ?AUTO_3982 - BLOCK
      ?AUTO_3983 - BLOCK
      ?AUTO_3985 - BLOCK
      ?AUTO_3984 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3979 ?AUTO_3980 ) ) ( ON-TABLE ?AUTO_3979 ) ( CLEAR ?AUTO_3986 ) ( not ( = ?AUTO_3979 ?AUTO_3981 ) ) ( not ( = ?AUTO_3979 ?AUTO_3986 ) ) ( not ( = ?AUTO_3980 ?AUTO_3981 ) ) ( not ( = ?AUTO_3980 ?AUTO_3986 ) ) ( not ( = ?AUTO_3981 ?AUTO_3986 ) ) ( ON ?AUTO_3981 ?AUTO_3979 ) ( not ( = ?AUTO_3979 ?AUTO_3982 ) ) ( not ( = ?AUTO_3979 ?AUTO_3983 ) ) ( not ( = ?AUTO_3980 ?AUTO_3982 ) ) ( not ( = ?AUTO_3980 ?AUTO_3983 ) ) ( not ( = ?AUTO_3986 ?AUTO_3982 ) ) ( not ( = ?AUTO_3986 ?AUTO_3983 ) ) ( not ( = ?AUTO_3981 ?AUTO_3982 ) ) ( not ( = ?AUTO_3981 ?AUTO_3983 ) ) ( not ( = ?AUTO_3982 ?AUTO_3983 ) ) ( CLEAR ?AUTO_3985 ) ( not ( = ?AUTO_3979 ?AUTO_3984 ) ) ( not ( = ?AUTO_3979 ?AUTO_3985 ) ) ( not ( = ?AUTO_3980 ?AUTO_3984 ) ) ( not ( = ?AUTO_3980 ?AUTO_3985 ) ) ( not ( = ?AUTO_3986 ?AUTO_3984 ) ) ( not ( = ?AUTO_3986 ?AUTO_3985 ) ) ( not ( = ?AUTO_3981 ?AUTO_3984 ) ) ( not ( = ?AUTO_3981 ?AUTO_3985 ) ) ( not ( = ?AUTO_3983 ?AUTO_3984 ) ) ( not ( = ?AUTO_3983 ?AUTO_3985 ) ) ( not ( = ?AUTO_3982 ?AUTO_3984 ) ) ( not ( = ?AUTO_3982 ?AUTO_3985 ) ) ( not ( = ?AUTO_3984 ?AUTO_3985 ) ) ( ON ?AUTO_3984 ?AUTO_3980 ) ( ON ?AUTO_3983 ?AUTO_3984 ) ( CLEAR ?AUTO_3983 ) ( HOLDING ?AUTO_3982 ) ( CLEAR ?AUTO_3981 ) )
    :subtasks
    ( ( !STACK ?AUTO_3982 ?AUTO_3981 )
      ( MAKE-ON ?AUTO_3979 ?AUTO_3980 )
      ( MAKE-ON-VERIFY ?AUTO_3979 ?AUTO_3980 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3987 - BLOCK
      ?AUTO_3988 - BLOCK
    )
    :vars
    (
      ?AUTO_3990 - BLOCK
      ?AUTO_3989 - BLOCK
      ?AUTO_3992 - BLOCK
      ?AUTO_3991 - BLOCK
      ?AUTO_3994 - BLOCK
      ?AUTO_3993 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3987 ?AUTO_3988 ) ) ( ON-TABLE ?AUTO_3987 ) ( CLEAR ?AUTO_3990 ) ( not ( = ?AUTO_3987 ?AUTO_3989 ) ) ( not ( = ?AUTO_3987 ?AUTO_3990 ) ) ( not ( = ?AUTO_3988 ?AUTO_3989 ) ) ( not ( = ?AUTO_3988 ?AUTO_3990 ) ) ( not ( = ?AUTO_3989 ?AUTO_3990 ) ) ( ON ?AUTO_3989 ?AUTO_3987 ) ( not ( = ?AUTO_3987 ?AUTO_3992 ) ) ( not ( = ?AUTO_3987 ?AUTO_3991 ) ) ( not ( = ?AUTO_3988 ?AUTO_3992 ) ) ( not ( = ?AUTO_3988 ?AUTO_3991 ) ) ( not ( = ?AUTO_3990 ?AUTO_3992 ) ) ( not ( = ?AUTO_3990 ?AUTO_3991 ) ) ( not ( = ?AUTO_3989 ?AUTO_3992 ) ) ( not ( = ?AUTO_3989 ?AUTO_3991 ) ) ( not ( = ?AUTO_3992 ?AUTO_3991 ) ) ( CLEAR ?AUTO_3994 ) ( not ( = ?AUTO_3987 ?AUTO_3993 ) ) ( not ( = ?AUTO_3987 ?AUTO_3994 ) ) ( not ( = ?AUTO_3988 ?AUTO_3993 ) ) ( not ( = ?AUTO_3988 ?AUTO_3994 ) ) ( not ( = ?AUTO_3990 ?AUTO_3993 ) ) ( not ( = ?AUTO_3990 ?AUTO_3994 ) ) ( not ( = ?AUTO_3989 ?AUTO_3993 ) ) ( not ( = ?AUTO_3989 ?AUTO_3994 ) ) ( not ( = ?AUTO_3991 ?AUTO_3993 ) ) ( not ( = ?AUTO_3991 ?AUTO_3994 ) ) ( not ( = ?AUTO_3992 ?AUTO_3993 ) ) ( not ( = ?AUTO_3992 ?AUTO_3994 ) ) ( not ( = ?AUTO_3993 ?AUTO_3994 ) ) ( ON ?AUTO_3993 ?AUTO_3988 ) ( ON ?AUTO_3991 ?AUTO_3993 ) ( CLEAR ?AUTO_3991 ) ( CLEAR ?AUTO_3989 ) ( ON-TABLE ?AUTO_3992 ) ( CLEAR ?AUTO_3992 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_3992 )
      ( MAKE-ON ?AUTO_3987 ?AUTO_3988 )
      ( MAKE-ON-VERIFY ?AUTO_3987 ?AUTO_3988 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4005 - BLOCK
      ?AUTO_4006 - BLOCK
    )
    :vars
    (
      ?AUTO_4012 - BLOCK
      ?AUTO_4011 - BLOCK
      ?AUTO_4009 - BLOCK
      ?AUTO_4010 - BLOCK
      ?AUTO_4007 - BLOCK
      ?AUTO_4008 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4005 ?AUTO_4006 ) ) ( ON-TABLE ?AUTO_4005 ) ( not ( = ?AUTO_4005 ?AUTO_4012 ) ) ( not ( = ?AUTO_4005 ?AUTO_4011 ) ) ( not ( = ?AUTO_4006 ?AUTO_4012 ) ) ( not ( = ?AUTO_4006 ?AUTO_4011 ) ) ( not ( = ?AUTO_4012 ?AUTO_4011 ) ) ( ON ?AUTO_4012 ?AUTO_4005 ) ( not ( = ?AUTO_4005 ?AUTO_4009 ) ) ( not ( = ?AUTO_4005 ?AUTO_4010 ) ) ( not ( = ?AUTO_4006 ?AUTO_4009 ) ) ( not ( = ?AUTO_4006 ?AUTO_4010 ) ) ( not ( = ?AUTO_4011 ?AUTO_4009 ) ) ( not ( = ?AUTO_4011 ?AUTO_4010 ) ) ( not ( = ?AUTO_4012 ?AUTO_4009 ) ) ( not ( = ?AUTO_4012 ?AUTO_4010 ) ) ( not ( = ?AUTO_4009 ?AUTO_4010 ) ) ( CLEAR ?AUTO_4007 ) ( not ( = ?AUTO_4005 ?AUTO_4008 ) ) ( not ( = ?AUTO_4005 ?AUTO_4007 ) ) ( not ( = ?AUTO_4006 ?AUTO_4008 ) ) ( not ( = ?AUTO_4006 ?AUTO_4007 ) ) ( not ( = ?AUTO_4011 ?AUTO_4008 ) ) ( not ( = ?AUTO_4011 ?AUTO_4007 ) ) ( not ( = ?AUTO_4012 ?AUTO_4008 ) ) ( not ( = ?AUTO_4012 ?AUTO_4007 ) ) ( not ( = ?AUTO_4010 ?AUTO_4008 ) ) ( not ( = ?AUTO_4010 ?AUTO_4007 ) ) ( not ( = ?AUTO_4009 ?AUTO_4008 ) ) ( not ( = ?AUTO_4009 ?AUTO_4007 ) ) ( not ( = ?AUTO_4008 ?AUTO_4007 ) ) ( ON ?AUTO_4008 ?AUTO_4006 ) ( ON ?AUTO_4010 ?AUTO_4008 ) ( CLEAR ?AUTO_4010 ) ( CLEAR ?AUTO_4012 ) ( ON ?AUTO_4009 ?AUTO_4011 ) ( CLEAR ?AUTO_4009 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4009 ?AUTO_4011 )
      ( MAKE-ON ?AUTO_4005 ?AUTO_4006 )
      ( MAKE-ON-VERIFY ?AUTO_4005 ?AUTO_4006 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4193 - BLOCK
      ?AUTO_4194 - BLOCK
    )
    :vars
    (
      ?AUTO_4200 - BLOCK
      ?AUTO_4195 - BLOCK
      ?AUTO_4196 - BLOCK
      ?AUTO_4199 - BLOCK
      ?AUTO_4197 - BLOCK
      ?AUTO_4198 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4193 ?AUTO_4194 ) ) ( ON ?AUTO_4193 ?AUTO_4200 ) ( CLEAR ?AUTO_4193 ) ( not ( = ?AUTO_4193 ?AUTO_4200 ) ) ( not ( = ?AUTO_4194 ?AUTO_4200 ) ) ( not ( = ?AUTO_4193 ?AUTO_4195 ) ) ( not ( = ?AUTO_4194 ?AUTO_4195 ) ) ( not ( = ?AUTO_4200 ?AUTO_4195 ) ) ( ON ?AUTO_4195 ?AUTO_4194 ) ( not ( = ?AUTO_4193 ?AUTO_4196 ) ) ( not ( = ?AUTO_4194 ?AUTO_4196 ) ) ( not ( = ?AUTO_4200 ?AUTO_4196 ) ) ( not ( = ?AUTO_4195 ?AUTO_4196 ) ) ( ON ?AUTO_4196 ?AUTO_4195 ) ( not ( = ?AUTO_4193 ?AUTO_4199 ) ) ( not ( = ?AUTO_4193 ?AUTO_4197 ) ) ( not ( = ?AUTO_4194 ?AUTO_4199 ) ) ( not ( = ?AUTO_4194 ?AUTO_4197 ) ) ( not ( = ?AUTO_4200 ?AUTO_4199 ) ) ( not ( = ?AUTO_4200 ?AUTO_4197 ) ) ( not ( = ?AUTO_4195 ?AUTO_4199 ) ) ( not ( = ?AUTO_4195 ?AUTO_4197 ) ) ( not ( = ?AUTO_4196 ?AUTO_4199 ) ) ( not ( = ?AUTO_4196 ?AUTO_4197 ) ) ( not ( = ?AUTO_4199 ?AUTO_4197 ) ) ( ON ?AUTO_4199 ?AUTO_4196 ) ( not ( = ?AUTO_4193 ?AUTO_4198 ) ) ( not ( = ?AUTO_4194 ?AUTO_4198 ) ) ( not ( = ?AUTO_4200 ?AUTO_4198 ) ) ( not ( = ?AUTO_4195 ?AUTO_4198 ) ) ( not ( = ?AUTO_4196 ?AUTO_4198 ) ) ( not ( = ?AUTO_4197 ?AUTO_4198 ) ) ( not ( = ?AUTO_4199 ?AUTO_4198 ) ) ( ON ?AUTO_4198 ?AUTO_4199 ) ( CLEAR ?AUTO_4198 ) ( HOLDING ?AUTO_4197 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4197 )
      ( MAKE-ON ?AUTO_4193 ?AUTO_4194 )
      ( MAKE-ON-VERIFY ?AUTO_4193 ?AUTO_4194 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4201 - BLOCK
      ?AUTO_4202 - BLOCK
    )
    :vars
    (
      ?AUTO_4207 - BLOCK
      ?AUTO_4205 - BLOCK
      ?AUTO_4208 - BLOCK
      ?AUTO_4203 - BLOCK
      ?AUTO_4206 - BLOCK
      ?AUTO_4204 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4201 ?AUTO_4202 ) ) ( ON ?AUTO_4201 ?AUTO_4207 ) ( not ( = ?AUTO_4201 ?AUTO_4207 ) ) ( not ( = ?AUTO_4202 ?AUTO_4207 ) ) ( not ( = ?AUTO_4201 ?AUTO_4205 ) ) ( not ( = ?AUTO_4202 ?AUTO_4205 ) ) ( not ( = ?AUTO_4207 ?AUTO_4205 ) ) ( ON ?AUTO_4205 ?AUTO_4202 ) ( not ( = ?AUTO_4201 ?AUTO_4208 ) ) ( not ( = ?AUTO_4202 ?AUTO_4208 ) ) ( not ( = ?AUTO_4207 ?AUTO_4208 ) ) ( not ( = ?AUTO_4205 ?AUTO_4208 ) ) ( ON ?AUTO_4208 ?AUTO_4205 ) ( not ( = ?AUTO_4201 ?AUTO_4203 ) ) ( not ( = ?AUTO_4201 ?AUTO_4206 ) ) ( not ( = ?AUTO_4202 ?AUTO_4203 ) ) ( not ( = ?AUTO_4202 ?AUTO_4206 ) ) ( not ( = ?AUTO_4207 ?AUTO_4203 ) ) ( not ( = ?AUTO_4207 ?AUTO_4206 ) ) ( not ( = ?AUTO_4205 ?AUTO_4203 ) ) ( not ( = ?AUTO_4205 ?AUTO_4206 ) ) ( not ( = ?AUTO_4208 ?AUTO_4203 ) ) ( not ( = ?AUTO_4208 ?AUTO_4206 ) ) ( not ( = ?AUTO_4203 ?AUTO_4206 ) ) ( ON ?AUTO_4203 ?AUTO_4208 ) ( not ( = ?AUTO_4201 ?AUTO_4204 ) ) ( not ( = ?AUTO_4202 ?AUTO_4204 ) ) ( not ( = ?AUTO_4207 ?AUTO_4204 ) ) ( not ( = ?AUTO_4205 ?AUTO_4204 ) ) ( not ( = ?AUTO_4208 ?AUTO_4204 ) ) ( not ( = ?AUTO_4206 ?AUTO_4204 ) ) ( not ( = ?AUTO_4203 ?AUTO_4204 ) ) ( ON ?AUTO_4204 ?AUTO_4203 ) ( CLEAR ?AUTO_4204 ) ( ON ?AUTO_4206 ?AUTO_4201 ) ( CLEAR ?AUTO_4206 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4206 ?AUTO_4201 )
      ( MAKE-ON ?AUTO_4201 ?AUTO_4202 )
      ( MAKE-ON-VERIFY ?AUTO_4201 ?AUTO_4202 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4352 - BLOCK
      ?AUTO_4353 - BLOCK
    )
    :vars
    (
      ?AUTO_4355 - BLOCK
      ?AUTO_4359 - BLOCK
      ?AUTO_4358 - BLOCK
      ?AUTO_4357 - BLOCK
      ?AUTO_4354 - BLOCK
      ?AUTO_4356 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4352 ?AUTO_4353 ) ) ( ON ?AUTO_4352 ?AUTO_4355 ) ( not ( = ?AUTO_4352 ?AUTO_4355 ) ) ( not ( = ?AUTO_4353 ?AUTO_4355 ) ) ( not ( = ?AUTO_4352 ?AUTO_4359 ) ) ( not ( = ?AUTO_4352 ?AUTO_4358 ) ) ( not ( = ?AUTO_4353 ?AUTO_4359 ) ) ( not ( = ?AUTO_4353 ?AUTO_4358 ) ) ( not ( = ?AUTO_4355 ?AUTO_4359 ) ) ( not ( = ?AUTO_4355 ?AUTO_4358 ) ) ( not ( = ?AUTO_4359 ?AUTO_4358 ) ) ( ON ?AUTO_4359 ?AUTO_4352 ) ( CLEAR ?AUTO_4359 ) ( not ( = ?AUTO_4352 ?AUTO_4357 ) ) ( not ( = ?AUTO_4353 ?AUTO_4357 ) ) ( not ( = ?AUTO_4355 ?AUTO_4357 ) ) ( not ( = ?AUTO_4358 ?AUTO_4357 ) ) ( not ( = ?AUTO_4359 ?AUTO_4357 ) ) ( ON ?AUTO_4357 ?AUTO_4353 ) ( not ( = ?AUTO_4352 ?AUTO_4354 ) ) ( not ( = ?AUTO_4352 ?AUTO_4356 ) ) ( not ( = ?AUTO_4353 ?AUTO_4354 ) ) ( not ( = ?AUTO_4353 ?AUTO_4356 ) ) ( not ( = ?AUTO_4355 ?AUTO_4354 ) ) ( not ( = ?AUTO_4355 ?AUTO_4356 ) ) ( not ( = ?AUTO_4358 ?AUTO_4354 ) ) ( not ( = ?AUTO_4358 ?AUTO_4356 ) ) ( not ( = ?AUTO_4359 ?AUTO_4354 ) ) ( not ( = ?AUTO_4359 ?AUTO_4356 ) ) ( not ( = ?AUTO_4357 ?AUTO_4354 ) ) ( not ( = ?AUTO_4357 ?AUTO_4356 ) ) ( not ( = ?AUTO_4354 ?AUTO_4356 ) ) ( ON ?AUTO_4354 ?AUTO_4357 ) ( ON ?AUTO_4356 ?AUTO_4354 ) ( CLEAR ?AUTO_4356 ) ( HOLDING ?AUTO_4358 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4358 )
      ( MAKE-ON ?AUTO_4352 ?AUTO_4353 )
      ( MAKE-ON-VERIFY ?AUTO_4352 ?AUTO_4353 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4360 - BLOCK
      ?AUTO_4361 - BLOCK
    )
    :vars
    (
      ?AUTO_4364 - BLOCK
      ?AUTO_4365 - BLOCK
      ?AUTO_4362 - BLOCK
      ?AUTO_4363 - BLOCK
      ?AUTO_4367 - BLOCK
      ?AUTO_4366 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4360 ?AUTO_4361 ) ) ( ON ?AUTO_4360 ?AUTO_4364 ) ( not ( = ?AUTO_4360 ?AUTO_4364 ) ) ( not ( = ?AUTO_4361 ?AUTO_4364 ) ) ( not ( = ?AUTO_4360 ?AUTO_4365 ) ) ( not ( = ?AUTO_4360 ?AUTO_4362 ) ) ( not ( = ?AUTO_4361 ?AUTO_4365 ) ) ( not ( = ?AUTO_4361 ?AUTO_4362 ) ) ( not ( = ?AUTO_4364 ?AUTO_4365 ) ) ( not ( = ?AUTO_4364 ?AUTO_4362 ) ) ( not ( = ?AUTO_4365 ?AUTO_4362 ) ) ( ON ?AUTO_4365 ?AUTO_4360 ) ( not ( = ?AUTO_4360 ?AUTO_4363 ) ) ( not ( = ?AUTO_4361 ?AUTO_4363 ) ) ( not ( = ?AUTO_4364 ?AUTO_4363 ) ) ( not ( = ?AUTO_4362 ?AUTO_4363 ) ) ( not ( = ?AUTO_4365 ?AUTO_4363 ) ) ( ON ?AUTO_4363 ?AUTO_4361 ) ( not ( = ?AUTO_4360 ?AUTO_4367 ) ) ( not ( = ?AUTO_4360 ?AUTO_4366 ) ) ( not ( = ?AUTO_4361 ?AUTO_4367 ) ) ( not ( = ?AUTO_4361 ?AUTO_4366 ) ) ( not ( = ?AUTO_4364 ?AUTO_4367 ) ) ( not ( = ?AUTO_4364 ?AUTO_4366 ) ) ( not ( = ?AUTO_4362 ?AUTO_4367 ) ) ( not ( = ?AUTO_4362 ?AUTO_4366 ) ) ( not ( = ?AUTO_4365 ?AUTO_4367 ) ) ( not ( = ?AUTO_4365 ?AUTO_4366 ) ) ( not ( = ?AUTO_4363 ?AUTO_4367 ) ) ( not ( = ?AUTO_4363 ?AUTO_4366 ) ) ( not ( = ?AUTO_4367 ?AUTO_4366 ) ) ( ON ?AUTO_4367 ?AUTO_4363 ) ( ON ?AUTO_4366 ?AUTO_4367 ) ( CLEAR ?AUTO_4366 ) ( ON ?AUTO_4362 ?AUTO_4365 ) ( CLEAR ?AUTO_4362 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4362 ?AUTO_4365 )
      ( MAKE-ON ?AUTO_4360 ?AUTO_4361 )
      ( MAKE-ON-VERIFY ?AUTO_4360 ?AUTO_4361 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4503 - BLOCK
      ?AUTO_4504 - BLOCK
    )
    :vars
    (
      ?AUTO_4505 - BLOCK
      ?AUTO_4507 - BLOCK
      ?AUTO_4508 - BLOCK
      ?AUTO_4509 - BLOCK
      ?AUTO_4506 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4503 ?AUTO_4504 ) ) ( ON ?AUTO_4503 ?AUTO_4505 ) ( not ( = ?AUTO_4503 ?AUTO_4505 ) ) ( not ( = ?AUTO_4504 ?AUTO_4505 ) ) ( not ( = ?AUTO_4503 ?AUTO_4507 ) ) ( not ( = ?AUTO_4503 ?AUTO_4508 ) ) ( not ( = ?AUTO_4504 ?AUTO_4507 ) ) ( not ( = ?AUTO_4504 ?AUTO_4508 ) ) ( not ( = ?AUTO_4505 ?AUTO_4507 ) ) ( not ( = ?AUTO_4505 ?AUTO_4508 ) ) ( not ( = ?AUTO_4507 ?AUTO_4508 ) ) ( ON ?AUTO_4507 ?AUTO_4503 ) ( not ( = ?AUTO_4503 ?AUTO_4509 ) ) ( not ( = ?AUTO_4504 ?AUTO_4509 ) ) ( not ( = ?AUTO_4505 ?AUTO_4509 ) ) ( not ( = ?AUTO_4508 ?AUTO_4509 ) ) ( not ( = ?AUTO_4507 ?AUTO_4509 ) ) ( ON ?AUTO_4509 ?AUTO_4504 ) ( not ( = ?AUTO_4503 ?AUTO_4506 ) ) ( not ( = ?AUTO_4504 ?AUTO_4506 ) ) ( not ( = ?AUTO_4505 ?AUTO_4506 ) ) ( not ( = ?AUTO_4508 ?AUTO_4506 ) ) ( not ( = ?AUTO_4507 ?AUTO_4506 ) ) ( not ( = ?AUTO_4509 ?AUTO_4506 ) ) ( ON ?AUTO_4506 ?AUTO_4507 ) ( CLEAR ?AUTO_4506 ) ( ON ?AUTO_4508 ?AUTO_4509 ) ( CLEAR ?AUTO_4508 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4508 ?AUTO_4509 )
      ( MAKE-ON ?AUTO_4503 ?AUTO_4504 )
      ( MAKE-ON-VERIFY ?AUTO_4503 ?AUTO_4504 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4825 - BLOCK
      ?AUTO_4826 - BLOCK
    )
    :vars
    (
      ?AUTO_4827 - BLOCK
      ?AUTO_4830 - BLOCK
      ?AUTO_4831 - BLOCK
      ?AUTO_4828 - BLOCK
      ?AUTO_4829 - BLOCK
      ?AUTO_4832 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4825 ?AUTO_4826 ) ) ( ON-TABLE ?AUTO_4825 ) ( not ( = ?AUTO_4825 ?AUTO_4827 ) ) ( not ( = ?AUTO_4825 ?AUTO_4830 ) ) ( not ( = ?AUTO_4826 ?AUTO_4827 ) ) ( not ( = ?AUTO_4826 ?AUTO_4830 ) ) ( not ( = ?AUTO_4827 ?AUTO_4830 ) ) ( ON ?AUTO_4827 ?AUTO_4826 ) ( not ( = ?AUTO_4825 ?AUTO_4831 ) ) ( not ( = ?AUTO_4825 ?AUTO_4828 ) ) ( not ( = ?AUTO_4826 ?AUTO_4831 ) ) ( not ( = ?AUTO_4826 ?AUTO_4828 ) ) ( not ( = ?AUTO_4830 ?AUTO_4831 ) ) ( not ( = ?AUTO_4830 ?AUTO_4828 ) ) ( not ( = ?AUTO_4827 ?AUTO_4831 ) ) ( not ( = ?AUTO_4827 ?AUTO_4828 ) ) ( not ( = ?AUTO_4831 ?AUTO_4828 ) ) ( ON ?AUTO_4831 ?AUTO_4827 ) ( not ( = ?AUTO_4825 ?AUTO_4829 ) ) ( not ( = ?AUTO_4826 ?AUTO_4829 ) ) ( not ( = ?AUTO_4830 ?AUTO_4829 ) ) ( not ( = ?AUTO_4827 ?AUTO_4829 ) ) ( not ( = ?AUTO_4828 ?AUTO_4829 ) ) ( not ( = ?AUTO_4831 ?AUTO_4829 ) ) ( ON ?AUTO_4829 ?AUTO_4831 ) ( ON ?AUTO_4830 ?AUTO_4825 ) ( ON ?AUTO_4828 ?AUTO_4830 ) ( CLEAR ?AUTO_4828 ) ( not ( = ?AUTO_4825 ?AUTO_4832 ) ) ( not ( = ?AUTO_4826 ?AUTO_4832 ) ) ( not ( = ?AUTO_4827 ?AUTO_4832 ) ) ( not ( = ?AUTO_4830 ?AUTO_4832 ) ) ( not ( = ?AUTO_4831 ?AUTO_4832 ) ) ( not ( = ?AUTO_4828 ?AUTO_4832 ) ) ( not ( = ?AUTO_4829 ?AUTO_4832 ) ) ( ON ?AUTO_4832 ?AUTO_4829 ) ( CLEAR ?AUTO_4832 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4832 ?AUTO_4829 )
      ( MAKE-ON ?AUTO_4825 ?AUTO_4826 )
      ( MAKE-ON-VERIFY ?AUTO_4825 ?AUTO_4826 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4908 - BLOCK
      ?AUTO_4909 - BLOCK
    )
    :vars
    (
      ?AUTO_4913 - BLOCK
      ?AUTO_4911 - BLOCK
      ?AUTO_4912 - BLOCK
      ?AUTO_4910 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4908 ?AUTO_4909 ) ) ( not ( = ?AUTO_4908 ?AUTO_4913 ) ) ( not ( = ?AUTO_4908 ?AUTO_4911 ) ) ( not ( = ?AUTO_4909 ?AUTO_4913 ) ) ( not ( = ?AUTO_4909 ?AUTO_4911 ) ) ( not ( = ?AUTO_4913 ?AUTO_4911 ) ) ( ON ?AUTO_4913 ?AUTO_4909 ) ( CLEAR ?AUTO_4912 ) ( not ( = ?AUTO_4908 ?AUTO_4910 ) ) ( not ( = ?AUTO_4908 ?AUTO_4912 ) ) ( not ( = ?AUTO_4909 ?AUTO_4910 ) ) ( not ( = ?AUTO_4909 ?AUTO_4912 ) ) ( not ( = ?AUTO_4911 ?AUTO_4910 ) ) ( not ( = ?AUTO_4911 ?AUTO_4912 ) ) ( not ( = ?AUTO_4913 ?AUTO_4910 ) ) ( not ( = ?AUTO_4913 ?AUTO_4912 ) ) ( not ( = ?AUTO_4910 ?AUTO_4912 ) ) ( ON ?AUTO_4910 ?AUTO_4913 ) ( CLEAR ?AUTO_4910 ) ( ON ?AUTO_4908 ?AUTO_4911 ) ( CLEAR ?AUTO_4908 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4908 ?AUTO_4911 )
      ( MAKE-ON ?AUTO_4908 ?AUTO_4909 )
      ( MAKE-ON-VERIFY ?AUTO_4908 ?AUTO_4909 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5126 - BLOCK
      ?AUTO_5127 - BLOCK
    )
    :vars
    (
      ?AUTO_5129 - BLOCK
      ?AUTO_5132 - BLOCK
      ?AUTO_5128 - BLOCK
      ?AUTO_5130 - BLOCK
      ?AUTO_5131 - BLOCK
      ?AUTO_5133 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5126 ?AUTO_5127 ) ) ( ON ?AUTO_5126 ?AUTO_5129 ) ( not ( = ?AUTO_5126 ?AUTO_5129 ) ) ( not ( = ?AUTO_5127 ?AUTO_5129 ) ) ( not ( = ?AUTO_5126 ?AUTO_5132 ) ) ( not ( = ?AUTO_5127 ?AUTO_5132 ) ) ( not ( = ?AUTO_5129 ?AUTO_5132 ) ) ( ON ?AUTO_5132 ?AUTO_5126 ) ( not ( = ?AUTO_5126 ?AUTO_5128 ) ) ( not ( = ?AUTO_5127 ?AUTO_5128 ) ) ( not ( = ?AUTO_5129 ?AUTO_5128 ) ) ( not ( = ?AUTO_5132 ?AUTO_5128 ) ) ( ON ?AUTO_5128 ?AUTO_5132 ) ( CLEAR ?AUTO_5130 ) ( not ( = ?AUTO_5126 ?AUTO_5131 ) ) ( not ( = ?AUTO_5126 ?AUTO_5130 ) ) ( not ( = ?AUTO_5127 ?AUTO_5131 ) ) ( not ( = ?AUTO_5127 ?AUTO_5130 ) ) ( not ( = ?AUTO_5129 ?AUTO_5131 ) ) ( not ( = ?AUTO_5129 ?AUTO_5130 ) ) ( not ( = ?AUTO_5132 ?AUTO_5131 ) ) ( not ( = ?AUTO_5132 ?AUTO_5130 ) ) ( not ( = ?AUTO_5128 ?AUTO_5131 ) ) ( not ( = ?AUTO_5128 ?AUTO_5130 ) ) ( not ( = ?AUTO_5131 ?AUTO_5130 ) ) ( ON ?AUTO_5131 ?AUTO_5128 ) ( CLEAR ?AUTO_5131 ) ( HOLDING ?AUTO_5127 ) ( CLEAR ?AUTO_5133 ) ( not ( = ?AUTO_5126 ?AUTO_5133 ) ) ( not ( = ?AUTO_5127 ?AUTO_5133 ) ) ( not ( = ?AUTO_5129 ?AUTO_5133 ) ) ( not ( = ?AUTO_5132 ?AUTO_5133 ) ) ( not ( = ?AUTO_5128 ?AUTO_5133 ) ) ( not ( = ?AUTO_5130 ?AUTO_5133 ) ) ( not ( = ?AUTO_5131 ?AUTO_5133 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_5127 ?AUTO_5133 )
      ( MAKE-ON ?AUTO_5126 ?AUTO_5127 )
      ( MAKE-ON-VERIFY ?AUTO_5126 ?AUTO_5127 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5280 - BLOCK
      ?AUTO_5281 - BLOCK
    )
    :vars
    (
      ?AUTO_5285 - BLOCK
      ?AUTO_5286 - BLOCK
      ?AUTO_5282 - BLOCK
      ?AUTO_5283 - BLOCK
      ?AUTO_5284 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5280 ?AUTO_5281 ) ) ( not ( = ?AUTO_5280 ?AUTO_5285 ) ) ( not ( = ?AUTO_5281 ?AUTO_5285 ) ) ( CLEAR ?AUTO_5286 ) ( not ( = ?AUTO_5280 ?AUTO_5282 ) ) ( not ( = ?AUTO_5280 ?AUTO_5286 ) ) ( not ( = ?AUTO_5281 ?AUTO_5282 ) ) ( not ( = ?AUTO_5281 ?AUTO_5286 ) ) ( not ( = ?AUTO_5285 ?AUTO_5282 ) ) ( not ( = ?AUTO_5285 ?AUTO_5286 ) ) ( not ( = ?AUTO_5282 ?AUTO_5286 ) ) ( ON ?AUTO_5282 ?AUTO_5281 ) ( not ( = ?AUTO_5280 ?AUTO_5283 ) ) ( not ( = ?AUTO_5281 ?AUTO_5283 ) ) ( not ( = ?AUTO_5285 ?AUTO_5283 ) ) ( not ( = ?AUTO_5286 ?AUTO_5283 ) ) ( not ( = ?AUTO_5282 ?AUTO_5283 ) ) ( ON ?AUTO_5283 ?AUTO_5282 ) ( not ( = ?AUTO_5280 ?AUTO_5284 ) ) ( not ( = ?AUTO_5281 ?AUTO_5284 ) ) ( not ( = ?AUTO_5285 ?AUTO_5284 ) ) ( not ( = ?AUTO_5286 ?AUTO_5284 ) ) ( not ( = ?AUTO_5282 ?AUTO_5284 ) ) ( not ( = ?AUTO_5283 ?AUTO_5284 ) ) ( ON ?AUTO_5284 ?AUTO_5283 ) ( CLEAR ?AUTO_5284 ) ( HOLDING ?AUTO_5280 ) ( CLEAR ?AUTO_5285 ) )
    :subtasks
    ( ( !STACK ?AUTO_5280 ?AUTO_5285 )
      ( MAKE-ON ?AUTO_5280 ?AUTO_5281 )
      ( MAKE-ON-VERIFY ?AUTO_5280 ?AUTO_5281 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5568 - BLOCK
      ?AUTO_5569 - BLOCK
    )
    :vars
    (
      ?AUTO_5572 - BLOCK
      ?AUTO_5571 - BLOCK
      ?AUTO_5570 - BLOCK
      ?AUTO_5573 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5568 ?AUTO_5569 ) ) ( ON-TABLE ?AUTO_5568 ) ( not ( = ?AUTO_5568 ?AUTO_5572 ) ) ( not ( = ?AUTO_5569 ?AUTO_5572 ) ) ( ON ?AUTO_5572 ?AUTO_5568 ) ( not ( = ?AUTO_5568 ?AUTO_5571 ) ) ( not ( = ?AUTO_5568 ?AUTO_5570 ) ) ( not ( = ?AUTO_5569 ?AUTO_5571 ) ) ( not ( = ?AUTO_5569 ?AUTO_5570 ) ) ( not ( = ?AUTO_5572 ?AUTO_5571 ) ) ( not ( = ?AUTO_5572 ?AUTO_5570 ) ) ( not ( = ?AUTO_5571 ?AUTO_5570 ) ) ( ON ?AUTO_5571 ?AUTO_5569 ) ( CLEAR ?AUTO_5571 ) ( CLEAR ?AUTO_5573 ) ( not ( = ?AUTO_5568 ?AUTO_5573 ) ) ( not ( = ?AUTO_5569 ?AUTO_5573 ) ) ( not ( = ?AUTO_5572 ?AUTO_5573 ) ) ( not ( = ?AUTO_5571 ?AUTO_5573 ) ) ( not ( = ?AUTO_5570 ?AUTO_5573 ) ) ( ON ?AUTO_5570 ?AUTO_5572 ) ( CLEAR ?AUTO_5570 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5570 ?AUTO_5572 )
      ( MAKE-ON ?AUTO_5568 ?AUTO_5569 )
      ( MAKE-ON-VERIFY ?AUTO_5568 ?AUTO_5569 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5574 - BLOCK
      ?AUTO_5575 - BLOCK
    )
    :vars
    (
      ?AUTO_5579 - BLOCK
      ?AUTO_5577 - BLOCK
      ?AUTO_5578 - BLOCK
      ?AUTO_5576 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5574 ?AUTO_5575 ) ) ( ON-TABLE ?AUTO_5574 ) ( not ( = ?AUTO_5574 ?AUTO_5579 ) ) ( not ( = ?AUTO_5575 ?AUTO_5579 ) ) ( ON ?AUTO_5579 ?AUTO_5574 ) ( not ( = ?AUTO_5574 ?AUTO_5577 ) ) ( not ( = ?AUTO_5574 ?AUTO_5578 ) ) ( not ( = ?AUTO_5575 ?AUTO_5577 ) ) ( not ( = ?AUTO_5575 ?AUTO_5578 ) ) ( not ( = ?AUTO_5579 ?AUTO_5577 ) ) ( not ( = ?AUTO_5579 ?AUTO_5578 ) ) ( not ( = ?AUTO_5577 ?AUTO_5578 ) ) ( CLEAR ?AUTO_5576 ) ( not ( = ?AUTO_5574 ?AUTO_5576 ) ) ( not ( = ?AUTO_5575 ?AUTO_5576 ) ) ( not ( = ?AUTO_5579 ?AUTO_5576 ) ) ( not ( = ?AUTO_5577 ?AUTO_5576 ) ) ( not ( = ?AUTO_5578 ?AUTO_5576 ) ) ( ON ?AUTO_5578 ?AUTO_5579 ) ( CLEAR ?AUTO_5578 ) ( HOLDING ?AUTO_5577 ) ( CLEAR ?AUTO_5575 ) )
    :subtasks
    ( ( !STACK ?AUTO_5577 ?AUTO_5575 )
      ( MAKE-ON ?AUTO_5574 ?AUTO_5575 )
      ( MAKE-ON-VERIFY ?AUTO_5574 ?AUTO_5575 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5598 - BLOCK
      ?AUTO_5599 - BLOCK
    )
    :vars
    (
      ?AUTO_5604 - BLOCK
      ?AUTO_5601 - BLOCK
      ?AUTO_5600 - BLOCK
      ?AUTO_5605 - BLOCK
      ?AUTO_5602 - BLOCK
      ?AUTO_5603 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5598 ?AUTO_5599 ) ) ( ON-TABLE ?AUTO_5598 ) ( not ( = ?AUTO_5598 ?AUTO_5604 ) ) ( not ( = ?AUTO_5599 ?AUTO_5604 ) ) ( ON ?AUTO_5604 ?AUTO_5598 ) ( not ( = ?AUTO_5598 ?AUTO_5601 ) ) ( not ( = ?AUTO_5598 ?AUTO_5600 ) ) ( not ( = ?AUTO_5599 ?AUTO_5601 ) ) ( not ( = ?AUTO_5599 ?AUTO_5600 ) ) ( not ( = ?AUTO_5604 ?AUTO_5601 ) ) ( not ( = ?AUTO_5604 ?AUTO_5600 ) ) ( not ( = ?AUTO_5601 ?AUTO_5600 ) ) ( CLEAR ?AUTO_5605 ) ( not ( = ?AUTO_5598 ?AUTO_5605 ) ) ( not ( = ?AUTO_5599 ?AUTO_5605 ) ) ( not ( = ?AUTO_5604 ?AUTO_5605 ) ) ( not ( = ?AUTO_5601 ?AUTO_5605 ) ) ( not ( = ?AUTO_5600 ?AUTO_5605 ) ) ( ON ?AUTO_5600 ?AUTO_5604 ) ( ON ?AUTO_5601 ?AUTO_5600 ) ( CLEAR ?AUTO_5601 ) ( CLEAR ?AUTO_5602 ) ( not ( = ?AUTO_5598 ?AUTO_5603 ) ) ( not ( = ?AUTO_5598 ?AUTO_5602 ) ) ( not ( = ?AUTO_5599 ?AUTO_5603 ) ) ( not ( = ?AUTO_5599 ?AUTO_5602 ) ) ( not ( = ?AUTO_5604 ?AUTO_5603 ) ) ( not ( = ?AUTO_5604 ?AUTO_5602 ) ) ( not ( = ?AUTO_5601 ?AUTO_5603 ) ) ( not ( = ?AUTO_5601 ?AUTO_5602 ) ) ( not ( = ?AUTO_5600 ?AUTO_5603 ) ) ( not ( = ?AUTO_5600 ?AUTO_5602 ) ) ( not ( = ?AUTO_5605 ?AUTO_5603 ) ) ( not ( = ?AUTO_5605 ?AUTO_5602 ) ) ( not ( = ?AUTO_5603 ?AUTO_5602 ) ) ( ON ?AUTO_5603 ?AUTO_5599 ) ( CLEAR ?AUTO_5603 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5603 ?AUTO_5599 )
      ( MAKE-ON ?AUTO_5598 ?AUTO_5599 )
      ( MAKE-ON-VERIFY ?AUTO_5598 ?AUTO_5599 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5615 - BLOCK
      ?AUTO_5616 - BLOCK
    )
    :vars
    (
      ?AUTO_5618 - BLOCK
      ?AUTO_5621 - BLOCK
      ?AUTO_5620 - BLOCK
      ?AUTO_5623 - BLOCK
      ?AUTO_5619 - BLOCK
      ?AUTO_5617 - BLOCK
      ?AUTO_5622 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5615 ?AUTO_5616 ) ) ( ON-TABLE ?AUTO_5615 ) ( not ( = ?AUTO_5615 ?AUTO_5618 ) ) ( not ( = ?AUTO_5616 ?AUTO_5618 ) ) ( ON ?AUTO_5618 ?AUTO_5615 ) ( not ( = ?AUTO_5615 ?AUTO_5621 ) ) ( not ( = ?AUTO_5615 ?AUTO_5620 ) ) ( not ( = ?AUTO_5616 ?AUTO_5621 ) ) ( not ( = ?AUTO_5616 ?AUTO_5620 ) ) ( not ( = ?AUTO_5618 ?AUTO_5621 ) ) ( not ( = ?AUTO_5618 ?AUTO_5620 ) ) ( not ( = ?AUTO_5621 ?AUTO_5620 ) ) ( CLEAR ?AUTO_5623 ) ( not ( = ?AUTO_5615 ?AUTO_5623 ) ) ( not ( = ?AUTO_5616 ?AUTO_5623 ) ) ( not ( = ?AUTO_5618 ?AUTO_5623 ) ) ( not ( = ?AUTO_5621 ?AUTO_5623 ) ) ( not ( = ?AUTO_5620 ?AUTO_5623 ) ) ( ON ?AUTO_5620 ?AUTO_5618 ) ( ON ?AUTO_5621 ?AUTO_5620 ) ( CLEAR ?AUTO_5621 ) ( CLEAR ?AUTO_5619 ) ( not ( = ?AUTO_5615 ?AUTO_5617 ) ) ( not ( = ?AUTO_5615 ?AUTO_5619 ) ) ( not ( = ?AUTO_5616 ?AUTO_5617 ) ) ( not ( = ?AUTO_5616 ?AUTO_5619 ) ) ( not ( = ?AUTO_5618 ?AUTO_5617 ) ) ( not ( = ?AUTO_5618 ?AUTO_5619 ) ) ( not ( = ?AUTO_5621 ?AUTO_5617 ) ) ( not ( = ?AUTO_5621 ?AUTO_5619 ) ) ( not ( = ?AUTO_5620 ?AUTO_5617 ) ) ( not ( = ?AUTO_5620 ?AUTO_5619 ) ) ( not ( = ?AUTO_5623 ?AUTO_5617 ) ) ( not ( = ?AUTO_5623 ?AUTO_5619 ) ) ( not ( = ?AUTO_5617 ?AUTO_5619 ) ) ( ON ?AUTO_5617 ?AUTO_5616 ) ( not ( = ?AUTO_5615 ?AUTO_5622 ) ) ( not ( = ?AUTO_5616 ?AUTO_5622 ) ) ( not ( = ?AUTO_5618 ?AUTO_5622 ) ) ( not ( = ?AUTO_5621 ?AUTO_5622 ) ) ( not ( = ?AUTO_5620 ?AUTO_5622 ) ) ( not ( = ?AUTO_5623 ?AUTO_5622 ) ) ( not ( = ?AUTO_5619 ?AUTO_5622 ) ) ( not ( = ?AUTO_5617 ?AUTO_5622 ) ) ( ON ?AUTO_5622 ?AUTO_5617 ) ( CLEAR ?AUTO_5622 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5622 ?AUTO_5617 )
      ( MAKE-ON ?AUTO_5615 ?AUTO_5616 )
      ( MAKE-ON-VERIFY ?AUTO_5615 ?AUTO_5616 ) )
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
      ?AUTO_5629 - BLOCK
      ?AUTO_5630 - BLOCK
      ?AUTO_5627 - BLOCK
      ?AUTO_5631 - BLOCK
      ?AUTO_5628 - BLOCK
      ?AUTO_5632 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5624 ?AUTO_5625 ) ) ( ON-TABLE ?AUTO_5624 ) ( not ( = ?AUTO_5624 ?AUTO_5626 ) ) ( not ( = ?AUTO_5625 ?AUTO_5626 ) ) ( ON ?AUTO_5626 ?AUTO_5624 ) ( not ( = ?AUTO_5624 ?AUTO_5629 ) ) ( not ( = ?AUTO_5624 ?AUTO_5630 ) ) ( not ( = ?AUTO_5625 ?AUTO_5629 ) ) ( not ( = ?AUTO_5625 ?AUTO_5630 ) ) ( not ( = ?AUTO_5626 ?AUTO_5629 ) ) ( not ( = ?AUTO_5626 ?AUTO_5630 ) ) ( not ( = ?AUTO_5629 ?AUTO_5630 ) ) ( not ( = ?AUTO_5624 ?AUTO_5627 ) ) ( not ( = ?AUTO_5625 ?AUTO_5627 ) ) ( not ( = ?AUTO_5626 ?AUTO_5627 ) ) ( not ( = ?AUTO_5629 ?AUTO_5627 ) ) ( not ( = ?AUTO_5630 ?AUTO_5627 ) ) ( ON ?AUTO_5630 ?AUTO_5626 ) ( ON ?AUTO_5629 ?AUTO_5630 ) ( CLEAR ?AUTO_5629 ) ( CLEAR ?AUTO_5631 ) ( not ( = ?AUTO_5624 ?AUTO_5628 ) ) ( not ( = ?AUTO_5624 ?AUTO_5631 ) ) ( not ( = ?AUTO_5625 ?AUTO_5628 ) ) ( not ( = ?AUTO_5625 ?AUTO_5631 ) ) ( not ( = ?AUTO_5626 ?AUTO_5628 ) ) ( not ( = ?AUTO_5626 ?AUTO_5631 ) ) ( not ( = ?AUTO_5629 ?AUTO_5628 ) ) ( not ( = ?AUTO_5629 ?AUTO_5631 ) ) ( not ( = ?AUTO_5630 ?AUTO_5628 ) ) ( not ( = ?AUTO_5630 ?AUTO_5631 ) ) ( not ( = ?AUTO_5627 ?AUTO_5628 ) ) ( not ( = ?AUTO_5627 ?AUTO_5631 ) ) ( not ( = ?AUTO_5628 ?AUTO_5631 ) ) ( ON ?AUTO_5628 ?AUTO_5625 ) ( not ( = ?AUTO_5624 ?AUTO_5632 ) ) ( not ( = ?AUTO_5625 ?AUTO_5632 ) ) ( not ( = ?AUTO_5626 ?AUTO_5632 ) ) ( not ( = ?AUTO_5629 ?AUTO_5632 ) ) ( not ( = ?AUTO_5630 ?AUTO_5632 ) ) ( not ( = ?AUTO_5627 ?AUTO_5632 ) ) ( not ( = ?AUTO_5631 ?AUTO_5632 ) ) ( not ( = ?AUTO_5628 ?AUTO_5632 ) ) ( ON ?AUTO_5632 ?AUTO_5628 ) ( CLEAR ?AUTO_5632 ) ( HOLDING ?AUTO_5627 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5627 )
      ( MAKE-ON ?AUTO_5624 ?AUTO_5625 )
      ( MAKE-ON-VERIFY ?AUTO_5624 ?AUTO_5625 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5633 - BLOCK
      ?AUTO_5634 - BLOCK
    )
    :vars
    (
      ?AUTO_5639 - BLOCK
      ?AUTO_5638 - BLOCK
      ?AUTO_5636 - BLOCK
      ?AUTO_5640 - BLOCK
      ?AUTO_5635 - BLOCK
      ?AUTO_5641 - BLOCK
      ?AUTO_5637 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5633 ?AUTO_5634 ) ) ( ON-TABLE ?AUTO_5633 ) ( not ( = ?AUTO_5633 ?AUTO_5639 ) ) ( not ( = ?AUTO_5634 ?AUTO_5639 ) ) ( ON ?AUTO_5639 ?AUTO_5633 ) ( not ( = ?AUTO_5633 ?AUTO_5638 ) ) ( not ( = ?AUTO_5633 ?AUTO_5636 ) ) ( not ( = ?AUTO_5634 ?AUTO_5638 ) ) ( not ( = ?AUTO_5634 ?AUTO_5636 ) ) ( not ( = ?AUTO_5639 ?AUTO_5638 ) ) ( not ( = ?AUTO_5639 ?AUTO_5636 ) ) ( not ( = ?AUTO_5638 ?AUTO_5636 ) ) ( not ( = ?AUTO_5633 ?AUTO_5640 ) ) ( not ( = ?AUTO_5634 ?AUTO_5640 ) ) ( not ( = ?AUTO_5639 ?AUTO_5640 ) ) ( not ( = ?AUTO_5638 ?AUTO_5640 ) ) ( not ( = ?AUTO_5636 ?AUTO_5640 ) ) ( ON ?AUTO_5636 ?AUTO_5639 ) ( ON ?AUTO_5638 ?AUTO_5636 ) ( CLEAR ?AUTO_5638 ) ( CLEAR ?AUTO_5635 ) ( not ( = ?AUTO_5633 ?AUTO_5641 ) ) ( not ( = ?AUTO_5633 ?AUTO_5635 ) ) ( not ( = ?AUTO_5634 ?AUTO_5641 ) ) ( not ( = ?AUTO_5634 ?AUTO_5635 ) ) ( not ( = ?AUTO_5639 ?AUTO_5641 ) ) ( not ( = ?AUTO_5639 ?AUTO_5635 ) ) ( not ( = ?AUTO_5638 ?AUTO_5641 ) ) ( not ( = ?AUTO_5638 ?AUTO_5635 ) ) ( not ( = ?AUTO_5636 ?AUTO_5641 ) ) ( not ( = ?AUTO_5636 ?AUTO_5635 ) ) ( not ( = ?AUTO_5640 ?AUTO_5641 ) ) ( not ( = ?AUTO_5640 ?AUTO_5635 ) ) ( not ( = ?AUTO_5641 ?AUTO_5635 ) ) ( ON ?AUTO_5641 ?AUTO_5634 ) ( not ( = ?AUTO_5633 ?AUTO_5637 ) ) ( not ( = ?AUTO_5634 ?AUTO_5637 ) ) ( not ( = ?AUTO_5639 ?AUTO_5637 ) ) ( not ( = ?AUTO_5638 ?AUTO_5637 ) ) ( not ( = ?AUTO_5636 ?AUTO_5637 ) ) ( not ( = ?AUTO_5640 ?AUTO_5637 ) ) ( not ( = ?AUTO_5635 ?AUTO_5637 ) ) ( not ( = ?AUTO_5641 ?AUTO_5637 ) ) ( ON ?AUTO_5637 ?AUTO_5641 ) ( ON ?AUTO_5640 ?AUTO_5637 ) ( CLEAR ?AUTO_5640 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5640 ?AUTO_5637 )
      ( MAKE-ON ?AUTO_5633 ?AUTO_5634 )
      ( MAKE-ON-VERIFY ?AUTO_5633 ?AUTO_5634 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5642 - BLOCK
      ?AUTO_5643 - BLOCK
    )
    :vars
    (
      ?AUTO_5649 - BLOCK
      ?AUTO_5644 - BLOCK
      ?AUTO_5650 - BLOCK
      ?AUTO_5646 - BLOCK
      ?AUTO_5645 - BLOCK
      ?AUTO_5647 - BLOCK
      ?AUTO_5648 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5642 ?AUTO_5643 ) ) ( ON-TABLE ?AUTO_5642 ) ( not ( = ?AUTO_5642 ?AUTO_5649 ) ) ( not ( = ?AUTO_5643 ?AUTO_5649 ) ) ( ON ?AUTO_5649 ?AUTO_5642 ) ( not ( = ?AUTO_5642 ?AUTO_5644 ) ) ( not ( = ?AUTO_5642 ?AUTO_5650 ) ) ( not ( = ?AUTO_5643 ?AUTO_5644 ) ) ( not ( = ?AUTO_5643 ?AUTO_5650 ) ) ( not ( = ?AUTO_5649 ?AUTO_5644 ) ) ( not ( = ?AUTO_5649 ?AUTO_5650 ) ) ( not ( = ?AUTO_5644 ?AUTO_5650 ) ) ( not ( = ?AUTO_5642 ?AUTO_5646 ) ) ( not ( = ?AUTO_5643 ?AUTO_5646 ) ) ( not ( = ?AUTO_5649 ?AUTO_5646 ) ) ( not ( = ?AUTO_5644 ?AUTO_5646 ) ) ( not ( = ?AUTO_5650 ?AUTO_5646 ) ) ( ON ?AUTO_5650 ?AUTO_5649 ) ( CLEAR ?AUTO_5645 ) ( not ( = ?AUTO_5642 ?AUTO_5647 ) ) ( not ( = ?AUTO_5642 ?AUTO_5645 ) ) ( not ( = ?AUTO_5643 ?AUTO_5647 ) ) ( not ( = ?AUTO_5643 ?AUTO_5645 ) ) ( not ( = ?AUTO_5649 ?AUTO_5647 ) ) ( not ( = ?AUTO_5649 ?AUTO_5645 ) ) ( not ( = ?AUTO_5644 ?AUTO_5647 ) ) ( not ( = ?AUTO_5644 ?AUTO_5645 ) ) ( not ( = ?AUTO_5650 ?AUTO_5647 ) ) ( not ( = ?AUTO_5650 ?AUTO_5645 ) ) ( not ( = ?AUTO_5646 ?AUTO_5647 ) ) ( not ( = ?AUTO_5646 ?AUTO_5645 ) ) ( not ( = ?AUTO_5647 ?AUTO_5645 ) ) ( ON ?AUTO_5647 ?AUTO_5643 ) ( not ( = ?AUTO_5642 ?AUTO_5648 ) ) ( not ( = ?AUTO_5643 ?AUTO_5648 ) ) ( not ( = ?AUTO_5649 ?AUTO_5648 ) ) ( not ( = ?AUTO_5644 ?AUTO_5648 ) ) ( not ( = ?AUTO_5650 ?AUTO_5648 ) ) ( not ( = ?AUTO_5646 ?AUTO_5648 ) ) ( not ( = ?AUTO_5645 ?AUTO_5648 ) ) ( not ( = ?AUTO_5647 ?AUTO_5648 ) ) ( ON ?AUTO_5648 ?AUTO_5647 ) ( ON ?AUTO_5646 ?AUTO_5648 ) ( CLEAR ?AUTO_5646 ) ( HOLDING ?AUTO_5644 ) ( CLEAR ?AUTO_5650 ) )
    :subtasks
    ( ( !STACK ?AUTO_5644 ?AUTO_5650 )
      ( MAKE-ON ?AUTO_5642 ?AUTO_5643 )
      ( MAKE-ON-VERIFY ?AUTO_5642 ?AUTO_5643 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5660 - BLOCK
      ?AUTO_5661 - BLOCK
    )
    :vars
    (
      ?AUTO_5667 - BLOCK
      ?AUTO_5665 - BLOCK
      ?AUTO_5666 - BLOCK
      ?AUTO_5668 - BLOCK
      ?AUTO_5664 - BLOCK
      ?AUTO_5663 - BLOCK
      ?AUTO_5662 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5660 ?AUTO_5661 ) ) ( ON-TABLE ?AUTO_5660 ) ( not ( = ?AUTO_5660 ?AUTO_5667 ) ) ( not ( = ?AUTO_5661 ?AUTO_5667 ) ) ( ON ?AUTO_5667 ?AUTO_5660 ) ( not ( = ?AUTO_5660 ?AUTO_5665 ) ) ( not ( = ?AUTO_5660 ?AUTO_5666 ) ) ( not ( = ?AUTO_5661 ?AUTO_5665 ) ) ( not ( = ?AUTO_5661 ?AUTO_5666 ) ) ( not ( = ?AUTO_5667 ?AUTO_5665 ) ) ( not ( = ?AUTO_5667 ?AUTO_5666 ) ) ( not ( = ?AUTO_5665 ?AUTO_5666 ) ) ( not ( = ?AUTO_5660 ?AUTO_5668 ) ) ( not ( = ?AUTO_5661 ?AUTO_5668 ) ) ( not ( = ?AUTO_5667 ?AUTO_5668 ) ) ( not ( = ?AUTO_5665 ?AUTO_5668 ) ) ( not ( = ?AUTO_5666 ?AUTO_5668 ) ) ( CLEAR ?AUTO_5664 ) ( not ( = ?AUTO_5660 ?AUTO_5663 ) ) ( not ( = ?AUTO_5660 ?AUTO_5664 ) ) ( not ( = ?AUTO_5661 ?AUTO_5663 ) ) ( not ( = ?AUTO_5661 ?AUTO_5664 ) ) ( not ( = ?AUTO_5667 ?AUTO_5663 ) ) ( not ( = ?AUTO_5667 ?AUTO_5664 ) ) ( not ( = ?AUTO_5665 ?AUTO_5663 ) ) ( not ( = ?AUTO_5665 ?AUTO_5664 ) ) ( not ( = ?AUTO_5666 ?AUTO_5663 ) ) ( not ( = ?AUTO_5666 ?AUTO_5664 ) ) ( not ( = ?AUTO_5668 ?AUTO_5663 ) ) ( not ( = ?AUTO_5668 ?AUTO_5664 ) ) ( not ( = ?AUTO_5663 ?AUTO_5664 ) ) ( ON ?AUTO_5663 ?AUTO_5661 ) ( not ( = ?AUTO_5660 ?AUTO_5662 ) ) ( not ( = ?AUTO_5661 ?AUTO_5662 ) ) ( not ( = ?AUTO_5667 ?AUTO_5662 ) ) ( not ( = ?AUTO_5665 ?AUTO_5662 ) ) ( not ( = ?AUTO_5666 ?AUTO_5662 ) ) ( not ( = ?AUTO_5668 ?AUTO_5662 ) ) ( not ( = ?AUTO_5664 ?AUTO_5662 ) ) ( not ( = ?AUTO_5663 ?AUTO_5662 ) ) ( ON ?AUTO_5662 ?AUTO_5663 ) ( ON ?AUTO_5668 ?AUTO_5662 ) ( ON ?AUTO_5665 ?AUTO_5668 ) ( CLEAR ?AUTO_5665 ) ( HOLDING ?AUTO_5666 ) ( CLEAR ?AUTO_5667 ) )
    :subtasks
    ( ( !STACK ?AUTO_5666 ?AUTO_5667 )
      ( MAKE-ON ?AUTO_5660 ?AUTO_5661 )
      ( MAKE-ON-VERIFY ?AUTO_5660 ?AUTO_5661 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5669 - BLOCK
      ?AUTO_5670 - BLOCK
    )
    :vars
    (
      ?AUTO_5676 - BLOCK
      ?AUTO_5677 - BLOCK
      ?AUTO_5675 - BLOCK
      ?AUTO_5674 - BLOCK
      ?AUTO_5671 - BLOCK
      ?AUTO_5673 - BLOCK
      ?AUTO_5672 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5669 ?AUTO_5670 ) ) ( ON-TABLE ?AUTO_5669 ) ( not ( = ?AUTO_5669 ?AUTO_5676 ) ) ( not ( = ?AUTO_5670 ?AUTO_5676 ) ) ( ON ?AUTO_5676 ?AUTO_5669 ) ( not ( = ?AUTO_5669 ?AUTO_5677 ) ) ( not ( = ?AUTO_5669 ?AUTO_5675 ) ) ( not ( = ?AUTO_5670 ?AUTO_5677 ) ) ( not ( = ?AUTO_5670 ?AUTO_5675 ) ) ( not ( = ?AUTO_5676 ?AUTO_5677 ) ) ( not ( = ?AUTO_5676 ?AUTO_5675 ) ) ( not ( = ?AUTO_5677 ?AUTO_5675 ) ) ( not ( = ?AUTO_5669 ?AUTO_5674 ) ) ( not ( = ?AUTO_5670 ?AUTO_5674 ) ) ( not ( = ?AUTO_5676 ?AUTO_5674 ) ) ( not ( = ?AUTO_5677 ?AUTO_5674 ) ) ( not ( = ?AUTO_5675 ?AUTO_5674 ) ) ( CLEAR ?AUTO_5671 ) ( not ( = ?AUTO_5669 ?AUTO_5673 ) ) ( not ( = ?AUTO_5669 ?AUTO_5671 ) ) ( not ( = ?AUTO_5670 ?AUTO_5673 ) ) ( not ( = ?AUTO_5670 ?AUTO_5671 ) ) ( not ( = ?AUTO_5676 ?AUTO_5673 ) ) ( not ( = ?AUTO_5676 ?AUTO_5671 ) ) ( not ( = ?AUTO_5677 ?AUTO_5673 ) ) ( not ( = ?AUTO_5677 ?AUTO_5671 ) ) ( not ( = ?AUTO_5675 ?AUTO_5673 ) ) ( not ( = ?AUTO_5675 ?AUTO_5671 ) ) ( not ( = ?AUTO_5674 ?AUTO_5673 ) ) ( not ( = ?AUTO_5674 ?AUTO_5671 ) ) ( not ( = ?AUTO_5673 ?AUTO_5671 ) ) ( ON ?AUTO_5673 ?AUTO_5670 ) ( not ( = ?AUTO_5669 ?AUTO_5672 ) ) ( not ( = ?AUTO_5670 ?AUTO_5672 ) ) ( not ( = ?AUTO_5676 ?AUTO_5672 ) ) ( not ( = ?AUTO_5677 ?AUTO_5672 ) ) ( not ( = ?AUTO_5675 ?AUTO_5672 ) ) ( not ( = ?AUTO_5674 ?AUTO_5672 ) ) ( not ( = ?AUTO_5671 ?AUTO_5672 ) ) ( not ( = ?AUTO_5673 ?AUTO_5672 ) ) ( ON ?AUTO_5672 ?AUTO_5673 ) ( ON ?AUTO_5674 ?AUTO_5672 ) ( ON ?AUTO_5677 ?AUTO_5674 ) ( CLEAR ?AUTO_5677 ) ( CLEAR ?AUTO_5676 ) ( ON-TABLE ?AUTO_5675 ) ( CLEAR ?AUTO_5675 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_5675 )
      ( MAKE-ON ?AUTO_5669 ?AUTO_5670 )
      ( MAKE-ON-VERIFY ?AUTO_5669 ?AUTO_5670 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5678 - BLOCK
      ?AUTO_5679 - BLOCK
    )
    :vars
    (
      ?AUTO_5684 - BLOCK
      ?AUTO_5685 - BLOCK
      ?AUTO_5683 - BLOCK
      ?AUTO_5680 - BLOCK
      ?AUTO_5681 - BLOCK
      ?AUTO_5682 - BLOCK
      ?AUTO_5686 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5678 ?AUTO_5679 ) ) ( ON-TABLE ?AUTO_5678 ) ( not ( = ?AUTO_5678 ?AUTO_5684 ) ) ( not ( = ?AUTO_5679 ?AUTO_5684 ) ) ( not ( = ?AUTO_5678 ?AUTO_5685 ) ) ( not ( = ?AUTO_5678 ?AUTO_5683 ) ) ( not ( = ?AUTO_5679 ?AUTO_5685 ) ) ( not ( = ?AUTO_5679 ?AUTO_5683 ) ) ( not ( = ?AUTO_5684 ?AUTO_5685 ) ) ( not ( = ?AUTO_5684 ?AUTO_5683 ) ) ( not ( = ?AUTO_5685 ?AUTO_5683 ) ) ( not ( = ?AUTO_5678 ?AUTO_5680 ) ) ( not ( = ?AUTO_5679 ?AUTO_5680 ) ) ( not ( = ?AUTO_5684 ?AUTO_5680 ) ) ( not ( = ?AUTO_5685 ?AUTO_5680 ) ) ( not ( = ?AUTO_5683 ?AUTO_5680 ) ) ( CLEAR ?AUTO_5681 ) ( not ( = ?AUTO_5678 ?AUTO_5682 ) ) ( not ( = ?AUTO_5678 ?AUTO_5681 ) ) ( not ( = ?AUTO_5679 ?AUTO_5682 ) ) ( not ( = ?AUTO_5679 ?AUTO_5681 ) ) ( not ( = ?AUTO_5684 ?AUTO_5682 ) ) ( not ( = ?AUTO_5684 ?AUTO_5681 ) ) ( not ( = ?AUTO_5685 ?AUTO_5682 ) ) ( not ( = ?AUTO_5685 ?AUTO_5681 ) ) ( not ( = ?AUTO_5683 ?AUTO_5682 ) ) ( not ( = ?AUTO_5683 ?AUTO_5681 ) ) ( not ( = ?AUTO_5680 ?AUTO_5682 ) ) ( not ( = ?AUTO_5680 ?AUTO_5681 ) ) ( not ( = ?AUTO_5682 ?AUTO_5681 ) ) ( ON ?AUTO_5682 ?AUTO_5679 ) ( not ( = ?AUTO_5678 ?AUTO_5686 ) ) ( not ( = ?AUTO_5679 ?AUTO_5686 ) ) ( not ( = ?AUTO_5684 ?AUTO_5686 ) ) ( not ( = ?AUTO_5685 ?AUTO_5686 ) ) ( not ( = ?AUTO_5683 ?AUTO_5686 ) ) ( not ( = ?AUTO_5680 ?AUTO_5686 ) ) ( not ( = ?AUTO_5681 ?AUTO_5686 ) ) ( not ( = ?AUTO_5682 ?AUTO_5686 ) ) ( ON ?AUTO_5686 ?AUTO_5682 ) ( ON ?AUTO_5680 ?AUTO_5686 ) ( ON ?AUTO_5685 ?AUTO_5680 ) ( CLEAR ?AUTO_5685 ) ( ON-TABLE ?AUTO_5683 ) ( CLEAR ?AUTO_5683 ) ( HOLDING ?AUTO_5684 ) ( CLEAR ?AUTO_5678 ) )
    :subtasks
    ( ( !STACK ?AUTO_5684 ?AUTO_5678 )
      ( MAKE-ON ?AUTO_5678 ?AUTO_5679 )
      ( MAKE-ON-VERIFY ?AUTO_5678 ?AUTO_5679 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5687 - BLOCK
      ?AUTO_5688 - BLOCK
    )
    :vars
    (
      ?AUTO_5693 - BLOCK
      ?AUTO_5695 - BLOCK
      ?AUTO_5692 - BLOCK
      ?AUTO_5691 - BLOCK
      ?AUTO_5690 - BLOCK
      ?AUTO_5689 - BLOCK
      ?AUTO_5694 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5687 ?AUTO_5688 ) ) ( ON-TABLE ?AUTO_5687 ) ( not ( = ?AUTO_5687 ?AUTO_5693 ) ) ( not ( = ?AUTO_5688 ?AUTO_5693 ) ) ( not ( = ?AUTO_5687 ?AUTO_5695 ) ) ( not ( = ?AUTO_5687 ?AUTO_5692 ) ) ( not ( = ?AUTO_5688 ?AUTO_5695 ) ) ( not ( = ?AUTO_5688 ?AUTO_5692 ) ) ( not ( = ?AUTO_5693 ?AUTO_5695 ) ) ( not ( = ?AUTO_5693 ?AUTO_5692 ) ) ( not ( = ?AUTO_5695 ?AUTO_5692 ) ) ( not ( = ?AUTO_5687 ?AUTO_5691 ) ) ( not ( = ?AUTO_5688 ?AUTO_5691 ) ) ( not ( = ?AUTO_5693 ?AUTO_5691 ) ) ( not ( = ?AUTO_5695 ?AUTO_5691 ) ) ( not ( = ?AUTO_5692 ?AUTO_5691 ) ) ( CLEAR ?AUTO_5690 ) ( not ( = ?AUTO_5687 ?AUTO_5689 ) ) ( not ( = ?AUTO_5687 ?AUTO_5690 ) ) ( not ( = ?AUTO_5688 ?AUTO_5689 ) ) ( not ( = ?AUTO_5688 ?AUTO_5690 ) ) ( not ( = ?AUTO_5693 ?AUTO_5689 ) ) ( not ( = ?AUTO_5693 ?AUTO_5690 ) ) ( not ( = ?AUTO_5695 ?AUTO_5689 ) ) ( not ( = ?AUTO_5695 ?AUTO_5690 ) ) ( not ( = ?AUTO_5692 ?AUTO_5689 ) ) ( not ( = ?AUTO_5692 ?AUTO_5690 ) ) ( not ( = ?AUTO_5691 ?AUTO_5689 ) ) ( not ( = ?AUTO_5691 ?AUTO_5690 ) ) ( not ( = ?AUTO_5689 ?AUTO_5690 ) ) ( ON ?AUTO_5689 ?AUTO_5688 ) ( not ( = ?AUTO_5687 ?AUTO_5694 ) ) ( not ( = ?AUTO_5688 ?AUTO_5694 ) ) ( not ( = ?AUTO_5693 ?AUTO_5694 ) ) ( not ( = ?AUTO_5695 ?AUTO_5694 ) ) ( not ( = ?AUTO_5692 ?AUTO_5694 ) ) ( not ( = ?AUTO_5691 ?AUTO_5694 ) ) ( not ( = ?AUTO_5690 ?AUTO_5694 ) ) ( not ( = ?AUTO_5689 ?AUTO_5694 ) ) ( ON ?AUTO_5694 ?AUTO_5689 ) ( ON ?AUTO_5691 ?AUTO_5694 ) ( ON ?AUTO_5695 ?AUTO_5691 ) ( CLEAR ?AUTO_5695 ) ( ON-TABLE ?AUTO_5692 ) ( CLEAR ?AUTO_5687 ) ( ON ?AUTO_5693 ?AUTO_5692 ) ( CLEAR ?AUTO_5693 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5693 ?AUTO_5692 )
      ( MAKE-ON ?AUTO_5687 ?AUTO_5688 )
      ( MAKE-ON-VERIFY ?AUTO_5687 ?AUTO_5688 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5702 - BLOCK
      ?AUTO_5703 - BLOCK
    )
    :vars
    (
      ?AUTO_5708 - BLOCK
      ?AUTO_5710 - BLOCK
      ?AUTO_5705 - BLOCK
      ?AUTO_5704 - BLOCK
      ?AUTO_5706 - BLOCK
      ?AUTO_5707 - BLOCK
      ?AUTO_5709 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_5702 ?AUTO_5703 ) ) ( ON-TABLE ?AUTO_5702 ) ( not ( = ?AUTO_5702 ?AUTO_5708 ) ) ( not ( = ?AUTO_5703 ?AUTO_5708 ) ) ( not ( = ?AUTO_5702 ?AUTO_5710 ) ) ( not ( = ?AUTO_5702 ?AUTO_5705 ) ) ( not ( = ?AUTO_5703 ?AUTO_5710 ) ) ( not ( = ?AUTO_5703 ?AUTO_5705 ) ) ( not ( = ?AUTO_5708 ?AUTO_5710 ) ) ( not ( = ?AUTO_5708 ?AUTO_5705 ) ) ( not ( = ?AUTO_5710 ?AUTO_5705 ) ) ( not ( = ?AUTO_5702 ?AUTO_5704 ) ) ( not ( = ?AUTO_5703 ?AUTO_5704 ) ) ( not ( = ?AUTO_5708 ?AUTO_5704 ) ) ( not ( = ?AUTO_5710 ?AUTO_5704 ) ) ( not ( = ?AUTO_5705 ?AUTO_5704 ) ) ( not ( = ?AUTO_5702 ?AUTO_5706 ) ) ( not ( = ?AUTO_5702 ?AUTO_5707 ) ) ( not ( = ?AUTO_5703 ?AUTO_5706 ) ) ( not ( = ?AUTO_5703 ?AUTO_5707 ) ) ( not ( = ?AUTO_5708 ?AUTO_5706 ) ) ( not ( = ?AUTO_5708 ?AUTO_5707 ) ) ( not ( = ?AUTO_5710 ?AUTO_5706 ) ) ( not ( = ?AUTO_5710 ?AUTO_5707 ) ) ( not ( = ?AUTO_5705 ?AUTO_5706 ) ) ( not ( = ?AUTO_5705 ?AUTO_5707 ) ) ( not ( = ?AUTO_5704 ?AUTO_5706 ) ) ( not ( = ?AUTO_5704 ?AUTO_5707 ) ) ( not ( = ?AUTO_5706 ?AUTO_5707 ) ) ( ON ?AUTO_5706 ?AUTO_5703 ) ( not ( = ?AUTO_5702 ?AUTO_5709 ) ) ( not ( = ?AUTO_5703 ?AUTO_5709 ) ) ( not ( = ?AUTO_5708 ?AUTO_5709 ) ) ( not ( = ?AUTO_5710 ?AUTO_5709 ) ) ( not ( = ?AUTO_5705 ?AUTO_5709 ) ) ( not ( = ?AUTO_5704 ?AUTO_5709 ) ) ( not ( = ?AUTO_5707 ?AUTO_5709 ) ) ( not ( = ?AUTO_5706 ?AUTO_5709 ) ) ( ON ?AUTO_5709 ?AUTO_5706 ) ( ON ?AUTO_5704 ?AUTO_5709 ) ( ON ?AUTO_5710 ?AUTO_5704 ) ( CLEAR ?AUTO_5710 ) ( ON-TABLE ?AUTO_5705 ) ( CLEAR ?AUTO_5705 ) ( CLEAR ?AUTO_5702 ) ( ON ?AUTO_5708 ?AUTO_5707 ) ( CLEAR ?AUTO_5708 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5708 ?AUTO_5707 )
      ( MAKE-ON ?AUTO_5702 ?AUTO_5703 )
      ( MAKE-ON-VERIFY ?AUTO_5702 ?AUTO_5703 ) )
  )

)

