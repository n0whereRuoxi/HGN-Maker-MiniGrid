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

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3259 - BLOCK
      ?auto_3260 - BLOCK
      ?auto_3261 - BLOCK
    )
    :vars
    (
      ?auto_3262 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3262 ?auto_3261 ) ( CLEAR ?auto_3262 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3259 ) ( ON ?auto_3260 ?auto_3259 ) ( ON ?auto_3261 ?auto_3260 ) ( not ( = ?auto_3259 ?auto_3260 ) ) ( not ( = ?auto_3259 ?auto_3261 ) ) ( not ( = ?auto_3259 ?auto_3262 ) ) ( not ( = ?auto_3260 ?auto_3261 ) ) ( not ( = ?auto_3260 ?auto_3262 ) ) ( not ( = ?auto_3261 ?auto_3262 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3262 ?auto_3261 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3264 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_3264 ) )
    :subtasks
    ( ( !PUTDOWN ?auto_3264 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3265 - BLOCK
    )
    :vars
    (
      ?auto_3266 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3265 ?auto_3266 ) ( CLEAR ?auto_3265 ) ( HAND-EMPTY ) ( not ( = ?auto_3265 ?auto_3266 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3265 ?auto_3266 )
      ( MAKE-1PILE ?auto_3265 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3269 - BLOCK
      ?auto_3270 - BLOCK
    )
    :vars
    (
      ?auto_3271 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3271 ?auto_3270 ) ( CLEAR ?auto_3271 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3269 ) ( ON ?auto_3270 ?auto_3269 ) ( not ( = ?auto_3269 ?auto_3270 ) ) ( not ( = ?auto_3269 ?auto_3271 ) ) ( not ( = ?auto_3270 ?auto_3271 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3271 ?auto_3270 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3272 - BLOCK
      ?auto_3273 - BLOCK
    )
    :vars
    (
      ?auto_3274 - BLOCK
      ?auto_3275 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3274 ?auto_3273 ) ( CLEAR ?auto_3274 ) ( ON-TABLE ?auto_3272 ) ( ON ?auto_3273 ?auto_3272 ) ( not ( = ?auto_3272 ?auto_3273 ) ) ( not ( = ?auto_3272 ?auto_3274 ) ) ( not ( = ?auto_3273 ?auto_3274 ) ) ( HOLDING ?auto_3275 ) ( not ( = ?auto_3272 ?auto_3275 ) ) ( not ( = ?auto_3273 ?auto_3275 ) ) ( not ( = ?auto_3274 ?auto_3275 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_3275 )
      ( MAKE-2PILE ?auto_3272 ?auto_3273 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3276 - BLOCK
      ?auto_3277 - BLOCK
    )
    :vars
    (
      ?auto_3278 - BLOCK
      ?auto_3279 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3278 ?auto_3277 ) ( ON-TABLE ?auto_3276 ) ( ON ?auto_3277 ?auto_3276 ) ( not ( = ?auto_3276 ?auto_3277 ) ) ( not ( = ?auto_3276 ?auto_3278 ) ) ( not ( = ?auto_3277 ?auto_3278 ) ) ( not ( = ?auto_3276 ?auto_3279 ) ) ( not ( = ?auto_3277 ?auto_3279 ) ) ( not ( = ?auto_3278 ?auto_3279 ) ) ( ON ?auto_3279 ?auto_3278 ) ( CLEAR ?auto_3279 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_3276 ?auto_3277 ?auto_3278 )
      ( MAKE-2PILE ?auto_3276 ?auto_3277 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3282 - BLOCK
      ?auto_3283 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_3283 ) ( CLEAR ?auto_3282 ) ( ON-TABLE ?auto_3282 ) ( not ( = ?auto_3282 ?auto_3283 ) ) )
    :subtasks
    ( ( !STACK ?auto_3283 ?auto_3282 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3284 - BLOCK
      ?auto_3285 - BLOCK
    )
    :vars
    (
      ?auto_3286 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_3284 ) ( ON-TABLE ?auto_3284 ) ( not ( = ?auto_3284 ?auto_3285 ) ) ( ON ?auto_3285 ?auto_3286 ) ( CLEAR ?auto_3285 ) ( HAND-EMPTY ) ( not ( = ?auto_3284 ?auto_3286 ) ) ( not ( = ?auto_3285 ?auto_3286 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3285 ?auto_3286 )
      ( MAKE-2PILE ?auto_3284 ?auto_3285 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3287 - BLOCK
      ?auto_3288 - BLOCK
    )
    :vars
    (
      ?auto_3289 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3287 ?auto_3288 ) ) ( ON ?auto_3288 ?auto_3289 ) ( CLEAR ?auto_3288 ) ( not ( = ?auto_3287 ?auto_3289 ) ) ( not ( = ?auto_3288 ?auto_3289 ) ) ( HOLDING ?auto_3287 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_3287 )
      ( MAKE-2PILE ?auto_3287 ?auto_3288 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3290 - BLOCK
      ?auto_3291 - BLOCK
    )
    :vars
    (
      ?auto_3292 - BLOCK
      ?auto_3293 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3290 ?auto_3291 ) ) ( ON ?auto_3291 ?auto_3292 ) ( not ( = ?auto_3290 ?auto_3292 ) ) ( not ( = ?auto_3291 ?auto_3292 ) ) ( ON ?auto_3290 ?auto_3291 ) ( CLEAR ?auto_3290 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3293 ) ( ON ?auto_3292 ?auto_3293 ) ( not ( = ?auto_3293 ?auto_3292 ) ) ( not ( = ?auto_3293 ?auto_3291 ) ) ( not ( = ?auto_3293 ?auto_3290 ) ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_3293 ?auto_3292 ?auto_3291 )
      ( MAKE-2PILE ?auto_3290 ?auto_3291 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3295 - BLOCK
    )
    :vars
    (
      ?auto_3296 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3296 ?auto_3295 ) ( CLEAR ?auto_3296 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3295 ) ( not ( = ?auto_3295 ?auto_3296 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3296 ?auto_3295 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3297 - BLOCK
    )
    :vars
    (
      ?auto_3298 - BLOCK
      ?auto_3299 - BLOCK
      ?auto_3300 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3298 ?auto_3297 ) ( CLEAR ?auto_3298 ) ( ON-TABLE ?auto_3297 ) ( not ( = ?auto_3297 ?auto_3298 ) ) ( HOLDING ?auto_3299 ) ( CLEAR ?auto_3300 ) ( not ( = ?auto_3297 ?auto_3299 ) ) ( not ( = ?auto_3297 ?auto_3300 ) ) ( not ( = ?auto_3298 ?auto_3299 ) ) ( not ( = ?auto_3298 ?auto_3300 ) ) ( not ( = ?auto_3299 ?auto_3300 ) ) )
    :subtasks
    ( ( !STACK ?auto_3299 ?auto_3300 )
      ( MAKE-1PILE ?auto_3297 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3387 - BLOCK
    )
    :vars
    (
      ?auto_3389 - BLOCK
      ?auto_3388 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3389 ?auto_3387 ) ( ON-TABLE ?auto_3387 ) ( not ( = ?auto_3387 ?auto_3389 ) ) ( not ( = ?auto_3387 ?auto_3388 ) ) ( not ( = ?auto_3389 ?auto_3388 ) ) ( ON ?auto_3388 ?auto_3389 ) ( CLEAR ?auto_3388 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3387 ?auto_3389 )
      ( MAKE-1PILE ?auto_3387 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3305 - BLOCK
    )
    :vars
    (
      ?auto_3306 - BLOCK
      ?auto_3307 - BLOCK
      ?auto_3308 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3306 ?auto_3305 ) ( ON-TABLE ?auto_3305 ) ( not ( = ?auto_3305 ?auto_3306 ) ) ( not ( = ?auto_3305 ?auto_3307 ) ) ( not ( = ?auto_3305 ?auto_3308 ) ) ( not ( = ?auto_3306 ?auto_3307 ) ) ( not ( = ?auto_3306 ?auto_3308 ) ) ( not ( = ?auto_3307 ?auto_3308 ) ) ( ON ?auto_3307 ?auto_3306 ) ( CLEAR ?auto_3307 ) ( HOLDING ?auto_3308 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_3308 )
      ( MAKE-1PILE ?auto_3305 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3309 - BLOCK
    )
    :vars
    (
      ?auto_3311 - BLOCK
      ?auto_3310 - BLOCK
      ?auto_3312 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3311 ?auto_3309 ) ( ON-TABLE ?auto_3309 ) ( not ( = ?auto_3309 ?auto_3311 ) ) ( not ( = ?auto_3309 ?auto_3310 ) ) ( not ( = ?auto_3309 ?auto_3312 ) ) ( not ( = ?auto_3311 ?auto_3310 ) ) ( not ( = ?auto_3311 ?auto_3312 ) ) ( not ( = ?auto_3310 ?auto_3312 ) ) ( ON ?auto_3310 ?auto_3311 ) ( ON ?auto_3312 ?auto_3310 ) ( CLEAR ?auto_3312 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_3309 ?auto_3311 ?auto_3310 )
      ( MAKE-1PILE ?auto_3309 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3316 - BLOCK
      ?auto_3317 - BLOCK
      ?auto_3318 - BLOCK
    )
    :precondition
    ( and ( HOLDING ?auto_3318 ) ( CLEAR ?auto_3317 ) ( ON-TABLE ?auto_3316 ) ( ON ?auto_3317 ?auto_3316 ) ( not ( = ?auto_3316 ?auto_3317 ) ) ( not ( = ?auto_3316 ?auto_3318 ) ) ( not ( = ?auto_3317 ?auto_3318 ) ) )
    :subtasks
    ( ( !STACK ?auto_3318 ?auto_3317 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3319 - BLOCK
      ?auto_3320 - BLOCK
      ?auto_3321 - BLOCK
    )
    :vars
    (
      ?auto_3322 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_3320 ) ( ON-TABLE ?auto_3319 ) ( ON ?auto_3320 ?auto_3319 ) ( not ( = ?auto_3319 ?auto_3320 ) ) ( not ( = ?auto_3319 ?auto_3321 ) ) ( not ( = ?auto_3320 ?auto_3321 ) ) ( ON ?auto_3321 ?auto_3322 ) ( CLEAR ?auto_3321 ) ( HAND-EMPTY ) ( not ( = ?auto_3319 ?auto_3322 ) ) ( not ( = ?auto_3320 ?auto_3322 ) ) ( not ( = ?auto_3321 ?auto_3322 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3321 ?auto_3322 )
      ( MAKE-3PILE ?auto_3319 ?auto_3320 ?auto_3321 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3323 - BLOCK
      ?auto_3324 - BLOCK
      ?auto_3325 - BLOCK
    )
    :vars
    (
      ?auto_3326 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_3323 ) ( not ( = ?auto_3323 ?auto_3324 ) ) ( not ( = ?auto_3323 ?auto_3325 ) ) ( not ( = ?auto_3324 ?auto_3325 ) ) ( ON ?auto_3325 ?auto_3326 ) ( CLEAR ?auto_3325 ) ( not ( = ?auto_3323 ?auto_3326 ) ) ( not ( = ?auto_3324 ?auto_3326 ) ) ( not ( = ?auto_3325 ?auto_3326 ) ) ( HOLDING ?auto_3324 ) ( CLEAR ?auto_3323 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3323 ?auto_3324 )
      ( MAKE-3PILE ?auto_3323 ?auto_3324 ?auto_3325 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3327 - BLOCK
      ?auto_3328 - BLOCK
      ?auto_3329 - BLOCK
    )
    :vars
    (
      ?auto_3330 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_3327 ) ( not ( = ?auto_3327 ?auto_3328 ) ) ( not ( = ?auto_3327 ?auto_3329 ) ) ( not ( = ?auto_3328 ?auto_3329 ) ) ( ON ?auto_3329 ?auto_3330 ) ( not ( = ?auto_3327 ?auto_3330 ) ) ( not ( = ?auto_3328 ?auto_3330 ) ) ( not ( = ?auto_3329 ?auto_3330 ) ) ( CLEAR ?auto_3327 ) ( ON ?auto_3328 ?auto_3329 ) ( CLEAR ?auto_3328 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3330 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3330 ?auto_3329 )
      ( MAKE-3PILE ?auto_3327 ?auto_3328 ?auto_3329 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3331 - BLOCK
      ?auto_3332 - BLOCK
      ?auto_3333 - BLOCK
    )
    :vars
    (
      ?auto_3334 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3331 ?auto_3332 ) ) ( not ( = ?auto_3331 ?auto_3333 ) ) ( not ( = ?auto_3332 ?auto_3333 ) ) ( ON ?auto_3333 ?auto_3334 ) ( not ( = ?auto_3331 ?auto_3334 ) ) ( not ( = ?auto_3332 ?auto_3334 ) ) ( not ( = ?auto_3333 ?auto_3334 ) ) ( ON ?auto_3332 ?auto_3333 ) ( CLEAR ?auto_3332 ) ( ON-TABLE ?auto_3334 ) ( HOLDING ?auto_3331 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_3331 )
      ( MAKE-3PILE ?auto_3331 ?auto_3332 ?auto_3333 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3335 - BLOCK
      ?auto_3336 - BLOCK
      ?auto_3337 - BLOCK
    )
    :vars
    (
      ?auto_3338 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3335 ?auto_3336 ) ) ( not ( = ?auto_3335 ?auto_3337 ) ) ( not ( = ?auto_3336 ?auto_3337 ) ) ( ON ?auto_3337 ?auto_3338 ) ( not ( = ?auto_3335 ?auto_3338 ) ) ( not ( = ?auto_3336 ?auto_3338 ) ) ( not ( = ?auto_3337 ?auto_3338 ) ) ( ON ?auto_3336 ?auto_3337 ) ( ON-TABLE ?auto_3338 ) ( ON ?auto_3335 ?auto_3336 ) ( CLEAR ?auto_3335 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_3338 ?auto_3337 ?auto_3336 )
      ( MAKE-3PILE ?auto_3335 ?auto_3336 ?auto_3337 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3365 - BLOCK
    )
    :vars
    (
      ?auto_3366 - BLOCK
      ?auto_3367 - BLOCK
      ?auto_3368 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3365 ?auto_3366 ) ( CLEAR ?auto_3365 ) ( not ( = ?auto_3365 ?auto_3366 ) ) ( HOLDING ?auto_3367 ) ( CLEAR ?auto_3368 ) ( not ( = ?auto_3365 ?auto_3367 ) ) ( not ( = ?auto_3365 ?auto_3368 ) ) ( not ( = ?auto_3366 ?auto_3367 ) ) ( not ( = ?auto_3366 ?auto_3368 ) ) ( not ( = ?auto_3367 ?auto_3368 ) ) )
    :subtasks
    ( ( !STACK ?auto_3367 ?auto_3368 )
      ( MAKE-1PILE ?auto_3365 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3369 - BLOCK
    )
    :vars
    (
      ?auto_3372 - BLOCK
      ?auto_3370 - BLOCK
      ?auto_3371 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3369 ?auto_3372 ) ( not ( = ?auto_3369 ?auto_3372 ) ) ( CLEAR ?auto_3370 ) ( not ( = ?auto_3369 ?auto_3371 ) ) ( not ( = ?auto_3369 ?auto_3370 ) ) ( not ( = ?auto_3372 ?auto_3371 ) ) ( not ( = ?auto_3372 ?auto_3370 ) ) ( not ( = ?auto_3371 ?auto_3370 ) ) ( ON ?auto_3371 ?auto_3369 ) ( CLEAR ?auto_3371 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3372 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3372 ?auto_3369 )
      ( MAKE-1PILE ?auto_3369 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3373 - BLOCK
    )
    :vars
    (
      ?auto_3376 - BLOCK
      ?auto_3374 - BLOCK
      ?auto_3375 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3373 ?auto_3376 ) ( not ( = ?auto_3373 ?auto_3376 ) ) ( not ( = ?auto_3373 ?auto_3374 ) ) ( not ( = ?auto_3373 ?auto_3375 ) ) ( not ( = ?auto_3376 ?auto_3374 ) ) ( not ( = ?auto_3376 ?auto_3375 ) ) ( not ( = ?auto_3374 ?auto_3375 ) ) ( ON ?auto_3374 ?auto_3373 ) ( CLEAR ?auto_3374 ) ( ON-TABLE ?auto_3376 ) ( HOLDING ?auto_3375 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_3375 )
      ( MAKE-1PILE ?auto_3373 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3377 - BLOCK
    )
    :vars
    (
      ?auto_3378 - BLOCK
      ?auto_3379 - BLOCK
      ?auto_3380 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3377 ?auto_3378 ) ( not ( = ?auto_3377 ?auto_3378 ) ) ( not ( = ?auto_3377 ?auto_3379 ) ) ( not ( = ?auto_3377 ?auto_3380 ) ) ( not ( = ?auto_3378 ?auto_3379 ) ) ( not ( = ?auto_3378 ?auto_3380 ) ) ( not ( = ?auto_3379 ?auto_3380 ) ) ( ON ?auto_3379 ?auto_3377 ) ( ON-TABLE ?auto_3378 ) ( ON ?auto_3380 ?auto_3379 ) ( CLEAR ?auto_3380 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_3378 ?auto_3377 ?auto_3379 )
      ( MAKE-1PILE ?auto_3377 ) )
  )

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_3384 - BLOCK
    )
    :vars
    (
      ?auto_3385 - BLOCK
      ?auto_3386 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_3385 ?auto_3384 ) ( CLEAR ?auto_3385 ) ( ON-TABLE ?auto_3384 ) ( not ( = ?auto_3384 ?auto_3385 ) ) ( HOLDING ?auto_3386 ) ( not ( = ?auto_3384 ?auto_3386 ) ) ( not ( = ?auto_3385 ?auto_3386 ) ) )
    :subtasks
    ( ( !PUTDOWN ?auto_3386 )
      ( MAKE-1PILE ?auto_3384 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3409 - BLOCK
      ?auto_3410 - BLOCK
    )
    :vars
    (
      ?auto_3411 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3409 ?auto_3410 ) ) ( ON ?auto_3410 ?auto_3411 ) ( not ( = ?auto_3409 ?auto_3411 ) ) ( not ( = ?auto_3410 ?auto_3411 ) ) ( ON ?auto_3409 ?auto_3410 ) ( CLEAR ?auto_3409 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3411 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3411 ?auto_3410 )
      ( MAKE-2PILE ?auto_3409 ?auto_3410 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3414 - BLOCK
      ?auto_3415 - BLOCK
    )
    :vars
    (
      ?auto_3416 - BLOCK
      ?auto_3417 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3414 ?auto_3415 ) ) ( ON ?auto_3415 ?auto_3416 ) ( CLEAR ?auto_3415 ) ( not ( = ?auto_3414 ?auto_3416 ) ) ( not ( = ?auto_3415 ?auto_3416 ) ) ( ON ?auto_3414 ?auto_3417 ) ( CLEAR ?auto_3414 ) ( HAND-EMPTY ) ( not ( = ?auto_3414 ?auto_3417 ) ) ( not ( = ?auto_3415 ?auto_3417 ) ) ( not ( = ?auto_3416 ?auto_3417 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3414 ?auto_3417 )
      ( MAKE-2PILE ?auto_3414 ?auto_3415 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3418 - BLOCK
      ?auto_3419 - BLOCK
    )
    :vars
    (
      ?auto_3421 - BLOCK
      ?auto_3420 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3418 ?auto_3419 ) ) ( not ( = ?auto_3418 ?auto_3421 ) ) ( not ( = ?auto_3419 ?auto_3421 ) ) ( ON ?auto_3418 ?auto_3420 ) ( CLEAR ?auto_3418 ) ( not ( = ?auto_3418 ?auto_3420 ) ) ( not ( = ?auto_3419 ?auto_3420 ) ) ( not ( = ?auto_3421 ?auto_3420 ) ) ( HOLDING ?auto_3419 ) ( CLEAR ?auto_3421 ) ( ON-TABLE ?auto_3421 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3421 ?auto_3419 )
      ( MAKE-2PILE ?auto_3418 ?auto_3419 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3422 - BLOCK
      ?auto_3423 - BLOCK
    )
    :vars
    (
      ?auto_3424 - BLOCK
      ?auto_3425 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3422 ?auto_3423 ) ) ( not ( = ?auto_3422 ?auto_3424 ) ) ( not ( = ?auto_3423 ?auto_3424 ) ) ( ON ?auto_3422 ?auto_3425 ) ( not ( = ?auto_3422 ?auto_3425 ) ) ( not ( = ?auto_3423 ?auto_3425 ) ) ( not ( = ?auto_3424 ?auto_3425 ) ) ( CLEAR ?auto_3424 ) ( ON-TABLE ?auto_3424 ) ( ON ?auto_3423 ?auto_3422 ) ( CLEAR ?auto_3423 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3425 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3425 ?auto_3422 )
      ( MAKE-2PILE ?auto_3422 ?auto_3423 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3426 - BLOCK
      ?auto_3427 - BLOCK
    )
    :vars
    (
      ?auto_3429 - BLOCK
      ?auto_3428 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3426 ?auto_3427 ) ) ( not ( = ?auto_3426 ?auto_3429 ) ) ( not ( = ?auto_3427 ?auto_3429 ) ) ( ON ?auto_3426 ?auto_3428 ) ( not ( = ?auto_3426 ?auto_3428 ) ) ( not ( = ?auto_3427 ?auto_3428 ) ) ( not ( = ?auto_3429 ?auto_3428 ) ) ( ON ?auto_3427 ?auto_3426 ) ( CLEAR ?auto_3427 ) ( ON-TABLE ?auto_3428 ) ( HOLDING ?auto_3429 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_3429 )
      ( MAKE-2PILE ?auto_3426 ?auto_3427 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_3430 - BLOCK
      ?auto_3431 - BLOCK
    )
    :vars
    (
      ?auto_3433 - BLOCK
      ?auto_3432 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3430 ?auto_3431 ) ) ( not ( = ?auto_3430 ?auto_3433 ) ) ( not ( = ?auto_3431 ?auto_3433 ) ) ( ON ?auto_3430 ?auto_3432 ) ( not ( = ?auto_3430 ?auto_3432 ) ) ( not ( = ?auto_3431 ?auto_3432 ) ) ( not ( = ?auto_3433 ?auto_3432 ) ) ( ON ?auto_3431 ?auto_3430 ) ( ON-TABLE ?auto_3432 ) ( ON ?auto_3433 ?auto_3431 ) ( CLEAR ?auto_3433 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_3432 ?auto_3430 ?auto_3431 )
      ( MAKE-2PILE ?auto_3430 ?auto_3431 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3440 - BLOCK
      ?auto_3441 - BLOCK
      ?auto_3442 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_3441 ) ( ON-TABLE ?auto_3440 ) ( ON ?auto_3441 ?auto_3440 ) ( not ( = ?auto_3440 ?auto_3441 ) ) ( not ( = ?auto_3440 ?auto_3442 ) ) ( not ( = ?auto_3441 ?auto_3442 ) ) ( ON-TABLE ?auto_3442 ) ( CLEAR ?auto_3442 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( !PICKUP ?auto_3442 )
      ( MAKE-3PILE ?auto_3440 ?auto_3441 ?auto_3442 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3443 - BLOCK
      ?auto_3444 - BLOCK
      ?auto_3445 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_3443 ) ( not ( = ?auto_3443 ?auto_3444 ) ) ( not ( = ?auto_3443 ?auto_3445 ) ) ( not ( = ?auto_3444 ?auto_3445 ) ) ( ON-TABLE ?auto_3445 ) ( CLEAR ?auto_3445 ) ( HOLDING ?auto_3444 ) ( CLEAR ?auto_3443 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3443 ?auto_3444 )
      ( MAKE-3PILE ?auto_3443 ?auto_3444 ?auto_3445 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3446 - BLOCK
      ?auto_3447 - BLOCK
      ?auto_3448 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_3446 ) ( not ( = ?auto_3446 ?auto_3447 ) ) ( not ( = ?auto_3446 ?auto_3448 ) ) ( not ( = ?auto_3447 ?auto_3448 ) ) ( ON-TABLE ?auto_3448 ) ( CLEAR ?auto_3446 ) ( ON ?auto_3447 ?auto_3448 ) ( CLEAR ?auto_3447 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_3448 )
      ( MAKE-3PILE ?auto_3446 ?auto_3447 ?auto_3448 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3449 - BLOCK
      ?auto_3450 - BLOCK
      ?auto_3451 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3449 ?auto_3450 ) ) ( not ( = ?auto_3449 ?auto_3451 ) ) ( not ( = ?auto_3450 ?auto_3451 ) ) ( ON-TABLE ?auto_3451 ) ( ON ?auto_3450 ?auto_3451 ) ( CLEAR ?auto_3450 ) ( HOLDING ?auto_3449 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_3449 )
      ( MAKE-3PILE ?auto_3449 ?auto_3450 ?auto_3451 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3452 - BLOCK
      ?auto_3453 - BLOCK
      ?auto_3454 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3452 ?auto_3453 ) ) ( not ( = ?auto_3452 ?auto_3454 ) ) ( not ( = ?auto_3453 ?auto_3454 ) ) ( ON-TABLE ?auto_3454 ) ( ON ?auto_3453 ?auto_3454 ) ( ON ?auto_3452 ?auto_3453 ) ( CLEAR ?auto_3452 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3454 ?auto_3453 )
      ( MAKE-3PILE ?auto_3452 ?auto_3453 ?auto_3454 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3458 - BLOCK
      ?auto_3459 - BLOCK
      ?auto_3460 - BLOCK
    )
    :vars
    (
      ?auto_3461 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3458 ?auto_3459 ) ) ( not ( = ?auto_3458 ?auto_3460 ) ) ( not ( = ?auto_3459 ?auto_3460 ) ) ( ON-TABLE ?auto_3460 ) ( ON ?auto_3459 ?auto_3460 ) ( CLEAR ?auto_3459 ) ( ON ?auto_3458 ?auto_3461 ) ( CLEAR ?auto_3458 ) ( HAND-EMPTY ) ( not ( = ?auto_3458 ?auto_3461 ) ) ( not ( = ?auto_3459 ?auto_3461 ) ) ( not ( = ?auto_3460 ?auto_3461 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_3458 ?auto_3461 )
      ( MAKE-3PILE ?auto_3458 ?auto_3459 ?auto_3460 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3462 - BLOCK
      ?auto_3463 - BLOCK
      ?auto_3464 - BLOCK
    )
    :vars
    (
      ?auto_3465 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3462 ?auto_3463 ) ) ( not ( = ?auto_3462 ?auto_3464 ) ) ( not ( = ?auto_3463 ?auto_3464 ) ) ( ON-TABLE ?auto_3464 ) ( ON ?auto_3462 ?auto_3465 ) ( CLEAR ?auto_3462 ) ( not ( = ?auto_3462 ?auto_3465 ) ) ( not ( = ?auto_3463 ?auto_3465 ) ) ( not ( = ?auto_3464 ?auto_3465 ) ) ( HOLDING ?auto_3463 ) ( CLEAR ?auto_3464 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3464 ?auto_3463 )
      ( MAKE-3PILE ?auto_3462 ?auto_3463 ?auto_3464 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3466 - BLOCK
      ?auto_3467 - BLOCK
      ?auto_3468 - BLOCK
    )
    :vars
    (
      ?auto_3469 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3466 ?auto_3467 ) ) ( not ( = ?auto_3466 ?auto_3468 ) ) ( not ( = ?auto_3467 ?auto_3468 ) ) ( ON-TABLE ?auto_3468 ) ( ON ?auto_3466 ?auto_3469 ) ( not ( = ?auto_3466 ?auto_3469 ) ) ( not ( = ?auto_3467 ?auto_3469 ) ) ( not ( = ?auto_3468 ?auto_3469 ) ) ( CLEAR ?auto_3468 ) ( ON ?auto_3467 ?auto_3466 ) ( CLEAR ?auto_3467 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_3469 ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_3469 ?auto_3466 )
      ( MAKE-3PILE ?auto_3466 ?auto_3467 ?auto_3468 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3470 - BLOCK
      ?auto_3471 - BLOCK
      ?auto_3472 - BLOCK
    )
    :vars
    (
      ?auto_3473 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3470 ?auto_3471 ) ) ( not ( = ?auto_3470 ?auto_3472 ) ) ( not ( = ?auto_3471 ?auto_3472 ) ) ( ON ?auto_3470 ?auto_3473 ) ( not ( = ?auto_3470 ?auto_3473 ) ) ( not ( = ?auto_3471 ?auto_3473 ) ) ( not ( = ?auto_3472 ?auto_3473 ) ) ( ON ?auto_3471 ?auto_3470 ) ( CLEAR ?auto_3471 ) ( ON-TABLE ?auto_3473 ) ( HOLDING ?auto_3472 ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_3472 )
      ( MAKE-3PILE ?auto_3470 ?auto_3471 ?auto_3472 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_3474 - BLOCK
      ?auto_3475 - BLOCK
      ?auto_3476 - BLOCK
    )
    :vars
    (
      ?auto_3477 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_3474 ?auto_3475 ) ) ( not ( = ?auto_3474 ?auto_3476 ) ) ( not ( = ?auto_3475 ?auto_3476 ) ) ( ON ?auto_3474 ?auto_3477 ) ( not ( = ?auto_3474 ?auto_3477 ) ) ( not ( = ?auto_3475 ?auto_3477 ) ) ( not ( = ?auto_3476 ?auto_3477 ) ) ( ON ?auto_3475 ?auto_3474 ) ( ON-TABLE ?auto_3477 ) ( ON ?auto_3476 ?auto_3475 ) ( CLEAR ?auto_3476 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_3477 ?auto_3474 ?auto_3475 )
      ( MAKE-3PILE ?auto_3474 ?auto_3475 ?auto_3476 ) )
  )

)

