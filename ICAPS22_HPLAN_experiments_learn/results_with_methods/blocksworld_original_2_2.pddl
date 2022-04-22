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
      ?auto_164 - BLOCK
      ?auto_165 - BLOCK
    )
    :vars
    (
      ?auto_166 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_166 ?auto_165 ) ( CLEAR ?auto_166 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_164 ) ( ON ?auto_165 ?auto_164 ) ( not ( = ?auto_164 ?auto_165 ) ) ( not ( = ?auto_164 ?auto_166 ) ) ( not ( = ?auto_165 ?auto_166 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_166 ?auto_165 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_168 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_168 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_168 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_169 - BLOCK
    )
    :vars
    (
      ?auto_170 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_169 ?auto_170 ) ( CLEAR ?auto_169 ) ( HAND-EMPTY ) ( not ( = ?auto_169 ?auto_170 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_169 ?auto_170 )
      ( MAKE-1PILE ?auto_169 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_172 - BLOCK
    )
    :vars
    (
      ?auto_173 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_173 ?auto_172 ) ( CLEAR ?auto_173 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_172 ) ( not ( = ?auto_172 ?auto_173 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_173 ?auto_172 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_174 - BLOCK
    )
    :vars
    (
      ?auto_175 - BLOCK
      ?auto_176 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_175 ?auto_174 ) ( CLEAR ?auto_175 ) ( ON-TABLE ?auto_174 ) ( not ( = ?auto_174 ?auto_175 ) ) ( HOLDING ?auto_176 ) ( not ( = ?auto_174 ?auto_176 ) ) ( not ( = ?auto_175 ?auto_176 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_176 )
      ( MAKE-1PILE ?auto_174 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_177 - BLOCK
    )
    :vars
    (
      ?auto_179 - BLOCK
      ?auto_178 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_179 ?auto_177 ) ( ON-TABLE ?auto_177 ) ( not ( = ?auto_177 ?auto_179 ) ) ( not ( = ?auto_177 ?auto_178 ) ) ( not ( = ?auto_179 ?auto_178 ) ) ( ON ?auto_178 ?auto_179 ) ( CLEAR ?auto_178 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_177 ?auto_179 )
      ( MAKE-1PILE ?auto_177 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_182 - BLOCK
      ?auto_183 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_183 ) ( CLEAR ?auto_182 ) ( ON-TABLE ?auto_182 ) ( not ( = ?auto_182 ?auto_183 ) ) )
    :subtasks
    ( ( !STACK ?auto_183 ?auto_182 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_184 - BLOCK
      ?auto_185 - BLOCK
    )
    :vars
    (
      ?auto_186 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_184 ) ( ON-TABLE ?auto_184 ) ( not ( = ?auto_184 ?auto_185 ) ) ( ON ?auto_185 ?auto_186 ) ( CLEAR ?auto_185 ) ( HAND-EMPTY ) ( not ( = ?auto_184 ?auto_186 ) ) ( not ( = ?auto_185 ?auto_186 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_185 ?auto_186 )
      ( MAKE-2PILE ?auto_184 ?auto_185 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_187 - BLOCK
      ?auto_188 - BLOCK
    )
    :vars
    (
      ?auto_189 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_187 ?auto_188 ) ) ( ON ?auto_188 ?auto_189 ) ( CLEAR ?auto_188 ) ( not ( = ?auto_187 ?auto_189 ) ) ( not ( = ?auto_188 ?auto_189 ) ) ( HOLDING ?auto_187 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_187 )
      ( MAKE-2PILE ?auto_187 ?auto_188 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_190 - BLOCK
      ?auto_191 - BLOCK
    )
    :vars
    (
      ?auto_192 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_190 ?auto_191 ) ) ( ON ?auto_191 ?auto_192 ) ( not ( = ?auto_190 ?auto_192 ) ) ( not ( = ?auto_191 ?auto_192 ) ) ( ON ?auto_190 ?auto_191 ) ( CLEAR ?auto_190 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_192 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_192 ?auto_191 )
      ( MAKE-2PILE ?auto_190 ?auto_191 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_194 - BLOCK
    )
    :vars
    (
      ?auto_195 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_195 ?auto_194 ) ( CLEAR ?auto_195 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_194 ) ( not ( = ?auto_194 ?auto_195 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_195 ?auto_194 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_201 - BLOCK
    )
    :vars
    (
      ?auto_202 - BLOCK
      ?auto_203 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_201 ?auto_202 ) ) ( ON ?auto_202 ?auto_203 ) ( CLEAR ?auto_202 ) ( not ( = ?auto_201 ?auto_203 ) ) ( not ( = ?auto_202 ?auto_203 ) ) ( HOLDING ?auto_201 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_201 ?auto_202 )
      ( MAKE-1PILE ?auto_201 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_204 - BLOCK
    )
    :vars
    (
      ?auto_206 - BLOCK
      ?auto_205 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_204 ?auto_206 ) ) ( ON ?auto_206 ?auto_205 ) ( not ( = ?auto_204 ?auto_205 ) ) ( not ( = ?auto_206 ?auto_205 ) ) ( ON ?auto_204 ?auto_206 ) ( CLEAR ?auto_204 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_205 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_205 ?auto_206 )
      ( MAKE-1PILE ?auto_204 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_208 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_208 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_208 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_209 - BLOCK
    )
    :vars
    (
      ?auto_210 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_209 ?auto_210 ) ( CLEAR ?auto_209 ) ( HAND-EMPTY ) ( not ( = ?auto_209 ?auto_210 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_209 ?auto_210 )
      ( MAKE-1PILE ?auto_209 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_211 - BLOCK
    )
    :vars
    (
      ?auto_212 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_211 ?auto_212 ) ) ( HOLDING ?auto_211 ) ( CLEAR ?auto_212 ) ( ON-TABLE ?auto_212 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_212 ?auto_211 )
      ( MAKE-1PILE ?auto_211 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_213 - BLOCK
    )
    :vars
    (
      ?auto_214 - BLOCK
      ?auto_215 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_213 ?auto_214 ) ) ( CLEAR ?auto_214 ) ( ON-TABLE ?auto_214 ) ( ON ?auto_213 ?auto_215 ) ( CLEAR ?auto_213 ) ( HAND-EMPTY ) ( not ( = ?auto_213 ?auto_215 ) ) ( not ( = ?auto_214 ?auto_215 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_213 ?auto_215 )
      ( MAKE-1PILE ?auto_213 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_216 - BLOCK
    )
    :vars
    (
      ?auto_217 - BLOCK
      ?auto_218 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_216 ?auto_217 ) ) ( ON ?auto_216 ?auto_218 ) ( CLEAR ?auto_216 ) ( not ( = ?auto_216 ?auto_218 ) ) ( not ( = ?auto_217 ?auto_218 ) ) ( HOLDING ?auto_217 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_217 )
      ( MAKE-1PILE ?auto_216 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_219 - BLOCK
    )
    :vars
    (
      ?auto_220 - BLOCK
      ?auto_221 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_219 ?auto_220 ) ) ( ON ?auto_219 ?auto_221 ) ( not ( = ?auto_219 ?auto_221 ) ) ( not ( = ?auto_220 ?auto_221 ) ) ( ON ?auto_220 ?auto_219 ) ( CLEAR ?auto_220 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_221 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_221 ?auto_219 )
      ( MAKE-1PILE ?auto_219 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_224 - BLOCK
      ?auto_225 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_225 ) ( CLEAR ?auto_224 ) ( ON-TABLE ?auto_224 ) ( not ( = ?auto_224 ?auto_225 ) ) )
    :subtasks
    ( ( !STACK ?auto_225 ?auto_224 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_226 - BLOCK
      ?auto_227 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_226 ) ( ON-TABLE ?auto_226 ) ( not ( = ?auto_226 ?auto_227 ) ) ( ON-TABLE ?auto_227 ) ( CLEAR ?auto_227 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_227 )
      ( MAKE-2PILE ?auto_226 ?auto_227 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_228 - BLOCK
      ?auto_229 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_228 ?auto_229 ) ) ( ON-TABLE ?auto_229 ) ( CLEAR ?auto_229 ) ( HOLDING ?auto_228 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_228 )
      ( MAKE-2PILE ?auto_228 ?auto_229 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_230 - BLOCK
      ?auto_231 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_230 ?auto_231 ) ) ( ON-TABLE ?auto_231 ) ( ON ?auto_230 ?auto_231 ) ( CLEAR ?auto_230 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_231 )
      ( MAKE-2PILE ?auto_230 ?auto_231 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_232 - BLOCK
      ?auto_233 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_232 ?auto_233 ) ) ( ON-TABLE ?auto_233 ) ( HOLDING ?auto_232 ) ( CLEAR ?auto_233 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_233 ?auto_232 )
      ( MAKE-2PILE ?auto_232 ?auto_233 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_234 - BLOCK
      ?auto_235 - BLOCK
    )
    :vars
    (
      ?auto_236 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_234 ?auto_235 ) ) ( ON-TABLE ?auto_235 ) ( CLEAR ?auto_235 ) ( ON ?auto_234 ?auto_236 ) ( CLEAR ?auto_234 ) ( HAND-EMPTY ) ( not ( = ?auto_234 ?auto_236 ) ) ( not ( = ?auto_235 ?auto_236 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_234 ?auto_236 )
      ( MAKE-2PILE ?auto_234 ?auto_235 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_237 - BLOCK
      ?auto_238 - BLOCK
    )
    :vars
    (
      ?auto_239 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_237 ?auto_238 ) ) ( ON ?auto_237 ?auto_239 ) ( CLEAR ?auto_237 ) ( not ( = ?auto_237 ?auto_239 ) ) ( not ( = ?auto_238 ?auto_239 ) ) ( HOLDING ?auto_238 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_238 )
      ( MAKE-2PILE ?auto_237 ?auto_238 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_240 - BLOCK
      ?auto_241 - BLOCK
    )
    :vars
    (
      ?auto_242 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_240 ?auto_241 ) ) ( ON ?auto_240 ?auto_242 ) ( not ( = ?auto_240 ?auto_242 ) ) ( not ( = ?auto_241 ?auto_242 ) ) ( ON ?auto_241 ?auto_240 ) ( CLEAR ?auto_241 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_242 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_242 ?auto_240 )
      ( MAKE-2PILE ?auto_240 ?auto_241 ) )
  )

)

