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

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_11 - BLOCK
    )
    :vars
    (
      ?AUTO_12 - BLOCK
      ?AUTO_13 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_11 ?AUTO_12 ) ( not ( = ?AUTO_11 ?AUTO_12 ) ) ( not ( = ?AUTO_11 ?AUTO_13 ) ) ( not ( = ?AUTO_12 ?AUTO_13 ) ) ( ON ?AUTO_13 ?AUTO_11 ) ( CLEAR ?AUTO_13 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_13 ?AUTO_11 )
      ( MAKE-ON-TABLE ?AUTO_11 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_11 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_16 - BLOCK
      ?AUTO_17 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_16 ) ( CLEAR ?AUTO_17 ) ( not ( = ?AUTO_16 ?AUTO_17 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_16 ?AUTO_17 )
      ( MAKE-ON-VERIFY ?AUTO_16 ?AUTO_17 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_18 - BLOCK
      ?AUTO_19 - BLOCK
    )
    :vars
    (
      ?AUTO_20 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_19 ) ( not ( = ?AUTO_18 ?AUTO_19 ) ) ( ON ?AUTO_18 ?AUTO_20 ) ( CLEAR ?AUTO_18 ) ( HAND-EMPTY ) ( not ( = ?AUTO_18 ?AUTO_20 ) ) ( not ( = ?AUTO_19 ?AUTO_20 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_18 ?AUTO_20 )
      ( MAKE-ON ?AUTO_18 ?AUTO_19 )
      ( MAKE-ON-VERIFY ?AUTO_18 ?AUTO_19 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_21 - BLOCK
      ?AUTO_22 - BLOCK
    )
    :vars
    (
      ?AUTO_23 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_21 ?AUTO_22 ) ) ( ON ?AUTO_21 ?AUTO_23 ) ( CLEAR ?AUTO_21 ) ( not ( = ?AUTO_21 ?AUTO_23 ) ) ( not ( = ?AUTO_22 ?AUTO_23 ) ) ( HOLDING ?AUTO_22 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_22 )
      ( MAKE-ON ?AUTO_21 ?AUTO_22 )
      ( MAKE-ON-VERIFY ?AUTO_21 ?AUTO_22 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_24 - BLOCK
      ?AUTO_25 - BLOCK
    )
    :vars
    (
      ?AUTO_26 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_24 ?AUTO_25 ) ) ( ON ?AUTO_24 ?AUTO_26 ) ( not ( = ?AUTO_24 ?AUTO_26 ) ) ( not ( = ?AUTO_25 ?AUTO_26 ) ) ( ON ?AUTO_25 ?AUTO_24 ) ( CLEAR ?AUTO_25 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_25 ?AUTO_24 )
      ( MAKE-ON ?AUTO_24 ?AUTO_25 )
      ( MAKE-ON-VERIFY ?AUTO_24 ?AUTO_25 ) )
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
    ( and ( not ( = ?AUTO_27 ?AUTO_28 ) ) ( ON ?AUTO_27 ?AUTO_29 ) ( not ( = ?AUTO_27 ?AUTO_29 ) ) ( not ( = ?AUTO_28 ?AUTO_29 ) ) ( ON ?AUTO_28 ?AUTO_27 ) ( CLEAR ?AUTO_28 ) ( HOLDING ?AUTO_30 ) ( not ( = ?AUTO_27 ?AUTO_30 ) ) ( not ( = ?AUTO_28 ?AUTO_30 ) ) ( not ( = ?AUTO_29 ?AUTO_30 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_30 )
      ( MAKE-ON ?AUTO_27 ?AUTO_28 )
      ( MAKE-ON-VERIFY ?AUTO_27 ?AUTO_28 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_31 - BLOCK
      ?AUTO_32 - BLOCK
    )
    :vars
    (
      ?AUTO_33 - BLOCK
      ?AUTO_34 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_31 ?AUTO_32 ) ) ( ON ?AUTO_31 ?AUTO_33 ) ( not ( = ?AUTO_31 ?AUTO_33 ) ) ( not ( = ?AUTO_32 ?AUTO_33 ) ) ( ON ?AUTO_32 ?AUTO_31 ) ( not ( = ?AUTO_31 ?AUTO_34 ) ) ( not ( = ?AUTO_32 ?AUTO_34 ) ) ( not ( = ?AUTO_33 ?AUTO_34 ) ) ( ON ?AUTO_34 ?AUTO_32 ) ( CLEAR ?AUTO_34 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_34 ?AUTO_32 )
      ( MAKE-ON ?AUTO_31 ?AUTO_32 )
      ( MAKE-ON-VERIFY ?AUTO_31 ?AUTO_32 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_42 - BLOCK
      ?AUTO_43 - BLOCK
    )
    :vars
    (
      ?AUTO_44 - BLOCK
      ?AUTO_45 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_42 ?AUTO_43 ) ) ( ON ?AUTO_42 ?AUTO_44 ) ( CLEAR ?AUTO_42 ) ( not ( = ?AUTO_42 ?AUTO_44 ) ) ( not ( = ?AUTO_43 ?AUTO_44 ) ) ( HOLDING ?AUTO_43 ) ( CLEAR ?AUTO_45 ) ( not ( = ?AUTO_42 ?AUTO_45 ) ) ( not ( = ?AUTO_43 ?AUTO_45 ) ) ( not ( = ?AUTO_44 ?AUTO_45 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_43 ?AUTO_45 )
      ( MAKE-ON ?AUTO_42 ?AUTO_43 )
      ( MAKE-ON-VERIFY ?AUTO_42 ?AUTO_43 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_48 - BLOCK
      ?AUTO_49 - BLOCK
    )
    :vars
    (
      ?AUTO_50 - BLOCK
      ?AUTO_51 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_49 ) ( not ( = ?AUTO_48 ?AUTO_49 ) ) ( ON ?AUTO_48 ?AUTO_50 ) ( CLEAR ?AUTO_48 ) ( not ( = ?AUTO_48 ?AUTO_50 ) ) ( not ( = ?AUTO_49 ?AUTO_50 ) ) ( HOLDING ?AUTO_51 ) ( not ( = ?AUTO_48 ?AUTO_51 ) ) ( not ( = ?AUTO_49 ?AUTO_51 ) ) ( not ( = ?AUTO_50 ?AUTO_51 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_51 )
      ( MAKE-ON ?AUTO_48 ?AUTO_49 )
      ( MAKE-ON-VERIFY ?AUTO_48 ?AUTO_49 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_52 - BLOCK
      ?AUTO_53 - BLOCK
    )
    :vars
    (
      ?AUTO_54 - BLOCK
      ?AUTO_55 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_52 ?AUTO_53 ) ) ( ON ?AUTO_52 ?AUTO_54 ) ( CLEAR ?AUTO_52 ) ( not ( = ?AUTO_52 ?AUTO_54 ) ) ( not ( = ?AUTO_53 ?AUTO_54 ) ) ( not ( = ?AUTO_52 ?AUTO_55 ) ) ( not ( = ?AUTO_53 ?AUTO_55 ) ) ( not ( = ?AUTO_54 ?AUTO_55 ) ) ( ON ?AUTO_55 ?AUTO_53 ) ( CLEAR ?AUTO_55 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_55 ?AUTO_53 )
      ( MAKE-ON ?AUTO_52 ?AUTO_53 )
      ( MAKE-ON-VERIFY ?AUTO_52 ?AUTO_53 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_56 - BLOCK
      ?AUTO_57 - BLOCK
    )
    :vars
    (
      ?AUTO_58 - BLOCK
      ?AUTO_59 - BLOCK
      ?AUTO_60 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_56 ?AUTO_57 ) ) ( ON ?AUTO_56 ?AUTO_58 ) ( CLEAR ?AUTO_56 ) ( not ( = ?AUTO_56 ?AUTO_58 ) ) ( not ( = ?AUTO_57 ?AUTO_58 ) ) ( not ( = ?AUTO_56 ?AUTO_59 ) ) ( not ( = ?AUTO_57 ?AUTO_59 ) ) ( not ( = ?AUTO_58 ?AUTO_59 ) ) ( ON ?AUTO_59 ?AUTO_57 ) ( CLEAR ?AUTO_59 ) ( HOLDING ?AUTO_60 ) ( not ( = ?AUTO_56 ?AUTO_60 ) ) ( not ( = ?AUTO_57 ?AUTO_60 ) ) ( not ( = ?AUTO_58 ?AUTO_60 ) ) ( not ( = ?AUTO_59 ?AUTO_60 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_60 )
      ( MAKE-ON ?AUTO_56 ?AUTO_57 )
      ( MAKE-ON-VERIFY ?AUTO_56 ?AUTO_57 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_61 - BLOCK
      ?AUTO_62 - BLOCK
    )
    :vars
    (
      ?AUTO_63 - BLOCK
      ?AUTO_64 - BLOCK
      ?AUTO_65 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_61 ?AUTO_62 ) ) ( ON ?AUTO_61 ?AUTO_63 ) ( CLEAR ?AUTO_61 ) ( not ( = ?AUTO_61 ?AUTO_63 ) ) ( not ( = ?AUTO_62 ?AUTO_63 ) ) ( not ( = ?AUTO_61 ?AUTO_64 ) ) ( not ( = ?AUTO_62 ?AUTO_64 ) ) ( not ( = ?AUTO_63 ?AUTO_64 ) ) ( ON ?AUTO_64 ?AUTO_62 ) ( not ( = ?AUTO_61 ?AUTO_65 ) ) ( not ( = ?AUTO_62 ?AUTO_65 ) ) ( not ( = ?AUTO_63 ?AUTO_65 ) ) ( not ( = ?AUTO_64 ?AUTO_65 ) ) ( ON ?AUTO_65 ?AUTO_64 ) ( CLEAR ?AUTO_65 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_65 ?AUTO_64 )
      ( MAKE-ON ?AUTO_61 ?AUTO_62 )
      ( MAKE-ON-VERIFY ?AUTO_61 ?AUTO_62 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_81 - BLOCK
      ?AUTO_82 - BLOCK
    )
    :vars
    (
      ?AUTO_83 - BLOCK
      ?AUTO_84 - BLOCK
      ?AUTO_85 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_81 ?AUTO_82 ) ) ( ON ?AUTO_81 ?AUTO_83 ) ( not ( = ?AUTO_81 ?AUTO_83 ) ) ( not ( = ?AUTO_82 ?AUTO_83 ) ) ( not ( = ?AUTO_81 ?AUTO_84 ) ) ( not ( = ?AUTO_82 ?AUTO_84 ) ) ( not ( = ?AUTO_83 ?AUTO_84 ) ) ( ON ?AUTO_82 ?AUTO_81 ) ( CLEAR ?AUTO_82 ) ( HOLDING ?AUTO_84 ) ( CLEAR ?AUTO_85 ) ( not ( = ?AUTO_81 ?AUTO_85 ) ) ( not ( = ?AUTO_82 ?AUTO_85 ) ) ( not ( = ?AUTO_83 ?AUTO_85 ) ) ( not ( = ?AUTO_84 ?AUTO_85 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_84 ?AUTO_85 )
      ( MAKE-ON ?AUTO_81 ?AUTO_82 )
      ( MAKE-ON-VERIFY ?AUTO_81 ?AUTO_82 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_100 - BLOCK
    )
    :vars
    (
      ?AUTO_101 - BLOCK
      ?AUTO_102 - BLOCK
      ?AUTO_103 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_100 ?AUTO_101 ) ( CLEAR ?AUTO_100 ) ( not ( = ?AUTO_100 ?AUTO_101 ) ) ( HOLDING ?AUTO_102 ) ( CLEAR ?AUTO_103 ) ( not ( = ?AUTO_100 ?AUTO_102 ) ) ( not ( = ?AUTO_100 ?AUTO_103 ) ) ( not ( = ?AUTO_101 ?AUTO_102 ) ) ( not ( = ?AUTO_101 ?AUTO_103 ) ) ( not ( = ?AUTO_102 ?AUTO_103 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_102 ?AUTO_103 )
      ( MAKE-ON-TABLE ?AUTO_100 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_100 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_108 - BLOCK
    )
    :vars
    (
      ?AUTO_109 - BLOCK
      ?AUTO_111 - BLOCK
      ?AUTO_110 - BLOCK
      ?AUTO_112 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_108 ?AUTO_109 ) ( not ( = ?AUTO_108 ?AUTO_109 ) ) ( not ( = ?AUTO_108 ?AUTO_111 ) ) ( not ( = ?AUTO_108 ?AUTO_110 ) ) ( not ( = ?AUTO_109 ?AUTO_111 ) ) ( not ( = ?AUTO_109 ?AUTO_110 ) ) ( not ( = ?AUTO_111 ?AUTO_110 ) ) ( ON ?AUTO_111 ?AUTO_108 ) ( CLEAR ?AUTO_111 ) ( HOLDING ?AUTO_110 ) ( CLEAR ?AUTO_112 ) ( not ( = ?AUTO_108 ?AUTO_112 ) ) ( not ( = ?AUTO_109 ?AUTO_112 ) ) ( not ( = ?AUTO_111 ?AUTO_112 ) ) ( not ( = ?AUTO_110 ?AUTO_112 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_110 ?AUTO_112 )
      ( MAKE-ON-TABLE ?AUTO_108 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_108 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1480 - BLOCK
    )
    :vars
    (
      ?AUTO_1482 - BLOCK
      ?AUTO_1483 - BLOCK
      ?AUTO_1481 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1480 ?AUTO_1482 ) ( not ( = ?AUTO_1480 ?AUTO_1482 ) ) ( not ( = ?AUTO_1480 ?AUTO_1483 ) ) ( not ( = ?AUTO_1482 ?AUTO_1483 ) ) ( ON ?AUTO_1483 ?AUTO_1480 ) ( not ( = ?AUTO_1480 ?AUTO_1481 ) ) ( not ( = ?AUTO_1482 ?AUTO_1481 ) ) ( not ( = ?AUTO_1483 ?AUTO_1481 ) ) ( ON ?AUTO_1481 ?AUTO_1483 ) ( CLEAR ?AUTO_1481 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1481 ?AUTO_1483 )
      ( MAKE-ON-TABLE ?AUTO_1480 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1480 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_118 - BLOCK
    )
    :vars
    (
      ?AUTO_121 - BLOCK
      ?AUTO_119 - BLOCK
      ?AUTO_122 - BLOCK
      ?AUTO_120 - BLOCK
      ?AUTO_123 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_118 ?AUTO_121 ) ( not ( = ?AUTO_118 ?AUTO_121 ) ) ( not ( = ?AUTO_118 ?AUTO_119 ) ) ( not ( = ?AUTO_118 ?AUTO_122 ) ) ( not ( = ?AUTO_121 ?AUTO_119 ) ) ( not ( = ?AUTO_121 ?AUTO_122 ) ) ( not ( = ?AUTO_119 ?AUTO_122 ) ) ( ON ?AUTO_119 ?AUTO_118 ) ( not ( = ?AUTO_118 ?AUTO_120 ) ) ( not ( = ?AUTO_121 ?AUTO_120 ) ) ( not ( = ?AUTO_119 ?AUTO_120 ) ) ( not ( = ?AUTO_122 ?AUTO_120 ) ) ( ON ?AUTO_122 ?AUTO_119 ) ( CLEAR ?AUTO_122 ) ( HOLDING ?AUTO_120 ) ( CLEAR ?AUTO_123 ) ( not ( = ?AUTO_118 ?AUTO_123 ) ) ( not ( = ?AUTO_121 ?AUTO_123 ) ) ( not ( = ?AUTO_119 ?AUTO_123 ) ) ( not ( = ?AUTO_122 ?AUTO_123 ) ) ( not ( = ?AUTO_120 ?AUTO_123 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_120 ?AUTO_123 )
      ( MAKE-ON-TABLE ?AUTO_118 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_118 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2017 - BLOCK
    )
    :vars
    (
      ?AUTO_2019 - BLOCK
      ?AUTO_2021 - BLOCK
      ?AUTO_2020 - BLOCK
      ?AUTO_2018 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2017 ?AUTO_2019 ) ( not ( = ?AUTO_2017 ?AUTO_2019 ) ) ( not ( = ?AUTO_2017 ?AUTO_2021 ) ) ( not ( = ?AUTO_2017 ?AUTO_2020 ) ) ( not ( = ?AUTO_2019 ?AUTO_2021 ) ) ( not ( = ?AUTO_2019 ?AUTO_2020 ) ) ( not ( = ?AUTO_2021 ?AUTO_2020 ) ) ( ON ?AUTO_2021 ?AUTO_2017 ) ( not ( = ?AUTO_2017 ?AUTO_2018 ) ) ( not ( = ?AUTO_2019 ?AUTO_2018 ) ) ( not ( = ?AUTO_2020 ?AUTO_2018 ) ) ( not ( = ?AUTO_2021 ?AUTO_2018 ) ) ( ON ?AUTO_2018 ?AUTO_2021 ) ( ON ?AUTO_2020 ?AUTO_2018 ) ( CLEAR ?AUTO_2020 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2020 ?AUTO_2018 )
      ( MAKE-ON-TABLE ?AUTO_2017 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2017 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_161 - BLOCK
    )
    :vars
    (
      ?AUTO_162 - BLOCK
      ?AUTO_165 - BLOCK
      ?AUTO_163 - BLOCK
      ?AUTO_164 - BLOCK
      ?AUTO_166 - BLOCK
      ?AUTO_167 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_161 ?AUTO_162 ) ( not ( = ?AUTO_161 ?AUTO_162 ) ) ( not ( = ?AUTO_161 ?AUTO_165 ) ) ( not ( = ?AUTO_162 ?AUTO_165 ) ) ( ON ?AUTO_165 ?AUTO_161 ) ( not ( = ?AUTO_161 ?AUTO_163 ) ) ( not ( = ?AUTO_161 ?AUTO_164 ) ) ( not ( = ?AUTO_162 ?AUTO_163 ) ) ( not ( = ?AUTO_162 ?AUTO_164 ) ) ( not ( = ?AUTO_165 ?AUTO_163 ) ) ( not ( = ?AUTO_165 ?AUTO_164 ) ) ( not ( = ?AUTO_163 ?AUTO_164 ) ) ( ON ?AUTO_163 ?AUTO_165 ) ( not ( = ?AUTO_161 ?AUTO_166 ) ) ( not ( = ?AUTO_162 ?AUTO_166 ) ) ( not ( = ?AUTO_165 ?AUTO_166 ) ) ( not ( = ?AUTO_163 ?AUTO_166 ) ) ( not ( = ?AUTO_164 ?AUTO_166 ) ) ( ON ?AUTO_164 ?AUTO_163 ) ( CLEAR ?AUTO_164 ) ( HOLDING ?AUTO_166 ) ( CLEAR ?AUTO_167 ) ( not ( = ?AUTO_161 ?AUTO_167 ) ) ( not ( = ?AUTO_162 ?AUTO_167 ) ) ( not ( = ?AUTO_165 ?AUTO_167 ) ) ( not ( = ?AUTO_163 ?AUTO_167 ) ) ( not ( = ?AUTO_164 ?AUTO_167 ) ) ( not ( = ?AUTO_166 ?AUTO_167 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_166 ?AUTO_167 )
      ( MAKE-ON-TABLE ?AUTO_161 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_161 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_177 - BLOCK
      ?AUTO_178 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_178 ) ( not ( = ?AUTO_177 ?AUTO_178 ) ) ( ON-TABLE ?AUTO_177 ) ( CLEAR ?AUTO_177 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_177 )
      ( MAKE-ON ?AUTO_177 ?AUTO_178 )
      ( MAKE-ON-VERIFY ?AUTO_177 ?AUTO_178 ) )
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
    )
    :precondition
    ( and ( CLEAR ?AUTO_180 ) ( not ( = ?AUTO_179 ?AUTO_180 ) ) ( ON-TABLE ?AUTO_179 ) ( CLEAR ?AUTO_179 ) ( HOLDING ?AUTO_181 ) ( not ( = ?AUTO_179 ?AUTO_181 ) ) ( not ( = ?AUTO_180 ?AUTO_181 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_181 )
      ( MAKE-ON ?AUTO_179 ?AUTO_180 )
      ( MAKE-ON-VERIFY ?AUTO_179 ?AUTO_180 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_182 - BLOCK
      ?AUTO_183 - BLOCK
    )
    :vars
    (
      ?AUTO_184 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_183 ) ( not ( = ?AUTO_182 ?AUTO_183 ) ) ( ON-TABLE ?AUTO_182 ) ( not ( = ?AUTO_182 ?AUTO_184 ) ) ( not ( = ?AUTO_183 ?AUTO_184 ) ) ( ON ?AUTO_184 ?AUTO_182 ) ( CLEAR ?AUTO_184 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_184 ?AUTO_182 )
      ( MAKE-ON ?AUTO_182 ?AUTO_183 )
      ( MAKE-ON-VERIFY ?AUTO_182 ?AUTO_183 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_185 - BLOCK
      ?AUTO_186 - BLOCK
    )
    :vars
    (
      ?AUTO_187 - BLOCK
      ?AUTO_188 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_186 ) ( not ( = ?AUTO_185 ?AUTO_186 ) ) ( ON-TABLE ?AUTO_185 ) ( not ( = ?AUTO_185 ?AUTO_187 ) ) ( not ( = ?AUTO_186 ?AUTO_187 ) ) ( ON ?AUTO_187 ?AUTO_185 ) ( CLEAR ?AUTO_187 ) ( HOLDING ?AUTO_188 ) ( not ( = ?AUTO_185 ?AUTO_188 ) ) ( not ( = ?AUTO_186 ?AUTO_188 ) ) ( not ( = ?AUTO_187 ?AUTO_188 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_188 )
      ( MAKE-ON ?AUTO_185 ?AUTO_186 )
      ( MAKE-ON-VERIFY ?AUTO_185 ?AUTO_186 ) )
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
    )
    :precondition
    ( and ( CLEAR ?AUTO_190 ) ( not ( = ?AUTO_189 ?AUTO_190 ) ) ( ON-TABLE ?AUTO_189 ) ( not ( = ?AUTO_189 ?AUTO_191 ) ) ( not ( = ?AUTO_190 ?AUTO_191 ) ) ( ON ?AUTO_191 ?AUTO_189 ) ( not ( = ?AUTO_189 ?AUTO_192 ) ) ( not ( = ?AUTO_190 ?AUTO_192 ) ) ( not ( = ?AUTO_191 ?AUTO_192 ) ) ( ON ?AUTO_192 ?AUTO_191 ) ( CLEAR ?AUTO_192 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_192 ?AUTO_191 )
      ( MAKE-ON ?AUTO_189 ?AUTO_190 )
      ( MAKE-ON-VERIFY ?AUTO_189 ?AUTO_190 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_193 - BLOCK
      ?AUTO_194 - BLOCK
    )
    :vars
    (
      ?AUTO_195 - BLOCK
      ?AUTO_196 - BLOCK
      ?AUTO_197 - BLOCK
      ?AUTO_198 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_194 ) ( not ( = ?AUTO_193 ?AUTO_194 ) ) ( ON-TABLE ?AUTO_193 ) ( not ( = ?AUTO_193 ?AUTO_195 ) ) ( not ( = ?AUTO_194 ?AUTO_195 ) ) ( ON ?AUTO_195 ?AUTO_193 ) ( not ( = ?AUTO_193 ?AUTO_196 ) ) ( not ( = ?AUTO_194 ?AUTO_196 ) ) ( not ( = ?AUTO_195 ?AUTO_196 ) ) ( ON ?AUTO_196 ?AUTO_195 ) ( CLEAR ?AUTO_196 ) ( HOLDING ?AUTO_197 ) ( CLEAR ?AUTO_198 ) ( not ( = ?AUTO_193 ?AUTO_197 ) ) ( not ( = ?AUTO_193 ?AUTO_198 ) ) ( not ( = ?AUTO_194 ?AUTO_197 ) ) ( not ( = ?AUTO_194 ?AUTO_198 ) ) ( not ( = ?AUTO_195 ?AUTO_197 ) ) ( not ( = ?AUTO_195 ?AUTO_198 ) ) ( not ( = ?AUTO_196 ?AUTO_197 ) ) ( not ( = ?AUTO_196 ?AUTO_198 ) ) ( not ( = ?AUTO_197 ?AUTO_198 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_197 ?AUTO_198 )
      ( MAKE-ON ?AUTO_193 ?AUTO_194 )
      ( MAKE-ON-VERIFY ?AUTO_193 ?AUTO_194 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_199 - BLOCK
      ?AUTO_200 - BLOCK
    )
    :vars
    (
      ?AUTO_201 - BLOCK
      ?AUTO_202 - BLOCK
      ?AUTO_203 - BLOCK
      ?AUTO_204 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_200 ) ( not ( = ?AUTO_199 ?AUTO_200 ) ) ( ON-TABLE ?AUTO_199 ) ( not ( = ?AUTO_199 ?AUTO_201 ) ) ( not ( = ?AUTO_200 ?AUTO_201 ) ) ( ON ?AUTO_201 ?AUTO_199 ) ( not ( = ?AUTO_199 ?AUTO_202 ) ) ( not ( = ?AUTO_200 ?AUTO_202 ) ) ( not ( = ?AUTO_201 ?AUTO_202 ) ) ( ON ?AUTO_202 ?AUTO_201 ) ( CLEAR ?AUTO_203 ) ( not ( = ?AUTO_199 ?AUTO_204 ) ) ( not ( = ?AUTO_199 ?AUTO_203 ) ) ( not ( = ?AUTO_200 ?AUTO_204 ) ) ( not ( = ?AUTO_200 ?AUTO_203 ) ) ( not ( = ?AUTO_201 ?AUTO_204 ) ) ( not ( = ?AUTO_201 ?AUTO_203 ) ) ( not ( = ?AUTO_202 ?AUTO_204 ) ) ( not ( = ?AUTO_202 ?AUTO_203 ) ) ( not ( = ?AUTO_204 ?AUTO_203 ) ) ( ON ?AUTO_204 ?AUTO_202 ) ( CLEAR ?AUTO_204 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_204 ?AUTO_202 )
      ( MAKE-ON ?AUTO_199 ?AUTO_200 )
      ( MAKE-ON-VERIFY ?AUTO_199 ?AUTO_200 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_205 - BLOCK
      ?AUTO_206 - BLOCK
    )
    :vars
    (
      ?AUTO_208 - BLOCK
      ?AUTO_207 - BLOCK
      ?AUTO_209 - BLOCK
      ?AUTO_210 - BLOCK
      ?AUTO_211 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_206 ) ( not ( = ?AUTO_205 ?AUTO_206 ) ) ( ON-TABLE ?AUTO_205 ) ( not ( = ?AUTO_205 ?AUTO_208 ) ) ( not ( = ?AUTO_206 ?AUTO_208 ) ) ( ON ?AUTO_208 ?AUTO_205 ) ( not ( = ?AUTO_205 ?AUTO_207 ) ) ( not ( = ?AUTO_206 ?AUTO_207 ) ) ( not ( = ?AUTO_208 ?AUTO_207 ) ) ( ON ?AUTO_207 ?AUTO_208 ) ( not ( = ?AUTO_205 ?AUTO_209 ) ) ( not ( = ?AUTO_205 ?AUTO_210 ) ) ( not ( = ?AUTO_206 ?AUTO_209 ) ) ( not ( = ?AUTO_206 ?AUTO_210 ) ) ( not ( = ?AUTO_208 ?AUTO_209 ) ) ( not ( = ?AUTO_208 ?AUTO_210 ) ) ( not ( = ?AUTO_207 ?AUTO_209 ) ) ( not ( = ?AUTO_207 ?AUTO_210 ) ) ( not ( = ?AUTO_209 ?AUTO_210 ) ) ( ON ?AUTO_209 ?AUTO_207 ) ( CLEAR ?AUTO_209 ) ( HOLDING ?AUTO_210 ) ( CLEAR ?AUTO_211 ) ( not ( = ?AUTO_205 ?AUTO_211 ) ) ( not ( = ?AUTO_206 ?AUTO_211 ) ) ( not ( = ?AUTO_208 ?AUTO_211 ) ) ( not ( = ?AUTO_207 ?AUTO_211 ) ) ( not ( = ?AUTO_209 ?AUTO_211 ) ) ( not ( = ?AUTO_210 ?AUTO_211 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_210 ?AUTO_211 )
      ( MAKE-ON ?AUTO_205 ?AUTO_206 )
      ( MAKE-ON-VERIFY ?AUTO_205 ?AUTO_206 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2062 - BLOCK
      ?AUTO_2063 - BLOCK
    )
    :vars
    (
      ?AUTO_2067 - BLOCK
      ?AUTO_2066 - BLOCK
      ?AUTO_2064 - BLOCK
      ?AUTO_2065 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2063 ) ( not ( = ?AUTO_2062 ?AUTO_2063 ) ) ( ON-TABLE ?AUTO_2062 ) ( not ( = ?AUTO_2062 ?AUTO_2067 ) ) ( not ( = ?AUTO_2063 ?AUTO_2067 ) ) ( ON ?AUTO_2067 ?AUTO_2062 ) ( not ( = ?AUTO_2062 ?AUTO_2066 ) ) ( not ( = ?AUTO_2062 ?AUTO_2064 ) ) ( not ( = ?AUTO_2063 ?AUTO_2066 ) ) ( not ( = ?AUTO_2063 ?AUTO_2064 ) ) ( not ( = ?AUTO_2067 ?AUTO_2066 ) ) ( not ( = ?AUTO_2067 ?AUTO_2064 ) ) ( not ( = ?AUTO_2066 ?AUTO_2064 ) ) ( ON ?AUTO_2066 ?AUTO_2067 ) ( not ( = ?AUTO_2062 ?AUTO_2065 ) ) ( not ( = ?AUTO_2063 ?AUTO_2065 ) ) ( not ( = ?AUTO_2067 ?AUTO_2065 ) ) ( not ( = ?AUTO_2064 ?AUTO_2065 ) ) ( not ( = ?AUTO_2066 ?AUTO_2065 ) ) ( ON ?AUTO_2065 ?AUTO_2066 ) ( ON ?AUTO_2064 ?AUTO_2065 ) ( CLEAR ?AUTO_2064 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2064 ?AUTO_2065 )
      ( MAKE-ON ?AUTO_2062 ?AUTO_2063 )
      ( MAKE-ON-VERIFY ?AUTO_2062 ?AUTO_2063 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_219 - BLOCK
      ?AUTO_220 - BLOCK
    )
    :vars
    (
      ?AUTO_225 - BLOCK
      ?AUTO_224 - BLOCK
      ?AUTO_222 - BLOCK
      ?AUTO_223 - BLOCK
      ?AUTO_221 - BLOCK
      ?AUTO_226 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_220 ) ( not ( = ?AUTO_219 ?AUTO_220 ) ) ( ON-TABLE ?AUTO_219 ) ( not ( = ?AUTO_219 ?AUTO_225 ) ) ( not ( = ?AUTO_220 ?AUTO_225 ) ) ( ON ?AUTO_225 ?AUTO_219 ) ( not ( = ?AUTO_219 ?AUTO_224 ) ) ( not ( = ?AUTO_220 ?AUTO_224 ) ) ( not ( = ?AUTO_225 ?AUTO_224 ) ) ( ON ?AUTO_224 ?AUTO_225 ) ( not ( = ?AUTO_219 ?AUTO_222 ) ) ( not ( = ?AUTO_219 ?AUTO_223 ) ) ( not ( = ?AUTO_220 ?AUTO_222 ) ) ( not ( = ?AUTO_220 ?AUTO_223 ) ) ( not ( = ?AUTO_225 ?AUTO_222 ) ) ( not ( = ?AUTO_225 ?AUTO_223 ) ) ( not ( = ?AUTO_224 ?AUTO_222 ) ) ( not ( = ?AUTO_224 ?AUTO_223 ) ) ( not ( = ?AUTO_222 ?AUTO_223 ) ) ( ON ?AUTO_222 ?AUTO_224 ) ( not ( = ?AUTO_219 ?AUTO_221 ) ) ( not ( = ?AUTO_220 ?AUTO_221 ) ) ( not ( = ?AUTO_225 ?AUTO_221 ) ) ( not ( = ?AUTO_224 ?AUTO_221 ) ) ( not ( = ?AUTO_222 ?AUTO_221 ) ) ( not ( = ?AUTO_223 ?AUTO_221 ) ) ( ON ?AUTO_223 ?AUTO_222 ) ( CLEAR ?AUTO_223 ) ( HOLDING ?AUTO_221 ) ( CLEAR ?AUTO_226 ) ( not ( = ?AUTO_219 ?AUTO_226 ) ) ( not ( = ?AUTO_220 ?AUTO_226 ) ) ( not ( = ?AUTO_225 ?AUTO_226 ) ) ( not ( = ?AUTO_224 ?AUTO_226 ) ) ( not ( = ?AUTO_222 ?AUTO_226 ) ) ( not ( = ?AUTO_223 ?AUTO_226 ) ) ( not ( = ?AUTO_221 ?AUTO_226 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_221 ?AUTO_226 )
      ( MAKE-ON ?AUTO_219 ?AUTO_220 )
      ( MAKE-ON-VERIFY ?AUTO_219 ?AUTO_220 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_233 - BLOCK
      ?AUTO_234 - BLOCK
    )
    :vars
    (
      ?AUTO_238 - BLOCK
      ?AUTO_235 - BLOCK
      ?AUTO_236 - BLOCK
      ?AUTO_237 - BLOCK
      ?AUTO_239 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_233 ?AUTO_234 ) ) ( ON-TABLE ?AUTO_233 ) ( not ( = ?AUTO_233 ?AUTO_238 ) ) ( not ( = ?AUTO_234 ?AUTO_238 ) ) ( ON ?AUTO_238 ?AUTO_233 ) ( not ( = ?AUTO_233 ?AUTO_235 ) ) ( not ( = ?AUTO_234 ?AUTO_235 ) ) ( not ( = ?AUTO_238 ?AUTO_235 ) ) ( ON ?AUTO_235 ?AUTO_238 ) ( not ( = ?AUTO_233 ?AUTO_236 ) ) ( not ( = ?AUTO_233 ?AUTO_237 ) ) ( not ( = ?AUTO_234 ?AUTO_236 ) ) ( not ( = ?AUTO_234 ?AUTO_237 ) ) ( not ( = ?AUTO_238 ?AUTO_236 ) ) ( not ( = ?AUTO_238 ?AUTO_237 ) ) ( not ( = ?AUTO_235 ?AUTO_236 ) ) ( not ( = ?AUTO_235 ?AUTO_237 ) ) ( not ( = ?AUTO_236 ?AUTO_237 ) ) ( ON ?AUTO_236 ?AUTO_235 ) ( CLEAR ?AUTO_239 ) ( not ( = ?AUTO_233 ?AUTO_239 ) ) ( not ( = ?AUTO_234 ?AUTO_239 ) ) ( not ( = ?AUTO_238 ?AUTO_239 ) ) ( not ( = ?AUTO_235 ?AUTO_239 ) ) ( not ( = ?AUTO_236 ?AUTO_239 ) ) ( not ( = ?AUTO_237 ?AUTO_239 ) ) ( ON ?AUTO_237 ?AUTO_236 ) ( CLEAR ?AUTO_237 ) ( HOLDING ?AUTO_234 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_234 )
      ( MAKE-ON ?AUTO_233 ?AUTO_234 )
      ( MAKE-ON-VERIFY ?AUTO_233 ?AUTO_234 ) )
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
    ( and ( not ( = ?AUTO_248 ?AUTO_249 ) ) ( ON-TABLE ?AUTO_248 ) ( CLEAR ?AUTO_248 ) ( HOLDING ?AUTO_249 ) ( CLEAR ?AUTO_250 ) ( not ( = ?AUTO_248 ?AUTO_250 ) ) ( not ( = ?AUTO_249 ?AUTO_250 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_249 ?AUTO_250 )
      ( MAKE-ON ?AUTO_248 ?AUTO_249 )
      ( MAKE-ON-VERIFY ?AUTO_248 ?AUTO_249 ) )
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
    )
    :precondition
    ( and ( not ( = ?AUTO_255 ?AUTO_256 ) ) ( ON-TABLE ?AUTO_255 ) ( CLEAR ?AUTO_255 ) ( not ( = ?AUTO_255 ?AUTO_257 ) ) ( not ( = ?AUTO_256 ?AUTO_257 ) ) ( ON ?AUTO_257 ?AUTO_256 ) ( CLEAR ?AUTO_257 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_257 ?AUTO_256 )
      ( MAKE-ON ?AUTO_255 ?AUTO_256 )
      ( MAKE-ON-VERIFY ?AUTO_255 ?AUTO_256 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_258 - BLOCK
      ?AUTO_259 - BLOCK
    )
    :vars
    (
      ?AUTO_260 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_258 ?AUTO_259 ) ) ( not ( = ?AUTO_258 ?AUTO_260 ) ) ( not ( = ?AUTO_259 ?AUTO_260 ) ) ( ON ?AUTO_260 ?AUTO_259 ) ( CLEAR ?AUTO_260 ) ( HOLDING ?AUTO_258 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_258 )
      ( MAKE-ON ?AUTO_258 ?AUTO_259 )
      ( MAKE-ON-VERIFY ?AUTO_258 ?AUTO_259 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_261 - BLOCK
      ?AUTO_262 - BLOCK
    )
    :vars
    (
      ?AUTO_263 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_261 ?AUTO_262 ) ) ( not ( = ?AUTO_261 ?AUTO_263 ) ) ( not ( = ?AUTO_262 ?AUTO_263 ) ) ( ON ?AUTO_263 ?AUTO_262 ) ( ON ?AUTO_261 ?AUTO_263 ) ( CLEAR ?AUTO_261 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_261 ?AUTO_263 )
      ( MAKE-ON ?AUTO_261 ?AUTO_262 )
      ( MAKE-ON-VERIFY ?AUTO_261 ?AUTO_262 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_264 - BLOCK
      ?AUTO_265 - BLOCK
    )
    :vars
    (
      ?AUTO_266 - BLOCK
      ?AUTO_267 - BLOCK
      ?AUTO_268 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_264 ?AUTO_265 ) ) ( not ( = ?AUTO_264 ?AUTO_266 ) ) ( not ( = ?AUTO_265 ?AUTO_266 ) ) ( ON ?AUTO_266 ?AUTO_265 ) ( ON ?AUTO_264 ?AUTO_266 ) ( CLEAR ?AUTO_264 ) ( HOLDING ?AUTO_267 ) ( CLEAR ?AUTO_268 ) ( not ( = ?AUTO_264 ?AUTO_267 ) ) ( not ( = ?AUTO_264 ?AUTO_268 ) ) ( not ( = ?AUTO_265 ?AUTO_267 ) ) ( not ( = ?AUTO_265 ?AUTO_268 ) ) ( not ( = ?AUTO_266 ?AUTO_267 ) ) ( not ( = ?AUTO_266 ?AUTO_268 ) ) ( not ( = ?AUTO_267 ?AUTO_268 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_267 ?AUTO_268 )
      ( MAKE-ON ?AUTO_264 ?AUTO_265 )
      ( MAKE-ON-VERIFY ?AUTO_264 ?AUTO_265 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_269 - BLOCK
      ?AUTO_270 - BLOCK
    )
    :vars
    (
      ?AUTO_271 - BLOCK
      ?AUTO_273 - BLOCK
      ?AUTO_272 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_269 ?AUTO_270 ) ) ( not ( = ?AUTO_269 ?AUTO_271 ) ) ( not ( = ?AUTO_270 ?AUTO_271 ) ) ( ON ?AUTO_271 ?AUTO_270 ) ( ON ?AUTO_269 ?AUTO_271 ) ( CLEAR ?AUTO_273 ) ( not ( = ?AUTO_269 ?AUTO_272 ) ) ( not ( = ?AUTO_269 ?AUTO_273 ) ) ( not ( = ?AUTO_270 ?AUTO_272 ) ) ( not ( = ?AUTO_270 ?AUTO_273 ) ) ( not ( = ?AUTO_271 ?AUTO_272 ) ) ( not ( = ?AUTO_271 ?AUTO_273 ) ) ( not ( = ?AUTO_272 ?AUTO_273 ) ) ( ON ?AUTO_272 ?AUTO_269 ) ( CLEAR ?AUTO_272 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_272 ?AUTO_269 )
      ( MAKE-ON ?AUTO_269 ?AUTO_270 )
      ( MAKE-ON-VERIFY ?AUTO_269 ?AUTO_270 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_274 - BLOCK
      ?AUTO_275 - BLOCK
    )
    :vars
    (
      ?AUTO_276 - BLOCK
      ?AUTO_277 - BLOCK
      ?AUTO_278 - BLOCK
      ?AUTO_279 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_274 ?AUTO_275 ) ) ( not ( = ?AUTO_274 ?AUTO_276 ) ) ( not ( = ?AUTO_275 ?AUTO_276 ) ) ( ON ?AUTO_276 ?AUTO_275 ) ( ON ?AUTO_274 ?AUTO_276 ) ( not ( = ?AUTO_274 ?AUTO_277 ) ) ( not ( = ?AUTO_274 ?AUTO_278 ) ) ( not ( = ?AUTO_275 ?AUTO_277 ) ) ( not ( = ?AUTO_275 ?AUTO_278 ) ) ( not ( = ?AUTO_276 ?AUTO_277 ) ) ( not ( = ?AUTO_276 ?AUTO_278 ) ) ( not ( = ?AUTO_277 ?AUTO_278 ) ) ( ON ?AUTO_277 ?AUTO_274 ) ( CLEAR ?AUTO_277 ) ( HOLDING ?AUTO_278 ) ( CLEAR ?AUTO_279 ) ( not ( = ?AUTO_274 ?AUTO_279 ) ) ( not ( = ?AUTO_275 ?AUTO_279 ) ) ( not ( = ?AUTO_276 ?AUTO_279 ) ) ( not ( = ?AUTO_277 ?AUTO_279 ) ) ( not ( = ?AUTO_278 ?AUTO_279 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_278 ?AUTO_279 )
      ( MAKE-ON ?AUTO_274 ?AUTO_275 )
      ( MAKE-ON-VERIFY ?AUTO_274 ?AUTO_275 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_280 - BLOCK
      ?AUTO_281 - BLOCK
    )
    :vars
    (
      ?AUTO_283 - BLOCK
      ?AUTO_282 - BLOCK
      ?AUTO_285 - BLOCK
      ?AUTO_284 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_280 ?AUTO_281 ) ) ( not ( = ?AUTO_280 ?AUTO_283 ) ) ( not ( = ?AUTO_281 ?AUTO_283 ) ) ( ON ?AUTO_283 ?AUTO_281 ) ( ON ?AUTO_280 ?AUTO_283 ) ( not ( = ?AUTO_280 ?AUTO_282 ) ) ( not ( = ?AUTO_280 ?AUTO_285 ) ) ( not ( = ?AUTO_281 ?AUTO_282 ) ) ( not ( = ?AUTO_281 ?AUTO_285 ) ) ( not ( = ?AUTO_283 ?AUTO_282 ) ) ( not ( = ?AUTO_283 ?AUTO_285 ) ) ( not ( = ?AUTO_282 ?AUTO_285 ) ) ( ON ?AUTO_282 ?AUTO_280 ) ( CLEAR ?AUTO_284 ) ( not ( = ?AUTO_280 ?AUTO_284 ) ) ( not ( = ?AUTO_281 ?AUTO_284 ) ) ( not ( = ?AUTO_283 ?AUTO_284 ) ) ( not ( = ?AUTO_282 ?AUTO_284 ) ) ( not ( = ?AUTO_285 ?AUTO_284 ) ) ( ON ?AUTO_285 ?AUTO_282 ) ( CLEAR ?AUTO_285 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_285 ?AUTO_282 )
      ( MAKE-ON ?AUTO_280 ?AUTO_281 )
      ( MAKE-ON-VERIFY ?AUTO_280 ?AUTO_281 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_286 - BLOCK
      ?AUTO_287 - BLOCK
    )
    :vars
    (
      ?AUTO_291 - BLOCK
      ?AUTO_290 - BLOCK
      ?AUTO_288 - BLOCK
      ?AUTO_289 - BLOCK
      ?AUTO_292 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_286 ?AUTO_287 ) ) ( not ( = ?AUTO_286 ?AUTO_291 ) ) ( not ( = ?AUTO_287 ?AUTO_291 ) ) ( ON ?AUTO_291 ?AUTO_287 ) ( ON ?AUTO_286 ?AUTO_291 ) ( not ( = ?AUTO_286 ?AUTO_290 ) ) ( not ( = ?AUTO_286 ?AUTO_288 ) ) ( not ( = ?AUTO_287 ?AUTO_290 ) ) ( not ( = ?AUTO_287 ?AUTO_288 ) ) ( not ( = ?AUTO_291 ?AUTO_290 ) ) ( not ( = ?AUTO_291 ?AUTO_288 ) ) ( not ( = ?AUTO_290 ?AUTO_288 ) ) ( ON ?AUTO_290 ?AUTO_286 ) ( not ( = ?AUTO_286 ?AUTO_289 ) ) ( not ( = ?AUTO_287 ?AUTO_289 ) ) ( not ( = ?AUTO_291 ?AUTO_289 ) ) ( not ( = ?AUTO_290 ?AUTO_289 ) ) ( not ( = ?AUTO_288 ?AUTO_289 ) ) ( ON ?AUTO_288 ?AUTO_290 ) ( CLEAR ?AUTO_288 ) ( HOLDING ?AUTO_289 ) ( CLEAR ?AUTO_292 ) ( not ( = ?AUTO_286 ?AUTO_292 ) ) ( not ( = ?AUTO_287 ?AUTO_292 ) ) ( not ( = ?AUTO_291 ?AUTO_292 ) ) ( not ( = ?AUTO_290 ?AUTO_292 ) ) ( not ( = ?AUTO_288 ?AUTO_292 ) ) ( not ( = ?AUTO_289 ?AUTO_292 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_289 ?AUTO_292 )
      ( MAKE-ON ?AUTO_286 ?AUTO_287 )
      ( MAKE-ON-VERIFY ?AUTO_286 ?AUTO_287 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_310 - BLOCK
      ?AUTO_311 - BLOCK
    )
    :vars
    (
      ?AUTO_312 - BLOCK
      ?AUTO_313 - BLOCK
      ?AUTO_314 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_311 ) ( not ( = ?AUTO_310 ?AUTO_311 ) ) ( ON ?AUTO_310 ?AUTO_312 ) ( CLEAR ?AUTO_310 ) ( not ( = ?AUTO_310 ?AUTO_312 ) ) ( not ( = ?AUTO_311 ?AUTO_312 ) ) ( HOLDING ?AUTO_313 ) ( CLEAR ?AUTO_314 ) ( not ( = ?AUTO_310 ?AUTO_313 ) ) ( not ( = ?AUTO_310 ?AUTO_314 ) ) ( not ( = ?AUTO_311 ?AUTO_313 ) ) ( not ( = ?AUTO_311 ?AUTO_314 ) ) ( not ( = ?AUTO_312 ?AUTO_313 ) ) ( not ( = ?AUTO_312 ?AUTO_314 ) ) ( not ( = ?AUTO_313 ?AUTO_314 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_313 ?AUTO_314 )
      ( MAKE-ON ?AUTO_310 ?AUTO_311 )
      ( MAKE-ON-VERIFY ?AUTO_310 ?AUTO_311 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_614 - BLOCK
      ?AUTO_615 - BLOCK
    )
    :vars
    (
      ?AUTO_616 - BLOCK
      ?AUTO_617 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_615 ) ( not ( = ?AUTO_614 ?AUTO_615 ) ) ( ON ?AUTO_614 ?AUTO_616 ) ( not ( = ?AUTO_614 ?AUTO_616 ) ) ( not ( = ?AUTO_615 ?AUTO_616 ) ) ( not ( = ?AUTO_614 ?AUTO_617 ) ) ( not ( = ?AUTO_615 ?AUTO_617 ) ) ( not ( = ?AUTO_616 ?AUTO_617 ) ) ( ON ?AUTO_617 ?AUTO_614 ) ( CLEAR ?AUTO_617 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_617 ?AUTO_614 )
      ( MAKE-ON ?AUTO_614 ?AUTO_615 )
      ( MAKE-ON-VERIFY ?AUTO_614 ?AUTO_615 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_618 - BLOCK
      ?AUTO_619 - BLOCK
    )
    :vars
    (
      ?AUTO_621 - BLOCK
      ?AUTO_620 - BLOCK
      ?AUTO_622 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_618 ?AUTO_619 ) ) ( ON ?AUTO_618 ?AUTO_621 ) ( not ( = ?AUTO_618 ?AUTO_621 ) ) ( not ( = ?AUTO_619 ?AUTO_621 ) ) ( not ( = ?AUTO_618 ?AUTO_620 ) ) ( not ( = ?AUTO_619 ?AUTO_620 ) ) ( not ( = ?AUTO_621 ?AUTO_620 ) ) ( ON ?AUTO_620 ?AUTO_618 ) ( CLEAR ?AUTO_620 ) ( HOLDING ?AUTO_619 ) ( CLEAR ?AUTO_622 ) ( not ( = ?AUTO_618 ?AUTO_622 ) ) ( not ( = ?AUTO_619 ?AUTO_622 ) ) ( not ( = ?AUTO_621 ?AUTO_622 ) ) ( not ( = ?AUTO_620 ?AUTO_622 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_619 ?AUTO_622 )
      ( MAKE-ON ?AUTO_618 ?AUTO_619 )
      ( MAKE-ON-VERIFY ?AUTO_618 ?AUTO_619 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_820 - BLOCK
      ?AUTO_821 - BLOCK
    )
    :vars
    (
      ?AUTO_823 - BLOCK
      ?AUTO_822 - BLOCK
      ?AUTO_824 - BLOCK
      ?AUTO_825 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_821 ) ( not ( = ?AUTO_820 ?AUTO_821 ) ) ( ON ?AUTO_820 ?AUTO_823 ) ( not ( = ?AUTO_820 ?AUTO_823 ) ) ( not ( = ?AUTO_821 ?AUTO_823 ) ) ( not ( = ?AUTO_820 ?AUTO_822 ) ) ( not ( = ?AUTO_821 ?AUTO_822 ) ) ( not ( = ?AUTO_823 ?AUTO_822 ) ) ( ON ?AUTO_822 ?AUTO_820 ) ( CLEAR ?AUTO_822 ) ( HOLDING ?AUTO_824 ) ( CLEAR ?AUTO_825 ) ( not ( = ?AUTO_820 ?AUTO_824 ) ) ( not ( = ?AUTO_820 ?AUTO_825 ) ) ( not ( = ?AUTO_821 ?AUTO_824 ) ) ( not ( = ?AUTO_821 ?AUTO_825 ) ) ( not ( = ?AUTO_823 ?AUTO_824 ) ) ( not ( = ?AUTO_823 ?AUTO_825 ) ) ( not ( = ?AUTO_822 ?AUTO_824 ) ) ( not ( = ?AUTO_822 ?AUTO_825 ) ) ( not ( = ?AUTO_824 ?AUTO_825 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_824 ?AUTO_825 )
      ( MAKE-ON ?AUTO_820 ?AUTO_821 )
      ( MAKE-ON-VERIFY ?AUTO_820 ?AUTO_821 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_557 - BLOCK
      ?AUTO_558 - BLOCK
    )
    :vars
    (
      ?AUTO_559 - BLOCK
      ?AUTO_560 - BLOCK
      ?AUTO_561 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_558 ) ( not ( = ?AUTO_557 ?AUTO_558 ) ) ( ON-TABLE ?AUTO_557 ) ( not ( = ?AUTO_557 ?AUTO_559 ) ) ( not ( = ?AUTO_558 ?AUTO_559 ) ) ( ON ?AUTO_559 ?AUTO_557 ) ( CLEAR ?AUTO_559 ) ( HOLDING ?AUTO_560 ) ( CLEAR ?AUTO_561 ) ( not ( = ?AUTO_557 ?AUTO_560 ) ) ( not ( = ?AUTO_557 ?AUTO_561 ) ) ( not ( = ?AUTO_558 ?AUTO_560 ) ) ( not ( = ?AUTO_558 ?AUTO_561 ) ) ( not ( = ?AUTO_559 ?AUTO_560 ) ) ( not ( = ?AUTO_559 ?AUTO_561 ) ) ( not ( = ?AUTO_560 ?AUTO_561 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_560 ?AUTO_561 )
      ( MAKE-ON ?AUTO_557 ?AUTO_558 )
      ( MAKE-ON-VERIFY ?AUTO_557 ?AUTO_558 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1986 - BLOCK
      ?AUTO_1987 - BLOCK
    )
    :vars
    (
      ?AUTO_1988 - BLOCK
      ?AUTO_1989 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1986 ?AUTO_1987 ) ) ( ON ?AUTO_1986 ?AUTO_1988 ) ( not ( = ?AUTO_1986 ?AUTO_1988 ) ) ( not ( = ?AUTO_1987 ?AUTO_1988 ) ) ( not ( = ?AUTO_1986 ?AUTO_1989 ) ) ( not ( = ?AUTO_1987 ?AUTO_1989 ) ) ( not ( = ?AUTO_1988 ?AUTO_1989 ) ) ( ON ?AUTO_1989 ?AUTO_1986 ) ( ON ?AUTO_1987 ?AUTO_1989 ) ( CLEAR ?AUTO_1987 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1987 ?AUTO_1989 )
      ( MAKE-ON ?AUTO_1986 ?AUTO_1987 )
      ( MAKE-ON-VERIFY ?AUTO_1986 ?AUTO_1987 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_645 - BLOCK
      ?AUTO_646 - BLOCK
    )
    :vars
    (
      ?AUTO_648 - BLOCK
      ?AUTO_647 - BLOCK
      ?AUTO_649 - BLOCK
      ?AUTO_650 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_645 ?AUTO_646 ) ) ( ON ?AUTO_645 ?AUTO_648 ) ( CLEAR ?AUTO_645 ) ( not ( = ?AUTO_645 ?AUTO_648 ) ) ( not ( = ?AUTO_646 ?AUTO_648 ) ) ( not ( = ?AUTO_645 ?AUTO_647 ) ) ( not ( = ?AUTO_645 ?AUTO_649 ) ) ( not ( = ?AUTO_646 ?AUTO_647 ) ) ( not ( = ?AUTO_646 ?AUTO_649 ) ) ( not ( = ?AUTO_648 ?AUTO_647 ) ) ( not ( = ?AUTO_648 ?AUTO_649 ) ) ( not ( = ?AUTO_647 ?AUTO_649 ) ) ( ON ?AUTO_647 ?AUTO_646 ) ( CLEAR ?AUTO_647 ) ( HOLDING ?AUTO_649 ) ( CLEAR ?AUTO_650 ) ( not ( = ?AUTO_645 ?AUTO_650 ) ) ( not ( = ?AUTO_646 ?AUTO_650 ) ) ( not ( = ?AUTO_648 ?AUTO_650 ) ) ( not ( = ?AUTO_647 ?AUTO_650 ) ) ( not ( = ?AUTO_649 ?AUTO_650 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_649 ?AUTO_650 )
      ( MAKE-ON ?AUTO_645 ?AUTO_646 )
      ( MAKE-ON-VERIFY ?AUTO_645 ?AUTO_646 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1880 - BLOCK
      ?AUTO_1881 - BLOCK
    )
    :vars
    (
      ?AUTO_1882 - BLOCK
      ?AUTO_1883 - BLOCK
      ?AUTO_1884 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1880 ?AUTO_1881 ) ) ( ON ?AUTO_1880 ?AUTO_1882 ) ( not ( = ?AUTO_1880 ?AUTO_1882 ) ) ( not ( = ?AUTO_1881 ?AUTO_1882 ) ) ( not ( = ?AUTO_1880 ?AUTO_1883 ) ) ( not ( = ?AUTO_1880 ?AUTO_1884 ) ) ( not ( = ?AUTO_1881 ?AUTO_1883 ) ) ( not ( = ?AUTO_1881 ?AUTO_1884 ) ) ( not ( = ?AUTO_1882 ?AUTO_1883 ) ) ( not ( = ?AUTO_1882 ?AUTO_1884 ) ) ( not ( = ?AUTO_1883 ?AUTO_1884 ) ) ( ON ?AUTO_1883 ?AUTO_1881 ) ( CLEAR ?AUTO_1883 ) ( ON ?AUTO_1884 ?AUTO_1880 ) ( CLEAR ?AUTO_1884 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1884 ?AUTO_1880 )
      ( MAKE-ON ?AUTO_1880 ?AUTO_1881 )
      ( MAKE-ON-VERIFY ?AUTO_1880 ?AUTO_1881 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_657 - BLOCK
      ?AUTO_658 - BLOCK
    )
    :vars
    (
      ?AUTO_660 - BLOCK
      ?AUTO_659 - BLOCK
      ?AUTO_662 - BLOCK
      ?AUTO_661 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_657 ?AUTO_658 ) ) ( ON ?AUTO_657 ?AUTO_660 ) ( not ( = ?AUTO_657 ?AUTO_660 ) ) ( not ( = ?AUTO_658 ?AUTO_660 ) ) ( not ( = ?AUTO_657 ?AUTO_659 ) ) ( not ( = ?AUTO_657 ?AUTO_662 ) ) ( not ( = ?AUTO_658 ?AUTO_659 ) ) ( not ( = ?AUTO_658 ?AUTO_662 ) ) ( not ( = ?AUTO_660 ?AUTO_659 ) ) ( not ( = ?AUTO_660 ?AUTO_662 ) ) ( not ( = ?AUTO_659 ?AUTO_662 ) ) ( ON ?AUTO_659 ?AUTO_658 ) ( CLEAR ?AUTO_659 ) ( not ( = ?AUTO_657 ?AUTO_661 ) ) ( not ( = ?AUTO_658 ?AUTO_661 ) ) ( not ( = ?AUTO_660 ?AUTO_661 ) ) ( not ( = ?AUTO_659 ?AUTO_661 ) ) ( not ( = ?AUTO_662 ?AUTO_661 ) ) ( ON ?AUTO_662 ?AUTO_657 ) ( CLEAR ?AUTO_662 ) ( HOLDING ?AUTO_661 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_661 )
      ( MAKE-ON ?AUTO_657 ?AUTO_658 )
      ( MAKE-ON-VERIFY ?AUTO_657 ?AUTO_658 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_663 - BLOCK
      ?AUTO_664 - BLOCK
    )
    :vars
    (
      ?AUTO_666 - BLOCK
      ?AUTO_667 - BLOCK
      ?AUTO_665 - BLOCK
      ?AUTO_668 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_663 ?AUTO_664 ) ) ( ON ?AUTO_663 ?AUTO_666 ) ( not ( = ?AUTO_663 ?AUTO_666 ) ) ( not ( = ?AUTO_664 ?AUTO_666 ) ) ( not ( = ?AUTO_663 ?AUTO_667 ) ) ( not ( = ?AUTO_663 ?AUTO_665 ) ) ( not ( = ?AUTO_664 ?AUTO_667 ) ) ( not ( = ?AUTO_664 ?AUTO_665 ) ) ( not ( = ?AUTO_666 ?AUTO_667 ) ) ( not ( = ?AUTO_666 ?AUTO_665 ) ) ( not ( = ?AUTO_667 ?AUTO_665 ) ) ( ON ?AUTO_667 ?AUTO_664 ) ( not ( = ?AUTO_663 ?AUTO_668 ) ) ( not ( = ?AUTO_664 ?AUTO_668 ) ) ( not ( = ?AUTO_666 ?AUTO_668 ) ) ( not ( = ?AUTO_667 ?AUTO_668 ) ) ( not ( = ?AUTO_665 ?AUTO_668 ) ) ( ON ?AUTO_665 ?AUTO_663 ) ( CLEAR ?AUTO_665 ) ( ON ?AUTO_668 ?AUTO_667 ) ( CLEAR ?AUTO_668 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_668 ?AUTO_667 )
      ( MAKE-ON ?AUTO_663 ?AUTO_664 )
      ( MAKE-ON-VERIFY ?AUTO_663 ?AUTO_664 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_669 - BLOCK
      ?AUTO_670 - BLOCK
    )
    :vars
    (
      ?AUTO_671 - BLOCK
      ?AUTO_674 - BLOCK
      ?AUTO_672 - BLOCK
      ?AUTO_673 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_669 ?AUTO_670 ) ) ( ON ?AUTO_669 ?AUTO_671 ) ( not ( = ?AUTO_669 ?AUTO_671 ) ) ( not ( = ?AUTO_670 ?AUTO_671 ) ) ( not ( = ?AUTO_669 ?AUTO_674 ) ) ( not ( = ?AUTO_669 ?AUTO_672 ) ) ( not ( = ?AUTO_670 ?AUTO_674 ) ) ( not ( = ?AUTO_670 ?AUTO_672 ) ) ( not ( = ?AUTO_671 ?AUTO_674 ) ) ( not ( = ?AUTO_671 ?AUTO_672 ) ) ( not ( = ?AUTO_674 ?AUTO_672 ) ) ( ON ?AUTO_674 ?AUTO_670 ) ( not ( = ?AUTO_669 ?AUTO_673 ) ) ( not ( = ?AUTO_670 ?AUTO_673 ) ) ( not ( = ?AUTO_671 ?AUTO_673 ) ) ( not ( = ?AUTO_674 ?AUTO_673 ) ) ( not ( = ?AUTO_672 ?AUTO_673 ) ) ( ON ?AUTO_673 ?AUTO_674 ) ( CLEAR ?AUTO_673 ) ( HOLDING ?AUTO_672 ) ( CLEAR ?AUTO_669 ) )
    :subtasks
    ( ( !STACK ?AUTO_672 ?AUTO_669 )
      ( MAKE-ON ?AUTO_669 ?AUTO_670 )
      ( MAKE-ON-VERIFY ?AUTO_669 ?AUTO_670 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_675 - BLOCK
      ?AUTO_676 - BLOCK
    )
    :vars
    (
      ?AUTO_677 - BLOCK
      ?AUTO_680 - BLOCK
      ?AUTO_678 - BLOCK
      ?AUTO_679 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_675 ?AUTO_676 ) ) ( ON ?AUTO_675 ?AUTO_677 ) ( not ( = ?AUTO_675 ?AUTO_677 ) ) ( not ( = ?AUTO_676 ?AUTO_677 ) ) ( not ( = ?AUTO_675 ?AUTO_680 ) ) ( not ( = ?AUTO_675 ?AUTO_678 ) ) ( not ( = ?AUTO_676 ?AUTO_680 ) ) ( not ( = ?AUTO_676 ?AUTO_678 ) ) ( not ( = ?AUTO_677 ?AUTO_680 ) ) ( not ( = ?AUTO_677 ?AUTO_678 ) ) ( not ( = ?AUTO_680 ?AUTO_678 ) ) ( ON ?AUTO_680 ?AUTO_676 ) ( not ( = ?AUTO_675 ?AUTO_679 ) ) ( not ( = ?AUTO_676 ?AUTO_679 ) ) ( not ( = ?AUTO_677 ?AUTO_679 ) ) ( not ( = ?AUTO_680 ?AUTO_679 ) ) ( not ( = ?AUTO_678 ?AUTO_679 ) ) ( ON ?AUTO_679 ?AUTO_680 ) ( CLEAR ?AUTO_675 ) ( ON ?AUTO_678 ?AUTO_679 ) ( CLEAR ?AUTO_678 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_678 ?AUTO_679 )
      ( MAKE-ON ?AUTO_675 ?AUTO_676 )
      ( MAKE-ON-VERIFY ?AUTO_675 ?AUTO_676 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_687 - BLOCK
      ?AUTO_688 - BLOCK
    )
    :vars
    (
      ?AUTO_689 - BLOCK
      ?AUTO_690 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_688 ) ( not ( = ?AUTO_687 ?AUTO_688 ) ) ( ON-TABLE ?AUTO_687 ) ( CLEAR ?AUTO_687 ) ( HOLDING ?AUTO_689 ) ( CLEAR ?AUTO_690 ) ( not ( = ?AUTO_687 ?AUTO_689 ) ) ( not ( = ?AUTO_687 ?AUTO_690 ) ) ( not ( = ?AUTO_688 ?AUTO_689 ) ) ( not ( = ?AUTO_688 ?AUTO_690 ) ) ( not ( = ?AUTO_689 ?AUTO_690 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_689 ?AUTO_690 )
      ( MAKE-ON ?AUTO_687 ?AUTO_688 )
      ( MAKE-ON-VERIFY ?AUTO_687 ?AUTO_688 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_708 - BLOCK
      ?AUTO_709 - BLOCK
    )
    :vars
    (
      ?AUTO_711 - BLOCK
      ?AUTO_710 - BLOCK
      ?AUTO_712 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_708 ?AUTO_709 ) ) ( ON-TABLE ?AUTO_708 ) ( CLEAR ?AUTO_708 ) ( not ( = ?AUTO_708 ?AUTO_711 ) ) ( not ( = ?AUTO_708 ?AUTO_710 ) ) ( not ( = ?AUTO_709 ?AUTO_711 ) ) ( not ( = ?AUTO_709 ?AUTO_710 ) ) ( not ( = ?AUTO_711 ?AUTO_710 ) ) ( ON ?AUTO_711 ?AUTO_709 ) ( CLEAR ?AUTO_711 ) ( HOLDING ?AUTO_710 ) ( CLEAR ?AUTO_712 ) ( not ( = ?AUTO_708 ?AUTO_712 ) ) ( not ( = ?AUTO_709 ?AUTO_712 ) ) ( not ( = ?AUTO_711 ?AUTO_712 ) ) ( not ( = ?AUTO_710 ?AUTO_712 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_710 ?AUTO_712 )
      ( MAKE-ON ?AUTO_708 ?AUTO_709 )
      ( MAKE-ON-VERIFY ?AUTO_708 ?AUTO_709 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3484 - BLOCK
      ?AUTO_3485 - BLOCK
    )
    :vars
    (
      ?AUTO_3486 - BLOCK
      ?AUTO_3487 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3484 ?AUTO_3485 ) ) ( ON-TABLE ?AUTO_3484 ) ( CLEAR ?AUTO_3484 ) ( not ( = ?AUTO_3484 ?AUTO_3486 ) ) ( not ( = ?AUTO_3485 ?AUTO_3486 ) ) ( ON ?AUTO_3486 ?AUTO_3485 ) ( not ( = ?AUTO_3484 ?AUTO_3487 ) ) ( not ( = ?AUTO_3485 ?AUTO_3487 ) ) ( not ( = ?AUTO_3486 ?AUTO_3487 ) ) ( ON ?AUTO_3487 ?AUTO_3486 ) ( CLEAR ?AUTO_3487 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3487 ?AUTO_3486 )
      ( MAKE-ON ?AUTO_3484 ?AUTO_3485 )
      ( MAKE-ON-VERIFY ?AUTO_3484 ?AUTO_3485 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1399 - BLOCK
      ?AUTO_1400 - BLOCK
    )
    :vars
    (
      ?AUTO_1401 - BLOCK
      ?AUTO_1402 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1399 ?AUTO_1400 ) ) ( ON-TABLE ?AUTO_1399 ) ( not ( = ?AUTO_1399 ?AUTO_1401 ) ) ( not ( = ?AUTO_1400 ?AUTO_1401 ) ) ( ON ?AUTO_1401 ?AUTO_1399 ) ( CLEAR ?AUTO_1401 ) ( HOLDING ?AUTO_1400 ) ( CLEAR ?AUTO_1402 ) ( not ( = ?AUTO_1399 ?AUTO_1402 ) ) ( not ( = ?AUTO_1400 ?AUTO_1402 ) ) ( not ( = ?AUTO_1401 ?AUTO_1402 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1400 ?AUTO_1402 )
      ( MAKE-ON ?AUTO_1399 ?AUTO_1400 )
      ( MAKE-ON-VERIFY ?AUTO_1399 ?AUTO_1400 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1147 - BLOCK
    )
    :vars
    (
      ?AUTO_1149 - BLOCK
      ?AUTO_1148 - BLOCK
      ?AUTO_1150 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1147 ?AUTO_1149 ) ( not ( = ?AUTO_1147 ?AUTO_1149 ) ) ( not ( = ?AUTO_1147 ?AUTO_1148 ) ) ( not ( = ?AUTO_1149 ?AUTO_1148 ) ) ( ON ?AUTO_1148 ?AUTO_1147 ) ( CLEAR ?AUTO_1148 ) ( HOLDING ?AUTO_1150 ) ( not ( = ?AUTO_1147 ?AUTO_1150 ) ) ( not ( = ?AUTO_1149 ?AUTO_1150 ) ) ( not ( = ?AUTO_1148 ?AUTO_1150 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1150 )
      ( MAKE-ON-TABLE ?AUTO_1147 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1147 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1001 - BLOCK
      ?AUTO_1002 - BLOCK
    )
    :vars
    (
      ?AUTO_1003 - BLOCK
      ?AUTO_1004 - BLOCK
      ?AUTO_1005 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1002 ) ( not ( = ?AUTO_1001 ?AUTO_1002 ) ) ( ON ?AUTO_1001 ?AUTO_1003 ) ( not ( = ?AUTO_1001 ?AUTO_1003 ) ) ( not ( = ?AUTO_1002 ?AUTO_1003 ) ) ( not ( = ?AUTO_1001 ?AUTO_1004 ) ) ( not ( = ?AUTO_1002 ?AUTO_1004 ) ) ( not ( = ?AUTO_1003 ?AUTO_1004 ) ) ( ON ?AUTO_1004 ?AUTO_1001 ) ( not ( = ?AUTO_1001 ?AUTO_1005 ) ) ( not ( = ?AUTO_1002 ?AUTO_1005 ) ) ( not ( = ?AUTO_1003 ?AUTO_1005 ) ) ( not ( = ?AUTO_1004 ?AUTO_1005 ) ) ( ON ?AUTO_1005 ?AUTO_1004 ) ( CLEAR ?AUTO_1005 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1005 ?AUTO_1004 )
      ( MAKE-ON ?AUTO_1001 ?AUTO_1002 )
      ( MAKE-ON-VERIFY ?AUTO_1001 ?AUTO_1002 ) )
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
      ?AUTO_844 - BLOCK
      ?AUTO_843 - BLOCK
      ?AUTO_845 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_840 ?AUTO_841 ) ) ( ON ?AUTO_840 ?AUTO_842 ) ( not ( = ?AUTO_840 ?AUTO_842 ) ) ( not ( = ?AUTO_841 ?AUTO_842 ) ) ( not ( = ?AUTO_840 ?AUTO_844 ) ) ( not ( = ?AUTO_841 ?AUTO_844 ) ) ( not ( = ?AUTO_842 ?AUTO_844 ) ) ( ON ?AUTO_844 ?AUTO_840 ) ( CLEAR ?AUTO_843 ) ( not ( = ?AUTO_840 ?AUTO_845 ) ) ( not ( = ?AUTO_840 ?AUTO_843 ) ) ( not ( = ?AUTO_841 ?AUTO_845 ) ) ( not ( = ?AUTO_841 ?AUTO_843 ) ) ( not ( = ?AUTO_842 ?AUTO_845 ) ) ( not ( = ?AUTO_842 ?AUTO_843 ) ) ( not ( = ?AUTO_844 ?AUTO_845 ) ) ( not ( = ?AUTO_844 ?AUTO_843 ) ) ( not ( = ?AUTO_845 ?AUTO_843 ) ) ( ON ?AUTO_845 ?AUTO_844 ) ( CLEAR ?AUTO_845 ) ( HOLDING ?AUTO_841 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_841 )
      ( MAKE-ON ?AUTO_840 ?AUTO_841 )
      ( MAKE-ON-VERIFY ?AUTO_840 ?AUTO_841 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_932 - BLOCK
      ?AUTO_933 - BLOCK
    )
    :vars
    (
      ?AUTO_934 - BLOCK
      ?AUTO_935 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_932 ?AUTO_933 ) ) ( ON-TABLE ?AUTO_932 ) ( CLEAR ?AUTO_934 ) ( not ( = ?AUTO_932 ?AUTO_935 ) ) ( not ( = ?AUTO_932 ?AUTO_934 ) ) ( not ( = ?AUTO_933 ?AUTO_935 ) ) ( not ( = ?AUTO_933 ?AUTO_934 ) ) ( not ( = ?AUTO_935 ?AUTO_934 ) ) ( ON ?AUTO_935 ?AUTO_932 ) ( CLEAR ?AUTO_935 ) ( HOLDING ?AUTO_933 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_933 )
      ( MAKE-ON ?AUTO_932 ?AUTO_933 )
      ( MAKE-ON-VERIFY ?AUTO_932 ?AUTO_933 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_936 - BLOCK
      ?AUTO_937 - BLOCK
    )
    :vars
    (
      ?AUTO_938 - BLOCK
      ?AUTO_939 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_936 ?AUTO_937 ) ) ( ON-TABLE ?AUTO_936 ) ( CLEAR ?AUTO_938 ) ( not ( = ?AUTO_936 ?AUTO_939 ) ) ( not ( = ?AUTO_936 ?AUTO_938 ) ) ( not ( = ?AUTO_937 ?AUTO_939 ) ) ( not ( = ?AUTO_937 ?AUTO_938 ) ) ( not ( = ?AUTO_939 ?AUTO_938 ) ) ( ON ?AUTO_939 ?AUTO_936 ) ( ON ?AUTO_937 ?AUTO_939 ) ( CLEAR ?AUTO_937 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_937 ?AUTO_939 )
      ( MAKE-ON ?AUTO_936 ?AUTO_937 )
      ( MAKE-ON-VERIFY ?AUTO_936 ?AUTO_937 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_940 - BLOCK
      ?AUTO_941 - BLOCK
    )
    :vars
    (
      ?AUTO_943 - BLOCK
      ?AUTO_942 - BLOCK
      ?AUTO_944 - BLOCK
      ?AUTO_945 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_940 ?AUTO_941 ) ) ( ON-TABLE ?AUTO_940 ) ( CLEAR ?AUTO_943 ) ( not ( = ?AUTO_940 ?AUTO_942 ) ) ( not ( = ?AUTO_940 ?AUTO_943 ) ) ( not ( = ?AUTO_941 ?AUTO_942 ) ) ( not ( = ?AUTO_941 ?AUTO_943 ) ) ( not ( = ?AUTO_942 ?AUTO_943 ) ) ( ON ?AUTO_942 ?AUTO_940 ) ( ON ?AUTO_941 ?AUTO_942 ) ( CLEAR ?AUTO_941 ) ( HOLDING ?AUTO_944 ) ( CLEAR ?AUTO_945 ) ( not ( = ?AUTO_940 ?AUTO_944 ) ) ( not ( = ?AUTO_940 ?AUTO_945 ) ) ( not ( = ?AUTO_941 ?AUTO_944 ) ) ( not ( = ?AUTO_941 ?AUTO_945 ) ) ( not ( = ?AUTO_943 ?AUTO_944 ) ) ( not ( = ?AUTO_943 ?AUTO_945 ) ) ( not ( = ?AUTO_942 ?AUTO_944 ) ) ( not ( = ?AUTO_942 ?AUTO_945 ) ) ( not ( = ?AUTO_944 ?AUTO_945 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_944 ?AUTO_945 )
      ( MAKE-ON ?AUTO_940 ?AUTO_941 )
      ( MAKE-ON-VERIFY ?AUTO_940 ?AUTO_941 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_954 - BLOCK
      ?AUTO_955 - BLOCK
    )
    :vars
    (
      ?AUTO_959 - BLOCK
      ?AUTO_956 - BLOCK
      ?AUTO_957 - BLOCK
      ?AUTO_958 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_954 ?AUTO_955 ) ) ( ON-TABLE ?AUTO_954 ) ( CLEAR ?AUTO_959 ) ( not ( = ?AUTO_954 ?AUTO_956 ) ) ( not ( = ?AUTO_954 ?AUTO_959 ) ) ( not ( = ?AUTO_955 ?AUTO_956 ) ) ( not ( = ?AUTO_955 ?AUTO_959 ) ) ( not ( = ?AUTO_956 ?AUTO_959 ) ) ( ON ?AUTO_956 ?AUTO_954 ) ( ON ?AUTO_955 ?AUTO_956 ) ( CLEAR ?AUTO_957 ) ( not ( = ?AUTO_954 ?AUTO_958 ) ) ( not ( = ?AUTO_954 ?AUTO_957 ) ) ( not ( = ?AUTO_955 ?AUTO_958 ) ) ( not ( = ?AUTO_955 ?AUTO_957 ) ) ( not ( = ?AUTO_959 ?AUTO_958 ) ) ( not ( = ?AUTO_959 ?AUTO_957 ) ) ( not ( = ?AUTO_956 ?AUTO_958 ) ) ( not ( = ?AUTO_956 ?AUTO_957 ) ) ( not ( = ?AUTO_958 ?AUTO_957 ) ) ( ON ?AUTO_958 ?AUTO_955 ) ( CLEAR ?AUTO_958 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_958 ?AUTO_955 )
      ( MAKE-ON ?AUTO_954 ?AUTO_955 )
      ( MAKE-ON-VERIFY ?AUTO_954 ?AUTO_955 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_960 - BLOCK
      ?AUTO_961 - BLOCK
    )
    :vars
    (
      ?AUTO_963 - BLOCK
      ?AUTO_964 - BLOCK
      ?AUTO_965 - BLOCK
      ?AUTO_962 - BLOCK
      ?AUTO_966 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_960 ?AUTO_961 ) ) ( ON-TABLE ?AUTO_960 ) ( CLEAR ?AUTO_963 ) ( not ( = ?AUTO_960 ?AUTO_964 ) ) ( not ( = ?AUTO_960 ?AUTO_963 ) ) ( not ( = ?AUTO_961 ?AUTO_964 ) ) ( not ( = ?AUTO_961 ?AUTO_963 ) ) ( not ( = ?AUTO_964 ?AUTO_963 ) ) ( ON ?AUTO_964 ?AUTO_960 ) ( ON ?AUTO_961 ?AUTO_964 ) ( CLEAR ?AUTO_965 ) ( not ( = ?AUTO_960 ?AUTO_962 ) ) ( not ( = ?AUTO_960 ?AUTO_965 ) ) ( not ( = ?AUTO_961 ?AUTO_962 ) ) ( not ( = ?AUTO_961 ?AUTO_965 ) ) ( not ( = ?AUTO_963 ?AUTO_962 ) ) ( not ( = ?AUTO_963 ?AUTO_965 ) ) ( not ( = ?AUTO_964 ?AUTO_962 ) ) ( not ( = ?AUTO_964 ?AUTO_965 ) ) ( not ( = ?AUTO_962 ?AUTO_965 ) ) ( ON ?AUTO_962 ?AUTO_961 ) ( CLEAR ?AUTO_962 ) ( HOLDING ?AUTO_966 ) ( not ( = ?AUTO_960 ?AUTO_966 ) ) ( not ( = ?AUTO_961 ?AUTO_966 ) ) ( not ( = ?AUTO_963 ?AUTO_966 ) ) ( not ( = ?AUTO_964 ?AUTO_966 ) ) ( not ( = ?AUTO_965 ?AUTO_966 ) ) ( not ( = ?AUTO_962 ?AUTO_966 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_966 )
      ( MAKE-ON ?AUTO_960 ?AUTO_961 )
      ( MAKE-ON-VERIFY ?AUTO_960 ?AUTO_961 ) )
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
    ( and ( CLEAR ?AUTO_997 ) ( not ( = ?AUTO_996 ?AUTO_997 ) ) ( ON ?AUTO_996 ?AUTO_998 ) ( not ( = ?AUTO_996 ?AUTO_998 ) ) ( not ( = ?AUTO_997 ?AUTO_998 ) ) ( not ( = ?AUTO_996 ?AUTO_999 ) ) ( not ( = ?AUTO_997 ?AUTO_999 ) ) ( not ( = ?AUTO_998 ?AUTO_999 ) ) ( ON ?AUTO_999 ?AUTO_996 ) ( CLEAR ?AUTO_999 ) ( HOLDING ?AUTO_1000 ) ( not ( = ?AUTO_996 ?AUTO_1000 ) ) ( not ( = ?AUTO_997 ?AUTO_1000 ) ) ( not ( = ?AUTO_998 ?AUTO_1000 ) ) ( not ( = ?AUTO_999 ?AUTO_1000 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1000 )
      ( MAKE-ON ?AUTO_996 ?AUTO_997 )
      ( MAKE-ON-VERIFY ?AUTO_996 ?AUTO_997 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2012 - BLOCK
    )
    :vars
    (
      ?AUTO_2016 - BLOCK
      ?AUTO_2015 - BLOCK
      ?AUTO_2014 - BLOCK
      ?AUTO_2013 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2012 ?AUTO_2016 ) ( not ( = ?AUTO_2012 ?AUTO_2016 ) ) ( not ( = ?AUTO_2012 ?AUTO_2015 ) ) ( not ( = ?AUTO_2012 ?AUTO_2014 ) ) ( not ( = ?AUTO_2016 ?AUTO_2015 ) ) ( not ( = ?AUTO_2016 ?AUTO_2014 ) ) ( not ( = ?AUTO_2015 ?AUTO_2014 ) ) ( ON ?AUTO_2015 ?AUTO_2012 ) ( not ( = ?AUTO_2012 ?AUTO_2013 ) ) ( not ( = ?AUTO_2016 ?AUTO_2013 ) ) ( not ( = ?AUTO_2014 ?AUTO_2013 ) ) ( not ( = ?AUTO_2015 ?AUTO_2013 ) ) ( ON ?AUTO_2013 ?AUTO_2015 ) ( CLEAR ?AUTO_2013 ) ( HOLDING ?AUTO_2014 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2014 )
      ( MAKE-ON-TABLE ?AUTO_2012 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2012 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1046 - BLOCK
      ?AUTO_1047 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1046 ?AUTO_1047 ) ) ( ON-TABLE ?AUTO_1046 ) ( CLEAR ?AUTO_1046 ) ( HOLDING ?AUTO_1047 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1047 )
      ( MAKE-ON ?AUTO_1046 ?AUTO_1047 )
      ( MAKE-ON-VERIFY ?AUTO_1046 ?AUTO_1047 ) )
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
    )
    :precondition
    ( and ( not ( = ?AUTO_1066 ?AUTO_1067 ) ) ( CLEAR ?AUTO_1068 ) ( not ( = ?AUTO_1066 ?AUTO_1069 ) ) ( not ( = ?AUTO_1066 ?AUTO_1068 ) ) ( not ( = ?AUTO_1067 ?AUTO_1069 ) ) ( not ( = ?AUTO_1067 ?AUTO_1068 ) ) ( not ( = ?AUTO_1069 ?AUTO_1068 ) ) ( ON ?AUTO_1069 ?AUTO_1067 ) ( ON ?AUTO_1066 ?AUTO_1069 ) ( CLEAR ?AUTO_1066 ) ( HOLDING ?AUTO_1070 ) ( not ( = ?AUTO_1066 ?AUTO_1070 ) ) ( not ( = ?AUTO_1067 ?AUTO_1070 ) ) ( not ( = ?AUTO_1068 ?AUTO_1070 ) ) ( not ( = ?AUTO_1069 ?AUTO_1070 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1070 )
      ( MAKE-ON ?AUTO_1066 ?AUTO_1067 )
      ( MAKE-ON-VERIFY ?AUTO_1066 ?AUTO_1067 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1103 - BLOCK
      ?AUTO_1104 - BLOCK
    )
    :vars
    (
      ?AUTO_1106 - BLOCK
      ?AUTO_1107 - BLOCK
      ?AUTO_1105 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1103 ?AUTO_1104 ) ) ( ON-TABLE ?AUTO_1103 ) ( not ( = ?AUTO_1103 ?AUTO_1106 ) ) ( not ( = ?AUTO_1104 ?AUTO_1106 ) ) ( ON ?AUTO_1106 ?AUTO_1103 ) ( CLEAR ?AUTO_1107 ) ( not ( = ?AUTO_1103 ?AUTO_1105 ) ) ( not ( = ?AUTO_1103 ?AUTO_1107 ) ) ( not ( = ?AUTO_1104 ?AUTO_1105 ) ) ( not ( = ?AUTO_1104 ?AUTO_1107 ) ) ( not ( = ?AUTO_1106 ?AUTO_1105 ) ) ( not ( = ?AUTO_1106 ?AUTO_1107 ) ) ( not ( = ?AUTO_1105 ?AUTO_1107 ) ) ( ON ?AUTO_1105 ?AUTO_1106 ) ( CLEAR ?AUTO_1105 ) ( HOLDING ?AUTO_1104 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1104 )
      ( MAKE-ON ?AUTO_1103 ?AUTO_1104 )
      ( MAKE-ON-VERIFY ?AUTO_1103 ?AUTO_1104 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1108 - BLOCK
      ?AUTO_1109 - BLOCK
    )
    :vars
    (
      ?AUTO_1112 - BLOCK
      ?AUTO_1110 - BLOCK
      ?AUTO_1111 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1108 ?AUTO_1109 ) ) ( ON-TABLE ?AUTO_1108 ) ( not ( = ?AUTO_1108 ?AUTO_1112 ) ) ( not ( = ?AUTO_1109 ?AUTO_1112 ) ) ( ON ?AUTO_1112 ?AUTO_1108 ) ( CLEAR ?AUTO_1110 ) ( not ( = ?AUTO_1108 ?AUTO_1111 ) ) ( not ( = ?AUTO_1108 ?AUTO_1110 ) ) ( not ( = ?AUTO_1109 ?AUTO_1111 ) ) ( not ( = ?AUTO_1109 ?AUTO_1110 ) ) ( not ( = ?AUTO_1112 ?AUTO_1111 ) ) ( not ( = ?AUTO_1112 ?AUTO_1110 ) ) ( not ( = ?AUTO_1111 ?AUTO_1110 ) ) ( ON ?AUTO_1111 ?AUTO_1112 ) ( ON ?AUTO_1109 ?AUTO_1111 ) ( CLEAR ?AUTO_1109 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1109 ?AUTO_1111 )
      ( MAKE-ON ?AUTO_1108 ?AUTO_1109 )
      ( MAKE-ON-VERIFY ?AUTO_1108 ?AUTO_1109 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1113 - BLOCK
      ?AUTO_1114 - BLOCK
    )
    :vars
    (
      ?AUTO_1115 - BLOCK
      ?AUTO_1117 - BLOCK
      ?AUTO_1116 - BLOCK
      ?AUTO_1118 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1113 ?AUTO_1114 ) ) ( ON-TABLE ?AUTO_1113 ) ( not ( = ?AUTO_1113 ?AUTO_1115 ) ) ( not ( = ?AUTO_1114 ?AUTO_1115 ) ) ( ON ?AUTO_1115 ?AUTO_1113 ) ( CLEAR ?AUTO_1117 ) ( not ( = ?AUTO_1113 ?AUTO_1116 ) ) ( not ( = ?AUTO_1113 ?AUTO_1117 ) ) ( not ( = ?AUTO_1114 ?AUTO_1116 ) ) ( not ( = ?AUTO_1114 ?AUTO_1117 ) ) ( not ( = ?AUTO_1115 ?AUTO_1116 ) ) ( not ( = ?AUTO_1115 ?AUTO_1117 ) ) ( not ( = ?AUTO_1116 ?AUTO_1117 ) ) ( ON ?AUTO_1116 ?AUTO_1115 ) ( ON ?AUTO_1114 ?AUTO_1116 ) ( CLEAR ?AUTO_1114 ) ( HOLDING ?AUTO_1118 ) ( not ( = ?AUTO_1113 ?AUTO_1118 ) ) ( not ( = ?AUTO_1114 ?AUTO_1118 ) ) ( not ( = ?AUTO_1115 ?AUTO_1118 ) ) ( not ( = ?AUTO_1117 ?AUTO_1118 ) ) ( not ( = ?AUTO_1116 ?AUTO_1118 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1118 )
      ( MAKE-ON ?AUTO_1113 ?AUTO_1114 )
      ( MAKE-ON-VERIFY ?AUTO_1113 ?AUTO_1114 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1119 - BLOCK
      ?AUTO_1120 - BLOCK
    )
    :vars
    (
      ?AUTO_1121 - BLOCK
      ?AUTO_1124 - BLOCK
      ?AUTO_1122 - BLOCK
      ?AUTO_1123 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1119 ?AUTO_1120 ) ) ( ON-TABLE ?AUTO_1119 ) ( not ( = ?AUTO_1119 ?AUTO_1121 ) ) ( not ( = ?AUTO_1120 ?AUTO_1121 ) ) ( ON ?AUTO_1121 ?AUTO_1119 ) ( CLEAR ?AUTO_1124 ) ( not ( = ?AUTO_1119 ?AUTO_1122 ) ) ( not ( = ?AUTO_1119 ?AUTO_1124 ) ) ( not ( = ?AUTO_1120 ?AUTO_1122 ) ) ( not ( = ?AUTO_1120 ?AUTO_1124 ) ) ( not ( = ?AUTO_1121 ?AUTO_1122 ) ) ( not ( = ?AUTO_1121 ?AUTO_1124 ) ) ( not ( = ?AUTO_1122 ?AUTO_1124 ) ) ( ON ?AUTO_1122 ?AUTO_1121 ) ( ON ?AUTO_1120 ?AUTO_1122 ) ( not ( = ?AUTO_1119 ?AUTO_1123 ) ) ( not ( = ?AUTO_1120 ?AUTO_1123 ) ) ( not ( = ?AUTO_1121 ?AUTO_1123 ) ) ( not ( = ?AUTO_1124 ?AUTO_1123 ) ) ( not ( = ?AUTO_1122 ?AUTO_1123 ) ) ( ON ?AUTO_1123 ?AUTO_1120 ) ( CLEAR ?AUTO_1123 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1123 ?AUTO_1120 )
      ( MAKE-ON ?AUTO_1119 ?AUTO_1120 )
      ( MAKE-ON-VERIFY ?AUTO_1119 ?AUTO_1120 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1186 - BLOCK
      ?AUTO_1187 - BLOCK
    )
    :vars
    (
      ?AUTO_1188 - BLOCK
      ?AUTO_1189 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1186 ?AUTO_1187 ) ) ( ON ?AUTO_1186 ?AUTO_1188 ) ( not ( = ?AUTO_1186 ?AUTO_1188 ) ) ( not ( = ?AUTO_1187 ?AUTO_1188 ) ) ( not ( = ?AUTO_1186 ?AUTO_1189 ) ) ( not ( = ?AUTO_1187 ?AUTO_1189 ) ) ( not ( = ?AUTO_1188 ?AUTO_1189 ) ) ( ON ?AUTO_1189 ?AUTO_1186 ) ( CLEAR ?AUTO_1189 ) ( HOLDING ?AUTO_1187 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1187 )
      ( MAKE-ON ?AUTO_1186 ?AUTO_1187 )
      ( MAKE-ON-VERIFY ?AUTO_1186 ?AUTO_1187 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1516 - BLOCK
      ?AUTO_1517 - BLOCK
    )
    :vars
    (
      ?AUTO_1519 - BLOCK
      ?AUTO_1518 - BLOCK
      ?AUTO_1520 - BLOCK
      ?AUTO_1521 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1517 ) ( not ( = ?AUTO_1516 ?AUTO_1517 ) ) ( ON ?AUTO_1516 ?AUTO_1519 ) ( not ( = ?AUTO_1516 ?AUTO_1519 ) ) ( not ( = ?AUTO_1517 ?AUTO_1519 ) ) ( not ( = ?AUTO_1516 ?AUTO_1518 ) ) ( not ( = ?AUTO_1517 ?AUTO_1518 ) ) ( not ( = ?AUTO_1519 ?AUTO_1518 ) ) ( ON ?AUTO_1518 ?AUTO_1516 ) ( not ( = ?AUTO_1516 ?AUTO_1520 ) ) ( not ( = ?AUTO_1517 ?AUTO_1520 ) ) ( not ( = ?AUTO_1519 ?AUTO_1520 ) ) ( not ( = ?AUTO_1518 ?AUTO_1520 ) ) ( ON ?AUTO_1520 ?AUTO_1518 ) ( CLEAR ?AUTO_1520 ) ( HOLDING ?AUTO_1521 ) ( not ( = ?AUTO_1516 ?AUTO_1521 ) ) ( not ( = ?AUTO_1517 ?AUTO_1521 ) ) ( not ( = ?AUTO_1519 ?AUTO_1521 ) ) ( not ( = ?AUTO_1518 ?AUTO_1521 ) ) ( not ( = ?AUTO_1520 ?AUTO_1521 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1521 )
      ( MAKE-ON ?AUTO_1516 ?AUTO_1517 )
      ( MAKE-ON-VERIFY ?AUTO_1516 ?AUTO_1517 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1243 - BLOCK
      ?AUTO_1244 - BLOCK
    )
    :vars
    (
      ?AUTO_1247 - BLOCK
      ?AUTO_1245 - BLOCK
      ?AUTO_1248 - BLOCK
      ?AUTO_1249 - BLOCK
      ?AUTO_1246 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1243 ?AUTO_1244 ) ) ( ON ?AUTO_1243 ?AUTO_1247 ) ( not ( = ?AUTO_1243 ?AUTO_1247 ) ) ( not ( = ?AUTO_1244 ?AUTO_1247 ) ) ( CLEAR ?AUTO_1245 ) ( not ( = ?AUTO_1243 ?AUTO_1248 ) ) ( not ( = ?AUTO_1243 ?AUTO_1245 ) ) ( not ( = ?AUTO_1244 ?AUTO_1248 ) ) ( not ( = ?AUTO_1244 ?AUTO_1245 ) ) ( not ( = ?AUTO_1247 ?AUTO_1248 ) ) ( not ( = ?AUTO_1247 ?AUTO_1245 ) ) ( not ( = ?AUTO_1248 ?AUTO_1245 ) ) ( ON ?AUTO_1248 ?AUTO_1243 ) ( not ( = ?AUTO_1243 ?AUTO_1249 ) ) ( not ( = ?AUTO_1244 ?AUTO_1249 ) ) ( not ( = ?AUTO_1247 ?AUTO_1249 ) ) ( not ( = ?AUTO_1245 ?AUTO_1249 ) ) ( not ( = ?AUTO_1248 ?AUTO_1249 ) ) ( ON ?AUTO_1249 ?AUTO_1248 ) ( CLEAR ?AUTO_1249 ) ( not ( = ?AUTO_1243 ?AUTO_1246 ) ) ( not ( = ?AUTO_1244 ?AUTO_1246 ) ) ( not ( = ?AUTO_1247 ?AUTO_1246 ) ) ( not ( = ?AUTO_1245 ?AUTO_1246 ) ) ( not ( = ?AUTO_1248 ?AUTO_1246 ) ) ( not ( = ?AUTO_1249 ?AUTO_1246 ) ) ( ON ?AUTO_1246 ?AUTO_1244 ) ( CLEAR ?AUTO_1246 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1246 ?AUTO_1244 )
      ( MAKE-ON ?AUTO_1243 ?AUTO_1244 )
      ( MAKE-ON-VERIFY ?AUTO_1243 ?AUTO_1244 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1250 - BLOCK
      ?AUTO_1251 - BLOCK
    )
    :vars
    (
      ?AUTO_1255 - BLOCK
      ?AUTO_1253 - BLOCK
      ?AUTO_1252 - BLOCK
      ?AUTO_1254 - BLOCK
      ?AUTO_1256 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1250 ?AUTO_1251 ) ) ( ON ?AUTO_1250 ?AUTO_1255 ) ( not ( = ?AUTO_1250 ?AUTO_1255 ) ) ( not ( = ?AUTO_1251 ?AUTO_1255 ) ) ( not ( = ?AUTO_1250 ?AUTO_1253 ) ) ( not ( = ?AUTO_1250 ?AUTO_1252 ) ) ( not ( = ?AUTO_1251 ?AUTO_1253 ) ) ( not ( = ?AUTO_1251 ?AUTO_1252 ) ) ( not ( = ?AUTO_1255 ?AUTO_1253 ) ) ( not ( = ?AUTO_1255 ?AUTO_1252 ) ) ( not ( = ?AUTO_1253 ?AUTO_1252 ) ) ( ON ?AUTO_1253 ?AUTO_1250 ) ( not ( = ?AUTO_1250 ?AUTO_1254 ) ) ( not ( = ?AUTO_1251 ?AUTO_1254 ) ) ( not ( = ?AUTO_1255 ?AUTO_1254 ) ) ( not ( = ?AUTO_1252 ?AUTO_1254 ) ) ( not ( = ?AUTO_1253 ?AUTO_1254 ) ) ( ON ?AUTO_1254 ?AUTO_1253 ) ( CLEAR ?AUTO_1254 ) ( not ( = ?AUTO_1250 ?AUTO_1256 ) ) ( not ( = ?AUTO_1251 ?AUTO_1256 ) ) ( not ( = ?AUTO_1255 ?AUTO_1256 ) ) ( not ( = ?AUTO_1252 ?AUTO_1256 ) ) ( not ( = ?AUTO_1253 ?AUTO_1256 ) ) ( not ( = ?AUTO_1254 ?AUTO_1256 ) ) ( ON ?AUTO_1256 ?AUTO_1251 ) ( CLEAR ?AUTO_1256 ) ( HOLDING ?AUTO_1252 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1252 )
      ( MAKE-ON ?AUTO_1250 ?AUTO_1251 )
      ( MAKE-ON-VERIFY ?AUTO_1250 ?AUTO_1251 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1257 - BLOCK
      ?AUTO_1258 - BLOCK
    )
    :vars
    (
      ?AUTO_1260 - BLOCK
      ?AUTO_1261 - BLOCK
      ?AUTO_1262 - BLOCK
      ?AUTO_1263 - BLOCK
      ?AUTO_1259 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1257 ?AUTO_1258 ) ) ( ON ?AUTO_1257 ?AUTO_1260 ) ( not ( = ?AUTO_1257 ?AUTO_1260 ) ) ( not ( = ?AUTO_1258 ?AUTO_1260 ) ) ( not ( = ?AUTO_1257 ?AUTO_1261 ) ) ( not ( = ?AUTO_1257 ?AUTO_1262 ) ) ( not ( = ?AUTO_1258 ?AUTO_1261 ) ) ( not ( = ?AUTO_1258 ?AUTO_1262 ) ) ( not ( = ?AUTO_1260 ?AUTO_1261 ) ) ( not ( = ?AUTO_1260 ?AUTO_1262 ) ) ( not ( = ?AUTO_1261 ?AUTO_1262 ) ) ( ON ?AUTO_1261 ?AUTO_1257 ) ( not ( = ?AUTO_1257 ?AUTO_1263 ) ) ( not ( = ?AUTO_1258 ?AUTO_1263 ) ) ( not ( = ?AUTO_1260 ?AUTO_1263 ) ) ( not ( = ?AUTO_1262 ?AUTO_1263 ) ) ( not ( = ?AUTO_1261 ?AUTO_1263 ) ) ( ON ?AUTO_1263 ?AUTO_1261 ) ( not ( = ?AUTO_1257 ?AUTO_1259 ) ) ( not ( = ?AUTO_1258 ?AUTO_1259 ) ) ( not ( = ?AUTO_1260 ?AUTO_1259 ) ) ( not ( = ?AUTO_1262 ?AUTO_1259 ) ) ( not ( = ?AUTO_1261 ?AUTO_1259 ) ) ( not ( = ?AUTO_1263 ?AUTO_1259 ) ) ( ON ?AUTO_1259 ?AUTO_1258 ) ( CLEAR ?AUTO_1259 ) ( ON ?AUTO_1262 ?AUTO_1263 ) ( CLEAR ?AUTO_1262 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1262 ?AUTO_1263 )
      ( MAKE-ON ?AUTO_1257 ?AUTO_1258 )
      ( MAKE-ON-VERIFY ?AUTO_1257 ?AUTO_1258 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4104 - BLOCK
      ?AUTO_4105 - BLOCK
    )
    :vars
    (
      ?AUTO_4107 - BLOCK
      ?AUTO_4106 - BLOCK
      ?AUTO_4108 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4104 ?AUTO_4105 ) ) ( ON-TABLE ?AUTO_4104 ) ( CLEAR ?AUTO_4104 ) ( not ( = ?AUTO_4104 ?AUTO_4107 ) ) ( not ( = ?AUTO_4105 ?AUTO_4107 ) ) ( ON ?AUTO_4107 ?AUTO_4105 ) ( not ( = ?AUTO_4104 ?AUTO_4106 ) ) ( not ( = ?AUTO_4105 ?AUTO_4106 ) ) ( not ( = ?AUTO_4107 ?AUTO_4106 ) ) ( ON ?AUTO_4106 ?AUTO_4107 ) ( CLEAR ?AUTO_4106 ) ( HOLDING ?AUTO_4108 ) ( not ( = ?AUTO_4104 ?AUTO_4108 ) ) ( not ( = ?AUTO_4105 ?AUTO_4108 ) ) ( not ( = ?AUTO_4107 ?AUTO_4108 ) ) ( not ( = ?AUTO_4106 ?AUTO_4108 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4108 )
      ( MAKE-ON ?AUTO_4104 ?AUTO_4105 )
      ( MAKE-ON-VERIFY ?AUTO_4104 ?AUTO_4105 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4109 - BLOCK
      ?AUTO_4110 - BLOCK
    )
    :vars
    (
      ?AUTO_4113 - BLOCK
      ?AUTO_4112 - BLOCK
      ?AUTO_4111 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4109 ?AUTO_4110 ) ) ( ON-TABLE ?AUTO_4109 ) ( CLEAR ?AUTO_4109 ) ( not ( = ?AUTO_4109 ?AUTO_4113 ) ) ( not ( = ?AUTO_4110 ?AUTO_4113 ) ) ( ON ?AUTO_4113 ?AUTO_4110 ) ( not ( = ?AUTO_4109 ?AUTO_4112 ) ) ( not ( = ?AUTO_4110 ?AUTO_4112 ) ) ( not ( = ?AUTO_4113 ?AUTO_4112 ) ) ( ON ?AUTO_4112 ?AUTO_4113 ) ( not ( = ?AUTO_4109 ?AUTO_4111 ) ) ( not ( = ?AUTO_4110 ?AUTO_4111 ) ) ( not ( = ?AUTO_4113 ?AUTO_4111 ) ) ( not ( = ?AUTO_4112 ?AUTO_4111 ) ) ( ON ?AUTO_4111 ?AUTO_4112 ) ( CLEAR ?AUTO_4111 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4111 ?AUTO_4112 )
      ( MAKE-ON ?AUTO_4109 ?AUTO_4110 )
      ( MAKE-ON-VERIFY ?AUTO_4109 ?AUTO_4110 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1304 - BLOCK
      ?AUTO_1305 - BLOCK
    )
    :vars
    (
      ?AUTO_1308 - BLOCK
      ?AUTO_1309 - BLOCK
      ?AUTO_1306 - BLOCK
      ?AUTO_1307 - BLOCK
      ?AUTO_1310 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1304 ?AUTO_1305 ) ) ( ON-TABLE ?AUTO_1304 ) ( CLEAR ?AUTO_1304 ) ( not ( = ?AUTO_1304 ?AUTO_1308 ) ) ( not ( = ?AUTO_1304 ?AUTO_1309 ) ) ( not ( = ?AUTO_1305 ?AUTO_1308 ) ) ( not ( = ?AUTO_1305 ?AUTO_1309 ) ) ( not ( = ?AUTO_1308 ?AUTO_1309 ) ) ( ON ?AUTO_1308 ?AUTO_1305 ) ( CLEAR ?AUTO_1306 ) ( not ( = ?AUTO_1304 ?AUTO_1307 ) ) ( not ( = ?AUTO_1304 ?AUTO_1306 ) ) ( not ( = ?AUTO_1305 ?AUTO_1307 ) ) ( not ( = ?AUTO_1305 ?AUTO_1306 ) ) ( not ( = ?AUTO_1309 ?AUTO_1307 ) ) ( not ( = ?AUTO_1309 ?AUTO_1306 ) ) ( not ( = ?AUTO_1308 ?AUTO_1307 ) ) ( not ( = ?AUTO_1308 ?AUTO_1306 ) ) ( not ( = ?AUTO_1307 ?AUTO_1306 ) ) ( ON ?AUTO_1307 ?AUTO_1308 ) ( not ( = ?AUTO_1304 ?AUTO_1310 ) ) ( not ( = ?AUTO_1305 ?AUTO_1310 ) ) ( not ( = ?AUTO_1309 ?AUTO_1310 ) ) ( not ( = ?AUTO_1308 ?AUTO_1310 ) ) ( not ( = ?AUTO_1306 ?AUTO_1310 ) ) ( not ( = ?AUTO_1307 ?AUTO_1310 ) ) ( ON ?AUTO_1310 ?AUTO_1307 ) ( CLEAR ?AUTO_1310 ) ( HOLDING ?AUTO_1309 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1309 )
      ( MAKE-ON ?AUTO_1304 ?AUTO_1305 )
      ( MAKE-ON-VERIFY ?AUTO_1304 ?AUTO_1305 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1311 - BLOCK
      ?AUTO_1312 - BLOCK
    )
    :vars
    (
      ?AUTO_1317 - BLOCK
      ?AUTO_1314 - BLOCK
      ?AUTO_1313 - BLOCK
      ?AUTO_1316 - BLOCK
      ?AUTO_1315 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1311 ?AUTO_1312 ) ) ( ON-TABLE ?AUTO_1311 ) ( not ( = ?AUTO_1311 ?AUTO_1317 ) ) ( not ( = ?AUTO_1311 ?AUTO_1314 ) ) ( not ( = ?AUTO_1312 ?AUTO_1317 ) ) ( not ( = ?AUTO_1312 ?AUTO_1314 ) ) ( not ( = ?AUTO_1317 ?AUTO_1314 ) ) ( ON ?AUTO_1317 ?AUTO_1312 ) ( CLEAR ?AUTO_1313 ) ( not ( = ?AUTO_1311 ?AUTO_1316 ) ) ( not ( = ?AUTO_1311 ?AUTO_1313 ) ) ( not ( = ?AUTO_1312 ?AUTO_1316 ) ) ( not ( = ?AUTO_1312 ?AUTO_1313 ) ) ( not ( = ?AUTO_1314 ?AUTO_1316 ) ) ( not ( = ?AUTO_1314 ?AUTO_1313 ) ) ( not ( = ?AUTO_1317 ?AUTO_1316 ) ) ( not ( = ?AUTO_1317 ?AUTO_1313 ) ) ( not ( = ?AUTO_1316 ?AUTO_1313 ) ) ( ON ?AUTO_1316 ?AUTO_1317 ) ( not ( = ?AUTO_1311 ?AUTO_1315 ) ) ( not ( = ?AUTO_1312 ?AUTO_1315 ) ) ( not ( = ?AUTO_1314 ?AUTO_1315 ) ) ( not ( = ?AUTO_1317 ?AUTO_1315 ) ) ( not ( = ?AUTO_1313 ?AUTO_1315 ) ) ( not ( = ?AUTO_1316 ?AUTO_1315 ) ) ( ON ?AUTO_1315 ?AUTO_1316 ) ( CLEAR ?AUTO_1315 ) ( ON ?AUTO_1314 ?AUTO_1311 ) ( CLEAR ?AUTO_1314 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1314 ?AUTO_1311 )
      ( MAKE-ON ?AUTO_1311 ?AUTO_1312 )
      ( MAKE-ON-VERIFY ?AUTO_1311 ?AUTO_1312 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1318 - BLOCK
      ?AUTO_1319 - BLOCK
    )
    :vars
    (
      ?AUTO_1320 - BLOCK
      ?AUTO_1322 - BLOCK
      ?AUTO_1324 - BLOCK
      ?AUTO_1323 - BLOCK
      ?AUTO_1321 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1318 ?AUTO_1319 ) ) ( ON-TABLE ?AUTO_1318 ) ( not ( = ?AUTO_1318 ?AUTO_1320 ) ) ( not ( = ?AUTO_1318 ?AUTO_1322 ) ) ( not ( = ?AUTO_1319 ?AUTO_1320 ) ) ( not ( = ?AUTO_1319 ?AUTO_1322 ) ) ( not ( = ?AUTO_1320 ?AUTO_1322 ) ) ( ON ?AUTO_1320 ?AUTO_1319 ) ( not ( = ?AUTO_1318 ?AUTO_1324 ) ) ( not ( = ?AUTO_1318 ?AUTO_1323 ) ) ( not ( = ?AUTO_1319 ?AUTO_1324 ) ) ( not ( = ?AUTO_1319 ?AUTO_1323 ) ) ( not ( = ?AUTO_1322 ?AUTO_1324 ) ) ( not ( = ?AUTO_1322 ?AUTO_1323 ) ) ( not ( = ?AUTO_1320 ?AUTO_1324 ) ) ( not ( = ?AUTO_1320 ?AUTO_1323 ) ) ( not ( = ?AUTO_1324 ?AUTO_1323 ) ) ( ON ?AUTO_1324 ?AUTO_1320 ) ( not ( = ?AUTO_1318 ?AUTO_1321 ) ) ( not ( = ?AUTO_1319 ?AUTO_1321 ) ) ( not ( = ?AUTO_1322 ?AUTO_1321 ) ) ( not ( = ?AUTO_1320 ?AUTO_1321 ) ) ( not ( = ?AUTO_1323 ?AUTO_1321 ) ) ( not ( = ?AUTO_1324 ?AUTO_1321 ) ) ( ON ?AUTO_1321 ?AUTO_1324 ) ( CLEAR ?AUTO_1321 ) ( ON ?AUTO_1322 ?AUTO_1318 ) ( CLEAR ?AUTO_1322 ) ( HOLDING ?AUTO_1323 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1323 )
      ( MAKE-ON ?AUTO_1318 ?AUTO_1319 )
      ( MAKE-ON-VERIFY ?AUTO_1318 ?AUTO_1319 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1325 - BLOCK
      ?AUTO_1326 - BLOCK
    )
    :vars
    (
      ?AUTO_1327 - BLOCK
      ?AUTO_1331 - BLOCK
      ?AUTO_1329 - BLOCK
      ?AUTO_1330 - BLOCK
      ?AUTO_1328 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1325 ?AUTO_1326 ) ) ( ON-TABLE ?AUTO_1325 ) ( not ( = ?AUTO_1325 ?AUTO_1327 ) ) ( not ( = ?AUTO_1325 ?AUTO_1331 ) ) ( not ( = ?AUTO_1326 ?AUTO_1327 ) ) ( not ( = ?AUTO_1326 ?AUTO_1331 ) ) ( not ( = ?AUTO_1327 ?AUTO_1331 ) ) ( ON ?AUTO_1327 ?AUTO_1326 ) ( not ( = ?AUTO_1325 ?AUTO_1329 ) ) ( not ( = ?AUTO_1325 ?AUTO_1330 ) ) ( not ( = ?AUTO_1326 ?AUTO_1329 ) ) ( not ( = ?AUTO_1326 ?AUTO_1330 ) ) ( not ( = ?AUTO_1331 ?AUTO_1329 ) ) ( not ( = ?AUTO_1331 ?AUTO_1330 ) ) ( not ( = ?AUTO_1327 ?AUTO_1329 ) ) ( not ( = ?AUTO_1327 ?AUTO_1330 ) ) ( not ( = ?AUTO_1329 ?AUTO_1330 ) ) ( ON ?AUTO_1329 ?AUTO_1327 ) ( not ( = ?AUTO_1325 ?AUTO_1328 ) ) ( not ( = ?AUTO_1326 ?AUTO_1328 ) ) ( not ( = ?AUTO_1331 ?AUTO_1328 ) ) ( not ( = ?AUTO_1327 ?AUTO_1328 ) ) ( not ( = ?AUTO_1330 ?AUTO_1328 ) ) ( not ( = ?AUTO_1329 ?AUTO_1328 ) ) ( ON ?AUTO_1328 ?AUTO_1329 ) ( CLEAR ?AUTO_1328 ) ( ON ?AUTO_1331 ?AUTO_1325 ) ( ON ?AUTO_1330 ?AUTO_1331 ) ( CLEAR ?AUTO_1330 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1330 ?AUTO_1331 )
      ( MAKE-ON ?AUTO_1325 ?AUTO_1326 )
      ( MAKE-ON-VERIFY ?AUTO_1325 ?AUTO_1326 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1332 - BLOCK
      ?AUTO_1333 - BLOCK
    )
    :vars
    (
      ?AUTO_1334 - BLOCK
      ?AUTO_1337 - BLOCK
      ?AUTO_1338 - BLOCK
      ?AUTO_1336 - BLOCK
      ?AUTO_1335 - BLOCK
      ?AUTO_1339 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1332 ?AUTO_1333 ) ) ( ON-TABLE ?AUTO_1332 ) ( not ( = ?AUTO_1332 ?AUTO_1334 ) ) ( not ( = ?AUTO_1332 ?AUTO_1337 ) ) ( not ( = ?AUTO_1333 ?AUTO_1334 ) ) ( not ( = ?AUTO_1333 ?AUTO_1337 ) ) ( not ( = ?AUTO_1334 ?AUTO_1337 ) ) ( ON ?AUTO_1334 ?AUTO_1333 ) ( not ( = ?AUTO_1332 ?AUTO_1338 ) ) ( not ( = ?AUTO_1332 ?AUTO_1336 ) ) ( not ( = ?AUTO_1333 ?AUTO_1338 ) ) ( not ( = ?AUTO_1333 ?AUTO_1336 ) ) ( not ( = ?AUTO_1337 ?AUTO_1338 ) ) ( not ( = ?AUTO_1337 ?AUTO_1336 ) ) ( not ( = ?AUTO_1334 ?AUTO_1338 ) ) ( not ( = ?AUTO_1334 ?AUTO_1336 ) ) ( not ( = ?AUTO_1338 ?AUTO_1336 ) ) ( ON ?AUTO_1338 ?AUTO_1334 ) ( not ( = ?AUTO_1332 ?AUTO_1335 ) ) ( not ( = ?AUTO_1333 ?AUTO_1335 ) ) ( not ( = ?AUTO_1337 ?AUTO_1335 ) ) ( not ( = ?AUTO_1334 ?AUTO_1335 ) ) ( not ( = ?AUTO_1336 ?AUTO_1335 ) ) ( not ( = ?AUTO_1338 ?AUTO_1335 ) ) ( ON ?AUTO_1335 ?AUTO_1338 ) ( CLEAR ?AUTO_1335 ) ( ON ?AUTO_1337 ?AUTO_1332 ) ( ON ?AUTO_1336 ?AUTO_1337 ) ( CLEAR ?AUTO_1336 ) ( HOLDING ?AUTO_1339 ) ( not ( = ?AUTO_1332 ?AUTO_1339 ) ) ( not ( = ?AUTO_1333 ?AUTO_1339 ) ) ( not ( = ?AUTO_1334 ?AUTO_1339 ) ) ( not ( = ?AUTO_1337 ?AUTO_1339 ) ) ( not ( = ?AUTO_1338 ?AUTO_1339 ) ) ( not ( = ?AUTO_1336 ?AUTO_1339 ) ) ( not ( = ?AUTO_1335 ?AUTO_1339 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1339 )
      ( MAKE-ON ?AUTO_1332 ?AUTO_1333 )
      ( MAKE-ON-VERIFY ?AUTO_1332 ?AUTO_1333 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1340 - BLOCK
      ?AUTO_1341 - BLOCK
    )
    :vars
    (
      ?AUTO_1343 - BLOCK
      ?AUTO_1344 - BLOCK
      ?AUTO_1345 - BLOCK
      ?AUTO_1346 - BLOCK
      ?AUTO_1342 - BLOCK
      ?AUTO_1347 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1340 ?AUTO_1341 ) ) ( ON-TABLE ?AUTO_1340 ) ( not ( = ?AUTO_1340 ?AUTO_1343 ) ) ( not ( = ?AUTO_1340 ?AUTO_1344 ) ) ( not ( = ?AUTO_1341 ?AUTO_1343 ) ) ( not ( = ?AUTO_1341 ?AUTO_1344 ) ) ( not ( = ?AUTO_1343 ?AUTO_1344 ) ) ( ON ?AUTO_1343 ?AUTO_1341 ) ( not ( = ?AUTO_1340 ?AUTO_1345 ) ) ( not ( = ?AUTO_1340 ?AUTO_1346 ) ) ( not ( = ?AUTO_1341 ?AUTO_1345 ) ) ( not ( = ?AUTO_1341 ?AUTO_1346 ) ) ( not ( = ?AUTO_1344 ?AUTO_1345 ) ) ( not ( = ?AUTO_1344 ?AUTO_1346 ) ) ( not ( = ?AUTO_1343 ?AUTO_1345 ) ) ( not ( = ?AUTO_1343 ?AUTO_1346 ) ) ( not ( = ?AUTO_1345 ?AUTO_1346 ) ) ( ON ?AUTO_1345 ?AUTO_1343 ) ( not ( = ?AUTO_1340 ?AUTO_1342 ) ) ( not ( = ?AUTO_1341 ?AUTO_1342 ) ) ( not ( = ?AUTO_1344 ?AUTO_1342 ) ) ( not ( = ?AUTO_1343 ?AUTO_1342 ) ) ( not ( = ?AUTO_1346 ?AUTO_1342 ) ) ( not ( = ?AUTO_1345 ?AUTO_1342 ) ) ( ON ?AUTO_1342 ?AUTO_1345 ) ( ON ?AUTO_1344 ?AUTO_1340 ) ( ON ?AUTO_1346 ?AUTO_1344 ) ( CLEAR ?AUTO_1346 ) ( not ( = ?AUTO_1340 ?AUTO_1347 ) ) ( not ( = ?AUTO_1341 ?AUTO_1347 ) ) ( not ( = ?AUTO_1343 ?AUTO_1347 ) ) ( not ( = ?AUTO_1344 ?AUTO_1347 ) ) ( not ( = ?AUTO_1345 ?AUTO_1347 ) ) ( not ( = ?AUTO_1346 ?AUTO_1347 ) ) ( not ( = ?AUTO_1342 ?AUTO_1347 ) ) ( ON ?AUTO_1347 ?AUTO_1342 ) ( CLEAR ?AUTO_1347 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1347 ?AUTO_1342 )
      ( MAKE-ON ?AUTO_1340 ?AUTO_1341 )
      ( MAKE-ON-VERIFY ?AUTO_1340 ?AUTO_1341 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3488 - BLOCK
      ?AUTO_3489 - BLOCK
    )
    :vars
    (
      ?AUTO_3490 - BLOCK
      ?AUTO_3491 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3488 ?AUTO_3489 ) ) ( not ( = ?AUTO_3488 ?AUTO_3490 ) ) ( not ( = ?AUTO_3489 ?AUTO_3490 ) ) ( ON ?AUTO_3490 ?AUTO_3489 ) ( not ( = ?AUTO_3488 ?AUTO_3491 ) ) ( not ( = ?AUTO_3489 ?AUTO_3491 ) ) ( not ( = ?AUTO_3490 ?AUTO_3491 ) ) ( ON ?AUTO_3491 ?AUTO_3490 ) ( CLEAR ?AUTO_3491 ) ( HOLDING ?AUTO_3488 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3488 )
      ( MAKE-ON ?AUTO_3488 ?AUTO_3489 )
      ( MAKE-ON-VERIFY ?AUTO_3488 ?AUTO_3489 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1423 - BLOCK
      ?AUTO_1424 - BLOCK
    )
    :vars
    (
      ?AUTO_1427 - BLOCK
      ?AUTO_1428 - BLOCK
      ?AUTO_1426 - BLOCK
      ?AUTO_1425 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1423 ?AUTO_1424 ) ) ( not ( = ?AUTO_1423 ?AUTO_1427 ) ) ( not ( = ?AUTO_1423 ?AUTO_1428 ) ) ( not ( = ?AUTO_1424 ?AUTO_1427 ) ) ( not ( = ?AUTO_1424 ?AUTO_1428 ) ) ( not ( = ?AUTO_1427 ?AUTO_1428 ) ) ( ON ?AUTO_1427 ?AUTO_1424 ) ( CLEAR ?AUTO_1426 ) ( not ( = ?AUTO_1423 ?AUTO_1425 ) ) ( not ( = ?AUTO_1423 ?AUTO_1426 ) ) ( not ( = ?AUTO_1424 ?AUTO_1425 ) ) ( not ( = ?AUTO_1424 ?AUTO_1426 ) ) ( not ( = ?AUTO_1428 ?AUTO_1425 ) ) ( not ( = ?AUTO_1428 ?AUTO_1426 ) ) ( not ( = ?AUTO_1427 ?AUTO_1425 ) ) ( not ( = ?AUTO_1427 ?AUTO_1426 ) ) ( not ( = ?AUTO_1425 ?AUTO_1426 ) ) ( ON ?AUTO_1425 ?AUTO_1427 ) ( CLEAR ?AUTO_1425 ) ( ON ?AUTO_1423 ?AUTO_1428 ) ( CLEAR ?AUTO_1423 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1423 ?AUTO_1428 )
      ( MAKE-ON ?AUTO_1423 ?AUTO_1424 )
      ( MAKE-ON-VERIFY ?AUTO_1423 ?AUTO_1424 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1429 - BLOCK
      ?AUTO_1430 - BLOCK
    )
    :vars
    (
      ?AUTO_1433 - BLOCK
      ?AUTO_1434 - BLOCK
      ?AUTO_1432 - BLOCK
      ?AUTO_1431 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1429 ?AUTO_1430 ) ) ( not ( = ?AUTO_1429 ?AUTO_1433 ) ) ( not ( = ?AUTO_1429 ?AUTO_1434 ) ) ( not ( = ?AUTO_1430 ?AUTO_1433 ) ) ( not ( = ?AUTO_1430 ?AUTO_1434 ) ) ( not ( = ?AUTO_1433 ?AUTO_1434 ) ) ( ON ?AUTO_1433 ?AUTO_1430 ) ( not ( = ?AUTO_1429 ?AUTO_1432 ) ) ( not ( = ?AUTO_1429 ?AUTO_1431 ) ) ( not ( = ?AUTO_1430 ?AUTO_1432 ) ) ( not ( = ?AUTO_1430 ?AUTO_1431 ) ) ( not ( = ?AUTO_1434 ?AUTO_1432 ) ) ( not ( = ?AUTO_1434 ?AUTO_1431 ) ) ( not ( = ?AUTO_1433 ?AUTO_1432 ) ) ( not ( = ?AUTO_1433 ?AUTO_1431 ) ) ( not ( = ?AUTO_1432 ?AUTO_1431 ) ) ( ON ?AUTO_1432 ?AUTO_1433 ) ( CLEAR ?AUTO_1432 ) ( ON ?AUTO_1429 ?AUTO_1434 ) ( CLEAR ?AUTO_1429 ) ( HOLDING ?AUTO_1431 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1431 )
      ( MAKE-ON ?AUTO_1429 ?AUTO_1430 )
      ( MAKE-ON-VERIFY ?AUTO_1429 ?AUTO_1430 ) )
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
      ?AUTO_1525 - BLOCK
      ?AUTO_1526 - BLOCK
      ?AUTO_1527 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1523 ) ( not ( = ?AUTO_1522 ?AUTO_1523 ) ) ( ON ?AUTO_1522 ?AUTO_1524 ) ( not ( = ?AUTO_1522 ?AUTO_1524 ) ) ( not ( = ?AUTO_1523 ?AUTO_1524 ) ) ( not ( = ?AUTO_1522 ?AUTO_1525 ) ) ( not ( = ?AUTO_1523 ?AUTO_1525 ) ) ( not ( = ?AUTO_1524 ?AUTO_1525 ) ) ( ON ?AUTO_1525 ?AUTO_1522 ) ( not ( = ?AUTO_1522 ?AUTO_1526 ) ) ( not ( = ?AUTO_1523 ?AUTO_1526 ) ) ( not ( = ?AUTO_1524 ?AUTO_1526 ) ) ( not ( = ?AUTO_1525 ?AUTO_1526 ) ) ( ON ?AUTO_1526 ?AUTO_1525 ) ( not ( = ?AUTO_1522 ?AUTO_1527 ) ) ( not ( = ?AUTO_1523 ?AUTO_1527 ) ) ( not ( = ?AUTO_1524 ?AUTO_1527 ) ) ( not ( = ?AUTO_1525 ?AUTO_1527 ) ) ( not ( = ?AUTO_1526 ?AUTO_1527 ) ) ( ON ?AUTO_1527 ?AUTO_1526 ) ( CLEAR ?AUTO_1527 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1527 ?AUTO_1526 )
      ( MAKE-ON ?AUTO_1522 ?AUTO_1523 )
      ( MAKE-ON-VERIFY ?AUTO_1522 ?AUTO_1523 ) )
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
      ?AUTO_1533 - BLOCK
      ?AUTO_1532 - BLOCK
      ?AUTO_1534 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1528 ?AUTO_1529 ) ) ( ON ?AUTO_1528 ?AUTO_1530 ) ( not ( = ?AUTO_1528 ?AUTO_1530 ) ) ( not ( = ?AUTO_1529 ?AUTO_1530 ) ) ( not ( = ?AUTO_1528 ?AUTO_1531 ) ) ( not ( = ?AUTO_1529 ?AUTO_1531 ) ) ( not ( = ?AUTO_1530 ?AUTO_1531 ) ) ( ON ?AUTO_1531 ?AUTO_1528 ) ( not ( = ?AUTO_1528 ?AUTO_1533 ) ) ( not ( = ?AUTO_1529 ?AUTO_1533 ) ) ( not ( = ?AUTO_1530 ?AUTO_1533 ) ) ( not ( = ?AUTO_1531 ?AUTO_1533 ) ) ( ON ?AUTO_1533 ?AUTO_1531 ) ( not ( = ?AUTO_1528 ?AUTO_1532 ) ) ( not ( = ?AUTO_1529 ?AUTO_1532 ) ) ( not ( = ?AUTO_1530 ?AUTO_1532 ) ) ( not ( = ?AUTO_1531 ?AUTO_1532 ) ) ( not ( = ?AUTO_1533 ?AUTO_1532 ) ) ( ON ?AUTO_1532 ?AUTO_1533 ) ( CLEAR ?AUTO_1532 ) ( HOLDING ?AUTO_1529 ) ( CLEAR ?AUTO_1534 ) ( not ( = ?AUTO_1528 ?AUTO_1534 ) ) ( not ( = ?AUTO_1529 ?AUTO_1534 ) ) ( not ( = ?AUTO_1530 ?AUTO_1534 ) ) ( not ( = ?AUTO_1531 ?AUTO_1534 ) ) ( not ( = ?AUTO_1533 ?AUTO_1534 ) ) ( not ( = ?AUTO_1532 ?AUTO_1534 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1529 ?AUTO_1534 )
      ( MAKE-ON ?AUTO_1528 ?AUTO_1529 )
      ( MAKE-ON-VERIFY ?AUTO_1528 ?AUTO_1529 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1546 - BLOCK
      ?AUTO_1547 - BLOCK
    )
    :vars
    (
      ?AUTO_1548 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1546 ?AUTO_1547 ) ) ( ON-TABLE ?AUTO_1546 ) ( CLEAR ?AUTO_1548 ) ( not ( = ?AUTO_1546 ?AUTO_1548 ) ) ( not ( = ?AUTO_1547 ?AUTO_1548 ) ) ( ON ?AUTO_1547 ?AUTO_1546 ) ( CLEAR ?AUTO_1547 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1547 ?AUTO_1546 )
      ( MAKE-ON ?AUTO_1546 ?AUTO_1547 )
      ( MAKE-ON-VERIFY ?AUTO_1546 ?AUTO_1547 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1549 - BLOCK
      ?AUTO_1550 - BLOCK
    )
    :vars
    (
      ?AUTO_1551 - BLOCK
      ?AUTO_1552 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1549 ?AUTO_1550 ) ) ( ON-TABLE ?AUTO_1549 ) ( CLEAR ?AUTO_1551 ) ( not ( = ?AUTO_1549 ?AUTO_1551 ) ) ( not ( = ?AUTO_1550 ?AUTO_1551 ) ) ( ON ?AUTO_1550 ?AUTO_1549 ) ( CLEAR ?AUTO_1550 ) ( HOLDING ?AUTO_1552 ) ( not ( = ?AUTO_1549 ?AUTO_1552 ) ) ( not ( = ?AUTO_1550 ?AUTO_1552 ) ) ( not ( = ?AUTO_1551 ?AUTO_1552 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1552 )
      ( MAKE-ON ?AUTO_1549 ?AUTO_1550 )
      ( MAKE-ON-VERIFY ?AUTO_1549 ?AUTO_1550 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1553 - BLOCK
      ?AUTO_1554 - BLOCK
    )
    :vars
    (
      ?AUTO_1555 - BLOCK
      ?AUTO_1556 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1553 ?AUTO_1554 ) ) ( ON-TABLE ?AUTO_1553 ) ( CLEAR ?AUTO_1555 ) ( not ( = ?AUTO_1553 ?AUTO_1555 ) ) ( not ( = ?AUTO_1554 ?AUTO_1555 ) ) ( ON ?AUTO_1554 ?AUTO_1553 ) ( not ( = ?AUTO_1553 ?AUTO_1556 ) ) ( not ( = ?AUTO_1554 ?AUTO_1556 ) ) ( not ( = ?AUTO_1555 ?AUTO_1556 ) ) ( ON ?AUTO_1556 ?AUTO_1554 ) ( CLEAR ?AUTO_1556 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1556 ?AUTO_1554 )
      ( MAKE-ON ?AUTO_1553 ?AUTO_1554 )
      ( MAKE-ON-VERIFY ?AUTO_1553 ?AUTO_1554 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1557 - BLOCK
      ?AUTO_1558 - BLOCK
    )
    :vars
    (
      ?AUTO_1559 - BLOCK
      ?AUTO_1560 - BLOCK
      ?AUTO_1561 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1557 ?AUTO_1558 ) ) ( ON-TABLE ?AUTO_1557 ) ( CLEAR ?AUTO_1559 ) ( not ( = ?AUTO_1557 ?AUTO_1559 ) ) ( not ( = ?AUTO_1558 ?AUTO_1559 ) ) ( ON ?AUTO_1558 ?AUTO_1557 ) ( not ( = ?AUTO_1557 ?AUTO_1560 ) ) ( not ( = ?AUTO_1558 ?AUTO_1560 ) ) ( not ( = ?AUTO_1559 ?AUTO_1560 ) ) ( ON ?AUTO_1560 ?AUTO_1558 ) ( CLEAR ?AUTO_1560 ) ( HOLDING ?AUTO_1561 ) ( not ( = ?AUTO_1557 ?AUTO_1561 ) ) ( not ( = ?AUTO_1558 ?AUTO_1561 ) ) ( not ( = ?AUTO_1559 ?AUTO_1561 ) ) ( not ( = ?AUTO_1560 ?AUTO_1561 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1561 )
      ( MAKE-ON ?AUTO_1557 ?AUTO_1558 )
      ( MAKE-ON-VERIFY ?AUTO_1557 ?AUTO_1558 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1562 - BLOCK
      ?AUTO_1563 - BLOCK
    )
    :vars
    (
      ?AUTO_1564 - BLOCK
      ?AUTO_1565 - BLOCK
      ?AUTO_1566 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1562 ?AUTO_1563 ) ) ( ON-TABLE ?AUTO_1562 ) ( CLEAR ?AUTO_1564 ) ( not ( = ?AUTO_1562 ?AUTO_1564 ) ) ( not ( = ?AUTO_1563 ?AUTO_1564 ) ) ( ON ?AUTO_1563 ?AUTO_1562 ) ( not ( = ?AUTO_1562 ?AUTO_1565 ) ) ( not ( = ?AUTO_1563 ?AUTO_1565 ) ) ( not ( = ?AUTO_1564 ?AUTO_1565 ) ) ( ON ?AUTO_1565 ?AUTO_1563 ) ( not ( = ?AUTO_1562 ?AUTO_1566 ) ) ( not ( = ?AUTO_1563 ?AUTO_1566 ) ) ( not ( = ?AUTO_1564 ?AUTO_1566 ) ) ( not ( = ?AUTO_1565 ?AUTO_1566 ) ) ( ON ?AUTO_1566 ?AUTO_1565 ) ( CLEAR ?AUTO_1566 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1566 ?AUTO_1565 )
      ( MAKE-ON ?AUTO_1562 ?AUTO_1563 )
      ( MAKE-ON-VERIFY ?AUTO_1562 ?AUTO_1563 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1567 - BLOCK
      ?AUTO_1568 - BLOCK
    )
    :vars
    (
      ?AUTO_1570 - BLOCK
      ?AUTO_1569 - BLOCK
      ?AUTO_1571 - BLOCK
      ?AUTO_1572 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1567 ?AUTO_1568 ) ) ( ON-TABLE ?AUTO_1567 ) ( CLEAR ?AUTO_1570 ) ( not ( = ?AUTO_1567 ?AUTO_1570 ) ) ( not ( = ?AUTO_1568 ?AUTO_1570 ) ) ( ON ?AUTO_1568 ?AUTO_1567 ) ( not ( = ?AUTO_1567 ?AUTO_1569 ) ) ( not ( = ?AUTO_1568 ?AUTO_1569 ) ) ( not ( = ?AUTO_1570 ?AUTO_1569 ) ) ( ON ?AUTO_1569 ?AUTO_1568 ) ( not ( = ?AUTO_1567 ?AUTO_1571 ) ) ( not ( = ?AUTO_1568 ?AUTO_1571 ) ) ( not ( = ?AUTO_1570 ?AUTO_1571 ) ) ( not ( = ?AUTO_1569 ?AUTO_1571 ) ) ( ON ?AUTO_1571 ?AUTO_1569 ) ( CLEAR ?AUTO_1571 ) ( HOLDING ?AUTO_1572 ) ( not ( = ?AUTO_1567 ?AUTO_1572 ) ) ( not ( = ?AUTO_1568 ?AUTO_1572 ) ) ( not ( = ?AUTO_1570 ?AUTO_1572 ) ) ( not ( = ?AUTO_1569 ?AUTO_1572 ) ) ( not ( = ?AUTO_1571 ?AUTO_1572 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1572 )
      ( MAKE-ON ?AUTO_1567 ?AUTO_1568 )
      ( MAKE-ON-VERIFY ?AUTO_1567 ?AUTO_1568 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1573 - BLOCK
      ?AUTO_1574 - BLOCK
    )
    :vars
    (
      ?AUTO_1576 - BLOCK
      ?AUTO_1575 - BLOCK
      ?AUTO_1577 - BLOCK
      ?AUTO_1578 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1573 ?AUTO_1574 ) ) ( ON-TABLE ?AUTO_1573 ) ( CLEAR ?AUTO_1576 ) ( not ( = ?AUTO_1573 ?AUTO_1576 ) ) ( not ( = ?AUTO_1574 ?AUTO_1576 ) ) ( ON ?AUTO_1574 ?AUTO_1573 ) ( not ( = ?AUTO_1573 ?AUTO_1575 ) ) ( not ( = ?AUTO_1574 ?AUTO_1575 ) ) ( not ( = ?AUTO_1576 ?AUTO_1575 ) ) ( ON ?AUTO_1575 ?AUTO_1574 ) ( not ( = ?AUTO_1573 ?AUTO_1577 ) ) ( not ( = ?AUTO_1574 ?AUTO_1577 ) ) ( not ( = ?AUTO_1576 ?AUTO_1577 ) ) ( not ( = ?AUTO_1575 ?AUTO_1577 ) ) ( ON ?AUTO_1577 ?AUTO_1575 ) ( not ( = ?AUTO_1573 ?AUTO_1578 ) ) ( not ( = ?AUTO_1574 ?AUTO_1578 ) ) ( not ( = ?AUTO_1576 ?AUTO_1578 ) ) ( not ( = ?AUTO_1575 ?AUTO_1578 ) ) ( not ( = ?AUTO_1577 ?AUTO_1578 ) ) ( ON ?AUTO_1578 ?AUTO_1577 ) ( CLEAR ?AUTO_1578 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1578 ?AUTO_1577 )
      ( MAKE-ON ?AUTO_1573 ?AUTO_1574 )
      ( MAKE-ON-VERIFY ?AUTO_1573 ?AUTO_1574 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1579 - BLOCK
      ?AUTO_1580 - BLOCK
    )
    :vars
    (
      ?AUTO_1584 - BLOCK
      ?AUTO_1581 - BLOCK
      ?AUTO_1582 - BLOCK
      ?AUTO_1583 - BLOCK
      ?AUTO_1585 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1579 ?AUTO_1580 ) ) ( ON-TABLE ?AUTO_1579 ) ( not ( = ?AUTO_1579 ?AUTO_1584 ) ) ( not ( = ?AUTO_1580 ?AUTO_1584 ) ) ( ON ?AUTO_1580 ?AUTO_1579 ) ( not ( = ?AUTO_1579 ?AUTO_1581 ) ) ( not ( = ?AUTO_1580 ?AUTO_1581 ) ) ( not ( = ?AUTO_1584 ?AUTO_1581 ) ) ( ON ?AUTO_1581 ?AUTO_1580 ) ( not ( = ?AUTO_1579 ?AUTO_1582 ) ) ( not ( = ?AUTO_1580 ?AUTO_1582 ) ) ( not ( = ?AUTO_1584 ?AUTO_1582 ) ) ( not ( = ?AUTO_1581 ?AUTO_1582 ) ) ( ON ?AUTO_1582 ?AUTO_1581 ) ( not ( = ?AUTO_1579 ?AUTO_1583 ) ) ( not ( = ?AUTO_1580 ?AUTO_1583 ) ) ( not ( = ?AUTO_1584 ?AUTO_1583 ) ) ( not ( = ?AUTO_1581 ?AUTO_1583 ) ) ( not ( = ?AUTO_1582 ?AUTO_1583 ) ) ( ON ?AUTO_1583 ?AUTO_1582 ) ( CLEAR ?AUTO_1583 ) ( HOLDING ?AUTO_1584 ) ( CLEAR ?AUTO_1585 ) ( not ( = ?AUTO_1579 ?AUTO_1585 ) ) ( not ( = ?AUTO_1580 ?AUTO_1585 ) ) ( not ( = ?AUTO_1584 ?AUTO_1585 ) ) ( not ( = ?AUTO_1581 ?AUTO_1585 ) ) ( not ( = ?AUTO_1582 ?AUTO_1585 ) ) ( not ( = ?AUTO_1583 ?AUTO_1585 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1584 ?AUTO_1585 )
      ( MAKE-ON ?AUTO_1579 ?AUTO_1580 )
      ( MAKE-ON-VERIFY ?AUTO_1579 ?AUTO_1580 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2960 - BLOCK
      ?AUTO_2961 - BLOCK
    )
    :vars
    (
      ?AUTO_2963 - BLOCK
      ?AUTO_2962 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2960 ?AUTO_2961 ) ) ( ON-TABLE ?AUTO_2960 ) ( CLEAR ?AUTO_2960 ) ( not ( = ?AUTO_2960 ?AUTO_2963 ) ) ( not ( = ?AUTO_2960 ?AUTO_2962 ) ) ( not ( = ?AUTO_2961 ?AUTO_2963 ) ) ( not ( = ?AUTO_2961 ?AUTO_2962 ) ) ( not ( = ?AUTO_2963 ?AUTO_2962 ) ) ( ON ?AUTO_2963 ?AUTO_2961 ) ( CLEAR ?AUTO_2963 ) ( HOLDING ?AUTO_2962 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2962 )
      ( MAKE-ON ?AUTO_2960 ?AUTO_2961 )
      ( MAKE-ON-VERIFY ?AUTO_2960 ?AUTO_2961 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3492 - BLOCK
      ?AUTO_3493 - BLOCK
    )
    :vars
    (
      ?AUTO_3495 - BLOCK
      ?AUTO_3494 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3492 ?AUTO_3493 ) ) ( not ( = ?AUTO_3492 ?AUTO_3495 ) ) ( not ( = ?AUTO_3493 ?AUTO_3495 ) ) ( ON ?AUTO_3495 ?AUTO_3493 ) ( not ( = ?AUTO_3492 ?AUTO_3494 ) ) ( not ( = ?AUTO_3493 ?AUTO_3494 ) ) ( not ( = ?AUTO_3495 ?AUTO_3494 ) ) ( ON ?AUTO_3494 ?AUTO_3495 ) ( ON ?AUTO_3492 ?AUTO_3494 ) ( CLEAR ?AUTO_3492 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3492 ?AUTO_3494 )
      ( MAKE-ON ?AUTO_3492 ?AUTO_3493 )
      ( MAKE-ON-VERIFY ?AUTO_3492 ?AUTO_3493 ) )
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
      ?AUTO_1630 - BLOCK
      ?AUTO_1631 - BLOCK
      ?AUTO_1632 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1627 ?AUTO_1628 ) ) ( CLEAR ?AUTO_1629 ) ( not ( = ?AUTO_1627 ?AUTO_1630 ) ) ( not ( = ?AUTO_1627 ?AUTO_1629 ) ) ( not ( = ?AUTO_1628 ?AUTO_1630 ) ) ( not ( = ?AUTO_1628 ?AUTO_1629 ) ) ( not ( = ?AUTO_1630 ?AUTO_1629 ) ) ( ON ?AUTO_1630 ?AUTO_1628 ) ( not ( = ?AUTO_1627 ?AUTO_1631 ) ) ( not ( = ?AUTO_1628 ?AUTO_1631 ) ) ( not ( = ?AUTO_1629 ?AUTO_1631 ) ) ( not ( = ?AUTO_1630 ?AUTO_1631 ) ) ( ON ?AUTO_1631 ?AUTO_1630 ) ( ON ?AUTO_1627 ?AUTO_1631 ) ( CLEAR ?AUTO_1627 ) ( HOLDING ?AUTO_1632 ) ( not ( = ?AUTO_1627 ?AUTO_1632 ) ) ( not ( = ?AUTO_1628 ?AUTO_1632 ) ) ( not ( = ?AUTO_1629 ?AUTO_1632 ) ) ( not ( = ?AUTO_1630 ?AUTO_1632 ) ) ( not ( = ?AUTO_1631 ?AUTO_1632 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1632 )
      ( MAKE-ON ?AUTO_1627 ?AUTO_1628 )
      ( MAKE-ON-VERIFY ?AUTO_1627 ?AUTO_1628 ) )
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
      ?AUTO_1637 - BLOCK
      ?AUTO_1638 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1633 ?AUTO_1634 ) ) ( CLEAR ?AUTO_1635 ) ( not ( = ?AUTO_1633 ?AUTO_1636 ) ) ( not ( = ?AUTO_1633 ?AUTO_1635 ) ) ( not ( = ?AUTO_1634 ?AUTO_1636 ) ) ( not ( = ?AUTO_1634 ?AUTO_1635 ) ) ( not ( = ?AUTO_1636 ?AUTO_1635 ) ) ( ON ?AUTO_1636 ?AUTO_1634 ) ( not ( = ?AUTO_1633 ?AUTO_1637 ) ) ( not ( = ?AUTO_1634 ?AUTO_1637 ) ) ( not ( = ?AUTO_1635 ?AUTO_1637 ) ) ( not ( = ?AUTO_1636 ?AUTO_1637 ) ) ( ON ?AUTO_1637 ?AUTO_1636 ) ( ON ?AUTO_1633 ?AUTO_1637 ) ( not ( = ?AUTO_1633 ?AUTO_1638 ) ) ( not ( = ?AUTO_1634 ?AUTO_1638 ) ) ( not ( = ?AUTO_1635 ?AUTO_1638 ) ) ( not ( = ?AUTO_1636 ?AUTO_1638 ) ) ( not ( = ?AUTO_1637 ?AUTO_1638 ) ) ( ON ?AUTO_1638 ?AUTO_1633 ) ( CLEAR ?AUTO_1638 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1638 ?AUTO_1633 )
      ( MAKE-ON ?AUTO_1633 ?AUTO_1634 )
      ( MAKE-ON-VERIFY ?AUTO_1633 ?AUTO_1634 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1639 - BLOCK
      ?AUTO_1640 - BLOCK
    )
    :vars
    (
      ?AUTO_1642 - BLOCK
      ?AUTO_1641 - BLOCK
      ?AUTO_1643 - BLOCK
      ?AUTO_1644 - BLOCK
      ?AUTO_1645 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1639 ?AUTO_1640 ) ) ( not ( = ?AUTO_1639 ?AUTO_1642 ) ) ( not ( = ?AUTO_1639 ?AUTO_1641 ) ) ( not ( = ?AUTO_1640 ?AUTO_1642 ) ) ( not ( = ?AUTO_1640 ?AUTO_1641 ) ) ( not ( = ?AUTO_1642 ?AUTO_1641 ) ) ( ON ?AUTO_1642 ?AUTO_1640 ) ( not ( = ?AUTO_1639 ?AUTO_1643 ) ) ( not ( = ?AUTO_1640 ?AUTO_1643 ) ) ( not ( = ?AUTO_1641 ?AUTO_1643 ) ) ( not ( = ?AUTO_1642 ?AUTO_1643 ) ) ( ON ?AUTO_1643 ?AUTO_1642 ) ( ON ?AUTO_1639 ?AUTO_1643 ) ( not ( = ?AUTO_1639 ?AUTO_1644 ) ) ( not ( = ?AUTO_1640 ?AUTO_1644 ) ) ( not ( = ?AUTO_1641 ?AUTO_1644 ) ) ( not ( = ?AUTO_1642 ?AUTO_1644 ) ) ( not ( = ?AUTO_1643 ?AUTO_1644 ) ) ( ON ?AUTO_1644 ?AUTO_1639 ) ( CLEAR ?AUTO_1644 ) ( HOLDING ?AUTO_1641 ) ( CLEAR ?AUTO_1645 ) ( not ( = ?AUTO_1639 ?AUTO_1645 ) ) ( not ( = ?AUTO_1640 ?AUTO_1645 ) ) ( not ( = ?AUTO_1642 ?AUTO_1645 ) ) ( not ( = ?AUTO_1641 ?AUTO_1645 ) ) ( not ( = ?AUTO_1643 ?AUTO_1645 ) ) ( not ( = ?AUTO_1644 ?AUTO_1645 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1641 ?AUTO_1645 )
      ( MAKE-ON ?AUTO_1639 ?AUTO_1640 )
      ( MAKE-ON-VERIFY ?AUTO_1639 ?AUTO_1640 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2964 - BLOCK
      ?AUTO_2965 - BLOCK
    )
    :vars
    (
      ?AUTO_2967 - BLOCK
      ?AUTO_2966 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2964 ?AUTO_2965 ) ) ( ON-TABLE ?AUTO_2964 ) ( not ( = ?AUTO_2964 ?AUTO_2967 ) ) ( not ( = ?AUTO_2964 ?AUTO_2966 ) ) ( not ( = ?AUTO_2965 ?AUTO_2967 ) ) ( not ( = ?AUTO_2965 ?AUTO_2966 ) ) ( not ( = ?AUTO_2967 ?AUTO_2966 ) ) ( ON ?AUTO_2967 ?AUTO_2965 ) ( CLEAR ?AUTO_2967 ) ( ON ?AUTO_2966 ?AUTO_2964 ) ( CLEAR ?AUTO_2966 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2966 ?AUTO_2964 )
      ( MAKE-ON ?AUTO_2964 ?AUTO_2965 )
      ( MAKE-ON-VERIFY ?AUTO_2964 ?AUTO_2965 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3030 - BLOCK
      ?AUTO_3031 - BLOCK
    )
    :vars
    (
      ?AUTO_3033 - BLOCK
      ?AUTO_3032 - BLOCK
      ?AUTO_3034 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3030 ?AUTO_3031 ) ) ( ON-TABLE ?AUTO_3030 ) ( not ( = ?AUTO_3030 ?AUTO_3033 ) ) ( not ( = ?AUTO_3030 ?AUTO_3032 ) ) ( not ( = ?AUTO_3031 ?AUTO_3033 ) ) ( not ( = ?AUTO_3031 ?AUTO_3032 ) ) ( not ( = ?AUTO_3033 ?AUTO_3032 ) ) ( ON ?AUTO_3033 ?AUTO_3030 ) ( CLEAR ?AUTO_3033 ) ( not ( = ?AUTO_3030 ?AUTO_3034 ) ) ( not ( = ?AUTO_3031 ?AUTO_3034 ) ) ( not ( = ?AUTO_3033 ?AUTO_3034 ) ) ( not ( = ?AUTO_3032 ?AUTO_3034 ) ) ( ON ?AUTO_3032 ?AUTO_3031 ) ( CLEAR ?AUTO_3032 ) ( HOLDING ?AUTO_3034 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3034 )
      ( MAKE-ON ?AUTO_3030 ?AUTO_3031 )
      ( MAKE-ON-VERIFY ?AUTO_3030 ?AUTO_3031 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1707 - BLOCK
      ?AUTO_1708 - BLOCK
    )
    :vars
    (
      ?AUTO_1710 - BLOCK
      ?AUTO_1711 - BLOCK
      ?AUTO_1709 - BLOCK
      ?AUTO_1712 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1707 ?AUTO_1708 ) ) ( ON-TABLE ?AUTO_1707 ) ( CLEAR ?AUTO_1710 ) ( not ( = ?AUTO_1707 ?AUTO_1711 ) ) ( not ( = ?AUTO_1707 ?AUTO_1710 ) ) ( not ( = ?AUTO_1708 ?AUTO_1711 ) ) ( not ( = ?AUTO_1708 ?AUTO_1710 ) ) ( not ( = ?AUTO_1711 ?AUTO_1710 ) ) ( ON ?AUTO_1711 ?AUTO_1708 ) ( CLEAR ?AUTO_1711 ) ( not ( = ?AUTO_1707 ?AUTO_1709 ) ) ( not ( = ?AUTO_1708 ?AUTO_1709 ) ) ( not ( = ?AUTO_1710 ?AUTO_1709 ) ) ( not ( = ?AUTO_1711 ?AUTO_1709 ) ) ( ON ?AUTO_1709 ?AUTO_1707 ) ( not ( = ?AUTO_1707 ?AUTO_1712 ) ) ( not ( = ?AUTO_1708 ?AUTO_1712 ) ) ( not ( = ?AUTO_1710 ?AUTO_1712 ) ) ( not ( = ?AUTO_1711 ?AUTO_1712 ) ) ( not ( = ?AUTO_1709 ?AUTO_1712 ) ) ( ON ?AUTO_1712 ?AUTO_1709 ) ( CLEAR ?AUTO_1712 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1712 ?AUTO_1709 )
      ( MAKE-ON ?AUTO_1707 ?AUTO_1708 )
      ( MAKE-ON-VERIFY ?AUTO_1707 ?AUTO_1708 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1835 - BLOCK
      ?AUTO_1836 - BLOCK
    )
    :vars
    (
      ?AUTO_1837 - BLOCK
      ?AUTO_1839 - BLOCK
      ?AUTO_1841 - BLOCK
      ?AUTO_1840 - BLOCK
      ?AUTO_1838 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1835 ?AUTO_1836 ) ) ( ON ?AUTO_1835 ?AUTO_1837 ) ( not ( = ?AUTO_1835 ?AUTO_1837 ) ) ( not ( = ?AUTO_1836 ?AUTO_1837 ) ) ( CLEAR ?AUTO_1839 ) ( not ( = ?AUTO_1835 ?AUTO_1841 ) ) ( not ( = ?AUTO_1835 ?AUTO_1839 ) ) ( not ( = ?AUTO_1836 ?AUTO_1841 ) ) ( not ( = ?AUTO_1836 ?AUTO_1839 ) ) ( not ( = ?AUTO_1837 ?AUTO_1841 ) ) ( not ( = ?AUTO_1837 ?AUTO_1839 ) ) ( not ( = ?AUTO_1841 ?AUTO_1839 ) ) ( ON ?AUTO_1841 ?AUTO_1836 ) ( not ( = ?AUTO_1835 ?AUTO_1840 ) ) ( not ( = ?AUTO_1836 ?AUTO_1840 ) ) ( not ( = ?AUTO_1837 ?AUTO_1840 ) ) ( not ( = ?AUTO_1839 ?AUTO_1840 ) ) ( not ( = ?AUTO_1841 ?AUTO_1840 ) ) ( ON ?AUTO_1840 ?AUTO_1841 ) ( CLEAR ?AUTO_1840 ) ( not ( = ?AUTO_1835 ?AUTO_1838 ) ) ( not ( = ?AUTO_1836 ?AUTO_1838 ) ) ( not ( = ?AUTO_1837 ?AUTO_1838 ) ) ( not ( = ?AUTO_1839 ?AUTO_1838 ) ) ( not ( = ?AUTO_1841 ?AUTO_1838 ) ) ( not ( = ?AUTO_1840 ?AUTO_1838 ) ) ( ON ?AUTO_1838 ?AUTO_1835 ) ( CLEAR ?AUTO_1838 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1838 ?AUTO_1835 )
      ( MAKE-ON ?AUTO_1835 ?AUTO_1836 )
      ( MAKE-ON-VERIFY ?AUTO_1835 ?AUTO_1836 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1842 - BLOCK
      ?AUTO_1843 - BLOCK
    )
    :vars
    (
      ?AUTO_1847 - BLOCK
      ?AUTO_1844 - BLOCK
      ?AUTO_1846 - BLOCK
      ?AUTO_1845 - BLOCK
      ?AUTO_1848 - BLOCK
      ?AUTO_1849 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1842 ?AUTO_1843 ) ) ( ON ?AUTO_1842 ?AUTO_1847 ) ( not ( = ?AUTO_1842 ?AUTO_1847 ) ) ( not ( = ?AUTO_1843 ?AUTO_1847 ) ) ( CLEAR ?AUTO_1844 ) ( not ( = ?AUTO_1842 ?AUTO_1846 ) ) ( not ( = ?AUTO_1842 ?AUTO_1844 ) ) ( not ( = ?AUTO_1843 ?AUTO_1846 ) ) ( not ( = ?AUTO_1843 ?AUTO_1844 ) ) ( not ( = ?AUTO_1847 ?AUTO_1846 ) ) ( not ( = ?AUTO_1847 ?AUTO_1844 ) ) ( not ( = ?AUTO_1846 ?AUTO_1844 ) ) ( ON ?AUTO_1846 ?AUTO_1843 ) ( not ( = ?AUTO_1842 ?AUTO_1845 ) ) ( not ( = ?AUTO_1843 ?AUTO_1845 ) ) ( not ( = ?AUTO_1847 ?AUTO_1845 ) ) ( not ( = ?AUTO_1844 ?AUTO_1845 ) ) ( not ( = ?AUTO_1846 ?AUTO_1845 ) ) ( ON ?AUTO_1845 ?AUTO_1846 ) ( CLEAR ?AUTO_1845 ) ( not ( = ?AUTO_1842 ?AUTO_1848 ) ) ( not ( = ?AUTO_1843 ?AUTO_1848 ) ) ( not ( = ?AUTO_1847 ?AUTO_1848 ) ) ( not ( = ?AUTO_1844 ?AUTO_1848 ) ) ( not ( = ?AUTO_1846 ?AUTO_1848 ) ) ( not ( = ?AUTO_1845 ?AUTO_1848 ) ) ( ON ?AUTO_1848 ?AUTO_1842 ) ( CLEAR ?AUTO_1848 ) ( HOLDING ?AUTO_1849 ) ( not ( = ?AUTO_1842 ?AUTO_1849 ) ) ( not ( = ?AUTO_1843 ?AUTO_1849 ) ) ( not ( = ?AUTO_1847 ?AUTO_1849 ) ) ( not ( = ?AUTO_1844 ?AUTO_1849 ) ) ( not ( = ?AUTO_1846 ?AUTO_1849 ) ) ( not ( = ?AUTO_1845 ?AUTO_1849 ) ) ( not ( = ?AUTO_1848 ?AUTO_1849 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1849 )
      ( MAKE-ON ?AUTO_1842 ?AUTO_1843 )
      ( MAKE-ON-VERIFY ?AUTO_1842 ?AUTO_1843 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1850 - BLOCK
      ?AUTO_1851 - BLOCK
    )
    :vars
    (
      ?AUTO_1853 - BLOCK
      ?AUTO_1855 - BLOCK
      ?AUTO_1854 - BLOCK
      ?AUTO_1856 - BLOCK
      ?AUTO_1852 - BLOCK
      ?AUTO_1857 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1850 ?AUTO_1851 ) ) ( ON ?AUTO_1850 ?AUTO_1853 ) ( not ( = ?AUTO_1850 ?AUTO_1853 ) ) ( not ( = ?AUTO_1851 ?AUTO_1853 ) ) ( CLEAR ?AUTO_1855 ) ( not ( = ?AUTO_1850 ?AUTO_1854 ) ) ( not ( = ?AUTO_1850 ?AUTO_1855 ) ) ( not ( = ?AUTO_1851 ?AUTO_1854 ) ) ( not ( = ?AUTO_1851 ?AUTO_1855 ) ) ( not ( = ?AUTO_1853 ?AUTO_1854 ) ) ( not ( = ?AUTO_1853 ?AUTO_1855 ) ) ( not ( = ?AUTO_1854 ?AUTO_1855 ) ) ( ON ?AUTO_1854 ?AUTO_1851 ) ( not ( = ?AUTO_1850 ?AUTO_1856 ) ) ( not ( = ?AUTO_1851 ?AUTO_1856 ) ) ( not ( = ?AUTO_1853 ?AUTO_1856 ) ) ( not ( = ?AUTO_1855 ?AUTO_1856 ) ) ( not ( = ?AUTO_1854 ?AUTO_1856 ) ) ( ON ?AUTO_1856 ?AUTO_1854 ) ( CLEAR ?AUTO_1856 ) ( not ( = ?AUTO_1850 ?AUTO_1852 ) ) ( not ( = ?AUTO_1851 ?AUTO_1852 ) ) ( not ( = ?AUTO_1853 ?AUTO_1852 ) ) ( not ( = ?AUTO_1855 ?AUTO_1852 ) ) ( not ( = ?AUTO_1854 ?AUTO_1852 ) ) ( not ( = ?AUTO_1856 ?AUTO_1852 ) ) ( ON ?AUTO_1852 ?AUTO_1850 ) ( not ( = ?AUTO_1850 ?AUTO_1857 ) ) ( not ( = ?AUTO_1851 ?AUTO_1857 ) ) ( not ( = ?AUTO_1853 ?AUTO_1857 ) ) ( not ( = ?AUTO_1855 ?AUTO_1857 ) ) ( not ( = ?AUTO_1854 ?AUTO_1857 ) ) ( not ( = ?AUTO_1856 ?AUTO_1857 ) ) ( not ( = ?AUTO_1852 ?AUTO_1857 ) ) ( ON ?AUTO_1857 ?AUTO_1852 ) ( CLEAR ?AUTO_1857 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1857 ?AUTO_1852 )
      ( MAKE-ON ?AUTO_1850 ?AUTO_1851 )
      ( MAKE-ON-VERIFY ?AUTO_1850 ?AUTO_1851 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1885 - BLOCK
      ?AUTO_1886 - BLOCK
    )
    :vars
    (
      ?AUTO_1887 - BLOCK
      ?AUTO_1888 - BLOCK
      ?AUTO_1889 - BLOCK
      ?AUTO_1890 - BLOCK
      ?AUTO_1891 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1885 ?AUTO_1886 ) ) ( ON ?AUTO_1885 ?AUTO_1887 ) ( not ( = ?AUTO_1885 ?AUTO_1887 ) ) ( not ( = ?AUTO_1886 ?AUTO_1887 ) ) ( not ( = ?AUTO_1885 ?AUTO_1888 ) ) ( not ( = ?AUTO_1885 ?AUTO_1889 ) ) ( not ( = ?AUTO_1886 ?AUTO_1888 ) ) ( not ( = ?AUTO_1886 ?AUTO_1889 ) ) ( not ( = ?AUTO_1887 ?AUTO_1888 ) ) ( not ( = ?AUTO_1887 ?AUTO_1889 ) ) ( not ( = ?AUTO_1888 ?AUTO_1889 ) ) ( ON ?AUTO_1888 ?AUTO_1886 ) ( CLEAR ?AUTO_1888 ) ( ON ?AUTO_1889 ?AUTO_1885 ) ( CLEAR ?AUTO_1889 ) ( HOLDING ?AUTO_1890 ) ( CLEAR ?AUTO_1891 ) ( not ( = ?AUTO_1885 ?AUTO_1890 ) ) ( not ( = ?AUTO_1885 ?AUTO_1891 ) ) ( not ( = ?AUTO_1886 ?AUTO_1890 ) ) ( not ( = ?AUTO_1886 ?AUTO_1891 ) ) ( not ( = ?AUTO_1887 ?AUTO_1890 ) ) ( not ( = ?AUTO_1887 ?AUTO_1891 ) ) ( not ( = ?AUTO_1888 ?AUTO_1890 ) ) ( not ( = ?AUTO_1888 ?AUTO_1891 ) ) ( not ( = ?AUTO_1889 ?AUTO_1890 ) ) ( not ( = ?AUTO_1889 ?AUTO_1891 ) ) ( not ( = ?AUTO_1890 ?AUTO_1891 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1890 ?AUTO_1891 )
      ( MAKE-ON ?AUTO_1885 ?AUTO_1886 )
      ( MAKE-ON-VERIFY ?AUTO_1885 ?AUTO_1886 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3368 - BLOCK
      ?AUTO_3369 - BLOCK
    )
    :vars
    (
      ?AUTO_3372 - BLOCK
      ?AUTO_3371 - BLOCK
      ?AUTO_3370 - BLOCK
      ?AUTO_3373 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3368 ?AUTO_3369 ) ) ( ON ?AUTO_3368 ?AUTO_3372 ) ( not ( = ?AUTO_3368 ?AUTO_3372 ) ) ( not ( = ?AUTO_3369 ?AUTO_3372 ) ) ( not ( = ?AUTO_3368 ?AUTO_3371 ) ) ( not ( = ?AUTO_3369 ?AUTO_3371 ) ) ( not ( = ?AUTO_3372 ?AUTO_3371 ) ) ( ON ?AUTO_3371 ?AUTO_3368 ) ( not ( = ?AUTO_3368 ?AUTO_3370 ) ) ( not ( = ?AUTO_3368 ?AUTO_3373 ) ) ( not ( = ?AUTO_3369 ?AUTO_3370 ) ) ( not ( = ?AUTO_3369 ?AUTO_3373 ) ) ( not ( = ?AUTO_3372 ?AUTO_3370 ) ) ( not ( = ?AUTO_3372 ?AUTO_3373 ) ) ( not ( = ?AUTO_3371 ?AUTO_3370 ) ) ( not ( = ?AUTO_3371 ?AUTO_3373 ) ) ( not ( = ?AUTO_3370 ?AUTO_3373 ) ) ( ON ?AUTO_3370 ?AUTO_3369 ) ( CLEAR ?AUTO_3370 ) ( ON ?AUTO_3373 ?AUTO_3371 ) ( CLEAR ?AUTO_3373 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3373 ?AUTO_3371 )
      ( MAKE-ON ?AUTO_3368 ?AUTO_3369 )
      ( MAKE-ON-VERIFY ?AUTO_3368 ?AUTO_3369 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1915 - BLOCK
      ?AUTO_1916 - BLOCK
    )
    :vars
    (
      ?AUTO_1917 - BLOCK
      ?AUTO_1918 - BLOCK
      ?AUTO_1920 - BLOCK
      ?AUTO_1921 - BLOCK
      ?AUTO_1922 - BLOCK
      ?AUTO_1919 - BLOCK
      ?AUTO_1923 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1915 ?AUTO_1916 ) ) ( ON ?AUTO_1915 ?AUTO_1917 ) ( not ( = ?AUTO_1915 ?AUTO_1917 ) ) ( not ( = ?AUTO_1916 ?AUTO_1917 ) ) ( not ( = ?AUTO_1915 ?AUTO_1918 ) ) ( not ( = ?AUTO_1915 ?AUTO_1920 ) ) ( not ( = ?AUTO_1916 ?AUTO_1918 ) ) ( not ( = ?AUTO_1916 ?AUTO_1920 ) ) ( not ( = ?AUTO_1917 ?AUTO_1918 ) ) ( not ( = ?AUTO_1917 ?AUTO_1920 ) ) ( not ( = ?AUTO_1918 ?AUTO_1920 ) ) ( ON ?AUTO_1918 ?AUTO_1916 ) ( CLEAR ?AUTO_1918 ) ( ON ?AUTO_1920 ?AUTO_1915 ) ( CLEAR ?AUTO_1921 ) ( not ( = ?AUTO_1915 ?AUTO_1922 ) ) ( not ( = ?AUTO_1915 ?AUTO_1921 ) ) ( not ( = ?AUTO_1916 ?AUTO_1922 ) ) ( not ( = ?AUTO_1916 ?AUTO_1921 ) ) ( not ( = ?AUTO_1917 ?AUTO_1922 ) ) ( not ( = ?AUTO_1917 ?AUTO_1921 ) ) ( not ( = ?AUTO_1918 ?AUTO_1922 ) ) ( not ( = ?AUTO_1918 ?AUTO_1921 ) ) ( not ( = ?AUTO_1920 ?AUTO_1922 ) ) ( not ( = ?AUTO_1920 ?AUTO_1921 ) ) ( not ( = ?AUTO_1922 ?AUTO_1921 ) ) ( ON ?AUTO_1922 ?AUTO_1920 ) ( not ( = ?AUTO_1915 ?AUTO_1919 ) ) ( not ( = ?AUTO_1916 ?AUTO_1919 ) ) ( not ( = ?AUTO_1917 ?AUTO_1919 ) ) ( not ( = ?AUTO_1918 ?AUTO_1919 ) ) ( not ( = ?AUTO_1920 ?AUTO_1919 ) ) ( not ( = ?AUTO_1921 ?AUTO_1919 ) ) ( not ( = ?AUTO_1922 ?AUTO_1919 ) ) ( ON ?AUTO_1919 ?AUTO_1922 ) ( CLEAR ?AUTO_1919 ) ( HOLDING ?AUTO_1923 ) ( not ( = ?AUTO_1915 ?AUTO_1923 ) ) ( not ( = ?AUTO_1916 ?AUTO_1923 ) ) ( not ( = ?AUTO_1917 ?AUTO_1923 ) ) ( not ( = ?AUTO_1918 ?AUTO_1923 ) ) ( not ( = ?AUTO_1920 ?AUTO_1923 ) ) ( not ( = ?AUTO_1921 ?AUTO_1923 ) ) ( not ( = ?AUTO_1922 ?AUTO_1923 ) ) ( not ( = ?AUTO_1919 ?AUTO_1923 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1923 )
      ( MAKE-ON ?AUTO_1915 ?AUTO_1916 )
      ( MAKE-ON-VERIFY ?AUTO_1915 ?AUTO_1916 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1924 - BLOCK
      ?AUTO_1925 - BLOCK
    )
    :vars
    (
      ?AUTO_1930 - BLOCK
      ?AUTO_1926 - BLOCK
      ?AUTO_1929 - BLOCK
      ?AUTO_1928 - BLOCK
      ?AUTO_1931 - BLOCK
      ?AUTO_1927 - BLOCK
      ?AUTO_1932 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1924 ?AUTO_1925 ) ) ( ON ?AUTO_1924 ?AUTO_1930 ) ( not ( = ?AUTO_1924 ?AUTO_1930 ) ) ( not ( = ?AUTO_1925 ?AUTO_1930 ) ) ( not ( = ?AUTO_1924 ?AUTO_1926 ) ) ( not ( = ?AUTO_1924 ?AUTO_1929 ) ) ( not ( = ?AUTO_1925 ?AUTO_1926 ) ) ( not ( = ?AUTO_1925 ?AUTO_1929 ) ) ( not ( = ?AUTO_1930 ?AUTO_1926 ) ) ( not ( = ?AUTO_1930 ?AUTO_1929 ) ) ( not ( = ?AUTO_1926 ?AUTO_1929 ) ) ( ON ?AUTO_1926 ?AUTO_1925 ) ( ON ?AUTO_1929 ?AUTO_1924 ) ( CLEAR ?AUTO_1928 ) ( not ( = ?AUTO_1924 ?AUTO_1931 ) ) ( not ( = ?AUTO_1924 ?AUTO_1928 ) ) ( not ( = ?AUTO_1925 ?AUTO_1931 ) ) ( not ( = ?AUTO_1925 ?AUTO_1928 ) ) ( not ( = ?AUTO_1930 ?AUTO_1931 ) ) ( not ( = ?AUTO_1930 ?AUTO_1928 ) ) ( not ( = ?AUTO_1926 ?AUTO_1931 ) ) ( not ( = ?AUTO_1926 ?AUTO_1928 ) ) ( not ( = ?AUTO_1929 ?AUTO_1931 ) ) ( not ( = ?AUTO_1929 ?AUTO_1928 ) ) ( not ( = ?AUTO_1931 ?AUTO_1928 ) ) ( ON ?AUTO_1931 ?AUTO_1929 ) ( not ( = ?AUTO_1924 ?AUTO_1927 ) ) ( not ( = ?AUTO_1925 ?AUTO_1927 ) ) ( not ( = ?AUTO_1930 ?AUTO_1927 ) ) ( not ( = ?AUTO_1926 ?AUTO_1927 ) ) ( not ( = ?AUTO_1929 ?AUTO_1927 ) ) ( not ( = ?AUTO_1928 ?AUTO_1927 ) ) ( not ( = ?AUTO_1931 ?AUTO_1927 ) ) ( ON ?AUTO_1927 ?AUTO_1931 ) ( CLEAR ?AUTO_1927 ) ( not ( = ?AUTO_1924 ?AUTO_1932 ) ) ( not ( = ?AUTO_1925 ?AUTO_1932 ) ) ( not ( = ?AUTO_1930 ?AUTO_1932 ) ) ( not ( = ?AUTO_1926 ?AUTO_1932 ) ) ( not ( = ?AUTO_1929 ?AUTO_1932 ) ) ( not ( = ?AUTO_1928 ?AUTO_1932 ) ) ( not ( = ?AUTO_1931 ?AUTO_1932 ) ) ( not ( = ?AUTO_1927 ?AUTO_1932 ) ) ( ON ?AUTO_1932 ?AUTO_1926 ) ( CLEAR ?AUTO_1932 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1932 ?AUTO_1926 )
      ( MAKE-ON ?AUTO_1924 ?AUTO_1925 )
      ( MAKE-ON-VERIFY ?AUTO_1924 ?AUTO_1925 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1933 - BLOCK
      ?AUTO_1934 - BLOCK
    )
    :vars
    (
      ?AUTO_1941 - BLOCK
      ?AUTO_1937 - BLOCK
      ?AUTO_1936 - BLOCK
      ?AUTO_1940 - BLOCK
      ?AUTO_1938 - BLOCK
      ?AUTO_1935 - BLOCK
      ?AUTO_1939 - BLOCK
      ?AUTO_1942 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1933 ?AUTO_1934 ) ) ( ON ?AUTO_1933 ?AUTO_1941 ) ( not ( = ?AUTO_1933 ?AUTO_1941 ) ) ( not ( = ?AUTO_1934 ?AUTO_1941 ) ) ( not ( = ?AUTO_1933 ?AUTO_1937 ) ) ( not ( = ?AUTO_1933 ?AUTO_1936 ) ) ( not ( = ?AUTO_1934 ?AUTO_1937 ) ) ( not ( = ?AUTO_1934 ?AUTO_1936 ) ) ( not ( = ?AUTO_1941 ?AUTO_1937 ) ) ( not ( = ?AUTO_1941 ?AUTO_1936 ) ) ( not ( = ?AUTO_1937 ?AUTO_1936 ) ) ( ON ?AUTO_1937 ?AUTO_1934 ) ( ON ?AUTO_1936 ?AUTO_1933 ) ( CLEAR ?AUTO_1940 ) ( not ( = ?AUTO_1933 ?AUTO_1938 ) ) ( not ( = ?AUTO_1933 ?AUTO_1940 ) ) ( not ( = ?AUTO_1934 ?AUTO_1938 ) ) ( not ( = ?AUTO_1934 ?AUTO_1940 ) ) ( not ( = ?AUTO_1941 ?AUTO_1938 ) ) ( not ( = ?AUTO_1941 ?AUTO_1940 ) ) ( not ( = ?AUTO_1937 ?AUTO_1938 ) ) ( not ( = ?AUTO_1937 ?AUTO_1940 ) ) ( not ( = ?AUTO_1936 ?AUTO_1938 ) ) ( not ( = ?AUTO_1936 ?AUTO_1940 ) ) ( not ( = ?AUTO_1938 ?AUTO_1940 ) ) ( ON ?AUTO_1938 ?AUTO_1936 ) ( not ( = ?AUTO_1933 ?AUTO_1935 ) ) ( not ( = ?AUTO_1934 ?AUTO_1935 ) ) ( not ( = ?AUTO_1941 ?AUTO_1935 ) ) ( not ( = ?AUTO_1937 ?AUTO_1935 ) ) ( not ( = ?AUTO_1936 ?AUTO_1935 ) ) ( not ( = ?AUTO_1940 ?AUTO_1935 ) ) ( not ( = ?AUTO_1938 ?AUTO_1935 ) ) ( ON ?AUTO_1935 ?AUTO_1938 ) ( CLEAR ?AUTO_1935 ) ( not ( = ?AUTO_1933 ?AUTO_1939 ) ) ( not ( = ?AUTO_1934 ?AUTO_1939 ) ) ( not ( = ?AUTO_1941 ?AUTO_1939 ) ) ( not ( = ?AUTO_1937 ?AUTO_1939 ) ) ( not ( = ?AUTO_1936 ?AUTO_1939 ) ) ( not ( = ?AUTO_1940 ?AUTO_1939 ) ) ( not ( = ?AUTO_1938 ?AUTO_1939 ) ) ( not ( = ?AUTO_1935 ?AUTO_1939 ) ) ( ON ?AUTO_1939 ?AUTO_1937 ) ( CLEAR ?AUTO_1939 ) ( HOLDING ?AUTO_1942 ) ( not ( = ?AUTO_1933 ?AUTO_1942 ) ) ( not ( = ?AUTO_1934 ?AUTO_1942 ) ) ( not ( = ?AUTO_1941 ?AUTO_1942 ) ) ( not ( = ?AUTO_1937 ?AUTO_1942 ) ) ( not ( = ?AUTO_1936 ?AUTO_1942 ) ) ( not ( = ?AUTO_1940 ?AUTO_1942 ) ) ( not ( = ?AUTO_1938 ?AUTO_1942 ) ) ( not ( = ?AUTO_1935 ?AUTO_1942 ) ) ( not ( = ?AUTO_1939 ?AUTO_1942 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1942 )
      ( MAKE-ON ?AUTO_1933 ?AUTO_1934 )
      ( MAKE-ON-VERIFY ?AUTO_1933 ?AUTO_1934 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1943 - BLOCK
      ?AUTO_1944 - BLOCK
    )
    :vars
    (
      ?AUTO_1951 - BLOCK
      ?AUTO_1947 - BLOCK
      ?AUTO_1950 - BLOCK
      ?AUTO_1945 - BLOCK
      ?AUTO_1948 - BLOCK
      ?AUTO_1946 - BLOCK
      ?AUTO_1949 - BLOCK
      ?AUTO_1952 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1943 ?AUTO_1944 ) ) ( ON ?AUTO_1943 ?AUTO_1951 ) ( not ( = ?AUTO_1943 ?AUTO_1951 ) ) ( not ( = ?AUTO_1944 ?AUTO_1951 ) ) ( not ( = ?AUTO_1943 ?AUTO_1947 ) ) ( not ( = ?AUTO_1943 ?AUTO_1950 ) ) ( not ( = ?AUTO_1944 ?AUTO_1947 ) ) ( not ( = ?AUTO_1944 ?AUTO_1950 ) ) ( not ( = ?AUTO_1951 ?AUTO_1947 ) ) ( not ( = ?AUTO_1951 ?AUTO_1950 ) ) ( not ( = ?AUTO_1947 ?AUTO_1950 ) ) ( ON ?AUTO_1947 ?AUTO_1944 ) ( ON ?AUTO_1950 ?AUTO_1943 ) ( CLEAR ?AUTO_1945 ) ( not ( = ?AUTO_1943 ?AUTO_1948 ) ) ( not ( = ?AUTO_1943 ?AUTO_1945 ) ) ( not ( = ?AUTO_1944 ?AUTO_1948 ) ) ( not ( = ?AUTO_1944 ?AUTO_1945 ) ) ( not ( = ?AUTO_1951 ?AUTO_1948 ) ) ( not ( = ?AUTO_1951 ?AUTO_1945 ) ) ( not ( = ?AUTO_1947 ?AUTO_1948 ) ) ( not ( = ?AUTO_1947 ?AUTO_1945 ) ) ( not ( = ?AUTO_1950 ?AUTO_1948 ) ) ( not ( = ?AUTO_1950 ?AUTO_1945 ) ) ( not ( = ?AUTO_1948 ?AUTO_1945 ) ) ( ON ?AUTO_1948 ?AUTO_1950 ) ( not ( = ?AUTO_1943 ?AUTO_1946 ) ) ( not ( = ?AUTO_1944 ?AUTO_1946 ) ) ( not ( = ?AUTO_1951 ?AUTO_1946 ) ) ( not ( = ?AUTO_1947 ?AUTO_1946 ) ) ( not ( = ?AUTO_1950 ?AUTO_1946 ) ) ( not ( = ?AUTO_1945 ?AUTO_1946 ) ) ( not ( = ?AUTO_1948 ?AUTO_1946 ) ) ( ON ?AUTO_1946 ?AUTO_1948 ) ( CLEAR ?AUTO_1946 ) ( not ( = ?AUTO_1943 ?AUTO_1949 ) ) ( not ( = ?AUTO_1944 ?AUTO_1949 ) ) ( not ( = ?AUTO_1951 ?AUTO_1949 ) ) ( not ( = ?AUTO_1947 ?AUTO_1949 ) ) ( not ( = ?AUTO_1950 ?AUTO_1949 ) ) ( not ( = ?AUTO_1945 ?AUTO_1949 ) ) ( not ( = ?AUTO_1948 ?AUTO_1949 ) ) ( not ( = ?AUTO_1946 ?AUTO_1949 ) ) ( ON ?AUTO_1949 ?AUTO_1947 ) ( not ( = ?AUTO_1943 ?AUTO_1952 ) ) ( not ( = ?AUTO_1944 ?AUTO_1952 ) ) ( not ( = ?AUTO_1951 ?AUTO_1952 ) ) ( not ( = ?AUTO_1947 ?AUTO_1952 ) ) ( not ( = ?AUTO_1950 ?AUTO_1952 ) ) ( not ( = ?AUTO_1945 ?AUTO_1952 ) ) ( not ( = ?AUTO_1948 ?AUTO_1952 ) ) ( not ( = ?AUTO_1946 ?AUTO_1952 ) ) ( not ( = ?AUTO_1949 ?AUTO_1952 ) ) ( ON ?AUTO_1952 ?AUTO_1949 ) ( CLEAR ?AUTO_1952 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1952 ?AUTO_1949 )
      ( MAKE-ON ?AUTO_1943 ?AUTO_1944 )
      ( MAKE-ON-VERIFY ?AUTO_1943 ?AUTO_1944 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2920 - BLOCK
      ?AUTO_2921 - BLOCK
    )
    :vars
    (
      ?AUTO_2922 - BLOCK
      ?AUTO_2923 - BLOCK
      ?AUTO_2924 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2921 ) ( not ( = ?AUTO_2920 ?AUTO_2921 ) ) ( ON-TABLE ?AUTO_2920 ) ( not ( = ?AUTO_2920 ?AUTO_2922 ) ) ( not ( = ?AUTO_2921 ?AUTO_2922 ) ) ( ON ?AUTO_2922 ?AUTO_2920 ) ( not ( = ?AUTO_2920 ?AUTO_2923 ) ) ( not ( = ?AUTO_2920 ?AUTO_2924 ) ) ( not ( = ?AUTO_2921 ?AUTO_2923 ) ) ( not ( = ?AUTO_2921 ?AUTO_2924 ) ) ( not ( = ?AUTO_2922 ?AUTO_2923 ) ) ( not ( = ?AUTO_2922 ?AUTO_2924 ) ) ( not ( = ?AUTO_2923 ?AUTO_2924 ) ) ( ON ?AUTO_2923 ?AUTO_2922 ) ( CLEAR ?AUTO_2923 ) ( HOLDING ?AUTO_2924 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2924 )
      ( MAKE-ON ?AUTO_2920 ?AUTO_2921 )
      ( MAKE-ON-VERIFY ?AUTO_2920 ?AUTO_2921 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2056 - BLOCK
      ?AUTO_2057 - BLOCK
    )
    :vars
    (
      ?AUTO_2060 - BLOCK
      ?AUTO_2059 - BLOCK
      ?AUTO_2058 - BLOCK
      ?AUTO_2061 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2057 ) ( not ( = ?AUTO_2056 ?AUTO_2057 ) ) ( ON-TABLE ?AUTO_2056 ) ( not ( = ?AUTO_2056 ?AUTO_2060 ) ) ( not ( = ?AUTO_2057 ?AUTO_2060 ) ) ( ON ?AUTO_2060 ?AUTO_2056 ) ( not ( = ?AUTO_2056 ?AUTO_2059 ) ) ( not ( = ?AUTO_2056 ?AUTO_2058 ) ) ( not ( = ?AUTO_2057 ?AUTO_2059 ) ) ( not ( = ?AUTO_2057 ?AUTO_2058 ) ) ( not ( = ?AUTO_2060 ?AUTO_2059 ) ) ( not ( = ?AUTO_2060 ?AUTO_2058 ) ) ( not ( = ?AUTO_2059 ?AUTO_2058 ) ) ( ON ?AUTO_2059 ?AUTO_2060 ) ( not ( = ?AUTO_2056 ?AUTO_2061 ) ) ( not ( = ?AUTO_2057 ?AUTO_2061 ) ) ( not ( = ?AUTO_2060 ?AUTO_2061 ) ) ( not ( = ?AUTO_2058 ?AUTO_2061 ) ) ( not ( = ?AUTO_2059 ?AUTO_2061 ) ) ( ON ?AUTO_2061 ?AUTO_2059 ) ( CLEAR ?AUTO_2061 ) ( HOLDING ?AUTO_2058 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2058 )
      ( MAKE-ON ?AUTO_2056 ?AUTO_2057 )
      ( MAKE-ON-VERIFY ?AUTO_2056 ?AUTO_2057 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2115 - BLOCK
      ?AUTO_2116 - BLOCK
    )
    :vars
    (
      ?AUTO_2117 - BLOCK
      ?AUTO_2118 - BLOCK
      ?AUTO_2119 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2115 ?AUTO_2116 ) ) ( ON-TABLE ?AUTO_2115 ) ( CLEAR ?AUTO_2117 ) ( not ( = ?AUTO_2115 ?AUTO_2117 ) ) ( not ( = ?AUTO_2116 ?AUTO_2117 ) ) ( ON ?AUTO_2116 ?AUTO_2115 ) ( CLEAR ?AUTO_2116 ) ( HOLDING ?AUTO_2118 ) ( CLEAR ?AUTO_2119 ) ( not ( = ?AUTO_2115 ?AUTO_2118 ) ) ( not ( = ?AUTO_2115 ?AUTO_2119 ) ) ( not ( = ?AUTO_2116 ?AUTO_2118 ) ) ( not ( = ?AUTO_2116 ?AUTO_2119 ) ) ( not ( = ?AUTO_2117 ?AUTO_2118 ) ) ( not ( = ?AUTO_2117 ?AUTO_2119 ) ) ( not ( = ?AUTO_2118 ?AUTO_2119 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2118 ?AUTO_2119 )
      ( MAKE-ON ?AUTO_2115 ?AUTO_2116 )
      ( MAKE-ON-VERIFY ?AUTO_2115 ?AUTO_2116 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2252 - BLOCK
      ?AUTO_2253 - BLOCK
    )
    :vars
    (
      ?AUTO_2256 - BLOCK
      ?AUTO_2255 - BLOCK
      ?AUTO_2254 - BLOCK
      ?AUTO_2257 - BLOCK
      ?AUTO_2258 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2253 ) ( not ( = ?AUTO_2252 ?AUTO_2253 ) ) ( ON ?AUTO_2252 ?AUTO_2256 ) ( not ( = ?AUTO_2252 ?AUTO_2256 ) ) ( not ( = ?AUTO_2253 ?AUTO_2256 ) ) ( not ( = ?AUTO_2252 ?AUTO_2255 ) ) ( not ( = ?AUTO_2253 ?AUTO_2255 ) ) ( not ( = ?AUTO_2256 ?AUTO_2255 ) ) ( ON ?AUTO_2255 ?AUTO_2252 ) ( not ( = ?AUTO_2252 ?AUTO_2254 ) ) ( not ( = ?AUTO_2253 ?AUTO_2254 ) ) ( not ( = ?AUTO_2256 ?AUTO_2254 ) ) ( not ( = ?AUTO_2255 ?AUTO_2254 ) ) ( ON ?AUTO_2254 ?AUTO_2255 ) ( CLEAR ?AUTO_2254 ) ( HOLDING ?AUTO_2257 ) ( CLEAR ?AUTO_2258 ) ( not ( = ?AUTO_2252 ?AUTO_2257 ) ) ( not ( = ?AUTO_2252 ?AUTO_2258 ) ) ( not ( = ?AUTO_2253 ?AUTO_2257 ) ) ( not ( = ?AUTO_2253 ?AUTO_2258 ) ) ( not ( = ?AUTO_2256 ?AUTO_2257 ) ) ( not ( = ?AUTO_2256 ?AUTO_2258 ) ) ( not ( = ?AUTO_2255 ?AUTO_2257 ) ) ( not ( = ?AUTO_2255 ?AUTO_2258 ) ) ( not ( = ?AUTO_2254 ?AUTO_2257 ) ) ( not ( = ?AUTO_2254 ?AUTO_2258 ) ) ( not ( = ?AUTO_2257 ?AUTO_2258 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2257 ?AUTO_2258 )
      ( MAKE-ON ?AUTO_2252 ?AUTO_2253 )
      ( MAKE-ON-VERIFY ?AUTO_2252 ?AUTO_2253 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2266 - BLOCK
      ?AUTO_2267 - BLOCK
    )
    :vars
    (
      ?AUTO_2271 - BLOCK
      ?AUTO_2269 - BLOCK
      ?AUTO_2268 - BLOCK
      ?AUTO_2270 - BLOCK
      ?AUTO_2272 - BLOCK
      ?AUTO_2273 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2267 ) ( not ( = ?AUTO_2266 ?AUTO_2267 ) ) ( ON ?AUTO_2266 ?AUTO_2271 ) ( not ( = ?AUTO_2266 ?AUTO_2271 ) ) ( not ( = ?AUTO_2267 ?AUTO_2271 ) ) ( not ( = ?AUTO_2266 ?AUTO_2269 ) ) ( not ( = ?AUTO_2267 ?AUTO_2269 ) ) ( not ( = ?AUTO_2271 ?AUTO_2269 ) ) ( ON ?AUTO_2269 ?AUTO_2266 ) ( not ( = ?AUTO_2266 ?AUTO_2268 ) ) ( not ( = ?AUTO_2267 ?AUTO_2268 ) ) ( not ( = ?AUTO_2271 ?AUTO_2268 ) ) ( not ( = ?AUTO_2269 ?AUTO_2268 ) ) ( ON ?AUTO_2268 ?AUTO_2269 ) ( not ( = ?AUTO_2266 ?AUTO_2270 ) ) ( not ( = ?AUTO_2266 ?AUTO_2272 ) ) ( not ( = ?AUTO_2267 ?AUTO_2270 ) ) ( not ( = ?AUTO_2267 ?AUTO_2272 ) ) ( not ( = ?AUTO_2271 ?AUTO_2270 ) ) ( not ( = ?AUTO_2271 ?AUTO_2272 ) ) ( not ( = ?AUTO_2269 ?AUTO_2270 ) ) ( not ( = ?AUTO_2269 ?AUTO_2272 ) ) ( not ( = ?AUTO_2268 ?AUTO_2270 ) ) ( not ( = ?AUTO_2268 ?AUTO_2272 ) ) ( not ( = ?AUTO_2270 ?AUTO_2272 ) ) ( ON ?AUTO_2270 ?AUTO_2268 ) ( CLEAR ?AUTO_2270 ) ( HOLDING ?AUTO_2272 ) ( CLEAR ?AUTO_2273 ) ( not ( = ?AUTO_2266 ?AUTO_2273 ) ) ( not ( = ?AUTO_2267 ?AUTO_2273 ) ) ( not ( = ?AUTO_2271 ?AUTO_2273 ) ) ( not ( = ?AUTO_2269 ?AUTO_2273 ) ) ( not ( = ?AUTO_2268 ?AUTO_2273 ) ) ( not ( = ?AUTO_2270 ?AUTO_2273 ) ) ( not ( = ?AUTO_2272 ?AUTO_2273 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2272 ?AUTO_2273 )
      ( MAKE-ON ?AUTO_2266 ?AUTO_2267 )
      ( MAKE-ON-VERIFY ?AUTO_2266 ?AUTO_2267 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2434 - BLOCK
      ?AUTO_2435 - BLOCK
    )
    :vars
    (
      ?AUTO_2438 - BLOCK
      ?AUTO_2437 - BLOCK
      ?AUTO_2436 - BLOCK
      ?AUTO_2439 - BLOCK
      ?AUTO_2440 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2434 ?AUTO_2435 ) ) ( not ( = ?AUTO_2434 ?AUTO_2438 ) ) ( not ( = ?AUTO_2435 ?AUTO_2438 ) ) ( CLEAR ?AUTO_2437 ) ( not ( = ?AUTO_2434 ?AUTO_2436 ) ) ( not ( = ?AUTO_2434 ?AUTO_2437 ) ) ( not ( = ?AUTO_2435 ?AUTO_2436 ) ) ( not ( = ?AUTO_2435 ?AUTO_2437 ) ) ( not ( = ?AUTO_2438 ?AUTO_2436 ) ) ( not ( = ?AUTO_2438 ?AUTO_2437 ) ) ( not ( = ?AUTO_2436 ?AUTO_2437 ) ) ( ON ?AUTO_2436 ?AUTO_2435 ) ( not ( = ?AUTO_2434 ?AUTO_2439 ) ) ( not ( = ?AUTO_2435 ?AUTO_2439 ) ) ( not ( = ?AUTO_2438 ?AUTO_2439 ) ) ( not ( = ?AUTO_2437 ?AUTO_2439 ) ) ( not ( = ?AUTO_2436 ?AUTO_2439 ) ) ( ON ?AUTO_2439 ?AUTO_2436 ) ( not ( = ?AUTO_2434 ?AUTO_2440 ) ) ( not ( = ?AUTO_2435 ?AUTO_2440 ) ) ( not ( = ?AUTO_2438 ?AUTO_2440 ) ) ( not ( = ?AUTO_2437 ?AUTO_2440 ) ) ( not ( = ?AUTO_2436 ?AUTO_2440 ) ) ( not ( = ?AUTO_2439 ?AUTO_2440 ) ) ( ON ?AUTO_2440 ?AUTO_2439 ) ( CLEAR ?AUTO_2440 ) ( HOLDING ?AUTO_2434 ) ( CLEAR ?AUTO_2438 ) )
    :subtasks
    ( ( !STACK ?AUTO_2434 ?AUTO_2438 )
      ( MAKE-ON ?AUTO_2434 ?AUTO_2435 )
      ( MAKE-ON-VERIFY ?AUTO_2434 ?AUTO_2435 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4119 - BLOCK
      ?AUTO_4120 - BLOCK
    )
    :vars
    (
      ?AUTO_4121 - BLOCK
      ?AUTO_4122 - BLOCK
      ?AUTO_4123 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4119 ?AUTO_4120 ) ) ( not ( = ?AUTO_4119 ?AUTO_4121 ) ) ( not ( = ?AUTO_4120 ?AUTO_4121 ) ) ( ON ?AUTO_4121 ?AUTO_4120 ) ( not ( = ?AUTO_4119 ?AUTO_4122 ) ) ( not ( = ?AUTO_4120 ?AUTO_4122 ) ) ( not ( = ?AUTO_4121 ?AUTO_4122 ) ) ( ON ?AUTO_4122 ?AUTO_4121 ) ( not ( = ?AUTO_4119 ?AUTO_4123 ) ) ( not ( = ?AUTO_4120 ?AUTO_4123 ) ) ( not ( = ?AUTO_4121 ?AUTO_4123 ) ) ( not ( = ?AUTO_4122 ?AUTO_4123 ) ) ( ON ?AUTO_4123 ?AUTO_4122 ) ( ON ?AUTO_4119 ?AUTO_4123 ) ( CLEAR ?AUTO_4119 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4119 ?AUTO_4123 )
      ( MAKE-ON ?AUTO_4119 ?AUTO_4120 )
      ( MAKE-ON-VERIFY ?AUTO_4119 ?AUTO_4120 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2448 - BLOCK
      ?AUTO_2449 - BLOCK
    )
    :vars
    (
      ?AUTO_2452 - BLOCK
      ?AUTO_2450 - BLOCK
      ?AUTO_2451 - BLOCK
      ?AUTO_2453 - BLOCK
      ?AUTO_2454 - BLOCK
      ?AUTO_2455 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2448 ?AUTO_2449 ) ) ( not ( = ?AUTO_2448 ?AUTO_2452 ) ) ( not ( = ?AUTO_2449 ?AUTO_2452 ) ) ( CLEAR ?AUTO_2450 ) ( not ( = ?AUTO_2448 ?AUTO_2451 ) ) ( not ( = ?AUTO_2448 ?AUTO_2450 ) ) ( not ( = ?AUTO_2449 ?AUTO_2451 ) ) ( not ( = ?AUTO_2449 ?AUTO_2450 ) ) ( not ( = ?AUTO_2452 ?AUTO_2451 ) ) ( not ( = ?AUTO_2452 ?AUTO_2450 ) ) ( not ( = ?AUTO_2451 ?AUTO_2450 ) ) ( ON ?AUTO_2451 ?AUTO_2449 ) ( not ( = ?AUTO_2448 ?AUTO_2453 ) ) ( not ( = ?AUTO_2449 ?AUTO_2453 ) ) ( not ( = ?AUTO_2452 ?AUTO_2453 ) ) ( not ( = ?AUTO_2450 ?AUTO_2453 ) ) ( not ( = ?AUTO_2451 ?AUTO_2453 ) ) ( ON ?AUTO_2453 ?AUTO_2451 ) ( not ( = ?AUTO_2448 ?AUTO_2454 ) ) ( not ( = ?AUTO_2449 ?AUTO_2454 ) ) ( not ( = ?AUTO_2452 ?AUTO_2454 ) ) ( not ( = ?AUTO_2450 ?AUTO_2454 ) ) ( not ( = ?AUTO_2451 ?AUTO_2454 ) ) ( not ( = ?AUTO_2453 ?AUTO_2454 ) ) ( ON ?AUTO_2454 ?AUTO_2453 ) ( ON ?AUTO_2448 ?AUTO_2454 ) ( CLEAR ?AUTO_2448 ) ( HOLDING ?AUTO_2452 ) ( CLEAR ?AUTO_2455 ) ( not ( = ?AUTO_2448 ?AUTO_2455 ) ) ( not ( = ?AUTO_2449 ?AUTO_2455 ) ) ( not ( = ?AUTO_2452 ?AUTO_2455 ) ) ( not ( = ?AUTO_2450 ?AUTO_2455 ) ) ( not ( = ?AUTO_2451 ?AUTO_2455 ) ) ( not ( = ?AUTO_2453 ?AUTO_2455 ) ) ( not ( = ?AUTO_2454 ?AUTO_2455 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2452 ?AUTO_2455 )
      ( MAKE-ON ?AUTO_2448 ?AUTO_2449 )
      ( MAKE-ON-VERIFY ?AUTO_2448 ?AUTO_2449 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2515 - BLOCK
      ?AUTO_2516 - BLOCK
    )
    :vars
    (
      ?AUTO_2518 - BLOCK
      ?AUTO_2517 - BLOCK
      ?AUTO_2519 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2515 ?AUTO_2516 ) ) ( not ( = ?AUTO_2515 ?AUTO_2518 ) ) ( not ( = ?AUTO_2516 ?AUTO_2518 ) ) ( CLEAR ?AUTO_2517 ) ( not ( = ?AUTO_2515 ?AUTO_2519 ) ) ( not ( = ?AUTO_2515 ?AUTO_2517 ) ) ( not ( = ?AUTO_2516 ?AUTO_2519 ) ) ( not ( = ?AUTO_2516 ?AUTO_2517 ) ) ( not ( = ?AUTO_2518 ?AUTO_2519 ) ) ( not ( = ?AUTO_2518 ?AUTO_2517 ) ) ( not ( = ?AUTO_2519 ?AUTO_2517 ) ) ( ON ?AUTO_2519 ?AUTO_2516 ) ( CLEAR ?AUTO_2519 ) ( HOLDING ?AUTO_2515 ) ( CLEAR ?AUTO_2518 ) )
    :subtasks
    ( ( !STACK ?AUTO_2515 ?AUTO_2518 )
      ( MAKE-ON ?AUTO_2515 ?AUTO_2516 )
      ( MAKE-ON-VERIFY ?AUTO_2515 ?AUTO_2516 ) )
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
      ?AUTO_2523 - BLOCK
      ?AUTO_2524 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2520 ?AUTO_2521 ) ) ( not ( = ?AUTO_2520 ?AUTO_2522 ) ) ( not ( = ?AUTO_2521 ?AUTO_2522 ) ) ( CLEAR ?AUTO_2523 ) ( not ( = ?AUTO_2520 ?AUTO_2524 ) ) ( not ( = ?AUTO_2520 ?AUTO_2523 ) ) ( not ( = ?AUTO_2521 ?AUTO_2524 ) ) ( not ( = ?AUTO_2521 ?AUTO_2523 ) ) ( not ( = ?AUTO_2522 ?AUTO_2524 ) ) ( not ( = ?AUTO_2522 ?AUTO_2523 ) ) ( not ( = ?AUTO_2524 ?AUTO_2523 ) ) ( ON ?AUTO_2524 ?AUTO_2521 ) ( CLEAR ?AUTO_2524 ) ( CLEAR ?AUTO_2522 ) ( ON-TABLE ?AUTO_2520 ) ( CLEAR ?AUTO_2520 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_2520 )
      ( MAKE-ON ?AUTO_2520 ?AUTO_2521 )
      ( MAKE-ON-VERIFY ?AUTO_2520 ?AUTO_2521 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2716 - BLOCK
      ?AUTO_2717 - BLOCK
    )
    :vars
    (
      ?AUTO_2718 - BLOCK
      ?AUTO_2719 - BLOCK
      ?AUTO_2720 - BLOCK
      ?AUTO_2721 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2716 ?AUTO_2717 ) ) ( ON-TABLE ?AUTO_2716 ) ( not ( = ?AUTO_2716 ?AUTO_2718 ) ) ( not ( = ?AUTO_2717 ?AUTO_2718 ) ) ( ON ?AUTO_2718 ?AUTO_2716 ) ( CLEAR ?AUTO_2718 ) ( not ( = ?AUTO_2716 ?AUTO_2719 ) ) ( not ( = ?AUTO_2716 ?AUTO_2720 ) ) ( not ( = ?AUTO_2717 ?AUTO_2719 ) ) ( not ( = ?AUTO_2717 ?AUTO_2720 ) ) ( not ( = ?AUTO_2718 ?AUTO_2719 ) ) ( not ( = ?AUTO_2718 ?AUTO_2720 ) ) ( not ( = ?AUTO_2719 ?AUTO_2720 ) ) ( ON ?AUTO_2719 ?AUTO_2717 ) ( CLEAR ?AUTO_2719 ) ( HOLDING ?AUTO_2720 ) ( CLEAR ?AUTO_2721 ) ( not ( = ?AUTO_2716 ?AUTO_2721 ) ) ( not ( = ?AUTO_2717 ?AUTO_2721 ) ) ( not ( = ?AUTO_2718 ?AUTO_2721 ) ) ( not ( = ?AUTO_2719 ?AUTO_2721 ) ) ( not ( = ?AUTO_2720 ?AUTO_2721 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2720 ?AUTO_2721 )
      ( MAKE-ON ?AUTO_2716 ?AUTO_2717 )
      ( MAKE-ON-VERIFY ?AUTO_2716 ?AUTO_2717 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2711 - BLOCK
      ?AUTO_2712 - BLOCK
    )
    :vars
    (
      ?AUTO_2715 - BLOCK
      ?AUTO_2714 - BLOCK
      ?AUTO_2713 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2711 ?AUTO_2712 ) ) ( ON-TABLE ?AUTO_2711 ) ( not ( = ?AUTO_2711 ?AUTO_2715 ) ) ( not ( = ?AUTO_2712 ?AUTO_2715 ) ) ( ON ?AUTO_2715 ?AUTO_2711 ) ( CLEAR ?AUTO_2715 ) ( CLEAR ?AUTO_2714 ) ( not ( = ?AUTO_2711 ?AUTO_2713 ) ) ( not ( = ?AUTO_2711 ?AUTO_2714 ) ) ( not ( = ?AUTO_2712 ?AUTO_2713 ) ) ( not ( = ?AUTO_2712 ?AUTO_2714 ) ) ( not ( = ?AUTO_2715 ?AUTO_2713 ) ) ( not ( = ?AUTO_2715 ?AUTO_2714 ) ) ( not ( = ?AUTO_2713 ?AUTO_2714 ) ) ( ON ?AUTO_2713 ?AUTO_2712 ) ( CLEAR ?AUTO_2713 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2713 ?AUTO_2712 )
      ( MAKE-ON ?AUTO_2711 ?AUTO_2712 )
      ( MAKE-ON-VERIFY ?AUTO_2711 ?AUTO_2712 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2728 - BLOCK
      ?AUTO_2729 - BLOCK
    )
    :vars
    (
      ?AUTO_2731 - BLOCK
      ?AUTO_2730 - BLOCK
      ?AUTO_2732 - BLOCK
      ?AUTO_2733 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2728 ?AUTO_2729 ) ) ( ON-TABLE ?AUTO_2728 ) ( not ( = ?AUTO_2728 ?AUTO_2731 ) ) ( not ( = ?AUTO_2729 ?AUTO_2731 ) ) ( ON ?AUTO_2731 ?AUTO_2728 ) ( not ( = ?AUTO_2728 ?AUTO_2730 ) ) ( not ( = ?AUTO_2728 ?AUTO_2732 ) ) ( not ( = ?AUTO_2729 ?AUTO_2730 ) ) ( not ( = ?AUTO_2729 ?AUTO_2732 ) ) ( not ( = ?AUTO_2731 ?AUTO_2730 ) ) ( not ( = ?AUTO_2731 ?AUTO_2732 ) ) ( not ( = ?AUTO_2730 ?AUTO_2732 ) ) ( CLEAR ?AUTO_2733 ) ( not ( = ?AUTO_2728 ?AUTO_2733 ) ) ( not ( = ?AUTO_2729 ?AUTO_2733 ) ) ( not ( = ?AUTO_2731 ?AUTO_2733 ) ) ( not ( = ?AUTO_2730 ?AUTO_2733 ) ) ( not ( = ?AUTO_2732 ?AUTO_2733 ) ) ( ON ?AUTO_2732 ?AUTO_2731 ) ( CLEAR ?AUTO_2732 ) ( HOLDING ?AUTO_2730 ) ( CLEAR ?AUTO_2729 ) )
    :subtasks
    ( ( !STACK ?AUTO_2730 ?AUTO_2729 )
      ( MAKE-ON ?AUTO_2728 ?AUTO_2729 )
      ( MAKE-ON-VERIFY ?AUTO_2728 ?AUTO_2729 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2752 - BLOCK
      ?AUTO_2753 - BLOCK
    )
    :vars
    (
      ?AUTO_2758 - BLOCK
      ?AUTO_2757 - BLOCK
      ?AUTO_2754 - BLOCK
      ?AUTO_2756 - BLOCK
      ?AUTO_2755 - BLOCK
      ?AUTO_2759 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2752 ?AUTO_2753 ) ) ( ON-TABLE ?AUTO_2752 ) ( not ( = ?AUTO_2752 ?AUTO_2758 ) ) ( not ( = ?AUTO_2753 ?AUTO_2758 ) ) ( ON ?AUTO_2758 ?AUTO_2752 ) ( not ( = ?AUTO_2752 ?AUTO_2757 ) ) ( not ( = ?AUTO_2752 ?AUTO_2754 ) ) ( not ( = ?AUTO_2753 ?AUTO_2757 ) ) ( not ( = ?AUTO_2753 ?AUTO_2754 ) ) ( not ( = ?AUTO_2758 ?AUTO_2757 ) ) ( not ( = ?AUTO_2758 ?AUTO_2754 ) ) ( not ( = ?AUTO_2757 ?AUTO_2754 ) ) ( CLEAR ?AUTO_2756 ) ( not ( = ?AUTO_2752 ?AUTO_2756 ) ) ( not ( = ?AUTO_2753 ?AUTO_2756 ) ) ( not ( = ?AUTO_2758 ?AUTO_2756 ) ) ( not ( = ?AUTO_2757 ?AUTO_2756 ) ) ( not ( = ?AUTO_2754 ?AUTO_2756 ) ) ( ON ?AUTO_2754 ?AUTO_2758 ) ( ON ?AUTO_2757 ?AUTO_2754 ) ( CLEAR ?AUTO_2757 ) ( CLEAR ?AUTO_2755 ) ( not ( = ?AUTO_2752 ?AUTO_2759 ) ) ( not ( = ?AUTO_2752 ?AUTO_2755 ) ) ( not ( = ?AUTO_2753 ?AUTO_2759 ) ) ( not ( = ?AUTO_2753 ?AUTO_2755 ) ) ( not ( = ?AUTO_2758 ?AUTO_2759 ) ) ( not ( = ?AUTO_2758 ?AUTO_2755 ) ) ( not ( = ?AUTO_2757 ?AUTO_2759 ) ) ( not ( = ?AUTO_2757 ?AUTO_2755 ) ) ( not ( = ?AUTO_2754 ?AUTO_2759 ) ) ( not ( = ?AUTO_2754 ?AUTO_2755 ) ) ( not ( = ?AUTO_2756 ?AUTO_2759 ) ) ( not ( = ?AUTO_2756 ?AUTO_2755 ) ) ( not ( = ?AUTO_2759 ?AUTO_2755 ) ) ( ON ?AUTO_2759 ?AUTO_2753 ) ( CLEAR ?AUTO_2759 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2759 ?AUTO_2753 )
      ( MAKE-ON ?AUTO_2752 ?AUTO_2753 )
      ( MAKE-ON-VERIFY ?AUTO_2752 ?AUTO_2753 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4299 - BLOCK
      ?AUTO_4300 - BLOCK
    )
    :vars
    (
      ?AUTO_4306 - BLOCK
      ?AUTO_4301 - BLOCK
      ?AUTO_4303 - BLOCK
      ?AUTO_4305 - BLOCK
      ?AUTO_4304 - BLOCK
      ?AUTO_4302 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4299 ?AUTO_4300 ) ) ( ON-TABLE ?AUTO_4299 ) ( not ( = ?AUTO_4299 ?AUTO_4306 ) ) ( not ( = ?AUTO_4299 ?AUTO_4301 ) ) ( not ( = ?AUTO_4300 ?AUTO_4306 ) ) ( not ( = ?AUTO_4300 ?AUTO_4301 ) ) ( not ( = ?AUTO_4306 ?AUTO_4301 ) ) ( ON ?AUTO_4306 ?AUTO_4299 ) ( CLEAR ?AUTO_4303 ) ( not ( = ?AUTO_4299 ?AUTO_4305 ) ) ( not ( = ?AUTO_4299 ?AUTO_4303 ) ) ( not ( = ?AUTO_4300 ?AUTO_4305 ) ) ( not ( = ?AUTO_4300 ?AUTO_4303 ) ) ( not ( = ?AUTO_4301 ?AUTO_4305 ) ) ( not ( = ?AUTO_4301 ?AUTO_4303 ) ) ( not ( = ?AUTO_4306 ?AUTO_4305 ) ) ( not ( = ?AUTO_4306 ?AUTO_4303 ) ) ( not ( = ?AUTO_4305 ?AUTO_4303 ) ) ( ON ?AUTO_4305 ?AUTO_4306 ) ( not ( = ?AUTO_4299 ?AUTO_4304 ) ) ( not ( = ?AUTO_4299 ?AUTO_4302 ) ) ( not ( = ?AUTO_4300 ?AUTO_4304 ) ) ( not ( = ?AUTO_4300 ?AUTO_4302 ) ) ( not ( = ?AUTO_4301 ?AUTO_4304 ) ) ( not ( = ?AUTO_4301 ?AUTO_4302 ) ) ( not ( = ?AUTO_4306 ?AUTO_4304 ) ) ( not ( = ?AUTO_4306 ?AUTO_4302 ) ) ( not ( = ?AUTO_4303 ?AUTO_4304 ) ) ( not ( = ?AUTO_4303 ?AUTO_4302 ) ) ( not ( = ?AUTO_4305 ?AUTO_4304 ) ) ( not ( = ?AUTO_4305 ?AUTO_4302 ) ) ( not ( = ?AUTO_4304 ?AUTO_4302 ) ) ( ON ?AUTO_4304 ?AUTO_4305 ) ( CLEAR ?AUTO_4304 ) ( ON ?AUTO_4301 ?AUTO_4300 ) ( CLEAR ?AUTO_4301 ) ( HOLDING ?AUTO_4302 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4302 )
      ( MAKE-ON ?AUTO_4299 ?AUTO_4300 )
      ( MAKE-ON-VERIFY ?AUTO_4299 ?AUTO_4300 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2769 - BLOCK
      ?AUTO_2770 - BLOCK
    )
    :vars
    (
      ?AUTO_2771 - BLOCK
      ?AUTO_2775 - BLOCK
      ?AUTO_2774 - BLOCK
      ?AUTO_2777 - BLOCK
      ?AUTO_2773 - BLOCK
      ?AUTO_2776 - BLOCK
      ?AUTO_2772 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2769 ?AUTO_2770 ) ) ( ON-TABLE ?AUTO_2769 ) ( not ( = ?AUTO_2769 ?AUTO_2771 ) ) ( not ( = ?AUTO_2770 ?AUTO_2771 ) ) ( ON ?AUTO_2771 ?AUTO_2769 ) ( not ( = ?AUTO_2769 ?AUTO_2775 ) ) ( not ( = ?AUTO_2769 ?AUTO_2774 ) ) ( not ( = ?AUTO_2770 ?AUTO_2775 ) ) ( not ( = ?AUTO_2770 ?AUTO_2774 ) ) ( not ( = ?AUTO_2771 ?AUTO_2775 ) ) ( not ( = ?AUTO_2771 ?AUTO_2774 ) ) ( not ( = ?AUTO_2775 ?AUTO_2774 ) ) ( CLEAR ?AUTO_2777 ) ( not ( = ?AUTO_2769 ?AUTO_2777 ) ) ( not ( = ?AUTO_2770 ?AUTO_2777 ) ) ( not ( = ?AUTO_2771 ?AUTO_2777 ) ) ( not ( = ?AUTO_2775 ?AUTO_2777 ) ) ( not ( = ?AUTO_2774 ?AUTO_2777 ) ) ( ON ?AUTO_2774 ?AUTO_2771 ) ( ON ?AUTO_2775 ?AUTO_2774 ) ( CLEAR ?AUTO_2775 ) ( CLEAR ?AUTO_2773 ) ( not ( = ?AUTO_2769 ?AUTO_2776 ) ) ( not ( = ?AUTO_2769 ?AUTO_2773 ) ) ( not ( = ?AUTO_2770 ?AUTO_2776 ) ) ( not ( = ?AUTO_2770 ?AUTO_2773 ) ) ( not ( = ?AUTO_2771 ?AUTO_2776 ) ) ( not ( = ?AUTO_2771 ?AUTO_2773 ) ) ( not ( = ?AUTO_2775 ?AUTO_2776 ) ) ( not ( = ?AUTO_2775 ?AUTO_2773 ) ) ( not ( = ?AUTO_2774 ?AUTO_2776 ) ) ( not ( = ?AUTO_2774 ?AUTO_2773 ) ) ( not ( = ?AUTO_2777 ?AUTO_2776 ) ) ( not ( = ?AUTO_2777 ?AUTO_2773 ) ) ( not ( = ?AUTO_2776 ?AUTO_2773 ) ) ( ON ?AUTO_2776 ?AUTO_2770 ) ( not ( = ?AUTO_2769 ?AUTO_2772 ) ) ( not ( = ?AUTO_2770 ?AUTO_2772 ) ) ( not ( = ?AUTO_2771 ?AUTO_2772 ) ) ( not ( = ?AUTO_2775 ?AUTO_2772 ) ) ( not ( = ?AUTO_2774 ?AUTO_2772 ) ) ( not ( = ?AUTO_2777 ?AUTO_2772 ) ) ( not ( = ?AUTO_2773 ?AUTO_2772 ) ) ( not ( = ?AUTO_2776 ?AUTO_2772 ) ) ( ON ?AUTO_2772 ?AUTO_2776 ) ( CLEAR ?AUTO_2772 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2772 ?AUTO_2776 )
      ( MAKE-ON ?AUTO_2769 ?AUTO_2770 )
      ( MAKE-ON-VERIFY ?AUTO_2769 ?AUTO_2770 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2778 - BLOCK
      ?AUTO_2779 - BLOCK
    )
    :vars
    (
      ?AUTO_2780 - BLOCK
      ?AUTO_2784 - BLOCK
      ?AUTO_2785 - BLOCK
      ?AUTO_2782 - BLOCK
      ?AUTO_2786 - BLOCK
      ?AUTO_2783 - BLOCK
      ?AUTO_2781 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2778 ?AUTO_2779 ) ) ( ON-TABLE ?AUTO_2778 ) ( not ( = ?AUTO_2778 ?AUTO_2780 ) ) ( not ( = ?AUTO_2779 ?AUTO_2780 ) ) ( ON ?AUTO_2780 ?AUTO_2778 ) ( not ( = ?AUTO_2778 ?AUTO_2784 ) ) ( not ( = ?AUTO_2778 ?AUTO_2785 ) ) ( not ( = ?AUTO_2779 ?AUTO_2784 ) ) ( not ( = ?AUTO_2779 ?AUTO_2785 ) ) ( not ( = ?AUTO_2780 ?AUTO_2784 ) ) ( not ( = ?AUTO_2780 ?AUTO_2785 ) ) ( not ( = ?AUTO_2784 ?AUTO_2785 ) ) ( not ( = ?AUTO_2778 ?AUTO_2782 ) ) ( not ( = ?AUTO_2779 ?AUTO_2782 ) ) ( not ( = ?AUTO_2780 ?AUTO_2782 ) ) ( not ( = ?AUTO_2784 ?AUTO_2782 ) ) ( not ( = ?AUTO_2785 ?AUTO_2782 ) ) ( ON ?AUTO_2785 ?AUTO_2780 ) ( ON ?AUTO_2784 ?AUTO_2785 ) ( CLEAR ?AUTO_2784 ) ( CLEAR ?AUTO_2786 ) ( not ( = ?AUTO_2778 ?AUTO_2783 ) ) ( not ( = ?AUTO_2778 ?AUTO_2786 ) ) ( not ( = ?AUTO_2779 ?AUTO_2783 ) ) ( not ( = ?AUTO_2779 ?AUTO_2786 ) ) ( not ( = ?AUTO_2780 ?AUTO_2783 ) ) ( not ( = ?AUTO_2780 ?AUTO_2786 ) ) ( not ( = ?AUTO_2784 ?AUTO_2783 ) ) ( not ( = ?AUTO_2784 ?AUTO_2786 ) ) ( not ( = ?AUTO_2785 ?AUTO_2783 ) ) ( not ( = ?AUTO_2785 ?AUTO_2786 ) ) ( not ( = ?AUTO_2782 ?AUTO_2783 ) ) ( not ( = ?AUTO_2782 ?AUTO_2786 ) ) ( not ( = ?AUTO_2783 ?AUTO_2786 ) ) ( ON ?AUTO_2783 ?AUTO_2779 ) ( not ( = ?AUTO_2778 ?AUTO_2781 ) ) ( not ( = ?AUTO_2779 ?AUTO_2781 ) ) ( not ( = ?AUTO_2780 ?AUTO_2781 ) ) ( not ( = ?AUTO_2784 ?AUTO_2781 ) ) ( not ( = ?AUTO_2785 ?AUTO_2781 ) ) ( not ( = ?AUTO_2782 ?AUTO_2781 ) ) ( not ( = ?AUTO_2786 ?AUTO_2781 ) ) ( not ( = ?AUTO_2783 ?AUTO_2781 ) ) ( ON ?AUTO_2781 ?AUTO_2783 ) ( CLEAR ?AUTO_2781 ) ( HOLDING ?AUTO_2782 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2782 )
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
      ?AUTO_2791 - BLOCK
      ?AUTO_2795 - BLOCK
      ?AUTO_2794 - BLOCK
      ?AUTO_2793 - BLOCK
      ?AUTO_2792 - BLOCK
      ?AUTO_2789 - BLOCK
      ?AUTO_2790 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2787 ?AUTO_2788 ) ) ( ON-TABLE ?AUTO_2787 ) ( not ( = ?AUTO_2787 ?AUTO_2791 ) ) ( not ( = ?AUTO_2788 ?AUTO_2791 ) ) ( ON ?AUTO_2791 ?AUTO_2787 ) ( not ( = ?AUTO_2787 ?AUTO_2795 ) ) ( not ( = ?AUTO_2787 ?AUTO_2794 ) ) ( not ( = ?AUTO_2788 ?AUTO_2795 ) ) ( not ( = ?AUTO_2788 ?AUTO_2794 ) ) ( not ( = ?AUTO_2791 ?AUTO_2795 ) ) ( not ( = ?AUTO_2791 ?AUTO_2794 ) ) ( not ( = ?AUTO_2795 ?AUTO_2794 ) ) ( not ( = ?AUTO_2787 ?AUTO_2793 ) ) ( not ( = ?AUTO_2788 ?AUTO_2793 ) ) ( not ( = ?AUTO_2791 ?AUTO_2793 ) ) ( not ( = ?AUTO_2795 ?AUTO_2793 ) ) ( not ( = ?AUTO_2794 ?AUTO_2793 ) ) ( ON ?AUTO_2794 ?AUTO_2791 ) ( ON ?AUTO_2795 ?AUTO_2794 ) ( CLEAR ?AUTO_2795 ) ( CLEAR ?AUTO_2792 ) ( not ( = ?AUTO_2787 ?AUTO_2789 ) ) ( not ( = ?AUTO_2787 ?AUTO_2792 ) ) ( not ( = ?AUTO_2788 ?AUTO_2789 ) ) ( not ( = ?AUTO_2788 ?AUTO_2792 ) ) ( not ( = ?AUTO_2791 ?AUTO_2789 ) ) ( not ( = ?AUTO_2791 ?AUTO_2792 ) ) ( not ( = ?AUTO_2795 ?AUTO_2789 ) ) ( not ( = ?AUTO_2795 ?AUTO_2792 ) ) ( not ( = ?AUTO_2794 ?AUTO_2789 ) ) ( not ( = ?AUTO_2794 ?AUTO_2792 ) ) ( not ( = ?AUTO_2793 ?AUTO_2789 ) ) ( not ( = ?AUTO_2793 ?AUTO_2792 ) ) ( not ( = ?AUTO_2789 ?AUTO_2792 ) ) ( ON ?AUTO_2789 ?AUTO_2788 ) ( not ( = ?AUTO_2787 ?AUTO_2790 ) ) ( not ( = ?AUTO_2788 ?AUTO_2790 ) ) ( not ( = ?AUTO_2791 ?AUTO_2790 ) ) ( not ( = ?AUTO_2795 ?AUTO_2790 ) ) ( not ( = ?AUTO_2794 ?AUTO_2790 ) ) ( not ( = ?AUTO_2793 ?AUTO_2790 ) ) ( not ( = ?AUTO_2792 ?AUTO_2790 ) ) ( not ( = ?AUTO_2789 ?AUTO_2790 ) ) ( ON ?AUTO_2790 ?AUTO_2789 ) ( ON ?AUTO_2793 ?AUTO_2790 ) ( CLEAR ?AUTO_2793 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2793 ?AUTO_2790 )
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
      ?AUTO_2801 - BLOCK
      ?AUTO_2802 - BLOCK
      ?AUTO_2804 - BLOCK
      ?AUTO_2798 - BLOCK
      ?AUTO_2803 - BLOCK
      ?AUTO_2799 - BLOCK
      ?AUTO_2800 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2796 ?AUTO_2797 ) ) ( ON-TABLE ?AUTO_2796 ) ( not ( = ?AUTO_2796 ?AUTO_2801 ) ) ( not ( = ?AUTO_2797 ?AUTO_2801 ) ) ( ON ?AUTO_2801 ?AUTO_2796 ) ( not ( = ?AUTO_2796 ?AUTO_2802 ) ) ( not ( = ?AUTO_2796 ?AUTO_2804 ) ) ( not ( = ?AUTO_2797 ?AUTO_2802 ) ) ( not ( = ?AUTO_2797 ?AUTO_2804 ) ) ( not ( = ?AUTO_2801 ?AUTO_2802 ) ) ( not ( = ?AUTO_2801 ?AUTO_2804 ) ) ( not ( = ?AUTO_2802 ?AUTO_2804 ) ) ( not ( = ?AUTO_2796 ?AUTO_2798 ) ) ( not ( = ?AUTO_2797 ?AUTO_2798 ) ) ( not ( = ?AUTO_2801 ?AUTO_2798 ) ) ( not ( = ?AUTO_2802 ?AUTO_2798 ) ) ( not ( = ?AUTO_2804 ?AUTO_2798 ) ) ( ON ?AUTO_2804 ?AUTO_2801 ) ( CLEAR ?AUTO_2803 ) ( not ( = ?AUTO_2796 ?AUTO_2799 ) ) ( not ( = ?AUTO_2796 ?AUTO_2803 ) ) ( not ( = ?AUTO_2797 ?AUTO_2799 ) ) ( not ( = ?AUTO_2797 ?AUTO_2803 ) ) ( not ( = ?AUTO_2801 ?AUTO_2799 ) ) ( not ( = ?AUTO_2801 ?AUTO_2803 ) ) ( not ( = ?AUTO_2802 ?AUTO_2799 ) ) ( not ( = ?AUTO_2802 ?AUTO_2803 ) ) ( not ( = ?AUTO_2804 ?AUTO_2799 ) ) ( not ( = ?AUTO_2804 ?AUTO_2803 ) ) ( not ( = ?AUTO_2798 ?AUTO_2799 ) ) ( not ( = ?AUTO_2798 ?AUTO_2803 ) ) ( not ( = ?AUTO_2799 ?AUTO_2803 ) ) ( ON ?AUTO_2799 ?AUTO_2797 ) ( not ( = ?AUTO_2796 ?AUTO_2800 ) ) ( not ( = ?AUTO_2797 ?AUTO_2800 ) ) ( not ( = ?AUTO_2801 ?AUTO_2800 ) ) ( not ( = ?AUTO_2802 ?AUTO_2800 ) ) ( not ( = ?AUTO_2804 ?AUTO_2800 ) ) ( not ( = ?AUTO_2798 ?AUTO_2800 ) ) ( not ( = ?AUTO_2803 ?AUTO_2800 ) ) ( not ( = ?AUTO_2799 ?AUTO_2800 ) ) ( ON ?AUTO_2800 ?AUTO_2799 ) ( ON ?AUTO_2798 ?AUTO_2800 ) ( CLEAR ?AUTO_2798 ) ( HOLDING ?AUTO_2802 ) ( CLEAR ?AUTO_2804 ) )
    :subtasks
    ( ( !STACK ?AUTO_2802 ?AUTO_2804 )
      ( MAKE-ON ?AUTO_2796 ?AUTO_2797 )
      ( MAKE-ON-VERIFY ?AUTO_2796 ?AUTO_2797 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2814 - BLOCK
      ?AUTO_2815 - BLOCK
    )
    :vars
    (
      ?AUTO_2821 - BLOCK
      ?AUTO_2822 - BLOCK
      ?AUTO_2817 - BLOCK
      ?AUTO_2820 - BLOCK
      ?AUTO_2818 - BLOCK
      ?AUTO_2816 - BLOCK
      ?AUTO_2819 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2814 ?AUTO_2815 ) ) ( ON-TABLE ?AUTO_2814 ) ( not ( = ?AUTO_2814 ?AUTO_2821 ) ) ( not ( = ?AUTO_2815 ?AUTO_2821 ) ) ( ON ?AUTO_2821 ?AUTO_2814 ) ( not ( = ?AUTO_2814 ?AUTO_2822 ) ) ( not ( = ?AUTO_2814 ?AUTO_2817 ) ) ( not ( = ?AUTO_2815 ?AUTO_2822 ) ) ( not ( = ?AUTO_2815 ?AUTO_2817 ) ) ( not ( = ?AUTO_2821 ?AUTO_2822 ) ) ( not ( = ?AUTO_2821 ?AUTO_2817 ) ) ( not ( = ?AUTO_2822 ?AUTO_2817 ) ) ( not ( = ?AUTO_2814 ?AUTO_2820 ) ) ( not ( = ?AUTO_2815 ?AUTO_2820 ) ) ( not ( = ?AUTO_2821 ?AUTO_2820 ) ) ( not ( = ?AUTO_2822 ?AUTO_2820 ) ) ( not ( = ?AUTO_2817 ?AUTO_2820 ) ) ( CLEAR ?AUTO_2818 ) ( not ( = ?AUTO_2814 ?AUTO_2816 ) ) ( not ( = ?AUTO_2814 ?AUTO_2818 ) ) ( not ( = ?AUTO_2815 ?AUTO_2816 ) ) ( not ( = ?AUTO_2815 ?AUTO_2818 ) ) ( not ( = ?AUTO_2821 ?AUTO_2816 ) ) ( not ( = ?AUTO_2821 ?AUTO_2818 ) ) ( not ( = ?AUTO_2822 ?AUTO_2816 ) ) ( not ( = ?AUTO_2822 ?AUTO_2818 ) ) ( not ( = ?AUTO_2817 ?AUTO_2816 ) ) ( not ( = ?AUTO_2817 ?AUTO_2818 ) ) ( not ( = ?AUTO_2820 ?AUTO_2816 ) ) ( not ( = ?AUTO_2820 ?AUTO_2818 ) ) ( not ( = ?AUTO_2816 ?AUTO_2818 ) ) ( ON ?AUTO_2816 ?AUTO_2815 ) ( not ( = ?AUTO_2814 ?AUTO_2819 ) ) ( not ( = ?AUTO_2815 ?AUTO_2819 ) ) ( not ( = ?AUTO_2821 ?AUTO_2819 ) ) ( not ( = ?AUTO_2822 ?AUTO_2819 ) ) ( not ( = ?AUTO_2817 ?AUTO_2819 ) ) ( not ( = ?AUTO_2820 ?AUTO_2819 ) ) ( not ( = ?AUTO_2818 ?AUTO_2819 ) ) ( not ( = ?AUTO_2816 ?AUTO_2819 ) ) ( ON ?AUTO_2819 ?AUTO_2816 ) ( ON ?AUTO_2820 ?AUTO_2819 ) ( ON ?AUTO_2822 ?AUTO_2820 ) ( CLEAR ?AUTO_2822 ) ( HOLDING ?AUTO_2817 ) ( CLEAR ?AUTO_2821 ) )
    :subtasks
    ( ( !STACK ?AUTO_2817 ?AUTO_2821 )
      ( MAKE-ON ?AUTO_2814 ?AUTO_2815 )
      ( MAKE-ON-VERIFY ?AUTO_2814 ?AUTO_2815 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2823 - BLOCK
      ?AUTO_2824 - BLOCK
    )
    :vars
    (
      ?AUTO_2828 - BLOCK
      ?AUTO_2826 - BLOCK
      ?AUTO_2830 - BLOCK
      ?AUTO_2825 - BLOCK
      ?AUTO_2831 - BLOCK
      ?AUTO_2827 - BLOCK
      ?AUTO_2829 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2823 ?AUTO_2824 ) ) ( ON-TABLE ?AUTO_2823 ) ( not ( = ?AUTO_2823 ?AUTO_2828 ) ) ( not ( = ?AUTO_2824 ?AUTO_2828 ) ) ( ON ?AUTO_2828 ?AUTO_2823 ) ( not ( = ?AUTO_2823 ?AUTO_2826 ) ) ( not ( = ?AUTO_2823 ?AUTO_2830 ) ) ( not ( = ?AUTO_2824 ?AUTO_2826 ) ) ( not ( = ?AUTO_2824 ?AUTO_2830 ) ) ( not ( = ?AUTO_2828 ?AUTO_2826 ) ) ( not ( = ?AUTO_2828 ?AUTO_2830 ) ) ( not ( = ?AUTO_2826 ?AUTO_2830 ) ) ( not ( = ?AUTO_2823 ?AUTO_2825 ) ) ( not ( = ?AUTO_2824 ?AUTO_2825 ) ) ( not ( = ?AUTO_2828 ?AUTO_2825 ) ) ( not ( = ?AUTO_2826 ?AUTO_2825 ) ) ( not ( = ?AUTO_2830 ?AUTO_2825 ) ) ( CLEAR ?AUTO_2831 ) ( not ( = ?AUTO_2823 ?AUTO_2827 ) ) ( not ( = ?AUTO_2823 ?AUTO_2831 ) ) ( not ( = ?AUTO_2824 ?AUTO_2827 ) ) ( not ( = ?AUTO_2824 ?AUTO_2831 ) ) ( not ( = ?AUTO_2828 ?AUTO_2827 ) ) ( not ( = ?AUTO_2828 ?AUTO_2831 ) ) ( not ( = ?AUTO_2826 ?AUTO_2827 ) ) ( not ( = ?AUTO_2826 ?AUTO_2831 ) ) ( not ( = ?AUTO_2830 ?AUTO_2827 ) ) ( not ( = ?AUTO_2830 ?AUTO_2831 ) ) ( not ( = ?AUTO_2825 ?AUTO_2827 ) ) ( not ( = ?AUTO_2825 ?AUTO_2831 ) ) ( not ( = ?AUTO_2827 ?AUTO_2831 ) ) ( ON ?AUTO_2827 ?AUTO_2824 ) ( not ( = ?AUTO_2823 ?AUTO_2829 ) ) ( not ( = ?AUTO_2824 ?AUTO_2829 ) ) ( not ( = ?AUTO_2828 ?AUTO_2829 ) ) ( not ( = ?AUTO_2826 ?AUTO_2829 ) ) ( not ( = ?AUTO_2830 ?AUTO_2829 ) ) ( not ( = ?AUTO_2825 ?AUTO_2829 ) ) ( not ( = ?AUTO_2831 ?AUTO_2829 ) ) ( not ( = ?AUTO_2827 ?AUTO_2829 ) ) ( ON ?AUTO_2829 ?AUTO_2827 ) ( ON ?AUTO_2825 ?AUTO_2829 ) ( ON ?AUTO_2826 ?AUTO_2825 ) ( CLEAR ?AUTO_2826 ) ( CLEAR ?AUTO_2828 ) ( ON-TABLE ?AUTO_2830 ) ( CLEAR ?AUTO_2830 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_2830 )
      ( MAKE-ON ?AUTO_2823 ?AUTO_2824 )
      ( MAKE-ON-VERIFY ?AUTO_2823 ?AUTO_2824 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2832 - BLOCK
      ?AUTO_2833 - BLOCK
    )
    :vars
    (
      ?AUTO_2835 - BLOCK
      ?AUTO_2838 - BLOCK
      ?AUTO_2837 - BLOCK
      ?AUTO_2840 - BLOCK
      ?AUTO_2834 - BLOCK
      ?AUTO_2839 - BLOCK
      ?AUTO_2836 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2832 ?AUTO_2833 ) ) ( ON-TABLE ?AUTO_2832 ) ( not ( = ?AUTO_2832 ?AUTO_2835 ) ) ( not ( = ?AUTO_2833 ?AUTO_2835 ) ) ( not ( = ?AUTO_2832 ?AUTO_2838 ) ) ( not ( = ?AUTO_2832 ?AUTO_2837 ) ) ( not ( = ?AUTO_2833 ?AUTO_2838 ) ) ( not ( = ?AUTO_2833 ?AUTO_2837 ) ) ( not ( = ?AUTO_2835 ?AUTO_2838 ) ) ( not ( = ?AUTO_2835 ?AUTO_2837 ) ) ( not ( = ?AUTO_2838 ?AUTO_2837 ) ) ( not ( = ?AUTO_2832 ?AUTO_2840 ) ) ( not ( = ?AUTO_2833 ?AUTO_2840 ) ) ( not ( = ?AUTO_2835 ?AUTO_2840 ) ) ( not ( = ?AUTO_2838 ?AUTO_2840 ) ) ( not ( = ?AUTO_2837 ?AUTO_2840 ) ) ( CLEAR ?AUTO_2834 ) ( not ( = ?AUTO_2832 ?AUTO_2839 ) ) ( not ( = ?AUTO_2832 ?AUTO_2834 ) ) ( not ( = ?AUTO_2833 ?AUTO_2839 ) ) ( not ( = ?AUTO_2833 ?AUTO_2834 ) ) ( not ( = ?AUTO_2835 ?AUTO_2839 ) ) ( not ( = ?AUTO_2835 ?AUTO_2834 ) ) ( not ( = ?AUTO_2838 ?AUTO_2839 ) ) ( not ( = ?AUTO_2838 ?AUTO_2834 ) ) ( not ( = ?AUTO_2837 ?AUTO_2839 ) ) ( not ( = ?AUTO_2837 ?AUTO_2834 ) ) ( not ( = ?AUTO_2840 ?AUTO_2839 ) ) ( not ( = ?AUTO_2840 ?AUTO_2834 ) ) ( not ( = ?AUTO_2839 ?AUTO_2834 ) ) ( ON ?AUTO_2839 ?AUTO_2833 ) ( not ( = ?AUTO_2832 ?AUTO_2836 ) ) ( not ( = ?AUTO_2833 ?AUTO_2836 ) ) ( not ( = ?AUTO_2835 ?AUTO_2836 ) ) ( not ( = ?AUTO_2838 ?AUTO_2836 ) ) ( not ( = ?AUTO_2837 ?AUTO_2836 ) ) ( not ( = ?AUTO_2840 ?AUTO_2836 ) ) ( not ( = ?AUTO_2834 ?AUTO_2836 ) ) ( not ( = ?AUTO_2839 ?AUTO_2836 ) ) ( ON ?AUTO_2836 ?AUTO_2839 ) ( ON ?AUTO_2840 ?AUTO_2836 ) ( ON ?AUTO_2838 ?AUTO_2840 ) ( CLEAR ?AUTO_2838 ) ( ON-TABLE ?AUTO_2837 ) ( CLEAR ?AUTO_2837 ) ( HOLDING ?AUTO_2835 ) ( CLEAR ?AUTO_2832 ) )
    :subtasks
    ( ( !STACK ?AUTO_2835 ?AUTO_2832 )
      ( MAKE-ON ?AUTO_2832 ?AUTO_2833 )
      ( MAKE-ON-VERIFY ?AUTO_2832 ?AUTO_2833 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2841 - BLOCK
      ?AUTO_2842 - BLOCK
    )
    :vars
    (
      ?AUTO_2846 - BLOCK
      ?AUTO_2845 - BLOCK
      ?AUTO_2844 - BLOCK
      ?AUTO_2848 - BLOCK
      ?AUTO_2843 - BLOCK
      ?AUTO_2847 - BLOCK
      ?AUTO_2849 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2841 ?AUTO_2842 ) ) ( ON-TABLE ?AUTO_2841 ) ( not ( = ?AUTO_2841 ?AUTO_2846 ) ) ( not ( = ?AUTO_2842 ?AUTO_2846 ) ) ( not ( = ?AUTO_2841 ?AUTO_2845 ) ) ( not ( = ?AUTO_2841 ?AUTO_2844 ) ) ( not ( = ?AUTO_2842 ?AUTO_2845 ) ) ( not ( = ?AUTO_2842 ?AUTO_2844 ) ) ( not ( = ?AUTO_2846 ?AUTO_2845 ) ) ( not ( = ?AUTO_2846 ?AUTO_2844 ) ) ( not ( = ?AUTO_2845 ?AUTO_2844 ) ) ( not ( = ?AUTO_2841 ?AUTO_2848 ) ) ( not ( = ?AUTO_2842 ?AUTO_2848 ) ) ( not ( = ?AUTO_2846 ?AUTO_2848 ) ) ( not ( = ?AUTO_2845 ?AUTO_2848 ) ) ( not ( = ?AUTO_2844 ?AUTO_2848 ) ) ( CLEAR ?AUTO_2843 ) ( not ( = ?AUTO_2841 ?AUTO_2847 ) ) ( not ( = ?AUTO_2841 ?AUTO_2843 ) ) ( not ( = ?AUTO_2842 ?AUTO_2847 ) ) ( not ( = ?AUTO_2842 ?AUTO_2843 ) ) ( not ( = ?AUTO_2846 ?AUTO_2847 ) ) ( not ( = ?AUTO_2846 ?AUTO_2843 ) ) ( not ( = ?AUTO_2845 ?AUTO_2847 ) ) ( not ( = ?AUTO_2845 ?AUTO_2843 ) ) ( not ( = ?AUTO_2844 ?AUTO_2847 ) ) ( not ( = ?AUTO_2844 ?AUTO_2843 ) ) ( not ( = ?AUTO_2848 ?AUTO_2847 ) ) ( not ( = ?AUTO_2848 ?AUTO_2843 ) ) ( not ( = ?AUTO_2847 ?AUTO_2843 ) ) ( ON ?AUTO_2847 ?AUTO_2842 ) ( not ( = ?AUTO_2841 ?AUTO_2849 ) ) ( not ( = ?AUTO_2842 ?AUTO_2849 ) ) ( not ( = ?AUTO_2846 ?AUTO_2849 ) ) ( not ( = ?AUTO_2845 ?AUTO_2849 ) ) ( not ( = ?AUTO_2844 ?AUTO_2849 ) ) ( not ( = ?AUTO_2848 ?AUTO_2849 ) ) ( not ( = ?AUTO_2843 ?AUTO_2849 ) ) ( not ( = ?AUTO_2847 ?AUTO_2849 ) ) ( ON ?AUTO_2849 ?AUTO_2847 ) ( ON ?AUTO_2848 ?AUTO_2849 ) ( ON ?AUTO_2845 ?AUTO_2848 ) ( CLEAR ?AUTO_2845 ) ( ON-TABLE ?AUTO_2844 ) ( CLEAR ?AUTO_2841 ) ( ON ?AUTO_2846 ?AUTO_2844 ) ( CLEAR ?AUTO_2846 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2846 ?AUTO_2844 )
      ( MAKE-ON ?AUTO_2841 ?AUTO_2842 )
      ( MAKE-ON-VERIFY ?AUTO_2841 ?AUTO_2842 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2856 - BLOCK
      ?AUTO_2857 - BLOCK
    )
    :vars
    (
      ?AUTO_2861 - BLOCK
      ?AUTO_2862 - BLOCK
      ?AUTO_2863 - BLOCK
      ?AUTO_2858 - BLOCK
      ?AUTO_2860 - BLOCK
      ?AUTO_2864 - BLOCK
      ?AUTO_2859 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2856 ?AUTO_2857 ) ) ( ON-TABLE ?AUTO_2856 ) ( not ( = ?AUTO_2856 ?AUTO_2861 ) ) ( not ( = ?AUTO_2857 ?AUTO_2861 ) ) ( not ( = ?AUTO_2856 ?AUTO_2862 ) ) ( not ( = ?AUTO_2856 ?AUTO_2863 ) ) ( not ( = ?AUTO_2857 ?AUTO_2862 ) ) ( not ( = ?AUTO_2857 ?AUTO_2863 ) ) ( not ( = ?AUTO_2861 ?AUTO_2862 ) ) ( not ( = ?AUTO_2861 ?AUTO_2863 ) ) ( not ( = ?AUTO_2862 ?AUTO_2863 ) ) ( not ( = ?AUTO_2856 ?AUTO_2858 ) ) ( not ( = ?AUTO_2857 ?AUTO_2858 ) ) ( not ( = ?AUTO_2861 ?AUTO_2858 ) ) ( not ( = ?AUTO_2862 ?AUTO_2858 ) ) ( not ( = ?AUTO_2863 ?AUTO_2858 ) ) ( not ( = ?AUTO_2856 ?AUTO_2860 ) ) ( not ( = ?AUTO_2856 ?AUTO_2864 ) ) ( not ( = ?AUTO_2857 ?AUTO_2860 ) ) ( not ( = ?AUTO_2857 ?AUTO_2864 ) ) ( not ( = ?AUTO_2861 ?AUTO_2860 ) ) ( not ( = ?AUTO_2861 ?AUTO_2864 ) ) ( not ( = ?AUTO_2862 ?AUTO_2860 ) ) ( not ( = ?AUTO_2862 ?AUTO_2864 ) ) ( not ( = ?AUTO_2863 ?AUTO_2860 ) ) ( not ( = ?AUTO_2863 ?AUTO_2864 ) ) ( not ( = ?AUTO_2858 ?AUTO_2860 ) ) ( not ( = ?AUTO_2858 ?AUTO_2864 ) ) ( not ( = ?AUTO_2860 ?AUTO_2864 ) ) ( ON ?AUTO_2860 ?AUTO_2857 ) ( not ( = ?AUTO_2856 ?AUTO_2859 ) ) ( not ( = ?AUTO_2857 ?AUTO_2859 ) ) ( not ( = ?AUTO_2861 ?AUTO_2859 ) ) ( not ( = ?AUTO_2862 ?AUTO_2859 ) ) ( not ( = ?AUTO_2863 ?AUTO_2859 ) ) ( not ( = ?AUTO_2858 ?AUTO_2859 ) ) ( not ( = ?AUTO_2864 ?AUTO_2859 ) ) ( not ( = ?AUTO_2860 ?AUTO_2859 ) ) ( ON ?AUTO_2859 ?AUTO_2860 ) ( ON ?AUTO_2858 ?AUTO_2859 ) ( ON ?AUTO_2862 ?AUTO_2858 ) ( CLEAR ?AUTO_2862 ) ( ON-TABLE ?AUTO_2863 ) ( CLEAR ?AUTO_2863 ) ( CLEAR ?AUTO_2856 ) ( ON ?AUTO_2861 ?AUTO_2864 ) ( CLEAR ?AUTO_2861 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2861 ?AUTO_2864 )
      ( MAKE-ON ?AUTO_2856 ?AUTO_2857 )
      ( MAKE-ON-VERIFY ?AUTO_2856 ?AUTO_2857 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2925 - BLOCK
      ?AUTO_2926 - BLOCK
    )
    :vars
    (
      ?AUTO_2929 - BLOCK
      ?AUTO_2927 - BLOCK
      ?AUTO_2928 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2925 ?AUTO_2926 ) ) ( ON-TABLE ?AUTO_2925 ) ( not ( = ?AUTO_2925 ?AUTO_2929 ) ) ( not ( = ?AUTO_2926 ?AUTO_2929 ) ) ( ON ?AUTO_2929 ?AUTO_2925 ) ( not ( = ?AUTO_2925 ?AUTO_2927 ) ) ( not ( = ?AUTO_2925 ?AUTO_2928 ) ) ( not ( = ?AUTO_2926 ?AUTO_2927 ) ) ( not ( = ?AUTO_2926 ?AUTO_2928 ) ) ( not ( = ?AUTO_2929 ?AUTO_2927 ) ) ( not ( = ?AUTO_2929 ?AUTO_2928 ) ) ( not ( = ?AUTO_2927 ?AUTO_2928 ) ) ( ON ?AUTO_2927 ?AUTO_2929 ) ( CLEAR ?AUTO_2927 ) ( ON ?AUTO_2928 ?AUTO_2926 ) ( CLEAR ?AUTO_2928 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2928 ?AUTO_2926 )
      ( MAKE-ON ?AUTO_2925 ?AUTO_2926 )
      ( MAKE-ON-VERIFY ?AUTO_2925 ?AUTO_2926 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3035 - BLOCK
      ?AUTO_3036 - BLOCK
    )
    :vars
    (
      ?AUTO_3038 - BLOCK
      ?AUTO_3037 - BLOCK
      ?AUTO_3039 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3035 ?AUTO_3036 ) ) ( ON-TABLE ?AUTO_3035 ) ( not ( = ?AUTO_3035 ?AUTO_3038 ) ) ( not ( = ?AUTO_3035 ?AUTO_3037 ) ) ( not ( = ?AUTO_3036 ?AUTO_3038 ) ) ( not ( = ?AUTO_3036 ?AUTO_3037 ) ) ( not ( = ?AUTO_3038 ?AUTO_3037 ) ) ( ON ?AUTO_3038 ?AUTO_3035 ) ( CLEAR ?AUTO_3038 ) ( not ( = ?AUTO_3035 ?AUTO_3039 ) ) ( not ( = ?AUTO_3036 ?AUTO_3039 ) ) ( not ( = ?AUTO_3038 ?AUTO_3039 ) ) ( not ( = ?AUTO_3037 ?AUTO_3039 ) ) ( ON ?AUTO_3037 ?AUTO_3036 ) ( ON ?AUTO_3039 ?AUTO_3037 ) ( CLEAR ?AUTO_3039 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3039 ?AUTO_3037 )
      ( MAKE-ON ?AUTO_3035 ?AUTO_3036 )
      ( MAKE-ON-VERIFY ?AUTO_3035 ?AUTO_3036 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3152 - BLOCK
      ?AUTO_3153 - BLOCK
    )
    :vars
    (
      ?AUTO_3155 - BLOCK
      ?AUTO_3157 - BLOCK
      ?AUTO_3156 - BLOCK
      ?AUTO_3154 - BLOCK
      ?AUTO_3158 - BLOCK
      ?AUTO_3159 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3152 ?AUTO_3153 ) ) ( ON ?AUTO_3152 ?AUTO_3155 ) ( CLEAR ?AUTO_3152 ) ( not ( = ?AUTO_3152 ?AUTO_3155 ) ) ( not ( = ?AUTO_3153 ?AUTO_3155 ) ) ( CLEAR ?AUTO_3157 ) ( not ( = ?AUTO_3152 ?AUTO_3156 ) ) ( not ( = ?AUTO_3152 ?AUTO_3157 ) ) ( not ( = ?AUTO_3153 ?AUTO_3156 ) ) ( not ( = ?AUTO_3153 ?AUTO_3157 ) ) ( not ( = ?AUTO_3155 ?AUTO_3156 ) ) ( not ( = ?AUTO_3155 ?AUTO_3157 ) ) ( not ( = ?AUTO_3156 ?AUTO_3157 ) ) ( ON ?AUTO_3156 ?AUTO_3153 ) ( not ( = ?AUTO_3152 ?AUTO_3154 ) ) ( not ( = ?AUTO_3153 ?AUTO_3154 ) ) ( not ( = ?AUTO_3155 ?AUTO_3154 ) ) ( not ( = ?AUTO_3157 ?AUTO_3154 ) ) ( not ( = ?AUTO_3156 ?AUTO_3154 ) ) ( ON ?AUTO_3154 ?AUTO_3156 ) ( CLEAR ?AUTO_3154 ) ( HOLDING ?AUTO_3158 ) ( CLEAR ?AUTO_3159 ) ( not ( = ?AUTO_3152 ?AUTO_3158 ) ) ( not ( = ?AUTO_3152 ?AUTO_3159 ) ) ( not ( = ?AUTO_3153 ?AUTO_3158 ) ) ( not ( = ?AUTO_3153 ?AUTO_3159 ) ) ( not ( = ?AUTO_3155 ?AUTO_3158 ) ) ( not ( = ?AUTO_3155 ?AUTO_3159 ) ) ( not ( = ?AUTO_3157 ?AUTO_3158 ) ) ( not ( = ?AUTO_3157 ?AUTO_3159 ) ) ( not ( = ?AUTO_3156 ?AUTO_3158 ) ) ( not ( = ?AUTO_3156 ?AUTO_3159 ) ) ( not ( = ?AUTO_3154 ?AUTO_3158 ) ) ( not ( = ?AUTO_3154 ?AUTO_3159 ) ) ( not ( = ?AUTO_3158 ?AUTO_3159 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3158 ?AUTO_3159 )
      ( MAKE-ON ?AUTO_3152 ?AUTO_3153 )
      ( MAKE-ON-VERIFY ?AUTO_3152 ?AUTO_3153 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3180 - BLOCK
      ?AUTO_3181 - BLOCK
    )
    :vars
    (
      ?AUTO_3186 - BLOCK
      ?AUTO_3183 - BLOCK
      ?AUTO_3182 - BLOCK
      ?AUTO_3185 - BLOCK
      ?AUTO_3184 - BLOCK
      ?AUTO_3187 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3180 ?AUTO_3181 ) ) ( ON ?AUTO_3180 ?AUTO_3186 ) ( not ( = ?AUTO_3180 ?AUTO_3186 ) ) ( not ( = ?AUTO_3181 ?AUTO_3186 ) ) ( not ( = ?AUTO_3180 ?AUTO_3183 ) ) ( not ( = ?AUTO_3180 ?AUTO_3182 ) ) ( not ( = ?AUTO_3181 ?AUTO_3183 ) ) ( not ( = ?AUTO_3181 ?AUTO_3182 ) ) ( not ( = ?AUTO_3186 ?AUTO_3183 ) ) ( not ( = ?AUTO_3186 ?AUTO_3182 ) ) ( not ( = ?AUTO_3183 ?AUTO_3182 ) ) ( ON ?AUTO_3183 ?AUTO_3181 ) ( not ( = ?AUTO_3180 ?AUTO_3185 ) ) ( not ( = ?AUTO_3181 ?AUTO_3185 ) ) ( not ( = ?AUTO_3186 ?AUTO_3185 ) ) ( not ( = ?AUTO_3182 ?AUTO_3185 ) ) ( not ( = ?AUTO_3183 ?AUTO_3185 ) ) ( ON ?AUTO_3185 ?AUTO_3183 ) ( CLEAR ?AUTO_3184 ) ( not ( = ?AUTO_3180 ?AUTO_3187 ) ) ( not ( = ?AUTO_3180 ?AUTO_3184 ) ) ( not ( = ?AUTO_3181 ?AUTO_3187 ) ) ( not ( = ?AUTO_3181 ?AUTO_3184 ) ) ( not ( = ?AUTO_3186 ?AUTO_3187 ) ) ( not ( = ?AUTO_3186 ?AUTO_3184 ) ) ( not ( = ?AUTO_3182 ?AUTO_3187 ) ) ( not ( = ?AUTO_3182 ?AUTO_3184 ) ) ( not ( = ?AUTO_3183 ?AUTO_3187 ) ) ( not ( = ?AUTO_3183 ?AUTO_3184 ) ) ( not ( = ?AUTO_3185 ?AUTO_3187 ) ) ( not ( = ?AUTO_3185 ?AUTO_3184 ) ) ( not ( = ?AUTO_3187 ?AUTO_3184 ) ) ( ON ?AUTO_3187 ?AUTO_3180 ) ( CLEAR ?AUTO_3187 ) ( ON ?AUTO_3182 ?AUTO_3185 ) ( CLEAR ?AUTO_3182 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3182 ?AUTO_3185 )
      ( MAKE-ON ?AUTO_3180 ?AUTO_3181 )
      ( MAKE-ON-VERIFY ?AUTO_3180 ?AUTO_3181 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3453 - BLOCK
      ?AUTO_3454 - BLOCK
    )
    :vars
    (
      ?AUTO_3456 - BLOCK
      ?AUTO_3455 - BLOCK
      ?AUTO_3457 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3453 ?AUTO_3454 ) ) ( ON ?AUTO_3453 ?AUTO_3456 ) ( not ( = ?AUTO_3453 ?AUTO_3456 ) ) ( not ( = ?AUTO_3454 ?AUTO_3456 ) ) ( ON ?AUTO_3454 ?AUTO_3453 ) ( not ( = ?AUTO_3453 ?AUTO_3455 ) ) ( not ( = ?AUTO_3454 ?AUTO_3455 ) ) ( not ( = ?AUTO_3456 ?AUTO_3455 ) ) ( ON ?AUTO_3455 ?AUTO_3454 ) ( CLEAR ?AUTO_3455 ) ( HOLDING ?AUTO_3457 ) ( not ( = ?AUTO_3453 ?AUTO_3457 ) ) ( not ( = ?AUTO_3454 ?AUTO_3457 ) ) ( not ( = ?AUTO_3456 ?AUTO_3457 ) ) ( not ( = ?AUTO_3455 ?AUTO_3457 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3457 )
      ( MAKE-ON ?AUTO_3453 ?AUTO_3454 )
      ( MAKE-ON-VERIFY ?AUTO_3453 ?AUTO_3454 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3260 - BLOCK
      ?AUTO_3261 - BLOCK
    )
    :vars
    (
      ?AUTO_3263 - BLOCK
      ?AUTO_3264 - BLOCK
      ?AUTO_3262 - BLOCK
      ?AUTO_3265 - BLOCK
      ?AUTO_3266 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3260 ?AUTO_3261 ) ) ( ON-TABLE ?AUTO_3260 ) ( CLEAR ?AUTO_3260 ) ( not ( = ?AUTO_3260 ?AUTO_3263 ) ) ( not ( = ?AUTO_3260 ?AUTO_3264 ) ) ( not ( = ?AUTO_3261 ?AUTO_3263 ) ) ( not ( = ?AUTO_3261 ?AUTO_3264 ) ) ( not ( = ?AUTO_3263 ?AUTO_3264 ) ) ( ON ?AUTO_3263 ?AUTO_3261 ) ( CLEAR ?AUTO_3262 ) ( not ( = ?AUTO_3260 ?AUTO_3262 ) ) ( not ( = ?AUTO_3261 ?AUTO_3262 ) ) ( not ( = ?AUTO_3263 ?AUTO_3262 ) ) ( not ( = ?AUTO_3264 ?AUTO_3262 ) ) ( ON ?AUTO_3264 ?AUTO_3263 ) ( CLEAR ?AUTO_3264 ) ( HOLDING ?AUTO_3265 ) ( CLEAR ?AUTO_3266 ) ( not ( = ?AUTO_3260 ?AUTO_3265 ) ) ( not ( = ?AUTO_3260 ?AUTO_3266 ) ) ( not ( = ?AUTO_3261 ?AUTO_3265 ) ) ( not ( = ?AUTO_3261 ?AUTO_3266 ) ) ( not ( = ?AUTO_3263 ?AUTO_3265 ) ) ( not ( = ?AUTO_3263 ?AUTO_3266 ) ) ( not ( = ?AUTO_3264 ?AUTO_3265 ) ) ( not ( = ?AUTO_3264 ?AUTO_3266 ) ) ( not ( = ?AUTO_3262 ?AUTO_3265 ) ) ( not ( = ?AUTO_3262 ?AUTO_3266 ) ) ( not ( = ?AUTO_3265 ?AUTO_3266 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3265 ?AUTO_3266 )
      ( MAKE-ON ?AUTO_3260 ?AUTO_3261 )
      ( MAKE-ON-VERIFY ?AUTO_3260 ?AUTO_3261 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3297 - BLOCK
      ?AUTO_3298 - BLOCK
    )
    :vars
    (
      ?AUTO_3301 - BLOCK
      ?AUTO_3299 - BLOCK
      ?AUTO_3302 - BLOCK
      ?AUTO_3300 - BLOCK
      ?AUTO_3304 - BLOCK
      ?AUTO_3303 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3297 ?AUTO_3298 ) ) ( ON ?AUTO_3297 ?AUTO_3301 ) ( CLEAR ?AUTO_3297 ) ( not ( = ?AUTO_3297 ?AUTO_3301 ) ) ( not ( = ?AUTO_3298 ?AUTO_3301 ) ) ( not ( = ?AUTO_3297 ?AUTO_3299 ) ) ( not ( = ?AUTO_3297 ?AUTO_3302 ) ) ( not ( = ?AUTO_3298 ?AUTO_3299 ) ) ( not ( = ?AUTO_3298 ?AUTO_3302 ) ) ( not ( = ?AUTO_3301 ?AUTO_3299 ) ) ( not ( = ?AUTO_3301 ?AUTO_3302 ) ) ( not ( = ?AUTO_3299 ?AUTO_3302 ) ) ( ON ?AUTO_3299 ?AUTO_3298 ) ( not ( = ?AUTO_3297 ?AUTO_3300 ) ) ( not ( = ?AUTO_3298 ?AUTO_3300 ) ) ( not ( = ?AUTO_3301 ?AUTO_3300 ) ) ( not ( = ?AUTO_3302 ?AUTO_3300 ) ) ( not ( = ?AUTO_3299 ?AUTO_3300 ) ) ( ON ?AUTO_3300 ?AUTO_3299 ) ( CLEAR ?AUTO_3304 ) ( not ( = ?AUTO_3297 ?AUTO_3303 ) ) ( not ( = ?AUTO_3297 ?AUTO_3304 ) ) ( not ( = ?AUTO_3298 ?AUTO_3303 ) ) ( not ( = ?AUTO_3298 ?AUTO_3304 ) ) ( not ( = ?AUTO_3301 ?AUTO_3303 ) ) ( not ( = ?AUTO_3301 ?AUTO_3304 ) ) ( not ( = ?AUTO_3302 ?AUTO_3303 ) ) ( not ( = ?AUTO_3302 ?AUTO_3304 ) ) ( not ( = ?AUTO_3299 ?AUTO_3303 ) ) ( not ( = ?AUTO_3299 ?AUTO_3304 ) ) ( not ( = ?AUTO_3300 ?AUTO_3303 ) ) ( not ( = ?AUTO_3300 ?AUTO_3304 ) ) ( not ( = ?AUTO_3303 ?AUTO_3304 ) ) ( ON ?AUTO_3303 ?AUTO_3300 ) ( CLEAR ?AUTO_3303 ) ( HOLDING ?AUTO_3302 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3302 )
      ( MAKE-ON ?AUTO_3297 ?AUTO_3298 )
      ( MAKE-ON-VERIFY ?AUTO_3297 ?AUTO_3298 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3356 - BLOCK
      ?AUTO_3357 - BLOCK
    )
    :vars
    (
      ?AUTO_3359 - BLOCK
      ?AUTO_3360 - BLOCK
      ?AUTO_3361 - BLOCK
      ?AUTO_3358 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3356 ?AUTO_3357 ) ) ( ON ?AUTO_3356 ?AUTO_3359 ) ( not ( = ?AUTO_3356 ?AUTO_3359 ) ) ( not ( = ?AUTO_3357 ?AUTO_3359 ) ) ( not ( = ?AUTO_3356 ?AUTO_3360 ) ) ( not ( = ?AUTO_3357 ?AUTO_3360 ) ) ( not ( = ?AUTO_3359 ?AUTO_3360 ) ) ( ON ?AUTO_3360 ?AUTO_3356 ) ( CLEAR ?AUTO_3360 ) ( CLEAR ?AUTO_3361 ) ( not ( = ?AUTO_3356 ?AUTO_3358 ) ) ( not ( = ?AUTO_3356 ?AUTO_3361 ) ) ( not ( = ?AUTO_3357 ?AUTO_3358 ) ) ( not ( = ?AUTO_3357 ?AUTO_3361 ) ) ( not ( = ?AUTO_3359 ?AUTO_3358 ) ) ( not ( = ?AUTO_3359 ?AUTO_3361 ) ) ( not ( = ?AUTO_3360 ?AUTO_3358 ) ) ( not ( = ?AUTO_3360 ?AUTO_3361 ) ) ( not ( = ?AUTO_3358 ?AUTO_3361 ) ) ( ON ?AUTO_3358 ?AUTO_3357 ) ( CLEAR ?AUTO_3358 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3358 ?AUTO_3357 )
      ( MAKE-ON ?AUTO_3356 ?AUTO_3357 )
      ( MAKE-ON-VERIFY ?AUTO_3356 ?AUTO_3357 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3394 - BLOCK
      ?AUTO_3395 - BLOCK
    )
    :vars
    (
      ?AUTO_3396 - BLOCK
      ?AUTO_3397 - BLOCK
      ?AUTO_3398 - BLOCK
      ?AUTO_3399 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3394 ?AUTO_3395 ) ) ( ON-TABLE ?AUTO_3394 ) ( CLEAR ?AUTO_3396 ) ( not ( = ?AUTO_3394 ?AUTO_3396 ) ) ( not ( = ?AUTO_3395 ?AUTO_3396 ) ) ( ON ?AUTO_3395 ?AUTO_3394 ) ( not ( = ?AUTO_3394 ?AUTO_3397 ) ) ( not ( = ?AUTO_3395 ?AUTO_3397 ) ) ( not ( = ?AUTO_3396 ?AUTO_3397 ) ) ( ON ?AUTO_3397 ?AUTO_3395 ) ( CLEAR ?AUTO_3397 ) ( HOLDING ?AUTO_3398 ) ( CLEAR ?AUTO_3399 ) ( not ( = ?AUTO_3394 ?AUTO_3398 ) ) ( not ( = ?AUTO_3394 ?AUTO_3399 ) ) ( not ( = ?AUTO_3395 ?AUTO_3398 ) ) ( not ( = ?AUTO_3395 ?AUTO_3399 ) ) ( not ( = ?AUTO_3396 ?AUTO_3398 ) ) ( not ( = ?AUTO_3396 ?AUTO_3399 ) ) ( not ( = ?AUTO_3397 ?AUTO_3398 ) ) ( not ( = ?AUTO_3397 ?AUTO_3399 ) ) ( not ( = ?AUTO_3398 ?AUTO_3399 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3398 ?AUTO_3399 )
      ( MAKE-ON ?AUTO_3394 ?AUTO_3395 )
      ( MAKE-ON-VERIFY ?AUTO_3394 ?AUTO_3395 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3458 - BLOCK
      ?AUTO_3459 - BLOCK
    )
    :vars
    (
      ?AUTO_3462 - BLOCK
      ?AUTO_3460 - BLOCK
      ?AUTO_3461 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3458 ?AUTO_3459 ) ) ( ON ?AUTO_3458 ?AUTO_3462 ) ( not ( = ?AUTO_3458 ?AUTO_3462 ) ) ( not ( = ?AUTO_3459 ?AUTO_3462 ) ) ( ON ?AUTO_3459 ?AUTO_3458 ) ( not ( = ?AUTO_3458 ?AUTO_3460 ) ) ( not ( = ?AUTO_3459 ?AUTO_3460 ) ) ( not ( = ?AUTO_3462 ?AUTO_3460 ) ) ( ON ?AUTO_3460 ?AUTO_3459 ) ( not ( = ?AUTO_3458 ?AUTO_3461 ) ) ( not ( = ?AUTO_3459 ?AUTO_3461 ) ) ( not ( = ?AUTO_3462 ?AUTO_3461 ) ) ( not ( = ?AUTO_3460 ?AUTO_3461 ) ) ( ON ?AUTO_3461 ?AUTO_3460 ) ( CLEAR ?AUTO_3461 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3461 ?AUTO_3460 )
      ( MAKE-ON ?AUTO_3458 ?AUTO_3459 )
      ( MAKE-ON-VERIFY ?AUTO_3458 ?AUTO_3459 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3583 - BLOCK
      ?AUTO_3584 - BLOCK
    )
    :vars
    (
      ?AUTO_3586 - BLOCK
      ?AUTO_3589 - BLOCK
      ?AUTO_3588 - BLOCK
      ?AUTO_3590 - BLOCK
      ?AUTO_3587 - BLOCK
      ?AUTO_3585 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3583 ?AUTO_3584 ) ) ( ON ?AUTO_3583 ?AUTO_3586 ) ( CLEAR ?AUTO_3583 ) ( not ( = ?AUTO_3583 ?AUTO_3586 ) ) ( not ( = ?AUTO_3584 ?AUTO_3586 ) ) ( CLEAR ?AUTO_3589 ) ( not ( = ?AUTO_3583 ?AUTO_3588 ) ) ( not ( = ?AUTO_3583 ?AUTO_3589 ) ) ( not ( = ?AUTO_3584 ?AUTO_3588 ) ) ( not ( = ?AUTO_3584 ?AUTO_3589 ) ) ( not ( = ?AUTO_3586 ?AUTO_3588 ) ) ( not ( = ?AUTO_3586 ?AUTO_3589 ) ) ( not ( = ?AUTO_3588 ?AUTO_3589 ) ) ( ON ?AUTO_3588 ?AUTO_3584 ) ( not ( = ?AUTO_3583 ?AUTO_3590 ) ) ( not ( = ?AUTO_3584 ?AUTO_3590 ) ) ( not ( = ?AUTO_3586 ?AUTO_3590 ) ) ( not ( = ?AUTO_3589 ?AUTO_3590 ) ) ( not ( = ?AUTO_3588 ?AUTO_3590 ) ) ( ON ?AUTO_3590 ?AUTO_3588 ) ( not ( = ?AUTO_3583 ?AUTO_3587 ) ) ( not ( = ?AUTO_3584 ?AUTO_3587 ) ) ( not ( = ?AUTO_3586 ?AUTO_3587 ) ) ( not ( = ?AUTO_3589 ?AUTO_3587 ) ) ( not ( = ?AUTO_3588 ?AUTO_3587 ) ) ( not ( = ?AUTO_3590 ?AUTO_3587 ) ) ( ON ?AUTO_3587 ?AUTO_3590 ) ( not ( = ?AUTO_3583 ?AUTO_3585 ) ) ( not ( = ?AUTO_3584 ?AUTO_3585 ) ) ( not ( = ?AUTO_3586 ?AUTO_3585 ) ) ( not ( = ?AUTO_3589 ?AUTO_3585 ) ) ( not ( = ?AUTO_3588 ?AUTO_3585 ) ) ( not ( = ?AUTO_3590 ?AUTO_3585 ) ) ( not ( = ?AUTO_3587 ?AUTO_3585 ) ) ( ON ?AUTO_3585 ?AUTO_3587 ) ( CLEAR ?AUTO_3585 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3585 ?AUTO_3587 )
      ( MAKE-ON ?AUTO_3583 ?AUTO_3584 )
      ( MAKE-ON-VERIFY ?AUTO_3583 ?AUTO_3584 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3930 - BLOCK
      ?AUTO_3931 - BLOCK
    )
    :vars
    (
      ?AUTO_3934 - BLOCK
      ?AUTO_3932 - BLOCK
      ?AUTO_3933 - BLOCK
      ?AUTO_3935 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3930 ?AUTO_3931 ) ) ( ON-TABLE ?AUTO_3930 ) ( not ( = ?AUTO_3930 ?AUTO_3934 ) ) ( not ( = ?AUTO_3930 ?AUTO_3932 ) ) ( not ( = ?AUTO_3931 ?AUTO_3934 ) ) ( not ( = ?AUTO_3931 ?AUTO_3932 ) ) ( not ( = ?AUTO_3934 ?AUTO_3932 ) ) ( CLEAR ?AUTO_3933 ) ( not ( = ?AUTO_3930 ?AUTO_3933 ) ) ( not ( = ?AUTO_3931 ?AUTO_3933 ) ) ( not ( = ?AUTO_3934 ?AUTO_3933 ) ) ( not ( = ?AUTO_3932 ?AUTO_3933 ) ) ( ON ?AUTO_3932 ?AUTO_3931 ) ( not ( = ?AUTO_3930 ?AUTO_3935 ) ) ( not ( = ?AUTO_3931 ?AUTO_3935 ) ) ( not ( = ?AUTO_3934 ?AUTO_3935 ) ) ( not ( = ?AUTO_3932 ?AUTO_3935 ) ) ( not ( = ?AUTO_3933 ?AUTO_3935 ) ) ( ON ?AUTO_3935 ?AUTO_3932 ) ( CLEAR ?AUTO_3935 ) ( HOLDING ?AUTO_3934 ) ( CLEAR ?AUTO_3930 ) )
    :subtasks
    ( ( !STACK ?AUTO_3934 ?AUTO_3930 )
      ( MAKE-ON ?AUTO_3930 ?AUTO_3931 )
      ( MAKE-ON-VERIFY ?AUTO_3930 ?AUTO_3931 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3942 - BLOCK
      ?AUTO_3943 - BLOCK
    )
    :vars
    (
      ?AUTO_3946 - BLOCK
      ?AUTO_3947 - BLOCK
      ?AUTO_3944 - BLOCK
      ?AUTO_3945 - BLOCK
      ?AUTO_3948 - BLOCK
      ?AUTO_3949 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3942 ?AUTO_3943 ) ) ( ON-TABLE ?AUTO_3942 ) ( not ( = ?AUTO_3942 ?AUTO_3946 ) ) ( not ( = ?AUTO_3942 ?AUTO_3947 ) ) ( not ( = ?AUTO_3943 ?AUTO_3946 ) ) ( not ( = ?AUTO_3943 ?AUTO_3947 ) ) ( not ( = ?AUTO_3946 ?AUTO_3947 ) ) ( CLEAR ?AUTO_3944 ) ( not ( = ?AUTO_3942 ?AUTO_3944 ) ) ( not ( = ?AUTO_3943 ?AUTO_3944 ) ) ( not ( = ?AUTO_3946 ?AUTO_3944 ) ) ( not ( = ?AUTO_3947 ?AUTO_3944 ) ) ( ON ?AUTO_3947 ?AUTO_3943 ) ( not ( = ?AUTO_3942 ?AUTO_3945 ) ) ( not ( = ?AUTO_3943 ?AUTO_3945 ) ) ( not ( = ?AUTO_3946 ?AUTO_3945 ) ) ( not ( = ?AUTO_3947 ?AUTO_3945 ) ) ( not ( = ?AUTO_3944 ?AUTO_3945 ) ) ( ON ?AUTO_3945 ?AUTO_3947 ) ( CLEAR ?AUTO_3942 ) ( ON ?AUTO_3946 ?AUTO_3945 ) ( CLEAR ?AUTO_3946 ) ( HOLDING ?AUTO_3948 ) ( CLEAR ?AUTO_3949 ) ( not ( = ?AUTO_3942 ?AUTO_3948 ) ) ( not ( = ?AUTO_3942 ?AUTO_3949 ) ) ( not ( = ?AUTO_3943 ?AUTO_3948 ) ) ( not ( = ?AUTO_3943 ?AUTO_3949 ) ) ( not ( = ?AUTO_3946 ?AUTO_3948 ) ) ( not ( = ?AUTO_3946 ?AUTO_3949 ) ) ( not ( = ?AUTO_3947 ?AUTO_3948 ) ) ( not ( = ?AUTO_3947 ?AUTO_3949 ) ) ( not ( = ?AUTO_3944 ?AUTO_3948 ) ) ( not ( = ?AUTO_3944 ?AUTO_3949 ) ) ( not ( = ?AUTO_3945 ?AUTO_3948 ) ) ( not ( = ?AUTO_3945 ?AUTO_3949 ) ) ( not ( = ?AUTO_3948 ?AUTO_3949 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3948 ?AUTO_3949 )
      ( MAKE-ON ?AUTO_3942 ?AUTO_3943 )
      ( MAKE-ON-VERIFY ?AUTO_3942 ?AUTO_3943 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3994 - BLOCK
      ?AUTO_3995 - BLOCK
    )
    :vars
    (
      ?AUTO_4002 - BLOCK
      ?AUTO_3997 - BLOCK
      ?AUTO_4003 - BLOCK
      ?AUTO_3998 - BLOCK
      ?AUTO_3996 - BLOCK
      ?AUTO_4000 - BLOCK
      ?AUTO_4001 - BLOCK
      ?AUTO_3999 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3994 ?AUTO_3995 ) ) ( ON-TABLE ?AUTO_3994 ) ( not ( = ?AUTO_3994 ?AUTO_4002 ) ) ( not ( = ?AUTO_3994 ?AUTO_3997 ) ) ( not ( = ?AUTO_3995 ?AUTO_4002 ) ) ( not ( = ?AUTO_3995 ?AUTO_3997 ) ) ( not ( = ?AUTO_4002 ?AUTO_3997 ) ) ( CLEAR ?AUTO_4003 ) ( not ( = ?AUTO_3994 ?AUTO_4003 ) ) ( not ( = ?AUTO_3995 ?AUTO_4003 ) ) ( not ( = ?AUTO_4002 ?AUTO_4003 ) ) ( not ( = ?AUTO_3997 ?AUTO_4003 ) ) ( ON ?AUTO_3997 ?AUTO_3995 ) ( not ( = ?AUTO_3994 ?AUTO_3998 ) ) ( not ( = ?AUTO_3995 ?AUTO_3998 ) ) ( not ( = ?AUTO_4002 ?AUTO_3998 ) ) ( not ( = ?AUTO_3997 ?AUTO_3998 ) ) ( not ( = ?AUTO_4003 ?AUTO_3998 ) ) ( ON ?AUTO_3998 ?AUTO_3997 ) ( ON ?AUTO_4002 ?AUTO_3998 ) ( CLEAR ?AUTO_4002 ) ( CLEAR ?AUTO_3996 ) ( not ( = ?AUTO_3994 ?AUTO_4000 ) ) ( not ( = ?AUTO_3994 ?AUTO_3996 ) ) ( not ( = ?AUTO_3995 ?AUTO_4000 ) ) ( not ( = ?AUTO_3995 ?AUTO_3996 ) ) ( not ( = ?AUTO_4002 ?AUTO_4000 ) ) ( not ( = ?AUTO_4002 ?AUTO_3996 ) ) ( not ( = ?AUTO_3997 ?AUTO_4000 ) ) ( not ( = ?AUTO_3997 ?AUTO_3996 ) ) ( not ( = ?AUTO_4003 ?AUTO_4000 ) ) ( not ( = ?AUTO_4003 ?AUTO_3996 ) ) ( not ( = ?AUTO_3998 ?AUTO_4000 ) ) ( not ( = ?AUTO_3998 ?AUTO_3996 ) ) ( not ( = ?AUTO_4000 ?AUTO_3996 ) ) ( ON ?AUTO_4000 ?AUTO_3994 ) ( not ( = ?AUTO_3994 ?AUTO_4001 ) ) ( not ( = ?AUTO_3995 ?AUTO_4001 ) ) ( not ( = ?AUTO_4002 ?AUTO_4001 ) ) ( not ( = ?AUTO_3997 ?AUTO_4001 ) ) ( not ( = ?AUTO_4003 ?AUTO_4001 ) ) ( not ( = ?AUTO_3998 ?AUTO_4001 ) ) ( not ( = ?AUTO_3996 ?AUTO_4001 ) ) ( not ( = ?AUTO_4000 ?AUTO_4001 ) ) ( ON ?AUTO_4001 ?AUTO_4000 ) ( not ( = ?AUTO_3994 ?AUTO_3999 ) ) ( not ( = ?AUTO_3995 ?AUTO_3999 ) ) ( not ( = ?AUTO_4002 ?AUTO_3999 ) ) ( not ( = ?AUTO_3997 ?AUTO_3999 ) ) ( not ( = ?AUTO_4003 ?AUTO_3999 ) ) ( not ( = ?AUTO_3998 ?AUTO_3999 ) ) ( not ( = ?AUTO_3996 ?AUTO_3999 ) ) ( not ( = ?AUTO_4000 ?AUTO_3999 ) ) ( not ( = ?AUTO_4001 ?AUTO_3999 ) ) ( ON ?AUTO_3999 ?AUTO_4001 ) ( CLEAR ?AUTO_3999 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3999 ?AUTO_4001 )
      ( MAKE-ON ?AUTO_3994 ?AUTO_3995 )
      ( MAKE-ON-VERIFY ?AUTO_3994 ?AUTO_3995 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4004 - BLOCK
      ?AUTO_4005 - BLOCK
    )
    :vars
    (
      ?AUTO_4012 - BLOCK
      ?AUTO_4009 - BLOCK
      ?AUTO_4008 - BLOCK
      ?AUTO_4007 - BLOCK
      ?AUTO_4010 - BLOCK
      ?AUTO_4011 - BLOCK
      ?AUTO_4006 - BLOCK
      ?AUTO_4013 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4004 ?AUTO_4005 ) ) ( ON-TABLE ?AUTO_4004 ) ( not ( = ?AUTO_4004 ?AUTO_4012 ) ) ( not ( = ?AUTO_4004 ?AUTO_4009 ) ) ( not ( = ?AUTO_4005 ?AUTO_4012 ) ) ( not ( = ?AUTO_4005 ?AUTO_4009 ) ) ( not ( = ?AUTO_4012 ?AUTO_4009 ) ) ( not ( = ?AUTO_4004 ?AUTO_4008 ) ) ( not ( = ?AUTO_4005 ?AUTO_4008 ) ) ( not ( = ?AUTO_4012 ?AUTO_4008 ) ) ( not ( = ?AUTO_4009 ?AUTO_4008 ) ) ( ON ?AUTO_4009 ?AUTO_4005 ) ( not ( = ?AUTO_4004 ?AUTO_4007 ) ) ( not ( = ?AUTO_4005 ?AUTO_4007 ) ) ( not ( = ?AUTO_4012 ?AUTO_4007 ) ) ( not ( = ?AUTO_4009 ?AUTO_4007 ) ) ( not ( = ?AUTO_4008 ?AUTO_4007 ) ) ( ON ?AUTO_4007 ?AUTO_4009 ) ( ON ?AUTO_4012 ?AUTO_4007 ) ( CLEAR ?AUTO_4012 ) ( CLEAR ?AUTO_4010 ) ( not ( = ?AUTO_4004 ?AUTO_4011 ) ) ( not ( = ?AUTO_4004 ?AUTO_4010 ) ) ( not ( = ?AUTO_4005 ?AUTO_4011 ) ) ( not ( = ?AUTO_4005 ?AUTO_4010 ) ) ( not ( = ?AUTO_4012 ?AUTO_4011 ) ) ( not ( = ?AUTO_4012 ?AUTO_4010 ) ) ( not ( = ?AUTO_4009 ?AUTO_4011 ) ) ( not ( = ?AUTO_4009 ?AUTO_4010 ) ) ( not ( = ?AUTO_4008 ?AUTO_4011 ) ) ( not ( = ?AUTO_4008 ?AUTO_4010 ) ) ( not ( = ?AUTO_4007 ?AUTO_4011 ) ) ( not ( = ?AUTO_4007 ?AUTO_4010 ) ) ( not ( = ?AUTO_4011 ?AUTO_4010 ) ) ( ON ?AUTO_4011 ?AUTO_4004 ) ( not ( = ?AUTO_4004 ?AUTO_4006 ) ) ( not ( = ?AUTO_4005 ?AUTO_4006 ) ) ( not ( = ?AUTO_4012 ?AUTO_4006 ) ) ( not ( = ?AUTO_4009 ?AUTO_4006 ) ) ( not ( = ?AUTO_4008 ?AUTO_4006 ) ) ( not ( = ?AUTO_4007 ?AUTO_4006 ) ) ( not ( = ?AUTO_4010 ?AUTO_4006 ) ) ( not ( = ?AUTO_4011 ?AUTO_4006 ) ) ( ON ?AUTO_4006 ?AUTO_4011 ) ( not ( = ?AUTO_4004 ?AUTO_4013 ) ) ( not ( = ?AUTO_4005 ?AUTO_4013 ) ) ( not ( = ?AUTO_4012 ?AUTO_4013 ) ) ( not ( = ?AUTO_4009 ?AUTO_4013 ) ) ( not ( = ?AUTO_4008 ?AUTO_4013 ) ) ( not ( = ?AUTO_4007 ?AUTO_4013 ) ) ( not ( = ?AUTO_4010 ?AUTO_4013 ) ) ( not ( = ?AUTO_4011 ?AUTO_4013 ) ) ( not ( = ?AUTO_4006 ?AUTO_4013 ) ) ( ON ?AUTO_4013 ?AUTO_4006 ) ( CLEAR ?AUTO_4013 ) ( HOLDING ?AUTO_4008 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4008 )
      ( MAKE-ON ?AUTO_4004 ?AUTO_4005 )
      ( MAKE-ON-VERIFY ?AUTO_4004 ?AUTO_4005 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4014 - BLOCK
      ?AUTO_4015 - BLOCK
    )
    :vars
    (
      ?AUTO_4020 - BLOCK
      ?AUTO_4016 - BLOCK
      ?AUTO_4018 - BLOCK
      ?AUTO_4022 - BLOCK
      ?AUTO_4019 - BLOCK
      ?AUTO_4017 - BLOCK
      ?AUTO_4021 - BLOCK
      ?AUTO_4023 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4014 ?AUTO_4015 ) ) ( ON-TABLE ?AUTO_4014 ) ( not ( = ?AUTO_4014 ?AUTO_4020 ) ) ( not ( = ?AUTO_4014 ?AUTO_4016 ) ) ( not ( = ?AUTO_4015 ?AUTO_4020 ) ) ( not ( = ?AUTO_4015 ?AUTO_4016 ) ) ( not ( = ?AUTO_4020 ?AUTO_4016 ) ) ( not ( = ?AUTO_4014 ?AUTO_4018 ) ) ( not ( = ?AUTO_4015 ?AUTO_4018 ) ) ( not ( = ?AUTO_4020 ?AUTO_4018 ) ) ( not ( = ?AUTO_4016 ?AUTO_4018 ) ) ( ON ?AUTO_4016 ?AUTO_4015 ) ( not ( = ?AUTO_4014 ?AUTO_4022 ) ) ( not ( = ?AUTO_4015 ?AUTO_4022 ) ) ( not ( = ?AUTO_4020 ?AUTO_4022 ) ) ( not ( = ?AUTO_4016 ?AUTO_4022 ) ) ( not ( = ?AUTO_4018 ?AUTO_4022 ) ) ( ON ?AUTO_4022 ?AUTO_4016 ) ( ON ?AUTO_4020 ?AUTO_4022 ) ( CLEAR ?AUTO_4020 ) ( CLEAR ?AUTO_4019 ) ( not ( = ?AUTO_4014 ?AUTO_4017 ) ) ( not ( = ?AUTO_4014 ?AUTO_4019 ) ) ( not ( = ?AUTO_4015 ?AUTO_4017 ) ) ( not ( = ?AUTO_4015 ?AUTO_4019 ) ) ( not ( = ?AUTO_4020 ?AUTO_4017 ) ) ( not ( = ?AUTO_4020 ?AUTO_4019 ) ) ( not ( = ?AUTO_4016 ?AUTO_4017 ) ) ( not ( = ?AUTO_4016 ?AUTO_4019 ) ) ( not ( = ?AUTO_4018 ?AUTO_4017 ) ) ( not ( = ?AUTO_4018 ?AUTO_4019 ) ) ( not ( = ?AUTO_4022 ?AUTO_4017 ) ) ( not ( = ?AUTO_4022 ?AUTO_4019 ) ) ( not ( = ?AUTO_4017 ?AUTO_4019 ) ) ( ON ?AUTO_4017 ?AUTO_4014 ) ( not ( = ?AUTO_4014 ?AUTO_4021 ) ) ( not ( = ?AUTO_4015 ?AUTO_4021 ) ) ( not ( = ?AUTO_4020 ?AUTO_4021 ) ) ( not ( = ?AUTO_4016 ?AUTO_4021 ) ) ( not ( = ?AUTO_4018 ?AUTO_4021 ) ) ( not ( = ?AUTO_4022 ?AUTO_4021 ) ) ( not ( = ?AUTO_4019 ?AUTO_4021 ) ) ( not ( = ?AUTO_4017 ?AUTO_4021 ) ) ( ON ?AUTO_4021 ?AUTO_4017 ) ( not ( = ?AUTO_4014 ?AUTO_4023 ) ) ( not ( = ?AUTO_4015 ?AUTO_4023 ) ) ( not ( = ?AUTO_4020 ?AUTO_4023 ) ) ( not ( = ?AUTO_4016 ?AUTO_4023 ) ) ( not ( = ?AUTO_4018 ?AUTO_4023 ) ) ( not ( = ?AUTO_4022 ?AUTO_4023 ) ) ( not ( = ?AUTO_4019 ?AUTO_4023 ) ) ( not ( = ?AUTO_4017 ?AUTO_4023 ) ) ( not ( = ?AUTO_4021 ?AUTO_4023 ) ) ( ON ?AUTO_4023 ?AUTO_4021 ) ( ON ?AUTO_4018 ?AUTO_4023 ) ( CLEAR ?AUTO_4018 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4018 ?AUTO_4023 )
      ( MAKE-ON ?AUTO_4014 ?AUTO_4015 )
      ( MAKE-ON-VERIFY ?AUTO_4014 ?AUTO_4015 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4114 - BLOCK
      ?AUTO_4115 - BLOCK
    )
    :vars
    (
      ?AUTO_4116 - BLOCK
      ?AUTO_4118 - BLOCK
      ?AUTO_4117 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4114 ?AUTO_4115 ) ) ( not ( = ?AUTO_4114 ?AUTO_4116 ) ) ( not ( = ?AUTO_4115 ?AUTO_4116 ) ) ( ON ?AUTO_4116 ?AUTO_4115 ) ( not ( = ?AUTO_4114 ?AUTO_4118 ) ) ( not ( = ?AUTO_4115 ?AUTO_4118 ) ) ( not ( = ?AUTO_4116 ?AUTO_4118 ) ) ( ON ?AUTO_4118 ?AUTO_4116 ) ( not ( = ?AUTO_4114 ?AUTO_4117 ) ) ( not ( = ?AUTO_4115 ?AUTO_4117 ) ) ( not ( = ?AUTO_4116 ?AUTO_4117 ) ) ( not ( = ?AUTO_4118 ?AUTO_4117 ) ) ( ON ?AUTO_4117 ?AUTO_4118 ) ( CLEAR ?AUTO_4117 ) ( HOLDING ?AUTO_4114 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4114 )
      ( MAKE-ON ?AUTO_4114 ?AUTO_4115 )
      ( MAKE-ON-VERIFY ?AUTO_4114 ?AUTO_4115 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4234 - BLOCK
      ?AUTO_4235 - BLOCK
    )
    :vars
    (
      ?AUTO_4237 - BLOCK
      ?AUTO_4239 - BLOCK
      ?AUTO_4238 - BLOCK
      ?AUTO_4236 - BLOCK
      ?AUTO_4240 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4235 ) ( not ( = ?AUTO_4234 ?AUTO_4235 ) ) ( ON ?AUTO_4234 ?AUTO_4237 ) ( not ( = ?AUTO_4234 ?AUTO_4237 ) ) ( not ( = ?AUTO_4235 ?AUTO_4237 ) ) ( not ( = ?AUTO_4234 ?AUTO_4239 ) ) ( not ( = ?AUTO_4234 ?AUTO_4238 ) ) ( not ( = ?AUTO_4235 ?AUTO_4239 ) ) ( not ( = ?AUTO_4235 ?AUTO_4238 ) ) ( not ( = ?AUTO_4237 ?AUTO_4239 ) ) ( not ( = ?AUTO_4237 ?AUTO_4238 ) ) ( not ( = ?AUTO_4239 ?AUTO_4238 ) ) ( ON ?AUTO_4239 ?AUTO_4234 ) ( not ( = ?AUTO_4234 ?AUTO_4236 ) ) ( not ( = ?AUTO_4234 ?AUTO_4240 ) ) ( not ( = ?AUTO_4235 ?AUTO_4236 ) ) ( not ( = ?AUTO_4235 ?AUTO_4240 ) ) ( not ( = ?AUTO_4237 ?AUTO_4236 ) ) ( not ( = ?AUTO_4237 ?AUTO_4240 ) ) ( not ( = ?AUTO_4238 ?AUTO_4236 ) ) ( not ( = ?AUTO_4238 ?AUTO_4240 ) ) ( not ( = ?AUTO_4239 ?AUTO_4236 ) ) ( not ( = ?AUTO_4239 ?AUTO_4240 ) ) ( not ( = ?AUTO_4236 ?AUTO_4240 ) ) ( ON ?AUTO_4236 ?AUTO_4239 ) ( CLEAR ?AUTO_4236 ) ( ON ?AUTO_4238 ?AUTO_4240 ) ( CLEAR ?AUTO_4238 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4238 ?AUTO_4240 )
      ( MAKE-ON ?AUTO_4234 ?AUTO_4235 )
      ( MAKE-ON-VERIFY ?AUTO_4234 ?AUTO_4235 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4307 - BLOCK
      ?AUTO_4308 - BLOCK
    )
    :vars
    (
      ?AUTO_4309 - BLOCK
      ?AUTO_4314 - BLOCK
      ?AUTO_4311 - BLOCK
      ?AUTO_4313 - BLOCK
      ?AUTO_4310 - BLOCK
      ?AUTO_4312 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4307 ?AUTO_4308 ) ) ( ON-TABLE ?AUTO_4307 ) ( not ( = ?AUTO_4307 ?AUTO_4309 ) ) ( not ( = ?AUTO_4307 ?AUTO_4314 ) ) ( not ( = ?AUTO_4308 ?AUTO_4309 ) ) ( not ( = ?AUTO_4308 ?AUTO_4314 ) ) ( not ( = ?AUTO_4309 ?AUTO_4314 ) ) ( ON ?AUTO_4309 ?AUTO_4307 ) ( not ( = ?AUTO_4307 ?AUTO_4311 ) ) ( not ( = ?AUTO_4307 ?AUTO_4313 ) ) ( not ( = ?AUTO_4308 ?AUTO_4311 ) ) ( not ( = ?AUTO_4308 ?AUTO_4313 ) ) ( not ( = ?AUTO_4314 ?AUTO_4311 ) ) ( not ( = ?AUTO_4314 ?AUTO_4313 ) ) ( not ( = ?AUTO_4309 ?AUTO_4311 ) ) ( not ( = ?AUTO_4309 ?AUTO_4313 ) ) ( not ( = ?AUTO_4311 ?AUTO_4313 ) ) ( ON ?AUTO_4311 ?AUTO_4309 ) ( not ( = ?AUTO_4307 ?AUTO_4310 ) ) ( not ( = ?AUTO_4307 ?AUTO_4312 ) ) ( not ( = ?AUTO_4308 ?AUTO_4310 ) ) ( not ( = ?AUTO_4308 ?AUTO_4312 ) ) ( not ( = ?AUTO_4314 ?AUTO_4310 ) ) ( not ( = ?AUTO_4314 ?AUTO_4312 ) ) ( not ( = ?AUTO_4309 ?AUTO_4310 ) ) ( not ( = ?AUTO_4309 ?AUTO_4312 ) ) ( not ( = ?AUTO_4313 ?AUTO_4310 ) ) ( not ( = ?AUTO_4313 ?AUTO_4312 ) ) ( not ( = ?AUTO_4311 ?AUTO_4310 ) ) ( not ( = ?AUTO_4311 ?AUTO_4312 ) ) ( not ( = ?AUTO_4310 ?AUTO_4312 ) ) ( ON ?AUTO_4310 ?AUTO_4311 ) ( CLEAR ?AUTO_4310 ) ( ON ?AUTO_4314 ?AUTO_4308 ) ( CLEAR ?AUTO_4314 ) ( ON ?AUTO_4312 ?AUTO_4313 ) ( CLEAR ?AUTO_4312 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4312 ?AUTO_4313 )
      ( MAKE-ON ?AUTO_4307 ?AUTO_4308 )
      ( MAKE-ON-VERIFY ?AUTO_4307 ?AUTO_4308 ) )
  )

)

