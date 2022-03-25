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

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_63252 - BLOCK
      ?auto_63253 - BLOCK
      ?auto_63254 - BLOCK
      ?auto_63255 - BLOCK
      ?auto_63256 - BLOCK
      ?auto_63257 - BLOCK
    )
    :vars
    (
      ?auto_63258 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63258 ?auto_63257 ) ( CLEAR ?auto_63258 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_63252 ) ( ON ?auto_63253 ?auto_63252 ) ( ON ?auto_63254 ?auto_63253 ) ( ON ?auto_63255 ?auto_63254 ) ( ON ?auto_63256 ?auto_63255 ) ( ON ?auto_63257 ?auto_63256 ) ( not ( = ?auto_63252 ?auto_63253 ) ) ( not ( = ?auto_63252 ?auto_63254 ) ) ( not ( = ?auto_63252 ?auto_63255 ) ) ( not ( = ?auto_63252 ?auto_63256 ) ) ( not ( = ?auto_63252 ?auto_63257 ) ) ( not ( = ?auto_63252 ?auto_63258 ) ) ( not ( = ?auto_63253 ?auto_63254 ) ) ( not ( = ?auto_63253 ?auto_63255 ) ) ( not ( = ?auto_63253 ?auto_63256 ) ) ( not ( = ?auto_63253 ?auto_63257 ) ) ( not ( = ?auto_63253 ?auto_63258 ) ) ( not ( = ?auto_63254 ?auto_63255 ) ) ( not ( = ?auto_63254 ?auto_63256 ) ) ( not ( = ?auto_63254 ?auto_63257 ) ) ( not ( = ?auto_63254 ?auto_63258 ) ) ( not ( = ?auto_63255 ?auto_63256 ) ) ( not ( = ?auto_63255 ?auto_63257 ) ) ( not ( = ?auto_63255 ?auto_63258 ) ) ( not ( = ?auto_63256 ?auto_63257 ) ) ( not ( = ?auto_63256 ?auto_63258 ) ) ( not ( = ?auto_63257 ?auto_63258 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_63258 ?auto_63257 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_63260 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_63260 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_63260 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_63261 - BLOCK
    )
    :vars
    (
      ?auto_63262 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63261 ?auto_63262 ) ( CLEAR ?auto_63261 ) ( HAND-EMPTY ) ( not ( = ?auto_63261 ?auto_63262 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_63261 ?auto_63262 )
      ( MAKE-1PILE ?auto_63261 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_63268 - BLOCK
      ?auto_63269 - BLOCK
      ?auto_63270 - BLOCK
      ?auto_63271 - BLOCK
      ?auto_63272 - BLOCK
    )
    :vars
    (
      ?auto_63273 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63273 ?auto_63272 ) ( CLEAR ?auto_63273 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_63268 ) ( ON ?auto_63269 ?auto_63268 ) ( ON ?auto_63270 ?auto_63269 ) ( ON ?auto_63271 ?auto_63270 ) ( ON ?auto_63272 ?auto_63271 ) ( not ( = ?auto_63268 ?auto_63269 ) ) ( not ( = ?auto_63268 ?auto_63270 ) ) ( not ( = ?auto_63268 ?auto_63271 ) ) ( not ( = ?auto_63268 ?auto_63272 ) ) ( not ( = ?auto_63268 ?auto_63273 ) ) ( not ( = ?auto_63269 ?auto_63270 ) ) ( not ( = ?auto_63269 ?auto_63271 ) ) ( not ( = ?auto_63269 ?auto_63272 ) ) ( not ( = ?auto_63269 ?auto_63273 ) ) ( not ( = ?auto_63270 ?auto_63271 ) ) ( not ( = ?auto_63270 ?auto_63272 ) ) ( not ( = ?auto_63270 ?auto_63273 ) ) ( not ( = ?auto_63271 ?auto_63272 ) ) ( not ( = ?auto_63271 ?auto_63273 ) ) ( not ( = ?auto_63272 ?auto_63273 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_63273 ?auto_63272 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_63274 - BLOCK
      ?auto_63275 - BLOCK
      ?auto_63276 - BLOCK
      ?auto_63277 - BLOCK
      ?auto_63278 - BLOCK
    )
    :vars
    (
      ?auto_63279 - BLOCK
      ?auto_63280 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63279 ?auto_63278 ) ( CLEAR ?auto_63279 ) ( ON-TABLE ?auto_63274 ) ( ON ?auto_63275 ?auto_63274 ) ( ON ?auto_63276 ?auto_63275 ) ( ON ?auto_63277 ?auto_63276 ) ( ON ?auto_63278 ?auto_63277 ) ( not ( = ?auto_63274 ?auto_63275 ) ) ( not ( = ?auto_63274 ?auto_63276 ) ) ( not ( = ?auto_63274 ?auto_63277 ) ) ( not ( = ?auto_63274 ?auto_63278 ) ) ( not ( = ?auto_63274 ?auto_63279 ) ) ( not ( = ?auto_63275 ?auto_63276 ) ) ( not ( = ?auto_63275 ?auto_63277 ) ) ( not ( = ?auto_63275 ?auto_63278 ) ) ( not ( = ?auto_63275 ?auto_63279 ) ) ( not ( = ?auto_63276 ?auto_63277 ) ) ( not ( = ?auto_63276 ?auto_63278 ) ) ( not ( = ?auto_63276 ?auto_63279 ) ) ( not ( = ?auto_63277 ?auto_63278 ) ) ( not ( = ?auto_63277 ?auto_63279 ) ) ( not ( = ?auto_63278 ?auto_63279 ) ) ( HOLDING ?auto_63280 ) ( not ( = ?auto_63274 ?auto_63280 ) ) ( not ( = ?auto_63275 ?auto_63280 ) ) ( not ( = ?auto_63276 ?auto_63280 ) ) ( not ( = ?auto_63277 ?auto_63280 ) ) ( not ( = ?auto_63278 ?auto_63280 ) ) ( not ( = ?auto_63279 ?auto_63280 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_63280 )
      ( MAKE-5PILE ?auto_63274 ?auto_63275 ?auto_63276 ?auto_63277 ?auto_63278 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_63281 - BLOCK
      ?auto_63282 - BLOCK
      ?auto_63283 - BLOCK
      ?auto_63284 - BLOCK
      ?auto_63285 - BLOCK
    )
    :vars
    (
      ?auto_63287 - BLOCK
      ?auto_63286 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63287 ?auto_63285 ) ( ON-TABLE ?auto_63281 ) ( ON ?auto_63282 ?auto_63281 ) ( ON ?auto_63283 ?auto_63282 ) ( ON ?auto_63284 ?auto_63283 ) ( ON ?auto_63285 ?auto_63284 ) ( not ( = ?auto_63281 ?auto_63282 ) ) ( not ( = ?auto_63281 ?auto_63283 ) ) ( not ( = ?auto_63281 ?auto_63284 ) ) ( not ( = ?auto_63281 ?auto_63285 ) ) ( not ( = ?auto_63281 ?auto_63287 ) ) ( not ( = ?auto_63282 ?auto_63283 ) ) ( not ( = ?auto_63282 ?auto_63284 ) ) ( not ( = ?auto_63282 ?auto_63285 ) ) ( not ( = ?auto_63282 ?auto_63287 ) ) ( not ( = ?auto_63283 ?auto_63284 ) ) ( not ( = ?auto_63283 ?auto_63285 ) ) ( not ( = ?auto_63283 ?auto_63287 ) ) ( not ( = ?auto_63284 ?auto_63285 ) ) ( not ( = ?auto_63284 ?auto_63287 ) ) ( not ( = ?auto_63285 ?auto_63287 ) ) ( not ( = ?auto_63281 ?auto_63286 ) ) ( not ( = ?auto_63282 ?auto_63286 ) ) ( not ( = ?auto_63283 ?auto_63286 ) ) ( not ( = ?auto_63284 ?auto_63286 ) ) ( not ( = ?auto_63285 ?auto_63286 ) ) ( not ( = ?auto_63287 ?auto_63286 ) ) ( ON ?auto_63286 ?auto_63287 ) ( CLEAR ?auto_63286 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_63281 ?auto_63282 ?auto_63283 ?auto_63284 ?auto_63285 ?auto_63287 )
      ( MAKE-5PILE ?auto_63281 ?auto_63282 ?auto_63283 ?auto_63284 ?auto_63285 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_63290 - BLOCK
      ?auto_63291 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_63291 ) ( CLEAR ?auto_63290 ) ( ON-TABLE ?auto_63290 ) ( not ( = ?auto_63290 ?auto_63291 ) ) )
    :subtasks
    ( ( !STACK ?auto_63291 ?auto_63290 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_63292 - BLOCK
      ?auto_63293 - BLOCK
    )
    :vars
    (
      ?auto_63294 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_63292 ) ( ON-TABLE ?auto_63292 ) ( not ( = ?auto_63292 ?auto_63293 ) ) ( ON ?auto_63293 ?auto_63294 ) ( CLEAR ?auto_63293 ) ( HAND-EMPTY ) ( not ( = ?auto_63292 ?auto_63294 ) ) ( not ( = ?auto_63293 ?auto_63294 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_63293 ?auto_63294 )
      ( MAKE-2PILE ?auto_63292 ?auto_63293 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_63295 - BLOCK
      ?auto_63296 - BLOCK
    )
    :vars
    (
      ?auto_63297 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_63295 ?auto_63296 ) ) ( ON ?auto_63296 ?auto_63297 ) ( CLEAR ?auto_63296 ) ( not ( = ?auto_63295 ?auto_63297 ) ) ( not ( = ?auto_63296 ?auto_63297 ) ) ( HOLDING ?auto_63295 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_63295 )
      ( MAKE-2PILE ?auto_63295 ?auto_63296 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_63298 - BLOCK
      ?auto_63299 - BLOCK
    )
    :vars
    (
      ?auto_63300 - BLOCK
      ?auto_63302 - BLOCK
      ?auto_63301 - BLOCK
      ?auto_63303 - BLOCK
      ?auto_63304 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_63298 ?auto_63299 ) ) ( ON ?auto_63299 ?auto_63300 ) ( not ( = ?auto_63298 ?auto_63300 ) ) ( not ( = ?auto_63299 ?auto_63300 ) ) ( ON ?auto_63298 ?auto_63299 ) ( CLEAR ?auto_63298 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_63302 ) ( ON ?auto_63301 ?auto_63302 ) ( ON ?auto_63303 ?auto_63301 ) ( ON ?auto_63304 ?auto_63303 ) ( ON ?auto_63300 ?auto_63304 ) ( not ( = ?auto_63302 ?auto_63301 ) ) ( not ( = ?auto_63302 ?auto_63303 ) ) ( not ( = ?auto_63302 ?auto_63304 ) ) ( not ( = ?auto_63302 ?auto_63300 ) ) ( not ( = ?auto_63302 ?auto_63299 ) ) ( not ( = ?auto_63302 ?auto_63298 ) ) ( not ( = ?auto_63301 ?auto_63303 ) ) ( not ( = ?auto_63301 ?auto_63304 ) ) ( not ( = ?auto_63301 ?auto_63300 ) ) ( not ( = ?auto_63301 ?auto_63299 ) ) ( not ( = ?auto_63301 ?auto_63298 ) ) ( not ( = ?auto_63303 ?auto_63304 ) ) ( not ( = ?auto_63303 ?auto_63300 ) ) ( not ( = ?auto_63303 ?auto_63299 ) ) ( not ( = ?auto_63303 ?auto_63298 ) ) ( not ( = ?auto_63304 ?auto_63300 ) ) ( not ( = ?auto_63304 ?auto_63299 ) ) ( not ( = ?auto_63304 ?auto_63298 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_63302 ?auto_63301 ?auto_63303 ?auto_63304 ?auto_63300 ?auto_63299 )
      ( MAKE-2PILE ?auto_63298 ?auto_63299 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_63309 - BLOCK
      ?auto_63310 - BLOCK
      ?auto_63311 - BLOCK
      ?auto_63312 - BLOCK
    )
    :vars
    (
      ?auto_63313 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63313 ?auto_63312 ) ( CLEAR ?auto_63313 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_63309 ) ( ON ?auto_63310 ?auto_63309 ) ( ON ?auto_63311 ?auto_63310 ) ( ON ?auto_63312 ?auto_63311 ) ( not ( = ?auto_63309 ?auto_63310 ) ) ( not ( = ?auto_63309 ?auto_63311 ) ) ( not ( = ?auto_63309 ?auto_63312 ) ) ( not ( = ?auto_63309 ?auto_63313 ) ) ( not ( = ?auto_63310 ?auto_63311 ) ) ( not ( = ?auto_63310 ?auto_63312 ) ) ( not ( = ?auto_63310 ?auto_63313 ) ) ( not ( = ?auto_63311 ?auto_63312 ) ) ( not ( = ?auto_63311 ?auto_63313 ) ) ( not ( = ?auto_63312 ?auto_63313 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_63313 ?auto_63312 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_63314 - BLOCK
      ?auto_63315 - BLOCK
      ?auto_63316 - BLOCK
      ?auto_63317 - BLOCK
    )
    :vars
    (
      ?auto_63318 - BLOCK
      ?auto_63319 - BLOCK
      ?auto_63320 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63318 ?auto_63317 ) ( CLEAR ?auto_63318 ) ( ON-TABLE ?auto_63314 ) ( ON ?auto_63315 ?auto_63314 ) ( ON ?auto_63316 ?auto_63315 ) ( ON ?auto_63317 ?auto_63316 ) ( not ( = ?auto_63314 ?auto_63315 ) ) ( not ( = ?auto_63314 ?auto_63316 ) ) ( not ( = ?auto_63314 ?auto_63317 ) ) ( not ( = ?auto_63314 ?auto_63318 ) ) ( not ( = ?auto_63315 ?auto_63316 ) ) ( not ( = ?auto_63315 ?auto_63317 ) ) ( not ( = ?auto_63315 ?auto_63318 ) ) ( not ( = ?auto_63316 ?auto_63317 ) ) ( not ( = ?auto_63316 ?auto_63318 ) ) ( not ( = ?auto_63317 ?auto_63318 ) ) ( HOLDING ?auto_63319 ) ( CLEAR ?auto_63320 ) ( not ( = ?auto_63314 ?auto_63319 ) ) ( not ( = ?auto_63314 ?auto_63320 ) ) ( not ( = ?auto_63315 ?auto_63319 ) ) ( not ( = ?auto_63315 ?auto_63320 ) ) ( not ( = ?auto_63316 ?auto_63319 ) ) ( not ( = ?auto_63316 ?auto_63320 ) ) ( not ( = ?auto_63317 ?auto_63319 ) ) ( not ( = ?auto_63317 ?auto_63320 ) ) ( not ( = ?auto_63318 ?auto_63319 ) ) ( not ( = ?auto_63318 ?auto_63320 ) ) ( not ( = ?auto_63319 ?auto_63320 ) ) )
    :subtasks
    ( ( !STACK ?auto_63319 ?auto_63320 )
      ( MAKE-4PILE ?auto_63314 ?auto_63315 ?auto_63316 ?auto_63317 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_63920 - BLOCK
      ?auto_63921 - BLOCK
      ?auto_63922 - BLOCK
      ?auto_63923 - BLOCK
    )
    :vars
    (
      ?auto_63924 - BLOCK
      ?auto_63925 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63924 ?auto_63923 ) ( ON-TABLE ?auto_63920 ) ( ON ?auto_63921 ?auto_63920 ) ( ON ?auto_63922 ?auto_63921 ) ( ON ?auto_63923 ?auto_63922 ) ( not ( = ?auto_63920 ?auto_63921 ) ) ( not ( = ?auto_63920 ?auto_63922 ) ) ( not ( = ?auto_63920 ?auto_63923 ) ) ( not ( = ?auto_63920 ?auto_63924 ) ) ( not ( = ?auto_63921 ?auto_63922 ) ) ( not ( = ?auto_63921 ?auto_63923 ) ) ( not ( = ?auto_63921 ?auto_63924 ) ) ( not ( = ?auto_63922 ?auto_63923 ) ) ( not ( = ?auto_63922 ?auto_63924 ) ) ( not ( = ?auto_63923 ?auto_63924 ) ) ( not ( = ?auto_63920 ?auto_63925 ) ) ( not ( = ?auto_63921 ?auto_63925 ) ) ( not ( = ?auto_63922 ?auto_63925 ) ) ( not ( = ?auto_63923 ?auto_63925 ) ) ( not ( = ?auto_63924 ?auto_63925 ) ) ( ON ?auto_63925 ?auto_63924 ) ( CLEAR ?auto_63925 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_63920 ?auto_63921 ?auto_63922 ?auto_63923 ?auto_63924 )
      ( MAKE-4PILE ?auto_63920 ?auto_63921 ?auto_63922 ?auto_63923 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_63328 - BLOCK
      ?auto_63329 - BLOCK
      ?auto_63330 - BLOCK
      ?auto_63331 - BLOCK
    )
    :vars
    (
      ?auto_63334 - BLOCK
      ?auto_63332 - BLOCK
      ?auto_63333 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63334 ?auto_63331 ) ( ON-TABLE ?auto_63328 ) ( ON ?auto_63329 ?auto_63328 ) ( ON ?auto_63330 ?auto_63329 ) ( ON ?auto_63331 ?auto_63330 ) ( not ( = ?auto_63328 ?auto_63329 ) ) ( not ( = ?auto_63328 ?auto_63330 ) ) ( not ( = ?auto_63328 ?auto_63331 ) ) ( not ( = ?auto_63328 ?auto_63334 ) ) ( not ( = ?auto_63329 ?auto_63330 ) ) ( not ( = ?auto_63329 ?auto_63331 ) ) ( not ( = ?auto_63329 ?auto_63334 ) ) ( not ( = ?auto_63330 ?auto_63331 ) ) ( not ( = ?auto_63330 ?auto_63334 ) ) ( not ( = ?auto_63331 ?auto_63334 ) ) ( not ( = ?auto_63328 ?auto_63332 ) ) ( not ( = ?auto_63328 ?auto_63333 ) ) ( not ( = ?auto_63329 ?auto_63332 ) ) ( not ( = ?auto_63329 ?auto_63333 ) ) ( not ( = ?auto_63330 ?auto_63332 ) ) ( not ( = ?auto_63330 ?auto_63333 ) ) ( not ( = ?auto_63331 ?auto_63332 ) ) ( not ( = ?auto_63331 ?auto_63333 ) ) ( not ( = ?auto_63334 ?auto_63332 ) ) ( not ( = ?auto_63334 ?auto_63333 ) ) ( not ( = ?auto_63332 ?auto_63333 ) ) ( ON ?auto_63332 ?auto_63334 ) ( CLEAR ?auto_63332 ) ( HOLDING ?auto_63333 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_63333 )
      ( MAKE-4PILE ?auto_63328 ?auto_63329 ?auto_63330 ?auto_63331 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_63335 - BLOCK
      ?auto_63336 - BLOCK
      ?auto_63337 - BLOCK
      ?auto_63338 - BLOCK
    )
    :vars
    (
      ?auto_63339 - BLOCK
      ?auto_63340 - BLOCK
      ?auto_63341 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63339 ?auto_63338 ) ( ON-TABLE ?auto_63335 ) ( ON ?auto_63336 ?auto_63335 ) ( ON ?auto_63337 ?auto_63336 ) ( ON ?auto_63338 ?auto_63337 ) ( not ( = ?auto_63335 ?auto_63336 ) ) ( not ( = ?auto_63335 ?auto_63337 ) ) ( not ( = ?auto_63335 ?auto_63338 ) ) ( not ( = ?auto_63335 ?auto_63339 ) ) ( not ( = ?auto_63336 ?auto_63337 ) ) ( not ( = ?auto_63336 ?auto_63338 ) ) ( not ( = ?auto_63336 ?auto_63339 ) ) ( not ( = ?auto_63337 ?auto_63338 ) ) ( not ( = ?auto_63337 ?auto_63339 ) ) ( not ( = ?auto_63338 ?auto_63339 ) ) ( not ( = ?auto_63335 ?auto_63340 ) ) ( not ( = ?auto_63335 ?auto_63341 ) ) ( not ( = ?auto_63336 ?auto_63340 ) ) ( not ( = ?auto_63336 ?auto_63341 ) ) ( not ( = ?auto_63337 ?auto_63340 ) ) ( not ( = ?auto_63337 ?auto_63341 ) ) ( not ( = ?auto_63338 ?auto_63340 ) ) ( not ( = ?auto_63338 ?auto_63341 ) ) ( not ( = ?auto_63339 ?auto_63340 ) ) ( not ( = ?auto_63339 ?auto_63341 ) ) ( not ( = ?auto_63340 ?auto_63341 ) ) ( ON ?auto_63340 ?auto_63339 ) ( ON ?auto_63341 ?auto_63340 ) ( CLEAR ?auto_63341 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_63335 ?auto_63336 ?auto_63337 ?auto_63338 ?auto_63339 ?auto_63340 )
      ( MAKE-4PILE ?auto_63335 ?auto_63336 ?auto_63337 ?auto_63338 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_63345 - BLOCK
      ?auto_63346 - BLOCK
      ?auto_63347 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_63347 ) ( CLEAR ?auto_63346 ) ( ON-TABLE ?auto_63345 ) ( ON ?auto_63346 ?auto_63345 ) ( not ( = ?auto_63345 ?auto_63346 ) ) ( not ( = ?auto_63345 ?auto_63347 ) ) ( not ( = ?auto_63346 ?auto_63347 ) ) )
    :subtasks
    ( ( !STACK ?auto_63347 ?auto_63346 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_63348 - BLOCK
      ?auto_63349 - BLOCK
      ?auto_63350 - BLOCK
    )
    :vars
    (
      ?auto_63351 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_63349 ) ( ON-TABLE ?auto_63348 ) ( ON ?auto_63349 ?auto_63348 ) ( not ( = ?auto_63348 ?auto_63349 ) ) ( not ( = ?auto_63348 ?auto_63350 ) ) ( not ( = ?auto_63349 ?auto_63350 ) ) ( ON ?auto_63350 ?auto_63351 ) ( CLEAR ?auto_63350 ) ( HAND-EMPTY ) ( not ( = ?auto_63348 ?auto_63351 ) ) ( not ( = ?auto_63349 ?auto_63351 ) ) ( not ( = ?auto_63350 ?auto_63351 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_63350 ?auto_63351 )
      ( MAKE-3PILE ?auto_63348 ?auto_63349 ?auto_63350 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_63352 - BLOCK
      ?auto_63353 - BLOCK
      ?auto_63354 - BLOCK
    )
    :vars
    (
      ?auto_63355 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_63352 ) ( not ( = ?auto_63352 ?auto_63353 ) ) ( not ( = ?auto_63352 ?auto_63354 ) ) ( not ( = ?auto_63353 ?auto_63354 ) ) ( ON ?auto_63354 ?auto_63355 ) ( CLEAR ?auto_63354 ) ( not ( = ?auto_63352 ?auto_63355 ) ) ( not ( = ?auto_63353 ?auto_63355 ) ) ( not ( = ?auto_63354 ?auto_63355 ) ) ( HOLDING ?auto_63353 ) ( CLEAR ?auto_63352 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_63352 ?auto_63353 )
      ( MAKE-3PILE ?auto_63352 ?auto_63353 ?auto_63354 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_63356 - BLOCK
      ?auto_63357 - BLOCK
      ?auto_63358 - BLOCK
    )
    :vars
    (
      ?auto_63359 - BLOCK
      ?auto_63361 - BLOCK
      ?auto_63360 - BLOCK
      ?auto_63362 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_63356 ) ( not ( = ?auto_63356 ?auto_63357 ) ) ( not ( = ?auto_63356 ?auto_63358 ) ) ( not ( = ?auto_63357 ?auto_63358 ) ) ( ON ?auto_63358 ?auto_63359 ) ( not ( = ?auto_63356 ?auto_63359 ) ) ( not ( = ?auto_63357 ?auto_63359 ) ) ( not ( = ?auto_63358 ?auto_63359 ) ) ( CLEAR ?auto_63356 ) ( ON ?auto_63357 ?auto_63358 ) ( CLEAR ?auto_63357 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_63361 ) ( ON ?auto_63360 ?auto_63361 ) ( ON ?auto_63362 ?auto_63360 ) ( ON ?auto_63359 ?auto_63362 ) ( not ( = ?auto_63361 ?auto_63360 ) ) ( not ( = ?auto_63361 ?auto_63362 ) ) ( not ( = ?auto_63361 ?auto_63359 ) ) ( not ( = ?auto_63361 ?auto_63358 ) ) ( not ( = ?auto_63361 ?auto_63357 ) ) ( not ( = ?auto_63360 ?auto_63362 ) ) ( not ( = ?auto_63360 ?auto_63359 ) ) ( not ( = ?auto_63360 ?auto_63358 ) ) ( not ( = ?auto_63360 ?auto_63357 ) ) ( not ( = ?auto_63362 ?auto_63359 ) ) ( not ( = ?auto_63362 ?auto_63358 ) ) ( not ( = ?auto_63362 ?auto_63357 ) ) ( not ( = ?auto_63356 ?auto_63361 ) ) ( not ( = ?auto_63356 ?auto_63360 ) ) ( not ( = ?auto_63356 ?auto_63362 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_63361 ?auto_63360 ?auto_63362 ?auto_63359 ?auto_63358 )
      ( MAKE-3PILE ?auto_63356 ?auto_63357 ?auto_63358 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_63363 - BLOCK
      ?auto_63364 - BLOCK
      ?auto_63365 - BLOCK
    )
    :vars
    (
      ?auto_63366 - BLOCK
      ?auto_63367 - BLOCK
      ?auto_63368 - BLOCK
      ?auto_63369 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_63363 ?auto_63364 ) ) ( not ( = ?auto_63363 ?auto_63365 ) ) ( not ( = ?auto_63364 ?auto_63365 ) ) ( ON ?auto_63365 ?auto_63366 ) ( not ( = ?auto_63363 ?auto_63366 ) ) ( not ( = ?auto_63364 ?auto_63366 ) ) ( not ( = ?auto_63365 ?auto_63366 ) ) ( ON ?auto_63364 ?auto_63365 ) ( CLEAR ?auto_63364 ) ( ON-TABLE ?auto_63367 ) ( ON ?auto_63368 ?auto_63367 ) ( ON ?auto_63369 ?auto_63368 ) ( ON ?auto_63366 ?auto_63369 ) ( not ( = ?auto_63367 ?auto_63368 ) ) ( not ( = ?auto_63367 ?auto_63369 ) ) ( not ( = ?auto_63367 ?auto_63366 ) ) ( not ( = ?auto_63367 ?auto_63365 ) ) ( not ( = ?auto_63367 ?auto_63364 ) ) ( not ( = ?auto_63368 ?auto_63369 ) ) ( not ( = ?auto_63368 ?auto_63366 ) ) ( not ( = ?auto_63368 ?auto_63365 ) ) ( not ( = ?auto_63368 ?auto_63364 ) ) ( not ( = ?auto_63369 ?auto_63366 ) ) ( not ( = ?auto_63369 ?auto_63365 ) ) ( not ( = ?auto_63369 ?auto_63364 ) ) ( not ( = ?auto_63363 ?auto_63367 ) ) ( not ( = ?auto_63363 ?auto_63368 ) ) ( not ( = ?auto_63363 ?auto_63369 ) ) ( HOLDING ?auto_63363 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_63363 )
      ( MAKE-3PILE ?auto_63363 ?auto_63364 ?auto_63365 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_63370 - BLOCK
      ?auto_63371 - BLOCK
      ?auto_63372 - BLOCK
    )
    :vars
    (
      ?auto_63373 - BLOCK
      ?auto_63375 - BLOCK
      ?auto_63374 - BLOCK
      ?auto_63376 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_63370 ?auto_63371 ) ) ( not ( = ?auto_63370 ?auto_63372 ) ) ( not ( = ?auto_63371 ?auto_63372 ) ) ( ON ?auto_63372 ?auto_63373 ) ( not ( = ?auto_63370 ?auto_63373 ) ) ( not ( = ?auto_63371 ?auto_63373 ) ) ( not ( = ?auto_63372 ?auto_63373 ) ) ( ON ?auto_63371 ?auto_63372 ) ( ON-TABLE ?auto_63375 ) ( ON ?auto_63374 ?auto_63375 ) ( ON ?auto_63376 ?auto_63374 ) ( ON ?auto_63373 ?auto_63376 ) ( not ( = ?auto_63375 ?auto_63374 ) ) ( not ( = ?auto_63375 ?auto_63376 ) ) ( not ( = ?auto_63375 ?auto_63373 ) ) ( not ( = ?auto_63375 ?auto_63372 ) ) ( not ( = ?auto_63375 ?auto_63371 ) ) ( not ( = ?auto_63374 ?auto_63376 ) ) ( not ( = ?auto_63374 ?auto_63373 ) ) ( not ( = ?auto_63374 ?auto_63372 ) ) ( not ( = ?auto_63374 ?auto_63371 ) ) ( not ( = ?auto_63376 ?auto_63373 ) ) ( not ( = ?auto_63376 ?auto_63372 ) ) ( not ( = ?auto_63376 ?auto_63371 ) ) ( not ( = ?auto_63370 ?auto_63375 ) ) ( not ( = ?auto_63370 ?auto_63374 ) ) ( not ( = ?auto_63370 ?auto_63376 ) ) ( ON ?auto_63370 ?auto_63371 ) ( CLEAR ?auto_63370 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_63375 ?auto_63374 ?auto_63376 ?auto_63373 ?auto_63372 ?auto_63371 )
      ( MAKE-3PILE ?auto_63370 ?auto_63371 ?auto_63372 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_63380 - BLOCK
      ?auto_63381 - BLOCK
      ?auto_63382 - BLOCK
    )
    :vars
    (
      ?auto_63383 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63383 ?auto_63382 ) ( CLEAR ?auto_63383 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_63380 ) ( ON ?auto_63381 ?auto_63380 ) ( ON ?auto_63382 ?auto_63381 ) ( not ( = ?auto_63380 ?auto_63381 ) ) ( not ( = ?auto_63380 ?auto_63382 ) ) ( not ( = ?auto_63380 ?auto_63383 ) ) ( not ( = ?auto_63381 ?auto_63382 ) ) ( not ( = ?auto_63381 ?auto_63383 ) ) ( not ( = ?auto_63382 ?auto_63383 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_63383 ?auto_63382 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_63384 - BLOCK
      ?auto_63385 - BLOCK
      ?auto_63386 - BLOCK
    )
    :vars
    (
      ?auto_63387 - BLOCK
      ?auto_63388 - BLOCK
      ?auto_63389 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63387 ?auto_63386 ) ( CLEAR ?auto_63387 ) ( ON-TABLE ?auto_63384 ) ( ON ?auto_63385 ?auto_63384 ) ( ON ?auto_63386 ?auto_63385 ) ( not ( = ?auto_63384 ?auto_63385 ) ) ( not ( = ?auto_63384 ?auto_63386 ) ) ( not ( = ?auto_63384 ?auto_63387 ) ) ( not ( = ?auto_63385 ?auto_63386 ) ) ( not ( = ?auto_63385 ?auto_63387 ) ) ( not ( = ?auto_63386 ?auto_63387 ) ) ( HOLDING ?auto_63388 ) ( CLEAR ?auto_63389 ) ( not ( = ?auto_63384 ?auto_63388 ) ) ( not ( = ?auto_63384 ?auto_63389 ) ) ( not ( = ?auto_63385 ?auto_63388 ) ) ( not ( = ?auto_63385 ?auto_63389 ) ) ( not ( = ?auto_63386 ?auto_63388 ) ) ( not ( = ?auto_63386 ?auto_63389 ) ) ( not ( = ?auto_63387 ?auto_63388 ) ) ( not ( = ?auto_63387 ?auto_63389 ) ) ( not ( = ?auto_63388 ?auto_63389 ) ) )
    :subtasks
    ( ( !STACK ?auto_63388 ?auto_63389 )
      ( MAKE-3PILE ?auto_63384 ?auto_63385 ?auto_63386 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_63390 - BLOCK
      ?auto_63391 - BLOCK
      ?auto_63392 - BLOCK
    )
    :vars
    (
      ?auto_63393 - BLOCK
      ?auto_63394 - BLOCK
      ?auto_63395 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63393 ?auto_63392 ) ( ON-TABLE ?auto_63390 ) ( ON ?auto_63391 ?auto_63390 ) ( ON ?auto_63392 ?auto_63391 ) ( not ( = ?auto_63390 ?auto_63391 ) ) ( not ( = ?auto_63390 ?auto_63392 ) ) ( not ( = ?auto_63390 ?auto_63393 ) ) ( not ( = ?auto_63391 ?auto_63392 ) ) ( not ( = ?auto_63391 ?auto_63393 ) ) ( not ( = ?auto_63392 ?auto_63393 ) ) ( CLEAR ?auto_63394 ) ( not ( = ?auto_63390 ?auto_63395 ) ) ( not ( = ?auto_63390 ?auto_63394 ) ) ( not ( = ?auto_63391 ?auto_63395 ) ) ( not ( = ?auto_63391 ?auto_63394 ) ) ( not ( = ?auto_63392 ?auto_63395 ) ) ( not ( = ?auto_63392 ?auto_63394 ) ) ( not ( = ?auto_63393 ?auto_63395 ) ) ( not ( = ?auto_63393 ?auto_63394 ) ) ( not ( = ?auto_63395 ?auto_63394 ) ) ( ON ?auto_63395 ?auto_63393 ) ( CLEAR ?auto_63395 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_63390 ?auto_63391 ?auto_63392 ?auto_63393 )
      ( MAKE-3PILE ?auto_63390 ?auto_63391 ?auto_63392 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_63396 - BLOCK
      ?auto_63397 - BLOCK
      ?auto_63398 - BLOCK
    )
    :vars
    (
      ?auto_63401 - BLOCK
      ?auto_63399 - BLOCK
      ?auto_63400 - BLOCK
      ?auto_63402 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63401 ?auto_63398 ) ( ON-TABLE ?auto_63396 ) ( ON ?auto_63397 ?auto_63396 ) ( ON ?auto_63398 ?auto_63397 ) ( not ( = ?auto_63396 ?auto_63397 ) ) ( not ( = ?auto_63396 ?auto_63398 ) ) ( not ( = ?auto_63396 ?auto_63401 ) ) ( not ( = ?auto_63397 ?auto_63398 ) ) ( not ( = ?auto_63397 ?auto_63401 ) ) ( not ( = ?auto_63398 ?auto_63401 ) ) ( not ( = ?auto_63396 ?auto_63399 ) ) ( not ( = ?auto_63396 ?auto_63400 ) ) ( not ( = ?auto_63397 ?auto_63399 ) ) ( not ( = ?auto_63397 ?auto_63400 ) ) ( not ( = ?auto_63398 ?auto_63399 ) ) ( not ( = ?auto_63398 ?auto_63400 ) ) ( not ( = ?auto_63401 ?auto_63399 ) ) ( not ( = ?auto_63401 ?auto_63400 ) ) ( not ( = ?auto_63399 ?auto_63400 ) ) ( ON ?auto_63399 ?auto_63401 ) ( CLEAR ?auto_63399 ) ( HOLDING ?auto_63400 ) ( CLEAR ?auto_63402 ) ( ON-TABLE ?auto_63402 ) ( not ( = ?auto_63402 ?auto_63400 ) ) ( not ( = ?auto_63396 ?auto_63402 ) ) ( not ( = ?auto_63397 ?auto_63402 ) ) ( not ( = ?auto_63398 ?auto_63402 ) ) ( not ( = ?auto_63401 ?auto_63402 ) ) ( not ( = ?auto_63399 ?auto_63402 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_63402 ?auto_63400 )
      ( MAKE-3PILE ?auto_63396 ?auto_63397 ?auto_63398 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_64094 - BLOCK
      ?auto_64095 - BLOCK
      ?auto_64096 - BLOCK
    )
    :vars
    (
      ?auto_64097 - BLOCK
      ?auto_64099 - BLOCK
      ?auto_64098 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64097 ?auto_64096 ) ( ON-TABLE ?auto_64094 ) ( ON ?auto_64095 ?auto_64094 ) ( ON ?auto_64096 ?auto_64095 ) ( not ( = ?auto_64094 ?auto_64095 ) ) ( not ( = ?auto_64094 ?auto_64096 ) ) ( not ( = ?auto_64094 ?auto_64097 ) ) ( not ( = ?auto_64095 ?auto_64096 ) ) ( not ( = ?auto_64095 ?auto_64097 ) ) ( not ( = ?auto_64096 ?auto_64097 ) ) ( not ( = ?auto_64094 ?auto_64099 ) ) ( not ( = ?auto_64094 ?auto_64098 ) ) ( not ( = ?auto_64095 ?auto_64099 ) ) ( not ( = ?auto_64095 ?auto_64098 ) ) ( not ( = ?auto_64096 ?auto_64099 ) ) ( not ( = ?auto_64096 ?auto_64098 ) ) ( not ( = ?auto_64097 ?auto_64099 ) ) ( not ( = ?auto_64097 ?auto_64098 ) ) ( not ( = ?auto_64099 ?auto_64098 ) ) ( ON ?auto_64099 ?auto_64097 ) ( ON ?auto_64098 ?auto_64099 ) ( CLEAR ?auto_64098 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_64094 ?auto_64095 ?auto_64096 ?auto_64097 ?auto_64099 )
      ( MAKE-3PILE ?auto_64094 ?auto_64095 ?auto_64096 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_63410 - BLOCK
      ?auto_63411 - BLOCK
      ?auto_63412 - BLOCK
    )
    :vars
    (
      ?auto_63415 - BLOCK
      ?auto_63413 - BLOCK
      ?auto_63414 - BLOCK
      ?auto_63416 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63415 ?auto_63412 ) ( ON-TABLE ?auto_63410 ) ( ON ?auto_63411 ?auto_63410 ) ( ON ?auto_63412 ?auto_63411 ) ( not ( = ?auto_63410 ?auto_63411 ) ) ( not ( = ?auto_63410 ?auto_63412 ) ) ( not ( = ?auto_63410 ?auto_63415 ) ) ( not ( = ?auto_63411 ?auto_63412 ) ) ( not ( = ?auto_63411 ?auto_63415 ) ) ( not ( = ?auto_63412 ?auto_63415 ) ) ( not ( = ?auto_63410 ?auto_63413 ) ) ( not ( = ?auto_63410 ?auto_63414 ) ) ( not ( = ?auto_63411 ?auto_63413 ) ) ( not ( = ?auto_63411 ?auto_63414 ) ) ( not ( = ?auto_63412 ?auto_63413 ) ) ( not ( = ?auto_63412 ?auto_63414 ) ) ( not ( = ?auto_63415 ?auto_63413 ) ) ( not ( = ?auto_63415 ?auto_63414 ) ) ( not ( = ?auto_63413 ?auto_63414 ) ) ( ON ?auto_63413 ?auto_63415 ) ( not ( = ?auto_63416 ?auto_63414 ) ) ( not ( = ?auto_63410 ?auto_63416 ) ) ( not ( = ?auto_63411 ?auto_63416 ) ) ( not ( = ?auto_63412 ?auto_63416 ) ) ( not ( = ?auto_63415 ?auto_63416 ) ) ( not ( = ?auto_63413 ?auto_63416 ) ) ( ON ?auto_63414 ?auto_63413 ) ( CLEAR ?auto_63414 ) ( HOLDING ?auto_63416 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_63416 )
      ( MAKE-3PILE ?auto_63410 ?auto_63411 ?auto_63412 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_63417 - BLOCK
      ?auto_63418 - BLOCK
      ?auto_63419 - BLOCK
    )
    :vars
    (
      ?auto_63421 - BLOCK
      ?auto_63422 - BLOCK
      ?auto_63420 - BLOCK
      ?auto_63423 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63421 ?auto_63419 ) ( ON-TABLE ?auto_63417 ) ( ON ?auto_63418 ?auto_63417 ) ( ON ?auto_63419 ?auto_63418 ) ( not ( = ?auto_63417 ?auto_63418 ) ) ( not ( = ?auto_63417 ?auto_63419 ) ) ( not ( = ?auto_63417 ?auto_63421 ) ) ( not ( = ?auto_63418 ?auto_63419 ) ) ( not ( = ?auto_63418 ?auto_63421 ) ) ( not ( = ?auto_63419 ?auto_63421 ) ) ( not ( = ?auto_63417 ?auto_63422 ) ) ( not ( = ?auto_63417 ?auto_63420 ) ) ( not ( = ?auto_63418 ?auto_63422 ) ) ( not ( = ?auto_63418 ?auto_63420 ) ) ( not ( = ?auto_63419 ?auto_63422 ) ) ( not ( = ?auto_63419 ?auto_63420 ) ) ( not ( = ?auto_63421 ?auto_63422 ) ) ( not ( = ?auto_63421 ?auto_63420 ) ) ( not ( = ?auto_63422 ?auto_63420 ) ) ( ON ?auto_63422 ?auto_63421 ) ( not ( = ?auto_63423 ?auto_63420 ) ) ( not ( = ?auto_63417 ?auto_63423 ) ) ( not ( = ?auto_63418 ?auto_63423 ) ) ( not ( = ?auto_63419 ?auto_63423 ) ) ( not ( = ?auto_63421 ?auto_63423 ) ) ( not ( = ?auto_63422 ?auto_63423 ) ) ( ON ?auto_63420 ?auto_63422 ) ( ON ?auto_63423 ?auto_63420 ) ( CLEAR ?auto_63423 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_63417 ?auto_63418 ?auto_63419 ?auto_63421 ?auto_63422 ?auto_63420 )
      ( MAKE-3PILE ?auto_63417 ?auto_63418 ?auto_63419 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_63428 - BLOCK
      ?auto_63429 - BLOCK
      ?auto_63430 - BLOCK
      ?auto_63431 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_63431 ) ( CLEAR ?auto_63430 ) ( ON-TABLE ?auto_63428 ) ( ON ?auto_63429 ?auto_63428 ) ( ON ?auto_63430 ?auto_63429 ) ( not ( = ?auto_63428 ?auto_63429 ) ) ( not ( = ?auto_63428 ?auto_63430 ) ) ( not ( = ?auto_63428 ?auto_63431 ) ) ( not ( = ?auto_63429 ?auto_63430 ) ) ( not ( = ?auto_63429 ?auto_63431 ) ) ( not ( = ?auto_63430 ?auto_63431 ) ) )
    :subtasks
    ( ( !STACK ?auto_63431 ?auto_63430 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_63432 - BLOCK
      ?auto_63433 - BLOCK
      ?auto_63434 - BLOCK
      ?auto_63435 - BLOCK
    )
    :vars
    (
      ?auto_63436 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_63434 ) ( ON-TABLE ?auto_63432 ) ( ON ?auto_63433 ?auto_63432 ) ( ON ?auto_63434 ?auto_63433 ) ( not ( = ?auto_63432 ?auto_63433 ) ) ( not ( = ?auto_63432 ?auto_63434 ) ) ( not ( = ?auto_63432 ?auto_63435 ) ) ( not ( = ?auto_63433 ?auto_63434 ) ) ( not ( = ?auto_63433 ?auto_63435 ) ) ( not ( = ?auto_63434 ?auto_63435 ) ) ( ON ?auto_63435 ?auto_63436 ) ( CLEAR ?auto_63435 ) ( HAND-EMPTY ) ( not ( = ?auto_63432 ?auto_63436 ) ) ( not ( = ?auto_63433 ?auto_63436 ) ) ( not ( = ?auto_63434 ?auto_63436 ) ) ( not ( = ?auto_63435 ?auto_63436 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_63435 ?auto_63436 )
      ( MAKE-4PILE ?auto_63432 ?auto_63433 ?auto_63434 ?auto_63435 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_63437 - BLOCK
      ?auto_63438 - BLOCK
      ?auto_63439 - BLOCK
      ?auto_63440 - BLOCK
    )
    :vars
    (
      ?auto_63441 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_63437 ) ( ON ?auto_63438 ?auto_63437 ) ( not ( = ?auto_63437 ?auto_63438 ) ) ( not ( = ?auto_63437 ?auto_63439 ) ) ( not ( = ?auto_63437 ?auto_63440 ) ) ( not ( = ?auto_63438 ?auto_63439 ) ) ( not ( = ?auto_63438 ?auto_63440 ) ) ( not ( = ?auto_63439 ?auto_63440 ) ) ( ON ?auto_63440 ?auto_63441 ) ( CLEAR ?auto_63440 ) ( not ( = ?auto_63437 ?auto_63441 ) ) ( not ( = ?auto_63438 ?auto_63441 ) ) ( not ( = ?auto_63439 ?auto_63441 ) ) ( not ( = ?auto_63440 ?auto_63441 ) ) ( HOLDING ?auto_63439 ) ( CLEAR ?auto_63438 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_63437 ?auto_63438 ?auto_63439 )
      ( MAKE-4PILE ?auto_63437 ?auto_63438 ?auto_63439 ?auto_63440 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_63442 - BLOCK
      ?auto_63443 - BLOCK
      ?auto_63444 - BLOCK
      ?auto_63445 - BLOCK
    )
    :vars
    (
      ?auto_63446 - BLOCK
      ?auto_63447 - BLOCK
      ?auto_63448 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_63442 ) ( ON ?auto_63443 ?auto_63442 ) ( not ( = ?auto_63442 ?auto_63443 ) ) ( not ( = ?auto_63442 ?auto_63444 ) ) ( not ( = ?auto_63442 ?auto_63445 ) ) ( not ( = ?auto_63443 ?auto_63444 ) ) ( not ( = ?auto_63443 ?auto_63445 ) ) ( not ( = ?auto_63444 ?auto_63445 ) ) ( ON ?auto_63445 ?auto_63446 ) ( not ( = ?auto_63442 ?auto_63446 ) ) ( not ( = ?auto_63443 ?auto_63446 ) ) ( not ( = ?auto_63444 ?auto_63446 ) ) ( not ( = ?auto_63445 ?auto_63446 ) ) ( CLEAR ?auto_63443 ) ( ON ?auto_63444 ?auto_63445 ) ( CLEAR ?auto_63444 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_63447 ) ( ON ?auto_63448 ?auto_63447 ) ( ON ?auto_63446 ?auto_63448 ) ( not ( = ?auto_63447 ?auto_63448 ) ) ( not ( = ?auto_63447 ?auto_63446 ) ) ( not ( = ?auto_63447 ?auto_63445 ) ) ( not ( = ?auto_63447 ?auto_63444 ) ) ( not ( = ?auto_63448 ?auto_63446 ) ) ( not ( = ?auto_63448 ?auto_63445 ) ) ( not ( = ?auto_63448 ?auto_63444 ) ) ( not ( = ?auto_63442 ?auto_63447 ) ) ( not ( = ?auto_63442 ?auto_63448 ) ) ( not ( = ?auto_63443 ?auto_63447 ) ) ( not ( = ?auto_63443 ?auto_63448 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_63447 ?auto_63448 ?auto_63446 ?auto_63445 )
      ( MAKE-4PILE ?auto_63442 ?auto_63443 ?auto_63444 ?auto_63445 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_63449 - BLOCK
      ?auto_63450 - BLOCK
      ?auto_63451 - BLOCK
      ?auto_63452 - BLOCK
    )
    :vars
    (
      ?auto_63453 - BLOCK
      ?auto_63454 - BLOCK
      ?auto_63455 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_63449 ) ( not ( = ?auto_63449 ?auto_63450 ) ) ( not ( = ?auto_63449 ?auto_63451 ) ) ( not ( = ?auto_63449 ?auto_63452 ) ) ( not ( = ?auto_63450 ?auto_63451 ) ) ( not ( = ?auto_63450 ?auto_63452 ) ) ( not ( = ?auto_63451 ?auto_63452 ) ) ( ON ?auto_63452 ?auto_63453 ) ( not ( = ?auto_63449 ?auto_63453 ) ) ( not ( = ?auto_63450 ?auto_63453 ) ) ( not ( = ?auto_63451 ?auto_63453 ) ) ( not ( = ?auto_63452 ?auto_63453 ) ) ( ON ?auto_63451 ?auto_63452 ) ( CLEAR ?auto_63451 ) ( ON-TABLE ?auto_63454 ) ( ON ?auto_63455 ?auto_63454 ) ( ON ?auto_63453 ?auto_63455 ) ( not ( = ?auto_63454 ?auto_63455 ) ) ( not ( = ?auto_63454 ?auto_63453 ) ) ( not ( = ?auto_63454 ?auto_63452 ) ) ( not ( = ?auto_63454 ?auto_63451 ) ) ( not ( = ?auto_63455 ?auto_63453 ) ) ( not ( = ?auto_63455 ?auto_63452 ) ) ( not ( = ?auto_63455 ?auto_63451 ) ) ( not ( = ?auto_63449 ?auto_63454 ) ) ( not ( = ?auto_63449 ?auto_63455 ) ) ( not ( = ?auto_63450 ?auto_63454 ) ) ( not ( = ?auto_63450 ?auto_63455 ) ) ( HOLDING ?auto_63450 ) ( CLEAR ?auto_63449 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_63449 ?auto_63450 )
      ( MAKE-4PILE ?auto_63449 ?auto_63450 ?auto_63451 ?auto_63452 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_63456 - BLOCK
      ?auto_63457 - BLOCK
      ?auto_63458 - BLOCK
      ?auto_63459 - BLOCK
    )
    :vars
    (
      ?auto_63460 - BLOCK
      ?auto_63461 - BLOCK
      ?auto_63462 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_63456 ) ( not ( = ?auto_63456 ?auto_63457 ) ) ( not ( = ?auto_63456 ?auto_63458 ) ) ( not ( = ?auto_63456 ?auto_63459 ) ) ( not ( = ?auto_63457 ?auto_63458 ) ) ( not ( = ?auto_63457 ?auto_63459 ) ) ( not ( = ?auto_63458 ?auto_63459 ) ) ( ON ?auto_63459 ?auto_63460 ) ( not ( = ?auto_63456 ?auto_63460 ) ) ( not ( = ?auto_63457 ?auto_63460 ) ) ( not ( = ?auto_63458 ?auto_63460 ) ) ( not ( = ?auto_63459 ?auto_63460 ) ) ( ON ?auto_63458 ?auto_63459 ) ( ON-TABLE ?auto_63461 ) ( ON ?auto_63462 ?auto_63461 ) ( ON ?auto_63460 ?auto_63462 ) ( not ( = ?auto_63461 ?auto_63462 ) ) ( not ( = ?auto_63461 ?auto_63460 ) ) ( not ( = ?auto_63461 ?auto_63459 ) ) ( not ( = ?auto_63461 ?auto_63458 ) ) ( not ( = ?auto_63462 ?auto_63460 ) ) ( not ( = ?auto_63462 ?auto_63459 ) ) ( not ( = ?auto_63462 ?auto_63458 ) ) ( not ( = ?auto_63456 ?auto_63461 ) ) ( not ( = ?auto_63456 ?auto_63462 ) ) ( not ( = ?auto_63457 ?auto_63461 ) ) ( not ( = ?auto_63457 ?auto_63462 ) ) ( CLEAR ?auto_63456 ) ( ON ?auto_63457 ?auto_63458 ) ( CLEAR ?auto_63457 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_63461 ?auto_63462 ?auto_63460 ?auto_63459 ?auto_63458 )
      ( MAKE-4PILE ?auto_63456 ?auto_63457 ?auto_63458 ?auto_63459 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_63463 - BLOCK
      ?auto_63464 - BLOCK
      ?auto_63465 - BLOCK
      ?auto_63466 - BLOCK
    )
    :vars
    (
      ?auto_63467 - BLOCK
      ?auto_63469 - BLOCK
      ?auto_63468 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_63463 ?auto_63464 ) ) ( not ( = ?auto_63463 ?auto_63465 ) ) ( not ( = ?auto_63463 ?auto_63466 ) ) ( not ( = ?auto_63464 ?auto_63465 ) ) ( not ( = ?auto_63464 ?auto_63466 ) ) ( not ( = ?auto_63465 ?auto_63466 ) ) ( ON ?auto_63466 ?auto_63467 ) ( not ( = ?auto_63463 ?auto_63467 ) ) ( not ( = ?auto_63464 ?auto_63467 ) ) ( not ( = ?auto_63465 ?auto_63467 ) ) ( not ( = ?auto_63466 ?auto_63467 ) ) ( ON ?auto_63465 ?auto_63466 ) ( ON-TABLE ?auto_63469 ) ( ON ?auto_63468 ?auto_63469 ) ( ON ?auto_63467 ?auto_63468 ) ( not ( = ?auto_63469 ?auto_63468 ) ) ( not ( = ?auto_63469 ?auto_63467 ) ) ( not ( = ?auto_63469 ?auto_63466 ) ) ( not ( = ?auto_63469 ?auto_63465 ) ) ( not ( = ?auto_63468 ?auto_63467 ) ) ( not ( = ?auto_63468 ?auto_63466 ) ) ( not ( = ?auto_63468 ?auto_63465 ) ) ( not ( = ?auto_63463 ?auto_63469 ) ) ( not ( = ?auto_63463 ?auto_63468 ) ) ( not ( = ?auto_63464 ?auto_63469 ) ) ( not ( = ?auto_63464 ?auto_63468 ) ) ( ON ?auto_63464 ?auto_63465 ) ( CLEAR ?auto_63464 ) ( HOLDING ?auto_63463 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_63463 )
      ( MAKE-4PILE ?auto_63463 ?auto_63464 ?auto_63465 ?auto_63466 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_63470 - BLOCK
      ?auto_63471 - BLOCK
      ?auto_63472 - BLOCK
      ?auto_63473 - BLOCK
    )
    :vars
    (
      ?auto_63474 - BLOCK
      ?auto_63476 - BLOCK
      ?auto_63475 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_63470 ?auto_63471 ) ) ( not ( = ?auto_63470 ?auto_63472 ) ) ( not ( = ?auto_63470 ?auto_63473 ) ) ( not ( = ?auto_63471 ?auto_63472 ) ) ( not ( = ?auto_63471 ?auto_63473 ) ) ( not ( = ?auto_63472 ?auto_63473 ) ) ( ON ?auto_63473 ?auto_63474 ) ( not ( = ?auto_63470 ?auto_63474 ) ) ( not ( = ?auto_63471 ?auto_63474 ) ) ( not ( = ?auto_63472 ?auto_63474 ) ) ( not ( = ?auto_63473 ?auto_63474 ) ) ( ON ?auto_63472 ?auto_63473 ) ( ON-TABLE ?auto_63476 ) ( ON ?auto_63475 ?auto_63476 ) ( ON ?auto_63474 ?auto_63475 ) ( not ( = ?auto_63476 ?auto_63475 ) ) ( not ( = ?auto_63476 ?auto_63474 ) ) ( not ( = ?auto_63476 ?auto_63473 ) ) ( not ( = ?auto_63476 ?auto_63472 ) ) ( not ( = ?auto_63475 ?auto_63474 ) ) ( not ( = ?auto_63475 ?auto_63473 ) ) ( not ( = ?auto_63475 ?auto_63472 ) ) ( not ( = ?auto_63470 ?auto_63476 ) ) ( not ( = ?auto_63470 ?auto_63475 ) ) ( not ( = ?auto_63471 ?auto_63476 ) ) ( not ( = ?auto_63471 ?auto_63475 ) ) ( ON ?auto_63471 ?auto_63472 ) ( ON ?auto_63470 ?auto_63471 ) ( CLEAR ?auto_63470 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_63476 ?auto_63475 ?auto_63474 ?auto_63473 ?auto_63472 ?auto_63471 )
      ( MAKE-4PILE ?auto_63470 ?auto_63471 ?auto_63472 ?auto_63473 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_63479 - BLOCK
      ?auto_63480 - BLOCK
    )
    :vars
    (
      ?auto_63481 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63481 ?auto_63480 ) ( CLEAR ?auto_63481 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_63479 ) ( ON ?auto_63480 ?auto_63479 ) ( not ( = ?auto_63479 ?auto_63480 ) ) ( not ( = ?auto_63479 ?auto_63481 ) ) ( not ( = ?auto_63480 ?auto_63481 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_63481 ?auto_63480 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_63482 - BLOCK
      ?auto_63483 - BLOCK
    )
    :vars
    (
      ?auto_63484 - BLOCK
      ?auto_63485 - BLOCK
      ?auto_63486 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63484 ?auto_63483 ) ( CLEAR ?auto_63484 ) ( ON-TABLE ?auto_63482 ) ( ON ?auto_63483 ?auto_63482 ) ( not ( = ?auto_63482 ?auto_63483 ) ) ( not ( = ?auto_63482 ?auto_63484 ) ) ( not ( = ?auto_63483 ?auto_63484 ) ) ( HOLDING ?auto_63485 ) ( CLEAR ?auto_63486 ) ( not ( = ?auto_63482 ?auto_63485 ) ) ( not ( = ?auto_63482 ?auto_63486 ) ) ( not ( = ?auto_63483 ?auto_63485 ) ) ( not ( = ?auto_63483 ?auto_63486 ) ) ( not ( = ?auto_63484 ?auto_63485 ) ) ( not ( = ?auto_63484 ?auto_63486 ) ) ( not ( = ?auto_63485 ?auto_63486 ) ) )
    :subtasks
    ( ( !STACK ?auto_63485 ?auto_63486 )
      ( MAKE-2PILE ?auto_63482 ?auto_63483 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_63487 - BLOCK
      ?auto_63488 - BLOCK
    )
    :vars
    (
      ?auto_63490 - BLOCK
      ?auto_63491 - BLOCK
      ?auto_63489 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63490 ?auto_63488 ) ( ON-TABLE ?auto_63487 ) ( ON ?auto_63488 ?auto_63487 ) ( not ( = ?auto_63487 ?auto_63488 ) ) ( not ( = ?auto_63487 ?auto_63490 ) ) ( not ( = ?auto_63488 ?auto_63490 ) ) ( CLEAR ?auto_63491 ) ( not ( = ?auto_63487 ?auto_63489 ) ) ( not ( = ?auto_63487 ?auto_63491 ) ) ( not ( = ?auto_63488 ?auto_63489 ) ) ( not ( = ?auto_63488 ?auto_63491 ) ) ( not ( = ?auto_63490 ?auto_63489 ) ) ( not ( = ?auto_63490 ?auto_63491 ) ) ( not ( = ?auto_63489 ?auto_63491 ) ) ( ON ?auto_63489 ?auto_63490 ) ( CLEAR ?auto_63489 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_63487 ?auto_63488 ?auto_63490 )
      ( MAKE-2PILE ?auto_63487 ?auto_63488 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_63492 - BLOCK
      ?auto_63493 - BLOCK
    )
    :vars
    (
      ?auto_63494 - BLOCK
      ?auto_63495 - BLOCK
      ?auto_63496 - BLOCK
      ?auto_63497 - BLOCK
      ?auto_63498 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63494 ?auto_63493 ) ( ON-TABLE ?auto_63492 ) ( ON ?auto_63493 ?auto_63492 ) ( not ( = ?auto_63492 ?auto_63493 ) ) ( not ( = ?auto_63492 ?auto_63494 ) ) ( not ( = ?auto_63493 ?auto_63494 ) ) ( not ( = ?auto_63492 ?auto_63495 ) ) ( not ( = ?auto_63492 ?auto_63496 ) ) ( not ( = ?auto_63493 ?auto_63495 ) ) ( not ( = ?auto_63493 ?auto_63496 ) ) ( not ( = ?auto_63494 ?auto_63495 ) ) ( not ( = ?auto_63494 ?auto_63496 ) ) ( not ( = ?auto_63495 ?auto_63496 ) ) ( ON ?auto_63495 ?auto_63494 ) ( CLEAR ?auto_63495 ) ( HOLDING ?auto_63496 ) ( CLEAR ?auto_63497 ) ( ON-TABLE ?auto_63498 ) ( ON ?auto_63497 ?auto_63498 ) ( not ( = ?auto_63498 ?auto_63497 ) ) ( not ( = ?auto_63498 ?auto_63496 ) ) ( not ( = ?auto_63497 ?auto_63496 ) ) ( not ( = ?auto_63492 ?auto_63497 ) ) ( not ( = ?auto_63492 ?auto_63498 ) ) ( not ( = ?auto_63493 ?auto_63497 ) ) ( not ( = ?auto_63493 ?auto_63498 ) ) ( not ( = ?auto_63494 ?auto_63497 ) ) ( not ( = ?auto_63494 ?auto_63498 ) ) ( not ( = ?auto_63495 ?auto_63497 ) ) ( not ( = ?auto_63495 ?auto_63498 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_63498 ?auto_63497 ?auto_63496 )
      ( MAKE-2PILE ?auto_63492 ?auto_63493 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_63499 - BLOCK
      ?auto_63500 - BLOCK
    )
    :vars
    (
      ?auto_63503 - BLOCK
      ?auto_63501 - BLOCK
      ?auto_63505 - BLOCK
      ?auto_63504 - BLOCK
      ?auto_63502 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63503 ?auto_63500 ) ( ON-TABLE ?auto_63499 ) ( ON ?auto_63500 ?auto_63499 ) ( not ( = ?auto_63499 ?auto_63500 ) ) ( not ( = ?auto_63499 ?auto_63503 ) ) ( not ( = ?auto_63500 ?auto_63503 ) ) ( not ( = ?auto_63499 ?auto_63501 ) ) ( not ( = ?auto_63499 ?auto_63505 ) ) ( not ( = ?auto_63500 ?auto_63501 ) ) ( not ( = ?auto_63500 ?auto_63505 ) ) ( not ( = ?auto_63503 ?auto_63501 ) ) ( not ( = ?auto_63503 ?auto_63505 ) ) ( not ( = ?auto_63501 ?auto_63505 ) ) ( ON ?auto_63501 ?auto_63503 ) ( CLEAR ?auto_63504 ) ( ON-TABLE ?auto_63502 ) ( ON ?auto_63504 ?auto_63502 ) ( not ( = ?auto_63502 ?auto_63504 ) ) ( not ( = ?auto_63502 ?auto_63505 ) ) ( not ( = ?auto_63504 ?auto_63505 ) ) ( not ( = ?auto_63499 ?auto_63504 ) ) ( not ( = ?auto_63499 ?auto_63502 ) ) ( not ( = ?auto_63500 ?auto_63504 ) ) ( not ( = ?auto_63500 ?auto_63502 ) ) ( not ( = ?auto_63503 ?auto_63504 ) ) ( not ( = ?auto_63503 ?auto_63502 ) ) ( not ( = ?auto_63501 ?auto_63504 ) ) ( not ( = ?auto_63501 ?auto_63502 ) ) ( ON ?auto_63505 ?auto_63501 ) ( CLEAR ?auto_63505 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_63499 ?auto_63500 ?auto_63503 ?auto_63501 )
      ( MAKE-2PILE ?auto_63499 ?auto_63500 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_63506 - BLOCK
      ?auto_63507 - BLOCK
    )
    :vars
    (
      ?auto_63511 - BLOCK
      ?auto_63510 - BLOCK
      ?auto_63512 - BLOCK
      ?auto_63508 - BLOCK
      ?auto_63509 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63511 ?auto_63507 ) ( ON-TABLE ?auto_63506 ) ( ON ?auto_63507 ?auto_63506 ) ( not ( = ?auto_63506 ?auto_63507 ) ) ( not ( = ?auto_63506 ?auto_63511 ) ) ( not ( = ?auto_63507 ?auto_63511 ) ) ( not ( = ?auto_63506 ?auto_63510 ) ) ( not ( = ?auto_63506 ?auto_63512 ) ) ( not ( = ?auto_63507 ?auto_63510 ) ) ( not ( = ?auto_63507 ?auto_63512 ) ) ( not ( = ?auto_63511 ?auto_63510 ) ) ( not ( = ?auto_63511 ?auto_63512 ) ) ( not ( = ?auto_63510 ?auto_63512 ) ) ( ON ?auto_63510 ?auto_63511 ) ( ON-TABLE ?auto_63508 ) ( not ( = ?auto_63508 ?auto_63509 ) ) ( not ( = ?auto_63508 ?auto_63512 ) ) ( not ( = ?auto_63509 ?auto_63512 ) ) ( not ( = ?auto_63506 ?auto_63509 ) ) ( not ( = ?auto_63506 ?auto_63508 ) ) ( not ( = ?auto_63507 ?auto_63509 ) ) ( not ( = ?auto_63507 ?auto_63508 ) ) ( not ( = ?auto_63511 ?auto_63509 ) ) ( not ( = ?auto_63511 ?auto_63508 ) ) ( not ( = ?auto_63510 ?auto_63509 ) ) ( not ( = ?auto_63510 ?auto_63508 ) ) ( ON ?auto_63512 ?auto_63510 ) ( CLEAR ?auto_63512 ) ( HOLDING ?auto_63509 ) ( CLEAR ?auto_63508 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_63508 ?auto_63509 )
      ( MAKE-2PILE ?auto_63506 ?auto_63507 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_64284 - BLOCK
      ?auto_64285 - BLOCK
    )
    :vars
    (
      ?auto_64286 - BLOCK
      ?auto_64287 - BLOCK
      ?auto_64289 - BLOCK
      ?auto_64288 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64286 ?auto_64285 ) ( ON-TABLE ?auto_64284 ) ( ON ?auto_64285 ?auto_64284 ) ( not ( = ?auto_64284 ?auto_64285 ) ) ( not ( = ?auto_64284 ?auto_64286 ) ) ( not ( = ?auto_64285 ?auto_64286 ) ) ( not ( = ?auto_64284 ?auto_64287 ) ) ( not ( = ?auto_64284 ?auto_64289 ) ) ( not ( = ?auto_64285 ?auto_64287 ) ) ( not ( = ?auto_64285 ?auto_64289 ) ) ( not ( = ?auto_64286 ?auto_64287 ) ) ( not ( = ?auto_64286 ?auto_64289 ) ) ( not ( = ?auto_64287 ?auto_64289 ) ) ( ON ?auto_64287 ?auto_64286 ) ( not ( = ?auto_64288 ?auto_64289 ) ) ( not ( = ?auto_64284 ?auto_64288 ) ) ( not ( = ?auto_64285 ?auto_64288 ) ) ( not ( = ?auto_64286 ?auto_64288 ) ) ( not ( = ?auto_64287 ?auto_64288 ) ) ( ON ?auto_64289 ?auto_64287 ) ( ON ?auto_64288 ?auto_64289 ) ( CLEAR ?auto_64288 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_64284 ?auto_64285 ?auto_64286 ?auto_64287 ?auto_64289 )
      ( MAKE-2PILE ?auto_64284 ?auto_64285 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_63520 - BLOCK
      ?auto_63521 - BLOCK
    )
    :vars
    (
      ?auto_63523 - BLOCK
      ?auto_63522 - BLOCK
      ?auto_63526 - BLOCK
      ?auto_63524 - BLOCK
      ?auto_63525 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63523 ?auto_63521 ) ( ON-TABLE ?auto_63520 ) ( ON ?auto_63521 ?auto_63520 ) ( not ( = ?auto_63520 ?auto_63521 ) ) ( not ( = ?auto_63520 ?auto_63523 ) ) ( not ( = ?auto_63521 ?auto_63523 ) ) ( not ( = ?auto_63520 ?auto_63522 ) ) ( not ( = ?auto_63520 ?auto_63526 ) ) ( not ( = ?auto_63521 ?auto_63522 ) ) ( not ( = ?auto_63521 ?auto_63526 ) ) ( not ( = ?auto_63523 ?auto_63522 ) ) ( not ( = ?auto_63523 ?auto_63526 ) ) ( not ( = ?auto_63522 ?auto_63526 ) ) ( ON ?auto_63522 ?auto_63523 ) ( not ( = ?auto_63524 ?auto_63525 ) ) ( not ( = ?auto_63524 ?auto_63526 ) ) ( not ( = ?auto_63525 ?auto_63526 ) ) ( not ( = ?auto_63520 ?auto_63525 ) ) ( not ( = ?auto_63520 ?auto_63524 ) ) ( not ( = ?auto_63521 ?auto_63525 ) ) ( not ( = ?auto_63521 ?auto_63524 ) ) ( not ( = ?auto_63523 ?auto_63525 ) ) ( not ( = ?auto_63523 ?auto_63524 ) ) ( not ( = ?auto_63522 ?auto_63525 ) ) ( not ( = ?auto_63522 ?auto_63524 ) ) ( ON ?auto_63526 ?auto_63522 ) ( ON ?auto_63525 ?auto_63526 ) ( CLEAR ?auto_63525 ) ( HOLDING ?auto_63524 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_63524 )
      ( MAKE-2PILE ?auto_63520 ?auto_63521 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_63527 - BLOCK
      ?auto_63528 - BLOCK
    )
    :vars
    (
      ?auto_63532 - BLOCK
      ?auto_63531 - BLOCK
      ?auto_63530 - BLOCK
      ?auto_63529 - BLOCK
      ?auto_63533 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63532 ?auto_63528 ) ( ON-TABLE ?auto_63527 ) ( ON ?auto_63528 ?auto_63527 ) ( not ( = ?auto_63527 ?auto_63528 ) ) ( not ( = ?auto_63527 ?auto_63532 ) ) ( not ( = ?auto_63528 ?auto_63532 ) ) ( not ( = ?auto_63527 ?auto_63531 ) ) ( not ( = ?auto_63527 ?auto_63530 ) ) ( not ( = ?auto_63528 ?auto_63531 ) ) ( not ( = ?auto_63528 ?auto_63530 ) ) ( not ( = ?auto_63532 ?auto_63531 ) ) ( not ( = ?auto_63532 ?auto_63530 ) ) ( not ( = ?auto_63531 ?auto_63530 ) ) ( ON ?auto_63531 ?auto_63532 ) ( not ( = ?auto_63529 ?auto_63533 ) ) ( not ( = ?auto_63529 ?auto_63530 ) ) ( not ( = ?auto_63533 ?auto_63530 ) ) ( not ( = ?auto_63527 ?auto_63533 ) ) ( not ( = ?auto_63527 ?auto_63529 ) ) ( not ( = ?auto_63528 ?auto_63533 ) ) ( not ( = ?auto_63528 ?auto_63529 ) ) ( not ( = ?auto_63532 ?auto_63533 ) ) ( not ( = ?auto_63532 ?auto_63529 ) ) ( not ( = ?auto_63531 ?auto_63533 ) ) ( not ( = ?auto_63531 ?auto_63529 ) ) ( ON ?auto_63530 ?auto_63531 ) ( ON ?auto_63533 ?auto_63530 ) ( ON ?auto_63529 ?auto_63533 ) ( CLEAR ?auto_63529 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_63527 ?auto_63528 ?auto_63532 ?auto_63531 ?auto_63530 ?auto_63533 )
      ( MAKE-2PILE ?auto_63527 ?auto_63528 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_63539 - BLOCK
      ?auto_63540 - BLOCK
      ?auto_63541 - BLOCK
      ?auto_63542 - BLOCK
      ?auto_63543 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_63543 ) ( CLEAR ?auto_63542 ) ( ON-TABLE ?auto_63539 ) ( ON ?auto_63540 ?auto_63539 ) ( ON ?auto_63541 ?auto_63540 ) ( ON ?auto_63542 ?auto_63541 ) ( not ( = ?auto_63539 ?auto_63540 ) ) ( not ( = ?auto_63539 ?auto_63541 ) ) ( not ( = ?auto_63539 ?auto_63542 ) ) ( not ( = ?auto_63539 ?auto_63543 ) ) ( not ( = ?auto_63540 ?auto_63541 ) ) ( not ( = ?auto_63540 ?auto_63542 ) ) ( not ( = ?auto_63540 ?auto_63543 ) ) ( not ( = ?auto_63541 ?auto_63542 ) ) ( not ( = ?auto_63541 ?auto_63543 ) ) ( not ( = ?auto_63542 ?auto_63543 ) ) )
    :subtasks
    ( ( !STACK ?auto_63543 ?auto_63542 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_63544 - BLOCK
      ?auto_63545 - BLOCK
      ?auto_63546 - BLOCK
      ?auto_63547 - BLOCK
      ?auto_63548 - BLOCK
    )
    :vars
    (
      ?auto_63549 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_63547 ) ( ON-TABLE ?auto_63544 ) ( ON ?auto_63545 ?auto_63544 ) ( ON ?auto_63546 ?auto_63545 ) ( ON ?auto_63547 ?auto_63546 ) ( not ( = ?auto_63544 ?auto_63545 ) ) ( not ( = ?auto_63544 ?auto_63546 ) ) ( not ( = ?auto_63544 ?auto_63547 ) ) ( not ( = ?auto_63544 ?auto_63548 ) ) ( not ( = ?auto_63545 ?auto_63546 ) ) ( not ( = ?auto_63545 ?auto_63547 ) ) ( not ( = ?auto_63545 ?auto_63548 ) ) ( not ( = ?auto_63546 ?auto_63547 ) ) ( not ( = ?auto_63546 ?auto_63548 ) ) ( not ( = ?auto_63547 ?auto_63548 ) ) ( ON ?auto_63548 ?auto_63549 ) ( CLEAR ?auto_63548 ) ( HAND-EMPTY ) ( not ( = ?auto_63544 ?auto_63549 ) ) ( not ( = ?auto_63545 ?auto_63549 ) ) ( not ( = ?auto_63546 ?auto_63549 ) ) ( not ( = ?auto_63547 ?auto_63549 ) ) ( not ( = ?auto_63548 ?auto_63549 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_63548 ?auto_63549 )
      ( MAKE-5PILE ?auto_63544 ?auto_63545 ?auto_63546 ?auto_63547 ?auto_63548 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_63550 - BLOCK
      ?auto_63551 - BLOCK
      ?auto_63552 - BLOCK
      ?auto_63553 - BLOCK
      ?auto_63554 - BLOCK
    )
    :vars
    (
      ?auto_63555 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_63550 ) ( ON ?auto_63551 ?auto_63550 ) ( ON ?auto_63552 ?auto_63551 ) ( not ( = ?auto_63550 ?auto_63551 ) ) ( not ( = ?auto_63550 ?auto_63552 ) ) ( not ( = ?auto_63550 ?auto_63553 ) ) ( not ( = ?auto_63550 ?auto_63554 ) ) ( not ( = ?auto_63551 ?auto_63552 ) ) ( not ( = ?auto_63551 ?auto_63553 ) ) ( not ( = ?auto_63551 ?auto_63554 ) ) ( not ( = ?auto_63552 ?auto_63553 ) ) ( not ( = ?auto_63552 ?auto_63554 ) ) ( not ( = ?auto_63553 ?auto_63554 ) ) ( ON ?auto_63554 ?auto_63555 ) ( CLEAR ?auto_63554 ) ( not ( = ?auto_63550 ?auto_63555 ) ) ( not ( = ?auto_63551 ?auto_63555 ) ) ( not ( = ?auto_63552 ?auto_63555 ) ) ( not ( = ?auto_63553 ?auto_63555 ) ) ( not ( = ?auto_63554 ?auto_63555 ) ) ( HOLDING ?auto_63553 ) ( CLEAR ?auto_63552 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_63550 ?auto_63551 ?auto_63552 ?auto_63553 )
      ( MAKE-5PILE ?auto_63550 ?auto_63551 ?auto_63552 ?auto_63553 ?auto_63554 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_63556 - BLOCK
      ?auto_63557 - BLOCK
      ?auto_63558 - BLOCK
      ?auto_63559 - BLOCK
      ?auto_63560 - BLOCK
    )
    :vars
    (
      ?auto_63561 - BLOCK
      ?auto_63562 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_63556 ) ( ON ?auto_63557 ?auto_63556 ) ( ON ?auto_63558 ?auto_63557 ) ( not ( = ?auto_63556 ?auto_63557 ) ) ( not ( = ?auto_63556 ?auto_63558 ) ) ( not ( = ?auto_63556 ?auto_63559 ) ) ( not ( = ?auto_63556 ?auto_63560 ) ) ( not ( = ?auto_63557 ?auto_63558 ) ) ( not ( = ?auto_63557 ?auto_63559 ) ) ( not ( = ?auto_63557 ?auto_63560 ) ) ( not ( = ?auto_63558 ?auto_63559 ) ) ( not ( = ?auto_63558 ?auto_63560 ) ) ( not ( = ?auto_63559 ?auto_63560 ) ) ( ON ?auto_63560 ?auto_63561 ) ( not ( = ?auto_63556 ?auto_63561 ) ) ( not ( = ?auto_63557 ?auto_63561 ) ) ( not ( = ?auto_63558 ?auto_63561 ) ) ( not ( = ?auto_63559 ?auto_63561 ) ) ( not ( = ?auto_63560 ?auto_63561 ) ) ( CLEAR ?auto_63558 ) ( ON ?auto_63559 ?auto_63560 ) ( CLEAR ?auto_63559 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_63562 ) ( ON ?auto_63561 ?auto_63562 ) ( not ( = ?auto_63562 ?auto_63561 ) ) ( not ( = ?auto_63562 ?auto_63560 ) ) ( not ( = ?auto_63562 ?auto_63559 ) ) ( not ( = ?auto_63556 ?auto_63562 ) ) ( not ( = ?auto_63557 ?auto_63562 ) ) ( not ( = ?auto_63558 ?auto_63562 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_63562 ?auto_63561 ?auto_63560 )
      ( MAKE-5PILE ?auto_63556 ?auto_63557 ?auto_63558 ?auto_63559 ?auto_63560 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_63563 - BLOCK
      ?auto_63564 - BLOCK
      ?auto_63565 - BLOCK
      ?auto_63566 - BLOCK
      ?auto_63567 - BLOCK
    )
    :vars
    (
      ?auto_63569 - BLOCK
      ?auto_63568 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_63563 ) ( ON ?auto_63564 ?auto_63563 ) ( not ( = ?auto_63563 ?auto_63564 ) ) ( not ( = ?auto_63563 ?auto_63565 ) ) ( not ( = ?auto_63563 ?auto_63566 ) ) ( not ( = ?auto_63563 ?auto_63567 ) ) ( not ( = ?auto_63564 ?auto_63565 ) ) ( not ( = ?auto_63564 ?auto_63566 ) ) ( not ( = ?auto_63564 ?auto_63567 ) ) ( not ( = ?auto_63565 ?auto_63566 ) ) ( not ( = ?auto_63565 ?auto_63567 ) ) ( not ( = ?auto_63566 ?auto_63567 ) ) ( ON ?auto_63567 ?auto_63569 ) ( not ( = ?auto_63563 ?auto_63569 ) ) ( not ( = ?auto_63564 ?auto_63569 ) ) ( not ( = ?auto_63565 ?auto_63569 ) ) ( not ( = ?auto_63566 ?auto_63569 ) ) ( not ( = ?auto_63567 ?auto_63569 ) ) ( ON ?auto_63566 ?auto_63567 ) ( CLEAR ?auto_63566 ) ( ON-TABLE ?auto_63568 ) ( ON ?auto_63569 ?auto_63568 ) ( not ( = ?auto_63568 ?auto_63569 ) ) ( not ( = ?auto_63568 ?auto_63567 ) ) ( not ( = ?auto_63568 ?auto_63566 ) ) ( not ( = ?auto_63563 ?auto_63568 ) ) ( not ( = ?auto_63564 ?auto_63568 ) ) ( not ( = ?auto_63565 ?auto_63568 ) ) ( HOLDING ?auto_63565 ) ( CLEAR ?auto_63564 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_63563 ?auto_63564 ?auto_63565 )
      ( MAKE-5PILE ?auto_63563 ?auto_63564 ?auto_63565 ?auto_63566 ?auto_63567 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_63570 - BLOCK
      ?auto_63571 - BLOCK
      ?auto_63572 - BLOCK
      ?auto_63573 - BLOCK
      ?auto_63574 - BLOCK
    )
    :vars
    (
      ?auto_63575 - BLOCK
      ?auto_63576 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_63570 ) ( ON ?auto_63571 ?auto_63570 ) ( not ( = ?auto_63570 ?auto_63571 ) ) ( not ( = ?auto_63570 ?auto_63572 ) ) ( not ( = ?auto_63570 ?auto_63573 ) ) ( not ( = ?auto_63570 ?auto_63574 ) ) ( not ( = ?auto_63571 ?auto_63572 ) ) ( not ( = ?auto_63571 ?auto_63573 ) ) ( not ( = ?auto_63571 ?auto_63574 ) ) ( not ( = ?auto_63572 ?auto_63573 ) ) ( not ( = ?auto_63572 ?auto_63574 ) ) ( not ( = ?auto_63573 ?auto_63574 ) ) ( ON ?auto_63574 ?auto_63575 ) ( not ( = ?auto_63570 ?auto_63575 ) ) ( not ( = ?auto_63571 ?auto_63575 ) ) ( not ( = ?auto_63572 ?auto_63575 ) ) ( not ( = ?auto_63573 ?auto_63575 ) ) ( not ( = ?auto_63574 ?auto_63575 ) ) ( ON ?auto_63573 ?auto_63574 ) ( ON-TABLE ?auto_63576 ) ( ON ?auto_63575 ?auto_63576 ) ( not ( = ?auto_63576 ?auto_63575 ) ) ( not ( = ?auto_63576 ?auto_63574 ) ) ( not ( = ?auto_63576 ?auto_63573 ) ) ( not ( = ?auto_63570 ?auto_63576 ) ) ( not ( = ?auto_63571 ?auto_63576 ) ) ( not ( = ?auto_63572 ?auto_63576 ) ) ( CLEAR ?auto_63571 ) ( ON ?auto_63572 ?auto_63573 ) ( CLEAR ?auto_63572 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_63576 ?auto_63575 ?auto_63574 ?auto_63573 )
      ( MAKE-5PILE ?auto_63570 ?auto_63571 ?auto_63572 ?auto_63573 ?auto_63574 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_63577 - BLOCK
      ?auto_63578 - BLOCK
      ?auto_63579 - BLOCK
      ?auto_63580 - BLOCK
      ?auto_63581 - BLOCK
    )
    :vars
    (
      ?auto_63583 - BLOCK
      ?auto_63582 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_63577 ) ( not ( = ?auto_63577 ?auto_63578 ) ) ( not ( = ?auto_63577 ?auto_63579 ) ) ( not ( = ?auto_63577 ?auto_63580 ) ) ( not ( = ?auto_63577 ?auto_63581 ) ) ( not ( = ?auto_63578 ?auto_63579 ) ) ( not ( = ?auto_63578 ?auto_63580 ) ) ( not ( = ?auto_63578 ?auto_63581 ) ) ( not ( = ?auto_63579 ?auto_63580 ) ) ( not ( = ?auto_63579 ?auto_63581 ) ) ( not ( = ?auto_63580 ?auto_63581 ) ) ( ON ?auto_63581 ?auto_63583 ) ( not ( = ?auto_63577 ?auto_63583 ) ) ( not ( = ?auto_63578 ?auto_63583 ) ) ( not ( = ?auto_63579 ?auto_63583 ) ) ( not ( = ?auto_63580 ?auto_63583 ) ) ( not ( = ?auto_63581 ?auto_63583 ) ) ( ON ?auto_63580 ?auto_63581 ) ( ON-TABLE ?auto_63582 ) ( ON ?auto_63583 ?auto_63582 ) ( not ( = ?auto_63582 ?auto_63583 ) ) ( not ( = ?auto_63582 ?auto_63581 ) ) ( not ( = ?auto_63582 ?auto_63580 ) ) ( not ( = ?auto_63577 ?auto_63582 ) ) ( not ( = ?auto_63578 ?auto_63582 ) ) ( not ( = ?auto_63579 ?auto_63582 ) ) ( ON ?auto_63579 ?auto_63580 ) ( CLEAR ?auto_63579 ) ( HOLDING ?auto_63578 ) ( CLEAR ?auto_63577 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_63577 ?auto_63578 )
      ( MAKE-5PILE ?auto_63577 ?auto_63578 ?auto_63579 ?auto_63580 ?auto_63581 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_63584 - BLOCK
      ?auto_63585 - BLOCK
      ?auto_63586 - BLOCK
      ?auto_63587 - BLOCK
      ?auto_63588 - BLOCK
    )
    :vars
    (
      ?auto_63590 - BLOCK
      ?auto_63589 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_63584 ) ( not ( = ?auto_63584 ?auto_63585 ) ) ( not ( = ?auto_63584 ?auto_63586 ) ) ( not ( = ?auto_63584 ?auto_63587 ) ) ( not ( = ?auto_63584 ?auto_63588 ) ) ( not ( = ?auto_63585 ?auto_63586 ) ) ( not ( = ?auto_63585 ?auto_63587 ) ) ( not ( = ?auto_63585 ?auto_63588 ) ) ( not ( = ?auto_63586 ?auto_63587 ) ) ( not ( = ?auto_63586 ?auto_63588 ) ) ( not ( = ?auto_63587 ?auto_63588 ) ) ( ON ?auto_63588 ?auto_63590 ) ( not ( = ?auto_63584 ?auto_63590 ) ) ( not ( = ?auto_63585 ?auto_63590 ) ) ( not ( = ?auto_63586 ?auto_63590 ) ) ( not ( = ?auto_63587 ?auto_63590 ) ) ( not ( = ?auto_63588 ?auto_63590 ) ) ( ON ?auto_63587 ?auto_63588 ) ( ON-TABLE ?auto_63589 ) ( ON ?auto_63590 ?auto_63589 ) ( not ( = ?auto_63589 ?auto_63590 ) ) ( not ( = ?auto_63589 ?auto_63588 ) ) ( not ( = ?auto_63589 ?auto_63587 ) ) ( not ( = ?auto_63584 ?auto_63589 ) ) ( not ( = ?auto_63585 ?auto_63589 ) ) ( not ( = ?auto_63586 ?auto_63589 ) ) ( ON ?auto_63586 ?auto_63587 ) ( CLEAR ?auto_63584 ) ( ON ?auto_63585 ?auto_63586 ) ( CLEAR ?auto_63585 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_63589 ?auto_63590 ?auto_63588 ?auto_63587 ?auto_63586 )
      ( MAKE-5PILE ?auto_63584 ?auto_63585 ?auto_63586 ?auto_63587 ?auto_63588 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_63591 - BLOCK
      ?auto_63592 - BLOCK
      ?auto_63593 - BLOCK
      ?auto_63594 - BLOCK
      ?auto_63595 - BLOCK
    )
    :vars
    (
      ?auto_63596 - BLOCK
      ?auto_63597 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_63591 ?auto_63592 ) ) ( not ( = ?auto_63591 ?auto_63593 ) ) ( not ( = ?auto_63591 ?auto_63594 ) ) ( not ( = ?auto_63591 ?auto_63595 ) ) ( not ( = ?auto_63592 ?auto_63593 ) ) ( not ( = ?auto_63592 ?auto_63594 ) ) ( not ( = ?auto_63592 ?auto_63595 ) ) ( not ( = ?auto_63593 ?auto_63594 ) ) ( not ( = ?auto_63593 ?auto_63595 ) ) ( not ( = ?auto_63594 ?auto_63595 ) ) ( ON ?auto_63595 ?auto_63596 ) ( not ( = ?auto_63591 ?auto_63596 ) ) ( not ( = ?auto_63592 ?auto_63596 ) ) ( not ( = ?auto_63593 ?auto_63596 ) ) ( not ( = ?auto_63594 ?auto_63596 ) ) ( not ( = ?auto_63595 ?auto_63596 ) ) ( ON ?auto_63594 ?auto_63595 ) ( ON-TABLE ?auto_63597 ) ( ON ?auto_63596 ?auto_63597 ) ( not ( = ?auto_63597 ?auto_63596 ) ) ( not ( = ?auto_63597 ?auto_63595 ) ) ( not ( = ?auto_63597 ?auto_63594 ) ) ( not ( = ?auto_63591 ?auto_63597 ) ) ( not ( = ?auto_63592 ?auto_63597 ) ) ( not ( = ?auto_63593 ?auto_63597 ) ) ( ON ?auto_63593 ?auto_63594 ) ( ON ?auto_63592 ?auto_63593 ) ( CLEAR ?auto_63592 ) ( HOLDING ?auto_63591 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_63591 )
      ( MAKE-5PILE ?auto_63591 ?auto_63592 ?auto_63593 ?auto_63594 ?auto_63595 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_63598 - BLOCK
      ?auto_63599 - BLOCK
      ?auto_63600 - BLOCK
      ?auto_63601 - BLOCK
      ?auto_63602 - BLOCK
    )
    :vars
    (
      ?auto_63604 - BLOCK
      ?auto_63603 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_63598 ?auto_63599 ) ) ( not ( = ?auto_63598 ?auto_63600 ) ) ( not ( = ?auto_63598 ?auto_63601 ) ) ( not ( = ?auto_63598 ?auto_63602 ) ) ( not ( = ?auto_63599 ?auto_63600 ) ) ( not ( = ?auto_63599 ?auto_63601 ) ) ( not ( = ?auto_63599 ?auto_63602 ) ) ( not ( = ?auto_63600 ?auto_63601 ) ) ( not ( = ?auto_63600 ?auto_63602 ) ) ( not ( = ?auto_63601 ?auto_63602 ) ) ( ON ?auto_63602 ?auto_63604 ) ( not ( = ?auto_63598 ?auto_63604 ) ) ( not ( = ?auto_63599 ?auto_63604 ) ) ( not ( = ?auto_63600 ?auto_63604 ) ) ( not ( = ?auto_63601 ?auto_63604 ) ) ( not ( = ?auto_63602 ?auto_63604 ) ) ( ON ?auto_63601 ?auto_63602 ) ( ON-TABLE ?auto_63603 ) ( ON ?auto_63604 ?auto_63603 ) ( not ( = ?auto_63603 ?auto_63604 ) ) ( not ( = ?auto_63603 ?auto_63602 ) ) ( not ( = ?auto_63603 ?auto_63601 ) ) ( not ( = ?auto_63598 ?auto_63603 ) ) ( not ( = ?auto_63599 ?auto_63603 ) ) ( not ( = ?auto_63600 ?auto_63603 ) ) ( ON ?auto_63600 ?auto_63601 ) ( ON ?auto_63599 ?auto_63600 ) ( ON ?auto_63598 ?auto_63599 ) ( CLEAR ?auto_63598 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_63603 ?auto_63604 ?auto_63602 ?auto_63601 ?auto_63600 ?auto_63599 )
      ( MAKE-5PILE ?auto_63598 ?auto_63599 ?auto_63600 ?auto_63601 ?auto_63602 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_63606 - BLOCK
    )
    :vars
    (
      ?auto_63607 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63607 ?auto_63606 ) ( CLEAR ?auto_63607 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_63606 ) ( not ( = ?auto_63606 ?auto_63607 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_63607 ?auto_63606 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_63608 - BLOCK
    )
    :vars
    (
      ?auto_63609 - BLOCK
      ?auto_63610 - BLOCK
      ?auto_63611 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63609 ?auto_63608 ) ( CLEAR ?auto_63609 ) ( ON-TABLE ?auto_63608 ) ( not ( = ?auto_63608 ?auto_63609 ) ) ( HOLDING ?auto_63610 ) ( CLEAR ?auto_63611 ) ( not ( = ?auto_63608 ?auto_63610 ) ) ( not ( = ?auto_63608 ?auto_63611 ) ) ( not ( = ?auto_63609 ?auto_63610 ) ) ( not ( = ?auto_63609 ?auto_63611 ) ) ( not ( = ?auto_63610 ?auto_63611 ) ) )
    :subtasks
    ( ( !STACK ?auto_63610 ?auto_63611 )
      ( MAKE-1PILE ?auto_63608 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_63612 - BLOCK
    )
    :vars
    (
      ?auto_63614 - BLOCK
      ?auto_63613 - BLOCK
      ?auto_63615 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63614 ?auto_63612 ) ( ON-TABLE ?auto_63612 ) ( not ( = ?auto_63612 ?auto_63614 ) ) ( CLEAR ?auto_63613 ) ( not ( = ?auto_63612 ?auto_63615 ) ) ( not ( = ?auto_63612 ?auto_63613 ) ) ( not ( = ?auto_63614 ?auto_63615 ) ) ( not ( = ?auto_63614 ?auto_63613 ) ) ( not ( = ?auto_63615 ?auto_63613 ) ) ( ON ?auto_63615 ?auto_63614 ) ( CLEAR ?auto_63615 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_63612 ?auto_63614 )
      ( MAKE-1PILE ?auto_63612 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_63616 - BLOCK
    )
    :vars
    (
      ?auto_63618 - BLOCK
      ?auto_63617 - BLOCK
      ?auto_63619 - BLOCK
      ?auto_63622 - BLOCK
      ?auto_63620 - BLOCK
      ?auto_63621 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63618 ?auto_63616 ) ( ON-TABLE ?auto_63616 ) ( not ( = ?auto_63616 ?auto_63618 ) ) ( not ( = ?auto_63616 ?auto_63617 ) ) ( not ( = ?auto_63616 ?auto_63619 ) ) ( not ( = ?auto_63618 ?auto_63617 ) ) ( not ( = ?auto_63618 ?auto_63619 ) ) ( not ( = ?auto_63617 ?auto_63619 ) ) ( ON ?auto_63617 ?auto_63618 ) ( CLEAR ?auto_63617 ) ( HOLDING ?auto_63619 ) ( CLEAR ?auto_63622 ) ( ON-TABLE ?auto_63620 ) ( ON ?auto_63621 ?auto_63620 ) ( ON ?auto_63622 ?auto_63621 ) ( not ( = ?auto_63620 ?auto_63621 ) ) ( not ( = ?auto_63620 ?auto_63622 ) ) ( not ( = ?auto_63620 ?auto_63619 ) ) ( not ( = ?auto_63621 ?auto_63622 ) ) ( not ( = ?auto_63621 ?auto_63619 ) ) ( not ( = ?auto_63622 ?auto_63619 ) ) ( not ( = ?auto_63616 ?auto_63622 ) ) ( not ( = ?auto_63616 ?auto_63620 ) ) ( not ( = ?auto_63616 ?auto_63621 ) ) ( not ( = ?auto_63618 ?auto_63622 ) ) ( not ( = ?auto_63618 ?auto_63620 ) ) ( not ( = ?auto_63618 ?auto_63621 ) ) ( not ( = ?auto_63617 ?auto_63622 ) ) ( not ( = ?auto_63617 ?auto_63620 ) ) ( not ( = ?auto_63617 ?auto_63621 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_63620 ?auto_63621 ?auto_63622 ?auto_63619 )
      ( MAKE-1PILE ?auto_63616 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_63623 - BLOCK
    )
    :vars
    (
      ?auto_63625 - BLOCK
      ?auto_63624 - BLOCK
      ?auto_63626 - BLOCK
      ?auto_63628 - BLOCK
      ?auto_63629 - BLOCK
      ?auto_63627 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63625 ?auto_63623 ) ( ON-TABLE ?auto_63623 ) ( not ( = ?auto_63623 ?auto_63625 ) ) ( not ( = ?auto_63623 ?auto_63624 ) ) ( not ( = ?auto_63623 ?auto_63626 ) ) ( not ( = ?auto_63625 ?auto_63624 ) ) ( not ( = ?auto_63625 ?auto_63626 ) ) ( not ( = ?auto_63624 ?auto_63626 ) ) ( ON ?auto_63624 ?auto_63625 ) ( CLEAR ?auto_63628 ) ( ON-TABLE ?auto_63629 ) ( ON ?auto_63627 ?auto_63629 ) ( ON ?auto_63628 ?auto_63627 ) ( not ( = ?auto_63629 ?auto_63627 ) ) ( not ( = ?auto_63629 ?auto_63628 ) ) ( not ( = ?auto_63629 ?auto_63626 ) ) ( not ( = ?auto_63627 ?auto_63628 ) ) ( not ( = ?auto_63627 ?auto_63626 ) ) ( not ( = ?auto_63628 ?auto_63626 ) ) ( not ( = ?auto_63623 ?auto_63628 ) ) ( not ( = ?auto_63623 ?auto_63629 ) ) ( not ( = ?auto_63623 ?auto_63627 ) ) ( not ( = ?auto_63625 ?auto_63628 ) ) ( not ( = ?auto_63625 ?auto_63629 ) ) ( not ( = ?auto_63625 ?auto_63627 ) ) ( not ( = ?auto_63624 ?auto_63628 ) ) ( not ( = ?auto_63624 ?auto_63629 ) ) ( not ( = ?auto_63624 ?auto_63627 ) ) ( ON ?auto_63626 ?auto_63624 ) ( CLEAR ?auto_63626 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_63623 ?auto_63625 ?auto_63624 )
      ( MAKE-1PILE ?auto_63623 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_63630 - BLOCK
    )
    :vars
    (
      ?auto_63636 - BLOCK
      ?auto_63635 - BLOCK
      ?auto_63633 - BLOCK
      ?auto_63634 - BLOCK
      ?auto_63632 - BLOCK
      ?auto_63631 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63636 ?auto_63630 ) ( ON-TABLE ?auto_63630 ) ( not ( = ?auto_63630 ?auto_63636 ) ) ( not ( = ?auto_63630 ?auto_63635 ) ) ( not ( = ?auto_63630 ?auto_63633 ) ) ( not ( = ?auto_63636 ?auto_63635 ) ) ( not ( = ?auto_63636 ?auto_63633 ) ) ( not ( = ?auto_63635 ?auto_63633 ) ) ( ON ?auto_63635 ?auto_63636 ) ( ON-TABLE ?auto_63634 ) ( ON ?auto_63632 ?auto_63634 ) ( not ( = ?auto_63634 ?auto_63632 ) ) ( not ( = ?auto_63634 ?auto_63631 ) ) ( not ( = ?auto_63634 ?auto_63633 ) ) ( not ( = ?auto_63632 ?auto_63631 ) ) ( not ( = ?auto_63632 ?auto_63633 ) ) ( not ( = ?auto_63631 ?auto_63633 ) ) ( not ( = ?auto_63630 ?auto_63631 ) ) ( not ( = ?auto_63630 ?auto_63634 ) ) ( not ( = ?auto_63630 ?auto_63632 ) ) ( not ( = ?auto_63636 ?auto_63631 ) ) ( not ( = ?auto_63636 ?auto_63634 ) ) ( not ( = ?auto_63636 ?auto_63632 ) ) ( not ( = ?auto_63635 ?auto_63631 ) ) ( not ( = ?auto_63635 ?auto_63634 ) ) ( not ( = ?auto_63635 ?auto_63632 ) ) ( ON ?auto_63633 ?auto_63635 ) ( CLEAR ?auto_63633 ) ( HOLDING ?auto_63631 ) ( CLEAR ?auto_63632 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_63634 ?auto_63632 ?auto_63631 )
      ( MAKE-1PILE ?auto_63630 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_63637 - BLOCK
    )
    :vars
    (
      ?auto_63639 - BLOCK
      ?auto_63641 - BLOCK
      ?auto_63638 - BLOCK
      ?auto_63643 - BLOCK
      ?auto_63642 - BLOCK
      ?auto_63640 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63639 ?auto_63637 ) ( ON-TABLE ?auto_63637 ) ( not ( = ?auto_63637 ?auto_63639 ) ) ( not ( = ?auto_63637 ?auto_63641 ) ) ( not ( = ?auto_63637 ?auto_63638 ) ) ( not ( = ?auto_63639 ?auto_63641 ) ) ( not ( = ?auto_63639 ?auto_63638 ) ) ( not ( = ?auto_63641 ?auto_63638 ) ) ( ON ?auto_63641 ?auto_63639 ) ( ON-TABLE ?auto_63643 ) ( ON ?auto_63642 ?auto_63643 ) ( not ( = ?auto_63643 ?auto_63642 ) ) ( not ( = ?auto_63643 ?auto_63640 ) ) ( not ( = ?auto_63643 ?auto_63638 ) ) ( not ( = ?auto_63642 ?auto_63640 ) ) ( not ( = ?auto_63642 ?auto_63638 ) ) ( not ( = ?auto_63640 ?auto_63638 ) ) ( not ( = ?auto_63637 ?auto_63640 ) ) ( not ( = ?auto_63637 ?auto_63643 ) ) ( not ( = ?auto_63637 ?auto_63642 ) ) ( not ( = ?auto_63639 ?auto_63640 ) ) ( not ( = ?auto_63639 ?auto_63643 ) ) ( not ( = ?auto_63639 ?auto_63642 ) ) ( not ( = ?auto_63641 ?auto_63640 ) ) ( not ( = ?auto_63641 ?auto_63643 ) ) ( not ( = ?auto_63641 ?auto_63642 ) ) ( ON ?auto_63638 ?auto_63641 ) ( CLEAR ?auto_63642 ) ( ON ?auto_63640 ?auto_63638 ) ( CLEAR ?auto_63640 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_63637 ?auto_63639 ?auto_63641 ?auto_63638 )
      ( MAKE-1PILE ?auto_63637 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_63644 - BLOCK
    )
    :vars
    (
      ?auto_63650 - BLOCK
      ?auto_63649 - BLOCK
      ?auto_63647 - BLOCK
      ?auto_63645 - BLOCK
      ?auto_63648 - BLOCK
      ?auto_63646 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63650 ?auto_63644 ) ( ON-TABLE ?auto_63644 ) ( not ( = ?auto_63644 ?auto_63650 ) ) ( not ( = ?auto_63644 ?auto_63649 ) ) ( not ( = ?auto_63644 ?auto_63647 ) ) ( not ( = ?auto_63650 ?auto_63649 ) ) ( not ( = ?auto_63650 ?auto_63647 ) ) ( not ( = ?auto_63649 ?auto_63647 ) ) ( ON ?auto_63649 ?auto_63650 ) ( ON-TABLE ?auto_63645 ) ( not ( = ?auto_63645 ?auto_63648 ) ) ( not ( = ?auto_63645 ?auto_63646 ) ) ( not ( = ?auto_63645 ?auto_63647 ) ) ( not ( = ?auto_63648 ?auto_63646 ) ) ( not ( = ?auto_63648 ?auto_63647 ) ) ( not ( = ?auto_63646 ?auto_63647 ) ) ( not ( = ?auto_63644 ?auto_63646 ) ) ( not ( = ?auto_63644 ?auto_63645 ) ) ( not ( = ?auto_63644 ?auto_63648 ) ) ( not ( = ?auto_63650 ?auto_63646 ) ) ( not ( = ?auto_63650 ?auto_63645 ) ) ( not ( = ?auto_63650 ?auto_63648 ) ) ( not ( = ?auto_63649 ?auto_63646 ) ) ( not ( = ?auto_63649 ?auto_63645 ) ) ( not ( = ?auto_63649 ?auto_63648 ) ) ( ON ?auto_63647 ?auto_63649 ) ( ON ?auto_63646 ?auto_63647 ) ( CLEAR ?auto_63646 ) ( HOLDING ?auto_63648 ) ( CLEAR ?auto_63645 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_63645 ?auto_63648 )
      ( MAKE-1PILE ?auto_63644 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_64497 - BLOCK
    )
    :vars
    (
      ?auto_64498 - BLOCK
      ?auto_64501 - BLOCK
      ?auto_64502 - BLOCK
      ?auto_64499 - BLOCK
      ?auto_64500 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64498 ?auto_64497 ) ( ON-TABLE ?auto_64497 ) ( not ( = ?auto_64497 ?auto_64498 ) ) ( not ( = ?auto_64497 ?auto_64501 ) ) ( not ( = ?auto_64497 ?auto_64502 ) ) ( not ( = ?auto_64498 ?auto_64501 ) ) ( not ( = ?auto_64498 ?auto_64502 ) ) ( not ( = ?auto_64501 ?auto_64502 ) ) ( ON ?auto_64501 ?auto_64498 ) ( not ( = ?auto_64499 ?auto_64500 ) ) ( not ( = ?auto_64499 ?auto_64502 ) ) ( not ( = ?auto_64500 ?auto_64502 ) ) ( not ( = ?auto_64497 ?auto_64500 ) ) ( not ( = ?auto_64497 ?auto_64499 ) ) ( not ( = ?auto_64498 ?auto_64500 ) ) ( not ( = ?auto_64498 ?auto_64499 ) ) ( not ( = ?auto_64501 ?auto_64500 ) ) ( not ( = ?auto_64501 ?auto_64499 ) ) ( ON ?auto_64502 ?auto_64501 ) ( ON ?auto_64500 ?auto_64502 ) ( ON ?auto_64499 ?auto_64500 ) ( CLEAR ?auto_64499 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_64497 ?auto_64498 ?auto_64501 ?auto_64502 ?auto_64500 )
      ( MAKE-1PILE ?auto_64497 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_63658 - BLOCK
    )
    :vars
    (
      ?auto_63662 - BLOCK
      ?auto_63663 - BLOCK
      ?auto_63660 - BLOCK
      ?auto_63664 - BLOCK
      ?auto_63661 - BLOCK
      ?auto_63659 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63662 ?auto_63658 ) ( ON-TABLE ?auto_63658 ) ( not ( = ?auto_63658 ?auto_63662 ) ) ( not ( = ?auto_63658 ?auto_63663 ) ) ( not ( = ?auto_63658 ?auto_63660 ) ) ( not ( = ?auto_63662 ?auto_63663 ) ) ( not ( = ?auto_63662 ?auto_63660 ) ) ( not ( = ?auto_63663 ?auto_63660 ) ) ( ON ?auto_63663 ?auto_63662 ) ( not ( = ?auto_63664 ?auto_63661 ) ) ( not ( = ?auto_63664 ?auto_63659 ) ) ( not ( = ?auto_63664 ?auto_63660 ) ) ( not ( = ?auto_63661 ?auto_63659 ) ) ( not ( = ?auto_63661 ?auto_63660 ) ) ( not ( = ?auto_63659 ?auto_63660 ) ) ( not ( = ?auto_63658 ?auto_63659 ) ) ( not ( = ?auto_63658 ?auto_63664 ) ) ( not ( = ?auto_63658 ?auto_63661 ) ) ( not ( = ?auto_63662 ?auto_63659 ) ) ( not ( = ?auto_63662 ?auto_63664 ) ) ( not ( = ?auto_63662 ?auto_63661 ) ) ( not ( = ?auto_63663 ?auto_63659 ) ) ( not ( = ?auto_63663 ?auto_63664 ) ) ( not ( = ?auto_63663 ?auto_63661 ) ) ( ON ?auto_63660 ?auto_63663 ) ( ON ?auto_63659 ?auto_63660 ) ( ON ?auto_63661 ?auto_63659 ) ( CLEAR ?auto_63661 ) ( HOLDING ?auto_63664 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_63664 )
      ( MAKE-1PILE ?auto_63658 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_63665 - BLOCK
    )
    :vars
    (
      ?auto_63670 - BLOCK
      ?auto_63666 - BLOCK
      ?auto_63668 - BLOCK
      ?auto_63667 - BLOCK
      ?auto_63671 - BLOCK
      ?auto_63669 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63670 ?auto_63665 ) ( ON-TABLE ?auto_63665 ) ( not ( = ?auto_63665 ?auto_63670 ) ) ( not ( = ?auto_63665 ?auto_63666 ) ) ( not ( = ?auto_63665 ?auto_63668 ) ) ( not ( = ?auto_63670 ?auto_63666 ) ) ( not ( = ?auto_63670 ?auto_63668 ) ) ( not ( = ?auto_63666 ?auto_63668 ) ) ( ON ?auto_63666 ?auto_63670 ) ( not ( = ?auto_63667 ?auto_63671 ) ) ( not ( = ?auto_63667 ?auto_63669 ) ) ( not ( = ?auto_63667 ?auto_63668 ) ) ( not ( = ?auto_63671 ?auto_63669 ) ) ( not ( = ?auto_63671 ?auto_63668 ) ) ( not ( = ?auto_63669 ?auto_63668 ) ) ( not ( = ?auto_63665 ?auto_63669 ) ) ( not ( = ?auto_63665 ?auto_63667 ) ) ( not ( = ?auto_63665 ?auto_63671 ) ) ( not ( = ?auto_63670 ?auto_63669 ) ) ( not ( = ?auto_63670 ?auto_63667 ) ) ( not ( = ?auto_63670 ?auto_63671 ) ) ( not ( = ?auto_63666 ?auto_63669 ) ) ( not ( = ?auto_63666 ?auto_63667 ) ) ( not ( = ?auto_63666 ?auto_63671 ) ) ( ON ?auto_63668 ?auto_63666 ) ( ON ?auto_63669 ?auto_63668 ) ( ON ?auto_63671 ?auto_63669 ) ( ON ?auto_63667 ?auto_63671 ) ( CLEAR ?auto_63667 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_63665 ?auto_63670 ?auto_63666 ?auto_63668 ?auto_63669 ?auto_63671 )
      ( MAKE-1PILE ?auto_63665 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_63678 - BLOCK
      ?auto_63679 - BLOCK
      ?auto_63680 - BLOCK
      ?auto_63681 - BLOCK
      ?auto_63682 - BLOCK
      ?auto_63683 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_63683 ) ( CLEAR ?auto_63682 ) ( ON-TABLE ?auto_63678 ) ( ON ?auto_63679 ?auto_63678 ) ( ON ?auto_63680 ?auto_63679 ) ( ON ?auto_63681 ?auto_63680 ) ( ON ?auto_63682 ?auto_63681 ) ( not ( = ?auto_63678 ?auto_63679 ) ) ( not ( = ?auto_63678 ?auto_63680 ) ) ( not ( = ?auto_63678 ?auto_63681 ) ) ( not ( = ?auto_63678 ?auto_63682 ) ) ( not ( = ?auto_63678 ?auto_63683 ) ) ( not ( = ?auto_63679 ?auto_63680 ) ) ( not ( = ?auto_63679 ?auto_63681 ) ) ( not ( = ?auto_63679 ?auto_63682 ) ) ( not ( = ?auto_63679 ?auto_63683 ) ) ( not ( = ?auto_63680 ?auto_63681 ) ) ( not ( = ?auto_63680 ?auto_63682 ) ) ( not ( = ?auto_63680 ?auto_63683 ) ) ( not ( = ?auto_63681 ?auto_63682 ) ) ( not ( = ?auto_63681 ?auto_63683 ) ) ( not ( = ?auto_63682 ?auto_63683 ) ) )
    :subtasks
    ( ( !STACK ?auto_63683 ?auto_63682 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_63684 - BLOCK
      ?auto_63685 - BLOCK
      ?auto_63686 - BLOCK
      ?auto_63687 - BLOCK
      ?auto_63688 - BLOCK
      ?auto_63689 - BLOCK
    )
    :vars
    (
      ?auto_63690 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_63688 ) ( ON-TABLE ?auto_63684 ) ( ON ?auto_63685 ?auto_63684 ) ( ON ?auto_63686 ?auto_63685 ) ( ON ?auto_63687 ?auto_63686 ) ( ON ?auto_63688 ?auto_63687 ) ( not ( = ?auto_63684 ?auto_63685 ) ) ( not ( = ?auto_63684 ?auto_63686 ) ) ( not ( = ?auto_63684 ?auto_63687 ) ) ( not ( = ?auto_63684 ?auto_63688 ) ) ( not ( = ?auto_63684 ?auto_63689 ) ) ( not ( = ?auto_63685 ?auto_63686 ) ) ( not ( = ?auto_63685 ?auto_63687 ) ) ( not ( = ?auto_63685 ?auto_63688 ) ) ( not ( = ?auto_63685 ?auto_63689 ) ) ( not ( = ?auto_63686 ?auto_63687 ) ) ( not ( = ?auto_63686 ?auto_63688 ) ) ( not ( = ?auto_63686 ?auto_63689 ) ) ( not ( = ?auto_63687 ?auto_63688 ) ) ( not ( = ?auto_63687 ?auto_63689 ) ) ( not ( = ?auto_63688 ?auto_63689 ) ) ( ON ?auto_63689 ?auto_63690 ) ( CLEAR ?auto_63689 ) ( HAND-EMPTY ) ( not ( = ?auto_63684 ?auto_63690 ) ) ( not ( = ?auto_63685 ?auto_63690 ) ) ( not ( = ?auto_63686 ?auto_63690 ) ) ( not ( = ?auto_63687 ?auto_63690 ) ) ( not ( = ?auto_63688 ?auto_63690 ) ) ( not ( = ?auto_63689 ?auto_63690 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_63689 ?auto_63690 )
      ( MAKE-6PILE ?auto_63684 ?auto_63685 ?auto_63686 ?auto_63687 ?auto_63688 ?auto_63689 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_63691 - BLOCK
      ?auto_63692 - BLOCK
      ?auto_63693 - BLOCK
      ?auto_63694 - BLOCK
      ?auto_63695 - BLOCK
      ?auto_63696 - BLOCK
    )
    :vars
    (
      ?auto_63697 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_63691 ) ( ON ?auto_63692 ?auto_63691 ) ( ON ?auto_63693 ?auto_63692 ) ( ON ?auto_63694 ?auto_63693 ) ( not ( = ?auto_63691 ?auto_63692 ) ) ( not ( = ?auto_63691 ?auto_63693 ) ) ( not ( = ?auto_63691 ?auto_63694 ) ) ( not ( = ?auto_63691 ?auto_63695 ) ) ( not ( = ?auto_63691 ?auto_63696 ) ) ( not ( = ?auto_63692 ?auto_63693 ) ) ( not ( = ?auto_63692 ?auto_63694 ) ) ( not ( = ?auto_63692 ?auto_63695 ) ) ( not ( = ?auto_63692 ?auto_63696 ) ) ( not ( = ?auto_63693 ?auto_63694 ) ) ( not ( = ?auto_63693 ?auto_63695 ) ) ( not ( = ?auto_63693 ?auto_63696 ) ) ( not ( = ?auto_63694 ?auto_63695 ) ) ( not ( = ?auto_63694 ?auto_63696 ) ) ( not ( = ?auto_63695 ?auto_63696 ) ) ( ON ?auto_63696 ?auto_63697 ) ( CLEAR ?auto_63696 ) ( not ( = ?auto_63691 ?auto_63697 ) ) ( not ( = ?auto_63692 ?auto_63697 ) ) ( not ( = ?auto_63693 ?auto_63697 ) ) ( not ( = ?auto_63694 ?auto_63697 ) ) ( not ( = ?auto_63695 ?auto_63697 ) ) ( not ( = ?auto_63696 ?auto_63697 ) ) ( HOLDING ?auto_63695 ) ( CLEAR ?auto_63694 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_63691 ?auto_63692 ?auto_63693 ?auto_63694 ?auto_63695 )
      ( MAKE-6PILE ?auto_63691 ?auto_63692 ?auto_63693 ?auto_63694 ?auto_63695 ?auto_63696 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_63698 - BLOCK
      ?auto_63699 - BLOCK
      ?auto_63700 - BLOCK
      ?auto_63701 - BLOCK
      ?auto_63702 - BLOCK
      ?auto_63703 - BLOCK
    )
    :vars
    (
      ?auto_63704 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_63698 ) ( ON ?auto_63699 ?auto_63698 ) ( ON ?auto_63700 ?auto_63699 ) ( ON ?auto_63701 ?auto_63700 ) ( not ( = ?auto_63698 ?auto_63699 ) ) ( not ( = ?auto_63698 ?auto_63700 ) ) ( not ( = ?auto_63698 ?auto_63701 ) ) ( not ( = ?auto_63698 ?auto_63702 ) ) ( not ( = ?auto_63698 ?auto_63703 ) ) ( not ( = ?auto_63699 ?auto_63700 ) ) ( not ( = ?auto_63699 ?auto_63701 ) ) ( not ( = ?auto_63699 ?auto_63702 ) ) ( not ( = ?auto_63699 ?auto_63703 ) ) ( not ( = ?auto_63700 ?auto_63701 ) ) ( not ( = ?auto_63700 ?auto_63702 ) ) ( not ( = ?auto_63700 ?auto_63703 ) ) ( not ( = ?auto_63701 ?auto_63702 ) ) ( not ( = ?auto_63701 ?auto_63703 ) ) ( not ( = ?auto_63702 ?auto_63703 ) ) ( ON ?auto_63703 ?auto_63704 ) ( not ( = ?auto_63698 ?auto_63704 ) ) ( not ( = ?auto_63699 ?auto_63704 ) ) ( not ( = ?auto_63700 ?auto_63704 ) ) ( not ( = ?auto_63701 ?auto_63704 ) ) ( not ( = ?auto_63702 ?auto_63704 ) ) ( not ( = ?auto_63703 ?auto_63704 ) ) ( CLEAR ?auto_63701 ) ( ON ?auto_63702 ?auto_63703 ) ( CLEAR ?auto_63702 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_63704 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_63704 ?auto_63703 )
      ( MAKE-6PILE ?auto_63698 ?auto_63699 ?auto_63700 ?auto_63701 ?auto_63702 ?auto_63703 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_63705 - BLOCK
      ?auto_63706 - BLOCK
      ?auto_63707 - BLOCK
      ?auto_63708 - BLOCK
      ?auto_63709 - BLOCK
      ?auto_63710 - BLOCK
    )
    :vars
    (
      ?auto_63711 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_63705 ) ( ON ?auto_63706 ?auto_63705 ) ( ON ?auto_63707 ?auto_63706 ) ( not ( = ?auto_63705 ?auto_63706 ) ) ( not ( = ?auto_63705 ?auto_63707 ) ) ( not ( = ?auto_63705 ?auto_63708 ) ) ( not ( = ?auto_63705 ?auto_63709 ) ) ( not ( = ?auto_63705 ?auto_63710 ) ) ( not ( = ?auto_63706 ?auto_63707 ) ) ( not ( = ?auto_63706 ?auto_63708 ) ) ( not ( = ?auto_63706 ?auto_63709 ) ) ( not ( = ?auto_63706 ?auto_63710 ) ) ( not ( = ?auto_63707 ?auto_63708 ) ) ( not ( = ?auto_63707 ?auto_63709 ) ) ( not ( = ?auto_63707 ?auto_63710 ) ) ( not ( = ?auto_63708 ?auto_63709 ) ) ( not ( = ?auto_63708 ?auto_63710 ) ) ( not ( = ?auto_63709 ?auto_63710 ) ) ( ON ?auto_63710 ?auto_63711 ) ( not ( = ?auto_63705 ?auto_63711 ) ) ( not ( = ?auto_63706 ?auto_63711 ) ) ( not ( = ?auto_63707 ?auto_63711 ) ) ( not ( = ?auto_63708 ?auto_63711 ) ) ( not ( = ?auto_63709 ?auto_63711 ) ) ( not ( = ?auto_63710 ?auto_63711 ) ) ( ON ?auto_63709 ?auto_63710 ) ( CLEAR ?auto_63709 ) ( ON-TABLE ?auto_63711 ) ( HOLDING ?auto_63708 ) ( CLEAR ?auto_63707 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_63705 ?auto_63706 ?auto_63707 ?auto_63708 )
      ( MAKE-6PILE ?auto_63705 ?auto_63706 ?auto_63707 ?auto_63708 ?auto_63709 ?auto_63710 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_63712 - BLOCK
      ?auto_63713 - BLOCK
      ?auto_63714 - BLOCK
      ?auto_63715 - BLOCK
      ?auto_63716 - BLOCK
      ?auto_63717 - BLOCK
    )
    :vars
    (
      ?auto_63718 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_63712 ) ( ON ?auto_63713 ?auto_63712 ) ( ON ?auto_63714 ?auto_63713 ) ( not ( = ?auto_63712 ?auto_63713 ) ) ( not ( = ?auto_63712 ?auto_63714 ) ) ( not ( = ?auto_63712 ?auto_63715 ) ) ( not ( = ?auto_63712 ?auto_63716 ) ) ( not ( = ?auto_63712 ?auto_63717 ) ) ( not ( = ?auto_63713 ?auto_63714 ) ) ( not ( = ?auto_63713 ?auto_63715 ) ) ( not ( = ?auto_63713 ?auto_63716 ) ) ( not ( = ?auto_63713 ?auto_63717 ) ) ( not ( = ?auto_63714 ?auto_63715 ) ) ( not ( = ?auto_63714 ?auto_63716 ) ) ( not ( = ?auto_63714 ?auto_63717 ) ) ( not ( = ?auto_63715 ?auto_63716 ) ) ( not ( = ?auto_63715 ?auto_63717 ) ) ( not ( = ?auto_63716 ?auto_63717 ) ) ( ON ?auto_63717 ?auto_63718 ) ( not ( = ?auto_63712 ?auto_63718 ) ) ( not ( = ?auto_63713 ?auto_63718 ) ) ( not ( = ?auto_63714 ?auto_63718 ) ) ( not ( = ?auto_63715 ?auto_63718 ) ) ( not ( = ?auto_63716 ?auto_63718 ) ) ( not ( = ?auto_63717 ?auto_63718 ) ) ( ON ?auto_63716 ?auto_63717 ) ( ON-TABLE ?auto_63718 ) ( CLEAR ?auto_63714 ) ( ON ?auto_63715 ?auto_63716 ) ( CLEAR ?auto_63715 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_63718 ?auto_63717 ?auto_63716 )
      ( MAKE-6PILE ?auto_63712 ?auto_63713 ?auto_63714 ?auto_63715 ?auto_63716 ?auto_63717 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_63719 - BLOCK
      ?auto_63720 - BLOCK
      ?auto_63721 - BLOCK
      ?auto_63722 - BLOCK
      ?auto_63723 - BLOCK
      ?auto_63724 - BLOCK
    )
    :vars
    (
      ?auto_63725 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_63719 ) ( ON ?auto_63720 ?auto_63719 ) ( not ( = ?auto_63719 ?auto_63720 ) ) ( not ( = ?auto_63719 ?auto_63721 ) ) ( not ( = ?auto_63719 ?auto_63722 ) ) ( not ( = ?auto_63719 ?auto_63723 ) ) ( not ( = ?auto_63719 ?auto_63724 ) ) ( not ( = ?auto_63720 ?auto_63721 ) ) ( not ( = ?auto_63720 ?auto_63722 ) ) ( not ( = ?auto_63720 ?auto_63723 ) ) ( not ( = ?auto_63720 ?auto_63724 ) ) ( not ( = ?auto_63721 ?auto_63722 ) ) ( not ( = ?auto_63721 ?auto_63723 ) ) ( not ( = ?auto_63721 ?auto_63724 ) ) ( not ( = ?auto_63722 ?auto_63723 ) ) ( not ( = ?auto_63722 ?auto_63724 ) ) ( not ( = ?auto_63723 ?auto_63724 ) ) ( ON ?auto_63724 ?auto_63725 ) ( not ( = ?auto_63719 ?auto_63725 ) ) ( not ( = ?auto_63720 ?auto_63725 ) ) ( not ( = ?auto_63721 ?auto_63725 ) ) ( not ( = ?auto_63722 ?auto_63725 ) ) ( not ( = ?auto_63723 ?auto_63725 ) ) ( not ( = ?auto_63724 ?auto_63725 ) ) ( ON ?auto_63723 ?auto_63724 ) ( ON-TABLE ?auto_63725 ) ( ON ?auto_63722 ?auto_63723 ) ( CLEAR ?auto_63722 ) ( HOLDING ?auto_63721 ) ( CLEAR ?auto_63720 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_63719 ?auto_63720 ?auto_63721 )
      ( MAKE-6PILE ?auto_63719 ?auto_63720 ?auto_63721 ?auto_63722 ?auto_63723 ?auto_63724 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_63726 - BLOCK
      ?auto_63727 - BLOCK
      ?auto_63728 - BLOCK
      ?auto_63729 - BLOCK
      ?auto_63730 - BLOCK
      ?auto_63731 - BLOCK
    )
    :vars
    (
      ?auto_63732 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_63726 ) ( ON ?auto_63727 ?auto_63726 ) ( not ( = ?auto_63726 ?auto_63727 ) ) ( not ( = ?auto_63726 ?auto_63728 ) ) ( not ( = ?auto_63726 ?auto_63729 ) ) ( not ( = ?auto_63726 ?auto_63730 ) ) ( not ( = ?auto_63726 ?auto_63731 ) ) ( not ( = ?auto_63727 ?auto_63728 ) ) ( not ( = ?auto_63727 ?auto_63729 ) ) ( not ( = ?auto_63727 ?auto_63730 ) ) ( not ( = ?auto_63727 ?auto_63731 ) ) ( not ( = ?auto_63728 ?auto_63729 ) ) ( not ( = ?auto_63728 ?auto_63730 ) ) ( not ( = ?auto_63728 ?auto_63731 ) ) ( not ( = ?auto_63729 ?auto_63730 ) ) ( not ( = ?auto_63729 ?auto_63731 ) ) ( not ( = ?auto_63730 ?auto_63731 ) ) ( ON ?auto_63731 ?auto_63732 ) ( not ( = ?auto_63726 ?auto_63732 ) ) ( not ( = ?auto_63727 ?auto_63732 ) ) ( not ( = ?auto_63728 ?auto_63732 ) ) ( not ( = ?auto_63729 ?auto_63732 ) ) ( not ( = ?auto_63730 ?auto_63732 ) ) ( not ( = ?auto_63731 ?auto_63732 ) ) ( ON ?auto_63730 ?auto_63731 ) ( ON-TABLE ?auto_63732 ) ( ON ?auto_63729 ?auto_63730 ) ( CLEAR ?auto_63727 ) ( ON ?auto_63728 ?auto_63729 ) ( CLEAR ?auto_63728 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_63732 ?auto_63731 ?auto_63730 ?auto_63729 )
      ( MAKE-6PILE ?auto_63726 ?auto_63727 ?auto_63728 ?auto_63729 ?auto_63730 ?auto_63731 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_63733 - BLOCK
      ?auto_63734 - BLOCK
      ?auto_63735 - BLOCK
      ?auto_63736 - BLOCK
      ?auto_63737 - BLOCK
      ?auto_63738 - BLOCK
    )
    :vars
    (
      ?auto_63739 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_63733 ) ( not ( = ?auto_63733 ?auto_63734 ) ) ( not ( = ?auto_63733 ?auto_63735 ) ) ( not ( = ?auto_63733 ?auto_63736 ) ) ( not ( = ?auto_63733 ?auto_63737 ) ) ( not ( = ?auto_63733 ?auto_63738 ) ) ( not ( = ?auto_63734 ?auto_63735 ) ) ( not ( = ?auto_63734 ?auto_63736 ) ) ( not ( = ?auto_63734 ?auto_63737 ) ) ( not ( = ?auto_63734 ?auto_63738 ) ) ( not ( = ?auto_63735 ?auto_63736 ) ) ( not ( = ?auto_63735 ?auto_63737 ) ) ( not ( = ?auto_63735 ?auto_63738 ) ) ( not ( = ?auto_63736 ?auto_63737 ) ) ( not ( = ?auto_63736 ?auto_63738 ) ) ( not ( = ?auto_63737 ?auto_63738 ) ) ( ON ?auto_63738 ?auto_63739 ) ( not ( = ?auto_63733 ?auto_63739 ) ) ( not ( = ?auto_63734 ?auto_63739 ) ) ( not ( = ?auto_63735 ?auto_63739 ) ) ( not ( = ?auto_63736 ?auto_63739 ) ) ( not ( = ?auto_63737 ?auto_63739 ) ) ( not ( = ?auto_63738 ?auto_63739 ) ) ( ON ?auto_63737 ?auto_63738 ) ( ON-TABLE ?auto_63739 ) ( ON ?auto_63736 ?auto_63737 ) ( ON ?auto_63735 ?auto_63736 ) ( CLEAR ?auto_63735 ) ( HOLDING ?auto_63734 ) ( CLEAR ?auto_63733 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_63733 ?auto_63734 )
      ( MAKE-6PILE ?auto_63733 ?auto_63734 ?auto_63735 ?auto_63736 ?auto_63737 ?auto_63738 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_63740 - BLOCK
      ?auto_63741 - BLOCK
      ?auto_63742 - BLOCK
      ?auto_63743 - BLOCK
      ?auto_63744 - BLOCK
      ?auto_63745 - BLOCK
    )
    :vars
    (
      ?auto_63746 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_63740 ) ( not ( = ?auto_63740 ?auto_63741 ) ) ( not ( = ?auto_63740 ?auto_63742 ) ) ( not ( = ?auto_63740 ?auto_63743 ) ) ( not ( = ?auto_63740 ?auto_63744 ) ) ( not ( = ?auto_63740 ?auto_63745 ) ) ( not ( = ?auto_63741 ?auto_63742 ) ) ( not ( = ?auto_63741 ?auto_63743 ) ) ( not ( = ?auto_63741 ?auto_63744 ) ) ( not ( = ?auto_63741 ?auto_63745 ) ) ( not ( = ?auto_63742 ?auto_63743 ) ) ( not ( = ?auto_63742 ?auto_63744 ) ) ( not ( = ?auto_63742 ?auto_63745 ) ) ( not ( = ?auto_63743 ?auto_63744 ) ) ( not ( = ?auto_63743 ?auto_63745 ) ) ( not ( = ?auto_63744 ?auto_63745 ) ) ( ON ?auto_63745 ?auto_63746 ) ( not ( = ?auto_63740 ?auto_63746 ) ) ( not ( = ?auto_63741 ?auto_63746 ) ) ( not ( = ?auto_63742 ?auto_63746 ) ) ( not ( = ?auto_63743 ?auto_63746 ) ) ( not ( = ?auto_63744 ?auto_63746 ) ) ( not ( = ?auto_63745 ?auto_63746 ) ) ( ON ?auto_63744 ?auto_63745 ) ( ON-TABLE ?auto_63746 ) ( ON ?auto_63743 ?auto_63744 ) ( ON ?auto_63742 ?auto_63743 ) ( CLEAR ?auto_63740 ) ( ON ?auto_63741 ?auto_63742 ) ( CLEAR ?auto_63741 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_63746 ?auto_63745 ?auto_63744 ?auto_63743 ?auto_63742 )
      ( MAKE-6PILE ?auto_63740 ?auto_63741 ?auto_63742 ?auto_63743 ?auto_63744 ?auto_63745 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_63747 - BLOCK
      ?auto_63748 - BLOCK
      ?auto_63749 - BLOCK
      ?auto_63750 - BLOCK
      ?auto_63751 - BLOCK
      ?auto_63752 - BLOCK
    )
    :vars
    (
      ?auto_63753 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_63747 ?auto_63748 ) ) ( not ( = ?auto_63747 ?auto_63749 ) ) ( not ( = ?auto_63747 ?auto_63750 ) ) ( not ( = ?auto_63747 ?auto_63751 ) ) ( not ( = ?auto_63747 ?auto_63752 ) ) ( not ( = ?auto_63748 ?auto_63749 ) ) ( not ( = ?auto_63748 ?auto_63750 ) ) ( not ( = ?auto_63748 ?auto_63751 ) ) ( not ( = ?auto_63748 ?auto_63752 ) ) ( not ( = ?auto_63749 ?auto_63750 ) ) ( not ( = ?auto_63749 ?auto_63751 ) ) ( not ( = ?auto_63749 ?auto_63752 ) ) ( not ( = ?auto_63750 ?auto_63751 ) ) ( not ( = ?auto_63750 ?auto_63752 ) ) ( not ( = ?auto_63751 ?auto_63752 ) ) ( ON ?auto_63752 ?auto_63753 ) ( not ( = ?auto_63747 ?auto_63753 ) ) ( not ( = ?auto_63748 ?auto_63753 ) ) ( not ( = ?auto_63749 ?auto_63753 ) ) ( not ( = ?auto_63750 ?auto_63753 ) ) ( not ( = ?auto_63751 ?auto_63753 ) ) ( not ( = ?auto_63752 ?auto_63753 ) ) ( ON ?auto_63751 ?auto_63752 ) ( ON-TABLE ?auto_63753 ) ( ON ?auto_63750 ?auto_63751 ) ( ON ?auto_63749 ?auto_63750 ) ( ON ?auto_63748 ?auto_63749 ) ( CLEAR ?auto_63748 ) ( HOLDING ?auto_63747 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_63747 )
      ( MAKE-6PILE ?auto_63747 ?auto_63748 ?auto_63749 ?auto_63750 ?auto_63751 ?auto_63752 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_63754 - BLOCK
      ?auto_63755 - BLOCK
      ?auto_63756 - BLOCK
      ?auto_63757 - BLOCK
      ?auto_63758 - BLOCK
      ?auto_63759 - BLOCK
    )
    :vars
    (
      ?auto_63760 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_63754 ?auto_63755 ) ) ( not ( = ?auto_63754 ?auto_63756 ) ) ( not ( = ?auto_63754 ?auto_63757 ) ) ( not ( = ?auto_63754 ?auto_63758 ) ) ( not ( = ?auto_63754 ?auto_63759 ) ) ( not ( = ?auto_63755 ?auto_63756 ) ) ( not ( = ?auto_63755 ?auto_63757 ) ) ( not ( = ?auto_63755 ?auto_63758 ) ) ( not ( = ?auto_63755 ?auto_63759 ) ) ( not ( = ?auto_63756 ?auto_63757 ) ) ( not ( = ?auto_63756 ?auto_63758 ) ) ( not ( = ?auto_63756 ?auto_63759 ) ) ( not ( = ?auto_63757 ?auto_63758 ) ) ( not ( = ?auto_63757 ?auto_63759 ) ) ( not ( = ?auto_63758 ?auto_63759 ) ) ( ON ?auto_63759 ?auto_63760 ) ( not ( = ?auto_63754 ?auto_63760 ) ) ( not ( = ?auto_63755 ?auto_63760 ) ) ( not ( = ?auto_63756 ?auto_63760 ) ) ( not ( = ?auto_63757 ?auto_63760 ) ) ( not ( = ?auto_63758 ?auto_63760 ) ) ( not ( = ?auto_63759 ?auto_63760 ) ) ( ON ?auto_63758 ?auto_63759 ) ( ON-TABLE ?auto_63760 ) ( ON ?auto_63757 ?auto_63758 ) ( ON ?auto_63756 ?auto_63757 ) ( ON ?auto_63755 ?auto_63756 ) ( ON ?auto_63754 ?auto_63755 ) ( CLEAR ?auto_63754 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_63760 ?auto_63759 ?auto_63758 ?auto_63757 ?auto_63756 ?auto_63755 )
      ( MAKE-6PILE ?auto_63754 ?auto_63755 ?auto_63756 ?auto_63757 ?auto_63758 ?auto_63759 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_63841 - BLOCK
    )
    :vars
    (
      ?auto_63842 - BLOCK
      ?auto_63843 - BLOCK
      ?auto_63844 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63841 ?auto_63842 ) ( CLEAR ?auto_63841 ) ( not ( = ?auto_63841 ?auto_63842 ) ) ( HOLDING ?auto_63843 ) ( CLEAR ?auto_63844 ) ( not ( = ?auto_63841 ?auto_63843 ) ) ( not ( = ?auto_63841 ?auto_63844 ) ) ( not ( = ?auto_63842 ?auto_63843 ) ) ( not ( = ?auto_63842 ?auto_63844 ) ) ( not ( = ?auto_63843 ?auto_63844 ) ) )
    :subtasks
    ( ( !STACK ?auto_63843 ?auto_63844 )
      ( MAKE-1PILE ?auto_63841 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_63845 - BLOCK
    )
    :vars
    (
      ?auto_63847 - BLOCK
      ?auto_63848 - BLOCK
      ?auto_63846 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63845 ?auto_63847 ) ( not ( = ?auto_63845 ?auto_63847 ) ) ( CLEAR ?auto_63848 ) ( not ( = ?auto_63845 ?auto_63846 ) ) ( not ( = ?auto_63845 ?auto_63848 ) ) ( not ( = ?auto_63847 ?auto_63846 ) ) ( not ( = ?auto_63847 ?auto_63848 ) ) ( not ( = ?auto_63846 ?auto_63848 ) ) ( ON ?auto_63846 ?auto_63845 ) ( CLEAR ?auto_63846 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_63847 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_63847 ?auto_63845 )
      ( MAKE-1PILE ?auto_63845 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_63849 - BLOCK
    )
    :vars
    (
      ?auto_63850 - BLOCK
      ?auto_63852 - BLOCK
      ?auto_63851 - BLOCK
      ?auto_63855 - BLOCK
      ?auto_63853 - BLOCK
      ?auto_63854 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63849 ?auto_63850 ) ( not ( = ?auto_63849 ?auto_63850 ) ) ( not ( = ?auto_63849 ?auto_63852 ) ) ( not ( = ?auto_63849 ?auto_63851 ) ) ( not ( = ?auto_63850 ?auto_63852 ) ) ( not ( = ?auto_63850 ?auto_63851 ) ) ( not ( = ?auto_63852 ?auto_63851 ) ) ( ON ?auto_63852 ?auto_63849 ) ( CLEAR ?auto_63852 ) ( ON-TABLE ?auto_63850 ) ( HOLDING ?auto_63851 ) ( CLEAR ?auto_63855 ) ( ON-TABLE ?auto_63853 ) ( ON ?auto_63854 ?auto_63853 ) ( ON ?auto_63855 ?auto_63854 ) ( not ( = ?auto_63853 ?auto_63854 ) ) ( not ( = ?auto_63853 ?auto_63855 ) ) ( not ( = ?auto_63853 ?auto_63851 ) ) ( not ( = ?auto_63854 ?auto_63855 ) ) ( not ( = ?auto_63854 ?auto_63851 ) ) ( not ( = ?auto_63855 ?auto_63851 ) ) ( not ( = ?auto_63849 ?auto_63855 ) ) ( not ( = ?auto_63849 ?auto_63853 ) ) ( not ( = ?auto_63849 ?auto_63854 ) ) ( not ( = ?auto_63850 ?auto_63855 ) ) ( not ( = ?auto_63850 ?auto_63853 ) ) ( not ( = ?auto_63850 ?auto_63854 ) ) ( not ( = ?auto_63852 ?auto_63855 ) ) ( not ( = ?auto_63852 ?auto_63853 ) ) ( not ( = ?auto_63852 ?auto_63854 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_63853 ?auto_63854 ?auto_63855 ?auto_63851 )
      ( MAKE-1PILE ?auto_63849 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_63856 - BLOCK
    )
    :vars
    (
      ?auto_63861 - BLOCK
      ?auto_63857 - BLOCK
      ?auto_63860 - BLOCK
      ?auto_63862 - BLOCK
      ?auto_63858 - BLOCK
      ?auto_63859 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63856 ?auto_63861 ) ( not ( = ?auto_63856 ?auto_63861 ) ) ( not ( = ?auto_63856 ?auto_63857 ) ) ( not ( = ?auto_63856 ?auto_63860 ) ) ( not ( = ?auto_63861 ?auto_63857 ) ) ( not ( = ?auto_63861 ?auto_63860 ) ) ( not ( = ?auto_63857 ?auto_63860 ) ) ( ON ?auto_63857 ?auto_63856 ) ( ON-TABLE ?auto_63861 ) ( CLEAR ?auto_63862 ) ( ON-TABLE ?auto_63858 ) ( ON ?auto_63859 ?auto_63858 ) ( ON ?auto_63862 ?auto_63859 ) ( not ( = ?auto_63858 ?auto_63859 ) ) ( not ( = ?auto_63858 ?auto_63862 ) ) ( not ( = ?auto_63858 ?auto_63860 ) ) ( not ( = ?auto_63859 ?auto_63862 ) ) ( not ( = ?auto_63859 ?auto_63860 ) ) ( not ( = ?auto_63862 ?auto_63860 ) ) ( not ( = ?auto_63856 ?auto_63862 ) ) ( not ( = ?auto_63856 ?auto_63858 ) ) ( not ( = ?auto_63856 ?auto_63859 ) ) ( not ( = ?auto_63861 ?auto_63862 ) ) ( not ( = ?auto_63861 ?auto_63858 ) ) ( not ( = ?auto_63861 ?auto_63859 ) ) ( not ( = ?auto_63857 ?auto_63862 ) ) ( not ( = ?auto_63857 ?auto_63858 ) ) ( not ( = ?auto_63857 ?auto_63859 ) ) ( ON ?auto_63860 ?auto_63857 ) ( CLEAR ?auto_63860 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_63861 ?auto_63856 ?auto_63857 )
      ( MAKE-1PILE ?auto_63856 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_63863 - BLOCK
    )
    :vars
    (
      ?auto_63864 - BLOCK
      ?auto_63869 - BLOCK
      ?auto_63865 - BLOCK
      ?auto_63867 - BLOCK
      ?auto_63866 - BLOCK
      ?auto_63868 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63863 ?auto_63864 ) ( not ( = ?auto_63863 ?auto_63864 ) ) ( not ( = ?auto_63863 ?auto_63869 ) ) ( not ( = ?auto_63863 ?auto_63865 ) ) ( not ( = ?auto_63864 ?auto_63869 ) ) ( not ( = ?auto_63864 ?auto_63865 ) ) ( not ( = ?auto_63869 ?auto_63865 ) ) ( ON ?auto_63869 ?auto_63863 ) ( ON-TABLE ?auto_63864 ) ( ON-TABLE ?auto_63867 ) ( ON ?auto_63866 ?auto_63867 ) ( not ( = ?auto_63867 ?auto_63866 ) ) ( not ( = ?auto_63867 ?auto_63868 ) ) ( not ( = ?auto_63867 ?auto_63865 ) ) ( not ( = ?auto_63866 ?auto_63868 ) ) ( not ( = ?auto_63866 ?auto_63865 ) ) ( not ( = ?auto_63868 ?auto_63865 ) ) ( not ( = ?auto_63863 ?auto_63868 ) ) ( not ( = ?auto_63863 ?auto_63867 ) ) ( not ( = ?auto_63863 ?auto_63866 ) ) ( not ( = ?auto_63864 ?auto_63868 ) ) ( not ( = ?auto_63864 ?auto_63867 ) ) ( not ( = ?auto_63864 ?auto_63866 ) ) ( not ( = ?auto_63869 ?auto_63868 ) ) ( not ( = ?auto_63869 ?auto_63867 ) ) ( not ( = ?auto_63869 ?auto_63866 ) ) ( ON ?auto_63865 ?auto_63869 ) ( CLEAR ?auto_63865 ) ( HOLDING ?auto_63868 ) ( CLEAR ?auto_63866 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_63867 ?auto_63866 ?auto_63868 )
      ( MAKE-1PILE ?auto_63863 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_63870 - BLOCK
    )
    :vars
    (
      ?auto_63873 - BLOCK
      ?auto_63871 - BLOCK
      ?auto_63874 - BLOCK
      ?auto_63875 - BLOCK
      ?auto_63872 - BLOCK
      ?auto_63876 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63870 ?auto_63873 ) ( not ( = ?auto_63870 ?auto_63873 ) ) ( not ( = ?auto_63870 ?auto_63871 ) ) ( not ( = ?auto_63870 ?auto_63874 ) ) ( not ( = ?auto_63873 ?auto_63871 ) ) ( not ( = ?auto_63873 ?auto_63874 ) ) ( not ( = ?auto_63871 ?auto_63874 ) ) ( ON ?auto_63871 ?auto_63870 ) ( ON-TABLE ?auto_63873 ) ( ON-TABLE ?auto_63875 ) ( ON ?auto_63872 ?auto_63875 ) ( not ( = ?auto_63875 ?auto_63872 ) ) ( not ( = ?auto_63875 ?auto_63876 ) ) ( not ( = ?auto_63875 ?auto_63874 ) ) ( not ( = ?auto_63872 ?auto_63876 ) ) ( not ( = ?auto_63872 ?auto_63874 ) ) ( not ( = ?auto_63876 ?auto_63874 ) ) ( not ( = ?auto_63870 ?auto_63876 ) ) ( not ( = ?auto_63870 ?auto_63875 ) ) ( not ( = ?auto_63870 ?auto_63872 ) ) ( not ( = ?auto_63873 ?auto_63876 ) ) ( not ( = ?auto_63873 ?auto_63875 ) ) ( not ( = ?auto_63873 ?auto_63872 ) ) ( not ( = ?auto_63871 ?auto_63876 ) ) ( not ( = ?auto_63871 ?auto_63875 ) ) ( not ( = ?auto_63871 ?auto_63872 ) ) ( ON ?auto_63874 ?auto_63871 ) ( CLEAR ?auto_63872 ) ( ON ?auto_63876 ?auto_63874 ) ( CLEAR ?auto_63876 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_63873 ?auto_63870 ?auto_63871 ?auto_63874 )
      ( MAKE-1PILE ?auto_63870 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_63877 - BLOCK
    )
    :vars
    (
      ?auto_63881 - BLOCK
      ?auto_63878 - BLOCK
      ?auto_63879 - BLOCK
      ?auto_63880 - BLOCK
      ?auto_63883 - BLOCK
      ?auto_63882 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63877 ?auto_63881 ) ( not ( = ?auto_63877 ?auto_63881 ) ) ( not ( = ?auto_63877 ?auto_63878 ) ) ( not ( = ?auto_63877 ?auto_63879 ) ) ( not ( = ?auto_63881 ?auto_63878 ) ) ( not ( = ?auto_63881 ?auto_63879 ) ) ( not ( = ?auto_63878 ?auto_63879 ) ) ( ON ?auto_63878 ?auto_63877 ) ( ON-TABLE ?auto_63881 ) ( ON-TABLE ?auto_63880 ) ( not ( = ?auto_63880 ?auto_63883 ) ) ( not ( = ?auto_63880 ?auto_63882 ) ) ( not ( = ?auto_63880 ?auto_63879 ) ) ( not ( = ?auto_63883 ?auto_63882 ) ) ( not ( = ?auto_63883 ?auto_63879 ) ) ( not ( = ?auto_63882 ?auto_63879 ) ) ( not ( = ?auto_63877 ?auto_63882 ) ) ( not ( = ?auto_63877 ?auto_63880 ) ) ( not ( = ?auto_63877 ?auto_63883 ) ) ( not ( = ?auto_63881 ?auto_63882 ) ) ( not ( = ?auto_63881 ?auto_63880 ) ) ( not ( = ?auto_63881 ?auto_63883 ) ) ( not ( = ?auto_63878 ?auto_63882 ) ) ( not ( = ?auto_63878 ?auto_63880 ) ) ( not ( = ?auto_63878 ?auto_63883 ) ) ( ON ?auto_63879 ?auto_63878 ) ( ON ?auto_63882 ?auto_63879 ) ( CLEAR ?auto_63882 ) ( HOLDING ?auto_63883 ) ( CLEAR ?auto_63880 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_63880 ?auto_63883 )
      ( MAKE-1PILE ?auto_63877 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_63884 - BLOCK
    )
    :vars
    (
      ?auto_63889 - BLOCK
      ?auto_63887 - BLOCK
      ?auto_63890 - BLOCK
      ?auto_63888 - BLOCK
      ?auto_63886 - BLOCK
      ?auto_63885 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63884 ?auto_63889 ) ( not ( = ?auto_63884 ?auto_63889 ) ) ( not ( = ?auto_63884 ?auto_63887 ) ) ( not ( = ?auto_63884 ?auto_63890 ) ) ( not ( = ?auto_63889 ?auto_63887 ) ) ( not ( = ?auto_63889 ?auto_63890 ) ) ( not ( = ?auto_63887 ?auto_63890 ) ) ( ON ?auto_63887 ?auto_63884 ) ( ON-TABLE ?auto_63889 ) ( ON-TABLE ?auto_63888 ) ( not ( = ?auto_63888 ?auto_63886 ) ) ( not ( = ?auto_63888 ?auto_63885 ) ) ( not ( = ?auto_63888 ?auto_63890 ) ) ( not ( = ?auto_63886 ?auto_63885 ) ) ( not ( = ?auto_63886 ?auto_63890 ) ) ( not ( = ?auto_63885 ?auto_63890 ) ) ( not ( = ?auto_63884 ?auto_63885 ) ) ( not ( = ?auto_63884 ?auto_63888 ) ) ( not ( = ?auto_63884 ?auto_63886 ) ) ( not ( = ?auto_63889 ?auto_63885 ) ) ( not ( = ?auto_63889 ?auto_63888 ) ) ( not ( = ?auto_63889 ?auto_63886 ) ) ( not ( = ?auto_63887 ?auto_63885 ) ) ( not ( = ?auto_63887 ?auto_63888 ) ) ( not ( = ?auto_63887 ?auto_63886 ) ) ( ON ?auto_63890 ?auto_63887 ) ( ON ?auto_63885 ?auto_63890 ) ( CLEAR ?auto_63888 ) ( ON ?auto_63886 ?auto_63885 ) ( CLEAR ?auto_63886 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_63889 ?auto_63884 ?auto_63887 ?auto_63890 ?auto_63885 )
      ( MAKE-1PILE ?auto_63884 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_63891 - BLOCK
    )
    :vars
    (
      ?auto_63894 - BLOCK
      ?auto_63893 - BLOCK
      ?auto_63896 - BLOCK
      ?auto_63895 - BLOCK
      ?auto_63892 - BLOCK
      ?auto_63897 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63891 ?auto_63894 ) ( not ( = ?auto_63891 ?auto_63894 ) ) ( not ( = ?auto_63891 ?auto_63893 ) ) ( not ( = ?auto_63891 ?auto_63896 ) ) ( not ( = ?auto_63894 ?auto_63893 ) ) ( not ( = ?auto_63894 ?auto_63896 ) ) ( not ( = ?auto_63893 ?auto_63896 ) ) ( ON ?auto_63893 ?auto_63891 ) ( ON-TABLE ?auto_63894 ) ( not ( = ?auto_63895 ?auto_63892 ) ) ( not ( = ?auto_63895 ?auto_63897 ) ) ( not ( = ?auto_63895 ?auto_63896 ) ) ( not ( = ?auto_63892 ?auto_63897 ) ) ( not ( = ?auto_63892 ?auto_63896 ) ) ( not ( = ?auto_63897 ?auto_63896 ) ) ( not ( = ?auto_63891 ?auto_63897 ) ) ( not ( = ?auto_63891 ?auto_63895 ) ) ( not ( = ?auto_63891 ?auto_63892 ) ) ( not ( = ?auto_63894 ?auto_63897 ) ) ( not ( = ?auto_63894 ?auto_63895 ) ) ( not ( = ?auto_63894 ?auto_63892 ) ) ( not ( = ?auto_63893 ?auto_63897 ) ) ( not ( = ?auto_63893 ?auto_63895 ) ) ( not ( = ?auto_63893 ?auto_63892 ) ) ( ON ?auto_63896 ?auto_63893 ) ( ON ?auto_63897 ?auto_63896 ) ( ON ?auto_63892 ?auto_63897 ) ( CLEAR ?auto_63892 ) ( HOLDING ?auto_63895 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_63895 )
      ( MAKE-1PILE ?auto_63891 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_63898 - BLOCK
    )
    :vars
    (
      ?auto_63901 - BLOCK
      ?auto_63899 - BLOCK
      ?auto_63903 - BLOCK
      ?auto_63900 - BLOCK
      ?auto_63904 - BLOCK
      ?auto_63902 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63898 ?auto_63901 ) ( not ( = ?auto_63898 ?auto_63901 ) ) ( not ( = ?auto_63898 ?auto_63899 ) ) ( not ( = ?auto_63898 ?auto_63903 ) ) ( not ( = ?auto_63901 ?auto_63899 ) ) ( not ( = ?auto_63901 ?auto_63903 ) ) ( not ( = ?auto_63899 ?auto_63903 ) ) ( ON ?auto_63899 ?auto_63898 ) ( ON-TABLE ?auto_63901 ) ( not ( = ?auto_63900 ?auto_63904 ) ) ( not ( = ?auto_63900 ?auto_63902 ) ) ( not ( = ?auto_63900 ?auto_63903 ) ) ( not ( = ?auto_63904 ?auto_63902 ) ) ( not ( = ?auto_63904 ?auto_63903 ) ) ( not ( = ?auto_63902 ?auto_63903 ) ) ( not ( = ?auto_63898 ?auto_63902 ) ) ( not ( = ?auto_63898 ?auto_63900 ) ) ( not ( = ?auto_63898 ?auto_63904 ) ) ( not ( = ?auto_63901 ?auto_63902 ) ) ( not ( = ?auto_63901 ?auto_63900 ) ) ( not ( = ?auto_63901 ?auto_63904 ) ) ( not ( = ?auto_63899 ?auto_63902 ) ) ( not ( = ?auto_63899 ?auto_63900 ) ) ( not ( = ?auto_63899 ?auto_63904 ) ) ( ON ?auto_63903 ?auto_63899 ) ( ON ?auto_63902 ?auto_63903 ) ( ON ?auto_63904 ?auto_63902 ) ( ON ?auto_63900 ?auto_63904 ) ( CLEAR ?auto_63900 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_63901 ?auto_63898 ?auto_63899 ?auto_63903 ?auto_63902 ?auto_63904 )
      ( MAKE-1PILE ?auto_63898 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_63914 - BLOCK
      ?auto_63915 - BLOCK
      ?auto_63916 - BLOCK
      ?auto_63917 - BLOCK
    )
    :vars
    (
      ?auto_63918 - BLOCK
      ?auto_63919 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_63918 ?auto_63917 ) ( CLEAR ?auto_63918 ) ( ON-TABLE ?auto_63914 ) ( ON ?auto_63915 ?auto_63914 ) ( ON ?auto_63916 ?auto_63915 ) ( ON ?auto_63917 ?auto_63916 ) ( not ( = ?auto_63914 ?auto_63915 ) ) ( not ( = ?auto_63914 ?auto_63916 ) ) ( not ( = ?auto_63914 ?auto_63917 ) ) ( not ( = ?auto_63914 ?auto_63918 ) ) ( not ( = ?auto_63915 ?auto_63916 ) ) ( not ( = ?auto_63915 ?auto_63917 ) ) ( not ( = ?auto_63915 ?auto_63918 ) ) ( not ( = ?auto_63916 ?auto_63917 ) ) ( not ( = ?auto_63916 ?auto_63918 ) ) ( not ( = ?auto_63917 ?auto_63918 ) ) ( HOLDING ?auto_63919 ) ( not ( = ?auto_63914 ?auto_63919 ) ) ( not ( = ?auto_63915 ?auto_63919 ) ) ( not ( = ?auto_63916 ?auto_63919 ) ) ( not ( = ?auto_63917 ?auto_63919 ) ) ( not ( = ?auto_63918 ?auto_63919 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_63919 )
      ( MAKE-4PILE ?auto_63914 ?auto_63915 ?auto_63916 ?auto_63917 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_63987 - BLOCK
      ?auto_63988 - BLOCK
    )
    :vars
    (
      ?auto_63989 - BLOCK
      ?auto_63991 - BLOCK
      ?auto_63990 - BLOCK
      ?auto_63992 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_63987 ?auto_63988 ) ) ( ON ?auto_63988 ?auto_63989 ) ( not ( = ?auto_63987 ?auto_63989 ) ) ( not ( = ?auto_63988 ?auto_63989 ) ) ( ON ?auto_63987 ?auto_63988 ) ( CLEAR ?auto_63987 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_63991 ) ( ON ?auto_63990 ?auto_63991 ) ( ON ?auto_63992 ?auto_63990 ) ( ON ?auto_63989 ?auto_63992 ) ( not ( = ?auto_63991 ?auto_63990 ) ) ( not ( = ?auto_63991 ?auto_63992 ) ) ( not ( = ?auto_63991 ?auto_63989 ) ) ( not ( = ?auto_63991 ?auto_63988 ) ) ( not ( = ?auto_63991 ?auto_63987 ) ) ( not ( = ?auto_63990 ?auto_63992 ) ) ( not ( = ?auto_63990 ?auto_63989 ) ) ( not ( = ?auto_63990 ?auto_63988 ) ) ( not ( = ?auto_63990 ?auto_63987 ) ) ( not ( = ?auto_63992 ?auto_63989 ) ) ( not ( = ?auto_63992 ?auto_63988 ) ) ( not ( = ?auto_63992 ?auto_63987 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_63991 ?auto_63990 ?auto_63992 ?auto_63989 ?auto_63988 )
      ( MAKE-2PILE ?auto_63987 ?auto_63988 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_63995 - BLOCK
      ?auto_63996 - BLOCK
    )
    :vars
    (
      ?auto_63997 - BLOCK
      ?auto_63998 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_63995 ?auto_63996 ) ) ( ON ?auto_63996 ?auto_63997 ) ( CLEAR ?auto_63996 ) ( not ( = ?auto_63995 ?auto_63997 ) ) ( not ( = ?auto_63996 ?auto_63997 ) ) ( ON ?auto_63995 ?auto_63998 ) ( CLEAR ?auto_63995 ) ( HAND-EMPTY ) ( not ( = ?auto_63995 ?auto_63998 ) ) ( not ( = ?auto_63996 ?auto_63998 ) ) ( not ( = ?auto_63997 ?auto_63998 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_63995 ?auto_63998 )
      ( MAKE-2PILE ?auto_63995 ?auto_63996 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_63999 - BLOCK
      ?auto_64000 - BLOCK
    )
    :vars
    (
      ?auto_64002 - BLOCK
      ?auto_64001 - BLOCK
      ?auto_64004 - BLOCK
      ?auto_64003 - BLOCK
      ?auto_64005 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_63999 ?auto_64000 ) ) ( not ( = ?auto_63999 ?auto_64002 ) ) ( not ( = ?auto_64000 ?auto_64002 ) ) ( ON ?auto_63999 ?auto_64001 ) ( CLEAR ?auto_63999 ) ( not ( = ?auto_63999 ?auto_64001 ) ) ( not ( = ?auto_64000 ?auto_64001 ) ) ( not ( = ?auto_64002 ?auto_64001 ) ) ( HOLDING ?auto_64000 ) ( CLEAR ?auto_64002 ) ( ON-TABLE ?auto_64004 ) ( ON ?auto_64003 ?auto_64004 ) ( ON ?auto_64005 ?auto_64003 ) ( ON ?auto_64002 ?auto_64005 ) ( not ( = ?auto_64004 ?auto_64003 ) ) ( not ( = ?auto_64004 ?auto_64005 ) ) ( not ( = ?auto_64004 ?auto_64002 ) ) ( not ( = ?auto_64004 ?auto_64000 ) ) ( not ( = ?auto_64003 ?auto_64005 ) ) ( not ( = ?auto_64003 ?auto_64002 ) ) ( not ( = ?auto_64003 ?auto_64000 ) ) ( not ( = ?auto_64005 ?auto_64002 ) ) ( not ( = ?auto_64005 ?auto_64000 ) ) ( not ( = ?auto_63999 ?auto_64004 ) ) ( not ( = ?auto_63999 ?auto_64003 ) ) ( not ( = ?auto_63999 ?auto_64005 ) ) ( not ( = ?auto_64001 ?auto_64004 ) ) ( not ( = ?auto_64001 ?auto_64003 ) ) ( not ( = ?auto_64001 ?auto_64005 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_64004 ?auto_64003 ?auto_64005 ?auto_64002 ?auto_64000 )
      ( MAKE-2PILE ?auto_63999 ?auto_64000 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_64006 - BLOCK
      ?auto_64007 - BLOCK
    )
    :vars
    (
      ?auto_64012 - BLOCK
      ?auto_64008 - BLOCK
      ?auto_64010 - BLOCK
      ?auto_64009 - BLOCK
      ?auto_64011 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64006 ?auto_64007 ) ) ( not ( = ?auto_64006 ?auto_64012 ) ) ( not ( = ?auto_64007 ?auto_64012 ) ) ( ON ?auto_64006 ?auto_64008 ) ( not ( = ?auto_64006 ?auto_64008 ) ) ( not ( = ?auto_64007 ?auto_64008 ) ) ( not ( = ?auto_64012 ?auto_64008 ) ) ( CLEAR ?auto_64012 ) ( ON-TABLE ?auto_64010 ) ( ON ?auto_64009 ?auto_64010 ) ( ON ?auto_64011 ?auto_64009 ) ( ON ?auto_64012 ?auto_64011 ) ( not ( = ?auto_64010 ?auto_64009 ) ) ( not ( = ?auto_64010 ?auto_64011 ) ) ( not ( = ?auto_64010 ?auto_64012 ) ) ( not ( = ?auto_64010 ?auto_64007 ) ) ( not ( = ?auto_64009 ?auto_64011 ) ) ( not ( = ?auto_64009 ?auto_64012 ) ) ( not ( = ?auto_64009 ?auto_64007 ) ) ( not ( = ?auto_64011 ?auto_64012 ) ) ( not ( = ?auto_64011 ?auto_64007 ) ) ( not ( = ?auto_64006 ?auto_64010 ) ) ( not ( = ?auto_64006 ?auto_64009 ) ) ( not ( = ?auto_64006 ?auto_64011 ) ) ( not ( = ?auto_64008 ?auto_64010 ) ) ( not ( = ?auto_64008 ?auto_64009 ) ) ( not ( = ?auto_64008 ?auto_64011 ) ) ( ON ?auto_64007 ?auto_64006 ) ( CLEAR ?auto_64007 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_64008 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_64008 ?auto_64006 )
      ( MAKE-2PILE ?auto_64006 ?auto_64007 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_64013 - BLOCK
      ?auto_64014 - BLOCK
    )
    :vars
    (
      ?auto_64016 - BLOCK
      ?auto_64018 - BLOCK
      ?auto_64017 - BLOCK
      ?auto_64019 - BLOCK
      ?auto_64015 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64013 ?auto_64014 ) ) ( not ( = ?auto_64013 ?auto_64016 ) ) ( not ( = ?auto_64014 ?auto_64016 ) ) ( ON ?auto_64013 ?auto_64018 ) ( not ( = ?auto_64013 ?auto_64018 ) ) ( not ( = ?auto_64014 ?auto_64018 ) ) ( not ( = ?auto_64016 ?auto_64018 ) ) ( ON-TABLE ?auto_64017 ) ( ON ?auto_64019 ?auto_64017 ) ( ON ?auto_64015 ?auto_64019 ) ( not ( = ?auto_64017 ?auto_64019 ) ) ( not ( = ?auto_64017 ?auto_64015 ) ) ( not ( = ?auto_64017 ?auto_64016 ) ) ( not ( = ?auto_64017 ?auto_64014 ) ) ( not ( = ?auto_64019 ?auto_64015 ) ) ( not ( = ?auto_64019 ?auto_64016 ) ) ( not ( = ?auto_64019 ?auto_64014 ) ) ( not ( = ?auto_64015 ?auto_64016 ) ) ( not ( = ?auto_64015 ?auto_64014 ) ) ( not ( = ?auto_64013 ?auto_64017 ) ) ( not ( = ?auto_64013 ?auto_64019 ) ) ( not ( = ?auto_64013 ?auto_64015 ) ) ( not ( = ?auto_64018 ?auto_64017 ) ) ( not ( = ?auto_64018 ?auto_64019 ) ) ( not ( = ?auto_64018 ?auto_64015 ) ) ( ON ?auto_64014 ?auto_64013 ) ( CLEAR ?auto_64014 ) ( ON-TABLE ?auto_64018 ) ( HOLDING ?auto_64016 ) ( CLEAR ?auto_64015 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_64017 ?auto_64019 ?auto_64015 ?auto_64016 )
      ( MAKE-2PILE ?auto_64013 ?auto_64014 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_64020 - BLOCK
      ?auto_64021 - BLOCK
    )
    :vars
    (
      ?auto_64024 - BLOCK
      ?auto_64022 - BLOCK
      ?auto_64026 - BLOCK
      ?auto_64023 - BLOCK
      ?auto_64025 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64020 ?auto_64021 ) ) ( not ( = ?auto_64020 ?auto_64024 ) ) ( not ( = ?auto_64021 ?auto_64024 ) ) ( ON ?auto_64020 ?auto_64022 ) ( not ( = ?auto_64020 ?auto_64022 ) ) ( not ( = ?auto_64021 ?auto_64022 ) ) ( not ( = ?auto_64024 ?auto_64022 ) ) ( ON-TABLE ?auto_64026 ) ( ON ?auto_64023 ?auto_64026 ) ( ON ?auto_64025 ?auto_64023 ) ( not ( = ?auto_64026 ?auto_64023 ) ) ( not ( = ?auto_64026 ?auto_64025 ) ) ( not ( = ?auto_64026 ?auto_64024 ) ) ( not ( = ?auto_64026 ?auto_64021 ) ) ( not ( = ?auto_64023 ?auto_64025 ) ) ( not ( = ?auto_64023 ?auto_64024 ) ) ( not ( = ?auto_64023 ?auto_64021 ) ) ( not ( = ?auto_64025 ?auto_64024 ) ) ( not ( = ?auto_64025 ?auto_64021 ) ) ( not ( = ?auto_64020 ?auto_64026 ) ) ( not ( = ?auto_64020 ?auto_64023 ) ) ( not ( = ?auto_64020 ?auto_64025 ) ) ( not ( = ?auto_64022 ?auto_64026 ) ) ( not ( = ?auto_64022 ?auto_64023 ) ) ( not ( = ?auto_64022 ?auto_64025 ) ) ( ON ?auto_64021 ?auto_64020 ) ( ON-TABLE ?auto_64022 ) ( CLEAR ?auto_64025 ) ( ON ?auto_64024 ?auto_64021 ) ( CLEAR ?auto_64024 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_64022 ?auto_64020 ?auto_64021 )
      ( MAKE-2PILE ?auto_64020 ?auto_64021 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_64027 - BLOCK
      ?auto_64028 - BLOCK
    )
    :vars
    (
      ?auto_64032 - BLOCK
      ?auto_64033 - BLOCK
      ?auto_64031 - BLOCK
      ?auto_64029 - BLOCK
      ?auto_64030 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64027 ?auto_64028 ) ) ( not ( = ?auto_64027 ?auto_64032 ) ) ( not ( = ?auto_64028 ?auto_64032 ) ) ( ON ?auto_64027 ?auto_64033 ) ( not ( = ?auto_64027 ?auto_64033 ) ) ( not ( = ?auto_64028 ?auto_64033 ) ) ( not ( = ?auto_64032 ?auto_64033 ) ) ( ON-TABLE ?auto_64031 ) ( ON ?auto_64029 ?auto_64031 ) ( not ( = ?auto_64031 ?auto_64029 ) ) ( not ( = ?auto_64031 ?auto_64030 ) ) ( not ( = ?auto_64031 ?auto_64032 ) ) ( not ( = ?auto_64031 ?auto_64028 ) ) ( not ( = ?auto_64029 ?auto_64030 ) ) ( not ( = ?auto_64029 ?auto_64032 ) ) ( not ( = ?auto_64029 ?auto_64028 ) ) ( not ( = ?auto_64030 ?auto_64032 ) ) ( not ( = ?auto_64030 ?auto_64028 ) ) ( not ( = ?auto_64027 ?auto_64031 ) ) ( not ( = ?auto_64027 ?auto_64029 ) ) ( not ( = ?auto_64027 ?auto_64030 ) ) ( not ( = ?auto_64033 ?auto_64031 ) ) ( not ( = ?auto_64033 ?auto_64029 ) ) ( not ( = ?auto_64033 ?auto_64030 ) ) ( ON ?auto_64028 ?auto_64027 ) ( ON-TABLE ?auto_64033 ) ( ON ?auto_64032 ?auto_64028 ) ( CLEAR ?auto_64032 ) ( HOLDING ?auto_64030 ) ( CLEAR ?auto_64029 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_64031 ?auto_64029 ?auto_64030 )
      ( MAKE-2PILE ?auto_64027 ?auto_64028 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_64034 - BLOCK
      ?auto_64035 - BLOCK
    )
    :vars
    (
      ?auto_64038 - BLOCK
      ?auto_64036 - BLOCK
      ?auto_64037 - BLOCK
      ?auto_64040 - BLOCK
      ?auto_64039 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64034 ?auto_64035 ) ) ( not ( = ?auto_64034 ?auto_64038 ) ) ( not ( = ?auto_64035 ?auto_64038 ) ) ( ON ?auto_64034 ?auto_64036 ) ( not ( = ?auto_64034 ?auto_64036 ) ) ( not ( = ?auto_64035 ?auto_64036 ) ) ( not ( = ?auto_64038 ?auto_64036 ) ) ( ON-TABLE ?auto_64037 ) ( ON ?auto_64040 ?auto_64037 ) ( not ( = ?auto_64037 ?auto_64040 ) ) ( not ( = ?auto_64037 ?auto_64039 ) ) ( not ( = ?auto_64037 ?auto_64038 ) ) ( not ( = ?auto_64037 ?auto_64035 ) ) ( not ( = ?auto_64040 ?auto_64039 ) ) ( not ( = ?auto_64040 ?auto_64038 ) ) ( not ( = ?auto_64040 ?auto_64035 ) ) ( not ( = ?auto_64039 ?auto_64038 ) ) ( not ( = ?auto_64039 ?auto_64035 ) ) ( not ( = ?auto_64034 ?auto_64037 ) ) ( not ( = ?auto_64034 ?auto_64040 ) ) ( not ( = ?auto_64034 ?auto_64039 ) ) ( not ( = ?auto_64036 ?auto_64037 ) ) ( not ( = ?auto_64036 ?auto_64040 ) ) ( not ( = ?auto_64036 ?auto_64039 ) ) ( ON ?auto_64035 ?auto_64034 ) ( ON-TABLE ?auto_64036 ) ( ON ?auto_64038 ?auto_64035 ) ( CLEAR ?auto_64040 ) ( ON ?auto_64039 ?auto_64038 ) ( CLEAR ?auto_64039 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_64036 ?auto_64034 ?auto_64035 ?auto_64038 )
      ( MAKE-2PILE ?auto_64034 ?auto_64035 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_64041 - BLOCK
      ?auto_64042 - BLOCK
    )
    :vars
    (
      ?auto_64044 - BLOCK
      ?auto_64047 - BLOCK
      ?auto_64046 - BLOCK
      ?auto_64043 - BLOCK
      ?auto_64045 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64041 ?auto_64042 ) ) ( not ( = ?auto_64041 ?auto_64044 ) ) ( not ( = ?auto_64042 ?auto_64044 ) ) ( ON ?auto_64041 ?auto_64047 ) ( not ( = ?auto_64041 ?auto_64047 ) ) ( not ( = ?auto_64042 ?auto_64047 ) ) ( not ( = ?auto_64044 ?auto_64047 ) ) ( ON-TABLE ?auto_64046 ) ( not ( = ?auto_64046 ?auto_64043 ) ) ( not ( = ?auto_64046 ?auto_64045 ) ) ( not ( = ?auto_64046 ?auto_64044 ) ) ( not ( = ?auto_64046 ?auto_64042 ) ) ( not ( = ?auto_64043 ?auto_64045 ) ) ( not ( = ?auto_64043 ?auto_64044 ) ) ( not ( = ?auto_64043 ?auto_64042 ) ) ( not ( = ?auto_64045 ?auto_64044 ) ) ( not ( = ?auto_64045 ?auto_64042 ) ) ( not ( = ?auto_64041 ?auto_64046 ) ) ( not ( = ?auto_64041 ?auto_64043 ) ) ( not ( = ?auto_64041 ?auto_64045 ) ) ( not ( = ?auto_64047 ?auto_64046 ) ) ( not ( = ?auto_64047 ?auto_64043 ) ) ( not ( = ?auto_64047 ?auto_64045 ) ) ( ON ?auto_64042 ?auto_64041 ) ( ON-TABLE ?auto_64047 ) ( ON ?auto_64044 ?auto_64042 ) ( ON ?auto_64045 ?auto_64044 ) ( CLEAR ?auto_64045 ) ( HOLDING ?auto_64043 ) ( CLEAR ?auto_64046 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_64046 ?auto_64043 )
      ( MAKE-2PILE ?auto_64041 ?auto_64042 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_64048 - BLOCK
      ?auto_64049 - BLOCK
    )
    :vars
    (
      ?auto_64051 - BLOCK
      ?auto_64050 - BLOCK
      ?auto_64054 - BLOCK
      ?auto_64053 - BLOCK
      ?auto_64052 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64048 ?auto_64049 ) ) ( not ( = ?auto_64048 ?auto_64051 ) ) ( not ( = ?auto_64049 ?auto_64051 ) ) ( ON ?auto_64048 ?auto_64050 ) ( not ( = ?auto_64048 ?auto_64050 ) ) ( not ( = ?auto_64049 ?auto_64050 ) ) ( not ( = ?auto_64051 ?auto_64050 ) ) ( ON-TABLE ?auto_64054 ) ( not ( = ?auto_64054 ?auto_64053 ) ) ( not ( = ?auto_64054 ?auto_64052 ) ) ( not ( = ?auto_64054 ?auto_64051 ) ) ( not ( = ?auto_64054 ?auto_64049 ) ) ( not ( = ?auto_64053 ?auto_64052 ) ) ( not ( = ?auto_64053 ?auto_64051 ) ) ( not ( = ?auto_64053 ?auto_64049 ) ) ( not ( = ?auto_64052 ?auto_64051 ) ) ( not ( = ?auto_64052 ?auto_64049 ) ) ( not ( = ?auto_64048 ?auto_64054 ) ) ( not ( = ?auto_64048 ?auto_64053 ) ) ( not ( = ?auto_64048 ?auto_64052 ) ) ( not ( = ?auto_64050 ?auto_64054 ) ) ( not ( = ?auto_64050 ?auto_64053 ) ) ( not ( = ?auto_64050 ?auto_64052 ) ) ( ON ?auto_64049 ?auto_64048 ) ( ON-TABLE ?auto_64050 ) ( ON ?auto_64051 ?auto_64049 ) ( ON ?auto_64052 ?auto_64051 ) ( CLEAR ?auto_64054 ) ( ON ?auto_64053 ?auto_64052 ) ( CLEAR ?auto_64053 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_64050 ?auto_64048 ?auto_64049 ?auto_64051 ?auto_64052 )
      ( MAKE-2PILE ?auto_64048 ?auto_64049 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_64055 - BLOCK
      ?auto_64056 - BLOCK
    )
    :vars
    (
      ?auto_64058 - BLOCK
      ?auto_64060 - BLOCK
      ?auto_64059 - BLOCK
      ?auto_64061 - BLOCK
      ?auto_64057 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64055 ?auto_64056 ) ) ( not ( = ?auto_64055 ?auto_64058 ) ) ( not ( = ?auto_64056 ?auto_64058 ) ) ( ON ?auto_64055 ?auto_64060 ) ( not ( = ?auto_64055 ?auto_64060 ) ) ( not ( = ?auto_64056 ?auto_64060 ) ) ( not ( = ?auto_64058 ?auto_64060 ) ) ( not ( = ?auto_64059 ?auto_64061 ) ) ( not ( = ?auto_64059 ?auto_64057 ) ) ( not ( = ?auto_64059 ?auto_64058 ) ) ( not ( = ?auto_64059 ?auto_64056 ) ) ( not ( = ?auto_64061 ?auto_64057 ) ) ( not ( = ?auto_64061 ?auto_64058 ) ) ( not ( = ?auto_64061 ?auto_64056 ) ) ( not ( = ?auto_64057 ?auto_64058 ) ) ( not ( = ?auto_64057 ?auto_64056 ) ) ( not ( = ?auto_64055 ?auto_64059 ) ) ( not ( = ?auto_64055 ?auto_64061 ) ) ( not ( = ?auto_64055 ?auto_64057 ) ) ( not ( = ?auto_64060 ?auto_64059 ) ) ( not ( = ?auto_64060 ?auto_64061 ) ) ( not ( = ?auto_64060 ?auto_64057 ) ) ( ON ?auto_64056 ?auto_64055 ) ( ON-TABLE ?auto_64060 ) ( ON ?auto_64058 ?auto_64056 ) ( ON ?auto_64057 ?auto_64058 ) ( ON ?auto_64061 ?auto_64057 ) ( CLEAR ?auto_64061 ) ( HOLDING ?auto_64059 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_64059 )
      ( MAKE-2PILE ?auto_64055 ?auto_64056 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_64062 - BLOCK
      ?auto_64063 - BLOCK
    )
    :vars
    (
      ?auto_64068 - BLOCK
      ?auto_64065 - BLOCK
      ?auto_64064 - BLOCK
      ?auto_64067 - BLOCK
      ?auto_64066 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64062 ?auto_64063 ) ) ( not ( = ?auto_64062 ?auto_64068 ) ) ( not ( = ?auto_64063 ?auto_64068 ) ) ( ON ?auto_64062 ?auto_64065 ) ( not ( = ?auto_64062 ?auto_64065 ) ) ( not ( = ?auto_64063 ?auto_64065 ) ) ( not ( = ?auto_64068 ?auto_64065 ) ) ( not ( = ?auto_64064 ?auto_64067 ) ) ( not ( = ?auto_64064 ?auto_64066 ) ) ( not ( = ?auto_64064 ?auto_64068 ) ) ( not ( = ?auto_64064 ?auto_64063 ) ) ( not ( = ?auto_64067 ?auto_64066 ) ) ( not ( = ?auto_64067 ?auto_64068 ) ) ( not ( = ?auto_64067 ?auto_64063 ) ) ( not ( = ?auto_64066 ?auto_64068 ) ) ( not ( = ?auto_64066 ?auto_64063 ) ) ( not ( = ?auto_64062 ?auto_64064 ) ) ( not ( = ?auto_64062 ?auto_64067 ) ) ( not ( = ?auto_64062 ?auto_64066 ) ) ( not ( = ?auto_64065 ?auto_64064 ) ) ( not ( = ?auto_64065 ?auto_64067 ) ) ( not ( = ?auto_64065 ?auto_64066 ) ) ( ON ?auto_64063 ?auto_64062 ) ( ON-TABLE ?auto_64065 ) ( ON ?auto_64068 ?auto_64063 ) ( ON ?auto_64066 ?auto_64068 ) ( ON ?auto_64067 ?auto_64066 ) ( ON ?auto_64064 ?auto_64067 ) ( CLEAR ?auto_64064 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_64065 ?auto_64062 ?auto_64063 ?auto_64068 ?auto_64066 ?auto_64067 )
      ( MAKE-2PILE ?auto_64062 ?auto_64063 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_64088 - BLOCK
      ?auto_64089 - BLOCK
      ?auto_64090 - BLOCK
    )
    :vars
    (
      ?auto_64092 - BLOCK
      ?auto_64091 - BLOCK
      ?auto_64093 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64092 ?auto_64090 ) ( ON-TABLE ?auto_64088 ) ( ON ?auto_64089 ?auto_64088 ) ( ON ?auto_64090 ?auto_64089 ) ( not ( = ?auto_64088 ?auto_64089 ) ) ( not ( = ?auto_64088 ?auto_64090 ) ) ( not ( = ?auto_64088 ?auto_64092 ) ) ( not ( = ?auto_64089 ?auto_64090 ) ) ( not ( = ?auto_64089 ?auto_64092 ) ) ( not ( = ?auto_64090 ?auto_64092 ) ) ( not ( = ?auto_64088 ?auto_64091 ) ) ( not ( = ?auto_64088 ?auto_64093 ) ) ( not ( = ?auto_64089 ?auto_64091 ) ) ( not ( = ?auto_64089 ?auto_64093 ) ) ( not ( = ?auto_64090 ?auto_64091 ) ) ( not ( = ?auto_64090 ?auto_64093 ) ) ( not ( = ?auto_64092 ?auto_64091 ) ) ( not ( = ?auto_64092 ?auto_64093 ) ) ( not ( = ?auto_64091 ?auto_64093 ) ) ( ON ?auto_64091 ?auto_64092 ) ( CLEAR ?auto_64091 ) ( HOLDING ?auto_64093 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_64093 )
      ( MAKE-3PILE ?auto_64088 ?auto_64089 ?auto_64090 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_64153 - BLOCK
      ?auto_64154 - BLOCK
      ?auto_64155 - BLOCK
    )
    :vars
    (
      ?auto_64156 - BLOCK
      ?auto_64157 - BLOCK
      ?auto_64158 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_64153 ) ( not ( = ?auto_64153 ?auto_64154 ) ) ( not ( = ?auto_64153 ?auto_64155 ) ) ( not ( = ?auto_64154 ?auto_64155 ) ) ( ON ?auto_64155 ?auto_64156 ) ( not ( = ?auto_64153 ?auto_64156 ) ) ( not ( = ?auto_64154 ?auto_64156 ) ) ( not ( = ?auto_64155 ?auto_64156 ) ) ( CLEAR ?auto_64153 ) ( ON ?auto_64154 ?auto_64155 ) ( CLEAR ?auto_64154 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_64157 ) ( ON ?auto_64158 ?auto_64157 ) ( ON ?auto_64156 ?auto_64158 ) ( not ( = ?auto_64157 ?auto_64158 ) ) ( not ( = ?auto_64157 ?auto_64156 ) ) ( not ( = ?auto_64157 ?auto_64155 ) ) ( not ( = ?auto_64157 ?auto_64154 ) ) ( not ( = ?auto_64158 ?auto_64156 ) ) ( not ( = ?auto_64158 ?auto_64155 ) ) ( not ( = ?auto_64158 ?auto_64154 ) ) ( not ( = ?auto_64153 ?auto_64157 ) ) ( not ( = ?auto_64153 ?auto_64158 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_64157 ?auto_64158 ?auto_64156 ?auto_64155 )
      ( MAKE-3PILE ?auto_64153 ?auto_64154 ?auto_64155 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_64159 - BLOCK
      ?auto_64160 - BLOCK
      ?auto_64161 - BLOCK
    )
    :vars
    (
      ?auto_64164 - BLOCK
      ?auto_64162 - BLOCK
      ?auto_64163 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64159 ?auto_64160 ) ) ( not ( = ?auto_64159 ?auto_64161 ) ) ( not ( = ?auto_64160 ?auto_64161 ) ) ( ON ?auto_64161 ?auto_64164 ) ( not ( = ?auto_64159 ?auto_64164 ) ) ( not ( = ?auto_64160 ?auto_64164 ) ) ( not ( = ?auto_64161 ?auto_64164 ) ) ( ON ?auto_64160 ?auto_64161 ) ( CLEAR ?auto_64160 ) ( ON-TABLE ?auto_64162 ) ( ON ?auto_64163 ?auto_64162 ) ( ON ?auto_64164 ?auto_64163 ) ( not ( = ?auto_64162 ?auto_64163 ) ) ( not ( = ?auto_64162 ?auto_64164 ) ) ( not ( = ?auto_64162 ?auto_64161 ) ) ( not ( = ?auto_64162 ?auto_64160 ) ) ( not ( = ?auto_64163 ?auto_64164 ) ) ( not ( = ?auto_64163 ?auto_64161 ) ) ( not ( = ?auto_64163 ?auto_64160 ) ) ( not ( = ?auto_64159 ?auto_64162 ) ) ( not ( = ?auto_64159 ?auto_64163 ) ) ( HOLDING ?auto_64159 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_64159 )
      ( MAKE-3PILE ?auto_64159 ?auto_64160 ?auto_64161 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_64165 - BLOCK
      ?auto_64166 - BLOCK
      ?auto_64167 - BLOCK
    )
    :vars
    (
      ?auto_64170 - BLOCK
      ?auto_64168 - BLOCK
      ?auto_64169 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64165 ?auto_64166 ) ) ( not ( = ?auto_64165 ?auto_64167 ) ) ( not ( = ?auto_64166 ?auto_64167 ) ) ( ON ?auto_64167 ?auto_64170 ) ( not ( = ?auto_64165 ?auto_64170 ) ) ( not ( = ?auto_64166 ?auto_64170 ) ) ( not ( = ?auto_64167 ?auto_64170 ) ) ( ON ?auto_64166 ?auto_64167 ) ( ON-TABLE ?auto_64168 ) ( ON ?auto_64169 ?auto_64168 ) ( ON ?auto_64170 ?auto_64169 ) ( not ( = ?auto_64168 ?auto_64169 ) ) ( not ( = ?auto_64168 ?auto_64170 ) ) ( not ( = ?auto_64168 ?auto_64167 ) ) ( not ( = ?auto_64168 ?auto_64166 ) ) ( not ( = ?auto_64169 ?auto_64170 ) ) ( not ( = ?auto_64169 ?auto_64167 ) ) ( not ( = ?auto_64169 ?auto_64166 ) ) ( not ( = ?auto_64165 ?auto_64168 ) ) ( not ( = ?auto_64165 ?auto_64169 ) ) ( ON ?auto_64165 ?auto_64166 ) ( CLEAR ?auto_64165 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_64168 ?auto_64169 ?auto_64170 ?auto_64167 ?auto_64166 )
      ( MAKE-3PILE ?auto_64165 ?auto_64166 ?auto_64167 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_64174 - BLOCK
      ?auto_64175 - BLOCK
      ?auto_64176 - BLOCK
    )
    :vars
    (
      ?auto_64179 - BLOCK
      ?auto_64177 - BLOCK
      ?auto_64178 - BLOCK
      ?auto_64180 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64174 ?auto_64175 ) ) ( not ( = ?auto_64174 ?auto_64176 ) ) ( not ( = ?auto_64175 ?auto_64176 ) ) ( ON ?auto_64176 ?auto_64179 ) ( not ( = ?auto_64174 ?auto_64179 ) ) ( not ( = ?auto_64175 ?auto_64179 ) ) ( not ( = ?auto_64176 ?auto_64179 ) ) ( ON ?auto_64175 ?auto_64176 ) ( CLEAR ?auto_64175 ) ( ON-TABLE ?auto_64177 ) ( ON ?auto_64178 ?auto_64177 ) ( ON ?auto_64179 ?auto_64178 ) ( not ( = ?auto_64177 ?auto_64178 ) ) ( not ( = ?auto_64177 ?auto_64179 ) ) ( not ( = ?auto_64177 ?auto_64176 ) ) ( not ( = ?auto_64177 ?auto_64175 ) ) ( not ( = ?auto_64178 ?auto_64179 ) ) ( not ( = ?auto_64178 ?auto_64176 ) ) ( not ( = ?auto_64178 ?auto_64175 ) ) ( not ( = ?auto_64174 ?auto_64177 ) ) ( not ( = ?auto_64174 ?auto_64178 ) ) ( ON ?auto_64174 ?auto_64180 ) ( CLEAR ?auto_64174 ) ( HAND-EMPTY ) ( not ( = ?auto_64174 ?auto_64180 ) ) ( not ( = ?auto_64175 ?auto_64180 ) ) ( not ( = ?auto_64176 ?auto_64180 ) ) ( not ( = ?auto_64179 ?auto_64180 ) ) ( not ( = ?auto_64177 ?auto_64180 ) ) ( not ( = ?auto_64178 ?auto_64180 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_64174 ?auto_64180 )
      ( MAKE-3PILE ?auto_64174 ?auto_64175 ?auto_64176 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_64181 - BLOCK
      ?auto_64182 - BLOCK
      ?auto_64183 - BLOCK
    )
    :vars
    (
      ?auto_64187 - BLOCK
      ?auto_64186 - BLOCK
      ?auto_64184 - BLOCK
      ?auto_64185 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64181 ?auto_64182 ) ) ( not ( = ?auto_64181 ?auto_64183 ) ) ( not ( = ?auto_64182 ?auto_64183 ) ) ( ON ?auto_64183 ?auto_64187 ) ( not ( = ?auto_64181 ?auto_64187 ) ) ( not ( = ?auto_64182 ?auto_64187 ) ) ( not ( = ?auto_64183 ?auto_64187 ) ) ( ON-TABLE ?auto_64186 ) ( ON ?auto_64184 ?auto_64186 ) ( ON ?auto_64187 ?auto_64184 ) ( not ( = ?auto_64186 ?auto_64184 ) ) ( not ( = ?auto_64186 ?auto_64187 ) ) ( not ( = ?auto_64186 ?auto_64183 ) ) ( not ( = ?auto_64186 ?auto_64182 ) ) ( not ( = ?auto_64184 ?auto_64187 ) ) ( not ( = ?auto_64184 ?auto_64183 ) ) ( not ( = ?auto_64184 ?auto_64182 ) ) ( not ( = ?auto_64181 ?auto_64186 ) ) ( not ( = ?auto_64181 ?auto_64184 ) ) ( ON ?auto_64181 ?auto_64185 ) ( CLEAR ?auto_64181 ) ( not ( = ?auto_64181 ?auto_64185 ) ) ( not ( = ?auto_64182 ?auto_64185 ) ) ( not ( = ?auto_64183 ?auto_64185 ) ) ( not ( = ?auto_64187 ?auto_64185 ) ) ( not ( = ?auto_64186 ?auto_64185 ) ) ( not ( = ?auto_64184 ?auto_64185 ) ) ( HOLDING ?auto_64182 ) ( CLEAR ?auto_64183 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_64186 ?auto_64184 ?auto_64187 ?auto_64183 ?auto_64182 )
      ( MAKE-3PILE ?auto_64181 ?auto_64182 ?auto_64183 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_64188 - BLOCK
      ?auto_64189 - BLOCK
      ?auto_64190 - BLOCK
    )
    :vars
    (
      ?auto_64191 - BLOCK
      ?auto_64193 - BLOCK
      ?auto_64192 - BLOCK
      ?auto_64194 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64188 ?auto_64189 ) ) ( not ( = ?auto_64188 ?auto_64190 ) ) ( not ( = ?auto_64189 ?auto_64190 ) ) ( ON ?auto_64190 ?auto_64191 ) ( not ( = ?auto_64188 ?auto_64191 ) ) ( not ( = ?auto_64189 ?auto_64191 ) ) ( not ( = ?auto_64190 ?auto_64191 ) ) ( ON-TABLE ?auto_64193 ) ( ON ?auto_64192 ?auto_64193 ) ( ON ?auto_64191 ?auto_64192 ) ( not ( = ?auto_64193 ?auto_64192 ) ) ( not ( = ?auto_64193 ?auto_64191 ) ) ( not ( = ?auto_64193 ?auto_64190 ) ) ( not ( = ?auto_64193 ?auto_64189 ) ) ( not ( = ?auto_64192 ?auto_64191 ) ) ( not ( = ?auto_64192 ?auto_64190 ) ) ( not ( = ?auto_64192 ?auto_64189 ) ) ( not ( = ?auto_64188 ?auto_64193 ) ) ( not ( = ?auto_64188 ?auto_64192 ) ) ( ON ?auto_64188 ?auto_64194 ) ( not ( = ?auto_64188 ?auto_64194 ) ) ( not ( = ?auto_64189 ?auto_64194 ) ) ( not ( = ?auto_64190 ?auto_64194 ) ) ( not ( = ?auto_64191 ?auto_64194 ) ) ( not ( = ?auto_64193 ?auto_64194 ) ) ( not ( = ?auto_64192 ?auto_64194 ) ) ( CLEAR ?auto_64190 ) ( ON ?auto_64189 ?auto_64188 ) ( CLEAR ?auto_64189 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_64194 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_64194 ?auto_64188 )
      ( MAKE-3PILE ?auto_64188 ?auto_64189 ?auto_64190 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_64195 - BLOCK
      ?auto_64196 - BLOCK
      ?auto_64197 - BLOCK
    )
    :vars
    (
      ?auto_64198 - BLOCK
      ?auto_64201 - BLOCK
      ?auto_64199 - BLOCK
      ?auto_64200 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64195 ?auto_64196 ) ) ( not ( = ?auto_64195 ?auto_64197 ) ) ( not ( = ?auto_64196 ?auto_64197 ) ) ( not ( = ?auto_64195 ?auto_64198 ) ) ( not ( = ?auto_64196 ?auto_64198 ) ) ( not ( = ?auto_64197 ?auto_64198 ) ) ( ON-TABLE ?auto_64201 ) ( ON ?auto_64199 ?auto_64201 ) ( ON ?auto_64198 ?auto_64199 ) ( not ( = ?auto_64201 ?auto_64199 ) ) ( not ( = ?auto_64201 ?auto_64198 ) ) ( not ( = ?auto_64201 ?auto_64197 ) ) ( not ( = ?auto_64201 ?auto_64196 ) ) ( not ( = ?auto_64199 ?auto_64198 ) ) ( not ( = ?auto_64199 ?auto_64197 ) ) ( not ( = ?auto_64199 ?auto_64196 ) ) ( not ( = ?auto_64195 ?auto_64201 ) ) ( not ( = ?auto_64195 ?auto_64199 ) ) ( ON ?auto_64195 ?auto_64200 ) ( not ( = ?auto_64195 ?auto_64200 ) ) ( not ( = ?auto_64196 ?auto_64200 ) ) ( not ( = ?auto_64197 ?auto_64200 ) ) ( not ( = ?auto_64198 ?auto_64200 ) ) ( not ( = ?auto_64201 ?auto_64200 ) ) ( not ( = ?auto_64199 ?auto_64200 ) ) ( ON ?auto_64196 ?auto_64195 ) ( CLEAR ?auto_64196 ) ( ON-TABLE ?auto_64200 ) ( HOLDING ?auto_64197 ) ( CLEAR ?auto_64198 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_64201 ?auto_64199 ?auto_64198 ?auto_64197 )
      ( MAKE-3PILE ?auto_64195 ?auto_64196 ?auto_64197 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_64202 - BLOCK
      ?auto_64203 - BLOCK
      ?auto_64204 - BLOCK
    )
    :vars
    (
      ?auto_64208 - BLOCK
      ?auto_64206 - BLOCK
      ?auto_64207 - BLOCK
      ?auto_64205 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64202 ?auto_64203 ) ) ( not ( = ?auto_64202 ?auto_64204 ) ) ( not ( = ?auto_64203 ?auto_64204 ) ) ( not ( = ?auto_64202 ?auto_64208 ) ) ( not ( = ?auto_64203 ?auto_64208 ) ) ( not ( = ?auto_64204 ?auto_64208 ) ) ( ON-TABLE ?auto_64206 ) ( ON ?auto_64207 ?auto_64206 ) ( ON ?auto_64208 ?auto_64207 ) ( not ( = ?auto_64206 ?auto_64207 ) ) ( not ( = ?auto_64206 ?auto_64208 ) ) ( not ( = ?auto_64206 ?auto_64204 ) ) ( not ( = ?auto_64206 ?auto_64203 ) ) ( not ( = ?auto_64207 ?auto_64208 ) ) ( not ( = ?auto_64207 ?auto_64204 ) ) ( not ( = ?auto_64207 ?auto_64203 ) ) ( not ( = ?auto_64202 ?auto_64206 ) ) ( not ( = ?auto_64202 ?auto_64207 ) ) ( ON ?auto_64202 ?auto_64205 ) ( not ( = ?auto_64202 ?auto_64205 ) ) ( not ( = ?auto_64203 ?auto_64205 ) ) ( not ( = ?auto_64204 ?auto_64205 ) ) ( not ( = ?auto_64208 ?auto_64205 ) ) ( not ( = ?auto_64206 ?auto_64205 ) ) ( not ( = ?auto_64207 ?auto_64205 ) ) ( ON ?auto_64203 ?auto_64202 ) ( ON-TABLE ?auto_64205 ) ( CLEAR ?auto_64208 ) ( ON ?auto_64204 ?auto_64203 ) ( CLEAR ?auto_64204 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_64205 ?auto_64202 ?auto_64203 )
      ( MAKE-3PILE ?auto_64202 ?auto_64203 ?auto_64204 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_64209 - BLOCK
      ?auto_64210 - BLOCK
      ?auto_64211 - BLOCK
    )
    :vars
    (
      ?auto_64215 - BLOCK
      ?auto_64212 - BLOCK
      ?auto_64213 - BLOCK
      ?auto_64214 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64209 ?auto_64210 ) ) ( not ( = ?auto_64209 ?auto_64211 ) ) ( not ( = ?auto_64210 ?auto_64211 ) ) ( not ( = ?auto_64209 ?auto_64215 ) ) ( not ( = ?auto_64210 ?auto_64215 ) ) ( not ( = ?auto_64211 ?auto_64215 ) ) ( ON-TABLE ?auto_64212 ) ( ON ?auto_64213 ?auto_64212 ) ( not ( = ?auto_64212 ?auto_64213 ) ) ( not ( = ?auto_64212 ?auto_64215 ) ) ( not ( = ?auto_64212 ?auto_64211 ) ) ( not ( = ?auto_64212 ?auto_64210 ) ) ( not ( = ?auto_64213 ?auto_64215 ) ) ( not ( = ?auto_64213 ?auto_64211 ) ) ( not ( = ?auto_64213 ?auto_64210 ) ) ( not ( = ?auto_64209 ?auto_64212 ) ) ( not ( = ?auto_64209 ?auto_64213 ) ) ( ON ?auto_64209 ?auto_64214 ) ( not ( = ?auto_64209 ?auto_64214 ) ) ( not ( = ?auto_64210 ?auto_64214 ) ) ( not ( = ?auto_64211 ?auto_64214 ) ) ( not ( = ?auto_64215 ?auto_64214 ) ) ( not ( = ?auto_64212 ?auto_64214 ) ) ( not ( = ?auto_64213 ?auto_64214 ) ) ( ON ?auto_64210 ?auto_64209 ) ( ON-TABLE ?auto_64214 ) ( ON ?auto_64211 ?auto_64210 ) ( CLEAR ?auto_64211 ) ( HOLDING ?auto_64215 ) ( CLEAR ?auto_64213 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_64212 ?auto_64213 ?auto_64215 )
      ( MAKE-3PILE ?auto_64209 ?auto_64210 ?auto_64211 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_64216 - BLOCK
      ?auto_64217 - BLOCK
      ?auto_64218 - BLOCK
    )
    :vars
    (
      ?auto_64221 - BLOCK
      ?auto_64222 - BLOCK
      ?auto_64219 - BLOCK
      ?auto_64220 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64216 ?auto_64217 ) ) ( not ( = ?auto_64216 ?auto_64218 ) ) ( not ( = ?auto_64217 ?auto_64218 ) ) ( not ( = ?auto_64216 ?auto_64221 ) ) ( not ( = ?auto_64217 ?auto_64221 ) ) ( not ( = ?auto_64218 ?auto_64221 ) ) ( ON-TABLE ?auto_64222 ) ( ON ?auto_64219 ?auto_64222 ) ( not ( = ?auto_64222 ?auto_64219 ) ) ( not ( = ?auto_64222 ?auto_64221 ) ) ( not ( = ?auto_64222 ?auto_64218 ) ) ( not ( = ?auto_64222 ?auto_64217 ) ) ( not ( = ?auto_64219 ?auto_64221 ) ) ( not ( = ?auto_64219 ?auto_64218 ) ) ( not ( = ?auto_64219 ?auto_64217 ) ) ( not ( = ?auto_64216 ?auto_64222 ) ) ( not ( = ?auto_64216 ?auto_64219 ) ) ( ON ?auto_64216 ?auto_64220 ) ( not ( = ?auto_64216 ?auto_64220 ) ) ( not ( = ?auto_64217 ?auto_64220 ) ) ( not ( = ?auto_64218 ?auto_64220 ) ) ( not ( = ?auto_64221 ?auto_64220 ) ) ( not ( = ?auto_64222 ?auto_64220 ) ) ( not ( = ?auto_64219 ?auto_64220 ) ) ( ON ?auto_64217 ?auto_64216 ) ( ON-TABLE ?auto_64220 ) ( ON ?auto_64218 ?auto_64217 ) ( CLEAR ?auto_64219 ) ( ON ?auto_64221 ?auto_64218 ) ( CLEAR ?auto_64221 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_64220 ?auto_64216 ?auto_64217 ?auto_64218 )
      ( MAKE-3PILE ?auto_64216 ?auto_64217 ?auto_64218 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_64223 - BLOCK
      ?auto_64224 - BLOCK
      ?auto_64225 - BLOCK
    )
    :vars
    (
      ?auto_64228 - BLOCK
      ?auto_64229 - BLOCK
      ?auto_64227 - BLOCK
      ?auto_64226 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64223 ?auto_64224 ) ) ( not ( = ?auto_64223 ?auto_64225 ) ) ( not ( = ?auto_64224 ?auto_64225 ) ) ( not ( = ?auto_64223 ?auto_64228 ) ) ( not ( = ?auto_64224 ?auto_64228 ) ) ( not ( = ?auto_64225 ?auto_64228 ) ) ( ON-TABLE ?auto_64229 ) ( not ( = ?auto_64229 ?auto_64227 ) ) ( not ( = ?auto_64229 ?auto_64228 ) ) ( not ( = ?auto_64229 ?auto_64225 ) ) ( not ( = ?auto_64229 ?auto_64224 ) ) ( not ( = ?auto_64227 ?auto_64228 ) ) ( not ( = ?auto_64227 ?auto_64225 ) ) ( not ( = ?auto_64227 ?auto_64224 ) ) ( not ( = ?auto_64223 ?auto_64229 ) ) ( not ( = ?auto_64223 ?auto_64227 ) ) ( ON ?auto_64223 ?auto_64226 ) ( not ( = ?auto_64223 ?auto_64226 ) ) ( not ( = ?auto_64224 ?auto_64226 ) ) ( not ( = ?auto_64225 ?auto_64226 ) ) ( not ( = ?auto_64228 ?auto_64226 ) ) ( not ( = ?auto_64229 ?auto_64226 ) ) ( not ( = ?auto_64227 ?auto_64226 ) ) ( ON ?auto_64224 ?auto_64223 ) ( ON-TABLE ?auto_64226 ) ( ON ?auto_64225 ?auto_64224 ) ( ON ?auto_64228 ?auto_64225 ) ( CLEAR ?auto_64228 ) ( HOLDING ?auto_64227 ) ( CLEAR ?auto_64229 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_64229 ?auto_64227 )
      ( MAKE-3PILE ?auto_64223 ?auto_64224 ?auto_64225 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_64230 - BLOCK
      ?auto_64231 - BLOCK
      ?auto_64232 - BLOCK
    )
    :vars
    (
      ?auto_64234 - BLOCK
      ?auto_64236 - BLOCK
      ?auto_64235 - BLOCK
      ?auto_64233 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64230 ?auto_64231 ) ) ( not ( = ?auto_64230 ?auto_64232 ) ) ( not ( = ?auto_64231 ?auto_64232 ) ) ( not ( = ?auto_64230 ?auto_64234 ) ) ( not ( = ?auto_64231 ?auto_64234 ) ) ( not ( = ?auto_64232 ?auto_64234 ) ) ( ON-TABLE ?auto_64236 ) ( not ( = ?auto_64236 ?auto_64235 ) ) ( not ( = ?auto_64236 ?auto_64234 ) ) ( not ( = ?auto_64236 ?auto_64232 ) ) ( not ( = ?auto_64236 ?auto_64231 ) ) ( not ( = ?auto_64235 ?auto_64234 ) ) ( not ( = ?auto_64235 ?auto_64232 ) ) ( not ( = ?auto_64235 ?auto_64231 ) ) ( not ( = ?auto_64230 ?auto_64236 ) ) ( not ( = ?auto_64230 ?auto_64235 ) ) ( ON ?auto_64230 ?auto_64233 ) ( not ( = ?auto_64230 ?auto_64233 ) ) ( not ( = ?auto_64231 ?auto_64233 ) ) ( not ( = ?auto_64232 ?auto_64233 ) ) ( not ( = ?auto_64234 ?auto_64233 ) ) ( not ( = ?auto_64236 ?auto_64233 ) ) ( not ( = ?auto_64235 ?auto_64233 ) ) ( ON ?auto_64231 ?auto_64230 ) ( ON-TABLE ?auto_64233 ) ( ON ?auto_64232 ?auto_64231 ) ( ON ?auto_64234 ?auto_64232 ) ( CLEAR ?auto_64236 ) ( ON ?auto_64235 ?auto_64234 ) ( CLEAR ?auto_64235 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_64233 ?auto_64230 ?auto_64231 ?auto_64232 ?auto_64234 )
      ( MAKE-3PILE ?auto_64230 ?auto_64231 ?auto_64232 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_64237 - BLOCK
      ?auto_64238 - BLOCK
      ?auto_64239 - BLOCK
    )
    :vars
    (
      ?auto_64240 - BLOCK
      ?auto_64241 - BLOCK
      ?auto_64242 - BLOCK
      ?auto_64243 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64237 ?auto_64238 ) ) ( not ( = ?auto_64237 ?auto_64239 ) ) ( not ( = ?auto_64238 ?auto_64239 ) ) ( not ( = ?auto_64237 ?auto_64240 ) ) ( not ( = ?auto_64238 ?auto_64240 ) ) ( not ( = ?auto_64239 ?auto_64240 ) ) ( not ( = ?auto_64241 ?auto_64242 ) ) ( not ( = ?auto_64241 ?auto_64240 ) ) ( not ( = ?auto_64241 ?auto_64239 ) ) ( not ( = ?auto_64241 ?auto_64238 ) ) ( not ( = ?auto_64242 ?auto_64240 ) ) ( not ( = ?auto_64242 ?auto_64239 ) ) ( not ( = ?auto_64242 ?auto_64238 ) ) ( not ( = ?auto_64237 ?auto_64241 ) ) ( not ( = ?auto_64237 ?auto_64242 ) ) ( ON ?auto_64237 ?auto_64243 ) ( not ( = ?auto_64237 ?auto_64243 ) ) ( not ( = ?auto_64238 ?auto_64243 ) ) ( not ( = ?auto_64239 ?auto_64243 ) ) ( not ( = ?auto_64240 ?auto_64243 ) ) ( not ( = ?auto_64241 ?auto_64243 ) ) ( not ( = ?auto_64242 ?auto_64243 ) ) ( ON ?auto_64238 ?auto_64237 ) ( ON-TABLE ?auto_64243 ) ( ON ?auto_64239 ?auto_64238 ) ( ON ?auto_64240 ?auto_64239 ) ( ON ?auto_64242 ?auto_64240 ) ( CLEAR ?auto_64242 ) ( HOLDING ?auto_64241 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_64241 )
      ( MAKE-3PILE ?auto_64237 ?auto_64238 ?auto_64239 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_64244 - BLOCK
      ?auto_64245 - BLOCK
      ?auto_64246 - BLOCK
    )
    :vars
    (
      ?auto_64250 - BLOCK
      ?auto_64247 - BLOCK
      ?auto_64248 - BLOCK
      ?auto_64249 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64244 ?auto_64245 ) ) ( not ( = ?auto_64244 ?auto_64246 ) ) ( not ( = ?auto_64245 ?auto_64246 ) ) ( not ( = ?auto_64244 ?auto_64250 ) ) ( not ( = ?auto_64245 ?auto_64250 ) ) ( not ( = ?auto_64246 ?auto_64250 ) ) ( not ( = ?auto_64247 ?auto_64248 ) ) ( not ( = ?auto_64247 ?auto_64250 ) ) ( not ( = ?auto_64247 ?auto_64246 ) ) ( not ( = ?auto_64247 ?auto_64245 ) ) ( not ( = ?auto_64248 ?auto_64250 ) ) ( not ( = ?auto_64248 ?auto_64246 ) ) ( not ( = ?auto_64248 ?auto_64245 ) ) ( not ( = ?auto_64244 ?auto_64247 ) ) ( not ( = ?auto_64244 ?auto_64248 ) ) ( ON ?auto_64244 ?auto_64249 ) ( not ( = ?auto_64244 ?auto_64249 ) ) ( not ( = ?auto_64245 ?auto_64249 ) ) ( not ( = ?auto_64246 ?auto_64249 ) ) ( not ( = ?auto_64250 ?auto_64249 ) ) ( not ( = ?auto_64247 ?auto_64249 ) ) ( not ( = ?auto_64248 ?auto_64249 ) ) ( ON ?auto_64245 ?auto_64244 ) ( ON-TABLE ?auto_64249 ) ( ON ?auto_64246 ?auto_64245 ) ( ON ?auto_64250 ?auto_64246 ) ( ON ?auto_64248 ?auto_64250 ) ( ON ?auto_64247 ?auto_64248 ) ( CLEAR ?auto_64247 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_64249 ?auto_64244 ?auto_64245 ?auto_64246 ?auto_64250 ?auto_64248 )
      ( MAKE-3PILE ?auto_64244 ?auto_64245 ?auto_64246 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_64266 - BLOCK
      ?auto_64267 - BLOCK
    )
    :vars
    (
      ?auto_64268 - BLOCK
      ?auto_64270 - BLOCK
      ?auto_64269 - BLOCK
      ?auto_64271 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64268 ?auto_64267 ) ( ON-TABLE ?auto_64266 ) ( ON ?auto_64267 ?auto_64266 ) ( not ( = ?auto_64266 ?auto_64267 ) ) ( not ( = ?auto_64266 ?auto_64268 ) ) ( not ( = ?auto_64267 ?auto_64268 ) ) ( not ( = ?auto_64266 ?auto_64270 ) ) ( not ( = ?auto_64266 ?auto_64269 ) ) ( not ( = ?auto_64267 ?auto_64270 ) ) ( not ( = ?auto_64267 ?auto_64269 ) ) ( not ( = ?auto_64268 ?auto_64270 ) ) ( not ( = ?auto_64268 ?auto_64269 ) ) ( not ( = ?auto_64270 ?auto_64269 ) ) ( ON ?auto_64270 ?auto_64268 ) ( CLEAR ?auto_64270 ) ( HOLDING ?auto_64269 ) ( CLEAR ?auto_64271 ) ( ON-TABLE ?auto_64271 ) ( not ( = ?auto_64271 ?auto_64269 ) ) ( not ( = ?auto_64266 ?auto_64271 ) ) ( not ( = ?auto_64267 ?auto_64271 ) ) ( not ( = ?auto_64268 ?auto_64271 ) ) ( not ( = ?auto_64270 ?auto_64271 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_64271 ?auto_64269 )
      ( MAKE-2PILE ?auto_64266 ?auto_64267 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_64272 - BLOCK
      ?auto_64273 - BLOCK
    )
    :vars
    (
      ?auto_64275 - BLOCK
      ?auto_64276 - BLOCK
      ?auto_64277 - BLOCK
      ?auto_64274 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64275 ?auto_64273 ) ( ON-TABLE ?auto_64272 ) ( ON ?auto_64273 ?auto_64272 ) ( not ( = ?auto_64272 ?auto_64273 ) ) ( not ( = ?auto_64272 ?auto_64275 ) ) ( not ( = ?auto_64273 ?auto_64275 ) ) ( not ( = ?auto_64272 ?auto_64276 ) ) ( not ( = ?auto_64272 ?auto_64277 ) ) ( not ( = ?auto_64273 ?auto_64276 ) ) ( not ( = ?auto_64273 ?auto_64277 ) ) ( not ( = ?auto_64275 ?auto_64276 ) ) ( not ( = ?auto_64275 ?auto_64277 ) ) ( not ( = ?auto_64276 ?auto_64277 ) ) ( ON ?auto_64276 ?auto_64275 ) ( CLEAR ?auto_64274 ) ( ON-TABLE ?auto_64274 ) ( not ( = ?auto_64274 ?auto_64277 ) ) ( not ( = ?auto_64272 ?auto_64274 ) ) ( not ( = ?auto_64273 ?auto_64274 ) ) ( not ( = ?auto_64275 ?auto_64274 ) ) ( not ( = ?auto_64276 ?auto_64274 ) ) ( ON ?auto_64277 ?auto_64276 ) ( CLEAR ?auto_64277 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_64272 ?auto_64273 ?auto_64275 ?auto_64276 )
      ( MAKE-2PILE ?auto_64272 ?auto_64273 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_64278 - BLOCK
      ?auto_64279 - BLOCK
    )
    :vars
    (
      ?auto_64281 - BLOCK
      ?auto_64280 - BLOCK
      ?auto_64283 - BLOCK
      ?auto_64282 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64281 ?auto_64279 ) ( ON-TABLE ?auto_64278 ) ( ON ?auto_64279 ?auto_64278 ) ( not ( = ?auto_64278 ?auto_64279 ) ) ( not ( = ?auto_64278 ?auto_64281 ) ) ( not ( = ?auto_64279 ?auto_64281 ) ) ( not ( = ?auto_64278 ?auto_64280 ) ) ( not ( = ?auto_64278 ?auto_64283 ) ) ( not ( = ?auto_64279 ?auto_64280 ) ) ( not ( = ?auto_64279 ?auto_64283 ) ) ( not ( = ?auto_64281 ?auto_64280 ) ) ( not ( = ?auto_64281 ?auto_64283 ) ) ( not ( = ?auto_64280 ?auto_64283 ) ) ( ON ?auto_64280 ?auto_64281 ) ( not ( = ?auto_64282 ?auto_64283 ) ) ( not ( = ?auto_64278 ?auto_64282 ) ) ( not ( = ?auto_64279 ?auto_64282 ) ) ( not ( = ?auto_64281 ?auto_64282 ) ) ( not ( = ?auto_64280 ?auto_64282 ) ) ( ON ?auto_64283 ?auto_64280 ) ( CLEAR ?auto_64283 ) ( HOLDING ?auto_64282 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_64282 )
      ( MAKE-2PILE ?auto_64278 ?auto_64279 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_64292 - BLOCK
      ?auto_64293 - BLOCK
    )
    :vars
    (
      ?auto_64294 - BLOCK
      ?auto_64296 - BLOCK
      ?auto_64295 - BLOCK
      ?auto_64297 - BLOCK
      ?auto_64298 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64294 ?auto_64293 ) ( ON-TABLE ?auto_64292 ) ( ON ?auto_64293 ?auto_64292 ) ( not ( = ?auto_64292 ?auto_64293 ) ) ( not ( = ?auto_64292 ?auto_64294 ) ) ( not ( = ?auto_64293 ?auto_64294 ) ) ( not ( = ?auto_64292 ?auto_64296 ) ) ( not ( = ?auto_64292 ?auto_64295 ) ) ( not ( = ?auto_64293 ?auto_64296 ) ) ( not ( = ?auto_64293 ?auto_64295 ) ) ( not ( = ?auto_64294 ?auto_64296 ) ) ( not ( = ?auto_64294 ?auto_64295 ) ) ( not ( = ?auto_64296 ?auto_64295 ) ) ( ON ?auto_64296 ?auto_64294 ) ( not ( = ?auto_64297 ?auto_64295 ) ) ( not ( = ?auto_64292 ?auto_64297 ) ) ( not ( = ?auto_64293 ?auto_64297 ) ) ( not ( = ?auto_64294 ?auto_64297 ) ) ( not ( = ?auto_64296 ?auto_64297 ) ) ( ON ?auto_64295 ?auto_64296 ) ( CLEAR ?auto_64295 ) ( ON ?auto_64297 ?auto_64298 ) ( CLEAR ?auto_64297 ) ( HAND-EMPTY ) ( not ( = ?auto_64292 ?auto_64298 ) ) ( not ( = ?auto_64293 ?auto_64298 ) ) ( not ( = ?auto_64294 ?auto_64298 ) ) ( not ( = ?auto_64296 ?auto_64298 ) ) ( not ( = ?auto_64295 ?auto_64298 ) ) ( not ( = ?auto_64297 ?auto_64298 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_64297 ?auto_64298 )
      ( MAKE-2PILE ?auto_64292 ?auto_64293 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_64299 - BLOCK
      ?auto_64300 - BLOCK
    )
    :vars
    (
      ?auto_64304 - BLOCK
      ?auto_64305 - BLOCK
      ?auto_64302 - BLOCK
      ?auto_64303 - BLOCK
      ?auto_64301 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64304 ?auto_64300 ) ( ON-TABLE ?auto_64299 ) ( ON ?auto_64300 ?auto_64299 ) ( not ( = ?auto_64299 ?auto_64300 ) ) ( not ( = ?auto_64299 ?auto_64304 ) ) ( not ( = ?auto_64300 ?auto_64304 ) ) ( not ( = ?auto_64299 ?auto_64305 ) ) ( not ( = ?auto_64299 ?auto_64302 ) ) ( not ( = ?auto_64300 ?auto_64305 ) ) ( not ( = ?auto_64300 ?auto_64302 ) ) ( not ( = ?auto_64304 ?auto_64305 ) ) ( not ( = ?auto_64304 ?auto_64302 ) ) ( not ( = ?auto_64305 ?auto_64302 ) ) ( ON ?auto_64305 ?auto_64304 ) ( not ( = ?auto_64303 ?auto_64302 ) ) ( not ( = ?auto_64299 ?auto_64303 ) ) ( not ( = ?auto_64300 ?auto_64303 ) ) ( not ( = ?auto_64304 ?auto_64303 ) ) ( not ( = ?auto_64305 ?auto_64303 ) ) ( ON ?auto_64303 ?auto_64301 ) ( CLEAR ?auto_64303 ) ( not ( = ?auto_64299 ?auto_64301 ) ) ( not ( = ?auto_64300 ?auto_64301 ) ) ( not ( = ?auto_64304 ?auto_64301 ) ) ( not ( = ?auto_64305 ?auto_64301 ) ) ( not ( = ?auto_64302 ?auto_64301 ) ) ( not ( = ?auto_64303 ?auto_64301 ) ) ( HOLDING ?auto_64302 ) ( CLEAR ?auto_64305 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_64299 ?auto_64300 ?auto_64304 ?auto_64305 ?auto_64302 )
      ( MAKE-2PILE ?auto_64299 ?auto_64300 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_64345 - BLOCK
      ?auto_64346 - BLOCK
      ?auto_64347 - BLOCK
      ?auto_64348 - BLOCK
    )
    :vars
    (
      ?auto_64349 - BLOCK
      ?auto_64350 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_64345 ) ( ON ?auto_64346 ?auto_64345 ) ( not ( = ?auto_64345 ?auto_64346 ) ) ( not ( = ?auto_64345 ?auto_64347 ) ) ( not ( = ?auto_64345 ?auto_64348 ) ) ( not ( = ?auto_64346 ?auto_64347 ) ) ( not ( = ?auto_64346 ?auto_64348 ) ) ( not ( = ?auto_64347 ?auto_64348 ) ) ( ON ?auto_64348 ?auto_64349 ) ( not ( = ?auto_64345 ?auto_64349 ) ) ( not ( = ?auto_64346 ?auto_64349 ) ) ( not ( = ?auto_64347 ?auto_64349 ) ) ( not ( = ?auto_64348 ?auto_64349 ) ) ( CLEAR ?auto_64346 ) ( ON ?auto_64347 ?auto_64348 ) ( CLEAR ?auto_64347 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_64350 ) ( ON ?auto_64349 ?auto_64350 ) ( not ( = ?auto_64350 ?auto_64349 ) ) ( not ( = ?auto_64350 ?auto_64348 ) ) ( not ( = ?auto_64350 ?auto_64347 ) ) ( not ( = ?auto_64345 ?auto_64350 ) ) ( not ( = ?auto_64346 ?auto_64350 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_64350 ?auto_64349 ?auto_64348 )
      ( MAKE-4PILE ?auto_64345 ?auto_64346 ?auto_64347 ?auto_64348 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_64351 - BLOCK
      ?auto_64352 - BLOCK
      ?auto_64353 - BLOCK
      ?auto_64354 - BLOCK
    )
    :vars
    (
      ?auto_64356 - BLOCK
      ?auto_64355 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_64351 ) ( not ( = ?auto_64351 ?auto_64352 ) ) ( not ( = ?auto_64351 ?auto_64353 ) ) ( not ( = ?auto_64351 ?auto_64354 ) ) ( not ( = ?auto_64352 ?auto_64353 ) ) ( not ( = ?auto_64352 ?auto_64354 ) ) ( not ( = ?auto_64353 ?auto_64354 ) ) ( ON ?auto_64354 ?auto_64356 ) ( not ( = ?auto_64351 ?auto_64356 ) ) ( not ( = ?auto_64352 ?auto_64356 ) ) ( not ( = ?auto_64353 ?auto_64356 ) ) ( not ( = ?auto_64354 ?auto_64356 ) ) ( ON ?auto_64353 ?auto_64354 ) ( CLEAR ?auto_64353 ) ( ON-TABLE ?auto_64355 ) ( ON ?auto_64356 ?auto_64355 ) ( not ( = ?auto_64355 ?auto_64356 ) ) ( not ( = ?auto_64355 ?auto_64354 ) ) ( not ( = ?auto_64355 ?auto_64353 ) ) ( not ( = ?auto_64351 ?auto_64355 ) ) ( not ( = ?auto_64352 ?auto_64355 ) ) ( HOLDING ?auto_64352 ) ( CLEAR ?auto_64351 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_64351 ?auto_64352 )
      ( MAKE-4PILE ?auto_64351 ?auto_64352 ?auto_64353 ?auto_64354 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_64357 - BLOCK
      ?auto_64358 - BLOCK
      ?auto_64359 - BLOCK
      ?auto_64360 - BLOCK
    )
    :vars
    (
      ?auto_64361 - BLOCK
      ?auto_64362 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_64357 ) ( not ( = ?auto_64357 ?auto_64358 ) ) ( not ( = ?auto_64357 ?auto_64359 ) ) ( not ( = ?auto_64357 ?auto_64360 ) ) ( not ( = ?auto_64358 ?auto_64359 ) ) ( not ( = ?auto_64358 ?auto_64360 ) ) ( not ( = ?auto_64359 ?auto_64360 ) ) ( ON ?auto_64360 ?auto_64361 ) ( not ( = ?auto_64357 ?auto_64361 ) ) ( not ( = ?auto_64358 ?auto_64361 ) ) ( not ( = ?auto_64359 ?auto_64361 ) ) ( not ( = ?auto_64360 ?auto_64361 ) ) ( ON ?auto_64359 ?auto_64360 ) ( ON-TABLE ?auto_64362 ) ( ON ?auto_64361 ?auto_64362 ) ( not ( = ?auto_64362 ?auto_64361 ) ) ( not ( = ?auto_64362 ?auto_64360 ) ) ( not ( = ?auto_64362 ?auto_64359 ) ) ( not ( = ?auto_64357 ?auto_64362 ) ) ( not ( = ?auto_64358 ?auto_64362 ) ) ( CLEAR ?auto_64357 ) ( ON ?auto_64358 ?auto_64359 ) ( CLEAR ?auto_64358 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_64362 ?auto_64361 ?auto_64360 ?auto_64359 )
      ( MAKE-4PILE ?auto_64357 ?auto_64358 ?auto_64359 ?auto_64360 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_64363 - BLOCK
      ?auto_64364 - BLOCK
      ?auto_64365 - BLOCK
      ?auto_64366 - BLOCK
    )
    :vars
    (
      ?auto_64368 - BLOCK
      ?auto_64367 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64363 ?auto_64364 ) ) ( not ( = ?auto_64363 ?auto_64365 ) ) ( not ( = ?auto_64363 ?auto_64366 ) ) ( not ( = ?auto_64364 ?auto_64365 ) ) ( not ( = ?auto_64364 ?auto_64366 ) ) ( not ( = ?auto_64365 ?auto_64366 ) ) ( ON ?auto_64366 ?auto_64368 ) ( not ( = ?auto_64363 ?auto_64368 ) ) ( not ( = ?auto_64364 ?auto_64368 ) ) ( not ( = ?auto_64365 ?auto_64368 ) ) ( not ( = ?auto_64366 ?auto_64368 ) ) ( ON ?auto_64365 ?auto_64366 ) ( ON-TABLE ?auto_64367 ) ( ON ?auto_64368 ?auto_64367 ) ( not ( = ?auto_64367 ?auto_64368 ) ) ( not ( = ?auto_64367 ?auto_64366 ) ) ( not ( = ?auto_64367 ?auto_64365 ) ) ( not ( = ?auto_64363 ?auto_64367 ) ) ( not ( = ?auto_64364 ?auto_64367 ) ) ( ON ?auto_64364 ?auto_64365 ) ( CLEAR ?auto_64364 ) ( HOLDING ?auto_64363 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_64363 )
      ( MAKE-4PILE ?auto_64363 ?auto_64364 ?auto_64365 ?auto_64366 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_64369 - BLOCK
      ?auto_64370 - BLOCK
      ?auto_64371 - BLOCK
      ?auto_64372 - BLOCK
    )
    :vars
    (
      ?auto_64373 - BLOCK
      ?auto_64374 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64369 ?auto_64370 ) ) ( not ( = ?auto_64369 ?auto_64371 ) ) ( not ( = ?auto_64369 ?auto_64372 ) ) ( not ( = ?auto_64370 ?auto_64371 ) ) ( not ( = ?auto_64370 ?auto_64372 ) ) ( not ( = ?auto_64371 ?auto_64372 ) ) ( ON ?auto_64372 ?auto_64373 ) ( not ( = ?auto_64369 ?auto_64373 ) ) ( not ( = ?auto_64370 ?auto_64373 ) ) ( not ( = ?auto_64371 ?auto_64373 ) ) ( not ( = ?auto_64372 ?auto_64373 ) ) ( ON ?auto_64371 ?auto_64372 ) ( ON-TABLE ?auto_64374 ) ( ON ?auto_64373 ?auto_64374 ) ( not ( = ?auto_64374 ?auto_64373 ) ) ( not ( = ?auto_64374 ?auto_64372 ) ) ( not ( = ?auto_64374 ?auto_64371 ) ) ( not ( = ?auto_64369 ?auto_64374 ) ) ( not ( = ?auto_64370 ?auto_64374 ) ) ( ON ?auto_64370 ?auto_64371 ) ( ON ?auto_64369 ?auto_64370 ) ( CLEAR ?auto_64369 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_64374 ?auto_64373 ?auto_64372 ?auto_64371 ?auto_64370 )
      ( MAKE-4PILE ?auto_64369 ?auto_64370 ?auto_64371 ?auto_64372 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_64379 - BLOCK
      ?auto_64380 - BLOCK
      ?auto_64381 - BLOCK
      ?auto_64382 - BLOCK
    )
    :vars
    (
      ?auto_64383 - BLOCK
      ?auto_64384 - BLOCK
      ?auto_64385 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64379 ?auto_64380 ) ) ( not ( = ?auto_64379 ?auto_64381 ) ) ( not ( = ?auto_64379 ?auto_64382 ) ) ( not ( = ?auto_64380 ?auto_64381 ) ) ( not ( = ?auto_64380 ?auto_64382 ) ) ( not ( = ?auto_64381 ?auto_64382 ) ) ( ON ?auto_64382 ?auto_64383 ) ( not ( = ?auto_64379 ?auto_64383 ) ) ( not ( = ?auto_64380 ?auto_64383 ) ) ( not ( = ?auto_64381 ?auto_64383 ) ) ( not ( = ?auto_64382 ?auto_64383 ) ) ( ON ?auto_64381 ?auto_64382 ) ( ON-TABLE ?auto_64384 ) ( ON ?auto_64383 ?auto_64384 ) ( not ( = ?auto_64384 ?auto_64383 ) ) ( not ( = ?auto_64384 ?auto_64382 ) ) ( not ( = ?auto_64384 ?auto_64381 ) ) ( not ( = ?auto_64379 ?auto_64384 ) ) ( not ( = ?auto_64380 ?auto_64384 ) ) ( ON ?auto_64380 ?auto_64381 ) ( CLEAR ?auto_64380 ) ( ON ?auto_64379 ?auto_64385 ) ( CLEAR ?auto_64379 ) ( HAND-EMPTY ) ( not ( = ?auto_64379 ?auto_64385 ) ) ( not ( = ?auto_64380 ?auto_64385 ) ) ( not ( = ?auto_64381 ?auto_64385 ) ) ( not ( = ?auto_64382 ?auto_64385 ) ) ( not ( = ?auto_64383 ?auto_64385 ) ) ( not ( = ?auto_64384 ?auto_64385 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_64379 ?auto_64385 )
      ( MAKE-4PILE ?auto_64379 ?auto_64380 ?auto_64381 ?auto_64382 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_64386 - BLOCK
      ?auto_64387 - BLOCK
      ?auto_64388 - BLOCK
      ?auto_64389 - BLOCK
    )
    :vars
    (
      ?auto_64392 - BLOCK
      ?auto_64390 - BLOCK
      ?auto_64391 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64386 ?auto_64387 ) ) ( not ( = ?auto_64386 ?auto_64388 ) ) ( not ( = ?auto_64386 ?auto_64389 ) ) ( not ( = ?auto_64387 ?auto_64388 ) ) ( not ( = ?auto_64387 ?auto_64389 ) ) ( not ( = ?auto_64388 ?auto_64389 ) ) ( ON ?auto_64389 ?auto_64392 ) ( not ( = ?auto_64386 ?auto_64392 ) ) ( not ( = ?auto_64387 ?auto_64392 ) ) ( not ( = ?auto_64388 ?auto_64392 ) ) ( not ( = ?auto_64389 ?auto_64392 ) ) ( ON ?auto_64388 ?auto_64389 ) ( ON-TABLE ?auto_64390 ) ( ON ?auto_64392 ?auto_64390 ) ( not ( = ?auto_64390 ?auto_64392 ) ) ( not ( = ?auto_64390 ?auto_64389 ) ) ( not ( = ?auto_64390 ?auto_64388 ) ) ( not ( = ?auto_64386 ?auto_64390 ) ) ( not ( = ?auto_64387 ?auto_64390 ) ) ( ON ?auto_64386 ?auto_64391 ) ( CLEAR ?auto_64386 ) ( not ( = ?auto_64386 ?auto_64391 ) ) ( not ( = ?auto_64387 ?auto_64391 ) ) ( not ( = ?auto_64388 ?auto_64391 ) ) ( not ( = ?auto_64389 ?auto_64391 ) ) ( not ( = ?auto_64392 ?auto_64391 ) ) ( not ( = ?auto_64390 ?auto_64391 ) ) ( HOLDING ?auto_64387 ) ( CLEAR ?auto_64388 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_64390 ?auto_64392 ?auto_64389 ?auto_64388 ?auto_64387 )
      ( MAKE-4PILE ?auto_64386 ?auto_64387 ?auto_64388 ?auto_64389 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_64393 - BLOCK
      ?auto_64394 - BLOCK
      ?auto_64395 - BLOCK
      ?auto_64396 - BLOCK
    )
    :vars
    (
      ?auto_64398 - BLOCK
      ?auto_64397 - BLOCK
      ?auto_64399 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64393 ?auto_64394 ) ) ( not ( = ?auto_64393 ?auto_64395 ) ) ( not ( = ?auto_64393 ?auto_64396 ) ) ( not ( = ?auto_64394 ?auto_64395 ) ) ( not ( = ?auto_64394 ?auto_64396 ) ) ( not ( = ?auto_64395 ?auto_64396 ) ) ( ON ?auto_64396 ?auto_64398 ) ( not ( = ?auto_64393 ?auto_64398 ) ) ( not ( = ?auto_64394 ?auto_64398 ) ) ( not ( = ?auto_64395 ?auto_64398 ) ) ( not ( = ?auto_64396 ?auto_64398 ) ) ( ON ?auto_64395 ?auto_64396 ) ( ON-TABLE ?auto_64397 ) ( ON ?auto_64398 ?auto_64397 ) ( not ( = ?auto_64397 ?auto_64398 ) ) ( not ( = ?auto_64397 ?auto_64396 ) ) ( not ( = ?auto_64397 ?auto_64395 ) ) ( not ( = ?auto_64393 ?auto_64397 ) ) ( not ( = ?auto_64394 ?auto_64397 ) ) ( ON ?auto_64393 ?auto_64399 ) ( not ( = ?auto_64393 ?auto_64399 ) ) ( not ( = ?auto_64394 ?auto_64399 ) ) ( not ( = ?auto_64395 ?auto_64399 ) ) ( not ( = ?auto_64396 ?auto_64399 ) ) ( not ( = ?auto_64398 ?auto_64399 ) ) ( not ( = ?auto_64397 ?auto_64399 ) ) ( CLEAR ?auto_64395 ) ( ON ?auto_64394 ?auto_64393 ) ( CLEAR ?auto_64394 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_64399 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_64399 ?auto_64393 )
      ( MAKE-4PILE ?auto_64393 ?auto_64394 ?auto_64395 ?auto_64396 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_64400 - BLOCK
      ?auto_64401 - BLOCK
      ?auto_64402 - BLOCK
      ?auto_64403 - BLOCK
    )
    :vars
    (
      ?auto_64406 - BLOCK
      ?auto_64405 - BLOCK
      ?auto_64404 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64400 ?auto_64401 ) ) ( not ( = ?auto_64400 ?auto_64402 ) ) ( not ( = ?auto_64400 ?auto_64403 ) ) ( not ( = ?auto_64401 ?auto_64402 ) ) ( not ( = ?auto_64401 ?auto_64403 ) ) ( not ( = ?auto_64402 ?auto_64403 ) ) ( ON ?auto_64403 ?auto_64406 ) ( not ( = ?auto_64400 ?auto_64406 ) ) ( not ( = ?auto_64401 ?auto_64406 ) ) ( not ( = ?auto_64402 ?auto_64406 ) ) ( not ( = ?auto_64403 ?auto_64406 ) ) ( ON-TABLE ?auto_64405 ) ( ON ?auto_64406 ?auto_64405 ) ( not ( = ?auto_64405 ?auto_64406 ) ) ( not ( = ?auto_64405 ?auto_64403 ) ) ( not ( = ?auto_64405 ?auto_64402 ) ) ( not ( = ?auto_64400 ?auto_64405 ) ) ( not ( = ?auto_64401 ?auto_64405 ) ) ( ON ?auto_64400 ?auto_64404 ) ( not ( = ?auto_64400 ?auto_64404 ) ) ( not ( = ?auto_64401 ?auto_64404 ) ) ( not ( = ?auto_64402 ?auto_64404 ) ) ( not ( = ?auto_64403 ?auto_64404 ) ) ( not ( = ?auto_64406 ?auto_64404 ) ) ( not ( = ?auto_64405 ?auto_64404 ) ) ( ON ?auto_64401 ?auto_64400 ) ( CLEAR ?auto_64401 ) ( ON-TABLE ?auto_64404 ) ( HOLDING ?auto_64402 ) ( CLEAR ?auto_64403 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_64405 ?auto_64406 ?auto_64403 ?auto_64402 )
      ( MAKE-4PILE ?auto_64400 ?auto_64401 ?auto_64402 ?auto_64403 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_64407 - BLOCK
      ?auto_64408 - BLOCK
      ?auto_64409 - BLOCK
      ?auto_64410 - BLOCK
    )
    :vars
    (
      ?auto_64413 - BLOCK
      ?auto_64411 - BLOCK
      ?auto_64412 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64407 ?auto_64408 ) ) ( not ( = ?auto_64407 ?auto_64409 ) ) ( not ( = ?auto_64407 ?auto_64410 ) ) ( not ( = ?auto_64408 ?auto_64409 ) ) ( not ( = ?auto_64408 ?auto_64410 ) ) ( not ( = ?auto_64409 ?auto_64410 ) ) ( ON ?auto_64410 ?auto_64413 ) ( not ( = ?auto_64407 ?auto_64413 ) ) ( not ( = ?auto_64408 ?auto_64413 ) ) ( not ( = ?auto_64409 ?auto_64413 ) ) ( not ( = ?auto_64410 ?auto_64413 ) ) ( ON-TABLE ?auto_64411 ) ( ON ?auto_64413 ?auto_64411 ) ( not ( = ?auto_64411 ?auto_64413 ) ) ( not ( = ?auto_64411 ?auto_64410 ) ) ( not ( = ?auto_64411 ?auto_64409 ) ) ( not ( = ?auto_64407 ?auto_64411 ) ) ( not ( = ?auto_64408 ?auto_64411 ) ) ( ON ?auto_64407 ?auto_64412 ) ( not ( = ?auto_64407 ?auto_64412 ) ) ( not ( = ?auto_64408 ?auto_64412 ) ) ( not ( = ?auto_64409 ?auto_64412 ) ) ( not ( = ?auto_64410 ?auto_64412 ) ) ( not ( = ?auto_64413 ?auto_64412 ) ) ( not ( = ?auto_64411 ?auto_64412 ) ) ( ON ?auto_64408 ?auto_64407 ) ( ON-TABLE ?auto_64412 ) ( CLEAR ?auto_64410 ) ( ON ?auto_64409 ?auto_64408 ) ( CLEAR ?auto_64409 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_64412 ?auto_64407 ?auto_64408 )
      ( MAKE-4PILE ?auto_64407 ?auto_64408 ?auto_64409 ?auto_64410 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_64414 - BLOCK
      ?auto_64415 - BLOCK
      ?auto_64416 - BLOCK
      ?auto_64417 - BLOCK
    )
    :vars
    (
      ?auto_64420 - BLOCK
      ?auto_64418 - BLOCK
      ?auto_64419 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64414 ?auto_64415 ) ) ( not ( = ?auto_64414 ?auto_64416 ) ) ( not ( = ?auto_64414 ?auto_64417 ) ) ( not ( = ?auto_64415 ?auto_64416 ) ) ( not ( = ?auto_64415 ?auto_64417 ) ) ( not ( = ?auto_64416 ?auto_64417 ) ) ( not ( = ?auto_64414 ?auto_64420 ) ) ( not ( = ?auto_64415 ?auto_64420 ) ) ( not ( = ?auto_64416 ?auto_64420 ) ) ( not ( = ?auto_64417 ?auto_64420 ) ) ( ON-TABLE ?auto_64418 ) ( ON ?auto_64420 ?auto_64418 ) ( not ( = ?auto_64418 ?auto_64420 ) ) ( not ( = ?auto_64418 ?auto_64417 ) ) ( not ( = ?auto_64418 ?auto_64416 ) ) ( not ( = ?auto_64414 ?auto_64418 ) ) ( not ( = ?auto_64415 ?auto_64418 ) ) ( ON ?auto_64414 ?auto_64419 ) ( not ( = ?auto_64414 ?auto_64419 ) ) ( not ( = ?auto_64415 ?auto_64419 ) ) ( not ( = ?auto_64416 ?auto_64419 ) ) ( not ( = ?auto_64417 ?auto_64419 ) ) ( not ( = ?auto_64420 ?auto_64419 ) ) ( not ( = ?auto_64418 ?auto_64419 ) ) ( ON ?auto_64415 ?auto_64414 ) ( ON-TABLE ?auto_64419 ) ( ON ?auto_64416 ?auto_64415 ) ( CLEAR ?auto_64416 ) ( HOLDING ?auto_64417 ) ( CLEAR ?auto_64420 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_64418 ?auto_64420 ?auto_64417 )
      ( MAKE-4PILE ?auto_64414 ?auto_64415 ?auto_64416 ?auto_64417 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_64421 - BLOCK
      ?auto_64422 - BLOCK
      ?auto_64423 - BLOCK
      ?auto_64424 - BLOCK
    )
    :vars
    (
      ?auto_64426 - BLOCK
      ?auto_64425 - BLOCK
      ?auto_64427 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64421 ?auto_64422 ) ) ( not ( = ?auto_64421 ?auto_64423 ) ) ( not ( = ?auto_64421 ?auto_64424 ) ) ( not ( = ?auto_64422 ?auto_64423 ) ) ( not ( = ?auto_64422 ?auto_64424 ) ) ( not ( = ?auto_64423 ?auto_64424 ) ) ( not ( = ?auto_64421 ?auto_64426 ) ) ( not ( = ?auto_64422 ?auto_64426 ) ) ( not ( = ?auto_64423 ?auto_64426 ) ) ( not ( = ?auto_64424 ?auto_64426 ) ) ( ON-TABLE ?auto_64425 ) ( ON ?auto_64426 ?auto_64425 ) ( not ( = ?auto_64425 ?auto_64426 ) ) ( not ( = ?auto_64425 ?auto_64424 ) ) ( not ( = ?auto_64425 ?auto_64423 ) ) ( not ( = ?auto_64421 ?auto_64425 ) ) ( not ( = ?auto_64422 ?auto_64425 ) ) ( ON ?auto_64421 ?auto_64427 ) ( not ( = ?auto_64421 ?auto_64427 ) ) ( not ( = ?auto_64422 ?auto_64427 ) ) ( not ( = ?auto_64423 ?auto_64427 ) ) ( not ( = ?auto_64424 ?auto_64427 ) ) ( not ( = ?auto_64426 ?auto_64427 ) ) ( not ( = ?auto_64425 ?auto_64427 ) ) ( ON ?auto_64422 ?auto_64421 ) ( ON-TABLE ?auto_64427 ) ( ON ?auto_64423 ?auto_64422 ) ( CLEAR ?auto_64426 ) ( ON ?auto_64424 ?auto_64423 ) ( CLEAR ?auto_64424 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_64427 ?auto_64421 ?auto_64422 ?auto_64423 )
      ( MAKE-4PILE ?auto_64421 ?auto_64422 ?auto_64423 ?auto_64424 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_64428 - BLOCK
      ?auto_64429 - BLOCK
      ?auto_64430 - BLOCK
      ?auto_64431 - BLOCK
    )
    :vars
    (
      ?auto_64434 - BLOCK
      ?auto_64432 - BLOCK
      ?auto_64433 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64428 ?auto_64429 ) ) ( not ( = ?auto_64428 ?auto_64430 ) ) ( not ( = ?auto_64428 ?auto_64431 ) ) ( not ( = ?auto_64429 ?auto_64430 ) ) ( not ( = ?auto_64429 ?auto_64431 ) ) ( not ( = ?auto_64430 ?auto_64431 ) ) ( not ( = ?auto_64428 ?auto_64434 ) ) ( not ( = ?auto_64429 ?auto_64434 ) ) ( not ( = ?auto_64430 ?auto_64434 ) ) ( not ( = ?auto_64431 ?auto_64434 ) ) ( ON-TABLE ?auto_64432 ) ( not ( = ?auto_64432 ?auto_64434 ) ) ( not ( = ?auto_64432 ?auto_64431 ) ) ( not ( = ?auto_64432 ?auto_64430 ) ) ( not ( = ?auto_64428 ?auto_64432 ) ) ( not ( = ?auto_64429 ?auto_64432 ) ) ( ON ?auto_64428 ?auto_64433 ) ( not ( = ?auto_64428 ?auto_64433 ) ) ( not ( = ?auto_64429 ?auto_64433 ) ) ( not ( = ?auto_64430 ?auto_64433 ) ) ( not ( = ?auto_64431 ?auto_64433 ) ) ( not ( = ?auto_64434 ?auto_64433 ) ) ( not ( = ?auto_64432 ?auto_64433 ) ) ( ON ?auto_64429 ?auto_64428 ) ( ON-TABLE ?auto_64433 ) ( ON ?auto_64430 ?auto_64429 ) ( ON ?auto_64431 ?auto_64430 ) ( CLEAR ?auto_64431 ) ( HOLDING ?auto_64434 ) ( CLEAR ?auto_64432 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_64432 ?auto_64434 )
      ( MAKE-4PILE ?auto_64428 ?auto_64429 ?auto_64430 ?auto_64431 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_64435 - BLOCK
      ?auto_64436 - BLOCK
      ?auto_64437 - BLOCK
      ?auto_64438 - BLOCK
    )
    :vars
    (
      ?auto_64440 - BLOCK
      ?auto_64439 - BLOCK
      ?auto_64441 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64435 ?auto_64436 ) ) ( not ( = ?auto_64435 ?auto_64437 ) ) ( not ( = ?auto_64435 ?auto_64438 ) ) ( not ( = ?auto_64436 ?auto_64437 ) ) ( not ( = ?auto_64436 ?auto_64438 ) ) ( not ( = ?auto_64437 ?auto_64438 ) ) ( not ( = ?auto_64435 ?auto_64440 ) ) ( not ( = ?auto_64436 ?auto_64440 ) ) ( not ( = ?auto_64437 ?auto_64440 ) ) ( not ( = ?auto_64438 ?auto_64440 ) ) ( ON-TABLE ?auto_64439 ) ( not ( = ?auto_64439 ?auto_64440 ) ) ( not ( = ?auto_64439 ?auto_64438 ) ) ( not ( = ?auto_64439 ?auto_64437 ) ) ( not ( = ?auto_64435 ?auto_64439 ) ) ( not ( = ?auto_64436 ?auto_64439 ) ) ( ON ?auto_64435 ?auto_64441 ) ( not ( = ?auto_64435 ?auto_64441 ) ) ( not ( = ?auto_64436 ?auto_64441 ) ) ( not ( = ?auto_64437 ?auto_64441 ) ) ( not ( = ?auto_64438 ?auto_64441 ) ) ( not ( = ?auto_64440 ?auto_64441 ) ) ( not ( = ?auto_64439 ?auto_64441 ) ) ( ON ?auto_64436 ?auto_64435 ) ( ON-TABLE ?auto_64441 ) ( ON ?auto_64437 ?auto_64436 ) ( ON ?auto_64438 ?auto_64437 ) ( CLEAR ?auto_64439 ) ( ON ?auto_64440 ?auto_64438 ) ( CLEAR ?auto_64440 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_64441 ?auto_64435 ?auto_64436 ?auto_64437 ?auto_64438 )
      ( MAKE-4PILE ?auto_64435 ?auto_64436 ?auto_64437 ?auto_64438 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_64442 - BLOCK
      ?auto_64443 - BLOCK
      ?auto_64444 - BLOCK
      ?auto_64445 - BLOCK
    )
    :vars
    (
      ?auto_64446 - BLOCK
      ?auto_64447 - BLOCK
      ?auto_64448 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64442 ?auto_64443 ) ) ( not ( = ?auto_64442 ?auto_64444 ) ) ( not ( = ?auto_64442 ?auto_64445 ) ) ( not ( = ?auto_64443 ?auto_64444 ) ) ( not ( = ?auto_64443 ?auto_64445 ) ) ( not ( = ?auto_64444 ?auto_64445 ) ) ( not ( = ?auto_64442 ?auto_64446 ) ) ( not ( = ?auto_64443 ?auto_64446 ) ) ( not ( = ?auto_64444 ?auto_64446 ) ) ( not ( = ?auto_64445 ?auto_64446 ) ) ( not ( = ?auto_64447 ?auto_64446 ) ) ( not ( = ?auto_64447 ?auto_64445 ) ) ( not ( = ?auto_64447 ?auto_64444 ) ) ( not ( = ?auto_64442 ?auto_64447 ) ) ( not ( = ?auto_64443 ?auto_64447 ) ) ( ON ?auto_64442 ?auto_64448 ) ( not ( = ?auto_64442 ?auto_64448 ) ) ( not ( = ?auto_64443 ?auto_64448 ) ) ( not ( = ?auto_64444 ?auto_64448 ) ) ( not ( = ?auto_64445 ?auto_64448 ) ) ( not ( = ?auto_64446 ?auto_64448 ) ) ( not ( = ?auto_64447 ?auto_64448 ) ) ( ON ?auto_64443 ?auto_64442 ) ( ON-TABLE ?auto_64448 ) ( ON ?auto_64444 ?auto_64443 ) ( ON ?auto_64445 ?auto_64444 ) ( ON ?auto_64446 ?auto_64445 ) ( CLEAR ?auto_64446 ) ( HOLDING ?auto_64447 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_64447 )
      ( MAKE-4PILE ?auto_64442 ?auto_64443 ?auto_64444 ?auto_64445 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_64449 - BLOCK
      ?auto_64450 - BLOCK
      ?auto_64451 - BLOCK
      ?auto_64452 - BLOCK
    )
    :vars
    (
      ?auto_64454 - BLOCK
      ?auto_64453 - BLOCK
      ?auto_64455 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64449 ?auto_64450 ) ) ( not ( = ?auto_64449 ?auto_64451 ) ) ( not ( = ?auto_64449 ?auto_64452 ) ) ( not ( = ?auto_64450 ?auto_64451 ) ) ( not ( = ?auto_64450 ?auto_64452 ) ) ( not ( = ?auto_64451 ?auto_64452 ) ) ( not ( = ?auto_64449 ?auto_64454 ) ) ( not ( = ?auto_64450 ?auto_64454 ) ) ( not ( = ?auto_64451 ?auto_64454 ) ) ( not ( = ?auto_64452 ?auto_64454 ) ) ( not ( = ?auto_64453 ?auto_64454 ) ) ( not ( = ?auto_64453 ?auto_64452 ) ) ( not ( = ?auto_64453 ?auto_64451 ) ) ( not ( = ?auto_64449 ?auto_64453 ) ) ( not ( = ?auto_64450 ?auto_64453 ) ) ( ON ?auto_64449 ?auto_64455 ) ( not ( = ?auto_64449 ?auto_64455 ) ) ( not ( = ?auto_64450 ?auto_64455 ) ) ( not ( = ?auto_64451 ?auto_64455 ) ) ( not ( = ?auto_64452 ?auto_64455 ) ) ( not ( = ?auto_64454 ?auto_64455 ) ) ( not ( = ?auto_64453 ?auto_64455 ) ) ( ON ?auto_64450 ?auto_64449 ) ( ON-TABLE ?auto_64455 ) ( ON ?auto_64451 ?auto_64450 ) ( ON ?auto_64452 ?auto_64451 ) ( ON ?auto_64454 ?auto_64452 ) ( ON ?auto_64453 ?auto_64454 ) ( CLEAR ?auto_64453 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_64455 ?auto_64449 ?auto_64450 ?auto_64451 ?auto_64452 ?auto_64454 )
      ( MAKE-4PILE ?auto_64449 ?auto_64450 ?auto_64451 ?auto_64452 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_64467 - BLOCK
    )
    :vars
    (
      ?auto_64469 - BLOCK
      ?auto_64468 - BLOCK
      ?auto_64470 - BLOCK
      ?auto_64472 - BLOCK
      ?auto_64471 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64469 ?auto_64467 ) ( ON-TABLE ?auto_64467 ) ( not ( = ?auto_64467 ?auto_64469 ) ) ( not ( = ?auto_64467 ?auto_64468 ) ) ( not ( = ?auto_64467 ?auto_64470 ) ) ( not ( = ?auto_64469 ?auto_64468 ) ) ( not ( = ?auto_64469 ?auto_64470 ) ) ( not ( = ?auto_64468 ?auto_64470 ) ) ( ON ?auto_64468 ?auto_64469 ) ( CLEAR ?auto_64468 ) ( HOLDING ?auto_64470 ) ( CLEAR ?auto_64472 ) ( ON-TABLE ?auto_64471 ) ( ON ?auto_64472 ?auto_64471 ) ( not ( = ?auto_64471 ?auto_64472 ) ) ( not ( = ?auto_64471 ?auto_64470 ) ) ( not ( = ?auto_64472 ?auto_64470 ) ) ( not ( = ?auto_64467 ?auto_64472 ) ) ( not ( = ?auto_64467 ?auto_64471 ) ) ( not ( = ?auto_64469 ?auto_64472 ) ) ( not ( = ?auto_64469 ?auto_64471 ) ) ( not ( = ?auto_64468 ?auto_64472 ) ) ( not ( = ?auto_64468 ?auto_64471 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_64471 ?auto_64472 ?auto_64470 )
      ( MAKE-1PILE ?auto_64467 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_64473 - BLOCK
    )
    :vars
    (
      ?auto_64478 - BLOCK
      ?auto_64474 - BLOCK
      ?auto_64475 - BLOCK
      ?auto_64477 - BLOCK
      ?auto_64476 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64478 ?auto_64473 ) ( ON-TABLE ?auto_64473 ) ( not ( = ?auto_64473 ?auto_64478 ) ) ( not ( = ?auto_64473 ?auto_64474 ) ) ( not ( = ?auto_64473 ?auto_64475 ) ) ( not ( = ?auto_64478 ?auto_64474 ) ) ( not ( = ?auto_64478 ?auto_64475 ) ) ( not ( = ?auto_64474 ?auto_64475 ) ) ( ON ?auto_64474 ?auto_64478 ) ( CLEAR ?auto_64477 ) ( ON-TABLE ?auto_64476 ) ( ON ?auto_64477 ?auto_64476 ) ( not ( = ?auto_64476 ?auto_64477 ) ) ( not ( = ?auto_64476 ?auto_64475 ) ) ( not ( = ?auto_64477 ?auto_64475 ) ) ( not ( = ?auto_64473 ?auto_64477 ) ) ( not ( = ?auto_64473 ?auto_64476 ) ) ( not ( = ?auto_64478 ?auto_64477 ) ) ( not ( = ?auto_64478 ?auto_64476 ) ) ( not ( = ?auto_64474 ?auto_64477 ) ) ( not ( = ?auto_64474 ?auto_64476 ) ) ( ON ?auto_64475 ?auto_64474 ) ( CLEAR ?auto_64475 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_64473 ?auto_64478 ?auto_64474 )
      ( MAKE-1PILE ?auto_64473 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_64479 - BLOCK
    )
    :vars
    (
      ?auto_64480 - BLOCK
      ?auto_64481 - BLOCK
      ?auto_64483 - BLOCK
      ?auto_64484 - BLOCK
      ?auto_64482 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64480 ?auto_64479 ) ( ON-TABLE ?auto_64479 ) ( not ( = ?auto_64479 ?auto_64480 ) ) ( not ( = ?auto_64479 ?auto_64481 ) ) ( not ( = ?auto_64479 ?auto_64483 ) ) ( not ( = ?auto_64480 ?auto_64481 ) ) ( not ( = ?auto_64480 ?auto_64483 ) ) ( not ( = ?auto_64481 ?auto_64483 ) ) ( ON ?auto_64481 ?auto_64480 ) ( ON-TABLE ?auto_64484 ) ( not ( = ?auto_64484 ?auto_64482 ) ) ( not ( = ?auto_64484 ?auto_64483 ) ) ( not ( = ?auto_64482 ?auto_64483 ) ) ( not ( = ?auto_64479 ?auto_64482 ) ) ( not ( = ?auto_64479 ?auto_64484 ) ) ( not ( = ?auto_64480 ?auto_64482 ) ) ( not ( = ?auto_64480 ?auto_64484 ) ) ( not ( = ?auto_64481 ?auto_64482 ) ) ( not ( = ?auto_64481 ?auto_64484 ) ) ( ON ?auto_64483 ?auto_64481 ) ( CLEAR ?auto_64483 ) ( HOLDING ?auto_64482 ) ( CLEAR ?auto_64484 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_64484 ?auto_64482 )
      ( MAKE-1PILE ?auto_64479 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_64485 - BLOCK
    )
    :vars
    (
      ?auto_64490 - BLOCK
      ?auto_64487 - BLOCK
      ?auto_64486 - BLOCK
      ?auto_64489 - BLOCK
      ?auto_64488 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64490 ?auto_64485 ) ( ON-TABLE ?auto_64485 ) ( not ( = ?auto_64485 ?auto_64490 ) ) ( not ( = ?auto_64485 ?auto_64487 ) ) ( not ( = ?auto_64485 ?auto_64486 ) ) ( not ( = ?auto_64490 ?auto_64487 ) ) ( not ( = ?auto_64490 ?auto_64486 ) ) ( not ( = ?auto_64487 ?auto_64486 ) ) ( ON ?auto_64487 ?auto_64490 ) ( ON-TABLE ?auto_64489 ) ( not ( = ?auto_64489 ?auto_64488 ) ) ( not ( = ?auto_64489 ?auto_64486 ) ) ( not ( = ?auto_64488 ?auto_64486 ) ) ( not ( = ?auto_64485 ?auto_64488 ) ) ( not ( = ?auto_64485 ?auto_64489 ) ) ( not ( = ?auto_64490 ?auto_64488 ) ) ( not ( = ?auto_64490 ?auto_64489 ) ) ( not ( = ?auto_64487 ?auto_64488 ) ) ( not ( = ?auto_64487 ?auto_64489 ) ) ( ON ?auto_64486 ?auto_64487 ) ( CLEAR ?auto_64489 ) ( ON ?auto_64488 ?auto_64486 ) ( CLEAR ?auto_64488 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_64485 ?auto_64490 ?auto_64487 ?auto_64486 )
      ( MAKE-1PILE ?auto_64485 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_64491 - BLOCK
    )
    :vars
    (
      ?auto_64496 - BLOCK
      ?auto_64495 - BLOCK
      ?auto_64493 - BLOCK
      ?auto_64494 - BLOCK
      ?auto_64492 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64496 ?auto_64491 ) ( ON-TABLE ?auto_64491 ) ( not ( = ?auto_64491 ?auto_64496 ) ) ( not ( = ?auto_64491 ?auto_64495 ) ) ( not ( = ?auto_64491 ?auto_64493 ) ) ( not ( = ?auto_64496 ?auto_64495 ) ) ( not ( = ?auto_64496 ?auto_64493 ) ) ( not ( = ?auto_64495 ?auto_64493 ) ) ( ON ?auto_64495 ?auto_64496 ) ( not ( = ?auto_64494 ?auto_64492 ) ) ( not ( = ?auto_64494 ?auto_64493 ) ) ( not ( = ?auto_64492 ?auto_64493 ) ) ( not ( = ?auto_64491 ?auto_64492 ) ) ( not ( = ?auto_64491 ?auto_64494 ) ) ( not ( = ?auto_64496 ?auto_64492 ) ) ( not ( = ?auto_64496 ?auto_64494 ) ) ( not ( = ?auto_64495 ?auto_64492 ) ) ( not ( = ?auto_64495 ?auto_64494 ) ) ( ON ?auto_64493 ?auto_64495 ) ( ON ?auto_64492 ?auto_64493 ) ( CLEAR ?auto_64492 ) ( HOLDING ?auto_64494 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_64494 )
      ( MAKE-1PILE ?auto_64491 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_64504 - BLOCK
    )
    :vars
    (
      ?auto_64505 - BLOCK
      ?auto_64508 - BLOCK
      ?auto_64506 - BLOCK
      ?auto_64507 - BLOCK
      ?auto_64509 - BLOCK
      ?auto_64510 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64505 ?auto_64504 ) ( ON-TABLE ?auto_64504 ) ( not ( = ?auto_64504 ?auto_64505 ) ) ( not ( = ?auto_64504 ?auto_64508 ) ) ( not ( = ?auto_64504 ?auto_64506 ) ) ( not ( = ?auto_64505 ?auto_64508 ) ) ( not ( = ?auto_64505 ?auto_64506 ) ) ( not ( = ?auto_64508 ?auto_64506 ) ) ( ON ?auto_64508 ?auto_64505 ) ( not ( = ?auto_64507 ?auto_64509 ) ) ( not ( = ?auto_64507 ?auto_64506 ) ) ( not ( = ?auto_64509 ?auto_64506 ) ) ( not ( = ?auto_64504 ?auto_64509 ) ) ( not ( = ?auto_64504 ?auto_64507 ) ) ( not ( = ?auto_64505 ?auto_64509 ) ) ( not ( = ?auto_64505 ?auto_64507 ) ) ( not ( = ?auto_64508 ?auto_64509 ) ) ( not ( = ?auto_64508 ?auto_64507 ) ) ( ON ?auto_64506 ?auto_64508 ) ( ON ?auto_64509 ?auto_64506 ) ( CLEAR ?auto_64509 ) ( ON ?auto_64507 ?auto_64510 ) ( CLEAR ?auto_64507 ) ( HAND-EMPTY ) ( not ( = ?auto_64504 ?auto_64510 ) ) ( not ( = ?auto_64505 ?auto_64510 ) ) ( not ( = ?auto_64508 ?auto_64510 ) ) ( not ( = ?auto_64506 ?auto_64510 ) ) ( not ( = ?auto_64507 ?auto_64510 ) ) ( not ( = ?auto_64509 ?auto_64510 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_64507 ?auto_64510 )
      ( MAKE-1PILE ?auto_64504 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_64511 - BLOCK
    )
    :vars
    (
      ?auto_64515 - BLOCK
      ?auto_64516 - BLOCK
      ?auto_64517 - BLOCK
      ?auto_64513 - BLOCK
      ?auto_64514 - BLOCK
      ?auto_64512 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64515 ?auto_64511 ) ( ON-TABLE ?auto_64511 ) ( not ( = ?auto_64511 ?auto_64515 ) ) ( not ( = ?auto_64511 ?auto_64516 ) ) ( not ( = ?auto_64511 ?auto_64517 ) ) ( not ( = ?auto_64515 ?auto_64516 ) ) ( not ( = ?auto_64515 ?auto_64517 ) ) ( not ( = ?auto_64516 ?auto_64517 ) ) ( ON ?auto_64516 ?auto_64515 ) ( not ( = ?auto_64513 ?auto_64514 ) ) ( not ( = ?auto_64513 ?auto_64517 ) ) ( not ( = ?auto_64514 ?auto_64517 ) ) ( not ( = ?auto_64511 ?auto_64514 ) ) ( not ( = ?auto_64511 ?auto_64513 ) ) ( not ( = ?auto_64515 ?auto_64514 ) ) ( not ( = ?auto_64515 ?auto_64513 ) ) ( not ( = ?auto_64516 ?auto_64514 ) ) ( not ( = ?auto_64516 ?auto_64513 ) ) ( ON ?auto_64517 ?auto_64516 ) ( ON ?auto_64513 ?auto_64512 ) ( CLEAR ?auto_64513 ) ( not ( = ?auto_64511 ?auto_64512 ) ) ( not ( = ?auto_64515 ?auto_64512 ) ) ( not ( = ?auto_64516 ?auto_64512 ) ) ( not ( = ?auto_64517 ?auto_64512 ) ) ( not ( = ?auto_64513 ?auto_64512 ) ) ( not ( = ?auto_64514 ?auto_64512 ) ) ( HOLDING ?auto_64514 ) ( CLEAR ?auto_64517 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_64511 ?auto_64515 ?auto_64516 ?auto_64517 ?auto_64514 )
      ( MAKE-1PILE ?auto_64511 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_64518 - BLOCK
    )
    :vars
    (
      ?auto_64521 - BLOCK
      ?auto_64524 - BLOCK
      ?auto_64519 - BLOCK
      ?auto_64520 - BLOCK
      ?auto_64523 - BLOCK
      ?auto_64522 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_64521 ?auto_64518 ) ( ON-TABLE ?auto_64518 ) ( not ( = ?auto_64518 ?auto_64521 ) ) ( not ( = ?auto_64518 ?auto_64524 ) ) ( not ( = ?auto_64518 ?auto_64519 ) ) ( not ( = ?auto_64521 ?auto_64524 ) ) ( not ( = ?auto_64521 ?auto_64519 ) ) ( not ( = ?auto_64524 ?auto_64519 ) ) ( ON ?auto_64524 ?auto_64521 ) ( not ( = ?auto_64520 ?auto_64523 ) ) ( not ( = ?auto_64520 ?auto_64519 ) ) ( not ( = ?auto_64523 ?auto_64519 ) ) ( not ( = ?auto_64518 ?auto_64523 ) ) ( not ( = ?auto_64518 ?auto_64520 ) ) ( not ( = ?auto_64521 ?auto_64523 ) ) ( not ( = ?auto_64521 ?auto_64520 ) ) ( not ( = ?auto_64524 ?auto_64523 ) ) ( not ( = ?auto_64524 ?auto_64520 ) ) ( ON ?auto_64519 ?auto_64524 ) ( ON ?auto_64520 ?auto_64522 ) ( not ( = ?auto_64518 ?auto_64522 ) ) ( not ( = ?auto_64521 ?auto_64522 ) ) ( not ( = ?auto_64524 ?auto_64522 ) ) ( not ( = ?auto_64519 ?auto_64522 ) ) ( not ( = ?auto_64520 ?auto_64522 ) ) ( not ( = ?auto_64523 ?auto_64522 ) ) ( CLEAR ?auto_64519 ) ( ON ?auto_64523 ?auto_64520 ) ( CLEAR ?auto_64523 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_64522 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_64522 ?auto_64520 )
      ( MAKE-1PILE ?auto_64518 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_64558 - BLOCK
      ?auto_64559 - BLOCK
      ?auto_64560 - BLOCK
      ?auto_64561 - BLOCK
      ?auto_64562 - BLOCK
    )
    :vars
    (
      ?auto_64563 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_64558 ) ( ON ?auto_64559 ?auto_64558 ) ( ON ?auto_64560 ?auto_64559 ) ( not ( = ?auto_64558 ?auto_64559 ) ) ( not ( = ?auto_64558 ?auto_64560 ) ) ( not ( = ?auto_64558 ?auto_64561 ) ) ( not ( = ?auto_64558 ?auto_64562 ) ) ( not ( = ?auto_64559 ?auto_64560 ) ) ( not ( = ?auto_64559 ?auto_64561 ) ) ( not ( = ?auto_64559 ?auto_64562 ) ) ( not ( = ?auto_64560 ?auto_64561 ) ) ( not ( = ?auto_64560 ?auto_64562 ) ) ( not ( = ?auto_64561 ?auto_64562 ) ) ( ON ?auto_64562 ?auto_64563 ) ( not ( = ?auto_64558 ?auto_64563 ) ) ( not ( = ?auto_64559 ?auto_64563 ) ) ( not ( = ?auto_64560 ?auto_64563 ) ) ( not ( = ?auto_64561 ?auto_64563 ) ) ( not ( = ?auto_64562 ?auto_64563 ) ) ( CLEAR ?auto_64560 ) ( ON ?auto_64561 ?auto_64562 ) ( CLEAR ?auto_64561 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_64563 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_64563 ?auto_64562 )
      ( MAKE-5PILE ?auto_64558 ?auto_64559 ?auto_64560 ?auto_64561 ?auto_64562 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_64564 - BLOCK
      ?auto_64565 - BLOCK
      ?auto_64566 - BLOCK
      ?auto_64567 - BLOCK
      ?auto_64568 - BLOCK
    )
    :vars
    (
      ?auto_64569 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_64564 ) ( ON ?auto_64565 ?auto_64564 ) ( not ( = ?auto_64564 ?auto_64565 ) ) ( not ( = ?auto_64564 ?auto_64566 ) ) ( not ( = ?auto_64564 ?auto_64567 ) ) ( not ( = ?auto_64564 ?auto_64568 ) ) ( not ( = ?auto_64565 ?auto_64566 ) ) ( not ( = ?auto_64565 ?auto_64567 ) ) ( not ( = ?auto_64565 ?auto_64568 ) ) ( not ( = ?auto_64566 ?auto_64567 ) ) ( not ( = ?auto_64566 ?auto_64568 ) ) ( not ( = ?auto_64567 ?auto_64568 ) ) ( ON ?auto_64568 ?auto_64569 ) ( not ( = ?auto_64564 ?auto_64569 ) ) ( not ( = ?auto_64565 ?auto_64569 ) ) ( not ( = ?auto_64566 ?auto_64569 ) ) ( not ( = ?auto_64567 ?auto_64569 ) ) ( not ( = ?auto_64568 ?auto_64569 ) ) ( ON ?auto_64567 ?auto_64568 ) ( CLEAR ?auto_64567 ) ( ON-TABLE ?auto_64569 ) ( HOLDING ?auto_64566 ) ( CLEAR ?auto_64565 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_64564 ?auto_64565 ?auto_64566 )
      ( MAKE-5PILE ?auto_64564 ?auto_64565 ?auto_64566 ?auto_64567 ?auto_64568 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_64570 - BLOCK
      ?auto_64571 - BLOCK
      ?auto_64572 - BLOCK
      ?auto_64573 - BLOCK
      ?auto_64574 - BLOCK
    )
    :vars
    (
      ?auto_64575 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_64570 ) ( ON ?auto_64571 ?auto_64570 ) ( not ( = ?auto_64570 ?auto_64571 ) ) ( not ( = ?auto_64570 ?auto_64572 ) ) ( not ( = ?auto_64570 ?auto_64573 ) ) ( not ( = ?auto_64570 ?auto_64574 ) ) ( not ( = ?auto_64571 ?auto_64572 ) ) ( not ( = ?auto_64571 ?auto_64573 ) ) ( not ( = ?auto_64571 ?auto_64574 ) ) ( not ( = ?auto_64572 ?auto_64573 ) ) ( not ( = ?auto_64572 ?auto_64574 ) ) ( not ( = ?auto_64573 ?auto_64574 ) ) ( ON ?auto_64574 ?auto_64575 ) ( not ( = ?auto_64570 ?auto_64575 ) ) ( not ( = ?auto_64571 ?auto_64575 ) ) ( not ( = ?auto_64572 ?auto_64575 ) ) ( not ( = ?auto_64573 ?auto_64575 ) ) ( not ( = ?auto_64574 ?auto_64575 ) ) ( ON ?auto_64573 ?auto_64574 ) ( ON-TABLE ?auto_64575 ) ( CLEAR ?auto_64571 ) ( ON ?auto_64572 ?auto_64573 ) ( CLEAR ?auto_64572 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_64575 ?auto_64574 ?auto_64573 )
      ( MAKE-5PILE ?auto_64570 ?auto_64571 ?auto_64572 ?auto_64573 ?auto_64574 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_64576 - BLOCK
      ?auto_64577 - BLOCK
      ?auto_64578 - BLOCK
      ?auto_64579 - BLOCK
      ?auto_64580 - BLOCK
    )
    :vars
    (
      ?auto_64581 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_64576 ) ( not ( = ?auto_64576 ?auto_64577 ) ) ( not ( = ?auto_64576 ?auto_64578 ) ) ( not ( = ?auto_64576 ?auto_64579 ) ) ( not ( = ?auto_64576 ?auto_64580 ) ) ( not ( = ?auto_64577 ?auto_64578 ) ) ( not ( = ?auto_64577 ?auto_64579 ) ) ( not ( = ?auto_64577 ?auto_64580 ) ) ( not ( = ?auto_64578 ?auto_64579 ) ) ( not ( = ?auto_64578 ?auto_64580 ) ) ( not ( = ?auto_64579 ?auto_64580 ) ) ( ON ?auto_64580 ?auto_64581 ) ( not ( = ?auto_64576 ?auto_64581 ) ) ( not ( = ?auto_64577 ?auto_64581 ) ) ( not ( = ?auto_64578 ?auto_64581 ) ) ( not ( = ?auto_64579 ?auto_64581 ) ) ( not ( = ?auto_64580 ?auto_64581 ) ) ( ON ?auto_64579 ?auto_64580 ) ( ON-TABLE ?auto_64581 ) ( ON ?auto_64578 ?auto_64579 ) ( CLEAR ?auto_64578 ) ( HOLDING ?auto_64577 ) ( CLEAR ?auto_64576 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_64576 ?auto_64577 )
      ( MAKE-5PILE ?auto_64576 ?auto_64577 ?auto_64578 ?auto_64579 ?auto_64580 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_64582 - BLOCK
      ?auto_64583 - BLOCK
      ?auto_64584 - BLOCK
      ?auto_64585 - BLOCK
      ?auto_64586 - BLOCK
    )
    :vars
    (
      ?auto_64587 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_64582 ) ( not ( = ?auto_64582 ?auto_64583 ) ) ( not ( = ?auto_64582 ?auto_64584 ) ) ( not ( = ?auto_64582 ?auto_64585 ) ) ( not ( = ?auto_64582 ?auto_64586 ) ) ( not ( = ?auto_64583 ?auto_64584 ) ) ( not ( = ?auto_64583 ?auto_64585 ) ) ( not ( = ?auto_64583 ?auto_64586 ) ) ( not ( = ?auto_64584 ?auto_64585 ) ) ( not ( = ?auto_64584 ?auto_64586 ) ) ( not ( = ?auto_64585 ?auto_64586 ) ) ( ON ?auto_64586 ?auto_64587 ) ( not ( = ?auto_64582 ?auto_64587 ) ) ( not ( = ?auto_64583 ?auto_64587 ) ) ( not ( = ?auto_64584 ?auto_64587 ) ) ( not ( = ?auto_64585 ?auto_64587 ) ) ( not ( = ?auto_64586 ?auto_64587 ) ) ( ON ?auto_64585 ?auto_64586 ) ( ON-TABLE ?auto_64587 ) ( ON ?auto_64584 ?auto_64585 ) ( CLEAR ?auto_64582 ) ( ON ?auto_64583 ?auto_64584 ) ( CLEAR ?auto_64583 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_64587 ?auto_64586 ?auto_64585 ?auto_64584 )
      ( MAKE-5PILE ?auto_64582 ?auto_64583 ?auto_64584 ?auto_64585 ?auto_64586 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_64588 - BLOCK
      ?auto_64589 - BLOCK
      ?auto_64590 - BLOCK
      ?auto_64591 - BLOCK
      ?auto_64592 - BLOCK
    )
    :vars
    (
      ?auto_64593 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64588 ?auto_64589 ) ) ( not ( = ?auto_64588 ?auto_64590 ) ) ( not ( = ?auto_64588 ?auto_64591 ) ) ( not ( = ?auto_64588 ?auto_64592 ) ) ( not ( = ?auto_64589 ?auto_64590 ) ) ( not ( = ?auto_64589 ?auto_64591 ) ) ( not ( = ?auto_64589 ?auto_64592 ) ) ( not ( = ?auto_64590 ?auto_64591 ) ) ( not ( = ?auto_64590 ?auto_64592 ) ) ( not ( = ?auto_64591 ?auto_64592 ) ) ( ON ?auto_64592 ?auto_64593 ) ( not ( = ?auto_64588 ?auto_64593 ) ) ( not ( = ?auto_64589 ?auto_64593 ) ) ( not ( = ?auto_64590 ?auto_64593 ) ) ( not ( = ?auto_64591 ?auto_64593 ) ) ( not ( = ?auto_64592 ?auto_64593 ) ) ( ON ?auto_64591 ?auto_64592 ) ( ON-TABLE ?auto_64593 ) ( ON ?auto_64590 ?auto_64591 ) ( ON ?auto_64589 ?auto_64590 ) ( CLEAR ?auto_64589 ) ( HOLDING ?auto_64588 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_64588 )
      ( MAKE-5PILE ?auto_64588 ?auto_64589 ?auto_64590 ?auto_64591 ?auto_64592 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_64594 - BLOCK
      ?auto_64595 - BLOCK
      ?auto_64596 - BLOCK
      ?auto_64597 - BLOCK
      ?auto_64598 - BLOCK
    )
    :vars
    (
      ?auto_64599 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64594 ?auto_64595 ) ) ( not ( = ?auto_64594 ?auto_64596 ) ) ( not ( = ?auto_64594 ?auto_64597 ) ) ( not ( = ?auto_64594 ?auto_64598 ) ) ( not ( = ?auto_64595 ?auto_64596 ) ) ( not ( = ?auto_64595 ?auto_64597 ) ) ( not ( = ?auto_64595 ?auto_64598 ) ) ( not ( = ?auto_64596 ?auto_64597 ) ) ( not ( = ?auto_64596 ?auto_64598 ) ) ( not ( = ?auto_64597 ?auto_64598 ) ) ( ON ?auto_64598 ?auto_64599 ) ( not ( = ?auto_64594 ?auto_64599 ) ) ( not ( = ?auto_64595 ?auto_64599 ) ) ( not ( = ?auto_64596 ?auto_64599 ) ) ( not ( = ?auto_64597 ?auto_64599 ) ) ( not ( = ?auto_64598 ?auto_64599 ) ) ( ON ?auto_64597 ?auto_64598 ) ( ON-TABLE ?auto_64599 ) ( ON ?auto_64596 ?auto_64597 ) ( ON ?auto_64595 ?auto_64596 ) ( ON ?auto_64594 ?auto_64595 ) ( CLEAR ?auto_64594 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_64599 ?auto_64598 ?auto_64597 ?auto_64596 ?auto_64595 )
      ( MAKE-5PILE ?auto_64594 ?auto_64595 ?auto_64596 ?auto_64597 ?auto_64598 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_64605 - BLOCK
      ?auto_64606 - BLOCK
      ?auto_64607 - BLOCK
      ?auto_64608 - BLOCK
      ?auto_64609 - BLOCK
    )
    :vars
    (
      ?auto_64610 - BLOCK
      ?auto_64611 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64605 ?auto_64606 ) ) ( not ( = ?auto_64605 ?auto_64607 ) ) ( not ( = ?auto_64605 ?auto_64608 ) ) ( not ( = ?auto_64605 ?auto_64609 ) ) ( not ( = ?auto_64606 ?auto_64607 ) ) ( not ( = ?auto_64606 ?auto_64608 ) ) ( not ( = ?auto_64606 ?auto_64609 ) ) ( not ( = ?auto_64607 ?auto_64608 ) ) ( not ( = ?auto_64607 ?auto_64609 ) ) ( not ( = ?auto_64608 ?auto_64609 ) ) ( ON ?auto_64609 ?auto_64610 ) ( not ( = ?auto_64605 ?auto_64610 ) ) ( not ( = ?auto_64606 ?auto_64610 ) ) ( not ( = ?auto_64607 ?auto_64610 ) ) ( not ( = ?auto_64608 ?auto_64610 ) ) ( not ( = ?auto_64609 ?auto_64610 ) ) ( ON ?auto_64608 ?auto_64609 ) ( ON-TABLE ?auto_64610 ) ( ON ?auto_64607 ?auto_64608 ) ( ON ?auto_64606 ?auto_64607 ) ( CLEAR ?auto_64606 ) ( ON ?auto_64605 ?auto_64611 ) ( CLEAR ?auto_64605 ) ( HAND-EMPTY ) ( not ( = ?auto_64605 ?auto_64611 ) ) ( not ( = ?auto_64606 ?auto_64611 ) ) ( not ( = ?auto_64607 ?auto_64611 ) ) ( not ( = ?auto_64608 ?auto_64611 ) ) ( not ( = ?auto_64609 ?auto_64611 ) ) ( not ( = ?auto_64610 ?auto_64611 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_64605 ?auto_64611 )
      ( MAKE-5PILE ?auto_64605 ?auto_64606 ?auto_64607 ?auto_64608 ?auto_64609 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_64612 - BLOCK
      ?auto_64613 - BLOCK
      ?auto_64614 - BLOCK
      ?auto_64615 - BLOCK
      ?auto_64616 - BLOCK
    )
    :vars
    (
      ?auto_64618 - BLOCK
      ?auto_64617 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64612 ?auto_64613 ) ) ( not ( = ?auto_64612 ?auto_64614 ) ) ( not ( = ?auto_64612 ?auto_64615 ) ) ( not ( = ?auto_64612 ?auto_64616 ) ) ( not ( = ?auto_64613 ?auto_64614 ) ) ( not ( = ?auto_64613 ?auto_64615 ) ) ( not ( = ?auto_64613 ?auto_64616 ) ) ( not ( = ?auto_64614 ?auto_64615 ) ) ( not ( = ?auto_64614 ?auto_64616 ) ) ( not ( = ?auto_64615 ?auto_64616 ) ) ( ON ?auto_64616 ?auto_64618 ) ( not ( = ?auto_64612 ?auto_64618 ) ) ( not ( = ?auto_64613 ?auto_64618 ) ) ( not ( = ?auto_64614 ?auto_64618 ) ) ( not ( = ?auto_64615 ?auto_64618 ) ) ( not ( = ?auto_64616 ?auto_64618 ) ) ( ON ?auto_64615 ?auto_64616 ) ( ON-TABLE ?auto_64618 ) ( ON ?auto_64614 ?auto_64615 ) ( ON ?auto_64612 ?auto_64617 ) ( CLEAR ?auto_64612 ) ( not ( = ?auto_64612 ?auto_64617 ) ) ( not ( = ?auto_64613 ?auto_64617 ) ) ( not ( = ?auto_64614 ?auto_64617 ) ) ( not ( = ?auto_64615 ?auto_64617 ) ) ( not ( = ?auto_64616 ?auto_64617 ) ) ( not ( = ?auto_64618 ?auto_64617 ) ) ( HOLDING ?auto_64613 ) ( CLEAR ?auto_64614 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_64618 ?auto_64616 ?auto_64615 ?auto_64614 ?auto_64613 )
      ( MAKE-5PILE ?auto_64612 ?auto_64613 ?auto_64614 ?auto_64615 ?auto_64616 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_64619 - BLOCK
      ?auto_64620 - BLOCK
      ?auto_64621 - BLOCK
      ?auto_64622 - BLOCK
      ?auto_64623 - BLOCK
    )
    :vars
    (
      ?auto_64624 - BLOCK
      ?auto_64625 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64619 ?auto_64620 ) ) ( not ( = ?auto_64619 ?auto_64621 ) ) ( not ( = ?auto_64619 ?auto_64622 ) ) ( not ( = ?auto_64619 ?auto_64623 ) ) ( not ( = ?auto_64620 ?auto_64621 ) ) ( not ( = ?auto_64620 ?auto_64622 ) ) ( not ( = ?auto_64620 ?auto_64623 ) ) ( not ( = ?auto_64621 ?auto_64622 ) ) ( not ( = ?auto_64621 ?auto_64623 ) ) ( not ( = ?auto_64622 ?auto_64623 ) ) ( ON ?auto_64623 ?auto_64624 ) ( not ( = ?auto_64619 ?auto_64624 ) ) ( not ( = ?auto_64620 ?auto_64624 ) ) ( not ( = ?auto_64621 ?auto_64624 ) ) ( not ( = ?auto_64622 ?auto_64624 ) ) ( not ( = ?auto_64623 ?auto_64624 ) ) ( ON ?auto_64622 ?auto_64623 ) ( ON-TABLE ?auto_64624 ) ( ON ?auto_64621 ?auto_64622 ) ( ON ?auto_64619 ?auto_64625 ) ( not ( = ?auto_64619 ?auto_64625 ) ) ( not ( = ?auto_64620 ?auto_64625 ) ) ( not ( = ?auto_64621 ?auto_64625 ) ) ( not ( = ?auto_64622 ?auto_64625 ) ) ( not ( = ?auto_64623 ?auto_64625 ) ) ( not ( = ?auto_64624 ?auto_64625 ) ) ( CLEAR ?auto_64621 ) ( ON ?auto_64620 ?auto_64619 ) ( CLEAR ?auto_64620 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_64625 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_64625 ?auto_64619 )
      ( MAKE-5PILE ?auto_64619 ?auto_64620 ?auto_64621 ?auto_64622 ?auto_64623 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_64626 - BLOCK
      ?auto_64627 - BLOCK
      ?auto_64628 - BLOCK
      ?auto_64629 - BLOCK
      ?auto_64630 - BLOCK
    )
    :vars
    (
      ?auto_64632 - BLOCK
      ?auto_64631 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64626 ?auto_64627 ) ) ( not ( = ?auto_64626 ?auto_64628 ) ) ( not ( = ?auto_64626 ?auto_64629 ) ) ( not ( = ?auto_64626 ?auto_64630 ) ) ( not ( = ?auto_64627 ?auto_64628 ) ) ( not ( = ?auto_64627 ?auto_64629 ) ) ( not ( = ?auto_64627 ?auto_64630 ) ) ( not ( = ?auto_64628 ?auto_64629 ) ) ( not ( = ?auto_64628 ?auto_64630 ) ) ( not ( = ?auto_64629 ?auto_64630 ) ) ( ON ?auto_64630 ?auto_64632 ) ( not ( = ?auto_64626 ?auto_64632 ) ) ( not ( = ?auto_64627 ?auto_64632 ) ) ( not ( = ?auto_64628 ?auto_64632 ) ) ( not ( = ?auto_64629 ?auto_64632 ) ) ( not ( = ?auto_64630 ?auto_64632 ) ) ( ON ?auto_64629 ?auto_64630 ) ( ON-TABLE ?auto_64632 ) ( ON ?auto_64626 ?auto_64631 ) ( not ( = ?auto_64626 ?auto_64631 ) ) ( not ( = ?auto_64627 ?auto_64631 ) ) ( not ( = ?auto_64628 ?auto_64631 ) ) ( not ( = ?auto_64629 ?auto_64631 ) ) ( not ( = ?auto_64630 ?auto_64631 ) ) ( not ( = ?auto_64632 ?auto_64631 ) ) ( ON ?auto_64627 ?auto_64626 ) ( CLEAR ?auto_64627 ) ( ON-TABLE ?auto_64631 ) ( HOLDING ?auto_64628 ) ( CLEAR ?auto_64629 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_64632 ?auto_64630 ?auto_64629 ?auto_64628 )
      ( MAKE-5PILE ?auto_64626 ?auto_64627 ?auto_64628 ?auto_64629 ?auto_64630 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_64633 - BLOCK
      ?auto_64634 - BLOCK
      ?auto_64635 - BLOCK
      ?auto_64636 - BLOCK
      ?auto_64637 - BLOCK
    )
    :vars
    (
      ?auto_64638 - BLOCK
      ?auto_64639 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64633 ?auto_64634 ) ) ( not ( = ?auto_64633 ?auto_64635 ) ) ( not ( = ?auto_64633 ?auto_64636 ) ) ( not ( = ?auto_64633 ?auto_64637 ) ) ( not ( = ?auto_64634 ?auto_64635 ) ) ( not ( = ?auto_64634 ?auto_64636 ) ) ( not ( = ?auto_64634 ?auto_64637 ) ) ( not ( = ?auto_64635 ?auto_64636 ) ) ( not ( = ?auto_64635 ?auto_64637 ) ) ( not ( = ?auto_64636 ?auto_64637 ) ) ( ON ?auto_64637 ?auto_64638 ) ( not ( = ?auto_64633 ?auto_64638 ) ) ( not ( = ?auto_64634 ?auto_64638 ) ) ( not ( = ?auto_64635 ?auto_64638 ) ) ( not ( = ?auto_64636 ?auto_64638 ) ) ( not ( = ?auto_64637 ?auto_64638 ) ) ( ON ?auto_64636 ?auto_64637 ) ( ON-TABLE ?auto_64638 ) ( ON ?auto_64633 ?auto_64639 ) ( not ( = ?auto_64633 ?auto_64639 ) ) ( not ( = ?auto_64634 ?auto_64639 ) ) ( not ( = ?auto_64635 ?auto_64639 ) ) ( not ( = ?auto_64636 ?auto_64639 ) ) ( not ( = ?auto_64637 ?auto_64639 ) ) ( not ( = ?auto_64638 ?auto_64639 ) ) ( ON ?auto_64634 ?auto_64633 ) ( ON-TABLE ?auto_64639 ) ( CLEAR ?auto_64636 ) ( ON ?auto_64635 ?auto_64634 ) ( CLEAR ?auto_64635 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_64639 ?auto_64633 ?auto_64634 )
      ( MAKE-5PILE ?auto_64633 ?auto_64634 ?auto_64635 ?auto_64636 ?auto_64637 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_64640 - BLOCK
      ?auto_64641 - BLOCK
      ?auto_64642 - BLOCK
      ?auto_64643 - BLOCK
      ?auto_64644 - BLOCK
    )
    :vars
    (
      ?auto_64646 - BLOCK
      ?auto_64645 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64640 ?auto_64641 ) ) ( not ( = ?auto_64640 ?auto_64642 ) ) ( not ( = ?auto_64640 ?auto_64643 ) ) ( not ( = ?auto_64640 ?auto_64644 ) ) ( not ( = ?auto_64641 ?auto_64642 ) ) ( not ( = ?auto_64641 ?auto_64643 ) ) ( not ( = ?auto_64641 ?auto_64644 ) ) ( not ( = ?auto_64642 ?auto_64643 ) ) ( not ( = ?auto_64642 ?auto_64644 ) ) ( not ( = ?auto_64643 ?auto_64644 ) ) ( ON ?auto_64644 ?auto_64646 ) ( not ( = ?auto_64640 ?auto_64646 ) ) ( not ( = ?auto_64641 ?auto_64646 ) ) ( not ( = ?auto_64642 ?auto_64646 ) ) ( not ( = ?auto_64643 ?auto_64646 ) ) ( not ( = ?auto_64644 ?auto_64646 ) ) ( ON-TABLE ?auto_64646 ) ( ON ?auto_64640 ?auto_64645 ) ( not ( = ?auto_64640 ?auto_64645 ) ) ( not ( = ?auto_64641 ?auto_64645 ) ) ( not ( = ?auto_64642 ?auto_64645 ) ) ( not ( = ?auto_64643 ?auto_64645 ) ) ( not ( = ?auto_64644 ?auto_64645 ) ) ( not ( = ?auto_64646 ?auto_64645 ) ) ( ON ?auto_64641 ?auto_64640 ) ( ON-TABLE ?auto_64645 ) ( ON ?auto_64642 ?auto_64641 ) ( CLEAR ?auto_64642 ) ( HOLDING ?auto_64643 ) ( CLEAR ?auto_64644 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_64646 ?auto_64644 ?auto_64643 )
      ( MAKE-5PILE ?auto_64640 ?auto_64641 ?auto_64642 ?auto_64643 ?auto_64644 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_64647 - BLOCK
      ?auto_64648 - BLOCK
      ?auto_64649 - BLOCK
      ?auto_64650 - BLOCK
      ?auto_64651 - BLOCK
    )
    :vars
    (
      ?auto_64653 - BLOCK
      ?auto_64652 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64647 ?auto_64648 ) ) ( not ( = ?auto_64647 ?auto_64649 ) ) ( not ( = ?auto_64647 ?auto_64650 ) ) ( not ( = ?auto_64647 ?auto_64651 ) ) ( not ( = ?auto_64648 ?auto_64649 ) ) ( not ( = ?auto_64648 ?auto_64650 ) ) ( not ( = ?auto_64648 ?auto_64651 ) ) ( not ( = ?auto_64649 ?auto_64650 ) ) ( not ( = ?auto_64649 ?auto_64651 ) ) ( not ( = ?auto_64650 ?auto_64651 ) ) ( ON ?auto_64651 ?auto_64653 ) ( not ( = ?auto_64647 ?auto_64653 ) ) ( not ( = ?auto_64648 ?auto_64653 ) ) ( not ( = ?auto_64649 ?auto_64653 ) ) ( not ( = ?auto_64650 ?auto_64653 ) ) ( not ( = ?auto_64651 ?auto_64653 ) ) ( ON-TABLE ?auto_64653 ) ( ON ?auto_64647 ?auto_64652 ) ( not ( = ?auto_64647 ?auto_64652 ) ) ( not ( = ?auto_64648 ?auto_64652 ) ) ( not ( = ?auto_64649 ?auto_64652 ) ) ( not ( = ?auto_64650 ?auto_64652 ) ) ( not ( = ?auto_64651 ?auto_64652 ) ) ( not ( = ?auto_64653 ?auto_64652 ) ) ( ON ?auto_64648 ?auto_64647 ) ( ON-TABLE ?auto_64652 ) ( ON ?auto_64649 ?auto_64648 ) ( CLEAR ?auto_64651 ) ( ON ?auto_64650 ?auto_64649 ) ( CLEAR ?auto_64650 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_64652 ?auto_64647 ?auto_64648 ?auto_64649 )
      ( MAKE-5PILE ?auto_64647 ?auto_64648 ?auto_64649 ?auto_64650 ?auto_64651 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_64654 - BLOCK
      ?auto_64655 - BLOCK
      ?auto_64656 - BLOCK
      ?auto_64657 - BLOCK
      ?auto_64658 - BLOCK
    )
    :vars
    (
      ?auto_64660 - BLOCK
      ?auto_64659 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64654 ?auto_64655 ) ) ( not ( = ?auto_64654 ?auto_64656 ) ) ( not ( = ?auto_64654 ?auto_64657 ) ) ( not ( = ?auto_64654 ?auto_64658 ) ) ( not ( = ?auto_64655 ?auto_64656 ) ) ( not ( = ?auto_64655 ?auto_64657 ) ) ( not ( = ?auto_64655 ?auto_64658 ) ) ( not ( = ?auto_64656 ?auto_64657 ) ) ( not ( = ?auto_64656 ?auto_64658 ) ) ( not ( = ?auto_64657 ?auto_64658 ) ) ( not ( = ?auto_64654 ?auto_64660 ) ) ( not ( = ?auto_64655 ?auto_64660 ) ) ( not ( = ?auto_64656 ?auto_64660 ) ) ( not ( = ?auto_64657 ?auto_64660 ) ) ( not ( = ?auto_64658 ?auto_64660 ) ) ( ON-TABLE ?auto_64660 ) ( ON ?auto_64654 ?auto_64659 ) ( not ( = ?auto_64654 ?auto_64659 ) ) ( not ( = ?auto_64655 ?auto_64659 ) ) ( not ( = ?auto_64656 ?auto_64659 ) ) ( not ( = ?auto_64657 ?auto_64659 ) ) ( not ( = ?auto_64658 ?auto_64659 ) ) ( not ( = ?auto_64660 ?auto_64659 ) ) ( ON ?auto_64655 ?auto_64654 ) ( ON-TABLE ?auto_64659 ) ( ON ?auto_64656 ?auto_64655 ) ( ON ?auto_64657 ?auto_64656 ) ( CLEAR ?auto_64657 ) ( HOLDING ?auto_64658 ) ( CLEAR ?auto_64660 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_64660 ?auto_64658 )
      ( MAKE-5PILE ?auto_64654 ?auto_64655 ?auto_64656 ?auto_64657 ?auto_64658 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_64661 - BLOCK
      ?auto_64662 - BLOCK
      ?auto_64663 - BLOCK
      ?auto_64664 - BLOCK
      ?auto_64665 - BLOCK
    )
    :vars
    (
      ?auto_64666 - BLOCK
      ?auto_64667 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64661 ?auto_64662 ) ) ( not ( = ?auto_64661 ?auto_64663 ) ) ( not ( = ?auto_64661 ?auto_64664 ) ) ( not ( = ?auto_64661 ?auto_64665 ) ) ( not ( = ?auto_64662 ?auto_64663 ) ) ( not ( = ?auto_64662 ?auto_64664 ) ) ( not ( = ?auto_64662 ?auto_64665 ) ) ( not ( = ?auto_64663 ?auto_64664 ) ) ( not ( = ?auto_64663 ?auto_64665 ) ) ( not ( = ?auto_64664 ?auto_64665 ) ) ( not ( = ?auto_64661 ?auto_64666 ) ) ( not ( = ?auto_64662 ?auto_64666 ) ) ( not ( = ?auto_64663 ?auto_64666 ) ) ( not ( = ?auto_64664 ?auto_64666 ) ) ( not ( = ?auto_64665 ?auto_64666 ) ) ( ON-TABLE ?auto_64666 ) ( ON ?auto_64661 ?auto_64667 ) ( not ( = ?auto_64661 ?auto_64667 ) ) ( not ( = ?auto_64662 ?auto_64667 ) ) ( not ( = ?auto_64663 ?auto_64667 ) ) ( not ( = ?auto_64664 ?auto_64667 ) ) ( not ( = ?auto_64665 ?auto_64667 ) ) ( not ( = ?auto_64666 ?auto_64667 ) ) ( ON ?auto_64662 ?auto_64661 ) ( ON-TABLE ?auto_64667 ) ( ON ?auto_64663 ?auto_64662 ) ( ON ?auto_64664 ?auto_64663 ) ( CLEAR ?auto_64666 ) ( ON ?auto_64665 ?auto_64664 ) ( CLEAR ?auto_64665 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_64667 ?auto_64661 ?auto_64662 ?auto_64663 ?auto_64664 )
      ( MAKE-5PILE ?auto_64661 ?auto_64662 ?auto_64663 ?auto_64664 ?auto_64665 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_64668 - BLOCK
      ?auto_64669 - BLOCK
      ?auto_64670 - BLOCK
      ?auto_64671 - BLOCK
      ?auto_64672 - BLOCK
    )
    :vars
    (
      ?auto_64673 - BLOCK
      ?auto_64674 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64668 ?auto_64669 ) ) ( not ( = ?auto_64668 ?auto_64670 ) ) ( not ( = ?auto_64668 ?auto_64671 ) ) ( not ( = ?auto_64668 ?auto_64672 ) ) ( not ( = ?auto_64669 ?auto_64670 ) ) ( not ( = ?auto_64669 ?auto_64671 ) ) ( not ( = ?auto_64669 ?auto_64672 ) ) ( not ( = ?auto_64670 ?auto_64671 ) ) ( not ( = ?auto_64670 ?auto_64672 ) ) ( not ( = ?auto_64671 ?auto_64672 ) ) ( not ( = ?auto_64668 ?auto_64673 ) ) ( not ( = ?auto_64669 ?auto_64673 ) ) ( not ( = ?auto_64670 ?auto_64673 ) ) ( not ( = ?auto_64671 ?auto_64673 ) ) ( not ( = ?auto_64672 ?auto_64673 ) ) ( ON ?auto_64668 ?auto_64674 ) ( not ( = ?auto_64668 ?auto_64674 ) ) ( not ( = ?auto_64669 ?auto_64674 ) ) ( not ( = ?auto_64670 ?auto_64674 ) ) ( not ( = ?auto_64671 ?auto_64674 ) ) ( not ( = ?auto_64672 ?auto_64674 ) ) ( not ( = ?auto_64673 ?auto_64674 ) ) ( ON ?auto_64669 ?auto_64668 ) ( ON-TABLE ?auto_64674 ) ( ON ?auto_64670 ?auto_64669 ) ( ON ?auto_64671 ?auto_64670 ) ( ON ?auto_64672 ?auto_64671 ) ( CLEAR ?auto_64672 ) ( HOLDING ?auto_64673 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_64673 )
      ( MAKE-5PILE ?auto_64668 ?auto_64669 ?auto_64670 ?auto_64671 ?auto_64672 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_64675 - BLOCK
      ?auto_64676 - BLOCK
      ?auto_64677 - BLOCK
      ?auto_64678 - BLOCK
      ?auto_64679 - BLOCK
    )
    :vars
    (
      ?auto_64680 - BLOCK
      ?auto_64681 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64675 ?auto_64676 ) ) ( not ( = ?auto_64675 ?auto_64677 ) ) ( not ( = ?auto_64675 ?auto_64678 ) ) ( not ( = ?auto_64675 ?auto_64679 ) ) ( not ( = ?auto_64676 ?auto_64677 ) ) ( not ( = ?auto_64676 ?auto_64678 ) ) ( not ( = ?auto_64676 ?auto_64679 ) ) ( not ( = ?auto_64677 ?auto_64678 ) ) ( not ( = ?auto_64677 ?auto_64679 ) ) ( not ( = ?auto_64678 ?auto_64679 ) ) ( not ( = ?auto_64675 ?auto_64680 ) ) ( not ( = ?auto_64676 ?auto_64680 ) ) ( not ( = ?auto_64677 ?auto_64680 ) ) ( not ( = ?auto_64678 ?auto_64680 ) ) ( not ( = ?auto_64679 ?auto_64680 ) ) ( ON ?auto_64675 ?auto_64681 ) ( not ( = ?auto_64675 ?auto_64681 ) ) ( not ( = ?auto_64676 ?auto_64681 ) ) ( not ( = ?auto_64677 ?auto_64681 ) ) ( not ( = ?auto_64678 ?auto_64681 ) ) ( not ( = ?auto_64679 ?auto_64681 ) ) ( not ( = ?auto_64680 ?auto_64681 ) ) ( ON ?auto_64676 ?auto_64675 ) ( ON-TABLE ?auto_64681 ) ( ON ?auto_64677 ?auto_64676 ) ( ON ?auto_64678 ?auto_64677 ) ( ON ?auto_64679 ?auto_64678 ) ( ON ?auto_64680 ?auto_64679 ) ( CLEAR ?auto_64680 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_64681 ?auto_64675 ?auto_64676 ?auto_64677 ?auto_64678 ?auto_64679 )
      ( MAKE-5PILE ?auto_64675 ?auto_64676 ?auto_64677 ?auto_64678 ?auto_64679 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_64694 - BLOCK
      ?auto_64695 - BLOCK
      ?auto_64696 - BLOCK
      ?auto_64697 - BLOCK
      ?auto_64698 - BLOCK
      ?auto_64699 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_64698 ) ( ON-TABLE ?auto_64694 ) ( ON ?auto_64695 ?auto_64694 ) ( ON ?auto_64696 ?auto_64695 ) ( ON ?auto_64697 ?auto_64696 ) ( ON ?auto_64698 ?auto_64697 ) ( not ( = ?auto_64694 ?auto_64695 ) ) ( not ( = ?auto_64694 ?auto_64696 ) ) ( not ( = ?auto_64694 ?auto_64697 ) ) ( not ( = ?auto_64694 ?auto_64698 ) ) ( not ( = ?auto_64694 ?auto_64699 ) ) ( not ( = ?auto_64695 ?auto_64696 ) ) ( not ( = ?auto_64695 ?auto_64697 ) ) ( not ( = ?auto_64695 ?auto_64698 ) ) ( not ( = ?auto_64695 ?auto_64699 ) ) ( not ( = ?auto_64696 ?auto_64697 ) ) ( not ( = ?auto_64696 ?auto_64698 ) ) ( not ( = ?auto_64696 ?auto_64699 ) ) ( not ( = ?auto_64697 ?auto_64698 ) ) ( not ( = ?auto_64697 ?auto_64699 ) ) ( not ( = ?auto_64698 ?auto_64699 ) ) ( ON-TABLE ?auto_64699 ) ( CLEAR ?auto_64699 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_64699 )
      ( MAKE-6PILE ?auto_64694 ?auto_64695 ?auto_64696 ?auto_64697 ?auto_64698 ?auto_64699 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_64700 - BLOCK
      ?auto_64701 - BLOCK
      ?auto_64702 - BLOCK
      ?auto_64703 - BLOCK
      ?auto_64704 - BLOCK
      ?auto_64705 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_64700 ) ( ON ?auto_64701 ?auto_64700 ) ( ON ?auto_64702 ?auto_64701 ) ( ON ?auto_64703 ?auto_64702 ) ( not ( = ?auto_64700 ?auto_64701 ) ) ( not ( = ?auto_64700 ?auto_64702 ) ) ( not ( = ?auto_64700 ?auto_64703 ) ) ( not ( = ?auto_64700 ?auto_64704 ) ) ( not ( = ?auto_64700 ?auto_64705 ) ) ( not ( = ?auto_64701 ?auto_64702 ) ) ( not ( = ?auto_64701 ?auto_64703 ) ) ( not ( = ?auto_64701 ?auto_64704 ) ) ( not ( = ?auto_64701 ?auto_64705 ) ) ( not ( = ?auto_64702 ?auto_64703 ) ) ( not ( = ?auto_64702 ?auto_64704 ) ) ( not ( = ?auto_64702 ?auto_64705 ) ) ( not ( = ?auto_64703 ?auto_64704 ) ) ( not ( = ?auto_64703 ?auto_64705 ) ) ( not ( = ?auto_64704 ?auto_64705 ) ) ( ON-TABLE ?auto_64705 ) ( CLEAR ?auto_64705 ) ( HOLDING ?auto_64704 ) ( CLEAR ?auto_64703 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_64700 ?auto_64701 ?auto_64702 ?auto_64703 ?auto_64704 )
      ( MAKE-6PILE ?auto_64700 ?auto_64701 ?auto_64702 ?auto_64703 ?auto_64704 ?auto_64705 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_64706 - BLOCK
      ?auto_64707 - BLOCK
      ?auto_64708 - BLOCK
      ?auto_64709 - BLOCK
      ?auto_64710 - BLOCK
      ?auto_64711 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_64706 ) ( ON ?auto_64707 ?auto_64706 ) ( ON ?auto_64708 ?auto_64707 ) ( ON ?auto_64709 ?auto_64708 ) ( not ( = ?auto_64706 ?auto_64707 ) ) ( not ( = ?auto_64706 ?auto_64708 ) ) ( not ( = ?auto_64706 ?auto_64709 ) ) ( not ( = ?auto_64706 ?auto_64710 ) ) ( not ( = ?auto_64706 ?auto_64711 ) ) ( not ( = ?auto_64707 ?auto_64708 ) ) ( not ( = ?auto_64707 ?auto_64709 ) ) ( not ( = ?auto_64707 ?auto_64710 ) ) ( not ( = ?auto_64707 ?auto_64711 ) ) ( not ( = ?auto_64708 ?auto_64709 ) ) ( not ( = ?auto_64708 ?auto_64710 ) ) ( not ( = ?auto_64708 ?auto_64711 ) ) ( not ( = ?auto_64709 ?auto_64710 ) ) ( not ( = ?auto_64709 ?auto_64711 ) ) ( not ( = ?auto_64710 ?auto_64711 ) ) ( ON-TABLE ?auto_64711 ) ( CLEAR ?auto_64709 ) ( ON ?auto_64710 ?auto_64711 ) ( CLEAR ?auto_64710 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_64711 )
      ( MAKE-6PILE ?auto_64706 ?auto_64707 ?auto_64708 ?auto_64709 ?auto_64710 ?auto_64711 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_64712 - BLOCK
      ?auto_64713 - BLOCK
      ?auto_64714 - BLOCK
      ?auto_64715 - BLOCK
      ?auto_64716 - BLOCK
      ?auto_64717 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_64712 ) ( ON ?auto_64713 ?auto_64712 ) ( ON ?auto_64714 ?auto_64713 ) ( not ( = ?auto_64712 ?auto_64713 ) ) ( not ( = ?auto_64712 ?auto_64714 ) ) ( not ( = ?auto_64712 ?auto_64715 ) ) ( not ( = ?auto_64712 ?auto_64716 ) ) ( not ( = ?auto_64712 ?auto_64717 ) ) ( not ( = ?auto_64713 ?auto_64714 ) ) ( not ( = ?auto_64713 ?auto_64715 ) ) ( not ( = ?auto_64713 ?auto_64716 ) ) ( not ( = ?auto_64713 ?auto_64717 ) ) ( not ( = ?auto_64714 ?auto_64715 ) ) ( not ( = ?auto_64714 ?auto_64716 ) ) ( not ( = ?auto_64714 ?auto_64717 ) ) ( not ( = ?auto_64715 ?auto_64716 ) ) ( not ( = ?auto_64715 ?auto_64717 ) ) ( not ( = ?auto_64716 ?auto_64717 ) ) ( ON-TABLE ?auto_64717 ) ( ON ?auto_64716 ?auto_64717 ) ( CLEAR ?auto_64716 ) ( HOLDING ?auto_64715 ) ( CLEAR ?auto_64714 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_64712 ?auto_64713 ?auto_64714 ?auto_64715 )
      ( MAKE-6PILE ?auto_64712 ?auto_64713 ?auto_64714 ?auto_64715 ?auto_64716 ?auto_64717 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_64718 - BLOCK
      ?auto_64719 - BLOCK
      ?auto_64720 - BLOCK
      ?auto_64721 - BLOCK
      ?auto_64722 - BLOCK
      ?auto_64723 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_64718 ) ( ON ?auto_64719 ?auto_64718 ) ( ON ?auto_64720 ?auto_64719 ) ( not ( = ?auto_64718 ?auto_64719 ) ) ( not ( = ?auto_64718 ?auto_64720 ) ) ( not ( = ?auto_64718 ?auto_64721 ) ) ( not ( = ?auto_64718 ?auto_64722 ) ) ( not ( = ?auto_64718 ?auto_64723 ) ) ( not ( = ?auto_64719 ?auto_64720 ) ) ( not ( = ?auto_64719 ?auto_64721 ) ) ( not ( = ?auto_64719 ?auto_64722 ) ) ( not ( = ?auto_64719 ?auto_64723 ) ) ( not ( = ?auto_64720 ?auto_64721 ) ) ( not ( = ?auto_64720 ?auto_64722 ) ) ( not ( = ?auto_64720 ?auto_64723 ) ) ( not ( = ?auto_64721 ?auto_64722 ) ) ( not ( = ?auto_64721 ?auto_64723 ) ) ( not ( = ?auto_64722 ?auto_64723 ) ) ( ON-TABLE ?auto_64723 ) ( ON ?auto_64722 ?auto_64723 ) ( CLEAR ?auto_64720 ) ( ON ?auto_64721 ?auto_64722 ) ( CLEAR ?auto_64721 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_64723 ?auto_64722 )
      ( MAKE-6PILE ?auto_64718 ?auto_64719 ?auto_64720 ?auto_64721 ?auto_64722 ?auto_64723 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_64724 - BLOCK
      ?auto_64725 - BLOCK
      ?auto_64726 - BLOCK
      ?auto_64727 - BLOCK
      ?auto_64728 - BLOCK
      ?auto_64729 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_64724 ) ( ON ?auto_64725 ?auto_64724 ) ( not ( = ?auto_64724 ?auto_64725 ) ) ( not ( = ?auto_64724 ?auto_64726 ) ) ( not ( = ?auto_64724 ?auto_64727 ) ) ( not ( = ?auto_64724 ?auto_64728 ) ) ( not ( = ?auto_64724 ?auto_64729 ) ) ( not ( = ?auto_64725 ?auto_64726 ) ) ( not ( = ?auto_64725 ?auto_64727 ) ) ( not ( = ?auto_64725 ?auto_64728 ) ) ( not ( = ?auto_64725 ?auto_64729 ) ) ( not ( = ?auto_64726 ?auto_64727 ) ) ( not ( = ?auto_64726 ?auto_64728 ) ) ( not ( = ?auto_64726 ?auto_64729 ) ) ( not ( = ?auto_64727 ?auto_64728 ) ) ( not ( = ?auto_64727 ?auto_64729 ) ) ( not ( = ?auto_64728 ?auto_64729 ) ) ( ON-TABLE ?auto_64729 ) ( ON ?auto_64728 ?auto_64729 ) ( ON ?auto_64727 ?auto_64728 ) ( CLEAR ?auto_64727 ) ( HOLDING ?auto_64726 ) ( CLEAR ?auto_64725 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_64724 ?auto_64725 ?auto_64726 )
      ( MAKE-6PILE ?auto_64724 ?auto_64725 ?auto_64726 ?auto_64727 ?auto_64728 ?auto_64729 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_64730 - BLOCK
      ?auto_64731 - BLOCK
      ?auto_64732 - BLOCK
      ?auto_64733 - BLOCK
      ?auto_64734 - BLOCK
      ?auto_64735 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_64730 ) ( ON ?auto_64731 ?auto_64730 ) ( not ( = ?auto_64730 ?auto_64731 ) ) ( not ( = ?auto_64730 ?auto_64732 ) ) ( not ( = ?auto_64730 ?auto_64733 ) ) ( not ( = ?auto_64730 ?auto_64734 ) ) ( not ( = ?auto_64730 ?auto_64735 ) ) ( not ( = ?auto_64731 ?auto_64732 ) ) ( not ( = ?auto_64731 ?auto_64733 ) ) ( not ( = ?auto_64731 ?auto_64734 ) ) ( not ( = ?auto_64731 ?auto_64735 ) ) ( not ( = ?auto_64732 ?auto_64733 ) ) ( not ( = ?auto_64732 ?auto_64734 ) ) ( not ( = ?auto_64732 ?auto_64735 ) ) ( not ( = ?auto_64733 ?auto_64734 ) ) ( not ( = ?auto_64733 ?auto_64735 ) ) ( not ( = ?auto_64734 ?auto_64735 ) ) ( ON-TABLE ?auto_64735 ) ( ON ?auto_64734 ?auto_64735 ) ( ON ?auto_64733 ?auto_64734 ) ( CLEAR ?auto_64731 ) ( ON ?auto_64732 ?auto_64733 ) ( CLEAR ?auto_64732 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_64735 ?auto_64734 ?auto_64733 )
      ( MAKE-6PILE ?auto_64730 ?auto_64731 ?auto_64732 ?auto_64733 ?auto_64734 ?auto_64735 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_64736 - BLOCK
      ?auto_64737 - BLOCK
      ?auto_64738 - BLOCK
      ?auto_64739 - BLOCK
      ?auto_64740 - BLOCK
      ?auto_64741 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_64736 ) ( not ( = ?auto_64736 ?auto_64737 ) ) ( not ( = ?auto_64736 ?auto_64738 ) ) ( not ( = ?auto_64736 ?auto_64739 ) ) ( not ( = ?auto_64736 ?auto_64740 ) ) ( not ( = ?auto_64736 ?auto_64741 ) ) ( not ( = ?auto_64737 ?auto_64738 ) ) ( not ( = ?auto_64737 ?auto_64739 ) ) ( not ( = ?auto_64737 ?auto_64740 ) ) ( not ( = ?auto_64737 ?auto_64741 ) ) ( not ( = ?auto_64738 ?auto_64739 ) ) ( not ( = ?auto_64738 ?auto_64740 ) ) ( not ( = ?auto_64738 ?auto_64741 ) ) ( not ( = ?auto_64739 ?auto_64740 ) ) ( not ( = ?auto_64739 ?auto_64741 ) ) ( not ( = ?auto_64740 ?auto_64741 ) ) ( ON-TABLE ?auto_64741 ) ( ON ?auto_64740 ?auto_64741 ) ( ON ?auto_64739 ?auto_64740 ) ( ON ?auto_64738 ?auto_64739 ) ( CLEAR ?auto_64738 ) ( HOLDING ?auto_64737 ) ( CLEAR ?auto_64736 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_64736 ?auto_64737 )
      ( MAKE-6PILE ?auto_64736 ?auto_64737 ?auto_64738 ?auto_64739 ?auto_64740 ?auto_64741 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_64742 - BLOCK
      ?auto_64743 - BLOCK
      ?auto_64744 - BLOCK
      ?auto_64745 - BLOCK
      ?auto_64746 - BLOCK
      ?auto_64747 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_64742 ) ( not ( = ?auto_64742 ?auto_64743 ) ) ( not ( = ?auto_64742 ?auto_64744 ) ) ( not ( = ?auto_64742 ?auto_64745 ) ) ( not ( = ?auto_64742 ?auto_64746 ) ) ( not ( = ?auto_64742 ?auto_64747 ) ) ( not ( = ?auto_64743 ?auto_64744 ) ) ( not ( = ?auto_64743 ?auto_64745 ) ) ( not ( = ?auto_64743 ?auto_64746 ) ) ( not ( = ?auto_64743 ?auto_64747 ) ) ( not ( = ?auto_64744 ?auto_64745 ) ) ( not ( = ?auto_64744 ?auto_64746 ) ) ( not ( = ?auto_64744 ?auto_64747 ) ) ( not ( = ?auto_64745 ?auto_64746 ) ) ( not ( = ?auto_64745 ?auto_64747 ) ) ( not ( = ?auto_64746 ?auto_64747 ) ) ( ON-TABLE ?auto_64747 ) ( ON ?auto_64746 ?auto_64747 ) ( ON ?auto_64745 ?auto_64746 ) ( ON ?auto_64744 ?auto_64745 ) ( CLEAR ?auto_64742 ) ( ON ?auto_64743 ?auto_64744 ) ( CLEAR ?auto_64743 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_64747 ?auto_64746 ?auto_64745 ?auto_64744 )
      ( MAKE-6PILE ?auto_64742 ?auto_64743 ?auto_64744 ?auto_64745 ?auto_64746 ?auto_64747 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_64748 - BLOCK
      ?auto_64749 - BLOCK
      ?auto_64750 - BLOCK
      ?auto_64751 - BLOCK
      ?auto_64752 - BLOCK
      ?auto_64753 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64748 ?auto_64749 ) ) ( not ( = ?auto_64748 ?auto_64750 ) ) ( not ( = ?auto_64748 ?auto_64751 ) ) ( not ( = ?auto_64748 ?auto_64752 ) ) ( not ( = ?auto_64748 ?auto_64753 ) ) ( not ( = ?auto_64749 ?auto_64750 ) ) ( not ( = ?auto_64749 ?auto_64751 ) ) ( not ( = ?auto_64749 ?auto_64752 ) ) ( not ( = ?auto_64749 ?auto_64753 ) ) ( not ( = ?auto_64750 ?auto_64751 ) ) ( not ( = ?auto_64750 ?auto_64752 ) ) ( not ( = ?auto_64750 ?auto_64753 ) ) ( not ( = ?auto_64751 ?auto_64752 ) ) ( not ( = ?auto_64751 ?auto_64753 ) ) ( not ( = ?auto_64752 ?auto_64753 ) ) ( ON-TABLE ?auto_64753 ) ( ON ?auto_64752 ?auto_64753 ) ( ON ?auto_64751 ?auto_64752 ) ( ON ?auto_64750 ?auto_64751 ) ( ON ?auto_64749 ?auto_64750 ) ( CLEAR ?auto_64749 ) ( HOLDING ?auto_64748 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_64748 )
      ( MAKE-6PILE ?auto_64748 ?auto_64749 ?auto_64750 ?auto_64751 ?auto_64752 ?auto_64753 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_64754 - BLOCK
      ?auto_64755 - BLOCK
      ?auto_64756 - BLOCK
      ?auto_64757 - BLOCK
      ?auto_64758 - BLOCK
      ?auto_64759 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64754 ?auto_64755 ) ) ( not ( = ?auto_64754 ?auto_64756 ) ) ( not ( = ?auto_64754 ?auto_64757 ) ) ( not ( = ?auto_64754 ?auto_64758 ) ) ( not ( = ?auto_64754 ?auto_64759 ) ) ( not ( = ?auto_64755 ?auto_64756 ) ) ( not ( = ?auto_64755 ?auto_64757 ) ) ( not ( = ?auto_64755 ?auto_64758 ) ) ( not ( = ?auto_64755 ?auto_64759 ) ) ( not ( = ?auto_64756 ?auto_64757 ) ) ( not ( = ?auto_64756 ?auto_64758 ) ) ( not ( = ?auto_64756 ?auto_64759 ) ) ( not ( = ?auto_64757 ?auto_64758 ) ) ( not ( = ?auto_64757 ?auto_64759 ) ) ( not ( = ?auto_64758 ?auto_64759 ) ) ( ON-TABLE ?auto_64759 ) ( ON ?auto_64758 ?auto_64759 ) ( ON ?auto_64757 ?auto_64758 ) ( ON ?auto_64756 ?auto_64757 ) ( ON ?auto_64755 ?auto_64756 ) ( ON ?auto_64754 ?auto_64755 ) ( CLEAR ?auto_64754 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_64759 ?auto_64758 ?auto_64757 ?auto_64756 ?auto_64755 )
      ( MAKE-6PILE ?auto_64754 ?auto_64755 ?auto_64756 ?auto_64757 ?auto_64758 ?auto_64759 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_64766 - BLOCK
      ?auto_64767 - BLOCK
      ?auto_64768 - BLOCK
      ?auto_64769 - BLOCK
      ?auto_64770 - BLOCK
      ?auto_64771 - BLOCK
    )
    :vars
    (
      ?auto_64772 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64766 ?auto_64767 ) ) ( not ( = ?auto_64766 ?auto_64768 ) ) ( not ( = ?auto_64766 ?auto_64769 ) ) ( not ( = ?auto_64766 ?auto_64770 ) ) ( not ( = ?auto_64766 ?auto_64771 ) ) ( not ( = ?auto_64767 ?auto_64768 ) ) ( not ( = ?auto_64767 ?auto_64769 ) ) ( not ( = ?auto_64767 ?auto_64770 ) ) ( not ( = ?auto_64767 ?auto_64771 ) ) ( not ( = ?auto_64768 ?auto_64769 ) ) ( not ( = ?auto_64768 ?auto_64770 ) ) ( not ( = ?auto_64768 ?auto_64771 ) ) ( not ( = ?auto_64769 ?auto_64770 ) ) ( not ( = ?auto_64769 ?auto_64771 ) ) ( not ( = ?auto_64770 ?auto_64771 ) ) ( ON-TABLE ?auto_64771 ) ( ON ?auto_64770 ?auto_64771 ) ( ON ?auto_64769 ?auto_64770 ) ( ON ?auto_64768 ?auto_64769 ) ( ON ?auto_64767 ?auto_64768 ) ( CLEAR ?auto_64767 ) ( ON ?auto_64766 ?auto_64772 ) ( CLEAR ?auto_64766 ) ( HAND-EMPTY ) ( not ( = ?auto_64766 ?auto_64772 ) ) ( not ( = ?auto_64767 ?auto_64772 ) ) ( not ( = ?auto_64768 ?auto_64772 ) ) ( not ( = ?auto_64769 ?auto_64772 ) ) ( not ( = ?auto_64770 ?auto_64772 ) ) ( not ( = ?auto_64771 ?auto_64772 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_64766 ?auto_64772 )
      ( MAKE-6PILE ?auto_64766 ?auto_64767 ?auto_64768 ?auto_64769 ?auto_64770 ?auto_64771 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_64773 - BLOCK
      ?auto_64774 - BLOCK
      ?auto_64775 - BLOCK
      ?auto_64776 - BLOCK
      ?auto_64777 - BLOCK
      ?auto_64778 - BLOCK
    )
    :vars
    (
      ?auto_64779 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64773 ?auto_64774 ) ) ( not ( = ?auto_64773 ?auto_64775 ) ) ( not ( = ?auto_64773 ?auto_64776 ) ) ( not ( = ?auto_64773 ?auto_64777 ) ) ( not ( = ?auto_64773 ?auto_64778 ) ) ( not ( = ?auto_64774 ?auto_64775 ) ) ( not ( = ?auto_64774 ?auto_64776 ) ) ( not ( = ?auto_64774 ?auto_64777 ) ) ( not ( = ?auto_64774 ?auto_64778 ) ) ( not ( = ?auto_64775 ?auto_64776 ) ) ( not ( = ?auto_64775 ?auto_64777 ) ) ( not ( = ?auto_64775 ?auto_64778 ) ) ( not ( = ?auto_64776 ?auto_64777 ) ) ( not ( = ?auto_64776 ?auto_64778 ) ) ( not ( = ?auto_64777 ?auto_64778 ) ) ( ON-TABLE ?auto_64778 ) ( ON ?auto_64777 ?auto_64778 ) ( ON ?auto_64776 ?auto_64777 ) ( ON ?auto_64775 ?auto_64776 ) ( ON ?auto_64773 ?auto_64779 ) ( CLEAR ?auto_64773 ) ( not ( = ?auto_64773 ?auto_64779 ) ) ( not ( = ?auto_64774 ?auto_64779 ) ) ( not ( = ?auto_64775 ?auto_64779 ) ) ( not ( = ?auto_64776 ?auto_64779 ) ) ( not ( = ?auto_64777 ?auto_64779 ) ) ( not ( = ?auto_64778 ?auto_64779 ) ) ( HOLDING ?auto_64774 ) ( CLEAR ?auto_64775 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_64778 ?auto_64777 ?auto_64776 ?auto_64775 ?auto_64774 )
      ( MAKE-6PILE ?auto_64773 ?auto_64774 ?auto_64775 ?auto_64776 ?auto_64777 ?auto_64778 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_64780 - BLOCK
      ?auto_64781 - BLOCK
      ?auto_64782 - BLOCK
      ?auto_64783 - BLOCK
      ?auto_64784 - BLOCK
      ?auto_64785 - BLOCK
    )
    :vars
    (
      ?auto_64786 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64780 ?auto_64781 ) ) ( not ( = ?auto_64780 ?auto_64782 ) ) ( not ( = ?auto_64780 ?auto_64783 ) ) ( not ( = ?auto_64780 ?auto_64784 ) ) ( not ( = ?auto_64780 ?auto_64785 ) ) ( not ( = ?auto_64781 ?auto_64782 ) ) ( not ( = ?auto_64781 ?auto_64783 ) ) ( not ( = ?auto_64781 ?auto_64784 ) ) ( not ( = ?auto_64781 ?auto_64785 ) ) ( not ( = ?auto_64782 ?auto_64783 ) ) ( not ( = ?auto_64782 ?auto_64784 ) ) ( not ( = ?auto_64782 ?auto_64785 ) ) ( not ( = ?auto_64783 ?auto_64784 ) ) ( not ( = ?auto_64783 ?auto_64785 ) ) ( not ( = ?auto_64784 ?auto_64785 ) ) ( ON-TABLE ?auto_64785 ) ( ON ?auto_64784 ?auto_64785 ) ( ON ?auto_64783 ?auto_64784 ) ( ON ?auto_64782 ?auto_64783 ) ( ON ?auto_64780 ?auto_64786 ) ( not ( = ?auto_64780 ?auto_64786 ) ) ( not ( = ?auto_64781 ?auto_64786 ) ) ( not ( = ?auto_64782 ?auto_64786 ) ) ( not ( = ?auto_64783 ?auto_64786 ) ) ( not ( = ?auto_64784 ?auto_64786 ) ) ( not ( = ?auto_64785 ?auto_64786 ) ) ( CLEAR ?auto_64782 ) ( ON ?auto_64781 ?auto_64780 ) ( CLEAR ?auto_64781 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_64786 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_64786 ?auto_64780 )
      ( MAKE-6PILE ?auto_64780 ?auto_64781 ?auto_64782 ?auto_64783 ?auto_64784 ?auto_64785 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_64787 - BLOCK
      ?auto_64788 - BLOCK
      ?auto_64789 - BLOCK
      ?auto_64790 - BLOCK
      ?auto_64791 - BLOCK
      ?auto_64792 - BLOCK
    )
    :vars
    (
      ?auto_64793 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64787 ?auto_64788 ) ) ( not ( = ?auto_64787 ?auto_64789 ) ) ( not ( = ?auto_64787 ?auto_64790 ) ) ( not ( = ?auto_64787 ?auto_64791 ) ) ( not ( = ?auto_64787 ?auto_64792 ) ) ( not ( = ?auto_64788 ?auto_64789 ) ) ( not ( = ?auto_64788 ?auto_64790 ) ) ( not ( = ?auto_64788 ?auto_64791 ) ) ( not ( = ?auto_64788 ?auto_64792 ) ) ( not ( = ?auto_64789 ?auto_64790 ) ) ( not ( = ?auto_64789 ?auto_64791 ) ) ( not ( = ?auto_64789 ?auto_64792 ) ) ( not ( = ?auto_64790 ?auto_64791 ) ) ( not ( = ?auto_64790 ?auto_64792 ) ) ( not ( = ?auto_64791 ?auto_64792 ) ) ( ON-TABLE ?auto_64792 ) ( ON ?auto_64791 ?auto_64792 ) ( ON ?auto_64790 ?auto_64791 ) ( ON ?auto_64787 ?auto_64793 ) ( not ( = ?auto_64787 ?auto_64793 ) ) ( not ( = ?auto_64788 ?auto_64793 ) ) ( not ( = ?auto_64789 ?auto_64793 ) ) ( not ( = ?auto_64790 ?auto_64793 ) ) ( not ( = ?auto_64791 ?auto_64793 ) ) ( not ( = ?auto_64792 ?auto_64793 ) ) ( ON ?auto_64788 ?auto_64787 ) ( CLEAR ?auto_64788 ) ( ON-TABLE ?auto_64793 ) ( HOLDING ?auto_64789 ) ( CLEAR ?auto_64790 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_64792 ?auto_64791 ?auto_64790 ?auto_64789 )
      ( MAKE-6PILE ?auto_64787 ?auto_64788 ?auto_64789 ?auto_64790 ?auto_64791 ?auto_64792 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_64794 - BLOCK
      ?auto_64795 - BLOCK
      ?auto_64796 - BLOCK
      ?auto_64797 - BLOCK
      ?auto_64798 - BLOCK
      ?auto_64799 - BLOCK
    )
    :vars
    (
      ?auto_64800 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64794 ?auto_64795 ) ) ( not ( = ?auto_64794 ?auto_64796 ) ) ( not ( = ?auto_64794 ?auto_64797 ) ) ( not ( = ?auto_64794 ?auto_64798 ) ) ( not ( = ?auto_64794 ?auto_64799 ) ) ( not ( = ?auto_64795 ?auto_64796 ) ) ( not ( = ?auto_64795 ?auto_64797 ) ) ( not ( = ?auto_64795 ?auto_64798 ) ) ( not ( = ?auto_64795 ?auto_64799 ) ) ( not ( = ?auto_64796 ?auto_64797 ) ) ( not ( = ?auto_64796 ?auto_64798 ) ) ( not ( = ?auto_64796 ?auto_64799 ) ) ( not ( = ?auto_64797 ?auto_64798 ) ) ( not ( = ?auto_64797 ?auto_64799 ) ) ( not ( = ?auto_64798 ?auto_64799 ) ) ( ON-TABLE ?auto_64799 ) ( ON ?auto_64798 ?auto_64799 ) ( ON ?auto_64797 ?auto_64798 ) ( ON ?auto_64794 ?auto_64800 ) ( not ( = ?auto_64794 ?auto_64800 ) ) ( not ( = ?auto_64795 ?auto_64800 ) ) ( not ( = ?auto_64796 ?auto_64800 ) ) ( not ( = ?auto_64797 ?auto_64800 ) ) ( not ( = ?auto_64798 ?auto_64800 ) ) ( not ( = ?auto_64799 ?auto_64800 ) ) ( ON ?auto_64795 ?auto_64794 ) ( ON-TABLE ?auto_64800 ) ( CLEAR ?auto_64797 ) ( ON ?auto_64796 ?auto_64795 ) ( CLEAR ?auto_64796 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_64800 ?auto_64794 ?auto_64795 )
      ( MAKE-6PILE ?auto_64794 ?auto_64795 ?auto_64796 ?auto_64797 ?auto_64798 ?auto_64799 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_64801 - BLOCK
      ?auto_64802 - BLOCK
      ?auto_64803 - BLOCK
      ?auto_64804 - BLOCK
      ?auto_64805 - BLOCK
      ?auto_64806 - BLOCK
    )
    :vars
    (
      ?auto_64807 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64801 ?auto_64802 ) ) ( not ( = ?auto_64801 ?auto_64803 ) ) ( not ( = ?auto_64801 ?auto_64804 ) ) ( not ( = ?auto_64801 ?auto_64805 ) ) ( not ( = ?auto_64801 ?auto_64806 ) ) ( not ( = ?auto_64802 ?auto_64803 ) ) ( not ( = ?auto_64802 ?auto_64804 ) ) ( not ( = ?auto_64802 ?auto_64805 ) ) ( not ( = ?auto_64802 ?auto_64806 ) ) ( not ( = ?auto_64803 ?auto_64804 ) ) ( not ( = ?auto_64803 ?auto_64805 ) ) ( not ( = ?auto_64803 ?auto_64806 ) ) ( not ( = ?auto_64804 ?auto_64805 ) ) ( not ( = ?auto_64804 ?auto_64806 ) ) ( not ( = ?auto_64805 ?auto_64806 ) ) ( ON-TABLE ?auto_64806 ) ( ON ?auto_64805 ?auto_64806 ) ( ON ?auto_64801 ?auto_64807 ) ( not ( = ?auto_64801 ?auto_64807 ) ) ( not ( = ?auto_64802 ?auto_64807 ) ) ( not ( = ?auto_64803 ?auto_64807 ) ) ( not ( = ?auto_64804 ?auto_64807 ) ) ( not ( = ?auto_64805 ?auto_64807 ) ) ( not ( = ?auto_64806 ?auto_64807 ) ) ( ON ?auto_64802 ?auto_64801 ) ( ON-TABLE ?auto_64807 ) ( ON ?auto_64803 ?auto_64802 ) ( CLEAR ?auto_64803 ) ( HOLDING ?auto_64804 ) ( CLEAR ?auto_64805 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_64806 ?auto_64805 ?auto_64804 )
      ( MAKE-6PILE ?auto_64801 ?auto_64802 ?auto_64803 ?auto_64804 ?auto_64805 ?auto_64806 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_64808 - BLOCK
      ?auto_64809 - BLOCK
      ?auto_64810 - BLOCK
      ?auto_64811 - BLOCK
      ?auto_64812 - BLOCK
      ?auto_64813 - BLOCK
    )
    :vars
    (
      ?auto_64814 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64808 ?auto_64809 ) ) ( not ( = ?auto_64808 ?auto_64810 ) ) ( not ( = ?auto_64808 ?auto_64811 ) ) ( not ( = ?auto_64808 ?auto_64812 ) ) ( not ( = ?auto_64808 ?auto_64813 ) ) ( not ( = ?auto_64809 ?auto_64810 ) ) ( not ( = ?auto_64809 ?auto_64811 ) ) ( not ( = ?auto_64809 ?auto_64812 ) ) ( not ( = ?auto_64809 ?auto_64813 ) ) ( not ( = ?auto_64810 ?auto_64811 ) ) ( not ( = ?auto_64810 ?auto_64812 ) ) ( not ( = ?auto_64810 ?auto_64813 ) ) ( not ( = ?auto_64811 ?auto_64812 ) ) ( not ( = ?auto_64811 ?auto_64813 ) ) ( not ( = ?auto_64812 ?auto_64813 ) ) ( ON-TABLE ?auto_64813 ) ( ON ?auto_64812 ?auto_64813 ) ( ON ?auto_64808 ?auto_64814 ) ( not ( = ?auto_64808 ?auto_64814 ) ) ( not ( = ?auto_64809 ?auto_64814 ) ) ( not ( = ?auto_64810 ?auto_64814 ) ) ( not ( = ?auto_64811 ?auto_64814 ) ) ( not ( = ?auto_64812 ?auto_64814 ) ) ( not ( = ?auto_64813 ?auto_64814 ) ) ( ON ?auto_64809 ?auto_64808 ) ( ON-TABLE ?auto_64814 ) ( ON ?auto_64810 ?auto_64809 ) ( CLEAR ?auto_64812 ) ( ON ?auto_64811 ?auto_64810 ) ( CLEAR ?auto_64811 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_64814 ?auto_64808 ?auto_64809 ?auto_64810 )
      ( MAKE-6PILE ?auto_64808 ?auto_64809 ?auto_64810 ?auto_64811 ?auto_64812 ?auto_64813 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_64815 - BLOCK
      ?auto_64816 - BLOCK
      ?auto_64817 - BLOCK
      ?auto_64818 - BLOCK
      ?auto_64819 - BLOCK
      ?auto_64820 - BLOCK
    )
    :vars
    (
      ?auto_64821 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64815 ?auto_64816 ) ) ( not ( = ?auto_64815 ?auto_64817 ) ) ( not ( = ?auto_64815 ?auto_64818 ) ) ( not ( = ?auto_64815 ?auto_64819 ) ) ( not ( = ?auto_64815 ?auto_64820 ) ) ( not ( = ?auto_64816 ?auto_64817 ) ) ( not ( = ?auto_64816 ?auto_64818 ) ) ( not ( = ?auto_64816 ?auto_64819 ) ) ( not ( = ?auto_64816 ?auto_64820 ) ) ( not ( = ?auto_64817 ?auto_64818 ) ) ( not ( = ?auto_64817 ?auto_64819 ) ) ( not ( = ?auto_64817 ?auto_64820 ) ) ( not ( = ?auto_64818 ?auto_64819 ) ) ( not ( = ?auto_64818 ?auto_64820 ) ) ( not ( = ?auto_64819 ?auto_64820 ) ) ( ON-TABLE ?auto_64820 ) ( ON ?auto_64815 ?auto_64821 ) ( not ( = ?auto_64815 ?auto_64821 ) ) ( not ( = ?auto_64816 ?auto_64821 ) ) ( not ( = ?auto_64817 ?auto_64821 ) ) ( not ( = ?auto_64818 ?auto_64821 ) ) ( not ( = ?auto_64819 ?auto_64821 ) ) ( not ( = ?auto_64820 ?auto_64821 ) ) ( ON ?auto_64816 ?auto_64815 ) ( ON-TABLE ?auto_64821 ) ( ON ?auto_64817 ?auto_64816 ) ( ON ?auto_64818 ?auto_64817 ) ( CLEAR ?auto_64818 ) ( HOLDING ?auto_64819 ) ( CLEAR ?auto_64820 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_64820 ?auto_64819 )
      ( MAKE-6PILE ?auto_64815 ?auto_64816 ?auto_64817 ?auto_64818 ?auto_64819 ?auto_64820 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_64822 - BLOCK
      ?auto_64823 - BLOCK
      ?auto_64824 - BLOCK
      ?auto_64825 - BLOCK
      ?auto_64826 - BLOCK
      ?auto_64827 - BLOCK
    )
    :vars
    (
      ?auto_64828 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64822 ?auto_64823 ) ) ( not ( = ?auto_64822 ?auto_64824 ) ) ( not ( = ?auto_64822 ?auto_64825 ) ) ( not ( = ?auto_64822 ?auto_64826 ) ) ( not ( = ?auto_64822 ?auto_64827 ) ) ( not ( = ?auto_64823 ?auto_64824 ) ) ( not ( = ?auto_64823 ?auto_64825 ) ) ( not ( = ?auto_64823 ?auto_64826 ) ) ( not ( = ?auto_64823 ?auto_64827 ) ) ( not ( = ?auto_64824 ?auto_64825 ) ) ( not ( = ?auto_64824 ?auto_64826 ) ) ( not ( = ?auto_64824 ?auto_64827 ) ) ( not ( = ?auto_64825 ?auto_64826 ) ) ( not ( = ?auto_64825 ?auto_64827 ) ) ( not ( = ?auto_64826 ?auto_64827 ) ) ( ON-TABLE ?auto_64827 ) ( ON ?auto_64822 ?auto_64828 ) ( not ( = ?auto_64822 ?auto_64828 ) ) ( not ( = ?auto_64823 ?auto_64828 ) ) ( not ( = ?auto_64824 ?auto_64828 ) ) ( not ( = ?auto_64825 ?auto_64828 ) ) ( not ( = ?auto_64826 ?auto_64828 ) ) ( not ( = ?auto_64827 ?auto_64828 ) ) ( ON ?auto_64823 ?auto_64822 ) ( ON-TABLE ?auto_64828 ) ( ON ?auto_64824 ?auto_64823 ) ( ON ?auto_64825 ?auto_64824 ) ( CLEAR ?auto_64827 ) ( ON ?auto_64826 ?auto_64825 ) ( CLEAR ?auto_64826 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_64828 ?auto_64822 ?auto_64823 ?auto_64824 ?auto_64825 )
      ( MAKE-6PILE ?auto_64822 ?auto_64823 ?auto_64824 ?auto_64825 ?auto_64826 ?auto_64827 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_64829 - BLOCK
      ?auto_64830 - BLOCK
      ?auto_64831 - BLOCK
      ?auto_64832 - BLOCK
      ?auto_64833 - BLOCK
      ?auto_64834 - BLOCK
    )
    :vars
    (
      ?auto_64835 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64829 ?auto_64830 ) ) ( not ( = ?auto_64829 ?auto_64831 ) ) ( not ( = ?auto_64829 ?auto_64832 ) ) ( not ( = ?auto_64829 ?auto_64833 ) ) ( not ( = ?auto_64829 ?auto_64834 ) ) ( not ( = ?auto_64830 ?auto_64831 ) ) ( not ( = ?auto_64830 ?auto_64832 ) ) ( not ( = ?auto_64830 ?auto_64833 ) ) ( not ( = ?auto_64830 ?auto_64834 ) ) ( not ( = ?auto_64831 ?auto_64832 ) ) ( not ( = ?auto_64831 ?auto_64833 ) ) ( not ( = ?auto_64831 ?auto_64834 ) ) ( not ( = ?auto_64832 ?auto_64833 ) ) ( not ( = ?auto_64832 ?auto_64834 ) ) ( not ( = ?auto_64833 ?auto_64834 ) ) ( ON ?auto_64829 ?auto_64835 ) ( not ( = ?auto_64829 ?auto_64835 ) ) ( not ( = ?auto_64830 ?auto_64835 ) ) ( not ( = ?auto_64831 ?auto_64835 ) ) ( not ( = ?auto_64832 ?auto_64835 ) ) ( not ( = ?auto_64833 ?auto_64835 ) ) ( not ( = ?auto_64834 ?auto_64835 ) ) ( ON ?auto_64830 ?auto_64829 ) ( ON-TABLE ?auto_64835 ) ( ON ?auto_64831 ?auto_64830 ) ( ON ?auto_64832 ?auto_64831 ) ( ON ?auto_64833 ?auto_64832 ) ( CLEAR ?auto_64833 ) ( HOLDING ?auto_64834 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_64834 )
      ( MAKE-6PILE ?auto_64829 ?auto_64830 ?auto_64831 ?auto_64832 ?auto_64833 ?auto_64834 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_64836 - BLOCK
      ?auto_64837 - BLOCK
      ?auto_64838 - BLOCK
      ?auto_64839 - BLOCK
      ?auto_64840 - BLOCK
      ?auto_64841 - BLOCK
    )
    :vars
    (
      ?auto_64842 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_64836 ?auto_64837 ) ) ( not ( = ?auto_64836 ?auto_64838 ) ) ( not ( = ?auto_64836 ?auto_64839 ) ) ( not ( = ?auto_64836 ?auto_64840 ) ) ( not ( = ?auto_64836 ?auto_64841 ) ) ( not ( = ?auto_64837 ?auto_64838 ) ) ( not ( = ?auto_64837 ?auto_64839 ) ) ( not ( = ?auto_64837 ?auto_64840 ) ) ( not ( = ?auto_64837 ?auto_64841 ) ) ( not ( = ?auto_64838 ?auto_64839 ) ) ( not ( = ?auto_64838 ?auto_64840 ) ) ( not ( = ?auto_64838 ?auto_64841 ) ) ( not ( = ?auto_64839 ?auto_64840 ) ) ( not ( = ?auto_64839 ?auto_64841 ) ) ( not ( = ?auto_64840 ?auto_64841 ) ) ( ON ?auto_64836 ?auto_64842 ) ( not ( = ?auto_64836 ?auto_64842 ) ) ( not ( = ?auto_64837 ?auto_64842 ) ) ( not ( = ?auto_64838 ?auto_64842 ) ) ( not ( = ?auto_64839 ?auto_64842 ) ) ( not ( = ?auto_64840 ?auto_64842 ) ) ( not ( = ?auto_64841 ?auto_64842 ) ) ( ON ?auto_64837 ?auto_64836 ) ( ON-TABLE ?auto_64842 ) ( ON ?auto_64838 ?auto_64837 ) ( ON ?auto_64839 ?auto_64838 ) ( ON ?auto_64840 ?auto_64839 ) ( ON ?auto_64841 ?auto_64840 ) ( CLEAR ?auto_64841 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_64842 ?auto_64836 ?auto_64837 ?auto_64838 ?auto_64839 ?auto_64840 )
      ( MAKE-6PILE ?auto_64836 ?auto_64837 ?auto_64838 ?auto_64839 ?auto_64840 ?auto_64841 ) )
  )

)

