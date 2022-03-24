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

  ( :method MAKE-1PILE
    :parameters
    (
      ?auto_16236 - BLOCK
    )
    :vars
    (
      ?auto_16237 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16236 ?auto_16237 ) ( CLEAR ?auto_16236 ) ( HAND-EMPTY ) ( not ( = ?auto_16236 ?auto_16237 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_16236 ?auto_16237 )
      ( !PUTDOWN ?auto_16236 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_16243 - BLOCK
      ?auto_16244 - BLOCK
    )
    :vars
    (
      ?auto_16245 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_16243 ) ( ON ?auto_16244 ?auto_16245 ) ( CLEAR ?auto_16244 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_16243 ) ( not ( = ?auto_16243 ?auto_16244 ) ) ( not ( = ?auto_16243 ?auto_16245 ) ) ( not ( = ?auto_16244 ?auto_16245 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_16244 ?auto_16245 )
      ( !STACK ?auto_16244 ?auto_16243 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_16253 - BLOCK
      ?auto_16254 - BLOCK
    )
    :vars
    (
      ?auto_16255 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16254 ?auto_16255 ) ( not ( = ?auto_16253 ?auto_16254 ) ) ( not ( = ?auto_16253 ?auto_16255 ) ) ( not ( = ?auto_16254 ?auto_16255 ) ) ( ON ?auto_16253 ?auto_16254 ) ( CLEAR ?auto_16253 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_16253 )
      ( MAKE-2PILE ?auto_16253 ?auto_16254 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_16264 - BLOCK
      ?auto_16265 - BLOCK
      ?auto_16266 - BLOCK
    )
    :vars
    (
      ?auto_16267 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_16265 ) ( ON ?auto_16266 ?auto_16267 ) ( CLEAR ?auto_16266 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_16264 ) ( ON ?auto_16265 ?auto_16264 ) ( not ( = ?auto_16264 ?auto_16265 ) ) ( not ( = ?auto_16264 ?auto_16266 ) ) ( not ( = ?auto_16264 ?auto_16267 ) ) ( not ( = ?auto_16265 ?auto_16266 ) ) ( not ( = ?auto_16265 ?auto_16267 ) ) ( not ( = ?auto_16266 ?auto_16267 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_16266 ?auto_16267 )
      ( !STACK ?auto_16266 ?auto_16265 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_16278 - BLOCK
      ?auto_16279 - BLOCK
      ?auto_16280 - BLOCK
    )
    :vars
    (
      ?auto_16281 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16280 ?auto_16281 ) ( ON-TABLE ?auto_16278 ) ( not ( = ?auto_16278 ?auto_16279 ) ) ( not ( = ?auto_16278 ?auto_16280 ) ) ( not ( = ?auto_16278 ?auto_16281 ) ) ( not ( = ?auto_16279 ?auto_16280 ) ) ( not ( = ?auto_16279 ?auto_16281 ) ) ( not ( = ?auto_16280 ?auto_16281 ) ) ( CLEAR ?auto_16278 ) ( ON ?auto_16279 ?auto_16280 ) ( CLEAR ?auto_16279 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_16278 ?auto_16279 )
      ( MAKE-3PILE ?auto_16278 ?auto_16279 ?auto_16280 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_16292 - BLOCK
      ?auto_16293 - BLOCK
      ?auto_16294 - BLOCK
    )
    :vars
    (
      ?auto_16295 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16294 ?auto_16295 ) ( not ( = ?auto_16292 ?auto_16293 ) ) ( not ( = ?auto_16292 ?auto_16294 ) ) ( not ( = ?auto_16292 ?auto_16295 ) ) ( not ( = ?auto_16293 ?auto_16294 ) ) ( not ( = ?auto_16293 ?auto_16295 ) ) ( not ( = ?auto_16294 ?auto_16295 ) ) ( ON ?auto_16293 ?auto_16294 ) ( ON ?auto_16292 ?auto_16293 ) ( CLEAR ?auto_16292 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_16292 )
      ( MAKE-3PILE ?auto_16292 ?auto_16293 ?auto_16294 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_16307 - BLOCK
      ?auto_16308 - BLOCK
      ?auto_16309 - BLOCK
      ?auto_16310 - BLOCK
    )
    :vars
    (
      ?auto_16311 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_16309 ) ( ON ?auto_16310 ?auto_16311 ) ( CLEAR ?auto_16310 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_16307 ) ( ON ?auto_16308 ?auto_16307 ) ( ON ?auto_16309 ?auto_16308 ) ( not ( = ?auto_16307 ?auto_16308 ) ) ( not ( = ?auto_16307 ?auto_16309 ) ) ( not ( = ?auto_16307 ?auto_16310 ) ) ( not ( = ?auto_16307 ?auto_16311 ) ) ( not ( = ?auto_16308 ?auto_16309 ) ) ( not ( = ?auto_16308 ?auto_16310 ) ) ( not ( = ?auto_16308 ?auto_16311 ) ) ( not ( = ?auto_16309 ?auto_16310 ) ) ( not ( = ?auto_16309 ?auto_16311 ) ) ( not ( = ?auto_16310 ?auto_16311 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_16310 ?auto_16311 )
      ( !STACK ?auto_16310 ?auto_16309 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_16325 - BLOCK
      ?auto_16326 - BLOCK
      ?auto_16327 - BLOCK
      ?auto_16328 - BLOCK
    )
    :vars
    (
      ?auto_16329 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16328 ?auto_16329 ) ( ON-TABLE ?auto_16325 ) ( ON ?auto_16326 ?auto_16325 ) ( not ( = ?auto_16325 ?auto_16326 ) ) ( not ( = ?auto_16325 ?auto_16327 ) ) ( not ( = ?auto_16325 ?auto_16328 ) ) ( not ( = ?auto_16325 ?auto_16329 ) ) ( not ( = ?auto_16326 ?auto_16327 ) ) ( not ( = ?auto_16326 ?auto_16328 ) ) ( not ( = ?auto_16326 ?auto_16329 ) ) ( not ( = ?auto_16327 ?auto_16328 ) ) ( not ( = ?auto_16327 ?auto_16329 ) ) ( not ( = ?auto_16328 ?auto_16329 ) ) ( CLEAR ?auto_16326 ) ( ON ?auto_16327 ?auto_16328 ) ( CLEAR ?auto_16327 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_16325 ?auto_16326 ?auto_16327 )
      ( MAKE-4PILE ?auto_16325 ?auto_16326 ?auto_16327 ?auto_16328 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_16343 - BLOCK
      ?auto_16344 - BLOCK
      ?auto_16345 - BLOCK
      ?auto_16346 - BLOCK
    )
    :vars
    (
      ?auto_16347 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16346 ?auto_16347 ) ( ON-TABLE ?auto_16343 ) ( not ( = ?auto_16343 ?auto_16344 ) ) ( not ( = ?auto_16343 ?auto_16345 ) ) ( not ( = ?auto_16343 ?auto_16346 ) ) ( not ( = ?auto_16343 ?auto_16347 ) ) ( not ( = ?auto_16344 ?auto_16345 ) ) ( not ( = ?auto_16344 ?auto_16346 ) ) ( not ( = ?auto_16344 ?auto_16347 ) ) ( not ( = ?auto_16345 ?auto_16346 ) ) ( not ( = ?auto_16345 ?auto_16347 ) ) ( not ( = ?auto_16346 ?auto_16347 ) ) ( ON ?auto_16345 ?auto_16346 ) ( CLEAR ?auto_16343 ) ( ON ?auto_16344 ?auto_16345 ) ( CLEAR ?auto_16344 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_16343 ?auto_16344 )
      ( MAKE-4PILE ?auto_16343 ?auto_16344 ?auto_16345 ?auto_16346 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_16361 - BLOCK
      ?auto_16362 - BLOCK
      ?auto_16363 - BLOCK
      ?auto_16364 - BLOCK
    )
    :vars
    (
      ?auto_16365 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16364 ?auto_16365 ) ( not ( = ?auto_16361 ?auto_16362 ) ) ( not ( = ?auto_16361 ?auto_16363 ) ) ( not ( = ?auto_16361 ?auto_16364 ) ) ( not ( = ?auto_16361 ?auto_16365 ) ) ( not ( = ?auto_16362 ?auto_16363 ) ) ( not ( = ?auto_16362 ?auto_16364 ) ) ( not ( = ?auto_16362 ?auto_16365 ) ) ( not ( = ?auto_16363 ?auto_16364 ) ) ( not ( = ?auto_16363 ?auto_16365 ) ) ( not ( = ?auto_16364 ?auto_16365 ) ) ( ON ?auto_16363 ?auto_16364 ) ( ON ?auto_16362 ?auto_16363 ) ( ON ?auto_16361 ?auto_16362 ) ( CLEAR ?auto_16361 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_16361 )
      ( MAKE-4PILE ?auto_16361 ?auto_16362 ?auto_16363 ?auto_16364 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_16380 - BLOCK
      ?auto_16381 - BLOCK
      ?auto_16382 - BLOCK
      ?auto_16383 - BLOCK
      ?auto_16384 - BLOCK
    )
    :vars
    (
      ?auto_16385 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_16383 ) ( ON ?auto_16384 ?auto_16385 ) ( CLEAR ?auto_16384 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_16380 ) ( ON ?auto_16381 ?auto_16380 ) ( ON ?auto_16382 ?auto_16381 ) ( ON ?auto_16383 ?auto_16382 ) ( not ( = ?auto_16380 ?auto_16381 ) ) ( not ( = ?auto_16380 ?auto_16382 ) ) ( not ( = ?auto_16380 ?auto_16383 ) ) ( not ( = ?auto_16380 ?auto_16384 ) ) ( not ( = ?auto_16380 ?auto_16385 ) ) ( not ( = ?auto_16381 ?auto_16382 ) ) ( not ( = ?auto_16381 ?auto_16383 ) ) ( not ( = ?auto_16381 ?auto_16384 ) ) ( not ( = ?auto_16381 ?auto_16385 ) ) ( not ( = ?auto_16382 ?auto_16383 ) ) ( not ( = ?auto_16382 ?auto_16384 ) ) ( not ( = ?auto_16382 ?auto_16385 ) ) ( not ( = ?auto_16383 ?auto_16384 ) ) ( not ( = ?auto_16383 ?auto_16385 ) ) ( not ( = ?auto_16384 ?auto_16385 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_16384 ?auto_16385 )
      ( !STACK ?auto_16384 ?auto_16383 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_16402 - BLOCK
      ?auto_16403 - BLOCK
      ?auto_16404 - BLOCK
      ?auto_16405 - BLOCK
      ?auto_16406 - BLOCK
    )
    :vars
    (
      ?auto_16407 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16406 ?auto_16407 ) ( ON-TABLE ?auto_16402 ) ( ON ?auto_16403 ?auto_16402 ) ( ON ?auto_16404 ?auto_16403 ) ( not ( = ?auto_16402 ?auto_16403 ) ) ( not ( = ?auto_16402 ?auto_16404 ) ) ( not ( = ?auto_16402 ?auto_16405 ) ) ( not ( = ?auto_16402 ?auto_16406 ) ) ( not ( = ?auto_16402 ?auto_16407 ) ) ( not ( = ?auto_16403 ?auto_16404 ) ) ( not ( = ?auto_16403 ?auto_16405 ) ) ( not ( = ?auto_16403 ?auto_16406 ) ) ( not ( = ?auto_16403 ?auto_16407 ) ) ( not ( = ?auto_16404 ?auto_16405 ) ) ( not ( = ?auto_16404 ?auto_16406 ) ) ( not ( = ?auto_16404 ?auto_16407 ) ) ( not ( = ?auto_16405 ?auto_16406 ) ) ( not ( = ?auto_16405 ?auto_16407 ) ) ( not ( = ?auto_16406 ?auto_16407 ) ) ( CLEAR ?auto_16404 ) ( ON ?auto_16405 ?auto_16406 ) ( CLEAR ?auto_16405 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_16402 ?auto_16403 ?auto_16404 ?auto_16405 )
      ( MAKE-5PILE ?auto_16402 ?auto_16403 ?auto_16404 ?auto_16405 ?auto_16406 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_16424 - BLOCK
      ?auto_16425 - BLOCK
      ?auto_16426 - BLOCK
      ?auto_16427 - BLOCK
      ?auto_16428 - BLOCK
    )
    :vars
    (
      ?auto_16429 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16428 ?auto_16429 ) ( ON-TABLE ?auto_16424 ) ( ON ?auto_16425 ?auto_16424 ) ( not ( = ?auto_16424 ?auto_16425 ) ) ( not ( = ?auto_16424 ?auto_16426 ) ) ( not ( = ?auto_16424 ?auto_16427 ) ) ( not ( = ?auto_16424 ?auto_16428 ) ) ( not ( = ?auto_16424 ?auto_16429 ) ) ( not ( = ?auto_16425 ?auto_16426 ) ) ( not ( = ?auto_16425 ?auto_16427 ) ) ( not ( = ?auto_16425 ?auto_16428 ) ) ( not ( = ?auto_16425 ?auto_16429 ) ) ( not ( = ?auto_16426 ?auto_16427 ) ) ( not ( = ?auto_16426 ?auto_16428 ) ) ( not ( = ?auto_16426 ?auto_16429 ) ) ( not ( = ?auto_16427 ?auto_16428 ) ) ( not ( = ?auto_16427 ?auto_16429 ) ) ( not ( = ?auto_16428 ?auto_16429 ) ) ( ON ?auto_16427 ?auto_16428 ) ( CLEAR ?auto_16425 ) ( ON ?auto_16426 ?auto_16427 ) ( CLEAR ?auto_16426 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_16424 ?auto_16425 ?auto_16426 )
      ( MAKE-5PILE ?auto_16424 ?auto_16425 ?auto_16426 ?auto_16427 ?auto_16428 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_16446 - BLOCK
      ?auto_16447 - BLOCK
      ?auto_16448 - BLOCK
      ?auto_16449 - BLOCK
      ?auto_16450 - BLOCK
    )
    :vars
    (
      ?auto_16451 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16450 ?auto_16451 ) ( ON-TABLE ?auto_16446 ) ( not ( = ?auto_16446 ?auto_16447 ) ) ( not ( = ?auto_16446 ?auto_16448 ) ) ( not ( = ?auto_16446 ?auto_16449 ) ) ( not ( = ?auto_16446 ?auto_16450 ) ) ( not ( = ?auto_16446 ?auto_16451 ) ) ( not ( = ?auto_16447 ?auto_16448 ) ) ( not ( = ?auto_16447 ?auto_16449 ) ) ( not ( = ?auto_16447 ?auto_16450 ) ) ( not ( = ?auto_16447 ?auto_16451 ) ) ( not ( = ?auto_16448 ?auto_16449 ) ) ( not ( = ?auto_16448 ?auto_16450 ) ) ( not ( = ?auto_16448 ?auto_16451 ) ) ( not ( = ?auto_16449 ?auto_16450 ) ) ( not ( = ?auto_16449 ?auto_16451 ) ) ( not ( = ?auto_16450 ?auto_16451 ) ) ( ON ?auto_16449 ?auto_16450 ) ( ON ?auto_16448 ?auto_16449 ) ( CLEAR ?auto_16446 ) ( ON ?auto_16447 ?auto_16448 ) ( CLEAR ?auto_16447 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_16446 ?auto_16447 )
      ( MAKE-5PILE ?auto_16446 ?auto_16447 ?auto_16448 ?auto_16449 ?auto_16450 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_16468 - BLOCK
      ?auto_16469 - BLOCK
      ?auto_16470 - BLOCK
      ?auto_16471 - BLOCK
      ?auto_16472 - BLOCK
    )
    :vars
    (
      ?auto_16473 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16472 ?auto_16473 ) ( not ( = ?auto_16468 ?auto_16469 ) ) ( not ( = ?auto_16468 ?auto_16470 ) ) ( not ( = ?auto_16468 ?auto_16471 ) ) ( not ( = ?auto_16468 ?auto_16472 ) ) ( not ( = ?auto_16468 ?auto_16473 ) ) ( not ( = ?auto_16469 ?auto_16470 ) ) ( not ( = ?auto_16469 ?auto_16471 ) ) ( not ( = ?auto_16469 ?auto_16472 ) ) ( not ( = ?auto_16469 ?auto_16473 ) ) ( not ( = ?auto_16470 ?auto_16471 ) ) ( not ( = ?auto_16470 ?auto_16472 ) ) ( not ( = ?auto_16470 ?auto_16473 ) ) ( not ( = ?auto_16471 ?auto_16472 ) ) ( not ( = ?auto_16471 ?auto_16473 ) ) ( not ( = ?auto_16472 ?auto_16473 ) ) ( ON ?auto_16471 ?auto_16472 ) ( ON ?auto_16470 ?auto_16471 ) ( ON ?auto_16469 ?auto_16470 ) ( ON ?auto_16468 ?auto_16469 ) ( CLEAR ?auto_16468 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_16468 )
      ( MAKE-5PILE ?auto_16468 ?auto_16469 ?auto_16470 ?auto_16471 ?auto_16472 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_16491 - BLOCK
      ?auto_16492 - BLOCK
      ?auto_16493 - BLOCK
      ?auto_16494 - BLOCK
      ?auto_16495 - BLOCK
      ?auto_16496 - BLOCK
    )
    :vars
    (
      ?auto_16497 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_16495 ) ( ON ?auto_16496 ?auto_16497 ) ( CLEAR ?auto_16496 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_16491 ) ( ON ?auto_16492 ?auto_16491 ) ( ON ?auto_16493 ?auto_16492 ) ( ON ?auto_16494 ?auto_16493 ) ( ON ?auto_16495 ?auto_16494 ) ( not ( = ?auto_16491 ?auto_16492 ) ) ( not ( = ?auto_16491 ?auto_16493 ) ) ( not ( = ?auto_16491 ?auto_16494 ) ) ( not ( = ?auto_16491 ?auto_16495 ) ) ( not ( = ?auto_16491 ?auto_16496 ) ) ( not ( = ?auto_16491 ?auto_16497 ) ) ( not ( = ?auto_16492 ?auto_16493 ) ) ( not ( = ?auto_16492 ?auto_16494 ) ) ( not ( = ?auto_16492 ?auto_16495 ) ) ( not ( = ?auto_16492 ?auto_16496 ) ) ( not ( = ?auto_16492 ?auto_16497 ) ) ( not ( = ?auto_16493 ?auto_16494 ) ) ( not ( = ?auto_16493 ?auto_16495 ) ) ( not ( = ?auto_16493 ?auto_16496 ) ) ( not ( = ?auto_16493 ?auto_16497 ) ) ( not ( = ?auto_16494 ?auto_16495 ) ) ( not ( = ?auto_16494 ?auto_16496 ) ) ( not ( = ?auto_16494 ?auto_16497 ) ) ( not ( = ?auto_16495 ?auto_16496 ) ) ( not ( = ?auto_16495 ?auto_16497 ) ) ( not ( = ?auto_16496 ?auto_16497 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_16496 ?auto_16497 )
      ( !STACK ?auto_16496 ?auto_16495 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_16504 - BLOCK
      ?auto_16505 - BLOCK
      ?auto_16506 - BLOCK
      ?auto_16507 - BLOCK
      ?auto_16508 - BLOCK
      ?auto_16509 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_16508 ) ( ON-TABLE ?auto_16509 ) ( CLEAR ?auto_16509 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_16504 ) ( ON ?auto_16505 ?auto_16504 ) ( ON ?auto_16506 ?auto_16505 ) ( ON ?auto_16507 ?auto_16506 ) ( ON ?auto_16508 ?auto_16507 ) ( not ( = ?auto_16504 ?auto_16505 ) ) ( not ( = ?auto_16504 ?auto_16506 ) ) ( not ( = ?auto_16504 ?auto_16507 ) ) ( not ( = ?auto_16504 ?auto_16508 ) ) ( not ( = ?auto_16504 ?auto_16509 ) ) ( not ( = ?auto_16505 ?auto_16506 ) ) ( not ( = ?auto_16505 ?auto_16507 ) ) ( not ( = ?auto_16505 ?auto_16508 ) ) ( not ( = ?auto_16505 ?auto_16509 ) ) ( not ( = ?auto_16506 ?auto_16507 ) ) ( not ( = ?auto_16506 ?auto_16508 ) ) ( not ( = ?auto_16506 ?auto_16509 ) ) ( not ( = ?auto_16507 ?auto_16508 ) ) ( not ( = ?auto_16507 ?auto_16509 ) ) ( not ( = ?auto_16508 ?auto_16509 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_16509 )
      ( !STACK ?auto_16509 ?auto_16508 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_16516 - BLOCK
      ?auto_16517 - BLOCK
      ?auto_16518 - BLOCK
      ?auto_16519 - BLOCK
      ?auto_16520 - BLOCK
      ?auto_16521 - BLOCK
    )
    :vars
    (
      ?auto_16522 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16521 ?auto_16522 ) ( ON-TABLE ?auto_16516 ) ( ON ?auto_16517 ?auto_16516 ) ( ON ?auto_16518 ?auto_16517 ) ( ON ?auto_16519 ?auto_16518 ) ( not ( = ?auto_16516 ?auto_16517 ) ) ( not ( = ?auto_16516 ?auto_16518 ) ) ( not ( = ?auto_16516 ?auto_16519 ) ) ( not ( = ?auto_16516 ?auto_16520 ) ) ( not ( = ?auto_16516 ?auto_16521 ) ) ( not ( = ?auto_16516 ?auto_16522 ) ) ( not ( = ?auto_16517 ?auto_16518 ) ) ( not ( = ?auto_16517 ?auto_16519 ) ) ( not ( = ?auto_16517 ?auto_16520 ) ) ( not ( = ?auto_16517 ?auto_16521 ) ) ( not ( = ?auto_16517 ?auto_16522 ) ) ( not ( = ?auto_16518 ?auto_16519 ) ) ( not ( = ?auto_16518 ?auto_16520 ) ) ( not ( = ?auto_16518 ?auto_16521 ) ) ( not ( = ?auto_16518 ?auto_16522 ) ) ( not ( = ?auto_16519 ?auto_16520 ) ) ( not ( = ?auto_16519 ?auto_16521 ) ) ( not ( = ?auto_16519 ?auto_16522 ) ) ( not ( = ?auto_16520 ?auto_16521 ) ) ( not ( = ?auto_16520 ?auto_16522 ) ) ( not ( = ?auto_16521 ?auto_16522 ) ) ( CLEAR ?auto_16519 ) ( ON ?auto_16520 ?auto_16521 ) ( CLEAR ?auto_16520 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_16516 ?auto_16517 ?auto_16518 ?auto_16519 ?auto_16520 )
      ( MAKE-6PILE ?auto_16516 ?auto_16517 ?auto_16518 ?auto_16519 ?auto_16520 ?auto_16521 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_16529 - BLOCK
      ?auto_16530 - BLOCK
      ?auto_16531 - BLOCK
      ?auto_16532 - BLOCK
      ?auto_16533 - BLOCK
      ?auto_16534 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_16534 ) ( ON-TABLE ?auto_16529 ) ( ON ?auto_16530 ?auto_16529 ) ( ON ?auto_16531 ?auto_16530 ) ( ON ?auto_16532 ?auto_16531 ) ( not ( = ?auto_16529 ?auto_16530 ) ) ( not ( = ?auto_16529 ?auto_16531 ) ) ( not ( = ?auto_16529 ?auto_16532 ) ) ( not ( = ?auto_16529 ?auto_16533 ) ) ( not ( = ?auto_16529 ?auto_16534 ) ) ( not ( = ?auto_16530 ?auto_16531 ) ) ( not ( = ?auto_16530 ?auto_16532 ) ) ( not ( = ?auto_16530 ?auto_16533 ) ) ( not ( = ?auto_16530 ?auto_16534 ) ) ( not ( = ?auto_16531 ?auto_16532 ) ) ( not ( = ?auto_16531 ?auto_16533 ) ) ( not ( = ?auto_16531 ?auto_16534 ) ) ( not ( = ?auto_16532 ?auto_16533 ) ) ( not ( = ?auto_16532 ?auto_16534 ) ) ( not ( = ?auto_16533 ?auto_16534 ) ) ( CLEAR ?auto_16532 ) ( ON ?auto_16533 ?auto_16534 ) ( CLEAR ?auto_16533 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_16529 ?auto_16530 ?auto_16531 ?auto_16532 ?auto_16533 )
      ( MAKE-6PILE ?auto_16529 ?auto_16530 ?auto_16531 ?auto_16532 ?auto_16533 ?auto_16534 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_16541 - BLOCK
      ?auto_16542 - BLOCK
      ?auto_16543 - BLOCK
      ?auto_16544 - BLOCK
      ?auto_16545 - BLOCK
      ?auto_16546 - BLOCK
    )
    :vars
    (
      ?auto_16547 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16546 ?auto_16547 ) ( ON-TABLE ?auto_16541 ) ( ON ?auto_16542 ?auto_16541 ) ( ON ?auto_16543 ?auto_16542 ) ( not ( = ?auto_16541 ?auto_16542 ) ) ( not ( = ?auto_16541 ?auto_16543 ) ) ( not ( = ?auto_16541 ?auto_16544 ) ) ( not ( = ?auto_16541 ?auto_16545 ) ) ( not ( = ?auto_16541 ?auto_16546 ) ) ( not ( = ?auto_16541 ?auto_16547 ) ) ( not ( = ?auto_16542 ?auto_16543 ) ) ( not ( = ?auto_16542 ?auto_16544 ) ) ( not ( = ?auto_16542 ?auto_16545 ) ) ( not ( = ?auto_16542 ?auto_16546 ) ) ( not ( = ?auto_16542 ?auto_16547 ) ) ( not ( = ?auto_16543 ?auto_16544 ) ) ( not ( = ?auto_16543 ?auto_16545 ) ) ( not ( = ?auto_16543 ?auto_16546 ) ) ( not ( = ?auto_16543 ?auto_16547 ) ) ( not ( = ?auto_16544 ?auto_16545 ) ) ( not ( = ?auto_16544 ?auto_16546 ) ) ( not ( = ?auto_16544 ?auto_16547 ) ) ( not ( = ?auto_16545 ?auto_16546 ) ) ( not ( = ?auto_16545 ?auto_16547 ) ) ( not ( = ?auto_16546 ?auto_16547 ) ) ( ON ?auto_16545 ?auto_16546 ) ( CLEAR ?auto_16543 ) ( ON ?auto_16544 ?auto_16545 ) ( CLEAR ?auto_16544 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_16541 ?auto_16542 ?auto_16543 ?auto_16544 )
      ( MAKE-6PILE ?auto_16541 ?auto_16542 ?auto_16543 ?auto_16544 ?auto_16545 ?auto_16546 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_16554 - BLOCK
      ?auto_16555 - BLOCK
      ?auto_16556 - BLOCK
      ?auto_16557 - BLOCK
      ?auto_16558 - BLOCK
      ?auto_16559 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_16559 ) ( ON-TABLE ?auto_16554 ) ( ON ?auto_16555 ?auto_16554 ) ( ON ?auto_16556 ?auto_16555 ) ( not ( = ?auto_16554 ?auto_16555 ) ) ( not ( = ?auto_16554 ?auto_16556 ) ) ( not ( = ?auto_16554 ?auto_16557 ) ) ( not ( = ?auto_16554 ?auto_16558 ) ) ( not ( = ?auto_16554 ?auto_16559 ) ) ( not ( = ?auto_16555 ?auto_16556 ) ) ( not ( = ?auto_16555 ?auto_16557 ) ) ( not ( = ?auto_16555 ?auto_16558 ) ) ( not ( = ?auto_16555 ?auto_16559 ) ) ( not ( = ?auto_16556 ?auto_16557 ) ) ( not ( = ?auto_16556 ?auto_16558 ) ) ( not ( = ?auto_16556 ?auto_16559 ) ) ( not ( = ?auto_16557 ?auto_16558 ) ) ( not ( = ?auto_16557 ?auto_16559 ) ) ( not ( = ?auto_16558 ?auto_16559 ) ) ( ON ?auto_16558 ?auto_16559 ) ( CLEAR ?auto_16556 ) ( ON ?auto_16557 ?auto_16558 ) ( CLEAR ?auto_16557 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_16554 ?auto_16555 ?auto_16556 ?auto_16557 )
      ( MAKE-6PILE ?auto_16554 ?auto_16555 ?auto_16556 ?auto_16557 ?auto_16558 ?auto_16559 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_16566 - BLOCK
      ?auto_16567 - BLOCK
      ?auto_16568 - BLOCK
      ?auto_16569 - BLOCK
      ?auto_16570 - BLOCK
      ?auto_16571 - BLOCK
    )
    :vars
    (
      ?auto_16572 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16571 ?auto_16572 ) ( ON-TABLE ?auto_16566 ) ( ON ?auto_16567 ?auto_16566 ) ( not ( = ?auto_16566 ?auto_16567 ) ) ( not ( = ?auto_16566 ?auto_16568 ) ) ( not ( = ?auto_16566 ?auto_16569 ) ) ( not ( = ?auto_16566 ?auto_16570 ) ) ( not ( = ?auto_16566 ?auto_16571 ) ) ( not ( = ?auto_16566 ?auto_16572 ) ) ( not ( = ?auto_16567 ?auto_16568 ) ) ( not ( = ?auto_16567 ?auto_16569 ) ) ( not ( = ?auto_16567 ?auto_16570 ) ) ( not ( = ?auto_16567 ?auto_16571 ) ) ( not ( = ?auto_16567 ?auto_16572 ) ) ( not ( = ?auto_16568 ?auto_16569 ) ) ( not ( = ?auto_16568 ?auto_16570 ) ) ( not ( = ?auto_16568 ?auto_16571 ) ) ( not ( = ?auto_16568 ?auto_16572 ) ) ( not ( = ?auto_16569 ?auto_16570 ) ) ( not ( = ?auto_16569 ?auto_16571 ) ) ( not ( = ?auto_16569 ?auto_16572 ) ) ( not ( = ?auto_16570 ?auto_16571 ) ) ( not ( = ?auto_16570 ?auto_16572 ) ) ( not ( = ?auto_16571 ?auto_16572 ) ) ( ON ?auto_16570 ?auto_16571 ) ( ON ?auto_16569 ?auto_16570 ) ( CLEAR ?auto_16567 ) ( ON ?auto_16568 ?auto_16569 ) ( CLEAR ?auto_16568 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_16566 ?auto_16567 ?auto_16568 )
      ( MAKE-6PILE ?auto_16566 ?auto_16567 ?auto_16568 ?auto_16569 ?auto_16570 ?auto_16571 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_16579 - BLOCK
      ?auto_16580 - BLOCK
      ?auto_16581 - BLOCK
      ?auto_16582 - BLOCK
      ?auto_16583 - BLOCK
      ?auto_16584 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_16584 ) ( ON-TABLE ?auto_16579 ) ( ON ?auto_16580 ?auto_16579 ) ( not ( = ?auto_16579 ?auto_16580 ) ) ( not ( = ?auto_16579 ?auto_16581 ) ) ( not ( = ?auto_16579 ?auto_16582 ) ) ( not ( = ?auto_16579 ?auto_16583 ) ) ( not ( = ?auto_16579 ?auto_16584 ) ) ( not ( = ?auto_16580 ?auto_16581 ) ) ( not ( = ?auto_16580 ?auto_16582 ) ) ( not ( = ?auto_16580 ?auto_16583 ) ) ( not ( = ?auto_16580 ?auto_16584 ) ) ( not ( = ?auto_16581 ?auto_16582 ) ) ( not ( = ?auto_16581 ?auto_16583 ) ) ( not ( = ?auto_16581 ?auto_16584 ) ) ( not ( = ?auto_16582 ?auto_16583 ) ) ( not ( = ?auto_16582 ?auto_16584 ) ) ( not ( = ?auto_16583 ?auto_16584 ) ) ( ON ?auto_16583 ?auto_16584 ) ( ON ?auto_16582 ?auto_16583 ) ( CLEAR ?auto_16580 ) ( ON ?auto_16581 ?auto_16582 ) ( CLEAR ?auto_16581 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_16579 ?auto_16580 ?auto_16581 )
      ( MAKE-6PILE ?auto_16579 ?auto_16580 ?auto_16581 ?auto_16582 ?auto_16583 ?auto_16584 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_16591 - BLOCK
      ?auto_16592 - BLOCK
      ?auto_16593 - BLOCK
      ?auto_16594 - BLOCK
      ?auto_16595 - BLOCK
      ?auto_16596 - BLOCK
    )
    :vars
    (
      ?auto_16597 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16596 ?auto_16597 ) ( ON-TABLE ?auto_16591 ) ( not ( = ?auto_16591 ?auto_16592 ) ) ( not ( = ?auto_16591 ?auto_16593 ) ) ( not ( = ?auto_16591 ?auto_16594 ) ) ( not ( = ?auto_16591 ?auto_16595 ) ) ( not ( = ?auto_16591 ?auto_16596 ) ) ( not ( = ?auto_16591 ?auto_16597 ) ) ( not ( = ?auto_16592 ?auto_16593 ) ) ( not ( = ?auto_16592 ?auto_16594 ) ) ( not ( = ?auto_16592 ?auto_16595 ) ) ( not ( = ?auto_16592 ?auto_16596 ) ) ( not ( = ?auto_16592 ?auto_16597 ) ) ( not ( = ?auto_16593 ?auto_16594 ) ) ( not ( = ?auto_16593 ?auto_16595 ) ) ( not ( = ?auto_16593 ?auto_16596 ) ) ( not ( = ?auto_16593 ?auto_16597 ) ) ( not ( = ?auto_16594 ?auto_16595 ) ) ( not ( = ?auto_16594 ?auto_16596 ) ) ( not ( = ?auto_16594 ?auto_16597 ) ) ( not ( = ?auto_16595 ?auto_16596 ) ) ( not ( = ?auto_16595 ?auto_16597 ) ) ( not ( = ?auto_16596 ?auto_16597 ) ) ( ON ?auto_16595 ?auto_16596 ) ( ON ?auto_16594 ?auto_16595 ) ( ON ?auto_16593 ?auto_16594 ) ( CLEAR ?auto_16591 ) ( ON ?auto_16592 ?auto_16593 ) ( CLEAR ?auto_16592 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_16591 ?auto_16592 )
      ( MAKE-6PILE ?auto_16591 ?auto_16592 ?auto_16593 ?auto_16594 ?auto_16595 ?auto_16596 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_16604 - BLOCK
      ?auto_16605 - BLOCK
      ?auto_16606 - BLOCK
      ?auto_16607 - BLOCK
      ?auto_16608 - BLOCK
      ?auto_16609 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_16609 ) ( ON-TABLE ?auto_16604 ) ( not ( = ?auto_16604 ?auto_16605 ) ) ( not ( = ?auto_16604 ?auto_16606 ) ) ( not ( = ?auto_16604 ?auto_16607 ) ) ( not ( = ?auto_16604 ?auto_16608 ) ) ( not ( = ?auto_16604 ?auto_16609 ) ) ( not ( = ?auto_16605 ?auto_16606 ) ) ( not ( = ?auto_16605 ?auto_16607 ) ) ( not ( = ?auto_16605 ?auto_16608 ) ) ( not ( = ?auto_16605 ?auto_16609 ) ) ( not ( = ?auto_16606 ?auto_16607 ) ) ( not ( = ?auto_16606 ?auto_16608 ) ) ( not ( = ?auto_16606 ?auto_16609 ) ) ( not ( = ?auto_16607 ?auto_16608 ) ) ( not ( = ?auto_16607 ?auto_16609 ) ) ( not ( = ?auto_16608 ?auto_16609 ) ) ( ON ?auto_16608 ?auto_16609 ) ( ON ?auto_16607 ?auto_16608 ) ( ON ?auto_16606 ?auto_16607 ) ( CLEAR ?auto_16604 ) ( ON ?auto_16605 ?auto_16606 ) ( CLEAR ?auto_16605 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_16604 ?auto_16605 )
      ( MAKE-6PILE ?auto_16604 ?auto_16605 ?auto_16606 ?auto_16607 ?auto_16608 ?auto_16609 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_16616 - BLOCK
      ?auto_16617 - BLOCK
      ?auto_16618 - BLOCK
      ?auto_16619 - BLOCK
      ?auto_16620 - BLOCK
      ?auto_16621 - BLOCK
    )
    :vars
    (
      ?auto_16622 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_16621 ?auto_16622 ) ( not ( = ?auto_16616 ?auto_16617 ) ) ( not ( = ?auto_16616 ?auto_16618 ) ) ( not ( = ?auto_16616 ?auto_16619 ) ) ( not ( = ?auto_16616 ?auto_16620 ) ) ( not ( = ?auto_16616 ?auto_16621 ) ) ( not ( = ?auto_16616 ?auto_16622 ) ) ( not ( = ?auto_16617 ?auto_16618 ) ) ( not ( = ?auto_16617 ?auto_16619 ) ) ( not ( = ?auto_16617 ?auto_16620 ) ) ( not ( = ?auto_16617 ?auto_16621 ) ) ( not ( = ?auto_16617 ?auto_16622 ) ) ( not ( = ?auto_16618 ?auto_16619 ) ) ( not ( = ?auto_16618 ?auto_16620 ) ) ( not ( = ?auto_16618 ?auto_16621 ) ) ( not ( = ?auto_16618 ?auto_16622 ) ) ( not ( = ?auto_16619 ?auto_16620 ) ) ( not ( = ?auto_16619 ?auto_16621 ) ) ( not ( = ?auto_16619 ?auto_16622 ) ) ( not ( = ?auto_16620 ?auto_16621 ) ) ( not ( = ?auto_16620 ?auto_16622 ) ) ( not ( = ?auto_16621 ?auto_16622 ) ) ( ON ?auto_16620 ?auto_16621 ) ( ON ?auto_16619 ?auto_16620 ) ( ON ?auto_16618 ?auto_16619 ) ( ON ?auto_16617 ?auto_16618 ) ( ON ?auto_16616 ?auto_16617 ) ( CLEAR ?auto_16616 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_16616 )
      ( MAKE-6PILE ?auto_16616 ?auto_16617 ?auto_16618 ?auto_16619 ?auto_16620 ?auto_16621 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_16629 - BLOCK
      ?auto_16630 - BLOCK
      ?auto_16631 - BLOCK
      ?auto_16632 - BLOCK
      ?auto_16633 - BLOCK
      ?auto_16634 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_16634 ) ( not ( = ?auto_16629 ?auto_16630 ) ) ( not ( = ?auto_16629 ?auto_16631 ) ) ( not ( = ?auto_16629 ?auto_16632 ) ) ( not ( = ?auto_16629 ?auto_16633 ) ) ( not ( = ?auto_16629 ?auto_16634 ) ) ( not ( = ?auto_16630 ?auto_16631 ) ) ( not ( = ?auto_16630 ?auto_16632 ) ) ( not ( = ?auto_16630 ?auto_16633 ) ) ( not ( = ?auto_16630 ?auto_16634 ) ) ( not ( = ?auto_16631 ?auto_16632 ) ) ( not ( = ?auto_16631 ?auto_16633 ) ) ( not ( = ?auto_16631 ?auto_16634 ) ) ( not ( = ?auto_16632 ?auto_16633 ) ) ( not ( = ?auto_16632 ?auto_16634 ) ) ( not ( = ?auto_16633 ?auto_16634 ) ) ( ON ?auto_16633 ?auto_16634 ) ( ON ?auto_16632 ?auto_16633 ) ( ON ?auto_16631 ?auto_16632 ) ( ON ?auto_16630 ?auto_16631 ) ( ON ?auto_16629 ?auto_16630 ) ( CLEAR ?auto_16629 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_16629 )
      ( MAKE-6PILE ?auto_16629 ?auto_16630 ?auto_16631 ?auto_16632 ?auto_16633 ?auto_16634 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_16641 - BLOCK
      ?auto_16642 - BLOCK
      ?auto_16643 - BLOCK
      ?auto_16644 - BLOCK
      ?auto_16645 - BLOCK
      ?auto_16646 - BLOCK
    )
    :vars
    (
      ?auto_16647 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_16641 ?auto_16642 ) ) ( not ( = ?auto_16641 ?auto_16643 ) ) ( not ( = ?auto_16641 ?auto_16644 ) ) ( not ( = ?auto_16641 ?auto_16645 ) ) ( not ( = ?auto_16641 ?auto_16646 ) ) ( not ( = ?auto_16642 ?auto_16643 ) ) ( not ( = ?auto_16642 ?auto_16644 ) ) ( not ( = ?auto_16642 ?auto_16645 ) ) ( not ( = ?auto_16642 ?auto_16646 ) ) ( not ( = ?auto_16643 ?auto_16644 ) ) ( not ( = ?auto_16643 ?auto_16645 ) ) ( not ( = ?auto_16643 ?auto_16646 ) ) ( not ( = ?auto_16644 ?auto_16645 ) ) ( not ( = ?auto_16644 ?auto_16646 ) ) ( not ( = ?auto_16645 ?auto_16646 ) ) ( ON ?auto_16641 ?auto_16647 ) ( not ( = ?auto_16646 ?auto_16647 ) ) ( not ( = ?auto_16645 ?auto_16647 ) ) ( not ( = ?auto_16644 ?auto_16647 ) ) ( not ( = ?auto_16643 ?auto_16647 ) ) ( not ( = ?auto_16642 ?auto_16647 ) ) ( not ( = ?auto_16641 ?auto_16647 ) ) ( ON ?auto_16642 ?auto_16641 ) ( ON ?auto_16643 ?auto_16642 ) ( ON ?auto_16644 ?auto_16643 ) ( ON ?auto_16645 ?auto_16644 ) ( ON ?auto_16646 ?auto_16645 ) ( CLEAR ?auto_16646 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_16646 ?auto_16645 ?auto_16644 ?auto_16643 ?auto_16642 ?auto_16641 )
      ( MAKE-6PILE ?auto_16641 ?auto_16642 ?auto_16643 ?auto_16644 ?auto_16645 ?auto_16646 ) )
  )

)

