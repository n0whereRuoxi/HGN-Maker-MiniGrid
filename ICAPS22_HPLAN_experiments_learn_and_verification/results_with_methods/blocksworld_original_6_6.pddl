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
      ?auto_50280 - BLOCK
      ?auto_50281 - BLOCK
      ?auto_50282 - BLOCK
      ?auto_50283 - BLOCK
      ?auto_50284 - BLOCK
      ?auto_50285 - BLOCK
    )
    :vars
    (
      ?auto_50286 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50286 ?auto_50285 ) ( CLEAR ?auto_50286 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_50280 ) ( ON ?auto_50281 ?auto_50280 ) ( ON ?auto_50282 ?auto_50281 ) ( ON ?auto_50283 ?auto_50282 ) ( ON ?auto_50284 ?auto_50283 ) ( ON ?auto_50285 ?auto_50284 ) ( not ( = ?auto_50280 ?auto_50281 ) ) ( not ( = ?auto_50280 ?auto_50282 ) ) ( not ( = ?auto_50280 ?auto_50283 ) ) ( not ( = ?auto_50280 ?auto_50284 ) ) ( not ( = ?auto_50280 ?auto_50285 ) ) ( not ( = ?auto_50280 ?auto_50286 ) ) ( not ( = ?auto_50281 ?auto_50282 ) ) ( not ( = ?auto_50281 ?auto_50283 ) ) ( not ( = ?auto_50281 ?auto_50284 ) ) ( not ( = ?auto_50281 ?auto_50285 ) ) ( not ( = ?auto_50281 ?auto_50286 ) ) ( not ( = ?auto_50282 ?auto_50283 ) ) ( not ( = ?auto_50282 ?auto_50284 ) ) ( not ( = ?auto_50282 ?auto_50285 ) ) ( not ( = ?auto_50282 ?auto_50286 ) ) ( not ( = ?auto_50283 ?auto_50284 ) ) ( not ( = ?auto_50283 ?auto_50285 ) ) ( not ( = ?auto_50283 ?auto_50286 ) ) ( not ( = ?auto_50284 ?auto_50285 ) ) ( not ( = ?auto_50284 ?auto_50286 ) ) ( not ( = ?auto_50285 ?auto_50286 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_50286 ?auto_50285 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_50288 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_50288 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_50288 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_50289 - BLOCK
    )
    :vars
    (
      ?auto_50290 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50289 ?auto_50290 ) ( CLEAR ?auto_50289 ) ( HAND-EMPTY ) ( not ( = ?auto_50289 ?auto_50290 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_50289 ?auto_50290 )
      ( MAKE-1PILE ?auto_50289 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_50296 - BLOCK
      ?auto_50297 - BLOCK
      ?auto_50298 - BLOCK
      ?auto_50299 - BLOCK
      ?auto_50300 - BLOCK
    )
    :vars
    (
      ?auto_50301 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50301 ?auto_50300 ) ( CLEAR ?auto_50301 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_50296 ) ( ON ?auto_50297 ?auto_50296 ) ( ON ?auto_50298 ?auto_50297 ) ( ON ?auto_50299 ?auto_50298 ) ( ON ?auto_50300 ?auto_50299 ) ( not ( = ?auto_50296 ?auto_50297 ) ) ( not ( = ?auto_50296 ?auto_50298 ) ) ( not ( = ?auto_50296 ?auto_50299 ) ) ( not ( = ?auto_50296 ?auto_50300 ) ) ( not ( = ?auto_50296 ?auto_50301 ) ) ( not ( = ?auto_50297 ?auto_50298 ) ) ( not ( = ?auto_50297 ?auto_50299 ) ) ( not ( = ?auto_50297 ?auto_50300 ) ) ( not ( = ?auto_50297 ?auto_50301 ) ) ( not ( = ?auto_50298 ?auto_50299 ) ) ( not ( = ?auto_50298 ?auto_50300 ) ) ( not ( = ?auto_50298 ?auto_50301 ) ) ( not ( = ?auto_50299 ?auto_50300 ) ) ( not ( = ?auto_50299 ?auto_50301 ) ) ( not ( = ?auto_50300 ?auto_50301 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_50301 ?auto_50300 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_50302 - BLOCK
      ?auto_50303 - BLOCK
      ?auto_50304 - BLOCK
      ?auto_50305 - BLOCK
      ?auto_50306 - BLOCK
    )
    :vars
    (
      ?auto_50307 - BLOCK
      ?auto_50308 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50307 ?auto_50306 ) ( CLEAR ?auto_50307 ) ( ON-TABLE ?auto_50302 ) ( ON ?auto_50303 ?auto_50302 ) ( ON ?auto_50304 ?auto_50303 ) ( ON ?auto_50305 ?auto_50304 ) ( ON ?auto_50306 ?auto_50305 ) ( not ( = ?auto_50302 ?auto_50303 ) ) ( not ( = ?auto_50302 ?auto_50304 ) ) ( not ( = ?auto_50302 ?auto_50305 ) ) ( not ( = ?auto_50302 ?auto_50306 ) ) ( not ( = ?auto_50302 ?auto_50307 ) ) ( not ( = ?auto_50303 ?auto_50304 ) ) ( not ( = ?auto_50303 ?auto_50305 ) ) ( not ( = ?auto_50303 ?auto_50306 ) ) ( not ( = ?auto_50303 ?auto_50307 ) ) ( not ( = ?auto_50304 ?auto_50305 ) ) ( not ( = ?auto_50304 ?auto_50306 ) ) ( not ( = ?auto_50304 ?auto_50307 ) ) ( not ( = ?auto_50305 ?auto_50306 ) ) ( not ( = ?auto_50305 ?auto_50307 ) ) ( not ( = ?auto_50306 ?auto_50307 ) ) ( HOLDING ?auto_50308 ) ( not ( = ?auto_50302 ?auto_50308 ) ) ( not ( = ?auto_50303 ?auto_50308 ) ) ( not ( = ?auto_50304 ?auto_50308 ) ) ( not ( = ?auto_50305 ?auto_50308 ) ) ( not ( = ?auto_50306 ?auto_50308 ) ) ( not ( = ?auto_50307 ?auto_50308 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_50308 )
      ( MAKE-5PILE ?auto_50302 ?auto_50303 ?auto_50304 ?auto_50305 ?auto_50306 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_50309 - BLOCK
      ?auto_50310 - BLOCK
      ?auto_50311 - BLOCK
      ?auto_50312 - BLOCK
      ?auto_50313 - BLOCK
    )
    :vars
    (
      ?auto_50314 - BLOCK
      ?auto_50315 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50314 ?auto_50313 ) ( ON-TABLE ?auto_50309 ) ( ON ?auto_50310 ?auto_50309 ) ( ON ?auto_50311 ?auto_50310 ) ( ON ?auto_50312 ?auto_50311 ) ( ON ?auto_50313 ?auto_50312 ) ( not ( = ?auto_50309 ?auto_50310 ) ) ( not ( = ?auto_50309 ?auto_50311 ) ) ( not ( = ?auto_50309 ?auto_50312 ) ) ( not ( = ?auto_50309 ?auto_50313 ) ) ( not ( = ?auto_50309 ?auto_50314 ) ) ( not ( = ?auto_50310 ?auto_50311 ) ) ( not ( = ?auto_50310 ?auto_50312 ) ) ( not ( = ?auto_50310 ?auto_50313 ) ) ( not ( = ?auto_50310 ?auto_50314 ) ) ( not ( = ?auto_50311 ?auto_50312 ) ) ( not ( = ?auto_50311 ?auto_50313 ) ) ( not ( = ?auto_50311 ?auto_50314 ) ) ( not ( = ?auto_50312 ?auto_50313 ) ) ( not ( = ?auto_50312 ?auto_50314 ) ) ( not ( = ?auto_50313 ?auto_50314 ) ) ( not ( = ?auto_50309 ?auto_50315 ) ) ( not ( = ?auto_50310 ?auto_50315 ) ) ( not ( = ?auto_50311 ?auto_50315 ) ) ( not ( = ?auto_50312 ?auto_50315 ) ) ( not ( = ?auto_50313 ?auto_50315 ) ) ( not ( = ?auto_50314 ?auto_50315 ) ) ( ON ?auto_50315 ?auto_50314 ) ( CLEAR ?auto_50315 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_50309 ?auto_50310 ?auto_50311 ?auto_50312 ?auto_50313 ?auto_50314 )
      ( MAKE-5PILE ?auto_50309 ?auto_50310 ?auto_50311 ?auto_50312 ?auto_50313 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_50318 - BLOCK
      ?auto_50319 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_50319 ) ( CLEAR ?auto_50318 ) ( ON-TABLE ?auto_50318 ) ( not ( = ?auto_50318 ?auto_50319 ) ) )
    :subtasks
    ( ( !STACK ?auto_50319 ?auto_50318 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_50320 - BLOCK
      ?auto_50321 - BLOCK
    )
    :vars
    (
      ?auto_50322 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_50320 ) ( ON-TABLE ?auto_50320 ) ( not ( = ?auto_50320 ?auto_50321 ) ) ( ON ?auto_50321 ?auto_50322 ) ( CLEAR ?auto_50321 ) ( HAND-EMPTY ) ( not ( = ?auto_50320 ?auto_50322 ) ) ( not ( = ?auto_50321 ?auto_50322 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_50321 ?auto_50322 )
      ( MAKE-2PILE ?auto_50320 ?auto_50321 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_50323 - BLOCK
      ?auto_50324 - BLOCK
    )
    :vars
    (
      ?auto_50325 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_50323 ?auto_50324 ) ) ( ON ?auto_50324 ?auto_50325 ) ( CLEAR ?auto_50324 ) ( not ( = ?auto_50323 ?auto_50325 ) ) ( not ( = ?auto_50324 ?auto_50325 ) ) ( HOLDING ?auto_50323 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_50323 )
      ( MAKE-2PILE ?auto_50323 ?auto_50324 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_50326 - BLOCK
      ?auto_50327 - BLOCK
    )
    :vars
    (
      ?auto_50328 - BLOCK
      ?auto_50331 - BLOCK
      ?auto_50330 - BLOCK
      ?auto_50332 - BLOCK
      ?auto_50329 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_50326 ?auto_50327 ) ) ( ON ?auto_50327 ?auto_50328 ) ( not ( = ?auto_50326 ?auto_50328 ) ) ( not ( = ?auto_50327 ?auto_50328 ) ) ( ON ?auto_50326 ?auto_50327 ) ( CLEAR ?auto_50326 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_50331 ) ( ON ?auto_50330 ?auto_50331 ) ( ON ?auto_50332 ?auto_50330 ) ( ON ?auto_50329 ?auto_50332 ) ( ON ?auto_50328 ?auto_50329 ) ( not ( = ?auto_50331 ?auto_50330 ) ) ( not ( = ?auto_50331 ?auto_50332 ) ) ( not ( = ?auto_50331 ?auto_50329 ) ) ( not ( = ?auto_50331 ?auto_50328 ) ) ( not ( = ?auto_50331 ?auto_50327 ) ) ( not ( = ?auto_50331 ?auto_50326 ) ) ( not ( = ?auto_50330 ?auto_50332 ) ) ( not ( = ?auto_50330 ?auto_50329 ) ) ( not ( = ?auto_50330 ?auto_50328 ) ) ( not ( = ?auto_50330 ?auto_50327 ) ) ( not ( = ?auto_50330 ?auto_50326 ) ) ( not ( = ?auto_50332 ?auto_50329 ) ) ( not ( = ?auto_50332 ?auto_50328 ) ) ( not ( = ?auto_50332 ?auto_50327 ) ) ( not ( = ?auto_50332 ?auto_50326 ) ) ( not ( = ?auto_50329 ?auto_50328 ) ) ( not ( = ?auto_50329 ?auto_50327 ) ) ( not ( = ?auto_50329 ?auto_50326 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_50331 ?auto_50330 ?auto_50332 ?auto_50329 ?auto_50328 ?auto_50327 )
      ( MAKE-2PILE ?auto_50326 ?auto_50327 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_50337 - BLOCK
      ?auto_50338 - BLOCK
      ?auto_50339 - BLOCK
      ?auto_50340 - BLOCK
    )
    :vars
    (
      ?auto_50341 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50341 ?auto_50340 ) ( CLEAR ?auto_50341 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_50337 ) ( ON ?auto_50338 ?auto_50337 ) ( ON ?auto_50339 ?auto_50338 ) ( ON ?auto_50340 ?auto_50339 ) ( not ( = ?auto_50337 ?auto_50338 ) ) ( not ( = ?auto_50337 ?auto_50339 ) ) ( not ( = ?auto_50337 ?auto_50340 ) ) ( not ( = ?auto_50337 ?auto_50341 ) ) ( not ( = ?auto_50338 ?auto_50339 ) ) ( not ( = ?auto_50338 ?auto_50340 ) ) ( not ( = ?auto_50338 ?auto_50341 ) ) ( not ( = ?auto_50339 ?auto_50340 ) ) ( not ( = ?auto_50339 ?auto_50341 ) ) ( not ( = ?auto_50340 ?auto_50341 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_50341 ?auto_50340 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_50342 - BLOCK
      ?auto_50343 - BLOCK
      ?auto_50344 - BLOCK
      ?auto_50345 - BLOCK
    )
    :vars
    (
      ?auto_50346 - BLOCK
      ?auto_50347 - BLOCK
      ?auto_50348 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50346 ?auto_50345 ) ( CLEAR ?auto_50346 ) ( ON-TABLE ?auto_50342 ) ( ON ?auto_50343 ?auto_50342 ) ( ON ?auto_50344 ?auto_50343 ) ( ON ?auto_50345 ?auto_50344 ) ( not ( = ?auto_50342 ?auto_50343 ) ) ( not ( = ?auto_50342 ?auto_50344 ) ) ( not ( = ?auto_50342 ?auto_50345 ) ) ( not ( = ?auto_50342 ?auto_50346 ) ) ( not ( = ?auto_50343 ?auto_50344 ) ) ( not ( = ?auto_50343 ?auto_50345 ) ) ( not ( = ?auto_50343 ?auto_50346 ) ) ( not ( = ?auto_50344 ?auto_50345 ) ) ( not ( = ?auto_50344 ?auto_50346 ) ) ( not ( = ?auto_50345 ?auto_50346 ) ) ( HOLDING ?auto_50347 ) ( CLEAR ?auto_50348 ) ( not ( = ?auto_50342 ?auto_50347 ) ) ( not ( = ?auto_50342 ?auto_50348 ) ) ( not ( = ?auto_50343 ?auto_50347 ) ) ( not ( = ?auto_50343 ?auto_50348 ) ) ( not ( = ?auto_50344 ?auto_50347 ) ) ( not ( = ?auto_50344 ?auto_50348 ) ) ( not ( = ?auto_50345 ?auto_50347 ) ) ( not ( = ?auto_50345 ?auto_50348 ) ) ( not ( = ?auto_50346 ?auto_50347 ) ) ( not ( = ?auto_50346 ?auto_50348 ) ) ( not ( = ?auto_50347 ?auto_50348 ) ) )
    :subtasks
    ( ( !STACK ?auto_50347 ?auto_50348 )
      ( MAKE-4PILE ?auto_50342 ?auto_50343 ?auto_50344 ?auto_50345 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_50349 - BLOCK
      ?auto_50350 - BLOCK
      ?auto_50351 - BLOCK
      ?auto_50352 - BLOCK
    )
    :vars
    (
      ?auto_50355 - BLOCK
      ?auto_50354 - BLOCK
      ?auto_50353 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50355 ?auto_50352 ) ( ON-TABLE ?auto_50349 ) ( ON ?auto_50350 ?auto_50349 ) ( ON ?auto_50351 ?auto_50350 ) ( ON ?auto_50352 ?auto_50351 ) ( not ( = ?auto_50349 ?auto_50350 ) ) ( not ( = ?auto_50349 ?auto_50351 ) ) ( not ( = ?auto_50349 ?auto_50352 ) ) ( not ( = ?auto_50349 ?auto_50355 ) ) ( not ( = ?auto_50350 ?auto_50351 ) ) ( not ( = ?auto_50350 ?auto_50352 ) ) ( not ( = ?auto_50350 ?auto_50355 ) ) ( not ( = ?auto_50351 ?auto_50352 ) ) ( not ( = ?auto_50351 ?auto_50355 ) ) ( not ( = ?auto_50352 ?auto_50355 ) ) ( CLEAR ?auto_50354 ) ( not ( = ?auto_50349 ?auto_50353 ) ) ( not ( = ?auto_50349 ?auto_50354 ) ) ( not ( = ?auto_50350 ?auto_50353 ) ) ( not ( = ?auto_50350 ?auto_50354 ) ) ( not ( = ?auto_50351 ?auto_50353 ) ) ( not ( = ?auto_50351 ?auto_50354 ) ) ( not ( = ?auto_50352 ?auto_50353 ) ) ( not ( = ?auto_50352 ?auto_50354 ) ) ( not ( = ?auto_50355 ?auto_50353 ) ) ( not ( = ?auto_50355 ?auto_50354 ) ) ( not ( = ?auto_50353 ?auto_50354 ) ) ( ON ?auto_50353 ?auto_50355 ) ( CLEAR ?auto_50353 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_50349 ?auto_50350 ?auto_50351 ?auto_50352 ?auto_50355 )
      ( MAKE-4PILE ?auto_50349 ?auto_50350 ?auto_50351 ?auto_50352 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_50356 - BLOCK
      ?auto_50357 - BLOCK
      ?auto_50358 - BLOCK
      ?auto_50359 - BLOCK
    )
    :vars
    (
      ?auto_50361 - BLOCK
      ?auto_50362 - BLOCK
      ?auto_50360 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50361 ?auto_50359 ) ( ON-TABLE ?auto_50356 ) ( ON ?auto_50357 ?auto_50356 ) ( ON ?auto_50358 ?auto_50357 ) ( ON ?auto_50359 ?auto_50358 ) ( not ( = ?auto_50356 ?auto_50357 ) ) ( not ( = ?auto_50356 ?auto_50358 ) ) ( not ( = ?auto_50356 ?auto_50359 ) ) ( not ( = ?auto_50356 ?auto_50361 ) ) ( not ( = ?auto_50357 ?auto_50358 ) ) ( not ( = ?auto_50357 ?auto_50359 ) ) ( not ( = ?auto_50357 ?auto_50361 ) ) ( not ( = ?auto_50358 ?auto_50359 ) ) ( not ( = ?auto_50358 ?auto_50361 ) ) ( not ( = ?auto_50359 ?auto_50361 ) ) ( not ( = ?auto_50356 ?auto_50362 ) ) ( not ( = ?auto_50356 ?auto_50360 ) ) ( not ( = ?auto_50357 ?auto_50362 ) ) ( not ( = ?auto_50357 ?auto_50360 ) ) ( not ( = ?auto_50358 ?auto_50362 ) ) ( not ( = ?auto_50358 ?auto_50360 ) ) ( not ( = ?auto_50359 ?auto_50362 ) ) ( not ( = ?auto_50359 ?auto_50360 ) ) ( not ( = ?auto_50361 ?auto_50362 ) ) ( not ( = ?auto_50361 ?auto_50360 ) ) ( not ( = ?auto_50362 ?auto_50360 ) ) ( ON ?auto_50362 ?auto_50361 ) ( CLEAR ?auto_50362 ) ( HOLDING ?auto_50360 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_50360 )
      ( MAKE-4PILE ?auto_50356 ?auto_50357 ?auto_50358 ?auto_50359 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_50363 - BLOCK
      ?auto_50364 - BLOCK
      ?auto_50365 - BLOCK
      ?auto_50366 - BLOCK
    )
    :vars
    (
      ?auto_50367 - BLOCK
      ?auto_50369 - BLOCK
      ?auto_50368 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50367 ?auto_50366 ) ( ON-TABLE ?auto_50363 ) ( ON ?auto_50364 ?auto_50363 ) ( ON ?auto_50365 ?auto_50364 ) ( ON ?auto_50366 ?auto_50365 ) ( not ( = ?auto_50363 ?auto_50364 ) ) ( not ( = ?auto_50363 ?auto_50365 ) ) ( not ( = ?auto_50363 ?auto_50366 ) ) ( not ( = ?auto_50363 ?auto_50367 ) ) ( not ( = ?auto_50364 ?auto_50365 ) ) ( not ( = ?auto_50364 ?auto_50366 ) ) ( not ( = ?auto_50364 ?auto_50367 ) ) ( not ( = ?auto_50365 ?auto_50366 ) ) ( not ( = ?auto_50365 ?auto_50367 ) ) ( not ( = ?auto_50366 ?auto_50367 ) ) ( not ( = ?auto_50363 ?auto_50369 ) ) ( not ( = ?auto_50363 ?auto_50368 ) ) ( not ( = ?auto_50364 ?auto_50369 ) ) ( not ( = ?auto_50364 ?auto_50368 ) ) ( not ( = ?auto_50365 ?auto_50369 ) ) ( not ( = ?auto_50365 ?auto_50368 ) ) ( not ( = ?auto_50366 ?auto_50369 ) ) ( not ( = ?auto_50366 ?auto_50368 ) ) ( not ( = ?auto_50367 ?auto_50369 ) ) ( not ( = ?auto_50367 ?auto_50368 ) ) ( not ( = ?auto_50369 ?auto_50368 ) ) ( ON ?auto_50369 ?auto_50367 ) ( ON ?auto_50368 ?auto_50369 ) ( CLEAR ?auto_50368 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_50363 ?auto_50364 ?auto_50365 ?auto_50366 ?auto_50367 ?auto_50369 )
      ( MAKE-4PILE ?auto_50363 ?auto_50364 ?auto_50365 ?auto_50366 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_50373 - BLOCK
      ?auto_50374 - BLOCK
      ?auto_50375 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_50375 ) ( CLEAR ?auto_50374 ) ( ON-TABLE ?auto_50373 ) ( ON ?auto_50374 ?auto_50373 ) ( not ( = ?auto_50373 ?auto_50374 ) ) ( not ( = ?auto_50373 ?auto_50375 ) ) ( not ( = ?auto_50374 ?auto_50375 ) ) )
    :subtasks
    ( ( !STACK ?auto_50375 ?auto_50374 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_50376 - BLOCK
      ?auto_50377 - BLOCK
      ?auto_50378 - BLOCK
    )
    :vars
    (
      ?auto_50379 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_50377 ) ( ON-TABLE ?auto_50376 ) ( ON ?auto_50377 ?auto_50376 ) ( not ( = ?auto_50376 ?auto_50377 ) ) ( not ( = ?auto_50376 ?auto_50378 ) ) ( not ( = ?auto_50377 ?auto_50378 ) ) ( ON ?auto_50378 ?auto_50379 ) ( CLEAR ?auto_50378 ) ( HAND-EMPTY ) ( not ( = ?auto_50376 ?auto_50379 ) ) ( not ( = ?auto_50377 ?auto_50379 ) ) ( not ( = ?auto_50378 ?auto_50379 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_50378 ?auto_50379 )
      ( MAKE-3PILE ?auto_50376 ?auto_50377 ?auto_50378 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_50380 - BLOCK
      ?auto_50381 - BLOCK
      ?auto_50382 - BLOCK
    )
    :vars
    (
      ?auto_50383 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_50380 ) ( not ( = ?auto_50380 ?auto_50381 ) ) ( not ( = ?auto_50380 ?auto_50382 ) ) ( not ( = ?auto_50381 ?auto_50382 ) ) ( ON ?auto_50382 ?auto_50383 ) ( CLEAR ?auto_50382 ) ( not ( = ?auto_50380 ?auto_50383 ) ) ( not ( = ?auto_50381 ?auto_50383 ) ) ( not ( = ?auto_50382 ?auto_50383 ) ) ( HOLDING ?auto_50381 ) ( CLEAR ?auto_50380 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_50380 ?auto_50381 )
      ( MAKE-3PILE ?auto_50380 ?auto_50381 ?auto_50382 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_50384 - BLOCK
      ?auto_50385 - BLOCK
      ?auto_50386 - BLOCK
    )
    :vars
    (
      ?auto_50387 - BLOCK
      ?auto_50389 - BLOCK
      ?auto_50390 - BLOCK
      ?auto_50388 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_50384 ) ( not ( = ?auto_50384 ?auto_50385 ) ) ( not ( = ?auto_50384 ?auto_50386 ) ) ( not ( = ?auto_50385 ?auto_50386 ) ) ( ON ?auto_50386 ?auto_50387 ) ( not ( = ?auto_50384 ?auto_50387 ) ) ( not ( = ?auto_50385 ?auto_50387 ) ) ( not ( = ?auto_50386 ?auto_50387 ) ) ( CLEAR ?auto_50384 ) ( ON ?auto_50385 ?auto_50386 ) ( CLEAR ?auto_50385 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_50389 ) ( ON ?auto_50390 ?auto_50389 ) ( ON ?auto_50388 ?auto_50390 ) ( ON ?auto_50387 ?auto_50388 ) ( not ( = ?auto_50389 ?auto_50390 ) ) ( not ( = ?auto_50389 ?auto_50388 ) ) ( not ( = ?auto_50389 ?auto_50387 ) ) ( not ( = ?auto_50389 ?auto_50386 ) ) ( not ( = ?auto_50389 ?auto_50385 ) ) ( not ( = ?auto_50390 ?auto_50388 ) ) ( not ( = ?auto_50390 ?auto_50387 ) ) ( not ( = ?auto_50390 ?auto_50386 ) ) ( not ( = ?auto_50390 ?auto_50385 ) ) ( not ( = ?auto_50388 ?auto_50387 ) ) ( not ( = ?auto_50388 ?auto_50386 ) ) ( not ( = ?auto_50388 ?auto_50385 ) ) ( not ( = ?auto_50384 ?auto_50389 ) ) ( not ( = ?auto_50384 ?auto_50390 ) ) ( not ( = ?auto_50384 ?auto_50388 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_50389 ?auto_50390 ?auto_50388 ?auto_50387 ?auto_50386 )
      ( MAKE-3PILE ?auto_50384 ?auto_50385 ?auto_50386 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_50391 - BLOCK
      ?auto_50392 - BLOCK
      ?auto_50393 - BLOCK
    )
    :vars
    (
      ?auto_50395 - BLOCK
      ?auto_50397 - BLOCK
      ?auto_50396 - BLOCK
      ?auto_50394 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_50391 ?auto_50392 ) ) ( not ( = ?auto_50391 ?auto_50393 ) ) ( not ( = ?auto_50392 ?auto_50393 ) ) ( ON ?auto_50393 ?auto_50395 ) ( not ( = ?auto_50391 ?auto_50395 ) ) ( not ( = ?auto_50392 ?auto_50395 ) ) ( not ( = ?auto_50393 ?auto_50395 ) ) ( ON ?auto_50392 ?auto_50393 ) ( CLEAR ?auto_50392 ) ( ON-TABLE ?auto_50397 ) ( ON ?auto_50396 ?auto_50397 ) ( ON ?auto_50394 ?auto_50396 ) ( ON ?auto_50395 ?auto_50394 ) ( not ( = ?auto_50397 ?auto_50396 ) ) ( not ( = ?auto_50397 ?auto_50394 ) ) ( not ( = ?auto_50397 ?auto_50395 ) ) ( not ( = ?auto_50397 ?auto_50393 ) ) ( not ( = ?auto_50397 ?auto_50392 ) ) ( not ( = ?auto_50396 ?auto_50394 ) ) ( not ( = ?auto_50396 ?auto_50395 ) ) ( not ( = ?auto_50396 ?auto_50393 ) ) ( not ( = ?auto_50396 ?auto_50392 ) ) ( not ( = ?auto_50394 ?auto_50395 ) ) ( not ( = ?auto_50394 ?auto_50393 ) ) ( not ( = ?auto_50394 ?auto_50392 ) ) ( not ( = ?auto_50391 ?auto_50397 ) ) ( not ( = ?auto_50391 ?auto_50396 ) ) ( not ( = ?auto_50391 ?auto_50394 ) ) ( HOLDING ?auto_50391 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_50391 )
      ( MAKE-3PILE ?auto_50391 ?auto_50392 ?auto_50393 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_50398 - BLOCK
      ?auto_50399 - BLOCK
      ?auto_50400 - BLOCK
    )
    :vars
    (
      ?auto_50403 - BLOCK
      ?auto_50401 - BLOCK
      ?auto_50402 - BLOCK
      ?auto_50404 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_50398 ?auto_50399 ) ) ( not ( = ?auto_50398 ?auto_50400 ) ) ( not ( = ?auto_50399 ?auto_50400 ) ) ( ON ?auto_50400 ?auto_50403 ) ( not ( = ?auto_50398 ?auto_50403 ) ) ( not ( = ?auto_50399 ?auto_50403 ) ) ( not ( = ?auto_50400 ?auto_50403 ) ) ( ON ?auto_50399 ?auto_50400 ) ( ON-TABLE ?auto_50401 ) ( ON ?auto_50402 ?auto_50401 ) ( ON ?auto_50404 ?auto_50402 ) ( ON ?auto_50403 ?auto_50404 ) ( not ( = ?auto_50401 ?auto_50402 ) ) ( not ( = ?auto_50401 ?auto_50404 ) ) ( not ( = ?auto_50401 ?auto_50403 ) ) ( not ( = ?auto_50401 ?auto_50400 ) ) ( not ( = ?auto_50401 ?auto_50399 ) ) ( not ( = ?auto_50402 ?auto_50404 ) ) ( not ( = ?auto_50402 ?auto_50403 ) ) ( not ( = ?auto_50402 ?auto_50400 ) ) ( not ( = ?auto_50402 ?auto_50399 ) ) ( not ( = ?auto_50404 ?auto_50403 ) ) ( not ( = ?auto_50404 ?auto_50400 ) ) ( not ( = ?auto_50404 ?auto_50399 ) ) ( not ( = ?auto_50398 ?auto_50401 ) ) ( not ( = ?auto_50398 ?auto_50402 ) ) ( not ( = ?auto_50398 ?auto_50404 ) ) ( ON ?auto_50398 ?auto_50399 ) ( CLEAR ?auto_50398 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_50401 ?auto_50402 ?auto_50404 ?auto_50403 ?auto_50400 ?auto_50399 )
      ( MAKE-3PILE ?auto_50398 ?auto_50399 ?auto_50400 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_50408 - BLOCK
      ?auto_50409 - BLOCK
      ?auto_50410 - BLOCK
    )
    :vars
    (
      ?auto_50411 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50411 ?auto_50410 ) ( CLEAR ?auto_50411 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_50408 ) ( ON ?auto_50409 ?auto_50408 ) ( ON ?auto_50410 ?auto_50409 ) ( not ( = ?auto_50408 ?auto_50409 ) ) ( not ( = ?auto_50408 ?auto_50410 ) ) ( not ( = ?auto_50408 ?auto_50411 ) ) ( not ( = ?auto_50409 ?auto_50410 ) ) ( not ( = ?auto_50409 ?auto_50411 ) ) ( not ( = ?auto_50410 ?auto_50411 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_50411 ?auto_50410 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_50412 - BLOCK
      ?auto_50413 - BLOCK
      ?auto_50414 - BLOCK
    )
    :vars
    (
      ?auto_50415 - BLOCK
      ?auto_50416 - BLOCK
      ?auto_50417 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50415 ?auto_50414 ) ( CLEAR ?auto_50415 ) ( ON-TABLE ?auto_50412 ) ( ON ?auto_50413 ?auto_50412 ) ( ON ?auto_50414 ?auto_50413 ) ( not ( = ?auto_50412 ?auto_50413 ) ) ( not ( = ?auto_50412 ?auto_50414 ) ) ( not ( = ?auto_50412 ?auto_50415 ) ) ( not ( = ?auto_50413 ?auto_50414 ) ) ( not ( = ?auto_50413 ?auto_50415 ) ) ( not ( = ?auto_50414 ?auto_50415 ) ) ( HOLDING ?auto_50416 ) ( CLEAR ?auto_50417 ) ( not ( = ?auto_50412 ?auto_50416 ) ) ( not ( = ?auto_50412 ?auto_50417 ) ) ( not ( = ?auto_50413 ?auto_50416 ) ) ( not ( = ?auto_50413 ?auto_50417 ) ) ( not ( = ?auto_50414 ?auto_50416 ) ) ( not ( = ?auto_50414 ?auto_50417 ) ) ( not ( = ?auto_50415 ?auto_50416 ) ) ( not ( = ?auto_50415 ?auto_50417 ) ) ( not ( = ?auto_50416 ?auto_50417 ) ) )
    :subtasks
    ( ( !STACK ?auto_50416 ?auto_50417 )
      ( MAKE-3PILE ?auto_50412 ?auto_50413 ?auto_50414 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_50418 - BLOCK
      ?auto_50419 - BLOCK
      ?auto_50420 - BLOCK
    )
    :vars
    (
      ?auto_50421 - BLOCK
      ?auto_50422 - BLOCK
      ?auto_50423 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50421 ?auto_50420 ) ( ON-TABLE ?auto_50418 ) ( ON ?auto_50419 ?auto_50418 ) ( ON ?auto_50420 ?auto_50419 ) ( not ( = ?auto_50418 ?auto_50419 ) ) ( not ( = ?auto_50418 ?auto_50420 ) ) ( not ( = ?auto_50418 ?auto_50421 ) ) ( not ( = ?auto_50419 ?auto_50420 ) ) ( not ( = ?auto_50419 ?auto_50421 ) ) ( not ( = ?auto_50420 ?auto_50421 ) ) ( CLEAR ?auto_50422 ) ( not ( = ?auto_50418 ?auto_50423 ) ) ( not ( = ?auto_50418 ?auto_50422 ) ) ( not ( = ?auto_50419 ?auto_50423 ) ) ( not ( = ?auto_50419 ?auto_50422 ) ) ( not ( = ?auto_50420 ?auto_50423 ) ) ( not ( = ?auto_50420 ?auto_50422 ) ) ( not ( = ?auto_50421 ?auto_50423 ) ) ( not ( = ?auto_50421 ?auto_50422 ) ) ( not ( = ?auto_50423 ?auto_50422 ) ) ( ON ?auto_50423 ?auto_50421 ) ( CLEAR ?auto_50423 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_50418 ?auto_50419 ?auto_50420 ?auto_50421 )
      ( MAKE-3PILE ?auto_50418 ?auto_50419 ?auto_50420 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_50424 - BLOCK
      ?auto_50425 - BLOCK
      ?auto_50426 - BLOCK
    )
    :vars
    (
      ?auto_50429 - BLOCK
      ?auto_50427 - BLOCK
      ?auto_50428 - BLOCK
      ?auto_50430 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50429 ?auto_50426 ) ( ON-TABLE ?auto_50424 ) ( ON ?auto_50425 ?auto_50424 ) ( ON ?auto_50426 ?auto_50425 ) ( not ( = ?auto_50424 ?auto_50425 ) ) ( not ( = ?auto_50424 ?auto_50426 ) ) ( not ( = ?auto_50424 ?auto_50429 ) ) ( not ( = ?auto_50425 ?auto_50426 ) ) ( not ( = ?auto_50425 ?auto_50429 ) ) ( not ( = ?auto_50426 ?auto_50429 ) ) ( not ( = ?auto_50424 ?auto_50427 ) ) ( not ( = ?auto_50424 ?auto_50428 ) ) ( not ( = ?auto_50425 ?auto_50427 ) ) ( not ( = ?auto_50425 ?auto_50428 ) ) ( not ( = ?auto_50426 ?auto_50427 ) ) ( not ( = ?auto_50426 ?auto_50428 ) ) ( not ( = ?auto_50429 ?auto_50427 ) ) ( not ( = ?auto_50429 ?auto_50428 ) ) ( not ( = ?auto_50427 ?auto_50428 ) ) ( ON ?auto_50427 ?auto_50429 ) ( CLEAR ?auto_50427 ) ( HOLDING ?auto_50428 ) ( CLEAR ?auto_50430 ) ( ON-TABLE ?auto_50430 ) ( not ( = ?auto_50430 ?auto_50428 ) ) ( not ( = ?auto_50424 ?auto_50430 ) ) ( not ( = ?auto_50425 ?auto_50430 ) ) ( not ( = ?auto_50426 ?auto_50430 ) ) ( not ( = ?auto_50429 ?auto_50430 ) ) ( not ( = ?auto_50427 ?auto_50430 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_50430 ?auto_50428 )
      ( MAKE-3PILE ?auto_50424 ?auto_50425 ?auto_50426 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_50431 - BLOCK
      ?auto_50432 - BLOCK
      ?auto_50433 - BLOCK
    )
    :vars
    (
      ?auto_50434 - BLOCK
      ?auto_50436 - BLOCK
      ?auto_50435 - BLOCK
      ?auto_50437 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50434 ?auto_50433 ) ( ON-TABLE ?auto_50431 ) ( ON ?auto_50432 ?auto_50431 ) ( ON ?auto_50433 ?auto_50432 ) ( not ( = ?auto_50431 ?auto_50432 ) ) ( not ( = ?auto_50431 ?auto_50433 ) ) ( not ( = ?auto_50431 ?auto_50434 ) ) ( not ( = ?auto_50432 ?auto_50433 ) ) ( not ( = ?auto_50432 ?auto_50434 ) ) ( not ( = ?auto_50433 ?auto_50434 ) ) ( not ( = ?auto_50431 ?auto_50436 ) ) ( not ( = ?auto_50431 ?auto_50435 ) ) ( not ( = ?auto_50432 ?auto_50436 ) ) ( not ( = ?auto_50432 ?auto_50435 ) ) ( not ( = ?auto_50433 ?auto_50436 ) ) ( not ( = ?auto_50433 ?auto_50435 ) ) ( not ( = ?auto_50434 ?auto_50436 ) ) ( not ( = ?auto_50434 ?auto_50435 ) ) ( not ( = ?auto_50436 ?auto_50435 ) ) ( ON ?auto_50436 ?auto_50434 ) ( CLEAR ?auto_50437 ) ( ON-TABLE ?auto_50437 ) ( not ( = ?auto_50437 ?auto_50435 ) ) ( not ( = ?auto_50431 ?auto_50437 ) ) ( not ( = ?auto_50432 ?auto_50437 ) ) ( not ( = ?auto_50433 ?auto_50437 ) ) ( not ( = ?auto_50434 ?auto_50437 ) ) ( not ( = ?auto_50436 ?auto_50437 ) ) ( ON ?auto_50435 ?auto_50436 ) ( CLEAR ?auto_50435 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_50431 ?auto_50432 ?auto_50433 ?auto_50434 ?auto_50436 )
      ( MAKE-3PILE ?auto_50431 ?auto_50432 ?auto_50433 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_50438 - BLOCK
      ?auto_50439 - BLOCK
      ?auto_50440 - BLOCK
    )
    :vars
    (
      ?auto_50443 - BLOCK
      ?auto_50441 - BLOCK
      ?auto_50442 - BLOCK
      ?auto_50444 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50443 ?auto_50440 ) ( ON-TABLE ?auto_50438 ) ( ON ?auto_50439 ?auto_50438 ) ( ON ?auto_50440 ?auto_50439 ) ( not ( = ?auto_50438 ?auto_50439 ) ) ( not ( = ?auto_50438 ?auto_50440 ) ) ( not ( = ?auto_50438 ?auto_50443 ) ) ( not ( = ?auto_50439 ?auto_50440 ) ) ( not ( = ?auto_50439 ?auto_50443 ) ) ( not ( = ?auto_50440 ?auto_50443 ) ) ( not ( = ?auto_50438 ?auto_50441 ) ) ( not ( = ?auto_50438 ?auto_50442 ) ) ( not ( = ?auto_50439 ?auto_50441 ) ) ( not ( = ?auto_50439 ?auto_50442 ) ) ( not ( = ?auto_50440 ?auto_50441 ) ) ( not ( = ?auto_50440 ?auto_50442 ) ) ( not ( = ?auto_50443 ?auto_50441 ) ) ( not ( = ?auto_50443 ?auto_50442 ) ) ( not ( = ?auto_50441 ?auto_50442 ) ) ( ON ?auto_50441 ?auto_50443 ) ( not ( = ?auto_50444 ?auto_50442 ) ) ( not ( = ?auto_50438 ?auto_50444 ) ) ( not ( = ?auto_50439 ?auto_50444 ) ) ( not ( = ?auto_50440 ?auto_50444 ) ) ( not ( = ?auto_50443 ?auto_50444 ) ) ( not ( = ?auto_50441 ?auto_50444 ) ) ( ON ?auto_50442 ?auto_50441 ) ( CLEAR ?auto_50442 ) ( HOLDING ?auto_50444 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_50444 )
      ( MAKE-3PILE ?auto_50438 ?auto_50439 ?auto_50440 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_50445 - BLOCK
      ?auto_50446 - BLOCK
      ?auto_50447 - BLOCK
    )
    :vars
    (
      ?auto_50451 - BLOCK
      ?auto_50449 - BLOCK
      ?auto_50450 - BLOCK
      ?auto_50448 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50451 ?auto_50447 ) ( ON-TABLE ?auto_50445 ) ( ON ?auto_50446 ?auto_50445 ) ( ON ?auto_50447 ?auto_50446 ) ( not ( = ?auto_50445 ?auto_50446 ) ) ( not ( = ?auto_50445 ?auto_50447 ) ) ( not ( = ?auto_50445 ?auto_50451 ) ) ( not ( = ?auto_50446 ?auto_50447 ) ) ( not ( = ?auto_50446 ?auto_50451 ) ) ( not ( = ?auto_50447 ?auto_50451 ) ) ( not ( = ?auto_50445 ?auto_50449 ) ) ( not ( = ?auto_50445 ?auto_50450 ) ) ( not ( = ?auto_50446 ?auto_50449 ) ) ( not ( = ?auto_50446 ?auto_50450 ) ) ( not ( = ?auto_50447 ?auto_50449 ) ) ( not ( = ?auto_50447 ?auto_50450 ) ) ( not ( = ?auto_50451 ?auto_50449 ) ) ( not ( = ?auto_50451 ?auto_50450 ) ) ( not ( = ?auto_50449 ?auto_50450 ) ) ( ON ?auto_50449 ?auto_50451 ) ( not ( = ?auto_50448 ?auto_50450 ) ) ( not ( = ?auto_50445 ?auto_50448 ) ) ( not ( = ?auto_50446 ?auto_50448 ) ) ( not ( = ?auto_50447 ?auto_50448 ) ) ( not ( = ?auto_50451 ?auto_50448 ) ) ( not ( = ?auto_50449 ?auto_50448 ) ) ( ON ?auto_50450 ?auto_50449 ) ( ON ?auto_50448 ?auto_50450 ) ( CLEAR ?auto_50448 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_50445 ?auto_50446 ?auto_50447 ?auto_50451 ?auto_50449 ?auto_50450 )
      ( MAKE-3PILE ?auto_50445 ?auto_50446 ?auto_50447 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_50456 - BLOCK
      ?auto_50457 - BLOCK
      ?auto_50458 - BLOCK
      ?auto_50459 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_50459 ) ( CLEAR ?auto_50458 ) ( ON-TABLE ?auto_50456 ) ( ON ?auto_50457 ?auto_50456 ) ( ON ?auto_50458 ?auto_50457 ) ( not ( = ?auto_50456 ?auto_50457 ) ) ( not ( = ?auto_50456 ?auto_50458 ) ) ( not ( = ?auto_50456 ?auto_50459 ) ) ( not ( = ?auto_50457 ?auto_50458 ) ) ( not ( = ?auto_50457 ?auto_50459 ) ) ( not ( = ?auto_50458 ?auto_50459 ) ) )
    :subtasks
    ( ( !STACK ?auto_50459 ?auto_50458 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_50460 - BLOCK
      ?auto_50461 - BLOCK
      ?auto_50462 - BLOCK
      ?auto_50463 - BLOCK
    )
    :vars
    (
      ?auto_50464 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_50462 ) ( ON-TABLE ?auto_50460 ) ( ON ?auto_50461 ?auto_50460 ) ( ON ?auto_50462 ?auto_50461 ) ( not ( = ?auto_50460 ?auto_50461 ) ) ( not ( = ?auto_50460 ?auto_50462 ) ) ( not ( = ?auto_50460 ?auto_50463 ) ) ( not ( = ?auto_50461 ?auto_50462 ) ) ( not ( = ?auto_50461 ?auto_50463 ) ) ( not ( = ?auto_50462 ?auto_50463 ) ) ( ON ?auto_50463 ?auto_50464 ) ( CLEAR ?auto_50463 ) ( HAND-EMPTY ) ( not ( = ?auto_50460 ?auto_50464 ) ) ( not ( = ?auto_50461 ?auto_50464 ) ) ( not ( = ?auto_50462 ?auto_50464 ) ) ( not ( = ?auto_50463 ?auto_50464 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_50463 ?auto_50464 )
      ( MAKE-4PILE ?auto_50460 ?auto_50461 ?auto_50462 ?auto_50463 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_50465 - BLOCK
      ?auto_50466 - BLOCK
      ?auto_50467 - BLOCK
      ?auto_50468 - BLOCK
    )
    :vars
    (
      ?auto_50469 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_50465 ) ( ON ?auto_50466 ?auto_50465 ) ( not ( = ?auto_50465 ?auto_50466 ) ) ( not ( = ?auto_50465 ?auto_50467 ) ) ( not ( = ?auto_50465 ?auto_50468 ) ) ( not ( = ?auto_50466 ?auto_50467 ) ) ( not ( = ?auto_50466 ?auto_50468 ) ) ( not ( = ?auto_50467 ?auto_50468 ) ) ( ON ?auto_50468 ?auto_50469 ) ( CLEAR ?auto_50468 ) ( not ( = ?auto_50465 ?auto_50469 ) ) ( not ( = ?auto_50466 ?auto_50469 ) ) ( not ( = ?auto_50467 ?auto_50469 ) ) ( not ( = ?auto_50468 ?auto_50469 ) ) ( HOLDING ?auto_50467 ) ( CLEAR ?auto_50466 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_50465 ?auto_50466 ?auto_50467 )
      ( MAKE-4PILE ?auto_50465 ?auto_50466 ?auto_50467 ?auto_50468 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_50470 - BLOCK
      ?auto_50471 - BLOCK
      ?auto_50472 - BLOCK
      ?auto_50473 - BLOCK
    )
    :vars
    (
      ?auto_50474 - BLOCK
      ?auto_50476 - BLOCK
      ?auto_50475 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_50470 ) ( ON ?auto_50471 ?auto_50470 ) ( not ( = ?auto_50470 ?auto_50471 ) ) ( not ( = ?auto_50470 ?auto_50472 ) ) ( not ( = ?auto_50470 ?auto_50473 ) ) ( not ( = ?auto_50471 ?auto_50472 ) ) ( not ( = ?auto_50471 ?auto_50473 ) ) ( not ( = ?auto_50472 ?auto_50473 ) ) ( ON ?auto_50473 ?auto_50474 ) ( not ( = ?auto_50470 ?auto_50474 ) ) ( not ( = ?auto_50471 ?auto_50474 ) ) ( not ( = ?auto_50472 ?auto_50474 ) ) ( not ( = ?auto_50473 ?auto_50474 ) ) ( CLEAR ?auto_50471 ) ( ON ?auto_50472 ?auto_50473 ) ( CLEAR ?auto_50472 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_50476 ) ( ON ?auto_50475 ?auto_50476 ) ( ON ?auto_50474 ?auto_50475 ) ( not ( = ?auto_50476 ?auto_50475 ) ) ( not ( = ?auto_50476 ?auto_50474 ) ) ( not ( = ?auto_50476 ?auto_50473 ) ) ( not ( = ?auto_50476 ?auto_50472 ) ) ( not ( = ?auto_50475 ?auto_50474 ) ) ( not ( = ?auto_50475 ?auto_50473 ) ) ( not ( = ?auto_50475 ?auto_50472 ) ) ( not ( = ?auto_50470 ?auto_50476 ) ) ( not ( = ?auto_50470 ?auto_50475 ) ) ( not ( = ?auto_50471 ?auto_50476 ) ) ( not ( = ?auto_50471 ?auto_50475 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_50476 ?auto_50475 ?auto_50474 ?auto_50473 )
      ( MAKE-4PILE ?auto_50470 ?auto_50471 ?auto_50472 ?auto_50473 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_50477 - BLOCK
      ?auto_50478 - BLOCK
      ?auto_50479 - BLOCK
      ?auto_50480 - BLOCK
    )
    :vars
    (
      ?auto_50483 - BLOCK
      ?auto_50482 - BLOCK
      ?auto_50481 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_50477 ) ( not ( = ?auto_50477 ?auto_50478 ) ) ( not ( = ?auto_50477 ?auto_50479 ) ) ( not ( = ?auto_50477 ?auto_50480 ) ) ( not ( = ?auto_50478 ?auto_50479 ) ) ( not ( = ?auto_50478 ?auto_50480 ) ) ( not ( = ?auto_50479 ?auto_50480 ) ) ( ON ?auto_50480 ?auto_50483 ) ( not ( = ?auto_50477 ?auto_50483 ) ) ( not ( = ?auto_50478 ?auto_50483 ) ) ( not ( = ?auto_50479 ?auto_50483 ) ) ( not ( = ?auto_50480 ?auto_50483 ) ) ( ON ?auto_50479 ?auto_50480 ) ( CLEAR ?auto_50479 ) ( ON-TABLE ?auto_50482 ) ( ON ?auto_50481 ?auto_50482 ) ( ON ?auto_50483 ?auto_50481 ) ( not ( = ?auto_50482 ?auto_50481 ) ) ( not ( = ?auto_50482 ?auto_50483 ) ) ( not ( = ?auto_50482 ?auto_50480 ) ) ( not ( = ?auto_50482 ?auto_50479 ) ) ( not ( = ?auto_50481 ?auto_50483 ) ) ( not ( = ?auto_50481 ?auto_50480 ) ) ( not ( = ?auto_50481 ?auto_50479 ) ) ( not ( = ?auto_50477 ?auto_50482 ) ) ( not ( = ?auto_50477 ?auto_50481 ) ) ( not ( = ?auto_50478 ?auto_50482 ) ) ( not ( = ?auto_50478 ?auto_50481 ) ) ( HOLDING ?auto_50478 ) ( CLEAR ?auto_50477 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_50477 ?auto_50478 )
      ( MAKE-4PILE ?auto_50477 ?auto_50478 ?auto_50479 ?auto_50480 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_50484 - BLOCK
      ?auto_50485 - BLOCK
      ?auto_50486 - BLOCK
      ?auto_50487 - BLOCK
    )
    :vars
    (
      ?auto_50488 - BLOCK
      ?auto_50489 - BLOCK
      ?auto_50490 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_50484 ) ( not ( = ?auto_50484 ?auto_50485 ) ) ( not ( = ?auto_50484 ?auto_50486 ) ) ( not ( = ?auto_50484 ?auto_50487 ) ) ( not ( = ?auto_50485 ?auto_50486 ) ) ( not ( = ?auto_50485 ?auto_50487 ) ) ( not ( = ?auto_50486 ?auto_50487 ) ) ( ON ?auto_50487 ?auto_50488 ) ( not ( = ?auto_50484 ?auto_50488 ) ) ( not ( = ?auto_50485 ?auto_50488 ) ) ( not ( = ?auto_50486 ?auto_50488 ) ) ( not ( = ?auto_50487 ?auto_50488 ) ) ( ON ?auto_50486 ?auto_50487 ) ( ON-TABLE ?auto_50489 ) ( ON ?auto_50490 ?auto_50489 ) ( ON ?auto_50488 ?auto_50490 ) ( not ( = ?auto_50489 ?auto_50490 ) ) ( not ( = ?auto_50489 ?auto_50488 ) ) ( not ( = ?auto_50489 ?auto_50487 ) ) ( not ( = ?auto_50489 ?auto_50486 ) ) ( not ( = ?auto_50490 ?auto_50488 ) ) ( not ( = ?auto_50490 ?auto_50487 ) ) ( not ( = ?auto_50490 ?auto_50486 ) ) ( not ( = ?auto_50484 ?auto_50489 ) ) ( not ( = ?auto_50484 ?auto_50490 ) ) ( not ( = ?auto_50485 ?auto_50489 ) ) ( not ( = ?auto_50485 ?auto_50490 ) ) ( CLEAR ?auto_50484 ) ( ON ?auto_50485 ?auto_50486 ) ( CLEAR ?auto_50485 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_50489 ?auto_50490 ?auto_50488 ?auto_50487 ?auto_50486 )
      ( MAKE-4PILE ?auto_50484 ?auto_50485 ?auto_50486 ?auto_50487 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_50491 - BLOCK
      ?auto_50492 - BLOCK
      ?auto_50493 - BLOCK
      ?auto_50494 - BLOCK
    )
    :vars
    (
      ?auto_50496 - BLOCK
      ?auto_50497 - BLOCK
      ?auto_50495 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_50491 ?auto_50492 ) ) ( not ( = ?auto_50491 ?auto_50493 ) ) ( not ( = ?auto_50491 ?auto_50494 ) ) ( not ( = ?auto_50492 ?auto_50493 ) ) ( not ( = ?auto_50492 ?auto_50494 ) ) ( not ( = ?auto_50493 ?auto_50494 ) ) ( ON ?auto_50494 ?auto_50496 ) ( not ( = ?auto_50491 ?auto_50496 ) ) ( not ( = ?auto_50492 ?auto_50496 ) ) ( not ( = ?auto_50493 ?auto_50496 ) ) ( not ( = ?auto_50494 ?auto_50496 ) ) ( ON ?auto_50493 ?auto_50494 ) ( ON-TABLE ?auto_50497 ) ( ON ?auto_50495 ?auto_50497 ) ( ON ?auto_50496 ?auto_50495 ) ( not ( = ?auto_50497 ?auto_50495 ) ) ( not ( = ?auto_50497 ?auto_50496 ) ) ( not ( = ?auto_50497 ?auto_50494 ) ) ( not ( = ?auto_50497 ?auto_50493 ) ) ( not ( = ?auto_50495 ?auto_50496 ) ) ( not ( = ?auto_50495 ?auto_50494 ) ) ( not ( = ?auto_50495 ?auto_50493 ) ) ( not ( = ?auto_50491 ?auto_50497 ) ) ( not ( = ?auto_50491 ?auto_50495 ) ) ( not ( = ?auto_50492 ?auto_50497 ) ) ( not ( = ?auto_50492 ?auto_50495 ) ) ( ON ?auto_50492 ?auto_50493 ) ( CLEAR ?auto_50492 ) ( HOLDING ?auto_50491 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_50491 )
      ( MAKE-4PILE ?auto_50491 ?auto_50492 ?auto_50493 ?auto_50494 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_50498 - BLOCK
      ?auto_50499 - BLOCK
      ?auto_50500 - BLOCK
      ?auto_50501 - BLOCK
    )
    :vars
    (
      ?auto_50502 - BLOCK
      ?auto_50504 - BLOCK
      ?auto_50503 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_50498 ?auto_50499 ) ) ( not ( = ?auto_50498 ?auto_50500 ) ) ( not ( = ?auto_50498 ?auto_50501 ) ) ( not ( = ?auto_50499 ?auto_50500 ) ) ( not ( = ?auto_50499 ?auto_50501 ) ) ( not ( = ?auto_50500 ?auto_50501 ) ) ( ON ?auto_50501 ?auto_50502 ) ( not ( = ?auto_50498 ?auto_50502 ) ) ( not ( = ?auto_50499 ?auto_50502 ) ) ( not ( = ?auto_50500 ?auto_50502 ) ) ( not ( = ?auto_50501 ?auto_50502 ) ) ( ON ?auto_50500 ?auto_50501 ) ( ON-TABLE ?auto_50504 ) ( ON ?auto_50503 ?auto_50504 ) ( ON ?auto_50502 ?auto_50503 ) ( not ( = ?auto_50504 ?auto_50503 ) ) ( not ( = ?auto_50504 ?auto_50502 ) ) ( not ( = ?auto_50504 ?auto_50501 ) ) ( not ( = ?auto_50504 ?auto_50500 ) ) ( not ( = ?auto_50503 ?auto_50502 ) ) ( not ( = ?auto_50503 ?auto_50501 ) ) ( not ( = ?auto_50503 ?auto_50500 ) ) ( not ( = ?auto_50498 ?auto_50504 ) ) ( not ( = ?auto_50498 ?auto_50503 ) ) ( not ( = ?auto_50499 ?auto_50504 ) ) ( not ( = ?auto_50499 ?auto_50503 ) ) ( ON ?auto_50499 ?auto_50500 ) ( ON ?auto_50498 ?auto_50499 ) ( CLEAR ?auto_50498 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_50504 ?auto_50503 ?auto_50502 ?auto_50501 ?auto_50500 ?auto_50499 )
      ( MAKE-4PILE ?auto_50498 ?auto_50499 ?auto_50500 ?auto_50501 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_50507 - BLOCK
      ?auto_50508 - BLOCK
    )
    :vars
    (
      ?auto_50509 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50509 ?auto_50508 ) ( CLEAR ?auto_50509 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_50507 ) ( ON ?auto_50508 ?auto_50507 ) ( not ( = ?auto_50507 ?auto_50508 ) ) ( not ( = ?auto_50507 ?auto_50509 ) ) ( not ( = ?auto_50508 ?auto_50509 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_50509 ?auto_50508 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_50510 - BLOCK
      ?auto_50511 - BLOCK
    )
    :vars
    (
      ?auto_50512 - BLOCK
      ?auto_50513 - BLOCK
      ?auto_50514 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50512 ?auto_50511 ) ( CLEAR ?auto_50512 ) ( ON-TABLE ?auto_50510 ) ( ON ?auto_50511 ?auto_50510 ) ( not ( = ?auto_50510 ?auto_50511 ) ) ( not ( = ?auto_50510 ?auto_50512 ) ) ( not ( = ?auto_50511 ?auto_50512 ) ) ( HOLDING ?auto_50513 ) ( CLEAR ?auto_50514 ) ( not ( = ?auto_50510 ?auto_50513 ) ) ( not ( = ?auto_50510 ?auto_50514 ) ) ( not ( = ?auto_50511 ?auto_50513 ) ) ( not ( = ?auto_50511 ?auto_50514 ) ) ( not ( = ?auto_50512 ?auto_50513 ) ) ( not ( = ?auto_50512 ?auto_50514 ) ) ( not ( = ?auto_50513 ?auto_50514 ) ) )
    :subtasks
    ( ( !STACK ?auto_50513 ?auto_50514 )
      ( MAKE-2PILE ?auto_50510 ?auto_50511 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_50515 - BLOCK
      ?auto_50516 - BLOCK
    )
    :vars
    (
      ?auto_50519 - BLOCK
      ?auto_50517 - BLOCK
      ?auto_50518 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50519 ?auto_50516 ) ( ON-TABLE ?auto_50515 ) ( ON ?auto_50516 ?auto_50515 ) ( not ( = ?auto_50515 ?auto_50516 ) ) ( not ( = ?auto_50515 ?auto_50519 ) ) ( not ( = ?auto_50516 ?auto_50519 ) ) ( CLEAR ?auto_50517 ) ( not ( = ?auto_50515 ?auto_50518 ) ) ( not ( = ?auto_50515 ?auto_50517 ) ) ( not ( = ?auto_50516 ?auto_50518 ) ) ( not ( = ?auto_50516 ?auto_50517 ) ) ( not ( = ?auto_50519 ?auto_50518 ) ) ( not ( = ?auto_50519 ?auto_50517 ) ) ( not ( = ?auto_50518 ?auto_50517 ) ) ( ON ?auto_50518 ?auto_50519 ) ( CLEAR ?auto_50518 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_50515 ?auto_50516 ?auto_50519 )
      ( MAKE-2PILE ?auto_50515 ?auto_50516 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_50520 - BLOCK
      ?auto_50521 - BLOCK
    )
    :vars
    (
      ?auto_50523 - BLOCK
      ?auto_50522 - BLOCK
      ?auto_50524 - BLOCK
      ?auto_50525 - BLOCK
      ?auto_50526 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50523 ?auto_50521 ) ( ON-TABLE ?auto_50520 ) ( ON ?auto_50521 ?auto_50520 ) ( not ( = ?auto_50520 ?auto_50521 ) ) ( not ( = ?auto_50520 ?auto_50523 ) ) ( not ( = ?auto_50521 ?auto_50523 ) ) ( not ( = ?auto_50520 ?auto_50522 ) ) ( not ( = ?auto_50520 ?auto_50524 ) ) ( not ( = ?auto_50521 ?auto_50522 ) ) ( not ( = ?auto_50521 ?auto_50524 ) ) ( not ( = ?auto_50523 ?auto_50522 ) ) ( not ( = ?auto_50523 ?auto_50524 ) ) ( not ( = ?auto_50522 ?auto_50524 ) ) ( ON ?auto_50522 ?auto_50523 ) ( CLEAR ?auto_50522 ) ( HOLDING ?auto_50524 ) ( CLEAR ?auto_50525 ) ( ON-TABLE ?auto_50526 ) ( ON ?auto_50525 ?auto_50526 ) ( not ( = ?auto_50526 ?auto_50525 ) ) ( not ( = ?auto_50526 ?auto_50524 ) ) ( not ( = ?auto_50525 ?auto_50524 ) ) ( not ( = ?auto_50520 ?auto_50525 ) ) ( not ( = ?auto_50520 ?auto_50526 ) ) ( not ( = ?auto_50521 ?auto_50525 ) ) ( not ( = ?auto_50521 ?auto_50526 ) ) ( not ( = ?auto_50523 ?auto_50525 ) ) ( not ( = ?auto_50523 ?auto_50526 ) ) ( not ( = ?auto_50522 ?auto_50525 ) ) ( not ( = ?auto_50522 ?auto_50526 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_50526 ?auto_50525 ?auto_50524 )
      ( MAKE-2PILE ?auto_50520 ?auto_50521 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_50527 - BLOCK
      ?auto_50528 - BLOCK
    )
    :vars
    (
      ?auto_50531 - BLOCK
      ?auto_50533 - BLOCK
      ?auto_50530 - BLOCK
      ?auto_50532 - BLOCK
      ?auto_50529 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50531 ?auto_50528 ) ( ON-TABLE ?auto_50527 ) ( ON ?auto_50528 ?auto_50527 ) ( not ( = ?auto_50527 ?auto_50528 ) ) ( not ( = ?auto_50527 ?auto_50531 ) ) ( not ( = ?auto_50528 ?auto_50531 ) ) ( not ( = ?auto_50527 ?auto_50533 ) ) ( not ( = ?auto_50527 ?auto_50530 ) ) ( not ( = ?auto_50528 ?auto_50533 ) ) ( not ( = ?auto_50528 ?auto_50530 ) ) ( not ( = ?auto_50531 ?auto_50533 ) ) ( not ( = ?auto_50531 ?auto_50530 ) ) ( not ( = ?auto_50533 ?auto_50530 ) ) ( ON ?auto_50533 ?auto_50531 ) ( CLEAR ?auto_50532 ) ( ON-TABLE ?auto_50529 ) ( ON ?auto_50532 ?auto_50529 ) ( not ( = ?auto_50529 ?auto_50532 ) ) ( not ( = ?auto_50529 ?auto_50530 ) ) ( not ( = ?auto_50532 ?auto_50530 ) ) ( not ( = ?auto_50527 ?auto_50532 ) ) ( not ( = ?auto_50527 ?auto_50529 ) ) ( not ( = ?auto_50528 ?auto_50532 ) ) ( not ( = ?auto_50528 ?auto_50529 ) ) ( not ( = ?auto_50531 ?auto_50532 ) ) ( not ( = ?auto_50531 ?auto_50529 ) ) ( not ( = ?auto_50533 ?auto_50532 ) ) ( not ( = ?auto_50533 ?auto_50529 ) ) ( ON ?auto_50530 ?auto_50533 ) ( CLEAR ?auto_50530 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_50527 ?auto_50528 ?auto_50531 ?auto_50533 )
      ( MAKE-2PILE ?auto_50527 ?auto_50528 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_50534 - BLOCK
      ?auto_50535 - BLOCK
    )
    :vars
    (
      ?auto_50538 - BLOCK
      ?auto_50540 - BLOCK
      ?auto_50539 - BLOCK
      ?auto_50537 - BLOCK
      ?auto_50536 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50538 ?auto_50535 ) ( ON-TABLE ?auto_50534 ) ( ON ?auto_50535 ?auto_50534 ) ( not ( = ?auto_50534 ?auto_50535 ) ) ( not ( = ?auto_50534 ?auto_50538 ) ) ( not ( = ?auto_50535 ?auto_50538 ) ) ( not ( = ?auto_50534 ?auto_50540 ) ) ( not ( = ?auto_50534 ?auto_50539 ) ) ( not ( = ?auto_50535 ?auto_50540 ) ) ( not ( = ?auto_50535 ?auto_50539 ) ) ( not ( = ?auto_50538 ?auto_50540 ) ) ( not ( = ?auto_50538 ?auto_50539 ) ) ( not ( = ?auto_50540 ?auto_50539 ) ) ( ON ?auto_50540 ?auto_50538 ) ( ON-TABLE ?auto_50537 ) ( not ( = ?auto_50537 ?auto_50536 ) ) ( not ( = ?auto_50537 ?auto_50539 ) ) ( not ( = ?auto_50536 ?auto_50539 ) ) ( not ( = ?auto_50534 ?auto_50536 ) ) ( not ( = ?auto_50534 ?auto_50537 ) ) ( not ( = ?auto_50535 ?auto_50536 ) ) ( not ( = ?auto_50535 ?auto_50537 ) ) ( not ( = ?auto_50538 ?auto_50536 ) ) ( not ( = ?auto_50538 ?auto_50537 ) ) ( not ( = ?auto_50540 ?auto_50536 ) ) ( not ( = ?auto_50540 ?auto_50537 ) ) ( ON ?auto_50539 ?auto_50540 ) ( CLEAR ?auto_50539 ) ( HOLDING ?auto_50536 ) ( CLEAR ?auto_50537 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_50537 ?auto_50536 )
      ( MAKE-2PILE ?auto_50534 ?auto_50535 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_50541 - BLOCK
      ?auto_50542 - BLOCK
    )
    :vars
    (
      ?auto_50546 - BLOCK
      ?auto_50545 - BLOCK
      ?auto_50547 - BLOCK
      ?auto_50543 - BLOCK
      ?auto_50544 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50546 ?auto_50542 ) ( ON-TABLE ?auto_50541 ) ( ON ?auto_50542 ?auto_50541 ) ( not ( = ?auto_50541 ?auto_50542 ) ) ( not ( = ?auto_50541 ?auto_50546 ) ) ( not ( = ?auto_50542 ?auto_50546 ) ) ( not ( = ?auto_50541 ?auto_50545 ) ) ( not ( = ?auto_50541 ?auto_50547 ) ) ( not ( = ?auto_50542 ?auto_50545 ) ) ( not ( = ?auto_50542 ?auto_50547 ) ) ( not ( = ?auto_50546 ?auto_50545 ) ) ( not ( = ?auto_50546 ?auto_50547 ) ) ( not ( = ?auto_50545 ?auto_50547 ) ) ( ON ?auto_50545 ?auto_50546 ) ( ON-TABLE ?auto_50543 ) ( not ( = ?auto_50543 ?auto_50544 ) ) ( not ( = ?auto_50543 ?auto_50547 ) ) ( not ( = ?auto_50544 ?auto_50547 ) ) ( not ( = ?auto_50541 ?auto_50544 ) ) ( not ( = ?auto_50541 ?auto_50543 ) ) ( not ( = ?auto_50542 ?auto_50544 ) ) ( not ( = ?auto_50542 ?auto_50543 ) ) ( not ( = ?auto_50546 ?auto_50544 ) ) ( not ( = ?auto_50546 ?auto_50543 ) ) ( not ( = ?auto_50545 ?auto_50544 ) ) ( not ( = ?auto_50545 ?auto_50543 ) ) ( ON ?auto_50547 ?auto_50545 ) ( CLEAR ?auto_50543 ) ( ON ?auto_50544 ?auto_50547 ) ( CLEAR ?auto_50544 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_50541 ?auto_50542 ?auto_50546 ?auto_50545 ?auto_50547 )
      ( MAKE-2PILE ?auto_50541 ?auto_50542 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_50548 - BLOCK
      ?auto_50549 - BLOCK
    )
    :vars
    (
      ?auto_50554 - BLOCK
      ?auto_50552 - BLOCK
      ?auto_50551 - BLOCK
      ?auto_50553 - BLOCK
      ?auto_50550 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50554 ?auto_50549 ) ( ON-TABLE ?auto_50548 ) ( ON ?auto_50549 ?auto_50548 ) ( not ( = ?auto_50548 ?auto_50549 ) ) ( not ( = ?auto_50548 ?auto_50554 ) ) ( not ( = ?auto_50549 ?auto_50554 ) ) ( not ( = ?auto_50548 ?auto_50552 ) ) ( not ( = ?auto_50548 ?auto_50551 ) ) ( not ( = ?auto_50549 ?auto_50552 ) ) ( not ( = ?auto_50549 ?auto_50551 ) ) ( not ( = ?auto_50554 ?auto_50552 ) ) ( not ( = ?auto_50554 ?auto_50551 ) ) ( not ( = ?auto_50552 ?auto_50551 ) ) ( ON ?auto_50552 ?auto_50554 ) ( not ( = ?auto_50553 ?auto_50550 ) ) ( not ( = ?auto_50553 ?auto_50551 ) ) ( not ( = ?auto_50550 ?auto_50551 ) ) ( not ( = ?auto_50548 ?auto_50550 ) ) ( not ( = ?auto_50548 ?auto_50553 ) ) ( not ( = ?auto_50549 ?auto_50550 ) ) ( not ( = ?auto_50549 ?auto_50553 ) ) ( not ( = ?auto_50554 ?auto_50550 ) ) ( not ( = ?auto_50554 ?auto_50553 ) ) ( not ( = ?auto_50552 ?auto_50550 ) ) ( not ( = ?auto_50552 ?auto_50553 ) ) ( ON ?auto_50551 ?auto_50552 ) ( ON ?auto_50550 ?auto_50551 ) ( CLEAR ?auto_50550 ) ( HOLDING ?auto_50553 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_50553 )
      ( MAKE-2PILE ?auto_50548 ?auto_50549 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_50555 - BLOCK
      ?auto_50556 - BLOCK
    )
    :vars
    (
      ?auto_50559 - BLOCK
      ?auto_50558 - BLOCK
      ?auto_50560 - BLOCK
      ?auto_50557 - BLOCK
      ?auto_50561 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50559 ?auto_50556 ) ( ON-TABLE ?auto_50555 ) ( ON ?auto_50556 ?auto_50555 ) ( not ( = ?auto_50555 ?auto_50556 ) ) ( not ( = ?auto_50555 ?auto_50559 ) ) ( not ( = ?auto_50556 ?auto_50559 ) ) ( not ( = ?auto_50555 ?auto_50558 ) ) ( not ( = ?auto_50555 ?auto_50560 ) ) ( not ( = ?auto_50556 ?auto_50558 ) ) ( not ( = ?auto_50556 ?auto_50560 ) ) ( not ( = ?auto_50559 ?auto_50558 ) ) ( not ( = ?auto_50559 ?auto_50560 ) ) ( not ( = ?auto_50558 ?auto_50560 ) ) ( ON ?auto_50558 ?auto_50559 ) ( not ( = ?auto_50557 ?auto_50561 ) ) ( not ( = ?auto_50557 ?auto_50560 ) ) ( not ( = ?auto_50561 ?auto_50560 ) ) ( not ( = ?auto_50555 ?auto_50561 ) ) ( not ( = ?auto_50555 ?auto_50557 ) ) ( not ( = ?auto_50556 ?auto_50561 ) ) ( not ( = ?auto_50556 ?auto_50557 ) ) ( not ( = ?auto_50559 ?auto_50561 ) ) ( not ( = ?auto_50559 ?auto_50557 ) ) ( not ( = ?auto_50558 ?auto_50561 ) ) ( not ( = ?auto_50558 ?auto_50557 ) ) ( ON ?auto_50560 ?auto_50558 ) ( ON ?auto_50561 ?auto_50560 ) ( ON ?auto_50557 ?auto_50561 ) ( CLEAR ?auto_50557 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_50555 ?auto_50556 ?auto_50559 ?auto_50558 ?auto_50560 ?auto_50561 )
      ( MAKE-2PILE ?auto_50555 ?auto_50556 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_50567 - BLOCK
      ?auto_50568 - BLOCK
      ?auto_50569 - BLOCK
      ?auto_50570 - BLOCK
      ?auto_50571 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_50571 ) ( CLEAR ?auto_50570 ) ( ON-TABLE ?auto_50567 ) ( ON ?auto_50568 ?auto_50567 ) ( ON ?auto_50569 ?auto_50568 ) ( ON ?auto_50570 ?auto_50569 ) ( not ( = ?auto_50567 ?auto_50568 ) ) ( not ( = ?auto_50567 ?auto_50569 ) ) ( not ( = ?auto_50567 ?auto_50570 ) ) ( not ( = ?auto_50567 ?auto_50571 ) ) ( not ( = ?auto_50568 ?auto_50569 ) ) ( not ( = ?auto_50568 ?auto_50570 ) ) ( not ( = ?auto_50568 ?auto_50571 ) ) ( not ( = ?auto_50569 ?auto_50570 ) ) ( not ( = ?auto_50569 ?auto_50571 ) ) ( not ( = ?auto_50570 ?auto_50571 ) ) )
    :subtasks
    ( ( !STACK ?auto_50571 ?auto_50570 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_50572 - BLOCK
      ?auto_50573 - BLOCK
      ?auto_50574 - BLOCK
      ?auto_50575 - BLOCK
      ?auto_50576 - BLOCK
    )
    :vars
    (
      ?auto_50577 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_50575 ) ( ON-TABLE ?auto_50572 ) ( ON ?auto_50573 ?auto_50572 ) ( ON ?auto_50574 ?auto_50573 ) ( ON ?auto_50575 ?auto_50574 ) ( not ( = ?auto_50572 ?auto_50573 ) ) ( not ( = ?auto_50572 ?auto_50574 ) ) ( not ( = ?auto_50572 ?auto_50575 ) ) ( not ( = ?auto_50572 ?auto_50576 ) ) ( not ( = ?auto_50573 ?auto_50574 ) ) ( not ( = ?auto_50573 ?auto_50575 ) ) ( not ( = ?auto_50573 ?auto_50576 ) ) ( not ( = ?auto_50574 ?auto_50575 ) ) ( not ( = ?auto_50574 ?auto_50576 ) ) ( not ( = ?auto_50575 ?auto_50576 ) ) ( ON ?auto_50576 ?auto_50577 ) ( CLEAR ?auto_50576 ) ( HAND-EMPTY ) ( not ( = ?auto_50572 ?auto_50577 ) ) ( not ( = ?auto_50573 ?auto_50577 ) ) ( not ( = ?auto_50574 ?auto_50577 ) ) ( not ( = ?auto_50575 ?auto_50577 ) ) ( not ( = ?auto_50576 ?auto_50577 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_50576 ?auto_50577 )
      ( MAKE-5PILE ?auto_50572 ?auto_50573 ?auto_50574 ?auto_50575 ?auto_50576 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_50578 - BLOCK
      ?auto_50579 - BLOCK
      ?auto_50580 - BLOCK
      ?auto_50581 - BLOCK
      ?auto_50582 - BLOCK
    )
    :vars
    (
      ?auto_50583 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_50578 ) ( ON ?auto_50579 ?auto_50578 ) ( ON ?auto_50580 ?auto_50579 ) ( not ( = ?auto_50578 ?auto_50579 ) ) ( not ( = ?auto_50578 ?auto_50580 ) ) ( not ( = ?auto_50578 ?auto_50581 ) ) ( not ( = ?auto_50578 ?auto_50582 ) ) ( not ( = ?auto_50579 ?auto_50580 ) ) ( not ( = ?auto_50579 ?auto_50581 ) ) ( not ( = ?auto_50579 ?auto_50582 ) ) ( not ( = ?auto_50580 ?auto_50581 ) ) ( not ( = ?auto_50580 ?auto_50582 ) ) ( not ( = ?auto_50581 ?auto_50582 ) ) ( ON ?auto_50582 ?auto_50583 ) ( CLEAR ?auto_50582 ) ( not ( = ?auto_50578 ?auto_50583 ) ) ( not ( = ?auto_50579 ?auto_50583 ) ) ( not ( = ?auto_50580 ?auto_50583 ) ) ( not ( = ?auto_50581 ?auto_50583 ) ) ( not ( = ?auto_50582 ?auto_50583 ) ) ( HOLDING ?auto_50581 ) ( CLEAR ?auto_50580 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_50578 ?auto_50579 ?auto_50580 ?auto_50581 )
      ( MAKE-5PILE ?auto_50578 ?auto_50579 ?auto_50580 ?auto_50581 ?auto_50582 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_50584 - BLOCK
      ?auto_50585 - BLOCK
      ?auto_50586 - BLOCK
      ?auto_50587 - BLOCK
      ?auto_50588 - BLOCK
    )
    :vars
    (
      ?auto_50589 - BLOCK
      ?auto_50590 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_50584 ) ( ON ?auto_50585 ?auto_50584 ) ( ON ?auto_50586 ?auto_50585 ) ( not ( = ?auto_50584 ?auto_50585 ) ) ( not ( = ?auto_50584 ?auto_50586 ) ) ( not ( = ?auto_50584 ?auto_50587 ) ) ( not ( = ?auto_50584 ?auto_50588 ) ) ( not ( = ?auto_50585 ?auto_50586 ) ) ( not ( = ?auto_50585 ?auto_50587 ) ) ( not ( = ?auto_50585 ?auto_50588 ) ) ( not ( = ?auto_50586 ?auto_50587 ) ) ( not ( = ?auto_50586 ?auto_50588 ) ) ( not ( = ?auto_50587 ?auto_50588 ) ) ( ON ?auto_50588 ?auto_50589 ) ( not ( = ?auto_50584 ?auto_50589 ) ) ( not ( = ?auto_50585 ?auto_50589 ) ) ( not ( = ?auto_50586 ?auto_50589 ) ) ( not ( = ?auto_50587 ?auto_50589 ) ) ( not ( = ?auto_50588 ?auto_50589 ) ) ( CLEAR ?auto_50586 ) ( ON ?auto_50587 ?auto_50588 ) ( CLEAR ?auto_50587 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_50590 ) ( ON ?auto_50589 ?auto_50590 ) ( not ( = ?auto_50590 ?auto_50589 ) ) ( not ( = ?auto_50590 ?auto_50588 ) ) ( not ( = ?auto_50590 ?auto_50587 ) ) ( not ( = ?auto_50584 ?auto_50590 ) ) ( not ( = ?auto_50585 ?auto_50590 ) ) ( not ( = ?auto_50586 ?auto_50590 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_50590 ?auto_50589 ?auto_50588 )
      ( MAKE-5PILE ?auto_50584 ?auto_50585 ?auto_50586 ?auto_50587 ?auto_50588 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_50591 - BLOCK
      ?auto_50592 - BLOCK
      ?auto_50593 - BLOCK
      ?auto_50594 - BLOCK
      ?auto_50595 - BLOCK
    )
    :vars
    (
      ?auto_50596 - BLOCK
      ?auto_50597 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_50591 ) ( ON ?auto_50592 ?auto_50591 ) ( not ( = ?auto_50591 ?auto_50592 ) ) ( not ( = ?auto_50591 ?auto_50593 ) ) ( not ( = ?auto_50591 ?auto_50594 ) ) ( not ( = ?auto_50591 ?auto_50595 ) ) ( not ( = ?auto_50592 ?auto_50593 ) ) ( not ( = ?auto_50592 ?auto_50594 ) ) ( not ( = ?auto_50592 ?auto_50595 ) ) ( not ( = ?auto_50593 ?auto_50594 ) ) ( not ( = ?auto_50593 ?auto_50595 ) ) ( not ( = ?auto_50594 ?auto_50595 ) ) ( ON ?auto_50595 ?auto_50596 ) ( not ( = ?auto_50591 ?auto_50596 ) ) ( not ( = ?auto_50592 ?auto_50596 ) ) ( not ( = ?auto_50593 ?auto_50596 ) ) ( not ( = ?auto_50594 ?auto_50596 ) ) ( not ( = ?auto_50595 ?auto_50596 ) ) ( ON ?auto_50594 ?auto_50595 ) ( CLEAR ?auto_50594 ) ( ON-TABLE ?auto_50597 ) ( ON ?auto_50596 ?auto_50597 ) ( not ( = ?auto_50597 ?auto_50596 ) ) ( not ( = ?auto_50597 ?auto_50595 ) ) ( not ( = ?auto_50597 ?auto_50594 ) ) ( not ( = ?auto_50591 ?auto_50597 ) ) ( not ( = ?auto_50592 ?auto_50597 ) ) ( not ( = ?auto_50593 ?auto_50597 ) ) ( HOLDING ?auto_50593 ) ( CLEAR ?auto_50592 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_50591 ?auto_50592 ?auto_50593 )
      ( MAKE-5PILE ?auto_50591 ?auto_50592 ?auto_50593 ?auto_50594 ?auto_50595 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_50598 - BLOCK
      ?auto_50599 - BLOCK
      ?auto_50600 - BLOCK
      ?auto_50601 - BLOCK
      ?auto_50602 - BLOCK
    )
    :vars
    (
      ?auto_50603 - BLOCK
      ?auto_50604 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_50598 ) ( ON ?auto_50599 ?auto_50598 ) ( not ( = ?auto_50598 ?auto_50599 ) ) ( not ( = ?auto_50598 ?auto_50600 ) ) ( not ( = ?auto_50598 ?auto_50601 ) ) ( not ( = ?auto_50598 ?auto_50602 ) ) ( not ( = ?auto_50599 ?auto_50600 ) ) ( not ( = ?auto_50599 ?auto_50601 ) ) ( not ( = ?auto_50599 ?auto_50602 ) ) ( not ( = ?auto_50600 ?auto_50601 ) ) ( not ( = ?auto_50600 ?auto_50602 ) ) ( not ( = ?auto_50601 ?auto_50602 ) ) ( ON ?auto_50602 ?auto_50603 ) ( not ( = ?auto_50598 ?auto_50603 ) ) ( not ( = ?auto_50599 ?auto_50603 ) ) ( not ( = ?auto_50600 ?auto_50603 ) ) ( not ( = ?auto_50601 ?auto_50603 ) ) ( not ( = ?auto_50602 ?auto_50603 ) ) ( ON ?auto_50601 ?auto_50602 ) ( ON-TABLE ?auto_50604 ) ( ON ?auto_50603 ?auto_50604 ) ( not ( = ?auto_50604 ?auto_50603 ) ) ( not ( = ?auto_50604 ?auto_50602 ) ) ( not ( = ?auto_50604 ?auto_50601 ) ) ( not ( = ?auto_50598 ?auto_50604 ) ) ( not ( = ?auto_50599 ?auto_50604 ) ) ( not ( = ?auto_50600 ?auto_50604 ) ) ( CLEAR ?auto_50599 ) ( ON ?auto_50600 ?auto_50601 ) ( CLEAR ?auto_50600 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_50604 ?auto_50603 ?auto_50602 ?auto_50601 )
      ( MAKE-5PILE ?auto_50598 ?auto_50599 ?auto_50600 ?auto_50601 ?auto_50602 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_50605 - BLOCK
      ?auto_50606 - BLOCK
      ?auto_50607 - BLOCK
      ?auto_50608 - BLOCK
      ?auto_50609 - BLOCK
    )
    :vars
    (
      ?auto_50611 - BLOCK
      ?auto_50610 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_50605 ) ( not ( = ?auto_50605 ?auto_50606 ) ) ( not ( = ?auto_50605 ?auto_50607 ) ) ( not ( = ?auto_50605 ?auto_50608 ) ) ( not ( = ?auto_50605 ?auto_50609 ) ) ( not ( = ?auto_50606 ?auto_50607 ) ) ( not ( = ?auto_50606 ?auto_50608 ) ) ( not ( = ?auto_50606 ?auto_50609 ) ) ( not ( = ?auto_50607 ?auto_50608 ) ) ( not ( = ?auto_50607 ?auto_50609 ) ) ( not ( = ?auto_50608 ?auto_50609 ) ) ( ON ?auto_50609 ?auto_50611 ) ( not ( = ?auto_50605 ?auto_50611 ) ) ( not ( = ?auto_50606 ?auto_50611 ) ) ( not ( = ?auto_50607 ?auto_50611 ) ) ( not ( = ?auto_50608 ?auto_50611 ) ) ( not ( = ?auto_50609 ?auto_50611 ) ) ( ON ?auto_50608 ?auto_50609 ) ( ON-TABLE ?auto_50610 ) ( ON ?auto_50611 ?auto_50610 ) ( not ( = ?auto_50610 ?auto_50611 ) ) ( not ( = ?auto_50610 ?auto_50609 ) ) ( not ( = ?auto_50610 ?auto_50608 ) ) ( not ( = ?auto_50605 ?auto_50610 ) ) ( not ( = ?auto_50606 ?auto_50610 ) ) ( not ( = ?auto_50607 ?auto_50610 ) ) ( ON ?auto_50607 ?auto_50608 ) ( CLEAR ?auto_50607 ) ( HOLDING ?auto_50606 ) ( CLEAR ?auto_50605 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_50605 ?auto_50606 )
      ( MAKE-5PILE ?auto_50605 ?auto_50606 ?auto_50607 ?auto_50608 ?auto_50609 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_50612 - BLOCK
      ?auto_50613 - BLOCK
      ?auto_50614 - BLOCK
      ?auto_50615 - BLOCK
      ?auto_50616 - BLOCK
    )
    :vars
    (
      ?auto_50617 - BLOCK
      ?auto_50618 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_50612 ) ( not ( = ?auto_50612 ?auto_50613 ) ) ( not ( = ?auto_50612 ?auto_50614 ) ) ( not ( = ?auto_50612 ?auto_50615 ) ) ( not ( = ?auto_50612 ?auto_50616 ) ) ( not ( = ?auto_50613 ?auto_50614 ) ) ( not ( = ?auto_50613 ?auto_50615 ) ) ( not ( = ?auto_50613 ?auto_50616 ) ) ( not ( = ?auto_50614 ?auto_50615 ) ) ( not ( = ?auto_50614 ?auto_50616 ) ) ( not ( = ?auto_50615 ?auto_50616 ) ) ( ON ?auto_50616 ?auto_50617 ) ( not ( = ?auto_50612 ?auto_50617 ) ) ( not ( = ?auto_50613 ?auto_50617 ) ) ( not ( = ?auto_50614 ?auto_50617 ) ) ( not ( = ?auto_50615 ?auto_50617 ) ) ( not ( = ?auto_50616 ?auto_50617 ) ) ( ON ?auto_50615 ?auto_50616 ) ( ON-TABLE ?auto_50618 ) ( ON ?auto_50617 ?auto_50618 ) ( not ( = ?auto_50618 ?auto_50617 ) ) ( not ( = ?auto_50618 ?auto_50616 ) ) ( not ( = ?auto_50618 ?auto_50615 ) ) ( not ( = ?auto_50612 ?auto_50618 ) ) ( not ( = ?auto_50613 ?auto_50618 ) ) ( not ( = ?auto_50614 ?auto_50618 ) ) ( ON ?auto_50614 ?auto_50615 ) ( CLEAR ?auto_50612 ) ( ON ?auto_50613 ?auto_50614 ) ( CLEAR ?auto_50613 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_50618 ?auto_50617 ?auto_50616 ?auto_50615 ?auto_50614 )
      ( MAKE-5PILE ?auto_50612 ?auto_50613 ?auto_50614 ?auto_50615 ?auto_50616 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_50619 - BLOCK
      ?auto_50620 - BLOCK
      ?auto_50621 - BLOCK
      ?auto_50622 - BLOCK
      ?auto_50623 - BLOCK
    )
    :vars
    (
      ?auto_50625 - BLOCK
      ?auto_50624 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_50619 ?auto_50620 ) ) ( not ( = ?auto_50619 ?auto_50621 ) ) ( not ( = ?auto_50619 ?auto_50622 ) ) ( not ( = ?auto_50619 ?auto_50623 ) ) ( not ( = ?auto_50620 ?auto_50621 ) ) ( not ( = ?auto_50620 ?auto_50622 ) ) ( not ( = ?auto_50620 ?auto_50623 ) ) ( not ( = ?auto_50621 ?auto_50622 ) ) ( not ( = ?auto_50621 ?auto_50623 ) ) ( not ( = ?auto_50622 ?auto_50623 ) ) ( ON ?auto_50623 ?auto_50625 ) ( not ( = ?auto_50619 ?auto_50625 ) ) ( not ( = ?auto_50620 ?auto_50625 ) ) ( not ( = ?auto_50621 ?auto_50625 ) ) ( not ( = ?auto_50622 ?auto_50625 ) ) ( not ( = ?auto_50623 ?auto_50625 ) ) ( ON ?auto_50622 ?auto_50623 ) ( ON-TABLE ?auto_50624 ) ( ON ?auto_50625 ?auto_50624 ) ( not ( = ?auto_50624 ?auto_50625 ) ) ( not ( = ?auto_50624 ?auto_50623 ) ) ( not ( = ?auto_50624 ?auto_50622 ) ) ( not ( = ?auto_50619 ?auto_50624 ) ) ( not ( = ?auto_50620 ?auto_50624 ) ) ( not ( = ?auto_50621 ?auto_50624 ) ) ( ON ?auto_50621 ?auto_50622 ) ( ON ?auto_50620 ?auto_50621 ) ( CLEAR ?auto_50620 ) ( HOLDING ?auto_50619 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_50619 )
      ( MAKE-5PILE ?auto_50619 ?auto_50620 ?auto_50621 ?auto_50622 ?auto_50623 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_50626 - BLOCK
      ?auto_50627 - BLOCK
      ?auto_50628 - BLOCK
      ?auto_50629 - BLOCK
      ?auto_50630 - BLOCK
    )
    :vars
    (
      ?auto_50631 - BLOCK
      ?auto_50632 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_50626 ?auto_50627 ) ) ( not ( = ?auto_50626 ?auto_50628 ) ) ( not ( = ?auto_50626 ?auto_50629 ) ) ( not ( = ?auto_50626 ?auto_50630 ) ) ( not ( = ?auto_50627 ?auto_50628 ) ) ( not ( = ?auto_50627 ?auto_50629 ) ) ( not ( = ?auto_50627 ?auto_50630 ) ) ( not ( = ?auto_50628 ?auto_50629 ) ) ( not ( = ?auto_50628 ?auto_50630 ) ) ( not ( = ?auto_50629 ?auto_50630 ) ) ( ON ?auto_50630 ?auto_50631 ) ( not ( = ?auto_50626 ?auto_50631 ) ) ( not ( = ?auto_50627 ?auto_50631 ) ) ( not ( = ?auto_50628 ?auto_50631 ) ) ( not ( = ?auto_50629 ?auto_50631 ) ) ( not ( = ?auto_50630 ?auto_50631 ) ) ( ON ?auto_50629 ?auto_50630 ) ( ON-TABLE ?auto_50632 ) ( ON ?auto_50631 ?auto_50632 ) ( not ( = ?auto_50632 ?auto_50631 ) ) ( not ( = ?auto_50632 ?auto_50630 ) ) ( not ( = ?auto_50632 ?auto_50629 ) ) ( not ( = ?auto_50626 ?auto_50632 ) ) ( not ( = ?auto_50627 ?auto_50632 ) ) ( not ( = ?auto_50628 ?auto_50632 ) ) ( ON ?auto_50628 ?auto_50629 ) ( ON ?auto_50627 ?auto_50628 ) ( ON ?auto_50626 ?auto_50627 ) ( CLEAR ?auto_50626 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_50632 ?auto_50631 ?auto_50630 ?auto_50629 ?auto_50628 ?auto_50627 )
      ( MAKE-5PILE ?auto_50626 ?auto_50627 ?auto_50628 ?auto_50629 ?auto_50630 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_50634 - BLOCK
    )
    :vars
    (
      ?auto_50635 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50635 ?auto_50634 ) ( CLEAR ?auto_50635 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_50634 ) ( not ( = ?auto_50634 ?auto_50635 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_50635 ?auto_50634 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_50636 - BLOCK
    )
    :vars
    (
      ?auto_50637 - BLOCK
      ?auto_50638 - BLOCK
      ?auto_50639 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50637 ?auto_50636 ) ( CLEAR ?auto_50637 ) ( ON-TABLE ?auto_50636 ) ( not ( = ?auto_50636 ?auto_50637 ) ) ( HOLDING ?auto_50638 ) ( CLEAR ?auto_50639 ) ( not ( = ?auto_50636 ?auto_50638 ) ) ( not ( = ?auto_50636 ?auto_50639 ) ) ( not ( = ?auto_50637 ?auto_50638 ) ) ( not ( = ?auto_50637 ?auto_50639 ) ) ( not ( = ?auto_50638 ?auto_50639 ) ) )
    :subtasks
    ( ( !STACK ?auto_50638 ?auto_50639 )
      ( MAKE-1PILE ?auto_50636 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_50640 - BLOCK
    )
    :vars
    (
      ?auto_50641 - BLOCK
      ?auto_50642 - BLOCK
      ?auto_50643 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50641 ?auto_50640 ) ( ON-TABLE ?auto_50640 ) ( not ( = ?auto_50640 ?auto_50641 ) ) ( CLEAR ?auto_50642 ) ( not ( = ?auto_50640 ?auto_50643 ) ) ( not ( = ?auto_50640 ?auto_50642 ) ) ( not ( = ?auto_50641 ?auto_50643 ) ) ( not ( = ?auto_50641 ?auto_50642 ) ) ( not ( = ?auto_50643 ?auto_50642 ) ) ( ON ?auto_50643 ?auto_50641 ) ( CLEAR ?auto_50643 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_50640 ?auto_50641 )
      ( MAKE-1PILE ?auto_50640 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_50644 - BLOCK
    )
    :vars
    (
      ?auto_50647 - BLOCK
      ?auto_50646 - BLOCK
      ?auto_50645 - BLOCK
      ?auto_50650 - BLOCK
      ?auto_50648 - BLOCK
      ?auto_50649 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50647 ?auto_50644 ) ( ON-TABLE ?auto_50644 ) ( not ( = ?auto_50644 ?auto_50647 ) ) ( not ( = ?auto_50644 ?auto_50646 ) ) ( not ( = ?auto_50644 ?auto_50645 ) ) ( not ( = ?auto_50647 ?auto_50646 ) ) ( not ( = ?auto_50647 ?auto_50645 ) ) ( not ( = ?auto_50646 ?auto_50645 ) ) ( ON ?auto_50646 ?auto_50647 ) ( CLEAR ?auto_50646 ) ( HOLDING ?auto_50645 ) ( CLEAR ?auto_50650 ) ( ON-TABLE ?auto_50648 ) ( ON ?auto_50649 ?auto_50648 ) ( ON ?auto_50650 ?auto_50649 ) ( not ( = ?auto_50648 ?auto_50649 ) ) ( not ( = ?auto_50648 ?auto_50650 ) ) ( not ( = ?auto_50648 ?auto_50645 ) ) ( not ( = ?auto_50649 ?auto_50650 ) ) ( not ( = ?auto_50649 ?auto_50645 ) ) ( not ( = ?auto_50650 ?auto_50645 ) ) ( not ( = ?auto_50644 ?auto_50650 ) ) ( not ( = ?auto_50644 ?auto_50648 ) ) ( not ( = ?auto_50644 ?auto_50649 ) ) ( not ( = ?auto_50647 ?auto_50650 ) ) ( not ( = ?auto_50647 ?auto_50648 ) ) ( not ( = ?auto_50647 ?auto_50649 ) ) ( not ( = ?auto_50646 ?auto_50650 ) ) ( not ( = ?auto_50646 ?auto_50648 ) ) ( not ( = ?auto_50646 ?auto_50649 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_50648 ?auto_50649 ?auto_50650 ?auto_50645 )
      ( MAKE-1PILE ?auto_50644 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_50651 - BLOCK
    )
    :vars
    (
      ?auto_50655 - BLOCK
      ?auto_50652 - BLOCK
      ?auto_50656 - BLOCK
      ?auto_50653 - BLOCK
      ?auto_50654 - BLOCK
      ?auto_50657 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50655 ?auto_50651 ) ( ON-TABLE ?auto_50651 ) ( not ( = ?auto_50651 ?auto_50655 ) ) ( not ( = ?auto_50651 ?auto_50652 ) ) ( not ( = ?auto_50651 ?auto_50656 ) ) ( not ( = ?auto_50655 ?auto_50652 ) ) ( not ( = ?auto_50655 ?auto_50656 ) ) ( not ( = ?auto_50652 ?auto_50656 ) ) ( ON ?auto_50652 ?auto_50655 ) ( CLEAR ?auto_50653 ) ( ON-TABLE ?auto_50654 ) ( ON ?auto_50657 ?auto_50654 ) ( ON ?auto_50653 ?auto_50657 ) ( not ( = ?auto_50654 ?auto_50657 ) ) ( not ( = ?auto_50654 ?auto_50653 ) ) ( not ( = ?auto_50654 ?auto_50656 ) ) ( not ( = ?auto_50657 ?auto_50653 ) ) ( not ( = ?auto_50657 ?auto_50656 ) ) ( not ( = ?auto_50653 ?auto_50656 ) ) ( not ( = ?auto_50651 ?auto_50653 ) ) ( not ( = ?auto_50651 ?auto_50654 ) ) ( not ( = ?auto_50651 ?auto_50657 ) ) ( not ( = ?auto_50655 ?auto_50653 ) ) ( not ( = ?auto_50655 ?auto_50654 ) ) ( not ( = ?auto_50655 ?auto_50657 ) ) ( not ( = ?auto_50652 ?auto_50653 ) ) ( not ( = ?auto_50652 ?auto_50654 ) ) ( not ( = ?auto_50652 ?auto_50657 ) ) ( ON ?auto_50656 ?auto_50652 ) ( CLEAR ?auto_50656 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_50651 ?auto_50655 ?auto_50652 )
      ( MAKE-1PILE ?auto_50651 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_50658 - BLOCK
    )
    :vars
    (
      ?auto_50661 - BLOCK
      ?auto_50659 - BLOCK
      ?auto_50664 - BLOCK
      ?auto_50662 - BLOCK
      ?auto_50663 - BLOCK
      ?auto_50660 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50661 ?auto_50658 ) ( ON-TABLE ?auto_50658 ) ( not ( = ?auto_50658 ?auto_50661 ) ) ( not ( = ?auto_50658 ?auto_50659 ) ) ( not ( = ?auto_50658 ?auto_50664 ) ) ( not ( = ?auto_50661 ?auto_50659 ) ) ( not ( = ?auto_50661 ?auto_50664 ) ) ( not ( = ?auto_50659 ?auto_50664 ) ) ( ON ?auto_50659 ?auto_50661 ) ( ON-TABLE ?auto_50662 ) ( ON ?auto_50663 ?auto_50662 ) ( not ( = ?auto_50662 ?auto_50663 ) ) ( not ( = ?auto_50662 ?auto_50660 ) ) ( not ( = ?auto_50662 ?auto_50664 ) ) ( not ( = ?auto_50663 ?auto_50660 ) ) ( not ( = ?auto_50663 ?auto_50664 ) ) ( not ( = ?auto_50660 ?auto_50664 ) ) ( not ( = ?auto_50658 ?auto_50660 ) ) ( not ( = ?auto_50658 ?auto_50662 ) ) ( not ( = ?auto_50658 ?auto_50663 ) ) ( not ( = ?auto_50661 ?auto_50660 ) ) ( not ( = ?auto_50661 ?auto_50662 ) ) ( not ( = ?auto_50661 ?auto_50663 ) ) ( not ( = ?auto_50659 ?auto_50660 ) ) ( not ( = ?auto_50659 ?auto_50662 ) ) ( not ( = ?auto_50659 ?auto_50663 ) ) ( ON ?auto_50664 ?auto_50659 ) ( CLEAR ?auto_50664 ) ( HOLDING ?auto_50660 ) ( CLEAR ?auto_50663 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_50662 ?auto_50663 ?auto_50660 )
      ( MAKE-1PILE ?auto_50658 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_50665 - BLOCK
    )
    :vars
    (
      ?auto_50667 - BLOCK
      ?auto_50670 - BLOCK
      ?auto_50666 - BLOCK
      ?auto_50669 - BLOCK
      ?auto_50668 - BLOCK
      ?auto_50671 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50667 ?auto_50665 ) ( ON-TABLE ?auto_50665 ) ( not ( = ?auto_50665 ?auto_50667 ) ) ( not ( = ?auto_50665 ?auto_50670 ) ) ( not ( = ?auto_50665 ?auto_50666 ) ) ( not ( = ?auto_50667 ?auto_50670 ) ) ( not ( = ?auto_50667 ?auto_50666 ) ) ( not ( = ?auto_50670 ?auto_50666 ) ) ( ON ?auto_50670 ?auto_50667 ) ( ON-TABLE ?auto_50669 ) ( ON ?auto_50668 ?auto_50669 ) ( not ( = ?auto_50669 ?auto_50668 ) ) ( not ( = ?auto_50669 ?auto_50671 ) ) ( not ( = ?auto_50669 ?auto_50666 ) ) ( not ( = ?auto_50668 ?auto_50671 ) ) ( not ( = ?auto_50668 ?auto_50666 ) ) ( not ( = ?auto_50671 ?auto_50666 ) ) ( not ( = ?auto_50665 ?auto_50671 ) ) ( not ( = ?auto_50665 ?auto_50669 ) ) ( not ( = ?auto_50665 ?auto_50668 ) ) ( not ( = ?auto_50667 ?auto_50671 ) ) ( not ( = ?auto_50667 ?auto_50669 ) ) ( not ( = ?auto_50667 ?auto_50668 ) ) ( not ( = ?auto_50670 ?auto_50671 ) ) ( not ( = ?auto_50670 ?auto_50669 ) ) ( not ( = ?auto_50670 ?auto_50668 ) ) ( ON ?auto_50666 ?auto_50670 ) ( CLEAR ?auto_50668 ) ( ON ?auto_50671 ?auto_50666 ) ( CLEAR ?auto_50671 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_50665 ?auto_50667 ?auto_50670 ?auto_50666 )
      ( MAKE-1PILE ?auto_50665 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_50672 - BLOCK
    )
    :vars
    (
      ?auto_50673 - BLOCK
      ?auto_50675 - BLOCK
      ?auto_50674 - BLOCK
      ?auto_50676 - BLOCK
      ?auto_50678 - BLOCK
      ?auto_50677 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50673 ?auto_50672 ) ( ON-TABLE ?auto_50672 ) ( not ( = ?auto_50672 ?auto_50673 ) ) ( not ( = ?auto_50672 ?auto_50675 ) ) ( not ( = ?auto_50672 ?auto_50674 ) ) ( not ( = ?auto_50673 ?auto_50675 ) ) ( not ( = ?auto_50673 ?auto_50674 ) ) ( not ( = ?auto_50675 ?auto_50674 ) ) ( ON ?auto_50675 ?auto_50673 ) ( ON-TABLE ?auto_50676 ) ( not ( = ?auto_50676 ?auto_50678 ) ) ( not ( = ?auto_50676 ?auto_50677 ) ) ( not ( = ?auto_50676 ?auto_50674 ) ) ( not ( = ?auto_50678 ?auto_50677 ) ) ( not ( = ?auto_50678 ?auto_50674 ) ) ( not ( = ?auto_50677 ?auto_50674 ) ) ( not ( = ?auto_50672 ?auto_50677 ) ) ( not ( = ?auto_50672 ?auto_50676 ) ) ( not ( = ?auto_50672 ?auto_50678 ) ) ( not ( = ?auto_50673 ?auto_50677 ) ) ( not ( = ?auto_50673 ?auto_50676 ) ) ( not ( = ?auto_50673 ?auto_50678 ) ) ( not ( = ?auto_50675 ?auto_50677 ) ) ( not ( = ?auto_50675 ?auto_50676 ) ) ( not ( = ?auto_50675 ?auto_50678 ) ) ( ON ?auto_50674 ?auto_50675 ) ( ON ?auto_50677 ?auto_50674 ) ( CLEAR ?auto_50677 ) ( HOLDING ?auto_50678 ) ( CLEAR ?auto_50676 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_50676 ?auto_50678 )
      ( MAKE-1PILE ?auto_50672 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_50679 - BLOCK
    )
    :vars
    (
      ?auto_50685 - BLOCK
      ?auto_50684 - BLOCK
      ?auto_50680 - BLOCK
      ?auto_50683 - BLOCK
      ?auto_50681 - BLOCK
      ?auto_50682 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50685 ?auto_50679 ) ( ON-TABLE ?auto_50679 ) ( not ( = ?auto_50679 ?auto_50685 ) ) ( not ( = ?auto_50679 ?auto_50684 ) ) ( not ( = ?auto_50679 ?auto_50680 ) ) ( not ( = ?auto_50685 ?auto_50684 ) ) ( not ( = ?auto_50685 ?auto_50680 ) ) ( not ( = ?auto_50684 ?auto_50680 ) ) ( ON ?auto_50684 ?auto_50685 ) ( ON-TABLE ?auto_50683 ) ( not ( = ?auto_50683 ?auto_50681 ) ) ( not ( = ?auto_50683 ?auto_50682 ) ) ( not ( = ?auto_50683 ?auto_50680 ) ) ( not ( = ?auto_50681 ?auto_50682 ) ) ( not ( = ?auto_50681 ?auto_50680 ) ) ( not ( = ?auto_50682 ?auto_50680 ) ) ( not ( = ?auto_50679 ?auto_50682 ) ) ( not ( = ?auto_50679 ?auto_50683 ) ) ( not ( = ?auto_50679 ?auto_50681 ) ) ( not ( = ?auto_50685 ?auto_50682 ) ) ( not ( = ?auto_50685 ?auto_50683 ) ) ( not ( = ?auto_50685 ?auto_50681 ) ) ( not ( = ?auto_50684 ?auto_50682 ) ) ( not ( = ?auto_50684 ?auto_50683 ) ) ( not ( = ?auto_50684 ?auto_50681 ) ) ( ON ?auto_50680 ?auto_50684 ) ( ON ?auto_50682 ?auto_50680 ) ( CLEAR ?auto_50683 ) ( ON ?auto_50681 ?auto_50682 ) ( CLEAR ?auto_50681 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_50679 ?auto_50685 ?auto_50684 ?auto_50680 ?auto_50682 )
      ( MAKE-1PILE ?auto_50679 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_50686 - BLOCK
    )
    :vars
    (
      ?auto_50690 - BLOCK
      ?auto_50688 - BLOCK
      ?auto_50692 - BLOCK
      ?auto_50691 - BLOCK
      ?auto_50687 - BLOCK
      ?auto_50689 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50690 ?auto_50686 ) ( ON-TABLE ?auto_50686 ) ( not ( = ?auto_50686 ?auto_50690 ) ) ( not ( = ?auto_50686 ?auto_50688 ) ) ( not ( = ?auto_50686 ?auto_50692 ) ) ( not ( = ?auto_50690 ?auto_50688 ) ) ( not ( = ?auto_50690 ?auto_50692 ) ) ( not ( = ?auto_50688 ?auto_50692 ) ) ( ON ?auto_50688 ?auto_50690 ) ( not ( = ?auto_50691 ?auto_50687 ) ) ( not ( = ?auto_50691 ?auto_50689 ) ) ( not ( = ?auto_50691 ?auto_50692 ) ) ( not ( = ?auto_50687 ?auto_50689 ) ) ( not ( = ?auto_50687 ?auto_50692 ) ) ( not ( = ?auto_50689 ?auto_50692 ) ) ( not ( = ?auto_50686 ?auto_50689 ) ) ( not ( = ?auto_50686 ?auto_50691 ) ) ( not ( = ?auto_50686 ?auto_50687 ) ) ( not ( = ?auto_50690 ?auto_50689 ) ) ( not ( = ?auto_50690 ?auto_50691 ) ) ( not ( = ?auto_50690 ?auto_50687 ) ) ( not ( = ?auto_50688 ?auto_50689 ) ) ( not ( = ?auto_50688 ?auto_50691 ) ) ( not ( = ?auto_50688 ?auto_50687 ) ) ( ON ?auto_50692 ?auto_50688 ) ( ON ?auto_50689 ?auto_50692 ) ( ON ?auto_50687 ?auto_50689 ) ( CLEAR ?auto_50687 ) ( HOLDING ?auto_50691 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_50691 )
      ( MAKE-1PILE ?auto_50686 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_50693 - BLOCK
    )
    :vars
    (
      ?auto_50699 - BLOCK
      ?auto_50695 - BLOCK
      ?auto_50697 - BLOCK
      ?auto_50698 - BLOCK
      ?auto_50696 - BLOCK
      ?auto_50694 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50699 ?auto_50693 ) ( ON-TABLE ?auto_50693 ) ( not ( = ?auto_50693 ?auto_50699 ) ) ( not ( = ?auto_50693 ?auto_50695 ) ) ( not ( = ?auto_50693 ?auto_50697 ) ) ( not ( = ?auto_50699 ?auto_50695 ) ) ( not ( = ?auto_50699 ?auto_50697 ) ) ( not ( = ?auto_50695 ?auto_50697 ) ) ( ON ?auto_50695 ?auto_50699 ) ( not ( = ?auto_50698 ?auto_50696 ) ) ( not ( = ?auto_50698 ?auto_50694 ) ) ( not ( = ?auto_50698 ?auto_50697 ) ) ( not ( = ?auto_50696 ?auto_50694 ) ) ( not ( = ?auto_50696 ?auto_50697 ) ) ( not ( = ?auto_50694 ?auto_50697 ) ) ( not ( = ?auto_50693 ?auto_50694 ) ) ( not ( = ?auto_50693 ?auto_50698 ) ) ( not ( = ?auto_50693 ?auto_50696 ) ) ( not ( = ?auto_50699 ?auto_50694 ) ) ( not ( = ?auto_50699 ?auto_50698 ) ) ( not ( = ?auto_50699 ?auto_50696 ) ) ( not ( = ?auto_50695 ?auto_50694 ) ) ( not ( = ?auto_50695 ?auto_50698 ) ) ( not ( = ?auto_50695 ?auto_50696 ) ) ( ON ?auto_50697 ?auto_50695 ) ( ON ?auto_50694 ?auto_50697 ) ( ON ?auto_50696 ?auto_50694 ) ( ON ?auto_50698 ?auto_50696 ) ( CLEAR ?auto_50698 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_50693 ?auto_50699 ?auto_50695 ?auto_50697 ?auto_50694 ?auto_50696 )
      ( MAKE-1PILE ?auto_50693 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_50706 - BLOCK
      ?auto_50707 - BLOCK
      ?auto_50708 - BLOCK
      ?auto_50709 - BLOCK
      ?auto_50710 - BLOCK
      ?auto_50711 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_50711 ) ( CLEAR ?auto_50710 ) ( ON-TABLE ?auto_50706 ) ( ON ?auto_50707 ?auto_50706 ) ( ON ?auto_50708 ?auto_50707 ) ( ON ?auto_50709 ?auto_50708 ) ( ON ?auto_50710 ?auto_50709 ) ( not ( = ?auto_50706 ?auto_50707 ) ) ( not ( = ?auto_50706 ?auto_50708 ) ) ( not ( = ?auto_50706 ?auto_50709 ) ) ( not ( = ?auto_50706 ?auto_50710 ) ) ( not ( = ?auto_50706 ?auto_50711 ) ) ( not ( = ?auto_50707 ?auto_50708 ) ) ( not ( = ?auto_50707 ?auto_50709 ) ) ( not ( = ?auto_50707 ?auto_50710 ) ) ( not ( = ?auto_50707 ?auto_50711 ) ) ( not ( = ?auto_50708 ?auto_50709 ) ) ( not ( = ?auto_50708 ?auto_50710 ) ) ( not ( = ?auto_50708 ?auto_50711 ) ) ( not ( = ?auto_50709 ?auto_50710 ) ) ( not ( = ?auto_50709 ?auto_50711 ) ) ( not ( = ?auto_50710 ?auto_50711 ) ) )
    :subtasks
    ( ( !STACK ?auto_50711 ?auto_50710 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_50712 - BLOCK
      ?auto_50713 - BLOCK
      ?auto_50714 - BLOCK
      ?auto_50715 - BLOCK
      ?auto_50716 - BLOCK
      ?auto_50717 - BLOCK
    )
    :vars
    (
      ?auto_50718 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_50716 ) ( ON-TABLE ?auto_50712 ) ( ON ?auto_50713 ?auto_50712 ) ( ON ?auto_50714 ?auto_50713 ) ( ON ?auto_50715 ?auto_50714 ) ( ON ?auto_50716 ?auto_50715 ) ( not ( = ?auto_50712 ?auto_50713 ) ) ( not ( = ?auto_50712 ?auto_50714 ) ) ( not ( = ?auto_50712 ?auto_50715 ) ) ( not ( = ?auto_50712 ?auto_50716 ) ) ( not ( = ?auto_50712 ?auto_50717 ) ) ( not ( = ?auto_50713 ?auto_50714 ) ) ( not ( = ?auto_50713 ?auto_50715 ) ) ( not ( = ?auto_50713 ?auto_50716 ) ) ( not ( = ?auto_50713 ?auto_50717 ) ) ( not ( = ?auto_50714 ?auto_50715 ) ) ( not ( = ?auto_50714 ?auto_50716 ) ) ( not ( = ?auto_50714 ?auto_50717 ) ) ( not ( = ?auto_50715 ?auto_50716 ) ) ( not ( = ?auto_50715 ?auto_50717 ) ) ( not ( = ?auto_50716 ?auto_50717 ) ) ( ON ?auto_50717 ?auto_50718 ) ( CLEAR ?auto_50717 ) ( HAND-EMPTY ) ( not ( = ?auto_50712 ?auto_50718 ) ) ( not ( = ?auto_50713 ?auto_50718 ) ) ( not ( = ?auto_50714 ?auto_50718 ) ) ( not ( = ?auto_50715 ?auto_50718 ) ) ( not ( = ?auto_50716 ?auto_50718 ) ) ( not ( = ?auto_50717 ?auto_50718 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_50717 ?auto_50718 )
      ( MAKE-6PILE ?auto_50712 ?auto_50713 ?auto_50714 ?auto_50715 ?auto_50716 ?auto_50717 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_50719 - BLOCK
      ?auto_50720 - BLOCK
      ?auto_50721 - BLOCK
      ?auto_50722 - BLOCK
      ?auto_50723 - BLOCK
      ?auto_50724 - BLOCK
    )
    :vars
    (
      ?auto_50725 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_50719 ) ( ON ?auto_50720 ?auto_50719 ) ( ON ?auto_50721 ?auto_50720 ) ( ON ?auto_50722 ?auto_50721 ) ( not ( = ?auto_50719 ?auto_50720 ) ) ( not ( = ?auto_50719 ?auto_50721 ) ) ( not ( = ?auto_50719 ?auto_50722 ) ) ( not ( = ?auto_50719 ?auto_50723 ) ) ( not ( = ?auto_50719 ?auto_50724 ) ) ( not ( = ?auto_50720 ?auto_50721 ) ) ( not ( = ?auto_50720 ?auto_50722 ) ) ( not ( = ?auto_50720 ?auto_50723 ) ) ( not ( = ?auto_50720 ?auto_50724 ) ) ( not ( = ?auto_50721 ?auto_50722 ) ) ( not ( = ?auto_50721 ?auto_50723 ) ) ( not ( = ?auto_50721 ?auto_50724 ) ) ( not ( = ?auto_50722 ?auto_50723 ) ) ( not ( = ?auto_50722 ?auto_50724 ) ) ( not ( = ?auto_50723 ?auto_50724 ) ) ( ON ?auto_50724 ?auto_50725 ) ( CLEAR ?auto_50724 ) ( not ( = ?auto_50719 ?auto_50725 ) ) ( not ( = ?auto_50720 ?auto_50725 ) ) ( not ( = ?auto_50721 ?auto_50725 ) ) ( not ( = ?auto_50722 ?auto_50725 ) ) ( not ( = ?auto_50723 ?auto_50725 ) ) ( not ( = ?auto_50724 ?auto_50725 ) ) ( HOLDING ?auto_50723 ) ( CLEAR ?auto_50722 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_50719 ?auto_50720 ?auto_50721 ?auto_50722 ?auto_50723 )
      ( MAKE-6PILE ?auto_50719 ?auto_50720 ?auto_50721 ?auto_50722 ?auto_50723 ?auto_50724 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_50726 - BLOCK
      ?auto_50727 - BLOCK
      ?auto_50728 - BLOCK
      ?auto_50729 - BLOCK
      ?auto_50730 - BLOCK
      ?auto_50731 - BLOCK
    )
    :vars
    (
      ?auto_50732 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_50726 ) ( ON ?auto_50727 ?auto_50726 ) ( ON ?auto_50728 ?auto_50727 ) ( ON ?auto_50729 ?auto_50728 ) ( not ( = ?auto_50726 ?auto_50727 ) ) ( not ( = ?auto_50726 ?auto_50728 ) ) ( not ( = ?auto_50726 ?auto_50729 ) ) ( not ( = ?auto_50726 ?auto_50730 ) ) ( not ( = ?auto_50726 ?auto_50731 ) ) ( not ( = ?auto_50727 ?auto_50728 ) ) ( not ( = ?auto_50727 ?auto_50729 ) ) ( not ( = ?auto_50727 ?auto_50730 ) ) ( not ( = ?auto_50727 ?auto_50731 ) ) ( not ( = ?auto_50728 ?auto_50729 ) ) ( not ( = ?auto_50728 ?auto_50730 ) ) ( not ( = ?auto_50728 ?auto_50731 ) ) ( not ( = ?auto_50729 ?auto_50730 ) ) ( not ( = ?auto_50729 ?auto_50731 ) ) ( not ( = ?auto_50730 ?auto_50731 ) ) ( ON ?auto_50731 ?auto_50732 ) ( not ( = ?auto_50726 ?auto_50732 ) ) ( not ( = ?auto_50727 ?auto_50732 ) ) ( not ( = ?auto_50728 ?auto_50732 ) ) ( not ( = ?auto_50729 ?auto_50732 ) ) ( not ( = ?auto_50730 ?auto_50732 ) ) ( not ( = ?auto_50731 ?auto_50732 ) ) ( CLEAR ?auto_50729 ) ( ON ?auto_50730 ?auto_50731 ) ( CLEAR ?auto_50730 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_50732 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_50732 ?auto_50731 )
      ( MAKE-6PILE ?auto_50726 ?auto_50727 ?auto_50728 ?auto_50729 ?auto_50730 ?auto_50731 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_50733 - BLOCK
      ?auto_50734 - BLOCK
      ?auto_50735 - BLOCK
      ?auto_50736 - BLOCK
      ?auto_50737 - BLOCK
      ?auto_50738 - BLOCK
    )
    :vars
    (
      ?auto_50739 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_50733 ) ( ON ?auto_50734 ?auto_50733 ) ( ON ?auto_50735 ?auto_50734 ) ( not ( = ?auto_50733 ?auto_50734 ) ) ( not ( = ?auto_50733 ?auto_50735 ) ) ( not ( = ?auto_50733 ?auto_50736 ) ) ( not ( = ?auto_50733 ?auto_50737 ) ) ( not ( = ?auto_50733 ?auto_50738 ) ) ( not ( = ?auto_50734 ?auto_50735 ) ) ( not ( = ?auto_50734 ?auto_50736 ) ) ( not ( = ?auto_50734 ?auto_50737 ) ) ( not ( = ?auto_50734 ?auto_50738 ) ) ( not ( = ?auto_50735 ?auto_50736 ) ) ( not ( = ?auto_50735 ?auto_50737 ) ) ( not ( = ?auto_50735 ?auto_50738 ) ) ( not ( = ?auto_50736 ?auto_50737 ) ) ( not ( = ?auto_50736 ?auto_50738 ) ) ( not ( = ?auto_50737 ?auto_50738 ) ) ( ON ?auto_50738 ?auto_50739 ) ( not ( = ?auto_50733 ?auto_50739 ) ) ( not ( = ?auto_50734 ?auto_50739 ) ) ( not ( = ?auto_50735 ?auto_50739 ) ) ( not ( = ?auto_50736 ?auto_50739 ) ) ( not ( = ?auto_50737 ?auto_50739 ) ) ( not ( = ?auto_50738 ?auto_50739 ) ) ( ON ?auto_50737 ?auto_50738 ) ( CLEAR ?auto_50737 ) ( ON-TABLE ?auto_50739 ) ( HOLDING ?auto_50736 ) ( CLEAR ?auto_50735 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_50733 ?auto_50734 ?auto_50735 ?auto_50736 )
      ( MAKE-6PILE ?auto_50733 ?auto_50734 ?auto_50735 ?auto_50736 ?auto_50737 ?auto_50738 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_50740 - BLOCK
      ?auto_50741 - BLOCK
      ?auto_50742 - BLOCK
      ?auto_50743 - BLOCK
      ?auto_50744 - BLOCK
      ?auto_50745 - BLOCK
    )
    :vars
    (
      ?auto_50746 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_50740 ) ( ON ?auto_50741 ?auto_50740 ) ( ON ?auto_50742 ?auto_50741 ) ( not ( = ?auto_50740 ?auto_50741 ) ) ( not ( = ?auto_50740 ?auto_50742 ) ) ( not ( = ?auto_50740 ?auto_50743 ) ) ( not ( = ?auto_50740 ?auto_50744 ) ) ( not ( = ?auto_50740 ?auto_50745 ) ) ( not ( = ?auto_50741 ?auto_50742 ) ) ( not ( = ?auto_50741 ?auto_50743 ) ) ( not ( = ?auto_50741 ?auto_50744 ) ) ( not ( = ?auto_50741 ?auto_50745 ) ) ( not ( = ?auto_50742 ?auto_50743 ) ) ( not ( = ?auto_50742 ?auto_50744 ) ) ( not ( = ?auto_50742 ?auto_50745 ) ) ( not ( = ?auto_50743 ?auto_50744 ) ) ( not ( = ?auto_50743 ?auto_50745 ) ) ( not ( = ?auto_50744 ?auto_50745 ) ) ( ON ?auto_50745 ?auto_50746 ) ( not ( = ?auto_50740 ?auto_50746 ) ) ( not ( = ?auto_50741 ?auto_50746 ) ) ( not ( = ?auto_50742 ?auto_50746 ) ) ( not ( = ?auto_50743 ?auto_50746 ) ) ( not ( = ?auto_50744 ?auto_50746 ) ) ( not ( = ?auto_50745 ?auto_50746 ) ) ( ON ?auto_50744 ?auto_50745 ) ( ON-TABLE ?auto_50746 ) ( CLEAR ?auto_50742 ) ( ON ?auto_50743 ?auto_50744 ) ( CLEAR ?auto_50743 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_50746 ?auto_50745 ?auto_50744 )
      ( MAKE-6PILE ?auto_50740 ?auto_50741 ?auto_50742 ?auto_50743 ?auto_50744 ?auto_50745 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_50747 - BLOCK
      ?auto_50748 - BLOCK
      ?auto_50749 - BLOCK
      ?auto_50750 - BLOCK
      ?auto_50751 - BLOCK
      ?auto_50752 - BLOCK
    )
    :vars
    (
      ?auto_50753 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_50747 ) ( ON ?auto_50748 ?auto_50747 ) ( not ( = ?auto_50747 ?auto_50748 ) ) ( not ( = ?auto_50747 ?auto_50749 ) ) ( not ( = ?auto_50747 ?auto_50750 ) ) ( not ( = ?auto_50747 ?auto_50751 ) ) ( not ( = ?auto_50747 ?auto_50752 ) ) ( not ( = ?auto_50748 ?auto_50749 ) ) ( not ( = ?auto_50748 ?auto_50750 ) ) ( not ( = ?auto_50748 ?auto_50751 ) ) ( not ( = ?auto_50748 ?auto_50752 ) ) ( not ( = ?auto_50749 ?auto_50750 ) ) ( not ( = ?auto_50749 ?auto_50751 ) ) ( not ( = ?auto_50749 ?auto_50752 ) ) ( not ( = ?auto_50750 ?auto_50751 ) ) ( not ( = ?auto_50750 ?auto_50752 ) ) ( not ( = ?auto_50751 ?auto_50752 ) ) ( ON ?auto_50752 ?auto_50753 ) ( not ( = ?auto_50747 ?auto_50753 ) ) ( not ( = ?auto_50748 ?auto_50753 ) ) ( not ( = ?auto_50749 ?auto_50753 ) ) ( not ( = ?auto_50750 ?auto_50753 ) ) ( not ( = ?auto_50751 ?auto_50753 ) ) ( not ( = ?auto_50752 ?auto_50753 ) ) ( ON ?auto_50751 ?auto_50752 ) ( ON-TABLE ?auto_50753 ) ( ON ?auto_50750 ?auto_50751 ) ( CLEAR ?auto_50750 ) ( HOLDING ?auto_50749 ) ( CLEAR ?auto_50748 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_50747 ?auto_50748 ?auto_50749 )
      ( MAKE-6PILE ?auto_50747 ?auto_50748 ?auto_50749 ?auto_50750 ?auto_50751 ?auto_50752 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_50754 - BLOCK
      ?auto_50755 - BLOCK
      ?auto_50756 - BLOCK
      ?auto_50757 - BLOCK
      ?auto_50758 - BLOCK
      ?auto_50759 - BLOCK
    )
    :vars
    (
      ?auto_50760 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_50754 ) ( ON ?auto_50755 ?auto_50754 ) ( not ( = ?auto_50754 ?auto_50755 ) ) ( not ( = ?auto_50754 ?auto_50756 ) ) ( not ( = ?auto_50754 ?auto_50757 ) ) ( not ( = ?auto_50754 ?auto_50758 ) ) ( not ( = ?auto_50754 ?auto_50759 ) ) ( not ( = ?auto_50755 ?auto_50756 ) ) ( not ( = ?auto_50755 ?auto_50757 ) ) ( not ( = ?auto_50755 ?auto_50758 ) ) ( not ( = ?auto_50755 ?auto_50759 ) ) ( not ( = ?auto_50756 ?auto_50757 ) ) ( not ( = ?auto_50756 ?auto_50758 ) ) ( not ( = ?auto_50756 ?auto_50759 ) ) ( not ( = ?auto_50757 ?auto_50758 ) ) ( not ( = ?auto_50757 ?auto_50759 ) ) ( not ( = ?auto_50758 ?auto_50759 ) ) ( ON ?auto_50759 ?auto_50760 ) ( not ( = ?auto_50754 ?auto_50760 ) ) ( not ( = ?auto_50755 ?auto_50760 ) ) ( not ( = ?auto_50756 ?auto_50760 ) ) ( not ( = ?auto_50757 ?auto_50760 ) ) ( not ( = ?auto_50758 ?auto_50760 ) ) ( not ( = ?auto_50759 ?auto_50760 ) ) ( ON ?auto_50758 ?auto_50759 ) ( ON-TABLE ?auto_50760 ) ( ON ?auto_50757 ?auto_50758 ) ( CLEAR ?auto_50755 ) ( ON ?auto_50756 ?auto_50757 ) ( CLEAR ?auto_50756 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_50760 ?auto_50759 ?auto_50758 ?auto_50757 )
      ( MAKE-6PILE ?auto_50754 ?auto_50755 ?auto_50756 ?auto_50757 ?auto_50758 ?auto_50759 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_50761 - BLOCK
      ?auto_50762 - BLOCK
      ?auto_50763 - BLOCK
      ?auto_50764 - BLOCK
      ?auto_50765 - BLOCK
      ?auto_50766 - BLOCK
    )
    :vars
    (
      ?auto_50767 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_50761 ) ( not ( = ?auto_50761 ?auto_50762 ) ) ( not ( = ?auto_50761 ?auto_50763 ) ) ( not ( = ?auto_50761 ?auto_50764 ) ) ( not ( = ?auto_50761 ?auto_50765 ) ) ( not ( = ?auto_50761 ?auto_50766 ) ) ( not ( = ?auto_50762 ?auto_50763 ) ) ( not ( = ?auto_50762 ?auto_50764 ) ) ( not ( = ?auto_50762 ?auto_50765 ) ) ( not ( = ?auto_50762 ?auto_50766 ) ) ( not ( = ?auto_50763 ?auto_50764 ) ) ( not ( = ?auto_50763 ?auto_50765 ) ) ( not ( = ?auto_50763 ?auto_50766 ) ) ( not ( = ?auto_50764 ?auto_50765 ) ) ( not ( = ?auto_50764 ?auto_50766 ) ) ( not ( = ?auto_50765 ?auto_50766 ) ) ( ON ?auto_50766 ?auto_50767 ) ( not ( = ?auto_50761 ?auto_50767 ) ) ( not ( = ?auto_50762 ?auto_50767 ) ) ( not ( = ?auto_50763 ?auto_50767 ) ) ( not ( = ?auto_50764 ?auto_50767 ) ) ( not ( = ?auto_50765 ?auto_50767 ) ) ( not ( = ?auto_50766 ?auto_50767 ) ) ( ON ?auto_50765 ?auto_50766 ) ( ON-TABLE ?auto_50767 ) ( ON ?auto_50764 ?auto_50765 ) ( ON ?auto_50763 ?auto_50764 ) ( CLEAR ?auto_50763 ) ( HOLDING ?auto_50762 ) ( CLEAR ?auto_50761 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_50761 ?auto_50762 )
      ( MAKE-6PILE ?auto_50761 ?auto_50762 ?auto_50763 ?auto_50764 ?auto_50765 ?auto_50766 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_50768 - BLOCK
      ?auto_50769 - BLOCK
      ?auto_50770 - BLOCK
      ?auto_50771 - BLOCK
      ?auto_50772 - BLOCK
      ?auto_50773 - BLOCK
    )
    :vars
    (
      ?auto_50774 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_50768 ) ( not ( = ?auto_50768 ?auto_50769 ) ) ( not ( = ?auto_50768 ?auto_50770 ) ) ( not ( = ?auto_50768 ?auto_50771 ) ) ( not ( = ?auto_50768 ?auto_50772 ) ) ( not ( = ?auto_50768 ?auto_50773 ) ) ( not ( = ?auto_50769 ?auto_50770 ) ) ( not ( = ?auto_50769 ?auto_50771 ) ) ( not ( = ?auto_50769 ?auto_50772 ) ) ( not ( = ?auto_50769 ?auto_50773 ) ) ( not ( = ?auto_50770 ?auto_50771 ) ) ( not ( = ?auto_50770 ?auto_50772 ) ) ( not ( = ?auto_50770 ?auto_50773 ) ) ( not ( = ?auto_50771 ?auto_50772 ) ) ( not ( = ?auto_50771 ?auto_50773 ) ) ( not ( = ?auto_50772 ?auto_50773 ) ) ( ON ?auto_50773 ?auto_50774 ) ( not ( = ?auto_50768 ?auto_50774 ) ) ( not ( = ?auto_50769 ?auto_50774 ) ) ( not ( = ?auto_50770 ?auto_50774 ) ) ( not ( = ?auto_50771 ?auto_50774 ) ) ( not ( = ?auto_50772 ?auto_50774 ) ) ( not ( = ?auto_50773 ?auto_50774 ) ) ( ON ?auto_50772 ?auto_50773 ) ( ON-TABLE ?auto_50774 ) ( ON ?auto_50771 ?auto_50772 ) ( ON ?auto_50770 ?auto_50771 ) ( CLEAR ?auto_50768 ) ( ON ?auto_50769 ?auto_50770 ) ( CLEAR ?auto_50769 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_50774 ?auto_50773 ?auto_50772 ?auto_50771 ?auto_50770 )
      ( MAKE-6PILE ?auto_50768 ?auto_50769 ?auto_50770 ?auto_50771 ?auto_50772 ?auto_50773 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_50775 - BLOCK
      ?auto_50776 - BLOCK
      ?auto_50777 - BLOCK
      ?auto_50778 - BLOCK
      ?auto_50779 - BLOCK
      ?auto_50780 - BLOCK
    )
    :vars
    (
      ?auto_50781 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_50775 ?auto_50776 ) ) ( not ( = ?auto_50775 ?auto_50777 ) ) ( not ( = ?auto_50775 ?auto_50778 ) ) ( not ( = ?auto_50775 ?auto_50779 ) ) ( not ( = ?auto_50775 ?auto_50780 ) ) ( not ( = ?auto_50776 ?auto_50777 ) ) ( not ( = ?auto_50776 ?auto_50778 ) ) ( not ( = ?auto_50776 ?auto_50779 ) ) ( not ( = ?auto_50776 ?auto_50780 ) ) ( not ( = ?auto_50777 ?auto_50778 ) ) ( not ( = ?auto_50777 ?auto_50779 ) ) ( not ( = ?auto_50777 ?auto_50780 ) ) ( not ( = ?auto_50778 ?auto_50779 ) ) ( not ( = ?auto_50778 ?auto_50780 ) ) ( not ( = ?auto_50779 ?auto_50780 ) ) ( ON ?auto_50780 ?auto_50781 ) ( not ( = ?auto_50775 ?auto_50781 ) ) ( not ( = ?auto_50776 ?auto_50781 ) ) ( not ( = ?auto_50777 ?auto_50781 ) ) ( not ( = ?auto_50778 ?auto_50781 ) ) ( not ( = ?auto_50779 ?auto_50781 ) ) ( not ( = ?auto_50780 ?auto_50781 ) ) ( ON ?auto_50779 ?auto_50780 ) ( ON-TABLE ?auto_50781 ) ( ON ?auto_50778 ?auto_50779 ) ( ON ?auto_50777 ?auto_50778 ) ( ON ?auto_50776 ?auto_50777 ) ( CLEAR ?auto_50776 ) ( HOLDING ?auto_50775 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_50775 )
      ( MAKE-6PILE ?auto_50775 ?auto_50776 ?auto_50777 ?auto_50778 ?auto_50779 ?auto_50780 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_50782 - BLOCK
      ?auto_50783 - BLOCK
      ?auto_50784 - BLOCK
      ?auto_50785 - BLOCK
      ?auto_50786 - BLOCK
      ?auto_50787 - BLOCK
    )
    :vars
    (
      ?auto_50788 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_50782 ?auto_50783 ) ) ( not ( = ?auto_50782 ?auto_50784 ) ) ( not ( = ?auto_50782 ?auto_50785 ) ) ( not ( = ?auto_50782 ?auto_50786 ) ) ( not ( = ?auto_50782 ?auto_50787 ) ) ( not ( = ?auto_50783 ?auto_50784 ) ) ( not ( = ?auto_50783 ?auto_50785 ) ) ( not ( = ?auto_50783 ?auto_50786 ) ) ( not ( = ?auto_50783 ?auto_50787 ) ) ( not ( = ?auto_50784 ?auto_50785 ) ) ( not ( = ?auto_50784 ?auto_50786 ) ) ( not ( = ?auto_50784 ?auto_50787 ) ) ( not ( = ?auto_50785 ?auto_50786 ) ) ( not ( = ?auto_50785 ?auto_50787 ) ) ( not ( = ?auto_50786 ?auto_50787 ) ) ( ON ?auto_50787 ?auto_50788 ) ( not ( = ?auto_50782 ?auto_50788 ) ) ( not ( = ?auto_50783 ?auto_50788 ) ) ( not ( = ?auto_50784 ?auto_50788 ) ) ( not ( = ?auto_50785 ?auto_50788 ) ) ( not ( = ?auto_50786 ?auto_50788 ) ) ( not ( = ?auto_50787 ?auto_50788 ) ) ( ON ?auto_50786 ?auto_50787 ) ( ON-TABLE ?auto_50788 ) ( ON ?auto_50785 ?auto_50786 ) ( ON ?auto_50784 ?auto_50785 ) ( ON ?auto_50783 ?auto_50784 ) ( ON ?auto_50782 ?auto_50783 ) ( CLEAR ?auto_50782 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_50788 ?auto_50787 ?auto_50786 ?auto_50785 ?auto_50784 ?auto_50783 )
      ( MAKE-6PILE ?auto_50782 ?auto_50783 ?auto_50784 ?auto_50785 ?auto_50786 ?auto_50787 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_50794 - BLOCK
      ?auto_50795 - BLOCK
      ?auto_50796 - BLOCK
      ?auto_50797 - BLOCK
      ?auto_50798 - BLOCK
    )
    :vars
    (
      ?auto_50799 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50799 ?auto_50798 ) ( CLEAR ?auto_50799 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_50794 ) ( ON ?auto_50795 ?auto_50794 ) ( ON ?auto_50796 ?auto_50795 ) ( ON ?auto_50797 ?auto_50796 ) ( ON ?auto_50798 ?auto_50797 ) ( not ( = ?auto_50794 ?auto_50795 ) ) ( not ( = ?auto_50794 ?auto_50796 ) ) ( not ( = ?auto_50794 ?auto_50797 ) ) ( not ( = ?auto_50794 ?auto_50798 ) ) ( not ( = ?auto_50794 ?auto_50799 ) ) ( not ( = ?auto_50795 ?auto_50796 ) ) ( not ( = ?auto_50795 ?auto_50797 ) ) ( not ( = ?auto_50795 ?auto_50798 ) ) ( not ( = ?auto_50795 ?auto_50799 ) ) ( not ( = ?auto_50796 ?auto_50797 ) ) ( not ( = ?auto_50796 ?auto_50798 ) ) ( not ( = ?auto_50796 ?auto_50799 ) ) ( not ( = ?auto_50797 ?auto_50798 ) ) ( not ( = ?auto_50797 ?auto_50799 ) ) ( not ( = ?auto_50798 ?auto_50799 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_50799 ?auto_50798 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_50813 - BLOCK
      ?auto_50814 - BLOCK
      ?auto_50815 - BLOCK
      ?auto_50816 - BLOCK
      ?auto_50817 - BLOCK
    )
    :vars
    (
      ?auto_50818 - BLOCK
      ?auto_50819 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_50813 ) ( ON ?auto_50814 ?auto_50813 ) ( ON ?auto_50815 ?auto_50814 ) ( ON ?auto_50816 ?auto_50815 ) ( not ( = ?auto_50813 ?auto_50814 ) ) ( not ( = ?auto_50813 ?auto_50815 ) ) ( not ( = ?auto_50813 ?auto_50816 ) ) ( not ( = ?auto_50813 ?auto_50817 ) ) ( not ( = ?auto_50813 ?auto_50818 ) ) ( not ( = ?auto_50814 ?auto_50815 ) ) ( not ( = ?auto_50814 ?auto_50816 ) ) ( not ( = ?auto_50814 ?auto_50817 ) ) ( not ( = ?auto_50814 ?auto_50818 ) ) ( not ( = ?auto_50815 ?auto_50816 ) ) ( not ( = ?auto_50815 ?auto_50817 ) ) ( not ( = ?auto_50815 ?auto_50818 ) ) ( not ( = ?auto_50816 ?auto_50817 ) ) ( not ( = ?auto_50816 ?auto_50818 ) ) ( not ( = ?auto_50817 ?auto_50818 ) ) ( ON ?auto_50818 ?auto_50819 ) ( CLEAR ?auto_50818 ) ( not ( = ?auto_50813 ?auto_50819 ) ) ( not ( = ?auto_50814 ?auto_50819 ) ) ( not ( = ?auto_50815 ?auto_50819 ) ) ( not ( = ?auto_50816 ?auto_50819 ) ) ( not ( = ?auto_50817 ?auto_50819 ) ) ( not ( = ?auto_50818 ?auto_50819 ) ) ( HOLDING ?auto_50817 ) ( CLEAR ?auto_50816 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_50813 ?auto_50814 ?auto_50815 ?auto_50816 ?auto_50817 ?auto_50818 )
      ( MAKE-5PILE ?auto_50813 ?auto_50814 ?auto_50815 ?auto_50816 ?auto_50817 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_50820 - BLOCK
      ?auto_50821 - BLOCK
      ?auto_50822 - BLOCK
      ?auto_50823 - BLOCK
      ?auto_50824 - BLOCK
    )
    :vars
    (
      ?auto_50825 - BLOCK
      ?auto_50826 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_50820 ) ( ON ?auto_50821 ?auto_50820 ) ( ON ?auto_50822 ?auto_50821 ) ( ON ?auto_50823 ?auto_50822 ) ( not ( = ?auto_50820 ?auto_50821 ) ) ( not ( = ?auto_50820 ?auto_50822 ) ) ( not ( = ?auto_50820 ?auto_50823 ) ) ( not ( = ?auto_50820 ?auto_50824 ) ) ( not ( = ?auto_50820 ?auto_50825 ) ) ( not ( = ?auto_50821 ?auto_50822 ) ) ( not ( = ?auto_50821 ?auto_50823 ) ) ( not ( = ?auto_50821 ?auto_50824 ) ) ( not ( = ?auto_50821 ?auto_50825 ) ) ( not ( = ?auto_50822 ?auto_50823 ) ) ( not ( = ?auto_50822 ?auto_50824 ) ) ( not ( = ?auto_50822 ?auto_50825 ) ) ( not ( = ?auto_50823 ?auto_50824 ) ) ( not ( = ?auto_50823 ?auto_50825 ) ) ( not ( = ?auto_50824 ?auto_50825 ) ) ( ON ?auto_50825 ?auto_50826 ) ( not ( = ?auto_50820 ?auto_50826 ) ) ( not ( = ?auto_50821 ?auto_50826 ) ) ( not ( = ?auto_50822 ?auto_50826 ) ) ( not ( = ?auto_50823 ?auto_50826 ) ) ( not ( = ?auto_50824 ?auto_50826 ) ) ( not ( = ?auto_50825 ?auto_50826 ) ) ( CLEAR ?auto_50823 ) ( ON ?auto_50824 ?auto_50825 ) ( CLEAR ?auto_50824 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_50826 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_50826 ?auto_50825 )
      ( MAKE-5PILE ?auto_50820 ?auto_50821 ?auto_50822 ?auto_50823 ?auto_50824 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_50827 - BLOCK
      ?auto_50828 - BLOCK
      ?auto_50829 - BLOCK
      ?auto_50830 - BLOCK
      ?auto_50831 - BLOCK
    )
    :vars
    (
      ?auto_50833 - BLOCK
      ?auto_50832 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_50827 ) ( ON ?auto_50828 ?auto_50827 ) ( ON ?auto_50829 ?auto_50828 ) ( not ( = ?auto_50827 ?auto_50828 ) ) ( not ( = ?auto_50827 ?auto_50829 ) ) ( not ( = ?auto_50827 ?auto_50830 ) ) ( not ( = ?auto_50827 ?auto_50831 ) ) ( not ( = ?auto_50827 ?auto_50833 ) ) ( not ( = ?auto_50828 ?auto_50829 ) ) ( not ( = ?auto_50828 ?auto_50830 ) ) ( not ( = ?auto_50828 ?auto_50831 ) ) ( not ( = ?auto_50828 ?auto_50833 ) ) ( not ( = ?auto_50829 ?auto_50830 ) ) ( not ( = ?auto_50829 ?auto_50831 ) ) ( not ( = ?auto_50829 ?auto_50833 ) ) ( not ( = ?auto_50830 ?auto_50831 ) ) ( not ( = ?auto_50830 ?auto_50833 ) ) ( not ( = ?auto_50831 ?auto_50833 ) ) ( ON ?auto_50833 ?auto_50832 ) ( not ( = ?auto_50827 ?auto_50832 ) ) ( not ( = ?auto_50828 ?auto_50832 ) ) ( not ( = ?auto_50829 ?auto_50832 ) ) ( not ( = ?auto_50830 ?auto_50832 ) ) ( not ( = ?auto_50831 ?auto_50832 ) ) ( not ( = ?auto_50833 ?auto_50832 ) ) ( ON ?auto_50831 ?auto_50833 ) ( CLEAR ?auto_50831 ) ( ON-TABLE ?auto_50832 ) ( HOLDING ?auto_50830 ) ( CLEAR ?auto_50829 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_50827 ?auto_50828 ?auto_50829 ?auto_50830 )
      ( MAKE-5PILE ?auto_50827 ?auto_50828 ?auto_50829 ?auto_50830 ?auto_50831 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_50834 - BLOCK
      ?auto_50835 - BLOCK
      ?auto_50836 - BLOCK
      ?auto_50837 - BLOCK
      ?auto_50838 - BLOCK
    )
    :vars
    (
      ?auto_50840 - BLOCK
      ?auto_50839 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_50834 ) ( ON ?auto_50835 ?auto_50834 ) ( ON ?auto_50836 ?auto_50835 ) ( not ( = ?auto_50834 ?auto_50835 ) ) ( not ( = ?auto_50834 ?auto_50836 ) ) ( not ( = ?auto_50834 ?auto_50837 ) ) ( not ( = ?auto_50834 ?auto_50838 ) ) ( not ( = ?auto_50834 ?auto_50840 ) ) ( not ( = ?auto_50835 ?auto_50836 ) ) ( not ( = ?auto_50835 ?auto_50837 ) ) ( not ( = ?auto_50835 ?auto_50838 ) ) ( not ( = ?auto_50835 ?auto_50840 ) ) ( not ( = ?auto_50836 ?auto_50837 ) ) ( not ( = ?auto_50836 ?auto_50838 ) ) ( not ( = ?auto_50836 ?auto_50840 ) ) ( not ( = ?auto_50837 ?auto_50838 ) ) ( not ( = ?auto_50837 ?auto_50840 ) ) ( not ( = ?auto_50838 ?auto_50840 ) ) ( ON ?auto_50840 ?auto_50839 ) ( not ( = ?auto_50834 ?auto_50839 ) ) ( not ( = ?auto_50835 ?auto_50839 ) ) ( not ( = ?auto_50836 ?auto_50839 ) ) ( not ( = ?auto_50837 ?auto_50839 ) ) ( not ( = ?auto_50838 ?auto_50839 ) ) ( not ( = ?auto_50840 ?auto_50839 ) ) ( ON ?auto_50838 ?auto_50840 ) ( ON-TABLE ?auto_50839 ) ( CLEAR ?auto_50836 ) ( ON ?auto_50837 ?auto_50838 ) ( CLEAR ?auto_50837 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_50839 ?auto_50840 ?auto_50838 )
      ( MAKE-5PILE ?auto_50834 ?auto_50835 ?auto_50836 ?auto_50837 ?auto_50838 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_50841 - BLOCK
      ?auto_50842 - BLOCK
      ?auto_50843 - BLOCK
      ?auto_50844 - BLOCK
      ?auto_50845 - BLOCK
    )
    :vars
    (
      ?auto_50846 - BLOCK
      ?auto_50847 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_50841 ) ( ON ?auto_50842 ?auto_50841 ) ( not ( = ?auto_50841 ?auto_50842 ) ) ( not ( = ?auto_50841 ?auto_50843 ) ) ( not ( = ?auto_50841 ?auto_50844 ) ) ( not ( = ?auto_50841 ?auto_50845 ) ) ( not ( = ?auto_50841 ?auto_50846 ) ) ( not ( = ?auto_50842 ?auto_50843 ) ) ( not ( = ?auto_50842 ?auto_50844 ) ) ( not ( = ?auto_50842 ?auto_50845 ) ) ( not ( = ?auto_50842 ?auto_50846 ) ) ( not ( = ?auto_50843 ?auto_50844 ) ) ( not ( = ?auto_50843 ?auto_50845 ) ) ( not ( = ?auto_50843 ?auto_50846 ) ) ( not ( = ?auto_50844 ?auto_50845 ) ) ( not ( = ?auto_50844 ?auto_50846 ) ) ( not ( = ?auto_50845 ?auto_50846 ) ) ( ON ?auto_50846 ?auto_50847 ) ( not ( = ?auto_50841 ?auto_50847 ) ) ( not ( = ?auto_50842 ?auto_50847 ) ) ( not ( = ?auto_50843 ?auto_50847 ) ) ( not ( = ?auto_50844 ?auto_50847 ) ) ( not ( = ?auto_50845 ?auto_50847 ) ) ( not ( = ?auto_50846 ?auto_50847 ) ) ( ON ?auto_50845 ?auto_50846 ) ( ON-TABLE ?auto_50847 ) ( ON ?auto_50844 ?auto_50845 ) ( CLEAR ?auto_50844 ) ( HOLDING ?auto_50843 ) ( CLEAR ?auto_50842 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_50841 ?auto_50842 ?auto_50843 )
      ( MAKE-5PILE ?auto_50841 ?auto_50842 ?auto_50843 ?auto_50844 ?auto_50845 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_50848 - BLOCK
      ?auto_50849 - BLOCK
      ?auto_50850 - BLOCK
      ?auto_50851 - BLOCK
      ?auto_50852 - BLOCK
    )
    :vars
    (
      ?auto_50853 - BLOCK
      ?auto_50854 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_50848 ) ( ON ?auto_50849 ?auto_50848 ) ( not ( = ?auto_50848 ?auto_50849 ) ) ( not ( = ?auto_50848 ?auto_50850 ) ) ( not ( = ?auto_50848 ?auto_50851 ) ) ( not ( = ?auto_50848 ?auto_50852 ) ) ( not ( = ?auto_50848 ?auto_50853 ) ) ( not ( = ?auto_50849 ?auto_50850 ) ) ( not ( = ?auto_50849 ?auto_50851 ) ) ( not ( = ?auto_50849 ?auto_50852 ) ) ( not ( = ?auto_50849 ?auto_50853 ) ) ( not ( = ?auto_50850 ?auto_50851 ) ) ( not ( = ?auto_50850 ?auto_50852 ) ) ( not ( = ?auto_50850 ?auto_50853 ) ) ( not ( = ?auto_50851 ?auto_50852 ) ) ( not ( = ?auto_50851 ?auto_50853 ) ) ( not ( = ?auto_50852 ?auto_50853 ) ) ( ON ?auto_50853 ?auto_50854 ) ( not ( = ?auto_50848 ?auto_50854 ) ) ( not ( = ?auto_50849 ?auto_50854 ) ) ( not ( = ?auto_50850 ?auto_50854 ) ) ( not ( = ?auto_50851 ?auto_50854 ) ) ( not ( = ?auto_50852 ?auto_50854 ) ) ( not ( = ?auto_50853 ?auto_50854 ) ) ( ON ?auto_50852 ?auto_50853 ) ( ON-TABLE ?auto_50854 ) ( ON ?auto_50851 ?auto_50852 ) ( CLEAR ?auto_50849 ) ( ON ?auto_50850 ?auto_50851 ) ( CLEAR ?auto_50850 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_50854 ?auto_50853 ?auto_50852 ?auto_50851 )
      ( MAKE-5PILE ?auto_50848 ?auto_50849 ?auto_50850 ?auto_50851 ?auto_50852 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_50855 - BLOCK
      ?auto_50856 - BLOCK
      ?auto_50857 - BLOCK
      ?auto_50858 - BLOCK
      ?auto_50859 - BLOCK
    )
    :vars
    (
      ?auto_50860 - BLOCK
      ?auto_50861 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_50855 ) ( not ( = ?auto_50855 ?auto_50856 ) ) ( not ( = ?auto_50855 ?auto_50857 ) ) ( not ( = ?auto_50855 ?auto_50858 ) ) ( not ( = ?auto_50855 ?auto_50859 ) ) ( not ( = ?auto_50855 ?auto_50860 ) ) ( not ( = ?auto_50856 ?auto_50857 ) ) ( not ( = ?auto_50856 ?auto_50858 ) ) ( not ( = ?auto_50856 ?auto_50859 ) ) ( not ( = ?auto_50856 ?auto_50860 ) ) ( not ( = ?auto_50857 ?auto_50858 ) ) ( not ( = ?auto_50857 ?auto_50859 ) ) ( not ( = ?auto_50857 ?auto_50860 ) ) ( not ( = ?auto_50858 ?auto_50859 ) ) ( not ( = ?auto_50858 ?auto_50860 ) ) ( not ( = ?auto_50859 ?auto_50860 ) ) ( ON ?auto_50860 ?auto_50861 ) ( not ( = ?auto_50855 ?auto_50861 ) ) ( not ( = ?auto_50856 ?auto_50861 ) ) ( not ( = ?auto_50857 ?auto_50861 ) ) ( not ( = ?auto_50858 ?auto_50861 ) ) ( not ( = ?auto_50859 ?auto_50861 ) ) ( not ( = ?auto_50860 ?auto_50861 ) ) ( ON ?auto_50859 ?auto_50860 ) ( ON-TABLE ?auto_50861 ) ( ON ?auto_50858 ?auto_50859 ) ( ON ?auto_50857 ?auto_50858 ) ( CLEAR ?auto_50857 ) ( HOLDING ?auto_50856 ) ( CLEAR ?auto_50855 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_50855 ?auto_50856 )
      ( MAKE-5PILE ?auto_50855 ?auto_50856 ?auto_50857 ?auto_50858 ?auto_50859 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_50862 - BLOCK
      ?auto_50863 - BLOCK
      ?auto_50864 - BLOCK
      ?auto_50865 - BLOCK
      ?auto_50866 - BLOCK
    )
    :vars
    (
      ?auto_50868 - BLOCK
      ?auto_50867 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_50862 ) ( not ( = ?auto_50862 ?auto_50863 ) ) ( not ( = ?auto_50862 ?auto_50864 ) ) ( not ( = ?auto_50862 ?auto_50865 ) ) ( not ( = ?auto_50862 ?auto_50866 ) ) ( not ( = ?auto_50862 ?auto_50868 ) ) ( not ( = ?auto_50863 ?auto_50864 ) ) ( not ( = ?auto_50863 ?auto_50865 ) ) ( not ( = ?auto_50863 ?auto_50866 ) ) ( not ( = ?auto_50863 ?auto_50868 ) ) ( not ( = ?auto_50864 ?auto_50865 ) ) ( not ( = ?auto_50864 ?auto_50866 ) ) ( not ( = ?auto_50864 ?auto_50868 ) ) ( not ( = ?auto_50865 ?auto_50866 ) ) ( not ( = ?auto_50865 ?auto_50868 ) ) ( not ( = ?auto_50866 ?auto_50868 ) ) ( ON ?auto_50868 ?auto_50867 ) ( not ( = ?auto_50862 ?auto_50867 ) ) ( not ( = ?auto_50863 ?auto_50867 ) ) ( not ( = ?auto_50864 ?auto_50867 ) ) ( not ( = ?auto_50865 ?auto_50867 ) ) ( not ( = ?auto_50866 ?auto_50867 ) ) ( not ( = ?auto_50868 ?auto_50867 ) ) ( ON ?auto_50866 ?auto_50868 ) ( ON-TABLE ?auto_50867 ) ( ON ?auto_50865 ?auto_50866 ) ( ON ?auto_50864 ?auto_50865 ) ( CLEAR ?auto_50862 ) ( ON ?auto_50863 ?auto_50864 ) ( CLEAR ?auto_50863 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_50867 ?auto_50868 ?auto_50866 ?auto_50865 ?auto_50864 )
      ( MAKE-5PILE ?auto_50862 ?auto_50863 ?auto_50864 ?auto_50865 ?auto_50866 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_50869 - BLOCK
      ?auto_50870 - BLOCK
      ?auto_50871 - BLOCK
      ?auto_50872 - BLOCK
      ?auto_50873 - BLOCK
    )
    :vars
    (
      ?auto_50875 - BLOCK
      ?auto_50874 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_50869 ?auto_50870 ) ) ( not ( = ?auto_50869 ?auto_50871 ) ) ( not ( = ?auto_50869 ?auto_50872 ) ) ( not ( = ?auto_50869 ?auto_50873 ) ) ( not ( = ?auto_50869 ?auto_50875 ) ) ( not ( = ?auto_50870 ?auto_50871 ) ) ( not ( = ?auto_50870 ?auto_50872 ) ) ( not ( = ?auto_50870 ?auto_50873 ) ) ( not ( = ?auto_50870 ?auto_50875 ) ) ( not ( = ?auto_50871 ?auto_50872 ) ) ( not ( = ?auto_50871 ?auto_50873 ) ) ( not ( = ?auto_50871 ?auto_50875 ) ) ( not ( = ?auto_50872 ?auto_50873 ) ) ( not ( = ?auto_50872 ?auto_50875 ) ) ( not ( = ?auto_50873 ?auto_50875 ) ) ( ON ?auto_50875 ?auto_50874 ) ( not ( = ?auto_50869 ?auto_50874 ) ) ( not ( = ?auto_50870 ?auto_50874 ) ) ( not ( = ?auto_50871 ?auto_50874 ) ) ( not ( = ?auto_50872 ?auto_50874 ) ) ( not ( = ?auto_50873 ?auto_50874 ) ) ( not ( = ?auto_50875 ?auto_50874 ) ) ( ON ?auto_50873 ?auto_50875 ) ( ON-TABLE ?auto_50874 ) ( ON ?auto_50872 ?auto_50873 ) ( ON ?auto_50871 ?auto_50872 ) ( ON ?auto_50870 ?auto_50871 ) ( CLEAR ?auto_50870 ) ( HOLDING ?auto_50869 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_50869 )
      ( MAKE-5PILE ?auto_50869 ?auto_50870 ?auto_50871 ?auto_50872 ?auto_50873 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_50876 - BLOCK
      ?auto_50877 - BLOCK
      ?auto_50878 - BLOCK
      ?auto_50879 - BLOCK
      ?auto_50880 - BLOCK
    )
    :vars
    (
      ?auto_50881 - BLOCK
      ?auto_50882 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_50876 ?auto_50877 ) ) ( not ( = ?auto_50876 ?auto_50878 ) ) ( not ( = ?auto_50876 ?auto_50879 ) ) ( not ( = ?auto_50876 ?auto_50880 ) ) ( not ( = ?auto_50876 ?auto_50881 ) ) ( not ( = ?auto_50877 ?auto_50878 ) ) ( not ( = ?auto_50877 ?auto_50879 ) ) ( not ( = ?auto_50877 ?auto_50880 ) ) ( not ( = ?auto_50877 ?auto_50881 ) ) ( not ( = ?auto_50878 ?auto_50879 ) ) ( not ( = ?auto_50878 ?auto_50880 ) ) ( not ( = ?auto_50878 ?auto_50881 ) ) ( not ( = ?auto_50879 ?auto_50880 ) ) ( not ( = ?auto_50879 ?auto_50881 ) ) ( not ( = ?auto_50880 ?auto_50881 ) ) ( ON ?auto_50881 ?auto_50882 ) ( not ( = ?auto_50876 ?auto_50882 ) ) ( not ( = ?auto_50877 ?auto_50882 ) ) ( not ( = ?auto_50878 ?auto_50882 ) ) ( not ( = ?auto_50879 ?auto_50882 ) ) ( not ( = ?auto_50880 ?auto_50882 ) ) ( not ( = ?auto_50881 ?auto_50882 ) ) ( ON ?auto_50880 ?auto_50881 ) ( ON-TABLE ?auto_50882 ) ( ON ?auto_50879 ?auto_50880 ) ( ON ?auto_50878 ?auto_50879 ) ( ON ?auto_50877 ?auto_50878 ) ( ON ?auto_50876 ?auto_50877 ) ( CLEAR ?auto_50876 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_50882 ?auto_50881 ?auto_50880 ?auto_50879 ?auto_50878 ?auto_50877 )
      ( MAKE-5PILE ?auto_50876 ?auto_50877 ?auto_50878 ?auto_50879 ?auto_50880 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_50884 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_50884 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_50884 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_50885 - BLOCK
    )
    :vars
    (
      ?auto_50886 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50885 ?auto_50886 ) ( CLEAR ?auto_50885 ) ( HAND-EMPTY ) ( not ( = ?auto_50885 ?auto_50886 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_50885 ?auto_50886 )
      ( MAKE-1PILE ?auto_50885 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_50887 - BLOCK
    )
    :vars
    (
      ?auto_50888 - BLOCK
      ?auto_50889 - BLOCK
      ?auto_50891 - BLOCK
      ?auto_50892 - BLOCK
      ?auto_50890 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_50887 ?auto_50888 ) ) ( HOLDING ?auto_50887 ) ( CLEAR ?auto_50888 ) ( ON-TABLE ?auto_50889 ) ( ON ?auto_50891 ?auto_50889 ) ( ON ?auto_50892 ?auto_50891 ) ( ON ?auto_50890 ?auto_50892 ) ( ON ?auto_50888 ?auto_50890 ) ( not ( = ?auto_50889 ?auto_50891 ) ) ( not ( = ?auto_50889 ?auto_50892 ) ) ( not ( = ?auto_50889 ?auto_50890 ) ) ( not ( = ?auto_50889 ?auto_50888 ) ) ( not ( = ?auto_50889 ?auto_50887 ) ) ( not ( = ?auto_50891 ?auto_50892 ) ) ( not ( = ?auto_50891 ?auto_50890 ) ) ( not ( = ?auto_50891 ?auto_50888 ) ) ( not ( = ?auto_50891 ?auto_50887 ) ) ( not ( = ?auto_50892 ?auto_50890 ) ) ( not ( = ?auto_50892 ?auto_50888 ) ) ( not ( = ?auto_50892 ?auto_50887 ) ) ( not ( = ?auto_50890 ?auto_50888 ) ) ( not ( = ?auto_50890 ?auto_50887 ) ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_50889 ?auto_50891 ?auto_50892 ?auto_50890 ?auto_50888 ?auto_50887 )
      ( MAKE-1PILE ?auto_50887 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_50893 - BLOCK
    )
    :vars
    (
      ?auto_50897 - BLOCK
      ?auto_50895 - BLOCK
      ?auto_50898 - BLOCK
      ?auto_50894 - BLOCK
      ?auto_50896 - BLOCK
      ?auto_50899 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_50893 ?auto_50897 ) ) ( CLEAR ?auto_50897 ) ( ON-TABLE ?auto_50895 ) ( ON ?auto_50898 ?auto_50895 ) ( ON ?auto_50894 ?auto_50898 ) ( ON ?auto_50896 ?auto_50894 ) ( ON ?auto_50897 ?auto_50896 ) ( not ( = ?auto_50895 ?auto_50898 ) ) ( not ( = ?auto_50895 ?auto_50894 ) ) ( not ( = ?auto_50895 ?auto_50896 ) ) ( not ( = ?auto_50895 ?auto_50897 ) ) ( not ( = ?auto_50895 ?auto_50893 ) ) ( not ( = ?auto_50898 ?auto_50894 ) ) ( not ( = ?auto_50898 ?auto_50896 ) ) ( not ( = ?auto_50898 ?auto_50897 ) ) ( not ( = ?auto_50898 ?auto_50893 ) ) ( not ( = ?auto_50894 ?auto_50896 ) ) ( not ( = ?auto_50894 ?auto_50897 ) ) ( not ( = ?auto_50894 ?auto_50893 ) ) ( not ( = ?auto_50896 ?auto_50897 ) ) ( not ( = ?auto_50896 ?auto_50893 ) ) ( ON ?auto_50893 ?auto_50899 ) ( CLEAR ?auto_50893 ) ( HAND-EMPTY ) ( not ( = ?auto_50893 ?auto_50899 ) ) ( not ( = ?auto_50897 ?auto_50899 ) ) ( not ( = ?auto_50895 ?auto_50899 ) ) ( not ( = ?auto_50898 ?auto_50899 ) ) ( not ( = ?auto_50894 ?auto_50899 ) ) ( not ( = ?auto_50896 ?auto_50899 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_50893 ?auto_50899 )
      ( MAKE-1PILE ?auto_50893 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_50900 - BLOCK
    )
    :vars
    (
      ?auto_50902 - BLOCK
      ?auto_50904 - BLOCK
      ?auto_50906 - BLOCK
      ?auto_50903 - BLOCK
      ?auto_50901 - BLOCK
      ?auto_50905 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_50900 ?auto_50902 ) ) ( ON-TABLE ?auto_50904 ) ( ON ?auto_50906 ?auto_50904 ) ( ON ?auto_50903 ?auto_50906 ) ( ON ?auto_50901 ?auto_50903 ) ( not ( = ?auto_50904 ?auto_50906 ) ) ( not ( = ?auto_50904 ?auto_50903 ) ) ( not ( = ?auto_50904 ?auto_50901 ) ) ( not ( = ?auto_50904 ?auto_50902 ) ) ( not ( = ?auto_50904 ?auto_50900 ) ) ( not ( = ?auto_50906 ?auto_50903 ) ) ( not ( = ?auto_50906 ?auto_50901 ) ) ( not ( = ?auto_50906 ?auto_50902 ) ) ( not ( = ?auto_50906 ?auto_50900 ) ) ( not ( = ?auto_50903 ?auto_50901 ) ) ( not ( = ?auto_50903 ?auto_50902 ) ) ( not ( = ?auto_50903 ?auto_50900 ) ) ( not ( = ?auto_50901 ?auto_50902 ) ) ( not ( = ?auto_50901 ?auto_50900 ) ) ( ON ?auto_50900 ?auto_50905 ) ( CLEAR ?auto_50900 ) ( not ( = ?auto_50900 ?auto_50905 ) ) ( not ( = ?auto_50902 ?auto_50905 ) ) ( not ( = ?auto_50904 ?auto_50905 ) ) ( not ( = ?auto_50906 ?auto_50905 ) ) ( not ( = ?auto_50903 ?auto_50905 ) ) ( not ( = ?auto_50901 ?auto_50905 ) ) ( HOLDING ?auto_50902 ) ( CLEAR ?auto_50901 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_50904 ?auto_50906 ?auto_50903 ?auto_50901 ?auto_50902 )
      ( MAKE-1PILE ?auto_50900 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_50907 - BLOCK
    )
    :vars
    (
      ?auto_50913 - BLOCK
      ?auto_50910 - BLOCK
      ?auto_50911 - BLOCK
      ?auto_50909 - BLOCK
      ?auto_50908 - BLOCK
      ?auto_50912 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_50907 ?auto_50913 ) ) ( ON-TABLE ?auto_50910 ) ( ON ?auto_50911 ?auto_50910 ) ( ON ?auto_50909 ?auto_50911 ) ( ON ?auto_50908 ?auto_50909 ) ( not ( = ?auto_50910 ?auto_50911 ) ) ( not ( = ?auto_50910 ?auto_50909 ) ) ( not ( = ?auto_50910 ?auto_50908 ) ) ( not ( = ?auto_50910 ?auto_50913 ) ) ( not ( = ?auto_50910 ?auto_50907 ) ) ( not ( = ?auto_50911 ?auto_50909 ) ) ( not ( = ?auto_50911 ?auto_50908 ) ) ( not ( = ?auto_50911 ?auto_50913 ) ) ( not ( = ?auto_50911 ?auto_50907 ) ) ( not ( = ?auto_50909 ?auto_50908 ) ) ( not ( = ?auto_50909 ?auto_50913 ) ) ( not ( = ?auto_50909 ?auto_50907 ) ) ( not ( = ?auto_50908 ?auto_50913 ) ) ( not ( = ?auto_50908 ?auto_50907 ) ) ( ON ?auto_50907 ?auto_50912 ) ( not ( = ?auto_50907 ?auto_50912 ) ) ( not ( = ?auto_50913 ?auto_50912 ) ) ( not ( = ?auto_50910 ?auto_50912 ) ) ( not ( = ?auto_50911 ?auto_50912 ) ) ( not ( = ?auto_50909 ?auto_50912 ) ) ( not ( = ?auto_50908 ?auto_50912 ) ) ( CLEAR ?auto_50908 ) ( ON ?auto_50913 ?auto_50907 ) ( CLEAR ?auto_50913 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_50912 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_50912 ?auto_50907 )
      ( MAKE-1PILE ?auto_50907 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_50914 - BLOCK
    )
    :vars
    (
      ?auto_50919 - BLOCK
      ?auto_50918 - BLOCK
      ?auto_50916 - BLOCK
      ?auto_50917 - BLOCK
      ?auto_50920 - BLOCK
      ?auto_50915 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_50914 ?auto_50919 ) ) ( ON-TABLE ?auto_50918 ) ( ON ?auto_50916 ?auto_50918 ) ( ON ?auto_50917 ?auto_50916 ) ( not ( = ?auto_50918 ?auto_50916 ) ) ( not ( = ?auto_50918 ?auto_50917 ) ) ( not ( = ?auto_50918 ?auto_50920 ) ) ( not ( = ?auto_50918 ?auto_50919 ) ) ( not ( = ?auto_50918 ?auto_50914 ) ) ( not ( = ?auto_50916 ?auto_50917 ) ) ( not ( = ?auto_50916 ?auto_50920 ) ) ( not ( = ?auto_50916 ?auto_50919 ) ) ( not ( = ?auto_50916 ?auto_50914 ) ) ( not ( = ?auto_50917 ?auto_50920 ) ) ( not ( = ?auto_50917 ?auto_50919 ) ) ( not ( = ?auto_50917 ?auto_50914 ) ) ( not ( = ?auto_50920 ?auto_50919 ) ) ( not ( = ?auto_50920 ?auto_50914 ) ) ( ON ?auto_50914 ?auto_50915 ) ( not ( = ?auto_50914 ?auto_50915 ) ) ( not ( = ?auto_50919 ?auto_50915 ) ) ( not ( = ?auto_50918 ?auto_50915 ) ) ( not ( = ?auto_50916 ?auto_50915 ) ) ( not ( = ?auto_50917 ?auto_50915 ) ) ( not ( = ?auto_50920 ?auto_50915 ) ) ( ON ?auto_50919 ?auto_50914 ) ( CLEAR ?auto_50919 ) ( ON-TABLE ?auto_50915 ) ( HOLDING ?auto_50920 ) ( CLEAR ?auto_50917 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_50918 ?auto_50916 ?auto_50917 ?auto_50920 )
      ( MAKE-1PILE ?auto_50914 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_50921 - BLOCK
    )
    :vars
    (
      ?auto_50927 - BLOCK
      ?auto_50925 - BLOCK
      ?auto_50923 - BLOCK
      ?auto_50924 - BLOCK
      ?auto_50926 - BLOCK
      ?auto_50922 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_50921 ?auto_50927 ) ) ( ON-TABLE ?auto_50925 ) ( ON ?auto_50923 ?auto_50925 ) ( ON ?auto_50924 ?auto_50923 ) ( not ( = ?auto_50925 ?auto_50923 ) ) ( not ( = ?auto_50925 ?auto_50924 ) ) ( not ( = ?auto_50925 ?auto_50926 ) ) ( not ( = ?auto_50925 ?auto_50927 ) ) ( not ( = ?auto_50925 ?auto_50921 ) ) ( not ( = ?auto_50923 ?auto_50924 ) ) ( not ( = ?auto_50923 ?auto_50926 ) ) ( not ( = ?auto_50923 ?auto_50927 ) ) ( not ( = ?auto_50923 ?auto_50921 ) ) ( not ( = ?auto_50924 ?auto_50926 ) ) ( not ( = ?auto_50924 ?auto_50927 ) ) ( not ( = ?auto_50924 ?auto_50921 ) ) ( not ( = ?auto_50926 ?auto_50927 ) ) ( not ( = ?auto_50926 ?auto_50921 ) ) ( ON ?auto_50921 ?auto_50922 ) ( not ( = ?auto_50921 ?auto_50922 ) ) ( not ( = ?auto_50927 ?auto_50922 ) ) ( not ( = ?auto_50925 ?auto_50922 ) ) ( not ( = ?auto_50923 ?auto_50922 ) ) ( not ( = ?auto_50924 ?auto_50922 ) ) ( not ( = ?auto_50926 ?auto_50922 ) ) ( ON ?auto_50927 ?auto_50921 ) ( ON-TABLE ?auto_50922 ) ( CLEAR ?auto_50924 ) ( ON ?auto_50926 ?auto_50927 ) ( CLEAR ?auto_50926 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_50922 ?auto_50921 ?auto_50927 )
      ( MAKE-1PILE ?auto_50921 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_50928 - BLOCK
    )
    :vars
    (
      ?auto_50931 - BLOCK
      ?auto_50929 - BLOCK
      ?auto_50930 - BLOCK
      ?auto_50932 - BLOCK
      ?auto_50933 - BLOCK
      ?auto_50934 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_50928 ?auto_50931 ) ) ( ON-TABLE ?auto_50929 ) ( ON ?auto_50930 ?auto_50929 ) ( not ( = ?auto_50929 ?auto_50930 ) ) ( not ( = ?auto_50929 ?auto_50932 ) ) ( not ( = ?auto_50929 ?auto_50933 ) ) ( not ( = ?auto_50929 ?auto_50931 ) ) ( not ( = ?auto_50929 ?auto_50928 ) ) ( not ( = ?auto_50930 ?auto_50932 ) ) ( not ( = ?auto_50930 ?auto_50933 ) ) ( not ( = ?auto_50930 ?auto_50931 ) ) ( not ( = ?auto_50930 ?auto_50928 ) ) ( not ( = ?auto_50932 ?auto_50933 ) ) ( not ( = ?auto_50932 ?auto_50931 ) ) ( not ( = ?auto_50932 ?auto_50928 ) ) ( not ( = ?auto_50933 ?auto_50931 ) ) ( not ( = ?auto_50933 ?auto_50928 ) ) ( ON ?auto_50928 ?auto_50934 ) ( not ( = ?auto_50928 ?auto_50934 ) ) ( not ( = ?auto_50931 ?auto_50934 ) ) ( not ( = ?auto_50929 ?auto_50934 ) ) ( not ( = ?auto_50930 ?auto_50934 ) ) ( not ( = ?auto_50932 ?auto_50934 ) ) ( not ( = ?auto_50933 ?auto_50934 ) ) ( ON ?auto_50931 ?auto_50928 ) ( ON-TABLE ?auto_50934 ) ( ON ?auto_50933 ?auto_50931 ) ( CLEAR ?auto_50933 ) ( HOLDING ?auto_50932 ) ( CLEAR ?auto_50930 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_50929 ?auto_50930 ?auto_50932 )
      ( MAKE-1PILE ?auto_50928 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_50935 - BLOCK
    )
    :vars
    (
      ?auto_50936 - BLOCK
      ?auto_50941 - BLOCK
      ?auto_50939 - BLOCK
      ?auto_50940 - BLOCK
      ?auto_50937 - BLOCK
      ?auto_50938 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_50935 ?auto_50936 ) ) ( ON-TABLE ?auto_50941 ) ( ON ?auto_50939 ?auto_50941 ) ( not ( = ?auto_50941 ?auto_50939 ) ) ( not ( = ?auto_50941 ?auto_50940 ) ) ( not ( = ?auto_50941 ?auto_50937 ) ) ( not ( = ?auto_50941 ?auto_50936 ) ) ( not ( = ?auto_50941 ?auto_50935 ) ) ( not ( = ?auto_50939 ?auto_50940 ) ) ( not ( = ?auto_50939 ?auto_50937 ) ) ( not ( = ?auto_50939 ?auto_50936 ) ) ( not ( = ?auto_50939 ?auto_50935 ) ) ( not ( = ?auto_50940 ?auto_50937 ) ) ( not ( = ?auto_50940 ?auto_50936 ) ) ( not ( = ?auto_50940 ?auto_50935 ) ) ( not ( = ?auto_50937 ?auto_50936 ) ) ( not ( = ?auto_50937 ?auto_50935 ) ) ( ON ?auto_50935 ?auto_50938 ) ( not ( = ?auto_50935 ?auto_50938 ) ) ( not ( = ?auto_50936 ?auto_50938 ) ) ( not ( = ?auto_50941 ?auto_50938 ) ) ( not ( = ?auto_50939 ?auto_50938 ) ) ( not ( = ?auto_50940 ?auto_50938 ) ) ( not ( = ?auto_50937 ?auto_50938 ) ) ( ON ?auto_50936 ?auto_50935 ) ( ON-TABLE ?auto_50938 ) ( ON ?auto_50937 ?auto_50936 ) ( CLEAR ?auto_50939 ) ( ON ?auto_50940 ?auto_50937 ) ( CLEAR ?auto_50940 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_50938 ?auto_50935 ?auto_50936 ?auto_50937 )
      ( MAKE-1PILE ?auto_50935 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_50942 - BLOCK
    )
    :vars
    (
      ?auto_50948 - BLOCK
      ?auto_50943 - BLOCK
      ?auto_50945 - BLOCK
      ?auto_50947 - BLOCK
      ?auto_50944 - BLOCK
      ?auto_50946 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_50942 ?auto_50948 ) ) ( ON-TABLE ?auto_50943 ) ( not ( = ?auto_50943 ?auto_50945 ) ) ( not ( = ?auto_50943 ?auto_50947 ) ) ( not ( = ?auto_50943 ?auto_50944 ) ) ( not ( = ?auto_50943 ?auto_50948 ) ) ( not ( = ?auto_50943 ?auto_50942 ) ) ( not ( = ?auto_50945 ?auto_50947 ) ) ( not ( = ?auto_50945 ?auto_50944 ) ) ( not ( = ?auto_50945 ?auto_50948 ) ) ( not ( = ?auto_50945 ?auto_50942 ) ) ( not ( = ?auto_50947 ?auto_50944 ) ) ( not ( = ?auto_50947 ?auto_50948 ) ) ( not ( = ?auto_50947 ?auto_50942 ) ) ( not ( = ?auto_50944 ?auto_50948 ) ) ( not ( = ?auto_50944 ?auto_50942 ) ) ( ON ?auto_50942 ?auto_50946 ) ( not ( = ?auto_50942 ?auto_50946 ) ) ( not ( = ?auto_50948 ?auto_50946 ) ) ( not ( = ?auto_50943 ?auto_50946 ) ) ( not ( = ?auto_50945 ?auto_50946 ) ) ( not ( = ?auto_50947 ?auto_50946 ) ) ( not ( = ?auto_50944 ?auto_50946 ) ) ( ON ?auto_50948 ?auto_50942 ) ( ON-TABLE ?auto_50946 ) ( ON ?auto_50944 ?auto_50948 ) ( ON ?auto_50947 ?auto_50944 ) ( CLEAR ?auto_50947 ) ( HOLDING ?auto_50945 ) ( CLEAR ?auto_50943 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_50943 ?auto_50945 )
      ( MAKE-1PILE ?auto_50942 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_50949 - BLOCK
    )
    :vars
    (
      ?auto_50953 - BLOCK
      ?auto_50952 - BLOCK
      ?auto_50954 - BLOCK
      ?auto_50955 - BLOCK
      ?auto_50950 - BLOCK
      ?auto_50951 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_50949 ?auto_50953 ) ) ( ON-TABLE ?auto_50952 ) ( not ( = ?auto_50952 ?auto_50954 ) ) ( not ( = ?auto_50952 ?auto_50955 ) ) ( not ( = ?auto_50952 ?auto_50950 ) ) ( not ( = ?auto_50952 ?auto_50953 ) ) ( not ( = ?auto_50952 ?auto_50949 ) ) ( not ( = ?auto_50954 ?auto_50955 ) ) ( not ( = ?auto_50954 ?auto_50950 ) ) ( not ( = ?auto_50954 ?auto_50953 ) ) ( not ( = ?auto_50954 ?auto_50949 ) ) ( not ( = ?auto_50955 ?auto_50950 ) ) ( not ( = ?auto_50955 ?auto_50953 ) ) ( not ( = ?auto_50955 ?auto_50949 ) ) ( not ( = ?auto_50950 ?auto_50953 ) ) ( not ( = ?auto_50950 ?auto_50949 ) ) ( ON ?auto_50949 ?auto_50951 ) ( not ( = ?auto_50949 ?auto_50951 ) ) ( not ( = ?auto_50953 ?auto_50951 ) ) ( not ( = ?auto_50952 ?auto_50951 ) ) ( not ( = ?auto_50954 ?auto_50951 ) ) ( not ( = ?auto_50955 ?auto_50951 ) ) ( not ( = ?auto_50950 ?auto_50951 ) ) ( ON ?auto_50953 ?auto_50949 ) ( ON-TABLE ?auto_50951 ) ( ON ?auto_50950 ?auto_50953 ) ( ON ?auto_50955 ?auto_50950 ) ( CLEAR ?auto_50952 ) ( ON ?auto_50954 ?auto_50955 ) ( CLEAR ?auto_50954 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_50951 ?auto_50949 ?auto_50953 ?auto_50950 ?auto_50955 )
      ( MAKE-1PILE ?auto_50949 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_50956 - BLOCK
    )
    :vars
    (
      ?auto_50960 - BLOCK
      ?auto_50962 - BLOCK
      ?auto_50959 - BLOCK
      ?auto_50957 - BLOCK
      ?auto_50961 - BLOCK
      ?auto_50958 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_50956 ?auto_50960 ) ) ( not ( = ?auto_50962 ?auto_50959 ) ) ( not ( = ?auto_50962 ?auto_50957 ) ) ( not ( = ?auto_50962 ?auto_50961 ) ) ( not ( = ?auto_50962 ?auto_50960 ) ) ( not ( = ?auto_50962 ?auto_50956 ) ) ( not ( = ?auto_50959 ?auto_50957 ) ) ( not ( = ?auto_50959 ?auto_50961 ) ) ( not ( = ?auto_50959 ?auto_50960 ) ) ( not ( = ?auto_50959 ?auto_50956 ) ) ( not ( = ?auto_50957 ?auto_50961 ) ) ( not ( = ?auto_50957 ?auto_50960 ) ) ( not ( = ?auto_50957 ?auto_50956 ) ) ( not ( = ?auto_50961 ?auto_50960 ) ) ( not ( = ?auto_50961 ?auto_50956 ) ) ( ON ?auto_50956 ?auto_50958 ) ( not ( = ?auto_50956 ?auto_50958 ) ) ( not ( = ?auto_50960 ?auto_50958 ) ) ( not ( = ?auto_50962 ?auto_50958 ) ) ( not ( = ?auto_50959 ?auto_50958 ) ) ( not ( = ?auto_50957 ?auto_50958 ) ) ( not ( = ?auto_50961 ?auto_50958 ) ) ( ON ?auto_50960 ?auto_50956 ) ( ON-TABLE ?auto_50958 ) ( ON ?auto_50961 ?auto_50960 ) ( ON ?auto_50957 ?auto_50961 ) ( ON ?auto_50959 ?auto_50957 ) ( CLEAR ?auto_50959 ) ( HOLDING ?auto_50962 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_50962 )
      ( MAKE-1PILE ?auto_50956 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_50963 - BLOCK
    )
    :vars
    (
      ?auto_50964 - BLOCK
      ?auto_50969 - BLOCK
      ?auto_50965 - BLOCK
      ?auto_50968 - BLOCK
      ?auto_50967 - BLOCK
      ?auto_50966 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_50963 ?auto_50964 ) ) ( not ( = ?auto_50969 ?auto_50965 ) ) ( not ( = ?auto_50969 ?auto_50968 ) ) ( not ( = ?auto_50969 ?auto_50967 ) ) ( not ( = ?auto_50969 ?auto_50964 ) ) ( not ( = ?auto_50969 ?auto_50963 ) ) ( not ( = ?auto_50965 ?auto_50968 ) ) ( not ( = ?auto_50965 ?auto_50967 ) ) ( not ( = ?auto_50965 ?auto_50964 ) ) ( not ( = ?auto_50965 ?auto_50963 ) ) ( not ( = ?auto_50968 ?auto_50967 ) ) ( not ( = ?auto_50968 ?auto_50964 ) ) ( not ( = ?auto_50968 ?auto_50963 ) ) ( not ( = ?auto_50967 ?auto_50964 ) ) ( not ( = ?auto_50967 ?auto_50963 ) ) ( ON ?auto_50963 ?auto_50966 ) ( not ( = ?auto_50963 ?auto_50966 ) ) ( not ( = ?auto_50964 ?auto_50966 ) ) ( not ( = ?auto_50969 ?auto_50966 ) ) ( not ( = ?auto_50965 ?auto_50966 ) ) ( not ( = ?auto_50968 ?auto_50966 ) ) ( not ( = ?auto_50967 ?auto_50966 ) ) ( ON ?auto_50964 ?auto_50963 ) ( ON-TABLE ?auto_50966 ) ( ON ?auto_50967 ?auto_50964 ) ( ON ?auto_50968 ?auto_50967 ) ( ON ?auto_50965 ?auto_50968 ) ( ON ?auto_50969 ?auto_50965 ) ( CLEAR ?auto_50969 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_50966 ?auto_50963 ?auto_50964 ?auto_50967 ?auto_50968 ?auto_50965 )
      ( MAKE-1PILE ?auto_50963 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_50974 - BLOCK
      ?auto_50975 - BLOCK
      ?auto_50976 - BLOCK
      ?auto_50977 - BLOCK
    )
    :vars
    (
      ?auto_50978 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50978 ?auto_50977 ) ( CLEAR ?auto_50978 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_50974 ) ( ON ?auto_50975 ?auto_50974 ) ( ON ?auto_50976 ?auto_50975 ) ( ON ?auto_50977 ?auto_50976 ) ( not ( = ?auto_50974 ?auto_50975 ) ) ( not ( = ?auto_50974 ?auto_50976 ) ) ( not ( = ?auto_50974 ?auto_50977 ) ) ( not ( = ?auto_50974 ?auto_50978 ) ) ( not ( = ?auto_50975 ?auto_50976 ) ) ( not ( = ?auto_50975 ?auto_50977 ) ) ( not ( = ?auto_50975 ?auto_50978 ) ) ( not ( = ?auto_50976 ?auto_50977 ) ) ( not ( = ?auto_50976 ?auto_50978 ) ) ( not ( = ?auto_50977 ?auto_50978 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_50978 ?auto_50977 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_50979 - BLOCK
      ?auto_50980 - BLOCK
      ?auto_50981 - BLOCK
      ?auto_50982 - BLOCK
    )
    :vars
    (
      ?auto_50983 - BLOCK
      ?auto_50984 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50983 ?auto_50982 ) ( CLEAR ?auto_50983 ) ( ON-TABLE ?auto_50979 ) ( ON ?auto_50980 ?auto_50979 ) ( ON ?auto_50981 ?auto_50980 ) ( ON ?auto_50982 ?auto_50981 ) ( not ( = ?auto_50979 ?auto_50980 ) ) ( not ( = ?auto_50979 ?auto_50981 ) ) ( not ( = ?auto_50979 ?auto_50982 ) ) ( not ( = ?auto_50979 ?auto_50983 ) ) ( not ( = ?auto_50980 ?auto_50981 ) ) ( not ( = ?auto_50980 ?auto_50982 ) ) ( not ( = ?auto_50980 ?auto_50983 ) ) ( not ( = ?auto_50981 ?auto_50982 ) ) ( not ( = ?auto_50981 ?auto_50983 ) ) ( not ( = ?auto_50982 ?auto_50983 ) ) ( HOLDING ?auto_50984 ) ( not ( = ?auto_50979 ?auto_50984 ) ) ( not ( = ?auto_50980 ?auto_50984 ) ) ( not ( = ?auto_50981 ?auto_50984 ) ) ( not ( = ?auto_50982 ?auto_50984 ) ) ( not ( = ?auto_50983 ?auto_50984 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_50984 )
      ( MAKE-4PILE ?auto_50979 ?auto_50980 ?auto_50981 ?auto_50982 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_50985 - BLOCK
      ?auto_50986 - BLOCK
      ?auto_50987 - BLOCK
      ?auto_50988 - BLOCK
    )
    :vars
    (
      ?auto_50990 - BLOCK
      ?auto_50989 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50990 ?auto_50988 ) ( ON-TABLE ?auto_50985 ) ( ON ?auto_50986 ?auto_50985 ) ( ON ?auto_50987 ?auto_50986 ) ( ON ?auto_50988 ?auto_50987 ) ( not ( = ?auto_50985 ?auto_50986 ) ) ( not ( = ?auto_50985 ?auto_50987 ) ) ( not ( = ?auto_50985 ?auto_50988 ) ) ( not ( = ?auto_50985 ?auto_50990 ) ) ( not ( = ?auto_50986 ?auto_50987 ) ) ( not ( = ?auto_50986 ?auto_50988 ) ) ( not ( = ?auto_50986 ?auto_50990 ) ) ( not ( = ?auto_50987 ?auto_50988 ) ) ( not ( = ?auto_50987 ?auto_50990 ) ) ( not ( = ?auto_50988 ?auto_50990 ) ) ( not ( = ?auto_50985 ?auto_50989 ) ) ( not ( = ?auto_50986 ?auto_50989 ) ) ( not ( = ?auto_50987 ?auto_50989 ) ) ( not ( = ?auto_50988 ?auto_50989 ) ) ( not ( = ?auto_50990 ?auto_50989 ) ) ( ON ?auto_50989 ?auto_50990 ) ( CLEAR ?auto_50989 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_50985 ?auto_50986 ?auto_50987 ?auto_50988 ?auto_50990 )
      ( MAKE-4PILE ?auto_50985 ?auto_50986 ?auto_50987 ?auto_50988 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_50991 - BLOCK
      ?auto_50992 - BLOCK
      ?auto_50993 - BLOCK
      ?auto_50994 - BLOCK
    )
    :vars
    (
      ?auto_50995 - BLOCK
      ?auto_50996 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_50995 ?auto_50994 ) ( ON-TABLE ?auto_50991 ) ( ON ?auto_50992 ?auto_50991 ) ( ON ?auto_50993 ?auto_50992 ) ( ON ?auto_50994 ?auto_50993 ) ( not ( = ?auto_50991 ?auto_50992 ) ) ( not ( = ?auto_50991 ?auto_50993 ) ) ( not ( = ?auto_50991 ?auto_50994 ) ) ( not ( = ?auto_50991 ?auto_50995 ) ) ( not ( = ?auto_50992 ?auto_50993 ) ) ( not ( = ?auto_50992 ?auto_50994 ) ) ( not ( = ?auto_50992 ?auto_50995 ) ) ( not ( = ?auto_50993 ?auto_50994 ) ) ( not ( = ?auto_50993 ?auto_50995 ) ) ( not ( = ?auto_50994 ?auto_50995 ) ) ( not ( = ?auto_50991 ?auto_50996 ) ) ( not ( = ?auto_50992 ?auto_50996 ) ) ( not ( = ?auto_50993 ?auto_50996 ) ) ( not ( = ?auto_50994 ?auto_50996 ) ) ( not ( = ?auto_50995 ?auto_50996 ) ) ( HOLDING ?auto_50996 ) ( CLEAR ?auto_50995 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_50991 ?auto_50992 ?auto_50993 ?auto_50994 ?auto_50995 ?auto_50996 )
      ( MAKE-4PILE ?auto_50991 ?auto_50992 ?auto_50993 ?auto_50994 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_50997 - BLOCK
      ?auto_50998 - BLOCK
      ?auto_50999 - BLOCK
      ?auto_51000 - BLOCK
    )
    :vars
    (
      ?auto_51001 - BLOCK
      ?auto_51002 - BLOCK
      ?auto_51003 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_51001 ?auto_51000 ) ( ON-TABLE ?auto_50997 ) ( ON ?auto_50998 ?auto_50997 ) ( ON ?auto_50999 ?auto_50998 ) ( ON ?auto_51000 ?auto_50999 ) ( not ( = ?auto_50997 ?auto_50998 ) ) ( not ( = ?auto_50997 ?auto_50999 ) ) ( not ( = ?auto_50997 ?auto_51000 ) ) ( not ( = ?auto_50997 ?auto_51001 ) ) ( not ( = ?auto_50998 ?auto_50999 ) ) ( not ( = ?auto_50998 ?auto_51000 ) ) ( not ( = ?auto_50998 ?auto_51001 ) ) ( not ( = ?auto_50999 ?auto_51000 ) ) ( not ( = ?auto_50999 ?auto_51001 ) ) ( not ( = ?auto_51000 ?auto_51001 ) ) ( not ( = ?auto_50997 ?auto_51002 ) ) ( not ( = ?auto_50998 ?auto_51002 ) ) ( not ( = ?auto_50999 ?auto_51002 ) ) ( not ( = ?auto_51000 ?auto_51002 ) ) ( not ( = ?auto_51001 ?auto_51002 ) ) ( CLEAR ?auto_51001 ) ( ON ?auto_51002 ?auto_51003 ) ( CLEAR ?auto_51002 ) ( HAND-EMPTY ) ( not ( = ?auto_50997 ?auto_51003 ) ) ( not ( = ?auto_50998 ?auto_51003 ) ) ( not ( = ?auto_50999 ?auto_51003 ) ) ( not ( = ?auto_51000 ?auto_51003 ) ) ( not ( = ?auto_51001 ?auto_51003 ) ) ( not ( = ?auto_51002 ?auto_51003 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_51002 ?auto_51003 )
      ( MAKE-4PILE ?auto_50997 ?auto_50998 ?auto_50999 ?auto_51000 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_51018 - BLOCK
      ?auto_51019 - BLOCK
      ?auto_51020 - BLOCK
      ?auto_51021 - BLOCK
    )
    :vars
    (
      ?auto_51022 - BLOCK
      ?auto_51024 - BLOCK
      ?auto_51023 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_51018 ) ( ON ?auto_51019 ?auto_51018 ) ( ON ?auto_51020 ?auto_51019 ) ( not ( = ?auto_51018 ?auto_51019 ) ) ( not ( = ?auto_51018 ?auto_51020 ) ) ( not ( = ?auto_51018 ?auto_51021 ) ) ( not ( = ?auto_51018 ?auto_51022 ) ) ( not ( = ?auto_51019 ?auto_51020 ) ) ( not ( = ?auto_51019 ?auto_51021 ) ) ( not ( = ?auto_51019 ?auto_51022 ) ) ( not ( = ?auto_51020 ?auto_51021 ) ) ( not ( = ?auto_51020 ?auto_51022 ) ) ( not ( = ?auto_51021 ?auto_51022 ) ) ( not ( = ?auto_51018 ?auto_51024 ) ) ( not ( = ?auto_51019 ?auto_51024 ) ) ( not ( = ?auto_51020 ?auto_51024 ) ) ( not ( = ?auto_51021 ?auto_51024 ) ) ( not ( = ?auto_51022 ?auto_51024 ) ) ( ON ?auto_51024 ?auto_51023 ) ( not ( = ?auto_51018 ?auto_51023 ) ) ( not ( = ?auto_51019 ?auto_51023 ) ) ( not ( = ?auto_51020 ?auto_51023 ) ) ( not ( = ?auto_51021 ?auto_51023 ) ) ( not ( = ?auto_51022 ?auto_51023 ) ) ( not ( = ?auto_51024 ?auto_51023 ) ) ( ON ?auto_51022 ?auto_51024 ) ( CLEAR ?auto_51022 ) ( HOLDING ?auto_51021 ) ( CLEAR ?auto_51020 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_51018 ?auto_51019 ?auto_51020 ?auto_51021 ?auto_51022 )
      ( MAKE-4PILE ?auto_51018 ?auto_51019 ?auto_51020 ?auto_51021 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_51025 - BLOCK
      ?auto_51026 - BLOCK
      ?auto_51027 - BLOCK
      ?auto_51028 - BLOCK
    )
    :vars
    (
      ?auto_51030 - BLOCK
      ?auto_51029 - BLOCK
      ?auto_51031 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_51025 ) ( ON ?auto_51026 ?auto_51025 ) ( ON ?auto_51027 ?auto_51026 ) ( not ( = ?auto_51025 ?auto_51026 ) ) ( not ( = ?auto_51025 ?auto_51027 ) ) ( not ( = ?auto_51025 ?auto_51028 ) ) ( not ( = ?auto_51025 ?auto_51030 ) ) ( not ( = ?auto_51026 ?auto_51027 ) ) ( not ( = ?auto_51026 ?auto_51028 ) ) ( not ( = ?auto_51026 ?auto_51030 ) ) ( not ( = ?auto_51027 ?auto_51028 ) ) ( not ( = ?auto_51027 ?auto_51030 ) ) ( not ( = ?auto_51028 ?auto_51030 ) ) ( not ( = ?auto_51025 ?auto_51029 ) ) ( not ( = ?auto_51026 ?auto_51029 ) ) ( not ( = ?auto_51027 ?auto_51029 ) ) ( not ( = ?auto_51028 ?auto_51029 ) ) ( not ( = ?auto_51030 ?auto_51029 ) ) ( ON ?auto_51029 ?auto_51031 ) ( not ( = ?auto_51025 ?auto_51031 ) ) ( not ( = ?auto_51026 ?auto_51031 ) ) ( not ( = ?auto_51027 ?auto_51031 ) ) ( not ( = ?auto_51028 ?auto_51031 ) ) ( not ( = ?auto_51030 ?auto_51031 ) ) ( not ( = ?auto_51029 ?auto_51031 ) ) ( ON ?auto_51030 ?auto_51029 ) ( CLEAR ?auto_51027 ) ( ON ?auto_51028 ?auto_51030 ) ( CLEAR ?auto_51028 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_51031 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_51031 ?auto_51029 ?auto_51030 )
      ( MAKE-4PILE ?auto_51025 ?auto_51026 ?auto_51027 ?auto_51028 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_51032 - BLOCK
      ?auto_51033 - BLOCK
      ?auto_51034 - BLOCK
      ?auto_51035 - BLOCK
    )
    :vars
    (
      ?auto_51038 - BLOCK
      ?auto_51037 - BLOCK
      ?auto_51036 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_51032 ) ( ON ?auto_51033 ?auto_51032 ) ( not ( = ?auto_51032 ?auto_51033 ) ) ( not ( = ?auto_51032 ?auto_51034 ) ) ( not ( = ?auto_51032 ?auto_51035 ) ) ( not ( = ?auto_51032 ?auto_51038 ) ) ( not ( = ?auto_51033 ?auto_51034 ) ) ( not ( = ?auto_51033 ?auto_51035 ) ) ( not ( = ?auto_51033 ?auto_51038 ) ) ( not ( = ?auto_51034 ?auto_51035 ) ) ( not ( = ?auto_51034 ?auto_51038 ) ) ( not ( = ?auto_51035 ?auto_51038 ) ) ( not ( = ?auto_51032 ?auto_51037 ) ) ( not ( = ?auto_51033 ?auto_51037 ) ) ( not ( = ?auto_51034 ?auto_51037 ) ) ( not ( = ?auto_51035 ?auto_51037 ) ) ( not ( = ?auto_51038 ?auto_51037 ) ) ( ON ?auto_51037 ?auto_51036 ) ( not ( = ?auto_51032 ?auto_51036 ) ) ( not ( = ?auto_51033 ?auto_51036 ) ) ( not ( = ?auto_51034 ?auto_51036 ) ) ( not ( = ?auto_51035 ?auto_51036 ) ) ( not ( = ?auto_51038 ?auto_51036 ) ) ( not ( = ?auto_51037 ?auto_51036 ) ) ( ON ?auto_51038 ?auto_51037 ) ( ON ?auto_51035 ?auto_51038 ) ( CLEAR ?auto_51035 ) ( ON-TABLE ?auto_51036 ) ( HOLDING ?auto_51034 ) ( CLEAR ?auto_51033 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_51032 ?auto_51033 ?auto_51034 )
      ( MAKE-4PILE ?auto_51032 ?auto_51033 ?auto_51034 ?auto_51035 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_51039 - BLOCK
      ?auto_51040 - BLOCK
      ?auto_51041 - BLOCK
      ?auto_51042 - BLOCK
    )
    :vars
    (
      ?auto_51043 - BLOCK
      ?auto_51045 - BLOCK
      ?auto_51044 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_51039 ) ( ON ?auto_51040 ?auto_51039 ) ( not ( = ?auto_51039 ?auto_51040 ) ) ( not ( = ?auto_51039 ?auto_51041 ) ) ( not ( = ?auto_51039 ?auto_51042 ) ) ( not ( = ?auto_51039 ?auto_51043 ) ) ( not ( = ?auto_51040 ?auto_51041 ) ) ( not ( = ?auto_51040 ?auto_51042 ) ) ( not ( = ?auto_51040 ?auto_51043 ) ) ( not ( = ?auto_51041 ?auto_51042 ) ) ( not ( = ?auto_51041 ?auto_51043 ) ) ( not ( = ?auto_51042 ?auto_51043 ) ) ( not ( = ?auto_51039 ?auto_51045 ) ) ( not ( = ?auto_51040 ?auto_51045 ) ) ( not ( = ?auto_51041 ?auto_51045 ) ) ( not ( = ?auto_51042 ?auto_51045 ) ) ( not ( = ?auto_51043 ?auto_51045 ) ) ( ON ?auto_51045 ?auto_51044 ) ( not ( = ?auto_51039 ?auto_51044 ) ) ( not ( = ?auto_51040 ?auto_51044 ) ) ( not ( = ?auto_51041 ?auto_51044 ) ) ( not ( = ?auto_51042 ?auto_51044 ) ) ( not ( = ?auto_51043 ?auto_51044 ) ) ( not ( = ?auto_51045 ?auto_51044 ) ) ( ON ?auto_51043 ?auto_51045 ) ( ON ?auto_51042 ?auto_51043 ) ( ON-TABLE ?auto_51044 ) ( CLEAR ?auto_51040 ) ( ON ?auto_51041 ?auto_51042 ) ( CLEAR ?auto_51041 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_51044 ?auto_51045 ?auto_51043 ?auto_51042 )
      ( MAKE-4PILE ?auto_51039 ?auto_51040 ?auto_51041 ?auto_51042 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_51046 - BLOCK
      ?auto_51047 - BLOCK
      ?auto_51048 - BLOCK
      ?auto_51049 - BLOCK
    )
    :vars
    (
      ?auto_51051 - BLOCK
      ?auto_51050 - BLOCK
      ?auto_51052 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_51046 ) ( not ( = ?auto_51046 ?auto_51047 ) ) ( not ( = ?auto_51046 ?auto_51048 ) ) ( not ( = ?auto_51046 ?auto_51049 ) ) ( not ( = ?auto_51046 ?auto_51051 ) ) ( not ( = ?auto_51047 ?auto_51048 ) ) ( not ( = ?auto_51047 ?auto_51049 ) ) ( not ( = ?auto_51047 ?auto_51051 ) ) ( not ( = ?auto_51048 ?auto_51049 ) ) ( not ( = ?auto_51048 ?auto_51051 ) ) ( not ( = ?auto_51049 ?auto_51051 ) ) ( not ( = ?auto_51046 ?auto_51050 ) ) ( not ( = ?auto_51047 ?auto_51050 ) ) ( not ( = ?auto_51048 ?auto_51050 ) ) ( not ( = ?auto_51049 ?auto_51050 ) ) ( not ( = ?auto_51051 ?auto_51050 ) ) ( ON ?auto_51050 ?auto_51052 ) ( not ( = ?auto_51046 ?auto_51052 ) ) ( not ( = ?auto_51047 ?auto_51052 ) ) ( not ( = ?auto_51048 ?auto_51052 ) ) ( not ( = ?auto_51049 ?auto_51052 ) ) ( not ( = ?auto_51051 ?auto_51052 ) ) ( not ( = ?auto_51050 ?auto_51052 ) ) ( ON ?auto_51051 ?auto_51050 ) ( ON ?auto_51049 ?auto_51051 ) ( ON-TABLE ?auto_51052 ) ( ON ?auto_51048 ?auto_51049 ) ( CLEAR ?auto_51048 ) ( HOLDING ?auto_51047 ) ( CLEAR ?auto_51046 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_51046 ?auto_51047 )
      ( MAKE-4PILE ?auto_51046 ?auto_51047 ?auto_51048 ?auto_51049 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_51053 - BLOCK
      ?auto_51054 - BLOCK
      ?auto_51055 - BLOCK
      ?auto_51056 - BLOCK
    )
    :vars
    (
      ?auto_51058 - BLOCK
      ?auto_51057 - BLOCK
      ?auto_51059 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_51053 ) ( not ( = ?auto_51053 ?auto_51054 ) ) ( not ( = ?auto_51053 ?auto_51055 ) ) ( not ( = ?auto_51053 ?auto_51056 ) ) ( not ( = ?auto_51053 ?auto_51058 ) ) ( not ( = ?auto_51054 ?auto_51055 ) ) ( not ( = ?auto_51054 ?auto_51056 ) ) ( not ( = ?auto_51054 ?auto_51058 ) ) ( not ( = ?auto_51055 ?auto_51056 ) ) ( not ( = ?auto_51055 ?auto_51058 ) ) ( not ( = ?auto_51056 ?auto_51058 ) ) ( not ( = ?auto_51053 ?auto_51057 ) ) ( not ( = ?auto_51054 ?auto_51057 ) ) ( not ( = ?auto_51055 ?auto_51057 ) ) ( not ( = ?auto_51056 ?auto_51057 ) ) ( not ( = ?auto_51058 ?auto_51057 ) ) ( ON ?auto_51057 ?auto_51059 ) ( not ( = ?auto_51053 ?auto_51059 ) ) ( not ( = ?auto_51054 ?auto_51059 ) ) ( not ( = ?auto_51055 ?auto_51059 ) ) ( not ( = ?auto_51056 ?auto_51059 ) ) ( not ( = ?auto_51058 ?auto_51059 ) ) ( not ( = ?auto_51057 ?auto_51059 ) ) ( ON ?auto_51058 ?auto_51057 ) ( ON ?auto_51056 ?auto_51058 ) ( ON-TABLE ?auto_51059 ) ( ON ?auto_51055 ?auto_51056 ) ( CLEAR ?auto_51053 ) ( ON ?auto_51054 ?auto_51055 ) ( CLEAR ?auto_51054 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_51059 ?auto_51057 ?auto_51058 ?auto_51056 ?auto_51055 )
      ( MAKE-4PILE ?auto_51053 ?auto_51054 ?auto_51055 ?auto_51056 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_51060 - BLOCK
      ?auto_51061 - BLOCK
      ?auto_51062 - BLOCK
      ?auto_51063 - BLOCK
    )
    :vars
    (
      ?auto_51064 - BLOCK
      ?auto_51065 - BLOCK
      ?auto_51066 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_51060 ?auto_51061 ) ) ( not ( = ?auto_51060 ?auto_51062 ) ) ( not ( = ?auto_51060 ?auto_51063 ) ) ( not ( = ?auto_51060 ?auto_51064 ) ) ( not ( = ?auto_51061 ?auto_51062 ) ) ( not ( = ?auto_51061 ?auto_51063 ) ) ( not ( = ?auto_51061 ?auto_51064 ) ) ( not ( = ?auto_51062 ?auto_51063 ) ) ( not ( = ?auto_51062 ?auto_51064 ) ) ( not ( = ?auto_51063 ?auto_51064 ) ) ( not ( = ?auto_51060 ?auto_51065 ) ) ( not ( = ?auto_51061 ?auto_51065 ) ) ( not ( = ?auto_51062 ?auto_51065 ) ) ( not ( = ?auto_51063 ?auto_51065 ) ) ( not ( = ?auto_51064 ?auto_51065 ) ) ( ON ?auto_51065 ?auto_51066 ) ( not ( = ?auto_51060 ?auto_51066 ) ) ( not ( = ?auto_51061 ?auto_51066 ) ) ( not ( = ?auto_51062 ?auto_51066 ) ) ( not ( = ?auto_51063 ?auto_51066 ) ) ( not ( = ?auto_51064 ?auto_51066 ) ) ( not ( = ?auto_51065 ?auto_51066 ) ) ( ON ?auto_51064 ?auto_51065 ) ( ON ?auto_51063 ?auto_51064 ) ( ON-TABLE ?auto_51066 ) ( ON ?auto_51062 ?auto_51063 ) ( ON ?auto_51061 ?auto_51062 ) ( CLEAR ?auto_51061 ) ( HOLDING ?auto_51060 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_51060 )
      ( MAKE-4PILE ?auto_51060 ?auto_51061 ?auto_51062 ?auto_51063 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_51067 - BLOCK
      ?auto_51068 - BLOCK
      ?auto_51069 - BLOCK
      ?auto_51070 - BLOCK
    )
    :vars
    (
      ?auto_51073 - BLOCK
      ?auto_51071 - BLOCK
      ?auto_51072 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_51067 ?auto_51068 ) ) ( not ( = ?auto_51067 ?auto_51069 ) ) ( not ( = ?auto_51067 ?auto_51070 ) ) ( not ( = ?auto_51067 ?auto_51073 ) ) ( not ( = ?auto_51068 ?auto_51069 ) ) ( not ( = ?auto_51068 ?auto_51070 ) ) ( not ( = ?auto_51068 ?auto_51073 ) ) ( not ( = ?auto_51069 ?auto_51070 ) ) ( not ( = ?auto_51069 ?auto_51073 ) ) ( not ( = ?auto_51070 ?auto_51073 ) ) ( not ( = ?auto_51067 ?auto_51071 ) ) ( not ( = ?auto_51068 ?auto_51071 ) ) ( not ( = ?auto_51069 ?auto_51071 ) ) ( not ( = ?auto_51070 ?auto_51071 ) ) ( not ( = ?auto_51073 ?auto_51071 ) ) ( ON ?auto_51071 ?auto_51072 ) ( not ( = ?auto_51067 ?auto_51072 ) ) ( not ( = ?auto_51068 ?auto_51072 ) ) ( not ( = ?auto_51069 ?auto_51072 ) ) ( not ( = ?auto_51070 ?auto_51072 ) ) ( not ( = ?auto_51073 ?auto_51072 ) ) ( not ( = ?auto_51071 ?auto_51072 ) ) ( ON ?auto_51073 ?auto_51071 ) ( ON ?auto_51070 ?auto_51073 ) ( ON-TABLE ?auto_51072 ) ( ON ?auto_51069 ?auto_51070 ) ( ON ?auto_51068 ?auto_51069 ) ( ON ?auto_51067 ?auto_51068 ) ( CLEAR ?auto_51067 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_51072 ?auto_51071 ?auto_51073 ?auto_51070 ?auto_51069 ?auto_51068 )
      ( MAKE-4PILE ?auto_51067 ?auto_51068 ?auto_51069 ?auto_51070 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_51076 - BLOCK
      ?auto_51077 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_51077 ) ( CLEAR ?auto_51076 ) ( ON-TABLE ?auto_51076 ) ( not ( = ?auto_51076 ?auto_51077 ) ) )
    :subtasks
    ( ( !STACK ?auto_51077 ?auto_51076 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_51078 - BLOCK
      ?auto_51079 - BLOCK
    )
    :vars
    (
      ?auto_51080 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_51078 ) ( ON-TABLE ?auto_51078 ) ( not ( = ?auto_51078 ?auto_51079 ) ) ( ON ?auto_51079 ?auto_51080 ) ( CLEAR ?auto_51079 ) ( HAND-EMPTY ) ( not ( = ?auto_51078 ?auto_51080 ) ) ( not ( = ?auto_51079 ?auto_51080 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_51079 ?auto_51080 )
      ( MAKE-2PILE ?auto_51078 ?auto_51079 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_51081 - BLOCK
      ?auto_51082 - BLOCK
    )
    :vars
    (
      ?auto_51083 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_51081 ?auto_51082 ) ) ( ON ?auto_51082 ?auto_51083 ) ( CLEAR ?auto_51082 ) ( not ( = ?auto_51081 ?auto_51083 ) ) ( not ( = ?auto_51082 ?auto_51083 ) ) ( HOLDING ?auto_51081 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_51081 )
      ( MAKE-2PILE ?auto_51081 ?auto_51082 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_51084 - BLOCK
      ?auto_51085 - BLOCK
    )
    :vars
    (
      ?auto_51086 - BLOCK
      ?auto_51089 - BLOCK
      ?auto_51088 - BLOCK
      ?auto_51087 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_51084 ?auto_51085 ) ) ( ON ?auto_51085 ?auto_51086 ) ( not ( = ?auto_51084 ?auto_51086 ) ) ( not ( = ?auto_51085 ?auto_51086 ) ) ( ON ?auto_51084 ?auto_51085 ) ( CLEAR ?auto_51084 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_51089 ) ( ON ?auto_51088 ?auto_51089 ) ( ON ?auto_51087 ?auto_51088 ) ( ON ?auto_51086 ?auto_51087 ) ( not ( = ?auto_51089 ?auto_51088 ) ) ( not ( = ?auto_51089 ?auto_51087 ) ) ( not ( = ?auto_51089 ?auto_51086 ) ) ( not ( = ?auto_51089 ?auto_51085 ) ) ( not ( = ?auto_51089 ?auto_51084 ) ) ( not ( = ?auto_51088 ?auto_51087 ) ) ( not ( = ?auto_51088 ?auto_51086 ) ) ( not ( = ?auto_51088 ?auto_51085 ) ) ( not ( = ?auto_51088 ?auto_51084 ) ) ( not ( = ?auto_51087 ?auto_51086 ) ) ( not ( = ?auto_51087 ?auto_51085 ) ) ( not ( = ?auto_51087 ?auto_51084 ) ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_51089 ?auto_51088 ?auto_51087 ?auto_51086 ?auto_51085 )
      ( MAKE-2PILE ?auto_51084 ?auto_51085 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_51090 - BLOCK
      ?auto_51091 - BLOCK
    )
    :vars
    (
      ?auto_51094 - BLOCK
      ?auto_51093 - BLOCK
      ?auto_51092 - BLOCK
      ?auto_51095 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_51090 ?auto_51091 ) ) ( ON ?auto_51091 ?auto_51094 ) ( not ( = ?auto_51090 ?auto_51094 ) ) ( not ( = ?auto_51091 ?auto_51094 ) ) ( ON-TABLE ?auto_51093 ) ( ON ?auto_51092 ?auto_51093 ) ( ON ?auto_51095 ?auto_51092 ) ( ON ?auto_51094 ?auto_51095 ) ( not ( = ?auto_51093 ?auto_51092 ) ) ( not ( = ?auto_51093 ?auto_51095 ) ) ( not ( = ?auto_51093 ?auto_51094 ) ) ( not ( = ?auto_51093 ?auto_51091 ) ) ( not ( = ?auto_51093 ?auto_51090 ) ) ( not ( = ?auto_51092 ?auto_51095 ) ) ( not ( = ?auto_51092 ?auto_51094 ) ) ( not ( = ?auto_51092 ?auto_51091 ) ) ( not ( = ?auto_51092 ?auto_51090 ) ) ( not ( = ?auto_51095 ?auto_51094 ) ) ( not ( = ?auto_51095 ?auto_51091 ) ) ( not ( = ?auto_51095 ?auto_51090 ) ) ( HOLDING ?auto_51090 ) ( CLEAR ?auto_51091 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_51093 ?auto_51092 ?auto_51095 ?auto_51094 ?auto_51091 ?auto_51090 )
      ( MAKE-2PILE ?auto_51090 ?auto_51091 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_51096 - BLOCK
      ?auto_51097 - BLOCK
    )
    :vars
    (
      ?auto_51098 - BLOCK
      ?auto_51101 - BLOCK
      ?auto_51099 - BLOCK
      ?auto_51100 - BLOCK
      ?auto_51102 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_51096 ?auto_51097 ) ) ( ON ?auto_51097 ?auto_51098 ) ( not ( = ?auto_51096 ?auto_51098 ) ) ( not ( = ?auto_51097 ?auto_51098 ) ) ( ON-TABLE ?auto_51101 ) ( ON ?auto_51099 ?auto_51101 ) ( ON ?auto_51100 ?auto_51099 ) ( ON ?auto_51098 ?auto_51100 ) ( not ( = ?auto_51101 ?auto_51099 ) ) ( not ( = ?auto_51101 ?auto_51100 ) ) ( not ( = ?auto_51101 ?auto_51098 ) ) ( not ( = ?auto_51101 ?auto_51097 ) ) ( not ( = ?auto_51101 ?auto_51096 ) ) ( not ( = ?auto_51099 ?auto_51100 ) ) ( not ( = ?auto_51099 ?auto_51098 ) ) ( not ( = ?auto_51099 ?auto_51097 ) ) ( not ( = ?auto_51099 ?auto_51096 ) ) ( not ( = ?auto_51100 ?auto_51098 ) ) ( not ( = ?auto_51100 ?auto_51097 ) ) ( not ( = ?auto_51100 ?auto_51096 ) ) ( CLEAR ?auto_51097 ) ( ON ?auto_51096 ?auto_51102 ) ( CLEAR ?auto_51096 ) ( HAND-EMPTY ) ( not ( = ?auto_51096 ?auto_51102 ) ) ( not ( = ?auto_51097 ?auto_51102 ) ) ( not ( = ?auto_51098 ?auto_51102 ) ) ( not ( = ?auto_51101 ?auto_51102 ) ) ( not ( = ?auto_51099 ?auto_51102 ) ) ( not ( = ?auto_51100 ?auto_51102 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_51096 ?auto_51102 )
      ( MAKE-2PILE ?auto_51096 ?auto_51097 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_51103 - BLOCK
      ?auto_51104 - BLOCK
    )
    :vars
    (
      ?auto_51108 - BLOCK
      ?auto_51106 - BLOCK
      ?auto_51109 - BLOCK
      ?auto_51107 - BLOCK
      ?auto_51105 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_51103 ?auto_51104 ) ) ( not ( = ?auto_51103 ?auto_51108 ) ) ( not ( = ?auto_51104 ?auto_51108 ) ) ( ON-TABLE ?auto_51106 ) ( ON ?auto_51109 ?auto_51106 ) ( ON ?auto_51107 ?auto_51109 ) ( ON ?auto_51108 ?auto_51107 ) ( not ( = ?auto_51106 ?auto_51109 ) ) ( not ( = ?auto_51106 ?auto_51107 ) ) ( not ( = ?auto_51106 ?auto_51108 ) ) ( not ( = ?auto_51106 ?auto_51104 ) ) ( not ( = ?auto_51106 ?auto_51103 ) ) ( not ( = ?auto_51109 ?auto_51107 ) ) ( not ( = ?auto_51109 ?auto_51108 ) ) ( not ( = ?auto_51109 ?auto_51104 ) ) ( not ( = ?auto_51109 ?auto_51103 ) ) ( not ( = ?auto_51107 ?auto_51108 ) ) ( not ( = ?auto_51107 ?auto_51104 ) ) ( not ( = ?auto_51107 ?auto_51103 ) ) ( ON ?auto_51103 ?auto_51105 ) ( CLEAR ?auto_51103 ) ( not ( = ?auto_51103 ?auto_51105 ) ) ( not ( = ?auto_51104 ?auto_51105 ) ) ( not ( = ?auto_51108 ?auto_51105 ) ) ( not ( = ?auto_51106 ?auto_51105 ) ) ( not ( = ?auto_51109 ?auto_51105 ) ) ( not ( = ?auto_51107 ?auto_51105 ) ) ( HOLDING ?auto_51104 ) ( CLEAR ?auto_51108 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_51106 ?auto_51109 ?auto_51107 ?auto_51108 ?auto_51104 )
      ( MAKE-2PILE ?auto_51103 ?auto_51104 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_51110 - BLOCK
      ?auto_51111 - BLOCK
    )
    :vars
    (
      ?auto_51116 - BLOCK
      ?auto_51113 - BLOCK
      ?auto_51112 - BLOCK
      ?auto_51114 - BLOCK
      ?auto_51115 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_51110 ?auto_51111 ) ) ( not ( = ?auto_51110 ?auto_51116 ) ) ( not ( = ?auto_51111 ?auto_51116 ) ) ( ON-TABLE ?auto_51113 ) ( ON ?auto_51112 ?auto_51113 ) ( ON ?auto_51114 ?auto_51112 ) ( ON ?auto_51116 ?auto_51114 ) ( not ( = ?auto_51113 ?auto_51112 ) ) ( not ( = ?auto_51113 ?auto_51114 ) ) ( not ( = ?auto_51113 ?auto_51116 ) ) ( not ( = ?auto_51113 ?auto_51111 ) ) ( not ( = ?auto_51113 ?auto_51110 ) ) ( not ( = ?auto_51112 ?auto_51114 ) ) ( not ( = ?auto_51112 ?auto_51116 ) ) ( not ( = ?auto_51112 ?auto_51111 ) ) ( not ( = ?auto_51112 ?auto_51110 ) ) ( not ( = ?auto_51114 ?auto_51116 ) ) ( not ( = ?auto_51114 ?auto_51111 ) ) ( not ( = ?auto_51114 ?auto_51110 ) ) ( ON ?auto_51110 ?auto_51115 ) ( not ( = ?auto_51110 ?auto_51115 ) ) ( not ( = ?auto_51111 ?auto_51115 ) ) ( not ( = ?auto_51116 ?auto_51115 ) ) ( not ( = ?auto_51113 ?auto_51115 ) ) ( not ( = ?auto_51112 ?auto_51115 ) ) ( not ( = ?auto_51114 ?auto_51115 ) ) ( CLEAR ?auto_51116 ) ( ON ?auto_51111 ?auto_51110 ) ( CLEAR ?auto_51111 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_51115 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_51115 ?auto_51110 )
      ( MAKE-2PILE ?auto_51110 ?auto_51111 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_51117 - BLOCK
      ?auto_51118 - BLOCK
    )
    :vars
    (
      ?auto_51123 - BLOCK
      ?auto_51120 - BLOCK
      ?auto_51119 - BLOCK
      ?auto_51121 - BLOCK
      ?auto_51122 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_51117 ?auto_51118 ) ) ( not ( = ?auto_51117 ?auto_51123 ) ) ( not ( = ?auto_51118 ?auto_51123 ) ) ( ON-TABLE ?auto_51120 ) ( ON ?auto_51119 ?auto_51120 ) ( ON ?auto_51121 ?auto_51119 ) ( not ( = ?auto_51120 ?auto_51119 ) ) ( not ( = ?auto_51120 ?auto_51121 ) ) ( not ( = ?auto_51120 ?auto_51123 ) ) ( not ( = ?auto_51120 ?auto_51118 ) ) ( not ( = ?auto_51120 ?auto_51117 ) ) ( not ( = ?auto_51119 ?auto_51121 ) ) ( not ( = ?auto_51119 ?auto_51123 ) ) ( not ( = ?auto_51119 ?auto_51118 ) ) ( not ( = ?auto_51119 ?auto_51117 ) ) ( not ( = ?auto_51121 ?auto_51123 ) ) ( not ( = ?auto_51121 ?auto_51118 ) ) ( not ( = ?auto_51121 ?auto_51117 ) ) ( ON ?auto_51117 ?auto_51122 ) ( not ( = ?auto_51117 ?auto_51122 ) ) ( not ( = ?auto_51118 ?auto_51122 ) ) ( not ( = ?auto_51123 ?auto_51122 ) ) ( not ( = ?auto_51120 ?auto_51122 ) ) ( not ( = ?auto_51119 ?auto_51122 ) ) ( not ( = ?auto_51121 ?auto_51122 ) ) ( ON ?auto_51118 ?auto_51117 ) ( CLEAR ?auto_51118 ) ( ON-TABLE ?auto_51122 ) ( HOLDING ?auto_51123 ) ( CLEAR ?auto_51121 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_51120 ?auto_51119 ?auto_51121 ?auto_51123 )
      ( MAKE-2PILE ?auto_51117 ?auto_51118 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_51124 - BLOCK
      ?auto_51125 - BLOCK
    )
    :vars
    (
      ?auto_51126 - BLOCK
      ?auto_51129 - BLOCK
      ?auto_51128 - BLOCK
      ?auto_51127 - BLOCK
      ?auto_51130 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_51124 ?auto_51125 ) ) ( not ( = ?auto_51124 ?auto_51126 ) ) ( not ( = ?auto_51125 ?auto_51126 ) ) ( ON-TABLE ?auto_51129 ) ( ON ?auto_51128 ?auto_51129 ) ( ON ?auto_51127 ?auto_51128 ) ( not ( = ?auto_51129 ?auto_51128 ) ) ( not ( = ?auto_51129 ?auto_51127 ) ) ( not ( = ?auto_51129 ?auto_51126 ) ) ( not ( = ?auto_51129 ?auto_51125 ) ) ( not ( = ?auto_51129 ?auto_51124 ) ) ( not ( = ?auto_51128 ?auto_51127 ) ) ( not ( = ?auto_51128 ?auto_51126 ) ) ( not ( = ?auto_51128 ?auto_51125 ) ) ( not ( = ?auto_51128 ?auto_51124 ) ) ( not ( = ?auto_51127 ?auto_51126 ) ) ( not ( = ?auto_51127 ?auto_51125 ) ) ( not ( = ?auto_51127 ?auto_51124 ) ) ( ON ?auto_51124 ?auto_51130 ) ( not ( = ?auto_51124 ?auto_51130 ) ) ( not ( = ?auto_51125 ?auto_51130 ) ) ( not ( = ?auto_51126 ?auto_51130 ) ) ( not ( = ?auto_51129 ?auto_51130 ) ) ( not ( = ?auto_51128 ?auto_51130 ) ) ( not ( = ?auto_51127 ?auto_51130 ) ) ( ON ?auto_51125 ?auto_51124 ) ( ON-TABLE ?auto_51130 ) ( CLEAR ?auto_51127 ) ( ON ?auto_51126 ?auto_51125 ) ( CLEAR ?auto_51126 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_51130 ?auto_51124 ?auto_51125 )
      ( MAKE-2PILE ?auto_51124 ?auto_51125 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_51131 - BLOCK
      ?auto_51132 - BLOCK
    )
    :vars
    (
      ?auto_51137 - BLOCK
      ?auto_51136 - BLOCK
      ?auto_51133 - BLOCK
      ?auto_51135 - BLOCK
      ?auto_51134 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_51131 ?auto_51132 ) ) ( not ( = ?auto_51131 ?auto_51137 ) ) ( not ( = ?auto_51132 ?auto_51137 ) ) ( ON-TABLE ?auto_51136 ) ( ON ?auto_51133 ?auto_51136 ) ( not ( = ?auto_51136 ?auto_51133 ) ) ( not ( = ?auto_51136 ?auto_51135 ) ) ( not ( = ?auto_51136 ?auto_51137 ) ) ( not ( = ?auto_51136 ?auto_51132 ) ) ( not ( = ?auto_51136 ?auto_51131 ) ) ( not ( = ?auto_51133 ?auto_51135 ) ) ( not ( = ?auto_51133 ?auto_51137 ) ) ( not ( = ?auto_51133 ?auto_51132 ) ) ( not ( = ?auto_51133 ?auto_51131 ) ) ( not ( = ?auto_51135 ?auto_51137 ) ) ( not ( = ?auto_51135 ?auto_51132 ) ) ( not ( = ?auto_51135 ?auto_51131 ) ) ( ON ?auto_51131 ?auto_51134 ) ( not ( = ?auto_51131 ?auto_51134 ) ) ( not ( = ?auto_51132 ?auto_51134 ) ) ( not ( = ?auto_51137 ?auto_51134 ) ) ( not ( = ?auto_51136 ?auto_51134 ) ) ( not ( = ?auto_51133 ?auto_51134 ) ) ( not ( = ?auto_51135 ?auto_51134 ) ) ( ON ?auto_51132 ?auto_51131 ) ( ON-TABLE ?auto_51134 ) ( ON ?auto_51137 ?auto_51132 ) ( CLEAR ?auto_51137 ) ( HOLDING ?auto_51135 ) ( CLEAR ?auto_51133 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_51136 ?auto_51133 ?auto_51135 )
      ( MAKE-2PILE ?auto_51131 ?auto_51132 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_51138 - BLOCK
      ?auto_51139 - BLOCK
    )
    :vars
    (
      ?auto_51143 - BLOCK
      ?auto_51144 - BLOCK
      ?auto_51140 - BLOCK
      ?auto_51142 - BLOCK
      ?auto_51141 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_51138 ?auto_51139 ) ) ( not ( = ?auto_51138 ?auto_51143 ) ) ( not ( = ?auto_51139 ?auto_51143 ) ) ( ON-TABLE ?auto_51144 ) ( ON ?auto_51140 ?auto_51144 ) ( not ( = ?auto_51144 ?auto_51140 ) ) ( not ( = ?auto_51144 ?auto_51142 ) ) ( not ( = ?auto_51144 ?auto_51143 ) ) ( not ( = ?auto_51144 ?auto_51139 ) ) ( not ( = ?auto_51144 ?auto_51138 ) ) ( not ( = ?auto_51140 ?auto_51142 ) ) ( not ( = ?auto_51140 ?auto_51143 ) ) ( not ( = ?auto_51140 ?auto_51139 ) ) ( not ( = ?auto_51140 ?auto_51138 ) ) ( not ( = ?auto_51142 ?auto_51143 ) ) ( not ( = ?auto_51142 ?auto_51139 ) ) ( not ( = ?auto_51142 ?auto_51138 ) ) ( ON ?auto_51138 ?auto_51141 ) ( not ( = ?auto_51138 ?auto_51141 ) ) ( not ( = ?auto_51139 ?auto_51141 ) ) ( not ( = ?auto_51143 ?auto_51141 ) ) ( not ( = ?auto_51144 ?auto_51141 ) ) ( not ( = ?auto_51140 ?auto_51141 ) ) ( not ( = ?auto_51142 ?auto_51141 ) ) ( ON ?auto_51139 ?auto_51138 ) ( ON-TABLE ?auto_51141 ) ( ON ?auto_51143 ?auto_51139 ) ( CLEAR ?auto_51140 ) ( ON ?auto_51142 ?auto_51143 ) ( CLEAR ?auto_51142 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_51141 ?auto_51138 ?auto_51139 ?auto_51143 )
      ( MAKE-2PILE ?auto_51138 ?auto_51139 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_51145 - BLOCK
      ?auto_51146 - BLOCK
    )
    :vars
    (
      ?auto_51149 - BLOCK
      ?auto_51150 - BLOCK
      ?auto_51148 - BLOCK
      ?auto_51147 - BLOCK
      ?auto_51151 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_51145 ?auto_51146 ) ) ( not ( = ?auto_51145 ?auto_51149 ) ) ( not ( = ?auto_51146 ?auto_51149 ) ) ( ON-TABLE ?auto_51150 ) ( not ( = ?auto_51150 ?auto_51148 ) ) ( not ( = ?auto_51150 ?auto_51147 ) ) ( not ( = ?auto_51150 ?auto_51149 ) ) ( not ( = ?auto_51150 ?auto_51146 ) ) ( not ( = ?auto_51150 ?auto_51145 ) ) ( not ( = ?auto_51148 ?auto_51147 ) ) ( not ( = ?auto_51148 ?auto_51149 ) ) ( not ( = ?auto_51148 ?auto_51146 ) ) ( not ( = ?auto_51148 ?auto_51145 ) ) ( not ( = ?auto_51147 ?auto_51149 ) ) ( not ( = ?auto_51147 ?auto_51146 ) ) ( not ( = ?auto_51147 ?auto_51145 ) ) ( ON ?auto_51145 ?auto_51151 ) ( not ( = ?auto_51145 ?auto_51151 ) ) ( not ( = ?auto_51146 ?auto_51151 ) ) ( not ( = ?auto_51149 ?auto_51151 ) ) ( not ( = ?auto_51150 ?auto_51151 ) ) ( not ( = ?auto_51148 ?auto_51151 ) ) ( not ( = ?auto_51147 ?auto_51151 ) ) ( ON ?auto_51146 ?auto_51145 ) ( ON-TABLE ?auto_51151 ) ( ON ?auto_51149 ?auto_51146 ) ( ON ?auto_51147 ?auto_51149 ) ( CLEAR ?auto_51147 ) ( HOLDING ?auto_51148 ) ( CLEAR ?auto_51150 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_51150 ?auto_51148 )
      ( MAKE-2PILE ?auto_51145 ?auto_51146 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_51152 - BLOCK
      ?auto_51153 - BLOCK
    )
    :vars
    (
      ?auto_51154 - BLOCK
      ?auto_51157 - BLOCK
      ?auto_51155 - BLOCK
      ?auto_51158 - BLOCK
      ?auto_51156 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_51152 ?auto_51153 ) ) ( not ( = ?auto_51152 ?auto_51154 ) ) ( not ( = ?auto_51153 ?auto_51154 ) ) ( ON-TABLE ?auto_51157 ) ( not ( = ?auto_51157 ?auto_51155 ) ) ( not ( = ?auto_51157 ?auto_51158 ) ) ( not ( = ?auto_51157 ?auto_51154 ) ) ( not ( = ?auto_51157 ?auto_51153 ) ) ( not ( = ?auto_51157 ?auto_51152 ) ) ( not ( = ?auto_51155 ?auto_51158 ) ) ( not ( = ?auto_51155 ?auto_51154 ) ) ( not ( = ?auto_51155 ?auto_51153 ) ) ( not ( = ?auto_51155 ?auto_51152 ) ) ( not ( = ?auto_51158 ?auto_51154 ) ) ( not ( = ?auto_51158 ?auto_51153 ) ) ( not ( = ?auto_51158 ?auto_51152 ) ) ( ON ?auto_51152 ?auto_51156 ) ( not ( = ?auto_51152 ?auto_51156 ) ) ( not ( = ?auto_51153 ?auto_51156 ) ) ( not ( = ?auto_51154 ?auto_51156 ) ) ( not ( = ?auto_51157 ?auto_51156 ) ) ( not ( = ?auto_51155 ?auto_51156 ) ) ( not ( = ?auto_51158 ?auto_51156 ) ) ( ON ?auto_51153 ?auto_51152 ) ( ON-TABLE ?auto_51156 ) ( ON ?auto_51154 ?auto_51153 ) ( ON ?auto_51158 ?auto_51154 ) ( CLEAR ?auto_51157 ) ( ON ?auto_51155 ?auto_51158 ) ( CLEAR ?auto_51155 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_51156 ?auto_51152 ?auto_51153 ?auto_51154 ?auto_51158 )
      ( MAKE-2PILE ?auto_51152 ?auto_51153 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_51159 - BLOCK
      ?auto_51160 - BLOCK
    )
    :vars
    (
      ?auto_51161 - BLOCK
      ?auto_51163 - BLOCK
      ?auto_51165 - BLOCK
      ?auto_51164 - BLOCK
      ?auto_51162 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_51159 ?auto_51160 ) ) ( not ( = ?auto_51159 ?auto_51161 ) ) ( not ( = ?auto_51160 ?auto_51161 ) ) ( not ( = ?auto_51163 ?auto_51165 ) ) ( not ( = ?auto_51163 ?auto_51164 ) ) ( not ( = ?auto_51163 ?auto_51161 ) ) ( not ( = ?auto_51163 ?auto_51160 ) ) ( not ( = ?auto_51163 ?auto_51159 ) ) ( not ( = ?auto_51165 ?auto_51164 ) ) ( not ( = ?auto_51165 ?auto_51161 ) ) ( not ( = ?auto_51165 ?auto_51160 ) ) ( not ( = ?auto_51165 ?auto_51159 ) ) ( not ( = ?auto_51164 ?auto_51161 ) ) ( not ( = ?auto_51164 ?auto_51160 ) ) ( not ( = ?auto_51164 ?auto_51159 ) ) ( ON ?auto_51159 ?auto_51162 ) ( not ( = ?auto_51159 ?auto_51162 ) ) ( not ( = ?auto_51160 ?auto_51162 ) ) ( not ( = ?auto_51161 ?auto_51162 ) ) ( not ( = ?auto_51163 ?auto_51162 ) ) ( not ( = ?auto_51165 ?auto_51162 ) ) ( not ( = ?auto_51164 ?auto_51162 ) ) ( ON ?auto_51160 ?auto_51159 ) ( ON-TABLE ?auto_51162 ) ( ON ?auto_51161 ?auto_51160 ) ( ON ?auto_51164 ?auto_51161 ) ( ON ?auto_51165 ?auto_51164 ) ( CLEAR ?auto_51165 ) ( HOLDING ?auto_51163 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_51163 )
      ( MAKE-2PILE ?auto_51159 ?auto_51160 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_51166 - BLOCK
      ?auto_51167 - BLOCK
    )
    :vars
    (
      ?auto_51168 - BLOCK
      ?auto_51169 - BLOCK
      ?auto_51170 - BLOCK
      ?auto_51171 - BLOCK
      ?auto_51172 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_51166 ?auto_51167 ) ) ( not ( = ?auto_51166 ?auto_51168 ) ) ( not ( = ?auto_51167 ?auto_51168 ) ) ( not ( = ?auto_51169 ?auto_51170 ) ) ( not ( = ?auto_51169 ?auto_51171 ) ) ( not ( = ?auto_51169 ?auto_51168 ) ) ( not ( = ?auto_51169 ?auto_51167 ) ) ( not ( = ?auto_51169 ?auto_51166 ) ) ( not ( = ?auto_51170 ?auto_51171 ) ) ( not ( = ?auto_51170 ?auto_51168 ) ) ( not ( = ?auto_51170 ?auto_51167 ) ) ( not ( = ?auto_51170 ?auto_51166 ) ) ( not ( = ?auto_51171 ?auto_51168 ) ) ( not ( = ?auto_51171 ?auto_51167 ) ) ( not ( = ?auto_51171 ?auto_51166 ) ) ( ON ?auto_51166 ?auto_51172 ) ( not ( = ?auto_51166 ?auto_51172 ) ) ( not ( = ?auto_51167 ?auto_51172 ) ) ( not ( = ?auto_51168 ?auto_51172 ) ) ( not ( = ?auto_51169 ?auto_51172 ) ) ( not ( = ?auto_51170 ?auto_51172 ) ) ( not ( = ?auto_51171 ?auto_51172 ) ) ( ON ?auto_51167 ?auto_51166 ) ( ON-TABLE ?auto_51172 ) ( ON ?auto_51168 ?auto_51167 ) ( ON ?auto_51171 ?auto_51168 ) ( ON ?auto_51170 ?auto_51171 ) ( ON ?auto_51169 ?auto_51170 ) ( CLEAR ?auto_51169 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_51172 ?auto_51166 ?auto_51167 ?auto_51168 ?auto_51171 ?auto_51170 )
      ( MAKE-2PILE ?auto_51166 ?auto_51167 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_51176 - BLOCK
      ?auto_51177 - BLOCK
      ?auto_51178 - BLOCK
    )
    :vars
    (
      ?auto_51179 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_51179 ?auto_51178 ) ( CLEAR ?auto_51179 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_51176 ) ( ON ?auto_51177 ?auto_51176 ) ( ON ?auto_51178 ?auto_51177 ) ( not ( = ?auto_51176 ?auto_51177 ) ) ( not ( = ?auto_51176 ?auto_51178 ) ) ( not ( = ?auto_51176 ?auto_51179 ) ) ( not ( = ?auto_51177 ?auto_51178 ) ) ( not ( = ?auto_51177 ?auto_51179 ) ) ( not ( = ?auto_51178 ?auto_51179 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_51179 ?auto_51178 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_51180 - BLOCK
      ?auto_51181 - BLOCK
      ?auto_51182 - BLOCK
    )
    :vars
    (
      ?auto_51183 - BLOCK
      ?auto_51184 - BLOCK
      ?auto_51185 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_51183 ?auto_51182 ) ( CLEAR ?auto_51183 ) ( ON-TABLE ?auto_51180 ) ( ON ?auto_51181 ?auto_51180 ) ( ON ?auto_51182 ?auto_51181 ) ( not ( = ?auto_51180 ?auto_51181 ) ) ( not ( = ?auto_51180 ?auto_51182 ) ) ( not ( = ?auto_51180 ?auto_51183 ) ) ( not ( = ?auto_51181 ?auto_51182 ) ) ( not ( = ?auto_51181 ?auto_51183 ) ) ( not ( = ?auto_51182 ?auto_51183 ) ) ( HOLDING ?auto_51184 ) ( CLEAR ?auto_51185 ) ( not ( = ?auto_51180 ?auto_51184 ) ) ( not ( = ?auto_51180 ?auto_51185 ) ) ( not ( = ?auto_51181 ?auto_51184 ) ) ( not ( = ?auto_51181 ?auto_51185 ) ) ( not ( = ?auto_51182 ?auto_51184 ) ) ( not ( = ?auto_51182 ?auto_51185 ) ) ( not ( = ?auto_51183 ?auto_51184 ) ) ( not ( = ?auto_51183 ?auto_51185 ) ) ( not ( = ?auto_51184 ?auto_51185 ) ) )
    :subtasks
    ( ( !STACK ?auto_51184 ?auto_51185 )
      ( MAKE-3PILE ?auto_51180 ?auto_51181 ?auto_51182 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_51186 - BLOCK
      ?auto_51187 - BLOCK
      ?auto_51188 - BLOCK
    )
    :vars
    (
      ?auto_51191 - BLOCK
      ?auto_51189 - BLOCK
      ?auto_51190 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_51191 ?auto_51188 ) ( ON-TABLE ?auto_51186 ) ( ON ?auto_51187 ?auto_51186 ) ( ON ?auto_51188 ?auto_51187 ) ( not ( = ?auto_51186 ?auto_51187 ) ) ( not ( = ?auto_51186 ?auto_51188 ) ) ( not ( = ?auto_51186 ?auto_51191 ) ) ( not ( = ?auto_51187 ?auto_51188 ) ) ( not ( = ?auto_51187 ?auto_51191 ) ) ( not ( = ?auto_51188 ?auto_51191 ) ) ( CLEAR ?auto_51189 ) ( not ( = ?auto_51186 ?auto_51190 ) ) ( not ( = ?auto_51186 ?auto_51189 ) ) ( not ( = ?auto_51187 ?auto_51190 ) ) ( not ( = ?auto_51187 ?auto_51189 ) ) ( not ( = ?auto_51188 ?auto_51190 ) ) ( not ( = ?auto_51188 ?auto_51189 ) ) ( not ( = ?auto_51191 ?auto_51190 ) ) ( not ( = ?auto_51191 ?auto_51189 ) ) ( not ( = ?auto_51190 ?auto_51189 ) ) ( ON ?auto_51190 ?auto_51191 ) ( CLEAR ?auto_51190 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_51186 ?auto_51187 ?auto_51188 ?auto_51191 )
      ( MAKE-3PILE ?auto_51186 ?auto_51187 ?auto_51188 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_51192 - BLOCK
      ?auto_51193 - BLOCK
      ?auto_51194 - BLOCK
    )
    :vars
    (
      ?auto_51197 - BLOCK
      ?auto_51196 - BLOCK
      ?auto_51195 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_51197 ?auto_51194 ) ( ON-TABLE ?auto_51192 ) ( ON ?auto_51193 ?auto_51192 ) ( ON ?auto_51194 ?auto_51193 ) ( not ( = ?auto_51192 ?auto_51193 ) ) ( not ( = ?auto_51192 ?auto_51194 ) ) ( not ( = ?auto_51192 ?auto_51197 ) ) ( not ( = ?auto_51193 ?auto_51194 ) ) ( not ( = ?auto_51193 ?auto_51197 ) ) ( not ( = ?auto_51194 ?auto_51197 ) ) ( not ( = ?auto_51192 ?auto_51196 ) ) ( not ( = ?auto_51192 ?auto_51195 ) ) ( not ( = ?auto_51193 ?auto_51196 ) ) ( not ( = ?auto_51193 ?auto_51195 ) ) ( not ( = ?auto_51194 ?auto_51196 ) ) ( not ( = ?auto_51194 ?auto_51195 ) ) ( not ( = ?auto_51197 ?auto_51196 ) ) ( not ( = ?auto_51197 ?auto_51195 ) ) ( not ( = ?auto_51196 ?auto_51195 ) ) ( ON ?auto_51196 ?auto_51197 ) ( CLEAR ?auto_51196 ) ( HOLDING ?auto_51195 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_51195 )
      ( MAKE-3PILE ?auto_51192 ?auto_51193 ?auto_51194 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_51198 - BLOCK
      ?auto_51199 - BLOCK
      ?auto_51200 - BLOCK
    )
    :vars
    (
      ?auto_51202 - BLOCK
      ?auto_51201 - BLOCK
      ?auto_51203 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_51202 ?auto_51200 ) ( ON-TABLE ?auto_51198 ) ( ON ?auto_51199 ?auto_51198 ) ( ON ?auto_51200 ?auto_51199 ) ( not ( = ?auto_51198 ?auto_51199 ) ) ( not ( = ?auto_51198 ?auto_51200 ) ) ( not ( = ?auto_51198 ?auto_51202 ) ) ( not ( = ?auto_51199 ?auto_51200 ) ) ( not ( = ?auto_51199 ?auto_51202 ) ) ( not ( = ?auto_51200 ?auto_51202 ) ) ( not ( = ?auto_51198 ?auto_51201 ) ) ( not ( = ?auto_51198 ?auto_51203 ) ) ( not ( = ?auto_51199 ?auto_51201 ) ) ( not ( = ?auto_51199 ?auto_51203 ) ) ( not ( = ?auto_51200 ?auto_51201 ) ) ( not ( = ?auto_51200 ?auto_51203 ) ) ( not ( = ?auto_51202 ?auto_51201 ) ) ( not ( = ?auto_51202 ?auto_51203 ) ) ( not ( = ?auto_51201 ?auto_51203 ) ) ( ON ?auto_51201 ?auto_51202 ) ( ON ?auto_51203 ?auto_51201 ) ( CLEAR ?auto_51203 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_51198 ?auto_51199 ?auto_51200 ?auto_51202 ?auto_51201 )
      ( MAKE-3PILE ?auto_51198 ?auto_51199 ?auto_51200 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_51204 - BLOCK
      ?auto_51205 - BLOCK
      ?auto_51206 - BLOCK
    )
    :vars
    (
      ?auto_51208 - BLOCK
      ?auto_51209 - BLOCK
      ?auto_51207 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_51208 ?auto_51206 ) ( ON-TABLE ?auto_51204 ) ( ON ?auto_51205 ?auto_51204 ) ( ON ?auto_51206 ?auto_51205 ) ( not ( = ?auto_51204 ?auto_51205 ) ) ( not ( = ?auto_51204 ?auto_51206 ) ) ( not ( = ?auto_51204 ?auto_51208 ) ) ( not ( = ?auto_51205 ?auto_51206 ) ) ( not ( = ?auto_51205 ?auto_51208 ) ) ( not ( = ?auto_51206 ?auto_51208 ) ) ( not ( = ?auto_51204 ?auto_51209 ) ) ( not ( = ?auto_51204 ?auto_51207 ) ) ( not ( = ?auto_51205 ?auto_51209 ) ) ( not ( = ?auto_51205 ?auto_51207 ) ) ( not ( = ?auto_51206 ?auto_51209 ) ) ( not ( = ?auto_51206 ?auto_51207 ) ) ( not ( = ?auto_51208 ?auto_51209 ) ) ( not ( = ?auto_51208 ?auto_51207 ) ) ( not ( = ?auto_51209 ?auto_51207 ) ) ( ON ?auto_51209 ?auto_51208 ) ( HOLDING ?auto_51207 ) ( CLEAR ?auto_51209 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_51204 ?auto_51205 ?auto_51206 ?auto_51208 ?auto_51209 ?auto_51207 )
      ( MAKE-3PILE ?auto_51204 ?auto_51205 ?auto_51206 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_51210 - BLOCK
      ?auto_51211 - BLOCK
      ?auto_51212 - BLOCK
    )
    :vars
    (
      ?auto_51213 - BLOCK
      ?auto_51214 - BLOCK
      ?auto_51215 - BLOCK
      ?auto_51216 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_51213 ?auto_51212 ) ( ON-TABLE ?auto_51210 ) ( ON ?auto_51211 ?auto_51210 ) ( ON ?auto_51212 ?auto_51211 ) ( not ( = ?auto_51210 ?auto_51211 ) ) ( not ( = ?auto_51210 ?auto_51212 ) ) ( not ( = ?auto_51210 ?auto_51213 ) ) ( not ( = ?auto_51211 ?auto_51212 ) ) ( not ( = ?auto_51211 ?auto_51213 ) ) ( not ( = ?auto_51212 ?auto_51213 ) ) ( not ( = ?auto_51210 ?auto_51214 ) ) ( not ( = ?auto_51210 ?auto_51215 ) ) ( not ( = ?auto_51211 ?auto_51214 ) ) ( not ( = ?auto_51211 ?auto_51215 ) ) ( not ( = ?auto_51212 ?auto_51214 ) ) ( not ( = ?auto_51212 ?auto_51215 ) ) ( not ( = ?auto_51213 ?auto_51214 ) ) ( not ( = ?auto_51213 ?auto_51215 ) ) ( not ( = ?auto_51214 ?auto_51215 ) ) ( ON ?auto_51214 ?auto_51213 ) ( CLEAR ?auto_51214 ) ( ON ?auto_51215 ?auto_51216 ) ( CLEAR ?auto_51215 ) ( HAND-EMPTY ) ( not ( = ?auto_51210 ?auto_51216 ) ) ( not ( = ?auto_51211 ?auto_51216 ) ) ( not ( = ?auto_51212 ?auto_51216 ) ) ( not ( = ?auto_51213 ?auto_51216 ) ) ( not ( = ?auto_51214 ?auto_51216 ) ) ( not ( = ?auto_51215 ?auto_51216 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_51215 ?auto_51216 )
      ( MAKE-3PILE ?auto_51210 ?auto_51211 ?auto_51212 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_51217 - BLOCK
      ?auto_51218 - BLOCK
      ?auto_51219 - BLOCK
    )
    :vars
    (
      ?auto_51222 - BLOCK
      ?auto_51223 - BLOCK
      ?auto_51220 - BLOCK
      ?auto_51221 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_51222 ?auto_51219 ) ( ON-TABLE ?auto_51217 ) ( ON ?auto_51218 ?auto_51217 ) ( ON ?auto_51219 ?auto_51218 ) ( not ( = ?auto_51217 ?auto_51218 ) ) ( not ( = ?auto_51217 ?auto_51219 ) ) ( not ( = ?auto_51217 ?auto_51222 ) ) ( not ( = ?auto_51218 ?auto_51219 ) ) ( not ( = ?auto_51218 ?auto_51222 ) ) ( not ( = ?auto_51219 ?auto_51222 ) ) ( not ( = ?auto_51217 ?auto_51223 ) ) ( not ( = ?auto_51217 ?auto_51220 ) ) ( not ( = ?auto_51218 ?auto_51223 ) ) ( not ( = ?auto_51218 ?auto_51220 ) ) ( not ( = ?auto_51219 ?auto_51223 ) ) ( not ( = ?auto_51219 ?auto_51220 ) ) ( not ( = ?auto_51222 ?auto_51223 ) ) ( not ( = ?auto_51222 ?auto_51220 ) ) ( not ( = ?auto_51223 ?auto_51220 ) ) ( ON ?auto_51220 ?auto_51221 ) ( CLEAR ?auto_51220 ) ( not ( = ?auto_51217 ?auto_51221 ) ) ( not ( = ?auto_51218 ?auto_51221 ) ) ( not ( = ?auto_51219 ?auto_51221 ) ) ( not ( = ?auto_51222 ?auto_51221 ) ) ( not ( = ?auto_51223 ?auto_51221 ) ) ( not ( = ?auto_51220 ?auto_51221 ) ) ( HOLDING ?auto_51223 ) ( CLEAR ?auto_51222 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_51217 ?auto_51218 ?auto_51219 ?auto_51222 ?auto_51223 )
      ( MAKE-3PILE ?auto_51217 ?auto_51218 ?auto_51219 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_51224 - BLOCK
      ?auto_51225 - BLOCK
      ?auto_51226 - BLOCK
    )
    :vars
    (
      ?auto_51227 - BLOCK
      ?auto_51228 - BLOCK
      ?auto_51229 - BLOCK
      ?auto_51230 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_51227 ?auto_51226 ) ( ON-TABLE ?auto_51224 ) ( ON ?auto_51225 ?auto_51224 ) ( ON ?auto_51226 ?auto_51225 ) ( not ( = ?auto_51224 ?auto_51225 ) ) ( not ( = ?auto_51224 ?auto_51226 ) ) ( not ( = ?auto_51224 ?auto_51227 ) ) ( not ( = ?auto_51225 ?auto_51226 ) ) ( not ( = ?auto_51225 ?auto_51227 ) ) ( not ( = ?auto_51226 ?auto_51227 ) ) ( not ( = ?auto_51224 ?auto_51228 ) ) ( not ( = ?auto_51224 ?auto_51229 ) ) ( not ( = ?auto_51225 ?auto_51228 ) ) ( not ( = ?auto_51225 ?auto_51229 ) ) ( not ( = ?auto_51226 ?auto_51228 ) ) ( not ( = ?auto_51226 ?auto_51229 ) ) ( not ( = ?auto_51227 ?auto_51228 ) ) ( not ( = ?auto_51227 ?auto_51229 ) ) ( not ( = ?auto_51228 ?auto_51229 ) ) ( ON ?auto_51229 ?auto_51230 ) ( not ( = ?auto_51224 ?auto_51230 ) ) ( not ( = ?auto_51225 ?auto_51230 ) ) ( not ( = ?auto_51226 ?auto_51230 ) ) ( not ( = ?auto_51227 ?auto_51230 ) ) ( not ( = ?auto_51228 ?auto_51230 ) ) ( not ( = ?auto_51229 ?auto_51230 ) ) ( CLEAR ?auto_51227 ) ( ON ?auto_51228 ?auto_51229 ) ( CLEAR ?auto_51228 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_51230 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_51230 ?auto_51229 )
      ( MAKE-3PILE ?auto_51224 ?auto_51225 ?auto_51226 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_51245 - BLOCK
      ?auto_51246 - BLOCK
      ?auto_51247 - BLOCK
    )
    :vars
    (
      ?auto_51250 - BLOCK
      ?auto_51251 - BLOCK
      ?auto_51249 - BLOCK
      ?auto_51248 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_51245 ) ( ON ?auto_51246 ?auto_51245 ) ( not ( = ?auto_51245 ?auto_51246 ) ) ( not ( = ?auto_51245 ?auto_51247 ) ) ( not ( = ?auto_51245 ?auto_51250 ) ) ( not ( = ?auto_51246 ?auto_51247 ) ) ( not ( = ?auto_51246 ?auto_51250 ) ) ( not ( = ?auto_51247 ?auto_51250 ) ) ( not ( = ?auto_51245 ?auto_51251 ) ) ( not ( = ?auto_51245 ?auto_51249 ) ) ( not ( = ?auto_51246 ?auto_51251 ) ) ( not ( = ?auto_51246 ?auto_51249 ) ) ( not ( = ?auto_51247 ?auto_51251 ) ) ( not ( = ?auto_51247 ?auto_51249 ) ) ( not ( = ?auto_51250 ?auto_51251 ) ) ( not ( = ?auto_51250 ?auto_51249 ) ) ( not ( = ?auto_51251 ?auto_51249 ) ) ( ON ?auto_51249 ?auto_51248 ) ( not ( = ?auto_51245 ?auto_51248 ) ) ( not ( = ?auto_51246 ?auto_51248 ) ) ( not ( = ?auto_51247 ?auto_51248 ) ) ( not ( = ?auto_51250 ?auto_51248 ) ) ( not ( = ?auto_51251 ?auto_51248 ) ) ( not ( = ?auto_51249 ?auto_51248 ) ) ( ON ?auto_51251 ?auto_51249 ) ( ON-TABLE ?auto_51248 ) ( ON ?auto_51250 ?auto_51251 ) ( CLEAR ?auto_51250 ) ( HOLDING ?auto_51247 ) ( CLEAR ?auto_51246 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_51245 ?auto_51246 ?auto_51247 ?auto_51250 )
      ( MAKE-3PILE ?auto_51245 ?auto_51246 ?auto_51247 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_51252 - BLOCK
      ?auto_51253 - BLOCK
      ?auto_51254 - BLOCK
    )
    :vars
    (
      ?auto_51255 - BLOCK
      ?auto_51256 - BLOCK
      ?auto_51258 - BLOCK
      ?auto_51257 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_51252 ) ( ON ?auto_51253 ?auto_51252 ) ( not ( = ?auto_51252 ?auto_51253 ) ) ( not ( = ?auto_51252 ?auto_51254 ) ) ( not ( = ?auto_51252 ?auto_51255 ) ) ( not ( = ?auto_51253 ?auto_51254 ) ) ( not ( = ?auto_51253 ?auto_51255 ) ) ( not ( = ?auto_51254 ?auto_51255 ) ) ( not ( = ?auto_51252 ?auto_51256 ) ) ( not ( = ?auto_51252 ?auto_51258 ) ) ( not ( = ?auto_51253 ?auto_51256 ) ) ( not ( = ?auto_51253 ?auto_51258 ) ) ( not ( = ?auto_51254 ?auto_51256 ) ) ( not ( = ?auto_51254 ?auto_51258 ) ) ( not ( = ?auto_51255 ?auto_51256 ) ) ( not ( = ?auto_51255 ?auto_51258 ) ) ( not ( = ?auto_51256 ?auto_51258 ) ) ( ON ?auto_51258 ?auto_51257 ) ( not ( = ?auto_51252 ?auto_51257 ) ) ( not ( = ?auto_51253 ?auto_51257 ) ) ( not ( = ?auto_51254 ?auto_51257 ) ) ( not ( = ?auto_51255 ?auto_51257 ) ) ( not ( = ?auto_51256 ?auto_51257 ) ) ( not ( = ?auto_51258 ?auto_51257 ) ) ( ON ?auto_51256 ?auto_51258 ) ( ON-TABLE ?auto_51257 ) ( ON ?auto_51255 ?auto_51256 ) ( CLEAR ?auto_51253 ) ( ON ?auto_51254 ?auto_51255 ) ( CLEAR ?auto_51254 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_51257 ?auto_51258 ?auto_51256 ?auto_51255 )
      ( MAKE-3PILE ?auto_51252 ?auto_51253 ?auto_51254 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_51259 - BLOCK
      ?auto_51260 - BLOCK
      ?auto_51261 - BLOCK
    )
    :vars
    (
      ?auto_51262 - BLOCK
      ?auto_51263 - BLOCK
      ?auto_51265 - BLOCK
      ?auto_51264 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_51259 ) ( not ( = ?auto_51259 ?auto_51260 ) ) ( not ( = ?auto_51259 ?auto_51261 ) ) ( not ( = ?auto_51259 ?auto_51262 ) ) ( not ( = ?auto_51260 ?auto_51261 ) ) ( not ( = ?auto_51260 ?auto_51262 ) ) ( not ( = ?auto_51261 ?auto_51262 ) ) ( not ( = ?auto_51259 ?auto_51263 ) ) ( not ( = ?auto_51259 ?auto_51265 ) ) ( not ( = ?auto_51260 ?auto_51263 ) ) ( not ( = ?auto_51260 ?auto_51265 ) ) ( not ( = ?auto_51261 ?auto_51263 ) ) ( not ( = ?auto_51261 ?auto_51265 ) ) ( not ( = ?auto_51262 ?auto_51263 ) ) ( not ( = ?auto_51262 ?auto_51265 ) ) ( not ( = ?auto_51263 ?auto_51265 ) ) ( ON ?auto_51265 ?auto_51264 ) ( not ( = ?auto_51259 ?auto_51264 ) ) ( not ( = ?auto_51260 ?auto_51264 ) ) ( not ( = ?auto_51261 ?auto_51264 ) ) ( not ( = ?auto_51262 ?auto_51264 ) ) ( not ( = ?auto_51263 ?auto_51264 ) ) ( not ( = ?auto_51265 ?auto_51264 ) ) ( ON ?auto_51263 ?auto_51265 ) ( ON-TABLE ?auto_51264 ) ( ON ?auto_51262 ?auto_51263 ) ( ON ?auto_51261 ?auto_51262 ) ( CLEAR ?auto_51261 ) ( HOLDING ?auto_51260 ) ( CLEAR ?auto_51259 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_51259 ?auto_51260 )
      ( MAKE-3PILE ?auto_51259 ?auto_51260 ?auto_51261 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_51266 - BLOCK
      ?auto_51267 - BLOCK
      ?auto_51268 - BLOCK
    )
    :vars
    (
      ?auto_51272 - BLOCK
      ?auto_51270 - BLOCK
      ?auto_51271 - BLOCK
      ?auto_51269 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_51266 ) ( not ( = ?auto_51266 ?auto_51267 ) ) ( not ( = ?auto_51266 ?auto_51268 ) ) ( not ( = ?auto_51266 ?auto_51272 ) ) ( not ( = ?auto_51267 ?auto_51268 ) ) ( not ( = ?auto_51267 ?auto_51272 ) ) ( not ( = ?auto_51268 ?auto_51272 ) ) ( not ( = ?auto_51266 ?auto_51270 ) ) ( not ( = ?auto_51266 ?auto_51271 ) ) ( not ( = ?auto_51267 ?auto_51270 ) ) ( not ( = ?auto_51267 ?auto_51271 ) ) ( not ( = ?auto_51268 ?auto_51270 ) ) ( not ( = ?auto_51268 ?auto_51271 ) ) ( not ( = ?auto_51272 ?auto_51270 ) ) ( not ( = ?auto_51272 ?auto_51271 ) ) ( not ( = ?auto_51270 ?auto_51271 ) ) ( ON ?auto_51271 ?auto_51269 ) ( not ( = ?auto_51266 ?auto_51269 ) ) ( not ( = ?auto_51267 ?auto_51269 ) ) ( not ( = ?auto_51268 ?auto_51269 ) ) ( not ( = ?auto_51272 ?auto_51269 ) ) ( not ( = ?auto_51270 ?auto_51269 ) ) ( not ( = ?auto_51271 ?auto_51269 ) ) ( ON ?auto_51270 ?auto_51271 ) ( ON-TABLE ?auto_51269 ) ( ON ?auto_51272 ?auto_51270 ) ( ON ?auto_51268 ?auto_51272 ) ( CLEAR ?auto_51266 ) ( ON ?auto_51267 ?auto_51268 ) ( CLEAR ?auto_51267 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_51269 ?auto_51271 ?auto_51270 ?auto_51272 ?auto_51268 )
      ( MAKE-3PILE ?auto_51266 ?auto_51267 ?auto_51268 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_51273 - BLOCK
      ?auto_51274 - BLOCK
      ?auto_51275 - BLOCK
    )
    :vars
    (
      ?auto_51277 - BLOCK
      ?auto_51276 - BLOCK
      ?auto_51278 - BLOCK
      ?auto_51279 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_51273 ?auto_51274 ) ) ( not ( = ?auto_51273 ?auto_51275 ) ) ( not ( = ?auto_51273 ?auto_51277 ) ) ( not ( = ?auto_51274 ?auto_51275 ) ) ( not ( = ?auto_51274 ?auto_51277 ) ) ( not ( = ?auto_51275 ?auto_51277 ) ) ( not ( = ?auto_51273 ?auto_51276 ) ) ( not ( = ?auto_51273 ?auto_51278 ) ) ( not ( = ?auto_51274 ?auto_51276 ) ) ( not ( = ?auto_51274 ?auto_51278 ) ) ( not ( = ?auto_51275 ?auto_51276 ) ) ( not ( = ?auto_51275 ?auto_51278 ) ) ( not ( = ?auto_51277 ?auto_51276 ) ) ( not ( = ?auto_51277 ?auto_51278 ) ) ( not ( = ?auto_51276 ?auto_51278 ) ) ( ON ?auto_51278 ?auto_51279 ) ( not ( = ?auto_51273 ?auto_51279 ) ) ( not ( = ?auto_51274 ?auto_51279 ) ) ( not ( = ?auto_51275 ?auto_51279 ) ) ( not ( = ?auto_51277 ?auto_51279 ) ) ( not ( = ?auto_51276 ?auto_51279 ) ) ( not ( = ?auto_51278 ?auto_51279 ) ) ( ON ?auto_51276 ?auto_51278 ) ( ON-TABLE ?auto_51279 ) ( ON ?auto_51277 ?auto_51276 ) ( ON ?auto_51275 ?auto_51277 ) ( ON ?auto_51274 ?auto_51275 ) ( CLEAR ?auto_51274 ) ( HOLDING ?auto_51273 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_51273 )
      ( MAKE-3PILE ?auto_51273 ?auto_51274 ?auto_51275 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_51280 - BLOCK
      ?auto_51281 - BLOCK
      ?auto_51282 - BLOCK
    )
    :vars
    (
      ?auto_51285 - BLOCK
      ?auto_51284 - BLOCK
      ?auto_51283 - BLOCK
      ?auto_51286 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_51280 ?auto_51281 ) ) ( not ( = ?auto_51280 ?auto_51282 ) ) ( not ( = ?auto_51280 ?auto_51285 ) ) ( not ( = ?auto_51281 ?auto_51282 ) ) ( not ( = ?auto_51281 ?auto_51285 ) ) ( not ( = ?auto_51282 ?auto_51285 ) ) ( not ( = ?auto_51280 ?auto_51284 ) ) ( not ( = ?auto_51280 ?auto_51283 ) ) ( not ( = ?auto_51281 ?auto_51284 ) ) ( not ( = ?auto_51281 ?auto_51283 ) ) ( not ( = ?auto_51282 ?auto_51284 ) ) ( not ( = ?auto_51282 ?auto_51283 ) ) ( not ( = ?auto_51285 ?auto_51284 ) ) ( not ( = ?auto_51285 ?auto_51283 ) ) ( not ( = ?auto_51284 ?auto_51283 ) ) ( ON ?auto_51283 ?auto_51286 ) ( not ( = ?auto_51280 ?auto_51286 ) ) ( not ( = ?auto_51281 ?auto_51286 ) ) ( not ( = ?auto_51282 ?auto_51286 ) ) ( not ( = ?auto_51285 ?auto_51286 ) ) ( not ( = ?auto_51284 ?auto_51286 ) ) ( not ( = ?auto_51283 ?auto_51286 ) ) ( ON ?auto_51284 ?auto_51283 ) ( ON-TABLE ?auto_51286 ) ( ON ?auto_51285 ?auto_51284 ) ( ON ?auto_51282 ?auto_51285 ) ( ON ?auto_51281 ?auto_51282 ) ( ON ?auto_51280 ?auto_51281 ) ( CLEAR ?auto_51280 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_51286 ?auto_51283 ?auto_51284 ?auto_51285 ?auto_51282 ?auto_51281 )
      ( MAKE-3PILE ?auto_51280 ?auto_51281 ?auto_51282 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_51290 - BLOCK
      ?auto_51291 - BLOCK
      ?auto_51292 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_51292 ) ( CLEAR ?auto_51291 ) ( ON-TABLE ?auto_51290 ) ( ON ?auto_51291 ?auto_51290 ) ( not ( = ?auto_51290 ?auto_51291 ) ) ( not ( = ?auto_51290 ?auto_51292 ) ) ( not ( = ?auto_51291 ?auto_51292 ) ) )
    :subtasks
    ( ( !STACK ?auto_51292 ?auto_51291 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_51293 - BLOCK
      ?auto_51294 - BLOCK
      ?auto_51295 - BLOCK
    )
    :vars
    (
      ?auto_51296 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_51294 ) ( ON-TABLE ?auto_51293 ) ( ON ?auto_51294 ?auto_51293 ) ( not ( = ?auto_51293 ?auto_51294 ) ) ( not ( = ?auto_51293 ?auto_51295 ) ) ( not ( = ?auto_51294 ?auto_51295 ) ) ( ON ?auto_51295 ?auto_51296 ) ( CLEAR ?auto_51295 ) ( HAND-EMPTY ) ( not ( = ?auto_51293 ?auto_51296 ) ) ( not ( = ?auto_51294 ?auto_51296 ) ) ( not ( = ?auto_51295 ?auto_51296 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_51295 ?auto_51296 )
      ( MAKE-3PILE ?auto_51293 ?auto_51294 ?auto_51295 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_51297 - BLOCK
      ?auto_51298 - BLOCK
      ?auto_51299 - BLOCK
    )
    :vars
    (
      ?auto_51300 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_51297 ) ( not ( = ?auto_51297 ?auto_51298 ) ) ( not ( = ?auto_51297 ?auto_51299 ) ) ( not ( = ?auto_51298 ?auto_51299 ) ) ( ON ?auto_51299 ?auto_51300 ) ( CLEAR ?auto_51299 ) ( not ( = ?auto_51297 ?auto_51300 ) ) ( not ( = ?auto_51298 ?auto_51300 ) ) ( not ( = ?auto_51299 ?auto_51300 ) ) ( HOLDING ?auto_51298 ) ( CLEAR ?auto_51297 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_51297 ?auto_51298 )
      ( MAKE-3PILE ?auto_51297 ?auto_51298 ?auto_51299 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_51301 - BLOCK
      ?auto_51302 - BLOCK
      ?auto_51303 - BLOCK
    )
    :vars
    (
      ?auto_51304 - BLOCK
      ?auto_51305 - BLOCK
      ?auto_51306 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_51301 ) ( not ( = ?auto_51301 ?auto_51302 ) ) ( not ( = ?auto_51301 ?auto_51303 ) ) ( not ( = ?auto_51302 ?auto_51303 ) ) ( ON ?auto_51303 ?auto_51304 ) ( not ( = ?auto_51301 ?auto_51304 ) ) ( not ( = ?auto_51302 ?auto_51304 ) ) ( not ( = ?auto_51303 ?auto_51304 ) ) ( CLEAR ?auto_51301 ) ( ON ?auto_51302 ?auto_51303 ) ( CLEAR ?auto_51302 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_51305 ) ( ON ?auto_51306 ?auto_51305 ) ( ON ?auto_51304 ?auto_51306 ) ( not ( = ?auto_51305 ?auto_51306 ) ) ( not ( = ?auto_51305 ?auto_51304 ) ) ( not ( = ?auto_51305 ?auto_51303 ) ) ( not ( = ?auto_51305 ?auto_51302 ) ) ( not ( = ?auto_51306 ?auto_51304 ) ) ( not ( = ?auto_51306 ?auto_51303 ) ) ( not ( = ?auto_51306 ?auto_51302 ) ) ( not ( = ?auto_51301 ?auto_51305 ) ) ( not ( = ?auto_51301 ?auto_51306 ) ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_51305 ?auto_51306 ?auto_51304 ?auto_51303 )
      ( MAKE-3PILE ?auto_51301 ?auto_51302 ?auto_51303 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_51307 - BLOCK
      ?auto_51308 - BLOCK
      ?auto_51309 - BLOCK
    )
    :vars
    (
      ?auto_51311 - BLOCK
      ?auto_51312 - BLOCK
      ?auto_51310 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_51307 ?auto_51308 ) ) ( not ( = ?auto_51307 ?auto_51309 ) ) ( not ( = ?auto_51308 ?auto_51309 ) ) ( ON ?auto_51309 ?auto_51311 ) ( not ( = ?auto_51307 ?auto_51311 ) ) ( not ( = ?auto_51308 ?auto_51311 ) ) ( not ( = ?auto_51309 ?auto_51311 ) ) ( ON ?auto_51308 ?auto_51309 ) ( CLEAR ?auto_51308 ) ( ON-TABLE ?auto_51312 ) ( ON ?auto_51310 ?auto_51312 ) ( ON ?auto_51311 ?auto_51310 ) ( not ( = ?auto_51312 ?auto_51310 ) ) ( not ( = ?auto_51312 ?auto_51311 ) ) ( not ( = ?auto_51312 ?auto_51309 ) ) ( not ( = ?auto_51312 ?auto_51308 ) ) ( not ( = ?auto_51310 ?auto_51311 ) ) ( not ( = ?auto_51310 ?auto_51309 ) ) ( not ( = ?auto_51310 ?auto_51308 ) ) ( not ( = ?auto_51307 ?auto_51312 ) ) ( not ( = ?auto_51307 ?auto_51310 ) ) ( HOLDING ?auto_51307 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_51307 )
      ( MAKE-3PILE ?auto_51307 ?auto_51308 ?auto_51309 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_51313 - BLOCK
      ?auto_51314 - BLOCK
      ?auto_51315 - BLOCK
    )
    :vars
    (
      ?auto_51318 - BLOCK
      ?auto_51317 - BLOCK
      ?auto_51316 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_51313 ?auto_51314 ) ) ( not ( = ?auto_51313 ?auto_51315 ) ) ( not ( = ?auto_51314 ?auto_51315 ) ) ( ON ?auto_51315 ?auto_51318 ) ( not ( = ?auto_51313 ?auto_51318 ) ) ( not ( = ?auto_51314 ?auto_51318 ) ) ( not ( = ?auto_51315 ?auto_51318 ) ) ( ON ?auto_51314 ?auto_51315 ) ( ON-TABLE ?auto_51317 ) ( ON ?auto_51316 ?auto_51317 ) ( ON ?auto_51318 ?auto_51316 ) ( not ( = ?auto_51317 ?auto_51316 ) ) ( not ( = ?auto_51317 ?auto_51318 ) ) ( not ( = ?auto_51317 ?auto_51315 ) ) ( not ( = ?auto_51317 ?auto_51314 ) ) ( not ( = ?auto_51316 ?auto_51318 ) ) ( not ( = ?auto_51316 ?auto_51315 ) ) ( not ( = ?auto_51316 ?auto_51314 ) ) ( not ( = ?auto_51313 ?auto_51317 ) ) ( not ( = ?auto_51313 ?auto_51316 ) ) ( ON ?auto_51313 ?auto_51314 ) ( CLEAR ?auto_51313 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_51317 ?auto_51316 ?auto_51318 ?auto_51315 ?auto_51314 )
      ( MAKE-3PILE ?auto_51313 ?auto_51314 ?auto_51315 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_51319 - BLOCK
      ?auto_51320 - BLOCK
      ?auto_51321 - BLOCK
    )
    :vars
    (
      ?auto_51322 - BLOCK
      ?auto_51324 - BLOCK
      ?auto_51323 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_51319 ?auto_51320 ) ) ( not ( = ?auto_51319 ?auto_51321 ) ) ( not ( = ?auto_51320 ?auto_51321 ) ) ( ON ?auto_51321 ?auto_51322 ) ( not ( = ?auto_51319 ?auto_51322 ) ) ( not ( = ?auto_51320 ?auto_51322 ) ) ( not ( = ?auto_51321 ?auto_51322 ) ) ( ON ?auto_51320 ?auto_51321 ) ( ON-TABLE ?auto_51324 ) ( ON ?auto_51323 ?auto_51324 ) ( ON ?auto_51322 ?auto_51323 ) ( not ( = ?auto_51324 ?auto_51323 ) ) ( not ( = ?auto_51324 ?auto_51322 ) ) ( not ( = ?auto_51324 ?auto_51321 ) ) ( not ( = ?auto_51324 ?auto_51320 ) ) ( not ( = ?auto_51323 ?auto_51322 ) ) ( not ( = ?auto_51323 ?auto_51321 ) ) ( not ( = ?auto_51323 ?auto_51320 ) ) ( not ( = ?auto_51319 ?auto_51324 ) ) ( not ( = ?auto_51319 ?auto_51323 ) ) ( HOLDING ?auto_51319 ) ( CLEAR ?auto_51320 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_51324 ?auto_51323 ?auto_51322 ?auto_51321 ?auto_51320 ?auto_51319 )
      ( MAKE-3PILE ?auto_51319 ?auto_51320 ?auto_51321 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_51325 - BLOCK
      ?auto_51326 - BLOCK
      ?auto_51327 - BLOCK
    )
    :vars
    (
      ?auto_51330 - BLOCK
      ?auto_51328 - BLOCK
      ?auto_51329 - BLOCK
      ?auto_51331 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_51325 ?auto_51326 ) ) ( not ( = ?auto_51325 ?auto_51327 ) ) ( not ( = ?auto_51326 ?auto_51327 ) ) ( ON ?auto_51327 ?auto_51330 ) ( not ( = ?auto_51325 ?auto_51330 ) ) ( not ( = ?auto_51326 ?auto_51330 ) ) ( not ( = ?auto_51327 ?auto_51330 ) ) ( ON ?auto_51326 ?auto_51327 ) ( ON-TABLE ?auto_51328 ) ( ON ?auto_51329 ?auto_51328 ) ( ON ?auto_51330 ?auto_51329 ) ( not ( = ?auto_51328 ?auto_51329 ) ) ( not ( = ?auto_51328 ?auto_51330 ) ) ( not ( = ?auto_51328 ?auto_51327 ) ) ( not ( = ?auto_51328 ?auto_51326 ) ) ( not ( = ?auto_51329 ?auto_51330 ) ) ( not ( = ?auto_51329 ?auto_51327 ) ) ( not ( = ?auto_51329 ?auto_51326 ) ) ( not ( = ?auto_51325 ?auto_51328 ) ) ( not ( = ?auto_51325 ?auto_51329 ) ) ( CLEAR ?auto_51326 ) ( ON ?auto_51325 ?auto_51331 ) ( CLEAR ?auto_51325 ) ( HAND-EMPTY ) ( not ( = ?auto_51325 ?auto_51331 ) ) ( not ( = ?auto_51326 ?auto_51331 ) ) ( not ( = ?auto_51327 ?auto_51331 ) ) ( not ( = ?auto_51330 ?auto_51331 ) ) ( not ( = ?auto_51328 ?auto_51331 ) ) ( not ( = ?auto_51329 ?auto_51331 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_51325 ?auto_51331 )
      ( MAKE-3PILE ?auto_51325 ?auto_51326 ?auto_51327 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_51332 - BLOCK
      ?auto_51333 - BLOCK
      ?auto_51334 - BLOCK
    )
    :vars
    (
      ?auto_51338 - BLOCK
      ?auto_51336 - BLOCK
      ?auto_51337 - BLOCK
      ?auto_51335 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_51332 ?auto_51333 ) ) ( not ( = ?auto_51332 ?auto_51334 ) ) ( not ( = ?auto_51333 ?auto_51334 ) ) ( ON ?auto_51334 ?auto_51338 ) ( not ( = ?auto_51332 ?auto_51338 ) ) ( not ( = ?auto_51333 ?auto_51338 ) ) ( not ( = ?auto_51334 ?auto_51338 ) ) ( ON-TABLE ?auto_51336 ) ( ON ?auto_51337 ?auto_51336 ) ( ON ?auto_51338 ?auto_51337 ) ( not ( = ?auto_51336 ?auto_51337 ) ) ( not ( = ?auto_51336 ?auto_51338 ) ) ( not ( = ?auto_51336 ?auto_51334 ) ) ( not ( = ?auto_51336 ?auto_51333 ) ) ( not ( = ?auto_51337 ?auto_51338 ) ) ( not ( = ?auto_51337 ?auto_51334 ) ) ( not ( = ?auto_51337 ?auto_51333 ) ) ( not ( = ?auto_51332 ?auto_51336 ) ) ( not ( = ?auto_51332 ?auto_51337 ) ) ( ON ?auto_51332 ?auto_51335 ) ( CLEAR ?auto_51332 ) ( not ( = ?auto_51332 ?auto_51335 ) ) ( not ( = ?auto_51333 ?auto_51335 ) ) ( not ( = ?auto_51334 ?auto_51335 ) ) ( not ( = ?auto_51338 ?auto_51335 ) ) ( not ( = ?auto_51336 ?auto_51335 ) ) ( not ( = ?auto_51337 ?auto_51335 ) ) ( HOLDING ?auto_51333 ) ( CLEAR ?auto_51334 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_51336 ?auto_51337 ?auto_51338 ?auto_51334 ?auto_51333 )
      ( MAKE-3PILE ?auto_51332 ?auto_51333 ?auto_51334 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_51339 - BLOCK
      ?auto_51340 - BLOCK
      ?auto_51341 - BLOCK
    )
    :vars
    (
      ?auto_51345 - BLOCK
      ?auto_51343 - BLOCK
      ?auto_51344 - BLOCK
      ?auto_51342 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_51339 ?auto_51340 ) ) ( not ( = ?auto_51339 ?auto_51341 ) ) ( not ( = ?auto_51340 ?auto_51341 ) ) ( ON ?auto_51341 ?auto_51345 ) ( not ( = ?auto_51339 ?auto_51345 ) ) ( not ( = ?auto_51340 ?auto_51345 ) ) ( not ( = ?auto_51341 ?auto_51345 ) ) ( ON-TABLE ?auto_51343 ) ( ON ?auto_51344 ?auto_51343 ) ( ON ?auto_51345 ?auto_51344 ) ( not ( = ?auto_51343 ?auto_51344 ) ) ( not ( = ?auto_51343 ?auto_51345 ) ) ( not ( = ?auto_51343 ?auto_51341 ) ) ( not ( = ?auto_51343 ?auto_51340 ) ) ( not ( = ?auto_51344 ?auto_51345 ) ) ( not ( = ?auto_51344 ?auto_51341 ) ) ( not ( = ?auto_51344 ?auto_51340 ) ) ( not ( = ?auto_51339 ?auto_51343 ) ) ( not ( = ?auto_51339 ?auto_51344 ) ) ( ON ?auto_51339 ?auto_51342 ) ( not ( = ?auto_51339 ?auto_51342 ) ) ( not ( = ?auto_51340 ?auto_51342 ) ) ( not ( = ?auto_51341 ?auto_51342 ) ) ( not ( = ?auto_51345 ?auto_51342 ) ) ( not ( = ?auto_51343 ?auto_51342 ) ) ( not ( = ?auto_51344 ?auto_51342 ) ) ( CLEAR ?auto_51341 ) ( ON ?auto_51340 ?auto_51339 ) ( CLEAR ?auto_51340 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_51342 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_51342 ?auto_51339 )
      ( MAKE-3PILE ?auto_51339 ?auto_51340 ?auto_51341 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_51346 - BLOCK
      ?auto_51347 - BLOCK
      ?auto_51348 - BLOCK
    )
    :vars
    (
      ?auto_51350 - BLOCK
      ?auto_51349 - BLOCK
      ?auto_51352 - BLOCK
      ?auto_51351 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_51346 ?auto_51347 ) ) ( not ( = ?auto_51346 ?auto_51348 ) ) ( not ( = ?auto_51347 ?auto_51348 ) ) ( not ( = ?auto_51346 ?auto_51350 ) ) ( not ( = ?auto_51347 ?auto_51350 ) ) ( not ( = ?auto_51348 ?auto_51350 ) ) ( ON-TABLE ?auto_51349 ) ( ON ?auto_51352 ?auto_51349 ) ( ON ?auto_51350 ?auto_51352 ) ( not ( = ?auto_51349 ?auto_51352 ) ) ( not ( = ?auto_51349 ?auto_51350 ) ) ( not ( = ?auto_51349 ?auto_51348 ) ) ( not ( = ?auto_51349 ?auto_51347 ) ) ( not ( = ?auto_51352 ?auto_51350 ) ) ( not ( = ?auto_51352 ?auto_51348 ) ) ( not ( = ?auto_51352 ?auto_51347 ) ) ( not ( = ?auto_51346 ?auto_51349 ) ) ( not ( = ?auto_51346 ?auto_51352 ) ) ( ON ?auto_51346 ?auto_51351 ) ( not ( = ?auto_51346 ?auto_51351 ) ) ( not ( = ?auto_51347 ?auto_51351 ) ) ( not ( = ?auto_51348 ?auto_51351 ) ) ( not ( = ?auto_51350 ?auto_51351 ) ) ( not ( = ?auto_51349 ?auto_51351 ) ) ( not ( = ?auto_51352 ?auto_51351 ) ) ( ON ?auto_51347 ?auto_51346 ) ( CLEAR ?auto_51347 ) ( ON-TABLE ?auto_51351 ) ( HOLDING ?auto_51348 ) ( CLEAR ?auto_51350 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_51349 ?auto_51352 ?auto_51350 ?auto_51348 )
      ( MAKE-3PILE ?auto_51346 ?auto_51347 ?auto_51348 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_51353 - BLOCK
      ?auto_51354 - BLOCK
      ?auto_51355 - BLOCK
    )
    :vars
    (
      ?auto_51357 - BLOCK
      ?auto_51358 - BLOCK
      ?auto_51359 - BLOCK
      ?auto_51356 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_51353 ?auto_51354 ) ) ( not ( = ?auto_51353 ?auto_51355 ) ) ( not ( = ?auto_51354 ?auto_51355 ) ) ( not ( = ?auto_51353 ?auto_51357 ) ) ( not ( = ?auto_51354 ?auto_51357 ) ) ( not ( = ?auto_51355 ?auto_51357 ) ) ( ON-TABLE ?auto_51358 ) ( ON ?auto_51359 ?auto_51358 ) ( ON ?auto_51357 ?auto_51359 ) ( not ( = ?auto_51358 ?auto_51359 ) ) ( not ( = ?auto_51358 ?auto_51357 ) ) ( not ( = ?auto_51358 ?auto_51355 ) ) ( not ( = ?auto_51358 ?auto_51354 ) ) ( not ( = ?auto_51359 ?auto_51357 ) ) ( not ( = ?auto_51359 ?auto_51355 ) ) ( not ( = ?auto_51359 ?auto_51354 ) ) ( not ( = ?auto_51353 ?auto_51358 ) ) ( not ( = ?auto_51353 ?auto_51359 ) ) ( ON ?auto_51353 ?auto_51356 ) ( not ( = ?auto_51353 ?auto_51356 ) ) ( not ( = ?auto_51354 ?auto_51356 ) ) ( not ( = ?auto_51355 ?auto_51356 ) ) ( not ( = ?auto_51357 ?auto_51356 ) ) ( not ( = ?auto_51358 ?auto_51356 ) ) ( not ( = ?auto_51359 ?auto_51356 ) ) ( ON ?auto_51354 ?auto_51353 ) ( ON-TABLE ?auto_51356 ) ( CLEAR ?auto_51357 ) ( ON ?auto_51355 ?auto_51354 ) ( CLEAR ?auto_51355 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_51356 ?auto_51353 ?auto_51354 )
      ( MAKE-3PILE ?auto_51353 ?auto_51354 ?auto_51355 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_51360 - BLOCK
      ?auto_51361 - BLOCK
      ?auto_51362 - BLOCK
    )
    :vars
    (
      ?auto_51365 - BLOCK
      ?auto_51364 - BLOCK
      ?auto_51363 - BLOCK
      ?auto_51366 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_51360 ?auto_51361 ) ) ( not ( = ?auto_51360 ?auto_51362 ) ) ( not ( = ?auto_51361 ?auto_51362 ) ) ( not ( = ?auto_51360 ?auto_51365 ) ) ( not ( = ?auto_51361 ?auto_51365 ) ) ( not ( = ?auto_51362 ?auto_51365 ) ) ( ON-TABLE ?auto_51364 ) ( ON ?auto_51363 ?auto_51364 ) ( not ( = ?auto_51364 ?auto_51363 ) ) ( not ( = ?auto_51364 ?auto_51365 ) ) ( not ( = ?auto_51364 ?auto_51362 ) ) ( not ( = ?auto_51364 ?auto_51361 ) ) ( not ( = ?auto_51363 ?auto_51365 ) ) ( not ( = ?auto_51363 ?auto_51362 ) ) ( not ( = ?auto_51363 ?auto_51361 ) ) ( not ( = ?auto_51360 ?auto_51364 ) ) ( not ( = ?auto_51360 ?auto_51363 ) ) ( ON ?auto_51360 ?auto_51366 ) ( not ( = ?auto_51360 ?auto_51366 ) ) ( not ( = ?auto_51361 ?auto_51366 ) ) ( not ( = ?auto_51362 ?auto_51366 ) ) ( not ( = ?auto_51365 ?auto_51366 ) ) ( not ( = ?auto_51364 ?auto_51366 ) ) ( not ( = ?auto_51363 ?auto_51366 ) ) ( ON ?auto_51361 ?auto_51360 ) ( ON-TABLE ?auto_51366 ) ( ON ?auto_51362 ?auto_51361 ) ( CLEAR ?auto_51362 ) ( HOLDING ?auto_51365 ) ( CLEAR ?auto_51363 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_51364 ?auto_51363 ?auto_51365 )
      ( MAKE-3PILE ?auto_51360 ?auto_51361 ?auto_51362 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_51367 - BLOCK
      ?auto_51368 - BLOCK
      ?auto_51369 - BLOCK
    )
    :vars
    (
      ?auto_51370 - BLOCK
      ?auto_51373 - BLOCK
      ?auto_51371 - BLOCK
      ?auto_51372 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_51367 ?auto_51368 ) ) ( not ( = ?auto_51367 ?auto_51369 ) ) ( not ( = ?auto_51368 ?auto_51369 ) ) ( not ( = ?auto_51367 ?auto_51370 ) ) ( not ( = ?auto_51368 ?auto_51370 ) ) ( not ( = ?auto_51369 ?auto_51370 ) ) ( ON-TABLE ?auto_51373 ) ( ON ?auto_51371 ?auto_51373 ) ( not ( = ?auto_51373 ?auto_51371 ) ) ( not ( = ?auto_51373 ?auto_51370 ) ) ( not ( = ?auto_51373 ?auto_51369 ) ) ( not ( = ?auto_51373 ?auto_51368 ) ) ( not ( = ?auto_51371 ?auto_51370 ) ) ( not ( = ?auto_51371 ?auto_51369 ) ) ( not ( = ?auto_51371 ?auto_51368 ) ) ( not ( = ?auto_51367 ?auto_51373 ) ) ( not ( = ?auto_51367 ?auto_51371 ) ) ( ON ?auto_51367 ?auto_51372 ) ( not ( = ?auto_51367 ?auto_51372 ) ) ( not ( = ?auto_51368 ?auto_51372 ) ) ( not ( = ?auto_51369 ?auto_51372 ) ) ( not ( = ?auto_51370 ?auto_51372 ) ) ( not ( = ?auto_51373 ?auto_51372 ) ) ( not ( = ?auto_51371 ?auto_51372 ) ) ( ON ?auto_51368 ?auto_51367 ) ( ON-TABLE ?auto_51372 ) ( ON ?auto_51369 ?auto_51368 ) ( CLEAR ?auto_51371 ) ( ON ?auto_51370 ?auto_51369 ) ( CLEAR ?auto_51370 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_51372 ?auto_51367 ?auto_51368 ?auto_51369 )
      ( MAKE-3PILE ?auto_51367 ?auto_51368 ?auto_51369 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_51374 - BLOCK
      ?auto_51375 - BLOCK
      ?auto_51376 - BLOCK
    )
    :vars
    (
      ?auto_51379 - BLOCK
      ?auto_51378 - BLOCK
      ?auto_51380 - BLOCK
      ?auto_51377 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_51374 ?auto_51375 ) ) ( not ( = ?auto_51374 ?auto_51376 ) ) ( not ( = ?auto_51375 ?auto_51376 ) ) ( not ( = ?auto_51374 ?auto_51379 ) ) ( not ( = ?auto_51375 ?auto_51379 ) ) ( not ( = ?auto_51376 ?auto_51379 ) ) ( ON-TABLE ?auto_51378 ) ( not ( = ?auto_51378 ?auto_51380 ) ) ( not ( = ?auto_51378 ?auto_51379 ) ) ( not ( = ?auto_51378 ?auto_51376 ) ) ( not ( = ?auto_51378 ?auto_51375 ) ) ( not ( = ?auto_51380 ?auto_51379 ) ) ( not ( = ?auto_51380 ?auto_51376 ) ) ( not ( = ?auto_51380 ?auto_51375 ) ) ( not ( = ?auto_51374 ?auto_51378 ) ) ( not ( = ?auto_51374 ?auto_51380 ) ) ( ON ?auto_51374 ?auto_51377 ) ( not ( = ?auto_51374 ?auto_51377 ) ) ( not ( = ?auto_51375 ?auto_51377 ) ) ( not ( = ?auto_51376 ?auto_51377 ) ) ( not ( = ?auto_51379 ?auto_51377 ) ) ( not ( = ?auto_51378 ?auto_51377 ) ) ( not ( = ?auto_51380 ?auto_51377 ) ) ( ON ?auto_51375 ?auto_51374 ) ( ON-TABLE ?auto_51377 ) ( ON ?auto_51376 ?auto_51375 ) ( ON ?auto_51379 ?auto_51376 ) ( CLEAR ?auto_51379 ) ( HOLDING ?auto_51380 ) ( CLEAR ?auto_51378 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_51378 ?auto_51380 )
      ( MAKE-3PILE ?auto_51374 ?auto_51375 ?auto_51376 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_51381 - BLOCK
      ?auto_51382 - BLOCK
      ?auto_51383 - BLOCK
    )
    :vars
    (
      ?auto_51387 - BLOCK
      ?auto_51386 - BLOCK
      ?auto_51385 - BLOCK
      ?auto_51384 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_51381 ?auto_51382 ) ) ( not ( = ?auto_51381 ?auto_51383 ) ) ( not ( = ?auto_51382 ?auto_51383 ) ) ( not ( = ?auto_51381 ?auto_51387 ) ) ( not ( = ?auto_51382 ?auto_51387 ) ) ( not ( = ?auto_51383 ?auto_51387 ) ) ( ON-TABLE ?auto_51386 ) ( not ( = ?auto_51386 ?auto_51385 ) ) ( not ( = ?auto_51386 ?auto_51387 ) ) ( not ( = ?auto_51386 ?auto_51383 ) ) ( not ( = ?auto_51386 ?auto_51382 ) ) ( not ( = ?auto_51385 ?auto_51387 ) ) ( not ( = ?auto_51385 ?auto_51383 ) ) ( not ( = ?auto_51385 ?auto_51382 ) ) ( not ( = ?auto_51381 ?auto_51386 ) ) ( not ( = ?auto_51381 ?auto_51385 ) ) ( ON ?auto_51381 ?auto_51384 ) ( not ( = ?auto_51381 ?auto_51384 ) ) ( not ( = ?auto_51382 ?auto_51384 ) ) ( not ( = ?auto_51383 ?auto_51384 ) ) ( not ( = ?auto_51387 ?auto_51384 ) ) ( not ( = ?auto_51386 ?auto_51384 ) ) ( not ( = ?auto_51385 ?auto_51384 ) ) ( ON ?auto_51382 ?auto_51381 ) ( ON-TABLE ?auto_51384 ) ( ON ?auto_51383 ?auto_51382 ) ( ON ?auto_51387 ?auto_51383 ) ( CLEAR ?auto_51386 ) ( ON ?auto_51385 ?auto_51387 ) ( CLEAR ?auto_51385 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_51384 ?auto_51381 ?auto_51382 ?auto_51383 ?auto_51387 )
      ( MAKE-3PILE ?auto_51381 ?auto_51382 ?auto_51383 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_51388 - BLOCK
      ?auto_51389 - BLOCK
      ?auto_51390 - BLOCK
    )
    :vars
    (
      ?auto_51393 - BLOCK
      ?auto_51394 - BLOCK
      ?auto_51391 - BLOCK
      ?auto_51392 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_51388 ?auto_51389 ) ) ( not ( = ?auto_51388 ?auto_51390 ) ) ( not ( = ?auto_51389 ?auto_51390 ) ) ( not ( = ?auto_51388 ?auto_51393 ) ) ( not ( = ?auto_51389 ?auto_51393 ) ) ( not ( = ?auto_51390 ?auto_51393 ) ) ( not ( = ?auto_51394 ?auto_51391 ) ) ( not ( = ?auto_51394 ?auto_51393 ) ) ( not ( = ?auto_51394 ?auto_51390 ) ) ( not ( = ?auto_51394 ?auto_51389 ) ) ( not ( = ?auto_51391 ?auto_51393 ) ) ( not ( = ?auto_51391 ?auto_51390 ) ) ( not ( = ?auto_51391 ?auto_51389 ) ) ( not ( = ?auto_51388 ?auto_51394 ) ) ( not ( = ?auto_51388 ?auto_51391 ) ) ( ON ?auto_51388 ?auto_51392 ) ( not ( = ?auto_51388 ?auto_51392 ) ) ( not ( = ?auto_51389 ?auto_51392 ) ) ( not ( = ?auto_51390 ?auto_51392 ) ) ( not ( = ?auto_51393 ?auto_51392 ) ) ( not ( = ?auto_51394 ?auto_51392 ) ) ( not ( = ?auto_51391 ?auto_51392 ) ) ( ON ?auto_51389 ?auto_51388 ) ( ON-TABLE ?auto_51392 ) ( ON ?auto_51390 ?auto_51389 ) ( ON ?auto_51393 ?auto_51390 ) ( ON ?auto_51391 ?auto_51393 ) ( CLEAR ?auto_51391 ) ( HOLDING ?auto_51394 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_51394 )
      ( MAKE-3PILE ?auto_51388 ?auto_51389 ?auto_51390 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_51395 - BLOCK
      ?auto_51396 - BLOCK
      ?auto_51397 - BLOCK
    )
    :vars
    (
      ?auto_51400 - BLOCK
      ?auto_51401 - BLOCK
      ?auto_51399 - BLOCK
      ?auto_51398 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_51395 ?auto_51396 ) ) ( not ( = ?auto_51395 ?auto_51397 ) ) ( not ( = ?auto_51396 ?auto_51397 ) ) ( not ( = ?auto_51395 ?auto_51400 ) ) ( not ( = ?auto_51396 ?auto_51400 ) ) ( not ( = ?auto_51397 ?auto_51400 ) ) ( not ( = ?auto_51401 ?auto_51399 ) ) ( not ( = ?auto_51401 ?auto_51400 ) ) ( not ( = ?auto_51401 ?auto_51397 ) ) ( not ( = ?auto_51401 ?auto_51396 ) ) ( not ( = ?auto_51399 ?auto_51400 ) ) ( not ( = ?auto_51399 ?auto_51397 ) ) ( not ( = ?auto_51399 ?auto_51396 ) ) ( not ( = ?auto_51395 ?auto_51401 ) ) ( not ( = ?auto_51395 ?auto_51399 ) ) ( ON ?auto_51395 ?auto_51398 ) ( not ( = ?auto_51395 ?auto_51398 ) ) ( not ( = ?auto_51396 ?auto_51398 ) ) ( not ( = ?auto_51397 ?auto_51398 ) ) ( not ( = ?auto_51400 ?auto_51398 ) ) ( not ( = ?auto_51401 ?auto_51398 ) ) ( not ( = ?auto_51399 ?auto_51398 ) ) ( ON ?auto_51396 ?auto_51395 ) ( ON-TABLE ?auto_51398 ) ( ON ?auto_51397 ?auto_51396 ) ( ON ?auto_51400 ?auto_51397 ) ( ON ?auto_51399 ?auto_51400 ) ( ON ?auto_51401 ?auto_51399 ) ( CLEAR ?auto_51401 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_51398 ?auto_51395 ?auto_51396 ?auto_51397 ?auto_51400 ?auto_51399 )
      ( MAKE-3PILE ?auto_51395 ?auto_51396 ?auto_51397 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_51404 - BLOCK
      ?auto_51405 - BLOCK
    )
    :vars
    (
      ?auto_51406 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_51406 ?auto_51405 ) ( CLEAR ?auto_51406 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_51404 ) ( ON ?auto_51405 ?auto_51404 ) ( not ( = ?auto_51404 ?auto_51405 ) ) ( not ( = ?auto_51404 ?auto_51406 ) ) ( not ( = ?auto_51405 ?auto_51406 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_51406 ?auto_51405 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_51407 - BLOCK
      ?auto_51408 - BLOCK
    )
    :vars
    (
      ?auto_51409 - BLOCK
      ?auto_51410 - BLOCK
      ?auto_51411 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_51409 ?auto_51408 ) ( CLEAR ?auto_51409 ) ( ON-TABLE ?auto_51407 ) ( ON ?auto_51408 ?auto_51407 ) ( not ( = ?auto_51407 ?auto_51408 ) ) ( not ( = ?auto_51407 ?auto_51409 ) ) ( not ( = ?auto_51408 ?auto_51409 ) ) ( HOLDING ?auto_51410 ) ( CLEAR ?auto_51411 ) ( not ( = ?auto_51407 ?auto_51410 ) ) ( not ( = ?auto_51407 ?auto_51411 ) ) ( not ( = ?auto_51408 ?auto_51410 ) ) ( not ( = ?auto_51408 ?auto_51411 ) ) ( not ( = ?auto_51409 ?auto_51410 ) ) ( not ( = ?auto_51409 ?auto_51411 ) ) ( not ( = ?auto_51410 ?auto_51411 ) ) )
    :subtasks
    ( ( !STACK ?auto_51410 ?auto_51411 )
      ( MAKE-2PILE ?auto_51407 ?auto_51408 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_51412 - BLOCK
      ?auto_51413 - BLOCK
    )
    :vars
    (
      ?auto_51415 - BLOCK
      ?auto_51414 - BLOCK
      ?auto_51416 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_51415 ?auto_51413 ) ( ON-TABLE ?auto_51412 ) ( ON ?auto_51413 ?auto_51412 ) ( not ( = ?auto_51412 ?auto_51413 ) ) ( not ( = ?auto_51412 ?auto_51415 ) ) ( not ( = ?auto_51413 ?auto_51415 ) ) ( CLEAR ?auto_51414 ) ( not ( = ?auto_51412 ?auto_51416 ) ) ( not ( = ?auto_51412 ?auto_51414 ) ) ( not ( = ?auto_51413 ?auto_51416 ) ) ( not ( = ?auto_51413 ?auto_51414 ) ) ( not ( = ?auto_51415 ?auto_51416 ) ) ( not ( = ?auto_51415 ?auto_51414 ) ) ( not ( = ?auto_51416 ?auto_51414 ) ) ( ON ?auto_51416 ?auto_51415 ) ( CLEAR ?auto_51416 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_51412 ?auto_51413 ?auto_51415 )
      ( MAKE-2PILE ?auto_51412 ?auto_51413 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_51417 - BLOCK
      ?auto_51418 - BLOCK
    )
    :vars
    (
      ?auto_51421 - BLOCK
      ?auto_51420 - BLOCK
      ?auto_51419 - BLOCK
      ?auto_51422 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_51421 ?auto_51418 ) ( ON-TABLE ?auto_51417 ) ( ON ?auto_51418 ?auto_51417 ) ( not ( = ?auto_51417 ?auto_51418 ) ) ( not ( = ?auto_51417 ?auto_51421 ) ) ( not ( = ?auto_51418 ?auto_51421 ) ) ( not ( = ?auto_51417 ?auto_51420 ) ) ( not ( = ?auto_51417 ?auto_51419 ) ) ( not ( = ?auto_51418 ?auto_51420 ) ) ( not ( = ?auto_51418 ?auto_51419 ) ) ( not ( = ?auto_51421 ?auto_51420 ) ) ( not ( = ?auto_51421 ?auto_51419 ) ) ( not ( = ?auto_51420 ?auto_51419 ) ) ( ON ?auto_51420 ?auto_51421 ) ( CLEAR ?auto_51420 ) ( HOLDING ?auto_51419 ) ( CLEAR ?auto_51422 ) ( ON-TABLE ?auto_51422 ) ( not ( = ?auto_51422 ?auto_51419 ) ) ( not ( = ?auto_51417 ?auto_51422 ) ) ( not ( = ?auto_51418 ?auto_51422 ) ) ( not ( = ?auto_51421 ?auto_51422 ) ) ( not ( = ?auto_51420 ?auto_51422 ) ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_51422 ?auto_51419 )
      ( MAKE-2PILE ?auto_51417 ?auto_51418 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_51423 - BLOCK
      ?auto_51424 - BLOCK
    )
    :vars
    (
      ?auto_51425 - BLOCK
      ?auto_51427 - BLOCK
      ?auto_51428 - BLOCK
      ?auto_51426 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_51425 ?auto_51424 ) ( ON-TABLE ?auto_51423 ) ( ON ?auto_51424 ?auto_51423 ) ( not ( = ?auto_51423 ?auto_51424 ) ) ( not ( = ?auto_51423 ?auto_51425 ) ) ( not ( = ?auto_51424 ?auto_51425 ) ) ( not ( = ?auto_51423 ?auto_51427 ) ) ( not ( = ?auto_51423 ?auto_51428 ) ) ( not ( = ?auto_51424 ?auto_51427 ) ) ( not ( = ?auto_51424 ?auto_51428 ) ) ( not ( = ?auto_51425 ?auto_51427 ) ) ( not ( = ?auto_51425 ?auto_51428 ) ) ( not ( = ?auto_51427 ?auto_51428 ) ) ( ON ?auto_51427 ?auto_51425 ) ( CLEAR ?auto_51426 ) ( ON-TABLE ?auto_51426 ) ( not ( = ?auto_51426 ?auto_51428 ) ) ( not ( = ?auto_51423 ?auto_51426 ) ) ( not ( = ?auto_51424 ?auto_51426 ) ) ( not ( = ?auto_51425 ?auto_51426 ) ) ( not ( = ?auto_51427 ?auto_51426 ) ) ( ON ?auto_51428 ?auto_51427 ) ( CLEAR ?auto_51428 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_51423 ?auto_51424 ?auto_51425 ?auto_51427 )
      ( MAKE-2PILE ?auto_51423 ?auto_51424 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_51429 - BLOCK
      ?auto_51430 - BLOCK
    )
    :vars
    (
      ?auto_51433 - BLOCK
      ?auto_51432 - BLOCK
      ?auto_51434 - BLOCK
      ?auto_51431 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_51433 ?auto_51430 ) ( ON-TABLE ?auto_51429 ) ( ON ?auto_51430 ?auto_51429 ) ( not ( = ?auto_51429 ?auto_51430 ) ) ( not ( = ?auto_51429 ?auto_51433 ) ) ( not ( = ?auto_51430 ?auto_51433 ) ) ( not ( = ?auto_51429 ?auto_51432 ) ) ( not ( = ?auto_51429 ?auto_51434 ) ) ( not ( = ?auto_51430 ?auto_51432 ) ) ( not ( = ?auto_51430 ?auto_51434 ) ) ( not ( = ?auto_51433 ?auto_51432 ) ) ( not ( = ?auto_51433 ?auto_51434 ) ) ( not ( = ?auto_51432 ?auto_51434 ) ) ( ON ?auto_51432 ?auto_51433 ) ( not ( = ?auto_51431 ?auto_51434 ) ) ( not ( = ?auto_51429 ?auto_51431 ) ) ( not ( = ?auto_51430 ?auto_51431 ) ) ( not ( = ?auto_51433 ?auto_51431 ) ) ( not ( = ?auto_51432 ?auto_51431 ) ) ( ON ?auto_51434 ?auto_51432 ) ( CLEAR ?auto_51434 ) ( HOLDING ?auto_51431 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_51431 )
      ( MAKE-2PILE ?auto_51429 ?auto_51430 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_51435 - BLOCK
      ?auto_51436 - BLOCK
    )
    :vars
    (
      ?auto_51439 - BLOCK
      ?auto_51437 - BLOCK
      ?auto_51440 - BLOCK
      ?auto_51438 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_51439 ?auto_51436 ) ( ON-TABLE ?auto_51435 ) ( ON ?auto_51436 ?auto_51435 ) ( not ( = ?auto_51435 ?auto_51436 ) ) ( not ( = ?auto_51435 ?auto_51439 ) ) ( not ( = ?auto_51436 ?auto_51439 ) ) ( not ( = ?auto_51435 ?auto_51437 ) ) ( not ( = ?auto_51435 ?auto_51440 ) ) ( not ( = ?auto_51436 ?auto_51437 ) ) ( not ( = ?auto_51436 ?auto_51440 ) ) ( not ( = ?auto_51439 ?auto_51437 ) ) ( not ( = ?auto_51439 ?auto_51440 ) ) ( not ( = ?auto_51437 ?auto_51440 ) ) ( ON ?auto_51437 ?auto_51439 ) ( not ( = ?auto_51438 ?auto_51440 ) ) ( not ( = ?auto_51435 ?auto_51438 ) ) ( not ( = ?auto_51436 ?auto_51438 ) ) ( not ( = ?auto_51439 ?auto_51438 ) ) ( not ( = ?auto_51437 ?auto_51438 ) ) ( ON ?auto_51440 ?auto_51437 ) ( ON ?auto_51438 ?auto_51440 ) ( CLEAR ?auto_51438 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_51435 ?auto_51436 ?auto_51439 ?auto_51437 ?auto_51440 )
      ( MAKE-2PILE ?auto_51435 ?auto_51436 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_51441 - BLOCK
      ?auto_51442 - BLOCK
    )
    :vars
    (
      ?auto_51445 - BLOCK
      ?auto_51444 - BLOCK
      ?auto_51443 - BLOCK
      ?auto_51446 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_51445 ?auto_51442 ) ( ON-TABLE ?auto_51441 ) ( ON ?auto_51442 ?auto_51441 ) ( not ( = ?auto_51441 ?auto_51442 ) ) ( not ( = ?auto_51441 ?auto_51445 ) ) ( not ( = ?auto_51442 ?auto_51445 ) ) ( not ( = ?auto_51441 ?auto_51444 ) ) ( not ( = ?auto_51441 ?auto_51443 ) ) ( not ( = ?auto_51442 ?auto_51444 ) ) ( not ( = ?auto_51442 ?auto_51443 ) ) ( not ( = ?auto_51445 ?auto_51444 ) ) ( not ( = ?auto_51445 ?auto_51443 ) ) ( not ( = ?auto_51444 ?auto_51443 ) ) ( ON ?auto_51444 ?auto_51445 ) ( not ( = ?auto_51446 ?auto_51443 ) ) ( not ( = ?auto_51441 ?auto_51446 ) ) ( not ( = ?auto_51442 ?auto_51446 ) ) ( not ( = ?auto_51445 ?auto_51446 ) ) ( not ( = ?auto_51444 ?auto_51446 ) ) ( ON ?auto_51443 ?auto_51444 ) ( HOLDING ?auto_51446 ) ( CLEAR ?auto_51443 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_51441 ?auto_51442 ?auto_51445 ?auto_51444 ?auto_51443 ?auto_51446 )
      ( MAKE-2PILE ?auto_51441 ?auto_51442 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_51447 - BLOCK
      ?auto_51448 - BLOCK
    )
    :vars
    (
      ?auto_51449 - BLOCK
      ?auto_51451 - BLOCK
      ?auto_51450 - BLOCK
      ?auto_51452 - BLOCK
      ?auto_51453 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_51449 ?auto_51448 ) ( ON-TABLE ?auto_51447 ) ( ON ?auto_51448 ?auto_51447 ) ( not ( = ?auto_51447 ?auto_51448 ) ) ( not ( = ?auto_51447 ?auto_51449 ) ) ( not ( = ?auto_51448 ?auto_51449 ) ) ( not ( = ?auto_51447 ?auto_51451 ) ) ( not ( = ?auto_51447 ?auto_51450 ) ) ( not ( = ?auto_51448 ?auto_51451 ) ) ( not ( = ?auto_51448 ?auto_51450 ) ) ( not ( = ?auto_51449 ?auto_51451 ) ) ( not ( = ?auto_51449 ?auto_51450 ) ) ( not ( = ?auto_51451 ?auto_51450 ) ) ( ON ?auto_51451 ?auto_51449 ) ( not ( = ?auto_51452 ?auto_51450 ) ) ( not ( = ?auto_51447 ?auto_51452 ) ) ( not ( = ?auto_51448 ?auto_51452 ) ) ( not ( = ?auto_51449 ?auto_51452 ) ) ( not ( = ?auto_51451 ?auto_51452 ) ) ( ON ?auto_51450 ?auto_51451 ) ( CLEAR ?auto_51450 ) ( ON ?auto_51452 ?auto_51453 ) ( CLEAR ?auto_51452 ) ( HAND-EMPTY ) ( not ( = ?auto_51447 ?auto_51453 ) ) ( not ( = ?auto_51448 ?auto_51453 ) ) ( not ( = ?auto_51449 ?auto_51453 ) ) ( not ( = ?auto_51451 ?auto_51453 ) ) ( not ( = ?auto_51450 ?auto_51453 ) ) ( not ( = ?auto_51452 ?auto_51453 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_51452 ?auto_51453 )
      ( MAKE-2PILE ?auto_51447 ?auto_51448 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_51454 - BLOCK
      ?auto_51455 - BLOCK
    )
    :vars
    (
      ?auto_51459 - BLOCK
      ?auto_51456 - BLOCK
      ?auto_51457 - BLOCK
      ?auto_51460 - BLOCK
      ?auto_51458 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_51459 ?auto_51455 ) ( ON-TABLE ?auto_51454 ) ( ON ?auto_51455 ?auto_51454 ) ( not ( = ?auto_51454 ?auto_51455 ) ) ( not ( = ?auto_51454 ?auto_51459 ) ) ( not ( = ?auto_51455 ?auto_51459 ) ) ( not ( = ?auto_51454 ?auto_51456 ) ) ( not ( = ?auto_51454 ?auto_51457 ) ) ( not ( = ?auto_51455 ?auto_51456 ) ) ( not ( = ?auto_51455 ?auto_51457 ) ) ( not ( = ?auto_51459 ?auto_51456 ) ) ( not ( = ?auto_51459 ?auto_51457 ) ) ( not ( = ?auto_51456 ?auto_51457 ) ) ( ON ?auto_51456 ?auto_51459 ) ( not ( = ?auto_51460 ?auto_51457 ) ) ( not ( = ?auto_51454 ?auto_51460 ) ) ( not ( = ?auto_51455 ?auto_51460 ) ) ( not ( = ?auto_51459 ?auto_51460 ) ) ( not ( = ?auto_51456 ?auto_51460 ) ) ( ON ?auto_51460 ?auto_51458 ) ( CLEAR ?auto_51460 ) ( not ( = ?auto_51454 ?auto_51458 ) ) ( not ( = ?auto_51455 ?auto_51458 ) ) ( not ( = ?auto_51459 ?auto_51458 ) ) ( not ( = ?auto_51456 ?auto_51458 ) ) ( not ( = ?auto_51457 ?auto_51458 ) ) ( not ( = ?auto_51460 ?auto_51458 ) ) ( HOLDING ?auto_51457 ) ( CLEAR ?auto_51456 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_51454 ?auto_51455 ?auto_51459 ?auto_51456 ?auto_51457 )
      ( MAKE-2PILE ?auto_51454 ?auto_51455 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_51461 - BLOCK
      ?auto_51462 - BLOCK
    )
    :vars
    (
      ?auto_51465 - BLOCK
      ?auto_51466 - BLOCK
      ?auto_51463 - BLOCK
      ?auto_51467 - BLOCK
      ?auto_51464 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_51465 ?auto_51462 ) ( ON-TABLE ?auto_51461 ) ( ON ?auto_51462 ?auto_51461 ) ( not ( = ?auto_51461 ?auto_51462 ) ) ( not ( = ?auto_51461 ?auto_51465 ) ) ( not ( = ?auto_51462 ?auto_51465 ) ) ( not ( = ?auto_51461 ?auto_51466 ) ) ( not ( = ?auto_51461 ?auto_51463 ) ) ( not ( = ?auto_51462 ?auto_51466 ) ) ( not ( = ?auto_51462 ?auto_51463 ) ) ( not ( = ?auto_51465 ?auto_51466 ) ) ( not ( = ?auto_51465 ?auto_51463 ) ) ( not ( = ?auto_51466 ?auto_51463 ) ) ( ON ?auto_51466 ?auto_51465 ) ( not ( = ?auto_51467 ?auto_51463 ) ) ( not ( = ?auto_51461 ?auto_51467 ) ) ( not ( = ?auto_51462 ?auto_51467 ) ) ( not ( = ?auto_51465 ?auto_51467 ) ) ( not ( = ?auto_51466 ?auto_51467 ) ) ( ON ?auto_51467 ?auto_51464 ) ( not ( = ?auto_51461 ?auto_51464 ) ) ( not ( = ?auto_51462 ?auto_51464 ) ) ( not ( = ?auto_51465 ?auto_51464 ) ) ( not ( = ?auto_51466 ?auto_51464 ) ) ( not ( = ?auto_51463 ?auto_51464 ) ) ( not ( = ?auto_51467 ?auto_51464 ) ) ( CLEAR ?auto_51466 ) ( ON ?auto_51463 ?auto_51467 ) ( CLEAR ?auto_51463 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_51464 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_51464 ?auto_51467 )
      ( MAKE-2PILE ?auto_51461 ?auto_51462 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_51468 - BLOCK
      ?auto_51469 - BLOCK
    )
    :vars
    (
      ?auto_51472 - BLOCK
      ?auto_51471 - BLOCK
      ?auto_51474 - BLOCK
      ?auto_51473 - BLOCK
      ?auto_51470 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_51472 ?auto_51469 ) ( ON-TABLE ?auto_51468 ) ( ON ?auto_51469 ?auto_51468 ) ( not ( = ?auto_51468 ?auto_51469 ) ) ( not ( = ?auto_51468 ?auto_51472 ) ) ( not ( = ?auto_51469 ?auto_51472 ) ) ( not ( = ?auto_51468 ?auto_51471 ) ) ( not ( = ?auto_51468 ?auto_51474 ) ) ( not ( = ?auto_51469 ?auto_51471 ) ) ( not ( = ?auto_51469 ?auto_51474 ) ) ( not ( = ?auto_51472 ?auto_51471 ) ) ( not ( = ?auto_51472 ?auto_51474 ) ) ( not ( = ?auto_51471 ?auto_51474 ) ) ( not ( = ?auto_51473 ?auto_51474 ) ) ( not ( = ?auto_51468 ?auto_51473 ) ) ( not ( = ?auto_51469 ?auto_51473 ) ) ( not ( = ?auto_51472 ?auto_51473 ) ) ( not ( = ?auto_51471 ?auto_51473 ) ) ( ON ?auto_51473 ?auto_51470 ) ( not ( = ?auto_51468 ?auto_51470 ) ) ( not ( = ?auto_51469 ?auto_51470 ) ) ( not ( = ?auto_51472 ?auto_51470 ) ) ( not ( = ?auto_51471 ?auto_51470 ) ) ( not ( = ?auto_51474 ?auto_51470 ) ) ( not ( = ?auto_51473 ?auto_51470 ) ) ( ON ?auto_51474 ?auto_51473 ) ( CLEAR ?auto_51474 ) ( ON-TABLE ?auto_51470 ) ( HOLDING ?auto_51471 ) ( CLEAR ?auto_51472 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_51468 ?auto_51469 ?auto_51472 ?auto_51471 )
      ( MAKE-2PILE ?auto_51468 ?auto_51469 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_51475 - BLOCK
      ?auto_51476 - BLOCK
    )
    :vars
    (
      ?auto_51479 - BLOCK
      ?auto_51481 - BLOCK
      ?auto_51477 - BLOCK
      ?auto_51480 - BLOCK
      ?auto_51478 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_51479 ?auto_51476 ) ( ON-TABLE ?auto_51475 ) ( ON ?auto_51476 ?auto_51475 ) ( not ( = ?auto_51475 ?auto_51476 ) ) ( not ( = ?auto_51475 ?auto_51479 ) ) ( not ( = ?auto_51476 ?auto_51479 ) ) ( not ( = ?auto_51475 ?auto_51481 ) ) ( not ( = ?auto_51475 ?auto_51477 ) ) ( not ( = ?auto_51476 ?auto_51481 ) ) ( not ( = ?auto_51476 ?auto_51477 ) ) ( not ( = ?auto_51479 ?auto_51481 ) ) ( not ( = ?auto_51479 ?auto_51477 ) ) ( not ( = ?auto_51481 ?auto_51477 ) ) ( not ( = ?auto_51480 ?auto_51477 ) ) ( not ( = ?auto_51475 ?auto_51480 ) ) ( not ( = ?auto_51476 ?auto_51480 ) ) ( not ( = ?auto_51479 ?auto_51480 ) ) ( not ( = ?auto_51481 ?auto_51480 ) ) ( ON ?auto_51480 ?auto_51478 ) ( not ( = ?auto_51475 ?auto_51478 ) ) ( not ( = ?auto_51476 ?auto_51478 ) ) ( not ( = ?auto_51479 ?auto_51478 ) ) ( not ( = ?auto_51481 ?auto_51478 ) ) ( not ( = ?auto_51477 ?auto_51478 ) ) ( not ( = ?auto_51480 ?auto_51478 ) ) ( ON ?auto_51477 ?auto_51480 ) ( ON-TABLE ?auto_51478 ) ( CLEAR ?auto_51479 ) ( ON ?auto_51481 ?auto_51477 ) ( CLEAR ?auto_51481 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_51478 ?auto_51480 ?auto_51477 )
      ( MAKE-2PILE ?auto_51475 ?auto_51476 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_51496 - BLOCK
      ?auto_51497 - BLOCK
    )
    :vars
    (
      ?auto_51502 - BLOCK
      ?auto_51498 - BLOCK
      ?auto_51500 - BLOCK
      ?auto_51499 - BLOCK
      ?auto_51501 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_51496 ) ( not ( = ?auto_51496 ?auto_51497 ) ) ( not ( = ?auto_51496 ?auto_51502 ) ) ( not ( = ?auto_51497 ?auto_51502 ) ) ( not ( = ?auto_51496 ?auto_51498 ) ) ( not ( = ?auto_51496 ?auto_51500 ) ) ( not ( = ?auto_51497 ?auto_51498 ) ) ( not ( = ?auto_51497 ?auto_51500 ) ) ( not ( = ?auto_51502 ?auto_51498 ) ) ( not ( = ?auto_51502 ?auto_51500 ) ) ( not ( = ?auto_51498 ?auto_51500 ) ) ( not ( = ?auto_51499 ?auto_51500 ) ) ( not ( = ?auto_51496 ?auto_51499 ) ) ( not ( = ?auto_51497 ?auto_51499 ) ) ( not ( = ?auto_51502 ?auto_51499 ) ) ( not ( = ?auto_51498 ?auto_51499 ) ) ( ON ?auto_51499 ?auto_51501 ) ( not ( = ?auto_51496 ?auto_51501 ) ) ( not ( = ?auto_51497 ?auto_51501 ) ) ( not ( = ?auto_51502 ?auto_51501 ) ) ( not ( = ?auto_51498 ?auto_51501 ) ) ( not ( = ?auto_51500 ?auto_51501 ) ) ( not ( = ?auto_51499 ?auto_51501 ) ) ( ON ?auto_51500 ?auto_51499 ) ( ON-TABLE ?auto_51501 ) ( ON ?auto_51498 ?auto_51500 ) ( ON ?auto_51502 ?auto_51498 ) ( CLEAR ?auto_51502 ) ( HOLDING ?auto_51497 ) ( CLEAR ?auto_51496 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_51496 ?auto_51497 ?auto_51502 )
      ( MAKE-2PILE ?auto_51496 ?auto_51497 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_51503 - BLOCK
      ?auto_51504 - BLOCK
    )
    :vars
    (
      ?auto_51506 - BLOCK
      ?auto_51508 - BLOCK
      ?auto_51509 - BLOCK
      ?auto_51507 - BLOCK
      ?auto_51505 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_51503 ) ( not ( = ?auto_51503 ?auto_51504 ) ) ( not ( = ?auto_51503 ?auto_51506 ) ) ( not ( = ?auto_51504 ?auto_51506 ) ) ( not ( = ?auto_51503 ?auto_51508 ) ) ( not ( = ?auto_51503 ?auto_51509 ) ) ( not ( = ?auto_51504 ?auto_51508 ) ) ( not ( = ?auto_51504 ?auto_51509 ) ) ( not ( = ?auto_51506 ?auto_51508 ) ) ( not ( = ?auto_51506 ?auto_51509 ) ) ( not ( = ?auto_51508 ?auto_51509 ) ) ( not ( = ?auto_51507 ?auto_51509 ) ) ( not ( = ?auto_51503 ?auto_51507 ) ) ( not ( = ?auto_51504 ?auto_51507 ) ) ( not ( = ?auto_51506 ?auto_51507 ) ) ( not ( = ?auto_51508 ?auto_51507 ) ) ( ON ?auto_51507 ?auto_51505 ) ( not ( = ?auto_51503 ?auto_51505 ) ) ( not ( = ?auto_51504 ?auto_51505 ) ) ( not ( = ?auto_51506 ?auto_51505 ) ) ( not ( = ?auto_51508 ?auto_51505 ) ) ( not ( = ?auto_51509 ?auto_51505 ) ) ( not ( = ?auto_51507 ?auto_51505 ) ) ( ON ?auto_51509 ?auto_51507 ) ( ON-TABLE ?auto_51505 ) ( ON ?auto_51508 ?auto_51509 ) ( ON ?auto_51506 ?auto_51508 ) ( CLEAR ?auto_51503 ) ( ON ?auto_51504 ?auto_51506 ) ( CLEAR ?auto_51504 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_51505 ?auto_51507 ?auto_51509 ?auto_51508 ?auto_51506 )
      ( MAKE-2PILE ?auto_51503 ?auto_51504 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_51510 - BLOCK
      ?auto_51511 - BLOCK
    )
    :vars
    (
      ?auto_51516 - BLOCK
      ?auto_51514 - BLOCK
      ?auto_51515 - BLOCK
      ?auto_51513 - BLOCK
      ?auto_51512 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_51510 ?auto_51511 ) ) ( not ( = ?auto_51510 ?auto_51516 ) ) ( not ( = ?auto_51511 ?auto_51516 ) ) ( not ( = ?auto_51510 ?auto_51514 ) ) ( not ( = ?auto_51510 ?auto_51515 ) ) ( not ( = ?auto_51511 ?auto_51514 ) ) ( not ( = ?auto_51511 ?auto_51515 ) ) ( not ( = ?auto_51516 ?auto_51514 ) ) ( not ( = ?auto_51516 ?auto_51515 ) ) ( not ( = ?auto_51514 ?auto_51515 ) ) ( not ( = ?auto_51513 ?auto_51515 ) ) ( not ( = ?auto_51510 ?auto_51513 ) ) ( not ( = ?auto_51511 ?auto_51513 ) ) ( not ( = ?auto_51516 ?auto_51513 ) ) ( not ( = ?auto_51514 ?auto_51513 ) ) ( ON ?auto_51513 ?auto_51512 ) ( not ( = ?auto_51510 ?auto_51512 ) ) ( not ( = ?auto_51511 ?auto_51512 ) ) ( not ( = ?auto_51516 ?auto_51512 ) ) ( not ( = ?auto_51514 ?auto_51512 ) ) ( not ( = ?auto_51515 ?auto_51512 ) ) ( not ( = ?auto_51513 ?auto_51512 ) ) ( ON ?auto_51515 ?auto_51513 ) ( ON-TABLE ?auto_51512 ) ( ON ?auto_51514 ?auto_51515 ) ( ON ?auto_51516 ?auto_51514 ) ( ON ?auto_51511 ?auto_51516 ) ( CLEAR ?auto_51511 ) ( HOLDING ?auto_51510 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_51510 )
      ( MAKE-2PILE ?auto_51510 ?auto_51511 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_51517 - BLOCK
      ?auto_51518 - BLOCK
    )
    :vars
    (
      ?auto_51520 - BLOCK
      ?auto_51521 - BLOCK
      ?auto_51519 - BLOCK
      ?auto_51523 - BLOCK
      ?auto_51522 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_51517 ?auto_51518 ) ) ( not ( = ?auto_51517 ?auto_51520 ) ) ( not ( = ?auto_51518 ?auto_51520 ) ) ( not ( = ?auto_51517 ?auto_51521 ) ) ( not ( = ?auto_51517 ?auto_51519 ) ) ( not ( = ?auto_51518 ?auto_51521 ) ) ( not ( = ?auto_51518 ?auto_51519 ) ) ( not ( = ?auto_51520 ?auto_51521 ) ) ( not ( = ?auto_51520 ?auto_51519 ) ) ( not ( = ?auto_51521 ?auto_51519 ) ) ( not ( = ?auto_51523 ?auto_51519 ) ) ( not ( = ?auto_51517 ?auto_51523 ) ) ( not ( = ?auto_51518 ?auto_51523 ) ) ( not ( = ?auto_51520 ?auto_51523 ) ) ( not ( = ?auto_51521 ?auto_51523 ) ) ( ON ?auto_51523 ?auto_51522 ) ( not ( = ?auto_51517 ?auto_51522 ) ) ( not ( = ?auto_51518 ?auto_51522 ) ) ( not ( = ?auto_51520 ?auto_51522 ) ) ( not ( = ?auto_51521 ?auto_51522 ) ) ( not ( = ?auto_51519 ?auto_51522 ) ) ( not ( = ?auto_51523 ?auto_51522 ) ) ( ON ?auto_51519 ?auto_51523 ) ( ON-TABLE ?auto_51522 ) ( ON ?auto_51521 ?auto_51519 ) ( ON ?auto_51520 ?auto_51521 ) ( ON ?auto_51518 ?auto_51520 ) ( ON ?auto_51517 ?auto_51518 ) ( CLEAR ?auto_51517 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_51522 ?auto_51523 ?auto_51519 ?auto_51521 ?auto_51520 ?auto_51518 )
      ( MAKE-2PILE ?auto_51517 ?auto_51518 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_51528 - BLOCK
      ?auto_51529 - BLOCK
      ?auto_51530 - BLOCK
      ?auto_51531 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_51531 ) ( CLEAR ?auto_51530 ) ( ON-TABLE ?auto_51528 ) ( ON ?auto_51529 ?auto_51528 ) ( ON ?auto_51530 ?auto_51529 ) ( not ( = ?auto_51528 ?auto_51529 ) ) ( not ( = ?auto_51528 ?auto_51530 ) ) ( not ( = ?auto_51528 ?auto_51531 ) ) ( not ( = ?auto_51529 ?auto_51530 ) ) ( not ( = ?auto_51529 ?auto_51531 ) ) ( not ( = ?auto_51530 ?auto_51531 ) ) )
    :subtasks
    ( ( !STACK ?auto_51531 ?auto_51530 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_51532 - BLOCK
      ?auto_51533 - BLOCK
      ?auto_51534 - BLOCK
      ?auto_51535 - BLOCK
    )
    :vars
    (
      ?auto_51536 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_51534 ) ( ON-TABLE ?auto_51532 ) ( ON ?auto_51533 ?auto_51532 ) ( ON ?auto_51534 ?auto_51533 ) ( not ( = ?auto_51532 ?auto_51533 ) ) ( not ( = ?auto_51532 ?auto_51534 ) ) ( not ( = ?auto_51532 ?auto_51535 ) ) ( not ( = ?auto_51533 ?auto_51534 ) ) ( not ( = ?auto_51533 ?auto_51535 ) ) ( not ( = ?auto_51534 ?auto_51535 ) ) ( ON ?auto_51535 ?auto_51536 ) ( CLEAR ?auto_51535 ) ( HAND-EMPTY ) ( not ( = ?auto_51532 ?auto_51536 ) ) ( not ( = ?auto_51533 ?auto_51536 ) ) ( not ( = ?auto_51534 ?auto_51536 ) ) ( not ( = ?auto_51535 ?auto_51536 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_51535 ?auto_51536 )
      ( MAKE-4PILE ?auto_51532 ?auto_51533 ?auto_51534 ?auto_51535 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_51537 - BLOCK
      ?auto_51538 - BLOCK
      ?auto_51539 - BLOCK
      ?auto_51540 - BLOCK
    )
    :vars
    (
      ?auto_51541 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_51537 ) ( ON ?auto_51538 ?auto_51537 ) ( not ( = ?auto_51537 ?auto_51538 ) ) ( not ( = ?auto_51537 ?auto_51539 ) ) ( not ( = ?auto_51537 ?auto_51540 ) ) ( not ( = ?auto_51538 ?auto_51539 ) ) ( not ( = ?auto_51538 ?auto_51540 ) ) ( not ( = ?auto_51539 ?auto_51540 ) ) ( ON ?auto_51540 ?auto_51541 ) ( CLEAR ?auto_51540 ) ( not ( = ?auto_51537 ?auto_51541 ) ) ( not ( = ?auto_51538 ?auto_51541 ) ) ( not ( = ?auto_51539 ?auto_51541 ) ) ( not ( = ?auto_51540 ?auto_51541 ) ) ( HOLDING ?auto_51539 ) ( CLEAR ?auto_51538 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_51537 ?auto_51538 ?auto_51539 )
      ( MAKE-4PILE ?auto_51537 ?auto_51538 ?auto_51539 ?auto_51540 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_51542 - BLOCK
      ?auto_51543 - BLOCK
      ?auto_51544 - BLOCK
      ?auto_51545 - BLOCK
    )
    :vars
    (
      ?auto_51546 - BLOCK
      ?auto_51547 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_51542 ) ( ON ?auto_51543 ?auto_51542 ) ( not ( = ?auto_51542 ?auto_51543 ) ) ( not ( = ?auto_51542 ?auto_51544 ) ) ( not ( = ?auto_51542 ?auto_51545 ) ) ( not ( = ?auto_51543 ?auto_51544 ) ) ( not ( = ?auto_51543 ?auto_51545 ) ) ( not ( = ?auto_51544 ?auto_51545 ) ) ( ON ?auto_51545 ?auto_51546 ) ( not ( = ?auto_51542 ?auto_51546 ) ) ( not ( = ?auto_51543 ?auto_51546 ) ) ( not ( = ?auto_51544 ?auto_51546 ) ) ( not ( = ?auto_51545 ?auto_51546 ) ) ( CLEAR ?auto_51543 ) ( ON ?auto_51544 ?auto_51545 ) ( CLEAR ?auto_51544 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_51547 ) ( ON ?auto_51546 ?auto_51547 ) ( not ( = ?auto_51547 ?auto_51546 ) ) ( not ( = ?auto_51547 ?auto_51545 ) ) ( not ( = ?auto_51547 ?auto_51544 ) ) ( not ( = ?auto_51542 ?auto_51547 ) ) ( not ( = ?auto_51543 ?auto_51547 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_51547 ?auto_51546 ?auto_51545 )
      ( MAKE-4PILE ?auto_51542 ?auto_51543 ?auto_51544 ?auto_51545 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_51548 - BLOCK
      ?auto_51549 - BLOCK
      ?auto_51550 - BLOCK
      ?auto_51551 - BLOCK
    )
    :vars
    (
      ?auto_51553 - BLOCK
      ?auto_51552 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_51548 ) ( not ( = ?auto_51548 ?auto_51549 ) ) ( not ( = ?auto_51548 ?auto_51550 ) ) ( not ( = ?auto_51548 ?auto_51551 ) ) ( not ( = ?auto_51549 ?auto_51550 ) ) ( not ( = ?auto_51549 ?auto_51551 ) ) ( not ( = ?auto_51550 ?auto_51551 ) ) ( ON ?auto_51551 ?auto_51553 ) ( not ( = ?auto_51548 ?auto_51553 ) ) ( not ( = ?auto_51549 ?auto_51553 ) ) ( not ( = ?auto_51550 ?auto_51553 ) ) ( not ( = ?auto_51551 ?auto_51553 ) ) ( ON ?auto_51550 ?auto_51551 ) ( CLEAR ?auto_51550 ) ( ON-TABLE ?auto_51552 ) ( ON ?auto_51553 ?auto_51552 ) ( not ( = ?auto_51552 ?auto_51553 ) ) ( not ( = ?auto_51552 ?auto_51551 ) ) ( not ( = ?auto_51552 ?auto_51550 ) ) ( not ( = ?auto_51548 ?auto_51552 ) ) ( not ( = ?auto_51549 ?auto_51552 ) ) ( HOLDING ?auto_51549 ) ( CLEAR ?auto_51548 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_51548 ?auto_51549 )
      ( MAKE-4PILE ?auto_51548 ?auto_51549 ?auto_51550 ?auto_51551 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_51554 - BLOCK
      ?auto_51555 - BLOCK
      ?auto_51556 - BLOCK
      ?auto_51557 - BLOCK
    )
    :vars
    (
      ?auto_51558 - BLOCK
      ?auto_51559 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_51554 ) ( not ( = ?auto_51554 ?auto_51555 ) ) ( not ( = ?auto_51554 ?auto_51556 ) ) ( not ( = ?auto_51554 ?auto_51557 ) ) ( not ( = ?auto_51555 ?auto_51556 ) ) ( not ( = ?auto_51555 ?auto_51557 ) ) ( not ( = ?auto_51556 ?auto_51557 ) ) ( ON ?auto_51557 ?auto_51558 ) ( not ( = ?auto_51554 ?auto_51558 ) ) ( not ( = ?auto_51555 ?auto_51558 ) ) ( not ( = ?auto_51556 ?auto_51558 ) ) ( not ( = ?auto_51557 ?auto_51558 ) ) ( ON ?auto_51556 ?auto_51557 ) ( ON-TABLE ?auto_51559 ) ( ON ?auto_51558 ?auto_51559 ) ( not ( = ?auto_51559 ?auto_51558 ) ) ( not ( = ?auto_51559 ?auto_51557 ) ) ( not ( = ?auto_51559 ?auto_51556 ) ) ( not ( = ?auto_51554 ?auto_51559 ) ) ( not ( = ?auto_51555 ?auto_51559 ) ) ( CLEAR ?auto_51554 ) ( ON ?auto_51555 ?auto_51556 ) ( CLEAR ?auto_51555 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_51559 ?auto_51558 ?auto_51557 ?auto_51556 )
      ( MAKE-4PILE ?auto_51554 ?auto_51555 ?auto_51556 ?auto_51557 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_51560 - BLOCK
      ?auto_51561 - BLOCK
      ?auto_51562 - BLOCK
      ?auto_51563 - BLOCK
    )
    :vars
    (
      ?auto_51564 - BLOCK
      ?auto_51565 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_51560 ?auto_51561 ) ) ( not ( = ?auto_51560 ?auto_51562 ) ) ( not ( = ?auto_51560 ?auto_51563 ) ) ( not ( = ?auto_51561 ?auto_51562 ) ) ( not ( = ?auto_51561 ?auto_51563 ) ) ( not ( = ?auto_51562 ?auto_51563 ) ) ( ON ?auto_51563 ?auto_51564 ) ( not ( = ?auto_51560 ?auto_51564 ) ) ( not ( = ?auto_51561 ?auto_51564 ) ) ( not ( = ?auto_51562 ?auto_51564 ) ) ( not ( = ?auto_51563 ?auto_51564 ) ) ( ON ?auto_51562 ?auto_51563 ) ( ON-TABLE ?auto_51565 ) ( ON ?auto_51564 ?auto_51565 ) ( not ( = ?auto_51565 ?auto_51564 ) ) ( not ( = ?auto_51565 ?auto_51563 ) ) ( not ( = ?auto_51565 ?auto_51562 ) ) ( not ( = ?auto_51560 ?auto_51565 ) ) ( not ( = ?auto_51561 ?auto_51565 ) ) ( ON ?auto_51561 ?auto_51562 ) ( CLEAR ?auto_51561 ) ( HOLDING ?auto_51560 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_51560 )
      ( MAKE-4PILE ?auto_51560 ?auto_51561 ?auto_51562 ?auto_51563 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_51566 - BLOCK
      ?auto_51567 - BLOCK
      ?auto_51568 - BLOCK
      ?auto_51569 - BLOCK
    )
    :vars
    (
      ?auto_51571 - BLOCK
      ?auto_51570 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_51566 ?auto_51567 ) ) ( not ( = ?auto_51566 ?auto_51568 ) ) ( not ( = ?auto_51566 ?auto_51569 ) ) ( not ( = ?auto_51567 ?auto_51568 ) ) ( not ( = ?auto_51567 ?auto_51569 ) ) ( not ( = ?auto_51568 ?auto_51569 ) ) ( ON ?auto_51569 ?auto_51571 ) ( not ( = ?auto_51566 ?auto_51571 ) ) ( not ( = ?auto_51567 ?auto_51571 ) ) ( not ( = ?auto_51568 ?auto_51571 ) ) ( not ( = ?auto_51569 ?auto_51571 ) ) ( ON ?auto_51568 ?auto_51569 ) ( ON-TABLE ?auto_51570 ) ( ON ?auto_51571 ?auto_51570 ) ( not ( = ?auto_51570 ?auto_51571 ) ) ( not ( = ?auto_51570 ?auto_51569 ) ) ( not ( = ?auto_51570 ?auto_51568 ) ) ( not ( = ?auto_51566 ?auto_51570 ) ) ( not ( = ?auto_51567 ?auto_51570 ) ) ( ON ?auto_51567 ?auto_51568 ) ( ON ?auto_51566 ?auto_51567 ) ( CLEAR ?auto_51566 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_51570 ?auto_51571 ?auto_51569 ?auto_51568 ?auto_51567 )
      ( MAKE-4PILE ?auto_51566 ?auto_51567 ?auto_51568 ?auto_51569 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_51572 - BLOCK
      ?auto_51573 - BLOCK
      ?auto_51574 - BLOCK
      ?auto_51575 - BLOCK
    )
    :vars
    (
      ?auto_51576 - BLOCK
      ?auto_51577 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_51572 ?auto_51573 ) ) ( not ( = ?auto_51572 ?auto_51574 ) ) ( not ( = ?auto_51572 ?auto_51575 ) ) ( not ( = ?auto_51573 ?auto_51574 ) ) ( not ( = ?auto_51573 ?auto_51575 ) ) ( not ( = ?auto_51574 ?auto_51575 ) ) ( ON ?auto_51575 ?auto_51576 ) ( not ( = ?auto_51572 ?auto_51576 ) ) ( not ( = ?auto_51573 ?auto_51576 ) ) ( not ( = ?auto_51574 ?auto_51576 ) ) ( not ( = ?auto_51575 ?auto_51576 ) ) ( ON ?auto_51574 ?auto_51575 ) ( ON-TABLE ?auto_51577 ) ( ON ?auto_51576 ?auto_51577 ) ( not ( = ?auto_51577 ?auto_51576 ) ) ( not ( = ?auto_51577 ?auto_51575 ) ) ( not ( = ?auto_51577 ?auto_51574 ) ) ( not ( = ?auto_51572 ?auto_51577 ) ) ( not ( = ?auto_51573 ?auto_51577 ) ) ( ON ?auto_51573 ?auto_51574 ) ( HOLDING ?auto_51572 ) ( CLEAR ?auto_51573 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_51577 ?auto_51576 ?auto_51575 ?auto_51574 ?auto_51573 ?auto_51572 )
      ( MAKE-4PILE ?auto_51572 ?auto_51573 ?auto_51574 ?auto_51575 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_51578 - BLOCK
      ?auto_51579 - BLOCK
      ?auto_51580 - BLOCK
      ?auto_51581 - BLOCK
    )
    :vars
    (
      ?auto_51583 - BLOCK
      ?auto_51582 - BLOCK
      ?auto_51584 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_51578 ?auto_51579 ) ) ( not ( = ?auto_51578 ?auto_51580 ) ) ( not ( = ?auto_51578 ?auto_51581 ) ) ( not ( = ?auto_51579 ?auto_51580 ) ) ( not ( = ?auto_51579 ?auto_51581 ) ) ( not ( = ?auto_51580 ?auto_51581 ) ) ( ON ?auto_51581 ?auto_51583 ) ( not ( = ?auto_51578 ?auto_51583 ) ) ( not ( = ?auto_51579 ?auto_51583 ) ) ( not ( = ?auto_51580 ?auto_51583 ) ) ( not ( = ?auto_51581 ?auto_51583 ) ) ( ON ?auto_51580 ?auto_51581 ) ( ON-TABLE ?auto_51582 ) ( ON ?auto_51583 ?auto_51582 ) ( not ( = ?auto_51582 ?auto_51583 ) ) ( not ( = ?auto_51582 ?auto_51581 ) ) ( not ( = ?auto_51582 ?auto_51580 ) ) ( not ( = ?auto_51578 ?auto_51582 ) ) ( not ( = ?auto_51579 ?auto_51582 ) ) ( ON ?auto_51579 ?auto_51580 ) ( CLEAR ?auto_51579 ) ( ON ?auto_51578 ?auto_51584 ) ( CLEAR ?auto_51578 ) ( HAND-EMPTY ) ( not ( = ?auto_51578 ?auto_51584 ) ) ( not ( = ?auto_51579 ?auto_51584 ) ) ( not ( = ?auto_51580 ?auto_51584 ) ) ( not ( = ?auto_51581 ?auto_51584 ) ) ( not ( = ?auto_51583 ?auto_51584 ) ) ( not ( = ?auto_51582 ?auto_51584 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_51578 ?auto_51584 )
      ( MAKE-4PILE ?auto_51578 ?auto_51579 ?auto_51580 ?auto_51581 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_51585 - BLOCK
      ?auto_51586 - BLOCK
      ?auto_51587 - BLOCK
      ?auto_51588 - BLOCK
    )
    :vars
    (
      ?auto_51591 - BLOCK
      ?auto_51590 - BLOCK
      ?auto_51589 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_51585 ?auto_51586 ) ) ( not ( = ?auto_51585 ?auto_51587 ) ) ( not ( = ?auto_51585 ?auto_51588 ) ) ( not ( = ?auto_51586 ?auto_51587 ) ) ( not ( = ?auto_51586 ?auto_51588 ) ) ( not ( = ?auto_51587 ?auto_51588 ) ) ( ON ?auto_51588 ?auto_51591 ) ( not ( = ?auto_51585 ?auto_51591 ) ) ( not ( = ?auto_51586 ?auto_51591 ) ) ( not ( = ?auto_51587 ?auto_51591 ) ) ( not ( = ?auto_51588 ?auto_51591 ) ) ( ON ?auto_51587 ?auto_51588 ) ( ON-TABLE ?auto_51590 ) ( ON ?auto_51591 ?auto_51590 ) ( not ( = ?auto_51590 ?auto_51591 ) ) ( not ( = ?auto_51590 ?auto_51588 ) ) ( not ( = ?auto_51590 ?auto_51587 ) ) ( not ( = ?auto_51585 ?auto_51590 ) ) ( not ( = ?auto_51586 ?auto_51590 ) ) ( ON ?auto_51585 ?auto_51589 ) ( CLEAR ?auto_51585 ) ( not ( = ?auto_51585 ?auto_51589 ) ) ( not ( = ?auto_51586 ?auto_51589 ) ) ( not ( = ?auto_51587 ?auto_51589 ) ) ( not ( = ?auto_51588 ?auto_51589 ) ) ( not ( = ?auto_51591 ?auto_51589 ) ) ( not ( = ?auto_51590 ?auto_51589 ) ) ( HOLDING ?auto_51586 ) ( CLEAR ?auto_51587 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_51590 ?auto_51591 ?auto_51588 ?auto_51587 ?auto_51586 )
      ( MAKE-4PILE ?auto_51585 ?auto_51586 ?auto_51587 ?auto_51588 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_51592 - BLOCK
      ?auto_51593 - BLOCK
      ?auto_51594 - BLOCK
      ?auto_51595 - BLOCK
    )
    :vars
    (
      ?auto_51597 - BLOCK
      ?auto_51598 - BLOCK
      ?auto_51596 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_51592 ?auto_51593 ) ) ( not ( = ?auto_51592 ?auto_51594 ) ) ( not ( = ?auto_51592 ?auto_51595 ) ) ( not ( = ?auto_51593 ?auto_51594 ) ) ( not ( = ?auto_51593 ?auto_51595 ) ) ( not ( = ?auto_51594 ?auto_51595 ) ) ( ON ?auto_51595 ?auto_51597 ) ( not ( = ?auto_51592 ?auto_51597 ) ) ( not ( = ?auto_51593 ?auto_51597 ) ) ( not ( = ?auto_51594 ?auto_51597 ) ) ( not ( = ?auto_51595 ?auto_51597 ) ) ( ON ?auto_51594 ?auto_51595 ) ( ON-TABLE ?auto_51598 ) ( ON ?auto_51597 ?auto_51598 ) ( not ( = ?auto_51598 ?auto_51597 ) ) ( not ( = ?auto_51598 ?auto_51595 ) ) ( not ( = ?auto_51598 ?auto_51594 ) ) ( not ( = ?auto_51592 ?auto_51598 ) ) ( not ( = ?auto_51593 ?auto_51598 ) ) ( ON ?auto_51592 ?auto_51596 ) ( not ( = ?auto_51592 ?auto_51596 ) ) ( not ( = ?auto_51593 ?auto_51596 ) ) ( not ( = ?auto_51594 ?auto_51596 ) ) ( not ( = ?auto_51595 ?auto_51596 ) ) ( not ( = ?auto_51597 ?auto_51596 ) ) ( not ( = ?auto_51598 ?auto_51596 ) ) ( CLEAR ?auto_51594 ) ( ON ?auto_51593 ?auto_51592 ) ( CLEAR ?auto_51593 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_51596 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_51596 ?auto_51592 )
      ( MAKE-4PILE ?auto_51592 ?auto_51593 ?auto_51594 ?auto_51595 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_51599 - BLOCK
      ?auto_51600 - BLOCK
      ?auto_51601 - BLOCK
      ?auto_51602 - BLOCK
    )
    :vars
    (
      ?auto_51604 - BLOCK
      ?auto_51603 - BLOCK
      ?auto_51605 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_51599 ?auto_51600 ) ) ( not ( = ?auto_51599 ?auto_51601 ) ) ( not ( = ?auto_51599 ?auto_51602 ) ) ( not ( = ?auto_51600 ?auto_51601 ) ) ( not ( = ?auto_51600 ?auto_51602 ) ) ( not ( = ?auto_51601 ?auto_51602 ) ) ( ON ?auto_51602 ?auto_51604 ) ( not ( = ?auto_51599 ?auto_51604 ) ) ( not ( = ?auto_51600 ?auto_51604 ) ) ( not ( = ?auto_51601 ?auto_51604 ) ) ( not ( = ?auto_51602 ?auto_51604 ) ) ( ON-TABLE ?auto_51603 ) ( ON ?auto_51604 ?auto_51603 ) ( not ( = ?auto_51603 ?auto_51604 ) ) ( not ( = ?auto_51603 ?auto_51602 ) ) ( not ( = ?auto_51603 ?auto_51601 ) ) ( not ( = ?auto_51599 ?auto_51603 ) ) ( not ( = ?auto_51600 ?auto_51603 ) ) ( ON ?auto_51599 ?auto_51605 ) ( not ( = ?auto_51599 ?auto_51605 ) ) ( not ( = ?auto_51600 ?auto_51605 ) ) ( not ( = ?auto_51601 ?auto_51605 ) ) ( not ( = ?auto_51602 ?auto_51605 ) ) ( not ( = ?auto_51604 ?auto_51605 ) ) ( not ( = ?auto_51603 ?auto_51605 ) ) ( ON ?auto_51600 ?auto_51599 ) ( CLEAR ?auto_51600 ) ( ON-TABLE ?auto_51605 ) ( HOLDING ?auto_51601 ) ( CLEAR ?auto_51602 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_51603 ?auto_51604 ?auto_51602 ?auto_51601 )
      ( MAKE-4PILE ?auto_51599 ?auto_51600 ?auto_51601 ?auto_51602 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_51606 - BLOCK
      ?auto_51607 - BLOCK
      ?auto_51608 - BLOCK
      ?auto_51609 - BLOCK
    )
    :vars
    (
      ?auto_51610 - BLOCK
      ?auto_51611 - BLOCK
      ?auto_51612 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_51606 ?auto_51607 ) ) ( not ( = ?auto_51606 ?auto_51608 ) ) ( not ( = ?auto_51606 ?auto_51609 ) ) ( not ( = ?auto_51607 ?auto_51608 ) ) ( not ( = ?auto_51607 ?auto_51609 ) ) ( not ( = ?auto_51608 ?auto_51609 ) ) ( ON ?auto_51609 ?auto_51610 ) ( not ( = ?auto_51606 ?auto_51610 ) ) ( not ( = ?auto_51607 ?auto_51610 ) ) ( not ( = ?auto_51608 ?auto_51610 ) ) ( not ( = ?auto_51609 ?auto_51610 ) ) ( ON-TABLE ?auto_51611 ) ( ON ?auto_51610 ?auto_51611 ) ( not ( = ?auto_51611 ?auto_51610 ) ) ( not ( = ?auto_51611 ?auto_51609 ) ) ( not ( = ?auto_51611 ?auto_51608 ) ) ( not ( = ?auto_51606 ?auto_51611 ) ) ( not ( = ?auto_51607 ?auto_51611 ) ) ( ON ?auto_51606 ?auto_51612 ) ( not ( = ?auto_51606 ?auto_51612 ) ) ( not ( = ?auto_51607 ?auto_51612 ) ) ( not ( = ?auto_51608 ?auto_51612 ) ) ( not ( = ?auto_51609 ?auto_51612 ) ) ( not ( = ?auto_51610 ?auto_51612 ) ) ( not ( = ?auto_51611 ?auto_51612 ) ) ( ON ?auto_51607 ?auto_51606 ) ( ON-TABLE ?auto_51612 ) ( CLEAR ?auto_51609 ) ( ON ?auto_51608 ?auto_51607 ) ( CLEAR ?auto_51608 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_51612 ?auto_51606 ?auto_51607 )
      ( MAKE-4PILE ?auto_51606 ?auto_51607 ?auto_51608 ?auto_51609 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_51613 - BLOCK
      ?auto_51614 - BLOCK
      ?auto_51615 - BLOCK
      ?auto_51616 - BLOCK
    )
    :vars
    (
      ?auto_51617 - BLOCK
      ?auto_51619 - BLOCK
      ?auto_51618 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_51613 ?auto_51614 ) ) ( not ( = ?auto_51613 ?auto_51615 ) ) ( not ( = ?auto_51613 ?auto_51616 ) ) ( not ( = ?auto_51614 ?auto_51615 ) ) ( not ( = ?auto_51614 ?auto_51616 ) ) ( not ( = ?auto_51615 ?auto_51616 ) ) ( not ( = ?auto_51613 ?auto_51617 ) ) ( not ( = ?auto_51614 ?auto_51617 ) ) ( not ( = ?auto_51615 ?auto_51617 ) ) ( not ( = ?auto_51616 ?auto_51617 ) ) ( ON-TABLE ?auto_51619 ) ( ON ?auto_51617 ?auto_51619 ) ( not ( = ?auto_51619 ?auto_51617 ) ) ( not ( = ?auto_51619 ?auto_51616 ) ) ( not ( = ?auto_51619 ?auto_51615 ) ) ( not ( = ?auto_51613 ?auto_51619 ) ) ( not ( = ?auto_51614 ?auto_51619 ) ) ( ON ?auto_51613 ?auto_51618 ) ( not ( = ?auto_51613 ?auto_51618 ) ) ( not ( = ?auto_51614 ?auto_51618 ) ) ( not ( = ?auto_51615 ?auto_51618 ) ) ( not ( = ?auto_51616 ?auto_51618 ) ) ( not ( = ?auto_51617 ?auto_51618 ) ) ( not ( = ?auto_51619 ?auto_51618 ) ) ( ON ?auto_51614 ?auto_51613 ) ( ON-TABLE ?auto_51618 ) ( ON ?auto_51615 ?auto_51614 ) ( CLEAR ?auto_51615 ) ( HOLDING ?auto_51616 ) ( CLEAR ?auto_51617 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_51619 ?auto_51617 ?auto_51616 )
      ( MAKE-4PILE ?auto_51613 ?auto_51614 ?auto_51615 ?auto_51616 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_51620 - BLOCK
      ?auto_51621 - BLOCK
      ?auto_51622 - BLOCK
      ?auto_51623 - BLOCK
    )
    :vars
    (
      ?auto_51624 - BLOCK
      ?auto_51626 - BLOCK
      ?auto_51625 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_51620 ?auto_51621 ) ) ( not ( = ?auto_51620 ?auto_51622 ) ) ( not ( = ?auto_51620 ?auto_51623 ) ) ( not ( = ?auto_51621 ?auto_51622 ) ) ( not ( = ?auto_51621 ?auto_51623 ) ) ( not ( = ?auto_51622 ?auto_51623 ) ) ( not ( = ?auto_51620 ?auto_51624 ) ) ( not ( = ?auto_51621 ?auto_51624 ) ) ( not ( = ?auto_51622 ?auto_51624 ) ) ( not ( = ?auto_51623 ?auto_51624 ) ) ( ON-TABLE ?auto_51626 ) ( ON ?auto_51624 ?auto_51626 ) ( not ( = ?auto_51626 ?auto_51624 ) ) ( not ( = ?auto_51626 ?auto_51623 ) ) ( not ( = ?auto_51626 ?auto_51622 ) ) ( not ( = ?auto_51620 ?auto_51626 ) ) ( not ( = ?auto_51621 ?auto_51626 ) ) ( ON ?auto_51620 ?auto_51625 ) ( not ( = ?auto_51620 ?auto_51625 ) ) ( not ( = ?auto_51621 ?auto_51625 ) ) ( not ( = ?auto_51622 ?auto_51625 ) ) ( not ( = ?auto_51623 ?auto_51625 ) ) ( not ( = ?auto_51624 ?auto_51625 ) ) ( not ( = ?auto_51626 ?auto_51625 ) ) ( ON ?auto_51621 ?auto_51620 ) ( ON-TABLE ?auto_51625 ) ( ON ?auto_51622 ?auto_51621 ) ( CLEAR ?auto_51624 ) ( ON ?auto_51623 ?auto_51622 ) ( CLEAR ?auto_51623 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_51625 ?auto_51620 ?auto_51621 ?auto_51622 )
      ( MAKE-4PILE ?auto_51620 ?auto_51621 ?auto_51622 ?auto_51623 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_51627 - BLOCK
      ?auto_51628 - BLOCK
      ?auto_51629 - BLOCK
      ?auto_51630 - BLOCK
    )
    :vars
    (
      ?auto_51631 - BLOCK
      ?auto_51633 - BLOCK
      ?auto_51632 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_51627 ?auto_51628 ) ) ( not ( = ?auto_51627 ?auto_51629 ) ) ( not ( = ?auto_51627 ?auto_51630 ) ) ( not ( = ?auto_51628 ?auto_51629 ) ) ( not ( = ?auto_51628 ?auto_51630 ) ) ( not ( = ?auto_51629 ?auto_51630 ) ) ( not ( = ?auto_51627 ?auto_51631 ) ) ( not ( = ?auto_51628 ?auto_51631 ) ) ( not ( = ?auto_51629 ?auto_51631 ) ) ( not ( = ?auto_51630 ?auto_51631 ) ) ( ON-TABLE ?auto_51633 ) ( not ( = ?auto_51633 ?auto_51631 ) ) ( not ( = ?auto_51633 ?auto_51630 ) ) ( not ( = ?auto_51633 ?auto_51629 ) ) ( not ( = ?auto_51627 ?auto_51633 ) ) ( not ( = ?auto_51628 ?auto_51633 ) ) ( ON ?auto_51627 ?auto_51632 ) ( not ( = ?auto_51627 ?auto_51632 ) ) ( not ( = ?auto_51628 ?auto_51632 ) ) ( not ( = ?auto_51629 ?auto_51632 ) ) ( not ( = ?auto_51630 ?auto_51632 ) ) ( not ( = ?auto_51631 ?auto_51632 ) ) ( not ( = ?auto_51633 ?auto_51632 ) ) ( ON ?auto_51628 ?auto_51627 ) ( ON-TABLE ?auto_51632 ) ( ON ?auto_51629 ?auto_51628 ) ( ON ?auto_51630 ?auto_51629 ) ( CLEAR ?auto_51630 ) ( HOLDING ?auto_51631 ) ( CLEAR ?auto_51633 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_51633 ?auto_51631 )
      ( MAKE-4PILE ?auto_51627 ?auto_51628 ?auto_51629 ?auto_51630 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_51634 - BLOCK
      ?auto_51635 - BLOCK
      ?auto_51636 - BLOCK
      ?auto_51637 - BLOCK
    )
    :vars
    (
      ?auto_51639 - BLOCK
      ?auto_51638 - BLOCK
      ?auto_51640 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_51634 ?auto_51635 ) ) ( not ( = ?auto_51634 ?auto_51636 ) ) ( not ( = ?auto_51634 ?auto_51637 ) ) ( not ( = ?auto_51635 ?auto_51636 ) ) ( not ( = ?auto_51635 ?auto_51637 ) ) ( not ( = ?auto_51636 ?auto_51637 ) ) ( not ( = ?auto_51634 ?auto_51639 ) ) ( not ( = ?auto_51635 ?auto_51639 ) ) ( not ( = ?auto_51636 ?auto_51639 ) ) ( not ( = ?auto_51637 ?auto_51639 ) ) ( ON-TABLE ?auto_51638 ) ( not ( = ?auto_51638 ?auto_51639 ) ) ( not ( = ?auto_51638 ?auto_51637 ) ) ( not ( = ?auto_51638 ?auto_51636 ) ) ( not ( = ?auto_51634 ?auto_51638 ) ) ( not ( = ?auto_51635 ?auto_51638 ) ) ( ON ?auto_51634 ?auto_51640 ) ( not ( = ?auto_51634 ?auto_51640 ) ) ( not ( = ?auto_51635 ?auto_51640 ) ) ( not ( = ?auto_51636 ?auto_51640 ) ) ( not ( = ?auto_51637 ?auto_51640 ) ) ( not ( = ?auto_51639 ?auto_51640 ) ) ( not ( = ?auto_51638 ?auto_51640 ) ) ( ON ?auto_51635 ?auto_51634 ) ( ON-TABLE ?auto_51640 ) ( ON ?auto_51636 ?auto_51635 ) ( ON ?auto_51637 ?auto_51636 ) ( CLEAR ?auto_51638 ) ( ON ?auto_51639 ?auto_51637 ) ( CLEAR ?auto_51639 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_51640 ?auto_51634 ?auto_51635 ?auto_51636 ?auto_51637 )
      ( MAKE-4PILE ?auto_51634 ?auto_51635 ?auto_51636 ?auto_51637 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_51641 - BLOCK
      ?auto_51642 - BLOCK
      ?auto_51643 - BLOCK
      ?auto_51644 - BLOCK
    )
    :vars
    (
      ?auto_51647 - BLOCK
      ?auto_51645 - BLOCK
      ?auto_51646 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_51641 ?auto_51642 ) ) ( not ( = ?auto_51641 ?auto_51643 ) ) ( not ( = ?auto_51641 ?auto_51644 ) ) ( not ( = ?auto_51642 ?auto_51643 ) ) ( not ( = ?auto_51642 ?auto_51644 ) ) ( not ( = ?auto_51643 ?auto_51644 ) ) ( not ( = ?auto_51641 ?auto_51647 ) ) ( not ( = ?auto_51642 ?auto_51647 ) ) ( not ( = ?auto_51643 ?auto_51647 ) ) ( not ( = ?auto_51644 ?auto_51647 ) ) ( not ( = ?auto_51645 ?auto_51647 ) ) ( not ( = ?auto_51645 ?auto_51644 ) ) ( not ( = ?auto_51645 ?auto_51643 ) ) ( not ( = ?auto_51641 ?auto_51645 ) ) ( not ( = ?auto_51642 ?auto_51645 ) ) ( ON ?auto_51641 ?auto_51646 ) ( not ( = ?auto_51641 ?auto_51646 ) ) ( not ( = ?auto_51642 ?auto_51646 ) ) ( not ( = ?auto_51643 ?auto_51646 ) ) ( not ( = ?auto_51644 ?auto_51646 ) ) ( not ( = ?auto_51647 ?auto_51646 ) ) ( not ( = ?auto_51645 ?auto_51646 ) ) ( ON ?auto_51642 ?auto_51641 ) ( ON-TABLE ?auto_51646 ) ( ON ?auto_51643 ?auto_51642 ) ( ON ?auto_51644 ?auto_51643 ) ( ON ?auto_51647 ?auto_51644 ) ( CLEAR ?auto_51647 ) ( HOLDING ?auto_51645 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_51645 )
      ( MAKE-4PILE ?auto_51641 ?auto_51642 ?auto_51643 ?auto_51644 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_51648 - BLOCK
      ?auto_51649 - BLOCK
      ?auto_51650 - BLOCK
      ?auto_51651 - BLOCK
    )
    :vars
    (
      ?auto_51654 - BLOCK
      ?auto_51652 - BLOCK
      ?auto_51653 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_51648 ?auto_51649 ) ) ( not ( = ?auto_51648 ?auto_51650 ) ) ( not ( = ?auto_51648 ?auto_51651 ) ) ( not ( = ?auto_51649 ?auto_51650 ) ) ( not ( = ?auto_51649 ?auto_51651 ) ) ( not ( = ?auto_51650 ?auto_51651 ) ) ( not ( = ?auto_51648 ?auto_51654 ) ) ( not ( = ?auto_51649 ?auto_51654 ) ) ( not ( = ?auto_51650 ?auto_51654 ) ) ( not ( = ?auto_51651 ?auto_51654 ) ) ( not ( = ?auto_51652 ?auto_51654 ) ) ( not ( = ?auto_51652 ?auto_51651 ) ) ( not ( = ?auto_51652 ?auto_51650 ) ) ( not ( = ?auto_51648 ?auto_51652 ) ) ( not ( = ?auto_51649 ?auto_51652 ) ) ( ON ?auto_51648 ?auto_51653 ) ( not ( = ?auto_51648 ?auto_51653 ) ) ( not ( = ?auto_51649 ?auto_51653 ) ) ( not ( = ?auto_51650 ?auto_51653 ) ) ( not ( = ?auto_51651 ?auto_51653 ) ) ( not ( = ?auto_51654 ?auto_51653 ) ) ( not ( = ?auto_51652 ?auto_51653 ) ) ( ON ?auto_51649 ?auto_51648 ) ( ON-TABLE ?auto_51653 ) ( ON ?auto_51650 ?auto_51649 ) ( ON ?auto_51651 ?auto_51650 ) ( ON ?auto_51654 ?auto_51651 ) ( ON ?auto_51652 ?auto_51654 ) ( CLEAR ?auto_51652 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_51653 ?auto_51648 ?auto_51649 ?auto_51650 ?auto_51651 ?auto_51654 )
      ( MAKE-4PILE ?auto_51648 ?auto_51649 ?auto_51650 ?auto_51651 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_51656 - BLOCK
    )
    :vars
    (
      ?auto_51657 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_51657 ?auto_51656 ) ( CLEAR ?auto_51657 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_51656 ) ( not ( = ?auto_51656 ?auto_51657 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_51657 ?auto_51656 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_51658 - BLOCK
    )
    :vars
    (
      ?auto_51659 - BLOCK
      ?auto_51660 - BLOCK
      ?auto_51661 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_51659 ?auto_51658 ) ( CLEAR ?auto_51659 ) ( ON-TABLE ?auto_51658 ) ( not ( = ?auto_51658 ?auto_51659 ) ) ( HOLDING ?auto_51660 ) ( CLEAR ?auto_51661 ) ( not ( = ?auto_51658 ?auto_51660 ) ) ( not ( = ?auto_51658 ?auto_51661 ) ) ( not ( = ?auto_51659 ?auto_51660 ) ) ( not ( = ?auto_51659 ?auto_51661 ) ) ( not ( = ?auto_51660 ?auto_51661 ) ) )
    :subtasks
    ( ( !STACK ?auto_51660 ?auto_51661 )
      ( MAKE-1PILE ?auto_51658 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_51662 - BLOCK
    )
    :vars
    (
      ?auto_51664 - BLOCK
      ?auto_51665 - BLOCK
      ?auto_51663 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_51664 ?auto_51662 ) ( ON-TABLE ?auto_51662 ) ( not ( = ?auto_51662 ?auto_51664 ) ) ( CLEAR ?auto_51665 ) ( not ( = ?auto_51662 ?auto_51663 ) ) ( not ( = ?auto_51662 ?auto_51665 ) ) ( not ( = ?auto_51664 ?auto_51663 ) ) ( not ( = ?auto_51664 ?auto_51665 ) ) ( not ( = ?auto_51663 ?auto_51665 ) ) ( ON ?auto_51663 ?auto_51664 ) ( CLEAR ?auto_51663 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_51662 ?auto_51664 )
      ( MAKE-1PILE ?auto_51662 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_51666 - BLOCK
    )
    :vars
    (
      ?auto_51667 - BLOCK
      ?auto_51668 - BLOCK
      ?auto_51669 - BLOCK
      ?auto_51670 - BLOCK
      ?auto_51671 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_51667 ?auto_51666 ) ( ON-TABLE ?auto_51666 ) ( not ( = ?auto_51666 ?auto_51667 ) ) ( not ( = ?auto_51666 ?auto_51668 ) ) ( not ( = ?auto_51666 ?auto_51669 ) ) ( not ( = ?auto_51667 ?auto_51668 ) ) ( not ( = ?auto_51667 ?auto_51669 ) ) ( not ( = ?auto_51668 ?auto_51669 ) ) ( ON ?auto_51668 ?auto_51667 ) ( CLEAR ?auto_51668 ) ( HOLDING ?auto_51669 ) ( CLEAR ?auto_51670 ) ( ON-TABLE ?auto_51671 ) ( ON ?auto_51670 ?auto_51671 ) ( not ( = ?auto_51671 ?auto_51670 ) ) ( not ( = ?auto_51671 ?auto_51669 ) ) ( not ( = ?auto_51670 ?auto_51669 ) ) ( not ( = ?auto_51666 ?auto_51670 ) ) ( not ( = ?auto_51666 ?auto_51671 ) ) ( not ( = ?auto_51667 ?auto_51670 ) ) ( not ( = ?auto_51667 ?auto_51671 ) ) ( not ( = ?auto_51668 ?auto_51670 ) ) ( not ( = ?auto_51668 ?auto_51671 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_51671 ?auto_51670 ?auto_51669 )
      ( MAKE-1PILE ?auto_51666 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_51672 - BLOCK
    )
    :vars
    (
      ?auto_51676 - BLOCK
      ?auto_51674 - BLOCK
      ?auto_51675 - BLOCK
      ?auto_51673 - BLOCK
      ?auto_51677 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_51676 ?auto_51672 ) ( ON-TABLE ?auto_51672 ) ( not ( = ?auto_51672 ?auto_51676 ) ) ( not ( = ?auto_51672 ?auto_51674 ) ) ( not ( = ?auto_51672 ?auto_51675 ) ) ( not ( = ?auto_51676 ?auto_51674 ) ) ( not ( = ?auto_51676 ?auto_51675 ) ) ( not ( = ?auto_51674 ?auto_51675 ) ) ( ON ?auto_51674 ?auto_51676 ) ( CLEAR ?auto_51673 ) ( ON-TABLE ?auto_51677 ) ( ON ?auto_51673 ?auto_51677 ) ( not ( = ?auto_51677 ?auto_51673 ) ) ( not ( = ?auto_51677 ?auto_51675 ) ) ( not ( = ?auto_51673 ?auto_51675 ) ) ( not ( = ?auto_51672 ?auto_51673 ) ) ( not ( = ?auto_51672 ?auto_51677 ) ) ( not ( = ?auto_51676 ?auto_51673 ) ) ( not ( = ?auto_51676 ?auto_51677 ) ) ( not ( = ?auto_51674 ?auto_51673 ) ) ( not ( = ?auto_51674 ?auto_51677 ) ) ( ON ?auto_51675 ?auto_51674 ) ( CLEAR ?auto_51675 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_51672 ?auto_51676 ?auto_51674 )
      ( MAKE-1PILE ?auto_51672 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_51678 - BLOCK
    )
    :vars
    (
      ?auto_51681 - BLOCK
      ?auto_51680 - BLOCK
      ?auto_51682 - BLOCK
      ?auto_51679 - BLOCK
      ?auto_51683 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_51681 ?auto_51678 ) ( ON-TABLE ?auto_51678 ) ( not ( = ?auto_51678 ?auto_51681 ) ) ( not ( = ?auto_51678 ?auto_51680 ) ) ( not ( = ?auto_51678 ?auto_51682 ) ) ( not ( = ?auto_51681 ?auto_51680 ) ) ( not ( = ?auto_51681 ?auto_51682 ) ) ( not ( = ?auto_51680 ?auto_51682 ) ) ( ON ?auto_51680 ?auto_51681 ) ( ON-TABLE ?auto_51679 ) ( not ( = ?auto_51679 ?auto_51683 ) ) ( not ( = ?auto_51679 ?auto_51682 ) ) ( not ( = ?auto_51683 ?auto_51682 ) ) ( not ( = ?auto_51678 ?auto_51683 ) ) ( not ( = ?auto_51678 ?auto_51679 ) ) ( not ( = ?auto_51681 ?auto_51683 ) ) ( not ( = ?auto_51681 ?auto_51679 ) ) ( not ( = ?auto_51680 ?auto_51683 ) ) ( not ( = ?auto_51680 ?auto_51679 ) ) ( ON ?auto_51682 ?auto_51680 ) ( CLEAR ?auto_51682 ) ( HOLDING ?auto_51683 ) ( CLEAR ?auto_51679 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_51679 ?auto_51683 )
      ( MAKE-1PILE ?auto_51678 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_51684 - BLOCK
    )
    :vars
    (
      ?auto_51687 - BLOCK
      ?auto_51689 - BLOCK
      ?auto_51688 - BLOCK
      ?auto_51685 - BLOCK
      ?auto_51686 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_51687 ?auto_51684 ) ( ON-TABLE ?auto_51684 ) ( not ( = ?auto_51684 ?auto_51687 ) ) ( not ( = ?auto_51684 ?auto_51689 ) ) ( not ( = ?auto_51684 ?auto_51688 ) ) ( not ( = ?auto_51687 ?auto_51689 ) ) ( not ( = ?auto_51687 ?auto_51688 ) ) ( not ( = ?auto_51689 ?auto_51688 ) ) ( ON ?auto_51689 ?auto_51687 ) ( ON-TABLE ?auto_51685 ) ( not ( = ?auto_51685 ?auto_51686 ) ) ( not ( = ?auto_51685 ?auto_51688 ) ) ( not ( = ?auto_51686 ?auto_51688 ) ) ( not ( = ?auto_51684 ?auto_51686 ) ) ( not ( = ?auto_51684 ?auto_51685 ) ) ( not ( = ?auto_51687 ?auto_51686 ) ) ( not ( = ?auto_51687 ?auto_51685 ) ) ( not ( = ?auto_51689 ?auto_51686 ) ) ( not ( = ?auto_51689 ?auto_51685 ) ) ( ON ?auto_51688 ?auto_51689 ) ( CLEAR ?auto_51685 ) ( ON ?auto_51686 ?auto_51688 ) ( CLEAR ?auto_51686 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_51684 ?auto_51687 ?auto_51689 ?auto_51688 )
      ( MAKE-1PILE ?auto_51684 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_51690 - BLOCK
    )
    :vars
    (
      ?auto_51692 - BLOCK
      ?auto_51691 - BLOCK
      ?auto_51693 - BLOCK
      ?auto_51695 - BLOCK
      ?auto_51694 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_51692 ?auto_51690 ) ( ON-TABLE ?auto_51690 ) ( not ( = ?auto_51690 ?auto_51692 ) ) ( not ( = ?auto_51690 ?auto_51691 ) ) ( not ( = ?auto_51690 ?auto_51693 ) ) ( not ( = ?auto_51692 ?auto_51691 ) ) ( not ( = ?auto_51692 ?auto_51693 ) ) ( not ( = ?auto_51691 ?auto_51693 ) ) ( ON ?auto_51691 ?auto_51692 ) ( not ( = ?auto_51695 ?auto_51694 ) ) ( not ( = ?auto_51695 ?auto_51693 ) ) ( not ( = ?auto_51694 ?auto_51693 ) ) ( not ( = ?auto_51690 ?auto_51694 ) ) ( not ( = ?auto_51690 ?auto_51695 ) ) ( not ( = ?auto_51692 ?auto_51694 ) ) ( not ( = ?auto_51692 ?auto_51695 ) ) ( not ( = ?auto_51691 ?auto_51694 ) ) ( not ( = ?auto_51691 ?auto_51695 ) ) ( ON ?auto_51693 ?auto_51691 ) ( ON ?auto_51694 ?auto_51693 ) ( CLEAR ?auto_51694 ) ( HOLDING ?auto_51695 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_51695 )
      ( MAKE-1PILE ?auto_51690 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_51696 - BLOCK
    )
    :vars
    (
      ?auto_51700 - BLOCK
      ?auto_51698 - BLOCK
      ?auto_51701 - BLOCK
      ?auto_51697 - BLOCK
      ?auto_51699 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_51700 ?auto_51696 ) ( ON-TABLE ?auto_51696 ) ( not ( = ?auto_51696 ?auto_51700 ) ) ( not ( = ?auto_51696 ?auto_51698 ) ) ( not ( = ?auto_51696 ?auto_51701 ) ) ( not ( = ?auto_51700 ?auto_51698 ) ) ( not ( = ?auto_51700 ?auto_51701 ) ) ( not ( = ?auto_51698 ?auto_51701 ) ) ( ON ?auto_51698 ?auto_51700 ) ( not ( = ?auto_51697 ?auto_51699 ) ) ( not ( = ?auto_51697 ?auto_51701 ) ) ( not ( = ?auto_51699 ?auto_51701 ) ) ( not ( = ?auto_51696 ?auto_51699 ) ) ( not ( = ?auto_51696 ?auto_51697 ) ) ( not ( = ?auto_51700 ?auto_51699 ) ) ( not ( = ?auto_51700 ?auto_51697 ) ) ( not ( = ?auto_51698 ?auto_51699 ) ) ( not ( = ?auto_51698 ?auto_51697 ) ) ( ON ?auto_51701 ?auto_51698 ) ( ON ?auto_51699 ?auto_51701 ) ( ON ?auto_51697 ?auto_51699 ) ( CLEAR ?auto_51697 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_51696 ?auto_51700 ?auto_51698 ?auto_51701 ?auto_51699 )
      ( MAKE-1PILE ?auto_51696 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_51702 - BLOCK
    )
    :vars
    (
      ?auto_51707 - BLOCK
      ?auto_51703 - BLOCK
      ?auto_51706 - BLOCK
      ?auto_51704 - BLOCK
      ?auto_51705 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_51707 ?auto_51702 ) ( ON-TABLE ?auto_51702 ) ( not ( = ?auto_51702 ?auto_51707 ) ) ( not ( = ?auto_51702 ?auto_51703 ) ) ( not ( = ?auto_51702 ?auto_51706 ) ) ( not ( = ?auto_51707 ?auto_51703 ) ) ( not ( = ?auto_51707 ?auto_51706 ) ) ( not ( = ?auto_51703 ?auto_51706 ) ) ( ON ?auto_51703 ?auto_51707 ) ( not ( = ?auto_51704 ?auto_51705 ) ) ( not ( = ?auto_51704 ?auto_51706 ) ) ( not ( = ?auto_51705 ?auto_51706 ) ) ( not ( = ?auto_51702 ?auto_51705 ) ) ( not ( = ?auto_51702 ?auto_51704 ) ) ( not ( = ?auto_51707 ?auto_51705 ) ) ( not ( = ?auto_51707 ?auto_51704 ) ) ( not ( = ?auto_51703 ?auto_51705 ) ) ( not ( = ?auto_51703 ?auto_51704 ) ) ( ON ?auto_51706 ?auto_51703 ) ( ON ?auto_51705 ?auto_51706 ) ( HOLDING ?auto_51704 ) ( CLEAR ?auto_51705 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_51702 ?auto_51707 ?auto_51703 ?auto_51706 ?auto_51705 ?auto_51704 )
      ( MAKE-1PILE ?auto_51702 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_51708 - BLOCK
    )
    :vars
    (
      ?auto_51710 - BLOCK
      ?auto_51711 - BLOCK
      ?auto_51713 - BLOCK
      ?auto_51709 - BLOCK
      ?auto_51712 - BLOCK
      ?auto_51714 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_51710 ?auto_51708 ) ( ON-TABLE ?auto_51708 ) ( not ( = ?auto_51708 ?auto_51710 ) ) ( not ( = ?auto_51708 ?auto_51711 ) ) ( not ( = ?auto_51708 ?auto_51713 ) ) ( not ( = ?auto_51710 ?auto_51711 ) ) ( not ( = ?auto_51710 ?auto_51713 ) ) ( not ( = ?auto_51711 ?auto_51713 ) ) ( ON ?auto_51711 ?auto_51710 ) ( not ( = ?auto_51709 ?auto_51712 ) ) ( not ( = ?auto_51709 ?auto_51713 ) ) ( not ( = ?auto_51712 ?auto_51713 ) ) ( not ( = ?auto_51708 ?auto_51712 ) ) ( not ( = ?auto_51708 ?auto_51709 ) ) ( not ( = ?auto_51710 ?auto_51712 ) ) ( not ( = ?auto_51710 ?auto_51709 ) ) ( not ( = ?auto_51711 ?auto_51712 ) ) ( not ( = ?auto_51711 ?auto_51709 ) ) ( ON ?auto_51713 ?auto_51711 ) ( ON ?auto_51712 ?auto_51713 ) ( CLEAR ?auto_51712 ) ( ON ?auto_51709 ?auto_51714 ) ( CLEAR ?auto_51709 ) ( HAND-EMPTY ) ( not ( = ?auto_51708 ?auto_51714 ) ) ( not ( = ?auto_51710 ?auto_51714 ) ) ( not ( = ?auto_51711 ?auto_51714 ) ) ( not ( = ?auto_51713 ?auto_51714 ) ) ( not ( = ?auto_51709 ?auto_51714 ) ) ( not ( = ?auto_51712 ?auto_51714 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_51709 ?auto_51714 )
      ( MAKE-1PILE ?auto_51708 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_51715 - BLOCK
    )
    :vars
    (
      ?auto_51720 - BLOCK
      ?auto_51716 - BLOCK
      ?auto_51717 - BLOCK
      ?auto_51719 - BLOCK
      ?auto_51721 - BLOCK
      ?auto_51718 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_51720 ?auto_51715 ) ( ON-TABLE ?auto_51715 ) ( not ( = ?auto_51715 ?auto_51720 ) ) ( not ( = ?auto_51715 ?auto_51716 ) ) ( not ( = ?auto_51715 ?auto_51717 ) ) ( not ( = ?auto_51720 ?auto_51716 ) ) ( not ( = ?auto_51720 ?auto_51717 ) ) ( not ( = ?auto_51716 ?auto_51717 ) ) ( ON ?auto_51716 ?auto_51720 ) ( not ( = ?auto_51719 ?auto_51721 ) ) ( not ( = ?auto_51719 ?auto_51717 ) ) ( not ( = ?auto_51721 ?auto_51717 ) ) ( not ( = ?auto_51715 ?auto_51721 ) ) ( not ( = ?auto_51715 ?auto_51719 ) ) ( not ( = ?auto_51720 ?auto_51721 ) ) ( not ( = ?auto_51720 ?auto_51719 ) ) ( not ( = ?auto_51716 ?auto_51721 ) ) ( not ( = ?auto_51716 ?auto_51719 ) ) ( ON ?auto_51717 ?auto_51716 ) ( ON ?auto_51719 ?auto_51718 ) ( CLEAR ?auto_51719 ) ( not ( = ?auto_51715 ?auto_51718 ) ) ( not ( = ?auto_51720 ?auto_51718 ) ) ( not ( = ?auto_51716 ?auto_51718 ) ) ( not ( = ?auto_51717 ?auto_51718 ) ) ( not ( = ?auto_51719 ?auto_51718 ) ) ( not ( = ?auto_51721 ?auto_51718 ) ) ( HOLDING ?auto_51721 ) ( CLEAR ?auto_51717 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_51715 ?auto_51720 ?auto_51716 ?auto_51717 ?auto_51721 )
      ( MAKE-1PILE ?auto_51715 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_51722 - BLOCK
    )
    :vars
    (
      ?auto_51728 - BLOCK
      ?auto_51723 - BLOCK
      ?auto_51724 - BLOCK
      ?auto_51727 - BLOCK
      ?auto_51725 - BLOCK
      ?auto_51726 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_51728 ?auto_51722 ) ( ON-TABLE ?auto_51722 ) ( not ( = ?auto_51722 ?auto_51728 ) ) ( not ( = ?auto_51722 ?auto_51723 ) ) ( not ( = ?auto_51722 ?auto_51724 ) ) ( not ( = ?auto_51728 ?auto_51723 ) ) ( not ( = ?auto_51728 ?auto_51724 ) ) ( not ( = ?auto_51723 ?auto_51724 ) ) ( ON ?auto_51723 ?auto_51728 ) ( not ( = ?auto_51727 ?auto_51725 ) ) ( not ( = ?auto_51727 ?auto_51724 ) ) ( not ( = ?auto_51725 ?auto_51724 ) ) ( not ( = ?auto_51722 ?auto_51725 ) ) ( not ( = ?auto_51722 ?auto_51727 ) ) ( not ( = ?auto_51728 ?auto_51725 ) ) ( not ( = ?auto_51728 ?auto_51727 ) ) ( not ( = ?auto_51723 ?auto_51725 ) ) ( not ( = ?auto_51723 ?auto_51727 ) ) ( ON ?auto_51724 ?auto_51723 ) ( ON ?auto_51727 ?auto_51726 ) ( not ( = ?auto_51722 ?auto_51726 ) ) ( not ( = ?auto_51728 ?auto_51726 ) ) ( not ( = ?auto_51723 ?auto_51726 ) ) ( not ( = ?auto_51724 ?auto_51726 ) ) ( not ( = ?auto_51727 ?auto_51726 ) ) ( not ( = ?auto_51725 ?auto_51726 ) ) ( CLEAR ?auto_51724 ) ( ON ?auto_51725 ?auto_51727 ) ( CLEAR ?auto_51725 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_51726 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_51726 ?auto_51727 )
      ( MAKE-1PILE ?auto_51722 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_51729 - BLOCK
    )
    :vars
    (
      ?auto_51735 - BLOCK
      ?auto_51734 - BLOCK
      ?auto_51732 - BLOCK
      ?auto_51730 - BLOCK
      ?auto_51731 - BLOCK
      ?auto_51733 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_51735 ?auto_51729 ) ( ON-TABLE ?auto_51729 ) ( not ( = ?auto_51729 ?auto_51735 ) ) ( not ( = ?auto_51729 ?auto_51734 ) ) ( not ( = ?auto_51729 ?auto_51732 ) ) ( not ( = ?auto_51735 ?auto_51734 ) ) ( not ( = ?auto_51735 ?auto_51732 ) ) ( not ( = ?auto_51734 ?auto_51732 ) ) ( ON ?auto_51734 ?auto_51735 ) ( not ( = ?auto_51730 ?auto_51731 ) ) ( not ( = ?auto_51730 ?auto_51732 ) ) ( not ( = ?auto_51731 ?auto_51732 ) ) ( not ( = ?auto_51729 ?auto_51731 ) ) ( not ( = ?auto_51729 ?auto_51730 ) ) ( not ( = ?auto_51735 ?auto_51731 ) ) ( not ( = ?auto_51735 ?auto_51730 ) ) ( not ( = ?auto_51734 ?auto_51731 ) ) ( not ( = ?auto_51734 ?auto_51730 ) ) ( ON ?auto_51730 ?auto_51733 ) ( not ( = ?auto_51729 ?auto_51733 ) ) ( not ( = ?auto_51735 ?auto_51733 ) ) ( not ( = ?auto_51734 ?auto_51733 ) ) ( not ( = ?auto_51732 ?auto_51733 ) ) ( not ( = ?auto_51730 ?auto_51733 ) ) ( not ( = ?auto_51731 ?auto_51733 ) ) ( ON ?auto_51731 ?auto_51730 ) ( CLEAR ?auto_51731 ) ( ON-TABLE ?auto_51733 ) ( HOLDING ?auto_51732 ) ( CLEAR ?auto_51734 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_51729 ?auto_51735 ?auto_51734 ?auto_51732 )
      ( MAKE-1PILE ?auto_51729 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_51736 - BLOCK
    )
    :vars
    (
      ?auto_51739 - BLOCK
      ?auto_51738 - BLOCK
      ?auto_51737 - BLOCK
      ?auto_51740 - BLOCK
      ?auto_51741 - BLOCK
      ?auto_51742 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_51739 ?auto_51736 ) ( ON-TABLE ?auto_51736 ) ( not ( = ?auto_51736 ?auto_51739 ) ) ( not ( = ?auto_51736 ?auto_51738 ) ) ( not ( = ?auto_51736 ?auto_51737 ) ) ( not ( = ?auto_51739 ?auto_51738 ) ) ( not ( = ?auto_51739 ?auto_51737 ) ) ( not ( = ?auto_51738 ?auto_51737 ) ) ( ON ?auto_51738 ?auto_51739 ) ( not ( = ?auto_51740 ?auto_51741 ) ) ( not ( = ?auto_51740 ?auto_51737 ) ) ( not ( = ?auto_51741 ?auto_51737 ) ) ( not ( = ?auto_51736 ?auto_51741 ) ) ( not ( = ?auto_51736 ?auto_51740 ) ) ( not ( = ?auto_51739 ?auto_51741 ) ) ( not ( = ?auto_51739 ?auto_51740 ) ) ( not ( = ?auto_51738 ?auto_51741 ) ) ( not ( = ?auto_51738 ?auto_51740 ) ) ( ON ?auto_51740 ?auto_51742 ) ( not ( = ?auto_51736 ?auto_51742 ) ) ( not ( = ?auto_51739 ?auto_51742 ) ) ( not ( = ?auto_51738 ?auto_51742 ) ) ( not ( = ?auto_51737 ?auto_51742 ) ) ( not ( = ?auto_51740 ?auto_51742 ) ) ( not ( = ?auto_51741 ?auto_51742 ) ) ( ON ?auto_51741 ?auto_51740 ) ( ON-TABLE ?auto_51742 ) ( CLEAR ?auto_51738 ) ( ON ?auto_51737 ?auto_51741 ) ( CLEAR ?auto_51737 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_51742 ?auto_51740 ?auto_51741 )
      ( MAKE-1PILE ?auto_51736 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_51743 - BLOCK
    )
    :vars
    (
      ?auto_51749 - BLOCK
      ?auto_51745 - BLOCK
      ?auto_51744 - BLOCK
      ?auto_51747 - BLOCK
      ?auto_51748 - BLOCK
      ?auto_51746 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_51749 ?auto_51743 ) ( ON-TABLE ?auto_51743 ) ( not ( = ?auto_51743 ?auto_51749 ) ) ( not ( = ?auto_51743 ?auto_51745 ) ) ( not ( = ?auto_51743 ?auto_51744 ) ) ( not ( = ?auto_51749 ?auto_51745 ) ) ( not ( = ?auto_51749 ?auto_51744 ) ) ( not ( = ?auto_51745 ?auto_51744 ) ) ( not ( = ?auto_51747 ?auto_51748 ) ) ( not ( = ?auto_51747 ?auto_51744 ) ) ( not ( = ?auto_51748 ?auto_51744 ) ) ( not ( = ?auto_51743 ?auto_51748 ) ) ( not ( = ?auto_51743 ?auto_51747 ) ) ( not ( = ?auto_51749 ?auto_51748 ) ) ( not ( = ?auto_51749 ?auto_51747 ) ) ( not ( = ?auto_51745 ?auto_51748 ) ) ( not ( = ?auto_51745 ?auto_51747 ) ) ( ON ?auto_51747 ?auto_51746 ) ( not ( = ?auto_51743 ?auto_51746 ) ) ( not ( = ?auto_51749 ?auto_51746 ) ) ( not ( = ?auto_51745 ?auto_51746 ) ) ( not ( = ?auto_51744 ?auto_51746 ) ) ( not ( = ?auto_51747 ?auto_51746 ) ) ( not ( = ?auto_51748 ?auto_51746 ) ) ( ON ?auto_51748 ?auto_51747 ) ( ON-TABLE ?auto_51746 ) ( ON ?auto_51744 ?auto_51748 ) ( CLEAR ?auto_51744 ) ( HOLDING ?auto_51745 ) ( CLEAR ?auto_51749 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_51743 ?auto_51749 ?auto_51745 )
      ( MAKE-1PILE ?auto_51743 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_51750 - BLOCK
    )
    :vars
    (
      ?auto_51753 - BLOCK
      ?auto_51752 - BLOCK
      ?auto_51751 - BLOCK
      ?auto_51755 - BLOCK
      ?auto_51756 - BLOCK
      ?auto_51754 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_51753 ?auto_51750 ) ( ON-TABLE ?auto_51750 ) ( not ( = ?auto_51750 ?auto_51753 ) ) ( not ( = ?auto_51750 ?auto_51752 ) ) ( not ( = ?auto_51750 ?auto_51751 ) ) ( not ( = ?auto_51753 ?auto_51752 ) ) ( not ( = ?auto_51753 ?auto_51751 ) ) ( not ( = ?auto_51752 ?auto_51751 ) ) ( not ( = ?auto_51755 ?auto_51756 ) ) ( not ( = ?auto_51755 ?auto_51751 ) ) ( not ( = ?auto_51756 ?auto_51751 ) ) ( not ( = ?auto_51750 ?auto_51756 ) ) ( not ( = ?auto_51750 ?auto_51755 ) ) ( not ( = ?auto_51753 ?auto_51756 ) ) ( not ( = ?auto_51753 ?auto_51755 ) ) ( not ( = ?auto_51752 ?auto_51756 ) ) ( not ( = ?auto_51752 ?auto_51755 ) ) ( ON ?auto_51755 ?auto_51754 ) ( not ( = ?auto_51750 ?auto_51754 ) ) ( not ( = ?auto_51753 ?auto_51754 ) ) ( not ( = ?auto_51752 ?auto_51754 ) ) ( not ( = ?auto_51751 ?auto_51754 ) ) ( not ( = ?auto_51755 ?auto_51754 ) ) ( not ( = ?auto_51756 ?auto_51754 ) ) ( ON ?auto_51756 ?auto_51755 ) ( ON-TABLE ?auto_51754 ) ( ON ?auto_51751 ?auto_51756 ) ( CLEAR ?auto_51753 ) ( ON ?auto_51752 ?auto_51751 ) ( CLEAR ?auto_51752 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_51754 ?auto_51755 ?auto_51756 ?auto_51751 )
      ( MAKE-1PILE ?auto_51750 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_51771 - BLOCK
    )
    :vars
    (
      ?auto_51774 - BLOCK
      ?auto_51773 - BLOCK
      ?auto_51775 - BLOCK
      ?auto_51772 - BLOCK
      ?auto_51777 - BLOCK
      ?auto_51776 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_51771 ?auto_51774 ) ) ( not ( = ?auto_51771 ?auto_51773 ) ) ( not ( = ?auto_51771 ?auto_51775 ) ) ( not ( = ?auto_51774 ?auto_51773 ) ) ( not ( = ?auto_51774 ?auto_51775 ) ) ( not ( = ?auto_51773 ?auto_51775 ) ) ( not ( = ?auto_51772 ?auto_51777 ) ) ( not ( = ?auto_51772 ?auto_51775 ) ) ( not ( = ?auto_51777 ?auto_51775 ) ) ( not ( = ?auto_51771 ?auto_51777 ) ) ( not ( = ?auto_51771 ?auto_51772 ) ) ( not ( = ?auto_51774 ?auto_51777 ) ) ( not ( = ?auto_51774 ?auto_51772 ) ) ( not ( = ?auto_51773 ?auto_51777 ) ) ( not ( = ?auto_51773 ?auto_51772 ) ) ( ON ?auto_51772 ?auto_51776 ) ( not ( = ?auto_51771 ?auto_51776 ) ) ( not ( = ?auto_51774 ?auto_51776 ) ) ( not ( = ?auto_51773 ?auto_51776 ) ) ( not ( = ?auto_51775 ?auto_51776 ) ) ( not ( = ?auto_51772 ?auto_51776 ) ) ( not ( = ?auto_51777 ?auto_51776 ) ) ( ON ?auto_51777 ?auto_51772 ) ( ON-TABLE ?auto_51776 ) ( ON ?auto_51775 ?auto_51777 ) ( ON ?auto_51773 ?auto_51775 ) ( ON ?auto_51774 ?auto_51773 ) ( CLEAR ?auto_51774 ) ( HOLDING ?auto_51771 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_51771 ?auto_51774 )
      ( MAKE-1PILE ?auto_51771 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_51778 - BLOCK
    )
    :vars
    (
      ?auto_51782 - BLOCK
      ?auto_51779 - BLOCK
      ?auto_51783 - BLOCK
      ?auto_51781 - BLOCK
      ?auto_51780 - BLOCK
      ?auto_51784 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_51778 ?auto_51782 ) ) ( not ( = ?auto_51778 ?auto_51779 ) ) ( not ( = ?auto_51778 ?auto_51783 ) ) ( not ( = ?auto_51782 ?auto_51779 ) ) ( not ( = ?auto_51782 ?auto_51783 ) ) ( not ( = ?auto_51779 ?auto_51783 ) ) ( not ( = ?auto_51781 ?auto_51780 ) ) ( not ( = ?auto_51781 ?auto_51783 ) ) ( not ( = ?auto_51780 ?auto_51783 ) ) ( not ( = ?auto_51778 ?auto_51780 ) ) ( not ( = ?auto_51778 ?auto_51781 ) ) ( not ( = ?auto_51782 ?auto_51780 ) ) ( not ( = ?auto_51782 ?auto_51781 ) ) ( not ( = ?auto_51779 ?auto_51780 ) ) ( not ( = ?auto_51779 ?auto_51781 ) ) ( ON ?auto_51781 ?auto_51784 ) ( not ( = ?auto_51778 ?auto_51784 ) ) ( not ( = ?auto_51782 ?auto_51784 ) ) ( not ( = ?auto_51779 ?auto_51784 ) ) ( not ( = ?auto_51783 ?auto_51784 ) ) ( not ( = ?auto_51781 ?auto_51784 ) ) ( not ( = ?auto_51780 ?auto_51784 ) ) ( ON ?auto_51780 ?auto_51781 ) ( ON-TABLE ?auto_51784 ) ( ON ?auto_51783 ?auto_51780 ) ( ON ?auto_51779 ?auto_51783 ) ( ON ?auto_51782 ?auto_51779 ) ( ON ?auto_51778 ?auto_51782 ) ( CLEAR ?auto_51778 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_51784 ?auto_51781 ?auto_51780 ?auto_51783 ?auto_51779 ?auto_51782 )
      ( MAKE-1PILE ?auto_51778 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_51790 - BLOCK
      ?auto_51791 - BLOCK
      ?auto_51792 - BLOCK
      ?auto_51793 - BLOCK
      ?auto_51794 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_51794 ) ( CLEAR ?auto_51793 ) ( ON-TABLE ?auto_51790 ) ( ON ?auto_51791 ?auto_51790 ) ( ON ?auto_51792 ?auto_51791 ) ( ON ?auto_51793 ?auto_51792 ) ( not ( = ?auto_51790 ?auto_51791 ) ) ( not ( = ?auto_51790 ?auto_51792 ) ) ( not ( = ?auto_51790 ?auto_51793 ) ) ( not ( = ?auto_51790 ?auto_51794 ) ) ( not ( = ?auto_51791 ?auto_51792 ) ) ( not ( = ?auto_51791 ?auto_51793 ) ) ( not ( = ?auto_51791 ?auto_51794 ) ) ( not ( = ?auto_51792 ?auto_51793 ) ) ( not ( = ?auto_51792 ?auto_51794 ) ) ( not ( = ?auto_51793 ?auto_51794 ) ) )
    :subtasks
    ( ( !STACK ?auto_51794 ?auto_51793 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_51795 - BLOCK
      ?auto_51796 - BLOCK
      ?auto_51797 - BLOCK
      ?auto_51798 - BLOCK
      ?auto_51799 - BLOCK
    )
    :vars
    (
      ?auto_51800 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_51798 ) ( ON-TABLE ?auto_51795 ) ( ON ?auto_51796 ?auto_51795 ) ( ON ?auto_51797 ?auto_51796 ) ( ON ?auto_51798 ?auto_51797 ) ( not ( = ?auto_51795 ?auto_51796 ) ) ( not ( = ?auto_51795 ?auto_51797 ) ) ( not ( = ?auto_51795 ?auto_51798 ) ) ( not ( = ?auto_51795 ?auto_51799 ) ) ( not ( = ?auto_51796 ?auto_51797 ) ) ( not ( = ?auto_51796 ?auto_51798 ) ) ( not ( = ?auto_51796 ?auto_51799 ) ) ( not ( = ?auto_51797 ?auto_51798 ) ) ( not ( = ?auto_51797 ?auto_51799 ) ) ( not ( = ?auto_51798 ?auto_51799 ) ) ( ON ?auto_51799 ?auto_51800 ) ( CLEAR ?auto_51799 ) ( HAND-EMPTY ) ( not ( = ?auto_51795 ?auto_51800 ) ) ( not ( = ?auto_51796 ?auto_51800 ) ) ( not ( = ?auto_51797 ?auto_51800 ) ) ( not ( = ?auto_51798 ?auto_51800 ) ) ( not ( = ?auto_51799 ?auto_51800 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_51799 ?auto_51800 )
      ( MAKE-5PILE ?auto_51795 ?auto_51796 ?auto_51797 ?auto_51798 ?auto_51799 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_51801 - BLOCK
      ?auto_51802 - BLOCK
      ?auto_51803 - BLOCK
      ?auto_51804 - BLOCK
      ?auto_51805 - BLOCK
    )
    :vars
    (
      ?auto_51806 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_51801 ) ( ON ?auto_51802 ?auto_51801 ) ( ON ?auto_51803 ?auto_51802 ) ( not ( = ?auto_51801 ?auto_51802 ) ) ( not ( = ?auto_51801 ?auto_51803 ) ) ( not ( = ?auto_51801 ?auto_51804 ) ) ( not ( = ?auto_51801 ?auto_51805 ) ) ( not ( = ?auto_51802 ?auto_51803 ) ) ( not ( = ?auto_51802 ?auto_51804 ) ) ( not ( = ?auto_51802 ?auto_51805 ) ) ( not ( = ?auto_51803 ?auto_51804 ) ) ( not ( = ?auto_51803 ?auto_51805 ) ) ( not ( = ?auto_51804 ?auto_51805 ) ) ( ON ?auto_51805 ?auto_51806 ) ( CLEAR ?auto_51805 ) ( not ( = ?auto_51801 ?auto_51806 ) ) ( not ( = ?auto_51802 ?auto_51806 ) ) ( not ( = ?auto_51803 ?auto_51806 ) ) ( not ( = ?auto_51804 ?auto_51806 ) ) ( not ( = ?auto_51805 ?auto_51806 ) ) ( HOLDING ?auto_51804 ) ( CLEAR ?auto_51803 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_51801 ?auto_51802 ?auto_51803 ?auto_51804 )
      ( MAKE-5PILE ?auto_51801 ?auto_51802 ?auto_51803 ?auto_51804 ?auto_51805 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_51807 - BLOCK
      ?auto_51808 - BLOCK
      ?auto_51809 - BLOCK
      ?auto_51810 - BLOCK
      ?auto_51811 - BLOCK
    )
    :vars
    (
      ?auto_51812 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_51807 ) ( ON ?auto_51808 ?auto_51807 ) ( ON ?auto_51809 ?auto_51808 ) ( not ( = ?auto_51807 ?auto_51808 ) ) ( not ( = ?auto_51807 ?auto_51809 ) ) ( not ( = ?auto_51807 ?auto_51810 ) ) ( not ( = ?auto_51807 ?auto_51811 ) ) ( not ( = ?auto_51808 ?auto_51809 ) ) ( not ( = ?auto_51808 ?auto_51810 ) ) ( not ( = ?auto_51808 ?auto_51811 ) ) ( not ( = ?auto_51809 ?auto_51810 ) ) ( not ( = ?auto_51809 ?auto_51811 ) ) ( not ( = ?auto_51810 ?auto_51811 ) ) ( ON ?auto_51811 ?auto_51812 ) ( not ( = ?auto_51807 ?auto_51812 ) ) ( not ( = ?auto_51808 ?auto_51812 ) ) ( not ( = ?auto_51809 ?auto_51812 ) ) ( not ( = ?auto_51810 ?auto_51812 ) ) ( not ( = ?auto_51811 ?auto_51812 ) ) ( CLEAR ?auto_51809 ) ( ON ?auto_51810 ?auto_51811 ) ( CLEAR ?auto_51810 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_51812 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_51812 ?auto_51811 )
      ( MAKE-5PILE ?auto_51807 ?auto_51808 ?auto_51809 ?auto_51810 ?auto_51811 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_51813 - BLOCK
      ?auto_51814 - BLOCK
      ?auto_51815 - BLOCK
      ?auto_51816 - BLOCK
      ?auto_51817 - BLOCK
    )
    :vars
    (
      ?auto_51818 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_51813 ) ( ON ?auto_51814 ?auto_51813 ) ( not ( = ?auto_51813 ?auto_51814 ) ) ( not ( = ?auto_51813 ?auto_51815 ) ) ( not ( = ?auto_51813 ?auto_51816 ) ) ( not ( = ?auto_51813 ?auto_51817 ) ) ( not ( = ?auto_51814 ?auto_51815 ) ) ( not ( = ?auto_51814 ?auto_51816 ) ) ( not ( = ?auto_51814 ?auto_51817 ) ) ( not ( = ?auto_51815 ?auto_51816 ) ) ( not ( = ?auto_51815 ?auto_51817 ) ) ( not ( = ?auto_51816 ?auto_51817 ) ) ( ON ?auto_51817 ?auto_51818 ) ( not ( = ?auto_51813 ?auto_51818 ) ) ( not ( = ?auto_51814 ?auto_51818 ) ) ( not ( = ?auto_51815 ?auto_51818 ) ) ( not ( = ?auto_51816 ?auto_51818 ) ) ( not ( = ?auto_51817 ?auto_51818 ) ) ( ON ?auto_51816 ?auto_51817 ) ( CLEAR ?auto_51816 ) ( ON-TABLE ?auto_51818 ) ( HOLDING ?auto_51815 ) ( CLEAR ?auto_51814 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_51813 ?auto_51814 ?auto_51815 )
      ( MAKE-5PILE ?auto_51813 ?auto_51814 ?auto_51815 ?auto_51816 ?auto_51817 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_51819 - BLOCK
      ?auto_51820 - BLOCK
      ?auto_51821 - BLOCK
      ?auto_51822 - BLOCK
      ?auto_51823 - BLOCK
    )
    :vars
    (
      ?auto_51824 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_51819 ) ( ON ?auto_51820 ?auto_51819 ) ( not ( = ?auto_51819 ?auto_51820 ) ) ( not ( = ?auto_51819 ?auto_51821 ) ) ( not ( = ?auto_51819 ?auto_51822 ) ) ( not ( = ?auto_51819 ?auto_51823 ) ) ( not ( = ?auto_51820 ?auto_51821 ) ) ( not ( = ?auto_51820 ?auto_51822 ) ) ( not ( = ?auto_51820 ?auto_51823 ) ) ( not ( = ?auto_51821 ?auto_51822 ) ) ( not ( = ?auto_51821 ?auto_51823 ) ) ( not ( = ?auto_51822 ?auto_51823 ) ) ( ON ?auto_51823 ?auto_51824 ) ( not ( = ?auto_51819 ?auto_51824 ) ) ( not ( = ?auto_51820 ?auto_51824 ) ) ( not ( = ?auto_51821 ?auto_51824 ) ) ( not ( = ?auto_51822 ?auto_51824 ) ) ( not ( = ?auto_51823 ?auto_51824 ) ) ( ON ?auto_51822 ?auto_51823 ) ( ON-TABLE ?auto_51824 ) ( CLEAR ?auto_51820 ) ( ON ?auto_51821 ?auto_51822 ) ( CLEAR ?auto_51821 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_51824 ?auto_51823 ?auto_51822 )
      ( MAKE-5PILE ?auto_51819 ?auto_51820 ?auto_51821 ?auto_51822 ?auto_51823 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_51825 - BLOCK
      ?auto_51826 - BLOCK
      ?auto_51827 - BLOCK
      ?auto_51828 - BLOCK
      ?auto_51829 - BLOCK
    )
    :vars
    (
      ?auto_51830 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_51825 ) ( not ( = ?auto_51825 ?auto_51826 ) ) ( not ( = ?auto_51825 ?auto_51827 ) ) ( not ( = ?auto_51825 ?auto_51828 ) ) ( not ( = ?auto_51825 ?auto_51829 ) ) ( not ( = ?auto_51826 ?auto_51827 ) ) ( not ( = ?auto_51826 ?auto_51828 ) ) ( not ( = ?auto_51826 ?auto_51829 ) ) ( not ( = ?auto_51827 ?auto_51828 ) ) ( not ( = ?auto_51827 ?auto_51829 ) ) ( not ( = ?auto_51828 ?auto_51829 ) ) ( ON ?auto_51829 ?auto_51830 ) ( not ( = ?auto_51825 ?auto_51830 ) ) ( not ( = ?auto_51826 ?auto_51830 ) ) ( not ( = ?auto_51827 ?auto_51830 ) ) ( not ( = ?auto_51828 ?auto_51830 ) ) ( not ( = ?auto_51829 ?auto_51830 ) ) ( ON ?auto_51828 ?auto_51829 ) ( ON-TABLE ?auto_51830 ) ( ON ?auto_51827 ?auto_51828 ) ( CLEAR ?auto_51827 ) ( HOLDING ?auto_51826 ) ( CLEAR ?auto_51825 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_51825 ?auto_51826 )
      ( MAKE-5PILE ?auto_51825 ?auto_51826 ?auto_51827 ?auto_51828 ?auto_51829 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_51831 - BLOCK
      ?auto_51832 - BLOCK
      ?auto_51833 - BLOCK
      ?auto_51834 - BLOCK
      ?auto_51835 - BLOCK
    )
    :vars
    (
      ?auto_51836 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_51831 ) ( not ( = ?auto_51831 ?auto_51832 ) ) ( not ( = ?auto_51831 ?auto_51833 ) ) ( not ( = ?auto_51831 ?auto_51834 ) ) ( not ( = ?auto_51831 ?auto_51835 ) ) ( not ( = ?auto_51832 ?auto_51833 ) ) ( not ( = ?auto_51832 ?auto_51834 ) ) ( not ( = ?auto_51832 ?auto_51835 ) ) ( not ( = ?auto_51833 ?auto_51834 ) ) ( not ( = ?auto_51833 ?auto_51835 ) ) ( not ( = ?auto_51834 ?auto_51835 ) ) ( ON ?auto_51835 ?auto_51836 ) ( not ( = ?auto_51831 ?auto_51836 ) ) ( not ( = ?auto_51832 ?auto_51836 ) ) ( not ( = ?auto_51833 ?auto_51836 ) ) ( not ( = ?auto_51834 ?auto_51836 ) ) ( not ( = ?auto_51835 ?auto_51836 ) ) ( ON ?auto_51834 ?auto_51835 ) ( ON-TABLE ?auto_51836 ) ( ON ?auto_51833 ?auto_51834 ) ( CLEAR ?auto_51831 ) ( ON ?auto_51832 ?auto_51833 ) ( CLEAR ?auto_51832 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_51836 ?auto_51835 ?auto_51834 ?auto_51833 )
      ( MAKE-5PILE ?auto_51831 ?auto_51832 ?auto_51833 ?auto_51834 ?auto_51835 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_51837 - BLOCK
      ?auto_51838 - BLOCK
      ?auto_51839 - BLOCK
      ?auto_51840 - BLOCK
      ?auto_51841 - BLOCK
    )
    :vars
    (
      ?auto_51842 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_51837 ?auto_51838 ) ) ( not ( = ?auto_51837 ?auto_51839 ) ) ( not ( = ?auto_51837 ?auto_51840 ) ) ( not ( = ?auto_51837 ?auto_51841 ) ) ( not ( = ?auto_51838 ?auto_51839 ) ) ( not ( = ?auto_51838 ?auto_51840 ) ) ( not ( = ?auto_51838 ?auto_51841 ) ) ( not ( = ?auto_51839 ?auto_51840 ) ) ( not ( = ?auto_51839 ?auto_51841 ) ) ( not ( = ?auto_51840 ?auto_51841 ) ) ( ON ?auto_51841 ?auto_51842 ) ( not ( = ?auto_51837 ?auto_51842 ) ) ( not ( = ?auto_51838 ?auto_51842 ) ) ( not ( = ?auto_51839 ?auto_51842 ) ) ( not ( = ?auto_51840 ?auto_51842 ) ) ( not ( = ?auto_51841 ?auto_51842 ) ) ( ON ?auto_51840 ?auto_51841 ) ( ON-TABLE ?auto_51842 ) ( ON ?auto_51839 ?auto_51840 ) ( ON ?auto_51838 ?auto_51839 ) ( CLEAR ?auto_51838 ) ( HOLDING ?auto_51837 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_51837 )
      ( MAKE-5PILE ?auto_51837 ?auto_51838 ?auto_51839 ?auto_51840 ?auto_51841 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_51843 - BLOCK
      ?auto_51844 - BLOCK
      ?auto_51845 - BLOCK
      ?auto_51846 - BLOCK
      ?auto_51847 - BLOCK
    )
    :vars
    (
      ?auto_51848 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_51843 ?auto_51844 ) ) ( not ( = ?auto_51843 ?auto_51845 ) ) ( not ( = ?auto_51843 ?auto_51846 ) ) ( not ( = ?auto_51843 ?auto_51847 ) ) ( not ( = ?auto_51844 ?auto_51845 ) ) ( not ( = ?auto_51844 ?auto_51846 ) ) ( not ( = ?auto_51844 ?auto_51847 ) ) ( not ( = ?auto_51845 ?auto_51846 ) ) ( not ( = ?auto_51845 ?auto_51847 ) ) ( not ( = ?auto_51846 ?auto_51847 ) ) ( ON ?auto_51847 ?auto_51848 ) ( not ( = ?auto_51843 ?auto_51848 ) ) ( not ( = ?auto_51844 ?auto_51848 ) ) ( not ( = ?auto_51845 ?auto_51848 ) ) ( not ( = ?auto_51846 ?auto_51848 ) ) ( not ( = ?auto_51847 ?auto_51848 ) ) ( ON ?auto_51846 ?auto_51847 ) ( ON-TABLE ?auto_51848 ) ( ON ?auto_51845 ?auto_51846 ) ( ON ?auto_51844 ?auto_51845 ) ( ON ?auto_51843 ?auto_51844 ) ( CLEAR ?auto_51843 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_51848 ?auto_51847 ?auto_51846 ?auto_51845 ?auto_51844 )
      ( MAKE-5PILE ?auto_51843 ?auto_51844 ?auto_51845 ?auto_51846 ?auto_51847 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_51849 - BLOCK
      ?auto_51850 - BLOCK
      ?auto_51851 - BLOCK
      ?auto_51852 - BLOCK
      ?auto_51853 - BLOCK
    )
    :vars
    (
      ?auto_51854 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_51849 ?auto_51850 ) ) ( not ( = ?auto_51849 ?auto_51851 ) ) ( not ( = ?auto_51849 ?auto_51852 ) ) ( not ( = ?auto_51849 ?auto_51853 ) ) ( not ( = ?auto_51850 ?auto_51851 ) ) ( not ( = ?auto_51850 ?auto_51852 ) ) ( not ( = ?auto_51850 ?auto_51853 ) ) ( not ( = ?auto_51851 ?auto_51852 ) ) ( not ( = ?auto_51851 ?auto_51853 ) ) ( not ( = ?auto_51852 ?auto_51853 ) ) ( ON ?auto_51853 ?auto_51854 ) ( not ( = ?auto_51849 ?auto_51854 ) ) ( not ( = ?auto_51850 ?auto_51854 ) ) ( not ( = ?auto_51851 ?auto_51854 ) ) ( not ( = ?auto_51852 ?auto_51854 ) ) ( not ( = ?auto_51853 ?auto_51854 ) ) ( ON ?auto_51852 ?auto_51853 ) ( ON-TABLE ?auto_51854 ) ( ON ?auto_51851 ?auto_51852 ) ( ON ?auto_51850 ?auto_51851 ) ( HOLDING ?auto_51849 ) ( CLEAR ?auto_51850 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_51854 ?auto_51853 ?auto_51852 ?auto_51851 ?auto_51850 ?auto_51849 )
      ( MAKE-5PILE ?auto_51849 ?auto_51850 ?auto_51851 ?auto_51852 ?auto_51853 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_51855 - BLOCK
      ?auto_51856 - BLOCK
      ?auto_51857 - BLOCK
      ?auto_51858 - BLOCK
      ?auto_51859 - BLOCK
    )
    :vars
    (
      ?auto_51860 - BLOCK
      ?auto_51861 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_51855 ?auto_51856 ) ) ( not ( = ?auto_51855 ?auto_51857 ) ) ( not ( = ?auto_51855 ?auto_51858 ) ) ( not ( = ?auto_51855 ?auto_51859 ) ) ( not ( = ?auto_51856 ?auto_51857 ) ) ( not ( = ?auto_51856 ?auto_51858 ) ) ( not ( = ?auto_51856 ?auto_51859 ) ) ( not ( = ?auto_51857 ?auto_51858 ) ) ( not ( = ?auto_51857 ?auto_51859 ) ) ( not ( = ?auto_51858 ?auto_51859 ) ) ( ON ?auto_51859 ?auto_51860 ) ( not ( = ?auto_51855 ?auto_51860 ) ) ( not ( = ?auto_51856 ?auto_51860 ) ) ( not ( = ?auto_51857 ?auto_51860 ) ) ( not ( = ?auto_51858 ?auto_51860 ) ) ( not ( = ?auto_51859 ?auto_51860 ) ) ( ON ?auto_51858 ?auto_51859 ) ( ON-TABLE ?auto_51860 ) ( ON ?auto_51857 ?auto_51858 ) ( ON ?auto_51856 ?auto_51857 ) ( CLEAR ?auto_51856 ) ( ON ?auto_51855 ?auto_51861 ) ( CLEAR ?auto_51855 ) ( HAND-EMPTY ) ( not ( = ?auto_51855 ?auto_51861 ) ) ( not ( = ?auto_51856 ?auto_51861 ) ) ( not ( = ?auto_51857 ?auto_51861 ) ) ( not ( = ?auto_51858 ?auto_51861 ) ) ( not ( = ?auto_51859 ?auto_51861 ) ) ( not ( = ?auto_51860 ?auto_51861 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_51855 ?auto_51861 )
      ( MAKE-5PILE ?auto_51855 ?auto_51856 ?auto_51857 ?auto_51858 ?auto_51859 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_51862 - BLOCK
      ?auto_51863 - BLOCK
      ?auto_51864 - BLOCK
      ?auto_51865 - BLOCK
      ?auto_51866 - BLOCK
    )
    :vars
    (
      ?auto_51868 - BLOCK
      ?auto_51867 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_51862 ?auto_51863 ) ) ( not ( = ?auto_51862 ?auto_51864 ) ) ( not ( = ?auto_51862 ?auto_51865 ) ) ( not ( = ?auto_51862 ?auto_51866 ) ) ( not ( = ?auto_51863 ?auto_51864 ) ) ( not ( = ?auto_51863 ?auto_51865 ) ) ( not ( = ?auto_51863 ?auto_51866 ) ) ( not ( = ?auto_51864 ?auto_51865 ) ) ( not ( = ?auto_51864 ?auto_51866 ) ) ( not ( = ?auto_51865 ?auto_51866 ) ) ( ON ?auto_51866 ?auto_51868 ) ( not ( = ?auto_51862 ?auto_51868 ) ) ( not ( = ?auto_51863 ?auto_51868 ) ) ( not ( = ?auto_51864 ?auto_51868 ) ) ( not ( = ?auto_51865 ?auto_51868 ) ) ( not ( = ?auto_51866 ?auto_51868 ) ) ( ON ?auto_51865 ?auto_51866 ) ( ON-TABLE ?auto_51868 ) ( ON ?auto_51864 ?auto_51865 ) ( ON ?auto_51862 ?auto_51867 ) ( CLEAR ?auto_51862 ) ( not ( = ?auto_51862 ?auto_51867 ) ) ( not ( = ?auto_51863 ?auto_51867 ) ) ( not ( = ?auto_51864 ?auto_51867 ) ) ( not ( = ?auto_51865 ?auto_51867 ) ) ( not ( = ?auto_51866 ?auto_51867 ) ) ( not ( = ?auto_51868 ?auto_51867 ) ) ( HOLDING ?auto_51863 ) ( CLEAR ?auto_51864 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_51868 ?auto_51866 ?auto_51865 ?auto_51864 ?auto_51863 )
      ( MAKE-5PILE ?auto_51862 ?auto_51863 ?auto_51864 ?auto_51865 ?auto_51866 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_51869 - BLOCK
      ?auto_51870 - BLOCK
      ?auto_51871 - BLOCK
      ?auto_51872 - BLOCK
      ?auto_51873 - BLOCK
    )
    :vars
    (
      ?auto_51875 - BLOCK
      ?auto_51874 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_51869 ?auto_51870 ) ) ( not ( = ?auto_51869 ?auto_51871 ) ) ( not ( = ?auto_51869 ?auto_51872 ) ) ( not ( = ?auto_51869 ?auto_51873 ) ) ( not ( = ?auto_51870 ?auto_51871 ) ) ( not ( = ?auto_51870 ?auto_51872 ) ) ( not ( = ?auto_51870 ?auto_51873 ) ) ( not ( = ?auto_51871 ?auto_51872 ) ) ( not ( = ?auto_51871 ?auto_51873 ) ) ( not ( = ?auto_51872 ?auto_51873 ) ) ( ON ?auto_51873 ?auto_51875 ) ( not ( = ?auto_51869 ?auto_51875 ) ) ( not ( = ?auto_51870 ?auto_51875 ) ) ( not ( = ?auto_51871 ?auto_51875 ) ) ( not ( = ?auto_51872 ?auto_51875 ) ) ( not ( = ?auto_51873 ?auto_51875 ) ) ( ON ?auto_51872 ?auto_51873 ) ( ON-TABLE ?auto_51875 ) ( ON ?auto_51871 ?auto_51872 ) ( ON ?auto_51869 ?auto_51874 ) ( not ( = ?auto_51869 ?auto_51874 ) ) ( not ( = ?auto_51870 ?auto_51874 ) ) ( not ( = ?auto_51871 ?auto_51874 ) ) ( not ( = ?auto_51872 ?auto_51874 ) ) ( not ( = ?auto_51873 ?auto_51874 ) ) ( not ( = ?auto_51875 ?auto_51874 ) ) ( CLEAR ?auto_51871 ) ( ON ?auto_51870 ?auto_51869 ) ( CLEAR ?auto_51870 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_51874 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_51874 ?auto_51869 )
      ( MAKE-5PILE ?auto_51869 ?auto_51870 ?auto_51871 ?auto_51872 ?auto_51873 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_51876 - BLOCK
      ?auto_51877 - BLOCK
      ?auto_51878 - BLOCK
      ?auto_51879 - BLOCK
      ?auto_51880 - BLOCK
    )
    :vars
    (
      ?auto_51882 - BLOCK
      ?auto_51881 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_51876 ?auto_51877 ) ) ( not ( = ?auto_51876 ?auto_51878 ) ) ( not ( = ?auto_51876 ?auto_51879 ) ) ( not ( = ?auto_51876 ?auto_51880 ) ) ( not ( = ?auto_51877 ?auto_51878 ) ) ( not ( = ?auto_51877 ?auto_51879 ) ) ( not ( = ?auto_51877 ?auto_51880 ) ) ( not ( = ?auto_51878 ?auto_51879 ) ) ( not ( = ?auto_51878 ?auto_51880 ) ) ( not ( = ?auto_51879 ?auto_51880 ) ) ( ON ?auto_51880 ?auto_51882 ) ( not ( = ?auto_51876 ?auto_51882 ) ) ( not ( = ?auto_51877 ?auto_51882 ) ) ( not ( = ?auto_51878 ?auto_51882 ) ) ( not ( = ?auto_51879 ?auto_51882 ) ) ( not ( = ?auto_51880 ?auto_51882 ) ) ( ON ?auto_51879 ?auto_51880 ) ( ON-TABLE ?auto_51882 ) ( ON ?auto_51876 ?auto_51881 ) ( not ( = ?auto_51876 ?auto_51881 ) ) ( not ( = ?auto_51877 ?auto_51881 ) ) ( not ( = ?auto_51878 ?auto_51881 ) ) ( not ( = ?auto_51879 ?auto_51881 ) ) ( not ( = ?auto_51880 ?auto_51881 ) ) ( not ( = ?auto_51882 ?auto_51881 ) ) ( ON ?auto_51877 ?auto_51876 ) ( CLEAR ?auto_51877 ) ( ON-TABLE ?auto_51881 ) ( HOLDING ?auto_51878 ) ( CLEAR ?auto_51879 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_51882 ?auto_51880 ?auto_51879 ?auto_51878 )
      ( MAKE-5PILE ?auto_51876 ?auto_51877 ?auto_51878 ?auto_51879 ?auto_51880 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_51883 - BLOCK
      ?auto_51884 - BLOCK
      ?auto_51885 - BLOCK
      ?auto_51886 - BLOCK
      ?auto_51887 - BLOCK
    )
    :vars
    (
      ?auto_51889 - BLOCK
      ?auto_51888 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_51883 ?auto_51884 ) ) ( not ( = ?auto_51883 ?auto_51885 ) ) ( not ( = ?auto_51883 ?auto_51886 ) ) ( not ( = ?auto_51883 ?auto_51887 ) ) ( not ( = ?auto_51884 ?auto_51885 ) ) ( not ( = ?auto_51884 ?auto_51886 ) ) ( not ( = ?auto_51884 ?auto_51887 ) ) ( not ( = ?auto_51885 ?auto_51886 ) ) ( not ( = ?auto_51885 ?auto_51887 ) ) ( not ( = ?auto_51886 ?auto_51887 ) ) ( ON ?auto_51887 ?auto_51889 ) ( not ( = ?auto_51883 ?auto_51889 ) ) ( not ( = ?auto_51884 ?auto_51889 ) ) ( not ( = ?auto_51885 ?auto_51889 ) ) ( not ( = ?auto_51886 ?auto_51889 ) ) ( not ( = ?auto_51887 ?auto_51889 ) ) ( ON ?auto_51886 ?auto_51887 ) ( ON-TABLE ?auto_51889 ) ( ON ?auto_51883 ?auto_51888 ) ( not ( = ?auto_51883 ?auto_51888 ) ) ( not ( = ?auto_51884 ?auto_51888 ) ) ( not ( = ?auto_51885 ?auto_51888 ) ) ( not ( = ?auto_51886 ?auto_51888 ) ) ( not ( = ?auto_51887 ?auto_51888 ) ) ( not ( = ?auto_51889 ?auto_51888 ) ) ( ON ?auto_51884 ?auto_51883 ) ( ON-TABLE ?auto_51888 ) ( CLEAR ?auto_51886 ) ( ON ?auto_51885 ?auto_51884 ) ( CLEAR ?auto_51885 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_51888 ?auto_51883 ?auto_51884 )
      ( MAKE-5PILE ?auto_51883 ?auto_51884 ?auto_51885 ?auto_51886 ?auto_51887 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_51890 - BLOCK
      ?auto_51891 - BLOCK
      ?auto_51892 - BLOCK
      ?auto_51893 - BLOCK
      ?auto_51894 - BLOCK
    )
    :vars
    (
      ?auto_51896 - BLOCK
      ?auto_51895 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_51890 ?auto_51891 ) ) ( not ( = ?auto_51890 ?auto_51892 ) ) ( not ( = ?auto_51890 ?auto_51893 ) ) ( not ( = ?auto_51890 ?auto_51894 ) ) ( not ( = ?auto_51891 ?auto_51892 ) ) ( not ( = ?auto_51891 ?auto_51893 ) ) ( not ( = ?auto_51891 ?auto_51894 ) ) ( not ( = ?auto_51892 ?auto_51893 ) ) ( not ( = ?auto_51892 ?auto_51894 ) ) ( not ( = ?auto_51893 ?auto_51894 ) ) ( ON ?auto_51894 ?auto_51896 ) ( not ( = ?auto_51890 ?auto_51896 ) ) ( not ( = ?auto_51891 ?auto_51896 ) ) ( not ( = ?auto_51892 ?auto_51896 ) ) ( not ( = ?auto_51893 ?auto_51896 ) ) ( not ( = ?auto_51894 ?auto_51896 ) ) ( ON-TABLE ?auto_51896 ) ( ON ?auto_51890 ?auto_51895 ) ( not ( = ?auto_51890 ?auto_51895 ) ) ( not ( = ?auto_51891 ?auto_51895 ) ) ( not ( = ?auto_51892 ?auto_51895 ) ) ( not ( = ?auto_51893 ?auto_51895 ) ) ( not ( = ?auto_51894 ?auto_51895 ) ) ( not ( = ?auto_51896 ?auto_51895 ) ) ( ON ?auto_51891 ?auto_51890 ) ( ON-TABLE ?auto_51895 ) ( ON ?auto_51892 ?auto_51891 ) ( CLEAR ?auto_51892 ) ( HOLDING ?auto_51893 ) ( CLEAR ?auto_51894 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_51896 ?auto_51894 ?auto_51893 )
      ( MAKE-5PILE ?auto_51890 ?auto_51891 ?auto_51892 ?auto_51893 ?auto_51894 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_51897 - BLOCK
      ?auto_51898 - BLOCK
      ?auto_51899 - BLOCK
      ?auto_51900 - BLOCK
      ?auto_51901 - BLOCK
    )
    :vars
    (
      ?auto_51902 - BLOCK
      ?auto_51903 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_51897 ?auto_51898 ) ) ( not ( = ?auto_51897 ?auto_51899 ) ) ( not ( = ?auto_51897 ?auto_51900 ) ) ( not ( = ?auto_51897 ?auto_51901 ) ) ( not ( = ?auto_51898 ?auto_51899 ) ) ( not ( = ?auto_51898 ?auto_51900 ) ) ( not ( = ?auto_51898 ?auto_51901 ) ) ( not ( = ?auto_51899 ?auto_51900 ) ) ( not ( = ?auto_51899 ?auto_51901 ) ) ( not ( = ?auto_51900 ?auto_51901 ) ) ( ON ?auto_51901 ?auto_51902 ) ( not ( = ?auto_51897 ?auto_51902 ) ) ( not ( = ?auto_51898 ?auto_51902 ) ) ( not ( = ?auto_51899 ?auto_51902 ) ) ( not ( = ?auto_51900 ?auto_51902 ) ) ( not ( = ?auto_51901 ?auto_51902 ) ) ( ON-TABLE ?auto_51902 ) ( ON ?auto_51897 ?auto_51903 ) ( not ( = ?auto_51897 ?auto_51903 ) ) ( not ( = ?auto_51898 ?auto_51903 ) ) ( not ( = ?auto_51899 ?auto_51903 ) ) ( not ( = ?auto_51900 ?auto_51903 ) ) ( not ( = ?auto_51901 ?auto_51903 ) ) ( not ( = ?auto_51902 ?auto_51903 ) ) ( ON ?auto_51898 ?auto_51897 ) ( ON-TABLE ?auto_51903 ) ( ON ?auto_51899 ?auto_51898 ) ( CLEAR ?auto_51901 ) ( ON ?auto_51900 ?auto_51899 ) ( CLEAR ?auto_51900 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_51903 ?auto_51897 ?auto_51898 ?auto_51899 )
      ( MAKE-5PILE ?auto_51897 ?auto_51898 ?auto_51899 ?auto_51900 ?auto_51901 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_51904 - BLOCK
      ?auto_51905 - BLOCK
      ?auto_51906 - BLOCK
      ?auto_51907 - BLOCK
      ?auto_51908 - BLOCK
    )
    :vars
    (
      ?auto_51910 - BLOCK
      ?auto_51909 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_51904 ?auto_51905 ) ) ( not ( = ?auto_51904 ?auto_51906 ) ) ( not ( = ?auto_51904 ?auto_51907 ) ) ( not ( = ?auto_51904 ?auto_51908 ) ) ( not ( = ?auto_51905 ?auto_51906 ) ) ( not ( = ?auto_51905 ?auto_51907 ) ) ( not ( = ?auto_51905 ?auto_51908 ) ) ( not ( = ?auto_51906 ?auto_51907 ) ) ( not ( = ?auto_51906 ?auto_51908 ) ) ( not ( = ?auto_51907 ?auto_51908 ) ) ( not ( = ?auto_51904 ?auto_51910 ) ) ( not ( = ?auto_51905 ?auto_51910 ) ) ( not ( = ?auto_51906 ?auto_51910 ) ) ( not ( = ?auto_51907 ?auto_51910 ) ) ( not ( = ?auto_51908 ?auto_51910 ) ) ( ON-TABLE ?auto_51910 ) ( ON ?auto_51904 ?auto_51909 ) ( not ( = ?auto_51904 ?auto_51909 ) ) ( not ( = ?auto_51905 ?auto_51909 ) ) ( not ( = ?auto_51906 ?auto_51909 ) ) ( not ( = ?auto_51907 ?auto_51909 ) ) ( not ( = ?auto_51908 ?auto_51909 ) ) ( not ( = ?auto_51910 ?auto_51909 ) ) ( ON ?auto_51905 ?auto_51904 ) ( ON-TABLE ?auto_51909 ) ( ON ?auto_51906 ?auto_51905 ) ( ON ?auto_51907 ?auto_51906 ) ( CLEAR ?auto_51907 ) ( HOLDING ?auto_51908 ) ( CLEAR ?auto_51910 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_51910 ?auto_51908 )
      ( MAKE-5PILE ?auto_51904 ?auto_51905 ?auto_51906 ?auto_51907 ?auto_51908 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_51911 - BLOCK
      ?auto_51912 - BLOCK
      ?auto_51913 - BLOCK
      ?auto_51914 - BLOCK
      ?auto_51915 - BLOCK
    )
    :vars
    (
      ?auto_51917 - BLOCK
      ?auto_51916 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_51911 ?auto_51912 ) ) ( not ( = ?auto_51911 ?auto_51913 ) ) ( not ( = ?auto_51911 ?auto_51914 ) ) ( not ( = ?auto_51911 ?auto_51915 ) ) ( not ( = ?auto_51912 ?auto_51913 ) ) ( not ( = ?auto_51912 ?auto_51914 ) ) ( not ( = ?auto_51912 ?auto_51915 ) ) ( not ( = ?auto_51913 ?auto_51914 ) ) ( not ( = ?auto_51913 ?auto_51915 ) ) ( not ( = ?auto_51914 ?auto_51915 ) ) ( not ( = ?auto_51911 ?auto_51917 ) ) ( not ( = ?auto_51912 ?auto_51917 ) ) ( not ( = ?auto_51913 ?auto_51917 ) ) ( not ( = ?auto_51914 ?auto_51917 ) ) ( not ( = ?auto_51915 ?auto_51917 ) ) ( ON-TABLE ?auto_51917 ) ( ON ?auto_51911 ?auto_51916 ) ( not ( = ?auto_51911 ?auto_51916 ) ) ( not ( = ?auto_51912 ?auto_51916 ) ) ( not ( = ?auto_51913 ?auto_51916 ) ) ( not ( = ?auto_51914 ?auto_51916 ) ) ( not ( = ?auto_51915 ?auto_51916 ) ) ( not ( = ?auto_51917 ?auto_51916 ) ) ( ON ?auto_51912 ?auto_51911 ) ( ON-TABLE ?auto_51916 ) ( ON ?auto_51913 ?auto_51912 ) ( ON ?auto_51914 ?auto_51913 ) ( CLEAR ?auto_51917 ) ( ON ?auto_51915 ?auto_51914 ) ( CLEAR ?auto_51915 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_51916 ?auto_51911 ?auto_51912 ?auto_51913 ?auto_51914 )
      ( MAKE-5PILE ?auto_51911 ?auto_51912 ?auto_51913 ?auto_51914 ?auto_51915 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_51918 - BLOCK
      ?auto_51919 - BLOCK
      ?auto_51920 - BLOCK
      ?auto_51921 - BLOCK
      ?auto_51922 - BLOCK
    )
    :vars
    (
      ?auto_51924 - BLOCK
      ?auto_51923 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_51918 ?auto_51919 ) ) ( not ( = ?auto_51918 ?auto_51920 ) ) ( not ( = ?auto_51918 ?auto_51921 ) ) ( not ( = ?auto_51918 ?auto_51922 ) ) ( not ( = ?auto_51919 ?auto_51920 ) ) ( not ( = ?auto_51919 ?auto_51921 ) ) ( not ( = ?auto_51919 ?auto_51922 ) ) ( not ( = ?auto_51920 ?auto_51921 ) ) ( not ( = ?auto_51920 ?auto_51922 ) ) ( not ( = ?auto_51921 ?auto_51922 ) ) ( not ( = ?auto_51918 ?auto_51924 ) ) ( not ( = ?auto_51919 ?auto_51924 ) ) ( not ( = ?auto_51920 ?auto_51924 ) ) ( not ( = ?auto_51921 ?auto_51924 ) ) ( not ( = ?auto_51922 ?auto_51924 ) ) ( ON ?auto_51918 ?auto_51923 ) ( not ( = ?auto_51918 ?auto_51923 ) ) ( not ( = ?auto_51919 ?auto_51923 ) ) ( not ( = ?auto_51920 ?auto_51923 ) ) ( not ( = ?auto_51921 ?auto_51923 ) ) ( not ( = ?auto_51922 ?auto_51923 ) ) ( not ( = ?auto_51924 ?auto_51923 ) ) ( ON ?auto_51919 ?auto_51918 ) ( ON-TABLE ?auto_51923 ) ( ON ?auto_51920 ?auto_51919 ) ( ON ?auto_51921 ?auto_51920 ) ( ON ?auto_51922 ?auto_51921 ) ( CLEAR ?auto_51922 ) ( HOLDING ?auto_51924 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_51924 )
      ( MAKE-5PILE ?auto_51918 ?auto_51919 ?auto_51920 ?auto_51921 ?auto_51922 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_51925 - BLOCK
      ?auto_51926 - BLOCK
      ?auto_51927 - BLOCK
      ?auto_51928 - BLOCK
      ?auto_51929 - BLOCK
    )
    :vars
    (
      ?auto_51931 - BLOCK
      ?auto_51930 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_51925 ?auto_51926 ) ) ( not ( = ?auto_51925 ?auto_51927 ) ) ( not ( = ?auto_51925 ?auto_51928 ) ) ( not ( = ?auto_51925 ?auto_51929 ) ) ( not ( = ?auto_51926 ?auto_51927 ) ) ( not ( = ?auto_51926 ?auto_51928 ) ) ( not ( = ?auto_51926 ?auto_51929 ) ) ( not ( = ?auto_51927 ?auto_51928 ) ) ( not ( = ?auto_51927 ?auto_51929 ) ) ( not ( = ?auto_51928 ?auto_51929 ) ) ( not ( = ?auto_51925 ?auto_51931 ) ) ( not ( = ?auto_51926 ?auto_51931 ) ) ( not ( = ?auto_51927 ?auto_51931 ) ) ( not ( = ?auto_51928 ?auto_51931 ) ) ( not ( = ?auto_51929 ?auto_51931 ) ) ( ON ?auto_51925 ?auto_51930 ) ( not ( = ?auto_51925 ?auto_51930 ) ) ( not ( = ?auto_51926 ?auto_51930 ) ) ( not ( = ?auto_51927 ?auto_51930 ) ) ( not ( = ?auto_51928 ?auto_51930 ) ) ( not ( = ?auto_51929 ?auto_51930 ) ) ( not ( = ?auto_51931 ?auto_51930 ) ) ( ON ?auto_51926 ?auto_51925 ) ( ON-TABLE ?auto_51930 ) ( ON ?auto_51927 ?auto_51926 ) ( ON ?auto_51928 ?auto_51927 ) ( ON ?auto_51929 ?auto_51928 ) ( ON ?auto_51931 ?auto_51929 ) ( CLEAR ?auto_51931 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_51930 ?auto_51925 ?auto_51926 ?auto_51927 ?auto_51928 ?auto_51929 )
      ( MAKE-5PILE ?auto_51925 ?auto_51926 ?auto_51927 ?auto_51928 ?auto_51929 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_51938 - BLOCK
      ?auto_51939 - BLOCK
      ?auto_51940 - BLOCK
      ?auto_51941 - BLOCK
      ?auto_51942 - BLOCK
      ?auto_51943 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_51943 ) ( CLEAR ?auto_51942 ) ( ON-TABLE ?auto_51938 ) ( ON ?auto_51939 ?auto_51938 ) ( ON ?auto_51940 ?auto_51939 ) ( ON ?auto_51941 ?auto_51940 ) ( ON ?auto_51942 ?auto_51941 ) ( not ( = ?auto_51938 ?auto_51939 ) ) ( not ( = ?auto_51938 ?auto_51940 ) ) ( not ( = ?auto_51938 ?auto_51941 ) ) ( not ( = ?auto_51938 ?auto_51942 ) ) ( not ( = ?auto_51938 ?auto_51943 ) ) ( not ( = ?auto_51939 ?auto_51940 ) ) ( not ( = ?auto_51939 ?auto_51941 ) ) ( not ( = ?auto_51939 ?auto_51942 ) ) ( not ( = ?auto_51939 ?auto_51943 ) ) ( not ( = ?auto_51940 ?auto_51941 ) ) ( not ( = ?auto_51940 ?auto_51942 ) ) ( not ( = ?auto_51940 ?auto_51943 ) ) ( not ( = ?auto_51941 ?auto_51942 ) ) ( not ( = ?auto_51941 ?auto_51943 ) ) ( not ( = ?auto_51942 ?auto_51943 ) ) )
    :subtasks
    ( ( !STACK ?auto_51943 ?auto_51942 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_51944 - BLOCK
      ?auto_51945 - BLOCK
      ?auto_51946 - BLOCK
      ?auto_51947 - BLOCK
      ?auto_51948 - BLOCK
      ?auto_51949 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_51948 ) ( ON-TABLE ?auto_51944 ) ( ON ?auto_51945 ?auto_51944 ) ( ON ?auto_51946 ?auto_51945 ) ( ON ?auto_51947 ?auto_51946 ) ( ON ?auto_51948 ?auto_51947 ) ( not ( = ?auto_51944 ?auto_51945 ) ) ( not ( = ?auto_51944 ?auto_51946 ) ) ( not ( = ?auto_51944 ?auto_51947 ) ) ( not ( = ?auto_51944 ?auto_51948 ) ) ( not ( = ?auto_51944 ?auto_51949 ) ) ( not ( = ?auto_51945 ?auto_51946 ) ) ( not ( = ?auto_51945 ?auto_51947 ) ) ( not ( = ?auto_51945 ?auto_51948 ) ) ( not ( = ?auto_51945 ?auto_51949 ) ) ( not ( = ?auto_51946 ?auto_51947 ) ) ( not ( = ?auto_51946 ?auto_51948 ) ) ( not ( = ?auto_51946 ?auto_51949 ) ) ( not ( = ?auto_51947 ?auto_51948 ) ) ( not ( = ?auto_51947 ?auto_51949 ) ) ( not ( = ?auto_51948 ?auto_51949 ) ) ( ON-TABLE ?auto_51949 ) ( CLEAR ?auto_51949 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_51949 )
      ( MAKE-6PILE ?auto_51944 ?auto_51945 ?auto_51946 ?auto_51947 ?auto_51948 ?auto_51949 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_51950 - BLOCK
      ?auto_51951 - BLOCK
      ?auto_51952 - BLOCK
      ?auto_51953 - BLOCK
      ?auto_51954 - BLOCK
      ?auto_51955 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_51950 ) ( ON ?auto_51951 ?auto_51950 ) ( ON ?auto_51952 ?auto_51951 ) ( ON ?auto_51953 ?auto_51952 ) ( not ( = ?auto_51950 ?auto_51951 ) ) ( not ( = ?auto_51950 ?auto_51952 ) ) ( not ( = ?auto_51950 ?auto_51953 ) ) ( not ( = ?auto_51950 ?auto_51954 ) ) ( not ( = ?auto_51950 ?auto_51955 ) ) ( not ( = ?auto_51951 ?auto_51952 ) ) ( not ( = ?auto_51951 ?auto_51953 ) ) ( not ( = ?auto_51951 ?auto_51954 ) ) ( not ( = ?auto_51951 ?auto_51955 ) ) ( not ( = ?auto_51952 ?auto_51953 ) ) ( not ( = ?auto_51952 ?auto_51954 ) ) ( not ( = ?auto_51952 ?auto_51955 ) ) ( not ( = ?auto_51953 ?auto_51954 ) ) ( not ( = ?auto_51953 ?auto_51955 ) ) ( not ( = ?auto_51954 ?auto_51955 ) ) ( ON-TABLE ?auto_51955 ) ( CLEAR ?auto_51955 ) ( HOLDING ?auto_51954 ) ( CLEAR ?auto_51953 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_51950 ?auto_51951 ?auto_51952 ?auto_51953 ?auto_51954 )
      ( MAKE-6PILE ?auto_51950 ?auto_51951 ?auto_51952 ?auto_51953 ?auto_51954 ?auto_51955 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_51956 - BLOCK
      ?auto_51957 - BLOCK
      ?auto_51958 - BLOCK
      ?auto_51959 - BLOCK
      ?auto_51960 - BLOCK
      ?auto_51961 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_51956 ) ( ON ?auto_51957 ?auto_51956 ) ( ON ?auto_51958 ?auto_51957 ) ( ON ?auto_51959 ?auto_51958 ) ( not ( = ?auto_51956 ?auto_51957 ) ) ( not ( = ?auto_51956 ?auto_51958 ) ) ( not ( = ?auto_51956 ?auto_51959 ) ) ( not ( = ?auto_51956 ?auto_51960 ) ) ( not ( = ?auto_51956 ?auto_51961 ) ) ( not ( = ?auto_51957 ?auto_51958 ) ) ( not ( = ?auto_51957 ?auto_51959 ) ) ( not ( = ?auto_51957 ?auto_51960 ) ) ( not ( = ?auto_51957 ?auto_51961 ) ) ( not ( = ?auto_51958 ?auto_51959 ) ) ( not ( = ?auto_51958 ?auto_51960 ) ) ( not ( = ?auto_51958 ?auto_51961 ) ) ( not ( = ?auto_51959 ?auto_51960 ) ) ( not ( = ?auto_51959 ?auto_51961 ) ) ( not ( = ?auto_51960 ?auto_51961 ) ) ( ON-TABLE ?auto_51961 ) ( CLEAR ?auto_51959 ) ( ON ?auto_51960 ?auto_51961 ) ( CLEAR ?auto_51960 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_51961 )
      ( MAKE-6PILE ?auto_51956 ?auto_51957 ?auto_51958 ?auto_51959 ?auto_51960 ?auto_51961 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_51962 - BLOCK
      ?auto_51963 - BLOCK
      ?auto_51964 - BLOCK
      ?auto_51965 - BLOCK
      ?auto_51966 - BLOCK
      ?auto_51967 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_51962 ) ( ON ?auto_51963 ?auto_51962 ) ( ON ?auto_51964 ?auto_51963 ) ( not ( = ?auto_51962 ?auto_51963 ) ) ( not ( = ?auto_51962 ?auto_51964 ) ) ( not ( = ?auto_51962 ?auto_51965 ) ) ( not ( = ?auto_51962 ?auto_51966 ) ) ( not ( = ?auto_51962 ?auto_51967 ) ) ( not ( = ?auto_51963 ?auto_51964 ) ) ( not ( = ?auto_51963 ?auto_51965 ) ) ( not ( = ?auto_51963 ?auto_51966 ) ) ( not ( = ?auto_51963 ?auto_51967 ) ) ( not ( = ?auto_51964 ?auto_51965 ) ) ( not ( = ?auto_51964 ?auto_51966 ) ) ( not ( = ?auto_51964 ?auto_51967 ) ) ( not ( = ?auto_51965 ?auto_51966 ) ) ( not ( = ?auto_51965 ?auto_51967 ) ) ( not ( = ?auto_51966 ?auto_51967 ) ) ( ON-TABLE ?auto_51967 ) ( ON ?auto_51966 ?auto_51967 ) ( CLEAR ?auto_51966 ) ( HOLDING ?auto_51965 ) ( CLEAR ?auto_51964 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_51962 ?auto_51963 ?auto_51964 ?auto_51965 )
      ( MAKE-6PILE ?auto_51962 ?auto_51963 ?auto_51964 ?auto_51965 ?auto_51966 ?auto_51967 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_51968 - BLOCK
      ?auto_51969 - BLOCK
      ?auto_51970 - BLOCK
      ?auto_51971 - BLOCK
      ?auto_51972 - BLOCK
      ?auto_51973 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_51968 ) ( ON ?auto_51969 ?auto_51968 ) ( ON ?auto_51970 ?auto_51969 ) ( not ( = ?auto_51968 ?auto_51969 ) ) ( not ( = ?auto_51968 ?auto_51970 ) ) ( not ( = ?auto_51968 ?auto_51971 ) ) ( not ( = ?auto_51968 ?auto_51972 ) ) ( not ( = ?auto_51968 ?auto_51973 ) ) ( not ( = ?auto_51969 ?auto_51970 ) ) ( not ( = ?auto_51969 ?auto_51971 ) ) ( not ( = ?auto_51969 ?auto_51972 ) ) ( not ( = ?auto_51969 ?auto_51973 ) ) ( not ( = ?auto_51970 ?auto_51971 ) ) ( not ( = ?auto_51970 ?auto_51972 ) ) ( not ( = ?auto_51970 ?auto_51973 ) ) ( not ( = ?auto_51971 ?auto_51972 ) ) ( not ( = ?auto_51971 ?auto_51973 ) ) ( not ( = ?auto_51972 ?auto_51973 ) ) ( ON-TABLE ?auto_51973 ) ( ON ?auto_51972 ?auto_51973 ) ( CLEAR ?auto_51970 ) ( ON ?auto_51971 ?auto_51972 ) ( CLEAR ?auto_51971 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_51973 ?auto_51972 )
      ( MAKE-6PILE ?auto_51968 ?auto_51969 ?auto_51970 ?auto_51971 ?auto_51972 ?auto_51973 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_51974 - BLOCK
      ?auto_51975 - BLOCK
      ?auto_51976 - BLOCK
      ?auto_51977 - BLOCK
      ?auto_51978 - BLOCK
      ?auto_51979 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_51974 ) ( ON ?auto_51975 ?auto_51974 ) ( not ( = ?auto_51974 ?auto_51975 ) ) ( not ( = ?auto_51974 ?auto_51976 ) ) ( not ( = ?auto_51974 ?auto_51977 ) ) ( not ( = ?auto_51974 ?auto_51978 ) ) ( not ( = ?auto_51974 ?auto_51979 ) ) ( not ( = ?auto_51975 ?auto_51976 ) ) ( not ( = ?auto_51975 ?auto_51977 ) ) ( not ( = ?auto_51975 ?auto_51978 ) ) ( not ( = ?auto_51975 ?auto_51979 ) ) ( not ( = ?auto_51976 ?auto_51977 ) ) ( not ( = ?auto_51976 ?auto_51978 ) ) ( not ( = ?auto_51976 ?auto_51979 ) ) ( not ( = ?auto_51977 ?auto_51978 ) ) ( not ( = ?auto_51977 ?auto_51979 ) ) ( not ( = ?auto_51978 ?auto_51979 ) ) ( ON-TABLE ?auto_51979 ) ( ON ?auto_51978 ?auto_51979 ) ( ON ?auto_51977 ?auto_51978 ) ( CLEAR ?auto_51977 ) ( HOLDING ?auto_51976 ) ( CLEAR ?auto_51975 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_51974 ?auto_51975 ?auto_51976 )
      ( MAKE-6PILE ?auto_51974 ?auto_51975 ?auto_51976 ?auto_51977 ?auto_51978 ?auto_51979 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_51980 - BLOCK
      ?auto_51981 - BLOCK
      ?auto_51982 - BLOCK
      ?auto_51983 - BLOCK
      ?auto_51984 - BLOCK
      ?auto_51985 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_51980 ) ( ON ?auto_51981 ?auto_51980 ) ( not ( = ?auto_51980 ?auto_51981 ) ) ( not ( = ?auto_51980 ?auto_51982 ) ) ( not ( = ?auto_51980 ?auto_51983 ) ) ( not ( = ?auto_51980 ?auto_51984 ) ) ( not ( = ?auto_51980 ?auto_51985 ) ) ( not ( = ?auto_51981 ?auto_51982 ) ) ( not ( = ?auto_51981 ?auto_51983 ) ) ( not ( = ?auto_51981 ?auto_51984 ) ) ( not ( = ?auto_51981 ?auto_51985 ) ) ( not ( = ?auto_51982 ?auto_51983 ) ) ( not ( = ?auto_51982 ?auto_51984 ) ) ( not ( = ?auto_51982 ?auto_51985 ) ) ( not ( = ?auto_51983 ?auto_51984 ) ) ( not ( = ?auto_51983 ?auto_51985 ) ) ( not ( = ?auto_51984 ?auto_51985 ) ) ( ON-TABLE ?auto_51985 ) ( ON ?auto_51984 ?auto_51985 ) ( ON ?auto_51983 ?auto_51984 ) ( CLEAR ?auto_51981 ) ( ON ?auto_51982 ?auto_51983 ) ( CLEAR ?auto_51982 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_51985 ?auto_51984 ?auto_51983 )
      ( MAKE-6PILE ?auto_51980 ?auto_51981 ?auto_51982 ?auto_51983 ?auto_51984 ?auto_51985 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_51986 - BLOCK
      ?auto_51987 - BLOCK
      ?auto_51988 - BLOCK
      ?auto_51989 - BLOCK
      ?auto_51990 - BLOCK
      ?auto_51991 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_51986 ) ( not ( = ?auto_51986 ?auto_51987 ) ) ( not ( = ?auto_51986 ?auto_51988 ) ) ( not ( = ?auto_51986 ?auto_51989 ) ) ( not ( = ?auto_51986 ?auto_51990 ) ) ( not ( = ?auto_51986 ?auto_51991 ) ) ( not ( = ?auto_51987 ?auto_51988 ) ) ( not ( = ?auto_51987 ?auto_51989 ) ) ( not ( = ?auto_51987 ?auto_51990 ) ) ( not ( = ?auto_51987 ?auto_51991 ) ) ( not ( = ?auto_51988 ?auto_51989 ) ) ( not ( = ?auto_51988 ?auto_51990 ) ) ( not ( = ?auto_51988 ?auto_51991 ) ) ( not ( = ?auto_51989 ?auto_51990 ) ) ( not ( = ?auto_51989 ?auto_51991 ) ) ( not ( = ?auto_51990 ?auto_51991 ) ) ( ON-TABLE ?auto_51991 ) ( ON ?auto_51990 ?auto_51991 ) ( ON ?auto_51989 ?auto_51990 ) ( ON ?auto_51988 ?auto_51989 ) ( CLEAR ?auto_51988 ) ( HOLDING ?auto_51987 ) ( CLEAR ?auto_51986 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_51986 ?auto_51987 )
      ( MAKE-6PILE ?auto_51986 ?auto_51987 ?auto_51988 ?auto_51989 ?auto_51990 ?auto_51991 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_51992 - BLOCK
      ?auto_51993 - BLOCK
      ?auto_51994 - BLOCK
      ?auto_51995 - BLOCK
      ?auto_51996 - BLOCK
      ?auto_51997 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_51992 ) ( not ( = ?auto_51992 ?auto_51993 ) ) ( not ( = ?auto_51992 ?auto_51994 ) ) ( not ( = ?auto_51992 ?auto_51995 ) ) ( not ( = ?auto_51992 ?auto_51996 ) ) ( not ( = ?auto_51992 ?auto_51997 ) ) ( not ( = ?auto_51993 ?auto_51994 ) ) ( not ( = ?auto_51993 ?auto_51995 ) ) ( not ( = ?auto_51993 ?auto_51996 ) ) ( not ( = ?auto_51993 ?auto_51997 ) ) ( not ( = ?auto_51994 ?auto_51995 ) ) ( not ( = ?auto_51994 ?auto_51996 ) ) ( not ( = ?auto_51994 ?auto_51997 ) ) ( not ( = ?auto_51995 ?auto_51996 ) ) ( not ( = ?auto_51995 ?auto_51997 ) ) ( not ( = ?auto_51996 ?auto_51997 ) ) ( ON-TABLE ?auto_51997 ) ( ON ?auto_51996 ?auto_51997 ) ( ON ?auto_51995 ?auto_51996 ) ( ON ?auto_51994 ?auto_51995 ) ( CLEAR ?auto_51992 ) ( ON ?auto_51993 ?auto_51994 ) ( CLEAR ?auto_51993 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_51997 ?auto_51996 ?auto_51995 ?auto_51994 )
      ( MAKE-6PILE ?auto_51992 ?auto_51993 ?auto_51994 ?auto_51995 ?auto_51996 ?auto_51997 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_51998 - BLOCK
      ?auto_51999 - BLOCK
      ?auto_52000 - BLOCK
      ?auto_52001 - BLOCK
      ?auto_52002 - BLOCK
      ?auto_52003 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_51998 ?auto_51999 ) ) ( not ( = ?auto_51998 ?auto_52000 ) ) ( not ( = ?auto_51998 ?auto_52001 ) ) ( not ( = ?auto_51998 ?auto_52002 ) ) ( not ( = ?auto_51998 ?auto_52003 ) ) ( not ( = ?auto_51999 ?auto_52000 ) ) ( not ( = ?auto_51999 ?auto_52001 ) ) ( not ( = ?auto_51999 ?auto_52002 ) ) ( not ( = ?auto_51999 ?auto_52003 ) ) ( not ( = ?auto_52000 ?auto_52001 ) ) ( not ( = ?auto_52000 ?auto_52002 ) ) ( not ( = ?auto_52000 ?auto_52003 ) ) ( not ( = ?auto_52001 ?auto_52002 ) ) ( not ( = ?auto_52001 ?auto_52003 ) ) ( not ( = ?auto_52002 ?auto_52003 ) ) ( ON-TABLE ?auto_52003 ) ( ON ?auto_52002 ?auto_52003 ) ( ON ?auto_52001 ?auto_52002 ) ( ON ?auto_52000 ?auto_52001 ) ( ON ?auto_51999 ?auto_52000 ) ( CLEAR ?auto_51999 ) ( HOLDING ?auto_51998 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_51998 )
      ( MAKE-6PILE ?auto_51998 ?auto_51999 ?auto_52000 ?auto_52001 ?auto_52002 ?auto_52003 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_52004 - BLOCK
      ?auto_52005 - BLOCK
      ?auto_52006 - BLOCK
      ?auto_52007 - BLOCK
      ?auto_52008 - BLOCK
      ?auto_52009 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_52004 ?auto_52005 ) ) ( not ( = ?auto_52004 ?auto_52006 ) ) ( not ( = ?auto_52004 ?auto_52007 ) ) ( not ( = ?auto_52004 ?auto_52008 ) ) ( not ( = ?auto_52004 ?auto_52009 ) ) ( not ( = ?auto_52005 ?auto_52006 ) ) ( not ( = ?auto_52005 ?auto_52007 ) ) ( not ( = ?auto_52005 ?auto_52008 ) ) ( not ( = ?auto_52005 ?auto_52009 ) ) ( not ( = ?auto_52006 ?auto_52007 ) ) ( not ( = ?auto_52006 ?auto_52008 ) ) ( not ( = ?auto_52006 ?auto_52009 ) ) ( not ( = ?auto_52007 ?auto_52008 ) ) ( not ( = ?auto_52007 ?auto_52009 ) ) ( not ( = ?auto_52008 ?auto_52009 ) ) ( ON-TABLE ?auto_52009 ) ( ON ?auto_52008 ?auto_52009 ) ( ON ?auto_52007 ?auto_52008 ) ( ON ?auto_52006 ?auto_52007 ) ( ON ?auto_52005 ?auto_52006 ) ( ON ?auto_52004 ?auto_52005 ) ( CLEAR ?auto_52004 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_52009 ?auto_52008 ?auto_52007 ?auto_52006 ?auto_52005 )
      ( MAKE-6PILE ?auto_52004 ?auto_52005 ?auto_52006 ?auto_52007 ?auto_52008 ?auto_52009 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_52010 - BLOCK
      ?auto_52011 - BLOCK
      ?auto_52012 - BLOCK
      ?auto_52013 - BLOCK
      ?auto_52014 - BLOCK
      ?auto_52015 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_52010 ?auto_52011 ) ) ( not ( = ?auto_52010 ?auto_52012 ) ) ( not ( = ?auto_52010 ?auto_52013 ) ) ( not ( = ?auto_52010 ?auto_52014 ) ) ( not ( = ?auto_52010 ?auto_52015 ) ) ( not ( = ?auto_52011 ?auto_52012 ) ) ( not ( = ?auto_52011 ?auto_52013 ) ) ( not ( = ?auto_52011 ?auto_52014 ) ) ( not ( = ?auto_52011 ?auto_52015 ) ) ( not ( = ?auto_52012 ?auto_52013 ) ) ( not ( = ?auto_52012 ?auto_52014 ) ) ( not ( = ?auto_52012 ?auto_52015 ) ) ( not ( = ?auto_52013 ?auto_52014 ) ) ( not ( = ?auto_52013 ?auto_52015 ) ) ( not ( = ?auto_52014 ?auto_52015 ) ) ( ON-TABLE ?auto_52015 ) ( ON ?auto_52014 ?auto_52015 ) ( ON ?auto_52013 ?auto_52014 ) ( ON ?auto_52012 ?auto_52013 ) ( ON ?auto_52011 ?auto_52012 ) ( HOLDING ?auto_52010 ) ( CLEAR ?auto_52011 ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_52015 ?auto_52014 ?auto_52013 ?auto_52012 ?auto_52011 ?auto_52010 )
      ( MAKE-6PILE ?auto_52010 ?auto_52011 ?auto_52012 ?auto_52013 ?auto_52014 ?auto_52015 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_52016 - BLOCK
      ?auto_52017 - BLOCK
      ?auto_52018 - BLOCK
      ?auto_52019 - BLOCK
      ?auto_52020 - BLOCK
      ?auto_52021 - BLOCK
    )
    :vars
    (
      ?auto_52022 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_52016 ?auto_52017 ) ) ( not ( = ?auto_52016 ?auto_52018 ) ) ( not ( = ?auto_52016 ?auto_52019 ) ) ( not ( = ?auto_52016 ?auto_52020 ) ) ( not ( = ?auto_52016 ?auto_52021 ) ) ( not ( = ?auto_52017 ?auto_52018 ) ) ( not ( = ?auto_52017 ?auto_52019 ) ) ( not ( = ?auto_52017 ?auto_52020 ) ) ( not ( = ?auto_52017 ?auto_52021 ) ) ( not ( = ?auto_52018 ?auto_52019 ) ) ( not ( = ?auto_52018 ?auto_52020 ) ) ( not ( = ?auto_52018 ?auto_52021 ) ) ( not ( = ?auto_52019 ?auto_52020 ) ) ( not ( = ?auto_52019 ?auto_52021 ) ) ( not ( = ?auto_52020 ?auto_52021 ) ) ( ON-TABLE ?auto_52021 ) ( ON ?auto_52020 ?auto_52021 ) ( ON ?auto_52019 ?auto_52020 ) ( ON ?auto_52018 ?auto_52019 ) ( ON ?auto_52017 ?auto_52018 ) ( CLEAR ?auto_52017 ) ( ON ?auto_52016 ?auto_52022 ) ( CLEAR ?auto_52016 ) ( HAND-EMPTY ) ( not ( = ?auto_52016 ?auto_52022 ) ) ( not ( = ?auto_52017 ?auto_52022 ) ) ( not ( = ?auto_52018 ?auto_52022 ) ) ( not ( = ?auto_52019 ?auto_52022 ) ) ( not ( = ?auto_52020 ?auto_52022 ) ) ( not ( = ?auto_52021 ?auto_52022 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_52016 ?auto_52022 )
      ( MAKE-6PILE ?auto_52016 ?auto_52017 ?auto_52018 ?auto_52019 ?auto_52020 ?auto_52021 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_52023 - BLOCK
      ?auto_52024 - BLOCK
      ?auto_52025 - BLOCK
      ?auto_52026 - BLOCK
      ?auto_52027 - BLOCK
      ?auto_52028 - BLOCK
    )
    :vars
    (
      ?auto_52029 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_52023 ?auto_52024 ) ) ( not ( = ?auto_52023 ?auto_52025 ) ) ( not ( = ?auto_52023 ?auto_52026 ) ) ( not ( = ?auto_52023 ?auto_52027 ) ) ( not ( = ?auto_52023 ?auto_52028 ) ) ( not ( = ?auto_52024 ?auto_52025 ) ) ( not ( = ?auto_52024 ?auto_52026 ) ) ( not ( = ?auto_52024 ?auto_52027 ) ) ( not ( = ?auto_52024 ?auto_52028 ) ) ( not ( = ?auto_52025 ?auto_52026 ) ) ( not ( = ?auto_52025 ?auto_52027 ) ) ( not ( = ?auto_52025 ?auto_52028 ) ) ( not ( = ?auto_52026 ?auto_52027 ) ) ( not ( = ?auto_52026 ?auto_52028 ) ) ( not ( = ?auto_52027 ?auto_52028 ) ) ( ON-TABLE ?auto_52028 ) ( ON ?auto_52027 ?auto_52028 ) ( ON ?auto_52026 ?auto_52027 ) ( ON ?auto_52025 ?auto_52026 ) ( ON ?auto_52023 ?auto_52029 ) ( CLEAR ?auto_52023 ) ( not ( = ?auto_52023 ?auto_52029 ) ) ( not ( = ?auto_52024 ?auto_52029 ) ) ( not ( = ?auto_52025 ?auto_52029 ) ) ( not ( = ?auto_52026 ?auto_52029 ) ) ( not ( = ?auto_52027 ?auto_52029 ) ) ( not ( = ?auto_52028 ?auto_52029 ) ) ( HOLDING ?auto_52024 ) ( CLEAR ?auto_52025 ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_52028 ?auto_52027 ?auto_52026 ?auto_52025 ?auto_52024 )
      ( MAKE-6PILE ?auto_52023 ?auto_52024 ?auto_52025 ?auto_52026 ?auto_52027 ?auto_52028 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_52030 - BLOCK
      ?auto_52031 - BLOCK
      ?auto_52032 - BLOCK
      ?auto_52033 - BLOCK
      ?auto_52034 - BLOCK
      ?auto_52035 - BLOCK
    )
    :vars
    (
      ?auto_52036 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_52030 ?auto_52031 ) ) ( not ( = ?auto_52030 ?auto_52032 ) ) ( not ( = ?auto_52030 ?auto_52033 ) ) ( not ( = ?auto_52030 ?auto_52034 ) ) ( not ( = ?auto_52030 ?auto_52035 ) ) ( not ( = ?auto_52031 ?auto_52032 ) ) ( not ( = ?auto_52031 ?auto_52033 ) ) ( not ( = ?auto_52031 ?auto_52034 ) ) ( not ( = ?auto_52031 ?auto_52035 ) ) ( not ( = ?auto_52032 ?auto_52033 ) ) ( not ( = ?auto_52032 ?auto_52034 ) ) ( not ( = ?auto_52032 ?auto_52035 ) ) ( not ( = ?auto_52033 ?auto_52034 ) ) ( not ( = ?auto_52033 ?auto_52035 ) ) ( not ( = ?auto_52034 ?auto_52035 ) ) ( ON-TABLE ?auto_52035 ) ( ON ?auto_52034 ?auto_52035 ) ( ON ?auto_52033 ?auto_52034 ) ( ON ?auto_52032 ?auto_52033 ) ( ON ?auto_52030 ?auto_52036 ) ( not ( = ?auto_52030 ?auto_52036 ) ) ( not ( = ?auto_52031 ?auto_52036 ) ) ( not ( = ?auto_52032 ?auto_52036 ) ) ( not ( = ?auto_52033 ?auto_52036 ) ) ( not ( = ?auto_52034 ?auto_52036 ) ) ( not ( = ?auto_52035 ?auto_52036 ) ) ( CLEAR ?auto_52032 ) ( ON ?auto_52031 ?auto_52030 ) ( CLEAR ?auto_52031 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_52036 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_52036 ?auto_52030 )
      ( MAKE-6PILE ?auto_52030 ?auto_52031 ?auto_52032 ?auto_52033 ?auto_52034 ?auto_52035 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_52037 - BLOCK
      ?auto_52038 - BLOCK
      ?auto_52039 - BLOCK
      ?auto_52040 - BLOCK
      ?auto_52041 - BLOCK
      ?auto_52042 - BLOCK
    )
    :vars
    (
      ?auto_52043 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_52037 ?auto_52038 ) ) ( not ( = ?auto_52037 ?auto_52039 ) ) ( not ( = ?auto_52037 ?auto_52040 ) ) ( not ( = ?auto_52037 ?auto_52041 ) ) ( not ( = ?auto_52037 ?auto_52042 ) ) ( not ( = ?auto_52038 ?auto_52039 ) ) ( not ( = ?auto_52038 ?auto_52040 ) ) ( not ( = ?auto_52038 ?auto_52041 ) ) ( not ( = ?auto_52038 ?auto_52042 ) ) ( not ( = ?auto_52039 ?auto_52040 ) ) ( not ( = ?auto_52039 ?auto_52041 ) ) ( not ( = ?auto_52039 ?auto_52042 ) ) ( not ( = ?auto_52040 ?auto_52041 ) ) ( not ( = ?auto_52040 ?auto_52042 ) ) ( not ( = ?auto_52041 ?auto_52042 ) ) ( ON-TABLE ?auto_52042 ) ( ON ?auto_52041 ?auto_52042 ) ( ON ?auto_52040 ?auto_52041 ) ( ON ?auto_52037 ?auto_52043 ) ( not ( = ?auto_52037 ?auto_52043 ) ) ( not ( = ?auto_52038 ?auto_52043 ) ) ( not ( = ?auto_52039 ?auto_52043 ) ) ( not ( = ?auto_52040 ?auto_52043 ) ) ( not ( = ?auto_52041 ?auto_52043 ) ) ( not ( = ?auto_52042 ?auto_52043 ) ) ( ON ?auto_52038 ?auto_52037 ) ( CLEAR ?auto_52038 ) ( ON-TABLE ?auto_52043 ) ( HOLDING ?auto_52039 ) ( CLEAR ?auto_52040 ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_52042 ?auto_52041 ?auto_52040 ?auto_52039 )
      ( MAKE-6PILE ?auto_52037 ?auto_52038 ?auto_52039 ?auto_52040 ?auto_52041 ?auto_52042 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_52044 - BLOCK
      ?auto_52045 - BLOCK
      ?auto_52046 - BLOCK
      ?auto_52047 - BLOCK
      ?auto_52048 - BLOCK
      ?auto_52049 - BLOCK
    )
    :vars
    (
      ?auto_52050 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_52044 ?auto_52045 ) ) ( not ( = ?auto_52044 ?auto_52046 ) ) ( not ( = ?auto_52044 ?auto_52047 ) ) ( not ( = ?auto_52044 ?auto_52048 ) ) ( not ( = ?auto_52044 ?auto_52049 ) ) ( not ( = ?auto_52045 ?auto_52046 ) ) ( not ( = ?auto_52045 ?auto_52047 ) ) ( not ( = ?auto_52045 ?auto_52048 ) ) ( not ( = ?auto_52045 ?auto_52049 ) ) ( not ( = ?auto_52046 ?auto_52047 ) ) ( not ( = ?auto_52046 ?auto_52048 ) ) ( not ( = ?auto_52046 ?auto_52049 ) ) ( not ( = ?auto_52047 ?auto_52048 ) ) ( not ( = ?auto_52047 ?auto_52049 ) ) ( not ( = ?auto_52048 ?auto_52049 ) ) ( ON-TABLE ?auto_52049 ) ( ON ?auto_52048 ?auto_52049 ) ( ON ?auto_52047 ?auto_52048 ) ( ON ?auto_52044 ?auto_52050 ) ( not ( = ?auto_52044 ?auto_52050 ) ) ( not ( = ?auto_52045 ?auto_52050 ) ) ( not ( = ?auto_52046 ?auto_52050 ) ) ( not ( = ?auto_52047 ?auto_52050 ) ) ( not ( = ?auto_52048 ?auto_52050 ) ) ( not ( = ?auto_52049 ?auto_52050 ) ) ( ON ?auto_52045 ?auto_52044 ) ( ON-TABLE ?auto_52050 ) ( CLEAR ?auto_52047 ) ( ON ?auto_52046 ?auto_52045 ) ( CLEAR ?auto_52046 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_52050 ?auto_52044 ?auto_52045 )
      ( MAKE-6PILE ?auto_52044 ?auto_52045 ?auto_52046 ?auto_52047 ?auto_52048 ?auto_52049 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_52051 - BLOCK
      ?auto_52052 - BLOCK
      ?auto_52053 - BLOCK
      ?auto_52054 - BLOCK
      ?auto_52055 - BLOCK
      ?auto_52056 - BLOCK
    )
    :vars
    (
      ?auto_52057 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_52051 ?auto_52052 ) ) ( not ( = ?auto_52051 ?auto_52053 ) ) ( not ( = ?auto_52051 ?auto_52054 ) ) ( not ( = ?auto_52051 ?auto_52055 ) ) ( not ( = ?auto_52051 ?auto_52056 ) ) ( not ( = ?auto_52052 ?auto_52053 ) ) ( not ( = ?auto_52052 ?auto_52054 ) ) ( not ( = ?auto_52052 ?auto_52055 ) ) ( not ( = ?auto_52052 ?auto_52056 ) ) ( not ( = ?auto_52053 ?auto_52054 ) ) ( not ( = ?auto_52053 ?auto_52055 ) ) ( not ( = ?auto_52053 ?auto_52056 ) ) ( not ( = ?auto_52054 ?auto_52055 ) ) ( not ( = ?auto_52054 ?auto_52056 ) ) ( not ( = ?auto_52055 ?auto_52056 ) ) ( ON-TABLE ?auto_52056 ) ( ON ?auto_52055 ?auto_52056 ) ( ON ?auto_52051 ?auto_52057 ) ( not ( = ?auto_52051 ?auto_52057 ) ) ( not ( = ?auto_52052 ?auto_52057 ) ) ( not ( = ?auto_52053 ?auto_52057 ) ) ( not ( = ?auto_52054 ?auto_52057 ) ) ( not ( = ?auto_52055 ?auto_52057 ) ) ( not ( = ?auto_52056 ?auto_52057 ) ) ( ON ?auto_52052 ?auto_52051 ) ( ON-TABLE ?auto_52057 ) ( ON ?auto_52053 ?auto_52052 ) ( CLEAR ?auto_52053 ) ( HOLDING ?auto_52054 ) ( CLEAR ?auto_52055 ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_52056 ?auto_52055 ?auto_52054 )
      ( MAKE-6PILE ?auto_52051 ?auto_52052 ?auto_52053 ?auto_52054 ?auto_52055 ?auto_52056 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_52058 - BLOCK
      ?auto_52059 - BLOCK
      ?auto_52060 - BLOCK
      ?auto_52061 - BLOCK
      ?auto_52062 - BLOCK
      ?auto_52063 - BLOCK
    )
    :vars
    (
      ?auto_52064 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_52058 ?auto_52059 ) ) ( not ( = ?auto_52058 ?auto_52060 ) ) ( not ( = ?auto_52058 ?auto_52061 ) ) ( not ( = ?auto_52058 ?auto_52062 ) ) ( not ( = ?auto_52058 ?auto_52063 ) ) ( not ( = ?auto_52059 ?auto_52060 ) ) ( not ( = ?auto_52059 ?auto_52061 ) ) ( not ( = ?auto_52059 ?auto_52062 ) ) ( not ( = ?auto_52059 ?auto_52063 ) ) ( not ( = ?auto_52060 ?auto_52061 ) ) ( not ( = ?auto_52060 ?auto_52062 ) ) ( not ( = ?auto_52060 ?auto_52063 ) ) ( not ( = ?auto_52061 ?auto_52062 ) ) ( not ( = ?auto_52061 ?auto_52063 ) ) ( not ( = ?auto_52062 ?auto_52063 ) ) ( ON-TABLE ?auto_52063 ) ( ON ?auto_52062 ?auto_52063 ) ( ON ?auto_52058 ?auto_52064 ) ( not ( = ?auto_52058 ?auto_52064 ) ) ( not ( = ?auto_52059 ?auto_52064 ) ) ( not ( = ?auto_52060 ?auto_52064 ) ) ( not ( = ?auto_52061 ?auto_52064 ) ) ( not ( = ?auto_52062 ?auto_52064 ) ) ( not ( = ?auto_52063 ?auto_52064 ) ) ( ON ?auto_52059 ?auto_52058 ) ( ON-TABLE ?auto_52064 ) ( ON ?auto_52060 ?auto_52059 ) ( CLEAR ?auto_52062 ) ( ON ?auto_52061 ?auto_52060 ) ( CLEAR ?auto_52061 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_52064 ?auto_52058 ?auto_52059 ?auto_52060 )
      ( MAKE-6PILE ?auto_52058 ?auto_52059 ?auto_52060 ?auto_52061 ?auto_52062 ?auto_52063 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_52065 - BLOCK
      ?auto_52066 - BLOCK
      ?auto_52067 - BLOCK
      ?auto_52068 - BLOCK
      ?auto_52069 - BLOCK
      ?auto_52070 - BLOCK
    )
    :vars
    (
      ?auto_52071 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_52065 ?auto_52066 ) ) ( not ( = ?auto_52065 ?auto_52067 ) ) ( not ( = ?auto_52065 ?auto_52068 ) ) ( not ( = ?auto_52065 ?auto_52069 ) ) ( not ( = ?auto_52065 ?auto_52070 ) ) ( not ( = ?auto_52066 ?auto_52067 ) ) ( not ( = ?auto_52066 ?auto_52068 ) ) ( not ( = ?auto_52066 ?auto_52069 ) ) ( not ( = ?auto_52066 ?auto_52070 ) ) ( not ( = ?auto_52067 ?auto_52068 ) ) ( not ( = ?auto_52067 ?auto_52069 ) ) ( not ( = ?auto_52067 ?auto_52070 ) ) ( not ( = ?auto_52068 ?auto_52069 ) ) ( not ( = ?auto_52068 ?auto_52070 ) ) ( not ( = ?auto_52069 ?auto_52070 ) ) ( ON-TABLE ?auto_52070 ) ( ON ?auto_52065 ?auto_52071 ) ( not ( = ?auto_52065 ?auto_52071 ) ) ( not ( = ?auto_52066 ?auto_52071 ) ) ( not ( = ?auto_52067 ?auto_52071 ) ) ( not ( = ?auto_52068 ?auto_52071 ) ) ( not ( = ?auto_52069 ?auto_52071 ) ) ( not ( = ?auto_52070 ?auto_52071 ) ) ( ON ?auto_52066 ?auto_52065 ) ( ON-TABLE ?auto_52071 ) ( ON ?auto_52067 ?auto_52066 ) ( ON ?auto_52068 ?auto_52067 ) ( CLEAR ?auto_52068 ) ( HOLDING ?auto_52069 ) ( CLEAR ?auto_52070 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_52070 ?auto_52069 )
      ( MAKE-6PILE ?auto_52065 ?auto_52066 ?auto_52067 ?auto_52068 ?auto_52069 ?auto_52070 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_52072 - BLOCK
      ?auto_52073 - BLOCK
      ?auto_52074 - BLOCK
      ?auto_52075 - BLOCK
      ?auto_52076 - BLOCK
      ?auto_52077 - BLOCK
    )
    :vars
    (
      ?auto_52078 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_52072 ?auto_52073 ) ) ( not ( = ?auto_52072 ?auto_52074 ) ) ( not ( = ?auto_52072 ?auto_52075 ) ) ( not ( = ?auto_52072 ?auto_52076 ) ) ( not ( = ?auto_52072 ?auto_52077 ) ) ( not ( = ?auto_52073 ?auto_52074 ) ) ( not ( = ?auto_52073 ?auto_52075 ) ) ( not ( = ?auto_52073 ?auto_52076 ) ) ( not ( = ?auto_52073 ?auto_52077 ) ) ( not ( = ?auto_52074 ?auto_52075 ) ) ( not ( = ?auto_52074 ?auto_52076 ) ) ( not ( = ?auto_52074 ?auto_52077 ) ) ( not ( = ?auto_52075 ?auto_52076 ) ) ( not ( = ?auto_52075 ?auto_52077 ) ) ( not ( = ?auto_52076 ?auto_52077 ) ) ( ON-TABLE ?auto_52077 ) ( ON ?auto_52072 ?auto_52078 ) ( not ( = ?auto_52072 ?auto_52078 ) ) ( not ( = ?auto_52073 ?auto_52078 ) ) ( not ( = ?auto_52074 ?auto_52078 ) ) ( not ( = ?auto_52075 ?auto_52078 ) ) ( not ( = ?auto_52076 ?auto_52078 ) ) ( not ( = ?auto_52077 ?auto_52078 ) ) ( ON ?auto_52073 ?auto_52072 ) ( ON-TABLE ?auto_52078 ) ( ON ?auto_52074 ?auto_52073 ) ( ON ?auto_52075 ?auto_52074 ) ( CLEAR ?auto_52077 ) ( ON ?auto_52076 ?auto_52075 ) ( CLEAR ?auto_52076 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_52078 ?auto_52072 ?auto_52073 ?auto_52074 ?auto_52075 )
      ( MAKE-6PILE ?auto_52072 ?auto_52073 ?auto_52074 ?auto_52075 ?auto_52076 ?auto_52077 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_52079 - BLOCK
      ?auto_52080 - BLOCK
      ?auto_52081 - BLOCK
      ?auto_52082 - BLOCK
      ?auto_52083 - BLOCK
      ?auto_52084 - BLOCK
    )
    :vars
    (
      ?auto_52085 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_52079 ?auto_52080 ) ) ( not ( = ?auto_52079 ?auto_52081 ) ) ( not ( = ?auto_52079 ?auto_52082 ) ) ( not ( = ?auto_52079 ?auto_52083 ) ) ( not ( = ?auto_52079 ?auto_52084 ) ) ( not ( = ?auto_52080 ?auto_52081 ) ) ( not ( = ?auto_52080 ?auto_52082 ) ) ( not ( = ?auto_52080 ?auto_52083 ) ) ( not ( = ?auto_52080 ?auto_52084 ) ) ( not ( = ?auto_52081 ?auto_52082 ) ) ( not ( = ?auto_52081 ?auto_52083 ) ) ( not ( = ?auto_52081 ?auto_52084 ) ) ( not ( = ?auto_52082 ?auto_52083 ) ) ( not ( = ?auto_52082 ?auto_52084 ) ) ( not ( = ?auto_52083 ?auto_52084 ) ) ( ON ?auto_52079 ?auto_52085 ) ( not ( = ?auto_52079 ?auto_52085 ) ) ( not ( = ?auto_52080 ?auto_52085 ) ) ( not ( = ?auto_52081 ?auto_52085 ) ) ( not ( = ?auto_52082 ?auto_52085 ) ) ( not ( = ?auto_52083 ?auto_52085 ) ) ( not ( = ?auto_52084 ?auto_52085 ) ) ( ON ?auto_52080 ?auto_52079 ) ( ON-TABLE ?auto_52085 ) ( ON ?auto_52081 ?auto_52080 ) ( ON ?auto_52082 ?auto_52081 ) ( ON ?auto_52083 ?auto_52082 ) ( CLEAR ?auto_52083 ) ( HOLDING ?auto_52084 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_52084 )
      ( MAKE-6PILE ?auto_52079 ?auto_52080 ?auto_52081 ?auto_52082 ?auto_52083 ?auto_52084 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_52086 - BLOCK
      ?auto_52087 - BLOCK
      ?auto_52088 - BLOCK
      ?auto_52089 - BLOCK
      ?auto_52090 - BLOCK
      ?auto_52091 - BLOCK
    )
    :vars
    (
      ?auto_52092 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_52086 ?auto_52087 ) ) ( not ( = ?auto_52086 ?auto_52088 ) ) ( not ( = ?auto_52086 ?auto_52089 ) ) ( not ( = ?auto_52086 ?auto_52090 ) ) ( not ( = ?auto_52086 ?auto_52091 ) ) ( not ( = ?auto_52087 ?auto_52088 ) ) ( not ( = ?auto_52087 ?auto_52089 ) ) ( not ( = ?auto_52087 ?auto_52090 ) ) ( not ( = ?auto_52087 ?auto_52091 ) ) ( not ( = ?auto_52088 ?auto_52089 ) ) ( not ( = ?auto_52088 ?auto_52090 ) ) ( not ( = ?auto_52088 ?auto_52091 ) ) ( not ( = ?auto_52089 ?auto_52090 ) ) ( not ( = ?auto_52089 ?auto_52091 ) ) ( not ( = ?auto_52090 ?auto_52091 ) ) ( ON ?auto_52086 ?auto_52092 ) ( not ( = ?auto_52086 ?auto_52092 ) ) ( not ( = ?auto_52087 ?auto_52092 ) ) ( not ( = ?auto_52088 ?auto_52092 ) ) ( not ( = ?auto_52089 ?auto_52092 ) ) ( not ( = ?auto_52090 ?auto_52092 ) ) ( not ( = ?auto_52091 ?auto_52092 ) ) ( ON ?auto_52087 ?auto_52086 ) ( ON-TABLE ?auto_52092 ) ( ON ?auto_52088 ?auto_52087 ) ( ON ?auto_52089 ?auto_52088 ) ( ON ?auto_52090 ?auto_52089 ) ( ON ?auto_52091 ?auto_52090 ) ( CLEAR ?auto_52091 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_52092 ?auto_52086 ?auto_52087 ?auto_52088 ?auto_52089 ?auto_52090 )
      ( MAKE-6PILE ?auto_52086 ?auto_52087 ?auto_52088 ?auto_52089 ?auto_52090 ?auto_52091 ) )
  )

)

