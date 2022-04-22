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
      ?auto_245 - BLOCK
      ?auto_246 - BLOCK
    )
    :vars
    (
      ?auto_247 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_247 ?auto_246 ) ( CLEAR ?auto_247 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_245 ) ( ON ?auto_246 ?auto_245 ) ( not ( = ?auto_245 ?auto_246 ) ) ( not ( = ?auto_245 ?auto_247 ) ) ( not ( = ?auto_246 ?auto_247 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_247 ?auto_246 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_249 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_249 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_249 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_250 - BLOCK
    )
    :vars
    (
      ?auto_251 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_250 ?auto_251 ) ( CLEAR ?auto_250 ) ( HAND-EMPTY ) ( not ( = ?auto_250 ?auto_251 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_250 ?auto_251 )
      ( MAKE-1PILE ?auto_250 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_253 - BLOCK
    )
    :vars
    (
      ?auto_254 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_254 ?auto_253 ) ( CLEAR ?auto_254 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_253 ) ( not ( = ?auto_253 ?auto_254 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_254 ?auto_253 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_255 - BLOCK
    )
    :vars
    (
      ?auto_256 - BLOCK
      ?auto_257 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_256 ?auto_255 ) ( CLEAR ?auto_256 ) ( ON-TABLE ?auto_255 ) ( not ( = ?auto_255 ?auto_256 ) ) ( HOLDING ?auto_257 ) ( not ( = ?auto_255 ?auto_257 ) ) ( not ( = ?auto_256 ?auto_257 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_257 )
      ( MAKE-1PILE ?auto_255 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_258 - BLOCK
    )
    :vars
    (
      ?auto_259 - BLOCK
      ?auto_260 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_259 ?auto_258 ) ( ON-TABLE ?auto_258 ) ( not ( = ?auto_258 ?auto_259 ) ) ( not ( = ?auto_258 ?auto_260 ) ) ( not ( = ?auto_259 ?auto_260 ) ) ( ON ?auto_260 ?auto_259 ) ( CLEAR ?auto_260 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_258 ?auto_259 )
      ( MAKE-1PILE ?auto_258 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_263 - BLOCK
      ?auto_264 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_264 ) ( CLEAR ?auto_263 ) ( ON-TABLE ?auto_263 ) ( not ( = ?auto_263 ?auto_264 ) ) )
    :subtasks
    ( ( !STACK ?auto_264 ?auto_263 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_265 - BLOCK
      ?auto_266 - BLOCK
    )
    :vars
    (
      ?auto_267 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_265 ) ( ON-TABLE ?auto_265 ) ( not ( = ?auto_265 ?auto_266 ) ) ( ON ?auto_266 ?auto_267 ) ( CLEAR ?auto_266 ) ( HAND-EMPTY ) ( not ( = ?auto_265 ?auto_267 ) ) ( not ( = ?auto_266 ?auto_267 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_266 ?auto_267 )
      ( MAKE-2PILE ?auto_265 ?auto_266 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_268 - BLOCK
      ?auto_269 - BLOCK
    )
    :vars
    (
      ?auto_270 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_268 ?auto_269 ) ) ( ON ?auto_269 ?auto_270 ) ( CLEAR ?auto_269 ) ( not ( = ?auto_268 ?auto_270 ) ) ( not ( = ?auto_269 ?auto_270 ) ) ( HOLDING ?auto_268 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_268 )
      ( MAKE-2PILE ?auto_268 ?auto_269 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_271 - BLOCK
      ?auto_272 - BLOCK
    )
    :vars
    (
      ?auto_273 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_271 ?auto_272 ) ) ( ON ?auto_272 ?auto_273 ) ( not ( = ?auto_271 ?auto_273 ) ) ( not ( = ?auto_272 ?auto_273 ) ) ( ON ?auto_271 ?auto_272 ) ( CLEAR ?auto_271 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_273 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_273 ?auto_272 )
      ( MAKE-2PILE ?auto_271 ?auto_272 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_275 - BLOCK
    )
    :vars
    (
      ?auto_276 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_276 ?auto_275 ) ( CLEAR ?auto_276 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_275 ) ( not ( = ?auto_275 ?auto_276 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_276 ?auto_275 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_282 - BLOCK
    )
    :vars
    (
      ?auto_283 - BLOCK
      ?auto_284 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_282 ?auto_283 ) ) ( ON ?auto_283 ?auto_284 ) ( CLEAR ?auto_283 ) ( not ( = ?auto_282 ?auto_284 ) ) ( not ( = ?auto_283 ?auto_284 ) ) ( HOLDING ?auto_282 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_282 ?auto_283 )
      ( MAKE-1PILE ?auto_282 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_285 - BLOCK
    )
    :vars
    (
      ?auto_287 - BLOCK
      ?auto_286 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_285 ?auto_287 ) ) ( ON ?auto_287 ?auto_286 ) ( not ( = ?auto_285 ?auto_286 ) ) ( not ( = ?auto_287 ?auto_286 ) ) ( ON ?auto_285 ?auto_287 ) ( CLEAR ?auto_285 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_286 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_286 ?auto_287 )
      ( MAKE-1PILE ?auto_285 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_289 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_289 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_289 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_290 - BLOCK
    )
    :vars
    (
      ?auto_291 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_290 ?auto_291 ) ( CLEAR ?auto_290 ) ( HAND-EMPTY ) ( not ( = ?auto_290 ?auto_291 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_290 ?auto_291 )
      ( MAKE-1PILE ?auto_290 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_292 - BLOCK
    )
    :vars
    (
      ?auto_293 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_292 ?auto_293 ) ) ( HOLDING ?auto_292 ) ( CLEAR ?auto_293 ) ( ON-TABLE ?auto_293 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_293 ?auto_292 )
      ( MAKE-1PILE ?auto_292 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_294 - BLOCK
    )
    :vars
    (
      ?auto_295 - BLOCK
      ?auto_296 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_294 ?auto_295 ) ) ( CLEAR ?auto_295 ) ( ON-TABLE ?auto_295 ) ( ON ?auto_294 ?auto_296 ) ( CLEAR ?auto_294 ) ( HAND-EMPTY ) ( not ( = ?auto_294 ?auto_296 ) ) ( not ( = ?auto_295 ?auto_296 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_294 ?auto_296 )
      ( MAKE-1PILE ?auto_294 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_297 - BLOCK
    )
    :vars
    (
      ?auto_298 - BLOCK
      ?auto_299 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_297 ?auto_298 ) ) ( ON ?auto_297 ?auto_299 ) ( CLEAR ?auto_297 ) ( not ( = ?auto_297 ?auto_299 ) ) ( not ( = ?auto_298 ?auto_299 ) ) ( HOLDING ?auto_298 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_298 )
      ( MAKE-1PILE ?auto_297 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_300 - BLOCK
    )
    :vars
    (
      ?auto_302 - BLOCK
      ?auto_301 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_300 ?auto_302 ) ) ( ON ?auto_300 ?auto_301 ) ( not ( = ?auto_300 ?auto_301 ) ) ( not ( = ?auto_302 ?auto_301 ) ) ( ON ?auto_302 ?auto_300 ) ( CLEAR ?auto_302 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_301 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_301 ?auto_300 )
      ( MAKE-1PILE ?auto_300 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_305 - BLOCK
      ?auto_306 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_306 ) ( CLEAR ?auto_305 ) ( ON-TABLE ?auto_305 ) ( not ( = ?auto_305 ?auto_306 ) ) )
    :subtasks
    ( ( !STACK ?auto_306 ?auto_305 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_307 - BLOCK
      ?auto_308 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_307 ) ( ON-TABLE ?auto_307 ) ( not ( = ?auto_307 ?auto_308 ) ) ( ON-TABLE ?auto_308 ) ( CLEAR ?auto_308 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_308 )
      ( MAKE-2PILE ?auto_307 ?auto_308 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_309 - BLOCK
      ?auto_310 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_309 ?auto_310 ) ) ( ON-TABLE ?auto_310 ) ( CLEAR ?auto_310 ) ( HOLDING ?auto_309 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_309 )
      ( MAKE-2PILE ?auto_309 ?auto_310 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_311 - BLOCK
      ?auto_312 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_311 ?auto_312 ) ) ( ON-TABLE ?auto_312 ) ( ON ?auto_311 ?auto_312 ) ( CLEAR ?auto_311 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_312 )
      ( MAKE-2PILE ?auto_311 ?auto_312 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_313 - BLOCK
      ?auto_314 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_313 ?auto_314 ) ) ( ON-TABLE ?auto_314 ) ( HOLDING ?auto_313 ) ( CLEAR ?auto_314 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_314 ?auto_313 )
      ( MAKE-2PILE ?auto_313 ?auto_314 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_315 - BLOCK
      ?auto_316 - BLOCK
    )
    :vars
    (
      ?auto_317 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_315 ?auto_316 ) ) ( ON-TABLE ?auto_316 ) ( CLEAR ?auto_316 ) ( ON ?auto_315 ?auto_317 ) ( CLEAR ?auto_315 ) ( HAND-EMPTY ) ( not ( = ?auto_315 ?auto_317 ) ) ( not ( = ?auto_316 ?auto_317 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_315 ?auto_317 )
      ( MAKE-2PILE ?auto_315 ?auto_316 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_318 - BLOCK
      ?auto_319 - BLOCK
    )
    :vars
    (
      ?auto_320 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_318 ?auto_319 ) ) ( ON ?auto_318 ?auto_320 ) ( CLEAR ?auto_318 ) ( not ( = ?auto_318 ?auto_320 ) ) ( not ( = ?auto_319 ?auto_320 ) ) ( HOLDING ?auto_319 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_319 )
      ( MAKE-2PILE ?auto_318 ?auto_319 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_321 - BLOCK
      ?auto_322 - BLOCK
    )
    :vars
    (
      ?auto_323 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_321 ?auto_322 ) ) ( ON ?auto_321 ?auto_323 ) ( not ( = ?auto_321 ?auto_323 ) ) ( not ( = ?auto_322 ?auto_323 ) ) ( ON ?auto_322 ?auto_321 ) ( CLEAR ?auto_322 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_323 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_323 ?auto_321 )
      ( MAKE-2PILE ?auto_321 ?auto_322 ) )
  )

)

