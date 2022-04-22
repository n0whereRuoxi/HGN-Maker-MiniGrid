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
      ?auto_224 - BLOCK
      ?auto_225 - BLOCK
    )
    :vars
    (
      ?auto_226 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_226 ?auto_225 ) ( CLEAR ?auto_226 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_224 ) ( ON ?auto_225 ?auto_224 ) ( not ( = ?auto_224 ?auto_225 ) ) ( not ( = ?auto_224 ?auto_226 ) ) ( not ( = ?auto_225 ?auto_226 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_226 ?auto_225 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_228 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_228 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_228 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_229 - BLOCK
    )
    :vars
    (
      ?auto_230 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_229 ?auto_230 ) ( CLEAR ?auto_229 ) ( HAND-EMPTY ) ( not ( = ?auto_229 ?auto_230 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_229 ?auto_230 )
      ( MAKE-1PILE ?auto_229 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_232 - BLOCK
    )
    :vars
    (
      ?auto_233 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_233 ?auto_232 ) ( CLEAR ?auto_233 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_232 ) ( not ( = ?auto_232 ?auto_233 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_233 ?auto_232 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_234 - BLOCK
    )
    :vars
    (
      ?auto_235 - BLOCK
      ?auto_236 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_235 ?auto_234 ) ( CLEAR ?auto_235 ) ( ON-TABLE ?auto_234 ) ( not ( = ?auto_234 ?auto_235 ) ) ( HOLDING ?auto_236 ) ( not ( = ?auto_234 ?auto_236 ) ) ( not ( = ?auto_235 ?auto_236 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_236 )
      ( MAKE-1PILE ?auto_234 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_237 - BLOCK
    )
    :vars
    (
      ?auto_238 - BLOCK
      ?auto_239 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_238 ?auto_237 ) ( ON-TABLE ?auto_237 ) ( not ( = ?auto_237 ?auto_238 ) ) ( not ( = ?auto_237 ?auto_239 ) ) ( not ( = ?auto_238 ?auto_239 ) ) ( ON ?auto_239 ?auto_238 ) ( CLEAR ?auto_239 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_237 ?auto_238 )
      ( MAKE-1PILE ?auto_237 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_242 - BLOCK
      ?auto_243 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_243 ) ( CLEAR ?auto_242 ) ( ON-TABLE ?auto_242 ) ( not ( = ?auto_242 ?auto_243 ) ) )
    :subtasks
    ( ( !STACK ?auto_243 ?auto_242 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_244 - BLOCK
      ?auto_245 - BLOCK
    )
    :vars
    (
      ?auto_246 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_244 ) ( ON-TABLE ?auto_244 ) ( not ( = ?auto_244 ?auto_245 ) ) ( ON ?auto_245 ?auto_246 ) ( CLEAR ?auto_245 ) ( HAND-EMPTY ) ( not ( = ?auto_244 ?auto_246 ) ) ( not ( = ?auto_245 ?auto_246 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_245 ?auto_246 )
      ( MAKE-2PILE ?auto_244 ?auto_245 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_247 - BLOCK
      ?auto_248 - BLOCK
    )
    :vars
    (
      ?auto_249 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_247 ?auto_248 ) ) ( ON ?auto_248 ?auto_249 ) ( CLEAR ?auto_248 ) ( not ( = ?auto_247 ?auto_249 ) ) ( not ( = ?auto_248 ?auto_249 ) ) ( HOLDING ?auto_247 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_247 )
      ( MAKE-2PILE ?auto_247 ?auto_248 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_250 - BLOCK
      ?auto_251 - BLOCK
    )
    :vars
    (
      ?auto_252 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_250 ?auto_251 ) ) ( ON ?auto_251 ?auto_252 ) ( not ( = ?auto_250 ?auto_252 ) ) ( not ( = ?auto_251 ?auto_252 ) ) ( ON ?auto_250 ?auto_251 ) ( CLEAR ?auto_250 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_252 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_252 ?auto_251 )
      ( MAKE-2PILE ?auto_250 ?auto_251 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_269 - BLOCK
    )
    :vars
    (
      ?auto_270 - BLOCK
      ?auto_271 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_269 ?auto_270 ) ( CLEAR ?auto_269 ) ( not ( = ?auto_269 ?auto_270 ) ) ( HOLDING ?auto_271 ) ( not ( = ?auto_269 ?auto_271 ) ) ( not ( = ?auto_270 ?auto_271 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_271 )
      ( MAKE-1PILE ?auto_269 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_272 - BLOCK
    )
    :vars
    (
      ?auto_273 - BLOCK
      ?auto_274 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_272 ?auto_273 ) ( not ( = ?auto_272 ?auto_273 ) ) ( not ( = ?auto_272 ?auto_274 ) ) ( not ( = ?auto_273 ?auto_274 ) ) ( ON ?auto_274 ?auto_272 ) ( CLEAR ?auto_274 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_273 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_273 ?auto_272 )
      ( MAKE-1PILE ?auto_272 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_279 - BLOCK
      ?auto_280 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_279 ) ( ON-TABLE ?auto_279 ) ( not ( = ?auto_279 ?auto_280 ) ) ( ON-TABLE ?auto_280 ) ( CLEAR ?auto_280 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_280 )
      ( MAKE-2PILE ?auto_279 ?auto_280 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_281 - BLOCK
      ?auto_282 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_281 ?auto_282 ) ) ( ON-TABLE ?auto_282 ) ( CLEAR ?auto_282 ) ( HOLDING ?auto_281 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_281 )
      ( MAKE-2PILE ?auto_281 ?auto_282 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_283 - BLOCK
      ?auto_284 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_283 ?auto_284 ) ) ( ON-TABLE ?auto_284 ) ( ON ?auto_283 ?auto_284 ) ( CLEAR ?auto_283 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_284 )
      ( MAKE-2PILE ?auto_283 ?auto_284 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_287 - BLOCK
      ?auto_288 - BLOCK
    )
    :vars
    (
      ?auto_289 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_287 ?auto_288 ) ) ( ON-TABLE ?auto_288 ) ( CLEAR ?auto_288 ) ( ON ?auto_287 ?auto_289 ) ( CLEAR ?auto_287 ) ( HAND-EMPTY ) ( not ( = ?auto_287 ?auto_289 ) ) ( not ( = ?auto_288 ?auto_289 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_287 ?auto_289 )
      ( MAKE-2PILE ?auto_287 ?auto_288 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_290 - BLOCK
      ?auto_291 - BLOCK
    )
    :vars
    (
      ?auto_292 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_290 ?auto_291 ) ) ( ON ?auto_290 ?auto_292 ) ( CLEAR ?auto_290 ) ( not ( = ?auto_290 ?auto_292 ) ) ( not ( = ?auto_291 ?auto_292 ) ) ( HOLDING ?auto_291 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_291 )
      ( MAKE-2PILE ?auto_290 ?auto_291 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_293 - BLOCK
      ?auto_294 - BLOCK
    )
    :vars
    (
      ?auto_295 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_293 ?auto_294 ) ) ( ON ?auto_293 ?auto_295 ) ( not ( = ?auto_293 ?auto_295 ) ) ( not ( = ?auto_294 ?auto_295 ) ) ( ON ?auto_294 ?auto_293 ) ( CLEAR ?auto_294 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_295 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_295 ?auto_293 )
      ( MAKE-2PILE ?auto_293 ?auto_294 ) )
  )

)

