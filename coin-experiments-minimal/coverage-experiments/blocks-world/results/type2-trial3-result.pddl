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
      ?AUTO_257 - BLOCK
    )
    :vars
    (
      ?AUTO_258 - BLOCK
      ?AUTO_259 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_257 ?AUTO_258 ) ( not ( = ?AUTO_257 ?AUTO_258 ) ) ( not ( = ?AUTO_257 ?AUTO_259 ) ) ( not ( = ?AUTO_258 ?AUTO_259 ) ) ( ON ?AUTO_259 ?AUTO_257 ) ( CLEAR ?AUTO_259 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_259 ?AUTO_257 )
      ( MAKE-ON-TABLE ?AUTO_257 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_257 ) )
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
    )
    :precondition
    ( and ( not ( = ?AUTO_26 ?AUTO_27 ) ) ( ON ?AUTO_26 ?AUTO_28 ) ( CLEAR ?AUTO_26 ) ( not ( = ?AUTO_26 ?AUTO_28 ) ) ( not ( = ?AUTO_27 ?AUTO_28 ) ) ( HOLDING ?AUTO_27 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_27 )
      ( MAKE-ON ?AUTO_26 ?AUTO_27 )
      ( MAKE-ON-VERIFY ?AUTO_26 ?AUTO_27 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_29 - BLOCK
      ?AUTO_30 - BLOCK
    )
    :vars
    (
      ?AUTO_31 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_29 ?AUTO_30 ) ) ( ON ?AUTO_29 ?AUTO_31 ) ( not ( = ?AUTO_29 ?AUTO_31 ) ) ( not ( = ?AUTO_30 ?AUTO_31 ) ) ( ON ?AUTO_30 ?AUTO_29 ) ( CLEAR ?AUTO_30 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_30 ?AUTO_29 )
      ( MAKE-ON ?AUTO_29 ?AUTO_30 )
      ( MAKE-ON-VERIFY ?AUTO_29 ?AUTO_30 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_32 - BLOCK
      ?AUTO_33 - BLOCK
    )
    :vars
    (
      ?AUTO_34 - BLOCK
      ?AUTO_35 - BLOCK
      ?AUTO_36 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_32 ?AUTO_33 ) ) ( ON ?AUTO_32 ?AUTO_34 ) ( not ( = ?AUTO_32 ?AUTO_34 ) ) ( not ( = ?AUTO_33 ?AUTO_34 ) ) ( ON ?AUTO_33 ?AUTO_32 ) ( CLEAR ?AUTO_33 ) ( HOLDING ?AUTO_35 ) ( CLEAR ?AUTO_36 ) ( not ( = ?AUTO_32 ?AUTO_35 ) ) ( not ( = ?AUTO_32 ?AUTO_36 ) ) ( not ( = ?AUTO_33 ?AUTO_35 ) ) ( not ( = ?AUTO_33 ?AUTO_36 ) ) ( not ( = ?AUTO_34 ?AUTO_35 ) ) ( not ( = ?AUTO_34 ?AUTO_36 ) ) ( not ( = ?AUTO_35 ?AUTO_36 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_35 ?AUTO_36 )
      ( MAKE-ON ?AUTO_32 ?AUTO_33 )
      ( MAKE-ON-VERIFY ?AUTO_32 ?AUTO_33 ) )
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
    )
    :precondition
    ( and ( not ( = ?AUTO_61 ?AUTO_62 ) ) ( ON ?AUTO_61 ?AUTO_63 ) ( not ( = ?AUTO_61 ?AUTO_63 ) ) ( not ( = ?AUTO_62 ?AUTO_63 ) ) ( not ( = ?AUTO_61 ?AUTO_64 ) ) ( not ( = ?AUTO_62 ?AUTO_64 ) ) ( not ( = ?AUTO_63 ?AUTO_64 ) ) ( ON ?AUTO_62 ?AUTO_61 ) ( ON ?AUTO_64 ?AUTO_62 ) ( CLEAR ?AUTO_64 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_64 ?AUTO_62 )
      ( MAKE-ON ?AUTO_61 ?AUTO_62 )
      ( MAKE-ON-VERIFY ?AUTO_61 ?AUTO_62 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_49 - BLOCK
      ?AUTO_50 - BLOCK
    )
    :vars
    (
      ?AUTO_51 - BLOCK
      ?AUTO_52 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_49 ?AUTO_50 ) ) ( ON ?AUTO_49 ?AUTO_51 ) ( CLEAR ?AUTO_49 ) ( not ( = ?AUTO_49 ?AUTO_51 ) ) ( not ( = ?AUTO_50 ?AUTO_51 ) ) ( HOLDING ?AUTO_50 ) ( CLEAR ?AUTO_52 ) ( not ( = ?AUTO_49 ?AUTO_52 ) ) ( not ( = ?AUTO_50 ?AUTO_52 ) ) ( not ( = ?AUTO_51 ?AUTO_52 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_50 ?AUTO_52 )
      ( MAKE-ON ?AUTO_49 ?AUTO_50 )
      ( MAKE-ON-VERIFY ?AUTO_49 ?AUTO_50 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_57 - BLOCK
      ?AUTO_58 - BLOCK
    )
    :vars
    (
      ?AUTO_59 - BLOCK
      ?AUTO_60 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_57 ?AUTO_58 ) ) ( ON ?AUTO_57 ?AUTO_59 ) ( not ( = ?AUTO_57 ?AUTO_59 ) ) ( not ( = ?AUTO_58 ?AUTO_59 ) ) ( not ( = ?AUTO_57 ?AUTO_60 ) ) ( not ( = ?AUTO_58 ?AUTO_60 ) ) ( not ( = ?AUTO_59 ?AUTO_60 ) ) ( ON ?AUTO_58 ?AUTO_57 ) ( CLEAR ?AUTO_58 ) ( HOLDING ?AUTO_60 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_60 )
      ( MAKE-ON ?AUTO_57 ?AUTO_58 )
      ( MAKE-ON-VERIFY ?AUTO_57 ?AUTO_58 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_65 - BLOCK
      ?AUTO_66 - BLOCK
    )
    :vars
    (
      ?AUTO_67 - BLOCK
      ?AUTO_68 - BLOCK
      ?AUTO_69 - BLOCK
      ?AUTO_70 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_65 ?AUTO_66 ) ) ( ON ?AUTO_65 ?AUTO_67 ) ( not ( = ?AUTO_65 ?AUTO_67 ) ) ( not ( = ?AUTO_66 ?AUTO_67 ) ) ( not ( = ?AUTO_65 ?AUTO_68 ) ) ( not ( = ?AUTO_66 ?AUTO_68 ) ) ( not ( = ?AUTO_67 ?AUTO_68 ) ) ( ON ?AUTO_66 ?AUTO_65 ) ( ON ?AUTO_68 ?AUTO_66 ) ( CLEAR ?AUTO_68 ) ( HOLDING ?AUTO_69 ) ( CLEAR ?AUTO_70 ) ( not ( = ?AUTO_65 ?AUTO_69 ) ) ( not ( = ?AUTO_65 ?AUTO_70 ) ) ( not ( = ?AUTO_66 ?AUTO_69 ) ) ( not ( = ?AUTO_66 ?AUTO_70 ) ) ( not ( = ?AUTO_67 ?AUTO_69 ) ) ( not ( = ?AUTO_67 ?AUTO_70 ) ) ( not ( = ?AUTO_68 ?AUTO_69 ) ) ( not ( = ?AUTO_68 ?AUTO_70 ) ) ( not ( = ?AUTO_69 ?AUTO_70 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_69 ?AUTO_70 )
      ( MAKE-ON ?AUTO_65 ?AUTO_66 )
      ( MAKE-ON-VERIFY ?AUTO_65 ?AUTO_66 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2350 - BLOCK
      ?AUTO_2351 - BLOCK
    )
    :vars
    (
      ?AUTO_2353 - BLOCK
      ?AUTO_2354 - BLOCK
      ?AUTO_2352 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2350 ?AUTO_2351 ) ) ( ON ?AUTO_2350 ?AUTO_2353 ) ( not ( = ?AUTO_2350 ?AUTO_2353 ) ) ( not ( = ?AUTO_2351 ?AUTO_2353 ) ) ( ON ?AUTO_2351 ?AUTO_2350 ) ( not ( = ?AUTO_2350 ?AUTO_2354 ) ) ( not ( = ?AUTO_2351 ?AUTO_2354 ) ) ( not ( = ?AUTO_2353 ?AUTO_2354 ) ) ( ON ?AUTO_2354 ?AUTO_2351 ) ( not ( = ?AUTO_2350 ?AUTO_2352 ) ) ( not ( = ?AUTO_2351 ?AUTO_2352 ) ) ( not ( = ?AUTO_2353 ?AUTO_2352 ) ) ( not ( = ?AUTO_2354 ?AUTO_2352 ) ) ( ON ?AUTO_2352 ?AUTO_2354 ) ( CLEAR ?AUTO_2352 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2352 ?AUTO_2354 )
      ( MAKE-ON ?AUTO_2350 ?AUTO_2351 )
      ( MAKE-ON-VERIFY ?AUTO_2350 ?AUTO_2351 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_99 - BLOCK
      ?AUTO_100 - BLOCK
    )
    :vars
    (
      ?AUTO_101 - BLOCK
      ?AUTO_102 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_100 ) ( not ( = ?AUTO_99 ?AUTO_100 ) ) ( ON ?AUTO_99 ?AUTO_101 ) ( CLEAR ?AUTO_99 ) ( not ( = ?AUTO_99 ?AUTO_101 ) ) ( not ( = ?AUTO_100 ?AUTO_101 ) ) ( HOLDING ?AUTO_102 ) ( not ( = ?AUTO_99 ?AUTO_102 ) ) ( not ( = ?AUTO_100 ?AUTO_102 ) ) ( not ( = ?AUTO_101 ?AUTO_102 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_102 )
      ( MAKE-ON ?AUTO_99 ?AUTO_100 )
      ( MAKE-ON-VERIFY ?AUTO_99 ?AUTO_100 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_103 - BLOCK
      ?AUTO_104 - BLOCK
    )
    :vars
    (
      ?AUTO_105 - BLOCK
      ?AUTO_106 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_103 ?AUTO_104 ) ) ( ON ?AUTO_103 ?AUTO_105 ) ( CLEAR ?AUTO_103 ) ( not ( = ?AUTO_103 ?AUTO_105 ) ) ( not ( = ?AUTO_104 ?AUTO_105 ) ) ( not ( = ?AUTO_103 ?AUTO_106 ) ) ( not ( = ?AUTO_104 ?AUTO_106 ) ) ( not ( = ?AUTO_105 ?AUTO_106 ) ) ( ON ?AUTO_106 ?AUTO_104 ) ( CLEAR ?AUTO_106 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_106 ?AUTO_104 )
      ( MAKE-ON ?AUTO_103 ?AUTO_104 )
      ( MAKE-ON-VERIFY ?AUTO_103 ?AUTO_104 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_107 - BLOCK
      ?AUTO_108 - BLOCK
    )
    :vars
    (
      ?AUTO_109 - BLOCK
      ?AUTO_110 - BLOCK
      ?AUTO_111 - BLOCK
      ?AUTO_112 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_107 ?AUTO_108 ) ) ( ON ?AUTO_107 ?AUTO_109 ) ( CLEAR ?AUTO_107 ) ( not ( = ?AUTO_107 ?AUTO_109 ) ) ( not ( = ?AUTO_108 ?AUTO_109 ) ) ( not ( = ?AUTO_107 ?AUTO_110 ) ) ( not ( = ?AUTO_108 ?AUTO_110 ) ) ( not ( = ?AUTO_109 ?AUTO_110 ) ) ( ON ?AUTO_110 ?AUTO_108 ) ( CLEAR ?AUTO_110 ) ( HOLDING ?AUTO_111 ) ( CLEAR ?AUTO_112 ) ( not ( = ?AUTO_107 ?AUTO_111 ) ) ( not ( = ?AUTO_107 ?AUTO_112 ) ) ( not ( = ?AUTO_108 ?AUTO_111 ) ) ( not ( = ?AUTO_108 ?AUTO_112 ) ) ( not ( = ?AUTO_109 ?AUTO_111 ) ) ( not ( = ?AUTO_109 ?AUTO_112 ) ) ( not ( = ?AUTO_110 ?AUTO_111 ) ) ( not ( = ?AUTO_110 ?AUTO_112 ) ) ( not ( = ?AUTO_111 ?AUTO_112 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_111 ?AUTO_112 )
      ( MAKE-ON ?AUTO_107 ?AUTO_108 )
      ( MAKE-ON-VERIFY ?AUTO_107 ?AUTO_108 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_123 - BLOCK
      ?AUTO_124 - BLOCK
    )
    :vars
    (
      ?AUTO_126 - BLOCK
      ?AUTO_125 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_123 ?AUTO_124 ) ) ( not ( = ?AUTO_123 ?AUTO_126 ) ) ( not ( = ?AUTO_124 ?AUTO_126 ) ) ( not ( = ?AUTO_123 ?AUTO_125 ) ) ( not ( = ?AUTO_124 ?AUTO_125 ) ) ( not ( = ?AUTO_126 ?AUTO_125 ) ) ( ON ?AUTO_125 ?AUTO_124 ) ( CLEAR ?AUTO_125 ) ( HOLDING ?AUTO_123 ) ( CLEAR ?AUTO_126 ) )
    :subtasks
    ( ( !STACK ?AUTO_123 ?AUTO_126 )
      ( MAKE-ON ?AUTO_123 ?AUTO_124 )
      ( MAKE-ON-VERIFY ?AUTO_123 ?AUTO_124 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_133 - BLOCK
      ?AUTO_134 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_134 ) ( not ( = ?AUTO_133 ?AUTO_134 ) ) ( ON-TABLE ?AUTO_133 ) ( CLEAR ?AUTO_133 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_133 )
      ( MAKE-ON ?AUTO_133 ?AUTO_134 )
      ( MAKE-ON-VERIFY ?AUTO_133 ?AUTO_134 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_135 - BLOCK
      ?AUTO_136 - BLOCK
    )
    :vars
    (
      ?AUTO_137 - BLOCK
      ?AUTO_138 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_136 ) ( not ( = ?AUTO_135 ?AUTO_136 ) ) ( ON-TABLE ?AUTO_135 ) ( CLEAR ?AUTO_135 ) ( HOLDING ?AUTO_137 ) ( CLEAR ?AUTO_138 ) ( not ( = ?AUTO_135 ?AUTO_137 ) ) ( not ( = ?AUTO_135 ?AUTO_138 ) ) ( not ( = ?AUTO_136 ?AUTO_137 ) ) ( not ( = ?AUTO_136 ?AUTO_138 ) ) ( not ( = ?AUTO_137 ?AUTO_138 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_137 ?AUTO_138 )
      ( MAKE-ON ?AUTO_135 ?AUTO_136 )
      ( MAKE-ON-VERIFY ?AUTO_135 ?AUTO_136 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3839 - BLOCK
      ?AUTO_3840 - BLOCK
    )
    :vars
    (
      ?AUTO_3841 - BLOCK
      ?AUTO_3842 - BLOCK
      ?AUTO_3843 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3839 ?AUTO_3840 ) ) ( ON ?AUTO_3839 ?AUTO_3841 ) ( CLEAR ?AUTO_3839 ) ( not ( = ?AUTO_3839 ?AUTO_3841 ) ) ( not ( = ?AUTO_3840 ?AUTO_3841 ) ) ( not ( = ?AUTO_3839 ?AUTO_3842 ) ) ( not ( = ?AUTO_3840 ?AUTO_3842 ) ) ( not ( = ?AUTO_3841 ?AUTO_3842 ) ) ( ON ?AUTO_3842 ?AUTO_3840 ) ( not ( = ?AUTO_3839 ?AUTO_3843 ) ) ( not ( = ?AUTO_3840 ?AUTO_3843 ) ) ( not ( = ?AUTO_3841 ?AUTO_3843 ) ) ( not ( = ?AUTO_3842 ?AUTO_3843 ) ) ( ON ?AUTO_3843 ?AUTO_3842 ) ( CLEAR ?AUTO_3843 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3843 ?AUTO_3842 )
      ( MAKE-ON ?AUTO_3839 ?AUTO_3840 )
      ( MAKE-ON-VERIFY ?AUTO_3839 ?AUTO_3840 ) )
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
      ?AUTO_167 - BLOCK
      ?AUTO_165 - BLOCK
      ?AUTO_168 - BLOCK
      ?AUTO_169 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_163 ?AUTO_164 ) ) ( ON ?AUTO_163 ?AUTO_166 ) ( CLEAR ?AUTO_163 ) ( not ( = ?AUTO_163 ?AUTO_166 ) ) ( not ( = ?AUTO_164 ?AUTO_166 ) ) ( not ( = ?AUTO_163 ?AUTO_167 ) ) ( not ( = ?AUTO_164 ?AUTO_167 ) ) ( not ( = ?AUTO_166 ?AUTO_167 ) ) ( ON ?AUTO_167 ?AUTO_164 ) ( not ( = ?AUTO_163 ?AUTO_165 ) ) ( not ( = ?AUTO_163 ?AUTO_168 ) ) ( not ( = ?AUTO_164 ?AUTO_165 ) ) ( not ( = ?AUTO_164 ?AUTO_168 ) ) ( not ( = ?AUTO_166 ?AUTO_165 ) ) ( not ( = ?AUTO_166 ?AUTO_168 ) ) ( not ( = ?AUTO_167 ?AUTO_165 ) ) ( not ( = ?AUTO_167 ?AUTO_168 ) ) ( not ( = ?AUTO_165 ?AUTO_168 ) ) ( ON ?AUTO_165 ?AUTO_167 ) ( CLEAR ?AUTO_165 ) ( HOLDING ?AUTO_168 ) ( CLEAR ?AUTO_169 ) ( not ( = ?AUTO_163 ?AUTO_169 ) ) ( not ( = ?AUTO_164 ?AUTO_169 ) ) ( not ( = ?AUTO_166 ?AUTO_169 ) ) ( not ( = ?AUTO_167 ?AUTO_169 ) ) ( not ( = ?AUTO_165 ?AUTO_169 ) ) ( not ( = ?AUTO_168 ?AUTO_169 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_168 ?AUTO_169 )
      ( MAKE-ON ?AUTO_163 ?AUTO_164 )
      ( MAKE-ON-VERIFY ?AUTO_163 ?AUTO_164 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4802 - BLOCK
      ?AUTO_4803 - BLOCK
    )
    :vars
    (
      ?AUTO_4805 - BLOCK
      ?AUTO_4806 - BLOCK
      ?AUTO_4804 - BLOCK
      ?AUTO_4807 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4802 ?AUTO_4803 ) ) ( not ( = ?AUTO_4802 ?AUTO_4805 ) ) ( not ( = ?AUTO_4802 ?AUTO_4806 ) ) ( not ( = ?AUTO_4803 ?AUTO_4805 ) ) ( not ( = ?AUTO_4803 ?AUTO_4806 ) ) ( not ( = ?AUTO_4805 ?AUTO_4806 ) ) ( ON ?AUTO_4805 ?AUTO_4803 ) ( not ( = ?AUTO_4802 ?AUTO_4804 ) ) ( not ( = ?AUTO_4802 ?AUTO_4807 ) ) ( not ( = ?AUTO_4803 ?AUTO_4804 ) ) ( not ( = ?AUTO_4803 ?AUTO_4807 ) ) ( not ( = ?AUTO_4806 ?AUTO_4804 ) ) ( not ( = ?AUTO_4806 ?AUTO_4807 ) ) ( not ( = ?AUTO_4805 ?AUTO_4804 ) ) ( not ( = ?AUTO_4805 ?AUTO_4807 ) ) ( not ( = ?AUTO_4804 ?AUTO_4807 ) ) ( ON ?AUTO_4804 ?AUTO_4805 ) ( ON ?AUTO_4802 ?AUTO_4806 ) ( CLEAR ?AUTO_4802 ) ( ON ?AUTO_4807 ?AUTO_4804 ) ( CLEAR ?AUTO_4807 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4807 ?AUTO_4804 )
      ( MAKE-ON ?AUTO_4802 ?AUTO_4803 )
      ( MAKE-ON-VERIFY ?AUTO_4802 ?AUTO_4803 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_183 - BLOCK
      ?AUTO_184 - BLOCK
    )
    :vars
    (
      ?AUTO_185 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_183 ?AUTO_184 ) ) ( ON-TABLE ?AUTO_183 ) ( CLEAR ?AUTO_183 ) ( HOLDING ?AUTO_184 ) ( CLEAR ?AUTO_185 ) ( not ( = ?AUTO_183 ?AUTO_185 ) ) ( not ( = ?AUTO_184 ?AUTO_185 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_184 ?AUTO_185 )
      ( MAKE-ON ?AUTO_183 ?AUTO_184 )
      ( MAKE-ON-VERIFY ?AUTO_183 ?AUTO_184 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1137 - BLOCK
      ?AUTO_1138 - BLOCK
    )
    :vars
    (
      ?AUTO_1139 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1138 ) ( not ( = ?AUTO_1137 ?AUTO_1138 ) ) ( ON-TABLE ?AUTO_1137 ) ( not ( = ?AUTO_1137 ?AUTO_1139 ) ) ( not ( = ?AUTO_1138 ?AUTO_1139 ) ) ( ON ?AUTO_1139 ?AUTO_1137 ) ( CLEAR ?AUTO_1139 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1139 ?AUTO_1137 )
      ( MAKE-ON ?AUTO_1137 ?AUTO_1138 )
      ( MAKE-ON-VERIFY ?AUTO_1137 ?AUTO_1138 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_194 - BLOCK
      ?AUTO_195 - BLOCK
    )
    :vars
    (
      ?AUTO_196 - BLOCK
      ?AUTO_197 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_194 ?AUTO_195 ) ) ( ON-TABLE ?AUTO_194 ) ( CLEAR ?AUTO_196 ) ( not ( = ?AUTO_194 ?AUTO_197 ) ) ( not ( = ?AUTO_194 ?AUTO_196 ) ) ( not ( = ?AUTO_195 ?AUTO_197 ) ) ( not ( = ?AUTO_195 ?AUTO_196 ) ) ( not ( = ?AUTO_197 ?AUTO_196 ) ) ( ON ?AUTO_197 ?AUTO_194 ) ( CLEAR ?AUTO_197 ) ( HOLDING ?AUTO_195 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_195 )
      ( MAKE-ON ?AUTO_194 ?AUTO_195 )
      ( MAKE-ON-VERIFY ?AUTO_194 ?AUTO_195 ) )
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
      ?AUTO_1144 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1141 ) ( not ( = ?AUTO_1140 ?AUTO_1141 ) ) ( ON-TABLE ?AUTO_1140 ) ( not ( = ?AUTO_1140 ?AUTO_1142 ) ) ( not ( = ?AUTO_1141 ?AUTO_1142 ) ) ( ON ?AUTO_1142 ?AUTO_1140 ) ( CLEAR ?AUTO_1142 ) ( HOLDING ?AUTO_1143 ) ( CLEAR ?AUTO_1144 ) ( not ( = ?AUTO_1140 ?AUTO_1143 ) ) ( not ( = ?AUTO_1140 ?AUTO_1144 ) ) ( not ( = ?AUTO_1141 ?AUTO_1143 ) ) ( not ( = ?AUTO_1141 ?AUTO_1144 ) ) ( not ( = ?AUTO_1142 ?AUTO_1143 ) ) ( not ( = ?AUTO_1142 ?AUTO_1144 ) ) ( not ( = ?AUTO_1143 ?AUTO_1144 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1143 ?AUTO_1144 )
      ( MAKE-ON ?AUTO_1140 ?AUTO_1141 )
      ( MAKE-ON-VERIFY ?AUTO_1140 ?AUTO_1141 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1487 - BLOCK
      ?AUTO_1488 - BLOCK
    )
    :vars
    (
      ?AUTO_1489 - BLOCK
      ?AUTO_1490 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1488 ) ( not ( = ?AUTO_1487 ?AUTO_1488 ) ) ( ON-TABLE ?AUTO_1487 ) ( not ( = ?AUTO_1487 ?AUTO_1489 ) ) ( not ( = ?AUTO_1488 ?AUTO_1489 ) ) ( ON ?AUTO_1489 ?AUTO_1487 ) ( CLEAR ?AUTO_1489 ) ( HOLDING ?AUTO_1490 ) ( not ( = ?AUTO_1487 ?AUTO_1490 ) ) ( not ( = ?AUTO_1488 ?AUTO_1490 ) ) ( not ( = ?AUTO_1489 ?AUTO_1490 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1490 )
      ( MAKE-ON ?AUTO_1487 ?AUTO_1488 )
      ( MAKE-ON-VERIFY ?AUTO_1487 ?AUTO_1488 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_278 - BLOCK
      ?AUTO_279 - BLOCK
    )
    :vars
    (
      ?AUTO_280 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_278 ?AUTO_279 ) ) ( ON-TABLE ?AUTO_278 ) ( CLEAR ?AUTO_278 ) ( not ( = ?AUTO_278 ?AUTO_280 ) ) ( not ( = ?AUTO_279 ?AUTO_280 ) ) ( ON ?AUTO_280 ?AUTO_279 ) ( CLEAR ?AUTO_280 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_280 ?AUTO_279 )
      ( MAKE-ON ?AUTO_278 ?AUTO_279 )
      ( MAKE-ON-VERIFY ?AUTO_278 ?AUTO_279 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_246 - BLOCK
    )
    :vars
    (
      ?AUTO_247 - BLOCK
      ?AUTO_248 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_246 ?AUTO_247 ) ( CLEAR ?AUTO_246 ) ( not ( = ?AUTO_246 ?AUTO_247 ) ) ( HOLDING ?AUTO_248 ) ( not ( = ?AUTO_246 ?AUTO_248 ) ) ( not ( = ?AUTO_247 ?AUTO_248 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_248 )
      ( MAKE-ON-TABLE ?AUTO_246 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_246 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_260 - BLOCK
    )
    :vars
    (
      ?AUTO_261 - BLOCK
      ?AUTO_262 - BLOCK
      ?AUTO_263 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_260 ?AUTO_261 ) ( not ( = ?AUTO_260 ?AUTO_261 ) ) ( not ( = ?AUTO_260 ?AUTO_262 ) ) ( not ( = ?AUTO_261 ?AUTO_262 ) ) ( ON ?AUTO_262 ?AUTO_260 ) ( CLEAR ?AUTO_262 ) ( HOLDING ?AUTO_263 ) ( not ( = ?AUTO_260 ?AUTO_263 ) ) ( not ( = ?AUTO_261 ?AUTO_263 ) ) ( not ( = ?AUTO_262 ?AUTO_263 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_263 )
      ( MAKE-ON-TABLE ?AUTO_260 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_260 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_271 - BLOCK
      ?AUTO_272 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_271 ?AUTO_272 ) ) ( ON-TABLE ?AUTO_271 ) ( CLEAR ?AUTO_271 ) ( HOLDING ?AUTO_272 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_272 )
      ( MAKE-ON ?AUTO_271 ?AUTO_272 )
      ( MAKE-ON-VERIFY ?AUTO_271 ?AUTO_272 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_275 - BLOCK
      ?AUTO_276 - BLOCK
    )
    :vars
    (
      ?AUTO_277 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_276 ) ( not ( = ?AUTO_275 ?AUTO_276 ) ) ( ON-TABLE ?AUTO_275 ) ( CLEAR ?AUTO_275 ) ( HOLDING ?AUTO_277 ) ( not ( = ?AUTO_275 ?AUTO_277 ) ) ( not ( = ?AUTO_276 ?AUTO_277 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_277 )
      ( MAKE-ON ?AUTO_275 ?AUTO_276 )
      ( MAKE-ON-VERIFY ?AUTO_275 ?AUTO_276 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_281 - BLOCK
      ?AUTO_282 - BLOCK
    )
    :vars
    (
      ?AUTO_283 - BLOCK
      ?AUTO_284 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_281 ?AUTO_282 ) ) ( ON-TABLE ?AUTO_281 ) ( CLEAR ?AUTO_281 ) ( not ( = ?AUTO_281 ?AUTO_283 ) ) ( not ( = ?AUTO_282 ?AUTO_283 ) ) ( ON ?AUTO_283 ?AUTO_282 ) ( CLEAR ?AUTO_283 ) ( HOLDING ?AUTO_284 ) ( not ( = ?AUTO_281 ?AUTO_284 ) ) ( not ( = ?AUTO_282 ?AUTO_284 ) ) ( not ( = ?AUTO_283 ?AUTO_284 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_284 )
      ( MAKE-ON ?AUTO_281 ?AUTO_282 )
      ( MAKE-ON-VERIFY ?AUTO_281 ?AUTO_282 ) )
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
    ( and ( CLEAR ?AUTO_305 ) ( not ( = ?AUTO_304 ?AUTO_305 ) ) ( ON ?AUTO_304 ?AUTO_306 ) ( not ( = ?AUTO_304 ?AUTO_306 ) ) ( not ( = ?AUTO_305 ?AUTO_306 ) ) ( not ( = ?AUTO_304 ?AUTO_307 ) ) ( not ( = ?AUTO_305 ?AUTO_307 ) ) ( not ( = ?AUTO_306 ?AUTO_307 ) ) ( ON ?AUTO_307 ?AUTO_304 ) ( CLEAR ?AUTO_307 ) ( HAND-EMPTY ) )
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
      ?AUTO_311 - BLOCK
      ?AUTO_310 - BLOCK
      ?AUTO_312 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_309 ) ( not ( = ?AUTO_308 ?AUTO_309 ) ) ( ON ?AUTO_308 ?AUTO_311 ) ( not ( = ?AUTO_308 ?AUTO_311 ) ) ( not ( = ?AUTO_309 ?AUTO_311 ) ) ( not ( = ?AUTO_308 ?AUTO_310 ) ) ( not ( = ?AUTO_309 ?AUTO_310 ) ) ( not ( = ?AUTO_311 ?AUTO_310 ) ) ( ON ?AUTO_310 ?AUTO_308 ) ( CLEAR ?AUTO_310 ) ( HOLDING ?AUTO_312 ) ( not ( = ?AUTO_308 ?AUTO_312 ) ) ( not ( = ?AUTO_309 ?AUTO_312 ) ) ( not ( = ?AUTO_311 ?AUTO_312 ) ) ( not ( = ?AUTO_310 ?AUTO_312 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_312 )
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
    ( and ( CLEAR ?AUTO_314 ) ( not ( = ?AUTO_313 ?AUTO_314 ) ) ( ON ?AUTO_313 ?AUTO_315 ) ( not ( = ?AUTO_313 ?AUTO_315 ) ) ( not ( = ?AUTO_314 ?AUTO_315 ) ) ( not ( = ?AUTO_313 ?AUTO_316 ) ) ( not ( = ?AUTO_314 ?AUTO_316 ) ) ( not ( = ?AUTO_315 ?AUTO_316 ) ) ( ON ?AUTO_316 ?AUTO_313 ) ( not ( = ?AUTO_313 ?AUTO_317 ) ) ( not ( = ?AUTO_314 ?AUTO_317 ) ) ( not ( = ?AUTO_315 ?AUTO_317 ) ) ( not ( = ?AUTO_316 ?AUTO_317 ) ) ( ON ?AUTO_317 ?AUTO_316 ) ( CLEAR ?AUTO_317 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_317 ?AUTO_316 )
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
      ?AUTO_322 - BLOCK
      ?AUTO_320 - BLOCK
      ?AUTO_323 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_319 ) ( not ( = ?AUTO_318 ?AUTO_319 ) ) ( ON ?AUTO_318 ?AUTO_321 ) ( not ( = ?AUTO_318 ?AUTO_321 ) ) ( not ( = ?AUTO_319 ?AUTO_321 ) ) ( not ( = ?AUTO_318 ?AUTO_322 ) ) ( not ( = ?AUTO_319 ?AUTO_322 ) ) ( not ( = ?AUTO_321 ?AUTO_322 ) ) ( ON ?AUTO_322 ?AUTO_318 ) ( not ( = ?AUTO_318 ?AUTO_320 ) ) ( not ( = ?AUTO_319 ?AUTO_320 ) ) ( not ( = ?AUTO_321 ?AUTO_320 ) ) ( not ( = ?AUTO_322 ?AUTO_320 ) ) ( ON ?AUTO_320 ?AUTO_322 ) ( CLEAR ?AUTO_320 ) ( HOLDING ?AUTO_323 ) ( not ( = ?AUTO_318 ?AUTO_323 ) ) ( not ( = ?AUTO_319 ?AUTO_323 ) ) ( not ( = ?AUTO_321 ?AUTO_323 ) ) ( not ( = ?AUTO_322 ?AUTO_323 ) ) ( not ( = ?AUTO_320 ?AUTO_323 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_323 )
      ( MAKE-ON ?AUTO_318 ?AUTO_319 )
      ( MAKE-ON-VERIFY ?AUTO_318 ?AUTO_319 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_333 - BLOCK
      ?AUTO_334 - BLOCK
    )
    :vars
    (
      ?AUTO_335 - BLOCK
      ?AUTO_336 - BLOCK
      ?AUTO_337 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_334 ) ( not ( = ?AUTO_333 ?AUTO_334 ) ) ( ON ?AUTO_333 ?AUTO_335 ) ( CLEAR ?AUTO_333 ) ( not ( = ?AUTO_333 ?AUTO_335 ) ) ( not ( = ?AUTO_334 ?AUTO_335 ) ) ( HOLDING ?AUTO_336 ) ( CLEAR ?AUTO_337 ) ( not ( = ?AUTO_333 ?AUTO_336 ) ) ( not ( = ?AUTO_333 ?AUTO_337 ) ) ( not ( = ?AUTO_334 ?AUTO_336 ) ) ( not ( = ?AUTO_334 ?AUTO_337 ) ) ( not ( = ?AUTO_335 ?AUTO_336 ) ) ( not ( = ?AUTO_335 ?AUTO_337 ) ) ( not ( = ?AUTO_336 ?AUTO_337 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_336 ?AUTO_337 )
      ( MAKE-ON ?AUTO_333 ?AUTO_334 )
      ( MAKE-ON-VERIFY ?AUTO_333 ?AUTO_334 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_343 - BLOCK
      ?AUTO_344 - BLOCK
    )
    :vars
    (
      ?AUTO_347 - BLOCK
      ?AUTO_346 - BLOCK
      ?AUTO_345 - BLOCK
      ?AUTO_348 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_344 ) ( not ( = ?AUTO_343 ?AUTO_344 ) ) ( ON ?AUTO_343 ?AUTO_347 ) ( not ( = ?AUTO_343 ?AUTO_347 ) ) ( not ( = ?AUTO_344 ?AUTO_347 ) ) ( not ( = ?AUTO_343 ?AUTO_346 ) ) ( not ( = ?AUTO_343 ?AUTO_345 ) ) ( not ( = ?AUTO_344 ?AUTO_346 ) ) ( not ( = ?AUTO_344 ?AUTO_345 ) ) ( not ( = ?AUTO_347 ?AUTO_346 ) ) ( not ( = ?AUTO_347 ?AUTO_345 ) ) ( not ( = ?AUTO_346 ?AUTO_345 ) ) ( ON ?AUTO_346 ?AUTO_343 ) ( CLEAR ?AUTO_346 ) ( HOLDING ?AUTO_345 ) ( CLEAR ?AUTO_348 ) ( not ( = ?AUTO_343 ?AUTO_348 ) ) ( not ( = ?AUTO_344 ?AUTO_348 ) ) ( not ( = ?AUTO_347 ?AUTO_348 ) ) ( not ( = ?AUTO_346 ?AUTO_348 ) ) ( not ( = ?AUTO_345 ?AUTO_348 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_345 ?AUTO_348 )
      ( MAKE-ON ?AUTO_343 ?AUTO_344 )
      ( MAKE-ON-VERIFY ?AUTO_343 ?AUTO_344 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_366 - BLOCK
      ?AUTO_367 - BLOCK
    )
    :vars
    (
      ?AUTO_370 - BLOCK
      ?AUTO_369 - BLOCK
      ?AUTO_368 - BLOCK
      ?AUTO_371 - BLOCK
      ?AUTO_372 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_367 ) ( not ( = ?AUTO_366 ?AUTO_367 ) ) ( ON ?AUTO_366 ?AUTO_370 ) ( not ( = ?AUTO_366 ?AUTO_370 ) ) ( not ( = ?AUTO_367 ?AUTO_370 ) ) ( not ( = ?AUTO_366 ?AUTO_369 ) ) ( not ( = ?AUTO_366 ?AUTO_368 ) ) ( not ( = ?AUTO_367 ?AUTO_369 ) ) ( not ( = ?AUTO_367 ?AUTO_368 ) ) ( not ( = ?AUTO_370 ?AUTO_369 ) ) ( not ( = ?AUTO_370 ?AUTO_368 ) ) ( not ( = ?AUTO_369 ?AUTO_368 ) ) ( ON ?AUTO_369 ?AUTO_366 ) ( CLEAR ?AUTO_371 ) ( not ( = ?AUTO_366 ?AUTO_371 ) ) ( not ( = ?AUTO_367 ?AUTO_371 ) ) ( not ( = ?AUTO_370 ?AUTO_371 ) ) ( not ( = ?AUTO_369 ?AUTO_371 ) ) ( not ( = ?AUTO_368 ?AUTO_371 ) ) ( ON ?AUTO_368 ?AUTO_369 ) ( not ( = ?AUTO_366 ?AUTO_372 ) ) ( not ( = ?AUTO_367 ?AUTO_372 ) ) ( not ( = ?AUTO_370 ?AUTO_372 ) ) ( not ( = ?AUTO_369 ?AUTO_372 ) ) ( not ( = ?AUTO_368 ?AUTO_372 ) ) ( not ( = ?AUTO_371 ?AUTO_372 ) ) ( ON ?AUTO_372 ?AUTO_368 ) ( CLEAR ?AUTO_372 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_372 ?AUTO_368 )
      ( MAKE-ON ?AUTO_366 ?AUTO_367 )
      ( MAKE-ON-VERIFY ?AUTO_366 ?AUTO_367 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4318 - BLOCK
      ?AUTO_4319 - BLOCK
    )
    :vars
    (
      ?AUTO_4320 - BLOCK
      ?AUTO_4322 - BLOCK
      ?AUTO_4323 - BLOCK
      ?AUTO_4324 - BLOCK
      ?AUTO_4321 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4319 ) ( not ( = ?AUTO_4318 ?AUTO_4319 ) ) ( ON ?AUTO_4318 ?AUTO_4320 ) ( not ( = ?AUTO_4318 ?AUTO_4320 ) ) ( not ( = ?AUTO_4319 ?AUTO_4320 ) ) ( not ( = ?AUTO_4318 ?AUTO_4322 ) ) ( not ( = ?AUTO_4319 ?AUTO_4322 ) ) ( not ( = ?AUTO_4320 ?AUTO_4322 ) ) ( ON ?AUTO_4322 ?AUTO_4318 ) ( not ( = ?AUTO_4318 ?AUTO_4323 ) ) ( not ( = ?AUTO_4318 ?AUTO_4324 ) ) ( not ( = ?AUTO_4319 ?AUTO_4323 ) ) ( not ( = ?AUTO_4319 ?AUTO_4324 ) ) ( not ( = ?AUTO_4320 ?AUTO_4323 ) ) ( not ( = ?AUTO_4320 ?AUTO_4324 ) ) ( not ( = ?AUTO_4322 ?AUTO_4323 ) ) ( not ( = ?AUTO_4322 ?AUTO_4324 ) ) ( not ( = ?AUTO_4323 ?AUTO_4324 ) ) ( ON ?AUTO_4323 ?AUTO_4322 ) ( not ( = ?AUTO_4318 ?AUTO_4321 ) ) ( not ( = ?AUTO_4319 ?AUTO_4321 ) ) ( not ( = ?AUTO_4320 ?AUTO_4321 ) ) ( not ( = ?AUTO_4322 ?AUTO_4321 ) ) ( not ( = ?AUTO_4324 ?AUTO_4321 ) ) ( not ( = ?AUTO_4323 ?AUTO_4321 ) ) ( ON ?AUTO_4321 ?AUTO_4323 ) ( CLEAR ?AUTO_4321 ) ( HOLDING ?AUTO_4324 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4324 )
      ( MAKE-ON ?AUTO_4318 ?AUTO_4319 )
      ( MAKE-ON-VERIFY ?AUTO_4318 ?AUTO_4319 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4325 - BLOCK
      ?AUTO_4326 - BLOCK
    )
    :vars
    (
      ?AUTO_4330 - BLOCK
      ?AUTO_4329 - BLOCK
      ?AUTO_4328 - BLOCK
      ?AUTO_4331 - BLOCK
      ?AUTO_4327 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4325 ?AUTO_4326 ) ) ( ON ?AUTO_4325 ?AUTO_4330 ) ( not ( = ?AUTO_4325 ?AUTO_4330 ) ) ( not ( = ?AUTO_4326 ?AUTO_4330 ) ) ( not ( = ?AUTO_4325 ?AUTO_4329 ) ) ( not ( = ?AUTO_4326 ?AUTO_4329 ) ) ( not ( = ?AUTO_4330 ?AUTO_4329 ) ) ( ON ?AUTO_4329 ?AUTO_4325 ) ( not ( = ?AUTO_4325 ?AUTO_4328 ) ) ( not ( = ?AUTO_4325 ?AUTO_4331 ) ) ( not ( = ?AUTO_4326 ?AUTO_4328 ) ) ( not ( = ?AUTO_4326 ?AUTO_4331 ) ) ( not ( = ?AUTO_4330 ?AUTO_4328 ) ) ( not ( = ?AUTO_4330 ?AUTO_4331 ) ) ( not ( = ?AUTO_4329 ?AUTO_4328 ) ) ( not ( = ?AUTO_4329 ?AUTO_4331 ) ) ( not ( = ?AUTO_4328 ?AUTO_4331 ) ) ( ON ?AUTO_4328 ?AUTO_4329 ) ( not ( = ?AUTO_4325 ?AUTO_4327 ) ) ( not ( = ?AUTO_4326 ?AUTO_4327 ) ) ( not ( = ?AUTO_4330 ?AUTO_4327 ) ) ( not ( = ?AUTO_4329 ?AUTO_4327 ) ) ( not ( = ?AUTO_4331 ?AUTO_4327 ) ) ( not ( = ?AUTO_4328 ?AUTO_4327 ) ) ( ON ?AUTO_4327 ?AUTO_4328 ) ( CLEAR ?AUTO_4327 ) ( ON ?AUTO_4331 ?AUTO_4326 ) ( CLEAR ?AUTO_4331 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4331 ?AUTO_4326 )
      ( MAKE-ON ?AUTO_4325 ?AUTO_4326 )
      ( MAKE-ON-VERIFY ?AUTO_4325 ?AUTO_4326 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3917 - BLOCK
      ?AUTO_3918 - BLOCK
    )
    :vars
    (
      ?AUTO_3920 - BLOCK
      ?AUTO_3919 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3918 ) ( not ( = ?AUTO_3917 ?AUTO_3918 ) ) ( ON-TABLE ?AUTO_3917 ) ( not ( = ?AUTO_3917 ?AUTO_3920 ) ) ( not ( = ?AUTO_3917 ?AUTO_3919 ) ) ( not ( = ?AUTO_3918 ?AUTO_3920 ) ) ( not ( = ?AUTO_3918 ?AUTO_3919 ) ) ( not ( = ?AUTO_3920 ?AUTO_3919 ) ) ( ON ?AUTO_3920 ?AUTO_3917 ) ( ON ?AUTO_3919 ?AUTO_3920 ) ( CLEAR ?AUTO_3919 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3919 ?AUTO_3920 )
      ( MAKE-ON ?AUTO_3917 ?AUTO_3918 )
      ( MAKE-ON-VERIFY ?AUTO_3917 ?AUTO_3918 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1274 - BLOCK
      ?AUTO_1275 - BLOCK
    )
    :vars
    (
      ?AUTO_1278 - BLOCK
      ?AUTO_1276 - BLOCK
      ?AUTO_1277 - BLOCK
      ?AUTO_1279 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1274 ?AUTO_1275 ) ) ( ON-TABLE ?AUTO_1274 ) ( not ( = ?AUTO_1274 ?AUTO_1278 ) ) ( not ( = ?AUTO_1274 ?AUTO_1276 ) ) ( not ( = ?AUTO_1275 ?AUTO_1278 ) ) ( not ( = ?AUTO_1275 ?AUTO_1276 ) ) ( not ( = ?AUTO_1278 ?AUTO_1276 ) ) ( not ( = ?AUTO_1274 ?AUTO_1277 ) ) ( not ( = ?AUTO_1275 ?AUTO_1277 ) ) ( not ( = ?AUTO_1278 ?AUTO_1277 ) ) ( not ( = ?AUTO_1276 ?AUTO_1277 ) ) ( ON ?AUTO_1276 ?AUTO_1274 ) ( CLEAR ?AUTO_1275 ) ( ON ?AUTO_1278 ?AUTO_1276 ) ( CLEAR ?AUTO_1278 ) ( HOLDING ?AUTO_1277 ) ( CLEAR ?AUTO_1279 ) ( not ( = ?AUTO_1274 ?AUTO_1279 ) ) ( not ( = ?AUTO_1275 ?AUTO_1279 ) ) ( not ( = ?AUTO_1278 ?AUTO_1279 ) ) ( not ( = ?AUTO_1276 ?AUTO_1279 ) ) ( not ( = ?AUTO_1277 ?AUTO_1279 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1277 ?AUTO_1279 )
      ( MAKE-ON ?AUTO_1274 ?AUTO_1275 )
      ( MAKE-ON-VERIFY ?AUTO_1274 ?AUTO_1275 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4487 - BLOCK
      ?AUTO_4488 - BLOCK
    )
    :vars
    (
      ?AUTO_4489 - BLOCK
      ?AUTO_4491 - BLOCK
      ?AUTO_4490 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4488 ) ( not ( = ?AUTO_4487 ?AUTO_4488 ) ) ( ON-TABLE ?AUTO_4487 ) ( not ( = ?AUTO_4487 ?AUTO_4489 ) ) ( not ( = ?AUTO_4487 ?AUTO_4491 ) ) ( not ( = ?AUTO_4488 ?AUTO_4489 ) ) ( not ( = ?AUTO_4488 ?AUTO_4491 ) ) ( not ( = ?AUTO_4489 ?AUTO_4491 ) ) ( ON ?AUTO_4489 ?AUTO_4487 ) ( not ( = ?AUTO_4487 ?AUTO_4490 ) ) ( not ( = ?AUTO_4488 ?AUTO_4490 ) ) ( not ( = ?AUTO_4489 ?AUTO_4490 ) ) ( not ( = ?AUTO_4491 ?AUTO_4490 ) ) ( ON ?AUTO_4491 ?AUTO_4489 ) ( ON ?AUTO_4490 ?AUTO_4491 ) ( CLEAR ?AUTO_4490 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4490 ?AUTO_4491 )
      ( MAKE-ON ?AUTO_4487 ?AUTO_4488 )
      ( MAKE-ON-VERIFY ?AUTO_4487 ?AUTO_4488 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3640 - BLOCK
      ?AUTO_3641 - BLOCK
    )
    :vars
    (
      ?AUTO_3643 - BLOCK
      ?AUTO_3642 - BLOCK
      ?AUTO_3644 - BLOCK
      ?AUTO_3645 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3641 ) ( not ( = ?AUTO_3640 ?AUTO_3641 ) ) ( ON-TABLE ?AUTO_3640 ) ( not ( = ?AUTO_3640 ?AUTO_3643 ) ) ( not ( = ?AUTO_3640 ?AUTO_3642 ) ) ( not ( = ?AUTO_3641 ?AUTO_3643 ) ) ( not ( = ?AUTO_3641 ?AUTO_3642 ) ) ( not ( = ?AUTO_3643 ?AUTO_3642 ) ) ( ON ?AUTO_3643 ?AUTO_3640 ) ( not ( = ?AUTO_3640 ?AUTO_3644 ) ) ( not ( = ?AUTO_3641 ?AUTO_3644 ) ) ( not ( = ?AUTO_3642 ?AUTO_3644 ) ) ( not ( = ?AUTO_3643 ?AUTO_3644 ) ) ( ON ?AUTO_3644 ?AUTO_3643 ) ( not ( = ?AUTO_3640 ?AUTO_3645 ) ) ( not ( = ?AUTO_3641 ?AUTO_3645 ) ) ( not ( = ?AUTO_3643 ?AUTO_3645 ) ) ( not ( = ?AUTO_3642 ?AUTO_3645 ) ) ( not ( = ?AUTO_3644 ?AUTO_3645 ) ) ( ON ?AUTO_3642 ?AUTO_3644 ) ( CLEAR ?AUTO_3642 ) ( HOLDING ?AUTO_3645 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3645 )
      ( MAKE-ON ?AUTO_3640 ?AUTO_3641 )
      ( MAKE-ON-VERIFY ?AUTO_3640 ?AUTO_3641 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3646 - BLOCK
      ?AUTO_3647 - BLOCK
    )
    :vars
    (
      ?AUTO_3651 - BLOCK
      ?AUTO_3650 - BLOCK
      ?AUTO_3649 - BLOCK
      ?AUTO_3648 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3647 ) ( not ( = ?AUTO_3646 ?AUTO_3647 ) ) ( ON-TABLE ?AUTO_3646 ) ( not ( = ?AUTO_3646 ?AUTO_3651 ) ) ( not ( = ?AUTO_3646 ?AUTO_3650 ) ) ( not ( = ?AUTO_3647 ?AUTO_3651 ) ) ( not ( = ?AUTO_3647 ?AUTO_3650 ) ) ( not ( = ?AUTO_3651 ?AUTO_3650 ) ) ( ON ?AUTO_3651 ?AUTO_3646 ) ( not ( = ?AUTO_3646 ?AUTO_3649 ) ) ( not ( = ?AUTO_3647 ?AUTO_3649 ) ) ( not ( = ?AUTO_3650 ?AUTO_3649 ) ) ( not ( = ?AUTO_3651 ?AUTO_3649 ) ) ( ON ?AUTO_3649 ?AUTO_3651 ) ( not ( = ?AUTO_3646 ?AUTO_3648 ) ) ( not ( = ?AUTO_3647 ?AUTO_3648 ) ) ( not ( = ?AUTO_3651 ?AUTO_3648 ) ) ( not ( = ?AUTO_3650 ?AUTO_3648 ) ) ( not ( = ?AUTO_3649 ?AUTO_3648 ) ) ( ON ?AUTO_3650 ?AUTO_3649 ) ( ON ?AUTO_3648 ?AUTO_3650 ) ( CLEAR ?AUTO_3648 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3648 ?AUTO_3650 )
      ( MAKE-ON ?AUTO_3646 ?AUTO_3647 )
      ( MAKE-ON-VERIFY ?AUTO_3646 ?AUTO_3647 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_449 - BLOCK
      ?AUTO_450 - BLOCK
    )
    :vars
    (
      ?AUTO_452 - BLOCK
      ?AUTO_453 - BLOCK
      ?AUTO_451 - BLOCK
      ?AUTO_456 - BLOCK
      ?AUTO_455 - BLOCK
      ?AUTO_454 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_449 ?AUTO_450 ) ) ( ON-TABLE ?AUTO_449 ) ( CLEAR ?AUTO_452 ) ( not ( = ?AUTO_449 ?AUTO_453 ) ) ( not ( = ?AUTO_449 ?AUTO_452 ) ) ( not ( = ?AUTO_450 ?AUTO_453 ) ) ( not ( = ?AUTO_450 ?AUTO_452 ) ) ( not ( = ?AUTO_453 ?AUTO_452 ) ) ( ON ?AUTO_453 ?AUTO_449 ) ( not ( = ?AUTO_449 ?AUTO_451 ) ) ( not ( = ?AUTO_449 ?AUTO_456 ) ) ( not ( = ?AUTO_450 ?AUTO_451 ) ) ( not ( = ?AUTO_450 ?AUTO_456 ) ) ( not ( = ?AUTO_452 ?AUTO_451 ) ) ( not ( = ?AUTO_452 ?AUTO_456 ) ) ( not ( = ?AUTO_453 ?AUTO_451 ) ) ( not ( = ?AUTO_453 ?AUTO_456 ) ) ( not ( = ?AUTO_451 ?AUTO_456 ) ) ( ON ?AUTO_451 ?AUTO_453 ) ( CLEAR ?AUTO_455 ) ( not ( = ?AUTO_449 ?AUTO_455 ) ) ( not ( = ?AUTO_450 ?AUTO_455 ) ) ( not ( = ?AUTO_452 ?AUTO_455 ) ) ( not ( = ?AUTO_453 ?AUTO_455 ) ) ( not ( = ?AUTO_451 ?AUTO_455 ) ) ( not ( = ?AUTO_456 ?AUTO_455 ) ) ( ON ?AUTO_456 ?AUTO_451 ) ( not ( = ?AUTO_449 ?AUTO_454 ) ) ( not ( = ?AUTO_450 ?AUTO_454 ) ) ( not ( = ?AUTO_452 ?AUTO_454 ) ) ( not ( = ?AUTO_453 ?AUTO_454 ) ) ( not ( = ?AUTO_451 ?AUTO_454 ) ) ( not ( = ?AUTO_456 ?AUTO_454 ) ) ( not ( = ?AUTO_455 ?AUTO_454 ) ) ( ON ?AUTO_454 ?AUTO_456 ) ( CLEAR ?AUTO_454 ) ( HOLDING ?AUTO_450 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_450 )
      ( MAKE-ON ?AUTO_449 ?AUTO_450 )
      ( MAKE-ON-VERIFY ?AUTO_449 ?AUTO_450 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_457 - BLOCK
      ?AUTO_458 - BLOCK
    )
    :vars
    (
      ?AUTO_461 - BLOCK
      ?AUTO_462 - BLOCK
      ?AUTO_464 - BLOCK
      ?AUTO_460 - BLOCK
      ?AUTO_463 - BLOCK
      ?AUTO_459 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_457 ?AUTO_458 ) ) ( ON-TABLE ?AUTO_457 ) ( not ( = ?AUTO_457 ?AUTO_461 ) ) ( not ( = ?AUTO_457 ?AUTO_462 ) ) ( not ( = ?AUTO_458 ?AUTO_461 ) ) ( not ( = ?AUTO_458 ?AUTO_462 ) ) ( not ( = ?AUTO_461 ?AUTO_462 ) ) ( ON ?AUTO_461 ?AUTO_457 ) ( not ( = ?AUTO_457 ?AUTO_464 ) ) ( not ( = ?AUTO_457 ?AUTO_460 ) ) ( not ( = ?AUTO_458 ?AUTO_464 ) ) ( not ( = ?AUTO_458 ?AUTO_460 ) ) ( not ( = ?AUTO_462 ?AUTO_464 ) ) ( not ( = ?AUTO_462 ?AUTO_460 ) ) ( not ( = ?AUTO_461 ?AUTO_464 ) ) ( not ( = ?AUTO_461 ?AUTO_460 ) ) ( not ( = ?AUTO_464 ?AUTO_460 ) ) ( ON ?AUTO_464 ?AUTO_461 ) ( CLEAR ?AUTO_463 ) ( not ( = ?AUTO_457 ?AUTO_463 ) ) ( not ( = ?AUTO_458 ?AUTO_463 ) ) ( not ( = ?AUTO_462 ?AUTO_463 ) ) ( not ( = ?AUTO_461 ?AUTO_463 ) ) ( not ( = ?AUTO_464 ?AUTO_463 ) ) ( not ( = ?AUTO_460 ?AUTO_463 ) ) ( ON ?AUTO_460 ?AUTO_464 ) ( not ( = ?AUTO_457 ?AUTO_459 ) ) ( not ( = ?AUTO_458 ?AUTO_459 ) ) ( not ( = ?AUTO_462 ?AUTO_459 ) ) ( not ( = ?AUTO_461 ?AUTO_459 ) ) ( not ( = ?AUTO_464 ?AUTO_459 ) ) ( not ( = ?AUTO_460 ?AUTO_459 ) ) ( not ( = ?AUTO_463 ?AUTO_459 ) ) ( ON ?AUTO_459 ?AUTO_460 ) ( CLEAR ?AUTO_459 ) ( ON ?AUTO_458 ?AUTO_462 ) ( CLEAR ?AUTO_458 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_458 ?AUTO_462 )
      ( MAKE-ON ?AUTO_457 ?AUTO_458 )
      ( MAKE-ON-VERIFY ?AUTO_457 ?AUTO_458 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1426 - BLOCK
    )
    :vars
    (
      ?AUTO_1427 - BLOCK
      ?AUTO_1428 - BLOCK
      ?AUTO_1429 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1426 ?AUTO_1427 ) ( not ( = ?AUTO_1426 ?AUTO_1427 ) ) ( not ( = ?AUTO_1426 ?AUTO_1428 ) ) ( not ( = ?AUTO_1426 ?AUTO_1429 ) ) ( not ( = ?AUTO_1427 ?AUTO_1428 ) ) ( not ( = ?AUTO_1427 ?AUTO_1429 ) ) ( not ( = ?AUTO_1428 ?AUTO_1429 ) ) ( ON ?AUTO_1428 ?AUTO_1426 ) ( ON ?AUTO_1429 ?AUTO_1428 ) ( CLEAR ?AUTO_1429 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1429 ?AUTO_1428 )
      ( MAKE-ON-TABLE ?AUTO_1426 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1426 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_747 - BLOCK
    )
    :vars
    (
      ?AUTO_749 - BLOCK
      ?AUTO_748 - BLOCK
      ?AUTO_750 - BLOCK
      ?AUTO_751 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_747 ?AUTO_749 ) ( not ( = ?AUTO_747 ?AUTO_749 ) ) ( not ( = ?AUTO_747 ?AUTO_748 ) ) ( not ( = ?AUTO_747 ?AUTO_750 ) ) ( not ( = ?AUTO_749 ?AUTO_748 ) ) ( not ( = ?AUTO_749 ?AUTO_750 ) ) ( not ( = ?AUTO_748 ?AUTO_750 ) ) ( ON ?AUTO_748 ?AUTO_747 ) ( not ( = ?AUTO_747 ?AUTO_751 ) ) ( not ( = ?AUTO_749 ?AUTO_751 ) ) ( not ( = ?AUTO_750 ?AUTO_751 ) ) ( not ( = ?AUTO_748 ?AUTO_751 ) ) ( ON ?AUTO_751 ?AUTO_748 ) ( CLEAR ?AUTO_751 ) ( HOLDING ?AUTO_750 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_750 )
      ( MAKE-ON-TABLE ?AUTO_747 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_747 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_525 - BLOCK
      ?AUTO_526 - BLOCK
    )
    :vars
    (
      ?AUTO_527 - BLOCK
      ?AUTO_528 - BLOCK
      ?AUTO_529 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_525 ?AUTO_526 ) ) ( ON ?AUTO_525 ?AUTO_527 ) ( not ( = ?AUTO_525 ?AUTO_527 ) ) ( not ( = ?AUTO_526 ?AUTO_527 ) ) ( not ( = ?AUTO_525 ?AUTO_528 ) ) ( not ( = ?AUTO_526 ?AUTO_528 ) ) ( not ( = ?AUTO_527 ?AUTO_528 ) ) ( ON ?AUTO_528 ?AUTO_525 ) ( CLEAR ?AUTO_528 ) ( HOLDING ?AUTO_526 ) ( CLEAR ?AUTO_529 ) ( not ( = ?AUTO_525 ?AUTO_529 ) ) ( not ( = ?AUTO_526 ?AUTO_529 ) ) ( not ( = ?AUTO_527 ?AUTO_529 ) ) ( not ( = ?AUTO_528 ?AUTO_529 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_526 ?AUTO_529 )
      ( MAKE-ON ?AUTO_525 ?AUTO_526 )
      ( MAKE-ON-VERIFY ?AUTO_525 ?AUTO_526 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_542 - BLOCK
      ?AUTO_543 - BLOCK
    )
    :vars
    (
      ?AUTO_545 - BLOCK
      ?AUTO_544 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_542 ?AUTO_543 ) ) ( not ( = ?AUTO_542 ?AUTO_545 ) ) ( not ( = ?AUTO_543 ?AUTO_545 ) ) ( not ( = ?AUTO_542 ?AUTO_544 ) ) ( not ( = ?AUTO_543 ?AUTO_544 ) ) ( not ( = ?AUTO_545 ?AUTO_544 ) ) ( ON ?AUTO_544 ?AUTO_543 ) ( CLEAR ?AUTO_544 ) ( CLEAR ?AUTO_545 ) ( ON-TABLE ?AUTO_542 ) ( CLEAR ?AUTO_542 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_542 )
      ( MAKE-ON ?AUTO_542 ?AUTO_543 )
      ( MAKE-ON-VERIFY ?AUTO_542 ?AUTO_543 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_550 - BLOCK
      ?AUTO_551 - BLOCK
    )
    :vars
    (
      ?AUTO_552 - BLOCK
      ?AUTO_553 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_550 ?AUTO_551 ) ) ( not ( = ?AUTO_550 ?AUTO_552 ) ) ( not ( = ?AUTO_551 ?AUTO_552 ) ) ( not ( = ?AUTO_550 ?AUTO_553 ) ) ( not ( = ?AUTO_551 ?AUTO_553 ) ) ( not ( = ?AUTO_552 ?AUTO_553 ) ) ( ON ?AUTO_553 ?AUTO_551 ) ( ON-TABLE ?AUTO_550 ) ( CLEAR ?AUTO_550 ) ( ON ?AUTO_552 ?AUTO_553 ) ( CLEAR ?AUTO_552 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_552 ?AUTO_553 )
      ( MAKE-ON ?AUTO_550 ?AUTO_551 )
      ( MAKE-ON-VERIFY ?AUTO_550 ?AUTO_551 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_554 - BLOCK
      ?AUTO_555 - BLOCK
    )
    :vars
    (
      ?AUTO_557 - BLOCK
      ?AUTO_556 - BLOCK
      ?AUTO_558 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_554 ?AUTO_555 ) ) ( not ( = ?AUTO_554 ?AUTO_557 ) ) ( not ( = ?AUTO_555 ?AUTO_557 ) ) ( not ( = ?AUTO_554 ?AUTO_556 ) ) ( not ( = ?AUTO_555 ?AUTO_556 ) ) ( not ( = ?AUTO_557 ?AUTO_556 ) ) ( ON ?AUTO_556 ?AUTO_555 ) ( ON-TABLE ?AUTO_554 ) ( CLEAR ?AUTO_554 ) ( ON ?AUTO_557 ?AUTO_556 ) ( CLEAR ?AUTO_557 ) ( HOLDING ?AUTO_558 ) ( not ( = ?AUTO_554 ?AUTO_558 ) ) ( not ( = ?AUTO_555 ?AUTO_558 ) ) ( not ( = ?AUTO_557 ?AUTO_558 ) ) ( not ( = ?AUTO_556 ?AUTO_558 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_558 )
      ( MAKE-ON ?AUTO_554 ?AUTO_555 )
      ( MAKE-ON-VERIFY ?AUTO_554 ?AUTO_555 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_559 - BLOCK
      ?AUTO_560 - BLOCK
    )
    :vars
    (
      ?AUTO_562 - BLOCK
      ?AUTO_561 - BLOCK
      ?AUTO_563 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_559 ?AUTO_560 ) ) ( not ( = ?AUTO_559 ?AUTO_562 ) ) ( not ( = ?AUTO_560 ?AUTO_562 ) ) ( not ( = ?AUTO_559 ?AUTO_561 ) ) ( not ( = ?AUTO_560 ?AUTO_561 ) ) ( not ( = ?AUTO_562 ?AUTO_561 ) ) ( ON ?AUTO_561 ?AUTO_560 ) ( ON-TABLE ?AUTO_559 ) ( CLEAR ?AUTO_559 ) ( ON ?AUTO_562 ?AUTO_561 ) ( not ( = ?AUTO_559 ?AUTO_563 ) ) ( not ( = ?AUTO_560 ?AUTO_563 ) ) ( not ( = ?AUTO_562 ?AUTO_563 ) ) ( not ( = ?AUTO_561 ?AUTO_563 ) ) ( ON ?AUTO_563 ?AUTO_562 ) ( CLEAR ?AUTO_563 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_563 ?AUTO_562 )
      ( MAKE-ON ?AUTO_559 ?AUTO_560 )
      ( MAKE-ON-VERIFY ?AUTO_559 ?AUTO_560 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_564 - BLOCK
      ?AUTO_565 - BLOCK
    )
    :vars
    (
      ?AUTO_566 - BLOCK
      ?AUTO_567 - BLOCK
      ?AUTO_568 - BLOCK
      ?AUTO_569 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_564 ?AUTO_565 ) ) ( not ( = ?AUTO_564 ?AUTO_566 ) ) ( not ( = ?AUTO_565 ?AUTO_566 ) ) ( not ( = ?AUTO_564 ?AUTO_567 ) ) ( not ( = ?AUTO_565 ?AUTO_567 ) ) ( not ( = ?AUTO_566 ?AUTO_567 ) ) ( ON ?AUTO_567 ?AUTO_565 ) ( ON-TABLE ?AUTO_564 ) ( CLEAR ?AUTO_564 ) ( ON ?AUTO_566 ?AUTO_567 ) ( not ( = ?AUTO_564 ?AUTO_568 ) ) ( not ( = ?AUTO_565 ?AUTO_568 ) ) ( not ( = ?AUTO_566 ?AUTO_568 ) ) ( not ( = ?AUTO_567 ?AUTO_568 ) ) ( ON ?AUTO_568 ?AUTO_566 ) ( CLEAR ?AUTO_568 ) ( HOLDING ?AUTO_569 ) ( not ( = ?AUTO_564 ?AUTO_569 ) ) ( not ( = ?AUTO_565 ?AUTO_569 ) ) ( not ( = ?AUTO_566 ?AUTO_569 ) ) ( not ( = ?AUTO_567 ?AUTO_569 ) ) ( not ( = ?AUTO_568 ?AUTO_569 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_569 )
      ( MAKE-ON ?AUTO_564 ?AUTO_565 )
      ( MAKE-ON-VERIFY ?AUTO_564 ?AUTO_565 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_596 - BLOCK
      ?AUTO_597 - BLOCK
    )
    :vars
    (
      ?AUTO_599 - BLOCK
      ?AUTO_598 - BLOCK
      ?AUTO_600 - BLOCK
      ?AUTO_601 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_596 ?AUTO_597 ) ) ( ON-TABLE ?AUTO_596 ) ( CLEAR ?AUTO_599 ) ( not ( = ?AUTO_596 ?AUTO_598 ) ) ( not ( = ?AUTO_596 ?AUTO_599 ) ) ( not ( = ?AUTO_597 ?AUTO_598 ) ) ( not ( = ?AUTO_597 ?AUTO_599 ) ) ( not ( = ?AUTO_598 ?AUTO_599 ) ) ( ON ?AUTO_598 ?AUTO_596 ) ( not ( = ?AUTO_596 ?AUTO_600 ) ) ( not ( = ?AUTO_597 ?AUTO_600 ) ) ( not ( = ?AUTO_599 ?AUTO_600 ) ) ( not ( = ?AUTO_598 ?AUTO_600 ) ) ( ON ?AUTO_600 ?AUTO_598 ) ( CLEAR ?AUTO_600 ) ( HOLDING ?AUTO_597 ) ( CLEAR ?AUTO_601 ) ( not ( = ?AUTO_596 ?AUTO_601 ) ) ( not ( = ?AUTO_597 ?AUTO_601 ) ) ( not ( = ?AUTO_599 ?AUTO_601 ) ) ( not ( = ?AUTO_598 ?AUTO_601 ) ) ( not ( = ?AUTO_600 ?AUTO_601 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_597 ?AUTO_601 )
      ( MAKE-ON ?AUTO_596 ?AUTO_597 )
      ( MAKE-ON-VERIFY ?AUTO_596 ?AUTO_597 ) )
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
      ?AUTO_1295 - BLOCK
      ?AUTO_1294 - BLOCK
      ?AUTO_1296 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1291 ?AUTO_1292 ) ) ( ON-TABLE ?AUTO_1291 ) ( not ( = ?AUTO_1291 ?AUTO_1293 ) ) ( not ( = ?AUTO_1291 ?AUTO_1295 ) ) ( not ( = ?AUTO_1292 ?AUTO_1293 ) ) ( not ( = ?AUTO_1292 ?AUTO_1295 ) ) ( not ( = ?AUTO_1293 ?AUTO_1295 ) ) ( not ( = ?AUTO_1291 ?AUTO_1294 ) ) ( not ( = ?AUTO_1292 ?AUTO_1294 ) ) ( not ( = ?AUTO_1293 ?AUTO_1294 ) ) ( not ( = ?AUTO_1295 ?AUTO_1294 ) ) ( ON ?AUTO_1295 ?AUTO_1291 ) ( ON ?AUTO_1293 ?AUTO_1295 ) ( CLEAR ?AUTO_1293 ) ( CLEAR ?AUTO_1296 ) ( not ( = ?AUTO_1291 ?AUTO_1296 ) ) ( not ( = ?AUTO_1292 ?AUTO_1296 ) ) ( not ( = ?AUTO_1293 ?AUTO_1296 ) ) ( not ( = ?AUTO_1295 ?AUTO_1296 ) ) ( not ( = ?AUTO_1294 ?AUTO_1296 ) ) ( ON ?AUTO_1294 ?AUTO_1292 ) ( CLEAR ?AUTO_1294 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1294 ?AUTO_1292 )
      ( MAKE-ON ?AUTO_1291 ?AUTO_1292 )
      ( MAKE-ON-VERIFY ?AUTO_1291 ?AUTO_1292 ) )
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
      ?AUTO_1302 - BLOCK
      ?AUTO_1300 - BLOCK
      ?AUTO_1301 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1297 ?AUTO_1298 ) ) ( ON-TABLE ?AUTO_1297 ) ( not ( = ?AUTO_1297 ?AUTO_1299 ) ) ( not ( = ?AUTO_1297 ?AUTO_1302 ) ) ( not ( = ?AUTO_1298 ?AUTO_1299 ) ) ( not ( = ?AUTO_1298 ?AUTO_1302 ) ) ( not ( = ?AUTO_1299 ?AUTO_1302 ) ) ( not ( = ?AUTO_1297 ?AUTO_1300 ) ) ( not ( = ?AUTO_1298 ?AUTO_1300 ) ) ( not ( = ?AUTO_1299 ?AUTO_1300 ) ) ( not ( = ?AUTO_1302 ?AUTO_1300 ) ) ( ON ?AUTO_1302 ?AUTO_1297 ) ( CLEAR ?AUTO_1301 ) ( not ( = ?AUTO_1297 ?AUTO_1301 ) ) ( not ( = ?AUTO_1298 ?AUTO_1301 ) ) ( not ( = ?AUTO_1299 ?AUTO_1301 ) ) ( not ( = ?AUTO_1302 ?AUTO_1301 ) ) ( not ( = ?AUTO_1300 ?AUTO_1301 ) ) ( ON ?AUTO_1300 ?AUTO_1298 ) ( CLEAR ?AUTO_1300 ) ( HOLDING ?AUTO_1299 ) ( CLEAR ?AUTO_1302 ) )
    :subtasks
    ( ( !STACK ?AUTO_1299 ?AUTO_1302 )
      ( MAKE-ON ?AUTO_1297 ?AUTO_1298 )
      ( MAKE-ON-VERIFY ?AUTO_1297 ?AUTO_1298 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1303 - BLOCK
      ?AUTO_1304 - BLOCK
    )
    :vars
    (
      ?AUTO_1305 - BLOCK
      ?AUTO_1308 - BLOCK
      ?AUTO_1306 - BLOCK
      ?AUTO_1307 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1303 ?AUTO_1304 ) ) ( ON-TABLE ?AUTO_1303 ) ( not ( = ?AUTO_1303 ?AUTO_1305 ) ) ( not ( = ?AUTO_1303 ?AUTO_1308 ) ) ( not ( = ?AUTO_1304 ?AUTO_1305 ) ) ( not ( = ?AUTO_1304 ?AUTO_1308 ) ) ( not ( = ?AUTO_1305 ?AUTO_1308 ) ) ( not ( = ?AUTO_1303 ?AUTO_1306 ) ) ( not ( = ?AUTO_1304 ?AUTO_1306 ) ) ( not ( = ?AUTO_1305 ?AUTO_1306 ) ) ( not ( = ?AUTO_1308 ?AUTO_1306 ) ) ( ON ?AUTO_1308 ?AUTO_1303 ) ( CLEAR ?AUTO_1307 ) ( not ( = ?AUTO_1303 ?AUTO_1307 ) ) ( not ( = ?AUTO_1304 ?AUTO_1307 ) ) ( not ( = ?AUTO_1305 ?AUTO_1307 ) ) ( not ( = ?AUTO_1308 ?AUTO_1307 ) ) ( not ( = ?AUTO_1306 ?AUTO_1307 ) ) ( ON ?AUTO_1306 ?AUTO_1304 ) ( CLEAR ?AUTO_1308 ) ( ON ?AUTO_1305 ?AUTO_1306 ) ( CLEAR ?AUTO_1305 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1305 ?AUTO_1306 )
      ( MAKE-ON ?AUTO_1303 ?AUTO_1304 )
      ( MAKE-ON-VERIFY ?AUTO_1303 ?AUTO_1304 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2822 - BLOCK
      ?AUTO_2823 - BLOCK
    )
    :vars
    (
      ?AUTO_2825 - BLOCK
      ?AUTO_2827 - BLOCK
      ?AUTO_2826 - BLOCK
      ?AUTO_2824 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2822 ?AUTO_2823 ) ) ( ON-TABLE ?AUTO_2822 ) ( not ( = ?AUTO_2822 ?AUTO_2825 ) ) ( not ( = ?AUTO_2822 ?AUTO_2827 ) ) ( not ( = ?AUTO_2823 ?AUTO_2825 ) ) ( not ( = ?AUTO_2823 ?AUTO_2827 ) ) ( not ( = ?AUTO_2825 ?AUTO_2827 ) ) ( CLEAR ?AUTO_2826 ) ( not ( = ?AUTO_2822 ?AUTO_2826 ) ) ( not ( = ?AUTO_2823 ?AUTO_2826 ) ) ( not ( = ?AUTO_2825 ?AUTO_2826 ) ) ( not ( = ?AUTO_2827 ?AUTO_2826 ) ) ( ON ?AUTO_2827 ?AUTO_2823 ) ( not ( = ?AUTO_2822 ?AUTO_2824 ) ) ( not ( = ?AUTO_2823 ?AUTO_2824 ) ) ( not ( = ?AUTO_2825 ?AUTO_2824 ) ) ( not ( = ?AUTO_2827 ?AUTO_2824 ) ) ( not ( = ?AUTO_2826 ?AUTO_2824 ) ) ( ON ?AUTO_2824 ?AUTO_2827 ) ( CLEAR ?AUTO_2824 ) ( HOLDING ?AUTO_2825 ) ( CLEAR ?AUTO_2822 ) )
    :subtasks
    ( ( !STACK ?AUTO_2825 ?AUTO_2822 )
      ( MAKE-ON ?AUTO_2822 ?AUTO_2823 )
      ( MAKE-ON-VERIFY ?AUTO_2822 ?AUTO_2823 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_639 - BLOCK
      ?AUTO_640 - BLOCK
    )
    :vars
    (
      ?AUTO_643 - BLOCK
      ?AUTO_642 - BLOCK
      ?AUTO_644 - BLOCK
      ?AUTO_645 - BLOCK
      ?AUTO_641 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_639 ?AUTO_640 ) ) ( ON-TABLE ?AUTO_639 ) ( CLEAR ?AUTO_643 ) ( not ( = ?AUTO_639 ?AUTO_642 ) ) ( not ( = ?AUTO_639 ?AUTO_643 ) ) ( not ( = ?AUTO_640 ?AUTO_642 ) ) ( not ( = ?AUTO_640 ?AUTO_643 ) ) ( not ( = ?AUTO_642 ?AUTO_643 ) ) ( not ( = ?AUTO_639 ?AUTO_644 ) ) ( not ( = ?AUTO_640 ?AUTO_644 ) ) ( not ( = ?AUTO_643 ?AUTO_644 ) ) ( not ( = ?AUTO_642 ?AUTO_644 ) ) ( CLEAR ?AUTO_645 ) ( not ( = ?AUTO_639 ?AUTO_641 ) ) ( not ( = ?AUTO_639 ?AUTO_645 ) ) ( not ( = ?AUTO_640 ?AUTO_641 ) ) ( not ( = ?AUTO_640 ?AUTO_645 ) ) ( not ( = ?AUTO_643 ?AUTO_641 ) ) ( not ( = ?AUTO_643 ?AUTO_645 ) ) ( not ( = ?AUTO_642 ?AUTO_641 ) ) ( not ( = ?AUTO_642 ?AUTO_645 ) ) ( not ( = ?AUTO_644 ?AUTO_641 ) ) ( not ( = ?AUTO_644 ?AUTO_645 ) ) ( not ( = ?AUTO_641 ?AUTO_645 ) ) ( ON ?AUTO_641 ?AUTO_640 ) ( ON ?AUTO_644 ?AUTO_641 ) ( CLEAR ?AUTO_644 ) ( CLEAR ?AUTO_639 ) ( ON-TABLE ?AUTO_642 ) ( CLEAR ?AUTO_642 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_642 )
      ( MAKE-ON ?AUTO_639 ?AUTO_640 )
      ( MAKE-ON-VERIFY ?AUTO_639 ?AUTO_640 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2380 - BLOCK
      ?AUTO_2381 - BLOCK
    )
    :vars
    (
      ?AUTO_2383 - BLOCK
      ?AUTO_2382 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2380 ?AUTO_2381 ) ) ( not ( = ?AUTO_2380 ?AUTO_2383 ) ) ( not ( = ?AUTO_2381 ?AUTO_2383 ) ) ( ON ?AUTO_2383 ?AUTO_2381 ) ( not ( = ?AUTO_2380 ?AUTO_2382 ) ) ( not ( = ?AUTO_2381 ?AUTO_2382 ) ) ( not ( = ?AUTO_2383 ?AUTO_2382 ) ) ( ON ?AUTO_2382 ?AUTO_2383 ) ( CLEAR ?AUTO_2382 ) ( HOLDING ?AUTO_2380 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2380 )
      ( MAKE-ON ?AUTO_2380 ?AUTO_2381 )
      ( MAKE-ON-VERIFY ?AUTO_2380 ?AUTO_2381 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2384 - BLOCK
      ?AUTO_2385 - BLOCK
    )
    :vars
    (
      ?AUTO_2387 - BLOCK
      ?AUTO_2386 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2384 ?AUTO_2385 ) ) ( not ( = ?AUTO_2384 ?AUTO_2387 ) ) ( not ( = ?AUTO_2385 ?AUTO_2387 ) ) ( ON ?AUTO_2387 ?AUTO_2385 ) ( not ( = ?AUTO_2384 ?AUTO_2386 ) ) ( not ( = ?AUTO_2385 ?AUTO_2386 ) ) ( not ( = ?AUTO_2387 ?AUTO_2386 ) ) ( ON ?AUTO_2386 ?AUTO_2387 ) ( ON ?AUTO_2384 ?AUTO_2386 ) ( CLEAR ?AUTO_2384 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2384 ?AUTO_2386 )
      ( MAKE-ON ?AUTO_2384 ?AUTO_2385 )
      ( MAKE-ON-VERIFY ?AUTO_2384 ?AUTO_2385 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_660 - BLOCK
      ?AUTO_661 - BLOCK
    )
    :vars
    (
      ?AUTO_662 - BLOCK
      ?AUTO_665 - BLOCK
      ?AUTO_666 - BLOCK
      ?AUTO_663 - BLOCK
      ?AUTO_664 - BLOCK
      ?AUTO_667 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_660 ?AUTO_661 ) ) ( CLEAR ?AUTO_662 ) ( not ( = ?AUTO_660 ?AUTO_665 ) ) ( not ( = ?AUTO_660 ?AUTO_662 ) ) ( not ( = ?AUTO_661 ?AUTO_665 ) ) ( not ( = ?AUTO_661 ?AUTO_662 ) ) ( not ( = ?AUTO_665 ?AUTO_662 ) ) ( not ( = ?AUTO_660 ?AUTO_666 ) ) ( not ( = ?AUTO_661 ?AUTO_666 ) ) ( not ( = ?AUTO_662 ?AUTO_666 ) ) ( not ( = ?AUTO_665 ?AUTO_666 ) ) ( CLEAR ?AUTO_663 ) ( not ( = ?AUTO_660 ?AUTO_664 ) ) ( not ( = ?AUTO_660 ?AUTO_663 ) ) ( not ( = ?AUTO_661 ?AUTO_664 ) ) ( not ( = ?AUTO_661 ?AUTO_663 ) ) ( not ( = ?AUTO_662 ?AUTO_664 ) ) ( not ( = ?AUTO_662 ?AUTO_663 ) ) ( not ( = ?AUTO_665 ?AUTO_664 ) ) ( not ( = ?AUTO_665 ?AUTO_663 ) ) ( not ( = ?AUTO_666 ?AUTO_664 ) ) ( not ( = ?AUTO_666 ?AUTO_663 ) ) ( not ( = ?AUTO_664 ?AUTO_663 ) ) ( ON ?AUTO_664 ?AUTO_661 ) ( ON ?AUTO_666 ?AUTO_664 ) ( ON-TABLE ?AUTO_665 ) ( CLEAR ?AUTO_665 ) ( ON ?AUTO_660 ?AUTO_666 ) ( CLEAR ?AUTO_660 ) ( HOLDING ?AUTO_667 ) ( not ( = ?AUTO_660 ?AUTO_667 ) ) ( not ( = ?AUTO_661 ?AUTO_667 ) ) ( not ( = ?AUTO_662 ?AUTO_667 ) ) ( not ( = ?AUTO_665 ?AUTO_667 ) ) ( not ( = ?AUTO_666 ?AUTO_667 ) ) ( not ( = ?AUTO_663 ?AUTO_667 ) ) ( not ( = ?AUTO_664 ?AUTO_667 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_667 )
      ( MAKE-ON ?AUTO_660 ?AUTO_661 )
      ( MAKE-ON-VERIFY ?AUTO_660 ?AUTO_661 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_668 - BLOCK
      ?AUTO_669 - BLOCK
    )
    :vars
    (
      ?AUTO_673 - BLOCK
      ?AUTO_672 - BLOCK
      ?AUTO_670 - BLOCK
      ?AUTO_671 - BLOCK
      ?AUTO_674 - BLOCK
      ?AUTO_675 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_668 ?AUTO_669 ) ) ( CLEAR ?AUTO_673 ) ( not ( = ?AUTO_668 ?AUTO_672 ) ) ( not ( = ?AUTO_668 ?AUTO_673 ) ) ( not ( = ?AUTO_669 ?AUTO_672 ) ) ( not ( = ?AUTO_669 ?AUTO_673 ) ) ( not ( = ?AUTO_672 ?AUTO_673 ) ) ( not ( = ?AUTO_668 ?AUTO_670 ) ) ( not ( = ?AUTO_669 ?AUTO_670 ) ) ( not ( = ?AUTO_673 ?AUTO_670 ) ) ( not ( = ?AUTO_672 ?AUTO_670 ) ) ( CLEAR ?AUTO_671 ) ( not ( = ?AUTO_668 ?AUTO_674 ) ) ( not ( = ?AUTO_668 ?AUTO_671 ) ) ( not ( = ?AUTO_669 ?AUTO_674 ) ) ( not ( = ?AUTO_669 ?AUTO_671 ) ) ( not ( = ?AUTO_673 ?AUTO_674 ) ) ( not ( = ?AUTO_673 ?AUTO_671 ) ) ( not ( = ?AUTO_672 ?AUTO_674 ) ) ( not ( = ?AUTO_672 ?AUTO_671 ) ) ( not ( = ?AUTO_670 ?AUTO_674 ) ) ( not ( = ?AUTO_670 ?AUTO_671 ) ) ( not ( = ?AUTO_674 ?AUTO_671 ) ) ( ON ?AUTO_674 ?AUTO_669 ) ( ON ?AUTO_670 ?AUTO_674 ) ( ON-TABLE ?AUTO_672 ) ( CLEAR ?AUTO_672 ) ( ON ?AUTO_668 ?AUTO_670 ) ( not ( = ?AUTO_668 ?AUTO_675 ) ) ( not ( = ?AUTO_669 ?AUTO_675 ) ) ( not ( = ?AUTO_673 ?AUTO_675 ) ) ( not ( = ?AUTO_672 ?AUTO_675 ) ) ( not ( = ?AUTO_670 ?AUTO_675 ) ) ( not ( = ?AUTO_671 ?AUTO_675 ) ) ( not ( = ?AUTO_674 ?AUTO_675 ) ) ( ON ?AUTO_675 ?AUTO_668 ) ( CLEAR ?AUTO_675 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_675 ?AUTO_668 )
      ( MAKE-ON ?AUTO_668 ?AUTO_669 )
      ( MAKE-ON-VERIFY ?AUTO_668 ?AUTO_669 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_676 - BLOCK
      ?AUTO_677 - BLOCK
    )
    :vars
    (
      ?AUTO_681 - BLOCK
      ?AUTO_682 - BLOCK
      ?AUTO_680 - BLOCK
      ?AUTO_679 - BLOCK
      ?AUTO_683 - BLOCK
      ?AUTO_678 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_676 ?AUTO_677 ) ) ( not ( = ?AUTO_676 ?AUTO_681 ) ) ( not ( = ?AUTO_676 ?AUTO_682 ) ) ( not ( = ?AUTO_677 ?AUTO_681 ) ) ( not ( = ?AUTO_677 ?AUTO_682 ) ) ( not ( = ?AUTO_681 ?AUTO_682 ) ) ( not ( = ?AUTO_676 ?AUTO_680 ) ) ( not ( = ?AUTO_677 ?AUTO_680 ) ) ( not ( = ?AUTO_682 ?AUTO_680 ) ) ( not ( = ?AUTO_681 ?AUTO_680 ) ) ( CLEAR ?AUTO_679 ) ( not ( = ?AUTO_676 ?AUTO_683 ) ) ( not ( = ?AUTO_676 ?AUTO_679 ) ) ( not ( = ?AUTO_677 ?AUTO_683 ) ) ( not ( = ?AUTO_677 ?AUTO_679 ) ) ( not ( = ?AUTO_682 ?AUTO_683 ) ) ( not ( = ?AUTO_682 ?AUTO_679 ) ) ( not ( = ?AUTO_681 ?AUTO_683 ) ) ( not ( = ?AUTO_681 ?AUTO_679 ) ) ( not ( = ?AUTO_680 ?AUTO_683 ) ) ( not ( = ?AUTO_680 ?AUTO_679 ) ) ( not ( = ?AUTO_683 ?AUTO_679 ) ) ( ON ?AUTO_683 ?AUTO_677 ) ( ON ?AUTO_680 ?AUTO_683 ) ( ON-TABLE ?AUTO_681 ) ( CLEAR ?AUTO_681 ) ( ON ?AUTO_676 ?AUTO_680 ) ( not ( = ?AUTO_676 ?AUTO_678 ) ) ( not ( = ?AUTO_677 ?AUTO_678 ) ) ( not ( = ?AUTO_682 ?AUTO_678 ) ) ( not ( = ?AUTO_681 ?AUTO_678 ) ) ( not ( = ?AUTO_680 ?AUTO_678 ) ) ( not ( = ?AUTO_679 ?AUTO_678 ) ) ( not ( = ?AUTO_683 ?AUTO_678 ) ) ( ON ?AUTO_678 ?AUTO_676 ) ( CLEAR ?AUTO_678 ) ( HOLDING ?AUTO_682 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_682 )
      ( MAKE-ON ?AUTO_676 ?AUTO_677 )
      ( MAKE-ON-VERIFY ?AUTO_676 ?AUTO_677 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_684 - BLOCK
      ?AUTO_685 - BLOCK
    )
    :vars
    (
      ?AUTO_687 - BLOCK
      ?AUTO_691 - BLOCK
      ?AUTO_689 - BLOCK
      ?AUTO_690 - BLOCK
      ?AUTO_688 - BLOCK
      ?AUTO_686 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_684 ?AUTO_685 ) ) ( not ( = ?AUTO_684 ?AUTO_687 ) ) ( not ( = ?AUTO_684 ?AUTO_691 ) ) ( not ( = ?AUTO_685 ?AUTO_687 ) ) ( not ( = ?AUTO_685 ?AUTO_691 ) ) ( not ( = ?AUTO_687 ?AUTO_691 ) ) ( not ( = ?AUTO_684 ?AUTO_689 ) ) ( not ( = ?AUTO_685 ?AUTO_689 ) ) ( not ( = ?AUTO_691 ?AUTO_689 ) ) ( not ( = ?AUTO_687 ?AUTO_689 ) ) ( not ( = ?AUTO_684 ?AUTO_690 ) ) ( not ( = ?AUTO_684 ?AUTO_688 ) ) ( not ( = ?AUTO_685 ?AUTO_690 ) ) ( not ( = ?AUTO_685 ?AUTO_688 ) ) ( not ( = ?AUTO_691 ?AUTO_690 ) ) ( not ( = ?AUTO_691 ?AUTO_688 ) ) ( not ( = ?AUTO_687 ?AUTO_690 ) ) ( not ( = ?AUTO_687 ?AUTO_688 ) ) ( not ( = ?AUTO_689 ?AUTO_690 ) ) ( not ( = ?AUTO_689 ?AUTO_688 ) ) ( not ( = ?AUTO_690 ?AUTO_688 ) ) ( ON ?AUTO_690 ?AUTO_685 ) ( ON ?AUTO_689 ?AUTO_690 ) ( ON-TABLE ?AUTO_687 ) ( CLEAR ?AUTO_687 ) ( ON ?AUTO_684 ?AUTO_689 ) ( not ( = ?AUTO_684 ?AUTO_686 ) ) ( not ( = ?AUTO_685 ?AUTO_686 ) ) ( not ( = ?AUTO_691 ?AUTO_686 ) ) ( not ( = ?AUTO_687 ?AUTO_686 ) ) ( not ( = ?AUTO_689 ?AUTO_686 ) ) ( not ( = ?AUTO_688 ?AUTO_686 ) ) ( not ( = ?AUTO_690 ?AUTO_686 ) ) ( ON ?AUTO_686 ?AUTO_684 ) ( CLEAR ?AUTO_686 ) ( ON ?AUTO_691 ?AUTO_688 ) ( CLEAR ?AUTO_691 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_691 ?AUTO_688 )
      ( MAKE-ON ?AUTO_684 ?AUTO_685 )
      ( MAKE-ON-VERIFY ?AUTO_684 ?AUTO_685 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_719 - BLOCK
      ?AUTO_720 - BLOCK
    )
    :vars
    (
      ?AUTO_722 - BLOCK
      ?AUTO_721 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_719 ?AUTO_720 ) ) ( ON ?AUTO_719 ?AUTO_722 ) ( not ( = ?AUTO_719 ?AUTO_722 ) ) ( not ( = ?AUTO_720 ?AUTO_722 ) ) ( not ( = ?AUTO_719 ?AUTO_721 ) ) ( not ( = ?AUTO_720 ?AUTO_721 ) ) ( not ( = ?AUTO_722 ?AUTO_721 ) ) ( ON ?AUTO_721 ?AUTO_719 ) ( CLEAR ?AUTO_721 ) ( HOLDING ?AUTO_720 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_720 )
      ( MAKE-ON ?AUTO_719 ?AUTO_720 )
      ( MAKE-ON-VERIFY ?AUTO_719 ?AUTO_720 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_761 - BLOCK
      ?AUTO_762 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_761 ?AUTO_762 ) ) ( ON-TABLE ?AUTO_761 ) ( ON ?AUTO_762 ?AUTO_761 ) ( CLEAR ?AUTO_762 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_762 ?AUTO_761 )
      ( MAKE-ON ?AUTO_761 ?AUTO_762 )
      ( MAKE-ON-VERIFY ?AUTO_761 ?AUTO_762 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_763 - BLOCK
      ?AUTO_764 - BLOCK
    )
    :vars
    (
      ?AUTO_765 - BLOCK
      ?AUTO_766 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_763 ?AUTO_764 ) ) ( ON-TABLE ?AUTO_763 ) ( ON ?AUTO_764 ?AUTO_763 ) ( CLEAR ?AUTO_764 ) ( HOLDING ?AUTO_765 ) ( CLEAR ?AUTO_766 ) ( not ( = ?AUTO_763 ?AUTO_765 ) ) ( not ( = ?AUTO_763 ?AUTO_766 ) ) ( not ( = ?AUTO_764 ?AUTO_765 ) ) ( not ( = ?AUTO_764 ?AUTO_766 ) ) ( not ( = ?AUTO_765 ?AUTO_766 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_765 ?AUTO_766 )
      ( MAKE-ON ?AUTO_763 ?AUTO_764 )
      ( MAKE-ON-VERIFY ?AUTO_763 ?AUTO_764 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_767 - BLOCK
      ?AUTO_768 - BLOCK
    )
    :vars
    (
      ?AUTO_770 - BLOCK
      ?AUTO_769 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_767 ?AUTO_768 ) ) ( ON-TABLE ?AUTO_767 ) ( ON ?AUTO_768 ?AUTO_767 ) ( CLEAR ?AUTO_770 ) ( not ( = ?AUTO_767 ?AUTO_769 ) ) ( not ( = ?AUTO_767 ?AUTO_770 ) ) ( not ( = ?AUTO_768 ?AUTO_769 ) ) ( not ( = ?AUTO_768 ?AUTO_770 ) ) ( not ( = ?AUTO_769 ?AUTO_770 ) ) ( ON ?AUTO_769 ?AUTO_768 ) ( CLEAR ?AUTO_769 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_769 ?AUTO_768 )
      ( MAKE-ON ?AUTO_767 ?AUTO_768 )
      ( MAKE-ON-VERIFY ?AUTO_767 ?AUTO_768 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_771 - BLOCK
      ?AUTO_772 - BLOCK
    )
    :vars
    (
      ?AUTO_774 - BLOCK
      ?AUTO_773 - BLOCK
      ?AUTO_775 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_771 ?AUTO_772 ) ) ( ON-TABLE ?AUTO_771 ) ( ON ?AUTO_772 ?AUTO_771 ) ( CLEAR ?AUTO_774 ) ( not ( = ?AUTO_771 ?AUTO_773 ) ) ( not ( = ?AUTO_771 ?AUTO_774 ) ) ( not ( = ?AUTO_772 ?AUTO_773 ) ) ( not ( = ?AUTO_772 ?AUTO_774 ) ) ( not ( = ?AUTO_773 ?AUTO_774 ) ) ( ON ?AUTO_773 ?AUTO_772 ) ( CLEAR ?AUTO_773 ) ( HOLDING ?AUTO_775 ) ( not ( = ?AUTO_771 ?AUTO_775 ) ) ( not ( = ?AUTO_772 ?AUTO_775 ) ) ( not ( = ?AUTO_774 ?AUTO_775 ) ) ( not ( = ?AUTO_773 ?AUTO_775 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_775 )
      ( MAKE-ON ?AUTO_771 ?AUTO_772 )
      ( MAKE-ON-VERIFY ?AUTO_771 ?AUTO_772 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_776 - BLOCK
      ?AUTO_777 - BLOCK
    )
    :vars
    (
      ?AUTO_779 - BLOCK
      ?AUTO_778 - BLOCK
      ?AUTO_780 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_776 ?AUTO_777 ) ) ( ON-TABLE ?AUTO_776 ) ( ON ?AUTO_777 ?AUTO_776 ) ( CLEAR ?AUTO_779 ) ( not ( = ?AUTO_776 ?AUTO_778 ) ) ( not ( = ?AUTO_776 ?AUTO_779 ) ) ( not ( = ?AUTO_777 ?AUTO_778 ) ) ( not ( = ?AUTO_777 ?AUTO_779 ) ) ( not ( = ?AUTO_778 ?AUTO_779 ) ) ( ON ?AUTO_778 ?AUTO_777 ) ( not ( = ?AUTO_776 ?AUTO_780 ) ) ( not ( = ?AUTO_777 ?AUTO_780 ) ) ( not ( = ?AUTO_779 ?AUTO_780 ) ) ( not ( = ?AUTO_778 ?AUTO_780 ) ) ( ON ?AUTO_780 ?AUTO_778 ) ( CLEAR ?AUTO_780 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_780 ?AUTO_778 )
      ( MAKE-ON ?AUTO_776 ?AUTO_777 )
      ( MAKE-ON-VERIFY ?AUTO_776 ?AUTO_777 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_781 - BLOCK
      ?AUTO_782 - BLOCK
    )
    :vars
    (
      ?AUTO_783 - BLOCK
      ?AUTO_784 - BLOCK
      ?AUTO_785 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_781 ?AUTO_782 ) ) ( ON-TABLE ?AUTO_781 ) ( ON ?AUTO_782 ?AUTO_781 ) ( not ( = ?AUTO_781 ?AUTO_783 ) ) ( not ( = ?AUTO_781 ?AUTO_784 ) ) ( not ( = ?AUTO_782 ?AUTO_783 ) ) ( not ( = ?AUTO_782 ?AUTO_784 ) ) ( not ( = ?AUTO_783 ?AUTO_784 ) ) ( ON ?AUTO_783 ?AUTO_782 ) ( not ( = ?AUTO_781 ?AUTO_785 ) ) ( not ( = ?AUTO_782 ?AUTO_785 ) ) ( not ( = ?AUTO_784 ?AUTO_785 ) ) ( not ( = ?AUTO_783 ?AUTO_785 ) ) ( ON ?AUTO_785 ?AUTO_783 ) ( CLEAR ?AUTO_785 ) ( HOLDING ?AUTO_784 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_784 )
      ( MAKE-ON ?AUTO_781 ?AUTO_782 )
      ( MAKE-ON-VERIFY ?AUTO_781 ?AUTO_782 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4796 - BLOCK
      ?AUTO_4797 - BLOCK
    )
    :vars
    (
      ?AUTO_4799 - BLOCK
      ?AUTO_4801 - BLOCK
      ?AUTO_4800 - BLOCK
      ?AUTO_4798 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4796 ?AUTO_4797 ) ) ( not ( = ?AUTO_4796 ?AUTO_4799 ) ) ( not ( = ?AUTO_4796 ?AUTO_4801 ) ) ( not ( = ?AUTO_4797 ?AUTO_4799 ) ) ( not ( = ?AUTO_4797 ?AUTO_4801 ) ) ( not ( = ?AUTO_4799 ?AUTO_4801 ) ) ( ON ?AUTO_4799 ?AUTO_4797 ) ( not ( = ?AUTO_4796 ?AUTO_4800 ) ) ( not ( = ?AUTO_4796 ?AUTO_4798 ) ) ( not ( = ?AUTO_4797 ?AUTO_4800 ) ) ( not ( = ?AUTO_4797 ?AUTO_4798 ) ) ( not ( = ?AUTO_4801 ?AUTO_4800 ) ) ( not ( = ?AUTO_4801 ?AUTO_4798 ) ) ( not ( = ?AUTO_4799 ?AUTO_4800 ) ) ( not ( = ?AUTO_4799 ?AUTO_4798 ) ) ( not ( = ?AUTO_4800 ?AUTO_4798 ) ) ( ON ?AUTO_4800 ?AUTO_4799 ) ( CLEAR ?AUTO_4800 ) ( ON ?AUTO_4796 ?AUTO_4801 ) ( CLEAR ?AUTO_4796 ) ( HOLDING ?AUTO_4798 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4798 )
      ( MAKE-ON ?AUTO_4796 ?AUTO_4797 )
      ( MAKE-ON-VERIFY ?AUTO_4796 ?AUTO_4797 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_835 - BLOCK
      ?AUTO_836 - BLOCK
    )
    :vars
    (
      ?AUTO_838 - BLOCK
      ?AUTO_837 - BLOCK
      ?AUTO_841 - BLOCK
      ?AUTO_839 - BLOCK
      ?AUTO_840 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_835 ?AUTO_836 ) ) ( ON ?AUTO_835 ?AUTO_838 ) ( CLEAR ?AUTO_835 ) ( not ( = ?AUTO_835 ?AUTO_838 ) ) ( not ( = ?AUTO_836 ?AUTO_838 ) ) ( not ( = ?AUTO_835 ?AUTO_837 ) ) ( not ( = ?AUTO_836 ?AUTO_837 ) ) ( not ( = ?AUTO_838 ?AUTO_837 ) ) ( ON ?AUTO_837 ?AUTO_836 ) ( not ( = ?AUTO_835 ?AUTO_841 ) ) ( not ( = ?AUTO_835 ?AUTO_839 ) ) ( not ( = ?AUTO_836 ?AUTO_841 ) ) ( not ( = ?AUTO_836 ?AUTO_839 ) ) ( not ( = ?AUTO_838 ?AUTO_841 ) ) ( not ( = ?AUTO_838 ?AUTO_839 ) ) ( not ( = ?AUTO_837 ?AUTO_841 ) ) ( not ( = ?AUTO_837 ?AUTO_839 ) ) ( not ( = ?AUTO_841 ?AUTO_839 ) ) ( ON ?AUTO_841 ?AUTO_837 ) ( not ( = ?AUTO_835 ?AUTO_840 ) ) ( not ( = ?AUTO_836 ?AUTO_840 ) ) ( not ( = ?AUTO_838 ?AUTO_840 ) ) ( not ( = ?AUTO_837 ?AUTO_840 ) ) ( not ( = ?AUTO_839 ?AUTO_840 ) ) ( not ( = ?AUTO_841 ?AUTO_840 ) ) ( ON ?AUTO_840 ?AUTO_841 ) ( CLEAR ?AUTO_840 ) ( HOLDING ?AUTO_839 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_839 )
      ( MAKE-ON ?AUTO_835 ?AUTO_836 )
      ( MAKE-ON-VERIFY ?AUTO_835 ?AUTO_836 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_842 - BLOCK
      ?AUTO_843 - BLOCK
    )
    :vars
    (
      ?AUTO_847 - BLOCK
      ?AUTO_846 - BLOCK
      ?AUTO_848 - BLOCK
      ?AUTO_844 - BLOCK
      ?AUTO_845 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_842 ?AUTO_843 ) ) ( ON ?AUTO_842 ?AUTO_847 ) ( not ( = ?AUTO_842 ?AUTO_847 ) ) ( not ( = ?AUTO_843 ?AUTO_847 ) ) ( not ( = ?AUTO_842 ?AUTO_846 ) ) ( not ( = ?AUTO_843 ?AUTO_846 ) ) ( not ( = ?AUTO_847 ?AUTO_846 ) ) ( ON ?AUTO_846 ?AUTO_843 ) ( not ( = ?AUTO_842 ?AUTO_848 ) ) ( not ( = ?AUTO_842 ?AUTO_844 ) ) ( not ( = ?AUTO_843 ?AUTO_848 ) ) ( not ( = ?AUTO_843 ?AUTO_844 ) ) ( not ( = ?AUTO_847 ?AUTO_848 ) ) ( not ( = ?AUTO_847 ?AUTO_844 ) ) ( not ( = ?AUTO_846 ?AUTO_848 ) ) ( not ( = ?AUTO_846 ?AUTO_844 ) ) ( not ( = ?AUTO_848 ?AUTO_844 ) ) ( ON ?AUTO_848 ?AUTO_846 ) ( not ( = ?AUTO_842 ?AUTO_845 ) ) ( not ( = ?AUTO_843 ?AUTO_845 ) ) ( not ( = ?AUTO_847 ?AUTO_845 ) ) ( not ( = ?AUTO_846 ?AUTO_845 ) ) ( not ( = ?AUTO_844 ?AUTO_845 ) ) ( not ( = ?AUTO_848 ?AUTO_845 ) ) ( ON ?AUTO_845 ?AUTO_848 ) ( CLEAR ?AUTO_845 ) ( ON ?AUTO_844 ?AUTO_842 ) ( CLEAR ?AUTO_844 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_844 ?AUTO_842 )
      ( MAKE-ON ?AUTO_842 ?AUTO_843 )
      ( MAKE-ON-VERIFY ?AUTO_842 ?AUTO_843 ) )
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
      ?AUTO_893 - BLOCK
      ?AUTO_892 - BLOCK
      ?AUTO_891 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_888 ?AUTO_889 ) ) ( ON ?AUTO_888 ?AUTO_890 ) ( not ( = ?AUTO_888 ?AUTO_890 ) ) ( not ( = ?AUTO_889 ?AUTO_890 ) ) ( not ( = ?AUTO_888 ?AUTO_893 ) ) ( not ( = ?AUTO_888 ?AUTO_892 ) ) ( not ( = ?AUTO_889 ?AUTO_893 ) ) ( not ( = ?AUTO_889 ?AUTO_892 ) ) ( not ( = ?AUTO_890 ?AUTO_893 ) ) ( not ( = ?AUTO_890 ?AUTO_892 ) ) ( not ( = ?AUTO_893 ?AUTO_892 ) ) ( ON ?AUTO_893 ?AUTO_888 ) ( CLEAR ?AUTO_893 ) ( CLEAR ?AUTO_891 ) ( not ( = ?AUTO_888 ?AUTO_891 ) ) ( not ( = ?AUTO_889 ?AUTO_891 ) ) ( not ( = ?AUTO_890 ?AUTO_891 ) ) ( not ( = ?AUTO_893 ?AUTO_891 ) ) ( not ( = ?AUTO_892 ?AUTO_891 ) ) ( ON ?AUTO_892 ?AUTO_889 ) ( CLEAR ?AUTO_892 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_892 ?AUTO_889 )
      ( MAKE-ON ?AUTO_888 ?AUTO_889 )
      ( MAKE-ON-VERIFY ?AUTO_888 ?AUTO_889 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2973 - BLOCK
      ?AUTO_2974 - BLOCK
    )
    :vars
    (
      ?AUTO_2978 - BLOCK
      ?AUTO_2977 - BLOCK
      ?AUTO_2975 - BLOCK
      ?AUTO_2976 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2973 ?AUTO_2974 ) ) ( ON ?AUTO_2973 ?AUTO_2978 ) ( not ( = ?AUTO_2973 ?AUTO_2978 ) ) ( not ( = ?AUTO_2974 ?AUTO_2978 ) ) ( not ( = ?AUTO_2973 ?AUTO_2977 ) ) ( not ( = ?AUTO_2974 ?AUTO_2977 ) ) ( not ( = ?AUTO_2978 ?AUTO_2977 ) ) ( ON ?AUTO_2977 ?AUTO_2973 ) ( CLEAR ?AUTO_2977 ) ( not ( = ?AUTO_2973 ?AUTO_2975 ) ) ( not ( = ?AUTO_2973 ?AUTO_2976 ) ) ( not ( = ?AUTO_2974 ?AUTO_2975 ) ) ( not ( = ?AUTO_2974 ?AUTO_2976 ) ) ( not ( = ?AUTO_2978 ?AUTO_2975 ) ) ( not ( = ?AUTO_2978 ?AUTO_2976 ) ) ( not ( = ?AUTO_2977 ?AUTO_2975 ) ) ( not ( = ?AUTO_2977 ?AUTO_2976 ) ) ( not ( = ?AUTO_2975 ?AUTO_2976 ) ) ( ON ?AUTO_2975 ?AUTO_2974 ) ( CLEAR ?AUTO_2975 ) ( HOLDING ?AUTO_2976 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2976 )
      ( MAKE-ON ?AUTO_2973 ?AUTO_2974 )
      ( MAKE-ON-VERIFY ?AUTO_2973 ?AUTO_2974 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2979 - BLOCK
      ?AUTO_2980 - BLOCK
    )
    :vars
    (
      ?AUTO_2981 - BLOCK
      ?AUTO_2982 - BLOCK
      ?AUTO_2984 - BLOCK
      ?AUTO_2983 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2979 ?AUTO_2980 ) ) ( ON ?AUTO_2979 ?AUTO_2981 ) ( not ( = ?AUTO_2979 ?AUTO_2981 ) ) ( not ( = ?AUTO_2980 ?AUTO_2981 ) ) ( not ( = ?AUTO_2979 ?AUTO_2982 ) ) ( not ( = ?AUTO_2980 ?AUTO_2982 ) ) ( not ( = ?AUTO_2981 ?AUTO_2982 ) ) ( ON ?AUTO_2982 ?AUTO_2979 ) ( not ( = ?AUTO_2979 ?AUTO_2984 ) ) ( not ( = ?AUTO_2979 ?AUTO_2983 ) ) ( not ( = ?AUTO_2980 ?AUTO_2984 ) ) ( not ( = ?AUTO_2980 ?AUTO_2983 ) ) ( not ( = ?AUTO_2981 ?AUTO_2984 ) ) ( not ( = ?AUTO_2981 ?AUTO_2983 ) ) ( not ( = ?AUTO_2982 ?AUTO_2984 ) ) ( not ( = ?AUTO_2982 ?AUTO_2983 ) ) ( not ( = ?AUTO_2984 ?AUTO_2983 ) ) ( ON ?AUTO_2984 ?AUTO_2980 ) ( CLEAR ?AUTO_2984 ) ( ON ?AUTO_2983 ?AUTO_2982 ) ( CLEAR ?AUTO_2983 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2983 ?AUTO_2982 )
      ( MAKE-ON ?AUTO_2979 ?AUTO_2980 )
      ( MAKE-ON-VERIFY ?AUTO_2979 ?AUTO_2980 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1440 - BLOCK
    )
    :vars
    (
      ?AUTO_1442 - BLOCK
      ?AUTO_1441 - BLOCK
      ?AUTO_1443 - BLOCK
      ?AUTO_1444 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1440 ?AUTO_1442 ) ( not ( = ?AUTO_1440 ?AUTO_1442 ) ) ( not ( = ?AUTO_1440 ?AUTO_1441 ) ) ( not ( = ?AUTO_1442 ?AUTO_1441 ) ) ( ON ?AUTO_1441 ?AUTO_1440 ) ( CLEAR ?AUTO_1441 ) ( HOLDING ?AUTO_1443 ) ( CLEAR ?AUTO_1444 ) ( not ( = ?AUTO_1440 ?AUTO_1443 ) ) ( not ( = ?AUTO_1440 ?AUTO_1444 ) ) ( not ( = ?AUTO_1442 ?AUTO_1443 ) ) ( not ( = ?AUTO_1442 ?AUTO_1444 ) ) ( not ( = ?AUTO_1441 ?AUTO_1443 ) ) ( not ( = ?AUTO_1441 ?AUTO_1444 ) ) ( not ( = ?AUTO_1443 ?AUTO_1444 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1443 ?AUTO_1444 )
      ( MAKE-ON-TABLE ?AUTO_1440 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1440 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1641 - BLOCK
    )
    :vars
    (
      ?AUTO_1644 - BLOCK
      ?AUTO_1645 - BLOCK
      ?AUTO_1642 - BLOCK
      ?AUTO_1643 - BLOCK
      ?AUTO_1646 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1641 ?AUTO_1644 ) ( not ( = ?AUTO_1641 ?AUTO_1644 ) ) ( not ( = ?AUTO_1641 ?AUTO_1645 ) ) ( not ( = ?AUTO_1644 ?AUTO_1645 ) ) ( ON ?AUTO_1645 ?AUTO_1641 ) ( not ( = ?AUTO_1641 ?AUTO_1642 ) ) ( not ( = ?AUTO_1641 ?AUTO_1643 ) ) ( not ( = ?AUTO_1644 ?AUTO_1642 ) ) ( not ( = ?AUTO_1644 ?AUTO_1643 ) ) ( not ( = ?AUTO_1645 ?AUTO_1642 ) ) ( not ( = ?AUTO_1645 ?AUTO_1643 ) ) ( not ( = ?AUTO_1642 ?AUTO_1643 ) ) ( ON ?AUTO_1642 ?AUTO_1645 ) ( CLEAR ?AUTO_1642 ) ( HOLDING ?AUTO_1643 ) ( CLEAR ?AUTO_1646 ) ( not ( = ?AUTO_1641 ?AUTO_1646 ) ) ( not ( = ?AUTO_1644 ?AUTO_1646 ) ) ( not ( = ?AUTO_1645 ?AUTO_1646 ) ) ( not ( = ?AUTO_1642 ?AUTO_1646 ) ) ( not ( = ?AUTO_1643 ?AUTO_1646 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1643 ?AUTO_1646 )
      ( MAKE-ON-TABLE ?AUTO_1641 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1641 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1457 - BLOCK
    )
    :vars
    (
      ?AUTO_1460 - BLOCK
      ?AUTO_1458 - BLOCK
      ?AUTO_1461 - BLOCK
      ?AUTO_1459 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1457 ?AUTO_1460 ) ( not ( = ?AUTO_1457 ?AUTO_1460 ) ) ( not ( = ?AUTO_1457 ?AUTO_1458 ) ) ( not ( = ?AUTO_1460 ?AUTO_1458 ) ) ( ON ?AUTO_1458 ?AUTO_1457 ) ( not ( = ?AUTO_1457 ?AUTO_1461 ) ) ( not ( = ?AUTO_1457 ?AUTO_1459 ) ) ( not ( = ?AUTO_1460 ?AUTO_1461 ) ) ( not ( = ?AUTO_1460 ?AUTO_1459 ) ) ( not ( = ?AUTO_1458 ?AUTO_1461 ) ) ( not ( = ?AUTO_1458 ?AUTO_1459 ) ) ( not ( = ?AUTO_1461 ?AUTO_1459 ) ) ( ON ?AUTO_1461 ?AUTO_1458 ) ( ON ?AUTO_1459 ?AUTO_1461 ) ( CLEAR ?AUTO_1459 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1459 ?AUTO_1461 )
      ( MAKE-ON-TABLE ?AUTO_1457 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1457 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_966 - BLOCK
      ?AUTO_967 - BLOCK
    )
    :vars
    (
      ?AUTO_968 - BLOCK
      ?AUTO_969 - BLOCK
      ?AUTO_970 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_966 ?AUTO_967 ) ) ( ON-TABLE ?AUTO_966 ) ( CLEAR ?AUTO_966 ) ( not ( = ?AUTO_966 ?AUTO_968 ) ) ( not ( = ?AUTO_967 ?AUTO_968 ) ) ( ON ?AUTO_968 ?AUTO_967 ) ( CLEAR ?AUTO_968 ) ( HOLDING ?AUTO_969 ) ( CLEAR ?AUTO_970 ) ( not ( = ?AUTO_966 ?AUTO_969 ) ) ( not ( = ?AUTO_966 ?AUTO_970 ) ) ( not ( = ?AUTO_967 ?AUTO_969 ) ) ( not ( = ?AUTO_967 ?AUTO_970 ) ) ( not ( = ?AUTO_968 ?AUTO_969 ) ) ( not ( = ?AUTO_968 ?AUTO_970 ) ) ( not ( = ?AUTO_969 ?AUTO_970 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_969 ?AUTO_970 )
      ( MAKE-ON ?AUTO_966 ?AUTO_967 )
      ( MAKE-ON-VERIFY ?AUTO_966 ?AUTO_967 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_976 - BLOCK
      ?AUTO_977 - BLOCK
    )
    :vars
    (
      ?AUTO_980 - BLOCK
      ?AUTO_979 - BLOCK
      ?AUTO_978 - BLOCK
      ?AUTO_981 - BLOCK
      ?AUTO_982 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_976 ?AUTO_977 ) ) ( ON-TABLE ?AUTO_976 ) ( CLEAR ?AUTO_976 ) ( not ( = ?AUTO_976 ?AUTO_980 ) ) ( not ( = ?AUTO_977 ?AUTO_980 ) ) ( ON ?AUTO_980 ?AUTO_977 ) ( CLEAR ?AUTO_979 ) ( not ( = ?AUTO_976 ?AUTO_978 ) ) ( not ( = ?AUTO_976 ?AUTO_979 ) ) ( not ( = ?AUTO_977 ?AUTO_978 ) ) ( not ( = ?AUTO_977 ?AUTO_979 ) ) ( not ( = ?AUTO_980 ?AUTO_978 ) ) ( not ( = ?AUTO_980 ?AUTO_979 ) ) ( not ( = ?AUTO_978 ?AUTO_979 ) ) ( ON ?AUTO_978 ?AUTO_980 ) ( CLEAR ?AUTO_978 ) ( HOLDING ?AUTO_981 ) ( CLEAR ?AUTO_982 ) ( not ( = ?AUTO_976 ?AUTO_981 ) ) ( not ( = ?AUTO_976 ?AUTO_982 ) ) ( not ( = ?AUTO_977 ?AUTO_981 ) ) ( not ( = ?AUTO_977 ?AUTO_982 ) ) ( not ( = ?AUTO_980 ?AUTO_981 ) ) ( not ( = ?AUTO_980 ?AUTO_982 ) ) ( not ( = ?AUTO_979 ?AUTO_981 ) ) ( not ( = ?AUTO_979 ?AUTO_982 ) ) ( not ( = ?AUTO_978 ?AUTO_981 ) ) ( not ( = ?AUTO_978 ?AUTO_982 ) ) ( not ( = ?AUTO_981 ?AUTO_982 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_981 ?AUTO_982 )
      ( MAKE-ON ?AUTO_976 ?AUTO_977 )
      ( MAKE-ON-VERIFY ?AUTO_976 ?AUTO_977 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_990 - BLOCK
      ?AUTO_991 - BLOCK
    )
    :vars
    (
      ?AUTO_994 - BLOCK
      ?AUTO_993 - BLOCK
      ?AUTO_992 - BLOCK
      ?AUTO_996 - BLOCK
      ?AUTO_995 - BLOCK
      ?AUTO_997 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_990 ?AUTO_991 ) ) ( ON-TABLE ?AUTO_990 ) ( CLEAR ?AUTO_990 ) ( not ( = ?AUTO_990 ?AUTO_994 ) ) ( not ( = ?AUTO_991 ?AUTO_994 ) ) ( ON ?AUTO_994 ?AUTO_991 ) ( CLEAR ?AUTO_993 ) ( not ( = ?AUTO_990 ?AUTO_992 ) ) ( not ( = ?AUTO_990 ?AUTO_993 ) ) ( not ( = ?AUTO_991 ?AUTO_992 ) ) ( not ( = ?AUTO_991 ?AUTO_993 ) ) ( not ( = ?AUTO_994 ?AUTO_992 ) ) ( not ( = ?AUTO_994 ?AUTO_993 ) ) ( not ( = ?AUTO_992 ?AUTO_993 ) ) ( ON ?AUTO_992 ?AUTO_994 ) ( not ( = ?AUTO_990 ?AUTO_996 ) ) ( not ( = ?AUTO_990 ?AUTO_995 ) ) ( not ( = ?AUTO_991 ?AUTO_996 ) ) ( not ( = ?AUTO_991 ?AUTO_995 ) ) ( not ( = ?AUTO_994 ?AUTO_996 ) ) ( not ( = ?AUTO_994 ?AUTO_995 ) ) ( not ( = ?AUTO_993 ?AUTO_996 ) ) ( not ( = ?AUTO_993 ?AUTO_995 ) ) ( not ( = ?AUTO_992 ?AUTO_996 ) ) ( not ( = ?AUTO_992 ?AUTO_995 ) ) ( not ( = ?AUTO_996 ?AUTO_995 ) ) ( ON ?AUTO_996 ?AUTO_992 ) ( CLEAR ?AUTO_996 ) ( HOLDING ?AUTO_995 ) ( CLEAR ?AUTO_997 ) ( not ( = ?AUTO_990 ?AUTO_997 ) ) ( not ( = ?AUTO_991 ?AUTO_997 ) ) ( not ( = ?AUTO_994 ?AUTO_997 ) ) ( not ( = ?AUTO_993 ?AUTO_997 ) ) ( not ( = ?AUTO_992 ?AUTO_997 ) ) ( not ( = ?AUTO_996 ?AUTO_997 ) ) ( not ( = ?AUTO_995 ?AUTO_997 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_995 ?AUTO_997 )
      ( MAKE-ON ?AUTO_990 ?AUTO_991 )
      ( MAKE-ON-VERIFY ?AUTO_990 ?AUTO_991 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3795 - BLOCK
      ?AUTO_3796 - BLOCK
    )
    :vars
    (
      ?AUTO_3798 - BLOCK
      ?AUTO_3799 - BLOCK
      ?AUTO_3797 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3795 ?AUTO_3796 ) ) ( not ( = ?AUTO_3795 ?AUTO_3798 ) ) ( not ( = ?AUTO_3796 ?AUTO_3798 ) ) ( ON ?AUTO_3798 ?AUTO_3796 ) ( not ( = ?AUTO_3795 ?AUTO_3799 ) ) ( not ( = ?AUTO_3796 ?AUTO_3799 ) ) ( not ( = ?AUTO_3798 ?AUTO_3799 ) ) ( ON ?AUTO_3799 ?AUTO_3798 ) ( not ( = ?AUTO_3795 ?AUTO_3797 ) ) ( not ( = ?AUTO_3796 ?AUTO_3797 ) ) ( not ( = ?AUTO_3798 ?AUTO_3797 ) ) ( not ( = ?AUTO_3799 ?AUTO_3797 ) ) ( ON ?AUTO_3797 ?AUTO_3799 ) ( CLEAR ?AUTO_3797 ) ( HOLDING ?AUTO_3795 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3795 )
      ( MAKE-ON ?AUTO_3795 ?AUTO_3796 )
      ( MAKE-ON-VERIFY ?AUTO_3795 ?AUTO_3796 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1019 - BLOCK
      ?AUTO_1020 - BLOCK
    )
    :vars
    (
      ?AUTO_1021 - BLOCK
      ?AUTO_1025 - BLOCK
      ?AUTO_1022 - BLOCK
      ?AUTO_1024 - BLOCK
      ?AUTO_1023 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1019 ?AUTO_1020 ) ) ( ON ?AUTO_1019 ?AUTO_1021 ) ( CLEAR ?AUTO_1019 ) ( not ( = ?AUTO_1019 ?AUTO_1021 ) ) ( not ( = ?AUTO_1020 ?AUTO_1021 ) ) ( not ( = ?AUTO_1019 ?AUTO_1025 ) ) ( not ( = ?AUTO_1020 ?AUTO_1025 ) ) ( not ( = ?AUTO_1021 ?AUTO_1025 ) ) ( ON ?AUTO_1025 ?AUTO_1020 ) ( not ( = ?AUTO_1019 ?AUTO_1022 ) ) ( not ( = ?AUTO_1019 ?AUTO_1024 ) ) ( not ( = ?AUTO_1020 ?AUTO_1022 ) ) ( not ( = ?AUTO_1020 ?AUTO_1024 ) ) ( not ( = ?AUTO_1021 ?AUTO_1022 ) ) ( not ( = ?AUTO_1021 ?AUTO_1024 ) ) ( not ( = ?AUTO_1025 ?AUTO_1022 ) ) ( not ( = ?AUTO_1025 ?AUTO_1024 ) ) ( not ( = ?AUTO_1022 ?AUTO_1024 ) ) ( ON ?AUTO_1022 ?AUTO_1025 ) ( not ( = ?AUTO_1019 ?AUTO_1023 ) ) ( not ( = ?AUTO_1020 ?AUTO_1023 ) ) ( not ( = ?AUTO_1021 ?AUTO_1023 ) ) ( not ( = ?AUTO_1025 ?AUTO_1023 ) ) ( not ( = ?AUTO_1024 ?AUTO_1023 ) ) ( not ( = ?AUTO_1022 ?AUTO_1023 ) ) ( ON ?AUTO_1023 ?AUTO_1022 ) ( ON ?AUTO_1024 ?AUTO_1023 ) ( CLEAR ?AUTO_1024 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1024 ?AUTO_1023 )
      ( MAKE-ON ?AUTO_1019 ?AUTO_1020 )
      ( MAKE-ON-VERIFY ?AUTO_1019 ?AUTO_1020 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3046 - BLOCK
      ?AUTO_3047 - BLOCK
    )
    :vars
    (
      ?AUTO_3049 - BLOCK
      ?AUTO_3048 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3046 ?AUTO_3047 ) ) ( CLEAR ?AUTO_3049 ) ( not ( = ?AUTO_3046 ?AUTO_3048 ) ) ( not ( = ?AUTO_3046 ?AUTO_3049 ) ) ( not ( = ?AUTO_3047 ?AUTO_3048 ) ) ( not ( = ?AUTO_3047 ?AUTO_3049 ) ) ( not ( = ?AUTO_3048 ?AUTO_3049 ) ) ( ON ?AUTO_3048 ?AUTO_3047 ) ( ON ?AUTO_3046 ?AUTO_3048 ) ( CLEAR ?AUTO_3046 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3046 ?AUTO_3048 )
      ( MAKE-ON ?AUTO_3046 ?AUTO_3047 )
      ( MAKE-ON-VERIFY ?AUTO_3046 ?AUTO_3047 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1062 - BLOCK
      ?AUTO_1063 - BLOCK
    )
    :vars
    (
      ?AUTO_1066 - BLOCK
      ?AUTO_1064 - BLOCK
      ?AUTO_1065 - BLOCK
      ?AUTO_1067 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1062 ?AUTO_1063 ) ) ( not ( = ?AUTO_1062 ?AUTO_1066 ) ) ( not ( = ?AUTO_1063 ?AUTO_1066 ) ) ( CLEAR ?AUTO_1064 ) ( not ( = ?AUTO_1062 ?AUTO_1065 ) ) ( not ( = ?AUTO_1062 ?AUTO_1064 ) ) ( not ( = ?AUTO_1063 ?AUTO_1065 ) ) ( not ( = ?AUTO_1063 ?AUTO_1064 ) ) ( not ( = ?AUTO_1066 ?AUTO_1065 ) ) ( not ( = ?AUTO_1066 ?AUTO_1064 ) ) ( not ( = ?AUTO_1065 ?AUTO_1064 ) ) ( ON ?AUTO_1065 ?AUTO_1063 ) ( ON ?AUTO_1062 ?AUTO_1065 ) ( CLEAR ?AUTO_1062 ) ( HOLDING ?AUTO_1066 ) ( CLEAR ?AUTO_1067 ) ( not ( = ?AUTO_1062 ?AUTO_1067 ) ) ( not ( = ?AUTO_1063 ?AUTO_1067 ) ) ( not ( = ?AUTO_1066 ?AUTO_1067 ) ) ( not ( = ?AUTO_1064 ?AUTO_1067 ) ) ( not ( = ?AUTO_1065 ?AUTO_1067 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1066 ?AUTO_1067 )
      ( MAKE-ON ?AUTO_1062 ?AUTO_1063 )
      ( MAKE-ON-VERIFY ?AUTO_1062 ?AUTO_1063 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3063 - BLOCK
      ?AUTO_3064 - BLOCK
    )
    :vars
    (
      ?AUTO_3065 - BLOCK
      ?AUTO_3067 - BLOCK
      ?AUTO_3066 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3063 ?AUTO_3064 ) ) ( CLEAR ?AUTO_3065 ) ( not ( = ?AUTO_3063 ?AUTO_3067 ) ) ( not ( = ?AUTO_3063 ?AUTO_3065 ) ) ( not ( = ?AUTO_3064 ?AUTO_3067 ) ) ( not ( = ?AUTO_3064 ?AUTO_3065 ) ) ( not ( = ?AUTO_3067 ?AUTO_3065 ) ) ( ON ?AUTO_3067 ?AUTO_3064 ) ( ON ?AUTO_3063 ?AUTO_3067 ) ( not ( = ?AUTO_3063 ?AUTO_3066 ) ) ( not ( = ?AUTO_3064 ?AUTO_3066 ) ) ( not ( = ?AUTO_3065 ?AUTO_3066 ) ) ( not ( = ?AUTO_3067 ?AUTO_3066 ) ) ( ON ?AUTO_3066 ?AUTO_3063 ) ( CLEAR ?AUTO_3066 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3066 ?AUTO_3063 )
      ( MAKE-ON ?AUTO_3063 ?AUTO_3064 )
      ( MAKE-ON-VERIFY ?AUTO_3063 ?AUTO_3064 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1150 - BLOCK
      ?AUTO_1151 - BLOCK
    )
    :vars
    (
      ?AUTO_1152 - BLOCK
      ?AUTO_1153 - BLOCK
      ?AUTO_1154 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1150 ?AUTO_1151 ) ) ( ON-TABLE ?AUTO_1150 ) ( not ( = ?AUTO_1150 ?AUTO_1152 ) ) ( not ( = ?AUTO_1151 ?AUTO_1152 ) ) ( ON ?AUTO_1152 ?AUTO_1150 ) ( CLEAR ?AUTO_1153 ) ( not ( = ?AUTO_1150 ?AUTO_1154 ) ) ( not ( = ?AUTO_1150 ?AUTO_1153 ) ) ( not ( = ?AUTO_1151 ?AUTO_1154 ) ) ( not ( = ?AUTO_1151 ?AUTO_1153 ) ) ( not ( = ?AUTO_1152 ?AUTO_1154 ) ) ( not ( = ?AUTO_1152 ?AUTO_1153 ) ) ( not ( = ?AUTO_1154 ?AUTO_1153 ) ) ( ON ?AUTO_1154 ?AUTO_1152 ) ( CLEAR ?AUTO_1154 ) ( HOLDING ?AUTO_1151 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1151 )
      ( MAKE-ON ?AUTO_1150 ?AUTO_1151 )
      ( MAKE-ON-VERIFY ?AUTO_1150 ?AUTO_1151 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1155 - BLOCK
      ?AUTO_1156 - BLOCK
    )
    :vars
    (
      ?AUTO_1158 - BLOCK
      ?AUTO_1157 - BLOCK
      ?AUTO_1159 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1155 ?AUTO_1156 ) ) ( ON-TABLE ?AUTO_1155 ) ( not ( = ?AUTO_1155 ?AUTO_1158 ) ) ( not ( = ?AUTO_1156 ?AUTO_1158 ) ) ( ON ?AUTO_1158 ?AUTO_1155 ) ( CLEAR ?AUTO_1157 ) ( not ( = ?AUTO_1155 ?AUTO_1159 ) ) ( not ( = ?AUTO_1155 ?AUTO_1157 ) ) ( not ( = ?AUTO_1156 ?AUTO_1159 ) ) ( not ( = ?AUTO_1156 ?AUTO_1157 ) ) ( not ( = ?AUTO_1158 ?AUTO_1159 ) ) ( not ( = ?AUTO_1158 ?AUTO_1157 ) ) ( not ( = ?AUTO_1159 ?AUTO_1157 ) ) ( ON ?AUTO_1159 ?AUTO_1158 ) ( ON ?AUTO_1156 ?AUTO_1159 ) ( CLEAR ?AUTO_1156 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1156 ?AUTO_1159 )
      ( MAKE-ON ?AUTO_1155 ?AUTO_1156 )
      ( MAKE-ON-VERIFY ?AUTO_1155 ?AUTO_1156 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1160 - BLOCK
      ?AUTO_1161 - BLOCK
    )
    :vars
    (
      ?AUTO_1163 - BLOCK
      ?AUTO_1164 - BLOCK
      ?AUTO_1162 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1160 ?AUTO_1161 ) ) ( ON-TABLE ?AUTO_1160 ) ( not ( = ?AUTO_1160 ?AUTO_1163 ) ) ( not ( = ?AUTO_1161 ?AUTO_1163 ) ) ( ON ?AUTO_1163 ?AUTO_1160 ) ( not ( = ?AUTO_1160 ?AUTO_1164 ) ) ( not ( = ?AUTO_1160 ?AUTO_1162 ) ) ( not ( = ?AUTO_1161 ?AUTO_1164 ) ) ( not ( = ?AUTO_1161 ?AUTO_1162 ) ) ( not ( = ?AUTO_1163 ?AUTO_1164 ) ) ( not ( = ?AUTO_1163 ?AUTO_1162 ) ) ( not ( = ?AUTO_1164 ?AUTO_1162 ) ) ( ON ?AUTO_1164 ?AUTO_1163 ) ( ON ?AUTO_1161 ?AUTO_1164 ) ( CLEAR ?AUTO_1161 ) ( HOLDING ?AUTO_1162 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1162 )
      ( MAKE-ON ?AUTO_1160 ?AUTO_1161 )
      ( MAKE-ON-VERIFY ?AUTO_1160 ?AUTO_1161 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1259 - BLOCK
      ?AUTO_1260 - BLOCK
    )
    :vars
    (
      ?AUTO_1262 - BLOCK
      ?AUTO_1261 - BLOCK
      ?AUTO_1263 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1259 ?AUTO_1260 ) ) ( ON-TABLE ?AUTO_1259 ) ( not ( = ?AUTO_1259 ?AUTO_1262 ) ) ( not ( = ?AUTO_1259 ?AUTO_1261 ) ) ( not ( = ?AUTO_1260 ?AUTO_1262 ) ) ( not ( = ?AUTO_1260 ?AUTO_1261 ) ) ( not ( = ?AUTO_1262 ?AUTO_1261 ) ) ( ON ?AUTO_1262 ?AUTO_1260 ) ( CLEAR ?AUTO_1262 ) ( CLEAR ?AUTO_1263 ) ( not ( = ?AUTO_1259 ?AUTO_1263 ) ) ( not ( = ?AUTO_1260 ?AUTO_1263 ) ) ( not ( = ?AUTO_1262 ?AUTO_1263 ) ) ( not ( = ?AUTO_1261 ?AUTO_1263 ) ) ( ON ?AUTO_1261 ?AUTO_1259 ) ( CLEAR ?AUTO_1261 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1261 ?AUTO_1259 )
      ( MAKE-ON ?AUTO_1259 ?AUTO_1260 )
      ( MAKE-ON-VERIFY ?AUTO_1259 ?AUTO_1260 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1264 - BLOCK
      ?AUTO_1265 - BLOCK
    )
    :vars
    (
      ?AUTO_1266 - BLOCK
      ?AUTO_1268 - BLOCK
      ?AUTO_1267 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1264 ?AUTO_1265 ) ) ( ON-TABLE ?AUTO_1264 ) ( not ( = ?AUTO_1264 ?AUTO_1266 ) ) ( not ( = ?AUTO_1264 ?AUTO_1268 ) ) ( not ( = ?AUTO_1265 ?AUTO_1266 ) ) ( not ( = ?AUTO_1265 ?AUTO_1268 ) ) ( not ( = ?AUTO_1266 ?AUTO_1268 ) ) ( CLEAR ?AUTO_1267 ) ( not ( = ?AUTO_1264 ?AUTO_1267 ) ) ( not ( = ?AUTO_1265 ?AUTO_1267 ) ) ( not ( = ?AUTO_1266 ?AUTO_1267 ) ) ( not ( = ?AUTO_1268 ?AUTO_1267 ) ) ( ON ?AUTO_1268 ?AUTO_1264 ) ( CLEAR ?AUTO_1268 ) ( HOLDING ?AUTO_1266 ) ( CLEAR ?AUTO_1265 ) )
    :subtasks
    ( ( !STACK ?AUTO_1266 ?AUTO_1265 )
      ( MAKE-ON ?AUTO_1264 ?AUTO_1265 )
      ( MAKE-ON-VERIFY ?AUTO_1264 ?AUTO_1265 ) )
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
      ?AUTO_1321 - BLOCK
      ?AUTO_1322 - BLOCK
      ?AUTO_1323 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1318 ?AUTO_1319 ) ) ( not ( = ?AUTO_1318 ?AUTO_1320 ) ) ( not ( = ?AUTO_1319 ?AUTO_1320 ) ) ( ON ?AUTO_1320 ?AUTO_1319 ) ( CLEAR ?AUTO_1321 ) ( not ( = ?AUTO_1318 ?AUTO_1322 ) ) ( not ( = ?AUTO_1318 ?AUTO_1321 ) ) ( not ( = ?AUTO_1319 ?AUTO_1322 ) ) ( not ( = ?AUTO_1319 ?AUTO_1321 ) ) ( not ( = ?AUTO_1320 ?AUTO_1322 ) ) ( not ( = ?AUTO_1320 ?AUTO_1321 ) ) ( not ( = ?AUTO_1322 ?AUTO_1321 ) ) ( ON ?AUTO_1322 ?AUTO_1320 ) ( CLEAR ?AUTO_1322 ) ( ON ?AUTO_1318 ?AUTO_1323 ) ( CLEAR ?AUTO_1318 ) ( HAND-EMPTY ) ( not ( = ?AUTO_1318 ?AUTO_1323 ) ) ( not ( = ?AUTO_1319 ?AUTO_1323 ) ) ( not ( = ?AUTO_1320 ?AUTO_1323 ) ) ( not ( = ?AUTO_1321 ?AUTO_1323 ) ) ( not ( = ?AUTO_1322 ?AUTO_1323 ) ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1318 ?AUTO_1323 )
      ( MAKE-ON ?AUTO_1318 ?AUTO_1319 )
      ( MAKE-ON-VERIFY ?AUTO_1318 ?AUTO_1319 ) )
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
      ?AUTO_1335 - BLOCK
      ?AUTO_1337 - BLOCK
      ?AUTO_1338 - BLOCK
      ?AUTO_1339 - BLOCK
      ?AUTO_1336 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1332 ?AUTO_1333 ) ) ( not ( = ?AUTO_1332 ?AUTO_1334 ) ) ( not ( = ?AUTO_1333 ?AUTO_1334 ) ) ( ON ?AUTO_1334 ?AUTO_1333 ) ( CLEAR ?AUTO_1335 ) ( not ( = ?AUTO_1332 ?AUTO_1337 ) ) ( not ( = ?AUTO_1332 ?AUTO_1335 ) ) ( not ( = ?AUTO_1333 ?AUTO_1337 ) ) ( not ( = ?AUTO_1333 ?AUTO_1335 ) ) ( not ( = ?AUTO_1334 ?AUTO_1337 ) ) ( not ( = ?AUTO_1334 ?AUTO_1335 ) ) ( not ( = ?AUTO_1337 ?AUTO_1335 ) ) ( ON ?AUTO_1337 ?AUTO_1334 ) ( CLEAR ?AUTO_1337 ) ( ON ?AUTO_1332 ?AUTO_1338 ) ( not ( = ?AUTO_1332 ?AUTO_1338 ) ) ( not ( = ?AUTO_1333 ?AUTO_1338 ) ) ( not ( = ?AUTO_1334 ?AUTO_1338 ) ) ( not ( = ?AUTO_1335 ?AUTO_1338 ) ) ( not ( = ?AUTO_1337 ?AUTO_1338 ) ) ( CLEAR ?AUTO_1339 ) ( not ( = ?AUTO_1332 ?AUTO_1336 ) ) ( not ( = ?AUTO_1332 ?AUTO_1339 ) ) ( not ( = ?AUTO_1333 ?AUTO_1336 ) ) ( not ( = ?AUTO_1333 ?AUTO_1339 ) ) ( not ( = ?AUTO_1334 ?AUTO_1336 ) ) ( not ( = ?AUTO_1334 ?AUTO_1339 ) ) ( not ( = ?AUTO_1335 ?AUTO_1336 ) ) ( not ( = ?AUTO_1335 ?AUTO_1339 ) ) ( not ( = ?AUTO_1337 ?AUTO_1336 ) ) ( not ( = ?AUTO_1337 ?AUTO_1339 ) ) ( not ( = ?AUTO_1338 ?AUTO_1336 ) ) ( not ( = ?AUTO_1338 ?AUTO_1339 ) ) ( not ( = ?AUTO_1336 ?AUTO_1339 ) ) ( ON ?AUTO_1336 ?AUTO_1332 ) ( CLEAR ?AUTO_1336 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1336 ?AUTO_1332 )
      ( MAKE-ON ?AUTO_1332 ?AUTO_1333 )
      ( MAKE-ON-VERIFY ?AUTO_1332 ?AUTO_1333 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4394 - BLOCK
      ?AUTO_4395 - BLOCK
    )
    :vars
    (
      ?AUTO_4398 - BLOCK
      ?AUTO_4397 - BLOCK
      ?AUTO_4401 - BLOCK
      ?AUTO_4400 - BLOCK
      ?AUTO_4399 - BLOCK
      ?AUTO_4396 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4394 ?AUTO_4395 ) ) ( ON ?AUTO_4394 ?AUTO_4398 ) ( not ( = ?AUTO_4394 ?AUTO_4398 ) ) ( not ( = ?AUTO_4395 ?AUTO_4398 ) ) ( CLEAR ?AUTO_4397 ) ( not ( = ?AUTO_4394 ?AUTO_4401 ) ) ( not ( = ?AUTO_4394 ?AUTO_4397 ) ) ( not ( = ?AUTO_4395 ?AUTO_4401 ) ) ( not ( = ?AUTO_4395 ?AUTO_4397 ) ) ( not ( = ?AUTO_4398 ?AUTO_4401 ) ) ( not ( = ?AUTO_4398 ?AUTO_4397 ) ) ( not ( = ?AUTO_4401 ?AUTO_4397 ) ) ( ON ?AUTO_4401 ?AUTO_4394 ) ( CLEAR ?AUTO_4401 ) ( not ( = ?AUTO_4394 ?AUTO_4400 ) ) ( not ( = ?AUTO_4395 ?AUTO_4400 ) ) ( not ( = ?AUTO_4398 ?AUTO_4400 ) ) ( not ( = ?AUTO_4397 ?AUTO_4400 ) ) ( not ( = ?AUTO_4401 ?AUTO_4400 ) ) ( ON ?AUTO_4400 ?AUTO_4395 ) ( not ( = ?AUTO_4394 ?AUTO_4399 ) ) ( not ( = ?AUTO_4394 ?AUTO_4396 ) ) ( not ( = ?AUTO_4395 ?AUTO_4399 ) ) ( not ( = ?AUTO_4395 ?AUTO_4396 ) ) ( not ( = ?AUTO_4398 ?AUTO_4399 ) ) ( not ( = ?AUTO_4398 ?AUTO_4396 ) ) ( not ( = ?AUTO_4397 ?AUTO_4399 ) ) ( not ( = ?AUTO_4397 ?AUTO_4396 ) ) ( not ( = ?AUTO_4401 ?AUTO_4399 ) ) ( not ( = ?AUTO_4401 ?AUTO_4396 ) ) ( not ( = ?AUTO_4400 ?AUTO_4399 ) ) ( not ( = ?AUTO_4400 ?AUTO_4396 ) ) ( not ( = ?AUTO_4399 ?AUTO_4396 ) ) ( ON ?AUTO_4399 ?AUTO_4400 ) ( CLEAR ?AUTO_4399 ) ( HOLDING ?AUTO_4396 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4396 )
      ( MAKE-ON ?AUTO_4394 ?AUTO_4395 )
      ( MAKE-ON-VERIFY ?AUTO_4394 ?AUTO_4395 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1349 - BLOCK
      ?AUTO_1350 - BLOCK
    )
    :vars
    (
      ?AUTO_1352 - BLOCK
      ?AUTO_1351 - BLOCK
      ?AUTO_1356 - BLOCK
      ?AUTO_1357 - BLOCK
      ?AUTO_1353 - BLOCK
      ?AUTO_1354 - BLOCK
      ?AUTO_1355 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1349 ?AUTO_1350 ) ) ( not ( = ?AUTO_1349 ?AUTO_1352 ) ) ( not ( = ?AUTO_1350 ?AUTO_1352 ) ) ( ON ?AUTO_1352 ?AUTO_1350 ) ( CLEAR ?AUTO_1351 ) ( not ( = ?AUTO_1349 ?AUTO_1356 ) ) ( not ( = ?AUTO_1349 ?AUTO_1351 ) ) ( not ( = ?AUTO_1350 ?AUTO_1356 ) ) ( not ( = ?AUTO_1350 ?AUTO_1351 ) ) ( not ( = ?AUTO_1352 ?AUTO_1356 ) ) ( not ( = ?AUTO_1352 ?AUTO_1351 ) ) ( not ( = ?AUTO_1356 ?AUTO_1351 ) ) ( ON ?AUTO_1356 ?AUTO_1352 ) ( CLEAR ?AUTO_1356 ) ( ON ?AUTO_1349 ?AUTO_1357 ) ( not ( = ?AUTO_1349 ?AUTO_1357 ) ) ( not ( = ?AUTO_1350 ?AUTO_1357 ) ) ( not ( = ?AUTO_1352 ?AUTO_1357 ) ) ( not ( = ?AUTO_1351 ?AUTO_1357 ) ) ( not ( = ?AUTO_1356 ?AUTO_1357 ) ) ( CLEAR ?AUTO_1353 ) ( not ( = ?AUTO_1349 ?AUTO_1354 ) ) ( not ( = ?AUTO_1349 ?AUTO_1353 ) ) ( not ( = ?AUTO_1350 ?AUTO_1354 ) ) ( not ( = ?AUTO_1350 ?AUTO_1353 ) ) ( not ( = ?AUTO_1352 ?AUTO_1354 ) ) ( not ( = ?AUTO_1352 ?AUTO_1353 ) ) ( not ( = ?AUTO_1351 ?AUTO_1354 ) ) ( not ( = ?AUTO_1351 ?AUTO_1353 ) ) ( not ( = ?AUTO_1356 ?AUTO_1354 ) ) ( not ( = ?AUTO_1356 ?AUTO_1353 ) ) ( not ( = ?AUTO_1357 ?AUTO_1354 ) ) ( not ( = ?AUTO_1357 ?AUTO_1353 ) ) ( not ( = ?AUTO_1354 ?AUTO_1353 ) ) ( ON ?AUTO_1354 ?AUTO_1349 ) ( not ( = ?AUTO_1349 ?AUTO_1355 ) ) ( not ( = ?AUTO_1350 ?AUTO_1355 ) ) ( not ( = ?AUTO_1352 ?AUTO_1355 ) ) ( not ( = ?AUTO_1351 ?AUTO_1355 ) ) ( not ( = ?AUTO_1356 ?AUTO_1355 ) ) ( not ( = ?AUTO_1357 ?AUTO_1355 ) ) ( not ( = ?AUTO_1353 ?AUTO_1355 ) ) ( not ( = ?AUTO_1354 ?AUTO_1355 ) ) ( ON ?AUTO_1355 ?AUTO_1354 ) ( CLEAR ?AUTO_1355 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1355 ?AUTO_1354 )
      ( MAKE-ON ?AUTO_1349 ?AUTO_1350 )
      ( MAKE-ON-VERIFY ?AUTO_1349 ?AUTO_1350 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1358 - BLOCK
      ?AUTO_1359 - BLOCK
    )
    :vars
    (
      ?AUTO_1364 - BLOCK
      ?AUTO_1365 - BLOCK
      ?AUTO_1361 - BLOCK
      ?AUTO_1362 - BLOCK
      ?AUTO_1366 - BLOCK
      ?AUTO_1363 - BLOCK
      ?AUTO_1360 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1358 ?AUTO_1359 ) ) ( not ( = ?AUTO_1358 ?AUTO_1364 ) ) ( not ( = ?AUTO_1359 ?AUTO_1364 ) ) ( ON ?AUTO_1364 ?AUTO_1359 ) ( CLEAR ?AUTO_1365 ) ( not ( = ?AUTO_1358 ?AUTO_1361 ) ) ( not ( = ?AUTO_1358 ?AUTO_1365 ) ) ( not ( = ?AUTO_1359 ?AUTO_1361 ) ) ( not ( = ?AUTO_1359 ?AUTO_1365 ) ) ( not ( = ?AUTO_1364 ?AUTO_1361 ) ) ( not ( = ?AUTO_1364 ?AUTO_1365 ) ) ( not ( = ?AUTO_1361 ?AUTO_1365 ) ) ( ON ?AUTO_1361 ?AUTO_1364 ) ( CLEAR ?AUTO_1361 ) ( ON ?AUTO_1358 ?AUTO_1362 ) ( not ( = ?AUTO_1358 ?AUTO_1362 ) ) ( not ( = ?AUTO_1359 ?AUTO_1362 ) ) ( not ( = ?AUTO_1364 ?AUTO_1362 ) ) ( not ( = ?AUTO_1365 ?AUTO_1362 ) ) ( not ( = ?AUTO_1361 ?AUTO_1362 ) ) ( not ( = ?AUTO_1358 ?AUTO_1366 ) ) ( not ( = ?AUTO_1358 ?AUTO_1363 ) ) ( not ( = ?AUTO_1359 ?AUTO_1366 ) ) ( not ( = ?AUTO_1359 ?AUTO_1363 ) ) ( not ( = ?AUTO_1364 ?AUTO_1366 ) ) ( not ( = ?AUTO_1364 ?AUTO_1363 ) ) ( not ( = ?AUTO_1365 ?AUTO_1366 ) ) ( not ( = ?AUTO_1365 ?AUTO_1363 ) ) ( not ( = ?AUTO_1361 ?AUTO_1366 ) ) ( not ( = ?AUTO_1361 ?AUTO_1363 ) ) ( not ( = ?AUTO_1362 ?AUTO_1366 ) ) ( not ( = ?AUTO_1362 ?AUTO_1363 ) ) ( not ( = ?AUTO_1366 ?AUTO_1363 ) ) ( ON ?AUTO_1366 ?AUTO_1358 ) ( not ( = ?AUTO_1358 ?AUTO_1360 ) ) ( not ( = ?AUTO_1359 ?AUTO_1360 ) ) ( not ( = ?AUTO_1364 ?AUTO_1360 ) ) ( not ( = ?AUTO_1365 ?AUTO_1360 ) ) ( not ( = ?AUTO_1361 ?AUTO_1360 ) ) ( not ( = ?AUTO_1362 ?AUTO_1360 ) ) ( not ( = ?AUTO_1363 ?AUTO_1360 ) ) ( not ( = ?AUTO_1366 ?AUTO_1360 ) ) ( ON ?AUTO_1360 ?AUTO_1366 ) ( CLEAR ?AUTO_1360 ) ( HOLDING ?AUTO_1363 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1363 )
      ( MAKE-ON ?AUTO_1358 ?AUTO_1359 )
      ( MAKE-ON-VERIFY ?AUTO_1358 ?AUTO_1359 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1367 - BLOCK
      ?AUTO_1368 - BLOCK
    )
    :vars
    (
      ?AUTO_1372 - BLOCK
      ?AUTO_1373 - BLOCK
      ?AUTO_1371 - BLOCK
      ?AUTO_1369 - BLOCK
      ?AUTO_1375 - BLOCK
      ?AUTO_1370 - BLOCK
      ?AUTO_1374 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1367 ?AUTO_1368 ) ) ( not ( = ?AUTO_1367 ?AUTO_1372 ) ) ( not ( = ?AUTO_1368 ?AUTO_1372 ) ) ( ON ?AUTO_1372 ?AUTO_1368 ) ( CLEAR ?AUTO_1373 ) ( not ( = ?AUTO_1367 ?AUTO_1371 ) ) ( not ( = ?AUTO_1367 ?AUTO_1373 ) ) ( not ( = ?AUTO_1368 ?AUTO_1371 ) ) ( not ( = ?AUTO_1368 ?AUTO_1373 ) ) ( not ( = ?AUTO_1372 ?AUTO_1371 ) ) ( not ( = ?AUTO_1372 ?AUTO_1373 ) ) ( not ( = ?AUTO_1371 ?AUTO_1373 ) ) ( ON ?AUTO_1371 ?AUTO_1372 ) ( ON ?AUTO_1367 ?AUTO_1369 ) ( not ( = ?AUTO_1367 ?AUTO_1369 ) ) ( not ( = ?AUTO_1368 ?AUTO_1369 ) ) ( not ( = ?AUTO_1372 ?AUTO_1369 ) ) ( not ( = ?AUTO_1373 ?AUTO_1369 ) ) ( not ( = ?AUTO_1371 ?AUTO_1369 ) ) ( not ( = ?AUTO_1367 ?AUTO_1375 ) ) ( not ( = ?AUTO_1367 ?AUTO_1370 ) ) ( not ( = ?AUTO_1368 ?AUTO_1375 ) ) ( not ( = ?AUTO_1368 ?AUTO_1370 ) ) ( not ( = ?AUTO_1372 ?AUTO_1375 ) ) ( not ( = ?AUTO_1372 ?AUTO_1370 ) ) ( not ( = ?AUTO_1373 ?AUTO_1375 ) ) ( not ( = ?AUTO_1373 ?AUTO_1370 ) ) ( not ( = ?AUTO_1371 ?AUTO_1375 ) ) ( not ( = ?AUTO_1371 ?AUTO_1370 ) ) ( not ( = ?AUTO_1369 ?AUTO_1375 ) ) ( not ( = ?AUTO_1369 ?AUTO_1370 ) ) ( not ( = ?AUTO_1375 ?AUTO_1370 ) ) ( ON ?AUTO_1375 ?AUTO_1367 ) ( not ( = ?AUTO_1367 ?AUTO_1374 ) ) ( not ( = ?AUTO_1368 ?AUTO_1374 ) ) ( not ( = ?AUTO_1372 ?AUTO_1374 ) ) ( not ( = ?AUTO_1373 ?AUTO_1374 ) ) ( not ( = ?AUTO_1371 ?AUTO_1374 ) ) ( not ( = ?AUTO_1369 ?AUTO_1374 ) ) ( not ( = ?AUTO_1370 ?AUTO_1374 ) ) ( not ( = ?AUTO_1375 ?AUTO_1374 ) ) ( ON ?AUTO_1374 ?AUTO_1375 ) ( CLEAR ?AUTO_1374 ) ( ON ?AUTO_1370 ?AUTO_1371 ) ( CLEAR ?AUTO_1370 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1370 ?AUTO_1371 )
      ( MAKE-ON ?AUTO_1367 ?AUTO_1368 )
      ( MAKE-ON-VERIFY ?AUTO_1367 ?AUTO_1368 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1491 - BLOCK
      ?AUTO_1492 - BLOCK
    )
    :vars
    (
      ?AUTO_1493 - BLOCK
      ?AUTO_1494 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1491 ?AUTO_1492 ) ) ( ON-TABLE ?AUTO_1491 ) ( not ( = ?AUTO_1491 ?AUTO_1493 ) ) ( not ( = ?AUTO_1492 ?AUTO_1493 ) ) ( ON ?AUTO_1493 ?AUTO_1491 ) ( CLEAR ?AUTO_1493 ) ( not ( = ?AUTO_1491 ?AUTO_1494 ) ) ( not ( = ?AUTO_1492 ?AUTO_1494 ) ) ( not ( = ?AUTO_1493 ?AUTO_1494 ) ) ( ON ?AUTO_1494 ?AUTO_1492 ) ( CLEAR ?AUTO_1494 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1494 ?AUTO_1492 )
      ( MAKE-ON ?AUTO_1491 ?AUTO_1492 )
      ( MAKE-ON-VERIFY ?AUTO_1491 ?AUTO_1492 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1679 - BLOCK
      ?AUTO_1680 - BLOCK
    )
    :vars
    (
      ?AUTO_1682 - BLOCK
      ?AUTO_1681 - BLOCK
      ?AUTO_1683 - BLOCK
      ?AUTO_1684 - BLOCK
      ?AUTO_1685 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1680 ) ( not ( = ?AUTO_1679 ?AUTO_1680 ) ) ( ON ?AUTO_1679 ?AUTO_1682 ) ( not ( = ?AUTO_1679 ?AUTO_1682 ) ) ( not ( = ?AUTO_1680 ?AUTO_1682 ) ) ( not ( = ?AUTO_1679 ?AUTO_1681 ) ) ( not ( = ?AUTO_1680 ?AUTO_1681 ) ) ( not ( = ?AUTO_1682 ?AUTO_1681 ) ) ( ON ?AUTO_1681 ?AUTO_1679 ) ( not ( = ?AUTO_1679 ?AUTO_1683 ) ) ( not ( = ?AUTO_1680 ?AUTO_1683 ) ) ( not ( = ?AUTO_1682 ?AUTO_1683 ) ) ( not ( = ?AUTO_1681 ?AUTO_1683 ) ) ( ON ?AUTO_1683 ?AUTO_1681 ) ( CLEAR ?AUTO_1683 ) ( HOLDING ?AUTO_1684 ) ( CLEAR ?AUTO_1685 ) ( not ( = ?AUTO_1679 ?AUTO_1684 ) ) ( not ( = ?AUTO_1679 ?AUTO_1685 ) ) ( not ( = ?AUTO_1680 ?AUTO_1684 ) ) ( not ( = ?AUTO_1680 ?AUTO_1685 ) ) ( not ( = ?AUTO_1682 ?AUTO_1684 ) ) ( not ( = ?AUTO_1682 ?AUTO_1685 ) ) ( not ( = ?AUTO_1681 ?AUTO_1684 ) ) ( not ( = ?AUTO_1681 ?AUTO_1685 ) ) ( not ( = ?AUTO_1683 ?AUTO_1684 ) ) ( not ( = ?AUTO_1683 ?AUTO_1685 ) ) ( not ( = ?AUTO_1684 ?AUTO_1685 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1684 ?AUTO_1685 )
      ( MAKE-ON ?AUTO_1679 ?AUTO_1680 )
      ( MAKE-ON-VERIFY ?AUTO_1679 ?AUTO_1680 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1693 - BLOCK
      ?AUTO_1694 - BLOCK
    )
    :vars
    (
      ?AUTO_1696 - BLOCK
      ?AUTO_1695 - BLOCK
      ?AUTO_1697 - BLOCK
      ?AUTO_1698 - BLOCK
      ?AUTO_1699 - BLOCK
      ?AUTO_1700 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1694 ) ( not ( = ?AUTO_1693 ?AUTO_1694 ) ) ( ON ?AUTO_1693 ?AUTO_1696 ) ( not ( = ?AUTO_1693 ?AUTO_1696 ) ) ( not ( = ?AUTO_1694 ?AUTO_1696 ) ) ( not ( = ?AUTO_1693 ?AUTO_1695 ) ) ( not ( = ?AUTO_1694 ?AUTO_1695 ) ) ( not ( = ?AUTO_1696 ?AUTO_1695 ) ) ( ON ?AUTO_1695 ?AUTO_1693 ) ( not ( = ?AUTO_1693 ?AUTO_1697 ) ) ( not ( = ?AUTO_1694 ?AUTO_1697 ) ) ( not ( = ?AUTO_1696 ?AUTO_1697 ) ) ( not ( = ?AUTO_1695 ?AUTO_1697 ) ) ( ON ?AUTO_1697 ?AUTO_1695 ) ( not ( = ?AUTO_1693 ?AUTO_1698 ) ) ( not ( = ?AUTO_1693 ?AUTO_1699 ) ) ( not ( = ?AUTO_1694 ?AUTO_1698 ) ) ( not ( = ?AUTO_1694 ?AUTO_1699 ) ) ( not ( = ?AUTO_1696 ?AUTO_1698 ) ) ( not ( = ?AUTO_1696 ?AUTO_1699 ) ) ( not ( = ?AUTO_1695 ?AUTO_1698 ) ) ( not ( = ?AUTO_1695 ?AUTO_1699 ) ) ( not ( = ?AUTO_1697 ?AUTO_1698 ) ) ( not ( = ?AUTO_1697 ?AUTO_1699 ) ) ( not ( = ?AUTO_1698 ?AUTO_1699 ) ) ( ON ?AUTO_1698 ?AUTO_1697 ) ( CLEAR ?AUTO_1698 ) ( HOLDING ?AUTO_1699 ) ( CLEAR ?AUTO_1700 ) ( not ( = ?AUTO_1693 ?AUTO_1700 ) ) ( not ( = ?AUTO_1694 ?AUTO_1700 ) ) ( not ( = ?AUTO_1696 ?AUTO_1700 ) ) ( not ( = ?AUTO_1695 ?AUTO_1700 ) ) ( not ( = ?AUTO_1697 ?AUTO_1700 ) ) ( not ( = ?AUTO_1698 ?AUTO_1700 ) ) ( not ( = ?AUTO_1699 ?AUTO_1700 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1699 ?AUTO_1700 )
      ( MAKE-ON ?AUTO_1693 ?AUTO_1694 )
      ( MAKE-ON-VERIFY ?AUTO_1693 ?AUTO_1694 ) )
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
      ?AUTO_1712 - BLOCK
      ?AUTO_1713 - BLOCK
      ?AUTO_1709 - BLOCK
      ?AUTO_1714 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1707 ?AUTO_1708 ) ) ( ON ?AUTO_1707 ?AUTO_1710 ) ( not ( = ?AUTO_1707 ?AUTO_1710 ) ) ( not ( = ?AUTO_1708 ?AUTO_1710 ) ) ( not ( = ?AUTO_1707 ?AUTO_1711 ) ) ( not ( = ?AUTO_1708 ?AUTO_1711 ) ) ( not ( = ?AUTO_1710 ?AUTO_1711 ) ) ( ON ?AUTO_1711 ?AUTO_1707 ) ( not ( = ?AUTO_1707 ?AUTO_1712 ) ) ( not ( = ?AUTO_1708 ?AUTO_1712 ) ) ( not ( = ?AUTO_1710 ?AUTO_1712 ) ) ( not ( = ?AUTO_1711 ?AUTO_1712 ) ) ( ON ?AUTO_1712 ?AUTO_1711 ) ( CLEAR ?AUTO_1713 ) ( not ( = ?AUTO_1707 ?AUTO_1709 ) ) ( not ( = ?AUTO_1707 ?AUTO_1713 ) ) ( not ( = ?AUTO_1708 ?AUTO_1709 ) ) ( not ( = ?AUTO_1708 ?AUTO_1713 ) ) ( not ( = ?AUTO_1710 ?AUTO_1709 ) ) ( not ( = ?AUTO_1710 ?AUTO_1713 ) ) ( not ( = ?AUTO_1711 ?AUTO_1709 ) ) ( not ( = ?AUTO_1711 ?AUTO_1713 ) ) ( not ( = ?AUTO_1712 ?AUTO_1709 ) ) ( not ( = ?AUTO_1712 ?AUTO_1713 ) ) ( not ( = ?AUTO_1709 ?AUTO_1713 ) ) ( ON ?AUTO_1709 ?AUTO_1712 ) ( CLEAR ?AUTO_1709 ) ( HOLDING ?AUTO_1708 ) ( CLEAR ?AUTO_1714 ) ( not ( = ?AUTO_1707 ?AUTO_1714 ) ) ( not ( = ?AUTO_1708 ?AUTO_1714 ) ) ( not ( = ?AUTO_1710 ?AUTO_1714 ) ) ( not ( = ?AUTO_1711 ?AUTO_1714 ) ) ( not ( = ?AUTO_1712 ?AUTO_1714 ) ) ( not ( = ?AUTO_1713 ?AUTO_1714 ) ) ( not ( = ?AUTO_1709 ?AUTO_1714 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1708 ?AUTO_1714 )
      ( MAKE-ON ?AUTO_1707 ?AUTO_1708 )
      ( MAKE-ON-VERIFY ?AUTO_1707 ?AUTO_1708 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3834 - BLOCK
      ?AUTO_3835 - BLOCK
    )
    :vars
    (
      ?AUTO_3836 - BLOCK
      ?AUTO_3837 - BLOCK
      ?AUTO_3838 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3834 ?AUTO_3835 ) ) ( ON ?AUTO_3834 ?AUTO_3836 ) ( CLEAR ?AUTO_3834 ) ( not ( = ?AUTO_3834 ?AUTO_3836 ) ) ( not ( = ?AUTO_3835 ?AUTO_3836 ) ) ( not ( = ?AUTO_3834 ?AUTO_3837 ) ) ( not ( = ?AUTO_3835 ?AUTO_3837 ) ) ( not ( = ?AUTO_3836 ?AUTO_3837 ) ) ( ON ?AUTO_3837 ?AUTO_3835 ) ( CLEAR ?AUTO_3837 ) ( HOLDING ?AUTO_3838 ) ( not ( = ?AUTO_3834 ?AUTO_3838 ) ) ( not ( = ?AUTO_3835 ?AUTO_3838 ) ) ( not ( = ?AUTO_3836 ?AUTO_3838 ) ) ( not ( = ?AUTO_3837 ?AUTO_3838 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3838 )
      ( MAKE-ON ?AUTO_3834 ?AUTO_3835 )
      ( MAKE-ON-VERIFY ?AUTO_3834 ?AUTO_3835 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1861 - BLOCK
      ?AUTO_1862 - BLOCK
    )
    :vars
    (
      ?AUTO_1865 - BLOCK
      ?AUTO_1867 - BLOCK
      ?AUTO_1864 - BLOCK
      ?AUTO_1866 - BLOCK
      ?AUTO_1863 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1861 ?AUTO_1862 ) ) ( not ( = ?AUTO_1861 ?AUTO_1865 ) ) ( not ( = ?AUTO_1862 ?AUTO_1865 ) ) ( CLEAR ?AUTO_1867 ) ( not ( = ?AUTO_1861 ?AUTO_1864 ) ) ( not ( = ?AUTO_1861 ?AUTO_1867 ) ) ( not ( = ?AUTO_1862 ?AUTO_1864 ) ) ( not ( = ?AUTO_1862 ?AUTO_1867 ) ) ( not ( = ?AUTO_1865 ?AUTO_1864 ) ) ( not ( = ?AUTO_1865 ?AUTO_1867 ) ) ( not ( = ?AUTO_1864 ?AUTO_1867 ) ) ( ON ?AUTO_1864 ?AUTO_1862 ) ( not ( = ?AUTO_1861 ?AUTO_1866 ) ) ( not ( = ?AUTO_1862 ?AUTO_1866 ) ) ( not ( = ?AUTO_1865 ?AUTO_1866 ) ) ( not ( = ?AUTO_1867 ?AUTO_1866 ) ) ( not ( = ?AUTO_1864 ?AUTO_1866 ) ) ( ON ?AUTO_1866 ?AUTO_1864 ) ( not ( = ?AUTO_1861 ?AUTO_1863 ) ) ( not ( = ?AUTO_1862 ?AUTO_1863 ) ) ( not ( = ?AUTO_1865 ?AUTO_1863 ) ) ( not ( = ?AUTO_1867 ?AUTO_1863 ) ) ( not ( = ?AUTO_1864 ?AUTO_1863 ) ) ( not ( = ?AUTO_1866 ?AUTO_1863 ) ) ( ON ?AUTO_1863 ?AUTO_1866 ) ( CLEAR ?AUTO_1863 ) ( HOLDING ?AUTO_1861 ) ( CLEAR ?AUTO_1865 ) )
    :subtasks
    ( ( !STACK ?AUTO_1861 ?AUTO_1865 )
      ( MAKE-ON ?AUTO_1861 ?AUTO_1862 )
      ( MAKE-ON-VERIFY ?AUTO_1861 ?AUTO_1862 ) )
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
      ?AUTO_3804 - BLOCK
      ?AUTO_3803 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3800 ?AUTO_3801 ) ) ( not ( = ?AUTO_3800 ?AUTO_3802 ) ) ( not ( = ?AUTO_3801 ?AUTO_3802 ) ) ( ON ?AUTO_3802 ?AUTO_3801 ) ( not ( = ?AUTO_3800 ?AUTO_3804 ) ) ( not ( = ?AUTO_3801 ?AUTO_3804 ) ) ( not ( = ?AUTO_3802 ?AUTO_3804 ) ) ( ON ?AUTO_3804 ?AUTO_3802 ) ( not ( = ?AUTO_3800 ?AUTO_3803 ) ) ( not ( = ?AUTO_3801 ?AUTO_3803 ) ) ( not ( = ?AUTO_3802 ?AUTO_3803 ) ) ( not ( = ?AUTO_3804 ?AUTO_3803 ) ) ( ON ?AUTO_3803 ?AUTO_3804 ) ( ON ?AUTO_3800 ?AUTO_3803 ) ( CLEAR ?AUTO_3800 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3800 ?AUTO_3803 )
      ( MAKE-ON ?AUTO_3800 ?AUTO_3801 )
      ( MAKE-ON-VERIFY ?AUTO_3800 ?AUTO_3801 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1875 - BLOCK
      ?AUTO_1876 - BLOCK
    )
    :vars
    (
      ?AUTO_1878 - BLOCK
      ?AUTO_1881 - BLOCK
      ?AUTO_1880 - BLOCK
      ?AUTO_1879 - BLOCK
      ?AUTO_1877 - BLOCK
      ?AUTO_1882 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_1875 ?AUTO_1876 ) ) ( not ( = ?AUTO_1875 ?AUTO_1878 ) ) ( not ( = ?AUTO_1876 ?AUTO_1878 ) ) ( CLEAR ?AUTO_1881 ) ( not ( = ?AUTO_1875 ?AUTO_1880 ) ) ( not ( = ?AUTO_1875 ?AUTO_1881 ) ) ( not ( = ?AUTO_1876 ?AUTO_1880 ) ) ( not ( = ?AUTO_1876 ?AUTO_1881 ) ) ( not ( = ?AUTO_1878 ?AUTO_1880 ) ) ( not ( = ?AUTO_1878 ?AUTO_1881 ) ) ( not ( = ?AUTO_1880 ?AUTO_1881 ) ) ( ON ?AUTO_1880 ?AUTO_1876 ) ( not ( = ?AUTO_1875 ?AUTO_1879 ) ) ( not ( = ?AUTO_1876 ?AUTO_1879 ) ) ( not ( = ?AUTO_1878 ?AUTO_1879 ) ) ( not ( = ?AUTO_1881 ?AUTO_1879 ) ) ( not ( = ?AUTO_1880 ?AUTO_1879 ) ) ( ON ?AUTO_1879 ?AUTO_1880 ) ( not ( = ?AUTO_1875 ?AUTO_1877 ) ) ( not ( = ?AUTO_1876 ?AUTO_1877 ) ) ( not ( = ?AUTO_1878 ?AUTO_1877 ) ) ( not ( = ?AUTO_1881 ?AUTO_1877 ) ) ( not ( = ?AUTO_1880 ?AUTO_1877 ) ) ( not ( = ?AUTO_1879 ?AUTO_1877 ) ) ( ON ?AUTO_1877 ?AUTO_1879 ) ( ON ?AUTO_1875 ?AUTO_1877 ) ( CLEAR ?AUTO_1875 ) ( HOLDING ?AUTO_1878 ) ( CLEAR ?AUTO_1882 ) ( not ( = ?AUTO_1875 ?AUTO_1882 ) ) ( not ( = ?AUTO_1876 ?AUTO_1882 ) ) ( not ( = ?AUTO_1878 ?AUTO_1882 ) ) ( not ( = ?AUTO_1881 ?AUTO_1882 ) ) ( not ( = ?AUTO_1880 ?AUTO_1882 ) ) ( not ( = ?AUTO_1879 ?AUTO_1882 ) ) ( not ( = ?AUTO_1877 ?AUTO_1882 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_1878 ?AUTO_1882 )
      ( MAKE-ON ?AUTO_1875 ?AUTO_1876 )
      ( MAKE-ON-VERIFY ?AUTO_1875 ?AUTO_1876 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2143 - BLOCK
      ?AUTO_2144 - BLOCK
    )
    :vars
    (
      ?AUTO_2147 - BLOCK
      ?AUTO_2146 - BLOCK
      ?AUTO_2145 - BLOCK
      ?AUTO_2148 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2143 ?AUTO_2144 ) ) ( ON-TABLE ?AUTO_2143 ) ( not ( = ?AUTO_2143 ?AUTO_2147 ) ) ( not ( = ?AUTO_2144 ?AUTO_2147 ) ) ( ON ?AUTO_2147 ?AUTO_2143 ) ( CLEAR ?AUTO_2147 ) ( not ( = ?AUTO_2143 ?AUTO_2146 ) ) ( not ( = ?AUTO_2143 ?AUTO_2145 ) ) ( not ( = ?AUTO_2144 ?AUTO_2146 ) ) ( not ( = ?AUTO_2144 ?AUTO_2145 ) ) ( not ( = ?AUTO_2147 ?AUTO_2146 ) ) ( not ( = ?AUTO_2147 ?AUTO_2145 ) ) ( not ( = ?AUTO_2146 ?AUTO_2145 ) ) ( ON ?AUTO_2146 ?AUTO_2144 ) ( CLEAR ?AUTO_2146 ) ( HOLDING ?AUTO_2145 ) ( CLEAR ?AUTO_2148 ) ( not ( = ?AUTO_2143 ?AUTO_2148 ) ) ( not ( = ?AUTO_2144 ?AUTO_2148 ) ) ( not ( = ?AUTO_2147 ?AUTO_2148 ) ) ( not ( = ?AUTO_2146 ?AUTO_2148 ) ) ( not ( = ?AUTO_2145 ?AUTO_2148 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2145 ?AUTO_2148 )
      ( MAKE-ON ?AUTO_2143 ?AUTO_2144 )
      ( MAKE-ON-VERIFY ?AUTO_2143 ?AUTO_2144 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3474 - BLOCK
      ?AUTO_3475 - BLOCK
    )
    :vars
    (
      ?AUTO_3478 - BLOCK
      ?AUTO_3477 - BLOCK
      ?AUTO_3476 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3474 ?AUTO_3475 ) ) ( ON-TABLE ?AUTO_3474 ) ( not ( = ?AUTO_3474 ?AUTO_3478 ) ) ( not ( = ?AUTO_3474 ?AUTO_3477 ) ) ( not ( = ?AUTO_3475 ?AUTO_3478 ) ) ( not ( = ?AUTO_3475 ?AUTO_3477 ) ) ( not ( = ?AUTO_3478 ?AUTO_3477 ) ) ( ON ?AUTO_3478 ?AUTO_3475 ) ( CLEAR ?AUTO_3478 ) ( not ( = ?AUTO_3474 ?AUTO_3476 ) ) ( not ( = ?AUTO_3475 ?AUTO_3476 ) ) ( not ( = ?AUTO_3477 ?AUTO_3476 ) ) ( not ( = ?AUTO_3478 ?AUTO_3476 ) ) ( ON ?AUTO_3476 ?AUTO_3474 ) ( ON ?AUTO_3477 ?AUTO_3476 ) ( CLEAR ?AUTO_3477 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3477 ?AUTO_3476 )
      ( MAKE-ON ?AUTO_3474 ?AUTO_3475 )
      ( MAKE-ON-VERIFY ?AUTO_3474 ?AUTO_3475 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2155 - BLOCK
      ?AUTO_2156 - BLOCK
    )
    :vars
    (
      ?AUTO_2160 - BLOCK
      ?AUTO_2158 - BLOCK
      ?AUTO_2157 - BLOCK
      ?AUTO_2159 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2155 ?AUTO_2156 ) ) ( ON-TABLE ?AUTO_2155 ) ( not ( = ?AUTO_2155 ?AUTO_2160 ) ) ( not ( = ?AUTO_2156 ?AUTO_2160 ) ) ( ON ?AUTO_2160 ?AUTO_2155 ) ( not ( = ?AUTO_2155 ?AUTO_2158 ) ) ( not ( = ?AUTO_2155 ?AUTO_2157 ) ) ( not ( = ?AUTO_2156 ?AUTO_2158 ) ) ( not ( = ?AUTO_2156 ?AUTO_2157 ) ) ( not ( = ?AUTO_2160 ?AUTO_2158 ) ) ( not ( = ?AUTO_2160 ?AUTO_2157 ) ) ( not ( = ?AUTO_2158 ?AUTO_2157 ) ) ( CLEAR ?AUTO_2159 ) ( not ( = ?AUTO_2155 ?AUTO_2159 ) ) ( not ( = ?AUTO_2156 ?AUTO_2159 ) ) ( not ( = ?AUTO_2160 ?AUTO_2159 ) ) ( not ( = ?AUTO_2158 ?AUTO_2159 ) ) ( not ( = ?AUTO_2157 ?AUTO_2159 ) ) ( ON ?AUTO_2157 ?AUTO_2160 ) ( CLEAR ?AUTO_2157 ) ( HOLDING ?AUTO_2158 ) ( CLEAR ?AUTO_2156 ) )
    :subtasks
    ( ( !STACK ?AUTO_2158 ?AUTO_2156 )
      ( MAKE-ON ?AUTO_2155 ?AUTO_2156 )
      ( MAKE-ON-VERIFY ?AUTO_2155 ?AUTO_2156 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2167 - BLOCK
      ?AUTO_2168 - BLOCK
    )
    :vars
    (
      ?AUTO_2171 - BLOCK
      ?AUTO_2169 - BLOCK
      ?AUTO_2172 - BLOCK
      ?AUTO_2170 - BLOCK
      ?AUTO_2173 - BLOCK
      ?AUTO_2174 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2167 ?AUTO_2168 ) ) ( ON-TABLE ?AUTO_2167 ) ( not ( = ?AUTO_2167 ?AUTO_2171 ) ) ( not ( = ?AUTO_2168 ?AUTO_2171 ) ) ( ON ?AUTO_2171 ?AUTO_2167 ) ( not ( = ?AUTO_2167 ?AUTO_2169 ) ) ( not ( = ?AUTO_2167 ?AUTO_2172 ) ) ( not ( = ?AUTO_2168 ?AUTO_2169 ) ) ( not ( = ?AUTO_2168 ?AUTO_2172 ) ) ( not ( = ?AUTO_2171 ?AUTO_2169 ) ) ( not ( = ?AUTO_2171 ?AUTO_2172 ) ) ( not ( = ?AUTO_2169 ?AUTO_2172 ) ) ( CLEAR ?AUTO_2170 ) ( not ( = ?AUTO_2167 ?AUTO_2170 ) ) ( not ( = ?AUTO_2168 ?AUTO_2170 ) ) ( not ( = ?AUTO_2171 ?AUTO_2170 ) ) ( not ( = ?AUTO_2169 ?AUTO_2170 ) ) ( not ( = ?AUTO_2172 ?AUTO_2170 ) ) ( ON ?AUTO_2172 ?AUTO_2171 ) ( CLEAR ?AUTO_2168 ) ( ON ?AUTO_2169 ?AUTO_2172 ) ( CLEAR ?AUTO_2169 ) ( HOLDING ?AUTO_2173 ) ( CLEAR ?AUTO_2174 ) ( not ( = ?AUTO_2167 ?AUTO_2173 ) ) ( not ( = ?AUTO_2167 ?AUTO_2174 ) ) ( not ( = ?AUTO_2168 ?AUTO_2173 ) ) ( not ( = ?AUTO_2168 ?AUTO_2174 ) ) ( not ( = ?AUTO_2171 ?AUTO_2173 ) ) ( not ( = ?AUTO_2171 ?AUTO_2174 ) ) ( not ( = ?AUTO_2169 ?AUTO_2173 ) ) ( not ( = ?AUTO_2169 ?AUTO_2174 ) ) ( not ( = ?AUTO_2172 ?AUTO_2173 ) ) ( not ( = ?AUTO_2172 ?AUTO_2174 ) ) ( not ( = ?AUTO_2170 ?AUTO_2173 ) ) ( not ( = ?AUTO_2170 ?AUTO_2174 ) ) ( not ( = ?AUTO_2173 ?AUTO_2174 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_2173 ?AUTO_2174 )
      ( MAKE-ON ?AUTO_2167 ?AUTO_2168 )
      ( MAKE-ON-VERIFY ?AUTO_2167 ?AUTO_2168 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2179 - BLOCK
      ?AUTO_2180 - BLOCK
    )
    :vars
    (
      ?AUTO_2184 - BLOCK
      ?AUTO_2183 - BLOCK
      ?AUTO_2185 - BLOCK
      ?AUTO_2186 - BLOCK
      ?AUTO_2181 - BLOCK
      ?AUTO_2182 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2179 ?AUTO_2180 ) ) ( ON-TABLE ?AUTO_2179 ) ( not ( = ?AUTO_2179 ?AUTO_2184 ) ) ( not ( = ?AUTO_2180 ?AUTO_2184 ) ) ( ON ?AUTO_2184 ?AUTO_2179 ) ( not ( = ?AUTO_2179 ?AUTO_2183 ) ) ( not ( = ?AUTO_2179 ?AUTO_2185 ) ) ( not ( = ?AUTO_2180 ?AUTO_2183 ) ) ( not ( = ?AUTO_2180 ?AUTO_2185 ) ) ( not ( = ?AUTO_2184 ?AUTO_2183 ) ) ( not ( = ?AUTO_2184 ?AUTO_2185 ) ) ( not ( = ?AUTO_2183 ?AUTO_2185 ) ) ( CLEAR ?AUTO_2186 ) ( not ( = ?AUTO_2179 ?AUTO_2186 ) ) ( not ( = ?AUTO_2180 ?AUTO_2186 ) ) ( not ( = ?AUTO_2184 ?AUTO_2186 ) ) ( not ( = ?AUTO_2183 ?AUTO_2186 ) ) ( not ( = ?AUTO_2185 ?AUTO_2186 ) ) ( ON ?AUTO_2185 ?AUTO_2184 ) ( ON ?AUTO_2183 ?AUTO_2185 ) ( CLEAR ?AUTO_2183 ) ( CLEAR ?AUTO_2181 ) ( not ( = ?AUTO_2179 ?AUTO_2182 ) ) ( not ( = ?AUTO_2179 ?AUTO_2181 ) ) ( not ( = ?AUTO_2180 ?AUTO_2182 ) ) ( not ( = ?AUTO_2180 ?AUTO_2181 ) ) ( not ( = ?AUTO_2184 ?AUTO_2182 ) ) ( not ( = ?AUTO_2184 ?AUTO_2181 ) ) ( not ( = ?AUTO_2183 ?AUTO_2182 ) ) ( not ( = ?AUTO_2183 ?AUTO_2181 ) ) ( not ( = ?AUTO_2185 ?AUTO_2182 ) ) ( not ( = ?AUTO_2185 ?AUTO_2181 ) ) ( not ( = ?AUTO_2186 ?AUTO_2182 ) ) ( not ( = ?AUTO_2186 ?AUTO_2181 ) ) ( not ( = ?AUTO_2182 ?AUTO_2181 ) ) ( ON ?AUTO_2182 ?AUTO_2180 ) ( CLEAR ?AUTO_2182 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2182 ?AUTO_2180 )
      ( MAKE-ON ?AUTO_2179 ?AUTO_2180 )
      ( MAKE-ON-VERIFY ?AUTO_2179 ?AUTO_2180 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2187 - BLOCK
      ?AUTO_2188 - BLOCK
    )
    :vars
    (
      ?AUTO_2193 - BLOCK
      ?AUTO_2190 - BLOCK
      ?AUTO_2189 - BLOCK
      ?AUTO_2192 - BLOCK
      ?AUTO_2194 - BLOCK
      ?AUTO_2191 - BLOCK
      ?AUTO_2195 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2187 ?AUTO_2188 ) ) ( ON-TABLE ?AUTO_2187 ) ( not ( = ?AUTO_2187 ?AUTO_2193 ) ) ( not ( = ?AUTO_2188 ?AUTO_2193 ) ) ( ON ?AUTO_2193 ?AUTO_2187 ) ( not ( = ?AUTO_2187 ?AUTO_2190 ) ) ( not ( = ?AUTO_2187 ?AUTO_2189 ) ) ( not ( = ?AUTO_2188 ?AUTO_2190 ) ) ( not ( = ?AUTO_2188 ?AUTO_2189 ) ) ( not ( = ?AUTO_2193 ?AUTO_2190 ) ) ( not ( = ?AUTO_2193 ?AUTO_2189 ) ) ( not ( = ?AUTO_2190 ?AUTO_2189 ) ) ( CLEAR ?AUTO_2192 ) ( not ( = ?AUTO_2187 ?AUTO_2192 ) ) ( not ( = ?AUTO_2188 ?AUTO_2192 ) ) ( not ( = ?AUTO_2193 ?AUTO_2192 ) ) ( not ( = ?AUTO_2190 ?AUTO_2192 ) ) ( not ( = ?AUTO_2189 ?AUTO_2192 ) ) ( ON ?AUTO_2189 ?AUTO_2193 ) ( ON ?AUTO_2190 ?AUTO_2189 ) ( CLEAR ?AUTO_2190 ) ( CLEAR ?AUTO_2194 ) ( not ( = ?AUTO_2187 ?AUTO_2191 ) ) ( not ( = ?AUTO_2187 ?AUTO_2194 ) ) ( not ( = ?AUTO_2188 ?AUTO_2191 ) ) ( not ( = ?AUTO_2188 ?AUTO_2194 ) ) ( not ( = ?AUTO_2193 ?AUTO_2191 ) ) ( not ( = ?AUTO_2193 ?AUTO_2194 ) ) ( not ( = ?AUTO_2190 ?AUTO_2191 ) ) ( not ( = ?AUTO_2190 ?AUTO_2194 ) ) ( not ( = ?AUTO_2189 ?AUTO_2191 ) ) ( not ( = ?AUTO_2189 ?AUTO_2194 ) ) ( not ( = ?AUTO_2192 ?AUTO_2191 ) ) ( not ( = ?AUTO_2192 ?AUTO_2194 ) ) ( not ( = ?AUTO_2191 ?AUTO_2194 ) ) ( ON ?AUTO_2191 ?AUTO_2188 ) ( CLEAR ?AUTO_2191 ) ( HOLDING ?AUTO_2195 ) ( not ( = ?AUTO_2187 ?AUTO_2195 ) ) ( not ( = ?AUTO_2188 ?AUTO_2195 ) ) ( not ( = ?AUTO_2193 ?AUTO_2195 ) ) ( not ( = ?AUTO_2190 ?AUTO_2195 ) ) ( not ( = ?AUTO_2189 ?AUTO_2195 ) ) ( not ( = ?AUTO_2192 ?AUTO_2195 ) ) ( not ( = ?AUTO_2194 ?AUTO_2195 ) ) ( not ( = ?AUTO_2191 ?AUTO_2195 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2195 )
      ( MAKE-ON ?AUTO_2187 ?AUTO_2188 )
      ( MAKE-ON-VERIFY ?AUTO_2187 ?AUTO_2188 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2196 - BLOCK
      ?AUTO_2197 - BLOCK
    )
    :vars
    (
      ?AUTO_2201 - BLOCK
      ?AUTO_2204 - BLOCK
      ?AUTO_2203 - BLOCK
      ?AUTO_2202 - BLOCK
      ?AUTO_2198 - BLOCK
      ?AUTO_2199 - BLOCK
      ?AUTO_2200 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2196 ?AUTO_2197 ) ) ( ON-TABLE ?AUTO_2196 ) ( not ( = ?AUTO_2196 ?AUTO_2201 ) ) ( not ( = ?AUTO_2197 ?AUTO_2201 ) ) ( ON ?AUTO_2201 ?AUTO_2196 ) ( not ( = ?AUTO_2196 ?AUTO_2204 ) ) ( not ( = ?AUTO_2196 ?AUTO_2203 ) ) ( not ( = ?AUTO_2197 ?AUTO_2204 ) ) ( not ( = ?AUTO_2197 ?AUTO_2203 ) ) ( not ( = ?AUTO_2201 ?AUTO_2204 ) ) ( not ( = ?AUTO_2201 ?AUTO_2203 ) ) ( not ( = ?AUTO_2204 ?AUTO_2203 ) ) ( CLEAR ?AUTO_2202 ) ( not ( = ?AUTO_2196 ?AUTO_2202 ) ) ( not ( = ?AUTO_2197 ?AUTO_2202 ) ) ( not ( = ?AUTO_2201 ?AUTO_2202 ) ) ( not ( = ?AUTO_2204 ?AUTO_2202 ) ) ( not ( = ?AUTO_2203 ?AUTO_2202 ) ) ( ON ?AUTO_2203 ?AUTO_2201 ) ( ON ?AUTO_2204 ?AUTO_2203 ) ( CLEAR ?AUTO_2204 ) ( CLEAR ?AUTO_2198 ) ( not ( = ?AUTO_2196 ?AUTO_2199 ) ) ( not ( = ?AUTO_2196 ?AUTO_2198 ) ) ( not ( = ?AUTO_2197 ?AUTO_2199 ) ) ( not ( = ?AUTO_2197 ?AUTO_2198 ) ) ( not ( = ?AUTO_2201 ?AUTO_2199 ) ) ( not ( = ?AUTO_2201 ?AUTO_2198 ) ) ( not ( = ?AUTO_2204 ?AUTO_2199 ) ) ( not ( = ?AUTO_2204 ?AUTO_2198 ) ) ( not ( = ?AUTO_2203 ?AUTO_2199 ) ) ( not ( = ?AUTO_2203 ?AUTO_2198 ) ) ( not ( = ?AUTO_2202 ?AUTO_2199 ) ) ( not ( = ?AUTO_2202 ?AUTO_2198 ) ) ( not ( = ?AUTO_2199 ?AUTO_2198 ) ) ( ON ?AUTO_2199 ?AUTO_2197 ) ( not ( = ?AUTO_2196 ?AUTO_2200 ) ) ( not ( = ?AUTO_2197 ?AUTO_2200 ) ) ( not ( = ?AUTO_2201 ?AUTO_2200 ) ) ( not ( = ?AUTO_2204 ?AUTO_2200 ) ) ( not ( = ?AUTO_2203 ?AUTO_2200 ) ) ( not ( = ?AUTO_2202 ?AUTO_2200 ) ) ( not ( = ?AUTO_2198 ?AUTO_2200 ) ) ( not ( = ?AUTO_2199 ?AUTO_2200 ) ) ( ON ?AUTO_2200 ?AUTO_2199 ) ( CLEAR ?AUTO_2200 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2200 ?AUTO_2199 )
      ( MAKE-ON ?AUTO_2196 ?AUTO_2197 )
      ( MAKE-ON-VERIFY ?AUTO_2196 ?AUTO_2197 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2205 - BLOCK
      ?AUTO_2206 - BLOCK
    )
    :vars
    (
      ?AUTO_2209 - BLOCK
      ?AUTO_2207 - BLOCK
      ?AUTO_2213 - BLOCK
      ?AUTO_2212 - BLOCK
      ?AUTO_2210 - BLOCK
      ?AUTO_2208 - BLOCK
      ?AUTO_2211 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2205 ?AUTO_2206 ) ) ( ON-TABLE ?AUTO_2205 ) ( not ( = ?AUTO_2205 ?AUTO_2209 ) ) ( not ( = ?AUTO_2206 ?AUTO_2209 ) ) ( ON ?AUTO_2209 ?AUTO_2205 ) ( not ( = ?AUTO_2205 ?AUTO_2207 ) ) ( not ( = ?AUTO_2205 ?AUTO_2213 ) ) ( not ( = ?AUTO_2206 ?AUTO_2207 ) ) ( not ( = ?AUTO_2206 ?AUTO_2213 ) ) ( not ( = ?AUTO_2209 ?AUTO_2207 ) ) ( not ( = ?AUTO_2209 ?AUTO_2213 ) ) ( not ( = ?AUTO_2207 ?AUTO_2213 ) ) ( not ( = ?AUTO_2205 ?AUTO_2212 ) ) ( not ( = ?AUTO_2206 ?AUTO_2212 ) ) ( not ( = ?AUTO_2209 ?AUTO_2212 ) ) ( not ( = ?AUTO_2207 ?AUTO_2212 ) ) ( not ( = ?AUTO_2213 ?AUTO_2212 ) ) ( ON ?AUTO_2213 ?AUTO_2209 ) ( ON ?AUTO_2207 ?AUTO_2213 ) ( CLEAR ?AUTO_2207 ) ( CLEAR ?AUTO_2210 ) ( not ( = ?AUTO_2205 ?AUTO_2208 ) ) ( not ( = ?AUTO_2205 ?AUTO_2210 ) ) ( not ( = ?AUTO_2206 ?AUTO_2208 ) ) ( not ( = ?AUTO_2206 ?AUTO_2210 ) ) ( not ( = ?AUTO_2209 ?AUTO_2208 ) ) ( not ( = ?AUTO_2209 ?AUTO_2210 ) ) ( not ( = ?AUTO_2207 ?AUTO_2208 ) ) ( not ( = ?AUTO_2207 ?AUTO_2210 ) ) ( not ( = ?AUTO_2213 ?AUTO_2208 ) ) ( not ( = ?AUTO_2213 ?AUTO_2210 ) ) ( not ( = ?AUTO_2212 ?AUTO_2208 ) ) ( not ( = ?AUTO_2212 ?AUTO_2210 ) ) ( not ( = ?AUTO_2208 ?AUTO_2210 ) ) ( ON ?AUTO_2208 ?AUTO_2206 ) ( not ( = ?AUTO_2205 ?AUTO_2211 ) ) ( not ( = ?AUTO_2206 ?AUTO_2211 ) ) ( not ( = ?AUTO_2209 ?AUTO_2211 ) ) ( not ( = ?AUTO_2207 ?AUTO_2211 ) ) ( not ( = ?AUTO_2213 ?AUTO_2211 ) ) ( not ( = ?AUTO_2212 ?AUTO_2211 ) ) ( not ( = ?AUTO_2210 ?AUTO_2211 ) ) ( not ( = ?AUTO_2208 ?AUTO_2211 ) ) ( ON ?AUTO_2211 ?AUTO_2208 ) ( CLEAR ?AUTO_2211 ) ( HOLDING ?AUTO_2212 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2212 )
      ( MAKE-ON ?AUTO_2205 ?AUTO_2206 )
      ( MAKE-ON-VERIFY ?AUTO_2205 ?AUTO_2206 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2214 - BLOCK
      ?AUTO_2215 - BLOCK
    )
    :vars
    (
      ?AUTO_2220 - BLOCK
      ?AUTO_2221 - BLOCK
      ?AUTO_2217 - BLOCK
      ?AUTO_2216 - BLOCK
      ?AUTO_2218 - BLOCK
      ?AUTO_2222 - BLOCK
      ?AUTO_2219 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2214 ?AUTO_2215 ) ) ( ON-TABLE ?AUTO_2214 ) ( not ( = ?AUTO_2214 ?AUTO_2220 ) ) ( not ( = ?AUTO_2215 ?AUTO_2220 ) ) ( ON ?AUTO_2220 ?AUTO_2214 ) ( not ( = ?AUTO_2214 ?AUTO_2221 ) ) ( not ( = ?AUTO_2214 ?AUTO_2217 ) ) ( not ( = ?AUTO_2215 ?AUTO_2221 ) ) ( not ( = ?AUTO_2215 ?AUTO_2217 ) ) ( not ( = ?AUTO_2220 ?AUTO_2221 ) ) ( not ( = ?AUTO_2220 ?AUTO_2217 ) ) ( not ( = ?AUTO_2221 ?AUTO_2217 ) ) ( not ( = ?AUTO_2214 ?AUTO_2216 ) ) ( not ( = ?AUTO_2215 ?AUTO_2216 ) ) ( not ( = ?AUTO_2220 ?AUTO_2216 ) ) ( not ( = ?AUTO_2221 ?AUTO_2216 ) ) ( not ( = ?AUTO_2217 ?AUTO_2216 ) ) ( ON ?AUTO_2217 ?AUTO_2220 ) ( ON ?AUTO_2221 ?AUTO_2217 ) ( CLEAR ?AUTO_2221 ) ( CLEAR ?AUTO_2218 ) ( not ( = ?AUTO_2214 ?AUTO_2222 ) ) ( not ( = ?AUTO_2214 ?AUTO_2218 ) ) ( not ( = ?AUTO_2215 ?AUTO_2222 ) ) ( not ( = ?AUTO_2215 ?AUTO_2218 ) ) ( not ( = ?AUTO_2220 ?AUTO_2222 ) ) ( not ( = ?AUTO_2220 ?AUTO_2218 ) ) ( not ( = ?AUTO_2221 ?AUTO_2222 ) ) ( not ( = ?AUTO_2221 ?AUTO_2218 ) ) ( not ( = ?AUTO_2217 ?AUTO_2222 ) ) ( not ( = ?AUTO_2217 ?AUTO_2218 ) ) ( not ( = ?AUTO_2216 ?AUTO_2222 ) ) ( not ( = ?AUTO_2216 ?AUTO_2218 ) ) ( not ( = ?AUTO_2222 ?AUTO_2218 ) ) ( ON ?AUTO_2222 ?AUTO_2215 ) ( not ( = ?AUTO_2214 ?AUTO_2219 ) ) ( not ( = ?AUTO_2215 ?AUTO_2219 ) ) ( not ( = ?AUTO_2220 ?AUTO_2219 ) ) ( not ( = ?AUTO_2221 ?AUTO_2219 ) ) ( not ( = ?AUTO_2217 ?AUTO_2219 ) ) ( not ( = ?AUTO_2216 ?AUTO_2219 ) ) ( not ( = ?AUTO_2218 ?AUTO_2219 ) ) ( not ( = ?AUTO_2222 ?AUTO_2219 ) ) ( ON ?AUTO_2219 ?AUTO_2222 ) ( ON ?AUTO_2216 ?AUTO_2219 ) ( CLEAR ?AUTO_2216 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2216 ?AUTO_2219 )
      ( MAKE-ON ?AUTO_2214 ?AUTO_2215 )
      ( MAKE-ON-VERIFY ?AUTO_2214 ?AUTO_2215 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2223 - BLOCK
      ?AUTO_2224 - BLOCK
    )
    :vars
    (
      ?AUTO_2229 - BLOCK
      ?AUTO_2227 - BLOCK
      ?AUTO_2226 - BLOCK
      ?AUTO_2231 - BLOCK
      ?AUTO_2230 - BLOCK
      ?AUTO_2225 - BLOCK
      ?AUTO_2228 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2223 ?AUTO_2224 ) ) ( ON-TABLE ?AUTO_2223 ) ( not ( = ?AUTO_2223 ?AUTO_2229 ) ) ( not ( = ?AUTO_2224 ?AUTO_2229 ) ) ( ON ?AUTO_2229 ?AUTO_2223 ) ( not ( = ?AUTO_2223 ?AUTO_2227 ) ) ( not ( = ?AUTO_2223 ?AUTO_2226 ) ) ( not ( = ?AUTO_2224 ?AUTO_2227 ) ) ( not ( = ?AUTO_2224 ?AUTO_2226 ) ) ( not ( = ?AUTO_2229 ?AUTO_2227 ) ) ( not ( = ?AUTO_2229 ?AUTO_2226 ) ) ( not ( = ?AUTO_2227 ?AUTO_2226 ) ) ( not ( = ?AUTO_2223 ?AUTO_2231 ) ) ( not ( = ?AUTO_2224 ?AUTO_2231 ) ) ( not ( = ?AUTO_2229 ?AUTO_2231 ) ) ( not ( = ?AUTO_2227 ?AUTO_2231 ) ) ( not ( = ?AUTO_2226 ?AUTO_2231 ) ) ( ON ?AUTO_2226 ?AUTO_2229 ) ( CLEAR ?AUTO_2230 ) ( not ( = ?AUTO_2223 ?AUTO_2225 ) ) ( not ( = ?AUTO_2223 ?AUTO_2230 ) ) ( not ( = ?AUTO_2224 ?AUTO_2225 ) ) ( not ( = ?AUTO_2224 ?AUTO_2230 ) ) ( not ( = ?AUTO_2229 ?AUTO_2225 ) ) ( not ( = ?AUTO_2229 ?AUTO_2230 ) ) ( not ( = ?AUTO_2227 ?AUTO_2225 ) ) ( not ( = ?AUTO_2227 ?AUTO_2230 ) ) ( not ( = ?AUTO_2226 ?AUTO_2225 ) ) ( not ( = ?AUTO_2226 ?AUTO_2230 ) ) ( not ( = ?AUTO_2231 ?AUTO_2225 ) ) ( not ( = ?AUTO_2231 ?AUTO_2230 ) ) ( not ( = ?AUTO_2225 ?AUTO_2230 ) ) ( ON ?AUTO_2225 ?AUTO_2224 ) ( not ( = ?AUTO_2223 ?AUTO_2228 ) ) ( not ( = ?AUTO_2224 ?AUTO_2228 ) ) ( not ( = ?AUTO_2229 ?AUTO_2228 ) ) ( not ( = ?AUTO_2227 ?AUTO_2228 ) ) ( not ( = ?AUTO_2226 ?AUTO_2228 ) ) ( not ( = ?AUTO_2231 ?AUTO_2228 ) ) ( not ( = ?AUTO_2230 ?AUTO_2228 ) ) ( not ( = ?AUTO_2225 ?AUTO_2228 ) ) ( ON ?AUTO_2228 ?AUTO_2225 ) ( ON ?AUTO_2231 ?AUTO_2228 ) ( CLEAR ?AUTO_2231 ) ( HOLDING ?AUTO_2227 ) ( CLEAR ?AUTO_2226 ) )
    :subtasks
    ( ( !STACK ?AUTO_2227 ?AUTO_2226 )
      ( MAKE-ON ?AUTO_2223 ?AUTO_2224 )
      ( MAKE-ON-VERIFY ?AUTO_2223 ?AUTO_2224 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4707 - BLOCK
      ?AUTO_4708 - BLOCK
    )
    :vars
    (
      ?AUTO_4709 - BLOCK
      ?AUTO_4710 - BLOCK
      ?AUTO_4712 - BLOCK
      ?AUTO_4713 - BLOCK
      ?AUTO_4711 - BLOCK
      ?AUTO_4714 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4707 ?AUTO_4708 ) ) ( ON-TABLE ?AUTO_4707 ) ( not ( = ?AUTO_4707 ?AUTO_4709 ) ) ( not ( = ?AUTO_4707 ?AUTO_4710 ) ) ( not ( = ?AUTO_4708 ?AUTO_4709 ) ) ( not ( = ?AUTO_4708 ?AUTO_4710 ) ) ( not ( = ?AUTO_4709 ?AUTO_4710 ) ) ( ON ?AUTO_4709 ?AUTO_4708 ) ( not ( = ?AUTO_4707 ?AUTO_4712 ) ) ( not ( = ?AUTO_4707 ?AUTO_4713 ) ) ( not ( = ?AUTO_4708 ?AUTO_4712 ) ) ( not ( = ?AUTO_4708 ?AUTO_4713 ) ) ( not ( = ?AUTO_4710 ?AUTO_4712 ) ) ( not ( = ?AUTO_4710 ?AUTO_4713 ) ) ( not ( = ?AUTO_4709 ?AUTO_4712 ) ) ( not ( = ?AUTO_4709 ?AUTO_4713 ) ) ( not ( = ?AUTO_4712 ?AUTO_4713 ) ) ( ON ?AUTO_4712 ?AUTO_4709 ) ( not ( = ?AUTO_4707 ?AUTO_4711 ) ) ( not ( = ?AUTO_4708 ?AUTO_4711 ) ) ( not ( = ?AUTO_4710 ?AUTO_4711 ) ) ( not ( = ?AUTO_4709 ?AUTO_4711 ) ) ( not ( = ?AUTO_4713 ?AUTO_4711 ) ) ( not ( = ?AUTO_4712 ?AUTO_4711 ) ) ( ON ?AUTO_4711 ?AUTO_4712 ) ( ON ?AUTO_4710 ?AUTO_4707 ) ( ON ?AUTO_4713 ?AUTO_4710 ) ( CLEAR ?AUTO_4713 ) ( not ( = ?AUTO_4707 ?AUTO_4714 ) ) ( not ( = ?AUTO_4708 ?AUTO_4714 ) ) ( not ( = ?AUTO_4709 ?AUTO_4714 ) ) ( not ( = ?AUTO_4710 ?AUTO_4714 ) ) ( not ( = ?AUTO_4712 ?AUTO_4714 ) ) ( not ( = ?AUTO_4713 ?AUTO_4714 ) ) ( not ( = ?AUTO_4711 ?AUTO_4714 ) ) ( ON ?AUTO_4714 ?AUTO_4711 ) ( CLEAR ?AUTO_4714 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4714 ?AUTO_4711 )
      ( MAKE-ON ?AUTO_4707 ?AUTO_4708 )
      ( MAKE-ON-VERIFY ?AUTO_4707 ?AUTO_4708 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2241 - BLOCK
      ?AUTO_2242 - BLOCK
    )
    :vars
    (
      ?AUTO_2245 - BLOCK
      ?AUTO_2247 - BLOCK
      ?AUTO_2246 - BLOCK
      ?AUTO_2249 - BLOCK
      ?AUTO_2248 - BLOCK
      ?AUTO_2244 - BLOCK
      ?AUTO_2243 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2241 ?AUTO_2242 ) ) ( ON-TABLE ?AUTO_2241 ) ( not ( = ?AUTO_2241 ?AUTO_2245 ) ) ( not ( = ?AUTO_2242 ?AUTO_2245 ) ) ( ON ?AUTO_2245 ?AUTO_2241 ) ( not ( = ?AUTO_2241 ?AUTO_2247 ) ) ( not ( = ?AUTO_2241 ?AUTO_2246 ) ) ( not ( = ?AUTO_2242 ?AUTO_2247 ) ) ( not ( = ?AUTO_2242 ?AUTO_2246 ) ) ( not ( = ?AUTO_2245 ?AUTO_2247 ) ) ( not ( = ?AUTO_2245 ?AUTO_2246 ) ) ( not ( = ?AUTO_2247 ?AUTO_2246 ) ) ( not ( = ?AUTO_2241 ?AUTO_2249 ) ) ( not ( = ?AUTO_2242 ?AUTO_2249 ) ) ( not ( = ?AUTO_2245 ?AUTO_2249 ) ) ( not ( = ?AUTO_2247 ?AUTO_2249 ) ) ( not ( = ?AUTO_2246 ?AUTO_2249 ) ) ( CLEAR ?AUTO_2248 ) ( not ( = ?AUTO_2241 ?AUTO_2244 ) ) ( not ( = ?AUTO_2241 ?AUTO_2248 ) ) ( not ( = ?AUTO_2242 ?AUTO_2244 ) ) ( not ( = ?AUTO_2242 ?AUTO_2248 ) ) ( not ( = ?AUTO_2245 ?AUTO_2244 ) ) ( not ( = ?AUTO_2245 ?AUTO_2248 ) ) ( not ( = ?AUTO_2247 ?AUTO_2244 ) ) ( not ( = ?AUTO_2247 ?AUTO_2248 ) ) ( not ( = ?AUTO_2246 ?AUTO_2244 ) ) ( not ( = ?AUTO_2246 ?AUTO_2248 ) ) ( not ( = ?AUTO_2249 ?AUTO_2244 ) ) ( not ( = ?AUTO_2249 ?AUTO_2248 ) ) ( not ( = ?AUTO_2244 ?AUTO_2248 ) ) ( ON ?AUTO_2244 ?AUTO_2242 ) ( not ( = ?AUTO_2241 ?AUTO_2243 ) ) ( not ( = ?AUTO_2242 ?AUTO_2243 ) ) ( not ( = ?AUTO_2245 ?AUTO_2243 ) ) ( not ( = ?AUTO_2247 ?AUTO_2243 ) ) ( not ( = ?AUTO_2246 ?AUTO_2243 ) ) ( not ( = ?AUTO_2249 ?AUTO_2243 ) ) ( not ( = ?AUTO_2248 ?AUTO_2243 ) ) ( not ( = ?AUTO_2244 ?AUTO_2243 ) ) ( ON ?AUTO_2243 ?AUTO_2244 ) ( ON ?AUTO_2249 ?AUTO_2243 ) ( ON ?AUTO_2247 ?AUTO_2249 ) ( CLEAR ?AUTO_2247 ) ( HOLDING ?AUTO_2246 ) ( CLEAR ?AUTO_2245 ) )
    :subtasks
    ( ( !STACK ?AUTO_2246 ?AUTO_2245 )
      ( MAKE-ON ?AUTO_2241 ?AUTO_2242 )
      ( MAKE-ON-VERIFY ?AUTO_2241 ?AUTO_2242 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2250 - BLOCK
      ?AUTO_2251 - BLOCK
    )
    :vars
    (
      ?AUTO_2258 - BLOCK
      ?AUTO_2256 - BLOCK
      ?AUTO_2257 - BLOCK
      ?AUTO_2254 - BLOCK
      ?AUTO_2253 - BLOCK
      ?AUTO_2252 - BLOCK
      ?AUTO_2255 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2250 ?AUTO_2251 ) ) ( ON-TABLE ?AUTO_2250 ) ( not ( = ?AUTO_2250 ?AUTO_2258 ) ) ( not ( = ?AUTO_2251 ?AUTO_2258 ) ) ( ON ?AUTO_2258 ?AUTO_2250 ) ( not ( = ?AUTO_2250 ?AUTO_2256 ) ) ( not ( = ?AUTO_2250 ?AUTO_2257 ) ) ( not ( = ?AUTO_2251 ?AUTO_2256 ) ) ( not ( = ?AUTO_2251 ?AUTO_2257 ) ) ( not ( = ?AUTO_2258 ?AUTO_2256 ) ) ( not ( = ?AUTO_2258 ?AUTO_2257 ) ) ( not ( = ?AUTO_2256 ?AUTO_2257 ) ) ( not ( = ?AUTO_2250 ?AUTO_2254 ) ) ( not ( = ?AUTO_2251 ?AUTO_2254 ) ) ( not ( = ?AUTO_2258 ?AUTO_2254 ) ) ( not ( = ?AUTO_2256 ?AUTO_2254 ) ) ( not ( = ?AUTO_2257 ?AUTO_2254 ) ) ( CLEAR ?AUTO_2253 ) ( not ( = ?AUTO_2250 ?AUTO_2252 ) ) ( not ( = ?AUTO_2250 ?AUTO_2253 ) ) ( not ( = ?AUTO_2251 ?AUTO_2252 ) ) ( not ( = ?AUTO_2251 ?AUTO_2253 ) ) ( not ( = ?AUTO_2258 ?AUTO_2252 ) ) ( not ( = ?AUTO_2258 ?AUTO_2253 ) ) ( not ( = ?AUTO_2256 ?AUTO_2252 ) ) ( not ( = ?AUTO_2256 ?AUTO_2253 ) ) ( not ( = ?AUTO_2257 ?AUTO_2252 ) ) ( not ( = ?AUTO_2257 ?AUTO_2253 ) ) ( not ( = ?AUTO_2254 ?AUTO_2252 ) ) ( not ( = ?AUTO_2254 ?AUTO_2253 ) ) ( not ( = ?AUTO_2252 ?AUTO_2253 ) ) ( ON ?AUTO_2252 ?AUTO_2251 ) ( not ( = ?AUTO_2250 ?AUTO_2255 ) ) ( not ( = ?AUTO_2251 ?AUTO_2255 ) ) ( not ( = ?AUTO_2258 ?AUTO_2255 ) ) ( not ( = ?AUTO_2256 ?AUTO_2255 ) ) ( not ( = ?AUTO_2257 ?AUTO_2255 ) ) ( not ( = ?AUTO_2254 ?AUTO_2255 ) ) ( not ( = ?AUTO_2253 ?AUTO_2255 ) ) ( not ( = ?AUTO_2252 ?AUTO_2255 ) ) ( ON ?AUTO_2255 ?AUTO_2252 ) ( ON ?AUTO_2254 ?AUTO_2255 ) ( ON ?AUTO_2256 ?AUTO_2254 ) ( CLEAR ?AUTO_2256 ) ( CLEAR ?AUTO_2258 ) ( ON-TABLE ?AUTO_2257 ) ( CLEAR ?AUTO_2257 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_2257 )
      ( MAKE-ON ?AUTO_2250 ?AUTO_2251 )
      ( MAKE-ON-VERIFY ?AUTO_2250 ?AUTO_2251 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2259 - BLOCK
      ?AUTO_2260 - BLOCK
    )
    :vars
    (
      ?AUTO_2264 - BLOCK
      ?AUTO_2265 - BLOCK
      ?AUTO_2266 - BLOCK
      ?AUTO_2263 - BLOCK
      ?AUTO_2267 - BLOCK
      ?AUTO_2262 - BLOCK
      ?AUTO_2261 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2259 ?AUTO_2260 ) ) ( ON-TABLE ?AUTO_2259 ) ( not ( = ?AUTO_2259 ?AUTO_2264 ) ) ( not ( = ?AUTO_2260 ?AUTO_2264 ) ) ( not ( = ?AUTO_2259 ?AUTO_2265 ) ) ( not ( = ?AUTO_2259 ?AUTO_2266 ) ) ( not ( = ?AUTO_2260 ?AUTO_2265 ) ) ( not ( = ?AUTO_2260 ?AUTO_2266 ) ) ( not ( = ?AUTO_2264 ?AUTO_2265 ) ) ( not ( = ?AUTO_2264 ?AUTO_2266 ) ) ( not ( = ?AUTO_2265 ?AUTO_2266 ) ) ( not ( = ?AUTO_2259 ?AUTO_2263 ) ) ( not ( = ?AUTO_2260 ?AUTO_2263 ) ) ( not ( = ?AUTO_2264 ?AUTO_2263 ) ) ( not ( = ?AUTO_2265 ?AUTO_2263 ) ) ( not ( = ?AUTO_2266 ?AUTO_2263 ) ) ( CLEAR ?AUTO_2267 ) ( not ( = ?AUTO_2259 ?AUTO_2262 ) ) ( not ( = ?AUTO_2259 ?AUTO_2267 ) ) ( not ( = ?AUTO_2260 ?AUTO_2262 ) ) ( not ( = ?AUTO_2260 ?AUTO_2267 ) ) ( not ( = ?AUTO_2264 ?AUTO_2262 ) ) ( not ( = ?AUTO_2264 ?AUTO_2267 ) ) ( not ( = ?AUTO_2265 ?AUTO_2262 ) ) ( not ( = ?AUTO_2265 ?AUTO_2267 ) ) ( not ( = ?AUTO_2266 ?AUTO_2262 ) ) ( not ( = ?AUTO_2266 ?AUTO_2267 ) ) ( not ( = ?AUTO_2263 ?AUTO_2262 ) ) ( not ( = ?AUTO_2263 ?AUTO_2267 ) ) ( not ( = ?AUTO_2262 ?AUTO_2267 ) ) ( ON ?AUTO_2262 ?AUTO_2260 ) ( not ( = ?AUTO_2259 ?AUTO_2261 ) ) ( not ( = ?AUTO_2260 ?AUTO_2261 ) ) ( not ( = ?AUTO_2264 ?AUTO_2261 ) ) ( not ( = ?AUTO_2265 ?AUTO_2261 ) ) ( not ( = ?AUTO_2266 ?AUTO_2261 ) ) ( not ( = ?AUTO_2263 ?AUTO_2261 ) ) ( not ( = ?AUTO_2267 ?AUTO_2261 ) ) ( not ( = ?AUTO_2262 ?AUTO_2261 ) ) ( ON ?AUTO_2261 ?AUTO_2262 ) ( ON ?AUTO_2263 ?AUTO_2261 ) ( ON ?AUTO_2265 ?AUTO_2263 ) ( CLEAR ?AUTO_2265 ) ( ON-TABLE ?AUTO_2266 ) ( CLEAR ?AUTO_2266 ) ( HOLDING ?AUTO_2264 ) ( CLEAR ?AUTO_2259 ) )
    :subtasks
    ( ( !STACK ?AUTO_2264 ?AUTO_2259 )
      ( MAKE-ON ?AUTO_2259 ?AUTO_2260 )
      ( MAKE-ON-VERIFY ?AUTO_2259 ?AUTO_2260 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2268 - BLOCK
      ?AUTO_2269 - BLOCK
    )
    :vars
    (
      ?AUTO_2272 - BLOCK
      ?AUTO_2276 - BLOCK
      ?AUTO_2275 - BLOCK
      ?AUTO_2274 - BLOCK
      ?AUTO_2271 - BLOCK
      ?AUTO_2270 - BLOCK
      ?AUTO_2273 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2268 ?AUTO_2269 ) ) ( ON-TABLE ?AUTO_2268 ) ( not ( = ?AUTO_2268 ?AUTO_2272 ) ) ( not ( = ?AUTO_2269 ?AUTO_2272 ) ) ( not ( = ?AUTO_2268 ?AUTO_2276 ) ) ( not ( = ?AUTO_2268 ?AUTO_2275 ) ) ( not ( = ?AUTO_2269 ?AUTO_2276 ) ) ( not ( = ?AUTO_2269 ?AUTO_2275 ) ) ( not ( = ?AUTO_2272 ?AUTO_2276 ) ) ( not ( = ?AUTO_2272 ?AUTO_2275 ) ) ( not ( = ?AUTO_2276 ?AUTO_2275 ) ) ( not ( = ?AUTO_2268 ?AUTO_2274 ) ) ( not ( = ?AUTO_2269 ?AUTO_2274 ) ) ( not ( = ?AUTO_2272 ?AUTO_2274 ) ) ( not ( = ?AUTO_2276 ?AUTO_2274 ) ) ( not ( = ?AUTO_2275 ?AUTO_2274 ) ) ( CLEAR ?AUTO_2271 ) ( not ( = ?AUTO_2268 ?AUTO_2270 ) ) ( not ( = ?AUTO_2268 ?AUTO_2271 ) ) ( not ( = ?AUTO_2269 ?AUTO_2270 ) ) ( not ( = ?AUTO_2269 ?AUTO_2271 ) ) ( not ( = ?AUTO_2272 ?AUTO_2270 ) ) ( not ( = ?AUTO_2272 ?AUTO_2271 ) ) ( not ( = ?AUTO_2276 ?AUTO_2270 ) ) ( not ( = ?AUTO_2276 ?AUTO_2271 ) ) ( not ( = ?AUTO_2275 ?AUTO_2270 ) ) ( not ( = ?AUTO_2275 ?AUTO_2271 ) ) ( not ( = ?AUTO_2274 ?AUTO_2270 ) ) ( not ( = ?AUTO_2274 ?AUTO_2271 ) ) ( not ( = ?AUTO_2270 ?AUTO_2271 ) ) ( ON ?AUTO_2270 ?AUTO_2269 ) ( not ( = ?AUTO_2268 ?AUTO_2273 ) ) ( not ( = ?AUTO_2269 ?AUTO_2273 ) ) ( not ( = ?AUTO_2272 ?AUTO_2273 ) ) ( not ( = ?AUTO_2276 ?AUTO_2273 ) ) ( not ( = ?AUTO_2275 ?AUTO_2273 ) ) ( not ( = ?AUTO_2274 ?AUTO_2273 ) ) ( not ( = ?AUTO_2271 ?AUTO_2273 ) ) ( not ( = ?AUTO_2270 ?AUTO_2273 ) ) ( ON ?AUTO_2273 ?AUTO_2270 ) ( ON ?AUTO_2274 ?AUTO_2273 ) ( ON ?AUTO_2276 ?AUTO_2274 ) ( CLEAR ?AUTO_2276 ) ( ON-TABLE ?AUTO_2275 ) ( CLEAR ?AUTO_2268 ) ( ON ?AUTO_2272 ?AUTO_2275 ) ( CLEAR ?AUTO_2272 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2272 ?AUTO_2275 )
      ( MAKE-ON ?AUTO_2268 ?AUTO_2269 )
      ( MAKE-ON-VERIFY ?AUTO_2268 ?AUTO_2269 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2283 - BLOCK
      ?AUTO_2284 - BLOCK
    )
    :vars
    (
      ?AUTO_2289 - BLOCK
      ?AUTO_2291 - BLOCK
      ?AUTO_2286 - BLOCK
      ?AUTO_2287 - BLOCK
      ?AUTO_2288 - BLOCK
      ?AUTO_2285 - BLOCK
      ?AUTO_2290 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2283 ?AUTO_2284 ) ) ( ON-TABLE ?AUTO_2283 ) ( not ( = ?AUTO_2283 ?AUTO_2289 ) ) ( not ( = ?AUTO_2284 ?AUTO_2289 ) ) ( not ( = ?AUTO_2283 ?AUTO_2291 ) ) ( not ( = ?AUTO_2283 ?AUTO_2286 ) ) ( not ( = ?AUTO_2284 ?AUTO_2291 ) ) ( not ( = ?AUTO_2284 ?AUTO_2286 ) ) ( not ( = ?AUTO_2289 ?AUTO_2291 ) ) ( not ( = ?AUTO_2289 ?AUTO_2286 ) ) ( not ( = ?AUTO_2291 ?AUTO_2286 ) ) ( not ( = ?AUTO_2283 ?AUTO_2287 ) ) ( not ( = ?AUTO_2284 ?AUTO_2287 ) ) ( not ( = ?AUTO_2289 ?AUTO_2287 ) ) ( not ( = ?AUTO_2291 ?AUTO_2287 ) ) ( not ( = ?AUTO_2286 ?AUTO_2287 ) ) ( not ( = ?AUTO_2283 ?AUTO_2288 ) ) ( not ( = ?AUTO_2283 ?AUTO_2285 ) ) ( not ( = ?AUTO_2284 ?AUTO_2288 ) ) ( not ( = ?AUTO_2284 ?AUTO_2285 ) ) ( not ( = ?AUTO_2289 ?AUTO_2288 ) ) ( not ( = ?AUTO_2289 ?AUTO_2285 ) ) ( not ( = ?AUTO_2291 ?AUTO_2288 ) ) ( not ( = ?AUTO_2291 ?AUTO_2285 ) ) ( not ( = ?AUTO_2286 ?AUTO_2288 ) ) ( not ( = ?AUTO_2286 ?AUTO_2285 ) ) ( not ( = ?AUTO_2287 ?AUTO_2288 ) ) ( not ( = ?AUTO_2287 ?AUTO_2285 ) ) ( not ( = ?AUTO_2288 ?AUTO_2285 ) ) ( ON ?AUTO_2288 ?AUTO_2284 ) ( not ( = ?AUTO_2283 ?AUTO_2290 ) ) ( not ( = ?AUTO_2284 ?AUTO_2290 ) ) ( not ( = ?AUTO_2289 ?AUTO_2290 ) ) ( not ( = ?AUTO_2291 ?AUTO_2290 ) ) ( not ( = ?AUTO_2286 ?AUTO_2290 ) ) ( not ( = ?AUTO_2287 ?AUTO_2290 ) ) ( not ( = ?AUTO_2285 ?AUTO_2290 ) ) ( not ( = ?AUTO_2288 ?AUTO_2290 ) ) ( ON ?AUTO_2290 ?AUTO_2288 ) ( ON ?AUTO_2287 ?AUTO_2290 ) ( ON ?AUTO_2291 ?AUTO_2287 ) ( CLEAR ?AUTO_2291 ) ( ON-TABLE ?AUTO_2286 ) ( CLEAR ?AUTO_2286 ) ( CLEAR ?AUTO_2283 ) ( ON ?AUTO_2289 ?AUTO_2285 ) ( CLEAR ?AUTO_2289 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2289 ?AUTO_2285 )
      ( MAKE-ON ?AUTO_2283 ?AUTO_2284 )
      ( MAKE-ON-VERIFY ?AUTO_2283 ?AUTO_2284 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2345 - BLOCK
      ?AUTO_2346 - BLOCK
    )
    :vars
    (
      ?AUTO_2347 - BLOCK
      ?AUTO_2348 - BLOCK
      ?AUTO_2349 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2345 ?AUTO_2346 ) ) ( ON ?AUTO_2345 ?AUTO_2347 ) ( not ( = ?AUTO_2345 ?AUTO_2347 ) ) ( not ( = ?AUTO_2346 ?AUTO_2347 ) ) ( ON ?AUTO_2346 ?AUTO_2345 ) ( not ( = ?AUTO_2345 ?AUTO_2348 ) ) ( not ( = ?AUTO_2346 ?AUTO_2348 ) ) ( not ( = ?AUTO_2347 ?AUTO_2348 ) ) ( ON ?AUTO_2348 ?AUTO_2346 ) ( CLEAR ?AUTO_2348 ) ( HOLDING ?AUTO_2349 ) ( not ( = ?AUTO_2345 ?AUTO_2349 ) ) ( not ( = ?AUTO_2346 ?AUTO_2349 ) ) ( not ( = ?AUTO_2347 ?AUTO_2349 ) ) ( not ( = ?AUTO_2348 ?AUTO_2349 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2349 )
      ( MAKE-ON ?AUTO_2345 ?AUTO_2346 )
      ( MAKE-ON-VERIFY ?AUTO_2345 ?AUTO_2346 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3469 - BLOCK
      ?AUTO_3470 - BLOCK
    )
    :vars
    (
      ?AUTO_3473 - BLOCK
      ?AUTO_3471 - BLOCK
      ?AUTO_3472 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3469 ?AUTO_3470 ) ) ( ON-TABLE ?AUTO_3469 ) ( not ( = ?AUTO_3469 ?AUTO_3473 ) ) ( not ( = ?AUTO_3469 ?AUTO_3471 ) ) ( not ( = ?AUTO_3470 ?AUTO_3473 ) ) ( not ( = ?AUTO_3470 ?AUTO_3471 ) ) ( not ( = ?AUTO_3473 ?AUTO_3471 ) ) ( ON ?AUTO_3473 ?AUTO_3470 ) ( CLEAR ?AUTO_3473 ) ( not ( = ?AUTO_3469 ?AUTO_3472 ) ) ( not ( = ?AUTO_3470 ?AUTO_3472 ) ) ( not ( = ?AUTO_3471 ?AUTO_3472 ) ) ( not ( = ?AUTO_3473 ?AUTO_3472 ) ) ( ON ?AUTO_3472 ?AUTO_3469 ) ( CLEAR ?AUTO_3472 ) ( HOLDING ?AUTO_3471 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3471 )
      ( MAKE-ON ?AUTO_3469 ?AUTO_3470 )
      ( MAKE-ON-VERIFY ?AUTO_3469 ?AUTO_3470 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4678 - BLOCK
      ?AUTO_4679 - BLOCK
    )
    :vars
    (
      ?AUTO_4680 - BLOCK
      ?AUTO_4683 - BLOCK
      ?AUTO_4682 - BLOCK
      ?AUTO_4681 - BLOCK
      ?AUTO_4684 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4678 ?AUTO_4679 ) ) ( ON-TABLE ?AUTO_4678 ) ( not ( = ?AUTO_4678 ?AUTO_4680 ) ) ( not ( = ?AUTO_4678 ?AUTO_4683 ) ) ( not ( = ?AUTO_4679 ?AUTO_4680 ) ) ( not ( = ?AUTO_4679 ?AUTO_4683 ) ) ( not ( = ?AUTO_4680 ?AUTO_4683 ) ) ( ON ?AUTO_4680 ?AUTO_4679 ) ( CLEAR ?AUTO_4682 ) ( not ( = ?AUTO_4678 ?AUTO_4681 ) ) ( not ( = ?AUTO_4678 ?AUTO_4682 ) ) ( not ( = ?AUTO_4679 ?AUTO_4681 ) ) ( not ( = ?AUTO_4679 ?AUTO_4682 ) ) ( not ( = ?AUTO_4683 ?AUTO_4681 ) ) ( not ( = ?AUTO_4683 ?AUTO_4682 ) ) ( not ( = ?AUTO_4680 ?AUTO_4681 ) ) ( not ( = ?AUTO_4680 ?AUTO_4682 ) ) ( not ( = ?AUTO_4681 ?AUTO_4682 ) ) ( ON ?AUTO_4681 ?AUTO_4680 ) ( not ( = ?AUTO_4678 ?AUTO_4684 ) ) ( not ( = ?AUTO_4679 ?AUTO_4684 ) ) ( not ( = ?AUTO_4683 ?AUTO_4684 ) ) ( not ( = ?AUTO_4680 ?AUTO_4684 ) ) ( not ( = ?AUTO_4682 ?AUTO_4684 ) ) ( not ( = ?AUTO_4681 ?AUTO_4684 ) ) ( ON ?AUTO_4684 ?AUTO_4681 ) ( CLEAR ?AUTO_4684 ) ( ON ?AUTO_4683 ?AUTO_4678 ) ( CLEAR ?AUTO_4683 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4683 ?AUTO_4678 )
      ( MAKE-ON ?AUTO_4678 ?AUTO_4679 )
      ( MAKE-ON-VERIFY ?AUTO_4678 ?AUTO_4679 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4685 - BLOCK
      ?AUTO_4686 - BLOCK
    )
    :vars
    (
      ?AUTO_4690 - BLOCK
      ?AUTO_4687 - BLOCK
      ?AUTO_4688 - BLOCK
      ?AUTO_4689 - BLOCK
      ?AUTO_4691 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4685 ?AUTO_4686 ) ) ( ON-TABLE ?AUTO_4685 ) ( not ( = ?AUTO_4685 ?AUTO_4690 ) ) ( not ( = ?AUTO_4685 ?AUTO_4687 ) ) ( not ( = ?AUTO_4686 ?AUTO_4690 ) ) ( not ( = ?AUTO_4686 ?AUTO_4687 ) ) ( not ( = ?AUTO_4690 ?AUTO_4687 ) ) ( ON ?AUTO_4690 ?AUTO_4686 ) ( not ( = ?AUTO_4685 ?AUTO_4688 ) ) ( not ( = ?AUTO_4685 ?AUTO_4689 ) ) ( not ( = ?AUTO_4686 ?AUTO_4688 ) ) ( not ( = ?AUTO_4686 ?AUTO_4689 ) ) ( not ( = ?AUTO_4687 ?AUTO_4688 ) ) ( not ( = ?AUTO_4687 ?AUTO_4689 ) ) ( not ( = ?AUTO_4690 ?AUTO_4688 ) ) ( not ( = ?AUTO_4690 ?AUTO_4689 ) ) ( not ( = ?AUTO_4688 ?AUTO_4689 ) ) ( ON ?AUTO_4688 ?AUTO_4690 ) ( not ( = ?AUTO_4685 ?AUTO_4691 ) ) ( not ( = ?AUTO_4686 ?AUTO_4691 ) ) ( not ( = ?AUTO_4687 ?AUTO_4691 ) ) ( not ( = ?AUTO_4690 ?AUTO_4691 ) ) ( not ( = ?AUTO_4689 ?AUTO_4691 ) ) ( not ( = ?AUTO_4688 ?AUTO_4691 ) ) ( ON ?AUTO_4691 ?AUTO_4688 ) ( CLEAR ?AUTO_4691 ) ( ON ?AUTO_4687 ?AUTO_4685 ) ( CLEAR ?AUTO_4687 ) ( HOLDING ?AUTO_4689 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4689 )
      ( MAKE-ON ?AUTO_4685 ?AUTO_4686 )
      ( MAKE-ON-VERIFY ?AUTO_4685 ?AUTO_4686 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4692 - BLOCK
      ?AUTO_4693 - BLOCK
    )
    :vars
    (
      ?AUTO_4698 - BLOCK
      ?AUTO_4694 - BLOCK
      ?AUTO_4697 - BLOCK
      ?AUTO_4695 - BLOCK
      ?AUTO_4696 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4692 ?AUTO_4693 ) ) ( ON-TABLE ?AUTO_4692 ) ( not ( = ?AUTO_4692 ?AUTO_4698 ) ) ( not ( = ?AUTO_4692 ?AUTO_4694 ) ) ( not ( = ?AUTO_4693 ?AUTO_4698 ) ) ( not ( = ?AUTO_4693 ?AUTO_4694 ) ) ( not ( = ?AUTO_4698 ?AUTO_4694 ) ) ( ON ?AUTO_4698 ?AUTO_4693 ) ( not ( = ?AUTO_4692 ?AUTO_4697 ) ) ( not ( = ?AUTO_4692 ?AUTO_4695 ) ) ( not ( = ?AUTO_4693 ?AUTO_4697 ) ) ( not ( = ?AUTO_4693 ?AUTO_4695 ) ) ( not ( = ?AUTO_4694 ?AUTO_4697 ) ) ( not ( = ?AUTO_4694 ?AUTO_4695 ) ) ( not ( = ?AUTO_4698 ?AUTO_4697 ) ) ( not ( = ?AUTO_4698 ?AUTO_4695 ) ) ( not ( = ?AUTO_4697 ?AUTO_4695 ) ) ( ON ?AUTO_4697 ?AUTO_4698 ) ( not ( = ?AUTO_4692 ?AUTO_4696 ) ) ( not ( = ?AUTO_4693 ?AUTO_4696 ) ) ( not ( = ?AUTO_4694 ?AUTO_4696 ) ) ( not ( = ?AUTO_4698 ?AUTO_4696 ) ) ( not ( = ?AUTO_4695 ?AUTO_4696 ) ) ( not ( = ?AUTO_4697 ?AUTO_4696 ) ) ( ON ?AUTO_4696 ?AUTO_4697 ) ( CLEAR ?AUTO_4696 ) ( ON ?AUTO_4694 ?AUTO_4692 ) ( ON ?AUTO_4695 ?AUTO_4694 ) ( CLEAR ?AUTO_4695 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4695 ?AUTO_4694 )
      ( MAKE-ON ?AUTO_4692 ?AUTO_4693 )
      ( MAKE-ON-VERIFY ?AUTO_4692 ?AUTO_4693 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4699 - BLOCK
      ?AUTO_4700 - BLOCK
    )
    :vars
    (
      ?AUTO_4702 - BLOCK
      ?AUTO_4701 - BLOCK
      ?AUTO_4703 - BLOCK
      ?AUTO_4705 - BLOCK
      ?AUTO_4704 - BLOCK
      ?AUTO_4706 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4699 ?AUTO_4700 ) ) ( ON-TABLE ?AUTO_4699 ) ( not ( = ?AUTO_4699 ?AUTO_4702 ) ) ( not ( = ?AUTO_4699 ?AUTO_4701 ) ) ( not ( = ?AUTO_4700 ?AUTO_4702 ) ) ( not ( = ?AUTO_4700 ?AUTO_4701 ) ) ( not ( = ?AUTO_4702 ?AUTO_4701 ) ) ( ON ?AUTO_4702 ?AUTO_4700 ) ( not ( = ?AUTO_4699 ?AUTO_4703 ) ) ( not ( = ?AUTO_4699 ?AUTO_4705 ) ) ( not ( = ?AUTO_4700 ?AUTO_4703 ) ) ( not ( = ?AUTO_4700 ?AUTO_4705 ) ) ( not ( = ?AUTO_4701 ?AUTO_4703 ) ) ( not ( = ?AUTO_4701 ?AUTO_4705 ) ) ( not ( = ?AUTO_4702 ?AUTO_4703 ) ) ( not ( = ?AUTO_4702 ?AUTO_4705 ) ) ( not ( = ?AUTO_4703 ?AUTO_4705 ) ) ( ON ?AUTO_4703 ?AUTO_4702 ) ( not ( = ?AUTO_4699 ?AUTO_4704 ) ) ( not ( = ?AUTO_4700 ?AUTO_4704 ) ) ( not ( = ?AUTO_4701 ?AUTO_4704 ) ) ( not ( = ?AUTO_4702 ?AUTO_4704 ) ) ( not ( = ?AUTO_4705 ?AUTO_4704 ) ) ( not ( = ?AUTO_4703 ?AUTO_4704 ) ) ( ON ?AUTO_4704 ?AUTO_4703 ) ( CLEAR ?AUTO_4704 ) ( ON ?AUTO_4701 ?AUTO_4699 ) ( ON ?AUTO_4705 ?AUTO_4701 ) ( CLEAR ?AUTO_4705 ) ( HOLDING ?AUTO_4706 ) ( not ( = ?AUTO_4699 ?AUTO_4706 ) ) ( not ( = ?AUTO_4700 ?AUTO_4706 ) ) ( not ( = ?AUTO_4702 ?AUTO_4706 ) ) ( not ( = ?AUTO_4701 ?AUTO_4706 ) ) ( not ( = ?AUTO_4703 ?AUTO_4706 ) ) ( not ( = ?AUTO_4705 ?AUTO_4706 ) ) ( not ( = ?AUTO_4704 ?AUTO_4706 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4706 )
      ( MAKE-ON ?AUTO_4699 ?AUTO_4700 )
      ( MAKE-ON-VERIFY ?AUTO_4699 ?AUTO_4700 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2886 - BLOCK
      ?AUTO_2887 - BLOCK
    )
    :vars
    (
      ?AUTO_2888 - BLOCK
      ?AUTO_2891 - BLOCK
      ?AUTO_2890 - BLOCK
      ?AUTO_2889 - BLOCK
      ?AUTO_2893 - BLOCK
      ?AUTO_2894 - BLOCK
      ?AUTO_2892 - BLOCK
      ?AUTO_2895 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2886 ?AUTO_2887 ) ) ( ON-TABLE ?AUTO_2886 ) ( not ( = ?AUTO_2886 ?AUTO_2888 ) ) ( not ( = ?AUTO_2886 ?AUTO_2891 ) ) ( not ( = ?AUTO_2887 ?AUTO_2888 ) ) ( not ( = ?AUTO_2887 ?AUTO_2891 ) ) ( not ( = ?AUTO_2888 ?AUTO_2891 ) ) ( CLEAR ?AUTO_2890 ) ( not ( = ?AUTO_2886 ?AUTO_2890 ) ) ( not ( = ?AUTO_2887 ?AUTO_2890 ) ) ( not ( = ?AUTO_2888 ?AUTO_2890 ) ) ( not ( = ?AUTO_2891 ?AUTO_2890 ) ) ( ON ?AUTO_2891 ?AUTO_2887 ) ( not ( = ?AUTO_2886 ?AUTO_2889 ) ) ( not ( = ?AUTO_2887 ?AUTO_2889 ) ) ( not ( = ?AUTO_2888 ?AUTO_2889 ) ) ( not ( = ?AUTO_2891 ?AUTO_2889 ) ) ( not ( = ?AUTO_2890 ?AUTO_2889 ) ) ( ON ?AUTO_2889 ?AUTO_2891 ) ( ON ?AUTO_2888 ?AUTO_2889 ) ( CLEAR ?AUTO_2888 ) ( CLEAR ?AUTO_2893 ) ( not ( = ?AUTO_2886 ?AUTO_2894 ) ) ( not ( = ?AUTO_2886 ?AUTO_2893 ) ) ( not ( = ?AUTO_2887 ?AUTO_2894 ) ) ( not ( = ?AUTO_2887 ?AUTO_2893 ) ) ( not ( = ?AUTO_2888 ?AUTO_2894 ) ) ( not ( = ?AUTO_2888 ?AUTO_2893 ) ) ( not ( = ?AUTO_2891 ?AUTO_2894 ) ) ( not ( = ?AUTO_2891 ?AUTO_2893 ) ) ( not ( = ?AUTO_2890 ?AUTO_2894 ) ) ( not ( = ?AUTO_2890 ?AUTO_2893 ) ) ( not ( = ?AUTO_2889 ?AUTO_2894 ) ) ( not ( = ?AUTO_2889 ?AUTO_2893 ) ) ( not ( = ?AUTO_2894 ?AUTO_2893 ) ) ( ON ?AUTO_2894 ?AUTO_2886 ) ( not ( = ?AUTO_2886 ?AUTO_2892 ) ) ( not ( = ?AUTO_2887 ?AUTO_2892 ) ) ( not ( = ?AUTO_2888 ?AUTO_2892 ) ) ( not ( = ?AUTO_2891 ?AUTO_2892 ) ) ( not ( = ?AUTO_2890 ?AUTO_2892 ) ) ( not ( = ?AUTO_2889 ?AUTO_2892 ) ) ( not ( = ?AUTO_2893 ?AUTO_2892 ) ) ( not ( = ?AUTO_2894 ?AUTO_2892 ) ) ( ON ?AUTO_2892 ?AUTO_2894 ) ( not ( = ?AUTO_2886 ?AUTO_2895 ) ) ( not ( = ?AUTO_2887 ?AUTO_2895 ) ) ( not ( = ?AUTO_2888 ?AUTO_2895 ) ) ( not ( = ?AUTO_2891 ?AUTO_2895 ) ) ( not ( = ?AUTO_2890 ?AUTO_2895 ) ) ( not ( = ?AUTO_2889 ?AUTO_2895 ) ) ( not ( = ?AUTO_2893 ?AUTO_2895 ) ) ( not ( = ?AUTO_2894 ?AUTO_2895 ) ) ( not ( = ?AUTO_2892 ?AUTO_2895 ) ) ( ON ?AUTO_2895 ?AUTO_2892 ) ( CLEAR ?AUTO_2895 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2895 ?AUTO_2892 )
      ( MAKE-ON ?AUTO_2886 ?AUTO_2887 )
      ( MAKE-ON-VERIFY ?AUTO_2886 ?AUTO_2887 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2896 - BLOCK
      ?AUTO_2897 - BLOCK
    )
    :vars
    (
      ?AUTO_2902 - BLOCK
      ?AUTO_2901 - BLOCK
      ?AUTO_2900 - BLOCK
      ?AUTO_2904 - BLOCK
      ?AUTO_2905 - BLOCK
      ?AUTO_2903 - BLOCK
      ?AUTO_2899 - BLOCK
      ?AUTO_2898 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2896 ?AUTO_2897 ) ) ( ON-TABLE ?AUTO_2896 ) ( not ( = ?AUTO_2896 ?AUTO_2902 ) ) ( not ( = ?AUTO_2896 ?AUTO_2901 ) ) ( not ( = ?AUTO_2897 ?AUTO_2902 ) ) ( not ( = ?AUTO_2897 ?AUTO_2901 ) ) ( not ( = ?AUTO_2902 ?AUTO_2901 ) ) ( not ( = ?AUTO_2896 ?AUTO_2900 ) ) ( not ( = ?AUTO_2897 ?AUTO_2900 ) ) ( not ( = ?AUTO_2902 ?AUTO_2900 ) ) ( not ( = ?AUTO_2901 ?AUTO_2900 ) ) ( ON ?AUTO_2901 ?AUTO_2897 ) ( not ( = ?AUTO_2896 ?AUTO_2904 ) ) ( not ( = ?AUTO_2897 ?AUTO_2904 ) ) ( not ( = ?AUTO_2902 ?AUTO_2904 ) ) ( not ( = ?AUTO_2901 ?AUTO_2904 ) ) ( not ( = ?AUTO_2900 ?AUTO_2904 ) ) ( ON ?AUTO_2904 ?AUTO_2901 ) ( ON ?AUTO_2902 ?AUTO_2904 ) ( CLEAR ?AUTO_2902 ) ( CLEAR ?AUTO_2905 ) ( not ( = ?AUTO_2896 ?AUTO_2903 ) ) ( not ( = ?AUTO_2896 ?AUTO_2905 ) ) ( not ( = ?AUTO_2897 ?AUTO_2903 ) ) ( not ( = ?AUTO_2897 ?AUTO_2905 ) ) ( not ( = ?AUTO_2902 ?AUTO_2903 ) ) ( not ( = ?AUTO_2902 ?AUTO_2905 ) ) ( not ( = ?AUTO_2901 ?AUTO_2903 ) ) ( not ( = ?AUTO_2901 ?AUTO_2905 ) ) ( not ( = ?AUTO_2900 ?AUTO_2903 ) ) ( not ( = ?AUTO_2900 ?AUTO_2905 ) ) ( not ( = ?AUTO_2904 ?AUTO_2903 ) ) ( not ( = ?AUTO_2904 ?AUTO_2905 ) ) ( not ( = ?AUTO_2903 ?AUTO_2905 ) ) ( ON ?AUTO_2903 ?AUTO_2896 ) ( not ( = ?AUTO_2896 ?AUTO_2899 ) ) ( not ( = ?AUTO_2897 ?AUTO_2899 ) ) ( not ( = ?AUTO_2902 ?AUTO_2899 ) ) ( not ( = ?AUTO_2901 ?AUTO_2899 ) ) ( not ( = ?AUTO_2900 ?AUTO_2899 ) ) ( not ( = ?AUTO_2904 ?AUTO_2899 ) ) ( not ( = ?AUTO_2905 ?AUTO_2899 ) ) ( not ( = ?AUTO_2903 ?AUTO_2899 ) ) ( ON ?AUTO_2899 ?AUTO_2903 ) ( not ( = ?AUTO_2896 ?AUTO_2898 ) ) ( not ( = ?AUTO_2897 ?AUTO_2898 ) ) ( not ( = ?AUTO_2902 ?AUTO_2898 ) ) ( not ( = ?AUTO_2901 ?AUTO_2898 ) ) ( not ( = ?AUTO_2900 ?AUTO_2898 ) ) ( not ( = ?AUTO_2904 ?AUTO_2898 ) ) ( not ( = ?AUTO_2905 ?AUTO_2898 ) ) ( not ( = ?AUTO_2903 ?AUTO_2898 ) ) ( not ( = ?AUTO_2899 ?AUTO_2898 ) ) ( ON ?AUTO_2898 ?AUTO_2899 ) ( CLEAR ?AUTO_2898 ) ( HOLDING ?AUTO_2900 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2900 )
      ( MAKE-ON ?AUTO_2896 ?AUTO_2897 )
      ( MAKE-ON-VERIFY ?AUTO_2896 ?AUTO_2897 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2906 - BLOCK
      ?AUTO_2907 - BLOCK
    )
    :vars
    (
      ?AUTO_2915 - BLOCK
      ?AUTO_2913 - BLOCK
      ?AUTO_2911 - BLOCK
      ?AUTO_2912 - BLOCK
      ?AUTO_2910 - BLOCK
      ?AUTO_2914 - BLOCK
      ?AUTO_2909 - BLOCK
      ?AUTO_2908 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2906 ?AUTO_2907 ) ) ( ON-TABLE ?AUTO_2906 ) ( not ( = ?AUTO_2906 ?AUTO_2915 ) ) ( not ( = ?AUTO_2906 ?AUTO_2913 ) ) ( not ( = ?AUTO_2907 ?AUTO_2915 ) ) ( not ( = ?AUTO_2907 ?AUTO_2913 ) ) ( not ( = ?AUTO_2915 ?AUTO_2913 ) ) ( not ( = ?AUTO_2906 ?AUTO_2911 ) ) ( not ( = ?AUTO_2907 ?AUTO_2911 ) ) ( not ( = ?AUTO_2915 ?AUTO_2911 ) ) ( not ( = ?AUTO_2913 ?AUTO_2911 ) ) ( ON ?AUTO_2913 ?AUTO_2907 ) ( not ( = ?AUTO_2906 ?AUTO_2912 ) ) ( not ( = ?AUTO_2907 ?AUTO_2912 ) ) ( not ( = ?AUTO_2915 ?AUTO_2912 ) ) ( not ( = ?AUTO_2913 ?AUTO_2912 ) ) ( not ( = ?AUTO_2911 ?AUTO_2912 ) ) ( ON ?AUTO_2912 ?AUTO_2913 ) ( ON ?AUTO_2915 ?AUTO_2912 ) ( CLEAR ?AUTO_2915 ) ( CLEAR ?AUTO_2910 ) ( not ( = ?AUTO_2906 ?AUTO_2914 ) ) ( not ( = ?AUTO_2906 ?AUTO_2910 ) ) ( not ( = ?AUTO_2907 ?AUTO_2914 ) ) ( not ( = ?AUTO_2907 ?AUTO_2910 ) ) ( not ( = ?AUTO_2915 ?AUTO_2914 ) ) ( not ( = ?AUTO_2915 ?AUTO_2910 ) ) ( not ( = ?AUTO_2913 ?AUTO_2914 ) ) ( not ( = ?AUTO_2913 ?AUTO_2910 ) ) ( not ( = ?AUTO_2911 ?AUTO_2914 ) ) ( not ( = ?AUTO_2911 ?AUTO_2910 ) ) ( not ( = ?AUTO_2912 ?AUTO_2914 ) ) ( not ( = ?AUTO_2912 ?AUTO_2910 ) ) ( not ( = ?AUTO_2914 ?AUTO_2910 ) ) ( ON ?AUTO_2914 ?AUTO_2906 ) ( not ( = ?AUTO_2906 ?AUTO_2909 ) ) ( not ( = ?AUTO_2907 ?AUTO_2909 ) ) ( not ( = ?AUTO_2915 ?AUTO_2909 ) ) ( not ( = ?AUTO_2913 ?AUTO_2909 ) ) ( not ( = ?AUTO_2911 ?AUTO_2909 ) ) ( not ( = ?AUTO_2912 ?AUTO_2909 ) ) ( not ( = ?AUTO_2910 ?AUTO_2909 ) ) ( not ( = ?AUTO_2914 ?AUTO_2909 ) ) ( ON ?AUTO_2909 ?AUTO_2914 ) ( not ( = ?AUTO_2906 ?AUTO_2908 ) ) ( not ( = ?AUTO_2907 ?AUTO_2908 ) ) ( not ( = ?AUTO_2915 ?AUTO_2908 ) ) ( not ( = ?AUTO_2913 ?AUTO_2908 ) ) ( not ( = ?AUTO_2911 ?AUTO_2908 ) ) ( not ( = ?AUTO_2912 ?AUTO_2908 ) ) ( not ( = ?AUTO_2910 ?AUTO_2908 ) ) ( not ( = ?AUTO_2914 ?AUTO_2908 ) ) ( not ( = ?AUTO_2909 ?AUTO_2908 ) ) ( ON ?AUTO_2908 ?AUTO_2909 ) ( ON ?AUTO_2911 ?AUTO_2908 ) ( CLEAR ?AUTO_2911 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2911 ?AUTO_2908 )
      ( MAKE-ON ?AUTO_2906 ?AUTO_2907 )
      ( MAKE-ON-VERIFY ?AUTO_2906 ?AUTO_2907 ) )
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
      ?AUTO_3000 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_2997 ?AUTO_2998 ) ) ( ON-TABLE ?AUTO_2997 ) ( CLEAR ?AUTO_2999 ) ( not ( = ?AUTO_2997 ?AUTO_2999 ) ) ( not ( = ?AUTO_2998 ?AUTO_2999 ) ) ( ON ?AUTO_2998 ?AUTO_2997 ) ( CLEAR ?AUTO_2998 ) ( HOLDING ?AUTO_3000 ) ( not ( = ?AUTO_2997 ?AUTO_3000 ) ) ( not ( = ?AUTO_2998 ?AUTO_3000 ) ) ( not ( = ?AUTO_2999 ?AUTO_3000 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3000 )
      ( MAKE-ON ?AUTO_2997 ?AUTO_2998 )
      ( MAKE-ON-VERIFY ?AUTO_2997 ?AUTO_2998 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3005 - BLOCK
      ?AUTO_3006 - BLOCK
    )
    :vars
    (
      ?AUTO_3007 - BLOCK
      ?AUTO_3008 - BLOCK
      ?AUTO_3009 - BLOCK
      ?AUTO_3010 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3005 ?AUTO_3006 ) ) ( ON-TABLE ?AUTO_3005 ) ( CLEAR ?AUTO_3007 ) ( not ( = ?AUTO_3005 ?AUTO_3007 ) ) ( not ( = ?AUTO_3006 ?AUTO_3007 ) ) ( ON ?AUTO_3006 ?AUTO_3005 ) ( not ( = ?AUTO_3005 ?AUTO_3008 ) ) ( not ( = ?AUTO_3006 ?AUTO_3008 ) ) ( not ( = ?AUTO_3007 ?AUTO_3008 ) ) ( ON ?AUTO_3008 ?AUTO_3006 ) ( CLEAR ?AUTO_3008 ) ( HOLDING ?AUTO_3009 ) ( CLEAR ?AUTO_3010 ) ( not ( = ?AUTO_3005 ?AUTO_3009 ) ) ( not ( = ?AUTO_3005 ?AUTO_3010 ) ) ( not ( = ?AUTO_3006 ?AUTO_3009 ) ) ( not ( = ?AUTO_3006 ?AUTO_3010 ) ) ( not ( = ?AUTO_3007 ?AUTO_3009 ) ) ( not ( = ?AUTO_3007 ?AUTO_3010 ) ) ( not ( = ?AUTO_3008 ?AUTO_3009 ) ) ( not ( = ?AUTO_3008 ?AUTO_3010 ) ) ( not ( = ?AUTO_3009 ?AUTO_3010 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3009 ?AUTO_3010 )
      ( MAKE-ON ?AUTO_3005 ?AUTO_3006 )
      ( MAKE-ON-VERIFY ?AUTO_3005 ?AUTO_3006 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3042 - BLOCK
      ?AUTO_3043 - BLOCK
    )
    :vars
    (
      ?AUTO_3044 - BLOCK
      ?AUTO_3045 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3042 ?AUTO_3043 ) ) ( CLEAR ?AUTO_3044 ) ( not ( = ?AUTO_3042 ?AUTO_3045 ) ) ( not ( = ?AUTO_3042 ?AUTO_3044 ) ) ( not ( = ?AUTO_3043 ?AUTO_3045 ) ) ( not ( = ?AUTO_3043 ?AUTO_3044 ) ) ( not ( = ?AUTO_3045 ?AUTO_3044 ) ) ( ON ?AUTO_3045 ?AUTO_3043 ) ( CLEAR ?AUTO_3045 ) ( HOLDING ?AUTO_3042 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3042 )
      ( MAKE-ON ?AUTO_3042 ?AUTO_3043 )
      ( MAKE-ON-VERIFY ?AUTO_3042 ?AUTO_3043 ) )
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
      ?AUTO_3061 - BLOCK
      ?AUTO_3062 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3058 ?AUTO_3059 ) ) ( CLEAR ?AUTO_3060 ) ( not ( = ?AUTO_3058 ?AUTO_3061 ) ) ( not ( = ?AUTO_3058 ?AUTO_3060 ) ) ( not ( = ?AUTO_3059 ?AUTO_3061 ) ) ( not ( = ?AUTO_3059 ?AUTO_3060 ) ) ( not ( = ?AUTO_3061 ?AUTO_3060 ) ) ( ON ?AUTO_3061 ?AUTO_3059 ) ( ON ?AUTO_3058 ?AUTO_3061 ) ( CLEAR ?AUTO_3058 ) ( HOLDING ?AUTO_3062 ) ( not ( = ?AUTO_3058 ?AUTO_3062 ) ) ( not ( = ?AUTO_3059 ?AUTO_3062 ) ) ( not ( = ?AUTO_3060 ?AUTO_3062 ) ) ( not ( = ?AUTO_3061 ?AUTO_3062 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3062 )
      ( MAKE-ON ?AUTO_3058 ?AUTO_3059 )
      ( MAKE-ON-VERIFY ?AUTO_3058 ?AUTO_3059 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3176 - BLOCK
      ?AUTO_3177 - BLOCK
    )
    :vars
    (
      ?AUTO_3180 - BLOCK
      ?AUTO_3179 - BLOCK
      ?AUTO_3178 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3176 ?AUTO_3177 ) ) ( ON ?AUTO_3176 ?AUTO_3180 ) ( not ( = ?AUTO_3176 ?AUTO_3180 ) ) ( not ( = ?AUTO_3177 ?AUTO_3180 ) ) ( not ( = ?AUTO_3176 ?AUTO_3179 ) ) ( not ( = ?AUTO_3177 ?AUTO_3179 ) ) ( not ( = ?AUTO_3180 ?AUTO_3179 ) ) ( ON ?AUTO_3179 ?AUTO_3176 ) ( not ( = ?AUTO_3176 ?AUTO_3178 ) ) ( not ( = ?AUTO_3177 ?AUTO_3178 ) ) ( not ( = ?AUTO_3180 ?AUTO_3178 ) ) ( not ( = ?AUTO_3179 ?AUTO_3178 ) ) ( ON ?AUTO_3178 ?AUTO_3179 ) ( CLEAR ?AUTO_3178 ) ( HOLDING ?AUTO_3177 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3177 )
      ( MAKE-ON ?AUTO_3176 ?AUTO_3177 )
      ( MAKE-ON-VERIFY ?AUTO_3176 ?AUTO_3177 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3181 - BLOCK
      ?AUTO_3182 - BLOCK
    )
    :vars
    (
      ?AUTO_3183 - BLOCK
      ?AUTO_3185 - BLOCK
      ?AUTO_3184 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3181 ?AUTO_3182 ) ) ( ON ?AUTO_3181 ?AUTO_3183 ) ( not ( = ?AUTO_3181 ?AUTO_3183 ) ) ( not ( = ?AUTO_3182 ?AUTO_3183 ) ) ( not ( = ?AUTO_3181 ?AUTO_3185 ) ) ( not ( = ?AUTO_3182 ?AUTO_3185 ) ) ( not ( = ?AUTO_3183 ?AUTO_3185 ) ) ( ON ?AUTO_3185 ?AUTO_3181 ) ( not ( = ?AUTO_3181 ?AUTO_3184 ) ) ( not ( = ?AUTO_3182 ?AUTO_3184 ) ) ( not ( = ?AUTO_3183 ?AUTO_3184 ) ) ( not ( = ?AUTO_3185 ?AUTO_3184 ) ) ( ON ?AUTO_3184 ?AUTO_3185 ) ( ON ?AUTO_3182 ?AUTO_3184 ) ( CLEAR ?AUTO_3182 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3182 ?AUTO_3184 )
      ( MAKE-ON ?AUTO_3181 ?AUTO_3182 )
      ( MAKE-ON-VERIFY ?AUTO_3181 ?AUTO_3182 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3186 - BLOCK
      ?AUTO_3187 - BLOCK
    )
    :vars
    (
      ?AUTO_3189 - BLOCK
      ?AUTO_3188 - BLOCK
      ?AUTO_3190 - BLOCK
      ?AUTO_3191 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3186 ?AUTO_3187 ) ) ( ON ?AUTO_3186 ?AUTO_3189 ) ( not ( = ?AUTO_3186 ?AUTO_3189 ) ) ( not ( = ?AUTO_3187 ?AUTO_3189 ) ) ( not ( = ?AUTO_3186 ?AUTO_3188 ) ) ( not ( = ?AUTO_3187 ?AUTO_3188 ) ) ( not ( = ?AUTO_3189 ?AUTO_3188 ) ) ( ON ?AUTO_3188 ?AUTO_3186 ) ( not ( = ?AUTO_3186 ?AUTO_3190 ) ) ( not ( = ?AUTO_3187 ?AUTO_3190 ) ) ( not ( = ?AUTO_3189 ?AUTO_3190 ) ) ( not ( = ?AUTO_3188 ?AUTO_3190 ) ) ( ON ?AUTO_3190 ?AUTO_3188 ) ( ON ?AUTO_3187 ?AUTO_3190 ) ( CLEAR ?AUTO_3187 ) ( HOLDING ?AUTO_3191 ) ( not ( = ?AUTO_3186 ?AUTO_3191 ) ) ( not ( = ?AUTO_3187 ?AUTO_3191 ) ) ( not ( = ?AUTO_3189 ?AUTO_3191 ) ) ( not ( = ?AUTO_3188 ?AUTO_3191 ) ) ( not ( = ?AUTO_3190 ?AUTO_3191 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3191 )
      ( MAKE-ON ?AUTO_3186 ?AUTO_3187 )
      ( MAKE-ON-VERIFY ?AUTO_3186 ?AUTO_3187 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4482 - BLOCK
      ?AUTO_4483 - BLOCK
    )
    :vars
    (
      ?AUTO_4485 - BLOCK
      ?AUTO_4486 - BLOCK
      ?AUTO_4484 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4483 ) ( not ( = ?AUTO_4482 ?AUTO_4483 ) ) ( ON-TABLE ?AUTO_4482 ) ( not ( = ?AUTO_4482 ?AUTO_4485 ) ) ( not ( = ?AUTO_4482 ?AUTO_4486 ) ) ( not ( = ?AUTO_4483 ?AUTO_4485 ) ) ( not ( = ?AUTO_4483 ?AUTO_4486 ) ) ( not ( = ?AUTO_4485 ?AUTO_4486 ) ) ( ON ?AUTO_4485 ?AUTO_4482 ) ( not ( = ?AUTO_4482 ?AUTO_4484 ) ) ( not ( = ?AUTO_4483 ?AUTO_4484 ) ) ( not ( = ?AUTO_4485 ?AUTO_4484 ) ) ( not ( = ?AUTO_4486 ?AUTO_4484 ) ) ( ON ?AUTO_4486 ?AUTO_4485 ) ( CLEAR ?AUTO_4486 ) ( HOLDING ?AUTO_4484 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4484 )
      ( MAKE-ON ?AUTO_4482 ?AUTO_4483 )
      ( MAKE-ON-VERIFY ?AUTO_4482 ?AUTO_4483 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3248 - BLOCK
      ?AUTO_3249 - BLOCK
    )
    :vars
    (
      ?AUTO_3250 - BLOCK
      ?AUTO_3254 - BLOCK
      ?AUTO_3253 - BLOCK
      ?AUTO_3252 - BLOCK
      ?AUTO_3251 - BLOCK
      ?AUTO_3255 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3249 ) ( not ( = ?AUTO_3248 ?AUTO_3249 ) ) ( ON-TABLE ?AUTO_3248 ) ( not ( = ?AUTO_3248 ?AUTO_3250 ) ) ( not ( = ?AUTO_3248 ?AUTO_3254 ) ) ( not ( = ?AUTO_3249 ?AUTO_3250 ) ) ( not ( = ?AUTO_3249 ?AUTO_3254 ) ) ( not ( = ?AUTO_3250 ?AUTO_3254 ) ) ( ON ?AUTO_3250 ?AUTO_3248 ) ( CLEAR ?AUTO_3253 ) ( not ( = ?AUTO_3248 ?AUTO_3253 ) ) ( not ( = ?AUTO_3249 ?AUTO_3253 ) ) ( not ( = ?AUTO_3250 ?AUTO_3253 ) ) ( not ( = ?AUTO_3254 ?AUTO_3253 ) ) ( ON ?AUTO_3254 ?AUTO_3250 ) ( not ( = ?AUTO_3248 ?AUTO_3252 ) ) ( not ( = ?AUTO_3249 ?AUTO_3252 ) ) ( not ( = ?AUTO_3250 ?AUTO_3252 ) ) ( not ( = ?AUTO_3254 ?AUTO_3252 ) ) ( not ( = ?AUTO_3253 ?AUTO_3252 ) ) ( ON ?AUTO_3252 ?AUTO_3254 ) ( not ( = ?AUTO_3248 ?AUTO_3251 ) ) ( not ( = ?AUTO_3249 ?AUTO_3251 ) ) ( not ( = ?AUTO_3250 ?AUTO_3251 ) ) ( not ( = ?AUTO_3254 ?AUTO_3251 ) ) ( not ( = ?AUTO_3253 ?AUTO_3251 ) ) ( not ( = ?AUTO_3252 ?AUTO_3251 ) ) ( ON ?AUTO_3251 ?AUTO_3252 ) ( CLEAR ?AUTO_3251 ) ( HOLDING ?AUTO_3255 ) ( not ( = ?AUTO_3248 ?AUTO_3255 ) ) ( not ( = ?AUTO_3249 ?AUTO_3255 ) ) ( not ( = ?AUTO_3250 ?AUTO_3255 ) ) ( not ( = ?AUTO_3254 ?AUTO_3255 ) ) ( not ( = ?AUTO_3253 ?AUTO_3255 ) ) ( not ( = ?AUTO_3252 ?AUTO_3255 ) ) ( not ( = ?AUTO_3251 ?AUTO_3255 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3255 )
      ( MAKE-ON ?AUTO_3248 ?AUTO_3249 )
      ( MAKE-ON-VERIFY ?AUTO_3248 ?AUTO_3249 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4251 - BLOCK
      ?AUTO_4252 - BLOCK
    )
    :vars
    (
      ?AUTO_4253 - BLOCK
      ?AUTO_4255 - BLOCK
      ?AUTO_4256 - BLOCK
      ?AUTO_4257 - BLOCK
      ?AUTO_4258 - BLOCK
      ?AUTO_4254 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4251 ?AUTO_4252 ) ) ( ON ?AUTO_4251 ?AUTO_4253 ) ( CLEAR ?AUTO_4251 ) ( not ( = ?AUTO_4251 ?AUTO_4253 ) ) ( not ( = ?AUTO_4252 ?AUTO_4253 ) ) ( not ( = ?AUTO_4251 ?AUTO_4255 ) ) ( not ( = ?AUTO_4252 ?AUTO_4255 ) ) ( not ( = ?AUTO_4253 ?AUTO_4255 ) ) ( ON ?AUTO_4255 ?AUTO_4252 ) ( not ( = ?AUTO_4251 ?AUTO_4256 ) ) ( not ( = ?AUTO_4252 ?AUTO_4256 ) ) ( not ( = ?AUTO_4253 ?AUTO_4256 ) ) ( not ( = ?AUTO_4255 ?AUTO_4256 ) ) ( ON ?AUTO_4256 ?AUTO_4255 ) ( not ( = ?AUTO_4251 ?AUTO_4257 ) ) ( not ( = ?AUTO_4251 ?AUTO_4258 ) ) ( not ( = ?AUTO_4252 ?AUTO_4257 ) ) ( not ( = ?AUTO_4252 ?AUTO_4258 ) ) ( not ( = ?AUTO_4253 ?AUTO_4257 ) ) ( not ( = ?AUTO_4253 ?AUTO_4258 ) ) ( not ( = ?AUTO_4255 ?AUTO_4257 ) ) ( not ( = ?AUTO_4255 ?AUTO_4258 ) ) ( not ( = ?AUTO_4256 ?AUTO_4257 ) ) ( not ( = ?AUTO_4256 ?AUTO_4258 ) ) ( not ( = ?AUTO_4257 ?AUTO_4258 ) ) ( ON ?AUTO_4257 ?AUTO_4256 ) ( not ( = ?AUTO_4251 ?AUTO_4254 ) ) ( not ( = ?AUTO_4252 ?AUTO_4254 ) ) ( not ( = ?AUTO_4253 ?AUTO_4254 ) ) ( not ( = ?AUTO_4255 ?AUTO_4254 ) ) ( not ( = ?AUTO_4256 ?AUTO_4254 ) ) ( not ( = ?AUTO_4258 ?AUTO_4254 ) ) ( not ( = ?AUTO_4257 ?AUTO_4254 ) ) ( ON ?AUTO_4254 ?AUTO_4257 ) ( CLEAR ?AUTO_4254 ) ( HOLDING ?AUTO_4258 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4258 )
      ( MAKE-ON ?AUTO_4251 ?AUTO_4252 )
      ( MAKE-ON-VERIFY ?AUTO_4251 ?AUTO_4252 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4259 - BLOCK
      ?AUTO_4260 - BLOCK
    )
    :vars
    (
      ?AUTO_4265 - BLOCK
      ?AUTO_4261 - BLOCK
      ?AUTO_4266 - BLOCK
      ?AUTO_4262 - BLOCK
      ?AUTO_4264 - BLOCK
      ?AUTO_4263 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4259 ?AUTO_4260 ) ) ( ON ?AUTO_4259 ?AUTO_4265 ) ( not ( = ?AUTO_4259 ?AUTO_4265 ) ) ( not ( = ?AUTO_4260 ?AUTO_4265 ) ) ( not ( = ?AUTO_4259 ?AUTO_4261 ) ) ( not ( = ?AUTO_4260 ?AUTO_4261 ) ) ( not ( = ?AUTO_4265 ?AUTO_4261 ) ) ( ON ?AUTO_4261 ?AUTO_4260 ) ( not ( = ?AUTO_4259 ?AUTO_4266 ) ) ( not ( = ?AUTO_4260 ?AUTO_4266 ) ) ( not ( = ?AUTO_4265 ?AUTO_4266 ) ) ( not ( = ?AUTO_4261 ?AUTO_4266 ) ) ( ON ?AUTO_4266 ?AUTO_4261 ) ( not ( = ?AUTO_4259 ?AUTO_4262 ) ) ( not ( = ?AUTO_4259 ?AUTO_4264 ) ) ( not ( = ?AUTO_4260 ?AUTO_4262 ) ) ( not ( = ?AUTO_4260 ?AUTO_4264 ) ) ( not ( = ?AUTO_4265 ?AUTO_4262 ) ) ( not ( = ?AUTO_4265 ?AUTO_4264 ) ) ( not ( = ?AUTO_4261 ?AUTO_4262 ) ) ( not ( = ?AUTO_4261 ?AUTO_4264 ) ) ( not ( = ?AUTO_4266 ?AUTO_4262 ) ) ( not ( = ?AUTO_4266 ?AUTO_4264 ) ) ( not ( = ?AUTO_4262 ?AUTO_4264 ) ) ( ON ?AUTO_4262 ?AUTO_4266 ) ( not ( = ?AUTO_4259 ?AUTO_4263 ) ) ( not ( = ?AUTO_4260 ?AUTO_4263 ) ) ( not ( = ?AUTO_4265 ?AUTO_4263 ) ) ( not ( = ?AUTO_4261 ?AUTO_4263 ) ) ( not ( = ?AUTO_4266 ?AUTO_4263 ) ) ( not ( = ?AUTO_4264 ?AUTO_4263 ) ) ( not ( = ?AUTO_4262 ?AUTO_4263 ) ) ( ON ?AUTO_4263 ?AUTO_4262 ) ( CLEAR ?AUTO_4263 ) ( ON ?AUTO_4264 ?AUTO_4259 ) ( CLEAR ?AUTO_4264 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4264 ?AUTO_4259 )
      ( MAKE-ON ?AUTO_4259 ?AUTO_4260 )
      ( MAKE-ON-VERIFY ?AUTO_4259 ?AUTO_4260 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3399 - BLOCK
      ?AUTO_3400 - BLOCK
    )
    :vars
    (
      ?AUTO_3404 - BLOCK
      ?AUTO_3402 - BLOCK
      ?AUTO_3401 - BLOCK
      ?AUTO_3403 - BLOCK
      ?AUTO_3405 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3399 ?AUTO_3400 ) ) ( ON-TABLE ?AUTO_3399 ) ( not ( = ?AUTO_3399 ?AUTO_3404 ) ) ( not ( = ?AUTO_3399 ?AUTO_3402 ) ) ( not ( = ?AUTO_3400 ?AUTO_3404 ) ) ( not ( = ?AUTO_3400 ?AUTO_3402 ) ) ( not ( = ?AUTO_3404 ?AUTO_3402 ) ) ( ON ?AUTO_3404 ?AUTO_3399 ) ( CLEAR ?AUTO_3404 ) ( CLEAR ?AUTO_3401 ) ( not ( = ?AUTO_3399 ?AUTO_3401 ) ) ( not ( = ?AUTO_3400 ?AUTO_3401 ) ) ( not ( = ?AUTO_3404 ?AUTO_3401 ) ) ( not ( = ?AUTO_3402 ?AUTO_3401 ) ) ( ON ?AUTO_3402 ?AUTO_3400 ) ( not ( = ?AUTO_3399 ?AUTO_3403 ) ) ( not ( = ?AUTO_3400 ?AUTO_3403 ) ) ( not ( = ?AUTO_3404 ?AUTO_3403 ) ) ( not ( = ?AUTO_3402 ?AUTO_3403 ) ) ( not ( = ?AUTO_3401 ?AUTO_3403 ) ) ( ON ?AUTO_3403 ?AUTO_3402 ) ( CLEAR ?AUTO_3403 ) ( HOLDING ?AUTO_3405 ) ( not ( = ?AUTO_3399 ?AUTO_3405 ) ) ( not ( = ?AUTO_3400 ?AUTO_3405 ) ) ( not ( = ?AUTO_3404 ?AUTO_3405 ) ) ( not ( = ?AUTO_3402 ?AUTO_3405 ) ) ( not ( = ?AUTO_3401 ?AUTO_3405 ) ) ( not ( = ?AUTO_3403 ?AUTO_3405 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3405 )
      ( MAKE-ON ?AUTO_3399 ?AUTO_3400 )
      ( MAKE-ON-VERIFY ?AUTO_3399 ?AUTO_3400 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3406 - BLOCK
      ?AUTO_3407 - BLOCK
    )
    :vars
    (
      ?AUTO_3409 - BLOCK
      ?AUTO_3410 - BLOCK
      ?AUTO_3411 - BLOCK
      ?AUTO_3412 - BLOCK
      ?AUTO_3408 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3406 ?AUTO_3407 ) ) ( ON-TABLE ?AUTO_3406 ) ( not ( = ?AUTO_3406 ?AUTO_3409 ) ) ( not ( = ?AUTO_3406 ?AUTO_3410 ) ) ( not ( = ?AUTO_3407 ?AUTO_3409 ) ) ( not ( = ?AUTO_3407 ?AUTO_3410 ) ) ( not ( = ?AUTO_3409 ?AUTO_3410 ) ) ( ON ?AUTO_3409 ?AUTO_3406 ) ( CLEAR ?AUTO_3411 ) ( not ( = ?AUTO_3406 ?AUTO_3411 ) ) ( not ( = ?AUTO_3407 ?AUTO_3411 ) ) ( not ( = ?AUTO_3409 ?AUTO_3411 ) ) ( not ( = ?AUTO_3410 ?AUTO_3411 ) ) ( ON ?AUTO_3410 ?AUTO_3407 ) ( not ( = ?AUTO_3406 ?AUTO_3412 ) ) ( not ( = ?AUTO_3407 ?AUTO_3412 ) ) ( not ( = ?AUTO_3409 ?AUTO_3412 ) ) ( not ( = ?AUTO_3410 ?AUTO_3412 ) ) ( not ( = ?AUTO_3411 ?AUTO_3412 ) ) ( ON ?AUTO_3412 ?AUTO_3410 ) ( CLEAR ?AUTO_3412 ) ( not ( = ?AUTO_3406 ?AUTO_3408 ) ) ( not ( = ?AUTO_3407 ?AUTO_3408 ) ) ( not ( = ?AUTO_3409 ?AUTO_3408 ) ) ( not ( = ?AUTO_3410 ?AUTO_3408 ) ) ( not ( = ?AUTO_3411 ?AUTO_3408 ) ) ( not ( = ?AUTO_3412 ?AUTO_3408 ) ) ( ON ?AUTO_3408 ?AUTO_3409 ) ( CLEAR ?AUTO_3408 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3408 ?AUTO_3409 )
      ( MAKE-ON ?AUTO_3406 ?AUTO_3407 )
      ( MAKE-ON-VERIFY ?AUTO_3406 ?AUTO_3407 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3568 - BLOCK
      ?AUTO_3569 - BLOCK
    )
    :vars
    (
      ?AUTO_3573 - BLOCK
      ?AUTO_3572 - BLOCK
      ?AUTO_3570 - BLOCK
      ?AUTO_3571 - BLOCK
      ?AUTO_3574 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3568 ?AUTO_3569 ) ) ( ON ?AUTO_3568 ?AUTO_3573 ) ( not ( = ?AUTO_3568 ?AUTO_3573 ) ) ( not ( = ?AUTO_3569 ?AUTO_3573 ) ) ( not ( = ?AUTO_3568 ?AUTO_3572 ) ) ( not ( = ?AUTO_3569 ?AUTO_3572 ) ) ( not ( = ?AUTO_3573 ?AUTO_3572 ) ) ( ON ?AUTO_3572 ?AUTO_3568 ) ( CLEAR ?AUTO_3572 ) ( not ( = ?AUTO_3568 ?AUTO_3570 ) ) ( not ( = ?AUTO_3568 ?AUTO_3571 ) ) ( not ( = ?AUTO_3569 ?AUTO_3570 ) ) ( not ( = ?AUTO_3569 ?AUTO_3571 ) ) ( not ( = ?AUTO_3573 ?AUTO_3570 ) ) ( not ( = ?AUTO_3573 ?AUTO_3571 ) ) ( not ( = ?AUTO_3572 ?AUTO_3570 ) ) ( not ( = ?AUTO_3572 ?AUTO_3571 ) ) ( not ( = ?AUTO_3570 ?AUTO_3571 ) ) ( ON ?AUTO_3570 ?AUTO_3569 ) ( CLEAR ?AUTO_3570 ) ( HOLDING ?AUTO_3571 ) ( CLEAR ?AUTO_3574 ) ( not ( = ?AUTO_3568 ?AUTO_3574 ) ) ( not ( = ?AUTO_3569 ?AUTO_3574 ) ) ( not ( = ?AUTO_3573 ?AUTO_3574 ) ) ( not ( = ?AUTO_3572 ?AUTO_3574 ) ) ( not ( = ?AUTO_3570 ?AUTO_3574 ) ) ( not ( = ?AUTO_3571 ?AUTO_3574 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_3571 ?AUTO_3574 )
      ( MAKE-ON ?AUTO_3568 ?AUTO_3569 )
      ( MAKE-ON-VERIFY ?AUTO_3568 ?AUTO_3569 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3582 - BLOCK
      ?AUTO_3583 - BLOCK
    )
    :vars
    (
      ?AUTO_3584 - BLOCK
      ?AUTO_3587 - BLOCK
      ?AUTO_3588 - BLOCK
      ?AUTO_3586 - BLOCK
      ?AUTO_3585 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3582 ?AUTO_3583 ) ) ( ON ?AUTO_3582 ?AUTO_3584 ) ( not ( = ?AUTO_3582 ?AUTO_3584 ) ) ( not ( = ?AUTO_3583 ?AUTO_3584 ) ) ( not ( = ?AUTO_3582 ?AUTO_3587 ) ) ( not ( = ?AUTO_3583 ?AUTO_3587 ) ) ( not ( = ?AUTO_3584 ?AUTO_3587 ) ) ( ON ?AUTO_3587 ?AUTO_3582 ) ( not ( = ?AUTO_3582 ?AUTO_3588 ) ) ( not ( = ?AUTO_3582 ?AUTO_3586 ) ) ( not ( = ?AUTO_3583 ?AUTO_3588 ) ) ( not ( = ?AUTO_3583 ?AUTO_3586 ) ) ( not ( = ?AUTO_3584 ?AUTO_3588 ) ) ( not ( = ?AUTO_3584 ?AUTO_3586 ) ) ( not ( = ?AUTO_3587 ?AUTO_3588 ) ) ( not ( = ?AUTO_3587 ?AUTO_3586 ) ) ( not ( = ?AUTO_3588 ?AUTO_3586 ) ) ( ON ?AUTO_3588 ?AUTO_3583 ) ( CLEAR ?AUTO_3588 ) ( not ( = ?AUTO_3582 ?AUTO_3585 ) ) ( not ( = ?AUTO_3583 ?AUTO_3585 ) ) ( not ( = ?AUTO_3584 ?AUTO_3585 ) ) ( not ( = ?AUTO_3587 ?AUTO_3585 ) ) ( not ( = ?AUTO_3588 ?AUTO_3585 ) ) ( not ( = ?AUTO_3586 ?AUTO_3585 ) ) ( ON ?AUTO_3586 ?AUTO_3587 ) ( CLEAR ?AUTO_3586 ) ( HOLDING ?AUTO_3585 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3585 )
      ( MAKE-ON ?AUTO_3582 ?AUTO_3583 )
      ( MAKE-ON-VERIFY ?AUTO_3582 ?AUTO_3583 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3589 - BLOCK
      ?AUTO_3590 - BLOCK
    )
    :vars
    (
      ?AUTO_3595 - BLOCK
      ?AUTO_3593 - BLOCK
      ?AUTO_3591 - BLOCK
      ?AUTO_3592 - BLOCK
      ?AUTO_3594 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3589 ?AUTO_3590 ) ) ( ON ?AUTO_3589 ?AUTO_3595 ) ( not ( = ?AUTO_3589 ?AUTO_3595 ) ) ( not ( = ?AUTO_3590 ?AUTO_3595 ) ) ( not ( = ?AUTO_3589 ?AUTO_3593 ) ) ( not ( = ?AUTO_3590 ?AUTO_3593 ) ) ( not ( = ?AUTO_3595 ?AUTO_3593 ) ) ( ON ?AUTO_3593 ?AUTO_3589 ) ( not ( = ?AUTO_3589 ?AUTO_3591 ) ) ( not ( = ?AUTO_3589 ?AUTO_3592 ) ) ( not ( = ?AUTO_3590 ?AUTO_3591 ) ) ( not ( = ?AUTO_3590 ?AUTO_3592 ) ) ( not ( = ?AUTO_3595 ?AUTO_3591 ) ) ( not ( = ?AUTO_3595 ?AUTO_3592 ) ) ( not ( = ?AUTO_3593 ?AUTO_3591 ) ) ( not ( = ?AUTO_3593 ?AUTO_3592 ) ) ( not ( = ?AUTO_3591 ?AUTO_3592 ) ) ( ON ?AUTO_3591 ?AUTO_3590 ) ( CLEAR ?AUTO_3591 ) ( not ( = ?AUTO_3589 ?AUTO_3594 ) ) ( not ( = ?AUTO_3590 ?AUTO_3594 ) ) ( not ( = ?AUTO_3595 ?AUTO_3594 ) ) ( not ( = ?AUTO_3593 ?AUTO_3594 ) ) ( not ( = ?AUTO_3591 ?AUTO_3594 ) ) ( not ( = ?AUTO_3592 ?AUTO_3594 ) ) ( ON ?AUTO_3592 ?AUTO_3593 ) ( ON ?AUTO_3594 ?AUTO_3592 ) ( CLEAR ?AUTO_3594 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3594 ?AUTO_3592 )
      ( MAKE-ON ?AUTO_3589 ?AUTO_3590 )
      ( MAKE-ON-VERIFY ?AUTO_3589 ?AUTO_3590 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3693 - BLOCK
      ?AUTO_3694 - BLOCK
    )
    :vars
    (
      ?AUTO_3696 - BLOCK
      ?AUTO_3695 - BLOCK
      ?AUTO_3698 - BLOCK
      ?AUTO_3697 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3693 ?AUTO_3694 ) ) ( not ( = ?AUTO_3693 ?AUTO_3696 ) ) ( not ( = ?AUTO_3693 ?AUTO_3695 ) ) ( not ( = ?AUTO_3694 ?AUTO_3696 ) ) ( not ( = ?AUTO_3694 ?AUTO_3695 ) ) ( not ( = ?AUTO_3696 ?AUTO_3695 ) ) ( ON ?AUTO_3696 ?AUTO_3694 ) ( ON ?AUTO_3693 ?AUTO_3696 ) ( CLEAR ?AUTO_3698 ) ( not ( = ?AUTO_3693 ?AUTO_3697 ) ) ( not ( = ?AUTO_3693 ?AUTO_3698 ) ) ( not ( = ?AUTO_3694 ?AUTO_3697 ) ) ( not ( = ?AUTO_3694 ?AUTO_3698 ) ) ( not ( = ?AUTO_3695 ?AUTO_3697 ) ) ( not ( = ?AUTO_3695 ?AUTO_3698 ) ) ( not ( = ?AUTO_3696 ?AUTO_3697 ) ) ( not ( = ?AUTO_3696 ?AUTO_3698 ) ) ( not ( = ?AUTO_3697 ?AUTO_3698 ) ) ( ON ?AUTO_3697 ?AUTO_3693 ) ( CLEAR ?AUTO_3697 ) ( HOLDING ?AUTO_3695 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3695 )
      ( MAKE-ON ?AUTO_3693 ?AUTO_3694 )
      ( MAKE-ON-VERIFY ?AUTO_3693 ?AUTO_3694 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3699 - BLOCK
      ?AUTO_3700 - BLOCK
    )
    :vars
    (
      ?AUTO_3703 - BLOCK
      ?AUTO_3704 - BLOCK
      ?AUTO_3701 - BLOCK
      ?AUTO_3702 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3699 ?AUTO_3700 ) ) ( not ( = ?AUTO_3699 ?AUTO_3703 ) ) ( not ( = ?AUTO_3699 ?AUTO_3704 ) ) ( not ( = ?AUTO_3700 ?AUTO_3703 ) ) ( not ( = ?AUTO_3700 ?AUTO_3704 ) ) ( not ( = ?AUTO_3703 ?AUTO_3704 ) ) ( ON ?AUTO_3703 ?AUTO_3700 ) ( ON ?AUTO_3699 ?AUTO_3703 ) ( CLEAR ?AUTO_3701 ) ( not ( = ?AUTO_3699 ?AUTO_3702 ) ) ( not ( = ?AUTO_3699 ?AUTO_3701 ) ) ( not ( = ?AUTO_3700 ?AUTO_3702 ) ) ( not ( = ?AUTO_3700 ?AUTO_3701 ) ) ( not ( = ?AUTO_3704 ?AUTO_3702 ) ) ( not ( = ?AUTO_3704 ?AUTO_3701 ) ) ( not ( = ?AUTO_3703 ?AUTO_3702 ) ) ( not ( = ?AUTO_3703 ?AUTO_3701 ) ) ( not ( = ?AUTO_3702 ?AUTO_3701 ) ) ( ON ?AUTO_3702 ?AUTO_3699 ) ( ON ?AUTO_3704 ?AUTO_3702 ) ( CLEAR ?AUTO_3704 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3704 ?AUTO_3702 )
      ( MAKE-ON ?AUTO_3699 ?AUTO_3700 )
      ( MAKE-ON-VERIFY ?AUTO_3699 ?AUTO_3700 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3942 - BLOCK
      ?AUTO_3943 - BLOCK
    )
    :vars
    (
      ?AUTO_3944 - BLOCK
      ?AUTO_3946 - BLOCK
      ?AUTO_3947 - BLOCK
      ?AUTO_3945 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3942 ?AUTO_3943 ) ) ( ON-TABLE ?AUTO_3942 ) ( not ( = ?AUTO_3942 ?AUTO_3944 ) ) ( not ( = ?AUTO_3942 ?AUTO_3946 ) ) ( not ( = ?AUTO_3943 ?AUTO_3944 ) ) ( not ( = ?AUTO_3943 ?AUTO_3946 ) ) ( not ( = ?AUTO_3944 ?AUTO_3946 ) ) ( ON ?AUTO_3944 ?AUTO_3942 ) ( ON ?AUTO_3946 ?AUTO_3944 ) ( CLEAR ?AUTO_3947 ) ( not ( = ?AUTO_3942 ?AUTO_3945 ) ) ( not ( = ?AUTO_3942 ?AUTO_3947 ) ) ( not ( = ?AUTO_3943 ?AUTO_3945 ) ) ( not ( = ?AUTO_3943 ?AUTO_3947 ) ) ( not ( = ?AUTO_3944 ?AUTO_3945 ) ) ( not ( = ?AUTO_3944 ?AUTO_3947 ) ) ( not ( = ?AUTO_3946 ?AUTO_3945 ) ) ( not ( = ?AUTO_3946 ?AUTO_3947 ) ) ( not ( = ?AUTO_3945 ?AUTO_3947 ) ) ( ON ?AUTO_3945 ?AUTO_3946 ) ( CLEAR ?AUTO_3945 ) ( HOLDING ?AUTO_3943 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3943 )
      ( MAKE-ON ?AUTO_3942 ?AUTO_3943 )
      ( MAKE-ON-VERIFY ?AUTO_3942 ?AUTO_3943 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3948 - BLOCK
      ?AUTO_3949 - BLOCK
    )
    :vars
    (
      ?AUTO_3950 - BLOCK
      ?AUTO_3952 - BLOCK
      ?AUTO_3951 - BLOCK
      ?AUTO_3953 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_3948 ?AUTO_3949 ) ) ( ON-TABLE ?AUTO_3948 ) ( not ( = ?AUTO_3948 ?AUTO_3950 ) ) ( not ( = ?AUTO_3948 ?AUTO_3952 ) ) ( not ( = ?AUTO_3949 ?AUTO_3950 ) ) ( not ( = ?AUTO_3949 ?AUTO_3952 ) ) ( not ( = ?AUTO_3950 ?AUTO_3952 ) ) ( ON ?AUTO_3950 ?AUTO_3948 ) ( ON ?AUTO_3952 ?AUTO_3950 ) ( not ( = ?AUTO_3948 ?AUTO_3951 ) ) ( not ( = ?AUTO_3948 ?AUTO_3953 ) ) ( not ( = ?AUTO_3949 ?AUTO_3951 ) ) ( not ( = ?AUTO_3949 ?AUTO_3953 ) ) ( not ( = ?AUTO_3950 ?AUTO_3951 ) ) ( not ( = ?AUTO_3950 ?AUTO_3953 ) ) ( not ( = ?AUTO_3952 ?AUTO_3951 ) ) ( not ( = ?AUTO_3952 ?AUTO_3953 ) ) ( not ( = ?AUTO_3951 ?AUTO_3953 ) ) ( ON ?AUTO_3951 ?AUTO_3952 ) ( CLEAR ?AUTO_3951 ) ( ON ?AUTO_3949 ?AUTO_3953 ) ( CLEAR ?AUTO_3949 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3949 ?AUTO_3953 )
      ( MAKE-ON ?AUTO_3948 ?AUTO_3949 )
      ( MAKE-ON-VERIFY ?AUTO_3948 ?AUTO_3949 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4011 - BLOCK
      ?AUTO_4012 - BLOCK
    )
    :vars
    (
      ?AUTO_4015 - BLOCK
      ?AUTO_4014 - BLOCK
      ?AUTO_4013 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4011 ?AUTO_4012 ) ) ( ON ?AUTO_4011 ?AUTO_4015 ) ( not ( = ?AUTO_4011 ?AUTO_4015 ) ) ( not ( = ?AUTO_4012 ?AUTO_4015 ) ) ( not ( = ?AUTO_4011 ?AUTO_4014 ) ) ( not ( = ?AUTO_4012 ?AUTO_4014 ) ) ( not ( = ?AUTO_4015 ?AUTO_4014 ) ) ( ON ?AUTO_4014 ?AUTO_4012 ) ( CLEAR ?AUTO_4014 ) ( not ( = ?AUTO_4011 ?AUTO_4013 ) ) ( not ( = ?AUTO_4012 ?AUTO_4013 ) ) ( not ( = ?AUTO_4015 ?AUTO_4013 ) ) ( not ( = ?AUTO_4014 ?AUTO_4013 ) ) ( ON ?AUTO_4013 ?AUTO_4011 ) ( CLEAR ?AUTO_4013 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4013 ?AUTO_4011 )
      ( MAKE-ON ?AUTO_4011 ?AUTO_4012 )
      ( MAKE-ON-VERIFY ?AUTO_4011 ?AUTO_4012 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4064 - BLOCK
      ?AUTO_4065 - BLOCK
    )
    :vars
    (
      ?AUTO_4068 - BLOCK
      ?AUTO_4067 - BLOCK
      ?AUTO_4070 - BLOCK
      ?AUTO_4069 - BLOCK
      ?AUTO_4066 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4064 ?AUTO_4065 ) ) ( ON ?AUTO_4064 ?AUTO_4068 ) ( not ( = ?AUTO_4064 ?AUTO_4068 ) ) ( not ( = ?AUTO_4065 ?AUTO_4068 ) ) ( not ( = ?AUTO_4064 ?AUTO_4067 ) ) ( not ( = ?AUTO_4064 ?AUTO_4070 ) ) ( not ( = ?AUTO_4065 ?AUTO_4067 ) ) ( not ( = ?AUTO_4065 ?AUTO_4070 ) ) ( not ( = ?AUTO_4068 ?AUTO_4067 ) ) ( not ( = ?AUTO_4068 ?AUTO_4070 ) ) ( not ( = ?AUTO_4067 ?AUTO_4070 ) ) ( ON ?AUTO_4067 ?AUTO_4065 ) ( not ( = ?AUTO_4064 ?AUTO_4069 ) ) ( not ( = ?AUTO_4065 ?AUTO_4069 ) ) ( not ( = ?AUTO_4068 ?AUTO_4069 ) ) ( not ( = ?AUTO_4067 ?AUTO_4069 ) ) ( not ( = ?AUTO_4070 ?AUTO_4069 ) ) ( ON ?AUTO_4070 ?AUTO_4064 ) ( ON ?AUTO_4069 ?AUTO_4070 ) ( CLEAR ?AUTO_4069 ) ( not ( = ?AUTO_4064 ?AUTO_4066 ) ) ( not ( = ?AUTO_4065 ?AUTO_4066 ) ) ( not ( = ?AUTO_4068 ?AUTO_4066 ) ) ( not ( = ?AUTO_4067 ?AUTO_4066 ) ) ( not ( = ?AUTO_4070 ?AUTO_4066 ) ) ( not ( = ?AUTO_4069 ?AUTO_4066 ) ) ( ON ?AUTO_4066 ?AUTO_4067 ) ( CLEAR ?AUTO_4066 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4066 ?AUTO_4067 )
      ( MAKE-ON ?AUTO_4064 ?AUTO_4065 )
      ( MAKE-ON-VERIFY ?AUTO_4064 ?AUTO_4065 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4184 - BLOCK
    )
    :vars
    (
      ?AUTO_4187 - BLOCK
      ?AUTO_4186 - BLOCK
      ?AUTO_4185 - BLOCK
      ?AUTO_4189 - BLOCK
      ?AUTO_4188 - BLOCK
      ?AUTO_4190 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4184 ?AUTO_4187 ) ( not ( = ?AUTO_4184 ?AUTO_4187 ) ) ( not ( = ?AUTO_4184 ?AUTO_4186 ) ) ( not ( = ?AUTO_4187 ?AUTO_4186 ) ) ( ON ?AUTO_4186 ?AUTO_4184 ) ( CLEAR ?AUTO_4185 ) ( not ( = ?AUTO_4184 ?AUTO_4189 ) ) ( not ( = ?AUTO_4184 ?AUTO_4185 ) ) ( not ( = ?AUTO_4187 ?AUTO_4189 ) ) ( not ( = ?AUTO_4187 ?AUTO_4185 ) ) ( not ( = ?AUTO_4186 ?AUTO_4189 ) ) ( not ( = ?AUTO_4186 ?AUTO_4185 ) ) ( not ( = ?AUTO_4189 ?AUTO_4185 ) ) ( ON ?AUTO_4189 ?AUTO_4186 ) ( not ( = ?AUTO_4184 ?AUTO_4188 ) ) ( not ( = ?AUTO_4187 ?AUTO_4188 ) ) ( not ( = ?AUTO_4186 ?AUTO_4188 ) ) ( not ( = ?AUTO_4185 ?AUTO_4188 ) ) ( not ( = ?AUTO_4189 ?AUTO_4188 ) ) ( ON ?AUTO_4188 ?AUTO_4189 ) ( CLEAR ?AUTO_4188 ) ( HOLDING ?AUTO_4190 ) ( not ( = ?AUTO_4184 ?AUTO_4190 ) ) ( not ( = ?AUTO_4187 ?AUTO_4190 ) ) ( not ( = ?AUTO_4186 ?AUTO_4190 ) ) ( not ( = ?AUTO_4185 ?AUTO_4190 ) ) ( not ( = ?AUTO_4189 ?AUTO_4190 ) ) ( not ( = ?AUTO_4188 ?AUTO_4190 ) ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4190 )
      ( MAKE-ON-TABLE ?AUTO_4184 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4184 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4386 - BLOCK
      ?AUTO_4387 - BLOCK
    )
    :vars
    (
      ?AUTO_4390 - BLOCK
      ?AUTO_4389 - BLOCK
      ?AUTO_4388 - BLOCK
      ?AUTO_4393 - BLOCK
      ?AUTO_4392 - BLOCK
      ?AUTO_4391 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4386 ?AUTO_4387 ) ) ( ON ?AUTO_4386 ?AUTO_4390 ) ( not ( = ?AUTO_4386 ?AUTO_4390 ) ) ( not ( = ?AUTO_4387 ?AUTO_4390 ) ) ( CLEAR ?AUTO_4389 ) ( not ( = ?AUTO_4386 ?AUTO_4388 ) ) ( not ( = ?AUTO_4386 ?AUTO_4389 ) ) ( not ( = ?AUTO_4387 ?AUTO_4388 ) ) ( not ( = ?AUTO_4387 ?AUTO_4389 ) ) ( not ( = ?AUTO_4390 ?AUTO_4388 ) ) ( not ( = ?AUTO_4390 ?AUTO_4389 ) ) ( not ( = ?AUTO_4388 ?AUTO_4389 ) ) ( ON ?AUTO_4388 ?AUTO_4386 ) ( CLEAR ?AUTO_4388 ) ( not ( = ?AUTO_4386 ?AUTO_4393 ) ) ( not ( = ?AUTO_4387 ?AUTO_4393 ) ) ( not ( = ?AUTO_4390 ?AUTO_4393 ) ) ( not ( = ?AUTO_4389 ?AUTO_4393 ) ) ( not ( = ?AUTO_4388 ?AUTO_4393 ) ) ( ON ?AUTO_4393 ?AUTO_4387 ) ( CLEAR ?AUTO_4392 ) ( not ( = ?AUTO_4386 ?AUTO_4391 ) ) ( not ( = ?AUTO_4386 ?AUTO_4392 ) ) ( not ( = ?AUTO_4387 ?AUTO_4391 ) ) ( not ( = ?AUTO_4387 ?AUTO_4392 ) ) ( not ( = ?AUTO_4390 ?AUTO_4391 ) ) ( not ( = ?AUTO_4390 ?AUTO_4392 ) ) ( not ( = ?AUTO_4389 ?AUTO_4391 ) ) ( not ( = ?AUTO_4389 ?AUTO_4392 ) ) ( not ( = ?AUTO_4388 ?AUTO_4391 ) ) ( not ( = ?AUTO_4388 ?AUTO_4392 ) ) ( not ( = ?AUTO_4393 ?AUTO_4391 ) ) ( not ( = ?AUTO_4393 ?AUTO_4392 ) ) ( not ( = ?AUTO_4391 ?AUTO_4392 ) ) ( ON ?AUTO_4391 ?AUTO_4393 ) ( CLEAR ?AUTO_4391 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4391 ?AUTO_4393 )
      ( MAKE-ON ?AUTO_4386 ?AUTO_4387 )
      ( MAKE-ON-VERIFY ?AUTO_4386 ?AUTO_4387 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4402 - BLOCK
      ?AUTO_4403 - BLOCK
    )
    :vars
    (
      ?AUTO_4407 - BLOCK
      ?AUTO_4405 - BLOCK
      ?AUTO_4406 - BLOCK
      ?AUTO_4409 - BLOCK
      ?AUTO_4408 - BLOCK
      ?AUTO_4404 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4402 ?AUTO_4403 ) ) ( ON ?AUTO_4402 ?AUTO_4407 ) ( not ( = ?AUTO_4402 ?AUTO_4407 ) ) ( not ( = ?AUTO_4403 ?AUTO_4407 ) ) ( CLEAR ?AUTO_4405 ) ( not ( = ?AUTO_4402 ?AUTO_4406 ) ) ( not ( = ?AUTO_4402 ?AUTO_4405 ) ) ( not ( = ?AUTO_4403 ?AUTO_4406 ) ) ( not ( = ?AUTO_4403 ?AUTO_4405 ) ) ( not ( = ?AUTO_4407 ?AUTO_4406 ) ) ( not ( = ?AUTO_4407 ?AUTO_4405 ) ) ( not ( = ?AUTO_4406 ?AUTO_4405 ) ) ( ON ?AUTO_4406 ?AUTO_4402 ) ( CLEAR ?AUTO_4406 ) ( not ( = ?AUTO_4402 ?AUTO_4409 ) ) ( not ( = ?AUTO_4403 ?AUTO_4409 ) ) ( not ( = ?AUTO_4407 ?AUTO_4409 ) ) ( not ( = ?AUTO_4405 ?AUTO_4409 ) ) ( not ( = ?AUTO_4406 ?AUTO_4409 ) ) ( ON ?AUTO_4409 ?AUTO_4403 ) ( not ( = ?AUTO_4402 ?AUTO_4408 ) ) ( not ( = ?AUTO_4402 ?AUTO_4404 ) ) ( not ( = ?AUTO_4403 ?AUTO_4408 ) ) ( not ( = ?AUTO_4403 ?AUTO_4404 ) ) ( not ( = ?AUTO_4407 ?AUTO_4408 ) ) ( not ( = ?AUTO_4407 ?AUTO_4404 ) ) ( not ( = ?AUTO_4405 ?AUTO_4408 ) ) ( not ( = ?AUTO_4405 ?AUTO_4404 ) ) ( not ( = ?AUTO_4406 ?AUTO_4408 ) ) ( not ( = ?AUTO_4406 ?AUTO_4404 ) ) ( not ( = ?AUTO_4409 ?AUTO_4408 ) ) ( not ( = ?AUTO_4409 ?AUTO_4404 ) ) ( not ( = ?AUTO_4408 ?AUTO_4404 ) ) ( ON ?AUTO_4408 ?AUTO_4409 ) ( ON ?AUTO_4404 ?AUTO_4408 ) ( CLEAR ?AUTO_4404 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4404 ?AUTO_4408 )
      ( MAKE-ON ?AUTO_4402 ?AUTO_4403 )
      ( MAKE-ON-VERIFY ?AUTO_4402 ?AUTO_4403 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4410 - BLOCK
      ?AUTO_4411 - BLOCK
    )
    :vars
    (
      ?AUTO_4414 - BLOCK
      ?AUTO_4413 - BLOCK
      ?AUTO_4415 - BLOCK
      ?AUTO_4416 - BLOCK
      ?AUTO_4412 - BLOCK
      ?AUTO_4417 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4410 ?AUTO_4411 ) ) ( ON ?AUTO_4410 ?AUTO_4414 ) ( not ( = ?AUTO_4410 ?AUTO_4414 ) ) ( not ( = ?AUTO_4411 ?AUTO_4414 ) ) ( not ( = ?AUTO_4410 ?AUTO_4413 ) ) ( not ( = ?AUTO_4410 ?AUTO_4415 ) ) ( not ( = ?AUTO_4411 ?AUTO_4413 ) ) ( not ( = ?AUTO_4411 ?AUTO_4415 ) ) ( not ( = ?AUTO_4414 ?AUTO_4413 ) ) ( not ( = ?AUTO_4414 ?AUTO_4415 ) ) ( not ( = ?AUTO_4413 ?AUTO_4415 ) ) ( ON ?AUTO_4413 ?AUTO_4410 ) ( CLEAR ?AUTO_4413 ) ( not ( = ?AUTO_4410 ?AUTO_4416 ) ) ( not ( = ?AUTO_4411 ?AUTO_4416 ) ) ( not ( = ?AUTO_4414 ?AUTO_4416 ) ) ( not ( = ?AUTO_4415 ?AUTO_4416 ) ) ( not ( = ?AUTO_4413 ?AUTO_4416 ) ) ( ON ?AUTO_4416 ?AUTO_4411 ) ( not ( = ?AUTO_4410 ?AUTO_4412 ) ) ( not ( = ?AUTO_4410 ?AUTO_4417 ) ) ( not ( = ?AUTO_4411 ?AUTO_4412 ) ) ( not ( = ?AUTO_4411 ?AUTO_4417 ) ) ( not ( = ?AUTO_4414 ?AUTO_4412 ) ) ( not ( = ?AUTO_4414 ?AUTO_4417 ) ) ( not ( = ?AUTO_4415 ?AUTO_4412 ) ) ( not ( = ?AUTO_4415 ?AUTO_4417 ) ) ( not ( = ?AUTO_4413 ?AUTO_4412 ) ) ( not ( = ?AUTO_4413 ?AUTO_4417 ) ) ( not ( = ?AUTO_4416 ?AUTO_4412 ) ) ( not ( = ?AUTO_4416 ?AUTO_4417 ) ) ( not ( = ?AUTO_4412 ?AUTO_4417 ) ) ( ON ?AUTO_4412 ?AUTO_4416 ) ( ON ?AUTO_4417 ?AUTO_4412 ) ( CLEAR ?AUTO_4417 ) ( HOLDING ?AUTO_4415 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4415 )
      ( MAKE-ON ?AUTO_4410 ?AUTO_4411 )
      ( MAKE-ON-VERIFY ?AUTO_4410 ?AUTO_4411 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4418 - BLOCK
      ?AUTO_4419 - BLOCK
    )
    :vars
    (
      ?AUTO_4421 - BLOCK
      ?AUTO_4425 - BLOCK
      ?AUTO_4420 - BLOCK
      ?AUTO_4423 - BLOCK
      ?AUTO_4424 - BLOCK
      ?AUTO_4422 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4418 ?AUTO_4419 ) ) ( ON ?AUTO_4418 ?AUTO_4421 ) ( not ( = ?AUTO_4418 ?AUTO_4421 ) ) ( not ( = ?AUTO_4419 ?AUTO_4421 ) ) ( not ( = ?AUTO_4418 ?AUTO_4425 ) ) ( not ( = ?AUTO_4418 ?AUTO_4420 ) ) ( not ( = ?AUTO_4419 ?AUTO_4425 ) ) ( not ( = ?AUTO_4419 ?AUTO_4420 ) ) ( not ( = ?AUTO_4421 ?AUTO_4425 ) ) ( not ( = ?AUTO_4421 ?AUTO_4420 ) ) ( not ( = ?AUTO_4425 ?AUTO_4420 ) ) ( ON ?AUTO_4425 ?AUTO_4418 ) ( not ( = ?AUTO_4418 ?AUTO_4423 ) ) ( not ( = ?AUTO_4419 ?AUTO_4423 ) ) ( not ( = ?AUTO_4421 ?AUTO_4423 ) ) ( not ( = ?AUTO_4420 ?AUTO_4423 ) ) ( not ( = ?AUTO_4425 ?AUTO_4423 ) ) ( ON ?AUTO_4423 ?AUTO_4419 ) ( not ( = ?AUTO_4418 ?AUTO_4424 ) ) ( not ( = ?AUTO_4418 ?AUTO_4422 ) ) ( not ( = ?AUTO_4419 ?AUTO_4424 ) ) ( not ( = ?AUTO_4419 ?AUTO_4422 ) ) ( not ( = ?AUTO_4421 ?AUTO_4424 ) ) ( not ( = ?AUTO_4421 ?AUTO_4422 ) ) ( not ( = ?AUTO_4420 ?AUTO_4424 ) ) ( not ( = ?AUTO_4420 ?AUTO_4422 ) ) ( not ( = ?AUTO_4425 ?AUTO_4424 ) ) ( not ( = ?AUTO_4425 ?AUTO_4422 ) ) ( not ( = ?AUTO_4423 ?AUTO_4424 ) ) ( not ( = ?AUTO_4423 ?AUTO_4422 ) ) ( not ( = ?AUTO_4424 ?AUTO_4422 ) ) ( ON ?AUTO_4424 ?AUTO_4423 ) ( ON ?AUTO_4422 ?AUTO_4424 ) ( CLEAR ?AUTO_4422 ) ( ON ?AUTO_4420 ?AUTO_4425 ) ( CLEAR ?AUTO_4420 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4420 ?AUTO_4425 )
      ( MAKE-ON ?AUTO_4418 ?AUTO_4419 )
      ( MAKE-ON-VERIFY ?AUTO_4418 ?AUTO_4419 ) )
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
      ?AUTO_4612 - BLOCK
      ?AUTO_4616 - BLOCK
      ?AUTO_4613 - BLOCK
      ?AUTO_4614 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4610 ?AUTO_4611 ) ) ( ON ?AUTO_4610 ?AUTO_4615 ) ( not ( = ?AUTO_4610 ?AUTO_4615 ) ) ( not ( = ?AUTO_4611 ?AUTO_4615 ) ) ( CLEAR ?AUTO_4612 ) ( not ( = ?AUTO_4610 ?AUTO_4616 ) ) ( not ( = ?AUTO_4610 ?AUTO_4612 ) ) ( not ( = ?AUTO_4611 ?AUTO_4616 ) ) ( not ( = ?AUTO_4611 ?AUTO_4612 ) ) ( not ( = ?AUTO_4615 ?AUTO_4616 ) ) ( not ( = ?AUTO_4615 ?AUTO_4612 ) ) ( not ( = ?AUTO_4616 ?AUTO_4612 ) ) ( ON ?AUTO_4616 ?AUTO_4610 ) ( not ( = ?AUTO_4610 ?AUTO_4613 ) ) ( not ( = ?AUTO_4611 ?AUTO_4613 ) ) ( not ( = ?AUTO_4615 ?AUTO_4613 ) ) ( not ( = ?AUTO_4612 ?AUTO_4613 ) ) ( not ( = ?AUTO_4616 ?AUTO_4613 ) ) ( ON ?AUTO_4613 ?AUTO_4616 ) ( CLEAR ?AUTO_4613 ) ( not ( = ?AUTO_4610 ?AUTO_4614 ) ) ( not ( = ?AUTO_4611 ?AUTO_4614 ) ) ( not ( = ?AUTO_4615 ?AUTO_4614 ) ) ( not ( = ?AUTO_4612 ?AUTO_4614 ) ) ( not ( = ?AUTO_4616 ?AUTO_4614 ) ) ( not ( = ?AUTO_4613 ?AUTO_4614 ) ) ( ON ?AUTO_4614 ?AUTO_4611 ) ( CLEAR ?AUTO_4614 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4614 ?AUTO_4611 )
      ( MAKE-ON ?AUTO_4610 ?AUTO_4611 )
      ( MAKE-ON-VERIFY ?AUTO_4610 ?AUTO_4611 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4766 - BLOCK
      ?AUTO_4767 - BLOCK
    )
    :vars
    (
      ?AUTO_4768 - BLOCK
      ?AUTO_4769 - BLOCK
    )
    :precondition
    ( and ( not ( = ?AUTO_4766 ?AUTO_4767 ) ) ( ON-TABLE ?AUTO_4766 ) ( not ( = ?AUTO_4766 ?AUTO_4768 ) ) ( not ( = ?AUTO_4767 ?AUTO_4768 ) ) ( ON ?AUTO_4768 ?AUTO_4766 ) ( CLEAR ?AUTO_4768 ) ( HOLDING ?AUTO_4767 ) ( CLEAR ?AUTO_4769 ) ( not ( = ?AUTO_4766 ?AUTO_4769 ) ) ( not ( = ?AUTO_4767 ?AUTO_4769 ) ) ( not ( = ?AUTO_4768 ?AUTO_4769 ) ) )
    :subtasks
    ( ( !STACK ?AUTO_4767 ?AUTO_4769 )
      ( MAKE-ON ?AUTO_4766 ?AUTO_4767 )
      ( MAKE-ON-VERIFY ?AUTO_4766 ?AUTO_4767 ) )
  )

)

