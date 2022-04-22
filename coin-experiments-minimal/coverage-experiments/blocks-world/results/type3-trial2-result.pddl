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
      ?AUTO_3 - BLOCK
    )
    :vars
    (
      ?AUTO_6 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3 ?AUTO_6 ) ( CLEAR ?AUTO_3 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3 ?AUTO_6 )
      ( MAKE-ON-TABLE ?AUTO_3 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3 ) )
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
      ?AUTO_10 - BLOCK
    )
    :vars
    (
      ?AUTO_13 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_10 ?AUTO_13 ) ( CLEAR ?AUTO_10 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_10 ?AUTO_13 )
      ( MAKE-ON-TABLE ?AUTO_10 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_10 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_14 - BLOCK
    )
    :vars
    (
      ?AUTO_16 - BLOCK
      ?AUTO_17 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_14 ?AUTO_16 ) ( CLEAR ?AUTO_14 ) ( HOLDING ?AUTO_17 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_17 )
      ( MAKE-ON-TABLE ?AUTO_14 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_14 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_18 - BLOCK
    )
    :vars
    (
      ?AUTO_20 - BLOCK
      ?AUTO_21 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_18 ?AUTO_20 ) ( ON ?AUTO_21 ?AUTO_18 ) ( CLEAR ?AUTO_21 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_21 ?AUTO_18 )
      ( MAKE-ON-TABLE ?AUTO_18 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_18 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_26 - BLOCK
      ?AUTO_27 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_26 ) ( CLEAR ?AUTO_27 ) )
    :subtasks
    ( ( !STACK ?AUTO_26 ?AUTO_27 )
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
      ?AUTO_35 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_31 ) ( ON ?AUTO_30 ?AUTO_35 ) ( CLEAR ?AUTO_30 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_30 ?AUTO_35 )
      ( MAKE-ON ?AUTO_30 ?AUTO_31 )
      ( MAKE-ON-VERIFY ?AUTO_30 ?AUTO_31 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_36 - BLOCK
      ?AUTO_37 - BLOCK
    )
    :vars
    (
      ?AUTO_40 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_36 ?AUTO_40 ) ( CLEAR ?AUTO_36 ) ( HOLDING ?AUTO_37 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_37 )
      ( MAKE-ON ?AUTO_36 ?AUTO_37 )
      ( MAKE-ON-VERIFY ?AUTO_36 ?AUTO_37 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_42 - BLOCK
      ?AUTO_43 - BLOCK
    )
    :vars
    (
      ?AUTO_46 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_42 ?AUTO_46 ) ( ON ?AUTO_43 ?AUTO_42 ) ( CLEAR ?AUTO_43 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_43 ?AUTO_42 )
      ( MAKE-ON ?AUTO_42 ?AUTO_43 )
      ( MAKE-ON-VERIFY ?AUTO_42 ?AUTO_43 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_49 - BLOCK
      ?AUTO_50 - BLOCK
    )
    :vars
    (
      ?AUTO_53 - BLOCK
      ?AUTO_54 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_49 ?AUTO_53 ) ( ON ?AUTO_50 ?AUTO_49 ) ( CLEAR ?AUTO_50 ) ( HOLDING ?AUTO_54 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_54 )
      ( MAKE-ON ?AUTO_49 ?AUTO_50 )
      ( MAKE-ON-VERIFY ?AUTO_49 ?AUTO_50 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_55 - BLOCK
      ?AUTO_56 - BLOCK
    )
    :vars
    (
      ?AUTO_59 - BLOCK
      ?AUTO_60 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_55 ?AUTO_59 ) ( ON ?AUTO_56 ?AUTO_55 ) ( ON ?AUTO_60 ?AUTO_56 ) ( CLEAR ?AUTO_60 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_60 ?AUTO_56 )
      ( MAKE-ON ?AUTO_55 ?AUTO_56 )
      ( MAKE-ON-VERIFY ?AUTO_55 ?AUTO_56 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_65 - BLOCK
      ?AUTO_66 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_65 ) ( CLEAR ?AUTO_66 ) )
    :subtasks
    ( ( !STACK ?AUTO_65 ?AUTO_66 )
      ( MAKE-ON-VERIFY ?AUTO_65 ?AUTO_66 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_69 - BLOCK
      ?AUTO_70 - BLOCK
    )
    :vars
    (
      ?AUTO_74 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_70 ) ( ON ?AUTO_69 ?AUTO_74 ) ( CLEAR ?AUTO_69 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_69 ?AUTO_74 )
      ( MAKE-ON ?AUTO_69 ?AUTO_70 )
      ( MAKE-ON-VERIFY ?AUTO_69 ?AUTO_70 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_75 - BLOCK
      ?AUTO_76 - BLOCK
    )
    :vars
    (
      ?AUTO_79 - BLOCK
      ?AUTO_81 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_75 ?AUTO_79 ) ( CLEAR ?AUTO_75 ) ( HOLDING ?AUTO_76 ) ( CLEAR ?AUTO_81 ) )
    :subtasks
    ( ( !STACK ?AUTO_76 ?AUTO_81 )
      ( MAKE-ON ?AUTO_75 ?AUTO_76 )
      ( MAKE-ON-VERIFY ?AUTO_75 ?AUTO_76 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_84 - BLOCK
      ?AUTO_85 - BLOCK
    )
    :vars
    (
      ?AUTO_88 - BLOCK
      ?AUTO_89 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_85 ) ( ON ?AUTO_84 ?AUTO_88 ) ( CLEAR ?AUTO_84 ) ( HOLDING ?AUTO_89 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_89 )
      ( MAKE-ON ?AUTO_84 ?AUTO_85 )
      ( MAKE-ON-VERIFY ?AUTO_84 ?AUTO_85 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_90 - BLOCK
      ?AUTO_91 - BLOCK
    )
    :vars
    (
      ?AUTO_94 - BLOCK
      ?AUTO_95 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_90 ?AUTO_94 ) ( CLEAR ?AUTO_90 ) ( ON ?AUTO_95 ?AUTO_91 ) ( CLEAR ?AUTO_95 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_95 ?AUTO_91 )
      ( MAKE-ON ?AUTO_90 ?AUTO_91 )
      ( MAKE-ON-VERIFY ?AUTO_90 ?AUTO_91 ) )
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
      ?AUTO_100 - BLOCK
      ?AUTO_104 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_98 ?AUTO_103 ) ( CLEAR ?AUTO_98 ) ( ON ?AUTO_100 ?AUTO_99 ) ( CLEAR ?AUTO_100 ) ( HOLDING ?AUTO_104 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_104 )
      ( MAKE-ON ?AUTO_98 ?AUTO_99 )
      ( MAKE-ON-VERIFY ?AUTO_98 ?AUTO_99 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_105 - BLOCK
      ?AUTO_106 - BLOCK
    )
    :vars
    (
      ?AUTO_110 - BLOCK
      ?AUTO_109 - BLOCK
      ?AUTO_111 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_105 ?AUTO_110 ) ( CLEAR ?AUTO_105 ) ( ON ?AUTO_109 ?AUTO_106 ) ( ON ?AUTO_111 ?AUTO_109 ) ( CLEAR ?AUTO_111 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_111 ?AUTO_109 )
      ( MAKE-ON ?AUTO_105 ?AUTO_106 )
      ( MAKE-ON-VERIFY ?AUTO_105 ?AUTO_106 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_116 - BLOCK
      ?AUTO_117 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_116 ) ( CLEAR ?AUTO_117 ) )
    :subtasks
    ( ( !STACK ?AUTO_116 ?AUTO_117 )
      ( MAKE-ON-VERIFY ?AUTO_116 ?AUTO_117 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_120 - BLOCK
      ?AUTO_121 - BLOCK
    )
    :vars
    (
      ?AUTO_125 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_121 ) ( ON ?AUTO_120 ?AUTO_125 ) ( CLEAR ?AUTO_120 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_120 ?AUTO_125 )
      ( MAKE-ON ?AUTO_120 ?AUTO_121 )
      ( MAKE-ON-VERIFY ?AUTO_120 ?AUTO_121 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_126 - BLOCK
      ?AUTO_127 - BLOCK
    )
    :vars
    (
      ?AUTO_130 - BLOCK
      ?AUTO_132 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_126 ?AUTO_130 ) ( CLEAR ?AUTO_126 ) ( HOLDING ?AUTO_127 ) ( CLEAR ?AUTO_132 ) )
    :subtasks
    ( ( !STACK ?AUTO_127 ?AUTO_132 )
      ( MAKE-ON ?AUTO_126 ?AUTO_127 )
      ( MAKE-ON-VERIFY ?AUTO_126 ?AUTO_127 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_133 - BLOCK
      ?AUTO_134 - BLOCK
    )
    :vars
    (
      ?AUTO_137 - BLOCK
      ?AUTO_138 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_133 ?AUTO_137 ) ( CLEAR ?AUTO_138 ) ( ON ?AUTO_134 ?AUTO_133 ) ( CLEAR ?AUTO_134 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_134 ?AUTO_133 )
      ( MAKE-ON ?AUTO_133 ?AUTO_134 )
      ( MAKE-ON-VERIFY ?AUTO_133 ?AUTO_134 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_141 - BLOCK
      ?AUTO_142 - BLOCK
    )
    :vars
    (
      ?AUTO_146 - BLOCK
      ?AUTO_143 - BLOCK
      ?AUTO_148 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_141 ?AUTO_146 ) ( ON ?AUTO_142 ?AUTO_141 ) ( CLEAR ?AUTO_142 ) ( HOLDING ?AUTO_143 ) ( CLEAR ?AUTO_148 ) )
    :subtasks
    ( ( !STACK ?AUTO_143 ?AUTO_148 )
      ( MAKE-ON ?AUTO_141 ?AUTO_142 )
      ( MAKE-ON-VERIFY ?AUTO_141 ?AUTO_142 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_160 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_160 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_160 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_160 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_162 - BLOCK
    )
    :vars
    (
      ?AUTO_165 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_162 ?AUTO_165 ) ( CLEAR ?AUTO_162 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_162 ?AUTO_165 )
      ( MAKE-ON-TABLE ?AUTO_162 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_162 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_166 - BLOCK
    )
    :vars
    (
      ?AUTO_168 - BLOCK
      ?AUTO_169 - BLOCK
      ?AUTO_170 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_166 ?AUTO_168 ) ( CLEAR ?AUTO_166 ) ( HOLDING ?AUTO_169 ) ( CLEAR ?AUTO_170 ) )
    :subtasks
    ( ( !STACK ?AUTO_169 ?AUTO_170 )
      ( MAKE-ON-TABLE ?AUTO_166 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_166 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_171 - BLOCK
    )
    :vars
    (
      ?AUTO_173 - BLOCK
      ?AUTO_175 - BLOCK
      ?AUTO_174 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_171 ?AUTO_173 ) ( CLEAR ?AUTO_175 ) ( ON ?AUTO_174 ?AUTO_171 ) ( CLEAR ?AUTO_174 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_174 ?AUTO_171 )
      ( MAKE-ON-TABLE ?AUTO_171 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_171 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_178 - BLOCK
    )
    :vars
    (
      ?AUTO_181 - BLOCK
      ?AUTO_182 - BLOCK
      ?AUTO_179 - BLOCK
      ?AUTO_184 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_178 ?AUTO_181 ) ( ON ?AUTO_182 ?AUTO_178 ) ( CLEAR ?AUTO_182 ) ( HOLDING ?AUTO_179 ) ( CLEAR ?AUTO_184 ) )
    :subtasks
    ( ( !STACK ?AUTO_179 ?AUTO_184 )
      ( MAKE-ON-TABLE ?AUTO_178 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_178 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_185 - BLOCK
    )
    :vars
    (
      ?AUTO_189 - BLOCK
      ?AUTO_186 - BLOCK
      ?AUTO_190 - BLOCK
      ?AUTO_187 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_185 ?AUTO_189 ) ( ON ?AUTO_186 ?AUTO_185 ) ( CLEAR ?AUTO_190 ) ( ON ?AUTO_187 ?AUTO_186 ) ( CLEAR ?AUTO_187 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_187 ?AUTO_186 )
      ( MAKE-ON-TABLE ?AUTO_185 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_185 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_193 - BLOCK
    )
    :vars
    (
      ?AUTO_196 - BLOCK
      ?AUTO_195 - BLOCK
      ?AUTO_194 - BLOCK
      ?AUTO_198 - BLOCK
      ?AUTO_200 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_193 ?AUTO_196 ) ( ON ?AUTO_195 ?AUTO_193 ) ( ON ?AUTO_194 ?AUTO_195 ) ( CLEAR ?AUTO_194 ) ( HOLDING ?AUTO_198 ) ( CLEAR ?AUTO_200 ) )
    :subtasks
    ( ( !STACK ?AUTO_198 ?AUTO_200 )
      ( MAKE-ON-TABLE ?AUTO_193 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_193 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_207 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_207 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_207 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_207 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_209 - BLOCK
    )
    :vars
    (
      ?AUTO_212 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_209 ?AUTO_212 ) ( CLEAR ?AUTO_209 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_209 ?AUTO_212 )
      ( MAKE-ON-TABLE ?AUTO_209 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_209 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_213 - BLOCK
    )
    :vars
    (
      ?AUTO_215 - BLOCK
      ?AUTO_216 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_213 ?AUTO_215 ) ( CLEAR ?AUTO_213 ) ( HOLDING ?AUTO_216 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_216 )
      ( MAKE-ON-TABLE ?AUTO_213 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_213 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_217 - BLOCK
    )
    :vars
    (
      ?AUTO_220 - BLOCK
      ?AUTO_219 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_217 ?AUTO_220 ) ( ON ?AUTO_219 ?AUTO_217 ) ( CLEAR ?AUTO_219 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_219 ?AUTO_217 )
      ( MAKE-ON-TABLE ?AUTO_217 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_217 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_223 - BLOCK
    )
    :vars
    (
      ?AUTO_224 - BLOCK
      ?AUTO_225 - BLOCK
      ?AUTO_227 - BLOCK
      ?AUTO_228 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_223 ?AUTO_224 ) ( ON ?AUTO_225 ?AUTO_223 ) ( CLEAR ?AUTO_225 ) ( HOLDING ?AUTO_227 ) ( CLEAR ?AUTO_228 ) )
    :subtasks
    ( ( !STACK ?AUTO_227 ?AUTO_228 )
      ( MAKE-ON-TABLE ?AUTO_223 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_223 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_229 - BLOCK
    )
    :vars
    (
      ?AUTO_231 - BLOCK
      ?AUTO_232 - BLOCK
      ?AUTO_234 - BLOCK
      ?AUTO_233 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_229 ?AUTO_231 ) ( ON ?AUTO_232 ?AUTO_229 ) ( CLEAR ?AUTO_234 ) ( ON ?AUTO_233 ?AUTO_232 ) ( CLEAR ?AUTO_233 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_233 ?AUTO_232 )
      ( MAKE-ON-TABLE ?AUTO_229 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_229 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_237 - BLOCK
    )
    :vars
    (
      ?AUTO_242 - BLOCK
      ?AUTO_240 - BLOCK
      ?AUTO_239 - BLOCK
      ?AUTO_238 - BLOCK
      ?AUTO_244 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_237 ?AUTO_242 ) ( ON ?AUTO_240 ?AUTO_237 ) ( ON ?AUTO_239 ?AUTO_240 ) ( CLEAR ?AUTO_239 ) ( HOLDING ?AUTO_238 ) ( CLEAR ?AUTO_244 ) )
    :subtasks
    ( ( !STACK ?AUTO_238 ?AUTO_244 )
      ( MAKE-ON-TABLE ?AUTO_237 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_237 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_245 - BLOCK
    )
    :vars
    (
      ?AUTO_249 - BLOCK
      ?AUTO_248 - BLOCK
      ?AUTO_247 - BLOCK
      ?AUTO_250 - BLOCK
      ?AUTO_246 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_245 ?AUTO_249 ) ( ON ?AUTO_248 ?AUTO_245 ) ( ON ?AUTO_247 ?AUTO_248 ) ( CLEAR ?AUTO_250 ) ( ON ?AUTO_246 ?AUTO_247 ) ( CLEAR ?AUTO_246 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_246 ?AUTO_247 )
      ( MAKE-ON-TABLE ?AUTO_245 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_245 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_254 - BLOCK
    )
    :vars
    (
      ?AUTO_259 - BLOCK
      ?AUTO_258 - BLOCK
      ?AUTO_255 - BLOCK
      ?AUTO_260 - BLOCK
      ?AUTO_256 - BLOCK
      ?AUTO_262 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_254 ?AUTO_259 ) ( ON ?AUTO_258 ?AUTO_254 ) ( ON ?AUTO_255 ?AUTO_258 ) ( ON ?AUTO_260 ?AUTO_255 ) ( CLEAR ?AUTO_260 ) ( HOLDING ?AUTO_256 ) ( CLEAR ?AUTO_262 ) )
    :subtasks
    ( ( !STACK ?AUTO_256 ?AUTO_262 )
      ( MAKE-ON-TABLE ?AUTO_254 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_254 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_270 - BLOCK
      ?AUTO_271 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_270 ) ( CLEAR ?AUTO_271 ) )
    :subtasks
    ( ( !STACK ?AUTO_270 ?AUTO_271 )
      ( MAKE-ON-VERIFY ?AUTO_270 ?AUTO_271 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_274 - BLOCK
      ?AUTO_275 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_275 ) ( ON-TABLE ?AUTO_274 ) ( CLEAR ?AUTO_274 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_274 )
      ( MAKE-ON ?AUTO_274 ?AUTO_275 )
      ( MAKE-ON-VERIFY ?AUTO_274 ?AUTO_275 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_279 - BLOCK
      ?AUTO_280 - BLOCK
    )
    :vars
    (
      ?AUTO_283 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_280 ) ( ON-TABLE ?AUTO_279 ) ( CLEAR ?AUTO_279 ) ( HOLDING ?AUTO_283 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_283 )
      ( MAKE-ON ?AUTO_279 ?AUTO_280 )
      ( MAKE-ON-VERIFY ?AUTO_279 ?AUTO_280 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_284 - BLOCK
      ?AUTO_285 - BLOCK
    )
    :vars
    (
      ?AUTO_288 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_285 ) ( ON-TABLE ?AUTO_284 ) ( ON ?AUTO_288 ?AUTO_284 ) ( CLEAR ?AUTO_288 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_288 ?AUTO_284 )
      ( MAKE-ON ?AUTO_284 ?AUTO_285 )
      ( MAKE-ON-VERIFY ?AUTO_284 ?AUTO_285 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_291 - BLOCK
      ?AUTO_292 - BLOCK
    )
    :vars
    (
      ?AUTO_295 - BLOCK
      ?AUTO_296 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_292 ) ( ON-TABLE ?AUTO_291 ) ( ON ?AUTO_295 ?AUTO_291 ) ( CLEAR ?AUTO_295 ) ( HOLDING ?AUTO_296 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_296 )
      ( MAKE-ON ?AUTO_291 ?AUTO_292 )
      ( MAKE-ON-VERIFY ?AUTO_291 ?AUTO_292 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_297 - BLOCK
      ?AUTO_298 - BLOCK
    )
    :vars
    (
      ?AUTO_299 - BLOCK
      ?AUTO_302 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_298 ) ( ON-TABLE ?AUTO_297 ) ( ON ?AUTO_299 ?AUTO_297 ) ( ON ?AUTO_302 ?AUTO_299 ) ( CLEAR ?AUTO_302 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_302 ?AUTO_299 )
      ( MAKE-ON ?AUTO_297 ?AUTO_298 )
      ( MAKE-ON-VERIFY ?AUTO_297 ?AUTO_298 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_305 - BLOCK
      ?AUTO_306 - BLOCK
    )
    :vars
    (
      ?AUTO_308 - BLOCK
      ?AUTO_307 - BLOCK
      ?AUTO_311 - BLOCK
      ?AUTO_312 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_306 ) ( ON-TABLE ?AUTO_305 ) ( ON ?AUTO_308 ?AUTO_305 ) ( ON ?AUTO_307 ?AUTO_308 ) ( CLEAR ?AUTO_307 ) ( HOLDING ?AUTO_311 ) ( CLEAR ?AUTO_312 ) )
    :subtasks
    ( ( !STACK ?AUTO_311 ?AUTO_312 )
      ( MAKE-ON ?AUTO_305 ?AUTO_306 )
      ( MAKE-ON-VERIFY ?AUTO_305 ?AUTO_306 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_313 - BLOCK
      ?AUTO_314 - BLOCK
    )
    :vars
    (
      ?AUTO_316 - BLOCK
      ?AUTO_315 - BLOCK
      ?AUTO_320 - BLOCK
      ?AUTO_319 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_314 ) ( ON-TABLE ?AUTO_313 ) ( ON ?AUTO_316 ?AUTO_313 ) ( ON ?AUTO_315 ?AUTO_316 ) ( CLEAR ?AUTO_320 ) ( ON ?AUTO_319 ?AUTO_315 ) ( CLEAR ?AUTO_319 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_319 ?AUTO_315 )
      ( MAKE-ON ?AUTO_313 ?AUTO_314 )
      ( MAKE-ON-VERIFY ?AUTO_313 ?AUTO_314 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_323 - BLOCK
      ?AUTO_324 - BLOCK
    )
    :vars
    (
      ?AUTO_328 - BLOCK
      ?AUTO_330 - BLOCK
      ?AUTO_329 - BLOCK
      ?AUTO_325 - BLOCK
      ?AUTO_332 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_324 ) ( ON-TABLE ?AUTO_323 ) ( ON ?AUTO_328 ?AUTO_323 ) ( ON ?AUTO_330 ?AUTO_328 ) ( ON ?AUTO_329 ?AUTO_330 ) ( CLEAR ?AUTO_329 ) ( HOLDING ?AUTO_325 ) ( CLEAR ?AUTO_332 ) )
    :subtasks
    ( ( !STACK ?AUTO_325 ?AUTO_332 )
      ( MAKE-ON ?AUTO_323 ?AUTO_324 )
      ( MAKE-ON-VERIFY ?AUTO_323 ?AUTO_324 ) )
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
      ?AUTO_338 - BLOCK
      ?AUTO_339 - BLOCK
      ?AUTO_337 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_334 ) ( ON-TABLE ?AUTO_333 ) ( ON ?AUTO_335 ?AUTO_333 ) ( ON ?AUTO_336 ?AUTO_335 ) ( ON ?AUTO_338 ?AUTO_336 ) ( CLEAR ?AUTO_339 ) ( ON ?AUTO_337 ?AUTO_338 ) ( CLEAR ?AUTO_337 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_337 ?AUTO_338 )
      ( MAKE-ON ?AUTO_333 ?AUTO_334 )
      ( MAKE-ON-VERIFY ?AUTO_333 ?AUTO_334 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_344 - BLOCK
      ?AUTO_345 - BLOCK
    )
    :vars
    (
      ?AUTO_349 - BLOCK
      ?AUTO_346 - BLOCK
      ?AUTO_351 - BLOCK
      ?AUTO_352 - BLOCK
      ?AUTO_348 - BLOCK
      ?AUTO_354 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_345 ) ( ON-TABLE ?AUTO_344 ) ( ON ?AUTO_349 ?AUTO_344 ) ( ON ?AUTO_346 ?AUTO_349 ) ( ON ?AUTO_351 ?AUTO_346 ) ( ON ?AUTO_352 ?AUTO_351 ) ( CLEAR ?AUTO_352 ) ( HOLDING ?AUTO_348 ) ( CLEAR ?AUTO_354 ) )
    :subtasks
    ( ( !STACK ?AUTO_348 ?AUTO_354 )
      ( MAKE-ON ?AUTO_344 ?AUTO_345 )
      ( MAKE-ON-VERIFY ?AUTO_344 ?AUTO_345 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_361 - BLOCK
      ?AUTO_362 - BLOCK
    )
    :vars
    (
      ?AUTO_368 - BLOCK
      ?AUTO_369 - BLOCK
      ?AUTO_366 - BLOCK
      ?AUTO_364 - BLOCK
      ?AUTO_363 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_361 ) ( ON ?AUTO_368 ?AUTO_361 ) ( ON ?AUTO_369 ?AUTO_368 ) ( ON ?AUTO_366 ?AUTO_369 ) ( CLEAR ?AUTO_364 ) ( ON ?AUTO_363 ?AUTO_366 ) ( CLEAR ?AUTO_363 ) ( HOLDING ?AUTO_362 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_362 )
      ( MAKE-ON ?AUTO_361 ?AUTO_362 )
      ( MAKE-ON-VERIFY ?AUTO_361 ?AUTO_362 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_375 - BLOCK
      ?AUTO_376 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_375 ) ( CLEAR ?AUTO_376 ) )
    :subtasks
    ( ( !STACK ?AUTO_375 ?AUTO_376 )
      ( MAKE-ON-VERIFY ?AUTO_375 ?AUTO_376 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_379 - BLOCK
      ?AUTO_380 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_380 ) ( ON-TABLE ?AUTO_379 ) ( CLEAR ?AUTO_379 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_379 )
      ( MAKE-ON ?AUTO_379 ?AUTO_380 )
      ( MAKE-ON-VERIFY ?AUTO_379 ?AUTO_380 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_384 - BLOCK
      ?AUTO_385 - BLOCK
    )
    :vars
    (
      ?AUTO_389 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_384 ) ( CLEAR ?AUTO_384 ) ( HOLDING ?AUTO_385 ) ( CLEAR ?AUTO_389 ) )
    :subtasks
    ( ( !STACK ?AUTO_385 ?AUTO_389 )
      ( MAKE-ON ?AUTO_384 ?AUTO_385 )
      ( MAKE-ON-VERIFY ?AUTO_384 ?AUTO_385 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_394 - BLOCK
      ?AUTO_395 - BLOCK
    )
    :vars
    (
      ?AUTO_398 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_394 ) ( CLEAR ?AUTO_394 ) ( ON ?AUTO_398 ?AUTO_395 ) ( CLEAR ?AUTO_398 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_398 ?AUTO_395 )
      ( MAKE-ON ?AUTO_394 ?AUTO_395 )
      ( MAKE-ON-VERIFY ?AUTO_394 ?AUTO_395 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_401 - BLOCK
      ?AUTO_402 - BLOCK
    )
    :vars
    (
      ?AUTO_405 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_405 ?AUTO_402 ) ( CLEAR ?AUTO_405 ) ( HOLDING ?AUTO_401 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_401 )
      ( MAKE-ON ?AUTO_401 ?AUTO_402 )
      ( MAKE-ON-VERIFY ?AUTO_401 ?AUTO_402 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_407 - BLOCK
      ?AUTO_408 - BLOCK
    )
    :vars
    (
      ?AUTO_411 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_411 ?AUTO_408 ) ( ON ?AUTO_407 ?AUTO_411 ) ( CLEAR ?AUTO_407 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_407 ?AUTO_411 )
      ( MAKE-ON ?AUTO_407 ?AUTO_408 )
      ( MAKE-ON-VERIFY ?AUTO_407 ?AUTO_408 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_414 - BLOCK
      ?AUTO_415 - BLOCK
    )
    :vars
    (
      ?AUTO_418 - BLOCK
      ?AUTO_419 - BLOCK
      ?AUTO_420 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_418 ?AUTO_415 ) ( ON ?AUTO_414 ?AUTO_418 ) ( CLEAR ?AUTO_414 ) ( HOLDING ?AUTO_419 ) ( CLEAR ?AUTO_420 ) )
    :subtasks
    ( ( !STACK ?AUTO_419 ?AUTO_420 )
      ( MAKE-ON ?AUTO_414 ?AUTO_415 )
      ( MAKE-ON-VERIFY ?AUTO_414 ?AUTO_415 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_421 - BLOCK
      ?AUTO_422 - BLOCK
    )
    :vars
    (
      ?AUTO_426 - BLOCK
      ?AUTO_425 - BLOCK
      ?AUTO_424 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_426 ?AUTO_422 ) ( ON ?AUTO_421 ?AUTO_426 ) ( CLEAR ?AUTO_425 ) ( ON ?AUTO_424 ?AUTO_421 ) ( CLEAR ?AUTO_424 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_424 ?AUTO_421 )
      ( MAKE-ON ?AUTO_421 ?AUTO_422 )
      ( MAKE-ON-VERIFY ?AUTO_421 ?AUTO_422 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_430 - BLOCK
      ?AUTO_431 - BLOCK
    )
    :vars
    (
      ?AUTO_434 - BLOCK
      ?AUTO_432 - BLOCK
      ?AUTO_433 - BLOCK
      ?AUTO_438 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_434 ?AUTO_431 ) ( ON ?AUTO_430 ?AUTO_434 ) ( ON ?AUTO_432 ?AUTO_430 ) ( CLEAR ?AUTO_432 ) ( HOLDING ?AUTO_433 ) ( CLEAR ?AUTO_438 ) )
    :subtasks
    ( ( !STACK ?AUTO_433 ?AUTO_438 )
      ( MAKE-ON ?AUTO_430 ?AUTO_431 )
      ( MAKE-ON-VERIFY ?AUTO_430 ?AUTO_431 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_439 - BLOCK
      ?AUTO_440 - BLOCK
    )
    :vars
    (
      ?AUTO_446 - BLOCK
      ?AUTO_441 - BLOCK
      ?AUTO_443 - BLOCK
      ?AUTO_442 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_446 ?AUTO_440 ) ( ON ?AUTO_439 ?AUTO_446 ) ( ON ?AUTO_441 ?AUTO_439 ) ( CLEAR ?AUTO_443 ) ( ON ?AUTO_442 ?AUTO_441 ) ( CLEAR ?AUTO_442 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_442 ?AUTO_441 )
      ( MAKE-ON ?AUTO_439 ?AUTO_440 )
      ( MAKE-ON-VERIFY ?AUTO_439 ?AUTO_440 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_449 - BLOCK
      ?AUTO_450 - BLOCK
    )
    :vars
    (
      ?AUTO_456 - BLOCK
      ?AUTO_455 - BLOCK
      ?AUTO_453 - BLOCK
      ?AUTO_454 - BLOCK
      ?AUTO_458 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_456 ?AUTO_450 ) ( ON ?AUTO_449 ?AUTO_456 ) ( ON ?AUTO_455 ?AUTO_449 ) ( ON ?AUTO_453 ?AUTO_455 ) ( CLEAR ?AUTO_453 ) ( HOLDING ?AUTO_454 ) ( CLEAR ?AUTO_458 ) )
    :subtasks
    ( ( !STACK ?AUTO_454 ?AUTO_458 )
      ( MAKE-ON ?AUTO_449 ?AUTO_450 )
      ( MAKE-ON-VERIFY ?AUTO_449 ?AUTO_450 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_471 - BLOCK
      ?AUTO_472 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_471 ) ( CLEAR ?AUTO_472 ) )
    :subtasks
    ( ( !STACK ?AUTO_471 ?AUTO_472 )
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
      ?AUTO_480 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_476 ) ( ON ?AUTO_475 ?AUTO_480 ) ( CLEAR ?AUTO_475 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_475 ?AUTO_480 )
      ( MAKE-ON ?AUTO_475 ?AUTO_476 )
      ( MAKE-ON-VERIFY ?AUTO_475 ?AUTO_476 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_481 - BLOCK
      ?AUTO_482 - BLOCK
    )
    :vars
    (
      ?AUTO_485 - BLOCK
      ?AUTO_486 - BLOCK
      ?AUTO_487 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_482 ) ( ON ?AUTO_481 ?AUTO_485 ) ( CLEAR ?AUTO_481 ) ( HOLDING ?AUTO_486 ) ( CLEAR ?AUTO_487 ) )
    :subtasks
    ( ( !STACK ?AUTO_486 ?AUTO_487 )
      ( MAKE-ON ?AUTO_481 ?AUTO_482 )
      ( MAKE-ON-VERIFY ?AUTO_481 ?AUTO_482 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_494 - BLOCK
      ?AUTO_495 - BLOCK
    )
    :vars
    (
      ?AUTO_496 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_494 ?AUTO_496 ) ( CLEAR ?AUTO_494 ) ( HOLDING ?AUTO_495 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_495 )
      ( MAKE-ON ?AUTO_494 ?AUTO_495 )
      ( MAKE-ON-VERIFY ?AUTO_494 ?AUTO_495 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_504 - BLOCK
      ?AUTO_505 - BLOCK
    )
    :vars
    (
      ?AUTO_508 - BLOCK
      ?AUTO_510 - BLOCK
      ?AUTO_509 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_504 ?AUTO_508 ) ( CLEAR ?AUTO_504 ) ( CLEAR ?AUTO_510 ) ( ON ?AUTO_509 ?AUTO_505 ) ( CLEAR ?AUTO_509 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_509 ?AUTO_505 )
      ( MAKE-ON ?AUTO_504 ?AUTO_505 )
      ( MAKE-ON-VERIFY ?AUTO_504 ?AUTO_505 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_535 - BLOCK
      ?AUTO_536 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_535 ) ( CLEAR ?AUTO_536 ) )
    :subtasks
    ( ( !STACK ?AUTO_535 ?AUTO_536 )
      ( MAKE-ON-VERIFY ?AUTO_535 ?AUTO_536 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_539 - BLOCK
      ?AUTO_540 - BLOCK
    )
    :vars
    (
      ?AUTO_544 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_540 ) ( ON ?AUTO_539 ?AUTO_544 ) ( CLEAR ?AUTO_539 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_539 ?AUTO_544 )
      ( MAKE-ON ?AUTO_539 ?AUTO_540 )
      ( MAKE-ON-VERIFY ?AUTO_539 ?AUTO_540 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_545 - BLOCK
      ?AUTO_546 - BLOCK
    )
    :vars
    (
      ?AUTO_549 - BLOCK
      ?AUTO_550 - BLOCK
      ?AUTO_551 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_546 ) ( ON ?AUTO_545 ?AUTO_549 ) ( CLEAR ?AUTO_545 ) ( HOLDING ?AUTO_550 ) ( CLEAR ?AUTO_551 ) )
    :subtasks
    ( ( !STACK ?AUTO_550 ?AUTO_551 )
      ( MAKE-ON ?AUTO_545 ?AUTO_546 )
      ( MAKE-ON-VERIFY ?AUTO_545 ?AUTO_546 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_552 - BLOCK
      ?AUTO_553 - BLOCK
    )
    :vars
    (
      ?AUTO_556 - BLOCK
      ?AUTO_558 - BLOCK
      ?AUTO_557 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_553 ) ( ON ?AUTO_552 ?AUTO_556 ) ( CLEAR ?AUTO_558 ) ( ON ?AUTO_557 ?AUTO_552 ) ( CLEAR ?AUTO_557 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_557 ?AUTO_552 )
      ( MAKE-ON ?AUTO_552 ?AUTO_553 )
      ( MAKE-ON-VERIFY ?AUTO_552 ?AUTO_553 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_561 - BLOCK
      ?AUTO_562 - BLOCK
    )
    :vars
    (
      ?AUTO_564 - BLOCK
      ?AUTO_565 - BLOCK
      ?AUTO_563 - BLOCK
      ?AUTO_569 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_561 ?AUTO_564 ) ( CLEAR ?AUTO_565 ) ( ON ?AUTO_563 ?AUTO_561 ) ( CLEAR ?AUTO_563 ) ( HOLDING ?AUTO_562 ) ( CLEAR ?AUTO_569 ) )
    :subtasks
    ( ( !STACK ?AUTO_562 ?AUTO_569 )
      ( MAKE-ON ?AUTO_561 ?AUTO_562 )
      ( MAKE-ON-VERIFY ?AUTO_561 ?AUTO_562 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_572 - BLOCK
      ?AUTO_573 - BLOCK
    )
    :vars
    (
      ?AUTO_575 - BLOCK
      ?AUTO_577 - BLOCK
      ?AUTO_574 - BLOCK
      ?AUTO_579 - BLOCK
      ?AUTO_580 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_573 ) ( ON ?AUTO_572 ?AUTO_575 ) ( CLEAR ?AUTO_577 ) ( ON ?AUTO_574 ?AUTO_572 ) ( CLEAR ?AUTO_574 ) ( HOLDING ?AUTO_579 ) ( CLEAR ?AUTO_580 ) )
    :subtasks
    ( ( !STACK ?AUTO_579 ?AUTO_580 )
      ( MAKE-ON ?AUTO_572 ?AUTO_573 )
      ( MAKE-ON-VERIFY ?AUTO_572 ?AUTO_573 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_613 - BLOCK
      ?AUTO_614 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_613 ) ( CLEAR ?AUTO_614 ) )
    :subtasks
    ( ( !STACK ?AUTO_613 ?AUTO_614 )
      ( MAKE-ON-VERIFY ?AUTO_613 ?AUTO_614 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_617 - BLOCK
      ?AUTO_618 - BLOCK
    )
    :vars
    (
      ?AUTO_622 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_618 ) ( ON ?AUTO_617 ?AUTO_622 ) ( CLEAR ?AUTO_617 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_617 ?AUTO_622 )
      ( MAKE-ON ?AUTO_617 ?AUTO_618 )
      ( MAKE-ON-VERIFY ?AUTO_617 ?AUTO_618 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_623 - BLOCK
      ?AUTO_624 - BLOCK
    )
    :vars
    (
      ?AUTO_627 - BLOCK
      ?AUTO_629 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_623 ?AUTO_627 ) ( CLEAR ?AUTO_623 ) ( HOLDING ?AUTO_624 ) ( CLEAR ?AUTO_629 ) )
    :subtasks
    ( ( !STACK ?AUTO_624 ?AUTO_629 )
      ( MAKE-ON ?AUTO_623 ?AUTO_624 )
      ( MAKE-ON-VERIFY ?AUTO_623 ?AUTO_624 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_747 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_747 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_747 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_747 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_749 - BLOCK
    )
    :vars
    (
      ?AUTO_752 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_749 ?AUTO_752 ) ( CLEAR ?AUTO_749 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_749 ?AUTO_752 )
      ( MAKE-ON-TABLE ?AUTO_749 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_749 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_753 - BLOCK
    )
    :vars
    (
      ?AUTO_755 - BLOCK
      ?AUTO_756 - BLOCK
      ?AUTO_757 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_753 ?AUTO_755 ) ( CLEAR ?AUTO_753 ) ( HOLDING ?AUTO_756 ) ( CLEAR ?AUTO_757 ) )
    :subtasks
    ( ( !STACK ?AUTO_756 ?AUTO_757 )
      ( MAKE-ON-TABLE ?AUTO_753 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_753 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_760 - BLOCK
    )
    :vars
    (
      ?AUTO_762 - BLOCK
      ?AUTO_764 - BLOCK
      ?AUTO_761 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_760 ?AUTO_762 ) ( CLEAR ?AUTO_764 ) ( ON ?AUTO_761 ?AUTO_760 ) ( CLEAR ?AUTO_761 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_761 ?AUTO_760 )
      ( MAKE-ON-TABLE ?AUTO_760 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_760 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_767 - BLOCK
    )
    :vars
    (
      ?AUTO_769 - BLOCK
      ?AUTO_771 - BLOCK
      ?AUTO_770 - BLOCK
      ?AUTO_772 - BLOCK
      ?AUTO_773 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_767 ?AUTO_769 ) ( CLEAR ?AUTO_771 ) ( ON ?AUTO_770 ?AUTO_767 ) ( CLEAR ?AUTO_770 ) ( HOLDING ?AUTO_772 ) ( CLEAR ?AUTO_773 ) )
    :subtasks
    ( ( !STACK ?AUTO_772 ?AUTO_773 )
      ( MAKE-ON-TABLE ?AUTO_767 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_767 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_774 - BLOCK
    )
    :vars
    (
      ?AUTO_776 - BLOCK
      ?AUTO_775 - BLOCK
      ?AUTO_779 - BLOCK
      ?AUTO_780 - BLOCK
      ?AUTO_778 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_774 ?AUTO_776 ) ( CLEAR ?AUTO_775 ) ( ON ?AUTO_779 ?AUTO_774 ) ( CLEAR ?AUTO_780 ) ( ON ?AUTO_778 ?AUTO_779 ) ( CLEAR ?AUTO_778 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_778 ?AUTO_779 )
      ( MAKE-ON-TABLE ?AUTO_774 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_774 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_783 - BLOCK
    )
    :vars
    (
      ?AUTO_788 - BLOCK
      ?AUTO_784 - BLOCK
      ?AUTO_787 - BLOCK
      ?AUTO_785 - BLOCK
      ?AUTO_789 - BLOCK
      ?AUTO_790 - BLOCK
      ?AUTO_791 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_783 ?AUTO_788 ) ( CLEAR ?AUTO_784 ) ( ON ?AUTO_787 ?AUTO_783 ) ( CLEAR ?AUTO_785 ) ( ON ?AUTO_789 ?AUTO_787 ) ( CLEAR ?AUTO_789 ) ( HOLDING ?AUTO_790 ) ( CLEAR ?AUTO_791 ) )
    :subtasks
    ( ( !STACK ?AUTO_790 ?AUTO_791 )
      ( MAKE-ON-TABLE ?AUTO_783 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_783 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_811 - BLOCK
      ?AUTO_812 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_811 ) ( CLEAR ?AUTO_812 ) )
    :subtasks
    ( ( !STACK ?AUTO_811 ?AUTO_812 )
      ( MAKE-ON-VERIFY ?AUTO_811 ?AUTO_812 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_815 - BLOCK
      ?AUTO_816 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_816 ) ( ON-TABLE ?AUTO_815 ) ( CLEAR ?AUTO_815 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_815 )
      ( MAKE-ON ?AUTO_815 ?AUTO_816 )
      ( MAKE-ON-VERIFY ?AUTO_815 ?AUTO_816 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_820 - BLOCK
      ?AUTO_821 - BLOCK
    )
    :vars
    (
      ?AUTO_824 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_821 ) ( ON-TABLE ?AUTO_820 ) ( CLEAR ?AUTO_820 ) ( HOLDING ?AUTO_824 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_824 )
      ( MAKE-ON ?AUTO_820 ?AUTO_821 )
      ( MAKE-ON-VERIFY ?AUTO_820 ?AUTO_821 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_825 - BLOCK
      ?AUTO_826 - BLOCK
    )
    :vars
    (
      ?AUTO_829 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_826 ) ( ON-TABLE ?AUTO_825 ) ( ON ?AUTO_829 ?AUTO_825 ) ( CLEAR ?AUTO_829 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_829 ?AUTO_825 )
      ( MAKE-ON ?AUTO_825 ?AUTO_826 )
      ( MAKE-ON-VERIFY ?AUTO_825 ?AUTO_826 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_832 - BLOCK
      ?AUTO_833 - BLOCK
    )
    :vars
    (
      ?AUTO_835 - BLOCK
      ?AUTO_837 - BLOCK
      ?AUTO_838 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_833 ) ( ON-TABLE ?AUTO_832 ) ( ON ?AUTO_835 ?AUTO_832 ) ( CLEAR ?AUTO_835 ) ( HOLDING ?AUTO_837 ) ( CLEAR ?AUTO_838 ) )
    :subtasks
    ( ( !STACK ?AUTO_837 ?AUTO_838 )
      ( MAKE-ON ?AUTO_832 ?AUTO_833 )
      ( MAKE-ON-VERIFY ?AUTO_832 ?AUTO_833 ) )
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
      ?AUTO_849 - BLOCK
      ?AUTO_846 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_844 ) ( ON-TABLE ?AUTO_843 ) ( ON ?AUTO_845 ?AUTO_843 ) ( CLEAR ?AUTO_849 ) ( ON ?AUTO_846 ?AUTO_845 ) ( CLEAR ?AUTO_846 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_846 ?AUTO_845 )
      ( MAKE-ON ?AUTO_843 ?AUTO_844 )
      ( MAKE-ON-VERIFY ?AUTO_843 ?AUTO_844 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_852 - BLOCK
      ?AUTO_853 - BLOCK
    )
    :vars
    (
      ?AUTO_856 - BLOCK
      ?AUTO_858 - BLOCK
      ?AUTO_857 - BLOCK
      ?AUTO_859 - BLOCK
      ?AUTO_860 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_853 ) ( ON-TABLE ?AUTO_852 ) ( ON ?AUTO_856 ?AUTO_852 ) ( CLEAR ?AUTO_858 ) ( ON ?AUTO_857 ?AUTO_856 ) ( CLEAR ?AUTO_857 ) ( HOLDING ?AUTO_859 ) ( CLEAR ?AUTO_860 ) )
    :subtasks
    ( ( !STACK ?AUTO_859 ?AUTO_860 )
      ( MAKE-ON ?AUTO_852 ?AUTO_853 )
      ( MAKE-ON-VERIFY ?AUTO_852 ?AUTO_853 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_861 - BLOCK
      ?AUTO_862 - BLOCK
    )
    :vars
    (
      ?AUTO_868 - BLOCK
      ?AUTO_869 - BLOCK
      ?AUTO_865 - BLOCK
      ?AUTO_864 - BLOCK
      ?AUTO_863 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_862 ) ( ON-TABLE ?AUTO_861 ) ( ON ?AUTO_868 ?AUTO_861 ) ( CLEAR ?AUTO_869 ) ( ON ?AUTO_865 ?AUTO_868 ) ( CLEAR ?AUTO_864 ) ( ON ?AUTO_863 ?AUTO_865 ) ( CLEAR ?AUTO_863 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_863 ?AUTO_865 )
      ( MAKE-ON ?AUTO_861 ?AUTO_862 )
      ( MAKE-ON-VERIFY ?AUTO_861 ?AUTO_862 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_872 - BLOCK
      ?AUTO_873 - BLOCK
    )
    :vars
    (
      ?AUTO_879 - BLOCK
      ?AUTO_876 - BLOCK
      ?AUTO_880 - BLOCK
      ?AUTO_877 - BLOCK
      ?AUTO_878 - BLOCK
      ?AUTO_881 - BLOCK
      ?AUTO_882 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_873 ) ( ON-TABLE ?AUTO_872 ) ( ON ?AUTO_879 ?AUTO_872 ) ( CLEAR ?AUTO_876 ) ( ON ?AUTO_880 ?AUTO_879 ) ( CLEAR ?AUTO_877 ) ( ON ?AUTO_878 ?AUTO_880 ) ( CLEAR ?AUTO_878 ) ( HOLDING ?AUTO_881 ) ( CLEAR ?AUTO_882 ) )
    :subtasks
    ( ( !STACK ?AUTO_881 ?AUTO_882 )
      ( MAKE-ON ?AUTO_872 ?AUTO_873 )
      ( MAKE-ON-VERIFY ?AUTO_872 ?AUTO_873 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_919 - BLOCK
      ?AUTO_920 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_919 ) ( CLEAR ?AUTO_920 ) )
    :subtasks
    ( ( !STACK ?AUTO_919 ?AUTO_920 )
      ( MAKE-ON-VERIFY ?AUTO_919 ?AUTO_920 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_923 - BLOCK
      ?AUTO_924 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_924 ) ( ON-TABLE ?AUTO_923 ) ( CLEAR ?AUTO_923 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_923 )
      ( MAKE-ON ?AUTO_923 ?AUTO_924 )
      ( MAKE-ON-VERIFY ?AUTO_923 ?AUTO_924 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_928 - BLOCK
      ?AUTO_929 - BLOCK
    )
    :vars
    (
      ?AUTO_933 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_928 ) ( CLEAR ?AUTO_928 ) ( HOLDING ?AUTO_929 ) ( CLEAR ?AUTO_933 ) )
    :subtasks
    ( ( !STACK ?AUTO_929 ?AUTO_933 )
      ( MAKE-ON ?AUTO_928 ?AUTO_929 )
      ( MAKE-ON-VERIFY ?AUTO_928 ?AUTO_929 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1251 - BLOCK
      ?AUTO_1252 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1251 ) ( CLEAR ?AUTO_1252 ) )
    :subtasks
    ( ( !STACK ?AUTO_1251 ?AUTO_1252 )
      ( MAKE-ON-VERIFY ?AUTO_1251 ?AUTO_1252 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1255 - BLOCK
      ?AUTO_1256 - BLOCK
    )
    :vars
    (
      ?AUTO_1260 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1256 ) ( ON ?AUTO_1255 ?AUTO_1260 ) ( CLEAR ?AUTO_1255 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1255 ?AUTO_1260 )
      ( MAKE-ON ?AUTO_1255 ?AUTO_1256 )
      ( MAKE-ON-VERIFY ?AUTO_1255 ?AUTO_1256 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1261 - BLOCK
      ?AUTO_1262 - BLOCK
    )
    :vars
    (
      ?AUTO_1265 - BLOCK
      ?AUTO_1266 - BLOCK
      ?AUTO_1267 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1262 ) ( ON ?AUTO_1261 ?AUTO_1265 ) ( CLEAR ?AUTO_1261 ) ( HOLDING ?AUTO_1266 ) ( CLEAR ?AUTO_1267 ) )
    :subtasks
    ( ( !STACK ?AUTO_1266 ?AUTO_1267 )
      ( MAKE-ON ?AUTO_1261 ?AUTO_1262 )
      ( MAKE-ON-VERIFY ?AUTO_1261 ?AUTO_1262 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1346 - BLOCK
      ?AUTO_1347 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1346 ) ( CLEAR ?AUTO_1347 ) )
    :subtasks
    ( ( !STACK ?AUTO_1346 ?AUTO_1347 )
      ( MAKE-ON-VERIFY ?AUTO_1346 ?AUTO_1347 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1350 - BLOCK
      ?AUTO_1351 - BLOCK
    )
    :vars
    (
      ?AUTO_1355 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1351 ) ( ON ?AUTO_1350 ?AUTO_1355 ) ( CLEAR ?AUTO_1350 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1350 ?AUTO_1355 )
      ( MAKE-ON ?AUTO_1350 ?AUTO_1351 )
      ( MAKE-ON-VERIFY ?AUTO_1350 ?AUTO_1351 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1356 - BLOCK
      ?AUTO_1357 - BLOCK
    )
    :vars
    (
      ?AUTO_1360 - BLOCK
      ?AUTO_1361 - BLOCK
      ?AUTO_1362 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1357 ) ( ON ?AUTO_1356 ?AUTO_1360 ) ( CLEAR ?AUTO_1356 ) ( HOLDING ?AUTO_1361 ) ( CLEAR ?AUTO_1362 ) )
    :subtasks
    ( ( !STACK ?AUTO_1361 ?AUTO_1362 )
      ( MAKE-ON ?AUTO_1356 ?AUTO_1357 )
      ( MAKE-ON-VERIFY ?AUTO_1356 ?AUTO_1357 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1363 - BLOCK
      ?AUTO_1364 - BLOCK
    )
    :vars
    (
      ?AUTO_1367 - BLOCK
      ?AUTO_1369 - BLOCK
      ?AUTO_1368 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1364 ) ( ON ?AUTO_1363 ?AUTO_1367 ) ( CLEAR ?AUTO_1369 ) ( ON ?AUTO_1368 ?AUTO_1363 ) ( CLEAR ?AUTO_1368 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1368 ?AUTO_1363 )
      ( MAKE-ON ?AUTO_1363 ?AUTO_1364 )
      ( MAKE-ON-VERIFY ?AUTO_1363 ?AUTO_1364 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1372 - BLOCK
      ?AUTO_1373 - BLOCK
    )
    :vars
    (
      ?AUTO_1378 - BLOCK
      ?AUTO_1375 - BLOCK
      ?AUTO_1374 - BLOCK
      ?AUTO_1380 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1372 ?AUTO_1378 ) ( CLEAR ?AUTO_1375 ) ( ON ?AUTO_1374 ?AUTO_1372 ) ( CLEAR ?AUTO_1374 ) ( HOLDING ?AUTO_1373 ) ( CLEAR ?AUTO_1380 ) )
    :subtasks
    ( ( !STACK ?AUTO_1373 ?AUTO_1380 )
      ( MAKE-ON ?AUTO_1372 ?AUTO_1373 )
      ( MAKE-ON-VERIFY ?AUTO_1372 ?AUTO_1373 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1383 - BLOCK
      ?AUTO_1384 - BLOCK
    )
    :vars
    (
      ?AUTO_1389 - BLOCK
      ?AUTO_1385 - BLOCK
      ?AUTO_1388 - BLOCK
      ?AUTO_1390 - BLOCK
      ?AUTO_1391 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1384 ) ( ON ?AUTO_1383 ?AUTO_1389 ) ( CLEAR ?AUTO_1385 ) ( ON ?AUTO_1388 ?AUTO_1383 ) ( CLEAR ?AUTO_1388 ) ( HOLDING ?AUTO_1390 ) ( CLEAR ?AUTO_1391 ) )
    :subtasks
    ( ( !STACK ?AUTO_1390 ?AUTO_1391 )
      ( MAKE-ON ?AUTO_1383 ?AUTO_1384 )
      ( MAKE-ON-VERIFY ?AUTO_1383 ?AUTO_1384 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1605 - BLOCK
      ?AUTO_1606 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1605 ) ( CLEAR ?AUTO_1606 ) )
    :subtasks
    ( ( !STACK ?AUTO_1605 ?AUTO_1606 )
      ( MAKE-ON-VERIFY ?AUTO_1605 ?AUTO_1606 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1609 - BLOCK
      ?AUTO_1610 - BLOCK
    )
    :vars
    (
      ?AUTO_1614 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1610 ) ( ON ?AUTO_1609 ?AUTO_1614 ) ( CLEAR ?AUTO_1609 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1609 ?AUTO_1614 )
      ( MAKE-ON ?AUTO_1609 ?AUTO_1610 )
      ( MAKE-ON-VERIFY ?AUTO_1609 ?AUTO_1610 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1615 - BLOCK
      ?AUTO_1616 - BLOCK
    )
    :vars
    (
      ?AUTO_1619 - BLOCK
      ?AUTO_1621 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1615 ?AUTO_1619 ) ( CLEAR ?AUTO_1615 ) ( HOLDING ?AUTO_1616 ) ( CLEAR ?AUTO_1621 ) )
    :subtasks
    ( ( !STACK ?AUTO_1616 ?AUTO_1621 )
      ( MAKE-ON ?AUTO_1615 ?AUTO_1616 )
      ( MAKE-ON-VERIFY ?AUTO_1615 ?AUTO_1616 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1624 - BLOCK
      ?AUTO_1625 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1624 ) ( CLEAR ?AUTO_1625 ) )
    :subtasks
    ( ( !STACK ?AUTO_1624 ?AUTO_1625 )
      ( MAKE-ON-VERIFY ?AUTO_1624 ?AUTO_1625 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1628 - BLOCK
      ?AUTO_1629 - BLOCK
    )
    :vars
    (
      ?AUTO_1633 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1629 ) ( ON ?AUTO_1628 ?AUTO_1633 ) ( CLEAR ?AUTO_1628 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1628 ?AUTO_1633 )
      ( MAKE-ON ?AUTO_1628 ?AUTO_1629 )
      ( MAKE-ON-VERIFY ?AUTO_1628 ?AUTO_1629 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1635 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1635 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1635 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1635 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1637 - BLOCK
    )
    :vars
    (
      ?AUTO_1640 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1637 ?AUTO_1640 ) ( CLEAR ?AUTO_1637 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1637 ?AUTO_1640 )
      ( MAKE-ON-TABLE ?AUTO_1637 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1637 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1641 - BLOCK
    )
    :vars
    (
      ?AUTO_1643 - BLOCK
      ?AUTO_1644 - BLOCK
      ?AUTO_1645 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1641 ?AUTO_1643 ) ( CLEAR ?AUTO_1641 ) ( HOLDING ?AUTO_1644 ) ( CLEAR ?AUTO_1645 ) )
    :subtasks
    ( ( !STACK ?AUTO_1644 ?AUTO_1645 )
      ( MAKE-ON-TABLE ?AUTO_1641 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1641 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1646 - BLOCK
    )
    :vars
    (
      ?AUTO_1648 - BLOCK
      ?AUTO_1650 - BLOCK
      ?AUTO_1649 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1646 ?AUTO_1648 ) ( CLEAR ?AUTO_1650 ) ( ON ?AUTO_1649 ?AUTO_1646 ) ( CLEAR ?AUTO_1649 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1649 ?AUTO_1646 )
      ( MAKE-ON-TABLE ?AUTO_1646 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1646 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1655 - BLOCK
      ?AUTO_1656 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1655 ) ( CLEAR ?AUTO_1656 ) )
    :subtasks
    ( ( !STACK ?AUTO_1655 ?AUTO_1656 )
      ( MAKE-ON-VERIFY ?AUTO_1655 ?AUTO_1656 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1659 - BLOCK
      ?AUTO_1660 - BLOCK
    )
    :vars
    (
      ?AUTO_1664 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1660 ) ( ON ?AUTO_1659 ?AUTO_1664 ) ( CLEAR ?AUTO_1659 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1659 ?AUTO_1664 )
      ( MAKE-ON ?AUTO_1659 ?AUTO_1660 )
      ( MAKE-ON-VERIFY ?AUTO_1659 ?AUTO_1660 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1665 - BLOCK
      ?AUTO_1666 - BLOCK
    )
    :vars
    (
      ?AUTO_1667 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1665 ?AUTO_1667 ) ( CLEAR ?AUTO_1665 ) ( HOLDING ?AUTO_1666 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1666 )
      ( MAKE-ON ?AUTO_1665 ?AUTO_1666 )
      ( MAKE-ON-VERIFY ?AUTO_1665 ?AUTO_1666 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1683 - BLOCK
      ?AUTO_1684 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1683 ) ( CLEAR ?AUTO_1684 ) )
    :subtasks
    ( ( !STACK ?AUTO_1683 ?AUTO_1684 )
      ( MAKE-ON-VERIFY ?AUTO_1683 ?AUTO_1684 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1687 - BLOCK
      ?AUTO_1688 - BLOCK
    )
    :vars
    (
      ?AUTO_1692 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1688 ) ( ON ?AUTO_1687 ?AUTO_1692 ) ( CLEAR ?AUTO_1687 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1687 ?AUTO_1692 )
      ( MAKE-ON ?AUTO_1687 ?AUTO_1688 )
      ( MAKE-ON-VERIFY ?AUTO_1687 ?AUTO_1688 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1693 - BLOCK
      ?AUTO_1694 - BLOCK
    )
    :vars
    (
      ?AUTO_1697 - BLOCK
      ?AUTO_1699 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1693 ?AUTO_1697 ) ( CLEAR ?AUTO_1693 ) ( HOLDING ?AUTO_1694 ) ( CLEAR ?AUTO_1699 ) )
    :subtasks
    ( ( !STACK ?AUTO_1694 ?AUTO_1699 )
      ( MAKE-ON ?AUTO_1693 ?AUTO_1694 )
      ( MAKE-ON-VERIFY ?AUTO_1693 ?AUTO_1694 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1702 - BLOCK
      ?AUTO_1703 - BLOCK
    )
    :vars
    (
      ?AUTO_1706 - BLOCK
      ?AUTO_1707 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1703 ) ( ON ?AUTO_1702 ?AUTO_1706 ) ( CLEAR ?AUTO_1702 ) ( HOLDING ?AUTO_1707 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1707 )
      ( MAKE-ON ?AUTO_1702 ?AUTO_1703 )
      ( MAKE-ON-VERIFY ?AUTO_1702 ?AUTO_1703 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1708 - BLOCK
      ?AUTO_1709 - BLOCK
    )
    :vars
    (
      ?AUTO_1712 - BLOCK
      ?AUTO_1713 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1709 ) ( ON ?AUTO_1708 ?AUTO_1712 ) ( ON ?AUTO_1713 ?AUTO_1708 ) ( CLEAR ?AUTO_1713 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1713 ?AUTO_1708 )
      ( MAKE-ON ?AUTO_1708 ?AUTO_1709 )
      ( MAKE-ON-VERIFY ?AUTO_1708 ?AUTO_1709 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1716 - BLOCK
      ?AUTO_1717 - BLOCK
    )
    :vars
    (
      ?AUTO_1718 - BLOCK
      ?AUTO_1721 - BLOCK
      ?AUTO_1723 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1716 ?AUTO_1718 ) ( ON ?AUTO_1721 ?AUTO_1716 ) ( CLEAR ?AUTO_1721 ) ( HOLDING ?AUTO_1717 ) ( CLEAR ?AUTO_1723 ) )
    :subtasks
    ( ( !STACK ?AUTO_1717 ?AUTO_1723 )
      ( MAKE-ON ?AUTO_1716 ?AUTO_1717 )
      ( MAKE-ON-VERIFY ?AUTO_1716 ?AUTO_1717 ) )
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
      ?AUTO_1730 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1724 ?AUTO_1726 ) ( ON ?AUTO_1727 ?AUTO_1724 ) ( CLEAR ?AUTO_1730 ) ( ON ?AUTO_1725 ?AUTO_1727 ) ( CLEAR ?AUTO_1725 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1725 ?AUTO_1727 )
      ( MAKE-ON ?AUTO_1724 ?AUTO_1725 )
      ( MAKE-ON-VERIFY ?AUTO_1724 ?AUTO_1725 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1735 - BLOCK
      ?AUTO_1736 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1735 ) ( CLEAR ?AUTO_1736 ) )
    :subtasks
    ( ( !STACK ?AUTO_1735 ?AUTO_1736 )
      ( MAKE-ON-VERIFY ?AUTO_1735 ?AUTO_1736 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1739 - BLOCK
      ?AUTO_1740 - BLOCK
    )
    :vars
    (
      ?AUTO_1744 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1740 ) ( ON ?AUTO_1739 ?AUTO_1744 ) ( CLEAR ?AUTO_1739 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1739 ?AUTO_1744 )
      ( MAKE-ON ?AUTO_1739 ?AUTO_1740 )
      ( MAKE-ON-VERIFY ?AUTO_1739 ?AUTO_1740 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1745 - BLOCK
      ?AUTO_1746 - BLOCK
    )
    :vars
    (
      ?AUTO_1749 - BLOCK
      ?AUTO_1750 - BLOCK
      ?AUTO_1751 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1746 ) ( ON ?AUTO_1745 ?AUTO_1749 ) ( CLEAR ?AUTO_1745 ) ( HOLDING ?AUTO_1750 ) ( CLEAR ?AUTO_1751 ) )
    :subtasks
    ( ( !STACK ?AUTO_1750 ?AUTO_1751 )
      ( MAKE-ON ?AUTO_1745 ?AUTO_1746 )
      ( MAKE-ON-VERIFY ?AUTO_1745 ?AUTO_1746 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1752 - BLOCK
      ?AUTO_1753 - BLOCK
    )
    :vars
    (
      ?AUTO_1756 - BLOCK
      ?AUTO_1758 - BLOCK
      ?AUTO_1757 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1752 ?AUTO_1756 ) ( CLEAR ?AUTO_1752 ) ( CLEAR ?AUTO_1758 ) ( ON ?AUTO_1757 ?AUTO_1753 ) ( CLEAR ?AUTO_1757 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1757 ?AUTO_1753 )
      ( MAKE-ON ?AUTO_1752 ?AUTO_1753 )
      ( MAKE-ON-VERIFY ?AUTO_1752 ?AUTO_1753 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1761 - BLOCK
      ?AUTO_1762 - BLOCK
    )
    :vars
    (
      ?AUTO_1765 - BLOCK
      ?AUTO_1764 - BLOCK
      ?AUTO_1763 - BLOCK
      ?AUTO_1769 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1761 ?AUTO_1765 ) ( CLEAR ?AUTO_1761 ) ( ON ?AUTO_1764 ?AUTO_1762 ) ( CLEAR ?AUTO_1764 ) ( HOLDING ?AUTO_1763 ) ( CLEAR ?AUTO_1769 ) )
    :subtasks
    ( ( !STACK ?AUTO_1763 ?AUTO_1769 )
      ( MAKE-ON ?AUTO_1761 ?AUTO_1762 )
      ( MAKE-ON-VERIFY ?AUTO_1761 ?AUTO_1762 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1770 - BLOCK
      ?AUTO_1771 - BLOCK
    )
    :vars
    (
      ?AUTO_1777 - BLOCK
      ?AUTO_1775 - BLOCK
      ?AUTO_1774 - BLOCK
      ?AUTO_1772 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1770 ?AUTO_1777 ) ( ON ?AUTO_1775 ?AUTO_1771 ) ( CLEAR ?AUTO_1775 ) ( CLEAR ?AUTO_1774 ) ( ON ?AUTO_1772 ?AUTO_1770 ) ( CLEAR ?AUTO_1772 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1772 ?AUTO_1770 )
      ( MAKE-ON ?AUTO_1770 ?AUTO_1771 )
      ( MAKE-ON-VERIFY ?AUTO_1770 ?AUTO_1771 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1780 - BLOCK
      ?AUTO_1781 - BLOCK
    )
    :vars
    (
      ?AUTO_1787 - BLOCK
      ?AUTO_1785 - BLOCK
      ?AUTO_1786 - BLOCK
      ?AUTO_1784 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1780 ?AUTO_1787 ) ( ON ?AUTO_1785 ?AUTO_1781 ) ( CLEAR ?AUTO_1785 ) ( ON ?AUTO_1786 ?AUTO_1780 ) ( CLEAR ?AUTO_1786 ) ( HOLDING ?AUTO_1784 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1784 )
      ( MAKE-ON ?AUTO_1780 ?AUTO_1781 )
      ( MAKE-ON-VERIFY ?AUTO_1780 ?AUTO_1781 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1789 - BLOCK
      ?AUTO_1790 - BLOCK
    )
    :vars
    (
      ?AUTO_1793 - BLOCK
      ?AUTO_1791 - BLOCK
      ?AUTO_1792 - BLOCK
      ?AUTO_1796 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1789 ?AUTO_1793 ) ( ON ?AUTO_1791 ?AUTO_1790 ) ( ON ?AUTO_1792 ?AUTO_1789 ) ( CLEAR ?AUTO_1792 ) ( ON ?AUTO_1796 ?AUTO_1791 ) ( CLEAR ?AUTO_1796 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1796 ?AUTO_1791 )
      ( MAKE-ON ?AUTO_1789 ?AUTO_1790 )
      ( MAKE-ON-VERIFY ?AUTO_1789 ?AUTO_1790 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1799 - BLOCK
      ?AUTO_1800 - BLOCK
    )
    :vars
    (
      ?AUTO_1805 - BLOCK
      ?AUTO_1804 - BLOCK
      ?AUTO_1806 - BLOCK
      ?AUTO_1802 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1799 ?AUTO_1805 ) ( ON ?AUTO_1804 ?AUTO_1800 ) ( ON ?AUTO_1806 ?AUTO_1804 ) ( CLEAR ?AUTO_1806 ) ( HOLDING ?AUTO_1802 ) ( CLEAR ?AUTO_1799 ) )
    :subtasks
    ( ( !STACK ?AUTO_1802 ?AUTO_1799 )
      ( MAKE-ON ?AUTO_1799 ?AUTO_1800 )
      ( MAKE-ON-VERIFY ?AUTO_1799 ?AUTO_1800 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1809 - BLOCK
      ?AUTO_1810 - BLOCK
    )
    :vars
    (
      ?AUTO_1812 - BLOCK
      ?AUTO_1815 - BLOCK
      ?AUTO_1816 - BLOCK
      ?AUTO_1811 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1809 ?AUTO_1812 ) ( ON ?AUTO_1815 ?AUTO_1810 ) ( ON ?AUTO_1816 ?AUTO_1815 ) ( CLEAR ?AUTO_1809 ) ( ON ?AUTO_1811 ?AUTO_1816 ) ( CLEAR ?AUTO_1811 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1811 ?AUTO_1816 )
      ( MAKE-ON ?AUTO_1809 ?AUTO_1810 )
      ( MAKE-ON-VERIFY ?AUTO_1809 ?AUTO_1810 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1821 - BLOCK
      ?AUTO_1822 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1821 ) ( CLEAR ?AUTO_1822 ) )
    :subtasks
    ( ( !STACK ?AUTO_1821 ?AUTO_1822 )
      ( MAKE-ON-VERIFY ?AUTO_1821 ?AUTO_1822 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1825 - BLOCK
      ?AUTO_1826 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1826 ) ( ON-TABLE ?AUTO_1825 ) ( CLEAR ?AUTO_1825 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_1825 )
      ( MAKE-ON ?AUTO_1825 ?AUTO_1826 )
      ( MAKE-ON-VERIFY ?AUTO_1825 ?AUTO_1826 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1830 - BLOCK
      ?AUTO_1831 - BLOCK
    )
    :vars
    (
      ?AUTO_1834 - BLOCK
      ?AUTO_1835 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1831 ) ( ON-TABLE ?AUTO_1830 ) ( CLEAR ?AUTO_1830 ) ( HOLDING ?AUTO_1834 ) ( CLEAR ?AUTO_1835 ) )
    :subtasks
    ( ( !STACK ?AUTO_1834 ?AUTO_1835 )
      ( MAKE-ON ?AUTO_1830 ?AUTO_1831 )
      ( MAKE-ON-VERIFY ?AUTO_1830 ?AUTO_1831 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1838 - BLOCK
      ?AUTO_1839 - BLOCK
    )
    :vars
    (
      ?AUTO_1843 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1838 ) ( CLEAR ?AUTO_1838 ) ( HOLDING ?AUTO_1839 ) ( CLEAR ?AUTO_1843 ) )
    :subtasks
    ( ( !STACK ?AUTO_1839 ?AUTO_1843 )
      ( MAKE-ON ?AUTO_1838 ?AUTO_1839 )
      ( MAKE-ON-VERIFY ?AUTO_1838 ?AUTO_1839 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1852 - BLOCK
      ?AUTO_1853 - BLOCK
    )
    :vars
    (
      ?AUTO_1855 - BLOCK
      ?AUTO_1857 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1852 ) ( CLEAR ?AUTO_1852 ) ( CLEAR ?AUTO_1855 ) ( ON ?AUTO_1857 ?AUTO_1853 ) ( CLEAR ?AUTO_1857 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1857 ?AUTO_1853 )
      ( MAKE-ON ?AUTO_1852 ?AUTO_1853 )
      ( MAKE-ON-VERIFY ?AUTO_1852 ?AUTO_1853 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1860 - BLOCK
      ?AUTO_1861 - BLOCK
    )
    :vars
    (
      ?AUTO_1864 - BLOCK
      ?AUTO_1865 - BLOCK
      ?AUTO_1866 - BLOCK
      ?AUTO_1867 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1860 ) ( CLEAR ?AUTO_1860 ) ( CLEAR ?AUTO_1864 ) ( ON ?AUTO_1865 ?AUTO_1861 ) ( CLEAR ?AUTO_1865 ) ( HOLDING ?AUTO_1866 ) ( CLEAR ?AUTO_1867 ) )
    :subtasks
    ( ( !STACK ?AUTO_1866 ?AUTO_1867 )
      ( MAKE-ON ?AUTO_1860 ?AUTO_1861 )
      ( MAKE-ON-VERIFY ?AUTO_1860 ?AUTO_1861 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1868 - BLOCK
      ?AUTO_1869 - BLOCK
    )
    :vars
    (
      ?AUTO_1873 - BLOCK
      ?AUTO_1871 - BLOCK
      ?AUTO_1875 - BLOCK
      ?AUTO_1874 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1868 ) ( CLEAR ?AUTO_1868 ) ( CLEAR ?AUTO_1873 ) ( ON ?AUTO_1871 ?AUTO_1869 ) ( CLEAR ?AUTO_1875 ) ( ON ?AUTO_1874 ?AUTO_1871 ) ( CLEAR ?AUTO_1874 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1874 ?AUTO_1871 )
      ( MAKE-ON ?AUTO_1868 ?AUTO_1869 )
      ( MAKE-ON-VERIFY ?AUTO_1868 ?AUTO_1869 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1877 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1877 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1877 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1877 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1879 - BLOCK
    )
    :vars
    (
      ?AUTO_1882 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1879 ?AUTO_1882 ) ( CLEAR ?AUTO_1879 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1879 ?AUTO_1882 )
      ( MAKE-ON-TABLE ?AUTO_1879 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1879 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1885 - BLOCK
      ?AUTO_1886 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1885 ) ( CLEAR ?AUTO_1886 ) )
    :subtasks
    ( ( !STACK ?AUTO_1885 ?AUTO_1886 )
      ( MAKE-ON-VERIFY ?AUTO_1885 ?AUTO_1886 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1889 - BLOCK
      ?AUTO_1890 - BLOCK
    )
    :vars
    (
      ?AUTO_1894 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1890 ) ( ON ?AUTO_1889 ?AUTO_1894 ) ( CLEAR ?AUTO_1889 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1889 ?AUTO_1894 )
      ( MAKE-ON ?AUTO_1889 ?AUTO_1890 )
      ( MAKE-ON-VERIFY ?AUTO_1889 ?AUTO_1890 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1895 - BLOCK
      ?AUTO_1896 - BLOCK
    )
    :vars
    (
      ?AUTO_1899 - BLOCK
      ?AUTO_1900 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1896 ) ( ON ?AUTO_1895 ?AUTO_1899 ) ( CLEAR ?AUTO_1895 ) ( HOLDING ?AUTO_1900 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1900 )
      ( MAKE-ON ?AUTO_1895 ?AUTO_1896 )
      ( MAKE-ON-VERIFY ?AUTO_1895 ?AUTO_1896 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1901 - BLOCK
      ?AUTO_1902 - BLOCK
    )
    :vars
    (
      ?AUTO_1905 - BLOCK
      ?AUTO_1906 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1901 ?AUTO_1905 ) ( CLEAR ?AUTO_1901 ) ( ON ?AUTO_1906 ?AUTO_1902 ) ( CLEAR ?AUTO_1906 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1906 ?AUTO_1902 )
      ( MAKE-ON ?AUTO_1901 ?AUTO_1902 )
      ( MAKE-ON-VERIFY ?AUTO_1901 ?AUTO_1902 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1911 - BLOCK
      ?AUTO_1912 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1911 ) ( CLEAR ?AUTO_1912 ) )
    :subtasks
    ( ( !STACK ?AUTO_1911 ?AUTO_1912 )
      ( MAKE-ON-VERIFY ?AUTO_1911 ?AUTO_1912 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1915 - BLOCK
      ?AUTO_1916 - BLOCK
    )
    :vars
    (
      ?AUTO_1920 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1916 ) ( ON ?AUTO_1915 ?AUTO_1920 ) ( CLEAR ?AUTO_1915 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1915 ?AUTO_1920 )
      ( MAKE-ON ?AUTO_1915 ?AUTO_1916 )
      ( MAKE-ON-VERIFY ?AUTO_1915 ?AUTO_1916 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1921 - BLOCK
      ?AUTO_1922 - BLOCK
    )
    :vars
    (
      ?AUTO_1925 - BLOCK
      ?AUTO_1926 - BLOCK
      ?AUTO_1927 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1922 ) ( ON ?AUTO_1921 ?AUTO_1925 ) ( CLEAR ?AUTO_1921 ) ( HOLDING ?AUTO_1926 ) ( CLEAR ?AUTO_1927 ) )
    :subtasks
    ( ( !STACK ?AUTO_1926 ?AUTO_1927 )
      ( MAKE-ON ?AUTO_1921 ?AUTO_1922 )
      ( MAKE-ON-VERIFY ?AUTO_1921 ?AUTO_1922 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1936 - BLOCK
      ?AUTO_1937 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1936 ) ( CLEAR ?AUTO_1937 ) )
    :subtasks
    ( ( !STACK ?AUTO_1936 ?AUTO_1937 )
      ( MAKE-ON-VERIFY ?AUTO_1936 ?AUTO_1937 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1940 - BLOCK
      ?AUTO_1941 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1941 ) ( ON-TABLE ?AUTO_1940 ) ( CLEAR ?AUTO_1940 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_1940 )
      ( MAKE-ON ?AUTO_1940 ?AUTO_1941 )
      ( MAKE-ON-VERIFY ?AUTO_1940 ?AUTO_1941 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1945 - BLOCK
      ?AUTO_1946 - BLOCK
    )
    :vars
    (
      ?AUTO_1949 - BLOCK
      ?AUTO_1950 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1946 ) ( ON-TABLE ?AUTO_1945 ) ( CLEAR ?AUTO_1945 ) ( HOLDING ?AUTO_1949 ) ( CLEAR ?AUTO_1950 ) )
    :subtasks
    ( ( !STACK ?AUTO_1949 ?AUTO_1950 )
      ( MAKE-ON ?AUTO_1945 ?AUTO_1946 )
      ( MAKE-ON-VERIFY ?AUTO_1945 ?AUTO_1946 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1951 - BLOCK
      ?AUTO_1952 - BLOCK
    )
    :vars
    (
      ?AUTO_1954 - BLOCK
      ?AUTO_1956 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1952 ) ( ON-TABLE ?AUTO_1951 ) ( CLEAR ?AUTO_1954 ) ( ON ?AUTO_1956 ?AUTO_1951 ) ( CLEAR ?AUTO_1956 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1956 ?AUTO_1951 )
      ( MAKE-ON ?AUTO_1951 ?AUTO_1952 )
      ( MAKE-ON-VERIFY ?AUTO_1951 ?AUTO_1952 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1959 - BLOCK
      ?AUTO_1960 - BLOCK
    )
    :vars
    (
      ?AUTO_1963 - BLOCK
      ?AUTO_1964 - BLOCK
      ?AUTO_1966 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_1959 ) ( CLEAR ?AUTO_1963 ) ( ON ?AUTO_1964 ?AUTO_1959 ) ( CLEAR ?AUTO_1964 ) ( HOLDING ?AUTO_1960 ) ( CLEAR ?AUTO_1966 ) )
    :subtasks
    ( ( !STACK ?AUTO_1960 ?AUTO_1966 )
      ( MAKE-ON ?AUTO_1959 ?AUTO_1960 )
      ( MAKE-ON-VERIFY ?AUTO_1959 ?AUTO_1960 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_1969 - BLOCK
      ?AUTO_1970 - BLOCK
    )
    :vars
    (
      ?AUTO_1972 - BLOCK
      ?AUTO_1973 - BLOCK
      ?AUTO_1975 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_1970 ) ( ON-TABLE ?AUTO_1969 ) ( CLEAR ?AUTO_1972 ) ( ON ?AUTO_1973 ?AUTO_1969 ) ( CLEAR ?AUTO_1973 ) ( HOLDING ?AUTO_1975 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1975 )
      ( MAKE-ON ?AUTO_1969 ?AUTO_1970 )
      ( MAKE-ON-VERIFY ?AUTO_1969 ?AUTO_1970 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1979 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_1979 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_1979 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1979 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1981 - BLOCK
    )
    :vars
    (
      ?AUTO_1984 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1981 ?AUTO_1984 ) ( CLEAR ?AUTO_1981 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1981 ?AUTO_1984 )
      ( MAKE-ON-TABLE ?AUTO_1981 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1981 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1985 - BLOCK
    )
    :vars
    (
      ?AUTO_1987 - BLOCK
      ?AUTO_1988 - BLOCK
      ?AUTO_1989 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1985 ?AUTO_1987 ) ( CLEAR ?AUTO_1985 ) ( HOLDING ?AUTO_1988 ) ( CLEAR ?AUTO_1989 ) )
    :subtasks
    ( ( !STACK ?AUTO_1988 ?AUTO_1989 )
      ( MAKE-ON-TABLE ?AUTO_1985 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1985 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_1994 - BLOCK
    )
    :vars
    (
      ?AUTO_1997 - BLOCK
      ?AUTO_1995 - BLOCK
      ?AUTO_1998 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_1994 ?AUTO_1997 ) ( CLEAR ?AUTO_1995 ) ( ON ?AUTO_1998 ?AUTO_1994 ) ( CLEAR ?AUTO_1998 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_1998 ?AUTO_1994 )
      ( MAKE-ON-TABLE ?AUTO_1994 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_1994 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2001 - BLOCK
    )
    :vars
    (
      ?AUTO_2004 - BLOCK
      ?AUTO_2003 - BLOCK
      ?AUTO_2005 - BLOCK
      ?AUTO_2006 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2001 ?AUTO_2004 ) ( CLEAR ?AUTO_2003 ) ( ON ?AUTO_2005 ?AUTO_2001 ) ( CLEAR ?AUTO_2005 ) ( HOLDING ?AUTO_2006 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2006 )
      ( MAKE-ON-TABLE ?AUTO_2001 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2001 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2010 - BLOCK
      ?AUTO_2011 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2010 ) ( CLEAR ?AUTO_2011 ) )
    :subtasks
    ( ( !STACK ?AUTO_2010 ?AUTO_2011 )
      ( MAKE-ON-VERIFY ?AUTO_2010 ?AUTO_2011 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2014 - BLOCK
      ?AUTO_2015 - BLOCK
    )
    :vars
    (
      ?AUTO_2019 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2015 ) ( ON ?AUTO_2014 ?AUTO_2019 ) ( CLEAR ?AUTO_2014 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2014 ?AUTO_2019 )
      ( MAKE-ON ?AUTO_2014 ?AUTO_2015 )
      ( MAKE-ON-VERIFY ?AUTO_2014 ?AUTO_2015 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2020 - BLOCK
      ?AUTO_2021 - BLOCK
    )
    :vars
    (
      ?AUTO_2024 - BLOCK
      ?AUTO_2025 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2021 ) ( ON ?AUTO_2020 ?AUTO_2024 ) ( CLEAR ?AUTO_2020 ) ( HOLDING ?AUTO_2025 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2025 )
      ( MAKE-ON ?AUTO_2020 ?AUTO_2021 )
      ( MAKE-ON-VERIFY ?AUTO_2020 ?AUTO_2021 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2026 - BLOCK
      ?AUTO_2027 - BLOCK
    )
    :vars
    (
      ?AUTO_2030 - BLOCK
      ?AUTO_2031 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2027 ) ( ON ?AUTO_2026 ?AUTO_2030 ) ( ON ?AUTO_2031 ?AUTO_2026 ) ( CLEAR ?AUTO_2031 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2031 ?AUTO_2026 )
      ( MAKE-ON ?AUTO_2026 ?AUTO_2027 )
      ( MAKE-ON-VERIFY ?AUTO_2026 ?AUTO_2027 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2034 - BLOCK
      ?AUTO_2035 - BLOCK
    )
    :vars
    (
      ?AUTO_2039 - BLOCK
      ?AUTO_2036 - BLOCK
      ?AUTO_2040 - BLOCK
      ?AUTO_2041 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2035 ) ( ON ?AUTO_2034 ?AUTO_2039 ) ( ON ?AUTO_2036 ?AUTO_2034 ) ( CLEAR ?AUTO_2036 ) ( HOLDING ?AUTO_2040 ) ( CLEAR ?AUTO_2041 ) )
    :subtasks
    ( ( !STACK ?AUTO_2040 ?AUTO_2041 )
      ( MAKE-ON ?AUTO_2034 ?AUTO_2035 )
      ( MAKE-ON-VERIFY ?AUTO_2034 ?AUTO_2035 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2050 - BLOCK
      ?AUTO_2051 - BLOCK
    )
    :vars
    (
      ?AUTO_2054 - BLOCK
      ?AUTO_2053 - BLOCK
      ?AUTO_2057 - BLOCK
      ?AUTO_2052 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2051 ) ( ON ?AUTO_2050 ?AUTO_2054 ) ( ON ?AUTO_2053 ?AUTO_2050 ) ( CLEAR ?AUTO_2057 ) ( ON ?AUTO_2052 ?AUTO_2053 ) ( CLEAR ?AUTO_2052 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2052 ?AUTO_2053 )
      ( MAKE-ON ?AUTO_2050 ?AUTO_2051 )
      ( MAKE-ON-VERIFY ?AUTO_2050 ?AUTO_2051 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2060 - BLOCK
      ?AUTO_2061 - BLOCK
    )
    :vars
    (
      ?AUTO_2067 - BLOCK
      ?AUTO_2065 - BLOCK
      ?AUTO_2064 - BLOCK
      ?AUTO_2066 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2060 ?AUTO_2067 ) ( ON ?AUTO_2065 ?AUTO_2060 ) ( CLEAR ?AUTO_2064 ) ( ON ?AUTO_2066 ?AUTO_2065 ) ( CLEAR ?AUTO_2066 ) ( HOLDING ?AUTO_2061 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2061 )
      ( MAKE-ON ?AUTO_2060 ?AUTO_2061 )
      ( MAKE-ON-VERIFY ?AUTO_2060 ?AUTO_2061 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2073 - BLOCK
      ?AUTO_2074 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2073 ) ( CLEAR ?AUTO_2074 ) )
    :subtasks
    ( ( !STACK ?AUTO_2073 ?AUTO_2074 )
      ( MAKE-ON-VERIFY ?AUTO_2073 ?AUTO_2074 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2077 - BLOCK
      ?AUTO_2078 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2078 ) ( ON-TABLE ?AUTO_2077 ) ( CLEAR ?AUTO_2077 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_2077 )
      ( MAKE-ON ?AUTO_2077 ?AUTO_2078 )
      ( MAKE-ON-VERIFY ?AUTO_2077 ?AUTO_2078 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2082 - BLOCK
      ?AUTO_2083 - BLOCK
    )
    :vars
    (
      ?AUTO_2087 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2082 ) ( CLEAR ?AUTO_2082 ) ( HOLDING ?AUTO_2083 ) ( CLEAR ?AUTO_2087 ) )
    :subtasks
    ( ( !STACK ?AUTO_2083 ?AUTO_2087 )
      ( MAKE-ON ?AUTO_2082 ?AUTO_2083 )
      ( MAKE-ON-VERIFY ?AUTO_2082 ?AUTO_2083 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2211 - BLOCK
      ?AUTO_2212 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2211 ) ( CLEAR ?AUTO_2212 ) )
    :subtasks
    ( ( !STACK ?AUTO_2211 ?AUTO_2212 )
      ( MAKE-ON-VERIFY ?AUTO_2211 ?AUTO_2212 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2215 - BLOCK
      ?AUTO_2216 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2216 ) ( ON-TABLE ?AUTO_2215 ) ( CLEAR ?AUTO_2215 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_2215 )
      ( MAKE-ON ?AUTO_2215 ?AUTO_2216 )
      ( MAKE-ON-VERIFY ?AUTO_2215 ?AUTO_2216 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2220 - BLOCK
      ?AUTO_2221 - BLOCK
    )
    :vars
    (
      ?AUTO_2225 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2220 ) ( CLEAR ?AUTO_2220 ) ( HOLDING ?AUTO_2221 ) ( CLEAR ?AUTO_2225 ) )
    :subtasks
    ( ( !STACK ?AUTO_2221 ?AUTO_2225 )
      ( MAKE-ON ?AUTO_2220 ?AUTO_2221 )
      ( MAKE-ON-VERIFY ?AUTO_2220 ?AUTO_2221 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2228 - BLOCK
      ?AUTO_2229 - BLOCK
    )
    :vars
    (
      ?AUTO_2232 - BLOCK
      ?AUTO_2233 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2229 ) ( ON-TABLE ?AUTO_2228 ) ( CLEAR ?AUTO_2228 ) ( HOLDING ?AUTO_2232 ) ( CLEAR ?AUTO_2233 ) )
    :subtasks
    ( ( !STACK ?AUTO_2232 ?AUTO_2233 )
      ( MAKE-ON ?AUTO_2228 ?AUTO_2229 )
      ( MAKE-ON-VERIFY ?AUTO_2228 ?AUTO_2229 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2234 - BLOCK
      ?AUTO_2235 - BLOCK
    )
    :vars
    (
      ?AUTO_2239 - BLOCK
      ?AUTO_2238 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2235 ) ( ON-TABLE ?AUTO_2234 ) ( CLEAR ?AUTO_2239 ) ( ON ?AUTO_2238 ?AUTO_2234 ) ( CLEAR ?AUTO_2238 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2238 ?AUTO_2234 )
      ( MAKE-ON ?AUTO_2234 ?AUTO_2235 )
      ( MAKE-ON-VERIFY ?AUTO_2234 ?AUTO_2235 ) )
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
      ?AUTO_2247 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2242 ) ( CLEAR ?AUTO_2244 ) ( ON ?AUTO_2247 ?AUTO_2242 ) ( CLEAR ?AUTO_2247 ) ( HOLDING ?AUTO_2243 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2243 )
      ( MAKE-ON ?AUTO_2242 ?AUTO_2243 )
      ( MAKE-ON-VERIFY ?AUTO_2242 ?AUTO_2243 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2249 - BLOCK
      ?AUTO_2250 - BLOCK
    )
    :vars
    (
      ?AUTO_2251 - BLOCK
      ?AUTO_2254 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2249 ) ( CLEAR ?AUTO_2251 ) ( ON ?AUTO_2254 ?AUTO_2249 ) ( ON ?AUTO_2250 ?AUTO_2254 ) ( CLEAR ?AUTO_2250 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2250 ?AUTO_2254 )
      ( MAKE-ON ?AUTO_2249 ?AUTO_2250 )
      ( MAKE-ON-VERIFY ?AUTO_2249 ?AUTO_2250 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2257 - BLOCK
      ?AUTO_2258 - BLOCK
    )
    :vars
    (
      ?AUTO_2261 - BLOCK
      ?AUTO_2260 - BLOCK
      ?AUTO_2263 - BLOCK
      ?AUTO_2264 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2257 ) ( CLEAR ?AUTO_2261 ) ( ON ?AUTO_2260 ?AUTO_2257 ) ( ON ?AUTO_2258 ?AUTO_2260 ) ( CLEAR ?AUTO_2258 ) ( HOLDING ?AUTO_2263 ) ( CLEAR ?AUTO_2264 ) )
    :subtasks
    ( ( !STACK ?AUTO_2263 ?AUTO_2264 )
      ( MAKE-ON ?AUTO_2257 ?AUTO_2258 )
      ( MAKE-ON-VERIFY ?AUTO_2257 ?AUTO_2258 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2273 - BLOCK
      ?AUTO_2274 - BLOCK
    )
    :vars
    (
      ?AUTO_2276 - BLOCK
      ?AUTO_2277 - BLOCK
      ?AUTO_2275 - BLOCK
      ?AUTO_2279 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2273 ) ( CLEAR ?AUTO_2276 ) ( ON ?AUTO_2277 ?AUTO_2273 ) ( ON ?AUTO_2274 ?AUTO_2277 ) ( CLEAR ?AUTO_2275 ) ( ON ?AUTO_2279 ?AUTO_2274 ) ( CLEAR ?AUTO_2279 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2279 ?AUTO_2274 )
      ( MAKE-ON ?AUTO_2273 ?AUTO_2274 )
      ( MAKE-ON-VERIFY ?AUTO_2273 ?AUTO_2274 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2283 - BLOCK
      ?AUTO_2284 - BLOCK
    )
    :vars
    (
      ?AUTO_2287 - BLOCK
      ?AUTO_2289 - BLOCK
      ?AUTO_2288 - BLOCK
      ?AUTO_2290 - BLOCK
      ?AUTO_2291 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2283 ) ( CLEAR ?AUTO_2287 ) ( ON ?AUTO_2289 ?AUTO_2283 ) ( ON ?AUTO_2284 ?AUTO_2289 ) ( CLEAR ?AUTO_2288 ) ( ON ?AUTO_2290 ?AUTO_2284 ) ( CLEAR ?AUTO_2290 ) ( HOLDING ?AUTO_2291 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2291 )
      ( MAKE-ON ?AUTO_2283 ?AUTO_2284 )
      ( MAKE-ON-VERIFY ?AUTO_2283 ?AUTO_2284 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2293 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2293 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2293 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2293 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2295 - BLOCK
    )
    :vars
    (
      ?AUTO_2298 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2295 ?AUTO_2298 ) ( CLEAR ?AUTO_2295 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2295 ?AUTO_2298 )
      ( MAKE-ON-TABLE ?AUTO_2295 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2295 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2300 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2300 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2300 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2300 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2302 - BLOCK
    )
    :vars
    (
      ?AUTO_2305 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2302 ?AUTO_2305 ) ( CLEAR ?AUTO_2302 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2302 ?AUTO_2305 )
      ( MAKE-ON-TABLE ?AUTO_2302 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2302 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2306 - BLOCK
    )
    :vars
    (
      ?AUTO_2308 - BLOCK
      ?AUTO_2309 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2306 ?AUTO_2308 ) ( CLEAR ?AUTO_2306 ) ( HOLDING ?AUTO_2309 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2309 )
      ( MAKE-ON-TABLE ?AUTO_2306 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2306 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2312 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2312 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2312 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2312 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2314 - BLOCK
    )
    :vars
    (
      ?AUTO_2317 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2314 ?AUTO_2317 ) ( CLEAR ?AUTO_2314 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2314 ?AUTO_2317 )
      ( MAKE-ON-TABLE ?AUTO_2314 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2314 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2318 - BLOCK
    )
    :vars
    (
      ?AUTO_2320 - BLOCK
      ?AUTO_2321 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2318 ?AUTO_2320 ) ( CLEAR ?AUTO_2318 ) ( HOLDING ?AUTO_2321 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2321 )
      ( MAKE-ON-TABLE ?AUTO_2318 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2318 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2322 - BLOCK
    )
    :vars
    (
      ?AUTO_2324 - BLOCK
      ?AUTO_2325 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2322 ?AUTO_2324 ) ( ON ?AUTO_2325 ?AUTO_2322 ) ( CLEAR ?AUTO_2325 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2325 ?AUTO_2322 )
      ( MAKE-ON-TABLE ?AUTO_2322 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2322 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2328 - BLOCK
    )
    :vars
    (
      ?AUTO_2329 - BLOCK
      ?AUTO_2330 - BLOCK
      ?AUTO_2332 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2328 ?AUTO_2329 ) ( ON ?AUTO_2330 ?AUTO_2328 ) ( CLEAR ?AUTO_2330 ) ( HOLDING ?AUTO_2332 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2332 )
      ( MAKE-ON-TABLE ?AUTO_2328 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2328 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2335 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2335 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2335 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2335 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2337 - BLOCK
    )
    :vars
    (
      ?AUTO_2340 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2337 ?AUTO_2340 ) ( CLEAR ?AUTO_2337 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2337 ?AUTO_2340 )
      ( MAKE-ON-TABLE ?AUTO_2337 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2337 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2341 - BLOCK
    )
    :vars
    (
      ?AUTO_2343 - BLOCK
      ?AUTO_2344 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2341 ?AUTO_2343 ) ( CLEAR ?AUTO_2341 ) ( HOLDING ?AUTO_2344 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2344 )
      ( MAKE-ON-TABLE ?AUTO_2341 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2341 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2352 - BLOCK
      ?AUTO_2353 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2352 ) ( CLEAR ?AUTO_2353 ) )
    :subtasks
    ( ( !STACK ?AUTO_2352 ?AUTO_2353 )
      ( MAKE-ON-VERIFY ?AUTO_2352 ?AUTO_2353 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2356 - BLOCK
      ?AUTO_2357 - BLOCK
    )
    :vars
    (
      ?AUTO_2361 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2357 ) ( ON ?AUTO_2356 ?AUTO_2361 ) ( CLEAR ?AUTO_2356 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2356 ?AUTO_2361 )
      ( MAKE-ON ?AUTO_2356 ?AUTO_2357 )
      ( MAKE-ON-VERIFY ?AUTO_2356 ?AUTO_2357 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2362 - BLOCK
      ?AUTO_2363 - BLOCK
    )
    :vars
    (
      ?AUTO_2366 - BLOCK
      ?AUTO_2367 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2363 ) ( ON ?AUTO_2362 ?AUTO_2366 ) ( CLEAR ?AUTO_2362 ) ( HOLDING ?AUTO_2367 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2367 )
      ( MAKE-ON ?AUTO_2362 ?AUTO_2363 )
      ( MAKE-ON-VERIFY ?AUTO_2362 ?AUTO_2363 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2368 - BLOCK
      ?AUTO_2369 - BLOCK
    )
    :vars
    (
      ?AUTO_2372 - BLOCK
      ?AUTO_2373 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2369 ) ( ON ?AUTO_2368 ?AUTO_2372 ) ( ON ?AUTO_2373 ?AUTO_2368 ) ( CLEAR ?AUTO_2373 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2373 ?AUTO_2368 )
      ( MAKE-ON ?AUTO_2368 ?AUTO_2369 )
      ( MAKE-ON-VERIFY ?AUTO_2368 ?AUTO_2369 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2376 - BLOCK
      ?AUTO_2377 - BLOCK
    )
    :vars
    (
      ?AUTO_2381 - BLOCK
      ?AUTO_2378 - BLOCK
      ?AUTO_2382 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2377 ) ( ON ?AUTO_2376 ?AUTO_2381 ) ( ON ?AUTO_2378 ?AUTO_2376 ) ( CLEAR ?AUTO_2378 ) ( HOLDING ?AUTO_2382 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2382 )
      ( MAKE-ON ?AUTO_2376 ?AUTO_2377 )
      ( MAKE-ON-VERIFY ?AUTO_2376 ?AUTO_2377 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2385 - BLOCK
      ?AUTO_2386 - BLOCK
    )
    :vars
    (
      ?AUTO_2390 - BLOCK
      ?AUTO_2387 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2385 ?AUTO_2390 ) ( ON ?AUTO_2387 ?AUTO_2385 ) ( CLEAR ?AUTO_2387 ) ( HOLDING ?AUTO_2386 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2386 )
      ( MAKE-ON ?AUTO_2385 ?AUTO_2386 )
      ( MAKE-ON-VERIFY ?AUTO_2385 ?AUTO_2386 ) )
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
      ?AUTO_2401 - BLOCK
      ?AUTO_2402 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2397 ) ( ON ?AUTO_2396 ?AUTO_2400 ) ( ON ?AUTO_2401 ?AUTO_2396 ) ( ON ?AUTO_2402 ?AUTO_2401 ) ( CLEAR ?AUTO_2402 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2402 ?AUTO_2401 )
      ( MAKE-ON ?AUTO_2396 ?AUTO_2397 )
      ( MAKE-ON-VERIFY ?AUTO_2396 ?AUTO_2397 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2407 - BLOCK
      ?AUTO_2408 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2407 ) ( CLEAR ?AUTO_2408 ) )
    :subtasks
    ( ( !STACK ?AUTO_2407 ?AUTO_2408 )
      ( MAKE-ON-VERIFY ?AUTO_2407 ?AUTO_2408 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2411 - BLOCK
      ?AUTO_2412 - BLOCK
    )
    :vars
    (
      ?AUTO_2416 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2412 ) ( ON ?AUTO_2411 ?AUTO_2416 ) ( CLEAR ?AUTO_2411 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2411 ?AUTO_2416 )
      ( MAKE-ON ?AUTO_2411 ?AUTO_2412 )
      ( MAKE-ON-VERIFY ?AUTO_2411 ?AUTO_2412 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2417 - BLOCK
      ?AUTO_2418 - BLOCK
    )
    :vars
    (
      ?AUTO_2421 - BLOCK
      ?AUTO_2422 - BLOCK
      ?AUTO_2423 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2418 ) ( ON ?AUTO_2417 ?AUTO_2421 ) ( CLEAR ?AUTO_2417 ) ( HOLDING ?AUTO_2422 ) ( CLEAR ?AUTO_2423 ) )
    :subtasks
    ( ( !STACK ?AUTO_2422 ?AUTO_2423 )
      ( MAKE-ON ?AUTO_2417 ?AUTO_2418 )
      ( MAKE-ON-VERIFY ?AUTO_2417 ?AUTO_2418 ) )
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
      ?AUTO_2429 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2425 ) ( ON ?AUTO_2424 ?AUTO_2428 ) ( CLEAR ?AUTO_2430 ) ( ON ?AUTO_2429 ?AUTO_2424 ) ( CLEAR ?AUTO_2429 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2429 ?AUTO_2424 )
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
      ?AUTO_2436 - BLOCK
      ?AUTO_2435 - BLOCK
      ?AUTO_2440 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2434 ) ( ON ?AUTO_2433 ?AUTO_2439 ) ( CLEAR ?AUTO_2436 ) ( ON ?AUTO_2435 ?AUTO_2433 ) ( CLEAR ?AUTO_2435 ) ( HOLDING ?AUTO_2440 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2440 )
      ( MAKE-ON ?AUTO_2433 ?AUTO_2434 )
      ( MAKE-ON-VERIFY ?AUTO_2433 ?AUTO_2434 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2441 - BLOCK
      ?AUTO_2442 - BLOCK
    )
    :vars
    (
      ?AUTO_2448 - BLOCK
      ?AUTO_2445 - BLOCK
      ?AUTO_2443 - BLOCK
      ?AUTO_2447 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2442 ) ( ON ?AUTO_2441 ?AUTO_2448 ) ( CLEAR ?AUTO_2445 ) ( ON ?AUTO_2443 ?AUTO_2441 ) ( ON ?AUTO_2447 ?AUTO_2443 ) ( CLEAR ?AUTO_2447 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2447 ?AUTO_2443 )
      ( MAKE-ON ?AUTO_2441 ?AUTO_2442 )
      ( MAKE-ON-VERIFY ?AUTO_2441 ?AUTO_2442 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2451 - BLOCK
      ?AUTO_2452 - BLOCK
    )
    :vars
    (
      ?AUTO_2454 - BLOCK
      ?AUTO_2458 - BLOCK
      ?AUTO_2456 - BLOCK
      ?AUTO_2457 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2451 ?AUTO_2454 ) ( CLEAR ?AUTO_2458 ) ( ON ?AUTO_2456 ?AUTO_2451 ) ( ON ?AUTO_2457 ?AUTO_2456 ) ( CLEAR ?AUTO_2457 ) ( HOLDING ?AUTO_2452 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2452 )
      ( MAKE-ON ?AUTO_2451 ?AUTO_2452 )
      ( MAKE-ON-VERIFY ?AUTO_2451 ?AUTO_2452 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2462 - BLOCK
      ?AUTO_2463 - BLOCK
    )
    :vars
    (
      ?AUTO_2464 - BLOCK
      ?AUTO_2465 - BLOCK
      ?AUTO_2468 - BLOCK
      ?AUTO_2469 - BLOCK
      ?AUTO_2470 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2463 ) ( ON ?AUTO_2462 ?AUTO_2464 ) ( CLEAR ?AUTO_2465 ) ( ON ?AUTO_2468 ?AUTO_2462 ) ( ON ?AUTO_2469 ?AUTO_2468 ) ( CLEAR ?AUTO_2469 ) ( HOLDING ?AUTO_2470 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2470 )
      ( MAKE-ON ?AUTO_2462 ?AUTO_2463 )
      ( MAKE-ON-VERIFY ?AUTO_2462 ?AUTO_2463 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2471 - BLOCK
      ?AUTO_2472 - BLOCK
    )
    :vars
    (
      ?AUTO_2474 - BLOCK
      ?AUTO_2473 - BLOCK
      ?AUTO_2476 - BLOCK
      ?AUTO_2475 - BLOCK
      ?AUTO_2477 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2471 ?AUTO_2474 ) ( CLEAR ?AUTO_2473 ) ( ON ?AUTO_2476 ?AUTO_2471 ) ( ON ?AUTO_2475 ?AUTO_2476 ) ( CLEAR ?AUTO_2475 ) ( ON ?AUTO_2477 ?AUTO_2472 ) ( CLEAR ?AUTO_2477 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2477 ?AUTO_2472 )
      ( MAKE-ON ?AUTO_2471 ?AUTO_2472 )
      ( MAKE-ON-VERIFY ?AUTO_2471 ?AUTO_2472 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2482 - BLOCK
      ?AUTO_2483 - BLOCK
    )
    :vars
    (
      ?AUTO_2487 - BLOCK
      ?AUTO_2485 - BLOCK
      ?AUTO_2488 - BLOCK
      ?AUTO_2489 - BLOCK
      ?AUTO_2484 - BLOCK
      ?AUTO_2491 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2482 ?AUTO_2487 ) ( CLEAR ?AUTO_2485 ) ( ON ?AUTO_2488 ?AUTO_2482 ) ( ON ?AUTO_2489 ?AUTO_2488 ) ( CLEAR ?AUTO_2489 ) ( ON ?AUTO_2484 ?AUTO_2483 ) ( CLEAR ?AUTO_2484 ) ( HOLDING ?AUTO_2491 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2491 )
      ( MAKE-ON ?AUTO_2482 ?AUTO_2483 )
      ( MAKE-ON-VERIFY ?AUTO_2482 ?AUTO_2483 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2492 - BLOCK
      ?AUTO_2493 - BLOCK
    )
    :vars
    (
      ?AUTO_2499 - BLOCK
      ?AUTO_2500 - BLOCK
      ?AUTO_2494 - BLOCK
      ?AUTO_2496 - BLOCK
      ?AUTO_2501 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2492 ?AUTO_2499 ) ( ON ?AUTO_2500 ?AUTO_2492 ) ( ON ?AUTO_2494 ?AUTO_2500 ) ( ON ?AUTO_2496 ?AUTO_2493 ) ( CLEAR ?AUTO_2496 ) ( ON ?AUTO_2501 ?AUTO_2494 ) ( CLEAR ?AUTO_2501 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2501 ?AUTO_2494 )
      ( MAKE-ON ?AUTO_2492 ?AUTO_2493 )
      ( MAKE-ON-VERIFY ?AUTO_2492 ?AUTO_2493 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2506 - BLOCK
      ?AUTO_2507 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2506 ) ( CLEAR ?AUTO_2507 ) )
    :subtasks
    ( ( !STACK ?AUTO_2506 ?AUTO_2507 )
      ( MAKE-ON-VERIFY ?AUTO_2506 ?AUTO_2507 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2510 - BLOCK
      ?AUTO_2511 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2511 ) ( ON-TABLE ?AUTO_2510 ) ( CLEAR ?AUTO_2510 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_2510 )
      ( MAKE-ON ?AUTO_2510 ?AUTO_2511 )
      ( MAKE-ON-VERIFY ?AUTO_2510 ?AUTO_2511 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2515 - BLOCK
      ?AUTO_2516 - BLOCK
    )
    :vars
    (
      ?AUTO_2519 - BLOCK
      ?AUTO_2520 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2516 ) ( ON-TABLE ?AUTO_2515 ) ( CLEAR ?AUTO_2515 ) ( HOLDING ?AUTO_2519 ) ( CLEAR ?AUTO_2520 ) )
    :subtasks
    ( ( !STACK ?AUTO_2519 ?AUTO_2520 )
      ( MAKE-ON ?AUTO_2515 ?AUTO_2516 )
      ( MAKE-ON-VERIFY ?AUTO_2515 ?AUTO_2516 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2521 - BLOCK
      ?AUTO_2522 - BLOCK
    )
    :vars
    (
      ?AUTO_2526 - BLOCK
      ?AUTO_2525 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2521 ) ( CLEAR ?AUTO_2521 ) ( CLEAR ?AUTO_2526 ) ( ON ?AUTO_2525 ?AUTO_2522 ) ( CLEAR ?AUTO_2525 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2525 ?AUTO_2522 )
      ( MAKE-ON ?AUTO_2521 ?AUTO_2522 )
      ( MAKE-ON-VERIFY ?AUTO_2521 ?AUTO_2522 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2529 - BLOCK
      ?AUTO_2530 - BLOCK
    )
    :vars
    (
      ?AUTO_2531 - BLOCK
      ?AUTO_2532 - BLOCK
      ?AUTO_2535 - BLOCK
      ?AUTO_2536 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2529 ) ( CLEAR ?AUTO_2529 ) ( CLEAR ?AUTO_2531 ) ( ON ?AUTO_2532 ?AUTO_2530 ) ( CLEAR ?AUTO_2532 ) ( HOLDING ?AUTO_2535 ) ( CLEAR ?AUTO_2536 ) )
    :subtasks
    ( ( !STACK ?AUTO_2535 ?AUTO_2536 )
      ( MAKE-ON ?AUTO_2529 ?AUTO_2530 )
      ( MAKE-ON-VERIFY ?AUTO_2529 ?AUTO_2530 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2537 - BLOCK
      ?AUTO_2538 - BLOCK
    )
    :vars
    (
      ?AUTO_2541 - BLOCK
      ?AUTO_2540 - BLOCK
      ?AUTO_2544 - BLOCK
      ?AUTO_2543 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2537 ) ( CLEAR ?AUTO_2537 ) ( CLEAR ?AUTO_2541 ) ( ON ?AUTO_2540 ?AUTO_2538 ) ( CLEAR ?AUTO_2544 ) ( ON ?AUTO_2543 ?AUTO_2540 ) ( CLEAR ?AUTO_2543 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2543 ?AUTO_2540 )
      ( MAKE-ON ?AUTO_2537 ?AUTO_2538 )
      ( MAKE-ON-VERIFY ?AUTO_2537 ?AUTO_2538 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2547 - BLOCK
      ?AUTO_2548 - BLOCK
    )
    :vars
    (
      ?AUTO_2554 - BLOCK
      ?AUTO_2551 - BLOCK
      ?AUTO_2553 - BLOCK
      ?AUTO_2552 - BLOCK
      ?AUTO_2555 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2547 ) ( CLEAR ?AUTO_2547 ) ( CLEAR ?AUTO_2554 ) ( ON ?AUTO_2551 ?AUTO_2548 ) ( CLEAR ?AUTO_2553 ) ( ON ?AUTO_2552 ?AUTO_2551 ) ( CLEAR ?AUTO_2552 ) ( HOLDING ?AUTO_2555 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2555 )
      ( MAKE-ON ?AUTO_2547 ?AUTO_2548 )
      ( MAKE-ON-VERIFY ?AUTO_2547 ?AUTO_2548 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2556 - BLOCK
      ?AUTO_2557 - BLOCK
    )
    :vars
    (
      ?AUTO_2559 - BLOCK
      ?AUTO_2563 - BLOCK
      ?AUTO_2558 - BLOCK
      ?AUTO_2562 - BLOCK
      ?AUTO_2564 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2556 ) ( CLEAR ?AUTO_2556 ) ( CLEAR ?AUTO_2559 ) ( ON ?AUTO_2563 ?AUTO_2557 ) ( CLEAR ?AUTO_2558 ) ( ON ?AUTO_2562 ?AUTO_2563 ) ( ON ?AUTO_2564 ?AUTO_2562 ) ( CLEAR ?AUTO_2564 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2564 ?AUTO_2562 )
      ( MAKE-ON ?AUTO_2556 ?AUTO_2557 )
      ( MAKE-ON-VERIFY ?AUTO_2556 ?AUTO_2557 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2567 - BLOCK
      ?AUTO_2568 - BLOCK
    )
    :vars
    (
      ?AUTO_2571 - BLOCK
      ?AUTO_2573 - BLOCK
      ?AUTO_2574 - BLOCK
      ?AUTO_2570 - BLOCK
      ?AUTO_2572 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2567 ) ( CLEAR ?AUTO_2567 ) ( ON ?AUTO_2571 ?AUTO_2568 ) ( CLEAR ?AUTO_2573 ) ( ON ?AUTO_2574 ?AUTO_2571 ) ( ON ?AUTO_2570 ?AUTO_2574 ) ( CLEAR ?AUTO_2570 ) ( HOLDING ?AUTO_2572 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2572 )
      ( MAKE-ON ?AUTO_2567 ?AUTO_2568 )
      ( MAKE-ON-VERIFY ?AUTO_2567 ?AUTO_2568 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2577 - BLOCK
      ?AUTO_2578 - BLOCK
    )
    :vars
    (
      ?AUTO_2584 - BLOCK
      ?AUTO_2582 - BLOCK
      ?AUTO_2585 - BLOCK
      ?AUTO_2581 - BLOCK
      ?AUTO_2583 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2577 ) ( ON ?AUTO_2584 ?AUTO_2578 ) ( CLEAR ?AUTO_2582 ) ( ON ?AUTO_2585 ?AUTO_2584 ) ( ON ?AUTO_2581 ?AUTO_2585 ) ( CLEAR ?AUTO_2581 ) ( ON ?AUTO_2583 ?AUTO_2577 ) ( CLEAR ?AUTO_2583 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2583 ?AUTO_2577 )
      ( MAKE-ON ?AUTO_2577 ?AUTO_2578 )
      ( MAKE-ON-VERIFY ?AUTO_2577 ?AUTO_2578 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2588 - BLOCK
      ?AUTO_2589 - BLOCK
    )
    :vars
    (
      ?AUTO_2594 - BLOCK
      ?AUTO_2596 - BLOCK
      ?AUTO_2595 - BLOCK
      ?AUTO_2591 - BLOCK
      ?AUTO_2590 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2588 ) ( ON ?AUTO_2594 ?AUTO_2589 ) ( ON ?AUTO_2596 ?AUTO_2594 ) ( ON ?AUTO_2595 ?AUTO_2596 ) ( CLEAR ?AUTO_2595 ) ( ON ?AUTO_2591 ?AUTO_2588 ) ( CLEAR ?AUTO_2591 ) ( HOLDING ?AUTO_2590 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2590 )
      ( MAKE-ON ?AUTO_2588 ?AUTO_2589 )
      ( MAKE-ON-VERIFY ?AUTO_2588 ?AUTO_2589 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2598 - BLOCK
      ?AUTO_2599 - BLOCK
    )
    :vars
    (
      ?AUTO_2606 - BLOCK
      ?AUTO_2600 - BLOCK
      ?AUTO_2605 - BLOCK
      ?AUTO_2601 - BLOCK
      ?AUTO_2602 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2598 ) ( ON ?AUTO_2606 ?AUTO_2599 ) ( ON ?AUTO_2600 ?AUTO_2606 ) ( ON ?AUTO_2605 ?AUTO_2600 ) ( CLEAR ?AUTO_2605 ) ( ON ?AUTO_2601 ?AUTO_2598 ) ( ON ?AUTO_2602 ?AUTO_2601 ) ( CLEAR ?AUTO_2602 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2602 ?AUTO_2601 )
      ( MAKE-ON ?AUTO_2598 ?AUTO_2599 )
      ( MAKE-ON-VERIFY ?AUTO_2598 ?AUTO_2599 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2609 - BLOCK
      ?AUTO_2610 - BLOCK
    )
    :vars
    (
      ?AUTO_2616 - BLOCK
      ?AUTO_2617 - BLOCK
      ?AUTO_2612 - BLOCK
      ?AUTO_2611 - BLOCK
      ?AUTO_2615 - BLOCK
      ?AUTO_2618 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2609 ) ( ON ?AUTO_2616 ?AUTO_2610 ) ( ON ?AUTO_2617 ?AUTO_2616 ) ( ON ?AUTO_2612 ?AUTO_2617 ) ( CLEAR ?AUTO_2612 ) ( ON ?AUTO_2611 ?AUTO_2609 ) ( ON ?AUTO_2615 ?AUTO_2611 ) ( CLEAR ?AUTO_2615 ) ( HOLDING ?AUTO_2618 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2618 )
      ( MAKE-ON ?AUTO_2609 ?AUTO_2610 )
      ( MAKE-ON-VERIFY ?AUTO_2609 ?AUTO_2610 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2619 - BLOCK
      ?AUTO_2620 - BLOCK
    )
    :vars
    (
      ?AUTO_2622 - BLOCK
      ?AUTO_2628 - BLOCK
      ?AUTO_2621 - BLOCK
      ?AUTO_2623 - BLOCK
      ?AUTO_2627 - BLOCK
      ?AUTO_2624 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2619 ) ( ON ?AUTO_2622 ?AUTO_2620 ) ( ON ?AUTO_2628 ?AUTO_2622 ) ( ON ?AUTO_2621 ?AUTO_2628 ) ( ON ?AUTO_2623 ?AUTO_2619 ) ( ON ?AUTO_2627 ?AUTO_2623 ) ( CLEAR ?AUTO_2627 ) ( ON ?AUTO_2624 ?AUTO_2621 ) ( CLEAR ?AUTO_2624 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2624 ?AUTO_2621 )
      ( MAKE-ON ?AUTO_2619 ?AUTO_2620 )
      ( MAKE-ON-VERIFY ?AUTO_2619 ?AUTO_2620 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2632 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2632 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2632 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2632 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2634 - BLOCK
    )
    :vars
    (
      ?AUTO_2637 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2634 ?AUTO_2637 ) ( CLEAR ?AUTO_2634 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2634 ?AUTO_2637 )
      ( MAKE-ON-TABLE ?AUTO_2634 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2634 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2638 - BLOCK
    )
    :vars
    (
      ?AUTO_2640 - BLOCK
      ?AUTO_2641 - BLOCK
      ?AUTO_2642 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2638 ?AUTO_2640 ) ( CLEAR ?AUTO_2638 ) ( HOLDING ?AUTO_2641 ) ( CLEAR ?AUTO_2642 ) )
    :subtasks
    ( ( !STACK ?AUTO_2641 ?AUTO_2642 )
      ( MAKE-ON-TABLE ?AUTO_2638 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2638 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2649 - BLOCK
    )
    :vars
    (
      ?AUTO_2650 - BLOCK
      ?AUTO_2653 - BLOCK
      ?AUTO_2652 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2649 ?AUTO_2650 ) ( CLEAR ?AUTO_2653 ) ( ON ?AUTO_2652 ?AUTO_2649 ) ( CLEAR ?AUTO_2652 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2652 ?AUTO_2649 )
      ( MAKE-ON-TABLE ?AUTO_2649 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2649 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2656 - BLOCK
    )
    :vars
    (
      ?AUTO_2657 - BLOCK
      ?AUTO_2658 - BLOCK
      ?AUTO_2659 - BLOCK
      ?AUTO_2661 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2656 ?AUTO_2657 ) ( CLEAR ?AUTO_2658 ) ( ON ?AUTO_2659 ?AUTO_2656 ) ( CLEAR ?AUTO_2659 ) ( HOLDING ?AUTO_2661 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2661 )
      ( MAKE-ON-TABLE ?AUTO_2656 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2656 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2666 - BLOCK
    )
    :vars
    (
      ?AUTO_2670 - BLOCK
      ?AUTO_2671 - BLOCK
      ?AUTO_2668 - BLOCK
      ?AUTO_2667 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2666 ?AUTO_2670 ) ( CLEAR ?AUTO_2671 ) ( ON ?AUTO_2668 ?AUTO_2666 ) ( ON ?AUTO_2667 ?AUTO_2668 ) ( CLEAR ?AUTO_2667 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2667 ?AUTO_2668 )
      ( MAKE-ON-TABLE ?AUTO_2666 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2666 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2676 - BLOCK
      ?AUTO_2677 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2676 ) ( CLEAR ?AUTO_2677 ) )
    :subtasks
    ( ( !STACK ?AUTO_2676 ?AUTO_2677 )
      ( MAKE-ON-VERIFY ?AUTO_2676 ?AUTO_2677 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2680 - BLOCK
      ?AUTO_2681 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2681 ) ( ON-TABLE ?AUTO_2680 ) ( CLEAR ?AUTO_2680 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_2680 )
      ( MAKE-ON ?AUTO_2680 ?AUTO_2681 )
      ( MAKE-ON-VERIFY ?AUTO_2680 ?AUTO_2681 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2685 - BLOCK
      ?AUTO_2686 - BLOCK
    )
    :vars
    (
      ?AUTO_2689 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2686 ) ( ON-TABLE ?AUTO_2685 ) ( CLEAR ?AUTO_2685 ) ( HOLDING ?AUTO_2689 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2689 )
      ( MAKE-ON ?AUTO_2685 ?AUTO_2686 )
      ( MAKE-ON-VERIFY ?AUTO_2685 ?AUTO_2686 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2690 - BLOCK
      ?AUTO_2691 - BLOCK
    )
    :vars
    (
      ?AUTO_2694 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2691 ) ( ON-TABLE ?AUTO_2690 ) ( ON ?AUTO_2694 ?AUTO_2690 ) ( CLEAR ?AUTO_2694 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2694 ?AUTO_2690 )
      ( MAKE-ON ?AUTO_2690 ?AUTO_2691 )
      ( MAKE-ON-VERIFY ?AUTO_2690 ?AUTO_2691 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2697 - BLOCK
      ?AUTO_2698 - BLOCK
    )
    :vars
    (
      ?AUTO_2700 - BLOCK
      ?AUTO_2702 - BLOCK
      ?AUTO_2703 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2698 ) ( ON-TABLE ?AUTO_2697 ) ( ON ?AUTO_2700 ?AUTO_2697 ) ( CLEAR ?AUTO_2700 ) ( HOLDING ?AUTO_2702 ) ( CLEAR ?AUTO_2703 ) )
    :subtasks
    ( ( !STACK ?AUTO_2702 ?AUTO_2703 )
      ( MAKE-ON ?AUTO_2697 ?AUTO_2698 )
      ( MAKE-ON-VERIFY ?AUTO_2697 ?AUTO_2698 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2706 - BLOCK
      ?AUTO_2707 - BLOCK
    )
    :vars
    (
      ?AUTO_2709 - BLOCK
      ?AUTO_2712 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2706 ) ( ON ?AUTO_2709 ?AUTO_2706 ) ( CLEAR ?AUTO_2709 ) ( HOLDING ?AUTO_2707 ) ( CLEAR ?AUTO_2712 ) )
    :subtasks
    ( ( !STACK ?AUTO_2707 ?AUTO_2712 )
      ( MAKE-ON ?AUTO_2706 ?AUTO_2707 )
      ( MAKE-ON-VERIFY ?AUTO_2706 ?AUTO_2707 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2727 - BLOCK
      ?AUTO_2728 - BLOCK
    )
    :vars
    (
      ?AUTO_2734 - BLOCK
      ?AUTO_2731 - BLOCK
      ?AUTO_2729 - BLOCK
      ?AUTO_2732 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2734 ) ( ON ?AUTO_2731 ?AUTO_2728 ) ( CLEAR ?AUTO_2729 ) ( ON ?AUTO_2732 ?AUTO_2731 ) ( CLEAR ?AUTO_2732 ) ( HOLDING ?AUTO_2727 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2727 )
      ( MAKE-ON ?AUTO_2727 ?AUTO_2728 )
      ( MAKE-ON-VERIFY ?AUTO_2727 ?AUTO_2728 ) )
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
      ?AUTO_2740 - BLOCK
      ?AUTO_2741 - BLOCK
      ?AUTO_2739 - BLOCK
      ?AUTO_2745 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2738 ) ( ON ?AUTO_2740 ?AUTO_2737 ) ( CLEAR ?AUTO_2741 ) ( ON ?AUTO_2739 ?AUTO_2740 ) ( CLEAR ?AUTO_2739 ) ( ON ?AUTO_2736 ?AUTO_2745 ) ( CLEAR ?AUTO_2736 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2736 ?AUTO_2745 )
      ( MAKE-ON ?AUTO_2736 ?AUTO_2737 )
      ( MAKE-ON-VERIFY ?AUTO_2736 ?AUTO_2737 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2746 - BLOCK
      ?AUTO_2747 - BLOCK
    )
    :vars
    (
      ?AUTO_2749 - BLOCK
      ?AUTO_2754 - BLOCK
      ?AUTO_2748 - BLOCK
      ?AUTO_2753 - BLOCK
      ?AUTO_2751 - BLOCK
      ?AUTO_2755 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2749 ) ( ON ?AUTO_2754 ?AUTO_2747 ) ( CLEAR ?AUTO_2748 ) ( ON ?AUTO_2753 ?AUTO_2754 ) ( CLEAR ?AUTO_2753 ) ( ON ?AUTO_2746 ?AUTO_2751 ) ( CLEAR ?AUTO_2746 ) ( HOLDING ?AUTO_2755 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2755 )
      ( MAKE-ON ?AUTO_2746 ?AUTO_2747 )
      ( MAKE-ON-VERIFY ?AUTO_2746 ?AUTO_2747 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2756 - BLOCK
      ?AUTO_2757 - BLOCK
    )
    :vars
    (
      ?AUTO_2761 - BLOCK
      ?AUTO_2760 - BLOCK
      ?AUTO_2758 - BLOCK
      ?AUTO_2764 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2761 ?AUTO_2757 ) ( ON ?AUTO_2760 ?AUTO_2761 ) ( ON ?AUTO_2756 ?AUTO_2758 ) ( CLEAR ?AUTO_2756 ) ( ON ?AUTO_2764 ?AUTO_2760 ) ( CLEAR ?AUTO_2764 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2764 ?AUTO_2760 )
      ( MAKE-ON ?AUTO_2756 ?AUTO_2757 )
      ( MAKE-ON-VERIFY ?AUTO_2756 ?AUTO_2757 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2770 - BLOCK
      ?AUTO_2771 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2770 ) ( CLEAR ?AUTO_2771 ) )
    :subtasks
    ( ( !STACK ?AUTO_2770 ?AUTO_2771 )
      ( MAKE-ON-VERIFY ?AUTO_2770 ?AUTO_2771 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2774 - BLOCK
      ?AUTO_2775 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2775 ) ( ON-TABLE ?AUTO_2774 ) ( CLEAR ?AUTO_2774 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_2774 )
      ( MAKE-ON ?AUTO_2774 ?AUTO_2775 )
      ( MAKE-ON-VERIFY ?AUTO_2774 ?AUTO_2775 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2779 - BLOCK
      ?AUTO_2780 - BLOCK
    )
    :vars
    (
      ?AUTO_2784 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2779 ) ( CLEAR ?AUTO_2779 ) ( HOLDING ?AUTO_2780 ) ( CLEAR ?AUTO_2784 ) )
    :subtasks
    ( ( !STACK ?AUTO_2780 ?AUTO_2784 )
      ( MAKE-ON ?AUTO_2779 ?AUTO_2780 )
      ( MAKE-ON-VERIFY ?AUTO_2779 ?AUTO_2780 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2858 - BLOCK
      ?AUTO_2859 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2858 ) ( CLEAR ?AUTO_2859 ) )
    :subtasks
    ( ( !STACK ?AUTO_2858 ?AUTO_2859 )
      ( MAKE-ON-VERIFY ?AUTO_2858 ?AUTO_2859 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2862 - BLOCK
      ?AUTO_2863 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2863 ) ( ON-TABLE ?AUTO_2862 ) ( CLEAR ?AUTO_2862 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_2862 )
      ( MAKE-ON ?AUTO_2862 ?AUTO_2863 )
      ( MAKE-ON-VERIFY ?AUTO_2862 ?AUTO_2863 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2867 - BLOCK
      ?AUTO_2868 - BLOCK
    )
    :vars
    (
      ?AUTO_2872 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_2867 ) ( CLEAR ?AUTO_2867 ) ( HOLDING ?AUTO_2868 ) ( CLEAR ?AUTO_2872 ) )
    :subtasks
    ( ( !STACK ?AUTO_2868 ?AUTO_2872 )
      ( MAKE-ON ?AUTO_2867 ?AUTO_2868 )
      ( MAKE-ON-VERIFY ?AUTO_2867 ?AUTO_2868 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2875 - BLOCK
      ?AUTO_2876 - BLOCK
    )
    :vars
    (
      ?AUTO_2879 - BLOCK
      ?AUTO_2880 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2876 ) ( ON-TABLE ?AUTO_2875 ) ( CLEAR ?AUTO_2875 ) ( HOLDING ?AUTO_2879 ) ( CLEAR ?AUTO_2880 ) )
    :subtasks
    ( ( !STACK ?AUTO_2879 ?AUTO_2880 )
      ( MAKE-ON ?AUTO_2875 ?AUTO_2876 )
      ( MAKE-ON-VERIFY ?AUTO_2875 ?AUTO_2876 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2883 - BLOCK
      ?AUTO_2884 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2883 ) ( CLEAR ?AUTO_2884 ) )
    :subtasks
    ( ( !STACK ?AUTO_2883 ?AUTO_2884 )
      ( MAKE-ON-VERIFY ?AUTO_2883 ?AUTO_2884 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2887 - BLOCK
      ?AUTO_2888 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2888 ) ( ON-TABLE ?AUTO_2887 ) ( CLEAR ?AUTO_2887 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_2887 )
      ( MAKE-ON ?AUTO_2887 ?AUTO_2888 )
      ( MAKE-ON-VERIFY ?AUTO_2887 ?AUTO_2888 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2893 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2893 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2893 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2893 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2895 - BLOCK
    )
    :vars
    (
      ?AUTO_2898 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2895 ?AUTO_2898 ) ( CLEAR ?AUTO_2895 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2895 ?AUTO_2898 )
      ( MAKE-ON-TABLE ?AUTO_2895 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2895 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2899 - BLOCK
    )
    :vars
    (
      ?AUTO_2901 - BLOCK
      ?AUTO_2902 - BLOCK
      ?AUTO_2903 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2899 ?AUTO_2901 ) ( CLEAR ?AUTO_2899 ) ( HOLDING ?AUTO_2902 ) ( CLEAR ?AUTO_2903 ) )
    :subtasks
    ( ( !STACK ?AUTO_2902 ?AUTO_2903 )
      ( MAKE-ON-TABLE ?AUTO_2899 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2899 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2906 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2906 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2906 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2906 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2908 - BLOCK
    )
    :vars
    (
      ?AUTO_2911 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2908 ?AUTO_2911 ) ( CLEAR ?AUTO_2908 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2908 ?AUTO_2911 )
      ( MAKE-ON-TABLE ?AUTO_2908 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2908 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2912 - BLOCK
    )
    :vars
    (
      ?AUTO_2914 - BLOCK
      ?AUTO_2915 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2912 ?AUTO_2914 ) ( CLEAR ?AUTO_2912 ) ( HOLDING ?AUTO_2915 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2915 )
      ( MAKE-ON-TABLE ?AUTO_2912 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2912 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2916 - BLOCK
    )
    :vars
    (
      ?AUTO_2918 - BLOCK
      ?AUTO_2919 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2916 ?AUTO_2918 ) ( ON ?AUTO_2919 ?AUTO_2916 ) ( CLEAR ?AUTO_2919 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2919 ?AUTO_2916 )
      ( MAKE-ON-TABLE ?AUTO_2916 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2916 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2922 - BLOCK
    )
    :vars
    (
      ?AUTO_2923 - BLOCK
      ?AUTO_2924 - BLOCK
      ?AUTO_2926 - BLOCK
      ?AUTO_2927 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2922 ?AUTO_2923 ) ( ON ?AUTO_2924 ?AUTO_2922 ) ( CLEAR ?AUTO_2924 ) ( HOLDING ?AUTO_2926 ) ( CLEAR ?AUTO_2927 ) )
    :subtasks
    ( ( !STACK ?AUTO_2926 ?AUTO_2927 )
      ( MAKE-ON-TABLE ?AUTO_2922 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2922 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2930 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2930 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2930 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2930 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2932 - BLOCK
    )
    :vars
    (
      ?AUTO_2935 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2932 ?AUTO_2935 ) ( CLEAR ?AUTO_2932 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2932 ?AUTO_2935 )
      ( MAKE-ON-TABLE ?AUTO_2932 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2932 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2936 - BLOCK
    )
    :vars
    (
      ?AUTO_2938 - BLOCK
      ?AUTO_2939 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2936 ?AUTO_2938 ) ( CLEAR ?AUTO_2936 ) ( HOLDING ?AUTO_2939 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2939 )
      ( MAKE-ON-TABLE ?AUTO_2936 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2936 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2940 - BLOCK
    )
    :vars
    (
      ?AUTO_2942 - BLOCK
      ?AUTO_2943 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2940 ?AUTO_2942 ) ( ON ?AUTO_2943 ?AUTO_2940 ) ( CLEAR ?AUTO_2943 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2943 ?AUTO_2940 )
      ( MAKE-ON-TABLE ?AUTO_2940 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2940 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2946 - BLOCK
    )
    :vars
    (
      ?AUTO_2947 - BLOCK
      ?AUTO_2949 - BLOCK
      ?AUTO_2950 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2946 ?AUTO_2947 ) ( ON ?AUTO_2949 ?AUTO_2946 ) ( CLEAR ?AUTO_2949 ) ( HOLDING ?AUTO_2950 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2950 )
      ( MAKE-ON-TABLE ?AUTO_2946 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2946 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2951 - BLOCK
    )
    :vars
    (
      ?AUTO_2953 - BLOCK
      ?AUTO_2954 - BLOCK
      ?AUTO_2955 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2951 ?AUTO_2953 ) ( ON ?AUTO_2954 ?AUTO_2951 ) ( ON ?AUTO_2955 ?AUTO_2954 ) ( CLEAR ?AUTO_2955 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2955 ?AUTO_2954 )
      ( MAKE-ON-TABLE ?AUTO_2951 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2951 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_2958 - BLOCK
    )
    :vars
    (
      ?AUTO_2961 - BLOCK
      ?AUTO_2962 - BLOCK
      ?AUTO_2959 - BLOCK
      ?AUTO_2963 - BLOCK
      ?AUTO_2964 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_2958 ?AUTO_2961 ) ( ON ?AUTO_2962 ?AUTO_2958 ) ( ON ?AUTO_2959 ?AUTO_2962 ) ( CLEAR ?AUTO_2959 ) ( HOLDING ?AUTO_2963 ) ( CLEAR ?AUTO_2964 ) )
    :subtasks
    ( ( !STACK ?AUTO_2963 ?AUTO_2964 )
      ( MAKE-ON-TABLE ?AUTO_2958 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_2958 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2968 - BLOCK
      ?AUTO_2969 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_2968 ) ( CLEAR ?AUTO_2969 ) )
    :subtasks
    ( ( !STACK ?AUTO_2968 ?AUTO_2969 )
      ( MAKE-ON-VERIFY ?AUTO_2968 ?AUTO_2969 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2972 - BLOCK
      ?AUTO_2973 - BLOCK
    )
    :vars
    (
      ?AUTO_2977 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2973 ) ( ON ?AUTO_2972 ?AUTO_2977 ) ( CLEAR ?AUTO_2972 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2972 ?AUTO_2977 )
      ( MAKE-ON ?AUTO_2972 ?AUTO_2973 )
      ( MAKE-ON-VERIFY ?AUTO_2972 ?AUTO_2973 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2978 - BLOCK
      ?AUTO_2979 - BLOCK
    )
    :vars
    (
      ?AUTO_2982 - BLOCK
      ?AUTO_2983 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2979 ) ( ON ?AUTO_2978 ?AUTO_2982 ) ( CLEAR ?AUTO_2978 ) ( HOLDING ?AUTO_2983 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2983 )
      ( MAKE-ON ?AUTO_2978 ?AUTO_2979 )
      ( MAKE-ON-VERIFY ?AUTO_2978 ?AUTO_2979 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2984 - BLOCK
      ?AUTO_2985 - BLOCK
    )
    :vars
    (
      ?AUTO_2988 - BLOCK
      ?AUTO_2989 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2985 ) ( ON ?AUTO_2984 ?AUTO_2988 ) ( ON ?AUTO_2989 ?AUTO_2984 ) ( CLEAR ?AUTO_2989 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_2989 ?AUTO_2984 )
      ( MAKE-ON ?AUTO_2984 ?AUTO_2985 )
      ( MAKE-ON-VERIFY ?AUTO_2984 ?AUTO_2985 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2992 - BLOCK
      ?AUTO_2993 - BLOCK
    )
    :vars
    (
      ?AUTO_2997 - BLOCK
      ?AUTO_2994 - BLOCK
      ?AUTO_2998 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_2993 ) ( ON ?AUTO_2992 ?AUTO_2997 ) ( ON ?AUTO_2994 ?AUTO_2992 ) ( CLEAR ?AUTO_2994 ) ( HOLDING ?AUTO_2998 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_2998 )
      ( MAKE-ON ?AUTO_2992 ?AUTO_2993 )
      ( MAKE-ON-VERIFY ?AUTO_2992 ?AUTO_2993 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_2999 - BLOCK
      ?AUTO_3000 - BLOCK
    )
    :vars
    (
      ?AUTO_3004 - BLOCK
      ?AUTO_3001 - BLOCK
      ?AUTO_3005 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3000 ) ( ON ?AUTO_2999 ?AUTO_3004 ) ( ON ?AUTO_3001 ?AUTO_2999 ) ( ON ?AUTO_3005 ?AUTO_3001 ) ( CLEAR ?AUTO_3005 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3005 ?AUTO_3001 )
      ( MAKE-ON ?AUTO_2999 ?AUTO_3000 )
      ( MAKE-ON-VERIFY ?AUTO_2999 ?AUTO_3000 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3008 - BLOCK
      ?AUTO_3009 - BLOCK
    )
    :vars
    (
      ?AUTO_3014 - BLOCK
      ?AUTO_3011 - BLOCK
      ?AUTO_3012 - BLOCK
      ?AUTO_3015 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3009 ) ( ON ?AUTO_3008 ?AUTO_3014 ) ( ON ?AUTO_3011 ?AUTO_3008 ) ( ON ?AUTO_3012 ?AUTO_3011 ) ( CLEAR ?AUTO_3012 ) ( HOLDING ?AUTO_3015 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3015 )
      ( MAKE-ON ?AUTO_3008 ?AUTO_3009 )
      ( MAKE-ON-VERIFY ?AUTO_3008 ?AUTO_3009 ) )
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
      ?AUTO_3019 - BLOCK
      ?AUTO_3023 - BLOCK
      ?AUTO_3022 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3017 ) ( ON ?AUTO_3016 ?AUTO_3018 ) ( ON ?AUTO_3019 ?AUTO_3016 ) ( ON ?AUTO_3023 ?AUTO_3019 ) ( ON ?AUTO_3022 ?AUTO_3023 ) ( CLEAR ?AUTO_3022 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3022 ?AUTO_3023 )
      ( MAKE-ON ?AUTO_3016 ?AUTO_3017 )
      ( MAKE-ON-VERIFY ?AUTO_3016 ?AUTO_3017 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3026 - BLOCK
      ?AUTO_3027 - BLOCK
    )
    :vars
    (
      ?AUTO_3032 - BLOCK
      ?AUTO_3030 - BLOCK
      ?AUTO_3033 - BLOCK
      ?AUTO_3029 - BLOCK
      ?AUTO_3035 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3026 ?AUTO_3032 ) ( ON ?AUTO_3030 ?AUTO_3026 ) ( ON ?AUTO_3033 ?AUTO_3030 ) ( ON ?AUTO_3029 ?AUTO_3033 ) ( CLEAR ?AUTO_3029 ) ( HOLDING ?AUTO_3027 ) ( CLEAR ?AUTO_3035 ) )
    :subtasks
    ( ( !STACK ?AUTO_3027 ?AUTO_3035 )
      ( MAKE-ON ?AUTO_3026 ?AUTO_3027 )
      ( MAKE-ON-VERIFY ?AUTO_3026 ?AUTO_3027 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3040 - BLOCK
      ?AUTO_3041 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3040 ) ( CLEAR ?AUTO_3041 ) )
    :subtasks
    ( ( !STACK ?AUTO_3040 ?AUTO_3041 )
      ( MAKE-ON-VERIFY ?AUTO_3040 ?AUTO_3041 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3044 - BLOCK
      ?AUTO_3045 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3045 ) ( ON-TABLE ?AUTO_3044 ) ( CLEAR ?AUTO_3044 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_3044 )
      ( MAKE-ON ?AUTO_3044 ?AUTO_3045 )
      ( MAKE-ON-VERIFY ?AUTO_3044 ?AUTO_3045 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3049 - BLOCK
      ?AUTO_3050 - BLOCK
    )
    :vars
    (
      ?AUTO_3054 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_3049 ) ( CLEAR ?AUTO_3049 ) ( HOLDING ?AUTO_3050 ) ( CLEAR ?AUTO_3054 ) )
    :subtasks
    ( ( !STACK ?AUTO_3050 ?AUTO_3054 )
      ( MAKE-ON ?AUTO_3049 ?AUTO_3050 )
      ( MAKE-ON-VERIFY ?AUTO_3049 ?AUTO_3050 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3055 - BLOCK
      ?AUTO_3056 - BLOCK
    )
    :vars
    (
      ?AUTO_3058 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_3055 ) ( CLEAR ?AUTO_3058 ) ( ON ?AUTO_3056 ?AUTO_3055 ) ( CLEAR ?AUTO_3056 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3056 ?AUTO_3055 )
      ( MAKE-ON ?AUTO_3055 ?AUTO_3056 )
      ( MAKE-ON-VERIFY ?AUTO_3055 ?AUTO_3056 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3062 - BLOCK
      ?AUTO_3063 - BLOCK
    )
    :vars
    (
      ?AUTO_3064 - BLOCK
      ?AUTO_3067 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_3062 ) ( CLEAR ?AUTO_3064 ) ( ON ?AUTO_3063 ?AUTO_3062 ) ( CLEAR ?AUTO_3063 ) ( HOLDING ?AUTO_3067 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3067 )
      ( MAKE-ON ?AUTO_3062 ?AUTO_3063 )
      ( MAKE-ON-VERIFY ?AUTO_3062 ?AUTO_3063 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3068 - BLOCK
      ?AUTO_3069 - BLOCK
    )
    :vars
    (
      ?AUTO_3070 - BLOCK
      ?AUTO_3073 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_3068 ) ( CLEAR ?AUTO_3070 ) ( ON ?AUTO_3069 ?AUTO_3068 ) ( ON ?AUTO_3073 ?AUTO_3069 ) ( CLEAR ?AUTO_3073 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3073 ?AUTO_3069 )
      ( MAKE-ON ?AUTO_3068 ?AUTO_3069 )
      ( MAKE-ON-VERIFY ?AUTO_3068 ?AUTO_3069 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3076 - BLOCK
      ?AUTO_3077 - BLOCK
    )
    :vars
    (
      ?AUTO_3078 - BLOCK
      ?AUTO_3081 - BLOCK
      ?AUTO_3082 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_3076 ) ( CLEAR ?AUTO_3078 ) ( ON ?AUTO_3077 ?AUTO_3076 ) ( ON ?AUTO_3081 ?AUTO_3077 ) ( CLEAR ?AUTO_3081 ) ( HOLDING ?AUTO_3082 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3082 )
      ( MAKE-ON ?AUTO_3076 ?AUTO_3077 )
      ( MAKE-ON-VERIFY ?AUTO_3076 ?AUTO_3077 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3083 - BLOCK
      ?AUTO_3084 - BLOCK
    )
    :vars
    (
      ?AUTO_3087 - BLOCK
      ?AUTO_3088 - BLOCK
      ?AUTO_3089 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_3083 ) ( CLEAR ?AUTO_3087 ) ( ON ?AUTO_3084 ?AUTO_3083 ) ( ON ?AUTO_3088 ?AUTO_3084 ) ( ON ?AUTO_3089 ?AUTO_3088 ) ( CLEAR ?AUTO_3089 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3089 ?AUTO_3088 )
      ( MAKE-ON ?AUTO_3083 ?AUTO_3084 )
      ( MAKE-ON-VERIFY ?AUTO_3083 ?AUTO_3084 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3092 - BLOCK
      ?AUTO_3093 - BLOCK
    )
    :vars
    (
      ?AUTO_3094 - BLOCK
      ?AUTO_3097 - BLOCK
      ?AUTO_3096 - BLOCK
      ?AUTO_3099 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_3092 ) ( CLEAR ?AUTO_3094 ) ( ON ?AUTO_3093 ?AUTO_3092 ) ( ON ?AUTO_3097 ?AUTO_3093 ) ( ON ?AUTO_3096 ?AUTO_3097 ) ( CLEAR ?AUTO_3096 ) ( HOLDING ?AUTO_3099 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3099 )
      ( MAKE-ON ?AUTO_3092 ?AUTO_3093 )
      ( MAKE-ON-VERIFY ?AUTO_3092 ?AUTO_3093 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3100 - BLOCK
      ?AUTO_3101 - BLOCK
    )
    :vars
    (
      ?AUTO_3104 - BLOCK
      ?AUTO_3107 - BLOCK
      ?AUTO_3106 - BLOCK
      ?AUTO_3105 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_3100 ) ( CLEAR ?AUTO_3104 ) ( ON ?AUTO_3101 ?AUTO_3100 ) ( ON ?AUTO_3107 ?AUTO_3101 ) ( ON ?AUTO_3106 ?AUTO_3107 ) ( ON ?AUTO_3105 ?AUTO_3106 ) ( CLEAR ?AUTO_3105 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3105 ?AUTO_3106 )
      ( MAKE-ON ?AUTO_3100 ?AUTO_3101 )
      ( MAKE-ON-VERIFY ?AUTO_3100 ?AUTO_3101 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3110 - BLOCK
      ?AUTO_3111 - BLOCK
    )
    :vars
    (
      ?AUTO_3114 - BLOCK
      ?AUTO_3113 - BLOCK
      ?AUTO_3115 - BLOCK
      ?AUTO_3117 - BLOCK
      ?AUTO_3119 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_3110 ) ( ON ?AUTO_3111 ?AUTO_3110 ) ( ON ?AUTO_3114 ?AUTO_3111 ) ( ON ?AUTO_3113 ?AUTO_3114 ) ( ON ?AUTO_3115 ?AUTO_3113 ) ( CLEAR ?AUTO_3115 ) ( HOLDING ?AUTO_3117 ) ( CLEAR ?AUTO_3119 ) )
    :subtasks
    ( ( !STACK ?AUTO_3117 ?AUTO_3119 )
      ( MAKE-ON ?AUTO_3110 ?AUTO_3111 )
      ( MAKE-ON-VERIFY ?AUTO_3110 ?AUTO_3111 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3124 - BLOCK
      ?AUTO_3125 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3124 ) ( CLEAR ?AUTO_3125 ) )
    :subtasks
    ( ( !STACK ?AUTO_3124 ?AUTO_3125 )
      ( MAKE-ON-VERIFY ?AUTO_3124 ?AUTO_3125 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3128 - BLOCK
      ?AUTO_3129 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3129 ) ( ON-TABLE ?AUTO_3128 ) ( CLEAR ?AUTO_3128 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_3128 )
      ( MAKE-ON ?AUTO_3128 ?AUTO_3129 )
      ( MAKE-ON-VERIFY ?AUTO_3128 ?AUTO_3129 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3133 - BLOCK
      ?AUTO_3134 - BLOCK
    )
    :vars
    (
      ?AUTO_3138 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_3133 ) ( CLEAR ?AUTO_3133 ) ( HOLDING ?AUTO_3134 ) ( CLEAR ?AUTO_3138 ) )
    :subtasks
    ( ( !STACK ?AUTO_3134 ?AUTO_3138 )
      ( MAKE-ON ?AUTO_3133 ?AUTO_3134 )
      ( MAKE-ON-VERIFY ?AUTO_3133 ?AUTO_3134 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3141 - BLOCK
      ?AUTO_3142 - BLOCK
    )
    :vars
    (
      ?AUTO_3145 - BLOCK
      ?AUTO_3146 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3142 ) ( ON-TABLE ?AUTO_3141 ) ( CLEAR ?AUTO_3141 ) ( HOLDING ?AUTO_3145 ) ( CLEAR ?AUTO_3146 ) )
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
      ?AUTO_3152 - BLOCK
      ?AUTO_3151 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_3147 ) ( CLEAR ?AUTO_3147 ) ( CLEAR ?AUTO_3152 ) ( ON ?AUTO_3151 ?AUTO_3148 ) ( CLEAR ?AUTO_3151 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3151 ?AUTO_3148 )
      ( MAKE-ON ?AUTO_3147 ?AUTO_3148 )
      ( MAKE-ON-VERIFY ?AUTO_3147 ?AUTO_3148 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3155 - BLOCK
      ?AUTO_3156 - BLOCK
    )
    :vars
    (
      ?AUTO_3157 - BLOCK
      ?AUTO_3160 - BLOCK
      ?AUTO_3161 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_3155 ) ( CLEAR ?AUTO_3155 ) ( CLEAR ?AUTO_3157 ) ( ON ?AUTO_3160 ?AUTO_3156 ) ( CLEAR ?AUTO_3160 ) ( HOLDING ?AUTO_3161 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3161 )
      ( MAKE-ON ?AUTO_3155 ?AUTO_3156 )
      ( MAKE-ON-VERIFY ?AUTO_3155 ?AUTO_3156 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3162 - BLOCK
      ?AUTO_3163 - BLOCK
    )
    :vars
    (
      ?AUTO_3165 - BLOCK
      ?AUTO_3167 - BLOCK
      ?AUTO_3168 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_3162 ) ( CLEAR ?AUTO_3162 ) ( CLEAR ?AUTO_3165 ) ( ON ?AUTO_3167 ?AUTO_3163 ) ( ON ?AUTO_3168 ?AUTO_3167 ) ( CLEAR ?AUTO_3168 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3168 ?AUTO_3167 )
      ( MAKE-ON ?AUTO_3162 ?AUTO_3163 )
      ( MAKE-ON-VERIFY ?AUTO_3162 ?AUTO_3163 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3171 - BLOCK
      ?AUTO_3172 - BLOCK
    )
    :vars
    (
      ?AUTO_3176 - BLOCK
      ?AUTO_3173 - BLOCK
      ?AUTO_3175 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3176 ) ( ON ?AUTO_3173 ?AUTO_3172 ) ( ON ?AUTO_3175 ?AUTO_3173 ) ( CLEAR ?AUTO_3175 ) ( HOLDING ?AUTO_3171 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3171 )
      ( MAKE-ON ?AUTO_3171 ?AUTO_3172 )
      ( MAKE-ON-VERIFY ?AUTO_3171 ?AUTO_3172 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3179 - BLOCK
      ?AUTO_3180 - BLOCK
    )
    :vars
    (
      ?AUTO_3185 - BLOCK
      ?AUTO_3182 - BLOCK
      ?AUTO_3181 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3185 ) ( ON ?AUTO_3182 ?AUTO_3180 ) ( ON ?AUTO_3181 ?AUTO_3182 ) ( ON ?AUTO_3179 ?AUTO_3181 ) ( CLEAR ?AUTO_3179 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3179 ?AUTO_3181 )
      ( MAKE-ON ?AUTO_3179 ?AUTO_3180 )
      ( MAKE-ON-VERIFY ?AUTO_3179 ?AUTO_3180 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3188 - BLOCK
      ?AUTO_3189 - BLOCK
    )
    :vars
    (
      ?AUTO_3192 - BLOCK
      ?AUTO_3194 - BLOCK
      ?AUTO_3193 - BLOCK
      ?AUTO_3195 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3192 ) ( ON ?AUTO_3194 ?AUTO_3189 ) ( ON ?AUTO_3193 ?AUTO_3194 ) ( ON ?AUTO_3188 ?AUTO_3193 ) ( CLEAR ?AUTO_3188 ) ( HOLDING ?AUTO_3195 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3195 )
      ( MAKE-ON ?AUTO_3188 ?AUTO_3189 )
      ( MAKE-ON-VERIFY ?AUTO_3188 ?AUTO_3189 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3196 - BLOCK
      ?AUTO_3197 - BLOCK
    )
    :vars
    (
      ?AUTO_3198 - BLOCK
      ?AUTO_3199 - BLOCK
      ?AUTO_3203 - BLOCK
      ?AUTO_3202 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3198 ) ( ON ?AUTO_3199 ?AUTO_3197 ) ( ON ?AUTO_3203 ?AUTO_3199 ) ( ON ?AUTO_3196 ?AUTO_3203 ) ( ON ?AUTO_3202 ?AUTO_3196 ) ( CLEAR ?AUTO_3202 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3202 ?AUTO_3196 )
      ( MAKE-ON ?AUTO_3196 ?AUTO_3197 )
      ( MAKE-ON-VERIFY ?AUTO_3196 ?AUTO_3197 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3206 - BLOCK
      ?AUTO_3207 - BLOCK
    )
    :vars
    (
      ?AUTO_3210 - BLOCK
      ?AUTO_3209 - BLOCK
      ?AUTO_3208 - BLOCK
      ?AUTO_3212 - BLOCK
      ?AUTO_3215 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3210 ?AUTO_3207 ) ( ON ?AUTO_3209 ?AUTO_3210 ) ( ON ?AUTO_3206 ?AUTO_3209 ) ( ON ?AUTO_3208 ?AUTO_3206 ) ( CLEAR ?AUTO_3208 ) ( HOLDING ?AUTO_3212 ) ( CLEAR ?AUTO_3215 ) )
    :subtasks
    ( ( !STACK ?AUTO_3212 ?AUTO_3215 )
      ( MAKE-ON ?AUTO_3206 ?AUTO_3207 )
      ( MAKE-ON-VERIFY ?AUTO_3206 ?AUTO_3207 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3217 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3217 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3217 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3217 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3219 - BLOCK
    )
    :vars
    (
      ?AUTO_3222 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3219 ?AUTO_3222 ) ( CLEAR ?AUTO_3219 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3219 ?AUTO_3222 )
      ( MAKE-ON-TABLE ?AUTO_3219 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3219 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3224 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3224 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3224 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3224 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3226 - BLOCK
    )
    :vars
    (
      ?AUTO_3229 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3226 ?AUTO_3229 ) ( CLEAR ?AUTO_3226 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3226 ?AUTO_3229 )
      ( MAKE-ON-TABLE ?AUTO_3226 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3226 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3230 - BLOCK
    )
    :vars
    (
      ?AUTO_3232 - BLOCK
      ?AUTO_3233 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3230 ?AUTO_3232 ) ( CLEAR ?AUTO_3230 ) ( HOLDING ?AUTO_3233 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3233 )
      ( MAKE-ON-TABLE ?AUTO_3230 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3230 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3234 - BLOCK
    )
    :vars
    (
      ?AUTO_3236 - BLOCK
      ?AUTO_3237 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3234 ?AUTO_3236 ) ( ON ?AUTO_3237 ?AUTO_3234 ) ( CLEAR ?AUTO_3237 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3237 ?AUTO_3234 )
      ( MAKE-ON-TABLE ?AUTO_3234 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3234 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3242 - BLOCK
      ?AUTO_3243 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3242 ) ( CLEAR ?AUTO_3243 ) )
    :subtasks
    ( ( !STACK ?AUTO_3242 ?AUTO_3243 )
      ( MAKE-ON-VERIFY ?AUTO_3242 ?AUTO_3243 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3246 - BLOCK
      ?AUTO_3247 - BLOCK
    )
    :vars
    (
      ?AUTO_3251 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3247 ) ( ON ?AUTO_3246 ?AUTO_3251 ) ( CLEAR ?AUTO_3246 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3246 ?AUTO_3251 )
      ( MAKE-ON ?AUTO_3246 ?AUTO_3247 )
      ( MAKE-ON-VERIFY ?AUTO_3246 ?AUTO_3247 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3252 - BLOCK
      ?AUTO_3253 - BLOCK
    )
    :vars
    (
      ?AUTO_3256 - BLOCK
      ?AUTO_3257 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3253 ) ( ON ?AUTO_3252 ?AUTO_3256 ) ( CLEAR ?AUTO_3252 ) ( HOLDING ?AUTO_3257 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3257 )
      ( MAKE-ON ?AUTO_3252 ?AUTO_3253 )
      ( MAKE-ON-VERIFY ?AUTO_3252 ?AUTO_3253 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3266 - BLOCK
      ?AUTO_3267 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3266 ) ( CLEAR ?AUTO_3267 ) )
    :subtasks
    ( ( !STACK ?AUTO_3266 ?AUTO_3267 )
      ( MAKE-ON-VERIFY ?AUTO_3266 ?AUTO_3267 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3270 - BLOCK
      ?AUTO_3271 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3271 ) ( ON-TABLE ?AUTO_3270 ) ( CLEAR ?AUTO_3270 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_3270 )
      ( MAKE-ON ?AUTO_3270 ?AUTO_3271 )
      ( MAKE-ON-VERIFY ?AUTO_3270 ?AUTO_3271 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3275 - BLOCK
      ?AUTO_3276 - BLOCK
    )
    :vars
    (
      ?AUTO_3279 - BLOCK
      ?AUTO_3280 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3276 ) ( ON-TABLE ?AUTO_3275 ) ( CLEAR ?AUTO_3275 ) ( HOLDING ?AUTO_3279 ) ( CLEAR ?AUTO_3280 ) )
    :subtasks
    ( ( !STACK ?AUTO_3279 ?AUTO_3280 )
      ( MAKE-ON ?AUTO_3275 ?AUTO_3276 )
      ( MAKE-ON-VERIFY ?AUTO_3275 ?AUTO_3276 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3281 - BLOCK
      ?AUTO_3282 - BLOCK
    )
    :vars
    (
      ?AUTO_3286 - BLOCK
      ?AUTO_3285 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_3281 ) ( CLEAR ?AUTO_3281 ) ( CLEAR ?AUTO_3286 ) ( ON ?AUTO_3285 ?AUTO_3282 ) ( CLEAR ?AUTO_3285 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3285 ?AUTO_3282 )
      ( MAKE-ON ?AUTO_3281 ?AUTO_3282 )
      ( MAKE-ON-VERIFY ?AUTO_3281 ?AUTO_3282 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3289 - BLOCK
      ?AUTO_3290 - BLOCK
    )
    :vars
    (
      ?AUTO_3291 - BLOCK
      ?AUTO_3294 - BLOCK
      ?AUTO_3295 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_3289 ) ( CLEAR ?AUTO_3289 ) ( CLEAR ?AUTO_3291 ) ( ON ?AUTO_3294 ?AUTO_3290 ) ( CLEAR ?AUTO_3294 ) ( HOLDING ?AUTO_3295 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3295 )
      ( MAKE-ON ?AUTO_3289 ?AUTO_3290 )
      ( MAKE-ON-VERIFY ?AUTO_3289 ?AUTO_3290 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3296 - BLOCK
      ?AUTO_3297 - BLOCK
    )
    :vars
    (
      ?AUTO_3299 - BLOCK
      ?AUTO_3301 - BLOCK
      ?AUTO_3302 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_3296 ) ( CLEAR ?AUTO_3299 ) ( ON ?AUTO_3301 ?AUTO_3297 ) ( CLEAR ?AUTO_3301 ) ( ON ?AUTO_3302 ?AUTO_3296 ) ( CLEAR ?AUTO_3302 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3302 ?AUTO_3296 )
      ( MAKE-ON ?AUTO_3296 ?AUTO_3297 )
      ( MAKE-ON-VERIFY ?AUTO_3296 ?AUTO_3297 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3305 - BLOCK
      ?AUTO_3306 - BLOCK
    )
    :vars
    (
      ?AUTO_3310 - BLOCK
      ?AUTO_3307 - BLOCK
      ?AUTO_3308 - BLOCK
      ?AUTO_3312 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_3305 ) ( CLEAR ?AUTO_3310 ) ( ON ?AUTO_3307 ?AUTO_3306 ) ( CLEAR ?AUTO_3307 ) ( ON ?AUTO_3308 ?AUTO_3305 ) ( CLEAR ?AUTO_3308 ) ( HOLDING ?AUTO_3312 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3312 )
      ( MAKE-ON ?AUTO_3305 ?AUTO_3306 )
      ( MAKE-ON-VERIFY ?AUTO_3305 ?AUTO_3306 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3313 - BLOCK
      ?AUTO_3314 - BLOCK
    )
    :vars
    (
      ?AUTO_3320 - BLOCK
      ?AUTO_3315 - BLOCK
      ?AUTO_3318 - BLOCK
      ?AUTO_3319 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_3313 ) ( CLEAR ?AUTO_3320 ) ( ON ?AUTO_3315 ?AUTO_3314 ) ( CLEAR ?AUTO_3315 ) ( ON ?AUTO_3318 ?AUTO_3313 ) ( ON ?AUTO_3319 ?AUTO_3318 ) ( CLEAR ?AUTO_3319 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3319 ?AUTO_3318 )
      ( MAKE-ON ?AUTO_3313 ?AUTO_3314 )
      ( MAKE-ON-VERIFY ?AUTO_3313 ?AUTO_3314 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3322 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3322 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3322 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3322 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3324 - BLOCK
    )
    :vars
    (
      ?AUTO_3327 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3324 ?AUTO_3327 ) ( CLEAR ?AUTO_3324 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3324 ?AUTO_3327 )
      ( MAKE-ON-TABLE ?AUTO_3324 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3324 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3329 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3329 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3329 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3329 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3331 - BLOCK
    )
    :vars
    (
      ?AUTO_3334 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3331 ?AUTO_3334 ) ( CLEAR ?AUTO_3331 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3331 ?AUTO_3334 )
      ( MAKE-ON-TABLE ?AUTO_3331 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3331 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3335 - BLOCK
    )
    :vars
    (
      ?AUTO_3337 - BLOCK
      ?AUTO_3338 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3335 ?AUTO_3337 ) ( CLEAR ?AUTO_3335 ) ( HOLDING ?AUTO_3338 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3338 )
      ( MAKE-ON-TABLE ?AUTO_3335 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3335 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3339 - BLOCK
    )
    :vars
    (
      ?AUTO_3341 - BLOCK
      ?AUTO_3342 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3339 ?AUTO_3341 ) ( ON ?AUTO_3342 ?AUTO_3339 ) ( CLEAR ?AUTO_3342 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3342 ?AUTO_3339 )
      ( MAKE-ON-TABLE ?AUTO_3339 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3339 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3346 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3346 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3346 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3346 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3348 - BLOCK
    )
    :vars
    (
      ?AUTO_3351 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3348 ?AUTO_3351 ) ( CLEAR ?AUTO_3348 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3348 ?AUTO_3351 )
      ( MAKE-ON-TABLE ?AUTO_3348 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3348 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3352 - BLOCK
    )
    :vars
    (
      ?AUTO_3354 - BLOCK
      ?AUTO_3355 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3352 ?AUTO_3354 ) ( CLEAR ?AUTO_3352 ) ( HOLDING ?AUTO_3355 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3355 )
      ( MAKE-ON-TABLE ?AUTO_3352 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3352 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3361 - BLOCK
      ?AUTO_3362 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3361 ) ( CLEAR ?AUTO_3362 ) )
    :subtasks
    ( ( !STACK ?AUTO_3361 ?AUTO_3362 )
      ( MAKE-ON-VERIFY ?AUTO_3361 ?AUTO_3362 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3365 - BLOCK
      ?AUTO_3366 - BLOCK
    )
    :vars
    (
      ?AUTO_3370 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3366 ) ( ON ?AUTO_3365 ?AUTO_3370 ) ( CLEAR ?AUTO_3365 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3365 ?AUTO_3370 )
      ( MAKE-ON ?AUTO_3365 ?AUTO_3366 )
      ( MAKE-ON-VERIFY ?AUTO_3365 ?AUTO_3366 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3371 - BLOCK
      ?AUTO_3372 - BLOCK
    )
    :vars
    (
      ?AUTO_3375 - BLOCK
      ?AUTO_3376 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3372 ) ( ON ?AUTO_3371 ?AUTO_3375 ) ( CLEAR ?AUTO_3371 ) ( HOLDING ?AUTO_3376 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3376 )
      ( MAKE-ON ?AUTO_3371 ?AUTO_3372 )
      ( MAKE-ON-VERIFY ?AUTO_3371 ?AUTO_3372 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3377 - BLOCK
      ?AUTO_3378 - BLOCK
    )
    :vars
    (
      ?AUTO_3381 - BLOCK
      ?AUTO_3382 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3378 ) ( ON ?AUTO_3377 ?AUTO_3381 ) ( ON ?AUTO_3382 ?AUTO_3377 ) ( CLEAR ?AUTO_3382 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3382 ?AUTO_3377 )
      ( MAKE-ON ?AUTO_3377 ?AUTO_3378 )
      ( MAKE-ON-VERIFY ?AUTO_3377 ?AUTO_3378 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3385 - BLOCK
      ?AUTO_3386 - BLOCK
    )
    :vars
    (
      ?AUTO_3390 - BLOCK
      ?AUTO_3387 - BLOCK
      ?AUTO_3391 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3386 ) ( ON ?AUTO_3385 ?AUTO_3390 ) ( ON ?AUTO_3387 ?AUTO_3385 ) ( CLEAR ?AUTO_3387 ) ( HOLDING ?AUTO_3391 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3391 )
      ( MAKE-ON ?AUTO_3385 ?AUTO_3386 )
      ( MAKE-ON-VERIFY ?AUTO_3385 ?AUTO_3386 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3399 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3399 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3399 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3399 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3401 - BLOCK
    )
    :vars
    (
      ?AUTO_3404 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3401 ?AUTO_3404 ) ( CLEAR ?AUTO_3401 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3401 ?AUTO_3404 )
      ( MAKE-ON-TABLE ?AUTO_3401 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3401 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3405 - BLOCK
    )
    :vars
    (
      ?AUTO_3407 - BLOCK
      ?AUTO_3408 - BLOCK
      ?AUTO_3409 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3405 ?AUTO_3407 ) ( CLEAR ?AUTO_3405 ) ( HOLDING ?AUTO_3408 ) ( CLEAR ?AUTO_3409 ) )
    :subtasks
    ( ( !STACK ?AUTO_3408 ?AUTO_3409 )
      ( MAKE-ON-TABLE ?AUTO_3405 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3405 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3410 - BLOCK
    )
    :vars
    (
      ?AUTO_3412 - BLOCK
      ?AUTO_3414 - BLOCK
      ?AUTO_3413 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3410 ?AUTO_3412 ) ( CLEAR ?AUTO_3414 ) ( ON ?AUTO_3413 ?AUTO_3410 ) ( CLEAR ?AUTO_3413 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3413 ?AUTO_3410 )
      ( MAKE-ON-TABLE ?AUTO_3410 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3410 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3417 - BLOCK
    )
    :vars
    (
      ?AUTO_3421 - BLOCK
      ?AUTO_3418 - BLOCK
      ?AUTO_3419 - BLOCK
      ?AUTO_3422 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3417 ?AUTO_3421 ) ( CLEAR ?AUTO_3418 ) ( ON ?AUTO_3419 ?AUTO_3417 ) ( CLEAR ?AUTO_3419 ) ( HOLDING ?AUTO_3422 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3422 )
      ( MAKE-ON-TABLE ?AUTO_3417 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3417 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3423 - BLOCK
    )
    :vars
    (
      ?AUTO_3424 - BLOCK
      ?AUTO_3425 - BLOCK
      ?AUTO_3426 - BLOCK
      ?AUTO_3428 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3423 ?AUTO_3424 ) ( CLEAR ?AUTO_3425 ) ( ON ?AUTO_3426 ?AUTO_3423 ) ( ON ?AUTO_3428 ?AUTO_3426 ) ( CLEAR ?AUTO_3428 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3428 ?AUTO_3426 )
      ( MAKE-ON-TABLE ?AUTO_3423 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3423 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3431 - BLOCK
    )
    :vars
    (
      ?AUTO_3434 - BLOCK
      ?AUTO_3432 - BLOCK
      ?AUTO_3436 - BLOCK
      ?AUTO_3435 - BLOCK
      ?AUTO_3437 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3431 ?AUTO_3434 ) ( CLEAR ?AUTO_3432 ) ( ON ?AUTO_3436 ?AUTO_3431 ) ( ON ?AUTO_3435 ?AUTO_3436 ) ( CLEAR ?AUTO_3435 ) ( HOLDING ?AUTO_3437 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3437 )
      ( MAKE-ON-TABLE ?AUTO_3431 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3431 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3443 - BLOCK
      ?AUTO_3444 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3443 ) ( CLEAR ?AUTO_3444 ) )
    :subtasks
    ( ( !STACK ?AUTO_3443 ?AUTO_3444 )
      ( MAKE-ON-VERIFY ?AUTO_3443 ?AUTO_3444 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3447 - BLOCK
      ?AUTO_3448 - BLOCK
    )
    :vars
    (
      ?AUTO_3452 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3448 ) ( ON ?AUTO_3447 ?AUTO_3452 ) ( CLEAR ?AUTO_3447 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3447 ?AUTO_3452 )
      ( MAKE-ON ?AUTO_3447 ?AUTO_3448 )
      ( MAKE-ON-VERIFY ?AUTO_3447 ?AUTO_3448 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3453 - BLOCK
      ?AUTO_3454 - BLOCK
    )
    :vars
    (
      ?AUTO_3457 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3453 ?AUTO_3457 ) ( CLEAR ?AUTO_3453 ) ( HOLDING ?AUTO_3454 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3454 )
      ( MAKE-ON ?AUTO_3453 ?AUTO_3454 )
      ( MAKE-ON-VERIFY ?AUTO_3453 ?AUTO_3454 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3461 - BLOCK
      ?AUTO_3462 - BLOCK
    )
    :vars
    (
      ?AUTO_3463 - BLOCK
      ?AUTO_3466 - BLOCK
      ?AUTO_3467 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3462 ) ( ON ?AUTO_3461 ?AUTO_3463 ) ( CLEAR ?AUTO_3461 ) ( HOLDING ?AUTO_3466 ) ( CLEAR ?AUTO_3467 ) )
    :subtasks
    ( ( !STACK ?AUTO_3466 ?AUTO_3467 )
      ( MAKE-ON ?AUTO_3461 ?AUTO_3462 )
      ( MAKE-ON-VERIFY ?AUTO_3461 ?AUTO_3462 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3468 - BLOCK
      ?AUTO_3469 - BLOCK
    )
    :vars
    (
      ?AUTO_3472 - BLOCK
      ?AUTO_3474 - BLOCK
      ?AUTO_3473 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3468 ?AUTO_3472 ) ( CLEAR ?AUTO_3468 ) ( CLEAR ?AUTO_3474 ) ( ON ?AUTO_3473 ?AUTO_3469 ) ( CLEAR ?AUTO_3473 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3473 ?AUTO_3469 )
      ( MAKE-ON ?AUTO_3468 ?AUTO_3469 )
      ( MAKE-ON-VERIFY ?AUTO_3468 ?AUTO_3469 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3477 - BLOCK
      ?AUTO_3478 - BLOCK
    )
    :vars
    (
      ?AUTO_3483 - BLOCK
      ?AUTO_3479 - BLOCK
      ?AUTO_3480 - BLOCK
      ?AUTO_3484 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3477 ?AUTO_3483 ) ( CLEAR ?AUTO_3477 ) ( CLEAR ?AUTO_3479 ) ( ON ?AUTO_3480 ?AUTO_3478 ) ( CLEAR ?AUTO_3480 ) ( HOLDING ?AUTO_3484 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3484 )
      ( MAKE-ON ?AUTO_3477 ?AUTO_3478 )
      ( MAKE-ON-VERIFY ?AUTO_3477 ?AUTO_3478 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3485 - BLOCK
      ?AUTO_3486 - BLOCK
    )
    :vars
    (
      ?AUTO_3488 - BLOCK
      ?AUTO_3487 - BLOCK
      ?AUTO_3490 - BLOCK
      ?AUTO_3492 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3485 ?AUTO_3488 ) ( CLEAR ?AUTO_3485 ) ( CLEAR ?AUTO_3487 ) ( ON ?AUTO_3490 ?AUTO_3486 ) ( ON ?AUTO_3492 ?AUTO_3490 ) ( CLEAR ?AUTO_3492 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3492 ?AUTO_3490 )
      ( MAKE-ON ?AUTO_3485 ?AUTO_3486 )
      ( MAKE-ON-VERIFY ?AUTO_3485 ?AUTO_3486 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3495 - BLOCK
      ?AUTO_3496 - BLOCK
    )
    :vars
    (
      ?AUTO_3499 - BLOCK
      ?AUTO_3502 - BLOCK
      ?AUTO_3497 - BLOCK
      ?AUTO_3501 - BLOCK
      ?AUTO_3503 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3495 ?AUTO_3499 ) ( CLEAR ?AUTO_3495 ) ( CLEAR ?AUTO_3502 ) ( ON ?AUTO_3497 ?AUTO_3496 ) ( ON ?AUTO_3501 ?AUTO_3497 ) ( CLEAR ?AUTO_3501 ) ( HOLDING ?AUTO_3503 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3503 )
      ( MAKE-ON ?AUTO_3495 ?AUTO_3496 )
      ( MAKE-ON-VERIFY ?AUTO_3495 ?AUTO_3496 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3504 - BLOCK
      ?AUTO_3505 - BLOCK
    )
    :vars
    (
      ?AUTO_3510 - BLOCK
      ?AUTO_3509 - BLOCK
      ?AUTO_3506 - BLOCK
      ?AUTO_3512 - BLOCK
      ?AUTO_3511 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3504 ?AUTO_3510 ) ( CLEAR ?AUTO_3509 ) ( ON ?AUTO_3506 ?AUTO_3505 ) ( ON ?AUTO_3512 ?AUTO_3506 ) ( CLEAR ?AUTO_3512 ) ( ON ?AUTO_3511 ?AUTO_3504 ) ( CLEAR ?AUTO_3511 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3511 ?AUTO_3504 )
      ( MAKE-ON ?AUTO_3504 ?AUTO_3505 )
      ( MAKE-ON-VERIFY ?AUTO_3504 ?AUTO_3505 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3515 - BLOCK
      ?AUTO_3516 - BLOCK
    )
    :vars
    (
      ?AUTO_3518 - BLOCK
      ?AUTO_3521 - BLOCK
      ?AUTO_3519 - BLOCK
      ?AUTO_3523 - BLOCK
      ?AUTO_3520 - BLOCK
      ?AUTO_3524 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3515 ?AUTO_3518 ) ( CLEAR ?AUTO_3521 ) ( ON ?AUTO_3519 ?AUTO_3516 ) ( ON ?AUTO_3523 ?AUTO_3519 ) ( CLEAR ?AUTO_3523 ) ( ON ?AUTO_3520 ?AUTO_3515 ) ( CLEAR ?AUTO_3520 ) ( HOLDING ?AUTO_3524 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3524 )
      ( MAKE-ON ?AUTO_3515 ?AUTO_3516 )
      ( MAKE-ON-VERIFY ?AUTO_3515 ?AUTO_3516 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3525 - BLOCK
      ?AUTO_3526 - BLOCK
    )
    :vars
    (
      ?AUTO_3529 - BLOCK
      ?AUTO_3532 - BLOCK
      ?AUTO_3533 - BLOCK
      ?AUTO_3528 - BLOCK
      ?AUTO_3527 - BLOCK
      ?AUTO_3534 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3525 ?AUTO_3529 ) ( CLEAR ?AUTO_3532 ) ( ON ?AUTO_3533 ?AUTO_3526 ) ( ON ?AUTO_3528 ?AUTO_3533 ) ( CLEAR ?AUTO_3528 ) ( ON ?AUTO_3527 ?AUTO_3525 ) ( ON ?AUTO_3534 ?AUTO_3527 ) ( CLEAR ?AUTO_3534 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3534 ?AUTO_3527 )
      ( MAKE-ON ?AUTO_3525 ?AUTO_3526 )
      ( MAKE-ON-VERIFY ?AUTO_3525 ?AUTO_3526 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3539 - BLOCK
      ?AUTO_3540 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3539 ) ( CLEAR ?AUTO_3540 ) )
    :subtasks
    ( ( !STACK ?AUTO_3539 ?AUTO_3540 )
      ( MAKE-ON-VERIFY ?AUTO_3539 ?AUTO_3540 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3543 - BLOCK
      ?AUTO_3544 - BLOCK
    )
    :vars
    (
      ?AUTO_3548 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3544 ) ( ON ?AUTO_3543 ?AUTO_3548 ) ( CLEAR ?AUTO_3543 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3543 ?AUTO_3548 )
      ( MAKE-ON ?AUTO_3543 ?AUTO_3544 )
      ( MAKE-ON-VERIFY ?AUTO_3543 ?AUTO_3544 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3549 - BLOCK
      ?AUTO_3550 - BLOCK
    )
    :vars
    (
      ?AUTO_3553 - BLOCK
      ?AUTO_3554 - BLOCK
      ?AUTO_3555 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3550 ) ( ON ?AUTO_3549 ?AUTO_3553 ) ( CLEAR ?AUTO_3549 ) ( HOLDING ?AUTO_3554 ) ( CLEAR ?AUTO_3555 ) )
    :subtasks
    ( ( !STACK ?AUTO_3554 ?AUTO_3555 )
      ( MAKE-ON ?AUTO_3549 ?AUTO_3550 )
      ( MAKE-ON-VERIFY ?AUTO_3549 ?AUTO_3550 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3556 - BLOCK
      ?AUTO_3557 - BLOCK
    )
    :vars
    (
      ?AUTO_3560 - BLOCK
      ?AUTO_3562 - BLOCK
      ?AUTO_3561 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3556 ?AUTO_3560 ) ( CLEAR ?AUTO_3556 ) ( CLEAR ?AUTO_3562 ) ( ON ?AUTO_3561 ?AUTO_3557 ) ( CLEAR ?AUTO_3561 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3561 ?AUTO_3557 )
      ( MAKE-ON ?AUTO_3556 ?AUTO_3557 )
      ( MAKE-ON-VERIFY ?AUTO_3556 ?AUTO_3557 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3565 - BLOCK
      ?AUTO_3566 - BLOCK
    )
    :vars
    (
      ?AUTO_3571 - BLOCK
      ?AUTO_3567 - BLOCK
      ?AUTO_3568 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3565 ?AUTO_3571 ) ( CLEAR ?AUTO_3565 ) ( ON ?AUTO_3567 ?AUTO_3566 ) ( CLEAR ?AUTO_3567 ) ( HOLDING ?AUTO_3568 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3568 )
      ( MAKE-ON ?AUTO_3565 ?AUTO_3566 )
      ( MAKE-ON-VERIFY ?AUTO_3565 ?AUTO_3566 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3573 - BLOCK
      ?AUTO_3574 - BLOCK
    )
    :vars
    (
      ?AUTO_3579 - BLOCK
      ?AUTO_3575 - BLOCK
      ?AUTO_3577 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3573 ?AUTO_3579 ) ( ON ?AUTO_3575 ?AUTO_3574 ) ( CLEAR ?AUTO_3575 ) ( ON ?AUTO_3577 ?AUTO_3573 ) ( CLEAR ?AUTO_3577 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3577 ?AUTO_3573 )
      ( MAKE-ON ?AUTO_3573 ?AUTO_3574 )
      ( MAKE-ON-VERIFY ?AUTO_3573 ?AUTO_3574 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3582 - BLOCK
      ?AUTO_3583 - BLOCK
    )
    :vars
    (
      ?AUTO_3588 - BLOCK
      ?AUTO_3586 - BLOCK
      ?AUTO_3587 - BLOCK
      ?AUTO_3589 - BLOCK
      ?AUTO_3590 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3582 ?AUTO_3588 ) ( ON ?AUTO_3586 ?AUTO_3583 ) ( CLEAR ?AUTO_3586 ) ( ON ?AUTO_3587 ?AUTO_3582 ) ( CLEAR ?AUTO_3587 ) ( HOLDING ?AUTO_3589 ) ( CLEAR ?AUTO_3590 ) )
    :subtasks
    ( ( !STACK ?AUTO_3589 ?AUTO_3590 )
      ( MAKE-ON ?AUTO_3582 ?AUTO_3583 )
      ( MAKE-ON-VERIFY ?AUTO_3582 ?AUTO_3583 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3591 - BLOCK
      ?AUTO_3592 - BLOCK
    )
    :vars
    (
      ?AUTO_3593 - BLOCK
      ?AUTO_3599 - BLOCK
      ?AUTO_3598 - BLOCK
      ?AUTO_3595 - BLOCK
      ?AUTO_3594 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3591 ?AUTO_3593 ) ( ON ?AUTO_3599 ?AUTO_3592 ) ( CLEAR ?AUTO_3599 ) ( ON ?AUTO_3598 ?AUTO_3591 ) ( CLEAR ?AUTO_3595 ) ( ON ?AUTO_3594 ?AUTO_3598 ) ( CLEAR ?AUTO_3594 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3594 ?AUTO_3598 )
      ( MAKE-ON ?AUTO_3591 ?AUTO_3592 )
      ( MAKE-ON-VERIFY ?AUTO_3591 ?AUTO_3592 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3602 - BLOCK
      ?AUTO_3603 - BLOCK
    )
    :vars
    (
      ?AUTO_3607 - BLOCK
      ?AUTO_3610 - BLOCK
      ?AUTO_3608 - BLOCK
      ?AUTO_3609 - BLOCK
      ?AUTO_3606 - BLOCK
      ?AUTO_3611 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3602 ?AUTO_3607 ) ( ON ?AUTO_3610 ?AUTO_3603 ) ( CLEAR ?AUTO_3610 ) ( ON ?AUTO_3608 ?AUTO_3602 ) ( CLEAR ?AUTO_3609 ) ( ON ?AUTO_3606 ?AUTO_3608 ) ( CLEAR ?AUTO_3606 ) ( HOLDING ?AUTO_3611 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3611 )
      ( MAKE-ON ?AUTO_3602 ?AUTO_3603 )
      ( MAKE-ON-VERIFY ?AUTO_3602 ?AUTO_3603 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3612 - BLOCK
      ?AUTO_3613 - BLOCK
    )
    :vars
    (
      ?AUTO_3620 - BLOCK
      ?AUTO_3615 - BLOCK
      ?AUTO_3619 - BLOCK
      ?AUTO_3614 - BLOCK
      ?AUTO_3621 - BLOCK
      ?AUTO_3616 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3612 ?AUTO_3620 ) ( ON ?AUTO_3615 ?AUTO_3613 ) ( CLEAR ?AUTO_3615 ) ( ON ?AUTO_3619 ?AUTO_3612 ) ( CLEAR ?AUTO_3614 ) ( ON ?AUTO_3621 ?AUTO_3619 ) ( ON ?AUTO_3616 ?AUTO_3621 ) ( CLEAR ?AUTO_3616 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3616 ?AUTO_3621 )
      ( MAKE-ON ?AUTO_3612 ?AUTO_3613 )
      ( MAKE-ON-VERIFY ?AUTO_3612 ?AUTO_3613 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3624 - BLOCK
      ?AUTO_3625 - BLOCK
    )
    :vars
    (
      ?AUTO_3633 - BLOCK
      ?AUTO_3629 - BLOCK
      ?AUTO_3627 - BLOCK
      ?AUTO_3628 - BLOCK
      ?AUTO_3630 - BLOCK
      ?AUTO_3632 - BLOCK
      ?AUTO_3634 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3624 ?AUTO_3633 ) ( ON ?AUTO_3629 ?AUTO_3625 ) ( CLEAR ?AUTO_3629 ) ( ON ?AUTO_3627 ?AUTO_3624 ) ( CLEAR ?AUTO_3628 ) ( ON ?AUTO_3630 ?AUTO_3627 ) ( ON ?AUTO_3632 ?AUTO_3630 ) ( CLEAR ?AUTO_3632 ) ( HOLDING ?AUTO_3634 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3634 )
      ( MAKE-ON ?AUTO_3624 ?AUTO_3625 )
      ( MAKE-ON-VERIFY ?AUTO_3624 ?AUTO_3625 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3635 - BLOCK
      ?AUTO_3636 - BLOCK
    )
    :vars
    (
      ?AUTO_3637 - BLOCK
      ?AUTO_3644 - BLOCK
      ?AUTO_3643 - BLOCK
      ?AUTO_3645 - BLOCK
      ?AUTO_3639 - BLOCK
      ?AUTO_3638 - BLOCK
      ?AUTO_3640 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3635 ?AUTO_3637 ) ( ON ?AUTO_3644 ?AUTO_3636 ) ( ON ?AUTO_3643 ?AUTO_3635 ) ( CLEAR ?AUTO_3645 ) ( ON ?AUTO_3639 ?AUTO_3643 ) ( ON ?AUTO_3638 ?AUTO_3639 ) ( CLEAR ?AUTO_3638 ) ( ON ?AUTO_3640 ?AUTO_3644 ) ( CLEAR ?AUTO_3640 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3640 ?AUTO_3644 )
      ( MAKE-ON ?AUTO_3635 ?AUTO_3636 )
      ( MAKE-ON-VERIFY ?AUTO_3635 ?AUTO_3636 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3648 - BLOCK
      ?AUTO_3649 - BLOCK
    )
    :vars
    (
      ?AUTO_3652 - BLOCK
      ?AUTO_3650 - BLOCK
      ?AUTO_3654 - BLOCK
      ?AUTO_3657 - BLOCK
      ?AUTO_3658 - BLOCK
      ?AUTO_3653 - BLOCK
      ?AUTO_3655 - BLOCK
      ?AUTO_3659 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3648 ?AUTO_3652 ) ( ON ?AUTO_3650 ?AUTO_3649 ) ( ON ?AUTO_3654 ?AUTO_3648 ) ( CLEAR ?AUTO_3657 ) ( ON ?AUTO_3658 ?AUTO_3654 ) ( ON ?AUTO_3653 ?AUTO_3658 ) ( CLEAR ?AUTO_3653 ) ( ON ?AUTO_3655 ?AUTO_3650 ) ( CLEAR ?AUTO_3655 ) ( HOLDING ?AUTO_3659 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3659 )
      ( MAKE-ON ?AUTO_3648 ?AUTO_3649 )
      ( MAKE-ON-VERIFY ?AUTO_3648 ?AUTO_3649 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3660 - BLOCK
      ?AUTO_3661 - BLOCK
    )
    :vars
    (
      ?AUTO_3671 - BLOCK
      ?AUTO_3665 - BLOCK
      ?AUTO_3666 - BLOCK
      ?AUTO_3663 - BLOCK
      ?AUTO_3670 - BLOCK
      ?AUTO_3664 - BLOCK
      ?AUTO_3662 - BLOCK
      ?AUTO_3667 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3660 ?AUTO_3671 ) ( ON ?AUTO_3665 ?AUTO_3661 ) ( ON ?AUTO_3666 ?AUTO_3660 ) ( CLEAR ?AUTO_3663 ) ( ON ?AUTO_3670 ?AUTO_3666 ) ( ON ?AUTO_3664 ?AUTO_3670 ) ( CLEAR ?AUTO_3664 ) ( ON ?AUTO_3662 ?AUTO_3665 ) ( ON ?AUTO_3667 ?AUTO_3662 ) ( CLEAR ?AUTO_3667 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3667 ?AUTO_3662 )
      ( MAKE-ON ?AUTO_3660 ?AUTO_3661 )
      ( MAKE-ON-VERIFY ?AUTO_3660 ?AUTO_3661 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3673 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3673 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3673 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3673 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3675 - BLOCK
    )
    :vars
    (
      ?AUTO_3678 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3675 ?AUTO_3678 ) ( CLEAR ?AUTO_3675 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3675 ?AUTO_3678 )
      ( MAKE-ON-TABLE ?AUTO_3675 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3675 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3680 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3680 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3680 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3680 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3682 - BLOCK
    )
    :vars
    (
      ?AUTO_3685 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3682 ?AUTO_3685 ) ( CLEAR ?AUTO_3682 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3682 ?AUTO_3685 )
      ( MAKE-ON-TABLE ?AUTO_3682 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3682 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3686 - BLOCK
    )
    :vars
    (
      ?AUTO_3688 - BLOCK
      ?AUTO_3689 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3686 ?AUTO_3688 ) ( CLEAR ?AUTO_3686 ) ( HOLDING ?AUTO_3689 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3689 )
      ( MAKE-ON-TABLE ?AUTO_3686 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3686 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3690 - BLOCK
    )
    :vars
    (
      ?AUTO_3692 - BLOCK
      ?AUTO_3693 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3690 ?AUTO_3692 ) ( ON ?AUTO_3693 ?AUTO_3690 ) ( CLEAR ?AUTO_3693 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3693 ?AUTO_3690 )
      ( MAKE-ON-TABLE ?AUTO_3690 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3690 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3698 - BLOCK
      ?AUTO_3699 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3698 ) ( CLEAR ?AUTO_3699 ) )
    :subtasks
    ( ( !STACK ?AUTO_3698 ?AUTO_3699 )
      ( MAKE-ON-VERIFY ?AUTO_3698 ?AUTO_3699 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3702 - BLOCK
      ?AUTO_3703 - BLOCK
    )
    :vars
    (
      ?AUTO_3707 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3703 ) ( ON ?AUTO_3702 ?AUTO_3707 ) ( CLEAR ?AUTO_3702 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3702 ?AUTO_3707 )
      ( MAKE-ON ?AUTO_3702 ?AUTO_3703 )
      ( MAKE-ON-VERIFY ?AUTO_3702 ?AUTO_3703 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3708 - BLOCK
      ?AUTO_3709 - BLOCK
    )
    :vars
    (
      ?AUTO_3712 - BLOCK
      ?AUTO_3713 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3709 ) ( ON ?AUTO_3708 ?AUTO_3712 ) ( CLEAR ?AUTO_3708 ) ( HOLDING ?AUTO_3713 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3713 )
      ( MAKE-ON ?AUTO_3708 ?AUTO_3709 )
      ( MAKE-ON-VERIFY ?AUTO_3708 ?AUTO_3709 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3714 - BLOCK
      ?AUTO_3715 - BLOCK
    )
    :vars
    (
      ?AUTO_3718 - BLOCK
      ?AUTO_3719 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3715 ) ( ON ?AUTO_3714 ?AUTO_3718 ) ( ON ?AUTO_3719 ?AUTO_3714 ) ( CLEAR ?AUTO_3719 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3719 ?AUTO_3714 )
      ( MAKE-ON ?AUTO_3714 ?AUTO_3715 )
      ( MAKE-ON-VERIFY ?AUTO_3714 ?AUTO_3715 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3722 - BLOCK
      ?AUTO_3723 - BLOCK
    )
    :vars
    (
      ?AUTO_3727 - BLOCK
      ?AUTO_3724 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3722 ?AUTO_3727 ) ( ON ?AUTO_3724 ?AUTO_3722 ) ( CLEAR ?AUTO_3724 ) ( HOLDING ?AUTO_3723 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3723 )
      ( MAKE-ON ?AUTO_3722 ?AUTO_3723 )
      ( MAKE-ON-VERIFY ?AUTO_3722 ?AUTO_3723 ) )
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
      ?AUTO_3732 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3729 ?AUTO_3731 ) ( ON ?AUTO_3732 ?AUTO_3729 ) ( ON ?AUTO_3730 ?AUTO_3732 ) ( CLEAR ?AUTO_3730 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3730 ?AUTO_3732 )
      ( MAKE-ON ?AUTO_3729 ?AUTO_3730 )
      ( MAKE-ON-VERIFY ?AUTO_3729 ?AUTO_3730 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3738 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3738 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3738 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3738 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3740 - BLOCK
    )
    :vars
    (
      ?AUTO_3743 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3740 ?AUTO_3743 ) ( CLEAR ?AUTO_3740 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3740 ?AUTO_3743 )
      ( MAKE-ON-TABLE ?AUTO_3740 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3740 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3744 - BLOCK
    )
    :vars
    (
      ?AUTO_3746 - BLOCK
      ?AUTO_3747 - BLOCK
      ?AUTO_3748 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3744 ?AUTO_3746 ) ( CLEAR ?AUTO_3744 ) ( HOLDING ?AUTO_3747 ) ( CLEAR ?AUTO_3748 ) )
    :subtasks
    ( ( !STACK ?AUTO_3747 ?AUTO_3748 )
      ( MAKE-ON-TABLE ?AUTO_3744 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3744 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3749 - BLOCK
    )
    :vars
    (
      ?AUTO_3751 - BLOCK
      ?AUTO_3753 - BLOCK
      ?AUTO_3752 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3749 ?AUTO_3751 ) ( CLEAR ?AUTO_3753 ) ( ON ?AUTO_3752 ?AUTO_3749 ) ( CLEAR ?AUTO_3752 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3752 ?AUTO_3749 )
      ( MAKE-ON-TABLE ?AUTO_3749 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3749 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3756 - BLOCK
    )
    :vars
    (
      ?AUTO_3759 - BLOCK
      ?AUTO_3757 - BLOCK
      ?AUTO_3760 - BLOCK
      ?AUTO_3761 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3756 ?AUTO_3759 ) ( CLEAR ?AUTO_3757 ) ( ON ?AUTO_3760 ?AUTO_3756 ) ( CLEAR ?AUTO_3760 ) ( HOLDING ?AUTO_3761 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3761 )
      ( MAKE-ON-TABLE ?AUTO_3756 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3756 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3762 - BLOCK
    )
    :vars
    (
      ?AUTO_3764 - BLOCK
      ?AUTO_3765 - BLOCK
      ?AUTO_3763 - BLOCK
      ?AUTO_3767 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3762 ?AUTO_3764 ) ( CLEAR ?AUTO_3765 ) ( ON ?AUTO_3763 ?AUTO_3762 ) ( ON ?AUTO_3767 ?AUTO_3763 ) ( CLEAR ?AUTO_3767 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3767 ?AUTO_3763 )
      ( MAKE-ON-TABLE ?AUTO_3762 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3762 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3770 - BLOCK
    )
    :vars
    (
      ?AUTO_3771 - BLOCK
      ?AUTO_3772 - BLOCK
      ?AUTO_3774 - BLOCK
      ?AUTO_3775 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3770 ?AUTO_3771 ) ( ON ?AUTO_3772 ?AUTO_3770 ) ( ON ?AUTO_3774 ?AUTO_3772 ) ( CLEAR ?AUTO_3774 ) ( HOLDING ?AUTO_3775 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3775 )
      ( MAKE-ON-TABLE ?AUTO_3770 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3770 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3777 - BLOCK
    )
    :vars
    (
      ?AUTO_3778 - BLOCK
      ?AUTO_3780 - BLOCK
      ?AUTO_3779 - BLOCK
      ?AUTO_3782 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3777 ?AUTO_3778 ) ( ON ?AUTO_3780 ?AUTO_3777 ) ( ON ?AUTO_3779 ?AUTO_3780 ) ( ON ?AUTO_3782 ?AUTO_3779 ) ( CLEAR ?AUTO_3782 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3782 ?AUTO_3779 )
      ( MAKE-ON-TABLE ?AUTO_3777 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3777 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3787 - BLOCK
      ?AUTO_3788 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3787 ) ( CLEAR ?AUTO_3788 ) )
    :subtasks
    ( ( !STACK ?AUTO_3787 ?AUTO_3788 )
      ( MAKE-ON-VERIFY ?AUTO_3787 ?AUTO_3788 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3791 - BLOCK
      ?AUTO_3792 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3792 ) ( ON-TABLE ?AUTO_3791 ) ( CLEAR ?AUTO_3791 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_3791 )
      ( MAKE-ON ?AUTO_3791 ?AUTO_3792 )
      ( MAKE-ON-VERIFY ?AUTO_3791 ?AUTO_3792 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3796 - BLOCK
      ?AUTO_3797 - BLOCK
    )
    :vars
    (
      ?AUTO_3800 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3797 ) ( ON-TABLE ?AUTO_3796 ) ( CLEAR ?AUTO_3796 ) ( HOLDING ?AUTO_3800 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3800 )
      ( MAKE-ON ?AUTO_3796 ?AUTO_3797 )
      ( MAKE-ON-VERIFY ?AUTO_3796 ?AUTO_3797 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3801 - BLOCK
      ?AUTO_3802 - BLOCK
    )
    :vars
    (
      ?AUTO_3805 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3802 ) ( ON-TABLE ?AUTO_3801 ) ( ON ?AUTO_3805 ?AUTO_3801 ) ( CLEAR ?AUTO_3805 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3805 ?AUTO_3801 )
      ( MAKE-ON ?AUTO_3801 ?AUTO_3802 )
      ( MAKE-ON-VERIFY ?AUTO_3801 ?AUTO_3802 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3808 - BLOCK
      ?AUTO_3809 - BLOCK
    )
    :vars
    (
      ?AUTO_3810 - BLOCK
      ?AUTO_3813 - BLOCK
      ?AUTO_3814 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3809 ) ( ON-TABLE ?AUTO_3808 ) ( ON ?AUTO_3810 ?AUTO_3808 ) ( CLEAR ?AUTO_3810 ) ( HOLDING ?AUTO_3813 ) ( CLEAR ?AUTO_3814 ) )
    :subtasks
    ( ( !STACK ?AUTO_3813 ?AUTO_3814 )
      ( MAKE-ON ?AUTO_3808 ?AUTO_3809 )
      ( MAKE-ON-VERIFY ?AUTO_3808 ?AUTO_3809 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3815 - BLOCK
      ?AUTO_3816 - BLOCK
    )
    :vars
    (
      ?AUTO_3819 - BLOCK
      ?AUTO_3821 - BLOCK
      ?AUTO_3820 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3816 ) ( ON-TABLE ?AUTO_3815 ) ( ON ?AUTO_3819 ?AUTO_3815 ) ( CLEAR ?AUTO_3821 ) ( ON ?AUTO_3820 ?AUTO_3819 ) ( CLEAR ?AUTO_3820 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3820 ?AUTO_3819 )
      ( MAKE-ON ?AUTO_3815 ?AUTO_3816 )
      ( MAKE-ON-VERIFY ?AUTO_3815 ?AUTO_3816 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3824 - BLOCK
      ?AUTO_3825 - BLOCK
    )
    :vars
    (
      ?AUTO_3830 - BLOCK
      ?AUTO_3828 - BLOCK
      ?AUTO_3829 - BLOCK
      ?AUTO_3831 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3825 ) ( ON-TABLE ?AUTO_3824 ) ( ON ?AUTO_3830 ?AUTO_3824 ) ( CLEAR ?AUTO_3828 ) ( ON ?AUTO_3829 ?AUTO_3830 ) ( CLEAR ?AUTO_3829 ) ( HOLDING ?AUTO_3831 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3831 )
      ( MAKE-ON ?AUTO_3824 ?AUTO_3825 )
      ( MAKE-ON-VERIFY ?AUTO_3824 ?AUTO_3825 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3832 - BLOCK
      ?AUTO_3833 - BLOCK
    )
    :vars
    (
      ?AUTO_3838 - BLOCK
      ?AUTO_3839 - BLOCK
      ?AUTO_3834 - BLOCK
      ?AUTO_3837 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3833 ) ( ON-TABLE ?AUTO_3832 ) ( ON ?AUTO_3838 ?AUTO_3832 ) ( CLEAR ?AUTO_3839 ) ( ON ?AUTO_3834 ?AUTO_3838 ) ( ON ?AUTO_3837 ?AUTO_3834 ) ( CLEAR ?AUTO_3837 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3837 ?AUTO_3834 )
      ( MAKE-ON ?AUTO_3832 ?AUTO_3833 )
      ( MAKE-ON-VERIFY ?AUTO_3832 ?AUTO_3833 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3842 - BLOCK
      ?AUTO_3843 - BLOCK
    )
    :vars
    (
      ?AUTO_3848 - BLOCK
      ?AUTO_3845 - BLOCK
      ?AUTO_3849 - BLOCK
      ?AUTO_3847 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3843 ) ( ON-TABLE ?AUTO_3842 ) ( ON ?AUTO_3848 ?AUTO_3842 ) ( ON ?AUTO_3845 ?AUTO_3848 ) ( ON ?AUTO_3849 ?AUTO_3845 ) ( CLEAR ?AUTO_3849 ) ( HOLDING ?AUTO_3847 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3847 )
      ( MAKE-ON ?AUTO_3842 ?AUTO_3843 )
      ( MAKE-ON-VERIFY ?AUTO_3842 ?AUTO_3843 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3851 - BLOCK
      ?AUTO_3852 - BLOCK
    )
    :vars
    (
      ?AUTO_3856 - BLOCK
      ?AUTO_3853 - BLOCK
      ?AUTO_3855 - BLOCK
      ?AUTO_3854 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3852 ) ( ON-TABLE ?AUTO_3851 ) ( ON ?AUTO_3856 ?AUTO_3851 ) ( ON ?AUTO_3853 ?AUTO_3856 ) ( ON ?AUTO_3855 ?AUTO_3853 ) ( ON ?AUTO_3854 ?AUTO_3855 ) ( CLEAR ?AUTO_3854 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3854 ?AUTO_3855 )
      ( MAKE-ON ?AUTO_3851 ?AUTO_3852 )
      ( MAKE-ON-VERIFY ?AUTO_3851 ?AUTO_3852 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3858 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3858 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3858 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3858 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_3860 - BLOCK
    )
    :vars
    (
      ?AUTO_3863 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3860 ?AUTO_3863 ) ( CLEAR ?AUTO_3860 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3860 ?AUTO_3863 )
      ( MAKE-ON-TABLE ?AUTO_3860 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_3860 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3866 - BLOCK
      ?AUTO_3867 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3866 ) ( CLEAR ?AUTO_3867 ) )
    :subtasks
    ( ( !STACK ?AUTO_3866 ?AUTO_3867 )
      ( MAKE-ON-VERIFY ?AUTO_3866 ?AUTO_3867 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3870 - BLOCK
      ?AUTO_3871 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3871 ) ( ON-TABLE ?AUTO_3870 ) ( CLEAR ?AUTO_3870 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_3870 )
      ( MAKE-ON ?AUTO_3870 ?AUTO_3871 )
      ( MAKE-ON-VERIFY ?AUTO_3870 ?AUTO_3871 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3875 - BLOCK
      ?AUTO_3876 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_3875 ) ( CLEAR ?AUTO_3875 ) ( HOLDING ?AUTO_3876 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_3876 )
      ( MAKE-ON ?AUTO_3875 ?AUTO_3876 )
      ( MAKE-ON-VERIFY ?AUTO_3875 ?AUTO_3876 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3884 - BLOCK
      ?AUTO_3885 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3884 ) ( CLEAR ?AUTO_3885 ) )
    :subtasks
    ( ( !STACK ?AUTO_3884 ?AUTO_3885 )
      ( MAKE-ON-VERIFY ?AUTO_3884 ?AUTO_3885 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3888 - BLOCK
      ?AUTO_3889 - BLOCK
    )
    :vars
    (
      ?AUTO_3893 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3889 ) ( ON ?AUTO_3888 ?AUTO_3893 ) ( CLEAR ?AUTO_3888 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3888 ?AUTO_3893 )
      ( MAKE-ON ?AUTO_3888 ?AUTO_3889 )
      ( MAKE-ON-VERIFY ?AUTO_3888 ?AUTO_3889 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3894 - BLOCK
      ?AUTO_3895 - BLOCK
    )
    :vars
    (
      ?AUTO_3898 - BLOCK
      ?AUTO_3899 - BLOCK
      ?AUTO_3900 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3895 ) ( ON ?AUTO_3894 ?AUTO_3898 ) ( CLEAR ?AUTO_3894 ) ( HOLDING ?AUTO_3899 ) ( CLEAR ?AUTO_3900 ) )
    :subtasks
    ( ( !STACK ?AUTO_3899 ?AUTO_3900 )
      ( MAKE-ON ?AUTO_3894 ?AUTO_3895 )
      ( MAKE-ON-VERIFY ?AUTO_3894 ?AUTO_3895 ) )
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
      ?AUTO_3910 - BLOCK
      ?AUTO_3911 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3906 ) ( ON ?AUTO_3905 ?AUTO_3907 ) ( CLEAR ?AUTO_3910 ) ( ON ?AUTO_3911 ?AUTO_3905 ) ( CLEAR ?AUTO_3911 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3911 ?AUTO_3905 )
      ( MAKE-ON ?AUTO_3905 ?AUTO_3906 )
      ( MAKE-ON-VERIFY ?AUTO_3905 ?AUTO_3906 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3916 - BLOCK
      ?AUTO_3917 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3916 ) ( CLEAR ?AUTO_3917 ) )
    :subtasks
    ( ( !STACK ?AUTO_3916 ?AUTO_3917 )
      ( MAKE-ON-VERIFY ?AUTO_3916 ?AUTO_3917 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3920 - BLOCK
      ?AUTO_3921 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3921 ) ( ON-TABLE ?AUTO_3920 ) ( CLEAR ?AUTO_3920 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_3920 )
      ( MAKE-ON ?AUTO_3920 ?AUTO_3921 )
      ( MAKE-ON-VERIFY ?AUTO_3920 ?AUTO_3921 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3925 - BLOCK
      ?AUTO_3926 - BLOCK
    )
    :vars
    (
      ?AUTO_3930 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_3925 ) ( CLEAR ?AUTO_3925 ) ( HOLDING ?AUTO_3926 ) ( CLEAR ?AUTO_3930 ) )
    :subtasks
    ( ( !STACK ?AUTO_3926 ?AUTO_3930 )
      ( MAKE-ON ?AUTO_3925 ?AUTO_3926 )
      ( MAKE-ON-VERIFY ?AUTO_3925 ?AUTO_3926 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3931 - BLOCK
      ?AUTO_3932 - BLOCK
    )
    :vars
    (
      ?AUTO_3934 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_3931 ) ( CLEAR ?AUTO_3934 ) ( ON ?AUTO_3932 ?AUTO_3931 ) ( CLEAR ?AUTO_3932 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3932 ?AUTO_3931 )
      ( MAKE-ON ?AUTO_3931 ?AUTO_3932 )
      ( MAKE-ON-VERIFY ?AUTO_3931 ?AUTO_3932 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3938 - BLOCK
      ?AUTO_3939 - BLOCK
    )
    :vars
    (
      ?AUTO_3940 - BLOCK
      ?AUTO_3943 - BLOCK
      ?AUTO_3944 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_3938 ) ( CLEAR ?AUTO_3940 ) ( ON ?AUTO_3939 ?AUTO_3938 ) ( CLEAR ?AUTO_3939 ) ( HOLDING ?AUTO_3943 ) ( CLEAR ?AUTO_3944 ) )
    :subtasks
    ( ( !STACK ?AUTO_3943 ?AUTO_3944 )
      ( MAKE-ON ?AUTO_3938 ?AUTO_3939 )
      ( MAKE-ON-VERIFY ?AUTO_3938 ?AUTO_3939 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3949 - BLOCK
      ?AUTO_3950 - BLOCK
    )
    :vars
    (
      ?AUTO_3953 - BLOCK
      ?AUTO_3955 - BLOCK
      ?AUTO_3954 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_3949 ) ( CLEAR ?AUTO_3953 ) ( ON ?AUTO_3950 ?AUTO_3949 ) ( CLEAR ?AUTO_3955 ) ( ON ?AUTO_3954 ?AUTO_3950 ) ( CLEAR ?AUTO_3954 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3954 ?AUTO_3950 )
      ( MAKE-ON ?AUTO_3949 ?AUTO_3950 )
      ( MAKE-ON-VERIFY ?AUTO_3949 ?AUTO_3950 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3960 - BLOCK
      ?AUTO_3961 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_3960 ) ( CLEAR ?AUTO_3961 ) )
    :subtasks
    ( ( !STACK ?AUTO_3960 ?AUTO_3961 )
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
      ?AUTO_3969 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3965 ) ( ON ?AUTO_3964 ?AUTO_3969 ) ( CLEAR ?AUTO_3964 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3964 ?AUTO_3969 )
      ( MAKE-ON ?AUTO_3964 ?AUTO_3965 )
      ( MAKE-ON-VERIFY ?AUTO_3964 ?AUTO_3965 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3970 - BLOCK
      ?AUTO_3971 - BLOCK
    )
    :vars
    (
      ?AUTO_3974 - BLOCK
      ?AUTO_3976 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3970 ?AUTO_3974 ) ( CLEAR ?AUTO_3970 ) ( HOLDING ?AUTO_3971 ) ( CLEAR ?AUTO_3976 ) )
    :subtasks
    ( ( !STACK ?AUTO_3971 ?AUTO_3976 )
      ( MAKE-ON ?AUTO_3970 ?AUTO_3971 )
      ( MAKE-ON-VERIFY ?AUTO_3970 ?AUTO_3971 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3979 - BLOCK
      ?AUTO_3980 - BLOCK
    )
    :vars
    (
      ?AUTO_3983 - BLOCK
      ?AUTO_3984 - BLOCK
      ?AUTO_3985 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_3980 ) ( ON ?AUTO_3979 ?AUTO_3983 ) ( CLEAR ?AUTO_3979 ) ( HOLDING ?AUTO_3984 ) ( CLEAR ?AUTO_3985 ) )
    :subtasks
    ( ( !STACK ?AUTO_3984 ?AUTO_3985 )
      ( MAKE-ON ?AUTO_3979 ?AUTO_3980 )
      ( MAKE-ON-VERIFY ?AUTO_3979 ?AUTO_3980 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3986 - BLOCK
      ?AUTO_3987 - BLOCK
    )
    :vars
    (
      ?AUTO_3990 - BLOCK
      ?AUTO_3992 - BLOCK
      ?AUTO_3991 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3986 ?AUTO_3990 ) ( CLEAR ?AUTO_3986 ) ( CLEAR ?AUTO_3992 ) ( ON ?AUTO_3991 ?AUTO_3987 ) ( CLEAR ?AUTO_3991 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_3991 ?AUTO_3987 )
      ( MAKE-ON ?AUTO_3986 ?AUTO_3987 )
      ( MAKE-ON-VERIFY ?AUTO_3986 ?AUTO_3987 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_3995 - BLOCK
      ?AUTO_3996 - BLOCK
    )
    :vars
    (
      ?AUTO_4001 - BLOCK
      ?AUTO_3997 - BLOCK
      ?AUTO_4000 - BLOCK
      ?AUTO_4002 - BLOCK
      ?AUTO_4003 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_3995 ?AUTO_4001 ) ( CLEAR ?AUTO_3995 ) ( CLEAR ?AUTO_3997 ) ( ON ?AUTO_4000 ?AUTO_3996 ) ( CLEAR ?AUTO_4000 ) ( HOLDING ?AUTO_4002 ) ( CLEAR ?AUTO_4003 ) )
    :subtasks
    ( ( !STACK ?AUTO_4002 ?AUTO_4003 )
      ( MAKE-ON ?AUTO_3995 ?AUTO_3996 )
      ( MAKE-ON-VERIFY ?AUTO_3995 ?AUTO_3996 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4008 - BLOCK
      ?AUTO_4009 - BLOCK
    )
    :vars
    (
      ?AUTO_4015 - BLOCK
      ?AUTO_4014 - BLOCK
      ?AUTO_4016 - BLOCK
      ?AUTO_4012 - BLOCK
      ?AUTO_4010 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4008 ?AUTO_4015 ) ( CLEAR ?AUTO_4008 ) ( CLEAR ?AUTO_4014 ) ( ON ?AUTO_4016 ?AUTO_4009 ) ( CLEAR ?AUTO_4012 ) ( ON ?AUTO_4010 ?AUTO_4016 ) ( CLEAR ?AUTO_4010 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4010 ?AUTO_4016 )
      ( MAKE-ON ?AUTO_4008 ?AUTO_4009 )
      ( MAKE-ON-VERIFY ?AUTO_4008 ?AUTO_4009 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4020 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4020 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4020 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4020 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4022 - BLOCK
    )
    :vars
    (
      ?AUTO_4025 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4022 ?AUTO_4025 ) ( CLEAR ?AUTO_4022 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4022 ?AUTO_4025 )
      ( MAKE-ON-TABLE ?AUTO_4022 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4022 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4026 - BLOCK
    )
    :vars
    (
      ?AUTO_4028 - BLOCK
      ?AUTO_4029 - BLOCK
      ?AUTO_4030 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4026 ?AUTO_4028 ) ( CLEAR ?AUTO_4026 ) ( HOLDING ?AUTO_4029 ) ( CLEAR ?AUTO_4030 ) )
    :subtasks
    ( ( !STACK ?AUTO_4029 ?AUTO_4030 )
      ( MAKE-ON-TABLE ?AUTO_4026 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4026 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4031 - BLOCK
    )
    :vars
    (
      ?AUTO_4033 - BLOCK
      ?AUTO_4035 - BLOCK
      ?AUTO_4034 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4031 ?AUTO_4033 ) ( CLEAR ?AUTO_4035 ) ( ON ?AUTO_4034 ?AUTO_4031 ) ( CLEAR ?AUTO_4034 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4034 ?AUTO_4031 )
      ( MAKE-ON-TABLE ?AUTO_4031 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4031 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4038 - BLOCK
    )
    :vars
    (
      ?AUTO_4041 - BLOCK
      ?AUTO_4042 - BLOCK
      ?AUTO_4039 - BLOCK
      ?AUTO_4044 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4038 ?AUTO_4041 ) ( ON ?AUTO_4042 ?AUTO_4038 ) ( CLEAR ?AUTO_4042 ) ( HOLDING ?AUTO_4039 ) ( CLEAR ?AUTO_4044 ) )
    :subtasks
    ( ( !STACK ?AUTO_4039 ?AUTO_4044 )
      ( MAKE-ON-TABLE ?AUTO_4038 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4038 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4053 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4053 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4053 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4053 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4055 - BLOCK
    )
    :vars
    (
      ?AUTO_4058 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4055 ?AUTO_4058 ) ( CLEAR ?AUTO_4055 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4055 ?AUTO_4058 )
      ( MAKE-ON-TABLE ?AUTO_4055 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4055 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4059 - BLOCK
    )
    :vars
    (
      ?AUTO_4061 - BLOCK
      ?AUTO_4062 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4059 ?AUTO_4061 ) ( CLEAR ?AUTO_4059 ) ( HOLDING ?AUTO_4062 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4062 )
      ( MAKE-ON-TABLE ?AUTO_4059 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4059 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4063 - BLOCK
    )
    :vars
    (
      ?AUTO_4065 - BLOCK
      ?AUTO_4066 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4063 ?AUTO_4065 ) ( ON ?AUTO_4066 ?AUTO_4063 ) ( CLEAR ?AUTO_4066 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4066 ?AUTO_4063 )
      ( MAKE-ON-TABLE ?AUTO_4063 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4063 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4069 - BLOCK
    )
    :vars
    (
      ?AUTO_4071 - BLOCK
      ?AUTO_4070 - BLOCK
      ?AUTO_4073 - BLOCK
      ?AUTO_4074 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4069 ?AUTO_4071 ) ( ON ?AUTO_4070 ?AUTO_4069 ) ( CLEAR ?AUTO_4070 ) ( HOLDING ?AUTO_4073 ) ( CLEAR ?AUTO_4074 ) )
    :subtasks
    ( ( !STACK ?AUTO_4073 ?AUTO_4074 )
      ( MAKE-ON-TABLE ?AUTO_4069 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4069 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4075 - BLOCK
    )
    :vars
    (
      ?AUTO_4078 - BLOCK
      ?AUTO_4076 - BLOCK
      ?AUTO_4080 - BLOCK
      ?AUTO_4079 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4075 ?AUTO_4078 ) ( ON ?AUTO_4076 ?AUTO_4075 ) ( CLEAR ?AUTO_4080 ) ( ON ?AUTO_4079 ?AUTO_4076 ) ( CLEAR ?AUTO_4079 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4079 ?AUTO_4076 )
      ( MAKE-ON-TABLE ?AUTO_4075 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4075 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4083 - BLOCK
    )
    :vars
    (
      ?AUTO_4087 - BLOCK
      ?AUTO_4084 - BLOCK
      ?AUTO_4085 - BLOCK
      ?AUTO_4086 - BLOCK
      ?AUTO_4090 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4083 ?AUTO_4087 ) ( ON ?AUTO_4084 ?AUTO_4083 ) ( ON ?AUTO_4085 ?AUTO_4084 ) ( CLEAR ?AUTO_4085 ) ( HOLDING ?AUTO_4086 ) ( CLEAR ?AUTO_4090 ) )
    :subtasks
    ( ( !STACK ?AUTO_4086 ?AUTO_4090 )
      ( MAKE-ON-TABLE ?AUTO_4083 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4083 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4100 - BLOCK
      ?AUTO_4101 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4100 ) ( CLEAR ?AUTO_4101 ) )
    :subtasks
    ( ( !STACK ?AUTO_4100 ?AUTO_4101 )
      ( MAKE-ON-VERIFY ?AUTO_4100 ?AUTO_4101 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4104 - BLOCK
      ?AUTO_4105 - BLOCK
    )
    :vars
    (
      ?AUTO_4109 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4105 ) ( ON ?AUTO_4104 ?AUTO_4109 ) ( CLEAR ?AUTO_4104 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4104 ?AUTO_4109 )
      ( MAKE-ON ?AUTO_4104 ?AUTO_4105 )
      ( MAKE-ON-VERIFY ?AUTO_4104 ?AUTO_4105 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4110 - BLOCK
      ?AUTO_4111 - BLOCK
    )
    :vars
    (
      ?AUTO_4114 - BLOCK
      ?AUTO_4115 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4111 ) ( ON ?AUTO_4110 ?AUTO_4114 ) ( CLEAR ?AUTO_4110 ) ( HOLDING ?AUTO_4115 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4115 )
      ( MAKE-ON ?AUTO_4110 ?AUTO_4111 )
      ( MAKE-ON-VERIFY ?AUTO_4110 ?AUTO_4111 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4116 - BLOCK
      ?AUTO_4117 - BLOCK
    )
    :vars
    (
      ?AUTO_4120 - BLOCK
      ?AUTO_4121 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4117 ) ( ON ?AUTO_4116 ?AUTO_4120 ) ( ON ?AUTO_4121 ?AUTO_4116 ) ( CLEAR ?AUTO_4121 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4121 ?AUTO_4116 )
      ( MAKE-ON ?AUTO_4116 ?AUTO_4117 )
      ( MAKE-ON-VERIFY ?AUTO_4116 ?AUTO_4117 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4124 - BLOCK
      ?AUTO_4125 - BLOCK
    )
    :vars
    (
      ?AUTO_4129 - BLOCK
      ?AUTO_4126 - BLOCK
      ?AUTO_4130 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4125 ) ( ON ?AUTO_4124 ?AUTO_4129 ) ( ON ?AUTO_4126 ?AUTO_4124 ) ( CLEAR ?AUTO_4126 ) ( HOLDING ?AUTO_4130 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4130 )
      ( MAKE-ON ?AUTO_4124 ?AUTO_4125 )
      ( MAKE-ON-VERIFY ?AUTO_4124 ?AUTO_4125 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4131 - BLOCK
      ?AUTO_4132 - BLOCK
    )
    :vars
    (
      ?AUTO_4136 - BLOCK
      ?AUTO_4133 - BLOCK
      ?AUTO_4137 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4132 ) ( ON ?AUTO_4131 ?AUTO_4136 ) ( ON ?AUTO_4133 ?AUTO_4131 ) ( ON ?AUTO_4137 ?AUTO_4133 ) ( CLEAR ?AUTO_4137 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4137 ?AUTO_4133 )
      ( MAKE-ON ?AUTO_4131 ?AUTO_4132 )
      ( MAKE-ON-VERIFY ?AUTO_4131 ?AUTO_4132 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4140 - BLOCK
      ?AUTO_4141 - BLOCK
    )
    :vars
    (
      ?AUTO_4146 - BLOCK
      ?AUTO_4143 - BLOCK
      ?AUTO_4144 - BLOCK
      ?AUTO_4147 - BLOCK
      ?AUTO_4148 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4141 ) ( ON ?AUTO_4140 ?AUTO_4146 ) ( ON ?AUTO_4143 ?AUTO_4140 ) ( ON ?AUTO_4144 ?AUTO_4143 ) ( CLEAR ?AUTO_4144 ) ( HOLDING ?AUTO_4147 ) ( CLEAR ?AUTO_4148 ) )
    :subtasks
    ( ( !STACK ?AUTO_4147 ?AUTO_4148 )
      ( MAKE-ON ?AUTO_4140 ?AUTO_4141 )
      ( MAKE-ON-VERIFY ?AUTO_4140 ?AUTO_4141 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4149 - BLOCK
      ?AUTO_4150 - BLOCK
    )
    :vars
    (
      ?AUTO_4151 - BLOCK
      ?AUTO_4152 - BLOCK
      ?AUTO_4157 - BLOCK
      ?AUTO_4154 - BLOCK
      ?AUTO_4153 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4150 ) ( ON ?AUTO_4149 ?AUTO_4151 ) ( ON ?AUTO_4152 ?AUTO_4149 ) ( ON ?AUTO_4157 ?AUTO_4152 ) ( CLEAR ?AUTO_4154 ) ( ON ?AUTO_4153 ?AUTO_4157 ) ( CLEAR ?AUTO_4153 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4153 ?AUTO_4157 )
      ( MAKE-ON ?AUTO_4149 ?AUTO_4150 )
      ( MAKE-ON-VERIFY ?AUTO_4149 ?AUTO_4150 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4160 - BLOCK
      ?AUTO_4161 - BLOCK
    )
    :vars
    (
      ?AUTO_4167 - BLOCK
      ?AUTO_4164 - BLOCK
      ?AUTO_4166 - BLOCK
      ?AUTO_4168 - BLOCK
      ?AUTO_4165 - BLOCK
      ?AUTO_4170 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4161 ) ( ON ?AUTO_4160 ?AUTO_4167 ) ( ON ?AUTO_4164 ?AUTO_4160 ) ( ON ?AUTO_4166 ?AUTO_4164 ) ( ON ?AUTO_4168 ?AUTO_4166 ) ( CLEAR ?AUTO_4168 ) ( HOLDING ?AUTO_4165 ) ( CLEAR ?AUTO_4170 ) )
    :subtasks
    ( ( !STACK ?AUTO_4165 ?AUTO_4170 )
      ( MAKE-ON ?AUTO_4160 ?AUTO_4161 )
      ( MAKE-ON-VERIFY ?AUTO_4160 ?AUTO_4161 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4177 - BLOCK
      ?AUTO_4178 - BLOCK
    )
    :vars
    (
      ?AUTO_4183 - BLOCK
      ?AUTO_4184 - BLOCK
      ?AUTO_4179 - BLOCK
      ?AUTO_4182 - BLOCK
      ?AUTO_4185 - BLOCK
      ?AUTO_4187 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4177 ?AUTO_4183 ) ( ON ?AUTO_4184 ?AUTO_4177 ) ( ON ?AUTO_4179 ?AUTO_4184 ) ( CLEAR ?AUTO_4182 ) ( ON ?AUTO_4185 ?AUTO_4179 ) ( CLEAR ?AUTO_4185 ) ( HOLDING ?AUTO_4178 ) ( CLEAR ?AUTO_4187 ) )
    :subtasks
    ( ( !STACK ?AUTO_4178 ?AUTO_4187 )
      ( MAKE-ON ?AUTO_4177 ?AUTO_4178 )
      ( MAKE-ON-VERIFY ?AUTO_4177 ?AUTO_4178 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4196 - BLOCK
      ?AUTO_4197 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4196 ) ( CLEAR ?AUTO_4197 ) )
    :subtasks
    ( ( !STACK ?AUTO_4196 ?AUTO_4197 )
      ( MAKE-ON-VERIFY ?AUTO_4196 ?AUTO_4197 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4200 - BLOCK
      ?AUTO_4201 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4201 ) ( ON-TABLE ?AUTO_4200 ) ( CLEAR ?AUTO_4200 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_4200 )
      ( MAKE-ON ?AUTO_4200 ?AUTO_4201 )
      ( MAKE-ON-VERIFY ?AUTO_4200 ?AUTO_4201 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4205 - BLOCK
      ?AUTO_4206 - BLOCK
    )
    :vars
    (
      ?AUTO_4210 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_4205 ) ( CLEAR ?AUTO_4205 ) ( HOLDING ?AUTO_4206 ) ( CLEAR ?AUTO_4210 ) )
    :subtasks
    ( ( !STACK ?AUTO_4206 ?AUTO_4210 )
      ( MAKE-ON ?AUTO_4205 ?AUTO_4206 )
      ( MAKE-ON-VERIFY ?AUTO_4205 ?AUTO_4206 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4427 - BLOCK
      ?AUTO_4428 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4427 ) ( CLEAR ?AUTO_4428 ) )
    :subtasks
    ( ( !STACK ?AUTO_4427 ?AUTO_4428 )
      ( MAKE-ON-VERIFY ?AUTO_4427 ?AUTO_4428 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4431 - BLOCK
      ?AUTO_4432 - BLOCK
    )
    :vars
    (
      ?AUTO_4436 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4432 ) ( ON ?AUTO_4431 ?AUTO_4436 ) ( CLEAR ?AUTO_4431 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4431 ?AUTO_4436 )
      ( MAKE-ON ?AUTO_4431 ?AUTO_4432 )
      ( MAKE-ON-VERIFY ?AUTO_4431 ?AUTO_4432 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4437 - BLOCK
      ?AUTO_4438 - BLOCK
    )
    :vars
    (
      ?AUTO_4441 - BLOCK
      ?AUTO_4442 - BLOCK
      ?AUTO_4443 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4438 ) ( ON ?AUTO_4437 ?AUTO_4441 ) ( CLEAR ?AUTO_4437 ) ( HOLDING ?AUTO_4442 ) ( CLEAR ?AUTO_4443 ) )
    :subtasks
    ( ( !STACK ?AUTO_4442 ?AUTO_4443 )
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
      ?AUTO_4453 - BLOCK
      ?AUTO_4454 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4448 ?AUTO_4450 ) ( CLEAR ?AUTO_4448 ) ( CLEAR ?AUTO_4453 ) ( ON ?AUTO_4454 ?AUTO_4449 ) ( CLEAR ?AUTO_4454 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4454 ?AUTO_4449 )
      ( MAKE-ON ?AUTO_4448 ?AUTO_4449 )
      ( MAKE-ON-VERIFY ?AUTO_4448 ?AUTO_4449 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4457 - BLOCK
      ?AUTO_4458 - BLOCK
    )
    :vars
    (
      ?AUTO_4461 - BLOCK
      ?AUTO_4463 - BLOCK
      ?AUTO_4462 - BLOCK
      ?AUTO_4464 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4457 ?AUTO_4461 ) ( CLEAR ?AUTO_4457 ) ( CLEAR ?AUTO_4463 ) ( ON ?AUTO_4462 ?AUTO_4458 ) ( CLEAR ?AUTO_4462 ) ( HOLDING ?AUTO_4464 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4464 )
      ( MAKE-ON ?AUTO_4457 ?AUTO_4458 )
      ( MAKE-ON-VERIFY ?AUTO_4457 ?AUTO_4458 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4465 - BLOCK
      ?AUTO_4466 - BLOCK
    )
    :vars
    (
      ?AUTO_4472 - BLOCK
      ?AUTO_4467 - BLOCK
      ?AUTO_4468 - BLOCK
      ?AUTO_4471 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4465 ?AUTO_4472 ) ( CLEAR ?AUTO_4465 ) ( CLEAR ?AUTO_4467 ) ( ON ?AUTO_4468 ?AUTO_4466 ) ( ON ?AUTO_4471 ?AUTO_4468 ) ( CLEAR ?AUTO_4471 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4471 ?AUTO_4468 )
      ( MAKE-ON ?AUTO_4465 ?AUTO_4466 )
      ( MAKE-ON-VERIFY ?AUTO_4465 ?AUTO_4466 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4475 - BLOCK
      ?AUTO_4476 - BLOCK
    )
    :vars
    (
      ?AUTO_4481 - BLOCK
      ?AUTO_4480 - BLOCK
      ?AUTO_4478 - BLOCK
      ?AUTO_4482 - BLOCK
      ?AUTO_4483 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4475 ?AUTO_4481 ) ( CLEAR ?AUTO_4475 ) ( CLEAR ?AUTO_4480 ) ( ON ?AUTO_4478 ?AUTO_4476 ) ( ON ?AUTO_4482 ?AUTO_4478 ) ( CLEAR ?AUTO_4482 ) ( HOLDING ?AUTO_4483 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4483 )
      ( MAKE-ON ?AUTO_4475 ?AUTO_4476 )
      ( MAKE-ON-VERIFY ?AUTO_4475 ?AUTO_4476 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4484 - BLOCK
      ?AUTO_4485 - BLOCK
    )
    :vars
    (
      ?AUTO_4486 - BLOCK
      ?AUTO_4487 - BLOCK
      ?AUTO_4491 - BLOCK
      ?AUTO_4488 - BLOCK
      ?AUTO_4492 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4484 ?AUTO_4486 ) ( CLEAR ?AUTO_4484 ) ( CLEAR ?AUTO_4487 ) ( ON ?AUTO_4491 ?AUTO_4485 ) ( ON ?AUTO_4488 ?AUTO_4491 ) ( ON ?AUTO_4492 ?AUTO_4488 ) ( CLEAR ?AUTO_4492 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4492 ?AUTO_4488 )
      ( MAKE-ON ?AUTO_4484 ?AUTO_4485 )
      ( MAKE-ON-VERIFY ?AUTO_4484 ?AUTO_4485 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4495 - BLOCK
      ?AUTO_4496 - BLOCK
    )
    :vars
    (
      ?AUTO_4503 - BLOCK
      ?AUTO_4501 - BLOCK
      ?AUTO_4499 - BLOCK
      ?AUTO_4498 - BLOCK
      ?AUTO_4500 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4503 ) ( ON ?AUTO_4501 ?AUTO_4496 ) ( ON ?AUTO_4499 ?AUTO_4501 ) ( ON ?AUTO_4498 ?AUTO_4499 ) ( CLEAR ?AUTO_4498 ) ( HOLDING ?AUTO_4495 ) ( CLEAR ?AUTO_4500 ) )
    :subtasks
    ( ( !STACK ?AUTO_4495 ?AUTO_4500 )
      ( MAKE-ON ?AUTO_4495 ?AUTO_4496 )
      ( MAKE-ON-VERIFY ?AUTO_4495 ?AUTO_4496 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4506 - BLOCK
      ?AUTO_4507 - BLOCK
    )
    :vars
    (
      ?AUTO_4508 - BLOCK
      ?AUTO_4513 - BLOCK
      ?AUTO_4514 - BLOCK
      ?AUTO_4510 - BLOCK
      ?AUTO_4509 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4508 ) ( ON ?AUTO_4513 ?AUTO_4507 ) ( ON ?AUTO_4514 ?AUTO_4513 ) ( ON ?AUTO_4510 ?AUTO_4514 ) ( CLEAR ?AUTO_4509 ) ( ON ?AUTO_4506 ?AUTO_4510 ) ( CLEAR ?AUTO_4506 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4506 ?AUTO_4510 )
      ( MAKE-ON ?AUTO_4506 ?AUTO_4507 )
      ( MAKE-ON-VERIFY ?AUTO_4506 ?AUTO_4507 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4517 - BLOCK
      ?AUTO_4518 - BLOCK
    )
    :vars
    (
      ?AUTO_4525 - BLOCK
      ?AUTO_4520 - BLOCK
      ?AUTO_4524 - BLOCK
      ?AUTO_4519 - BLOCK
      ?AUTO_4521 - BLOCK
      ?AUTO_4527 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4525 ) ( ON ?AUTO_4520 ?AUTO_4518 ) ( ON ?AUTO_4524 ?AUTO_4520 ) ( ON ?AUTO_4519 ?AUTO_4524 ) ( ON ?AUTO_4517 ?AUTO_4519 ) ( CLEAR ?AUTO_4517 ) ( HOLDING ?AUTO_4521 ) ( CLEAR ?AUTO_4527 ) )
    :subtasks
    ( ( !STACK ?AUTO_4521 ?AUTO_4527 )
      ( MAKE-ON ?AUTO_4517 ?AUTO_4518 )
      ( MAKE-ON-VERIFY ?AUTO_4517 ?AUTO_4518 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4544 - BLOCK
      ?AUTO_4545 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4544 ) ( CLEAR ?AUTO_4545 ) )
    :subtasks
    ( ( !STACK ?AUTO_4544 ?AUTO_4545 )
      ( MAKE-ON-VERIFY ?AUTO_4544 ?AUTO_4545 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4548 - BLOCK
      ?AUTO_4549 - BLOCK
    )
    :vars
    (
      ?AUTO_4553 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4549 ) ( ON ?AUTO_4548 ?AUTO_4553 ) ( CLEAR ?AUTO_4548 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4548 ?AUTO_4553 )
      ( MAKE-ON ?AUTO_4548 ?AUTO_4549 )
      ( MAKE-ON-VERIFY ?AUTO_4548 ?AUTO_4549 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4554 - BLOCK
      ?AUTO_4555 - BLOCK
    )
    :vars
    (
      ?AUTO_4558 - BLOCK
      ?AUTO_4559 - BLOCK
      ?AUTO_4560 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4555 ) ( ON ?AUTO_4554 ?AUTO_4558 ) ( CLEAR ?AUTO_4554 ) ( HOLDING ?AUTO_4559 ) ( CLEAR ?AUTO_4560 ) )
    :subtasks
    ( ( !STACK ?AUTO_4559 ?AUTO_4560 )
      ( MAKE-ON ?AUTO_4554 ?AUTO_4555 )
      ( MAKE-ON-VERIFY ?AUTO_4554 ?AUTO_4555 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4561 - BLOCK
      ?AUTO_4562 - BLOCK
    )
    :vars
    (
      ?AUTO_4565 - BLOCK
      ?AUTO_4567 - BLOCK
      ?AUTO_4566 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4562 ) ( ON ?AUTO_4561 ?AUTO_4565 ) ( CLEAR ?AUTO_4567 ) ( ON ?AUTO_4566 ?AUTO_4561 ) ( CLEAR ?AUTO_4566 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4566 ?AUTO_4561 )
      ( MAKE-ON ?AUTO_4561 ?AUTO_4562 )
      ( MAKE-ON-VERIFY ?AUTO_4561 ?AUTO_4562 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4570 - BLOCK
      ?AUTO_4571 - BLOCK
    )
    :vars
    (
      ?AUTO_4576 - BLOCK
      ?AUTO_4573 - BLOCK
      ?AUTO_4572 - BLOCK
      ?AUTO_4577 - BLOCK
      ?AUTO_4578 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4571 ) ( ON ?AUTO_4570 ?AUTO_4576 ) ( CLEAR ?AUTO_4573 ) ( ON ?AUTO_4572 ?AUTO_4570 ) ( CLEAR ?AUTO_4572 ) ( HOLDING ?AUTO_4577 ) ( CLEAR ?AUTO_4578 ) )
    :subtasks
    ( ( !STACK ?AUTO_4577 ?AUTO_4578 )
      ( MAKE-ON ?AUTO_4570 ?AUTO_4571 )
      ( MAKE-ON-VERIFY ?AUTO_4570 ?AUTO_4571 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4589 - BLOCK
      ?AUTO_4590 - BLOCK
    )
    :vars
    (
      ?AUTO_4595 - BLOCK
      ?AUTO_4592 - BLOCK
      ?AUTO_4593 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4589 ?AUTO_4595 ) ( CLEAR ?AUTO_4592 ) ( ON ?AUTO_4593 ?AUTO_4589 ) ( CLEAR ?AUTO_4593 ) ( HOLDING ?AUTO_4590 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4590 )
      ( MAKE-ON ?AUTO_4589 ?AUTO_4590 )
      ( MAKE-ON-VERIFY ?AUTO_4589 ?AUTO_4590 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4603 - BLOCK
      ?AUTO_4604 - BLOCK
    )
    :vars
    (
      ?AUTO_4609 - BLOCK
      ?AUTO_4606 - BLOCK
      ?AUTO_4605 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4609 ) ( ON ?AUTO_4606 ?AUTO_4604 ) ( CLEAR ?AUTO_4606 ) ( HOLDING ?AUTO_4603 ) ( CLEAR ?AUTO_4605 ) )
    :subtasks
    ( ( !STACK ?AUTO_4603 ?AUTO_4605 )
      ( MAKE-ON ?AUTO_4603 ?AUTO_4604 )
      ( MAKE-ON-VERIFY ?AUTO_4603 ?AUTO_4604 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4612 - BLOCK
      ?AUTO_4613 - BLOCK
    )
    :vars
    (
      ?AUTO_4618 - BLOCK
      ?AUTO_4617 - BLOCK
      ?AUTO_4616 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4618 ) ( ON ?AUTO_4617 ?AUTO_4613 ) ( CLEAR ?AUTO_4617 ) ( CLEAR ?AUTO_4616 ) ( ON-TABLE ?AUTO_4612 ) ( CLEAR ?AUTO_4612 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_4612 )
      ( MAKE-ON ?AUTO_4612 ?AUTO_4613 )
      ( MAKE-ON-VERIFY ?AUTO_4612 ?AUTO_4613 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4620 - BLOCK
      ?AUTO_4621 - BLOCK
    )
    :vars
    (
      ?AUTO_4622 - BLOCK
      ?AUTO_4625 - BLOCK
      ?AUTO_4626 - BLOCK
      ?AUTO_4628 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4622 ) ( ON ?AUTO_4625 ?AUTO_4621 ) ( CLEAR ?AUTO_4625 ) ( ON-TABLE ?AUTO_4620 ) ( CLEAR ?AUTO_4620 ) ( HOLDING ?AUTO_4626 ) ( CLEAR ?AUTO_4628 ) )
    :subtasks
    ( ( !STACK ?AUTO_4626 ?AUTO_4628 )
      ( MAKE-ON ?AUTO_4620 ?AUTO_4621 )
      ( MAKE-ON-VERIFY ?AUTO_4620 ?AUTO_4621 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4629 - BLOCK
      ?AUTO_4630 - BLOCK
    )
    :vars
    (
      ?AUTO_4632 - BLOCK
      ?AUTO_4635 - BLOCK
      ?AUTO_4634 - BLOCK
      ?AUTO_4636 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4632 ) ( ON ?AUTO_4635 ?AUTO_4630 ) ( CLEAR ?AUTO_4635 ) ( ON-TABLE ?AUTO_4629 ) ( CLEAR ?AUTO_4634 ) ( ON ?AUTO_4636 ?AUTO_4629 ) ( CLEAR ?AUTO_4636 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4636 ?AUTO_4629 )
      ( MAKE-ON ?AUTO_4629 ?AUTO_4630 )
      ( MAKE-ON-VERIFY ?AUTO_4629 ?AUTO_4630 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4639 - BLOCK
      ?AUTO_4640 - BLOCK
    )
    :vars
    (
      ?AUTO_4642 - BLOCK
      ?AUTO_4641 - BLOCK
      ?AUTO_4646 - BLOCK
      ?AUTO_4645 - BLOCK
      ?AUTO_4647 - BLOCK
      ?AUTO_4648 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4642 ) ( ON ?AUTO_4641 ?AUTO_4640 ) ( CLEAR ?AUTO_4641 ) ( ON-TABLE ?AUTO_4639 ) ( CLEAR ?AUTO_4646 ) ( ON ?AUTO_4645 ?AUTO_4639 ) ( CLEAR ?AUTO_4645 ) ( HOLDING ?AUTO_4647 ) ( CLEAR ?AUTO_4648 ) )
    :subtasks
    ( ( !STACK ?AUTO_4647 ?AUTO_4648 )
      ( MAKE-ON ?AUTO_4639 ?AUTO_4640 )
      ( MAKE-ON-VERIFY ?AUTO_4639 ?AUTO_4640 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4653 - BLOCK
      ?AUTO_4654 - BLOCK
    )
    :vars
    (
      ?AUTO_4655 - BLOCK
      ?AUTO_4661 - BLOCK
      ?AUTO_4659 - BLOCK
      ?AUTO_4662 - BLOCK
      ?AUTO_4658 - BLOCK
      ?AUTO_4657 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4655 ) ( ON ?AUTO_4661 ?AUTO_4654 ) ( CLEAR ?AUTO_4661 ) ( ON-TABLE ?AUTO_4653 ) ( CLEAR ?AUTO_4659 ) ( ON ?AUTO_4662 ?AUTO_4653 ) ( CLEAR ?AUTO_4658 ) ( ON ?AUTO_4657 ?AUTO_4662 ) ( CLEAR ?AUTO_4657 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4657 ?AUTO_4662 )
      ( MAKE-ON ?AUTO_4653 ?AUTO_4654 )
      ( MAKE-ON-VERIFY ?AUTO_4653 ?AUTO_4654 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4667 - BLOCK
      ?AUTO_4668 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4667 ) ( CLEAR ?AUTO_4668 ) )
    :subtasks
    ( ( !STACK ?AUTO_4667 ?AUTO_4668 )
      ( MAKE-ON-VERIFY ?AUTO_4667 ?AUTO_4668 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4671 - BLOCK
      ?AUTO_4672 - BLOCK
    )
    :vars
    (
      ?AUTO_4676 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4672 ) ( ON ?AUTO_4671 ?AUTO_4676 ) ( CLEAR ?AUTO_4671 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4671 ?AUTO_4676 )
      ( MAKE-ON ?AUTO_4671 ?AUTO_4672 )
      ( MAKE-ON-VERIFY ?AUTO_4671 ?AUTO_4672 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4677 - BLOCK
      ?AUTO_4678 - BLOCK
    )
    :vars
    (
      ?AUTO_4681 - BLOCK
      ?AUTO_4683 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4677 ?AUTO_4681 ) ( CLEAR ?AUTO_4677 ) ( HOLDING ?AUTO_4678 ) ( CLEAR ?AUTO_4683 ) )
    :subtasks
    ( ( !STACK ?AUTO_4678 ?AUTO_4683 )
      ( MAKE-ON ?AUTO_4677 ?AUTO_4678 )
      ( MAKE-ON-VERIFY ?AUTO_4677 ?AUTO_4678 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4753 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4753 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4753 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4753 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4755 - BLOCK
    )
    :vars
    (
      ?AUTO_4758 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4755 ?AUTO_4758 ) ( CLEAR ?AUTO_4755 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4755 ?AUTO_4758 )
      ( MAKE-ON-TABLE ?AUTO_4755 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4755 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4759 - BLOCK
    )
    :vars
    (
      ?AUTO_4761 - BLOCK
      ?AUTO_4762 - BLOCK
      ?AUTO_4763 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4759 ?AUTO_4761 ) ( CLEAR ?AUTO_4759 ) ( HOLDING ?AUTO_4762 ) ( CLEAR ?AUTO_4763 ) )
    :subtasks
    ( ( !STACK ?AUTO_4762 ?AUTO_4763 )
      ( MAKE-ON-TABLE ?AUTO_4759 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4759 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4766 - BLOCK
    )
    :vars
    (
      ?AUTO_4768 - BLOCK
      ?AUTO_4770 - BLOCK
      ?AUTO_4767 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4766 ?AUTO_4768 ) ( CLEAR ?AUTO_4770 ) ( ON ?AUTO_4767 ?AUTO_4766 ) ( CLEAR ?AUTO_4767 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4767 ?AUTO_4766 )
      ( MAKE-ON-TABLE ?AUTO_4766 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4766 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4773 - BLOCK
    )
    :vars
    (
      ?AUTO_4775 - BLOCK
      ?AUTO_4777 - BLOCK
      ?AUTO_4776 - BLOCK
      ?AUTO_4778 - BLOCK
      ?AUTO_4779 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4773 ?AUTO_4775 ) ( CLEAR ?AUTO_4777 ) ( ON ?AUTO_4776 ?AUTO_4773 ) ( CLEAR ?AUTO_4776 ) ( HOLDING ?AUTO_4778 ) ( CLEAR ?AUTO_4779 ) )
    :subtasks
    ( ( !STACK ?AUTO_4778 ?AUTO_4779 )
      ( MAKE-ON-TABLE ?AUTO_4773 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4773 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4780 - BLOCK
    )
    :vars
    (
      ?AUTO_4782 - BLOCK
      ?AUTO_4781 - BLOCK
      ?AUTO_4785 - BLOCK
      ?AUTO_4786 - BLOCK
      ?AUTO_4784 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4780 ?AUTO_4782 ) ( CLEAR ?AUTO_4781 ) ( ON ?AUTO_4785 ?AUTO_4780 ) ( CLEAR ?AUTO_4786 ) ( ON ?AUTO_4784 ?AUTO_4785 ) ( CLEAR ?AUTO_4784 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4784 ?AUTO_4785 )
      ( MAKE-ON-TABLE ?AUTO_4780 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4780 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_4789 - BLOCK
    )
    :vars
    (
      ?AUTO_4794 - BLOCK
      ?AUTO_4790 - BLOCK
      ?AUTO_4793 - BLOCK
      ?AUTO_4791 - BLOCK
      ?AUTO_4795 - BLOCK
      ?AUTO_4796 - BLOCK
      ?AUTO_4797 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_4789 ?AUTO_4794 ) ( CLEAR ?AUTO_4790 ) ( ON ?AUTO_4793 ?AUTO_4789 ) ( CLEAR ?AUTO_4791 ) ( ON ?AUTO_4795 ?AUTO_4793 ) ( CLEAR ?AUTO_4795 ) ( HOLDING ?AUTO_4796 ) ( CLEAR ?AUTO_4797 ) )
    :subtasks
    ( ( !STACK ?AUTO_4796 ?AUTO_4797 )
      ( MAKE-ON-TABLE ?AUTO_4789 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_4789 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4817 - BLOCK
      ?AUTO_4818 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_4817 ) ( CLEAR ?AUTO_4818 ) )
    :subtasks
    ( ( !STACK ?AUTO_4817 ?AUTO_4818 )
      ( MAKE-ON-VERIFY ?AUTO_4817 ?AUTO_4818 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4821 - BLOCK
      ?AUTO_4822 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4822 ) ( ON-TABLE ?AUTO_4821 ) ( CLEAR ?AUTO_4821 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_4821 )
      ( MAKE-ON ?AUTO_4821 ?AUTO_4822 )
      ( MAKE-ON-VERIFY ?AUTO_4821 ?AUTO_4822 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4826 - BLOCK
      ?AUTO_4827 - BLOCK
    )
    :vars
    (
      ?AUTO_4830 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4827 ) ( ON-TABLE ?AUTO_4826 ) ( CLEAR ?AUTO_4826 ) ( HOLDING ?AUTO_4830 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4830 )
      ( MAKE-ON ?AUTO_4826 ?AUTO_4827 )
      ( MAKE-ON-VERIFY ?AUTO_4826 ?AUTO_4827 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4831 - BLOCK
      ?AUTO_4832 - BLOCK
    )
    :vars
    (
      ?AUTO_4835 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4832 ) ( ON-TABLE ?AUTO_4831 ) ( ON ?AUTO_4835 ?AUTO_4831 ) ( CLEAR ?AUTO_4835 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4835 ?AUTO_4831 )
      ( MAKE-ON ?AUTO_4831 ?AUTO_4832 )
      ( MAKE-ON-VERIFY ?AUTO_4831 ?AUTO_4832 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4838 - BLOCK
      ?AUTO_4839 - BLOCK
    )
    :vars
    (
      ?AUTO_4841 - BLOCK
      ?AUTO_4843 - BLOCK
      ?AUTO_4844 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_4839 ) ( ON-TABLE ?AUTO_4838 ) ( ON ?AUTO_4841 ?AUTO_4838 ) ( CLEAR ?AUTO_4841 ) ( HOLDING ?AUTO_4843 ) ( CLEAR ?AUTO_4844 ) )
    :subtasks
    ( ( !STACK ?AUTO_4843 ?AUTO_4844 )
      ( MAKE-ON ?AUTO_4838 ?AUTO_4839 )
      ( MAKE-ON-VERIFY ?AUTO_4838 ?AUTO_4839 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4845 - BLOCK
      ?AUTO_4846 - BLOCK
    )
    :vars
    (
      ?AUTO_4847 - BLOCK
      ?AUTO_4851 - BLOCK
      ?AUTO_4850 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_4845 ) ( ON ?AUTO_4847 ?AUTO_4845 ) ( CLEAR ?AUTO_4847 ) ( CLEAR ?AUTO_4851 ) ( ON ?AUTO_4850 ?AUTO_4846 ) ( CLEAR ?AUTO_4850 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4850 ?AUTO_4846 )
      ( MAKE-ON ?AUTO_4845 ?AUTO_4846 )
      ( MAKE-ON-VERIFY ?AUTO_4845 ?AUTO_4846 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4854 - BLOCK
      ?AUTO_4855 - BLOCK
    )
    :vars
    (
      ?AUTO_4859 - BLOCK
      ?AUTO_4860 - BLOCK
      ?AUTO_4856 - BLOCK
      ?AUTO_4862 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_4854 ) ( ON ?AUTO_4859 ?AUTO_4854 ) ( CLEAR ?AUTO_4859 ) ( ON ?AUTO_4860 ?AUTO_4855 ) ( CLEAR ?AUTO_4860 ) ( HOLDING ?AUTO_4856 ) ( CLEAR ?AUTO_4862 ) )
    :subtasks
    ( ( !STACK ?AUTO_4856 ?AUTO_4862 )
      ( MAKE-ON ?AUTO_4854 ?AUTO_4855 )
      ( MAKE-ON-VERIFY ?AUTO_4854 ?AUTO_4855 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4863 - BLOCK
      ?AUTO_4864 - BLOCK
    )
    :vars
    (
      ?AUTO_4866 - BLOCK
      ?AUTO_4870 - BLOCK
      ?AUTO_4867 - BLOCK
      ?AUTO_4865 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_4863 ) ( ON ?AUTO_4866 ?AUTO_4863 ) ( ON ?AUTO_4870 ?AUTO_4864 ) ( CLEAR ?AUTO_4870 ) ( CLEAR ?AUTO_4867 ) ( ON ?AUTO_4865 ?AUTO_4866 ) ( CLEAR ?AUTO_4865 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4865 ?AUTO_4866 )
      ( MAKE-ON ?AUTO_4863 ?AUTO_4864 )
      ( MAKE-ON-VERIFY ?AUTO_4863 ?AUTO_4864 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4873 - BLOCK
      ?AUTO_4874 - BLOCK
    )
    :vars
    (
      ?AUTO_4875 - BLOCK
      ?AUTO_4880 - BLOCK
      ?AUTO_4879 - BLOCK
      ?AUTO_4878 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_4873 ) ( ON ?AUTO_4875 ?AUTO_4873 ) ( CLEAR ?AUTO_4880 ) ( ON ?AUTO_4879 ?AUTO_4875 ) ( CLEAR ?AUTO_4879 ) ( HOLDING ?AUTO_4878 ) ( CLEAR ?AUTO_4874 ) )
    :subtasks
    ( ( !STACK ?AUTO_4878 ?AUTO_4874 )
      ( MAKE-ON ?AUTO_4873 ?AUTO_4874 )
      ( MAKE-ON-VERIFY ?AUTO_4873 ?AUTO_4874 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4883 - BLOCK
      ?AUTO_4884 - BLOCK
    )
    :vars
    (
      ?AUTO_4887 - BLOCK
      ?AUTO_4886 - BLOCK
      ?AUTO_4885 - BLOCK
      ?AUTO_4888 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_4883 ) ( ON ?AUTO_4887 ?AUTO_4883 ) ( CLEAR ?AUTO_4886 ) ( ON ?AUTO_4885 ?AUTO_4887 ) ( CLEAR ?AUTO_4884 ) ( ON ?AUTO_4888 ?AUTO_4885 ) ( CLEAR ?AUTO_4888 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4888 ?AUTO_4885 )
      ( MAKE-ON ?AUTO_4883 ?AUTO_4884 )
      ( MAKE-ON-VERIFY ?AUTO_4883 ?AUTO_4884 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4893 - BLOCK
      ?AUTO_4894 - BLOCK
    )
    :vars
    (
      ?AUTO_4899 - BLOCK
      ?AUTO_4898 - BLOCK
      ?AUTO_4900 - BLOCK
      ?AUTO_4895 - BLOCK
      ?AUTO_4901 - BLOCK
      ?AUTO_4902 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_4893 ) ( ON ?AUTO_4899 ?AUTO_4893 ) ( CLEAR ?AUTO_4898 ) ( ON ?AUTO_4900 ?AUTO_4899 ) ( CLEAR ?AUTO_4894 ) ( ON ?AUTO_4895 ?AUTO_4900 ) ( CLEAR ?AUTO_4895 ) ( HOLDING ?AUTO_4901 ) ( CLEAR ?AUTO_4902 ) )
    :subtasks
    ( ( !STACK ?AUTO_4901 ?AUTO_4902 )
      ( MAKE-ON ?AUTO_4893 ?AUTO_4894 )
      ( MAKE-ON-VERIFY ?AUTO_4893 ?AUTO_4894 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4907 - BLOCK
      ?AUTO_4908 - BLOCK
    )
    :vars
    (
      ?AUTO_4915 - BLOCK
      ?AUTO_4916 - BLOCK
      ?AUTO_4910 - BLOCK
      ?AUTO_4911 - BLOCK
      ?AUTO_4909 - BLOCK
      ?AUTO_4914 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_4907 ) ( ON ?AUTO_4915 ?AUTO_4907 ) ( CLEAR ?AUTO_4916 ) ( ON ?AUTO_4910 ?AUTO_4915 ) ( ON ?AUTO_4911 ?AUTO_4910 ) ( CLEAR ?AUTO_4911 ) ( CLEAR ?AUTO_4909 ) ( ON ?AUTO_4914 ?AUTO_4908 ) ( CLEAR ?AUTO_4914 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4914 ?AUTO_4908 )
      ( MAKE-ON ?AUTO_4907 ?AUTO_4908 )
      ( MAKE-ON-VERIFY ?AUTO_4907 ?AUTO_4908 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4919 - BLOCK
      ?AUTO_4920 - BLOCK
    )
    :vars
    (
      ?AUTO_4925 - BLOCK
      ?AUTO_4921 - BLOCK
      ?AUTO_4926 - BLOCK
      ?AUTO_4923 - BLOCK
      ?AUTO_4928 - BLOCK
      ?AUTO_4927 - BLOCK
      ?AUTO_4929 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_4919 ) ( ON ?AUTO_4925 ?AUTO_4919 ) ( CLEAR ?AUTO_4921 ) ( ON ?AUTO_4926 ?AUTO_4925 ) ( ON ?AUTO_4923 ?AUTO_4926 ) ( CLEAR ?AUTO_4923 ) ( CLEAR ?AUTO_4928 ) ( ON ?AUTO_4927 ?AUTO_4920 ) ( CLEAR ?AUTO_4927 ) ( HOLDING ?AUTO_4929 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4929 )
      ( MAKE-ON ?AUTO_4919 ?AUTO_4920 )
      ( MAKE-ON-VERIFY ?AUTO_4919 ?AUTO_4920 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4930 - BLOCK
      ?AUTO_4931 - BLOCK
    )
    :vars
    (
      ?AUTO_4938 - BLOCK
      ?AUTO_4934 - BLOCK
      ?AUTO_4940 - BLOCK
      ?AUTO_4936 - BLOCK
      ?AUTO_4939 - BLOCK
      ?AUTO_4932 - BLOCK
      ?AUTO_4937 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_4930 ) ( ON ?AUTO_4938 ?AUTO_4930 ) ( CLEAR ?AUTO_4934 ) ( ON ?AUTO_4940 ?AUTO_4938 ) ( ON ?AUTO_4936 ?AUTO_4940 ) ( CLEAR ?AUTO_4936 ) ( CLEAR ?AUTO_4939 ) ( ON ?AUTO_4932 ?AUTO_4931 ) ( ON ?AUTO_4937 ?AUTO_4932 ) ( CLEAR ?AUTO_4937 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4937 ?AUTO_4932 )
      ( MAKE-ON ?AUTO_4930 ?AUTO_4931 )
      ( MAKE-ON-VERIFY ?AUTO_4930 ?AUTO_4931 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4943 - BLOCK
      ?AUTO_4944 - BLOCK
    )
    :vars
    (
      ?AUTO_4949 - BLOCK
      ?AUTO_4950 - BLOCK
      ?AUTO_4953 - BLOCK
      ?AUTO_4948 - BLOCK
      ?AUTO_4945 - BLOCK
      ?AUTO_4946 - BLOCK
      ?AUTO_4951 - BLOCK
      ?AUTO_4954 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_4943 ) ( ON ?AUTO_4949 ?AUTO_4943 ) ( CLEAR ?AUTO_4950 ) ( ON ?AUTO_4953 ?AUTO_4949 ) ( ON ?AUTO_4948 ?AUTO_4953 ) ( CLEAR ?AUTO_4948 ) ( CLEAR ?AUTO_4945 ) ( ON ?AUTO_4946 ?AUTO_4944 ) ( ON ?AUTO_4951 ?AUTO_4946 ) ( CLEAR ?AUTO_4951 ) ( HOLDING ?AUTO_4954 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_4954 )
      ( MAKE-ON ?AUTO_4943 ?AUTO_4944 )
      ( MAKE-ON-VERIFY ?AUTO_4943 ?AUTO_4944 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4955 - BLOCK
      ?AUTO_4956 - BLOCK
    )
    :vars
    (
      ?AUTO_4965 - BLOCK
      ?AUTO_4964 - BLOCK
      ?AUTO_4958 - BLOCK
      ?AUTO_4963 - BLOCK
      ?AUTO_4959 - BLOCK
      ?AUTO_4957 - BLOCK
      ?AUTO_4960 - BLOCK
      ?AUTO_4966 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_4955 ) ( ON ?AUTO_4965 ?AUTO_4955 ) ( CLEAR ?AUTO_4964 ) ( ON ?AUTO_4958 ?AUTO_4965 ) ( ON ?AUTO_4963 ?AUTO_4958 ) ( CLEAR ?AUTO_4963 ) ( CLEAR ?AUTO_4959 ) ( ON ?AUTO_4957 ?AUTO_4956 ) ( ON ?AUTO_4960 ?AUTO_4957 ) ( ON ?AUTO_4966 ?AUTO_4960 ) ( CLEAR ?AUTO_4966 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4966 ?AUTO_4960 )
      ( MAKE-ON ?AUTO_4955 ?AUTO_4956 )
      ( MAKE-ON-VERIFY ?AUTO_4955 ?AUTO_4956 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4969 - BLOCK
      ?AUTO_4970 - BLOCK
    )
    :vars
    (
      ?AUTO_4978 - BLOCK
      ?AUTO_4974 - BLOCK
      ?AUTO_4976 - BLOCK
      ?AUTO_4972 - BLOCK
      ?AUTO_4973 - BLOCK
      ?AUTO_4980 - BLOCK
      ?AUTO_4979 - BLOCK
      ?AUTO_4975 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_4969 ) ( ON ?AUTO_4978 ?AUTO_4969 ) ( CLEAR ?AUTO_4974 ) ( ON ?AUTO_4976 ?AUTO_4978 ) ( CLEAR ?AUTO_4972 ) ( ON ?AUTO_4973 ?AUTO_4970 ) ( ON ?AUTO_4980 ?AUTO_4973 ) ( ON ?AUTO_4979 ?AUTO_4980 ) ( CLEAR ?AUTO_4979 ) ( HOLDING ?AUTO_4975 ) ( CLEAR ?AUTO_4976 ) )
    :subtasks
    ( ( !STACK ?AUTO_4975 ?AUTO_4976 )
      ( MAKE-ON ?AUTO_4969 ?AUTO_4970 )
      ( MAKE-ON-VERIFY ?AUTO_4969 ?AUTO_4970 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4983 - BLOCK
      ?AUTO_4984 - BLOCK
    )
    :vars
    (
      ?AUTO_4987 - BLOCK
      ?AUTO_4992 - BLOCK
      ?AUTO_4993 - BLOCK
      ?AUTO_4990 - BLOCK
      ?AUTO_4994 - BLOCK
      ?AUTO_4986 - BLOCK
      ?AUTO_4985 - BLOCK
      ?AUTO_4991 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_4983 ) ( ON ?AUTO_4987 ?AUTO_4983 ) ( CLEAR ?AUTO_4992 ) ( ON ?AUTO_4993 ?AUTO_4987 ) ( CLEAR ?AUTO_4990 ) ( ON ?AUTO_4994 ?AUTO_4984 ) ( ON ?AUTO_4986 ?AUTO_4994 ) ( ON ?AUTO_4985 ?AUTO_4986 ) ( CLEAR ?AUTO_4993 ) ( ON ?AUTO_4991 ?AUTO_4985 ) ( CLEAR ?AUTO_4991 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_4991 ?AUTO_4985 )
      ( MAKE-ON ?AUTO_4983 ?AUTO_4984 )
      ( MAKE-ON-VERIFY ?AUTO_4983 ?AUTO_4984 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_4997 - BLOCK
      ?AUTO_4998 - BLOCK
    )
    :vars
    (
      ?AUTO_5008 - BLOCK
      ?AUTO_5006 - BLOCK
      ?AUTO_5005 - BLOCK
      ?AUTO_5007 - BLOCK
      ?AUTO_4999 - BLOCK
      ?AUTO_5004 - BLOCK
      ?AUTO_5001 - BLOCK
      ?AUTO_5000 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_4997 ) ( ON ?AUTO_5008 ?AUTO_4997 ) ( CLEAR ?AUTO_5006 ) ( CLEAR ?AUTO_5005 ) ( ON ?AUTO_5007 ?AUTO_4998 ) ( ON ?AUTO_4999 ?AUTO_5007 ) ( ON ?AUTO_5004 ?AUTO_4999 ) ( ON ?AUTO_5001 ?AUTO_5004 ) ( CLEAR ?AUTO_5001 ) ( HOLDING ?AUTO_5000 ) ( CLEAR ?AUTO_5008 ) )
    :subtasks
    ( ( !STACK ?AUTO_5000 ?AUTO_5008 )
      ( MAKE-ON ?AUTO_4997 ?AUTO_4998 )
      ( MAKE-ON-VERIFY ?AUTO_4997 ?AUTO_4998 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5011 - BLOCK
      ?AUTO_5012 - BLOCK
    )
    :vars
    (
      ?AUTO_5022 - BLOCK
      ?AUTO_5014 - BLOCK
      ?AUTO_5021 - BLOCK
      ?AUTO_5013 - BLOCK
      ?AUTO_5017 - BLOCK
      ?AUTO_5016 - BLOCK
      ?AUTO_5015 - BLOCK
      ?AUTO_5019 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_5011 ) ( ON ?AUTO_5022 ?AUTO_5011 ) ( CLEAR ?AUTO_5014 ) ( CLEAR ?AUTO_5021 ) ( ON ?AUTO_5013 ?AUTO_5012 ) ( ON ?AUTO_5017 ?AUTO_5013 ) ( ON ?AUTO_5016 ?AUTO_5017 ) ( ON ?AUTO_5015 ?AUTO_5016 ) ( CLEAR ?AUTO_5015 ) ( CLEAR ?AUTO_5022 ) ( ON-TABLE ?AUTO_5019 ) ( CLEAR ?AUTO_5019 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_5019 )
      ( MAKE-ON ?AUTO_5011 ?AUTO_5012 )
      ( MAKE-ON-VERIFY ?AUTO_5011 ?AUTO_5012 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5024 - BLOCK
      ?AUTO_5025 - BLOCK
    )
    :vars
    (
      ?AUTO_5032 - BLOCK
      ?AUTO_5033 - BLOCK
      ?AUTO_5026 - BLOCK
      ?AUTO_5031 - BLOCK
      ?AUTO_5027 - BLOCK
      ?AUTO_5030 - BLOCK
      ?AUTO_5035 - BLOCK
      ?AUTO_5034 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_5024 ) ( CLEAR ?AUTO_5032 ) ( CLEAR ?AUTO_5033 ) ( ON ?AUTO_5026 ?AUTO_5025 ) ( ON ?AUTO_5031 ?AUTO_5026 ) ( ON ?AUTO_5027 ?AUTO_5031 ) ( ON ?AUTO_5030 ?AUTO_5027 ) ( CLEAR ?AUTO_5030 ) ( ON-TABLE ?AUTO_5035 ) ( CLEAR ?AUTO_5035 ) ( HOLDING ?AUTO_5034 ) ( CLEAR ?AUTO_5024 ) )
    :subtasks
    ( ( !STACK ?AUTO_5034 ?AUTO_5024 )
      ( MAKE-ON ?AUTO_5024 ?AUTO_5025 )
      ( MAKE-ON-VERIFY ?AUTO_5024 ?AUTO_5025 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5038 - BLOCK
      ?AUTO_5039 - BLOCK
    )
    :vars
    (
      ?AUTO_5044 - BLOCK
      ?AUTO_5040 - BLOCK
      ?AUTO_5045 - BLOCK
      ?AUTO_5049 - BLOCK
      ?AUTO_5047 - BLOCK
      ?AUTO_5046 - BLOCK
      ?AUTO_5041 - BLOCK
      ?AUTO_5048 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_5038 ) ( CLEAR ?AUTO_5044 ) ( CLEAR ?AUTO_5040 ) ( ON ?AUTO_5045 ?AUTO_5039 ) ( ON ?AUTO_5049 ?AUTO_5045 ) ( ON ?AUTO_5047 ?AUTO_5049 ) ( ON ?AUTO_5046 ?AUTO_5047 ) ( CLEAR ?AUTO_5046 ) ( ON-TABLE ?AUTO_5041 ) ( CLEAR ?AUTO_5038 ) ( ON ?AUTO_5048 ?AUTO_5041 ) ( CLEAR ?AUTO_5048 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5048 ?AUTO_5041 )
      ( MAKE-ON ?AUTO_5038 ?AUTO_5039 )
      ( MAKE-ON-VERIFY ?AUTO_5038 ?AUTO_5039 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5058 - BLOCK
      ?AUTO_5059 - BLOCK
    )
    :vars
    (
      ?AUTO_5064 - BLOCK
      ?AUTO_5066 - BLOCK
      ?AUTO_5069 - BLOCK
      ?AUTO_5060 - BLOCK
      ?AUTO_5068 - BLOCK
      ?AUTO_5063 - BLOCK
      ?AUTO_5065 - BLOCK
      ?AUTO_5067 - BLOCK
      ?AUTO_5071 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_5058 ) ( CLEAR ?AUTO_5064 ) ( CLEAR ?AUTO_5066 ) ( ON ?AUTO_5069 ?AUTO_5059 ) ( ON ?AUTO_5060 ?AUTO_5069 ) ( ON ?AUTO_5068 ?AUTO_5060 ) ( ON ?AUTO_5063 ?AUTO_5068 ) ( CLEAR ?AUTO_5063 ) ( ON-TABLE ?AUTO_5065 ) ( CLEAR ?AUTO_5065 ) ( CLEAR ?AUTO_5058 ) ( ON ?AUTO_5067 ?AUTO_5071 ) ( CLEAR ?AUTO_5067 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5067 ?AUTO_5071 )
      ( MAKE-ON ?AUTO_5058 ?AUTO_5059 )
      ( MAKE-ON-VERIFY ?AUTO_5058 ?AUTO_5059 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5074 - BLOCK
      ?AUTO_5075 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5074 ) ( CLEAR ?AUTO_5075 ) )
    :subtasks
    ( ( !STACK ?AUTO_5074 ?AUTO_5075 )
      ( MAKE-ON-VERIFY ?AUTO_5074 ?AUTO_5075 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5078 - BLOCK
      ?AUTO_5079 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5079 ) ( ON-TABLE ?AUTO_5078 ) ( CLEAR ?AUTO_5078 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_5078 )
      ( MAKE-ON ?AUTO_5078 ?AUTO_5079 )
      ( MAKE-ON-VERIFY ?AUTO_5078 ?AUTO_5079 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5083 - BLOCK
      ?AUTO_5084 - BLOCK
    )
    :vars
    (
      ?AUTO_5088 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_5083 ) ( CLEAR ?AUTO_5083 ) ( HOLDING ?AUTO_5084 ) ( CLEAR ?AUTO_5088 ) )
    :subtasks
    ( ( !STACK ?AUTO_5084 ?AUTO_5088 )
      ( MAKE-ON ?AUTO_5083 ?AUTO_5084 )
      ( MAKE-ON-VERIFY ?AUTO_5083 ?AUTO_5084 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5406 - BLOCK
      ?AUTO_5407 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5406 ) ( CLEAR ?AUTO_5407 ) )
    :subtasks
    ( ( !STACK ?AUTO_5406 ?AUTO_5407 )
      ( MAKE-ON-VERIFY ?AUTO_5406 ?AUTO_5407 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5410 - BLOCK
      ?AUTO_5411 - BLOCK
    )
    :vars
    (
      ?AUTO_5415 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5411 ) ( ON ?AUTO_5410 ?AUTO_5415 ) ( CLEAR ?AUTO_5410 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5410 ?AUTO_5415 )
      ( MAKE-ON ?AUTO_5410 ?AUTO_5411 )
      ( MAKE-ON-VERIFY ?AUTO_5410 ?AUTO_5411 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5416 - BLOCK
      ?AUTO_5417 - BLOCK
    )
    :vars
    (
      ?AUTO_5420 - BLOCK
      ?AUTO_5421 - BLOCK
      ?AUTO_5422 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5417 ) ( ON ?AUTO_5416 ?AUTO_5420 ) ( CLEAR ?AUTO_5416 ) ( HOLDING ?AUTO_5421 ) ( CLEAR ?AUTO_5422 ) )
    :subtasks
    ( ( !STACK ?AUTO_5421 ?AUTO_5422 )
      ( MAKE-ON ?AUTO_5416 ?AUTO_5417 )
      ( MAKE-ON-VERIFY ?AUTO_5416 ?AUTO_5417 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5461 - BLOCK
      ?AUTO_5462 - BLOCK
    )
    :vars
    (
      ?AUTO_5463 - BLOCK
      ?AUTO_5466 - BLOCK
      ?AUTO_5467 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5463 ) ( ON ?AUTO_5466 ?AUTO_5462 ) ( CLEAR ?AUTO_5466 ) ( HOLDING ?AUTO_5461 ) ( CLEAR ?AUTO_5467 ) )
    :subtasks
    ( ( !STACK ?AUTO_5461 ?AUTO_5467 )
      ( MAKE-ON ?AUTO_5461 ?AUTO_5462 )
      ( MAKE-ON-VERIFY ?AUTO_5461 ?AUTO_5462 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5490 - BLOCK
      ?AUTO_5491 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5490 ) ( CLEAR ?AUTO_5491 ) )
    :subtasks
    ( ( !STACK ?AUTO_5490 ?AUTO_5491 )
      ( MAKE-ON-VERIFY ?AUTO_5490 ?AUTO_5491 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5494 - BLOCK
      ?AUTO_5495 - BLOCK
    )
    :vars
    (
      ?AUTO_5499 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5495 ) ( ON ?AUTO_5494 ?AUTO_5499 ) ( CLEAR ?AUTO_5494 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5494 ?AUTO_5499 )
      ( MAKE-ON ?AUTO_5494 ?AUTO_5495 )
      ( MAKE-ON-VERIFY ?AUTO_5494 ?AUTO_5495 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5500 - BLOCK
      ?AUTO_5501 - BLOCK
    )
    :vars
    (
      ?AUTO_5504 - BLOCK
      ?AUTO_5505 - BLOCK
      ?AUTO_5506 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5501 ) ( ON ?AUTO_5500 ?AUTO_5504 ) ( CLEAR ?AUTO_5500 ) ( HOLDING ?AUTO_5505 ) ( CLEAR ?AUTO_5506 ) )
    :subtasks
    ( ( !STACK ?AUTO_5505 ?AUTO_5506 )
      ( MAKE-ON ?AUTO_5500 ?AUTO_5501 )
      ( MAKE-ON-VERIFY ?AUTO_5500 ?AUTO_5501 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5507 - BLOCK
      ?AUTO_5508 - BLOCK
    )
    :vars
    (
      ?AUTO_5509 - BLOCK
      ?AUTO_5513 - BLOCK
      ?AUTO_5512 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5508 ) ( ON ?AUTO_5507 ?AUTO_5509 ) ( CLEAR ?AUTO_5513 ) ( ON ?AUTO_5512 ?AUTO_5507 ) ( CLEAR ?AUTO_5512 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5512 ?AUTO_5507 )
      ( MAKE-ON ?AUTO_5507 ?AUTO_5508 )
      ( MAKE-ON-VERIFY ?AUTO_5507 ?AUTO_5508 ) )
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
      ?AUTO_5520 - BLOCK
      ?AUTO_5519 - BLOCK
      ?AUTO_5524 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5516 ?AUTO_5518 ) ( CLEAR ?AUTO_5520 ) ( ON ?AUTO_5519 ?AUTO_5516 ) ( CLEAR ?AUTO_5519 ) ( HOLDING ?AUTO_5517 ) ( CLEAR ?AUTO_5524 ) )
    :subtasks
    ( ( !STACK ?AUTO_5517 ?AUTO_5524 )
      ( MAKE-ON ?AUTO_5516 ?AUTO_5517 )
      ( MAKE-ON-VERIFY ?AUTO_5516 ?AUTO_5517 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5527 - BLOCK
      ?AUTO_5528 - BLOCK
    )
    :vars
    (
      ?AUTO_5532 - BLOCK
      ?AUTO_5531 - BLOCK
      ?AUTO_5529 - BLOCK
      ?AUTO_5534 - BLOCK
      ?AUTO_5535 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5528 ) ( ON ?AUTO_5527 ?AUTO_5532 ) ( CLEAR ?AUTO_5531 ) ( ON ?AUTO_5529 ?AUTO_5527 ) ( CLEAR ?AUTO_5529 ) ( HOLDING ?AUTO_5534 ) ( CLEAR ?AUTO_5535 ) )
    :subtasks
    ( ( !STACK ?AUTO_5534 ?AUTO_5535 )
      ( MAKE-ON ?AUTO_5527 ?AUTO_5528 )
      ( MAKE-ON-VERIFY ?AUTO_5527 ?AUTO_5528 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5731 - BLOCK
      ?AUTO_5732 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5731 ) ( CLEAR ?AUTO_5732 ) )
    :subtasks
    ( ( !STACK ?AUTO_5731 ?AUTO_5732 )
      ( MAKE-ON-VERIFY ?AUTO_5731 ?AUTO_5732 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5735 - BLOCK
      ?AUTO_5736 - BLOCK
    )
    :vars
    (
      ?AUTO_5740 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5736 ) ( ON ?AUTO_5735 ?AUTO_5740 ) ( CLEAR ?AUTO_5735 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5735 ?AUTO_5740 )
      ( MAKE-ON ?AUTO_5735 ?AUTO_5736 )
      ( MAKE-ON-VERIFY ?AUTO_5735 ?AUTO_5736 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5741 - BLOCK
      ?AUTO_5742 - BLOCK
    )
    :vars
    (
      ?AUTO_5745 - BLOCK
      ?AUTO_5747 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5741 ?AUTO_5745 ) ( CLEAR ?AUTO_5741 ) ( HOLDING ?AUTO_5742 ) ( CLEAR ?AUTO_5747 ) )
    :subtasks
    ( ( !STACK ?AUTO_5742 ?AUTO_5747 )
      ( MAKE-ON ?AUTO_5741 ?AUTO_5742 )
      ( MAKE-ON-VERIFY ?AUTO_5741 ?AUTO_5742 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5749 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5749 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5749 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5749 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5751 - BLOCK
    )
    :vars
    (
      ?AUTO_5754 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5751 ?AUTO_5754 ) ( CLEAR ?AUTO_5751 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5751 ?AUTO_5754 )
      ( MAKE-ON-TABLE ?AUTO_5751 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5751 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5757 - BLOCK
      ?AUTO_5758 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5757 ) ( CLEAR ?AUTO_5758 ) )
    :subtasks
    ( ( !STACK ?AUTO_5757 ?AUTO_5758 )
      ( MAKE-ON-VERIFY ?AUTO_5757 ?AUTO_5758 ) )
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
    )
    :precondition
    ( and ( CLEAR ?AUTO_5762 ) ( ON ?AUTO_5761 ?AUTO_5766 ) ( CLEAR ?AUTO_5761 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5761 ?AUTO_5766 )
      ( MAKE-ON ?AUTO_5761 ?AUTO_5762 )
      ( MAKE-ON-VERIFY ?AUTO_5761 ?AUTO_5762 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5767 - BLOCK
      ?AUTO_5768 - BLOCK
    )
    :vars
    (
      ?AUTO_5771 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5767 ?AUTO_5771 ) ( CLEAR ?AUTO_5767 ) ( HOLDING ?AUTO_5768 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5768 )
      ( MAKE-ON ?AUTO_5767 ?AUTO_5768 )
      ( MAKE-ON-VERIFY ?AUTO_5767 ?AUTO_5768 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5777 - BLOCK
      ?AUTO_5778 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5777 ) ( CLEAR ?AUTO_5778 ) )
    :subtasks
    ( ( !STACK ?AUTO_5777 ?AUTO_5778 )
      ( MAKE-ON-VERIFY ?AUTO_5777 ?AUTO_5778 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5781 - BLOCK
      ?AUTO_5782 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5782 ) ( ON-TABLE ?AUTO_5781 ) ( CLEAR ?AUTO_5781 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_5781 )
      ( MAKE-ON ?AUTO_5781 ?AUTO_5782 )
      ( MAKE-ON-VERIFY ?AUTO_5781 ?AUTO_5782 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5786 - BLOCK
      ?AUTO_5787 - BLOCK
    )
    :vars
    (
      ?AUTO_5790 - BLOCK
      ?AUTO_5791 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5787 ) ( ON-TABLE ?AUTO_5786 ) ( CLEAR ?AUTO_5786 ) ( HOLDING ?AUTO_5790 ) ( CLEAR ?AUTO_5791 ) )
    :subtasks
    ( ( !STACK ?AUTO_5790 ?AUTO_5791 )
      ( MAKE-ON ?AUTO_5786 ?AUTO_5787 )
      ( MAKE-ON-VERIFY ?AUTO_5786 ?AUTO_5787 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5792 - BLOCK
      ?AUTO_5793 - BLOCK
    )
    :vars
    (
      ?AUTO_5795 - BLOCK
      ?AUTO_5797 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_5792 ) ( CLEAR ?AUTO_5792 ) ( CLEAR ?AUTO_5795 ) ( ON ?AUTO_5797 ?AUTO_5793 ) ( CLEAR ?AUTO_5797 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5797 ?AUTO_5793 )
      ( MAKE-ON ?AUTO_5792 ?AUTO_5793 )
      ( MAKE-ON-VERIFY ?AUTO_5792 ?AUTO_5793 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5800 - BLOCK
      ?AUTO_5801 - BLOCK
    )
    :vars
    (
      ?AUTO_5805 - BLOCK
      ?AUTO_5804 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_5800 ) ( CLEAR ?AUTO_5800 ) ( ON ?AUTO_5805 ?AUTO_5801 ) ( CLEAR ?AUTO_5805 ) ( HOLDING ?AUTO_5804 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5804 )
      ( MAKE-ON ?AUTO_5800 ?AUTO_5801 )
      ( MAKE-ON-VERIFY ?AUTO_5800 ?AUTO_5801 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5807 - BLOCK
      ?AUTO_5808 - BLOCK
    )
    :vars
    (
      ?AUTO_5811 - BLOCK
      ?AUTO_5812 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_5807 ) ( ON ?AUTO_5811 ?AUTO_5808 ) ( CLEAR ?AUTO_5811 ) ( ON ?AUTO_5812 ?AUTO_5807 ) ( CLEAR ?AUTO_5812 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5812 ?AUTO_5807 )
      ( MAKE-ON ?AUTO_5807 ?AUTO_5808 )
      ( MAKE-ON-VERIFY ?AUTO_5807 ?AUTO_5808 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5817 - BLOCK
      ?AUTO_5818 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5817 ) ( CLEAR ?AUTO_5818 ) )
    :subtasks
    ( ( !STACK ?AUTO_5817 ?AUTO_5818 )
      ( MAKE-ON-VERIFY ?AUTO_5817 ?AUTO_5818 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5821 - BLOCK
      ?AUTO_5822 - BLOCK
    )
    :vars
    (
      ?AUTO_5826 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5822 ) ( ON ?AUTO_5821 ?AUTO_5826 ) ( CLEAR ?AUTO_5821 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5821 ?AUTO_5826 )
      ( MAKE-ON ?AUTO_5821 ?AUTO_5822 )
      ( MAKE-ON-VERIFY ?AUTO_5821 ?AUTO_5822 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5827 - BLOCK
      ?AUTO_5828 - BLOCK
    )
    :vars
    (
      ?AUTO_5831 - BLOCK
      ?AUTO_5833 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5827 ?AUTO_5831 ) ( CLEAR ?AUTO_5827 ) ( HOLDING ?AUTO_5828 ) ( CLEAR ?AUTO_5833 ) )
    :subtasks
    ( ( !STACK ?AUTO_5828 ?AUTO_5833 )
      ( MAKE-ON ?AUTO_5827 ?AUTO_5828 )
      ( MAKE-ON-VERIFY ?AUTO_5827 ?AUTO_5828 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5840 - BLOCK
      ?AUTO_5841 - BLOCK
    )
    :vars
    (
      ?AUTO_5844 - BLOCK
      ?AUTO_5845 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5841 ) ( ON ?AUTO_5840 ?AUTO_5844 ) ( CLEAR ?AUTO_5840 ) ( HOLDING ?AUTO_5845 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5845 )
      ( MAKE-ON ?AUTO_5840 ?AUTO_5841 )
      ( MAKE-ON-VERIFY ?AUTO_5840 ?AUTO_5841 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5846 - BLOCK
      ?AUTO_5847 - BLOCK
    )
    :vars
    (
      ?AUTO_5850 - BLOCK
      ?AUTO_5851 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5846 ?AUTO_5850 ) ( CLEAR ?AUTO_5846 ) ( ON ?AUTO_5851 ?AUTO_5847 ) ( CLEAR ?AUTO_5851 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5851 ?AUTO_5847 )
      ( MAKE-ON ?AUTO_5846 ?AUTO_5847 )
      ( MAKE-ON-VERIFY ?AUTO_5846 ?AUTO_5847 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5853 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5853 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5853 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5853 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_5855 - BLOCK
    )
    :vars
    (
      ?AUTO_5858 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5855 ?AUTO_5858 ) ( CLEAR ?AUTO_5855 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5855 ?AUTO_5858 )
      ( MAKE-ON-TABLE ?AUTO_5855 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_5855 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5861 - BLOCK
      ?AUTO_5862 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5861 ) ( CLEAR ?AUTO_5862 ) )
    :subtasks
    ( ( !STACK ?AUTO_5861 ?AUTO_5862 )
      ( MAKE-ON-VERIFY ?AUTO_5861 ?AUTO_5862 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5865 - BLOCK
      ?AUTO_5866 - BLOCK
    )
    :vars
    (
      ?AUTO_5870 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5866 ) ( ON ?AUTO_5865 ?AUTO_5870 ) ( CLEAR ?AUTO_5865 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5865 ?AUTO_5870 )
      ( MAKE-ON ?AUTO_5865 ?AUTO_5866 )
      ( MAKE-ON-VERIFY ?AUTO_5865 ?AUTO_5866 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5871 - BLOCK
      ?AUTO_5872 - BLOCK
    )
    :vars
    (
      ?AUTO_5875 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5871 ?AUTO_5875 ) ( CLEAR ?AUTO_5871 ) ( HOLDING ?AUTO_5872 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5872 )
      ( MAKE-ON ?AUTO_5871 ?AUTO_5872 )
      ( MAKE-ON-VERIFY ?AUTO_5871 ?AUTO_5872 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5877 - BLOCK
      ?AUTO_5878 - BLOCK
    )
    :vars
    (
      ?AUTO_5881 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5877 ?AUTO_5881 ) ( ON ?AUTO_5878 ?AUTO_5877 ) ( CLEAR ?AUTO_5878 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5878 ?AUTO_5877 )
      ( MAKE-ON ?AUTO_5877 ?AUTO_5878 )
      ( MAKE-ON-VERIFY ?AUTO_5877 ?AUTO_5878 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5886 - BLOCK
      ?AUTO_5887 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5886 ) ( CLEAR ?AUTO_5887 ) )
    :subtasks
    ( ( !STACK ?AUTO_5886 ?AUTO_5887 )
      ( MAKE-ON-VERIFY ?AUTO_5886 ?AUTO_5887 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5890 - BLOCK
      ?AUTO_5891 - BLOCK
    )
    :vars
    (
      ?AUTO_5895 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5891 ) ( ON ?AUTO_5890 ?AUTO_5895 ) ( CLEAR ?AUTO_5890 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5890 ?AUTO_5895 )
      ( MAKE-ON ?AUTO_5890 ?AUTO_5891 )
      ( MAKE-ON-VERIFY ?AUTO_5890 ?AUTO_5891 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5896 - BLOCK
      ?AUTO_5897 - BLOCK
    )
    :vars
    (
      ?AUTO_5900 - BLOCK
      ?AUTO_5902 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5896 ?AUTO_5900 ) ( CLEAR ?AUTO_5896 ) ( HOLDING ?AUTO_5897 ) ( CLEAR ?AUTO_5902 ) )
    :subtasks
    ( ( !STACK ?AUTO_5897 ?AUTO_5902 )
      ( MAKE-ON ?AUTO_5896 ?AUTO_5897 )
      ( MAKE-ON-VERIFY ?AUTO_5896 ?AUTO_5897 ) )
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
    )
    :precondition
    ( and ( CLEAR ?AUTO_5906 ) ( ON ?AUTO_5905 ?AUTO_5909 ) ( CLEAR ?AUTO_5905 ) ( HOLDING ?AUTO_5910 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5910 )
      ( MAKE-ON ?AUTO_5905 ?AUTO_5906 )
      ( MAKE-ON-VERIFY ?AUTO_5905 ?AUTO_5906 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5911 - BLOCK
      ?AUTO_5912 - BLOCK
    )
    :vars
    (
      ?AUTO_5915 - BLOCK
      ?AUTO_5916 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_5911 ?AUTO_5915 ) ( CLEAR ?AUTO_5911 ) ( ON ?AUTO_5916 ?AUTO_5912 ) ( CLEAR ?AUTO_5916 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5916 ?AUTO_5912 )
      ( MAKE-ON ?AUTO_5911 ?AUTO_5912 )
      ( MAKE-ON-VERIFY ?AUTO_5911 ?AUTO_5912 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5921 - BLOCK
      ?AUTO_5922 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5921 ) ( CLEAR ?AUTO_5922 ) )
    :subtasks
    ( ( !STACK ?AUTO_5921 ?AUTO_5922 )
      ( MAKE-ON-VERIFY ?AUTO_5921 ?AUTO_5922 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5925 - BLOCK
      ?AUTO_5926 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5926 ) ( ON-TABLE ?AUTO_5925 ) ( CLEAR ?AUTO_5925 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_5925 )
      ( MAKE-ON ?AUTO_5925 ?AUTO_5926 )
      ( MAKE-ON-VERIFY ?AUTO_5925 ?AUTO_5926 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5930 - BLOCK
      ?AUTO_5931 - BLOCK
    )
    :vars
    (
      ?AUTO_5934 - BLOCK
      ?AUTO_5935 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5931 ) ( ON-TABLE ?AUTO_5930 ) ( CLEAR ?AUTO_5930 ) ( HOLDING ?AUTO_5934 ) ( CLEAR ?AUTO_5935 ) )
    :subtasks
    ( ( !STACK ?AUTO_5934 ?AUTO_5935 )
      ( MAKE-ON ?AUTO_5930 ?AUTO_5931 )
      ( MAKE-ON-VERIFY ?AUTO_5930 ?AUTO_5931 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5936 - BLOCK
      ?AUTO_5937 - BLOCK
    )
    :vars
    (
      ?AUTO_5939 - BLOCK
      ?AUTO_5941 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5937 ) ( ON-TABLE ?AUTO_5936 ) ( CLEAR ?AUTO_5939 ) ( ON ?AUTO_5941 ?AUTO_5936 ) ( CLEAR ?AUTO_5941 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5941 ?AUTO_5936 )
      ( MAKE-ON ?AUTO_5936 ?AUTO_5937 )
      ( MAKE-ON-VERIFY ?AUTO_5936 ?AUTO_5937 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5944 - BLOCK
      ?AUTO_5945 - BLOCK
    )
    :vars
    (
      ?AUTO_5949 - BLOCK
      ?AUTO_5948 - BLOCK
      ?AUTO_5951 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5945 ) ( ON-TABLE ?AUTO_5944 ) ( ON ?AUTO_5949 ?AUTO_5944 ) ( CLEAR ?AUTO_5949 ) ( HOLDING ?AUTO_5948 ) ( CLEAR ?AUTO_5951 ) )
    :subtasks
    ( ( !STACK ?AUTO_5948 ?AUTO_5951 )
      ( MAKE-ON ?AUTO_5944 ?AUTO_5945 )
      ( MAKE-ON-VERIFY ?AUTO_5944 ?AUTO_5945 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5952 - BLOCK
      ?AUTO_5953 - BLOCK
    )
    :vars
    (
      ?AUTO_5956 - BLOCK
      ?AUTO_5958 - BLOCK
      ?AUTO_5957 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_5952 ) ( ON ?AUTO_5956 ?AUTO_5952 ) ( CLEAR ?AUTO_5956 ) ( CLEAR ?AUTO_5958 ) ( ON ?AUTO_5957 ?AUTO_5953 ) ( CLEAR ?AUTO_5957 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5957 ?AUTO_5953 )
      ( MAKE-ON ?AUTO_5952 ?AUTO_5953 )
      ( MAKE-ON-VERIFY ?AUTO_5952 ?AUTO_5953 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5961 - BLOCK
      ?AUTO_5962 - BLOCK
    )
    :vars
    (
      ?AUTO_5965 - BLOCK
      ?AUTO_5964 - BLOCK
      ?AUTO_5963 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_5961 ) ( ON ?AUTO_5965 ?AUTO_5961 ) ( CLEAR ?AUTO_5965 ) ( ON ?AUTO_5964 ?AUTO_5962 ) ( CLEAR ?AUTO_5964 ) ( HOLDING ?AUTO_5963 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_5963 )
      ( MAKE-ON ?AUTO_5961 ?AUTO_5962 )
      ( MAKE-ON-VERIFY ?AUTO_5961 ?AUTO_5962 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5969 - BLOCK
      ?AUTO_5970 - BLOCK
    )
    :vars
    (
      ?AUTO_5975 - BLOCK
      ?AUTO_5973 - BLOCK
      ?AUTO_5971 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_5969 ) ( ON ?AUTO_5975 ?AUTO_5969 ) ( CLEAR ?AUTO_5975 ) ( ON ?AUTO_5973 ?AUTO_5970 ) ( ON ?AUTO_5971 ?AUTO_5973 ) ( CLEAR ?AUTO_5971 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_5971 ?AUTO_5973 )
      ( MAKE-ON ?AUTO_5969 ?AUTO_5970 )
      ( MAKE-ON-VERIFY ?AUTO_5969 ?AUTO_5970 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5980 - BLOCK
      ?AUTO_5981 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_5980 ) ( CLEAR ?AUTO_5981 ) )
    :subtasks
    ( ( !STACK ?AUTO_5980 ?AUTO_5981 )
      ( MAKE-ON-VERIFY ?AUTO_5980 ?AUTO_5981 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5984 - BLOCK
      ?AUTO_5985 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_5985 ) ( ON-TABLE ?AUTO_5984 ) ( CLEAR ?AUTO_5984 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_5984 )
      ( MAKE-ON ?AUTO_5984 ?AUTO_5985 )
      ( MAKE-ON-VERIFY ?AUTO_5984 ?AUTO_5985 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_5989 - BLOCK
      ?AUTO_5990 - BLOCK
    )
    :vars
    (
      ?AUTO_5994 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_5989 ) ( CLEAR ?AUTO_5989 ) ( HOLDING ?AUTO_5990 ) ( CLEAR ?AUTO_5994 ) )
    :subtasks
    ( ( !STACK ?AUTO_5990 ?AUTO_5994 )
      ( MAKE-ON ?AUTO_5989 ?AUTO_5990 )
      ( MAKE-ON-VERIFY ?AUTO_5989 ?AUTO_5990 ) )
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
      ?AUTO_6004 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_5999 ) ( CLEAR ?AUTO_5999 ) ( CLEAR ?AUTO_6001 ) ( ON ?AUTO_6004 ?AUTO_6000 ) ( CLEAR ?AUTO_6004 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6004 ?AUTO_6000 )
      ( MAKE-ON ?AUTO_5999 ?AUTO_6000 )
      ( MAKE-ON-VERIFY ?AUTO_5999 ?AUTO_6000 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6007 - BLOCK
      ?AUTO_6008 - BLOCK
    )
    :vars
    (
      ?AUTO_6011 - BLOCK
      ?AUTO_6012 - BLOCK
      ?AUTO_6013 - BLOCK
      ?AUTO_6014 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_6007 ) ( CLEAR ?AUTO_6007 ) ( CLEAR ?AUTO_6011 ) ( ON ?AUTO_6012 ?AUTO_6008 ) ( CLEAR ?AUTO_6012 ) ( HOLDING ?AUTO_6013 ) ( CLEAR ?AUTO_6014 ) )
    :subtasks
    ( ( !STACK ?AUTO_6013 ?AUTO_6014 )
      ( MAKE-ON ?AUTO_6007 ?AUTO_6008 )
      ( MAKE-ON-VERIFY ?AUTO_6007 ?AUTO_6008 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6016 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6016 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6016 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6016 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6018 - BLOCK
    )
    :vars
    (
      ?AUTO_6021 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6018 ?AUTO_6021 ) ( CLEAR ?AUTO_6018 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6018 ?AUTO_6021 )
      ( MAKE-ON-TABLE ?AUTO_6018 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6018 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6023 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6023 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6023 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6023 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6025 - BLOCK
    )
    :vars
    (
      ?AUTO_6028 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6025 ?AUTO_6028 ) ( CLEAR ?AUTO_6025 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6025 ?AUTO_6028 )
      ( MAKE-ON-TABLE ?AUTO_6025 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6025 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6029 - BLOCK
    )
    :vars
    (
      ?AUTO_6031 - BLOCK
      ?AUTO_6032 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6029 ?AUTO_6031 ) ( CLEAR ?AUTO_6029 ) ( HOLDING ?AUTO_6032 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6032 )
      ( MAKE-ON-TABLE ?AUTO_6029 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6029 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6036 - BLOCK
      ?AUTO_6037 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6036 ) ( CLEAR ?AUTO_6037 ) )
    :subtasks
    ( ( !STACK ?AUTO_6036 ?AUTO_6037 )
      ( MAKE-ON-VERIFY ?AUTO_6036 ?AUTO_6037 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6040 - BLOCK
      ?AUTO_6041 - BLOCK
    )
    :vars
    (
      ?AUTO_6045 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6041 ) ( ON ?AUTO_6040 ?AUTO_6045 ) ( CLEAR ?AUTO_6040 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6040 ?AUTO_6045 )
      ( MAKE-ON ?AUTO_6040 ?AUTO_6041 )
      ( MAKE-ON-VERIFY ?AUTO_6040 ?AUTO_6041 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6046 - BLOCK
      ?AUTO_6047 - BLOCK
    )
    :vars
    (
      ?AUTO_6050 - BLOCK
      ?AUTO_6051 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6047 ) ( ON ?AUTO_6046 ?AUTO_6050 ) ( CLEAR ?AUTO_6046 ) ( HOLDING ?AUTO_6051 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6051 )
      ( MAKE-ON ?AUTO_6046 ?AUTO_6047 )
      ( MAKE-ON-VERIFY ?AUTO_6046 ?AUTO_6047 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6054 - BLOCK
      ?AUTO_6055 - BLOCK
    )
    :vars
    (
      ?AUTO_6058 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6054 ?AUTO_6058 ) ( CLEAR ?AUTO_6054 ) ( HOLDING ?AUTO_6055 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6055 )
      ( MAKE-ON ?AUTO_6054 ?AUTO_6055 )
      ( MAKE-ON-VERIFY ?AUTO_6054 ?AUTO_6055 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6063 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6063 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6063 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6063 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6065 - BLOCK
    )
    :vars
    (
      ?AUTO_6068 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6065 ?AUTO_6068 ) ( CLEAR ?AUTO_6065 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6065 ?AUTO_6068 )
      ( MAKE-ON-TABLE ?AUTO_6065 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6065 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6069 - BLOCK
    )
    :vars
    (
      ?AUTO_6071 - BLOCK
      ?AUTO_6072 - BLOCK
      ?AUTO_6073 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6069 ?AUTO_6071 ) ( CLEAR ?AUTO_6069 ) ( HOLDING ?AUTO_6072 ) ( CLEAR ?AUTO_6073 ) )
    :subtasks
    ( ( !STACK ?AUTO_6072 ?AUTO_6073 )
      ( MAKE-ON-TABLE ?AUTO_6069 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6069 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6078 - BLOCK
    )
    :vars
    (
      ?AUTO_6080 - BLOCK
      ?AUTO_6082 - BLOCK
      ?AUTO_6081 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6078 ?AUTO_6080 ) ( CLEAR ?AUTO_6082 ) ( ON ?AUTO_6081 ?AUTO_6078 ) ( CLEAR ?AUTO_6081 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6081 ?AUTO_6078 )
      ( MAKE-ON-TABLE ?AUTO_6078 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6078 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6087 - BLOCK
      ?AUTO_6088 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6087 ) ( CLEAR ?AUTO_6088 ) )
    :subtasks
    ( ( !STACK ?AUTO_6087 ?AUTO_6088 )
      ( MAKE-ON-VERIFY ?AUTO_6087 ?AUTO_6088 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6091 - BLOCK
      ?AUTO_6092 - BLOCK
    )
    :vars
    (
      ?AUTO_6096 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6092 ) ( ON ?AUTO_6091 ?AUTO_6096 ) ( CLEAR ?AUTO_6091 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6091 ?AUTO_6096 )
      ( MAKE-ON ?AUTO_6091 ?AUTO_6092 )
      ( MAKE-ON-VERIFY ?AUTO_6091 ?AUTO_6092 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6097 - BLOCK
      ?AUTO_6098 - BLOCK
    )
    :vars
    (
      ?AUTO_6101 - BLOCK
      ?AUTO_6102 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6098 ) ( ON ?AUTO_6097 ?AUTO_6101 ) ( CLEAR ?AUTO_6097 ) ( HOLDING ?AUTO_6102 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6102 )
      ( MAKE-ON ?AUTO_6097 ?AUTO_6098 )
      ( MAKE-ON-VERIFY ?AUTO_6097 ?AUTO_6098 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6103 - BLOCK
      ?AUTO_6104 - BLOCK
    )
    :vars
    (
      ?AUTO_6107 - BLOCK
      ?AUTO_6108 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6104 ) ( ON ?AUTO_6103 ?AUTO_6107 ) ( ON ?AUTO_6108 ?AUTO_6103 ) ( CLEAR ?AUTO_6108 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6108 ?AUTO_6103 )
      ( MAKE-ON ?AUTO_6103 ?AUTO_6104 )
      ( MAKE-ON-VERIFY ?AUTO_6103 ?AUTO_6104 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6111 - BLOCK
      ?AUTO_6112 - BLOCK
    )
    :vars
    (
      ?AUTO_6116 - BLOCK
      ?AUTO_6113 - BLOCK
      ?AUTO_6117 - BLOCK
      ?AUTO_6118 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6112 ) ( ON ?AUTO_6111 ?AUTO_6116 ) ( ON ?AUTO_6113 ?AUTO_6111 ) ( CLEAR ?AUTO_6113 ) ( HOLDING ?AUTO_6117 ) ( CLEAR ?AUTO_6118 ) )
    :subtasks
    ( ( !STACK ?AUTO_6117 ?AUTO_6118 )
      ( MAKE-ON ?AUTO_6111 ?AUTO_6112 )
      ( MAKE-ON-VERIFY ?AUTO_6111 ?AUTO_6112 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6121 - BLOCK
      ?AUTO_6122 - BLOCK
    )
    :vars
    (
      ?AUTO_6126 - BLOCK
      ?AUTO_6123 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6121 ?AUTO_6126 ) ( ON ?AUTO_6123 ?AUTO_6121 ) ( CLEAR ?AUTO_6123 ) ( HOLDING ?AUTO_6122 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6122 )
      ( MAKE-ON ?AUTO_6121 ?AUTO_6122 )
      ( MAKE-ON-VERIFY ?AUTO_6121 ?AUTO_6122 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6132 - BLOCK
      ?AUTO_6133 - BLOCK
    )
    :vars
    (
      ?AUTO_6136 - BLOCK
      ?AUTO_6137 - BLOCK
      ?AUTO_6138 - BLOCK
      ?AUTO_6139 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6133 ) ( ON ?AUTO_6132 ?AUTO_6136 ) ( ON ?AUTO_6137 ?AUTO_6132 ) ( CLEAR ?AUTO_6138 ) ( ON ?AUTO_6139 ?AUTO_6137 ) ( CLEAR ?AUTO_6139 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6139 ?AUTO_6137 )
      ( MAKE-ON ?AUTO_6132 ?AUTO_6133 )
      ( MAKE-ON-VERIFY ?AUTO_6132 ?AUTO_6133 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6144 - BLOCK
      ?AUTO_6145 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6144 ) ( CLEAR ?AUTO_6145 ) )
    :subtasks
    ( ( !STACK ?AUTO_6144 ?AUTO_6145 )
      ( MAKE-ON-VERIFY ?AUTO_6144 ?AUTO_6145 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6148 - BLOCK
      ?AUTO_6149 - BLOCK
    )
    :vars
    (
      ?AUTO_6153 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6149 ) ( ON ?AUTO_6148 ?AUTO_6153 ) ( CLEAR ?AUTO_6148 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6148 ?AUTO_6153 )
      ( MAKE-ON ?AUTO_6148 ?AUTO_6149 )
      ( MAKE-ON-VERIFY ?AUTO_6148 ?AUTO_6149 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6154 - BLOCK
      ?AUTO_6155 - BLOCK
    )
    :vars
    (
      ?AUTO_6158 - BLOCK
      ?AUTO_6159 - BLOCK
      ?AUTO_6160 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6155 ) ( ON ?AUTO_6154 ?AUTO_6158 ) ( CLEAR ?AUTO_6154 ) ( HOLDING ?AUTO_6159 ) ( CLEAR ?AUTO_6160 ) )
    :subtasks
    ( ( !STACK ?AUTO_6159 ?AUTO_6160 )
      ( MAKE-ON ?AUTO_6154 ?AUTO_6155 )
      ( MAKE-ON-VERIFY ?AUTO_6154 ?AUTO_6155 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6161 - BLOCK
      ?AUTO_6162 - BLOCK
    )
    :vars
    (
      ?AUTO_6165 - BLOCK
      ?AUTO_6167 - BLOCK
      ?AUTO_6166 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6161 ?AUTO_6165 ) ( CLEAR ?AUTO_6161 ) ( CLEAR ?AUTO_6167 ) ( ON ?AUTO_6166 ?AUTO_6162 ) ( CLEAR ?AUTO_6166 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6166 ?AUTO_6162 )
      ( MAKE-ON ?AUTO_6161 ?AUTO_6162 )
      ( MAKE-ON-VERIFY ?AUTO_6161 ?AUTO_6162 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6170 - BLOCK
      ?AUTO_6171 - BLOCK
    )
    :vars
    (
      ?AUTO_6176 - BLOCK
      ?AUTO_6173 - BLOCK
      ?AUTO_6172 - BLOCK
      ?AUTO_6177 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6170 ?AUTO_6176 ) ( CLEAR ?AUTO_6170 ) ( CLEAR ?AUTO_6173 ) ( ON ?AUTO_6172 ?AUTO_6171 ) ( CLEAR ?AUTO_6172 ) ( HOLDING ?AUTO_6177 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6177 )
      ( MAKE-ON ?AUTO_6170 ?AUTO_6171 )
      ( MAKE-ON-VERIFY ?AUTO_6170 ?AUTO_6171 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6178 - BLOCK
      ?AUTO_6179 - BLOCK
    )
    :vars
    (
      ?AUTO_6185 - BLOCK
      ?AUTO_6182 - BLOCK
      ?AUTO_6180 - BLOCK
      ?AUTO_6184 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6178 ?AUTO_6185 ) ( CLEAR ?AUTO_6178 ) ( CLEAR ?AUTO_6182 ) ( ON ?AUTO_6180 ?AUTO_6179 ) ( ON ?AUTO_6184 ?AUTO_6180 ) ( CLEAR ?AUTO_6184 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6184 ?AUTO_6180 )
      ( MAKE-ON ?AUTO_6178 ?AUTO_6179 )
      ( MAKE-ON-VERIFY ?AUTO_6178 ?AUTO_6179 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6188 - BLOCK
      ?AUTO_6189 - BLOCK
    )
    :vars
    (
      ?AUTO_6191 - BLOCK
      ?AUTO_6195 - BLOCK
      ?AUTO_6193 - BLOCK
      ?AUTO_6194 - BLOCK
      ?AUTO_6196 - BLOCK
      ?AUTO_6197 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6188 ?AUTO_6191 ) ( CLEAR ?AUTO_6188 ) ( CLEAR ?AUTO_6195 ) ( ON ?AUTO_6193 ?AUTO_6189 ) ( ON ?AUTO_6194 ?AUTO_6193 ) ( CLEAR ?AUTO_6194 ) ( HOLDING ?AUTO_6196 ) ( CLEAR ?AUTO_6197 ) )
    :subtasks
    ( ( !STACK ?AUTO_6196 ?AUTO_6197 )
      ( MAKE-ON ?AUTO_6188 ?AUTO_6189 )
      ( MAKE-ON-VERIFY ?AUTO_6188 ?AUTO_6189 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6198 - BLOCK
      ?AUTO_6199 - BLOCK
    )
    :vars
    (
      ?AUTO_6206 - BLOCK
      ?AUTO_6200 - BLOCK
      ?AUTO_6201 - BLOCK
      ?AUTO_6207 - BLOCK
      ?AUTO_6203 - BLOCK
      ?AUTO_6202 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6198 ?AUTO_6206 ) ( CLEAR ?AUTO_6200 ) ( ON ?AUTO_6201 ?AUTO_6199 ) ( ON ?AUTO_6207 ?AUTO_6201 ) ( CLEAR ?AUTO_6207 ) ( CLEAR ?AUTO_6203 ) ( ON ?AUTO_6202 ?AUTO_6198 ) ( CLEAR ?AUTO_6202 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6202 ?AUTO_6198 )
      ( MAKE-ON ?AUTO_6198 ?AUTO_6199 )
      ( MAKE-ON-VERIFY ?AUTO_6198 ?AUTO_6199 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6210 - BLOCK
      ?AUTO_6211 - BLOCK
    )
    :vars
    (
      ?AUTO_6216 - BLOCK
      ?AUTO_6218 - BLOCK
      ?AUTO_6212 - BLOCK
      ?AUTO_6214 - BLOCK
      ?AUTO_6219 - BLOCK
      ?AUTO_6217 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6210 ?AUTO_6216 ) ( ON ?AUTO_6218 ?AUTO_6211 ) ( ON ?AUTO_6212 ?AUTO_6218 ) ( CLEAR ?AUTO_6212 ) ( CLEAR ?AUTO_6214 ) ( ON ?AUTO_6219 ?AUTO_6210 ) ( CLEAR ?AUTO_6219 ) ( HOLDING ?AUTO_6217 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6217 )
      ( MAKE-ON ?AUTO_6210 ?AUTO_6211 )
      ( MAKE-ON-VERIFY ?AUTO_6210 ?AUTO_6211 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6225 - BLOCK
      ?AUTO_6226 - BLOCK
    )
    :vars
    (
      ?AUTO_6231 - BLOCK
      ?AUTO_6227 - BLOCK
      ?AUTO_6233 - BLOCK
      ?AUTO_6232 - BLOCK
      ?AUTO_6230 - BLOCK
      ?AUTO_6228 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6225 ?AUTO_6231 ) ( ON ?AUTO_6227 ?AUTO_6226 ) ( ON ?AUTO_6233 ?AUTO_6227 ) ( CLEAR ?AUTO_6232 ) ( ON ?AUTO_6230 ?AUTO_6225 ) ( CLEAR ?AUTO_6230 ) ( ON ?AUTO_6228 ?AUTO_6233 ) ( CLEAR ?AUTO_6228 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6228 ?AUTO_6233 )
      ( MAKE-ON ?AUTO_6225 ?AUTO_6226 )
      ( MAKE-ON-VERIFY ?AUTO_6225 ?AUTO_6226 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6239 - BLOCK
      ?AUTO_6240 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6239 ) ( CLEAR ?AUTO_6240 ) )
    :subtasks
    ( ( !STACK ?AUTO_6239 ?AUTO_6240 )
      ( MAKE-ON-VERIFY ?AUTO_6239 ?AUTO_6240 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6243 - BLOCK
      ?AUTO_6244 - BLOCK
    )
    :vars
    (
      ?AUTO_6248 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6244 ) ( ON ?AUTO_6243 ?AUTO_6248 ) ( CLEAR ?AUTO_6243 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6243 ?AUTO_6248 )
      ( MAKE-ON ?AUTO_6243 ?AUTO_6244 )
      ( MAKE-ON-VERIFY ?AUTO_6243 ?AUTO_6244 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6249 - BLOCK
      ?AUTO_6250 - BLOCK
    )
    :vars
    (
      ?AUTO_6253 - BLOCK
      ?AUTO_6255 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6249 ?AUTO_6253 ) ( CLEAR ?AUTO_6249 ) ( HOLDING ?AUTO_6250 ) ( CLEAR ?AUTO_6255 ) )
    :subtasks
    ( ( !STACK ?AUTO_6250 ?AUTO_6255 )
      ( MAKE-ON ?AUTO_6249 ?AUTO_6250 )
      ( MAKE-ON-VERIFY ?AUTO_6249 ?AUTO_6250 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6256 - BLOCK
      ?AUTO_6257 - BLOCK
    )
    :vars
    (
      ?AUTO_6260 - BLOCK
      ?AUTO_6261 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6256 ?AUTO_6260 ) ( CLEAR ?AUTO_6261 ) ( ON ?AUTO_6257 ?AUTO_6256 ) ( CLEAR ?AUTO_6257 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6257 ?AUTO_6256 )
      ( MAKE-ON ?AUTO_6256 ?AUTO_6257 )
      ( MAKE-ON-VERIFY ?AUTO_6256 ?AUTO_6257 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6264 - BLOCK
      ?AUTO_6265 - BLOCK
    )
    :vars
    (
      ?AUTO_6269 - BLOCK
      ?AUTO_6266 - BLOCK
      ?AUTO_6270 - BLOCK
      ?AUTO_6271 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6264 ?AUTO_6269 ) ( CLEAR ?AUTO_6266 ) ( ON ?AUTO_6265 ?AUTO_6264 ) ( CLEAR ?AUTO_6265 ) ( HOLDING ?AUTO_6270 ) ( CLEAR ?AUTO_6271 ) )
    :subtasks
    ( ( !STACK ?AUTO_6270 ?AUTO_6271 )
      ( MAKE-ON ?AUTO_6264 ?AUTO_6265 )
      ( MAKE-ON-VERIFY ?AUTO_6264 ?AUTO_6265 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6280 - BLOCK
      ?AUTO_6281 - BLOCK
    )
    :vars
    (
      ?AUTO_6284 - BLOCK
      ?AUTO_6286 - BLOCK
      ?AUTO_6283 - BLOCK
      ?AUTO_6282 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6280 ?AUTO_6284 ) ( CLEAR ?AUTO_6286 ) ( ON ?AUTO_6281 ?AUTO_6280 ) ( CLEAR ?AUTO_6283 ) ( ON ?AUTO_6282 ?AUTO_6281 ) ( CLEAR ?AUTO_6282 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6282 ?AUTO_6281 )
      ( MAKE-ON ?AUTO_6280 ?AUTO_6281 )
      ( MAKE-ON-VERIFY ?AUTO_6280 ?AUTO_6281 ) )
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
      ?AUTO_6297 - BLOCK
      ?AUTO_6294 - BLOCK
      ?AUTO_6296 - BLOCK
      ?AUTO_6298 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6290 ?AUTO_6293 ) ( CLEAR ?AUTO_6297 ) ( ON ?AUTO_6291 ?AUTO_6290 ) ( CLEAR ?AUTO_6294 ) ( ON ?AUTO_6296 ?AUTO_6291 ) ( CLEAR ?AUTO_6296 ) ( HOLDING ?AUTO_6298 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6298 )
      ( MAKE-ON ?AUTO_6290 ?AUTO_6291 )
      ( MAKE-ON-VERIFY ?AUTO_6290 ?AUTO_6291 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6307 - BLOCK
      ?AUTO_6308 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6307 ) ( CLEAR ?AUTO_6308 ) )
    :subtasks
    ( ( !STACK ?AUTO_6307 ?AUTO_6308 )
      ( MAKE-ON-VERIFY ?AUTO_6307 ?AUTO_6308 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6311 - BLOCK
      ?AUTO_6312 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6312 ) ( ON-TABLE ?AUTO_6311 ) ( CLEAR ?AUTO_6311 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_6311 )
      ( MAKE-ON ?AUTO_6311 ?AUTO_6312 )
      ( MAKE-ON-VERIFY ?AUTO_6311 ?AUTO_6312 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6316 - BLOCK
      ?AUTO_6317 - BLOCK
    )
    :vars
    (
      ?AUTO_6320 - BLOCK
      ?AUTO_6321 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6317 ) ( ON-TABLE ?AUTO_6316 ) ( CLEAR ?AUTO_6316 ) ( HOLDING ?AUTO_6320 ) ( CLEAR ?AUTO_6321 ) )
    :subtasks
    ( ( !STACK ?AUTO_6320 ?AUTO_6321 )
      ( MAKE-ON ?AUTO_6316 ?AUTO_6317 )
      ( MAKE-ON-VERIFY ?AUTO_6316 ?AUTO_6317 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6322 - BLOCK
      ?AUTO_6323 - BLOCK
    )
    :vars
    (
      ?AUTO_6327 - BLOCK
      ?AUTO_6326 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_6322 ) ( CLEAR ?AUTO_6322 ) ( CLEAR ?AUTO_6327 ) ( ON ?AUTO_6326 ?AUTO_6323 ) ( CLEAR ?AUTO_6326 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6326 ?AUTO_6323 )
      ( MAKE-ON ?AUTO_6322 ?AUTO_6323 )
      ( MAKE-ON-VERIFY ?AUTO_6322 ?AUTO_6323 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6330 - BLOCK
      ?AUTO_6331 - BLOCK
    )
    :vars
    (
      ?AUTO_6335 - BLOCK
      ?AUTO_6332 - BLOCK
      ?AUTO_6337 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_6330 ) ( CLEAR ?AUTO_6330 ) ( ON ?AUTO_6335 ?AUTO_6331 ) ( CLEAR ?AUTO_6335 ) ( HOLDING ?AUTO_6332 ) ( CLEAR ?AUTO_6337 ) )
    :subtasks
    ( ( !STACK ?AUTO_6332 ?AUTO_6337 )
      ( MAKE-ON ?AUTO_6330 ?AUTO_6331 )
      ( MAKE-ON-VERIFY ?AUTO_6330 ?AUTO_6331 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6338 - BLOCK
      ?AUTO_6339 - BLOCK
    )
    :vars
    (
      ?AUTO_6343 - BLOCK
      ?AUTO_6344 - BLOCK
      ?AUTO_6341 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_6338 ) ( CLEAR ?AUTO_6338 ) ( ON ?AUTO_6343 ?AUTO_6339 ) ( CLEAR ?AUTO_6344 ) ( ON ?AUTO_6341 ?AUTO_6343 ) ( CLEAR ?AUTO_6341 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6341 ?AUTO_6343 )
      ( MAKE-ON ?AUTO_6338 ?AUTO_6339 )
      ( MAKE-ON-VERIFY ?AUTO_6338 ?AUTO_6339 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6347 - BLOCK
      ?AUTO_6348 - BLOCK
    )
    :vars
    (
      ?AUTO_6350 - BLOCK
      ?AUTO_6349 - BLOCK
      ?AUTO_6351 - BLOCK
      ?AUTO_6354 - BLOCK
      ?AUTO_6355 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_6347 ) ( CLEAR ?AUTO_6347 ) ( ON ?AUTO_6350 ?AUTO_6348 ) ( CLEAR ?AUTO_6349 ) ( ON ?AUTO_6351 ?AUTO_6350 ) ( CLEAR ?AUTO_6351 ) ( HOLDING ?AUTO_6354 ) ( CLEAR ?AUTO_6355 ) )
    :subtasks
    ( ( !STACK ?AUTO_6354 ?AUTO_6355 )
      ( MAKE-ON ?AUTO_6347 ?AUTO_6348 )
      ( MAKE-ON-VERIFY ?AUTO_6347 ?AUTO_6348 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6358 - BLOCK
      ?AUTO_6359 - BLOCK
    )
    :vars
    (
      ?AUTO_6360 - BLOCK
      ?AUTO_6362 - BLOCK
      ?AUTO_6361 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6360 ?AUTO_6359 ) ( CLEAR ?AUTO_6362 ) ( ON ?AUTO_6361 ?AUTO_6360 ) ( CLEAR ?AUTO_6361 ) ( HOLDING ?AUTO_6358 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6358 )
      ( MAKE-ON ?AUTO_6358 ?AUTO_6359 )
      ( MAKE-ON-VERIFY ?AUTO_6358 ?AUTO_6359 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6370 - BLOCK
      ?AUTO_6371 - BLOCK
    )
    :vars
    (
      ?AUTO_6373 - BLOCK
      ?AUTO_6376 - BLOCK
      ?AUTO_6378 - BLOCK
      ?AUTO_6379 - BLOCK
      ?AUTO_6372 - BLOCK
      ?AUTO_6377 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6370 ?AUTO_6373 ) ( CLEAR ?AUTO_6370 ) ( CLEAR ?AUTO_6376 ) ( ON ?AUTO_6378 ?AUTO_6371 ) ( ON ?AUTO_6379 ?AUTO_6378 ) ( CLEAR ?AUTO_6372 ) ( ON ?AUTO_6377 ?AUTO_6379 ) ( CLEAR ?AUTO_6377 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6377 ?AUTO_6379 )
      ( MAKE-ON ?AUTO_6370 ?AUTO_6371 )
      ( MAKE-ON-VERIFY ?AUTO_6370 ?AUTO_6371 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6382 - BLOCK
      ?AUTO_6383 - BLOCK
    )
    :vars
    (
      ?AUTO_6387 - BLOCK
      ?AUTO_6388 - BLOCK
      ?AUTO_6390 - BLOCK
      ?AUTO_6389 - BLOCK
      ?AUTO_6391 - BLOCK
      ?AUTO_6386 - BLOCK
      ?AUTO_6392 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6382 ?AUTO_6387 ) ( CLEAR ?AUTO_6382 ) ( CLEAR ?AUTO_6388 ) ( ON ?AUTO_6390 ?AUTO_6383 ) ( ON ?AUTO_6389 ?AUTO_6390 ) ( CLEAR ?AUTO_6391 ) ( ON ?AUTO_6386 ?AUTO_6389 ) ( CLEAR ?AUTO_6386 ) ( HOLDING ?AUTO_6392 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6392 )
      ( MAKE-ON ?AUTO_6382 ?AUTO_6383 )
      ( MAKE-ON-VERIFY ?AUTO_6382 ?AUTO_6383 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6401 - BLOCK
      ?AUTO_6402 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6401 ) ( CLEAR ?AUTO_6402 ) )
    :subtasks
    ( ( !STACK ?AUTO_6401 ?AUTO_6402 )
      ( MAKE-ON-VERIFY ?AUTO_6401 ?AUTO_6402 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6405 - BLOCK
      ?AUTO_6406 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6406 ) ( ON-TABLE ?AUTO_6405 ) ( CLEAR ?AUTO_6405 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_6405 )
      ( MAKE-ON ?AUTO_6405 ?AUTO_6406 )
      ( MAKE-ON-VERIFY ?AUTO_6405 ?AUTO_6406 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6410 - BLOCK
      ?AUTO_6411 - BLOCK
    )
    :vars
    (
      ?AUTO_6414 - BLOCK
      ?AUTO_6415 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6411 ) ( ON-TABLE ?AUTO_6410 ) ( CLEAR ?AUTO_6410 ) ( HOLDING ?AUTO_6414 ) ( CLEAR ?AUTO_6415 ) )
    :subtasks
    ( ( !STACK ?AUTO_6414 ?AUTO_6415 )
      ( MAKE-ON ?AUTO_6410 ?AUTO_6411 )
      ( MAKE-ON-VERIFY ?AUTO_6410 ?AUTO_6411 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6426 - BLOCK
      ?AUTO_6427 - BLOCK
    )
    :vars
    (
      ?AUTO_6431 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_6426 ) ( CLEAR ?AUTO_6426 ) ( HOLDING ?AUTO_6427 ) ( CLEAR ?AUTO_6431 ) )
    :subtasks
    ( ( !STACK ?AUTO_6427 ?AUTO_6431 )
      ( MAKE-ON ?AUTO_6426 ?AUTO_6427 )
      ( MAKE-ON-VERIFY ?AUTO_6426 ?AUTO_6427 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6444 - BLOCK
      ?AUTO_6445 - BLOCK
    )
    :vars
    (
      ?AUTO_6450 - BLOCK
      ?AUTO_6446 - BLOCK
      ?AUTO_6449 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_6444 ) ( ON ?AUTO_6450 ?AUTO_6445 ) ( CLEAR ?AUTO_6450 ) ( CLEAR ?AUTO_6446 ) ( ON ?AUTO_6449 ?AUTO_6444 ) ( CLEAR ?AUTO_6449 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6449 ?AUTO_6444 )
      ( MAKE-ON ?AUTO_6444 ?AUTO_6445 )
      ( MAKE-ON-VERIFY ?AUTO_6444 ?AUTO_6445 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6453 - BLOCK
      ?AUTO_6454 - BLOCK
    )
    :vars
    (
      ?AUTO_6458 - BLOCK
      ?AUTO_6457 - BLOCK
      ?AUTO_6459 - BLOCK
      ?AUTO_6460 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_6453 ) ( ON ?AUTO_6458 ?AUTO_6454 ) ( CLEAR ?AUTO_6458 ) ( CLEAR ?AUTO_6457 ) ( ON ?AUTO_6459 ?AUTO_6453 ) ( CLEAR ?AUTO_6459 ) ( HOLDING ?AUTO_6460 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6460 )
      ( MAKE-ON ?AUTO_6453 ?AUTO_6454 )
      ( MAKE-ON-VERIFY ?AUTO_6453 ?AUTO_6454 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6461 - BLOCK
      ?AUTO_6462 - BLOCK
    )
    :vars
    (
      ?AUTO_6468 - BLOCK
      ?AUTO_6467 - BLOCK
      ?AUTO_6463 - BLOCK
      ?AUTO_6466 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_6461 ) ( ON ?AUTO_6468 ?AUTO_6462 ) ( CLEAR ?AUTO_6467 ) ( ON ?AUTO_6463 ?AUTO_6461 ) ( CLEAR ?AUTO_6463 ) ( ON ?AUTO_6466 ?AUTO_6468 ) ( CLEAR ?AUTO_6466 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6466 ?AUTO_6468 )
      ( MAKE-ON ?AUTO_6461 ?AUTO_6462 )
      ( MAKE-ON-VERIFY ?AUTO_6461 ?AUTO_6462 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6470 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6470 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6470 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6470 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6472 - BLOCK
    )
    :vars
    (
      ?AUTO_6475 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6472 ?AUTO_6475 ) ( CLEAR ?AUTO_6472 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6472 ?AUTO_6475 )
      ( MAKE-ON-TABLE ?AUTO_6472 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6472 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6477 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6477 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6477 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6477 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6479 - BLOCK
    )
    :vars
    (
      ?AUTO_6482 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6479 ?AUTO_6482 ) ( CLEAR ?AUTO_6479 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6479 ?AUTO_6482 )
      ( MAKE-ON-TABLE ?AUTO_6479 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6479 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6483 - BLOCK
    )
    :vars
    (
      ?AUTO_6485 - BLOCK
      ?AUTO_6486 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6483 ?AUTO_6485 ) ( CLEAR ?AUTO_6483 ) ( HOLDING ?AUTO_6486 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6486 )
      ( MAKE-ON-TABLE ?AUTO_6483 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6483 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6490 - BLOCK
      ?AUTO_6491 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6490 ) ( CLEAR ?AUTO_6491 ) )
    :subtasks
    ( ( !STACK ?AUTO_6490 ?AUTO_6491 )
      ( MAKE-ON-VERIFY ?AUTO_6490 ?AUTO_6491 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6494 - BLOCK
      ?AUTO_6495 - BLOCK
    )
    :vars
    (
      ?AUTO_6499 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6495 ) ( ON ?AUTO_6494 ?AUTO_6499 ) ( CLEAR ?AUTO_6494 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6494 ?AUTO_6499 )
      ( MAKE-ON ?AUTO_6494 ?AUTO_6495 )
      ( MAKE-ON-VERIFY ?AUTO_6494 ?AUTO_6495 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6500 - BLOCK
      ?AUTO_6501 - BLOCK
    )
    :vars
    (
      ?AUTO_6504 - BLOCK
      ?AUTO_6505 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6501 ) ( ON ?AUTO_6500 ?AUTO_6504 ) ( CLEAR ?AUTO_6500 ) ( HOLDING ?AUTO_6505 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6505 )
      ( MAKE-ON ?AUTO_6500 ?AUTO_6501 )
      ( MAKE-ON-VERIFY ?AUTO_6500 ?AUTO_6501 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6506 - BLOCK
      ?AUTO_6507 - BLOCK
    )
    :vars
    (
      ?AUTO_6510 - BLOCK
      ?AUTO_6511 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6507 ) ( ON ?AUTO_6506 ?AUTO_6510 ) ( ON ?AUTO_6511 ?AUTO_6506 ) ( CLEAR ?AUTO_6511 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6511 ?AUTO_6506 )
      ( MAKE-ON ?AUTO_6506 ?AUTO_6507 )
      ( MAKE-ON-VERIFY ?AUTO_6506 ?AUTO_6507 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6514 - BLOCK
      ?AUTO_6515 - BLOCK
    )
    :vars
    (
      ?AUTO_6516 - BLOCK
      ?AUTO_6519 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6514 ?AUTO_6516 ) ( ON ?AUTO_6519 ?AUTO_6514 ) ( CLEAR ?AUTO_6519 ) ( HOLDING ?AUTO_6515 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6515 )
      ( MAKE-ON ?AUTO_6514 ?AUTO_6515 )
      ( MAKE-ON-VERIFY ?AUTO_6514 ?AUTO_6515 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6524 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6524 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6524 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6524 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6526 - BLOCK
    )
    :vars
    (
      ?AUTO_6529 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6526 ?AUTO_6529 ) ( CLEAR ?AUTO_6526 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6526 ?AUTO_6529 )
      ( MAKE-ON-TABLE ?AUTO_6526 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6526 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6530 - BLOCK
    )
    :vars
    (
      ?AUTO_6532 - BLOCK
      ?AUTO_6533 - BLOCK
      ?AUTO_6534 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6530 ?AUTO_6532 ) ( CLEAR ?AUTO_6530 ) ( HOLDING ?AUTO_6533 ) ( CLEAR ?AUTO_6534 ) )
    :subtasks
    ( ( !STACK ?AUTO_6533 ?AUTO_6534 )
      ( MAKE-ON-TABLE ?AUTO_6530 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6530 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6535 - BLOCK
    )
    :vars
    (
      ?AUTO_6537 - BLOCK
      ?AUTO_6539 - BLOCK
      ?AUTO_6538 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6535 ?AUTO_6537 ) ( CLEAR ?AUTO_6539 ) ( ON ?AUTO_6538 ?AUTO_6535 ) ( CLEAR ?AUTO_6538 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6538 ?AUTO_6535 )
      ( MAKE-ON-TABLE ?AUTO_6535 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6535 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6542 - BLOCK
    )
    :vars
    (
      ?AUTO_6545 - BLOCK
      ?AUTO_6543 - BLOCK
      ?AUTO_6546 - BLOCK
      ?AUTO_6547 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6542 ?AUTO_6545 ) ( CLEAR ?AUTO_6543 ) ( ON ?AUTO_6546 ?AUTO_6542 ) ( CLEAR ?AUTO_6546 ) ( HOLDING ?AUTO_6547 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6547 )
      ( MAKE-ON-TABLE ?AUTO_6542 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6542 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6548 - BLOCK
    )
    :vars
    (
      ?AUTO_6553 - BLOCK
      ?AUTO_6550 - BLOCK
      ?AUTO_6549 - BLOCK
      ?AUTO_6552 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6548 ?AUTO_6553 ) ( CLEAR ?AUTO_6550 ) ( ON ?AUTO_6549 ?AUTO_6548 ) ( ON ?AUTO_6552 ?AUTO_6549 ) ( CLEAR ?AUTO_6552 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6552 ?AUTO_6549 )
      ( MAKE-ON-TABLE ?AUTO_6548 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6548 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6556 - BLOCK
    )
    :vars
    (
      ?AUTO_6561 - BLOCK
      ?AUTO_6557 - BLOCK
      ?AUTO_6558 - BLOCK
      ?AUTO_6559 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6556 ?AUTO_6561 ) ( ON ?AUTO_6557 ?AUTO_6556 ) ( ON ?AUTO_6558 ?AUTO_6557 ) ( CLEAR ?AUTO_6558 ) ( HOLDING ?AUTO_6559 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6559 )
      ( MAKE-ON-TABLE ?AUTO_6556 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6556 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6566 - BLOCK
      ?AUTO_6567 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6566 ) ( CLEAR ?AUTO_6567 ) )
    :subtasks
    ( ( !STACK ?AUTO_6566 ?AUTO_6567 )
      ( MAKE-ON-VERIFY ?AUTO_6566 ?AUTO_6567 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6570 - BLOCK
      ?AUTO_6571 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6571 ) ( ON-TABLE ?AUTO_6570 ) ( CLEAR ?AUTO_6570 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_6570 )
      ( MAKE-ON ?AUTO_6570 ?AUTO_6571 )
      ( MAKE-ON-VERIFY ?AUTO_6570 ?AUTO_6571 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6575 - BLOCK
      ?AUTO_6576 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_6575 ) ( CLEAR ?AUTO_6575 ) ( HOLDING ?AUTO_6576 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6576 )
      ( MAKE-ON ?AUTO_6575 ?AUTO_6576 )
      ( MAKE-ON-VERIFY ?AUTO_6575 ?AUTO_6576 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6580 - BLOCK
      ?AUTO_6581 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_6580 ) ( ON ?AUTO_6581 ?AUTO_6580 ) ( CLEAR ?AUTO_6581 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6581 ?AUTO_6580 )
      ( MAKE-ON ?AUTO_6580 ?AUTO_6581 )
      ( MAKE-ON-VERIFY ?AUTO_6580 ?AUTO_6581 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6586 - BLOCK
      ?AUTO_6587 - BLOCK
    )
    :vars
    (
      ?AUTO_6590 - BLOCK
      ?AUTO_6591 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_6586 ) ( ON ?AUTO_6587 ?AUTO_6586 ) ( CLEAR ?AUTO_6587 ) ( HOLDING ?AUTO_6590 ) ( CLEAR ?AUTO_6591 ) )
    :subtasks
    ( ( !STACK ?AUTO_6590 ?AUTO_6591 )
      ( MAKE-ON ?AUTO_6586 ?AUTO_6587 )
      ( MAKE-ON-VERIFY ?AUTO_6586 ?AUTO_6587 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6592 - BLOCK
      ?AUTO_6593 - BLOCK
    )
    :vars
    (
      ?AUTO_6597 - BLOCK
      ?AUTO_6596 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_6592 ) ( ON ?AUTO_6593 ?AUTO_6592 ) ( CLEAR ?AUTO_6597 ) ( ON ?AUTO_6596 ?AUTO_6593 ) ( CLEAR ?AUTO_6596 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6596 ?AUTO_6593 )
      ( MAKE-ON ?AUTO_6592 ?AUTO_6593 )
      ( MAKE-ON-VERIFY ?AUTO_6592 ?AUTO_6593 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6600 - BLOCK
      ?AUTO_6601 - BLOCK
    )
    :vars
    (
      ?AUTO_6602 - BLOCK
      ?AUTO_6605 - BLOCK
      ?AUTO_6606 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_6600 ) ( ON ?AUTO_6601 ?AUTO_6600 ) ( CLEAR ?AUTO_6602 ) ( ON ?AUTO_6605 ?AUTO_6601 ) ( CLEAR ?AUTO_6605 ) ( HOLDING ?AUTO_6606 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6606 )
      ( MAKE-ON ?AUTO_6600 ?AUTO_6601 )
      ( MAKE-ON-VERIFY ?AUTO_6600 ?AUTO_6601 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6607 - BLOCK
      ?AUTO_6608 - BLOCK
    )
    :vars
    (
      ?AUTO_6611 - BLOCK
      ?AUTO_6610 - BLOCK
      ?AUTO_6613 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_6607 ) ( ON ?AUTO_6608 ?AUTO_6607 ) ( CLEAR ?AUTO_6611 ) ( ON ?AUTO_6610 ?AUTO_6608 ) ( ON ?AUTO_6613 ?AUTO_6610 ) ( CLEAR ?AUTO_6613 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6613 ?AUTO_6610 )
      ( MAKE-ON ?AUTO_6607 ?AUTO_6608 )
      ( MAKE-ON-VERIFY ?AUTO_6607 ?AUTO_6608 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6616 - BLOCK
      ?AUTO_6617 - BLOCK
    )
    :vars
    (
      ?AUTO_6620 - BLOCK
      ?AUTO_6619 - BLOCK
      ?AUTO_6622 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_6616 ) ( ON ?AUTO_6617 ?AUTO_6616 ) ( ON ?AUTO_6620 ?AUTO_6617 ) ( ON ?AUTO_6619 ?AUTO_6620 ) ( CLEAR ?AUTO_6619 ) ( HOLDING ?AUTO_6622 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6622 )
      ( MAKE-ON ?AUTO_6616 ?AUTO_6617 )
      ( MAKE-ON-VERIFY ?AUTO_6616 ?AUTO_6617 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6628 - BLOCK
      ?AUTO_6629 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6628 ) ( CLEAR ?AUTO_6629 ) )
    :subtasks
    ( ( !STACK ?AUTO_6628 ?AUTO_6629 )
      ( MAKE-ON-VERIFY ?AUTO_6628 ?AUTO_6629 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6632 - BLOCK
      ?AUTO_6633 - BLOCK
    )
    :vars
    (
      ?AUTO_6637 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6633 ) ( ON ?AUTO_6632 ?AUTO_6637 ) ( CLEAR ?AUTO_6632 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6632 ?AUTO_6637 )
      ( MAKE-ON ?AUTO_6632 ?AUTO_6633 )
      ( MAKE-ON-VERIFY ?AUTO_6632 ?AUTO_6633 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6638 - BLOCK
      ?AUTO_6639 - BLOCK
    )
    :vars
    (
      ?AUTO_6642 - BLOCK
      ?AUTO_6644 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6638 ?AUTO_6642 ) ( CLEAR ?AUTO_6638 ) ( HOLDING ?AUTO_6639 ) ( CLEAR ?AUTO_6644 ) )
    :subtasks
    ( ( !STACK ?AUTO_6639 ?AUTO_6644 )
      ( MAKE-ON ?AUTO_6638 ?AUTO_6639 )
      ( MAKE-ON-VERIFY ?AUTO_6638 ?AUTO_6639 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6647 - BLOCK
      ?AUTO_6648 - BLOCK
    )
    :vars
    (
      ?AUTO_6651 - BLOCK
      ?AUTO_6652 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6648 ) ( ON ?AUTO_6647 ?AUTO_6651 ) ( CLEAR ?AUTO_6647 ) ( HOLDING ?AUTO_6652 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6652 )
      ( MAKE-ON ?AUTO_6647 ?AUTO_6648 )
      ( MAKE-ON-VERIFY ?AUTO_6647 ?AUTO_6648 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6653 - BLOCK
      ?AUTO_6654 - BLOCK
    )
    :vars
    (
      ?AUTO_6657 - BLOCK
      ?AUTO_6658 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6653 ?AUTO_6657 ) ( CLEAR ?AUTO_6653 ) ( ON ?AUTO_6658 ?AUTO_6654 ) ( CLEAR ?AUTO_6658 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6658 ?AUTO_6654 )
      ( MAKE-ON ?AUTO_6653 ?AUTO_6654 )
      ( MAKE-ON-VERIFY ?AUTO_6653 ?AUTO_6654 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6661 - BLOCK
      ?AUTO_6662 - BLOCK
    )
    :vars
    (
      ?AUTO_6663 - BLOCK
      ?AUTO_6666 - BLOCK
      ?AUTO_6667 - BLOCK
      ?AUTO_6668 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6661 ?AUTO_6663 ) ( CLEAR ?AUTO_6661 ) ( ON ?AUTO_6666 ?AUTO_6662 ) ( CLEAR ?AUTO_6666 ) ( HOLDING ?AUTO_6667 ) ( CLEAR ?AUTO_6668 ) )
    :subtasks
    ( ( !STACK ?AUTO_6667 ?AUTO_6668 )
      ( MAKE-ON ?AUTO_6661 ?AUTO_6662 )
      ( MAKE-ON-VERIFY ?AUTO_6661 ?AUTO_6662 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6669 - BLOCK
      ?AUTO_6670 - BLOCK
    )
    :vars
    (
      ?AUTO_6671 - BLOCK
      ?AUTO_6672 - BLOCK
      ?AUTO_6676 - BLOCK
      ?AUTO_6675 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6669 ?AUTO_6671 ) ( CLEAR ?AUTO_6669 ) ( ON ?AUTO_6672 ?AUTO_6670 ) ( CLEAR ?AUTO_6676 ) ( ON ?AUTO_6675 ?AUTO_6672 ) ( CLEAR ?AUTO_6675 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6675 ?AUTO_6672 )
      ( MAKE-ON ?AUTO_6669 ?AUTO_6670 )
      ( MAKE-ON-VERIFY ?AUTO_6669 ?AUTO_6670 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6679 - BLOCK
      ?AUTO_6680 - BLOCK
    )
    :vars
    (
      ?AUTO_6683 - BLOCK
      ?AUTO_6681 - BLOCK
      ?AUTO_6682 - BLOCK
      ?AUTO_6686 - BLOCK
      ?AUTO_6687 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6679 ?AUTO_6683 ) ( CLEAR ?AUTO_6679 ) ( ON ?AUTO_6681 ?AUTO_6680 ) ( CLEAR ?AUTO_6682 ) ( ON ?AUTO_6686 ?AUTO_6681 ) ( CLEAR ?AUTO_6686 ) ( HOLDING ?AUTO_6687 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6687 )
      ( MAKE-ON ?AUTO_6679 ?AUTO_6680 )
      ( MAKE-ON-VERIFY ?AUTO_6679 ?AUTO_6680 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6688 - BLOCK
      ?AUTO_6689 - BLOCK
    )
    :vars
    (
      ?AUTO_6696 - BLOCK
      ?AUTO_6691 - BLOCK
      ?AUTO_6692 - BLOCK
      ?AUTO_6690 - BLOCK
      ?AUTO_6695 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6688 ?AUTO_6696 ) ( CLEAR ?AUTO_6688 ) ( ON ?AUTO_6691 ?AUTO_6689 ) ( CLEAR ?AUTO_6692 ) ( ON ?AUTO_6690 ?AUTO_6691 ) ( ON ?AUTO_6695 ?AUTO_6690 ) ( CLEAR ?AUTO_6695 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6695 ?AUTO_6690 )
      ( MAKE-ON ?AUTO_6688 ?AUTO_6689 )
      ( MAKE-ON-VERIFY ?AUTO_6688 ?AUTO_6689 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6699 - BLOCK
      ?AUTO_6700 - BLOCK
    )
    :vars
    (
      ?AUTO_6702 - BLOCK
      ?AUTO_6703 - BLOCK
      ?AUTO_6706 - BLOCK
      ?AUTO_6704 - BLOCK
      ?AUTO_6707 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6699 ?AUTO_6702 ) ( CLEAR ?AUTO_6699 ) ( ON ?AUTO_6703 ?AUTO_6700 ) ( ON ?AUTO_6706 ?AUTO_6703 ) ( ON ?AUTO_6704 ?AUTO_6706 ) ( CLEAR ?AUTO_6704 ) ( HOLDING ?AUTO_6707 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6707 )
      ( MAKE-ON ?AUTO_6699 ?AUTO_6700 )
      ( MAKE-ON-VERIFY ?AUTO_6699 ?AUTO_6700 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6709 - BLOCK
      ?AUTO_6710 - BLOCK
    )
    :vars
    (
      ?AUTO_6713 - BLOCK
      ?AUTO_6714 - BLOCK
      ?AUTO_6711 - BLOCK
      ?AUTO_6712 - BLOCK
      ?AUTO_6717 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6709 ?AUTO_6713 ) ( ON ?AUTO_6714 ?AUTO_6710 ) ( ON ?AUTO_6711 ?AUTO_6714 ) ( ON ?AUTO_6712 ?AUTO_6711 ) ( CLEAR ?AUTO_6712 ) ( ON ?AUTO_6717 ?AUTO_6709 ) ( CLEAR ?AUTO_6717 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6717 ?AUTO_6709 )
      ( MAKE-ON ?AUTO_6709 ?AUTO_6710 )
      ( MAKE-ON-VERIFY ?AUTO_6709 ?AUTO_6710 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6722 - BLOCK
      ?AUTO_6723 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6722 ) ( CLEAR ?AUTO_6723 ) )
    :subtasks
    ( ( !STACK ?AUTO_6722 ?AUTO_6723 )
      ( MAKE-ON-VERIFY ?AUTO_6722 ?AUTO_6723 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6726 - BLOCK
      ?AUTO_6727 - BLOCK
    )
    :vars
    (
      ?AUTO_6731 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6727 ) ( ON ?AUTO_6726 ?AUTO_6731 ) ( CLEAR ?AUTO_6726 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6726 ?AUTO_6731 )
      ( MAKE-ON ?AUTO_6726 ?AUTO_6727 )
      ( MAKE-ON-VERIFY ?AUTO_6726 ?AUTO_6727 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6732 - BLOCK
      ?AUTO_6733 - BLOCK
    )
    :vars
    (
      ?AUTO_6736 - BLOCK
      ?AUTO_6737 - BLOCK
      ?AUTO_6738 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6733 ) ( ON ?AUTO_6732 ?AUTO_6736 ) ( CLEAR ?AUTO_6732 ) ( HOLDING ?AUTO_6737 ) ( CLEAR ?AUTO_6738 ) )
    :subtasks
    ( ( !STACK ?AUTO_6737 ?AUTO_6738 )
      ( MAKE-ON ?AUTO_6732 ?AUTO_6733 )
      ( MAKE-ON-VERIFY ?AUTO_6732 ?AUTO_6733 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6739 - BLOCK
      ?AUTO_6740 - BLOCK
    )
    :vars
    (
      ?AUTO_6743 - BLOCK
      ?AUTO_6745 - BLOCK
      ?AUTO_6744 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6740 ) ( ON ?AUTO_6739 ?AUTO_6743 ) ( CLEAR ?AUTO_6745 ) ( ON ?AUTO_6744 ?AUTO_6739 ) ( CLEAR ?AUTO_6744 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6744 ?AUTO_6739 )
      ( MAKE-ON ?AUTO_6739 ?AUTO_6740 )
      ( MAKE-ON-VERIFY ?AUTO_6739 ?AUTO_6740 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6748 - BLOCK
      ?AUTO_6749 - BLOCK
    )
    :vars
    (
      ?AUTO_6754 - BLOCK
      ?AUTO_6750 - BLOCK
      ?AUTO_6751 - BLOCK
      ?AUTO_6756 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6749 ) ( ON ?AUTO_6748 ?AUTO_6754 ) ( ON ?AUTO_6750 ?AUTO_6748 ) ( CLEAR ?AUTO_6750 ) ( HOLDING ?AUTO_6751 ) ( CLEAR ?AUTO_6756 ) )
    :subtasks
    ( ( !STACK ?AUTO_6751 ?AUTO_6756 )
      ( MAKE-ON ?AUTO_6748 ?AUTO_6749 )
      ( MAKE-ON-VERIFY ?AUTO_6748 ?AUTO_6749 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6763 - BLOCK
      ?AUTO_6764 - BLOCK
    )
    :vars
    (
      ?AUTO_6769 - BLOCK
      ?AUTO_6765 - BLOCK
      ?AUTO_6767 - BLOCK
      ?AUTO_6771 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6763 ?AUTO_6769 ) ( CLEAR ?AUTO_6765 ) ( ON ?AUTO_6767 ?AUTO_6763 ) ( CLEAR ?AUTO_6767 ) ( HOLDING ?AUTO_6764 ) ( CLEAR ?AUTO_6771 ) )
    :subtasks
    ( ( !STACK ?AUTO_6764 ?AUTO_6771 )
      ( MAKE-ON ?AUTO_6763 ?AUTO_6764 )
      ( MAKE-ON-VERIFY ?AUTO_6763 ?AUTO_6764 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6776 - BLOCK
      ?AUTO_6777 - BLOCK
    )
    :vars
    (
      ?AUTO_6783 - BLOCK
      ?AUTO_6781 - BLOCK
      ?AUTO_6782 - BLOCK
      ?AUTO_6779 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6776 ?AUTO_6783 ) ( ON ?AUTO_6781 ?AUTO_6776 ) ( CLEAR ?AUTO_6781 ) ( CLEAR ?AUTO_6782 ) ( ON ?AUTO_6779 ?AUTO_6777 ) ( CLEAR ?AUTO_6779 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6779 ?AUTO_6777 )
      ( MAKE-ON ?AUTO_6776 ?AUTO_6777 )
      ( MAKE-ON-VERIFY ?AUTO_6776 ?AUTO_6777 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6786 - BLOCK
      ?AUTO_6787 - BLOCK
    )
    :vars
    (
      ?AUTO_6791 - BLOCK
      ?AUTO_6793 - BLOCK
      ?AUTO_6790 - BLOCK
      ?AUTO_6792 - BLOCK
      ?AUTO_6794 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6786 ?AUTO_6791 ) ( ON ?AUTO_6793 ?AUTO_6786 ) ( CLEAR ?AUTO_6793 ) ( CLEAR ?AUTO_6790 ) ( ON ?AUTO_6792 ?AUTO_6787 ) ( CLEAR ?AUTO_6792 ) ( HOLDING ?AUTO_6794 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6794 )
      ( MAKE-ON ?AUTO_6786 ?AUTO_6787 )
      ( MAKE-ON-VERIFY ?AUTO_6786 ?AUTO_6787 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6795 - BLOCK
      ?AUTO_6796 - BLOCK
    )
    :vars
    (
      ?AUTO_6803 - BLOCK
      ?AUTO_6797 - BLOCK
      ?AUTO_6802 - BLOCK
      ?AUTO_6798 - BLOCK
      ?AUTO_6801 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6795 ?AUTO_6803 ) ( ON ?AUTO_6797 ?AUTO_6795 ) ( CLEAR ?AUTO_6802 ) ( ON ?AUTO_6798 ?AUTO_6796 ) ( CLEAR ?AUTO_6798 ) ( ON ?AUTO_6801 ?AUTO_6797 ) ( CLEAR ?AUTO_6801 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6801 ?AUTO_6797 )
      ( MAKE-ON ?AUTO_6795 ?AUTO_6796 )
      ( MAKE-ON-VERIFY ?AUTO_6795 ?AUTO_6796 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6807 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6807 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6807 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6807 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6809 - BLOCK
    )
    :vars
    (
      ?AUTO_6812 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6809 ?AUTO_6812 ) ( CLEAR ?AUTO_6809 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6809 ?AUTO_6812 )
      ( MAKE-ON-TABLE ?AUTO_6809 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6809 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6813 - BLOCK
    )
    :vars
    (
      ?AUTO_6814 - BLOCK
      ?AUTO_6816 - BLOCK
      ?AUTO_6817 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6813 ?AUTO_6814 ) ( CLEAR ?AUTO_6813 ) ( HOLDING ?AUTO_6816 ) ( CLEAR ?AUTO_6817 ) )
    :subtasks
    ( ( !STACK ?AUTO_6816 ?AUTO_6817 )
      ( MAKE-ON-TABLE ?AUTO_6813 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6813 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6818 - BLOCK
    )
    :vars
    (
      ?AUTO_6819 - BLOCK
      ?AUTO_6821 - BLOCK
      ?AUTO_6820 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6818 ?AUTO_6819 ) ( CLEAR ?AUTO_6821 ) ( ON ?AUTO_6820 ?AUTO_6818 ) ( CLEAR ?AUTO_6820 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6820 ?AUTO_6818 )
      ( MAKE-ON-TABLE ?AUTO_6818 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6818 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6825 - BLOCK
    )
    :vars
    (
      ?AUTO_6826 - BLOCK
      ?AUTO_6829 - BLOCK
      ?AUTO_6828 - BLOCK
      ?AUTO_6830 - BLOCK
      ?AUTO_6831 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6825 ?AUTO_6826 ) ( CLEAR ?AUTO_6829 ) ( ON ?AUTO_6828 ?AUTO_6825 ) ( CLEAR ?AUTO_6828 ) ( HOLDING ?AUTO_6830 ) ( CLEAR ?AUTO_6831 ) )
    :subtasks
    ( ( !STACK ?AUTO_6830 ?AUTO_6831 )
      ( MAKE-ON-TABLE ?AUTO_6825 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6825 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6832 - BLOCK
    )
    :vars
    (
      ?AUTO_6834 - BLOCK
      ?AUTO_6835 - BLOCK
      ?AUTO_6833 - BLOCK
      ?AUTO_6838 - BLOCK
      ?AUTO_6837 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6832 ?AUTO_6834 ) ( CLEAR ?AUTO_6835 ) ( ON ?AUTO_6833 ?AUTO_6832 ) ( CLEAR ?AUTO_6838 ) ( ON ?AUTO_6837 ?AUTO_6833 ) ( CLEAR ?AUTO_6837 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6837 ?AUTO_6833 )
      ( MAKE-ON-TABLE ?AUTO_6832 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6832 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6841 - BLOCK
    )
    :vars
    (
      ?AUTO_6846 - BLOCK
      ?AUTO_6847 - BLOCK
      ?AUTO_6843 - BLOCK
      ?AUTO_6844 - BLOCK
      ?AUTO_6842 - BLOCK
      ?AUTO_6849 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6841 ?AUTO_6846 ) ( CLEAR ?AUTO_6847 ) ( ON ?AUTO_6843 ?AUTO_6841 ) ( ON ?AUTO_6844 ?AUTO_6843 ) ( CLEAR ?AUTO_6844 ) ( HOLDING ?AUTO_6842 ) ( CLEAR ?AUTO_6849 ) )
    :subtasks
    ( ( !STACK ?AUTO_6842 ?AUTO_6849 )
      ( MAKE-ON-TABLE ?AUTO_6841 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6841 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_6858 - BLOCK
    )
    :vars
    (
      ?AUTO_6860 - BLOCK
      ?AUTO_6861 - BLOCK
      ?AUTO_6862 - BLOCK
      ?AUTO_6859 - BLOCK
      ?AUTO_6863 - BLOCK
      ?AUTO_6864 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6858 ?AUTO_6860 ) ( CLEAR ?AUTO_6861 ) ( ON ?AUTO_6862 ?AUTO_6858 ) ( ON ?AUTO_6859 ?AUTO_6862 ) ( CLEAR ?AUTO_6863 ) ( ON ?AUTO_6864 ?AUTO_6859 ) ( CLEAR ?AUTO_6864 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6864 ?AUTO_6859 )
      ( MAKE-ON-TABLE ?AUTO_6858 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_6858 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6870 - BLOCK
      ?AUTO_6871 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6870 ) ( CLEAR ?AUTO_6871 ) )
    :subtasks
    ( ( !STACK ?AUTO_6870 ?AUTO_6871 )
      ( MAKE-ON-VERIFY ?AUTO_6870 ?AUTO_6871 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6874 - BLOCK
      ?AUTO_6875 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6875 ) ( ON-TABLE ?AUTO_6874 ) ( CLEAR ?AUTO_6874 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_6874 )
      ( MAKE-ON ?AUTO_6874 ?AUTO_6875 )
      ( MAKE-ON-VERIFY ?AUTO_6874 ?AUTO_6875 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6879 - BLOCK
      ?AUTO_6880 - BLOCK
    )
    :vars
    (
      ?AUTO_6883 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6880 ) ( ON-TABLE ?AUTO_6879 ) ( CLEAR ?AUTO_6879 ) ( HOLDING ?AUTO_6883 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6883 )
      ( MAKE-ON ?AUTO_6879 ?AUTO_6880 )
      ( MAKE-ON-VERIFY ?AUTO_6879 ?AUTO_6880 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6884 - BLOCK
      ?AUTO_6885 - BLOCK
    )
    :vars
    (
      ?AUTO_6888 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_6884 ) ( CLEAR ?AUTO_6884 ) ( ON ?AUTO_6888 ?AUTO_6885 ) ( CLEAR ?AUTO_6888 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6888 ?AUTO_6885 )
      ( MAKE-ON ?AUTO_6884 ?AUTO_6885 )
      ( MAKE-ON-VERIFY ?AUTO_6884 ?AUTO_6885 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6891 - BLOCK
      ?AUTO_6892 - BLOCK
    )
    :vars
    (
      ?AUTO_6895 - BLOCK
      ?AUTO_6896 - BLOCK
      ?AUTO_6897 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_6891 ) ( CLEAR ?AUTO_6891 ) ( ON ?AUTO_6895 ?AUTO_6892 ) ( CLEAR ?AUTO_6895 ) ( HOLDING ?AUTO_6896 ) ( CLEAR ?AUTO_6897 ) )
    :subtasks
    ( ( !STACK ?AUTO_6896 ?AUTO_6897 )
      ( MAKE-ON ?AUTO_6891 ?AUTO_6892 )
      ( MAKE-ON-VERIFY ?AUTO_6891 ?AUTO_6892 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6898 - BLOCK
      ?AUTO_6899 - BLOCK
    )
    :vars
    (
      ?AUTO_6900 - BLOCK
      ?AUTO_6904 - BLOCK
      ?AUTO_6903 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_6898 ) ( CLEAR ?AUTO_6898 ) ( ON ?AUTO_6900 ?AUTO_6899 ) ( CLEAR ?AUTO_6904 ) ( ON ?AUTO_6903 ?AUTO_6900 ) ( CLEAR ?AUTO_6903 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6903 ?AUTO_6900 )
      ( MAKE-ON ?AUTO_6898 ?AUTO_6899 )
      ( MAKE-ON-VERIFY ?AUTO_6898 ?AUTO_6899 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6907 - BLOCK
      ?AUTO_6908 - BLOCK
    )
    :vars
    (
      ?AUTO_6910 - BLOCK
      ?AUTO_6913 - BLOCK
      ?AUTO_6909 - BLOCK
      ?AUTO_6914 - BLOCK
      ?AUTO_6915 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_6907 ) ( CLEAR ?AUTO_6907 ) ( ON ?AUTO_6910 ?AUTO_6908 ) ( CLEAR ?AUTO_6913 ) ( ON ?AUTO_6909 ?AUTO_6910 ) ( CLEAR ?AUTO_6909 ) ( HOLDING ?AUTO_6914 ) ( CLEAR ?AUTO_6915 ) )
    :subtasks
    ( ( !STACK ?AUTO_6914 ?AUTO_6915 )
      ( MAKE-ON ?AUTO_6907 ?AUTO_6908 )
      ( MAKE-ON-VERIFY ?AUTO_6907 ?AUTO_6908 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6916 - BLOCK
      ?AUTO_6917 - BLOCK
    )
    :vars
    (
      ?AUTO_6918 - BLOCK
      ?AUTO_6924 - BLOCK
      ?AUTO_6919 - BLOCK
      ?AUTO_6921 - BLOCK
      ?AUTO_6920 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_6916 ) ( CLEAR ?AUTO_6916 ) ( ON ?AUTO_6918 ?AUTO_6917 ) ( CLEAR ?AUTO_6924 ) ( ON ?AUTO_6919 ?AUTO_6918 ) ( CLEAR ?AUTO_6921 ) ( ON ?AUTO_6920 ?AUTO_6919 ) ( CLEAR ?AUTO_6920 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6920 ?AUTO_6919 )
      ( MAKE-ON ?AUTO_6916 ?AUTO_6917 )
      ( MAKE-ON-VERIFY ?AUTO_6916 ?AUTO_6917 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6927 - BLOCK
      ?AUTO_6928 - BLOCK
    )
    :vars
    (
      ?AUTO_6934 - BLOCK
      ?AUTO_6931 - BLOCK
      ?AUTO_6933 - BLOCK
      ?AUTO_6935 - BLOCK
      ?AUTO_6932 - BLOCK
      ?AUTO_6937 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_6927 ) ( CLEAR ?AUTO_6927 ) ( ON ?AUTO_6934 ?AUTO_6928 ) ( CLEAR ?AUTO_6931 ) ( ON ?AUTO_6933 ?AUTO_6934 ) ( ON ?AUTO_6935 ?AUTO_6933 ) ( CLEAR ?AUTO_6935 ) ( HOLDING ?AUTO_6932 ) ( CLEAR ?AUTO_6937 ) )
    :subtasks
    ( ( !STACK ?AUTO_6932 ?AUTO_6937 )
      ( MAKE-ON ?AUTO_6927 ?AUTO_6928 )
      ( MAKE-ON-VERIFY ?AUTO_6927 ?AUTO_6928 ) )
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
      ?AUTO_6952 - BLOCK
      ?AUTO_6954 - BLOCK
      ?AUTO_6950 - BLOCK
      ?AUTO_6956 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6951 ?AUTO_6949 ) ( CLEAR ?AUTO_6952 ) ( ON ?AUTO_6954 ?AUTO_6951 ) ( CLEAR ?AUTO_6950 ) ( ON ?AUTO_6956 ?AUTO_6954 ) ( CLEAR ?AUTO_6956 ) ( HOLDING ?AUTO_6948 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6948 )
      ( MAKE-ON ?AUTO_6948 ?AUTO_6949 )
      ( MAKE-ON-VERIFY ?AUTO_6948 ?AUTO_6949 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6962 - BLOCK
      ?AUTO_6963 - BLOCK
    )
    :vars
    (
      ?AUTO_6969 - BLOCK
      ?AUTO_6968 - BLOCK
      ?AUTO_6964 - BLOCK
      ?AUTO_6967 - BLOCK
      ?AUTO_6970 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6962 ?AUTO_6969 ) ( CLEAR ?AUTO_6962 ) ( ON ?AUTO_6968 ?AUTO_6963 ) ( ON ?AUTO_6964 ?AUTO_6968 ) ( ON ?AUTO_6967 ?AUTO_6964 ) ( ON ?AUTO_6970 ?AUTO_6967 ) ( CLEAR ?AUTO_6970 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6970 ?AUTO_6967 )
      ( MAKE-ON ?AUTO_6962 ?AUTO_6963 )
      ( MAKE-ON-VERIFY ?AUTO_6962 ?AUTO_6963 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6975 - BLOCK
      ?AUTO_6976 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_6975 ) ( CLEAR ?AUTO_6976 ) )
    :subtasks
    ( ( !STACK ?AUTO_6975 ?AUTO_6976 )
      ( MAKE-ON-VERIFY ?AUTO_6975 ?AUTO_6976 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6979 - BLOCK
      ?AUTO_6980 - BLOCK
    )
    :vars
    (
      ?AUTO_6984 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6980 ) ( ON ?AUTO_6979 ?AUTO_6984 ) ( CLEAR ?AUTO_6979 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_6979 ?AUTO_6984 )
      ( MAKE-ON ?AUTO_6979 ?AUTO_6980 )
      ( MAKE-ON-VERIFY ?AUTO_6979 ?AUTO_6980 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6985 - BLOCK
      ?AUTO_6986 - BLOCK
    )
    :vars
    (
      ?AUTO_6989 - BLOCK
      ?AUTO_6990 - BLOCK
      ?AUTO_6991 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_6986 ) ( ON ?AUTO_6985 ?AUTO_6989 ) ( CLEAR ?AUTO_6985 ) ( HOLDING ?AUTO_6990 ) ( CLEAR ?AUTO_6991 ) )
    :subtasks
    ( ( !STACK ?AUTO_6990 ?AUTO_6991 )
      ( MAKE-ON ?AUTO_6985 ?AUTO_6986 )
      ( MAKE-ON-VERIFY ?AUTO_6985 ?AUTO_6986 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_6994 - BLOCK
      ?AUTO_6995 - BLOCK
    )
    :vars
    (
      ?AUTO_6998 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_6994 ?AUTO_6998 ) ( CLEAR ?AUTO_6994 ) ( HOLDING ?AUTO_6995 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_6995 )
      ( MAKE-ON ?AUTO_6994 ?AUTO_6995 )
      ( MAKE-ON-VERIFY ?AUTO_6994 ?AUTO_6995 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7004 - BLOCK
      ?AUTO_7005 - BLOCK
    )
    :vars
    (
      ?AUTO_7006 - BLOCK
      ?AUTO_7009 - BLOCK
      ?AUTO_7010 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7004 ?AUTO_7006 ) ( CLEAR ?AUTO_7004 ) ( CLEAR ?AUTO_7009 ) ( ON ?AUTO_7010 ?AUTO_7005 ) ( CLEAR ?AUTO_7010 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7010 ?AUTO_7005 )
      ( MAKE-ON ?AUTO_7004 ?AUTO_7005 )
      ( MAKE-ON-VERIFY ?AUTO_7004 ?AUTO_7005 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7013 - BLOCK
      ?AUTO_7014 - BLOCK
    )
    :vars
    (
      ?AUTO_7019 - BLOCK
      ?AUTO_7018 - BLOCK
      ?AUTO_7017 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7019 ) ( ON ?AUTO_7018 ?AUTO_7014 ) ( CLEAR ?AUTO_7018 ) ( HOLDING ?AUTO_7013 ) ( CLEAR ?AUTO_7017 ) )
    :subtasks
    ( ( !STACK ?AUTO_7013 ?AUTO_7017 )
      ( MAKE-ON ?AUTO_7013 ?AUTO_7014 )
      ( MAKE-ON-VERIFY ?AUTO_7013 ?AUTO_7014 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7022 - BLOCK
      ?AUTO_7023 - BLOCK
    )
    :vars
    (
      ?AUTO_7024 - BLOCK
      ?AUTO_7028 - BLOCK
      ?AUTO_7027 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7024 ) ( ON ?AUTO_7028 ?AUTO_7023 ) ( CLEAR ?AUTO_7027 ) ( ON ?AUTO_7022 ?AUTO_7028 ) ( CLEAR ?AUTO_7022 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7022 ?AUTO_7028 )
      ( MAKE-ON ?AUTO_7022 ?AUTO_7023 )
      ( MAKE-ON-VERIFY ?AUTO_7022 ?AUTO_7023 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7031 - BLOCK
      ?AUTO_7032 - BLOCK
    )
    :vars
    (
      ?AUTO_7035 - BLOCK
      ?AUTO_7037 - BLOCK
      ?AUTO_7036 - BLOCK
      ?AUTO_7039 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7035 ) ( ON ?AUTO_7037 ?AUTO_7032 ) ( ON ?AUTO_7031 ?AUTO_7037 ) ( CLEAR ?AUTO_7031 ) ( HOLDING ?AUTO_7036 ) ( CLEAR ?AUTO_7039 ) )
    :subtasks
    ( ( !STACK ?AUTO_7036 ?AUTO_7039 )
      ( MAKE-ON ?AUTO_7031 ?AUTO_7032 )
      ( MAKE-ON-VERIFY ?AUTO_7031 ?AUTO_7032 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7060 - BLOCK
      ?AUTO_7061 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_7060 ) ( CLEAR ?AUTO_7061 ) )
    :subtasks
    ( ( !STACK ?AUTO_7060 ?AUTO_7061 )
      ( MAKE-ON-VERIFY ?AUTO_7060 ?AUTO_7061 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7064 - BLOCK
      ?AUTO_7065 - BLOCK
    )
    :vars
    (
      ?AUTO_7069 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7065 ) ( ON ?AUTO_7064 ?AUTO_7069 ) ( CLEAR ?AUTO_7064 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7064 ?AUTO_7069 )
      ( MAKE-ON ?AUTO_7064 ?AUTO_7065 )
      ( MAKE-ON-VERIFY ?AUTO_7064 ?AUTO_7065 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7070 - BLOCK
      ?AUTO_7071 - BLOCK
    )
    :vars
    (
      ?AUTO_7074 - BLOCK
      ?AUTO_7075 - BLOCK
      ?AUTO_7076 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7071 ) ( ON ?AUTO_7070 ?AUTO_7074 ) ( CLEAR ?AUTO_7070 ) ( HOLDING ?AUTO_7075 ) ( CLEAR ?AUTO_7076 ) )
    :subtasks
    ( ( !STACK ?AUTO_7075 ?AUTO_7076 )
      ( MAKE-ON ?AUTO_7070 ?AUTO_7071 )
      ( MAKE-ON-VERIFY ?AUTO_7070 ?AUTO_7071 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7077 - BLOCK
      ?AUTO_7078 - BLOCK
    )
    :vars
    (
      ?AUTO_7081 - BLOCK
      ?AUTO_7083 - BLOCK
      ?AUTO_7082 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7078 ) ( ON ?AUTO_7077 ?AUTO_7081 ) ( CLEAR ?AUTO_7083 ) ( ON ?AUTO_7082 ?AUTO_7077 ) ( CLEAR ?AUTO_7082 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7082 ?AUTO_7077 )
      ( MAKE-ON ?AUTO_7077 ?AUTO_7078 )
      ( MAKE-ON-VERIFY ?AUTO_7077 ?AUTO_7078 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7086 - BLOCK
      ?AUTO_7087 - BLOCK
    )
    :vars
    (
      ?AUTO_7092 - BLOCK
      ?AUTO_7089 - BLOCK
      ?AUTO_7088 - BLOCK
      ?AUTO_7094 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7086 ?AUTO_7092 ) ( CLEAR ?AUTO_7089 ) ( ON ?AUTO_7088 ?AUTO_7086 ) ( CLEAR ?AUTO_7088 ) ( HOLDING ?AUTO_7087 ) ( CLEAR ?AUTO_7094 ) )
    :subtasks
    ( ( !STACK ?AUTO_7087 ?AUTO_7094 )
      ( MAKE-ON ?AUTO_7086 ?AUTO_7087 )
      ( MAKE-ON-VERIFY ?AUTO_7086 ?AUTO_7087 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7097 - BLOCK
      ?AUTO_7098 - BLOCK
    )
    :vars
    (
      ?AUTO_7103 - BLOCK
      ?AUTO_7099 - BLOCK
      ?AUTO_7102 - BLOCK
      ?AUTO_7104 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7098 ) ( ON ?AUTO_7097 ?AUTO_7103 ) ( CLEAR ?AUTO_7099 ) ( ON ?AUTO_7102 ?AUTO_7097 ) ( CLEAR ?AUTO_7102 ) ( HOLDING ?AUTO_7104 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7104 )
      ( MAKE-ON ?AUTO_7097 ?AUTO_7098 )
      ( MAKE-ON-VERIFY ?AUTO_7097 ?AUTO_7098 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7121 - BLOCK
      ?AUTO_7122 - BLOCK
    )
    :vars
    (
      ?AUTO_7124 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7122 ) ( ON-TABLE ?AUTO_7121 ) ( ON ?AUTO_7124 ?AUTO_7121 ) ( CLEAR ?AUTO_7124 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7124 ?AUTO_7121 )
      ( MAKE-ON ?AUTO_7121 ?AUTO_7122 )
      ( MAKE-ON-VERIFY ?AUTO_7121 ?AUTO_7122 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7128 - BLOCK
      ?AUTO_7129 - BLOCK
    )
    :vars
    (
      ?AUTO_7132 - BLOCK
      ?AUTO_7133 - BLOCK
      ?AUTO_7134 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7129 ) ( ON-TABLE ?AUTO_7128 ) ( ON ?AUTO_7132 ?AUTO_7128 ) ( CLEAR ?AUTO_7132 ) ( HOLDING ?AUTO_7133 ) ( CLEAR ?AUTO_7134 ) )
    :subtasks
    ( ( !STACK ?AUTO_7133 ?AUTO_7134 )
      ( MAKE-ON ?AUTO_7128 ?AUTO_7129 )
      ( MAKE-ON-VERIFY ?AUTO_7128 ?AUTO_7129 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7135 - BLOCK
      ?AUTO_7136 - BLOCK
    )
    :vars
    (
      ?AUTO_7139 - BLOCK
      ?AUTO_7141 - BLOCK
      ?AUTO_7140 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7136 ) ( ON-TABLE ?AUTO_7135 ) ( ON ?AUTO_7139 ?AUTO_7135 ) ( CLEAR ?AUTO_7141 ) ( ON ?AUTO_7140 ?AUTO_7139 ) ( CLEAR ?AUTO_7140 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7140 ?AUTO_7139 )
      ( MAKE-ON ?AUTO_7135 ?AUTO_7136 )
      ( MAKE-ON-VERIFY ?AUTO_7135 ?AUTO_7136 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7144 - BLOCK
      ?AUTO_7145 - BLOCK
    )
    :vars
    (
      ?AUTO_7150 - BLOCK
      ?AUTO_7147 - BLOCK
      ?AUTO_7146 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_7144 ) ( ON ?AUTO_7150 ?AUTO_7144 ) ( CLEAR ?AUTO_7147 ) ( ON ?AUTO_7146 ?AUTO_7150 ) ( CLEAR ?AUTO_7146 ) ( HOLDING ?AUTO_7145 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7145 )
      ( MAKE-ON ?AUTO_7144 ?AUTO_7145 )
      ( MAKE-ON-VERIFY ?AUTO_7144 ?AUTO_7145 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7152 - BLOCK
      ?AUTO_7153 - BLOCK
    )
    :vars
    (
      ?AUTO_7154 - BLOCK
      ?AUTO_7155 - BLOCK
      ?AUTO_7157 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_7152 ) ( ON ?AUTO_7154 ?AUTO_7152 ) ( CLEAR ?AUTO_7155 ) ( ON ?AUTO_7157 ?AUTO_7154 ) ( ON ?AUTO_7153 ?AUTO_7157 ) ( CLEAR ?AUTO_7153 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7153 ?AUTO_7157 )
      ( MAKE-ON ?AUTO_7152 ?AUTO_7153 )
      ( MAKE-ON-VERIFY ?AUTO_7152 ?AUTO_7153 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7161 - BLOCK
      ?AUTO_7162 - BLOCK
    )
    :vars
    (
      ?AUTO_7163 - BLOCK
      ?AUTO_7167 - BLOCK
      ?AUTO_7165 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_7161 ) ( ON ?AUTO_7163 ?AUTO_7161 ) ( ON ?AUTO_7167 ?AUTO_7163 ) ( ON ?AUTO_7162 ?AUTO_7167 ) ( CLEAR ?AUTO_7162 ) ( HOLDING ?AUTO_7165 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7165 )
      ( MAKE-ON ?AUTO_7161 ?AUTO_7162 )
      ( MAKE-ON-VERIFY ?AUTO_7161 ?AUTO_7162 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7173 - BLOCK
      ?AUTO_7174 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_7173 ) ( CLEAR ?AUTO_7174 ) )
    :subtasks
    ( ( !STACK ?AUTO_7173 ?AUTO_7174 )
      ( MAKE-ON-VERIFY ?AUTO_7173 ?AUTO_7174 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7177 - BLOCK
      ?AUTO_7178 - BLOCK
    )
    :vars
    (
      ?AUTO_7182 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7178 ) ( ON ?AUTO_7177 ?AUTO_7182 ) ( CLEAR ?AUTO_7177 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7177 ?AUTO_7182 )
      ( MAKE-ON ?AUTO_7177 ?AUTO_7178 )
      ( MAKE-ON-VERIFY ?AUTO_7177 ?AUTO_7178 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7183 - BLOCK
      ?AUTO_7184 - BLOCK
    )
    :vars
    (
      ?AUTO_7187 - BLOCK
      ?AUTO_7189 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7183 ?AUTO_7187 ) ( CLEAR ?AUTO_7183 ) ( HOLDING ?AUTO_7184 ) ( CLEAR ?AUTO_7189 ) )
    :subtasks
    ( ( !STACK ?AUTO_7184 ?AUTO_7189 )
      ( MAKE-ON ?AUTO_7183 ?AUTO_7184 )
      ( MAKE-ON-VERIFY ?AUTO_7183 ?AUTO_7184 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7281 - BLOCK
      ?AUTO_7282 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_7281 ) ( CLEAR ?AUTO_7282 ) )
    :subtasks
    ( ( !STACK ?AUTO_7281 ?AUTO_7282 )
      ( MAKE-ON-VERIFY ?AUTO_7281 ?AUTO_7282 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7285 - BLOCK
      ?AUTO_7286 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7286 ) ( ON-TABLE ?AUTO_7285 ) ( CLEAR ?AUTO_7285 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_7285 )
      ( MAKE-ON ?AUTO_7285 ?AUTO_7286 )
      ( MAKE-ON-VERIFY ?AUTO_7285 ?AUTO_7286 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7290 - BLOCK
      ?AUTO_7291 - BLOCK
    )
    :vars
    (
      ?AUTO_7294 - BLOCK
      ?AUTO_7295 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7291 ) ( ON-TABLE ?AUTO_7290 ) ( CLEAR ?AUTO_7290 ) ( HOLDING ?AUTO_7294 ) ( CLEAR ?AUTO_7295 ) )
    :subtasks
    ( ( !STACK ?AUTO_7294 ?AUTO_7295 )
      ( MAKE-ON ?AUTO_7290 ?AUTO_7291 )
      ( MAKE-ON-VERIFY ?AUTO_7290 ?AUTO_7291 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7296 - BLOCK
      ?AUTO_7297 - BLOCK
    )
    :vars
    (
      ?AUTO_7299 - BLOCK
      ?AUTO_7301 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_7296 ) ( CLEAR ?AUTO_7296 ) ( CLEAR ?AUTO_7299 ) ( ON ?AUTO_7301 ?AUTO_7297 ) ( CLEAR ?AUTO_7301 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7301 ?AUTO_7297 )
      ( MAKE-ON ?AUTO_7296 ?AUTO_7297 )
      ( MAKE-ON-VERIFY ?AUTO_7296 ?AUTO_7297 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7304 - BLOCK
      ?AUTO_7305 - BLOCK
    )
    :vars
    (
      ?AUTO_7309 - BLOCK
      ?AUTO_7308 - BLOCK
      ?AUTO_7311 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_7304 ) ( CLEAR ?AUTO_7304 ) ( ON ?AUTO_7309 ?AUTO_7305 ) ( CLEAR ?AUTO_7309 ) ( HOLDING ?AUTO_7308 ) ( CLEAR ?AUTO_7311 ) )
    :subtasks
    ( ( !STACK ?AUTO_7308 ?AUTO_7311 )
      ( MAKE-ON ?AUTO_7304 ?AUTO_7305 )
      ( MAKE-ON-VERIFY ?AUTO_7304 ?AUTO_7305 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7312 - BLOCK
      ?AUTO_7313 - BLOCK
    )
    :vars
    (
      ?AUTO_7316 - BLOCK
      ?AUTO_7318 - BLOCK
      ?AUTO_7317 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_7312 ) ( ON ?AUTO_7316 ?AUTO_7313 ) ( CLEAR ?AUTO_7316 ) ( CLEAR ?AUTO_7318 ) ( ON ?AUTO_7317 ?AUTO_7312 ) ( CLEAR ?AUTO_7317 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7317 ?AUTO_7312 )
      ( MAKE-ON ?AUTO_7312 ?AUTO_7313 )
      ( MAKE-ON-VERIFY ?AUTO_7312 ?AUTO_7313 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7321 - BLOCK
      ?AUTO_7322 - BLOCK
    )
    :vars
    (
      ?AUTO_7324 - BLOCK
      ?AUTO_7323 - BLOCK
      ?AUTO_7325 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_7321 ) ( CLEAR ?AUTO_7324 ) ( ON ?AUTO_7323 ?AUTO_7321 ) ( CLEAR ?AUTO_7323 ) ( HOLDING ?AUTO_7325 ) ( CLEAR ?AUTO_7322 ) )
    :subtasks
    ( ( !STACK ?AUTO_7325 ?AUTO_7322 )
      ( MAKE-ON ?AUTO_7321 ?AUTO_7322 )
      ( MAKE-ON-VERIFY ?AUTO_7321 ?AUTO_7322 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7330 - BLOCK
      ?AUTO_7331 - BLOCK
    )
    :vars
    (
      ?AUTO_7334 - BLOCK
      ?AUTO_7332 - BLOCK
      ?AUTO_7335 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_7330 ) ( CLEAR ?AUTO_7334 ) ( ON ?AUTO_7332 ?AUTO_7330 ) ( CLEAR ?AUTO_7331 ) ( ON ?AUTO_7335 ?AUTO_7332 ) ( CLEAR ?AUTO_7335 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7335 ?AUTO_7332 )
      ( MAKE-ON ?AUTO_7330 ?AUTO_7331 )
      ( MAKE-ON-VERIFY ?AUTO_7330 ?AUTO_7331 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7339 - BLOCK
      ?AUTO_7340 - BLOCK
    )
    :vars
    (
      ?AUTO_7341 - BLOCK
      ?AUTO_7344 - BLOCK
      ?AUTO_7345 - BLOCK
      ?AUTO_7347 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_7339 ) ( ON ?AUTO_7341 ?AUTO_7339 ) ( CLEAR ?AUTO_7340 ) ( ON ?AUTO_7344 ?AUTO_7341 ) ( CLEAR ?AUTO_7344 ) ( HOLDING ?AUTO_7345 ) ( CLEAR ?AUTO_7347 ) )
    :subtasks
    ( ( !STACK ?AUTO_7345 ?AUTO_7347 )
      ( MAKE-ON ?AUTO_7339 ?AUTO_7340 )
      ( MAKE-ON-VERIFY ?AUTO_7339 ?AUTO_7340 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7350 - BLOCK
      ?AUTO_7351 - BLOCK
    )
    :vars
    (
      ?AUTO_7356 - BLOCK
      ?AUTO_7353 - BLOCK
      ?AUTO_7355 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_7350 ) ( CLEAR ?AUTO_7356 ) ( ON ?AUTO_7353 ?AUTO_7350 ) ( ON ?AUTO_7355 ?AUTO_7353 ) ( CLEAR ?AUTO_7355 ) ( HOLDING ?AUTO_7351 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7351 )
      ( MAKE-ON ?AUTO_7350 ?AUTO_7351 )
      ( MAKE-ON-VERIFY ?AUTO_7350 ?AUTO_7351 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7362 - BLOCK
      ?AUTO_7363 - BLOCK
    )
    :vars
    (
      ?AUTO_7368 - BLOCK
      ?AUTO_7367 - BLOCK
      ?AUTO_7364 - BLOCK
      ?AUTO_7369 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_7362 ) ( ON ?AUTO_7368 ?AUTO_7362 ) ( ON ?AUTO_7367 ?AUTO_7368 ) ( CLEAR ?AUTO_7367 ) ( CLEAR ?AUTO_7364 ) ( ON ?AUTO_7369 ?AUTO_7363 ) ( CLEAR ?AUTO_7369 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7369 ?AUTO_7363 )
      ( MAKE-ON ?AUTO_7362 ?AUTO_7363 )
      ( MAKE-ON-VERIFY ?AUTO_7362 ?AUTO_7363 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7372 - BLOCK
      ?AUTO_7373 - BLOCK
    )
    :vars
    (
      ?AUTO_7379 - BLOCK
      ?AUTO_7376 - BLOCK
      ?AUTO_7378 - BLOCK
      ?AUTO_7377 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_7372 ) ( ON ?AUTO_7379 ?AUTO_7372 ) ( CLEAR ?AUTO_7376 ) ( ON ?AUTO_7378 ?AUTO_7373 ) ( CLEAR ?AUTO_7378 ) ( HOLDING ?AUTO_7377 ) ( CLEAR ?AUTO_7379 ) )
    :subtasks
    ( ( !STACK ?AUTO_7377 ?AUTO_7379 )
      ( MAKE-ON ?AUTO_7372 ?AUTO_7373 )
      ( MAKE-ON-VERIFY ?AUTO_7372 ?AUTO_7373 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7382 - BLOCK
      ?AUTO_7383 - BLOCK
    )
    :vars
    (
      ?AUTO_7389 - BLOCK
      ?AUTO_7388 - BLOCK
      ?AUTO_7385 - BLOCK
      ?AUTO_7384 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_7382 ) ( ON ?AUTO_7389 ?AUTO_7382 ) ( CLEAR ?AUTO_7388 ) ( ON ?AUTO_7385 ?AUTO_7383 ) ( CLEAR ?AUTO_7389 ) ( ON ?AUTO_7384 ?AUTO_7385 ) ( CLEAR ?AUTO_7384 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7384 ?AUTO_7385 )
      ( MAKE-ON ?AUTO_7382 ?AUTO_7383 )
      ( MAKE-ON-VERIFY ?AUTO_7382 ?AUTO_7383 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7396 - BLOCK
      ?AUTO_7397 - BLOCK
    )
    :vars
    (
      ?AUTO_7401 - BLOCK
      ?AUTO_7398 - BLOCK
      ?AUTO_7399 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7401 ?AUTO_7397 ) ( CLEAR ?AUTO_7398 ) ( ON ?AUTO_7399 ?AUTO_7401 ) ( CLEAR ?AUTO_7399 ) ( HOLDING ?AUTO_7396 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7396 )
      ( MAKE-ON ?AUTO_7396 ?AUTO_7397 )
      ( MAKE-ON-VERIFY ?AUTO_7396 ?AUTO_7397 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7404 - BLOCK
      ?AUTO_7405 - BLOCK
    )
    :vars
    (
      ?AUTO_7408 - BLOCK
      ?AUTO_7406 - BLOCK
      ?AUTO_7407 - BLOCK
      ?AUTO_7412 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7408 ?AUTO_7405 ) ( CLEAR ?AUTO_7406 ) ( ON ?AUTO_7407 ?AUTO_7408 ) ( CLEAR ?AUTO_7407 ) ( ON ?AUTO_7404 ?AUTO_7412 ) ( CLEAR ?AUTO_7404 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7404 ?AUTO_7412 )
      ( MAKE-ON ?AUTO_7404 ?AUTO_7405 )
      ( MAKE-ON-VERIFY ?AUTO_7404 ?AUTO_7405 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7413 - BLOCK
      ?AUTO_7414 - BLOCK
    )
    :vars
    (
      ?AUTO_7418 - BLOCK
      ?AUTO_7416 - BLOCK
      ?AUTO_7419 - BLOCK
      ?AUTO_7420 - BLOCK
      ?AUTO_7421 - BLOCK
      ?AUTO_7422 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7418 ?AUTO_7414 ) ( CLEAR ?AUTO_7416 ) ( ON ?AUTO_7419 ?AUTO_7418 ) ( CLEAR ?AUTO_7419 ) ( ON ?AUTO_7413 ?AUTO_7420 ) ( CLEAR ?AUTO_7413 ) ( HOLDING ?AUTO_7421 ) ( CLEAR ?AUTO_7422 ) )
    :subtasks
    ( ( !STACK ?AUTO_7421 ?AUTO_7422 )
      ( MAKE-ON ?AUTO_7413 ?AUTO_7414 )
      ( MAKE-ON-VERIFY ?AUTO_7413 ?AUTO_7414 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7423 - BLOCK
      ?AUTO_7424 - BLOCK
    )
    :vars
    (
      ?AUTO_7426 - BLOCK
      ?AUTO_7431 - BLOCK
      ?AUTO_7432 - BLOCK
      ?AUTO_7425 - BLOCK
      ?AUTO_7429 - BLOCK
      ?AUTO_7428 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7426 ?AUTO_7424 ) ( CLEAR ?AUTO_7431 ) ( ON ?AUTO_7432 ?AUTO_7426 ) ( CLEAR ?AUTO_7432 ) ( ON ?AUTO_7423 ?AUTO_7425 ) ( CLEAR ?AUTO_7429 ) ( ON ?AUTO_7428 ?AUTO_7423 ) ( CLEAR ?AUTO_7428 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7428 ?AUTO_7423 )
      ( MAKE-ON ?AUTO_7423 ?AUTO_7424 )
      ( MAKE-ON-VERIFY ?AUTO_7423 ?AUTO_7424 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7435 - BLOCK
      ?AUTO_7436 - BLOCK
    )
    :vars
    (
      ?AUTO_7442 - BLOCK
      ?AUTO_7444 - BLOCK
      ?AUTO_7439 - BLOCK
      ?AUTO_7443 - BLOCK
      ?AUTO_7440 - BLOCK
      ?AUTO_7437 - BLOCK
      ?AUTO_7445 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7442 ?AUTO_7436 ) ( CLEAR ?AUTO_7444 ) ( ON ?AUTO_7439 ?AUTO_7442 ) ( CLEAR ?AUTO_7439 ) ( ON ?AUTO_7435 ?AUTO_7443 ) ( CLEAR ?AUTO_7440 ) ( ON ?AUTO_7437 ?AUTO_7435 ) ( CLEAR ?AUTO_7437 ) ( HOLDING ?AUTO_7445 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7445 )
      ( MAKE-ON ?AUTO_7435 ?AUTO_7436 )
      ( MAKE-ON-VERIFY ?AUTO_7435 ?AUTO_7436 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7446 - BLOCK
      ?AUTO_7447 - BLOCK
    )
    :vars
    (
      ?AUTO_7455 - BLOCK
      ?AUTO_7449 - BLOCK
      ?AUTO_7448 - BLOCK
      ?AUTO_7452 - BLOCK
      ?AUTO_7450 - BLOCK
      ?AUTO_7451 - BLOCK
      ?AUTO_7456 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7455 ?AUTO_7447 ) ( CLEAR ?AUTO_7449 ) ( ON ?AUTO_7448 ?AUTO_7455 ) ( CLEAR ?AUTO_7448 ) ( ON ?AUTO_7446 ?AUTO_7452 ) ( CLEAR ?AUTO_7450 ) ( ON ?AUTO_7451 ?AUTO_7446 ) ( ON ?AUTO_7456 ?AUTO_7451 ) ( CLEAR ?AUTO_7456 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7456 ?AUTO_7451 )
      ( MAKE-ON ?AUTO_7446 ?AUTO_7447 )
      ( MAKE-ON-VERIFY ?AUTO_7446 ?AUTO_7447 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7459 - BLOCK
      ?AUTO_7460 - BLOCK
    )
    :vars
    (
      ?AUTO_7463 - BLOCK
      ?AUTO_7466 - BLOCK
      ?AUTO_7462 - BLOCK
      ?AUTO_7469 - BLOCK
      ?AUTO_7468 - BLOCK
      ?AUTO_7465 - BLOCK
      ?AUTO_7464 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7463 ?AUTO_7460 ) ( CLEAR ?AUTO_7466 ) ( ON ?AUTO_7462 ?AUTO_7463 ) ( CLEAR ?AUTO_7462 ) ( ON ?AUTO_7459 ?AUTO_7469 ) ( ON ?AUTO_7468 ?AUTO_7459 ) ( ON ?AUTO_7465 ?AUTO_7468 ) ( CLEAR ?AUTO_7465 ) ( HOLDING ?AUTO_7464 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7464 )
      ( MAKE-ON ?AUTO_7459 ?AUTO_7460 )
      ( MAKE-ON-VERIFY ?AUTO_7459 ?AUTO_7460 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7471 - BLOCK
      ?AUTO_7472 - BLOCK
    )
    :vars
    (
      ?AUTO_7480 - BLOCK
      ?AUTO_7474 - BLOCK
      ?AUTO_7475 - BLOCK
      ?AUTO_7481 - BLOCK
      ?AUTO_7477 - BLOCK
      ?AUTO_7476 - BLOCK
      ?AUTO_7473 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7480 ?AUTO_7472 ) ( CLEAR ?AUTO_7474 ) ( ON ?AUTO_7475 ?AUTO_7480 ) ( ON ?AUTO_7471 ?AUTO_7481 ) ( ON ?AUTO_7477 ?AUTO_7471 ) ( ON ?AUTO_7476 ?AUTO_7477 ) ( CLEAR ?AUTO_7476 ) ( ON ?AUTO_7473 ?AUTO_7475 ) ( CLEAR ?AUTO_7473 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7473 ?AUTO_7475 )
      ( MAKE-ON ?AUTO_7471 ?AUTO_7472 )
      ( MAKE-ON-VERIFY ?AUTO_7471 ?AUTO_7472 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_7485 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_7485 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7485 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_7485 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_7487 - BLOCK
    )
    :vars
    (
      ?AUTO_7490 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7487 ?AUTO_7490 ) ( CLEAR ?AUTO_7487 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7487 ?AUTO_7490 )
      ( MAKE-ON-TABLE ?AUTO_7487 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_7487 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_7491 - BLOCK
    )
    :vars
    (
      ?AUTO_7493 - BLOCK
      ?AUTO_7494 - BLOCK
      ?AUTO_7495 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7491 ?AUTO_7493 ) ( CLEAR ?AUTO_7491 ) ( HOLDING ?AUTO_7494 ) ( CLEAR ?AUTO_7495 ) )
    :subtasks
    ( ( !STACK ?AUTO_7494 ?AUTO_7495 )
      ( MAKE-ON-TABLE ?AUTO_7491 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_7491 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7523 - BLOCK
      ?AUTO_7524 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_7523 ) ( CLEAR ?AUTO_7524 ) )
    :subtasks
    ( ( !STACK ?AUTO_7523 ?AUTO_7524 )
      ( MAKE-ON-VERIFY ?AUTO_7523 ?AUTO_7524 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7527 - BLOCK
      ?AUTO_7528 - BLOCK
    )
    :vars
    (
      ?AUTO_7532 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7528 ) ( ON ?AUTO_7527 ?AUTO_7532 ) ( CLEAR ?AUTO_7527 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7527 ?AUTO_7532 )
      ( MAKE-ON ?AUTO_7527 ?AUTO_7528 )
      ( MAKE-ON-VERIFY ?AUTO_7527 ?AUTO_7528 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7533 - BLOCK
      ?AUTO_7534 - BLOCK
    )
    :vars
    (
      ?AUTO_7537 - BLOCK
      ?AUTO_7538 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7534 ) ( ON ?AUTO_7533 ?AUTO_7537 ) ( CLEAR ?AUTO_7533 ) ( HOLDING ?AUTO_7538 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7538 )
      ( MAKE-ON ?AUTO_7533 ?AUTO_7534 )
      ( MAKE-ON-VERIFY ?AUTO_7533 ?AUTO_7534 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7539 - BLOCK
      ?AUTO_7540 - BLOCK
    )
    :vars
    (
      ?AUTO_7543 - BLOCK
      ?AUTO_7544 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7540 ) ( ON ?AUTO_7539 ?AUTO_7543 ) ( ON ?AUTO_7544 ?AUTO_7539 ) ( CLEAR ?AUTO_7544 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7544 ?AUTO_7539 )
      ( MAKE-ON ?AUTO_7539 ?AUTO_7540 )
      ( MAKE-ON-VERIFY ?AUTO_7539 ?AUTO_7540 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7547 - BLOCK
      ?AUTO_7548 - BLOCK
    )
    :vars
    (
      ?AUTO_7552 - BLOCK
      ?AUTO_7549 - BLOCK
      ?AUTO_7554 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7547 ?AUTO_7552 ) ( ON ?AUTO_7549 ?AUTO_7547 ) ( CLEAR ?AUTO_7549 ) ( HOLDING ?AUTO_7548 ) ( CLEAR ?AUTO_7554 ) )
    :subtasks
    ( ( !STACK ?AUTO_7548 ?AUTO_7554 )
      ( MAKE-ON ?AUTO_7547 ?AUTO_7548 )
      ( MAKE-ON-VERIFY ?AUTO_7547 ?AUTO_7548 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7726 - BLOCK
      ?AUTO_7727 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_7726 ) ( CLEAR ?AUTO_7727 ) )
    :subtasks
    ( ( !STACK ?AUTO_7726 ?AUTO_7727 )
      ( MAKE-ON-VERIFY ?AUTO_7726 ?AUTO_7727 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7730 - BLOCK
      ?AUTO_7731 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7731 ) ( ON-TABLE ?AUTO_7730 ) ( CLEAR ?AUTO_7730 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_7730 )
      ( MAKE-ON ?AUTO_7730 ?AUTO_7731 )
      ( MAKE-ON-VERIFY ?AUTO_7730 ?AUTO_7731 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7735 - BLOCK
      ?AUTO_7736 - BLOCK
    )
    :vars
    (
      ?AUTO_7740 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_7735 ) ( CLEAR ?AUTO_7735 ) ( HOLDING ?AUTO_7736 ) ( CLEAR ?AUTO_7740 ) )
    :subtasks
    ( ( !STACK ?AUTO_7736 ?AUTO_7740 )
      ( MAKE-ON ?AUTO_7735 ?AUTO_7736 )
      ( MAKE-ON-VERIFY ?AUTO_7735 ?AUTO_7736 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_7742 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_7742 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7742 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_7742 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_7744 - BLOCK
    )
    :vars
    (
      ?AUTO_7747 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7744 ?AUTO_7747 ) ( CLEAR ?AUTO_7744 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7744 ?AUTO_7747 )
      ( MAKE-ON-TABLE ?AUTO_7744 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_7744 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_7749 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_7749 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7749 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_7749 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_7751 - BLOCK
    )
    :vars
    (
      ?AUTO_7754 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7751 ?AUTO_7754 ) ( CLEAR ?AUTO_7751 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7751 ?AUTO_7754 )
      ( MAKE-ON-TABLE ?AUTO_7751 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_7751 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_7755 - BLOCK
    )
    :vars
    (
      ?AUTO_7757 - BLOCK
      ?AUTO_7758 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7755 ?AUTO_7757 ) ( CLEAR ?AUTO_7755 ) ( HOLDING ?AUTO_7758 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7758 )
      ( MAKE-ON-TABLE ?AUTO_7755 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_7755 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_7759 - BLOCK
    )
    :vars
    (
      ?AUTO_7762 - BLOCK
      ?AUTO_7760 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7759 ?AUTO_7762 ) ( ON ?AUTO_7760 ?AUTO_7759 ) ( CLEAR ?AUTO_7760 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7760 ?AUTO_7759 )
      ( MAKE-ON-TABLE ?AUTO_7759 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_7759 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_7766 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_7766 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7766 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_7766 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_7768 - BLOCK
    )
    :vars
    (
      ?AUTO_7771 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7768 ?AUTO_7771 ) ( CLEAR ?AUTO_7768 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7768 ?AUTO_7771 )
      ( MAKE-ON-TABLE ?AUTO_7768 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_7768 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_7772 - BLOCK
    )
    :vars
    (
      ?AUTO_7773 - BLOCK
      ?AUTO_7775 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7772 ?AUTO_7773 ) ( CLEAR ?AUTO_7772 ) ( HOLDING ?AUTO_7775 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7775 )
      ( MAKE-ON-TABLE ?AUTO_7772 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_7772 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_7776 - BLOCK
    )
    :vars
    (
      ?AUTO_7777 - BLOCK
      ?AUTO_7778 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7776 ?AUTO_7777 ) ( ON ?AUTO_7778 ?AUTO_7776 ) ( CLEAR ?AUTO_7778 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7778 ?AUTO_7776 )
      ( MAKE-ON-TABLE ?AUTO_7776 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_7776 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_7782 - BLOCK
    )
    :vars
    (
      ?AUTO_7785 - BLOCK
      ?AUTO_7783 - BLOCK
      ?AUTO_7786 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7782 ?AUTO_7785 ) ( ON ?AUTO_7783 ?AUTO_7782 ) ( CLEAR ?AUTO_7783 ) ( HOLDING ?AUTO_7786 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7786 )
      ( MAKE-ON-TABLE ?AUTO_7782 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_7782 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_7787 - BLOCK
    )
    :vars
    (
      ?AUTO_7789 - BLOCK
      ?AUTO_7790 - BLOCK
      ?AUTO_7791 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7787 ?AUTO_7789 ) ( ON ?AUTO_7790 ?AUTO_7787 ) ( ON ?AUTO_7791 ?AUTO_7790 ) ( CLEAR ?AUTO_7791 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7791 ?AUTO_7790 )
      ( MAKE-ON-TABLE ?AUTO_7787 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_7787 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7796 - BLOCK
      ?AUTO_7797 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_7796 ) ( CLEAR ?AUTO_7797 ) )
    :subtasks
    ( ( !STACK ?AUTO_7796 ?AUTO_7797 )
      ( MAKE-ON-VERIFY ?AUTO_7796 ?AUTO_7797 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7800 - BLOCK
      ?AUTO_7801 - BLOCK
    )
    :vars
    (
      ?AUTO_7805 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7801 ) ( ON ?AUTO_7800 ?AUTO_7805 ) ( CLEAR ?AUTO_7800 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7800 ?AUTO_7805 )
      ( MAKE-ON ?AUTO_7800 ?AUTO_7801 )
      ( MAKE-ON-VERIFY ?AUTO_7800 ?AUTO_7801 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7806 - BLOCK
      ?AUTO_7807 - BLOCK
    )
    :vars
    (
      ?AUTO_7810 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7806 ?AUTO_7810 ) ( CLEAR ?AUTO_7806 ) ( HOLDING ?AUTO_7807 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7807 )
      ( MAKE-ON ?AUTO_7806 ?AUTO_7807 )
      ( MAKE-ON-VERIFY ?AUTO_7806 ?AUTO_7807 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7812 - BLOCK
      ?AUTO_7813 - BLOCK
    )
    :vars
    (
      ?AUTO_7816 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7812 ?AUTO_7816 ) ( ON ?AUTO_7813 ?AUTO_7812 ) ( CLEAR ?AUTO_7813 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7813 ?AUTO_7812 )
      ( MAKE-ON ?AUTO_7812 ?AUTO_7813 )
      ( MAKE-ON-VERIFY ?AUTO_7812 ?AUTO_7813 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7819 - BLOCK
      ?AUTO_7820 - BLOCK
    )
    :vars
    (
      ?AUTO_7823 - BLOCK
      ?AUTO_7824 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7819 ?AUTO_7823 ) ( ON ?AUTO_7820 ?AUTO_7819 ) ( CLEAR ?AUTO_7820 ) ( HOLDING ?AUTO_7824 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7824 )
      ( MAKE-ON ?AUTO_7819 ?AUTO_7820 )
      ( MAKE-ON-VERIFY ?AUTO_7819 ?AUTO_7820 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7825 - BLOCK
      ?AUTO_7826 - BLOCK
    )
    :vars
    (
      ?AUTO_7828 - BLOCK
      ?AUTO_7830 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7825 ?AUTO_7828 ) ( ON ?AUTO_7826 ?AUTO_7825 ) ( ON ?AUTO_7830 ?AUTO_7826 ) ( CLEAR ?AUTO_7830 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7830 ?AUTO_7826 )
      ( MAKE-ON ?AUTO_7825 ?AUTO_7826 )
      ( MAKE-ON-VERIFY ?AUTO_7825 ?AUTO_7826 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7833 - BLOCK
      ?AUTO_7834 - BLOCK
    )
    :vars
    (
      ?AUTO_7835 - BLOCK
      ?AUTO_7837 - BLOCK
      ?AUTO_7839 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7833 ?AUTO_7835 ) ( ON ?AUTO_7834 ?AUTO_7833 ) ( ON ?AUTO_7837 ?AUTO_7834 ) ( CLEAR ?AUTO_7837 ) ( HOLDING ?AUTO_7839 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7839 )
      ( MAKE-ON ?AUTO_7833 ?AUTO_7834 )
      ( MAKE-ON-VERIFY ?AUTO_7833 ?AUTO_7834 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7840 - BLOCK
      ?AUTO_7841 - BLOCK
    )
    :vars
    (
      ?AUTO_7842 - BLOCK
      ?AUTO_7845 - BLOCK
      ?AUTO_7846 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7840 ?AUTO_7842 ) ( ON ?AUTO_7841 ?AUTO_7840 ) ( ON ?AUTO_7845 ?AUTO_7841 ) ( ON ?AUTO_7846 ?AUTO_7845 ) ( CLEAR ?AUTO_7846 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7846 ?AUTO_7845 )
      ( MAKE-ON ?AUTO_7840 ?AUTO_7841 )
      ( MAKE-ON-VERIFY ?AUTO_7840 ?AUTO_7841 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7851 - BLOCK
      ?AUTO_7852 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_7851 ) ( CLEAR ?AUTO_7852 ) )
    :subtasks
    ( ( !STACK ?AUTO_7851 ?AUTO_7852 )
      ( MAKE-ON-VERIFY ?AUTO_7851 ?AUTO_7852 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7855 - BLOCK
      ?AUTO_7856 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7856 ) ( ON-TABLE ?AUTO_7855 ) ( CLEAR ?AUTO_7855 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_7855 )
      ( MAKE-ON ?AUTO_7855 ?AUTO_7856 )
      ( MAKE-ON-VERIFY ?AUTO_7855 ?AUTO_7856 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7860 - BLOCK
      ?AUTO_7861 - BLOCK
    )
    :vars
    (
      ?AUTO_7865 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_7860 ) ( CLEAR ?AUTO_7860 ) ( HOLDING ?AUTO_7861 ) ( CLEAR ?AUTO_7865 ) )
    :subtasks
    ( ( !STACK ?AUTO_7861 ?AUTO_7865 )
      ( MAKE-ON ?AUTO_7860 ?AUTO_7861 )
      ( MAKE-ON-VERIFY ?AUTO_7860 ?AUTO_7861 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7868 - BLOCK
      ?AUTO_7869 - BLOCK
    )
    :vars
    (
      ?AUTO_7872 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7869 ) ( ON-TABLE ?AUTO_7868 ) ( CLEAR ?AUTO_7868 ) ( HOLDING ?AUTO_7872 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7872 )
      ( MAKE-ON ?AUTO_7868 ?AUTO_7869 )
      ( MAKE-ON-VERIFY ?AUTO_7868 ?AUTO_7869 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7873 - BLOCK
      ?AUTO_7874 - BLOCK
    )
    :vars
    (
      ?AUTO_7877 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_7873 ) ( CLEAR ?AUTO_7873 ) ( ON ?AUTO_7877 ?AUTO_7874 ) ( CLEAR ?AUTO_7877 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7877 ?AUTO_7874 )
      ( MAKE-ON ?AUTO_7873 ?AUTO_7874 )
      ( MAKE-ON-VERIFY ?AUTO_7873 ?AUTO_7874 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7880 - BLOCK
      ?AUTO_7881 - BLOCK
    )
    :vars
    (
      ?AUTO_7884 - BLOCK
      ?AUTO_7885 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_7880 ) ( CLEAR ?AUTO_7880 ) ( ON ?AUTO_7884 ?AUTO_7881 ) ( CLEAR ?AUTO_7884 ) ( HOLDING ?AUTO_7885 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7885 )
      ( MAKE-ON ?AUTO_7880 ?AUTO_7881 )
      ( MAKE-ON-VERIFY ?AUTO_7880 ?AUTO_7881 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7886 - BLOCK
      ?AUTO_7887 - BLOCK
    )
    :vars
    (
      ?AUTO_7888 - BLOCK
      ?AUTO_7891 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_7886 ) ( CLEAR ?AUTO_7886 ) ( ON ?AUTO_7888 ?AUTO_7887 ) ( ON ?AUTO_7891 ?AUTO_7888 ) ( CLEAR ?AUTO_7891 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7891 ?AUTO_7888 )
      ( MAKE-ON ?AUTO_7886 ?AUTO_7887 )
      ( MAKE-ON-VERIFY ?AUTO_7886 ?AUTO_7887 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7894 - BLOCK
      ?AUTO_7895 - BLOCK
    )
    :vars
    (
      ?AUTO_7897 - BLOCK
      ?AUTO_7896 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7897 ?AUTO_7895 ) ( ON ?AUTO_7896 ?AUTO_7897 ) ( CLEAR ?AUTO_7896 ) ( HOLDING ?AUTO_7894 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7894 )
      ( MAKE-ON ?AUTO_7894 ?AUTO_7895 )
      ( MAKE-ON-VERIFY ?AUTO_7894 ?AUTO_7895 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7901 - BLOCK
      ?AUTO_7902 - BLOCK
    )
    :vars
    (
      ?AUTO_7903 - BLOCK
      ?AUTO_7904 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7903 ?AUTO_7902 ) ( ON ?AUTO_7904 ?AUTO_7903 ) ( ON ?AUTO_7901 ?AUTO_7904 ) ( CLEAR ?AUTO_7901 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7901 ?AUTO_7904 )
      ( MAKE-ON ?AUTO_7901 ?AUTO_7902 )
      ( MAKE-ON-VERIFY ?AUTO_7901 ?AUTO_7902 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7911 - BLOCK
      ?AUTO_7912 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_7911 ) ( CLEAR ?AUTO_7912 ) )
    :subtasks
    ( ( !STACK ?AUTO_7911 ?AUTO_7912 )
      ( MAKE-ON-VERIFY ?AUTO_7911 ?AUTO_7912 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7915 - BLOCK
      ?AUTO_7916 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7916 ) ( ON-TABLE ?AUTO_7915 ) ( CLEAR ?AUTO_7915 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_7915 )
      ( MAKE-ON ?AUTO_7915 ?AUTO_7916 )
      ( MAKE-ON-VERIFY ?AUTO_7915 ?AUTO_7916 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7920 - BLOCK
      ?AUTO_7921 - BLOCK
    )
    :vars
    (
      ?AUTO_7924 - BLOCK
      ?AUTO_7925 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7921 ) ( ON-TABLE ?AUTO_7920 ) ( CLEAR ?AUTO_7920 ) ( HOLDING ?AUTO_7924 ) ( CLEAR ?AUTO_7925 ) )
    :subtasks
    ( ( !STACK ?AUTO_7924 ?AUTO_7925 )
      ( MAKE-ON ?AUTO_7920 ?AUTO_7921 )
      ( MAKE-ON-VERIFY ?AUTO_7920 ?AUTO_7921 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7946 - BLOCK
      ?AUTO_7947 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_7946 ) ( CLEAR ?AUTO_7947 ) )
    :subtasks
    ( ( !STACK ?AUTO_7946 ?AUTO_7947 )
      ( MAKE-ON-VERIFY ?AUTO_7946 ?AUTO_7947 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7950 - BLOCK
      ?AUTO_7951 - BLOCK
    )
    :vars
    (
      ?AUTO_7955 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7951 ) ( ON ?AUTO_7950 ?AUTO_7955 ) ( CLEAR ?AUTO_7950 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7950 ?AUTO_7955 )
      ( MAKE-ON ?AUTO_7950 ?AUTO_7951 )
      ( MAKE-ON-VERIFY ?AUTO_7950 ?AUTO_7951 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7956 - BLOCK
      ?AUTO_7957 - BLOCK
    )
    :vars
    (
      ?AUTO_7960 - BLOCK
      ?AUTO_7961 - BLOCK
      ?AUTO_7962 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_7957 ) ( ON ?AUTO_7956 ?AUTO_7960 ) ( CLEAR ?AUTO_7956 ) ( HOLDING ?AUTO_7961 ) ( CLEAR ?AUTO_7962 ) )
    :subtasks
    ( ( !STACK ?AUTO_7961 ?AUTO_7962 )
      ( MAKE-ON ?AUTO_7956 ?AUTO_7957 )
      ( MAKE-ON-VERIFY ?AUTO_7956 ?AUTO_7957 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7971 - BLOCK
      ?AUTO_7972 - BLOCK
    )
    :vars
    (
      ?AUTO_7975 - BLOCK
      ?AUTO_7977 - BLOCK
      ?AUTO_7976 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7971 ?AUTO_7975 ) ( CLEAR ?AUTO_7971 ) ( CLEAR ?AUTO_7977 ) ( ON ?AUTO_7976 ?AUTO_7972 ) ( CLEAR ?AUTO_7976 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7976 ?AUTO_7972 )
      ( MAKE-ON ?AUTO_7971 ?AUTO_7972 )
      ( MAKE-ON-VERIFY ?AUTO_7971 ?AUTO_7972 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7980 - BLOCK
      ?AUTO_7981 - BLOCK
    )
    :vars
    (
      ?AUTO_7984 - BLOCK
      ?AUTO_7986 - BLOCK
      ?AUTO_7985 - BLOCK
      ?AUTO_7987 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7980 ?AUTO_7984 ) ( CLEAR ?AUTO_7980 ) ( CLEAR ?AUTO_7986 ) ( ON ?AUTO_7985 ?AUTO_7981 ) ( CLEAR ?AUTO_7985 ) ( HOLDING ?AUTO_7987 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_7987 )
      ( MAKE-ON ?AUTO_7980 ?AUTO_7981 )
      ( MAKE-ON-VERIFY ?AUTO_7980 ?AUTO_7981 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7988 - BLOCK
      ?AUTO_7989 - BLOCK
    )
    :vars
    (
      ?AUTO_7995 - BLOCK
      ?AUTO_7990 - BLOCK
      ?AUTO_7991 - BLOCK
      ?AUTO_7994 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7988 ?AUTO_7995 ) ( CLEAR ?AUTO_7988 ) ( CLEAR ?AUTO_7990 ) ( ON ?AUTO_7991 ?AUTO_7989 ) ( ON ?AUTO_7994 ?AUTO_7991 ) ( CLEAR ?AUTO_7994 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_7994 ?AUTO_7991 )
      ( MAKE-ON ?AUTO_7988 ?AUTO_7989 )
      ( MAKE-ON-VERIFY ?AUTO_7988 ?AUTO_7989 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_7998 - BLOCK
      ?AUTO_7999 - BLOCK
    )
    :vars
    (
      ?AUTO_8004 - BLOCK
      ?AUTO_8003 - BLOCK
      ?AUTO_8001 - BLOCK
      ?AUTO_8005 - BLOCK
      ?AUTO_8006 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_7998 ?AUTO_8004 ) ( CLEAR ?AUTO_7998 ) ( CLEAR ?AUTO_8003 ) ( ON ?AUTO_8001 ?AUTO_7999 ) ( ON ?AUTO_8005 ?AUTO_8001 ) ( CLEAR ?AUTO_8005 ) ( HOLDING ?AUTO_8006 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_8006 )
      ( MAKE-ON ?AUTO_7998 ?AUTO_7999 )
      ( MAKE-ON-VERIFY ?AUTO_7998 ?AUTO_7999 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8007 - BLOCK
      ?AUTO_8008 - BLOCK
    )
    :vars
    (
      ?AUTO_8011 - BLOCK
      ?AUTO_8010 - BLOCK
      ?AUTO_8014 - BLOCK
      ?AUTO_8009 - BLOCK
      ?AUTO_8015 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8007 ?AUTO_8011 ) ( CLEAR ?AUTO_8007 ) ( CLEAR ?AUTO_8010 ) ( ON ?AUTO_8014 ?AUTO_8008 ) ( ON ?AUTO_8009 ?AUTO_8014 ) ( ON ?AUTO_8015 ?AUTO_8009 ) ( CLEAR ?AUTO_8015 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8015 ?AUTO_8009 )
      ( MAKE-ON ?AUTO_8007 ?AUTO_8008 )
      ( MAKE-ON-VERIFY ?AUTO_8007 ?AUTO_8008 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8018 - BLOCK
      ?AUTO_8019 - BLOCK
    )
    :vars
    (
      ?AUTO_8021 - BLOCK
      ?AUTO_8025 - BLOCK
      ?AUTO_8026 - BLOCK
      ?AUTO_8023 - BLOCK
      ?AUTO_8022 - BLOCK
      ?AUTO_8027 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8018 ?AUTO_8021 ) ( CLEAR ?AUTO_8018 ) ( CLEAR ?AUTO_8025 ) ( ON ?AUTO_8026 ?AUTO_8019 ) ( ON ?AUTO_8023 ?AUTO_8026 ) ( ON ?AUTO_8022 ?AUTO_8023 ) ( CLEAR ?AUTO_8022 ) ( HOLDING ?AUTO_8027 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_8027 )
      ( MAKE-ON ?AUTO_8018 ?AUTO_8019 )
      ( MAKE-ON-VERIFY ?AUTO_8018 ?AUTO_8019 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8028 - BLOCK
      ?AUTO_8029 - BLOCK
    )
    :vars
    (
      ?AUTO_8033 - BLOCK
      ?AUTO_8032 - BLOCK
      ?AUTO_8030 - BLOCK
      ?AUTO_8036 - BLOCK
      ?AUTO_8031 - BLOCK
      ?AUTO_8037 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8028 ?AUTO_8033 ) ( CLEAR ?AUTO_8028 ) ( CLEAR ?AUTO_8032 ) ( ON ?AUTO_8030 ?AUTO_8029 ) ( ON ?AUTO_8036 ?AUTO_8030 ) ( ON ?AUTO_8031 ?AUTO_8036 ) ( ON ?AUTO_8037 ?AUTO_8031 ) ( CLEAR ?AUTO_8037 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8037 ?AUTO_8031 )
      ( MAKE-ON ?AUTO_8028 ?AUTO_8029 )
      ( MAKE-ON-VERIFY ?AUTO_8028 ?AUTO_8029 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_8041 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_8041 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_8041 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_8041 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_8043 - BLOCK
    )
    :vars
    (
      ?AUTO_8046 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8043 ?AUTO_8046 ) ( CLEAR ?AUTO_8043 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8043 ?AUTO_8046 )
      ( MAKE-ON-TABLE ?AUTO_8043 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_8043 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_8047 - BLOCK
    )
    :vars
    (
      ?AUTO_8049 - BLOCK
      ?AUTO_8050 - BLOCK
      ?AUTO_8051 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8047 ?AUTO_8049 ) ( CLEAR ?AUTO_8047 ) ( HOLDING ?AUTO_8050 ) ( CLEAR ?AUTO_8051 ) )
    :subtasks
    ( ( !STACK ?AUTO_8050 ?AUTO_8051 )
      ( MAKE-ON-TABLE ?AUTO_8047 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_8047 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_8052 - BLOCK
    )
    :vars
    (
      ?AUTO_8054 - BLOCK
      ?AUTO_8056 - BLOCK
      ?AUTO_8055 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8052 ?AUTO_8054 ) ( CLEAR ?AUTO_8056 ) ( ON ?AUTO_8055 ?AUTO_8052 ) ( CLEAR ?AUTO_8055 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8055 ?AUTO_8052 )
      ( MAKE-ON-TABLE ?AUTO_8052 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_8052 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_8059 - BLOCK
    )
    :vars
    (
      ?AUTO_8062 - BLOCK
      ?AUTO_8060 - BLOCK
      ?AUTO_8063 - BLOCK
      ?AUTO_8064 - BLOCK
      ?AUTO_8065 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8059 ?AUTO_8062 ) ( CLEAR ?AUTO_8060 ) ( ON ?AUTO_8063 ?AUTO_8059 ) ( CLEAR ?AUTO_8063 ) ( HOLDING ?AUTO_8064 ) ( CLEAR ?AUTO_8065 ) )
    :subtasks
    ( ( !STACK ?AUTO_8064 ?AUTO_8065 )
      ( MAKE-ON-TABLE ?AUTO_8059 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_8059 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_8078 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_8078 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_8078 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_8078 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_8080 - BLOCK
    )
    :vars
    (
      ?AUTO_8083 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8080 ?AUTO_8083 ) ( CLEAR ?AUTO_8080 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8080 ?AUTO_8083 )
      ( MAKE-ON-TABLE ?AUTO_8080 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_8080 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_8084 - BLOCK
    )
    :vars
    (
      ?AUTO_8086 - BLOCK
      ?AUTO_8087 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8084 ?AUTO_8086 ) ( CLEAR ?AUTO_8084 ) ( HOLDING ?AUTO_8087 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_8087 )
      ( MAKE-ON-TABLE ?AUTO_8084 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_8084 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_8088 - BLOCK
    )
    :vars
    (
      ?AUTO_8090 - BLOCK
      ?AUTO_8091 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8088 ?AUTO_8090 ) ( ON ?AUTO_8091 ?AUTO_8088 ) ( CLEAR ?AUTO_8091 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8091 ?AUTO_8088 )
      ( MAKE-ON-TABLE ?AUTO_8088 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_8088 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_8094 - BLOCK
    )
    :vars
    (
      ?AUTO_8095 - BLOCK
      ?AUTO_8096 - BLOCK
      ?AUTO_8098 - BLOCK
      ?AUTO_8099 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8094 ?AUTO_8095 ) ( ON ?AUTO_8096 ?AUTO_8094 ) ( CLEAR ?AUTO_8096 ) ( HOLDING ?AUTO_8098 ) ( CLEAR ?AUTO_8099 ) )
    :subtasks
    ( ( !STACK ?AUTO_8098 ?AUTO_8099 )
      ( MAKE-ON-TABLE ?AUTO_8094 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_8094 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_8100 - BLOCK
    )
    :vars
    (
      ?AUTO_8102 - BLOCK
      ?AUTO_8103 - BLOCK
      ?AUTO_8105 - BLOCK
      ?AUTO_8104 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8100 ?AUTO_8102 ) ( ON ?AUTO_8103 ?AUTO_8100 ) ( CLEAR ?AUTO_8105 ) ( ON ?AUTO_8104 ?AUTO_8103 ) ( CLEAR ?AUTO_8104 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8104 ?AUTO_8103 )
      ( MAKE-ON-TABLE ?AUTO_8100 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_8100 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_8108 - BLOCK
    )
    :vars
    (
      ?AUTO_8113 - BLOCK
      ?AUTO_8110 - BLOCK
      ?AUTO_8111 - BLOCK
      ?AUTO_8109 - BLOCK
      ?AUTO_8114 - BLOCK
      ?AUTO_8115 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8108 ?AUTO_8113 ) ( ON ?AUTO_8110 ?AUTO_8108 ) ( CLEAR ?AUTO_8111 ) ( ON ?AUTO_8109 ?AUTO_8110 ) ( CLEAR ?AUTO_8109 ) ( HOLDING ?AUTO_8114 ) ( CLEAR ?AUTO_8115 ) )
    :subtasks
    ( ( !STACK ?AUTO_8114 ?AUTO_8115 )
      ( MAKE-ON-TABLE ?AUTO_8108 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_8108 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8129 - BLOCK
      ?AUTO_8130 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_8129 ) ( CLEAR ?AUTO_8130 ) )
    :subtasks
    ( ( !STACK ?AUTO_8129 ?AUTO_8130 )
      ( MAKE-ON-VERIFY ?AUTO_8129 ?AUTO_8130 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8133 - BLOCK
      ?AUTO_8134 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_8134 ) ( ON-TABLE ?AUTO_8133 ) ( CLEAR ?AUTO_8133 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_8133 )
      ( MAKE-ON ?AUTO_8133 ?AUTO_8134 )
      ( MAKE-ON-VERIFY ?AUTO_8133 ?AUTO_8134 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8138 - BLOCK
      ?AUTO_8139 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_8138 ) ( CLEAR ?AUTO_8138 ) ( HOLDING ?AUTO_8139 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_8139 )
      ( MAKE-ON ?AUTO_8138 ?AUTO_8139 )
      ( MAKE-ON-VERIFY ?AUTO_8138 ?AUTO_8139 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8417 - BLOCK
      ?AUTO_8418 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_8417 ) ( CLEAR ?AUTO_8418 ) )
    :subtasks
    ( ( !STACK ?AUTO_8417 ?AUTO_8418 )
      ( MAKE-ON-VERIFY ?AUTO_8417 ?AUTO_8418 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8421 - BLOCK
      ?AUTO_8422 - BLOCK
    )
    :vars
    (
      ?AUTO_8426 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_8422 ) ( ON ?AUTO_8421 ?AUTO_8426 ) ( CLEAR ?AUTO_8421 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8421 ?AUTO_8426 )
      ( MAKE-ON ?AUTO_8421 ?AUTO_8422 )
      ( MAKE-ON-VERIFY ?AUTO_8421 ?AUTO_8422 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8427 - BLOCK
      ?AUTO_8428 - BLOCK
    )
    :vars
    (
      ?AUTO_8429 - BLOCK
      ?AUTO_8433 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8427 ?AUTO_8429 ) ( CLEAR ?AUTO_8427 ) ( HOLDING ?AUTO_8428 ) ( CLEAR ?AUTO_8433 ) )
    :subtasks
    ( ( !STACK ?AUTO_8428 ?AUTO_8433 )
      ( MAKE-ON ?AUTO_8427 ?AUTO_8428 )
      ( MAKE-ON-VERIFY ?AUTO_8427 ?AUTO_8428 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8436 - BLOCK
      ?AUTO_8437 - BLOCK
    )
    :vars
    (
      ?AUTO_8440 - BLOCK
      ?AUTO_8441 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_8437 ) ( ON ?AUTO_8436 ?AUTO_8440 ) ( CLEAR ?AUTO_8436 ) ( HOLDING ?AUTO_8441 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_8441 )
      ( MAKE-ON ?AUTO_8436 ?AUTO_8437 )
      ( MAKE-ON-VERIFY ?AUTO_8436 ?AUTO_8437 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8526 - BLOCK
      ?AUTO_8527 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_8526 ) ( CLEAR ?AUTO_8527 ) )
    :subtasks
    ( ( !STACK ?AUTO_8526 ?AUTO_8527 )
      ( MAKE-ON-VERIFY ?AUTO_8526 ?AUTO_8527 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8530 - BLOCK
      ?AUTO_8531 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_8531 ) ( ON-TABLE ?AUTO_8530 ) ( CLEAR ?AUTO_8530 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_8530 )
      ( MAKE-ON ?AUTO_8530 ?AUTO_8531 )
      ( MAKE-ON-VERIFY ?AUTO_8530 ?AUTO_8531 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8535 - BLOCK
      ?AUTO_8536 - BLOCK
    )
    :vars
    (
      ?AUTO_8539 - BLOCK
      ?AUTO_8540 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_8536 ) ( ON-TABLE ?AUTO_8535 ) ( CLEAR ?AUTO_8535 ) ( HOLDING ?AUTO_8539 ) ( CLEAR ?AUTO_8540 ) )
    :subtasks
    ( ( !STACK ?AUTO_8539 ?AUTO_8540 )
      ( MAKE-ON ?AUTO_8535 ?AUTO_8536 )
      ( MAKE-ON-VERIFY ?AUTO_8535 ?AUTO_8536 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8541 - BLOCK
      ?AUTO_8542 - BLOCK
    )
    :vars
    (
      ?AUTO_8544 - BLOCK
      ?AUTO_8546 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_8542 ) ( ON-TABLE ?AUTO_8541 ) ( CLEAR ?AUTO_8544 ) ( ON ?AUTO_8546 ?AUTO_8541 ) ( CLEAR ?AUTO_8546 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8546 ?AUTO_8541 )
      ( MAKE-ON ?AUTO_8541 ?AUTO_8542 )
      ( MAKE-ON-VERIFY ?AUTO_8541 ?AUTO_8542 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8549 - BLOCK
      ?AUTO_8550 - BLOCK
    )
    :vars
    (
      ?AUTO_8554 - BLOCK
      ?AUTO_8553 - BLOCK
      ?AUTO_8556 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_8550 ) ( ON-TABLE ?AUTO_8549 ) ( ON ?AUTO_8554 ?AUTO_8549 ) ( CLEAR ?AUTO_8554 ) ( HOLDING ?AUTO_8553 ) ( CLEAR ?AUTO_8556 ) )
    :subtasks
    ( ( !STACK ?AUTO_8553 ?AUTO_8556 )
      ( MAKE-ON ?AUTO_8549 ?AUTO_8550 )
      ( MAKE-ON-VERIFY ?AUTO_8549 ?AUTO_8550 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8561 - BLOCK
      ?AUTO_8562 - BLOCK
    )
    :vars
    (
      ?AUTO_8564 - BLOCK
      ?AUTO_8567 - BLOCK
      ?AUTO_8565 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_8561 ) ( ON ?AUTO_8564 ?AUTO_8561 ) ( CLEAR ?AUTO_8564 ) ( CLEAR ?AUTO_8567 ) ( ON ?AUTO_8565 ?AUTO_8562 ) ( CLEAR ?AUTO_8565 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8565 ?AUTO_8562 )
      ( MAKE-ON ?AUTO_8561 ?AUTO_8562 )
      ( MAKE-ON-VERIFY ?AUTO_8561 ?AUTO_8562 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8570 - BLOCK
      ?AUTO_8571 - BLOCK
    )
    :vars
    (
      ?AUTO_8574 - BLOCK
      ?AUTO_8575 - BLOCK
      ?AUTO_8576 - BLOCK
      ?AUTO_8577 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_8570 ) ( ON ?AUTO_8574 ?AUTO_8570 ) ( CLEAR ?AUTO_8574 ) ( CLEAR ?AUTO_8575 ) ( ON ?AUTO_8576 ?AUTO_8571 ) ( CLEAR ?AUTO_8576 ) ( HOLDING ?AUTO_8577 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_8577 )
      ( MAKE-ON ?AUTO_8570 ?AUTO_8571 )
      ( MAKE-ON-VERIFY ?AUTO_8570 ?AUTO_8571 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8578 - BLOCK
      ?AUTO_8579 - BLOCK
    )
    :vars
    (
      ?AUTO_8584 - BLOCK
      ?AUTO_8585 - BLOCK
      ?AUTO_8580 - BLOCK
      ?AUTO_8583 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_8578 ) ( ON ?AUTO_8584 ?AUTO_8578 ) ( CLEAR ?AUTO_8584 ) ( CLEAR ?AUTO_8585 ) ( ON ?AUTO_8580 ?AUTO_8579 ) ( ON ?AUTO_8583 ?AUTO_8580 ) ( CLEAR ?AUTO_8583 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8583 ?AUTO_8580 )
      ( MAKE-ON ?AUTO_8578 ?AUTO_8579 )
      ( MAKE-ON-VERIFY ?AUTO_8578 ?AUTO_8579 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8588 - BLOCK
      ?AUTO_8589 - BLOCK
    )
    :vars
    (
      ?AUTO_8595 - BLOCK
      ?AUTO_8591 - BLOCK
      ?AUTO_8594 - BLOCK
      ?AUTO_8592 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_8588 ) ( CLEAR ?AUTO_8595 ) ( ON ?AUTO_8591 ?AUTO_8589 ) ( ON ?AUTO_8594 ?AUTO_8591 ) ( CLEAR ?AUTO_8594 ) ( HOLDING ?AUTO_8592 ) ( CLEAR ?AUTO_8588 ) )
    :subtasks
    ( ( !STACK ?AUTO_8592 ?AUTO_8588 )
      ( MAKE-ON ?AUTO_8588 ?AUTO_8589 )
      ( MAKE-ON-VERIFY ?AUTO_8588 ?AUTO_8589 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8598 - BLOCK
      ?AUTO_8599 - BLOCK
    )
    :vars
    (
      ?AUTO_8602 - BLOCK
      ?AUTO_8603 - BLOCK
      ?AUTO_8601 - BLOCK
      ?AUTO_8600 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_8598 ) ( CLEAR ?AUTO_8602 ) ( ON ?AUTO_8603 ?AUTO_8599 ) ( ON ?AUTO_8601 ?AUTO_8603 ) ( CLEAR ?AUTO_8598 ) ( ON ?AUTO_8600 ?AUTO_8601 ) ( CLEAR ?AUTO_8600 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8600 ?AUTO_8601 )
      ( MAKE-ON ?AUTO_8598 ?AUTO_8599 )
      ( MAKE-ON-VERIFY ?AUTO_8598 ?AUTO_8599 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8608 - BLOCK
      ?AUTO_8609 - BLOCK
    )
    :vars
    (
      ?AUTO_8614 - BLOCK
      ?AUTO_8613 - BLOCK
      ?AUTO_8612 - BLOCK
      ?AUTO_8615 - BLOCK
      ?AUTO_8616 - BLOCK
      ?AUTO_8617 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_8608 ) ( CLEAR ?AUTO_8614 ) ( ON ?AUTO_8613 ?AUTO_8609 ) ( ON ?AUTO_8612 ?AUTO_8613 ) ( CLEAR ?AUTO_8608 ) ( ON ?AUTO_8615 ?AUTO_8612 ) ( CLEAR ?AUTO_8615 ) ( HOLDING ?AUTO_8616 ) ( CLEAR ?AUTO_8617 ) )
    :subtasks
    ( ( !STACK ?AUTO_8616 ?AUTO_8617 )
      ( MAKE-ON ?AUTO_8608 ?AUTO_8609 )
      ( MAKE-ON-VERIFY ?AUTO_8608 ?AUTO_8609 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8626 - BLOCK
      ?AUTO_8627 - BLOCK
    )
    :vars
    (
      ?AUTO_8630 - BLOCK
      ?AUTO_8628 - BLOCK
      ?AUTO_8632 - BLOCK
      ?AUTO_8629 - BLOCK
      ?AUTO_8634 - BLOCK
      ?AUTO_8633 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_8626 ) ( CLEAR ?AUTO_8630 ) ( ON ?AUTO_8628 ?AUTO_8627 ) ( ON ?AUTO_8632 ?AUTO_8628 ) ( ON ?AUTO_8629 ?AUTO_8632 ) ( CLEAR ?AUTO_8629 ) ( CLEAR ?AUTO_8634 ) ( ON ?AUTO_8633 ?AUTO_8626 ) ( CLEAR ?AUTO_8633 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8633 ?AUTO_8626 )
      ( MAKE-ON ?AUTO_8626 ?AUTO_8627 )
      ( MAKE-ON-VERIFY ?AUTO_8626 ?AUTO_8627 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8638 - BLOCK
      ?AUTO_8639 - BLOCK
    )
    :vars
    (
      ?AUTO_8647 - BLOCK
      ?AUTO_8643 - BLOCK
      ?AUTO_8646 - BLOCK
      ?AUTO_8644 - BLOCK
      ?AUTO_8645 - BLOCK
      ?AUTO_8642 - BLOCK
      ?AUTO_8648 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_8638 ) ( CLEAR ?AUTO_8647 ) ( ON ?AUTO_8643 ?AUTO_8639 ) ( ON ?AUTO_8646 ?AUTO_8643 ) ( ON ?AUTO_8644 ?AUTO_8646 ) ( CLEAR ?AUTO_8644 ) ( CLEAR ?AUTO_8645 ) ( ON ?AUTO_8642 ?AUTO_8638 ) ( CLEAR ?AUTO_8642 ) ( HOLDING ?AUTO_8648 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_8648 )
      ( MAKE-ON ?AUTO_8638 ?AUTO_8639 )
      ( MAKE-ON-VERIFY ?AUTO_8638 ?AUTO_8639 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8649 - BLOCK
      ?AUTO_8650 - BLOCK
    )
    :vars
    (
      ?AUTO_8655 - BLOCK
      ?AUTO_8658 - BLOCK
      ?AUTO_8659 - BLOCK
      ?AUTO_8657 - BLOCK
      ?AUTO_8651 - BLOCK
      ?AUTO_8654 - BLOCK
      ?AUTO_8652 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_8649 ) ( CLEAR ?AUTO_8655 ) ( ON ?AUTO_8658 ?AUTO_8650 ) ( ON ?AUTO_8659 ?AUTO_8658 ) ( ON ?AUTO_8657 ?AUTO_8659 ) ( CLEAR ?AUTO_8657 ) ( CLEAR ?AUTO_8651 ) ( ON ?AUTO_8654 ?AUTO_8649 ) ( ON ?AUTO_8652 ?AUTO_8654 ) ( CLEAR ?AUTO_8652 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8652 ?AUTO_8654 )
      ( MAKE-ON ?AUTO_8649 ?AUTO_8650 )
      ( MAKE-ON-VERIFY ?AUTO_8649 ?AUTO_8650 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8662 - BLOCK
      ?AUTO_8663 - BLOCK
    )
    :vars
    (
      ?AUTO_8672 - BLOCK
      ?AUTO_8665 - BLOCK
      ?AUTO_8666 - BLOCK
      ?AUTO_8670 - BLOCK
      ?AUTO_8667 - BLOCK
      ?AUTO_8671 - BLOCK
      ?AUTO_8669 - BLOCK
      ?AUTO_8673 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_8662 ) ( CLEAR ?AUTO_8672 ) ( ON ?AUTO_8665 ?AUTO_8663 ) ( ON ?AUTO_8666 ?AUTO_8665 ) ( ON ?AUTO_8670 ?AUTO_8666 ) ( CLEAR ?AUTO_8670 ) ( CLEAR ?AUTO_8667 ) ( ON ?AUTO_8671 ?AUTO_8662 ) ( ON ?AUTO_8669 ?AUTO_8671 ) ( CLEAR ?AUTO_8669 ) ( HOLDING ?AUTO_8673 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_8673 )
      ( MAKE-ON ?AUTO_8662 ?AUTO_8663 )
      ( MAKE-ON-VERIFY ?AUTO_8662 ?AUTO_8663 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8674 - BLOCK
      ?AUTO_8675 - BLOCK
    )
    :vars
    (
      ?AUTO_8679 - BLOCK
      ?AUTO_8678 - BLOCK
      ?AUTO_8684 - BLOCK
      ?AUTO_8676 - BLOCK
      ?AUTO_8683 - BLOCK
      ?AUTO_8677 - BLOCK
      ?AUTO_8682 - BLOCK
      ?AUTO_8685 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_8674 ) ( CLEAR ?AUTO_8679 ) ( ON ?AUTO_8678 ?AUTO_8675 ) ( ON ?AUTO_8684 ?AUTO_8678 ) ( ON ?AUTO_8676 ?AUTO_8684 ) ( CLEAR ?AUTO_8676 ) ( CLEAR ?AUTO_8683 ) ( ON ?AUTO_8677 ?AUTO_8674 ) ( ON ?AUTO_8682 ?AUTO_8677 ) ( ON ?AUTO_8685 ?AUTO_8682 ) ( CLEAR ?AUTO_8685 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8685 ?AUTO_8682 )
      ( MAKE-ON ?AUTO_8674 ?AUTO_8675 )
      ( MAKE-ON-VERIFY ?AUTO_8674 ?AUTO_8675 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8688 - BLOCK
      ?AUTO_8689 - BLOCK
    )
    :vars
    (
      ?AUTO_8696 - BLOCK
      ?AUTO_8699 - BLOCK
      ?AUTO_8694 - BLOCK
      ?AUTO_8691 - BLOCK
      ?AUTO_8695 - BLOCK
      ?AUTO_8693 - BLOCK
      ?AUTO_8692 - BLOCK
      ?AUTO_8697 - BLOCK
      ?AUTO_8700 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_8688 ) ( CLEAR ?AUTO_8696 ) ( ON ?AUTO_8699 ?AUTO_8689 ) ( ON ?AUTO_8694 ?AUTO_8699 ) ( ON ?AUTO_8691 ?AUTO_8694 ) ( CLEAR ?AUTO_8691 ) ( CLEAR ?AUTO_8695 ) ( ON ?AUTO_8693 ?AUTO_8688 ) ( ON ?AUTO_8692 ?AUTO_8693 ) ( ON ?AUTO_8697 ?AUTO_8692 ) ( CLEAR ?AUTO_8697 ) ( HOLDING ?AUTO_8700 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_8700 )
      ( MAKE-ON ?AUTO_8688 ?AUTO_8689 )
      ( MAKE-ON-VERIFY ?AUTO_8688 ?AUTO_8689 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8701 - BLOCK
      ?AUTO_8702 - BLOCK
    )
    :vars
    (
      ?AUTO_8707 - BLOCK
      ?AUTO_8704 - BLOCK
      ?AUTO_8710 - BLOCK
      ?AUTO_8705 - BLOCK
      ?AUTO_8709 - BLOCK
      ?AUTO_8711 - BLOCK
      ?AUTO_8713 - BLOCK
      ?AUTO_8703 - BLOCK
      ?AUTO_8712 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_8701 ) ( CLEAR ?AUTO_8707 ) ( ON ?AUTO_8704 ?AUTO_8702 ) ( ON ?AUTO_8710 ?AUTO_8704 ) ( ON ?AUTO_8705 ?AUTO_8710 ) ( CLEAR ?AUTO_8705 ) ( CLEAR ?AUTO_8709 ) ( ON ?AUTO_8711 ?AUTO_8701 ) ( ON ?AUTO_8713 ?AUTO_8711 ) ( ON ?AUTO_8703 ?AUTO_8713 ) ( ON ?AUTO_8712 ?AUTO_8703 ) ( CLEAR ?AUTO_8712 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8712 ?AUTO_8703 )
      ( MAKE-ON ?AUTO_8701 ?AUTO_8702 )
      ( MAKE-ON-VERIFY ?AUTO_8701 ?AUTO_8702 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_8715 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_8715 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_8715 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_8715 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_8717 - BLOCK
    )
    :vars
    (
      ?AUTO_8720 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8717 ?AUTO_8720 ) ( CLEAR ?AUTO_8717 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8717 ?AUTO_8720 )
      ( MAKE-ON-TABLE ?AUTO_8717 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_8717 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_8722 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_8722 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_8722 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_8722 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_8724 - BLOCK
    )
    :vars
    (
      ?AUTO_8727 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8724 ?AUTO_8727 ) ( CLEAR ?AUTO_8724 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8724 ?AUTO_8727 )
      ( MAKE-ON-TABLE ?AUTO_8724 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_8724 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_8728 - BLOCK
    )
    :vars
    (
      ?AUTO_8730 - BLOCK
      ?AUTO_8731 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8728 ?AUTO_8730 ) ( CLEAR ?AUTO_8728 ) ( HOLDING ?AUTO_8731 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_8731 )
      ( MAKE-ON-TABLE ?AUTO_8728 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_8728 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_8732 - BLOCK
    )
    :vars
    (
      ?AUTO_8734 - BLOCK
      ?AUTO_8735 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8732 ?AUTO_8734 ) ( ON ?AUTO_8735 ?AUTO_8732 ) ( CLEAR ?AUTO_8735 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8735 ?AUTO_8732 )
      ( MAKE-ON-TABLE ?AUTO_8732 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_8732 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_8739 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_8739 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_8739 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_8739 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_8741 - BLOCK
    )
    :vars
    (
      ?AUTO_8744 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8741 ?AUTO_8744 ) ( CLEAR ?AUTO_8741 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8741 ?AUTO_8744 )
      ( MAKE-ON-TABLE ?AUTO_8741 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_8741 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_8745 - BLOCK
    )
    :vars
    (
      ?AUTO_8747 - BLOCK
      ?AUTO_8748 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8745 ?AUTO_8747 ) ( CLEAR ?AUTO_8745 ) ( HOLDING ?AUTO_8748 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_8748 )
      ( MAKE-ON-TABLE ?AUTO_8745 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_8745 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_8749 - BLOCK
    )
    :vars
    (
      ?AUTO_8751 - BLOCK
      ?AUTO_8752 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8749 ?AUTO_8751 ) ( ON ?AUTO_8752 ?AUTO_8749 ) ( CLEAR ?AUTO_8752 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8752 ?AUTO_8749 )
      ( MAKE-ON-TABLE ?AUTO_8749 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_8749 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_8755 - BLOCK
    )
    :vars
    (
      ?AUTO_8756 - BLOCK
      ?AUTO_8757 - BLOCK
      ?AUTO_8759 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8755 ?AUTO_8756 ) ( ON ?AUTO_8757 ?AUTO_8755 ) ( CLEAR ?AUTO_8757 ) ( HOLDING ?AUTO_8759 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_8759 )
      ( MAKE-ON-TABLE ?AUTO_8755 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_8755 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_8760 - BLOCK
    )
    :vars
    (
      ?AUTO_8762 - BLOCK
      ?AUTO_8763 - BLOCK
      ?AUTO_8764 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8760 ?AUTO_8762 ) ( ON ?AUTO_8763 ?AUTO_8760 ) ( ON ?AUTO_8764 ?AUTO_8763 ) ( CLEAR ?AUTO_8764 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8764 ?AUTO_8763 )
      ( MAKE-ON-TABLE ?AUTO_8760 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_8760 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_8768 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_8768 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_8768 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_8768 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_8770 - BLOCK
    )
    :vars
    (
      ?AUTO_8773 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8770 ?AUTO_8773 ) ( CLEAR ?AUTO_8770 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8770 ?AUTO_8773 )
      ( MAKE-ON-TABLE ?AUTO_8770 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_8770 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_8774 - BLOCK
    )
    :vars
    (
      ?AUTO_8776 - BLOCK
      ?AUTO_8777 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8774 ?AUTO_8776 ) ( CLEAR ?AUTO_8774 ) ( HOLDING ?AUTO_8777 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_8777 )
      ( MAKE-ON-TABLE ?AUTO_8774 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_8774 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_8778 - BLOCK
    )
    :vars
    (
      ?AUTO_8780 - BLOCK
      ?AUTO_8781 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8778 ?AUTO_8780 ) ( ON ?AUTO_8781 ?AUTO_8778 ) ( CLEAR ?AUTO_8781 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8781 ?AUTO_8778 )
      ( MAKE-ON-TABLE ?AUTO_8778 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_8778 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_8784 - BLOCK
    )
    :vars
    (
      ?AUTO_8786 - BLOCK
      ?AUTO_8785 - BLOCK
      ?AUTO_8788 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8784 ?AUTO_8786 ) ( ON ?AUTO_8785 ?AUTO_8784 ) ( CLEAR ?AUTO_8785 ) ( HOLDING ?AUTO_8788 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_8788 )
      ( MAKE-ON-TABLE ?AUTO_8784 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_8784 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_8789 - BLOCK
    )
    :vars
    (
      ?AUTO_8792 - BLOCK
      ?AUTO_8791 - BLOCK
      ?AUTO_8793 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8789 ?AUTO_8792 ) ( ON ?AUTO_8791 ?AUTO_8789 ) ( ON ?AUTO_8793 ?AUTO_8791 ) ( CLEAR ?AUTO_8793 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8793 ?AUTO_8791 )
      ( MAKE-ON-TABLE ?AUTO_8789 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_8789 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_8796 - BLOCK
    )
    :vars
    (
      ?AUTO_8799 - BLOCK
      ?AUTO_8800 - BLOCK
      ?AUTO_8797 - BLOCK
      ?AUTO_8801 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8796 ?AUTO_8799 ) ( ON ?AUTO_8800 ?AUTO_8796 ) ( ON ?AUTO_8797 ?AUTO_8800 ) ( CLEAR ?AUTO_8797 ) ( HOLDING ?AUTO_8801 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_8801 )
      ( MAKE-ON-TABLE ?AUTO_8796 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_8796 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_8802 - BLOCK
    )
    :vars
    (
      ?AUTO_8807 - BLOCK
      ?AUTO_8806 - BLOCK
      ?AUTO_8803 - BLOCK
      ?AUTO_8805 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8802 ?AUTO_8807 ) ( ON ?AUTO_8806 ?AUTO_8802 ) ( ON ?AUTO_8803 ?AUTO_8806 ) ( ON ?AUTO_8805 ?AUTO_8803 ) ( CLEAR ?AUTO_8805 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8805 ?AUTO_8803 )
      ( MAKE-ON-TABLE ?AUTO_8802 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_8802 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8812 - BLOCK
      ?AUTO_8813 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_8812 ) ( CLEAR ?AUTO_8813 ) )
    :subtasks
    ( ( !STACK ?AUTO_8812 ?AUTO_8813 )
      ( MAKE-ON-VERIFY ?AUTO_8812 ?AUTO_8813 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8816 - BLOCK
      ?AUTO_8817 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_8817 ) ( ON-TABLE ?AUTO_8816 ) ( CLEAR ?AUTO_8816 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_8816 )
      ( MAKE-ON ?AUTO_8816 ?AUTO_8817 )
      ( MAKE-ON-VERIFY ?AUTO_8816 ?AUTO_8817 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8821 - BLOCK
      ?AUTO_8822 - BLOCK
    )
    :vars
    (
      ?AUTO_8825 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_8822 ) ( ON-TABLE ?AUTO_8821 ) ( CLEAR ?AUTO_8821 ) ( HOLDING ?AUTO_8825 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_8825 )
      ( MAKE-ON ?AUTO_8821 ?AUTO_8822 )
      ( MAKE-ON-VERIFY ?AUTO_8821 ?AUTO_8822 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8826 - BLOCK
      ?AUTO_8827 - BLOCK
    )
    :vars
    (
      ?AUTO_8830 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_8826 ) ( CLEAR ?AUTO_8826 ) ( ON ?AUTO_8830 ?AUTO_8827 ) ( CLEAR ?AUTO_8830 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8830 ?AUTO_8827 )
      ( MAKE-ON ?AUTO_8826 ?AUTO_8827 )
      ( MAKE-ON-VERIFY ?AUTO_8826 ?AUTO_8827 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8833 - BLOCK
      ?AUTO_8834 - BLOCK
    )
    :vars
    (
      ?AUTO_8835 - BLOCK
      ?AUTO_8838 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_8833 ) ( CLEAR ?AUTO_8833 ) ( ON ?AUTO_8835 ?AUTO_8834 ) ( CLEAR ?AUTO_8835 ) ( HOLDING ?AUTO_8838 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_8838 )
      ( MAKE-ON ?AUTO_8833 ?AUTO_8834 )
      ( MAKE-ON-VERIFY ?AUTO_8833 ?AUTO_8834 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8839 - BLOCK
      ?AUTO_8840 - BLOCK
    )
    :vars
    (
      ?AUTO_8843 - BLOCK
      ?AUTO_8844 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_8839 ) ( CLEAR ?AUTO_8839 ) ( ON ?AUTO_8843 ?AUTO_8840 ) ( ON ?AUTO_8844 ?AUTO_8843 ) ( CLEAR ?AUTO_8844 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8844 ?AUTO_8843 )
      ( MAKE-ON ?AUTO_8839 ?AUTO_8840 )
      ( MAKE-ON-VERIFY ?AUTO_8839 ?AUTO_8840 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8847 - BLOCK
      ?AUTO_8848 - BLOCK
    )
    :vars
    (
      ?AUTO_8852 - BLOCK
      ?AUTO_8849 - BLOCK
      ?AUTO_8853 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_8847 ) ( CLEAR ?AUTO_8847 ) ( ON ?AUTO_8852 ?AUTO_8848 ) ( ON ?AUTO_8849 ?AUTO_8852 ) ( CLEAR ?AUTO_8849 ) ( HOLDING ?AUTO_8853 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_8853 )
      ( MAKE-ON ?AUTO_8847 ?AUTO_8848 )
      ( MAKE-ON-VERIFY ?AUTO_8847 ?AUTO_8848 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8854 - BLOCK
      ?AUTO_8855 - BLOCK
    )
    :vars
    (
      ?AUTO_8857 - BLOCK
      ?AUTO_8856 - BLOCK
      ?AUTO_8860 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_8854 ) ( CLEAR ?AUTO_8854 ) ( ON ?AUTO_8857 ?AUTO_8855 ) ( ON ?AUTO_8856 ?AUTO_8857 ) ( ON ?AUTO_8860 ?AUTO_8856 ) ( CLEAR ?AUTO_8860 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8860 ?AUTO_8856 )
      ( MAKE-ON ?AUTO_8854 ?AUTO_8855 )
      ( MAKE-ON-VERIFY ?AUTO_8854 ?AUTO_8855 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8863 - BLOCK
      ?AUTO_8864 - BLOCK
    )
    :vars
    (
      ?AUTO_8867 - BLOCK
      ?AUTO_8868 - BLOCK
      ?AUTO_8865 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8867 ?AUTO_8864 ) ( ON ?AUTO_8868 ?AUTO_8867 ) ( ON ?AUTO_8865 ?AUTO_8868 ) ( CLEAR ?AUTO_8865 ) ( HOLDING ?AUTO_8863 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_8863 )
      ( MAKE-ON ?AUTO_8863 ?AUTO_8864 )
      ( MAKE-ON-VERIFY ?AUTO_8863 ?AUTO_8864 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8871 - BLOCK
      ?AUTO_8872 - BLOCK
    )
    :vars
    (
      ?AUTO_8873 - BLOCK
      ?AUTO_8877 - BLOCK
      ?AUTO_8874 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8873 ?AUTO_8872 ) ( ON ?AUTO_8877 ?AUTO_8873 ) ( ON ?AUTO_8874 ?AUTO_8877 ) ( ON ?AUTO_8871 ?AUTO_8874 ) ( CLEAR ?AUTO_8871 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8871 ?AUTO_8874 )
      ( MAKE-ON ?AUTO_8871 ?AUTO_8872 )
      ( MAKE-ON-VERIFY ?AUTO_8871 ?AUTO_8872 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_8879 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_8879 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_8879 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_8879 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_8881 - BLOCK
    )
    :vars
    (
      ?AUTO_8884 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8881 ?AUTO_8884 ) ( CLEAR ?AUTO_8881 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8881 ?AUTO_8884 )
      ( MAKE-ON-TABLE ?AUTO_8881 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_8881 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_8886 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_8886 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_8886 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_8886 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_8888 - BLOCK
    )
    :vars
    (
      ?AUTO_8891 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8888 ?AUTO_8891 ) ( CLEAR ?AUTO_8888 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8888 ?AUTO_8891 )
      ( MAKE-ON-TABLE ?AUTO_8888 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_8888 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_8892 - BLOCK
    )
    :vars
    (
      ?AUTO_8894 - BLOCK
      ?AUTO_8895 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8892 ?AUTO_8894 ) ( CLEAR ?AUTO_8892 ) ( HOLDING ?AUTO_8895 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_8895 )
      ( MAKE-ON-TABLE ?AUTO_8892 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_8892 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_8896 - BLOCK
    )
    :vars
    (
      ?AUTO_8898 - BLOCK
      ?AUTO_8899 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8896 ?AUTO_8898 ) ( ON ?AUTO_8899 ?AUTO_8896 ) ( CLEAR ?AUTO_8899 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8899 ?AUTO_8896 )
      ( MAKE-ON-TABLE ?AUTO_8896 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_8896 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_8903 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_8903 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_8903 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_8903 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_8905 - BLOCK
    )
    :vars
    (
      ?AUTO_8908 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8905 ?AUTO_8908 ) ( CLEAR ?AUTO_8905 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8905 ?AUTO_8908 )
      ( MAKE-ON-TABLE ?AUTO_8905 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_8905 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_8909 - BLOCK
    )
    :vars
    (
      ?AUTO_8911 - BLOCK
      ?AUTO_8912 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8909 ?AUTO_8911 ) ( CLEAR ?AUTO_8909 ) ( HOLDING ?AUTO_8912 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_8912 )
      ( MAKE-ON-TABLE ?AUTO_8909 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_8909 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_8913 - BLOCK
    )
    :vars
    (
      ?AUTO_8915 - BLOCK
      ?AUTO_8916 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8913 ?AUTO_8915 ) ( ON ?AUTO_8916 ?AUTO_8913 ) ( CLEAR ?AUTO_8916 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8916 ?AUTO_8913 )
      ( MAKE-ON-TABLE ?AUTO_8913 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_8913 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_8919 - BLOCK
    )
    :vars
    (
      ?AUTO_8920 - BLOCK
      ?AUTO_8921 - BLOCK
      ?AUTO_8923 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8919 ?AUTO_8920 ) ( ON ?AUTO_8921 ?AUTO_8919 ) ( CLEAR ?AUTO_8921 ) ( HOLDING ?AUTO_8923 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_8923 )
      ( MAKE-ON-TABLE ?AUTO_8919 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_8919 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_8924 - BLOCK
    )
    :vars
    (
      ?AUTO_8926 - BLOCK
      ?AUTO_8927 - BLOCK
      ?AUTO_8928 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8924 ?AUTO_8926 ) ( ON ?AUTO_8927 ?AUTO_8924 ) ( ON ?AUTO_8928 ?AUTO_8927 ) ( CLEAR ?AUTO_8928 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8928 ?AUTO_8927 )
      ( MAKE-ON-TABLE ?AUTO_8924 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_8924 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8933 - BLOCK
      ?AUTO_8934 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_8933 ) ( CLEAR ?AUTO_8934 ) )
    :subtasks
    ( ( !STACK ?AUTO_8933 ?AUTO_8934 )
      ( MAKE-ON-VERIFY ?AUTO_8933 ?AUTO_8934 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8937 - BLOCK
      ?AUTO_8938 - BLOCK
    )
    :vars
    (
      ?AUTO_8942 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_8938 ) ( ON ?AUTO_8937 ?AUTO_8942 ) ( CLEAR ?AUTO_8937 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8937 ?AUTO_8942 )
      ( MAKE-ON ?AUTO_8937 ?AUTO_8938 )
      ( MAKE-ON-VERIFY ?AUTO_8937 ?AUTO_8938 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8943 - BLOCK
      ?AUTO_8944 - BLOCK
    )
    :vars
    (
      ?AUTO_8947 - BLOCK
      ?AUTO_8948 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_8944 ) ( ON ?AUTO_8943 ?AUTO_8947 ) ( CLEAR ?AUTO_8943 ) ( HOLDING ?AUTO_8948 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_8948 )
      ( MAKE-ON ?AUTO_8943 ?AUTO_8944 )
      ( MAKE-ON-VERIFY ?AUTO_8943 ?AUTO_8944 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8949 - BLOCK
      ?AUTO_8950 - BLOCK
    )
    :vars
    (
      ?AUTO_8953 - BLOCK
      ?AUTO_8954 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8949 ?AUTO_8953 ) ( CLEAR ?AUTO_8949 ) ( ON ?AUTO_8954 ?AUTO_8950 ) ( CLEAR ?AUTO_8954 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8954 ?AUTO_8950 )
      ( MAKE-ON ?AUTO_8949 ?AUTO_8950 )
      ( MAKE-ON-VERIFY ?AUTO_8949 ?AUTO_8950 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8957 - BLOCK
      ?AUTO_8958 - BLOCK
    )
    :vars
    (
      ?AUTO_8962 - BLOCK
      ?AUTO_8959 - BLOCK
      ?AUTO_8963 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8957 ?AUTO_8962 ) ( CLEAR ?AUTO_8957 ) ( ON ?AUTO_8959 ?AUTO_8958 ) ( CLEAR ?AUTO_8959 ) ( HOLDING ?AUTO_8963 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_8963 )
      ( MAKE-ON ?AUTO_8957 ?AUTO_8958 )
      ( MAKE-ON-VERIFY ?AUTO_8957 ?AUTO_8958 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8964 - BLOCK
      ?AUTO_8965 - BLOCK
    )
    :vars
    (
      ?AUTO_8969 - BLOCK
      ?AUTO_8966 - BLOCK
      ?AUTO_8970 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8964 ?AUTO_8969 ) ( CLEAR ?AUTO_8964 ) ( ON ?AUTO_8966 ?AUTO_8965 ) ( ON ?AUTO_8970 ?AUTO_8966 ) ( CLEAR ?AUTO_8970 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8970 ?AUTO_8966 )
      ( MAKE-ON ?AUTO_8964 ?AUTO_8965 )
      ( MAKE-ON-VERIFY ?AUTO_8964 ?AUTO_8965 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8973 - BLOCK
      ?AUTO_8974 - BLOCK
    )
    :vars
    (
      ?AUTO_8979 - BLOCK
      ?AUTO_8976 - BLOCK
      ?AUTO_8977 - BLOCK
      ?AUTO_8980 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8973 ?AUTO_8979 ) ( CLEAR ?AUTO_8973 ) ( ON ?AUTO_8976 ?AUTO_8974 ) ( ON ?AUTO_8977 ?AUTO_8976 ) ( CLEAR ?AUTO_8977 ) ( HOLDING ?AUTO_8980 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_8980 )
      ( MAKE-ON ?AUTO_8973 ?AUTO_8974 )
      ( MAKE-ON-VERIFY ?AUTO_8973 ?AUTO_8974 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8981 - BLOCK
      ?AUTO_8982 - BLOCK
    )
    :vars
    (
      ?AUTO_8984 - BLOCK
      ?AUTO_8983 - BLOCK
      ?AUTO_8988 - BLOCK
      ?AUTO_8987 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_8981 ?AUTO_8984 ) ( CLEAR ?AUTO_8981 ) ( ON ?AUTO_8983 ?AUTO_8982 ) ( ON ?AUTO_8988 ?AUTO_8983 ) ( ON ?AUTO_8987 ?AUTO_8988 ) ( CLEAR ?AUTO_8987 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_8987 ?AUTO_8988 )
      ( MAKE-ON ?AUTO_8981 ?AUTO_8982 )
      ( MAKE-ON-VERIFY ?AUTO_8981 ?AUTO_8982 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8993 - BLOCK
      ?AUTO_8994 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_8993 ) ( CLEAR ?AUTO_8994 ) )
    :subtasks
    ( ( !STACK ?AUTO_8993 ?AUTO_8994 )
      ( MAKE-ON-VERIFY ?AUTO_8993 ?AUTO_8994 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_8997 - BLOCK
      ?AUTO_8998 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_8998 ) ( ON-TABLE ?AUTO_8997 ) ( CLEAR ?AUTO_8997 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_8997 )
      ( MAKE-ON ?AUTO_8997 ?AUTO_8998 )
      ( MAKE-ON-VERIFY ?AUTO_8997 ?AUTO_8998 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9002 - BLOCK
      ?AUTO_9003 - BLOCK
    )
    :vars
    (
      ?AUTO_9006 - BLOCK
      ?AUTO_9007 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_9003 ) ( ON-TABLE ?AUTO_9002 ) ( CLEAR ?AUTO_9002 ) ( HOLDING ?AUTO_9006 ) ( CLEAR ?AUTO_9007 ) )
    :subtasks
    ( ( !STACK ?AUTO_9006 ?AUTO_9007 )
      ( MAKE-ON ?AUTO_9002 ?AUTO_9003 )
      ( MAKE-ON-VERIFY ?AUTO_9002 ?AUTO_9003 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9010 - BLOCK
      ?AUTO_9011 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_9010 ) ( CLEAR ?AUTO_9010 ) ( HOLDING ?AUTO_9011 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_9011 )
      ( MAKE-ON ?AUTO_9010 ?AUTO_9011 )
      ( MAKE-ON-VERIFY ?AUTO_9010 ?AUTO_9011 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9019 - BLOCK
      ?AUTO_9020 - BLOCK
    )
    :vars
    (
      ?AUTO_9024 - BLOCK
      ?AUTO_9023 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_9019 ) ( CLEAR ?AUTO_9019 ) ( CLEAR ?AUTO_9024 ) ( ON ?AUTO_9023 ?AUTO_9020 ) ( CLEAR ?AUTO_9023 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_9023 ?AUTO_9020 )
      ( MAKE-ON ?AUTO_9019 ?AUTO_9020 )
      ( MAKE-ON-VERIFY ?AUTO_9019 ?AUTO_9020 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9027 - BLOCK
      ?AUTO_9028 - BLOCK
    )
    :vars
    (
      ?AUTO_9031 - BLOCK
      ?AUTO_9032 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_9031 ) ( ON ?AUTO_9032 ?AUTO_9028 ) ( CLEAR ?AUTO_9032 ) ( HOLDING ?AUTO_9027 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_9027 )
      ( MAKE-ON ?AUTO_9027 ?AUTO_9028 )
      ( MAKE-ON-VERIFY ?AUTO_9027 ?AUTO_9028 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_9037 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_9037 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_9037 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_9037 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_9039 - BLOCK
    )
    :vars
    (
      ?AUTO_9042 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_9039 ?AUTO_9042 ) ( CLEAR ?AUTO_9039 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_9039 ?AUTO_9042 )
      ( MAKE-ON-TABLE ?AUTO_9039 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_9039 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_9043 - BLOCK
    )
    :vars
    (
      ?AUTO_9045 - BLOCK
      ?AUTO_9046 - BLOCK
      ?AUTO_9047 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_9043 ?AUTO_9045 ) ( CLEAR ?AUTO_9043 ) ( HOLDING ?AUTO_9046 ) ( CLEAR ?AUTO_9047 ) )
    :subtasks
    ( ( !STACK ?AUTO_9046 ?AUTO_9047 )
      ( MAKE-ON-TABLE ?AUTO_9043 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_9043 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_9050 - BLOCK
    )
    :vars
    (
      ?AUTO_9052 - BLOCK
      ?AUTO_9054 - BLOCK
      ?AUTO_9051 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_9050 ?AUTO_9052 ) ( CLEAR ?AUTO_9054 ) ( ON ?AUTO_9051 ?AUTO_9050 ) ( CLEAR ?AUTO_9051 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_9051 ?AUTO_9050 )
      ( MAKE-ON-TABLE ?AUTO_9050 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_9050 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_9057 - BLOCK
    )
    :vars
    (
      ?AUTO_9059 - BLOCK
      ?AUTO_9061 - BLOCK
      ?AUTO_9060 - BLOCK
      ?AUTO_9062 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_9057 ?AUTO_9059 ) ( CLEAR ?AUTO_9061 ) ( ON ?AUTO_9060 ?AUTO_9057 ) ( CLEAR ?AUTO_9060 ) ( HOLDING ?AUTO_9062 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_9062 )
      ( MAKE-ON-TABLE ?AUTO_9057 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_9057 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_9069 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_9069 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_9069 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_9069 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_9071 - BLOCK
    )
    :vars
    (
      ?AUTO_9074 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_9071 ?AUTO_9074 ) ( CLEAR ?AUTO_9071 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_9071 ?AUTO_9074 )
      ( MAKE-ON-TABLE ?AUTO_9071 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_9071 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_9075 - BLOCK
    )
    :vars
    (
      ?AUTO_9077 - BLOCK
      ?AUTO_9078 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_9075 ?AUTO_9077 ) ( CLEAR ?AUTO_9075 ) ( HOLDING ?AUTO_9078 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_9078 )
      ( MAKE-ON-TABLE ?AUTO_9075 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_9075 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_9079 - BLOCK
    )
    :vars
    (
      ?AUTO_9081 - BLOCK
      ?AUTO_9082 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_9079 ?AUTO_9081 ) ( ON ?AUTO_9082 ?AUTO_9079 ) ( CLEAR ?AUTO_9082 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_9082 ?AUTO_9079 )
      ( MAKE-ON-TABLE ?AUTO_9079 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_9079 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_9085 - BLOCK
    )
    :vars
    (
      ?AUTO_9086 - BLOCK
      ?AUTO_9087 - BLOCK
      ?AUTO_9089 - BLOCK
      ?AUTO_9090 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_9085 ?AUTO_9086 ) ( ON ?AUTO_9087 ?AUTO_9085 ) ( CLEAR ?AUTO_9087 ) ( HOLDING ?AUTO_9089 ) ( CLEAR ?AUTO_9090 ) )
    :subtasks
    ( ( !STACK ?AUTO_9089 ?AUTO_9090 )
      ( MAKE-ON-TABLE ?AUTO_9085 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_9085 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_9093 - BLOCK
    )
    :vars
    (
      ?AUTO_9098 - BLOCK
      ?AUTO_9094 - BLOCK
      ?AUTO_9096 - BLOCK
      ?AUTO_9095 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_9093 ?AUTO_9098 ) ( ON ?AUTO_9094 ?AUTO_9093 ) ( CLEAR ?AUTO_9096 ) ( ON ?AUTO_9095 ?AUTO_9094 ) ( CLEAR ?AUTO_9095 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_9095 ?AUTO_9094 )
      ( MAKE-ON-TABLE ?AUTO_9093 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_9093 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_9101 - BLOCK
    )
    :vars
    (
      ?AUTO_9106 - BLOCK
      ?AUTO_9103 - BLOCK
      ?AUTO_9105 - BLOCK
      ?AUTO_9104 - BLOCK
      ?AUTO_9107 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_9101 ?AUTO_9106 ) ( ON ?AUTO_9103 ?AUTO_9101 ) ( CLEAR ?AUTO_9105 ) ( ON ?AUTO_9104 ?AUTO_9103 ) ( CLEAR ?AUTO_9104 ) ( HOLDING ?AUTO_9107 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_9107 )
      ( MAKE-ON-TABLE ?AUTO_9101 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_9101 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_9114 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_9114 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_9114 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_9114 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_9116 - BLOCK
    )
    :vars
    (
      ?AUTO_9119 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_9116 ?AUTO_9119 ) ( CLEAR ?AUTO_9116 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_9116 ?AUTO_9119 )
      ( MAKE-ON-TABLE ?AUTO_9116 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_9116 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_9120 - BLOCK
    )
    :vars
    (
      ?AUTO_9122 - BLOCK
      ?AUTO_9123 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_9120 ?AUTO_9122 ) ( CLEAR ?AUTO_9120 ) ( HOLDING ?AUTO_9123 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_9123 )
      ( MAKE-ON-TABLE ?AUTO_9120 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_9120 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_9124 - BLOCK
    )
    :vars
    (
      ?AUTO_9126 - BLOCK
      ?AUTO_9127 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_9124 ?AUTO_9126 ) ( ON ?AUTO_9127 ?AUTO_9124 ) ( CLEAR ?AUTO_9127 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_9127 ?AUTO_9124 )
      ( MAKE-ON-TABLE ?AUTO_9124 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_9124 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_9130 - BLOCK
    )
    :vars
    (
      ?AUTO_9131 - BLOCK
      ?AUTO_9132 - BLOCK
      ?AUTO_9134 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_9130 ?AUTO_9131 ) ( ON ?AUTO_9132 ?AUTO_9130 ) ( CLEAR ?AUTO_9132 ) ( HOLDING ?AUTO_9134 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_9134 )
      ( MAKE-ON-TABLE ?AUTO_9130 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_9130 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_9135 - BLOCK
    )
    :vars
    (
      ?AUTO_9137 - BLOCK
      ?AUTO_9138 - BLOCK
      ?AUTO_9139 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_9135 ?AUTO_9137 ) ( ON ?AUTO_9138 ?AUTO_9135 ) ( ON ?AUTO_9139 ?AUTO_9138 ) ( CLEAR ?AUTO_9139 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_9139 ?AUTO_9138 )
      ( MAKE-ON-TABLE ?AUTO_9135 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_9135 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_9142 - BLOCK
    )
    :vars
    (
      ?AUTO_9146 - BLOCK
      ?AUTO_9145 - BLOCK
      ?AUTO_9143 - BLOCK
      ?AUTO_9147 - BLOCK
      ?AUTO_9148 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_9142 ?AUTO_9146 ) ( ON ?AUTO_9145 ?AUTO_9142 ) ( ON ?AUTO_9143 ?AUTO_9145 ) ( CLEAR ?AUTO_9143 ) ( HOLDING ?AUTO_9147 ) ( CLEAR ?AUTO_9148 ) )
    :subtasks
    ( ( !STACK ?AUTO_9147 ?AUTO_9148 )
      ( MAKE-ON-TABLE ?AUTO_9142 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_9142 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_9151 - BLOCK
    )
    :vars
    (
      ?AUTO_9154 - BLOCK
      ?AUTO_9153 - BLOCK
      ?AUTO_9156 - BLOCK
      ?AUTO_9155 - BLOCK
      ?AUTO_9157 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_9151 ?AUTO_9154 ) ( ON ?AUTO_9153 ?AUTO_9151 ) ( ON ?AUTO_9156 ?AUTO_9153 ) ( CLEAR ?AUTO_9155 ) ( ON ?AUTO_9157 ?AUTO_9156 ) ( CLEAR ?AUTO_9157 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_9157 ?AUTO_9156 )
      ( MAKE-ON-TABLE ?AUTO_9151 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_9151 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_9160 - BLOCK
    )
    :vars
    (
      ?AUTO_9163 - BLOCK
      ?AUTO_9162 - BLOCK
      ?AUTO_9164 - BLOCK
      ?AUTO_9161 - BLOCK
      ?AUTO_9166 - BLOCK
      ?AUTO_9167 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_9160 ?AUTO_9163 ) ( ON ?AUTO_9162 ?AUTO_9160 ) ( ON ?AUTO_9164 ?AUTO_9162 ) ( CLEAR ?AUTO_9161 ) ( ON ?AUTO_9166 ?AUTO_9164 ) ( CLEAR ?AUTO_9166 ) ( HOLDING ?AUTO_9167 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_9167 )
      ( MAKE-ON-TABLE ?AUTO_9160 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_9160 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9175 - BLOCK
      ?AUTO_9176 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_9175 ) ( CLEAR ?AUTO_9176 ) )
    :subtasks
    ( ( !STACK ?AUTO_9175 ?AUTO_9176 )
      ( MAKE-ON-VERIFY ?AUTO_9175 ?AUTO_9176 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9179 - BLOCK
      ?AUTO_9180 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_9180 ) ( ON-TABLE ?AUTO_9179 ) ( CLEAR ?AUTO_9179 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_9179 )
      ( MAKE-ON ?AUTO_9179 ?AUTO_9180 )
      ( MAKE-ON-VERIFY ?AUTO_9179 ?AUTO_9180 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9184 - BLOCK
      ?AUTO_9185 - BLOCK
    )
    :vars
    (
      ?AUTO_9188 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_9185 ) ( ON-TABLE ?AUTO_9184 ) ( CLEAR ?AUTO_9184 ) ( HOLDING ?AUTO_9188 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_9188 )
      ( MAKE-ON ?AUTO_9184 ?AUTO_9185 )
      ( MAKE-ON-VERIFY ?AUTO_9184 ?AUTO_9185 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9189 - BLOCK
      ?AUTO_9190 - BLOCK
    )
    :vars
    (
      ?AUTO_9193 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_9189 ) ( CLEAR ?AUTO_9189 ) ( ON ?AUTO_9193 ?AUTO_9190 ) ( CLEAR ?AUTO_9193 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_9193 ?AUTO_9190 )
      ( MAKE-ON ?AUTO_9189 ?AUTO_9190 )
      ( MAKE-ON-VERIFY ?AUTO_9189 ?AUTO_9190 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9196 - BLOCK
      ?AUTO_9197 - BLOCK
    )
    :vars
    (
      ?AUTO_9199 - BLOCK
      ?AUTO_9201 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_9196 ) ( CLEAR ?AUTO_9196 ) ( ON ?AUTO_9199 ?AUTO_9197 ) ( CLEAR ?AUTO_9199 ) ( HOLDING ?AUTO_9201 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_9201 )
      ( MAKE-ON ?AUTO_9196 ?AUTO_9197 )
      ( MAKE-ON-VERIFY ?AUTO_9196 ?AUTO_9197 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9202 - BLOCK
      ?AUTO_9203 - BLOCK
    )
    :vars
    (
      ?AUTO_9206 - BLOCK
      ?AUTO_9204 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_9202 ) ( CLEAR ?AUTO_9202 ) ( ON ?AUTO_9206 ?AUTO_9203 ) ( ON ?AUTO_9204 ?AUTO_9206 ) ( CLEAR ?AUTO_9204 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_9204 ?AUTO_9206 )
      ( MAKE-ON ?AUTO_9202 ?AUTO_9203 )
      ( MAKE-ON-VERIFY ?AUTO_9202 ?AUTO_9203 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9210 - BLOCK
      ?AUTO_9211 - BLOCK
    )
    :vars
    (
      ?AUTO_9215 - BLOCK
      ?AUTO_9212 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_9215 ?AUTO_9211 ) ( ON ?AUTO_9212 ?AUTO_9215 ) ( CLEAR ?AUTO_9212 ) ( HOLDING ?AUTO_9210 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_9210 )
      ( MAKE-ON ?AUTO_9210 ?AUTO_9211 )
      ( MAKE-ON-VERIFY ?AUTO_9210 ?AUTO_9211 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9217 - BLOCK
      ?AUTO_9218 - BLOCK
    )
    :vars
    (
      ?AUTO_9221 - BLOCK
      ?AUTO_9222 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_9221 ?AUTO_9218 ) ( ON ?AUTO_9222 ?AUTO_9221 ) ( ON ?AUTO_9217 ?AUTO_9222 ) ( CLEAR ?AUTO_9217 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_9217 ?AUTO_9222 )
      ( MAKE-ON ?AUTO_9217 ?AUTO_9218 )
      ( MAKE-ON-VERIFY ?AUTO_9217 ?AUTO_9218 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9225 - BLOCK
      ?AUTO_9226 - BLOCK
    )
    :vars
    (
      ?AUTO_9228 - BLOCK
      ?AUTO_9230 - BLOCK
      ?AUTO_9231 - BLOCK
      ?AUTO_9232 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_9228 ?AUTO_9226 ) ( ON ?AUTO_9230 ?AUTO_9228 ) ( ON ?AUTO_9225 ?AUTO_9230 ) ( CLEAR ?AUTO_9225 ) ( HOLDING ?AUTO_9231 ) ( CLEAR ?AUTO_9232 ) )
    :subtasks
    ( ( !STACK ?AUTO_9231 ?AUTO_9232 )
      ( MAKE-ON ?AUTO_9225 ?AUTO_9226 )
      ( MAKE-ON-VERIFY ?AUTO_9225 ?AUTO_9226 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9237 - BLOCK
      ?AUTO_9238 - BLOCK
    )
    :vars
    (
      ?AUTO_9242 - BLOCK
      ?AUTO_9239 - BLOCK
      ?AUTO_9244 - BLOCK
      ?AUTO_9241 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_9242 ?AUTO_9238 ) ( ON ?AUTO_9239 ?AUTO_9242 ) ( ON ?AUTO_9237 ?AUTO_9239 ) ( CLEAR ?AUTO_9244 ) ( ON ?AUTO_9241 ?AUTO_9237 ) ( CLEAR ?AUTO_9241 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_9241 ?AUTO_9237 )
      ( MAKE-ON ?AUTO_9237 ?AUTO_9238 )
      ( MAKE-ON-VERIFY ?AUTO_9237 ?AUTO_9238 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9247 - BLOCK
      ?AUTO_9248 - BLOCK
    )
    :vars
    (
      ?AUTO_9253 - BLOCK
      ?AUTO_9251 - BLOCK
      ?AUTO_9254 - BLOCK
      ?AUTO_9252 - BLOCK
      ?AUTO_9255 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_9253 ?AUTO_9248 ) ( ON ?AUTO_9251 ?AUTO_9253 ) ( ON ?AUTO_9247 ?AUTO_9251 ) ( CLEAR ?AUTO_9254 ) ( ON ?AUTO_9252 ?AUTO_9247 ) ( CLEAR ?AUTO_9252 ) ( HOLDING ?AUTO_9255 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_9255 )
      ( MAKE-ON ?AUTO_9247 ?AUTO_9248 )
      ( MAKE-ON-VERIFY ?AUTO_9247 ?AUTO_9248 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9268 - BLOCK
      ?AUTO_9269 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_9268 ) ( CLEAR ?AUTO_9269 ) )
    :subtasks
    ( ( !STACK ?AUTO_9268 ?AUTO_9269 )
      ( MAKE-ON-VERIFY ?AUTO_9268 ?AUTO_9269 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9272 - BLOCK
      ?AUTO_9273 - BLOCK
    )
    :vars
    (
      ?AUTO_9277 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_9273 ) ( ON ?AUTO_9272 ?AUTO_9277 ) ( CLEAR ?AUTO_9272 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_9272 ?AUTO_9277 )
      ( MAKE-ON ?AUTO_9272 ?AUTO_9273 )
      ( MAKE-ON-VERIFY ?AUTO_9272 ?AUTO_9273 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9278 - BLOCK
      ?AUTO_9279 - BLOCK
    )
    :vars
    (
      ?AUTO_9282 - BLOCK
      ?AUTO_9283 - BLOCK
      ?AUTO_9284 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_9279 ) ( ON ?AUTO_9278 ?AUTO_9282 ) ( CLEAR ?AUTO_9278 ) ( HOLDING ?AUTO_9283 ) ( CLEAR ?AUTO_9284 ) )
    :subtasks
    ( ( !STACK ?AUTO_9283 ?AUTO_9284 )
      ( MAKE-ON ?AUTO_9278 ?AUTO_9279 )
      ( MAKE-ON-VERIFY ?AUTO_9278 ?AUTO_9279 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9291 - BLOCK
      ?AUTO_9292 - BLOCK
    )
    :vars
    (
      ?AUTO_9293 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_9291 ?AUTO_9293 ) ( CLEAR ?AUTO_9291 ) ( HOLDING ?AUTO_9292 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_9292 )
      ( MAKE-ON ?AUTO_9291 ?AUTO_9292 )
      ( MAKE-ON-VERIFY ?AUTO_9291 ?AUTO_9292 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9301 - BLOCK
      ?AUTO_9302 - BLOCK
    )
    :vars
    (
      ?AUTO_9305 - BLOCK
      ?AUTO_9307 - BLOCK
      ?AUTO_9306 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_9301 ?AUTO_9305 ) ( CLEAR ?AUTO_9301 ) ( CLEAR ?AUTO_9307 ) ( ON ?AUTO_9306 ?AUTO_9302 ) ( CLEAR ?AUTO_9306 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_9306 ?AUTO_9302 )
      ( MAKE-ON ?AUTO_9301 ?AUTO_9302 )
      ( MAKE-ON-VERIFY ?AUTO_9301 ?AUTO_9302 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9310 - BLOCK
      ?AUTO_9311 - BLOCK
    )
    :vars
    (
      ?AUTO_9315 - BLOCK
      ?AUTO_9314 - BLOCK
      ?AUTO_9316 - BLOCK
      ?AUTO_9317 - BLOCK
      ?AUTO_9318 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_9310 ?AUTO_9315 ) ( CLEAR ?AUTO_9310 ) ( CLEAR ?AUTO_9314 ) ( ON ?AUTO_9316 ?AUTO_9311 ) ( CLEAR ?AUTO_9316 ) ( HOLDING ?AUTO_9317 ) ( CLEAR ?AUTO_9318 ) )
    :subtasks
    ( ( !STACK ?AUTO_9317 ?AUTO_9318 )
      ( MAKE-ON ?AUTO_9310 ?AUTO_9311 )
      ( MAKE-ON-VERIFY ?AUTO_9310 ?AUTO_9311 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9321 - BLOCK
      ?AUTO_9322 - BLOCK
    )
    :vars
    (
      ?AUTO_9323 - BLOCK
      ?AUTO_9327 - BLOCK
      ?AUTO_9326 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_9323 ) ( ON ?AUTO_9327 ?AUTO_9322 ) ( CLEAR ?AUTO_9327 ) ( HOLDING ?AUTO_9321 ) ( CLEAR ?AUTO_9326 ) )
    :subtasks
    ( ( !STACK ?AUTO_9321 ?AUTO_9326 )
      ( MAKE-ON ?AUTO_9321 ?AUTO_9322 )
      ( MAKE-ON-VERIFY ?AUTO_9321 ?AUTO_9322 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9330 - BLOCK
      ?AUTO_9331 - BLOCK
    )
    :vars
    (
      ?AUTO_9335 - BLOCK
      ?AUTO_9336 - BLOCK
      ?AUTO_9334 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_9335 ) ( ON ?AUTO_9336 ?AUTO_9331 ) ( CLEAR ?AUTO_9334 ) ( ON ?AUTO_9330 ?AUTO_9336 ) ( CLEAR ?AUTO_9330 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_9330 ?AUTO_9336 )
      ( MAKE-ON ?AUTO_9330 ?AUTO_9331 )
      ( MAKE-ON-VERIFY ?AUTO_9330 ?AUTO_9331 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9339 - BLOCK
      ?AUTO_9340 - BLOCK
    )
    :vars
    (
      ?AUTO_9344 - BLOCK
      ?AUTO_9345 - BLOCK
      ?AUTO_9341 - BLOCK
      ?AUTO_9346 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_9344 ) ( ON ?AUTO_9345 ?AUTO_9340 ) ( CLEAR ?AUTO_9341 ) ( ON ?AUTO_9339 ?AUTO_9345 ) ( CLEAR ?AUTO_9339 ) ( HOLDING ?AUTO_9346 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_9346 )
      ( MAKE-ON ?AUTO_9339 ?AUTO_9340 )
      ( MAKE-ON-VERIFY ?AUTO_9339 ?AUTO_9340 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9359 - BLOCK
      ?AUTO_9360 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_9359 ) ( CLEAR ?AUTO_9360 ) )
    :subtasks
    ( ( !STACK ?AUTO_9359 ?AUTO_9360 )
      ( MAKE-ON-VERIFY ?AUTO_9359 ?AUTO_9360 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9363 - BLOCK
      ?AUTO_9364 - BLOCK
    )
    :vars
    (
      ?AUTO_9368 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_9364 ) ( ON ?AUTO_9363 ?AUTO_9368 ) ( CLEAR ?AUTO_9363 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_9363 ?AUTO_9368 )
      ( MAKE-ON ?AUTO_9363 ?AUTO_9364 )
      ( MAKE-ON-VERIFY ?AUTO_9363 ?AUTO_9364 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9369 - BLOCK
      ?AUTO_9370 - BLOCK
    )
    :vars
    (
      ?AUTO_9373 - BLOCK
      ?AUTO_9374 - BLOCK
      ?AUTO_9375 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_9370 ) ( ON ?AUTO_9369 ?AUTO_9373 ) ( CLEAR ?AUTO_9369 ) ( HOLDING ?AUTO_9374 ) ( CLEAR ?AUTO_9375 ) )
    :subtasks
    ( ( !STACK ?AUTO_9374 ?AUTO_9375 )
      ( MAKE-ON ?AUTO_9369 ?AUTO_9370 )
      ( MAKE-ON-VERIFY ?AUTO_9369 ?AUTO_9370 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9376 - BLOCK
      ?AUTO_9377 - BLOCK
    )
    :vars
    (
      ?AUTO_9380 - BLOCK
      ?AUTO_9382 - BLOCK
      ?AUTO_9381 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_9377 ) ( ON ?AUTO_9376 ?AUTO_9380 ) ( CLEAR ?AUTO_9382 ) ( ON ?AUTO_9381 ?AUTO_9376 ) ( CLEAR ?AUTO_9381 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_9381 ?AUTO_9376 )
      ( MAKE-ON ?AUTO_9376 ?AUTO_9377 )
      ( MAKE-ON-VERIFY ?AUTO_9376 ?AUTO_9377 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9385 - BLOCK
      ?AUTO_9386 - BLOCK
    )
    :vars
    (
      ?AUTO_9391 - BLOCK
      ?AUTO_9388 - BLOCK
      ?AUTO_9387 - BLOCK
      ?AUTO_9392 - BLOCK
      ?AUTO_9393 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_9386 ) ( ON ?AUTO_9385 ?AUTO_9391 ) ( CLEAR ?AUTO_9388 ) ( ON ?AUTO_9387 ?AUTO_9385 ) ( CLEAR ?AUTO_9387 ) ( HOLDING ?AUTO_9392 ) ( CLEAR ?AUTO_9393 ) )
    :subtasks
    ( ( !STACK ?AUTO_9392 ?AUTO_9393 )
      ( MAKE-ON ?AUTO_9385 ?AUTO_9386 )
      ( MAKE-ON-VERIFY ?AUTO_9385 ?AUTO_9386 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9396 - BLOCK
      ?AUTO_9397 - BLOCK
    )
    :vars
    (
      ?AUTO_9402 - BLOCK
      ?AUTO_9399 - BLOCK
      ?AUTO_9400 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_9396 ?AUTO_9402 ) ( CLEAR ?AUTO_9399 ) ( ON ?AUTO_9400 ?AUTO_9396 ) ( CLEAR ?AUTO_9400 ) ( HOLDING ?AUTO_9397 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_9397 )
      ( MAKE-ON ?AUTO_9396 ?AUTO_9397 )
      ( MAKE-ON-VERIFY ?AUTO_9396 ?AUTO_9397 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9408 - BLOCK
      ?AUTO_9409 - BLOCK
    )
    :vars
    (
      ?AUTO_9416 - BLOCK
      ?AUTO_9412 - BLOCK
      ?AUTO_9415 - BLOCK
      ?AUTO_9414 - BLOCK
      ?AUTO_9413 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_9408 ?AUTO_9416 ) ( CLEAR ?AUTO_9412 ) ( ON ?AUTO_9415 ?AUTO_9408 ) ( CLEAR ?AUTO_9415 ) ( CLEAR ?AUTO_9414 ) ( ON ?AUTO_9413 ?AUTO_9409 ) ( CLEAR ?AUTO_9413 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_9413 ?AUTO_9409 )
      ( MAKE-ON ?AUTO_9408 ?AUTO_9409 )
      ( MAKE-ON-VERIFY ?AUTO_9408 ?AUTO_9409 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9419 - BLOCK
      ?AUTO_9420 - BLOCK
    )
    :vars
    (
      ?AUTO_9424 - BLOCK
      ?AUTO_9427 - BLOCK
      ?AUTO_9423 - BLOCK
      ?AUTO_9426 - BLOCK
      ?AUTO_9425 - BLOCK
      ?AUTO_9428 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_9419 ?AUTO_9424 ) ( CLEAR ?AUTO_9427 ) ( ON ?AUTO_9423 ?AUTO_9419 ) ( CLEAR ?AUTO_9423 ) ( CLEAR ?AUTO_9426 ) ( ON ?AUTO_9425 ?AUTO_9420 ) ( CLEAR ?AUTO_9425 ) ( HOLDING ?AUTO_9428 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_9428 )
      ( MAKE-ON ?AUTO_9419 ?AUTO_9420 )
      ( MAKE-ON-VERIFY ?AUTO_9419 ?AUTO_9420 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9429 - BLOCK
      ?AUTO_9430 - BLOCK
    )
    :vars
    (
      ?AUTO_9432 - BLOCK
      ?AUTO_9438 - BLOCK
      ?AUTO_9431 - BLOCK
      ?AUTO_9437 - BLOCK
      ?AUTO_9436 - BLOCK
      ?AUTO_9433 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_9429 ?AUTO_9432 ) ( CLEAR ?AUTO_9438 ) ( ON ?AUTO_9431 ?AUTO_9429 ) ( CLEAR ?AUTO_9431 ) ( CLEAR ?AUTO_9437 ) ( ON ?AUTO_9436 ?AUTO_9430 ) ( ON ?AUTO_9433 ?AUTO_9436 ) ( CLEAR ?AUTO_9433 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_9433 ?AUTO_9436 )
      ( MAKE-ON ?AUTO_9429 ?AUTO_9430 )
      ( MAKE-ON-VERIFY ?AUTO_9429 ?AUTO_9430 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9441 - BLOCK
      ?AUTO_9442 - BLOCK
    )
    :vars
    (
      ?AUTO_9445 - BLOCK
      ?AUTO_9446 - BLOCK
      ?AUTO_9444 - BLOCK
      ?AUTO_9448 - BLOCK
      ?AUTO_9447 - BLOCK
      ?AUTO_9450 - BLOCK
      ?AUTO_9451 - BLOCK
      ?AUTO_9452 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_9441 ?AUTO_9445 ) ( CLEAR ?AUTO_9446 ) ( ON ?AUTO_9444 ?AUTO_9441 ) ( CLEAR ?AUTO_9444 ) ( CLEAR ?AUTO_9448 ) ( ON ?AUTO_9447 ?AUTO_9442 ) ( ON ?AUTO_9450 ?AUTO_9447 ) ( CLEAR ?AUTO_9450 ) ( HOLDING ?AUTO_9451 ) ( CLEAR ?AUTO_9452 ) )
    :subtasks
    ( ( !STACK ?AUTO_9451 ?AUTO_9452 )
      ( MAKE-ON ?AUTO_9441 ?AUTO_9442 )
      ( MAKE-ON-VERIFY ?AUTO_9441 ?AUTO_9442 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9455 - BLOCK
      ?AUTO_9456 - BLOCK
    )
    :vars
    (
      ?AUTO_9461 - BLOCK
      ?AUTO_9459 - BLOCK
      ?AUTO_9462 - BLOCK
      ?AUTO_9464 - BLOCK
      ?AUTO_9458 - BLOCK
      ?AUTO_9460 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_9455 ?AUTO_9461 ) ( CLEAR ?AUTO_9459 ) ( CLEAR ?AUTO_9462 ) ( ON ?AUTO_9464 ?AUTO_9456 ) ( ON ?AUTO_9458 ?AUTO_9464 ) ( CLEAR ?AUTO_9458 ) ( HOLDING ?AUTO_9460 ) ( CLEAR ?AUTO_9455 ) )
    :subtasks
    ( ( !STACK ?AUTO_9460 ?AUTO_9455 )
      ( MAKE-ON ?AUTO_9455 ?AUTO_9456 )
      ( MAKE-ON-VERIFY ?AUTO_9455 ?AUTO_9456 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9467 - BLOCK
      ?AUTO_9468 - BLOCK
    )
    :vars
    (
      ?AUTO_9476 - BLOCK
      ?AUTO_9469 - BLOCK
      ?AUTO_9473 - BLOCK
      ?AUTO_9472 - BLOCK
      ?AUTO_9471 - BLOCK
      ?AUTO_9470 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_9467 ?AUTO_9476 ) ( CLEAR ?AUTO_9469 ) ( CLEAR ?AUTO_9473 ) ( ON ?AUTO_9472 ?AUTO_9468 ) ( ON ?AUTO_9471 ?AUTO_9472 ) ( CLEAR ?AUTO_9467 ) ( ON ?AUTO_9470 ?AUTO_9471 ) ( CLEAR ?AUTO_9470 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_9470 ?AUTO_9471 )
      ( MAKE-ON ?AUTO_9467 ?AUTO_9468 )
      ( MAKE-ON-VERIFY ?AUTO_9467 ?AUTO_9468 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9479 - BLOCK
      ?AUTO_9480 - BLOCK
    )
    :vars
    (
      ?AUTO_9485 - BLOCK
      ?AUTO_9481 - BLOCK
      ?AUTO_9488 - BLOCK
      ?AUTO_9482 - BLOCK
      ?AUTO_9483 - BLOCK
      ?AUTO_9487 - BLOCK
      ?AUTO_9489 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_9479 ?AUTO_9485 ) ( CLEAR ?AUTO_9481 ) ( CLEAR ?AUTO_9488 ) ( ON ?AUTO_9482 ?AUTO_9480 ) ( ON ?AUTO_9483 ?AUTO_9482 ) ( CLEAR ?AUTO_9479 ) ( ON ?AUTO_9487 ?AUTO_9483 ) ( CLEAR ?AUTO_9487 ) ( HOLDING ?AUTO_9489 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_9489 )
      ( MAKE-ON ?AUTO_9479 ?AUTO_9480 )
      ( MAKE-ON-VERIFY ?AUTO_9479 ?AUTO_9480 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9490 - BLOCK
      ?AUTO_9491 - BLOCK
    )
    :vars
    (
      ?AUTO_9492 - BLOCK
      ?AUTO_9498 - BLOCK
      ?AUTO_9497 - BLOCK
      ?AUTO_9494 - BLOCK
      ?AUTO_9500 - BLOCK
      ?AUTO_9493 - BLOCK
      ?AUTO_9499 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_9490 ?AUTO_9492 ) ( CLEAR ?AUTO_9498 ) ( CLEAR ?AUTO_9497 ) ( ON ?AUTO_9494 ?AUTO_9491 ) ( ON ?AUTO_9500 ?AUTO_9494 ) ( ON ?AUTO_9493 ?AUTO_9500 ) ( CLEAR ?AUTO_9493 ) ( ON ?AUTO_9499 ?AUTO_9490 ) ( CLEAR ?AUTO_9499 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_9499 ?AUTO_9490 )
      ( MAKE-ON ?AUTO_9490 ?AUTO_9491 )
      ( MAKE-ON-VERIFY ?AUTO_9490 ?AUTO_9491 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9503 - BLOCK
      ?AUTO_9504 - BLOCK
    )
    :vars
    (
      ?AUTO_9513 - BLOCK
      ?AUTO_9511 - BLOCK
      ?AUTO_9506 - BLOCK
      ?AUTO_9509 - BLOCK
      ?AUTO_9512 - BLOCK
      ?AUTO_9507 - BLOCK
      ?AUTO_9510 - BLOCK
      ?AUTO_9514 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_9503 ?AUTO_9513 ) ( CLEAR ?AUTO_9511 ) ( CLEAR ?AUTO_9506 ) ( ON ?AUTO_9509 ?AUTO_9504 ) ( ON ?AUTO_9512 ?AUTO_9509 ) ( ON ?AUTO_9507 ?AUTO_9512 ) ( CLEAR ?AUTO_9507 ) ( ON ?AUTO_9510 ?AUTO_9503 ) ( CLEAR ?AUTO_9510 ) ( HOLDING ?AUTO_9514 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_9514 )
      ( MAKE-ON ?AUTO_9503 ?AUTO_9504 )
      ( MAKE-ON-VERIFY ?AUTO_9503 ?AUTO_9504 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9515 - BLOCK
      ?AUTO_9516 - BLOCK
    )
    :vars
    (
      ?AUTO_9523 - BLOCK
      ?AUTO_9520 - BLOCK
      ?AUTO_9519 - BLOCK
      ?AUTO_9517 - BLOCK
      ?AUTO_9518 - BLOCK
      ?AUTO_9525 - BLOCK
      ?AUTO_9524 - BLOCK
      ?AUTO_9526 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_9515 ?AUTO_9523 ) ( CLEAR ?AUTO_9520 ) ( CLEAR ?AUTO_9519 ) ( ON ?AUTO_9517 ?AUTO_9516 ) ( ON ?AUTO_9518 ?AUTO_9517 ) ( ON ?AUTO_9525 ?AUTO_9518 ) ( CLEAR ?AUTO_9525 ) ( ON ?AUTO_9524 ?AUTO_9515 ) ( ON ?AUTO_9526 ?AUTO_9524 ) ( CLEAR ?AUTO_9526 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_9526 ?AUTO_9524 )
      ( MAKE-ON ?AUTO_9515 ?AUTO_9516 )
      ( MAKE-ON-VERIFY ?AUTO_9515 ?AUTO_9516 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9529 - BLOCK
      ?AUTO_9530 - BLOCK
    )
    :vars
    (
      ?AUTO_9540 - BLOCK
      ?AUTO_9536 - BLOCK
      ?AUTO_9533 - BLOCK
      ?AUTO_9534 - BLOCK
      ?AUTO_9539 - BLOCK
      ?AUTO_9535 - BLOCK
      ?AUTO_9538 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_9529 ?AUTO_9540 ) ( ON ?AUTO_9536 ?AUTO_9530 ) ( ON ?AUTO_9533 ?AUTO_9536 ) ( ON ?AUTO_9534 ?AUTO_9533 ) ( CLEAR ?AUTO_9534 ) ( ON ?AUTO_9539 ?AUTO_9529 ) ( ON ?AUTO_9535 ?AUTO_9539 ) ( CLEAR ?AUTO_9535 ) ( HOLDING ?AUTO_9538 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_9538 )
      ( MAKE-ON ?AUTO_9529 ?AUTO_9530 )
      ( MAKE-ON-VERIFY ?AUTO_9529 ?AUTO_9530 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9542 - BLOCK
      ?AUTO_9543 - BLOCK
    )
    :vars
    (
      ?AUTO_9549 - BLOCK
      ?AUTO_9552 - BLOCK
      ?AUTO_9548 - BLOCK
      ?AUTO_9545 - BLOCK
      ?AUTO_9547 - BLOCK
      ?AUTO_9551 - BLOCK
      ?AUTO_9544 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_9542 ?AUTO_9549 ) ( ON ?AUTO_9552 ?AUTO_9543 ) ( ON ?AUTO_9548 ?AUTO_9552 ) ( ON ?AUTO_9545 ?AUTO_9548 ) ( CLEAR ?AUTO_9545 ) ( ON ?AUTO_9547 ?AUTO_9542 ) ( ON ?AUTO_9551 ?AUTO_9547 ) ( ON ?AUTO_9544 ?AUTO_9551 ) ( CLEAR ?AUTO_9544 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_9544 ?AUTO_9551 )
      ( MAKE-ON ?AUTO_9542 ?AUTO_9543 )
      ( MAKE-ON-VERIFY ?AUTO_9542 ?AUTO_9543 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9557 - BLOCK
      ?AUTO_9558 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_9557 ) ( CLEAR ?AUTO_9558 ) )
    :subtasks
    ( ( !STACK ?AUTO_9557 ?AUTO_9558 )
      ( MAKE-ON-VERIFY ?AUTO_9557 ?AUTO_9558 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9561 - BLOCK
      ?AUTO_9562 - BLOCK
    )
    :vars
    (
      ?AUTO_9566 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_9562 ) ( ON ?AUTO_9561 ?AUTO_9566 ) ( CLEAR ?AUTO_9561 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_9561 ?AUTO_9566 )
      ( MAKE-ON ?AUTO_9561 ?AUTO_9562 )
      ( MAKE-ON-VERIFY ?AUTO_9561 ?AUTO_9562 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9567 - BLOCK
      ?AUTO_9568 - BLOCK
    )
    :vars
    (
      ?AUTO_9571 - BLOCK
      ?AUTO_9573 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_9567 ?AUTO_9571 ) ( CLEAR ?AUTO_9567 ) ( HOLDING ?AUTO_9568 ) ( CLEAR ?AUTO_9573 ) )
    :subtasks
    ( ( !STACK ?AUTO_9568 ?AUTO_9573 )
      ( MAKE-ON ?AUTO_9567 ?AUTO_9568 )
      ( MAKE-ON-VERIFY ?AUTO_9567 ?AUTO_9568 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_9690 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_9690 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_9690 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_9690 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_9692 - BLOCK
    )
    :vars
    (
      ?AUTO_9695 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_9692 ?AUTO_9695 ) ( CLEAR ?AUTO_9692 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_9692 ?AUTO_9695 )
      ( MAKE-ON-TABLE ?AUTO_9692 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_9692 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_9696 - BLOCK
    )
    :vars
    (
      ?AUTO_9698 - BLOCK
      ?AUTO_9699 - BLOCK
      ?AUTO_9700 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_9696 ?AUTO_9698 ) ( CLEAR ?AUTO_9696 ) ( HOLDING ?AUTO_9699 ) ( CLEAR ?AUTO_9700 ) )
    :subtasks
    ( ( !STACK ?AUTO_9699 ?AUTO_9700 )
      ( MAKE-ON-TABLE ?AUTO_9696 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_9696 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9750 - BLOCK
      ?AUTO_9751 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_9750 ) ( CLEAR ?AUTO_9751 ) )
    :subtasks
    ( ( !STACK ?AUTO_9750 ?AUTO_9751 )
      ( MAKE-ON-VERIFY ?AUTO_9750 ?AUTO_9751 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9754 - BLOCK
      ?AUTO_9755 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_9755 ) ( ON-TABLE ?AUTO_9754 ) ( CLEAR ?AUTO_9754 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_9754 )
      ( MAKE-ON ?AUTO_9754 ?AUTO_9755 )
      ( MAKE-ON-VERIFY ?AUTO_9754 ?AUTO_9755 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9759 - BLOCK
      ?AUTO_9760 - BLOCK
    )
    :vars
    (
      ?AUTO_9763 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_9760 ) ( ON-TABLE ?AUTO_9759 ) ( CLEAR ?AUTO_9759 ) ( HOLDING ?AUTO_9763 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_9763 )
      ( MAKE-ON ?AUTO_9759 ?AUTO_9760 )
      ( MAKE-ON-VERIFY ?AUTO_9759 ?AUTO_9760 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9764 - BLOCK
      ?AUTO_9765 - BLOCK
    )
    :vars
    (
      ?AUTO_9768 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_9765 ) ( ON-TABLE ?AUTO_9764 ) ( ON ?AUTO_9768 ?AUTO_9764 ) ( CLEAR ?AUTO_9768 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_9768 ?AUTO_9764 )
      ( MAKE-ON ?AUTO_9764 ?AUTO_9765 )
      ( MAKE-ON-VERIFY ?AUTO_9764 ?AUTO_9765 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9771 - BLOCK
      ?AUTO_9772 - BLOCK
    )
    :vars
    (
      ?AUTO_9774 - BLOCK
      ?AUTO_9776 - BLOCK
      ?AUTO_9777 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_9772 ) ( ON-TABLE ?AUTO_9771 ) ( ON ?AUTO_9774 ?AUTO_9771 ) ( CLEAR ?AUTO_9774 ) ( HOLDING ?AUTO_9776 ) ( CLEAR ?AUTO_9777 ) )
    :subtasks
    ( ( !STACK ?AUTO_9776 ?AUTO_9777 )
      ( MAKE-ON ?AUTO_9771 ?AUTO_9772 )
      ( MAKE-ON-VERIFY ?AUTO_9771 ?AUTO_9772 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9782 - BLOCK
      ?AUTO_9783 - BLOCK
    )
    :vars
    (
      ?AUTO_9787 - BLOCK
      ?AUTO_9788 - BLOCK
      ?AUTO_9785 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_9782 ) ( ON ?AUTO_9787 ?AUTO_9782 ) ( CLEAR ?AUTO_9787 ) ( CLEAR ?AUTO_9788 ) ( ON ?AUTO_9785 ?AUTO_9783 ) ( CLEAR ?AUTO_9785 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_9785 ?AUTO_9783 )
      ( MAKE-ON ?AUTO_9782 ?AUTO_9783 )
      ( MAKE-ON-VERIFY ?AUTO_9782 ?AUTO_9783 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9791 - BLOCK
      ?AUTO_9792 - BLOCK
    )
    :vars
    (
      ?AUTO_9797 - BLOCK
      ?AUTO_9796 - BLOCK
      ?AUTO_9795 - BLOCK
      ?AUTO_9798 - BLOCK
      ?AUTO_9799 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_9791 ) ( ON ?AUTO_9797 ?AUTO_9791 ) ( CLEAR ?AUTO_9797 ) ( CLEAR ?AUTO_9796 ) ( ON ?AUTO_9795 ?AUTO_9792 ) ( CLEAR ?AUTO_9795 ) ( HOLDING ?AUTO_9798 ) ( CLEAR ?AUTO_9799 ) )
    :subtasks
    ( ( !STACK ?AUTO_9798 ?AUTO_9799 )
      ( MAKE-ON ?AUTO_9791 ?AUTO_9792 )
      ( MAKE-ON-VERIFY ?AUTO_9791 ?AUTO_9792 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9800 - BLOCK
      ?AUTO_9801 - BLOCK
    )
    :vars
    (
      ?AUTO_9807 - BLOCK
      ?AUTO_9802 - BLOCK
      ?AUTO_9808 - BLOCK
      ?AUTO_9804 - BLOCK
      ?AUTO_9803 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_9800 ) ( ON ?AUTO_9807 ?AUTO_9800 ) ( CLEAR ?AUTO_9807 ) ( CLEAR ?AUTO_9802 ) ( ON ?AUTO_9808 ?AUTO_9801 ) ( CLEAR ?AUTO_9804 ) ( ON ?AUTO_9803 ?AUTO_9808 ) ( CLEAR ?AUTO_9803 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_9803 ?AUTO_9808 )
      ( MAKE-ON ?AUTO_9800 ?AUTO_9801 )
      ( MAKE-ON-VERIFY ?AUTO_9800 ?AUTO_9801 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9811 - BLOCK
      ?AUTO_9812 - BLOCK
    )
    :vars
    (
      ?AUTO_9815 - BLOCK
      ?AUTO_9816 - BLOCK
      ?AUTO_9819 - BLOCK
      ?AUTO_9817 - BLOCK
      ?AUTO_9818 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_9811 ) ( CLEAR ?AUTO_9815 ) ( ON ?AUTO_9816 ?AUTO_9812 ) ( CLEAR ?AUTO_9819 ) ( ON ?AUTO_9817 ?AUTO_9816 ) ( CLEAR ?AUTO_9817 ) ( HOLDING ?AUTO_9818 ) ( CLEAR ?AUTO_9811 ) )
    :subtasks
    ( ( !STACK ?AUTO_9818 ?AUTO_9811 )
      ( MAKE-ON ?AUTO_9811 ?AUTO_9812 )
      ( MAKE-ON-VERIFY ?AUTO_9811 ?AUTO_9812 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9822 - BLOCK
      ?AUTO_9823 - BLOCK
    )
    :vars
    (
      ?AUTO_9827 - BLOCK
      ?AUTO_9824 - BLOCK
      ?AUTO_9825 - BLOCK
      ?AUTO_9828 - BLOCK
      ?AUTO_9826 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_9822 ) ( CLEAR ?AUTO_9827 ) ( ON ?AUTO_9824 ?AUTO_9823 ) ( CLEAR ?AUTO_9825 ) ( ON ?AUTO_9828 ?AUTO_9824 ) ( CLEAR ?AUTO_9828 ) ( CLEAR ?AUTO_9822 ) ( ON-TABLE ?AUTO_9826 ) ( CLEAR ?AUTO_9826 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_9826 )
      ( MAKE-ON ?AUTO_9822 ?AUTO_9823 )
      ( MAKE-ON-VERIFY ?AUTO_9822 ?AUTO_9823 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9836 - BLOCK
      ?AUTO_9837 - BLOCK
    )
    :vars
    (
      ?AUTO_9841 - BLOCK
      ?AUTO_9840 - BLOCK
      ?AUTO_9838 - BLOCK
      ?AUTO_9842 - BLOCK
      ?AUTO_9839 - BLOCK
      ?AUTO_9845 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_9836 ) ( ON ?AUTO_9841 ?AUTO_9836 ) ( CLEAR ?AUTO_9841 ) ( CLEAR ?AUTO_9840 ) ( ON ?AUTO_9838 ?AUTO_9837 ) ( CLEAR ?AUTO_9842 ) ( ON ?AUTO_9839 ?AUTO_9838 ) ( CLEAR ?AUTO_9839 ) ( HOLDING ?AUTO_9845 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_9845 )
      ( MAKE-ON ?AUTO_9836 ?AUTO_9837 )
      ( MAKE-ON-VERIFY ?AUTO_9836 ?AUTO_9837 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9846 - BLOCK
      ?AUTO_9847 - BLOCK
    )
    :vars
    (
      ?AUTO_9849 - BLOCK
      ?AUTO_9848 - BLOCK
      ?AUTO_9852 - BLOCK
      ?AUTO_9851 - BLOCK
      ?AUTO_9853 - BLOCK
      ?AUTO_9854 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_9846 ) ( ON ?AUTO_9849 ?AUTO_9846 ) ( CLEAR ?AUTO_9848 ) ( ON ?AUTO_9852 ?AUTO_9847 ) ( CLEAR ?AUTO_9851 ) ( ON ?AUTO_9853 ?AUTO_9852 ) ( CLEAR ?AUTO_9853 ) ( ON ?AUTO_9854 ?AUTO_9849 ) ( CLEAR ?AUTO_9854 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_9854 ?AUTO_9849 )
      ( MAKE-ON ?AUTO_9846 ?AUTO_9847 )
      ( MAKE-ON-VERIFY ?AUTO_9846 ?AUTO_9847 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9858 - BLOCK
      ?AUTO_9859 - BLOCK
    )
    :vars
    (
      ?AUTO_9864 - BLOCK
      ?AUTO_9866 - BLOCK
      ?AUTO_9860 - BLOCK
      ?AUTO_9865 - BLOCK
      ?AUTO_9862 - BLOCK
      ?AUTO_9867 - BLOCK
      ?AUTO_9868 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_9858 ) ( ON ?AUTO_9864 ?AUTO_9858 ) ( CLEAR ?AUTO_9866 ) ( ON ?AUTO_9860 ?AUTO_9859 ) ( CLEAR ?AUTO_9865 ) ( ON ?AUTO_9862 ?AUTO_9860 ) ( CLEAR ?AUTO_9862 ) ( ON ?AUTO_9867 ?AUTO_9864 ) ( CLEAR ?AUTO_9867 ) ( HOLDING ?AUTO_9868 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_9868 )
      ( MAKE-ON ?AUTO_9858 ?AUTO_9859 )
      ( MAKE-ON-VERIFY ?AUTO_9858 ?AUTO_9859 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9869 - BLOCK
      ?AUTO_9870 - BLOCK
    )
    :vars
    (
      ?AUTO_9877 - BLOCK
      ?AUTO_9878 - BLOCK
      ?AUTO_9871 - BLOCK
      ?AUTO_9872 - BLOCK
      ?AUTO_9875 - BLOCK
      ?AUTO_9876 - BLOCK
      ?AUTO_9879 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_9869 ) ( ON ?AUTO_9877 ?AUTO_9869 ) ( CLEAR ?AUTO_9878 ) ( ON ?AUTO_9871 ?AUTO_9870 ) ( CLEAR ?AUTO_9872 ) ( ON ?AUTO_9875 ?AUTO_9871 ) ( CLEAR ?AUTO_9875 ) ( ON ?AUTO_9876 ?AUTO_9877 ) ( ON ?AUTO_9879 ?AUTO_9876 ) ( CLEAR ?AUTO_9879 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_9879 ?AUTO_9876 )
      ( MAKE-ON ?AUTO_9869 ?AUTO_9870 )
      ( MAKE-ON-VERIFY ?AUTO_9869 ?AUTO_9870 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9882 - BLOCK
      ?AUTO_9883 - BLOCK
    )
    :vars
    (
      ?AUTO_9887 - BLOCK
      ?AUTO_9891 - BLOCK
      ?AUTO_9888 - BLOCK
      ?AUTO_9885 - BLOCK
      ?AUTO_9889 - BLOCK
      ?AUTO_9886 - BLOCK
      ?AUTO_9892 - BLOCK
      ?AUTO_9893 - BLOCK
      ?AUTO_9894 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_9882 ) ( ON ?AUTO_9887 ?AUTO_9882 ) ( CLEAR ?AUTO_9891 ) ( ON ?AUTO_9888 ?AUTO_9883 ) ( CLEAR ?AUTO_9885 ) ( ON ?AUTO_9889 ?AUTO_9888 ) ( CLEAR ?AUTO_9889 ) ( ON ?AUTO_9886 ?AUTO_9887 ) ( ON ?AUTO_9892 ?AUTO_9886 ) ( CLEAR ?AUTO_9892 ) ( HOLDING ?AUTO_9893 ) ( CLEAR ?AUTO_9894 ) )
    :subtasks
    ( ( !STACK ?AUTO_9893 ?AUTO_9894 )
      ( MAKE-ON ?AUTO_9882 ?AUTO_9883 )
      ( MAKE-ON-VERIFY ?AUTO_9882 ?AUTO_9883 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9897 - BLOCK
      ?AUTO_9898 - BLOCK
    )
    :vars
    (
      ?AUTO_9907 - BLOCK
      ?AUTO_9905 - BLOCK
      ?AUTO_9900 - BLOCK
      ?AUTO_9904 - BLOCK
      ?AUTO_9899 - BLOCK
      ?AUTO_9902 - BLOCK
      ?AUTO_9901 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_9897 ) ( ON ?AUTO_9907 ?AUTO_9897 ) ( CLEAR ?AUTO_9905 ) ( ON ?AUTO_9900 ?AUTO_9898 ) ( CLEAR ?AUTO_9904 ) ( ON ?AUTO_9899 ?AUTO_9907 ) ( ON ?AUTO_9902 ?AUTO_9899 ) ( CLEAR ?AUTO_9902 ) ( HOLDING ?AUTO_9901 ) ( CLEAR ?AUTO_9900 ) )
    :subtasks
    ( ( !STACK ?AUTO_9901 ?AUTO_9900 )
      ( MAKE-ON ?AUTO_9897 ?AUTO_9898 )
      ( MAKE-ON-VERIFY ?AUTO_9897 ?AUTO_9898 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9910 - BLOCK
      ?AUTO_9911 - BLOCK
    )
    :vars
    (
      ?AUTO_9915 - BLOCK
      ?AUTO_9914 - BLOCK
      ?AUTO_9917 - BLOCK
      ?AUTO_9913 - BLOCK
      ?AUTO_9916 - BLOCK
      ?AUTO_9920 - BLOCK
      ?AUTO_9912 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_9910 ) ( ON ?AUTO_9915 ?AUTO_9910 ) ( CLEAR ?AUTO_9914 ) ( ON ?AUTO_9917 ?AUTO_9911 ) ( CLEAR ?AUTO_9913 ) ( ON ?AUTO_9916 ?AUTO_9915 ) ( ON ?AUTO_9920 ?AUTO_9916 ) ( CLEAR ?AUTO_9917 ) ( ON ?AUTO_9912 ?AUTO_9920 ) ( CLEAR ?AUTO_9912 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_9912 ?AUTO_9920 )
      ( MAKE-ON ?AUTO_9910 ?AUTO_9911 )
      ( MAKE-ON-VERIFY ?AUTO_9910 ?AUTO_9911 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9923 - BLOCK
      ?AUTO_9924 - BLOCK
    )
    :vars
    (
      ?AUTO_9930 - BLOCK
      ?AUTO_9931 - BLOCK
      ?AUTO_9926 - BLOCK
      ?AUTO_9933 - BLOCK
      ?AUTO_9932 - BLOCK
      ?AUTO_9927 - BLOCK
      ?AUTO_9925 - BLOCK
      ?AUTO_9934 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_9923 ) ( ON ?AUTO_9930 ?AUTO_9923 ) ( CLEAR ?AUTO_9931 ) ( ON ?AUTO_9926 ?AUTO_9924 ) ( CLEAR ?AUTO_9933 ) ( ON ?AUTO_9932 ?AUTO_9930 ) ( ON ?AUTO_9927 ?AUTO_9932 ) ( CLEAR ?AUTO_9926 ) ( ON ?AUTO_9925 ?AUTO_9927 ) ( CLEAR ?AUTO_9925 ) ( HOLDING ?AUTO_9934 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_9934 )
      ( MAKE-ON ?AUTO_9923 ?AUTO_9924 )
      ( MAKE-ON-VERIFY ?AUTO_9923 ?AUTO_9924 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9935 - BLOCK
      ?AUTO_9936 - BLOCK
    )
    :vars
    (
      ?AUTO_9944 - BLOCK
      ?AUTO_9945 - BLOCK
      ?AUTO_9937 - BLOCK
      ?AUTO_9940 - BLOCK
      ?AUTO_9939 - BLOCK
      ?AUTO_9938 - BLOCK
      ?AUTO_9946 - BLOCK
      ?AUTO_9942 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_9935 ) ( ON ?AUTO_9944 ?AUTO_9935 ) ( CLEAR ?AUTO_9945 ) ( ON ?AUTO_9937 ?AUTO_9936 ) ( CLEAR ?AUTO_9940 ) ( ON ?AUTO_9939 ?AUTO_9944 ) ( ON ?AUTO_9938 ?AUTO_9939 ) ( ON ?AUTO_9946 ?AUTO_9938 ) ( CLEAR ?AUTO_9946 ) ( ON ?AUTO_9942 ?AUTO_9937 ) ( CLEAR ?AUTO_9942 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_9942 ?AUTO_9937 )
      ( MAKE-ON ?AUTO_9935 ?AUTO_9936 )
      ( MAKE-ON-VERIFY ?AUTO_9935 ?AUTO_9936 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9949 - BLOCK
      ?AUTO_9950 - BLOCK
    )
    :vars
    (
      ?AUTO_9953 - BLOCK
      ?AUTO_9960 - BLOCK
      ?AUTO_9957 - BLOCK
      ?AUTO_9955 - BLOCK
      ?AUTO_9952 - BLOCK
      ?AUTO_9951 - BLOCK
      ?AUTO_9958 - BLOCK
      ?AUTO_9959 - BLOCK
      ?AUTO_9961 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_9949 ) ( ON ?AUTO_9953 ?AUTO_9949 ) ( CLEAR ?AUTO_9960 ) ( ON ?AUTO_9957 ?AUTO_9950 ) ( CLEAR ?AUTO_9955 ) ( ON ?AUTO_9952 ?AUTO_9953 ) ( ON ?AUTO_9951 ?AUTO_9952 ) ( ON ?AUTO_9958 ?AUTO_9951 ) ( CLEAR ?AUTO_9958 ) ( ON ?AUTO_9959 ?AUTO_9957 ) ( CLEAR ?AUTO_9959 ) ( HOLDING ?AUTO_9961 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_9961 )
      ( MAKE-ON ?AUTO_9949 ?AUTO_9950 )
      ( MAKE-ON-VERIFY ?AUTO_9949 ?AUTO_9950 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9962 - BLOCK
      ?AUTO_9963 - BLOCK
    )
    :vars
    (
      ?AUTO_9970 - BLOCK
      ?AUTO_9972 - BLOCK
      ?AUTO_9973 - BLOCK
      ?AUTO_9964 - BLOCK
      ?AUTO_9967 - BLOCK
      ?AUTO_9966 - BLOCK
      ?AUTO_9965 - BLOCK
      ?AUTO_9968 - BLOCK
      ?AUTO_9974 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_9962 ) ( ON ?AUTO_9970 ?AUTO_9962 ) ( CLEAR ?AUTO_9972 ) ( ON ?AUTO_9973 ?AUTO_9963 ) ( CLEAR ?AUTO_9964 ) ( ON ?AUTO_9967 ?AUTO_9970 ) ( ON ?AUTO_9966 ?AUTO_9967 ) ( ON ?AUTO_9965 ?AUTO_9966 ) ( CLEAR ?AUTO_9965 ) ( ON ?AUTO_9968 ?AUTO_9973 ) ( ON ?AUTO_9974 ?AUTO_9968 ) ( CLEAR ?AUTO_9974 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_9974 ?AUTO_9968 )
      ( MAKE-ON ?AUTO_9962 ?AUTO_9963 )
      ( MAKE-ON-VERIFY ?AUTO_9962 ?AUTO_9963 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9977 - BLOCK
      ?AUTO_9978 - BLOCK
    )
    :vars
    (
      ?AUTO_9984 - BLOCK
      ?AUTO_9988 - BLOCK
      ?AUTO_9979 - BLOCK
      ?AUTO_9983 - BLOCK
      ?AUTO_9989 - BLOCK
      ?AUTO_9981 - BLOCK
      ?AUTO_9982 - BLOCK
      ?AUTO_9985 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_9977 ) ( ON ?AUTO_9984 ?AUTO_9977 ) ( ON ?AUTO_9988 ?AUTO_9978 ) ( ON ?AUTO_9979 ?AUTO_9984 ) ( ON ?AUTO_9983 ?AUTO_9979 ) ( ON ?AUTO_9989 ?AUTO_9983 ) ( CLEAR ?AUTO_9989 ) ( ON ?AUTO_9981 ?AUTO_9988 ) ( ON ?AUTO_9982 ?AUTO_9981 ) ( CLEAR ?AUTO_9982 ) ( HOLDING ?AUTO_9985 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_9985 )
      ( MAKE-ON ?AUTO_9977 ?AUTO_9978 )
      ( MAKE-ON-VERIFY ?AUTO_9977 ?AUTO_9978 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_9991 - BLOCK
      ?AUTO_9992 - BLOCK
    )
    :vars
    (
      ?AUTO_9997 - BLOCK
      ?AUTO_9993 - BLOCK
      ?AUTO_10002 - BLOCK
      ?AUTO_9996 - BLOCK
      ?AUTO_10001 - BLOCK
      ?AUTO_10000 - BLOCK
      ?AUTO_9994 - BLOCK
      ?AUTO_9995 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_9991 ) ( ON ?AUTO_9997 ?AUTO_9991 ) ( ON ?AUTO_9993 ?AUTO_9992 ) ( ON ?AUTO_10002 ?AUTO_9997 ) ( ON ?AUTO_9996 ?AUTO_10002 ) ( ON ?AUTO_10001 ?AUTO_9996 ) ( CLEAR ?AUTO_10001 ) ( ON ?AUTO_10000 ?AUTO_9993 ) ( ON ?AUTO_9994 ?AUTO_10000 ) ( ON ?AUTO_9995 ?AUTO_9994 ) ( CLEAR ?AUTO_9995 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_9995 ?AUTO_9994 )
      ( MAKE-ON ?AUTO_9991 ?AUTO_9992 )
      ( MAKE-ON-VERIFY ?AUTO_9991 ?AUTO_9992 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10007 - BLOCK
      ?AUTO_10008 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_10007 ) ( CLEAR ?AUTO_10008 ) )
    :subtasks
    ( ( !STACK ?AUTO_10007 ?AUTO_10008 )
      ( MAKE-ON-VERIFY ?AUTO_10007 ?AUTO_10008 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10011 - BLOCK
      ?AUTO_10012 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_10012 ) ( ON-TABLE ?AUTO_10011 ) ( CLEAR ?AUTO_10011 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_10011 )
      ( MAKE-ON ?AUTO_10011 ?AUTO_10012 )
      ( MAKE-ON-VERIFY ?AUTO_10011 ?AUTO_10012 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10016 - BLOCK
      ?AUTO_10017 - BLOCK
    )
    :vars
    (
      ?AUTO_10021 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_10016 ) ( CLEAR ?AUTO_10016 ) ( HOLDING ?AUTO_10017 ) ( CLEAR ?AUTO_10021 ) )
    :subtasks
    ( ( !STACK ?AUTO_10017 ?AUTO_10021 )
      ( MAKE-ON ?AUTO_10016 ?AUTO_10017 )
      ( MAKE-ON-VERIFY ?AUTO_10016 ?AUTO_10017 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_10023 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_10023 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_10023 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_10023 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_10025 - BLOCK
    )
    :vars
    (
      ?AUTO_10028 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_10025 ?AUTO_10028 ) ( CLEAR ?AUTO_10025 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_10025 ?AUTO_10028 )
      ( MAKE-ON-TABLE ?AUTO_10025 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_10025 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_10030 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_10030 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_10030 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_10030 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_10032 - BLOCK
    )
    :vars
    (
      ?AUTO_10035 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_10032 ?AUTO_10035 ) ( CLEAR ?AUTO_10032 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_10032 ?AUTO_10035 )
      ( MAKE-ON-TABLE ?AUTO_10032 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_10032 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_10036 - BLOCK
    )
    :vars
    (
      ?AUTO_10038 - BLOCK
      ?AUTO_10039 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_10036 ?AUTO_10038 ) ( CLEAR ?AUTO_10036 ) ( HOLDING ?AUTO_10039 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_10039 )
      ( MAKE-ON-TABLE ?AUTO_10036 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_10036 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_10040 - BLOCK
    )
    :vars
    (
      ?AUTO_10042 - BLOCK
      ?AUTO_10043 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_10040 ?AUTO_10042 ) ( ON ?AUTO_10043 ?AUTO_10040 ) ( CLEAR ?AUTO_10043 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_10043 ?AUTO_10040 )
      ( MAKE-ON-TABLE ?AUTO_10040 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_10040 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_10047 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_10047 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_10047 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_10047 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_10049 - BLOCK
    )
    :vars
    (
      ?AUTO_10052 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_10049 ?AUTO_10052 ) ( CLEAR ?AUTO_10049 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_10049 ?AUTO_10052 )
      ( MAKE-ON-TABLE ?AUTO_10049 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_10049 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_10053 - BLOCK
    )
    :vars
    (
      ?AUTO_10054 - BLOCK
      ?AUTO_10056 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_10053 ?AUTO_10054 ) ( CLEAR ?AUTO_10053 ) ( HOLDING ?AUTO_10056 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_10056 )
      ( MAKE-ON-TABLE ?AUTO_10053 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_10053 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_10057 - BLOCK
    )
    :vars
    (
      ?AUTO_10058 - BLOCK
      ?AUTO_10059 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_10057 ?AUTO_10058 ) ( ON ?AUTO_10059 ?AUTO_10057 ) ( CLEAR ?AUTO_10059 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_10059 ?AUTO_10057 )
      ( MAKE-ON-TABLE ?AUTO_10057 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_10057 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_10063 - BLOCK
    )
    :vars
    (
      ?AUTO_10065 - BLOCK
      ?AUTO_10064 - BLOCK
      ?AUTO_10067 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_10063 ?AUTO_10065 ) ( ON ?AUTO_10064 ?AUTO_10063 ) ( CLEAR ?AUTO_10064 ) ( HOLDING ?AUTO_10067 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_10067 )
      ( MAKE-ON-TABLE ?AUTO_10063 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_10063 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_10068 - BLOCK
    )
    :vars
    (
      ?AUTO_10071 - BLOCK
      ?AUTO_10070 - BLOCK
      ?AUTO_10072 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_10068 ?AUTO_10071 ) ( ON ?AUTO_10070 ?AUTO_10068 ) ( ON ?AUTO_10072 ?AUTO_10070 ) ( CLEAR ?AUTO_10072 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_10072 ?AUTO_10070 )
      ( MAKE-ON-TABLE ?AUTO_10068 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_10068 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10077 - BLOCK
      ?AUTO_10078 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_10077 ) ( CLEAR ?AUTO_10078 ) )
    :subtasks
    ( ( !STACK ?AUTO_10077 ?AUTO_10078 )
      ( MAKE-ON-VERIFY ?AUTO_10077 ?AUTO_10078 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10081 - BLOCK
      ?AUTO_10082 - BLOCK
    )
    :vars
    (
      ?AUTO_10086 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_10082 ) ( ON ?AUTO_10081 ?AUTO_10086 ) ( CLEAR ?AUTO_10081 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_10081 ?AUTO_10086 )
      ( MAKE-ON ?AUTO_10081 ?AUTO_10082 )
      ( MAKE-ON-VERIFY ?AUTO_10081 ?AUTO_10082 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10087 - BLOCK
      ?AUTO_10088 - BLOCK
    )
    :vars
    (
      ?AUTO_10091 - BLOCK
      ?AUTO_10092 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_10088 ) ( ON ?AUTO_10087 ?AUTO_10091 ) ( CLEAR ?AUTO_10087 ) ( HOLDING ?AUTO_10092 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_10092 )
      ( MAKE-ON ?AUTO_10087 ?AUTO_10088 )
      ( MAKE-ON-VERIFY ?AUTO_10087 ?AUTO_10088 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10093 - BLOCK
      ?AUTO_10094 - BLOCK
    )
    :vars
    (
      ?AUTO_10097 - BLOCK
      ?AUTO_10098 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_10093 ?AUTO_10097 ) ( CLEAR ?AUTO_10093 ) ( ON ?AUTO_10098 ?AUTO_10094 ) ( CLEAR ?AUTO_10098 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_10098 ?AUTO_10094 )
      ( MAKE-ON ?AUTO_10093 ?AUTO_10094 )
      ( MAKE-ON-VERIFY ?AUTO_10093 ?AUTO_10094 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10101 - BLOCK
      ?AUTO_10102 - BLOCK
    )
    :vars
    (
      ?AUTO_10106 - BLOCK
      ?AUTO_10103 - BLOCK
      ?AUTO_10107 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_10101 ?AUTO_10106 ) ( CLEAR ?AUTO_10101 ) ( ON ?AUTO_10103 ?AUTO_10102 ) ( CLEAR ?AUTO_10103 ) ( HOLDING ?AUTO_10107 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_10107 )
      ( MAKE-ON ?AUTO_10101 ?AUTO_10102 )
      ( MAKE-ON-VERIFY ?AUTO_10101 ?AUTO_10102 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10108 - BLOCK
      ?AUTO_10109 - BLOCK
    )
    :vars
    (
      ?AUTO_10113 - BLOCK
      ?AUTO_10110 - BLOCK
      ?AUTO_10114 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_10108 ?AUTO_10113 ) ( CLEAR ?AUTO_10108 ) ( ON ?AUTO_10110 ?AUTO_10109 ) ( ON ?AUTO_10114 ?AUTO_10110 ) ( CLEAR ?AUTO_10114 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_10114 ?AUTO_10110 )
      ( MAKE-ON ?AUTO_10108 ?AUTO_10109 )
      ( MAKE-ON-VERIFY ?AUTO_10108 ?AUTO_10109 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10117 - BLOCK
      ?AUTO_10118 - BLOCK
    )
    :vars
    (
      ?AUTO_10123 - BLOCK
      ?AUTO_10121 - BLOCK
      ?AUTO_10120 - BLOCK
      ?AUTO_10124 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_10117 ?AUTO_10123 ) ( CLEAR ?AUTO_10117 ) ( ON ?AUTO_10121 ?AUTO_10118 ) ( ON ?AUTO_10120 ?AUTO_10121 ) ( CLEAR ?AUTO_10120 ) ( HOLDING ?AUTO_10124 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_10124 )
      ( MAKE-ON ?AUTO_10117 ?AUTO_10118 )
      ( MAKE-ON-VERIFY ?AUTO_10117 ?AUTO_10118 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10125 - BLOCK
      ?AUTO_10126 - BLOCK
    )
    :vars
    (
      ?AUTO_10127 - BLOCK
      ?AUTO_10132 - BLOCK
      ?AUTO_10128 - BLOCK
      ?AUTO_10131 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_10125 ?AUTO_10127 ) ( CLEAR ?AUTO_10125 ) ( ON ?AUTO_10132 ?AUTO_10126 ) ( ON ?AUTO_10128 ?AUTO_10132 ) ( ON ?AUTO_10131 ?AUTO_10128 ) ( CLEAR ?AUTO_10131 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_10131 ?AUTO_10128 )
      ( MAKE-ON ?AUTO_10125 ?AUTO_10126 )
      ( MAKE-ON-VERIFY ?AUTO_10125 ?AUTO_10126 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_10136 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_10136 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_10136 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_10136 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_10138 - BLOCK
    )
    :vars
    (
      ?AUTO_10141 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_10138 ?AUTO_10141 ) ( CLEAR ?AUTO_10138 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_10138 ?AUTO_10141 )
      ( MAKE-ON-TABLE ?AUTO_10138 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_10138 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_10142 - BLOCK
    )
    :vars
    (
      ?AUTO_10144 - BLOCK
      ?AUTO_10145 - BLOCK
      ?AUTO_10146 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_10142 ?AUTO_10144 ) ( CLEAR ?AUTO_10142 ) ( HOLDING ?AUTO_10145 ) ( CLEAR ?AUTO_10146 ) )
    :subtasks
    ( ( !STACK ?AUTO_10145 ?AUTO_10146 )
      ( MAKE-ON-TABLE ?AUTO_10142 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_10142 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_10147 - BLOCK
    )
    :vars
    (
      ?AUTO_10149 - BLOCK
      ?AUTO_10151 - BLOCK
      ?AUTO_10150 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_10147 ?AUTO_10149 ) ( CLEAR ?AUTO_10151 ) ( ON ?AUTO_10150 ?AUTO_10147 ) ( CLEAR ?AUTO_10150 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_10150 ?AUTO_10147 )
      ( MAKE-ON-TABLE ?AUTO_10147 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_10147 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_10154 - BLOCK
    )
    :vars
    (
      ?AUTO_10157 - BLOCK
      ?AUTO_10155 - BLOCK
      ?AUTO_10158 - BLOCK
      ?AUTO_10159 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_10154 ?AUTO_10157 ) ( CLEAR ?AUTO_10155 ) ( ON ?AUTO_10158 ?AUTO_10154 ) ( CLEAR ?AUTO_10158 ) ( HOLDING ?AUTO_10159 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_10159 )
      ( MAKE-ON-TABLE ?AUTO_10154 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_10154 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_10166 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_10166 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_10166 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_10166 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_10168 - BLOCK
    )
    :vars
    (
      ?AUTO_10171 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_10168 ?AUTO_10171 ) ( CLEAR ?AUTO_10168 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_10168 ?AUTO_10171 )
      ( MAKE-ON-TABLE ?AUTO_10168 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_10168 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_10172 - BLOCK
    )
    :vars
    (
      ?AUTO_10174 - BLOCK
      ?AUTO_10175 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_10172 ?AUTO_10174 ) ( CLEAR ?AUTO_10172 ) ( HOLDING ?AUTO_10175 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_10175 )
      ( MAKE-ON-TABLE ?AUTO_10172 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_10172 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_10176 - BLOCK
    )
    :vars
    (
      ?AUTO_10178 - BLOCK
      ?AUTO_10179 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_10176 ?AUTO_10178 ) ( ON ?AUTO_10179 ?AUTO_10176 ) ( CLEAR ?AUTO_10179 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_10179 ?AUTO_10176 )
      ( MAKE-ON-TABLE ?AUTO_10176 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_10176 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_10182 - BLOCK
    )
    :vars
    (
      ?AUTO_10183 - BLOCK
      ?AUTO_10185 - BLOCK
      ?AUTO_10186 - BLOCK
      ?AUTO_10187 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_10182 ?AUTO_10183 ) ( ON ?AUTO_10185 ?AUTO_10182 ) ( CLEAR ?AUTO_10185 ) ( HOLDING ?AUTO_10186 ) ( CLEAR ?AUTO_10187 ) )
    :subtasks
    ( ( !STACK ?AUTO_10186 ?AUTO_10187 )
      ( MAKE-ON-TABLE ?AUTO_10182 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_10182 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_10188 - BLOCK
    )
    :vars
    (
      ?AUTO_10190 - BLOCK
      ?AUTO_10192 - BLOCK
      ?AUTO_10193 - BLOCK
      ?AUTO_10191 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_10188 ?AUTO_10190 ) ( ON ?AUTO_10192 ?AUTO_10188 ) ( CLEAR ?AUTO_10193 ) ( ON ?AUTO_10191 ?AUTO_10192 ) ( CLEAR ?AUTO_10191 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_10191 ?AUTO_10192 )
      ( MAKE-ON-TABLE ?AUTO_10188 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_10188 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_10196 - BLOCK
    )
    :vars
    (
      ?AUTO_10201 - BLOCK
      ?AUTO_10197 - BLOCK
      ?AUTO_10198 - BLOCK
      ?AUTO_10199 - BLOCK
      ?AUTO_10202 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_10196 ?AUTO_10201 ) ( ON ?AUTO_10197 ?AUTO_10196 ) ( CLEAR ?AUTO_10198 ) ( ON ?AUTO_10199 ?AUTO_10197 ) ( CLEAR ?AUTO_10199 ) ( HOLDING ?AUTO_10202 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_10202 )
      ( MAKE-ON-TABLE ?AUTO_10196 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_10196 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10210 - BLOCK
      ?AUTO_10211 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_10210 ) ( CLEAR ?AUTO_10211 ) )
    :subtasks
    ( ( !STACK ?AUTO_10210 ?AUTO_10211 )
      ( MAKE-ON-VERIFY ?AUTO_10210 ?AUTO_10211 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10214 - BLOCK
      ?AUTO_10215 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_10215 ) ( ON-TABLE ?AUTO_10214 ) ( CLEAR ?AUTO_10214 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_10214 )
      ( MAKE-ON ?AUTO_10214 ?AUTO_10215 )
      ( MAKE-ON-VERIFY ?AUTO_10214 ?AUTO_10215 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10219 - BLOCK
      ?AUTO_10220 - BLOCK
    )
    :vars
    (
      ?AUTO_10223 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_10220 ) ( ON-TABLE ?AUTO_10219 ) ( CLEAR ?AUTO_10219 ) ( HOLDING ?AUTO_10223 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_10223 )
      ( MAKE-ON ?AUTO_10219 ?AUTO_10220 )
      ( MAKE-ON-VERIFY ?AUTO_10219 ?AUTO_10220 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10224 - BLOCK
      ?AUTO_10225 - BLOCK
    )
    :vars
    (
      ?AUTO_10228 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_10224 ) ( CLEAR ?AUTO_10224 ) ( ON ?AUTO_10228 ?AUTO_10225 ) ( CLEAR ?AUTO_10228 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_10228 ?AUTO_10225 )
      ( MAKE-ON ?AUTO_10224 ?AUTO_10225 )
      ( MAKE-ON-VERIFY ?AUTO_10224 ?AUTO_10225 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10231 - BLOCK
      ?AUTO_10232 - BLOCK
    )
    :vars
    (
      ?AUTO_10234 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_10234 ?AUTO_10232 ) ( CLEAR ?AUTO_10234 ) ( HOLDING ?AUTO_10231 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_10231 )
      ( MAKE-ON ?AUTO_10231 ?AUTO_10232 )
      ( MAKE-ON-VERIFY ?AUTO_10231 ?AUTO_10232 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10237 - BLOCK
      ?AUTO_10238 - BLOCK
    )
    :vars
    (
      ?AUTO_10241 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_10241 ?AUTO_10238 ) ( ON ?AUTO_10237 ?AUTO_10241 ) ( CLEAR ?AUTO_10237 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_10237 ?AUTO_10241 )
      ( MAKE-ON ?AUTO_10237 ?AUTO_10238 )
      ( MAKE-ON-VERIFY ?AUTO_10237 ?AUTO_10238 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10244 - BLOCK
      ?AUTO_10245 - BLOCK
    )
    :vars
    (
      ?AUTO_10246 - BLOCK
      ?AUTO_10249 - BLOCK
      ?AUTO_10250 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_10246 ?AUTO_10245 ) ( ON ?AUTO_10244 ?AUTO_10246 ) ( CLEAR ?AUTO_10244 ) ( HOLDING ?AUTO_10249 ) ( CLEAR ?AUTO_10250 ) )
    :subtasks
    ( ( !STACK ?AUTO_10249 ?AUTO_10250 )
      ( MAKE-ON ?AUTO_10244 ?AUTO_10245 )
      ( MAKE-ON-VERIFY ?AUTO_10244 ?AUTO_10245 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10251 - BLOCK
      ?AUTO_10252 - BLOCK
    )
    :vars
    (
      ?AUTO_10255 - BLOCK
      ?AUTO_10257 - BLOCK
      ?AUTO_10256 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_10255 ?AUTO_10252 ) ( ON ?AUTO_10251 ?AUTO_10255 ) ( CLEAR ?AUTO_10257 ) ( ON ?AUTO_10256 ?AUTO_10251 ) ( CLEAR ?AUTO_10256 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_10256 ?AUTO_10251 )
      ( MAKE-ON ?AUTO_10251 ?AUTO_10252 )
      ( MAKE-ON-VERIFY ?AUTO_10251 ?AUTO_10252 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10260 - BLOCK
      ?AUTO_10261 - BLOCK
    )
    :vars
    (
      ?AUTO_10262 - BLOCK
      ?AUTO_10266 - BLOCK
      ?AUTO_10263 - BLOCK
      ?AUTO_10267 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_10262 ?AUTO_10261 ) ( ON ?AUTO_10260 ?AUTO_10262 ) ( CLEAR ?AUTO_10266 ) ( ON ?AUTO_10263 ?AUTO_10260 ) ( CLEAR ?AUTO_10263 ) ( HOLDING ?AUTO_10267 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_10267 )
      ( MAKE-ON ?AUTO_10260 ?AUTO_10261 )
      ( MAKE-ON-VERIFY ?AUTO_10260 ?AUTO_10261 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10280 - BLOCK
      ?AUTO_10281 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_10280 ) ( CLEAR ?AUTO_10281 ) )
    :subtasks
    ( ( !STACK ?AUTO_10280 ?AUTO_10281 )
      ( MAKE-ON-VERIFY ?AUTO_10280 ?AUTO_10281 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10284 - BLOCK
      ?AUTO_10285 - BLOCK
    )
    :vars
    (
      ?AUTO_10289 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_10285 ) ( ON ?AUTO_10284 ?AUTO_10289 ) ( CLEAR ?AUTO_10284 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_10284 ?AUTO_10289 )
      ( MAKE-ON ?AUTO_10284 ?AUTO_10285 )
      ( MAKE-ON-VERIFY ?AUTO_10284 ?AUTO_10285 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10290 - BLOCK
      ?AUTO_10291 - BLOCK
    )
    :vars
    (
      ?AUTO_10294 - BLOCK
      ?AUTO_10296 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_10290 ?AUTO_10294 ) ( CLEAR ?AUTO_10290 ) ( HOLDING ?AUTO_10291 ) ( CLEAR ?AUTO_10296 ) )
    :subtasks
    ( ( !STACK ?AUTO_10291 ?AUTO_10296 )
      ( MAKE-ON ?AUTO_10290 ?AUTO_10291 )
      ( MAKE-ON-VERIFY ?AUTO_10290 ?AUTO_10291 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10299 - BLOCK
      ?AUTO_10300 - BLOCK
    )
    :vars
    (
      ?AUTO_10303 - BLOCK
      ?AUTO_10304 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_10300 ) ( ON ?AUTO_10299 ?AUTO_10303 ) ( CLEAR ?AUTO_10299 ) ( HOLDING ?AUTO_10304 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_10304 )
      ( MAKE-ON ?AUTO_10299 ?AUTO_10300 )
      ( MAKE-ON-VERIFY ?AUTO_10299 ?AUTO_10300 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10338 - BLOCK
      ?AUTO_10339 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_10338 ) ( CLEAR ?AUTO_10339 ) )
    :subtasks
    ( ( !STACK ?AUTO_10338 ?AUTO_10339 )
      ( MAKE-ON-VERIFY ?AUTO_10338 ?AUTO_10339 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10342 - BLOCK
      ?AUTO_10343 - BLOCK
    )
    :vars
    (
      ?AUTO_10347 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_10343 ) ( ON ?AUTO_10342 ?AUTO_10347 ) ( CLEAR ?AUTO_10342 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_10342 ?AUTO_10347 )
      ( MAKE-ON ?AUTO_10342 ?AUTO_10343 )
      ( MAKE-ON-VERIFY ?AUTO_10342 ?AUTO_10343 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10348 - BLOCK
      ?AUTO_10349 - BLOCK
    )
    :vars
    (
      ?AUTO_10352 - BLOCK
      ?AUTO_10353 - BLOCK
      ?AUTO_10354 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_10349 ) ( ON ?AUTO_10348 ?AUTO_10352 ) ( CLEAR ?AUTO_10348 ) ( HOLDING ?AUTO_10353 ) ( CLEAR ?AUTO_10354 ) )
    :subtasks
    ( ( !STACK ?AUTO_10353 ?AUTO_10354 )
      ( MAKE-ON ?AUTO_10348 ?AUTO_10349 )
      ( MAKE-ON-VERIFY ?AUTO_10348 ?AUTO_10349 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10355 - BLOCK
      ?AUTO_10356 - BLOCK
    )
    :vars
    (
      ?AUTO_10359 - BLOCK
      ?AUTO_10361 - BLOCK
      ?AUTO_10360 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_10356 ) ( ON ?AUTO_10355 ?AUTO_10359 ) ( CLEAR ?AUTO_10361 ) ( ON ?AUTO_10360 ?AUTO_10355 ) ( CLEAR ?AUTO_10360 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_10360 ?AUTO_10355 )
      ( MAKE-ON ?AUTO_10355 ?AUTO_10356 )
      ( MAKE-ON-VERIFY ?AUTO_10355 ?AUTO_10356 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10364 - BLOCK
      ?AUTO_10365 - BLOCK
    )
    :vars
    (
      ?AUTO_10370 - BLOCK
      ?AUTO_10366 - BLOCK
      ?AUTO_10367 - BLOCK
      ?AUTO_10372 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_10365 ) ( ON ?AUTO_10364 ?AUTO_10370 ) ( ON ?AUTO_10366 ?AUTO_10364 ) ( CLEAR ?AUTO_10366 ) ( HOLDING ?AUTO_10367 ) ( CLEAR ?AUTO_10372 ) )
    :subtasks
    ( ( !STACK ?AUTO_10367 ?AUTO_10372 )
      ( MAKE-ON ?AUTO_10364 ?AUTO_10365 )
      ( MAKE-ON-VERIFY ?AUTO_10364 ?AUTO_10365 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10375 - BLOCK
      ?AUTO_10376 - BLOCK
    )
    :vars
    (
      ?AUTO_10381 - BLOCK
      ?AUTO_10377 - BLOCK
      ?AUTO_10379 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_10375 ?AUTO_10381 ) ( CLEAR ?AUTO_10377 ) ( ON ?AUTO_10379 ?AUTO_10375 ) ( CLEAR ?AUTO_10379 ) ( HOLDING ?AUTO_10376 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_10376 )
      ( MAKE-ON ?AUTO_10375 ?AUTO_10376 )
      ( MAKE-ON-VERIFY ?AUTO_10375 ?AUTO_10376 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10387 - BLOCK
      ?AUTO_10388 - BLOCK
    )
    :vars
    (
      ?AUTO_10394 - BLOCK
      ?AUTO_10393 - BLOCK
      ?AUTO_10389 - BLOCK
      ?AUTO_10391 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_10387 ?AUTO_10394 ) ( ON ?AUTO_10393 ?AUTO_10387 ) ( CLEAR ?AUTO_10393 ) ( CLEAR ?AUTO_10389 ) ( ON ?AUTO_10391 ?AUTO_10388 ) ( CLEAR ?AUTO_10391 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_10391 ?AUTO_10388 )
      ( MAKE-ON ?AUTO_10387 ?AUTO_10388 )
      ( MAKE-ON-VERIFY ?AUTO_10387 ?AUTO_10388 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10397 - BLOCK
      ?AUTO_10398 - BLOCK
    )
    :vars
    (
      ?AUTO_10404 - BLOCK
      ?AUTO_10402 - BLOCK
      ?AUTO_10403 - BLOCK
      ?AUTO_10401 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_10397 ?AUTO_10404 ) ( CLEAR ?AUTO_10402 ) ( ON ?AUTO_10403 ?AUTO_10398 ) ( CLEAR ?AUTO_10403 ) ( HOLDING ?AUTO_10401 ) ( CLEAR ?AUTO_10397 ) )
    :subtasks
    ( ( !STACK ?AUTO_10401 ?AUTO_10397 )
      ( MAKE-ON ?AUTO_10397 ?AUTO_10398 )
      ( MAKE-ON-VERIFY ?AUTO_10397 ?AUTO_10398 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10407 - BLOCK
      ?AUTO_10408 - BLOCK
    )
    :vars
    (
      ?AUTO_10409 - BLOCK
      ?AUTO_10414 - BLOCK
      ?AUTO_10413 - BLOCK
      ?AUTO_10412 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_10407 ?AUTO_10409 ) ( CLEAR ?AUTO_10414 ) ( ON ?AUTO_10413 ?AUTO_10408 ) ( CLEAR ?AUTO_10407 ) ( ON ?AUTO_10412 ?AUTO_10413 ) ( CLEAR ?AUTO_10412 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_10412 ?AUTO_10413 )
      ( MAKE-ON ?AUTO_10407 ?AUTO_10408 )
      ( MAKE-ON-VERIFY ?AUTO_10407 ?AUTO_10408 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10417 - BLOCK
      ?AUTO_10418 - BLOCK
    )
    :vars
    (
      ?AUTO_10423 - BLOCK
      ?AUTO_10424 - BLOCK
      ?AUTO_10422 - BLOCK
      ?AUTO_10419 - BLOCK
      ?AUTO_10425 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_10417 ?AUTO_10423 ) ( CLEAR ?AUTO_10424 ) ( ON ?AUTO_10422 ?AUTO_10418 ) ( CLEAR ?AUTO_10417 ) ( ON ?AUTO_10419 ?AUTO_10422 ) ( CLEAR ?AUTO_10419 ) ( HOLDING ?AUTO_10425 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_10425 )
      ( MAKE-ON ?AUTO_10417 ?AUTO_10418 )
      ( MAKE-ON-VERIFY ?AUTO_10417 ?AUTO_10418 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10426 - BLOCK
      ?AUTO_10427 - BLOCK
    )
    :vars
    (
      ?AUTO_10433 - BLOCK
      ?AUTO_10428 - BLOCK
      ?AUTO_10434 - BLOCK
      ?AUTO_10429 - BLOCK
      ?AUTO_10432 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_10426 ?AUTO_10433 ) ( CLEAR ?AUTO_10428 ) ( ON ?AUTO_10434 ?AUTO_10427 ) ( ON ?AUTO_10429 ?AUTO_10434 ) ( CLEAR ?AUTO_10429 ) ( ON ?AUTO_10432 ?AUTO_10426 ) ( CLEAR ?AUTO_10432 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_10432 ?AUTO_10426 )
      ( MAKE-ON ?AUTO_10426 ?AUTO_10427 )
      ( MAKE-ON-VERIFY ?AUTO_10426 ?AUTO_10427 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10437 - BLOCK
      ?AUTO_10438 - BLOCK
    )
    :vars
    (
      ?AUTO_10444 - BLOCK
      ?AUTO_10440 - BLOCK
      ?AUTO_10445 - BLOCK
      ?AUTO_10441 - BLOCK
      ?AUTO_10442 - BLOCK
      ?AUTO_10446 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_10437 ?AUTO_10444 ) ( CLEAR ?AUTO_10440 ) ( ON ?AUTO_10445 ?AUTO_10438 ) ( ON ?AUTO_10441 ?AUTO_10445 ) ( CLEAR ?AUTO_10441 ) ( ON ?AUTO_10442 ?AUTO_10437 ) ( CLEAR ?AUTO_10442 ) ( HOLDING ?AUTO_10446 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_10446 )
      ( MAKE-ON ?AUTO_10437 ?AUTO_10438 )
      ( MAKE-ON-VERIFY ?AUTO_10437 ?AUTO_10438 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10447 - BLOCK
      ?AUTO_10448 - BLOCK
    )
    :vars
    (
      ?AUTO_10454 - BLOCK
      ?AUTO_10450 - BLOCK
      ?AUTO_10449 - BLOCK
      ?AUTO_10455 - BLOCK
      ?AUTO_10451 - BLOCK
      ?AUTO_10456 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_10447 ?AUTO_10454 ) ( CLEAR ?AUTO_10450 ) ( ON ?AUTO_10449 ?AUTO_10448 ) ( ON ?AUTO_10455 ?AUTO_10449 ) ( CLEAR ?AUTO_10455 ) ( ON ?AUTO_10451 ?AUTO_10447 ) ( ON ?AUTO_10456 ?AUTO_10451 ) ( CLEAR ?AUTO_10456 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_10456 ?AUTO_10451 )
      ( MAKE-ON ?AUTO_10447 ?AUTO_10448 )
      ( MAKE-ON-VERIFY ?AUTO_10447 ?AUTO_10448 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10459 - BLOCK
      ?AUTO_10460 - BLOCK
    )
    :vars
    (
      ?AUTO_10467 - BLOCK
      ?AUTO_10463 - BLOCK
      ?AUTO_10466 - BLOCK
      ?AUTO_10462 - BLOCK
      ?AUTO_10468 - BLOCK
      ?AUTO_10464 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_10459 ?AUTO_10467 ) ( ON ?AUTO_10463 ?AUTO_10460 ) ( ON ?AUTO_10466 ?AUTO_10463 ) ( CLEAR ?AUTO_10466 ) ( ON ?AUTO_10462 ?AUTO_10459 ) ( ON ?AUTO_10468 ?AUTO_10462 ) ( CLEAR ?AUTO_10468 ) ( HOLDING ?AUTO_10464 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_10464 )
      ( MAKE-ON ?AUTO_10459 ?AUTO_10460 )
      ( MAKE-ON-VERIFY ?AUTO_10459 ?AUTO_10460 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10470 - BLOCK
      ?AUTO_10471 - BLOCK
    )
    :vars
    (
      ?AUTO_10472 - BLOCK
      ?AUTO_10479 - BLOCK
      ?AUTO_10476 - BLOCK
      ?AUTO_10473 - BLOCK
      ?AUTO_10478 - BLOCK
      ?AUTO_10477 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_10470 ?AUTO_10472 ) ( ON ?AUTO_10479 ?AUTO_10471 ) ( ON ?AUTO_10476 ?AUTO_10479 ) ( CLEAR ?AUTO_10476 ) ( ON ?AUTO_10473 ?AUTO_10470 ) ( ON ?AUTO_10478 ?AUTO_10473 ) ( ON ?AUTO_10477 ?AUTO_10478 ) ( CLEAR ?AUTO_10477 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_10477 ?AUTO_10478 )
      ( MAKE-ON ?AUTO_10470 ?AUTO_10471 )
      ( MAKE-ON-VERIFY ?AUTO_10470 ?AUTO_10471 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10484 - BLOCK
      ?AUTO_10485 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_10484 ) ( CLEAR ?AUTO_10485 ) )
    :subtasks
    ( ( !STACK ?AUTO_10484 ?AUTO_10485 )
      ( MAKE-ON-VERIFY ?AUTO_10484 ?AUTO_10485 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10488 - BLOCK
      ?AUTO_10489 - BLOCK
    )
    :vars
    (
      ?AUTO_10493 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_10489 ) ( ON ?AUTO_10488 ?AUTO_10493 ) ( CLEAR ?AUTO_10488 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_10488 ?AUTO_10493 )
      ( MAKE-ON ?AUTO_10488 ?AUTO_10489 )
      ( MAKE-ON-VERIFY ?AUTO_10488 ?AUTO_10489 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10494 - BLOCK
      ?AUTO_10495 - BLOCK
    )
    :vars
    (
      ?AUTO_10498 - BLOCK
      ?AUTO_10499 - BLOCK
      ?AUTO_10500 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_10495 ) ( ON ?AUTO_10494 ?AUTO_10498 ) ( CLEAR ?AUTO_10494 ) ( HOLDING ?AUTO_10499 ) ( CLEAR ?AUTO_10500 ) )
    :subtasks
    ( ( !STACK ?AUTO_10499 ?AUTO_10500 )
      ( MAKE-ON ?AUTO_10494 ?AUTO_10495 )
      ( MAKE-ON-VERIFY ?AUTO_10494 ?AUTO_10495 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10501 - BLOCK
      ?AUTO_10502 - BLOCK
    )
    :vars
    (
      ?AUTO_10505 - BLOCK
      ?AUTO_10507 - BLOCK
      ?AUTO_10506 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_10501 ?AUTO_10505 ) ( CLEAR ?AUTO_10501 ) ( CLEAR ?AUTO_10507 ) ( ON ?AUTO_10506 ?AUTO_10502 ) ( CLEAR ?AUTO_10506 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_10506 ?AUTO_10502 )
      ( MAKE-ON ?AUTO_10501 ?AUTO_10502 )
      ( MAKE-ON-VERIFY ?AUTO_10501 ?AUTO_10502 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10510 - BLOCK
      ?AUTO_10511 - BLOCK
    )
    :vars
    (
      ?AUTO_10515 - BLOCK
      ?AUTO_10512 - BLOCK
      ?AUTO_10516 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_10515 ) ( ON ?AUTO_10512 ?AUTO_10511 ) ( CLEAR ?AUTO_10512 ) ( HOLDING ?AUTO_10510 ) ( CLEAR ?AUTO_10516 ) )
    :subtasks
    ( ( !STACK ?AUTO_10510 ?AUTO_10516 )
      ( MAKE-ON ?AUTO_10510 ?AUTO_10511 )
      ( MAKE-ON-VERIFY ?AUTO_10510 ?AUTO_10511 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10519 - BLOCK
      ?AUTO_10520 - BLOCK
    )
    :vars
    (
      ?AUTO_10521 - BLOCK
      ?AUTO_10522 - BLOCK
      ?AUTO_10525 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_10521 ) ( ON ?AUTO_10522 ?AUTO_10520 ) ( CLEAR ?AUTO_10525 ) ( ON ?AUTO_10519 ?AUTO_10522 ) ( CLEAR ?AUTO_10519 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_10519 ?AUTO_10522 )
      ( MAKE-ON ?AUTO_10519 ?AUTO_10520 )
      ( MAKE-ON-VERIFY ?AUTO_10519 ?AUTO_10520 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10528 - BLOCK
      ?AUTO_10529 - BLOCK
    )
    :vars
    (
      ?AUTO_10532 - BLOCK
      ?AUTO_10534 - BLOCK
      ?AUTO_10533 - BLOCK
      ?AUTO_10536 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_10532 ) ( ON ?AUTO_10534 ?AUTO_10529 ) ( ON ?AUTO_10528 ?AUTO_10534 ) ( CLEAR ?AUTO_10528 ) ( HOLDING ?AUTO_10533 ) ( CLEAR ?AUTO_10536 ) )
    :subtasks
    ( ( !STACK ?AUTO_10533 ?AUTO_10536 )
      ( MAKE-ON ?AUTO_10528 ?AUTO_10529 )
      ( MAKE-ON-VERIFY ?AUTO_10528 ?AUTO_10529 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10557 - BLOCK
      ?AUTO_10558 - BLOCK
    )
    :vars
    (
      ?AUTO_10559 - BLOCK
      ?AUTO_10560 - BLOCK
      ?AUTO_10565 - BLOCK
      ?AUTO_10562 - BLOCK
      ?AUTO_10561 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_10557 ?AUTO_10559 ) ( CLEAR ?AUTO_10560 ) ( ON ?AUTO_10565 ?AUTO_10558 ) ( CLEAR ?AUTO_10557 ) ( ON ?AUTO_10562 ?AUTO_10565 ) ( ON ?AUTO_10561 ?AUTO_10562 ) ( CLEAR ?AUTO_10561 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_10561 ?AUTO_10562 )
      ( MAKE-ON ?AUTO_10557 ?AUTO_10558 )
      ( MAKE-ON-VERIFY ?AUTO_10557 ?AUTO_10558 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10568 - BLOCK
      ?AUTO_10569 - BLOCK
    )
    :vars
    (
      ?AUTO_10572 - BLOCK
      ?AUTO_10575 - BLOCK
      ?AUTO_10576 - BLOCK
      ?AUTO_10573 - BLOCK
      ?AUTO_10574 - BLOCK
      ?AUTO_10577 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_10568 ?AUTO_10572 ) ( CLEAR ?AUTO_10575 ) ( ON ?AUTO_10576 ?AUTO_10569 ) ( CLEAR ?AUTO_10568 ) ( ON ?AUTO_10573 ?AUTO_10576 ) ( ON ?AUTO_10574 ?AUTO_10573 ) ( CLEAR ?AUTO_10574 ) ( HOLDING ?AUTO_10577 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_10577 )
      ( MAKE-ON ?AUTO_10568 ?AUTO_10569 )
      ( MAKE-ON-VERIFY ?AUTO_10568 ?AUTO_10569 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10578 - BLOCK
      ?AUTO_10579 - BLOCK
    )
    :vars
    (
      ?AUTO_10581 - BLOCK
      ?AUTO_10584 - BLOCK
      ?AUTO_10582 - BLOCK
      ?AUTO_10580 - BLOCK
      ?AUTO_10583 - BLOCK
      ?AUTO_10585 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_10578 ?AUTO_10581 ) ( CLEAR ?AUTO_10584 ) ( ON ?AUTO_10582 ?AUTO_10579 ) ( CLEAR ?AUTO_10578 ) ( ON ?AUTO_10580 ?AUTO_10582 ) ( ON ?AUTO_10583 ?AUTO_10580 ) ( ON ?AUTO_10585 ?AUTO_10583 ) ( CLEAR ?AUTO_10585 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_10585 ?AUTO_10583 )
      ( MAKE-ON ?AUTO_10578 ?AUTO_10579 )
      ( MAKE-ON-VERIFY ?AUTO_10578 ?AUTO_10579 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_10591 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_10591 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_10591 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_10591 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_10593 - BLOCK
    )
    :vars
    (
      ?AUTO_10596 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_10593 ?AUTO_10596 ) ( CLEAR ?AUTO_10593 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_10593 ?AUTO_10596 )
      ( MAKE-ON-TABLE ?AUTO_10593 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_10593 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_10597 - BLOCK
    )
    :vars
    (
      ?AUTO_10598 - BLOCK
      ?AUTO_10600 - BLOCK
      ?AUTO_10601 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_10597 ?AUTO_10598 ) ( CLEAR ?AUTO_10597 ) ( HOLDING ?AUTO_10600 ) ( CLEAR ?AUTO_10601 ) )
    :subtasks
    ( ( !STACK ?AUTO_10600 ?AUTO_10601 )
      ( MAKE-ON-TABLE ?AUTO_10597 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_10597 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_10602 - BLOCK
    )
    :vars
    (
      ?AUTO_10603 - BLOCK
      ?AUTO_10606 - BLOCK
      ?AUTO_10604 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_10602 ?AUTO_10603 ) ( CLEAR ?AUTO_10606 ) ( ON ?AUTO_10604 ?AUTO_10602 ) ( CLEAR ?AUTO_10604 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_10604 ?AUTO_10602 )
      ( MAKE-ON-TABLE ?AUTO_10602 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_10602 ) )
  )

  ( :method MAKE-ON-TABLE
    :parameters
    (
      ?AUTO_10609 - BLOCK
    )
    :vars
    (
      ?AUTO_10610 - BLOCK
      ?AUTO_10611 - BLOCK
      ?AUTO_10613 - BLOCK
      ?AUTO_10614 - BLOCK
      ?AUTO_10615 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_10609 ?AUTO_10610 ) ( CLEAR ?AUTO_10611 ) ( ON ?AUTO_10613 ?AUTO_10609 ) ( CLEAR ?AUTO_10613 ) ( HOLDING ?AUTO_10614 ) ( CLEAR ?AUTO_10615 ) )
    :subtasks
    ( ( !STACK ?AUTO_10614 ?AUTO_10615 )
      ( MAKE-ON-TABLE ?AUTO_10609 )
      ( MAKE-ON-TABLE-VERIFY ?AUTO_10609 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10645 - BLOCK
      ?AUTO_10646 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_10645 ) ( CLEAR ?AUTO_10646 ) )
    :subtasks
    ( ( !STACK ?AUTO_10645 ?AUTO_10646 )
      ( MAKE-ON-VERIFY ?AUTO_10645 ?AUTO_10646 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10649 - BLOCK
      ?AUTO_10650 - BLOCK
    )
    :vars
    (
      ?AUTO_10654 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_10650 ) ( ON ?AUTO_10649 ?AUTO_10654 ) ( CLEAR ?AUTO_10649 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_10649 ?AUTO_10654 )
      ( MAKE-ON ?AUTO_10649 ?AUTO_10650 )
      ( MAKE-ON-VERIFY ?AUTO_10649 ?AUTO_10650 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10655 - BLOCK
      ?AUTO_10656 - BLOCK
    )
    :vars
    (
      ?AUTO_10659 - BLOCK
      ?AUTO_10660 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_10656 ) ( ON ?AUTO_10655 ?AUTO_10659 ) ( CLEAR ?AUTO_10655 ) ( HOLDING ?AUTO_10660 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_10660 )
      ( MAKE-ON ?AUTO_10655 ?AUTO_10656 )
      ( MAKE-ON-VERIFY ?AUTO_10655 ?AUTO_10656 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10661 - BLOCK
      ?AUTO_10662 - BLOCK
    )
    :vars
    (
      ?AUTO_10666 - BLOCK
      ?AUTO_10663 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_10662 ) ( ON ?AUTO_10661 ?AUTO_10666 ) ( ON ?AUTO_10663 ?AUTO_10661 ) ( CLEAR ?AUTO_10663 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_10663 ?AUTO_10661 )
      ( MAKE-ON ?AUTO_10661 ?AUTO_10662 )
      ( MAKE-ON-VERIFY ?AUTO_10661 ?AUTO_10662 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10669 - BLOCK
      ?AUTO_10670 - BLOCK
    )
    :vars
    (
      ?AUTO_10673 - BLOCK
      ?AUTO_10674 - BLOCK
      ?AUTO_10675 - BLOCK
      ?AUTO_10676 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_10670 ) ( ON ?AUTO_10669 ?AUTO_10673 ) ( ON ?AUTO_10674 ?AUTO_10669 ) ( CLEAR ?AUTO_10674 ) ( HOLDING ?AUTO_10675 ) ( CLEAR ?AUTO_10676 ) )
    :subtasks
    ( ( !STACK ?AUTO_10675 ?AUTO_10676 )
      ( MAKE-ON ?AUTO_10669 ?AUTO_10670 )
      ( MAKE-ON-VERIFY ?AUTO_10669 ?AUTO_10670 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10677 - BLOCK
      ?AUTO_10678 - BLOCK
    )
    :vars
    (
      ?AUTO_10680 - BLOCK
      ?AUTO_10683 - BLOCK
      ?AUTO_10679 - BLOCK
      ?AUTO_10684 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_10678 ) ( ON ?AUTO_10677 ?AUTO_10680 ) ( ON ?AUTO_10683 ?AUTO_10677 ) ( CLEAR ?AUTO_10679 ) ( ON ?AUTO_10684 ?AUTO_10683 ) ( CLEAR ?AUTO_10684 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_10684 ?AUTO_10683 )
      ( MAKE-ON ?AUTO_10677 ?AUTO_10678 )
      ( MAKE-ON-VERIFY ?AUTO_10677 ?AUTO_10678 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10687 - BLOCK
      ?AUTO_10688 - BLOCK
    )
    :vars
    (
      ?AUTO_10691 - BLOCK
      ?AUTO_10694 - BLOCK
      ?AUTO_10693 - BLOCK
      ?AUTO_10692 - BLOCK
      ?AUTO_10696 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_10687 ?AUTO_10691 ) ( ON ?AUTO_10694 ?AUTO_10687 ) ( CLEAR ?AUTO_10693 ) ( ON ?AUTO_10692 ?AUTO_10694 ) ( CLEAR ?AUTO_10692 ) ( HOLDING ?AUTO_10688 ) ( CLEAR ?AUTO_10696 ) )
    :subtasks
    ( ( !STACK ?AUTO_10688 ?AUTO_10696 )
      ( MAKE-ON ?AUTO_10687 ?AUTO_10688 )
      ( MAKE-ON-VERIFY ?AUTO_10687 ?AUTO_10688 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10701 - BLOCK
      ?AUTO_10702 - BLOCK
    )
    :vars
    (
      ?AUTO_10704 - BLOCK
      ?AUTO_10707 - BLOCK
      ?AUTO_10703 - BLOCK
      ?AUTO_10708 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_10701 ?AUTO_10704 ) ( ON ?AUTO_10707 ?AUTO_10701 ) ( CLEAR ?AUTO_10707 ) ( CLEAR ?AUTO_10703 ) ( ON ?AUTO_10708 ?AUTO_10702 ) ( CLEAR ?AUTO_10708 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_10708 ?AUTO_10702 )
      ( MAKE-ON ?AUTO_10701 ?AUTO_10702 )
      ( MAKE-ON-VERIFY ?AUTO_10701 ?AUTO_10702 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10711 - BLOCK
      ?AUTO_10712 - BLOCK
    )
    :vars
    (
      ?AUTO_10717 - BLOCK
      ?AUTO_10716 - BLOCK
      ?AUTO_10718 - BLOCK
      ?AUTO_10715 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_10711 ?AUTO_10717 ) ( CLEAR ?AUTO_10716 ) ( ON ?AUTO_10718 ?AUTO_10712 ) ( CLEAR ?AUTO_10718 ) ( HOLDING ?AUTO_10715 ) ( CLEAR ?AUTO_10711 ) )
    :subtasks
    ( ( !STACK ?AUTO_10715 ?AUTO_10711 )
      ( MAKE-ON ?AUTO_10711 ?AUTO_10712 )
      ( MAKE-ON-VERIFY ?AUTO_10711 ?AUTO_10712 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10727 - BLOCK
      ?AUTO_10728 - BLOCK
    )
    :vars
    (
      ?AUTO_10730 - BLOCK
      ?AUTO_10731 - BLOCK
      ?AUTO_10733 - BLOCK
      ?AUTO_10729 - BLOCK
      ?AUTO_10735 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_10727 ?AUTO_10730 ) ( ON ?AUTO_10731 ?AUTO_10727 ) ( CLEAR ?AUTO_10731 ) ( CLEAR ?AUTO_10733 ) ( ON ?AUTO_10729 ?AUTO_10728 ) ( CLEAR ?AUTO_10729 ) ( HOLDING ?AUTO_10735 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_10735 )
      ( MAKE-ON ?AUTO_10727 ?AUTO_10728 )
      ( MAKE-ON-VERIFY ?AUTO_10727 ?AUTO_10728 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10736 - BLOCK
      ?AUTO_10737 - BLOCK
    )
    :vars
    (
      ?AUTO_10743 - BLOCK
      ?AUTO_10741 - BLOCK
      ?AUTO_10744 - BLOCK
      ?AUTO_10742 - BLOCK
      ?AUTO_10738 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_10736 ?AUTO_10743 ) ( ON ?AUTO_10741 ?AUTO_10736 ) ( CLEAR ?AUTO_10744 ) ( ON ?AUTO_10742 ?AUTO_10737 ) ( CLEAR ?AUTO_10742 ) ( ON ?AUTO_10738 ?AUTO_10741 ) ( CLEAR ?AUTO_10738 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_10738 ?AUTO_10741 )
      ( MAKE-ON ?AUTO_10736 ?AUTO_10737 )
      ( MAKE-ON-VERIFY ?AUTO_10736 ?AUTO_10737 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10747 - BLOCK
      ?AUTO_10748 - BLOCK
    )
    :vars
    (
      ?AUTO_10754 - BLOCK
      ?AUTO_10749 - BLOCK
      ?AUTO_10755 - BLOCK
      ?AUTO_10750 - BLOCK
      ?AUTO_10752 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_10747 ?AUTO_10754 ) ( ON ?AUTO_10749 ?AUTO_10747 ) ( CLEAR ?AUTO_10755 ) ( ON ?AUTO_10750 ?AUTO_10749 ) ( CLEAR ?AUTO_10750 ) ( HOLDING ?AUTO_10752 ) ( CLEAR ?AUTO_10748 ) )
    :subtasks
    ( ( !STACK ?AUTO_10752 ?AUTO_10748 )
      ( MAKE-ON ?AUTO_10747 ?AUTO_10748 )
      ( MAKE-ON-VERIFY ?AUTO_10747 ?AUTO_10748 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10758 - BLOCK
      ?AUTO_10759 - BLOCK
    )
    :vars
    (
      ?AUTO_10765 - BLOCK
      ?AUTO_10761 - BLOCK
      ?AUTO_10766 - BLOCK
      ?AUTO_10762 - BLOCK
      ?AUTO_10760 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_10758 ?AUTO_10765 ) ( ON ?AUTO_10761 ?AUTO_10758 ) ( CLEAR ?AUTO_10766 ) ( ON ?AUTO_10762 ?AUTO_10761 ) ( CLEAR ?AUTO_10759 ) ( ON ?AUTO_10760 ?AUTO_10762 ) ( CLEAR ?AUTO_10760 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_10760 ?AUTO_10762 )
      ( MAKE-ON ?AUTO_10758 ?AUTO_10759 )
      ( MAKE-ON-VERIFY ?AUTO_10758 ?AUTO_10759 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10769 - BLOCK
      ?AUTO_10770 - BLOCK
    )
    :vars
    (
      ?AUTO_10777 - BLOCK
      ?AUTO_10772 - BLOCK
      ?AUTO_10775 - BLOCK
      ?AUTO_10776 - BLOCK
      ?AUTO_10771 - BLOCK
      ?AUTO_10778 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_10769 ?AUTO_10777 ) ( ON ?AUTO_10772 ?AUTO_10769 ) ( CLEAR ?AUTO_10775 ) ( ON ?AUTO_10776 ?AUTO_10772 ) ( CLEAR ?AUTO_10770 ) ( ON ?AUTO_10771 ?AUTO_10776 ) ( CLEAR ?AUTO_10771 ) ( HOLDING ?AUTO_10778 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_10778 )
      ( MAKE-ON ?AUTO_10769 ?AUTO_10770 )
      ( MAKE-ON-VERIFY ?AUTO_10769 ?AUTO_10770 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10779 - BLOCK
      ?AUTO_10780 - BLOCK
    )
    :vars
    (
      ?AUTO_10787 - BLOCK
      ?AUTO_10782 - BLOCK
      ?AUTO_10783 - BLOCK
      ?AUTO_10788 - BLOCK
      ?AUTO_10781 - BLOCK
      ?AUTO_10784 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_10779 ?AUTO_10787 ) ( ON ?AUTO_10782 ?AUTO_10779 ) ( CLEAR ?AUTO_10783 ) ( ON ?AUTO_10788 ?AUTO_10782 ) ( ON ?AUTO_10781 ?AUTO_10788 ) ( CLEAR ?AUTO_10781 ) ( ON ?AUTO_10784 ?AUTO_10780 ) ( CLEAR ?AUTO_10784 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_10784 ?AUTO_10780 )
      ( MAKE-ON ?AUTO_10779 ?AUTO_10780 )
      ( MAKE-ON-VERIFY ?AUTO_10779 ?AUTO_10780 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10791 - BLOCK
      ?AUTO_10792 - BLOCK
    )
    :vars
    (
      ?AUTO_10799 - BLOCK
      ?AUTO_10796 - BLOCK
      ?AUTO_10794 - BLOCK
      ?AUTO_10800 - BLOCK
      ?AUTO_10797 - BLOCK
      ?AUTO_10795 - BLOCK
      ?AUTO_10801 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_10791 ?AUTO_10799 ) ( ON ?AUTO_10796 ?AUTO_10791 ) ( CLEAR ?AUTO_10794 ) ( ON ?AUTO_10800 ?AUTO_10796 ) ( ON ?AUTO_10797 ?AUTO_10800 ) ( CLEAR ?AUTO_10797 ) ( ON ?AUTO_10795 ?AUTO_10792 ) ( CLEAR ?AUTO_10795 ) ( HOLDING ?AUTO_10801 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_10801 )
      ( MAKE-ON ?AUTO_10791 ?AUTO_10792 )
      ( MAKE-ON-VERIFY ?AUTO_10791 ?AUTO_10792 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10802 - BLOCK
      ?AUTO_10803 - BLOCK
    )
    :vars
    (
      ?AUTO_10811 - BLOCK
      ?AUTO_10804 - BLOCK
      ?AUTO_10810 - BLOCK
      ?AUTO_10809 - BLOCK
      ?AUTO_10806 - BLOCK
      ?AUTO_10805 - BLOCK
      ?AUTO_10812 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_10802 ?AUTO_10811 ) ( ON ?AUTO_10804 ?AUTO_10802 ) ( CLEAR ?AUTO_10810 ) ( ON ?AUTO_10809 ?AUTO_10804 ) ( ON ?AUTO_10806 ?AUTO_10809 ) ( CLEAR ?AUTO_10806 ) ( ON ?AUTO_10805 ?AUTO_10803 ) ( ON ?AUTO_10812 ?AUTO_10805 ) ( CLEAR ?AUTO_10812 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_10812 ?AUTO_10805 )
      ( MAKE-ON ?AUTO_10802 ?AUTO_10803 )
      ( MAKE-ON-VERIFY ?AUTO_10802 ?AUTO_10803 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10815 - BLOCK
      ?AUTO_10816 - BLOCK
    )
    :vars
    (
      ?AUTO_10823 - BLOCK
      ?AUTO_10819 - BLOCK
      ?AUTO_10824 - BLOCK
      ?AUTO_10820 - BLOCK
      ?AUTO_10822 - BLOCK
      ?AUTO_10817 - BLOCK
      ?AUTO_10825 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_10815 ?AUTO_10823 ) ( ON ?AUTO_10819 ?AUTO_10815 ) ( ON ?AUTO_10824 ?AUTO_10819 ) ( ON ?AUTO_10820 ?AUTO_10824 ) ( CLEAR ?AUTO_10820 ) ( ON ?AUTO_10822 ?AUTO_10816 ) ( ON ?AUTO_10817 ?AUTO_10822 ) ( CLEAR ?AUTO_10817 ) ( HOLDING ?AUTO_10825 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_10825 )
      ( MAKE-ON ?AUTO_10815 ?AUTO_10816 )
      ( MAKE-ON-VERIFY ?AUTO_10815 ?AUTO_10816 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10827 - BLOCK
      ?AUTO_10828 - BLOCK
    )
    :vars
    (
      ?AUTO_10833 - BLOCK
      ?AUTO_10837 - BLOCK
      ?AUTO_10832 - BLOCK
      ?AUTO_10829 - BLOCK
      ?AUTO_10835 - BLOCK
      ?AUTO_10831 - BLOCK
      ?AUTO_10836 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_10827 ?AUTO_10833 ) ( ON ?AUTO_10837 ?AUTO_10827 ) ( ON ?AUTO_10832 ?AUTO_10837 ) ( ON ?AUTO_10829 ?AUTO_10832 ) ( CLEAR ?AUTO_10829 ) ( ON ?AUTO_10835 ?AUTO_10828 ) ( ON ?AUTO_10831 ?AUTO_10835 ) ( ON ?AUTO_10836 ?AUTO_10831 ) ( CLEAR ?AUTO_10836 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_10836 ?AUTO_10831 )
      ( MAKE-ON ?AUTO_10827 ?AUTO_10828 )
      ( MAKE-ON-VERIFY ?AUTO_10827 ?AUTO_10828 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10842 - BLOCK
      ?AUTO_10843 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_10842 ) ( CLEAR ?AUTO_10843 ) )
    :subtasks
    ( ( !STACK ?AUTO_10842 ?AUTO_10843 )
      ( MAKE-ON-VERIFY ?AUTO_10842 ?AUTO_10843 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10846 - BLOCK
      ?AUTO_10847 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_10847 ) ( ON-TABLE ?AUTO_10846 ) ( CLEAR ?AUTO_10846 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_10846 )
      ( MAKE-ON ?AUTO_10846 ?AUTO_10847 )
      ( MAKE-ON-VERIFY ?AUTO_10846 ?AUTO_10847 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10851 - BLOCK
      ?AUTO_10852 - BLOCK
    )
    :vars
    (
      ?AUTO_10855 - BLOCK
      ?AUTO_10856 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_10852 ) ( ON-TABLE ?AUTO_10851 ) ( CLEAR ?AUTO_10851 ) ( HOLDING ?AUTO_10855 ) ( CLEAR ?AUTO_10856 ) )
    :subtasks
    ( ( !STACK ?AUTO_10855 ?AUTO_10856 )
      ( MAKE-ON ?AUTO_10851 ?AUTO_10852 )
      ( MAKE-ON-VERIFY ?AUTO_10851 ?AUTO_10852 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10857 - BLOCK
      ?AUTO_10858 - BLOCK
    )
    :vars
    (
      ?AUTO_10860 - BLOCK
      ?AUTO_10862 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_10858 ) ( ON-TABLE ?AUTO_10857 ) ( CLEAR ?AUTO_10860 ) ( ON ?AUTO_10862 ?AUTO_10857 ) ( CLEAR ?AUTO_10862 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_10862 ?AUTO_10857 )
      ( MAKE-ON ?AUTO_10857 ?AUTO_10858 )
      ( MAKE-ON-VERIFY ?AUTO_10857 ?AUTO_10858 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10865 - BLOCK
      ?AUTO_10866 - BLOCK
    )
    :vars
    (
      ?AUTO_10869 - BLOCK
      ?AUTO_10870 - BLOCK
      ?AUTO_10871 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_10866 ) ( ON-TABLE ?AUTO_10865 ) ( CLEAR ?AUTO_10869 ) ( ON ?AUTO_10870 ?AUTO_10865 ) ( CLEAR ?AUTO_10870 ) ( HOLDING ?AUTO_10871 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_10871 )
      ( MAKE-ON ?AUTO_10865 ?AUTO_10866 )
      ( MAKE-ON-VERIFY ?AUTO_10865 ?AUTO_10866 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10872 - BLOCK
      ?AUTO_10873 - BLOCK
    )
    :vars
    (
      ?AUTO_10877 - BLOCK
      ?AUTO_10876 - BLOCK
      ?AUTO_10878 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_10873 ) ( ON-TABLE ?AUTO_10872 ) ( CLEAR ?AUTO_10877 ) ( ON ?AUTO_10876 ?AUTO_10872 ) ( ON ?AUTO_10878 ?AUTO_10876 ) ( CLEAR ?AUTO_10878 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_10878 ?AUTO_10876 )
      ( MAKE-ON ?AUTO_10872 ?AUTO_10873 )
      ( MAKE-ON-VERIFY ?AUTO_10872 ?AUTO_10873 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10881 - BLOCK
      ?AUTO_10882 - BLOCK
    )
    :vars
    (
      ?AUTO_10885 - BLOCK
      ?AUTO_10886 - BLOCK
      ?AUTO_10883 - BLOCK
      ?AUTO_10888 - BLOCK
      ?AUTO_10889 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_10882 ) ( ON-TABLE ?AUTO_10881 ) ( CLEAR ?AUTO_10885 ) ( ON ?AUTO_10886 ?AUTO_10881 ) ( ON ?AUTO_10883 ?AUTO_10886 ) ( CLEAR ?AUTO_10883 ) ( HOLDING ?AUTO_10888 ) ( CLEAR ?AUTO_10889 ) )
    :subtasks
    ( ( !STACK ?AUTO_10888 ?AUTO_10889 )
      ( MAKE-ON ?AUTO_10881 ?AUTO_10882 )
      ( MAKE-ON-VERIFY ?AUTO_10881 ?AUTO_10882 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10890 - BLOCK
      ?AUTO_10891 - BLOCK
    )
    :vars
    (
      ?AUTO_10898 - BLOCK
      ?AUTO_10892 - BLOCK
      ?AUTO_10893 - BLOCK
      ?AUTO_10895 - BLOCK
      ?AUTO_10894 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_10891 ) ( ON-TABLE ?AUTO_10890 ) ( CLEAR ?AUTO_10898 ) ( ON ?AUTO_10892 ?AUTO_10890 ) ( ON ?AUTO_10893 ?AUTO_10892 ) ( CLEAR ?AUTO_10895 ) ( ON ?AUTO_10894 ?AUTO_10893 ) ( CLEAR ?AUTO_10894 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_10894 ?AUTO_10893 )
      ( MAKE-ON ?AUTO_10890 ?AUTO_10891 )
      ( MAKE-ON-VERIFY ?AUTO_10890 ?AUTO_10891 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10901 - BLOCK
      ?AUTO_10902 - BLOCK
    )
    :vars
    (
      ?AUTO_10906 - BLOCK
      ?AUTO_10908 - BLOCK
      ?AUTO_10905 - BLOCK
      ?AUTO_10909 - BLOCK
      ?AUTO_10907 - BLOCK
      ?AUTO_10911 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_10902 ) ( ON-TABLE ?AUTO_10901 ) ( ON ?AUTO_10906 ?AUTO_10901 ) ( ON ?AUTO_10908 ?AUTO_10906 ) ( CLEAR ?AUTO_10905 ) ( ON ?AUTO_10909 ?AUTO_10908 ) ( CLEAR ?AUTO_10909 ) ( HOLDING ?AUTO_10907 ) ( CLEAR ?AUTO_10911 ) )
    :subtasks
    ( ( !STACK ?AUTO_10907 ?AUTO_10911 )
      ( MAKE-ON ?AUTO_10901 ?AUTO_10902 )
      ( MAKE-ON-VERIFY ?AUTO_10901 ?AUTO_10902 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10932 - BLOCK
      ?AUTO_10933 - BLOCK
    )
    :vars
    (
      ?AUTO_10938 - BLOCK
      ?AUTO_10935 - BLOCK
      ?AUTO_10937 - BLOCK
      ?AUTO_10940 - BLOCK
      ?AUTO_10941 - BLOCK
      ?AUTO_10939 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_10933 ) ( ON-TABLE ?AUTO_10932 ) ( ON ?AUTO_10938 ?AUTO_10932 ) ( ON ?AUTO_10935 ?AUTO_10938 ) ( CLEAR ?AUTO_10937 ) ( ON ?AUTO_10940 ?AUTO_10935 ) ( CLEAR ?AUTO_10941 ) ( ON ?AUTO_10939 ?AUTO_10940 ) ( CLEAR ?AUTO_10939 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_10939 ?AUTO_10940 )
      ( MAKE-ON ?AUTO_10932 ?AUTO_10933 )
      ( MAKE-ON-VERIFY ?AUTO_10932 ?AUTO_10933 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10944 - BLOCK
      ?AUTO_10945 - BLOCK
    )
    :vars
    (
      ?AUTO_10951 - BLOCK
      ?AUTO_10950 - BLOCK
      ?AUTO_10952 - BLOCK
      ?AUTO_10948 - BLOCK
      ?AUTO_10953 - BLOCK
      ?AUTO_10949 - BLOCK
      ?AUTO_10954 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_10945 ) ( ON-TABLE ?AUTO_10944 ) ( ON ?AUTO_10951 ?AUTO_10944 ) ( ON ?AUTO_10950 ?AUTO_10951 ) ( CLEAR ?AUTO_10952 ) ( ON ?AUTO_10948 ?AUTO_10950 ) ( CLEAR ?AUTO_10953 ) ( ON ?AUTO_10949 ?AUTO_10948 ) ( CLEAR ?AUTO_10949 ) ( HOLDING ?AUTO_10954 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_10954 )
      ( MAKE-ON ?AUTO_10944 ?AUTO_10945 )
      ( MAKE-ON-VERIFY ?AUTO_10944 ?AUTO_10945 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10961 - BLOCK
      ?AUTO_10962 - BLOCK
    )
    :vars
    (
      ?AUTO_10970 - BLOCK
      ?AUTO_10965 - BLOCK
      ?AUTO_10964 - BLOCK
      ?AUTO_10963 - BLOCK
      ?AUTO_10966 - BLOCK
      ?AUTO_10967 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_10961 ) ( ON ?AUTO_10970 ?AUTO_10961 ) ( ON ?AUTO_10965 ?AUTO_10970 ) ( CLEAR ?AUTO_10964 ) ( ON ?AUTO_10963 ?AUTO_10965 ) ( CLEAR ?AUTO_10966 ) ( ON ?AUTO_10967 ?AUTO_10963 ) ( CLEAR ?AUTO_10967 ) ( HOLDING ?AUTO_10962 ) )
    :subtasks
    ( ( !PUTDOWN ?AUTO_10962 )
      ( MAKE-ON ?AUTO_10961 ?AUTO_10962 )
      ( MAKE-ON-VERIFY ?AUTO_10961 ?AUTO_10962 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10976 - BLOCK
      ?AUTO_10977 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_10976 ) ( CLEAR ?AUTO_10977 ) )
    :subtasks
    ( ( !STACK ?AUTO_10976 ?AUTO_10977 )
      ( MAKE-ON-VERIFY ?AUTO_10976 ?AUTO_10977 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10980 - BLOCK
      ?AUTO_10981 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_10981 ) ( ON-TABLE ?AUTO_10980 ) ( CLEAR ?AUTO_10980 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?AUTO_10980 )
      ( MAKE-ON ?AUTO_10980 ?AUTO_10981 )
      ( MAKE-ON-VERIFY ?AUTO_10980 ?AUTO_10981 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10985 - BLOCK
      ?AUTO_10986 - BLOCK
    )
    :vars
    (
      ?AUTO_10989 - BLOCK
      ?AUTO_10990 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_10986 ) ( ON-TABLE ?AUTO_10985 ) ( CLEAR ?AUTO_10985 ) ( HOLDING ?AUTO_10989 ) ( CLEAR ?AUTO_10990 ) )
    :subtasks
    ( ( !STACK ?AUTO_10989 ?AUTO_10990 )
      ( MAKE-ON ?AUTO_10985 ?AUTO_10986 )
      ( MAKE-ON-VERIFY ?AUTO_10985 ?AUTO_10986 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_10993 - BLOCK
      ?AUTO_10994 - BLOCK
    )
    :vars
    (
      ?AUTO_10998 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?AUTO_10993 ) ( CLEAR ?AUTO_10993 ) ( HOLDING ?AUTO_10994 ) ( CLEAR ?AUTO_10998 ) )
    :subtasks
    ( ( !STACK ?AUTO_10994 ?AUTO_10998 )
      ( MAKE-ON ?AUTO_10993 ?AUTO_10994 )
      ( MAKE-ON-VERIFY ?AUTO_10993 ?AUTO_10994 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_11101 - BLOCK
      ?AUTO_11102 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?AUTO_11101 ) ( CLEAR ?AUTO_11102 ) )
    :subtasks
    ( ( !STACK ?AUTO_11101 ?AUTO_11102 )
      ( MAKE-ON-VERIFY ?AUTO_11101 ?AUTO_11102 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_11105 - BLOCK
      ?AUTO_11106 - BLOCK
    )
    :vars
    (
      ?AUTO_11110 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_11106 ) ( ON ?AUTO_11105 ?AUTO_11110 ) ( CLEAR ?AUTO_11105 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !UNSTACK ?AUTO_11105 ?AUTO_11110 )
      ( MAKE-ON ?AUTO_11105 ?AUTO_11106 )
      ( MAKE-ON-VERIFY ?AUTO_11105 ?AUTO_11106 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_11111 - BLOCK
      ?AUTO_11112 - BLOCK
    )
    :vars
    (
      ?AUTO_11115 - BLOCK
      ?AUTO_11117 - BLOCK
    )
    :precondition
    ( and ( ON ?AUTO_11111 ?AUTO_11115 ) ( CLEAR ?AUTO_11111 ) ( HOLDING ?AUTO_11112 ) ( CLEAR ?AUTO_11117 ) )
    :subtasks
    ( ( !STACK ?AUTO_11112 ?AUTO_11117 )
      ( MAKE-ON ?AUTO_11111 ?AUTO_11112 )
      ( MAKE-ON-VERIFY ?AUTO_11111 ?AUTO_11112 ) )
  )

  ( :method MAKE-ON
    :parameters
    (
      ?AUTO_11120 - BLOCK
      ?AUTO_11121 - BLOCK
    )
    :vars
    (
      ?AUTO_11124 - BLOCK
      ?AUTO_11125 - BLOCK
      ?AUTO_11126 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?AUTO_11121 ) ( ON ?AUTO_11120 ?AUTO_11124 ) ( CLEAR ?AUTO_11120 ) ( HOLDING ?AUTO_11125 ) ( CLEAR ?AUTO_11126 ) )
    :subtasks
    ( ( !STACK ?AUTO_11125 ?AUTO_11126 )
      ( MAKE-ON ?AUTO_11120 ?AUTO_11121 )
      ( MAKE-ON-VERIFY ?AUTO_11120 ?AUTO_11121 ) )
  )

)

