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
      ?auto_757275 - BLOCK
    )
    :vars
    (
      ?auto_757276 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_757275 ?auto_757276 ) ( CLEAR ?auto_757275 ) ( HAND-EMPTY ) ( not ( = ?auto_757275 ?auto_757276 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_757275 ?auto_757276 )
      ( !PUTDOWN ?auto_757275 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_757282 - BLOCK
      ?auto_757283 - BLOCK
    )
    :vars
    (
      ?auto_757284 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_757282 ) ( ON ?auto_757283 ?auto_757284 ) ( CLEAR ?auto_757283 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_757282 ) ( not ( = ?auto_757282 ?auto_757283 ) ) ( not ( = ?auto_757282 ?auto_757284 ) ) ( not ( = ?auto_757283 ?auto_757284 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_757283 ?auto_757284 )
      ( !STACK ?auto_757283 ?auto_757282 ) )
  )

  ( :method MAKE-2PILE
    :parameters
    (
      ?auto_757292 - BLOCK
      ?auto_757293 - BLOCK
    )
    :vars
    (
      ?auto_757294 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_757293 ?auto_757294 ) ( not ( = ?auto_757292 ?auto_757293 ) ) ( not ( = ?auto_757292 ?auto_757294 ) ) ( not ( = ?auto_757293 ?auto_757294 ) ) ( ON ?auto_757292 ?auto_757293 ) ( CLEAR ?auto_757292 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_757292 )
      ( MAKE-2PILE ?auto_757292 ?auto_757293 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_757303 - BLOCK
      ?auto_757304 - BLOCK
      ?auto_757305 - BLOCK
    )
    :vars
    (
      ?auto_757306 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_757304 ) ( ON ?auto_757305 ?auto_757306 ) ( CLEAR ?auto_757305 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_757303 ) ( ON ?auto_757304 ?auto_757303 ) ( not ( = ?auto_757303 ?auto_757304 ) ) ( not ( = ?auto_757303 ?auto_757305 ) ) ( not ( = ?auto_757303 ?auto_757306 ) ) ( not ( = ?auto_757304 ?auto_757305 ) ) ( not ( = ?auto_757304 ?auto_757306 ) ) ( not ( = ?auto_757305 ?auto_757306 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_757305 ?auto_757306 )
      ( !STACK ?auto_757305 ?auto_757304 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_757317 - BLOCK
      ?auto_757318 - BLOCK
      ?auto_757319 - BLOCK
    )
    :vars
    (
      ?auto_757320 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_757319 ?auto_757320 ) ( ON-TABLE ?auto_757317 ) ( not ( = ?auto_757317 ?auto_757318 ) ) ( not ( = ?auto_757317 ?auto_757319 ) ) ( not ( = ?auto_757317 ?auto_757320 ) ) ( not ( = ?auto_757318 ?auto_757319 ) ) ( not ( = ?auto_757318 ?auto_757320 ) ) ( not ( = ?auto_757319 ?auto_757320 ) ) ( CLEAR ?auto_757317 ) ( ON ?auto_757318 ?auto_757319 ) ( CLEAR ?auto_757318 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_757317 ?auto_757318 )
      ( MAKE-3PILE ?auto_757317 ?auto_757318 ?auto_757319 ) )
  )

  ( :method MAKE-3PILE
    :parameters
    (
      ?auto_757331 - BLOCK
      ?auto_757332 - BLOCK
      ?auto_757333 - BLOCK
    )
    :vars
    (
      ?auto_757334 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_757333 ?auto_757334 ) ( not ( = ?auto_757331 ?auto_757332 ) ) ( not ( = ?auto_757331 ?auto_757333 ) ) ( not ( = ?auto_757331 ?auto_757334 ) ) ( not ( = ?auto_757332 ?auto_757333 ) ) ( not ( = ?auto_757332 ?auto_757334 ) ) ( not ( = ?auto_757333 ?auto_757334 ) ) ( ON ?auto_757332 ?auto_757333 ) ( ON ?auto_757331 ?auto_757332 ) ( CLEAR ?auto_757331 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_757331 )
      ( MAKE-3PILE ?auto_757331 ?auto_757332 ?auto_757333 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_757346 - BLOCK
      ?auto_757347 - BLOCK
      ?auto_757348 - BLOCK
      ?auto_757349 - BLOCK
    )
    :vars
    (
      ?auto_757350 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_757348 ) ( ON ?auto_757349 ?auto_757350 ) ( CLEAR ?auto_757349 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_757346 ) ( ON ?auto_757347 ?auto_757346 ) ( ON ?auto_757348 ?auto_757347 ) ( not ( = ?auto_757346 ?auto_757347 ) ) ( not ( = ?auto_757346 ?auto_757348 ) ) ( not ( = ?auto_757346 ?auto_757349 ) ) ( not ( = ?auto_757346 ?auto_757350 ) ) ( not ( = ?auto_757347 ?auto_757348 ) ) ( not ( = ?auto_757347 ?auto_757349 ) ) ( not ( = ?auto_757347 ?auto_757350 ) ) ( not ( = ?auto_757348 ?auto_757349 ) ) ( not ( = ?auto_757348 ?auto_757350 ) ) ( not ( = ?auto_757349 ?auto_757350 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_757349 ?auto_757350 )
      ( !STACK ?auto_757349 ?auto_757348 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_757364 - BLOCK
      ?auto_757365 - BLOCK
      ?auto_757366 - BLOCK
      ?auto_757367 - BLOCK
    )
    :vars
    (
      ?auto_757368 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_757367 ?auto_757368 ) ( ON-TABLE ?auto_757364 ) ( ON ?auto_757365 ?auto_757364 ) ( not ( = ?auto_757364 ?auto_757365 ) ) ( not ( = ?auto_757364 ?auto_757366 ) ) ( not ( = ?auto_757364 ?auto_757367 ) ) ( not ( = ?auto_757364 ?auto_757368 ) ) ( not ( = ?auto_757365 ?auto_757366 ) ) ( not ( = ?auto_757365 ?auto_757367 ) ) ( not ( = ?auto_757365 ?auto_757368 ) ) ( not ( = ?auto_757366 ?auto_757367 ) ) ( not ( = ?auto_757366 ?auto_757368 ) ) ( not ( = ?auto_757367 ?auto_757368 ) ) ( CLEAR ?auto_757365 ) ( ON ?auto_757366 ?auto_757367 ) ( CLEAR ?auto_757366 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_757364 ?auto_757365 ?auto_757366 )
      ( MAKE-4PILE ?auto_757364 ?auto_757365 ?auto_757366 ?auto_757367 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_757382 - BLOCK
      ?auto_757383 - BLOCK
      ?auto_757384 - BLOCK
      ?auto_757385 - BLOCK
    )
    :vars
    (
      ?auto_757386 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_757385 ?auto_757386 ) ( ON-TABLE ?auto_757382 ) ( not ( = ?auto_757382 ?auto_757383 ) ) ( not ( = ?auto_757382 ?auto_757384 ) ) ( not ( = ?auto_757382 ?auto_757385 ) ) ( not ( = ?auto_757382 ?auto_757386 ) ) ( not ( = ?auto_757383 ?auto_757384 ) ) ( not ( = ?auto_757383 ?auto_757385 ) ) ( not ( = ?auto_757383 ?auto_757386 ) ) ( not ( = ?auto_757384 ?auto_757385 ) ) ( not ( = ?auto_757384 ?auto_757386 ) ) ( not ( = ?auto_757385 ?auto_757386 ) ) ( ON ?auto_757384 ?auto_757385 ) ( CLEAR ?auto_757382 ) ( ON ?auto_757383 ?auto_757384 ) ( CLEAR ?auto_757383 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_757382 ?auto_757383 )
      ( MAKE-4PILE ?auto_757382 ?auto_757383 ?auto_757384 ?auto_757385 ) )
  )

  ( :method MAKE-4PILE
    :parameters
    (
      ?auto_757400 - BLOCK
      ?auto_757401 - BLOCK
      ?auto_757402 - BLOCK
      ?auto_757403 - BLOCK
    )
    :vars
    (
      ?auto_757404 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_757403 ?auto_757404 ) ( not ( = ?auto_757400 ?auto_757401 ) ) ( not ( = ?auto_757400 ?auto_757402 ) ) ( not ( = ?auto_757400 ?auto_757403 ) ) ( not ( = ?auto_757400 ?auto_757404 ) ) ( not ( = ?auto_757401 ?auto_757402 ) ) ( not ( = ?auto_757401 ?auto_757403 ) ) ( not ( = ?auto_757401 ?auto_757404 ) ) ( not ( = ?auto_757402 ?auto_757403 ) ) ( not ( = ?auto_757402 ?auto_757404 ) ) ( not ( = ?auto_757403 ?auto_757404 ) ) ( ON ?auto_757402 ?auto_757403 ) ( ON ?auto_757401 ?auto_757402 ) ( ON ?auto_757400 ?auto_757401 ) ( CLEAR ?auto_757400 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_757400 )
      ( MAKE-4PILE ?auto_757400 ?auto_757401 ?auto_757402 ?auto_757403 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_757419 - BLOCK
      ?auto_757420 - BLOCK
      ?auto_757421 - BLOCK
      ?auto_757422 - BLOCK
      ?auto_757423 - BLOCK
    )
    :vars
    (
      ?auto_757424 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_757422 ) ( ON ?auto_757423 ?auto_757424 ) ( CLEAR ?auto_757423 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_757419 ) ( ON ?auto_757420 ?auto_757419 ) ( ON ?auto_757421 ?auto_757420 ) ( ON ?auto_757422 ?auto_757421 ) ( not ( = ?auto_757419 ?auto_757420 ) ) ( not ( = ?auto_757419 ?auto_757421 ) ) ( not ( = ?auto_757419 ?auto_757422 ) ) ( not ( = ?auto_757419 ?auto_757423 ) ) ( not ( = ?auto_757419 ?auto_757424 ) ) ( not ( = ?auto_757420 ?auto_757421 ) ) ( not ( = ?auto_757420 ?auto_757422 ) ) ( not ( = ?auto_757420 ?auto_757423 ) ) ( not ( = ?auto_757420 ?auto_757424 ) ) ( not ( = ?auto_757421 ?auto_757422 ) ) ( not ( = ?auto_757421 ?auto_757423 ) ) ( not ( = ?auto_757421 ?auto_757424 ) ) ( not ( = ?auto_757422 ?auto_757423 ) ) ( not ( = ?auto_757422 ?auto_757424 ) ) ( not ( = ?auto_757423 ?auto_757424 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_757423 ?auto_757424 )
      ( !STACK ?auto_757423 ?auto_757422 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_757441 - BLOCK
      ?auto_757442 - BLOCK
      ?auto_757443 - BLOCK
      ?auto_757444 - BLOCK
      ?auto_757445 - BLOCK
    )
    :vars
    (
      ?auto_757446 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_757445 ?auto_757446 ) ( ON-TABLE ?auto_757441 ) ( ON ?auto_757442 ?auto_757441 ) ( ON ?auto_757443 ?auto_757442 ) ( not ( = ?auto_757441 ?auto_757442 ) ) ( not ( = ?auto_757441 ?auto_757443 ) ) ( not ( = ?auto_757441 ?auto_757444 ) ) ( not ( = ?auto_757441 ?auto_757445 ) ) ( not ( = ?auto_757441 ?auto_757446 ) ) ( not ( = ?auto_757442 ?auto_757443 ) ) ( not ( = ?auto_757442 ?auto_757444 ) ) ( not ( = ?auto_757442 ?auto_757445 ) ) ( not ( = ?auto_757442 ?auto_757446 ) ) ( not ( = ?auto_757443 ?auto_757444 ) ) ( not ( = ?auto_757443 ?auto_757445 ) ) ( not ( = ?auto_757443 ?auto_757446 ) ) ( not ( = ?auto_757444 ?auto_757445 ) ) ( not ( = ?auto_757444 ?auto_757446 ) ) ( not ( = ?auto_757445 ?auto_757446 ) ) ( CLEAR ?auto_757443 ) ( ON ?auto_757444 ?auto_757445 ) ( CLEAR ?auto_757444 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_757441 ?auto_757442 ?auto_757443 ?auto_757444 )
      ( MAKE-5PILE ?auto_757441 ?auto_757442 ?auto_757443 ?auto_757444 ?auto_757445 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_757463 - BLOCK
      ?auto_757464 - BLOCK
      ?auto_757465 - BLOCK
      ?auto_757466 - BLOCK
      ?auto_757467 - BLOCK
    )
    :vars
    (
      ?auto_757468 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_757467 ?auto_757468 ) ( ON-TABLE ?auto_757463 ) ( ON ?auto_757464 ?auto_757463 ) ( not ( = ?auto_757463 ?auto_757464 ) ) ( not ( = ?auto_757463 ?auto_757465 ) ) ( not ( = ?auto_757463 ?auto_757466 ) ) ( not ( = ?auto_757463 ?auto_757467 ) ) ( not ( = ?auto_757463 ?auto_757468 ) ) ( not ( = ?auto_757464 ?auto_757465 ) ) ( not ( = ?auto_757464 ?auto_757466 ) ) ( not ( = ?auto_757464 ?auto_757467 ) ) ( not ( = ?auto_757464 ?auto_757468 ) ) ( not ( = ?auto_757465 ?auto_757466 ) ) ( not ( = ?auto_757465 ?auto_757467 ) ) ( not ( = ?auto_757465 ?auto_757468 ) ) ( not ( = ?auto_757466 ?auto_757467 ) ) ( not ( = ?auto_757466 ?auto_757468 ) ) ( not ( = ?auto_757467 ?auto_757468 ) ) ( ON ?auto_757466 ?auto_757467 ) ( CLEAR ?auto_757464 ) ( ON ?auto_757465 ?auto_757466 ) ( CLEAR ?auto_757465 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_757463 ?auto_757464 ?auto_757465 )
      ( MAKE-5PILE ?auto_757463 ?auto_757464 ?auto_757465 ?auto_757466 ?auto_757467 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_757485 - BLOCK
      ?auto_757486 - BLOCK
      ?auto_757487 - BLOCK
      ?auto_757488 - BLOCK
      ?auto_757489 - BLOCK
    )
    :vars
    (
      ?auto_757490 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_757489 ?auto_757490 ) ( ON-TABLE ?auto_757485 ) ( not ( = ?auto_757485 ?auto_757486 ) ) ( not ( = ?auto_757485 ?auto_757487 ) ) ( not ( = ?auto_757485 ?auto_757488 ) ) ( not ( = ?auto_757485 ?auto_757489 ) ) ( not ( = ?auto_757485 ?auto_757490 ) ) ( not ( = ?auto_757486 ?auto_757487 ) ) ( not ( = ?auto_757486 ?auto_757488 ) ) ( not ( = ?auto_757486 ?auto_757489 ) ) ( not ( = ?auto_757486 ?auto_757490 ) ) ( not ( = ?auto_757487 ?auto_757488 ) ) ( not ( = ?auto_757487 ?auto_757489 ) ) ( not ( = ?auto_757487 ?auto_757490 ) ) ( not ( = ?auto_757488 ?auto_757489 ) ) ( not ( = ?auto_757488 ?auto_757490 ) ) ( not ( = ?auto_757489 ?auto_757490 ) ) ( ON ?auto_757488 ?auto_757489 ) ( ON ?auto_757487 ?auto_757488 ) ( CLEAR ?auto_757485 ) ( ON ?auto_757486 ?auto_757487 ) ( CLEAR ?auto_757486 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_757485 ?auto_757486 )
      ( MAKE-5PILE ?auto_757485 ?auto_757486 ?auto_757487 ?auto_757488 ?auto_757489 ) )
  )

  ( :method MAKE-5PILE
    :parameters
    (
      ?auto_757507 - BLOCK
      ?auto_757508 - BLOCK
      ?auto_757509 - BLOCK
      ?auto_757510 - BLOCK
      ?auto_757511 - BLOCK
    )
    :vars
    (
      ?auto_757512 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_757511 ?auto_757512 ) ( not ( = ?auto_757507 ?auto_757508 ) ) ( not ( = ?auto_757507 ?auto_757509 ) ) ( not ( = ?auto_757507 ?auto_757510 ) ) ( not ( = ?auto_757507 ?auto_757511 ) ) ( not ( = ?auto_757507 ?auto_757512 ) ) ( not ( = ?auto_757508 ?auto_757509 ) ) ( not ( = ?auto_757508 ?auto_757510 ) ) ( not ( = ?auto_757508 ?auto_757511 ) ) ( not ( = ?auto_757508 ?auto_757512 ) ) ( not ( = ?auto_757509 ?auto_757510 ) ) ( not ( = ?auto_757509 ?auto_757511 ) ) ( not ( = ?auto_757509 ?auto_757512 ) ) ( not ( = ?auto_757510 ?auto_757511 ) ) ( not ( = ?auto_757510 ?auto_757512 ) ) ( not ( = ?auto_757511 ?auto_757512 ) ) ( ON ?auto_757510 ?auto_757511 ) ( ON ?auto_757509 ?auto_757510 ) ( ON ?auto_757508 ?auto_757509 ) ( ON ?auto_757507 ?auto_757508 ) ( CLEAR ?auto_757507 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_757507 )
      ( MAKE-5PILE ?auto_757507 ?auto_757508 ?auto_757509 ?auto_757510 ?auto_757511 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_757530 - BLOCK
      ?auto_757531 - BLOCK
      ?auto_757532 - BLOCK
      ?auto_757533 - BLOCK
      ?auto_757534 - BLOCK
      ?auto_757535 - BLOCK
    )
    :vars
    (
      ?auto_757536 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_757534 ) ( ON ?auto_757535 ?auto_757536 ) ( CLEAR ?auto_757535 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_757530 ) ( ON ?auto_757531 ?auto_757530 ) ( ON ?auto_757532 ?auto_757531 ) ( ON ?auto_757533 ?auto_757532 ) ( ON ?auto_757534 ?auto_757533 ) ( not ( = ?auto_757530 ?auto_757531 ) ) ( not ( = ?auto_757530 ?auto_757532 ) ) ( not ( = ?auto_757530 ?auto_757533 ) ) ( not ( = ?auto_757530 ?auto_757534 ) ) ( not ( = ?auto_757530 ?auto_757535 ) ) ( not ( = ?auto_757530 ?auto_757536 ) ) ( not ( = ?auto_757531 ?auto_757532 ) ) ( not ( = ?auto_757531 ?auto_757533 ) ) ( not ( = ?auto_757531 ?auto_757534 ) ) ( not ( = ?auto_757531 ?auto_757535 ) ) ( not ( = ?auto_757531 ?auto_757536 ) ) ( not ( = ?auto_757532 ?auto_757533 ) ) ( not ( = ?auto_757532 ?auto_757534 ) ) ( not ( = ?auto_757532 ?auto_757535 ) ) ( not ( = ?auto_757532 ?auto_757536 ) ) ( not ( = ?auto_757533 ?auto_757534 ) ) ( not ( = ?auto_757533 ?auto_757535 ) ) ( not ( = ?auto_757533 ?auto_757536 ) ) ( not ( = ?auto_757534 ?auto_757535 ) ) ( not ( = ?auto_757534 ?auto_757536 ) ) ( not ( = ?auto_757535 ?auto_757536 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_757535 ?auto_757536 )
      ( !STACK ?auto_757535 ?auto_757534 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_757556 - BLOCK
      ?auto_757557 - BLOCK
      ?auto_757558 - BLOCK
      ?auto_757559 - BLOCK
      ?auto_757560 - BLOCK
      ?auto_757561 - BLOCK
    )
    :vars
    (
      ?auto_757562 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_757561 ?auto_757562 ) ( ON-TABLE ?auto_757556 ) ( ON ?auto_757557 ?auto_757556 ) ( ON ?auto_757558 ?auto_757557 ) ( ON ?auto_757559 ?auto_757558 ) ( not ( = ?auto_757556 ?auto_757557 ) ) ( not ( = ?auto_757556 ?auto_757558 ) ) ( not ( = ?auto_757556 ?auto_757559 ) ) ( not ( = ?auto_757556 ?auto_757560 ) ) ( not ( = ?auto_757556 ?auto_757561 ) ) ( not ( = ?auto_757556 ?auto_757562 ) ) ( not ( = ?auto_757557 ?auto_757558 ) ) ( not ( = ?auto_757557 ?auto_757559 ) ) ( not ( = ?auto_757557 ?auto_757560 ) ) ( not ( = ?auto_757557 ?auto_757561 ) ) ( not ( = ?auto_757557 ?auto_757562 ) ) ( not ( = ?auto_757558 ?auto_757559 ) ) ( not ( = ?auto_757558 ?auto_757560 ) ) ( not ( = ?auto_757558 ?auto_757561 ) ) ( not ( = ?auto_757558 ?auto_757562 ) ) ( not ( = ?auto_757559 ?auto_757560 ) ) ( not ( = ?auto_757559 ?auto_757561 ) ) ( not ( = ?auto_757559 ?auto_757562 ) ) ( not ( = ?auto_757560 ?auto_757561 ) ) ( not ( = ?auto_757560 ?auto_757562 ) ) ( not ( = ?auto_757561 ?auto_757562 ) ) ( CLEAR ?auto_757559 ) ( ON ?auto_757560 ?auto_757561 ) ( CLEAR ?auto_757560 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_757556 ?auto_757557 ?auto_757558 ?auto_757559 ?auto_757560 )
      ( MAKE-6PILE ?auto_757556 ?auto_757557 ?auto_757558 ?auto_757559 ?auto_757560 ?auto_757561 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_757582 - BLOCK
      ?auto_757583 - BLOCK
      ?auto_757584 - BLOCK
      ?auto_757585 - BLOCK
      ?auto_757586 - BLOCK
      ?auto_757587 - BLOCK
    )
    :vars
    (
      ?auto_757588 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_757587 ?auto_757588 ) ( ON-TABLE ?auto_757582 ) ( ON ?auto_757583 ?auto_757582 ) ( ON ?auto_757584 ?auto_757583 ) ( not ( = ?auto_757582 ?auto_757583 ) ) ( not ( = ?auto_757582 ?auto_757584 ) ) ( not ( = ?auto_757582 ?auto_757585 ) ) ( not ( = ?auto_757582 ?auto_757586 ) ) ( not ( = ?auto_757582 ?auto_757587 ) ) ( not ( = ?auto_757582 ?auto_757588 ) ) ( not ( = ?auto_757583 ?auto_757584 ) ) ( not ( = ?auto_757583 ?auto_757585 ) ) ( not ( = ?auto_757583 ?auto_757586 ) ) ( not ( = ?auto_757583 ?auto_757587 ) ) ( not ( = ?auto_757583 ?auto_757588 ) ) ( not ( = ?auto_757584 ?auto_757585 ) ) ( not ( = ?auto_757584 ?auto_757586 ) ) ( not ( = ?auto_757584 ?auto_757587 ) ) ( not ( = ?auto_757584 ?auto_757588 ) ) ( not ( = ?auto_757585 ?auto_757586 ) ) ( not ( = ?auto_757585 ?auto_757587 ) ) ( not ( = ?auto_757585 ?auto_757588 ) ) ( not ( = ?auto_757586 ?auto_757587 ) ) ( not ( = ?auto_757586 ?auto_757588 ) ) ( not ( = ?auto_757587 ?auto_757588 ) ) ( ON ?auto_757586 ?auto_757587 ) ( CLEAR ?auto_757584 ) ( ON ?auto_757585 ?auto_757586 ) ( CLEAR ?auto_757585 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_757582 ?auto_757583 ?auto_757584 ?auto_757585 )
      ( MAKE-6PILE ?auto_757582 ?auto_757583 ?auto_757584 ?auto_757585 ?auto_757586 ?auto_757587 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_757608 - BLOCK
      ?auto_757609 - BLOCK
      ?auto_757610 - BLOCK
      ?auto_757611 - BLOCK
      ?auto_757612 - BLOCK
      ?auto_757613 - BLOCK
    )
    :vars
    (
      ?auto_757614 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_757613 ?auto_757614 ) ( ON-TABLE ?auto_757608 ) ( ON ?auto_757609 ?auto_757608 ) ( not ( = ?auto_757608 ?auto_757609 ) ) ( not ( = ?auto_757608 ?auto_757610 ) ) ( not ( = ?auto_757608 ?auto_757611 ) ) ( not ( = ?auto_757608 ?auto_757612 ) ) ( not ( = ?auto_757608 ?auto_757613 ) ) ( not ( = ?auto_757608 ?auto_757614 ) ) ( not ( = ?auto_757609 ?auto_757610 ) ) ( not ( = ?auto_757609 ?auto_757611 ) ) ( not ( = ?auto_757609 ?auto_757612 ) ) ( not ( = ?auto_757609 ?auto_757613 ) ) ( not ( = ?auto_757609 ?auto_757614 ) ) ( not ( = ?auto_757610 ?auto_757611 ) ) ( not ( = ?auto_757610 ?auto_757612 ) ) ( not ( = ?auto_757610 ?auto_757613 ) ) ( not ( = ?auto_757610 ?auto_757614 ) ) ( not ( = ?auto_757611 ?auto_757612 ) ) ( not ( = ?auto_757611 ?auto_757613 ) ) ( not ( = ?auto_757611 ?auto_757614 ) ) ( not ( = ?auto_757612 ?auto_757613 ) ) ( not ( = ?auto_757612 ?auto_757614 ) ) ( not ( = ?auto_757613 ?auto_757614 ) ) ( ON ?auto_757612 ?auto_757613 ) ( ON ?auto_757611 ?auto_757612 ) ( CLEAR ?auto_757609 ) ( ON ?auto_757610 ?auto_757611 ) ( CLEAR ?auto_757610 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_757608 ?auto_757609 ?auto_757610 )
      ( MAKE-6PILE ?auto_757608 ?auto_757609 ?auto_757610 ?auto_757611 ?auto_757612 ?auto_757613 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_757634 - BLOCK
      ?auto_757635 - BLOCK
      ?auto_757636 - BLOCK
      ?auto_757637 - BLOCK
      ?auto_757638 - BLOCK
      ?auto_757639 - BLOCK
    )
    :vars
    (
      ?auto_757640 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_757639 ?auto_757640 ) ( ON-TABLE ?auto_757634 ) ( not ( = ?auto_757634 ?auto_757635 ) ) ( not ( = ?auto_757634 ?auto_757636 ) ) ( not ( = ?auto_757634 ?auto_757637 ) ) ( not ( = ?auto_757634 ?auto_757638 ) ) ( not ( = ?auto_757634 ?auto_757639 ) ) ( not ( = ?auto_757634 ?auto_757640 ) ) ( not ( = ?auto_757635 ?auto_757636 ) ) ( not ( = ?auto_757635 ?auto_757637 ) ) ( not ( = ?auto_757635 ?auto_757638 ) ) ( not ( = ?auto_757635 ?auto_757639 ) ) ( not ( = ?auto_757635 ?auto_757640 ) ) ( not ( = ?auto_757636 ?auto_757637 ) ) ( not ( = ?auto_757636 ?auto_757638 ) ) ( not ( = ?auto_757636 ?auto_757639 ) ) ( not ( = ?auto_757636 ?auto_757640 ) ) ( not ( = ?auto_757637 ?auto_757638 ) ) ( not ( = ?auto_757637 ?auto_757639 ) ) ( not ( = ?auto_757637 ?auto_757640 ) ) ( not ( = ?auto_757638 ?auto_757639 ) ) ( not ( = ?auto_757638 ?auto_757640 ) ) ( not ( = ?auto_757639 ?auto_757640 ) ) ( ON ?auto_757638 ?auto_757639 ) ( ON ?auto_757637 ?auto_757638 ) ( ON ?auto_757636 ?auto_757637 ) ( CLEAR ?auto_757634 ) ( ON ?auto_757635 ?auto_757636 ) ( CLEAR ?auto_757635 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_757634 ?auto_757635 )
      ( MAKE-6PILE ?auto_757634 ?auto_757635 ?auto_757636 ?auto_757637 ?auto_757638 ?auto_757639 ) )
  )

  ( :method MAKE-6PILE
    :parameters
    (
      ?auto_757660 - BLOCK
      ?auto_757661 - BLOCK
      ?auto_757662 - BLOCK
      ?auto_757663 - BLOCK
      ?auto_757664 - BLOCK
      ?auto_757665 - BLOCK
    )
    :vars
    (
      ?auto_757666 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_757665 ?auto_757666 ) ( not ( = ?auto_757660 ?auto_757661 ) ) ( not ( = ?auto_757660 ?auto_757662 ) ) ( not ( = ?auto_757660 ?auto_757663 ) ) ( not ( = ?auto_757660 ?auto_757664 ) ) ( not ( = ?auto_757660 ?auto_757665 ) ) ( not ( = ?auto_757660 ?auto_757666 ) ) ( not ( = ?auto_757661 ?auto_757662 ) ) ( not ( = ?auto_757661 ?auto_757663 ) ) ( not ( = ?auto_757661 ?auto_757664 ) ) ( not ( = ?auto_757661 ?auto_757665 ) ) ( not ( = ?auto_757661 ?auto_757666 ) ) ( not ( = ?auto_757662 ?auto_757663 ) ) ( not ( = ?auto_757662 ?auto_757664 ) ) ( not ( = ?auto_757662 ?auto_757665 ) ) ( not ( = ?auto_757662 ?auto_757666 ) ) ( not ( = ?auto_757663 ?auto_757664 ) ) ( not ( = ?auto_757663 ?auto_757665 ) ) ( not ( = ?auto_757663 ?auto_757666 ) ) ( not ( = ?auto_757664 ?auto_757665 ) ) ( not ( = ?auto_757664 ?auto_757666 ) ) ( not ( = ?auto_757665 ?auto_757666 ) ) ( ON ?auto_757664 ?auto_757665 ) ( ON ?auto_757663 ?auto_757664 ) ( ON ?auto_757662 ?auto_757663 ) ( ON ?auto_757661 ?auto_757662 ) ( ON ?auto_757660 ?auto_757661 ) ( CLEAR ?auto_757660 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_757660 )
      ( MAKE-6PILE ?auto_757660 ?auto_757661 ?auto_757662 ?auto_757663 ?auto_757664 ?auto_757665 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_757687 - BLOCK
      ?auto_757688 - BLOCK
      ?auto_757689 - BLOCK
      ?auto_757690 - BLOCK
      ?auto_757691 - BLOCK
      ?auto_757692 - BLOCK
      ?auto_757693 - BLOCK
    )
    :vars
    (
      ?auto_757694 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_757692 ) ( ON ?auto_757693 ?auto_757694 ) ( CLEAR ?auto_757693 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_757687 ) ( ON ?auto_757688 ?auto_757687 ) ( ON ?auto_757689 ?auto_757688 ) ( ON ?auto_757690 ?auto_757689 ) ( ON ?auto_757691 ?auto_757690 ) ( ON ?auto_757692 ?auto_757691 ) ( not ( = ?auto_757687 ?auto_757688 ) ) ( not ( = ?auto_757687 ?auto_757689 ) ) ( not ( = ?auto_757687 ?auto_757690 ) ) ( not ( = ?auto_757687 ?auto_757691 ) ) ( not ( = ?auto_757687 ?auto_757692 ) ) ( not ( = ?auto_757687 ?auto_757693 ) ) ( not ( = ?auto_757687 ?auto_757694 ) ) ( not ( = ?auto_757688 ?auto_757689 ) ) ( not ( = ?auto_757688 ?auto_757690 ) ) ( not ( = ?auto_757688 ?auto_757691 ) ) ( not ( = ?auto_757688 ?auto_757692 ) ) ( not ( = ?auto_757688 ?auto_757693 ) ) ( not ( = ?auto_757688 ?auto_757694 ) ) ( not ( = ?auto_757689 ?auto_757690 ) ) ( not ( = ?auto_757689 ?auto_757691 ) ) ( not ( = ?auto_757689 ?auto_757692 ) ) ( not ( = ?auto_757689 ?auto_757693 ) ) ( not ( = ?auto_757689 ?auto_757694 ) ) ( not ( = ?auto_757690 ?auto_757691 ) ) ( not ( = ?auto_757690 ?auto_757692 ) ) ( not ( = ?auto_757690 ?auto_757693 ) ) ( not ( = ?auto_757690 ?auto_757694 ) ) ( not ( = ?auto_757691 ?auto_757692 ) ) ( not ( = ?auto_757691 ?auto_757693 ) ) ( not ( = ?auto_757691 ?auto_757694 ) ) ( not ( = ?auto_757692 ?auto_757693 ) ) ( not ( = ?auto_757692 ?auto_757694 ) ) ( not ( = ?auto_757693 ?auto_757694 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_757693 ?auto_757694 )
      ( !STACK ?auto_757693 ?auto_757692 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_757717 - BLOCK
      ?auto_757718 - BLOCK
      ?auto_757719 - BLOCK
      ?auto_757720 - BLOCK
      ?auto_757721 - BLOCK
      ?auto_757722 - BLOCK
      ?auto_757723 - BLOCK
    )
    :vars
    (
      ?auto_757724 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_757723 ?auto_757724 ) ( ON-TABLE ?auto_757717 ) ( ON ?auto_757718 ?auto_757717 ) ( ON ?auto_757719 ?auto_757718 ) ( ON ?auto_757720 ?auto_757719 ) ( ON ?auto_757721 ?auto_757720 ) ( not ( = ?auto_757717 ?auto_757718 ) ) ( not ( = ?auto_757717 ?auto_757719 ) ) ( not ( = ?auto_757717 ?auto_757720 ) ) ( not ( = ?auto_757717 ?auto_757721 ) ) ( not ( = ?auto_757717 ?auto_757722 ) ) ( not ( = ?auto_757717 ?auto_757723 ) ) ( not ( = ?auto_757717 ?auto_757724 ) ) ( not ( = ?auto_757718 ?auto_757719 ) ) ( not ( = ?auto_757718 ?auto_757720 ) ) ( not ( = ?auto_757718 ?auto_757721 ) ) ( not ( = ?auto_757718 ?auto_757722 ) ) ( not ( = ?auto_757718 ?auto_757723 ) ) ( not ( = ?auto_757718 ?auto_757724 ) ) ( not ( = ?auto_757719 ?auto_757720 ) ) ( not ( = ?auto_757719 ?auto_757721 ) ) ( not ( = ?auto_757719 ?auto_757722 ) ) ( not ( = ?auto_757719 ?auto_757723 ) ) ( not ( = ?auto_757719 ?auto_757724 ) ) ( not ( = ?auto_757720 ?auto_757721 ) ) ( not ( = ?auto_757720 ?auto_757722 ) ) ( not ( = ?auto_757720 ?auto_757723 ) ) ( not ( = ?auto_757720 ?auto_757724 ) ) ( not ( = ?auto_757721 ?auto_757722 ) ) ( not ( = ?auto_757721 ?auto_757723 ) ) ( not ( = ?auto_757721 ?auto_757724 ) ) ( not ( = ?auto_757722 ?auto_757723 ) ) ( not ( = ?auto_757722 ?auto_757724 ) ) ( not ( = ?auto_757723 ?auto_757724 ) ) ( CLEAR ?auto_757721 ) ( ON ?auto_757722 ?auto_757723 ) ( CLEAR ?auto_757722 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_757717 ?auto_757718 ?auto_757719 ?auto_757720 ?auto_757721 ?auto_757722 )
      ( MAKE-7PILE ?auto_757717 ?auto_757718 ?auto_757719 ?auto_757720 ?auto_757721 ?auto_757722 ?auto_757723 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_757747 - BLOCK
      ?auto_757748 - BLOCK
      ?auto_757749 - BLOCK
      ?auto_757750 - BLOCK
      ?auto_757751 - BLOCK
      ?auto_757752 - BLOCK
      ?auto_757753 - BLOCK
    )
    :vars
    (
      ?auto_757754 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_757753 ?auto_757754 ) ( ON-TABLE ?auto_757747 ) ( ON ?auto_757748 ?auto_757747 ) ( ON ?auto_757749 ?auto_757748 ) ( ON ?auto_757750 ?auto_757749 ) ( not ( = ?auto_757747 ?auto_757748 ) ) ( not ( = ?auto_757747 ?auto_757749 ) ) ( not ( = ?auto_757747 ?auto_757750 ) ) ( not ( = ?auto_757747 ?auto_757751 ) ) ( not ( = ?auto_757747 ?auto_757752 ) ) ( not ( = ?auto_757747 ?auto_757753 ) ) ( not ( = ?auto_757747 ?auto_757754 ) ) ( not ( = ?auto_757748 ?auto_757749 ) ) ( not ( = ?auto_757748 ?auto_757750 ) ) ( not ( = ?auto_757748 ?auto_757751 ) ) ( not ( = ?auto_757748 ?auto_757752 ) ) ( not ( = ?auto_757748 ?auto_757753 ) ) ( not ( = ?auto_757748 ?auto_757754 ) ) ( not ( = ?auto_757749 ?auto_757750 ) ) ( not ( = ?auto_757749 ?auto_757751 ) ) ( not ( = ?auto_757749 ?auto_757752 ) ) ( not ( = ?auto_757749 ?auto_757753 ) ) ( not ( = ?auto_757749 ?auto_757754 ) ) ( not ( = ?auto_757750 ?auto_757751 ) ) ( not ( = ?auto_757750 ?auto_757752 ) ) ( not ( = ?auto_757750 ?auto_757753 ) ) ( not ( = ?auto_757750 ?auto_757754 ) ) ( not ( = ?auto_757751 ?auto_757752 ) ) ( not ( = ?auto_757751 ?auto_757753 ) ) ( not ( = ?auto_757751 ?auto_757754 ) ) ( not ( = ?auto_757752 ?auto_757753 ) ) ( not ( = ?auto_757752 ?auto_757754 ) ) ( not ( = ?auto_757753 ?auto_757754 ) ) ( ON ?auto_757752 ?auto_757753 ) ( CLEAR ?auto_757750 ) ( ON ?auto_757751 ?auto_757752 ) ( CLEAR ?auto_757751 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_757747 ?auto_757748 ?auto_757749 ?auto_757750 ?auto_757751 )
      ( MAKE-7PILE ?auto_757747 ?auto_757748 ?auto_757749 ?auto_757750 ?auto_757751 ?auto_757752 ?auto_757753 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_757777 - BLOCK
      ?auto_757778 - BLOCK
      ?auto_757779 - BLOCK
      ?auto_757780 - BLOCK
      ?auto_757781 - BLOCK
      ?auto_757782 - BLOCK
      ?auto_757783 - BLOCK
    )
    :vars
    (
      ?auto_757784 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_757783 ?auto_757784 ) ( ON-TABLE ?auto_757777 ) ( ON ?auto_757778 ?auto_757777 ) ( ON ?auto_757779 ?auto_757778 ) ( not ( = ?auto_757777 ?auto_757778 ) ) ( not ( = ?auto_757777 ?auto_757779 ) ) ( not ( = ?auto_757777 ?auto_757780 ) ) ( not ( = ?auto_757777 ?auto_757781 ) ) ( not ( = ?auto_757777 ?auto_757782 ) ) ( not ( = ?auto_757777 ?auto_757783 ) ) ( not ( = ?auto_757777 ?auto_757784 ) ) ( not ( = ?auto_757778 ?auto_757779 ) ) ( not ( = ?auto_757778 ?auto_757780 ) ) ( not ( = ?auto_757778 ?auto_757781 ) ) ( not ( = ?auto_757778 ?auto_757782 ) ) ( not ( = ?auto_757778 ?auto_757783 ) ) ( not ( = ?auto_757778 ?auto_757784 ) ) ( not ( = ?auto_757779 ?auto_757780 ) ) ( not ( = ?auto_757779 ?auto_757781 ) ) ( not ( = ?auto_757779 ?auto_757782 ) ) ( not ( = ?auto_757779 ?auto_757783 ) ) ( not ( = ?auto_757779 ?auto_757784 ) ) ( not ( = ?auto_757780 ?auto_757781 ) ) ( not ( = ?auto_757780 ?auto_757782 ) ) ( not ( = ?auto_757780 ?auto_757783 ) ) ( not ( = ?auto_757780 ?auto_757784 ) ) ( not ( = ?auto_757781 ?auto_757782 ) ) ( not ( = ?auto_757781 ?auto_757783 ) ) ( not ( = ?auto_757781 ?auto_757784 ) ) ( not ( = ?auto_757782 ?auto_757783 ) ) ( not ( = ?auto_757782 ?auto_757784 ) ) ( not ( = ?auto_757783 ?auto_757784 ) ) ( ON ?auto_757782 ?auto_757783 ) ( ON ?auto_757781 ?auto_757782 ) ( CLEAR ?auto_757779 ) ( ON ?auto_757780 ?auto_757781 ) ( CLEAR ?auto_757780 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_757777 ?auto_757778 ?auto_757779 ?auto_757780 )
      ( MAKE-7PILE ?auto_757777 ?auto_757778 ?auto_757779 ?auto_757780 ?auto_757781 ?auto_757782 ?auto_757783 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_757807 - BLOCK
      ?auto_757808 - BLOCK
      ?auto_757809 - BLOCK
      ?auto_757810 - BLOCK
      ?auto_757811 - BLOCK
      ?auto_757812 - BLOCK
      ?auto_757813 - BLOCK
    )
    :vars
    (
      ?auto_757814 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_757813 ?auto_757814 ) ( ON-TABLE ?auto_757807 ) ( ON ?auto_757808 ?auto_757807 ) ( not ( = ?auto_757807 ?auto_757808 ) ) ( not ( = ?auto_757807 ?auto_757809 ) ) ( not ( = ?auto_757807 ?auto_757810 ) ) ( not ( = ?auto_757807 ?auto_757811 ) ) ( not ( = ?auto_757807 ?auto_757812 ) ) ( not ( = ?auto_757807 ?auto_757813 ) ) ( not ( = ?auto_757807 ?auto_757814 ) ) ( not ( = ?auto_757808 ?auto_757809 ) ) ( not ( = ?auto_757808 ?auto_757810 ) ) ( not ( = ?auto_757808 ?auto_757811 ) ) ( not ( = ?auto_757808 ?auto_757812 ) ) ( not ( = ?auto_757808 ?auto_757813 ) ) ( not ( = ?auto_757808 ?auto_757814 ) ) ( not ( = ?auto_757809 ?auto_757810 ) ) ( not ( = ?auto_757809 ?auto_757811 ) ) ( not ( = ?auto_757809 ?auto_757812 ) ) ( not ( = ?auto_757809 ?auto_757813 ) ) ( not ( = ?auto_757809 ?auto_757814 ) ) ( not ( = ?auto_757810 ?auto_757811 ) ) ( not ( = ?auto_757810 ?auto_757812 ) ) ( not ( = ?auto_757810 ?auto_757813 ) ) ( not ( = ?auto_757810 ?auto_757814 ) ) ( not ( = ?auto_757811 ?auto_757812 ) ) ( not ( = ?auto_757811 ?auto_757813 ) ) ( not ( = ?auto_757811 ?auto_757814 ) ) ( not ( = ?auto_757812 ?auto_757813 ) ) ( not ( = ?auto_757812 ?auto_757814 ) ) ( not ( = ?auto_757813 ?auto_757814 ) ) ( ON ?auto_757812 ?auto_757813 ) ( ON ?auto_757811 ?auto_757812 ) ( ON ?auto_757810 ?auto_757811 ) ( CLEAR ?auto_757808 ) ( ON ?auto_757809 ?auto_757810 ) ( CLEAR ?auto_757809 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_757807 ?auto_757808 ?auto_757809 )
      ( MAKE-7PILE ?auto_757807 ?auto_757808 ?auto_757809 ?auto_757810 ?auto_757811 ?auto_757812 ?auto_757813 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_757837 - BLOCK
      ?auto_757838 - BLOCK
      ?auto_757839 - BLOCK
      ?auto_757840 - BLOCK
      ?auto_757841 - BLOCK
      ?auto_757842 - BLOCK
      ?auto_757843 - BLOCK
    )
    :vars
    (
      ?auto_757844 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_757843 ?auto_757844 ) ( ON-TABLE ?auto_757837 ) ( not ( = ?auto_757837 ?auto_757838 ) ) ( not ( = ?auto_757837 ?auto_757839 ) ) ( not ( = ?auto_757837 ?auto_757840 ) ) ( not ( = ?auto_757837 ?auto_757841 ) ) ( not ( = ?auto_757837 ?auto_757842 ) ) ( not ( = ?auto_757837 ?auto_757843 ) ) ( not ( = ?auto_757837 ?auto_757844 ) ) ( not ( = ?auto_757838 ?auto_757839 ) ) ( not ( = ?auto_757838 ?auto_757840 ) ) ( not ( = ?auto_757838 ?auto_757841 ) ) ( not ( = ?auto_757838 ?auto_757842 ) ) ( not ( = ?auto_757838 ?auto_757843 ) ) ( not ( = ?auto_757838 ?auto_757844 ) ) ( not ( = ?auto_757839 ?auto_757840 ) ) ( not ( = ?auto_757839 ?auto_757841 ) ) ( not ( = ?auto_757839 ?auto_757842 ) ) ( not ( = ?auto_757839 ?auto_757843 ) ) ( not ( = ?auto_757839 ?auto_757844 ) ) ( not ( = ?auto_757840 ?auto_757841 ) ) ( not ( = ?auto_757840 ?auto_757842 ) ) ( not ( = ?auto_757840 ?auto_757843 ) ) ( not ( = ?auto_757840 ?auto_757844 ) ) ( not ( = ?auto_757841 ?auto_757842 ) ) ( not ( = ?auto_757841 ?auto_757843 ) ) ( not ( = ?auto_757841 ?auto_757844 ) ) ( not ( = ?auto_757842 ?auto_757843 ) ) ( not ( = ?auto_757842 ?auto_757844 ) ) ( not ( = ?auto_757843 ?auto_757844 ) ) ( ON ?auto_757842 ?auto_757843 ) ( ON ?auto_757841 ?auto_757842 ) ( ON ?auto_757840 ?auto_757841 ) ( ON ?auto_757839 ?auto_757840 ) ( CLEAR ?auto_757837 ) ( ON ?auto_757838 ?auto_757839 ) ( CLEAR ?auto_757838 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_757837 ?auto_757838 )
      ( MAKE-7PILE ?auto_757837 ?auto_757838 ?auto_757839 ?auto_757840 ?auto_757841 ?auto_757842 ?auto_757843 ) )
  )

  ( :method MAKE-7PILE
    :parameters
    (
      ?auto_757867 - BLOCK
      ?auto_757868 - BLOCK
      ?auto_757869 - BLOCK
      ?auto_757870 - BLOCK
      ?auto_757871 - BLOCK
      ?auto_757872 - BLOCK
      ?auto_757873 - BLOCK
    )
    :vars
    (
      ?auto_757874 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_757873 ?auto_757874 ) ( not ( = ?auto_757867 ?auto_757868 ) ) ( not ( = ?auto_757867 ?auto_757869 ) ) ( not ( = ?auto_757867 ?auto_757870 ) ) ( not ( = ?auto_757867 ?auto_757871 ) ) ( not ( = ?auto_757867 ?auto_757872 ) ) ( not ( = ?auto_757867 ?auto_757873 ) ) ( not ( = ?auto_757867 ?auto_757874 ) ) ( not ( = ?auto_757868 ?auto_757869 ) ) ( not ( = ?auto_757868 ?auto_757870 ) ) ( not ( = ?auto_757868 ?auto_757871 ) ) ( not ( = ?auto_757868 ?auto_757872 ) ) ( not ( = ?auto_757868 ?auto_757873 ) ) ( not ( = ?auto_757868 ?auto_757874 ) ) ( not ( = ?auto_757869 ?auto_757870 ) ) ( not ( = ?auto_757869 ?auto_757871 ) ) ( not ( = ?auto_757869 ?auto_757872 ) ) ( not ( = ?auto_757869 ?auto_757873 ) ) ( not ( = ?auto_757869 ?auto_757874 ) ) ( not ( = ?auto_757870 ?auto_757871 ) ) ( not ( = ?auto_757870 ?auto_757872 ) ) ( not ( = ?auto_757870 ?auto_757873 ) ) ( not ( = ?auto_757870 ?auto_757874 ) ) ( not ( = ?auto_757871 ?auto_757872 ) ) ( not ( = ?auto_757871 ?auto_757873 ) ) ( not ( = ?auto_757871 ?auto_757874 ) ) ( not ( = ?auto_757872 ?auto_757873 ) ) ( not ( = ?auto_757872 ?auto_757874 ) ) ( not ( = ?auto_757873 ?auto_757874 ) ) ( ON ?auto_757872 ?auto_757873 ) ( ON ?auto_757871 ?auto_757872 ) ( ON ?auto_757870 ?auto_757871 ) ( ON ?auto_757869 ?auto_757870 ) ( ON ?auto_757868 ?auto_757869 ) ( ON ?auto_757867 ?auto_757868 ) ( CLEAR ?auto_757867 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_757867 )
      ( MAKE-7PILE ?auto_757867 ?auto_757868 ?auto_757869 ?auto_757870 ?auto_757871 ?auto_757872 ?auto_757873 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_757898 - BLOCK
      ?auto_757899 - BLOCK
      ?auto_757900 - BLOCK
      ?auto_757901 - BLOCK
      ?auto_757902 - BLOCK
      ?auto_757903 - BLOCK
      ?auto_757904 - BLOCK
      ?auto_757905 - BLOCK
    )
    :vars
    (
      ?auto_757906 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_757904 ) ( ON ?auto_757905 ?auto_757906 ) ( CLEAR ?auto_757905 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_757898 ) ( ON ?auto_757899 ?auto_757898 ) ( ON ?auto_757900 ?auto_757899 ) ( ON ?auto_757901 ?auto_757900 ) ( ON ?auto_757902 ?auto_757901 ) ( ON ?auto_757903 ?auto_757902 ) ( ON ?auto_757904 ?auto_757903 ) ( not ( = ?auto_757898 ?auto_757899 ) ) ( not ( = ?auto_757898 ?auto_757900 ) ) ( not ( = ?auto_757898 ?auto_757901 ) ) ( not ( = ?auto_757898 ?auto_757902 ) ) ( not ( = ?auto_757898 ?auto_757903 ) ) ( not ( = ?auto_757898 ?auto_757904 ) ) ( not ( = ?auto_757898 ?auto_757905 ) ) ( not ( = ?auto_757898 ?auto_757906 ) ) ( not ( = ?auto_757899 ?auto_757900 ) ) ( not ( = ?auto_757899 ?auto_757901 ) ) ( not ( = ?auto_757899 ?auto_757902 ) ) ( not ( = ?auto_757899 ?auto_757903 ) ) ( not ( = ?auto_757899 ?auto_757904 ) ) ( not ( = ?auto_757899 ?auto_757905 ) ) ( not ( = ?auto_757899 ?auto_757906 ) ) ( not ( = ?auto_757900 ?auto_757901 ) ) ( not ( = ?auto_757900 ?auto_757902 ) ) ( not ( = ?auto_757900 ?auto_757903 ) ) ( not ( = ?auto_757900 ?auto_757904 ) ) ( not ( = ?auto_757900 ?auto_757905 ) ) ( not ( = ?auto_757900 ?auto_757906 ) ) ( not ( = ?auto_757901 ?auto_757902 ) ) ( not ( = ?auto_757901 ?auto_757903 ) ) ( not ( = ?auto_757901 ?auto_757904 ) ) ( not ( = ?auto_757901 ?auto_757905 ) ) ( not ( = ?auto_757901 ?auto_757906 ) ) ( not ( = ?auto_757902 ?auto_757903 ) ) ( not ( = ?auto_757902 ?auto_757904 ) ) ( not ( = ?auto_757902 ?auto_757905 ) ) ( not ( = ?auto_757902 ?auto_757906 ) ) ( not ( = ?auto_757903 ?auto_757904 ) ) ( not ( = ?auto_757903 ?auto_757905 ) ) ( not ( = ?auto_757903 ?auto_757906 ) ) ( not ( = ?auto_757904 ?auto_757905 ) ) ( not ( = ?auto_757904 ?auto_757906 ) ) ( not ( = ?auto_757905 ?auto_757906 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_757905 ?auto_757906 )
      ( !STACK ?auto_757905 ?auto_757904 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_757932 - BLOCK
      ?auto_757933 - BLOCK
      ?auto_757934 - BLOCK
      ?auto_757935 - BLOCK
      ?auto_757936 - BLOCK
      ?auto_757937 - BLOCK
      ?auto_757938 - BLOCK
      ?auto_757939 - BLOCK
    )
    :vars
    (
      ?auto_757940 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_757939 ?auto_757940 ) ( ON-TABLE ?auto_757932 ) ( ON ?auto_757933 ?auto_757932 ) ( ON ?auto_757934 ?auto_757933 ) ( ON ?auto_757935 ?auto_757934 ) ( ON ?auto_757936 ?auto_757935 ) ( ON ?auto_757937 ?auto_757936 ) ( not ( = ?auto_757932 ?auto_757933 ) ) ( not ( = ?auto_757932 ?auto_757934 ) ) ( not ( = ?auto_757932 ?auto_757935 ) ) ( not ( = ?auto_757932 ?auto_757936 ) ) ( not ( = ?auto_757932 ?auto_757937 ) ) ( not ( = ?auto_757932 ?auto_757938 ) ) ( not ( = ?auto_757932 ?auto_757939 ) ) ( not ( = ?auto_757932 ?auto_757940 ) ) ( not ( = ?auto_757933 ?auto_757934 ) ) ( not ( = ?auto_757933 ?auto_757935 ) ) ( not ( = ?auto_757933 ?auto_757936 ) ) ( not ( = ?auto_757933 ?auto_757937 ) ) ( not ( = ?auto_757933 ?auto_757938 ) ) ( not ( = ?auto_757933 ?auto_757939 ) ) ( not ( = ?auto_757933 ?auto_757940 ) ) ( not ( = ?auto_757934 ?auto_757935 ) ) ( not ( = ?auto_757934 ?auto_757936 ) ) ( not ( = ?auto_757934 ?auto_757937 ) ) ( not ( = ?auto_757934 ?auto_757938 ) ) ( not ( = ?auto_757934 ?auto_757939 ) ) ( not ( = ?auto_757934 ?auto_757940 ) ) ( not ( = ?auto_757935 ?auto_757936 ) ) ( not ( = ?auto_757935 ?auto_757937 ) ) ( not ( = ?auto_757935 ?auto_757938 ) ) ( not ( = ?auto_757935 ?auto_757939 ) ) ( not ( = ?auto_757935 ?auto_757940 ) ) ( not ( = ?auto_757936 ?auto_757937 ) ) ( not ( = ?auto_757936 ?auto_757938 ) ) ( not ( = ?auto_757936 ?auto_757939 ) ) ( not ( = ?auto_757936 ?auto_757940 ) ) ( not ( = ?auto_757937 ?auto_757938 ) ) ( not ( = ?auto_757937 ?auto_757939 ) ) ( not ( = ?auto_757937 ?auto_757940 ) ) ( not ( = ?auto_757938 ?auto_757939 ) ) ( not ( = ?auto_757938 ?auto_757940 ) ) ( not ( = ?auto_757939 ?auto_757940 ) ) ( CLEAR ?auto_757937 ) ( ON ?auto_757938 ?auto_757939 ) ( CLEAR ?auto_757938 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_757932 ?auto_757933 ?auto_757934 ?auto_757935 ?auto_757936 ?auto_757937 ?auto_757938 )
      ( MAKE-8PILE ?auto_757932 ?auto_757933 ?auto_757934 ?auto_757935 ?auto_757936 ?auto_757937 ?auto_757938 ?auto_757939 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_757966 - BLOCK
      ?auto_757967 - BLOCK
      ?auto_757968 - BLOCK
      ?auto_757969 - BLOCK
      ?auto_757970 - BLOCK
      ?auto_757971 - BLOCK
      ?auto_757972 - BLOCK
      ?auto_757973 - BLOCK
    )
    :vars
    (
      ?auto_757974 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_757973 ?auto_757974 ) ( ON-TABLE ?auto_757966 ) ( ON ?auto_757967 ?auto_757966 ) ( ON ?auto_757968 ?auto_757967 ) ( ON ?auto_757969 ?auto_757968 ) ( ON ?auto_757970 ?auto_757969 ) ( not ( = ?auto_757966 ?auto_757967 ) ) ( not ( = ?auto_757966 ?auto_757968 ) ) ( not ( = ?auto_757966 ?auto_757969 ) ) ( not ( = ?auto_757966 ?auto_757970 ) ) ( not ( = ?auto_757966 ?auto_757971 ) ) ( not ( = ?auto_757966 ?auto_757972 ) ) ( not ( = ?auto_757966 ?auto_757973 ) ) ( not ( = ?auto_757966 ?auto_757974 ) ) ( not ( = ?auto_757967 ?auto_757968 ) ) ( not ( = ?auto_757967 ?auto_757969 ) ) ( not ( = ?auto_757967 ?auto_757970 ) ) ( not ( = ?auto_757967 ?auto_757971 ) ) ( not ( = ?auto_757967 ?auto_757972 ) ) ( not ( = ?auto_757967 ?auto_757973 ) ) ( not ( = ?auto_757967 ?auto_757974 ) ) ( not ( = ?auto_757968 ?auto_757969 ) ) ( not ( = ?auto_757968 ?auto_757970 ) ) ( not ( = ?auto_757968 ?auto_757971 ) ) ( not ( = ?auto_757968 ?auto_757972 ) ) ( not ( = ?auto_757968 ?auto_757973 ) ) ( not ( = ?auto_757968 ?auto_757974 ) ) ( not ( = ?auto_757969 ?auto_757970 ) ) ( not ( = ?auto_757969 ?auto_757971 ) ) ( not ( = ?auto_757969 ?auto_757972 ) ) ( not ( = ?auto_757969 ?auto_757973 ) ) ( not ( = ?auto_757969 ?auto_757974 ) ) ( not ( = ?auto_757970 ?auto_757971 ) ) ( not ( = ?auto_757970 ?auto_757972 ) ) ( not ( = ?auto_757970 ?auto_757973 ) ) ( not ( = ?auto_757970 ?auto_757974 ) ) ( not ( = ?auto_757971 ?auto_757972 ) ) ( not ( = ?auto_757971 ?auto_757973 ) ) ( not ( = ?auto_757971 ?auto_757974 ) ) ( not ( = ?auto_757972 ?auto_757973 ) ) ( not ( = ?auto_757972 ?auto_757974 ) ) ( not ( = ?auto_757973 ?auto_757974 ) ) ( ON ?auto_757972 ?auto_757973 ) ( CLEAR ?auto_757970 ) ( ON ?auto_757971 ?auto_757972 ) ( CLEAR ?auto_757971 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_757966 ?auto_757967 ?auto_757968 ?auto_757969 ?auto_757970 ?auto_757971 )
      ( MAKE-8PILE ?auto_757966 ?auto_757967 ?auto_757968 ?auto_757969 ?auto_757970 ?auto_757971 ?auto_757972 ?auto_757973 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_758000 - BLOCK
      ?auto_758001 - BLOCK
      ?auto_758002 - BLOCK
      ?auto_758003 - BLOCK
      ?auto_758004 - BLOCK
      ?auto_758005 - BLOCK
      ?auto_758006 - BLOCK
      ?auto_758007 - BLOCK
    )
    :vars
    (
      ?auto_758008 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_758007 ?auto_758008 ) ( ON-TABLE ?auto_758000 ) ( ON ?auto_758001 ?auto_758000 ) ( ON ?auto_758002 ?auto_758001 ) ( ON ?auto_758003 ?auto_758002 ) ( not ( = ?auto_758000 ?auto_758001 ) ) ( not ( = ?auto_758000 ?auto_758002 ) ) ( not ( = ?auto_758000 ?auto_758003 ) ) ( not ( = ?auto_758000 ?auto_758004 ) ) ( not ( = ?auto_758000 ?auto_758005 ) ) ( not ( = ?auto_758000 ?auto_758006 ) ) ( not ( = ?auto_758000 ?auto_758007 ) ) ( not ( = ?auto_758000 ?auto_758008 ) ) ( not ( = ?auto_758001 ?auto_758002 ) ) ( not ( = ?auto_758001 ?auto_758003 ) ) ( not ( = ?auto_758001 ?auto_758004 ) ) ( not ( = ?auto_758001 ?auto_758005 ) ) ( not ( = ?auto_758001 ?auto_758006 ) ) ( not ( = ?auto_758001 ?auto_758007 ) ) ( not ( = ?auto_758001 ?auto_758008 ) ) ( not ( = ?auto_758002 ?auto_758003 ) ) ( not ( = ?auto_758002 ?auto_758004 ) ) ( not ( = ?auto_758002 ?auto_758005 ) ) ( not ( = ?auto_758002 ?auto_758006 ) ) ( not ( = ?auto_758002 ?auto_758007 ) ) ( not ( = ?auto_758002 ?auto_758008 ) ) ( not ( = ?auto_758003 ?auto_758004 ) ) ( not ( = ?auto_758003 ?auto_758005 ) ) ( not ( = ?auto_758003 ?auto_758006 ) ) ( not ( = ?auto_758003 ?auto_758007 ) ) ( not ( = ?auto_758003 ?auto_758008 ) ) ( not ( = ?auto_758004 ?auto_758005 ) ) ( not ( = ?auto_758004 ?auto_758006 ) ) ( not ( = ?auto_758004 ?auto_758007 ) ) ( not ( = ?auto_758004 ?auto_758008 ) ) ( not ( = ?auto_758005 ?auto_758006 ) ) ( not ( = ?auto_758005 ?auto_758007 ) ) ( not ( = ?auto_758005 ?auto_758008 ) ) ( not ( = ?auto_758006 ?auto_758007 ) ) ( not ( = ?auto_758006 ?auto_758008 ) ) ( not ( = ?auto_758007 ?auto_758008 ) ) ( ON ?auto_758006 ?auto_758007 ) ( ON ?auto_758005 ?auto_758006 ) ( CLEAR ?auto_758003 ) ( ON ?auto_758004 ?auto_758005 ) ( CLEAR ?auto_758004 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_758000 ?auto_758001 ?auto_758002 ?auto_758003 ?auto_758004 )
      ( MAKE-8PILE ?auto_758000 ?auto_758001 ?auto_758002 ?auto_758003 ?auto_758004 ?auto_758005 ?auto_758006 ?auto_758007 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_758034 - BLOCK
      ?auto_758035 - BLOCK
      ?auto_758036 - BLOCK
      ?auto_758037 - BLOCK
      ?auto_758038 - BLOCK
      ?auto_758039 - BLOCK
      ?auto_758040 - BLOCK
      ?auto_758041 - BLOCK
    )
    :vars
    (
      ?auto_758042 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_758041 ?auto_758042 ) ( ON-TABLE ?auto_758034 ) ( ON ?auto_758035 ?auto_758034 ) ( ON ?auto_758036 ?auto_758035 ) ( not ( = ?auto_758034 ?auto_758035 ) ) ( not ( = ?auto_758034 ?auto_758036 ) ) ( not ( = ?auto_758034 ?auto_758037 ) ) ( not ( = ?auto_758034 ?auto_758038 ) ) ( not ( = ?auto_758034 ?auto_758039 ) ) ( not ( = ?auto_758034 ?auto_758040 ) ) ( not ( = ?auto_758034 ?auto_758041 ) ) ( not ( = ?auto_758034 ?auto_758042 ) ) ( not ( = ?auto_758035 ?auto_758036 ) ) ( not ( = ?auto_758035 ?auto_758037 ) ) ( not ( = ?auto_758035 ?auto_758038 ) ) ( not ( = ?auto_758035 ?auto_758039 ) ) ( not ( = ?auto_758035 ?auto_758040 ) ) ( not ( = ?auto_758035 ?auto_758041 ) ) ( not ( = ?auto_758035 ?auto_758042 ) ) ( not ( = ?auto_758036 ?auto_758037 ) ) ( not ( = ?auto_758036 ?auto_758038 ) ) ( not ( = ?auto_758036 ?auto_758039 ) ) ( not ( = ?auto_758036 ?auto_758040 ) ) ( not ( = ?auto_758036 ?auto_758041 ) ) ( not ( = ?auto_758036 ?auto_758042 ) ) ( not ( = ?auto_758037 ?auto_758038 ) ) ( not ( = ?auto_758037 ?auto_758039 ) ) ( not ( = ?auto_758037 ?auto_758040 ) ) ( not ( = ?auto_758037 ?auto_758041 ) ) ( not ( = ?auto_758037 ?auto_758042 ) ) ( not ( = ?auto_758038 ?auto_758039 ) ) ( not ( = ?auto_758038 ?auto_758040 ) ) ( not ( = ?auto_758038 ?auto_758041 ) ) ( not ( = ?auto_758038 ?auto_758042 ) ) ( not ( = ?auto_758039 ?auto_758040 ) ) ( not ( = ?auto_758039 ?auto_758041 ) ) ( not ( = ?auto_758039 ?auto_758042 ) ) ( not ( = ?auto_758040 ?auto_758041 ) ) ( not ( = ?auto_758040 ?auto_758042 ) ) ( not ( = ?auto_758041 ?auto_758042 ) ) ( ON ?auto_758040 ?auto_758041 ) ( ON ?auto_758039 ?auto_758040 ) ( ON ?auto_758038 ?auto_758039 ) ( CLEAR ?auto_758036 ) ( ON ?auto_758037 ?auto_758038 ) ( CLEAR ?auto_758037 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_758034 ?auto_758035 ?auto_758036 ?auto_758037 )
      ( MAKE-8PILE ?auto_758034 ?auto_758035 ?auto_758036 ?auto_758037 ?auto_758038 ?auto_758039 ?auto_758040 ?auto_758041 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_758068 - BLOCK
      ?auto_758069 - BLOCK
      ?auto_758070 - BLOCK
      ?auto_758071 - BLOCK
      ?auto_758072 - BLOCK
      ?auto_758073 - BLOCK
      ?auto_758074 - BLOCK
      ?auto_758075 - BLOCK
    )
    :vars
    (
      ?auto_758076 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_758075 ?auto_758076 ) ( ON-TABLE ?auto_758068 ) ( ON ?auto_758069 ?auto_758068 ) ( not ( = ?auto_758068 ?auto_758069 ) ) ( not ( = ?auto_758068 ?auto_758070 ) ) ( not ( = ?auto_758068 ?auto_758071 ) ) ( not ( = ?auto_758068 ?auto_758072 ) ) ( not ( = ?auto_758068 ?auto_758073 ) ) ( not ( = ?auto_758068 ?auto_758074 ) ) ( not ( = ?auto_758068 ?auto_758075 ) ) ( not ( = ?auto_758068 ?auto_758076 ) ) ( not ( = ?auto_758069 ?auto_758070 ) ) ( not ( = ?auto_758069 ?auto_758071 ) ) ( not ( = ?auto_758069 ?auto_758072 ) ) ( not ( = ?auto_758069 ?auto_758073 ) ) ( not ( = ?auto_758069 ?auto_758074 ) ) ( not ( = ?auto_758069 ?auto_758075 ) ) ( not ( = ?auto_758069 ?auto_758076 ) ) ( not ( = ?auto_758070 ?auto_758071 ) ) ( not ( = ?auto_758070 ?auto_758072 ) ) ( not ( = ?auto_758070 ?auto_758073 ) ) ( not ( = ?auto_758070 ?auto_758074 ) ) ( not ( = ?auto_758070 ?auto_758075 ) ) ( not ( = ?auto_758070 ?auto_758076 ) ) ( not ( = ?auto_758071 ?auto_758072 ) ) ( not ( = ?auto_758071 ?auto_758073 ) ) ( not ( = ?auto_758071 ?auto_758074 ) ) ( not ( = ?auto_758071 ?auto_758075 ) ) ( not ( = ?auto_758071 ?auto_758076 ) ) ( not ( = ?auto_758072 ?auto_758073 ) ) ( not ( = ?auto_758072 ?auto_758074 ) ) ( not ( = ?auto_758072 ?auto_758075 ) ) ( not ( = ?auto_758072 ?auto_758076 ) ) ( not ( = ?auto_758073 ?auto_758074 ) ) ( not ( = ?auto_758073 ?auto_758075 ) ) ( not ( = ?auto_758073 ?auto_758076 ) ) ( not ( = ?auto_758074 ?auto_758075 ) ) ( not ( = ?auto_758074 ?auto_758076 ) ) ( not ( = ?auto_758075 ?auto_758076 ) ) ( ON ?auto_758074 ?auto_758075 ) ( ON ?auto_758073 ?auto_758074 ) ( ON ?auto_758072 ?auto_758073 ) ( ON ?auto_758071 ?auto_758072 ) ( CLEAR ?auto_758069 ) ( ON ?auto_758070 ?auto_758071 ) ( CLEAR ?auto_758070 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_758068 ?auto_758069 ?auto_758070 )
      ( MAKE-8PILE ?auto_758068 ?auto_758069 ?auto_758070 ?auto_758071 ?auto_758072 ?auto_758073 ?auto_758074 ?auto_758075 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_758102 - BLOCK
      ?auto_758103 - BLOCK
      ?auto_758104 - BLOCK
      ?auto_758105 - BLOCK
      ?auto_758106 - BLOCK
      ?auto_758107 - BLOCK
      ?auto_758108 - BLOCK
      ?auto_758109 - BLOCK
    )
    :vars
    (
      ?auto_758110 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_758109 ?auto_758110 ) ( ON-TABLE ?auto_758102 ) ( not ( = ?auto_758102 ?auto_758103 ) ) ( not ( = ?auto_758102 ?auto_758104 ) ) ( not ( = ?auto_758102 ?auto_758105 ) ) ( not ( = ?auto_758102 ?auto_758106 ) ) ( not ( = ?auto_758102 ?auto_758107 ) ) ( not ( = ?auto_758102 ?auto_758108 ) ) ( not ( = ?auto_758102 ?auto_758109 ) ) ( not ( = ?auto_758102 ?auto_758110 ) ) ( not ( = ?auto_758103 ?auto_758104 ) ) ( not ( = ?auto_758103 ?auto_758105 ) ) ( not ( = ?auto_758103 ?auto_758106 ) ) ( not ( = ?auto_758103 ?auto_758107 ) ) ( not ( = ?auto_758103 ?auto_758108 ) ) ( not ( = ?auto_758103 ?auto_758109 ) ) ( not ( = ?auto_758103 ?auto_758110 ) ) ( not ( = ?auto_758104 ?auto_758105 ) ) ( not ( = ?auto_758104 ?auto_758106 ) ) ( not ( = ?auto_758104 ?auto_758107 ) ) ( not ( = ?auto_758104 ?auto_758108 ) ) ( not ( = ?auto_758104 ?auto_758109 ) ) ( not ( = ?auto_758104 ?auto_758110 ) ) ( not ( = ?auto_758105 ?auto_758106 ) ) ( not ( = ?auto_758105 ?auto_758107 ) ) ( not ( = ?auto_758105 ?auto_758108 ) ) ( not ( = ?auto_758105 ?auto_758109 ) ) ( not ( = ?auto_758105 ?auto_758110 ) ) ( not ( = ?auto_758106 ?auto_758107 ) ) ( not ( = ?auto_758106 ?auto_758108 ) ) ( not ( = ?auto_758106 ?auto_758109 ) ) ( not ( = ?auto_758106 ?auto_758110 ) ) ( not ( = ?auto_758107 ?auto_758108 ) ) ( not ( = ?auto_758107 ?auto_758109 ) ) ( not ( = ?auto_758107 ?auto_758110 ) ) ( not ( = ?auto_758108 ?auto_758109 ) ) ( not ( = ?auto_758108 ?auto_758110 ) ) ( not ( = ?auto_758109 ?auto_758110 ) ) ( ON ?auto_758108 ?auto_758109 ) ( ON ?auto_758107 ?auto_758108 ) ( ON ?auto_758106 ?auto_758107 ) ( ON ?auto_758105 ?auto_758106 ) ( ON ?auto_758104 ?auto_758105 ) ( CLEAR ?auto_758102 ) ( ON ?auto_758103 ?auto_758104 ) ( CLEAR ?auto_758103 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_758102 ?auto_758103 )
      ( MAKE-8PILE ?auto_758102 ?auto_758103 ?auto_758104 ?auto_758105 ?auto_758106 ?auto_758107 ?auto_758108 ?auto_758109 ) )
  )

  ( :method MAKE-8PILE
    :parameters
    (
      ?auto_758136 - BLOCK
      ?auto_758137 - BLOCK
      ?auto_758138 - BLOCK
      ?auto_758139 - BLOCK
      ?auto_758140 - BLOCK
      ?auto_758141 - BLOCK
      ?auto_758142 - BLOCK
      ?auto_758143 - BLOCK
    )
    :vars
    (
      ?auto_758144 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_758143 ?auto_758144 ) ( not ( = ?auto_758136 ?auto_758137 ) ) ( not ( = ?auto_758136 ?auto_758138 ) ) ( not ( = ?auto_758136 ?auto_758139 ) ) ( not ( = ?auto_758136 ?auto_758140 ) ) ( not ( = ?auto_758136 ?auto_758141 ) ) ( not ( = ?auto_758136 ?auto_758142 ) ) ( not ( = ?auto_758136 ?auto_758143 ) ) ( not ( = ?auto_758136 ?auto_758144 ) ) ( not ( = ?auto_758137 ?auto_758138 ) ) ( not ( = ?auto_758137 ?auto_758139 ) ) ( not ( = ?auto_758137 ?auto_758140 ) ) ( not ( = ?auto_758137 ?auto_758141 ) ) ( not ( = ?auto_758137 ?auto_758142 ) ) ( not ( = ?auto_758137 ?auto_758143 ) ) ( not ( = ?auto_758137 ?auto_758144 ) ) ( not ( = ?auto_758138 ?auto_758139 ) ) ( not ( = ?auto_758138 ?auto_758140 ) ) ( not ( = ?auto_758138 ?auto_758141 ) ) ( not ( = ?auto_758138 ?auto_758142 ) ) ( not ( = ?auto_758138 ?auto_758143 ) ) ( not ( = ?auto_758138 ?auto_758144 ) ) ( not ( = ?auto_758139 ?auto_758140 ) ) ( not ( = ?auto_758139 ?auto_758141 ) ) ( not ( = ?auto_758139 ?auto_758142 ) ) ( not ( = ?auto_758139 ?auto_758143 ) ) ( not ( = ?auto_758139 ?auto_758144 ) ) ( not ( = ?auto_758140 ?auto_758141 ) ) ( not ( = ?auto_758140 ?auto_758142 ) ) ( not ( = ?auto_758140 ?auto_758143 ) ) ( not ( = ?auto_758140 ?auto_758144 ) ) ( not ( = ?auto_758141 ?auto_758142 ) ) ( not ( = ?auto_758141 ?auto_758143 ) ) ( not ( = ?auto_758141 ?auto_758144 ) ) ( not ( = ?auto_758142 ?auto_758143 ) ) ( not ( = ?auto_758142 ?auto_758144 ) ) ( not ( = ?auto_758143 ?auto_758144 ) ) ( ON ?auto_758142 ?auto_758143 ) ( ON ?auto_758141 ?auto_758142 ) ( ON ?auto_758140 ?auto_758141 ) ( ON ?auto_758139 ?auto_758140 ) ( ON ?auto_758138 ?auto_758139 ) ( ON ?auto_758137 ?auto_758138 ) ( ON ?auto_758136 ?auto_758137 ) ( CLEAR ?auto_758136 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_758136 )
      ( MAKE-8PILE ?auto_758136 ?auto_758137 ?auto_758138 ?auto_758139 ?auto_758140 ?auto_758141 ?auto_758142 ?auto_758143 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_758171 - BLOCK
      ?auto_758172 - BLOCK
      ?auto_758173 - BLOCK
      ?auto_758174 - BLOCK
      ?auto_758175 - BLOCK
      ?auto_758176 - BLOCK
      ?auto_758177 - BLOCK
      ?auto_758178 - BLOCK
      ?auto_758179 - BLOCK
    )
    :vars
    (
      ?auto_758180 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_758178 ) ( ON ?auto_758179 ?auto_758180 ) ( CLEAR ?auto_758179 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_758171 ) ( ON ?auto_758172 ?auto_758171 ) ( ON ?auto_758173 ?auto_758172 ) ( ON ?auto_758174 ?auto_758173 ) ( ON ?auto_758175 ?auto_758174 ) ( ON ?auto_758176 ?auto_758175 ) ( ON ?auto_758177 ?auto_758176 ) ( ON ?auto_758178 ?auto_758177 ) ( not ( = ?auto_758171 ?auto_758172 ) ) ( not ( = ?auto_758171 ?auto_758173 ) ) ( not ( = ?auto_758171 ?auto_758174 ) ) ( not ( = ?auto_758171 ?auto_758175 ) ) ( not ( = ?auto_758171 ?auto_758176 ) ) ( not ( = ?auto_758171 ?auto_758177 ) ) ( not ( = ?auto_758171 ?auto_758178 ) ) ( not ( = ?auto_758171 ?auto_758179 ) ) ( not ( = ?auto_758171 ?auto_758180 ) ) ( not ( = ?auto_758172 ?auto_758173 ) ) ( not ( = ?auto_758172 ?auto_758174 ) ) ( not ( = ?auto_758172 ?auto_758175 ) ) ( not ( = ?auto_758172 ?auto_758176 ) ) ( not ( = ?auto_758172 ?auto_758177 ) ) ( not ( = ?auto_758172 ?auto_758178 ) ) ( not ( = ?auto_758172 ?auto_758179 ) ) ( not ( = ?auto_758172 ?auto_758180 ) ) ( not ( = ?auto_758173 ?auto_758174 ) ) ( not ( = ?auto_758173 ?auto_758175 ) ) ( not ( = ?auto_758173 ?auto_758176 ) ) ( not ( = ?auto_758173 ?auto_758177 ) ) ( not ( = ?auto_758173 ?auto_758178 ) ) ( not ( = ?auto_758173 ?auto_758179 ) ) ( not ( = ?auto_758173 ?auto_758180 ) ) ( not ( = ?auto_758174 ?auto_758175 ) ) ( not ( = ?auto_758174 ?auto_758176 ) ) ( not ( = ?auto_758174 ?auto_758177 ) ) ( not ( = ?auto_758174 ?auto_758178 ) ) ( not ( = ?auto_758174 ?auto_758179 ) ) ( not ( = ?auto_758174 ?auto_758180 ) ) ( not ( = ?auto_758175 ?auto_758176 ) ) ( not ( = ?auto_758175 ?auto_758177 ) ) ( not ( = ?auto_758175 ?auto_758178 ) ) ( not ( = ?auto_758175 ?auto_758179 ) ) ( not ( = ?auto_758175 ?auto_758180 ) ) ( not ( = ?auto_758176 ?auto_758177 ) ) ( not ( = ?auto_758176 ?auto_758178 ) ) ( not ( = ?auto_758176 ?auto_758179 ) ) ( not ( = ?auto_758176 ?auto_758180 ) ) ( not ( = ?auto_758177 ?auto_758178 ) ) ( not ( = ?auto_758177 ?auto_758179 ) ) ( not ( = ?auto_758177 ?auto_758180 ) ) ( not ( = ?auto_758178 ?auto_758179 ) ) ( not ( = ?auto_758178 ?auto_758180 ) ) ( not ( = ?auto_758179 ?auto_758180 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_758179 ?auto_758180 )
      ( !STACK ?auto_758179 ?auto_758178 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_758209 - BLOCK
      ?auto_758210 - BLOCK
      ?auto_758211 - BLOCK
      ?auto_758212 - BLOCK
      ?auto_758213 - BLOCK
      ?auto_758214 - BLOCK
      ?auto_758215 - BLOCK
      ?auto_758216 - BLOCK
      ?auto_758217 - BLOCK
    )
    :vars
    (
      ?auto_758218 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_758217 ?auto_758218 ) ( ON-TABLE ?auto_758209 ) ( ON ?auto_758210 ?auto_758209 ) ( ON ?auto_758211 ?auto_758210 ) ( ON ?auto_758212 ?auto_758211 ) ( ON ?auto_758213 ?auto_758212 ) ( ON ?auto_758214 ?auto_758213 ) ( ON ?auto_758215 ?auto_758214 ) ( not ( = ?auto_758209 ?auto_758210 ) ) ( not ( = ?auto_758209 ?auto_758211 ) ) ( not ( = ?auto_758209 ?auto_758212 ) ) ( not ( = ?auto_758209 ?auto_758213 ) ) ( not ( = ?auto_758209 ?auto_758214 ) ) ( not ( = ?auto_758209 ?auto_758215 ) ) ( not ( = ?auto_758209 ?auto_758216 ) ) ( not ( = ?auto_758209 ?auto_758217 ) ) ( not ( = ?auto_758209 ?auto_758218 ) ) ( not ( = ?auto_758210 ?auto_758211 ) ) ( not ( = ?auto_758210 ?auto_758212 ) ) ( not ( = ?auto_758210 ?auto_758213 ) ) ( not ( = ?auto_758210 ?auto_758214 ) ) ( not ( = ?auto_758210 ?auto_758215 ) ) ( not ( = ?auto_758210 ?auto_758216 ) ) ( not ( = ?auto_758210 ?auto_758217 ) ) ( not ( = ?auto_758210 ?auto_758218 ) ) ( not ( = ?auto_758211 ?auto_758212 ) ) ( not ( = ?auto_758211 ?auto_758213 ) ) ( not ( = ?auto_758211 ?auto_758214 ) ) ( not ( = ?auto_758211 ?auto_758215 ) ) ( not ( = ?auto_758211 ?auto_758216 ) ) ( not ( = ?auto_758211 ?auto_758217 ) ) ( not ( = ?auto_758211 ?auto_758218 ) ) ( not ( = ?auto_758212 ?auto_758213 ) ) ( not ( = ?auto_758212 ?auto_758214 ) ) ( not ( = ?auto_758212 ?auto_758215 ) ) ( not ( = ?auto_758212 ?auto_758216 ) ) ( not ( = ?auto_758212 ?auto_758217 ) ) ( not ( = ?auto_758212 ?auto_758218 ) ) ( not ( = ?auto_758213 ?auto_758214 ) ) ( not ( = ?auto_758213 ?auto_758215 ) ) ( not ( = ?auto_758213 ?auto_758216 ) ) ( not ( = ?auto_758213 ?auto_758217 ) ) ( not ( = ?auto_758213 ?auto_758218 ) ) ( not ( = ?auto_758214 ?auto_758215 ) ) ( not ( = ?auto_758214 ?auto_758216 ) ) ( not ( = ?auto_758214 ?auto_758217 ) ) ( not ( = ?auto_758214 ?auto_758218 ) ) ( not ( = ?auto_758215 ?auto_758216 ) ) ( not ( = ?auto_758215 ?auto_758217 ) ) ( not ( = ?auto_758215 ?auto_758218 ) ) ( not ( = ?auto_758216 ?auto_758217 ) ) ( not ( = ?auto_758216 ?auto_758218 ) ) ( not ( = ?auto_758217 ?auto_758218 ) ) ( CLEAR ?auto_758215 ) ( ON ?auto_758216 ?auto_758217 ) ( CLEAR ?auto_758216 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_758209 ?auto_758210 ?auto_758211 ?auto_758212 ?auto_758213 ?auto_758214 ?auto_758215 ?auto_758216 )
      ( MAKE-9PILE ?auto_758209 ?auto_758210 ?auto_758211 ?auto_758212 ?auto_758213 ?auto_758214 ?auto_758215 ?auto_758216 ?auto_758217 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_758247 - BLOCK
      ?auto_758248 - BLOCK
      ?auto_758249 - BLOCK
      ?auto_758250 - BLOCK
      ?auto_758251 - BLOCK
      ?auto_758252 - BLOCK
      ?auto_758253 - BLOCK
      ?auto_758254 - BLOCK
      ?auto_758255 - BLOCK
    )
    :vars
    (
      ?auto_758256 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_758255 ?auto_758256 ) ( ON-TABLE ?auto_758247 ) ( ON ?auto_758248 ?auto_758247 ) ( ON ?auto_758249 ?auto_758248 ) ( ON ?auto_758250 ?auto_758249 ) ( ON ?auto_758251 ?auto_758250 ) ( ON ?auto_758252 ?auto_758251 ) ( not ( = ?auto_758247 ?auto_758248 ) ) ( not ( = ?auto_758247 ?auto_758249 ) ) ( not ( = ?auto_758247 ?auto_758250 ) ) ( not ( = ?auto_758247 ?auto_758251 ) ) ( not ( = ?auto_758247 ?auto_758252 ) ) ( not ( = ?auto_758247 ?auto_758253 ) ) ( not ( = ?auto_758247 ?auto_758254 ) ) ( not ( = ?auto_758247 ?auto_758255 ) ) ( not ( = ?auto_758247 ?auto_758256 ) ) ( not ( = ?auto_758248 ?auto_758249 ) ) ( not ( = ?auto_758248 ?auto_758250 ) ) ( not ( = ?auto_758248 ?auto_758251 ) ) ( not ( = ?auto_758248 ?auto_758252 ) ) ( not ( = ?auto_758248 ?auto_758253 ) ) ( not ( = ?auto_758248 ?auto_758254 ) ) ( not ( = ?auto_758248 ?auto_758255 ) ) ( not ( = ?auto_758248 ?auto_758256 ) ) ( not ( = ?auto_758249 ?auto_758250 ) ) ( not ( = ?auto_758249 ?auto_758251 ) ) ( not ( = ?auto_758249 ?auto_758252 ) ) ( not ( = ?auto_758249 ?auto_758253 ) ) ( not ( = ?auto_758249 ?auto_758254 ) ) ( not ( = ?auto_758249 ?auto_758255 ) ) ( not ( = ?auto_758249 ?auto_758256 ) ) ( not ( = ?auto_758250 ?auto_758251 ) ) ( not ( = ?auto_758250 ?auto_758252 ) ) ( not ( = ?auto_758250 ?auto_758253 ) ) ( not ( = ?auto_758250 ?auto_758254 ) ) ( not ( = ?auto_758250 ?auto_758255 ) ) ( not ( = ?auto_758250 ?auto_758256 ) ) ( not ( = ?auto_758251 ?auto_758252 ) ) ( not ( = ?auto_758251 ?auto_758253 ) ) ( not ( = ?auto_758251 ?auto_758254 ) ) ( not ( = ?auto_758251 ?auto_758255 ) ) ( not ( = ?auto_758251 ?auto_758256 ) ) ( not ( = ?auto_758252 ?auto_758253 ) ) ( not ( = ?auto_758252 ?auto_758254 ) ) ( not ( = ?auto_758252 ?auto_758255 ) ) ( not ( = ?auto_758252 ?auto_758256 ) ) ( not ( = ?auto_758253 ?auto_758254 ) ) ( not ( = ?auto_758253 ?auto_758255 ) ) ( not ( = ?auto_758253 ?auto_758256 ) ) ( not ( = ?auto_758254 ?auto_758255 ) ) ( not ( = ?auto_758254 ?auto_758256 ) ) ( not ( = ?auto_758255 ?auto_758256 ) ) ( ON ?auto_758254 ?auto_758255 ) ( CLEAR ?auto_758252 ) ( ON ?auto_758253 ?auto_758254 ) ( CLEAR ?auto_758253 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_758247 ?auto_758248 ?auto_758249 ?auto_758250 ?auto_758251 ?auto_758252 ?auto_758253 )
      ( MAKE-9PILE ?auto_758247 ?auto_758248 ?auto_758249 ?auto_758250 ?auto_758251 ?auto_758252 ?auto_758253 ?auto_758254 ?auto_758255 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_758285 - BLOCK
      ?auto_758286 - BLOCK
      ?auto_758287 - BLOCK
      ?auto_758288 - BLOCK
      ?auto_758289 - BLOCK
      ?auto_758290 - BLOCK
      ?auto_758291 - BLOCK
      ?auto_758292 - BLOCK
      ?auto_758293 - BLOCK
    )
    :vars
    (
      ?auto_758294 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_758293 ?auto_758294 ) ( ON-TABLE ?auto_758285 ) ( ON ?auto_758286 ?auto_758285 ) ( ON ?auto_758287 ?auto_758286 ) ( ON ?auto_758288 ?auto_758287 ) ( ON ?auto_758289 ?auto_758288 ) ( not ( = ?auto_758285 ?auto_758286 ) ) ( not ( = ?auto_758285 ?auto_758287 ) ) ( not ( = ?auto_758285 ?auto_758288 ) ) ( not ( = ?auto_758285 ?auto_758289 ) ) ( not ( = ?auto_758285 ?auto_758290 ) ) ( not ( = ?auto_758285 ?auto_758291 ) ) ( not ( = ?auto_758285 ?auto_758292 ) ) ( not ( = ?auto_758285 ?auto_758293 ) ) ( not ( = ?auto_758285 ?auto_758294 ) ) ( not ( = ?auto_758286 ?auto_758287 ) ) ( not ( = ?auto_758286 ?auto_758288 ) ) ( not ( = ?auto_758286 ?auto_758289 ) ) ( not ( = ?auto_758286 ?auto_758290 ) ) ( not ( = ?auto_758286 ?auto_758291 ) ) ( not ( = ?auto_758286 ?auto_758292 ) ) ( not ( = ?auto_758286 ?auto_758293 ) ) ( not ( = ?auto_758286 ?auto_758294 ) ) ( not ( = ?auto_758287 ?auto_758288 ) ) ( not ( = ?auto_758287 ?auto_758289 ) ) ( not ( = ?auto_758287 ?auto_758290 ) ) ( not ( = ?auto_758287 ?auto_758291 ) ) ( not ( = ?auto_758287 ?auto_758292 ) ) ( not ( = ?auto_758287 ?auto_758293 ) ) ( not ( = ?auto_758287 ?auto_758294 ) ) ( not ( = ?auto_758288 ?auto_758289 ) ) ( not ( = ?auto_758288 ?auto_758290 ) ) ( not ( = ?auto_758288 ?auto_758291 ) ) ( not ( = ?auto_758288 ?auto_758292 ) ) ( not ( = ?auto_758288 ?auto_758293 ) ) ( not ( = ?auto_758288 ?auto_758294 ) ) ( not ( = ?auto_758289 ?auto_758290 ) ) ( not ( = ?auto_758289 ?auto_758291 ) ) ( not ( = ?auto_758289 ?auto_758292 ) ) ( not ( = ?auto_758289 ?auto_758293 ) ) ( not ( = ?auto_758289 ?auto_758294 ) ) ( not ( = ?auto_758290 ?auto_758291 ) ) ( not ( = ?auto_758290 ?auto_758292 ) ) ( not ( = ?auto_758290 ?auto_758293 ) ) ( not ( = ?auto_758290 ?auto_758294 ) ) ( not ( = ?auto_758291 ?auto_758292 ) ) ( not ( = ?auto_758291 ?auto_758293 ) ) ( not ( = ?auto_758291 ?auto_758294 ) ) ( not ( = ?auto_758292 ?auto_758293 ) ) ( not ( = ?auto_758292 ?auto_758294 ) ) ( not ( = ?auto_758293 ?auto_758294 ) ) ( ON ?auto_758292 ?auto_758293 ) ( ON ?auto_758291 ?auto_758292 ) ( CLEAR ?auto_758289 ) ( ON ?auto_758290 ?auto_758291 ) ( CLEAR ?auto_758290 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_758285 ?auto_758286 ?auto_758287 ?auto_758288 ?auto_758289 ?auto_758290 )
      ( MAKE-9PILE ?auto_758285 ?auto_758286 ?auto_758287 ?auto_758288 ?auto_758289 ?auto_758290 ?auto_758291 ?auto_758292 ?auto_758293 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_758323 - BLOCK
      ?auto_758324 - BLOCK
      ?auto_758325 - BLOCK
      ?auto_758326 - BLOCK
      ?auto_758327 - BLOCK
      ?auto_758328 - BLOCK
      ?auto_758329 - BLOCK
      ?auto_758330 - BLOCK
      ?auto_758331 - BLOCK
    )
    :vars
    (
      ?auto_758332 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_758331 ?auto_758332 ) ( ON-TABLE ?auto_758323 ) ( ON ?auto_758324 ?auto_758323 ) ( ON ?auto_758325 ?auto_758324 ) ( ON ?auto_758326 ?auto_758325 ) ( not ( = ?auto_758323 ?auto_758324 ) ) ( not ( = ?auto_758323 ?auto_758325 ) ) ( not ( = ?auto_758323 ?auto_758326 ) ) ( not ( = ?auto_758323 ?auto_758327 ) ) ( not ( = ?auto_758323 ?auto_758328 ) ) ( not ( = ?auto_758323 ?auto_758329 ) ) ( not ( = ?auto_758323 ?auto_758330 ) ) ( not ( = ?auto_758323 ?auto_758331 ) ) ( not ( = ?auto_758323 ?auto_758332 ) ) ( not ( = ?auto_758324 ?auto_758325 ) ) ( not ( = ?auto_758324 ?auto_758326 ) ) ( not ( = ?auto_758324 ?auto_758327 ) ) ( not ( = ?auto_758324 ?auto_758328 ) ) ( not ( = ?auto_758324 ?auto_758329 ) ) ( not ( = ?auto_758324 ?auto_758330 ) ) ( not ( = ?auto_758324 ?auto_758331 ) ) ( not ( = ?auto_758324 ?auto_758332 ) ) ( not ( = ?auto_758325 ?auto_758326 ) ) ( not ( = ?auto_758325 ?auto_758327 ) ) ( not ( = ?auto_758325 ?auto_758328 ) ) ( not ( = ?auto_758325 ?auto_758329 ) ) ( not ( = ?auto_758325 ?auto_758330 ) ) ( not ( = ?auto_758325 ?auto_758331 ) ) ( not ( = ?auto_758325 ?auto_758332 ) ) ( not ( = ?auto_758326 ?auto_758327 ) ) ( not ( = ?auto_758326 ?auto_758328 ) ) ( not ( = ?auto_758326 ?auto_758329 ) ) ( not ( = ?auto_758326 ?auto_758330 ) ) ( not ( = ?auto_758326 ?auto_758331 ) ) ( not ( = ?auto_758326 ?auto_758332 ) ) ( not ( = ?auto_758327 ?auto_758328 ) ) ( not ( = ?auto_758327 ?auto_758329 ) ) ( not ( = ?auto_758327 ?auto_758330 ) ) ( not ( = ?auto_758327 ?auto_758331 ) ) ( not ( = ?auto_758327 ?auto_758332 ) ) ( not ( = ?auto_758328 ?auto_758329 ) ) ( not ( = ?auto_758328 ?auto_758330 ) ) ( not ( = ?auto_758328 ?auto_758331 ) ) ( not ( = ?auto_758328 ?auto_758332 ) ) ( not ( = ?auto_758329 ?auto_758330 ) ) ( not ( = ?auto_758329 ?auto_758331 ) ) ( not ( = ?auto_758329 ?auto_758332 ) ) ( not ( = ?auto_758330 ?auto_758331 ) ) ( not ( = ?auto_758330 ?auto_758332 ) ) ( not ( = ?auto_758331 ?auto_758332 ) ) ( ON ?auto_758330 ?auto_758331 ) ( ON ?auto_758329 ?auto_758330 ) ( ON ?auto_758328 ?auto_758329 ) ( CLEAR ?auto_758326 ) ( ON ?auto_758327 ?auto_758328 ) ( CLEAR ?auto_758327 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_758323 ?auto_758324 ?auto_758325 ?auto_758326 ?auto_758327 )
      ( MAKE-9PILE ?auto_758323 ?auto_758324 ?auto_758325 ?auto_758326 ?auto_758327 ?auto_758328 ?auto_758329 ?auto_758330 ?auto_758331 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_758361 - BLOCK
      ?auto_758362 - BLOCK
      ?auto_758363 - BLOCK
      ?auto_758364 - BLOCK
      ?auto_758365 - BLOCK
      ?auto_758366 - BLOCK
      ?auto_758367 - BLOCK
      ?auto_758368 - BLOCK
      ?auto_758369 - BLOCK
    )
    :vars
    (
      ?auto_758370 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_758369 ?auto_758370 ) ( ON-TABLE ?auto_758361 ) ( ON ?auto_758362 ?auto_758361 ) ( ON ?auto_758363 ?auto_758362 ) ( not ( = ?auto_758361 ?auto_758362 ) ) ( not ( = ?auto_758361 ?auto_758363 ) ) ( not ( = ?auto_758361 ?auto_758364 ) ) ( not ( = ?auto_758361 ?auto_758365 ) ) ( not ( = ?auto_758361 ?auto_758366 ) ) ( not ( = ?auto_758361 ?auto_758367 ) ) ( not ( = ?auto_758361 ?auto_758368 ) ) ( not ( = ?auto_758361 ?auto_758369 ) ) ( not ( = ?auto_758361 ?auto_758370 ) ) ( not ( = ?auto_758362 ?auto_758363 ) ) ( not ( = ?auto_758362 ?auto_758364 ) ) ( not ( = ?auto_758362 ?auto_758365 ) ) ( not ( = ?auto_758362 ?auto_758366 ) ) ( not ( = ?auto_758362 ?auto_758367 ) ) ( not ( = ?auto_758362 ?auto_758368 ) ) ( not ( = ?auto_758362 ?auto_758369 ) ) ( not ( = ?auto_758362 ?auto_758370 ) ) ( not ( = ?auto_758363 ?auto_758364 ) ) ( not ( = ?auto_758363 ?auto_758365 ) ) ( not ( = ?auto_758363 ?auto_758366 ) ) ( not ( = ?auto_758363 ?auto_758367 ) ) ( not ( = ?auto_758363 ?auto_758368 ) ) ( not ( = ?auto_758363 ?auto_758369 ) ) ( not ( = ?auto_758363 ?auto_758370 ) ) ( not ( = ?auto_758364 ?auto_758365 ) ) ( not ( = ?auto_758364 ?auto_758366 ) ) ( not ( = ?auto_758364 ?auto_758367 ) ) ( not ( = ?auto_758364 ?auto_758368 ) ) ( not ( = ?auto_758364 ?auto_758369 ) ) ( not ( = ?auto_758364 ?auto_758370 ) ) ( not ( = ?auto_758365 ?auto_758366 ) ) ( not ( = ?auto_758365 ?auto_758367 ) ) ( not ( = ?auto_758365 ?auto_758368 ) ) ( not ( = ?auto_758365 ?auto_758369 ) ) ( not ( = ?auto_758365 ?auto_758370 ) ) ( not ( = ?auto_758366 ?auto_758367 ) ) ( not ( = ?auto_758366 ?auto_758368 ) ) ( not ( = ?auto_758366 ?auto_758369 ) ) ( not ( = ?auto_758366 ?auto_758370 ) ) ( not ( = ?auto_758367 ?auto_758368 ) ) ( not ( = ?auto_758367 ?auto_758369 ) ) ( not ( = ?auto_758367 ?auto_758370 ) ) ( not ( = ?auto_758368 ?auto_758369 ) ) ( not ( = ?auto_758368 ?auto_758370 ) ) ( not ( = ?auto_758369 ?auto_758370 ) ) ( ON ?auto_758368 ?auto_758369 ) ( ON ?auto_758367 ?auto_758368 ) ( ON ?auto_758366 ?auto_758367 ) ( ON ?auto_758365 ?auto_758366 ) ( CLEAR ?auto_758363 ) ( ON ?auto_758364 ?auto_758365 ) ( CLEAR ?auto_758364 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_758361 ?auto_758362 ?auto_758363 ?auto_758364 )
      ( MAKE-9PILE ?auto_758361 ?auto_758362 ?auto_758363 ?auto_758364 ?auto_758365 ?auto_758366 ?auto_758367 ?auto_758368 ?auto_758369 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_758399 - BLOCK
      ?auto_758400 - BLOCK
      ?auto_758401 - BLOCK
      ?auto_758402 - BLOCK
      ?auto_758403 - BLOCK
      ?auto_758404 - BLOCK
      ?auto_758405 - BLOCK
      ?auto_758406 - BLOCK
      ?auto_758407 - BLOCK
    )
    :vars
    (
      ?auto_758408 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_758407 ?auto_758408 ) ( ON-TABLE ?auto_758399 ) ( ON ?auto_758400 ?auto_758399 ) ( not ( = ?auto_758399 ?auto_758400 ) ) ( not ( = ?auto_758399 ?auto_758401 ) ) ( not ( = ?auto_758399 ?auto_758402 ) ) ( not ( = ?auto_758399 ?auto_758403 ) ) ( not ( = ?auto_758399 ?auto_758404 ) ) ( not ( = ?auto_758399 ?auto_758405 ) ) ( not ( = ?auto_758399 ?auto_758406 ) ) ( not ( = ?auto_758399 ?auto_758407 ) ) ( not ( = ?auto_758399 ?auto_758408 ) ) ( not ( = ?auto_758400 ?auto_758401 ) ) ( not ( = ?auto_758400 ?auto_758402 ) ) ( not ( = ?auto_758400 ?auto_758403 ) ) ( not ( = ?auto_758400 ?auto_758404 ) ) ( not ( = ?auto_758400 ?auto_758405 ) ) ( not ( = ?auto_758400 ?auto_758406 ) ) ( not ( = ?auto_758400 ?auto_758407 ) ) ( not ( = ?auto_758400 ?auto_758408 ) ) ( not ( = ?auto_758401 ?auto_758402 ) ) ( not ( = ?auto_758401 ?auto_758403 ) ) ( not ( = ?auto_758401 ?auto_758404 ) ) ( not ( = ?auto_758401 ?auto_758405 ) ) ( not ( = ?auto_758401 ?auto_758406 ) ) ( not ( = ?auto_758401 ?auto_758407 ) ) ( not ( = ?auto_758401 ?auto_758408 ) ) ( not ( = ?auto_758402 ?auto_758403 ) ) ( not ( = ?auto_758402 ?auto_758404 ) ) ( not ( = ?auto_758402 ?auto_758405 ) ) ( not ( = ?auto_758402 ?auto_758406 ) ) ( not ( = ?auto_758402 ?auto_758407 ) ) ( not ( = ?auto_758402 ?auto_758408 ) ) ( not ( = ?auto_758403 ?auto_758404 ) ) ( not ( = ?auto_758403 ?auto_758405 ) ) ( not ( = ?auto_758403 ?auto_758406 ) ) ( not ( = ?auto_758403 ?auto_758407 ) ) ( not ( = ?auto_758403 ?auto_758408 ) ) ( not ( = ?auto_758404 ?auto_758405 ) ) ( not ( = ?auto_758404 ?auto_758406 ) ) ( not ( = ?auto_758404 ?auto_758407 ) ) ( not ( = ?auto_758404 ?auto_758408 ) ) ( not ( = ?auto_758405 ?auto_758406 ) ) ( not ( = ?auto_758405 ?auto_758407 ) ) ( not ( = ?auto_758405 ?auto_758408 ) ) ( not ( = ?auto_758406 ?auto_758407 ) ) ( not ( = ?auto_758406 ?auto_758408 ) ) ( not ( = ?auto_758407 ?auto_758408 ) ) ( ON ?auto_758406 ?auto_758407 ) ( ON ?auto_758405 ?auto_758406 ) ( ON ?auto_758404 ?auto_758405 ) ( ON ?auto_758403 ?auto_758404 ) ( ON ?auto_758402 ?auto_758403 ) ( CLEAR ?auto_758400 ) ( ON ?auto_758401 ?auto_758402 ) ( CLEAR ?auto_758401 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_758399 ?auto_758400 ?auto_758401 )
      ( MAKE-9PILE ?auto_758399 ?auto_758400 ?auto_758401 ?auto_758402 ?auto_758403 ?auto_758404 ?auto_758405 ?auto_758406 ?auto_758407 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_758437 - BLOCK
      ?auto_758438 - BLOCK
      ?auto_758439 - BLOCK
      ?auto_758440 - BLOCK
      ?auto_758441 - BLOCK
      ?auto_758442 - BLOCK
      ?auto_758443 - BLOCK
      ?auto_758444 - BLOCK
      ?auto_758445 - BLOCK
    )
    :vars
    (
      ?auto_758446 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_758445 ?auto_758446 ) ( ON-TABLE ?auto_758437 ) ( not ( = ?auto_758437 ?auto_758438 ) ) ( not ( = ?auto_758437 ?auto_758439 ) ) ( not ( = ?auto_758437 ?auto_758440 ) ) ( not ( = ?auto_758437 ?auto_758441 ) ) ( not ( = ?auto_758437 ?auto_758442 ) ) ( not ( = ?auto_758437 ?auto_758443 ) ) ( not ( = ?auto_758437 ?auto_758444 ) ) ( not ( = ?auto_758437 ?auto_758445 ) ) ( not ( = ?auto_758437 ?auto_758446 ) ) ( not ( = ?auto_758438 ?auto_758439 ) ) ( not ( = ?auto_758438 ?auto_758440 ) ) ( not ( = ?auto_758438 ?auto_758441 ) ) ( not ( = ?auto_758438 ?auto_758442 ) ) ( not ( = ?auto_758438 ?auto_758443 ) ) ( not ( = ?auto_758438 ?auto_758444 ) ) ( not ( = ?auto_758438 ?auto_758445 ) ) ( not ( = ?auto_758438 ?auto_758446 ) ) ( not ( = ?auto_758439 ?auto_758440 ) ) ( not ( = ?auto_758439 ?auto_758441 ) ) ( not ( = ?auto_758439 ?auto_758442 ) ) ( not ( = ?auto_758439 ?auto_758443 ) ) ( not ( = ?auto_758439 ?auto_758444 ) ) ( not ( = ?auto_758439 ?auto_758445 ) ) ( not ( = ?auto_758439 ?auto_758446 ) ) ( not ( = ?auto_758440 ?auto_758441 ) ) ( not ( = ?auto_758440 ?auto_758442 ) ) ( not ( = ?auto_758440 ?auto_758443 ) ) ( not ( = ?auto_758440 ?auto_758444 ) ) ( not ( = ?auto_758440 ?auto_758445 ) ) ( not ( = ?auto_758440 ?auto_758446 ) ) ( not ( = ?auto_758441 ?auto_758442 ) ) ( not ( = ?auto_758441 ?auto_758443 ) ) ( not ( = ?auto_758441 ?auto_758444 ) ) ( not ( = ?auto_758441 ?auto_758445 ) ) ( not ( = ?auto_758441 ?auto_758446 ) ) ( not ( = ?auto_758442 ?auto_758443 ) ) ( not ( = ?auto_758442 ?auto_758444 ) ) ( not ( = ?auto_758442 ?auto_758445 ) ) ( not ( = ?auto_758442 ?auto_758446 ) ) ( not ( = ?auto_758443 ?auto_758444 ) ) ( not ( = ?auto_758443 ?auto_758445 ) ) ( not ( = ?auto_758443 ?auto_758446 ) ) ( not ( = ?auto_758444 ?auto_758445 ) ) ( not ( = ?auto_758444 ?auto_758446 ) ) ( not ( = ?auto_758445 ?auto_758446 ) ) ( ON ?auto_758444 ?auto_758445 ) ( ON ?auto_758443 ?auto_758444 ) ( ON ?auto_758442 ?auto_758443 ) ( ON ?auto_758441 ?auto_758442 ) ( ON ?auto_758440 ?auto_758441 ) ( ON ?auto_758439 ?auto_758440 ) ( CLEAR ?auto_758437 ) ( ON ?auto_758438 ?auto_758439 ) ( CLEAR ?auto_758438 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_758437 ?auto_758438 )
      ( MAKE-9PILE ?auto_758437 ?auto_758438 ?auto_758439 ?auto_758440 ?auto_758441 ?auto_758442 ?auto_758443 ?auto_758444 ?auto_758445 ) )
  )

  ( :method MAKE-9PILE
    :parameters
    (
      ?auto_758475 - BLOCK
      ?auto_758476 - BLOCK
      ?auto_758477 - BLOCK
      ?auto_758478 - BLOCK
      ?auto_758479 - BLOCK
      ?auto_758480 - BLOCK
      ?auto_758481 - BLOCK
      ?auto_758482 - BLOCK
      ?auto_758483 - BLOCK
    )
    :vars
    (
      ?auto_758484 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_758483 ?auto_758484 ) ( not ( = ?auto_758475 ?auto_758476 ) ) ( not ( = ?auto_758475 ?auto_758477 ) ) ( not ( = ?auto_758475 ?auto_758478 ) ) ( not ( = ?auto_758475 ?auto_758479 ) ) ( not ( = ?auto_758475 ?auto_758480 ) ) ( not ( = ?auto_758475 ?auto_758481 ) ) ( not ( = ?auto_758475 ?auto_758482 ) ) ( not ( = ?auto_758475 ?auto_758483 ) ) ( not ( = ?auto_758475 ?auto_758484 ) ) ( not ( = ?auto_758476 ?auto_758477 ) ) ( not ( = ?auto_758476 ?auto_758478 ) ) ( not ( = ?auto_758476 ?auto_758479 ) ) ( not ( = ?auto_758476 ?auto_758480 ) ) ( not ( = ?auto_758476 ?auto_758481 ) ) ( not ( = ?auto_758476 ?auto_758482 ) ) ( not ( = ?auto_758476 ?auto_758483 ) ) ( not ( = ?auto_758476 ?auto_758484 ) ) ( not ( = ?auto_758477 ?auto_758478 ) ) ( not ( = ?auto_758477 ?auto_758479 ) ) ( not ( = ?auto_758477 ?auto_758480 ) ) ( not ( = ?auto_758477 ?auto_758481 ) ) ( not ( = ?auto_758477 ?auto_758482 ) ) ( not ( = ?auto_758477 ?auto_758483 ) ) ( not ( = ?auto_758477 ?auto_758484 ) ) ( not ( = ?auto_758478 ?auto_758479 ) ) ( not ( = ?auto_758478 ?auto_758480 ) ) ( not ( = ?auto_758478 ?auto_758481 ) ) ( not ( = ?auto_758478 ?auto_758482 ) ) ( not ( = ?auto_758478 ?auto_758483 ) ) ( not ( = ?auto_758478 ?auto_758484 ) ) ( not ( = ?auto_758479 ?auto_758480 ) ) ( not ( = ?auto_758479 ?auto_758481 ) ) ( not ( = ?auto_758479 ?auto_758482 ) ) ( not ( = ?auto_758479 ?auto_758483 ) ) ( not ( = ?auto_758479 ?auto_758484 ) ) ( not ( = ?auto_758480 ?auto_758481 ) ) ( not ( = ?auto_758480 ?auto_758482 ) ) ( not ( = ?auto_758480 ?auto_758483 ) ) ( not ( = ?auto_758480 ?auto_758484 ) ) ( not ( = ?auto_758481 ?auto_758482 ) ) ( not ( = ?auto_758481 ?auto_758483 ) ) ( not ( = ?auto_758481 ?auto_758484 ) ) ( not ( = ?auto_758482 ?auto_758483 ) ) ( not ( = ?auto_758482 ?auto_758484 ) ) ( not ( = ?auto_758483 ?auto_758484 ) ) ( ON ?auto_758482 ?auto_758483 ) ( ON ?auto_758481 ?auto_758482 ) ( ON ?auto_758480 ?auto_758481 ) ( ON ?auto_758479 ?auto_758480 ) ( ON ?auto_758478 ?auto_758479 ) ( ON ?auto_758477 ?auto_758478 ) ( ON ?auto_758476 ?auto_758477 ) ( ON ?auto_758475 ?auto_758476 ) ( CLEAR ?auto_758475 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_758475 )
      ( MAKE-9PILE ?auto_758475 ?auto_758476 ?auto_758477 ?auto_758478 ?auto_758479 ?auto_758480 ?auto_758481 ?auto_758482 ?auto_758483 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_758514 - BLOCK
      ?auto_758515 - BLOCK
      ?auto_758516 - BLOCK
      ?auto_758517 - BLOCK
      ?auto_758518 - BLOCK
      ?auto_758519 - BLOCK
      ?auto_758520 - BLOCK
      ?auto_758521 - BLOCK
      ?auto_758522 - BLOCK
      ?auto_758523 - BLOCK
    )
    :vars
    (
      ?auto_758524 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_758522 ) ( ON ?auto_758523 ?auto_758524 ) ( CLEAR ?auto_758523 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_758514 ) ( ON ?auto_758515 ?auto_758514 ) ( ON ?auto_758516 ?auto_758515 ) ( ON ?auto_758517 ?auto_758516 ) ( ON ?auto_758518 ?auto_758517 ) ( ON ?auto_758519 ?auto_758518 ) ( ON ?auto_758520 ?auto_758519 ) ( ON ?auto_758521 ?auto_758520 ) ( ON ?auto_758522 ?auto_758521 ) ( not ( = ?auto_758514 ?auto_758515 ) ) ( not ( = ?auto_758514 ?auto_758516 ) ) ( not ( = ?auto_758514 ?auto_758517 ) ) ( not ( = ?auto_758514 ?auto_758518 ) ) ( not ( = ?auto_758514 ?auto_758519 ) ) ( not ( = ?auto_758514 ?auto_758520 ) ) ( not ( = ?auto_758514 ?auto_758521 ) ) ( not ( = ?auto_758514 ?auto_758522 ) ) ( not ( = ?auto_758514 ?auto_758523 ) ) ( not ( = ?auto_758514 ?auto_758524 ) ) ( not ( = ?auto_758515 ?auto_758516 ) ) ( not ( = ?auto_758515 ?auto_758517 ) ) ( not ( = ?auto_758515 ?auto_758518 ) ) ( not ( = ?auto_758515 ?auto_758519 ) ) ( not ( = ?auto_758515 ?auto_758520 ) ) ( not ( = ?auto_758515 ?auto_758521 ) ) ( not ( = ?auto_758515 ?auto_758522 ) ) ( not ( = ?auto_758515 ?auto_758523 ) ) ( not ( = ?auto_758515 ?auto_758524 ) ) ( not ( = ?auto_758516 ?auto_758517 ) ) ( not ( = ?auto_758516 ?auto_758518 ) ) ( not ( = ?auto_758516 ?auto_758519 ) ) ( not ( = ?auto_758516 ?auto_758520 ) ) ( not ( = ?auto_758516 ?auto_758521 ) ) ( not ( = ?auto_758516 ?auto_758522 ) ) ( not ( = ?auto_758516 ?auto_758523 ) ) ( not ( = ?auto_758516 ?auto_758524 ) ) ( not ( = ?auto_758517 ?auto_758518 ) ) ( not ( = ?auto_758517 ?auto_758519 ) ) ( not ( = ?auto_758517 ?auto_758520 ) ) ( not ( = ?auto_758517 ?auto_758521 ) ) ( not ( = ?auto_758517 ?auto_758522 ) ) ( not ( = ?auto_758517 ?auto_758523 ) ) ( not ( = ?auto_758517 ?auto_758524 ) ) ( not ( = ?auto_758518 ?auto_758519 ) ) ( not ( = ?auto_758518 ?auto_758520 ) ) ( not ( = ?auto_758518 ?auto_758521 ) ) ( not ( = ?auto_758518 ?auto_758522 ) ) ( not ( = ?auto_758518 ?auto_758523 ) ) ( not ( = ?auto_758518 ?auto_758524 ) ) ( not ( = ?auto_758519 ?auto_758520 ) ) ( not ( = ?auto_758519 ?auto_758521 ) ) ( not ( = ?auto_758519 ?auto_758522 ) ) ( not ( = ?auto_758519 ?auto_758523 ) ) ( not ( = ?auto_758519 ?auto_758524 ) ) ( not ( = ?auto_758520 ?auto_758521 ) ) ( not ( = ?auto_758520 ?auto_758522 ) ) ( not ( = ?auto_758520 ?auto_758523 ) ) ( not ( = ?auto_758520 ?auto_758524 ) ) ( not ( = ?auto_758521 ?auto_758522 ) ) ( not ( = ?auto_758521 ?auto_758523 ) ) ( not ( = ?auto_758521 ?auto_758524 ) ) ( not ( = ?auto_758522 ?auto_758523 ) ) ( not ( = ?auto_758522 ?auto_758524 ) ) ( not ( = ?auto_758523 ?auto_758524 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_758523 ?auto_758524 )
      ( !STACK ?auto_758523 ?auto_758522 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_758556 - BLOCK
      ?auto_758557 - BLOCK
      ?auto_758558 - BLOCK
      ?auto_758559 - BLOCK
      ?auto_758560 - BLOCK
      ?auto_758561 - BLOCK
      ?auto_758562 - BLOCK
      ?auto_758563 - BLOCK
      ?auto_758564 - BLOCK
      ?auto_758565 - BLOCK
    )
    :vars
    (
      ?auto_758566 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_758565 ?auto_758566 ) ( ON-TABLE ?auto_758556 ) ( ON ?auto_758557 ?auto_758556 ) ( ON ?auto_758558 ?auto_758557 ) ( ON ?auto_758559 ?auto_758558 ) ( ON ?auto_758560 ?auto_758559 ) ( ON ?auto_758561 ?auto_758560 ) ( ON ?auto_758562 ?auto_758561 ) ( ON ?auto_758563 ?auto_758562 ) ( not ( = ?auto_758556 ?auto_758557 ) ) ( not ( = ?auto_758556 ?auto_758558 ) ) ( not ( = ?auto_758556 ?auto_758559 ) ) ( not ( = ?auto_758556 ?auto_758560 ) ) ( not ( = ?auto_758556 ?auto_758561 ) ) ( not ( = ?auto_758556 ?auto_758562 ) ) ( not ( = ?auto_758556 ?auto_758563 ) ) ( not ( = ?auto_758556 ?auto_758564 ) ) ( not ( = ?auto_758556 ?auto_758565 ) ) ( not ( = ?auto_758556 ?auto_758566 ) ) ( not ( = ?auto_758557 ?auto_758558 ) ) ( not ( = ?auto_758557 ?auto_758559 ) ) ( not ( = ?auto_758557 ?auto_758560 ) ) ( not ( = ?auto_758557 ?auto_758561 ) ) ( not ( = ?auto_758557 ?auto_758562 ) ) ( not ( = ?auto_758557 ?auto_758563 ) ) ( not ( = ?auto_758557 ?auto_758564 ) ) ( not ( = ?auto_758557 ?auto_758565 ) ) ( not ( = ?auto_758557 ?auto_758566 ) ) ( not ( = ?auto_758558 ?auto_758559 ) ) ( not ( = ?auto_758558 ?auto_758560 ) ) ( not ( = ?auto_758558 ?auto_758561 ) ) ( not ( = ?auto_758558 ?auto_758562 ) ) ( not ( = ?auto_758558 ?auto_758563 ) ) ( not ( = ?auto_758558 ?auto_758564 ) ) ( not ( = ?auto_758558 ?auto_758565 ) ) ( not ( = ?auto_758558 ?auto_758566 ) ) ( not ( = ?auto_758559 ?auto_758560 ) ) ( not ( = ?auto_758559 ?auto_758561 ) ) ( not ( = ?auto_758559 ?auto_758562 ) ) ( not ( = ?auto_758559 ?auto_758563 ) ) ( not ( = ?auto_758559 ?auto_758564 ) ) ( not ( = ?auto_758559 ?auto_758565 ) ) ( not ( = ?auto_758559 ?auto_758566 ) ) ( not ( = ?auto_758560 ?auto_758561 ) ) ( not ( = ?auto_758560 ?auto_758562 ) ) ( not ( = ?auto_758560 ?auto_758563 ) ) ( not ( = ?auto_758560 ?auto_758564 ) ) ( not ( = ?auto_758560 ?auto_758565 ) ) ( not ( = ?auto_758560 ?auto_758566 ) ) ( not ( = ?auto_758561 ?auto_758562 ) ) ( not ( = ?auto_758561 ?auto_758563 ) ) ( not ( = ?auto_758561 ?auto_758564 ) ) ( not ( = ?auto_758561 ?auto_758565 ) ) ( not ( = ?auto_758561 ?auto_758566 ) ) ( not ( = ?auto_758562 ?auto_758563 ) ) ( not ( = ?auto_758562 ?auto_758564 ) ) ( not ( = ?auto_758562 ?auto_758565 ) ) ( not ( = ?auto_758562 ?auto_758566 ) ) ( not ( = ?auto_758563 ?auto_758564 ) ) ( not ( = ?auto_758563 ?auto_758565 ) ) ( not ( = ?auto_758563 ?auto_758566 ) ) ( not ( = ?auto_758564 ?auto_758565 ) ) ( not ( = ?auto_758564 ?auto_758566 ) ) ( not ( = ?auto_758565 ?auto_758566 ) ) ( CLEAR ?auto_758563 ) ( ON ?auto_758564 ?auto_758565 ) ( CLEAR ?auto_758564 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_758556 ?auto_758557 ?auto_758558 ?auto_758559 ?auto_758560 ?auto_758561 ?auto_758562 ?auto_758563 ?auto_758564 )
      ( MAKE-10PILE ?auto_758556 ?auto_758557 ?auto_758558 ?auto_758559 ?auto_758560 ?auto_758561 ?auto_758562 ?auto_758563 ?auto_758564 ?auto_758565 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_758598 - BLOCK
      ?auto_758599 - BLOCK
      ?auto_758600 - BLOCK
      ?auto_758601 - BLOCK
      ?auto_758602 - BLOCK
      ?auto_758603 - BLOCK
      ?auto_758604 - BLOCK
      ?auto_758605 - BLOCK
      ?auto_758606 - BLOCK
      ?auto_758607 - BLOCK
    )
    :vars
    (
      ?auto_758608 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_758607 ?auto_758608 ) ( ON-TABLE ?auto_758598 ) ( ON ?auto_758599 ?auto_758598 ) ( ON ?auto_758600 ?auto_758599 ) ( ON ?auto_758601 ?auto_758600 ) ( ON ?auto_758602 ?auto_758601 ) ( ON ?auto_758603 ?auto_758602 ) ( ON ?auto_758604 ?auto_758603 ) ( not ( = ?auto_758598 ?auto_758599 ) ) ( not ( = ?auto_758598 ?auto_758600 ) ) ( not ( = ?auto_758598 ?auto_758601 ) ) ( not ( = ?auto_758598 ?auto_758602 ) ) ( not ( = ?auto_758598 ?auto_758603 ) ) ( not ( = ?auto_758598 ?auto_758604 ) ) ( not ( = ?auto_758598 ?auto_758605 ) ) ( not ( = ?auto_758598 ?auto_758606 ) ) ( not ( = ?auto_758598 ?auto_758607 ) ) ( not ( = ?auto_758598 ?auto_758608 ) ) ( not ( = ?auto_758599 ?auto_758600 ) ) ( not ( = ?auto_758599 ?auto_758601 ) ) ( not ( = ?auto_758599 ?auto_758602 ) ) ( not ( = ?auto_758599 ?auto_758603 ) ) ( not ( = ?auto_758599 ?auto_758604 ) ) ( not ( = ?auto_758599 ?auto_758605 ) ) ( not ( = ?auto_758599 ?auto_758606 ) ) ( not ( = ?auto_758599 ?auto_758607 ) ) ( not ( = ?auto_758599 ?auto_758608 ) ) ( not ( = ?auto_758600 ?auto_758601 ) ) ( not ( = ?auto_758600 ?auto_758602 ) ) ( not ( = ?auto_758600 ?auto_758603 ) ) ( not ( = ?auto_758600 ?auto_758604 ) ) ( not ( = ?auto_758600 ?auto_758605 ) ) ( not ( = ?auto_758600 ?auto_758606 ) ) ( not ( = ?auto_758600 ?auto_758607 ) ) ( not ( = ?auto_758600 ?auto_758608 ) ) ( not ( = ?auto_758601 ?auto_758602 ) ) ( not ( = ?auto_758601 ?auto_758603 ) ) ( not ( = ?auto_758601 ?auto_758604 ) ) ( not ( = ?auto_758601 ?auto_758605 ) ) ( not ( = ?auto_758601 ?auto_758606 ) ) ( not ( = ?auto_758601 ?auto_758607 ) ) ( not ( = ?auto_758601 ?auto_758608 ) ) ( not ( = ?auto_758602 ?auto_758603 ) ) ( not ( = ?auto_758602 ?auto_758604 ) ) ( not ( = ?auto_758602 ?auto_758605 ) ) ( not ( = ?auto_758602 ?auto_758606 ) ) ( not ( = ?auto_758602 ?auto_758607 ) ) ( not ( = ?auto_758602 ?auto_758608 ) ) ( not ( = ?auto_758603 ?auto_758604 ) ) ( not ( = ?auto_758603 ?auto_758605 ) ) ( not ( = ?auto_758603 ?auto_758606 ) ) ( not ( = ?auto_758603 ?auto_758607 ) ) ( not ( = ?auto_758603 ?auto_758608 ) ) ( not ( = ?auto_758604 ?auto_758605 ) ) ( not ( = ?auto_758604 ?auto_758606 ) ) ( not ( = ?auto_758604 ?auto_758607 ) ) ( not ( = ?auto_758604 ?auto_758608 ) ) ( not ( = ?auto_758605 ?auto_758606 ) ) ( not ( = ?auto_758605 ?auto_758607 ) ) ( not ( = ?auto_758605 ?auto_758608 ) ) ( not ( = ?auto_758606 ?auto_758607 ) ) ( not ( = ?auto_758606 ?auto_758608 ) ) ( not ( = ?auto_758607 ?auto_758608 ) ) ( ON ?auto_758606 ?auto_758607 ) ( CLEAR ?auto_758604 ) ( ON ?auto_758605 ?auto_758606 ) ( CLEAR ?auto_758605 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_758598 ?auto_758599 ?auto_758600 ?auto_758601 ?auto_758602 ?auto_758603 ?auto_758604 ?auto_758605 )
      ( MAKE-10PILE ?auto_758598 ?auto_758599 ?auto_758600 ?auto_758601 ?auto_758602 ?auto_758603 ?auto_758604 ?auto_758605 ?auto_758606 ?auto_758607 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_758640 - BLOCK
      ?auto_758641 - BLOCK
      ?auto_758642 - BLOCK
      ?auto_758643 - BLOCK
      ?auto_758644 - BLOCK
      ?auto_758645 - BLOCK
      ?auto_758646 - BLOCK
      ?auto_758647 - BLOCK
      ?auto_758648 - BLOCK
      ?auto_758649 - BLOCK
    )
    :vars
    (
      ?auto_758650 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_758649 ?auto_758650 ) ( ON-TABLE ?auto_758640 ) ( ON ?auto_758641 ?auto_758640 ) ( ON ?auto_758642 ?auto_758641 ) ( ON ?auto_758643 ?auto_758642 ) ( ON ?auto_758644 ?auto_758643 ) ( ON ?auto_758645 ?auto_758644 ) ( not ( = ?auto_758640 ?auto_758641 ) ) ( not ( = ?auto_758640 ?auto_758642 ) ) ( not ( = ?auto_758640 ?auto_758643 ) ) ( not ( = ?auto_758640 ?auto_758644 ) ) ( not ( = ?auto_758640 ?auto_758645 ) ) ( not ( = ?auto_758640 ?auto_758646 ) ) ( not ( = ?auto_758640 ?auto_758647 ) ) ( not ( = ?auto_758640 ?auto_758648 ) ) ( not ( = ?auto_758640 ?auto_758649 ) ) ( not ( = ?auto_758640 ?auto_758650 ) ) ( not ( = ?auto_758641 ?auto_758642 ) ) ( not ( = ?auto_758641 ?auto_758643 ) ) ( not ( = ?auto_758641 ?auto_758644 ) ) ( not ( = ?auto_758641 ?auto_758645 ) ) ( not ( = ?auto_758641 ?auto_758646 ) ) ( not ( = ?auto_758641 ?auto_758647 ) ) ( not ( = ?auto_758641 ?auto_758648 ) ) ( not ( = ?auto_758641 ?auto_758649 ) ) ( not ( = ?auto_758641 ?auto_758650 ) ) ( not ( = ?auto_758642 ?auto_758643 ) ) ( not ( = ?auto_758642 ?auto_758644 ) ) ( not ( = ?auto_758642 ?auto_758645 ) ) ( not ( = ?auto_758642 ?auto_758646 ) ) ( not ( = ?auto_758642 ?auto_758647 ) ) ( not ( = ?auto_758642 ?auto_758648 ) ) ( not ( = ?auto_758642 ?auto_758649 ) ) ( not ( = ?auto_758642 ?auto_758650 ) ) ( not ( = ?auto_758643 ?auto_758644 ) ) ( not ( = ?auto_758643 ?auto_758645 ) ) ( not ( = ?auto_758643 ?auto_758646 ) ) ( not ( = ?auto_758643 ?auto_758647 ) ) ( not ( = ?auto_758643 ?auto_758648 ) ) ( not ( = ?auto_758643 ?auto_758649 ) ) ( not ( = ?auto_758643 ?auto_758650 ) ) ( not ( = ?auto_758644 ?auto_758645 ) ) ( not ( = ?auto_758644 ?auto_758646 ) ) ( not ( = ?auto_758644 ?auto_758647 ) ) ( not ( = ?auto_758644 ?auto_758648 ) ) ( not ( = ?auto_758644 ?auto_758649 ) ) ( not ( = ?auto_758644 ?auto_758650 ) ) ( not ( = ?auto_758645 ?auto_758646 ) ) ( not ( = ?auto_758645 ?auto_758647 ) ) ( not ( = ?auto_758645 ?auto_758648 ) ) ( not ( = ?auto_758645 ?auto_758649 ) ) ( not ( = ?auto_758645 ?auto_758650 ) ) ( not ( = ?auto_758646 ?auto_758647 ) ) ( not ( = ?auto_758646 ?auto_758648 ) ) ( not ( = ?auto_758646 ?auto_758649 ) ) ( not ( = ?auto_758646 ?auto_758650 ) ) ( not ( = ?auto_758647 ?auto_758648 ) ) ( not ( = ?auto_758647 ?auto_758649 ) ) ( not ( = ?auto_758647 ?auto_758650 ) ) ( not ( = ?auto_758648 ?auto_758649 ) ) ( not ( = ?auto_758648 ?auto_758650 ) ) ( not ( = ?auto_758649 ?auto_758650 ) ) ( ON ?auto_758648 ?auto_758649 ) ( ON ?auto_758647 ?auto_758648 ) ( CLEAR ?auto_758645 ) ( ON ?auto_758646 ?auto_758647 ) ( CLEAR ?auto_758646 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_758640 ?auto_758641 ?auto_758642 ?auto_758643 ?auto_758644 ?auto_758645 ?auto_758646 )
      ( MAKE-10PILE ?auto_758640 ?auto_758641 ?auto_758642 ?auto_758643 ?auto_758644 ?auto_758645 ?auto_758646 ?auto_758647 ?auto_758648 ?auto_758649 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_758682 - BLOCK
      ?auto_758683 - BLOCK
      ?auto_758684 - BLOCK
      ?auto_758685 - BLOCK
      ?auto_758686 - BLOCK
      ?auto_758687 - BLOCK
      ?auto_758688 - BLOCK
      ?auto_758689 - BLOCK
      ?auto_758690 - BLOCK
      ?auto_758691 - BLOCK
    )
    :vars
    (
      ?auto_758692 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_758691 ?auto_758692 ) ( ON-TABLE ?auto_758682 ) ( ON ?auto_758683 ?auto_758682 ) ( ON ?auto_758684 ?auto_758683 ) ( ON ?auto_758685 ?auto_758684 ) ( ON ?auto_758686 ?auto_758685 ) ( not ( = ?auto_758682 ?auto_758683 ) ) ( not ( = ?auto_758682 ?auto_758684 ) ) ( not ( = ?auto_758682 ?auto_758685 ) ) ( not ( = ?auto_758682 ?auto_758686 ) ) ( not ( = ?auto_758682 ?auto_758687 ) ) ( not ( = ?auto_758682 ?auto_758688 ) ) ( not ( = ?auto_758682 ?auto_758689 ) ) ( not ( = ?auto_758682 ?auto_758690 ) ) ( not ( = ?auto_758682 ?auto_758691 ) ) ( not ( = ?auto_758682 ?auto_758692 ) ) ( not ( = ?auto_758683 ?auto_758684 ) ) ( not ( = ?auto_758683 ?auto_758685 ) ) ( not ( = ?auto_758683 ?auto_758686 ) ) ( not ( = ?auto_758683 ?auto_758687 ) ) ( not ( = ?auto_758683 ?auto_758688 ) ) ( not ( = ?auto_758683 ?auto_758689 ) ) ( not ( = ?auto_758683 ?auto_758690 ) ) ( not ( = ?auto_758683 ?auto_758691 ) ) ( not ( = ?auto_758683 ?auto_758692 ) ) ( not ( = ?auto_758684 ?auto_758685 ) ) ( not ( = ?auto_758684 ?auto_758686 ) ) ( not ( = ?auto_758684 ?auto_758687 ) ) ( not ( = ?auto_758684 ?auto_758688 ) ) ( not ( = ?auto_758684 ?auto_758689 ) ) ( not ( = ?auto_758684 ?auto_758690 ) ) ( not ( = ?auto_758684 ?auto_758691 ) ) ( not ( = ?auto_758684 ?auto_758692 ) ) ( not ( = ?auto_758685 ?auto_758686 ) ) ( not ( = ?auto_758685 ?auto_758687 ) ) ( not ( = ?auto_758685 ?auto_758688 ) ) ( not ( = ?auto_758685 ?auto_758689 ) ) ( not ( = ?auto_758685 ?auto_758690 ) ) ( not ( = ?auto_758685 ?auto_758691 ) ) ( not ( = ?auto_758685 ?auto_758692 ) ) ( not ( = ?auto_758686 ?auto_758687 ) ) ( not ( = ?auto_758686 ?auto_758688 ) ) ( not ( = ?auto_758686 ?auto_758689 ) ) ( not ( = ?auto_758686 ?auto_758690 ) ) ( not ( = ?auto_758686 ?auto_758691 ) ) ( not ( = ?auto_758686 ?auto_758692 ) ) ( not ( = ?auto_758687 ?auto_758688 ) ) ( not ( = ?auto_758687 ?auto_758689 ) ) ( not ( = ?auto_758687 ?auto_758690 ) ) ( not ( = ?auto_758687 ?auto_758691 ) ) ( not ( = ?auto_758687 ?auto_758692 ) ) ( not ( = ?auto_758688 ?auto_758689 ) ) ( not ( = ?auto_758688 ?auto_758690 ) ) ( not ( = ?auto_758688 ?auto_758691 ) ) ( not ( = ?auto_758688 ?auto_758692 ) ) ( not ( = ?auto_758689 ?auto_758690 ) ) ( not ( = ?auto_758689 ?auto_758691 ) ) ( not ( = ?auto_758689 ?auto_758692 ) ) ( not ( = ?auto_758690 ?auto_758691 ) ) ( not ( = ?auto_758690 ?auto_758692 ) ) ( not ( = ?auto_758691 ?auto_758692 ) ) ( ON ?auto_758690 ?auto_758691 ) ( ON ?auto_758689 ?auto_758690 ) ( ON ?auto_758688 ?auto_758689 ) ( CLEAR ?auto_758686 ) ( ON ?auto_758687 ?auto_758688 ) ( CLEAR ?auto_758687 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_758682 ?auto_758683 ?auto_758684 ?auto_758685 ?auto_758686 ?auto_758687 )
      ( MAKE-10PILE ?auto_758682 ?auto_758683 ?auto_758684 ?auto_758685 ?auto_758686 ?auto_758687 ?auto_758688 ?auto_758689 ?auto_758690 ?auto_758691 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_758724 - BLOCK
      ?auto_758725 - BLOCK
      ?auto_758726 - BLOCK
      ?auto_758727 - BLOCK
      ?auto_758728 - BLOCK
      ?auto_758729 - BLOCK
      ?auto_758730 - BLOCK
      ?auto_758731 - BLOCK
      ?auto_758732 - BLOCK
      ?auto_758733 - BLOCK
    )
    :vars
    (
      ?auto_758734 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_758733 ?auto_758734 ) ( ON-TABLE ?auto_758724 ) ( ON ?auto_758725 ?auto_758724 ) ( ON ?auto_758726 ?auto_758725 ) ( ON ?auto_758727 ?auto_758726 ) ( not ( = ?auto_758724 ?auto_758725 ) ) ( not ( = ?auto_758724 ?auto_758726 ) ) ( not ( = ?auto_758724 ?auto_758727 ) ) ( not ( = ?auto_758724 ?auto_758728 ) ) ( not ( = ?auto_758724 ?auto_758729 ) ) ( not ( = ?auto_758724 ?auto_758730 ) ) ( not ( = ?auto_758724 ?auto_758731 ) ) ( not ( = ?auto_758724 ?auto_758732 ) ) ( not ( = ?auto_758724 ?auto_758733 ) ) ( not ( = ?auto_758724 ?auto_758734 ) ) ( not ( = ?auto_758725 ?auto_758726 ) ) ( not ( = ?auto_758725 ?auto_758727 ) ) ( not ( = ?auto_758725 ?auto_758728 ) ) ( not ( = ?auto_758725 ?auto_758729 ) ) ( not ( = ?auto_758725 ?auto_758730 ) ) ( not ( = ?auto_758725 ?auto_758731 ) ) ( not ( = ?auto_758725 ?auto_758732 ) ) ( not ( = ?auto_758725 ?auto_758733 ) ) ( not ( = ?auto_758725 ?auto_758734 ) ) ( not ( = ?auto_758726 ?auto_758727 ) ) ( not ( = ?auto_758726 ?auto_758728 ) ) ( not ( = ?auto_758726 ?auto_758729 ) ) ( not ( = ?auto_758726 ?auto_758730 ) ) ( not ( = ?auto_758726 ?auto_758731 ) ) ( not ( = ?auto_758726 ?auto_758732 ) ) ( not ( = ?auto_758726 ?auto_758733 ) ) ( not ( = ?auto_758726 ?auto_758734 ) ) ( not ( = ?auto_758727 ?auto_758728 ) ) ( not ( = ?auto_758727 ?auto_758729 ) ) ( not ( = ?auto_758727 ?auto_758730 ) ) ( not ( = ?auto_758727 ?auto_758731 ) ) ( not ( = ?auto_758727 ?auto_758732 ) ) ( not ( = ?auto_758727 ?auto_758733 ) ) ( not ( = ?auto_758727 ?auto_758734 ) ) ( not ( = ?auto_758728 ?auto_758729 ) ) ( not ( = ?auto_758728 ?auto_758730 ) ) ( not ( = ?auto_758728 ?auto_758731 ) ) ( not ( = ?auto_758728 ?auto_758732 ) ) ( not ( = ?auto_758728 ?auto_758733 ) ) ( not ( = ?auto_758728 ?auto_758734 ) ) ( not ( = ?auto_758729 ?auto_758730 ) ) ( not ( = ?auto_758729 ?auto_758731 ) ) ( not ( = ?auto_758729 ?auto_758732 ) ) ( not ( = ?auto_758729 ?auto_758733 ) ) ( not ( = ?auto_758729 ?auto_758734 ) ) ( not ( = ?auto_758730 ?auto_758731 ) ) ( not ( = ?auto_758730 ?auto_758732 ) ) ( not ( = ?auto_758730 ?auto_758733 ) ) ( not ( = ?auto_758730 ?auto_758734 ) ) ( not ( = ?auto_758731 ?auto_758732 ) ) ( not ( = ?auto_758731 ?auto_758733 ) ) ( not ( = ?auto_758731 ?auto_758734 ) ) ( not ( = ?auto_758732 ?auto_758733 ) ) ( not ( = ?auto_758732 ?auto_758734 ) ) ( not ( = ?auto_758733 ?auto_758734 ) ) ( ON ?auto_758732 ?auto_758733 ) ( ON ?auto_758731 ?auto_758732 ) ( ON ?auto_758730 ?auto_758731 ) ( ON ?auto_758729 ?auto_758730 ) ( CLEAR ?auto_758727 ) ( ON ?auto_758728 ?auto_758729 ) ( CLEAR ?auto_758728 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_758724 ?auto_758725 ?auto_758726 ?auto_758727 ?auto_758728 )
      ( MAKE-10PILE ?auto_758724 ?auto_758725 ?auto_758726 ?auto_758727 ?auto_758728 ?auto_758729 ?auto_758730 ?auto_758731 ?auto_758732 ?auto_758733 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_758766 - BLOCK
      ?auto_758767 - BLOCK
      ?auto_758768 - BLOCK
      ?auto_758769 - BLOCK
      ?auto_758770 - BLOCK
      ?auto_758771 - BLOCK
      ?auto_758772 - BLOCK
      ?auto_758773 - BLOCK
      ?auto_758774 - BLOCK
      ?auto_758775 - BLOCK
    )
    :vars
    (
      ?auto_758776 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_758775 ?auto_758776 ) ( ON-TABLE ?auto_758766 ) ( ON ?auto_758767 ?auto_758766 ) ( ON ?auto_758768 ?auto_758767 ) ( not ( = ?auto_758766 ?auto_758767 ) ) ( not ( = ?auto_758766 ?auto_758768 ) ) ( not ( = ?auto_758766 ?auto_758769 ) ) ( not ( = ?auto_758766 ?auto_758770 ) ) ( not ( = ?auto_758766 ?auto_758771 ) ) ( not ( = ?auto_758766 ?auto_758772 ) ) ( not ( = ?auto_758766 ?auto_758773 ) ) ( not ( = ?auto_758766 ?auto_758774 ) ) ( not ( = ?auto_758766 ?auto_758775 ) ) ( not ( = ?auto_758766 ?auto_758776 ) ) ( not ( = ?auto_758767 ?auto_758768 ) ) ( not ( = ?auto_758767 ?auto_758769 ) ) ( not ( = ?auto_758767 ?auto_758770 ) ) ( not ( = ?auto_758767 ?auto_758771 ) ) ( not ( = ?auto_758767 ?auto_758772 ) ) ( not ( = ?auto_758767 ?auto_758773 ) ) ( not ( = ?auto_758767 ?auto_758774 ) ) ( not ( = ?auto_758767 ?auto_758775 ) ) ( not ( = ?auto_758767 ?auto_758776 ) ) ( not ( = ?auto_758768 ?auto_758769 ) ) ( not ( = ?auto_758768 ?auto_758770 ) ) ( not ( = ?auto_758768 ?auto_758771 ) ) ( not ( = ?auto_758768 ?auto_758772 ) ) ( not ( = ?auto_758768 ?auto_758773 ) ) ( not ( = ?auto_758768 ?auto_758774 ) ) ( not ( = ?auto_758768 ?auto_758775 ) ) ( not ( = ?auto_758768 ?auto_758776 ) ) ( not ( = ?auto_758769 ?auto_758770 ) ) ( not ( = ?auto_758769 ?auto_758771 ) ) ( not ( = ?auto_758769 ?auto_758772 ) ) ( not ( = ?auto_758769 ?auto_758773 ) ) ( not ( = ?auto_758769 ?auto_758774 ) ) ( not ( = ?auto_758769 ?auto_758775 ) ) ( not ( = ?auto_758769 ?auto_758776 ) ) ( not ( = ?auto_758770 ?auto_758771 ) ) ( not ( = ?auto_758770 ?auto_758772 ) ) ( not ( = ?auto_758770 ?auto_758773 ) ) ( not ( = ?auto_758770 ?auto_758774 ) ) ( not ( = ?auto_758770 ?auto_758775 ) ) ( not ( = ?auto_758770 ?auto_758776 ) ) ( not ( = ?auto_758771 ?auto_758772 ) ) ( not ( = ?auto_758771 ?auto_758773 ) ) ( not ( = ?auto_758771 ?auto_758774 ) ) ( not ( = ?auto_758771 ?auto_758775 ) ) ( not ( = ?auto_758771 ?auto_758776 ) ) ( not ( = ?auto_758772 ?auto_758773 ) ) ( not ( = ?auto_758772 ?auto_758774 ) ) ( not ( = ?auto_758772 ?auto_758775 ) ) ( not ( = ?auto_758772 ?auto_758776 ) ) ( not ( = ?auto_758773 ?auto_758774 ) ) ( not ( = ?auto_758773 ?auto_758775 ) ) ( not ( = ?auto_758773 ?auto_758776 ) ) ( not ( = ?auto_758774 ?auto_758775 ) ) ( not ( = ?auto_758774 ?auto_758776 ) ) ( not ( = ?auto_758775 ?auto_758776 ) ) ( ON ?auto_758774 ?auto_758775 ) ( ON ?auto_758773 ?auto_758774 ) ( ON ?auto_758772 ?auto_758773 ) ( ON ?auto_758771 ?auto_758772 ) ( ON ?auto_758770 ?auto_758771 ) ( CLEAR ?auto_758768 ) ( ON ?auto_758769 ?auto_758770 ) ( CLEAR ?auto_758769 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_758766 ?auto_758767 ?auto_758768 ?auto_758769 )
      ( MAKE-10PILE ?auto_758766 ?auto_758767 ?auto_758768 ?auto_758769 ?auto_758770 ?auto_758771 ?auto_758772 ?auto_758773 ?auto_758774 ?auto_758775 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_758808 - BLOCK
      ?auto_758809 - BLOCK
      ?auto_758810 - BLOCK
      ?auto_758811 - BLOCK
      ?auto_758812 - BLOCK
      ?auto_758813 - BLOCK
      ?auto_758814 - BLOCK
      ?auto_758815 - BLOCK
      ?auto_758816 - BLOCK
      ?auto_758817 - BLOCK
    )
    :vars
    (
      ?auto_758818 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_758817 ?auto_758818 ) ( ON-TABLE ?auto_758808 ) ( ON ?auto_758809 ?auto_758808 ) ( not ( = ?auto_758808 ?auto_758809 ) ) ( not ( = ?auto_758808 ?auto_758810 ) ) ( not ( = ?auto_758808 ?auto_758811 ) ) ( not ( = ?auto_758808 ?auto_758812 ) ) ( not ( = ?auto_758808 ?auto_758813 ) ) ( not ( = ?auto_758808 ?auto_758814 ) ) ( not ( = ?auto_758808 ?auto_758815 ) ) ( not ( = ?auto_758808 ?auto_758816 ) ) ( not ( = ?auto_758808 ?auto_758817 ) ) ( not ( = ?auto_758808 ?auto_758818 ) ) ( not ( = ?auto_758809 ?auto_758810 ) ) ( not ( = ?auto_758809 ?auto_758811 ) ) ( not ( = ?auto_758809 ?auto_758812 ) ) ( not ( = ?auto_758809 ?auto_758813 ) ) ( not ( = ?auto_758809 ?auto_758814 ) ) ( not ( = ?auto_758809 ?auto_758815 ) ) ( not ( = ?auto_758809 ?auto_758816 ) ) ( not ( = ?auto_758809 ?auto_758817 ) ) ( not ( = ?auto_758809 ?auto_758818 ) ) ( not ( = ?auto_758810 ?auto_758811 ) ) ( not ( = ?auto_758810 ?auto_758812 ) ) ( not ( = ?auto_758810 ?auto_758813 ) ) ( not ( = ?auto_758810 ?auto_758814 ) ) ( not ( = ?auto_758810 ?auto_758815 ) ) ( not ( = ?auto_758810 ?auto_758816 ) ) ( not ( = ?auto_758810 ?auto_758817 ) ) ( not ( = ?auto_758810 ?auto_758818 ) ) ( not ( = ?auto_758811 ?auto_758812 ) ) ( not ( = ?auto_758811 ?auto_758813 ) ) ( not ( = ?auto_758811 ?auto_758814 ) ) ( not ( = ?auto_758811 ?auto_758815 ) ) ( not ( = ?auto_758811 ?auto_758816 ) ) ( not ( = ?auto_758811 ?auto_758817 ) ) ( not ( = ?auto_758811 ?auto_758818 ) ) ( not ( = ?auto_758812 ?auto_758813 ) ) ( not ( = ?auto_758812 ?auto_758814 ) ) ( not ( = ?auto_758812 ?auto_758815 ) ) ( not ( = ?auto_758812 ?auto_758816 ) ) ( not ( = ?auto_758812 ?auto_758817 ) ) ( not ( = ?auto_758812 ?auto_758818 ) ) ( not ( = ?auto_758813 ?auto_758814 ) ) ( not ( = ?auto_758813 ?auto_758815 ) ) ( not ( = ?auto_758813 ?auto_758816 ) ) ( not ( = ?auto_758813 ?auto_758817 ) ) ( not ( = ?auto_758813 ?auto_758818 ) ) ( not ( = ?auto_758814 ?auto_758815 ) ) ( not ( = ?auto_758814 ?auto_758816 ) ) ( not ( = ?auto_758814 ?auto_758817 ) ) ( not ( = ?auto_758814 ?auto_758818 ) ) ( not ( = ?auto_758815 ?auto_758816 ) ) ( not ( = ?auto_758815 ?auto_758817 ) ) ( not ( = ?auto_758815 ?auto_758818 ) ) ( not ( = ?auto_758816 ?auto_758817 ) ) ( not ( = ?auto_758816 ?auto_758818 ) ) ( not ( = ?auto_758817 ?auto_758818 ) ) ( ON ?auto_758816 ?auto_758817 ) ( ON ?auto_758815 ?auto_758816 ) ( ON ?auto_758814 ?auto_758815 ) ( ON ?auto_758813 ?auto_758814 ) ( ON ?auto_758812 ?auto_758813 ) ( ON ?auto_758811 ?auto_758812 ) ( CLEAR ?auto_758809 ) ( ON ?auto_758810 ?auto_758811 ) ( CLEAR ?auto_758810 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_758808 ?auto_758809 ?auto_758810 )
      ( MAKE-10PILE ?auto_758808 ?auto_758809 ?auto_758810 ?auto_758811 ?auto_758812 ?auto_758813 ?auto_758814 ?auto_758815 ?auto_758816 ?auto_758817 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_758850 - BLOCK
      ?auto_758851 - BLOCK
      ?auto_758852 - BLOCK
      ?auto_758853 - BLOCK
      ?auto_758854 - BLOCK
      ?auto_758855 - BLOCK
      ?auto_758856 - BLOCK
      ?auto_758857 - BLOCK
      ?auto_758858 - BLOCK
      ?auto_758859 - BLOCK
    )
    :vars
    (
      ?auto_758860 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_758859 ?auto_758860 ) ( ON-TABLE ?auto_758850 ) ( not ( = ?auto_758850 ?auto_758851 ) ) ( not ( = ?auto_758850 ?auto_758852 ) ) ( not ( = ?auto_758850 ?auto_758853 ) ) ( not ( = ?auto_758850 ?auto_758854 ) ) ( not ( = ?auto_758850 ?auto_758855 ) ) ( not ( = ?auto_758850 ?auto_758856 ) ) ( not ( = ?auto_758850 ?auto_758857 ) ) ( not ( = ?auto_758850 ?auto_758858 ) ) ( not ( = ?auto_758850 ?auto_758859 ) ) ( not ( = ?auto_758850 ?auto_758860 ) ) ( not ( = ?auto_758851 ?auto_758852 ) ) ( not ( = ?auto_758851 ?auto_758853 ) ) ( not ( = ?auto_758851 ?auto_758854 ) ) ( not ( = ?auto_758851 ?auto_758855 ) ) ( not ( = ?auto_758851 ?auto_758856 ) ) ( not ( = ?auto_758851 ?auto_758857 ) ) ( not ( = ?auto_758851 ?auto_758858 ) ) ( not ( = ?auto_758851 ?auto_758859 ) ) ( not ( = ?auto_758851 ?auto_758860 ) ) ( not ( = ?auto_758852 ?auto_758853 ) ) ( not ( = ?auto_758852 ?auto_758854 ) ) ( not ( = ?auto_758852 ?auto_758855 ) ) ( not ( = ?auto_758852 ?auto_758856 ) ) ( not ( = ?auto_758852 ?auto_758857 ) ) ( not ( = ?auto_758852 ?auto_758858 ) ) ( not ( = ?auto_758852 ?auto_758859 ) ) ( not ( = ?auto_758852 ?auto_758860 ) ) ( not ( = ?auto_758853 ?auto_758854 ) ) ( not ( = ?auto_758853 ?auto_758855 ) ) ( not ( = ?auto_758853 ?auto_758856 ) ) ( not ( = ?auto_758853 ?auto_758857 ) ) ( not ( = ?auto_758853 ?auto_758858 ) ) ( not ( = ?auto_758853 ?auto_758859 ) ) ( not ( = ?auto_758853 ?auto_758860 ) ) ( not ( = ?auto_758854 ?auto_758855 ) ) ( not ( = ?auto_758854 ?auto_758856 ) ) ( not ( = ?auto_758854 ?auto_758857 ) ) ( not ( = ?auto_758854 ?auto_758858 ) ) ( not ( = ?auto_758854 ?auto_758859 ) ) ( not ( = ?auto_758854 ?auto_758860 ) ) ( not ( = ?auto_758855 ?auto_758856 ) ) ( not ( = ?auto_758855 ?auto_758857 ) ) ( not ( = ?auto_758855 ?auto_758858 ) ) ( not ( = ?auto_758855 ?auto_758859 ) ) ( not ( = ?auto_758855 ?auto_758860 ) ) ( not ( = ?auto_758856 ?auto_758857 ) ) ( not ( = ?auto_758856 ?auto_758858 ) ) ( not ( = ?auto_758856 ?auto_758859 ) ) ( not ( = ?auto_758856 ?auto_758860 ) ) ( not ( = ?auto_758857 ?auto_758858 ) ) ( not ( = ?auto_758857 ?auto_758859 ) ) ( not ( = ?auto_758857 ?auto_758860 ) ) ( not ( = ?auto_758858 ?auto_758859 ) ) ( not ( = ?auto_758858 ?auto_758860 ) ) ( not ( = ?auto_758859 ?auto_758860 ) ) ( ON ?auto_758858 ?auto_758859 ) ( ON ?auto_758857 ?auto_758858 ) ( ON ?auto_758856 ?auto_758857 ) ( ON ?auto_758855 ?auto_758856 ) ( ON ?auto_758854 ?auto_758855 ) ( ON ?auto_758853 ?auto_758854 ) ( ON ?auto_758852 ?auto_758853 ) ( CLEAR ?auto_758850 ) ( ON ?auto_758851 ?auto_758852 ) ( CLEAR ?auto_758851 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_758850 ?auto_758851 )
      ( MAKE-10PILE ?auto_758850 ?auto_758851 ?auto_758852 ?auto_758853 ?auto_758854 ?auto_758855 ?auto_758856 ?auto_758857 ?auto_758858 ?auto_758859 ) )
  )

  ( :method MAKE-10PILE
    :parameters
    (
      ?auto_758892 - BLOCK
      ?auto_758893 - BLOCK
      ?auto_758894 - BLOCK
      ?auto_758895 - BLOCK
      ?auto_758896 - BLOCK
      ?auto_758897 - BLOCK
      ?auto_758898 - BLOCK
      ?auto_758899 - BLOCK
      ?auto_758900 - BLOCK
      ?auto_758901 - BLOCK
    )
    :vars
    (
      ?auto_758902 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_758901 ?auto_758902 ) ( not ( = ?auto_758892 ?auto_758893 ) ) ( not ( = ?auto_758892 ?auto_758894 ) ) ( not ( = ?auto_758892 ?auto_758895 ) ) ( not ( = ?auto_758892 ?auto_758896 ) ) ( not ( = ?auto_758892 ?auto_758897 ) ) ( not ( = ?auto_758892 ?auto_758898 ) ) ( not ( = ?auto_758892 ?auto_758899 ) ) ( not ( = ?auto_758892 ?auto_758900 ) ) ( not ( = ?auto_758892 ?auto_758901 ) ) ( not ( = ?auto_758892 ?auto_758902 ) ) ( not ( = ?auto_758893 ?auto_758894 ) ) ( not ( = ?auto_758893 ?auto_758895 ) ) ( not ( = ?auto_758893 ?auto_758896 ) ) ( not ( = ?auto_758893 ?auto_758897 ) ) ( not ( = ?auto_758893 ?auto_758898 ) ) ( not ( = ?auto_758893 ?auto_758899 ) ) ( not ( = ?auto_758893 ?auto_758900 ) ) ( not ( = ?auto_758893 ?auto_758901 ) ) ( not ( = ?auto_758893 ?auto_758902 ) ) ( not ( = ?auto_758894 ?auto_758895 ) ) ( not ( = ?auto_758894 ?auto_758896 ) ) ( not ( = ?auto_758894 ?auto_758897 ) ) ( not ( = ?auto_758894 ?auto_758898 ) ) ( not ( = ?auto_758894 ?auto_758899 ) ) ( not ( = ?auto_758894 ?auto_758900 ) ) ( not ( = ?auto_758894 ?auto_758901 ) ) ( not ( = ?auto_758894 ?auto_758902 ) ) ( not ( = ?auto_758895 ?auto_758896 ) ) ( not ( = ?auto_758895 ?auto_758897 ) ) ( not ( = ?auto_758895 ?auto_758898 ) ) ( not ( = ?auto_758895 ?auto_758899 ) ) ( not ( = ?auto_758895 ?auto_758900 ) ) ( not ( = ?auto_758895 ?auto_758901 ) ) ( not ( = ?auto_758895 ?auto_758902 ) ) ( not ( = ?auto_758896 ?auto_758897 ) ) ( not ( = ?auto_758896 ?auto_758898 ) ) ( not ( = ?auto_758896 ?auto_758899 ) ) ( not ( = ?auto_758896 ?auto_758900 ) ) ( not ( = ?auto_758896 ?auto_758901 ) ) ( not ( = ?auto_758896 ?auto_758902 ) ) ( not ( = ?auto_758897 ?auto_758898 ) ) ( not ( = ?auto_758897 ?auto_758899 ) ) ( not ( = ?auto_758897 ?auto_758900 ) ) ( not ( = ?auto_758897 ?auto_758901 ) ) ( not ( = ?auto_758897 ?auto_758902 ) ) ( not ( = ?auto_758898 ?auto_758899 ) ) ( not ( = ?auto_758898 ?auto_758900 ) ) ( not ( = ?auto_758898 ?auto_758901 ) ) ( not ( = ?auto_758898 ?auto_758902 ) ) ( not ( = ?auto_758899 ?auto_758900 ) ) ( not ( = ?auto_758899 ?auto_758901 ) ) ( not ( = ?auto_758899 ?auto_758902 ) ) ( not ( = ?auto_758900 ?auto_758901 ) ) ( not ( = ?auto_758900 ?auto_758902 ) ) ( not ( = ?auto_758901 ?auto_758902 ) ) ( ON ?auto_758900 ?auto_758901 ) ( ON ?auto_758899 ?auto_758900 ) ( ON ?auto_758898 ?auto_758899 ) ( ON ?auto_758897 ?auto_758898 ) ( ON ?auto_758896 ?auto_758897 ) ( ON ?auto_758895 ?auto_758896 ) ( ON ?auto_758894 ?auto_758895 ) ( ON ?auto_758893 ?auto_758894 ) ( ON ?auto_758892 ?auto_758893 ) ( CLEAR ?auto_758892 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_758892 )
      ( MAKE-10PILE ?auto_758892 ?auto_758893 ?auto_758894 ?auto_758895 ?auto_758896 ?auto_758897 ?auto_758898 ?auto_758899 ?auto_758900 ?auto_758901 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_758935 - BLOCK
      ?auto_758936 - BLOCK
      ?auto_758937 - BLOCK
      ?auto_758938 - BLOCK
      ?auto_758939 - BLOCK
      ?auto_758940 - BLOCK
      ?auto_758941 - BLOCK
      ?auto_758942 - BLOCK
      ?auto_758943 - BLOCK
      ?auto_758944 - BLOCK
      ?auto_758945 - BLOCK
    )
    :vars
    (
      ?auto_758946 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_758944 ) ( ON ?auto_758945 ?auto_758946 ) ( CLEAR ?auto_758945 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_758935 ) ( ON ?auto_758936 ?auto_758935 ) ( ON ?auto_758937 ?auto_758936 ) ( ON ?auto_758938 ?auto_758937 ) ( ON ?auto_758939 ?auto_758938 ) ( ON ?auto_758940 ?auto_758939 ) ( ON ?auto_758941 ?auto_758940 ) ( ON ?auto_758942 ?auto_758941 ) ( ON ?auto_758943 ?auto_758942 ) ( ON ?auto_758944 ?auto_758943 ) ( not ( = ?auto_758935 ?auto_758936 ) ) ( not ( = ?auto_758935 ?auto_758937 ) ) ( not ( = ?auto_758935 ?auto_758938 ) ) ( not ( = ?auto_758935 ?auto_758939 ) ) ( not ( = ?auto_758935 ?auto_758940 ) ) ( not ( = ?auto_758935 ?auto_758941 ) ) ( not ( = ?auto_758935 ?auto_758942 ) ) ( not ( = ?auto_758935 ?auto_758943 ) ) ( not ( = ?auto_758935 ?auto_758944 ) ) ( not ( = ?auto_758935 ?auto_758945 ) ) ( not ( = ?auto_758935 ?auto_758946 ) ) ( not ( = ?auto_758936 ?auto_758937 ) ) ( not ( = ?auto_758936 ?auto_758938 ) ) ( not ( = ?auto_758936 ?auto_758939 ) ) ( not ( = ?auto_758936 ?auto_758940 ) ) ( not ( = ?auto_758936 ?auto_758941 ) ) ( not ( = ?auto_758936 ?auto_758942 ) ) ( not ( = ?auto_758936 ?auto_758943 ) ) ( not ( = ?auto_758936 ?auto_758944 ) ) ( not ( = ?auto_758936 ?auto_758945 ) ) ( not ( = ?auto_758936 ?auto_758946 ) ) ( not ( = ?auto_758937 ?auto_758938 ) ) ( not ( = ?auto_758937 ?auto_758939 ) ) ( not ( = ?auto_758937 ?auto_758940 ) ) ( not ( = ?auto_758937 ?auto_758941 ) ) ( not ( = ?auto_758937 ?auto_758942 ) ) ( not ( = ?auto_758937 ?auto_758943 ) ) ( not ( = ?auto_758937 ?auto_758944 ) ) ( not ( = ?auto_758937 ?auto_758945 ) ) ( not ( = ?auto_758937 ?auto_758946 ) ) ( not ( = ?auto_758938 ?auto_758939 ) ) ( not ( = ?auto_758938 ?auto_758940 ) ) ( not ( = ?auto_758938 ?auto_758941 ) ) ( not ( = ?auto_758938 ?auto_758942 ) ) ( not ( = ?auto_758938 ?auto_758943 ) ) ( not ( = ?auto_758938 ?auto_758944 ) ) ( not ( = ?auto_758938 ?auto_758945 ) ) ( not ( = ?auto_758938 ?auto_758946 ) ) ( not ( = ?auto_758939 ?auto_758940 ) ) ( not ( = ?auto_758939 ?auto_758941 ) ) ( not ( = ?auto_758939 ?auto_758942 ) ) ( not ( = ?auto_758939 ?auto_758943 ) ) ( not ( = ?auto_758939 ?auto_758944 ) ) ( not ( = ?auto_758939 ?auto_758945 ) ) ( not ( = ?auto_758939 ?auto_758946 ) ) ( not ( = ?auto_758940 ?auto_758941 ) ) ( not ( = ?auto_758940 ?auto_758942 ) ) ( not ( = ?auto_758940 ?auto_758943 ) ) ( not ( = ?auto_758940 ?auto_758944 ) ) ( not ( = ?auto_758940 ?auto_758945 ) ) ( not ( = ?auto_758940 ?auto_758946 ) ) ( not ( = ?auto_758941 ?auto_758942 ) ) ( not ( = ?auto_758941 ?auto_758943 ) ) ( not ( = ?auto_758941 ?auto_758944 ) ) ( not ( = ?auto_758941 ?auto_758945 ) ) ( not ( = ?auto_758941 ?auto_758946 ) ) ( not ( = ?auto_758942 ?auto_758943 ) ) ( not ( = ?auto_758942 ?auto_758944 ) ) ( not ( = ?auto_758942 ?auto_758945 ) ) ( not ( = ?auto_758942 ?auto_758946 ) ) ( not ( = ?auto_758943 ?auto_758944 ) ) ( not ( = ?auto_758943 ?auto_758945 ) ) ( not ( = ?auto_758943 ?auto_758946 ) ) ( not ( = ?auto_758944 ?auto_758945 ) ) ( not ( = ?auto_758944 ?auto_758946 ) ) ( not ( = ?auto_758945 ?auto_758946 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_758945 ?auto_758946 )
      ( !STACK ?auto_758945 ?auto_758944 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_758981 - BLOCK
      ?auto_758982 - BLOCK
      ?auto_758983 - BLOCK
      ?auto_758984 - BLOCK
      ?auto_758985 - BLOCK
      ?auto_758986 - BLOCK
      ?auto_758987 - BLOCK
      ?auto_758988 - BLOCK
      ?auto_758989 - BLOCK
      ?auto_758990 - BLOCK
      ?auto_758991 - BLOCK
    )
    :vars
    (
      ?auto_758992 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_758991 ?auto_758992 ) ( ON-TABLE ?auto_758981 ) ( ON ?auto_758982 ?auto_758981 ) ( ON ?auto_758983 ?auto_758982 ) ( ON ?auto_758984 ?auto_758983 ) ( ON ?auto_758985 ?auto_758984 ) ( ON ?auto_758986 ?auto_758985 ) ( ON ?auto_758987 ?auto_758986 ) ( ON ?auto_758988 ?auto_758987 ) ( ON ?auto_758989 ?auto_758988 ) ( not ( = ?auto_758981 ?auto_758982 ) ) ( not ( = ?auto_758981 ?auto_758983 ) ) ( not ( = ?auto_758981 ?auto_758984 ) ) ( not ( = ?auto_758981 ?auto_758985 ) ) ( not ( = ?auto_758981 ?auto_758986 ) ) ( not ( = ?auto_758981 ?auto_758987 ) ) ( not ( = ?auto_758981 ?auto_758988 ) ) ( not ( = ?auto_758981 ?auto_758989 ) ) ( not ( = ?auto_758981 ?auto_758990 ) ) ( not ( = ?auto_758981 ?auto_758991 ) ) ( not ( = ?auto_758981 ?auto_758992 ) ) ( not ( = ?auto_758982 ?auto_758983 ) ) ( not ( = ?auto_758982 ?auto_758984 ) ) ( not ( = ?auto_758982 ?auto_758985 ) ) ( not ( = ?auto_758982 ?auto_758986 ) ) ( not ( = ?auto_758982 ?auto_758987 ) ) ( not ( = ?auto_758982 ?auto_758988 ) ) ( not ( = ?auto_758982 ?auto_758989 ) ) ( not ( = ?auto_758982 ?auto_758990 ) ) ( not ( = ?auto_758982 ?auto_758991 ) ) ( not ( = ?auto_758982 ?auto_758992 ) ) ( not ( = ?auto_758983 ?auto_758984 ) ) ( not ( = ?auto_758983 ?auto_758985 ) ) ( not ( = ?auto_758983 ?auto_758986 ) ) ( not ( = ?auto_758983 ?auto_758987 ) ) ( not ( = ?auto_758983 ?auto_758988 ) ) ( not ( = ?auto_758983 ?auto_758989 ) ) ( not ( = ?auto_758983 ?auto_758990 ) ) ( not ( = ?auto_758983 ?auto_758991 ) ) ( not ( = ?auto_758983 ?auto_758992 ) ) ( not ( = ?auto_758984 ?auto_758985 ) ) ( not ( = ?auto_758984 ?auto_758986 ) ) ( not ( = ?auto_758984 ?auto_758987 ) ) ( not ( = ?auto_758984 ?auto_758988 ) ) ( not ( = ?auto_758984 ?auto_758989 ) ) ( not ( = ?auto_758984 ?auto_758990 ) ) ( not ( = ?auto_758984 ?auto_758991 ) ) ( not ( = ?auto_758984 ?auto_758992 ) ) ( not ( = ?auto_758985 ?auto_758986 ) ) ( not ( = ?auto_758985 ?auto_758987 ) ) ( not ( = ?auto_758985 ?auto_758988 ) ) ( not ( = ?auto_758985 ?auto_758989 ) ) ( not ( = ?auto_758985 ?auto_758990 ) ) ( not ( = ?auto_758985 ?auto_758991 ) ) ( not ( = ?auto_758985 ?auto_758992 ) ) ( not ( = ?auto_758986 ?auto_758987 ) ) ( not ( = ?auto_758986 ?auto_758988 ) ) ( not ( = ?auto_758986 ?auto_758989 ) ) ( not ( = ?auto_758986 ?auto_758990 ) ) ( not ( = ?auto_758986 ?auto_758991 ) ) ( not ( = ?auto_758986 ?auto_758992 ) ) ( not ( = ?auto_758987 ?auto_758988 ) ) ( not ( = ?auto_758987 ?auto_758989 ) ) ( not ( = ?auto_758987 ?auto_758990 ) ) ( not ( = ?auto_758987 ?auto_758991 ) ) ( not ( = ?auto_758987 ?auto_758992 ) ) ( not ( = ?auto_758988 ?auto_758989 ) ) ( not ( = ?auto_758988 ?auto_758990 ) ) ( not ( = ?auto_758988 ?auto_758991 ) ) ( not ( = ?auto_758988 ?auto_758992 ) ) ( not ( = ?auto_758989 ?auto_758990 ) ) ( not ( = ?auto_758989 ?auto_758991 ) ) ( not ( = ?auto_758989 ?auto_758992 ) ) ( not ( = ?auto_758990 ?auto_758991 ) ) ( not ( = ?auto_758990 ?auto_758992 ) ) ( not ( = ?auto_758991 ?auto_758992 ) ) ( CLEAR ?auto_758989 ) ( ON ?auto_758990 ?auto_758991 ) ( CLEAR ?auto_758990 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_758981 ?auto_758982 ?auto_758983 ?auto_758984 ?auto_758985 ?auto_758986 ?auto_758987 ?auto_758988 ?auto_758989 ?auto_758990 )
      ( MAKE-11PILE ?auto_758981 ?auto_758982 ?auto_758983 ?auto_758984 ?auto_758985 ?auto_758986 ?auto_758987 ?auto_758988 ?auto_758989 ?auto_758990 ?auto_758991 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_759027 - BLOCK
      ?auto_759028 - BLOCK
      ?auto_759029 - BLOCK
      ?auto_759030 - BLOCK
      ?auto_759031 - BLOCK
      ?auto_759032 - BLOCK
      ?auto_759033 - BLOCK
      ?auto_759034 - BLOCK
      ?auto_759035 - BLOCK
      ?auto_759036 - BLOCK
      ?auto_759037 - BLOCK
    )
    :vars
    (
      ?auto_759038 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_759037 ?auto_759038 ) ( ON-TABLE ?auto_759027 ) ( ON ?auto_759028 ?auto_759027 ) ( ON ?auto_759029 ?auto_759028 ) ( ON ?auto_759030 ?auto_759029 ) ( ON ?auto_759031 ?auto_759030 ) ( ON ?auto_759032 ?auto_759031 ) ( ON ?auto_759033 ?auto_759032 ) ( ON ?auto_759034 ?auto_759033 ) ( not ( = ?auto_759027 ?auto_759028 ) ) ( not ( = ?auto_759027 ?auto_759029 ) ) ( not ( = ?auto_759027 ?auto_759030 ) ) ( not ( = ?auto_759027 ?auto_759031 ) ) ( not ( = ?auto_759027 ?auto_759032 ) ) ( not ( = ?auto_759027 ?auto_759033 ) ) ( not ( = ?auto_759027 ?auto_759034 ) ) ( not ( = ?auto_759027 ?auto_759035 ) ) ( not ( = ?auto_759027 ?auto_759036 ) ) ( not ( = ?auto_759027 ?auto_759037 ) ) ( not ( = ?auto_759027 ?auto_759038 ) ) ( not ( = ?auto_759028 ?auto_759029 ) ) ( not ( = ?auto_759028 ?auto_759030 ) ) ( not ( = ?auto_759028 ?auto_759031 ) ) ( not ( = ?auto_759028 ?auto_759032 ) ) ( not ( = ?auto_759028 ?auto_759033 ) ) ( not ( = ?auto_759028 ?auto_759034 ) ) ( not ( = ?auto_759028 ?auto_759035 ) ) ( not ( = ?auto_759028 ?auto_759036 ) ) ( not ( = ?auto_759028 ?auto_759037 ) ) ( not ( = ?auto_759028 ?auto_759038 ) ) ( not ( = ?auto_759029 ?auto_759030 ) ) ( not ( = ?auto_759029 ?auto_759031 ) ) ( not ( = ?auto_759029 ?auto_759032 ) ) ( not ( = ?auto_759029 ?auto_759033 ) ) ( not ( = ?auto_759029 ?auto_759034 ) ) ( not ( = ?auto_759029 ?auto_759035 ) ) ( not ( = ?auto_759029 ?auto_759036 ) ) ( not ( = ?auto_759029 ?auto_759037 ) ) ( not ( = ?auto_759029 ?auto_759038 ) ) ( not ( = ?auto_759030 ?auto_759031 ) ) ( not ( = ?auto_759030 ?auto_759032 ) ) ( not ( = ?auto_759030 ?auto_759033 ) ) ( not ( = ?auto_759030 ?auto_759034 ) ) ( not ( = ?auto_759030 ?auto_759035 ) ) ( not ( = ?auto_759030 ?auto_759036 ) ) ( not ( = ?auto_759030 ?auto_759037 ) ) ( not ( = ?auto_759030 ?auto_759038 ) ) ( not ( = ?auto_759031 ?auto_759032 ) ) ( not ( = ?auto_759031 ?auto_759033 ) ) ( not ( = ?auto_759031 ?auto_759034 ) ) ( not ( = ?auto_759031 ?auto_759035 ) ) ( not ( = ?auto_759031 ?auto_759036 ) ) ( not ( = ?auto_759031 ?auto_759037 ) ) ( not ( = ?auto_759031 ?auto_759038 ) ) ( not ( = ?auto_759032 ?auto_759033 ) ) ( not ( = ?auto_759032 ?auto_759034 ) ) ( not ( = ?auto_759032 ?auto_759035 ) ) ( not ( = ?auto_759032 ?auto_759036 ) ) ( not ( = ?auto_759032 ?auto_759037 ) ) ( not ( = ?auto_759032 ?auto_759038 ) ) ( not ( = ?auto_759033 ?auto_759034 ) ) ( not ( = ?auto_759033 ?auto_759035 ) ) ( not ( = ?auto_759033 ?auto_759036 ) ) ( not ( = ?auto_759033 ?auto_759037 ) ) ( not ( = ?auto_759033 ?auto_759038 ) ) ( not ( = ?auto_759034 ?auto_759035 ) ) ( not ( = ?auto_759034 ?auto_759036 ) ) ( not ( = ?auto_759034 ?auto_759037 ) ) ( not ( = ?auto_759034 ?auto_759038 ) ) ( not ( = ?auto_759035 ?auto_759036 ) ) ( not ( = ?auto_759035 ?auto_759037 ) ) ( not ( = ?auto_759035 ?auto_759038 ) ) ( not ( = ?auto_759036 ?auto_759037 ) ) ( not ( = ?auto_759036 ?auto_759038 ) ) ( not ( = ?auto_759037 ?auto_759038 ) ) ( ON ?auto_759036 ?auto_759037 ) ( CLEAR ?auto_759034 ) ( ON ?auto_759035 ?auto_759036 ) ( CLEAR ?auto_759035 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_759027 ?auto_759028 ?auto_759029 ?auto_759030 ?auto_759031 ?auto_759032 ?auto_759033 ?auto_759034 ?auto_759035 )
      ( MAKE-11PILE ?auto_759027 ?auto_759028 ?auto_759029 ?auto_759030 ?auto_759031 ?auto_759032 ?auto_759033 ?auto_759034 ?auto_759035 ?auto_759036 ?auto_759037 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_759073 - BLOCK
      ?auto_759074 - BLOCK
      ?auto_759075 - BLOCK
      ?auto_759076 - BLOCK
      ?auto_759077 - BLOCK
      ?auto_759078 - BLOCK
      ?auto_759079 - BLOCK
      ?auto_759080 - BLOCK
      ?auto_759081 - BLOCK
      ?auto_759082 - BLOCK
      ?auto_759083 - BLOCK
    )
    :vars
    (
      ?auto_759084 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_759083 ?auto_759084 ) ( ON-TABLE ?auto_759073 ) ( ON ?auto_759074 ?auto_759073 ) ( ON ?auto_759075 ?auto_759074 ) ( ON ?auto_759076 ?auto_759075 ) ( ON ?auto_759077 ?auto_759076 ) ( ON ?auto_759078 ?auto_759077 ) ( ON ?auto_759079 ?auto_759078 ) ( not ( = ?auto_759073 ?auto_759074 ) ) ( not ( = ?auto_759073 ?auto_759075 ) ) ( not ( = ?auto_759073 ?auto_759076 ) ) ( not ( = ?auto_759073 ?auto_759077 ) ) ( not ( = ?auto_759073 ?auto_759078 ) ) ( not ( = ?auto_759073 ?auto_759079 ) ) ( not ( = ?auto_759073 ?auto_759080 ) ) ( not ( = ?auto_759073 ?auto_759081 ) ) ( not ( = ?auto_759073 ?auto_759082 ) ) ( not ( = ?auto_759073 ?auto_759083 ) ) ( not ( = ?auto_759073 ?auto_759084 ) ) ( not ( = ?auto_759074 ?auto_759075 ) ) ( not ( = ?auto_759074 ?auto_759076 ) ) ( not ( = ?auto_759074 ?auto_759077 ) ) ( not ( = ?auto_759074 ?auto_759078 ) ) ( not ( = ?auto_759074 ?auto_759079 ) ) ( not ( = ?auto_759074 ?auto_759080 ) ) ( not ( = ?auto_759074 ?auto_759081 ) ) ( not ( = ?auto_759074 ?auto_759082 ) ) ( not ( = ?auto_759074 ?auto_759083 ) ) ( not ( = ?auto_759074 ?auto_759084 ) ) ( not ( = ?auto_759075 ?auto_759076 ) ) ( not ( = ?auto_759075 ?auto_759077 ) ) ( not ( = ?auto_759075 ?auto_759078 ) ) ( not ( = ?auto_759075 ?auto_759079 ) ) ( not ( = ?auto_759075 ?auto_759080 ) ) ( not ( = ?auto_759075 ?auto_759081 ) ) ( not ( = ?auto_759075 ?auto_759082 ) ) ( not ( = ?auto_759075 ?auto_759083 ) ) ( not ( = ?auto_759075 ?auto_759084 ) ) ( not ( = ?auto_759076 ?auto_759077 ) ) ( not ( = ?auto_759076 ?auto_759078 ) ) ( not ( = ?auto_759076 ?auto_759079 ) ) ( not ( = ?auto_759076 ?auto_759080 ) ) ( not ( = ?auto_759076 ?auto_759081 ) ) ( not ( = ?auto_759076 ?auto_759082 ) ) ( not ( = ?auto_759076 ?auto_759083 ) ) ( not ( = ?auto_759076 ?auto_759084 ) ) ( not ( = ?auto_759077 ?auto_759078 ) ) ( not ( = ?auto_759077 ?auto_759079 ) ) ( not ( = ?auto_759077 ?auto_759080 ) ) ( not ( = ?auto_759077 ?auto_759081 ) ) ( not ( = ?auto_759077 ?auto_759082 ) ) ( not ( = ?auto_759077 ?auto_759083 ) ) ( not ( = ?auto_759077 ?auto_759084 ) ) ( not ( = ?auto_759078 ?auto_759079 ) ) ( not ( = ?auto_759078 ?auto_759080 ) ) ( not ( = ?auto_759078 ?auto_759081 ) ) ( not ( = ?auto_759078 ?auto_759082 ) ) ( not ( = ?auto_759078 ?auto_759083 ) ) ( not ( = ?auto_759078 ?auto_759084 ) ) ( not ( = ?auto_759079 ?auto_759080 ) ) ( not ( = ?auto_759079 ?auto_759081 ) ) ( not ( = ?auto_759079 ?auto_759082 ) ) ( not ( = ?auto_759079 ?auto_759083 ) ) ( not ( = ?auto_759079 ?auto_759084 ) ) ( not ( = ?auto_759080 ?auto_759081 ) ) ( not ( = ?auto_759080 ?auto_759082 ) ) ( not ( = ?auto_759080 ?auto_759083 ) ) ( not ( = ?auto_759080 ?auto_759084 ) ) ( not ( = ?auto_759081 ?auto_759082 ) ) ( not ( = ?auto_759081 ?auto_759083 ) ) ( not ( = ?auto_759081 ?auto_759084 ) ) ( not ( = ?auto_759082 ?auto_759083 ) ) ( not ( = ?auto_759082 ?auto_759084 ) ) ( not ( = ?auto_759083 ?auto_759084 ) ) ( ON ?auto_759082 ?auto_759083 ) ( ON ?auto_759081 ?auto_759082 ) ( CLEAR ?auto_759079 ) ( ON ?auto_759080 ?auto_759081 ) ( CLEAR ?auto_759080 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_759073 ?auto_759074 ?auto_759075 ?auto_759076 ?auto_759077 ?auto_759078 ?auto_759079 ?auto_759080 )
      ( MAKE-11PILE ?auto_759073 ?auto_759074 ?auto_759075 ?auto_759076 ?auto_759077 ?auto_759078 ?auto_759079 ?auto_759080 ?auto_759081 ?auto_759082 ?auto_759083 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_759119 - BLOCK
      ?auto_759120 - BLOCK
      ?auto_759121 - BLOCK
      ?auto_759122 - BLOCK
      ?auto_759123 - BLOCK
      ?auto_759124 - BLOCK
      ?auto_759125 - BLOCK
      ?auto_759126 - BLOCK
      ?auto_759127 - BLOCK
      ?auto_759128 - BLOCK
      ?auto_759129 - BLOCK
    )
    :vars
    (
      ?auto_759130 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_759129 ?auto_759130 ) ( ON-TABLE ?auto_759119 ) ( ON ?auto_759120 ?auto_759119 ) ( ON ?auto_759121 ?auto_759120 ) ( ON ?auto_759122 ?auto_759121 ) ( ON ?auto_759123 ?auto_759122 ) ( ON ?auto_759124 ?auto_759123 ) ( not ( = ?auto_759119 ?auto_759120 ) ) ( not ( = ?auto_759119 ?auto_759121 ) ) ( not ( = ?auto_759119 ?auto_759122 ) ) ( not ( = ?auto_759119 ?auto_759123 ) ) ( not ( = ?auto_759119 ?auto_759124 ) ) ( not ( = ?auto_759119 ?auto_759125 ) ) ( not ( = ?auto_759119 ?auto_759126 ) ) ( not ( = ?auto_759119 ?auto_759127 ) ) ( not ( = ?auto_759119 ?auto_759128 ) ) ( not ( = ?auto_759119 ?auto_759129 ) ) ( not ( = ?auto_759119 ?auto_759130 ) ) ( not ( = ?auto_759120 ?auto_759121 ) ) ( not ( = ?auto_759120 ?auto_759122 ) ) ( not ( = ?auto_759120 ?auto_759123 ) ) ( not ( = ?auto_759120 ?auto_759124 ) ) ( not ( = ?auto_759120 ?auto_759125 ) ) ( not ( = ?auto_759120 ?auto_759126 ) ) ( not ( = ?auto_759120 ?auto_759127 ) ) ( not ( = ?auto_759120 ?auto_759128 ) ) ( not ( = ?auto_759120 ?auto_759129 ) ) ( not ( = ?auto_759120 ?auto_759130 ) ) ( not ( = ?auto_759121 ?auto_759122 ) ) ( not ( = ?auto_759121 ?auto_759123 ) ) ( not ( = ?auto_759121 ?auto_759124 ) ) ( not ( = ?auto_759121 ?auto_759125 ) ) ( not ( = ?auto_759121 ?auto_759126 ) ) ( not ( = ?auto_759121 ?auto_759127 ) ) ( not ( = ?auto_759121 ?auto_759128 ) ) ( not ( = ?auto_759121 ?auto_759129 ) ) ( not ( = ?auto_759121 ?auto_759130 ) ) ( not ( = ?auto_759122 ?auto_759123 ) ) ( not ( = ?auto_759122 ?auto_759124 ) ) ( not ( = ?auto_759122 ?auto_759125 ) ) ( not ( = ?auto_759122 ?auto_759126 ) ) ( not ( = ?auto_759122 ?auto_759127 ) ) ( not ( = ?auto_759122 ?auto_759128 ) ) ( not ( = ?auto_759122 ?auto_759129 ) ) ( not ( = ?auto_759122 ?auto_759130 ) ) ( not ( = ?auto_759123 ?auto_759124 ) ) ( not ( = ?auto_759123 ?auto_759125 ) ) ( not ( = ?auto_759123 ?auto_759126 ) ) ( not ( = ?auto_759123 ?auto_759127 ) ) ( not ( = ?auto_759123 ?auto_759128 ) ) ( not ( = ?auto_759123 ?auto_759129 ) ) ( not ( = ?auto_759123 ?auto_759130 ) ) ( not ( = ?auto_759124 ?auto_759125 ) ) ( not ( = ?auto_759124 ?auto_759126 ) ) ( not ( = ?auto_759124 ?auto_759127 ) ) ( not ( = ?auto_759124 ?auto_759128 ) ) ( not ( = ?auto_759124 ?auto_759129 ) ) ( not ( = ?auto_759124 ?auto_759130 ) ) ( not ( = ?auto_759125 ?auto_759126 ) ) ( not ( = ?auto_759125 ?auto_759127 ) ) ( not ( = ?auto_759125 ?auto_759128 ) ) ( not ( = ?auto_759125 ?auto_759129 ) ) ( not ( = ?auto_759125 ?auto_759130 ) ) ( not ( = ?auto_759126 ?auto_759127 ) ) ( not ( = ?auto_759126 ?auto_759128 ) ) ( not ( = ?auto_759126 ?auto_759129 ) ) ( not ( = ?auto_759126 ?auto_759130 ) ) ( not ( = ?auto_759127 ?auto_759128 ) ) ( not ( = ?auto_759127 ?auto_759129 ) ) ( not ( = ?auto_759127 ?auto_759130 ) ) ( not ( = ?auto_759128 ?auto_759129 ) ) ( not ( = ?auto_759128 ?auto_759130 ) ) ( not ( = ?auto_759129 ?auto_759130 ) ) ( ON ?auto_759128 ?auto_759129 ) ( ON ?auto_759127 ?auto_759128 ) ( ON ?auto_759126 ?auto_759127 ) ( CLEAR ?auto_759124 ) ( ON ?auto_759125 ?auto_759126 ) ( CLEAR ?auto_759125 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_759119 ?auto_759120 ?auto_759121 ?auto_759122 ?auto_759123 ?auto_759124 ?auto_759125 )
      ( MAKE-11PILE ?auto_759119 ?auto_759120 ?auto_759121 ?auto_759122 ?auto_759123 ?auto_759124 ?auto_759125 ?auto_759126 ?auto_759127 ?auto_759128 ?auto_759129 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_759165 - BLOCK
      ?auto_759166 - BLOCK
      ?auto_759167 - BLOCK
      ?auto_759168 - BLOCK
      ?auto_759169 - BLOCK
      ?auto_759170 - BLOCK
      ?auto_759171 - BLOCK
      ?auto_759172 - BLOCK
      ?auto_759173 - BLOCK
      ?auto_759174 - BLOCK
      ?auto_759175 - BLOCK
    )
    :vars
    (
      ?auto_759176 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_759175 ?auto_759176 ) ( ON-TABLE ?auto_759165 ) ( ON ?auto_759166 ?auto_759165 ) ( ON ?auto_759167 ?auto_759166 ) ( ON ?auto_759168 ?auto_759167 ) ( ON ?auto_759169 ?auto_759168 ) ( not ( = ?auto_759165 ?auto_759166 ) ) ( not ( = ?auto_759165 ?auto_759167 ) ) ( not ( = ?auto_759165 ?auto_759168 ) ) ( not ( = ?auto_759165 ?auto_759169 ) ) ( not ( = ?auto_759165 ?auto_759170 ) ) ( not ( = ?auto_759165 ?auto_759171 ) ) ( not ( = ?auto_759165 ?auto_759172 ) ) ( not ( = ?auto_759165 ?auto_759173 ) ) ( not ( = ?auto_759165 ?auto_759174 ) ) ( not ( = ?auto_759165 ?auto_759175 ) ) ( not ( = ?auto_759165 ?auto_759176 ) ) ( not ( = ?auto_759166 ?auto_759167 ) ) ( not ( = ?auto_759166 ?auto_759168 ) ) ( not ( = ?auto_759166 ?auto_759169 ) ) ( not ( = ?auto_759166 ?auto_759170 ) ) ( not ( = ?auto_759166 ?auto_759171 ) ) ( not ( = ?auto_759166 ?auto_759172 ) ) ( not ( = ?auto_759166 ?auto_759173 ) ) ( not ( = ?auto_759166 ?auto_759174 ) ) ( not ( = ?auto_759166 ?auto_759175 ) ) ( not ( = ?auto_759166 ?auto_759176 ) ) ( not ( = ?auto_759167 ?auto_759168 ) ) ( not ( = ?auto_759167 ?auto_759169 ) ) ( not ( = ?auto_759167 ?auto_759170 ) ) ( not ( = ?auto_759167 ?auto_759171 ) ) ( not ( = ?auto_759167 ?auto_759172 ) ) ( not ( = ?auto_759167 ?auto_759173 ) ) ( not ( = ?auto_759167 ?auto_759174 ) ) ( not ( = ?auto_759167 ?auto_759175 ) ) ( not ( = ?auto_759167 ?auto_759176 ) ) ( not ( = ?auto_759168 ?auto_759169 ) ) ( not ( = ?auto_759168 ?auto_759170 ) ) ( not ( = ?auto_759168 ?auto_759171 ) ) ( not ( = ?auto_759168 ?auto_759172 ) ) ( not ( = ?auto_759168 ?auto_759173 ) ) ( not ( = ?auto_759168 ?auto_759174 ) ) ( not ( = ?auto_759168 ?auto_759175 ) ) ( not ( = ?auto_759168 ?auto_759176 ) ) ( not ( = ?auto_759169 ?auto_759170 ) ) ( not ( = ?auto_759169 ?auto_759171 ) ) ( not ( = ?auto_759169 ?auto_759172 ) ) ( not ( = ?auto_759169 ?auto_759173 ) ) ( not ( = ?auto_759169 ?auto_759174 ) ) ( not ( = ?auto_759169 ?auto_759175 ) ) ( not ( = ?auto_759169 ?auto_759176 ) ) ( not ( = ?auto_759170 ?auto_759171 ) ) ( not ( = ?auto_759170 ?auto_759172 ) ) ( not ( = ?auto_759170 ?auto_759173 ) ) ( not ( = ?auto_759170 ?auto_759174 ) ) ( not ( = ?auto_759170 ?auto_759175 ) ) ( not ( = ?auto_759170 ?auto_759176 ) ) ( not ( = ?auto_759171 ?auto_759172 ) ) ( not ( = ?auto_759171 ?auto_759173 ) ) ( not ( = ?auto_759171 ?auto_759174 ) ) ( not ( = ?auto_759171 ?auto_759175 ) ) ( not ( = ?auto_759171 ?auto_759176 ) ) ( not ( = ?auto_759172 ?auto_759173 ) ) ( not ( = ?auto_759172 ?auto_759174 ) ) ( not ( = ?auto_759172 ?auto_759175 ) ) ( not ( = ?auto_759172 ?auto_759176 ) ) ( not ( = ?auto_759173 ?auto_759174 ) ) ( not ( = ?auto_759173 ?auto_759175 ) ) ( not ( = ?auto_759173 ?auto_759176 ) ) ( not ( = ?auto_759174 ?auto_759175 ) ) ( not ( = ?auto_759174 ?auto_759176 ) ) ( not ( = ?auto_759175 ?auto_759176 ) ) ( ON ?auto_759174 ?auto_759175 ) ( ON ?auto_759173 ?auto_759174 ) ( ON ?auto_759172 ?auto_759173 ) ( ON ?auto_759171 ?auto_759172 ) ( CLEAR ?auto_759169 ) ( ON ?auto_759170 ?auto_759171 ) ( CLEAR ?auto_759170 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_759165 ?auto_759166 ?auto_759167 ?auto_759168 ?auto_759169 ?auto_759170 )
      ( MAKE-11PILE ?auto_759165 ?auto_759166 ?auto_759167 ?auto_759168 ?auto_759169 ?auto_759170 ?auto_759171 ?auto_759172 ?auto_759173 ?auto_759174 ?auto_759175 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_759211 - BLOCK
      ?auto_759212 - BLOCK
      ?auto_759213 - BLOCK
      ?auto_759214 - BLOCK
      ?auto_759215 - BLOCK
      ?auto_759216 - BLOCK
      ?auto_759217 - BLOCK
      ?auto_759218 - BLOCK
      ?auto_759219 - BLOCK
      ?auto_759220 - BLOCK
      ?auto_759221 - BLOCK
    )
    :vars
    (
      ?auto_759222 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_759221 ?auto_759222 ) ( ON-TABLE ?auto_759211 ) ( ON ?auto_759212 ?auto_759211 ) ( ON ?auto_759213 ?auto_759212 ) ( ON ?auto_759214 ?auto_759213 ) ( not ( = ?auto_759211 ?auto_759212 ) ) ( not ( = ?auto_759211 ?auto_759213 ) ) ( not ( = ?auto_759211 ?auto_759214 ) ) ( not ( = ?auto_759211 ?auto_759215 ) ) ( not ( = ?auto_759211 ?auto_759216 ) ) ( not ( = ?auto_759211 ?auto_759217 ) ) ( not ( = ?auto_759211 ?auto_759218 ) ) ( not ( = ?auto_759211 ?auto_759219 ) ) ( not ( = ?auto_759211 ?auto_759220 ) ) ( not ( = ?auto_759211 ?auto_759221 ) ) ( not ( = ?auto_759211 ?auto_759222 ) ) ( not ( = ?auto_759212 ?auto_759213 ) ) ( not ( = ?auto_759212 ?auto_759214 ) ) ( not ( = ?auto_759212 ?auto_759215 ) ) ( not ( = ?auto_759212 ?auto_759216 ) ) ( not ( = ?auto_759212 ?auto_759217 ) ) ( not ( = ?auto_759212 ?auto_759218 ) ) ( not ( = ?auto_759212 ?auto_759219 ) ) ( not ( = ?auto_759212 ?auto_759220 ) ) ( not ( = ?auto_759212 ?auto_759221 ) ) ( not ( = ?auto_759212 ?auto_759222 ) ) ( not ( = ?auto_759213 ?auto_759214 ) ) ( not ( = ?auto_759213 ?auto_759215 ) ) ( not ( = ?auto_759213 ?auto_759216 ) ) ( not ( = ?auto_759213 ?auto_759217 ) ) ( not ( = ?auto_759213 ?auto_759218 ) ) ( not ( = ?auto_759213 ?auto_759219 ) ) ( not ( = ?auto_759213 ?auto_759220 ) ) ( not ( = ?auto_759213 ?auto_759221 ) ) ( not ( = ?auto_759213 ?auto_759222 ) ) ( not ( = ?auto_759214 ?auto_759215 ) ) ( not ( = ?auto_759214 ?auto_759216 ) ) ( not ( = ?auto_759214 ?auto_759217 ) ) ( not ( = ?auto_759214 ?auto_759218 ) ) ( not ( = ?auto_759214 ?auto_759219 ) ) ( not ( = ?auto_759214 ?auto_759220 ) ) ( not ( = ?auto_759214 ?auto_759221 ) ) ( not ( = ?auto_759214 ?auto_759222 ) ) ( not ( = ?auto_759215 ?auto_759216 ) ) ( not ( = ?auto_759215 ?auto_759217 ) ) ( not ( = ?auto_759215 ?auto_759218 ) ) ( not ( = ?auto_759215 ?auto_759219 ) ) ( not ( = ?auto_759215 ?auto_759220 ) ) ( not ( = ?auto_759215 ?auto_759221 ) ) ( not ( = ?auto_759215 ?auto_759222 ) ) ( not ( = ?auto_759216 ?auto_759217 ) ) ( not ( = ?auto_759216 ?auto_759218 ) ) ( not ( = ?auto_759216 ?auto_759219 ) ) ( not ( = ?auto_759216 ?auto_759220 ) ) ( not ( = ?auto_759216 ?auto_759221 ) ) ( not ( = ?auto_759216 ?auto_759222 ) ) ( not ( = ?auto_759217 ?auto_759218 ) ) ( not ( = ?auto_759217 ?auto_759219 ) ) ( not ( = ?auto_759217 ?auto_759220 ) ) ( not ( = ?auto_759217 ?auto_759221 ) ) ( not ( = ?auto_759217 ?auto_759222 ) ) ( not ( = ?auto_759218 ?auto_759219 ) ) ( not ( = ?auto_759218 ?auto_759220 ) ) ( not ( = ?auto_759218 ?auto_759221 ) ) ( not ( = ?auto_759218 ?auto_759222 ) ) ( not ( = ?auto_759219 ?auto_759220 ) ) ( not ( = ?auto_759219 ?auto_759221 ) ) ( not ( = ?auto_759219 ?auto_759222 ) ) ( not ( = ?auto_759220 ?auto_759221 ) ) ( not ( = ?auto_759220 ?auto_759222 ) ) ( not ( = ?auto_759221 ?auto_759222 ) ) ( ON ?auto_759220 ?auto_759221 ) ( ON ?auto_759219 ?auto_759220 ) ( ON ?auto_759218 ?auto_759219 ) ( ON ?auto_759217 ?auto_759218 ) ( ON ?auto_759216 ?auto_759217 ) ( CLEAR ?auto_759214 ) ( ON ?auto_759215 ?auto_759216 ) ( CLEAR ?auto_759215 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_759211 ?auto_759212 ?auto_759213 ?auto_759214 ?auto_759215 )
      ( MAKE-11PILE ?auto_759211 ?auto_759212 ?auto_759213 ?auto_759214 ?auto_759215 ?auto_759216 ?auto_759217 ?auto_759218 ?auto_759219 ?auto_759220 ?auto_759221 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_759257 - BLOCK
      ?auto_759258 - BLOCK
      ?auto_759259 - BLOCK
      ?auto_759260 - BLOCK
      ?auto_759261 - BLOCK
      ?auto_759262 - BLOCK
      ?auto_759263 - BLOCK
      ?auto_759264 - BLOCK
      ?auto_759265 - BLOCK
      ?auto_759266 - BLOCK
      ?auto_759267 - BLOCK
    )
    :vars
    (
      ?auto_759268 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_759267 ?auto_759268 ) ( ON-TABLE ?auto_759257 ) ( ON ?auto_759258 ?auto_759257 ) ( ON ?auto_759259 ?auto_759258 ) ( not ( = ?auto_759257 ?auto_759258 ) ) ( not ( = ?auto_759257 ?auto_759259 ) ) ( not ( = ?auto_759257 ?auto_759260 ) ) ( not ( = ?auto_759257 ?auto_759261 ) ) ( not ( = ?auto_759257 ?auto_759262 ) ) ( not ( = ?auto_759257 ?auto_759263 ) ) ( not ( = ?auto_759257 ?auto_759264 ) ) ( not ( = ?auto_759257 ?auto_759265 ) ) ( not ( = ?auto_759257 ?auto_759266 ) ) ( not ( = ?auto_759257 ?auto_759267 ) ) ( not ( = ?auto_759257 ?auto_759268 ) ) ( not ( = ?auto_759258 ?auto_759259 ) ) ( not ( = ?auto_759258 ?auto_759260 ) ) ( not ( = ?auto_759258 ?auto_759261 ) ) ( not ( = ?auto_759258 ?auto_759262 ) ) ( not ( = ?auto_759258 ?auto_759263 ) ) ( not ( = ?auto_759258 ?auto_759264 ) ) ( not ( = ?auto_759258 ?auto_759265 ) ) ( not ( = ?auto_759258 ?auto_759266 ) ) ( not ( = ?auto_759258 ?auto_759267 ) ) ( not ( = ?auto_759258 ?auto_759268 ) ) ( not ( = ?auto_759259 ?auto_759260 ) ) ( not ( = ?auto_759259 ?auto_759261 ) ) ( not ( = ?auto_759259 ?auto_759262 ) ) ( not ( = ?auto_759259 ?auto_759263 ) ) ( not ( = ?auto_759259 ?auto_759264 ) ) ( not ( = ?auto_759259 ?auto_759265 ) ) ( not ( = ?auto_759259 ?auto_759266 ) ) ( not ( = ?auto_759259 ?auto_759267 ) ) ( not ( = ?auto_759259 ?auto_759268 ) ) ( not ( = ?auto_759260 ?auto_759261 ) ) ( not ( = ?auto_759260 ?auto_759262 ) ) ( not ( = ?auto_759260 ?auto_759263 ) ) ( not ( = ?auto_759260 ?auto_759264 ) ) ( not ( = ?auto_759260 ?auto_759265 ) ) ( not ( = ?auto_759260 ?auto_759266 ) ) ( not ( = ?auto_759260 ?auto_759267 ) ) ( not ( = ?auto_759260 ?auto_759268 ) ) ( not ( = ?auto_759261 ?auto_759262 ) ) ( not ( = ?auto_759261 ?auto_759263 ) ) ( not ( = ?auto_759261 ?auto_759264 ) ) ( not ( = ?auto_759261 ?auto_759265 ) ) ( not ( = ?auto_759261 ?auto_759266 ) ) ( not ( = ?auto_759261 ?auto_759267 ) ) ( not ( = ?auto_759261 ?auto_759268 ) ) ( not ( = ?auto_759262 ?auto_759263 ) ) ( not ( = ?auto_759262 ?auto_759264 ) ) ( not ( = ?auto_759262 ?auto_759265 ) ) ( not ( = ?auto_759262 ?auto_759266 ) ) ( not ( = ?auto_759262 ?auto_759267 ) ) ( not ( = ?auto_759262 ?auto_759268 ) ) ( not ( = ?auto_759263 ?auto_759264 ) ) ( not ( = ?auto_759263 ?auto_759265 ) ) ( not ( = ?auto_759263 ?auto_759266 ) ) ( not ( = ?auto_759263 ?auto_759267 ) ) ( not ( = ?auto_759263 ?auto_759268 ) ) ( not ( = ?auto_759264 ?auto_759265 ) ) ( not ( = ?auto_759264 ?auto_759266 ) ) ( not ( = ?auto_759264 ?auto_759267 ) ) ( not ( = ?auto_759264 ?auto_759268 ) ) ( not ( = ?auto_759265 ?auto_759266 ) ) ( not ( = ?auto_759265 ?auto_759267 ) ) ( not ( = ?auto_759265 ?auto_759268 ) ) ( not ( = ?auto_759266 ?auto_759267 ) ) ( not ( = ?auto_759266 ?auto_759268 ) ) ( not ( = ?auto_759267 ?auto_759268 ) ) ( ON ?auto_759266 ?auto_759267 ) ( ON ?auto_759265 ?auto_759266 ) ( ON ?auto_759264 ?auto_759265 ) ( ON ?auto_759263 ?auto_759264 ) ( ON ?auto_759262 ?auto_759263 ) ( ON ?auto_759261 ?auto_759262 ) ( CLEAR ?auto_759259 ) ( ON ?auto_759260 ?auto_759261 ) ( CLEAR ?auto_759260 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_759257 ?auto_759258 ?auto_759259 ?auto_759260 )
      ( MAKE-11PILE ?auto_759257 ?auto_759258 ?auto_759259 ?auto_759260 ?auto_759261 ?auto_759262 ?auto_759263 ?auto_759264 ?auto_759265 ?auto_759266 ?auto_759267 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_759303 - BLOCK
      ?auto_759304 - BLOCK
      ?auto_759305 - BLOCK
      ?auto_759306 - BLOCK
      ?auto_759307 - BLOCK
      ?auto_759308 - BLOCK
      ?auto_759309 - BLOCK
      ?auto_759310 - BLOCK
      ?auto_759311 - BLOCK
      ?auto_759312 - BLOCK
      ?auto_759313 - BLOCK
    )
    :vars
    (
      ?auto_759314 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_759313 ?auto_759314 ) ( ON-TABLE ?auto_759303 ) ( ON ?auto_759304 ?auto_759303 ) ( not ( = ?auto_759303 ?auto_759304 ) ) ( not ( = ?auto_759303 ?auto_759305 ) ) ( not ( = ?auto_759303 ?auto_759306 ) ) ( not ( = ?auto_759303 ?auto_759307 ) ) ( not ( = ?auto_759303 ?auto_759308 ) ) ( not ( = ?auto_759303 ?auto_759309 ) ) ( not ( = ?auto_759303 ?auto_759310 ) ) ( not ( = ?auto_759303 ?auto_759311 ) ) ( not ( = ?auto_759303 ?auto_759312 ) ) ( not ( = ?auto_759303 ?auto_759313 ) ) ( not ( = ?auto_759303 ?auto_759314 ) ) ( not ( = ?auto_759304 ?auto_759305 ) ) ( not ( = ?auto_759304 ?auto_759306 ) ) ( not ( = ?auto_759304 ?auto_759307 ) ) ( not ( = ?auto_759304 ?auto_759308 ) ) ( not ( = ?auto_759304 ?auto_759309 ) ) ( not ( = ?auto_759304 ?auto_759310 ) ) ( not ( = ?auto_759304 ?auto_759311 ) ) ( not ( = ?auto_759304 ?auto_759312 ) ) ( not ( = ?auto_759304 ?auto_759313 ) ) ( not ( = ?auto_759304 ?auto_759314 ) ) ( not ( = ?auto_759305 ?auto_759306 ) ) ( not ( = ?auto_759305 ?auto_759307 ) ) ( not ( = ?auto_759305 ?auto_759308 ) ) ( not ( = ?auto_759305 ?auto_759309 ) ) ( not ( = ?auto_759305 ?auto_759310 ) ) ( not ( = ?auto_759305 ?auto_759311 ) ) ( not ( = ?auto_759305 ?auto_759312 ) ) ( not ( = ?auto_759305 ?auto_759313 ) ) ( not ( = ?auto_759305 ?auto_759314 ) ) ( not ( = ?auto_759306 ?auto_759307 ) ) ( not ( = ?auto_759306 ?auto_759308 ) ) ( not ( = ?auto_759306 ?auto_759309 ) ) ( not ( = ?auto_759306 ?auto_759310 ) ) ( not ( = ?auto_759306 ?auto_759311 ) ) ( not ( = ?auto_759306 ?auto_759312 ) ) ( not ( = ?auto_759306 ?auto_759313 ) ) ( not ( = ?auto_759306 ?auto_759314 ) ) ( not ( = ?auto_759307 ?auto_759308 ) ) ( not ( = ?auto_759307 ?auto_759309 ) ) ( not ( = ?auto_759307 ?auto_759310 ) ) ( not ( = ?auto_759307 ?auto_759311 ) ) ( not ( = ?auto_759307 ?auto_759312 ) ) ( not ( = ?auto_759307 ?auto_759313 ) ) ( not ( = ?auto_759307 ?auto_759314 ) ) ( not ( = ?auto_759308 ?auto_759309 ) ) ( not ( = ?auto_759308 ?auto_759310 ) ) ( not ( = ?auto_759308 ?auto_759311 ) ) ( not ( = ?auto_759308 ?auto_759312 ) ) ( not ( = ?auto_759308 ?auto_759313 ) ) ( not ( = ?auto_759308 ?auto_759314 ) ) ( not ( = ?auto_759309 ?auto_759310 ) ) ( not ( = ?auto_759309 ?auto_759311 ) ) ( not ( = ?auto_759309 ?auto_759312 ) ) ( not ( = ?auto_759309 ?auto_759313 ) ) ( not ( = ?auto_759309 ?auto_759314 ) ) ( not ( = ?auto_759310 ?auto_759311 ) ) ( not ( = ?auto_759310 ?auto_759312 ) ) ( not ( = ?auto_759310 ?auto_759313 ) ) ( not ( = ?auto_759310 ?auto_759314 ) ) ( not ( = ?auto_759311 ?auto_759312 ) ) ( not ( = ?auto_759311 ?auto_759313 ) ) ( not ( = ?auto_759311 ?auto_759314 ) ) ( not ( = ?auto_759312 ?auto_759313 ) ) ( not ( = ?auto_759312 ?auto_759314 ) ) ( not ( = ?auto_759313 ?auto_759314 ) ) ( ON ?auto_759312 ?auto_759313 ) ( ON ?auto_759311 ?auto_759312 ) ( ON ?auto_759310 ?auto_759311 ) ( ON ?auto_759309 ?auto_759310 ) ( ON ?auto_759308 ?auto_759309 ) ( ON ?auto_759307 ?auto_759308 ) ( ON ?auto_759306 ?auto_759307 ) ( CLEAR ?auto_759304 ) ( ON ?auto_759305 ?auto_759306 ) ( CLEAR ?auto_759305 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_759303 ?auto_759304 ?auto_759305 )
      ( MAKE-11PILE ?auto_759303 ?auto_759304 ?auto_759305 ?auto_759306 ?auto_759307 ?auto_759308 ?auto_759309 ?auto_759310 ?auto_759311 ?auto_759312 ?auto_759313 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_759349 - BLOCK
      ?auto_759350 - BLOCK
      ?auto_759351 - BLOCK
      ?auto_759352 - BLOCK
      ?auto_759353 - BLOCK
      ?auto_759354 - BLOCK
      ?auto_759355 - BLOCK
      ?auto_759356 - BLOCK
      ?auto_759357 - BLOCK
      ?auto_759358 - BLOCK
      ?auto_759359 - BLOCK
    )
    :vars
    (
      ?auto_759360 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_759359 ?auto_759360 ) ( ON-TABLE ?auto_759349 ) ( not ( = ?auto_759349 ?auto_759350 ) ) ( not ( = ?auto_759349 ?auto_759351 ) ) ( not ( = ?auto_759349 ?auto_759352 ) ) ( not ( = ?auto_759349 ?auto_759353 ) ) ( not ( = ?auto_759349 ?auto_759354 ) ) ( not ( = ?auto_759349 ?auto_759355 ) ) ( not ( = ?auto_759349 ?auto_759356 ) ) ( not ( = ?auto_759349 ?auto_759357 ) ) ( not ( = ?auto_759349 ?auto_759358 ) ) ( not ( = ?auto_759349 ?auto_759359 ) ) ( not ( = ?auto_759349 ?auto_759360 ) ) ( not ( = ?auto_759350 ?auto_759351 ) ) ( not ( = ?auto_759350 ?auto_759352 ) ) ( not ( = ?auto_759350 ?auto_759353 ) ) ( not ( = ?auto_759350 ?auto_759354 ) ) ( not ( = ?auto_759350 ?auto_759355 ) ) ( not ( = ?auto_759350 ?auto_759356 ) ) ( not ( = ?auto_759350 ?auto_759357 ) ) ( not ( = ?auto_759350 ?auto_759358 ) ) ( not ( = ?auto_759350 ?auto_759359 ) ) ( not ( = ?auto_759350 ?auto_759360 ) ) ( not ( = ?auto_759351 ?auto_759352 ) ) ( not ( = ?auto_759351 ?auto_759353 ) ) ( not ( = ?auto_759351 ?auto_759354 ) ) ( not ( = ?auto_759351 ?auto_759355 ) ) ( not ( = ?auto_759351 ?auto_759356 ) ) ( not ( = ?auto_759351 ?auto_759357 ) ) ( not ( = ?auto_759351 ?auto_759358 ) ) ( not ( = ?auto_759351 ?auto_759359 ) ) ( not ( = ?auto_759351 ?auto_759360 ) ) ( not ( = ?auto_759352 ?auto_759353 ) ) ( not ( = ?auto_759352 ?auto_759354 ) ) ( not ( = ?auto_759352 ?auto_759355 ) ) ( not ( = ?auto_759352 ?auto_759356 ) ) ( not ( = ?auto_759352 ?auto_759357 ) ) ( not ( = ?auto_759352 ?auto_759358 ) ) ( not ( = ?auto_759352 ?auto_759359 ) ) ( not ( = ?auto_759352 ?auto_759360 ) ) ( not ( = ?auto_759353 ?auto_759354 ) ) ( not ( = ?auto_759353 ?auto_759355 ) ) ( not ( = ?auto_759353 ?auto_759356 ) ) ( not ( = ?auto_759353 ?auto_759357 ) ) ( not ( = ?auto_759353 ?auto_759358 ) ) ( not ( = ?auto_759353 ?auto_759359 ) ) ( not ( = ?auto_759353 ?auto_759360 ) ) ( not ( = ?auto_759354 ?auto_759355 ) ) ( not ( = ?auto_759354 ?auto_759356 ) ) ( not ( = ?auto_759354 ?auto_759357 ) ) ( not ( = ?auto_759354 ?auto_759358 ) ) ( not ( = ?auto_759354 ?auto_759359 ) ) ( not ( = ?auto_759354 ?auto_759360 ) ) ( not ( = ?auto_759355 ?auto_759356 ) ) ( not ( = ?auto_759355 ?auto_759357 ) ) ( not ( = ?auto_759355 ?auto_759358 ) ) ( not ( = ?auto_759355 ?auto_759359 ) ) ( not ( = ?auto_759355 ?auto_759360 ) ) ( not ( = ?auto_759356 ?auto_759357 ) ) ( not ( = ?auto_759356 ?auto_759358 ) ) ( not ( = ?auto_759356 ?auto_759359 ) ) ( not ( = ?auto_759356 ?auto_759360 ) ) ( not ( = ?auto_759357 ?auto_759358 ) ) ( not ( = ?auto_759357 ?auto_759359 ) ) ( not ( = ?auto_759357 ?auto_759360 ) ) ( not ( = ?auto_759358 ?auto_759359 ) ) ( not ( = ?auto_759358 ?auto_759360 ) ) ( not ( = ?auto_759359 ?auto_759360 ) ) ( ON ?auto_759358 ?auto_759359 ) ( ON ?auto_759357 ?auto_759358 ) ( ON ?auto_759356 ?auto_759357 ) ( ON ?auto_759355 ?auto_759356 ) ( ON ?auto_759354 ?auto_759355 ) ( ON ?auto_759353 ?auto_759354 ) ( ON ?auto_759352 ?auto_759353 ) ( ON ?auto_759351 ?auto_759352 ) ( CLEAR ?auto_759349 ) ( ON ?auto_759350 ?auto_759351 ) ( CLEAR ?auto_759350 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_759349 ?auto_759350 )
      ( MAKE-11PILE ?auto_759349 ?auto_759350 ?auto_759351 ?auto_759352 ?auto_759353 ?auto_759354 ?auto_759355 ?auto_759356 ?auto_759357 ?auto_759358 ?auto_759359 ) )
  )

  ( :method MAKE-11PILE
    :parameters
    (
      ?auto_759395 - BLOCK
      ?auto_759396 - BLOCK
      ?auto_759397 - BLOCK
      ?auto_759398 - BLOCK
      ?auto_759399 - BLOCK
      ?auto_759400 - BLOCK
      ?auto_759401 - BLOCK
      ?auto_759402 - BLOCK
      ?auto_759403 - BLOCK
      ?auto_759404 - BLOCK
      ?auto_759405 - BLOCK
    )
    :vars
    (
      ?auto_759406 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_759405 ?auto_759406 ) ( not ( = ?auto_759395 ?auto_759396 ) ) ( not ( = ?auto_759395 ?auto_759397 ) ) ( not ( = ?auto_759395 ?auto_759398 ) ) ( not ( = ?auto_759395 ?auto_759399 ) ) ( not ( = ?auto_759395 ?auto_759400 ) ) ( not ( = ?auto_759395 ?auto_759401 ) ) ( not ( = ?auto_759395 ?auto_759402 ) ) ( not ( = ?auto_759395 ?auto_759403 ) ) ( not ( = ?auto_759395 ?auto_759404 ) ) ( not ( = ?auto_759395 ?auto_759405 ) ) ( not ( = ?auto_759395 ?auto_759406 ) ) ( not ( = ?auto_759396 ?auto_759397 ) ) ( not ( = ?auto_759396 ?auto_759398 ) ) ( not ( = ?auto_759396 ?auto_759399 ) ) ( not ( = ?auto_759396 ?auto_759400 ) ) ( not ( = ?auto_759396 ?auto_759401 ) ) ( not ( = ?auto_759396 ?auto_759402 ) ) ( not ( = ?auto_759396 ?auto_759403 ) ) ( not ( = ?auto_759396 ?auto_759404 ) ) ( not ( = ?auto_759396 ?auto_759405 ) ) ( not ( = ?auto_759396 ?auto_759406 ) ) ( not ( = ?auto_759397 ?auto_759398 ) ) ( not ( = ?auto_759397 ?auto_759399 ) ) ( not ( = ?auto_759397 ?auto_759400 ) ) ( not ( = ?auto_759397 ?auto_759401 ) ) ( not ( = ?auto_759397 ?auto_759402 ) ) ( not ( = ?auto_759397 ?auto_759403 ) ) ( not ( = ?auto_759397 ?auto_759404 ) ) ( not ( = ?auto_759397 ?auto_759405 ) ) ( not ( = ?auto_759397 ?auto_759406 ) ) ( not ( = ?auto_759398 ?auto_759399 ) ) ( not ( = ?auto_759398 ?auto_759400 ) ) ( not ( = ?auto_759398 ?auto_759401 ) ) ( not ( = ?auto_759398 ?auto_759402 ) ) ( not ( = ?auto_759398 ?auto_759403 ) ) ( not ( = ?auto_759398 ?auto_759404 ) ) ( not ( = ?auto_759398 ?auto_759405 ) ) ( not ( = ?auto_759398 ?auto_759406 ) ) ( not ( = ?auto_759399 ?auto_759400 ) ) ( not ( = ?auto_759399 ?auto_759401 ) ) ( not ( = ?auto_759399 ?auto_759402 ) ) ( not ( = ?auto_759399 ?auto_759403 ) ) ( not ( = ?auto_759399 ?auto_759404 ) ) ( not ( = ?auto_759399 ?auto_759405 ) ) ( not ( = ?auto_759399 ?auto_759406 ) ) ( not ( = ?auto_759400 ?auto_759401 ) ) ( not ( = ?auto_759400 ?auto_759402 ) ) ( not ( = ?auto_759400 ?auto_759403 ) ) ( not ( = ?auto_759400 ?auto_759404 ) ) ( not ( = ?auto_759400 ?auto_759405 ) ) ( not ( = ?auto_759400 ?auto_759406 ) ) ( not ( = ?auto_759401 ?auto_759402 ) ) ( not ( = ?auto_759401 ?auto_759403 ) ) ( not ( = ?auto_759401 ?auto_759404 ) ) ( not ( = ?auto_759401 ?auto_759405 ) ) ( not ( = ?auto_759401 ?auto_759406 ) ) ( not ( = ?auto_759402 ?auto_759403 ) ) ( not ( = ?auto_759402 ?auto_759404 ) ) ( not ( = ?auto_759402 ?auto_759405 ) ) ( not ( = ?auto_759402 ?auto_759406 ) ) ( not ( = ?auto_759403 ?auto_759404 ) ) ( not ( = ?auto_759403 ?auto_759405 ) ) ( not ( = ?auto_759403 ?auto_759406 ) ) ( not ( = ?auto_759404 ?auto_759405 ) ) ( not ( = ?auto_759404 ?auto_759406 ) ) ( not ( = ?auto_759405 ?auto_759406 ) ) ( ON ?auto_759404 ?auto_759405 ) ( ON ?auto_759403 ?auto_759404 ) ( ON ?auto_759402 ?auto_759403 ) ( ON ?auto_759401 ?auto_759402 ) ( ON ?auto_759400 ?auto_759401 ) ( ON ?auto_759399 ?auto_759400 ) ( ON ?auto_759398 ?auto_759399 ) ( ON ?auto_759397 ?auto_759398 ) ( ON ?auto_759396 ?auto_759397 ) ( ON ?auto_759395 ?auto_759396 ) ( CLEAR ?auto_759395 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_759395 )
      ( MAKE-11PILE ?auto_759395 ?auto_759396 ?auto_759397 ?auto_759398 ?auto_759399 ?auto_759400 ?auto_759401 ?auto_759402 ?auto_759403 ?auto_759404 ?auto_759405 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_759442 - BLOCK
      ?auto_759443 - BLOCK
      ?auto_759444 - BLOCK
      ?auto_759445 - BLOCK
      ?auto_759446 - BLOCK
      ?auto_759447 - BLOCK
      ?auto_759448 - BLOCK
      ?auto_759449 - BLOCK
      ?auto_759450 - BLOCK
      ?auto_759451 - BLOCK
      ?auto_759452 - BLOCK
      ?auto_759453 - BLOCK
    )
    :vars
    (
      ?auto_759454 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_759452 ) ( ON ?auto_759453 ?auto_759454 ) ( CLEAR ?auto_759453 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_759442 ) ( ON ?auto_759443 ?auto_759442 ) ( ON ?auto_759444 ?auto_759443 ) ( ON ?auto_759445 ?auto_759444 ) ( ON ?auto_759446 ?auto_759445 ) ( ON ?auto_759447 ?auto_759446 ) ( ON ?auto_759448 ?auto_759447 ) ( ON ?auto_759449 ?auto_759448 ) ( ON ?auto_759450 ?auto_759449 ) ( ON ?auto_759451 ?auto_759450 ) ( ON ?auto_759452 ?auto_759451 ) ( not ( = ?auto_759442 ?auto_759443 ) ) ( not ( = ?auto_759442 ?auto_759444 ) ) ( not ( = ?auto_759442 ?auto_759445 ) ) ( not ( = ?auto_759442 ?auto_759446 ) ) ( not ( = ?auto_759442 ?auto_759447 ) ) ( not ( = ?auto_759442 ?auto_759448 ) ) ( not ( = ?auto_759442 ?auto_759449 ) ) ( not ( = ?auto_759442 ?auto_759450 ) ) ( not ( = ?auto_759442 ?auto_759451 ) ) ( not ( = ?auto_759442 ?auto_759452 ) ) ( not ( = ?auto_759442 ?auto_759453 ) ) ( not ( = ?auto_759442 ?auto_759454 ) ) ( not ( = ?auto_759443 ?auto_759444 ) ) ( not ( = ?auto_759443 ?auto_759445 ) ) ( not ( = ?auto_759443 ?auto_759446 ) ) ( not ( = ?auto_759443 ?auto_759447 ) ) ( not ( = ?auto_759443 ?auto_759448 ) ) ( not ( = ?auto_759443 ?auto_759449 ) ) ( not ( = ?auto_759443 ?auto_759450 ) ) ( not ( = ?auto_759443 ?auto_759451 ) ) ( not ( = ?auto_759443 ?auto_759452 ) ) ( not ( = ?auto_759443 ?auto_759453 ) ) ( not ( = ?auto_759443 ?auto_759454 ) ) ( not ( = ?auto_759444 ?auto_759445 ) ) ( not ( = ?auto_759444 ?auto_759446 ) ) ( not ( = ?auto_759444 ?auto_759447 ) ) ( not ( = ?auto_759444 ?auto_759448 ) ) ( not ( = ?auto_759444 ?auto_759449 ) ) ( not ( = ?auto_759444 ?auto_759450 ) ) ( not ( = ?auto_759444 ?auto_759451 ) ) ( not ( = ?auto_759444 ?auto_759452 ) ) ( not ( = ?auto_759444 ?auto_759453 ) ) ( not ( = ?auto_759444 ?auto_759454 ) ) ( not ( = ?auto_759445 ?auto_759446 ) ) ( not ( = ?auto_759445 ?auto_759447 ) ) ( not ( = ?auto_759445 ?auto_759448 ) ) ( not ( = ?auto_759445 ?auto_759449 ) ) ( not ( = ?auto_759445 ?auto_759450 ) ) ( not ( = ?auto_759445 ?auto_759451 ) ) ( not ( = ?auto_759445 ?auto_759452 ) ) ( not ( = ?auto_759445 ?auto_759453 ) ) ( not ( = ?auto_759445 ?auto_759454 ) ) ( not ( = ?auto_759446 ?auto_759447 ) ) ( not ( = ?auto_759446 ?auto_759448 ) ) ( not ( = ?auto_759446 ?auto_759449 ) ) ( not ( = ?auto_759446 ?auto_759450 ) ) ( not ( = ?auto_759446 ?auto_759451 ) ) ( not ( = ?auto_759446 ?auto_759452 ) ) ( not ( = ?auto_759446 ?auto_759453 ) ) ( not ( = ?auto_759446 ?auto_759454 ) ) ( not ( = ?auto_759447 ?auto_759448 ) ) ( not ( = ?auto_759447 ?auto_759449 ) ) ( not ( = ?auto_759447 ?auto_759450 ) ) ( not ( = ?auto_759447 ?auto_759451 ) ) ( not ( = ?auto_759447 ?auto_759452 ) ) ( not ( = ?auto_759447 ?auto_759453 ) ) ( not ( = ?auto_759447 ?auto_759454 ) ) ( not ( = ?auto_759448 ?auto_759449 ) ) ( not ( = ?auto_759448 ?auto_759450 ) ) ( not ( = ?auto_759448 ?auto_759451 ) ) ( not ( = ?auto_759448 ?auto_759452 ) ) ( not ( = ?auto_759448 ?auto_759453 ) ) ( not ( = ?auto_759448 ?auto_759454 ) ) ( not ( = ?auto_759449 ?auto_759450 ) ) ( not ( = ?auto_759449 ?auto_759451 ) ) ( not ( = ?auto_759449 ?auto_759452 ) ) ( not ( = ?auto_759449 ?auto_759453 ) ) ( not ( = ?auto_759449 ?auto_759454 ) ) ( not ( = ?auto_759450 ?auto_759451 ) ) ( not ( = ?auto_759450 ?auto_759452 ) ) ( not ( = ?auto_759450 ?auto_759453 ) ) ( not ( = ?auto_759450 ?auto_759454 ) ) ( not ( = ?auto_759451 ?auto_759452 ) ) ( not ( = ?auto_759451 ?auto_759453 ) ) ( not ( = ?auto_759451 ?auto_759454 ) ) ( not ( = ?auto_759452 ?auto_759453 ) ) ( not ( = ?auto_759452 ?auto_759454 ) ) ( not ( = ?auto_759453 ?auto_759454 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_759453 ?auto_759454 )
      ( !STACK ?auto_759453 ?auto_759452 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_759492 - BLOCK
      ?auto_759493 - BLOCK
      ?auto_759494 - BLOCK
      ?auto_759495 - BLOCK
      ?auto_759496 - BLOCK
      ?auto_759497 - BLOCK
      ?auto_759498 - BLOCK
      ?auto_759499 - BLOCK
      ?auto_759500 - BLOCK
      ?auto_759501 - BLOCK
      ?auto_759502 - BLOCK
      ?auto_759503 - BLOCK
    )
    :vars
    (
      ?auto_759504 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_759503 ?auto_759504 ) ( ON-TABLE ?auto_759492 ) ( ON ?auto_759493 ?auto_759492 ) ( ON ?auto_759494 ?auto_759493 ) ( ON ?auto_759495 ?auto_759494 ) ( ON ?auto_759496 ?auto_759495 ) ( ON ?auto_759497 ?auto_759496 ) ( ON ?auto_759498 ?auto_759497 ) ( ON ?auto_759499 ?auto_759498 ) ( ON ?auto_759500 ?auto_759499 ) ( ON ?auto_759501 ?auto_759500 ) ( not ( = ?auto_759492 ?auto_759493 ) ) ( not ( = ?auto_759492 ?auto_759494 ) ) ( not ( = ?auto_759492 ?auto_759495 ) ) ( not ( = ?auto_759492 ?auto_759496 ) ) ( not ( = ?auto_759492 ?auto_759497 ) ) ( not ( = ?auto_759492 ?auto_759498 ) ) ( not ( = ?auto_759492 ?auto_759499 ) ) ( not ( = ?auto_759492 ?auto_759500 ) ) ( not ( = ?auto_759492 ?auto_759501 ) ) ( not ( = ?auto_759492 ?auto_759502 ) ) ( not ( = ?auto_759492 ?auto_759503 ) ) ( not ( = ?auto_759492 ?auto_759504 ) ) ( not ( = ?auto_759493 ?auto_759494 ) ) ( not ( = ?auto_759493 ?auto_759495 ) ) ( not ( = ?auto_759493 ?auto_759496 ) ) ( not ( = ?auto_759493 ?auto_759497 ) ) ( not ( = ?auto_759493 ?auto_759498 ) ) ( not ( = ?auto_759493 ?auto_759499 ) ) ( not ( = ?auto_759493 ?auto_759500 ) ) ( not ( = ?auto_759493 ?auto_759501 ) ) ( not ( = ?auto_759493 ?auto_759502 ) ) ( not ( = ?auto_759493 ?auto_759503 ) ) ( not ( = ?auto_759493 ?auto_759504 ) ) ( not ( = ?auto_759494 ?auto_759495 ) ) ( not ( = ?auto_759494 ?auto_759496 ) ) ( not ( = ?auto_759494 ?auto_759497 ) ) ( not ( = ?auto_759494 ?auto_759498 ) ) ( not ( = ?auto_759494 ?auto_759499 ) ) ( not ( = ?auto_759494 ?auto_759500 ) ) ( not ( = ?auto_759494 ?auto_759501 ) ) ( not ( = ?auto_759494 ?auto_759502 ) ) ( not ( = ?auto_759494 ?auto_759503 ) ) ( not ( = ?auto_759494 ?auto_759504 ) ) ( not ( = ?auto_759495 ?auto_759496 ) ) ( not ( = ?auto_759495 ?auto_759497 ) ) ( not ( = ?auto_759495 ?auto_759498 ) ) ( not ( = ?auto_759495 ?auto_759499 ) ) ( not ( = ?auto_759495 ?auto_759500 ) ) ( not ( = ?auto_759495 ?auto_759501 ) ) ( not ( = ?auto_759495 ?auto_759502 ) ) ( not ( = ?auto_759495 ?auto_759503 ) ) ( not ( = ?auto_759495 ?auto_759504 ) ) ( not ( = ?auto_759496 ?auto_759497 ) ) ( not ( = ?auto_759496 ?auto_759498 ) ) ( not ( = ?auto_759496 ?auto_759499 ) ) ( not ( = ?auto_759496 ?auto_759500 ) ) ( not ( = ?auto_759496 ?auto_759501 ) ) ( not ( = ?auto_759496 ?auto_759502 ) ) ( not ( = ?auto_759496 ?auto_759503 ) ) ( not ( = ?auto_759496 ?auto_759504 ) ) ( not ( = ?auto_759497 ?auto_759498 ) ) ( not ( = ?auto_759497 ?auto_759499 ) ) ( not ( = ?auto_759497 ?auto_759500 ) ) ( not ( = ?auto_759497 ?auto_759501 ) ) ( not ( = ?auto_759497 ?auto_759502 ) ) ( not ( = ?auto_759497 ?auto_759503 ) ) ( not ( = ?auto_759497 ?auto_759504 ) ) ( not ( = ?auto_759498 ?auto_759499 ) ) ( not ( = ?auto_759498 ?auto_759500 ) ) ( not ( = ?auto_759498 ?auto_759501 ) ) ( not ( = ?auto_759498 ?auto_759502 ) ) ( not ( = ?auto_759498 ?auto_759503 ) ) ( not ( = ?auto_759498 ?auto_759504 ) ) ( not ( = ?auto_759499 ?auto_759500 ) ) ( not ( = ?auto_759499 ?auto_759501 ) ) ( not ( = ?auto_759499 ?auto_759502 ) ) ( not ( = ?auto_759499 ?auto_759503 ) ) ( not ( = ?auto_759499 ?auto_759504 ) ) ( not ( = ?auto_759500 ?auto_759501 ) ) ( not ( = ?auto_759500 ?auto_759502 ) ) ( not ( = ?auto_759500 ?auto_759503 ) ) ( not ( = ?auto_759500 ?auto_759504 ) ) ( not ( = ?auto_759501 ?auto_759502 ) ) ( not ( = ?auto_759501 ?auto_759503 ) ) ( not ( = ?auto_759501 ?auto_759504 ) ) ( not ( = ?auto_759502 ?auto_759503 ) ) ( not ( = ?auto_759502 ?auto_759504 ) ) ( not ( = ?auto_759503 ?auto_759504 ) ) ( CLEAR ?auto_759501 ) ( ON ?auto_759502 ?auto_759503 ) ( CLEAR ?auto_759502 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_759492 ?auto_759493 ?auto_759494 ?auto_759495 ?auto_759496 ?auto_759497 ?auto_759498 ?auto_759499 ?auto_759500 ?auto_759501 ?auto_759502 )
      ( MAKE-12PILE ?auto_759492 ?auto_759493 ?auto_759494 ?auto_759495 ?auto_759496 ?auto_759497 ?auto_759498 ?auto_759499 ?auto_759500 ?auto_759501 ?auto_759502 ?auto_759503 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_759542 - BLOCK
      ?auto_759543 - BLOCK
      ?auto_759544 - BLOCK
      ?auto_759545 - BLOCK
      ?auto_759546 - BLOCK
      ?auto_759547 - BLOCK
      ?auto_759548 - BLOCK
      ?auto_759549 - BLOCK
      ?auto_759550 - BLOCK
      ?auto_759551 - BLOCK
      ?auto_759552 - BLOCK
      ?auto_759553 - BLOCK
    )
    :vars
    (
      ?auto_759554 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_759553 ?auto_759554 ) ( ON-TABLE ?auto_759542 ) ( ON ?auto_759543 ?auto_759542 ) ( ON ?auto_759544 ?auto_759543 ) ( ON ?auto_759545 ?auto_759544 ) ( ON ?auto_759546 ?auto_759545 ) ( ON ?auto_759547 ?auto_759546 ) ( ON ?auto_759548 ?auto_759547 ) ( ON ?auto_759549 ?auto_759548 ) ( ON ?auto_759550 ?auto_759549 ) ( not ( = ?auto_759542 ?auto_759543 ) ) ( not ( = ?auto_759542 ?auto_759544 ) ) ( not ( = ?auto_759542 ?auto_759545 ) ) ( not ( = ?auto_759542 ?auto_759546 ) ) ( not ( = ?auto_759542 ?auto_759547 ) ) ( not ( = ?auto_759542 ?auto_759548 ) ) ( not ( = ?auto_759542 ?auto_759549 ) ) ( not ( = ?auto_759542 ?auto_759550 ) ) ( not ( = ?auto_759542 ?auto_759551 ) ) ( not ( = ?auto_759542 ?auto_759552 ) ) ( not ( = ?auto_759542 ?auto_759553 ) ) ( not ( = ?auto_759542 ?auto_759554 ) ) ( not ( = ?auto_759543 ?auto_759544 ) ) ( not ( = ?auto_759543 ?auto_759545 ) ) ( not ( = ?auto_759543 ?auto_759546 ) ) ( not ( = ?auto_759543 ?auto_759547 ) ) ( not ( = ?auto_759543 ?auto_759548 ) ) ( not ( = ?auto_759543 ?auto_759549 ) ) ( not ( = ?auto_759543 ?auto_759550 ) ) ( not ( = ?auto_759543 ?auto_759551 ) ) ( not ( = ?auto_759543 ?auto_759552 ) ) ( not ( = ?auto_759543 ?auto_759553 ) ) ( not ( = ?auto_759543 ?auto_759554 ) ) ( not ( = ?auto_759544 ?auto_759545 ) ) ( not ( = ?auto_759544 ?auto_759546 ) ) ( not ( = ?auto_759544 ?auto_759547 ) ) ( not ( = ?auto_759544 ?auto_759548 ) ) ( not ( = ?auto_759544 ?auto_759549 ) ) ( not ( = ?auto_759544 ?auto_759550 ) ) ( not ( = ?auto_759544 ?auto_759551 ) ) ( not ( = ?auto_759544 ?auto_759552 ) ) ( not ( = ?auto_759544 ?auto_759553 ) ) ( not ( = ?auto_759544 ?auto_759554 ) ) ( not ( = ?auto_759545 ?auto_759546 ) ) ( not ( = ?auto_759545 ?auto_759547 ) ) ( not ( = ?auto_759545 ?auto_759548 ) ) ( not ( = ?auto_759545 ?auto_759549 ) ) ( not ( = ?auto_759545 ?auto_759550 ) ) ( not ( = ?auto_759545 ?auto_759551 ) ) ( not ( = ?auto_759545 ?auto_759552 ) ) ( not ( = ?auto_759545 ?auto_759553 ) ) ( not ( = ?auto_759545 ?auto_759554 ) ) ( not ( = ?auto_759546 ?auto_759547 ) ) ( not ( = ?auto_759546 ?auto_759548 ) ) ( not ( = ?auto_759546 ?auto_759549 ) ) ( not ( = ?auto_759546 ?auto_759550 ) ) ( not ( = ?auto_759546 ?auto_759551 ) ) ( not ( = ?auto_759546 ?auto_759552 ) ) ( not ( = ?auto_759546 ?auto_759553 ) ) ( not ( = ?auto_759546 ?auto_759554 ) ) ( not ( = ?auto_759547 ?auto_759548 ) ) ( not ( = ?auto_759547 ?auto_759549 ) ) ( not ( = ?auto_759547 ?auto_759550 ) ) ( not ( = ?auto_759547 ?auto_759551 ) ) ( not ( = ?auto_759547 ?auto_759552 ) ) ( not ( = ?auto_759547 ?auto_759553 ) ) ( not ( = ?auto_759547 ?auto_759554 ) ) ( not ( = ?auto_759548 ?auto_759549 ) ) ( not ( = ?auto_759548 ?auto_759550 ) ) ( not ( = ?auto_759548 ?auto_759551 ) ) ( not ( = ?auto_759548 ?auto_759552 ) ) ( not ( = ?auto_759548 ?auto_759553 ) ) ( not ( = ?auto_759548 ?auto_759554 ) ) ( not ( = ?auto_759549 ?auto_759550 ) ) ( not ( = ?auto_759549 ?auto_759551 ) ) ( not ( = ?auto_759549 ?auto_759552 ) ) ( not ( = ?auto_759549 ?auto_759553 ) ) ( not ( = ?auto_759549 ?auto_759554 ) ) ( not ( = ?auto_759550 ?auto_759551 ) ) ( not ( = ?auto_759550 ?auto_759552 ) ) ( not ( = ?auto_759550 ?auto_759553 ) ) ( not ( = ?auto_759550 ?auto_759554 ) ) ( not ( = ?auto_759551 ?auto_759552 ) ) ( not ( = ?auto_759551 ?auto_759553 ) ) ( not ( = ?auto_759551 ?auto_759554 ) ) ( not ( = ?auto_759552 ?auto_759553 ) ) ( not ( = ?auto_759552 ?auto_759554 ) ) ( not ( = ?auto_759553 ?auto_759554 ) ) ( ON ?auto_759552 ?auto_759553 ) ( CLEAR ?auto_759550 ) ( ON ?auto_759551 ?auto_759552 ) ( CLEAR ?auto_759551 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_759542 ?auto_759543 ?auto_759544 ?auto_759545 ?auto_759546 ?auto_759547 ?auto_759548 ?auto_759549 ?auto_759550 ?auto_759551 )
      ( MAKE-12PILE ?auto_759542 ?auto_759543 ?auto_759544 ?auto_759545 ?auto_759546 ?auto_759547 ?auto_759548 ?auto_759549 ?auto_759550 ?auto_759551 ?auto_759552 ?auto_759553 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_759592 - BLOCK
      ?auto_759593 - BLOCK
      ?auto_759594 - BLOCK
      ?auto_759595 - BLOCK
      ?auto_759596 - BLOCK
      ?auto_759597 - BLOCK
      ?auto_759598 - BLOCK
      ?auto_759599 - BLOCK
      ?auto_759600 - BLOCK
      ?auto_759601 - BLOCK
      ?auto_759602 - BLOCK
      ?auto_759603 - BLOCK
    )
    :vars
    (
      ?auto_759604 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_759603 ?auto_759604 ) ( ON-TABLE ?auto_759592 ) ( ON ?auto_759593 ?auto_759592 ) ( ON ?auto_759594 ?auto_759593 ) ( ON ?auto_759595 ?auto_759594 ) ( ON ?auto_759596 ?auto_759595 ) ( ON ?auto_759597 ?auto_759596 ) ( ON ?auto_759598 ?auto_759597 ) ( ON ?auto_759599 ?auto_759598 ) ( not ( = ?auto_759592 ?auto_759593 ) ) ( not ( = ?auto_759592 ?auto_759594 ) ) ( not ( = ?auto_759592 ?auto_759595 ) ) ( not ( = ?auto_759592 ?auto_759596 ) ) ( not ( = ?auto_759592 ?auto_759597 ) ) ( not ( = ?auto_759592 ?auto_759598 ) ) ( not ( = ?auto_759592 ?auto_759599 ) ) ( not ( = ?auto_759592 ?auto_759600 ) ) ( not ( = ?auto_759592 ?auto_759601 ) ) ( not ( = ?auto_759592 ?auto_759602 ) ) ( not ( = ?auto_759592 ?auto_759603 ) ) ( not ( = ?auto_759592 ?auto_759604 ) ) ( not ( = ?auto_759593 ?auto_759594 ) ) ( not ( = ?auto_759593 ?auto_759595 ) ) ( not ( = ?auto_759593 ?auto_759596 ) ) ( not ( = ?auto_759593 ?auto_759597 ) ) ( not ( = ?auto_759593 ?auto_759598 ) ) ( not ( = ?auto_759593 ?auto_759599 ) ) ( not ( = ?auto_759593 ?auto_759600 ) ) ( not ( = ?auto_759593 ?auto_759601 ) ) ( not ( = ?auto_759593 ?auto_759602 ) ) ( not ( = ?auto_759593 ?auto_759603 ) ) ( not ( = ?auto_759593 ?auto_759604 ) ) ( not ( = ?auto_759594 ?auto_759595 ) ) ( not ( = ?auto_759594 ?auto_759596 ) ) ( not ( = ?auto_759594 ?auto_759597 ) ) ( not ( = ?auto_759594 ?auto_759598 ) ) ( not ( = ?auto_759594 ?auto_759599 ) ) ( not ( = ?auto_759594 ?auto_759600 ) ) ( not ( = ?auto_759594 ?auto_759601 ) ) ( not ( = ?auto_759594 ?auto_759602 ) ) ( not ( = ?auto_759594 ?auto_759603 ) ) ( not ( = ?auto_759594 ?auto_759604 ) ) ( not ( = ?auto_759595 ?auto_759596 ) ) ( not ( = ?auto_759595 ?auto_759597 ) ) ( not ( = ?auto_759595 ?auto_759598 ) ) ( not ( = ?auto_759595 ?auto_759599 ) ) ( not ( = ?auto_759595 ?auto_759600 ) ) ( not ( = ?auto_759595 ?auto_759601 ) ) ( not ( = ?auto_759595 ?auto_759602 ) ) ( not ( = ?auto_759595 ?auto_759603 ) ) ( not ( = ?auto_759595 ?auto_759604 ) ) ( not ( = ?auto_759596 ?auto_759597 ) ) ( not ( = ?auto_759596 ?auto_759598 ) ) ( not ( = ?auto_759596 ?auto_759599 ) ) ( not ( = ?auto_759596 ?auto_759600 ) ) ( not ( = ?auto_759596 ?auto_759601 ) ) ( not ( = ?auto_759596 ?auto_759602 ) ) ( not ( = ?auto_759596 ?auto_759603 ) ) ( not ( = ?auto_759596 ?auto_759604 ) ) ( not ( = ?auto_759597 ?auto_759598 ) ) ( not ( = ?auto_759597 ?auto_759599 ) ) ( not ( = ?auto_759597 ?auto_759600 ) ) ( not ( = ?auto_759597 ?auto_759601 ) ) ( not ( = ?auto_759597 ?auto_759602 ) ) ( not ( = ?auto_759597 ?auto_759603 ) ) ( not ( = ?auto_759597 ?auto_759604 ) ) ( not ( = ?auto_759598 ?auto_759599 ) ) ( not ( = ?auto_759598 ?auto_759600 ) ) ( not ( = ?auto_759598 ?auto_759601 ) ) ( not ( = ?auto_759598 ?auto_759602 ) ) ( not ( = ?auto_759598 ?auto_759603 ) ) ( not ( = ?auto_759598 ?auto_759604 ) ) ( not ( = ?auto_759599 ?auto_759600 ) ) ( not ( = ?auto_759599 ?auto_759601 ) ) ( not ( = ?auto_759599 ?auto_759602 ) ) ( not ( = ?auto_759599 ?auto_759603 ) ) ( not ( = ?auto_759599 ?auto_759604 ) ) ( not ( = ?auto_759600 ?auto_759601 ) ) ( not ( = ?auto_759600 ?auto_759602 ) ) ( not ( = ?auto_759600 ?auto_759603 ) ) ( not ( = ?auto_759600 ?auto_759604 ) ) ( not ( = ?auto_759601 ?auto_759602 ) ) ( not ( = ?auto_759601 ?auto_759603 ) ) ( not ( = ?auto_759601 ?auto_759604 ) ) ( not ( = ?auto_759602 ?auto_759603 ) ) ( not ( = ?auto_759602 ?auto_759604 ) ) ( not ( = ?auto_759603 ?auto_759604 ) ) ( ON ?auto_759602 ?auto_759603 ) ( ON ?auto_759601 ?auto_759602 ) ( CLEAR ?auto_759599 ) ( ON ?auto_759600 ?auto_759601 ) ( CLEAR ?auto_759600 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_759592 ?auto_759593 ?auto_759594 ?auto_759595 ?auto_759596 ?auto_759597 ?auto_759598 ?auto_759599 ?auto_759600 )
      ( MAKE-12PILE ?auto_759592 ?auto_759593 ?auto_759594 ?auto_759595 ?auto_759596 ?auto_759597 ?auto_759598 ?auto_759599 ?auto_759600 ?auto_759601 ?auto_759602 ?auto_759603 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_759642 - BLOCK
      ?auto_759643 - BLOCK
      ?auto_759644 - BLOCK
      ?auto_759645 - BLOCK
      ?auto_759646 - BLOCK
      ?auto_759647 - BLOCK
      ?auto_759648 - BLOCK
      ?auto_759649 - BLOCK
      ?auto_759650 - BLOCK
      ?auto_759651 - BLOCK
      ?auto_759652 - BLOCK
      ?auto_759653 - BLOCK
    )
    :vars
    (
      ?auto_759654 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_759653 ?auto_759654 ) ( ON-TABLE ?auto_759642 ) ( ON ?auto_759643 ?auto_759642 ) ( ON ?auto_759644 ?auto_759643 ) ( ON ?auto_759645 ?auto_759644 ) ( ON ?auto_759646 ?auto_759645 ) ( ON ?auto_759647 ?auto_759646 ) ( ON ?auto_759648 ?auto_759647 ) ( not ( = ?auto_759642 ?auto_759643 ) ) ( not ( = ?auto_759642 ?auto_759644 ) ) ( not ( = ?auto_759642 ?auto_759645 ) ) ( not ( = ?auto_759642 ?auto_759646 ) ) ( not ( = ?auto_759642 ?auto_759647 ) ) ( not ( = ?auto_759642 ?auto_759648 ) ) ( not ( = ?auto_759642 ?auto_759649 ) ) ( not ( = ?auto_759642 ?auto_759650 ) ) ( not ( = ?auto_759642 ?auto_759651 ) ) ( not ( = ?auto_759642 ?auto_759652 ) ) ( not ( = ?auto_759642 ?auto_759653 ) ) ( not ( = ?auto_759642 ?auto_759654 ) ) ( not ( = ?auto_759643 ?auto_759644 ) ) ( not ( = ?auto_759643 ?auto_759645 ) ) ( not ( = ?auto_759643 ?auto_759646 ) ) ( not ( = ?auto_759643 ?auto_759647 ) ) ( not ( = ?auto_759643 ?auto_759648 ) ) ( not ( = ?auto_759643 ?auto_759649 ) ) ( not ( = ?auto_759643 ?auto_759650 ) ) ( not ( = ?auto_759643 ?auto_759651 ) ) ( not ( = ?auto_759643 ?auto_759652 ) ) ( not ( = ?auto_759643 ?auto_759653 ) ) ( not ( = ?auto_759643 ?auto_759654 ) ) ( not ( = ?auto_759644 ?auto_759645 ) ) ( not ( = ?auto_759644 ?auto_759646 ) ) ( not ( = ?auto_759644 ?auto_759647 ) ) ( not ( = ?auto_759644 ?auto_759648 ) ) ( not ( = ?auto_759644 ?auto_759649 ) ) ( not ( = ?auto_759644 ?auto_759650 ) ) ( not ( = ?auto_759644 ?auto_759651 ) ) ( not ( = ?auto_759644 ?auto_759652 ) ) ( not ( = ?auto_759644 ?auto_759653 ) ) ( not ( = ?auto_759644 ?auto_759654 ) ) ( not ( = ?auto_759645 ?auto_759646 ) ) ( not ( = ?auto_759645 ?auto_759647 ) ) ( not ( = ?auto_759645 ?auto_759648 ) ) ( not ( = ?auto_759645 ?auto_759649 ) ) ( not ( = ?auto_759645 ?auto_759650 ) ) ( not ( = ?auto_759645 ?auto_759651 ) ) ( not ( = ?auto_759645 ?auto_759652 ) ) ( not ( = ?auto_759645 ?auto_759653 ) ) ( not ( = ?auto_759645 ?auto_759654 ) ) ( not ( = ?auto_759646 ?auto_759647 ) ) ( not ( = ?auto_759646 ?auto_759648 ) ) ( not ( = ?auto_759646 ?auto_759649 ) ) ( not ( = ?auto_759646 ?auto_759650 ) ) ( not ( = ?auto_759646 ?auto_759651 ) ) ( not ( = ?auto_759646 ?auto_759652 ) ) ( not ( = ?auto_759646 ?auto_759653 ) ) ( not ( = ?auto_759646 ?auto_759654 ) ) ( not ( = ?auto_759647 ?auto_759648 ) ) ( not ( = ?auto_759647 ?auto_759649 ) ) ( not ( = ?auto_759647 ?auto_759650 ) ) ( not ( = ?auto_759647 ?auto_759651 ) ) ( not ( = ?auto_759647 ?auto_759652 ) ) ( not ( = ?auto_759647 ?auto_759653 ) ) ( not ( = ?auto_759647 ?auto_759654 ) ) ( not ( = ?auto_759648 ?auto_759649 ) ) ( not ( = ?auto_759648 ?auto_759650 ) ) ( not ( = ?auto_759648 ?auto_759651 ) ) ( not ( = ?auto_759648 ?auto_759652 ) ) ( not ( = ?auto_759648 ?auto_759653 ) ) ( not ( = ?auto_759648 ?auto_759654 ) ) ( not ( = ?auto_759649 ?auto_759650 ) ) ( not ( = ?auto_759649 ?auto_759651 ) ) ( not ( = ?auto_759649 ?auto_759652 ) ) ( not ( = ?auto_759649 ?auto_759653 ) ) ( not ( = ?auto_759649 ?auto_759654 ) ) ( not ( = ?auto_759650 ?auto_759651 ) ) ( not ( = ?auto_759650 ?auto_759652 ) ) ( not ( = ?auto_759650 ?auto_759653 ) ) ( not ( = ?auto_759650 ?auto_759654 ) ) ( not ( = ?auto_759651 ?auto_759652 ) ) ( not ( = ?auto_759651 ?auto_759653 ) ) ( not ( = ?auto_759651 ?auto_759654 ) ) ( not ( = ?auto_759652 ?auto_759653 ) ) ( not ( = ?auto_759652 ?auto_759654 ) ) ( not ( = ?auto_759653 ?auto_759654 ) ) ( ON ?auto_759652 ?auto_759653 ) ( ON ?auto_759651 ?auto_759652 ) ( ON ?auto_759650 ?auto_759651 ) ( CLEAR ?auto_759648 ) ( ON ?auto_759649 ?auto_759650 ) ( CLEAR ?auto_759649 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_759642 ?auto_759643 ?auto_759644 ?auto_759645 ?auto_759646 ?auto_759647 ?auto_759648 ?auto_759649 )
      ( MAKE-12PILE ?auto_759642 ?auto_759643 ?auto_759644 ?auto_759645 ?auto_759646 ?auto_759647 ?auto_759648 ?auto_759649 ?auto_759650 ?auto_759651 ?auto_759652 ?auto_759653 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_759692 - BLOCK
      ?auto_759693 - BLOCK
      ?auto_759694 - BLOCK
      ?auto_759695 - BLOCK
      ?auto_759696 - BLOCK
      ?auto_759697 - BLOCK
      ?auto_759698 - BLOCK
      ?auto_759699 - BLOCK
      ?auto_759700 - BLOCK
      ?auto_759701 - BLOCK
      ?auto_759702 - BLOCK
      ?auto_759703 - BLOCK
    )
    :vars
    (
      ?auto_759704 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_759703 ?auto_759704 ) ( ON-TABLE ?auto_759692 ) ( ON ?auto_759693 ?auto_759692 ) ( ON ?auto_759694 ?auto_759693 ) ( ON ?auto_759695 ?auto_759694 ) ( ON ?auto_759696 ?auto_759695 ) ( ON ?auto_759697 ?auto_759696 ) ( not ( = ?auto_759692 ?auto_759693 ) ) ( not ( = ?auto_759692 ?auto_759694 ) ) ( not ( = ?auto_759692 ?auto_759695 ) ) ( not ( = ?auto_759692 ?auto_759696 ) ) ( not ( = ?auto_759692 ?auto_759697 ) ) ( not ( = ?auto_759692 ?auto_759698 ) ) ( not ( = ?auto_759692 ?auto_759699 ) ) ( not ( = ?auto_759692 ?auto_759700 ) ) ( not ( = ?auto_759692 ?auto_759701 ) ) ( not ( = ?auto_759692 ?auto_759702 ) ) ( not ( = ?auto_759692 ?auto_759703 ) ) ( not ( = ?auto_759692 ?auto_759704 ) ) ( not ( = ?auto_759693 ?auto_759694 ) ) ( not ( = ?auto_759693 ?auto_759695 ) ) ( not ( = ?auto_759693 ?auto_759696 ) ) ( not ( = ?auto_759693 ?auto_759697 ) ) ( not ( = ?auto_759693 ?auto_759698 ) ) ( not ( = ?auto_759693 ?auto_759699 ) ) ( not ( = ?auto_759693 ?auto_759700 ) ) ( not ( = ?auto_759693 ?auto_759701 ) ) ( not ( = ?auto_759693 ?auto_759702 ) ) ( not ( = ?auto_759693 ?auto_759703 ) ) ( not ( = ?auto_759693 ?auto_759704 ) ) ( not ( = ?auto_759694 ?auto_759695 ) ) ( not ( = ?auto_759694 ?auto_759696 ) ) ( not ( = ?auto_759694 ?auto_759697 ) ) ( not ( = ?auto_759694 ?auto_759698 ) ) ( not ( = ?auto_759694 ?auto_759699 ) ) ( not ( = ?auto_759694 ?auto_759700 ) ) ( not ( = ?auto_759694 ?auto_759701 ) ) ( not ( = ?auto_759694 ?auto_759702 ) ) ( not ( = ?auto_759694 ?auto_759703 ) ) ( not ( = ?auto_759694 ?auto_759704 ) ) ( not ( = ?auto_759695 ?auto_759696 ) ) ( not ( = ?auto_759695 ?auto_759697 ) ) ( not ( = ?auto_759695 ?auto_759698 ) ) ( not ( = ?auto_759695 ?auto_759699 ) ) ( not ( = ?auto_759695 ?auto_759700 ) ) ( not ( = ?auto_759695 ?auto_759701 ) ) ( not ( = ?auto_759695 ?auto_759702 ) ) ( not ( = ?auto_759695 ?auto_759703 ) ) ( not ( = ?auto_759695 ?auto_759704 ) ) ( not ( = ?auto_759696 ?auto_759697 ) ) ( not ( = ?auto_759696 ?auto_759698 ) ) ( not ( = ?auto_759696 ?auto_759699 ) ) ( not ( = ?auto_759696 ?auto_759700 ) ) ( not ( = ?auto_759696 ?auto_759701 ) ) ( not ( = ?auto_759696 ?auto_759702 ) ) ( not ( = ?auto_759696 ?auto_759703 ) ) ( not ( = ?auto_759696 ?auto_759704 ) ) ( not ( = ?auto_759697 ?auto_759698 ) ) ( not ( = ?auto_759697 ?auto_759699 ) ) ( not ( = ?auto_759697 ?auto_759700 ) ) ( not ( = ?auto_759697 ?auto_759701 ) ) ( not ( = ?auto_759697 ?auto_759702 ) ) ( not ( = ?auto_759697 ?auto_759703 ) ) ( not ( = ?auto_759697 ?auto_759704 ) ) ( not ( = ?auto_759698 ?auto_759699 ) ) ( not ( = ?auto_759698 ?auto_759700 ) ) ( not ( = ?auto_759698 ?auto_759701 ) ) ( not ( = ?auto_759698 ?auto_759702 ) ) ( not ( = ?auto_759698 ?auto_759703 ) ) ( not ( = ?auto_759698 ?auto_759704 ) ) ( not ( = ?auto_759699 ?auto_759700 ) ) ( not ( = ?auto_759699 ?auto_759701 ) ) ( not ( = ?auto_759699 ?auto_759702 ) ) ( not ( = ?auto_759699 ?auto_759703 ) ) ( not ( = ?auto_759699 ?auto_759704 ) ) ( not ( = ?auto_759700 ?auto_759701 ) ) ( not ( = ?auto_759700 ?auto_759702 ) ) ( not ( = ?auto_759700 ?auto_759703 ) ) ( not ( = ?auto_759700 ?auto_759704 ) ) ( not ( = ?auto_759701 ?auto_759702 ) ) ( not ( = ?auto_759701 ?auto_759703 ) ) ( not ( = ?auto_759701 ?auto_759704 ) ) ( not ( = ?auto_759702 ?auto_759703 ) ) ( not ( = ?auto_759702 ?auto_759704 ) ) ( not ( = ?auto_759703 ?auto_759704 ) ) ( ON ?auto_759702 ?auto_759703 ) ( ON ?auto_759701 ?auto_759702 ) ( ON ?auto_759700 ?auto_759701 ) ( ON ?auto_759699 ?auto_759700 ) ( CLEAR ?auto_759697 ) ( ON ?auto_759698 ?auto_759699 ) ( CLEAR ?auto_759698 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_759692 ?auto_759693 ?auto_759694 ?auto_759695 ?auto_759696 ?auto_759697 ?auto_759698 )
      ( MAKE-12PILE ?auto_759692 ?auto_759693 ?auto_759694 ?auto_759695 ?auto_759696 ?auto_759697 ?auto_759698 ?auto_759699 ?auto_759700 ?auto_759701 ?auto_759702 ?auto_759703 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_759742 - BLOCK
      ?auto_759743 - BLOCK
      ?auto_759744 - BLOCK
      ?auto_759745 - BLOCK
      ?auto_759746 - BLOCK
      ?auto_759747 - BLOCK
      ?auto_759748 - BLOCK
      ?auto_759749 - BLOCK
      ?auto_759750 - BLOCK
      ?auto_759751 - BLOCK
      ?auto_759752 - BLOCK
      ?auto_759753 - BLOCK
    )
    :vars
    (
      ?auto_759754 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_759753 ?auto_759754 ) ( ON-TABLE ?auto_759742 ) ( ON ?auto_759743 ?auto_759742 ) ( ON ?auto_759744 ?auto_759743 ) ( ON ?auto_759745 ?auto_759744 ) ( ON ?auto_759746 ?auto_759745 ) ( not ( = ?auto_759742 ?auto_759743 ) ) ( not ( = ?auto_759742 ?auto_759744 ) ) ( not ( = ?auto_759742 ?auto_759745 ) ) ( not ( = ?auto_759742 ?auto_759746 ) ) ( not ( = ?auto_759742 ?auto_759747 ) ) ( not ( = ?auto_759742 ?auto_759748 ) ) ( not ( = ?auto_759742 ?auto_759749 ) ) ( not ( = ?auto_759742 ?auto_759750 ) ) ( not ( = ?auto_759742 ?auto_759751 ) ) ( not ( = ?auto_759742 ?auto_759752 ) ) ( not ( = ?auto_759742 ?auto_759753 ) ) ( not ( = ?auto_759742 ?auto_759754 ) ) ( not ( = ?auto_759743 ?auto_759744 ) ) ( not ( = ?auto_759743 ?auto_759745 ) ) ( not ( = ?auto_759743 ?auto_759746 ) ) ( not ( = ?auto_759743 ?auto_759747 ) ) ( not ( = ?auto_759743 ?auto_759748 ) ) ( not ( = ?auto_759743 ?auto_759749 ) ) ( not ( = ?auto_759743 ?auto_759750 ) ) ( not ( = ?auto_759743 ?auto_759751 ) ) ( not ( = ?auto_759743 ?auto_759752 ) ) ( not ( = ?auto_759743 ?auto_759753 ) ) ( not ( = ?auto_759743 ?auto_759754 ) ) ( not ( = ?auto_759744 ?auto_759745 ) ) ( not ( = ?auto_759744 ?auto_759746 ) ) ( not ( = ?auto_759744 ?auto_759747 ) ) ( not ( = ?auto_759744 ?auto_759748 ) ) ( not ( = ?auto_759744 ?auto_759749 ) ) ( not ( = ?auto_759744 ?auto_759750 ) ) ( not ( = ?auto_759744 ?auto_759751 ) ) ( not ( = ?auto_759744 ?auto_759752 ) ) ( not ( = ?auto_759744 ?auto_759753 ) ) ( not ( = ?auto_759744 ?auto_759754 ) ) ( not ( = ?auto_759745 ?auto_759746 ) ) ( not ( = ?auto_759745 ?auto_759747 ) ) ( not ( = ?auto_759745 ?auto_759748 ) ) ( not ( = ?auto_759745 ?auto_759749 ) ) ( not ( = ?auto_759745 ?auto_759750 ) ) ( not ( = ?auto_759745 ?auto_759751 ) ) ( not ( = ?auto_759745 ?auto_759752 ) ) ( not ( = ?auto_759745 ?auto_759753 ) ) ( not ( = ?auto_759745 ?auto_759754 ) ) ( not ( = ?auto_759746 ?auto_759747 ) ) ( not ( = ?auto_759746 ?auto_759748 ) ) ( not ( = ?auto_759746 ?auto_759749 ) ) ( not ( = ?auto_759746 ?auto_759750 ) ) ( not ( = ?auto_759746 ?auto_759751 ) ) ( not ( = ?auto_759746 ?auto_759752 ) ) ( not ( = ?auto_759746 ?auto_759753 ) ) ( not ( = ?auto_759746 ?auto_759754 ) ) ( not ( = ?auto_759747 ?auto_759748 ) ) ( not ( = ?auto_759747 ?auto_759749 ) ) ( not ( = ?auto_759747 ?auto_759750 ) ) ( not ( = ?auto_759747 ?auto_759751 ) ) ( not ( = ?auto_759747 ?auto_759752 ) ) ( not ( = ?auto_759747 ?auto_759753 ) ) ( not ( = ?auto_759747 ?auto_759754 ) ) ( not ( = ?auto_759748 ?auto_759749 ) ) ( not ( = ?auto_759748 ?auto_759750 ) ) ( not ( = ?auto_759748 ?auto_759751 ) ) ( not ( = ?auto_759748 ?auto_759752 ) ) ( not ( = ?auto_759748 ?auto_759753 ) ) ( not ( = ?auto_759748 ?auto_759754 ) ) ( not ( = ?auto_759749 ?auto_759750 ) ) ( not ( = ?auto_759749 ?auto_759751 ) ) ( not ( = ?auto_759749 ?auto_759752 ) ) ( not ( = ?auto_759749 ?auto_759753 ) ) ( not ( = ?auto_759749 ?auto_759754 ) ) ( not ( = ?auto_759750 ?auto_759751 ) ) ( not ( = ?auto_759750 ?auto_759752 ) ) ( not ( = ?auto_759750 ?auto_759753 ) ) ( not ( = ?auto_759750 ?auto_759754 ) ) ( not ( = ?auto_759751 ?auto_759752 ) ) ( not ( = ?auto_759751 ?auto_759753 ) ) ( not ( = ?auto_759751 ?auto_759754 ) ) ( not ( = ?auto_759752 ?auto_759753 ) ) ( not ( = ?auto_759752 ?auto_759754 ) ) ( not ( = ?auto_759753 ?auto_759754 ) ) ( ON ?auto_759752 ?auto_759753 ) ( ON ?auto_759751 ?auto_759752 ) ( ON ?auto_759750 ?auto_759751 ) ( ON ?auto_759749 ?auto_759750 ) ( ON ?auto_759748 ?auto_759749 ) ( CLEAR ?auto_759746 ) ( ON ?auto_759747 ?auto_759748 ) ( CLEAR ?auto_759747 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_759742 ?auto_759743 ?auto_759744 ?auto_759745 ?auto_759746 ?auto_759747 )
      ( MAKE-12PILE ?auto_759742 ?auto_759743 ?auto_759744 ?auto_759745 ?auto_759746 ?auto_759747 ?auto_759748 ?auto_759749 ?auto_759750 ?auto_759751 ?auto_759752 ?auto_759753 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_759792 - BLOCK
      ?auto_759793 - BLOCK
      ?auto_759794 - BLOCK
      ?auto_759795 - BLOCK
      ?auto_759796 - BLOCK
      ?auto_759797 - BLOCK
      ?auto_759798 - BLOCK
      ?auto_759799 - BLOCK
      ?auto_759800 - BLOCK
      ?auto_759801 - BLOCK
      ?auto_759802 - BLOCK
      ?auto_759803 - BLOCK
    )
    :vars
    (
      ?auto_759804 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_759803 ?auto_759804 ) ( ON-TABLE ?auto_759792 ) ( ON ?auto_759793 ?auto_759792 ) ( ON ?auto_759794 ?auto_759793 ) ( ON ?auto_759795 ?auto_759794 ) ( not ( = ?auto_759792 ?auto_759793 ) ) ( not ( = ?auto_759792 ?auto_759794 ) ) ( not ( = ?auto_759792 ?auto_759795 ) ) ( not ( = ?auto_759792 ?auto_759796 ) ) ( not ( = ?auto_759792 ?auto_759797 ) ) ( not ( = ?auto_759792 ?auto_759798 ) ) ( not ( = ?auto_759792 ?auto_759799 ) ) ( not ( = ?auto_759792 ?auto_759800 ) ) ( not ( = ?auto_759792 ?auto_759801 ) ) ( not ( = ?auto_759792 ?auto_759802 ) ) ( not ( = ?auto_759792 ?auto_759803 ) ) ( not ( = ?auto_759792 ?auto_759804 ) ) ( not ( = ?auto_759793 ?auto_759794 ) ) ( not ( = ?auto_759793 ?auto_759795 ) ) ( not ( = ?auto_759793 ?auto_759796 ) ) ( not ( = ?auto_759793 ?auto_759797 ) ) ( not ( = ?auto_759793 ?auto_759798 ) ) ( not ( = ?auto_759793 ?auto_759799 ) ) ( not ( = ?auto_759793 ?auto_759800 ) ) ( not ( = ?auto_759793 ?auto_759801 ) ) ( not ( = ?auto_759793 ?auto_759802 ) ) ( not ( = ?auto_759793 ?auto_759803 ) ) ( not ( = ?auto_759793 ?auto_759804 ) ) ( not ( = ?auto_759794 ?auto_759795 ) ) ( not ( = ?auto_759794 ?auto_759796 ) ) ( not ( = ?auto_759794 ?auto_759797 ) ) ( not ( = ?auto_759794 ?auto_759798 ) ) ( not ( = ?auto_759794 ?auto_759799 ) ) ( not ( = ?auto_759794 ?auto_759800 ) ) ( not ( = ?auto_759794 ?auto_759801 ) ) ( not ( = ?auto_759794 ?auto_759802 ) ) ( not ( = ?auto_759794 ?auto_759803 ) ) ( not ( = ?auto_759794 ?auto_759804 ) ) ( not ( = ?auto_759795 ?auto_759796 ) ) ( not ( = ?auto_759795 ?auto_759797 ) ) ( not ( = ?auto_759795 ?auto_759798 ) ) ( not ( = ?auto_759795 ?auto_759799 ) ) ( not ( = ?auto_759795 ?auto_759800 ) ) ( not ( = ?auto_759795 ?auto_759801 ) ) ( not ( = ?auto_759795 ?auto_759802 ) ) ( not ( = ?auto_759795 ?auto_759803 ) ) ( not ( = ?auto_759795 ?auto_759804 ) ) ( not ( = ?auto_759796 ?auto_759797 ) ) ( not ( = ?auto_759796 ?auto_759798 ) ) ( not ( = ?auto_759796 ?auto_759799 ) ) ( not ( = ?auto_759796 ?auto_759800 ) ) ( not ( = ?auto_759796 ?auto_759801 ) ) ( not ( = ?auto_759796 ?auto_759802 ) ) ( not ( = ?auto_759796 ?auto_759803 ) ) ( not ( = ?auto_759796 ?auto_759804 ) ) ( not ( = ?auto_759797 ?auto_759798 ) ) ( not ( = ?auto_759797 ?auto_759799 ) ) ( not ( = ?auto_759797 ?auto_759800 ) ) ( not ( = ?auto_759797 ?auto_759801 ) ) ( not ( = ?auto_759797 ?auto_759802 ) ) ( not ( = ?auto_759797 ?auto_759803 ) ) ( not ( = ?auto_759797 ?auto_759804 ) ) ( not ( = ?auto_759798 ?auto_759799 ) ) ( not ( = ?auto_759798 ?auto_759800 ) ) ( not ( = ?auto_759798 ?auto_759801 ) ) ( not ( = ?auto_759798 ?auto_759802 ) ) ( not ( = ?auto_759798 ?auto_759803 ) ) ( not ( = ?auto_759798 ?auto_759804 ) ) ( not ( = ?auto_759799 ?auto_759800 ) ) ( not ( = ?auto_759799 ?auto_759801 ) ) ( not ( = ?auto_759799 ?auto_759802 ) ) ( not ( = ?auto_759799 ?auto_759803 ) ) ( not ( = ?auto_759799 ?auto_759804 ) ) ( not ( = ?auto_759800 ?auto_759801 ) ) ( not ( = ?auto_759800 ?auto_759802 ) ) ( not ( = ?auto_759800 ?auto_759803 ) ) ( not ( = ?auto_759800 ?auto_759804 ) ) ( not ( = ?auto_759801 ?auto_759802 ) ) ( not ( = ?auto_759801 ?auto_759803 ) ) ( not ( = ?auto_759801 ?auto_759804 ) ) ( not ( = ?auto_759802 ?auto_759803 ) ) ( not ( = ?auto_759802 ?auto_759804 ) ) ( not ( = ?auto_759803 ?auto_759804 ) ) ( ON ?auto_759802 ?auto_759803 ) ( ON ?auto_759801 ?auto_759802 ) ( ON ?auto_759800 ?auto_759801 ) ( ON ?auto_759799 ?auto_759800 ) ( ON ?auto_759798 ?auto_759799 ) ( ON ?auto_759797 ?auto_759798 ) ( CLEAR ?auto_759795 ) ( ON ?auto_759796 ?auto_759797 ) ( CLEAR ?auto_759796 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_759792 ?auto_759793 ?auto_759794 ?auto_759795 ?auto_759796 )
      ( MAKE-12PILE ?auto_759792 ?auto_759793 ?auto_759794 ?auto_759795 ?auto_759796 ?auto_759797 ?auto_759798 ?auto_759799 ?auto_759800 ?auto_759801 ?auto_759802 ?auto_759803 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_759842 - BLOCK
      ?auto_759843 - BLOCK
      ?auto_759844 - BLOCK
      ?auto_759845 - BLOCK
      ?auto_759846 - BLOCK
      ?auto_759847 - BLOCK
      ?auto_759848 - BLOCK
      ?auto_759849 - BLOCK
      ?auto_759850 - BLOCK
      ?auto_759851 - BLOCK
      ?auto_759852 - BLOCK
      ?auto_759853 - BLOCK
    )
    :vars
    (
      ?auto_759854 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_759853 ?auto_759854 ) ( ON-TABLE ?auto_759842 ) ( ON ?auto_759843 ?auto_759842 ) ( ON ?auto_759844 ?auto_759843 ) ( not ( = ?auto_759842 ?auto_759843 ) ) ( not ( = ?auto_759842 ?auto_759844 ) ) ( not ( = ?auto_759842 ?auto_759845 ) ) ( not ( = ?auto_759842 ?auto_759846 ) ) ( not ( = ?auto_759842 ?auto_759847 ) ) ( not ( = ?auto_759842 ?auto_759848 ) ) ( not ( = ?auto_759842 ?auto_759849 ) ) ( not ( = ?auto_759842 ?auto_759850 ) ) ( not ( = ?auto_759842 ?auto_759851 ) ) ( not ( = ?auto_759842 ?auto_759852 ) ) ( not ( = ?auto_759842 ?auto_759853 ) ) ( not ( = ?auto_759842 ?auto_759854 ) ) ( not ( = ?auto_759843 ?auto_759844 ) ) ( not ( = ?auto_759843 ?auto_759845 ) ) ( not ( = ?auto_759843 ?auto_759846 ) ) ( not ( = ?auto_759843 ?auto_759847 ) ) ( not ( = ?auto_759843 ?auto_759848 ) ) ( not ( = ?auto_759843 ?auto_759849 ) ) ( not ( = ?auto_759843 ?auto_759850 ) ) ( not ( = ?auto_759843 ?auto_759851 ) ) ( not ( = ?auto_759843 ?auto_759852 ) ) ( not ( = ?auto_759843 ?auto_759853 ) ) ( not ( = ?auto_759843 ?auto_759854 ) ) ( not ( = ?auto_759844 ?auto_759845 ) ) ( not ( = ?auto_759844 ?auto_759846 ) ) ( not ( = ?auto_759844 ?auto_759847 ) ) ( not ( = ?auto_759844 ?auto_759848 ) ) ( not ( = ?auto_759844 ?auto_759849 ) ) ( not ( = ?auto_759844 ?auto_759850 ) ) ( not ( = ?auto_759844 ?auto_759851 ) ) ( not ( = ?auto_759844 ?auto_759852 ) ) ( not ( = ?auto_759844 ?auto_759853 ) ) ( not ( = ?auto_759844 ?auto_759854 ) ) ( not ( = ?auto_759845 ?auto_759846 ) ) ( not ( = ?auto_759845 ?auto_759847 ) ) ( not ( = ?auto_759845 ?auto_759848 ) ) ( not ( = ?auto_759845 ?auto_759849 ) ) ( not ( = ?auto_759845 ?auto_759850 ) ) ( not ( = ?auto_759845 ?auto_759851 ) ) ( not ( = ?auto_759845 ?auto_759852 ) ) ( not ( = ?auto_759845 ?auto_759853 ) ) ( not ( = ?auto_759845 ?auto_759854 ) ) ( not ( = ?auto_759846 ?auto_759847 ) ) ( not ( = ?auto_759846 ?auto_759848 ) ) ( not ( = ?auto_759846 ?auto_759849 ) ) ( not ( = ?auto_759846 ?auto_759850 ) ) ( not ( = ?auto_759846 ?auto_759851 ) ) ( not ( = ?auto_759846 ?auto_759852 ) ) ( not ( = ?auto_759846 ?auto_759853 ) ) ( not ( = ?auto_759846 ?auto_759854 ) ) ( not ( = ?auto_759847 ?auto_759848 ) ) ( not ( = ?auto_759847 ?auto_759849 ) ) ( not ( = ?auto_759847 ?auto_759850 ) ) ( not ( = ?auto_759847 ?auto_759851 ) ) ( not ( = ?auto_759847 ?auto_759852 ) ) ( not ( = ?auto_759847 ?auto_759853 ) ) ( not ( = ?auto_759847 ?auto_759854 ) ) ( not ( = ?auto_759848 ?auto_759849 ) ) ( not ( = ?auto_759848 ?auto_759850 ) ) ( not ( = ?auto_759848 ?auto_759851 ) ) ( not ( = ?auto_759848 ?auto_759852 ) ) ( not ( = ?auto_759848 ?auto_759853 ) ) ( not ( = ?auto_759848 ?auto_759854 ) ) ( not ( = ?auto_759849 ?auto_759850 ) ) ( not ( = ?auto_759849 ?auto_759851 ) ) ( not ( = ?auto_759849 ?auto_759852 ) ) ( not ( = ?auto_759849 ?auto_759853 ) ) ( not ( = ?auto_759849 ?auto_759854 ) ) ( not ( = ?auto_759850 ?auto_759851 ) ) ( not ( = ?auto_759850 ?auto_759852 ) ) ( not ( = ?auto_759850 ?auto_759853 ) ) ( not ( = ?auto_759850 ?auto_759854 ) ) ( not ( = ?auto_759851 ?auto_759852 ) ) ( not ( = ?auto_759851 ?auto_759853 ) ) ( not ( = ?auto_759851 ?auto_759854 ) ) ( not ( = ?auto_759852 ?auto_759853 ) ) ( not ( = ?auto_759852 ?auto_759854 ) ) ( not ( = ?auto_759853 ?auto_759854 ) ) ( ON ?auto_759852 ?auto_759853 ) ( ON ?auto_759851 ?auto_759852 ) ( ON ?auto_759850 ?auto_759851 ) ( ON ?auto_759849 ?auto_759850 ) ( ON ?auto_759848 ?auto_759849 ) ( ON ?auto_759847 ?auto_759848 ) ( ON ?auto_759846 ?auto_759847 ) ( CLEAR ?auto_759844 ) ( ON ?auto_759845 ?auto_759846 ) ( CLEAR ?auto_759845 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_759842 ?auto_759843 ?auto_759844 ?auto_759845 )
      ( MAKE-12PILE ?auto_759842 ?auto_759843 ?auto_759844 ?auto_759845 ?auto_759846 ?auto_759847 ?auto_759848 ?auto_759849 ?auto_759850 ?auto_759851 ?auto_759852 ?auto_759853 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_759892 - BLOCK
      ?auto_759893 - BLOCK
      ?auto_759894 - BLOCK
      ?auto_759895 - BLOCK
      ?auto_759896 - BLOCK
      ?auto_759897 - BLOCK
      ?auto_759898 - BLOCK
      ?auto_759899 - BLOCK
      ?auto_759900 - BLOCK
      ?auto_759901 - BLOCK
      ?auto_759902 - BLOCK
      ?auto_759903 - BLOCK
    )
    :vars
    (
      ?auto_759904 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_759903 ?auto_759904 ) ( ON-TABLE ?auto_759892 ) ( ON ?auto_759893 ?auto_759892 ) ( not ( = ?auto_759892 ?auto_759893 ) ) ( not ( = ?auto_759892 ?auto_759894 ) ) ( not ( = ?auto_759892 ?auto_759895 ) ) ( not ( = ?auto_759892 ?auto_759896 ) ) ( not ( = ?auto_759892 ?auto_759897 ) ) ( not ( = ?auto_759892 ?auto_759898 ) ) ( not ( = ?auto_759892 ?auto_759899 ) ) ( not ( = ?auto_759892 ?auto_759900 ) ) ( not ( = ?auto_759892 ?auto_759901 ) ) ( not ( = ?auto_759892 ?auto_759902 ) ) ( not ( = ?auto_759892 ?auto_759903 ) ) ( not ( = ?auto_759892 ?auto_759904 ) ) ( not ( = ?auto_759893 ?auto_759894 ) ) ( not ( = ?auto_759893 ?auto_759895 ) ) ( not ( = ?auto_759893 ?auto_759896 ) ) ( not ( = ?auto_759893 ?auto_759897 ) ) ( not ( = ?auto_759893 ?auto_759898 ) ) ( not ( = ?auto_759893 ?auto_759899 ) ) ( not ( = ?auto_759893 ?auto_759900 ) ) ( not ( = ?auto_759893 ?auto_759901 ) ) ( not ( = ?auto_759893 ?auto_759902 ) ) ( not ( = ?auto_759893 ?auto_759903 ) ) ( not ( = ?auto_759893 ?auto_759904 ) ) ( not ( = ?auto_759894 ?auto_759895 ) ) ( not ( = ?auto_759894 ?auto_759896 ) ) ( not ( = ?auto_759894 ?auto_759897 ) ) ( not ( = ?auto_759894 ?auto_759898 ) ) ( not ( = ?auto_759894 ?auto_759899 ) ) ( not ( = ?auto_759894 ?auto_759900 ) ) ( not ( = ?auto_759894 ?auto_759901 ) ) ( not ( = ?auto_759894 ?auto_759902 ) ) ( not ( = ?auto_759894 ?auto_759903 ) ) ( not ( = ?auto_759894 ?auto_759904 ) ) ( not ( = ?auto_759895 ?auto_759896 ) ) ( not ( = ?auto_759895 ?auto_759897 ) ) ( not ( = ?auto_759895 ?auto_759898 ) ) ( not ( = ?auto_759895 ?auto_759899 ) ) ( not ( = ?auto_759895 ?auto_759900 ) ) ( not ( = ?auto_759895 ?auto_759901 ) ) ( not ( = ?auto_759895 ?auto_759902 ) ) ( not ( = ?auto_759895 ?auto_759903 ) ) ( not ( = ?auto_759895 ?auto_759904 ) ) ( not ( = ?auto_759896 ?auto_759897 ) ) ( not ( = ?auto_759896 ?auto_759898 ) ) ( not ( = ?auto_759896 ?auto_759899 ) ) ( not ( = ?auto_759896 ?auto_759900 ) ) ( not ( = ?auto_759896 ?auto_759901 ) ) ( not ( = ?auto_759896 ?auto_759902 ) ) ( not ( = ?auto_759896 ?auto_759903 ) ) ( not ( = ?auto_759896 ?auto_759904 ) ) ( not ( = ?auto_759897 ?auto_759898 ) ) ( not ( = ?auto_759897 ?auto_759899 ) ) ( not ( = ?auto_759897 ?auto_759900 ) ) ( not ( = ?auto_759897 ?auto_759901 ) ) ( not ( = ?auto_759897 ?auto_759902 ) ) ( not ( = ?auto_759897 ?auto_759903 ) ) ( not ( = ?auto_759897 ?auto_759904 ) ) ( not ( = ?auto_759898 ?auto_759899 ) ) ( not ( = ?auto_759898 ?auto_759900 ) ) ( not ( = ?auto_759898 ?auto_759901 ) ) ( not ( = ?auto_759898 ?auto_759902 ) ) ( not ( = ?auto_759898 ?auto_759903 ) ) ( not ( = ?auto_759898 ?auto_759904 ) ) ( not ( = ?auto_759899 ?auto_759900 ) ) ( not ( = ?auto_759899 ?auto_759901 ) ) ( not ( = ?auto_759899 ?auto_759902 ) ) ( not ( = ?auto_759899 ?auto_759903 ) ) ( not ( = ?auto_759899 ?auto_759904 ) ) ( not ( = ?auto_759900 ?auto_759901 ) ) ( not ( = ?auto_759900 ?auto_759902 ) ) ( not ( = ?auto_759900 ?auto_759903 ) ) ( not ( = ?auto_759900 ?auto_759904 ) ) ( not ( = ?auto_759901 ?auto_759902 ) ) ( not ( = ?auto_759901 ?auto_759903 ) ) ( not ( = ?auto_759901 ?auto_759904 ) ) ( not ( = ?auto_759902 ?auto_759903 ) ) ( not ( = ?auto_759902 ?auto_759904 ) ) ( not ( = ?auto_759903 ?auto_759904 ) ) ( ON ?auto_759902 ?auto_759903 ) ( ON ?auto_759901 ?auto_759902 ) ( ON ?auto_759900 ?auto_759901 ) ( ON ?auto_759899 ?auto_759900 ) ( ON ?auto_759898 ?auto_759899 ) ( ON ?auto_759897 ?auto_759898 ) ( ON ?auto_759896 ?auto_759897 ) ( ON ?auto_759895 ?auto_759896 ) ( CLEAR ?auto_759893 ) ( ON ?auto_759894 ?auto_759895 ) ( CLEAR ?auto_759894 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_759892 ?auto_759893 ?auto_759894 )
      ( MAKE-12PILE ?auto_759892 ?auto_759893 ?auto_759894 ?auto_759895 ?auto_759896 ?auto_759897 ?auto_759898 ?auto_759899 ?auto_759900 ?auto_759901 ?auto_759902 ?auto_759903 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_759942 - BLOCK
      ?auto_759943 - BLOCK
      ?auto_759944 - BLOCK
      ?auto_759945 - BLOCK
      ?auto_759946 - BLOCK
      ?auto_759947 - BLOCK
      ?auto_759948 - BLOCK
      ?auto_759949 - BLOCK
      ?auto_759950 - BLOCK
      ?auto_759951 - BLOCK
      ?auto_759952 - BLOCK
      ?auto_759953 - BLOCK
    )
    :vars
    (
      ?auto_759954 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_759953 ?auto_759954 ) ( ON-TABLE ?auto_759942 ) ( not ( = ?auto_759942 ?auto_759943 ) ) ( not ( = ?auto_759942 ?auto_759944 ) ) ( not ( = ?auto_759942 ?auto_759945 ) ) ( not ( = ?auto_759942 ?auto_759946 ) ) ( not ( = ?auto_759942 ?auto_759947 ) ) ( not ( = ?auto_759942 ?auto_759948 ) ) ( not ( = ?auto_759942 ?auto_759949 ) ) ( not ( = ?auto_759942 ?auto_759950 ) ) ( not ( = ?auto_759942 ?auto_759951 ) ) ( not ( = ?auto_759942 ?auto_759952 ) ) ( not ( = ?auto_759942 ?auto_759953 ) ) ( not ( = ?auto_759942 ?auto_759954 ) ) ( not ( = ?auto_759943 ?auto_759944 ) ) ( not ( = ?auto_759943 ?auto_759945 ) ) ( not ( = ?auto_759943 ?auto_759946 ) ) ( not ( = ?auto_759943 ?auto_759947 ) ) ( not ( = ?auto_759943 ?auto_759948 ) ) ( not ( = ?auto_759943 ?auto_759949 ) ) ( not ( = ?auto_759943 ?auto_759950 ) ) ( not ( = ?auto_759943 ?auto_759951 ) ) ( not ( = ?auto_759943 ?auto_759952 ) ) ( not ( = ?auto_759943 ?auto_759953 ) ) ( not ( = ?auto_759943 ?auto_759954 ) ) ( not ( = ?auto_759944 ?auto_759945 ) ) ( not ( = ?auto_759944 ?auto_759946 ) ) ( not ( = ?auto_759944 ?auto_759947 ) ) ( not ( = ?auto_759944 ?auto_759948 ) ) ( not ( = ?auto_759944 ?auto_759949 ) ) ( not ( = ?auto_759944 ?auto_759950 ) ) ( not ( = ?auto_759944 ?auto_759951 ) ) ( not ( = ?auto_759944 ?auto_759952 ) ) ( not ( = ?auto_759944 ?auto_759953 ) ) ( not ( = ?auto_759944 ?auto_759954 ) ) ( not ( = ?auto_759945 ?auto_759946 ) ) ( not ( = ?auto_759945 ?auto_759947 ) ) ( not ( = ?auto_759945 ?auto_759948 ) ) ( not ( = ?auto_759945 ?auto_759949 ) ) ( not ( = ?auto_759945 ?auto_759950 ) ) ( not ( = ?auto_759945 ?auto_759951 ) ) ( not ( = ?auto_759945 ?auto_759952 ) ) ( not ( = ?auto_759945 ?auto_759953 ) ) ( not ( = ?auto_759945 ?auto_759954 ) ) ( not ( = ?auto_759946 ?auto_759947 ) ) ( not ( = ?auto_759946 ?auto_759948 ) ) ( not ( = ?auto_759946 ?auto_759949 ) ) ( not ( = ?auto_759946 ?auto_759950 ) ) ( not ( = ?auto_759946 ?auto_759951 ) ) ( not ( = ?auto_759946 ?auto_759952 ) ) ( not ( = ?auto_759946 ?auto_759953 ) ) ( not ( = ?auto_759946 ?auto_759954 ) ) ( not ( = ?auto_759947 ?auto_759948 ) ) ( not ( = ?auto_759947 ?auto_759949 ) ) ( not ( = ?auto_759947 ?auto_759950 ) ) ( not ( = ?auto_759947 ?auto_759951 ) ) ( not ( = ?auto_759947 ?auto_759952 ) ) ( not ( = ?auto_759947 ?auto_759953 ) ) ( not ( = ?auto_759947 ?auto_759954 ) ) ( not ( = ?auto_759948 ?auto_759949 ) ) ( not ( = ?auto_759948 ?auto_759950 ) ) ( not ( = ?auto_759948 ?auto_759951 ) ) ( not ( = ?auto_759948 ?auto_759952 ) ) ( not ( = ?auto_759948 ?auto_759953 ) ) ( not ( = ?auto_759948 ?auto_759954 ) ) ( not ( = ?auto_759949 ?auto_759950 ) ) ( not ( = ?auto_759949 ?auto_759951 ) ) ( not ( = ?auto_759949 ?auto_759952 ) ) ( not ( = ?auto_759949 ?auto_759953 ) ) ( not ( = ?auto_759949 ?auto_759954 ) ) ( not ( = ?auto_759950 ?auto_759951 ) ) ( not ( = ?auto_759950 ?auto_759952 ) ) ( not ( = ?auto_759950 ?auto_759953 ) ) ( not ( = ?auto_759950 ?auto_759954 ) ) ( not ( = ?auto_759951 ?auto_759952 ) ) ( not ( = ?auto_759951 ?auto_759953 ) ) ( not ( = ?auto_759951 ?auto_759954 ) ) ( not ( = ?auto_759952 ?auto_759953 ) ) ( not ( = ?auto_759952 ?auto_759954 ) ) ( not ( = ?auto_759953 ?auto_759954 ) ) ( ON ?auto_759952 ?auto_759953 ) ( ON ?auto_759951 ?auto_759952 ) ( ON ?auto_759950 ?auto_759951 ) ( ON ?auto_759949 ?auto_759950 ) ( ON ?auto_759948 ?auto_759949 ) ( ON ?auto_759947 ?auto_759948 ) ( ON ?auto_759946 ?auto_759947 ) ( ON ?auto_759945 ?auto_759946 ) ( ON ?auto_759944 ?auto_759945 ) ( CLEAR ?auto_759942 ) ( ON ?auto_759943 ?auto_759944 ) ( CLEAR ?auto_759943 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_759942 ?auto_759943 )
      ( MAKE-12PILE ?auto_759942 ?auto_759943 ?auto_759944 ?auto_759945 ?auto_759946 ?auto_759947 ?auto_759948 ?auto_759949 ?auto_759950 ?auto_759951 ?auto_759952 ?auto_759953 ) )
  )

  ( :method MAKE-12PILE
    :parameters
    (
      ?auto_759992 - BLOCK
      ?auto_759993 - BLOCK
      ?auto_759994 - BLOCK
      ?auto_759995 - BLOCK
      ?auto_759996 - BLOCK
      ?auto_759997 - BLOCK
      ?auto_759998 - BLOCK
      ?auto_759999 - BLOCK
      ?auto_760000 - BLOCK
      ?auto_760001 - BLOCK
      ?auto_760002 - BLOCK
      ?auto_760003 - BLOCK
    )
    :vars
    (
      ?auto_760004 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_760003 ?auto_760004 ) ( not ( = ?auto_759992 ?auto_759993 ) ) ( not ( = ?auto_759992 ?auto_759994 ) ) ( not ( = ?auto_759992 ?auto_759995 ) ) ( not ( = ?auto_759992 ?auto_759996 ) ) ( not ( = ?auto_759992 ?auto_759997 ) ) ( not ( = ?auto_759992 ?auto_759998 ) ) ( not ( = ?auto_759992 ?auto_759999 ) ) ( not ( = ?auto_759992 ?auto_760000 ) ) ( not ( = ?auto_759992 ?auto_760001 ) ) ( not ( = ?auto_759992 ?auto_760002 ) ) ( not ( = ?auto_759992 ?auto_760003 ) ) ( not ( = ?auto_759992 ?auto_760004 ) ) ( not ( = ?auto_759993 ?auto_759994 ) ) ( not ( = ?auto_759993 ?auto_759995 ) ) ( not ( = ?auto_759993 ?auto_759996 ) ) ( not ( = ?auto_759993 ?auto_759997 ) ) ( not ( = ?auto_759993 ?auto_759998 ) ) ( not ( = ?auto_759993 ?auto_759999 ) ) ( not ( = ?auto_759993 ?auto_760000 ) ) ( not ( = ?auto_759993 ?auto_760001 ) ) ( not ( = ?auto_759993 ?auto_760002 ) ) ( not ( = ?auto_759993 ?auto_760003 ) ) ( not ( = ?auto_759993 ?auto_760004 ) ) ( not ( = ?auto_759994 ?auto_759995 ) ) ( not ( = ?auto_759994 ?auto_759996 ) ) ( not ( = ?auto_759994 ?auto_759997 ) ) ( not ( = ?auto_759994 ?auto_759998 ) ) ( not ( = ?auto_759994 ?auto_759999 ) ) ( not ( = ?auto_759994 ?auto_760000 ) ) ( not ( = ?auto_759994 ?auto_760001 ) ) ( not ( = ?auto_759994 ?auto_760002 ) ) ( not ( = ?auto_759994 ?auto_760003 ) ) ( not ( = ?auto_759994 ?auto_760004 ) ) ( not ( = ?auto_759995 ?auto_759996 ) ) ( not ( = ?auto_759995 ?auto_759997 ) ) ( not ( = ?auto_759995 ?auto_759998 ) ) ( not ( = ?auto_759995 ?auto_759999 ) ) ( not ( = ?auto_759995 ?auto_760000 ) ) ( not ( = ?auto_759995 ?auto_760001 ) ) ( not ( = ?auto_759995 ?auto_760002 ) ) ( not ( = ?auto_759995 ?auto_760003 ) ) ( not ( = ?auto_759995 ?auto_760004 ) ) ( not ( = ?auto_759996 ?auto_759997 ) ) ( not ( = ?auto_759996 ?auto_759998 ) ) ( not ( = ?auto_759996 ?auto_759999 ) ) ( not ( = ?auto_759996 ?auto_760000 ) ) ( not ( = ?auto_759996 ?auto_760001 ) ) ( not ( = ?auto_759996 ?auto_760002 ) ) ( not ( = ?auto_759996 ?auto_760003 ) ) ( not ( = ?auto_759996 ?auto_760004 ) ) ( not ( = ?auto_759997 ?auto_759998 ) ) ( not ( = ?auto_759997 ?auto_759999 ) ) ( not ( = ?auto_759997 ?auto_760000 ) ) ( not ( = ?auto_759997 ?auto_760001 ) ) ( not ( = ?auto_759997 ?auto_760002 ) ) ( not ( = ?auto_759997 ?auto_760003 ) ) ( not ( = ?auto_759997 ?auto_760004 ) ) ( not ( = ?auto_759998 ?auto_759999 ) ) ( not ( = ?auto_759998 ?auto_760000 ) ) ( not ( = ?auto_759998 ?auto_760001 ) ) ( not ( = ?auto_759998 ?auto_760002 ) ) ( not ( = ?auto_759998 ?auto_760003 ) ) ( not ( = ?auto_759998 ?auto_760004 ) ) ( not ( = ?auto_759999 ?auto_760000 ) ) ( not ( = ?auto_759999 ?auto_760001 ) ) ( not ( = ?auto_759999 ?auto_760002 ) ) ( not ( = ?auto_759999 ?auto_760003 ) ) ( not ( = ?auto_759999 ?auto_760004 ) ) ( not ( = ?auto_760000 ?auto_760001 ) ) ( not ( = ?auto_760000 ?auto_760002 ) ) ( not ( = ?auto_760000 ?auto_760003 ) ) ( not ( = ?auto_760000 ?auto_760004 ) ) ( not ( = ?auto_760001 ?auto_760002 ) ) ( not ( = ?auto_760001 ?auto_760003 ) ) ( not ( = ?auto_760001 ?auto_760004 ) ) ( not ( = ?auto_760002 ?auto_760003 ) ) ( not ( = ?auto_760002 ?auto_760004 ) ) ( not ( = ?auto_760003 ?auto_760004 ) ) ( ON ?auto_760002 ?auto_760003 ) ( ON ?auto_760001 ?auto_760002 ) ( ON ?auto_760000 ?auto_760001 ) ( ON ?auto_759999 ?auto_760000 ) ( ON ?auto_759998 ?auto_759999 ) ( ON ?auto_759997 ?auto_759998 ) ( ON ?auto_759996 ?auto_759997 ) ( ON ?auto_759995 ?auto_759996 ) ( ON ?auto_759994 ?auto_759995 ) ( ON ?auto_759993 ?auto_759994 ) ( ON ?auto_759992 ?auto_759993 ) ( CLEAR ?auto_759992 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_759992 )
      ( MAKE-12PILE ?auto_759992 ?auto_759993 ?auto_759994 ?auto_759995 ?auto_759996 ?auto_759997 ?auto_759998 ?auto_759999 ?auto_760000 ?auto_760001 ?auto_760002 ?auto_760003 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_760043 - BLOCK
      ?auto_760044 - BLOCK
      ?auto_760045 - BLOCK
      ?auto_760046 - BLOCK
      ?auto_760047 - BLOCK
      ?auto_760048 - BLOCK
      ?auto_760049 - BLOCK
      ?auto_760050 - BLOCK
      ?auto_760051 - BLOCK
      ?auto_760052 - BLOCK
      ?auto_760053 - BLOCK
      ?auto_760054 - BLOCK
      ?auto_760055 - BLOCK
    )
    :vars
    (
      ?auto_760056 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_760054 ) ( ON ?auto_760055 ?auto_760056 ) ( CLEAR ?auto_760055 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_760043 ) ( ON ?auto_760044 ?auto_760043 ) ( ON ?auto_760045 ?auto_760044 ) ( ON ?auto_760046 ?auto_760045 ) ( ON ?auto_760047 ?auto_760046 ) ( ON ?auto_760048 ?auto_760047 ) ( ON ?auto_760049 ?auto_760048 ) ( ON ?auto_760050 ?auto_760049 ) ( ON ?auto_760051 ?auto_760050 ) ( ON ?auto_760052 ?auto_760051 ) ( ON ?auto_760053 ?auto_760052 ) ( ON ?auto_760054 ?auto_760053 ) ( not ( = ?auto_760043 ?auto_760044 ) ) ( not ( = ?auto_760043 ?auto_760045 ) ) ( not ( = ?auto_760043 ?auto_760046 ) ) ( not ( = ?auto_760043 ?auto_760047 ) ) ( not ( = ?auto_760043 ?auto_760048 ) ) ( not ( = ?auto_760043 ?auto_760049 ) ) ( not ( = ?auto_760043 ?auto_760050 ) ) ( not ( = ?auto_760043 ?auto_760051 ) ) ( not ( = ?auto_760043 ?auto_760052 ) ) ( not ( = ?auto_760043 ?auto_760053 ) ) ( not ( = ?auto_760043 ?auto_760054 ) ) ( not ( = ?auto_760043 ?auto_760055 ) ) ( not ( = ?auto_760043 ?auto_760056 ) ) ( not ( = ?auto_760044 ?auto_760045 ) ) ( not ( = ?auto_760044 ?auto_760046 ) ) ( not ( = ?auto_760044 ?auto_760047 ) ) ( not ( = ?auto_760044 ?auto_760048 ) ) ( not ( = ?auto_760044 ?auto_760049 ) ) ( not ( = ?auto_760044 ?auto_760050 ) ) ( not ( = ?auto_760044 ?auto_760051 ) ) ( not ( = ?auto_760044 ?auto_760052 ) ) ( not ( = ?auto_760044 ?auto_760053 ) ) ( not ( = ?auto_760044 ?auto_760054 ) ) ( not ( = ?auto_760044 ?auto_760055 ) ) ( not ( = ?auto_760044 ?auto_760056 ) ) ( not ( = ?auto_760045 ?auto_760046 ) ) ( not ( = ?auto_760045 ?auto_760047 ) ) ( not ( = ?auto_760045 ?auto_760048 ) ) ( not ( = ?auto_760045 ?auto_760049 ) ) ( not ( = ?auto_760045 ?auto_760050 ) ) ( not ( = ?auto_760045 ?auto_760051 ) ) ( not ( = ?auto_760045 ?auto_760052 ) ) ( not ( = ?auto_760045 ?auto_760053 ) ) ( not ( = ?auto_760045 ?auto_760054 ) ) ( not ( = ?auto_760045 ?auto_760055 ) ) ( not ( = ?auto_760045 ?auto_760056 ) ) ( not ( = ?auto_760046 ?auto_760047 ) ) ( not ( = ?auto_760046 ?auto_760048 ) ) ( not ( = ?auto_760046 ?auto_760049 ) ) ( not ( = ?auto_760046 ?auto_760050 ) ) ( not ( = ?auto_760046 ?auto_760051 ) ) ( not ( = ?auto_760046 ?auto_760052 ) ) ( not ( = ?auto_760046 ?auto_760053 ) ) ( not ( = ?auto_760046 ?auto_760054 ) ) ( not ( = ?auto_760046 ?auto_760055 ) ) ( not ( = ?auto_760046 ?auto_760056 ) ) ( not ( = ?auto_760047 ?auto_760048 ) ) ( not ( = ?auto_760047 ?auto_760049 ) ) ( not ( = ?auto_760047 ?auto_760050 ) ) ( not ( = ?auto_760047 ?auto_760051 ) ) ( not ( = ?auto_760047 ?auto_760052 ) ) ( not ( = ?auto_760047 ?auto_760053 ) ) ( not ( = ?auto_760047 ?auto_760054 ) ) ( not ( = ?auto_760047 ?auto_760055 ) ) ( not ( = ?auto_760047 ?auto_760056 ) ) ( not ( = ?auto_760048 ?auto_760049 ) ) ( not ( = ?auto_760048 ?auto_760050 ) ) ( not ( = ?auto_760048 ?auto_760051 ) ) ( not ( = ?auto_760048 ?auto_760052 ) ) ( not ( = ?auto_760048 ?auto_760053 ) ) ( not ( = ?auto_760048 ?auto_760054 ) ) ( not ( = ?auto_760048 ?auto_760055 ) ) ( not ( = ?auto_760048 ?auto_760056 ) ) ( not ( = ?auto_760049 ?auto_760050 ) ) ( not ( = ?auto_760049 ?auto_760051 ) ) ( not ( = ?auto_760049 ?auto_760052 ) ) ( not ( = ?auto_760049 ?auto_760053 ) ) ( not ( = ?auto_760049 ?auto_760054 ) ) ( not ( = ?auto_760049 ?auto_760055 ) ) ( not ( = ?auto_760049 ?auto_760056 ) ) ( not ( = ?auto_760050 ?auto_760051 ) ) ( not ( = ?auto_760050 ?auto_760052 ) ) ( not ( = ?auto_760050 ?auto_760053 ) ) ( not ( = ?auto_760050 ?auto_760054 ) ) ( not ( = ?auto_760050 ?auto_760055 ) ) ( not ( = ?auto_760050 ?auto_760056 ) ) ( not ( = ?auto_760051 ?auto_760052 ) ) ( not ( = ?auto_760051 ?auto_760053 ) ) ( not ( = ?auto_760051 ?auto_760054 ) ) ( not ( = ?auto_760051 ?auto_760055 ) ) ( not ( = ?auto_760051 ?auto_760056 ) ) ( not ( = ?auto_760052 ?auto_760053 ) ) ( not ( = ?auto_760052 ?auto_760054 ) ) ( not ( = ?auto_760052 ?auto_760055 ) ) ( not ( = ?auto_760052 ?auto_760056 ) ) ( not ( = ?auto_760053 ?auto_760054 ) ) ( not ( = ?auto_760053 ?auto_760055 ) ) ( not ( = ?auto_760053 ?auto_760056 ) ) ( not ( = ?auto_760054 ?auto_760055 ) ) ( not ( = ?auto_760054 ?auto_760056 ) ) ( not ( = ?auto_760055 ?auto_760056 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_760055 ?auto_760056 )
      ( !STACK ?auto_760055 ?auto_760054 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_760097 - BLOCK
      ?auto_760098 - BLOCK
      ?auto_760099 - BLOCK
      ?auto_760100 - BLOCK
      ?auto_760101 - BLOCK
      ?auto_760102 - BLOCK
      ?auto_760103 - BLOCK
      ?auto_760104 - BLOCK
      ?auto_760105 - BLOCK
      ?auto_760106 - BLOCK
      ?auto_760107 - BLOCK
      ?auto_760108 - BLOCK
      ?auto_760109 - BLOCK
    )
    :vars
    (
      ?auto_760110 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_760109 ?auto_760110 ) ( ON-TABLE ?auto_760097 ) ( ON ?auto_760098 ?auto_760097 ) ( ON ?auto_760099 ?auto_760098 ) ( ON ?auto_760100 ?auto_760099 ) ( ON ?auto_760101 ?auto_760100 ) ( ON ?auto_760102 ?auto_760101 ) ( ON ?auto_760103 ?auto_760102 ) ( ON ?auto_760104 ?auto_760103 ) ( ON ?auto_760105 ?auto_760104 ) ( ON ?auto_760106 ?auto_760105 ) ( ON ?auto_760107 ?auto_760106 ) ( not ( = ?auto_760097 ?auto_760098 ) ) ( not ( = ?auto_760097 ?auto_760099 ) ) ( not ( = ?auto_760097 ?auto_760100 ) ) ( not ( = ?auto_760097 ?auto_760101 ) ) ( not ( = ?auto_760097 ?auto_760102 ) ) ( not ( = ?auto_760097 ?auto_760103 ) ) ( not ( = ?auto_760097 ?auto_760104 ) ) ( not ( = ?auto_760097 ?auto_760105 ) ) ( not ( = ?auto_760097 ?auto_760106 ) ) ( not ( = ?auto_760097 ?auto_760107 ) ) ( not ( = ?auto_760097 ?auto_760108 ) ) ( not ( = ?auto_760097 ?auto_760109 ) ) ( not ( = ?auto_760097 ?auto_760110 ) ) ( not ( = ?auto_760098 ?auto_760099 ) ) ( not ( = ?auto_760098 ?auto_760100 ) ) ( not ( = ?auto_760098 ?auto_760101 ) ) ( not ( = ?auto_760098 ?auto_760102 ) ) ( not ( = ?auto_760098 ?auto_760103 ) ) ( not ( = ?auto_760098 ?auto_760104 ) ) ( not ( = ?auto_760098 ?auto_760105 ) ) ( not ( = ?auto_760098 ?auto_760106 ) ) ( not ( = ?auto_760098 ?auto_760107 ) ) ( not ( = ?auto_760098 ?auto_760108 ) ) ( not ( = ?auto_760098 ?auto_760109 ) ) ( not ( = ?auto_760098 ?auto_760110 ) ) ( not ( = ?auto_760099 ?auto_760100 ) ) ( not ( = ?auto_760099 ?auto_760101 ) ) ( not ( = ?auto_760099 ?auto_760102 ) ) ( not ( = ?auto_760099 ?auto_760103 ) ) ( not ( = ?auto_760099 ?auto_760104 ) ) ( not ( = ?auto_760099 ?auto_760105 ) ) ( not ( = ?auto_760099 ?auto_760106 ) ) ( not ( = ?auto_760099 ?auto_760107 ) ) ( not ( = ?auto_760099 ?auto_760108 ) ) ( not ( = ?auto_760099 ?auto_760109 ) ) ( not ( = ?auto_760099 ?auto_760110 ) ) ( not ( = ?auto_760100 ?auto_760101 ) ) ( not ( = ?auto_760100 ?auto_760102 ) ) ( not ( = ?auto_760100 ?auto_760103 ) ) ( not ( = ?auto_760100 ?auto_760104 ) ) ( not ( = ?auto_760100 ?auto_760105 ) ) ( not ( = ?auto_760100 ?auto_760106 ) ) ( not ( = ?auto_760100 ?auto_760107 ) ) ( not ( = ?auto_760100 ?auto_760108 ) ) ( not ( = ?auto_760100 ?auto_760109 ) ) ( not ( = ?auto_760100 ?auto_760110 ) ) ( not ( = ?auto_760101 ?auto_760102 ) ) ( not ( = ?auto_760101 ?auto_760103 ) ) ( not ( = ?auto_760101 ?auto_760104 ) ) ( not ( = ?auto_760101 ?auto_760105 ) ) ( not ( = ?auto_760101 ?auto_760106 ) ) ( not ( = ?auto_760101 ?auto_760107 ) ) ( not ( = ?auto_760101 ?auto_760108 ) ) ( not ( = ?auto_760101 ?auto_760109 ) ) ( not ( = ?auto_760101 ?auto_760110 ) ) ( not ( = ?auto_760102 ?auto_760103 ) ) ( not ( = ?auto_760102 ?auto_760104 ) ) ( not ( = ?auto_760102 ?auto_760105 ) ) ( not ( = ?auto_760102 ?auto_760106 ) ) ( not ( = ?auto_760102 ?auto_760107 ) ) ( not ( = ?auto_760102 ?auto_760108 ) ) ( not ( = ?auto_760102 ?auto_760109 ) ) ( not ( = ?auto_760102 ?auto_760110 ) ) ( not ( = ?auto_760103 ?auto_760104 ) ) ( not ( = ?auto_760103 ?auto_760105 ) ) ( not ( = ?auto_760103 ?auto_760106 ) ) ( not ( = ?auto_760103 ?auto_760107 ) ) ( not ( = ?auto_760103 ?auto_760108 ) ) ( not ( = ?auto_760103 ?auto_760109 ) ) ( not ( = ?auto_760103 ?auto_760110 ) ) ( not ( = ?auto_760104 ?auto_760105 ) ) ( not ( = ?auto_760104 ?auto_760106 ) ) ( not ( = ?auto_760104 ?auto_760107 ) ) ( not ( = ?auto_760104 ?auto_760108 ) ) ( not ( = ?auto_760104 ?auto_760109 ) ) ( not ( = ?auto_760104 ?auto_760110 ) ) ( not ( = ?auto_760105 ?auto_760106 ) ) ( not ( = ?auto_760105 ?auto_760107 ) ) ( not ( = ?auto_760105 ?auto_760108 ) ) ( not ( = ?auto_760105 ?auto_760109 ) ) ( not ( = ?auto_760105 ?auto_760110 ) ) ( not ( = ?auto_760106 ?auto_760107 ) ) ( not ( = ?auto_760106 ?auto_760108 ) ) ( not ( = ?auto_760106 ?auto_760109 ) ) ( not ( = ?auto_760106 ?auto_760110 ) ) ( not ( = ?auto_760107 ?auto_760108 ) ) ( not ( = ?auto_760107 ?auto_760109 ) ) ( not ( = ?auto_760107 ?auto_760110 ) ) ( not ( = ?auto_760108 ?auto_760109 ) ) ( not ( = ?auto_760108 ?auto_760110 ) ) ( not ( = ?auto_760109 ?auto_760110 ) ) ( CLEAR ?auto_760107 ) ( ON ?auto_760108 ?auto_760109 ) ( CLEAR ?auto_760108 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_760097 ?auto_760098 ?auto_760099 ?auto_760100 ?auto_760101 ?auto_760102 ?auto_760103 ?auto_760104 ?auto_760105 ?auto_760106 ?auto_760107 ?auto_760108 )
      ( MAKE-13PILE ?auto_760097 ?auto_760098 ?auto_760099 ?auto_760100 ?auto_760101 ?auto_760102 ?auto_760103 ?auto_760104 ?auto_760105 ?auto_760106 ?auto_760107 ?auto_760108 ?auto_760109 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_760151 - BLOCK
      ?auto_760152 - BLOCK
      ?auto_760153 - BLOCK
      ?auto_760154 - BLOCK
      ?auto_760155 - BLOCK
      ?auto_760156 - BLOCK
      ?auto_760157 - BLOCK
      ?auto_760158 - BLOCK
      ?auto_760159 - BLOCK
      ?auto_760160 - BLOCK
      ?auto_760161 - BLOCK
      ?auto_760162 - BLOCK
      ?auto_760163 - BLOCK
    )
    :vars
    (
      ?auto_760164 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_760163 ?auto_760164 ) ( ON-TABLE ?auto_760151 ) ( ON ?auto_760152 ?auto_760151 ) ( ON ?auto_760153 ?auto_760152 ) ( ON ?auto_760154 ?auto_760153 ) ( ON ?auto_760155 ?auto_760154 ) ( ON ?auto_760156 ?auto_760155 ) ( ON ?auto_760157 ?auto_760156 ) ( ON ?auto_760158 ?auto_760157 ) ( ON ?auto_760159 ?auto_760158 ) ( ON ?auto_760160 ?auto_760159 ) ( not ( = ?auto_760151 ?auto_760152 ) ) ( not ( = ?auto_760151 ?auto_760153 ) ) ( not ( = ?auto_760151 ?auto_760154 ) ) ( not ( = ?auto_760151 ?auto_760155 ) ) ( not ( = ?auto_760151 ?auto_760156 ) ) ( not ( = ?auto_760151 ?auto_760157 ) ) ( not ( = ?auto_760151 ?auto_760158 ) ) ( not ( = ?auto_760151 ?auto_760159 ) ) ( not ( = ?auto_760151 ?auto_760160 ) ) ( not ( = ?auto_760151 ?auto_760161 ) ) ( not ( = ?auto_760151 ?auto_760162 ) ) ( not ( = ?auto_760151 ?auto_760163 ) ) ( not ( = ?auto_760151 ?auto_760164 ) ) ( not ( = ?auto_760152 ?auto_760153 ) ) ( not ( = ?auto_760152 ?auto_760154 ) ) ( not ( = ?auto_760152 ?auto_760155 ) ) ( not ( = ?auto_760152 ?auto_760156 ) ) ( not ( = ?auto_760152 ?auto_760157 ) ) ( not ( = ?auto_760152 ?auto_760158 ) ) ( not ( = ?auto_760152 ?auto_760159 ) ) ( not ( = ?auto_760152 ?auto_760160 ) ) ( not ( = ?auto_760152 ?auto_760161 ) ) ( not ( = ?auto_760152 ?auto_760162 ) ) ( not ( = ?auto_760152 ?auto_760163 ) ) ( not ( = ?auto_760152 ?auto_760164 ) ) ( not ( = ?auto_760153 ?auto_760154 ) ) ( not ( = ?auto_760153 ?auto_760155 ) ) ( not ( = ?auto_760153 ?auto_760156 ) ) ( not ( = ?auto_760153 ?auto_760157 ) ) ( not ( = ?auto_760153 ?auto_760158 ) ) ( not ( = ?auto_760153 ?auto_760159 ) ) ( not ( = ?auto_760153 ?auto_760160 ) ) ( not ( = ?auto_760153 ?auto_760161 ) ) ( not ( = ?auto_760153 ?auto_760162 ) ) ( not ( = ?auto_760153 ?auto_760163 ) ) ( not ( = ?auto_760153 ?auto_760164 ) ) ( not ( = ?auto_760154 ?auto_760155 ) ) ( not ( = ?auto_760154 ?auto_760156 ) ) ( not ( = ?auto_760154 ?auto_760157 ) ) ( not ( = ?auto_760154 ?auto_760158 ) ) ( not ( = ?auto_760154 ?auto_760159 ) ) ( not ( = ?auto_760154 ?auto_760160 ) ) ( not ( = ?auto_760154 ?auto_760161 ) ) ( not ( = ?auto_760154 ?auto_760162 ) ) ( not ( = ?auto_760154 ?auto_760163 ) ) ( not ( = ?auto_760154 ?auto_760164 ) ) ( not ( = ?auto_760155 ?auto_760156 ) ) ( not ( = ?auto_760155 ?auto_760157 ) ) ( not ( = ?auto_760155 ?auto_760158 ) ) ( not ( = ?auto_760155 ?auto_760159 ) ) ( not ( = ?auto_760155 ?auto_760160 ) ) ( not ( = ?auto_760155 ?auto_760161 ) ) ( not ( = ?auto_760155 ?auto_760162 ) ) ( not ( = ?auto_760155 ?auto_760163 ) ) ( not ( = ?auto_760155 ?auto_760164 ) ) ( not ( = ?auto_760156 ?auto_760157 ) ) ( not ( = ?auto_760156 ?auto_760158 ) ) ( not ( = ?auto_760156 ?auto_760159 ) ) ( not ( = ?auto_760156 ?auto_760160 ) ) ( not ( = ?auto_760156 ?auto_760161 ) ) ( not ( = ?auto_760156 ?auto_760162 ) ) ( not ( = ?auto_760156 ?auto_760163 ) ) ( not ( = ?auto_760156 ?auto_760164 ) ) ( not ( = ?auto_760157 ?auto_760158 ) ) ( not ( = ?auto_760157 ?auto_760159 ) ) ( not ( = ?auto_760157 ?auto_760160 ) ) ( not ( = ?auto_760157 ?auto_760161 ) ) ( not ( = ?auto_760157 ?auto_760162 ) ) ( not ( = ?auto_760157 ?auto_760163 ) ) ( not ( = ?auto_760157 ?auto_760164 ) ) ( not ( = ?auto_760158 ?auto_760159 ) ) ( not ( = ?auto_760158 ?auto_760160 ) ) ( not ( = ?auto_760158 ?auto_760161 ) ) ( not ( = ?auto_760158 ?auto_760162 ) ) ( not ( = ?auto_760158 ?auto_760163 ) ) ( not ( = ?auto_760158 ?auto_760164 ) ) ( not ( = ?auto_760159 ?auto_760160 ) ) ( not ( = ?auto_760159 ?auto_760161 ) ) ( not ( = ?auto_760159 ?auto_760162 ) ) ( not ( = ?auto_760159 ?auto_760163 ) ) ( not ( = ?auto_760159 ?auto_760164 ) ) ( not ( = ?auto_760160 ?auto_760161 ) ) ( not ( = ?auto_760160 ?auto_760162 ) ) ( not ( = ?auto_760160 ?auto_760163 ) ) ( not ( = ?auto_760160 ?auto_760164 ) ) ( not ( = ?auto_760161 ?auto_760162 ) ) ( not ( = ?auto_760161 ?auto_760163 ) ) ( not ( = ?auto_760161 ?auto_760164 ) ) ( not ( = ?auto_760162 ?auto_760163 ) ) ( not ( = ?auto_760162 ?auto_760164 ) ) ( not ( = ?auto_760163 ?auto_760164 ) ) ( ON ?auto_760162 ?auto_760163 ) ( CLEAR ?auto_760160 ) ( ON ?auto_760161 ?auto_760162 ) ( CLEAR ?auto_760161 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_760151 ?auto_760152 ?auto_760153 ?auto_760154 ?auto_760155 ?auto_760156 ?auto_760157 ?auto_760158 ?auto_760159 ?auto_760160 ?auto_760161 )
      ( MAKE-13PILE ?auto_760151 ?auto_760152 ?auto_760153 ?auto_760154 ?auto_760155 ?auto_760156 ?auto_760157 ?auto_760158 ?auto_760159 ?auto_760160 ?auto_760161 ?auto_760162 ?auto_760163 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_760205 - BLOCK
      ?auto_760206 - BLOCK
      ?auto_760207 - BLOCK
      ?auto_760208 - BLOCK
      ?auto_760209 - BLOCK
      ?auto_760210 - BLOCK
      ?auto_760211 - BLOCK
      ?auto_760212 - BLOCK
      ?auto_760213 - BLOCK
      ?auto_760214 - BLOCK
      ?auto_760215 - BLOCK
      ?auto_760216 - BLOCK
      ?auto_760217 - BLOCK
    )
    :vars
    (
      ?auto_760218 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_760217 ?auto_760218 ) ( ON-TABLE ?auto_760205 ) ( ON ?auto_760206 ?auto_760205 ) ( ON ?auto_760207 ?auto_760206 ) ( ON ?auto_760208 ?auto_760207 ) ( ON ?auto_760209 ?auto_760208 ) ( ON ?auto_760210 ?auto_760209 ) ( ON ?auto_760211 ?auto_760210 ) ( ON ?auto_760212 ?auto_760211 ) ( ON ?auto_760213 ?auto_760212 ) ( not ( = ?auto_760205 ?auto_760206 ) ) ( not ( = ?auto_760205 ?auto_760207 ) ) ( not ( = ?auto_760205 ?auto_760208 ) ) ( not ( = ?auto_760205 ?auto_760209 ) ) ( not ( = ?auto_760205 ?auto_760210 ) ) ( not ( = ?auto_760205 ?auto_760211 ) ) ( not ( = ?auto_760205 ?auto_760212 ) ) ( not ( = ?auto_760205 ?auto_760213 ) ) ( not ( = ?auto_760205 ?auto_760214 ) ) ( not ( = ?auto_760205 ?auto_760215 ) ) ( not ( = ?auto_760205 ?auto_760216 ) ) ( not ( = ?auto_760205 ?auto_760217 ) ) ( not ( = ?auto_760205 ?auto_760218 ) ) ( not ( = ?auto_760206 ?auto_760207 ) ) ( not ( = ?auto_760206 ?auto_760208 ) ) ( not ( = ?auto_760206 ?auto_760209 ) ) ( not ( = ?auto_760206 ?auto_760210 ) ) ( not ( = ?auto_760206 ?auto_760211 ) ) ( not ( = ?auto_760206 ?auto_760212 ) ) ( not ( = ?auto_760206 ?auto_760213 ) ) ( not ( = ?auto_760206 ?auto_760214 ) ) ( not ( = ?auto_760206 ?auto_760215 ) ) ( not ( = ?auto_760206 ?auto_760216 ) ) ( not ( = ?auto_760206 ?auto_760217 ) ) ( not ( = ?auto_760206 ?auto_760218 ) ) ( not ( = ?auto_760207 ?auto_760208 ) ) ( not ( = ?auto_760207 ?auto_760209 ) ) ( not ( = ?auto_760207 ?auto_760210 ) ) ( not ( = ?auto_760207 ?auto_760211 ) ) ( not ( = ?auto_760207 ?auto_760212 ) ) ( not ( = ?auto_760207 ?auto_760213 ) ) ( not ( = ?auto_760207 ?auto_760214 ) ) ( not ( = ?auto_760207 ?auto_760215 ) ) ( not ( = ?auto_760207 ?auto_760216 ) ) ( not ( = ?auto_760207 ?auto_760217 ) ) ( not ( = ?auto_760207 ?auto_760218 ) ) ( not ( = ?auto_760208 ?auto_760209 ) ) ( not ( = ?auto_760208 ?auto_760210 ) ) ( not ( = ?auto_760208 ?auto_760211 ) ) ( not ( = ?auto_760208 ?auto_760212 ) ) ( not ( = ?auto_760208 ?auto_760213 ) ) ( not ( = ?auto_760208 ?auto_760214 ) ) ( not ( = ?auto_760208 ?auto_760215 ) ) ( not ( = ?auto_760208 ?auto_760216 ) ) ( not ( = ?auto_760208 ?auto_760217 ) ) ( not ( = ?auto_760208 ?auto_760218 ) ) ( not ( = ?auto_760209 ?auto_760210 ) ) ( not ( = ?auto_760209 ?auto_760211 ) ) ( not ( = ?auto_760209 ?auto_760212 ) ) ( not ( = ?auto_760209 ?auto_760213 ) ) ( not ( = ?auto_760209 ?auto_760214 ) ) ( not ( = ?auto_760209 ?auto_760215 ) ) ( not ( = ?auto_760209 ?auto_760216 ) ) ( not ( = ?auto_760209 ?auto_760217 ) ) ( not ( = ?auto_760209 ?auto_760218 ) ) ( not ( = ?auto_760210 ?auto_760211 ) ) ( not ( = ?auto_760210 ?auto_760212 ) ) ( not ( = ?auto_760210 ?auto_760213 ) ) ( not ( = ?auto_760210 ?auto_760214 ) ) ( not ( = ?auto_760210 ?auto_760215 ) ) ( not ( = ?auto_760210 ?auto_760216 ) ) ( not ( = ?auto_760210 ?auto_760217 ) ) ( not ( = ?auto_760210 ?auto_760218 ) ) ( not ( = ?auto_760211 ?auto_760212 ) ) ( not ( = ?auto_760211 ?auto_760213 ) ) ( not ( = ?auto_760211 ?auto_760214 ) ) ( not ( = ?auto_760211 ?auto_760215 ) ) ( not ( = ?auto_760211 ?auto_760216 ) ) ( not ( = ?auto_760211 ?auto_760217 ) ) ( not ( = ?auto_760211 ?auto_760218 ) ) ( not ( = ?auto_760212 ?auto_760213 ) ) ( not ( = ?auto_760212 ?auto_760214 ) ) ( not ( = ?auto_760212 ?auto_760215 ) ) ( not ( = ?auto_760212 ?auto_760216 ) ) ( not ( = ?auto_760212 ?auto_760217 ) ) ( not ( = ?auto_760212 ?auto_760218 ) ) ( not ( = ?auto_760213 ?auto_760214 ) ) ( not ( = ?auto_760213 ?auto_760215 ) ) ( not ( = ?auto_760213 ?auto_760216 ) ) ( not ( = ?auto_760213 ?auto_760217 ) ) ( not ( = ?auto_760213 ?auto_760218 ) ) ( not ( = ?auto_760214 ?auto_760215 ) ) ( not ( = ?auto_760214 ?auto_760216 ) ) ( not ( = ?auto_760214 ?auto_760217 ) ) ( not ( = ?auto_760214 ?auto_760218 ) ) ( not ( = ?auto_760215 ?auto_760216 ) ) ( not ( = ?auto_760215 ?auto_760217 ) ) ( not ( = ?auto_760215 ?auto_760218 ) ) ( not ( = ?auto_760216 ?auto_760217 ) ) ( not ( = ?auto_760216 ?auto_760218 ) ) ( not ( = ?auto_760217 ?auto_760218 ) ) ( ON ?auto_760216 ?auto_760217 ) ( ON ?auto_760215 ?auto_760216 ) ( CLEAR ?auto_760213 ) ( ON ?auto_760214 ?auto_760215 ) ( CLEAR ?auto_760214 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_760205 ?auto_760206 ?auto_760207 ?auto_760208 ?auto_760209 ?auto_760210 ?auto_760211 ?auto_760212 ?auto_760213 ?auto_760214 )
      ( MAKE-13PILE ?auto_760205 ?auto_760206 ?auto_760207 ?auto_760208 ?auto_760209 ?auto_760210 ?auto_760211 ?auto_760212 ?auto_760213 ?auto_760214 ?auto_760215 ?auto_760216 ?auto_760217 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_760259 - BLOCK
      ?auto_760260 - BLOCK
      ?auto_760261 - BLOCK
      ?auto_760262 - BLOCK
      ?auto_760263 - BLOCK
      ?auto_760264 - BLOCK
      ?auto_760265 - BLOCK
      ?auto_760266 - BLOCK
      ?auto_760267 - BLOCK
      ?auto_760268 - BLOCK
      ?auto_760269 - BLOCK
      ?auto_760270 - BLOCK
      ?auto_760271 - BLOCK
    )
    :vars
    (
      ?auto_760272 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_760271 ?auto_760272 ) ( ON-TABLE ?auto_760259 ) ( ON ?auto_760260 ?auto_760259 ) ( ON ?auto_760261 ?auto_760260 ) ( ON ?auto_760262 ?auto_760261 ) ( ON ?auto_760263 ?auto_760262 ) ( ON ?auto_760264 ?auto_760263 ) ( ON ?auto_760265 ?auto_760264 ) ( ON ?auto_760266 ?auto_760265 ) ( not ( = ?auto_760259 ?auto_760260 ) ) ( not ( = ?auto_760259 ?auto_760261 ) ) ( not ( = ?auto_760259 ?auto_760262 ) ) ( not ( = ?auto_760259 ?auto_760263 ) ) ( not ( = ?auto_760259 ?auto_760264 ) ) ( not ( = ?auto_760259 ?auto_760265 ) ) ( not ( = ?auto_760259 ?auto_760266 ) ) ( not ( = ?auto_760259 ?auto_760267 ) ) ( not ( = ?auto_760259 ?auto_760268 ) ) ( not ( = ?auto_760259 ?auto_760269 ) ) ( not ( = ?auto_760259 ?auto_760270 ) ) ( not ( = ?auto_760259 ?auto_760271 ) ) ( not ( = ?auto_760259 ?auto_760272 ) ) ( not ( = ?auto_760260 ?auto_760261 ) ) ( not ( = ?auto_760260 ?auto_760262 ) ) ( not ( = ?auto_760260 ?auto_760263 ) ) ( not ( = ?auto_760260 ?auto_760264 ) ) ( not ( = ?auto_760260 ?auto_760265 ) ) ( not ( = ?auto_760260 ?auto_760266 ) ) ( not ( = ?auto_760260 ?auto_760267 ) ) ( not ( = ?auto_760260 ?auto_760268 ) ) ( not ( = ?auto_760260 ?auto_760269 ) ) ( not ( = ?auto_760260 ?auto_760270 ) ) ( not ( = ?auto_760260 ?auto_760271 ) ) ( not ( = ?auto_760260 ?auto_760272 ) ) ( not ( = ?auto_760261 ?auto_760262 ) ) ( not ( = ?auto_760261 ?auto_760263 ) ) ( not ( = ?auto_760261 ?auto_760264 ) ) ( not ( = ?auto_760261 ?auto_760265 ) ) ( not ( = ?auto_760261 ?auto_760266 ) ) ( not ( = ?auto_760261 ?auto_760267 ) ) ( not ( = ?auto_760261 ?auto_760268 ) ) ( not ( = ?auto_760261 ?auto_760269 ) ) ( not ( = ?auto_760261 ?auto_760270 ) ) ( not ( = ?auto_760261 ?auto_760271 ) ) ( not ( = ?auto_760261 ?auto_760272 ) ) ( not ( = ?auto_760262 ?auto_760263 ) ) ( not ( = ?auto_760262 ?auto_760264 ) ) ( not ( = ?auto_760262 ?auto_760265 ) ) ( not ( = ?auto_760262 ?auto_760266 ) ) ( not ( = ?auto_760262 ?auto_760267 ) ) ( not ( = ?auto_760262 ?auto_760268 ) ) ( not ( = ?auto_760262 ?auto_760269 ) ) ( not ( = ?auto_760262 ?auto_760270 ) ) ( not ( = ?auto_760262 ?auto_760271 ) ) ( not ( = ?auto_760262 ?auto_760272 ) ) ( not ( = ?auto_760263 ?auto_760264 ) ) ( not ( = ?auto_760263 ?auto_760265 ) ) ( not ( = ?auto_760263 ?auto_760266 ) ) ( not ( = ?auto_760263 ?auto_760267 ) ) ( not ( = ?auto_760263 ?auto_760268 ) ) ( not ( = ?auto_760263 ?auto_760269 ) ) ( not ( = ?auto_760263 ?auto_760270 ) ) ( not ( = ?auto_760263 ?auto_760271 ) ) ( not ( = ?auto_760263 ?auto_760272 ) ) ( not ( = ?auto_760264 ?auto_760265 ) ) ( not ( = ?auto_760264 ?auto_760266 ) ) ( not ( = ?auto_760264 ?auto_760267 ) ) ( not ( = ?auto_760264 ?auto_760268 ) ) ( not ( = ?auto_760264 ?auto_760269 ) ) ( not ( = ?auto_760264 ?auto_760270 ) ) ( not ( = ?auto_760264 ?auto_760271 ) ) ( not ( = ?auto_760264 ?auto_760272 ) ) ( not ( = ?auto_760265 ?auto_760266 ) ) ( not ( = ?auto_760265 ?auto_760267 ) ) ( not ( = ?auto_760265 ?auto_760268 ) ) ( not ( = ?auto_760265 ?auto_760269 ) ) ( not ( = ?auto_760265 ?auto_760270 ) ) ( not ( = ?auto_760265 ?auto_760271 ) ) ( not ( = ?auto_760265 ?auto_760272 ) ) ( not ( = ?auto_760266 ?auto_760267 ) ) ( not ( = ?auto_760266 ?auto_760268 ) ) ( not ( = ?auto_760266 ?auto_760269 ) ) ( not ( = ?auto_760266 ?auto_760270 ) ) ( not ( = ?auto_760266 ?auto_760271 ) ) ( not ( = ?auto_760266 ?auto_760272 ) ) ( not ( = ?auto_760267 ?auto_760268 ) ) ( not ( = ?auto_760267 ?auto_760269 ) ) ( not ( = ?auto_760267 ?auto_760270 ) ) ( not ( = ?auto_760267 ?auto_760271 ) ) ( not ( = ?auto_760267 ?auto_760272 ) ) ( not ( = ?auto_760268 ?auto_760269 ) ) ( not ( = ?auto_760268 ?auto_760270 ) ) ( not ( = ?auto_760268 ?auto_760271 ) ) ( not ( = ?auto_760268 ?auto_760272 ) ) ( not ( = ?auto_760269 ?auto_760270 ) ) ( not ( = ?auto_760269 ?auto_760271 ) ) ( not ( = ?auto_760269 ?auto_760272 ) ) ( not ( = ?auto_760270 ?auto_760271 ) ) ( not ( = ?auto_760270 ?auto_760272 ) ) ( not ( = ?auto_760271 ?auto_760272 ) ) ( ON ?auto_760270 ?auto_760271 ) ( ON ?auto_760269 ?auto_760270 ) ( ON ?auto_760268 ?auto_760269 ) ( CLEAR ?auto_760266 ) ( ON ?auto_760267 ?auto_760268 ) ( CLEAR ?auto_760267 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_760259 ?auto_760260 ?auto_760261 ?auto_760262 ?auto_760263 ?auto_760264 ?auto_760265 ?auto_760266 ?auto_760267 )
      ( MAKE-13PILE ?auto_760259 ?auto_760260 ?auto_760261 ?auto_760262 ?auto_760263 ?auto_760264 ?auto_760265 ?auto_760266 ?auto_760267 ?auto_760268 ?auto_760269 ?auto_760270 ?auto_760271 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_760313 - BLOCK
      ?auto_760314 - BLOCK
      ?auto_760315 - BLOCK
      ?auto_760316 - BLOCK
      ?auto_760317 - BLOCK
      ?auto_760318 - BLOCK
      ?auto_760319 - BLOCK
      ?auto_760320 - BLOCK
      ?auto_760321 - BLOCK
      ?auto_760322 - BLOCK
      ?auto_760323 - BLOCK
      ?auto_760324 - BLOCK
      ?auto_760325 - BLOCK
    )
    :vars
    (
      ?auto_760326 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_760325 ?auto_760326 ) ( ON-TABLE ?auto_760313 ) ( ON ?auto_760314 ?auto_760313 ) ( ON ?auto_760315 ?auto_760314 ) ( ON ?auto_760316 ?auto_760315 ) ( ON ?auto_760317 ?auto_760316 ) ( ON ?auto_760318 ?auto_760317 ) ( ON ?auto_760319 ?auto_760318 ) ( not ( = ?auto_760313 ?auto_760314 ) ) ( not ( = ?auto_760313 ?auto_760315 ) ) ( not ( = ?auto_760313 ?auto_760316 ) ) ( not ( = ?auto_760313 ?auto_760317 ) ) ( not ( = ?auto_760313 ?auto_760318 ) ) ( not ( = ?auto_760313 ?auto_760319 ) ) ( not ( = ?auto_760313 ?auto_760320 ) ) ( not ( = ?auto_760313 ?auto_760321 ) ) ( not ( = ?auto_760313 ?auto_760322 ) ) ( not ( = ?auto_760313 ?auto_760323 ) ) ( not ( = ?auto_760313 ?auto_760324 ) ) ( not ( = ?auto_760313 ?auto_760325 ) ) ( not ( = ?auto_760313 ?auto_760326 ) ) ( not ( = ?auto_760314 ?auto_760315 ) ) ( not ( = ?auto_760314 ?auto_760316 ) ) ( not ( = ?auto_760314 ?auto_760317 ) ) ( not ( = ?auto_760314 ?auto_760318 ) ) ( not ( = ?auto_760314 ?auto_760319 ) ) ( not ( = ?auto_760314 ?auto_760320 ) ) ( not ( = ?auto_760314 ?auto_760321 ) ) ( not ( = ?auto_760314 ?auto_760322 ) ) ( not ( = ?auto_760314 ?auto_760323 ) ) ( not ( = ?auto_760314 ?auto_760324 ) ) ( not ( = ?auto_760314 ?auto_760325 ) ) ( not ( = ?auto_760314 ?auto_760326 ) ) ( not ( = ?auto_760315 ?auto_760316 ) ) ( not ( = ?auto_760315 ?auto_760317 ) ) ( not ( = ?auto_760315 ?auto_760318 ) ) ( not ( = ?auto_760315 ?auto_760319 ) ) ( not ( = ?auto_760315 ?auto_760320 ) ) ( not ( = ?auto_760315 ?auto_760321 ) ) ( not ( = ?auto_760315 ?auto_760322 ) ) ( not ( = ?auto_760315 ?auto_760323 ) ) ( not ( = ?auto_760315 ?auto_760324 ) ) ( not ( = ?auto_760315 ?auto_760325 ) ) ( not ( = ?auto_760315 ?auto_760326 ) ) ( not ( = ?auto_760316 ?auto_760317 ) ) ( not ( = ?auto_760316 ?auto_760318 ) ) ( not ( = ?auto_760316 ?auto_760319 ) ) ( not ( = ?auto_760316 ?auto_760320 ) ) ( not ( = ?auto_760316 ?auto_760321 ) ) ( not ( = ?auto_760316 ?auto_760322 ) ) ( not ( = ?auto_760316 ?auto_760323 ) ) ( not ( = ?auto_760316 ?auto_760324 ) ) ( not ( = ?auto_760316 ?auto_760325 ) ) ( not ( = ?auto_760316 ?auto_760326 ) ) ( not ( = ?auto_760317 ?auto_760318 ) ) ( not ( = ?auto_760317 ?auto_760319 ) ) ( not ( = ?auto_760317 ?auto_760320 ) ) ( not ( = ?auto_760317 ?auto_760321 ) ) ( not ( = ?auto_760317 ?auto_760322 ) ) ( not ( = ?auto_760317 ?auto_760323 ) ) ( not ( = ?auto_760317 ?auto_760324 ) ) ( not ( = ?auto_760317 ?auto_760325 ) ) ( not ( = ?auto_760317 ?auto_760326 ) ) ( not ( = ?auto_760318 ?auto_760319 ) ) ( not ( = ?auto_760318 ?auto_760320 ) ) ( not ( = ?auto_760318 ?auto_760321 ) ) ( not ( = ?auto_760318 ?auto_760322 ) ) ( not ( = ?auto_760318 ?auto_760323 ) ) ( not ( = ?auto_760318 ?auto_760324 ) ) ( not ( = ?auto_760318 ?auto_760325 ) ) ( not ( = ?auto_760318 ?auto_760326 ) ) ( not ( = ?auto_760319 ?auto_760320 ) ) ( not ( = ?auto_760319 ?auto_760321 ) ) ( not ( = ?auto_760319 ?auto_760322 ) ) ( not ( = ?auto_760319 ?auto_760323 ) ) ( not ( = ?auto_760319 ?auto_760324 ) ) ( not ( = ?auto_760319 ?auto_760325 ) ) ( not ( = ?auto_760319 ?auto_760326 ) ) ( not ( = ?auto_760320 ?auto_760321 ) ) ( not ( = ?auto_760320 ?auto_760322 ) ) ( not ( = ?auto_760320 ?auto_760323 ) ) ( not ( = ?auto_760320 ?auto_760324 ) ) ( not ( = ?auto_760320 ?auto_760325 ) ) ( not ( = ?auto_760320 ?auto_760326 ) ) ( not ( = ?auto_760321 ?auto_760322 ) ) ( not ( = ?auto_760321 ?auto_760323 ) ) ( not ( = ?auto_760321 ?auto_760324 ) ) ( not ( = ?auto_760321 ?auto_760325 ) ) ( not ( = ?auto_760321 ?auto_760326 ) ) ( not ( = ?auto_760322 ?auto_760323 ) ) ( not ( = ?auto_760322 ?auto_760324 ) ) ( not ( = ?auto_760322 ?auto_760325 ) ) ( not ( = ?auto_760322 ?auto_760326 ) ) ( not ( = ?auto_760323 ?auto_760324 ) ) ( not ( = ?auto_760323 ?auto_760325 ) ) ( not ( = ?auto_760323 ?auto_760326 ) ) ( not ( = ?auto_760324 ?auto_760325 ) ) ( not ( = ?auto_760324 ?auto_760326 ) ) ( not ( = ?auto_760325 ?auto_760326 ) ) ( ON ?auto_760324 ?auto_760325 ) ( ON ?auto_760323 ?auto_760324 ) ( ON ?auto_760322 ?auto_760323 ) ( ON ?auto_760321 ?auto_760322 ) ( CLEAR ?auto_760319 ) ( ON ?auto_760320 ?auto_760321 ) ( CLEAR ?auto_760320 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_760313 ?auto_760314 ?auto_760315 ?auto_760316 ?auto_760317 ?auto_760318 ?auto_760319 ?auto_760320 )
      ( MAKE-13PILE ?auto_760313 ?auto_760314 ?auto_760315 ?auto_760316 ?auto_760317 ?auto_760318 ?auto_760319 ?auto_760320 ?auto_760321 ?auto_760322 ?auto_760323 ?auto_760324 ?auto_760325 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_760367 - BLOCK
      ?auto_760368 - BLOCK
      ?auto_760369 - BLOCK
      ?auto_760370 - BLOCK
      ?auto_760371 - BLOCK
      ?auto_760372 - BLOCK
      ?auto_760373 - BLOCK
      ?auto_760374 - BLOCK
      ?auto_760375 - BLOCK
      ?auto_760376 - BLOCK
      ?auto_760377 - BLOCK
      ?auto_760378 - BLOCK
      ?auto_760379 - BLOCK
    )
    :vars
    (
      ?auto_760380 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_760379 ?auto_760380 ) ( ON-TABLE ?auto_760367 ) ( ON ?auto_760368 ?auto_760367 ) ( ON ?auto_760369 ?auto_760368 ) ( ON ?auto_760370 ?auto_760369 ) ( ON ?auto_760371 ?auto_760370 ) ( ON ?auto_760372 ?auto_760371 ) ( not ( = ?auto_760367 ?auto_760368 ) ) ( not ( = ?auto_760367 ?auto_760369 ) ) ( not ( = ?auto_760367 ?auto_760370 ) ) ( not ( = ?auto_760367 ?auto_760371 ) ) ( not ( = ?auto_760367 ?auto_760372 ) ) ( not ( = ?auto_760367 ?auto_760373 ) ) ( not ( = ?auto_760367 ?auto_760374 ) ) ( not ( = ?auto_760367 ?auto_760375 ) ) ( not ( = ?auto_760367 ?auto_760376 ) ) ( not ( = ?auto_760367 ?auto_760377 ) ) ( not ( = ?auto_760367 ?auto_760378 ) ) ( not ( = ?auto_760367 ?auto_760379 ) ) ( not ( = ?auto_760367 ?auto_760380 ) ) ( not ( = ?auto_760368 ?auto_760369 ) ) ( not ( = ?auto_760368 ?auto_760370 ) ) ( not ( = ?auto_760368 ?auto_760371 ) ) ( not ( = ?auto_760368 ?auto_760372 ) ) ( not ( = ?auto_760368 ?auto_760373 ) ) ( not ( = ?auto_760368 ?auto_760374 ) ) ( not ( = ?auto_760368 ?auto_760375 ) ) ( not ( = ?auto_760368 ?auto_760376 ) ) ( not ( = ?auto_760368 ?auto_760377 ) ) ( not ( = ?auto_760368 ?auto_760378 ) ) ( not ( = ?auto_760368 ?auto_760379 ) ) ( not ( = ?auto_760368 ?auto_760380 ) ) ( not ( = ?auto_760369 ?auto_760370 ) ) ( not ( = ?auto_760369 ?auto_760371 ) ) ( not ( = ?auto_760369 ?auto_760372 ) ) ( not ( = ?auto_760369 ?auto_760373 ) ) ( not ( = ?auto_760369 ?auto_760374 ) ) ( not ( = ?auto_760369 ?auto_760375 ) ) ( not ( = ?auto_760369 ?auto_760376 ) ) ( not ( = ?auto_760369 ?auto_760377 ) ) ( not ( = ?auto_760369 ?auto_760378 ) ) ( not ( = ?auto_760369 ?auto_760379 ) ) ( not ( = ?auto_760369 ?auto_760380 ) ) ( not ( = ?auto_760370 ?auto_760371 ) ) ( not ( = ?auto_760370 ?auto_760372 ) ) ( not ( = ?auto_760370 ?auto_760373 ) ) ( not ( = ?auto_760370 ?auto_760374 ) ) ( not ( = ?auto_760370 ?auto_760375 ) ) ( not ( = ?auto_760370 ?auto_760376 ) ) ( not ( = ?auto_760370 ?auto_760377 ) ) ( not ( = ?auto_760370 ?auto_760378 ) ) ( not ( = ?auto_760370 ?auto_760379 ) ) ( not ( = ?auto_760370 ?auto_760380 ) ) ( not ( = ?auto_760371 ?auto_760372 ) ) ( not ( = ?auto_760371 ?auto_760373 ) ) ( not ( = ?auto_760371 ?auto_760374 ) ) ( not ( = ?auto_760371 ?auto_760375 ) ) ( not ( = ?auto_760371 ?auto_760376 ) ) ( not ( = ?auto_760371 ?auto_760377 ) ) ( not ( = ?auto_760371 ?auto_760378 ) ) ( not ( = ?auto_760371 ?auto_760379 ) ) ( not ( = ?auto_760371 ?auto_760380 ) ) ( not ( = ?auto_760372 ?auto_760373 ) ) ( not ( = ?auto_760372 ?auto_760374 ) ) ( not ( = ?auto_760372 ?auto_760375 ) ) ( not ( = ?auto_760372 ?auto_760376 ) ) ( not ( = ?auto_760372 ?auto_760377 ) ) ( not ( = ?auto_760372 ?auto_760378 ) ) ( not ( = ?auto_760372 ?auto_760379 ) ) ( not ( = ?auto_760372 ?auto_760380 ) ) ( not ( = ?auto_760373 ?auto_760374 ) ) ( not ( = ?auto_760373 ?auto_760375 ) ) ( not ( = ?auto_760373 ?auto_760376 ) ) ( not ( = ?auto_760373 ?auto_760377 ) ) ( not ( = ?auto_760373 ?auto_760378 ) ) ( not ( = ?auto_760373 ?auto_760379 ) ) ( not ( = ?auto_760373 ?auto_760380 ) ) ( not ( = ?auto_760374 ?auto_760375 ) ) ( not ( = ?auto_760374 ?auto_760376 ) ) ( not ( = ?auto_760374 ?auto_760377 ) ) ( not ( = ?auto_760374 ?auto_760378 ) ) ( not ( = ?auto_760374 ?auto_760379 ) ) ( not ( = ?auto_760374 ?auto_760380 ) ) ( not ( = ?auto_760375 ?auto_760376 ) ) ( not ( = ?auto_760375 ?auto_760377 ) ) ( not ( = ?auto_760375 ?auto_760378 ) ) ( not ( = ?auto_760375 ?auto_760379 ) ) ( not ( = ?auto_760375 ?auto_760380 ) ) ( not ( = ?auto_760376 ?auto_760377 ) ) ( not ( = ?auto_760376 ?auto_760378 ) ) ( not ( = ?auto_760376 ?auto_760379 ) ) ( not ( = ?auto_760376 ?auto_760380 ) ) ( not ( = ?auto_760377 ?auto_760378 ) ) ( not ( = ?auto_760377 ?auto_760379 ) ) ( not ( = ?auto_760377 ?auto_760380 ) ) ( not ( = ?auto_760378 ?auto_760379 ) ) ( not ( = ?auto_760378 ?auto_760380 ) ) ( not ( = ?auto_760379 ?auto_760380 ) ) ( ON ?auto_760378 ?auto_760379 ) ( ON ?auto_760377 ?auto_760378 ) ( ON ?auto_760376 ?auto_760377 ) ( ON ?auto_760375 ?auto_760376 ) ( ON ?auto_760374 ?auto_760375 ) ( CLEAR ?auto_760372 ) ( ON ?auto_760373 ?auto_760374 ) ( CLEAR ?auto_760373 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_760367 ?auto_760368 ?auto_760369 ?auto_760370 ?auto_760371 ?auto_760372 ?auto_760373 )
      ( MAKE-13PILE ?auto_760367 ?auto_760368 ?auto_760369 ?auto_760370 ?auto_760371 ?auto_760372 ?auto_760373 ?auto_760374 ?auto_760375 ?auto_760376 ?auto_760377 ?auto_760378 ?auto_760379 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_760421 - BLOCK
      ?auto_760422 - BLOCK
      ?auto_760423 - BLOCK
      ?auto_760424 - BLOCK
      ?auto_760425 - BLOCK
      ?auto_760426 - BLOCK
      ?auto_760427 - BLOCK
      ?auto_760428 - BLOCK
      ?auto_760429 - BLOCK
      ?auto_760430 - BLOCK
      ?auto_760431 - BLOCK
      ?auto_760432 - BLOCK
      ?auto_760433 - BLOCK
    )
    :vars
    (
      ?auto_760434 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_760433 ?auto_760434 ) ( ON-TABLE ?auto_760421 ) ( ON ?auto_760422 ?auto_760421 ) ( ON ?auto_760423 ?auto_760422 ) ( ON ?auto_760424 ?auto_760423 ) ( ON ?auto_760425 ?auto_760424 ) ( not ( = ?auto_760421 ?auto_760422 ) ) ( not ( = ?auto_760421 ?auto_760423 ) ) ( not ( = ?auto_760421 ?auto_760424 ) ) ( not ( = ?auto_760421 ?auto_760425 ) ) ( not ( = ?auto_760421 ?auto_760426 ) ) ( not ( = ?auto_760421 ?auto_760427 ) ) ( not ( = ?auto_760421 ?auto_760428 ) ) ( not ( = ?auto_760421 ?auto_760429 ) ) ( not ( = ?auto_760421 ?auto_760430 ) ) ( not ( = ?auto_760421 ?auto_760431 ) ) ( not ( = ?auto_760421 ?auto_760432 ) ) ( not ( = ?auto_760421 ?auto_760433 ) ) ( not ( = ?auto_760421 ?auto_760434 ) ) ( not ( = ?auto_760422 ?auto_760423 ) ) ( not ( = ?auto_760422 ?auto_760424 ) ) ( not ( = ?auto_760422 ?auto_760425 ) ) ( not ( = ?auto_760422 ?auto_760426 ) ) ( not ( = ?auto_760422 ?auto_760427 ) ) ( not ( = ?auto_760422 ?auto_760428 ) ) ( not ( = ?auto_760422 ?auto_760429 ) ) ( not ( = ?auto_760422 ?auto_760430 ) ) ( not ( = ?auto_760422 ?auto_760431 ) ) ( not ( = ?auto_760422 ?auto_760432 ) ) ( not ( = ?auto_760422 ?auto_760433 ) ) ( not ( = ?auto_760422 ?auto_760434 ) ) ( not ( = ?auto_760423 ?auto_760424 ) ) ( not ( = ?auto_760423 ?auto_760425 ) ) ( not ( = ?auto_760423 ?auto_760426 ) ) ( not ( = ?auto_760423 ?auto_760427 ) ) ( not ( = ?auto_760423 ?auto_760428 ) ) ( not ( = ?auto_760423 ?auto_760429 ) ) ( not ( = ?auto_760423 ?auto_760430 ) ) ( not ( = ?auto_760423 ?auto_760431 ) ) ( not ( = ?auto_760423 ?auto_760432 ) ) ( not ( = ?auto_760423 ?auto_760433 ) ) ( not ( = ?auto_760423 ?auto_760434 ) ) ( not ( = ?auto_760424 ?auto_760425 ) ) ( not ( = ?auto_760424 ?auto_760426 ) ) ( not ( = ?auto_760424 ?auto_760427 ) ) ( not ( = ?auto_760424 ?auto_760428 ) ) ( not ( = ?auto_760424 ?auto_760429 ) ) ( not ( = ?auto_760424 ?auto_760430 ) ) ( not ( = ?auto_760424 ?auto_760431 ) ) ( not ( = ?auto_760424 ?auto_760432 ) ) ( not ( = ?auto_760424 ?auto_760433 ) ) ( not ( = ?auto_760424 ?auto_760434 ) ) ( not ( = ?auto_760425 ?auto_760426 ) ) ( not ( = ?auto_760425 ?auto_760427 ) ) ( not ( = ?auto_760425 ?auto_760428 ) ) ( not ( = ?auto_760425 ?auto_760429 ) ) ( not ( = ?auto_760425 ?auto_760430 ) ) ( not ( = ?auto_760425 ?auto_760431 ) ) ( not ( = ?auto_760425 ?auto_760432 ) ) ( not ( = ?auto_760425 ?auto_760433 ) ) ( not ( = ?auto_760425 ?auto_760434 ) ) ( not ( = ?auto_760426 ?auto_760427 ) ) ( not ( = ?auto_760426 ?auto_760428 ) ) ( not ( = ?auto_760426 ?auto_760429 ) ) ( not ( = ?auto_760426 ?auto_760430 ) ) ( not ( = ?auto_760426 ?auto_760431 ) ) ( not ( = ?auto_760426 ?auto_760432 ) ) ( not ( = ?auto_760426 ?auto_760433 ) ) ( not ( = ?auto_760426 ?auto_760434 ) ) ( not ( = ?auto_760427 ?auto_760428 ) ) ( not ( = ?auto_760427 ?auto_760429 ) ) ( not ( = ?auto_760427 ?auto_760430 ) ) ( not ( = ?auto_760427 ?auto_760431 ) ) ( not ( = ?auto_760427 ?auto_760432 ) ) ( not ( = ?auto_760427 ?auto_760433 ) ) ( not ( = ?auto_760427 ?auto_760434 ) ) ( not ( = ?auto_760428 ?auto_760429 ) ) ( not ( = ?auto_760428 ?auto_760430 ) ) ( not ( = ?auto_760428 ?auto_760431 ) ) ( not ( = ?auto_760428 ?auto_760432 ) ) ( not ( = ?auto_760428 ?auto_760433 ) ) ( not ( = ?auto_760428 ?auto_760434 ) ) ( not ( = ?auto_760429 ?auto_760430 ) ) ( not ( = ?auto_760429 ?auto_760431 ) ) ( not ( = ?auto_760429 ?auto_760432 ) ) ( not ( = ?auto_760429 ?auto_760433 ) ) ( not ( = ?auto_760429 ?auto_760434 ) ) ( not ( = ?auto_760430 ?auto_760431 ) ) ( not ( = ?auto_760430 ?auto_760432 ) ) ( not ( = ?auto_760430 ?auto_760433 ) ) ( not ( = ?auto_760430 ?auto_760434 ) ) ( not ( = ?auto_760431 ?auto_760432 ) ) ( not ( = ?auto_760431 ?auto_760433 ) ) ( not ( = ?auto_760431 ?auto_760434 ) ) ( not ( = ?auto_760432 ?auto_760433 ) ) ( not ( = ?auto_760432 ?auto_760434 ) ) ( not ( = ?auto_760433 ?auto_760434 ) ) ( ON ?auto_760432 ?auto_760433 ) ( ON ?auto_760431 ?auto_760432 ) ( ON ?auto_760430 ?auto_760431 ) ( ON ?auto_760429 ?auto_760430 ) ( ON ?auto_760428 ?auto_760429 ) ( ON ?auto_760427 ?auto_760428 ) ( CLEAR ?auto_760425 ) ( ON ?auto_760426 ?auto_760427 ) ( CLEAR ?auto_760426 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_760421 ?auto_760422 ?auto_760423 ?auto_760424 ?auto_760425 ?auto_760426 )
      ( MAKE-13PILE ?auto_760421 ?auto_760422 ?auto_760423 ?auto_760424 ?auto_760425 ?auto_760426 ?auto_760427 ?auto_760428 ?auto_760429 ?auto_760430 ?auto_760431 ?auto_760432 ?auto_760433 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_760475 - BLOCK
      ?auto_760476 - BLOCK
      ?auto_760477 - BLOCK
      ?auto_760478 - BLOCK
      ?auto_760479 - BLOCK
      ?auto_760480 - BLOCK
      ?auto_760481 - BLOCK
      ?auto_760482 - BLOCK
      ?auto_760483 - BLOCK
      ?auto_760484 - BLOCK
      ?auto_760485 - BLOCK
      ?auto_760486 - BLOCK
      ?auto_760487 - BLOCK
    )
    :vars
    (
      ?auto_760488 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_760487 ?auto_760488 ) ( ON-TABLE ?auto_760475 ) ( ON ?auto_760476 ?auto_760475 ) ( ON ?auto_760477 ?auto_760476 ) ( ON ?auto_760478 ?auto_760477 ) ( not ( = ?auto_760475 ?auto_760476 ) ) ( not ( = ?auto_760475 ?auto_760477 ) ) ( not ( = ?auto_760475 ?auto_760478 ) ) ( not ( = ?auto_760475 ?auto_760479 ) ) ( not ( = ?auto_760475 ?auto_760480 ) ) ( not ( = ?auto_760475 ?auto_760481 ) ) ( not ( = ?auto_760475 ?auto_760482 ) ) ( not ( = ?auto_760475 ?auto_760483 ) ) ( not ( = ?auto_760475 ?auto_760484 ) ) ( not ( = ?auto_760475 ?auto_760485 ) ) ( not ( = ?auto_760475 ?auto_760486 ) ) ( not ( = ?auto_760475 ?auto_760487 ) ) ( not ( = ?auto_760475 ?auto_760488 ) ) ( not ( = ?auto_760476 ?auto_760477 ) ) ( not ( = ?auto_760476 ?auto_760478 ) ) ( not ( = ?auto_760476 ?auto_760479 ) ) ( not ( = ?auto_760476 ?auto_760480 ) ) ( not ( = ?auto_760476 ?auto_760481 ) ) ( not ( = ?auto_760476 ?auto_760482 ) ) ( not ( = ?auto_760476 ?auto_760483 ) ) ( not ( = ?auto_760476 ?auto_760484 ) ) ( not ( = ?auto_760476 ?auto_760485 ) ) ( not ( = ?auto_760476 ?auto_760486 ) ) ( not ( = ?auto_760476 ?auto_760487 ) ) ( not ( = ?auto_760476 ?auto_760488 ) ) ( not ( = ?auto_760477 ?auto_760478 ) ) ( not ( = ?auto_760477 ?auto_760479 ) ) ( not ( = ?auto_760477 ?auto_760480 ) ) ( not ( = ?auto_760477 ?auto_760481 ) ) ( not ( = ?auto_760477 ?auto_760482 ) ) ( not ( = ?auto_760477 ?auto_760483 ) ) ( not ( = ?auto_760477 ?auto_760484 ) ) ( not ( = ?auto_760477 ?auto_760485 ) ) ( not ( = ?auto_760477 ?auto_760486 ) ) ( not ( = ?auto_760477 ?auto_760487 ) ) ( not ( = ?auto_760477 ?auto_760488 ) ) ( not ( = ?auto_760478 ?auto_760479 ) ) ( not ( = ?auto_760478 ?auto_760480 ) ) ( not ( = ?auto_760478 ?auto_760481 ) ) ( not ( = ?auto_760478 ?auto_760482 ) ) ( not ( = ?auto_760478 ?auto_760483 ) ) ( not ( = ?auto_760478 ?auto_760484 ) ) ( not ( = ?auto_760478 ?auto_760485 ) ) ( not ( = ?auto_760478 ?auto_760486 ) ) ( not ( = ?auto_760478 ?auto_760487 ) ) ( not ( = ?auto_760478 ?auto_760488 ) ) ( not ( = ?auto_760479 ?auto_760480 ) ) ( not ( = ?auto_760479 ?auto_760481 ) ) ( not ( = ?auto_760479 ?auto_760482 ) ) ( not ( = ?auto_760479 ?auto_760483 ) ) ( not ( = ?auto_760479 ?auto_760484 ) ) ( not ( = ?auto_760479 ?auto_760485 ) ) ( not ( = ?auto_760479 ?auto_760486 ) ) ( not ( = ?auto_760479 ?auto_760487 ) ) ( not ( = ?auto_760479 ?auto_760488 ) ) ( not ( = ?auto_760480 ?auto_760481 ) ) ( not ( = ?auto_760480 ?auto_760482 ) ) ( not ( = ?auto_760480 ?auto_760483 ) ) ( not ( = ?auto_760480 ?auto_760484 ) ) ( not ( = ?auto_760480 ?auto_760485 ) ) ( not ( = ?auto_760480 ?auto_760486 ) ) ( not ( = ?auto_760480 ?auto_760487 ) ) ( not ( = ?auto_760480 ?auto_760488 ) ) ( not ( = ?auto_760481 ?auto_760482 ) ) ( not ( = ?auto_760481 ?auto_760483 ) ) ( not ( = ?auto_760481 ?auto_760484 ) ) ( not ( = ?auto_760481 ?auto_760485 ) ) ( not ( = ?auto_760481 ?auto_760486 ) ) ( not ( = ?auto_760481 ?auto_760487 ) ) ( not ( = ?auto_760481 ?auto_760488 ) ) ( not ( = ?auto_760482 ?auto_760483 ) ) ( not ( = ?auto_760482 ?auto_760484 ) ) ( not ( = ?auto_760482 ?auto_760485 ) ) ( not ( = ?auto_760482 ?auto_760486 ) ) ( not ( = ?auto_760482 ?auto_760487 ) ) ( not ( = ?auto_760482 ?auto_760488 ) ) ( not ( = ?auto_760483 ?auto_760484 ) ) ( not ( = ?auto_760483 ?auto_760485 ) ) ( not ( = ?auto_760483 ?auto_760486 ) ) ( not ( = ?auto_760483 ?auto_760487 ) ) ( not ( = ?auto_760483 ?auto_760488 ) ) ( not ( = ?auto_760484 ?auto_760485 ) ) ( not ( = ?auto_760484 ?auto_760486 ) ) ( not ( = ?auto_760484 ?auto_760487 ) ) ( not ( = ?auto_760484 ?auto_760488 ) ) ( not ( = ?auto_760485 ?auto_760486 ) ) ( not ( = ?auto_760485 ?auto_760487 ) ) ( not ( = ?auto_760485 ?auto_760488 ) ) ( not ( = ?auto_760486 ?auto_760487 ) ) ( not ( = ?auto_760486 ?auto_760488 ) ) ( not ( = ?auto_760487 ?auto_760488 ) ) ( ON ?auto_760486 ?auto_760487 ) ( ON ?auto_760485 ?auto_760486 ) ( ON ?auto_760484 ?auto_760485 ) ( ON ?auto_760483 ?auto_760484 ) ( ON ?auto_760482 ?auto_760483 ) ( ON ?auto_760481 ?auto_760482 ) ( ON ?auto_760480 ?auto_760481 ) ( CLEAR ?auto_760478 ) ( ON ?auto_760479 ?auto_760480 ) ( CLEAR ?auto_760479 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_760475 ?auto_760476 ?auto_760477 ?auto_760478 ?auto_760479 )
      ( MAKE-13PILE ?auto_760475 ?auto_760476 ?auto_760477 ?auto_760478 ?auto_760479 ?auto_760480 ?auto_760481 ?auto_760482 ?auto_760483 ?auto_760484 ?auto_760485 ?auto_760486 ?auto_760487 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_760529 - BLOCK
      ?auto_760530 - BLOCK
      ?auto_760531 - BLOCK
      ?auto_760532 - BLOCK
      ?auto_760533 - BLOCK
      ?auto_760534 - BLOCK
      ?auto_760535 - BLOCK
      ?auto_760536 - BLOCK
      ?auto_760537 - BLOCK
      ?auto_760538 - BLOCK
      ?auto_760539 - BLOCK
      ?auto_760540 - BLOCK
      ?auto_760541 - BLOCK
    )
    :vars
    (
      ?auto_760542 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_760541 ?auto_760542 ) ( ON-TABLE ?auto_760529 ) ( ON ?auto_760530 ?auto_760529 ) ( ON ?auto_760531 ?auto_760530 ) ( not ( = ?auto_760529 ?auto_760530 ) ) ( not ( = ?auto_760529 ?auto_760531 ) ) ( not ( = ?auto_760529 ?auto_760532 ) ) ( not ( = ?auto_760529 ?auto_760533 ) ) ( not ( = ?auto_760529 ?auto_760534 ) ) ( not ( = ?auto_760529 ?auto_760535 ) ) ( not ( = ?auto_760529 ?auto_760536 ) ) ( not ( = ?auto_760529 ?auto_760537 ) ) ( not ( = ?auto_760529 ?auto_760538 ) ) ( not ( = ?auto_760529 ?auto_760539 ) ) ( not ( = ?auto_760529 ?auto_760540 ) ) ( not ( = ?auto_760529 ?auto_760541 ) ) ( not ( = ?auto_760529 ?auto_760542 ) ) ( not ( = ?auto_760530 ?auto_760531 ) ) ( not ( = ?auto_760530 ?auto_760532 ) ) ( not ( = ?auto_760530 ?auto_760533 ) ) ( not ( = ?auto_760530 ?auto_760534 ) ) ( not ( = ?auto_760530 ?auto_760535 ) ) ( not ( = ?auto_760530 ?auto_760536 ) ) ( not ( = ?auto_760530 ?auto_760537 ) ) ( not ( = ?auto_760530 ?auto_760538 ) ) ( not ( = ?auto_760530 ?auto_760539 ) ) ( not ( = ?auto_760530 ?auto_760540 ) ) ( not ( = ?auto_760530 ?auto_760541 ) ) ( not ( = ?auto_760530 ?auto_760542 ) ) ( not ( = ?auto_760531 ?auto_760532 ) ) ( not ( = ?auto_760531 ?auto_760533 ) ) ( not ( = ?auto_760531 ?auto_760534 ) ) ( not ( = ?auto_760531 ?auto_760535 ) ) ( not ( = ?auto_760531 ?auto_760536 ) ) ( not ( = ?auto_760531 ?auto_760537 ) ) ( not ( = ?auto_760531 ?auto_760538 ) ) ( not ( = ?auto_760531 ?auto_760539 ) ) ( not ( = ?auto_760531 ?auto_760540 ) ) ( not ( = ?auto_760531 ?auto_760541 ) ) ( not ( = ?auto_760531 ?auto_760542 ) ) ( not ( = ?auto_760532 ?auto_760533 ) ) ( not ( = ?auto_760532 ?auto_760534 ) ) ( not ( = ?auto_760532 ?auto_760535 ) ) ( not ( = ?auto_760532 ?auto_760536 ) ) ( not ( = ?auto_760532 ?auto_760537 ) ) ( not ( = ?auto_760532 ?auto_760538 ) ) ( not ( = ?auto_760532 ?auto_760539 ) ) ( not ( = ?auto_760532 ?auto_760540 ) ) ( not ( = ?auto_760532 ?auto_760541 ) ) ( not ( = ?auto_760532 ?auto_760542 ) ) ( not ( = ?auto_760533 ?auto_760534 ) ) ( not ( = ?auto_760533 ?auto_760535 ) ) ( not ( = ?auto_760533 ?auto_760536 ) ) ( not ( = ?auto_760533 ?auto_760537 ) ) ( not ( = ?auto_760533 ?auto_760538 ) ) ( not ( = ?auto_760533 ?auto_760539 ) ) ( not ( = ?auto_760533 ?auto_760540 ) ) ( not ( = ?auto_760533 ?auto_760541 ) ) ( not ( = ?auto_760533 ?auto_760542 ) ) ( not ( = ?auto_760534 ?auto_760535 ) ) ( not ( = ?auto_760534 ?auto_760536 ) ) ( not ( = ?auto_760534 ?auto_760537 ) ) ( not ( = ?auto_760534 ?auto_760538 ) ) ( not ( = ?auto_760534 ?auto_760539 ) ) ( not ( = ?auto_760534 ?auto_760540 ) ) ( not ( = ?auto_760534 ?auto_760541 ) ) ( not ( = ?auto_760534 ?auto_760542 ) ) ( not ( = ?auto_760535 ?auto_760536 ) ) ( not ( = ?auto_760535 ?auto_760537 ) ) ( not ( = ?auto_760535 ?auto_760538 ) ) ( not ( = ?auto_760535 ?auto_760539 ) ) ( not ( = ?auto_760535 ?auto_760540 ) ) ( not ( = ?auto_760535 ?auto_760541 ) ) ( not ( = ?auto_760535 ?auto_760542 ) ) ( not ( = ?auto_760536 ?auto_760537 ) ) ( not ( = ?auto_760536 ?auto_760538 ) ) ( not ( = ?auto_760536 ?auto_760539 ) ) ( not ( = ?auto_760536 ?auto_760540 ) ) ( not ( = ?auto_760536 ?auto_760541 ) ) ( not ( = ?auto_760536 ?auto_760542 ) ) ( not ( = ?auto_760537 ?auto_760538 ) ) ( not ( = ?auto_760537 ?auto_760539 ) ) ( not ( = ?auto_760537 ?auto_760540 ) ) ( not ( = ?auto_760537 ?auto_760541 ) ) ( not ( = ?auto_760537 ?auto_760542 ) ) ( not ( = ?auto_760538 ?auto_760539 ) ) ( not ( = ?auto_760538 ?auto_760540 ) ) ( not ( = ?auto_760538 ?auto_760541 ) ) ( not ( = ?auto_760538 ?auto_760542 ) ) ( not ( = ?auto_760539 ?auto_760540 ) ) ( not ( = ?auto_760539 ?auto_760541 ) ) ( not ( = ?auto_760539 ?auto_760542 ) ) ( not ( = ?auto_760540 ?auto_760541 ) ) ( not ( = ?auto_760540 ?auto_760542 ) ) ( not ( = ?auto_760541 ?auto_760542 ) ) ( ON ?auto_760540 ?auto_760541 ) ( ON ?auto_760539 ?auto_760540 ) ( ON ?auto_760538 ?auto_760539 ) ( ON ?auto_760537 ?auto_760538 ) ( ON ?auto_760536 ?auto_760537 ) ( ON ?auto_760535 ?auto_760536 ) ( ON ?auto_760534 ?auto_760535 ) ( ON ?auto_760533 ?auto_760534 ) ( CLEAR ?auto_760531 ) ( ON ?auto_760532 ?auto_760533 ) ( CLEAR ?auto_760532 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_760529 ?auto_760530 ?auto_760531 ?auto_760532 )
      ( MAKE-13PILE ?auto_760529 ?auto_760530 ?auto_760531 ?auto_760532 ?auto_760533 ?auto_760534 ?auto_760535 ?auto_760536 ?auto_760537 ?auto_760538 ?auto_760539 ?auto_760540 ?auto_760541 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_760583 - BLOCK
      ?auto_760584 - BLOCK
      ?auto_760585 - BLOCK
      ?auto_760586 - BLOCK
      ?auto_760587 - BLOCK
      ?auto_760588 - BLOCK
      ?auto_760589 - BLOCK
      ?auto_760590 - BLOCK
      ?auto_760591 - BLOCK
      ?auto_760592 - BLOCK
      ?auto_760593 - BLOCK
      ?auto_760594 - BLOCK
      ?auto_760595 - BLOCK
    )
    :vars
    (
      ?auto_760596 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_760595 ?auto_760596 ) ( ON-TABLE ?auto_760583 ) ( ON ?auto_760584 ?auto_760583 ) ( not ( = ?auto_760583 ?auto_760584 ) ) ( not ( = ?auto_760583 ?auto_760585 ) ) ( not ( = ?auto_760583 ?auto_760586 ) ) ( not ( = ?auto_760583 ?auto_760587 ) ) ( not ( = ?auto_760583 ?auto_760588 ) ) ( not ( = ?auto_760583 ?auto_760589 ) ) ( not ( = ?auto_760583 ?auto_760590 ) ) ( not ( = ?auto_760583 ?auto_760591 ) ) ( not ( = ?auto_760583 ?auto_760592 ) ) ( not ( = ?auto_760583 ?auto_760593 ) ) ( not ( = ?auto_760583 ?auto_760594 ) ) ( not ( = ?auto_760583 ?auto_760595 ) ) ( not ( = ?auto_760583 ?auto_760596 ) ) ( not ( = ?auto_760584 ?auto_760585 ) ) ( not ( = ?auto_760584 ?auto_760586 ) ) ( not ( = ?auto_760584 ?auto_760587 ) ) ( not ( = ?auto_760584 ?auto_760588 ) ) ( not ( = ?auto_760584 ?auto_760589 ) ) ( not ( = ?auto_760584 ?auto_760590 ) ) ( not ( = ?auto_760584 ?auto_760591 ) ) ( not ( = ?auto_760584 ?auto_760592 ) ) ( not ( = ?auto_760584 ?auto_760593 ) ) ( not ( = ?auto_760584 ?auto_760594 ) ) ( not ( = ?auto_760584 ?auto_760595 ) ) ( not ( = ?auto_760584 ?auto_760596 ) ) ( not ( = ?auto_760585 ?auto_760586 ) ) ( not ( = ?auto_760585 ?auto_760587 ) ) ( not ( = ?auto_760585 ?auto_760588 ) ) ( not ( = ?auto_760585 ?auto_760589 ) ) ( not ( = ?auto_760585 ?auto_760590 ) ) ( not ( = ?auto_760585 ?auto_760591 ) ) ( not ( = ?auto_760585 ?auto_760592 ) ) ( not ( = ?auto_760585 ?auto_760593 ) ) ( not ( = ?auto_760585 ?auto_760594 ) ) ( not ( = ?auto_760585 ?auto_760595 ) ) ( not ( = ?auto_760585 ?auto_760596 ) ) ( not ( = ?auto_760586 ?auto_760587 ) ) ( not ( = ?auto_760586 ?auto_760588 ) ) ( not ( = ?auto_760586 ?auto_760589 ) ) ( not ( = ?auto_760586 ?auto_760590 ) ) ( not ( = ?auto_760586 ?auto_760591 ) ) ( not ( = ?auto_760586 ?auto_760592 ) ) ( not ( = ?auto_760586 ?auto_760593 ) ) ( not ( = ?auto_760586 ?auto_760594 ) ) ( not ( = ?auto_760586 ?auto_760595 ) ) ( not ( = ?auto_760586 ?auto_760596 ) ) ( not ( = ?auto_760587 ?auto_760588 ) ) ( not ( = ?auto_760587 ?auto_760589 ) ) ( not ( = ?auto_760587 ?auto_760590 ) ) ( not ( = ?auto_760587 ?auto_760591 ) ) ( not ( = ?auto_760587 ?auto_760592 ) ) ( not ( = ?auto_760587 ?auto_760593 ) ) ( not ( = ?auto_760587 ?auto_760594 ) ) ( not ( = ?auto_760587 ?auto_760595 ) ) ( not ( = ?auto_760587 ?auto_760596 ) ) ( not ( = ?auto_760588 ?auto_760589 ) ) ( not ( = ?auto_760588 ?auto_760590 ) ) ( not ( = ?auto_760588 ?auto_760591 ) ) ( not ( = ?auto_760588 ?auto_760592 ) ) ( not ( = ?auto_760588 ?auto_760593 ) ) ( not ( = ?auto_760588 ?auto_760594 ) ) ( not ( = ?auto_760588 ?auto_760595 ) ) ( not ( = ?auto_760588 ?auto_760596 ) ) ( not ( = ?auto_760589 ?auto_760590 ) ) ( not ( = ?auto_760589 ?auto_760591 ) ) ( not ( = ?auto_760589 ?auto_760592 ) ) ( not ( = ?auto_760589 ?auto_760593 ) ) ( not ( = ?auto_760589 ?auto_760594 ) ) ( not ( = ?auto_760589 ?auto_760595 ) ) ( not ( = ?auto_760589 ?auto_760596 ) ) ( not ( = ?auto_760590 ?auto_760591 ) ) ( not ( = ?auto_760590 ?auto_760592 ) ) ( not ( = ?auto_760590 ?auto_760593 ) ) ( not ( = ?auto_760590 ?auto_760594 ) ) ( not ( = ?auto_760590 ?auto_760595 ) ) ( not ( = ?auto_760590 ?auto_760596 ) ) ( not ( = ?auto_760591 ?auto_760592 ) ) ( not ( = ?auto_760591 ?auto_760593 ) ) ( not ( = ?auto_760591 ?auto_760594 ) ) ( not ( = ?auto_760591 ?auto_760595 ) ) ( not ( = ?auto_760591 ?auto_760596 ) ) ( not ( = ?auto_760592 ?auto_760593 ) ) ( not ( = ?auto_760592 ?auto_760594 ) ) ( not ( = ?auto_760592 ?auto_760595 ) ) ( not ( = ?auto_760592 ?auto_760596 ) ) ( not ( = ?auto_760593 ?auto_760594 ) ) ( not ( = ?auto_760593 ?auto_760595 ) ) ( not ( = ?auto_760593 ?auto_760596 ) ) ( not ( = ?auto_760594 ?auto_760595 ) ) ( not ( = ?auto_760594 ?auto_760596 ) ) ( not ( = ?auto_760595 ?auto_760596 ) ) ( ON ?auto_760594 ?auto_760595 ) ( ON ?auto_760593 ?auto_760594 ) ( ON ?auto_760592 ?auto_760593 ) ( ON ?auto_760591 ?auto_760592 ) ( ON ?auto_760590 ?auto_760591 ) ( ON ?auto_760589 ?auto_760590 ) ( ON ?auto_760588 ?auto_760589 ) ( ON ?auto_760587 ?auto_760588 ) ( ON ?auto_760586 ?auto_760587 ) ( CLEAR ?auto_760584 ) ( ON ?auto_760585 ?auto_760586 ) ( CLEAR ?auto_760585 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_760583 ?auto_760584 ?auto_760585 )
      ( MAKE-13PILE ?auto_760583 ?auto_760584 ?auto_760585 ?auto_760586 ?auto_760587 ?auto_760588 ?auto_760589 ?auto_760590 ?auto_760591 ?auto_760592 ?auto_760593 ?auto_760594 ?auto_760595 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_760637 - BLOCK
      ?auto_760638 - BLOCK
      ?auto_760639 - BLOCK
      ?auto_760640 - BLOCK
      ?auto_760641 - BLOCK
      ?auto_760642 - BLOCK
      ?auto_760643 - BLOCK
      ?auto_760644 - BLOCK
      ?auto_760645 - BLOCK
      ?auto_760646 - BLOCK
      ?auto_760647 - BLOCK
      ?auto_760648 - BLOCK
      ?auto_760649 - BLOCK
    )
    :vars
    (
      ?auto_760650 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_760649 ?auto_760650 ) ( ON-TABLE ?auto_760637 ) ( not ( = ?auto_760637 ?auto_760638 ) ) ( not ( = ?auto_760637 ?auto_760639 ) ) ( not ( = ?auto_760637 ?auto_760640 ) ) ( not ( = ?auto_760637 ?auto_760641 ) ) ( not ( = ?auto_760637 ?auto_760642 ) ) ( not ( = ?auto_760637 ?auto_760643 ) ) ( not ( = ?auto_760637 ?auto_760644 ) ) ( not ( = ?auto_760637 ?auto_760645 ) ) ( not ( = ?auto_760637 ?auto_760646 ) ) ( not ( = ?auto_760637 ?auto_760647 ) ) ( not ( = ?auto_760637 ?auto_760648 ) ) ( not ( = ?auto_760637 ?auto_760649 ) ) ( not ( = ?auto_760637 ?auto_760650 ) ) ( not ( = ?auto_760638 ?auto_760639 ) ) ( not ( = ?auto_760638 ?auto_760640 ) ) ( not ( = ?auto_760638 ?auto_760641 ) ) ( not ( = ?auto_760638 ?auto_760642 ) ) ( not ( = ?auto_760638 ?auto_760643 ) ) ( not ( = ?auto_760638 ?auto_760644 ) ) ( not ( = ?auto_760638 ?auto_760645 ) ) ( not ( = ?auto_760638 ?auto_760646 ) ) ( not ( = ?auto_760638 ?auto_760647 ) ) ( not ( = ?auto_760638 ?auto_760648 ) ) ( not ( = ?auto_760638 ?auto_760649 ) ) ( not ( = ?auto_760638 ?auto_760650 ) ) ( not ( = ?auto_760639 ?auto_760640 ) ) ( not ( = ?auto_760639 ?auto_760641 ) ) ( not ( = ?auto_760639 ?auto_760642 ) ) ( not ( = ?auto_760639 ?auto_760643 ) ) ( not ( = ?auto_760639 ?auto_760644 ) ) ( not ( = ?auto_760639 ?auto_760645 ) ) ( not ( = ?auto_760639 ?auto_760646 ) ) ( not ( = ?auto_760639 ?auto_760647 ) ) ( not ( = ?auto_760639 ?auto_760648 ) ) ( not ( = ?auto_760639 ?auto_760649 ) ) ( not ( = ?auto_760639 ?auto_760650 ) ) ( not ( = ?auto_760640 ?auto_760641 ) ) ( not ( = ?auto_760640 ?auto_760642 ) ) ( not ( = ?auto_760640 ?auto_760643 ) ) ( not ( = ?auto_760640 ?auto_760644 ) ) ( not ( = ?auto_760640 ?auto_760645 ) ) ( not ( = ?auto_760640 ?auto_760646 ) ) ( not ( = ?auto_760640 ?auto_760647 ) ) ( not ( = ?auto_760640 ?auto_760648 ) ) ( not ( = ?auto_760640 ?auto_760649 ) ) ( not ( = ?auto_760640 ?auto_760650 ) ) ( not ( = ?auto_760641 ?auto_760642 ) ) ( not ( = ?auto_760641 ?auto_760643 ) ) ( not ( = ?auto_760641 ?auto_760644 ) ) ( not ( = ?auto_760641 ?auto_760645 ) ) ( not ( = ?auto_760641 ?auto_760646 ) ) ( not ( = ?auto_760641 ?auto_760647 ) ) ( not ( = ?auto_760641 ?auto_760648 ) ) ( not ( = ?auto_760641 ?auto_760649 ) ) ( not ( = ?auto_760641 ?auto_760650 ) ) ( not ( = ?auto_760642 ?auto_760643 ) ) ( not ( = ?auto_760642 ?auto_760644 ) ) ( not ( = ?auto_760642 ?auto_760645 ) ) ( not ( = ?auto_760642 ?auto_760646 ) ) ( not ( = ?auto_760642 ?auto_760647 ) ) ( not ( = ?auto_760642 ?auto_760648 ) ) ( not ( = ?auto_760642 ?auto_760649 ) ) ( not ( = ?auto_760642 ?auto_760650 ) ) ( not ( = ?auto_760643 ?auto_760644 ) ) ( not ( = ?auto_760643 ?auto_760645 ) ) ( not ( = ?auto_760643 ?auto_760646 ) ) ( not ( = ?auto_760643 ?auto_760647 ) ) ( not ( = ?auto_760643 ?auto_760648 ) ) ( not ( = ?auto_760643 ?auto_760649 ) ) ( not ( = ?auto_760643 ?auto_760650 ) ) ( not ( = ?auto_760644 ?auto_760645 ) ) ( not ( = ?auto_760644 ?auto_760646 ) ) ( not ( = ?auto_760644 ?auto_760647 ) ) ( not ( = ?auto_760644 ?auto_760648 ) ) ( not ( = ?auto_760644 ?auto_760649 ) ) ( not ( = ?auto_760644 ?auto_760650 ) ) ( not ( = ?auto_760645 ?auto_760646 ) ) ( not ( = ?auto_760645 ?auto_760647 ) ) ( not ( = ?auto_760645 ?auto_760648 ) ) ( not ( = ?auto_760645 ?auto_760649 ) ) ( not ( = ?auto_760645 ?auto_760650 ) ) ( not ( = ?auto_760646 ?auto_760647 ) ) ( not ( = ?auto_760646 ?auto_760648 ) ) ( not ( = ?auto_760646 ?auto_760649 ) ) ( not ( = ?auto_760646 ?auto_760650 ) ) ( not ( = ?auto_760647 ?auto_760648 ) ) ( not ( = ?auto_760647 ?auto_760649 ) ) ( not ( = ?auto_760647 ?auto_760650 ) ) ( not ( = ?auto_760648 ?auto_760649 ) ) ( not ( = ?auto_760648 ?auto_760650 ) ) ( not ( = ?auto_760649 ?auto_760650 ) ) ( ON ?auto_760648 ?auto_760649 ) ( ON ?auto_760647 ?auto_760648 ) ( ON ?auto_760646 ?auto_760647 ) ( ON ?auto_760645 ?auto_760646 ) ( ON ?auto_760644 ?auto_760645 ) ( ON ?auto_760643 ?auto_760644 ) ( ON ?auto_760642 ?auto_760643 ) ( ON ?auto_760641 ?auto_760642 ) ( ON ?auto_760640 ?auto_760641 ) ( ON ?auto_760639 ?auto_760640 ) ( CLEAR ?auto_760637 ) ( ON ?auto_760638 ?auto_760639 ) ( CLEAR ?auto_760638 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_760637 ?auto_760638 )
      ( MAKE-13PILE ?auto_760637 ?auto_760638 ?auto_760639 ?auto_760640 ?auto_760641 ?auto_760642 ?auto_760643 ?auto_760644 ?auto_760645 ?auto_760646 ?auto_760647 ?auto_760648 ?auto_760649 ) )
  )

  ( :method MAKE-13PILE
    :parameters
    (
      ?auto_760691 - BLOCK
      ?auto_760692 - BLOCK
      ?auto_760693 - BLOCK
      ?auto_760694 - BLOCK
      ?auto_760695 - BLOCK
      ?auto_760696 - BLOCK
      ?auto_760697 - BLOCK
      ?auto_760698 - BLOCK
      ?auto_760699 - BLOCK
      ?auto_760700 - BLOCK
      ?auto_760701 - BLOCK
      ?auto_760702 - BLOCK
      ?auto_760703 - BLOCK
    )
    :vars
    (
      ?auto_760704 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_760703 ?auto_760704 ) ( not ( = ?auto_760691 ?auto_760692 ) ) ( not ( = ?auto_760691 ?auto_760693 ) ) ( not ( = ?auto_760691 ?auto_760694 ) ) ( not ( = ?auto_760691 ?auto_760695 ) ) ( not ( = ?auto_760691 ?auto_760696 ) ) ( not ( = ?auto_760691 ?auto_760697 ) ) ( not ( = ?auto_760691 ?auto_760698 ) ) ( not ( = ?auto_760691 ?auto_760699 ) ) ( not ( = ?auto_760691 ?auto_760700 ) ) ( not ( = ?auto_760691 ?auto_760701 ) ) ( not ( = ?auto_760691 ?auto_760702 ) ) ( not ( = ?auto_760691 ?auto_760703 ) ) ( not ( = ?auto_760691 ?auto_760704 ) ) ( not ( = ?auto_760692 ?auto_760693 ) ) ( not ( = ?auto_760692 ?auto_760694 ) ) ( not ( = ?auto_760692 ?auto_760695 ) ) ( not ( = ?auto_760692 ?auto_760696 ) ) ( not ( = ?auto_760692 ?auto_760697 ) ) ( not ( = ?auto_760692 ?auto_760698 ) ) ( not ( = ?auto_760692 ?auto_760699 ) ) ( not ( = ?auto_760692 ?auto_760700 ) ) ( not ( = ?auto_760692 ?auto_760701 ) ) ( not ( = ?auto_760692 ?auto_760702 ) ) ( not ( = ?auto_760692 ?auto_760703 ) ) ( not ( = ?auto_760692 ?auto_760704 ) ) ( not ( = ?auto_760693 ?auto_760694 ) ) ( not ( = ?auto_760693 ?auto_760695 ) ) ( not ( = ?auto_760693 ?auto_760696 ) ) ( not ( = ?auto_760693 ?auto_760697 ) ) ( not ( = ?auto_760693 ?auto_760698 ) ) ( not ( = ?auto_760693 ?auto_760699 ) ) ( not ( = ?auto_760693 ?auto_760700 ) ) ( not ( = ?auto_760693 ?auto_760701 ) ) ( not ( = ?auto_760693 ?auto_760702 ) ) ( not ( = ?auto_760693 ?auto_760703 ) ) ( not ( = ?auto_760693 ?auto_760704 ) ) ( not ( = ?auto_760694 ?auto_760695 ) ) ( not ( = ?auto_760694 ?auto_760696 ) ) ( not ( = ?auto_760694 ?auto_760697 ) ) ( not ( = ?auto_760694 ?auto_760698 ) ) ( not ( = ?auto_760694 ?auto_760699 ) ) ( not ( = ?auto_760694 ?auto_760700 ) ) ( not ( = ?auto_760694 ?auto_760701 ) ) ( not ( = ?auto_760694 ?auto_760702 ) ) ( not ( = ?auto_760694 ?auto_760703 ) ) ( not ( = ?auto_760694 ?auto_760704 ) ) ( not ( = ?auto_760695 ?auto_760696 ) ) ( not ( = ?auto_760695 ?auto_760697 ) ) ( not ( = ?auto_760695 ?auto_760698 ) ) ( not ( = ?auto_760695 ?auto_760699 ) ) ( not ( = ?auto_760695 ?auto_760700 ) ) ( not ( = ?auto_760695 ?auto_760701 ) ) ( not ( = ?auto_760695 ?auto_760702 ) ) ( not ( = ?auto_760695 ?auto_760703 ) ) ( not ( = ?auto_760695 ?auto_760704 ) ) ( not ( = ?auto_760696 ?auto_760697 ) ) ( not ( = ?auto_760696 ?auto_760698 ) ) ( not ( = ?auto_760696 ?auto_760699 ) ) ( not ( = ?auto_760696 ?auto_760700 ) ) ( not ( = ?auto_760696 ?auto_760701 ) ) ( not ( = ?auto_760696 ?auto_760702 ) ) ( not ( = ?auto_760696 ?auto_760703 ) ) ( not ( = ?auto_760696 ?auto_760704 ) ) ( not ( = ?auto_760697 ?auto_760698 ) ) ( not ( = ?auto_760697 ?auto_760699 ) ) ( not ( = ?auto_760697 ?auto_760700 ) ) ( not ( = ?auto_760697 ?auto_760701 ) ) ( not ( = ?auto_760697 ?auto_760702 ) ) ( not ( = ?auto_760697 ?auto_760703 ) ) ( not ( = ?auto_760697 ?auto_760704 ) ) ( not ( = ?auto_760698 ?auto_760699 ) ) ( not ( = ?auto_760698 ?auto_760700 ) ) ( not ( = ?auto_760698 ?auto_760701 ) ) ( not ( = ?auto_760698 ?auto_760702 ) ) ( not ( = ?auto_760698 ?auto_760703 ) ) ( not ( = ?auto_760698 ?auto_760704 ) ) ( not ( = ?auto_760699 ?auto_760700 ) ) ( not ( = ?auto_760699 ?auto_760701 ) ) ( not ( = ?auto_760699 ?auto_760702 ) ) ( not ( = ?auto_760699 ?auto_760703 ) ) ( not ( = ?auto_760699 ?auto_760704 ) ) ( not ( = ?auto_760700 ?auto_760701 ) ) ( not ( = ?auto_760700 ?auto_760702 ) ) ( not ( = ?auto_760700 ?auto_760703 ) ) ( not ( = ?auto_760700 ?auto_760704 ) ) ( not ( = ?auto_760701 ?auto_760702 ) ) ( not ( = ?auto_760701 ?auto_760703 ) ) ( not ( = ?auto_760701 ?auto_760704 ) ) ( not ( = ?auto_760702 ?auto_760703 ) ) ( not ( = ?auto_760702 ?auto_760704 ) ) ( not ( = ?auto_760703 ?auto_760704 ) ) ( ON ?auto_760702 ?auto_760703 ) ( ON ?auto_760701 ?auto_760702 ) ( ON ?auto_760700 ?auto_760701 ) ( ON ?auto_760699 ?auto_760700 ) ( ON ?auto_760698 ?auto_760699 ) ( ON ?auto_760697 ?auto_760698 ) ( ON ?auto_760696 ?auto_760697 ) ( ON ?auto_760695 ?auto_760696 ) ( ON ?auto_760694 ?auto_760695 ) ( ON ?auto_760693 ?auto_760694 ) ( ON ?auto_760692 ?auto_760693 ) ( ON ?auto_760691 ?auto_760692 ) ( CLEAR ?auto_760691 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_760691 )
      ( MAKE-13PILE ?auto_760691 ?auto_760692 ?auto_760693 ?auto_760694 ?auto_760695 ?auto_760696 ?auto_760697 ?auto_760698 ?auto_760699 ?auto_760700 ?auto_760701 ?auto_760702 ?auto_760703 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_760746 - BLOCK
      ?auto_760747 - BLOCK
      ?auto_760748 - BLOCK
      ?auto_760749 - BLOCK
      ?auto_760750 - BLOCK
      ?auto_760751 - BLOCK
      ?auto_760752 - BLOCK
      ?auto_760753 - BLOCK
      ?auto_760754 - BLOCK
      ?auto_760755 - BLOCK
      ?auto_760756 - BLOCK
      ?auto_760757 - BLOCK
      ?auto_760758 - BLOCK
      ?auto_760759 - BLOCK
    )
    :vars
    (
      ?auto_760760 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_760758 ) ( ON ?auto_760759 ?auto_760760 ) ( CLEAR ?auto_760759 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_760746 ) ( ON ?auto_760747 ?auto_760746 ) ( ON ?auto_760748 ?auto_760747 ) ( ON ?auto_760749 ?auto_760748 ) ( ON ?auto_760750 ?auto_760749 ) ( ON ?auto_760751 ?auto_760750 ) ( ON ?auto_760752 ?auto_760751 ) ( ON ?auto_760753 ?auto_760752 ) ( ON ?auto_760754 ?auto_760753 ) ( ON ?auto_760755 ?auto_760754 ) ( ON ?auto_760756 ?auto_760755 ) ( ON ?auto_760757 ?auto_760756 ) ( ON ?auto_760758 ?auto_760757 ) ( not ( = ?auto_760746 ?auto_760747 ) ) ( not ( = ?auto_760746 ?auto_760748 ) ) ( not ( = ?auto_760746 ?auto_760749 ) ) ( not ( = ?auto_760746 ?auto_760750 ) ) ( not ( = ?auto_760746 ?auto_760751 ) ) ( not ( = ?auto_760746 ?auto_760752 ) ) ( not ( = ?auto_760746 ?auto_760753 ) ) ( not ( = ?auto_760746 ?auto_760754 ) ) ( not ( = ?auto_760746 ?auto_760755 ) ) ( not ( = ?auto_760746 ?auto_760756 ) ) ( not ( = ?auto_760746 ?auto_760757 ) ) ( not ( = ?auto_760746 ?auto_760758 ) ) ( not ( = ?auto_760746 ?auto_760759 ) ) ( not ( = ?auto_760746 ?auto_760760 ) ) ( not ( = ?auto_760747 ?auto_760748 ) ) ( not ( = ?auto_760747 ?auto_760749 ) ) ( not ( = ?auto_760747 ?auto_760750 ) ) ( not ( = ?auto_760747 ?auto_760751 ) ) ( not ( = ?auto_760747 ?auto_760752 ) ) ( not ( = ?auto_760747 ?auto_760753 ) ) ( not ( = ?auto_760747 ?auto_760754 ) ) ( not ( = ?auto_760747 ?auto_760755 ) ) ( not ( = ?auto_760747 ?auto_760756 ) ) ( not ( = ?auto_760747 ?auto_760757 ) ) ( not ( = ?auto_760747 ?auto_760758 ) ) ( not ( = ?auto_760747 ?auto_760759 ) ) ( not ( = ?auto_760747 ?auto_760760 ) ) ( not ( = ?auto_760748 ?auto_760749 ) ) ( not ( = ?auto_760748 ?auto_760750 ) ) ( not ( = ?auto_760748 ?auto_760751 ) ) ( not ( = ?auto_760748 ?auto_760752 ) ) ( not ( = ?auto_760748 ?auto_760753 ) ) ( not ( = ?auto_760748 ?auto_760754 ) ) ( not ( = ?auto_760748 ?auto_760755 ) ) ( not ( = ?auto_760748 ?auto_760756 ) ) ( not ( = ?auto_760748 ?auto_760757 ) ) ( not ( = ?auto_760748 ?auto_760758 ) ) ( not ( = ?auto_760748 ?auto_760759 ) ) ( not ( = ?auto_760748 ?auto_760760 ) ) ( not ( = ?auto_760749 ?auto_760750 ) ) ( not ( = ?auto_760749 ?auto_760751 ) ) ( not ( = ?auto_760749 ?auto_760752 ) ) ( not ( = ?auto_760749 ?auto_760753 ) ) ( not ( = ?auto_760749 ?auto_760754 ) ) ( not ( = ?auto_760749 ?auto_760755 ) ) ( not ( = ?auto_760749 ?auto_760756 ) ) ( not ( = ?auto_760749 ?auto_760757 ) ) ( not ( = ?auto_760749 ?auto_760758 ) ) ( not ( = ?auto_760749 ?auto_760759 ) ) ( not ( = ?auto_760749 ?auto_760760 ) ) ( not ( = ?auto_760750 ?auto_760751 ) ) ( not ( = ?auto_760750 ?auto_760752 ) ) ( not ( = ?auto_760750 ?auto_760753 ) ) ( not ( = ?auto_760750 ?auto_760754 ) ) ( not ( = ?auto_760750 ?auto_760755 ) ) ( not ( = ?auto_760750 ?auto_760756 ) ) ( not ( = ?auto_760750 ?auto_760757 ) ) ( not ( = ?auto_760750 ?auto_760758 ) ) ( not ( = ?auto_760750 ?auto_760759 ) ) ( not ( = ?auto_760750 ?auto_760760 ) ) ( not ( = ?auto_760751 ?auto_760752 ) ) ( not ( = ?auto_760751 ?auto_760753 ) ) ( not ( = ?auto_760751 ?auto_760754 ) ) ( not ( = ?auto_760751 ?auto_760755 ) ) ( not ( = ?auto_760751 ?auto_760756 ) ) ( not ( = ?auto_760751 ?auto_760757 ) ) ( not ( = ?auto_760751 ?auto_760758 ) ) ( not ( = ?auto_760751 ?auto_760759 ) ) ( not ( = ?auto_760751 ?auto_760760 ) ) ( not ( = ?auto_760752 ?auto_760753 ) ) ( not ( = ?auto_760752 ?auto_760754 ) ) ( not ( = ?auto_760752 ?auto_760755 ) ) ( not ( = ?auto_760752 ?auto_760756 ) ) ( not ( = ?auto_760752 ?auto_760757 ) ) ( not ( = ?auto_760752 ?auto_760758 ) ) ( not ( = ?auto_760752 ?auto_760759 ) ) ( not ( = ?auto_760752 ?auto_760760 ) ) ( not ( = ?auto_760753 ?auto_760754 ) ) ( not ( = ?auto_760753 ?auto_760755 ) ) ( not ( = ?auto_760753 ?auto_760756 ) ) ( not ( = ?auto_760753 ?auto_760757 ) ) ( not ( = ?auto_760753 ?auto_760758 ) ) ( not ( = ?auto_760753 ?auto_760759 ) ) ( not ( = ?auto_760753 ?auto_760760 ) ) ( not ( = ?auto_760754 ?auto_760755 ) ) ( not ( = ?auto_760754 ?auto_760756 ) ) ( not ( = ?auto_760754 ?auto_760757 ) ) ( not ( = ?auto_760754 ?auto_760758 ) ) ( not ( = ?auto_760754 ?auto_760759 ) ) ( not ( = ?auto_760754 ?auto_760760 ) ) ( not ( = ?auto_760755 ?auto_760756 ) ) ( not ( = ?auto_760755 ?auto_760757 ) ) ( not ( = ?auto_760755 ?auto_760758 ) ) ( not ( = ?auto_760755 ?auto_760759 ) ) ( not ( = ?auto_760755 ?auto_760760 ) ) ( not ( = ?auto_760756 ?auto_760757 ) ) ( not ( = ?auto_760756 ?auto_760758 ) ) ( not ( = ?auto_760756 ?auto_760759 ) ) ( not ( = ?auto_760756 ?auto_760760 ) ) ( not ( = ?auto_760757 ?auto_760758 ) ) ( not ( = ?auto_760757 ?auto_760759 ) ) ( not ( = ?auto_760757 ?auto_760760 ) ) ( not ( = ?auto_760758 ?auto_760759 ) ) ( not ( = ?auto_760758 ?auto_760760 ) ) ( not ( = ?auto_760759 ?auto_760760 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_760759 ?auto_760760 )
      ( !STACK ?auto_760759 ?auto_760758 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_760804 - BLOCK
      ?auto_760805 - BLOCK
      ?auto_760806 - BLOCK
      ?auto_760807 - BLOCK
      ?auto_760808 - BLOCK
      ?auto_760809 - BLOCK
      ?auto_760810 - BLOCK
      ?auto_760811 - BLOCK
      ?auto_760812 - BLOCK
      ?auto_760813 - BLOCK
      ?auto_760814 - BLOCK
      ?auto_760815 - BLOCK
      ?auto_760816 - BLOCK
      ?auto_760817 - BLOCK
    )
    :vars
    (
      ?auto_760818 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_760817 ?auto_760818 ) ( ON-TABLE ?auto_760804 ) ( ON ?auto_760805 ?auto_760804 ) ( ON ?auto_760806 ?auto_760805 ) ( ON ?auto_760807 ?auto_760806 ) ( ON ?auto_760808 ?auto_760807 ) ( ON ?auto_760809 ?auto_760808 ) ( ON ?auto_760810 ?auto_760809 ) ( ON ?auto_760811 ?auto_760810 ) ( ON ?auto_760812 ?auto_760811 ) ( ON ?auto_760813 ?auto_760812 ) ( ON ?auto_760814 ?auto_760813 ) ( ON ?auto_760815 ?auto_760814 ) ( not ( = ?auto_760804 ?auto_760805 ) ) ( not ( = ?auto_760804 ?auto_760806 ) ) ( not ( = ?auto_760804 ?auto_760807 ) ) ( not ( = ?auto_760804 ?auto_760808 ) ) ( not ( = ?auto_760804 ?auto_760809 ) ) ( not ( = ?auto_760804 ?auto_760810 ) ) ( not ( = ?auto_760804 ?auto_760811 ) ) ( not ( = ?auto_760804 ?auto_760812 ) ) ( not ( = ?auto_760804 ?auto_760813 ) ) ( not ( = ?auto_760804 ?auto_760814 ) ) ( not ( = ?auto_760804 ?auto_760815 ) ) ( not ( = ?auto_760804 ?auto_760816 ) ) ( not ( = ?auto_760804 ?auto_760817 ) ) ( not ( = ?auto_760804 ?auto_760818 ) ) ( not ( = ?auto_760805 ?auto_760806 ) ) ( not ( = ?auto_760805 ?auto_760807 ) ) ( not ( = ?auto_760805 ?auto_760808 ) ) ( not ( = ?auto_760805 ?auto_760809 ) ) ( not ( = ?auto_760805 ?auto_760810 ) ) ( not ( = ?auto_760805 ?auto_760811 ) ) ( not ( = ?auto_760805 ?auto_760812 ) ) ( not ( = ?auto_760805 ?auto_760813 ) ) ( not ( = ?auto_760805 ?auto_760814 ) ) ( not ( = ?auto_760805 ?auto_760815 ) ) ( not ( = ?auto_760805 ?auto_760816 ) ) ( not ( = ?auto_760805 ?auto_760817 ) ) ( not ( = ?auto_760805 ?auto_760818 ) ) ( not ( = ?auto_760806 ?auto_760807 ) ) ( not ( = ?auto_760806 ?auto_760808 ) ) ( not ( = ?auto_760806 ?auto_760809 ) ) ( not ( = ?auto_760806 ?auto_760810 ) ) ( not ( = ?auto_760806 ?auto_760811 ) ) ( not ( = ?auto_760806 ?auto_760812 ) ) ( not ( = ?auto_760806 ?auto_760813 ) ) ( not ( = ?auto_760806 ?auto_760814 ) ) ( not ( = ?auto_760806 ?auto_760815 ) ) ( not ( = ?auto_760806 ?auto_760816 ) ) ( not ( = ?auto_760806 ?auto_760817 ) ) ( not ( = ?auto_760806 ?auto_760818 ) ) ( not ( = ?auto_760807 ?auto_760808 ) ) ( not ( = ?auto_760807 ?auto_760809 ) ) ( not ( = ?auto_760807 ?auto_760810 ) ) ( not ( = ?auto_760807 ?auto_760811 ) ) ( not ( = ?auto_760807 ?auto_760812 ) ) ( not ( = ?auto_760807 ?auto_760813 ) ) ( not ( = ?auto_760807 ?auto_760814 ) ) ( not ( = ?auto_760807 ?auto_760815 ) ) ( not ( = ?auto_760807 ?auto_760816 ) ) ( not ( = ?auto_760807 ?auto_760817 ) ) ( not ( = ?auto_760807 ?auto_760818 ) ) ( not ( = ?auto_760808 ?auto_760809 ) ) ( not ( = ?auto_760808 ?auto_760810 ) ) ( not ( = ?auto_760808 ?auto_760811 ) ) ( not ( = ?auto_760808 ?auto_760812 ) ) ( not ( = ?auto_760808 ?auto_760813 ) ) ( not ( = ?auto_760808 ?auto_760814 ) ) ( not ( = ?auto_760808 ?auto_760815 ) ) ( not ( = ?auto_760808 ?auto_760816 ) ) ( not ( = ?auto_760808 ?auto_760817 ) ) ( not ( = ?auto_760808 ?auto_760818 ) ) ( not ( = ?auto_760809 ?auto_760810 ) ) ( not ( = ?auto_760809 ?auto_760811 ) ) ( not ( = ?auto_760809 ?auto_760812 ) ) ( not ( = ?auto_760809 ?auto_760813 ) ) ( not ( = ?auto_760809 ?auto_760814 ) ) ( not ( = ?auto_760809 ?auto_760815 ) ) ( not ( = ?auto_760809 ?auto_760816 ) ) ( not ( = ?auto_760809 ?auto_760817 ) ) ( not ( = ?auto_760809 ?auto_760818 ) ) ( not ( = ?auto_760810 ?auto_760811 ) ) ( not ( = ?auto_760810 ?auto_760812 ) ) ( not ( = ?auto_760810 ?auto_760813 ) ) ( not ( = ?auto_760810 ?auto_760814 ) ) ( not ( = ?auto_760810 ?auto_760815 ) ) ( not ( = ?auto_760810 ?auto_760816 ) ) ( not ( = ?auto_760810 ?auto_760817 ) ) ( not ( = ?auto_760810 ?auto_760818 ) ) ( not ( = ?auto_760811 ?auto_760812 ) ) ( not ( = ?auto_760811 ?auto_760813 ) ) ( not ( = ?auto_760811 ?auto_760814 ) ) ( not ( = ?auto_760811 ?auto_760815 ) ) ( not ( = ?auto_760811 ?auto_760816 ) ) ( not ( = ?auto_760811 ?auto_760817 ) ) ( not ( = ?auto_760811 ?auto_760818 ) ) ( not ( = ?auto_760812 ?auto_760813 ) ) ( not ( = ?auto_760812 ?auto_760814 ) ) ( not ( = ?auto_760812 ?auto_760815 ) ) ( not ( = ?auto_760812 ?auto_760816 ) ) ( not ( = ?auto_760812 ?auto_760817 ) ) ( not ( = ?auto_760812 ?auto_760818 ) ) ( not ( = ?auto_760813 ?auto_760814 ) ) ( not ( = ?auto_760813 ?auto_760815 ) ) ( not ( = ?auto_760813 ?auto_760816 ) ) ( not ( = ?auto_760813 ?auto_760817 ) ) ( not ( = ?auto_760813 ?auto_760818 ) ) ( not ( = ?auto_760814 ?auto_760815 ) ) ( not ( = ?auto_760814 ?auto_760816 ) ) ( not ( = ?auto_760814 ?auto_760817 ) ) ( not ( = ?auto_760814 ?auto_760818 ) ) ( not ( = ?auto_760815 ?auto_760816 ) ) ( not ( = ?auto_760815 ?auto_760817 ) ) ( not ( = ?auto_760815 ?auto_760818 ) ) ( not ( = ?auto_760816 ?auto_760817 ) ) ( not ( = ?auto_760816 ?auto_760818 ) ) ( not ( = ?auto_760817 ?auto_760818 ) ) ( CLEAR ?auto_760815 ) ( ON ?auto_760816 ?auto_760817 ) ( CLEAR ?auto_760816 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_760804 ?auto_760805 ?auto_760806 ?auto_760807 ?auto_760808 ?auto_760809 ?auto_760810 ?auto_760811 ?auto_760812 ?auto_760813 ?auto_760814 ?auto_760815 ?auto_760816 )
      ( MAKE-14PILE ?auto_760804 ?auto_760805 ?auto_760806 ?auto_760807 ?auto_760808 ?auto_760809 ?auto_760810 ?auto_760811 ?auto_760812 ?auto_760813 ?auto_760814 ?auto_760815 ?auto_760816 ?auto_760817 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_760862 - BLOCK
      ?auto_760863 - BLOCK
      ?auto_760864 - BLOCK
      ?auto_760865 - BLOCK
      ?auto_760866 - BLOCK
      ?auto_760867 - BLOCK
      ?auto_760868 - BLOCK
      ?auto_760869 - BLOCK
      ?auto_760870 - BLOCK
      ?auto_760871 - BLOCK
      ?auto_760872 - BLOCK
      ?auto_760873 - BLOCK
      ?auto_760874 - BLOCK
      ?auto_760875 - BLOCK
    )
    :vars
    (
      ?auto_760876 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_760875 ?auto_760876 ) ( ON-TABLE ?auto_760862 ) ( ON ?auto_760863 ?auto_760862 ) ( ON ?auto_760864 ?auto_760863 ) ( ON ?auto_760865 ?auto_760864 ) ( ON ?auto_760866 ?auto_760865 ) ( ON ?auto_760867 ?auto_760866 ) ( ON ?auto_760868 ?auto_760867 ) ( ON ?auto_760869 ?auto_760868 ) ( ON ?auto_760870 ?auto_760869 ) ( ON ?auto_760871 ?auto_760870 ) ( ON ?auto_760872 ?auto_760871 ) ( not ( = ?auto_760862 ?auto_760863 ) ) ( not ( = ?auto_760862 ?auto_760864 ) ) ( not ( = ?auto_760862 ?auto_760865 ) ) ( not ( = ?auto_760862 ?auto_760866 ) ) ( not ( = ?auto_760862 ?auto_760867 ) ) ( not ( = ?auto_760862 ?auto_760868 ) ) ( not ( = ?auto_760862 ?auto_760869 ) ) ( not ( = ?auto_760862 ?auto_760870 ) ) ( not ( = ?auto_760862 ?auto_760871 ) ) ( not ( = ?auto_760862 ?auto_760872 ) ) ( not ( = ?auto_760862 ?auto_760873 ) ) ( not ( = ?auto_760862 ?auto_760874 ) ) ( not ( = ?auto_760862 ?auto_760875 ) ) ( not ( = ?auto_760862 ?auto_760876 ) ) ( not ( = ?auto_760863 ?auto_760864 ) ) ( not ( = ?auto_760863 ?auto_760865 ) ) ( not ( = ?auto_760863 ?auto_760866 ) ) ( not ( = ?auto_760863 ?auto_760867 ) ) ( not ( = ?auto_760863 ?auto_760868 ) ) ( not ( = ?auto_760863 ?auto_760869 ) ) ( not ( = ?auto_760863 ?auto_760870 ) ) ( not ( = ?auto_760863 ?auto_760871 ) ) ( not ( = ?auto_760863 ?auto_760872 ) ) ( not ( = ?auto_760863 ?auto_760873 ) ) ( not ( = ?auto_760863 ?auto_760874 ) ) ( not ( = ?auto_760863 ?auto_760875 ) ) ( not ( = ?auto_760863 ?auto_760876 ) ) ( not ( = ?auto_760864 ?auto_760865 ) ) ( not ( = ?auto_760864 ?auto_760866 ) ) ( not ( = ?auto_760864 ?auto_760867 ) ) ( not ( = ?auto_760864 ?auto_760868 ) ) ( not ( = ?auto_760864 ?auto_760869 ) ) ( not ( = ?auto_760864 ?auto_760870 ) ) ( not ( = ?auto_760864 ?auto_760871 ) ) ( not ( = ?auto_760864 ?auto_760872 ) ) ( not ( = ?auto_760864 ?auto_760873 ) ) ( not ( = ?auto_760864 ?auto_760874 ) ) ( not ( = ?auto_760864 ?auto_760875 ) ) ( not ( = ?auto_760864 ?auto_760876 ) ) ( not ( = ?auto_760865 ?auto_760866 ) ) ( not ( = ?auto_760865 ?auto_760867 ) ) ( not ( = ?auto_760865 ?auto_760868 ) ) ( not ( = ?auto_760865 ?auto_760869 ) ) ( not ( = ?auto_760865 ?auto_760870 ) ) ( not ( = ?auto_760865 ?auto_760871 ) ) ( not ( = ?auto_760865 ?auto_760872 ) ) ( not ( = ?auto_760865 ?auto_760873 ) ) ( not ( = ?auto_760865 ?auto_760874 ) ) ( not ( = ?auto_760865 ?auto_760875 ) ) ( not ( = ?auto_760865 ?auto_760876 ) ) ( not ( = ?auto_760866 ?auto_760867 ) ) ( not ( = ?auto_760866 ?auto_760868 ) ) ( not ( = ?auto_760866 ?auto_760869 ) ) ( not ( = ?auto_760866 ?auto_760870 ) ) ( not ( = ?auto_760866 ?auto_760871 ) ) ( not ( = ?auto_760866 ?auto_760872 ) ) ( not ( = ?auto_760866 ?auto_760873 ) ) ( not ( = ?auto_760866 ?auto_760874 ) ) ( not ( = ?auto_760866 ?auto_760875 ) ) ( not ( = ?auto_760866 ?auto_760876 ) ) ( not ( = ?auto_760867 ?auto_760868 ) ) ( not ( = ?auto_760867 ?auto_760869 ) ) ( not ( = ?auto_760867 ?auto_760870 ) ) ( not ( = ?auto_760867 ?auto_760871 ) ) ( not ( = ?auto_760867 ?auto_760872 ) ) ( not ( = ?auto_760867 ?auto_760873 ) ) ( not ( = ?auto_760867 ?auto_760874 ) ) ( not ( = ?auto_760867 ?auto_760875 ) ) ( not ( = ?auto_760867 ?auto_760876 ) ) ( not ( = ?auto_760868 ?auto_760869 ) ) ( not ( = ?auto_760868 ?auto_760870 ) ) ( not ( = ?auto_760868 ?auto_760871 ) ) ( not ( = ?auto_760868 ?auto_760872 ) ) ( not ( = ?auto_760868 ?auto_760873 ) ) ( not ( = ?auto_760868 ?auto_760874 ) ) ( not ( = ?auto_760868 ?auto_760875 ) ) ( not ( = ?auto_760868 ?auto_760876 ) ) ( not ( = ?auto_760869 ?auto_760870 ) ) ( not ( = ?auto_760869 ?auto_760871 ) ) ( not ( = ?auto_760869 ?auto_760872 ) ) ( not ( = ?auto_760869 ?auto_760873 ) ) ( not ( = ?auto_760869 ?auto_760874 ) ) ( not ( = ?auto_760869 ?auto_760875 ) ) ( not ( = ?auto_760869 ?auto_760876 ) ) ( not ( = ?auto_760870 ?auto_760871 ) ) ( not ( = ?auto_760870 ?auto_760872 ) ) ( not ( = ?auto_760870 ?auto_760873 ) ) ( not ( = ?auto_760870 ?auto_760874 ) ) ( not ( = ?auto_760870 ?auto_760875 ) ) ( not ( = ?auto_760870 ?auto_760876 ) ) ( not ( = ?auto_760871 ?auto_760872 ) ) ( not ( = ?auto_760871 ?auto_760873 ) ) ( not ( = ?auto_760871 ?auto_760874 ) ) ( not ( = ?auto_760871 ?auto_760875 ) ) ( not ( = ?auto_760871 ?auto_760876 ) ) ( not ( = ?auto_760872 ?auto_760873 ) ) ( not ( = ?auto_760872 ?auto_760874 ) ) ( not ( = ?auto_760872 ?auto_760875 ) ) ( not ( = ?auto_760872 ?auto_760876 ) ) ( not ( = ?auto_760873 ?auto_760874 ) ) ( not ( = ?auto_760873 ?auto_760875 ) ) ( not ( = ?auto_760873 ?auto_760876 ) ) ( not ( = ?auto_760874 ?auto_760875 ) ) ( not ( = ?auto_760874 ?auto_760876 ) ) ( not ( = ?auto_760875 ?auto_760876 ) ) ( ON ?auto_760874 ?auto_760875 ) ( CLEAR ?auto_760872 ) ( ON ?auto_760873 ?auto_760874 ) ( CLEAR ?auto_760873 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_760862 ?auto_760863 ?auto_760864 ?auto_760865 ?auto_760866 ?auto_760867 ?auto_760868 ?auto_760869 ?auto_760870 ?auto_760871 ?auto_760872 ?auto_760873 )
      ( MAKE-14PILE ?auto_760862 ?auto_760863 ?auto_760864 ?auto_760865 ?auto_760866 ?auto_760867 ?auto_760868 ?auto_760869 ?auto_760870 ?auto_760871 ?auto_760872 ?auto_760873 ?auto_760874 ?auto_760875 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_760920 - BLOCK
      ?auto_760921 - BLOCK
      ?auto_760922 - BLOCK
      ?auto_760923 - BLOCK
      ?auto_760924 - BLOCK
      ?auto_760925 - BLOCK
      ?auto_760926 - BLOCK
      ?auto_760927 - BLOCK
      ?auto_760928 - BLOCK
      ?auto_760929 - BLOCK
      ?auto_760930 - BLOCK
      ?auto_760931 - BLOCK
      ?auto_760932 - BLOCK
      ?auto_760933 - BLOCK
    )
    :vars
    (
      ?auto_760934 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_760933 ?auto_760934 ) ( ON-TABLE ?auto_760920 ) ( ON ?auto_760921 ?auto_760920 ) ( ON ?auto_760922 ?auto_760921 ) ( ON ?auto_760923 ?auto_760922 ) ( ON ?auto_760924 ?auto_760923 ) ( ON ?auto_760925 ?auto_760924 ) ( ON ?auto_760926 ?auto_760925 ) ( ON ?auto_760927 ?auto_760926 ) ( ON ?auto_760928 ?auto_760927 ) ( ON ?auto_760929 ?auto_760928 ) ( not ( = ?auto_760920 ?auto_760921 ) ) ( not ( = ?auto_760920 ?auto_760922 ) ) ( not ( = ?auto_760920 ?auto_760923 ) ) ( not ( = ?auto_760920 ?auto_760924 ) ) ( not ( = ?auto_760920 ?auto_760925 ) ) ( not ( = ?auto_760920 ?auto_760926 ) ) ( not ( = ?auto_760920 ?auto_760927 ) ) ( not ( = ?auto_760920 ?auto_760928 ) ) ( not ( = ?auto_760920 ?auto_760929 ) ) ( not ( = ?auto_760920 ?auto_760930 ) ) ( not ( = ?auto_760920 ?auto_760931 ) ) ( not ( = ?auto_760920 ?auto_760932 ) ) ( not ( = ?auto_760920 ?auto_760933 ) ) ( not ( = ?auto_760920 ?auto_760934 ) ) ( not ( = ?auto_760921 ?auto_760922 ) ) ( not ( = ?auto_760921 ?auto_760923 ) ) ( not ( = ?auto_760921 ?auto_760924 ) ) ( not ( = ?auto_760921 ?auto_760925 ) ) ( not ( = ?auto_760921 ?auto_760926 ) ) ( not ( = ?auto_760921 ?auto_760927 ) ) ( not ( = ?auto_760921 ?auto_760928 ) ) ( not ( = ?auto_760921 ?auto_760929 ) ) ( not ( = ?auto_760921 ?auto_760930 ) ) ( not ( = ?auto_760921 ?auto_760931 ) ) ( not ( = ?auto_760921 ?auto_760932 ) ) ( not ( = ?auto_760921 ?auto_760933 ) ) ( not ( = ?auto_760921 ?auto_760934 ) ) ( not ( = ?auto_760922 ?auto_760923 ) ) ( not ( = ?auto_760922 ?auto_760924 ) ) ( not ( = ?auto_760922 ?auto_760925 ) ) ( not ( = ?auto_760922 ?auto_760926 ) ) ( not ( = ?auto_760922 ?auto_760927 ) ) ( not ( = ?auto_760922 ?auto_760928 ) ) ( not ( = ?auto_760922 ?auto_760929 ) ) ( not ( = ?auto_760922 ?auto_760930 ) ) ( not ( = ?auto_760922 ?auto_760931 ) ) ( not ( = ?auto_760922 ?auto_760932 ) ) ( not ( = ?auto_760922 ?auto_760933 ) ) ( not ( = ?auto_760922 ?auto_760934 ) ) ( not ( = ?auto_760923 ?auto_760924 ) ) ( not ( = ?auto_760923 ?auto_760925 ) ) ( not ( = ?auto_760923 ?auto_760926 ) ) ( not ( = ?auto_760923 ?auto_760927 ) ) ( not ( = ?auto_760923 ?auto_760928 ) ) ( not ( = ?auto_760923 ?auto_760929 ) ) ( not ( = ?auto_760923 ?auto_760930 ) ) ( not ( = ?auto_760923 ?auto_760931 ) ) ( not ( = ?auto_760923 ?auto_760932 ) ) ( not ( = ?auto_760923 ?auto_760933 ) ) ( not ( = ?auto_760923 ?auto_760934 ) ) ( not ( = ?auto_760924 ?auto_760925 ) ) ( not ( = ?auto_760924 ?auto_760926 ) ) ( not ( = ?auto_760924 ?auto_760927 ) ) ( not ( = ?auto_760924 ?auto_760928 ) ) ( not ( = ?auto_760924 ?auto_760929 ) ) ( not ( = ?auto_760924 ?auto_760930 ) ) ( not ( = ?auto_760924 ?auto_760931 ) ) ( not ( = ?auto_760924 ?auto_760932 ) ) ( not ( = ?auto_760924 ?auto_760933 ) ) ( not ( = ?auto_760924 ?auto_760934 ) ) ( not ( = ?auto_760925 ?auto_760926 ) ) ( not ( = ?auto_760925 ?auto_760927 ) ) ( not ( = ?auto_760925 ?auto_760928 ) ) ( not ( = ?auto_760925 ?auto_760929 ) ) ( not ( = ?auto_760925 ?auto_760930 ) ) ( not ( = ?auto_760925 ?auto_760931 ) ) ( not ( = ?auto_760925 ?auto_760932 ) ) ( not ( = ?auto_760925 ?auto_760933 ) ) ( not ( = ?auto_760925 ?auto_760934 ) ) ( not ( = ?auto_760926 ?auto_760927 ) ) ( not ( = ?auto_760926 ?auto_760928 ) ) ( not ( = ?auto_760926 ?auto_760929 ) ) ( not ( = ?auto_760926 ?auto_760930 ) ) ( not ( = ?auto_760926 ?auto_760931 ) ) ( not ( = ?auto_760926 ?auto_760932 ) ) ( not ( = ?auto_760926 ?auto_760933 ) ) ( not ( = ?auto_760926 ?auto_760934 ) ) ( not ( = ?auto_760927 ?auto_760928 ) ) ( not ( = ?auto_760927 ?auto_760929 ) ) ( not ( = ?auto_760927 ?auto_760930 ) ) ( not ( = ?auto_760927 ?auto_760931 ) ) ( not ( = ?auto_760927 ?auto_760932 ) ) ( not ( = ?auto_760927 ?auto_760933 ) ) ( not ( = ?auto_760927 ?auto_760934 ) ) ( not ( = ?auto_760928 ?auto_760929 ) ) ( not ( = ?auto_760928 ?auto_760930 ) ) ( not ( = ?auto_760928 ?auto_760931 ) ) ( not ( = ?auto_760928 ?auto_760932 ) ) ( not ( = ?auto_760928 ?auto_760933 ) ) ( not ( = ?auto_760928 ?auto_760934 ) ) ( not ( = ?auto_760929 ?auto_760930 ) ) ( not ( = ?auto_760929 ?auto_760931 ) ) ( not ( = ?auto_760929 ?auto_760932 ) ) ( not ( = ?auto_760929 ?auto_760933 ) ) ( not ( = ?auto_760929 ?auto_760934 ) ) ( not ( = ?auto_760930 ?auto_760931 ) ) ( not ( = ?auto_760930 ?auto_760932 ) ) ( not ( = ?auto_760930 ?auto_760933 ) ) ( not ( = ?auto_760930 ?auto_760934 ) ) ( not ( = ?auto_760931 ?auto_760932 ) ) ( not ( = ?auto_760931 ?auto_760933 ) ) ( not ( = ?auto_760931 ?auto_760934 ) ) ( not ( = ?auto_760932 ?auto_760933 ) ) ( not ( = ?auto_760932 ?auto_760934 ) ) ( not ( = ?auto_760933 ?auto_760934 ) ) ( ON ?auto_760932 ?auto_760933 ) ( ON ?auto_760931 ?auto_760932 ) ( CLEAR ?auto_760929 ) ( ON ?auto_760930 ?auto_760931 ) ( CLEAR ?auto_760930 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_760920 ?auto_760921 ?auto_760922 ?auto_760923 ?auto_760924 ?auto_760925 ?auto_760926 ?auto_760927 ?auto_760928 ?auto_760929 ?auto_760930 )
      ( MAKE-14PILE ?auto_760920 ?auto_760921 ?auto_760922 ?auto_760923 ?auto_760924 ?auto_760925 ?auto_760926 ?auto_760927 ?auto_760928 ?auto_760929 ?auto_760930 ?auto_760931 ?auto_760932 ?auto_760933 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_760978 - BLOCK
      ?auto_760979 - BLOCK
      ?auto_760980 - BLOCK
      ?auto_760981 - BLOCK
      ?auto_760982 - BLOCK
      ?auto_760983 - BLOCK
      ?auto_760984 - BLOCK
      ?auto_760985 - BLOCK
      ?auto_760986 - BLOCK
      ?auto_760987 - BLOCK
      ?auto_760988 - BLOCK
      ?auto_760989 - BLOCK
      ?auto_760990 - BLOCK
      ?auto_760991 - BLOCK
    )
    :vars
    (
      ?auto_760992 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_760991 ?auto_760992 ) ( ON-TABLE ?auto_760978 ) ( ON ?auto_760979 ?auto_760978 ) ( ON ?auto_760980 ?auto_760979 ) ( ON ?auto_760981 ?auto_760980 ) ( ON ?auto_760982 ?auto_760981 ) ( ON ?auto_760983 ?auto_760982 ) ( ON ?auto_760984 ?auto_760983 ) ( ON ?auto_760985 ?auto_760984 ) ( ON ?auto_760986 ?auto_760985 ) ( not ( = ?auto_760978 ?auto_760979 ) ) ( not ( = ?auto_760978 ?auto_760980 ) ) ( not ( = ?auto_760978 ?auto_760981 ) ) ( not ( = ?auto_760978 ?auto_760982 ) ) ( not ( = ?auto_760978 ?auto_760983 ) ) ( not ( = ?auto_760978 ?auto_760984 ) ) ( not ( = ?auto_760978 ?auto_760985 ) ) ( not ( = ?auto_760978 ?auto_760986 ) ) ( not ( = ?auto_760978 ?auto_760987 ) ) ( not ( = ?auto_760978 ?auto_760988 ) ) ( not ( = ?auto_760978 ?auto_760989 ) ) ( not ( = ?auto_760978 ?auto_760990 ) ) ( not ( = ?auto_760978 ?auto_760991 ) ) ( not ( = ?auto_760978 ?auto_760992 ) ) ( not ( = ?auto_760979 ?auto_760980 ) ) ( not ( = ?auto_760979 ?auto_760981 ) ) ( not ( = ?auto_760979 ?auto_760982 ) ) ( not ( = ?auto_760979 ?auto_760983 ) ) ( not ( = ?auto_760979 ?auto_760984 ) ) ( not ( = ?auto_760979 ?auto_760985 ) ) ( not ( = ?auto_760979 ?auto_760986 ) ) ( not ( = ?auto_760979 ?auto_760987 ) ) ( not ( = ?auto_760979 ?auto_760988 ) ) ( not ( = ?auto_760979 ?auto_760989 ) ) ( not ( = ?auto_760979 ?auto_760990 ) ) ( not ( = ?auto_760979 ?auto_760991 ) ) ( not ( = ?auto_760979 ?auto_760992 ) ) ( not ( = ?auto_760980 ?auto_760981 ) ) ( not ( = ?auto_760980 ?auto_760982 ) ) ( not ( = ?auto_760980 ?auto_760983 ) ) ( not ( = ?auto_760980 ?auto_760984 ) ) ( not ( = ?auto_760980 ?auto_760985 ) ) ( not ( = ?auto_760980 ?auto_760986 ) ) ( not ( = ?auto_760980 ?auto_760987 ) ) ( not ( = ?auto_760980 ?auto_760988 ) ) ( not ( = ?auto_760980 ?auto_760989 ) ) ( not ( = ?auto_760980 ?auto_760990 ) ) ( not ( = ?auto_760980 ?auto_760991 ) ) ( not ( = ?auto_760980 ?auto_760992 ) ) ( not ( = ?auto_760981 ?auto_760982 ) ) ( not ( = ?auto_760981 ?auto_760983 ) ) ( not ( = ?auto_760981 ?auto_760984 ) ) ( not ( = ?auto_760981 ?auto_760985 ) ) ( not ( = ?auto_760981 ?auto_760986 ) ) ( not ( = ?auto_760981 ?auto_760987 ) ) ( not ( = ?auto_760981 ?auto_760988 ) ) ( not ( = ?auto_760981 ?auto_760989 ) ) ( not ( = ?auto_760981 ?auto_760990 ) ) ( not ( = ?auto_760981 ?auto_760991 ) ) ( not ( = ?auto_760981 ?auto_760992 ) ) ( not ( = ?auto_760982 ?auto_760983 ) ) ( not ( = ?auto_760982 ?auto_760984 ) ) ( not ( = ?auto_760982 ?auto_760985 ) ) ( not ( = ?auto_760982 ?auto_760986 ) ) ( not ( = ?auto_760982 ?auto_760987 ) ) ( not ( = ?auto_760982 ?auto_760988 ) ) ( not ( = ?auto_760982 ?auto_760989 ) ) ( not ( = ?auto_760982 ?auto_760990 ) ) ( not ( = ?auto_760982 ?auto_760991 ) ) ( not ( = ?auto_760982 ?auto_760992 ) ) ( not ( = ?auto_760983 ?auto_760984 ) ) ( not ( = ?auto_760983 ?auto_760985 ) ) ( not ( = ?auto_760983 ?auto_760986 ) ) ( not ( = ?auto_760983 ?auto_760987 ) ) ( not ( = ?auto_760983 ?auto_760988 ) ) ( not ( = ?auto_760983 ?auto_760989 ) ) ( not ( = ?auto_760983 ?auto_760990 ) ) ( not ( = ?auto_760983 ?auto_760991 ) ) ( not ( = ?auto_760983 ?auto_760992 ) ) ( not ( = ?auto_760984 ?auto_760985 ) ) ( not ( = ?auto_760984 ?auto_760986 ) ) ( not ( = ?auto_760984 ?auto_760987 ) ) ( not ( = ?auto_760984 ?auto_760988 ) ) ( not ( = ?auto_760984 ?auto_760989 ) ) ( not ( = ?auto_760984 ?auto_760990 ) ) ( not ( = ?auto_760984 ?auto_760991 ) ) ( not ( = ?auto_760984 ?auto_760992 ) ) ( not ( = ?auto_760985 ?auto_760986 ) ) ( not ( = ?auto_760985 ?auto_760987 ) ) ( not ( = ?auto_760985 ?auto_760988 ) ) ( not ( = ?auto_760985 ?auto_760989 ) ) ( not ( = ?auto_760985 ?auto_760990 ) ) ( not ( = ?auto_760985 ?auto_760991 ) ) ( not ( = ?auto_760985 ?auto_760992 ) ) ( not ( = ?auto_760986 ?auto_760987 ) ) ( not ( = ?auto_760986 ?auto_760988 ) ) ( not ( = ?auto_760986 ?auto_760989 ) ) ( not ( = ?auto_760986 ?auto_760990 ) ) ( not ( = ?auto_760986 ?auto_760991 ) ) ( not ( = ?auto_760986 ?auto_760992 ) ) ( not ( = ?auto_760987 ?auto_760988 ) ) ( not ( = ?auto_760987 ?auto_760989 ) ) ( not ( = ?auto_760987 ?auto_760990 ) ) ( not ( = ?auto_760987 ?auto_760991 ) ) ( not ( = ?auto_760987 ?auto_760992 ) ) ( not ( = ?auto_760988 ?auto_760989 ) ) ( not ( = ?auto_760988 ?auto_760990 ) ) ( not ( = ?auto_760988 ?auto_760991 ) ) ( not ( = ?auto_760988 ?auto_760992 ) ) ( not ( = ?auto_760989 ?auto_760990 ) ) ( not ( = ?auto_760989 ?auto_760991 ) ) ( not ( = ?auto_760989 ?auto_760992 ) ) ( not ( = ?auto_760990 ?auto_760991 ) ) ( not ( = ?auto_760990 ?auto_760992 ) ) ( not ( = ?auto_760991 ?auto_760992 ) ) ( ON ?auto_760990 ?auto_760991 ) ( ON ?auto_760989 ?auto_760990 ) ( ON ?auto_760988 ?auto_760989 ) ( CLEAR ?auto_760986 ) ( ON ?auto_760987 ?auto_760988 ) ( CLEAR ?auto_760987 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_760978 ?auto_760979 ?auto_760980 ?auto_760981 ?auto_760982 ?auto_760983 ?auto_760984 ?auto_760985 ?auto_760986 ?auto_760987 )
      ( MAKE-14PILE ?auto_760978 ?auto_760979 ?auto_760980 ?auto_760981 ?auto_760982 ?auto_760983 ?auto_760984 ?auto_760985 ?auto_760986 ?auto_760987 ?auto_760988 ?auto_760989 ?auto_760990 ?auto_760991 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_761036 - BLOCK
      ?auto_761037 - BLOCK
      ?auto_761038 - BLOCK
      ?auto_761039 - BLOCK
      ?auto_761040 - BLOCK
      ?auto_761041 - BLOCK
      ?auto_761042 - BLOCK
      ?auto_761043 - BLOCK
      ?auto_761044 - BLOCK
      ?auto_761045 - BLOCK
      ?auto_761046 - BLOCK
      ?auto_761047 - BLOCK
      ?auto_761048 - BLOCK
      ?auto_761049 - BLOCK
    )
    :vars
    (
      ?auto_761050 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_761049 ?auto_761050 ) ( ON-TABLE ?auto_761036 ) ( ON ?auto_761037 ?auto_761036 ) ( ON ?auto_761038 ?auto_761037 ) ( ON ?auto_761039 ?auto_761038 ) ( ON ?auto_761040 ?auto_761039 ) ( ON ?auto_761041 ?auto_761040 ) ( ON ?auto_761042 ?auto_761041 ) ( ON ?auto_761043 ?auto_761042 ) ( not ( = ?auto_761036 ?auto_761037 ) ) ( not ( = ?auto_761036 ?auto_761038 ) ) ( not ( = ?auto_761036 ?auto_761039 ) ) ( not ( = ?auto_761036 ?auto_761040 ) ) ( not ( = ?auto_761036 ?auto_761041 ) ) ( not ( = ?auto_761036 ?auto_761042 ) ) ( not ( = ?auto_761036 ?auto_761043 ) ) ( not ( = ?auto_761036 ?auto_761044 ) ) ( not ( = ?auto_761036 ?auto_761045 ) ) ( not ( = ?auto_761036 ?auto_761046 ) ) ( not ( = ?auto_761036 ?auto_761047 ) ) ( not ( = ?auto_761036 ?auto_761048 ) ) ( not ( = ?auto_761036 ?auto_761049 ) ) ( not ( = ?auto_761036 ?auto_761050 ) ) ( not ( = ?auto_761037 ?auto_761038 ) ) ( not ( = ?auto_761037 ?auto_761039 ) ) ( not ( = ?auto_761037 ?auto_761040 ) ) ( not ( = ?auto_761037 ?auto_761041 ) ) ( not ( = ?auto_761037 ?auto_761042 ) ) ( not ( = ?auto_761037 ?auto_761043 ) ) ( not ( = ?auto_761037 ?auto_761044 ) ) ( not ( = ?auto_761037 ?auto_761045 ) ) ( not ( = ?auto_761037 ?auto_761046 ) ) ( not ( = ?auto_761037 ?auto_761047 ) ) ( not ( = ?auto_761037 ?auto_761048 ) ) ( not ( = ?auto_761037 ?auto_761049 ) ) ( not ( = ?auto_761037 ?auto_761050 ) ) ( not ( = ?auto_761038 ?auto_761039 ) ) ( not ( = ?auto_761038 ?auto_761040 ) ) ( not ( = ?auto_761038 ?auto_761041 ) ) ( not ( = ?auto_761038 ?auto_761042 ) ) ( not ( = ?auto_761038 ?auto_761043 ) ) ( not ( = ?auto_761038 ?auto_761044 ) ) ( not ( = ?auto_761038 ?auto_761045 ) ) ( not ( = ?auto_761038 ?auto_761046 ) ) ( not ( = ?auto_761038 ?auto_761047 ) ) ( not ( = ?auto_761038 ?auto_761048 ) ) ( not ( = ?auto_761038 ?auto_761049 ) ) ( not ( = ?auto_761038 ?auto_761050 ) ) ( not ( = ?auto_761039 ?auto_761040 ) ) ( not ( = ?auto_761039 ?auto_761041 ) ) ( not ( = ?auto_761039 ?auto_761042 ) ) ( not ( = ?auto_761039 ?auto_761043 ) ) ( not ( = ?auto_761039 ?auto_761044 ) ) ( not ( = ?auto_761039 ?auto_761045 ) ) ( not ( = ?auto_761039 ?auto_761046 ) ) ( not ( = ?auto_761039 ?auto_761047 ) ) ( not ( = ?auto_761039 ?auto_761048 ) ) ( not ( = ?auto_761039 ?auto_761049 ) ) ( not ( = ?auto_761039 ?auto_761050 ) ) ( not ( = ?auto_761040 ?auto_761041 ) ) ( not ( = ?auto_761040 ?auto_761042 ) ) ( not ( = ?auto_761040 ?auto_761043 ) ) ( not ( = ?auto_761040 ?auto_761044 ) ) ( not ( = ?auto_761040 ?auto_761045 ) ) ( not ( = ?auto_761040 ?auto_761046 ) ) ( not ( = ?auto_761040 ?auto_761047 ) ) ( not ( = ?auto_761040 ?auto_761048 ) ) ( not ( = ?auto_761040 ?auto_761049 ) ) ( not ( = ?auto_761040 ?auto_761050 ) ) ( not ( = ?auto_761041 ?auto_761042 ) ) ( not ( = ?auto_761041 ?auto_761043 ) ) ( not ( = ?auto_761041 ?auto_761044 ) ) ( not ( = ?auto_761041 ?auto_761045 ) ) ( not ( = ?auto_761041 ?auto_761046 ) ) ( not ( = ?auto_761041 ?auto_761047 ) ) ( not ( = ?auto_761041 ?auto_761048 ) ) ( not ( = ?auto_761041 ?auto_761049 ) ) ( not ( = ?auto_761041 ?auto_761050 ) ) ( not ( = ?auto_761042 ?auto_761043 ) ) ( not ( = ?auto_761042 ?auto_761044 ) ) ( not ( = ?auto_761042 ?auto_761045 ) ) ( not ( = ?auto_761042 ?auto_761046 ) ) ( not ( = ?auto_761042 ?auto_761047 ) ) ( not ( = ?auto_761042 ?auto_761048 ) ) ( not ( = ?auto_761042 ?auto_761049 ) ) ( not ( = ?auto_761042 ?auto_761050 ) ) ( not ( = ?auto_761043 ?auto_761044 ) ) ( not ( = ?auto_761043 ?auto_761045 ) ) ( not ( = ?auto_761043 ?auto_761046 ) ) ( not ( = ?auto_761043 ?auto_761047 ) ) ( not ( = ?auto_761043 ?auto_761048 ) ) ( not ( = ?auto_761043 ?auto_761049 ) ) ( not ( = ?auto_761043 ?auto_761050 ) ) ( not ( = ?auto_761044 ?auto_761045 ) ) ( not ( = ?auto_761044 ?auto_761046 ) ) ( not ( = ?auto_761044 ?auto_761047 ) ) ( not ( = ?auto_761044 ?auto_761048 ) ) ( not ( = ?auto_761044 ?auto_761049 ) ) ( not ( = ?auto_761044 ?auto_761050 ) ) ( not ( = ?auto_761045 ?auto_761046 ) ) ( not ( = ?auto_761045 ?auto_761047 ) ) ( not ( = ?auto_761045 ?auto_761048 ) ) ( not ( = ?auto_761045 ?auto_761049 ) ) ( not ( = ?auto_761045 ?auto_761050 ) ) ( not ( = ?auto_761046 ?auto_761047 ) ) ( not ( = ?auto_761046 ?auto_761048 ) ) ( not ( = ?auto_761046 ?auto_761049 ) ) ( not ( = ?auto_761046 ?auto_761050 ) ) ( not ( = ?auto_761047 ?auto_761048 ) ) ( not ( = ?auto_761047 ?auto_761049 ) ) ( not ( = ?auto_761047 ?auto_761050 ) ) ( not ( = ?auto_761048 ?auto_761049 ) ) ( not ( = ?auto_761048 ?auto_761050 ) ) ( not ( = ?auto_761049 ?auto_761050 ) ) ( ON ?auto_761048 ?auto_761049 ) ( ON ?auto_761047 ?auto_761048 ) ( ON ?auto_761046 ?auto_761047 ) ( ON ?auto_761045 ?auto_761046 ) ( CLEAR ?auto_761043 ) ( ON ?auto_761044 ?auto_761045 ) ( CLEAR ?auto_761044 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_761036 ?auto_761037 ?auto_761038 ?auto_761039 ?auto_761040 ?auto_761041 ?auto_761042 ?auto_761043 ?auto_761044 )
      ( MAKE-14PILE ?auto_761036 ?auto_761037 ?auto_761038 ?auto_761039 ?auto_761040 ?auto_761041 ?auto_761042 ?auto_761043 ?auto_761044 ?auto_761045 ?auto_761046 ?auto_761047 ?auto_761048 ?auto_761049 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_761094 - BLOCK
      ?auto_761095 - BLOCK
      ?auto_761096 - BLOCK
      ?auto_761097 - BLOCK
      ?auto_761098 - BLOCK
      ?auto_761099 - BLOCK
      ?auto_761100 - BLOCK
      ?auto_761101 - BLOCK
      ?auto_761102 - BLOCK
      ?auto_761103 - BLOCK
      ?auto_761104 - BLOCK
      ?auto_761105 - BLOCK
      ?auto_761106 - BLOCK
      ?auto_761107 - BLOCK
    )
    :vars
    (
      ?auto_761108 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_761107 ?auto_761108 ) ( ON-TABLE ?auto_761094 ) ( ON ?auto_761095 ?auto_761094 ) ( ON ?auto_761096 ?auto_761095 ) ( ON ?auto_761097 ?auto_761096 ) ( ON ?auto_761098 ?auto_761097 ) ( ON ?auto_761099 ?auto_761098 ) ( ON ?auto_761100 ?auto_761099 ) ( not ( = ?auto_761094 ?auto_761095 ) ) ( not ( = ?auto_761094 ?auto_761096 ) ) ( not ( = ?auto_761094 ?auto_761097 ) ) ( not ( = ?auto_761094 ?auto_761098 ) ) ( not ( = ?auto_761094 ?auto_761099 ) ) ( not ( = ?auto_761094 ?auto_761100 ) ) ( not ( = ?auto_761094 ?auto_761101 ) ) ( not ( = ?auto_761094 ?auto_761102 ) ) ( not ( = ?auto_761094 ?auto_761103 ) ) ( not ( = ?auto_761094 ?auto_761104 ) ) ( not ( = ?auto_761094 ?auto_761105 ) ) ( not ( = ?auto_761094 ?auto_761106 ) ) ( not ( = ?auto_761094 ?auto_761107 ) ) ( not ( = ?auto_761094 ?auto_761108 ) ) ( not ( = ?auto_761095 ?auto_761096 ) ) ( not ( = ?auto_761095 ?auto_761097 ) ) ( not ( = ?auto_761095 ?auto_761098 ) ) ( not ( = ?auto_761095 ?auto_761099 ) ) ( not ( = ?auto_761095 ?auto_761100 ) ) ( not ( = ?auto_761095 ?auto_761101 ) ) ( not ( = ?auto_761095 ?auto_761102 ) ) ( not ( = ?auto_761095 ?auto_761103 ) ) ( not ( = ?auto_761095 ?auto_761104 ) ) ( not ( = ?auto_761095 ?auto_761105 ) ) ( not ( = ?auto_761095 ?auto_761106 ) ) ( not ( = ?auto_761095 ?auto_761107 ) ) ( not ( = ?auto_761095 ?auto_761108 ) ) ( not ( = ?auto_761096 ?auto_761097 ) ) ( not ( = ?auto_761096 ?auto_761098 ) ) ( not ( = ?auto_761096 ?auto_761099 ) ) ( not ( = ?auto_761096 ?auto_761100 ) ) ( not ( = ?auto_761096 ?auto_761101 ) ) ( not ( = ?auto_761096 ?auto_761102 ) ) ( not ( = ?auto_761096 ?auto_761103 ) ) ( not ( = ?auto_761096 ?auto_761104 ) ) ( not ( = ?auto_761096 ?auto_761105 ) ) ( not ( = ?auto_761096 ?auto_761106 ) ) ( not ( = ?auto_761096 ?auto_761107 ) ) ( not ( = ?auto_761096 ?auto_761108 ) ) ( not ( = ?auto_761097 ?auto_761098 ) ) ( not ( = ?auto_761097 ?auto_761099 ) ) ( not ( = ?auto_761097 ?auto_761100 ) ) ( not ( = ?auto_761097 ?auto_761101 ) ) ( not ( = ?auto_761097 ?auto_761102 ) ) ( not ( = ?auto_761097 ?auto_761103 ) ) ( not ( = ?auto_761097 ?auto_761104 ) ) ( not ( = ?auto_761097 ?auto_761105 ) ) ( not ( = ?auto_761097 ?auto_761106 ) ) ( not ( = ?auto_761097 ?auto_761107 ) ) ( not ( = ?auto_761097 ?auto_761108 ) ) ( not ( = ?auto_761098 ?auto_761099 ) ) ( not ( = ?auto_761098 ?auto_761100 ) ) ( not ( = ?auto_761098 ?auto_761101 ) ) ( not ( = ?auto_761098 ?auto_761102 ) ) ( not ( = ?auto_761098 ?auto_761103 ) ) ( not ( = ?auto_761098 ?auto_761104 ) ) ( not ( = ?auto_761098 ?auto_761105 ) ) ( not ( = ?auto_761098 ?auto_761106 ) ) ( not ( = ?auto_761098 ?auto_761107 ) ) ( not ( = ?auto_761098 ?auto_761108 ) ) ( not ( = ?auto_761099 ?auto_761100 ) ) ( not ( = ?auto_761099 ?auto_761101 ) ) ( not ( = ?auto_761099 ?auto_761102 ) ) ( not ( = ?auto_761099 ?auto_761103 ) ) ( not ( = ?auto_761099 ?auto_761104 ) ) ( not ( = ?auto_761099 ?auto_761105 ) ) ( not ( = ?auto_761099 ?auto_761106 ) ) ( not ( = ?auto_761099 ?auto_761107 ) ) ( not ( = ?auto_761099 ?auto_761108 ) ) ( not ( = ?auto_761100 ?auto_761101 ) ) ( not ( = ?auto_761100 ?auto_761102 ) ) ( not ( = ?auto_761100 ?auto_761103 ) ) ( not ( = ?auto_761100 ?auto_761104 ) ) ( not ( = ?auto_761100 ?auto_761105 ) ) ( not ( = ?auto_761100 ?auto_761106 ) ) ( not ( = ?auto_761100 ?auto_761107 ) ) ( not ( = ?auto_761100 ?auto_761108 ) ) ( not ( = ?auto_761101 ?auto_761102 ) ) ( not ( = ?auto_761101 ?auto_761103 ) ) ( not ( = ?auto_761101 ?auto_761104 ) ) ( not ( = ?auto_761101 ?auto_761105 ) ) ( not ( = ?auto_761101 ?auto_761106 ) ) ( not ( = ?auto_761101 ?auto_761107 ) ) ( not ( = ?auto_761101 ?auto_761108 ) ) ( not ( = ?auto_761102 ?auto_761103 ) ) ( not ( = ?auto_761102 ?auto_761104 ) ) ( not ( = ?auto_761102 ?auto_761105 ) ) ( not ( = ?auto_761102 ?auto_761106 ) ) ( not ( = ?auto_761102 ?auto_761107 ) ) ( not ( = ?auto_761102 ?auto_761108 ) ) ( not ( = ?auto_761103 ?auto_761104 ) ) ( not ( = ?auto_761103 ?auto_761105 ) ) ( not ( = ?auto_761103 ?auto_761106 ) ) ( not ( = ?auto_761103 ?auto_761107 ) ) ( not ( = ?auto_761103 ?auto_761108 ) ) ( not ( = ?auto_761104 ?auto_761105 ) ) ( not ( = ?auto_761104 ?auto_761106 ) ) ( not ( = ?auto_761104 ?auto_761107 ) ) ( not ( = ?auto_761104 ?auto_761108 ) ) ( not ( = ?auto_761105 ?auto_761106 ) ) ( not ( = ?auto_761105 ?auto_761107 ) ) ( not ( = ?auto_761105 ?auto_761108 ) ) ( not ( = ?auto_761106 ?auto_761107 ) ) ( not ( = ?auto_761106 ?auto_761108 ) ) ( not ( = ?auto_761107 ?auto_761108 ) ) ( ON ?auto_761106 ?auto_761107 ) ( ON ?auto_761105 ?auto_761106 ) ( ON ?auto_761104 ?auto_761105 ) ( ON ?auto_761103 ?auto_761104 ) ( ON ?auto_761102 ?auto_761103 ) ( CLEAR ?auto_761100 ) ( ON ?auto_761101 ?auto_761102 ) ( CLEAR ?auto_761101 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_761094 ?auto_761095 ?auto_761096 ?auto_761097 ?auto_761098 ?auto_761099 ?auto_761100 ?auto_761101 )
      ( MAKE-14PILE ?auto_761094 ?auto_761095 ?auto_761096 ?auto_761097 ?auto_761098 ?auto_761099 ?auto_761100 ?auto_761101 ?auto_761102 ?auto_761103 ?auto_761104 ?auto_761105 ?auto_761106 ?auto_761107 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_761152 - BLOCK
      ?auto_761153 - BLOCK
      ?auto_761154 - BLOCK
      ?auto_761155 - BLOCK
      ?auto_761156 - BLOCK
      ?auto_761157 - BLOCK
      ?auto_761158 - BLOCK
      ?auto_761159 - BLOCK
      ?auto_761160 - BLOCK
      ?auto_761161 - BLOCK
      ?auto_761162 - BLOCK
      ?auto_761163 - BLOCK
      ?auto_761164 - BLOCK
      ?auto_761165 - BLOCK
    )
    :vars
    (
      ?auto_761166 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_761165 ?auto_761166 ) ( ON-TABLE ?auto_761152 ) ( ON ?auto_761153 ?auto_761152 ) ( ON ?auto_761154 ?auto_761153 ) ( ON ?auto_761155 ?auto_761154 ) ( ON ?auto_761156 ?auto_761155 ) ( ON ?auto_761157 ?auto_761156 ) ( not ( = ?auto_761152 ?auto_761153 ) ) ( not ( = ?auto_761152 ?auto_761154 ) ) ( not ( = ?auto_761152 ?auto_761155 ) ) ( not ( = ?auto_761152 ?auto_761156 ) ) ( not ( = ?auto_761152 ?auto_761157 ) ) ( not ( = ?auto_761152 ?auto_761158 ) ) ( not ( = ?auto_761152 ?auto_761159 ) ) ( not ( = ?auto_761152 ?auto_761160 ) ) ( not ( = ?auto_761152 ?auto_761161 ) ) ( not ( = ?auto_761152 ?auto_761162 ) ) ( not ( = ?auto_761152 ?auto_761163 ) ) ( not ( = ?auto_761152 ?auto_761164 ) ) ( not ( = ?auto_761152 ?auto_761165 ) ) ( not ( = ?auto_761152 ?auto_761166 ) ) ( not ( = ?auto_761153 ?auto_761154 ) ) ( not ( = ?auto_761153 ?auto_761155 ) ) ( not ( = ?auto_761153 ?auto_761156 ) ) ( not ( = ?auto_761153 ?auto_761157 ) ) ( not ( = ?auto_761153 ?auto_761158 ) ) ( not ( = ?auto_761153 ?auto_761159 ) ) ( not ( = ?auto_761153 ?auto_761160 ) ) ( not ( = ?auto_761153 ?auto_761161 ) ) ( not ( = ?auto_761153 ?auto_761162 ) ) ( not ( = ?auto_761153 ?auto_761163 ) ) ( not ( = ?auto_761153 ?auto_761164 ) ) ( not ( = ?auto_761153 ?auto_761165 ) ) ( not ( = ?auto_761153 ?auto_761166 ) ) ( not ( = ?auto_761154 ?auto_761155 ) ) ( not ( = ?auto_761154 ?auto_761156 ) ) ( not ( = ?auto_761154 ?auto_761157 ) ) ( not ( = ?auto_761154 ?auto_761158 ) ) ( not ( = ?auto_761154 ?auto_761159 ) ) ( not ( = ?auto_761154 ?auto_761160 ) ) ( not ( = ?auto_761154 ?auto_761161 ) ) ( not ( = ?auto_761154 ?auto_761162 ) ) ( not ( = ?auto_761154 ?auto_761163 ) ) ( not ( = ?auto_761154 ?auto_761164 ) ) ( not ( = ?auto_761154 ?auto_761165 ) ) ( not ( = ?auto_761154 ?auto_761166 ) ) ( not ( = ?auto_761155 ?auto_761156 ) ) ( not ( = ?auto_761155 ?auto_761157 ) ) ( not ( = ?auto_761155 ?auto_761158 ) ) ( not ( = ?auto_761155 ?auto_761159 ) ) ( not ( = ?auto_761155 ?auto_761160 ) ) ( not ( = ?auto_761155 ?auto_761161 ) ) ( not ( = ?auto_761155 ?auto_761162 ) ) ( not ( = ?auto_761155 ?auto_761163 ) ) ( not ( = ?auto_761155 ?auto_761164 ) ) ( not ( = ?auto_761155 ?auto_761165 ) ) ( not ( = ?auto_761155 ?auto_761166 ) ) ( not ( = ?auto_761156 ?auto_761157 ) ) ( not ( = ?auto_761156 ?auto_761158 ) ) ( not ( = ?auto_761156 ?auto_761159 ) ) ( not ( = ?auto_761156 ?auto_761160 ) ) ( not ( = ?auto_761156 ?auto_761161 ) ) ( not ( = ?auto_761156 ?auto_761162 ) ) ( not ( = ?auto_761156 ?auto_761163 ) ) ( not ( = ?auto_761156 ?auto_761164 ) ) ( not ( = ?auto_761156 ?auto_761165 ) ) ( not ( = ?auto_761156 ?auto_761166 ) ) ( not ( = ?auto_761157 ?auto_761158 ) ) ( not ( = ?auto_761157 ?auto_761159 ) ) ( not ( = ?auto_761157 ?auto_761160 ) ) ( not ( = ?auto_761157 ?auto_761161 ) ) ( not ( = ?auto_761157 ?auto_761162 ) ) ( not ( = ?auto_761157 ?auto_761163 ) ) ( not ( = ?auto_761157 ?auto_761164 ) ) ( not ( = ?auto_761157 ?auto_761165 ) ) ( not ( = ?auto_761157 ?auto_761166 ) ) ( not ( = ?auto_761158 ?auto_761159 ) ) ( not ( = ?auto_761158 ?auto_761160 ) ) ( not ( = ?auto_761158 ?auto_761161 ) ) ( not ( = ?auto_761158 ?auto_761162 ) ) ( not ( = ?auto_761158 ?auto_761163 ) ) ( not ( = ?auto_761158 ?auto_761164 ) ) ( not ( = ?auto_761158 ?auto_761165 ) ) ( not ( = ?auto_761158 ?auto_761166 ) ) ( not ( = ?auto_761159 ?auto_761160 ) ) ( not ( = ?auto_761159 ?auto_761161 ) ) ( not ( = ?auto_761159 ?auto_761162 ) ) ( not ( = ?auto_761159 ?auto_761163 ) ) ( not ( = ?auto_761159 ?auto_761164 ) ) ( not ( = ?auto_761159 ?auto_761165 ) ) ( not ( = ?auto_761159 ?auto_761166 ) ) ( not ( = ?auto_761160 ?auto_761161 ) ) ( not ( = ?auto_761160 ?auto_761162 ) ) ( not ( = ?auto_761160 ?auto_761163 ) ) ( not ( = ?auto_761160 ?auto_761164 ) ) ( not ( = ?auto_761160 ?auto_761165 ) ) ( not ( = ?auto_761160 ?auto_761166 ) ) ( not ( = ?auto_761161 ?auto_761162 ) ) ( not ( = ?auto_761161 ?auto_761163 ) ) ( not ( = ?auto_761161 ?auto_761164 ) ) ( not ( = ?auto_761161 ?auto_761165 ) ) ( not ( = ?auto_761161 ?auto_761166 ) ) ( not ( = ?auto_761162 ?auto_761163 ) ) ( not ( = ?auto_761162 ?auto_761164 ) ) ( not ( = ?auto_761162 ?auto_761165 ) ) ( not ( = ?auto_761162 ?auto_761166 ) ) ( not ( = ?auto_761163 ?auto_761164 ) ) ( not ( = ?auto_761163 ?auto_761165 ) ) ( not ( = ?auto_761163 ?auto_761166 ) ) ( not ( = ?auto_761164 ?auto_761165 ) ) ( not ( = ?auto_761164 ?auto_761166 ) ) ( not ( = ?auto_761165 ?auto_761166 ) ) ( ON ?auto_761164 ?auto_761165 ) ( ON ?auto_761163 ?auto_761164 ) ( ON ?auto_761162 ?auto_761163 ) ( ON ?auto_761161 ?auto_761162 ) ( ON ?auto_761160 ?auto_761161 ) ( ON ?auto_761159 ?auto_761160 ) ( CLEAR ?auto_761157 ) ( ON ?auto_761158 ?auto_761159 ) ( CLEAR ?auto_761158 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_761152 ?auto_761153 ?auto_761154 ?auto_761155 ?auto_761156 ?auto_761157 ?auto_761158 )
      ( MAKE-14PILE ?auto_761152 ?auto_761153 ?auto_761154 ?auto_761155 ?auto_761156 ?auto_761157 ?auto_761158 ?auto_761159 ?auto_761160 ?auto_761161 ?auto_761162 ?auto_761163 ?auto_761164 ?auto_761165 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_761210 - BLOCK
      ?auto_761211 - BLOCK
      ?auto_761212 - BLOCK
      ?auto_761213 - BLOCK
      ?auto_761214 - BLOCK
      ?auto_761215 - BLOCK
      ?auto_761216 - BLOCK
      ?auto_761217 - BLOCK
      ?auto_761218 - BLOCK
      ?auto_761219 - BLOCK
      ?auto_761220 - BLOCK
      ?auto_761221 - BLOCK
      ?auto_761222 - BLOCK
      ?auto_761223 - BLOCK
    )
    :vars
    (
      ?auto_761224 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_761223 ?auto_761224 ) ( ON-TABLE ?auto_761210 ) ( ON ?auto_761211 ?auto_761210 ) ( ON ?auto_761212 ?auto_761211 ) ( ON ?auto_761213 ?auto_761212 ) ( ON ?auto_761214 ?auto_761213 ) ( not ( = ?auto_761210 ?auto_761211 ) ) ( not ( = ?auto_761210 ?auto_761212 ) ) ( not ( = ?auto_761210 ?auto_761213 ) ) ( not ( = ?auto_761210 ?auto_761214 ) ) ( not ( = ?auto_761210 ?auto_761215 ) ) ( not ( = ?auto_761210 ?auto_761216 ) ) ( not ( = ?auto_761210 ?auto_761217 ) ) ( not ( = ?auto_761210 ?auto_761218 ) ) ( not ( = ?auto_761210 ?auto_761219 ) ) ( not ( = ?auto_761210 ?auto_761220 ) ) ( not ( = ?auto_761210 ?auto_761221 ) ) ( not ( = ?auto_761210 ?auto_761222 ) ) ( not ( = ?auto_761210 ?auto_761223 ) ) ( not ( = ?auto_761210 ?auto_761224 ) ) ( not ( = ?auto_761211 ?auto_761212 ) ) ( not ( = ?auto_761211 ?auto_761213 ) ) ( not ( = ?auto_761211 ?auto_761214 ) ) ( not ( = ?auto_761211 ?auto_761215 ) ) ( not ( = ?auto_761211 ?auto_761216 ) ) ( not ( = ?auto_761211 ?auto_761217 ) ) ( not ( = ?auto_761211 ?auto_761218 ) ) ( not ( = ?auto_761211 ?auto_761219 ) ) ( not ( = ?auto_761211 ?auto_761220 ) ) ( not ( = ?auto_761211 ?auto_761221 ) ) ( not ( = ?auto_761211 ?auto_761222 ) ) ( not ( = ?auto_761211 ?auto_761223 ) ) ( not ( = ?auto_761211 ?auto_761224 ) ) ( not ( = ?auto_761212 ?auto_761213 ) ) ( not ( = ?auto_761212 ?auto_761214 ) ) ( not ( = ?auto_761212 ?auto_761215 ) ) ( not ( = ?auto_761212 ?auto_761216 ) ) ( not ( = ?auto_761212 ?auto_761217 ) ) ( not ( = ?auto_761212 ?auto_761218 ) ) ( not ( = ?auto_761212 ?auto_761219 ) ) ( not ( = ?auto_761212 ?auto_761220 ) ) ( not ( = ?auto_761212 ?auto_761221 ) ) ( not ( = ?auto_761212 ?auto_761222 ) ) ( not ( = ?auto_761212 ?auto_761223 ) ) ( not ( = ?auto_761212 ?auto_761224 ) ) ( not ( = ?auto_761213 ?auto_761214 ) ) ( not ( = ?auto_761213 ?auto_761215 ) ) ( not ( = ?auto_761213 ?auto_761216 ) ) ( not ( = ?auto_761213 ?auto_761217 ) ) ( not ( = ?auto_761213 ?auto_761218 ) ) ( not ( = ?auto_761213 ?auto_761219 ) ) ( not ( = ?auto_761213 ?auto_761220 ) ) ( not ( = ?auto_761213 ?auto_761221 ) ) ( not ( = ?auto_761213 ?auto_761222 ) ) ( not ( = ?auto_761213 ?auto_761223 ) ) ( not ( = ?auto_761213 ?auto_761224 ) ) ( not ( = ?auto_761214 ?auto_761215 ) ) ( not ( = ?auto_761214 ?auto_761216 ) ) ( not ( = ?auto_761214 ?auto_761217 ) ) ( not ( = ?auto_761214 ?auto_761218 ) ) ( not ( = ?auto_761214 ?auto_761219 ) ) ( not ( = ?auto_761214 ?auto_761220 ) ) ( not ( = ?auto_761214 ?auto_761221 ) ) ( not ( = ?auto_761214 ?auto_761222 ) ) ( not ( = ?auto_761214 ?auto_761223 ) ) ( not ( = ?auto_761214 ?auto_761224 ) ) ( not ( = ?auto_761215 ?auto_761216 ) ) ( not ( = ?auto_761215 ?auto_761217 ) ) ( not ( = ?auto_761215 ?auto_761218 ) ) ( not ( = ?auto_761215 ?auto_761219 ) ) ( not ( = ?auto_761215 ?auto_761220 ) ) ( not ( = ?auto_761215 ?auto_761221 ) ) ( not ( = ?auto_761215 ?auto_761222 ) ) ( not ( = ?auto_761215 ?auto_761223 ) ) ( not ( = ?auto_761215 ?auto_761224 ) ) ( not ( = ?auto_761216 ?auto_761217 ) ) ( not ( = ?auto_761216 ?auto_761218 ) ) ( not ( = ?auto_761216 ?auto_761219 ) ) ( not ( = ?auto_761216 ?auto_761220 ) ) ( not ( = ?auto_761216 ?auto_761221 ) ) ( not ( = ?auto_761216 ?auto_761222 ) ) ( not ( = ?auto_761216 ?auto_761223 ) ) ( not ( = ?auto_761216 ?auto_761224 ) ) ( not ( = ?auto_761217 ?auto_761218 ) ) ( not ( = ?auto_761217 ?auto_761219 ) ) ( not ( = ?auto_761217 ?auto_761220 ) ) ( not ( = ?auto_761217 ?auto_761221 ) ) ( not ( = ?auto_761217 ?auto_761222 ) ) ( not ( = ?auto_761217 ?auto_761223 ) ) ( not ( = ?auto_761217 ?auto_761224 ) ) ( not ( = ?auto_761218 ?auto_761219 ) ) ( not ( = ?auto_761218 ?auto_761220 ) ) ( not ( = ?auto_761218 ?auto_761221 ) ) ( not ( = ?auto_761218 ?auto_761222 ) ) ( not ( = ?auto_761218 ?auto_761223 ) ) ( not ( = ?auto_761218 ?auto_761224 ) ) ( not ( = ?auto_761219 ?auto_761220 ) ) ( not ( = ?auto_761219 ?auto_761221 ) ) ( not ( = ?auto_761219 ?auto_761222 ) ) ( not ( = ?auto_761219 ?auto_761223 ) ) ( not ( = ?auto_761219 ?auto_761224 ) ) ( not ( = ?auto_761220 ?auto_761221 ) ) ( not ( = ?auto_761220 ?auto_761222 ) ) ( not ( = ?auto_761220 ?auto_761223 ) ) ( not ( = ?auto_761220 ?auto_761224 ) ) ( not ( = ?auto_761221 ?auto_761222 ) ) ( not ( = ?auto_761221 ?auto_761223 ) ) ( not ( = ?auto_761221 ?auto_761224 ) ) ( not ( = ?auto_761222 ?auto_761223 ) ) ( not ( = ?auto_761222 ?auto_761224 ) ) ( not ( = ?auto_761223 ?auto_761224 ) ) ( ON ?auto_761222 ?auto_761223 ) ( ON ?auto_761221 ?auto_761222 ) ( ON ?auto_761220 ?auto_761221 ) ( ON ?auto_761219 ?auto_761220 ) ( ON ?auto_761218 ?auto_761219 ) ( ON ?auto_761217 ?auto_761218 ) ( ON ?auto_761216 ?auto_761217 ) ( CLEAR ?auto_761214 ) ( ON ?auto_761215 ?auto_761216 ) ( CLEAR ?auto_761215 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_761210 ?auto_761211 ?auto_761212 ?auto_761213 ?auto_761214 ?auto_761215 )
      ( MAKE-14PILE ?auto_761210 ?auto_761211 ?auto_761212 ?auto_761213 ?auto_761214 ?auto_761215 ?auto_761216 ?auto_761217 ?auto_761218 ?auto_761219 ?auto_761220 ?auto_761221 ?auto_761222 ?auto_761223 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_761268 - BLOCK
      ?auto_761269 - BLOCK
      ?auto_761270 - BLOCK
      ?auto_761271 - BLOCK
      ?auto_761272 - BLOCK
      ?auto_761273 - BLOCK
      ?auto_761274 - BLOCK
      ?auto_761275 - BLOCK
      ?auto_761276 - BLOCK
      ?auto_761277 - BLOCK
      ?auto_761278 - BLOCK
      ?auto_761279 - BLOCK
      ?auto_761280 - BLOCK
      ?auto_761281 - BLOCK
    )
    :vars
    (
      ?auto_761282 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_761281 ?auto_761282 ) ( ON-TABLE ?auto_761268 ) ( ON ?auto_761269 ?auto_761268 ) ( ON ?auto_761270 ?auto_761269 ) ( ON ?auto_761271 ?auto_761270 ) ( not ( = ?auto_761268 ?auto_761269 ) ) ( not ( = ?auto_761268 ?auto_761270 ) ) ( not ( = ?auto_761268 ?auto_761271 ) ) ( not ( = ?auto_761268 ?auto_761272 ) ) ( not ( = ?auto_761268 ?auto_761273 ) ) ( not ( = ?auto_761268 ?auto_761274 ) ) ( not ( = ?auto_761268 ?auto_761275 ) ) ( not ( = ?auto_761268 ?auto_761276 ) ) ( not ( = ?auto_761268 ?auto_761277 ) ) ( not ( = ?auto_761268 ?auto_761278 ) ) ( not ( = ?auto_761268 ?auto_761279 ) ) ( not ( = ?auto_761268 ?auto_761280 ) ) ( not ( = ?auto_761268 ?auto_761281 ) ) ( not ( = ?auto_761268 ?auto_761282 ) ) ( not ( = ?auto_761269 ?auto_761270 ) ) ( not ( = ?auto_761269 ?auto_761271 ) ) ( not ( = ?auto_761269 ?auto_761272 ) ) ( not ( = ?auto_761269 ?auto_761273 ) ) ( not ( = ?auto_761269 ?auto_761274 ) ) ( not ( = ?auto_761269 ?auto_761275 ) ) ( not ( = ?auto_761269 ?auto_761276 ) ) ( not ( = ?auto_761269 ?auto_761277 ) ) ( not ( = ?auto_761269 ?auto_761278 ) ) ( not ( = ?auto_761269 ?auto_761279 ) ) ( not ( = ?auto_761269 ?auto_761280 ) ) ( not ( = ?auto_761269 ?auto_761281 ) ) ( not ( = ?auto_761269 ?auto_761282 ) ) ( not ( = ?auto_761270 ?auto_761271 ) ) ( not ( = ?auto_761270 ?auto_761272 ) ) ( not ( = ?auto_761270 ?auto_761273 ) ) ( not ( = ?auto_761270 ?auto_761274 ) ) ( not ( = ?auto_761270 ?auto_761275 ) ) ( not ( = ?auto_761270 ?auto_761276 ) ) ( not ( = ?auto_761270 ?auto_761277 ) ) ( not ( = ?auto_761270 ?auto_761278 ) ) ( not ( = ?auto_761270 ?auto_761279 ) ) ( not ( = ?auto_761270 ?auto_761280 ) ) ( not ( = ?auto_761270 ?auto_761281 ) ) ( not ( = ?auto_761270 ?auto_761282 ) ) ( not ( = ?auto_761271 ?auto_761272 ) ) ( not ( = ?auto_761271 ?auto_761273 ) ) ( not ( = ?auto_761271 ?auto_761274 ) ) ( not ( = ?auto_761271 ?auto_761275 ) ) ( not ( = ?auto_761271 ?auto_761276 ) ) ( not ( = ?auto_761271 ?auto_761277 ) ) ( not ( = ?auto_761271 ?auto_761278 ) ) ( not ( = ?auto_761271 ?auto_761279 ) ) ( not ( = ?auto_761271 ?auto_761280 ) ) ( not ( = ?auto_761271 ?auto_761281 ) ) ( not ( = ?auto_761271 ?auto_761282 ) ) ( not ( = ?auto_761272 ?auto_761273 ) ) ( not ( = ?auto_761272 ?auto_761274 ) ) ( not ( = ?auto_761272 ?auto_761275 ) ) ( not ( = ?auto_761272 ?auto_761276 ) ) ( not ( = ?auto_761272 ?auto_761277 ) ) ( not ( = ?auto_761272 ?auto_761278 ) ) ( not ( = ?auto_761272 ?auto_761279 ) ) ( not ( = ?auto_761272 ?auto_761280 ) ) ( not ( = ?auto_761272 ?auto_761281 ) ) ( not ( = ?auto_761272 ?auto_761282 ) ) ( not ( = ?auto_761273 ?auto_761274 ) ) ( not ( = ?auto_761273 ?auto_761275 ) ) ( not ( = ?auto_761273 ?auto_761276 ) ) ( not ( = ?auto_761273 ?auto_761277 ) ) ( not ( = ?auto_761273 ?auto_761278 ) ) ( not ( = ?auto_761273 ?auto_761279 ) ) ( not ( = ?auto_761273 ?auto_761280 ) ) ( not ( = ?auto_761273 ?auto_761281 ) ) ( not ( = ?auto_761273 ?auto_761282 ) ) ( not ( = ?auto_761274 ?auto_761275 ) ) ( not ( = ?auto_761274 ?auto_761276 ) ) ( not ( = ?auto_761274 ?auto_761277 ) ) ( not ( = ?auto_761274 ?auto_761278 ) ) ( not ( = ?auto_761274 ?auto_761279 ) ) ( not ( = ?auto_761274 ?auto_761280 ) ) ( not ( = ?auto_761274 ?auto_761281 ) ) ( not ( = ?auto_761274 ?auto_761282 ) ) ( not ( = ?auto_761275 ?auto_761276 ) ) ( not ( = ?auto_761275 ?auto_761277 ) ) ( not ( = ?auto_761275 ?auto_761278 ) ) ( not ( = ?auto_761275 ?auto_761279 ) ) ( not ( = ?auto_761275 ?auto_761280 ) ) ( not ( = ?auto_761275 ?auto_761281 ) ) ( not ( = ?auto_761275 ?auto_761282 ) ) ( not ( = ?auto_761276 ?auto_761277 ) ) ( not ( = ?auto_761276 ?auto_761278 ) ) ( not ( = ?auto_761276 ?auto_761279 ) ) ( not ( = ?auto_761276 ?auto_761280 ) ) ( not ( = ?auto_761276 ?auto_761281 ) ) ( not ( = ?auto_761276 ?auto_761282 ) ) ( not ( = ?auto_761277 ?auto_761278 ) ) ( not ( = ?auto_761277 ?auto_761279 ) ) ( not ( = ?auto_761277 ?auto_761280 ) ) ( not ( = ?auto_761277 ?auto_761281 ) ) ( not ( = ?auto_761277 ?auto_761282 ) ) ( not ( = ?auto_761278 ?auto_761279 ) ) ( not ( = ?auto_761278 ?auto_761280 ) ) ( not ( = ?auto_761278 ?auto_761281 ) ) ( not ( = ?auto_761278 ?auto_761282 ) ) ( not ( = ?auto_761279 ?auto_761280 ) ) ( not ( = ?auto_761279 ?auto_761281 ) ) ( not ( = ?auto_761279 ?auto_761282 ) ) ( not ( = ?auto_761280 ?auto_761281 ) ) ( not ( = ?auto_761280 ?auto_761282 ) ) ( not ( = ?auto_761281 ?auto_761282 ) ) ( ON ?auto_761280 ?auto_761281 ) ( ON ?auto_761279 ?auto_761280 ) ( ON ?auto_761278 ?auto_761279 ) ( ON ?auto_761277 ?auto_761278 ) ( ON ?auto_761276 ?auto_761277 ) ( ON ?auto_761275 ?auto_761276 ) ( ON ?auto_761274 ?auto_761275 ) ( ON ?auto_761273 ?auto_761274 ) ( CLEAR ?auto_761271 ) ( ON ?auto_761272 ?auto_761273 ) ( CLEAR ?auto_761272 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_761268 ?auto_761269 ?auto_761270 ?auto_761271 ?auto_761272 )
      ( MAKE-14PILE ?auto_761268 ?auto_761269 ?auto_761270 ?auto_761271 ?auto_761272 ?auto_761273 ?auto_761274 ?auto_761275 ?auto_761276 ?auto_761277 ?auto_761278 ?auto_761279 ?auto_761280 ?auto_761281 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_761326 - BLOCK
      ?auto_761327 - BLOCK
      ?auto_761328 - BLOCK
      ?auto_761329 - BLOCK
      ?auto_761330 - BLOCK
      ?auto_761331 - BLOCK
      ?auto_761332 - BLOCK
      ?auto_761333 - BLOCK
      ?auto_761334 - BLOCK
      ?auto_761335 - BLOCK
      ?auto_761336 - BLOCK
      ?auto_761337 - BLOCK
      ?auto_761338 - BLOCK
      ?auto_761339 - BLOCK
    )
    :vars
    (
      ?auto_761340 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_761339 ?auto_761340 ) ( ON-TABLE ?auto_761326 ) ( ON ?auto_761327 ?auto_761326 ) ( ON ?auto_761328 ?auto_761327 ) ( not ( = ?auto_761326 ?auto_761327 ) ) ( not ( = ?auto_761326 ?auto_761328 ) ) ( not ( = ?auto_761326 ?auto_761329 ) ) ( not ( = ?auto_761326 ?auto_761330 ) ) ( not ( = ?auto_761326 ?auto_761331 ) ) ( not ( = ?auto_761326 ?auto_761332 ) ) ( not ( = ?auto_761326 ?auto_761333 ) ) ( not ( = ?auto_761326 ?auto_761334 ) ) ( not ( = ?auto_761326 ?auto_761335 ) ) ( not ( = ?auto_761326 ?auto_761336 ) ) ( not ( = ?auto_761326 ?auto_761337 ) ) ( not ( = ?auto_761326 ?auto_761338 ) ) ( not ( = ?auto_761326 ?auto_761339 ) ) ( not ( = ?auto_761326 ?auto_761340 ) ) ( not ( = ?auto_761327 ?auto_761328 ) ) ( not ( = ?auto_761327 ?auto_761329 ) ) ( not ( = ?auto_761327 ?auto_761330 ) ) ( not ( = ?auto_761327 ?auto_761331 ) ) ( not ( = ?auto_761327 ?auto_761332 ) ) ( not ( = ?auto_761327 ?auto_761333 ) ) ( not ( = ?auto_761327 ?auto_761334 ) ) ( not ( = ?auto_761327 ?auto_761335 ) ) ( not ( = ?auto_761327 ?auto_761336 ) ) ( not ( = ?auto_761327 ?auto_761337 ) ) ( not ( = ?auto_761327 ?auto_761338 ) ) ( not ( = ?auto_761327 ?auto_761339 ) ) ( not ( = ?auto_761327 ?auto_761340 ) ) ( not ( = ?auto_761328 ?auto_761329 ) ) ( not ( = ?auto_761328 ?auto_761330 ) ) ( not ( = ?auto_761328 ?auto_761331 ) ) ( not ( = ?auto_761328 ?auto_761332 ) ) ( not ( = ?auto_761328 ?auto_761333 ) ) ( not ( = ?auto_761328 ?auto_761334 ) ) ( not ( = ?auto_761328 ?auto_761335 ) ) ( not ( = ?auto_761328 ?auto_761336 ) ) ( not ( = ?auto_761328 ?auto_761337 ) ) ( not ( = ?auto_761328 ?auto_761338 ) ) ( not ( = ?auto_761328 ?auto_761339 ) ) ( not ( = ?auto_761328 ?auto_761340 ) ) ( not ( = ?auto_761329 ?auto_761330 ) ) ( not ( = ?auto_761329 ?auto_761331 ) ) ( not ( = ?auto_761329 ?auto_761332 ) ) ( not ( = ?auto_761329 ?auto_761333 ) ) ( not ( = ?auto_761329 ?auto_761334 ) ) ( not ( = ?auto_761329 ?auto_761335 ) ) ( not ( = ?auto_761329 ?auto_761336 ) ) ( not ( = ?auto_761329 ?auto_761337 ) ) ( not ( = ?auto_761329 ?auto_761338 ) ) ( not ( = ?auto_761329 ?auto_761339 ) ) ( not ( = ?auto_761329 ?auto_761340 ) ) ( not ( = ?auto_761330 ?auto_761331 ) ) ( not ( = ?auto_761330 ?auto_761332 ) ) ( not ( = ?auto_761330 ?auto_761333 ) ) ( not ( = ?auto_761330 ?auto_761334 ) ) ( not ( = ?auto_761330 ?auto_761335 ) ) ( not ( = ?auto_761330 ?auto_761336 ) ) ( not ( = ?auto_761330 ?auto_761337 ) ) ( not ( = ?auto_761330 ?auto_761338 ) ) ( not ( = ?auto_761330 ?auto_761339 ) ) ( not ( = ?auto_761330 ?auto_761340 ) ) ( not ( = ?auto_761331 ?auto_761332 ) ) ( not ( = ?auto_761331 ?auto_761333 ) ) ( not ( = ?auto_761331 ?auto_761334 ) ) ( not ( = ?auto_761331 ?auto_761335 ) ) ( not ( = ?auto_761331 ?auto_761336 ) ) ( not ( = ?auto_761331 ?auto_761337 ) ) ( not ( = ?auto_761331 ?auto_761338 ) ) ( not ( = ?auto_761331 ?auto_761339 ) ) ( not ( = ?auto_761331 ?auto_761340 ) ) ( not ( = ?auto_761332 ?auto_761333 ) ) ( not ( = ?auto_761332 ?auto_761334 ) ) ( not ( = ?auto_761332 ?auto_761335 ) ) ( not ( = ?auto_761332 ?auto_761336 ) ) ( not ( = ?auto_761332 ?auto_761337 ) ) ( not ( = ?auto_761332 ?auto_761338 ) ) ( not ( = ?auto_761332 ?auto_761339 ) ) ( not ( = ?auto_761332 ?auto_761340 ) ) ( not ( = ?auto_761333 ?auto_761334 ) ) ( not ( = ?auto_761333 ?auto_761335 ) ) ( not ( = ?auto_761333 ?auto_761336 ) ) ( not ( = ?auto_761333 ?auto_761337 ) ) ( not ( = ?auto_761333 ?auto_761338 ) ) ( not ( = ?auto_761333 ?auto_761339 ) ) ( not ( = ?auto_761333 ?auto_761340 ) ) ( not ( = ?auto_761334 ?auto_761335 ) ) ( not ( = ?auto_761334 ?auto_761336 ) ) ( not ( = ?auto_761334 ?auto_761337 ) ) ( not ( = ?auto_761334 ?auto_761338 ) ) ( not ( = ?auto_761334 ?auto_761339 ) ) ( not ( = ?auto_761334 ?auto_761340 ) ) ( not ( = ?auto_761335 ?auto_761336 ) ) ( not ( = ?auto_761335 ?auto_761337 ) ) ( not ( = ?auto_761335 ?auto_761338 ) ) ( not ( = ?auto_761335 ?auto_761339 ) ) ( not ( = ?auto_761335 ?auto_761340 ) ) ( not ( = ?auto_761336 ?auto_761337 ) ) ( not ( = ?auto_761336 ?auto_761338 ) ) ( not ( = ?auto_761336 ?auto_761339 ) ) ( not ( = ?auto_761336 ?auto_761340 ) ) ( not ( = ?auto_761337 ?auto_761338 ) ) ( not ( = ?auto_761337 ?auto_761339 ) ) ( not ( = ?auto_761337 ?auto_761340 ) ) ( not ( = ?auto_761338 ?auto_761339 ) ) ( not ( = ?auto_761338 ?auto_761340 ) ) ( not ( = ?auto_761339 ?auto_761340 ) ) ( ON ?auto_761338 ?auto_761339 ) ( ON ?auto_761337 ?auto_761338 ) ( ON ?auto_761336 ?auto_761337 ) ( ON ?auto_761335 ?auto_761336 ) ( ON ?auto_761334 ?auto_761335 ) ( ON ?auto_761333 ?auto_761334 ) ( ON ?auto_761332 ?auto_761333 ) ( ON ?auto_761331 ?auto_761332 ) ( ON ?auto_761330 ?auto_761331 ) ( CLEAR ?auto_761328 ) ( ON ?auto_761329 ?auto_761330 ) ( CLEAR ?auto_761329 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_761326 ?auto_761327 ?auto_761328 ?auto_761329 )
      ( MAKE-14PILE ?auto_761326 ?auto_761327 ?auto_761328 ?auto_761329 ?auto_761330 ?auto_761331 ?auto_761332 ?auto_761333 ?auto_761334 ?auto_761335 ?auto_761336 ?auto_761337 ?auto_761338 ?auto_761339 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_761384 - BLOCK
      ?auto_761385 - BLOCK
      ?auto_761386 - BLOCK
      ?auto_761387 - BLOCK
      ?auto_761388 - BLOCK
      ?auto_761389 - BLOCK
      ?auto_761390 - BLOCK
      ?auto_761391 - BLOCK
      ?auto_761392 - BLOCK
      ?auto_761393 - BLOCK
      ?auto_761394 - BLOCK
      ?auto_761395 - BLOCK
      ?auto_761396 - BLOCK
      ?auto_761397 - BLOCK
    )
    :vars
    (
      ?auto_761398 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_761397 ?auto_761398 ) ( ON-TABLE ?auto_761384 ) ( ON ?auto_761385 ?auto_761384 ) ( not ( = ?auto_761384 ?auto_761385 ) ) ( not ( = ?auto_761384 ?auto_761386 ) ) ( not ( = ?auto_761384 ?auto_761387 ) ) ( not ( = ?auto_761384 ?auto_761388 ) ) ( not ( = ?auto_761384 ?auto_761389 ) ) ( not ( = ?auto_761384 ?auto_761390 ) ) ( not ( = ?auto_761384 ?auto_761391 ) ) ( not ( = ?auto_761384 ?auto_761392 ) ) ( not ( = ?auto_761384 ?auto_761393 ) ) ( not ( = ?auto_761384 ?auto_761394 ) ) ( not ( = ?auto_761384 ?auto_761395 ) ) ( not ( = ?auto_761384 ?auto_761396 ) ) ( not ( = ?auto_761384 ?auto_761397 ) ) ( not ( = ?auto_761384 ?auto_761398 ) ) ( not ( = ?auto_761385 ?auto_761386 ) ) ( not ( = ?auto_761385 ?auto_761387 ) ) ( not ( = ?auto_761385 ?auto_761388 ) ) ( not ( = ?auto_761385 ?auto_761389 ) ) ( not ( = ?auto_761385 ?auto_761390 ) ) ( not ( = ?auto_761385 ?auto_761391 ) ) ( not ( = ?auto_761385 ?auto_761392 ) ) ( not ( = ?auto_761385 ?auto_761393 ) ) ( not ( = ?auto_761385 ?auto_761394 ) ) ( not ( = ?auto_761385 ?auto_761395 ) ) ( not ( = ?auto_761385 ?auto_761396 ) ) ( not ( = ?auto_761385 ?auto_761397 ) ) ( not ( = ?auto_761385 ?auto_761398 ) ) ( not ( = ?auto_761386 ?auto_761387 ) ) ( not ( = ?auto_761386 ?auto_761388 ) ) ( not ( = ?auto_761386 ?auto_761389 ) ) ( not ( = ?auto_761386 ?auto_761390 ) ) ( not ( = ?auto_761386 ?auto_761391 ) ) ( not ( = ?auto_761386 ?auto_761392 ) ) ( not ( = ?auto_761386 ?auto_761393 ) ) ( not ( = ?auto_761386 ?auto_761394 ) ) ( not ( = ?auto_761386 ?auto_761395 ) ) ( not ( = ?auto_761386 ?auto_761396 ) ) ( not ( = ?auto_761386 ?auto_761397 ) ) ( not ( = ?auto_761386 ?auto_761398 ) ) ( not ( = ?auto_761387 ?auto_761388 ) ) ( not ( = ?auto_761387 ?auto_761389 ) ) ( not ( = ?auto_761387 ?auto_761390 ) ) ( not ( = ?auto_761387 ?auto_761391 ) ) ( not ( = ?auto_761387 ?auto_761392 ) ) ( not ( = ?auto_761387 ?auto_761393 ) ) ( not ( = ?auto_761387 ?auto_761394 ) ) ( not ( = ?auto_761387 ?auto_761395 ) ) ( not ( = ?auto_761387 ?auto_761396 ) ) ( not ( = ?auto_761387 ?auto_761397 ) ) ( not ( = ?auto_761387 ?auto_761398 ) ) ( not ( = ?auto_761388 ?auto_761389 ) ) ( not ( = ?auto_761388 ?auto_761390 ) ) ( not ( = ?auto_761388 ?auto_761391 ) ) ( not ( = ?auto_761388 ?auto_761392 ) ) ( not ( = ?auto_761388 ?auto_761393 ) ) ( not ( = ?auto_761388 ?auto_761394 ) ) ( not ( = ?auto_761388 ?auto_761395 ) ) ( not ( = ?auto_761388 ?auto_761396 ) ) ( not ( = ?auto_761388 ?auto_761397 ) ) ( not ( = ?auto_761388 ?auto_761398 ) ) ( not ( = ?auto_761389 ?auto_761390 ) ) ( not ( = ?auto_761389 ?auto_761391 ) ) ( not ( = ?auto_761389 ?auto_761392 ) ) ( not ( = ?auto_761389 ?auto_761393 ) ) ( not ( = ?auto_761389 ?auto_761394 ) ) ( not ( = ?auto_761389 ?auto_761395 ) ) ( not ( = ?auto_761389 ?auto_761396 ) ) ( not ( = ?auto_761389 ?auto_761397 ) ) ( not ( = ?auto_761389 ?auto_761398 ) ) ( not ( = ?auto_761390 ?auto_761391 ) ) ( not ( = ?auto_761390 ?auto_761392 ) ) ( not ( = ?auto_761390 ?auto_761393 ) ) ( not ( = ?auto_761390 ?auto_761394 ) ) ( not ( = ?auto_761390 ?auto_761395 ) ) ( not ( = ?auto_761390 ?auto_761396 ) ) ( not ( = ?auto_761390 ?auto_761397 ) ) ( not ( = ?auto_761390 ?auto_761398 ) ) ( not ( = ?auto_761391 ?auto_761392 ) ) ( not ( = ?auto_761391 ?auto_761393 ) ) ( not ( = ?auto_761391 ?auto_761394 ) ) ( not ( = ?auto_761391 ?auto_761395 ) ) ( not ( = ?auto_761391 ?auto_761396 ) ) ( not ( = ?auto_761391 ?auto_761397 ) ) ( not ( = ?auto_761391 ?auto_761398 ) ) ( not ( = ?auto_761392 ?auto_761393 ) ) ( not ( = ?auto_761392 ?auto_761394 ) ) ( not ( = ?auto_761392 ?auto_761395 ) ) ( not ( = ?auto_761392 ?auto_761396 ) ) ( not ( = ?auto_761392 ?auto_761397 ) ) ( not ( = ?auto_761392 ?auto_761398 ) ) ( not ( = ?auto_761393 ?auto_761394 ) ) ( not ( = ?auto_761393 ?auto_761395 ) ) ( not ( = ?auto_761393 ?auto_761396 ) ) ( not ( = ?auto_761393 ?auto_761397 ) ) ( not ( = ?auto_761393 ?auto_761398 ) ) ( not ( = ?auto_761394 ?auto_761395 ) ) ( not ( = ?auto_761394 ?auto_761396 ) ) ( not ( = ?auto_761394 ?auto_761397 ) ) ( not ( = ?auto_761394 ?auto_761398 ) ) ( not ( = ?auto_761395 ?auto_761396 ) ) ( not ( = ?auto_761395 ?auto_761397 ) ) ( not ( = ?auto_761395 ?auto_761398 ) ) ( not ( = ?auto_761396 ?auto_761397 ) ) ( not ( = ?auto_761396 ?auto_761398 ) ) ( not ( = ?auto_761397 ?auto_761398 ) ) ( ON ?auto_761396 ?auto_761397 ) ( ON ?auto_761395 ?auto_761396 ) ( ON ?auto_761394 ?auto_761395 ) ( ON ?auto_761393 ?auto_761394 ) ( ON ?auto_761392 ?auto_761393 ) ( ON ?auto_761391 ?auto_761392 ) ( ON ?auto_761390 ?auto_761391 ) ( ON ?auto_761389 ?auto_761390 ) ( ON ?auto_761388 ?auto_761389 ) ( ON ?auto_761387 ?auto_761388 ) ( CLEAR ?auto_761385 ) ( ON ?auto_761386 ?auto_761387 ) ( CLEAR ?auto_761386 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_761384 ?auto_761385 ?auto_761386 )
      ( MAKE-14PILE ?auto_761384 ?auto_761385 ?auto_761386 ?auto_761387 ?auto_761388 ?auto_761389 ?auto_761390 ?auto_761391 ?auto_761392 ?auto_761393 ?auto_761394 ?auto_761395 ?auto_761396 ?auto_761397 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_761442 - BLOCK
      ?auto_761443 - BLOCK
      ?auto_761444 - BLOCK
      ?auto_761445 - BLOCK
      ?auto_761446 - BLOCK
      ?auto_761447 - BLOCK
      ?auto_761448 - BLOCK
      ?auto_761449 - BLOCK
      ?auto_761450 - BLOCK
      ?auto_761451 - BLOCK
      ?auto_761452 - BLOCK
      ?auto_761453 - BLOCK
      ?auto_761454 - BLOCK
      ?auto_761455 - BLOCK
    )
    :vars
    (
      ?auto_761456 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_761455 ?auto_761456 ) ( ON-TABLE ?auto_761442 ) ( not ( = ?auto_761442 ?auto_761443 ) ) ( not ( = ?auto_761442 ?auto_761444 ) ) ( not ( = ?auto_761442 ?auto_761445 ) ) ( not ( = ?auto_761442 ?auto_761446 ) ) ( not ( = ?auto_761442 ?auto_761447 ) ) ( not ( = ?auto_761442 ?auto_761448 ) ) ( not ( = ?auto_761442 ?auto_761449 ) ) ( not ( = ?auto_761442 ?auto_761450 ) ) ( not ( = ?auto_761442 ?auto_761451 ) ) ( not ( = ?auto_761442 ?auto_761452 ) ) ( not ( = ?auto_761442 ?auto_761453 ) ) ( not ( = ?auto_761442 ?auto_761454 ) ) ( not ( = ?auto_761442 ?auto_761455 ) ) ( not ( = ?auto_761442 ?auto_761456 ) ) ( not ( = ?auto_761443 ?auto_761444 ) ) ( not ( = ?auto_761443 ?auto_761445 ) ) ( not ( = ?auto_761443 ?auto_761446 ) ) ( not ( = ?auto_761443 ?auto_761447 ) ) ( not ( = ?auto_761443 ?auto_761448 ) ) ( not ( = ?auto_761443 ?auto_761449 ) ) ( not ( = ?auto_761443 ?auto_761450 ) ) ( not ( = ?auto_761443 ?auto_761451 ) ) ( not ( = ?auto_761443 ?auto_761452 ) ) ( not ( = ?auto_761443 ?auto_761453 ) ) ( not ( = ?auto_761443 ?auto_761454 ) ) ( not ( = ?auto_761443 ?auto_761455 ) ) ( not ( = ?auto_761443 ?auto_761456 ) ) ( not ( = ?auto_761444 ?auto_761445 ) ) ( not ( = ?auto_761444 ?auto_761446 ) ) ( not ( = ?auto_761444 ?auto_761447 ) ) ( not ( = ?auto_761444 ?auto_761448 ) ) ( not ( = ?auto_761444 ?auto_761449 ) ) ( not ( = ?auto_761444 ?auto_761450 ) ) ( not ( = ?auto_761444 ?auto_761451 ) ) ( not ( = ?auto_761444 ?auto_761452 ) ) ( not ( = ?auto_761444 ?auto_761453 ) ) ( not ( = ?auto_761444 ?auto_761454 ) ) ( not ( = ?auto_761444 ?auto_761455 ) ) ( not ( = ?auto_761444 ?auto_761456 ) ) ( not ( = ?auto_761445 ?auto_761446 ) ) ( not ( = ?auto_761445 ?auto_761447 ) ) ( not ( = ?auto_761445 ?auto_761448 ) ) ( not ( = ?auto_761445 ?auto_761449 ) ) ( not ( = ?auto_761445 ?auto_761450 ) ) ( not ( = ?auto_761445 ?auto_761451 ) ) ( not ( = ?auto_761445 ?auto_761452 ) ) ( not ( = ?auto_761445 ?auto_761453 ) ) ( not ( = ?auto_761445 ?auto_761454 ) ) ( not ( = ?auto_761445 ?auto_761455 ) ) ( not ( = ?auto_761445 ?auto_761456 ) ) ( not ( = ?auto_761446 ?auto_761447 ) ) ( not ( = ?auto_761446 ?auto_761448 ) ) ( not ( = ?auto_761446 ?auto_761449 ) ) ( not ( = ?auto_761446 ?auto_761450 ) ) ( not ( = ?auto_761446 ?auto_761451 ) ) ( not ( = ?auto_761446 ?auto_761452 ) ) ( not ( = ?auto_761446 ?auto_761453 ) ) ( not ( = ?auto_761446 ?auto_761454 ) ) ( not ( = ?auto_761446 ?auto_761455 ) ) ( not ( = ?auto_761446 ?auto_761456 ) ) ( not ( = ?auto_761447 ?auto_761448 ) ) ( not ( = ?auto_761447 ?auto_761449 ) ) ( not ( = ?auto_761447 ?auto_761450 ) ) ( not ( = ?auto_761447 ?auto_761451 ) ) ( not ( = ?auto_761447 ?auto_761452 ) ) ( not ( = ?auto_761447 ?auto_761453 ) ) ( not ( = ?auto_761447 ?auto_761454 ) ) ( not ( = ?auto_761447 ?auto_761455 ) ) ( not ( = ?auto_761447 ?auto_761456 ) ) ( not ( = ?auto_761448 ?auto_761449 ) ) ( not ( = ?auto_761448 ?auto_761450 ) ) ( not ( = ?auto_761448 ?auto_761451 ) ) ( not ( = ?auto_761448 ?auto_761452 ) ) ( not ( = ?auto_761448 ?auto_761453 ) ) ( not ( = ?auto_761448 ?auto_761454 ) ) ( not ( = ?auto_761448 ?auto_761455 ) ) ( not ( = ?auto_761448 ?auto_761456 ) ) ( not ( = ?auto_761449 ?auto_761450 ) ) ( not ( = ?auto_761449 ?auto_761451 ) ) ( not ( = ?auto_761449 ?auto_761452 ) ) ( not ( = ?auto_761449 ?auto_761453 ) ) ( not ( = ?auto_761449 ?auto_761454 ) ) ( not ( = ?auto_761449 ?auto_761455 ) ) ( not ( = ?auto_761449 ?auto_761456 ) ) ( not ( = ?auto_761450 ?auto_761451 ) ) ( not ( = ?auto_761450 ?auto_761452 ) ) ( not ( = ?auto_761450 ?auto_761453 ) ) ( not ( = ?auto_761450 ?auto_761454 ) ) ( not ( = ?auto_761450 ?auto_761455 ) ) ( not ( = ?auto_761450 ?auto_761456 ) ) ( not ( = ?auto_761451 ?auto_761452 ) ) ( not ( = ?auto_761451 ?auto_761453 ) ) ( not ( = ?auto_761451 ?auto_761454 ) ) ( not ( = ?auto_761451 ?auto_761455 ) ) ( not ( = ?auto_761451 ?auto_761456 ) ) ( not ( = ?auto_761452 ?auto_761453 ) ) ( not ( = ?auto_761452 ?auto_761454 ) ) ( not ( = ?auto_761452 ?auto_761455 ) ) ( not ( = ?auto_761452 ?auto_761456 ) ) ( not ( = ?auto_761453 ?auto_761454 ) ) ( not ( = ?auto_761453 ?auto_761455 ) ) ( not ( = ?auto_761453 ?auto_761456 ) ) ( not ( = ?auto_761454 ?auto_761455 ) ) ( not ( = ?auto_761454 ?auto_761456 ) ) ( not ( = ?auto_761455 ?auto_761456 ) ) ( ON ?auto_761454 ?auto_761455 ) ( ON ?auto_761453 ?auto_761454 ) ( ON ?auto_761452 ?auto_761453 ) ( ON ?auto_761451 ?auto_761452 ) ( ON ?auto_761450 ?auto_761451 ) ( ON ?auto_761449 ?auto_761450 ) ( ON ?auto_761448 ?auto_761449 ) ( ON ?auto_761447 ?auto_761448 ) ( ON ?auto_761446 ?auto_761447 ) ( ON ?auto_761445 ?auto_761446 ) ( ON ?auto_761444 ?auto_761445 ) ( CLEAR ?auto_761442 ) ( ON ?auto_761443 ?auto_761444 ) ( CLEAR ?auto_761443 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_761442 ?auto_761443 )
      ( MAKE-14PILE ?auto_761442 ?auto_761443 ?auto_761444 ?auto_761445 ?auto_761446 ?auto_761447 ?auto_761448 ?auto_761449 ?auto_761450 ?auto_761451 ?auto_761452 ?auto_761453 ?auto_761454 ?auto_761455 ) )
  )

  ( :method MAKE-14PILE
    :parameters
    (
      ?auto_761500 - BLOCK
      ?auto_761501 - BLOCK
      ?auto_761502 - BLOCK
      ?auto_761503 - BLOCK
      ?auto_761504 - BLOCK
      ?auto_761505 - BLOCK
      ?auto_761506 - BLOCK
      ?auto_761507 - BLOCK
      ?auto_761508 - BLOCK
      ?auto_761509 - BLOCK
      ?auto_761510 - BLOCK
      ?auto_761511 - BLOCK
      ?auto_761512 - BLOCK
      ?auto_761513 - BLOCK
    )
    :vars
    (
      ?auto_761514 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_761513 ?auto_761514 ) ( not ( = ?auto_761500 ?auto_761501 ) ) ( not ( = ?auto_761500 ?auto_761502 ) ) ( not ( = ?auto_761500 ?auto_761503 ) ) ( not ( = ?auto_761500 ?auto_761504 ) ) ( not ( = ?auto_761500 ?auto_761505 ) ) ( not ( = ?auto_761500 ?auto_761506 ) ) ( not ( = ?auto_761500 ?auto_761507 ) ) ( not ( = ?auto_761500 ?auto_761508 ) ) ( not ( = ?auto_761500 ?auto_761509 ) ) ( not ( = ?auto_761500 ?auto_761510 ) ) ( not ( = ?auto_761500 ?auto_761511 ) ) ( not ( = ?auto_761500 ?auto_761512 ) ) ( not ( = ?auto_761500 ?auto_761513 ) ) ( not ( = ?auto_761500 ?auto_761514 ) ) ( not ( = ?auto_761501 ?auto_761502 ) ) ( not ( = ?auto_761501 ?auto_761503 ) ) ( not ( = ?auto_761501 ?auto_761504 ) ) ( not ( = ?auto_761501 ?auto_761505 ) ) ( not ( = ?auto_761501 ?auto_761506 ) ) ( not ( = ?auto_761501 ?auto_761507 ) ) ( not ( = ?auto_761501 ?auto_761508 ) ) ( not ( = ?auto_761501 ?auto_761509 ) ) ( not ( = ?auto_761501 ?auto_761510 ) ) ( not ( = ?auto_761501 ?auto_761511 ) ) ( not ( = ?auto_761501 ?auto_761512 ) ) ( not ( = ?auto_761501 ?auto_761513 ) ) ( not ( = ?auto_761501 ?auto_761514 ) ) ( not ( = ?auto_761502 ?auto_761503 ) ) ( not ( = ?auto_761502 ?auto_761504 ) ) ( not ( = ?auto_761502 ?auto_761505 ) ) ( not ( = ?auto_761502 ?auto_761506 ) ) ( not ( = ?auto_761502 ?auto_761507 ) ) ( not ( = ?auto_761502 ?auto_761508 ) ) ( not ( = ?auto_761502 ?auto_761509 ) ) ( not ( = ?auto_761502 ?auto_761510 ) ) ( not ( = ?auto_761502 ?auto_761511 ) ) ( not ( = ?auto_761502 ?auto_761512 ) ) ( not ( = ?auto_761502 ?auto_761513 ) ) ( not ( = ?auto_761502 ?auto_761514 ) ) ( not ( = ?auto_761503 ?auto_761504 ) ) ( not ( = ?auto_761503 ?auto_761505 ) ) ( not ( = ?auto_761503 ?auto_761506 ) ) ( not ( = ?auto_761503 ?auto_761507 ) ) ( not ( = ?auto_761503 ?auto_761508 ) ) ( not ( = ?auto_761503 ?auto_761509 ) ) ( not ( = ?auto_761503 ?auto_761510 ) ) ( not ( = ?auto_761503 ?auto_761511 ) ) ( not ( = ?auto_761503 ?auto_761512 ) ) ( not ( = ?auto_761503 ?auto_761513 ) ) ( not ( = ?auto_761503 ?auto_761514 ) ) ( not ( = ?auto_761504 ?auto_761505 ) ) ( not ( = ?auto_761504 ?auto_761506 ) ) ( not ( = ?auto_761504 ?auto_761507 ) ) ( not ( = ?auto_761504 ?auto_761508 ) ) ( not ( = ?auto_761504 ?auto_761509 ) ) ( not ( = ?auto_761504 ?auto_761510 ) ) ( not ( = ?auto_761504 ?auto_761511 ) ) ( not ( = ?auto_761504 ?auto_761512 ) ) ( not ( = ?auto_761504 ?auto_761513 ) ) ( not ( = ?auto_761504 ?auto_761514 ) ) ( not ( = ?auto_761505 ?auto_761506 ) ) ( not ( = ?auto_761505 ?auto_761507 ) ) ( not ( = ?auto_761505 ?auto_761508 ) ) ( not ( = ?auto_761505 ?auto_761509 ) ) ( not ( = ?auto_761505 ?auto_761510 ) ) ( not ( = ?auto_761505 ?auto_761511 ) ) ( not ( = ?auto_761505 ?auto_761512 ) ) ( not ( = ?auto_761505 ?auto_761513 ) ) ( not ( = ?auto_761505 ?auto_761514 ) ) ( not ( = ?auto_761506 ?auto_761507 ) ) ( not ( = ?auto_761506 ?auto_761508 ) ) ( not ( = ?auto_761506 ?auto_761509 ) ) ( not ( = ?auto_761506 ?auto_761510 ) ) ( not ( = ?auto_761506 ?auto_761511 ) ) ( not ( = ?auto_761506 ?auto_761512 ) ) ( not ( = ?auto_761506 ?auto_761513 ) ) ( not ( = ?auto_761506 ?auto_761514 ) ) ( not ( = ?auto_761507 ?auto_761508 ) ) ( not ( = ?auto_761507 ?auto_761509 ) ) ( not ( = ?auto_761507 ?auto_761510 ) ) ( not ( = ?auto_761507 ?auto_761511 ) ) ( not ( = ?auto_761507 ?auto_761512 ) ) ( not ( = ?auto_761507 ?auto_761513 ) ) ( not ( = ?auto_761507 ?auto_761514 ) ) ( not ( = ?auto_761508 ?auto_761509 ) ) ( not ( = ?auto_761508 ?auto_761510 ) ) ( not ( = ?auto_761508 ?auto_761511 ) ) ( not ( = ?auto_761508 ?auto_761512 ) ) ( not ( = ?auto_761508 ?auto_761513 ) ) ( not ( = ?auto_761508 ?auto_761514 ) ) ( not ( = ?auto_761509 ?auto_761510 ) ) ( not ( = ?auto_761509 ?auto_761511 ) ) ( not ( = ?auto_761509 ?auto_761512 ) ) ( not ( = ?auto_761509 ?auto_761513 ) ) ( not ( = ?auto_761509 ?auto_761514 ) ) ( not ( = ?auto_761510 ?auto_761511 ) ) ( not ( = ?auto_761510 ?auto_761512 ) ) ( not ( = ?auto_761510 ?auto_761513 ) ) ( not ( = ?auto_761510 ?auto_761514 ) ) ( not ( = ?auto_761511 ?auto_761512 ) ) ( not ( = ?auto_761511 ?auto_761513 ) ) ( not ( = ?auto_761511 ?auto_761514 ) ) ( not ( = ?auto_761512 ?auto_761513 ) ) ( not ( = ?auto_761512 ?auto_761514 ) ) ( not ( = ?auto_761513 ?auto_761514 ) ) ( ON ?auto_761512 ?auto_761513 ) ( ON ?auto_761511 ?auto_761512 ) ( ON ?auto_761510 ?auto_761511 ) ( ON ?auto_761509 ?auto_761510 ) ( ON ?auto_761508 ?auto_761509 ) ( ON ?auto_761507 ?auto_761508 ) ( ON ?auto_761506 ?auto_761507 ) ( ON ?auto_761505 ?auto_761506 ) ( ON ?auto_761504 ?auto_761505 ) ( ON ?auto_761503 ?auto_761504 ) ( ON ?auto_761502 ?auto_761503 ) ( ON ?auto_761501 ?auto_761502 ) ( ON ?auto_761500 ?auto_761501 ) ( CLEAR ?auto_761500 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_761500 )
      ( MAKE-14PILE ?auto_761500 ?auto_761501 ?auto_761502 ?auto_761503 ?auto_761504 ?auto_761505 ?auto_761506 ?auto_761507 ?auto_761508 ?auto_761509 ?auto_761510 ?auto_761511 ?auto_761512 ?auto_761513 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_761559 - BLOCK
      ?auto_761560 - BLOCK
      ?auto_761561 - BLOCK
      ?auto_761562 - BLOCK
      ?auto_761563 - BLOCK
      ?auto_761564 - BLOCK
      ?auto_761565 - BLOCK
      ?auto_761566 - BLOCK
      ?auto_761567 - BLOCK
      ?auto_761568 - BLOCK
      ?auto_761569 - BLOCK
      ?auto_761570 - BLOCK
      ?auto_761571 - BLOCK
      ?auto_761572 - BLOCK
      ?auto_761573 - BLOCK
    )
    :vars
    (
      ?auto_761574 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_761572 ) ( ON ?auto_761573 ?auto_761574 ) ( CLEAR ?auto_761573 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_761559 ) ( ON ?auto_761560 ?auto_761559 ) ( ON ?auto_761561 ?auto_761560 ) ( ON ?auto_761562 ?auto_761561 ) ( ON ?auto_761563 ?auto_761562 ) ( ON ?auto_761564 ?auto_761563 ) ( ON ?auto_761565 ?auto_761564 ) ( ON ?auto_761566 ?auto_761565 ) ( ON ?auto_761567 ?auto_761566 ) ( ON ?auto_761568 ?auto_761567 ) ( ON ?auto_761569 ?auto_761568 ) ( ON ?auto_761570 ?auto_761569 ) ( ON ?auto_761571 ?auto_761570 ) ( ON ?auto_761572 ?auto_761571 ) ( not ( = ?auto_761559 ?auto_761560 ) ) ( not ( = ?auto_761559 ?auto_761561 ) ) ( not ( = ?auto_761559 ?auto_761562 ) ) ( not ( = ?auto_761559 ?auto_761563 ) ) ( not ( = ?auto_761559 ?auto_761564 ) ) ( not ( = ?auto_761559 ?auto_761565 ) ) ( not ( = ?auto_761559 ?auto_761566 ) ) ( not ( = ?auto_761559 ?auto_761567 ) ) ( not ( = ?auto_761559 ?auto_761568 ) ) ( not ( = ?auto_761559 ?auto_761569 ) ) ( not ( = ?auto_761559 ?auto_761570 ) ) ( not ( = ?auto_761559 ?auto_761571 ) ) ( not ( = ?auto_761559 ?auto_761572 ) ) ( not ( = ?auto_761559 ?auto_761573 ) ) ( not ( = ?auto_761559 ?auto_761574 ) ) ( not ( = ?auto_761560 ?auto_761561 ) ) ( not ( = ?auto_761560 ?auto_761562 ) ) ( not ( = ?auto_761560 ?auto_761563 ) ) ( not ( = ?auto_761560 ?auto_761564 ) ) ( not ( = ?auto_761560 ?auto_761565 ) ) ( not ( = ?auto_761560 ?auto_761566 ) ) ( not ( = ?auto_761560 ?auto_761567 ) ) ( not ( = ?auto_761560 ?auto_761568 ) ) ( not ( = ?auto_761560 ?auto_761569 ) ) ( not ( = ?auto_761560 ?auto_761570 ) ) ( not ( = ?auto_761560 ?auto_761571 ) ) ( not ( = ?auto_761560 ?auto_761572 ) ) ( not ( = ?auto_761560 ?auto_761573 ) ) ( not ( = ?auto_761560 ?auto_761574 ) ) ( not ( = ?auto_761561 ?auto_761562 ) ) ( not ( = ?auto_761561 ?auto_761563 ) ) ( not ( = ?auto_761561 ?auto_761564 ) ) ( not ( = ?auto_761561 ?auto_761565 ) ) ( not ( = ?auto_761561 ?auto_761566 ) ) ( not ( = ?auto_761561 ?auto_761567 ) ) ( not ( = ?auto_761561 ?auto_761568 ) ) ( not ( = ?auto_761561 ?auto_761569 ) ) ( not ( = ?auto_761561 ?auto_761570 ) ) ( not ( = ?auto_761561 ?auto_761571 ) ) ( not ( = ?auto_761561 ?auto_761572 ) ) ( not ( = ?auto_761561 ?auto_761573 ) ) ( not ( = ?auto_761561 ?auto_761574 ) ) ( not ( = ?auto_761562 ?auto_761563 ) ) ( not ( = ?auto_761562 ?auto_761564 ) ) ( not ( = ?auto_761562 ?auto_761565 ) ) ( not ( = ?auto_761562 ?auto_761566 ) ) ( not ( = ?auto_761562 ?auto_761567 ) ) ( not ( = ?auto_761562 ?auto_761568 ) ) ( not ( = ?auto_761562 ?auto_761569 ) ) ( not ( = ?auto_761562 ?auto_761570 ) ) ( not ( = ?auto_761562 ?auto_761571 ) ) ( not ( = ?auto_761562 ?auto_761572 ) ) ( not ( = ?auto_761562 ?auto_761573 ) ) ( not ( = ?auto_761562 ?auto_761574 ) ) ( not ( = ?auto_761563 ?auto_761564 ) ) ( not ( = ?auto_761563 ?auto_761565 ) ) ( not ( = ?auto_761563 ?auto_761566 ) ) ( not ( = ?auto_761563 ?auto_761567 ) ) ( not ( = ?auto_761563 ?auto_761568 ) ) ( not ( = ?auto_761563 ?auto_761569 ) ) ( not ( = ?auto_761563 ?auto_761570 ) ) ( not ( = ?auto_761563 ?auto_761571 ) ) ( not ( = ?auto_761563 ?auto_761572 ) ) ( not ( = ?auto_761563 ?auto_761573 ) ) ( not ( = ?auto_761563 ?auto_761574 ) ) ( not ( = ?auto_761564 ?auto_761565 ) ) ( not ( = ?auto_761564 ?auto_761566 ) ) ( not ( = ?auto_761564 ?auto_761567 ) ) ( not ( = ?auto_761564 ?auto_761568 ) ) ( not ( = ?auto_761564 ?auto_761569 ) ) ( not ( = ?auto_761564 ?auto_761570 ) ) ( not ( = ?auto_761564 ?auto_761571 ) ) ( not ( = ?auto_761564 ?auto_761572 ) ) ( not ( = ?auto_761564 ?auto_761573 ) ) ( not ( = ?auto_761564 ?auto_761574 ) ) ( not ( = ?auto_761565 ?auto_761566 ) ) ( not ( = ?auto_761565 ?auto_761567 ) ) ( not ( = ?auto_761565 ?auto_761568 ) ) ( not ( = ?auto_761565 ?auto_761569 ) ) ( not ( = ?auto_761565 ?auto_761570 ) ) ( not ( = ?auto_761565 ?auto_761571 ) ) ( not ( = ?auto_761565 ?auto_761572 ) ) ( not ( = ?auto_761565 ?auto_761573 ) ) ( not ( = ?auto_761565 ?auto_761574 ) ) ( not ( = ?auto_761566 ?auto_761567 ) ) ( not ( = ?auto_761566 ?auto_761568 ) ) ( not ( = ?auto_761566 ?auto_761569 ) ) ( not ( = ?auto_761566 ?auto_761570 ) ) ( not ( = ?auto_761566 ?auto_761571 ) ) ( not ( = ?auto_761566 ?auto_761572 ) ) ( not ( = ?auto_761566 ?auto_761573 ) ) ( not ( = ?auto_761566 ?auto_761574 ) ) ( not ( = ?auto_761567 ?auto_761568 ) ) ( not ( = ?auto_761567 ?auto_761569 ) ) ( not ( = ?auto_761567 ?auto_761570 ) ) ( not ( = ?auto_761567 ?auto_761571 ) ) ( not ( = ?auto_761567 ?auto_761572 ) ) ( not ( = ?auto_761567 ?auto_761573 ) ) ( not ( = ?auto_761567 ?auto_761574 ) ) ( not ( = ?auto_761568 ?auto_761569 ) ) ( not ( = ?auto_761568 ?auto_761570 ) ) ( not ( = ?auto_761568 ?auto_761571 ) ) ( not ( = ?auto_761568 ?auto_761572 ) ) ( not ( = ?auto_761568 ?auto_761573 ) ) ( not ( = ?auto_761568 ?auto_761574 ) ) ( not ( = ?auto_761569 ?auto_761570 ) ) ( not ( = ?auto_761569 ?auto_761571 ) ) ( not ( = ?auto_761569 ?auto_761572 ) ) ( not ( = ?auto_761569 ?auto_761573 ) ) ( not ( = ?auto_761569 ?auto_761574 ) ) ( not ( = ?auto_761570 ?auto_761571 ) ) ( not ( = ?auto_761570 ?auto_761572 ) ) ( not ( = ?auto_761570 ?auto_761573 ) ) ( not ( = ?auto_761570 ?auto_761574 ) ) ( not ( = ?auto_761571 ?auto_761572 ) ) ( not ( = ?auto_761571 ?auto_761573 ) ) ( not ( = ?auto_761571 ?auto_761574 ) ) ( not ( = ?auto_761572 ?auto_761573 ) ) ( not ( = ?auto_761572 ?auto_761574 ) ) ( not ( = ?auto_761573 ?auto_761574 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_761573 ?auto_761574 )
      ( !STACK ?auto_761573 ?auto_761572 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_761621 - BLOCK
      ?auto_761622 - BLOCK
      ?auto_761623 - BLOCK
      ?auto_761624 - BLOCK
      ?auto_761625 - BLOCK
      ?auto_761626 - BLOCK
      ?auto_761627 - BLOCK
      ?auto_761628 - BLOCK
      ?auto_761629 - BLOCK
      ?auto_761630 - BLOCK
      ?auto_761631 - BLOCK
      ?auto_761632 - BLOCK
      ?auto_761633 - BLOCK
      ?auto_761634 - BLOCK
      ?auto_761635 - BLOCK
    )
    :vars
    (
      ?auto_761636 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_761635 ?auto_761636 ) ( ON-TABLE ?auto_761621 ) ( ON ?auto_761622 ?auto_761621 ) ( ON ?auto_761623 ?auto_761622 ) ( ON ?auto_761624 ?auto_761623 ) ( ON ?auto_761625 ?auto_761624 ) ( ON ?auto_761626 ?auto_761625 ) ( ON ?auto_761627 ?auto_761626 ) ( ON ?auto_761628 ?auto_761627 ) ( ON ?auto_761629 ?auto_761628 ) ( ON ?auto_761630 ?auto_761629 ) ( ON ?auto_761631 ?auto_761630 ) ( ON ?auto_761632 ?auto_761631 ) ( ON ?auto_761633 ?auto_761632 ) ( not ( = ?auto_761621 ?auto_761622 ) ) ( not ( = ?auto_761621 ?auto_761623 ) ) ( not ( = ?auto_761621 ?auto_761624 ) ) ( not ( = ?auto_761621 ?auto_761625 ) ) ( not ( = ?auto_761621 ?auto_761626 ) ) ( not ( = ?auto_761621 ?auto_761627 ) ) ( not ( = ?auto_761621 ?auto_761628 ) ) ( not ( = ?auto_761621 ?auto_761629 ) ) ( not ( = ?auto_761621 ?auto_761630 ) ) ( not ( = ?auto_761621 ?auto_761631 ) ) ( not ( = ?auto_761621 ?auto_761632 ) ) ( not ( = ?auto_761621 ?auto_761633 ) ) ( not ( = ?auto_761621 ?auto_761634 ) ) ( not ( = ?auto_761621 ?auto_761635 ) ) ( not ( = ?auto_761621 ?auto_761636 ) ) ( not ( = ?auto_761622 ?auto_761623 ) ) ( not ( = ?auto_761622 ?auto_761624 ) ) ( not ( = ?auto_761622 ?auto_761625 ) ) ( not ( = ?auto_761622 ?auto_761626 ) ) ( not ( = ?auto_761622 ?auto_761627 ) ) ( not ( = ?auto_761622 ?auto_761628 ) ) ( not ( = ?auto_761622 ?auto_761629 ) ) ( not ( = ?auto_761622 ?auto_761630 ) ) ( not ( = ?auto_761622 ?auto_761631 ) ) ( not ( = ?auto_761622 ?auto_761632 ) ) ( not ( = ?auto_761622 ?auto_761633 ) ) ( not ( = ?auto_761622 ?auto_761634 ) ) ( not ( = ?auto_761622 ?auto_761635 ) ) ( not ( = ?auto_761622 ?auto_761636 ) ) ( not ( = ?auto_761623 ?auto_761624 ) ) ( not ( = ?auto_761623 ?auto_761625 ) ) ( not ( = ?auto_761623 ?auto_761626 ) ) ( not ( = ?auto_761623 ?auto_761627 ) ) ( not ( = ?auto_761623 ?auto_761628 ) ) ( not ( = ?auto_761623 ?auto_761629 ) ) ( not ( = ?auto_761623 ?auto_761630 ) ) ( not ( = ?auto_761623 ?auto_761631 ) ) ( not ( = ?auto_761623 ?auto_761632 ) ) ( not ( = ?auto_761623 ?auto_761633 ) ) ( not ( = ?auto_761623 ?auto_761634 ) ) ( not ( = ?auto_761623 ?auto_761635 ) ) ( not ( = ?auto_761623 ?auto_761636 ) ) ( not ( = ?auto_761624 ?auto_761625 ) ) ( not ( = ?auto_761624 ?auto_761626 ) ) ( not ( = ?auto_761624 ?auto_761627 ) ) ( not ( = ?auto_761624 ?auto_761628 ) ) ( not ( = ?auto_761624 ?auto_761629 ) ) ( not ( = ?auto_761624 ?auto_761630 ) ) ( not ( = ?auto_761624 ?auto_761631 ) ) ( not ( = ?auto_761624 ?auto_761632 ) ) ( not ( = ?auto_761624 ?auto_761633 ) ) ( not ( = ?auto_761624 ?auto_761634 ) ) ( not ( = ?auto_761624 ?auto_761635 ) ) ( not ( = ?auto_761624 ?auto_761636 ) ) ( not ( = ?auto_761625 ?auto_761626 ) ) ( not ( = ?auto_761625 ?auto_761627 ) ) ( not ( = ?auto_761625 ?auto_761628 ) ) ( not ( = ?auto_761625 ?auto_761629 ) ) ( not ( = ?auto_761625 ?auto_761630 ) ) ( not ( = ?auto_761625 ?auto_761631 ) ) ( not ( = ?auto_761625 ?auto_761632 ) ) ( not ( = ?auto_761625 ?auto_761633 ) ) ( not ( = ?auto_761625 ?auto_761634 ) ) ( not ( = ?auto_761625 ?auto_761635 ) ) ( not ( = ?auto_761625 ?auto_761636 ) ) ( not ( = ?auto_761626 ?auto_761627 ) ) ( not ( = ?auto_761626 ?auto_761628 ) ) ( not ( = ?auto_761626 ?auto_761629 ) ) ( not ( = ?auto_761626 ?auto_761630 ) ) ( not ( = ?auto_761626 ?auto_761631 ) ) ( not ( = ?auto_761626 ?auto_761632 ) ) ( not ( = ?auto_761626 ?auto_761633 ) ) ( not ( = ?auto_761626 ?auto_761634 ) ) ( not ( = ?auto_761626 ?auto_761635 ) ) ( not ( = ?auto_761626 ?auto_761636 ) ) ( not ( = ?auto_761627 ?auto_761628 ) ) ( not ( = ?auto_761627 ?auto_761629 ) ) ( not ( = ?auto_761627 ?auto_761630 ) ) ( not ( = ?auto_761627 ?auto_761631 ) ) ( not ( = ?auto_761627 ?auto_761632 ) ) ( not ( = ?auto_761627 ?auto_761633 ) ) ( not ( = ?auto_761627 ?auto_761634 ) ) ( not ( = ?auto_761627 ?auto_761635 ) ) ( not ( = ?auto_761627 ?auto_761636 ) ) ( not ( = ?auto_761628 ?auto_761629 ) ) ( not ( = ?auto_761628 ?auto_761630 ) ) ( not ( = ?auto_761628 ?auto_761631 ) ) ( not ( = ?auto_761628 ?auto_761632 ) ) ( not ( = ?auto_761628 ?auto_761633 ) ) ( not ( = ?auto_761628 ?auto_761634 ) ) ( not ( = ?auto_761628 ?auto_761635 ) ) ( not ( = ?auto_761628 ?auto_761636 ) ) ( not ( = ?auto_761629 ?auto_761630 ) ) ( not ( = ?auto_761629 ?auto_761631 ) ) ( not ( = ?auto_761629 ?auto_761632 ) ) ( not ( = ?auto_761629 ?auto_761633 ) ) ( not ( = ?auto_761629 ?auto_761634 ) ) ( not ( = ?auto_761629 ?auto_761635 ) ) ( not ( = ?auto_761629 ?auto_761636 ) ) ( not ( = ?auto_761630 ?auto_761631 ) ) ( not ( = ?auto_761630 ?auto_761632 ) ) ( not ( = ?auto_761630 ?auto_761633 ) ) ( not ( = ?auto_761630 ?auto_761634 ) ) ( not ( = ?auto_761630 ?auto_761635 ) ) ( not ( = ?auto_761630 ?auto_761636 ) ) ( not ( = ?auto_761631 ?auto_761632 ) ) ( not ( = ?auto_761631 ?auto_761633 ) ) ( not ( = ?auto_761631 ?auto_761634 ) ) ( not ( = ?auto_761631 ?auto_761635 ) ) ( not ( = ?auto_761631 ?auto_761636 ) ) ( not ( = ?auto_761632 ?auto_761633 ) ) ( not ( = ?auto_761632 ?auto_761634 ) ) ( not ( = ?auto_761632 ?auto_761635 ) ) ( not ( = ?auto_761632 ?auto_761636 ) ) ( not ( = ?auto_761633 ?auto_761634 ) ) ( not ( = ?auto_761633 ?auto_761635 ) ) ( not ( = ?auto_761633 ?auto_761636 ) ) ( not ( = ?auto_761634 ?auto_761635 ) ) ( not ( = ?auto_761634 ?auto_761636 ) ) ( not ( = ?auto_761635 ?auto_761636 ) ) ( CLEAR ?auto_761633 ) ( ON ?auto_761634 ?auto_761635 ) ( CLEAR ?auto_761634 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_761621 ?auto_761622 ?auto_761623 ?auto_761624 ?auto_761625 ?auto_761626 ?auto_761627 ?auto_761628 ?auto_761629 ?auto_761630 ?auto_761631 ?auto_761632 ?auto_761633 ?auto_761634 )
      ( MAKE-15PILE ?auto_761621 ?auto_761622 ?auto_761623 ?auto_761624 ?auto_761625 ?auto_761626 ?auto_761627 ?auto_761628 ?auto_761629 ?auto_761630 ?auto_761631 ?auto_761632 ?auto_761633 ?auto_761634 ?auto_761635 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_761683 - BLOCK
      ?auto_761684 - BLOCK
      ?auto_761685 - BLOCK
      ?auto_761686 - BLOCK
      ?auto_761687 - BLOCK
      ?auto_761688 - BLOCK
      ?auto_761689 - BLOCK
      ?auto_761690 - BLOCK
      ?auto_761691 - BLOCK
      ?auto_761692 - BLOCK
      ?auto_761693 - BLOCK
      ?auto_761694 - BLOCK
      ?auto_761695 - BLOCK
      ?auto_761696 - BLOCK
      ?auto_761697 - BLOCK
    )
    :vars
    (
      ?auto_761698 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_761697 ?auto_761698 ) ( ON-TABLE ?auto_761683 ) ( ON ?auto_761684 ?auto_761683 ) ( ON ?auto_761685 ?auto_761684 ) ( ON ?auto_761686 ?auto_761685 ) ( ON ?auto_761687 ?auto_761686 ) ( ON ?auto_761688 ?auto_761687 ) ( ON ?auto_761689 ?auto_761688 ) ( ON ?auto_761690 ?auto_761689 ) ( ON ?auto_761691 ?auto_761690 ) ( ON ?auto_761692 ?auto_761691 ) ( ON ?auto_761693 ?auto_761692 ) ( ON ?auto_761694 ?auto_761693 ) ( not ( = ?auto_761683 ?auto_761684 ) ) ( not ( = ?auto_761683 ?auto_761685 ) ) ( not ( = ?auto_761683 ?auto_761686 ) ) ( not ( = ?auto_761683 ?auto_761687 ) ) ( not ( = ?auto_761683 ?auto_761688 ) ) ( not ( = ?auto_761683 ?auto_761689 ) ) ( not ( = ?auto_761683 ?auto_761690 ) ) ( not ( = ?auto_761683 ?auto_761691 ) ) ( not ( = ?auto_761683 ?auto_761692 ) ) ( not ( = ?auto_761683 ?auto_761693 ) ) ( not ( = ?auto_761683 ?auto_761694 ) ) ( not ( = ?auto_761683 ?auto_761695 ) ) ( not ( = ?auto_761683 ?auto_761696 ) ) ( not ( = ?auto_761683 ?auto_761697 ) ) ( not ( = ?auto_761683 ?auto_761698 ) ) ( not ( = ?auto_761684 ?auto_761685 ) ) ( not ( = ?auto_761684 ?auto_761686 ) ) ( not ( = ?auto_761684 ?auto_761687 ) ) ( not ( = ?auto_761684 ?auto_761688 ) ) ( not ( = ?auto_761684 ?auto_761689 ) ) ( not ( = ?auto_761684 ?auto_761690 ) ) ( not ( = ?auto_761684 ?auto_761691 ) ) ( not ( = ?auto_761684 ?auto_761692 ) ) ( not ( = ?auto_761684 ?auto_761693 ) ) ( not ( = ?auto_761684 ?auto_761694 ) ) ( not ( = ?auto_761684 ?auto_761695 ) ) ( not ( = ?auto_761684 ?auto_761696 ) ) ( not ( = ?auto_761684 ?auto_761697 ) ) ( not ( = ?auto_761684 ?auto_761698 ) ) ( not ( = ?auto_761685 ?auto_761686 ) ) ( not ( = ?auto_761685 ?auto_761687 ) ) ( not ( = ?auto_761685 ?auto_761688 ) ) ( not ( = ?auto_761685 ?auto_761689 ) ) ( not ( = ?auto_761685 ?auto_761690 ) ) ( not ( = ?auto_761685 ?auto_761691 ) ) ( not ( = ?auto_761685 ?auto_761692 ) ) ( not ( = ?auto_761685 ?auto_761693 ) ) ( not ( = ?auto_761685 ?auto_761694 ) ) ( not ( = ?auto_761685 ?auto_761695 ) ) ( not ( = ?auto_761685 ?auto_761696 ) ) ( not ( = ?auto_761685 ?auto_761697 ) ) ( not ( = ?auto_761685 ?auto_761698 ) ) ( not ( = ?auto_761686 ?auto_761687 ) ) ( not ( = ?auto_761686 ?auto_761688 ) ) ( not ( = ?auto_761686 ?auto_761689 ) ) ( not ( = ?auto_761686 ?auto_761690 ) ) ( not ( = ?auto_761686 ?auto_761691 ) ) ( not ( = ?auto_761686 ?auto_761692 ) ) ( not ( = ?auto_761686 ?auto_761693 ) ) ( not ( = ?auto_761686 ?auto_761694 ) ) ( not ( = ?auto_761686 ?auto_761695 ) ) ( not ( = ?auto_761686 ?auto_761696 ) ) ( not ( = ?auto_761686 ?auto_761697 ) ) ( not ( = ?auto_761686 ?auto_761698 ) ) ( not ( = ?auto_761687 ?auto_761688 ) ) ( not ( = ?auto_761687 ?auto_761689 ) ) ( not ( = ?auto_761687 ?auto_761690 ) ) ( not ( = ?auto_761687 ?auto_761691 ) ) ( not ( = ?auto_761687 ?auto_761692 ) ) ( not ( = ?auto_761687 ?auto_761693 ) ) ( not ( = ?auto_761687 ?auto_761694 ) ) ( not ( = ?auto_761687 ?auto_761695 ) ) ( not ( = ?auto_761687 ?auto_761696 ) ) ( not ( = ?auto_761687 ?auto_761697 ) ) ( not ( = ?auto_761687 ?auto_761698 ) ) ( not ( = ?auto_761688 ?auto_761689 ) ) ( not ( = ?auto_761688 ?auto_761690 ) ) ( not ( = ?auto_761688 ?auto_761691 ) ) ( not ( = ?auto_761688 ?auto_761692 ) ) ( not ( = ?auto_761688 ?auto_761693 ) ) ( not ( = ?auto_761688 ?auto_761694 ) ) ( not ( = ?auto_761688 ?auto_761695 ) ) ( not ( = ?auto_761688 ?auto_761696 ) ) ( not ( = ?auto_761688 ?auto_761697 ) ) ( not ( = ?auto_761688 ?auto_761698 ) ) ( not ( = ?auto_761689 ?auto_761690 ) ) ( not ( = ?auto_761689 ?auto_761691 ) ) ( not ( = ?auto_761689 ?auto_761692 ) ) ( not ( = ?auto_761689 ?auto_761693 ) ) ( not ( = ?auto_761689 ?auto_761694 ) ) ( not ( = ?auto_761689 ?auto_761695 ) ) ( not ( = ?auto_761689 ?auto_761696 ) ) ( not ( = ?auto_761689 ?auto_761697 ) ) ( not ( = ?auto_761689 ?auto_761698 ) ) ( not ( = ?auto_761690 ?auto_761691 ) ) ( not ( = ?auto_761690 ?auto_761692 ) ) ( not ( = ?auto_761690 ?auto_761693 ) ) ( not ( = ?auto_761690 ?auto_761694 ) ) ( not ( = ?auto_761690 ?auto_761695 ) ) ( not ( = ?auto_761690 ?auto_761696 ) ) ( not ( = ?auto_761690 ?auto_761697 ) ) ( not ( = ?auto_761690 ?auto_761698 ) ) ( not ( = ?auto_761691 ?auto_761692 ) ) ( not ( = ?auto_761691 ?auto_761693 ) ) ( not ( = ?auto_761691 ?auto_761694 ) ) ( not ( = ?auto_761691 ?auto_761695 ) ) ( not ( = ?auto_761691 ?auto_761696 ) ) ( not ( = ?auto_761691 ?auto_761697 ) ) ( not ( = ?auto_761691 ?auto_761698 ) ) ( not ( = ?auto_761692 ?auto_761693 ) ) ( not ( = ?auto_761692 ?auto_761694 ) ) ( not ( = ?auto_761692 ?auto_761695 ) ) ( not ( = ?auto_761692 ?auto_761696 ) ) ( not ( = ?auto_761692 ?auto_761697 ) ) ( not ( = ?auto_761692 ?auto_761698 ) ) ( not ( = ?auto_761693 ?auto_761694 ) ) ( not ( = ?auto_761693 ?auto_761695 ) ) ( not ( = ?auto_761693 ?auto_761696 ) ) ( not ( = ?auto_761693 ?auto_761697 ) ) ( not ( = ?auto_761693 ?auto_761698 ) ) ( not ( = ?auto_761694 ?auto_761695 ) ) ( not ( = ?auto_761694 ?auto_761696 ) ) ( not ( = ?auto_761694 ?auto_761697 ) ) ( not ( = ?auto_761694 ?auto_761698 ) ) ( not ( = ?auto_761695 ?auto_761696 ) ) ( not ( = ?auto_761695 ?auto_761697 ) ) ( not ( = ?auto_761695 ?auto_761698 ) ) ( not ( = ?auto_761696 ?auto_761697 ) ) ( not ( = ?auto_761696 ?auto_761698 ) ) ( not ( = ?auto_761697 ?auto_761698 ) ) ( ON ?auto_761696 ?auto_761697 ) ( CLEAR ?auto_761694 ) ( ON ?auto_761695 ?auto_761696 ) ( CLEAR ?auto_761695 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_761683 ?auto_761684 ?auto_761685 ?auto_761686 ?auto_761687 ?auto_761688 ?auto_761689 ?auto_761690 ?auto_761691 ?auto_761692 ?auto_761693 ?auto_761694 ?auto_761695 )
      ( MAKE-15PILE ?auto_761683 ?auto_761684 ?auto_761685 ?auto_761686 ?auto_761687 ?auto_761688 ?auto_761689 ?auto_761690 ?auto_761691 ?auto_761692 ?auto_761693 ?auto_761694 ?auto_761695 ?auto_761696 ?auto_761697 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_761745 - BLOCK
      ?auto_761746 - BLOCK
      ?auto_761747 - BLOCK
      ?auto_761748 - BLOCK
      ?auto_761749 - BLOCK
      ?auto_761750 - BLOCK
      ?auto_761751 - BLOCK
      ?auto_761752 - BLOCK
      ?auto_761753 - BLOCK
      ?auto_761754 - BLOCK
      ?auto_761755 - BLOCK
      ?auto_761756 - BLOCK
      ?auto_761757 - BLOCK
      ?auto_761758 - BLOCK
      ?auto_761759 - BLOCK
    )
    :vars
    (
      ?auto_761760 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_761759 ?auto_761760 ) ( ON-TABLE ?auto_761745 ) ( ON ?auto_761746 ?auto_761745 ) ( ON ?auto_761747 ?auto_761746 ) ( ON ?auto_761748 ?auto_761747 ) ( ON ?auto_761749 ?auto_761748 ) ( ON ?auto_761750 ?auto_761749 ) ( ON ?auto_761751 ?auto_761750 ) ( ON ?auto_761752 ?auto_761751 ) ( ON ?auto_761753 ?auto_761752 ) ( ON ?auto_761754 ?auto_761753 ) ( ON ?auto_761755 ?auto_761754 ) ( not ( = ?auto_761745 ?auto_761746 ) ) ( not ( = ?auto_761745 ?auto_761747 ) ) ( not ( = ?auto_761745 ?auto_761748 ) ) ( not ( = ?auto_761745 ?auto_761749 ) ) ( not ( = ?auto_761745 ?auto_761750 ) ) ( not ( = ?auto_761745 ?auto_761751 ) ) ( not ( = ?auto_761745 ?auto_761752 ) ) ( not ( = ?auto_761745 ?auto_761753 ) ) ( not ( = ?auto_761745 ?auto_761754 ) ) ( not ( = ?auto_761745 ?auto_761755 ) ) ( not ( = ?auto_761745 ?auto_761756 ) ) ( not ( = ?auto_761745 ?auto_761757 ) ) ( not ( = ?auto_761745 ?auto_761758 ) ) ( not ( = ?auto_761745 ?auto_761759 ) ) ( not ( = ?auto_761745 ?auto_761760 ) ) ( not ( = ?auto_761746 ?auto_761747 ) ) ( not ( = ?auto_761746 ?auto_761748 ) ) ( not ( = ?auto_761746 ?auto_761749 ) ) ( not ( = ?auto_761746 ?auto_761750 ) ) ( not ( = ?auto_761746 ?auto_761751 ) ) ( not ( = ?auto_761746 ?auto_761752 ) ) ( not ( = ?auto_761746 ?auto_761753 ) ) ( not ( = ?auto_761746 ?auto_761754 ) ) ( not ( = ?auto_761746 ?auto_761755 ) ) ( not ( = ?auto_761746 ?auto_761756 ) ) ( not ( = ?auto_761746 ?auto_761757 ) ) ( not ( = ?auto_761746 ?auto_761758 ) ) ( not ( = ?auto_761746 ?auto_761759 ) ) ( not ( = ?auto_761746 ?auto_761760 ) ) ( not ( = ?auto_761747 ?auto_761748 ) ) ( not ( = ?auto_761747 ?auto_761749 ) ) ( not ( = ?auto_761747 ?auto_761750 ) ) ( not ( = ?auto_761747 ?auto_761751 ) ) ( not ( = ?auto_761747 ?auto_761752 ) ) ( not ( = ?auto_761747 ?auto_761753 ) ) ( not ( = ?auto_761747 ?auto_761754 ) ) ( not ( = ?auto_761747 ?auto_761755 ) ) ( not ( = ?auto_761747 ?auto_761756 ) ) ( not ( = ?auto_761747 ?auto_761757 ) ) ( not ( = ?auto_761747 ?auto_761758 ) ) ( not ( = ?auto_761747 ?auto_761759 ) ) ( not ( = ?auto_761747 ?auto_761760 ) ) ( not ( = ?auto_761748 ?auto_761749 ) ) ( not ( = ?auto_761748 ?auto_761750 ) ) ( not ( = ?auto_761748 ?auto_761751 ) ) ( not ( = ?auto_761748 ?auto_761752 ) ) ( not ( = ?auto_761748 ?auto_761753 ) ) ( not ( = ?auto_761748 ?auto_761754 ) ) ( not ( = ?auto_761748 ?auto_761755 ) ) ( not ( = ?auto_761748 ?auto_761756 ) ) ( not ( = ?auto_761748 ?auto_761757 ) ) ( not ( = ?auto_761748 ?auto_761758 ) ) ( not ( = ?auto_761748 ?auto_761759 ) ) ( not ( = ?auto_761748 ?auto_761760 ) ) ( not ( = ?auto_761749 ?auto_761750 ) ) ( not ( = ?auto_761749 ?auto_761751 ) ) ( not ( = ?auto_761749 ?auto_761752 ) ) ( not ( = ?auto_761749 ?auto_761753 ) ) ( not ( = ?auto_761749 ?auto_761754 ) ) ( not ( = ?auto_761749 ?auto_761755 ) ) ( not ( = ?auto_761749 ?auto_761756 ) ) ( not ( = ?auto_761749 ?auto_761757 ) ) ( not ( = ?auto_761749 ?auto_761758 ) ) ( not ( = ?auto_761749 ?auto_761759 ) ) ( not ( = ?auto_761749 ?auto_761760 ) ) ( not ( = ?auto_761750 ?auto_761751 ) ) ( not ( = ?auto_761750 ?auto_761752 ) ) ( not ( = ?auto_761750 ?auto_761753 ) ) ( not ( = ?auto_761750 ?auto_761754 ) ) ( not ( = ?auto_761750 ?auto_761755 ) ) ( not ( = ?auto_761750 ?auto_761756 ) ) ( not ( = ?auto_761750 ?auto_761757 ) ) ( not ( = ?auto_761750 ?auto_761758 ) ) ( not ( = ?auto_761750 ?auto_761759 ) ) ( not ( = ?auto_761750 ?auto_761760 ) ) ( not ( = ?auto_761751 ?auto_761752 ) ) ( not ( = ?auto_761751 ?auto_761753 ) ) ( not ( = ?auto_761751 ?auto_761754 ) ) ( not ( = ?auto_761751 ?auto_761755 ) ) ( not ( = ?auto_761751 ?auto_761756 ) ) ( not ( = ?auto_761751 ?auto_761757 ) ) ( not ( = ?auto_761751 ?auto_761758 ) ) ( not ( = ?auto_761751 ?auto_761759 ) ) ( not ( = ?auto_761751 ?auto_761760 ) ) ( not ( = ?auto_761752 ?auto_761753 ) ) ( not ( = ?auto_761752 ?auto_761754 ) ) ( not ( = ?auto_761752 ?auto_761755 ) ) ( not ( = ?auto_761752 ?auto_761756 ) ) ( not ( = ?auto_761752 ?auto_761757 ) ) ( not ( = ?auto_761752 ?auto_761758 ) ) ( not ( = ?auto_761752 ?auto_761759 ) ) ( not ( = ?auto_761752 ?auto_761760 ) ) ( not ( = ?auto_761753 ?auto_761754 ) ) ( not ( = ?auto_761753 ?auto_761755 ) ) ( not ( = ?auto_761753 ?auto_761756 ) ) ( not ( = ?auto_761753 ?auto_761757 ) ) ( not ( = ?auto_761753 ?auto_761758 ) ) ( not ( = ?auto_761753 ?auto_761759 ) ) ( not ( = ?auto_761753 ?auto_761760 ) ) ( not ( = ?auto_761754 ?auto_761755 ) ) ( not ( = ?auto_761754 ?auto_761756 ) ) ( not ( = ?auto_761754 ?auto_761757 ) ) ( not ( = ?auto_761754 ?auto_761758 ) ) ( not ( = ?auto_761754 ?auto_761759 ) ) ( not ( = ?auto_761754 ?auto_761760 ) ) ( not ( = ?auto_761755 ?auto_761756 ) ) ( not ( = ?auto_761755 ?auto_761757 ) ) ( not ( = ?auto_761755 ?auto_761758 ) ) ( not ( = ?auto_761755 ?auto_761759 ) ) ( not ( = ?auto_761755 ?auto_761760 ) ) ( not ( = ?auto_761756 ?auto_761757 ) ) ( not ( = ?auto_761756 ?auto_761758 ) ) ( not ( = ?auto_761756 ?auto_761759 ) ) ( not ( = ?auto_761756 ?auto_761760 ) ) ( not ( = ?auto_761757 ?auto_761758 ) ) ( not ( = ?auto_761757 ?auto_761759 ) ) ( not ( = ?auto_761757 ?auto_761760 ) ) ( not ( = ?auto_761758 ?auto_761759 ) ) ( not ( = ?auto_761758 ?auto_761760 ) ) ( not ( = ?auto_761759 ?auto_761760 ) ) ( ON ?auto_761758 ?auto_761759 ) ( ON ?auto_761757 ?auto_761758 ) ( CLEAR ?auto_761755 ) ( ON ?auto_761756 ?auto_761757 ) ( CLEAR ?auto_761756 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_761745 ?auto_761746 ?auto_761747 ?auto_761748 ?auto_761749 ?auto_761750 ?auto_761751 ?auto_761752 ?auto_761753 ?auto_761754 ?auto_761755 ?auto_761756 )
      ( MAKE-15PILE ?auto_761745 ?auto_761746 ?auto_761747 ?auto_761748 ?auto_761749 ?auto_761750 ?auto_761751 ?auto_761752 ?auto_761753 ?auto_761754 ?auto_761755 ?auto_761756 ?auto_761757 ?auto_761758 ?auto_761759 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_761807 - BLOCK
      ?auto_761808 - BLOCK
      ?auto_761809 - BLOCK
      ?auto_761810 - BLOCK
      ?auto_761811 - BLOCK
      ?auto_761812 - BLOCK
      ?auto_761813 - BLOCK
      ?auto_761814 - BLOCK
      ?auto_761815 - BLOCK
      ?auto_761816 - BLOCK
      ?auto_761817 - BLOCK
      ?auto_761818 - BLOCK
      ?auto_761819 - BLOCK
      ?auto_761820 - BLOCK
      ?auto_761821 - BLOCK
    )
    :vars
    (
      ?auto_761822 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_761821 ?auto_761822 ) ( ON-TABLE ?auto_761807 ) ( ON ?auto_761808 ?auto_761807 ) ( ON ?auto_761809 ?auto_761808 ) ( ON ?auto_761810 ?auto_761809 ) ( ON ?auto_761811 ?auto_761810 ) ( ON ?auto_761812 ?auto_761811 ) ( ON ?auto_761813 ?auto_761812 ) ( ON ?auto_761814 ?auto_761813 ) ( ON ?auto_761815 ?auto_761814 ) ( ON ?auto_761816 ?auto_761815 ) ( not ( = ?auto_761807 ?auto_761808 ) ) ( not ( = ?auto_761807 ?auto_761809 ) ) ( not ( = ?auto_761807 ?auto_761810 ) ) ( not ( = ?auto_761807 ?auto_761811 ) ) ( not ( = ?auto_761807 ?auto_761812 ) ) ( not ( = ?auto_761807 ?auto_761813 ) ) ( not ( = ?auto_761807 ?auto_761814 ) ) ( not ( = ?auto_761807 ?auto_761815 ) ) ( not ( = ?auto_761807 ?auto_761816 ) ) ( not ( = ?auto_761807 ?auto_761817 ) ) ( not ( = ?auto_761807 ?auto_761818 ) ) ( not ( = ?auto_761807 ?auto_761819 ) ) ( not ( = ?auto_761807 ?auto_761820 ) ) ( not ( = ?auto_761807 ?auto_761821 ) ) ( not ( = ?auto_761807 ?auto_761822 ) ) ( not ( = ?auto_761808 ?auto_761809 ) ) ( not ( = ?auto_761808 ?auto_761810 ) ) ( not ( = ?auto_761808 ?auto_761811 ) ) ( not ( = ?auto_761808 ?auto_761812 ) ) ( not ( = ?auto_761808 ?auto_761813 ) ) ( not ( = ?auto_761808 ?auto_761814 ) ) ( not ( = ?auto_761808 ?auto_761815 ) ) ( not ( = ?auto_761808 ?auto_761816 ) ) ( not ( = ?auto_761808 ?auto_761817 ) ) ( not ( = ?auto_761808 ?auto_761818 ) ) ( not ( = ?auto_761808 ?auto_761819 ) ) ( not ( = ?auto_761808 ?auto_761820 ) ) ( not ( = ?auto_761808 ?auto_761821 ) ) ( not ( = ?auto_761808 ?auto_761822 ) ) ( not ( = ?auto_761809 ?auto_761810 ) ) ( not ( = ?auto_761809 ?auto_761811 ) ) ( not ( = ?auto_761809 ?auto_761812 ) ) ( not ( = ?auto_761809 ?auto_761813 ) ) ( not ( = ?auto_761809 ?auto_761814 ) ) ( not ( = ?auto_761809 ?auto_761815 ) ) ( not ( = ?auto_761809 ?auto_761816 ) ) ( not ( = ?auto_761809 ?auto_761817 ) ) ( not ( = ?auto_761809 ?auto_761818 ) ) ( not ( = ?auto_761809 ?auto_761819 ) ) ( not ( = ?auto_761809 ?auto_761820 ) ) ( not ( = ?auto_761809 ?auto_761821 ) ) ( not ( = ?auto_761809 ?auto_761822 ) ) ( not ( = ?auto_761810 ?auto_761811 ) ) ( not ( = ?auto_761810 ?auto_761812 ) ) ( not ( = ?auto_761810 ?auto_761813 ) ) ( not ( = ?auto_761810 ?auto_761814 ) ) ( not ( = ?auto_761810 ?auto_761815 ) ) ( not ( = ?auto_761810 ?auto_761816 ) ) ( not ( = ?auto_761810 ?auto_761817 ) ) ( not ( = ?auto_761810 ?auto_761818 ) ) ( not ( = ?auto_761810 ?auto_761819 ) ) ( not ( = ?auto_761810 ?auto_761820 ) ) ( not ( = ?auto_761810 ?auto_761821 ) ) ( not ( = ?auto_761810 ?auto_761822 ) ) ( not ( = ?auto_761811 ?auto_761812 ) ) ( not ( = ?auto_761811 ?auto_761813 ) ) ( not ( = ?auto_761811 ?auto_761814 ) ) ( not ( = ?auto_761811 ?auto_761815 ) ) ( not ( = ?auto_761811 ?auto_761816 ) ) ( not ( = ?auto_761811 ?auto_761817 ) ) ( not ( = ?auto_761811 ?auto_761818 ) ) ( not ( = ?auto_761811 ?auto_761819 ) ) ( not ( = ?auto_761811 ?auto_761820 ) ) ( not ( = ?auto_761811 ?auto_761821 ) ) ( not ( = ?auto_761811 ?auto_761822 ) ) ( not ( = ?auto_761812 ?auto_761813 ) ) ( not ( = ?auto_761812 ?auto_761814 ) ) ( not ( = ?auto_761812 ?auto_761815 ) ) ( not ( = ?auto_761812 ?auto_761816 ) ) ( not ( = ?auto_761812 ?auto_761817 ) ) ( not ( = ?auto_761812 ?auto_761818 ) ) ( not ( = ?auto_761812 ?auto_761819 ) ) ( not ( = ?auto_761812 ?auto_761820 ) ) ( not ( = ?auto_761812 ?auto_761821 ) ) ( not ( = ?auto_761812 ?auto_761822 ) ) ( not ( = ?auto_761813 ?auto_761814 ) ) ( not ( = ?auto_761813 ?auto_761815 ) ) ( not ( = ?auto_761813 ?auto_761816 ) ) ( not ( = ?auto_761813 ?auto_761817 ) ) ( not ( = ?auto_761813 ?auto_761818 ) ) ( not ( = ?auto_761813 ?auto_761819 ) ) ( not ( = ?auto_761813 ?auto_761820 ) ) ( not ( = ?auto_761813 ?auto_761821 ) ) ( not ( = ?auto_761813 ?auto_761822 ) ) ( not ( = ?auto_761814 ?auto_761815 ) ) ( not ( = ?auto_761814 ?auto_761816 ) ) ( not ( = ?auto_761814 ?auto_761817 ) ) ( not ( = ?auto_761814 ?auto_761818 ) ) ( not ( = ?auto_761814 ?auto_761819 ) ) ( not ( = ?auto_761814 ?auto_761820 ) ) ( not ( = ?auto_761814 ?auto_761821 ) ) ( not ( = ?auto_761814 ?auto_761822 ) ) ( not ( = ?auto_761815 ?auto_761816 ) ) ( not ( = ?auto_761815 ?auto_761817 ) ) ( not ( = ?auto_761815 ?auto_761818 ) ) ( not ( = ?auto_761815 ?auto_761819 ) ) ( not ( = ?auto_761815 ?auto_761820 ) ) ( not ( = ?auto_761815 ?auto_761821 ) ) ( not ( = ?auto_761815 ?auto_761822 ) ) ( not ( = ?auto_761816 ?auto_761817 ) ) ( not ( = ?auto_761816 ?auto_761818 ) ) ( not ( = ?auto_761816 ?auto_761819 ) ) ( not ( = ?auto_761816 ?auto_761820 ) ) ( not ( = ?auto_761816 ?auto_761821 ) ) ( not ( = ?auto_761816 ?auto_761822 ) ) ( not ( = ?auto_761817 ?auto_761818 ) ) ( not ( = ?auto_761817 ?auto_761819 ) ) ( not ( = ?auto_761817 ?auto_761820 ) ) ( not ( = ?auto_761817 ?auto_761821 ) ) ( not ( = ?auto_761817 ?auto_761822 ) ) ( not ( = ?auto_761818 ?auto_761819 ) ) ( not ( = ?auto_761818 ?auto_761820 ) ) ( not ( = ?auto_761818 ?auto_761821 ) ) ( not ( = ?auto_761818 ?auto_761822 ) ) ( not ( = ?auto_761819 ?auto_761820 ) ) ( not ( = ?auto_761819 ?auto_761821 ) ) ( not ( = ?auto_761819 ?auto_761822 ) ) ( not ( = ?auto_761820 ?auto_761821 ) ) ( not ( = ?auto_761820 ?auto_761822 ) ) ( not ( = ?auto_761821 ?auto_761822 ) ) ( ON ?auto_761820 ?auto_761821 ) ( ON ?auto_761819 ?auto_761820 ) ( ON ?auto_761818 ?auto_761819 ) ( CLEAR ?auto_761816 ) ( ON ?auto_761817 ?auto_761818 ) ( CLEAR ?auto_761817 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_761807 ?auto_761808 ?auto_761809 ?auto_761810 ?auto_761811 ?auto_761812 ?auto_761813 ?auto_761814 ?auto_761815 ?auto_761816 ?auto_761817 )
      ( MAKE-15PILE ?auto_761807 ?auto_761808 ?auto_761809 ?auto_761810 ?auto_761811 ?auto_761812 ?auto_761813 ?auto_761814 ?auto_761815 ?auto_761816 ?auto_761817 ?auto_761818 ?auto_761819 ?auto_761820 ?auto_761821 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_761869 - BLOCK
      ?auto_761870 - BLOCK
      ?auto_761871 - BLOCK
      ?auto_761872 - BLOCK
      ?auto_761873 - BLOCK
      ?auto_761874 - BLOCK
      ?auto_761875 - BLOCK
      ?auto_761876 - BLOCK
      ?auto_761877 - BLOCK
      ?auto_761878 - BLOCK
      ?auto_761879 - BLOCK
      ?auto_761880 - BLOCK
      ?auto_761881 - BLOCK
      ?auto_761882 - BLOCK
      ?auto_761883 - BLOCK
    )
    :vars
    (
      ?auto_761884 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_761883 ?auto_761884 ) ( ON-TABLE ?auto_761869 ) ( ON ?auto_761870 ?auto_761869 ) ( ON ?auto_761871 ?auto_761870 ) ( ON ?auto_761872 ?auto_761871 ) ( ON ?auto_761873 ?auto_761872 ) ( ON ?auto_761874 ?auto_761873 ) ( ON ?auto_761875 ?auto_761874 ) ( ON ?auto_761876 ?auto_761875 ) ( ON ?auto_761877 ?auto_761876 ) ( not ( = ?auto_761869 ?auto_761870 ) ) ( not ( = ?auto_761869 ?auto_761871 ) ) ( not ( = ?auto_761869 ?auto_761872 ) ) ( not ( = ?auto_761869 ?auto_761873 ) ) ( not ( = ?auto_761869 ?auto_761874 ) ) ( not ( = ?auto_761869 ?auto_761875 ) ) ( not ( = ?auto_761869 ?auto_761876 ) ) ( not ( = ?auto_761869 ?auto_761877 ) ) ( not ( = ?auto_761869 ?auto_761878 ) ) ( not ( = ?auto_761869 ?auto_761879 ) ) ( not ( = ?auto_761869 ?auto_761880 ) ) ( not ( = ?auto_761869 ?auto_761881 ) ) ( not ( = ?auto_761869 ?auto_761882 ) ) ( not ( = ?auto_761869 ?auto_761883 ) ) ( not ( = ?auto_761869 ?auto_761884 ) ) ( not ( = ?auto_761870 ?auto_761871 ) ) ( not ( = ?auto_761870 ?auto_761872 ) ) ( not ( = ?auto_761870 ?auto_761873 ) ) ( not ( = ?auto_761870 ?auto_761874 ) ) ( not ( = ?auto_761870 ?auto_761875 ) ) ( not ( = ?auto_761870 ?auto_761876 ) ) ( not ( = ?auto_761870 ?auto_761877 ) ) ( not ( = ?auto_761870 ?auto_761878 ) ) ( not ( = ?auto_761870 ?auto_761879 ) ) ( not ( = ?auto_761870 ?auto_761880 ) ) ( not ( = ?auto_761870 ?auto_761881 ) ) ( not ( = ?auto_761870 ?auto_761882 ) ) ( not ( = ?auto_761870 ?auto_761883 ) ) ( not ( = ?auto_761870 ?auto_761884 ) ) ( not ( = ?auto_761871 ?auto_761872 ) ) ( not ( = ?auto_761871 ?auto_761873 ) ) ( not ( = ?auto_761871 ?auto_761874 ) ) ( not ( = ?auto_761871 ?auto_761875 ) ) ( not ( = ?auto_761871 ?auto_761876 ) ) ( not ( = ?auto_761871 ?auto_761877 ) ) ( not ( = ?auto_761871 ?auto_761878 ) ) ( not ( = ?auto_761871 ?auto_761879 ) ) ( not ( = ?auto_761871 ?auto_761880 ) ) ( not ( = ?auto_761871 ?auto_761881 ) ) ( not ( = ?auto_761871 ?auto_761882 ) ) ( not ( = ?auto_761871 ?auto_761883 ) ) ( not ( = ?auto_761871 ?auto_761884 ) ) ( not ( = ?auto_761872 ?auto_761873 ) ) ( not ( = ?auto_761872 ?auto_761874 ) ) ( not ( = ?auto_761872 ?auto_761875 ) ) ( not ( = ?auto_761872 ?auto_761876 ) ) ( not ( = ?auto_761872 ?auto_761877 ) ) ( not ( = ?auto_761872 ?auto_761878 ) ) ( not ( = ?auto_761872 ?auto_761879 ) ) ( not ( = ?auto_761872 ?auto_761880 ) ) ( not ( = ?auto_761872 ?auto_761881 ) ) ( not ( = ?auto_761872 ?auto_761882 ) ) ( not ( = ?auto_761872 ?auto_761883 ) ) ( not ( = ?auto_761872 ?auto_761884 ) ) ( not ( = ?auto_761873 ?auto_761874 ) ) ( not ( = ?auto_761873 ?auto_761875 ) ) ( not ( = ?auto_761873 ?auto_761876 ) ) ( not ( = ?auto_761873 ?auto_761877 ) ) ( not ( = ?auto_761873 ?auto_761878 ) ) ( not ( = ?auto_761873 ?auto_761879 ) ) ( not ( = ?auto_761873 ?auto_761880 ) ) ( not ( = ?auto_761873 ?auto_761881 ) ) ( not ( = ?auto_761873 ?auto_761882 ) ) ( not ( = ?auto_761873 ?auto_761883 ) ) ( not ( = ?auto_761873 ?auto_761884 ) ) ( not ( = ?auto_761874 ?auto_761875 ) ) ( not ( = ?auto_761874 ?auto_761876 ) ) ( not ( = ?auto_761874 ?auto_761877 ) ) ( not ( = ?auto_761874 ?auto_761878 ) ) ( not ( = ?auto_761874 ?auto_761879 ) ) ( not ( = ?auto_761874 ?auto_761880 ) ) ( not ( = ?auto_761874 ?auto_761881 ) ) ( not ( = ?auto_761874 ?auto_761882 ) ) ( not ( = ?auto_761874 ?auto_761883 ) ) ( not ( = ?auto_761874 ?auto_761884 ) ) ( not ( = ?auto_761875 ?auto_761876 ) ) ( not ( = ?auto_761875 ?auto_761877 ) ) ( not ( = ?auto_761875 ?auto_761878 ) ) ( not ( = ?auto_761875 ?auto_761879 ) ) ( not ( = ?auto_761875 ?auto_761880 ) ) ( not ( = ?auto_761875 ?auto_761881 ) ) ( not ( = ?auto_761875 ?auto_761882 ) ) ( not ( = ?auto_761875 ?auto_761883 ) ) ( not ( = ?auto_761875 ?auto_761884 ) ) ( not ( = ?auto_761876 ?auto_761877 ) ) ( not ( = ?auto_761876 ?auto_761878 ) ) ( not ( = ?auto_761876 ?auto_761879 ) ) ( not ( = ?auto_761876 ?auto_761880 ) ) ( not ( = ?auto_761876 ?auto_761881 ) ) ( not ( = ?auto_761876 ?auto_761882 ) ) ( not ( = ?auto_761876 ?auto_761883 ) ) ( not ( = ?auto_761876 ?auto_761884 ) ) ( not ( = ?auto_761877 ?auto_761878 ) ) ( not ( = ?auto_761877 ?auto_761879 ) ) ( not ( = ?auto_761877 ?auto_761880 ) ) ( not ( = ?auto_761877 ?auto_761881 ) ) ( not ( = ?auto_761877 ?auto_761882 ) ) ( not ( = ?auto_761877 ?auto_761883 ) ) ( not ( = ?auto_761877 ?auto_761884 ) ) ( not ( = ?auto_761878 ?auto_761879 ) ) ( not ( = ?auto_761878 ?auto_761880 ) ) ( not ( = ?auto_761878 ?auto_761881 ) ) ( not ( = ?auto_761878 ?auto_761882 ) ) ( not ( = ?auto_761878 ?auto_761883 ) ) ( not ( = ?auto_761878 ?auto_761884 ) ) ( not ( = ?auto_761879 ?auto_761880 ) ) ( not ( = ?auto_761879 ?auto_761881 ) ) ( not ( = ?auto_761879 ?auto_761882 ) ) ( not ( = ?auto_761879 ?auto_761883 ) ) ( not ( = ?auto_761879 ?auto_761884 ) ) ( not ( = ?auto_761880 ?auto_761881 ) ) ( not ( = ?auto_761880 ?auto_761882 ) ) ( not ( = ?auto_761880 ?auto_761883 ) ) ( not ( = ?auto_761880 ?auto_761884 ) ) ( not ( = ?auto_761881 ?auto_761882 ) ) ( not ( = ?auto_761881 ?auto_761883 ) ) ( not ( = ?auto_761881 ?auto_761884 ) ) ( not ( = ?auto_761882 ?auto_761883 ) ) ( not ( = ?auto_761882 ?auto_761884 ) ) ( not ( = ?auto_761883 ?auto_761884 ) ) ( ON ?auto_761882 ?auto_761883 ) ( ON ?auto_761881 ?auto_761882 ) ( ON ?auto_761880 ?auto_761881 ) ( ON ?auto_761879 ?auto_761880 ) ( CLEAR ?auto_761877 ) ( ON ?auto_761878 ?auto_761879 ) ( CLEAR ?auto_761878 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_761869 ?auto_761870 ?auto_761871 ?auto_761872 ?auto_761873 ?auto_761874 ?auto_761875 ?auto_761876 ?auto_761877 ?auto_761878 )
      ( MAKE-15PILE ?auto_761869 ?auto_761870 ?auto_761871 ?auto_761872 ?auto_761873 ?auto_761874 ?auto_761875 ?auto_761876 ?auto_761877 ?auto_761878 ?auto_761879 ?auto_761880 ?auto_761881 ?auto_761882 ?auto_761883 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_761931 - BLOCK
      ?auto_761932 - BLOCK
      ?auto_761933 - BLOCK
      ?auto_761934 - BLOCK
      ?auto_761935 - BLOCK
      ?auto_761936 - BLOCK
      ?auto_761937 - BLOCK
      ?auto_761938 - BLOCK
      ?auto_761939 - BLOCK
      ?auto_761940 - BLOCK
      ?auto_761941 - BLOCK
      ?auto_761942 - BLOCK
      ?auto_761943 - BLOCK
      ?auto_761944 - BLOCK
      ?auto_761945 - BLOCK
    )
    :vars
    (
      ?auto_761946 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_761945 ?auto_761946 ) ( ON-TABLE ?auto_761931 ) ( ON ?auto_761932 ?auto_761931 ) ( ON ?auto_761933 ?auto_761932 ) ( ON ?auto_761934 ?auto_761933 ) ( ON ?auto_761935 ?auto_761934 ) ( ON ?auto_761936 ?auto_761935 ) ( ON ?auto_761937 ?auto_761936 ) ( ON ?auto_761938 ?auto_761937 ) ( not ( = ?auto_761931 ?auto_761932 ) ) ( not ( = ?auto_761931 ?auto_761933 ) ) ( not ( = ?auto_761931 ?auto_761934 ) ) ( not ( = ?auto_761931 ?auto_761935 ) ) ( not ( = ?auto_761931 ?auto_761936 ) ) ( not ( = ?auto_761931 ?auto_761937 ) ) ( not ( = ?auto_761931 ?auto_761938 ) ) ( not ( = ?auto_761931 ?auto_761939 ) ) ( not ( = ?auto_761931 ?auto_761940 ) ) ( not ( = ?auto_761931 ?auto_761941 ) ) ( not ( = ?auto_761931 ?auto_761942 ) ) ( not ( = ?auto_761931 ?auto_761943 ) ) ( not ( = ?auto_761931 ?auto_761944 ) ) ( not ( = ?auto_761931 ?auto_761945 ) ) ( not ( = ?auto_761931 ?auto_761946 ) ) ( not ( = ?auto_761932 ?auto_761933 ) ) ( not ( = ?auto_761932 ?auto_761934 ) ) ( not ( = ?auto_761932 ?auto_761935 ) ) ( not ( = ?auto_761932 ?auto_761936 ) ) ( not ( = ?auto_761932 ?auto_761937 ) ) ( not ( = ?auto_761932 ?auto_761938 ) ) ( not ( = ?auto_761932 ?auto_761939 ) ) ( not ( = ?auto_761932 ?auto_761940 ) ) ( not ( = ?auto_761932 ?auto_761941 ) ) ( not ( = ?auto_761932 ?auto_761942 ) ) ( not ( = ?auto_761932 ?auto_761943 ) ) ( not ( = ?auto_761932 ?auto_761944 ) ) ( not ( = ?auto_761932 ?auto_761945 ) ) ( not ( = ?auto_761932 ?auto_761946 ) ) ( not ( = ?auto_761933 ?auto_761934 ) ) ( not ( = ?auto_761933 ?auto_761935 ) ) ( not ( = ?auto_761933 ?auto_761936 ) ) ( not ( = ?auto_761933 ?auto_761937 ) ) ( not ( = ?auto_761933 ?auto_761938 ) ) ( not ( = ?auto_761933 ?auto_761939 ) ) ( not ( = ?auto_761933 ?auto_761940 ) ) ( not ( = ?auto_761933 ?auto_761941 ) ) ( not ( = ?auto_761933 ?auto_761942 ) ) ( not ( = ?auto_761933 ?auto_761943 ) ) ( not ( = ?auto_761933 ?auto_761944 ) ) ( not ( = ?auto_761933 ?auto_761945 ) ) ( not ( = ?auto_761933 ?auto_761946 ) ) ( not ( = ?auto_761934 ?auto_761935 ) ) ( not ( = ?auto_761934 ?auto_761936 ) ) ( not ( = ?auto_761934 ?auto_761937 ) ) ( not ( = ?auto_761934 ?auto_761938 ) ) ( not ( = ?auto_761934 ?auto_761939 ) ) ( not ( = ?auto_761934 ?auto_761940 ) ) ( not ( = ?auto_761934 ?auto_761941 ) ) ( not ( = ?auto_761934 ?auto_761942 ) ) ( not ( = ?auto_761934 ?auto_761943 ) ) ( not ( = ?auto_761934 ?auto_761944 ) ) ( not ( = ?auto_761934 ?auto_761945 ) ) ( not ( = ?auto_761934 ?auto_761946 ) ) ( not ( = ?auto_761935 ?auto_761936 ) ) ( not ( = ?auto_761935 ?auto_761937 ) ) ( not ( = ?auto_761935 ?auto_761938 ) ) ( not ( = ?auto_761935 ?auto_761939 ) ) ( not ( = ?auto_761935 ?auto_761940 ) ) ( not ( = ?auto_761935 ?auto_761941 ) ) ( not ( = ?auto_761935 ?auto_761942 ) ) ( not ( = ?auto_761935 ?auto_761943 ) ) ( not ( = ?auto_761935 ?auto_761944 ) ) ( not ( = ?auto_761935 ?auto_761945 ) ) ( not ( = ?auto_761935 ?auto_761946 ) ) ( not ( = ?auto_761936 ?auto_761937 ) ) ( not ( = ?auto_761936 ?auto_761938 ) ) ( not ( = ?auto_761936 ?auto_761939 ) ) ( not ( = ?auto_761936 ?auto_761940 ) ) ( not ( = ?auto_761936 ?auto_761941 ) ) ( not ( = ?auto_761936 ?auto_761942 ) ) ( not ( = ?auto_761936 ?auto_761943 ) ) ( not ( = ?auto_761936 ?auto_761944 ) ) ( not ( = ?auto_761936 ?auto_761945 ) ) ( not ( = ?auto_761936 ?auto_761946 ) ) ( not ( = ?auto_761937 ?auto_761938 ) ) ( not ( = ?auto_761937 ?auto_761939 ) ) ( not ( = ?auto_761937 ?auto_761940 ) ) ( not ( = ?auto_761937 ?auto_761941 ) ) ( not ( = ?auto_761937 ?auto_761942 ) ) ( not ( = ?auto_761937 ?auto_761943 ) ) ( not ( = ?auto_761937 ?auto_761944 ) ) ( not ( = ?auto_761937 ?auto_761945 ) ) ( not ( = ?auto_761937 ?auto_761946 ) ) ( not ( = ?auto_761938 ?auto_761939 ) ) ( not ( = ?auto_761938 ?auto_761940 ) ) ( not ( = ?auto_761938 ?auto_761941 ) ) ( not ( = ?auto_761938 ?auto_761942 ) ) ( not ( = ?auto_761938 ?auto_761943 ) ) ( not ( = ?auto_761938 ?auto_761944 ) ) ( not ( = ?auto_761938 ?auto_761945 ) ) ( not ( = ?auto_761938 ?auto_761946 ) ) ( not ( = ?auto_761939 ?auto_761940 ) ) ( not ( = ?auto_761939 ?auto_761941 ) ) ( not ( = ?auto_761939 ?auto_761942 ) ) ( not ( = ?auto_761939 ?auto_761943 ) ) ( not ( = ?auto_761939 ?auto_761944 ) ) ( not ( = ?auto_761939 ?auto_761945 ) ) ( not ( = ?auto_761939 ?auto_761946 ) ) ( not ( = ?auto_761940 ?auto_761941 ) ) ( not ( = ?auto_761940 ?auto_761942 ) ) ( not ( = ?auto_761940 ?auto_761943 ) ) ( not ( = ?auto_761940 ?auto_761944 ) ) ( not ( = ?auto_761940 ?auto_761945 ) ) ( not ( = ?auto_761940 ?auto_761946 ) ) ( not ( = ?auto_761941 ?auto_761942 ) ) ( not ( = ?auto_761941 ?auto_761943 ) ) ( not ( = ?auto_761941 ?auto_761944 ) ) ( not ( = ?auto_761941 ?auto_761945 ) ) ( not ( = ?auto_761941 ?auto_761946 ) ) ( not ( = ?auto_761942 ?auto_761943 ) ) ( not ( = ?auto_761942 ?auto_761944 ) ) ( not ( = ?auto_761942 ?auto_761945 ) ) ( not ( = ?auto_761942 ?auto_761946 ) ) ( not ( = ?auto_761943 ?auto_761944 ) ) ( not ( = ?auto_761943 ?auto_761945 ) ) ( not ( = ?auto_761943 ?auto_761946 ) ) ( not ( = ?auto_761944 ?auto_761945 ) ) ( not ( = ?auto_761944 ?auto_761946 ) ) ( not ( = ?auto_761945 ?auto_761946 ) ) ( ON ?auto_761944 ?auto_761945 ) ( ON ?auto_761943 ?auto_761944 ) ( ON ?auto_761942 ?auto_761943 ) ( ON ?auto_761941 ?auto_761942 ) ( ON ?auto_761940 ?auto_761941 ) ( CLEAR ?auto_761938 ) ( ON ?auto_761939 ?auto_761940 ) ( CLEAR ?auto_761939 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_761931 ?auto_761932 ?auto_761933 ?auto_761934 ?auto_761935 ?auto_761936 ?auto_761937 ?auto_761938 ?auto_761939 )
      ( MAKE-15PILE ?auto_761931 ?auto_761932 ?auto_761933 ?auto_761934 ?auto_761935 ?auto_761936 ?auto_761937 ?auto_761938 ?auto_761939 ?auto_761940 ?auto_761941 ?auto_761942 ?auto_761943 ?auto_761944 ?auto_761945 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_761993 - BLOCK
      ?auto_761994 - BLOCK
      ?auto_761995 - BLOCK
      ?auto_761996 - BLOCK
      ?auto_761997 - BLOCK
      ?auto_761998 - BLOCK
      ?auto_761999 - BLOCK
      ?auto_762000 - BLOCK
      ?auto_762001 - BLOCK
      ?auto_762002 - BLOCK
      ?auto_762003 - BLOCK
      ?auto_762004 - BLOCK
      ?auto_762005 - BLOCK
      ?auto_762006 - BLOCK
      ?auto_762007 - BLOCK
    )
    :vars
    (
      ?auto_762008 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_762007 ?auto_762008 ) ( ON-TABLE ?auto_761993 ) ( ON ?auto_761994 ?auto_761993 ) ( ON ?auto_761995 ?auto_761994 ) ( ON ?auto_761996 ?auto_761995 ) ( ON ?auto_761997 ?auto_761996 ) ( ON ?auto_761998 ?auto_761997 ) ( ON ?auto_761999 ?auto_761998 ) ( not ( = ?auto_761993 ?auto_761994 ) ) ( not ( = ?auto_761993 ?auto_761995 ) ) ( not ( = ?auto_761993 ?auto_761996 ) ) ( not ( = ?auto_761993 ?auto_761997 ) ) ( not ( = ?auto_761993 ?auto_761998 ) ) ( not ( = ?auto_761993 ?auto_761999 ) ) ( not ( = ?auto_761993 ?auto_762000 ) ) ( not ( = ?auto_761993 ?auto_762001 ) ) ( not ( = ?auto_761993 ?auto_762002 ) ) ( not ( = ?auto_761993 ?auto_762003 ) ) ( not ( = ?auto_761993 ?auto_762004 ) ) ( not ( = ?auto_761993 ?auto_762005 ) ) ( not ( = ?auto_761993 ?auto_762006 ) ) ( not ( = ?auto_761993 ?auto_762007 ) ) ( not ( = ?auto_761993 ?auto_762008 ) ) ( not ( = ?auto_761994 ?auto_761995 ) ) ( not ( = ?auto_761994 ?auto_761996 ) ) ( not ( = ?auto_761994 ?auto_761997 ) ) ( not ( = ?auto_761994 ?auto_761998 ) ) ( not ( = ?auto_761994 ?auto_761999 ) ) ( not ( = ?auto_761994 ?auto_762000 ) ) ( not ( = ?auto_761994 ?auto_762001 ) ) ( not ( = ?auto_761994 ?auto_762002 ) ) ( not ( = ?auto_761994 ?auto_762003 ) ) ( not ( = ?auto_761994 ?auto_762004 ) ) ( not ( = ?auto_761994 ?auto_762005 ) ) ( not ( = ?auto_761994 ?auto_762006 ) ) ( not ( = ?auto_761994 ?auto_762007 ) ) ( not ( = ?auto_761994 ?auto_762008 ) ) ( not ( = ?auto_761995 ?auto_761996 ) ) ( not ( = ?auto_761995 ?auto_761997 ) ) ( not ( = ?auto_761995 ?auto_761998 ) ) ( not ( = ?auto_761995 ?auto_761999 ) ) ( not ( = ?auto_761995 ?auto_762000 ) ) ( not ( = ?auto_761995 ?auto_762001 ) ) ( not ( = ?auto_761995 ?auto_762002 ) ) ( not ( = ?auto_761995 ?auto_762003 ) ) ( not ( = ?auto_761995 ?auto_762004 ) ) ( not ( = ?auto_761995 ?auto_762005 ) ) ( not ( = ?auto_761995 ?auto_762006 ) ) ( not ( = ?auto_761995 ?auto_762007 ) ) ( not ( = ?auto_761995 ?auto_762008 ) ) ( not ( = ?auto_761996 ?auto_761997 ) ) ( not ( = ?auto_761996 ?auto_761998 ) ) ( not ( = ?auto_761996 ?auto_761999 ) ) ( not ( = ?auto_761996 ?auto_762000 ) ) ( not ( = ?auto_761996 ?auto_762001 ) ) ( not ( = ?auto_761996 ?auto_762002 ) ) ( not ( = ?auto_761996 ?auto_762003 ) ) ( not ( = ?auto_761996 ?auto_762004 ) ) ( not ( = ?auto_761996 ?auto_762005 ) ) ( not ( = ?auto_761996 ?auto_762006 ) ) ( not ( = ?auto_761996 ?auto_762007 ) ) ( not ( = ?auto_761996 ?auto_762008 ) ) ( not ( = ?auto_761997 ?auto_761998 ) ) ( not ( = ?auto_761997 ?auto_761999 ) ) ( not ( = ?auto_761997 ?auto_762000 ) ) ( not ( = ?auto_761997 ?auto_762001 ) ) ( not ( = ?auto_761997 ?auto_762002 ) ) ( not ( = ?auto_761997 ?auto_762003 ) ) ( not ( = ?auto_761997 ?auto_762004 ) ) ( not ( = ?auto_761997 ?auto_762005 ) ) ( not ( = ?auto_761997 ?auto_762006 ) ) ( not ( = ?auto_761997 ?auto_762007 ) ) ( not ( = ?auto_761997 ?auto_762008 ) ) ( not ( = ?auto_761998 ?auto_761999 ) ) ( not ( = ?auto_761998 ?auto_762000 ) ) ( not ( = ?auto_761998 ?auto_762001 ) ) ( not ( = ?auto_761998 ?auto_762002 ) ) ( not ( = ?auto_761998 ?auto_762003 ) ) ( not ( = ?auto_761998 ?auto_762004 ) ) ( not ( = ?auto_761998 ?auto_762005 ) ) ( not ( = ?auto_761998 ?auto_762006 ) ) ( not ( = ?auto_761998 ?auto_762007 ) ) ( not ( = ?auto_761998 ?auto_762008 ) ) ( not ( = ?auto_761999 ?auto_762000 ) ) ( not ( = ?auto_761999 ?auto_762001 ) ) ( not ( = ?auto_761999 ?auto_762002 ) ) ( not ( = ?auto_761999 ?auto_762003 ) ) ( not ( = ?auto_761999 ?auto_762004 ) ) ( not ( = ?auto_761999 ?auto_762005 ) ) ( not ( = ?auto_761999 ?auto_762006 ) ) ( not ( = ?auto_761999 ?auto_762007 ) ) ( not ( = ?auto_761999 ?auto_762008 ) ) ( not ( = ?auto_762000 ?auto_762001 ) ) ( not ( = ?auto_762000 ?auto_762002 ) ) ( not ( = ?auto_762000 ?auto_762003 ) ) ( not ( = ?auto_762000 ?auto_762004 ) ) ( not ( = ?auto_762000 ?auto_762005 ) ) ( not ( = ?auto_762000 ?auto_762006 ) ) ( not ( = ?auto_762000 ?auto_762007 ) ) ( not ( = ?auto_762000 ?auto_762008 ) ) ( not ( = ?auto_762001 ?auto_762002 ) ) ( not ( = ?auto_762001 ?auto_762003 ) ) ( not ( = ?auto_762001 ?auto_762004 ) ) ( not ( = ?auto_762001 ?auto_762005 ) ) ( not ( = ?auto_762001 ?auto_762006 ) ) ( not ( = ?auto_762001 ?auto_762007 ) ) ( not ( = ?auto_762001 ?auto_762008 ) ) ( not ( = ?auto_762002 ?auto_762003 ) ) ( not ( = ?auto_762002 ?auto_762004 ) ) ( not ( = ?auto_762002 ?auto_762005 ) ) ( not ( = ?auto_762002 ?auto_762006 ) ) ( not ( = ?auto_762002 ?auto_762007 ) ) ( not ( = ?auto_762002 ?auto_762008 ) ) ( not ( = ?auto_762003 ?auto_762004 ) ) ( not ( = ?auto_762003 ?auto_762005 ) ) ( not ( = ?auto_762003 ?auto_762006 ) ) ( not ( = ?auto_762003 ?auto_762007 ) ) ( not ( = ?auto_762003 ?auto_762008 ) ) ( not ( = ?auto_762004 ?auto_762005 ) ) ( not ( = ?auto_762004 ?auto_762006 ) ) ( not ( = ?auto_762004 ?auto_762007 ) ) ( not ( = ?auto_762004 ?auto_762008 ) ) ( not ( = ?auto_762005 ?auto_762006 ) ) ( not ( = ?auto_762005 ?auto_762007 ) ) ( not ( = ?auto_762005 ?auto_762008 ) ) ( not ( = ?auto_762006 ?auto_762007 ) ) ( not ( = ?auto_762006 ?auto_762008 ) ) ( not ( = ?auto_762007 ?auto_762008 ) ) ( ON ?auto_762006 ?auto_762007 ) ( ON ?auto_762005 ?auto_762006 ) ( ON ?auto_762004 ?auto_762005 ) ( ON ?auto_762003 ?auto_762004 ) ( ON ?auto_762002 ?auto_762003 ) ( ON ?auto_762001 ?auto_762002 ) ( CLEAR ?auto_761999 ) ( ON ?auto_762000 ?auto_762001 ) ( CLEAR ?auto_762000 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_761993 ?auto_761994 ?auto_761995 ?auto_761996 ?auto_761997 ?auto_761998 ?auto_761999 ?auto_762000 )
      ( MAKE-15PILE ?auto_761993 ?auto_761994 ?auto_761995 ?auto_761996 ?auto_761997 ?auto_761998 ?auto_761999 ?auto_762000 ?auto_762001 ?auto_762002 ?auto_762003 ?auto_762004 ?auto_762005 ?auto_762006 ?auto_762007 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_762055 - BLOCK
      ?auto_762056 - BLOCK
      ?auto_762057 - BLOCK
      ?auto_762058 - BLOCK
      ?auto_762059 - BLOCK
      ?auto_762060 - BLOCK
      ?auto_762061 - BLOCK
      ?auto_762062 - BLOCK
      ?auto_762063 - BLOCK
      ?auto_762064 - BLOCK
      ?auto_762065 - BLOCK
      ?auto_762066 - BLOCK
      ?auto_762067 - BLOCK
      ?auto_762068 - BLOCK
      ?auto_762069 - BLOCK
    )
    :vars
    (
      ?auto_762070 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_762069 ?auto_762070 ) ( ON-TABLE ?auto_762055 ) ( ON ?auto_762056 ?auto_762055 ) ( ON ?auto_762057 ?auto_762056 ) ( ON ?auto_762058 ?auto_762057 ) ( ON ?auto_762059 ?auto_762058 ) ( ON ?auto_762060 ?auto_762059 ) ( not ( = ?auto_762055 ?auto_762056 ) ) ( not ( = ?auto_762055 ?auto_762057 ) ) ( not ( = ?auto_762055 ?auto_762058 ) ) ( not ( = ?auto_762055 ?auto_762059 ) ) ( not ( = ?auto_762055 ?auto_762060 ) ) ( not ( = ?auto_762055 ?auto_762061 ) ) ( not ( = ?auto_762055 ?auto_762062 ) ) ( not ( = ?auto_762055 ?auto_762063 ) ) ( not ( = ?auto_762055 ?auto_762064 ) ) ( not ( = ?auto_762055 ?auto_762065 ) ) ( not ( = ?auto_762055 ?auto_762066 ) ) ( not ( = ?auto_762055 ?auto_762067 ) ) ( not ( = ?auto_762055 ?auto_762068 ) ) ( not ( = ?auto_762055 ?auto_762069 ) ) ( not ( = ?auto_762055 ?auto_762070 ) ) ( not ( = ?auto_762056 ?auto_762057 ) ) ( not ( = ?auto_762056 ?auto_762058 ) ) ( not ( = ?auto_762056 ?auto_762059 ) ) ( not ( = ?auto_762056 ?auto_762060 ) ) ( not ( = ?auto_762056 ?auto_762061 ) ) ( not ( = ?auto_762056 ?auto_762062 ) ) ( not ( = ?auto_762056 ?auto_762063 ) ) ( not ( = ?auto_762056 ?auto_762064 ) ) ( not ( = ?auto_762056 ?auto_762065 ) ) ( not ( = ?auto_762056 ?auto_762066 ) ) ( not ( = ?auto_762056 ?auto_762067 ) ) ( not ( = ?auto_762056 ?auto_762068 ) ) ( not ( = ?auto_762056 ?auto_762069 ) ) ( not ( = ?auto_762056 ?auto_762070 ) ) ( not ( = ?auto_762057 ?auto_762058 ) ) ( not ( = ?auto_762057 ?auto_762059 ) ) ( not ( = ?auto_762057 ?auto_762060 ) ) ( not ( = ?auto_762057 ?auto_762061 ) ) ( not ( = ?auto_762057 ?auto_762062 ) ) ( not ( = ?auto_762057 ?auto_762063 ) ) ( not ( = ?auto_762057 ?auto_762064 ) ) ( not ( = ?auto_762057 ?auto_762065 ) ) ( not ( = ?auto_762057 ?auto_762066 ) ) ( not ( = ?auto_762057 ?auto_762067 ) ) ( not ( = ?auto_762057 ?auto_762068 ) ) ( not ( = ?auto_762057 ?auto_762069 ) ) ( not ( = ?auto_762057 ?auto_762070 ) ) ( not ( = ?auto_762058 ?auto_762059 ) ) ( not ( = ?auto_762058 ?auto_762060 ) ) ( not ( = ?auto_762058 ?auto_762061 ) ) ( not ( = ?auto_762058 ?auto_762062 ) ) ( not ( = ?auto_762058 ?auto_762063 ) ) ( not ( = ?auto_762058 ?auto_762064 ) ) ( not ( = ?auto_762058 ?auto_762065 ) ) ( not ( = ?auto_762058 ?auto_762066 ) ) ( not ( = ?auto_762058 ?auto_762067 ) ) ( not ( = ?auto_762058 ?auto_762068 ) ) ( not ( = ?auto_762058 ?auto_762069 ) ) ( not ( = ?auto_762058 ?auto_762070 ) ) ( not ( = ?auto_762059 ?auto_762060 ) ) ( not ( = ?auto_762059 ?auto_762061 ) ) ( not ( = ?auto_762059 ?auto_762062 ) ) ( not ( = ?auto_762059 ?auto_762063 ) ) ( not ( = ?auto_762059 ?auto_762064 ) ) ( not ( = ?auto_762059 ?auto_762065 ) ) ( not ( = ?auto_762059 ?auto_762066 ) ) ( not ( = ?auto_762059 ?auto_762067 ) ) ( not ( = ?auto_762059 ?auto_762068 ) ) ( not ( = ?auto_762059 ?auto_762069 ) ) ( not ( = ?auto_762059 ?auto_762070 ) ) ( not ( = ?auto_762060 ?auto_762061 ) ) ( not ( = ?auto_762060 ?auto_762062 ) ) ( not ( = ?auto_762060 ?auto_762063 ) ) ( not ( = ?auto_762060 ?auto_762064 ) ) ( not ( = ?auto_762060 ?auto_762065 ) ) ( not ( = ?auto_762060 ?auto_762066 ) ) ( not ( = ?auto_762060 ?auto_762067 ) ) ( not ( = ?auto_762060 ?auto_762068 ) ) ( not ( = ?auto_762060 ?auto_762069 ) ) ( not ( = ?auto_762060 ?auto_762070 ) ) ( not ( = ?auto_762061 ?auto_762062 ) ) ( not ( = ?auto_762061 ?auto_762063 ) ) ( not ( = ?auto_762061 ?auto_762064 ) ) ( not ( = ?auto_762061 ?auto_762065 ) ) ( not ( = ?auto_762061 ?auto_762066 ) ) ( not ( = ?auto_762061 ?auto_762067 ) ) ( not ( = ?auto_762061 ?auto_762068 ) ) ( not ( = ?auto_762061 ?auto_762069 ) ) ( not ( = ?auto_762061 ?auto_762070 ) ) ( not ( = ?auto_762062 ?auto_762063 ) ) ( not ( = ?auto_762062 ?auto_762064 ) ) ( not ( = ?auto_762062 ?auto_762065 ) ) ( not ( = ?auto_762062 ?auto_762066 ) ) ( not ( = ?auto_762062 ?auto_762067 ) ) ( not ( = ?auto_762062 ?auto_762068 ) ) ( not ( = ?auto_762062 ?auto_762069 ) ) ( not ( = ?auto_762062 ?auto_762070 ) ) ( not ( = ?auto_762063 ?auto_762064 ) ) ( not ( = ?auto_762063 ?auto_762065 ) ) ( not ( = ?auto_762063 ?auto_762066 ) ) ( not ( = ?auto_762063 ?auto_762067 ) ) ( not ( = ?auto_762063 ?auto_762068 ) ) ( not ( = ?auto_762063 ?auto_762069 ) ) ( not ( = ?auto_762063 ?auto_762070 ) ) ( not ( = ?auto_762064 ?auto_762065 ) ) ( not ( = ?auto_762064 ?auto_762066 ) ) ( not ( = ?auto_762064 ?auto_762067 ) ) ( not ( = ?auto_762064 ?auto_762068 ) ) ( not ( = ?auto_762064 ?auto_762069 ) ) ( not ( = ?auto_762064 ?auto_762070 ) ) ( not ( = ?auto_762065 ?auto_762066 ) ) ( not ( = ?auto_762065 ?auto_762067 ) ) ( not ( = ?auto_762065 ?auto_762068 ) ) ( not ( = ?auto_762065 ?auto_762069 ) ) ( not ( = ?auto_762065 ?auto_762070 ) ) ( not ( = ?auto_762066 ?auto_762067 ) ) ( not ( = ?auto_762066 ?auto_762068 ) ) ( not ( = ?auto_762066 ?auto_762069 ) ) ( not ( = ?auto_762066 ?auto_762070 ) ) ( not ( = ?auto_762067 ?auto_762068 ) ) ( not ( = ?auto_762067 ?auto_762069 ) ) ( not ( = ?auto_762067 ?auto_762070 ) ) ( not ( = ?auto_762068 ?auto_762069 ) ) ( not ( = ?auto_762068 ?auto_762070 ) ) ( not ( = ?auto_762069 ?auto_762070 ) ) ( ON ?auto_762068 ?auto_762069 ) ( ON ?auto_762067 ?auto_762068 ) ( ON ?auto_762066 ?auto_762067 ) ( ON ?auto_762065 ?auto_762066 ) ( ON ?auto_762064 ?auto_762065 ) ( ON ?auto_762063 ?auto_762064 ) ( ON ?auto_762062 ?auto_762063 ) ( CLEAR ?auto_762060 ) ( ON ?auto_762061 ?auto_762062 ) ( CLEAR ?auto_762061 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_762055 ?auto_762056 ?auto_762057 ?auto_762058 ?auto_762059 ?auto_762060 ?auto_762061 )
      ( MAKE-15PILE ?auto_762055 ?auto_762056 ?auto_762057 ?auto_762058 ?auto_762059 ?auto_762060 ?auto_762061 ?auto_762062 ?auto_762063 ?auto_762064 ?auto_762065 ?auto_762066 ?auto_762067 ?auto_762068 ?auto_762069 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_762117 - BLOCK
      ?auto_762118 - BLOCK
      ?auto_762119 - BLOCK
      ?auto_762120 - BLOCK
      ?auto_762121 - BLOCK
      ?auto_762122 - BLOCK
      ?auto_762123 - BLOCK
      ?auto_762124 - BLOCK
      ?auto_762125 - BLOCK
      ?auto_762126 - BLOCK
      ?auto_762127 - BLOCK
      ?auto_762128 - BLOCK
      ?auto_762129 - BLOCK
      ?auto_762130 - BLOCK
      ?auto_762131 - BLOCK
    )
    :vars
    (
      ?auto_762132 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_762131 ?auto_762132 ) ( ON-TABLE ?auto_762117 ) ( ON ?auto_762118 ?auto_762117 ) ( ON ?auto_762119 ?auto_762118 ) ( ON ?auto_762120 ?auto_762119 ) ( ON ?auto_762121 ?auto_762120 ) ( not ( = ?auto_762117 ?auto_762118 ) ) ( not ( = ?auto_762117 ?auto_762119 ) ) ( not ( = ?auto_762117 ?auto_762120 ) ) ( not ( = ?auto_762117 ?auto_762121 ) ) ( not ( = ?auto_762117 ?auto_762122 ) ) ( not ( = ?auto_762117 ?auto_762123 ) ) ( not ( = ?auto_762117 ?auto_762124 ) ) ( not ( = ?auto_762117 ?auto_762125 ) ) ( not ( = ?auto_762117 ?auto_762126 ) ) ( not ( = ?auto_762117 ?auto_762127 ) ) ( not ( = ?auto_762117 ?auto_762128 ) ) ( not ( = ?auto_762117 ?auto_762129 ) ) ( not ( = ?auto_762117 ?auto_762130 ) ) ( not ( = ?auto_762117 ?auto_762131 ) ) ( not ( = ?auto_762117 ?auto_762132 ) ) ( not ( = ?auto_762118 ?auto_762119 ) ) ( not ( = ?auto_762118 ?auto_762120 ) ) ( not ( = ?auto_762118 ?auto_762121 ) ) ( not ( = ?auto_762118 ?auto_762122 ) ) ( not ( = ?auto_762118 ?auto_762123 ) ) ( not ( = ?auto_762118 ?auto_762124 ) ) ( not ( = ?auto_762118 ?auto_762125 ) ) ( not ( = ?auto_762118 ?auto_762126 ) ) ( not ( = ?auto_762118 ?auto_762127 ) ) ( not ( = ?auto_762118 ?auto_762128 ) ) ( not ( = ?auto_762118 ?auto_762129 ) ) ( not ( = ?auto_762118 ?auto_762130 ) ) ( not ( = ?auto_762118 ?auto_762131 ) ) ( not ( = ?auto_762118 ?auto_762132 ) ) ( not ( = ?auto_762119 ?auto_762120 ) ) ( not ( = ?auto_762119 ?auto_762121 ) ) ( not ( = ?auto_762119 ?auto_762122 ) ) ( not ( = ?auto_762119 ?auto_762123 ) ) ( not ( = ?auto_762119 ?auto_762124 ) ) ( not ( = ?auto_762119 ?auto_762125 ) ) ( not ( = ?auto_762119 ?auto_762126 ) ) ( not ( = ?auto_762119 ?auto_762127 ) ) ( not ( = ?auto_762119 ?auto_762128 ) ) ( not ( = ?auto_762119 ?auto_762129 ) ) ( not ( = ?auto_762119 ?auto_762130 ) ) ( not ( = ?auto_762119 ?auto_762131 ) ) ( not ( = ?auto_762119 ?auto_762132 ) ) ( not ( = ?auto_762120 ?auto_762121 ) ) ( not ( = ?auto_762120 ?auto_762122 ) ) ( not ( = ?auto_762120 ?auto_762123 ) ) ( not ( = ?auto_762120 ?auto_762124 ) ) ( not ( = ?auto_762120 ?auto_762125 ) ) ( not ( = ?auto_762120 ?auto_762126 ) ) ( not ( = ?auto_762120 ?auto_762127 ) ) ( not ( = ?auto_762120 ?auto_762128 ) ) ( not ( = ?auto_762120 ?auto_762129 ) ) ( not ( = ?auto_762120 ?auto_762130 ) ) ( not ( = ?auto_762120 ?auto_762131 ) ) ( not ( = ?auto_762120 ?auto_762132 ) ) ( not ( = ?auto_762121 ?auto_762122 ) ) ( not ( = ?auto_762121 ?auto_762123 ) ) ( not ( = ?auto_762121 ?auto_762124 ) ) ( not ( = ?auto_762121 ?auto_762125 ) ) ( not ( = ?auto_762121 ?auto_762126 ) ) ( not ( = ?auto_762121 ?auto_762127 ) ) ( not ( = ?auto_762121 ?auto_762128 ) ) ( not ( = ?auto_762121 ?auto_762129 ) ) ( not ( = ?auto_762121 ?auto_762130 ) ) ( not ( = ?auto_762121 ?auto_762131 ) ) ( not ( = ?auto_762121 ?auto_762132 ) ) ( not ( = ?auto_762122 ?auto_762123 ) ) ( not ( = ?auto_762122 ?auto_762124 ) ) ( not ( = ?auto_762122 ?auto_762125 ) ) ( not ( = ?auto_762122 ?auto_762126 ) ) ( not ( = ?auto_762122 ?auto_762127 ) ) ( not ( = ?auto_762122 ?auto_762128 ) ) ( not ( = ?auto_762122 ?auto_762129 ) ) ( not ( = ?auto_762122 ?auto_762130 ) ) ( not ( = ?auto_762122 ?auto_762131 ) ) ( not ( = ?auto_762122 ?auto_762132 ) ) ( not ( = ?auto_762123 ?auto_762124 ) ) ( not ( = ?auto_762123 ?auto_762125 ) ) ( not ( = ?auto_762123 ?auto_762126 ) ) ( not ( = ?auto_762123 ?auto_762127 ) ) ( not ( = ?auto_762123 ?auto_762128 ) ) ( not ( = ?auto_762123 ?auto_762129 ) ) ( not ( = ?auto_762123 ?auto_762130 ) ) ( not ( = ?auto_762123 ?auto_762131 ) ) ( not ( = ?auto_762123 ?auto_762132 ) ) ( not ( = ?auto_762124 ?auto_762125 ) ) ( not ( = ?auto_762124 ?auto_762126 ) ) ( not ( = ?auto_762124 ?auto_762127 ) ) ( not ( = ?auto_762124 ?auto_762128 ) ) ( not ( = ?auto_762124 ?auto_762129 ) ) ( not ( = ?auto_762124 ?auto_762130 ) ) ( not ( = ?auto_762124 ?auto_762131 ) ) ( not ( = ?auto_762124 ?auto_762132 ) ) ( not ( = ?auto_762125 ?auto_762126 ) ) ( not ( = ?auto_762125 ?auto_762127 ) ) ( not ( = ?auto_762125 ?auto_762128 ) ) ( not ( = ?auto_762125 ?auto_762129 ) ) ( not ( = ?auto_762125 ?auto_762130 ) ) ( not ( = ?auto_762125 ?auto_762131 ) ) ( not ( = ?auto_762125 ?auto_762132 ) ) ( not ( = ?auto_762126 ?auto_762127 ) ) ( not ( = ?auto_762126 ?auto_762128 ) ) ( not ( = ?auto_762126 ?auto_762129 ) ) ( not ( = ?auto_762126 ?auto_762130 ) ) ( not ( = ?auto_762126 ?auto_762131 ) ) ( not ( = ?auto_762126 ?auto_762132 ) ) ( not ( = ?auto_762127 ?auto_762128 ) ) ( not ( = ?auto_762127 ?auto_762129 ) ) ( not ( = ?auto_762127 ?auto_762130 ) ) ( not ( = ?auto_762127 ?auto_762131 ) ) ( not ( = ?auto_762127 ?auto_762132 ) ) ( not ( = ?auto_762128 ?auto_762129 ) ) ( not ( = ?auto_762128 ?auto_762130 ) ) ( not ( = ?auto_762128 ?auto_762131 ) ) ( not ( = ?auto_762128 ?auto_762132 ) ) ( not ( = ?auto_762129 ?auto_762130 ) ) ( not ( = ?auto_762129 ?auto_762131 ) ) ( not ( = ?auto_762129 ?auto_762132 ) ) ( not ( = ?auto_762130 ?auto_762131 ) ) ( not ( = ?auto_762130 ?auto_762132 ) ) ( not ( = ?auto_762131 ?auto_762132 ) ) ( ON ?auto_762130 ?auto_762131 ) ( ON ?auto_762129 ?auto_762130 ) ( ON ?auto_762128 ?auto_762129 ) ( ON ?auto_762127 ?auto_762128 ) ( ON ?auto_762126 ?auto_762127 ) ( ON ?auto_762125 ?auto_762126 ) ( ON ?auto_762124 ?auto_762125 ) ( ON ?auto_762123 ?auto_762124 ) ( CLEAR ?auto_762121 ) ( ON ?auto_762122 ?auto_762123 ) ( CLEAR ?auto_762122 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_762117 ?auto_762118 ?auto_762119 ?auto_762120 ?auto_762121 ?auto_762122 )
      ( MAKE-15PILE ?auto_762117 ?auto_762118 ?auto_762119 ?auto_762120 ?auto_762121 ?auto_762122 ?auto_762123 ?auto_762124 ?auto_762125 ?auto_762126 ?auto_762127 ?auto_762128 ?auto_762129 ?auto_762130 ?auto_762131 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_762179 - BLOCK
      ?auto_762180 - BLOCK
      ?auto_762181 - BLOCK
      ?auto_762182 - BLOCK
      ?auto_762183 - BLOCK
      ?auto_762184 - BLOCK
      ?auto_762185 - BLOCK
      ?auto_762186 - BLOCK
      ?auto_762187 - BLOCK
      ?auto_762188 - BLOCK
      ?auto_762189 - BLOCK
      ?auto_762190 - BLOCK
      ?auto_762191 - BLOCK
      ?auto_762192 - BLOCK
      ?auto_762193 - BLOCK
    )
    :vars
    (
      ?auto_762194 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_762193 ?auto_762194 ) ( ON-TABLE ?auto_762179 ) ( ON ?auto_762180 ?auto_762179 ) ( ON ?auto_762181 ?auto_762180 ) ( ON ?auto_762182 ?auto_762181 ) ( not ( = ?auto_762179 ?auto_762180 ) ) ( not ( = ?auto_762179 ?auto_762181 ) ) ( not ( = ?auto_762179 ?auto_762182 ) ) ( not ( = ?auto_762179 ?auto_762183 ) ) ( not ( = ?auto_762179 ?auto_762184 ) ) ( not ( = ?auto_762179 ?auto_762185 ) ) ( not ( = ?auto_762179 ?auto_762186 ) ) ( not ( = ?auto_762179 ?auto_762187 ) ) ( not ( = ?auto_762179 ?auto_762188 ) ) ( not ( = ?auto_762179 ?auto_762189 ) ) ( not ( = ?auto_762179 ?auto_762190 ) ) ( not ( = ?auto_762179 ?auto_762191 ) ) ( not ( = ?auto_762179 ?auto_762192 ) ) ( not ( = ?auto_762179 ?auto_762193 ) ) ( not ( = ?auto_762179 ?auto_762194 ) ) ( not ( = ?auto_762180 ?auto_762181 ) ) ( not ( = ?auto_762180 ?auto_762182 ) ) ( not ( = ?auto_762180 ?auto_762183 ) ) ( not ( = ?auto_762180 ?auto_762184 ) ) ( not ( = ?auto_762180 ?auto_762185 ) ) ( not ( = ?auto_762180 ?auto_762186 ) ) ( not ( = ?auto_762180 ?auto_762187 ) ) ( not ( = ?auto_762180 ?auto_762188 ) ) ( not ( = ?auto_762180 ?auto_762189 ) ) ( not ( = ?auto_762180 ?auto_762190 ) ) ( not ( = ?auto_762180 ?auto_762191 ) ) ( not ( = ?auto_762180 ?auto_762192 ) ) ( not ( = ?auto_762180 ?auto_762193 ) ) ( not ( = ?auto_762180 ?auto_762194 ) ) ( not ( = ?auto_762181 ?auto_762182 ) ) ( not ( = ?auto_762181 ?auto_762183 ) ) ( not ( = ?auto_762181 ?auto_762184 ) ) ( not ( = ?auto_762181 ?auto_762185 ) ) ( not ( = ?auto_762181 ?auto_762186 ) ) ( not ( = ?auto_762181 ?auto_762187 ) ) ( not ( = ?auto_762181 ?auto_762188 ) ) ( not ( = ?auto_762181 ?auto_762189 ) ) ( not ( = ?auto_762181 ?auto_762190 ) ) ( not ( = ?auto_762181 ?auto_762191 ) ) ( not ( = ?auto_762181 ?auto_762192 ) ) ( not ( = ?auto_762181 ?auto_762193 ) ) ( not ( = ?auto_762181 ?auto_762194 ) ) ( not ( = ?auto_762182 ?auto_762183 ) ) ( not ( = ?auto_762182 ?auto_762184 ) ) ( not ( = ?auto_762182 ?auto_762185 ) ) ( not ( = ?auto_762182 ?auto_762186 ) ) ( not ( = ?auto_762182 ?auto_762187 ) ) ( not ( = ?auto_762182 ?auto_762188 ) ) ( not ( = ?auto_762182 ?auto_762189 ) ) ( not ( = ?auto_762182 ?auto_762190 ) ) ( not ( = ?auto_762182 ?auto_762191 ) ) ( not ( = ?auto_762182 ?auto_762192 ) ) ( not ( = ?auto_762182 ?auto_762193 ) ) ( not ( = ?auto_762182 ?auto_762194 ) ) ( not ( = ?auto_762183 ?auto_762184 ) ) ( not ( = ?auto_762183 ?auto_762185 ) ) ( not ( = ?auto_762183 ?auto_762186 ) ) ( not ( = ?auto_762183 ?auto_762187 ) ) ( not ( = ?auto_762183 ?auto_762188 ) ) ( not ( = ?auto_762183 ?auto_762189 ) ) ( not ( = ?auto_762183 ?auto_762190 ) ) ( not ( = ?auto_762183 ?auto_762191 ) ) ( not ( = ?auto_762183 ?auto_762192 ) ) ( not ( = ?auto_762183 ?auto_762193 ) ) ( not ( = ?auto_762183 ?auto_762194 ) ) ( not ( = ?auto_762184 ?auto_762185 ) ) ( not ( = ?auto_762184 ?auto_762186 ) ) ( not ( = ?auto_762184 ?auto_762187 ) ) ( not ( = ?auto_762184 ?auto_762188 ) ) ( not ( = ?auto_762184 ?auto_762189 ) ) ( not ( = ?auto_762184 ?auto_762190 ) ) ( not ( = ?auto_762184 ?auto_762191 ) ) ( not ( = ?auto_762184 ?auto_762192 ) ) ( not ( = ?auto_762184 ?auto_762193 ) ) ( not ( = ?auto_762184 ?auto_762194 ) ) ( not ( = ?auto_762185 ?auto_762186 ) ) ( not ( = ?auto_762185 ?auto_762187 ) ) ( not ( = ?auto_762185 ?auto_762188 ) ) ( not ( = ?auto_762185 ?auto_762189 ) ) ( not ( = ?auto_762185 ?auto_762190 ) ) ( not ( = ?auto_762185 ?auto_762191 ) ) ( not ( = ?auto_762185 ?auto_762192 ) ) ( not ( = ?auto_762185 ?auto_762193 ) ) ( not ( = ?auto_762185 ?auto_762194 ) ) ( not ( = ?auto_762186 ?auto_762187 ) ) ( not ( = ?auto_762186 ?auto_762188 ) ) ( not ( = ?auto_762186 ?auto_762189 ) ) ( not ( = ?auto_762186 ?auto_762190 ) ) ( not ( = ?auto_762186 ?auto_762191 ) ) ( not ( = ?auto_762186 ?auto_762192 ) ) ( not ( = ?auto_762186 ?auto_762193 ) ) ( not ( = ?auto_762186 ?auto_762194 ) ) ( not ( = ?auto_762187 ?auto_762188 ) ) ( not ( = ?auto_762187 ?auto_762189 ) ) ( not ( = ?auto_762187 ?auto_762190 ) ) ( not ( = ?auto_762187 ?auto_762191 ) ) ( not ( = ?auto_762187 ?auto_762192 ) ) ( not ( = ?auto_762187 ?auto_762193 ) ) ( not ( = ?auto_762187 ?auto_762194 ) ) ( not ( = ?auto_762188 ?auto_762189 ) ) ( not ( = ?auto_762188 ?auto_762190 ) ) ( not ( = ?auto_762188 ?auto_762191 ) ) ( not ( = ?auto_762188 ?auto_762192 ) ) ( not ( = ?auto_762188 ?auto_762193 ) ) ( not ( = ?auto_762188 ?auto_762194 ) ) ( not ( = ?auto_762189 ?auto_762190 ) ) ( not ( = ?auto_762189 ?auto_762191 ) ) ( not ( = ?auto_762189 ?auto_762192 ) ) ( not ( = ?auto_762189 ?auto_762193 ) ) ( not ( = ?auto_762189 ?auto_762194 ) ) ( not ( = ?auto_762190 ?auto_762191 ) ) ( not ( = ?auto_762190 ?auto_762192 ) ) ( not ( = ?auto_762190 ?auto_762193 ) ) ( not ( = ?auto_762190 ?auto_762194 ) ) ( not ( = ?auto_762191 ?auto_762192 ) ) ( not ( = ?auto_762191 ?auto_762193 ) ) ( not ( = ?auto_762191 ?auto_762194 ) ) ( not ( = ?auto_762192 ?auto_762193 ) ) ( not ( = ?auto_762192 ?auto_762194 ) ) ( not ( = ?auto_762193 ?auto_762194 ) ) ( ON ?auto_762192 ?auto_762193 ) ( ON ?auto_762191 ?auto_762192 ) ( ON ?auto_762190 ?auto_762191 ) ( ON ?auto_762189 ?auto_762190 ) ( ON ?auto_762188 ?auto_762189 ) ( ON ?auto_762187 ?auto_762188 ) ( ON ?auto_762186 ?auto_762187 ) ( ON ?auto_762185 ?auto_762186 ) ( ON ?auto_762184 ?auto_762185 ) ( CLEAR ?auto_762182 ) ( ON ?auto_762183 ?auto_762184 ) ( CLEAR ?auto_762183 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_762179 ?auto_762180 ?auto_762181 ?auto_762182 ?auto_762183 )
      ( MAKE-15PILE ?auto_762179 ?auto_762180 ?auto_762181 ?auto_762182 ?auto_762183 ?auto_762184 ?auto_762185 ?auto_762186 ?auto_762187 ?auto_762188 ?auto_762189 ?auto_762190 ?auto_762191 ?auto_762192 ?auto_762193 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_762241 - BLOCK
      ?auto_762242 - BLOCK
      ?auto_762243 - BLOCK
      ?auto_762244 - BLOCK
      ?auto_762245 - BLOCK
      ?auto_762246 - BLOCK
      ?auto_762247 - BLOCK
      ?auto_762248 - BLOCK
      ?auto_762249 - BLOCK
      ?auto_762250 - BLOCK
      ?auto_762251 - BLOCK
      ?auto_762252 - BLOCK
      ?auto_762253 - BLOCK
      ?auto_762254 - BLOCK
      ?auto_762255 - BLOCK
    )
    :vars
    (
      ?auto_762256 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_762255 ?auto_762256 ) ( ON-TABLE ?auto_762241 ) ( ON ?auto_762242 ?auto_762241 ) ( ON ?auto_762243 ?auto_762242 ) ( not ( = ?auto_762241 ?auto_762242 ) ) ( not ( = ?auto_762241 ?auto_762243 ) ) ( not ( = ?auto_762241 ?auto_762244 ) ) ( not ( = ?auto_762241 ?auto_762245 ) ) ( not ( = ?auto_762241 ?auto_762246 ) ) ( not ( = ?auto_762241 ?auto_762247 ) ) ( not ( = ?auto_762241 ?auto_762248 ) ) ( not ( = ?auto_762241 ?auto_762249 ) ) ( not ( = ?auto_762241 ?auto_762250 ) ) ( not ( = ?auto_762241 ?auto_762251 ) ) ( not ( = ?auto_762241 ?auto_762252 ) ) ( not ( = ?auto_762241 ?auto_762253 ) ) ( not ( = ?auto_762241 ?auto_762254 ) ) ( not ( = ?auto_762241 ?auto_762255 ) ) ( not ( = ?auto_762241 ?auto_762256 ) ) ( not ( = ?auto_762242 ?auto_762243 ) ) ( not ( = ?auto_762242 ?auto_762244 ) ) ( not ( = ?auto_762242 ?auto_762245 ) ) ( not ( = ?auto_762242 ?auto_762246 ) ) ( not ( = ?auto_762242 ?auto_762247 ) ) ( not ( = ?auto_762242 ?auto_762248 ) ) ( not ( = ?auto_762242 ?auto_762249 ) ) ( not ( = ?auto_762242 ?auto_762250 ) ) ( not ( = ?auto_762242 ?auto_762251 ) ) ( not ( = ?auto_762242 ?auto_762252 ) ) ( not ( = ?auto_762242 ?auto_762253 ) ) ( not ( = ?auto_762242 ?auto_762254 ) ) ( not ( = ?auto_762242 ?auto_762255 ) ) ( not ( = ?auto_762242 ?auto_762256 ) ) ( not ( = ?auto_762243 ?auto_762244 ) ) ( not ( = ?auto_762243 ?auto_762245 ) ) ( not ( = ?auto_762243 ?auto_762246 ) ) ( not ( = ?auto_762243 ?auto_762247 ) ) ( not ( = ?auto_762243 ?auto_762248 ) ) ( not ( = ?auto_762243 ?auto_762249 ) ) ( not ( = ?auto_762243 ?auto_762250 ) ) ( not ( = ?auto_762243 ?auto_762251 ) ) ( not ( = ?auto_762243 ?auto_762252 ) ) ( not ( = ?auto_762243 ?auto_762253 ) ) ( not ( = ?auto_762243 ?auto_762254 ) ) ( not ( = ?auto_762243 ?auto_762255 ) ) ( not ( = ?auto_762243 ?auto_762256 ) ) ( not ( = ?auto_762244 ?auto_762245 ) ) ( not ( = ?auto_762244 ?auto_762246 ) ) ( not ( = ?auto_762244 ?auto_762247 ) ) ( not ( = ?auto_762244 ?auto_762248 ) ) ( not ( = ?auto_762244 ?auto_762249 ) ) ( not ( = ?auto_762244 ?auto_762250 ) ) ( not ( = ?auto_762244 ?auto_762251 ) ) ( not ( = ?auto_762244 ?auto_762252 ) ) ( not ( = ?auto_762244 ?auto_762253 ) ) ( not ( = ?auto_762244 ?auto_762254 ) ) ( not ( = ?auto_762244 ?auto_762255 ) ) ( not ( = ?auto_762244 ?auto_762256 ) ) ( not ( = ?auto_762245 ?auto_762246 ) ) ( not ( = ?auto_762245 ?auto_762247 ) ) ( not ( = ?auto_762245 ?auto_762248 ) ) ( not ( = ?auto_762245 ?auto_762249 ) ) ( not ( = ?auto_762245 ?auto_762250 ) ) ( not ( = ?auto_762245 ?auto_762251 ) ) ( not ( = ?auto_762245 ?auto_762252 ) ) ( not ( = ?auto_762245 ?auto_762253 ) ) ( not ( = ?auto_762245 ?auto_762254 ) ) ( not ( = ?auto_762245 ?auto_762255 ) ) ( not ( = ?auto_762245 ?auto_762256 ) ) ( not ( = ?auto_762246 ?auto_762247 ) ) ( not ( = ?auto_762246 ?auto_762248 ) ) ( not ( = ?auto_762246 ?auto_762249 ) ) ( not ( = ?auto_762246 ?auto_762250 ) ) ( not ( = ?auto_762246 ?auto_762251 ) ) ( not ( = ?auto_762246 ?auto_762252 ) ) ( not ( = ?auto_762246 ?auto_762253 ) ) ( not ( = ?auto_762246 ?auto_762254 ) ) ( not ( = ?auto_762246 ?auto_762255 ) ) ( not ( = ?auto_762246 ?auto_762256 ) ) ( not ( = ?auto_762247 ?auto_762248 ) ) ( not ( = ?auto_762247 ?auto_762249 ) ) ( not ( = ?auto_762247 ?auto_762250 ) ) ( not ( = ?auto_762247 ?auto_762251 ) ) ( not ( = ?auto_762247 ?auto_762252 ) ) ( not ( = ?auto_762247 ?auto_762253 ) ) ( not ( = ?auto_762247 ?auto_762254 ) ) ( not ( = ?auto_762247 ?auto_762255 ) ) ( not ( = ?auto_762247 ?auto_762256 ) ) ( not ( = ?auto_762248 ?auto_762249 ) ) ( not ( = ?auto_762248 ?auto_762250 ) ) ( not ( = ?auto_762248 ?auto_762251 ) ) ( not ( = ?auto_762248 ?auto_762252 ) ) ( not ( = ?auto_762248 ?auto_762253 ) ) ( not ( = ?auto_762248 ?auto_762254 ) ) ( not ( = ?auto_762248 ?auto_762255 ) ) ( not ( = ?auto_762248 ?auto_762256 ) ) ( not ( = ?auto_762249 ?auto_762250 ) ) ( not ( = ?auto_762249 ?auto_762251 ) ) ( not ( = ?auto_762249 ?auto_762252 ) ) ( not ( = ?auto_762249 ?auto_762253 ) ) ( not ( = ?auto_762249 ?auto_762254 ) ) ( not ( = ?auto_762249 ?auto_762255 ) ) ( not ( = ?auto_762249 ?auto_762256 ) ) ( not ( = ?auto_762250 ?auto_762251 ) ) ( not ( = ?auto_762250 ?auto_762252 ) ) ( not ( = ?auto_762250 ?auto_762253 ) ) ( not ( = ?auto_762250 ?auto_762254 ) ) ( not ( = ?auto_762250 ?auto_762255 ) ) ( not ( = ?auto_762250 ?auto_762256 ) ) ( not ( = ?auto_762251 ?auto_762252 ) ) ( not ( = ?auto_762251 ?auto_762253 ) ) ( not ( = ?auto_762251 ?auto_762254 ) ) ( not ( = ?auto_762251 ?auto_762255 ) ) ( not ( = ?auto_762251 ?auto_762256 ) ) ( not ( = ?auto_762252 ?auto_762253 ) ) ( not ( = ?auto_762252 ?auto_762254 ) ) ( not ( = ?auto_762252 ?auto_762255 ) ) ( not ( = ?auto_762252 ?auto_762256 ) ) ( not ( = ?auto_762253 ?auto_762254 ) ) ( not ( = ?auto_762253 ?auto_762255 ) ) ( not ( = ?auto_762253 ?auto_762256 ) ) ( not ( = ?auto_762254 ?auto_762255 ) ) ( not ( = ?auto_762254 ?auto_762256 ) ) ( not ( = ?auto_762255 ?auto_762256 ) ) ( ON ?auto_762254 ?auto_762255 ) ( ON ?auto_762253 ?auto_762254 ) ( ON ?auto_762252 ?auto_762253 ) ( ON ?auto_762251 ?auto_762252 ) ( ON ?auto_762250 ?auto_762251 ) ( ON ?auto_762249 ?auto_762250 ) ( ON ?auto_762248 ?auto_762249 ) ( ON ?auto_762247 ?auto_762248 ) ( ON ?auto_762246 ?auto_762247 ) ( ON ?auto_762245 ?auto_762246 ) ( CLEAR ?auto_762243 ) ( ON ?auto_762244 ?auto_762245 ) ( CLEAR ?auto_762244 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_762241 ?auto_762242 ?auto_762243 ?auto_762244 )
      ( MAKE-15PILE ?auto_762241 ?auto_762242 ?auto_762243 ?auto_762244 ?auto_762245 ?auto_762246 ?auto_762247 ?auto_762248 ?auto_762249 ?auto_762250 ?auto_762251 ?auto_762252 ?auto_762253 ?auto_762254 ?auto_762255 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_762303 - BLOCK
      ?auto_762304 - BLOCK
      ?auto_762305 - BLOCK
      ?auto_762306 - BLOCK
      ?auto_762307 - BLOCK
      ?auto_762308 - BLOCK
      ?auto_762309 - BLOCK
      ?auto_762310 - BLOCK
      ?auto_762311 - BLOCK
      ?auto_762312 - BLOCK
      ?auto_762313 - BLOCK
      ?auto_762314 - BLOCK
      ?auto_762315 - BLOCK
      ?auto_762316 - BLOCK
      ?auto_762317 - BLOCK
    )
    :vars
    (
      ?auto_762318 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_762317 ?auto_762318 ) ( ON-TABLE ?auto_762303 ) ( ON ?auto_762304 ?auto_762303 ) ( not ( = ?auto_762303 ?auto_762304 ) ) ( not ( = ?auto_762303 ?auto_762305 ) ) ( not ( = ?auto_762303 ?auto_762306 ) ) ( not ( = ?auto_762303 ?auto_762307 ) ) ( not ( = ?auto_762303 ?auto_762308 ) ) ( not ( = ?auto_762303 ?auto_762309 ) ) ( not ( = ?auto_762303 ?auto_762310 ) ) ( not ( = ?auto_762303 ?auto_762311 ) ) ( not ( = ?auto_762303 ?auto_762312 ) ) ( not ( = ?auto_762303 ?auto_762313 ) ) ( not ( = ?auto_762303 ?auto_762314 ) ) ( not ( = ?auto_762303 ?auto_762315 ) ) ( not ( = ?auto_762303 ?auto_762316 ) ) ( not ( = ?auto_762303 ?auto_762317 ) ) ( not ( = ?auto_762303 ?auto_762318 ) ) ( not ( = ?auto_762304 ?auto_762305 ) ) ( not ( = ?auto_762304 ?auto_762306 ) ) ( not ( = ?auto_762304 ?auto_762307 ) ) ( not ( = ?auto_762304 ?auto_762308 ) ) ( not ( = ?auto_762304 ?auto_762309 ) ) ( not ( = ?auto_762304 ?auto_762310 ) ) ( not ( = ?auto_762304 ?auto_762311 ) ) ( not ( = ?auto_762304 ?auto_762312 ) ) ( not ( = ?auto_762304 ?auto_762313 ) ) ( not ( = ?auto_762304 ?auto_762314 ) ) ( not ( = ?auto_762304 ?auto_762315 ) ) ( not ( = ?auto_762304 ?auto_762316 ) ) ( not ( = ?auto_762304 ?auto_762317 ) ) ( not ( = ?auto_762304 ?auto_762318 ) ) ( not ( = ?auto_762305 ?auto_762306 ) ) ( not ( = ?auto_762305 ?auto_762307 ) ) ( not ( = ?auto_762305 ?auto_762308 ) ) ( not ( = ?auto_762305 ?auto_762309 ) ) ( not ( = ?auto_762305 ?auto_762310 ) ) ( not ( = ?auto_762305 ?auto_762311 ) ) ( not ( = ?auto_762305 ?auto_762312 ) ) ( not ( = ?auto_762305 ?auto_762313 ) ) ( not ( = ?auto_762305 ?auto_762314 ) ) ( not ( = ?auto_762305 ?auto_762315 ) ) ( not ( = ?auto_762305 ?auto_762316 ) ) ( not ( = ?auto_762305 ?auto_762317 ) ) ( not ( = ?auto_762305 ?auto_762318 ) ) ( not ( = ?auto_762306 ?auto_762307 ) ) ( not ( = ?auto_762306 ?auto_762308 ) ) ( not ( = ?auto_762306 ?auto_762309 ) ) ( not ( = ?auto_762306 ?auto_762310 ) ) ( not ( = ?auto_762306 ?auto_762311 ) ) ( not ( = ?auto_762306 ?auto_762312 ) ) ( not ( = ?auto_762306 ?auto_762313 ) ) ( not ( = ?auto_762306 ?auto_762314 ) ) ( not ( = ?auto_762306 ?auto_762315 ) ) ( not ( = ?auto_762306 ?auto_762316 ) ) ( not ( = ?auto_762306 ?auto_762317 ) ) ( not ( = ?auto_762306 ?auto_762318 ) ) ( not ( = ?auto_762307 ?auto_762308 ) ) ( not ( = ?auto_762307 ?auto_762309 ) ) ( not ( = ?auto_762307 ?auto_762310 ) ) ( not ( = ?auto_762307 ?auto_762311 ) ) ( not ( = ?auto_762307 ?auto_762312 ) ) ( not ( = ?auto_762307 ?auto_762313 ) ) ( not ( = ?auto_762307 ?auto_762314 ) ) ( not ( = ?auto_762307 ?auto_762315 ) ) ( not ( = ?auto_762307 ?auto_762316 ) ) ( not ( = ?auto_762307 ?auto_762317 ) ) ( not ( = ?auto_762307 ?auto_762318 ) ) ( not ( = ?auto_762308 ?auto_762309 ) ) ( not ( = ?auto_762308 ?auto_762310 ) ) ( not ( = ?auto_762308 ?auto_762311 ) ) ( not ( = ?auto_762308 ?auto_762312 ) ) ( not ( = ?auto_762308 ?auto_762313 ) ) ( not ( = ?auto_762308 ?auto_762314 ) ) ( not ( = ?auto_762308 ?auto_762315 ) ) ( not ( = ?auto_762308 ?auto_762316 ) ) ( not ( = ?auto_762308 ?auto_762317 ) ) ( not ( = ?auto_762308 ?auto_762318 ) ) ( not ( = ?auto_762309 ?auto_762310 ) ) ( not ( = ?auto_762309 ?auto_762311 ) ) ( not ( = ?auto_762309 ?auto_762312 ) ) ( not ( = ?auto_762309 ?auto_762313 ) ) ( not ( = ?auto_762309 ?auto_762314 ) ) ( not ( = ?auto_762309 ?auto_762315 ) ) ( not ( = ?auto_762309 ?auto_762316 ) ) ( not ( = ?auto_762309 ?auto_762317 ) ) ( not ( = ?auto_762309 ?auto_762318 ) ) ( not ( = ?auto_762310 ?auto_762311 ) ) ( not ( = ?auto_762310 ?auto_762312 ) ) ( not ( = ?auto_762310 ?auto_762313 ) ) ( not ( = ?auto_762310 ?auto_762314 ) ) ( not ( = ?auto_762310 ?auto_762315 ) ) ( not ( = ?auto_762310 ?auto_762316 ) ) ( not ( = ?auto_762310 ?auto_762317 ) ) ( not ( = ?auto_762310 ?auto_762318 ) ) ( not ( = ?auto_762311 ?auto_762312 ) ) ( not ( = ?auto_762311 ?auto_762313 ) ) ( not ( = ?auto_762311 ?auto_762314 ) ) ( not ( = ?auto_762311 ?auto_762315 ) ) ( not ( = ?auto_762311 ?auto_762316 ) ) ( not ( = ?auto_762311 ?auto_762317 ) ) ( not ( = ?auto_762311 ?auto_762318 ) ) ( not ( = ?auto_762312 ?auto_762313 ) ) ( not ( = ?auto_762312 ?auto_762314 ) ) ( not ( = ?auto_762312 ?auto_762315 ) ) ( not ( = ?auto_762312 ?auto_762316 ) ) ( not ( = ?auto_762312 ?auto_762317 ) ) ( not ( = ?auto_762312 ?auto_762318 ) ) ( not ( = ?auto_762313 ?auto_762314 ) ) ( not ( = ?auto_762313 ?auto_762315 ) ) ( not ( = ?auto_762313 ?auto_762316 ) ) ( not ( = ?auto_762313 ?auto_762317 ) ) ( not ( = ?auto_762313 ?auto_762318 ) ) ( not ( = ?auto_762314 ?auto_762315 ) ) ( not ( = ?auto_762314 ?auto_762316 ) ) ( not ( = ?auto_762314 ?auto_762317 ) ) ( not ( = ?auto_762314 ?auto_762318 ) ) ( not ( = ?auto_762315 ?auto_762316 ) ) ( not ( = ?auto_762315 ?auto_762317 ) ) ( not ( = ?auto_762315 ?auto_762318 ) ) ( not ( = ?auto_762316 ?auto_762317 ) ) ( not ( = ?auto_762316 ?auto_762318 ) ) ( not ( = ?auto_762317 ?auto_762318 ) ) ( ON ?auto_762316 ?auto_762317 ) ( ON ?auto_762315 ?auto_762316 ) ( ON ?auto_762314 ?auto_762315 ) ( ON ?auto_762313 ?auto_762314 ) ( ON ?auto_762312 ?auto_762313 ) ( ON ?auto_762311 ?auto_762312 ) ( ON ?auto_762310 ?auto_762311 ) ( ON ?auto_762309 ?auto_762310 ) ( ON ?auto_762308 ?auto_762309 ) ( ON ?auto_762307 ?auto_762308 ) ( ON ?auto_762306 ?auto_762307 ) ( CLEAR ?auto_762304 ) ( ON ?auto_762305 ?auto_762306 ) ( CLEAR ?auto_762305 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_762303 ?auto_762304 ?auto_762305 )
      ( MAKE-15PILE ?auto_762303 ?auto_762304 ?auto_762305 ?auto_762306 ?auto_762307 ?auto_762308 ?auto_762309 ?auto_762310 ?auto_762311 ?auto_762312 ?auto_762313 ?auto_762314 ?auto_762315 ?auto_762316 ?auto_762317 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_762365 - BLOCK
      ?auto_762366 - BLOCK
      ?auto_762367 - BLOCK
      ?auto_762368 - BLOCK
      ?auto_762369 - BLOCK
      ?auto_762370 - BLOCK
      ?auto_762371 - BLOCK
      ?auto_762372 - BLOCK
      ?auto_762373 - BLOCK
      ?auto_762374 - BLOCK
      ?auto_762375 - BLOCK
      ?auto_762376 - BLOCK
      ?auto_762377 - BLOCK
      ?auto_762378 - BLOCK
      ?auto_762379 - BLOCK
    )
    :vars
    (
      ?auto_762380 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_762379 ?auto_762380 ) ( ON-TABLE ?auto_762365 ) ( not ( = ?auto_762365 ?auto_762366 ) ) ( not ( = ?auto_762365 ?auto_762367 ) ) ( not ( = ?auto_762365 ?auto_762368 ) ) ( not ( = ?auto_762365 ?auto_762369 ) ) ( not ( = ?auto_762365 ?auto_762370 ) ) ( not ( = ?auto_762365 ?auto_762371 ) ) ( not ( = ?auto_762365 ?auto_762372 ) ) ( not ( = ?auto_762365 ?auto_762373 ) ) ( not ( = ?auto_762365 ?auto_762374 ) ) ( not ( = ?auto_762365 ?auto_762375 ) ) ( not ( = ?auto_762365 ?auto_762376 ) ) ( not ( = ?auto_762365 ?auto_762377 ) ) ( not ( = ?auto_762365 ?auto_762378 ) ) ( not ( = ?auto_762365 ?auto_762379 ) ) ( not ( = ?auto_762365 ?auto_762380 ) ) ( not ( = ?auto_762366 ?auto_762367 ) ) ( not ( = ?auto_762366 ?auto_762368 ) ) ( not ( = ?auto_762366 ?auto_762369 ) ) ( not ( = ?auto_762366 ?auto_762370 ) ) ( not ( = ?auto_762366 ?auto_762371 ) ) ( not ( = ?auto_762366 ?auto_762372 ) ) ( not ( = ?auto_762366 ?auto_762373 ) ) ( not ( = ?auto_762366 ?auto_762374 ) ) ( not ( = ?auto_762366 ?auto_762375 ) ) ( not ( = ?auto_762366 ?auto_762376 ) ) ( not ( = ?auto_762366 ?auto_762377 ) ) ( not ( = ?auto_762366 ?auto_762378 ) ) ( not ( = ?auto_762366 ?auto_762379 ) ) ( not ( = ?auto_762366 ?auto_762380 ) ) ( not ( = ?auto_762367 ?auto_762368 ) ) ( not ( = ?auto_762367 ?auto_762369 ) ) ( not ( = ?auto_762367 ?auto_762370 ) ) ( not ( = ?auto_762367 ?auto_762371 ) ) ( not ( = ?auto_762367 ?auto_762372 ) ) ( not ( = ?auto_762367 ?auto_762373 ) ) ( not ( = ?auto_762367 ?auto_762374 ) ) ( not ( = ?auto_762367 ?auto_762375 ) ) ( not ( = ?auto_762367 ?auto_762376 ) ) ( not ( = ?auto_762367 ?auto_762377 ) ) ( not ( = ?auto_762367 ?auto_762378 ) ) ( not ( = ?auto_762367 ?auto_762379 ) ) ( not ( = ?auto_762367 ?auto_762380 ) ) ( not ( = ?auto_762368 ?auto_762369 ) ) ( not ( = ?auto_762368 ?auto_762370 ) ) ( not ( = ?auto_762368 ?auto_762371 ) ) ( not ( = ?auto_762368 ?auto_762372 ) ) ( not ( = ?auto_762368 ?auto_762373 ) ) ( not ( = ?auto_762368 ?auto_762374 ) ) ( not ( = ?auto_762368 ?auto_762375 ) ) ( not ( = ?auto_762368 ?auto_762376 ) ) ( not ( = ?auto_762368 ?auto_762377 ) ) ( not ( = ?auto_762368 ?auto_762378 ) ) ( not ( = ?auto_762368 ?auto_762379 ) ) ( not ( = ?auto_762368 ?auto_762380 ) ) ( not ( = ?auto_762369 ?auto_762370 ) ) ( not ( = ?auto_762369 ?auto_762371 ) ) ( not ( = ?auto_762369 ?auto_762372 ) ) ( not ( = ?auto_762369 ?auto_762373 ) ) ( not ( = ?auto_762369 ?auto_762374 ) ) ( not ( = ?auto_762369 ?auto_762375 ) ) ( not ( = ?auto_762369 ?auto_762376 ) ) ( not ( = ?auto_762369 ?auto_762377 ) ) ( not ( = ?auto_762369 ?auto_762378 ) ) ( not ( = ?auto_762369 ?auto_762379 ) ) ( not ( = ?auto_762369 ?auto_762380 ) ) ( not ( = ?auto_762370 ?auto_762371 ) ) ( not ( = ?auto_762370 ?auto_762372 ) ) ( not ( = ?auto_762370 ?auto_762373 ) ) ( not ( = ?auto_762370 ?auto_762374 ) ) ( not ( = ?auto_762370 ?auto_762375 ) ) ( not ( = ?auto_762370 ?auto_762376 ) ) ( not ( = ?auto_762370 ?auto_762377 ) ) ( not ( = ?auto_762370 ?auto_762378 ) ) ( not ( = ?auto_762370 ?auto_762379 ) ) ( not ( = ?auto_762370 ?auto_762380 ) ) ( not ( = ?auto_762371 ?auto_762372 ) ) ( not ( = ?auto_762371 ?auto_762373 ) ) ( not ( = ?auto_762371 ?auto_762374 ) ) ( not ( = ?auto_762371 ?auto_762375 ) ) ( not ( = ?auto_762371 ?auto_762376 ) ) ( not ( = ?auto_762371 ?auto_762377 ) ) ( not ( = ?auto_762371 ?auto_762378 ) ) ( not ( = ?auto_762371 ?auto_762379 ) ) ( not ( = ?auto_762371 ?auto_762380 ) ) ( not ( = ?auto_762372 ?auto_762373 ) ) ( not ( = ?auto_762372 ?auto_762374 ) ) ( not ( = ?auto_762372 ?auto_762375 ) ) ( not ( = ?auto_762372 ?auto_762376 ) ) ( not ( = ?auto_762372 ?auto_762377 ) ) ( not ( = ?auto_762372 ?auto_762378 ) ) ( not ( = ?auto_762372 ?auto_762379 ) ) ( not ( = ?auto_762372 ?auto_762380 ) ) ( not ( = ?auto_762373 ?auto_762374 ) ) ( not ( = ?auto_762373 ?auto_762375 ) ) ( not ( = ?auto_762373 ?auto_762376 ) ) ( not ( = ?auto_762373 ?auto_762377 ) ) ( not ( = ?auto_762373 ?auto_762378 ) ) ( not ( = ?auto_762373 ?auto_762379 ) ) ( not ( = ?auto_762373 ?auto_762380 ) ) ( not ( = ?auto_762374 ?auto_762375 ) ) ( not ( = ?auto_762374 ?auto_762376 ) ) ( not ( = ?auto_762374 ?auto_762377 ) ) ( not ( = ?auto_762374 ?auto_762378 ) ) ( not ( = ?auto_762374 ?auto_762379 ) ) ( not ( = ?auto_762374 ?auto_762380 ) ) ( not ( = ?auto_762375 ?auto_762376 ) ) ( not ( = ?auto_762375 ?auto_762377 ) ) ( not ( = ?auto_762375 ?auto_762378 ) ) ( not ( = ?auto_762375 ?auto_762379 ) ) ( not ( = ?auto_762375 ?auto_762380 ) ) ( not ( = ?auto_762376 ?auto_762377 ) ) ( not ( = ?auto_762376 ?auto_762378 ) ) ( not ( = ?auto_762376 ?auto_762379 ) ) ( not ( = ?auto_762376 ?auto_762380 ) ) ( not ( = ?auto_762377 ?auto_762378 ) ) ( not ( = ?auto_762377 ?auto_762379 ) ) ( not ( = ?auto_762377 ?auto_762380 ) ) ( not ( = ?auto_762378 ?auto_762379 ) ) ( not ( = ?auto_762378 ?auto_762380 ) ) ( not ( = ?auto_762379 ?auto_762380 ) ) ( ON ?auto_762378 ?auto_762379 ) ( ON ?auto_762377 ?auto_762378 ) ( ON ?auto_762376 ?auto_762377 ) ( ON ?auto_762375 ?auto_762376 ) ( ON ?auto_762374 ?auto_762375 ) ( ON ?auto_762373 ?auto_762374 ) ( ON ?auto_762372 ?auto_762373 ) ( ON ?auto_762371 ?auto_762372 ) ( ON ?auto_762370 ?auto_762371 ) ( ON ?auto_762369 ?auto_762370 ) ( ON ?auto_762368 ?auto_762369 ) ( ON ?auto_762367 ?auto_762368 ) ( CLEAR ?auto_762365 ) ( ON ?auto_762366 ?auto_762367 ) ( CLEAR ?auto_762366 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_762365 ?auto_762366 )
      ( MAKE-15PILE ?auto_762365 ?auto_762366 ?auto_762367 ?auto_762368 ?auto_762369 ?auto_762370 ?auto_762371 ?auto_762372 ?auto_762373 ?auto_762374 ?auto_762375 ?auto_762376 ?auto_762377 ?auto_762378 ?auto_762379 ) )
  )

  ( :method MAKE-15PILE
    :parameters
    (
      ?auto_762427 - BLOCK
      ?auto_762428 - BLOCK
      ?auto_762429 - BLOCK
      ?auto_762430 - BLOCK
      ?auto_762431 - BLOCK
      ?auto_762432 - BLOCK
      ?auto_762433 - BLOCK
      ?auto_762434 - BLOCK
      ?auto_762435 - BLOCK
      ?auto_762436 - BLOCK
      ?auto_762437 - BLOCK
      ?auto_762438 - BLOCK
      ?auto_762439 - BLOCK
      ?auto_762440 - BLOCK
      ?auto_762441 - BLOCK
    )
    :vars
    (
      ?auto_762442 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_762441 ?auto_762442 ) ( not ( = ?auto_762427 ?auto_762428 ) ) ( not ( = ?auto_762427 ?auto_762429 ) ) ( not ( = ?auto_762427 ?auto_762430 ) ) ( not ( = ?auto_762427 ?auto_762431 ) ) ( not ( = ?auto_762427 ?auto_762432 ) ) ( not ( = ?auto_762427 ?auto_762433 ) ) ( not ( = ?auto_762427 ?auto_762434 ) ) ( not ( = ?auto_762427 ?auto_762435 ) ) ( not ( = ?auto_762427 ?auto_762436 ) ) ( not ( = ?auto_762427 ?auto_762437 ) ) ( not ( = ?auto_762427 ?auto_762438 ) ) ( not ( = ?auto_762427 ?auto_762439 ) ) ( not ( = ?auto_762427 ?auto_762440 ) ) ( not ( = ?auto_762427 ?auto_762441 ) ) ( not ( = ?auto_762427 ?auto_762442 ) ) ( not ( = ?auto_762428 ?auto_762429 ) ) ( not ( = ?auto_762428 ?auto_762430 ) ) ( not ( = ?auto_762428 ?auto_762431 ) ) ( not ( = ?auto_762428 ?auto_762432 ) ) ( not ( = ?auto_762428 ?auto_762433 ) ) ( not ( = ?auto_762428 ?auto_762434 ) ) ( not ( = ?auto_762428 ?auto_762435 ) ) ( not ( = ?auto_762428 ?auto_762436 ) ) ( not ( = ?auto_762428 ?auto_762437 ) ) ( not ( = ?auto_762428 ?auto_762438 ) ) ( not ( = ?auto_762428 ?auto_762439 ) ) ( not ( = ?auto_762428 ?auto_762440 ) ) ( not ( = ?auto_762428 ?auto_762441 ) ) ( not ( = ?auto_762428 ?auto_762442 ) ) ( not ( = ?auto_762429 ?auto_762430 ) ) ( not ( = ?auto_762429 ?auto_762431 ) ) ( not ( = ?auto_762429 ?auto_762432 ) ) ( not ( = ?auto_762429 ?auto_762433 ) ) ( not ( = ?auto_762429 ?auto_762434 ) ) ( not ( = ?auto_762429 ?auto_762435 ) ) ( not ( = ?auto_762429 ?auto_762436 ) ) ( not ( = ?auto_762429 ?auto_762437 ) ) ( not ( = ?auto_762429 ?auto_762438 ) ) ( not ( = ?auto_762429 ?auto_762439 ) ) ( not ( = ?auto_762429 ?auto_762440 ) ) ( not ( = ?auto_762429 ?auto_762441 ) ) ( not ( = ?auto_762429 ?auto_762442 ) ) ( not ( = ?auto_762430 ?auto_762431 ) ) ( not ( = ?auto_762430 ?auto_762432 ) ) ( not ( = ?auto_762430 ?auto_762433 ) ) ( not ( = ?auto_762430 ?auto_762434 ) ) ( not ( = ?auto_762430 ?auto_762435 ) ) ( not ( = ?auto_762430 ?auto_762436 ) ) ( not ( = ?auto_762430 ?auto_762437 ) ) ( not ( = ?auto_762430 ?auto_762438 ) ) ( not ( = ?auto_762430 ?auto_762439 ) ) ( not ( = ?auto_762430 ?auto_762440 ) ) ( not ( = ?auto_762430 ?auto_762441 ) ) ( not ( = ?auto_762430 ?auto_762442 ) ) ( not ( = ?auto_762431 ?auto_762432 ) ) ( not ( = ?auto_762431 ?auto_762433 ) ) ( not ( = ?auto_762431 ?auto_762434 ) ) ( not ( = ?auto_762431 ?auto_762435 ) ) ( not ( = ?auto_762431 ?auto_762436 ) ) ( not ( = ?auto_762431 ?auto_762437 ) ) ( not ( = ?auto_762431 ?auto_762438 ) ) ( not ( = ?auto_762431 ?auto_762439 ) ) ( not ( = ?auto_762431 ?auto_762440 ) ) ( not ( = ?auto_762431 ?auto_762441 ) ) ( not ( = ?auto_762431 ?auto_762442 ) ) ( not ( = ?auto_762432 ?auto_762433 ) ) ( not ( = ?auto_762432 ?auto_762434 ) ) ( not ( = ?auto_762432 ?auto_762435 ) ) ( not ( = ?auto_762432 ?auto_762436 ) ) ( not ( = ?auto_762432 ?auto_762437 ) ) ( not ( = ?auto_762432 ?auto_762438 ) ) ( not ( = ?auto_762432 ?auto_762439 ) ) ( not ( = ?auto_762432 ?auto_762440 ) ) ( not ( = ?auto_762432 ?auto_762441 ) ) ( not ( = ?auto_762432 ?auto_762442 ) ) ( not ( = ?auto_762433 ?auto_762434 ) ) ( not ( = ?auto_762433 ?auto_762435 ) ) ( not ( = ?auto_762433 ?auto_762436 ) ) ( not ( = ?auto_762433 ?auto_762437 ) ) ( not ( = ?auto_762433 ?auto_762438 ) ) ( not ( = ?auto_762433 ?auto_762439 ) ) ( not ( = ?auto_762433 ?auto_762440 ) ) ( not ( = ?auto_762433 ?auto_762441 ) ) ( not ( = ?auto_762433 ?auto_762442 ) ) ( not ( = ?auto_762434 ?auto_762435 ) ) ( not ( = ?auto_762434 ?auto_762436 ) ) ( not ( = ?auto_762434 ?auto_762437 ) ) ( not ( = ?auto_762434 ?auto_762438 ) ) ( not ( = ?auto_762434 ?auto_762439 ) ) ( not ( = ?auto_762434 ?auto_762440 ) ) ( not ( = ?auto_762434 ?auto_762441 ) ) ( not ( = ?auto_762434 ?auto_762442 ) ) ( not ( = ?auto_762435 ?auto_762436 ) ) ( not ( = ?auto_762435 ?auto_762437 ) ) ( not ( = ?auto_762435 ?auto_762438 ) ) ( not ( = ?auto_762435 ?auto_762439 ) ) ( not ( = ?auto_762435 ?auto_762440 ) ) ( not ( = ?auto_762435 ?auto_762441 ) ) ( not ( = ?auto_762435 ?auto_762442 ) ) ( not ( = ?auto_762436 ?auto_762437 ) ) ( not ( = ?auto_762436 ?auto_762438 ) ) ( not ( = ?auto_762436 ?auto_762439 ) ) ( not ( = ?auto_762436 ?auto_762440 ) ) ( not ( = ?auto_762436 ?auto_762441 ) ) ( not ( = ?auto_762436 ?auto_762442 ) ) ( not ( = ?auto_762437 ?auto_762438 ) ) ( not ( = ?auto_762437 ?auto_762439 ) ) ( not ( = ?auto_762437 ?auto_762440 ) ) ( not ( = ?auto_762437 ?auto_762441 ) ) ( not ( = ?auto_762437 ?auto_762442 ) ) ( not ( = ?auto_762438 ?auto_762439 ) ) ( not ( = ?auto_762438 ?auto_762440 ) ) ( not ( = ?auto_762438 ?auto_762441 ) ) ( not ( = ?auto_762438 ?auto_762442 ) ) ( not ( = ?auto_762439 ?auto_762440 ) ) ( not ( = ?auto_762439 ?auto_762441 ) ) ( not ( = ?auto_762439 ?auto_762442 ) ) ( not ( = ?auto_762440 ?auto_762441 ) ) ( not ( = ?auto_762440 ?auto_762442 ) ) ( not ( = ?auto_762441 ?auto_762442 ) ) ( ON ?auto_762440 ?auto_762441 ) ( ON ?auto_762439 ?auto_762440 ) ( ON ?auto_762438 ?auto_762439 ) ( ON ?auto_762437 ?auto_762438 ) ( ON ?auto_762436 ?auto_762437 ) ( ON ?auto_762435 ?auto_762436 ) ( ON ?auto_762434 ?auto_762435 ) ( ON ?auto_762433 ?auto_762434 ) ( ON ?auto_762432 ?auto_762433 ) ( ON ?auto_762431 ?auto_762432 ) ( ON ?auto_762430 ?auto_762431 ) ( ON ?auto_762429 ?auto_762430 ) ( ON ?auto_762428 ?auto_762429 ) ( ON ?auto_762427 ?auto_762428 ) ( CLEAR ?auto_762427 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_762427 )
      ( MAKE-15PILE ?auto_762427 ?auto_762428 ?auto_762429 ?auto_762430 ?auto_762431 ?auto_762432 ?auto_762433 ?auto_762434 ?auto_762435 ?auto_762436 ?auto_762437 ?auto_762438 ?auto_762439 ?auto_762440 ?auto_762441 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_762490 - BLOCK
      ?auto_762491 - BLOCK
      ?auto_762492 - BLOCK
      ?auto_762493 - BLOCK
      ?auto_762494 - BLOCK
      ?auto_762495 - BLOCK
      ?auto_762496 - BLOCK
      ?auto_762497 - BLOCK
      ?auto_762498 - BLOCK
      ?auto_762499 - BLOCK
      ?auto_762500 - BLOCK
      ?auto_762501 - BLOCK
      ?auto_762502 - BLOCK
      ?auto_762503 - BLOCK
      ?auto_762504 - BLOCK
      ?auto_762505 - BLOCK
    )
    :vars
    (
      ?auto_762506 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_762504 ) ( ON ?auto_762505 ?auto_762506 ) ( CLEAR ?auto_762505 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_762490 ) ( ON ?auto_762491 ?auto_762490 ) ( ON ?auto_762492 ?auto_762491 ) ( ON ?auto_762493 ?auto_762492 ) ( ON ?auto_762494 ?auto_762493 ) ( ON ?auto_762495 ?auto_762494 ) ( ON ?auto_762496 ?auto_762495 ) ( ON ?auto_762497 ?auto_762496 ) ( ON ?auto_762498 ?auto_762497 ) ( ON ?auto_762499 ?auto_762498 ) ( ON ?auto_762500 ?auto_762499 ) ( ON ?auto_762501 ?auto_762500 ) ( ON ?auto_762502 ?auto_762501 ) ( ON ?auto_762503 ?auto_762502 ) ( ON ?auto_762504 ?auto_762503 ) ( not ( = ?auto_762490 ?auto_762491 ) ) ( not ( = ?auto_762490 ?auto_762492 ) ) ( not ( = ?auto_762490 ?auto_762493 ) ) ( not ( = ?auto_762490 ?auto_762494 ) ) ( not ( = ?auto_762490 ?auto_762495 ) ) ( not ( = ?auto_762490 ?auto_762496 ) ) ( not ( = ?auto_762490 ?auto_762497 ) ) ( not ( = ?auto_762490 ?auto_762498 ) ) ( not ( = ?auto_762490 ?auto_762499 ) ) ( not ( = ?auto_762490 ?auto_762500 ) ) ( not ( = ?auto_762490 ?auto_762501 ) ) ( not ( = ?auto_762490 ?auto_762502 ) ) ( not ( = ?auto_762490 ?auto_762503 ) ) ( not ( = ?auto_762490 ?auto_762504 ) ) ( not ( = ?auto_762490 ?auto_762505 ) ) ( not ( = ?auto_762490 ?auto_762506 ) ) ( not ( = ?auto_762491 ?auto_762492 ) ) ( not ( = ?auto_762491 ?auto_762493 ) ) ( not ( = ?auto_762491 ?auto_762494 ) ) ( not ( = ?auto_762491 ?auto_762495 ) ) ( not ( = ?auto_762491 ?auto_762496 ) ) ( not ( = ?auto_762491 ?auto_762497 ) ) ( not ( = ?auto_762491 ?auto_762498 ) ) ( not ( = ?auto_762491 ?auto_762499 ) ) ( not ( = ?auto_762491 ?auto_762500 ) ) ( not ( = ?auto_762491 ?auto_762501 ) ) ( not ( = ?auto_762491 ?auto_762502 ) ) ( not ( = ?auto_762491 ?auto_762503 ) ) ( not ( = ?auto_762491 ?auto_762504 ) ) ( not ( = ?auto_762491 ?auto_762505 ) ) ( not ( = ?auto_762491 ?auto_762506 ) ) ( not ( = ?auto_762492 ?auto_762493 ) ) ( not ( = ?auto_762492 ?auto_762494 ) ) ( not ( = ?auto_762492 ?auto_762495 ) ) ( not ( = ?auto_762492 ?auto_762496 ) ) ( not ( = ?auto_762492 ?auto_762497 ) ) ( not ( = ?auto_762492 ?auto_762498 ) ) ( not ( = ?auto_762492 ?auto_762499 ) ) ( not ( = ?auto_762492 ?auto_762500 ) ) ( not ( = ?auto_762492 ?auto_762501 ) ) ( not ( = ?auto_762492 ?auto_762502 ) ) ( not ( = ?auto_762492 ?auto_762503 ) ) ( not ( = ?auto_762492 ?auto_762504 ) ) ( not ( = ?auto_762492 ?auto_762505 ) ) ( not ( = ?auto_762492 ?auto_762506 ) ) ( not ( = ?auto_762493 ?auto_762494 ) ) ( not ( = ?auto_762493 ?auto_762495 ) ) ( not ( = ?auto_762493 ?auto_762496 ) ) ( not ( = ?auto_762493 ?auto_762497 ) ) ( not ( = ?auto_762493 ?auto_762498 ) ) ( not ( = ?auto_762493 ?auto_762499 ) ) ( not ( = ?auto_762493 ?auto_762500 ) ) ( not ( = ?auto_762493 ?auto_762501 ) ) ( not ( = ?auto_762493 ?auto_762502 ) ) ( not ( = ?auto_762493 ?auto_762503 ) ) ( not ( = ?auto_762493 ?auto_762504 ) ) ( not ( = ?auto_762493 ?auto_762505 ) ) ( not ( = ?auto_762493 ?auto_762506 ) ) ( not ( = ?auto_762494 ?auto_762495 ) ) ( not ( = ?auto_762494 ?auto_762496 ) ) ( not ( = ?auto_762494 ?auto_762497 ) ) ( not ( = ?auto_762494 ?auto_762498 ) ) ( not ( = ?auto_762494 ?auto_762499 ) ) ( not ( = ?auto_762494 ?auto_762500 ) ) ( not ( = ?auto_762494 ?auto_762501 ) ) ( not ( = ?auto_762494 ?auto_762502 ) ) ( not ( = ?auto_762494 ?auto_762503 ) ) ( not ( = ?auto_762494 ?auto_762504 ) ) ( not ( = ?auto_762494 ?auto_762505 ) ) ( not ( = ?auto_762494 ?auto_762506 ) ) ( not ( = ?auto_762495 ?auto_762496 ) ) ( not ( = ?auto_762495 ?auto_762497 ) ) ( not ( = ?auto_762495 ?auto_762498 ) ) ( not ( = ?auto_762495 ?auto_762499 ) ) ( not ( = ?auto_762495 ?auto_762500 ) ) ( not ( = ?auto_762495 ?auto_762501 ) ) ( not ( = ?auto_762495 ?auto_762502 ) ) ( not ( = ?auto_762495 ?auto_762503 ) ) ( not ( = ?auto_762495 ?auto_762504 ) ) ( not ( = ?auto_762495 ?auto_762505 ) ) ( not ( = ?auto_762495 ?auto_762506 ) ) ( not ( = ?auto_762496 ?auto_762497 ) ) ( not ( = ?auto_762496 ?auto_762498 ) ) ( not ( = ?auto_762496 ?auto_762499 ) ) ( not ( = ?auto_762496 ?auto_762500 ) ) ( not ( = ?auto_762496 ?auto_762501 ) ) ( not ( = ?auto_762496 ?auto_762502 ) ) ( not ( = ?auto_762496 ?auto_762503 ) ) ( not ( = ?auto_762496 ?auto_762504 ) ) ( not ( = ?auto_762496 ?auto_762505 ) ) ( not ( = ?auto_762496 ?auto_762506 ) ) ( not ( = ?auto_762497 ?auto_762498 ) ) ( not ( = ?auto_762497 ?auto_762499 ) ) ( not ( = ?auto_762497 ?auto_762500 ) ) ( not ( = ?auto_762497 ?auto_762501 ) ) ( not ( = ?auto_762497 ?auto_762502 ) ) ( not ( = ?auto_762497 ?auto_762503 ) ) ( not ( = ?auto_762497 ?auto_762504 ) ) ( not ( = ?auto_762497 ?auto_762505 ) ) ( not ( = ?auto_762497 ?auto_762506 ) ) ( not ( = ?auto_762498 ?auto_762499 ) ) ( not ( = ?auto_762498 ?auto_762500 ) ) ( not ( = ?auto_762498 ?auto_762501 ) ) ( not ( = ?auto_762498 ?auto_762502 ) ) ( not ( = ?auto_762498 ?auto_762503 ) ) ( not ( = ?auto_762498 ?auto_762504 ) ) ( not ( = ?auto_762498 ?auto_762505 ) ) ( not ( = ?auto_762498 ?auto_762506 ) ) ( not ( = ?auto_762499 ?auto_762500 ) ) ( not ( = ?auto_762499 ?auto_762501 ) ) ( not ( = ?auto_762499 ?auto_762502 ) ) ( not ( = ?auto_762499 ?auto_762503 ) ) ( not ( = ?auto_762499 ?auto_762504 ) ) ( not ( = ?auto_762499 ?auto_762505 ) ) ( not ( = ?auto_762499 ?auto_762506 ) ) ( not ( = ?auto_762500 ?auto_762501 ) ) ( not ( = ?auto_762500 ?auto_762502 ) ) ( not ( = ?auto_762500 ?auto_762503 ) ) ( not ( = ?auto_762500 ?auto_762504 ) ) ( not ( = ?auto_762500 ?auto_762505 ) ) ( not ( = ?auto_762500 ?auto_762506 ) ) ( not ( = ?auto_762501 ?auto_762502 ) ) ( not ( = ?auto_762501 ?auto_762503 ) ) ( not ( = ?auto_762501 ?auto_762504 ) ) ( not ( = ?auto_762501 ?auto_762505 ) ) ( not ( = ?auto_762501 ?auto_762506 ) ) ( not ( = ?auto_762502 ?auto_762503 ) ) ( not ( = ?auto_762502 ?auto_762504 ) ) ( not ( = ?auto_762502 ?auto_762505 ) ) ( not ( = ?auto_762502 ?auto_762506 ) ) ( not ( = ?auto_762503 ?auto_762504 ) ) ( not ( = ?auto_762503 ?auto_762505 ) ) ( not ( = ?auto_762503 ?auto_762506 ) ) ( not ( = ?auto_762504 ?auto_762505 ) ) ( not ( = ?auto_762504 ?auto_762506 ) ) ( not ( = ?auto_762505 ?auto_762506 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_762505 ?auto_762506 )
      ( !STACK ?auto_762505 ?auto_762504 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_762556 - BLOCK
      ?auto_762557 - BLOCK
      ?auto_762558 - BLOCK
      ?auto_762559 - BLOCK
      ?auto_762560 - BLOCK
      ?auto_762561 - BLOCK
      ?auto_762562 - BLOCK
      ?auto_762563 - BLOCK
      ?auto_762564 - BLOCK
      ?auto_762565 - BLOCK
      ?auto_762566 - BLOCK
      ?auto_762567 - BLOCK
      ?auto_762568 - BLOCK
      ?auto_762569 - BLOCK
      ?auto_762570 - BLOCK
      ?auto_762571 - BLOCK
    )
    :vars
    (
      ?auto_762572 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_762571 ?auto_762572 ) ( ON-TABLE ?auto_762556 ) ( ON ?auto_762557 ?auto_762556 ) ( ON ?auto_762558 ?auto_762557 ) ( ON ?auto_762559 ?auto_762558 ) ( ON ?auto_762560 ?auto_762559 ) ( ON ?auto_762561 ?auto_762560 ) ( ON ?auto_762562 ?auto_762561 ) ( ON ?auto_762563 ?auto_762562 ) ( ON ?auto_762564 ?auto_762563 ) ( ON ?auto_762565 ?auto_762564 ) ( ON ?auto_762566 ?auto_762565 ) ( ON ?auto_762567 ?auto_762566 ) ( ON ?auto_762568 ?auto_762567 ) ( ON ?auto_762569 ?auto_762568 ) ( not ( = ?auto_762556 ?auto_762557 ) ) ( not ( = ?auto_762556 ?auto_762558 ) ) ( not ( = ?auto_762556 ?auto_762559 ) ) ( not ( = ?auto_762556 ?auto_762560 ) ) ( not ( = ?auto_762556 ?auto_762561 ) ) ( not ( = ?auto_762556 ?auto_762562 ) ) ( not ( = ?auto_762556 ?auto_762563 ) ) ( not ( = ?auto_762556 ?auto_762564 ) ) ( not ( = ?auto_762556 ?auto_762565 ) ) ( not ( = ?auto_762556 ?auto_762566 ) ) ( not ( = ?auto_762556 ?auto_762567 ) ) ( not ( = ?auto_762556 ?auto_762568 ) ) ( not ( = ?auto_762556 ?auto_762569 ) ) ( not ( = ?auto_762556 ?auto_762570 ) ) ( not ( = ?auto_762556 ?auto_762571 ) ) ( not ( = ?auto_762556 ?auto_762572 ) ) ( not ( = ?auto_762557 ?auto_762558 ) ) ( not ( = ?auto_762557 ?auto_762559 ) ) ( not ( = ?auto_762557 ?auto_762560 ) ) ( not ( = ?auto_762557 ?auto_762561 ) ) ( not ( = ?auto_762557 ?auto_762562 ) ) ( not ( = ?auto_762557 ?auto_762563 ) ) ( not ( = ?auto_762557 ?auto_762564 ) ) ( not ( = ?auto_762557 ?auto_762565 ) ) ( not ( = ?auto_762557 ?auto_762566 ) ) ( not ( = ?auto_762557 ?auto_762567 ) ) ( not ( = ?auto_762557 ?auto_762568 ) ) ( not ( = ?auto_762557 ?auto_762569 ) ) ( not ( = ?auto_762557 ?auto_762570 ) ) ( not ( = ?auto_762557 ?auto_762571 ) ) ( not ( = ?auto_762557 ?auto_762572 ) ) ( not ( = ?auto_762558 ?auto_762559 ) ) ( not ( = ?auto_762558 ?auto_762560 ) ) ( not ( = ?auto_762558 ?auto_762561 ) ) ( not ( = ?auto_762558 ?auto_762562 ) ) ( not ( = ?auto_762558 ?auto_762563 ) ) ( not ( = ?auto_762558 ?auto_762564 ) ) ( not ( = ?auto_762558 ?auto_762565 ) ) ( not ( = ?auto_762558 ?auto_762566 ) ) ( not ( = ?auto_762558 ?auto_762567 ) ) ( not ( = ?auto_762558 ?auto_762568 ) ) ( not ( = ?auto_762558 ?auto_762569 ) ) ( not ( = ?auto_762558 ?auto_762570 ) ) ( not ( = ?auto_762558 ?auto_762571 ) ) ( not ( = ?auto_762558 ?auto_762572 ) ) ( not ( = ?auto_762559 ?auto_762560 ) ) ( not ( = ?auto_762559 ?auto_762561 ) ) ( not ( = ?auto_762559 ?auto_762562 ) ) ( not ( = ?auto_762559 ?auto_762563 ) ) ( not ( = ?auto_762559 ?auto_762564 ) ) ( not ( = ?auto_762559 ?auto_762565 ) ) ( not ( = ?auto_762559 ?auto_762566 ) ) ( not ( = ?auto_762559 ?auto_762567 ) ) ( not ( = ?auto_762559 ?auto_762568 ) ) ( not ( = ?auto_762559 ?auto_762569 ) ) ( not ( = ?auto_762559 ?auto_762570 ) ) ( not ( = ?auto_762559 ?auto_762571 ) ) ( not ( = ?auto_762559 ?auto_762572 ) ) ( not ( = ?auto_762560 ?auto_762561 ) ) ( not ( = ?auto_762560 ?auto_762562 ) ) ( not ( = ?auto_762560 ?auto_762563 ) ) ( not ( = ?auto_762560 ?auto_762564 ) ) ( not ( = ?auto_762560 ?auto_762565 ) ) ( not ( = ?auto_762560 ?auto_762566 ) ) ( not ( = ?auto_762560 ?auto_762567 ) ) ( not ( = ?auto_762560 ?auto_762568 ) ) ( not ( = ?auto_762560 ?auto_762569 ) ) ( not ( = ?auto_762560 ?auto_762570 ) ) ( not ( = ?auto_762560 ?auto_762571 ) ) ( not ( = ?auto_762560 ?auto_762572 ) ) ( not ( = ?auto_762561 ?auto_762562 ) ) ( not ( = ?auto_762561 ?auto_762563 ) ) ( not ( = ?auto_762561 ?auto_762564 ) ) ( not ( = ?auto_762561 ?auto_762565 ) ) ( not ( = ?auto_762561 ?auto_762566 ) ) ( not ( = ?auto_762561 ?auto_762567 ) ) ( not ( = ?auto_762561 ?auto_762568 ) ) ( not ( = ?auto_762561 ?auto_762569 ) ) ( not ( = ?auto_762561 ?auto_762570 ) ) ( not ( = ?auto_762561 ?auto_762571 ) ) ( not ( = ?auto_762561 ?auto_762572 ) ) ( not ( = ?auto_762562 ?auto_762563 ) ) ( not ( = ?auto_762562 ?auto_762564 ) ) ( not ( = ?auto_762562 ?auto_762565 ) ) ( not ( = ?auto_762562 ?auto_762566 ) ) ( not ( = ?auto_762562 ?auto_762567 ) ) ( not ( = ?auto_762562 ?auto_762568 ) ) ( not ( = ?auto_762562 ?auto_762569 ) ) ( not ( = ?auto_762562 ?auto_762570 ) ) ( not ( = ?auto_762562 ?auto_762571 ) ) ( not ( = ?auto_762562 ?auto_762572 ) ) ( not ( = ?auto_762563 ?auto_762564 ) ) ( not ( = ?auto_762563 ?auto_762565 ) ) ( not ( = ?auto_762563 ?auto_762566 ) ) ( not ( = ?auto_762563 ?auto_762567 ) ) ( not ( = ?auto_762563 ?auto_762568 ) ) ( not ( = ?auto_762563 ?auto_762569 ) ) ( not ( = ?auto_762563 ?auto_762570 ) ) ( not ( = ?auto_762563 ?auto_762571 ) ) ( not ( = ?auto_762563 ?auto_762572 ) ) ( not ( = ?auto_762564 ?auto_762565 ) ) ( not ( = ?auto_762564 ?auto_762566 ) ) ( not ( = ?auto_762564 ?auto_762567 ) ) ( not ( = ?auto_762564 ?auto_762568 ) ) ( not ( = ?auto_762564 ?auto_762569 ) ) ( not ( = ?auto_762564 ?auto_762570 ) ) ( not ( = ?auto_762564 ?auto_762571 ) ) ( not ( = ?auto_762564 ?auto_762572 ) ) ( not ( = ?auto_762565 ?auto_762566 ) ) ( not ( = ?auto_762565 ?auto_762567 ) ) ( not ( = ?auto_762565 ?auto_762568 ) ) ( not ( = ?auto_762565 ?auto_762569 ) ) ( not ( = ?auto_762565 ?auto_762570 ) ) ( not ( = ?auto_762565 ?auto_762571 ) ) ( not ( = ?auto_762565 ?auto_762572 ) ) ( not ( = ?auto_762566 ?auto_762567 ) ) ( not ( = ?auto_762566 ?auto_762568 ) ) ( not ( = ?auto_762566 ?auto_762569 ) ) ( not ( = ?auto_762566 ?auto_762570 ) ) ( not ( = ?auto_762566 ?auto_762571 ) ) ( not ( = ?auto_762566 ?auto_762572 ) ) ( not ( = ?auto_762567 ?auto_762568 ) ) ( not ( = ?auto_762567 ?auto_762569 ) ) ( not ( = ?auto_762567 ?auto_762570 ) ) ( not ( = ?auto_762567 ?auto_762571 ) ) ( not ( = ?auto_762567 ?auto_762572 ) ) ( not ( = ?auto_762568 ?auto_762569 ) ) ( not ( = ?auto_762568 ?auto_762570 ) ) ( not ( = ?auto_762568 ?auto_762571 ) ) ( not ( = ?auto_762568 ?auto_762572 ) ) ( not ( = ?auto_762569 ?auto_762570 ) ) ( not ( = ?auto_762569 ?auto_762571 ) ) ( not ( = ?auto_762569 ?auto_762572 ) ) ( not ( = ?auto_762570 ?auto_762571 ) ) ( not ( = ?auto_762570 ?auto_762572 ) ) ( not ( = ?auto_762571 ?auto_762572 ) ) ( CLEAR ?auto_762569 ) ( ON ?auto_762570 ?auto_762571 ) ( CLEAR ?auto_762570 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_762556 ?auto_762557 ?auto_762558 ?auto_762559 ?auto_762560 ?auto_762561 ?auto_762562 ?auto_762563 ?auto_762564 ?auto_762565 ?auto_762566 ?auto_762567 ?auto_762568 ?auto_762569 ?auto_762570 )
      ( MAKE-16PILE ?auto_762556 ?auto_762557 ?auto_762558 ?auto_762559 ?auto_762560 ?auto_762561 ?auto_762562 ?auto_762563 ?auto_762564 ?auto_762565 ?auto_762566 ?auto_762567 ?auto_762568 ?auto_762569 ?auto_762570 ?auto_762571 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_762622 - BLOCK
      ?auto_762623 - BLOCK
      ?auto_762624 - BLOCK
      ?auto_762625 - BLOCK
      ?auto_762626 - BLOCK
      ?auto_762627 - BLOCK
      ?auto_762628 - BLOCK
      ?auto_762629 - BLOCK
      ?auto_762630 - BLOCK
      ?auto_762631 - BLOCK
      ?auto_762632 - BLOCK
      ?auto_762633 - BLOCK
      ?auto_762634 - BLOCK
      ?auto_762635 - BLOCK
      ?auto_762636 - BLOCK
      ?auto_762637 - BLOCK
    )
    :vars
    (
      ?auto_762638 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_762637 ?auto_762638 ) ( ON-TABLE ?auto_762622 ) ( ON ?auto_762623 ?auto_762622 ) ( ON ?auto_762624 ?auto_762623 ) ( ON ?auto_762625 ?auto_762624 ) ( ON ?auto_762626 ?auto_762625 ) ( ON ?auto_762627 ?auto_762626 ) ( ON ?auto_762628 ?auto_762627 ) ( ON ?auto_762629 ?auto_762628 ) ( ON ?auto_762630 ?auto_762629 ) ( ON ?auto_762631 ?auto_762630 ) ( ON ?auto_762632 ?auto_762631 ) ( ON ?auto_762633 ?auto_762632 ) ( ON ?auto_762634 ?auto_762633 ) ( not ( = ?auto_762622 ?auto_762623 ) ) ( not ( = ?auto_762622 ?auto_762624 ) ) ( not ( = ?auto_762622 ?auto_762625 ) ) ( not ( = ?auto_762622 ?auto_762626 ) ) ( not ( = ?auto_762622 ?auto_762627 ) ) ( not ( = ?auto_762622 ?auto_762628 ) ) ( not ( = ?auto_762622 ?auto_762629 ) ) ( not ( = ?auto_762622 ?auto_762630 ) ) ( not ( = ?auto_762622 ?auto_762631 ) ) ( not ( = ?auto_762622 ?auto_762632 ) ) ( not ( = ?auto_762622 ?auto_762633 ) ) ( not ( = ?auto_762622 ?auto_762634 ) ) ( not ( = ?auto_762622 ?auto_762635 ) ) ( not ( = ?auto_762622 ?auto_762636 ) ) ( not ( = ?auto_762622 ?auto_762637 ) ) ( not ( = ?auto_762622 ?auto_762638 ) ) ( not ( = ?auto_762623 ?auto_762624 ) ) ( not ( = ?auto_762623 ?auto_762625 ) ) ( not ( = ?auto_762623 ?auto_762626 ) ) ( not ( = ?auto_762623 ?auto_762627 ) ) ( not ( = ?auto_762623 ?auto_762628 ) ) ( not ( = ?auto_762623 ?auto_762629 ) ) ( not ( = ?auto_762623 ?auto_762630 ) ) ( not ( = ?auto_762623 ?auto_762631 ) ) ( not ( = ?auto_762623 ?auto_762632 ) ) ( not ( = ?auto_762623 ?auto_762633 ) ) ( not ( = ?auto_762623 ?auto_762634 ) ) ( not ( = ?auto_762623 ?auto_762635 ) ) ( not ( = ?auto_762623 ?auto_762636 ) ) ( not ( = ?auto_762623 ?auto_762637 ) ) ( not ( = ?auto_762623 ?auto_762638 ) ) ( not ( = ?auto_762624 ?auto_762625 ) ) ( not ( = ?auto_762624 ?auto_762626 ) ) ( not ( = ?auto_762624 ?auto_762627 ) ) ( not ( = ?auto_762624 ?auto_762628 ) ) ( not ( = ?auto_762624 ?auto_762629 ) ) ( not ( = ?auto_762624 ?auto_762630 ) ) ( not ( = ?auto_762624 ?auto_762631 ) ) ( not ( = ?auto_762624 ?auto_762632 ) ) ( not ( = ?auto_762624 ?auto_762633 ) ) ( not ( = ?auto_762624 ?auto_762634 ) ) ( not ( = ?auto_762624 ?auto_762635 ) ) ( not ( = ?auto_762624 ?auto_762636 ) ) ( not ( = ?auto_762624 ?auto_762637 ) ) ( not ( = ?auto_762624 ?auto_762638 ) ) ( not ( = ?auto_762625 ?auto_762626 ) ) ( not ( = ?auto_762625 ?auto_762627 ) ) ( not ( = ?auto_762625 ?auto_762628 ) ) ( not ( = ?auto_762625 ?auto_762629 ) ) ( not ( = ?auto_762625 ?auto_762630 ) ) ( not ( = ?auto_762625 ?auto_762631 ) ) ( not ( = ?auto_762625 ?auto_762632 ) ) ( not ( = ?auto_762625 ?auto_762633 ) ) ( not ( = ?auto_762625 ?auto_762634 ) ) ( not ( = ?auto_762625 ?auto_762635 ) ) ( not ( = ?auto_762625 ?auto_762636 ) ) ( not ( = ?auto_762625 ?auto_762637 ) ) ( not ( = ?auto_762625 ?auto_762638 ) ) ( not ( = ?auto_762626 ?auto_762627 ) ) ( not ( = ?auto_762626 ?auto_762628 ) ) ( not ( = ?auto_762626 ?auto_762629 ) ) ( not ( = ?auto_762626 ?auto_762630 ) ) ( not ( = ?auto_762626 ?auto_762631 ) ) ( not ( = ?auto_762626 ?auto_762632 ) ) ( not ( = ?auto_762626 ?auto_762633 ) ) ( not ( = ?auto_762626 ?auto_762634 ) ) ( not ( = ?auto_762626 ?auto_762635 ) ) ( not ( = ?auto_762626 ?auto_762636 ) ) ( not ( = ?auto_762626 ?auto_762637 ) ) ( not ( = ?auto_762626 ?auto_762638 ) ) ( not ( = ?auto_762627 ?auto_762628 ) ) ( not ( = ?auto_762627 ?auto_762629 ) ) ( not ( = ?auto_762627 ?auto_762630 ) ) ( not ( = ?auto_762627 ?auto_762631 ) ) ( not ( = ?auto_762627 ?auto_762632 ) ) ( not ( = ?auto_762627 ?auto_762633 ) ) ( not ( = ?auto_762627 ?auto_762634 ) ) ( not ( = ?auto_762627 ?auto_762635 ) ) ( not ( = ?auto_762627 ?auto_762636 ) ) ( not ( = ?auto_762627 ?auto_762637 ) ) ( not ( = ?auto_762627 ?auto_762638 ) ) ( not ( = ?auto_762628 ?auto_762629 ) ) ( not ( = ?auto_762628 ?auto_762630 ) ) ( not ( = ?auto_762628 ?auto_762631 ) ) ( not ( = ?auto_762628 ?auto_762632 ) ) ( not ( = ?auto_762628 ?auto_762633 ) ) ( not ( = ?auto_762628 ?auto_762634 ) ) ( not ( = ?auto_762628 ?auto_762635 ) ) ( not ( = ?auto_762628 ?auto_762636 ) ) ( not ( = ?auto_762628 ?auto_762637 ) ) ( not ( = ?auto_762628 ?auto_762638 ) ) ( not ( = ?auto_762629 ?auto_762630 ) ) ( not ( = ?auto_762629 ?auto_762631 ) ) ( not ( = ?auto_762629 ?auto_762632 ) ) ( not ( = ?auto_762629 ?auto_762633 ) ) ( not ( = ?auto_762629 ?auto_762634 ) ) ( not ( = ?auto_762629 ?auto_762635 ) ) ( not ( = ?auto_762629 ?auto_762636 ) ) ( not ( = ?auto_762629 ?auto_762637 ) ) ( not ( = ?auto_762629 ?auto_762638 ) ) ( not ( = ?auto_762630 ?auto_762631 ) ) ( not ( = ?auto_762630 ?auto_762632 ) ) ( not ( = ?auto_762630 ?auto_762633 ) ) ( not ( = ?auto_762630 ?auto_762634 ) ) ( not ( = ?auto_762630 ?auto_762635 ) ) ( not ( = ?auto_762630 ?auto_762636 ) ) ( not ( = ?auto_762630 ?auto_762637 ) ) ( not ( = ?auto_762630 ?auto_762638 ) ) ( not ( = ?auto_762631 ?auto_762632 ) ) ( not ( = ?auto_762631 ?auto_762633 ) ) ( not ( = ?auto_762631 ?auto_762634 ) ) ( not ( = ?auto_762631 ?auto_762635 ) ) ( not ( = ?auto_762631 ?auto_762636 ) ) ( not ( = ?auto_762631 ?auto_762637 ) ) ( not ( = ?auto_762631 ?auto_762638 ) ) ( not ( = ?auto_762632 ?auto_762633 ) ) ( not ( = ?auto_762632 ?auto_762634 ) ) ( not ( = ?auto_762632 ?auto_762635 ) ) ( not ( = ?auto_762632 ?auto_762636 ) ) ( not ( = ?auto_762632 ?auto_762637 ) ) ( not ( = ?auto_762632 ?auto_762638 ) ) ( not ( = ?auto_762633 ?auto_762634 ) ) ( not ( = ?auto_762633 ?auto_762635 ) ) ( not ( = ?auto_762633 ?auto_762636 ) ) ( not ( = ?auto_762633 ?auto_762637 ) ) ( not ( = ?auto_762633 ?auto_762638 ) ) ( not ( = ?auto_762634 ?auto_762635 ) ) ( not ( = ?auto_762634 ?auto_762636 ) ) ( not ( = ?auto_762634 ?auto_762637 ) ) ( not ( = ?auto_762634 ?auto_762638 ) ) ( not ( = ?auto_762635 ?auto_762636 ) ) ( not ( = ?auto_762635 ?auto_762637 ) ) ( not ( = ?auto_762635 ?auto_762638 ) ) ( not ( = ?auto_762636 ?auto_762637 ) ) ( not ( = ?auto_762636 ?auto_762638 ) ) ( not ( = ?auto_762637 ?auto_762638 ) ) ( ON ?auto_762636 ?auto_762637 ) ( CLEAR ?auto_762634 ) ( ON ?auto_762635 ?auto_762636 ) ( CLEAR ?auto_762635 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_762622 ?auto_762623 ?auto_762624 ?auto_762625 ?auto_762626 ?auto_762627 ?auto_762628 ?auto_762629 ?auto_762630 ?auto_762631 ?auto_762632 ?auto_762633 ?auto_762634 ?auto_762635 )
      ( MAKE-16PILE ?auto_762622 ?auto_762623 ?auto_762624 ?auto_762625 ?auto_762626 ?auto_762627 ?auto_762628 ?auto_762629 ?auto_762630 ?auto_762631 ?auto_762632 ?auto_762633 ?auto_762634 ?auto_762635 ?auto_762636 ?auto_762637 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_762688 - BLOCK
      ?auto_762689 - BLOCK
      ?auto_762690 - BLOCK
      ?auto_762691 - BLOCK
      ?auto_762692 - BLOCK
      ?auto_762693 - BLOCK
      ?auto_762694 - BLOCK
      ?auto_762695 - BLOCK
      ?auto_762696 - BLOCK
      ?auto_762697 - BLOCK
      ?auto_762698 - BLOCK
      ?auto_762699 - BLOCK
      ?auto_762700 - BLOCK
      ?auto_762701 - BLOCK
      ?auto_762702 - BLOCK
      ?auto_762703 - BLOCK
    )
    :vars
    (
      ?auto_762704 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_762703 ?auto_762704 ) ( ON-TABLE ?auto_762688 ) ( ON ?auto_762689 ?auto_762688 ) ( ON ?auto_762690 ?auto_762689 ) ( ON ?auto_762691 ?auto_762690 ) ( ON ?auto_762692 ?auto_762691 ) ( ON ?auto_762693 ?auto_762692 ) ( ON ?auto_762694 ?auto_762693 ) ( ON ?auto_762695 ?auto_762694 ) ( ON ?auto_762696 ?auto_762695 ) ( ON ?auto_762697 ?auto_762696 ) ( ON ?auto_762698 ?auto_762697 ) ( ON ?auto_762699 ?auto_762698 ) ( not ( = ?auto_762688 ?auto_762689 ) ) ( not ( = ?auto_762688 ?auto_762690 ) ) ( not ( = ?auto_762688 ?auto_762691 ) ) ( not ( = ?auto_762688 ?auto_762692 ) ) ( not ( = ?auto_762688 ?auto_762693 ) ) ( not ( = ?auto_762688 ?auto_762694 ) ) ( not ( = ?auto_762688 ?auto_762695 ) ) ( not ( = ?auto_762688 ?auto_762696 ) ) ( not ( = ?auto_762688 ?auto_762697 ) ) ( not ( = ?auto_762688 ?auto_762698 ) ) ( not ( = ?auto_762688 ?auto_762699 ) ) ( not ( = ?auto_762688 ?auto_762700 ) ) ( not ( = ?auto_762688 ?auto_762701 ) ) ( not ( = ?auto_762688 ?auto_762702 ) ) ( not ( = ?auto_762688 ?auto_762703 ) ) ( not ( = ?auto_762688 ?auto_762704 ) ) ( not ( = ?auto_762689 ?auto_762690 ) ) ( not ( = ?auto_762689 ?auto_762691 ) ) ( not ( = ?auto_762689 ?auto_762692 ) ) ( not ( = ?auto_762689 ?auto_762693 ) ) ( not ( = ?auto_762689 ?auto_762694 ) ) ( not ( = ?auto_762689 ?auto_762695 ) ) ( not ( = ?auto_762689 ?auto_762696 ) ) ( not ( = ?auto_762689 ?auto_762697 ) ) ( not ( = ?auto_762689 ?auto_762698 ) ) ( not ( = ?auto_762689 ?auto_762699 ) ) ( not ( = ?auto_762689 ?auto_762700 ) ) ( not ( = ?auto_762689 ?auto_762701 ) ) ( not ( = ?auto_762689 ?auto_762702 ) ) ( not ( = ?auto_762689 ?auto_762703 ) ) ( not ( = ?auto_762689 ?auto_762704 ) ) ( not ( = ?auto_762690 ?auto_762691 ) ) ( not ( = ?auto_762690 ?auto_762692 ) ) ( not ( = ?auto_762690 ?auto_762693 ) ) ( not ( = ?auto_762690 ?auto_762694 ) ) ( not ( = ?auto_762690 ?auto_762695 ) ) ( not ( = ?auto_762690 ?auto_762696 ) ) ( not ( = ?auto_762690 ?auto_762697 ) ) ( not ( = ?auto_762690 ?auto_762698 ) ) ( not ( = ?auto_762690 ?auto_762699 ) ) ( not ( = ?auto_762690 ?auto_762700 ) ) ( not ( = ?auto_762690 ?auto_762701 ) ) ( not ( = ?auto_762690 ?auto_762702 ) ) ( not ( = ?auto_762690 ?auto_762703 ) ) ( not ( = ?auto_762690 ?auto_762704 ) ) ( not ( = ?auto_762691 ?auto_762692 ) ) ( not ( = ?auto_762691 ?auto_762693 ) ) ( not ( = ?auto_762691 ?auto_762694 ) ) ( not ( = ?auto_762691 ?auto_762695 ) ) ( not ( = ?auto_762691 ?auto_762696 ) ) ( not ( = ?auto_762691 ?auto_762697 ) ) ( not ( = ?auto_762691 ?auto_762698 ) ) ( not ( = ?auto_762691 ?auto_762699 ) ) ( not ( = ?auto_762691 ?auto_762700 ) ) ( not ( = ?auto_762691 ?auto_762701 ) ) ( not ( = ?auto_762691 ?auto_762702 ) ) ( not ( = ?auto_762691 ?auto_762703 ) ) ( not ( = ?auto_762691 ?auto_762704 ) ) ( not ( = ?auto_762692 ?auto_762693 ) ) ( not ( = ?auto_762692 ?auto_762694 ) ) ( not ( = ?auto_762692 ?auto_762695 ) ) ( not ( = ?auto_762692 ?auto_762696 ) ) ( not ( = ?auto_762692 ?auto_762697 ) ) ( not ( = ?auto_762692 ?auto_762698 ) ) ( not ( = ?auto_762692 ?auto_762699 ) ) ( not ( = ?auto_762692 ?auto_762700 ) ) ( not ( = ?auto_762692 ?auto_762701 ) ) ( not ( = ?auto_762692 ?auto_762702 ) ) ( not ( = ?auto_762692 ?auto_762703 ) ) ( not ( = ?auto_762692 ?auto_762704 ) ) ( not ( = ?auto_762693 ?auto_762694 ) ) ( not ( = ?auto_762693 ?auto_762695 ) ) ( not ( = ?auto_762693 ?auto_762696 ) ) ( not ( = ?auto_762693 ?auto_762697 ) ) ( not ( = ?auto_762693 ?auto_762698 ) ) ( not ( = ?auto_762693 ?auto_762699 ) ) ( not ( = ?auto_762693 ?auto_762700 ) ) ( not ( = ?auto_762693 ?auto_762701 ) ) ( not ( = ?auto_762693 ?auto_762702 ) ) ( not ( = ?auto_762693 ?auto_762703 ) ) ( not ( = ?auto_762693 ?auto_762704 ) ) ( not ( = ?auto_762694 ?auto_762695 ) ) ( not ( = ?auto_762694 ?auto_762696 ) ) ( not ( = ?auto_762694 ?auto_762697 ) ) ( not ( = ?auto_762694 ?auto_762698 ) ) ( not ( = ?auto_762694 ?auto_762699 ) ) ( not ( = ?auto_762694 ?auto_762700 ) ) ( not ( = ?auto_762694 ?auto_762701 ) ) ( not ( = ?auto_762694 ?auto_762702 ) ) ( not ( = ?auto_762694 ?auto_762703 ) ) ( not ( = ?auto_762694 ?auto_762704 ) ) ( not ( = ?auto_762695 ?auto_762696 ) ) ( not ( = ?auto_762695 ?auto_762697 ) ) ( not ( = ?auto_762695 ?auto_762698 ) ) ( not ( = ?auto_762695 ?auto_762699 ) ) ( not ( = ?auto_762695 ?auto_762700 ) ) ( not ( = ?auto_762695 ?auto_762701 ) ) ( not ( = ?auto_762695 ?auto_762702 ) ) ( not ( = ?auto_762695 ?auto_762703 ) ) ( not ( = ?auto_762695 ?auto_762704 ) ) ( not ( = ?auto_762696 ?auto_762697 ) ) ( not ( = ?auto_762696 ?auto_762698 ) ) ( not ( = ?auto_762696 ?auto_762699 ) ) ( not ( = ?auto_762696 ?auto_762700 ) ) ( not ( = ?auto_762696 ?auto_762701 ) ) ( not ( = ?auto_762696 ?auto_762702 ) ) ( not ( = ?auto_762696 ?auto_762703 ) ) ( not ( = ?auto_762696 ?auto_762704 ) ) ( not ( = ?auto_762697 ?auto_762698 ) ) ( not ( = ?auto_762697 ?auto_762699 ) ) ( not ( = ?auto_762697 ?auto_762700 ) ) ( not ( = ?auto_762697 ?auto_762701 ) ) ( not ( = ?auto_762697 ?auto_762702 ) ) ( not ( = ?auto_762697 ?auto_762703 ) ) ( not ( = ?auto_762697 ?auto_762704 ) ) ( not ( = ?auto_762698 ?auto_762699 ) ) ( not ( = ?auto_762698 ?auto_762700 ) ) ( not ( = ?auto_762698 ?auto_762701 ) ) ( not ( = ?auto_762698 ?auto_762702 ) ) ( not ( = ?auto_762698 ?auto_762703 ) ) ( not ( = ?auto_762698 ?auto_762704 ) ) ( not ( = ?auto_762699 ?auto_762700 ) ) ( not ( = ?auto_762699 ?auto_762701 ) ) ( not ( = ?auto_762699 ?auto_762702 ) ) ( not ( = ?auto_762699 ?auto_762703 ) ) ( not ( = ?auto_762699 ?auto_762704 ) ) ( not ( = ?auto_762700 ?auto_762701 ) ) ( not ( = ?auto_762700 ?auto_762702 ) ) ( not ( = ?auto_762700 ?auto_762703 ) ) ( not ( = ?auto_762700 ?auto_762704 ) ) ( not ( = ?auto_762701 ?auto_762702 ) ) ( not ( = ?auto_762701 ?auto_762703 ) ) ( not ( = ?auto_762701 ?auto_762704 ) ) ( not ( = ?auto_762702 ?auto_762703 ) ) ( not ( = ?auto_762702 ?auto_762704 ) ) ( not ( = ?auto_762703 ?auto_762704 ) ) ( ON ?auto_762702 ?auto_762703 ) ( ON ?auto_762701 ?auto_762702 ) ( CLEAR ?auto_762699 ) ( ON ?auto_762700 ?auto_762701 ) ( CLEAR ?auto_762700 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_762688 ?auto_762689 ?auto_762690 ?auto_762691 ?auto_762692 ?auto_762693 ?auto_762694 ?auto_762695 ?auto_762696 ?auto_762697 ?auto_762698 ?auto_762699 ?auto_762700 )
      ( MAKE-16PILE ?auto_762688 ?auto_762689 ?auto_762690 ?auto_762691 ?auto_762692 ?auto_762693 ?auto_762694 ?auto_762695 ?auto_762696 ?auto_762697 ?auto_762698 ?auto_762699 ?auto_762700 ?auto_762701 ?auto_762702 ?auto_762703 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_762754 - BLOCK
      ?auto_762755 - BLOCK
      ?auto_762756 - BLOCK
      ?auto_762757 - BLOCK
      ?auto_762758 - BLOCK
      ?auto_762759 - BLOCK
      ?auto_762760 - BLOCK
      ?auto_762761 - BLOCK
      ?auto_762762 - BLOCK
      ?auto_762763 - BLOCK
      ?auto_762764 - BLOCK
      ?auto_762765 - BLOCK
      ?auto_762766 - BLOCK
      ?auto_762767 - BLOCK
      ?auto_762768 - BLOCK
      ?auto_762769 - BLOCK
    )
    :vars
    (
      ?auto_762770 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_762769 ?auto_762770 ) ( ON-TABLE ?auto_762754 ) ( ON ?auto_762755 ?auto_762754 ) ( ON ?auto_762756 ?auto_762755 ) ( ON ?auto_762757 ?auto_762756 ) ( ON ?auto_762758 ?auto_762757 ) ( ON ?auto_762759 ?auto_762758 ) ( ON ?auto_762760 ?auto_762759 ) ( ON ?auto_762761 ?auto_762760 ) ( ON ?auto_762762 ?auto_762761 ) ( ON ?auto_762763 ?auto_762762 ) ( ON ?auto_762764 ?auto_762763 ) ( not ( = ?auto_762754 ?auto_762755 ) ) ( not ( = ?auto_762754 ?auto_762756 ) ) ( not ( = ?auto_762754 ?auto_762757 ) ) ( not ( = ?auto_762754 ?auto_762758 ) ) ( not ( = ?auto_762754 ?auto_762759 ) ) ( not ( = ?auto_762754 ?auto_762760 ) ) ( not ( = ?auto_762754 ?auto_762761 ) ) ( not ( = ?auto_762754 ?auto_762762 ) ) ( not ( = ?auto_762754 ?auto_762763 ) ) ( not ( = ?auto_762754 ?auto_762764 ) ) ( not ( = ?auto_762754 ?auto_762765 ) ) ( not ( = ?auto_762754 ?auto_762766 ) ) ( not ( = ?auto_762754 ?auto_762767 ) ) ( not ( = ?auto_762754 ?auto_762768 ) ) ( not ( = ?auto_762754 ?auto_762769 ) ) ( not ( = ?auto_762754 ?auto_762770 ) ) ( not ( = ?auto_762755 ?auto_762756 ) ) ( not ( = ?auto_762755 ?auto_762757 ) ) ( not ( = ?auto_762755 ?auto_762758 ) ) ( not ( = ?auto_762755 ?auto_762759 ) ) ( not ( = ?auto_762755 ?auto_762760 ) ) ( not ( = ?auto_762755 ?auto_762761 ) ) ( not ( = ?auto_762755 ?auto_762762 ) ) ( not ( = ?auto_762755 ?auto_762763 ) ) ( not ( = ?auto_762755 ?auto_762764 ) ) ( not ( = ?auto_762755 ?auto_762765 ) ) ( not ( = ?auto_762755 ?auto_762766 ) ) ( not ( = ?auto_762755 ?auto_762767 ) ) ( not ( = ?auto_762755 ?auto_762768 ) ) ( not ( = ?auto_762755 ?auto_762769 ) ) ( not ( = ?auto_762755 ?auto_762770 ) ) ( not ( = ?auto_762756 ?auto_762757 ) ) ( not ( = ?auto_762756 ?auto_762758 ) ) ( not ( = ?auto_762756 ?auto_762759 ) ) ( not ( = ?auto_762756 ?auto_762760 ) ) ( not ( = ?auto_762756 ?auto_762761 ) ) ( not ( = ?auto_762756 ?auto_762762 ) ) ( not ( = ?auto_762756 ?auto_762763 ) ) ( not ( = ?auto_762756 ?auto_762764 ) ) ( not ( = ?auto_762756 ?auto_762765 ) ) ( not ( = ?auto_762756 ?auto_762766 ) ) ( not ( = ?auto_762756 ?auto_762767 ) ) ( not ( = ?auto_762756 ?auto_762768 ) ) ( not ( = ?auto_762756 ?auto_762769 ) ) ( not ( = ?auto_762756 ?auto_762770 ) ) ( not ( = ?auto_762757 ?auto_762758 ) ) ( not ( = ?auto_762757 ?auto_762759 ) ) ( not ( = ?auto_762757 ?auto_762760 ) ) ( not ( = ?auto_762757 ?auto_762761 ) ) ( not ( = ?auto_762757 ?auto_762762 ) ) ( not ( = ?auto_762757 ?auto_762763 ) ) ( not ( = ?auto_762757 ?auto_762764 ) ) ( not ( = ?auto_762757 ?auto_762765 ) ) ( not ( = ?auto_762757 ?auto_762766 ) ) ( not ( = ?auto_762757 ?auto_762767 ) ) ( not ( = ?auto_762757 ?auto_762768 ) ) ( not ( = ?auto_762757 ?auto_762769 ) ) ( not ( = ?auto_762757 ?auto_762770 ) ) ( not ( = ?auto_762758 ?auto_762759 ) ) ( not ( = ?auto_762758 ?auto_762760 ) ) ( not ( = ?auto_762758 ?auto_762761 ) ) ( not ( = ?auto_762758 ?auto_762762 ) ) ( not ( = ?auto_762758 ?auto_762763 ) ) ( not ( = ?auto_762758 ?auto_762764 ) ) ( not ( = ?auto_762758 ?auto_762765 ) ) ( not ( = ?auto_762758 ?auto_762766 ) ) ( not ( = ?auto_762758 ?auto_762767 ) ) ( not ( = ?auto_762758 ?auto_762768 ) ) ( not ( = ?auto_762758 ?auto_762769 ) ) ( not ( = ?auto_762758 ?auto_762770 ) ) ( not ( = ?auto_762759 ?auto_762760 ) ) ( not ( = ?auto_762759 ?auto_762761 ) ) ( not ( = ?auto_762759 ?auto_762762 ) ) ( not ( = ?auto_762759 ?auto_762763 ) ) ( not ( = ?auto_762759 ?auto_762764 ) ) ( not ( = ?auto_762759 ?auto_762765 ) ) ( not ( = ?auto_762759 ?auto_762766 ) ) ( not ( = ?auto_762759 ?auto_762767 ) ) ( not ( = ?auto_762759 ?auto_762768 ) ) ( not ( = ?auto_762759 ?auto_762769 ) ) ( not ( = ?auto_762759 ?auto_762770 ) ) ( not ( = ?auto_762760 ?auto_762761 ) ) ( not ( = ?auto_762760 ?auto_762762 ) ) ( not ( = ?auto_762760 ?auto_762763 ) ) ( not ( = ?auto_762760 ?auto_762764 ) ) ( not ( = ?auto_762760 ?auto_762765 ) ) ( not ( = ?auto_762760 ?auto_762766 ) ) ( not ( = ?auto_762760 ?auto_762767 ) ) ( not ( = ?auto_762760 ?auto_762768 ) ) ( not ( = ?auto_762760 ?auto_762769 ) ) ( not ( = ?auto_762760 ?auto_762770 ) ) ( not ( = ?auto_762761 ?auto_762762 ) ) ( not ( = ?auto_762761 ?auto_762763 ) ) ( not ( = ?auto_762761 ?auto_762764 ) ) ( not ( = ?auto_762761 ?auto_762765 ) ) ( not ( = ?auto_762761 ?auto_762766 ) ) ( not ( = ?auto_762761 ?auto_762767 ) ) ( not ( = ?auto_762761 ?auto_762768 ) ) ( not ( = ?auto_762761 ?auto_762769 ) ) ( not ( = ?auto_762761 ?auto_762770 ) ) ( not ( = ?auto_762762 ?auto_762763 ) ) ( not ( = ?auto_762762 ?auto_762764 ) ) ( not ( = ?auto_762762 ?auto_762765 ) ) ( not ( = ?auto_762762 ?auto_762766 ) ) ( not ( = ?auto_762762 ?auto_762767 ) ) ( not ( = ?auto_762762 ?auto_762768 ) ) ( not ( = ?auto_762762 ?auto_762769 ) ) ( not ( = ?auto_762762 ?auto_762770 ) ) ( not ( = ?auto_762763 ?auto_762764 ) ) ( not ( = ?auto_762763 ?auto_762765 ) ) ( not ( = ?auto_762763 ?auto_762766 ) ) ( not ( = ?auto_762763 ?auto_762767 ) ) ( not ( = ?auto_762763 ?auto_762768 ) ) ( not ( = ?auto_762763 ?auto_762769 ) ) ( not ( = ?auto_762763 ?auto_762770 ) ) ( not ( = ?auto_762764 ?auto_762765 ) ) ( not ( = ?auto_762764 ?auto_762766 ) ) ( not ( = ?auto_762764 ?auto_762767 ) ) ( not ( = ?auto_762764 ?auto_762768 ) ) ( not ( = ?auto_762764 ?auto_762769 ) ) ( not ( = ?auto_762764 ?auto_762770 ) ) ( not ( = ?auto_762765 ?auto_762766 ) ) ( not ( = ?auto_762765 ?auto_762767 ) ) ( not ( = ?auto_762765 ?auto_762768 ) ) ( not ( = ?auto_762765 ?auto_762769 ) ) ( not ( = ?auto_762765 ?auto_762770 ) ) ( not ( = ?auto_762766 ?auto_762767 ) ) ( not ( = ?auto_762766 ?auto_762768 ) ) ( not ( = ?auto_762766 ?auto_762769 ) ) ( not ( = ?auto_762766 ?auto_762770 ) ) ( not ( = ?auto_762767 ?auto_762768 ) ) ( not ( = ?auto_762767 ?auto_762769 ) ) ( not ( = ?auto_762767 ?auto_762770 ) ) ( not ( = ?auto_762768 ?auto_762769 ) ) ( not ( = ?auto_762768 ?auto_762770 ) ) ( not ( = ?auto_762769 ?auto_762770 ) ) ( ON ?auto_762768 ?auto_762769 ) ( ON ?auto_762767 ?auto_762768 ) ( ON ?auto_762766 ?auto_762767 ) ( CLEAR ?auto_762764 ) ( ON ?auto_762765 ?auto_762766 ) ( CLEAR ?auto_762765 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_762754 ?auto_762755 ?auto_762756 ?auto_762757 ?auto_762758 ?auto_762759 ?auto_762760 ?auto_762761 ?auto_762762 ?auto_762763 ?auto_762764 ?auto_762765 )
      ( MAKE-16PILE ?auto_762754 ?auto_762755 ?auto_762756 ?auto_762757 ?auto_762758 ?auto_762759 ?auto_762760 ?auto_762761 ?auto_762762 ?auto_762763 ?auto_762764 ?auto_762765 ?auto_762766 ?auto_762767 ?auto_762768 ?auto_762769 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_762820 - BLOCK
      ?auto_762821 - BLOCK
      ?auto_762822 - BLOCK
      ?auto_762823 - BLOCK
      ?auto_762824 - BLOCK
      ?auto_762825 - BLOCK
      ?auto_762826 - BLOCK
      ?auto_762827 - BLOCK
      ?auto_762828 - BLOCK
      ?auto_762829 - BLOCK
      ?auto_762830 - BLOCK
      ?auto_762831 - BLOCK
      ?auto_762832 - BLOCK
      ?auto_762833 - BLOCK
      ?auto_762834 - BLOCK
      ?auto_762835 - BLOCK
    )
    :vars
    (
      ?auto_762836 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_762835 ?auto_762836 ) ( ON-TABLE ?auto_762820 ) ( ON ?auto_762821 ?auto_762820 ) ( ON ?auto_762822 ?auto_762821 ) ( ON ?auto_762823 ?auto_762822 ) ( ON ?auto_762824 ?auto_762823 ) ( ON ?auto_762825 ?auto_762824 ) ( ON ?auto_762826 ?auto_762825 ) ( ON ?auto_762827 ?auto_762826 ) ( ON ?auto_762828 ?auto_762827 ) ( ON ?auto_762829 ?auto_762828 ) ( not ( = ?auto_762820 ?auto_762821 ) ) ( not ( = ?auto_762820 ?auto_762822 ) ) ( not ( = ?auto_762820 ?auto_762823 ) ) ( not ( = ?auto_762820 ?auto_762824 ) ) ( not ( = ?auto_762820 ?auto_762825 ) ) ( not ( = ?auto_762820 ?auto_762826 ) ) ( not ( = ?auto_762820 ?auto_762827 ) ) ( not ( = ?auto_762820 ?auto_762828 ) ) ( not ( = ?auto_762820 ?auto_762829 ) ) ( not ( = ?auto_762820 ?auto_762830 ) ) ( not ( = ?auto_762820 ?auto_762831 ) ) ( not ( = ?auto_762820 ?auto_762832 ) ) ( not ( = ?auto_762820 ?auto_762833 ) ) ( not ( = ?auto_762820 ?auto_762834 ) ) ( not ( = ?auto_762820 ?auto_762835 ) ) ( not ( = ?auto_762820 ?auto_762836 ) ) ( not ( = ?auto_762821 ?auto_762822 ) ) ( not ( = ?auto_762821 ?auto_762823 ) ) ( not ( = ?auto_762821 ?auto_762824 ) ) ( not ( = ?auto_762821 ?auto_762825 ) ) ( not ( = ?auto_762821 ?auto_762826 ) ) ( not ( = ?auto_762821 ?auto_762827 ) ) ( not ( = ?auto_762821 ?auto_762828 ) ) ( not ( = ?auto_762821 ?auto_762829 ) ) ( not ( = ?auto_762821 ?auto_762830 ) ) ( not ( = ?auto_762821 ?auto_762831 ) ) ( not ( = ?auto_762821 ?auto_762832 ) ) ( not ( = ?auto_762821 ?auto_762833 ) ) ( not ( = ?auto_762821 ?auto_762834 ) ) ( not ( = ?auto_762821 ?auto_762835 ) ) ( not ( = ?auto_762821 ?auto_762836 ) ) ( not ( = ?auto_762822 ?auto_762823 ) ) ( not ( = ?auto_762822 ?auto_762824 ) ) ( not ( = ?auto_762822 ?auto_762825 ) ) ( not ( = ?auto_762822 ?auto_762826 ) ) ( not ( = ?auto_762822 ?auto_762827 ) ) ( not ( = ?auto_762822 ?auto_762828 ) ) ( not ( = ?auto_762822 ?auto_762829 ) ) ( not ( = ?auto_762822 ?auto_762830 ) ) ( not ( = ?auto_762822 ?auto_762831 ) ) ( not ( = ?auto_762822 ?auto_762832 ) ) ( not ( = ?auto_762822 ?auto_762833 ) ) ( not ( = ?auto_762822 ?auto_762834 ) ) ( not ( = ?auto_762822 ?auto_762835 ) ) ( not ( = ?auto_762822 ?auto_762836 ) ) ( not ( = ?auto_762823 ?auto_762824 ) ) ( not ( = ?auto_762823 ?auto_762825 ) ) ( not ( = ?auto_762823 ?auto_762826 ) ) ( not ( = ?auto_762823 ?auto_762827 ) ) ( not ( = ?auto_762823 ?auto_762828 ) ) ( not ( = ?auto_762823 ?auto_762829 ) ) ( not ( = ?auto_762823 ?auto_762830 ) ) ( not ( = ?auto_762823 ?auto_762831 ) ) ( not ( = ?auto_762823 ?auto_762832 ) ) ( not ( = ?auto_762823 ?auto_762833 ) ) ( not ( = ?auto_762823 ?auto_762834 ) ) ( not ( = ?auto_762823 ?auto_762835 ) ) ( not ( = ?auto_762823 ?auto_762836 ) ) ( not ( = ?auto_762824 ?auto_762825 ) ) ( not ( = ?auto_762824 ?auto_762826 ) ) ( not ( = ?auto_762824 ?auto_762827 ) ) ( not ( = ?auto_762824 ?auto_762828 ) ) ( not ( = ?auto_762824 ?auto_762829 ) ) ( not ( = ?auto_762824 ?auto_762830 ) ) ( not ( = ?auto_762824 ?auto_762831 ) ) ( not ( = ?auto_762824 ?auto_762832 ) ) ( not ( = ?auto_762824 ?auto_762833 ) ) ( not ( = ?auto_762824 ?auto_762834 ) ) ( not ( = ?auto_762824 ?auto_762835 ) ) ( not ( = ?auto_762824 ?auto_762836 ) ) ( not ( = ?auto_762825 ?auto_762826 ) ) ( not ( = ?auto_762825 ?auto_762827 ) ) ( not ( = ?auto_762825 ?auto_762828 ) ) ( not ( = ?auto_762825 ?auto_762829 ) ) ( not ( = ?auto_762825 ?auto_762830 ) ) ( not ( = ?auto_762825 ?auto_762831 ) ) ( not ( = ?auto_762825 ?auto_762832 ) ) ( not ( = ?auto_762825 ?auto_762833 ) ) ( not ( = ?auto_762825 ?auto_762834 ) ) ( not ( = ?auto_762825 ?auto_762835 ) ) ( not ( = ?auto_762825 ?auto_762836 ) ) ( not ( = ?auto_762826 ?auto_762827 ) ) ( not ( = ?auto_762826 ?auto_762828 ) ) ( not ( = ?auto_762826 ?auto_762829 ) ) ( not ( = ?auto_762826 ?auto_762830 ) ) ( not ( = ?auto_762826 ?auto_762831 ) ) ( not ( = ?auto_762826 ?auto_762832 ) ) ( not ( = ?auto_762826 ?auto_762833 ) ) ( not ( = ?auto_762826 ?auto_762834 ) ) ( not ( = ?auto_762826 ?auto_762835 ) ) ( not ( = ?auto_762826 ?auto_762836 ) ) ( not ( = ?auto_762827 ?auto_762828 ) ) ( not ( = ?auto_762827 ?auto_762829 ) ) ( not ( = ?auto_762827 ?auto_762830 ) ) ( not ( = ?auto_762827 ?auto_762831 ) ) ( not ( = ?auto_762827 ?auto_762832 ) ) ( not ( = ?auto_762827 ?auto_762833 ) ) ( not ( = ?auto_762827 ?auto_762834 ) ) ( not ( = ?auto_762827 ?auto_762835 ) ) ( not ( = ?auto_762827 ?auto_762836 ) ) ( not ( = ?auto_762828 ?auto_762829 ) ) ( not ( = ?auto_762828 ?auto_762830 ) ) ( not ( = ?auto_762828 ?auto_762831 ) ) ( not ( = ?auto_762828 ?auto_762832 ) ) ( not ( = ?auto_762828 ?auto_762833 ) ) ( not ( = ?auto_762828 ?auto_762834 ) ) ( not ( = ?auto_762828 ?auto_762835 ) ) ( not ( = ?auto_762828 ?auto_762836 ) ) ( not ( = ?auto_762829 ?auto_762830 ) ) ( not ( = ?auto_762829 ?auto_762831 ) ) ( not ( = ?auto_762829 ?auto_762832 ) ) ( not ( = ?auto_762829 ?auto_762833 ) ) ( not ( = ?auto_762829 ?auto_762834 ) ) ( not ( = ?auto_762829 ?auto_762835 ) ) ( not ( = ?auto_762829 ?auto_762836 ) ) ( not ( = ?auto_762830 ?auto_762831 ) ) ( not ( = ?auto_762830 ?auto_762832 ) ) ( not ( = ?auto_762830 ?auto_762833 ) ) ( not ( = ?auto_762830 ?auto_762834 ) ) ( not ( = ?auto_762830 ?auto_762835 ) ) ( not ( = ?auto_762830 ?auto_762836 ) ) ( not ( = ?auto_762831 ?auto_762832 ) ) ( not ( = ?auto_762831 ?auto_762833 ) ) ( not ( = ?auto_762831 ?auto_762834 ) ) ( not ( = ?auto_762831 ?auto_762835 ) ) ( not ( = ?auto_762831 ?auto_762836 ) ) ( not ( = ?auto_762832 ?auto_762833 ) ) ( not ( = ?auto_762832 ?auto_762834 ) ) ( not ( = ?auto_762832 ?auto_762835 ) ) ( not ( = ?auto_762832 ?auto_762836 ) ) ( not ( = ?auto_762833 ?auto_762834 ) ) ( not ( = ?auto_762833 ?auto_762835 ) ) ( not ( = ?auto_762833 ?auto_762836 ) ) ( not ( = ?auto_762834 ?auto_762835 ) ) ( not ( = ?auto_762834 ?auto_762836 ) ) ( not ( = ?auto_762835 ?auto_762836 ) ) ( ON ?auto_762834 ?auto_762835 ) ( ON ?auto_762833 ?auto_762834 ) ( ON ?auto_762832 ?auto_762833 ) ( ON ?auto_762831 ?auto_762832 ) ( CLEAR ?auto_762829 ) ( ON ?auto_762830 ?auto_762831 ) ( CLEAR ?auto_762830 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_762820 ?auto_762821 ?auto_762822 ?auto_762823 ?auto_762824 ?auto_762825 ?auto_762826 ?auto_762827 ?auto_762828 ?auto_762829 ?auto_762830 )
      ( MAKE-16PILE ?auto_762820 ?auto_762821 ?auto_762822 ?auto_762823 ?auto_762824 ?auto_762825 ?auto_762826 ?auto_762827 ?auto_762828 ?auto_762829 ?auto_762830 ?auto_762831 ?auto_762832 ?auto_762833 ?auto_762834 ?auto_762835 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_762886 - BLOCK
      ?auto_762887 - BLOCK
      ?auto_762888 - BLOCK
      ?auto_762889 - BLOCK
      ?auto_762890 - BLOCK
      ?auto_762891 - BLOCK
      ?auto_762892 - BLOCK
      ?auto_762893 - BLOCK
      ?auto_762894 - BLOCK
      ?auto_762895 - BLOCK
      ?auto_762896 - BLOCK
      ?auto_762897 - BLOCK
      ?auto_762898 - BLOCK
      ?auto_762899 - BLOCK
      ?auto_762900 - BLOCK
      ?auto_762901 - BLOCK
    )
    :vars
    (
      ?auto_762902 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_762901 ?auto_762902 ) ( ON-TABLE ?auto_762886 ) ( ON ?auto_762887 ?auto_762886 ) ( ON ?auto_762888 ?auto_762887 ) ( ON ?auto_762889 ?auto_762888 ) ( ON ?auto_762890 ?auto_762889 ) ( ON ?auto_762891 ?auto_762890 ) ( ON ?auto_762892 ?auto_762891 ) ( ON ?auto_762893 ?auto_762892 ) ( ON ?auto_762894 ?auto_762893 ) ( not ( = ?auto_762886 ?auto_762887 ) ) ( not ( = ?auto_762886 ?auto_762888 ) ) ( not ( = ?auto_762886 ?auto_762889 ) ) ( not ( = ?auto_762886 ?auto_762890 ) ) ( not ( = ?auto_762886 ?auto_762891 ) ) ( not ( = ?auto_762886 ?auto_762892 ) ) ( not ( = ?auto_762886 ?auto_762893 ) ) ( not ( = ?auto_762886 ?auto_762894 ) ) ( not ( = ?auto_762886 ?auto_762895 ) ) ( not ( = ?auto_762886 ?auto_762896 ) ) ( not ( = ?auto_762886 ?auto_762897 ) ) ( not ( = ?auto_762886 ?auto_762898 ) ) ( not ( = ?auto_762886 ?auto_762899 ) ) ( not ( = ?auto_762886 ?auto_762900 ) ) ( not ( = ?auto_762886 ?auto_762901 ) ) ( not ( = ?auto_762886 ?auto_762902 ) ) ( not ( = ?auto_762887 ?auto_762888 ) ) ( not ( = ?auto_762887 ?auto_762889 ) ) ( not ( = ?auto_762887 ?auto_762890 ) ) ( not ( = ?auto_762887 ?auto_762891 ) ) ( not ( = ?auto_762887 ?auto_762892 ) ) ( not ( = ?auto_762887 ?auto_762893 ) ) ( not ( = ?auto_762887 ?auto_762894 ) ) ( not ( = ?auto_762887 ?auto_762895 ) ) ( not ( = ?auto_762887 ?auto_762896 ) ) ( not ( = ?auto_762887 ?auto_762897 ) ) ( not ( = ?auto_762887 ?auto_762898 ) ) ( not ( = ?auto_762887 ?auto_762899 ) ) ( not ( = ?auto_762887 ?auto_762900 ) ) ( not ( = ?auto_762887 ?auto_762901 ) ) ( not ( = ?auto_762887 ?auto_762902 ) ) ( not ( = ?auto_762888 ?auto_762889 ) ) ( not ( = ?auto_762888 ?auto_762890 ) ) ( not ( = ?auto_762888 ?auto_762891 ) ) ( not ( = ?auto_762888 ?auto_762892 ) ) ( not ( = ?auto_762888 ?auto_762893 ) ) ( not ( = ?auto_762888 ?auto_762894 ) ) ( not ( = ?auto_762888 ?auto_762895 ) ) ( not ( = ?auto_762888 ?auto_762896 ) ) ( not ( = ?auto_762888 ?auto_762897 ) ) ( not ( = ?auto_762888 ?auto_762898 ) ) ( not ( = ?auto_762888 ?auto_762899 ) ) ( not ( = ?auto_762888 ?auto_762900 ) ) ( not ( = ?auto_762888 ?auto_762901 ) ) ( not ( = ?auto_762888 ?auto_762902 ) ) ( not ( = ?auto_762889 ?auto_762890 ) ) ( not ( = ?auto_762889 ?auto_762891 ) ) ( not ( = ?auto_762889 ?auto_762892 ) ) ( not ( = ?auto_762889 ?auto_762893 ) ) ( not ( = ?auto_762889 ?auto_762894 ) ) ( not ( = ?auto_762889 ?auto_762895 ) ) ( not ( = ?auto_762889 ?auto_762896 ) ) ( not ( = ?auto_762889 ?auto_762897 ) ) ( not ( = ?auto_762889 ?auto_762898 ) ) ( not ( = ?auto_762889 ?auto_762899 ) ) ( not ( = ?auto_762889 ?auto_762900 ) ) ( not ( = ?auto_762889 ?auto_762901 ) ) ( not ( = ?auto_762889 ?auto_762902 ) ) ( not ( = ?auto_762890 ?auto_762891 ) ) ( not ( = ?auto_762890 ?auto_762892 ) ) ( not ( = ?auto_762890 ?auto_762893 ) ) ( not ( = ?auto_762890 ?auto_762894 ) ) ( not ( = ?auto_762890 ?auto_762895 ) ) ( not ( = ?auto_762890 ?auto_762896 ) ) ( not ( = ?auto_762890 ?auto_762897 ) ) ( not ( = ?auto_762890 ?auto_762898 ) ) ( not ( = ?auto_762890 ?auto_762899 ) ) ( not ( = ?auto_762890 ?auto_762900 ) ) ( not ( = ?auto_762890 ?auto_762901 ) ) ( not ( = ?auto_762890 ?auto_762902 ) ) ( not ( = ?auto_762891 ?auto_762892 ) ) ( not ( = ?auto_762891 ?auto_762893 ) ) ( not ( = ?auto_762891 ?auto_762894 ) ) ( not ( = ?auto_762891 ?auto_762895 ) ) ( not ( = ?auto_762891 ?auto_762896 ) ) ( not ( = ?auto_762891 ?auto_762897 ) ) ( not ( = ?auto_762891 ?auto_762898 ) ) ( not ( = ?auto_762891 ?auto_762899 ) ) ( not ( = ?auto_762891 ?auto_762900 ) ) ( not ( = ?auto_762891 ?auto_762901 ) ) ( not ( = ?auto_762891 ?auto_762902 ) ) ( not ( = ?auto_762892 ?auto_762893 ) ) ( not ( = ?auto_762892 ?auto_762894 ) ) ( not ( = ?auto_762892 ?auto_762895 ) ) ( not ( = ?auto_762892 ?auto_762896 ) ) ( not ( = ?auto_762892 ?auto_762897 ) ) ( not ( = ?auto_762892 ?auto_762898 ) ) ( not ( = ?auto_762892 ?auto_762899 ) ) ( not ( = ?auto_762892 ?auto_762900 ) ) ( not ( = ?auto_762892 ?auto_762901 ) ) ( not ( = ?auto_762892 ?auto_762902 ) ) ( not ( = ?auto_762893 ?auto_762894 ) ) ( not ( = ?auto_762893 ?auto_762895 ) ) ( not ( = ?auto_762893 ?auto_762896 ) ) ( not ( = ?auto_762893 ?auto_762897 ) ) ( not ( = ?auto_762893 ?auto_762898 ) ) ( not ( = ?auto_762893 ?auto_762899 ) ) ( not ( = ?auto_762893 ?auto_762900 ) ) ( not ( = ?auto_762893 ?auto_762901 ) ) ( not ( = ?auto_762893 ?auto_762902 ) ) ( not ( = ?auto_762894 ?auto_762895 ) ) ( not ( = ?auto_762894 ?auto_762896 ) ) ( not ( = ?auto_762894 ?auto_762897 ) ) ( not ( = ?auto_762894 ?auto_762898 ) ) ( not ( = ?auto_762894 ?auto_762899 ) ) ( not ( = ?auto_762894 ?auto_762900 ) ) ( not ( = ?auto_762894 ?auto_762901 ) ) ( not ( = ?auto_762894 ?auto_762902 ) ) ( not ( = ?auto_762895 ?auto_762896 ) ) ( not ( = ?auto_762895 ?auto_762897 ) ) ( not ( = ?auto_762895 ?auto_762898 ) ) ( not ( = ?auto_762895 ?auto_762899 ) ) ( not ( = ?auto_762895 ?auto_762900 ) ) ( not ( = ?auto_762895 ?auto_762901 ) ) ( not ( = ?auto_762895 ?auto_762902 ) ) ( not ( = ?auto_762896 ?auto_762897 ) ) ( not ( = ?auto_762896 ?auto_762898 ) ) ( not ( = ?auto_762896 ?auto_762899 ) ) ( not ( = ?auto_762896 ?auto_762900 ) ) ( not ( = ?auto_762896 ?auto_762901 ) ) ( not ( = ?auto_762896 ?auto_762902 ) ) ( not ( = ?auto_762897 ?auto_762898 ) ) ( not ( = ?auto_762897 ?auto_762899 ) ) ( not ( = ?auto_762897 ?auto_762900 ) ) ( not ( = ?auto_762897 ?auto_762901 ) ) ( not ( = ?auto_762897 ?auto_762902 ) ) ( not ( = ?auto_762898 ?auto_762899 ) ) ( not ( = ?auto_762898 ?auto_762900 ) ) ( not ( = ?auto_762898 ?auto_762901 ) ) ( not ( = ?auto_762898 ?auto_762902 ) ) ( not ( = ?auto_762899 ?auto_762900 ) ) ( not ( = ?auto_762899 ?auto_762901 ) ) ( not ( = ?auto_762899 ?auto_762902 ) ) ( not ( = ?auto_762900 ?auto_762901 ) ) ( not ( = ?auto_762900 ?auto_762902 ) ) ( not ( = ?auto_762901 ?auto_762902 ) ) ( ON ?auto_762900 ?auto_762901 ) ( ON ?auto_762899 ?auto_762900 ) ( ON ?auto_762898 ?auto_762899 ) ( ON ?auto_762897 ?auto_762898 ) ( ON ?auto_762896 ?auto_762897 ) ( CLEAR ?auto_762894 ) ( ON ?auto_762895 ?auto_762896 ) ( CLEAR ?auto_762895 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_762886 ?auto_762887 ?auto_762888 ?auto_762889 ?auto_762890 ?auto_762891 ?auto_762892 ?auto_762893 ?auto_762894 ?auto_762895 )
      ( MAKE-16PILE ?auto_762886 ?auto_762887 ?auto_762888 ?auto_762889 ?auto_762890 ?auto_762891 ?auto_762892 ?auto_762893 ?auto_762894 ?auto_762895 ?auto_762896 ?auto_762897 ?auto_762898 ?auto_762899 ?auto_762900 ?auto_762901 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_762952 - BLOCK
      ?auto_762953 - BLOCK
      ?auto_762954 - BLOCK
      ?auto_762955 - BLOCK
      ?auto_762956 - BLOCK
      ?auto_762957 - BLOCK
      ?auto_762958 - BLOCK
      ?auto_762959 - BLOCK
      ?auto_762960 - BLOCK
      ?auto_762961 - BLOCK
      ?auto_762962 - BLOCK
      ?auto_762963 - BLOCK
      ?auto_762964 - BLOCK
      ?auto_762965 - BLOCK
      ?auto_762966 - BLOCK
      ?auto_762967 - BLOCK
    )
    :vars
    (
      ?auto_762968 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_762967 ?auto_762968 ) ( ON-TABLE ?auto_762952 ) ( ON ?auto_762953 ?auto_762952 ) ( ON ?auto_762954 ?auto_762953 ) ( ON ?auto_762955 ?auto_762954 ) ( ON ?auto_762956 ?auto_762955 ) ( ON ?auto_762957 ?auto_762956 ) ( ON ?auto_762958 ?auto_762957 ) ( ON ?auto_762959 ?auto_762958 ) ( not ( = ?auto_762952 ?auto_762953 ) ) ( not ( = ?auto_762952 ?auto_762954 ) ) ( not ( = ?auto_762952 ?auto_762955 ) ) ( not ( = ?auto_762952 ?auto_762956 ) ) ( not ( = ?auto_762952 ?auto_762957 ) ) ( not ( = ?auto_762952 ?auto_762958 ) ) ( not ( = ?auto_762952 ?auto_762959 ) ) ( not ( = ?auto_762952 ?auto_762960 ) ) ( not ( = ?auto_762952 ?auto_762961 ) ) ( not ( = ?auto_762952 ?auto_762962 ) ) ( not ( = ?auto_762952 ?auto_762963 ) ) ( not ( = ?auto_762952 ?auto_762964 ) ) ( not ( = ?auto_762952 ?auto_762965 ) ) ( not ( = ?auto_762952 ?auto_762966 ) ) ( not ( = ?auto_762952 ?auto_762967 ) ) ( not ( = ?auto_762952 ?auto_762968 ) ) ( not ( = ?auto_762953 ?auto_762954 ) ) ( not ( = ?auto_762953 ?auto_762955 ) ) ( not ( = ?auto_762953 ?auto_762956 ) ) ( not ( = ?auto_762953 ?auto_762957 ) ) ( not ( = ?auto_762953 ?auto_762958 ) ) ( not ( = ?auto_762953 ?auto_762959 ) ) ( not ( = ?auto_762953 ?auto_762960 ) ) ( not ( = ?auto_762953 ?auto_762961 ) ) ( not ( = ?auto_762953 ?auto_762962 ) ) ( not ( = ?auto_762953 ?auto_762963 ) ) ( not ( = ?auto_762953 ?auto_762964 ) ) ( not ( = ?auto_762953 ?auto_762965 ) ) ( not ( = ?auto_762953 ?auto_762966 ) ) ( not ( = ?auto_762953 ?auto_762967 ) ) ( not ( = ?auto_762953 ?auto_762968 ) ) ( not ( = ?auto_762954 ?auto_762955 ) ) ( not ( = ?auto_762954 ?auto_762956 ) ) ( not ( = ?auto_762954 ?auto_762957 ) ) ( not ( = ?auto_762954 ?auto_762958 ) ) ( not ( = ?auto_762954 ?auto_762959 ) ) ( not ( = ?auto_762954 ?auto_762960 ) ) ( not ( = ?auto_762954 ?auto_762961 ) ) ( not ( = ?auto_762954 ?auto_762962 ) ) ( not ( = ?auto_762954 ?auto_762963 ) ) ( not ( = ?auto_762954 ?auto_762964 ) ) ( not ( = ?auto_762954 ?auto_762965 ) ) ( not ( = ?auto_762954 ?auto_762966 ) ) ( not ( = ?auto_762954 ?auto_762967 ) ) ( not ( = ?auto_762954 ?auto_762968 ) ) ( not ( = ?auto_762955 ?auto_762956 ) ) ( not ( = ?auto_762955 ?auto_762957 ) ) ( not ( = ?auto_762955 ?auto_762958 ) ) ( not ( = ?auto_762955 ?auto_762959 ) ) ( not ( = ?auto_762955 ?auto_762960 ) ) ( not ( = ?auto_762955 ?auto_762961 ) ) ( not ( = ?auto_762955 ?auto_762962 ) ) ( not ( = ?auto_762955 ?auto_762963 ) ) ( not ( = ?auto_762955 ?auto_762964 ) ) ( not ( = ?auto_762955 ?auto_762965 ) ) ( not ( = ?auto_762955 ?auto_762966 ) ) ( not ( = ?auto_762955 ?auto_762967 ) ) ( not ( = ?auto_762955 ?auto_762968 ) ) ( not ( = ?auto_762956 ?auto_762957 ) ) ( not ( = ?auto_762956 ?auto_762958 ) ) ( not ( = ?auto_762956 ?auto_762959 ) ) ( not ( = ?auto_762956 ?auto_762960 ) ) ( not ( = ?auto_762956 ?auto_762961 ) ) ( not ( = ?auto_762956 ?auto_762962 ) ) ( not ( = ?auto_762956 ?auto_762963 ) ) ( not ( = ?auto_762956 ?auto_762964 ) ) ( not ( = ?auto_762956 ?auto_762965 ) ) ( not ( = ?auto_762956 ?auto_762966 ) ) ( not ( = ?auto_762956 ?auto_762967 ) ) ( not ( = ?auto_762956 ?auto_762968 ) ) ( not ( = ?auto_762957 ?auto_762958 ) ) ( not ( = ?auto_762957 ?auto_762959 ) ) ( not ( = ?auto_762957 ?auto_762960 ) ) ( not ( = ?auto_762957 ?auto_762961 ) ) ( not ( = ?auto_762957 ?auto_762962 ) ) ( not ( = ?auto_762957 ?auto_762963 ) ) ( not ( = ?auto_762957 ?auto_762964 ) ) ( not ( = ?auto_762957 ?auto_762965 ) ) ( not ( = ?auto_762957 ?auto_762966 ) ) ( not ( = ?auto_762957 ?auto_762967 ) ) ( not ( = ?auto_762957 ?auto_762968 ) ) ( not ( = ?auto_762958 ?auto_762959 ) ) ( not ( = ?auto_762958 ?auto_762960 ) ) ( not ( = ?auto_762958 ?auto_762961 ) ) ( not ( = ?auto_762958 ?auto_762962 ) ) ( not ( = ?auto_762958 ?auto_762963 ) ) ( not ( = ?auto_762958 ?auto_762964 ) ) ( not ( = ?auto_762958 ?auto_762965 ) ) ( not ( = ?auto_762958 ?auto_762966 ) ) ( not ( = ?auto_762958 ?auto_762967 ) ) ( not ( = ?auto_762958 ?auto_762968 ) ) ( not ( = ?auto_762959 ?auto_762960 ) ) ( not ( = ?auto_762959 ?auto_762961 ) ) ( not ( = ?auto_762959 ?auto_762962 ) ) ( not ( = ?auto_762959 ?auto_762963 ) ) ( not ( = ?auto_762959 ?auto_762964 ) ) ( not ( = ?auto_762959 ?auto_762965 ) ) ( not ( = ?auto_762959 ?auto_762966 ) ) ( not ( = ?auto_762959 ?auto_762967 ) ) ( not ( = ?auto_762959 ?auto_762968 ) ) ( not ( = ?auto_762960 ?auto_762961 ) ) ( not ( = ?auto_762960 ?auto_762962 ) ) ( not ( = ?auto_762960 ?auto_762963 ) ) ( not ( = ?auto_762960 ?auto_762964 ) ) ( not ( = ?auto_762960 ?auto_762965 ) ) ( not ( = ?auto_762960 ?auto_762966 ) ) ( not ( = ?auto_762960 ?auto_762967 ) ) ( not ( = ?auto_762960 ?auto_762968 ) ) ( not ( = ?auto_762961 ?auto_762962 ) ) ( not ( = ?auto_762961 ?auto_762963 ) ) ( not ( = ?auto_762961 ?auto_762964 ) ) ( not ( = ?auto_762961 ?auto_762965 ) ) ( not ( = ?auto_762961 ?auto_762966 ) ) ( not ( = ?auto_762961 ?auto_762967 ) ) ( not ( = ?auto_762961 ?auto_762968 ) ) ( not ( = ?auto_762962 ?auto_762963 ) ) ( not ( = ?auto_762962 ?auto_762964 ) ) ( not ( = ?auto_762962 ?auto_762965 ) ) ( not ( = ?auto_762962 ?auto_762966 ) ) ( not ( = ?auto_762962 ?auto_762967 ) ) ( not ( = ?auto_762962 ?auto_762968 ) ) ( not ( = ?auto_762963 ?auto_762964 ) ) ( not ( = ?auto_762963 ?auto_762965 ) ) ( not ( = ?auto_762963 ?auto_762966 ) ) ( not ( = ?auto_762963 ?auto_762967 ) ) ( not ( = ?auto_762963 ?auto_762968 ) ) ( not ( = ?auto_762964 ?auto_762965 ) ) ( not ( = ?auto_762964 ?auto_762966 ) ) ( not ( = ?auto_762964 ?auto_762967 ) ) ( not ( = ?auto_762964 ?auto_762968 ) ) ( not ( = ?auto_762965 ?auto_762966 ) ) ( not ( = ?auto_762965 ?auto_762967 ) ) ( not ( = ?auto_762965 ?auto_762968 ) ) ( not ( = ?auto_762966 ?auto_762967 ) ) ( not ( = ?auto_762966 ?auto_762968 ) ) ( not ( = ?auto_762967 ?auto_762968 ) ) ( ON ?auto_762966 ?auto_762967 ) ( ON ?auto_762965 ?auto_762966 ) ( ON ?auto_762964 ?auto_762965 ) ( ON ?auto_762963 ?auto_762964 ) ( ON ?auto_762962 ?auto_762963 ) ( ON ?auto_762961 ?auto_762962 ) ( CLEAR ?auto_762959 ) ( ON ?auto_762960 ?auto_762961 ) ( CLEAR ?auto_762960 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_762952 ?auto_762953 ?auto_762954 ?auto_762955 ?auto_762956 ?auto_762957 ?auto_762958 ?auto_762959 ?auto_762960 )
      ( MAKE-16PILE ?auto_762952 ?auto_762953 ?auto_762954 ?auto_762955 ?auto_762956 ?auto_762957 ?auto_762958 ?auto_762959 ?auto_762960 ?auto_762961 ?auto_762962 ?auto_762963 ?auto_762964 ?auto_762965 ?auto_762966 ?auto_762967 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_763018 - BLOCK
      ?auto_763019 - BLOCK
      ?auto_763020 - BLOCK
      ?auto_763021 - BLOCK
      ?auto_763022 - BLOCK
      ?auto_763023 - BLOCK
      ?auto_763024 - BLOCK
      ?auto_763025 - BLOCK
      ?auto_763026 - BLOCK
      ?auto_763027 - BLOCK
      ?auto_763028 - BLOCK
      ?auto_763029 - BLOCK
      ?auto_763030 - BLOCK
      ?auto_763031 - BLOCK
      ?auto_763032 - BLOCK
      ?auto_763033 - BLOCK
    )
    :vars
    (
      ?auto_763034 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_763033 ?auto_763034 ) ( ON-TABLE ?auto_763018 ) ( ON ?auto_763019 ?auto_763018 ) ( ON ?auto_763020 ?auto_763019 ) ( ON ?auto_763021 ?auto_763020 ) ( ON ?auto_763022 ?auto_763021 ) ( ON ?auto_763023 ?auto_763022 ) ( ON ?auto_763024 ?auto_763023 ) ( not ( = ?auto_763018 ?auto_763019 ) ) ( not ( = ?auto_763018 ?auto_763020 ) ) ( not ( = ?auto_763018 ?auto_763021 ) ) ( not ( = ?auto_763018 ?auto_763022 ) ) ( not ( = ?auto_763018 ?auto_763023 ) ) ( not ( = ?auto_763018 ?auto_763024 ) ) ( not ( = ?auto_763018 ?auto_763025 ) ) ( not ( = ?auto_763018 ?auto_763026 ) ) ( not ( = ?auto_763018 ?auto_763027 ) ) ( not ( = ?auto_763018 ?auto_763028 ) ) ( not ( = ?auto_763018 ?auto_763029 ) ) ( not ( = ?auto_763018 ?auto_763030 ) ) ( not ( = ?auto_763018 ?auto_763031 ) ) ( not ( = ?auto_763018 ?auto_763032 ) ) ( not ( = ?auto_763018 ?auto_763033 ) ) ( not ( = ?auto_763018 ?auto_763034 ) ) ( not ( = ?auto_763019 ?auto_763020 ) ) ( not ( = ?auto_763019 ?auto_763021 ) ) ( not ( = ?auto_763019 ?auto_763022 ) ) ( not ( = ?auto_763019 ?auto_763023 ) ) ( not ( = ?auto_763019 ?auto_763024 ) ) ( not ( = ?auto_763019 ?auto_763025 ) ) ( not ( = ?auto_763019 ?auto_763026 ) ) ( not ( = ?auto_763019 ?auto_763027 ) ) ( not ( = ?auto_763019 ?auto_763028 ) ) ( not ( = ?auto_763019 ?auto_763029 ) ) ( not ( = ?auto_763019 ?auto_763030 ) ) ( not ( = ?auto_763019 ?auto_763031 ) ) ( not ( = ?auto_763019 ?auto_763032 ) ) ( not ( = ?auto_763019 ?auto_763033 ) ) ( not ( = ?auto_763019 ?auto_763034 ) ) ( not ( = ?auto_763020 ?auto_763021 ) ) ( not ( = ?auto_763020 ?auto_763022 ) ) ( not ( = ?auto_763020 ?auto_763023 ) ) ( not ( = ?auto_763020 ?auto_763024 ) ) ( not ( = ?auto_763020 ?auto_763025 ) ) ( not ( = ?auto_763020 ?auto_763026 ) ) ( not ( = ?auto_763020 ?auto_763027 ) ) ( not ( = ?auto_763020 ?auto_763028 ) ) ( not ( = ?auto_763020 ?auto_763029 ) ) ( not ( = ?auto_763020 ?auto_763030 ) ) ( not ( = ?auto_763020 ?auto_763031 ) ) ( not ( = ?auto_763020 ?auto_763032 ) ) ( not ( = ?auto_763020 ?auto_763033 ) ) ( not ( = ?auto_763020 ?auto_763034 ) ) ( not ( = ?auto_763021 ?auto_763022 ) ) ( not ( = ?auto_763021 ?auto_763023 ) ) ( not ( = ?auto_763021 ?auto_763024 ) ) ( not ( = ?auto_763021 ?auto_763025 ) ) ( not ( = ?auto_763021 ?auto_763026 ) ) ( not ( = ?auto_763021 ?auto_763027 ) ) ( not ( = ?auto_763021 ?auto_763028 ) ) ( not ( = ?auto_763021 ?auto_763029 ) ) ( not ( = ?auto_763021 ?auto_763030 ) ) ( not ( = ?auto_763021 ?auto_763031 ) ) ( not ( = ?auto_763021 ?auto_763032 ) ) ( not ( = ?auto_763021 ?auto_763033 ) ) ( not ( = ?auto_763021 ?auto_763034 ) ) ( not ( = ?auto_763022 ?auto_763023 ) ) ( not ( = ?auto_763022 ?auto_763024 ) ) ( not ( = ?auto_763022 ?auto_763025 ) ) ( not ( = ?auto_763022 ?auto_763026 ) ) ( not ( = ?auto_763022 ?auto_763027 ) ) ( not ( = ?auto_763022 ?auto_763028 ) ) ( not ( = ?auto_763022 ?auto_763029 ) ) ( not ( = ?auto_763022 ?auto_763030 ) ) ( not ( = ?auto_763022 ?auto_763031 ) ) ( not ( = ?auto_763022 ?auto_763032 ) ) ( not ( = ?auto_763022 ?auto_763033 ) ) ( not ( = ?auto_763022 ?auto_763034 ) ) ( not ( = ?auto_763023 ?auto_763024 ) ) ( not ( = ?auto_763023 ?auto_763025 ) ) ( not ( = ?auto_763023 ?auto_763026 ) ) ( not ( = ?auto_763023 ?auto_763027 ) ) ( not ( = ?auto_763023 ?auto_763028 ) ) ( not ( = ?auto_763023 ?auto_763029 ) ) ( not ( = ?auto_763023 ?auto_763030 ) ) ( not ( = ?auto_763023 ?auto_763031 ) ) ( not ( = ?auto_763023 ?auto_763032 ) ) ( not ( = ?auto_763023 ?auto_763033 ) ) ( not ( = ?auto_763023 ?auto_763034 ) ) ( not ( = ?auto_763024 ?auto_763025 ) ) ( not ( = ?auto_763024 ?auto_763026 ) ) ( not ( = ?auto_763024 ?auto_763027 ) ) ( not ( = ?auto_763024 ?auto_763028 ) ) ( not ( = ?auto_763024 ?auto_763029 ) ) ( not ( = ?auto_763024 ?auto_763030 ) ) ( not ( = ?auto_763024 ?auto_763031 ) ) ( not ( = ?auto_763024 ?auto_763032 ) ) ( not ( = ?auto_763024 ?auto_763033 ) ) ( not ( = ?auto_763024 ?auto_763034 ) ) ( not ( = ?auto_763025 ?auto_763026 ) ) ( not ( = ?auto_763025 ?auto_763027 ) ) ( not ( = ?auto_763025 ?auto_763028 ) ) ( not ( = ?auto_763025 ?auto_763029 ) ) ( not ( = ?auto_763025 ?auto_763030 ) ) ( not ( = ?auto_763025 ?auto_763031 ) ) ( not ( = ?auto_763025 ?auto_763032 ) ) ( not ( = ?auto_763025 ?auto_763033 ) ) ( not ( = ?auto_763025 ?auto_763034 ) ) ( not ( = ?auto_763026 ?auto_763027 ) ) ( not ( = ?auto_763026 ?auto_763028 ) ) ( not ( = ?auto_763026 ?auto_763029 ) ) ( not ( = ?auto_763026 ?auto_763030 ) ) ( not ( = ?auto_763026 ?auto_763031 ) ) ( not ( = ?auto_763026 ?auto_763032 ) ) ( not ( = ?auto_763026 ?auto_763033 ) ) ( not ( = ?auto_763026 ?auto_763034 ) ) ( not ( = ?auto_763027 ?auto_763028 ) ) ( not ( = ?auto_763027 ?auto_763029 ) ) ( not ( = ?auto_763027 ?auto_763030 ) ) ( not ( = ?auto_763027 ?auto_763031 ) ) ( not ( = ?auto_763027 ?auto_763032 ) ) ( not ( = ?auto_763027 ?auto_763033 ) ) ( not ( = ?auto_763027 ?auto_763034 ) ) ( not ( = ?auto_763028 ?auto_763029 ) ) ( not ( = ?auto_763028 ?auto_763030 ) ) ( not ( = ?auto_763028 ?auto_763031 ) ) ( not ( = ?auto_763028 ?auto_763032 ) ) ( not ( = ?auto_763028 ?auto_763033 ) ) ( not ( = ?auto_763028 ?auto_763034 ) ) ( not ( = ?auto_763029 ?auto_763030 ) ) ( not ( = ?auto_763029 ?auto_763031 ) ) ( not ( = ?auto_763029 ?auto_763032 ) ) ( not ( = ?auto_763029 ?auto_763033 ) ) ( not ( = ?auto_763029 ?auto_763034 ) ) ( not ( = ?auto_763030 ?auto_763031 ) ) ( not ( = ?auto_763030 ?auto_763032 ) ) ( not ( = ?auto_763030 ?auto_763033 ) ) ( not ( = ?auto_763030 ?auto_763034 ) ) ( not ( = ?auto_763031 ?auto_763032 ) ) ( not ( = ?auto_763031 ?auto_763033 ) ) ( not ( = ?auto_763031 ?auto_763034 ) ) ( not ( = ?auto_763032 ?auto_763033 ) ) ( not ( = ?auto_763032 ?auto_763034 ) ) ( not ( = ?auto_763033 ?auto_763034 ) ) ( ON ?auto_763032 ?auto_763033 ) ( ON ?auto_763031 ?auto_763032 ) ( ON ?auto_763030 ?auto_763031 ) ( ON ?auto_763029 ?auto_763030 ) ( ON ?auto_763028 ?auto_763029 ) ( ON ?auto_763027 ?auto_763028 ) ( ON ?auto_763026 ?auto_763027 ) ( CLEAR ?auto_763024 ) ( ON ?auto_763025 ?auto_763026 ) ( CLEAR ?auto_763025 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_763018 ?auto_763019 ?auto_763020 ?auto_763021 ?auto_763022 ?auto_763023 ?auto_763024 ?auto_763025 )
      ( MAKE-16PILE ?auto_763018 ?auto_763019 ?auto_763020 ?auto_763021 ?auto_763022 ?auto_763023 ?auto_763024 ?auto_763025 ?auto_763026 ?auto_763027 ?auto_763028 ?auto_763029 ?auto_763030 ?auto_763031 ?auto_763032 ?auto_763033 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_763084 - BLOCK
      ?auto_763085 - BLOCK
      ?auto_763086 - BLOCK
      ?auto_763087 - BLOCK
      ?auto_763088 - BLOCK
      ?auto_763089 - BLOCK
      ?auto_763090 - BLOCK
      ?auto_763091 - BLOCK
      ?auto_763092 - BLOCK
      ?auto_763093 - BLOCK
      ?auto_763094 - BLOCK
      ?auto_763095 - BLOCK
      ?auto_763096 - BLOCK
      ?auto_763097 - BLOCK
      ?auto_763098 - BLOCK
      ?auto_763099 - BLOCK
    )
    :vars
    (
      ?auto_763100 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_763099 ?auto_763100 ) ( ON-TABLE ?auto_763084 ) ( ON ?auto_763085 ?auto_763084 ) ( ON ?auto_763086 ?auto_763085 ) ( ON ?auto_763087 ?auto_763086 ) ( ON ?auto_763088 ?auto_763087 ) ( ON ?auto_763089 ?auto_763088 ) ( not ( = ?auto_763084 ?auto_763085 ) ) ( not ( = ?auto_763084 ?auto_763086 ) ) ( not ( = ?auto_763084 ?auto_763087 ) ) ( not ( = ?auto_763084 ?auto_763088 ) ) ( not ( = ?auto_763084 ?auto_763089 ) ) ( not ( = ?auto_763084 ?auto_763090 ) ) ( not ( = ?auto_763084 ?auto_763091 ) ) ( not ( = ?auto_763084 ?auto_763092 ) ) ( not ( = ?auto_763084 ?auto_763093 ) ) ( not ( = ?auto_763084 ?auto_763094 ) ) ( not ( = ?auto_763084 ?auto_763095 ) ) ( not ( = ?auto_763084 ?auto_763096 ) ) ( not ( = ?auto_763084 ?auto_763097 ) ) ( not ( = ?auto_763084 ?auto_763098 ) ) ( not ( = ?auto_763084 ?auto_763099 ) ) ( not ( = ?auto_763084 ?auto_763100 ) ) ( not ( = ?auto_763085 ?auto_763086 ) ) ( not ( = ?auto_763085 ?auto_763087 ) ) ( not ( = ?auto_763085 ?auto_763088 ) ) ( not ( = ?auto_763085 ?auto_763089 ) ) ( not ( = ?auto_763085 ?auto_763090 ) ) ( not ( = ?auto_763085 ?auto_763091 ) ) ( not ( = ?auto_763085 ?auto_763092 ) ) ( not ( = ?auto_763085 ?auto_763093 ) ) ( not ( = ?auto_763085 ?auto_763094 ) ) ( not ( = ?auto_763085 ?auto_763095 ) ) ( not ( = ?auto_763085 ?auto_763096 ) ) ( not ( = ?auto_763085 ?auto_763097 ) ) ( not ( = ?auto_763085 ?auto_763098 ) ) ( not ( = ?auto_763085 ?auto_763099 ) ) ( not ( = ?auto_763085 ?auto_763100 ) ) ( not ( = ?auto_763086 ?auto_763087 ) ) ( not ( = ?auto_763086 ?auto_763088 ) ) ( not ( = ?auto_763086 ?auto_763089 ) ) ( not ( = ?auto_763086 ?auto_763090 ) ) ( not ( = ?auto_763086 ?auto_763091 ) ) ( not ( = ?auto_763086 ?auto_763092 ) ) ( not ( = ?auto_763086 ?auto_763093 ) ) ( not ( = ?auto_763086 ?auto_763094 ) ) ( not ( = ?auto_763086 ?auto_763095 ) ) ( not ( = ?auto_763086 ?auto_763096 ) ) ( not ( = ?auto_763086 ?auto_763097 ) ) ( not ( = ?auto_763086 ?auto_763098 ) ) ( not ( = ?auto_763086 ?auto_763099 ) ) ( not ( = ?auto_763086 ?auto_763100 ) ) ( not ( = ?auto_763087 ?auto_763088 ) ) ( not ( = ?auto_763087 ?auto_763089 ) ) ( not ( = ?auto_763087 ?auto_763090 ) ) ( not ( = ?auto_763087 ?auto_763091 ) ) ( not ( = ?auto_763087 ?auto_763092 ) ) ( not ( = ?auto_763087 ?auto_763093 ) ) ( not ( = ?auto_763087 ?auto_763094 ) ) ( not ( = ?auto_763087 ?auto_763095 ) ) ( not ( = ?auto_763087 ?auto_763096 ) ) ( not ( = ?auto_763087 ?auto_763097 ) ) ( not ( = ?auto_763087 ?auto_763098 ) ) ( not ( = ?auto_763087 ?auto_763099 ) ) ( not ( = ?auto_763087 ?auto_763100 ) ) ( not ( = ?auto_763088 ?auto_763089 ) ) ( not ( = ?auto_763088 ?auto_763090 ) ) ( not ( = ?auto_763088 ?auto_763091 ) ) ( not ( = ?auto_763088 ?auto_763092 ) ) ( not ( = ?auto_763088 ?auto_763093 ) ) ( not ( = ?auto_763088 ?auto_763094 ) ) ( not ( = ?auto_763088 ?auto_763095 ) ) ( not ( = ?auto_763088 ?auto_763096 ) ) ( not ( = ?auto_763088 ?auto_763097 ) ) ( not ( = ?auto_763088 ?auto_763098 ) ) ( not ( = ?auto_763088 ?auto_763099 ) ) ( not ( = ?auto_763088 ?auto_763100 ) ) ( not ( = ?auto_763089 ?auto_763090 ) ) ( not ( = ?auto_763089 ?auto_763091 ) ) ( not ( = ?auto_763089 ?auto_763092 ) ) ( not ( = ?auto_763089 ?auto_763093 ) ) ( not ( = ?auto_763089 ?auto_763094 ) ) ( not ( = ?auto_763089 ?auto_763095 ) ) ( not ( = ?auto_763089 ?auto_763096 ) ) ( not ( = ?auto_763089 ?auto_763097 ) ) ( not ( = ?auto_763089 ?auto_763098 ) ) ( not ( = ?auto_763089 ?auto_763099 ) ) ( not ( = ?auto_763089 ?auto_763100 ) ) ( not ( = ?auto_763090 ?auto_763091 ) ) ( not ( = ?auto_763090 ?auto_763092 ) ) ( not ( = ?auto_763090 ?auto_763093 ) ) ( not ( = ?auto_763090 ?auto_763094 ) ) ( not ( = ?auto_763090 ?auto_763095 ) ) ( not ( = ?auto_763090 ?auto_763096 ) ) ( not ( = ?auto_763090 ?auto_763097 ) ) ( not ( = ?auto_763090 ?auto_763098 ) ) ( not ( = ?auto_763090 ?auto_763099 ) ) ( not ( = ?auto_763090 ?auto_763100 ) ) ( not ( = ?auto_763091 ?auto_763092 ) ) ( not ( = ?auto_763091 ?auto_763093 ) ) ( not ( = ?auto_763091 ?auto_763094 ) ) ( not ( = ?auto_763091 ?auto_763095 ) ) ( not ( = ?auto_763091 ?auto_763096 ) ) ( not ( = ?auto_763091 ?auto_763097 ) ) ( not ( = ?auto_763091 ?auto_763098 ) ) ( not ( = ?auto_763091 ?auto_763099 ) ) ( not ( = ?auto_763091 ?auto_763100 ) ) ( not ( = ?auto_763092 ?auto_763093 ) ) ( not ( = ?auto_763092 ?auto_763094 ) ) ( not ( = ?auto_763092 ?auto_763095 ) ) ( not ( = ?auto_763092 ?auto_763096 ) ) ( not ( = ?auto_763092 ?auto_763097 ) ) ( not ( = ?auto_763092 ?auto_763098 ) ) ( not ( = ?auto_763092 ?auto_763099 ) ) ( not ( = ?auto_763092 ?auto_763100 ) ) ( not ( = ?auto_763093 ?auto_763094 ) ) ( not ( = ?auto_763093 ?auto_763095 ) ) ( not ( = ?auto_763093 ?auto_763096 ) ) ( not ( = ?auto_763093 ?auto_763097 ) ) ( not ( = ?auto_763093 ?auto_763098 ) ) ( not ( = ?auto_763093 ?auto_763099 ) ) ( not ( = ?auto_763093 ?auto_763100 ) ) ( not ( = ?auto_763094 ?auto_763095 ) ) ( not ( = ?auto_763094 ?auto_763096 ) ) ( not ( = ?auto_763094 ?auto_763097 ) ) ( not ( = ?auto_763094 ?auto_763098 ) ) ( not ( = ?auto_763094 ?auto_763099 ) ) ( not ( = ?auto_763094 ?auto_763100 ) ) ( not ( = ?auto_763095 ?auto_763096 ) ) ( not ( = ?auto_763095 ?auto_763097 ) ) ( not ( = ?auto_763095 ?auto_763098 ) ) ( not ( = ?auto_763095 ?auto_763099 ) ) ( not ( = ?auto_763095 ?auto_763100 ) ) ( not ( = ?auto_763096 ?auto_763097 ) ) ( not ( = ?auto_763096 ?auto_763098 ) ) ( not ( = ?auto_763096 ?auto_763099 ) ) ( not ( = ?auto_763096 ?auto_763100 ) ) ( not ( = ?auto_763097 ?auto_763098 ) ) ( not ( = ?auto_763097 ?auto_763099 ) ) ( not ( = ?auto_763097 ?auto_763100 ) ) ( not ( = ?auto_763098 ?auto_763099 ) ) ( not ( = ?auto_763098 ?auto_763100 ) ) ( not ( = ?auto_763099 ?auto_763100 ) ) ( ON ?auto_763098 ?auto_763099 ) ( ON ?auto_763097 ?auto_763098 ) ( ON ?auto_763096 ?auto_763097 ) ( ON ?auto_763095 ?auto_763096 ) ( ON ?auto_763094 ?auto_763095 ) ( ON ?auto_763093 ?auto_763094 ) ( ON ?auto_763092 ?auto_763093 ) ( ON ?auto_763091 ?auto_763092 ) ( CLEAR ?auto_763089 ) ( ON ?auto_763090 ?auto_763091 ) ( CLEAR ?auto_763090 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_763084 ?auto_763085 ?auto_763086 ?auto_763087 ?auto_763088 ?auto_763089 ?auto_763090 )
      ( MAKE-16PILE ?auto_763084 ?auto_763085 ?auto_763086 ?auto_763087 ?auto_763088 ?auto_763089 ?auto_763090 ?auto_763091 ?auto_763092 ?auto_763093 ?auto_763094 ?auto_763095 ?auto_763096 ?auto_763097 ?auto_763098 ?auto_763099 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_763150 - BLOCK
      ?auto_763151 - BLOCK
      ?auto_763152 - BLOCK
      ?auto_763153 - BLOCK
      ?auto_763154 - BLOCK
      ?auto_763155 - BLOCK
      ?auto_763156 - BLOCK
      ?auto_763157 - BLOCK
      ?auto_763158 - BLOCK
      ?auto_763159 - BLOCK
      ?auto_763160 - BLOCK
      ?auto_763161 - BLOCK
      ?auto_763162 - BLOCK
      ?auto_763163 - BLOCK
      ?auto_763164 - BLOCK
      ?auto_763165 - BLOCK
    )
    :vars
    (
      ?auto_763166 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_763165 ?auto_763166 ) ( ON-TABLE ?auto_763150 ) ( ON ?auto_763151 ?auto_763150 ) ( ON ?auto_763152 ?auto_763151 ) ( ON ?auto_763153 ?auto_763152 ) ( ON ?auto_763154 ?auto_763153 ) ( not ( = ?auto_763150 ?auto_763151 ) ) ( not ( = ?auto_763150 ?auto_763152 ) ) ( not ( = ?auto_763150 ?auto_763153 ) ) ( not ( = ?auto_763150 ?auto_763154 ) ) ( not ( = ?auto_763150 ?auto_763155 ) ) ( not ( = ?auto_763150 ?auto_763156 ) ) ( not ( = ?auto_763150 ?auto_763157 ) ) ( not ( = ?auto_763150 ?auto_763158 ) ) ( not ( = ?auto_763150 ?auto_763159 ) ) ( not ( = ?auto_763150 ?auto_763160 ) ) ( not ( = ?auto_763150 ?auto_763161 ) ) ( not ( = ?auto_763150 ?auto_763162 ) ) ( not ( = ?auto_763150 ?auto_763163 ) ) ( not ( = ?auto_763150 ?auto_763164 ) ) ( not ( = ?auto_763150 ?auto_763165 ) ) ( not ( = ?auto_763150 ?auto_763166 ) ) ( not ( = ?auto_763151 ?auto_763152 ) ) ( not ( = ?auto_763151 ?auto_763153 ) ) ( not ( = ?auto_763151 ?auto_763154 ) ) ( not ( = ?auto_763151 ?auto_763155 ) ) ( not ( = ?auto_763151 ?auto_763156 ) ) ( not ( = ?auto_763151 ?auto_763157 ) ) ( not ( = ?auto_763151 ?auto_763158 ) ) ( not ( = ?auto_763151 ?auto_763159 ) ) ( not ( = ?auto_763151 ?auto_763160 ) ) ( not ( = ?auto_763151 ?auto_763161 ) ) ( not ( = ?auto_763151 ?auto_763162 ) ) ( not ( = ?auto_763151 ?auto_763163 ) ) ( not ( = ?auto_763151 ?auto_763164 ) ) ( not ( = ?auto_763151 ?auto_763165 ) ) ( not ( = ?auto_763151 ?auto_763166 ) ) ( not ( = ?auto_763152 ?auto_763153 ) ) ( not ( = ?auto_763152 ?auto_763154 ) ) ( not ( = ?auto_763152 ?auto_763155 ) ) ( not ( = ?auto_763152 ?auto_763156 ) ) ( not ( = ?auto_763152 ?auto_763157 ) ) ( not ( = ?auto_763152 ?auto_763158 ) ) ( not ( = ?auto_763152 ?auto_763159 ) ) ( not ( = ?auto_763152 ?auto_763160 ) ) ( not ( = ?auto_763152 ?auto_763161 ) ) ( not ( = ?auto_763152 ?auto_763162 ) ) ( not ( = ?auto_763152 ?auto_763163 ) ) ( not ( = ?auto_763152 ?auto_763164 ) ) ( not ( = ?auto_763152 ?auto_763165 ) ) ( not ( = ?auto_763152 ?auto_763166 ) ) ( not ( = ?auto_763153 ?auto_763154 ) ) ( not ( = ?auto_763153 ?auto_763155 ) ) ( not ( = ?auto_763153 ?auto_763156 ) ) ( not ( = ?auto_763153 ?auto_763157 ) ) ( not ( = ?auto_763153 ?auto_763158 ) ) ( not ( = ?auto_763153 ?auto_763159 ) ) ( not ( = ?auto_763153 ?auto_763160 ) ) ( not ( = ?auto_763153 ?auto_763161 ) ) ( not ( = ?auto_763153 ?auto_763162 ) ) ( not ( = ?auto_763153 ?auto_763163 ) ) ( not ( = ?auto_763153 ?auto_763164 ) ) ( not ( = ?auto_763153 ?auto_763165 ) ) ( not ( = ?auto_763153 ?auto_763166 ) ) ( not ( = ?auto_763154 ?auto_763155 ) ) ( not ( = ?auto_763154 ?auto_763156 ) ) ( not ( = ?auto_763154 ?auto_763157 ) ) ( not ( = ?auto_763154 ?auto_763158 ) ) ( not ( = ?auto_763154 ?auto_763159 ) ) ( not ( = ?auto_763154 ?auto_763160 ) ) ( not ( = ?auto_763154 ?auto_763161 ) ) ( not ( = ?auto_763154 ?auto_763162 ) ) ( not ( = ?auto_763154 ?auto_763163 ) ) ( not ( = ?auto_763154 ?auto_763164 ) ) ( not ( = ?auto_763154 ?auto_763165 ) ) ( not ( = ?auto_763154 ?auto_763166 ) ) ( not ( = ?auto_763155 ?auto_763156 ) ) ( not ( = ?auto_763155 ?auto_763157 ) ) ( not ( = ?auto_763155 ?auto_763158 ) ) ( not ( = ?auto_763155 ?auto_763159 ) ) ( not ( = ?auto_763155 ?auto_763160 ) ) ( not ( = ?auto_763155 ?auto_763161 ) ) ( not ( = ?auto_763155 ?auto_763162 ) ) ( not ( = ?auto_763155 ?auto_763163 ) ) ( not ( = ?auto_763155 ?auto_763164 ) ) ( not ( = ?auto_763155 ?auto_763165 ) ) ( not ( = ?auto_763155 ?auto_763166 ) ) ( not ( = ?auto_763156 ?auto_763157 ) ) ( not ( = ?auto_763156 ?auto_763158 ) ) ( not ( = ?auto_763156 ?auto_763159 ) ) ( not ( = ?auto_763156 ?auto_763160 ) ) ( not ( = ?auto_763156 ?auto_763161 ) ) ( not ( = ?auto_763156 ?auto_763162 ) ) ( not ( = ?auto_763156 ?auto_763163 ) ) ( not ( = ?auto_763156 ?auto_763164 ) ) ( not ( = ?auto_763156 ?auto_763165 ) ) ( not ( = ?auto_763156 ?auto_763166 ) ) ( not ( = ?auto_763157 ?auto_763158 ) ) ( not ( = ?auto_763157 ?auto_763159 ) ) ( not ( = ?auto_763157 ?auto_763160 ) ) ( not ( = ?auto_763157 ?auto_763161 ) ) ( not ( = ?auto_763157 ?auto_763162 ) ) ( not ( = ?auto_763157 ?auto_763163 ) ) ( not ( = ?auto_763157 ?auto_763164 ) ) ( not ( = ?auto_763157 ?auto_763165 ) ) ( not ( = ?auto_763157 ?auto_763166 ) ) ( not ( = ?auto_763158 ?auto_763159 ) ) ( not ( = ?auto_763158 ?auto_763160 ) ) ( not ( = ?auto_763158 ?auto_763161 ) ) ( not ( = ?auto_763158 ?auto_763162 ) ) ( not ( = ?auto_763158 ?auto_763163 ) ) ( not ( = ?auto_763158 ?auto_763164 ) ) ( not ( = ?auto_763158 ?auto_763165 ) ) ( not ( = ?auto_763158 ?auto_763166 ) ) ( not ( = ?auto_763159 ?auto_763160 ) ) ( not ( = ?auto_763159 ?auto_763161 ) ) ( not ( = ?auto_763159 ?auto_763162 ) ) ( not ( = ?auto_763159 ?auto_763163 ) ) ( not ( = ?auto_763159 ?auto_763164 ) ) ( not ( = ?auto_763159 ?auto_763165 ) ) ( not ( = ?auto_763159 ?auto_763166 ) ) ( not ( = ?auto_763160 ?auto_763161 ) ) ( not ( = ?auto_763160 ?auto_763162 ) ) ( not ( = ?auto_763160 ?auto_763163 ) ) ( not ( = ?auto_763160 ?auto_763164 ) ) ( not ( = ?auto_763160 ?auto_763165 ) ) ( not ( = ?auto_763160 ?auto_763166 ) ) ( not ( = ?auto_763161 ?auto_763162 ) ) ( not ( = ?auto_763161 ?auto_763163 ) ) ( not ( = ?auto_763161 ?auto_763164 ) ) ( not ( = ?auto_763161 ?auto_763165 ) ) ( not ( = ?auto_763161 ?auto_763166 ) ) ( not ( = ?auto_763162 ?auto_763163 ) ) ( not ( = ?auto_763162 ?auto_763164 ) ) ( not ( = ?auto_763162 ?auto_763165 ) ) ( not ( = ?auto_763162 ?auto_763166 ) ) ( not ( = ?auto_763163 ?auto_763164 ) ) ( not ( = ?auto_763163 ?auto_763165 ) ) ( not ( = ?auto_763163 ?auto_763166 ) ) ( not ( = ?auto_763164 ?auto_763165 ) ) ( not ( = ?auto_763164 ?auto_763166 ) ) ( not ( = ?auto_763165 ?auto_763166 ) ) ( ON ?auto_763164 ?auto_763165 ) ( ON ?auto_763163 ?auto_763164 ) ( ON ?auto_763162 ?auto_763163 ) ( ON ?auto_763161 ?auto_763162 ) ( ON ?auto_763160 ?auto_763161 ) ( ON ?auto_763159 ?auto_763160 ) ( ON ?auto_763158 ?auto_763159 ) ( ON ?auto_763157 ?auto_763158 ) ( ON ?auto_763156 ?auto_763157 ) ( CLEAR ?auto_763154 ) ( ON ?auto_763155 ?auto_763156 ) ( CLEAR ?auto_763155 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_763150 ?auto_763151 ?auto_763152 ?auto_763153 ?auto_763154 ?auto_763155 )
      ( MAKE-16PILE ?auto_763150 ?auto_763151 ?auto_763152 ?auto_763153 ?auto_763154 ?auto_763155 ?auto_763156 ?auto_763157 ?auto_763158 ?auto_763159 ?auto_763160 ?auto_763161 ?auto_763162 ?auto_763163 ?auto_763164 ?auto_763165 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_763216 - BLOCK
      ?auto_763217 - BLOCK
      ?auto_763218 - BLOCK
      ?auto_763219 - BLOCK
      ?auto_763220 - BLOCK
      ?auto_763221 - BLOCK
      ?auto_763222 - BLOCK
      ?auto_763223 - BLOCK
      ?auto_763224 - BLOCK
      ?auto_763225 - BLOCK
      ?auto_763226 - BLOCK
      ?auto_763227 - BLOCK
      ?auto_763228 - BLOCK
      ?auto_763229 - BLOCK
      ?auto_763230 - BLOCK
      ?auto_763231 - BLOCK
    )
    :vars
    (
      ?auto_763232 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_763231 ?auto_763232 ) ( ON-TABLE ?auto_763216 ) ( ON ?auto_763217 ?auto_763216 ) ( ON ?auto_763218 ?auto_763217 ) ( ON ?auto_763219 ?auto_763218 ) ( not ( = ?auto_763216 ?auto_763217 ) ) ( not ( = ?auto_763216 ?auto_763218 ) ) ( not ( = ?auto_763216 ?auto_763219 ) ) ( not ( = ?auto_763216 ?auto_763220 ) ) ( not ( = ?auto_763216 ?auto_763221 ) ) ( not ( = ?auto_763216 ?auto_763222 ) ) ( not ( = ?auto_763216 ?auto_763223 ) ) ( not ( = ?auto_763216 ?auto_763224 ) ) ( not ( = ?auto_763216 ?auto_763225 ) ) ( not ( = ?auto_763216 ?auto_763226 ) ) ( not ( = ?auto_763216 ?auto_763227 ) ) ( not ( = ?auto_763216 ?auto_763228 ) ) ( not ( = ?auto_763216 ?auto_763229 ) ) ( not ( = ?auto_763216 ?auto_763230 ) ) ( not ( = ?auto_763216 ?auto_763231 ) ) ( not ( = ?auto_763216 ?auto_763232 ) ) ( not ( = ?auto_763217 ?auto_763218 ) ) ( not ( = ?auto_763217 ?auto_763219 ) ) ( not ( = ?auto_763217 ?auto_763220 ) ) ( not ( = ?auto_763217 ?auto_763221 ) ) ( not ( = ?auto_763217 ?auto_763222 ) ) ( not ( = ?auto_763217 ?auto_763223 ) ) ( not ( = ?auto_763217 ?auto_763224 ) ) ( not ( = ?auto_763217 ?auto_763225 ) ) ( not ( = ?auto_763217 ?auto_763226 ) ) ( not ( = ?auto_763217 ?auto_763227 ) ) ( not ( = ?auto_763217 ?auto_763228 ) ) ( not ( = ?auto_763217 ?auto_763229 ) ) ( not ( = ?auto_763217 ?auto_763230 ) ) ( not ( = ?auto_763217 ?auto_763231 ) ) ( not ( = ?auto_763217 ?auto_763232 ) ) ( not ( = ?auto_763218 ?auto_763219 ) ) ( not ( = ?auto_763218 ?auto_763220 ) ) ( not ( = ?auto_763218 ?auto_763221 ) ) ( not ( = ?auto_763218 ?auto_763222 ) ) ( not ( = ?auto_763218 ?auto_763223 ) ) ( not ( = ?auto_763218 ?auto_763224 ) ) ( not ( = ?auto_763218 ?auto_763225 ) ) ( not ( = ?auto_763218 ?auto_763226 ) ) ( not ( = ?auto_763218 ?auto_763227 ) ) ( not ( = ?auto_763218 ?auto_763228 ) ) ( not ( = ?auto_763218 ?auto_763229 ) ) ( not ( = ?auto_763218 ?auto_763230 ) ) ( not ( = ?auto_763218 ?auto_763231 ) ) ( not ( = ?auto_763218 ?auto_763232 ) ) ( not ( = ?auto_763219 ?auto_763220 ) ) ( not ( = ?auto_763219 ?auto_763221 ) ) ( not ( = ?auto_763219 ?auto_763222 ) ) ( not ( = ?auto_763219 ?auto_763223 ) ) ( not ( = ?auto_763219 ?auto_763224 ) ) ( not ( = ?auto_763219 ?auto_763225 ) ) ( not ( = ?auto_763219 ?auto_763226 ) ) ( not ( = ?auto_763219 ?auto_763227 ) ) ( not ( = ?auto_763219 ?auto_763228 ) ) ( not ( = ?auto_763219 ?auto_763229 ) ) ( not ( = ?auto_763219 ?auto_763230 ) ) ( not ( = ?auto_763219 ?auto_763231 ) ) ( not ( = ?auto_763219 ?auto_763232 ) ) ( not ( = ?auto_763220 ?auto_763221 ) ) ( not ( = ?auto_763220 ?auto_763222 ) ) ( not ( = ?auto_763220 ?auto_763223 ) ) ( not ( = ?auto_763220 ?auto_763224 ) ) ( not ( = ?auto_763220 ?auto_763225 ) ) ( not ( = ?auto_763220 ?auto_763226 ) ) ( not ( = ?auto_763220 ?auto_763227 ) ) ( not ( = ?auto_763220 ?auto_763228 ) ) ( not ( = ?auto_763220 ?auto_763229 ) ) ( not ( = ?auto_763220 ?auto_763230 ) ) ( not ( = ?auto_763220 ?auto_763231 ) ) ( not ( = ?auto_763220 ?auto_763232 ) ) ( not ( = ?auto_763221 ?auto_763222 ) ) ( not ( = ?auto_763221 ?auto_763223 ) ) ( not ( = ?auto_763221 ?auto_763224 ) ) ( not ( = ?auto_763221 ?auto_763225 ) ) ( not ( = ?auto_763221 ?auto_763226 ) ) ( not ( = ?auto_763221 ?auto_763227 ) ) ( not ( = ?auto_763221 ?auto_763228 ) ) ( not ( = ?auto_763221 ?auto_763229 ) ) ( not ( = ?auto_763221 ?auto_763230 ) ) ( not ( = ?auto_763221 ?auto_763231 ) ) ( not ( = ?auto_763221 ?auto_763232 ) ) ( not ( = ?auto_763222 ?auto_763223 ) ) ( not ( = ?auto_763222 ?auto_763224 ) ) ( not ( = ?auto_763222 ?auto_763225 ) ) ( not ( = ?auto_763222 ?auto_763226 ) ) ( not ( = ?auto_763222 ?auto_763227 ) ) ( not ( = ?auto_763222 ?auto_763228 ) ) ( not ( = ?auto_763222 ?auto_763229 ) ) ( not ( = ?auto_763222 ?auto_763230 ) ) ( not ( = ?auto_763222 ?auto_763231 ) ) ( not ( = ?auto_763222 ?auto_763232 ) ) ( not ( = ?auto_763223 ?auto_763224 ) ) ( not ( = ?auto_763223 ?auto_763225 ) ) ( not ( = ?auto_763223 ?auto_763226 ) ) ( not ( = ?auto_763223 ?auto_763227 ) ) ( not ( = ?auto_763223 ?auto_763228 ) ) ( not ( = ?auto_763223 ?auto_763229 ) ) ( not ( = ?auto_763223 ?auto_763230 ) ) ( not ( = ?auto_763223 ?auto_763231 ) ) ( not ( = ?auto_763223 ?auto_763232 ) ) ( not ( = ?auto_763224 ?auto_763225 ) ) ( not ( = ?auto_763224 ?auto_763226 ) ) ( not ( = ?auto_763224 ?auto_763227 ) ) ( not ( = ?auto_763224 ?auto_763228 ) ) ( not ( = ?auto_763224 ?auto_763229 ) ) ( not ( = ?auto_763224 ?auto_763230 ) ) ( not ( = ?auto_763224 ?auto_763231 ) ) ( not ( = ?auto_763224 ?auto_763232 ) ) ( not ( = ?auto_763225 ?auto_763226 ) ) ( not ( = ?auto_763225 ?auto_763227 ) ) ( not ( = ?auto_763225 ?auto_763228 ) ) ( not ( = ?auto_763225 ?auto_763229 ) ) ( not ( = ?auto_763225 ?auto_763230 ) ) ( not ( = ?auto_763225 ?auto_763231 ) ) ( not ( = ?auto_763225 ?auto_763232 ) ) ( not ( = ?auto_763226 ?auto_763227 ) ) ( not ( = ?auto_763226 ?auto_763228 ) ) ( not ( = ?auto_763226 ?auto_763229 ) ) ( not ( = ?auto_763226 ?auto_763230 ) ) ( not ( = ?auto_763226 ?auto_763231 ) ) ( not ( = ?auto_763226 ?auto_763232 ) ) ( not ( = ?auto_763227 ?auto_763228 ) ) ( not ( = ?auto_763227 ?auto_763229 ) ) ( not ( = ?auto_763227 ?auto_763230 ) ) ( not ( = ?auto_763227 ?auto_763231 ) ) ( not ( = ?auto_763227 ?auto_763232 ) ) ( not ( = ?auto_763228 ?auto_763229 ) ) ( not ( = ?auto_763228 ?auto_763230 ) ) ( not ( = ?auto_763228 ?auto_763231 ) ) ( not ( = ?auto_763228 ?auto_763232 ) ) ( not ( = ?auto_763229 ?auto_763230 ) ) ( not ( = ?auto_763229 ?auto_763231 ) ) ( not ( = ?auto_763229 ?auto_763232 ) ) ( not ( = ?auto_763230 ?auto_763231 ) ) ( not ( = ?auto_763230 ?auto_763232 ) ) ( not ( = ?auto_763231 ?auto_763232 ) ) ( ON ?auto_763230 ?auto_763231 ) ( ON ?auto_763229 ?auto_763230 ) ( ON ?auto_763228 ?auto_763229 ) ( ON ?auto_763227 ?auto_763228 ) ( ON ?auto_763226 ?auto_763227 ) ( ON ?auto_763225 ?auto_763226 ) ( ON ?auto_763224 ?auto_763225 ) ( ON ?auto_763223 ?auto_763224 ) ( ON ?auto_763222 ?auto_763223 ) ( ON ?auto_763221 ?auto_763222 ) ( CLEAR ?auto_763219 ) ( ON ?auto_763220 ?auto_763221 ) ( CLEAR ?auto_763220 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_763216 ?auto_763217 ?auto_763218 ?auto_763219 ?auto_763220 )
      ( MAKE-16PILE ?auto_763216 ?auto_763217 ?auto_763218 ?auto_763219 ?auto_763220 ?auto_763221 ?auto_763222 ?auto_763223 ?auto_763224 ?auto_763225 ?auto_763226 ?auto_763227 ?auto_763228 ?auto_763229 ?auto_763230 ?auto_763231 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_763282 - BLOCK
      ?auto_763283 - BLOCK
      ?auto_763284 - BLOCK
      ?auto_763285 - BLOCK
      ?auto_763286 - BLOCK
      ?auto_763287 - BLOCK
      ?auto_763288 - BLOCK
      ?auto_763289 - BLOCK
      ?auto_763290 - BLOCK
      ?auto_763291 - BLOCK
      ?auto_763292 - BLOCK
      ?auto_763293 - BLOCK
      ?auto_763294 - BLOCK
      ?auto_763295 - BLOCK
      ?auto_763296 - BLOCK
      ?auto_763297 - BLOCK
    )
    :vars
    (
      ?auto_763298 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_763297 ?auto_763298 ) ( ON-TABLE ?auto_763282 ) ( ON ?auto_763283 ?auto_763282 ) ( ON ?auto_763284 ?auto_763283 ) ( not ( = ?auto_763282 ?auto_763283 ) ) ( not ( = ?auto_763282 ?auto_763284 ) ) ( not ( = ?auto_763282 ?auto_763285 ) ) ( not ( = ?auto_763282 ?auto_763286 ) ) ( not ( = ?auto_763282 ?auto_763287 ) ) ( not ( = ?auto_763282 ?auto_763288 ) ) ( not ( = ?auto_763282 ?auto_763289 ) ) ( not ( = ?auto_763282 ?auto_763290 ) ) ( not ( = ?auto_763282 ?auto_763291 ) ) ( not ( = ?auto_763282 ?auto_763292 ) ) ( not ( = ?auto_763282 ?auto_763293 ) ) ( not ( = ?auto_763282 ?auto_763294 ) ) ( not ( = ?auto_763282 ?auto_763295 ) ) ( not ( = ?auto_763282 ?auto_763296 ) ) ( not ( = ?auto_763282 ?auto_763297 ) ) ( not ( = ?auto_763282 ?auto_763298 ) ) ( not ( = ?auto_763283 ?auto_763284 ) ) ( not ( = ?auto_763283 ?auto_763285 ) ) ( not ( = ?auto_763283 ?auto_763286 ) ) ( not ( = ?auto_763283 ?auto_763287 ) ) ( not ( = ?auto_763283 ?auto_763288 ) ) ( not ( = ?auto_763283 ?auto_763289 ) ) ( not ( = ?auto_763283 ?auto_763290 ) ) ( not ( = ?auto_763283 ?auto_763291 ) ) ( not ( = ?auto_763283 ?auto_763292 ) ) ( not ( = ?auto_763283 ?auto_763293 ) ) ( not ( = ?auto_763283 ?auto_763294 ) ) ( not ( = ?auto_763283 ?auto_763295 ) ) ( not ( = ?auto_763283 ?auto_763296 ) ) ( not ( = ?auto_763283 ?auto_763297 ) ) ( not ( = ?auto_763283 ?auto_763298 ) ) ( not ( = ?auto_763284 ?auto_763285 ) ) ( not ( = ?auto_763284 ?auto_763286 ) ) ( not ( = ?auto_763284 ?auto_763287 ) ) ( not ( = ?auto_763284 ?auto_763288 ) ) ( not ( = ?auto_763284 ?auto_763289 ) ) ( not ( = ?auto_763284 ?auto_763290 ) ) ( not ( = ?auto_763284 ?auto_763291 ) ) ( not ( = ?auto_763284 ?auto_763292 ) ) ( not ( = ?auto_763284 ?auto_763293 ) ) ( not ( = ?auto_763284 ?auto_763294 ) ) ( not ( = ?auto_763284 ?auto_763295 ) ) ( not ( = ?auto_763284 ?auto_763296 ) ) ( not ( = ?auto_763284 ?auto_763297 ) ) ( not ( = ?auto_763284 ?auto_763298 ) ) ( not ( = ?auto_763285 ?auto_763286 ) ) ( not ( = ?auto_763285 ?auto_763287 ) ) ( not ( = ?auto_763285 ?auto_763288 ) ) ( not ( = ?auto_763285 ?auto_763289 ) ) ( not ( = ?auto_763285 ?auto_763290 ) ) ( not ( = ?auto_763285 ?auto_763291 ) ) ( not ( = ?auto_763285 ?auto_763292 ) ) ( not ( = ?auto_763285 ?auto_763293 ) ) ( not ( = ?auto_763285 ?auto_763294 ) ) ( not ( = ?auto_763285 ?auto_763295 ) ) ( not ( = ?auto_763285 ?auto_763296 ) ) ( not ( = ?auto_763285 ?auto_763297 ) ) ( not ( = ?auto_763285 ?auto_763298 ) ) ( not ( = ?auto_763286 ?auto_763287 ) ) ( not ( = ?auto_763286 ?auto_763288 ) ) ( not ( = ?auto_763286 ?auto_763289 ) ) ( not ( = ?auto_763286 ?auto_763290 ) ) ( not ( = ?auto_763286 ?auto_763291 ) ) ( not ( = ?auto_763286 ?auto_763292 ) ) ( not ( = ?auto_763286 ?auto_763293 ) ) ( not ( = ?auto_763286 ?auto_763294 ) ) ( not ( = ?auto_763286 ?auto_763295 ) ) ( not ( = ?auto_763286 ?auto_763296 ) ) ( not ( = ?auto_763286 ?auto_763297 ) ) ( not ( = ?auto_763286 ?auto_763298 ) ) ( not ( = ?auto_763287 ?auto_763288 ) ) ( not ( = ?auto_763287 ?auto_763289 ) ) ( not ( = ?auto_763287 ?auto_763290 ) ) ( not ( = ?auto_763287 ?auto_763291 ) ) ( not ( = ?auto_763287 ?auto_763292 ) ) ( not ( = ?auto_763287 ?auto_763293 ) ) ( not ( = ?auto_763287 ?auto_763294 ) ) ( not ( = ?auto_763287 ?auto_763295 ) ) ( not ( = ?auto_763287 ?auto_763296 ) ) ( not ( = ?auto_763287 ?auto_763297 ) ) ( not ( = ?auto_763287 ?auto_763298 ) ) ( not ( = ?auto_763288 ?auto_763289 ) ) ( not ( = ?auto_763288 ?auto_763290 ) ) ( not ( = ?auto_763288 ?auto_763291 ) ) ( not ( = ?auto_763288 ?auto_763292 ) ) ( not ( = ?auto_763288 ?auto_763293 ) ) ( not ( = ?auto_763288 ?auto_763294 ) ) ( not ( = ?auto_763288 ?auto_763295 ) ) ( not ( = ?auto_763288 ?auto_763296 ) ) ( not ( = ?auto_763288 ?auto_763297 ) ) ( not ( = ?auto_763288 ?auto_763298 ) ) ( not ( = ?auto_763289 ?auto_763290 ) ) ( not ( = ?auto_763289 ?auto_763291 ) ) ( not ( = ?auto_763289 ?auto_763292 ) ) ( not ( = ?auto_763289 ?auto_763293 ) ) ( not ( = ?auto_763289 ?auto_763294 ) ) ( not ( = ?auto_763289 ?auto_763295 ) ) ( not ( = ?auto_763289 ?auto_763296 ) ) ( not ( = ?auto_763289 ?auto_763297 ) ) ( not ( = ?auto_763289 ?auto_763298 ) ) ( not ( = ?auto_763290 ?auto_763291 ) ) ( not ( = ?auto_763290 ?auto_763292 ) ) ( not ( = ?auto_763290 ?auto_763293 ) ) ( not ( = ?auto_763290 ?auto_763294 ) ) ( not ( = ?auto_763290 ?auto_763295 ) ) ( not ( = ?auto_763290 ?auto_763296 ) ) ( not ( = ?auto_763290 ?auto_763297 ) ) ( not ( = ?auto_763290 ?auto_763298 ) ) ( not ( = ?auto_763291 ?auto_763292 ) ) ( not ( = ?auto_763291 ?auto_763293 ) ) ( not ( = ?auto_763291 ?auto_763294 ) ) ( not ( = ?auto_763291 ?auto_763295 ) ) ( not ( = ?auto_763291 ?auto_763296 ) ) ( not ( = ?auto_763291 ?auto_763297 ) ) ( not ( = ?auto_763291 ?auto_763298 ) ) ( not ( = ?auto_763292 ?auto_763293 ) ) ( not ( = ?auto_763292 ?auto_763294 ) ) ( not ( = ?auto_763292 ?auto_763295 ) ) ( not ( = ?auto_763292 ?auto_763296 ) ) ( not ( = ?auto_763292 ?auto_763297 ) ) ( not ( = ?auto_763292 ?auto_763298 ) ) ( not ( = ?auto_763293 ?auto_763294 ) ) ( not ( = ?auto_763293 ?auto_763295 ) ) ( not ( = ?auto_763293 ?auto_763296 ) ) ( not ( = ?auto_763293 ?auto_763297 ) ) ( not ( = ?auto_763293 ?auto_763298 ) ) ( not ( = ?auto_763294 ?auto_763295 ) ) ( not ( = ?auto_763294 ?auto_763296 ) ) ( not ( = ?auto_763294 ?auto_763297 ) ) ( not ( = ?auto_763294 ?auto_763298 ) ) ( not ( = ?auto_763295 ?auto_763296 ) ) ( not ( = ?auto_763295 ?auto_763297 ) ) ( not ( = ?auto_763295 ?auto_763298 ) ) ( not ( = ?auto_763296 ?auto_763297 ) ) ( not ( = ?auto_763296 ?auto_763298 ) ) ( not ( = ?auto_763297 ?auto_763298 ) ) ( ON ?auto_763296 ?auto_763297 ) ( ON ?auto_763295 ?auto_763296 ) ( ON ?auto_763294 ?auto_763295 ) ( ON ?auto_763293 ?auto_763294 ) ( ON ?auto_763292 ?auto_763293 ) ( ON ?auto_763291 ?auto_763292 ) ( ON ?auto_763290 ?auto_763291 ) ( ON ?auto_763289 ?auto_763290 ) ( ON ?auto_763288 ?auto_763289 ) ( ON ?auto_763287 ?auto_763288 ) ( ON ?auto_763286 ?auto_763287 ) ( CLEAR ?auto_763284 ) ( ON ?auto_763285 ?auto_763286 ) ( CLEAR ?auto_763285 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_763282 ?auto_763283 ?auto_763284 ?auto_763285 )
      ( MAKE-16PILE ?auto_763282 ?auto_763283 ?auto_763284 ?auto_763285 ?auto_763286 ?auto_763287 ?auto_763288 ?auto_763289 ?auto_763290 ?auto_763291 ?auto_763292 ?auto_763293 ?auto_763294 ?auto_763295 ?auto_763296 ?auto_763297 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_763348 - BLOCK
      ?auto_763349 - BLOCK
      ?auto_763350 - BLOCK
      ?auto_763351 - BLOCK
      ?auto_763352 - BLOCK
      ?auto_763353 - BLOCK
      ?auto_763354 - BLOCK
      ?auto_763355 - BLOCK
      ?auto_763356 - BLOCK
      ?auto_763357 - BLOCK
      ?auto_763358 - BLOCK
      ?auto_763359 - BLOCK
      ?auto_763360 - BLOCK
      ?auto_763361 - BLOCK
      ?auto_763362 - BLOCK
      ?auto_763363 - BLOCK
    )
    :vars
    (
      ?auto_763364 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_763363 ?auto_763364 ) ( ON-TABLE ?auto_763348 ) ( ON ?auto_763349 ?auto_763348 ) ( not ( = ?auto_763348 ?auto_763349 ) ) ( not ( = ?auto_763348 ?auto_763350 ) ) ( not ( = ?auto_763348 ?auto_763351 ) ) ( not ( = ?auto_763348 ?auto_763352 ) ) ( not ( = ?auto_763348 ?auto_763353 ) ) ( not ( = ?auto_763348 ?auto_763354 ) ) ( not ( = ?auto_763348 ?auto_763355 ) ) ( not ( = ?auto_763348 ?auto_763356 ) ) ( not ( = ?auto_763348 ?auto_763357 ) ) ( not ( = ?auto_763348 ?auto_763358 ) ) ( not ( = ?auto_763348 ?auto_763359 ) ) ( not ( = ?auto_763348 ?auto_763360 ) ) ( not ( = ?auto_763348 ?auto_763361 ) ) ( not ( = ?auto_763348 ?auto_763362 ) ) ( not ( = ?auto_763348 ?auto_763363 ) ) ( not ( = ?auto_763348 ?auto_763364 ) ) ( not ( = ?auto_763349 ?auto_763350 ) ) ( not ( = ?auto_763349 ?auto_763351 ) ) ( not ( = ?auto_763349 ?auto_763352 ) ) ( not ( = ?auto_763349 ?auto_763353 ) ) ( not ( = ?auto_763349 ?auto_763354 ) ) ( not ( = ?auto_763349 ?auto_763355 ) ) ( not ( = ?auto_763349 ?auto_763356 ) ) ( not ( = ?auto_763349 ?auto_763357 ) ) ( not ( = ?auto_763349 ?auto_763358 ) ) ( not ( = ?auto_763349 ?auto_763359 ) ) ( not ( = ?auto_763349 ?auto_763360 ) ) ( not ( = ?auto_763349 ?auto_763361 ) ) ( not ( = ?auto_763349 ?auto_763362 ) ) ( not ( = ?auto_763349 ?auto_763363 ) ) ( not ( = ?auto_763349 ?auto_763364 ) ) ( not ( = ?auto_763350 ?auto_763351 ) ) ( not ( = ?auto_763350 ?auto_763352 ) ) ( not ( = ?auto_763350 ?auto_763353 ) ) ( not ( = ?auto_763350 ?auto_763354 ) ) ( not ( = ?auto_763350 ?auto_763355 ) ) ( not ( = ?auto_763350 ?auto_763356 ) ) ( not ( = ?auto_763350 ?auto_763357 ) ) ( not ( = ?auto_763350 ?auto_763358 ) ) ( not ( = ?auto_763350 ?auto_763359 ) ) ( not ( = ?auto_763350 ?auto_763360 ) ) ( not ( = ?auto_763350 ?auto_763361 ) ) ( not ( = ?auto_763350 ?auto_763362 ) ) ( not ( = ?auto_763350 ?auto_763363 ) ) ( not ( = ?auto_763350 ?auto_763364 ) ) ( not ( = ?auto_763351 ?auto_763352 ) ) ( not ( = ?auto_763351 ?auto_763353 ) ) ( not ( = ?auto_763351 ?auto_763354 ) ) ( not ( = ?auto_763351 ?auto_763355 ) ) ( not ( = ?auto_763351 ?auto_763356 ) ) ( not ( = ?auto_763351 ?auto_763357 ) ) ( not ( = ?auto_763351 ?auto_763358 ) ) ( not ( = ?auto_763351 ?auto_763359 ) ) ( not ( = ?auto_763351 ?auto_763360 ) ) ( not ( = ?auto_763351 ?auto_763361 ) ) ( not ( = ?auto_763351 ?auto_763362 ) ) ( not ( = ?auto_763351 ?auto_763363 ) ) ( not ( = ?auto_763351 ?auto_763364 ) ) ( not ( = ?auto_763352 ?auto_763353 ) ) ( not ( = ?auto_763352 ?auto_763354 ) ) ( not ( = ?auto_763352 ?auto_763355 ) ) ( not ( = ?auto_763352 ?auto_763356 ) ) ( not ( = ?auto_763352 ?auto_763357 ) ) ( not ( = ?auto_763352 ?auto_763358 ) ) ( not ( = ?auto_763352 ?auto_763359 ) ) ( not ( = ?auto_763352 ?auto_763360 ) ) ( not ( = ?auto_763352 ?auto_763361 ) ) ( not ( = ?auto_763352 ?auto_763362 ) ) ( not ( = ?auto_763352 ?auto_763363 ) ) ( not ( = ?auto_763352 ?auto_763364 ) ) ( not ( = ?auto_763353 ?auto_763354 ) ) ( not ( = ?auto_763353 ?auto_763355 ) ) ( not ( = ?auto_763353 ?auto_763356 ) ) ( not ( = ?auto_763353 ?auto_763357 ) ) ( not ( = ?auto_763353 ?auto_763358 ) ) ( not ( = ?auto_763353 ?auto_763359 ) ) ( not ( = ?auto_763353 ?auto_763360 ) ) ( not ( = ?auto_763353 ?auto_763361 ) ) ( not ( = ?auto_763353 ?auto_763362 ) ) ( not ( = ?auto_763353 ?auto_763363 ) ) ( not ( = ?auto_763353 ?auto_763364 ) ) ( not ( = ?auto_763354 ?auto_763355 ) ) ( not ( = ?auto_763354 ?auto_763356 ) ) ( not ( = ?auto_763354 ?auto_763357 ) ) ( not ( = ?auto_763354 ?auto_763358 ) ) ( not ( = ?auto_763354 ?auto_763359 ) ) ( not ( = ?auto_763354 ?auto_763360 ) ) ( not ( = ?auto_763354 ?auto_763361 ) ) ( not ( = ?auto_763354 ?auto_763362 ) ) ( not ( = ?auto_763354 ?auto_763363 ) ) ( not ( = ?auto_763354 ?auto_763364 ) ) ( not ( = ?auto_763355 ?auto_763356 ) ) ( not ( = ?auto_763355 ?auto_763357 ) ) ( not ( = ?auto_763355 ?auto_763358 ) ) ( not ( = ?auto_763355 ?auto_763359 ) ) ( not ( = ?auto_763355 ?auto_763360 ) ) ( not ( = ?auto_763355 ?auto_763361 ) ) ( not ( = ?auto_763355 ?auto_763362 ) ) ( not ( = ?auto_763355 ?auto_763363 ) ) ( not ( = ?auto_763355 ?auto_763364 ) ) ( not ( = ?auto_763356 ?auto_763357 ) ) ( not ( = ?auto_763356 ?auto_763358 ) ) ( not ( = ?auto_763356 ?auto_763359 ) ) ( not ( = ?auto_763356 ?auto_763360 ) ) ( not ( = ?auto_763356 ?auto_763361 ) ) ( not ( = ?auto_763356 ?auto_763362 ) ) ( not ( = ?auto_763356 ?auto_763363 ) ) ( not ( = ?auto_763356 ?auto_763364 ) ) ( not ( = ?auto_763357 ?auto_763358 ) ) ( not ( = ?auto_763357 ?auto_763359 ) ) ( not ( = ?auto_763357 ?auto_763360 ) ) ( not ( = ?auto_763357 ?auto_763361 ) ) ( not ( = ?auto_763357 ?auto_763362 ) ) ( not ( = ?auto_763357 ?auto_763363 ) ) ( not ( = ?auto_763357 ?auto_763364 ) ) ( not ( = ?auto_763358 ?auto_763359 ) ) ( not ( = ?auto_763358 ?auto_763360 ) ) ( not ( = ?auto_763358 ?auto_763361 ) ) ( not ( = ?auto_763358 ?auto_763362 ) ) ( not ( = ?auto_763358 ?auto_763363 ) ) ( not ( = ?auto_763358 ?auto_763364 ) ) ( not ( = ?auto_763359 ?auto_763360 ) ) ( not ( = ?auto_763359 ?auto_763361 ) ) ( not ( = ?auto_763359 ?auto_763362 ) ) ( not ( = ?auto_763359 ?auto_763363 ) ) ( not ( = ?auto_763359 ?auto_763364 ) ) ( not ( = ?auto_763360 ?auto_763361 ) ) ( not ( = ?auto_763360 ?auto_763362 ) ) ( not ( = ?auto_763360 ?auto_763363 ) ) ( not ( = ?auto_763360 ?auto_763364 ) ) ( not ( = ?auto_763361 ?auto_763362 ) ) ( not ( = ?auto_763361 ?auto_763363 ) ) ( not ( = ?auto_763361 ?auto_763364 ) ) ( not ( = ?auto_763362 ?auto_763363 ) ) ( not ( = ?auto_763362 ?auto_763364 ) ) ( not ( = ?auto_763363 ?auto_763364 ) ) ( ON ?auto_763362 ?auto_763363 ) ( ON ?auto_763361 ?auto_763362 ) ( ON ?auto_763360 ?auto_763361 ) ( ON ?auto_763359 ?auto_763360 ) ( ON ?auto_763358 ?auto_763359 ) ( ON ?auto_763357 ?auto_763358 ) ( ON ?auto_763356 ?auto_763357 ) ( ON ?auto_763355 ?auto_763356 ) ( ON ?auto_763354 ?auto_763355 ) ( ON ?auto_763353 ?auto_763354 ) ( ON ?auto_763352 ?auto_763353 ) ( ON ?auto_763351 ?auto_763352 ) ( CLEAR ?auto_763349 ) ( ON ?auto_763350 ?auto_763351 ) ( CLEAR ?auto_763350 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_763348 ?auto_763349 ?auto_763350 )
      ( MAKE-16PILE ?auto_763348 ?auto_763349 ?auto_763350 ?auto_763351 ?auto_763352 ?auto_763353 ?auto_763354 ?auto_763355 ?auto_763356 ?auto_763357 ?auto_763358 ?auto_763359 ?auto_763360 ?auto_763361 ?auto_763362 ?auto_763363 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_763414 - BLOCK
      ?auto_763415 - BLOCK
      ?auto_763416 - BLOCK
      ?auto_763417 - BLOCK
      ?auto_763418 - BLOCK
      ?auto_763419 - BLOCK
      ?auto_763420 - BLOCK
      ?auto_763421 - BLOCK
      ?auto_763422 - BLOCK
      ?auto_763423 - BLOCK
      ?auto_763424 - BLOCK
      ?auto_763425 - BLOCK
      ?auto_763426 - BLOCK
      ?auto_763427 - BLOCK
      ?auto_763428 - BLOCK
      ?auto_763429 - BLOCK
    )
    :vars
    (
      ?auto_763430 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_763429 ?auto_763430 ) ( ON-TABLE ?auto_763414 ) ( not ( = ?auto_763414 ?auto_763415 ) ) ( not ( = ?auto_763414 ?auto_763416 ) ) ( not ( = ?auto_763414 ?auto_763417 ) ) ( not ( = ?auto_763414 ?auto_763418 ) ) ( not ( = ?auto_763414 ?auto_763419 ) ) ( not ( = ?auto_763414 ?auto_763420 ) ) ( not ( = ?auto_763414 ?auto_763421 ) ) ( not ( = ?auto_763414 ?auto_763422 ) ) ( not ( = ?auto_763414 ?auto_763423 ) ) ( not ( = ?auto_763414 ?auto_763424 ) ) ( not ( = ?auto_763414 ?auto_763425 ) ) ( not ( = ?auto_763414 ?auto_763426 ) ) ( not ( = ?auto_763414 ?auto_763427 ) ) ( not ( = ?auto_763414 ?auto_763428 ) ) ( not ( = ?auto_763414 ?auto_763429 ) ) ( not ( = ?auto_763414 ?auto_763430 ) ) ( not ( = ?auto_763415 ?auto_763416 ) ) ( not ( = ?auto_763415 ?auto_763417 ) ) ( not ( = ?auto_763415 ?auto_763418 ) ) ( not ( = ?auto_763415 ?auto_763419 ) ) ( not ( = ?auto_763415 ?auto_763420 ) ) ( not ( = ?auto_763415 ?auto_763421 ) ) ( not ( = ?auto_763415 ?auto_763422 ) ) ( not ( = ?auto_763415 ?auto_763423 ) ) ( not ( = ?auto_763415 ?auto_763424 ) ) ( not ( = ?auto_763415 ?auto_763425 ) ) ( not ( = ?auto_763415 ?auto_763426 ) ) ( not ( = ?auto_763415 ?auto_763427 ) ) ( not ( = ?auto_763415 ?auto_763428 ) ) ( not ( = ?auto_763415 ?auto_763429 ) ) ( not ( = ?auto_763415 ?auto_763430 ) ) ( not ( = ?auto_763416 ?auto_763417 ) ) ( not ( = ?auto_763416 ?auto_763418 ) ) ( not ( = ?auto_763416 ?auto_763419 ) ) ( not ( = ?auto_763416 ?auto_763420 ) ) ( not ( = ?auto_763416 ?auto_763421 ) ) ( not ( = ?auto_763416 ?auto_763422 ) ) ( not ( = ?auto_763416 ?auto_763423 ) ) ( not ( = ?auto_763416 ?auto_763424 ) ) ( not ( = ?auto_763416 ?auto_763425 ) ) ( not ( = ?auto_763416 ?auto_763426 ) ) ( not ( = ?auto_763416 ?auto_763427 ) ) ( not ( = ?auto_763416 ?auto_763428 ) ) ( not ( = ?auto_763416 ?auto_763429 ) ) ( not ( = ?auto_763416 ?auto_763430 ) ) ( not ( = ?auto_763417 ?auto_763418 ) ) ( not ( = ?auto_763417 ?auto_763419 ) ) ( not ( = ?auto_763417 ?auto_763420 ) ) ( not ( = ?auto_763417 ?auto_763421 ) ) ( not ( = ?auto_763417 ?auto_763422 ) ) ( not ( = ?auto_763417 ?auto_763423 ) ) ( not ( = ?auto_763417 ?auto_763424 ) ) ( not ( = ?auto_763417 ?auto_763425 ) ) ( not ( = ?auto_763417 ?auto_763426 ) ) ( not ( = ?auto_763417 ?auto_763427 ) ) ( not ( = ?auto_763417 ?auto_763428 ) ) ( not ( = ?auto_763417 ?auto_763429 ) ) ( not ( = ?auto_763417 ?auto_763430 ) ) ( not ( = ?auto_763418 ?auto_763419 ) ) ( not ( = ?auto_763418 ?auto_763420 ) ) ( not ( = ?auto_763418 ?auto_763421 ) ) ( not ( = ?auto_763418 ?auto_763422 ) ) ( not ( = ?auto_763418 ?auto_763423 ) ) ( not ( = ?auto_763418 ?auto_763424 ) ) ( not ( = ?auto_763418 ?auto_763425 ) ) ( not ( = ?auto_763418 ?auto_763426 ) ) ( not ( = ?auto_763418 ?auto_763427 ) ) ( not ( = ?auto_763418 ?auto_763428 ) ) ( not ( = ?auto_763418 ?auto_763429 ) ) ( not ( = ?auto_763418 ?auto_763430 ) ) ( not ( = ?auto_763419 ?auto_763420 ) ) ( not ( = ?auto_763419 ?auto_763421 ) ) ( not ( = ?auto_763419 ?auto_763422 ) ) ( not ( = ?auto_763419 ?auto_763423 ) ) ( not ( = ?auto_763419 ?auto_763424 ) ) ( not ( = ?auto_763419 ?auto_763425 ) ) ( not ( = ?auto_763419 ?auto_763426 ) ) ( not ( = ?auto_763419 ?auto_763427 ) ) ( not ( = ?auto_763419 ?auto_763428 ) ) ( not ( = ?auto_763419 ?auto_763429 ) ) ( not ( = ?auto_763419 ?auto_763430 ) ) ( not ( = ?auto_763420 ?auto_763421 ) ) ( not ( = ?auto_763420 ?auto_763422 ) ) ( not ( = ?auto_763420 ?auto_763423 ) ) ( not ( = ?auto_763420 ?auto_763424 ) ) ( not ( = ?auto_763420 ?auto_763425 ) ) ( not ( = ?auto_763420 ?auto_763426 ) ) ( not ( = ?auto_763420 ?auto_763427 ) ) ( not ( = ?auto_763420 ?auto_763428 ) ) ( not ( = ?auto_763420 ?auto_763429 ) ) ( not ( = ?auto_763420 ?auto_763430 ) ) ( not ( = ?auto_763421 ?auto_763422 ) ) ( not ( = ?auto_763421 ?auto_763423 ) ) ( not ( = ?auto_763421 ?auto_763424 ) ) ( not ( = ?auto_763421 ?auto_763425 ) ) ( not ( = ?auto_763421 ?auto_763426 ) ) ( not ( = ?auto_763421 ?auto_763427 ) ) ( not ( = ?auto_763421 ?auto_763428 ) ) ( not ( = ?auto_763421 ?auto_763429 ) ) ( not ( = ?auto_763421 ?auto_763430 ) ) ( not ( = ?auto_763422 ?auto_763423 ) ) ( not ( = ?auto_763422 ?auto_763424 ) ) ( not ( = ?auto_763422 ?auto_763425 ) ) ( not ( = ?auto_763422 ?auto_763426 ) ) ( not ( = ?auto_763422 ?auto_763427 ) ) ( not ( = ?auto_763422 ?auto_763428 ) ) ( not ( = ?auto_763422 ?auto_763429 ) ) ( not ( = ?auto_763422 ?auto_763430 ) ) ( not ( = ?auto_763423 ?auto_763424 ) ) ( not ( = ?auto_763423 ?auto_763425 ) ) ( not ( = ?auto_763423 ?auto_763426 ) ) ( not ( = ?auto_763423 ?auto_763427 ) ) ( not ( = ?auto_763423 ?auto_763428 ) ) ( not ( = ?auto_763423 ?auto_763429 ) ) ( not ( = ?auto_763423 ?auto_763430 ) ) ( not ( = ?auto_763424 ?auto_763425 ) ) ( not ( = ?auto_763424 ?auto_763426 ) ) ( not ( = ?auto_763424 ?auto_763427 ) ) ( not ( = ?auto_763424 ?auto_763428 ) ) ( not ( = ?auto_763424 ?auto_763429 ) ) ( not ( = ?auto_763424 ?auto_763430 ) ) ( not ( = ?auto_763425 ?auto_763426 ) ) ( not ( = ?auto_763425 ?auto_763427 ) ) ( not ( = ?auto_763425 ?auto_763428 ) ) ( not ( = ?auto_763425 ?auto_763429 ) ) ( not ( = ?auto_763425 ?auto_763430 ) ) ( not ( = ?auto_763426 ?auto_763427 ) ) ( not ( = ?auto_763426 ?auto_763428 ) ) ( not ( = ?auto_763426 ?auto_763429 ) ) ( not ( = ?auto_763426 ?auto_763430 ) ) ( not ( = ?auto_763427 ?auto_763428 ) ) ( not ( = ?auto_763427 ?auto_763429 ) ) ( not ( = ?auto_763427 ?auto_763430 ) ) ( not ( = ?auto_763428 ?auto_763429 ) ) ( not ( = ?auto_763428 ?auto_763430 ) ) ( not ( = ?auto_763429 ?auto_763430 ) ) ( ON ?auto_763428 ?auto_763429 ) ( ON ?auto_763427 ?auto_763428 ) ( ON ?auto_763426 ?auto_763427 ) ( ON ?auto_763425 ?auto_763426 ) ( ON ?auto_763424 ?auto_763425 ) ( ON ?auto_763423 ?auto_763424 ) ( ON ?auto_763422 ?auto_763423 ) ( ON ?auto_763421 ?auto_763422 ) ( ON ?auto_763420 ?auto_763421 ) ( ON ?auto_763419 ?auto_763420 ) ( ON ?auto_763418 ?auto_763419 ) ( ON ?auto_763417 ?auto_763418 ) ( ON ?auto_763416 ?auto_763417 ) ( CLEAR ?auto_763414 ) ( ON ?auto_763415 ?auto_763416 ) ( CLEAR ?auto_763415 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_763414 ?auto_763415 )
      ( MAKE-16PILE ?auto_763414 ?auto_763415 ?auto_763416 ?auto_763417 ?auto_763418 ?auto_763419 ?auto_763420 ?auto_763421 ?auto_763422 ?auto_763423 ?auto_763424 ?auto_763425 ?auto_763426 ?auto_763427 ?auto_763428 ?auto_763429 ) )
  )

  ( :method MAKE-16PILE
    :parameters
    (
      ?auto_763480 - BLOCK
      ?auto_763481 - BLOCK
      ?auto_763482 - BLOCK
      ?auto_763483 - BLOCK
      ?auto_763484 - BLOCK
      ?auto_763485 - BLOCK
      ?auto_763486 - BLOCK
      ?auto_763487 - BLOCK
      ?auto_763488 - BLOCK
      ?auto_763489 - BLOCK
      ?auto_763490 - BLOCK
      ?auto_763491 - BLOCK
      ?auto_763492 - BLOCK
      ?auto_763493 - BLOCK
      ?auto_763494 - BLOCK
      ?auto_763495 - BLOCK
    )
    :vars
    (
      ?auto_763496 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_763495 ?auto_763496 ) ( not ( = ?auto_763480 ?auto_763481 ) ) ( not ( = ?auto_763480 ?auto_763482 ) ) ( not ( = ?auto_763480 ?auto_763483 ) ) ( not ( = ?auto_763480 ?auto_763484 ) ) ( not ( = ?auto_763480 ?auto_763485 ) ) ( not ( = ?auto_763480 ?auto_763486 ) ) ( not ( = ?auto_763480 ?auto_763487 ) ) ( not ( = ?auto_763480 ?auto_763488 ) ) ( not ( = ?auto_763480 ?auto_763489 ) ) ( not ( = ?auto_763480 ?auto_763490 ) ) ( not ( = ?auto_763480 ?auto_763491 ) ) ( not ( = ?auto_763480 ?auto_763492 ) ) ( not ( = ?auto_763480 ?auto_763493 ) ) ( not ( = ?auto_763480 ?auto_763494 ) ) ( not ( = ?auto_763480 ?auto_763495 ) ) ( not ( = ?auto_763480 ?auto_763496 ) ) ( not ( = ?auto_763481 ?auto_763482 ) ) ( not ( = ?auto_763481 ?auto_763483 ) ) ( not ( = ?auto_763481 ?auto_763484 ) ) ( not ( = ?auto_763481 ?auto_763485 ) ) ( not ( = ?auto_763481 ?auto_763486 ) ) ( not ( = ?auto_763481 ?auto_763487 ) ) ( not ( = ?auto_763481 ?auto_763488 ) ) ( not ( = ?auto_763481 ?auto_763489 ) ) ( not ( = ?auto_763481 ?auto_763490 ) ) ( not ( = ?auto_763481 ?auto_763491 ) ) ( not ( = ?auto_763481 ?auto_763492 ) ) ( not ( = ?auto_763481 ?auto_763493 ) ) ( not ( = ?auto_763481 ?auto_763494 ) ) ( not ( = ?auto_763481 ?auto_763495 ) ) ( not ( = ?auto_763481 ?auto_763496 ) ) ( not ( = ?auto_763482 ?auto_763483 ) ) ( not ( = ?auto_763482 ?auto_763484 ) ) ( not ( = ?auto_763482 ?auto_763485 ) ) ( not ( = ?auto_763482 ?auto_763486 ) ) ( not ( = ?auto_763482 ?auto_763487 ) ) ( not ( = ?auto_763482 ?auto_763488 ) ) ( not ( = ?auto_763482 ?auto_763489 ) ) ( not ( = ?auto_763482 ?auto_763490 ) ) ( not ( = ?auto_763482 ?auto_763491 ) ) ( not ( = ?auto_763482 ?auto_763492 ) ) ( not ( = ?auto_763482 ?auto_763493 ) ) ( not ( = ?auto_763482 ?auto_763494 ) ) ( not ( = ?auto_763482 ?auto_763495 ) ) ( not ( = ?auto_763482 ?auto_763496 ) ) ( not ( = ?auto_763483 ?auto_763484 ) ) ( not ( = ?auto_763483 ?auto_763485 ) ) ( not ( = ?auto_763483 ?auto_763486 ) ) ( not ( = ?auto_763483 ?auto_763487 ) ) ( not ( = ?auto_763483 ?auto_763488 ) ) ( not ( = ?auto_763483 ?auto_763489 ) ) ( not ( = ?auto_763483 ?auto_763490 ) ) ( not ( = ?auto_763483 ?auto_763491 ) ) ( not ( = ?auto_763483 ?auto_763492 ) ) ( not ( = ?auto_763483 ?auto_763493 ) ) ( not ( = ?auto_763483 ?auto_763494 ) ) ( not ( = ?auto_763483 ?auto_763495 ) ) ( not ( = ?auto_763483 ?auto_763496 ) ) ( not ( = ?auto_763484 ?auto_763485 ) ) ( not ( = ?auto_763484 ?auto_763486 ) ) ( not ( = ?auto_763484 ?auto_763487 ) ) ( not ( = ?auto_763484 ?auto_763488 ) ) ( not ( = ?auto_763484 ?auto_763489 ) ) ( not ( = ?auto_763484 ?auto_763490 ) ) ( not ( = ?auto_763484 ?auto_763491 ) ) ( not ( = ?auto_763484 ?auto_763492 ) ) ( not ( = ?auto_763484 ?auto_763493 ) ) ( not ( = ?auto_763484 ?auto_763494 ) ) ( not ( = ?auto_763484 ?auto_763495 ) ) ( not ( = ?auto_763484 ?auto_763496 ) ) ( not ( = ?auto_763485 ?auto_763486 ) ) ( not ( = ?auto_763485 ?auto_763487 ) ) ( not ( = ?auto_763485 ?auto_763488 ) ) ( not ( = ?auto_763485 ?auto_763489 ) ) ( not ( = ?auto_763485 ?auto_763490 ) ) ( not ( = ?auto_763485 ?auto_763491 ) ) ( not ( = ?auto_763485 ?auto_763492 ) ) ( not ( = ?auto_763485 ?auto_763493 ) ) ( not ( = ?auto_763485 ?auto_763494 ) ) ( not ( = ?auto_763485 ?auto_763495 ) ) ( not ( = ?auto_763485 ?auto_763496 ) ) ( not ( = ?auto_763486 ?auto_763487 ) ) ( not ( = ?auto_763486 ?auto_763488 ) ) ( not ( = ?auto_763486 ?auto_763489 ) ) ( not ( = ?auto_763486 ?auto_763490 ) ) ( not ( = ?auto_763486 ?auto_763491 ) ) ( not ( = ?auto_763486 ?auto_763492 ) ) ( not ( = ?auto_763486 ?auto_763493 ) ) ( not ( = ?auto_763486 ?auto_763494 ) ) ( not ( = ?auto_763486 ?auto_763495 ) ) ( not ( = ?auto_763486 ?auto_763496 ) ) ( not ( = ?auto_763487 ?auto_763488 ) ) ( not ( = ?auto_763487 ?auto_763489 ) ) ( not ( = ?auto_763487 ?auto_763490 ) ) ( not ( = ?auto_763487 ?auto_763491 ) ) ( not ( = ?auto_763487 ?auto_763492 ) ) ( not ( = ?auto_763487 ?auto_763493 ) ) ( not ( = ?auto_763487 ?auto_763494 ) ) ( not ( = ?auto_763487 ?auto_763495 ) ) ( not ( = ?auto_763487 ?auto_763496 ) ) ( not ( = ?auto_763488 ?auto_763489 ) ) ( not ( = ?auto_763488 ?auto_763490 ) ) ( not ( = ?auto_763488 ?auto_763491 ) ) ( not ( = ?auto_763488 ?auto_763492 ) ) ( not ( = ?auto_763488 ?auto_763493 ) ) ( not ( = ?auto_763488 ?auto_763494 ) ) ( not ( = ?auto_763488 ?auto_763495 ) ) ( not ( = ?auto_763488 ?auto_763496 ) ) ( not ( = ?auto_763489 ?auto_763490 ) ) ( not ( = ?auto_763489 ?auto_763491 ) ) ( not ( = ?auto_763489 ?auto_763492 ) ) ( not ( = ?auto_763489 ?auto_763493 ) ) ( not ( = ?auto_763489 ?auto_763494 ) ) ( not ( = ?auto_763489 ?auto_763495 ) ) ( not ( = ?auto_763489 ?auto_763496 ) ) ( not ( = ?auto_763490 ?auto_763491 ) ) ( not ( = ?auto_763490 ?auto_763492 ) ) ( not ( = ?auto_763490 ?auto_763493 ) ) ( not ( = ?auto_763490 ?auto_763494 ) ) ( not ( = ?auto_763490 ?auto_763495 ) ) ( not ( = ?auto_763490 ?auto_763496 ) ) ( not ( = ?auto_763491 ?auto_763492 ) ) ( not ( = ?auto_763491 ?auto_763493 ) ) ( not ( = ?auto_763491 ?auto_763494 ) ) ( not ( = ?auto_763491 ?auto_763495 ) ) ( not ( = ?auto_763491 ?auto_763496 ) ) ( not ( = ?auto_763492 ?auto_763493 ) ) ( not ( = ?auto_763492 ?auto_763494 ) ) ( not ( = ?auto_763492 ?auto_763495 ) ) ( not ( = ?auto_763492 ?auto_763496 ) ) ( not ( = ?auto_763493 ?auto_763494 ) ) ( not ( = ?auto_763493 ?auto_763495 ) ) ( not ( = ?auto_763493 ?auto_763496 ) ) ( not ( = ?auto_763494 ?auto_763495 ) ) ( not ( = ?auto_763494 ?auto_763496 ) ) ( not ( = ?auto_763495 ?auto_763496 ) ) ( ON ?auto_763494 ?auto_763495 ) ( ON ?auto_763493 ?auto_763494 ) ( ON ?auto_763492 ?auto_763493 ) ( ON ?auto_763491 ?auto_763492 ) ( ON ?auto_763490 ?auto_763491 ) ( ON ?auto_763489 ?auto_763490 ) ( ON ?auto_763488 ?auto_763489 ) ( ON ?auto_763487 ?auto_763488 ) ( ON ?auto_763486 ?auto_763487 ) ( ON ?auto_763485 ?auto_763486 ) ( ON ?auto_763484 ?auto_763485 ) ( ON ?auto_763483 ?auto_763484 ) ( ON ?auto_763482 ?auto_763483 ) ( ON ?auto_763481 ?auto_763482 ) ( ON ?auto_763480 ?auto_763481 ) ( CLEAR ?auto_763480 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_763480 )
      ( MAKE-16PILE ?auto_763480 ?auto_763481 ?auto_763482 ?auto_763483 ?auto_763484 ?auto_763485 ?auto_763486 ?auto_763487 ?auto_763488 ?auto_763489 ?auto_763490 ?auto_763491 ?auto_763492 ?auto_763493 ?auto_763494 ?auto_763495 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_763547 - BLOCK
      ?auto_763548 - BLOCK
      ?auto_763549 - BLOCK
      ?auto_763550 - BLOCK
      ?auto_763551 - BLOCK
      ?auto_763552 - BLOCK
      ?auto_763553 - BLOCK
      ?auto_763554 - BLOCK
      ?auto_763555 - BLOCK
      ?auto_763556 - BLOCK
      ?auto_763557 - BLOCK
      ?auto_763558 - BLOCK
      ?auto_763559 - BLOCK
      ?auto_763560 - BLOCK
      ?auto_763561 - BLOCK
      ?auto_763562 - BLOCK
      ?auto_763563 - BLOCK
    )
    :vars
    (
      ?auto_763564 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_763562 ) ( ON ?auto_763563 ?auto_763564 ) ( CLEAR ?auto_763563 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_763547 ) ( ON ?auto_763548 ?auto_763547 ) ( ON ?auto_763549 ?auto_763548 ) ( ON ?auto_763550 ?auto_763549 ) ( ON ?auto_763551 ?auto_763550 ) ( ON ?auto_763552 ?auto_763551 ) ( ON ?auto_763553 ?auto_763552 ) ( ON ?auto_763554 ?auto_763553 ) ( ON ?auto_763555 ?auto_763554 ) ( ON ?auto_763556 ?auto_763555 ) ( ON ?auto_763557 ?auto_763556 ) ( ON ?auto_763558 ?auto_763557 ) ( ON ?auto_763559 ?auto_763558 ) ( ON ?auto_763560 ?auto_763559 ) ( ON ?auto_763561 ?auto_763560 ) ( ON ?auto_763562 ?auto_763561 ) ( not ( = ?auto_763547 ?auto_763548 ) ) ( not ( = ?auto_763547 ?auto_763549 ) ) ( not ( = ?auto_763547 ?auto_763550 ) ) ( not ( = ?auto_763547 ?auto_763551 ) ) ( not ( = ?auto_763547 ?auto_763552 ) ) ( not ( = ?auto_763547 ?auto_763553 ) ) ( not ( = ?auto_763547 ?auto_763554 ) ) ( not ( = ?auto_763547 ?auto_763555 ) ) ( not ( = ?auto_763547 ?auto_763556 ) ) ( not ( = ?auto_763547 ?auto_763557 ) ) ( not ( = ?auto_763547 ?auto_763558 ) ) ( not ( = ?auto_763547 ?auto_763559 ) ) ( not ( = ?auto_763547 ?auto_763560 ) ) ( not ( = ?auto_763547 ?auto_763561 ) ) ( not ( = ?auto_763547 ?auto_763562 ) ) ( not ( = ?auto_763547 ?auto_763563 ) ) ( not ( = ?auto_763547 ?auto_763564 ) ) ( not ( = ?auto_763548 ?auto_763549 ) ) ( not ( = ?auto_763548 ?auto_763550 ) ) ( not ( = ?auto_763548 ?auto_763551 ) ) ( not ( = ?auto_763548 ?auto_763552 ) ) ( not ( = ?auto_763548 ?auto_763553 ) ) ( not ( = ?auto_763548 ?auto_763554 ) ) ( not ( = ?auto_763548 ?auto_763555 ) ) ( not ( = ?auto_763548 ?auto_763556 ) ) ( not ( = ?auto_763548 ?auto_763557 ) ) ( not ( = ?auto_763548 ?auto_763558 ) ) ( not ( = ?auto_763548 ?auto_763559 ) ) ( not ( = ?auto_763548 ?auto_763560 ) ) ( not ( = ?auto_763548 ?auto_763561 ) ) ( not ( = ?auto_763548 ?auto_763562 ) ) ( not ( = ?auto_763548 ?auto_763563 ) ) ( not ( = ?auto_763548 ?auto_763564 ) ) ( not ( = ?auto_763549 ?auto_763550 ) ) ( not ( = ?auto_763549 ?auto_763551 ) ) ( not ( = ?auto_763549 ?auto_763552 ) ) ( not ( = ?auto_763549 ?auto_763553 ) ) ( not ( = ?auto_763549 ?auto_763554 ) ) ( not ( = ?auto_763549 ?auto_763555 ) ) ( not ( = ?auto_763549 ?auto_763556 ) ) ( not ( = ?auto_763549 ?auto_763557 ) ) ( not ( = ?auto_763549 ?auto_763558 ) ) ( not ( = ?auto_763549 ?auto_763559 ) ) ( not ( = ?auto_763549 ?auto_763560 ) ) ( not ( = ?auto_763549 ?auto_763561 ) ) ( not ( = ?auto_763549 ?auto_763562 ) ) ( not ( = ?auto_763549 ?auto_763563 ) ) ( not ( = ?auto_763549 ?auto_763564 ) ) ( not ( = ?auto_763550 ?auto_763551 ) ) ( not ( = ?auto_763550 ?auto_763552 ) ) ( not ( = ?auto_763550 ?auto_763553 ) ) ( not ( = ?auto_763550 ?auto_763554 ) ) ( not ( = ?auto_763550 ?auto_763555 ) ) ( not ( = ?auto_763550 ?auto_763556 ) ) ( not ( = ?auto_763550 ?auto_763557 ) ) ( not ( = ?auto_763550 ?auto_763558 ) ) ( not ( = ?auto_763550 ?auto_763559 ) ) ( not ( = ?auto_763550 ?auto_763560 ) ) ( not ( = ?auto_763550 ?auto_763561 ) ) ( not ( = ?auto_763550 ?auto_763562 ) ) ( not ( = ?auto_763550 ?auto_763563 ) ) ( not ( = ?auto_763550 ?auto_763564 ) ) ( not ( = ?auto_763551 ?auto_763552 ) ) ( not ( = ?auto_763551 ?auto_763553 ) ) ( not ( = ?auto_763551 ?auto_763554 ) ) ( not ( = ?auto_763551 ?auto_763555 ) ) ( not ( = ?auto_763551 ?auto_763556 ) ) ( not ( = ?auto_763551 ?auto_763557 ) ) ( not ( = ?auto_763551 ?auto_763558 ) ) ( not ( = ?auto_763551 ?auto_763559 ) ) ( not ( = ?auto_763551 ?auto_763560 ) ) ( not ( = ?auto_763551 ?auto_763561 ) ) ( not ( = ?auto_763551 ?auto_763562 ) ) ( not ( = ?auto_763551 ?auto_763563 ) ) ( not ( = ?auto_763551 ?auto_763564 ) ) ( not ( = ?auto_763552 ?auto_763553 ) ) ( not ( = ?auto_763552 ?auto_763554 ) ) ( not ( = ?auto_763552 ?auto_763555 ) ) ( not ( = ?auto_763552 ?auto_763556 ) ) ( not ( = ?auto_763552 ?auto_763557 ) ) ( not ( = ?auto_763552 ?auto_763558 ) ) ( not ( = ?auto_763552 ?auto_763559 ) ) ( not ( = ?auto_763552 ?auto_763560 ) ) ( not ( = ?auto_763552 ?auto_763561 ) ) ( not ( = ?auto_763552 ?auto_763562 ) ) ( not ( = ?auto_763552 ?auto_763563 ) ) ( not ( = ?auto_763552 ?auto_763564 ) ) ( not ( = ?auto_763553 ?auto_763554 ) ) ( not ( = ?auto_763553 ?auto_763555 ) ) ( not ( = ?auto_763553 ?auto_763556 ) ) ( not ( = ?auto_763553 ?auto_763557 ) ) ( not ( = ?auto_763553 ?auto_763558 ) ) ( not ( = ?auto_763553 ?auto_763559 ) ) ( not ( = ?auto_763553 ?auto_763560 ) ) ( not ( = ?auto_763553 ?auto_763561 ) ) ( not ( = ?auto_763553 ?auto_763562 ) ) ( not ( = ?auto_763553 ?auto_763563 ) ) ( not ( = ?auto_763553 ?auto_763564 ) ) ( not ( = ?auto_763554 ?auto_763555 ) ) ( not ( = ?auto_763554 ?auto_763556 ) ) ( not ( = ?auto_763554 ?auto_763557 ) ) ( not ( = ?auto_763554 ?auto_763558 ) ) ( not ( = ?auto_763554 ?auto_763559 ) ) ( not ( = ?auto_763554 ?auto_763560 ) ) ( not ( = ?auto_763554 ?auto_763561 ) ) ( not ( = ?auto_763554 ?auto_763562 ) ) ( not ( = ?auto_763554 ?auto_763563 ) ) ( not ( = ?auto_763554 ?auto_763564 ) ) ( not ( = ?auto_763555 ?auto_763556 ) ) ( not ( = ?auto_763555 ?auto_763557 ) ) ( not ( = ?auto_763555 ?auto_763558 ) ) ( not ( = ?auto_763555 ?auto_763559 ) ) ( not ( = ?auto_763555 ?auto_763560 ) ) ( not ( = ?auto_763555 ?auto_763561 ) ) ( not ( = ?auto_763555 ?auto_763562 ) ) ( not ( = ?auto_763555 ?auto_763563 ) ) ( not ( = ?auto_763555 ?auto_763564 ) ) ( not ( = ?auto_763556 ?auto_763557 ) ) ( not ( = ?auto_763556 ?auto_763558 ) ) ( not ( = ?auto_763556 ?auto_763559 ) ) ( not ( = ?auto_763556 ?auto_763560 ) ) ( not ( = ?auto_763556 ?auto_763561 ) ) ( not ( = ?auto_763556 ?auto_763562 ) ) ( not ( = ?auto_763556 ?auto_763563 ) ) ( not ( = ?auto_763556 ?auto_763564 ) ) ( not ( = ?auto_763557 ?auto_763558 ) ) ( not ( = ?auto_763557 ?auto_763559 ) ) ( not ( = ?auto_763557 ?auto_763560 ) ) ( not ( = ?auto_763557 ?auto_763561 ) ) ( not ( = ?auto_763557 ?auto_763562 ) ) ( not ( = ?auto_763557 ?auto_763563 ) ) ( not ( = ?auto_763557 ?auto_763564 ) ) ( not ( = ?auto_763558 ?auto_763559 ) ) ( not ( = ?auto_763558 ?auto_763560 ) ) ( not ( = ?auto_763558 ?auto_763561 ) ) ( not ( = ?auto_763558 ?auto_763562 ) ) ( not ( = ?auto_763558 ?auto_763563 ) ) ( not ( = ?auto_763558 ?auto_763564 ) ) ( not ( = ?auto_763559 ?auto_763560 ) ) ( not ( = ?auto_763559 ?auto_763561 ) ) ( not ( = ?auto_763559 ?auto_763562 ) ) ( not ( = ?auto_763559 ?auto_763563 ) ) ( not ( = ?auto_763559 ?auto_763564 ) ) ( not ( = ?auto_763560 ?auto_763561 ) ) ( not ( = ?auto_763560 ?auto_763562 ) ) ( not ( = ?auto_763560 ?auto_763563 ) ) ( not ( = ?auto_763560 ?auto_763564 ) ) ( not ( = ?auto_763561 ?auto_763562 ) ) ( not ( = ?auto_763561 ?auto_763563 ) ) ( not ( = ?auto_763561 ?auto_763564 ) ) ( not ( = ?auto_763562 ?auto_763563 ) ) ( not ( = ?auto_763562 ?auto_763564 ) ) ( not ( = ?auto_763563 ?auto_763564 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_763563 ?auto_763564 )
      ( !STACK ?auto_763563 ?auto_763562 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_763617 - BLOCK
      ?auto_763618 - BLOCK
      ?auto_763619 - BLOCK
      ?auto_763620 - BLOCK
      ?auto_763621 - BLOCK
      ?auto_763622 - BLOCK
      ?auto_763623 - BLOCK
      ?auto_763624 - BLOCK
      ?auto_763625 - BLOCK
      ?auto_763626 - BLOCK
      ?auto_763627 - BLOCK
      ?auto_763628 - BLOCK
      ?auto_763629 - BLOCK
      ?auto_763630 - BLOCK
      ?auto_763631 - BLOCK
      ?auto_763632 - BLOCK
      ?auto_763633 - BLOCK
    )
    :vars
    (
      ?auto_763634 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_763633 ?auto_763634 ) ( ON-TABLE ?auto_763617 ) ( ON ?auto_763618 ?auto_763617 ) ( ON ?auto_763619 ?auto_763618 ) ( ON ?auto_763620 ?auto_763619 ) ( ON ?auto_763621 ?auto_763620 ) ( ON ?auto_763622 ?auto_763621 ) ( ON ?auto_763623 ?auto_763622 ) ( ON ?auto_763624 ?auto_763623 ) ( ON ?auto_763625 ?auto_763624 ) ( ON ?auto_763626 ?auto_763625 ) ( ON ?auto_763627 ?auto_763626 ) ( ON ?auto_763628 ?auto_763627 ) ( ON ?auto_763629 ?auto_763628 ) ( ON ?auto_763630 ?auto_763629 ) ( ON ?auto_763631 ?auto_763630 ) ( not ( = ?auto_763617 ?auto_763618 ) ) ( not ( = ?auto_763617 ?auto_763619 ) ) ( not ( = ?auto_763617 ?auto_763620 ) ) ( not ( = ?auto_763617 ?auto_763621 ) ) ( not ( = ?auto_763617 ?auto_763622 ) ) ( not ( = ?auto_763617 ?auto_763623 ) ) ( not ( = ?auto_763617 ?auto_763624 ) ) ( not ( = ?auto_763617 ?auto_763625 ) ) ( not ( = ?auto_763617 ?auto_763626 ) ) ( not ( = ?auto_763617 ?auto_763627 ) ) ( not ( = ?auto_763617 ?auto_763628 ) ) ( not ( = ?auto_763617 ?auto_763629 ) ) ( not ( = ?auto_763617 ?auto_763630 ) ) ( not ( = ?auto_763617 ?auto_763631 ) ) ( not ( = ?auto_763617 ?auto_763632 ) ) ( not ( = ?auto_763617 ?auto_763633 ) ) ( not ( = ?auto_763617 ?auto_763634 ) ) ( not ( = ?auto_763618 ?auto_763619 ) ) ( not ( = ?auto_763618 ?auto_763620 ) ) ( not ( = ?auto_763618 ?auto_763621 ) ) ( not ( = ?auto_763618 ?auto_763622 ) ) ( not ( = ?auto_763618 ?auto_763623 ) ) ( not ( = ?auto_763618 ?auto_763624 ) ) ( not ( = ?auto_763618 ?auto_763625 ) ) ( not ( = ?auto_763618 ?auto_763626 ) ) ( not ( = ?auto_763618 ?auto_763627 ) ) ( not ( = ?auto_763618 ?auto_763628 ) ) ( not ( = ?auto_763618 ?auto_763629 ) ) ( not ( = ?auto_763618 ?auto_763630 ) ) ( not ( = ?auto_763618 ?auto_763631 ) ) ( not ( = ?auto_763618 ?auto_763632 ) ) ( not ( = ?auto_763618 ?auto_763633 ) ) ( not ( = ?auto_763618 ?auto_763634 ) ) ( not ( = ?auto_763619 ?auto_763620 ) ) ( not ( = ?auto_763619 ?auto_763621 ) ) ( not ( = ?auto_763619 ?auto_763622 ) ) ( not ( = ?auto_763619 ?auto_763623 ) ) ( not ( = ?auto_763619 ?auto_763624 ) ) ( not ( = ?auto_763619 ?auto_763625 ) ) ( not ( = ?auto_763619 ?auto_763626 ) ) ( not ( = ?auto_763619 ?auto_763627 ) ) ( not ( = ?auto_763619 ?auto_763628 ) ) ( not ( = ?auto_763619 ?auto_763629 ) ) ( not ( = ?auto_763619 ?auto_763630 ) ) ( not ( = ?auto_763619 ?auto_763631 ) ) ( not ( = ?auto_763619 ?auto_763632 ) ) ( not ( = ?auto_763619 ?auto_763633 ) ) ( not ( = ?auto_763619 ?auto_763634 ) ) ( not ( = ?auto_763620 ?auto_763621 ) ) ( not ( = ?auto_763620 ?auto_763622 ) ) ( not ( = ?auto_763620 ?auto_763623 ) ) ( not ( = ?auto_763620 ?auto_763624 ) ) ( not ( = ?auto_763620 ?auto_763625 ) ) ( not ( = ?auto_763620 ?auto_763626 ) ) ( not ( = ?auto_763620 ?auto_763627 ) ) ( not ( = ?auto_763620 ?auto_763628 ) ) ( not ( = ?auto_763620 ?auto_763629 ) ) ( not ( = ?auto_763620 ?auto_763630 ) ) ( not ( = ?auto_763620 ?auto_763631 ) ) ( not ( = ?auto_763620 ?auto_763632 ) ) ( not ( = ?auto_763620 ?auto_763633 ) ) ( not ( = ?auto_763620 ?auto_763634 ) ) ( not ( = ?auto_763621 ?auto_763622 ) ) ( not ( = ?auto_763621 ?auto_763623 ) ) ( not ( = ?auto_763621 ?auto_763624 ) ) ( not ( = ?auto_763621 ?auto_763625 ) ) ( not ( = ?auto_763621 ?auto_763626 ) ) ( not ( = ?auto_763621 ?auto_763627 ) ) ( not ( = ?auto_763621 ?auto_763628 ) ) ( not ( = ?auto_763621 ?auto_763629 ) ) ( not ( = ?auto_763621 ?auto_763630 ) ) ( not ( = ?auto_763621 ?auto_763631 ) ) ( not ( = ?auto_763621 ?auto_763632 ) ) ( not ( = ?auto_763621 ?auto_763633 ) ) ( not ( = ?auto_763621 ?auto_763634 ) ) ( not ( = ?auto_763622 ?auto_763623 ) ) ( not ( = ?auto_763622 ?auto_763624 ) ) ( not ( = ?auto_763622 ?auto_763625 ) ) ( not ( = ?auto_763622 ?auto_763626 ) ) ( not ( = ?auto_763622 ?auto_763627 ) ) ( not ( = ?auto_763622 ?auto_763628 ) ) ( not ( = ?auto_763622 ?auto_763629 ) ) ( not ( = ?auto_763622 ?auto_763630 ) ) ( not ( = ?auto_763622 ?auto_763631 ) ) ( not ( = ?auto_763622 ?auto_763632 ) ) ( not ( = ?auto_763622 ?auto_763633 ) ) ( not ( = ?auto_763622 ?auto_763634 ) ) ( not ( = ?auto_763623 ?auto_763624 ) ) ( not ( = ?auto_763623 ?auto_763625 ) ) ( not ( = ?auto_763623 ?auto_763626 ) ) ( not ( = ?auto_763623 ?auto_763627 ) ) ( not ( = ?auto_763623 ?auto_763628 ) ) ( not ( = ?auto_763623 ?auto_763629 ) ) ( not ( = ?auto_763623 ?auto_763630 ) ) ( not ( = ?auto_763623 ?auto_763631 ) ) ( not ( = ?auto_763623 ?auto_763632 ) ) ( not ( = ?auto_763623 ?auto_763633 ) ) ( not ( = ?auto_763623 ?auto_763634 ) ) ( not ( = ?auto_763624 ?auto_763625 ) ) ( not ( = ?auto_763624 ?auto_763626 ) ) ( not ( = ?auto_763624 ?auto_763627 ) ) ( not ( = ?auto_763624 ?auto_763628 ) ) ( not ( = ?auto_763624 ?auto_763629 ) ) ( not ( = ?auto_763624 ?auto_763630 ) ) ( not ( = ?auto_763624 ?auto_763631 ) ) ( not ( = ?auto_763624 ?auto_763632 ) ) ( not ( = ?auto_763624 ?auto_763633 ) ) ( not ( = ?auto_763624 ?auto_763634 ) ) ( not ( = ?auto_763625 ?auto_763626 ) ) ( not ( = ?auto_763625 ?auto_763627 ) ) ( not ( = ?auto_763625 ?auto_763628 ) ) ( not ( = ?auto_763625 ?auto_763629 ) ) ( not ( = ?auto_763625 ?auto_763630 ) ) ( not ( = ?auto_763625 ?auto_763631 ) ) ( not ( = ?auto_763625 ?auto_763632 ) ) ( not ( = ?auto_763625 ?auto_763633 ) ) ( not ( = ?auto_763625 ?auto_763634 ) ) ( not ( = ?auto_763626 ?auto_763627 ) ) ( not ( = ?auto_763626 ?auto_763628 ) ) ( not ( = ?auto_763626 ?auto_763629 ) ) ( not ( = ?auto_763626 ?auto_763630 ) ) ( not ( = ?auto_763626 ?auto_763631 ) ) ( not ( = ?auto_763626 ?auto_763632 ) ) ( not ( = ?auto_763626 ?auto_763633 ) ) ( not ( = ?auto_763626 ?auto_763634 ) ) ( not ( = ?auto_763627 ?auto_763628 ) ) ( not ( = ?auto_763627 ?auto_763629 ) ) ( not ( = ?auto_763627 ?auto_763630 ) ) ( not ( = ?auto_763627 ?auto_763631 ) ) ( not ( = ?auto_763627 ?auto_763632 ) ) ( not ( = ?auto_763627 ?auto_763633 ) ) ( not ( = ?auto_763627 ?auto_763634 ) ) ( not ( = ?auto_763628 ?auto_763629 ) ) ( not ( = ?auto_763628 ?auto_763630 ) ) ( not ( = ?auto_763628 ?auto_763631 ) ) ( not ( = ?auto_763628 ?auto_763632 ) ) ( not ( = ?auto_763628 ?auto_763633 ) ) ( not ( = ?auto_763628 ?auto_763634 ) ) ( not ( = ?auto_763629 ?auto_763630 ) ) ( not ( = ?auto_763629 ?auto_763631 ) ) ( not ( = ?auto_763629 ?auto_763632 ) ) ( not ( = ?auto_763629 ?auto_763633 ) ) ( not ( = ?auto_763629 ?auto_763634 ) ) ( not ( = ?auto_763630 ?auto_763631 ) ) ( not ( = ?auto_763630 ?auto_763632 ) ) ( not ( = ?auto_763630 ?auto_763633 ) ) ( not ( = ?auto_763630 ?auto_763634 ) ) ( not ( = ?auto_763631 ?auto_763632 ) ) ( not ( = ?auto_763631 ?auto_763633 ) ) ( not ( = ?auto_763631 ?auto_763634 ) ) ( not ( = ?auto_763632 ?auto_763633 ) ) ( not ( = ?auto_763632 ?auto_763634 ) ) ( not ( = ?auto_763633 ?auto_763634 ) ) ( CLEAR ?auto_763631 ) ( ON ?auto_763632 ?auto_763633 ) ( CLEAR ?auto_763632 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-16PILE ?auto_763617 ?auto_763618 ?auto_763619 ?auto_763620 ?auto_763621 ?auto_763622 ?auto_763623 ?auto_763624 ?auto_763625 ?auto_763626 ?auto_763627 ?auto_763628 ?auto_763629 ?auto_763630 ?auto_763631 ?auto_763632 )
      ( MAKE-17PILE ?auto_763617 ?auto_763618 ?auto_763619 ?auto_763620 ?auto_763621 ?auto_763622 ?auto_763623 ?auto_763624 ?auto_763625 ?auto_763626 ?auto_763627 ?auto_763628 ?auto_763629 ?auto_763630 ?auto_763631 ?auto_763632 ?auto_763633 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_763687 - BLOCK
      ?auto_763688 - BLOCK
      ?auto_763689 - BLOCK
      ?auto_763690 - BLOCK
      ?auto_763691 - BLOCK
      ?auto_763692 - BLOCK
      ?auto_763693 - BLOCK
      ?auto_763694 - BLOCK
      ?auto_763695 - BLOCK
      ?auto_763696 - BLOCK
      ?auto_763697 - BLOCK
      ?auto_763698 - BLOCK
      ?auto_763699 - BLOCK
      ?auto_763700 - BLOCK
      ?auto_763701 - BLOCK
      ?auto_763702 - BLOCK
      ?auto_763703 - BLOCK
    )
    :vars
    (
      ?auto_763704 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_763703 ?auto_763704 ) ( ON-TABLE ?auto_763687 ) ( ON ?auto_763688 ?auto_763687 ) ( ON ?auto_763689 ?auto_763688 ) ( ON ?auto_763690 ?auto_763689 ) ( ON ?auto_763691 ?auto_763690 ) ( ON ?auto_763692 ?auto_763691 ) ( ON ?auto_763693 ?auto_763692 ) ( ON ?auto_763694 ?auto_763693 ) ( ON ?auto_763695 ?auto_763694 ) ( ON ?auto_763696 ?auto_763695 ) ( ON ?auto_763697 ?auto_763696 ) ( ON ?auto_763698 ?auto_763697 ) ( ON ?auto_763699 ?auto_763698 ) ( ON ?auto_763700 ?auto_763699 ) ( not ( = ?auto_763687 ?auto_763688 ) ) ( not ( = ?auto_763687 ?auto_763689 ) ) ( not ( = ?auto_763687 ?auto_763690 ) ) ( not ( = ?auto_763687 ?auto_763691 ) ) ( not ( = ?auto_763687 ?auto_763692 ) ) ( not ( = ?auto_763687 ?auto_763693 ) ) ( not ( = ?auto_763687 ?auto_763694 ) ) ( not ( = ?auto_763687 ?auto_763695 ) ) ( not ( = ?auto_763687 ?auto_763696 ) ) ( not ( = ?auto_763687 ?auto_763697 ) ) ( not ( = ?auto_763687 ?auto_763698 ) ) ( not ( = ?auto_763687 ?auto_763699 ) ) ( not ( = ?auto_763687 ?auto_763700 ) ) ( not ( = ?auto_763687 ?auto_763701 ) ) ( not ( = ?auto_763687 ?auto_763702 ) ) ( not ( = ?auto_763687 ?auto_763703 ) ) ( not ( = ?auto_763687 ?auto_763704 ) ) ( not ( = ?auto_763688 ?auto_763689 ) ) ( not ( = ?auto_763688 ?auto_763690 ) ) ( not ( = ?auto_763688 ?auto_763691 ) ) ( not ( = ?auto_763688 ?auto_763692 ) ) ( not ( = ?auto_763688 ?auto_763693 ) ) ( not ( = ?auto_763688 ?auto_763694 ) ) ( not ( = ?auto_763688 ?auto_763695 ) ) ( not ( = ?auto_763688 ?auto_763696 ) ) ( not ( = ?auto_763688 ?auto_763697 ) ) ( not ( = ?auto_763688 ?auto_763698 ) ) ( not ( = ?auto_763688 ?auto_763699 ) ) ( not ( = ?auto_763688 ?auto_763700 ) ) ( not ( = ?auto_763688 ?auto_763701 ) ) ( not ( = ?auto_763688 ?auto_763702 ) ) ( not ( = ?auto_763688 ?auto_763703 ) ) ( not ( = ?auto_763688 ?auto_763704 ) ) ( not ( = ?auto_763689 ?auto_763690 ) ) ( not ( = ?auto_763689 ?auto_763691 ) ) ( not ( = ?auto_763689 ?auto_763692 ) ) ( not ( = ?auto_763689 ?auto_763693 ) ) ( not ( = ?auto_763689 ?auto_763694 ) ) ( not ( = ?auto_763689 ?auto_763695 ) ) ( not ( = ?auto_763689 ?auto_763696 ) ) ( not ( = ?auto_763689 ?auto_763697 ) ) ( not ( = ?auto_763689 ?auto_763698 ) ) ( not ( = ?auto_763689 ?auto_763699 ) ) ( not ( = ?auto_763689 ?auto_763700 ) ) ( not ( = ?auto_763689 ?auto_763701 ) ) ( not ( = ?auto_763689 ?auto_763702 ) ) ( not ( = ?auto_763689 ?auto_763703 ) ) ( not ( = ?auto_763689 ?auto_763704 ) ) ( not ( = ?auto_763690 ?auto_763691 ) ) ( not ( = ?auto_763690 ?auto_763692 ) ) ( not ( = ?auto_763690 ?auto_763693 ) ) ( not ( = ?auto_763690 ?auto_763694 ) ) ( not ( = ?auto_763690 ?auto_763695 ) ) ( not ( = ?auto_763690 ?auto_763696 ) ) ( not ( = ?auto_763690 ?auto_763697 ) ) ( not ( = ?auto_763690 ?auto_763698 ) ) ( not ( = ?auto_763690 ?auto_763699 ) ) ( not ( = ?auto_763690 ?auto_763700 ) ) ( not ( = ?auto_763690 ?auto_763701 ) ) ( not ( = ?auto_763690 ?auto_763702 ) ) ( not ( = ?auto_763690 ?auto_763703 ) ) ( not ( = ?auto_763690 ?auto_763704 ) ) ( not ( = ?auto_763691 ?auto_763692 ) ) ( not ( = ?auto_763691 ?auto_763693 ) ) ( not ( = ?auto_763691 ?auto_763694 ) ) ( not ( = ?auto_763691 ?auto_763695 ) ) ( not ( = ?auto_763691 ?auto_763696 ) ) ( not ( = ?auto_763691 ?auto_763697 ) ) ( not ( = ?auto_763691 ?auto_763698 ) ) ( not ( = ?auto_763691 ?auto_763699 ) ) ( not ( = ?auto_763691 ?auto_763700 ) ) ( not ( = ?auto_763691 ?auto_763701 ) ) ( not ( = ?auto_763691 ?auto_763702 ) ) ( not ( = ?auto_763691 ?auto_763703 ) ) ( not ( = ?auto_763691 ?auto_763704 ) ) ( not ( = ?auto_763692 ?auto_763693 ) ) ( not ( = ?auto_763692 ?auto_763694 ) ) ( not ( = ?auto_763692 ?auto_763695 ) ) ( not ( = ?auto_763692 ?auto_763696 ) ) ( not ( = ?auto_763692 ?auto_763697 ) ) ( not ( = ?auto_763692 ?auto_763698 ) ) ( not ( = ?auto_763692 ?auto_763699 ) ) ( not ( = ?auto_763692 ?auto_763700 ) ) ( not ( = ?auto_763692 ?auto_763701 ) ) ( not ( = ?auto_763692 ?auto_763702 ) ) ( not ( = ?auto_763692 ?auto_763703 ) ) ( not ( = ?auto_763692 ?auto_763704 ) ) ( not ( = ?auto_763693 ?auto_763694 ) ) ( not ( = ?auto_763693 ?auto_763695 ) ) ( not ( = ?auto_763693 ?auto_763696 ) ) ( not ( = ?auto_763693 ?auto_763697 ) ) ( not ( = ?auto_763693 ?auto_763698 ) ) ( not ( = ?auto_763693 ?auto_763699 ) ) ( not ( = ?auto_763693 ?auto_763700 ) ) ( not ( = ?auto_763693 ?auto_763701 ) ) ( not ( = ?auto_763693 ?auto_763702 ) ) ( not ( = ?auto_763693 ?auto_763703 ) ) ( not ( = ?auto_763693 ?auto_763704 ) ) ( not ( = ?auto_763694 ?auto_763695 ) ) ( not ( = ?auto_763694 ?auto_763696 ) ) ( not ( = ?auto_763694 ?auto_763697 ) ) ( not ( = ?auto_763694 ?auto_763698 ) ) ( not ( = ?auto_763694 ?auto_763699 ) ) ( not ( = ?auto_763694 ?auto_763700 ) ) ( not ( = ?auto_763694 ?auto_763701 ) ) ( not ( = ?auto_763694 ?auto_763702 ) ) ( not ( = ?auto_763694 ?auto_763703 ) ) ( not ( = ?auto_763694 ?auto_763704 ) ) ( not ( = ?auto_763695 ?auto_763696 ) ) ( not ( = ?auto_763695 ?auto_763697 ) ) ( not ( = ?auto_763695 ?auto_763698 ) ) ( not ( = ?auto_763695 ?auto_763699 ) ) ( not ( = ?auto_763695 ?auto_763700 ) ) ( not ( = ?auto_763695 ?auto_763701 ) ) ( not ( = ?auto_763695 ?auto_763702 ) ) ( not ( = ?auto_763695 ?auto_763703 ) ) ( not ( = ?auto_763695 ?auto_763704 ) ) ( not ( = ?auto_763696 ?auto_763697 ) ) ( not ( = ?auto_763696 ?auto_763698 ) ) ( not ( = ?auto_763696 ?auto_763699 ) ) ( not ( = ?auto_763696 ?auto_763700 ) ) ( not ( = ?auto_763696 ?auto_763701 ) ) ( not ( = ?auto_763696 ?auto_763702 ) ) ( not ( = ?auto_763696 ?auto_763703 ) ) ( not ( = ?auto_763696 ?auto_763704 ) ) ( not ( = ?auto_763697 ?auto_763698 ) ) ( not ( = ?auto_763697 ?auto_763699 ) ) ( not ( = ?auto_763697 ?auto_763700 ) ) ( not ( = ?auto_763697 ?auto_763701 ) ) ( not ( = ?auto_763697 ?auto_763702 ) ) ( not ( = ?auto_763697 ?auto_763703 ) ) ( not ( = ?auto_763697 ?auto_763704 ) ) ( not ( = ?auto_763698 ?auto_763699 ) ) ( not ( = ?auto_763698 ?auto_763700 ) ) ( not ( = ?auto_763698 ?auto_763701 ) ) ( not ( = ?auto_763698 ?auto_763702 ) ) ( not ( = ?auto_763698 ?auto_763703 ) ) ( not ( = ?auto_763698 ?auto_763704 ) ) ( not ( = ?auto_763699 ?auto_763700 ) ) ( not ( = ?auto_763699 ?auto_763701 ) ) ( not ( = ?auto_763699 ?auto_763702 ) ) ( not ( = ?auto_763699 ?auto_763703 ) ) ( not ( = ?auto_763699 ?auto_763704 ) ) ( not ( = ?auto_763700 ?auto_763701 ) ) ( not ( = ?auto_763700 ?auto_763702 ) ) ( not ( = ?auto_763700 ?auto_763703 ) ) ( not ( = ?auto_763700 ?auto_763704 ) ) ( not ( = ?auto_763701 ?auto_763702 ) ) ( not ( = ?auto_763701 ?auto_763703 ) ) ( not ( = ?auto_763701 ?auto_763704 ) ) ( not ( = ?auto_763702 ?auto_763703 ) ) ( not ( = ?auto_763702 ?auto_763704 ) ) ( not ( = ?auto_763703 ?auto_763704 ) ) ( ON ?auto_763702 ?auto_763703 ) ( CLEAR ?auto_763700 ) ( ON ?auto_763701 ?auto_763702 ) ( CLEAR ?auto_763701 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_763687 ?auto_763688 ?auto_763689 ?auto_763690 ?auto_763691 ?auto_763692 ?auto_763693 ?auto_763694 ?auto_763695 ?auto_763696 ?auto_763697 ?auto_763698 ?auto_763699 ?auto_763700 ?auto_763701 )
      ( MAKE-17PILE ?auto_763687 ?auto_763688 ?auto_763689 ?auto_763690 ?auto_763691 ?auto_763692 ?auto_763693 ?auto_763694 ?auto_763695 ?auto_763696 ?auto_763697 ?auto_763698 ?auto_763699 ?auto_763700 ?auto_763701 ?auto_763702 ?auto_763703 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_763757 - BLOCK
      ?auto_763758 - BLOCK
      ?auto_763759 - BLOCK
      ?auto_763760 - BLOCK
      ?auto_763761 - BLOCK
      ?auto_763762 - BLOCK
      ?auto_763763 - BLOCK
      ?auto_763764 - BLOCK
      ?auto_763765 - BLOCK
      ?auto_763766 - BLOCK
      ?auto_763767 - BLOCK
      ?auto_763768 - BLOCK
      ?auto_763769 - BLOCK
      ?auto_763770 - BLOCK
      ?auto_763771 - BLOCK
      ?auto_763772 - BLOCK
      ?auto_763773 - BLOCK
    )
    :vars
    (
      ?auto_763774 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_763773 ?auto_763774 ) ( ON-TABLE ?auto_763757 ) ( ON ?auto_763758 ?auto_763757 ) ( ON ?auto_763759 ?auto_763758 ) ( ON ?auto_763760 ?auto_763759 ) ( ON ?auto_763761 ?auto_763760 ) ( ON ?auto_763762 ?auto_763761 ) ( ON ?auto_763763 ?auto_763762 ) ( ON ?auto_763764 ?auto_763763 ) ( ON ?auto_763765 ?auto_763764 ) ( ON ?auto_763766 ?auto_763765 ) ( ON ?auto_763767 ?auto_763766 ) ( ON ?auto_763768 ?auto_763767 ) ( ON ?auto_763769 ?auto_763768 ) ( not ( = ?auto_763757 ?auto_763758 ) ) ( not ( = ?auto_763757 ?auto_763759 ) ) ( not ( = ?auto_763757 ?auto_763760 ) ) ( not ( = ?auto_763757 ?auto_763761 ) ) ( not ( = ?auto_763757 ?auto_763762 ) ) ( not ( = ?auto_763757 ?auto_763763 ) ) ( not ( = ?auto_763757 ?auto_763764 ) ) ( not ( = ?auto_763757 ?auto_763765 ) ) ( not ( = ?auto_763757 ?auto_763766 ) ) ( not ( = ?auto_763757 ?auto_763767 ) ) ( not ( = ?auto_763757 ?auto_763768 ) ) ( not ( = ?auto_763757 ?auto_763769 ) ) ( not ( = ?auto_763757 ?auto_763770 ) ) ( not ( = ?auto_763757 ?auto_763771 ) ) ( not ( = ?auto_763757 ?auto_763772 ) ) ( not ( = ?auto_763757 ?auto_763773 ) ) ( not ( = ?auto_763757 ?auto_763774 ) ) ( not ( = ?auto_763758 ?auto_763759 ) ) ( not ( = ?auto_763758 ?auto_763760 ) ) ( not ( = ?auto_763758 ?auto_763761 ) ) ( not ( = ?auto_763758 ?auto_763762 ) ) ( not ( = ?auto_763758 ?auto_763763 ) ) ( not ( = ?auto_763758 ?auto_763764 ) ) ( not ( = ?auto_763758 ?auto_763765 ) ) ( not ( = ?auto_763758 ?auto_763766 ) ) ( not ( = ?auto_763758 ?auto_763767 ) ) ( not ( = ?auto_763758 ?auto_763768 ) ) ( not ( = ?auto_763758 ?auto_763769 ) ) ( not ( = ?auto_763758 ?auto_763770 ) ) ( not ( = ?auto_763758 ?auto_763771 ) ) ( not ( = ?auto_763758 ?auto_763772 ) ) ( not ( = ?auto_763758 ?auto_763773 ) ) ( not ( = ?auto_763758 ?auto_763774 ) ) ( not ( = ?auto_763759 ?auto_763760 ) ) ( not ( = ?auto_763759 ?auto_763761 ) ) ( not ( = ?auto_763759 ?auto_763762 ) ) ( not ( = ?auto_763759 ?auto_763763 ) ) ( not ( = ?auto_763759 ?auto_763764 ) ) ( not ( = ?auto_763759 ?auto_763765 ) ) ( not ( = ?auto_763759 ?auto_763766 ) ) ( not ( = ?auto_763759 ?auto_763767 ) ) ( not ( = ?auto_763759 ?auto_763768 ) ) ( not ( = ?auto_763759 ?auto_763769 ) ) ( not ( = ?auto_763759 ?auto_763770 ) ) ( not ( = ?auto_763759 ?auto_763771 ) ) ( not ( = ?auto_763759 ?auto_763772 ) ) ( not ( = ?auto_763759 ?auto_763773 ) ) ( not ( = ?auto_763759 ?auto_763774 ) ) ( not ( = ?auto_763760 ?auto_763761 ) ) ( not ( = ?auto_763760 ?auto_763762 ) ) ( not ( = ?auto_763760 ?auto_763763 ) ) ( not ( = ?auto_763760 ?auto_763764 ) ) ( not ( = ?auto_763760 ?auto_763765 ) ) ( not ( = ?auto_763760 ?auto_763766 ) ) ( not ( = ?auto_763760 ?auto_763767 ) ) ( not ( = ?auto_763760 ?auto_763768 ) ) ( not ( = ?auto_763760 ?auto_763769 ) ) ( not ( = ?auto_763760 ?auto_763770 ) ) ( not ( = ?auto_763760 ?auto_763771 ) ) ( not ( = ?auto_763760 ?auto_763772 ) ) ( not ( = ?auto_763760 ?auto_763773 ) ) ( not ( = ?auto_763760 ?auto_763774 ) ) ( not ( = ?auto_763761 ?auto_763762 ) ) ( not ( = ?auto_763761 ?auto_763763 ) ) ( not ( = ?auto_763761 ?auto_763764 ) ) ( not ( = ?auto_763761 ?auto_763765 ) ) ( not ( = ?auto_763761 ?auto_763766 ) ) ( not ( = ?auto_763761 ?auto_763767 ) ) ( not ( = ?auto_763761 ?auto_763768 ) ) ( not ( = ?auto_763761 ?auto_763769 ) ) ( not ( = ?auto_763761 ?auto_763770 ) ) ( not ( = ?auto_763761 ?auto_763771 ) ) ( not ( = ?auto_763761 ?auto_763772 ) ) ( not ( = ?auto_763761 ?auto_763773 ) ) ( not ( = ?auto_763761 ?auto_763774 ) ) ( not ( = ?auto_763762 ?auto_763763 ) ) ( not ( = ?auto_763762 ?auto_763764 ) ) ( not ( = ?auto_763762 ?auto_763765 ) ) ( not ( = ?auto_763762 ?auto_763766 ) ) ( not ( = ?auto_763762 ?auto_763767 ) ) ( not ( = ?auto_763762 ?auto_763768 ) ) ( not ( = ?auto_763762 ?auto_763769 ) ) ( not ( = ?auto_763762 ?auto_763770 ) ) ( not ( = ?auto_763762 ?auto_763771 ) ) ( not ( = ?auto_763762 ?auto_763772 ) ) ( not ( = ?auto_763762 ?auto_763773 ) ) ( not ( = ?auto_763762 ?auto_763774 ) ) ( not ( = ?auto_763763 ?auto_763764 ) ) ( not ( = ?auto_763763 ?auto_763765 ) ) ( not ( = ?auto_763763 ?auto_763766 ) ) ( not ( = ?auto_763763 ?auto_763767 ) ) ( not ( = ?auto_763763 ?auto_763768 ) ) ( not ( = ?auto_763763 ?auto_763769 ) ) ( not ( = ?auto_763763 ?auto_763770 ) ) ( not ( = ?auto_763763 ?auto_763771 ) ) ( not ( = ?auto_763763 ?auto_763772 ) ) ( not ( = ?auto_763763 ?auto_763773 ) ) ( not ( = ?auto_763763 ?auto_763774 ) ) ( not ( = ?auto_763764 ?auto_763765 ) ) ( not ( = ?auto_763764 ?auto_763766 ) ) ( not ( = ?auto_763764 ?auto_763767 ) ) ( not ( = ?auto_763764 ?auto_763768 ) ) ( not ( = ?auto_763764 ?auto_763769 ) ) ( not ( = ?auto_763764 ?auto_763770 ) ) ( not ( = ?auto_763764 ?auto_763771 ) ) ( not ( = ?auto_763764 ?auto_763772 ) ) ( not ( = ?auto_763764 ?auto_763773 ) ) ( not ( = ?auto_763764 ?auto_763774 ) ) ( not ( = ?auto_763765 ?auto_763766 ) ) ( not ( = ?auto_763765 ?auto_763767 ) ) ( not ( = ?auto_763765 ?auto_763768 ) ) ( not ( = ?auto_763765 ?auto_763769 ) ) ( not ( = ?auto_763765 ?auto_763770 ) ) ( not ( = ?auto_763765 ?auto_763771 ) ) ( not ( = ?auto_763765 ?auto_763772 ) ) ( not ( = ?auto_763765 ?auto_763773 ) ) ( not ( = ?auto_763765 ?auto_763774 ) ) ( not ( = ?auto_763766 ?auto_763767 ) ) ( not ( = ?auto_763766 ?auto_763768 ) ) ( not ( = ?auto_763766 ?auto_763769 ) ) ( not ( = ?auto_763766 ?auto_763770 ) ) ( not ( = ?auto_763766 ?auto_763771 ) ) ( not ( = ?auto_763766 ?auto_763772 ) ) ( not ( = ?auto_763766 ?auto_763773 ) ) ( not ( = ?auto_763766 ?auto_763774 ) ) ( not ( = ?auto_763767 ?auto_763768 ) ) ( not ( = ?auto_763767 ?auto_763769 ) ) ( not ( = ?auto_763767 ?auto_763770 ) ) ( not ( = ?auto_763767 ?auto_763771 ) ) ( not ( = ?auto_763767 ?auto_763772 ) ) ( not ( = ?auto_763767 ?auto_763773 ) ) ( not ( = ?auto_763767 ?auto_763774 ) ) ( not ( = ?auto_763768 ?auto_763769 ) ) ( not ( = ?auto_763768 ?auto_763770 ) ) ( not ( = ?auto_763768 ?auto_763771 ) ) ( not ( = ?auto_763768 ?auto_763772 ) ) ( not ( = ?auto_763768 ?auto_763773 ) ) ( not ( = ?auto_763768 ?auto_763774 ) ) ( not ( = ?auto_763769 ?auto_763770 ) ) ( not ( = ?auto_763769 ?auto_763771 ) ) ( not ( = ?auto_763769 ?auto_763772 ) ) ( not ( = ?auto_763769 ?auto_763773 ) ) ( not ( = ?auto_763769 ?auto_763774 ) ) ( not ( = ?auto_763770 ?auto_763771 ) ) ( not ( = ?auto_763770 ?auto_763772 ) ) ( not ( = ?auto_763770 ?auto_763773 ) ) ( not ( = ?auto_763770 ?auto_763774 ) ) ( not ( = ?auto_763771 ?auto_763772 ) ) ( not ( = ?auto_763771 ?auto_763773 ) ) ( not ( = ?auto_763771 ?auto_763774 ) ) ( not ( = ?auto_763772 ?auto_763773 ) ) ( not ( = ?auto_763772 ?auto_763774 ) ) ( not ( = ?auto_763773 ?auto_763774 ) ) ( ON ?auto_763772 ?auto_763773 ) ( ON ?auto_763771 ?auto_763772 ) ( CLEAR ?auto_763769 ) ( ON ?auto_763770 ?auto_763771 ) ( CLEAR ?auto_763770 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_763757 ?auto_763758 ?auto_763759 ?auto_763760 ?auto_763761 ?auto_763762 ?auto_763763 ?auto_763764 ?auto_763765 ?auto_763766 ?auto_763767 ?auto_763768 ?auto_763769 ?auto_763770 )
      ( MAKE-17PILE ?auto_763757 ?auto_763758 ?auto_763759 ?auto_763760 ?auto_763761 ?auto_763762 ?auto_763763 ?auto_763764 ?auto_763765 ?auto_763766 ?auto_763767 ?auto_763768 ?auto_763769 ?auto_763770 ?auto_763771 ?auto_763772 ?auto_763773 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_763827 - BLOCK
      ?auto_763828 - BLOCK
      ?auto_763829 - BLOCK
      ?auto_763830 - BLOCK
      ?auto_763831 - BLOCK
      ?auto_763832 - BLOCK
      ?auto_763833 - BLOCK
      ?auto_763834 - BLOCK
      ?auto_763835 - BLOCK
      ?auto_763836 - BLOCK
      ?auto_763837 - BLOCK
      ?auto_763838 - BLOCK
      ?auto_763839 - BLOCK
      ?auto_763840 - BLOCK
      ?auto_763841 - BLOCK
      ?auto_763842 - BLOCK
      ?auto_763843 - BLOCK
    )
    :vars
    (
      ?auto_763844 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_763843 ?auto_763844 ) ( ON-TABLE ?auto_763827 ) ( ON ?auto_763828 ?auto_763827 ) ( ON ?auto_763829 ?auto_763828 ) ( ON ?auto_763830 ?auto_763829 ) ( ON ?auto_763831 ?auto_763830 ) ( ON ?auto_763832 ?auto_763831 ) ( ON ?auto_763833 ?auto_763832 ) ( ON ?auto_763834 ?auto_763833 ) ( ON ?auto_763835 ?auto_763834 ) ( ON ?auto_763836 ?auto_763835 ) ( ON ?auto_763837 ?auto_763836 ) ( ON ?auto_763838 ?auto_763837 ) ( not ( = ?auto_763827 ?auto_763828 ) ) ( not ( = ?auto_763827 ?auto_763829 ) ) ( not ( = ?auto_763827 ?auto_763830 ) ) ( not ( = ?auto_763827 ?auto_763831 ) ) ( not ( = ?auto_763827 ?auto_763832 ) ) ( not ( = ?auto_763827 ?auto_763833 ) ) ( not ( = ?auto_763827 ?auto_763834 ) ) ( not ( = ?auto_763827 ?auto_763835 ) ) ( not ( = ?auto_763827 ?auto_763836 ) ) ( not ( = ?auto_763827 ?auto_763837 ) ) ( not ( = ?auto_763827 ?auto_763838 ) ) ( not ( = ?auto_763827 ?auto_763839 ) ) ( not ( = ?auto_763827 ?auto_763840 ) ) ( not ( = ?auto_763827 ?auto_763841 ) ) ( not ( = ?auto_763827 ?auto_763842 ) ) ( not ( = ?auto_763827 ?auto_763843 ) ) ( not ( = ?auto_763827 ?auto_763844 ) ) ( not ( = ?auto_763828 ?auto_763829 ) ) ( not ( = ?auto_763828 ?auto_763830 ) ) ( not ( = ?auto_763828 ?auto_763831 ) ) ( not ( = ?auto_763828 ?auto_763832 ) ) ( not ( = ?auto_763828 ?auto_763833 ) ) ( not ( = ?auto_763828 ?auto_763834 ) ) ( not ( = ?auto_763828 ?auto_763835 ) ) ( not ( = ?auto_763828 ?auto_763836 ) ) ( not ( = ?auto_763828 ?auto_763837 ) ) ( not ( = ?auto_763828 ?auto_763838 ) ) ( not ( = ?auto_763828 ?auto_763839 ) ) ( not ( = ?auto_763828 ?auto_763840 ) ) ( not ( = ?auto_763828 ?auto_763841 ) ) ( not ( = ?auto_763828 ?auto_763842 ) ) ( not ( = ?auto_763828 ?auto_763843 ) ) ( not ( = ?auto_763828 ?auto_763844 ) ) ( not ( = ?auto_763829 ?auto_763830 ) ) ( not ( = ?auto_763829 ?auto_763831 ) ) ( not ( = ?auto_763829 ?auto_763832 ) ) ( not ( = ?auto_763829 ?auto_763833 ) ) ( not ( = ?auto_763829 ?auto_763834 ) ) ( not ( = ?auto_763829 ?auto_763835 ) ) ( not ( = ?auto_763829 ?auto_763836 ) ) ( not ( = ?auto_763829 ?auto_763837 ) ) ( not ( = ?auto_763829 ?auto_763838 ) ) ( not ( = ?auto_763829 ?auto_763839 ) ) ( not ( = ?auto_763829 ?auto_763840 ) ) ( not ( = ?auto_763829 ?auto_763841 ) ) ( not ( = ?auto_763829 ?auto_763842 ) ) ( not ( = ?auto_763829 ?auto_763843 ) ) ( not ( = ?auto_763829 ?auto_763844 ) ) ( not ( = ?auto_763830 ?auto_763831 ) ) ( not ( = ?auto_763830 ?auto_763832 ) ) ( not ( = ?auto_763830 ?auto_763833 ) ) ( not ( = ?auto_763830 ?auto_763834 ) ) ( not ( = ?auto_763830 ?auto_763835 ) ) ( not ( = ?auto_763830 ?auto_763836 ) ) ( not ( = ?auto_763830 ?auto_763837 ) ) ( not ( = ?auto_763830 ?auto_763838 ) ) ( not ( = ?auto_763830 ?auto_763839 ) ) ( not ( = ?auto_763830 ?auto_763840 ) ) ( not ( = ?auto_763830 ?auto_763841 ) ) ( not ( = ?auto_763830 ?auto_763842 ) ) ( not ( = ?auto_763830 ?auto_763843 ) ) ( not ( = ?auto_763830 ?auto_763844 ) ) ( not ( = ?auto_763831 ?auto_763832 ) ) ( not ( = ?auto_763831 ?auto_763833 ) ) ( not ( = ?auto_763831 ?auto_763834 ) ) ( not ( = ?auto_763831 ?auto_763835 ) ) ( not ( = ?auto_763831 ?auto_763836 ) ) ( not ( = ?auto_763831 ?auto_763837 ) ) ( not ( = ?auto_763831 ?auto_763838 ) ) ( not ( = ?auto_763831 ?auto_763839 ) ) ( not ( = ?auto_763831 ?auto_763840 ) ) ( not ( = ?auto_763831 ?auto_763841 ) ) ( not ( = ?auto_763831 ?auto_763842 ) ) ( not ( = ?auto_763831 ?auto_763843 ) ) ( not ( = ?auto_763831 ?auto_763844 ) ) ( not ( = ?auto_763832 ?auto_763833 ) ) ( not ( = ?auto_763832 ?auto_763834 ) ) ( not ( = ?auto_763832 ?auto_763835 ) ) ( not ( = ?auto_763832 ?auto_763836 ) ) ( not ( = ?auto_763832 ?auto_763837 ) ) ( not ( = ?auto_763832 ?auto_763838 ) ) ( not ( = ?auto_763832 ?auto_763839 ) ) ( not ( = ?auto_763832 ?auto_763840 ) ) ( not ( = ?auto_763832 ?auto_763841 ) ) ( not ( = ?auto_763832 ?auto_763842 ) ) ( not ( = ?auto_763832 ?auto_763843 ) ) ( not ( = ?auto_763832 ?auto_763844 ) ) ( not ( = ?auto_763833 ?auto_763834 ) ) ( not ( = ?auto_763833 ?auto_763835 ) ) ( not ( = ?auto_763833 ?auto_763836 ) ) ( not ( = ?auto_763833 ?auto_763837 ) ) ( not ( = ?auto_763833 ?auto_763838 ) ) ( not ( = ?auto_763833 ?auto_763839 ) ) ( not ( = ?auto_763833 ?auto_763840 ) ) ( not ( = ?auto_763833 ?auto_763841 ) ) ( not ( = ?auto_763833 ?auto_763842 ) ) ( not ( = ?auto_763833 ?auto_763843 ) ) ( not ( = ?auto_763833 ?auto_763844 ) ) ( not ( = ?auto_763834 ?auto_763835 ) ) ( not ( = ?auto_763834 ?auto_763836 ) ) ( not ( = ?auto_763834 ?auto_763837 ) ) ( not ( = ?auto_763834 ?auto_763838 ) ) ( not ( = ?auto_763834 ?auto_763839 ) ) ( not ( = ?auto_763834 ?auto_763840 ) ) ( not ( = ?auto_763834 ?auto_763841 ) ) ( not ( = ?auto_763834 ?auto_763842 ) ) ( not ( = ?auto_763834 ?auto_763843 ) ) ( not ( = ?auto_763834 ?auto_763844 ) ) ( not ( = ?auto_763835 ?auto_763836 ) ) ( not ( = ?auto_763835 ?auto_763837 ) ) ( not ( = ?auto_763835 ?auto_763838 ) ) ( not ( = ?auto_763835 ?auto_763839 ) ) ( not ( = ?auto_763835 ?auto_763840 ) ) ( not ( = ?auto_763835 ?auto_763841 ) ) ( not ( = ?auto_763835 ?auto_763842 ) ) ( not ( = ?auto_763835 ?auto_763843 ) ) ( not ( = ?auto_763835 ?auto_763844 ) ) ( not ( = ?auto_763836 ?auto_763837 ) ) ( not ( = ?auto_763836 ?auto_763838 ) ) ( not ( = ?auto_763836 ?auto_763839 ) ) ( not ( = ?auto_763836 ?auto_763840 ) ) ( not ( = ?auto_763836 ?auto_763841 ) ) ( not ( = ?auto_763836 ?auto_763842 ) ) ( not ( = ?auto_763836 ?auto_763843 ) ) ( not ( = ?auto_763836 ?auto_763844 ) ) ( not ( = ?auto_763837 ?auto_763838 ) ) ( not ( = ?auto_763837 ?auto_763839 ) ) ( not ( = ?auto_763837 ?auto_763840 ) ) ( not ( = ?auto_763837 ?auto_763841 ) ) ( not ( = ?auto_763837 ?auto_763842 ) ) ( not ( = ?auto_763837 ?auto_763843 ) ) ( not ( = ?auto_763837 ?auto_763844 ) ) ( not ( = ?auto_763838 ?auto_763839 ) ) ( not ( = ?auto_763838 ?auto_763840 ) ) ( not ( = ?auto_763838 ?auto_763841 ) ) ( not ( = ?auto_763838 ?auto_763842 ) ) ( not ( = ?auto_763838 ?auto_763843 ) ) ( not ( = ?auto_763838 ?auto_763844 ) ) ( not ( = ?auto_763839 ?auto_763840 ) ) ( not ( = ?auto_763839 ?auto_763841 ) ) ( not ( = ?auto_763839 ?auto_763842 ) ) ( not ( = ?auto_763839 ?auto_763843 ) ) ( not ( = ?auto_763839 ?auto_763844 ) ) ( not ( = ?auto_763840 ?auto_763841 ) ) ( not ( = ?auto_763840 ?auto_763842 ) ) ( not ( = ?auto_763840 ?auto_763843 ) ) ( not ( = ?auto_763840 ?auto_763844 ) ) ( not ( = ?auto_763841 ?auto_763842 ) ) ( not ( = ?auto_763841 ?auto_763843 ) ) ( not ( = ?auto_763841 ?auto_763844 ) ) ( not ( = ?auto_763842 ?auto_763843 ) ) ( not ( = ?auto_763842 ?auto_763844 ) ) ( not ( = ?auto_763843 ?auto_763844 ) ) ( ON ?auto_763842 ?auto_763843 ) ( ON ?auto_763841 ?auto_763842 ) ( ON ?auto_763840 ?auto_763841 ) ( CLEAR ?auto_763838 ) ( ON ?auto_763839 ?auto_763840 ) ( CLEAR ?auto_763839 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_763827 ?auto_763828 ?auto_763829 ?auto_763830 ?auto_763831 ?auto_763832 ?auto_763833 ?auto_763834 ?auto_763835 ?auto_763836 ?auto_763837 ?auto_763838 ?auto_763839 )
      ( MAKE-17PILE ?auto_763827 ?auto_763828 ?auto_763829 ?auto_763830 ?auto_763831 ?auto_763832 ?auto_763833 ?auto_763834 ?auto_763835 ?auto_763836 ?auto_763837 ?auto_763838 ?auto_763839 ?auto_763840 ?auto_763841 ?auto_763842 ?auto_763843 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_763897 - BLOCK
      ?auto_763898 - BLOCK
      ?auto_763899 - BLOCK
      ?auto_763900 - BLOCK
      ?auto_763901 - BLOCK
      ?auto_763902 - BLOCK
      ?auto_763903 - BLOCK
      ?auto_763904 - BLOCK
      ?auto_763905 - BLOCK
      ?auto_763906 - BLOCK
      ?auto_763907 - BLOCK
      ?auto_763908 - BLOCK
      ?auto_763909 - BLOCK
      ?auto_763910 - BLOCK
      ?auto_763911 - BLOCK
      ?auto_763912 - BLOCK
      ?auto_763913 - BLOCK
    )
    :vars
    (
      ?auto_763914 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_763913 ?auto_763914 ) ( ON-TABLE ?auto_763897 ) ( ON ?auto_763898 ?auto_763897 ) ( ON ?auto_763899 ?auto_763898 ) ( ON ?auto_763900 ?auto_763899 ) ( ON ?auto_763901 ?auto_763900 ) ( ON ?auto_763902 ?auto_763901 ) ( ON ?auto_763903 ?auto_763902 ) ( ON ?auto_763904 ?auto_763903 ) ( ON ?auto_763905 ?auto_763904 ) ( ON ?auto_763906 ?auto_763905 ) ( ON ?auto_763907 ?auto_763906 ) ( not ( = ?auto_763897 ?auto_763898 ) ) ( not ( = ?auto_763897 ?auto_763899 ) ) ( not ( = ?auto_763897 ?auto_763900 ) ) ( not ( = ?auto_763897 ?auto_763901 ) ) ( not ( = ?auto_763897 ?auto_763902 ) ) ( not ( = ?auto_763897 ?auto_763903 ) ) ( not ( = ?auto_763897 ?auto_763904 ) ) ( not ( = ?auto_763897 ?auto_763905 ) ) ( not ( = ?auto_763897 ?auto_763906 ) ) ( not ( = ?auto_763897 ?auto_763907 ) ) ( not ( = ?auto_763897 ?auto_763908 ) ) ( not ( = ?auto_763897 ?auto_763909 ) ) ( not ( = ?auto_763897 ?auto_763910 ) ) ( not ( = ?auto_763897 ?auto_763911 ) ) ( not ( = ?auto_763897 ?auto_763912 ) ) ( not ( = ?auto_763897 ?auto_763913 ) ) ( not ( = ?auto_763897 ?auto_763914 ) ) ( not ( = ?auto_763898 ?auto_763899 ) ) ( not ( = ?auto_763898 ?auto_763900 ) ) ( not ( = ?auto_763898 ?auto_763901 ) ) ( not ( = ?auto_763898 ?auto_763902 ) ) ( not ( = ?auto_763898 ?auto_763903 ) ) ( not ( = ?auto_763898 ?auto_763904 ) ) ( not ( = ?auto_763898 ?auto_763905 ) ) ( not ( = ?auto_763898 ?auto_763906 ) ) ( not ( = ?auto_763898 ?auto_763907 ) ) ( not ( = ?auto_763898 ?auto_763908 ) ) ( not ( = ?auto_763898 ?auto_763909 ) ) ( not ( = ?auto_763898 ?auto_763910 ) ) ( not ( = ?auto_763898 ?auto_763911 ) ) ( not ( = ?auto_763898 ?auto_763912 ) ) ( not ( = ?auto_763898 ?auto_763913 ) ) ( not ( = ?auto_763898 ?auto_763914 ) ) ( not ( = ?auto_763899 ?auto_763900 ) ) ( not ( = ?auto_763899 ?auto_763901 ) ) ( not ( = ?auto_763899 ?auto_763902 ) ) ( not ( = ?auto_763899 ?auto_763903 ) ) ( not ( = ?auto_763899 ?auto_763904 ) ) ( not ( = ?auto_763899 ?auto_763905 ) ) ( not ( = ?auto_763899 ?auto_763906 ) ) ( not ( = ?auto_763899 ?auto_763907 ) ) ( not ( = ?auto_763899 ?auto_763908 ) ) ( not ( = ?auto_763899 ?auto_763909 ) ) ( not ( = ?auto_763899 ?auto_763910 ) ) ( not ( = ?auto_763899 ?auto_763911 ) ) ( not ( = ?auto_763899 ?auto_763912 ) ) ( not ( = ?auto_763899 ?auto_763913 ) ) ( not ( = ?auto_763899 ?auto_763914 ) ) ( not ( = ?auto_763900 ?auto_763901 ) ) ( not ( = ?auto_763900 ?auto_763902 ) ) ( not ( = ?auto_763900 ?auto_763903 ) ) ( not ( = ?auto_763900 ?auto_763904 ) ) ( not ( = ?auto_763900 ?auto_763905 ) ) ( not ( = ?auto_763900 ?auto_763906 ) ) ( not ( = ?auto_763900 ?auto_763907 ) ) ( not ( = ?auto_763900 ?auto_763908 ) ) ( not ( = ?auto_763900 ?auto_763909 ) ) ( not ( = ?auto_763900 ?auto_763910 ) ) ( not ( = ?auto_763900 ?auto_763911 ) ) ( not ( = ?auto_763900 ?auto_763912 ) ) ( not ( = ?auto_763900 ?auto_763913 ) ) ( not ( = ?auto_763900 ?auto_763914 ) ) ( not ( = ?auto_763901 ?auto_763902 ) ) ( not ( = ?auto_763901 ?auto_763903 ) ) ( not ( = ?auto_763901 ?auto_763904 ) ) ( not ( = ?auto_763901 ?auto_763905 ) ) ( not ( = ?auto_763901 ?auto_763906 ) ) ( not ( = ?auto_763901 ?auto_763907 ) ) ( not ( = ?auto_763901 ?auto_763908 ) ) ( not ( = ?auto_763901 ?auto_763909 ) ) ( not ( = ?auto_763901 ?auto_763910 ) ) ( not ( = ?auto_763901 ?auto_763911 ) ) ( not ( = ?auto_763901 ?auto_763912 ) ) ( not ( = ?auto_763901 ?auto_763913 ) ) ( not ( = ?auto_763901 ?auto_763914 ) ) ( not ( = ?auto_763902 ?auto_763903 ) ) ( not ( = ?auto_763902 ?auto_763904 ) ) ( not ( = ?auto_763902 ?auto_763905 ) ) ( not ( = ?auto_763902 ?auto_763906 ) ) ( not ( = ?auto_763902 ?auto_763907 ) ) ( not ( = ?auto_763902 ?auto_763908 ) ) ( not ( = ?auto_763902 ?auto_763909 ) ) ( not ( = ?auto_763902 ?auto_763910 ) ) ( not ( = ?auto_763902 ?auto_763911 ) ) ( not ( = ?auto_763902 ?auto_763912 ) ) ( not ( = ?auto_763902 ?auto_763913 ) ) ( not ( = ?auto_763902 ?auto_763914 ) ) ( not ( = ?auto_763903 ?auto_763904 ) ) ( not ( = ?auto_763903 ?auto_763905 ) ) ( not ( = ?auto_763903 ?auto_763906 ) ) ( not ( = ?auto_763903 ?auto_763907 ) ) ( not ( = ?auto_763903 ?auto_763908 ) ) ( not ( = ?auto_763903 ?auto_763909 ) ) ( not ( = ?auto_763903 ?auto_763910 ) ) ( not ( = ?auto_763903 ?auto_763911 ) ) ( not ( = ?auto_763903 ?auto_763912 ) ) ( not ( = ?auto_763903 ?auto_763913 ) ) ( not ( = ?auto_763903 ?auto_763914 ) ) ( not ( = ?auto_763904 ?auto_763905 ) ) ( not ( = ?auto_763904 ?auto_763906 ) ) ( not ( = ?auto_763904 ?auto_763907 ) ) ( not ( = ?auto_763904 ?auto_763908 ) ) ( not ( = ?auto_763904 ?auto_763909 ) ) ( not ( = ?auto_763904 ?auto_763910 ) ) ( not ( = ?auto_763904 ?auto_763911 ) ) ( not ( = ?auto_763904 ?auto_763912 ) ) ( not ( = ?auto_763904 ?auto_763913 ) ) ( not ( = ?auto_763904 ?auto_763914 ) ) ( not ( = ?auto_763905 ?auto_763906 ) ) ( not ( = ?auto_763905 ?auto_763907 ) ) ( not ( = ?auto_763905 ?auto_763908 ) ) ( not ( = ?auto_763905 ?auto_763909 ) ) ( not ( = ?auto_763905 ?auto_763910 ) ) ( not ( = ?auto_763905 ?auto_763911 ) ) ( not ( = ?auto_763905 ?auto_763912 ) ) ( not ( = ?auto_763905 ?auto_763913 ) ) ( not ( = ?auto_763905 ?auto_763914 ) ) ( not ( = ?auto_763906 ?auto_763907 ) ) ( not ( = ?auto_763906 ?auto_763908 ) ) ( not ( = ?auto_763906 ?auto_763909 ) ) ( not ( = ?auto_763906 ?auto_763910 ) ) ( not ( = ?auto_763906 ?auto_763911 ) ) ( not ( = ?auto_763906 ?auto_763912 ) ) ( not ( = ?auto_763906 ?auto_763913 ) ) ( not ( = ?auto_763906 ?auto_763914 ) ) ( not ( = ?auto_763907 ?auto_763908 ) ) ( not ( = ?auto_763907 ?auto_763909 ) ) ( not ( = ?auto_763907 ?auto_763910 ) ) ( not ( = ?auto_763907 ?auto_763911 ) ) ( not ( = ?auto_763907 ?auto_763912 ) ) ( not ( = ?auto_763907 ?auto_763913 ) ) ( not ( = ?auto_763907 ?auto_763914 ) ) ( not ( = ?auto_763908 ?auto_763909 ) ) ( not ( = ?auto_763908 ?auto_763910 ) ) ( not ( = ?auto_763908 ?auto_763911 ) ) ( not ( = ?auto_763908 ?auto_763912 ) ) ( not ( = ?auto_763908 ?auto_763913 ) ) ( not ( = ?auto_763908 ?auto_763914 ) ) ( not ( = ?auto_763909 ?auto_763910 ) ) ( not ( = ?auto_763909 ?auto_763911 ) ) ( not ( = ?auto_763909 ?auto_763912 ) ) ( not ( = ?auto_763909 ?auto_763913 ) ) ( not ( = ?auto_763909 ?auto_763914 ) ) ( not ( = ?auto_763910 ?auto_763911 ) ) ( not ( = ?auto_763910 ?auto_763912 ) ) ( not ( = ?auto_763910 ?auto_763913 ) ) ( not ( = ?auto_763910 ?auto_763914 ) ) ( not ( = ?auto_763911 ?auto_763912 ) ) ( not ( = ?auto_763911 ?auto_763913 ) ) ( not ( = ?auto_763911 ?auto_763914 ) ) ( not ( = ?auto_763912 ?auto_763913 ) ) ( not ( = ?auto_763912 ?auto_763914 ) ) ( not ( = ?auto_763913 ?auto_763914 ) ) ( ON ?auto_763912 ?auto_763913 ) ( ON ?auto_763911 ?auto_763912 ) ( ON ?auto_763910 ?auto_763911 ) ( ON ?auto_763909 ?auto_763910 ) ( CLEAR ?auto_763907 ) ( ON ?auto_763908 ?auto_763909 ) ( CLEAR ?auto_763908 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_763897 ?auto_763898 ?auto_763899 ?auto_763900 ?auto_763901 ?auto_763902 ?auto_763903 ?auto_763904 ?auto_763905 ?auto_763906 ?auto_763907 ?auto_763908 )
      ( MAKE-17PILE ?auto_763897 ?auto_763898 ?auto_763899 ?auto_763900 ?auto_763901 ?auto_763902 ?auto_763903 ?auto_763904 ?auto_763905 ?auto_763906 ?auto_763907 ?auto_763908 ?auto_763909 ?auto_763910 ?auto_763911 ?auto_763912 ?auto_763913 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_763967 - BLOCK
      ?auto_763968 - BLOCK
      ?auto_763969 - BLOCK
      ?auto_763970 - BLOCK
      ?auto_763971 - BLOCK
      ?auto_763972 - BLOCK
      ?auto_763973 - BLOCK
      ?auto_763974 - BLOCK
      ?auto_763975 - BLOCK
      ?auto_763976 - BLOCK
      ?auto_763977 - BLOCK
      ?auto_763978 - BLOCK
      ?auto_763979 - BLOCK
      ?auto_763980 - BLOCK
      ?auto_763981 - BLOCK
      ?auto_763982 - BLOCK
      ?auto_763983 - BLOCK
    )
    :vars
    (
      ?auto_763984 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_763983 ?auto_763984 ) ( ON-TABLE ?auto_763967 ) ( ON ?auto_763968 ?auto_763967 ) ( ON ?auto_763969 ?auto_763968 ) ( ON ?auto_763970 ?auto_763969 ) ( ON ?auto_763971 ?auto_763970 ) ( ON ?auto_763972 ?auto_763971 ) ( ON ?auto_763973 ?auto_763972 ) ( ON ?auto_763974 ?auto_763973 ) ( ON ?auto_763975 ?auto_763974 ) ( ON ?auto_763976 ?auto_763975 ) ( not ( = ?auto_763967 ?auto_763968 ) ) ( not ( = ?auto_763967 ?auto_763969 ) ) ( not ( = ?auto_763967 ?auto_763970 ) ) ( not ( = ?auto_763967 ?auto_763971 ) ) ( not ( = ?auto_763967 ?auto_763972 ) ) ( not ( = ?auto_763967 ?auto_763973 ) ) ( not ( = ?auto_763967 ?auto_763974 ) ) ( not ( = ?auto_763967 ?auto_763975 ) ) ( not ( = ?auto_763967 ?auto_763976 ) ) ( not ( = ?auto_763967 ?auto_763977 ) ) ( not ( = ?auto_763967 ?auto_763978 ) ) ( not ( = ?auto_763967 ?auto_763979 ) ) ( not ( = ?auto_763967 ?auto_763980 ) ) ( not ( = ?auto_763967 ?auto_763981 ) ) ( not ( = ?auto_763967 ?auto_763982 ) ) ( not ( = ?auto_763967 ?auto_763983 ) ) ( not ( = ?auto_763967 ?auto_763984 ) ) ( not ( = ?auto_763968 ?auto_763969 ) ) ( not ( = ?auto_763968 ?auto_763970 ) ) ( not ( = ?auto_763968 ?auto_763971 ) ) ( not ( = ?auto_763968 ?auto_763972 ) ) ( not ( = ?auto_763968 ?auto_763973 ) ) ( not ( = ?auto_763968 ?auto_763974 ) ) ( not ( = ?auto_763968 ?auto_763975 ) ) ( not ( = ?auto_763968 ?auto_763976 ) ) ( not ( = ?auto_763968 ?auto_763977 ) ) ( not ( = ?auto_763968 ?auto_763978 ) ) ( not ( = ?auto_763968 ?auto_763979 ) ) ( not ( = ?auto_763968 ?auto_763980 ) ) ( not ( = ?auto_763968 ?auto_763981 ) ) ( not ( = ?auto_763968 ?auto_763982 ) ) ( not ( = ?auto_763968 ?auto_763983 ) ) ( not ( = ?auto_763968 ?auto_763984 ) ) ( not ( = ?auto_763969 ?auto_763970 ) ) ( not ( = ?auto_763969 ?auto_763971 ) ) ( not ( = ?auto_763969 ?auto_763972 ) ) ( not ( = ?auto_763969 ?auto_763973 ) ) ( not ( = ?auto_763969 ?auto_763974 ) ) ( not ( = ?auto_763969 ?auto_763975 ) ) ( not ( = ?auto_763969 ?auto_763976 ) ) ( not ( = ?auto_763969 ?auto_763977 ) ) ( not ( = ?auto_763969 ?auto_763978 ) ) ( not ( = ?auto_763969 ?auto_763979 ) ) ( not ( = ?auto_763969 ?auto_763980 ) ) ( not ( = ?auto_763969 ?auto_763981 ) ) ( not ( = ?auto_763969 ?auto_763982 ) ) ( not ( = ?auto_763969 ?auto_763983 ) ) ( not ( = ?auto_763969 ?auto_763984 ) ) ( not ( = ?auto_763970 ?auto_763971 ) ) ( not ( = ?auto_763970 ?auto_763972 ) ) ( not ( = ?auto_763970 ?auto_763973 ) ) ( not ( = ?auto_763970 ?auto_763974 ) ) ( not ( = ?auto_763970 ?auto_763975 ) ) ( not ( = ?auto_763970 ?auto_763976 ) ) ( not ( = ?auto_763970 ?auto_763977 ) ) ( not ( = ?auto_763970 ?auto_763978 ) ) ( not ( = ?auto_763970 ?auto_763979 ) ) ( not ( = ?auto_763970 ?auto_763980 ) ) ( not ( = ?auto_763970 ?auto_763981 ) ) ( not ( = ?auto_763970 ?auto_763982 ) ) ( not ( = ?auto_763970 ?auto_763983 ) ) ( not ( = ?auto_763970 ?auto_763984 ) ) ( not ( = ?auto_763971 ?auto_763972 ) ) ( not ( = ?auto_763971 ?auto_763973 ) ) ( not ( = ?auto_763971 ?auto_763974 ) ) ( not ( = ?auto_763971 ?auto_763975 ) ) ( not ( = ?auto_763971 ?auto_763976 ) ) ( not ( = ?auto_763971 ?auto_763977 ) ) ( not ( = ?auto_763971 ?auto_763978 ) ) ( not ( = ?auto_763971 ?auto_763979 ) ) ( not ( = ?auto_763971 ?auto_763980 ) ) ( not ( = ?auto_763971 ?auto_763981 ) ) ( not ( = ?auto_763971 ?auto_763982 ) ) ( not ( = ?auto_763971 ?auto_763983 ) ) ( not ( = ?auto_763971 ?auto_763984 ) ) ( not ( = ?auto_763972 ?auto_763973 ) ) ( not ( = ?auto_763972 ?auto_763974 ) ) ( not ( = ?auto_763972 ?auto_763975 ) ) ( not ( = ?auto_763972 ?auto_763976 ) ) ( not ( = ?auto_763972 ?auto_763977 ) ) ( not ( = ?auto_763972 ?auto_763978 ) ) ( not ( = ?auto_763972 ?auto_763979 ) ) ( not ( = ?auto_763972 ?auto_763980 ) ) ( not ( = ?auto_763972 ?auto_763981 ) ) ( not ( = ?auto_763972 ?auto_763982 ) ) ( not ( = ?auto_763972 ?auto_763983 ) ) ( not ( = ?auto_763972 ?auto_763984 ) ) ( not ( = ?auto_763973 ?auto_763974 ) ) ( not ( = ?auto_763973 ?auto_763975 ) ) ( not ( = ?auto_763973 ?auto_763976 ) ) ( not ( = ?auto_763973 ?auto_763977 ) ) ( not ( = ?auto_763973 ?auto_763978 ) ) ( not ( = ?auto_763973 ?auto_763979 ) ) ( not ( = ?auto_763973 ?auto_763980 ) ) ( not ( = ?auto_763973 ?auto_763981 ) ) ( not ( = ?auto_763973 ?auto_763982 ) ) ( not ( = ?auto_763973 ?auto_763983 ) ) ( not ( = ?auto_763973 ?auto_763984 ) ) ( not ( = ?auto_763974 ?auto_763975 ) ) ( not ( = ?auto_763974 ?auto_763976 ) ) ( not ( = ?auto_763974 ?auto_763977 ) ) ( not ( = ?auto_763974 ?auto_763978 ) ) ( not ( = ?auto_763974 ?auto_763979 ) ) ( not ( = ?auto_763974 ?auto_763980 ) ) ( not ( = ?auto_763974 ?auto_763981 ) ) ( not ( = ?auto_763974 ?auto_763982 ) ) ( not ( = ?auto_763974 ?auto_763983 ) ) ( not ( = ?auto_763974 ?auto_763984 ) ) ( not ( = ?auto_763975 ?auto_763976 ) ) ( not ( = ?auto_763975 ?auto_763977 ) ) ( not ( = ?auto_763975 ?auto_763978 ) ) ( not ( = ?auto_763975 ?auto_763979 ) ) ( not ( = ?auto_763975 ?auto_763980 ) ) ( not ( = ?auto_763975 ?auto_763981 ) ) ( not ( = ?auto_763975 ?auto_763982 ) ) ( not ( = ?auto_763975 ?auto_763983 ) ) ( not ( = ?auto_763975 ?auto_763984 ) ) ( not ( = ?auto_763976 ?auto_763977 ) ) ( not ( = ?auto_763976 ?auto_763978 ) ) ( not ( = ?auto_763976 ?auto_763979 ) ) ( not ( = ?auto_763976 ?auto_763980 ) ) ( not ( = ?auto_763976 ?auto_763981 ) ) ( not ( = ?auto_763976 ?auto_763982 ) ) ( not ( = ?auto_763976 ?auto_763983 ) ) ( not ( = ?auto_763976 ?auto_763984 ) ) ( not ( = ?auto_763977 ?auto_763978 ) ) ( not ( = ?auto_763977 ?auto_763979 ) ) ( not ( = ?auto_763977 ?auto_763980 ) ) ( not ( = ?auto_763977 ?auto_763981 ) ) ( not ( = ?auto_763977 ?auto_763982 ) ) ( not ( = ?auto_763977 ?auto_763983 ) ) ( not ( = ?auto_763977 ?auto_763984 ) ) ( not ( = ?auto_763978 ?auto_763979 ) ) ( not ( = ?auto_763978 ?auto_763980 ) ) ( not ( = ?auto_763978 ?auto_763981 ) ) ( not ( = ?auto_763978 ?auto_763982 ) ) ( not ( = ?auto_763978 ?auto_763983 ) ) ( not ( = ?auto_763978 ?auto_763984 ) ) ( not ( = ?auto_763979 ?auto_763980 ) ) ( not ( = ?auto_763979 ?auto_763981 ) ) ( not ( = ?auto_763979 ?auto_763982 ) ) ( not ( = ?auto_763979 ?auto_763983 ) ) ( not ( = ?auto_763979 ?auto_763984 ) ) ( not ( = ?auto_763980 ?auto_763981 ) ) ( not ( = ?auto_763980 ?auto_763982 ) ) ( not ( = ?auto_763980 ?auto_763983 ) ) ( not ( = ?auto_763980 ?auto_763984 ) ) ( not ( = ?auto_763981 ?auto_763982 ) ) ( not ( = ?auto_763981 ?auto_763983 ) ) ( not ( = ?auto_763981 ?auto_763984 ) ) ( not ( = ?auto_763982 ?auto_763983 ) ) ( not ( = ?auto_763982 ?auto_763984 ) ) ( not ( = ?auto_763983 ?auto_763984 ) ) ( ON ?auto_763982 ?auto_763983 ) ( ON ?auto_763981 ?auto_763982 ) ( ON ?auto_763980 ?auto_763981 ) ( ON ?auto_763979 ?auto_763980 ) ( ON ?auto_763978 ?auto_763979 ) ( CLEAR ?auto_763976 ) ( ON ?auto_763977 ?auto_763978 ) ( CLEAR ?auto_763977 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_763967 ?auto_763968 ?auto_763969 ?auto_763970 ?auto_763971 ?auto_763972 ?auto_763973 ?auto_763974 ?auto_763975 ?auto_763976 ?auto_763977 )
      ( MAKE-17PILE ?auto_763967 ?auto_763968 ?auto_763969 ?auto_763970 ?auto_763971 ?auto_763972 ?auto_763973 ?auto_763974 ?auto_763975 ?auto_763976 ?auto_763977 ?auto_763978 ?auto_763979 ?auto_763980 ?auto_763981 ?auto_763982 ?auto_763983 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_764037 - BLOCK
      ?auto_764038 - BLOCK
      ?auto_764039 - BLOCK
      ?auto_764040 - BLOCK
      ?auto_764041 - BLOCK
      ?auto_764042 - BLOCK
      ?auto_764043 - BLOCK
      ?auto_764044 - BLOCK
      ?auto_764045 - BLOCK
      ?auto_764046 - BLOCK
      ?auto_764047 - BLOCK
      ?auto_764048 - BLOCK
      ?auto_764049 - BLOCK
      ?auto_764050 - BLOCK
      ?auto_764051 - BLOCK
      ?auto_764052 - BLOCK
      ?auto_764053 - BLOCK
    )
    :vars
    (
      ?auto_764054 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_764053 ?auto_764054 ) ( ON-TABLE ?auto_764037 ) ( ON ?auto_764038 ?auto_764037 ) ( ON ?auto_764039 ?auto_764038 ) ( ON ?auto_764040 ?auto_764039 ) ( ON ?auto_764041 ?auto_764040 ) ( ON ?auto_764042 ?auto_764041 ) ( ON ?auto_764043 ?auto_764042 ) ( ON ?auto_764044 ?auto_764043 ) ( ON ?auto_764045 ?auto_764044 ) ( not ( = ?auto_764037 ?auto_764038 ) ) ( not ( = ?auto_764037 ?auto_764039 ) ) ( not ( = ?auto_764037 ?auto_764040 ) ) ( not ( = ?auto_764037 ?auto_764041 ) ) ( not ( = ?auto_764037 ?auto_764042 ) ) ( not ( = ?auto_764037 ?auto_764043 ) ) ( not ( = ?auto_764037 ?auto_764044 ) ) ( not ( = ?auto_764037 ?auto_764045 ) ) ( not ( = ?auto_764037 ?auto_764046 ) ) ( not ( = ?auto_764037 ?auto_764047 ) ) ( not ( = ?auto_764037 ?auto_764048 ) ) ( not ( = ?auto_764037 ?auto_764049 ) ) ( not ( = ?auto_764037 ?auto_764050 ) ) ( not ( = ?auto_764037 ?auto_764051 ) ) ( not ( = ?auto_764037 ?auto_764052 ) ) ( not ( = ?auto_764037 ?auto_764053 ) ) ( not ( = ?auto_764037 ?auto_764054 ) ) ( not ( = ?auto_764038 ?auto_764039 ) ) ( not ( = ?auto_764038 ?auto_764040 ) ) ( not ( = ?auto_764038 ?auto_764041 ) ) ( not ( = ?auto_764038 ?auto_764042 ) ) ( not ( = ?auto_764038 ?auto_764043 ) ) ( not ( = ?auto_764038 ?auto_764044 ) ) ( not ( = ?auto_764038 ?auto_764045 ) ) ( not ( = ?auto_764038 ?auto_764046 ) ) ( not ( = ?auto_764038 ?auto_764047 ) ) ( not ( = ?auto_764038 ?auto_764048 ) ) ( not ( = ?auto_764038 ?auto_764049 ) ) ( not ( = ?auto_764038 ?auto_764050 ) ) ( not ( = ?auto_764038 ?auto_764051 ) ) ( not ( = ?auto_764038 ?auto_764052 ) ) ( not ( = ?auto_764038 ?auto_764053 ) ) ( not ( = ?auto_764038 ?auto_764054 ) ) ( not ( = ?auto_764039 ?auto_764040 ) ) ( not ( = ?auto_764039 ?auto_764041 ) ) ( not ( = ?auto_764039 ?auto_764042 ) ) ( not ( = ?auto_764039 ?auto_764043 ) ) ( not ( = ?auto_764039 ?auto_764044 ) ) ( not ( = ?auto_764039 ?auto_764045 ) ) ( not ( = ?auto_764039 ?auto_764046 ) ) ( not ( = ?auto_764039 ?auto_764047 ) ) ( not ( = ?auto_764039 ?auto_764048 ) ) ( not ( = ?auto_764039 ?auto_764049 ) ) ( not ( = ?auto_764039 ?auto_764050 ) ) ( not ( = ?auto_764039 ?auto_764051 ) ) ( not ( = ?auto_764039 ?auto_764052 ) ) ( not ( = ?auto_764039 ?auto_764053 ) ) ( not ( = ?auto_764039 ?auto_764054 ) ) ( not ( = ?auto_764040 ?auto_764041 ) ) ( not ( = ?auto_764040 ?auto_764042 ) ) ( not ( = ?auto_764040 ?auto_764043 ) ) ( not ( = ?auto_764040 ?auto_764044 ) ) ( not ( = ?auto_764040 ?auto_764045 ) ) ( not ( = ?auto_764040 ?auto_764046 ) ) ( not ( = ?auto_764040 ?auto_764047 ) ) ( not ( = ?auto_764040 ?auto_764048 ) ) ( not ( = ?auto_764040 ?auto_764049 ) ) ( not ( = ?auto_764040 ?auto_764050 ) ) ( not ( = ?auto_764040 ?auto_764051 ) ) ( not ( = ?auto_764040 ?auto_764052 ) ) ( not ( = ?auto_764040 ?auto_764053 ) ) ( not ( = ?auto_764040 ?auto_764054 ) ) ( not ( = ?auto_764041 ?auto_764042 ) ) ( not ( = ?auto_764041 ?auto_764043 ) ) ( not ( = ?auto_764041 ?auto_764044 ) ) ( not ( = ?auto_764041 ?auto_764045 ) ) ( not ( = ?auto_764041 ?auto_764046 ) ) ( not ( = ?auto_764041 ?auto_764047 ) ) ( not ( = ?auto_764041 ?auto_764048 ) ) ( not ( = ?auto_764041 ?auto_764049 ) ) ( not ( = ?auto_764041 ?auto_764050 ) ) ( not ( = ?auto_764041 ?auto_764051 ) ) ( not ( = ?auto_764041 ?auto_764052 ) ) ( not ( = ?auto_764041 ?auto_764053 ) ) ( not ( = ?auto_764041 ?auto_764054 ) ) ( not ( = ?auto_764042 ?auto_764043 ) ) ( not ( = ?auto_764042 ?auto_764044 ) ) ( not ( = ?auto_764042 ?auto_764045 ) ) ( not ( = ?auto_764042 ?auto_764046 ) ) ( not ( = ?auto_764042 ?auto_764047 ) ) ( not ( = ?auto_764042 ?auto_764048 ) ) ( not ( = ?auto_764042 ?auto_764049 ) ) ( not ( = ?auto_764042 ?auto_764050 ) ) ( not ( = ?auto_764042 ?auto_764051 ) ) ( not ( = ?auto_764042 ?auto_764052 ) ) ( not ( = ?auto_764042 ?auto_764053 ) ) ( not ( = ?auto_764042 ?auto_764054 ) ) ( not ( = ?auto_764043 ?auto_764044 ) ) ( not ( = ?auto_764043 ?auto_764045 ) ) ( not ( = ?auto_764043 ?auto_764046 ) ) ( not ( = ?auto_764043 ?auto_764047 ) ) ( not ( = ?auto_764043 ?auto_764048 ) ) ( not ( = ?auto_764043 ?auto_764049 ) ) ( not ( = ?auto_764043 ?auto_764050 ) ) ( not ( = ?auto_764043 ?auto_764051 ) ) ( not ( = ?auto_764043 ?auto_764052 ) ) ( not ( = ?auto_764043 ?auto_764053 ) ) ( not ( = ?auto_764043 ?auto_764054 ) ) ( not ( = ?auto_764044 ?auto_764045 ) ) ( not ( = ?auto_764044 ?auto_764046 ) ) ( not ( = ?auto_764044 ?auto_764047 ) ) ( not ( = ?auto_764044 ?auto_764048 ) ) ( not ( = ?auto_764044 ?auto_764049 ) ) ( not ( = ?auto_764044 ?auto_764050 ) ) ( not ( = ?auto_764044 ?auto_764051 ) ) ( not ( = ?auto_764044 ?auto_764052 ) ) ( not ( = ?auto_764044 ?auto_764053 ) ) ( not ( = ?auto_764044 ?auto_764054 ) ) ( not ( = ?auto_764045 ?auto_764046 ) ) ( not ( = ?auto_764045 ?auto_764047 ) ) ( not ( = ?auto_764045 ?auto_764048 ) ) ( not ( = ?auto_764045 ?auto_764049 ) ) ( not ( = ?auto_764045 ?auto_764050 ) ) ( not ( = ?auto_764045 ?auto_764051 ) ) ( not ( = ?auto_764045 ?auto_764052 ) ) ( not ( = ?auto_764045 ?auto_764053 ) ) ( not ( = ?auto_764045 ?auto_764054 ) ) ( not ( = ?auto_764046 ?auto_764047 ) ) ( not ( = ?auto_764046 ?auto_764048 ) ) ( not ( = ?auto_764046 ?auto_764049 ) ) ( not ( = ?auto_764046 ?auto_764050 ) ) ( not ( = ?auto_764046 ?auto_764051 ) ) ( not ( = ?auto_764046 ?auto_764052 ) ) ( not ( = ?auto_764046 ?auto_764053 ) ) ( not ( = ?auto_764046 ?auto_764054 ) ) ( not ( = ?auto_764047 ?auto_764048 ) ) ( not ( = ?auto_764047 ?auto_764049 ) ) ( not ( = ?auto_764047 ?auto_764050 ) ) ( not ( = ?auto_764047 ?auto_764051 ) ) ( not ( = ?auto_764047 ?auto_764052 ) ) ( not ( = ?auto_764047 ?auto_764053 ) ) ( not ( = ?auto_764047 ?auto_764054 ) ) ( not ( = ?auto_764048 ?auto_764049 ) ) ( not ( = ?auto_764048 ?auto_764050 ) ) ( not ( = ?auto_764048 ?auto_764051 ) ) ( not ( = ?auto_764048 ?auto_764052 ) ) ( not ( = ?auto_764048 ?auto_764053 ) ) ( not ( = ?auto_764048 ?auto_764054 ) ) ( not ( = ?auto_764049 ?auto_764050 ) ) ( not ( = ?auto_764049 ?auto_764051 ) ) ( not ( = ?auto_764049 ?auto_764052 ) ) ( not ( = ?auto_764049 ?auto_764053 ) ) ( not ( = ?auto_764049 ?auto_764054 ) ) ( not ( = ?auto_764050 ?auto_764051 ) ) ( not ( = ?auto_764050 ?auto_764052 ) ) ( not ( = ?auto_764050 ?auto_764053 ) ) ( not ( = ?auto_764050 ?auto_764054 ) ) ( not ( = ?auto_764051 ?auto_764052 ) ) ( not ( = ?auto_764051 ?auto_764053 ) ) ( not ( = ?auto_764051 ?auto_764054 ) ) ( not ( = ?auto_764052 ?auto_764053 ) ) ( not ( = ?auto_764052 ?auto_764054 ) ) ( not ( = ?auto_764053 ?auto_764054 ) ) ( ON ?auto_764052 ?auto_764053 ) ( ON ?auto_764051 ?auto_764052 ) ( ON ?auto_764050 ?auto_764051 ) ( ON ?auto_764049 ?auto_764050 ) ( ON ?auto_764048 ?auto_764049 ) ( ON ?auto_764047 ?auto_764048 ) ( CLEAR ?auto_764045 ) ( ON ?auto_764046 ?auto_764047 ) ( CLEAR ?auto_764046 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_764037 ?auto_764038 ?auto_764039 ?auto_764040 ?auto_764041 ?auto_764042 ?auto_764043 ?auto_764044 ?auto_764045 ?auto_764046 )
      ( MAKE-17PILE ?auto_764037 ?auto_764038 ?auto_764039 ?auto_764040 ?auto_764041 ?auto_764042 ?auto_764043 ?auto_764044 ?auto_764045 ?auto_764046 ?auto_764047 ?auto_764048 ?auto_764049 ?auto_764050 ?auto_764051 ?auto_764052 ?auto_764053 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_764107 - BLOCK
      ?auto_764108 - BLOCK
      ?auto_764109 - BLOCK
      ?auto_764110 - BLOCK
      ?auto_764111 - BLOCK
      ?auto_764112 - BLOCK
      ?auto_764113 - BLOCK
      ?auto_764114 - BLOCK
      ?auto_764115 - BLOCK
      ?auto_764116 - BLOCK
      ?auto_764117 - BLOCK
      ?auto_764118 - BLOCK
      ?auto_764119 - BLOCK
      ?auto_764120 - BLOCK
      ?auto_764121 - BLOCK
      ?auto_764122 - BLOCK
      ?auto_764123 - BLOCK
    )
    :vars
    (
      ?auto_764124 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_764123 ?auto_764124 ) ( ON-TABLE ?auto_764107 ) ( ON ?auto_764108 ?auto_764107 ) ( ON ?auto_764109 ?auto_764108 ) ( ON ?auto_764110 ?auto_764109 ) ( ON ?auto_764111 ?auto_764110 ) ( ON ?auto_764112 ?auto_764111 ) ( ON ?auto_764113 ?auto_764112 ) ( ON ?auto_764114 ?auto_764113 ) ( not ( = ?auto_764107 ?auto_764108 ) ) ( not ( = ?auto_764107 ?auto_764109 ) ) ( not ( = ?auto_764107 ?auto_764110 ) ) ( not ( = ?auto_764107 ?auto_764111 ) ) ( not ( = ?auto_764107 ?auto_764112 ) ) ( not ( = ?auto_764107 ?auto_764113 ) ) ( not ( = ?auto_764107 ?auto_764114 ) ) ( not ( = ?auto_764107 ?auto_764115 ) ) ( not ( = ?auto_764107 ?auto_764116 ) ) ( not ( = ?auto_764107 ?auto_764117 ) ) ( not ( = ?auto_764107 ?auto_764118 ) ) ( not ( = ?auto_764107 ?auto_764119 ) ) ( not ( = ?auto_764107 ?auto_764120 ) ) ( not ( = ?auto_764107 ?auto_764121 ) ) ( not ( = ?auto_764107 ?auto_764122 ) ) ( not ( = ?auto_764107 ?auto_764123 ) ) ( not ( = ?auto_764107 ?auto_764124 ) ) ( not ( = ?auto_764108 ?auto_764109 ) ) ( not ( = ?auto_764108 ?auto_764110 ) ) ( not ( = ?auto_764108 ?auto_764111 ) ) ( not ( = ?auto_764108 ?auto_764112 ) ) ( not ( = ?auto_764108 ?auto_764113 ) ) ( not ( = ?auto_764108 ?auto_764114 ) ) ( not ( = ?auto_764108 ?auto_764115 ) ) ( not ( = ?auto_764108 ?auto_764116 ) ) ( not ( = ?auto_764108 ?auto_764117 ) ) ( not ( = ?auto_764108 ?auto_764118 ) ) ( not ( = ?auto_764108 ?auto_764119 ) ) ( not ( = ?auto_764108 ?auto_764120 ) ) ( not ( = ?auto_764108 ?auto_764121 ) ) ( not ( = ?auto_764108 ?auto_764122 ) ) ( not ( = ?auto_764108 ?auto_764123 ) ) ( not ( = ?auto_764108 ?auto_764124 ) ) ( not ( = ?auto_764109 ?auto_764110 ) ) ( not ( = ?auto_764109 ?auto_764111 ) ) ( not ( = ?auto_764109 ?auto_764112 ) ) ( not ( = ?auto_764109 ?auto_764113 ) ) ( not ( = ?auto_764109 ?auto_764114 ) ) ( not ( = ?auto_764109 ?auto_764115 ) ) ( not ( = ?auto_764109 ?auto_764116 ) ) ( not ( = ?auto_764109 ?auto_764117 ) ) ( not ( = ?auto_764109 ?auto_764118 ) ) ( not ( = ?auto_764109 ?auto_764119 ) ) ( not ( = ?auto_764109 ?auto_764120 ) ) ( not ( = ?auto_764109 ?auto_764121 ) ) ( not ( = ?auto_764109 ?auto_764122 ) ) ( not ( = ?auto_764109 ?auto_764123 ) ) ( not ( = ?auto_764109 ?auto_764124 ) ) ( not ( = ?auto_764110 ?auto_764111 ) ) ( not ( = ?auto_764110 ?auto_764112 ) ) ( not ( = ?auto_764110 ?auto_764113 ) ) ( not ( = ?auto_764110 ?auto_764114 ) ) ( not ( = ?auto_764110 ?auto_764115 ) ) ( not ( = ?auto_764110 ?auto_764116 ) ) ( not ( = ?auto_764110 ?auto_764117 ) ) ( not ( = ?auto_764110 ?auto_764118 ) ) ( not ( = ?auto_764110 ?auto_764119 ) ) ( not ( = ?auto_764110 ?auto_764120 ) ) ( not ( = ?auto_764110 ?auto_764121 ) ) ( not ( = ?auto_764110 ?auto_764122 ) ) ( not ( = ?auto_764110 ?auto_764123 ) ) ( not ( = ?auto_764110 ?auto_764124 ) ) ( not ( = ?auto_764111 ?auto_764112 ) ) ( not ( = ?auto_764111 ?auto_764113 ) ) ( not ( = ?auto_764111 ?auto_764114 ) ) ( not ( = ?auto_764111 ?auto_764115 ) ) ( not ( = ?auto_764111 ?auto_764116 ) ) ( not ( = ?auto_764111 ?auto_764117 ) ) ( not ( = ?auto_764111 ?auto_764118 ) ) ( not ( = ?auto_764111 ?auto_764119 ) ) ( not ( = ?auto_764111 ?auto_764120 ) ) ( not ( = ?auto_764111 ?auto_764121 ) ) ( not ( = ?auto_764111 ?auto_764122 ) ) ( not ( = ?auto_764111 ?auto_764123 ) ) ( not ( = ?auto_764111 ?auto_764124 ) ) ( not ( = ?auto_764112 ?auto_764113 ) ) ( not ( = ?auto_764112 ?auto_764114 ) ) ( not ( = ?auto_764112 ?auto_764115 ) ) ( not ( = ?auto_764112 ?auto_764116 ) ) ( not ( = ?auto_764112 ?auto_764117 ) ) ( not ( = ?auto_764112 ?auto_764118 ) ) ( not ( = ?auto_764112 ?auto_764119 ) ) ( not ( = ?auto_764112 ?auto_764120 ) ) ( not ( = ?auto_764112 ?auto_764121 ) ) ( not ( = ?auto_764112 ?auto_764122 ) ) ( not ( = ?auto_764112 ?auto_764123 ) ) ( not ( = ?auto_764112 ?auto_764124 ) ) ( not ( = ?auto_764113 ?auto_764114 ) ) ( not ( = ?auto_764113 ?auto_764115 ) ) ( not ( = ?auto_764113 ?auto_764116 ) ) ( not ( = ?auto_764113 ?auto_764117 ) ) ( not ( = ?auto_764113 ?auto_764118 ) ) ( not ( = ?auto_764113 ?auto_764119 ) ) ( not ( = ?auto_764113 ?auto_764120 ) ) ( not ( = ?auto_764113 ?auto_764121 ) ) ( not ( = ?auto_764113 ?auto_764122 ) ) ( not ( = ?auto_764113 ?auto_764123 ) ) ( not ( = ?auto_764113 ?auto_764124 ) ) ( not ( = ?auto_764114 ?auto_764115 ) ) ( not ( = ?auto_764114 ?auto_764116 ) ) ( not ( = ?auto_764114 ?auto_764117 ) ) ( not ( = ?auto_764114 ?auto_764118 ) ) ( not ( = ?auto_764114 ?auto_764119 ) ) ( not ( = ?auto_764114 ?auto_764120 ) ) ( not ( = ?auto_764114 ?auto_764121 ) ) ( not ( = ?auto_764114 ?auto_764122 ) ) ( not ( = ?auto_764114 ?auto_764123 ) ) ( not ( = ?auto_764114 ?auto_764124 ) ) ( not ( = ?auto_764115 ?auto_764116 ) ) ( not ( = ?auto_764115 ?auto_764117 ) ) ( not ( = ?auto_764115 ?auto_764118 ) ) ( not ( = ?auto_764115 ?auto_764119 ) ) ( not ( = ?auto_764115 ?auto_764120 ) ) ( not ( = ?auto_764115 ?auto_764121 ) ) ( not ( = ?auto_764115 ?auto_764122 ) ) ( not ( = ?auto_764115 ?auto_764123 ) ) ( not ( = ?auto_764115 ?auto_764124 ) ) ( not ( = ?auto_764116 ?auto_764117 ) ) ( not ( = ?auto_764116 ?auto_764118 ) ) ( not ( = ?auto_764116 ?auto_764119 ) ) ( not ( = ?auto_764116 ?auto_764120 ) ) ( not ( = ?auto_764116 ?auto_764121 ) ) ( not ( = ?auto_764116 ?auto_764122 ) ) ( not ( = ?auto_764116 ?auto_764123 ) ) ( not ( = ?auto_764116 ?auto_764124 ) ) ( not ( = ?auto_764117 ?auto_764118 ) ) ( not ( = ?auto_764117 ?auto_764119 ) ) ( not ( = ?auto_764117 ?auto_764120 ) ) ( not ( = ?auto_764117 ?auto_764121 ) ) ( not ( = ?auto_764117 ?auto_764122 ) ) ( not ( = ?auto_764117 ?auto_764123 ) ) ( not ( = ?auto_764117 ?auto_764124 ) ) ( not ( = ?auto_764118 ?auto_764119 ) ) ( not ( = ?auto_764118 ?auto_764120 ) ) ( not ( = ?auto_764118 ?auto_764121 ) ) ( not ( = ?auto_764118 ?auto_764122 ) ) ( not ( = ?auto_764118 ?auto_764123 ) ) ( not ( = ?auto_764118 ?auto_764124 ) ) ( not ( = ?auto_764119 ?auto_764120 ) ) ( not ( = ?auto_764119 ?auto_764121 ) ) ( not ( = ?auto_764119 ?auto_764122 ) ) ( not ( = ?auto_764119 ?auto_764123 ) ) ( not ( = ?auto_764119 ?auto_764124 ) ) ( not ( = ?auto_764120 ?auto_764121 ) ) ( not ( = ?auto_764120 ?auto_764122 ) ) ( not ( = ?auto_764120 ?auto_764123 ) ) ( not ( = ?auto_764120 ?auto_764124 ) ) ( not ( = ?auto_764121 ?auto_764122 ) ) ( not ( = ?auto_764121 ?auto_764123 ) ) ( not ( = ?auto_764121 ?auto_764124 ) ) ( not ( = ?auto_764122 ?auto_764123 ) ) ( not ( = ?auto_764122 ?auto_764124 ) ) ( not ( = ?auto_764123 ?auto_764124 ) ) ( ON ?auto_764122 ?auto_764123 ) ( ON ?auto_764121 ?auto_764122 ) ( ON ?auto_764120 ?auto_764121 ) ( ON ?auto_764119 ?auto_764120 ) ( ON ?auto_764118 ?auto_764119 ) ( ON ?auto_764117 ?auto_764118 ) ( ON ?auto_764116 ?auto_764117 ) ( CLEAR ?auto_764114 ) ( ON ?auto_764115 ?auto_764116 ) ( CLEAR ?auto_764115 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_764107 ?auto_764108 ?auto_764109 ?auto_764110 ?auto_764111 ?auto_764112 ?auto_764113 ?auto_764114 ?auto_764115 )
      ( MAKE-17PILE ?auto_764107 ?auto_764108 ?auto_764109 ?auto_764110 ?auto_764111 ?auto_764112 ?auto_764113 ?auto_764114 ?auto_764115 ?auto_764116 ?auto_764117 ?auto_764118 ?auto_764119 ?auto_764120 ?auto_764121 ?auto_764122 ?auto_764123 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_764177 - BLOCK
      ?auto_764178 - BLOCK
      ?auto_764179 - BLOCK
      ?auto_764180 - BLOCK
      ?auto_764181 - BLOCK
      ?auto_764182 - BLOCK
      ?auto_764183 - BLOCK
      ?auto_764184 - BLOCK
      ?auto_764185 - BLOCK
      ?auto_764186 - BLOCK
      ?auto_764187 - BLOCK
      ?auto_764188 - BLOCK
      ?auto_764189 - BLOCK
      ?auto_764190 - BLOCK
      ?auto_764191 - BLOCK
      ?auto_764192 - BLOCK
      ?auto_764193 - BLOCK
    )
    :vars
    (
      ?auto_764194 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_764193 ?auto_764194 ) ( ON-TABLE ?auto_764177 ) ( ON ?auto_764178 ?auto_764177 ) ( ON ?auto_764179 ?auto_764178 ) ( ON ?auto_764180 ?auto_764179 ) ( ON ?auto_764181 ?auto_764180 ) ( ON ?auto_764182 ?auto_764181 ) ( ON ?auto_764183 ?auto_764182 ) ( not ( = ?auto_764177 ?auto_764178 ) ) ( not ( = ?auto_764177 ?auto_764179 ) ) ( not ( = ?auto_764177 ?auto_764180 ) ) ( not ( = ?auto_764177 ?auto_764181 ) ) ( not ( = ?auto_764177 ?auto_764182 ) ) ( not ( = ?auto_764177 ?auto_764183 ) ) ( not ( = ?auto_764177 ?auto_764184 ) ) ( not ( = ?auto_764177 ?auto_764185 ) ) ( not ( = ?auto_764177 ?auto_764186 ) ) ( not ( = ?auto_764177 ?auto_764187 ) ) ( not ( = ?auto_764177 ?auto_764188 ) ) ( not ( = ?auto_764177 ?auto_764189 ) ) ( not ( = ?auto_764177 ?auto_764190 ) ) ( not ( = ?auto_764177 ?auto_764191 ) ) ( not ( = ?auto_764177 ?auto_764192 ) ) ( not ( = ?auto_764177 ?auto_764193 ) ) ( not ( = ?auto_764177 ?auto_764194 ) ) ( not ( = ?auto_764178 ?auto_764179 ) ) ( not ( = ?auto_764178 ?auto_764180 ) ) ( not ( = ?auto_764178 ?auto_764181 ) ) ( not ( = ?auto_764178 ?auto_764182 ) ) ( not ( = ?auto_764178 ?auto_764183 ) ) ( not ( = ?auto_764178 ?auto_764184 ) ) ( not ( = ?auto_764178 ?auto_764185 ) ) ( not ( = ?auto_764178 ?auto_764186 ) ) ( not ( = ?auto_764178 ?auto_764187 ) ) ( not ( = ?auto_764178 ?auto_764188 ) ) ( not ( = ?auto_764178 ?auto_764189 ) ) ( not ( = ?auto_764178 ?auto_764190 ) ) ( not ( = ?auto_764178 ?auto_764191 ) ) ( not ( = ?auto_764178 ?auto_764192 ) ) ( not ( = ?auto_764178 ?auto_764193 ) ) ( not ( = ?auto_764178 ?auto_764194 ) ) ( not ( = ?auto_764179 ?auto_764180 ) ) ( not ( = ?auto_764179 ?auto_764181 ) ) ( not ( = ?auto_764179 ?auto_764182 ) ) ( not ( = ?auto_764179 ?auto_764183 ) ) ( not ( = ?auto_764179 ?auto_764184 ) ) ( not ( = ?auto_764179 ?auto_764185 ) ) ( not ( = ?auto_764179 ?auto_764186 ) ) ( not ( = ?auto_764179 ?auto_764187 ) ) ( not ( = ?auto_764179 ?auto_764188 ) ) ( not ( = ?auto_764179 ?auto_764189 ) ) ( not ( = ?auto_764179 ?auto_764190 ) ) ( not ( = ?auto_764179 ?auto_764191 ) ) ( not ( = ?auto_764179 ?auto_764192 ) ) ( not ( = ?auto_764179 ?auto_764193 ) ) ( not ( = ?auto_764179 ?auto_764194 ) ) ( not ( = ?auto_764180 ?auto_764181 ) ) ( not ( = ?auto_764180 ?auto_764182 ) ) ( not ( = ?auto_764180 ?auto_764183 ) ) ( not ( = ?auto_764180 ?auto_764184 ) ) ( not ( = ?auto_764180 ?auto_764185 ) ) ( not ( = ?auto_764180 ?auto_764186 ) ) ( not ( = ?auto_764180 ?auto_764187 ) ) ( not ( = ?auto_764180 ?auto_764188 ) ) ( not ( = ?auto_764180 ?auto_764189 ) ) ( not ( = ?auto_764180 ?auto_764190 ) ) ( not ( = ?auto_764180 ?auto_764191 ) ) ( not ( = ?auto_764180 ?auto_764192 ) ) ( not ( = ?auto_764180 ?auto_764193 ) ) ( not ( = ?auto_764180 ?auto_764194 ) ) ( not ( = ?auto_764181 ?auto_764182 ) ) ( not ( = ?auto_764181 ?auto_764183 ) ) ( not ( = ?auto_764181 ?auto_764184 ) ) ( not ( = ?auto_764181 ?auto_764185 ) ) ( not ( = ?auto_764181 ?auto_764186 ) ) ( not ( = ?auto_764181 ?auto_764187 ) ) ( not ( = ?auto_764181 ?auto_764188 ) ) ( not ( = ?auto_764181 ?auto_764189 ) ) ( not ( = ?auto_764181 ?auto_764190 ) ) ( not ( = ?auto_764181 ?auto_764191 ) ) ( not ( = ?auto_764181 ?auto_764192 ) ) ( not ( = ?auto_764181 ?auto_764193 ) ) ( not ( = ?auto_764181 ?auto_764194 ) ) ( not ( = ?auto_764182 ?auto_764183 ) ) ( not ( = ?auto_764182 ?auto_764184 ) ) ( not ( = ?auto_764182 ?auto_764185 ) ) ( not ( = ?auto_764182 ?auto_764186 ) ) ( not ( = ?auto_764182 ?auto_764187 ) ) ( not ( = ?auto_764182 ?auto_764188 ) ) ( not ( = ?auto_764182 ?auto_764189 ) ) ( not ( = ?auto_764182 ?auto_764190 ) ) ( not ( = ?auto_764182 ?auto_764191 ) ) ( not ( = ?auto_764182 ?auto_764192 ) ) ( not ( = ?auto_764182 ?auto_764193 ) ) ( not ( = ?auto_764182 ?auto_764194 ) ) ( not ( = ?auto_764183 ?auto_764184 ) ) ( not ( = ?auto_764183 ?auto_764185 ) ) ( not ( = ?auto_764183 ?auto_764186 ) ) ( not ( = ?auto_764183 ?auto_764187 ) ) ( not ( = ?auto_764183 ?auto_764188 ) ) ( not ( = ?auto_764183 ?auto_764189 ) ) ( not ( = ?auto_764183 ?auto_764190 ) ) ( not ( = ?auto_764183 ?auto_764191 ) ) ( not ( = ?auto_764183 ?auto_764192 ) ) ( not ( = ?auto_764183 ?auto_764193 ) ) ( not ( = ?auto_764183 ?auto_764194 ) ) ( not ( = ?auto_764184 ?auto_764185 ) ) ( not ( = ?auto_764184 ?auto_764186 ) ) ( not ( = ?auto_764184 ?auto_764187 ) ) ( not ( = ?auto_764184 ?auto_764188 ) ) ( not ( = ?auto_764184 ?auto_764189 ) ) ( not ( = ?auto_764184 ?auto_764190 ) ) ( not ( = ?auto_764184 ?auto_764191 ) ) ( not ( = ?auto_764184 ?auto_764192 ) ) ( not ( = ?auto_764184 ?auto_764193 ) ) ( not ( = ?auto_764184 ?auto_764194 ) ) ( not ( = ?auto_764185 ?auto_764186 ) ) ( not ( = ?auto_764185 ?auto_764187 ) ) ( not ( = ?auto_764185 ?auto_764188 ) ) ( not ( = ?auto_764185 ?auto_764189 ) ) ( not ( = ?auto_764185 ?auto_764190 ) ) ( not ( = ?auto_764185 ?auto_764191 ) ) ( not ( = ?auto_764185 ?auto_764192 ) ) ( not ( = ?auto_764185 ?auto_764193 ) ) ( not ( = ?auto_764185 ?auto_764194 ) ) ( not ( = ?auto_764186 ?auto_764187 ) ) ( not ( = ?auto_764186 ?auto_764188 ) ) ( not ( = ?auto_764186 ?auto_764189 ) ) ( not ( = ?auto_764186 ?auto_764190 ) ) ( not ( = ?auto_764186 ?auto_764191 ) ) ( not ( = ?auto_764186 ?auto_764192 ) ) ( not ( = ?auto_764186 ?auto_764193 ) ) ( not ( = ?auto_764186 ?auto_764194 ) ) ( not ( = ?auto_764187 ?auto_764188 ) ) ( not ( = ?auto_764187 ?auto_764189 ) ) ( not ( = ?auto_764187 ?auto_764190 ) ) ( not ( = ?auto_764187 ?auto_764191 ) ) ( not ( = ?auto_764187 ?auto_764192 ) ) ( not ( = ?auto_764187 ?auto_764193 ) ) ( not ( = ?auto_764187 ?auto_764194 ) ) ( not ( = ?auto_764188 ?auto_764189 ) ) ( not ( = ?auto_764188 ?auto_764190 ) ) ( not ( = ?auto_764188 ?auto_764191 ) ) ( not ( = ?auto_764188 ?auto_764192 ) ) ( not ( = ?auto_764188 ?auto_764193 ) ) ( not ( = ?auto_764188 ?auto_764194 ) ) ( not ( = ?auto_764189 ?auto_764190 ) ) ( not ( = ?auto_764189 ?auto_764191 ) ) ( not ( = ?auto_764189 ?auto_764192 ) ) ( not ( = ?auto_764189 ?auto_764193 ) ) ( not ( = ?auto_764189 ?auto_764194 ) ) ( not ( = ?auto_764190 ?auto_764191 ) ) ( not ( = ?auto_764190 ?auto_764192 ) ) ( not ( = ?auto_764190 ?auto_764193 ) ) ( not ( = ?auto_764190 ?auto_764194 ) ) ( not ( = ?auto_764191 ?auto_764192 ) ) ( not ( = ?auto_764191 ?auto_764193 ) ) ( not ( = ?auto_764191 ?auto_764194 ) ) ( not ( = ?auto_764192 ?auto_764193 ) ) ( not ( = ?auto_764192 ?auto_764194 ) ) ( not ( = ?auto_764193 ?auto_764194 ) ) ( ON ?auto_764192 ?auto_764193 ) ( ON ?auto_764191 ?auto_764192 ) ( ON ?auto_764190 ?auto_764191 ) ( ON ?auto_764189 ?auto_764190 ) ( ON ?auto_764188 ?auto_764189 ) ( ON ?auto_764187 ?auto_764188 ) ( ON ?auto_764186 ?auto_764187 ) ( ON ?auto_764185 ?auto_764186 ) ( CLEAR ?auto_764183 ) ( ON ?auto_764184 ?auto_764185 ) ( CLEAR ?auto_764184 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_764177 ?auto_764178 ?auto_764179 ?auto_764180 ?auto_764181 ?auto_764182 ?auto_764183 ?auto_764184 )
      ( MAKE-17PILE ?auto_764177 ?auto_764178 ?auto_764179 ?auto_764180 ?auto_764181 ?auto_764182 ?auto_764183 ?auto_764184 ?auto_764185 ?auto_764186 ?auto_764187 ?auto_764188 ?auto_764189 ?auto_764190 ?auto_764191 ?auto_764192 ?auto_764193 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_764247 - BLOCK
      ?auto_764248 - BLOCK
      ?auto_764249 - BLOCK
      ?auto_764250 - BLOCK
      ?auto_764251 - BLOCK
      ?auto_764252 - BLOCK
      ?auto_764253 - BLOCK
      ?auto_764254 - BLOCK
      ?auto_764255 - BLOCK
      ?auto_764256 - BLOCK
      ?auto_764257 - BLOCK
      ?auto_764258 - BLOCK
      ?auto_764259 - BLOCK
      ?auto_764260 - BLOCK
      ?auto_764261 - BLOCK
      ?auto_764262 - BLOCK
      ?auto_764263 - BLOCK
    )
    :vars
    (
      ?auto_764264 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_764263 ?auto_764264 ) ( ON-TABLE ?auto_764247 ) ( ON ?auto_764248 ?auto_764247 ) ( ON ?auto_764249 ?auto_764248 ) ( ON ?auto_764250 ?auto_764249 ) ( ON ?auto_764251 ?auto_764250 ) ( ON ?auto_764252 ?auto_764251 ) ( not ( = ?auto_764247 ?auto_764248 ) ) ( not ( = ?auto_764247 ?auto_764249 ) ) ( not ( = ?auto_764247 ?auto_764250 ) ) ( not ( = ?auto_764247 ?auto_764251 ) ) ( not ( = ?auto_764247 ?auto_764252 ) ) ( not ( = ?auto_764247 ?auto_764253 ) ) ( not ( = ?auto_764247 ?auto_764254 ) ) ( not ( = ?auto_764247 ?auto_764255 ) ) ( not ( = ?auto_764247 ?auto_764256 ) ) ( not ( = ?auto_764247 ?auto_764257 ) ) ( not ( = ?auto_764247 ?auto_764258 ) ) ( not ( = ?auto_764247 ?auto_764259 ) ) ( not ( = ?auto_764247 ?auto_764260 ) ) ( not ( = ?auto_764247 ?auto_764261 ) ) ( not ( = ?auto_764247 ?auto_764262 ) ) ( not ( = ?auto_764247 ?auto_764263 ) ) ( not ( = ?auto_764247 ?auto_764264 ) ) ( not ( = ?auto_764248 ?auto_764249 ) ) ( not ( = ?auto_764248 ?auto_764250 ) ) ( not ( = ?auto_764248 ?auto_764251 ) ) ( not ( = ?auto_764248 ?auto_764252 ) ) ( not ( = ?auto_764248 ?auto_764253 ) ) ( not ( = ?auto_764248 ?auto_764254 ) ) ( not ( = ?auto_764248 ?auto_764255 ) ) ( not ( = ?auto_764248 ?auto_764256 ) ) ( not ( = ?auto_764248 ?auto_764257 ) ) ( not ( = ?auto_764248 ?auto_764258 ) ) ( not ( = ?auto_764248 ?auto_764259 ) ) ( not ( = ?auto_764248 ?auto_764260 ) ) ( not ( = ?auto_764248 ?auto_764261 ) ) ( not ( = ?auto_764248 ?auto_764262 ) ) ( not ( = ?auto_764248 ?auto_764263 ) ) ( not ( = ?auto_764248 ?auto_764264 ) ) ( not ( = ?auto_764249 ?auto_764250 ) ) ( not ( = ?auto_764249 ?auto_764251 ) ) ( not ( = ?auto_764249 ?auto_764252 ) ) ( not ( = ?auto_764249 ?auto_764253 ) ) ( not ( = ?auto_764249 ?auto_764254 ) ) ( not ( = ?auto_764249 ?auto_764255 ) ) ( not ( = ?auto_764249 ?auto_764256 ) ) ( not ( = ?auto_764249 ?auto_764257 ) ) ( not ( = ?auto_764249 ?auto_764258 ) ) ( not ( = ?auto_764249 ?auto_764259 ) ) ( not ( = ?auto_764249 ?auto_764260 ) ) ( not ( = ?auto_764249 ?auto_764261 ) ) ( not ( = ?auto_764249 ?auto_764262 ) ) ( not ( = ?auto_764249 ?auto_764263 ) ) ( not ( = ?auto_764249 ?auto_764264 ) ) ( not ( = ?auto_764250 ?auto_764251 ) ) ( not ( = ?auto_764250 ?auto_764252 ) ) ( not ( = ?auto_764250 ?auto_764253 ) ) ( not ( = ?auto_764250 ?auto_764254 ) ) ( not ( = ?auto_764250 ?auto_764255 ) ) ( not ( = ?auto_764250 ?auto_764256 ) ) ( not ( = ?auto_764250 ?auto_764257 ) ) ( not ( = ?auto_764250 ?auto_764258 ) ) ( not ( = ?auto_764250 ?auto_764259 ) ) ( not ( = ?auto_764250 ?auto_764260 ) ) ( not ( = ?auto_764250 ?auto_764261 ) ) ( not ( = ?auto_764250 ?auto_764262 ) ) ( not ( = ?auto_764250 ?auto_764263 ) ) ( not ( = ?auto_764250 ?auto_764264 ) ) ( not ( = ?auto_764251 ?auto_764252 ) ) ( not ( = ?auto_764251 ?auto_764253 ) ) ( not ( = ?auto_764251 ?auto_764254 ) ) ( not ( = ?auto_764251 ?auto_764255 ) ) ( not ( = ?auto_764251 ?auto_764256 ) ) ( not ( = ?auto_764251 ?auto_764257 ) ) ( not ( = ?auto_764251 ?auto_764258 ) ) ( not ( = ?auto_764251 ?auto_764259 ) ) ( not ( = ?auto_764251 ?auto_764260 ) ) ( not ( = ?auto_764251 ?auto_764261 ) ) ( not ( = ?auto_764251 ?auto_764262 ) ) ( not ( = ?auto_764251 ?auto_764263 ) ) ( not ( = ?auto_764251 ?auto_764264 ) ) ( not ( = ?auto_764252 ?auto_764253 ) ) ( not ( = ?auto_764252 ?auto_764254 ) ) ( not ( = ?auto_764252 ?auto_764255 ) ) ( not ( = ?auto_764252 ?auto_764256 ) ) ( not ( = ?auto_764252 ?auto_764257 ) ) ( not ( = ?auto_764252 ?auto_764258 ) ) ( not ( = ?auto_764252 ?auto_764259 ) ) ( not ( = ?auto_764252 ?auto_764260 ) ) ( not ( = ?auto_764252 ?auto_764261 ) ) ( not ( = ?auto_764252 ?auto_764262 ) ) ( not ( = ?auto_764252 ?auto_764263 ) ) ( not ( = ?auto_764252 ?auto_764264 ) ) ( not ( = ?auto_764253 ?auto_764254 ) ) ( not ( = ?auto_764253 ?auto_764255 ) ) ( not ( = ?auto_764253 ?auto_764256 ) ) ( not ( = ?auto_764253 ?auto_764257 ) ) ( not ( = ?auto_764253 ?auto_764258 ) ) ( not ( = ?auto_764253 ?auto_764259 ) ) ( not ( = ?auto_764253 ?auto_764260 ) ) ( not ( = ?auto_764253 ?auto_764261 ) ) ( not ( = ?auto_764253 ?auto_764262 ) ) ( not ( = ?auto_764253 ?auto_764263 ) ) ( not ( = ?auto_764253 ?auto_764264 ) ) ( not ( = ?auto_764254 ?auto_764255 ) ) ( not ( = ?auto_764254 ?auto_764256 ) ) ( not ( = ?auto_764254 ?auto_764257 ) ) ( not ( = ?auto_764254 ?auto_764258 ) ) ( not ( = ?auto_764254 ?auto_764259 ) ) ( not ( = ?auto_764254 ?auto_764260 ) ) ( not ( = ?auto_764254 ?auto_764261 ) ) ( not ( = ?auto_764254 ?auto_764262 ) ) ( not ( = ?auto_764254 ?auto_764263 ) ) ( not ( = ?auto_764254 ?auto_764264 ) ) ( not ( = ?auto_764255 ?auto_764256 ) ) ( not ( = ?auto_764255 ?auto_764257 ) ) ( not ( = ?auto_764255 ?auto_764258 ) ) ( not ( = ?auto_764255 ?auto_764259 ) ) ( not ( = ?auto_764255 ?auto_764260 ) ) ( not ( = ?auto_764255 ?auto_764261 ) ) ( not ( = ?auto_764255 ?auto_764262 ) ) ( not ( = ?auto_764255 ?auto_764263 ) ) ( not ( = ?auto_764255 ?auto_764264 ) ) ( not ( = ?auto_764256 ?auto_764257 ) ) ( not ( = ?auto_764256 ?auto_764258 ) ) ( not ( = ?auto_764256 ?auto_764259 ) ) ( not ( = ?auto_764256 ?auto_764260 ) ) ( not ( = ?auto_764256 ?auto_764261 ) ) ( not ( = ?auto_764256 ?auto_764262 ) ) ( not ( = ?auto_764256 ?auto_764263 ) ) ( not ( = ?auto_764256 ?auto_764264 ) ) ( not ( = ?auto_764257 ?auto_764258 ) ) ( not ( = ?auto_764257 ?auto_764259 ) ) ( not ( = ?auto_764257 ?auto_764260 ) ) ( not ( = ?auto_764257 ?auto_764261 ) ) ( not ( = ?auto_764257 ?auto_764262 ) ) ( not ( = ?auto_764257 ?auto_764263 ) ) ( not ( = ?auto_764257 ?auto_764264 ) ) ( not ( = ?auto_764258 ?auto_764259 ) ) ( not ( = ?auto_764258 ?auto_764260 ) ) ( not ( = ?auto_764258 ?auto_764261 ) ) ( not ( = ?auto_764258 ?auto_764262 ) ) ( not ( = ?auto_764258 ?auto_764263 ) ) ( not ( = ?auto_764258 ?auto_764264 ) ) ( not ( = ?auto_764259 ?auto_764260 ) ) ( not ( = ?auto_764259 ?auto_764261 ) ) ( not ( = ?auto_764259 ?auto_764262 ) ) ( not ( = ?auto_764259 ?auto_764263 ) ) ( not ( = ?auto_764259 ?auto_764264 ) ) ( not ( = ?auto_764260 ?auto_764261 ) ) ( not ( = ?auto_764260 ?auto_764262 ) ) ( not ( = ?auto_764260 ?auto_764263 ) ) ( not ( = ?auto_764260 ?auto_764264 ) ) ( not ( = ?auto_764261 ?auto_764262 ) ) ( not ( = ?auto_764261 ?auto_764263 ) ) ( not ( = ?auto_764261 ?auto_764264 ) ) ( not ( = ?auto_764262 ?auto_764263 ) ) ( not ( = ?auto_764262 ?auto_764264 ) ) ( not ( = ?auto_764263 ?auto_764264 ) ) ( ON ?auto_764262 ?auto_764263 ) ( ON ?auto_764261 ?auto_764262 ) ( ON ?auto_764260 ?auto_764261 ) ( ON ?auto_764259 ?auto_764260 ) ( ON ?auto_764258 ?auto_764259 ) ( ON ?auto_764257 ?auto_764258 ) ( ON ?auto_764256 ?auto_764257 ) ( ON ?auto_764255 ?auto_764256 ) ( ON ?auto_764254 ?auto_764255 ) ( CLEAR ?auto_764252 ) ( ON ?auto_764253 ?auto_764254 ) ( CLEAR ?auto_764253 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_764247 ?auto_764248 ?auto_764249 ?auto_764250 ?auto_764251 ?auto_764252 ?auto_764253 )
      ( MAKE-17PILE ?auto_764247 ?auto_764248 ?auto_764249 ?auto_764250 ?auto_764251 ?auto_764252 ?auto_764253 ?auto_764254 ?auto_764255 ?auto_764256 ?auto_764257 ?auto_764258 ?auto_764259 ?auto_764260 ?auto_764261 ?auto_764262 ?auto_764263 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_764317 - BLOCK
      ?auto_764318 - BLOCK
      ?auto_764319 - BLOCK
      ?auto_764320 - BLOCK
      ?auto_764321 - BLOCK
      ?auto_764322 - BLOCK
      ?auto_764323 - BLOCK
      ?auto_764324 - BLOCK
      ?auto_764325 - BLOCK
      ?auto_764326 - BLOCK
      ?auto_764327 - BLOCK
      ?auto_764328 - BLOCK
      ?auto_764329 - BLOCK
      ?auto_764330 - BLOCK
      ?auto_764331 - BLOCK
      ?auto_764332 - BLOCK
      ?auto_764333 - BLOCK
    )
    :vars
    (
      ?auto_764334 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_764333 ?auto_764334 ) ( ON-TABLE ?auto_764317 ) ( ON ?auto_764318 ?auto_764317 ) ( ON ?auto_764319 ?auto_764318 ) ( ON ?auto_764320 ?auto_764319 ) ( ON ?auto_764321 ?auto_764320 ) ( not ( = ?auto_764317 ?auto_764318 ) ) ( not ( = ?auto_764317 ?auto_764319 ) ) ( not ( = ?auto_764317 ?auto_764320 ) ) ( not ( = ?auto_764317 ?auto_764321 ) ) ( not ( = ?auto_764317 ?auto_764322 ) ) ( not ( = ?auto_764317 ?auto_764323 ) ) ( not ( = ?auto_764317 ?auto_764324 ) ) ( not ( = ?auto_764317 ?auto_764325 ) ) ( not ( = ?auto_764317 ?auto_764326 ) ) ( not ( = ?auto_764317 ?auto_764327 ) ) ( not ( = ?auto_764317 ?auto_764328 ) ) ( not ( = ?auto_764317 ?auto_764329 ) ) ( not ( = ?auto_764317 ?auto_764330 ) ) ( not ( = ?auto_764317 ?auto_764331 ) ) ( not ( = ?auto_764317 ?auto_764332 ) ) ( not ( = ?auto_764317 ?auto_764333 ) ) ( not ( = ?auto_764317 ?auto_764334 ) ) ( not ( = ?auto_764318 ?auto_764319 ) ) ( not ( = ?auto_764318 ?auto_764320 ) ) ( not ( = ?auto_764318 ?auto_764321 ) ) ( not ( = ?auto_764318 ?auto_764322 ) ) ( not ( = ?auto_764318 ?auto_764323 ) ) ( not ( = ?auto_764318 ?auto_764324 ) ) ( not ( = ?auto_764318 ?auto_764325 ) ) ( not ( = ?auto_764318 ?auto_764326 ) ) ( not ( = ?auto_764318 ?auto_764327 ) ) ( not ( = ?auto_764318 ?auto_764328 ) ) ( not ( = ?auto_764318 ?auto_764329 ) ) ( not ( = ?auto_764318 ?auto_764330 ) ) ( not ( = ?auto_764318 ?auto_764331 ) ) ( not ( = ?auto_764318 ?auto_764332 ) ) ( not ( = ?auto_764318 ?auto_764333 ) ) ( not ( = ?auto_764318 ?auto_764334 ) ) ( not ( = ?auto_764319 ?auto_764320 ) ) ( not ( = ?auto_764319 ?auto_764321 ) ) ( not ( = ?auto_764319 ?auto_764322 ) ) ( not ( = ?auto_764319 ?auto_764323 ) ) ( not ( = ?auto_764319 ?auto_764324 ) ) ( not ( = ?auto_764319 ?auto_764325 ) ) ( not ( = ?auto_764319 ?auto_764326 ) ) ( not ( = ?auto_764319 ?auto_764327 ) ) ( not ( = ?auto_764319 ?auto_764328 ) ) ( not ( = ?auto_764319 ?auto_764329 ) ) ( not ( = ?auto_764319 ?auto_764330 ) ) ( not ( = ?auto_764319 ?auto_764331 ) ) ( not ( = ?auto_764319 ?auto_764332 ) ) ( not ( = ?auto_764319 ?auto_764333 ) ) ( not ( = ?auto_764319 ?auto_764334 ) ) ( not ( = ?auto_764320 ?auto_764321 ) ) ( not ( = ?auto_764320 ?auto_764322 ) ) ( not ( = ?auto_764320 ?auto_764323 ) ) ( not ( = ?auto_764320 ?auto_764324 ) ) ( not ( = ?auto_764320 ?auto_764325 ) ) ( not ( = ?auto_764320 ?auto_764326 ) ) ( not ( = ?auto_764320 ?auto_764327 ) ) ( not ( = ?auto_764320 ?auto_764328 ) ) ( not ( = ?auto_764320 ?auto_764329 ) ) ( not ( = ?auto_764320 ?auto_764330 ) ) ( not ( = ?auto_764320 ?auto_764331 ) ) ( not ( = ?auto_764320 ?auto_764332 ) ) ( not ( = ?auto_764320 ?auto_764333 ) ) ( not ( = ?auto_764320 ?auto_764334 ) ) ( not ( = ?auto_764321 ?auto_764322 ) ) ( not ( = ?auto_764321 ?auto_764323 ) ) ( not ( = ?auto_764321 ?auto_764324 ) ) ( not ( = ?auto_764321 ?auto_764325 ) ) ( not ( = ?auto_764321 ?auto_764326 ) ) ( not ( = ?auto_764321 ?auto_764327 ) ) ( not ( = ?auto_764321 ?auto_764328 ) ) ( not ( = ?auto_764321 ?auto_764329 ) ) ( not ( = ?auto_764321 ?auto_764330 ) ) ( not ( = ?auto_764321 ?auto_764331 ) ) ( not ( = ?auto_764321 ?auto_764332 ) ) ( not ( = ?auto_764321 ?auto_764333 ) ) ( not ( = ?auto_764321 ?auto_764334 ) ) ( not ( = ?auto_764322 ?auto_764323 ) ) ( not ( = ?auto_764322 ?auto_764324 ) ) ( not ( = ?auto_764322 ?auto_764325 ) ) ( not ( = ?auto_764322 ?auto_764326 ) ) ( not ( = ?auto_764322 ?auto_764327 ) ) ( not ( = ?auto_764322 ?auto_764328 ) ) ( not ( = ?auto_764322 ?auto_764329 ) ) ( not ( = ?auto_764322 ?auto_764330 ) ) ( not ( = ?auto_764322 ?auto_764331 ) ) ( not ( = ?auto_764322 ?auto_764332 ) ) ( not ( = ?auto_764322 ?auto_764333 ) ) ( not ( = ?auto_764322 ?auto_764334 ) ) ( not ( = ?auto_764323 ?auto_764324 ) ) ( not ( = ?auto_764323 ?auto_764325 ) ) ( not ( = ?auto_764323 ?auto_764326 ) ) ( not ( = ?auto_764323 ?auto_764327 ) ) ( not ( = ?auto_764323 ?auto_764328 ) ) ( not ( = ?auto_764323 ?auto_764329 ) ) ( not ( = ?auto_764323 ?auto_764330 ) ) ( not ( = ?auto_764323 ?auto_764331 ) ) ( not ( = ?auto_764323 ?auto_764332 ) ) ( not ( = ?auto_764323 ?auto_764333 ) ) ( not ( = ?auto_764323 ?auto_764334 ) ) ( not ( = ?auto_764324 ?auto_764325 ) ) ( not ( = ?auto_764324 ?auto_764326 ) ) ( not ( = ?auto_764324 ?auto_764327 ) ) ( not ( = ?auto_764324 ?auto_764328 ) ) ( not ( = ?auto_764324 ?auto_764329 ) ) ( not ( = ?auto_764324 ?auto_764330 ) ) ( not ( = ?auto_764324 ?auto_764331 ) ) ( not ( = ?auto_764324 ?auto_764332 ) ) ( not ( = ?auto_764324 ?auto_764333 ) ) ( not ( = ?auto_764324 ?auto_764334 ) ) ( not ( = ?auto_764325 ?auto_764326 ) ) ( not ( = ?auto_764325 ?auto_764327 ) ) ( not ( = ?auto_764325 ?auto_764328 ) ) ( not ( = ?auto_764325 ?auto_764329 ) ) ( not ( = ?auto_764325 ?auto_764330 ) ) ( not ( = ?auto_764325 ?auto_764331 ) ) ( not ( = ?auto_764325 ?auto_764332 ) ) ( not ( = ?auto_764325 ?auto_764333 ) ) ( not ( = ?auto_764325 ?auto_764334 ) ) ( not ( = ?auto_764326 ?auto_764327 ) ) ( not ( = ?auto_764326 ?auto_764328 ) ) ( not ( = ?auto_764326 ?auto_764329 ) ) ( not ( = ?auto_764326 ?auto_764330 ) ) ( not ( = ?auto_764326 ?auto_764331 ) ) ( not ( = ?auto_764326 ?auto_764332 ) ) ( not ( = ?auto_764326 ?auto_764333 ) ) ( not ( = ?auto_764326 ?auto_764334 ) ) ( not ( = ?auto_764327 ?auto_764328 ) ) ( not ( = ?auto_764327 ?auto_764329 ) ) ( not ( = ?auto_764327 ?auto_764330 ) ) ( not ( = ?auto_764327 ?auto_764331 ) ) ( not ( = ?auto_764327 ?auto_764332 ) ) ( not ( = ?auto_764327 ?auto_764333 ) ) ( not ( = ?auto_764327 ?auto_764334 ) ) ( not ( = ?auto_764328 ?auto_764329 ) ) ( not ( = ?auto_764328 ?auto_764330 ) ) ( not ( = ?auto_764328 ?auto_764331 ) ) ( not ( = ?auto_764328 ?auto_764332 ) ) ( not ( = ?auto_764328 ?auto_764333 ) ) ( not ( = ?auto_764328 ?auto_764334 ) ) ( not ( = ?auto_764329 ?auto_764330 ) ) ( not ( = ?auto_764329 ?auto_764331 ) ) ( not ( = ?auto_764329 ?auto_764332 ) ) ( not ( = ?auto_764329 ?auto_764333 ) ) ( not ( = ?auto_764329 ?auto_764334 ) ) ( not ( = ?auto_764330 ?auto_764331 ) ) ( not ( = ?auto_764330 ?auto_764332 ) ) ( not ( = ?auto_764330 ?auto_764333 ) ) ( not ( = ?auto_764330 ?auto_764334 ) ) ( not ( = ?auto_764331 ?auto_764332 ) ) ( not ( = ?auto_764331 ?auto_764333 ) ) ( not ( = ?auto_764331 ?auto_764334 ) ) ( not ( = ?auto_764332 ?auto_764333 ) ) ( not ( = ?auto_764332 ?auto_764334 ) ) ( not ( = ?auto_764333 ?auto_764334 ) ) ( ON ?auto_764332 ?auto_764333 ) ( ON ?auto_764331 ?auto_764332 ) ( ON ?auto_764330 ?auto_764331 ) ( ON ?auto_764329 ?auto_764330 ) ( ON ?auto_764328 ?auto_764329 ) ( ON ?auto_764327 ?auto_764328 ) ( ON ?auto_764326 ?auto_764327 ) ( ON ?auto_764325 ?auto_764326 ) ( ON ?auto_764324 ?auto_764325 ) ( ON ?auto_764323 ?auto_764324 ) ( CLEAR ?auto_764321 ) ( ON ?auto_764322 ?auto_764323 ) ( CLEAR ?auto_764322 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_764317 ?auto_764318 ?auto_764319 ?auto_764320 ?auto_764321 ?auto_764322 )
      ( MAKE-17PILE ?auto_764317 ?auto_764318 ?auto_764319 ?auto_764320 ?auto_764321 ?auto_764322 ?auto_764323 ?auto_764324 ?auto_764325 ?auto_764326 ?auto_764327 ?auto_764328 ?auto_764329 ?auto_764330 ?auto_764331 ?auto_764332 ?auto_764333 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_764387 - BLOCK
      ?auto_764388 - BLOCK
      ?auto_764389 - BLOCK
      ?auto_764390 - BLOCK
      ?auto_764391 - BLOCK
      ?auto_764392 - BLOCK
      ?auto_764393 - BLOCK
      ?auto_764394 - BLOCK
      ?auto_764395 - BLOCK
      ?auto_764396 - BLOCK
      ?auto_764397 - BLOCK
      ?auto_764398 - BLOCK
      ?auto_764399 - BLOCK
      ?auto_764400 - BLOCK
      ?auto_764401 - BLOCK
      ?auto_764402 - BLOCK
      ?auto_764403 - BLOCK
    )
    :vars
    (
      ?auto_764404 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_764403 ?auto_764404 ) ( ON-TABLE ?auto_764387 ) ( ON ?auto_764388 ?auto_764387 ) ( ON ?auto_764389 ?auto_764388 ) ( ON ?auto_764390 ?auto_764389 ) ( not ( = ?auto_764387 ?auto_764388 ) ) ( not ( = ?auto_764387 ?auto_764389 ) ) ( not ( = ?auto_764387 ?auto_764390 ) ) ( not ( = ?auto_764387 ?auto_764391 ) ) ( not ( = ?auto_764387 ?auto_764392 ) ) ( not ( = ?auto_764387 ?auto_764393 ) ) ( not ( = ?auto_764387 ?auto_764394 ) ) ( not ( = ?auto_764387 ?auto_764395 ) ) ( not ( = ?auto_764387 ?auto_764396 ) ) ( not ( = ?auto_764387 ?auto_764397 ) ) ( not ( = ?auto_764387 ?auto_764398 ) ) ( not ( = ?auto_764387 ?auto_764399 ) ) ( not ( = ?auto_764387 ?auto_764400 ) ) ( not ( = ?auto_764387 ?auto_764401 ) ) ( not ( = ?auto_764387 ?auto_764402 ) ) ( not ( = ?auto_764387 ?auto_764403 ) ) ( not ( = ?auto_764387 ?auto_764404 ) ) ( not ( = ?auto_764388 ?auto_764389 ) ) ( not ( = ?auto_764388 ?auto_764390 ) ) ( not ( = ?auto_764388 ?auto_764391 ) ) ( not ( = ?auto_764388 ?auto_764392 ) ) ( not ( = ?auto_764388 ?auto_764393 ) ) ( not ( = ?auto_764388 ?auto_764394 ) ) ( not ( = ?auto_764388 ?auto_764395 ) ) ( not ( = ?auto_764388 ?auto_764396 ) ) ( not ( = ?auto_764388 ?auto_764397 ) ) ( not ( = ?auto_764388 ?auto_764398 ) ) ( not ( = ?auto_764388 ?auto_764399 ) ) ( not ( = ?auto_764388 ?auto_764400 ) ) ( not ( = ?auto_764388 ?auto_764401 ) ) ( not ( = ?auto_764388 ?auto_764402 ) ) ( not ( = ?auto_764388 ?auto_764403 ) ) ( not ( = ?auto_764388 ?auto_764404 ) ) ( not ( = ?auto_764389 ?auto_764390 ) ) ( not ( = ?auto_764389 ?auto_764391 ) ) ( not ( = ?auto_764389 ?auto_764392 ) ) ( not ( = ?auto_764389 ?auto_764393 ) ) ( not ( = ?auto_764389 ?auto_764394 ) ) ( not ( = ?auto_764389 ?auto_764395 ) ) ( not ( = ?auto_764389 ?auto_764396 ) ) ( not ( = ?auto_764389 ?auto_764397 ) ) ( not ( = ?auto_764389 ?auto_764398 ) ) ( not ( = ?auto_764389 ?auto_764399 ) ) ( not ( = ?auto_764389 ?auto_764400 ) ) ( not ( = ?auto_764389 ?auto_764401 ) ) ( not ( = ?auto_764389 ?auto_764402 ) ) ( not ( = ?auto_764389 ?auto_764403 ) ) ( not ( = ?auto_764389 ?auto_764404 ) ) ( not ( = ?auto_764390 ?auto_764391 ) ) ( not ( = ?auto_764390 ?auto_764392 ) ) ( not ( = ?auto_764390 ?auto_764393 ) ) ( not ( = ?auto_764390 ?auto_764394 ) ) ( not ( = ?auto_764390 ?auto_764395 ) ) ( not ( = ?auto_764390 ?auto_764396 ) ) ( not ( = ?auto_764390 ?auto_764397 ) ) ( not ( = ?auto_764390 ?auto_764398 ) ) ( not ( = ?auto_764390 ?auto_764399 ) ) ( not ( = ?auto_764390 ?auto_764400 ) ) ( not ( = ?auto_764390 ?auto_764401 ) ) ( not ( = ?auto_764390 ?auto_764402 ) ) ( not ( = ?auto_764390 ?auto_764403 ) ) ( not ( = ?auto_764390 ?auto_764404 ) ) ( not ( = ?auto_764391 ?auto_764392 ) ) ( not ( = ?auto_764391 ?auto_764393 ) ) ( not ( = ?auto_764391 ?auto_764394 ) ) ( not ( = ?auto_764391 ?auto_764395 ) ) ( not ( = ?auto_764391 ?auto_764396 ) ) ( not ( = ?auto_764391 ?auto_764397 ) ) ( not ( = ?auto_764391 ?auto_764398 ) ) ( not ( = ?auto_764391 ?auto_764399 ) ) ( not ( = ?auto_764391 ?auto_764400 ) ) ( not ( = ?auto_764391 ?auto_764401 ) ) ( not ( = ?auto_764391 ?auto_764402 ) ) ( not ( = ?auto_764391 ?auto_764403 ) ) ( not ( = ?auto_764391 ?auto_764404 ) ) ( not ( = ?auto_764392 ?auto_764393 ) ) ( not ( = ?auto_764392 ?auto_764394 ) ) ( not ( = ?auto_764392 ?auto_764395 ) ) ( not ( = ?auto_764392 ?auto_764396 ) ) ( not ( = ?auto_764392 ?auto_764397 ) ) ( not ( = ?auto_764392 ?auto_764398 ) ) ( not ( = ?auto_764392 ?auto_764399 ) ) ( not ( = ?auto_764392 ?auto_764400 ) ) ( not ( = ?auto_764392 ?auto_764401 ) ) ( not ( = ?auto_764392 ?auto_764402 ) ) ( not ( = ?auto_764392 ?auto_764403 ) ) ( not ( = ?auto_764392 ?auto_764404 ) ) ( not ( = ?auto_764393 ?auto_764394 ) ) ( not ( = ?auto_764393 ?auto_764395 ) ) ( not ( = ?auto_764393 ?auto_764396 ) ) ( not ( = ?auto_764393 ?auto_764397 ) ) ( not ( = ?auto_764393 ?auto_764398 ) ) ( not ( = ?auto_764393 ?auto_764399 ) ) ( not ( = ?auto_764393 ?auto_764400 ) ) ( not ( = ?auto_764393 ?auto_764401 ) ) ( not ( = ?auto_764393 ?auto_764402 ) ) ( not ( = ?auto_764393 ?auto_764403 ) ) ( not ( = ?auto_764393 ?auto_764404 ) ) ( not ( = ?auto_764394 ?auto_764395 ) ) ( not ( = ?auto_764394 ?auto_764396 ) ) ( not ( = ?auto_764394 ?auto_764397 ) ) ( not ( = ?auto_764394 ?auto_764398 ) ) ( not ( = ?auto_764394 ?auto_764399 ) ) ( not ( = ?auto_764394 ?auto_764400 ) ) ( not ( = ?auto_764394 ?auto_764401 ) ) ( not ( = ?auto_764394 ?auto_764402 ) ) ( not ( = ?auto_764394 ?auto_764403 ) ) ( not ( = ?auto_764394 ?auto_764404 ) ) ( not ( = ?auto_764395 ?auto_764396 ) ) ( not ( = ?auto_764395 ?auto_764397 ) ) ( not ( = ?auto_764395 ?auto_764398 ) ) ( not ( = ?auto_764395 ?auto_764399 ) ) ( not ( = ?auto_764395 ?auto_764400 ) ) ( not ( = ?auto_764395 ?auto_764401 ) ) ( not ( = ?auto_764395 ?auto_764402 ) ) ( not ( = ?auto_764395 ?auto_764403 ) ) ( not ( = ?auto_764395 ?auto_764404 ) ) ( not ( = ?auto_764396 ?auto_764397 ) ) ( not ( = ?auto_764396 ?auto_764398 ) ) ( not ( = ?auto_764396 ?auto_764399 ) ) ( not ( = ?auto_764396 ?auto_764400 ) ) ( not ( = ?auto_764396 ?auto_764401 ) ) ( not ( = ?auto_764396 ?auto_764402 ) ) ( not ( = ?auto_764396 ?auto_764403 ) ) ( not ( = ?auto_764396 ?auto_764404 ) ) ( not ( = ?auto_764397 ?auto_764398 ) ) ( not ( = ?auto_764397 ?auto_764399 ) ) ( not ( = ?auto_764397 ?auto_764400 ) ) ( not ( = ?auto_764397 ?auto_764401 ) ) ( not ( = ?auto_764397 ?auto_764402 ) ) ( not ( = ?auto_764397 ?auto_764403 ) ) ( not ( = ?auto_764397 ?auto_764404 ) ) ( not ( = ?auto_764398 ?auto_764399 ) ) ( not ( = ?auto_764398 ?auto_764400 ) ) ( not ( = ?auto_764398 ?auto_764401 ) ) ( not ( = ?auto_764398 ?auto_764402 ) ) ( not ( = ?auto_764398 ?auto_764403 ) ) ( not ( = ?auto_764398 ?auto_764404 ) ) ( not ( = ?auto_764399 ?auto_764400 ) ) ( not ( = ?auto_764399 ?auto_764401 ) ) ( not ( = ?auto_764399 ?auto_764402 ) ) ( not ( = ?auto_764399 ?auto_764403 ) ) ( not ( = ?auto_764399 ?auto_764404 ) ) ( not ( = ?auto_764400 ?auto_764401 ) ) ( not ( = ?auto_764400 ?auto_764402 ) ) ( not ( = ?auto_764400 ?auto_764403 ) ) ( not ( = ?auto_764400 ?auto_764404 ) ) ( not ( = ?auto_764401 ?auto_764402 ) ) ( not ( = ?auto_764401 ?auto_764403 ) ) ( not ( = ?auto_764401 ?auto_764404 ) ) ( not ( = ?auto_764402 ?auto_764403 ) ) ( not ( = ?auto_764402 ?auto_764404 ) ) ( not ( = ?auto_764403 ?auto_764404 ) ) ( ON ?auto_764402 ?auto_764403 ) ( ON ?auto_764401 ?auto_764402 ) ( ON ?auto_764400 ?auto_764401 ) ( ON ?auto_764399 ?auto_764400 ) ( ON ?auto_764398 ?auto_764399 ) ( ON ?auto_764397 ?auto_764398 ) ( ON ?auto_764396 ?auto_764397 ) ( ON ?auto_764395 ?auto_764396 ) ( ON ?auto_764394 ?auto_764395 ) ( ON ?auto_764393 ?auto_764394 ) ( ON ?auto_764392 ?auto_764393 ) ( CLEAR ?auto_764390 ) ( ON ?auto_764391 ?auto_764392 ) ( CLEAR ?auto_764391 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_764387 ?auto_764388 ?auto_764389 ?auto_764390 ?auto_764391 )
      ( MAKE-17PILE ?auto_764387 ?auto_764388 ?auto_764389 ?auto_764390 ?auto_764391 ?auto_764392 ?auto_764393 ?auto_764394 ?auto_764395 ?auto_764396 ?auto_764397 ?auto_764398 ?auto_764399 ?auto_764400 ?auto_764401 ?auto_764402 ?auto_764403 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_764457 - BLOCK
      ?auto_764458 - BLOCK
      ?auto_764459 - BLOCK
      ?auto_764460 - BLOCK
      ?auto_764461 - BLOCK
      ?auto_764462 - BLOCK
      ?auto_764463 - BLOCK
      ?auto_764464 - BLOCK
      ?auto_764465 - BLOCK
      ?auto_764466 - BLOCK
      ?auto_764467 - BLOCK
      ?auto_764468 - BLOCK
      ?auto_764469 - BLOCK
      ?auto_764470 - BLOCK
      ?auto_764471 - BLOCK
      ?auto_764472 - BLOCK
      ?auto_764473 - BLOCK
    )
    :vars
    (
      ?auto_764474 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_764473 ?auto_764474 ) ( ON-TABLE ?auto_764457 ) ( ON ?auto_764458 ?auto_764457 ) ( ON ?auto_764459 ?auto_764458 ) ( not ( = ?auto_764457 ?auto_764458 ) ) ( not ( = ?auto_764457 ?auto_764459 ) ) ( not ( = ?auto_764457 ?auto_764460 ) ) ( not ( = ?auto_764457 ?auto_764461 ) ) ( not ( = ?auto_764457 ?auto_764462 ) ) ( not ( = ?auto_764457 ?auto_764463 ) ) ( not ( = ?auto_764457 ?auto_764464 ) ) ( not ( = ?auto_764457 ?auto_764465 ) ) ( not ( = ?auto_764457 ?auto_764466 ) ) ( not ( = ?auto_764457 ?auto_764467 ) ) ( not ( = ?auto_764457 ?auto_764468 ) ) ( not ( = ?auto_764457 ?auto_764469 ) ) ( not ( = ?auto_764457 ?auto_764470 ) ) ( not ( = ?auto_764457 ?auto_764471 ) ) ( not ( = ?auto_764457 ?auto_764472 ) ) ( not ( = ?auto_764457 ?auto_764473 ) ) ( not ( = ?auto_764457 ?auto_764474 ) ) ( not ( = ?auto_764458 ?auto_764459 ) ) ( not ( = ?auto_764458 ?auto_764460 ) ) ( not ( = ?auto_764458 ?auto_764461 ) ) ( not ( = ?auto_764458 ?auto_764462 ) ) ( not ( = ?auto_764458 ?auto_764463 ) ) ( not ( = ?auto_764458 ?auto_764464 ) ) ( not ( = ?auto_764458 ?auto_764465 ) ) ( not ( = ?auto_764458 ?auto_764466 ) ) ( not ( = ?auto_764458 ?auto_764467 ) ) ( not ( = ?auto_764458 ?auto_764468 ) ) ( not ( = ?auto_764458 ?auto_764469 ) ) ( not ( = ?auto_764458 ?auto_764470 ) ) ( not ( = ?auto_764458 ?auto_764471 ) ) ( not ( = ?auto_764458 ?auto_764472 ) ) ( not ( = ?auto_764458 ?auto_764473 ) ) ( not ( = ?auto_764458 ?auto_764474 ) ) ( not ( = ?auto_764459 ?auto_764460 ) ) ( not ( = ?auto_764459 ?auto_764461 ) ) ( not ( = ?auto_764459 ?auto_764462 ) ) ( not ( = ?auto_764459 ?auto_764463 ) ) ( not ( = ?auto_764459 ?auto_764464 ) ) ( not ( = ?auto_764459 ?auto_764465 ) ) ( not ( = ?auto_764459 ?auto_764466 ) ) ( not ( = ?auto_764459 ?auto_764467 ) ) ( not ( = ?auto_764459 ?auto_764468 ) ) ( not ( = ?auto_764459 ?auto_764469 ) ) ( not ( = ?auto_764459 ?auto_764470 ) ) ( not ( = ?auto_764459 ?auto_764471 ) ) ( not ( = ?auto_764459 ?auto_764472 ) ) ( not ( = ?auto_764459 ?auto_764473 ) ) ( not ( = ?auto_764459 ?auto_764474 ) ) ( not ( = ?auto_764460 ?auto_764461 ) ) ( not ( = ?auto_764460 ?auto_764462 ) ) ( not ( = ?auto_764460 ?auto_764463 ) ) ( not ( = ?auto_764460 ?auto_764464 ) ) ( not ( = ?auto_764460 ?auto_764465 ) ) ( not ( = ?auto_764460 ?auto_764466 ) ) ( not ( = ?auto_764460 ?auto_764467 ) ) ( not ( = ?auto_764460 ?auto_764468 ) ) ( not ( = ?auto_764460 ?auto_764469 ) ) ( not ( = ?auto_764460 ?auto_764470 ) ) ( not ( = ?auto_764460 ?auto_764471 ) ) ( not ( = ?auto_764460 ?auto_764472 ) ) ( not ( = ?auto_764460 ?auto_764473 ) ) ( not ( = ?auto_764460 ?auto_764474 ) ) ( not ( = ?auto_764461 ?auto_764462 ) ) ( not ( = ?auto_764461 ?auto_764463 ) ) ( not ( = ?auto_764461 ?auto_764464 ) ) ( not ( = ?auto_764461 ?auto_764465 ) ) ( not ( = ?auto_764461 ?auto_764466 ) ) ( not ( = ?auto_764461 ?auto_764467 ) ) ( not ( = ?auto_764461 ?auto_764468 ) ) ( not ( = ?auto_764461 ?auto_764469 ) ) ( not ( = ?auto_764461 ?auto_764470 ) ) ( not ( = ?auto_764461 ?auto_764471 ) ) ( not ( = ?auto_764461 ?auto_764472 ) ) ( not ( = ?auto_764461 ?auto_764473 ) ) ( not ( = ?auto_764461 ?auto_764474 ) ) ( not ( = ?auto_764462 ?auto_764463 ) ) ( not ( = ?auto_764462 ?auto_764464 ) ) ( not ( = ?auto_764462 ?auto_764465 ) ) ( not ( = ?auto_764462 ?auto_764466 ) ) ( not ( = ?auto_764462 ?auto_764467 ) ) ( not ( = ?auto_764462 ?auto_764468 ) ) ( not ( = ?auto_764462 ?auto_764469 ) ) ( not ( = ?auto_764462 ?auto_764470 ) ) ( not ( = ?auto_764462 ?auto_764471 ) ) ( not ( = ?auto_764462 ?auto_764472 ) ) ( not ( = ?auto_764462 ?auto_764473 ) ) ( not ( = ?auto_764462 ?auto_764474 ) ) ( not ( = ?auto_764463 ?auto_764464 ) ) ( not ( = ?auto_764463 ?auto_764465 ) ) ( not ( = ?auto_764463 ?auto_764466 ) ) ( not ( = ?auto_764463 ?auto_764467 ) ) ( not ( = ?auto_764463 ?auto_764468 ) ) ( not ( = ?auto_764463 ?auto_764469 ) ) ( not ( = ?auto_764463 ?auto_764470 ) ) ( not ( = ?auto_764463 ?auto_764471 ) ) ( not ( = ?auto_764463 ?auto_764472 ) ) ( not ( = ?auto_764463 ?auto_764473 ) ) ( not ( = ?auto_764463 ?auto_764474 ) ) ( not ( = ?auto_764464 ?auto_764465 ) ) ( not ( = ?auto_764464 ?auto_764466 ) ) ( not ( = ?auto_764464 ?auto_764467 ) ) ( not ( = ?auto_764464 ?auto_764468 ) ) ( not ( = ?auto_764464 ?auto_764469 ) ) ( not ( = ?auto_764464 ?auto_764470 ) ) ( not ( = ?auto_764464 ?auto_764471 ) ) ( not ( = ?auto_764464 ?auto_764472 ) ) ( not ( = ?auto_764464 ?auto_764473 ) ) ( not ( = ?auto_764464 ?auto_764474 ) ) ( not ( = ?auto_764465 ?auto_764466 ) ) ( not ( = ?auto_764465 ?auto_764467 ) ) ( not ( = ?auto_764465 ?auto_764468 ) ) ( not ( = ?auto_764465 ?auto_764469 ) ) ( not ( = ?auto_764465 ?auto_764470 ) ) ( not ( = ?auto_764465 ?auto_764471 ) ) ( not ( = ?auto_764465 ?auto_764472 ) ) ( not ( = ?auto_764465 ?auto_764473 ) ) ( not ( = ?auto_764465 ?auto_764474 ) ) ( not ( = ?auto_764466 ?auto_764467 ) ) ( not ( = ?auto_764466 ?auto_764468 ) ) ( not ( = ?auto_764466 ?auto_764469 ) ) ( not ( = ?auto_764466 ?auto_764470 ) ) ( not ( = ?auto_764466 ?auto_764471 ) ) ( not ( = ?auto_764466 ?auto_764472 ) ) ( not ( = ?auto_764466 ?auto_764473 ) ) ( not ( = ?auto_764466 ?auto_764474 ) ) ( not ( = ?auto_764467 ?auto_764468 ) ) ( not ( = ?auto_764467 ?auto_764469 ) ) ( not ( = ?auto_764467 ?auto_764470 ) ) ( not ( = ?auto_764467 ?auto_764471 ) ) ( not ( = ?auto_764467 ?auto_764472 ) ) ( not ( = ?auto_764467 ?auto_764473 ) ) ( not ( = ?auto_764467 ?auto_764474 ) ) ( not ( = ?auto_764468 ?auto_764469 ) ) ( not ( = ?auto_764468 ?auto_764470 ) ) ( not ( = ?auto_764468 ?auto_764471 ) ) ( not ( = ?auto_764468 ?auto_764472 ) ) ( not ( = ?auto_764468 ?auto_764473 ) ) ( not ( = ?auto_764468 ?auto_764474 ) ) ( not ( = ?auto_764469 ?auto_764470 ) ) ( not ( = ?auto_764469 ?auto_764471 ) ) ( not ( = ?auto_764469 ?auto_764472 ) ) ( not ( = ?auto_764469 ?auto_764473 ) ) ( not ( = ?auto_764469 ?auto_764474 ) ) ( not ( = ?auto_764470 ?auto_764471 ) ) ( not ( = ?auto_764470 ?auto_764472 ) ) ( not ( = ?auto_764470 ?auto_764473 ) ) ( not ( = ?auto_764470 ?auto_764474 ) ) ( not ( = ?auto_764471 ?auto_764472 ) ) ( not ( = ?auto_764471 ?auto_764473 ) ) ( not ( = ?auto_764471 ?auto_764474 ) ) ( not ( = ?auto_764472 ?auto_764473 ) ) ( not ( = ?auto_764472 ?auto_764474 ) ) ( not ( = ?auto_764473 ?auto_764474 ) ) ( ON ?auto_764472 ?auto_764473 ) ( ON ?auto_764471 ?auto_764472 ) ( ON ?auto_764470 ?auto_764471 ) ( ON ?auto_764469 ?auto_764470 ) ( ON ?auto_764468 ?auto_764469 ) ( ON ?auto_764467 ?auto_764468 ) ( ON ?auto_764466 ?auto_764467 ) ( ON ?auto_764465 ?auto_764466 ) ( ON ?auto_764464 ?auto_764465 ) ( ON ?auto_764463 ?auto_764464 ) ( ON ?auto_764462 ?auto_764463 ) ( ON ?auto_764461 ?auto_764462 ) ( CLEAR ?auto_764459 ) ( ON ?auto_764460 ?auto_764461 ) ( CLEAR ?auto_764460 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_764457 ?auto_764458 ?auto_764459 ?auto_764460 )
      ( MAKE-17PILE ?auto_764457 ?auto_764458 ?auto_764459 ?auto_764460 ?auto_764461 ?auto_764462 ?auto_764463 ?auto_764464 ?auto_764465 ?auto_764466 ?auto_764467 ?auto_764468 ?auto_764469 ?auto_764470 ?auto_764471 ?auto_764472 ?auto_764473 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_764527 - BLOCK
      ?auto_764528 - BLOCK
      ?auto_764529 - BLOCK
      ?auto_764530 - BLOCK
      ?auto_764531 - BLOCK
      ?auto_764532 - BLOCK
      ?auto_764533 - BLOCK
      ?auto_764534 - BLOCK
      ?auto_764535 - BLOCK
      ?auto_764536 - BLOCK
      ?auto_764537 - BLOCK
      ?auto_764538 - BLOCK
      ?auto_764539 - BLOCK
      ?auto_764540 - BLOCK
      ?auto_764541 - BLOCK
      ?auto_764542 - BLOCK
      ?auto_764543 - BLOCK
    )
    :vars
    (
      ?auto_764544 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_764543 ?auto_764544 ) ( ON-TABLE ?auto_764527 ) ( ON ?auto_764528 ?auto_764527 ) ( not ( = ?auto_764527 ?auto_764528 ) ) ( not ( = ?auto_764527 ?auto_764529 ) ) ( not ( = ?auto_764527 ?auto_764530 ) ) ( not ( = ?auto_764527 ?auto_764531 ) ) ( not ( = ?auto_764527 ?auto_764532 ) ) ( not ( = ?auto_764527 ?auto_764533 ) ) ( not ( = ?auto_764527 ?auto_764534 ) ) ( not ( = ?auto_764527 ?auto_764535 ) ) ( not ( = ?auto_764527 ?auto_764536 ) ) ( not ( = ?auto_764527 ?auto_764537 ) ) ( not ( = ?auto_764527 ?auto_764538 ) ) ( not ( = ?auto_764527 ?auto_764539 ) ) ( not ( = ?auto_764527 ?auto_764540 ) ) ( not ( = ?auto_764527 ?auto_764541 ) ) ( not ( = ?auto_764527 ?auto_764542 ) ) ( not ( = ?auto_764527 ?auto_764543 ) ) ( not ( = ?auto_764527 ?auto_764544 ) ) ( not ( = ?auto_764528 ?auto_764529 ) ) ( not ( = ?auto_764528 ?auto_764530 ) ) ( not ( = ?auto_764528 ?auto_764531 ) ) ( not ( = ?auto_764528 ?auto_764532 ) ) ( not ( = ?auto_764528 ?auto_764533 ) ) ( not ( = ?auto_764528 ?auto_764534 ) ) ( not ( = ?auto_764528 ?auto_764535 ) ) ( not ( = ?auto_764528 ?auto_764536 ) ) ( not ( = ?auto_764528 ?auto_764537 ) ) ( not ( = ?auto_764528 ?auto_764538 ) ) ( not ( = ?auto_764528 ?auto_764539 ) ) ( not ( = ?auto_764528 ?auto_764540 ) ) ( not ( = ?auto_764528 ?auto_764541 ) ) ( not ( = ?auto_764528 ?auto_764542 ) ) ( not ( = ?auto_764528 ?auto_764543 ) ) ( not ( = ?auto_764528 ?auto_764544 ) ) ( not ( = ?auto_764529 ?auto_764530 ) ) ( not ( = ?auto_764529 ?auto_764531 ) ) ( not ( = ?auto_764529 ?auto_764532 ) ) ( not ( = ?auto_764529 ?auto_764533 ) ) ( not ( = ?auto_764529 ?auto_764534 ) ) ( not ( = ?auto_764529 ?auto_764535 ) ) ( not ( = ?auto_764529 ?auto_764536 ) ) ( not ( = ?auto_764529 ?auto_764537 ) ) ( not ( = ?auto_764529 ?auto_764538 ) ) ( not ( = ?auto_764529 ?auto_764539 ) ) ( not ( = ?auto_764529 ?auto_764540 ) ) ( not ( = ?auto_764529 ?auto_764541 ) ) ( not ( = ?auto_764529 ?auto_764542 ) ) ( not ( = ?auto_764529 ?auto_764543 ) ) ( not ( = ?auto_764529 ?auto_764544 ) ) ( not ( = ?auto_764530 ?auto_764531 ) ) ( not ( = ?auto_764530 ?auto_764532 ) ) ( not ( = ?auto_764530 ?auto_764533 ) ) ( not ( = ?auto_764530 ?auto_764534 ) ) ( not ( = ?auto_764530 ?auto_764535 ) ) ( not ( = ?auto_764530 ?auto_764536 ) ) ( not ( = ?auto_764530 ?auto_764537 ) ) ( not ( = ?auto_764530 ?auto_764538 ) ) ( not ( = ?auto_764530 ?auto_764539 ) ) ( not ( = ?auto_764530 ?auto_764540 ) ) ( not ( = ?auto_764530 ?auto_764541 ) ) ( not ( = ?auto_764530 ?auto_764542 ) ) ( not ( = ?auto_764530 ?auto_764543 ) ) ( not ( = ?auto_764530 ?auto_764544 ) ) ( not ( = ?auto_764531 ?auto_764532 ) ) ( not ( = ?auto_764531 ?auto_764533 ) ) ( not ( = ?auto_764531 ?auto_764534 ) ) ( not ( = ?auto_764531 ?auto_764535 ) ) ( not ( = ?auto_764531 ?auto_764536 ) ) ( not ( = ?auto_764531 ?auto_764537 ) ) ( not ( = ?auto_764531 ?auto_764538 ) ) ( not ( = ?auto_764531 ?auto_764539 ) ) ( not ( = ?auto_764531 ?auto_764540 ) ) ( not ( = ?auto_764531 ?auto_764541 ) ) ( not ( = ?auto_764531 ?auto_764542 ) ) ( not ( = ?auto_764531 ?auto_764543 ) ) ( not ( = ?auto_764531 ?auto_764544 ) ) ( not ( = ?auto_764532 ?auto_764533 ) ) ( not ( = ?auto_764532 ?auto_764534 ) ) ( not ( = ?auto_764532 ?auto_764535 ) ) ( not ( = ?auto_764532 ?auto_764536 ) ) ( not ( = ?auto_764532 ?auto_764537 ) ) ( not ( = ?auto_764532 ?auto_764538 ) ) ( not ( = ?auto_764532 ?auto_764539 ) ) ( not ( = ?auto_764532 ?auto_764540 ) ) ( not ( = ?auto_764532 ?auto_764541 ) ) ( not ( = ?auto_764532 ?auto_764542 ) ) ( not ( = ?auto_764532 ?auto_764543 ) ) ( not ( = ?auto_764532 ?auto_764544 ) ) ( not ( = ?auto_764533 ?auto_764534 ) ) ( not ( = ?auto_764533 ?auto_764535 ) ) ( not ( = ?auto_764533 ?auto_764536 ) ) ( not ( = ?auto_764533 ?auto_764537 ) ) ( not ( = ?auto_764533 ?auto_764538 ) ) ( not ( = ?auto_764533 ?auto_764539 ) ) ( not ( = ?auto_764533 ?auto_764540 ) ) ( not ( = ?auto_764533 ?auto_764541 ) ) ( not ( = ?auto_764533 ?auto_764542 ) ) ( not ( = ?auto_764533 ?auto_764543 ) ) ( not ( = ?auto_764533 ?auto_764544 ) ) ( not ( = ?auto_764534 ?auto_764535 ) ) ( not ( = ?auto_764534 ?auto_764536 ) ) ( not ( = ?auto_764534 ?auto_764537 ) ) ( not ( = ?auto_764534 ?auto_764538 ) ) ( not ( = ?auto_764534 ?auto_764539 ) ) ( not ( = ?auto_764534 ?auto_764540 ) ) ( not ( = ?auto_764534 ?auto_764541 ) ) ( not ( = ?auto_764534 ?auto_764542 ) ) ( not ( = ?auto_764534 ?auto_764543 ) ) ( not ( = ?auto_764534 ?auto_764544 ) ) ( not ( = ?auto_764535 ?auto_764536 ) ) ( not ( = ?auto_764535 ?auto_764537 ) ) ( not ( = ?auto_764535 ?auto_764538 ) ) ( not ( = ?auto_764535 ?auto_764539 ) ) ( not ( = ?auto_764535 ?auto_764540 ) ) ( not ( = ?auto_764535 ?auto_764541 ) ) ( not ( = ?auto_764535 ?auto_764542 ) ) ( not ( = ?auto_764535 ?auto_764543 ) ) ( not ( = ?auto_764535 ?auto_764544 ) ) ( not ( = ?auto_764536 ?auto_764537 ) ) ( not ( = ?auto_764536 ?auto_764538 ) ) ( not ( = ?auto_764536 ?auto_764539 ) ) ( not ( = ?auto_764536 ?auto_764540 ) ) ( not ( = ?auto_764536 ?auto_764541 ) ) ( not ( = ?auto_764536 ?auto_764542 ) ) ( not ( = ?auto_764536 ?auto_764543 ) ) ( not ( = ?auto_764536 ?auto_764544 ) ) ( not ( = ?auto_764537 ?auto_764538 ) ) ( not ( = ?auto_764537 ?auto_764539 ) ) ( not ( = ?auto_764537 ?auto_764540 ) ) ( not ( = ?auto_764537 ?auto_764541 ) ) ( not ( = ?auto_764537 ?auto_764542 ) ) ( not ( = ?auto_764537 ?auto_764543 ) ) ( not ( = ?auto_764537 ?auto_764544 ) ) ( not ( = ?auto_764538 ?auto_764539 ) ) ( not ( = ?auto_764538 ?auto_764540 ) ) ( not ( = ?auto_764538 ?auto_764541 ) ) ( not ( = ?auto_764538 ?auto_764542 ) ) ( not ( = ?auto_764538 ?auto_764543 ) ) ( not ( = ?auto_764538 ?auto_764544 ) ) ( not ( = ?auto_764539 ?auto_764540 ) ) ( not ( = ?auto_764539 ?auto_764541 ) ) ( not ( = ?auto_764539 ?auto_764542 ) ) ( not ( = ?auto_764539 ?auto_764543 ) ) ( not ( = ?auto_764539 ?auto_764544 ) ) ( not ( = ?auto_764540 ?auto_764541 ) ) ( not ( = ?auto_764540 ?auto_764542 ) ) ( not ( = ?auto_764540 ?auto_764543 ) ) ( not ( = ?auto_764540 ?auto_764544 ) ) ( not ( = ?auto_764541 ?auto_764542 ) ) ( not ( = ?auto_764541 ?auto_764543 ) ) ( not ( = ?auto_764541 ?auto_764544 ) ) ( not ( = ?auto_764542 ?auto_764543 ) ) ( not ( = ?auto_764542 ?auto_764544 ) ) ( not ( = ?auto_764543 ?auto_764544 ) ) ( ON ?auto_764542 ?auto_764543 ) ( ON ?auto_764541 ?auto_764542 ) ( ON ?auto_764540 ?auto_764541 ) ( ON ?auto_764539 ?auto_764540 ) ( ON ?auto_764538 ?auto_764539 ) ( ON ?auto_764537 ?auto_764538 ) ( ON ?auto_764536 ?auto_764537 ) ( ON ?auto_764535 ?auto_764536 ) ( ON ?auto_764534 ?auto_764535 ) ( ON ?auto_764533 ?auto_764534 ) ( ON ?auto_764532 ?auto_764533 ) ( ON ?auto_764531 ?auto_764532 ) ( ON ?auto_764530 ?auto_764531 ) ( CLEAR ?auto_764528 ) ( ON ?auto_764529 ?auto_764530 ) ( CLEAR ?auto_764529 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_764527 ?auto_764528 ?auto_764529 )
      ( MAKE-17PILE ?auto_764527 ?auto_764528 ?auto_764529 ?auto_764530 ?auto_764531 ?auto_764532 ?auto_764533 ?auto_764534 ?auto_764535 ?auto_764536 ?auto_764537 ?auto_764538 ?auto_764539 ?auto_764540 ?auto_764541 ?auto_764542 ?auto_764543 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_764597 - BLOCK
      ?auto_764598 - BLOCK
      ?auto_764599 - BLOCK
      ?auto_764600 - BLOCK
      ?auto_764601 - BLOCK
      ?auto_764602 - BLOCK
      ?auto_764603 - BLOCK
      ?auto_764604 - BLOCK
      ?auto_764605 - BLOCK
      ?auto_764606 - BLOCK
      ?auto_764607 - BLOCK
      ?auto_764608 - BLOCK
      ?auto_764609 - BLOCK
      ?auto_764610 - BLOCK
      ?auto_764611 - BLOCK
      ?auto_764612 - BLOCK
      ?auto_764613 - BLOCK
    )
    :vars
    (
      ?auto_764614 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_764613 ?auto_764614 ) ( ON-TABLE ?auto_764597 ) ( not ( = ?auto_764597 ?auto_764598 ) ) ( not ( = ?auto_764597 ?auto_764599 ) ) ( not ( = ?auto_764597 ?auto_764600 ) ) ( not ( = ?auto_764597 ?auto_764601 ) ) ( not ( = ?auto_764597 ?auto_764602 ) ) ( not ( = ?auto_764597 ?auto_764603 ) ) ( not ( = ?auto_764597 ?auto_764604 ) ) ( not ( = ?auto_764597 ?auto_764605 ) ) ( not ( = ?auto_764597 ?auto_764606 ) ) ( not ( = ?auto_764597 ?auto_764607 ) ) ( not ( = ?auto_764597 ?auto_764608 ) ) ( not ( = ?auto_764597 ?auto_764609 ) ) ( not ( = ?auto_764597 ?auto_764610 ) ) ( not ( = ?auto_764597 ?auto_764611 ) ) ( not ( = ?auto_764597 ?auto_764612 ) ) ( not ( = ?auto_764597 ?auto_764613 ) ) ( not ( = ?auto_764597 ?auto_764614 ) ) ( not ( = ?auto_764598 ?auto_764599 ) ) ( not ( = ?auto_764598 ?auto_764600 ) ) ( not ( = ?auto_764598 ?auto_764601 ) ) ( not ( = ?auto_764598 ?auto_764602 ) ) ( not ( = ?auto_764598 ?auto_764603 ) ) ( not ( = ?auto_764598 ?auto_764604 ) ) ( not ( = ?auto_764598 ?auto_764605 ) ) ( not ( = ?auto_764598 ?auto_764606 ) ) ( not ( = ?auto_764598 ?auto_764607 ) ) ( not ( = ?auto_764598 ?auto_764608 ) ) ( not ( = ?auto_764598 ?auto_764609 ) ) ( not ( = ?auto_764598 ?auto_764610 ) ) ( not ( = ?auto_764598 ?auto_764611 ) ) ( not ( = ?auto_764598 ?auto_764612 ) ) ( not ( = ?auto_764598 ?auto_764613 ) ) ( not ( = ?auto_764598 ?auto_764614 ) ) ( not ( = ?auto_764599 ?auto_764600 ) ) ( not ( = ?auto_764599 ?auto_764601 ) ) ( not ( = ?auto_764599 ?auto_764602 ) ) ( not ( = ?auto_764599 ?auto_764603 ) ) ( not ( = ?auto_764599 ?auto_764604 ) ) ( not ( = ?auto_764599 ?auto_764605 ) ) ( not ( = ?auto_764599 ?auto_764606 ) ) ( not ( = ?auto_764599 ?auto_764607 ) ) ( not ( = ?auto_764599 ?auto_764608 ) ) ( not ( = ?auto_764599 ?auto_764609 ) ) ( not ( = ?auto_764599 ?auto_764610 ) ) ( not ( = ?auto_764599 ?auto_764611 ) ) ( not ( = ?auto_764599 ?auto_764612 ) ) ( not ( = ?auto_764599 ?auto_764613 ) ) ( not ( = ?auto_764599 ?auto_764614 ) ) ( not ( = ?auto_764600 ?auto_764601 ) ) ( not ( = ?auto_764600 ?auto_764602 ) ) ( not ( = ?auto_764600 ?auto_764603 ) ) ( not ( = ?auto_764600 ?auto_764604 ) ) ( not ( = ?auto_764600 ?auto_764605 ) ) ( not ( = ?auto_764600 ?auto_764606 ) ) ( not ( = ?auto_764600 ?auto_764607 ) ) ( not ( = ?auto_764600 ?auto_764608 ) ) ( not ( = ?auto_764600 ?auto_764609 ) ) ( not ( = ?auto_764600 ?auto_764610 ) ) ( not ( = ?auto_764600 ?auto_764611 ) ) ( not ( = ?auto_764600 ?auto_764612 ) ) ( not ( = ?auto_764600 ?auto_764613 ) ) ( not ( = ?auto_764600 ?auto_764614 ) ) ( not ( = ?auto_764601 ?auto_764602 ) ) ( not ( = ?auto_764601 ?auto_764603 ) ) ( not ( = ?auto_764601 ?auto_764604 ) ) ( not ( = ?auto_764601 ?auto_764605 ) ) ( not ( = ?auto_764601 ?auto_764606 ) ) ( not ( = ?auto_764601 ?auto_764607 ) ) ( not ( = ?auto_764601 ?auto_764608 ) ) ( not ( = ?auto_764601 ?auto_764609 ) ) ( not ( = ?auto_764601 ?auto_764610 ) ) ( not ( = ?auto_764601 ?auto_764611 ) ) ( not ( = ?auto_764601 ?auto_764612 ) ) ( not ( = ?auto_764601 ?auto_764613 ) ) ( not ( = ?auto_764601 ?auto_764614 ) ) ( not ( = ?auto_764602 ?auto_764603 ) ) ( not ( = ?auto_764602 ?auto_764604 ) ) ( not ( = ?auto_764602 ?auto_764605 ) ) ( not ( = ?auto_764602 ?auto_764606 ) ) ( not ( = ?auto_764602 ?auto_764607 ) ) ( not ( = ?auto_764602 ?auto_764608 ) ) ( not ( = ?auto_764602 ?auto_764609 ) ) ( not ( = ?auto_764602 ?auto_764610 ) ) ( not ( = ?auto_764602 ?auto_764611 ) ) ( not ( = ?auto_764602 ?auto_764612 ) ) ( not ( = ?auto_764602 ?auto_764613 ) ) ( not ( = ?auto_764602 ?auto_764614 ) ) ( not ( = ?auto_764603 ?auto_764604 ) ) ( not ( = ?auto_764603 ?auto_764605 ) ) ( not ( = ?auto_764603 ?auto_764606 ) ) ( not ( = ?auto_764603 ?auto_764607 ) ) ( not ( = ?auto_764603 ?auto_764608 ) ) ( not ( = ?auto_764603 ?auto_764609 ) ) ( not ( = ?auto_764603 ?auto_764610 ) ) ( not ( = ?auto_764603 ?auto_764611 ) ) ( not ( = ?auto_764603 ?auto_764612 ) ) ( not ( = ?auto_764603 ?auto_764613 ) ) ( not ( = ?auto_764603 ?auto_764614 ) ) ( not ( = ?auto_764604 ?auto_764605 ) ) ( not ( = ?auto_764604 ?auto_764606 ) ) ( not ( = ?auto_764604 ?auto_764607 ) ) ( not ( = ?auto_764604 ?auto_764608 ) ) ( not ( = ?auto_764604 ?auto_764609 ) ) ( not ( = ?auto_764604 ?auto_764610 ) ) ( not ( = ?auto_764604 ?auto_764611 ) ) ( not ( = ?auto_764604 ?auto_764612 ) ) ( not ( = ?auto_764604 ?auto_764613 ) ) ( not ( = ?auto_764604 ?auto_764614 ) ) ( not ( = ?auto_764605 ?auto_764606 ) ) ( not ( = ?auto_764605 ?auto_764607 ) ) ( not ( = ?auto_764605 ?auto_764608 ) ) ( not ( = ?auto_764605 ?auto_764609 ) ) ( not ( = ?auto_764605 ?auto_764610 ) ) ( not ( = ?auto_764605 ?auto_764611 ) ) ( not ( = ?auto_764605 ?auto_764612 ) ) ( not ( = ?auto_764605 ?auto_764613 ) ) ( not ( = ?auto_764605 ?auto_764614 ) ) ( not ( = ?auto_764606 ?auto_764607 ) ) ( not ( = ?auto_764606 ?auto_764608 ) ) ( not ( = ?auto_764606 ?auto_764609 ) ) ( not ( = ?auto_764606 ?auto_764610 ) ) ( not ( = ?auto_764606 ?auto_764611 ) ) ( not ( = ?auto_764606 ?auto_764612 ) ) ( not ( = ?auto_764606 ?auto_764613 ) ) ( not ( = ?auto_764606 ?auto_764614 ) ) ( not ( = ?auto_764607 ?auto_764608 ) ) ( not ( = ?auto_764607 ?auto_764609 ) ) ( not ( = ?auto_764607 ?auto_764610 ) ) ( not ( = ?auto_764607 ?auto_764611 ) ) ( not ( = ?auto_764607 ?auto_764612 ) ) ( not ( = ?auto_764607 ?auto_764613 ) ) ( not ( = ?auto_764607 ?auto_764614 ) ) ( not ( = ?auto_764608 ?auto_764609 ) ) ( not ( = ?auto_764608 ?auto_764610 ) ) ( not ( = ?auto_764608 ?auto_764611 ) ) ( not ( = ?auto_764608 ?auto_764612 ) ) ( not ( = ?auto_764608 ?auto_764613 ) ) ( not ( = ?auto_764608 ?auto_764614 ) ) ( not ( = ?auto_764609 ?auto_764610 ) ) ( not ( = ?auto_764609 ?auto_764611 ) ) ( not ( = ?auto_764609 ?auto_764612 ) ) ( not ( = ?auto_764609 ?auto_764613 ) ) ( not ( = ?auto_764609 ?auto_764614 ) ) ( not ( = ?auto_764610 ?auto_764611 ) ) ( not ( = ?auto_764610 ?auto_764612 ) ) ( not ( = ?auto_764610 ?auto_764613 ) ) ( not ( = ?auto_764610 ?auto_764614 ) ) ( not ( = ?auto_764611 ?auto_764612 ) ) ( not ( = ?auto_764611 ?auto_764613 ) ) ( not ( = ?auto_764611 ?auto_764614 ) ) ( not ( = ?auto_764612 ?auto_764613 ) ) ( not ( = ?auto_764612 ?auto_764614 ) ) ( not ( = ?auto_764613 ?auto_764614 ) ) ( ON ?auto_764612 ?auto_764613 ) ( ON ?auto_764611 ?auto_764612 ) ( ON ?auto_764610 ?auto_764611 ) ( ON ?auto_764609 ?auto_764610 ) ( ON ?auto_764608 ?auto_764609 ) ( ON ?auto_764607 ?auto_764608 ) ( ON ?auto_764606 ?auto_764607 ) ( ON ?auto_764605 ?auto_764606 ) ( ON ?auto_764604 ?auto_764605 ) ( ON ?auto_764603 ?auto_764604 ) ( ON ?auto_764602 ?auto_764603 ) ( ON ?auto_764601 ?auto_764602 ) ( ON ?auto_764600 ?auto_764601 ) ( ON ?auto_764599 ?auto_764600 ) ( CLEAR ?auto_764597 ) ( ON ?auto_764598 ?auto_764599 ) ( CLEAR ?auto_764598 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_764597 ?auto_764598 )
      ( MAKE-17PILE ?auto_764597 ?auto_764598 ?auto_764599 ?auto_764600 ?auto_764601 ?auto_764602 ?auto_764603 ?auto_764604 ?auto_764605 ?auto_764606 ?auto_764607 ?auto_764608 ?auto_764609 ?auto_764610 ?auto_764611 ?auto_764612 ?auto_764613 ) )
  )

  ( :method MAKE-17PILE
    :parameters
    (
      ?auto_764667 - BLOCK
      ?auto_764668 - BLOCK
      ?auto_764669 - BLOCK
      ?auto_764670 - BLOCK
      ?auto_764671 - BLOCK
      ?auto_764672 - BLOCK
      ?auto_764673 - BLOCK
      ?auto_764674 - BLOCK
      ?auto_764675 - BLOCK
      ?auto_764676 - BLOCK
      ?auto_764677 - BLOCK
      ?auto_764678 - BLOCK
      ?auto_764679 - BLOCK
      ?auto_764680 - BLOCK
      ?auto_764681 - BLOCK
      ?auto_764682 - BLOCK
      ?auto_764683 - BLOCK
    )
    :vars
    (
      ?auto_764684 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_764683 ?auto_764684 ) ( not ( = ?auto_764667 ?auto_764668 ) ) ( not ( = ?auto_764667 ?auto_764669 ) ) ( not ( = ?auto_764667 ?auto_764670 ) ) ( not ( = ?auto_764667 ?auto_764671 ) ) ( not ( = ?auto_764667 ?auto_764672 ) ) ( not ( = ?auto_764667 ?auto_764673 ) ) ( not ( = ?auto_764667 ?auto_764674 ) ) ( not ( = ?auto_764667 ?auto_764675 ) ) ( not ( = ?auto_764667 ?auto_764676 ) ) ( not ( = ?auto_764667 ?auto_764677 ) ) ( not ( = ?auto_764667 ?auto_764678 ) ) ( not ( = ?auto_764667 ?auto_764679 ) ) ( not ( = ?auto_764667 ?auto_764680 ) ) ( not ( = ?auto_764667 ?auto_764681 ) ) ( not ( = ?auto_764667 ?auto_764682 ) ) ( not ( = ?auto_764667 ?auto_764683 ) ) ( not ( = ?auto_764667 ?auto_764684 ) ) ( not ( = ?auto_764668 ?auto_764669 ) ) ( not ( = ?auto_764668 ?auto_764670 ) ) ( not ( = ?auto_764668 ?auto_764671 ) ) ( not ( = ?auto_764668 ?auto_764672 ) ) ( not ( = ?auto_764668 ?auto_764673 ) ) ( not ( = ?auto_764668 ?auto_764674 ) ) ( not ( = ?auto_764668 ?auto_764675 ) ) ( not ( = ?auto_764668 ?auto_764676 ) ) ( not ( = ?auto_764668 ?auto_764677 ) ) ( not ( = ?auto_764668 ?auto_764678 ) ) ( not ( = ?auto_764668 ?auto_764679 ) ) ( not ( = ?auto_764668 ?auto_764680 ) ) ( not ( = ?auto_764668 ?auto_764681 ) ) ( not ( = ?auto_764668 ?auto_764682 ) ) ( not ( = ?auto_764668 ?auto_764683 ) ) ( not ( = ?auto_764668 ?auto_764684 ) ) ( not ( = ?auto_764669 ?auto_764670 ) ) ( not ( = ?auto_764669 ?auto_764671 ) ) ( not ( = ?auto_764669 ?auto_764672 ) ) ( not ( = ?auto_764669 ?auto_764673 ) ) ( not ( = ?auto_764669 ?auto_764674 ) ) ( not ( = ?auto_764669 ?auto_764675 ) ) ( not ( = ?auto_764669 ?auto_764676 ) ) ( not ( = ?auto_764669 ?auto_764677 ) ) ( not ( = ?auto_764669 ?auto_764678 ) ) ( not ( = ?auto_764669 ?auto_764679 ) ) ( not ( = ?auto_764669 ?auto_764680 ) ) ( not ( = ?auto_764669 ?auto_764681 ) ) ( not ( = ?auto_764669 ?auto_764682 ) ) ( not ( = ?auto_764669 ?auto_764683 ) ) ( not ( = ?auto_764669 ?auto_764684 ) ) ( not ( = ?auto_764670 ?auto_764671 ) ) ( not ( = ?auto_764670 ?auto_764672 ) ) ( not ( = ?auto_764670 ?auto_764673 ) ) ( not ( = ?auto_764670 ?auto_764674 ) ) ( not ( = ?auto_764670 ?auto_764675 ) ) ( not ( = ?auto_764670 ?auto_764676 ) ) ( not ( = ?auto_764670 ?auto_764677 ) ) ( not ( = ?auto_764670 ?auto_764678 ) ) ( not ( = ?auto_764670 ?auto_764679 ) ) ( not ( = ?auto_764670 ?auto_764680 ) ) ( not ( = ?auto_764670 ?auto_764681 ) ) ( not ( = ?auto_764670 ?auto_764682 ) ) ( not ( = ?auto_764670 ?auto_764683 ) ) ( not ( = ?auto_764670 ?auto_764684 ) ) ( not ( = ?auto_764671 ?auto_764672 ) ) ( not ( = ?auto_764671 ?auto_764673 ) ) ( not ( = ?auto_764671 ?auto_764674 ) ) ( not ( = ?auto_764671 ?auto_764675 ) ) ( not ( = ?auto_764671 ?auto_764676 ) ) ( not ( = ?auto_764671 ?auto_764677 ) ) ( not ( = ?auto_764671 ?auto_764678 ) ) ( not ( = ?auto_764671 ?auto_764679 ) ) ( not ( = ?auto_764671 ?auto_764680 ) ) ( not ( = ?auto_764671 ?auto_764681 ) ) ( not ( = ?auto_764671 ?auto_764682 ) ) ( not ( = ?auto_764671 ?auto_764683 ) ) ( not ( = ?auto_764671 ?auto_764684 ) ) ( not ( = ?auto_764672 ?auto_764673 ) ) ( not ( = ?auto_764672 ?auto_764674 ) ) ( not ( = ?auto_764672 ?auto_764675 ) ) ( not ( = ?auto_764672 ?auto_764676 ) ) ( not ( = ?auto_764672 ?auto_764677 ) ) ( not ( = ?auto_764672 ?auto_764678 ) ) ( not ( = ?auto_764672 ?auto_764679 ) ) ( not ( = ?auto_764672 ?auto_764680 ) ) ( not ( = ?auto_764672 ?auto_764681 ) ) ( not ( = ?auto_764672 ?auto_764682 ) ) ( not ( = ?auto_764672 ?auto_764683 ) ) ( not ( = ?auto_764672 ?auto_764684 ) ) ( not ( = ?auto_764673 ?auto_764674 ) ) ( not ( = ?auto_764673 ?auto_764675 ) ) ( not ( = ?auto_764673 ?auto_764676 ) ) ( not ( = ?auto_764673 ?auto_764677 ) ) ( not ( = ?auto_764673 ?auto_764678 ) ) ( not ( = ?auto_764673 ?auto_764679 ) ) ( not ( = ?auto_764673 ?auto_764680 ) ) ( not ( = ?auto_764673 ?auto_764681 ) ) ( not ( = ?auto_764673 ?auto_764682 ) ) ( not ( = ?auto_764673 ?auto_764683 ) ) ( not ( = ?auto_764673 ?auto_764684 ) ) ( not ( = ?auto_764674 ?auto_764675 ) ) ( not ( = ?auto_764674 ?auto_764676 ) ) ( not ( = ?auto_764674 ?auto_764677 ) ) ( not ( = ?auto_764674 ?auto_764678 ) ) ( not ( = ?auto_764674 ?auto_764679 ) ) ( not ( = ?auto_764674 ?auto_764680 ) ) ( not ( = ?auto_764674 ?auto_764681 ) ) ( not ( = ?auto_764674 ?auto_764682 ) ) ( not ( = ?auto_764674 ?auto_764683 ) ) ( not ( = ?auto_764674 ?auto_764684 ) ) ( not ( = ?auto_764675 ?auto_764676 ) ) ( not ( = ?auto_764675 ?auto_764677 ) ) ( not ( = ?auto_764675 ?auto_764678 ) ) ( not ( = ?auto_764675 ?auto_764679 ) ) ( not ( = ?auto_764675 ?auto_764680 ) ) ( not ( = ?auto_764675 ?auto_764681 ) ) ( not ( = ?auto_764675 ?auto_764682 ) ) ( not ( = ?auto_764675 ?auto_764683 ) ) ( not ( = ?auto_764675 ?auto_764684 ) ) ( not ( = ?auto_764676 ?auto_764677 ) ) ( not ( = ?auto_764676 ?auto_764678 ) ) ( not ( = ?auto_764676 ?auto_764679 ) ) ( not ( = ?auto_764676 ?auto_764680 ) ) ( not ( = ?auto_764676 ?auto_764681 ) ) ( not ( = ?auto_764676 ?auto_764682 ) ) ( not ( = ?auto_764676 ?auto_764683 ) ) ( not ( = ?auto_764676 ?auto_764684 ) ) ( not ( = ?auto_764677 ?auto_764678 ) ) ( not ( = ?auto_764677 ?auto_764679 ) ) ( not ( = ?auto_764677 ?auto_764680 ) ) ( not ( = ?auto_764677 ?auto_764681 ) ) ( not ( = ?auto_764677 ?auto_764682 ) ) ( not ( = ?auto_764677 ?auto_764683 ) ) ( not ( = ?auto_764677 ?auto_764684 ) ) ( not ( = ?auto_764678 ?auto_764679 ) ) ( not ( = ?auto_764678 ?auto_764680 ) ) ( not ( = ?auto_764678 ?auto_764681 ) ) ( not ( = ?auto_764678 ?auto_764682 ) ) ( not ( = ?auto_764678 ?auto_764683 ) ) ( not ( = ?auto_764678 ?auto_764684 ) ) ( not ( = ?auto_764679 ?auto_764680 ) ) ( not ( = ?auto_764679 ?auto_764681 ) ) ( not ( = ?auto_764679 ?auto_764682 ) ) ( not ( = ?auto_764679 ?auto_764683 ) ) ( not ( = ?auto_764679 ?auto_764684 ) ) ( not ( = ?auto_764680 ?auto_764681 ) ) ( not ( = ?auto_764680 ?auto_764682 ) ) ( not ( = ?auto_764680 ?auto_764683 ) ) ( not ( = ?auto_764680 ?auto_764684 ) ) ( not ( = ?auto_764681 ?auto_764682 ) ) ( not ( = ?auto_764681 ?auto_764683 ) ) ( not ( = ?auto_764681 ?auto_764684 ) ) ( not ( = ?auto_764682 ?auto_764683 ) ) ( not ( = ?auto_764682 ?auto_764684 ) ) ( not ( = ?auto_764683 ?auto_764684 ) ) ( ON ?auto_764682 ?auto_764683 ) ( ON ?auto_764681 ?auto_764682 ) ( ON ?auto_764680 ?auto_764681 ) ( ON ?auto_764679 ?auto_764680 ) ( ON ?auto_764678 ?auto_764679 ) ( ON ?auto_764677 ?auto_764678 ) ( ON ?auto_764676 ?auto_764677 ) ( ON ?auto_764675 ?auto_764676 ) ( ON ?auto_764674 ?auto_764675 ) ( ON ?auto_764673 ?auto_764674 ) ( ON ?auto_764672 ?auto_764673 ) ( ON ?auto_764671 ?auto_764672 ) ( ON ?auto_764670 ?auto_764671 ) ( ON ?auto_764669 ?auto_764670 ) ( ON ?auto_764668 ?auto_764669 ) ( ON ?auto_764667 ?auto_764668 ) ( CLEAR ?auto_764667 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_764667 )
      ( MAKE-17PILE ?auto_764667 ?auto_764668 ?auto_764669 ?auto_764670 ?auto_764671 ?auto_764672 ?auto_764673 ?auto_764674 ?auto_764675 ?auto_764676 ?auto_764677 ?auto_764678 ?auto_764679 ?auto_764680 ?auto_764681 ?auto_764682 ?auto_764683 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_764738 - BLOCK
      ?auto_764739 - BLOCK
      ?auto_764740 - BLOCK
      ?auto_764741 - BLOCK
      ?auto_764742 - BLOCK
      ?auto_764743 - BLOCK
      ?auto_764744 - BLOCK
      ?auto_764745 - BLOCK
      ?auto_764746 - BLOCK
      ?auto_764747 - BLOCK
      ?auto_764748 - BLOCK
      ?auto_764749 - BLOCK
      ?auto_764750 - BLOCK
      ?auto_764751 - BLOCK
      ?auto_764752 - BLOCK
      ?auto_764753 - BLOCK
      ?auto_764754 - BLOCK
      ?auto_764755 - BLOCK
    )
    :vars
    (
      ?auto_764756 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_764754 ) ( ON ?auto_764755 ?auto_764756 ) ( CLEAR ?auto_764755 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_764738 ) ( ON ?auto_764739 ?auto_764738 ) ( ON ?auto_764740 ?auto_764739 ) ( ON ?auto_764741 ?auto_764740 ) ( ON ?auto_764742 ?auto_764741 ) ( ON ?auto_764743 ?auto_764742 ) ( ON ?auto_764744 ?auto_764743 ) ( ON ?auto_764745 ?auto_764744 ) ( ON ?auto_764746 ?auto_764745 ) ( ON ?auto_764747 ?auto_764746 ) ( ON ?auto_764748 ?auto_764747 ) ( ON ?auto_764749 ?auto_764748 ) ( ON ?auto_764750 ?auto_764749 ) ( ON ?auto_764751 ?auto_764750 ) ( ON ?auto_764752 ?auto_764751 ) ( ON ?auto_764753 ?auto_764752 ) ( ON ?auto_764754 ?auto_764753 ) ( not ( = ?auto_764738 ?auto_764739 ) ) ( not ( = ?auto_764738 ?auto_764740 ) ) ( not ( = ?auto_764738 ?auto_764741 ) ) ( not ( = ?auto_764738 ?auto_764742 ) ) ( not ( = ?auto_764738 ?auto_764743 ) ) ( not ( = ?auto_764738 ?auto_764744 ) ) ( not ( = ?auto_764738 ?auto_764745 ) ) ( not ( = ?auto_764738 ?auto_764746 ) ) ( not ( = ?auto_764738 ?auto_764747 ) ) ( not ( = ?auto_764738 ?auto_764748 ) ) ( not ( = ?auto_764738 ?auto_764749 ) ) ( not ( = ?auto_764738 ?auto_764750 ) ) ( not ( = ?auto_764738 ?auto_764751 ) ) ( not ( = ?auto_764738 ?auto_764752 ) ) ( not ( = ?auto_764738 ?auto_764753 ) ) ( not ( = ?auto_764738 ?auto_764754 ) ) ( not ( = ?auto_764738 ?auto_764755 ) ) ( not ( = ?auto_764738 ?auto_764756 ) ) ( not ( = ?auto_764739 ?auto_764740 ) ) ( not ( = ?auto_764739 ?auto_764741 ) ) ( not ( = ?auto_764739 ?auto_764742 ) ) ( not ( = ?auto_764739 ?auto_764743 ) ) ( not ( = ?auto_764739 ?auto_764744 ) ) ( not ( = ?auto_764739 ?auto_764745 ) ) ( not ( = ?auto_764739 ?auto_764746 ) ) ( not ( = ?auto_764739 ?auto_764747 ) ) ( not ( = ?auto_764739 ?auto_764748 ) ) ( not ( = ?auto_764739 ?auto_764749 ) ) ( not ( = ?auto_764739 ?auto_764750 ) ) ( not ( = ?auto_764739 ?auto_764751 ) ) ( not ( = ?auto_764739 ?auto_764752 ) ) ( not ( = ?auto_764739 ?auto_764753 ) ) ( not ( = ?auto_764739 ?auto_764754 ) ) ( not ( = ?auto_764739 ?auto_764755 ) ) ( not ( = ?auto_764739 ?auto_764756 ) ) ( not ( = ?auto_764740 ?auto_764741 ) ) ( not ( = ?auto_764740 ?auto_764742 ) ) ( not ( = ?auto_764740 ?auto_764743 ) ) ( not ( = ?auto_764740 ?auto_764744 ) ) ( not ( = ?auto_764740 ?auto_764745 ) ) ( not ( = ?auto_764740 ?auto_764746 ) ) ( not ( = ?auto_764740 ?auto_764747 ) ) ( not ( = ?auto_764740 ?auto_764748 ) ) ( not ( = ?auto_764740 ?auto_764749 ) ) ( not ( = ?auto_764740 ?auto_764750 ) ) ( not ( = ?auto_764740 ?auto_764751 ) ) ( not ( = ?auto_764740 ?auto_764752 ) ) ( not ( = ?auto_764740 ?auto_764753 ) ) ( not ( = ?auto_764740 ?auto_764754 ) ) ( not ( = ?auto_764740 ?auto_764755 ) ) ( not ( = ?auto_764740 ?auto_764756 ) ) ( not ( = ?auto_764741 ?auto_764742 ) ) ( not ( = ?auto_764741 ?auto_764743 ) ) ( not ( = ?auto_764741 ?auto_764744 ) ) ( not ( = ?auto_764741 ?auto_764745 ) ) ( not ( = ?auto_764741 ?auto_764746 ) ) ( not ( = ?auto_764741 ?auto_764747 ) ) ( not ( = ?auto_764741 ?auto_764748 ) ) ( not ( = ?auto_764741 ?auto_764749 ) ) ( not ( = ?auto_764741 ?auto_764750 ) ) ( not ( = ?auto_764741 ?auto_764751 ) ) ( not ( = ?auto_764741 ?auto_764752 ) ) ( not ( = ?auto_764741 ?auto_764753 ) ) ( not ( = ?auto_764741 ?auto_764754 ) ) ( not ( = ?auto_764741 ?auto_764755 ) ) ( not ( = ?auto_764741 ?auto_764756 ) ) ( not ( = ?auto_764742 ?auto_764743 ) ) ( not ( = ?auto_764742 ?auto_764744 ) ) ( not ( = ?auto_764742 ?auto_764745 ) ) ( not ( = ?auto_764742 ?auto_764746 ) ) ( not ( = ?auto_764742 ?auto_764747 ) ) ( not ( = ?auto_764742 ?auto_764748 ) ) ( not ( = ?auto_764742 ?auto_764749 ) ) ( not ( = ?auto_764742 ?auto_764750 ) ) ( not ( = ?auto_764742 ?auto_764751 ) ) ( not ( = ?auto_764742 ?auto_764752 ) ) ( not ( = ?auto_764742 ?auto_764753 ) ) ( not ( = ?auto_764742 ?auto_764754 ) ) ( not ( = ?auto_764742 ?auto_764755 ) ) ( not ( = ?auto_764742 ?auto_764756 ) ) ( not ( = ?auto_764743 ?auto_764744 ) ) ( not ( = ?auto_764743 ?auto_764745 ) ) ( not ( = ?auto_764743 ?auto_764746 ) ) ( not ( = ?auto_764743 ?auto_764747 ) ) ( not ( = ?auto_764743 ?auto_764748 ) ) ( not ( = ?auto_764743 ?auto_764749 ) ) ( not ( = ?auto_764743 ?auto_764750 ) ) ( not ( = ?auto_764743 ?auto_764751 ) ) ( not ( = ?auto_764743 ?auto_764752 ) ) ( not ( = ?auto_764743 ?auto_764753 ) ) ( not ( = ?auto_764743 ?auto_764754 ) ) ( not ( = ?auto_764743 ?auto_764755 ) ) ( not ( = ?auto_764743 ?auto_764756 ) ) ( not ( = ?auto_764744 ?auto_764745 ) ) ( not ( = ?auto_764744 ?auto_764746 ) ) ( not ( = ?auto_764744 ?auto_764747 ) ) ( not ( = ?auto_764744 ?auto_764748 ) ) ( not ( = ?auto_764744 ?auto_764749 ) ) ( not ( = ?auto_764744 ?auto_764750 ) ) ( not ( = ?auto_764744 ?auto_764751 ) ) ( not ( = ?auto_764744 ?auto_764752 ) ) ( not ( = ?auto_764744 ?auto_764753 ) ) ( not ( = ?auto_764744 ?auto_764754 ) ) ( not ( = ?auto_764744 ?auto_764755 ) ) ( not ( = ?auto_764744 ?auto_764756 ) ) ( not ( = ?auto_764745 ?auto_764746 ) ) ( not ( = ?auto_764745 ?auto_764747 ) ) ( not ( = ?auto_764745 ?auto_764748 ) ) ( not ( = ?auto_764745 ?auto_764749 ) ) ( not ( = ?auto_764745 ?auto_764750 ) ) ( not ( = ?auto_764745 ?auto_764751 ) ) ( not ( = ?auto_764745 ?auto_764752 ) ) ( not ( = ?auto_764745 ?auto_764753 ) ) ( not ( = ?auto_764745 ?auto_764754 ) ) ( not ( = ?auto_764745 ?auto_764755 ) ) ( not ( = ?auto_764745 ?auto_764756 ) ) ( not ( = ?auto_764746 ?auto_764747 ) ) ( not ( = ?auto_764746 ?auto_764748 ) ) ( not ( = ?auto_764746 ?auto_764749 ) ) ( not ( = ?auto_764746 ?auto_764750 ) ) ( not ( = ?auto_764746 ?auto_764751 ) ) ( not ( = ?auto_764746 ?auto_764752 ) ) ( not ( = ?auto_764746 ?auto_764753 ) ) ( not ( = ?auto_764746 ?auto_764754 ) ) ( not ( = ?auto_764746 ?auto_764755 ) ) ( not ( = ?auto_764746 ?auto_764756 ) ) ( not ( = ?auto_764747 ?auto_764748 ) ) ( not ( = ?auto_764747 ?auto_764749 ) ) ( not ( = ?auto_764747 ?auto_764750 ) ) ( not ( = ?auto_764747 ?auto_764751 ) ) ( not ( = ?auto_764747 ?auto_764752 ) ) ( not ( = ?auto_764747 ?auto_764753 ) ) ( not ( = ?auto_764747 ?auto_764754 ) ) ( not ( = ?auto_764747 ?auto_764755 ) ) ( not ( = ?auto_764747 ?auto_764756 ) ) ( not ( = ?auto_764748 ?auto_764749 ) ) ( not ( = ?auto_764748 ?auto_764750 ) ) ( not ( = ?auto_764748 ?auto_764751 ) ) ( not ( = ?auto_764748 ?auto_764752 ) ) ( not ( = ?auto_764748 ?auto_764753 ) ) ( not ( = ?auto_764748 ?auto_764754 ) ) ( not ( = ?auto_764748 ?auto_764755 ) ) ( not ( = ?auto_764748 ?auto_764756 ) ) ( not ( = ?auto_764749 ?auto_764750 ) ) ( not ( = ?auto_764749 ?auto_764751 ) ) ( not ( = ?auto_764749 ?auto_764752 ) ) ( not ( = ?auto_764749 ?auto_764753 ) ) ( not ( = ?auto_764749 ?auto_764754 ) ) ( not ( = ?auto_764749 ?auto_764755 ) ) ( not ( = ?auto_764749 ?auto_764756 ) ) ( not ( = ?auto_764750 ?auto_764751 ) ) ( not ( = ?auto_764750 ?auto_764752 ) ) ( not ( = ?auto_764750 ?auto_764753 ) ) ( not ( = ?auto_764750 ?auto_764754 ) ) ( not ( = ?auto_764750 ?auto_764755 ) ) ( not ( = ?auto_764750 ?auto_764756 ) ) ( not ( = ?auto_764751 ?auto_764752 ) ) ( not ( = ?auto_764751 ?auto_764753 ) ) ( not ( = ?auto_764751 ?auto_764754 ) ) ( not ( = ?auto_764751 ?auto_764755 ) ) ( not ( = ?auto_764751 ?auto_764756 ) ) ( not ( = ?auto_764752 ?auto_764753 ) ) ( not ( = ?auto_764752 ?auto_764754 ) ) ( not ( = ?auto_764752 ?auto_764755 ) ) ( not ( = ?auto_764752 ?auto_764756 ) ) ( not ( = ?auto_764753 ?auto_764754 ) ) ( not ( = ?auto_764753 ?auto_764755 ) ) ( not ( = ?auto_764753 ?auto_764756 ) ) ( not ( = ?auto_764754 ?auto_764755 ) ) ( not ( = ?auto_764754 ?auto_764756 ) ) ( not ( = ?auto_764755 ?auto_764756 ) ) )
    :subtasks
    ( ( !UNSTACK ?auto_764755 ?auto_764756 )
      ( !STACK ?auto_764755 ?auto_764754 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_764775 - BLOCK
      ?auto_764776 - BLOCK
      ?auto_764777 - BLOCK
      ?auto_764778 - BLOCK
      ?auto_764779 - BLOCK
      ?auto_764780 - BLOCK
      ?auto_764781 - BLOCK
      ?auto_764782 - BLOCK
      ?auto_764783 - BLOCK
      ?auto_764784 - BLOCK
      ?auto_764785 - BLOCK
      ?auto_764786 - BLOCK
      ?auto_764787 - BLOCK
      ?auto_764788 - BLOCK
      ?auto_764789 - BLOCK
      ?auto_764790 - BLOCK
      ?auto_764791 - BLOCK
      ?auto_764792 - BLOCK
    )
    :precondition
    ( and ( CLEAR ?auto_764791 ) ( ON-TABLE ?auto_764792 ) ( CLEAR ?auto_764792 ) ( HAND-EMPTY ) ( ON-TABLE ?auto_764775 ) ( ON ?auto_764776 ?auto_764775 ) ( ON ?auto_764777 ?auto_764776 ) ( ON ?auto_764778 ?auto_764777 ) ( ON ?auto_764779 ?auto_764778 ) ( ON ?auto_764780 ?auto_764779 ) ( ON ?auto_764781 ?auto_764780 ) ( ON ?auto_764782 ?auto_764781 ) ( ON ?auto_764783 ?auto_764782 ) ( ON ?auto_764784 ?auto_764783 ) ( ON ?auto_764785 ?auto_764784 ) ( ON ?auto_764786 ?auto_764785 ) ( ON ?auto_764787 ?auto_764786 ) ( ON ?auto_764788 ?auto_764787 ) ( ON ?auto_764789 ?auto_764788 ) ( ON ?auto_764790 ?auto_764789 ) ( ON ?auto_764791 ?auto_764790 ) ( not ( = ?auto_764775 ?auto_764776 ) ) ( not ( = ?auto_764775 ?auto_764777 ) ) ( not ( = ?auto_764775 ?auto_764778 ) ) ( not ( = ?auto_764775 ?auto_764779 ) ) ( not ( = ?auto_764775 ?auto_764780 ) ) ( not ( = ?auto_764775 ?auto_764781 ) ) ( not ( = ?auto_764775 ?auto_764782 ) ) ( not ( = ?auto_764775 ?auto_764783 ) ) ( not ( = ?auto_764775 ?auto_764784 ) ) ( not ( = ?auto_764775 ?auto_764785 ) ) ( not ( = ?auto_764775 ?auto_764786 ) ) ( not ( = ?auto_764775 ?auto_764787 ) ) ( not ( = ?auto_764775 ?auto_764788 ) ) ( not ( = ?auto_764775 ?auto_764789 ) ) ( not ( = ?auto_764775 ?auto_764790 ) ) ( not ( = ?auto_764775 ?auto_764791 ) ) ( not ( = ?auto_764775 ?auto_764792 ) ) ( not ( = ?auto_764776 ?auto_764777 ) ) ( not ( = ?auto_764776 ?auto_764778 ) ) ( not ( = ?auto_764776 ?auto_764779 ) ) ( not ( = ?auto_764776 ?auto_764780 ) ) ( not ( = ?auto_764776 ?auto_764781 ) ) ( not ( = ?auto_764776 ?auto_764782 ) ) ( not ( = ?auto_764776 ?auto_764783 ) ) ( not ( = ?auto_764776 ?auto_764784 ) ) ( not ( = ?auto_764776 ?auto_764785 ) ) ( not ( = ?auto_764776 ?auto_764786 ) ) ( not ( = ?auto_764776 ?auto_764787 ) ) ( not ( = ?auto_764776 ?auto_764788 ) ) ( not ( = ?auto_764776 ?auto_764789 ) ) ( not ( = ?auto_764776 ?auto_764790 ) ) ( not ( = ?auto_764776 ?auto_764791 ) ) ( not ( = ?auto_764776 ?auto_764792 ) ) ( not ( = ?auto_764777 ?auto_764778 ) ) ( not ( = ?auto_764777 ?auto_764779 ) ) ( not ( = ?auto_764777 ?auto_764780 ) ) ( not ( = ?auto_764777 ?auto_764781 ) ) ( not ( = ?auto_764777 ?auto_764782 ) ) ( not ( = ?auto_764777 ?auto_764783 ) ) ( not ( = ?auto_764777 ?auto_764784 ) ) ( not ( = ?auto_764777 ?auto_764785 ) ) ( not ( = ?auto_764777 ?auto_764786 ) ) ( not ( = ?auto_764777 ?auto_764787 ) ) ( not ( = ?auto_764777 ?auto_764788 ) ) ( not ( = ?auto_764777 ?auto_764789 ) ) ( not ( = ?auto_764777 ?auto_764790 ) ) ( not ( = ?auto_764777 ?auto_764791 ) ) ( not ( = ?auto_764777 ?auto_764792 ) ) ( not ( = ?auto_764778 ?auto_764779 ) ) ( not ( = ?auto_764778 ?auto_764780 ) ) ( not ( = ?auto_764778 ?auto_764781 ) ) ( not ( = ?auto_764778 ?auto_764782 ) ) ( not ( = ?auto_764778 ?auto_764783 ) ) ( not ( = ?auto_764778 ?auto_764784 ) ) ( not ( = ?auto_764778 ?auto_764785 ) ) ( not ( = ?auto_764778 ?auto_764786 ) ) ( not ( = ?auto_764778 ?auto_764787 ) ) ( not ( = ?auto_764778 ?auto_764788 ) ) ( not ( = ?auto_764778 ?auto_764789 ) ) ( not ( = ?auto_764778 ?auto_764790 ) ) ( not ( = ?auto_764778 ?auto_764791 ) ) ( not ( = ?auto_764778 ?auto_764792 ) ) ( not ( = ?auto_764779 ?auto_764780 ) ) ( not ( = ?auto_764779 ?auto_764781 ) ) ( not ( = ?auto_764779 ?auto_764782 ) ) ( not ( = ?auto_764779 ?auto_764783 ) ) ( not ( = ?auto_764779 ?auto_764784 ) ) ( not ( = ?auto_764779 ?auto_764785 ) ) ( not ( = ?auto_764779 ?auto_764786 ) ) ( not ( = ?auto_764779 ?auto_764787 ) ) ( not ( = ?auto_764779 ?auto_764788 ) ) ( not ( = ?auto_764779 ?auto_764789 ) ) ( not ( = ?auto_764779 ?auto_764790 ) ) ( not ( = ?auto_764779 ?auto_764791 ) ) ( not ( = ?auto_764779 ?auto_764792 ) ) ( not ( = ?auto_764780 ?auto_764781 ) ) ( not ( = ?auto_764780 ?auto_764782 ) ) ( not ( = ?auto_764780 ?auto_764783 ) ) ( not ( = ?auto_764780 ?auto_764784 ) ) ( not ( = ?auto_764780 ?auto_764785 ) ) ( not ( = ?auto_764780 ?auto_764786 ) ) ( not ( = ?auto_764780 ?auto_764787 ) ) ( not ( = ?auto_764780 ?auto_764788 ) ) ( not ( = ?auto_764780 ?auto_764789 ) ) ( not ( = ?auto_764780 ?auto_764790 ) ) ( not ( = ?auto_764780 ?auto_764791 ) ) ( not ( = ?auto_764780 ?auto_764792 ) ) ( not ( = ?auto_764781 ?auto_764782 ) ) ( not ( = ?auto_764781 ?auto_764783 ) ) ( not ( = ?auto_764781 ?auto_764784 ) ) ( not ( = ?auto_764781 ?auto_764785 ) ) ( not ( = ?auto_764781 ?auto_764786 ) ) ( not ( = ?auto_764781 ?auto_764787 ) ) ( not ( = ?auto_764781 ?auto_764788 ) ) ( not ( = ?auto_764781 ?auto_764789 ) ) ( not ( = ?auto_764781 ?auto_764790 ) ) ( not ( = ?auto_764781 ?auto_764791 ) ) ( not ( = ?auto_764781 ?auto_764792 ) ) ( not ( = ?auto_764782 ?auto_764783 ) ) ( not ( = ?auto_764782 ?auto_764784 ) ) ( not ( = ?auto_764782 ?auto_764785 ) ) ( not ( = ?auto_764782 ?auto_764786 ) ) ( not ( = ?auto_764782 ?auto_764787 ) ) ( not ( = ?auto_764782 ?auto_764788 ) ) ( not ( = ?auto_764782 ?auto_764789 ) ) ( not ( = ?auto_764782 ?auto_764790 ) ) ( not ( = ?auto_764782 ?auto_764791 ) ) ( not ( = ?auto_764782 ?auto_764792 ) ) ( not ( = ?auto_764783 ?auto_764784 ) ) ( not ( = ?auto_764783 ?auto_764785 ) ) ( not ( = ?auto_764783 ?auto_764786 ) ) ( not ( = ?auto_764783 ?auto_764787 ) ) ( not ( = ?auto_764783 ?auto_764788 ) ) ( not ( = ?auto_764783 ?auto_764789 ) ) ( not ( = ?auto_764783 ?auto_764790 ) ) ( not ( = ?auto_764783 ?auto_764791 ) ) ( not ( = ?auto_764783 ?auto_764792 ) ) ( not ( = ?auto_764784 ?auto_764785 ) ) ( not ( = ?auto_764784 ?auto_764786 ) ) ( not ( = ?auto_764784 ?auto_764787 ) ) ( not ( = ?auto_764784 ?auto_764788 ) ) ( not ( = ?auto_764784 ?auto_764789 ) ) ( not ( = ?auto_764784 ?auto_764790 ) ) ( not ( = ?auto_764784 ?auto_764791 ) ) ( not ( = ?auto_764784 ?auto_764792 ) ) ( not ( = ?auto_764785 ?auto_764786 ) ) ( not ( = ?auto_764785 ?auto_764787 ) ) ( not ( = ?auto_764785 ?auto_764788 ) ) ( not ( = ?auto_764785 ?auto_764789 ) ) ( not ( = ?auto_764785 ?auto_764790 ) ) ( not ( = ?auto_764785 ?auto_764791 ) ) ( not ( = ?auto_764785 ?auto_764792 ) ) ( not ( = ?auto_764786 ?auto_764787 ) ) ( not ( = ?auto_764786 ?auto_764788 ) ) ( not ( = ?auto_764786 ?auto_764789 ) ) ( not ( = ?auto_764786 ?auto_764790 ) ) ( not ( = ?auto_764786 ?auto_764791 ) ) ( not ( = ?auto_764786 ?auto_764792 ) ) ( not ( = ?auto_764787 ?auto_764788 ) ) ( not ( = ?auto_764787 ?auto_764789 ) ) ( not ( = ?auto_764787 ?auto_764790 ) ) ( not ( = ?auto_764787 ?auto_764791 ) ) ( not ( = ?auto_764787 ?auto_764792 ) ) ( not ( = ?auto_764788 ?auto_764789 ) ) ( not ( = ?auto_764788 ?auto_764790 ) ) ( not ( = ?auto_764788 ?auto_764791 ) ) ( not ( = ?auto_764788 ?auto_764792 ) ) ( not ( = ?auto_764789 ?auto_764790 ) ) ( not ( = ?auto_764789 ?auto_764791 ) ) ( not ( = ?auto_764789 ?auto_764792 ) ) ( not ( = ?auto_764790 ?auto_764791 ) ) ( not ( = ?auto_764790 ?auto_764792 ) ) ( not ( = ?auto_764791 ?auto_764792 ) ) )
    :subtasks
    ( ( !PICKUP ?auto_764792 )
      ( !STACK ?auto_764792 ?auto_764791 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_764811 - BLOCK
      ?auto_764812 - BLOCK
      ?auto_764813 - BLOCK
      ?auto_764814 - BLOCK
      ?auto_764815 - BLOCK
      ?auto_764816 - BLOCK
      ?auto_764817 - BLOCK
      ?auto_764818 - BLOCK
      ?auto_764819 - BLOCK
      ?auto_764820 - BLOCK
      ?auto_764821 - BLOCK
      ?auto_764822 - BLOCK
      ?auto_764823 - BLOCK
      ?auto_764824 - BLOCK
      ?auto_764825 - BLOCK
      ?auto_764826 - BLOCK
      ?auto_764827 - BLOCK
      ?auto_764828 - BLOCK
    )
    :vars
    (
      ?auto_764829 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_764828 ?auto_764829 ) ( ON-TABLE ?auto_764811 ) ( ON ?auto_764812 ?auto_764811 ) ( ON ?auto_764813 ?auto_764812 ) ( ON ?auto_764814 ?auto_764813 ) ( ON ?auto_764815 ?auto_764814 ) ( ON ?auto_764816 ?auto_764815 ) ( ON ?auto_764817 ?auto_764816 ) ( ON ?auto_764818 ?auto_764817 ) ( ON ?auto_764819 ?auto_764818 ) ( ON ?auto_764820 ?auto_764819 ) ( ON ?auto_764821 ?auto_764820 ) ( ON ?auto_764822 ?auto_764821 ) ( ON ?auto_764823 ?auto_764822 ) ( ON ?auto_764824 ?auto_764823 ) ( ON ?auto_764825 ?auto_764824 ) ( ON ?auto_764826 ?auto_764825 ) ( not ( = ?auto_764811 ?auto_764812 ) ) ( not ( = ?auto_764811 ?auto_764813 ) ) ( not ( = ?auto_764811 ?auto_764814 ) ) ( not ( = ?auto_764811 ?auto_764815 ) ) ( not ( = ?auto_764811 ?auto_764816 ) ) ( not ( = ?auto_764811 ?auto_764817 ) ) ( not ( = ?auto_764811 ?auto_764818 ) ) ( not ( = ?auto_764811 ?auto_764819 ) ) ( not ( = ?auto_764811 ?auto_764820 ) ) ( not ( = ?auto_764811 ?auto_764821 ) ) ( not ( = ?auto_764811 ?auto_764822 ) ) ( not ( = ?auto_764811 ?auto_764823 ) ) ( not ( = ?auto_764811 ?auto_764824 ) ) ( not ( = ?auto_764811 ?auto_764825 ) ) ( not ( = ?auto_764811 ?auto_764826 ) ) ( not ( = ?auto_764811 ?auto_764827 ) ) ( not ( = ?auto_764811 ?auto_764828 ) ) ( not ( = ?auto_764811 ?auto_764829 ) ) ( not ( = ?auto_764812 ?auto_764813 ) ) ( not ( = ?auto_764812 ?auto_764814 ) ) ( not ( = ?auto_764812 ?auto_764815 ) ) ( not ( = ?auto_764812 ?auto_764816 ) ) ( not ( = ?auto_764812 ?auto_764817 ) ) ( not ( = ?auto_764812 ?auto_764818 ) ) ( not ( = ?auto_764812 ?auto_764819 ) ) ( not ( = ?auto_764812 ?auto_764820 ) ) ( not ( = ?auto_764812 ?auto_764821 ) ) ( not ( = ?auto_764812 ?auto_764822 ) ) ( not ( = ?auto_764812 ?auto_764823 ) ) ( not ( = ?auto_764812 ?auto_764824 ) ) ( not ( = ?auto_764812 ?auto_764825 ) ) ( not ( = ?auto_764812 ?auto_764826 ) ) ( not ( = ?auto_764812 ?auto_764827 ) ) ( not ( = ?auto_764812 ?auto_764828 ) ) ( not ( = ?auto_764812 ?auto_764829 ) ) ( not ( = ?auto_764813 ?auto_764814 ) ) ( not ( = ?auto_764813 ?auto_764815 ) ) ( not ( = ?auto_764813 ?auto_764816 ) ) ( not ( = ?auto_764813 ?auto_764817 ) ) ( not ( = ?auto_764813 ?auto_764818 ) ) ( not ( = ?auto_764813 ?auto_764819 ) ) ( not ( = ?auto_764813 ?auto_764820 ) ) ( not ( = ?auto_764813 ?auto_764821 ) ) ( not ( = ?auto_764813 ?auto_764822 ) ) ( not ( = ?auto_764813 ?auto_764823 ) ) ( not ( = ?auto_764813 ?auto_764824 ) ) ( not ( = ?auto_764813 ?auto_764825 ) ) ( not ( = ?auto_764813 ?auto_764826 ) ) ( not ( = ?auto_764813 ?auto_764827 ) ) ( not ( = ?auto_764813 ?auto_764828 ) ) ( not ( = ?auto_764813 ?auto_764829 ) ) ( not ( = ?auto_764814 ?auto_764815 ) ) ( not ( = ?auto_764814 ?auto_764816 ) ) ( not ( = ?auto_764814 ?auto_764817 ) ) ( not ( = ?auto_764814 ?auto_764818 ) ) ( not ( = ?auto_764814 ?auto_764819 ) ) ( not ( = ?auto_764814 ?auto_764820 ) ) ( not ( = ?auto_764814 ?auto_764821 ) ) ( not ( = ?auto_764814 ?auto_764822 ) ) ( not ( = ?auto_764814 ?auto_764823 ) ) ( not ( = ?auto_764814 ?auto_764824 ) ) ( not ( = ?auto_764814 ?auto_764825 ) ) ( not ( = ?auto_764814 ?auto_764826 ) ) ( not ( = ?auto_764814 ?auto_764827 ) ) ( not ( = ?auto_764814 ?auto_764828 ) ) ( not ( = ?auto_764814 ?auto_764829 ) ) ( not ( = ?auto_764815 ?auto_764816 ) ) ( not ( = ?auto_764815 ?auto_764817 ) ) ( not ( = ?auto_764815 ?auto_764818 ) ) ( not ( = ?auto_764815 ?auto_764819 ) ) ( not ( = ?auto_764815 ?auto_764820 ) ) ( not ( = ?auto_764815 ?auto_764821 ) ) ( not ( = ?auto_764815 ?auto_764822 ) ) ( not ( = ?auto_764815 ?auto_764823 ) ) ( not ( = ?auto_764815 ?auto_764824 ) ) ( not ( = ?auto_764815 ?auto_764825 ) ) ( not ( = ?auto_764815 ?auto_764826 ) ) ( not ( = ?auto_764815 ?auto_764827 ) ) ( not ( = ?auto_764815 ?auto_764828 ) ) ( not ( = ?auto_764815 ?auto_764829 ) ) ( not ( = ?auto_764816 ?auto_764817 ) ) ( not ( = ?auto_764816 ?auto_764818 ) ) ( not ( = ?auto_764816 ?auto_764819 ) ) ( not ( = ?auto_764816 ?auto_764820 ) ) ( not ( = ?auto_764816 ?auto_764821 ) ) ( not ( = ?auto_764816 ?auto_764822 ) ) ( not ( = ?auto_764816 ?auto_764823 ) ) ( not ( = ?auto_764816 ?auto_764824 ) ) ( not ( = ?auto_764816 ?auto_764825 ) ) ( not ( = ?auto_764816 ?auto_764826 ) ) ( not ( = ?auto_764816 ?auto_764827 ) ) ( not ( = ?auto_764816 ?auto_764828 ) ) ( not ( = ?auto_764816 ?auto_764829 ) ) ( not ( = ?auto_764817 ?auto_764818 ) ) ( not ( = ?auto_764817 ?auto_764819 ) ) ( not ( = ?auto_764817 ?auto_764820 ) ) ( not ( = ?auto_764817 ?auto_764821 ) ) ( not ( = ?auto_764817 ?auto_764822 ) ) ( not ( = ?auto_764817 ?auto_764823 ) ) ( not ( = ?auto_764817 ?auto_764824 ) ) ( not ( = ?auto_764817 ?auto_764825 ) ) ( not ( = ?auto_764817 ?auto_764826 ) ) ( not ( = ?auto_764817 ?auto_764827 ) ) ( not ( = ?auto_764817 ?auto_764828 ) ) ( not ( = ?auto_764817 ?auto_764829 ) ) ( not ( = ?auto_764818 ?auto_764819 ) ) ( not ( = ?auto_764818 ?auto_764820 ) ) ( not ( = ?auto_764818 ?auto_764821 ) ) ( not ( = ?auto_764818 ?auto_764822 ) ) ( not ( = ?auto_764818 ?auto_764823 ) ) ( not ( = ?auto_764818 ?auto_764824 ) ) ( not ( = ?auto_764818 ?auto_764825 ) ) ( not ( = ?auto_764818 ?auto_764826 ) ) ( not ( = ?auto_764818 ?auto_764827 ) ) ( not ( = ?auto_764818 ?auto_764828 ) ) ( not ( = ?auto_764818 ?auto_764829 ) ) ( not ( = ?auto_764819 ?auto_764820 ) ) ( not ( = ?auto_764819 ?auto_764821 ) ) ( not ( = ?auto_764819 ?auto_764822 ) ) ( not ( = ?auto_764819 ?auto_764823 ) ) ( not ( = ?auto_764819 ?auto_764824 ) ) ( not ( = ?auto_764819 ?auto_764825 ) ) ( not ( = ?auto_764819 ?auto_764826 ) ) ( not ( = ?auto_764819 ?auto_764827 ) ) ( not ( = ?auto_764819 ?auto_764828 ) ) ( not ( = ?auto_764819 ?auto_764829 ) ) ( not ( = ?auto_764820 ?auto_764821 ) ) ( not ( = ?auto_764820 ?auto_764822 ) ) ( not ( = ?auto_764820 ?auto_764823 ) ) ( not ( = ?auto_764820 ?auto_764824 ) ) ( not ( = ?auto_764820 ?auto_764825 ) ) ( not ( = ?auto_764820 ?auto_764826 ) ) ( not ( = ?auto_764820 ?auto_764827 ) ) ( not ( = ?auto_764820 ?auto_764828 ) ) ( not ( = ?auto_764820 ?auto_764829 ) ) ( not ( = ?auto_764821 ?auto_764822 ) ) ( not ( = ?auto_764821 ?auto_764823 ) ) ( not ( = ?auto_764821 ?auto_764824 ) ) ( not ( = ?auto_764821 ?auto_764825 ) ) ( not ( = ?auto_764821 ?auto_764826 ) ) ( not ( = ?auto_764821 ?auto_764827 ) ) ( not ( = ?auto_764821 ?auto_764828 ) ) ( not ( = ?auto_764821 ?auto_764829 ) ) ( not ( = ?auto_764822 ?auto_764823 ) ) ( not ( = ?auto_764822 ?auto_764824 ) ) ( not ( = ?auto_764822 ?auto_764825 ) ) ( not ( = ?auto_764822 ?auto_764826 ) ) ( not ( = ?auto_764822 ?auto_764827 ) ) ( not ( = ?auto_764822 ?auto_764828 ) ) ( not ( = ?auto_764822 ?auto_764829 ) ) ( not ( = ?auto_764823 ?auto_764824 ) ) ( not ( = ?auto_764823 ?auto_764825 ) ) ( not ( = ?auto_764823 ?auto_764826 ) ) ( not ( = ?auto_764823 ?auto_764827 ) ) ( not ( = ?auto_764823 ?auto_764828 ) ) ( not ( = ?auto_764823 ?auto_764829 ) ) ( not ( = ?auto_764824 ?auto_764825 ) ) ( not ( = ?auto_764824 ?auto_764826 ) ) ( not ( = ?auto_764824 ?auto_764827 ) ) ( not ( = ?auto_764824 ?auto_764828 ) ) ( not ( = ?auto_764824 ?auto_764829 ) ) ( not ( = ?auto_764825 ?auto_764826 ) ) ( not ( = ?auto_764825 ?auto_764827 ) ) ( not ( = ?auto_764825 ?auto_764828 ) ) ( not ( = ?auto_764825 ?auto_764829 ) ) ( not ( = ?auto_764826 ?auto_764827 ) ) ( not ( = ?auto_764826 ?auto_764828 ) ) ( not ( = ?auto_764826 ?auto_764829 ) ) ( not ( = ?auto_764827 ?auto_764828 ) ) ( not ( = ?auto_764827 ?auto_764829 ) ) ( not ( = ?auto_764828 ?auto_764829 ) ) ( CLEAR ?auto_764826 ) ( ON ?auto_764827 ?auto_764828 ) ( CLEAR ?auto_764827 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-17PILE ?auto_764811 ?auto_764812 ?auto_764813 ?auto_764814 ?auto_764815 ?auto_764816 ?auto_764817 ?auto_764818 ?auto_764819 ?auto_764820 ?auto_764821 ?auto_764822 ?auto_764823 ?auto_764824 ?auto_764825 ?auto_764826 ?auto_764827 )
      ( MAKE-18PILE ?auto_764811 ?auto_764812 ?auto_764813 ?auto_764814 ?auto_764815 ?auto_764816 ?auto_764817 ?auto_764818 ?auto_764819 ?auto_764820 ?auto_764821 ?auto_764822 ?auto_764823 ?auto_764824 ?auto_764825 ?auto_764826 ?auto_764827 ?auto_764828 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_764848 - BLOCK
      ?auto_764849 - BLOCK
      ?auto_764850 - BLOCK
      ?auto_764851 - BLOCK
      ?auto_764852 - BLOCK
      ?auto_764853 - BLOCK
      ?auto_764854 - BLOCK
      ?auto_764855 - BLOCK
      ?auto_764856 - BLOCK
      ?auto_764857 - BLOCK
      ?auto_764858 - BLOCK
      ?auto_764859 - BLOCK
      ?auto_764860 - BLOCK
      ?auto_764861 - BLOCK
      ?auto_764862 - BLOCK
      ?auto_764863 - BLOCK
      ?auto_764864 - BLOCK
      ?auto_764865 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_764865 ) ( ON-TABLE ?auto_764848 ) ( ON ?auto_764849 ?auto_764848 ) ( ON ?auto_764850 ?auto_764849 ) ( ON ?auto_764851 ?auto_764850 ) ( ON ?auto_764852 ?auto_764851 ) ( ON ?auto_764853 ?auto_764852 ) ( ON ?auto_764854 ?auto_764853 ) ( ON ?auto_764855 ?auto_764854 ) ( ON ?auto_764856 ?auto_764855 ) ( ON ?auto_764857 ?auto_764856 ) ( ON ?auto_764858 ?auto_764857 ) ( ON ?auto_764859 ?auto_764858 ) ( ON ?auto_764860 ?auto_764859 ) ( ON ?auto_764861 ?auto_764860 ) ( ON ?auto_764862 ?auto_764861 ) ( ON ?auto_764863 ?auto_764862 ) ( not ( = ?auto_764848 ?auto_764849 ) ) ( not ( = ?auto_764848 ?auto_764850 ) ) ( not ( = ?auto_764848 ?auto_764851 ) ) ( not ( = ?auto_764848 ?auto_764852 ) ) ( not ( = ?auto_764848 ?auto_764853 ) ) ( not ( = ?auto_764848 ?auto_764854 ) ) ( not ( = ?auto_764848 ?auto_764855 ) ) ( not ( = ?auto_764848 ?auto_764856 ) ) ( not ( = ?auto_764848 ?auto_764857 ) ) ( not ( = ?auto_764848 ?auto_764858 ) ) ( not ( = ?auto_764848 ?auto_764859 ) ) ( not ( = ?auto_764848 ?auto_764860 ) ) ( not ( = ?auto_764848 ?auto_764861 ) ) ( not ( = ?auto_764848 ?auto_764862 ) ) ( not ( = ?auto_764848 ?auto_764863 ) ) ( not ( = ?auto_764848 ?auto_764864 ) ) ( not ( = ?auto_764848 ?auto_764865 ) ) ( not ( = ?auto_764849 ?auto_764850 ) ) ( not ( = ?auto_764849 ?auto_764851 ) ) ( not ( = ?auto_764849 ?auto_764852 ) ) ( not ( = ?auto_764849 ?auto_764853 ) ) ( not ( = ?auto_764849 ?auto_764854 ) ) ( not ( = ?auto_764849 ?auto_764855 ) ) ( not ( = ?auto_764849 ?auto_764856 ) ) ( not ( = ?auto_764849 ?auto_764857 ) ) ( not ( = ?auto_764849 ?auto_764858 ) ) ( not ( = ?auto_764849 ?auto_764859 ) ) ( not ( = ?auto_764849 ?auto_764860 ) ) ( not ( = ?auto_764849 ?auto_764861 ) ) ( not ( = ?auto_764849 ?auto_764862 ) ) ( not ( = ?auto_764849 ?auto_764863 ) ) ( not ( = ?auto_764849 ?auto_764864 ) ) ( not ( = ?auto_764849 ?auto_764865 ) ) ( not ( = ?auto_764850 ?auto_764851 ) ) ( not ( = ?auto_764850 ?auto_764852 ) ) ( not ( = ?auto_764850 ?auto_764853 ) ) ( not ( = ?auto_764850 ?auto_764854 ) ) ( not ( = ?auto_764850 ?auto_764855 ) ) ( not ( = ?auto_764850 ?auto_764856 ) ) ( not ( = ?auto_764850 ?auto_764857 ) ) ( not ( = ?auto_764850 ?auto_764858 ) ) ( not ( = ?auto_764850 ?auto_764859 ) ) ( not ( = ?auto_764850 ?auto_764860 ) ) ( not ( = ?auto_764850 ?auto_764861 ) ) ( not ( = ?auto_764850 ?auto_764862 ) ) ( not ( = ?auto_764850 ?auto_764863 ) ) ( not ( = ?auto_764850 ?auto_764864 ) ) ( not ( = ?auto_764850 ?auto_764865 ) ) ( not ( = ?auto_764851 ?auto_764852 ) ) ( not ( = ?auto_764851 ?auto_764853 ) ) ( not ( = ?auto_764851 ?auto_764854 ) ) ( not ( = ?auto_764851 ?auto_764855 ) ) ( not ( = ?auto_764851 ?auto_764856 ) ) ( not ( = ?auto_764851 ?auto_764857 ) ) ( not ( = ?auto_764851 ?auto_764858 ) ) ( not ( = ?auto_764851 ?auto_764859 ) ) ( not ( = ?auto_764851 ?auto_764860 ) ) ( not ( = ?auto_764851 ?auto_764861 ) ) ( not ( = ?auto_764851 ?auto_764862 ) ) ( not ( = ?auto_764851 ?auto_764863 ) ) ( not ( = ?auto_764851 ?auto_764864 ) ) ( not ( = ?auto_764851 ?auto_764865 ) ) ( not ( = ?auto_764852 ?auto_764853 ) ) ( not ( = ?auto_764852 ?auto_764854 ) ) ( not ( = ?auto_764852 ?auto_764855 ) ) ( not ( = ?auto_764852 ?auto_764856 ) ) ( not ( = ?auto_764852 ?auto_764857 ) ) ( not ( = ?auto_764852 ?auto_764858 ) ) ( not ( = ?auto_764852 ?auto_764859 ) ) ( not ( = ?auto_764852 ?auto_764860 ) ) ( not ( = ?auto_764852 ?auto_764861 ) ) ( not ( = ?auto_764852 ?auto_764862 ) ) ( not ( = ?auto_764852 ?auto_764863 ) ) ( not ( = ?auto_764852 ?auto_764864 ) ) ( not ( = ?auto_764852 ?auto_764865 ) ) ( not ( = ?auto_764853 ?auto_764854 ) ) ( not ( = ?auto_764853 ?auto_764855 ) ) ( not ( = ?auto_764853 ?auto_764856 ) ) ( not ( = ?auto_764853 ?auto_764857 ) ) ( not ( = ?auto_764853 ?auto_764858 ) ) ( not ( = ?auto_764853 ?auto_764859 ) ) ( not ( = ?auto_764853 ?auto_764860 ) ) ( not ( = ?auto_764853 ?auto_764861 ) ) ( not ( = ?auto_764853 ?auto_764862 ) ) ( not ( = ?auto_764853 ?auto_764863 ) ) ( not ( = ?auto_764853 ?auto_764864 ) ) ( not ( = ?auto_764853 ?auto_764865 ) ) ( not ( = ?auto_764854 ?auto_764855 ) ) ( not ( = ?auto_764854 ?auto_764856 ) ) ( not ( = ?auto_764854 ?auto_764857 ) ) ( not ( = ?auto_764854 ?auto_764858 ) ) ( not ( = ?auto_764854 ?auto_764859 ) ) ( not ( = ?auto_764854 ?auto_764860 ) ) ( not ( = ?auto_764854 ?auto_764861 ) ) ( not ( = ?auto_764854 ?auto_764862 ) ) ( not ( = ?auto_764854 ?auto_764863 ) ) ( not ( = ?auto_764854 ?auto_764864 ) ) ( not ( = ?auto_764854 ?auto_764865 ) ) ( not ( = ?auto_764855 ?auto_764856 ) ) ( not ( = ?auto_764855 ?auto_764857 ) ) ( not ( = ?auto_764855 ?auto_764858 ) ) ( not ( = ?auto_764855 ?auto_764859 ) ) ( not ( = ?auto_764855 ?auto_764860 ) ) ( not ( = ?auto_764855 ?auto_764861 ) ) ( not ( = ?auto_764855 ?auto_764862 ) ) ( not ( = ?auto_764855 ?auto_764863 ) ) ( not ( = ?auto_764855 ?auto_764864 ) ) ( not ( = ?auto_764855 ?auto_764865 ) ) ( not ( = ?auto_764856 ?auto_764857 ) ) ( not ( = ?auto_764856 ?auto_764858 ) ) ( not ( = ?auto_764856 ?auto_764859 ) ) ( not ( = ?auto_764856 ?auto_764860 ) ) ( not ( = ?auto_764856 ?auto_764861 ) ) ( not ( = ?auto_764856 ?auto_764862 ) ) ( not ( = ?auto_764856 ?auto_764863 ) ) ( not ( = ?auto_764856 ?auto_764864 ) ) ( not ( = ?auto_764856 ?auto_764865 ) ) ( not ( = ?auto_764857 ?auto_764858 ) ) ( not ( = ?auto_764857 ?auto_764859 ) ) ( not ( = ?auto_764857 ?auto_764860 ) ) ( not ( = ?auto_764857 ?auto_764861 ) ) ( not ( = ?auto_764857 ?auto_764862 ) ) ( not ( = ?auto_764857 ?auto_764863 ) ) ( not ( = ?auto_764857 ?auto_764864 ) ) ( not ( = ?auto_764857 ?auto_764865 ) ) ( not ( = ?auto_764858 ?auto_764859 ) ) ( not ( = ?auto_764858 ?auto_764860 ) ) ( not ( = ?auto_764858 ?auto_764861 ) ) ( not ( = ?auto_764858 ?auto_764862 ) ) ( not ( = ?auto_764858 ?auto_764863 ) ) ( not ( = ?auto_764858 ?auto_764864 ) ) ( not ( = ?auto_764858 ?auto_764865 ) ) ( not ( = ?auto_764859 ?auto_764860 ) ) ( not ( = ?auto_764859 ?auto_764861 ) ) ( not ( = ?auto_764859 ?auto_764862 ) ) ( not ( = ?auto_764859 ?auto_764863 ) ) ( not ( = ?auto_764859 ?auto_764864 ) ) ( not ( = ?auto_764859 ?auto_764865 ) ) ( not ( = ?auto_764860 ?auto_764861 ) ) ( not ( = ?auto_764860 ?auto_764862 ) ) ( not ( = ?auto_764860 ?auto_764863 ) ) ( not ( = ?auto_764860 ?auto_764864 ) ) ( not ( = ?auto_764860 ?auto_764865 ) ) ( not ( = ?auto_764861 ?auto_764862 ) ) ( not ( = ?auto_764861 ?auto_764863 ) ) ( not ( = ?auto_764861 ?auto_764864 ) ) ( not ( = ?auto_764861 ?auto_764865 ) ) ( not ( = ?auto_764862 ?auto_764863 ) ) ( not ( = ?auto_764862 ?auto_764864 ) ) ( not ( = ?auto_764862 ?auto_764865 ) ) ( not ( = ?auto_764863 ?auto_764864 ) ) ( not ( = ?auto_764863 ?auto_764865 ) ) ( not ( = ?auto_764864 ?auto_764865 ) ) ( CLEAR ?auto_764863 ) ( ON ?auto_764864 ?auto_764865 ) ( CLEAR ?auto_764864 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-17PILE ?auto_764848 ?auto_764849 ?auto_764850 ?auto_764851 ?auto_764852 ?auto_764853 ?auto_764854 ?auto_764855 ?auto_764856 ?auto_764857 ?auto_764858 ?auto_764859 ?auto_764860 ?auto_764861 ?auto_764862 ?auto_764863 ?auto_764864 )
      ( MAKE-18PILE ?auto_764848 ?auto_764849 ?auto_764850 ?auto_764851 ?auto_764852 ?auto_764853 ?auto_764854 ?auto_764855 ?auto_764856 ?auto_764857 ?auto_764858 ?auto_764859 ?auto_764860 ?auto_764861 ?auto_764862 ?auto_764863 ?auto_764864 ?auto_764865 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_764884 - BLOCK
      ?auto_764885 - BLOCK
      ?auto_764886 - BLOCK
      ?auto_764887 - BLOCK
      ?auto_764888 - BLOCK
      ?auto_764889 - BLOCK
      ?auto_764890 - BLOCK
      ?auto_764891 - BLOCK
      ?auto_764892 - BLOCK
      ?auto_764893 - BLOCK
      ?auto_764894 - BLOCK
      ?auto_764895 - BLOCK
      ?auto_764896 - BLOCK
      ?auto_764897 - BLOCK
      ?auto_764898 - BLOCK
      ?auto_764899 - BLOCK
      ?auto_764900 - BLOCK
      ?auto_764901 - BLOCK
    )
    :vars
    (
      ?auto_764902 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_764901 ?auto_764902 ) ( ON-TABLE ?auto_764884 ) ( ON ?auto_764885 ?auto_764884 ) ( ON ?auto_764886 ?auto_764885 ) ( ON ?auto_764887 ?auto_764886 ) ( ON ?auto_764888 ?auto_764887 ) ( ON ?auto_764889 ?auto_764888 ) ( ON ?auto_764890 ?auto_764889 ) ( ON ?auto_764891 ?auto_764890 ) ( ON ?auto_764892 ?auto_764891 ) ( ON ?auto_764893 ?auto_764892 ) ( ON ?auto_764894 ?auto_764893 ) ( ON ?auto_764895 ?auto_764894 ) ( ON ?auto_764896 ?auto_764895 ) ( ON ?auto_764897 ?auto_764896 ) ( ON ?auto_764898 ?auto_764897 ) ( not ( = ?auto_764884 ?auto_764885 ) ) ( not ( = ?auto_764884 ?auto_764886 ) ) ( not ( = ?auto_764884 ?auto_764887 ) ) ( not ( = ?auto_764884 ?auto_764888 ) ) ( not ( = ?auto_764884 ?auto_764889 ) ) ( not ( = ?auto_764884 ?auto_764890 ) ) ( not ( = ?auto_764884 ?auto_764891 ) ) ( not ( = ?auto_764884 ?auto_764892 ) ) ( not ( = ?auto_764884 ?auto_764893 ) ) ( not ( = ?auto_764884 ?auto_764894 ) ) ( not ( = ?auto_764884 ?auto_764895 ) ) ( not ( = ?auto_764884 ?auto_764896 ) ) ( not ( = ?auto_764884 ?auto_764897 ) ) ( not ( = ?auto_764884 ?auto_764898 ) ) ( not ( = ?auto_764884 ?auto_764899 ) ) ( not ( = ?auto_764884 ?auto_764900 ) ) ( not ( = ?auto_764884 ?auto_764901 ) ) ( not ( = ?auto_764884 ?auto_764902 ) ) ( not ( = ?auto_764885 ?auto_764886 ) ) ( not ( = ?auto_764885 ?auto_764887 ) ) ( not ( = ?auto_764885 ?auto_764888 ) ) ( not ( = ?auto_764885 ?auto_764889 ) ) ( not ( = ?auto_764885 ?auto_764890 ) ) ( not ( = ?auto_764885 ?auto_764891 ) ) ( not ( = ?auto_764885 ?auto_764892 ) ) ( not ( = ?auto_764885 ?auto_764893 ) ) ( not ( = ?auto_764885 ?auto_764894 ) ) ( not ( = ?auto_764885 ?auto_764895 ) ) ( not ( = ?auto_764885 ?auto_764896 ) ) ( not ( = ?auto_764885 ?auto_764897 ) ) ( not ( = ?auto_764885 ?auto_764898 ) ) ( not ( = ?auto_764885 ?auto_764899 ) ) ( not ( = ?auto_764885 ?auto_764900 ) ) ( not ( = ?auto_764885 ?auto_764901 ) ) ( not ( = ?auto_764885 ?auto_764902 ) ) ( not ( = ?auto_764886 ?auto_764887 ) ) ( not ( = ?auto_764886 ?auto_764888 ) ) ( not ( = ?auto_764886 ?auto_764889 ) ) ( not ( = ?auto_764886 ?auto_764890 ) ) ( not ( = ?auto_764886 ?auto_764891 ) ) ( not ( = ?auto_764886 ?auto_764892 ) ) ( not ( = ?auto_764886 ?auto_764893 ) ) ( not ( = ?auto_764886 ?auto_764894 ) ) ( not ( = ?auto_764886 ?auto_764895 ) ) ( not ( = ?auto_764886 ?auto_764896 ) ) ( not ( = ?auto_764886 ?auto_764897 ) ) ( not ( = ?auto_764886 ?auto_764898 ) ) ( not ( = ?auto_764886 ?auto_764899 ) ) ( not ( = ?auto_764886 ?auto_764900 ) ) ( not ( = ?auto_764886 ?auto_764901 ) ) ( not ( = ?auto_764886 ?auto_764902 ) ) ( not ( = ?auto_764887 ?auto_764888 ) ) ( not ( = ?auto_764887 ?auto_764889 ) ) ( not ( = ?auto_764887 ?auto_764890 ) ) ( not ( = ?auto_764887 ?auto_764891 ) ) ( not ( = ?auto_764887 ?auto_764892 ) ) ( not ( = ?auto_764887 ?auto_764893 ) ) ( not ( = ?auto_764887 ?auto_764894 ) ) ( not ( = ?auto_764887 ?auto_764895 ) ) ( not ( = ?auto_764887 ?auto_764896 ) ) ( not ( = ?auto_764887 ?auto_764897 ) ) ( not ( = ?auto_764887 ?auto_764898 ) ) ( not ( = ?auto_764887 ?auto_764899 ) ) ( not ( = ?auto_764887 ?auto_764900 ) ) ( not ( = ?auto_764887 ?auto_764901 ) ) ( not ( = ?auto_764887 ?auto_764902 ) ) ( not ( = ?auto_764888 ?auto_764889 ) ) ( not ( = ?auto_764888 ?auto_764890 ) ) ( not ( = ?auto_764888 ?auto_764891 ) ) ( not ( = ?auto_764888 ?auto_764892 ) ) ( not ( = ?auto_764888 ?auto_764893 ) ) ( not ( = ?auto_764888 ?auto_764894 ) ) ( not ( = ?auto_764888 ?auto_764895 ) ) ( not ( = ?auto_764888 ?auto_764896 ) ) ( not ( = ?auto_764888 ?auto_764897 ) ) ( not ( = ?auto_764888 ?auto_764898 ) ) ( not ( = ?auto_764888 ?auto_764899 ) ) ( not ( = ?auto_764888 ?auto_764900 ) ) ( not ( = ?auto_764888 ?auto_764901 ) ) ( not ( = ?auto_764888 ?auto_764902 ) ) ( not ( = ?auto_764889 ?auto_764890 ) ) ( not ( = ?auto_764889 ?auto_764891 ) ) ( not ( = ?auto_764889 ?auto_764892 ) ) ( not ( = ?auto_764889 ?auto_764893 ) ) ( not ( = ?auto_764889 ?auto_764894 ) ) ( not ( = ?auto_764889 ?auto_764895 ) ) ( not ( = ?auto_764889 ?auto_764896 ) ) ( not ( = ?auto_764889 ?auto_764897 ) ) ( not ( = ?auto_764889 ?auto_764898 ) ) ( not ( = ?auto_764889 ?auto_764899 ) ) ( not ( = ?auto_764889 ?auto_764900 ) ) ( not ( = ?auto_764889 ?auto_764901 ) ) ( not ( = ?auto_764889 ?auto_764902 ) ) ( not ( = ?auto_764890 ?auto_764891 ) ) ( not ( = ?auto_764890 ?auto_764892 ) ) ( not ( = ?auto_764890 ?auto_764893 ) ) ( not ( = ?auto_764890 ?auto_764894 ) ) ( not ( = ?auto_764890 ?auto_764895 ) ) ( not ( = ?auto_764890 ?auto_764896 ) ) ( not ( = ?auto_764890 ?auto_764897 ) ) ( not ( = ?auto_764890 ?auto_764898 ) ) ( not ( = ?auto_764890 ?auto_764899 ) ) ( not ( = ?auto_764890 ?auto_764900 ) ) ( not ( = ?auto_764890 ?auto_764901 ) ) ( not ( = ?auto_764890 ?auto_764902 ) ) ( not ( = ?auto_764891 ?auto_764892 ) ) ( not ( = ?auto_764891 ?auto_764893 ) ) ( not ( = ?auto_764891 ?auto_764894 ) ) ( not ( = ?auto_764891 ?auto_764895 ) ) ( not ( = ?auto_764891 ?auto_764896 ) ) ( not ( = ?auto_764891 ?auto_764897 ) ) ( not ( = ?auto_764891 ?auto_764898 ) ) ( not ( = ?auto_764891 ?auto_764899 ) ) ( not ( = ?auto_764891 ?auto_764900 ) ) ( not ( = ?auto_764891 ?auto_764901 ) ) ( not ( = ?auto_764891 ?auto_764902 ) ) ( not ( = ?auto_764892 ?auto_764893 ) ) ( not ( = ?auto_764892 ?auto_764894 ) ) ( not ( = ?auto_764892 ?auto_764895 ) ) ( not ( = ?auto_764892 ?auto_764896 ) ) ( not ( = ?auto_764892 ?auto_764897 ) ) ( not ( = ?auto_764892 ?auto_764898 ) ) ( not ( = ?auto_764892 ?auto_764899 ) ) ( not ( = ?auto_764892 ?auto_764900 ) ) ( not ( = ?auto_764892 ?auto_764901 ) ) ( not ( = ?auto_764892 ?auto_764902 ) ) ( not ( = ?auto_764893 ?auto_764894 ) ) ( not ( = ?auto_764893 ?auto_764895 ) ) ( not ( = ?auto_764893 ?auto_764896 ) ) ( not ( = ?auto_764893 ?auto_764897 ) ) ( not ( = ?auto_764893 ?auto_764898 ) ) ( not ( = ?auto_764893 ?auto_764899 ) ) ( not ( = ?auto_764893 ?auto_764900 ) ) ( not ( = ?auto_764893 ?auto_764901 ) ) ( not ( = ?auto_764893 ?auto_764902 ) ) ( not ( = ?auto_764894 ?auto_764895 ) ) ( not ( = ?auto_764894 ?auto_764896 ) ) ( not ( = ?auto_764894 ?auto_764897 ) ) ( not ( = ?auto_764894 ?auto_764898 ) ) ( not ( = ?auto_764894 ?auto_764899 ) ) ( not ( = ?auto_764894 ?auto_764900 ) ) ( not ( = ?auto_764894 ?auto_764901 ) ) ( not ( = ?auto_764894 ?auto_764902 ) ) ( not ( = ?auto_764895 ?auto_764896 ) ) ( not ( = ?auto_764895 ?auto_764897 ) ) ( not ( = ?auto_764895 ?auto_764898 ) ) ( not ( = ?auto_764895 ?auto_764899 ) ) ( not ( = ?auto_764895 ?auto_764900 ) ) ( not ( = ?auto_764895 ?auto_764901 ) ) ( not ( = ?auto_764895 ?auto_764902 ) ) ( not ( = ?auto_764896 ?auto_764897 ) ) ( not ( = ?auto_764896 ?auto_764898 ) ) ( not ( = ?auto_764896 ?auto_764899 ) ) ( not ( = ?auto_764896 ?auto_764900 ) ) ( not ( = ?auto_764896 ?auto_764901 ) ) ( not ( = ?auto_764896 ?auto_764902 ) ) ( not ( = ?auto_764897 ?auto_764898 ) ) ( not ( = ?auto_764897 ?auto_764899 ) ) ( not ( = ?auto_764897 ?auto_764900 ) ) ( not ( = ?auto_764897 ?auto_764901 ) ) ( not ( = ?auto_764897 ?auto_764902 ) ) ( not ( = ?auto_764898 ?auto_764899 ) ) ( not ( = ?auto_764898 ?auto_764900 ) ) ( not ( = ?auto_764898 ?auto_764901 ) ) ( not ( = ?auto_764898 ?auto_764902 ) ) ( not ( = ?auto_764899 ?auto_764900 ) ) ( not ( = ?auto_764899 ?auto_764901 ) ) ( not ( = ?auto_764899 ?auto_764902 ) ) ( not ( = ?auto_764900 ?auto_764901 ) ) ( not ( = ?auto_764900 ?auto_764902 ) ) ( not ( = ?auto_764901 ?auto_764902 ) ) ( ON ?auto_764900 ?auto_764901 ) ( CLEAR ?auto_764898 ) ( ON ?auto_764899 ?auto_764900 ) ( CLEAR ?auto_764899 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-16PILE ?auto_764884 ?auto_764885 ?auto_764886 ?auto_764887 ?auto_764888 ?auto_764889 ?auto_764890 ?auto_764891 ?auto_764892 ?auto_764893 ?auto_764894 ?auto_764895 ?auto_764896 ?auto_764897 ?auto_764898 ?auto_764899 )
      ( MAKE-18PILE ?auto_764884 ?auto_764885 ?auto_764886 ?auto_764887 ?auto_764888 ?auto_764889 ?auto_764890 ?auto_764891 ?auto_764892 ?auto_764893 ?auto_764894 ?auto_764895 ?auto_764896 ?auto_764897 ?auto_764898 ?auto_764899 ?auto_764900 ?auto_764901 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_764921 - BLOCK
      ?auto_764922 - BLOCK
      ?auto_764923 - BLOCK
      ?auto_764924 - BLOCK
      ?auto_764925 - BLOCK
      ?auto_764926 - BLOCK
      ?auto_764927 - BLOCK
      ?auto_764928 - BLOCK
      ?auto_764929 - BLOCK
      ?auto_764930 - BLOCK
      ?auto_764931 - BLOCK
      ?auto_764932 - BLOCK
      ?auto_764933 - BLOCK
      ?auto_764934 - BLOCK
      ?auto_764935 - BLOCK
      ?auto_764936 - BLOCK
      ?auto_764937 - BLOCK
      ?auto_764938 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_764938 ) ( ON-TABLE ?auto_764921 ) ( ON ?auto_764922 ?auto_764921 ) ( ON ?auto_764923 ?auto_764922 ) ( ON ?auto_764924 ?auto_764923 ) ( ON ?auto_764925 ?auto_764924 ) ( ON ?auto_764926 ?auto_764925 ) ( ON ?auto_764927 ?auto_764926 ) ( ON ?auto_764928 ?auto_764927 ) ( ON ?auto_764929 ?auto_764928 ) ( ON ?auto_764930 ?auto_764929 ) ( ON ?auto_764931 ?auto_764930 ) ( ON ?auto_764932 ?auto_764931 ) ( ON ?auto_764933 ?auto_764932 ) ( ON ?auto_764934 ?auto_764933 ) ( ON ?auto_764935 ?auto_764934 ) ( not ( = ?auto_764921 ?auto_764922 ) ) ( not ( = ?auto_764921 ?auto_764923 ) ) ( not ( = ?auto_764921 ?auto_764924 ) ) ( not ( = ?auto_764921 ?auto_764925 ) ) ( not ( = ?auto_764921 ?auto_764926 ) ) ( not ( = ?auto_764921 ?auto_764927 ) ) ( not ( = ?auto_764921 ?auto_764928 ) ) ( not ( = ?auto_764921 ?auto_764929 ) ) ( not ( = ?auto_764921 ?auto_764930 ) ) ( not ( = ?auto_764921 ?auto_764931 ) ) ( not ( = ?auto_764921 ?auto_764932 ) ) ( not ( = ?auto_764921 ?auto_764933 ) ) ( not ( = ?auto_764921 ?auto_764934 ) ) ( not ( = ?auto_764921 ?auto_764935 ) ) ( not ( = ?auto_764921 ?auto_764936 ) ) ( not ( = ?auto_764921 ?auto_764937 ) ) ( not ( = ?auto_764921 ?auto_764938 ) ) ( not ( = ?auto_764922 ?auto_764923 ) ) ( not ( = ?auto_764922 ?auto_764924 ) ) ( not ( = ?auto_764922 ?auto_764925 ) ) ( not ( = ?auto_764922 ?auto_764926 ) ) ( not ( = ?auto_764922 ?auto_764927 ) ) ( not ( = ?auto_764922 ?auto_764928 ) ) ( not ( = ?auto_764922 ?auto_764929 ) ) ( not ( = ?auto_764922 ?auto_764930 ) ) ( not ( = ?auto_764922 ?auto_764931 ) ) ( not ( = ?auto_764922 ?auto_764932 ) ) ( not ( = ?auto_764922 ?auto_764933 ) ) ( not ( = ?auto_764922 ?auto_764934 ) ) ( not ( = ?auto_764922 ?auto_764935 ) ) ( not ( = ?auto_764922 ?auto_764936 ) ) ( not ( = ?auto_764922 ?auto_764937 ) ) ( not ( = ?auto_764922 ?auto_764938 ) ) ( not ( = ?auto_764923 ?auto_764924 ) ) ( not ( = ?auto_764923 ?auto_764925 ) ) ( not ( = ?auto_764923 ?auto_764926 ) ) ( not ( = ?auto_764923 ?auto_764927 ) ) ( not ( = ?auto_764923 ?auto_764928 ) ) ( not ( = ?auto_764923 ?auto_764929 ) ) ( not ( = ?auto_764923 ?auto_764930 ) ) ( not ( = ?auto_764923 ?auto_764931 ) ) ( not ( = ?auto_764923 ?auto_764932 ) ) ( not ( = ?auto_764923 ?auto_764933 ) ) ( not ( = ?auto_764923 ?auto_764934 ) ) ( not ( = ?auto_764923 ?auto_764935 ) ) ( not ( = ?auto_764923 ?auto_764936 ) ) ( not ( = ?auto_764923 ?auto_764937 ) ) ( not ( = ?auto_764923 ?auto_764938 ) ) ( not ( = ?auto_764924 ?auto_764925 ) ) ( not ( = ?auto_764924 ?auto_764926 ) ) ( not ( = ?auto_764924 ?auto_764927 ) ) ( not ( = ?auto_764924 ?auto_764928 ) ) ( not ( = ?auto_764924 ?auto_764929 ) ) ( not ( = ?auto_764924 ?auto_764930 ) ) ( not ( = ?auto_764924 ?auto_764931 ) ) ( not ( = ?auto_764924 ?auto_764932 ) ) ( not ( = ?auto_764924 ?auto_764933 ) ) ( not ( = ?auto_764924 ?auto_764934 ) ) ( not ( = ?auto_764924 ?auto_764935 ) ) ( not ( = ?auto_764924 ?auto_764936 ) ) ( not ( = ?auto_764924 ?auto_764937 ) ) ( not ( = ?auto_764924 ?auto_764938 ) ) ( not ( = ?auto_764925 ?auto_764926 ) ) ( not ( = ?auto_764925 ?auto_764927 ) ) ( not ( = ?auto_764925 ?auto_764928 ) ) ( not ( = ?auto_764925 ?auto_764929 ) ) ( not ( = ?auto_764925 ?auto_764930 ) ) ( not ( = ?auto_764925 ?auto_764931 ) ) ( not ( = ?auto_764925 ?auto_764932 ) ) ( not ( = ?auto_764925 ?auto_764933 ) ) ( not ( = ?auto_764925 ?auto_764934 ) ) ( not ( = ?auto_764925 ?auto_764935 ) ) ( not ( = ?auto_764925 ?auto_764936 ) ) ( not ( = ?auto_764925 ?auto_764937 ) ) ( not ( = ?auto_764925 ?auto_764938 ) ) ( not ( = ?auto_764926 ?auto_764927 ) ) ( not ( = ?auto_764926 ?auto_764928 ) ) ( not ( = ?auto_764926 ?auto_764929 ) ) ( not ( = ?auto_764926 ?auto_764930 ) ) ( not ( = ?auto_764926 ?auto_764931 ) ) ( not ( = ?auto_764926 ?auto_764932 ) ) ( not ( = ?auto_764926 ?auto_764933 ) ) ( not ( = ?auto_764926 ?auto_764934 ) ) ( not ( = ?auto_764926 ?auto_764935 ) ) ( not ( = ?auto_764926 ?auto_764936 ) ) ( not ( = ?auto_764926 ?auto_764937 ) ) ( not ( = ?auto_764926 ?auto_764938 ) ) ( not ( = ?auto_764927 ?auto_764928 ) ) ( not ( = ?auto_764927 ?auto_764929 ) ) ( not ( = ?auto_764927 ?auto_764930 ) ) ( not ( = ?auto_764927 ?auto_764931 ) ) ( not ( = ?auto_764927 ?auto_764932 ) ) ( not ( = ?auto_764927 ?auto_764933 ) ) ( not ( = ?auto_764927 ?auto_764934 ) ) ( not ( = ?auto_764927 ?auto_764935 ) ) ( not ( = ?auto_764927 ?auto_764936 ) ) ( not ( = ?auto_764927 ?auto_764937 ) ) ( not ( = ?auto_764927 ?auto_764938 ) ) ( not ( = ?auto_764928 ?auto_764929 ) ) ( not ( = ?auto_764928 ?auto_764930 ) ) ( not ( = ?auto_764928 ?auto_764931 ) ) ( not ( = ?auto_764928 ?auto_764932 ) ) ( not ( = ?auto_764928 ?auto_764933 ) ) ( not ( = ?auto_764928 ?auto_764934 ) ) ( not ( = ?auto_764928 ?auto_764935 ) ) ( not ( = ?auto_764928 ?auto_764936 ) ) ( not ( = ?auto_764928 ?auto_764937 ) ) ( not ( = ?auto_764928 ?auto_764938 ) ) ( not ( = ?auto_764929 ?auto_764930 ) ) ( not ( = ?auto_764929 ?auto_764931 ) ) ( not ( = ?auto_764929 ?auto_764932 ) ) ( not ( = ?auto_764929 ?auto_764933 ) ) ( not ( = ?auto_764929 ?auto_764934 ) ) ( not ( = ?auto_764929 ?auto_764935 ) ) ( not ( = ?auto_764929 ?auto_764936 ) ) ( not ( = ?auto_764929 ?auto_764937 ) ) ( not ( = ?auto_764929 ?auto_764938 ) ) ( not ( = ?auto_764930 ?auto_764931 ) ) ( not ( = ?auto_764930 ?auto_764932 ) ) ( not ( = ?auto_764930 ?auto_764933 ) ) ( not ( = ?auto_764930 ?auto_764934 ) ) ( not ( = ?auto_764930 ?auto_764935 ) ) ( not ( = ?auto_764930 ?auto_764936 ) ) ( not ( = ?auto_764930 ?auto_764937 ) ) ( not ( = ?auto_764930 ?auto_764938 ) ) ( not ( = ?auto_764931 ?auto_764932 ) ) ( not ( = ?auto_764931 ?auto_764933 ) ) ( not ( = ?auto_764931 ?auto_764934 ) ) ( not ( = ?auto_764931 ?auto_764935 ) ) ( not ( = ?auto_764931 ?auto_764936 ) ) ( not ( = ?auto_764931 ?auto_764937 ) ) ( not ( = ?auto_764931 ?auto_764938 ) ) ( not ( = ?auto_764932 ?auto_764933 ) ) ( not ( = ?auto_764932 ?auto_764934 ) ) ( not ( = ?auto_764932 ?auto_764935 ) ) ( not ( = ?auto_764932 ?auto_764936 ) ) ( not ( = ?auto_764932 ?auto_764937 ) ) ( not ( = ?auto_764932 ?auto_764938 ) ) ( not ( = ?auto_764933 ?auto_764934 ) ) ( not ( = ?auto_764933 ?auto_764935 ) ) ( not ( = ?auto_764933 ?auto_764936 ) ) ( not ( = ?auto_764933 ?auto_764937 ) ) ( not ( = ?auto_764933 ?auto_764938 ) ) ( not ( = ?auto_764934 ?auto_764935 ) ) ( not ( = ?auto_764934 ?auto_764936 ) ) ( not ( = ?auto_764934 ?auto_764937 ) ) ( not ( = ?auto_764934 ?auto_764938 ) ) ( not ( = ?auto_764935 ?auto_764936 ) ) ( not ( = ?auto_764935 ?auto_764937 ) ) ( not ( = ?auto_764935 ?auto_764938 ) ) ( not ( = ?auto_764936 ?auto_764937 ) ) ( not ( = ?auto_764936 ?auto_764938 ) ) ( not ( = ?auto_764937 ?auto_764938 ) ) ( ON ?auto_764937 ?auto_764938 ) ( CLEAR ?auto_764935 ) ( ON ?auto_764936 ?auto_764937 ) ( CLEAR ?auto_764936 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-16PILE ?auto_764921 ?auto_764922 ?auto_764923 ?auto_764924 ?auto_764925 ?auto_764926 ?auto_764927 ?auto_764928 ?auto_764929 ?auto_764930 ?auto_764931 ?auto_764932 ?auto_764933 ?auto_764934 ?auto_764935 ?auto_764936 )
      ( MAKE-18PILE ?auto_764921 ?auto_764922 ?auto_764923 ?auto_764924 ?auto_764925 ?auto_764926 ?auto_764927 ?auto_764928 ?auto_764929 ?auto_764930 ?auto_764931 ?auto_764932 ?auto_764933 ?auto_764934 ?auto_764935 ?auto_764936 ?auto_764937 ?auto_764938 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_764957 - BLOCK
      ?auto_764958 - BLOCK
      ?auto_764959 - BLOCK
      ?auto_764960 - BLOCK
      ?auto_764961 - BLOCK
      ?auto_764962 - BLOCK
      ?auto_764963 - BLOCK
      ?auto_764964 - BLOCK
      ?auto_764965 - BLOCK
      ?auto_764966 - BLOCK
      ?auto_764967 - BLOCK
      ?auto_764968 - BLOCK
      ?auto_764969 - BLOCK
      ?auto_764970 - BLOCK
      ?auto_764971 - BLOCK
      ?auto_764972 - BLOCK
      ?auto_764973 - BLOCK
      ?auto_764974 - BLOCK
    )
    :vars
    (
      ?auto_764975 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_764974 ?auto_764975 ) ( ON-TABLE ?auto_764957 ) ( ON ?auto_764958 ?auto_764957 ) ( ON ?auto_764959 ?auto_764958 ) ( ON ?auto_764960 ?auto_764959 ) ( ON ?auto_764961 ?auto_764960 ) ( ON ?auto_764962 ?auto_764961 ) ( ON ?auto_764963 ?auto_764962 ) ( ON ?auto_764964 ?auto_764963 ) ( ON ?auto_764965 ?auto_764964 ) ( ON ?auto_764966 ?auto_764965 ) ( ON ?auto_764967 ?auto_764966 ) ( ON ?auto_764968 ?auto_764967 ) ( ON ?auto_764969 ?auto_764968 ) ( ON ?auto_764970 ?auto_764969 ) ( not ( = ?auto_764957 ?auto_764958 ) ) ( not ( = ?auto_764957 ?auto_764959 ) ) ( not ( = ?auto_764957 ?auto_764960 ) ) ( not ( = ?auto_764957 ?auto_764961 ) ) ( not ( = ?auto_764957 ?auto_764962 ) ) ( not ( = ?auto_764957 ?auto_764963 ) ) ( not ( = ?auto_764957 ?auto_764964 ) ) ( not ( = ?auto_764957 ?auto_764965 ) ) ( not ( = ?auto_764957 ?auto_764966 ) ) ( not ( = ?auto_764957 ?auto_764967 ) ) ( not ( = ?auto_764957 ?auto_764968 ) ) ( not ( = ?auto_764957 ?auto_764969 ) ) ( not ( = ?auto_764957 ?auto_764970 ) ) ( not ( = ?auto_764957 ?auto_764971 ) ) ( not ( = ?auto_764957 ?auto_764972 ) ) ( not ( = ?auto_764957 ?auto_764973 ) ) ( not ( = ?auto_764957 ?auto_764974 ) ) ( not ( = ?auto_764957 ?auto_764975 ) ) ( not ( = ?auto_764958 ?auto_764959 ) ) ( not ( = ?auto_764958 ?auto_764960 ) ) ( not ( = ?auto_764958 ?auto_764961 ) ) ( not ( = ?auto_764958 ?auto_764962 ) ) ( not ( = ?auto_764958 ?auto_764963 ) ) ( not ( = ?auto_764958 ?auto_764964 ) ) ( not ( = ?auto_764958 ?auto_764965 ) ) ( not ( = ?auto_764958 ?auto_764966 ) ) ( not ( = ?auto_764958 ?auto_764967 ) ) ( not ( = ?auto_764958 ?auto_764968 ) ) ( not ( = ?auto_764958 ?auto_764969 ) ) ( not ( = ?auto_764958 ?auto_764970 ) ) ( not ( = ?auto_764958 ?auto_764971 ) ) ( not ( = ?auto_764958 ?auto_764972 ) ) ( not ( = ?auto_764958 ?auto_764973 ) ) ( not ( = ?auto_764958 ?auto_764974 ) ) ( not ( = ?auto_764958 ?auto_764975 ) ) ( not ( = ?auto_764959 ?auto_764960 ) ) ( not ( = ?auto_764959 ?auto_764961 ) ) ( not ( = ?auto_764959 ?auto_764962 ) ) ( not ( = ?auto_764959 ?auto_764963 ) ) ( not ( = ?auto_764959 ?auto_764964 ) ) ( not ( = ?auto_764959 ?auto_764965 ) ) ( not ( = ?auto_764959 ?auto_764966 ) ) ( not ( = ?auto_764959 ?auto_764967 ) ) ( not ( = ?auto_764959 ?auto_764968 ) ) ( not ( = ?auto_764959 ?auto_764969 ) ) ( not ( = ?auto_764959 ?auto_764970 ) ) ( not ( = ?auto_764959 ?auto_764971 ) ) ( not ( = ?auto_764959 ?auto_764972 ) ) ( not ( = ?auto_764959 ?auto_764973 ) ) ( not ( = ?auto_764959 ?auto_764974 ) ) ( not ( = ?auto_764959 ?auto_764975 ) ) ( not ( = ?auto_764960 ?auto_764961 ) ) ( not ( = ?auto_764960 ?auto_764962 ) ) ( not ( = ?auto_764960 ?auto_764963 ) ) ( not ( = ?auto_764960 ?auto_764964 ) ) ( not ( = ?auto_764960 ?auto_764965 ) ) ( not ( = ?auto_764960 ?auto_764966 ) ) ( not ( = ?auto_764960 ?auto_764967 ) ) ( not ( = ?auto_764960 ?auto_764968 ) ) ( not ( = ?auto_764960 ?auto_764969 ) ) ( not ( = ?auto_764960 ?auto_764970 ) ) ( not ( = ?auto_764960 ?auto_764971 ) ) ( not ( = ?auto_764960 ?auto_764972 ) ) ( not ( = ?auto_764960 ?auto_764973 ) ) ( not ( = ?auto_764960 ?auto_764974 ) ) ( not ( = ?auto_764960 ?auto_764975 ) ) ( not ( = ?auto_764961 ?auto_764962 ) ) ( not ( = ?auto_764961 ?auto_764963 ) ) ( not ( = ?auto_764961 ?auto_764964 ) ) ( not ( = ?auto_764961 ?auto_764965 ) ) ( not ( = ?auto_764961 ?auto_764966 ) ) ( not ( = ?auto_764961 ?auto_764967 ) ) ( not ( = ?auto_764961 ?auto_764968 ) ) ( not ( = ?auto_764961 ?auto_764969 ) ) ( not ( = ?auto_764961 ?auto_764970 ) ) ( not ( = ?auto_764961 ?auto_764971 ) ) ( not ( = ?auto_764961 ?auto_764972 ) ) ( not ( = ?auto_764961 ?auto_764973 ) ) ( not ( = ?auto_764961 ?auto_764974 ) ) ( not ( = ?auto_764961 ?auto_764975 ) ) ( not ( = ?auto_764962 ?auto_764963 ) ) ( not ( = ?auto_764962 ?auto_764964 ) ) ( not ( = ?auto_764962 ?auto_764965 ) ) ( not ( = ?auto_764962 ?auto_764966 ) ) ( not ( = ?auto_764962 ?auto_764967 ) ) ( not ( = ?auto_764962 ?auto_764968 ) ) ( not ( = ?auto_764962 ?auto_764969 ) ) ( not ( = ?auto_764962 ?auto_764970 ) ) ( not ( = ?auto_764962 ?auto_764971 ) ) ( not ( = ?auto_764962 ?auto_764972 ) ) ( not ( = ?auto_764962 ?auto_764973 ) ) ( not ( = ?auto_764962 ?auto_764974 ) ) ( not ( = ?auto_764962 ?auto_764975 ) ) ( not ( = ?auto_764963 ?auto_764964 ) ) ( not ( = ?auto_764963 ?auto_764965 ) ) ( not ( = ?auto_764963 ?auto_764966 ) ) ( not ( = ?auto_764963 ?auto_764967 ) ) ( not ( = ?auto_764963 ?auto_764968 ) ) ( not ( = ?auto_764963 ?auto_764969 ) ) ( not ( = ?auto_764963 ?auto_764970 ) ) ( not ( = ?auto_764963 ?auto_764971 ) ) ( not ( = ?auto_764963 ?auto_764972 ) ) ( not ( = ?auto_764963 ?auto_764973 ) ) ( not ( = ?auto_764963 ?auto_764974 ) ) ( not ( = ?auto_764963 ?auto_764975 ) ) ( not ( = ?auto_764964 ?auto_764965 ) ) ( not ( = ?auto_764964 ?auto_764966 ) ) ( not ( = ?auto_764964 ?auto_764967 ) ) ( not ( = ?auto_764964 ?auto_764968 ) ) ( not ( = ?auto_764964 ?auto_764969 ) ) ( not ( = ?auto_764964 ?auto_764970 ) ) ( not ( = ?auto_764964 ?auto_764971 ) ) ( not ( = ?auto_764964 ?auto_764972 ) ) ( not ( = ?auto_764964 ?auto_764973 ) ) ( not ( = ?auto_764964 ?auto_764974 ) ) ( not ( = ?auto_764964 ?auto_764975 ) ) ( not ( = ?auto_764965 ?auto_764966 ) ) ( not ( = ?auto_764965 ?auto_764967 ) ) ( not ( = ?auto_764965 ?auto_764968 ) ) ( not ( = ?auto_764965 ?auto_764969 ) ) ( not ( = ?auto_764965 ?auto_764970 ) ) ( not ( = ?auto_764965 ?auto_764971 ) ) ( not ( = ?auto_764965 ?auto_764972 ) ) ( not ( = ?auto_764965 ?auto_764973 ) ) ( not ( = ?auto_764965 ?auto_764974 ) ) ( not ( = ?auto_764965 ?auto_764975 ) ) ( not ( = ?auto_764966 ?auto_764967 ) ) ( not ( = ?auto_764966 ?auto_764968 ) ) ( not ( = ?auto_764966 ?auto_764969 ) ) ( not ( = ?auto_764966 ?auto_764970 ) ) ( not ( = ?auto_764966 ?auto_764971 ) ) ( not ( = ?auto_764966 ?auto_764972 ) ) ( not ( = ?auto_764966 ?auto_764973 ) ) ( not ( = ?auto_764966 ?auto_764974 ) ) ( not ( = ?auto_764966 ?auto_764975 ) ) ( not ( = ?auto_764967 ?auto_764968 ) ) ( not ( = ?auto_764967 ?auto_764969 ) ) ( not ( = ?auto_764967 ?auto_764970 ) ) ( not ( = ?auto_764967 ?auto_764971 ) ) ( not ( = ?auto_764967 ?auto_764972 ) ) ( not ( = ?auto_764967 ?auto_764973 ) ) ( not ( = ?auto_764967 ?auto_764974 ) ) ( not ( = ?auto_764967 ?auto_764975 ) ) ( not ( = ?auto_764968 ?auto_764969 ) ) ( not ( = ?auto_764968 ?auto_764970 ) ) ( not ( = ?auto_764968 ?auto_764971 ) ) ( not ( = ?auto_764968 ?auto_764972 ) ) ( not ( = ?auto_764968 ?auto_764973 ) ) ( not ( = ?auto_764968 ?auto_764974 ) ) ( not ( = ?auto_764968 ?auto_764975 ) ) ( not ( = ?auto_764969 ?auto_764970 ) ) ( not ( = ?auto_764969 ?auto_764971 ) ) ( not ( = ?auto_764969 ?auto_764972 ) ) ( not ( = ?auto_764969 ?auto_764973 ) ) ( not ( = ?auto_764969 ?auto_764974 ) ) ( not ( = ?auto_764969 ?auto_764975 ) ) ( not ( = ?auto_764970 ?auto_764971 ) ) ( not ( = ?auto_764970 ?auto_764972 ) ) ( not ( = ?auto_764970 ?auto_764973 ) ) ( not ( = ?auto_764970 ?auto_764974 ) ) ( not ( = ?auto_764970 ?auto_764975 ) ) ( not ( = ?auto_764971 ?auto_764972 ) ) ( not ( = ?auto_764971 ?auto_764973 ) ) ( not ( = ?auto_764971 ?auto_764974 ) ) ( not ( = ?auto_764971 ?auto_764975 ) ) ( not ( = ?auto_764972 ?auto_764973 ) ) ( not ( = ?auto_764972 ?auto_764974 ) ) ( not ( = ?auto_764972 ?auto_764975 ) ) ( not ( = ?auto_764973 ?auto_764974 ) ) ( not ( = ?auto_764973 ?auto_764975 ) ) ( not ( = ?auto_764974 ?auto_764975 ) ) ( ON ?auto_764973 ?auto_764974 ) ( ON ?auto_764972 ?auto_764973 ) ( CLEAR ?auto_764970 ) ( ON ?auto_764971 ?auto_764972 ) ( CLEAR ?auto_764971 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_764957 ?auto_764958 ?auto_764959 ?auto_764960 ?auto_764961 ?auto_764962 ?auto_764963 ?auto_764964 ?auto_764965 ?auto_764966 ?auto_764967 ?auto_764968 ?auto_764969 ?auto_764970 ?auto_764971 )
      ( MAKE-18PILE ?auto_764957 ?auto_764958 ?auto_764959 ?auto_764960 ?auto_764961 ?auto_764962 ?auto_764963 ?auto_764964 ?auto_764965 ?auto_764966 ?auto_764967 ?auto_764968 ?auto_764969 ?auto_764970 ?auto_764971 ?auto_764972 ?auto_764973 ?auto_764974 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_764994 - BLOCK
      ?auto_764995 - BLOCK
      ?auto_764996 - BLOCK
      ?auto_764997 - BLOCK
      ?auto_764998 - BLOCK
      ?auto_764999 - BLOCK
      ?auto_765000 - BLOCK
      ?auto_765001 - BLOCK
      ?auto_765002 - BLOCK
      ?auto_765003 - BLOCK
      ?auto_765004 - BLOCK
      ?auto_765005 - BLOCK
      ?auto_765006 - BLOCK
      ?auto_765007 - BLOCK
      ?auto_765008 - BLOCK
      ?auto_765009 - BLOCK
      ?auto_765010 - BLOCK
      ?auto_765011 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_765011 ) ( ON-TABLE ?auto_764994 ) ( ON ?auto_764995 ?auto_764994 ) ( ON ?auto_764996 ?auto_764995 ) ( ON ?auto_764997 ?auto_764996 ) ( ON ?auto_764998 ?auto_764997 ) ( ON ?auto_764999 ?auto_764998 ) ( ON ?auto_765000 ?auto_764999 ) ( ON ?auto_765001 ?auto_765000 ) ( ON ?auto_765002 ?auto_765001 ) ( ON ?auto_765003 ?auto_765002 ) ( ON ?auto_765004 ?auto_765003 ) ( ON ?auto_765005 ?auto_765004 ) ( ON ?auto_765006 ?auto_765005 ) ( ON ?auto_765007 ?auto_765006 ) ( not ( = ?auto_764994 ?auto_764995 ) ) ( not ( = ?auto_764994 ?auto_764996 ) ) ( not ( = ?auto_764994 ?auto_764997 ) ) ( not ( = ?auto_764994 ?auto_764998 ) ) ( not ( = ?auto_764994 ?auto_764999 ) ) ( not ( = ?auto_764994 ?auto_765000 ) ) ( not ( = ?auto_764994 ?auto_765001 ) ) ( not ( = ?auto_764994 ?auto_765002 ) ) ( not ( = ?auto_764994 ?auto_765003 ) ) ( not ( = ?auto_764994 ?auto_765004 ) ) ( not ( = ?auto_764994 ?auto_765005 ) ) ( not ( = ?auto_764994 ?auto_765006 ) ) ( not ( = ?auto_764994 ?auto_765007 ) ) ( not ( = ?auto_764994 ?auto_765008 ) ) ( not ( = ?auto_764994 ?auto_765009 ) ) ( not ( = ?auto_764994 ?auto_765010 ) ) ( not ( = ?auto_764994 ?auto_765011 ) ) ( not ( = ?auto_764995 ?auto_764996 ) ) ( not ( = ?auto_764995 ?auto_764997 ) ) ( not ( = ?auto_764995 ?auto_764998 ) ) ( not ( = ?auto_764995 ?auto_764999 ) ) ( not ( = ?auto_764995 ?auto_765000 ) ) ( not ( = ?auto_764995 ?auto_765001 ) ) ( not ( = ?auto_764995 ?auto_765002 ) ) ( not ( = ?auto_764995 ?auto_765003 ) ) ( not ( = ?auto_764995 ?auto_765004 ) ) ( not ( = ?auto_764995 ?auto_765005 ) ) ( not ( = ?auto_764995 ?auto_765006 ) ) ( not ( = ?auto_764995 ?auto_765007 ) ) ( not ( = ?auto_764995 ?auto_765008 ) ) ( not ( = ?auto_764995 ?auto_765009 ) ) ( not ( = ?auto_764995 ?auto_765010 ) ) ( not ( = ?auto_764995 ?auto_765011 ) ) ( not ( = ?auto_764996 ?auto_764997 ) ) ( not ( = ?auto_764996 ?auto_764998 ) ) ( not ( = ?auto_764996 ?auto_764999 ) ) ( not ( = ?auto_764996 ?auto_765000 ) ) ( not ( = ?auto_764996 ?auto_765001 ) ) ( not ( = ?auto_764996 ?auto_765002 ) ) ( not ( = ?auto_764996 ?auto_765003 ) ) ( not ( = ?auto_764996 ?auto_765004 ) ) ( not ( = ?auto_764996 ?auto_765005 ) ) ( not ( = ?auto_764996 ?auto_765006 ) ) ( not ( = ?auto_764996 ?auto_765007 ) ) ( not ( = ?auto_764996 ?auto_765008 ) ) ( not ( = ?auto_764996 ?auto_765009 ) ) ( not ( = ?auto_764996 ?auto_765010 ) ) ( not ( = ?auto_764996 ?auto_765011 ) ) ( not ( = ?auto_764997 ?auto_764998 ) ) ( not ( = ?auto_764997 ?auto_764999 ) ) ( not ( = ?auto_764997 ?auto_765000 ) ) ( not ( = ?auto_764997 ?auto_765001 ) ) ( not ( = ?auto_764997 ?auto_765002 ) ) ( not ( = ?auto_764997 ?auto_765003 ) ) ( not ( = ?auto_764997 ?auto_765004 ) ) ( not ( = ?auto_764997 ?auto_765005 ) ) ( not ( = ?auto_764997 ?auto_765006 ) ) ( not ( = ?auto_764997 ?auto_765007 ) ) ( not ( = ?auto_764997 ?auto_765008 ) ) ( not ( = ?auto_764997 ?auto_765009 ) ) ( not ( = ?auto_764997 ?auto_765010 ) ) ( not ( = ?auto_764997 ?auto_765011 ) ) ( not ( = ?auto_764998 ?auto_764999 ) ) ( not ( = ?auto_764998 ?auto_765000 ) ) ( not ( = ?auto_764998 ?auto_765001 ) ) ( not ( = ?auto_764998 ?auto_765002 ) ) ( not ( = ?auto_764998 ?auto_765003 ) ) ( not ( = ?auto_764998 ?auto_765004 ) ) ( not ( = ?auto_764998 ?auto_765005 ) ) ( not ( = ?auto_764998 ?auto_765006 ) ) ( not ( = ?auto_764998 ?auto_765007 ) ) ( not ( = ?auto_764998 ?auto_765008 ) ) ( not ( = ?auto_764998 ?auto_765009 ) ) ( not ( = ?auto_764998 ?auto_765010 ) ) ( not ( = ?auto_764998 ?auto_765011 ) ) ( not ( = ?auto_764999 ?auto_765000 ) ) ( not ( = ?auto_764999 ?auto_765001 ) ) ( not ( = ?auto_764999 ?auto_765002 ) ) ( not ( = ?auto_764999 ?auto_765003 ) ) ( not ( = ?auto_764999 ?auto_765004 ) ) ( not ( = ?auto_764999 ?auto_765005 ) ) ( not ( = ?auto_764999 ?auto_765006 ) ) ( not ( = ?auto_764999 ?auto_765007 ) ) ( not ( = ?auto_764999 ?auto_765008 ) ) ( not ( = ?auto_764999 ?auto_765009 ) ) ( not ( = ?auto_764999 ?auto_765010 ) ) ( not ( = ?auto_764999 ?auto_765011 ) ) ( not ( = ?auto_765000 ?auto_765001 ) ) ( not ( = ?auto_765000 ?auto_765002 ) ) ( not ( = ?auto_765000 ?auto_765003 ) ) ( not ( = ?auto_765000 ?auto_765004 ) ) ( not ( = ?auto_765000 ?auto_765005 ) ) ( not ( = ?auto_765000 ?auto_765006 ) ) ( not ( = ?auto_765000 ?auto_765007 ) ) ( not ( = ?auto_765000 ?auto_765008 ) ) ( not ( = ?auto_765000 ?auto_765009 ) ) ( not ( = ?auto_765000 ?auto_765010 ) ) ( not ( = ?auto_765000 ?auto_765011 ) ) ( not ( = ?auto_765001 ?auto_765002 ) ) ( not ( = ?auto_765001 ?auto_765003 ) ) ( not ( = ?auto_765001 ?auto_765004 ) ) ( not ( = ?auto_765001 ?auto_765005 ) ) ( not ( = ?auto_765001 ?auto_765006 ) ) ( not ( = ?auto_765001 ?auto_765007 ) ) ( not ( = ?auto_765001 ?auto_765008 ) ) ( not ( = ?auto_765001 ?auto_765009 ) ) ( not ( = ?auto_765001 ?auto_765010 ) ) ( not ( = ?auto_765001 ?auto_765011 ) ) ( not ( = ?auto_765002 ?auto_765003 ) ) ( not ( = ?auto_765002 ?auto_765004 ) ) ( not ( = ?auto_765002 ?auto_765005 ) ) ( not ( = ?auto_765002 ?auto_765006 ) ) ( not ( = ?auto_765002 ?auto_765007 ) ) ( not ( = ?auto_765002 ?auto_765008 ) ) ( not ( = ?auto_765002 ?auto_765009 ) ) ( not ( = ?auto_765002 ?auto_765010 ) ) ( not ( = ?auto_765002 ?auto_765011 ) ) ( not ( = ?auto_765003 ?auto_765004 ) ) ( not ( = ?auto_765003 ?auto_765005 ) ) ( not ( = ?auto_765003 ?auto_765006 ) ) ( not ( = ?auto_765003 ?auto_765007 ) ) ( not ( = ?auto_765003 ?auto_765008 ) ) ( not ( = ?auto_765003 ?auto_765009 ) ) ( not ( = ?auto_765003 ?auto_765010 ) ) ( not ( = ?auto_765003 ?auto_765011 ) ) ( not ( = ?auto_765004 ?auto_765005 ) ) ( not ( = ?auto_765004 ?auto_765006 ) ) ( not ( = ?auto_765004 ?auto_765007 ) ) ( not ( = ?auto_765004 ?auto_765008 ) ) ( not ( = ?auto_765004 ?auto_765009 ) ) ( not ( = ?auto_765004 ?auto_765010 ) ) ( not ( = ?auto_765004 ?auto_765011 ) ) ( not ( = ?auto_765005 ?auto_765006 ) ) ( not ( = ?auto_765005 ?auto_765007 ) ) ( not ( = ?auto_765005 ?auto_765008 ) ) ( not ( = ?auto_765005 ?auto_765009 ) ) ( not ( = ?auto_765005 ?auto_765010 ) ) ( not ( = ?auto_765005 ?auto_765011 ) ) ( not ( = ?auto_765006 ?auto_765007 ) ) ( not ( = ?auto_765006 ?auto_765008 ) ) ( not ( = ?auto_765006 ?auto_765009 ) ) ( not ( = ?auto_765006 ?auto_765010 ) ) ( not ( = ?auto_765006 ?auto_765011 ) ) ( not ( = ?auto_765007 ?auto_765008 ) ) ( not ( = ?auto_765007 ?auto_765009 ) ) ( not ( = ?auto_765007 ?auto_765010 ) ) ( not ( = ?auto_765007 ?auto_765011 ) ) ( not ( = ?auto_765008 ?auto_765009 ) ) ( not ( = ?auto_765008 ?auto_765010 ) ) ( not ( = ?auto_765008 ?auto_765011 ) ) ( not ( = ?auto_765009 ?auto_765010 ) ) ( not ( = ?auto_765009 ?auto_765011 ) ) ( not ( = ?auto_765010 ?auto_765011 ) ) ( ON ?auto_765010 ?auto_765011 ) ( ON ?auto_765009 ?auto_765010 ) ( CLEAR ?auto_765007 ) ( ON ?auto_765008 ?auto_765009 ) ( CLEAR ?auto_765008 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-15PILE ?auto_764994 ?auto_764995 ?auto_764996 ?auto_764997 ?auto_764998 ?auto_764999 ?auto_765000 ?auto_765001 ?auto_765002 ?auto_765003 ?auto_765004 ?auto_765005 ?auto_765006 ?auto_765007 ?auto_765008 )
      ( MAKE-18PILE ?auto_764994 ?auto_764995 ?auto_764996 ?auto_764997 ?auto_764998 ?auto_764999 ?auto_765000 ?auto_765001 ?auto_765002 ?auto_765003 ?auto_765004 ?auto_765005 ?auto_765006 ?auto_765007 ?auto_765008 ?auto_765009 ?auto_765010 ?auto_765011 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_765030 - BLOCK
      ?auto_765031 - BLOCK
      ?auto_765032 - BLOCK
      ?auto_765033 - BLOCK
      ?auto_765034 - BLOCK
      ?auto_765035 - BLOCK
      ?auto_765036 - BLOCK
      ?auto_765037 - BLOCK
      ?auto_765038 - BLOCK
      ?auto_765039 - BLOCK
      ?auto_765040 - BLOCK
      ?auto_765041 - BLOCK
      ?auto_765042 - BLOCK
      ?auto_765043 - BLOCK
      ?auto_765044 - BLOCK
      ?auto_765045 - BLOCK
      ?auto_765046 - BLOCK
      ?auto_765047 - BLOCK
    )
    :vars
    (
      ?auto_765048 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_765047 ?auto_765048 ) ( ON-TABLE ?auto_765030 ) ( ON ?auto_765031 ?auto_765030 ) ( ON ?auto_765032 ?auto_765031 ) ( ON ?auto_765033 ?auto_765032 ) ( ON ?auto_765034 ?auto_765033 ) ( ON ?auto_765035 ?auto_765034 ) ( ON ?auto_765036 ?auto_765035 ) ( ON ?auto_765037 ?auto_765036 ) ( ON ?auto_765038 ?auto_765037 ) ( ON ?auto_765039 ?auto_765038 ) ( ON ?auto_765040 ?auto_765039 ) ( ON ?auto_765041 ?auto_765040 ) ( ON ?auto_765042 ?auto_765041 ) ( not ( = ?auto_765030 ?auto_765031 ) ) ( not ( = ?auto_765030 ?auto_765032 ) ) ( not ( = ?auto_765030 ?auto_765033 ) ) ( not ( = ?auto_765030 ?auto_765034 ) ) ( not ( = ?auto_765030 ?auto_765035 ) ) ( not ( = ?auto_765030 ?auto_765036 ) ) ( not ( = ?auto_765030 ?auto_765037 ) ) ( not ( = ?auto_765030 ?auto_765038 ) ) ( not ( = ?auto_765030 ?auto_765039 ) ) ( not ( = ?auto_765030 ?auto_765040 ) ) ( not ( = ?auto_765030 ?auto_765041 ) ) ( not ( = ?auto_765030 ?auto_765042 ) ) ( not ( = ?auto_765030 ?auto_765043 ) ) ( not ( = ?auto_765030 ?auto_765044 ) ) ( not ( = ?auto_765030 ?auto_765045 ) ) ( not ( = ?auto_765030 ?auto_765046 ) ) ( not ( = ?auto_765030 ?auto_765047 ) ) ( not ( = ?auto_765030 ?auto_765048 ) ) ( not ( = ?auto_765031 ?auto_765032 ) ) ( not ( = ?auto_765031 ?auto_765033 ) ) ( not ( = ?auto_765031 ?auto_765034 ) ) ( not ( = ?auto_765031 ?auto_765035 ) ) ( not ( = ?auto_765031 ?auto_765036 ) ) ( not ( = ?auto_765031 ?auto_765037 ) ) ( not ( = ?auto_765031 ?auto_765038 ) ) ( not ( = ?auto_765031 ?auto_765039 ) ) ( not ( = ?auto_765031 ?auto_765040 ) ) ( not ( = ?auto_765031 ?auto_765041 ) ) ( not ( = ?auto_765031 ?auto_765042 ) ) ( not ( = ?auto_765031 ?auto_765043 ) ) ( not ( = ?auto_765031 ?auto_765044 ) ) ( not ( = ?auto_765031 ?auto_765045 ) ) ( not ( = ?auto_765031 ?auto_765046 ) ) ( not ( = ?auto_765031 ?auto_765047 ) ) ( not ( = ?auto_765031 ?auto_765048 ) ) ( not ( = ?auto_765032 ?auto_765033 ) ) ( not ( = ?auto_765032 ?auto_765034 ) ) ( not ( = ?auto_765032 ?auto_765035 ) ) ( not ( = ?auto_765032 ?auto_765036 ) ) ( not ( = ?auto_765032 ?auto_765037 ) ) ( not ( = ?auto_765032 ?auto_765038 ) ) ( not ( = ?auto_765032 ?auto_765039 ) ) ( not ( = ?auto_765032 ?auto_765040 ) ) ( not ( = ?auto_765032 ?auto_765041 ) ) ( not ( = ?auto_765032 ?auto_765042 ) ) ( not ( = ?auto_765032 ?auto_765043 ) ) ( not ( = ?auto_765032 ?auto_765044 ) ) ( not ( = ?auto_765032 ?auto_765045 ) ) ( not ( = ?auto_765032 ?auto_765046 ) ) ( not ( = ?auto_765032 ?auto_765047 ) ) ( not ( = ?auto_765032 ?auto_765048 ) ) ( not ( = ?auto_765033 ?auto_765034 ) ) ( not ( = ?auto_765033 ?auto_765035 ) ) ( not ( = ?auto_765033 ?auto_765036 ) ) ( not ( = ?auto_765033 ?auto_765037 ) ) ( not ( = ?auto_765033 ?auto_765038 ) ) ( not ( = ?auto_765033 ?auto_765039 ) ) ( not ( = ?auto_765033 ?auto_765040 ) ) ( not ( = ?auto_765033 ?auto_765041 ) ) ( not ( = ?auto_765033 ?auto_765042 ) ) ( not ( = ?auto_765033 ?auto_765043 ) ) ( not ( = ?auto_765033 ?auto_765044 ) ) ( not ( = ?auto_765033 ?auto_765045 ) ) ( not ( = ?auto_765033 ?auto_765046 ) ) ( not ( = ?auto_765033 ?auto_765047 ) ) ( not ( = ?auto_765033 ?auto_765048 ) ) ( not ( = ?auto_765034 ?auto_765035 ) ) ( not ( = ?auto_765034 ?auto_765036 ) ) ( not ( = ?auto_765034 ?auto_765037 ) ) ( not ( = ?auto_765034 ?auto_765038 ) ) ( not ( = ?auto_765034 ?auto_765039 ) ) ( not ( = ?auto_765034 ?auto_765040 ) ) ( not ( = ?auto_765034 ?auto_765041 ) ) ( not ( = ?auto_765034 ?auto_765042 ) ) ( not ( = ?auto_765034 ?auto_765043 ) ) ( not ( = ?auto_765034 ?auto_765044 ) ) ( not ( = ?auto_765034 ?auto_765045 ) ) ( not ( = ?auto_765034 ?auto_765046 ) ) ( not ( = ?auto_765034 ?auto_765047 ) ) ( not ( = ?auto_765034 ?auto_765048 ) ) ( not ( = ?auto_765035 ?auto_765036 ) ) ( not ( = ?auto_765035 ?auto_765037 ) ) ( not ( = ?auto_765035 ?auto_765038 ) ) ( not ( = ?auto_765035 ?auto_765039 ) ) ( not ( = ?auto_765035 ?auto_765040 ) ) ( not ( = ?auto_765035 ?auto_765041 ) ) ( not ( = ?auto_765035 ?auto_765042 ) ) ( not ( = ?auto_765035 ?auto_765043 ) ) ( not ( = ?auto_765035 ?auto_765044 ) ) ( not ( = ?auto_765035 ?auto_765045 ) ) ( not ( = ?auto_765035 ?auto_765046 ) ) ( not ( = ?auto_765035 ?auto_765047 ) ) ( not ( = ?auto_765035 ?auto_765048 ) ) ( not ( = ?auto_765036 ?auto_765037 ) ) ( not ( = ?auto_765036 ?auto_765038 ) ) ( not ( = ?auto_765036 ?auto_765039 ) ) ( not ( = ?auto_765036 ?auto_765040 ) ) ( not ( = ?auto_765036 ?auto_765041 ) ) ( not ( = ?auto_765036 ?auto_765042 ) ) ( not ( = ?auto_765036 ?auto_765043 ) ) ( not ( = ?auto_765036 ?auto_765044 ) ) ( not ( = ?auto_765036 ?auto_765045 ) ) ( not ( = ?auto_765036 ?auto_765046 ) ) ( not ( = ?auto_765036 ?auto_765047 ) ) ( not ( = ?auto_765036 ?auto_765048 ) ) ( not ( = ?auto_765037 ?auto_765038 ) ) ( not ( = ?auto_765037 ?auto_765039 ) ) ( not ( = ?auto_765037 ?auto_765040 ) ) ( not ( = ?auto_765037 ?auto_765041 ) ) ( not ( = ?auto_765037 ?auto_765042 ) ) ( not ( = ?auto_765037 ?auto_765043 ) ) ( not ( = ?auto_765037 ?auto_765044 ) ) ( not ( = ?auto_765037 ?auto_765045 ) ) ( not ( = ?auto_765037 ?auto_765046 ) ) ( not ( = ?auto_765037 ?auto_765047 ) ) ( not ( = ?auto_765037 ?auto_765048 ) ) ( not ( = ?auto_765038 ?auto_765039 ) ) ( not ( = ?auto_765038 ?auto_765040 ) ) ( not ( = ?auto_765038 ?auto_765041 ) ) ( not ( = ?auto_765038 ?auto_765042 ) ) ( not ( = ?auto_765038 ?auto_765043 ) ) ( not ( = ?auto_765038 ?auto_765044 ) ) ( not ( = ?auto_765038 ?auto_765045 ) ) ( not ( = ?auto_765038 ?auto_765046 ) ) ( not ( = ?auto_765038 ?auto_765047 ) ) ( not ( = ?auto_765038 ?auto_765048 ) ) ( not ( = ?auto_765039 ?auto_765040 ) ) ( not ( = ?auto_765039 ?auto_765041 ) ) ( not ( = ?auto_765039 ?auto_765042 ) ) ( not ( = ?auto_765039 ?auto_765043 ) ) ( not ( = ?auto_765039 ?auto_765044 ) ) ( not ( = ?auto_765039 ?auto_765045 ) ) ( not ( = ?auto_765039 ?auto_765046 ) ) ( not ( = ?auto_765039 ?auto_765047 ) ) ( not ( = ?auto_765039 ?auto_765048 ) ) ( not ( = ?auto_765040 ?auto_765041 ) ) ( not ( = ?auto_765040 ?auto_765042 ) ) ( not ( = ?auto_765040 ?auto_765043 ) ) ( not ( = ?auto_765040 ?auto_765044 ) ) ( not ( = ?auto_765040 ?auto_765045 ) ) ( not ( = ?auto_765040 ?auto_765046 ) ) ( not ( = ?auto_765040 ?auto_765047 ) ) ( not ( = ?auto_765040 ?auto_765048 ) ) ( not ( = ?auto_765041 ?auto_765042 ) ) ( not ( = ?auto_765041 ?auto_765043 ) ) ( not ( = ?auto_765041 ?auto_765044 ) ) ( not ( = ?auto_765041 ?auto_765045 ) ) ( not ( = ?auto_765041 ?auto_765046 ) ) ( not ( = ?auto_765041 ?auto_765047 ) ) ( not ( = ?auto_765041 ?auto_765048 ) ) ( not ( = ?auto_765042 ?auto_765043 ) ) ( not ( = ?auto_765042 ?auto_765044 ) ) ( not ( = ?auto_765042 ?auto_765045 ) ) ( not ( = ?auto_765042 ?auto_765046 ) ) ( not ( = ?auto_765042 ?auto_765047 ) ) ( not ( = ?auto_765042 ?auto_765048 ) ) ( not ( = ?auto_765043 ?auto_765044 ) ) ( not ( = ?auto_765043 ?auto_765045 ) ) ( not ( = ?auto_765043 ?auto_765046 ) ) ( not ( = ?auto_765043 ?auto_765047 ) ) ( not ( = ?auto_765043 ?auto_765048 ) ) ( not ( = ?auto_765044 ?auto_765045 ) ) ( not ( = ?auto_765044 ?auto_765046 ) ) ( not ( = ?auto_765044 ?auto_765047 ) ) ( not ( = ?auto_765044 ?auto_765048 ) ) ( not ( = ?auto_765045 ?auto_765046 ) ) ( not ( = ?auto_765045 ?auto_765047 ) ) ( not ( = ?auto_765045 ?auto_765048 ) ) ( not ( = ?auto_765046 ?auto_765047 ) ) ( not ( = ?auto_765046 ?auto_765048 ) ) ( not ( = ?auto_765047 ?auto_765048 ) ) ( ON ?auto_765046 ?auto_765047 ) ( ON ?auto_765045 ?auto_765046 ) ( ON ?auto_765044 ?auto_765045 ) ( CLEAR ?auto_765042 ) ( ON ?auto_765043 ?auto_765044 ) ( CLEAR ?auto_765043 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_765030 ?auto_765031 ?auto_765032 ?auto_765033 ?auto_765034 ?auto_765035 ?auto_765036 ?auto_765037 ?auto_765038 ?auto_765039 ?auto_765040 ?auto_765041 ?auto_765042 ?auto_765043 )
      ( MAKE-18PILE ?auto_765030 ?auto_765031 ?auto_765032 ?auto_765033 ?auto_765034 ?auto_765035 ?auto_765036 ?auto_765037 ?auto_765038 ?auto_765039 ?auto_765040 ?auto_765041 ?auto_765042 ?auto_765043 ?auto_765044 ?auto_765045 ?auto_765046 ?auto_765047 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_765067 - BLOCK
      ?auto_765068 - BLOCK
      ?auto_765069 - BLOCK
      ?auto_765070 - BLOCK
      ?auto_765071 - BLOCK
      ?auto_765072 - BLOCK
      ?auto_765073 - BLOCK
      ?auto_765074 - BLOCK
      ?auto_765075 - BLOCK
      ?auto_765076 - BLOCK
      ?auto_765077 - BLOCK
      ?auto_765078 - BLOCK
      ?auto_765079 - BLOCK
      ?auto_765080 - BLOCK
      ?auto_765081 - BLOCK
      ?auto_765082 - BLOCK
      ?auto_765083 - BLOCK
      ?auto_765084 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_765084 ) ( ON-TABLE ?auto_765067 ) ( ON ?auto_765068 ?auto_765067 ) ( ON ?auto_765069 ?auto_765068 ) ( ON ?auto_765070 ?auto_765069 ) ( ON ?auto_765071 ?auto_765070 ) ( ON ?auto_765072 ?auto_765071 ) ( ON ?auto_765073 ?auto_765072 ) ( ON ?auto_765074 ?auto_765073 ) ( ON ?auto_765075 ?auto_765074 ) ( ON ?auto_765076 ?auto_765075 ) ( ON ?auto_765077 ?auto_765076 ) ( ON ?auto_765078 ?auto_765077 ) ( ON ?auto_765079 ?auto_765078 ) ( not ( = ?auto_765067 ?auto_765068 ) ) ( not ( = ?auto_765067 ?auto_765069 ) ) ( not ( = ?auto_765067 ?auto_765070 ) ) ( not ( = ?auto_765067 ?auto_765071 ) ) ( not ( = ?auto_765067 ?auto_765072 ) ) ( not ( = ?auto_765067 ?auto_765073 ) ) ( not ( = ?auto_765067 ?auto_765074 ) ) ( not ( = ?auto_765067 ?auto_765075 ) ) ( not ( = ?auto_765067 ?auto_765076 ) ) ( not ( = ?auto_765067 ?auto_765077 ) ) ( not ( = ?auto_765067 ?auto_765078 ) ) ( not ( = ?auto_765067 ?auto_765079 ) ) ( not ( = ?auto_765067 ?auto_765080 ) ) ( not ( = ?auto_765067 ?auto_765081 ) ) ( not ( = ?auto_765067 ?auto_765082 ) ) ( not ( = ?auto_765067 ?auto_765083 ) ) ( not ( = ?auto_765067 ?auto_765084 ) ) ( not ( = ?auto_765068 ?auto_765069 ) ) ( not ( = ?auto_765068 ?auto_765070 ) ) ( not ( = ?auto_765068 ?auto_765071 ) ) ( not ( = ?auto_765068 ?auto_765072 ) ) ( not ( = ?auto_765068 ?auto_765073 ) ) ( not ( = ?auto_765068 ?auto_765074 ) ) ( not ( = ?auto_765068 ?auto_765075 ) ) ( not ( = ?auto_765068 ?auto_765076 ) ) ( not ( = ?auto_765068 ?auto_765077 ) ) ( not ( = ?auto_765068 ?auto_765078 ) ) ( not ( = ?auto_765068 ?auto_765079 ) ) ( not ( = ?auto_765068 ?auto_765080 ) ) ( not ( = ?auto_765068 ?auto_765081 ) ) ( not ( = ?auto_765068 ?auto_765082 ) ) ( not ( = ?auto_765068 ?auto_765083 ) ) ( not ( = ?auto_765068 ?auto_765084 ) ) ( not ( = ?auto_765069 ?auto_765070 ) ) ( not ( = ?auto_765069 ?auto_765071 ) ) ( not ( = ?auto_765069 ?auto_765072 ) ) ( not ( = ?auto_765069 ?auto_765073 ) ) ( not ( = ?auto_765069 ?auto_765074 ) ) ( not ( = ?auto_765069 ?auto_765075 ) ) ( not ( = ?auto_765069 ?auto_765076 ) ) ( not ( = ?auto_765069 ?auto_765077 ) ) ( not ( = ?auto_765069 ?auto_765078 ) ) ( not ( = ?auto_765069 ?auto_765079 ) ) ( not ( = ?auto_765069 ?auto_765080 ) ) ( not ( = ?auto_765069 ?auto_765081 ) ) ( not ( = ?auto_765069 ?auto_765082 ) ) ( not ( = ?auto_765069 ?auto_765083 ) ) ( not ( = ?auto_765069 ?auto_765084 ) ) ( not ( = ?auto_765070 ?auto_765071 ) ) ( not ( = ?auto_765070 ?auto_765072 ) ) ( not ( = ?auto_765070 ?auto_765073 ) ) ( not ( = ?auto_765070 ?auto_765074 ) ) ( not ( = ?auto_765070 ?auto_765075 ) ) ( not ( = ?auto_765070 ?auto_765076 ) ) ( not ( = ?auto_765070 ?auto_765077 ) ) ( not ( = ?auto_765070 ?auto_765078 ) ) ( not ( = ?auto_765070 ?auto_765079 ) ) ( not ( = ?auto_765070 ?auto_765080 ) ) ( not ( = ?auto_765070 ?auto_765081 ) ) ( not ( = ?auto_765070 ?auto_765082 ) ) ( not ( = ?auto_765070 ?auto_765083 ) ) ( not ( = ?auto_765070 ?auto_765084 ) ) ( not ( = ?auto_765071 ?auto_765072 ) ) ( not ( = ?auto_765071 ?auto_765073 ) ) ( not ( = ?auto_765071 ?auto_765074 ) ) ( not ( = ?auto_765071 ?auto_765075 ) ) ( not ( = ?auto_765071 ?auto_765076 ) ) ( not ( = ?auto_765071 ?auto_765077 ) ) ( not ( = ?auto_765071 ?auto_765078 ) ) ( not ( = ?auto_765071 ?auto_765079 ) ) ( not ( = ?auto_765071 ?auto_765080 ) ) ( not ( = ?auto_765071 ?auto_765081 ) ) ( not ( = ?auto_765071 ?auto_765082 ) ) ( not ( = ?auto_765071 ?auto_765083 ) ) ( not ( = ?auto_765071 ?auto_765084 ) ) ( not ( = ?auto_765072 ?auto_765073 ) ) ( not ( = ?auto_765072 ?auto_765074 ) ) ( not ( = ?auto_765072 ?auto_765075 ) ) ( not ( = ?auto_765072 ?auto_765076 ) ) ( not ( = ?auto_765072 ?auto_765077 ) ) ( not ( = ?auto_765072 ?auto_765078 ) ) ( not ( = ?auto_765072 ?auto_765079 ) ) ( not ( = ?auto_765072 ?auto_765080 ) ) ( not ( = ?auto_765072 ?auto_765081 ) ) ( not ( = ?auto_765072 ?auto_765082 ) ) ( not ( = ?auto_765072 ?auto_765083 ) ) ( not ( = ?auto_765072 ?auto_765084 ) ) ( not ( = ?auto_765073 ?auto_765074 ) ) ( not ( = ?auto_765073 ?auto_765075 ) ) ( not ( = ?auto_765073 ?auto_765076 ) ) ( not ( = ?auto_765073 ?auto_765077 ) ) ( not ( = ?auto_765073 ?auto_765078 ) ) ( not ( = ?auto_765073 ?auto_765079 ) ) ( not ( = ?auto_765073 ?auto_765080 ) ) ( not ( = ?auto_765073 ?auto_765081 ) ) ( not ( = ?auto_765073 ?auto_765082 ) ) ( not ( = ?auto_765073 ?auto_765083 ) ) ( not ( = ?auto_765073 ?auto_765084 ) ) ( not ( = ?auto_765074 ?auto_765075 ) ) ( not ( = ?auto_765074 ?auto_765076 ) ) ( not ( = ?auto_765074 ?auto_765077 ) ) ( not ( = ?auto_765074 ?auto_765078 ) ) ( not ( = ?auto_765074 ?auto_765079 ) ) ( not ( = ?auto_765074 ?auto_765080 ) ) ( not ( = ?auto_765074 ?auto_765081 ) ) ( not ( = ?auto_765074 ?auto_765082 ) ) ( not ( = ?auto_765074 ?auto_765083 ) ) ( not ( = ?auto_765074 ?auto_765084 ) ) ( not ( = ?auto_765075 ?auto_765076 ) ) ( not ( = ?auto_765075 ?auto_765077 ) ) ( not ( = ?auto_765075 ?auto_765078 ) ) ( not ( = ?auto_765075 ?auto_765079 ) ) ( not ( = ?auto_765075 ?auto_765080 ) ) ( not ( = ?auto_765075 ?auto_765081 ) ) ( not ( = ?auto_765075 ?auto_765082 ) ) ( not ( = ?auto_765075 ?auto_765083 ) ) ( not ( = ?auto_765075 ?auto_765084 ) ) ( not ( = ?auto_765076 ?auto_765077 ) ) ( not ( = ?auto_765076 ?auto_765078 ) ) ( not ( = ?auto_765076 ?auto_765079 ) ) ( not ( = ?auto_765076 ?auto_765080 ) ) ( not ( = ?auto_765076 ?auto_765081 ) ) ( not ( = ?auto_765076 ?auto_765082 ) ) ( not ( = ?auto_765076 ?auto_765083 ) ) ( not ( = ?auto_765076 ?auto_765084 ) ) ( not ( = ?auto_765077 ?auto_765078 ) ) ( not ( = ?auto_765077 ?auto_765079 ) ) ( not ( = ?auto_765077 ?auto_765080 ) ) ( not ( = ?auto_765077 ?auto_765081 ) ) ( not ( = ?auto_765077 ?auto_765082 ) ) ( not ( = ?auto_765077 ?auto_765083 ) ) ( not ( = ?auto_765077 ?auto_765084 ) ) ( not ( = ?auto_765078 ?auto_765079 ) ) ( not ( = ?auto_765078 ?auto_765080 ) ) ( not ( = ?auto_765078 ?auto_765081 ) ) ( not ( = ?auto_765078 ?auto_765082 ) ) ( not ( = ?auto_765078 ?auto_765083 ) ) ( not ( = ?auto_765078 ?auto_765084 ) ) ( not ( = ?auto_765079 ?auto_765080 ) ) ( not ( = ?auto_765079 ?auto_765081 ) ) ( not ( = ?auto_765079 ?auto_765082 ) ) ( not ( = ?auto_765079 ?auto_765083 ) ) ( not ( = ?auto_765079 ?auto_765084 ) ) ( not ( = ?auto_765080 ?auto_765081 ) ) ( not ( = ?auto_765080 ?auto_765082 ) ) ( not ( = ?auto_765080 ?auto_765083 ) ) ( not ( = ?auto_765080 ?auto_765084 ) ) ( not ( = ?auto_765081 ?auto_765082 ) ) ( not ( = ?auto_765081 ?auto_765083 ) ) ( not ( = ?auto_765081 ?auto_765084 ) ) ( not ( = ?auto_765082 ?auto_765083 ) ) ( not ( = ?auto_765082 ?auto_765084 ) ) ( not ( = ?auto_765083 ?auto_765084 ) ) ( ON ?auto_765083 ?auto_765084 ) ( ON ?auto_765082 ?auto_765083 ) ( ON ?auto_765081 ?auto_765082 ) ( CLEAR ?auto_765079 ) ( ON ?auto_765080 ?auto_765081 ) ( CLEAR ?auto_765080 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-14PILE ?auto_765067 ?auto_765068 ?auto_765069 ?auto_765070 ?auto_765071 ?auto_765072 ?auto_765073 ?auto_765074 ?auto_765075 ?auto_765076 ?auto_765077 ?auto_765078 ?auto_765079 ?auto_765080 )
      ( MAKE-18PILE ?auto_765067 ?auto_765068 ?auto_765069 ?auto_765070 ?auto_765071 ?auto_765072 ?auto_765073 ?auto_765074 ?auto_765075 ?auto_765076 ?auto_765077 ?auto_765078 ?auto_765079 ?auto_765080 ?auto_765081 ?auto_765082 ?auto_765083 ?auto_765084 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_765103 - BLOCK
      ?auto_765104 - BLOCK
      ?auto_765105 - BLOCK
      ?auto_765106 - BLOCK
      ?auto_765107 - BLOCK
      ?auto_765108 - BLOCK
      ?auto_765109 - BLOCK
      ?auto_765110 - BLOCK
      ?auto_765111 - BLOCK
      ?auto_765112 - BLOCK
      ?auto_765113 - BLOCK
      ?auto_765114 - BLOCK
      ?auto_765115 - BLOCK
      ?auto_765116 - BLOCK
      ?auto_765117 - BLOCK
      ?auto_765118 - BLOCK
      ?auto_765119 - BLOCK
      ?auto_765120 - BLOCK
    )
    :vars
    (
      ?auto_765121 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_765120 ?auto_765121 ) ( ON-TABLE ?auto_765103 ) ( ON ?auto_765104 ?auto_765103 ) ( ON ?auto_765105 ?auto_765104 ) ( ON ?auto_765106 ?auto_765105 ) ( ON ?auto_765107 ?auto_765106 ) ( ON ?auto_765108 ?auto_765107 ) ( ON ?auto_765109 ?auto_765108 ) ( ON ?auto_765110 ?auto_765109 ) ( ON ?auto_765111 ?auto_765110 ) ( ON ?auto_765112 ?auto_765111 ) ( ON ?auto_765113 ?auto_765112 ) ( ON ?auto_765114 ?auto_765113 ) ( not ( = ?auto_765103 ?auto_765104 ) ) ( not ( = ?auto_765103 ?auto_765105 ) ) ( not ( = ?auto_765103 ?auto_765106 ) ) ( not ( = ?auto_765103 ?auto_765107 ) ) ( not ( = ?auto_765103 ?auto_765108 ) ) ( not ( = ?auto_765103 ?auto_765109 ) ) ( not ( = ?auto_765103 ?auto_765110 ) ) ( not ( = ?auto_765103 ?auto_765111 ) ) ( not ( = ?auto_765103 ?auto_765112 ) ) ( not ( = ?auto_765103 ?auto_765113 ) ) ( not ( = ?auto_765103 ?auto_765114 ) ) ( not ( = ?auto_765103 ?auto_765115 ) ) ( not ( = ?auto_765103 ?auto_765116 ) ) ( not ( = ?auto_765103 ?auto_765117 ) ) ( not ( = ?auto_765103 ?auto_765118 ) ) ( not ( = ?auto_765103 ?auto_765119 ) ) ( not ( = ?auto_765103 ?auto_765120 ) ) ( not ( = ?auto_765103 ?auto_765121 ) ) ( not ( = ?auto_765104 ?auto_765105 ) ) ( not ( = ?auto_765104 ?auto_765106 ) ) ( not ( = ?auto_765104 ?auto_765107 ) ) ( not ( = ?auto_765104 ?auto_765108 ) ) ( not ( = ?auto_765104 ?auto_765109 ) ) ( not ( = ?auto_765104 ?auto_765110 ) ) ( not ( = ?auto_765104 ?auto_765111 ) ) ( not ( = ?auto_765104 ?auto_765112 ) ) ( not ( = ?auto_765104 ?auto_765113 ) ) ( not ( = ?auto_765104 ?auto_765114 ) ) ( not ( = ?auto_765104 ?auto_765115 ) ) ( not ( = ?auto_765104 ?auto_765116 ) ) ( not ( = ?auto_765104 ?auto_765117 ) ) ( not ( = ?auto_765104 ?auto_765118 ) ) ( not ( = ?auto_765104 ?auto_765119 ) ) ( not ( = ?auto_765104 ?auto_765120 ) ) ( not ( = ?auto_765104 ?auto_765121 ) ) ( not ( = ?auto_765105 ?auto_765106 ) ) ( not ( = ?auto_765105 ?auto_765107 ) ) ( not ( = ?auto_765105 ?auto_765108 ) ) ( not ( = ?auto_765105 ?auto_765109 ) ) ( not ( = ?auto_765105 ?auto_765110 ) ) ( not ( = ?auto_765105 ?auto_765111 ) ) ( not ( = ?auto_765105 ?auto_765112 ) ) ( not ( = ?auto_765105 ?auto_765113 ) ) ( not ( = ?auto_765105 ?auto_765114 ) ) ( not ( = ?auto_765105 ?auto_765115 ) ) ( not ( = ?auto_765105 ?auto_765116 ) ) ( not ( = ?auto_765105 ?auto_765117 ) ) ( not ( = ?auto_765105 ?auto_765118 ) ) ( not ( = ?auto_765105 ?auto_765119 ) ) ( not ( = ?auto_765105 ?auto_765120 ) ) ( not ( = ?auto_765105 ?auto_765121 ) ) ( not ( = ?auto_765106 ?auto_765107 ) ) ( not ( = ?auto_765106 ?auto_765108 ) ) ( not ( = ?auto_765106 ?auto_765109 ) ) ( not ( = ?auto_765106 ?auto_765110 ) ) ( not ( = ?auto_765106 ?auto_765111 ) ) ( not ( = ?auto_765106 ?auto_765112 ) ) ( not ( = ?auto_765106 ?auto_765113 ) ) ( not ( = ?auto_765106 ?auto_765114 ) ) ( not ( = ?auto_765106 ?auto_765115 ) ) ( not ( = ?auto_765106 ?auto_765116 ) ) ( not ( = ?auto_765106 ?auto_765117 ) ) ( not ( = ?auto_765106 ?auto_765118 ) ) ( not ( = ?auto_765106 ?auto_765119 ) ) ( not ( = ?auto_765106 ?auto_765120 ) ) ( not ( = ?auto_765106 ?auto_765121 ) ) ( not ( = ?auto_765107 ?auto_765108 ) ) ( not ( = ?auto_765107 ?auto_765109 ) ) ( not ( = ?auto_765107 ?auto_765110 ) ) ( not ( = ?auto_765107 ?auto_765111 ) ) ( not ( = ?auto_765107 ?auto_765112 ) ) ( not ( = ?auto_765107 ?auto_765113 ) ) ( not ( = ?auto_765107 ?auto_765114 ) ) ( not ( = ?auto_765107 ?auto_765115 ) ) ( not ( = ?auto_765107 ?auto_765116 ) ) ( not ( = ?auto_765107 ?auto_765117 ) ) ( not ( = ?auto_765107 ?auto_765118 ) ) ( not ( = ?auto_765107 ?auto_765119 ) ) ( not ( = ?auto_765107 ?auto_765120 ) ) ( not ( = ?auto_765107 ?auto_765121 ) ) ( not ( = ?auto_765108 ?auto_765109 ) ) ( not ( = ?auto_765108 ?auto_765110 ) ) ( not ( = ?auto_765108 ?auto_765111 ) ) ( not ( = ?auto_765108 ?auto_765112 ) ) ( not ( = ?auto_765108 ?auto_765113 ) ) ( not ( = ?auto_765108 ?auto_765114 ) ) ( not ( = ?auto_765108 ?auto_765115 ) ) ( not ( = ?auto_765108 ?auto_765116 ) ) ( not ( = ?auto_765108 ?auto_765117 ) ) ( not ( = ?auto_765108 ?auto_765118 ) ) ( not ( = ?auto_765108 ?auto_765119 ) ) ( not ( = ?auto_765108 ?auto_765120 ) ) ( not ( = ?auto_765108 ?auto_765121 ) ) ( not ( = ?auto_765109 ?auto_765110 ) ) ( not ( = ?auto_765109 ?auto_765111 ) ) ( not ( = ?auto_765109 ?auto_765112 ) ) ( not ( = ?auto_765109 ?auto_765113 ) ) ( not ( = ?auto_765109 ?auto_765114 ) ) ( not ( = ?auto_765109 ?auto_765115 ) ) ( not ( = ?auto_765109 ?auto_765116 ) ) ( not ( = ?auto_765109 ?auto_765117 ) ) ( not ( = ?auto_765109 ?auto_765118 ) ) ( not ( = ?auto_765109 ?auto_765119 ) ) ( not ( = ?auto_765109 ?auto_765120 ) ) ( not ( = ?auto_765109 ?auto_765121 ) ) ( not ( = ?auto_765110 ?auto_765111 ) ) ( not ( = ?auto_765110 ?auto_765112 ) ) ( not ( = ?auto_765110 ?auto_765113 ) ) ( not ( = ?auto_765110 ?auto_765114 ) ) ( not ( = ?auto_765110 ?auto_765115 ) ) ( not ( = ?auto_765110 ?auto_765116 ) ) ( not ( = ?auto_765110 ?auto_765117 ) ) ( not ( = ?auto_765110 ?auto_765118 ) ) ( not ( = ?auto_765110 ?auto_765119 ) ) ( not ( = ?auto_765110 ?auto_765120 ) ) ( not ( = ?auto_765110 ?auto_765121 ) ) ( not ( = ?auto_765111 ?auto_765112 ) ) ( not ( = ?auto_765111 ?auto_765113 ) ) ( not ( = ?auto_765111 ?auto_765114 ) ) ( not ( = ?auto_765111 ?auto_765115 ) ) ( not ( = ?auto_765111 ?auto_765116 ) ) ( not ( = ?auto_765111 ?auto_765117 ) ) ( not ( = ?auto_765111 ?auto_765118 ) ) ( not ( = ?auto_765111 ?auto_765119 ) ) ( not ( = ?auto_765111 ?auto_765120 ) ) ( not ( = ?auto_765111 ?auto_765121 ) ) ( not ( = ?auto_765112 ?auto_765113 ) ) ( not ( = ?auto_765112 ?auto_765114 ) ) ( not ( = ?auto_765112 ?auto_765115 ) ) ( not ( = ?auto_765112 ?auto_765116 ) ) ( not ( = ?auto_765112 ?auto_765117 ) ) ( not ( = ?auto_765112 ?auto_765118 ) ) ( not ( = ?auto_765112 ?auto_765119 ) ) ( not ( = ?auto_765112 ?auto_765120 ) ) ( not ( = ?auto_765112 ?auto_765121 ) ) ( not ( = ?auto_765113 ?auto_765114 ) ) ( not ( = ?auto_765113 ?auto_765115 ) ) ( not ( = ?auto_765113 ?auto_765116 ) ) ( not ( = ?auto_765113 ?auto_765117 ) ) ( not ( = ?auto_765113 ?auto_765118 ) ) ( not ( = ?auto_765113 ?auto_765119 ) ) ( not ( = ?auto_765113 ?auto_765120 ) ) ( not ( = ?auto_765113 ?auto_765121 ) ) ( not ( = ?auto_765114 ?auto_765115 ) ) ( not ( = ?auto_765114 ?auto_765116 ) ) ( not ( = ?auto_765114 ?auto_765117 ) ) ( not ( = ?auto_765114 ?auto_765118 ) ) ( not ( = ?auto_765114 ?auto_765119 ) ) ( not ( = ?auto_765114 ?auto_765120 ) ) ( not ( = ?auto_765114 ?auto_765121 ) ) ( not ( = ?auto_765115 ?auto_765116 ) ) ( not ( = ?auto_765115 ?auto_765117 ) ) ( not ( = ?auto_765115 ?auto_765118 ) ) ( not ( = ?auto_765115 ?auto_765119 ) ) ( not ( = ?auto_765115 ?auto_765120 ) ) ( not ( = ?auto_765115 ?auto_765121 ) ) ( not ( = ?auto_765116 ?auto_765117 ) ) ( not ( = ?auto_765116 ?auto_765118 ) ) ( not ( = ?auto_765116 ?auto_765119 ) ) ( not ( = ?auto_765116 ?auto_765120 ) ) ( not ( = ?auto_765116 ?auto_765121 ) ) ( not ( = ?auto_765117 ?auto_765118 ) ) ( not ( = ?auto_765117 ?auto_765119 ) ) ( not ( = ?auto_765117 ?auto_765120 ) ) ( not ( = ?auto_765117 ?auto_765121 ) ) ( not ( = ?auto_765118 ?auto_765119 ) ) ( not ( = ?auto_765118 ?auto_765120 ) ) ( not ( = ?auto_765118 ?auto_765121 ) ) ( not ( = ?auto_765119 ?auto_765120 ) ) ( not ( = ?auto_765119 ?auto_765121 ) ) ( not ( = ?auto_765120 ?auto_765121 ) ) ( ON ?auto_765119 ?auto_765120 ) ( ON ?auto_765118 ?auto_765119 ) ( ON ?auto_765117 ?auto_765118 ) ( ON ?auto_765116 ?auto_765117 ) ( CLEAR ?auto_765114 ) ( ON ?auto_765115 ?auto_765116 ) ( CLEAR ?auto_765115 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_765103 ?auto_765104 ?auto_765105 ?auto_765106 ?auto_765107 ?auto_765108 ?auto_765109 ?auto_765110 ?auto_765111 ?auto_765112 ?auto_765113 ?auto_765114 ?auto_765115 )
      ( MAKE-18PILE ?auto_765103 ?auto_765104 ?auto_765105 ?auto_765106 ?auto_765107 ?auto_765108 ?auto_765109 ?auto_765110 ?auto_765111 ?auto_765112 ?auto_765113 ?auto_765114 ?auto_765115 ?auto_765116 ?auto_765117 ?auto_765118 ?auto_765119 ?auto_765120 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_765140 - BLOCK
      ?auto_765141 - BLOCK
      ?auto_765142 - BLOCK
      ?auto_765143 - BLOCK
      ?auto_765144 - BLOCK
      ?auto_765145 - BLOCK
      ?auto_765146 - BLOCK
      ?auto_765147 - BLOCK
      ?auto_765148 - BLOCK
      ?auto_765149 - BLOCK
      ?auto_765150 - BLOCK
      ?auto_765151 - BLOCK
      ?auto_765152 - BLOCK
      ?auto_765153 - BLOCK
      ?auto_765154 - BLOCK
      ?auto_765155 - BLOCK
      ?auto_765156 - BLOCK
      ?auto_765157 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_765157 ) ( ON-TABLE ?auto_765140 ) ( ON ?auto_765141 ?auto_765140 ) ( ON ?auto_765142 ?auto_765141 ) ( ON ?auto_765143 ?auto_765142 ) ( ON ?auto_765144 ?auto_765143 ) ( ON ?auto_765145 ?auto_765144 ) ( ON ?auto_765146 ?auto_765145 ) ( ON ?auto_765147 ?auto_765146 ) ( ON ?auto_765148 ?auto_765147 ) ( ON ?auto_765149 ?auto_765148 ) ( ON ?auto_765150 ?auto_765149 ) ( ON ?auto_765151 ?auto_765150 ) ( not ( = ?auto_765140 ?auto_765141 ) ) ( not ( = ?auto_765140 ?auto_765142 ) ) ( not ( = ?auto_765140 ?auto_765143 ) ) ( not ( = ?auto_765140 ?auto_765144 ) ) ( not ( = ?auto_765140 ?auto_765145 ) ) ( not ( = ?auto_765140 ?auto_765146 ) ) ( not ( = ?auto_765140 ?auto_765147 ) ) ( not ( = ?auto_765140 ?auto_765148 ) ) ( not ( = ?auto_765140 ?auto_765149 ) ) ( not ( = ?auto_765140 ?auto_765150 ) ) ( not ( = ?auto_765140 ?auto_765151 ) ) ( not ( = ?auto_765140 ?auto_765152 ) ) ( not ( = ?auto_765140 ?auto_765153 ) ) ( not ( = ?auto_765140 ?auto_765154 ) ) ( not ( = ?auto_765140 ?auto_765155 ) ) ( not ( = ?auto_765140 ?auto_765156 ) ) ( not ( = ?auto_765140 ?auto_765157 ) ) ( not ( = ?auto_765141 ?auto_765142 ) ) ( not ( = ?auto_765141 ?auto_765143 ) ) ( not ( = ?auto_765141 ?auto_765144 ) ) ( not ( = ?auto_765141 ?auto_765145 ) ) ( not ( = ?auto_765141 ?auto_765146 ) ) ( not ( = ?auto_765141 ?auto_765147 ) ) ( not ( = ?auto_765141 ?auto_765148 ) ) ( not ( = ?auto_765141 ?auto_765149 ) ) ( not ( = ?auto_765141 ?auto_765150 ) ) ( not ( = ?auto_765141 ?auto_765151 ) ) ( not ( = ?auto_765141 ?auto_765152 ) ) ( not ( = ?auto_765141 ?auto_765153 ) ) ( not ( = ?auto_765141 ?auto_765154 ) ) ( not ( = ?auto_765141 ?auto_765155 ) ) ( not ( = ?auto_765141 ?auto_765156 ) ) ( not ( = ?auto_765141 ?auto_765157 ) ) ( not ( = ?auto_765142 ?auto_765143 ) ) ( not ( = ?auto_765142 ?auto_765144 ) ) ( not ( = ?auto_765142 ?auto_765145 ) ) ( not ( = ?auto_765142 ?auto_765146 ) ) ( not ( = ?auto_765142 ?auto_765147 ) ) ( not ( = ?auto_765142 ?auto_765148 ) ) ( not ( = ?auto_765142 ?auto_765149 ) ) ( not ( = ?auto_765142 ?auto_765150 ) ) ( not ( = ?auto_765142 ?auto_765151 ) ) ( not ( = ?auto_765142 ?auto_765152 ) ) ( not ( = ?auto_765142 ?auto_765153 ) ) ( not ( = ?auto_765142 ?auto_765154 ) ) ( not ( = ?auto_765142 ?auto_765155 ) ) ( not ( = ?auto_765142 ?auto_765156 ) ) ( not ( = ?auto_765142 ?auto_765157 ) ) ( not ( = ?auto_765143 ?auto_765144 ) ) ( not ( = ?auto_765143 ?auto_765145 ) ) ( not ( = ?auto_765143 ?auto_765146 ) ) ( not ( = ?auto_765143 ?auto_765147 ) ) ( not ( = ?auto_765143 ?auto_765148 ) ) ( not ( = ?auto_765143 ?auto_765149 ) ) ( not ( = ?auto_765143 ?auto_765150 ) ) ( not ( = ?auto_765143 ?auto_765151 ) ) ( not ( = ?auto_765143 ?auto_765152 ) ) ( not ( = ?auto_765143 ?auto_765153 ) ) ( not ( = ?auto_765143 ?auto_765154 ) ) ( not ( = ?auto_765143 ?auto_765155 ) ) ( not ( = ?auto_765143 ?auto_765156 ) ) ( not ( = ?auto_765143 ?auto_765157 ) ) ( not ( = ?auto_765144 ?auto_765145 ) ) ( not ( = ?auto_765144 ?auto_765146 ) ) ( not ( = ?auto_765144 ?auto_765147 ) ) ( not ( = ?auto_765144 ?auto_765148 ) ) ( not ( = ?auto_765144 ?auto_765149 ) ) ( not ( = ?auto_765144 ?auto_765150 ) ) ( not ( = ?auto_765144 ?auto_765151 ) ) ( not ( = ?auto_765144 ?auto_765152 ) ) ( not ( = ?auto_765144 ?auto_765153 ) ) ( not ( = ?auto_765144 ?auto_765154 ) ) ( not ( = ?auto_765144 ?auto_765155 ) ) ( not ( = ?auto_765144 ?auto_765156 ) ) ( not ( = ?auto_765144 ?auto_765157 ) ) ( not ( = ?auto_765145 ?auto_765146 ) ) ( not ( = ?auto_765145 ?auto_765147 ) ) ( not ( = ?auto_765145 ?auto_765148 ) ) ( not ( = ?auto_765145 ?auto_765149 ) ) ( not ( = ?auto_765145 ?auto_765150 ) ) ( not ( = ?auto_765145 ?auto_765151 ) ) ( not ( = ?auto_765145 ?auto_765152 ) ) ( not ( = ?auto_765145 ?auto_765153 ) ) ( not ( = ?auto_765145 ?auto_765154 ) ) ( not ( = ?auto_765145 ?auto_765155 ) ) ( not ( = ?auto_765145 ?auto_765156 ) ) ( not ( = ?auto_765145 ?auto_765157 ) ) ( not ( = ?auto_765146 ?auto_765147 ) ) ( not ( = ?auto_765146 ?auto_765148 ) ) ( not ( = ?auto_765146 ?auto_765149 ) ) ( not ( = ?auto_765146 ?auto_765150 ) ) ( not ( = ?auto_765146 ?auto_765151 ) ) ( not ( = ?auto_765146 ?auto_765152 ) ) ( not ( = ?auto_765146 ?auto_765153 ) ) ( not ( = ?auto_765146 ?auto_765154 ) ) ( not ( = ?auto_765146 ?auto_765155 ) ) ( not ( = ?auto_765146 ?auto_765156 ) ) ( not ( = ?auto_765146 ?auto_765157 ) ) ( not ( = ?auto_765147 ?auto_765148 ) ) ( not ( = ?auto_765147 ?auto_765149 ) ) ( not ( = ?auto_765147 ?auto_765150 ) ) ( not ( = ?auto_765147 ?auto_765151 ) ) ( not ( = ?auto_765147 ?auto_765152 ) ) ( not ( = ?auto_765147 ?auto_765153 ) ) ( not ( = ?auto_765147 ?auto_765154 ) ) ( not ( = ?auto_765147 ?auto_765155 ) ) ( not ( = ?auto_765147 ?auto_765156 ) ) ( not ( = ?auto_765147 ?auto_765157 ) ) ( not ( = ?auto_765148 ?auto_765149 ) ) ( not ( = ?auto_765148 ?auto_765150 ) ) ( not ( = ?auto_765148 ?auto_765151 ) ) ( not ( = ?auto_765148 ?auto_765152 ) ) ( not ( = ?auto_765148 ?auto_765153 ) ) ( not ( = ?auto_765148 ?auto_765154 ) ) ( not ( = ?auto_765148 ?auto_765155 ) ) ( not ( = ?auto_765148 ?auto_765156 ) ) ( not ( = ?auto_765148 ?auto_765157 ) ) ( not ( = ?auto_765149 ?auto_765150 ) ) ( not ( = ?auto_765149 ?auto_765151 ) ) ( not ( = ?auto_765149 ?auto_765152 ) ) ( not ( = ?auto_765149 ?auto_765153 ) ) ( not ( = ?auto_765149 ?auto_765154 ) ) ( not ( = ?auto_765149 ?auto_765155 ) ) ( not ( = ?auto_765149 ?auto_765156 ) ) ( not ( = ?auto_765149 ?auto_765157 ) ) ( not ( = ?auto_765150 ?auto_765151 ) ) ( not ( = ?auto_765150 ?auto_765152 ) ) ( not ( = ?auto_765150 ?auto_765153 ) ) ( not ( = ?auto_765150 ?auto_765154 ) ) ( not ( = ?auto_765150 ?auto_765155 ) ) ( not ( = ?auto_765150 ?auto_765156 ) ) ( not ( = ?auto_765150 ?auto_765157 ) ) ( not ( = ?auto_765151 ?auto_765152 ) ) ( not ( = ?auto_765151 ?auto_765153 ) ) ( not ( = ?auto_765151 ?auto_765154 ) ) ( not ( = ?auto_765151 ?auto_765155 ) ) ( not ( = ?auto_765151 ?auto_765156 ) ) ( not ( = ?auto_765151 ?auto_765157 ) ) ( not ( = ?auto_765152 ?auto_765153 ) ) ( not ( = ?auto_765152 ?auto_765154 ) ) ( not ( = ?auto_765152 ?auto_765155 ) ) ( not ( = ?auto_765152 ?auto_765156 ) ) ( not ( = ?auto_765152 ?auto_765157 ) ) ( not ( = ?auto_765153 ?auto_765154 ) ) ( not ( = ?auto_765153 ?auto_765155 ) ) ( not ( = ?auto_765153 ?auto_765156 ) ) ( not ( = ?auto_765153 ?auto_765157 ) ) ( not ( = ?auto_765154 ?auto_765155 ) ) ( not ( = ?auto_765154 ?auto_765156 ) ) ( not ( = ?auto_765154 ?auto_765157 ) ) ( not ( = ?auto_765155 ?auto_765156 ) ) ( not ( = ?auto_765155 ?auto_765157 ) ) ( not ( = ?auto_765156 ?auto_765157 ) ) ( ON ?auto_765156 ?auto_765157 ) ( ON ?auto_765155 ?auto_765156 ) ( ON ?auto_765154 ?auto_765155 ) ( ON ?auto_765153 ?auto_765154 ) ( CLEAR ?auto_765151 ) ( ON ?auto_765152 ?auto_765153 ) ( CLEAR ?auto_765152 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-13PILE ?auto_765140 ?auto_765141 ?auto_765142 ?auto_765143 ?auto_765144 ?auto_765145 ?auto_765146 ?auto_765147 ?auto_765148 ?auto_765149 ?auto_765150 ?auto_765151 ?auto_765152 )
      ( MAKE-18PILE ?auto_765140 ?auto_765141 ?auto_765142 ?auto_765143 ?auto_765144 ?auto_765145 ?auto_765146 ?auto_765147 ?auto_765148 ?auto_765149 ?auto_765150 ?auto_765151 ?auto_765152 ?auto_765153 ?auto_765154 ?auto_765155 ?auto_765156 ?auto_765157 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_765176 - BLOCK
      ?auto_765177 - BLOCK
      ?auto_765178 - BLOCK
      ?auto_765179 - BLOCK
      ?auto_765180 - BLOCK
      ?auto_765181 - BLOCK
      ?auto_765182 - BLOCK
      ?auto_765183 - BLOCK
      ?auto_765184 - BLOCK
      ?auto_765185 - BLOCK
      ?auto_765186 - BLOCK
      ?auto_765187 - BLOCK
      ?auto_765188 - BLOCK
      ?auto_765189 - BLOCK
      ?auto_765190 - BLOCK
      ?auto_765191 - BLOCK
      ?auto_765192 - BLOCK
      ?auto_765193 - BLOCK
    )
    :vars
    (
      ?auto_765194 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_765193 ?auto_765194 ) ( ON-TABLE ?auto_765176 ) ( ON ?auto_765177 ?auto_765176 ) ( ON ?auto_765178 ?auto_765177 ) ( ON ?auto_765179 ?auto_765178 ) ( ON ?auto_765180 ?auto_765179 ) ( ON ?auto_765181 ?auto_765180 ) ( ON ?auto_765182 ?auto_765181 ) ( ON ?auto_765183 ?auto_765182 ) ( ON ?auto_765184 ?auto_765183 ) ( ON ?auto_765185 ?auto_765184 ) ( ON ?auto_765186 ?auto_765185 ) ( not ( = ?auto_765176 ?auto_765177 ) ) ( not ( = ?auto_765176 ?auto_765178 ) ) ( not ( = ?auto_765176 ?auto_765179 ) ) ( not ( = ?auto_765176 ?auto_765180 ) ) ( not ( = ?auto_765176 ?auto_765181 ) ) ( not ( = ?auto_765176 ?auto_765182 ) ) ( not ( = ?auto_765176 ?auto_765183 ) ) ( not ( = ?auto_765176 ?auto_765184 ) ) ( not ( = ?auto_765176 ?auto_765185 ) ) ( not ( = ?auto_765176 ?auto_765186 ) ) ( not ( = ?auto_765176 ?auto_765187 ) ) ( not ( = ?auto_765176 ?auto_765188 ) ) ( not ( = ?auto_765176 ?auto_765189 ) ) ( not ( = ?auto_765176 ?auto_765190 ) ) ( not ( = ?auto_765176 ?auto_765191 ) ) ( not ( = ?auto_765176 ?auto_765192 ) ) ( not ( = ?auto_765176 ?auto_765193 ) ) ( not ( = ?auto_765176 ?auto_765194 ) ) ( not ( = ?auto_765177 ?auto_765178 ) ) ( not ( = ?auto_765177 ?auto_765179 ) ) ( not ( = ?auto_765177 ?auto_765180 ) ) ( not ( = ?auto_765177 ?auto_765181 ) ) ( not ( = ?auto_765177 ?auto_765182 ) ) ( not ( = ?auto_765177 ?auto_765183 ) ) ( not ( = ?auto_765177 ?auto_765184 ) ) ( not ( = ?auto_765177 ?auto_765185 ) ) ( not ( = ?auto_765177 ?auto_765186 ) ) ( not ( = ?auto_765177 ?auto_765187 ) ) ( not ( = ?auto_765177 ?auto_765188 ) ) ( not ( = ?auto_765177 ?auto_765189 ) ) ( not ( = ?auto_765177 ?auto_765190 ) ) ( not ( = ?auto_765177 ?auto_765191 ) ) ( not ( = ?auto_765177 ?auto_765192 ) ) ( not ( = ?auto_765177 ?auto_765193 ) ) ( not ( = ?auto_765177 ?auto_765194 ) ) ( not ( = ?auto_765178 ?auto_765179 ) ) ( not ( = ?auto_765178 ?auto_765180 ) ) ( not ( = ?auto_765178 ?auto_765181 ) ) ( not ( = ?auto_765178 ?auto_765182 ) ) ( not ( = ?auto_765178 ?auto_765183 ) ) ( not ( = ?auto_765178 ?auto_765184 ) ) ( not ( = ?auto_765178 ?auto_765185 ) ) ( not ( = ?auto_765178 ?auto_765186 ) ) ( not ( = ?auto_765178 ?auto_765187 ) ) ( not ( = ?auto_765178 ?auto_765188 ) ) ( not ( = ?auto_765178 ?auto_765189 ) ) ( not ( = ?auto_765178 ?auto_765190 ) ) ( not ( = ?auto_765178 ?auto_765191 ) ) ( not ( = ?auto_765178 ?auto_765192 ) ) ( not ( = ?auto_765178 ?auto_765193 ) ) ( not ( = ?auto_765178 ?auto_765194 ) ) ( not ( = ?auto_765179 ?auto_765180 ) ) ( not ( = ?auto_765179 ?auto_765181 ) ) ( not ( = ?auto_765179 ?auto_765182 ) ) ( not ( = ?auto_765179 ?auto_765183 ) ) ( not ( = ?auto_765179 ?auto_765184 ) ) ( not ( = ?auto_765179 ?auto_765185 ) ) ( not ( = ?auto_765179 ?auto_765186 ) ) ( not ( = ?auto_765179 ?auto_765187 ) ) ( not ( = ?auto_765179 ?auto_765188 ) ) ( not ( = ?auto_765179 ?auto_765189 ) ) ( not ( = ?auto_765179 ?auto_765190 ) ) ( not ( = ?auto_765179 ?auto_765191 ) ) ( not ( = ?auto_765179 ?auto_765192 ) ) ( not ( = ?auto_765179 ?auto_765193 ) ) ( not ( = ?auto_765179 ?auto_765194 ) ) ( not ( = ?auto_765180 ?auto_765181 ) ) ( not ( = ?auto_765180 ?auto_765182 ) ) ( not ( = ?auto_765180 ?auto_765183 ) ) ( not ( = ?auto_765180 ?auto_765184 ) ) ( not ( = ?auto_765180 ?auto_765185 ) ) ( not ( = ?auto_765180 ?auto_765186 ) ) ( not ( = ?auto_765180 ?auto_765187 ) ) ( not ( = ?auto_765180 ?auto_765188 ) ) ( not ( = ?auto_765180 ?auto_765189 ) ) ( not ( = ?auto_765180 ?auto_765190 ) ) ( not ( = ?auto_765180 ?auto_765191 ) ) ( not ( = ?auto_765180 ?auto_765192 ) ) ( not ( = ?auto_765180 ?auto_765193 ) ) ( not ( = ?auto_765180 ?auto_765194 ) ) ( not ( = ?auto_765181 ?auto_765182 ) ) ( not ( = ?auto_765181 ?auto_765183 ) ) ( not ( = ?auto_765181 ?auto_765184 ) ) ( not ( = ?auto_765181 ?auto_765185 ) ) ( not ( = ?auto_765181 ?auto_765186 ) ) ( not ( = ?auto_765181 ?auto_765187 ) ) ( not ( = ?auto_765181 ?auto_765188 ) ) ( not ( = ?auto_765181 ?auto_765189 ) ) ( not ( = ?auto_765181 ?auto_765190 ) ) ( not ( = ?auto_765181 ?auto_765191 ) ) ( not ( = ?auto_765181 ?auto_765192 ) ) ( not ( = ?auto_765181 ?auto_765193 ) ) ( not ( = ?auto_765181 ?auto_765194 ) ) ( not ( = ?auto_765182 ?auto_765183 ) ) ( not ( = ?auto_765182 ?auto_765184 ) ) ( not ( = ?auto_765182 ?auto_765185 ) ) ( not ( = ?auto_765182 ?auto_765186 ) ) ( not ( = ?auto_765182 ?auto_765187 ) ) ( not ( = ?auto_765182 ?auto_765188 ) ) ( not ( = ?auto_765182 ?auto_765189 ) ) ( not ( = ?auto_765182 ?auto_765190 ) ) ( not ( = ?auto_765182 ?auto_765191 ) ) ( not ( = ?auto_765182 ?auto_765192 ) ) ( not ( = ?auto_765182 ?auto_765193 ) ) ( not ( = ?auto_765182 ?auto_765194 ) ) ( not ( = ?auto_765183 ?auto_765184 ) ) ( not ( = ?auto_765183 ?auto_765185 ) ) ( not ( = ?auto_765183 ?auto_765186 ) ) ( not ( = ?auto_765183 ?auto_765187 ) ) ( not ( = ?auto_765183 ?auto_765188 ) ) ( not ( = ?auto_765183 ?auto_765189 ) ) ( not ( = ?auto_765183 ?auto_765190 ) ) ( not ( = ?auto_765183 ?auto_765191 ) ) ( not ( = ?auto_765183 ?auto_765192 ) ) ( not ( = ?auto_765183 ?auto_765193 ) ) ( not ( = ?auto_765183 ?auto_765194 ) ) ( not ( = ?auto_765184 ?auto_765185 ) ) ( not ( = ?auto_765184 ?auto_765186 ) ) ( not ( = ?auto_765184 ?auto_765187 ) ) ( not ( = ?auto_765184 ?auto_765188 ) ) ( not ( = ?auto_765184 ?auto_765189 ) ) ( not ( = ?auto_765184 ?auto_765190 ) ) ( not ( = ?auto_765184 ?auto_765191 ) ) ( not ( = ?auto_765184 ?auto_765192 ) ) ( not ( = ?auto_765184 ?auto_765193 ) ) ( not ( = ?auto_765184 ?auto_765194 ) ) ( not ( = ?auto_765185 ?auto_765186 ) ) ( not ( = ?auto_765185 ?auto_765187 ) ) ( not ( = ?auto_765185 ?auto_765188 ) ) ( not ( = ?auto_765185 ?auto_765189 ) ) ( not ( = ?auto_765185 ?auto_765190 ) ) ( not ( = ?auto_765185 ?auto_765191 ) ) ( not ( = ?auto_765185 ?auto_765192 ) ) ( not ( = ?auto_765185 ?auto_765193 ) ) ( not ( = ?auto_765185 ?auto_765194 ) ) ( not ( = ?auto_765186 ?auto_765187 ) ) ( not ( = ?auto_765186 ?auto_765188 ) ) ( not ( = ?auto_765186 ?auto_765189 ) ) ( not ( = ?auto_765186 ?auto_765190 ) ) ( not ( = ?auto_765186 ?auto_765191 ) ) ( not ( = ?auto_765186 ?auto_765192 ) ) ( not ( = ?auto_765186 ?auto_765193 ) ) ( not ( = ?auto_765186 ?auto_765194 ) ) ( not ( = ?auto_765187 ?auto_765188 ) ) ( not ( = ?auto_765187 ?auto_765189 ) ) ( not ( = ?auto_765187 ?auto_765190 ) ) ( not ( = ?auto_765187 ?auto_765191 ) ) ( not ( = ?auto_765187 ?auto_765192 ) ) ( not ( = ?auto_765187 ?auto_765193 ) ) ( not ( = ?auto_765187 ?auto_765194 ) ) ( not ( = ?auto_765188 ?auto_765189 ) ) ( not ( = ?auto_765188 ?auto_765190 ) ) ( not ( = ?auto_765188 ?auto_765191 ) ) ( not ( = ?auto_765188 ?auto_765192 ) ) ( not ( = ?auto_765188 ?auto_765193 ) ) ( not ( = ?auto_765188 ?auto_765194 ) ) ( not ( = ?auto_765189 ?auto_765190 ) ) ( not ( = ?auto_765189 ?auto_765191 ) ) ( not ( = ?auto_765189 ?auto_765192 ) ) ( not ( = ?auto_765189 ?auto_765193 ) ) ( not ( = ?auto_765189 ?auto_765194 ) ) ( not ( = ?auto_765190 ?auto_765191 ) ) ( not ( = ?auto_765190 ?auto_765192 ) ) ( not ( = ?auto_765190 ?auto_765193 ) ) ( not ( = ?auto_765190 ?auto_765194 ) ) ( not ( = ?auto_765191 ?auto_765192 ) ) ( not ( = ?auto_765191 ?auto_765193 ) ) ( not ( = ?auto_765191 ?auto_765194 ) ) ( not ( = ?auto_765192 ?auto_765193 ) ) ( not ( = ?auto_765192 ?auto_765194 ) ) ( not ( = ?auto_765193 ?auto_765194 ) ) ( ON ?auto_765192 ?auto_765193 ) ( ON ?auto_765191 ?auto_765192 ) ( ON ?auto_765190 ?auto_765191 ) ( ON ?auto_765189 ?auto_765190 ) ( ON ?auto_765188 ?auto_765189 ) ( CLEAR ?auto_765186 ) ( ON ?auto_765187 ?auto_765188 ) ( CLEAR ?auto_765187 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_765176 ?auto_765177 ?auto_765178 ?auto_765179 ?auto_765180 ?auto_765181 ?auto_765182 ?auto_765183 ?auto_765184 ?auto_765185 ?auto_765186 ?auto_765187 )
      ( MAKE-18PILE ?auto_765176 ?auto_765177 ?auto_765178 ?auto_765179 ?auto_765180 ?auto_765181 ?auto_765182 ?auto_765183 ?auto_765184 ?auto_765185 ?auto_765186 ?auto_765187 ?auto_765188 ?auto_765189 ?auto_765190 ?auto_765191 ?auto_765192 ?auto_765193 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_765213 - BLOCK
      ?auto_765214 - BLOCK
      ?auto_765215 - BLOCK
      ?auto_765216 - BLOCK
      ?auto_765217 - BLOCK
      ?auto_765218 - BLOCK
      ?auto_765219 - BLOCK
      ?auto_765220 - BLOCK
      ?auto_765221 - BLOCK
      ?auto_765222 - BLOCK
      ?auto_765223 - BLOCK
      ?auto_765224 - BLOCK
      ?auto_765225 - BLOCK
      ?auto_765226 - BLOCK
      ?auto_765227 - BLOCK
      ?auto_765228 - BLOCK
      ?auto_765229 - BLOCK
      ?auto_765230 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_765230 ) ( ON-TABLE ?auto_765213 ) ( ON ?auto_765214 ?auto_765213 ) ( ON ?auto_765215 ?auto_765214 ) ( ON ?auto_765216 ?auto_765215 ) ( ON ?auto_765217 ?auto_765216 ) ( ON ?auto_765218 ?auto_765217 ) ( ON ?auto_765219 ?auto_765218 ) ( ON ?auto_765220 ?auto_765219 ) ( ON ?auto_765221 ?auto_765220 ) ( ON ?auto_765222 ?auto_765221 ) ( ON ?auto_765223 ?auto_765222 ) ( not ( = ?auto_765213 ?auto_765214 ) ) ( not ( = ?auto_765213 ?auto_765215 ) ) ( not ( = ?auto_765213 ?auto_765216 ) ) ( not ( = ?auto_765213 ?auto_765217 ) ) ( not ( = ?auto_765213 ?auto_765218 ) ) ( not ( = ?auto_765213 ?auto_765219 ) ) ( not ( = ?auto_765213 ?auto_765220 ) ) ( not ( = ?auto_765213 ?auto_765221 ) ) ( not ( = ?auto_765213 ?auto_765222 ) ) ( not ( = ?auto_765213 ?auto_765223 ) ) ( not ( = ?auto_765213 ?auto_765224 ) ) ( not ( = ?auto_765213 ?auto_765225 ) ) ( not ( = ?auto_765213 ?auto_765226 ) ) ( not ( = ?auto_765213 ?auto_765227 ) ) ( not ( = ?auto_765213 ?auto_765228 ) ) ( not ( = ?auto_765213 ?auto_765229 ) ) ( not ( = ?auto_765213 ?auto_765230 ) ) ( not ( = ?auto_765214 ?auto_765215 ) ) ( not ( = ?auto_765214 ?auto_765216 ) ) ( not ( = ?auto_765214 ?auto_765217 ) ) ( not ( = ?auto_765214 ?auto_765218 ) ) ( not ( = ?auto_765214 ?auto_765219 ) ) ( not ( = ?auto_765214 ?auto_765220 ) ) ( not ( = ?auto_765214 ?auto_765221 ) ) ( not ( = ?auto_765214 ?auto_765222 ) ) ( not ( = ?auto_765214 ?auto_765223 ) ) ( not ( = ?auto_765214 ?auto_765224 ) ) ( not ( = ?auto_765214 ?auto_765225 ) ) ( not ( = ?auto_765214 ?auto_765226 ) ) ( not ( = ?auto_765214 ?auto_765227 ) ) ( not ( = ?auto_765214 ?auto_765228 ) ) ( not ( = ?auto_765214 ?auto_765229 ) ) ( not ( = ?auto_765214 ?auto_765230 ) ) ( not ( = ?auto_765215 ?auto_765216 ) ) ( not ( = ?auto_765215 ?auto_765217 ) ) ( not ( = ?auto_765215 ?auto_765218 ) ) ( not ( = ?auto_765215 ?auto_765219 ) ) ( not ( = ?auto_765215 ?auto_765220 ) ) ( not ( = ?auto_765215 ?auto_765221 ) ) ( not ( = ?auto_765215 ?auto_765222 ) ) ( not ( = ?auto_765215 ?auto_765223 ) ) ( not ( = ?auto_765215 ?auto_765224 ) ) ( not ( = ?auto_765215 ?auto_765225 ) ) ( not ( = ?auto_765215 ?auto_765226 ) ) ( not ( = ?auto_765215 ?auto_765227 ) ) ( not ( = ?auto_765215 ?auto_765228 ) ) ( not ( = ?auto_765215 ?auto_765229 ) ) ( not ( = ?auto_765215 ?auto_765230 ) ) ( not ( = ?auto_765216 ?auto_765217 ) ) ( not ( = ?auto_765216 ?auto_765218 ) ) ( not ( = ?auto_765216 ?auto_765219 ) ) ( not ( = ?auto_765216 ?auto_765220 ) ) ( not ( = ?auto_765216 ?auto_765221 ) ) ( not ( = ?auto_765216 ?auto_765222 ) ) ( not ( = ?auto_765216 ?auto_765223 ) ) ( not ( = ?auto_765216 ?auto_765224 ) ) ( not ( = ?auto_765216 ?auto_765225 ) ) ( not ( = ?auto_765216 ?auto_765226 ) ) ( not ( = ?auto_765216 ?auto_765227 ) ) ( not ( = ?auto_765216 ?auto_765228 ) ) ( not ( = ?auto_765216 ?auto_765229 ) ) ( not ( = ?auto_765216 ?auto_765230 ) ) ( not ( = ?auto_765217 ?auto_765218 ) ) ( not ( = ?auto_765217 ?auto_765219 ) ) ( not ( = ?auto_765217 ?auto_765220 ) ) ( not ( = ?auto_765217 ?auto_765221 ) ) ( not ( = ?auto_765217 ?auto_765222 ) ) ( not ( = ?auto_765217 ?auto_765223 ) ) ( not ( = ?auto_765217 ?auto_765224 ) ) ( not ( = ?auto_765217 ?auto_765225 ) ) ( not ( = ?auto_765217 ?auto_765226 ) ) ( not ( = ?auto_765217 ?auto_765227 ) ) ( not ( = ?auto_765217 ?auto_765228 ) ) ( not ( = ?auto_765217 ?auto_765229 ) ) ( not ( = ?auto_765217 ?auto_765230 ) ) ( not ( = ?auto_765218 ?auto_765219 ) ) ( not ( = ?auto_765218 ?auto_765220 ) ) ( not ( = ?auto_765218 ?auto_765221 ) ) ( not ( = ?auto_765218 ?auto_765222 ) ) ( not ( = ?auto_765218 ?auto_765223 ) ) ( not ( = ?auto_765218 ?auto_765224 ) ) ( not ( = ?auto_765218 ?auto_765225 ) ) ( not ( = ?auto_765218 ?auto_765226 ) ) ( not ( = ?auto_765218 ?auto_765227 ) ) ( not ( = ?auto_765218 ?auto_765228 ) ) ( not ( = ?auto_765218 ?auto_765229 ) ) ( not ( = ?auto_765218 ?auto_765230 ) ) ( not ( = ?auto_765219 ?auto_765220 ) ) ( not ( = ?auto_765219 ?auto_765221 ) ) ( not ( = ?auto_765219 ?auto_765222 ) ) ( not ( = ?auto_765219 ?auto_765223 ) ) ( not ( = ?auto_765219 ?auto_765224 ) ) ( not ( = ?auto_765219 ?auto_765225 ) ) ( not ( = ?auto_765219 ?auto_765226 ) ) ( not ( = ?auto_765219 ?auto_765227 ) ) ( not ( = ?auto_765219 ?auto_765228 ) ) ( not ( = ?auto_765219 ?auto_765229 ) ) ( not ( = ?auto_765219 ?auto_765230 ) ) ( not ( = ?auto_765220 ?auto_765221 ) ) ( not ( = ?auto_765220 ?auto_765222 ) ) ( not ( = ?auto_765220 ?auto_765223 ) ) ( not ( = ?auto_765220 ?auto_765224 ) ) ( not ( = ?auto_765220 ?auto_765225 ) ) ( not ( = ?auto_765220 ?auto_765226 ) ) ( not ( = ?auto_765220 ?auto_765227 ) ) ( not ( = ?auto_765220 ?auto_765228 ) ) ( not ( = ?auto_765220 ?auto_765229 ) ) ( not ( = ?auto_765220 ?auto_765230 ) ) ( not ( = ?auto_765221 ?auto_765222 ) ) ( not ( = ?auto_765221 ?auto_765223 ) ) ( not ( = ?auto_765221 ?auto_765224 ) ) ( not ( = ?auto_765221 ?auto_765225 ) ) ( not ( = ?auto_765221 ?auto_765226 ) ) ( not ( = ?auto_765221 ?auto_765227 ) ) ( not ( = ?auto_765221 ?auto_765228 ) ) ( not ( = ?auto_765221 ?auto_765229 ) ) ( not ( = ?auto_765221 ?auto_765230 ) ) ( not ( = ?auto_765222 ?auto_765223 ) ) ( not ( = ?auto_765222 ?auto_765224 ) ) ( not ( = ?auto_765222 ?auto_765225 ) ) ( not ( = ?auto_765222 ?auto_765226 ) ) ( not ( = ?auto_765222 ?auto_765227 ) ) ( not ( = ?auto_765222 ?auto_765228 ) ) ( not ( = ?auto_765222 ?auto_765229 ) ) ( not ( = ?auto_765222 ?auto_765230 ) ) ( not ( = ?auto_765223 ?auto_765224 ) ) ( not ( = ?auto_765223 ?auto_765225 ) ) ( not ( = ?auto_765223 ?auto_765226 ) ) ( not ( = ?auto_765223 ?auto_765227 ) ) ( not ( = ?auto_765223 ?auto_765228 ) ) ( not ( = ?auto_765223 ?auto_765229 ) ) ( not ( = ?auto_765223 ?auto_765230 ) ) ( not ( = ?auto_765224 ?auto_765225 ) ) ( not ( = ?auto_765224 ?auto_765226 ) ) ( not ( = ?auto_765224 ?auto_765227 ) ) ( not ( = ?auto_765224 ?auto_765228 ) ) ( not ( = ?auto_765224 ?auto_765229 ) ) ( not ( = ?auto_765224 ?auto_765230 ) ) ( not ( = ?auto_765225 ?auto_765226 ) ) ( not ( = ?auto_765225 ?auto_765227 ) ) ( not ( = ?auto_765225 ?auto_765228 ) ) ( not ( = ?auto_765225 ?auto_765229 ) ) ( not ( = ?auto_765225 ?auto_765230 ) ) ( not ( = ?auto_765226 ?auto_765227 ) ) ( not ( = ?auto_765226 ?auto_765228 ) ) ( not ( = ?auto_765226 ?auto_765229 ) ) ( not ( = ?auto_765226 ?auto_765230 ) ) ( not ( = ?auto_765227 ?auto_765228 ) ) ( not ( = ?auto_765227 ?auto_765229 ) ) ( not ( = ?auto_765227 ?auto_765230 ) ) ( not ( = ?auto_765228 ?auto_765229 ) ) ( not ( = ?auto_765228 ?auto_765230 ) ) ( not ( = ?auto_765229 ?auto_765230 ) ) ( ON ?auto_765229 ?auto_765230 ) ( ON ?auto_765228 ?auto_765229 ) ( ON ?auto_765227 ?auto_765228 ) ( ON ?auto_765226 ?auto_765227 ) ( ON ?auto_765225 ?auto_765226 ) ( CLEAR ?auto_765223 ) ( ON ?auto_765224 ?auto_765225 ) ( CLEAR ?auto_765224 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-12PILE ?auto_765213 ?auto_765214 ?auto_765215 ?auto_765216 ?auto_765217 ?auto_765218 ?auto_765219 ?auto_765220 ?auto_765221 ?auto_765222 ?auto_765223 ?auto_765224 )
      ( MAKE-18PILE ?auto_765213 ?auto_765214 ?auto_765215 ?auto_765216 ?auto_765217 ?auto_765218 ?auto_765219 ?auto_765220 ?auto_765221 ?auto_765222 ?auto_765223 ?auto_765224 ?auto_765225 ?auto_765226 ?auto_765227 ?auto_765228 ?auto_765229 ?auto_765230 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_765249 - BLOCK
      ?auto_765250 - BLOCK
      ?auto_765251 - BLOCK
      ?auto_765252 - BLOCK
      ?auto_765253 - BLOCK
      ?auto_765254 - BLOCK
      ?auto_765255 - BLOCK
      ?auto_765256 - BLOCK
      ?auto_765257 - BLOCK
      ?auto_765258 - BLOCK
      ?auto_765259 - BLOCK
      ?auto_765260 - BLOCK
      ?auto_765261 - BLOCK
      ?auto_765262 - BLOCK
      ?auto_765263 - BLOCK
      ?auto_765264 - BLOCK
      ?auto_765265 - BLOCK
      ?auto_765266 - BLOCK
    )
    :vars
    (
      ?auto_765267 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_765266 ?auto_765267 ) ( ON-TABLE ?auto_765249 ) ( ON ?auto_765250 ?auto_765249 ) ( ON ?auto_765251 ?auto_765250 ) ( ON ?auto_765252 ?auto_765251 ) ( ON ?auto_765253 ?auto_765252 ) ( ON ?auto_765254 ?auto_765253 ) ( ON ?auto_765255 ?auto_765254 ) ( ON ?auto_765256 ?auto_765255 ) ( ON ?auto_765257 ?auto_765256 ) ( ON ?auto_765258 ?auto_765257 ) ( not ( = ?auto_765249 ?auto_765250 ) ) ( not ( = ?auto_765249 ?auto_765251 ) ) ( not ( = ?auto_765249 ?auto_765252 ) ) ( not ( = ?auto_765249 ?auto_765253 ) ) ( not ( = ?auto_765249 ?auto_765254 ) ) ( not ( = ?auto_765249 ?auto_765255 ) ) ( not ( = ?auto_765249 ?auto_765256 ) ) ( not ( = ?auto_765249 ?auto_765257 ) ) ( not ( = ?auto_765249 ?auto_765258 ) ) ( not ( = ?auto_765249 ?auto_765259 ) ) ( not ( = ?auto_765249 ?auto_765260 ) ) ( not ( = ?auto_765249 ?auto_765261 ) ) ( not ( = ?auto_765249 ?auto_765262 ) ) ( not ( = ?auto_765249 ?auto_765263 ) ) ( not ( = ?auto_765249 ?auto_765264 ) ) ( not ( = ?auto_765249 ?auto_765265 ) ) ( not ( = ?auto_765249 ?auto_765266 ) ) ( not ( = ?auto_765249 ?auto_765267 ) ) ( not ( = ?auto_765250 ?auto_765251 ) ) ( not ( = ?auto_765250 ?auto_765252 ) ) ( not ( = ?auto_765250 ?auto_765253 ) ) ( not ( = ?auto_765250 ?auto_765254 ) ) ( not ( = ?auto_765250 ?auto_765255 ) ) ( not ( = ?auto_765250 ?auto_765256 ) ) ( not ( = ?auto_765250 ?auto_765257 ) ) ( not ( = ?auto_765250 ?auto_765258 ) ) ( not ( = ?auto_765250 ?auto_765259 ) ) ( not ( = ?auto_765250 ?auto_765260 ) ) ( not ( = ?auto_765250 ?auto_765261 ) ) ( not ( = ?auto_765250 ?auto_765262 ) ) ( not ( = ?auto_765250 ?auto_765263 ) ) ( not ( = ?auto_765250 ?auto_765264 ) ) ( not ( = ?auto_765250 ?auto_765265 ) ) ( not ( = ?auto_765250 ?auto_765266 ) ) ( not ( = ?auto_765250 ?auto_765267 ) ) ( not ( = ?auto_765251 ?auto_765252 ) ) ( not ( = ?auto_765251 ?auto_765253 ) ) ( not ( = ?auto_765251 ?auto_765254 ) ) ( not ( = ?auto_765251 ?auto_765255 ) ) ( not ( = ?auto_765251 ?auto_765256 ) ) ( not ( = ?auto_765251 ?auto_765257 ) ) ( not ( = ?auto_765251 ?auto_765258 ) ) ( not ( = ?auto_765251 ?auto_765259 ) ) ( not ( = ?auto_765251 ?auto_765260 ) ) ( not ( = ?auto_765251 ?auto_765261 ) ) ( not ( = ?auto_765251 ?auto_765262 ) ) ( not ( = ?auto_765251 ?auto_765263 ) ) ( not ( = ?auto_765251 ?auto_765264 ) ) ( not ( = ?auto_765251 ?auto_765265 ) ) ( not ( = ?auto_765251 ?auto_765266 ) ) ( not ( = ?auto_765251 ?auto_765267 ) ) ( not ( = ?auto_765252 ?auto_765253 ) ) ( not ( = ?auto_765252 ?auto_765254 ) ) ( not ( = ?auto_765252 ?auto_765255 ) ) ( not ( = ?auto_765252 ?auto_765256 ) ) ( not ( = ?auto_765252 ?auto_765257 ) ) ( not ( = ?auto_765252 ?auto_765258 ) ) ( not ( = ?auto_765252 ?auto_765259 ) ) ( not ( = ?auto_765252 ?auto_765260 ) ) ( not ( = ?auto_765252 ?auto_765261 ) ) ( not ( = ?auto_765252 ?auto_765262 ) ) ( not ( = ?auto_765252 ?auto_765263 ) ) ( not ( = ?auto_765252 ?auto_765264 ) ) ( not ( = ?auto_765252 ?auto_765265 ) ) ( not ( = ?auto_765252 ?auto_765266 ) ) ( not ( = ?auto_765252 ?auto_765267 ) ) ( not ( = ?auto_765253 ?auto_765254 ) ) ( not ( = ?auto_765253 ?auto_765255 ) ) ( not ( = ?auto_765253 ?auto_765256 ) ) ( not ( = ?auto_765253 ?auto_765257 ) ) ( not ( = ?auto_765253 ?auto_765258 ) ) ( not ( = ?auto_765253 ?auto_765259 ) ) ( not ( = ?auto_765253 ?auto_765260 ) ) ( not ( = ?auto_765253 ?auto_765261 ) ) ( not ( = ?auto_765253 ?auto_765262 ) ) ( not ( = ?auto_765253 ?auto_765263 ) ) ( not ( = ?auto_765253 ?auto_765264 ) ) ( not ( = ?auto_765253 ?auto_765265 ) ) ( not ( = ?auto_765253 ?auto_765266 ) ) ( not ( = ?auto_765253 ?auto_765267 ) ) ( not ( = ?auto_765254 ?auto_765255 ) ) ( not ( = ?auto_765254 ?auto_765256 ) ) ( not ( = ?auto_765254 ?auto_765257 ) ) ( not ( = ?auto_765254 ?auto_765258 ) ) ( not ( = ?auto_765254 ?auto_765259 ) ) ( not ( = ?auto_765254 ?auto_765260 ) ) ( not ( = ?auto_765254 ?auto_765261 ) ) ( not ( = ?auto_765254 ?auto_765262 ) ) ( not ( = ?auto_765254 ?auto_765263 ) ) ( not ( = ?auto_765254 ?auto_765264 ) ) ( not ( = ?auto_765254 ?auto_765265 ) ) ( not ( = ?auto_765254 ?auto_765266 ) ) ( not ( = ?auto_765254 ?auto_765267 ) ) ( not ( = ?auto_765255 ?auto_765256 ) ) ( not ( = ?auto_765255 ?auto_765257 ) ) ( not ( = ?auto_765255 ?auto_765258 ) ) ( not ( = ?auto_765255 ?auto_765259 ) ) ( not ( = ?auto_765255 ?auto_765260 ) ) ( not ( = ?auto_765255 ?auto_765261 ) ) ( not ( = ?auto_765255 ?auto_765262 ) ) ( not ( = ?auto_765255 ?auto_765263 ) ) ( not ( = ?auto_765255 ?auto_765264 ) ) ( not ( = ?auto_765255 ?auto_765265 ) ) ( not ( = ?auto_765255 ?auto_765266 ) ) ( not ( = ?auto_765255 ?auto_765267 ) ) ( not ( = ?auto_765256 ?auto_765257 ) ) ( not ( = ?auto_765256 ?auto_765258 ) ) ( not ( = ?auto_765256 ?auto_765259 ) ) ( not ( = ?auto_765256 ?auto_765260 ) ) ( not ( = ?auto_765256 ?auto_765261 ) ) ( not ( = ?auto_765256 ?auto_765262 ) ) ( not ( = ?auto_765256 ?auto_765263 ) ) ( not ( = ?auto_765256 ?auto_765264 ) ) ( not ( = ?auto_765256 ?auto_765265 ) ) ( not ( = ?auto_765256 ?auto_765266 ) ) ( not ( = ?auto_765256 ?auto_765267 ) ) ( not ( = ?auto_765257 ?auto_765258 ) ) ( not ( = ?auto_765257 ?auto_765259 ) ) ( not ( = ?auto_765257 ?auto_765260 ) ) ( not ( = ?auto_765257 ?auto_765261 ) ) ( not ( = ?auto_765257 ?auto_765262 ) ) ( not ( = ?auto_765257 ?auto_765263 ) ) ( not ( = ?auto_765257 ?auto_765264 ) ) ( not ( = ?auto_765257 ?auto_765265 ) ) ( not ( = ?auto_765257 ?auto_765266 ) ) ( not ( = ?auto_765257 ?auto_765267 ) ) ( not ( = ?auto_765258 ?auto_765259 ) ) ( not ( = ?auto_765258 ?auto_765260 ) ) ( not ( = ?auto_765258 ?auto_765261 ) ) ( not ( = ?auto_765258 ?auto_765262 ) ) ( not ( = ?auto_765258 ?auto_765263 ) ) ( not ( = ?auto_765258 ?auto_765264 ) ) ( not ( = ?auto_765258 ?auto_765265 ) ) ( not ( = ?auto_765258 ?auto_765266 ) ) ( not ( = ?auto_765258 ?auto_765267 ) ) ( not ( = ?auto_765259 ?auto_765260 ) ) ( not ( = ?auto_765259 ?auto_765261 ) ) ( not ( = ?auto_765259 ?auto_765262 ) ) ( not ( = ?auto_765259 ?auto_765263 ) ) ( not ( = ?auto_765259 ?auto_765264 ) ) ( not ( = ?auto_765259 ?auto_765265 ) ) ( not ( = ?auto_765259 ?auto_765266 ) ) ( not ( = ?auto_765259 ?auto_765267 ) ) ( not ( = ?auto_765260 ?auto_765261 ) ) ( not ( = ?auto_765260 ?auto_765262 ) ) ( not ( = ?auto_765260 ?auto_765263 ) ) ( not ( = ?auto_765260 ?auto_765264 ) ) ( not ( = ?auto_765260 ?auto_765265 ) ) ( not ( = ?auto_765260 ?auto_765266 ) ) ( not ( = ?auto_765260 ?auto_765267 ) ) ( not ( = ?auto_765261 ?auto_765262 ) ) ( not ( = ?auto_765261 ?auto_765263 ) ) ( not ( = ?auto_765261 ?auto_765264 ) ) ( not ( = ?auto_765261 ?auto_765265 ) ) ( not ( = ?auto_765261 ?auto_765266 ) ) ( not ( = ?auto_765261 ?auto_765267 ) ) ( not ( = ?auto_765262 ?auto_765263 ) ) ( not ( = ?auto_765262 ?auto_765264 ) ) ( not ( = ?auto_765262 ?auto_765265 ) ) ( not ( = ?auto_765262 ?auto_765266 ) ) ( not ( = ?auto_765262 ?auto_765267 ) ) ( not ( = ?auto_765263 ?auto_765264 ) ) ( not ( = ?auto_765263 ?auto_765265 ) ) ( not ( = ?auto_765263 ?auto_765266 ) ) ( not ( = ?auto_765263 ?auto_765267 ) ) ( not ( = ?auto_765264 ?auto_765265 ) ) ( not ( = ?auto_765264 ?auto_765266 ) ) ( not ( = ?auto_765264 ?auto_765267 ) ) ( not ( = ?auto_765265 ?auto_765266 ) ) ( not ( = ?auto_765265 ?auto_765267 ) ) ( not ( = ?auto_765266 ?auto_765267 ) ) ( ON ?auto_765265 ?auto_765266 ) ( ON ?auto_765264 ?auto_765265 ) ( ON ?auto_765263 ?auto_765264 ) ( ON ?auto_765262 ?auto_765263 ) ( ON ?auto_765261 ?auto_765262 ) ( ON ?auto_765260 ?auto_765261 ) ( CLEAR ?auto_765258 ) ( ON ?auto_765259 ?auto_765260 ) ( CLEAR ?auto_765259 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_765249 ?auto_765250 ?auto_765251 ?auto_765252 ?auto_765253 ?auto_765254 ?auto_765255 ?auto_765256 ?auto_765257 ?auto_765258 ?auto_765259 )
      ( MAKE-18PILE ?auto_765249 ?auto_765250 ?auto_765251 ?auto_765252 ?auto_765253 ?auto_765254 ?auto_765255 ?auto_765256 ?auto_765257 ?auto_765258 ?auto_765259 ?auto_765260 ?auto_765261 ?auto_765262 ?auto_765263 ?auto_765264 ?auto_765265 ?auto_765266 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_765286 - BLOCK
      ?auto_765287 - BLOCK
      ?auto_765288 - BLOCK
      ?auto_765289 - BLOCK
      ?auto_765290 - BLOCK
      ?auto_765291 - BLOCK
      ?auto_765292 - BLOCK
      ?auto_765293 - BLOCK
      ?auto_765294 - BLOCK
      ?auto_765295 - BLOCK
      ?auto_765296 - BLOCK
      ?auto_765297 - BLOCK
      ?auto_765298 - BLOCK
      ?auto_765299 - BLOCK
      ?auto_765300 - BLOCK
      ?auto_765301 - BLOCK
      ?auto_765302 - BLOCK
      ?auto_765303 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_765303 ) ( ON-TABLE ?auto_765286 ) ( ON ?auto_765287 ?auto_765286 ) ( ON ?auto_765288 ?auto_765287 ) ( ON ?auto_765289 ?auto_765288 ) ( ON ?auto_765290 ?auto_765289 ) ( ON ?auto_765291 ?auto_765290 ) ( ON ?auto_765292 ?auto_765291 ) ( ON ?auto_765293 ?auto_765292 ) ( ON ?auto_765294 ?auto_765293 ) ( ON ?auto_765295 ?auto_765294 ) ( not ( = ?auto_765286 ?auto_765287 ) ) ( not ( = ?auto_765286 ?auto_765288 ) ) ( not ( = ?auto_765286 ?auto_765289 ) ) ( not ( = ?auto_765286 ?auto_765290 ) ) ( not ( = ?auto_765286 ?auto_765291 ) ) ( not ( = ?auto_765286 ?auto_765292 ) ) ( not ( = ?auto_765286 ?auto_765293 ) ) ( not ( = ?auto_765286 ?auto_765294 ) ) ( not ( = ?auto_765286 ?auto_765295 ) ) ( not ( = ?auto_765286 ?auto_765296 ) ) ( not ( = ?auto_765286 ?auto_765297 ) ) ( not ( = ?auto_765286 ?auto_765298 ) ) ( not ( = ?auto_765286 ?auto_765299 ) ) ( not ( = ?auto_765286 ?auto_765300 ) ) ( not ( = ?auto_765286 ?auto_765301 ) ) ( not ( = ?auto_765286 ?auto_765302 ) ) ( not ( = ?auto_765286 ?auto_765303 ) ) ( not ( = ?auto_765287 ?auto_765288 ) ) ( not ( = ?auto_765287 ?auto_765289 ) ) ( not ( = ?auto_765287 ?auto_765290 ) ) ( not ( = ?auto_765287 ?auto_765291 ) ) ( not ( = ?auto_765287 ?auto_765292 ) ) ( not ( = ?auto_765287 ?auto_765293 ) ) ( not ( = ?auto_765287 ?auto_765294 ) ) ( not ( = ?auto_765287 ?auto_765295 ) ) ( not ( = ?auto_765287 ?auto_765296 ) ) ( not ( = ?auto_765287 ?auto_765297 ) ) ( not ( = ?auto_765287 ?auto_765298 ) ) ( not ( = ?auto_765287 ?auto_765299 ) ) ( not ( = ?auto_765287 ?auto_765300 ) ) ( not ( = ?auto_765287 ?auto_765301 ) ) ( not ( = ?auto_765287 ?auto_765302 ) ) ( not ( = ?auto_765287 ?auto_765303 ) ) ( not ( = ?auto_765288 ?auto_765289 ) ) ( not ( = ?auto_765288 ?auto_765290 ) ) ( not ( = ?auto_765288 ?auto_765291 ) ) ( not ( = ?auto_765288 ?auto_765292 ) ) ( not ( = ?auto_765288 ?auto_765293 ) ) ( not ( = ?auto_765288 ?auto_765294 ) ) ( not ( = ?auto_765288 ?auto_765295 ) ) ( not ( = ?auto_765288 ?auto_765296 ) ) ( not ( = ?auto_765288 ?auto_765297 ) ) ( not ( = ?auto_765288 ?auto_765298 ) ) ( not ( = ?auto_765288 ?auto_765299 ) ) ( not ( = ?auto_765288 ?auto_765300 ) ) ( not ( = ?auto_765288 ?auto_765301 ) ) ( not ( = ?auto_765288 ?auto_765302 ) ) ( not ( = ?auto_765288 ?auto_765303 ) ) ( not ( = ?auto_765289 ?auto_765290 ) ) ( not ( = ?auto_765289 ?auto_765291 ) ) ( not ( = ?auto_765289 ?auto_765292 ) ) ( not ( = ?auto_765289 ?auto_765293 ) ) ( not ( = ?auto_765289 ?auto_765294 ) ) ( not ( = ?auto_765289 ?auto_765295 ) ) ( not ( = ?auto_765289 ?auto_765296 ) ) ( not ( = ?auto_765289 ?auto_765297 ) ) ( not ( = ?auto_765289 ?auto_765298 ) ) ( not ( = ?auto_765289 ?auto_765299 ) ) ( not ( = ?auto_765289 ?auto_765300 ) ) ( not ( = ?auto_765289 ?auto_765301 ) ) ( not ( = ?auto_765289 ?auto_765302 ) ) ( not ( = ?auto_765289 ?auto_765303 ) ) ( not ( = ?auto_765290 ?auto_765291 ) ) ( not ( = ?auto_765290 ?auto_765292 ) ) ( not ( = ?auto_765290 ?auto_765293 ) ) ( not ( = ?auto_765290 ?auto_765294 ) ) ( not ( = ?auto_765290 ?auto_765295 ) ) ( not ( = ?auto_765290 ?auto_765296 ) ) ( not ( = ?auto_765290 ?auto_765297 ) ) ( not ( = ?auto_765290 ?auto_765298 ) ) ( not ( = ?auto_765290 ?auto_765299 ) ) ( not ( = ?auto_765290 ?auto_765300 ) ) ( not ( = ?auto_765290 ?auto_765301 ) ) ( not ( = ?auto_765290 ?auto_765302 ) ) ( not ( = ?auto_765290 ?auto_765303 ) ) ( not ( = ?auto_765291 ?auto_765292 ) ) ( not ( = ?auto_765291 ?auto_765293 ) ) ( not ( = ?auto_765291 ?auto_765294 ) ) ( not ( = ?auto_765291 ?auto_765295 ) ) ( not ( = ?auto_765291 ?auto_765296 ) ) ( not ( = ?auto_765291 ?auto_765297 ) ) ( not ( = ?auto_765291 ?auto_765298 ) ) ( not ( = ?auto_765291 ?auto_765299 ) ) ( not ( = ?auto_765291 ?auto_765300 ) ) ( not ( = ?auto_765291 ?auto_765301 ) ) ( not ( = ?auto_765291 ?auto_765302 ) ) ( not ( = ?auto_765291 ?auto_765303 ) ) ( not ( = ?auto_765292 ?auto_765293 ) ) ( not ( = ?auto_765292 ?auto_765294 ) ) ( not ( = ?auto_765292 ?auto_765295 ) ) ( not ( = ?auto_765292 ?auto_765296 ) ) ( not ( = ?auto_765292 ?auto_765297 ) ) ( not ( = ?auto_765292 ?auto_765298 ) ) ( not ( = ?auto_765292 ?auto_765299 ) ) ( not ( = ?auto_765292 ?auto_765300 ) ) ( not ( = ?auto_765292 ?auto_765301 ) ) ( not ( = ?auto_765292 ?auto_765302 ) ) ( not ( = ?auto_765292 ?auto_765303 ) ) ( not ( = ?auto_765293 ?auto_765294 ) ) ( not ( = ?auto_765293 ?auto_765295 ) ) ( not ( = ?auto_765293 ?auto_765296 ) ) ( not ( = ?auto_765293 ?auto_765297 ) ) ( not ( = ?auto_765293 ?auto_765298 ) ) ( not ( = ?auto_765293 ?auto_765299 ) ) ( not ( = ?auto_765293 ?auto_765300 ) ) ( not ( = ?auto_765293 ?auto_765301 ) ) ( not ( = ?auto_765293 ?auto_765302 ) ) ( not ( = ?auto_765293 ?auto_765303 ) ) ( not ( = ?auto_765294 ?auto_765295 ) ) ( not ( = ?auto_765294 ?auto_765296 ) ) ( not ( = ?auto_765294 ?auto_765297 ) ) ( not ( = ?auto_765294 ?auto_765298 ) ) ( not ( = ?auto_765294 ?auto_765299 ) ) ( not ( = ?auto_765294 ?auto_765300 ) ) ( not ( = ?auto_765294 ?auto_765301 ) ) ( not ( = ?auto_765294 ?auto_765302 ) ) ( not ( = ?auto_765294 ?auto_765303 ) ) ( not ( = ?auto_765295 ?auto_765296 ) ) ( not ( = ?auto_765295 ?auto_765297 ) ) ( not ( = ?auto_765295 ?auto_765298 ) ) ( not ( = ?auto_765295 ?auto_765299 ) ) ( not ( = ?auto_765295 ?auto_765300 ) ) ( not ( = ?auto_765295 ?auto_765301 ) ) ( not ( = ?auto_765295 ?auto_765302 ) ) ( not ( = ?auto_765295 ?auto_765303 ) ) ( not ( = ?auto_765296 ?auto_765297 ) ) ( not ( = ?auto_765296 ?auto_765298 ) ) ( not ( = ?auto_765296 ?auto_765299 ) ) ( not ( = ?auto_765296 ?auto_765300 ) ) ( not ( = ?auto_765296 ?auto_765301 ) ) ( not ( = ?auto_765296 ?auto_765302 ) ) ( not ( = ?auto_765296 ?auto_765303 ) ) ( not ( = ?auto_765297 ?auto_765298 ) ) ( not ( = ?auto_765297 ?auto_765299 ) ) ( not ( = ?auto_765297 ?auto_765300 ) ) ( not ( = ?auto_765297 ?auto_765301 ) ) ( not ( = ?auto_765297 ?auto_765302 ) ) ( not ( = ?auto_765297 ?auto_765303 ) ) ( not ( = ?auto_765298 ?auto_765299 ) ) ( not ( = ?auto_765298 ?auto_765300 ) ) ( not ( = ?auto_765298 ?auto_765301 ) ) ( not ( = ?auto_765298 ?auto_765302 ) ) ( not ( = ?auto_765298 ?auto_765303 ) ) ( not ( = ?auto_765299 ?auto_765300 ) ) ( not ( = ?auto_765299 ?auto_765301 ) ) ( not ( = ?auto_765299 ?auto_765302 ) ) ( not ( = ?auto_765299 ?auto_765303 ) ) ( not ( = ?auto_765300 ?auto_765301 ) ) ( not ( = ?auto_765300 ?auto_765302 ) ) ( not ( = ?auto_765300 ?auto_765303 ) ) ( not ( = ?auto_765301 ?auto_765302 ) ) ( not ( = ?auto_765301 ?auto_765303 ) ) ( not ( = ?auto_765302 ?auto_765303 ) ) ( ON ?auto_765302 ?auto_765303 ) ( ON ?auto_765301 ?auto_765302 ) ( ON ?auto_765300 ?auto_765301 ) ( ON ?auto_765299 ?auto_765300 ) ( ON ?auto_765298 ?auto_765299 ) ( ON ?auto_765297 ?auto_765298 ) ( CLEAR ?auto_765295 ) ( ON ?auto_765296 ?auto_765297 ) ( CLEAR ?auto_765296 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-11PILE ?auto_765286 ?auto_765287 ?auto_765288 ?auto_765289 ?auto_765290 ?auto_765291 ?auto_765292 ?auto_765293 ?auto_765294 ?auto_765295 ?auto_765296 )
      ( MAKE-18PILE ?auto_765286 ?auto_765287 ?auto_765288 ?auto_765289 ?auto_765290 ?auto_765291 ?auto_765292 ?auto_765293 ?auto_765294 ?auto_765295 ?auto_765296 ?auto_765297 ?auto_765298 ?auto_765299 ?auto_765300 ?auto_765301 ?auto_765302 ?auto_765303 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_765322 - BLOCK
      ?auto_765323 - BLOCK
      ?auto_765324 - BLOCK
      ?auto_765325 - BLOCK
      ?auto_765326 - BLOCK
      ?auto_765327 - BLOCK
      ?auto_765328 - BLOCK
      ?auto_765329 - BLOCK
      ?auto_765330 - BLOCK
      ?auto_765331 - BLOCK
      ?auto_765332 - BLOCK
      ?auto_765333 - BLOCK
      ?auto_765334 - BLOCK
      ?auto_765335 - BLOCK
      ?auto_765336 - BLOCK
      ?auto_765337 - BLOCK
      ?auto_765338 - BLOCK
      ?auto_765339 - BLOCK
    )
    :vars
    (
      ?auto_765340 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_765339 ?auto_765340 ) ( ON-TABLE ?auto_765322 ) ( ON ?auto_765323 ?auto_765322 ) ( ON ?auto_765324 ?auto_765323 ) ( ON ?auto_765325 ?auto_765324 ) ( ON ?auto_765326 ?auto_765325 ) ( ON ?auto_765327 ?auto_765326 ) ( ON ?auto_765328 ?auto_765327 ) ( ON ?auto_765329 ?auto_765328 ) ( ON ?auto_765330 ?auto_765329 ) ( not ( = ?auto_765322 ?auto_765323 ) ) ( not ( = ?auto_765322 ?auto_765324 ) ) ( not ( = ?auto_765322 ?auto_765325 ) ) ( not ( = ?auto_765322 ?auto_765326 ) ) ( not ( = ?auto_765322 ?auto_765327 ) ) ( not ( = ?auto_765322 ?auto_765328 ) ) ( not ( = ?auto_765322 ?auto_765329 ) ) ( not ( = ?auto_765322 ?auto_765330 ) ) ( not ( = ?auto_765322 ?auto_765331 ) ) ( not ( = ?auto_765322 ?auto_765332 ) ) ( not ( = ?auto_765322 ?auto_765333 ) ) ( not ( = ?auto_765322 ?auto_765334 ) ) ( not ( = ?auto_765322 ?auto_765335 ) ) ( not ( = ?auto_765322 ?auto_765336 ) ) ( not ( = ?auto_765322 ?auto_765337 ) ) ( not ( = ?auto_765322 ?auto_765338 ) ) ( not ( = ?auto_765322 ?auto_765339 ) ) ( not ( = ?auto_765322 ?auto_765340 ) ) ( not ( = ?auto_765323 ?auto_765324 ) ) ( not ( = ?auto_765323 ?auto_765325 ) ) ( not ( = ?auto_765323 ?auto_765326 ) ) ( not ( = ?auto_765323 ?auto_765327 ) ) ( not ( = ?auto_765323 ?auto_765328 ) ) ( not ( = ?auto_765323 ?auto_765329 ) ) ( not ( = ?auto_765323 ?auto_765330 ) ) ( not ( = ?auto_765323 ?auto_765331 ) ) ( not ( = ?auto_765323 ?auto_765332 ) ) ( not ( = ?auto_765323 ?auto_765333 ) ) ( not ( = ?auto_765323 ?auto_765334 ) ) ( not ( = ?auto_765323 ?auto_765335 ) ) ( not ( = ?auto_765323 ?auto_765336 ) ) ( not ( = ?auto_765323 ?auto_765337 ) ) ( not ( = ?auto_765323 ?auto_765338 ) ) ( not ( = ?auto_765323 ?auto_765339 ) ) ( not ( = ?auto_765323 ?auto_765340 ) ) ( not ( = ?auto_765324 ?auto_765325 ) ) ( not ( = ?auto_765324 ?auto_765326 ) ) ( not ( = ?auto_765324 ?auto_765327 ) ) ( not ( = ?auto_765324 ?auto_765328 ) ) ( not ( = ?auto_765324 ?auto_765329 ) ) ( not ( = ?auto_765324 ?auto_765330 ) ) ( not ( = ?auto_765324 ?auto_765331 ) ) ( not ( = ?auto_765324 ?auto_765332 ) ) ( not ( = ?auto_765324 ?auto_765333 ) ) ( not ( = ?auto_765324 ?auto_765334 ) ) ( not ( = ?auto_765324 ?auto_765335 ) ) ( not ( = ?auto_765324 ?auto_765336 ) ) ( not ( = ?auto_765324 ?auto_765337 ) ) ( not ( = ?auto_765324 ?auto_765338 ) ) ( not ( = ?auto_765324 ?auto_765339 ) ) ( not ( = ?auto_765324 ?auto_765340 ) ) ( not ( = ?auto_765325 ?auto_765326 ) ) ( not ( = ?auto_765325 ?auto_765327 ) ) ( not ( = ?auto_765325 ?auto_765328 ) ) ( not ( = ?auto_765325 ?auto_765329 ) ) ( not ( = ?auto_765325 ?auto_765330 ) ) ( not ( = ?auto_765325 ?auto_765331 ) ) ( not ( = ?auto_765325 ?auto_765332 ) ) ( not ( = ?auto_765325 ?auto_765333 ) ) ( not ( = ?auto_765325 ?auto_765334 ) ) ( not ( = ?auto_765325 ?auto_765335 ) ) ( not ( = ?auto_765325 ?auto_765336 ) ) ( not ( = ?auto_765325 ?auto_765337 ) ) ( not ( = ?auto_765325 ?auto_765338 ) ) ( not ( = ?auto_765325 ?auto_765339 ) ) ( not ( = ?auto_765325 ?auto_765340 ) ) ( not ( = ?auto_765326 ?auto_765327 ) ) ( not ( = ?auto_765326 ?auto_765328 ) ) ( not ( = ?auto_765326 ?auto_765329 ) ) ( not ( = ?auto_765326 ?auto_765330 ) ) ( not ( = ?auto_765326 ?auto_765331 ) ) ( not ( = ?auto_765326 ?auto_765332 ) ) ( not ( = ?auto_765326 ?auto_765333 ) ) ( not ( = ?auto_765326 ?auto_765334 ) ) ( not ( = ?auto_765326 ?auto_765335 ) ) ( not ( = ?auto_765326 ?auto_765336 ) ) ( not ( = ?auto_765326 ?auto_765337 ) ) ( not ( = ?auto_765326 ?auto_765338 ) ) ( not ( = ?auto_765326 ?auto_765339 ) ) ( not ( = ?auto_765326 ?auto_765340 ) ) ( not ( = ?auto_765327 ?auto_765328 ) ) ( not ( = ?auto_765327 ?auto_765329 ) ) ( not ( = ?auto_765327 ?auto_765330 ) ) ( not ( = ?auto_765327 ?auto_765331 ) ) ( not ( = ?auto_765327 ?auto_765332 ) ) ( not ( = ?auto_765327 ?auto_765333 ) ) ( not ( = ?auto_765327 ?auto_765334 ) ) ( not ( = ?auto_765327 ?auto_765335 ) ) ( not ( = ?auto_765327 ?auto_765336 ) ) ( not ( = ?auto_765327 ?auto_765337 ) ) ( not ( = ?auto_765327 ?auto_765338 ) ) ( not ( = ?auto_765327 ?auto_765339 ) ) ( not ( = ?auto_765327 ?auto_765340 ) ) ( not ( = ?auto_765328 ?auto_765329 ) ) ( not ( = ?auto_765328 ?auto_765330 ) ) ( not ( = ?auto_765328 ?auto_765331 ) ) ( not ( = ?auto_765328 ?auto_765332 ) ) ( not ( = ?auto_765328 ?auto_765333 ) ) ( not ( = ?auto_765328 ?auto_765334 ) ) ( not ( = ?auto_765328 ?auto_765335 ) ) ( not ( = ?auto_765328 ?auto_765336 ) ) ( not ( = ?auto_765328 ?auto_765337 ) ) ( not ( = ?auto_765328 ?auto_765338 ) ) ( not ( = ?auto_765328 ?auto_765339 ) ) ( not ( = ?auto_765328 ?auto_765340 ) ) ( not ( = ?auto_765329 ?auto_765330 ) ) ( not ( = ?auto_765329 ?auto_765331 ) ) ( not ( = ?auto_765329 ?auto_765332 ) ) ( not ( = ?auto_765329 ?auto_765333 ) ) ( not ( = ?auto_765329 ?auto_765334 ) ) ( not ( = ?auto_765329 ?auto_765335 ) ) ( not ( = ?auto_765329 ?auto_765336 ) ) ( not ( = ?auto_765329 ?auto_765337 ) ) ( not ( = ?auto_765329 ?auto_765338 ) ) ( not ( = ?auto_765329 ?auto_765339 ) ) ( not ( = ?auto_765329 ?auto_765340 ) ) ( not ( = ?auto_765330 ?auto_765331 ) ) ( not ( = ?auto_765330 ?auto_765332 ) ) ( not ( = ?auto_765330 ?auto_765333 ) ) ( not ( = ?auto_765330 ?auto_765334 ) ) ( not ( = ?auto_765330 ?auto_765335 ) ) ( not ( = ?auto_765330 ?auto_765336 ) ) ( not ( = ?auto_765330 ?auto_765337 ) ) ( not ( = ?auto_765330 ?auto_765338 ) ) ( not ( = ?auto_765330 ?auto_765339 ) ) ( not ( = ?auto_765330 ?auto_765340 ) ) ( not ( = ?auto_765331 ?auto_765332 ) ) ( not ( = ?auto_765331 ?auto_765333 ) ) ( not ( = ?auto_765331 ?auto_765334 ) ) ( not ( = ?auto_765331 ?auto_765335 ) ) ( not ( = ?auto_765331 ?auto_765336 ) ) ( not ( = ?auto_765331 ?auto_765337 ) ) ( not ( = ?auto_765331 ?auto_765338 ) ) ( not ( = ?auto_765331 ?auto_765339 ) ) ( not ( = ?auto_765331 ?auto_765340 ) ) ( not ( = ?auto_765332 ?auto_765333 ) ) ( not ( = ?auto_765332 ?auto_765334 ) ) ( not ( = ?auto_765332 ?auto_765335 ) ) ( not ( = ?auto_765332 ?auto_765336 ) ) ( not ( = ?auto_765332 ?auto_765337 ) ) ( not ( = ?auto_765332 ?auto_765338 ) ) ( not ( = ?auto_765332 ?auto_765339 ) ) ( not ( = ?auto_765332 ?auto_765340 ) ) ( not ( = ?auto_765333 ?auto_765334 ) ) ( not ( = ?auto_765333 ?auto_765335 ) ) ( not ( = ?auto_765333 ?auto_765336 ) ) ( not ( = ?auto_765333 ?auto_765337 ) ) ( not ( = ?auto_765333 ?auto_765338 ) ) ( not ( = ?auto_765333 ?auto_765339 ) ) ( not ( = ?auto_765333 ?auto_765340 ) ) ( not ( = ?auto_765334 ?auto_765335 ) ) ( not ( = ?auto_765334 ?auto_765336 ) ) ( not ( = ?auto_765334 ?auto_765337 ) ) ( not ( = ?auto_765334 ?auto_765338 ) ) ( not ( = ?auto_765334 ?auto_765339 ) ) ( not ( = ?auto_765334 ?auto_765340 ) ) ( not ( = ?auto_765335 ?auto_765336 ) ) ( not ( = ?auto_765335 ?auto_765337 ) ) ( not ( = ?auto_765335 ?auto_765338 ) ) ( not ( = ?auto_765335 ?auto_765339 ) ) ( not ( = ?auto_765335 ?auto_765340 ) ) ( not ( = ?auto_765336 ?auto_765337 ) ) ( not ( = ?auto_765336 ?auto_765338 ) ) ( not ( = ?auto_765336 ?auto_765339 ) ) ( not ( = ?auto_765336 ?auto_765340 ) ) ( not ( = ?auto_765337 ?auto_765338 ) ) ( not ( = ?auto_765337 ?auto_765339 ) ) ( not ( = ?auto_765337 ?auto_765340 ) ) ( not ( = ?auto_765338 ?auto_765339 ) ) ( not ( = ?auto_765338 ?auto_765340 ) ) ( not ( = ?auto_765339 ?auto_765340 ) ) ( ON ?auto_765338 ?auto_765339 ) ( ON ?auto_765337 ?auto_765338 ) ( ON ?auto_765336 ?auto_765337 ) ( ON ?auto_765335 ?auto_765336 ) ( ON ?auto_765334 ?auto_765335 ) ( ON ?auto_765333 ?auto_765334 ) ( ON ?auto_765332 ?auto_765333 ) ( CLEAR ?auto_765330 ) ( ON ?auto_765331 ?auto_765332 ) ( CLEAR ?auto_765331 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_765322 ?auto_765323 ?auto_765324 ?auto_765325 ?auto_765326 ?auto_765327 ?auto_765328 ?auto_765329 ?auto_765330 ?auto_765331 )
      ( MAKE-18PILE ?auto_765322 ?auto_765323 ?auto_765324 ?auto_765325 ?auto_765326 ?auto_765327 ?auto_765328 ?auto_765329 ?auto_765330 ?auto_765331 ?auto_765332 ?auto_765333 ?auto_765334 ?auto_765335 ?auto_765336 ?auto_765337 ?auto_765338 ?auto_765339 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_765359 - BLOCK
      ?auto_765360 - BLOCK
      ?auto_765361 - BLOCK
      ?auto_765362 - BLOCK
      ?auto_765363 - BLOCK
      ?auto_765364 - BLOCK
      ?auto_765365 - BLOCK
      ?auto_765366 - BLOCK
      ?auto_765367 - BLOCK
      ?auto_765368 - BLOCK
      ?auto_765369 - BLOCK
      ?auto_765370 - BLOCK
      ?auto_765371 - BLOCK
      ?auto_765372 - BLOCK
      ?auto_765373 - BLOCK
      ?auto_765374 - BLOCK
      ?auto_765375 - BLOCK
      ?auto_765376 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_765376 ) ( ON-TABLE ?auto_765359 ) ( ON ?auto_765360 ?auto_765359 ) ( ON ?auto_765361 ?auto_765360 ) ( ON ?auto_765362 ?auto_765361 ) ( ON ?auto_765363 ?auto_765362 ) ( ON ?auto_765364 ?auto_765363 ) ( ON ?auto_765365 ?auto_765364 ) ( ON ?auto_765366 ?auto_765365 ) ( ON ?auto_765367 ?auto_765366 ) ( not ( = ?auto_765359 ?auto_765360 ) ) ( not ( = ?auto_765359 ?auto_765361 ) ) ( not ( = ?auto_765359 ?auto_765362 ) ) ( not ( = ?auto_765359 ?auto_765363 ) ) ( not ( = ?auto_765359 ?auto_765364 ) ) ( not ( = ?auto_765359 ?auto_765365 ) ) ( not ( = ?auto_765359 ?auto_765366 ) ) ( not ( = ?auto_765359 ?auto_765367 ) ) ( not ( = ?auto_765359 ?auto_765368 ) ) ( not ( = ?auto_765359 ?auto_765369 ) ) ( not ( = ?auto_765359 ?auto_765370 ) ) ( not ( = ?auto_765359 ?auto_765371 ) ) ( not ( = ?auto_765359 ?auto_765372 ) ) ( not ( = ?auto_765359 ?auto_765373 ) ) ( not ( = ?auto_765359 ?auto_765374 ) ) ( not ( = ?auto_765359 ?auto_765375 ) ) ( not ( = ?auto_765359 ?auto_765376 ) ) ( not ( = ?auto_765360 ?auto_765361 ) ) ( not ( = ?auto_765360 ?auto_765362 ) ) ( not ( = ?auto_765360 ?auto_765363 ) ) ( not ( = ?auto_765360 ?auto_765364 ) ) ( not ( = ?auto_765360 ?auto_765365 ) ) ( not ( = ?auto_765360 ?auto_765366 ) ) ( not ( = ?auto_765360 ?auto_765367 ) ) ( not ( = ?auto_765360 ?auto_765368 ) ) ( not ( = ?auto_765360 ?auto_765369 ) ) ( not ( = ?auto_765360 ?auto_765370 ) ) ( not ( = ?auto_765360 ?auto_765371 ) ) ( not ( = ?auto_765360 ?auto_765372 ) ) ( not ( = ?auto_765360 ?auto_765373 ) ) ( not ( = ?auto_765360 ?auto_765374 ) ) ( not ( = ?auto_765360 ?auto_765375 ) ) ( not ( = ?auto_765360 ?auto_765376 ) ) ( not ( = ?auto_765361 ?auto_765362 ) ) ( not ( = ?auto_765361 ?auto_765363 ) ) ( not ( = ?auto_765361 ?auto_765364 ) ) ( not ( = ?auto_765361 ?auto_765365 ) ) ( not ( = ?auto_765361 ?auto_765366 ) ) ( not ( = ?auto_765361 ?auto_765367 ) ) ( not ( = ?auto_765361 ?auto_765368 ) ) ( not ( = ?auto_765361 ?auto_765369 ) ) ( not ( = ?auto_765361 ?auto_765370 ) ) ( not ( = ?auto_765361 ?auto_765371 ) ) ( not ( = ?auto_765361 ?auto_765372 ) ) ( not ( = ?auto_765361 ?auto_765373 ) ) ( not ( = ?auto_765361 ?auto_765374 ) ) ( not ( = ?auto_765361 ?auto_765375 ) ) ( not ( = ?auto_765361 ?auto_765376 ) ) ( not ( = ?auto_765362 ?auto_765363 ) ) ( not ( = ?auto_765362 ?auto_765364 ) ) ( not ( = ?auto_765362 ?auto_765365 ) ) ( not ( = ?auto_765362 ?auto_765366 ) ) ( not ( = ?auto_765362 ?auto_765367 ) ) ( not ( = ?auto_765362 ?auto_765368 ) ) ( not ( = ?auto_765362 ?auto_765369 ) ) ( not ( = ?auto_765362 ?auto_765370 ) ) ( not ( = ?auto_765362 ?auto_765371 ) ) ( not ( = ?auto_765362 ?auto_765372 ) ) ( not ( = ?auto_765362 ?auto_765373 ) ) ( not ( = ?auto_765362 ?auto_765374 ) ) ( not ( = ?auto_765362 ?auto_765375 ) ) ( not ( = ?auto_765362 ?auto_765376 ) ) ( not ( = ?auto_765363 ?auto_765364 ) ) ( not ( = ?auto_765363 ?auto_765365 ) ) ( not ( = ?auto_765363 ?auto_765366 ) ) ( not ( = ?auto_765363 ?auto_765367 ) ) ( not ( = ?auto_765363 ?auto_765368 ) ) ( not ( = ?auto_765363 ?auto_765369 ) ) ( not ( = ?auto_765363 ?auto_765370 ) ) ( not ( = ?auto_765363 ?auto_765371 ) ) ( not ( = ?auto_765363 ?auto_765372 ) ) ( not ( = ?auto_765363 ?auto_765373 ) ) ( not ( = ?auto_765363 ?auto_765374 ) ) ( not ( = ?auto_765363 ?auto_765375 ) ) ( not ( = ?auto_765363 ?auto_765376 ) ) ( not ( = ?auto_765364 ?auto_765365 ) ) ( not ( = ?auto_765364 ?auto_765366 ) ) ( not ( = ?auto_765364 ?auto_765367 ) ) ( not ( = ?auto_765364 ?auto_765368 ) ) ( not ( = ?auto_765364 ?auto_765369 ) ) ( not ( = ?auto_765364 ?auto_765370 ) ) ( not ( = ?auto_765364 ?auto_765371 ) ) ( not ( = ?auto_765364 ?auto_765372 ) ) ( not ( = ?auto_765364 ?auto_765373 ) ) ( not ( = ?auto_765364 ?auto_765374 ) ) ( not ( = ?auto_765364 ?auto_765375 ) ) ( not ( = ?auto_765364 ?auto_765376 ) ) ( not ( = ?auto_765365 ?auto_765366 ) ) ( not ( = ?auto_765365 ?auto_765367 ) ) ( not ( = ?auto_765365 ?auto_765368 ) ) ( not ( = ?auto_765365 ?auto_765369 ) ) ( not ( = ?auto_765365 ?auto_765370 ) ) ( not ( = ?auto_765365 ?auto_765371 ) ) ( not ( = ?auto_765365 ?auto_765372 ) ) ( not ( = ?auto_765365 ?auto_765373 ) ) ( not ( = ?auto_765365 ?auto_765374 ) ) ( not ( = ?auto_765365 ?auto_765375 ) ) ( not ( = ?auto_765365 ?auto_765376 ) ) ( not ( = ?auto_765366 ?auto_765367 ) ) ( not ( = ?auto_765366 ?auto_765368 ) ) ( not ( = ?auto_765366 ?auto_765369 ) ) ( not ( = ?auto_765366 ?auto_765370 ) ) ( not ( = ?auto_765366 ?auto_765371 ) ) ( not ( = ?auto_765366 ?auto_765372 ) ) ( not ( = ?auto_765366 ?auto_765373 ) ) ( not ( = ?auto_765366 ?auto_765374 ) ) ( not ( = ?auto_765366 ?auto_765375 ) ) ( not ( = ?auto_765366 ?auto_765376 ) ) ( not ( = ?auto_765367 ?auto_765368 ) ) ( not ( = ?auto_765367 ?auto_765369 ) ) ( not ( = ?auto_765367 ?auto_765370 ) ) ( not ( = ?auto_765367 ?auto_765371 ) ) ( not ( = ?auto_765367 ?auto_765372 ) ) ( not ( = ?auto_765367 ?auto_765373 ) ) ( not ( = ?auto_765367 ?auto_765374 ) ) ( not ( = ?auto_765367 ?auto_765375 ) ) ( not ( = ?auto_765367 ?auto_765376 ) ) ( not ( = ?auto_765368 ?auto_765369 ) ) ( not ( = ?auto_765368 ?auto_765370 ) ) ( not ( = ?auto_765368 ?auto_765371 ) ) ( not ( = ?auto_765368 ?auto_765372 ) ) ( not ( = ?auto_765368 ?auto_765373 ) ) ( not ( = ?auto_765368 ?auto_765374 ) ) ( not ( = ?auto_765368 ?auto_765375 ) ) ( not ( = ?auto_765368 ?auto_765376 ) ) ( not ( = ?auto_765369 ?auto_765370 ) ) ( not ( = ?auto_765369 ?auto_765371 ) ) ( not ( = ?auto_765369 ?auto_765372 ) ) ( not ( = ?auto_765369 ?auto_765373 ) ) ( not ( = ?auto_765369 ?auto_765374 ) ) ( not ( = ?auto_765369 ?auto_765375 ) ) ( not ( = ?auto_765369 ?auto_765376 ) ) ( not ( = ?auto_765370 ?auto_765371 ) ) ( not ( = ?auto_765370 ?auto_765372 ) ) ( not ( = ?auto_765370 ?auto_765373 ) ) ( not ( = ?auto_765370 ?auto_765374 ) ) ( not ( = ?auto_765370 ?auto_765375 ) ) ( not ( = ?auto_765370 ?auto_765376 ) ) ( not ( = ?auto_765371 ?auto_765372 ) ) ( not ( = ?auto_765371 ?auto_765373 ) ) ( not ( = ?auto_765371 ?auto_765374 ) ) ( not ( = ?auto_765371 ?auto_765375 ) ) ( not ( = ?auto_765371 ?auto_765376 ) ) ( not ( = ?auto_765372 ?auto_765373 ) ) ( not ( = ?auto_765372 ?auto_765374 ) ) ( not ( = ?auto_765372 ?auto_765375 ) ) ( not ( = ?auto_765372 ?auto_765376 ) ) ( not ( = ?auto_765373 ?auto_765374 ) ) ( not ( = ?auto_765373 ?auto_765375 ) ) ( not ( = ?auto_765373 ?auto_765376 ) ) ( not ( = ?auto_765374 ?auto_765375 ) ) ( not ( = ?auto_765374 ?auto_765376 ) ) ( not ( = ?auto_765375 ?auto_765376 ) ) ( ON ?auto_765375 ?auto_765376 ) ( ON ?auto_765374 ?auto_765375 ) ( ON ?auto_765373 ?auto_765374 ) ( ON ?auto_765372 ?auto_765373 ) ( ON ?auto_765371 ?auto_765372 ) ( ON ?auto_765370 ?auto_765371 ) ( ON ?auto_765369 ?auto_765370 ) ( CLEAR ?auto_765367 ) ( ON ?auto_765368 ?auto_765369 ) ( CLEAR ?auto_765368 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-10PILE ?auto_765359 ?auto_765360 ?auto_765361 ?auto_765362 ?auto_765363 ?auto_765364 ?auto_765365 ?auto_765366 ?auto_765367 ?auto_765368 )
      ( MAKE-18PILE ?auto_765359 ?auto_765360 ?auto_765361 ?auto_765362 ?auto_765363 ?auto_765364 ?auto_765365 ?auto_765366 ?auto_765367 ?auto_765368 ?auto_765369 ?auto_765370 ?auto_765371 ?auto_765372 ?auto_765373 ?auto_765374 ?auto_765375 ?auto_765376 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_765395 - BLOCK
      ?auto_765396 - BLOCK
      ?auto_765397 - BLOCK
      ?auto_765398 - BLOCK
      ?auto_765399 - BLOCK
      ?auto_765400 - BLOCK
      ?auto_765401 - BLOCK
      ?auto_765402 - BLOCK
      ?auto_765403 - BLOCK
      ?auto_765404 - BLOCK
      ?auto_765405 - BLOCK
      ?auto_765406 - BLOCK
      ?auto_765407 - BLOCK
      ?auto_765408 - BLOCK
      ?auto_765409 - BLOCK
      ?auto_765410 - BLOCK
      ?auto_765411 - BLOCK
      ?auto_765412 - BLOCK
    )
    :vars
    (
      ?auto_765413 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_765412 ?auto_765413 ) ( ON-TABLE ?auto_765395 ) ( ON ?auto_765396 ?auto_765395 ) ( ON ?auto_765397 ?auto_765396 ) ( ON ?auto_765398 ?auto_765397 ) ( ON ?auto_765399 ?auto_765398 ) ( ON ?auto_765400 ?auto_765399 ) ( ON ?auto_765401 ?auto_765400 ) ( ON ?auto_765402 ?auto_765401 ) ( not ( = ?auto_765395 ?auto_765396 ) ) ( not ( = ?auto_765395 ?auto_765397 ) ) ( not ( = ?auto_765395 ?auto_765398 ) ) ( not ( = ?auto_765395 ?auto_765399 ) ) ( not ( = ?auto_765395 ?auto_765400 ) ) ( not ( = ?auto_765395 ?auto_765401 ) ) ( not ( = ?auto_765395 ?auto_765402 ) ) ( not ( = ?auto_765395 ?auto_765403 ) ) ( not ( = ?auto_765395 ?auto_765404 ) ) ( not ( = ?auto_765395 ?auto_765405 ) ) ( not ( = ?auto_765395 ?auto_765406 ) ) ( not ( = ?auto_765395 ?auto_765407 ) ) ( not ( = ?auto_765395 ?auto_765408 ) ) ( not ( = ?auto_765395 ?auto_765409 ) ) ( not ( = ?auto_765395 ?auto_765410 ) ) ( not ( = ?auto_765395 ?auto_765411 ) ) ( not ( = ?auto_765395 ?auto_765412 ) ) ( not ( = ?auto_765395 ?auto_765413 ) ) ( not ( = ?auto_765396 ?auto_765397 ) ) ( not ( = ?auto_765396 ?auto_765398 ) ) ( not ( = ?auto_765396 ?auto_765399 ) ) ( not ( = ?auto_765396 ?auto_765400 ) ) ( not ( = ?auto_765396 ?auto_765401 ) ) ( not ( = ?auto_765396 ?auto_765402 ) ) ( not ( = ?auto_765396 ?auto_765403 ) ) ( not ( = ?auto_765396 ?auto_765404 ) ) ( not ( = ?auto_765396 ?auto_765405 ) ) ( not ( = ?auto_765396 ?auto_765406 ) ) ( not ( = ?auto_765396 ?auto_765407 ) ) ( not ( = ?auto_765396 ?auto_765408 ) ) ( not ( = ?auto_765396 ?auto_765409 ) ) ( not ( = ?auto_765396 ?auto_765410 ) ) ( not ( = ?auto_765396 ?auto_765411 ) ) ( not ( = ?auto_765396 ?auto_765412 ) ) ( not ( = ?auto_765396 ?auto_765413 ) ) ( not ( = ?auto_765397 ?auto_765398 ) ) ( not ( = ?auto_765397 ?auto_765399 ) ) ( not ( = ?auto_765397 ?auto_765400 ) ) ( not ( = ?auto_765397 ?auto_765401 ) ) ( not ( = ?auto_765397 ?auto_765402 ) ) ( not ( = ?auto_765397 ?auto_765403 ) ) ( not ( = ?auto_765397 ?auto_765404 ) ) ( not ( = ?auto_765397 ?auto_765405 ) ) ( not ( = ?auto_765397 ?auto_765406 ) ) ( not ( = ?auto_765397 ?auto_765407 ) ) ( not ( = ?auto_765397 ?auto_765408 ) ) ( not ( = ?auto_765397 ?auto_765409 ) ) ( not ( = ?auto_765397 ?auto_765410 ) ) ( not ( = ?auto_765397 ?auto_765411 ) ) ( not ( = ?auto_765397 ?auto_765412 ) ) ( not ( = ?auto_765397 ?auto_765413 ) ) ( not ( = ?auto_765398 ?auto_765399 ) ) ( not ( = ?auto_765398 ?auto_765400 ) ) ( not ( = ?auto_765398 ?auto_765401 ) ) ( not ( = ?auto_765398 ?auto_765402 ) ) ( not ( = ?auto_765398 ?auto_765403 ) ) ( not ( = ?auto_765398 ?auto_765404 ) ) ( not ( = ?auto_765398 ?auto_765405 ) ) ( not ( = ?auto_765398 ?auto_765406 ) ) ( not ( = ?auto_765398 ?auto_765407 ) ) ( not ( = ?auto_765398 ?auto_765408 ) ) ( not ( = ?auto_765398 ?auto_765409 ) ) ( not ( = ?auto_765398 ?auto_765410 ) ) ( not ( = ?auto_765398 ?auto_765411 ) ) ( not ( = ?auto_765398 ?auto_765412 ) ) ( not ( = ?auto_765398 ?auto_765413 ) ) ( not ( = ?auto_765399 ?auto_765400 ) ) ( not ( = ?auto_765399 ?auto_765401 ) ) ( not ( = ?auto_765399 ?auto_765402 ) ) ( not ( = ?auto_765399 ?auto_765403 ) ) ( not ( = ?auto_765399 ?auto_765404 ) ) ( not ( = ?auto_765399 ?auto_765405 ) ) ( not ( = ?auto_765399 ?auto_765406 ) ) ( not ( = ?auto_765399 ?auto_765407 ) ) ( not ( = ?auto_765399 ?auto_765408 ) ) ( not ( = ?auto_765399 ?auto_765409 ) ) ( not ( = ?auto_765399 ?auto_765410 ) ) ( not ( = ?auto_765399 ?auto_765411 ) ) ( not ( = ?auto_765399 ?auto_765412 ) ) ( not ( = ?auto_765399 ?auto_765413 ) ) ( not ( = ?auto_765400 ?auto_765401 ) ) ( not ( = ?auto_765400 ?auto_765402 ) ) ( not ( = ?auto_765400 ?auto_765403 ) ) ( not ( = ?auto_765400 ?auto_765404 ) ) ( not ( = ?auto_765400 ?auto_765405 ) ) ( not ( = ?auto_765400 ?auto_765406 ) ) ( not ( = ?auto_765400 ?auto_765407 ) ) ( not ( = ?auto_765400 ?auto_765408 ) ) ( not ( = ?auto_765400 ?auto_765409 ) ) ( not ( = ?auto_765400 ?auto_765410 ) ) ( not ( = ?auto_765400 ?auto_765411 ) ) ( not ( = ?auto_765400 ?auto_765412 ) ) ( not ( = ?auto_765400 ?auto_765413 ) ) ( not ( = ?auto_765401 ?auto_765402 ) ) ( not ( = ?auto_765401 ?auto_765403 ) ) ( not ( = ?auto_765401 ?auto_765404 ) ) ( not ( = ?auto_765401 ?auto_765405 ) ) ( not ( = ?auto_765401 ?auto_765406 ) ) ( not ( = ?auto_765401 ?auto_765407 ) ) ( not ( = ?auto_765401 ?auto_765408 ) ) ( not ( = ?auto_765401 ?auto_765409 ) ) ( not ( = ?auto_765401 ?auto_765410 ) ) ( not ( = ?auto_765401 ?auto_765411 ) ) ( not ( = ?auto_765401 ?auto_765412 ) ) ( not ( = ?auto_765401 ?auto_765413 ) ) ( not ( = ?auto_765402 ?auto_765403 ) ) ( not ( = ?auto_765402 ?auto_765404 ) ) ( not ( = ?auto_765402 ?auto_765405 ) ) ( not ( = ?auto_765402 ?auto_765406 ) ) ( not ( = ?auto_765402 ?auto_765407 ) ) ( not ( = ?auto_765402 ?auto_765408 ) ) ( not ( = ?auto_765402 ?auto_765409 ) ) ( not ( = ?auto_765402 ?auto_765410 ) ) ( not ( = ?auto_765402 ?auto_765411 ) ) ( not ( = ?auto_765402 ?auto_765412 ) ) ( not ( = ?auto_765402 ?auto_765413 ) ) ( not ( = ?auto_765403 ?auto_765404 ) ) ( not ( = ?auto_765403 ?auto_765405 ) ) ( not ( = ?auto_765403 ?auto_765406 ) ) ( not ( = ?auto_765403 ?auto_765407 ) ) ( not ( = ?auto_765403 ?auto_765408 ) ) ( not ( = ?auto_765403 ?auto_765409 ) ) ( not ( = ?auto_765403 ?auto_765410 ) ) ( not ( = ?auto_765403 ?auto_765411 ) ) ( not ( = ?auto_765403 ?auto_765412 ) ) ( not ( = ?auto_765403 ?auto_765413 ) ) ( not ( = ?auto_765404 ?auto_765405 ) ) ( not ( = ?auto_765404 ?auto_765406 ) ) ( not ( = ?auto_765404 ?auto_765407 ) ) ( not ( = ?auto_765404 ?auto_765408 ) ) ( not ( = ?auto_765404 ?auto_765409 ) ) ( not ( = ?auto_765404 ?auto_765410 ) ) ( not ( = ?auto_765404 ?auto_765411 ) ) ( not ( = ?auto_765404 ?auto_765412 ) ) ( not ( = ?auto_765404 ?auto_765413 ) ) ( not ( = ?auto_765405 ?auto_765406 ) ) ( not ( = ?auto_765405 ?auto_765407 ) ) ( not ( = ?auto_765405 ?auto_765408 ) ) ( not ( = ?auto_765405 ?auto_765409 ) ) ( not ( = ?auto_765405 ?auto_765410 ) ) ( not ( = ?auto_765405 ?auto_765411 ) ) ( not ( = ?auto_765405 ?auto_765412 ) ) ( not ( = ?auto_765405 ?auto_765413 ) ) ( not ( = ?auto_765406 ?auto_765407 ) ) ( not ( = ?auto_765406 ?auto_765408 ) ) ( not ( = ?auto_765406 ?auto_765409 ) ) ( not ( = ?auto_765406 ?auto_765410 ) ) ( not ( = ?auto_765406 ?auto_765411 ) ) ( not ( = ?auto_765406 ?auto_765412 ) ) ( not ( = ?auto_765406 ?auto_765413 ) ) ( not ( = ?auto_765407 ?auto_765408 ) ) ( not ( = ?auto_765407 ?auto_765409 ) ) ( not ( = ?auto_765407 ?auto_765410 ) ) ( not ( = ?auto_765407 ?auto_765411 ) ) ( not ( = ?auto_765407 ?auto_765412 ) ) ( not ( = ?auto_765407 ?auto_765413 ) ) ( not ( = ?auto_765408 ?auto_765409 ) ) ( not ( = ?auto_765408 ?auto_765410 ) ) ( not ( = ?auto_765408 ?auto_765411 ) ) ( not ( = ?auto_765408 ?auto_765412 ) ) ( not ( = ?auto_765408 ?auto_765413 ) ) ( not ( = ?auto_765409 ?auto_765410 ) ) ( not ( = ?auto_765409 ?auto_765411 ) ) ( not ( = ?auto_765409 ?auto_765412 ) ) ( not ( = ?auto_765409 ?auto_765413 ) ) ( not ( = ?auto_765410 ?auto_765411 ) ) ( not ( = ?auto_765410 ?auto_765412 ) ) ( not ( = ?auto_765410 ?auto_765413 ) ) ( not ( = ?auto_765411 ?auto_765412 ) ) ( not ( = ?auto_765411 ?auto_765413 ) ) ( not ( = ?auto_765412 ?auto_765413 ) ) ( ON ?auto_765411 ?auto_765412 ) ( ON ?auto_765410 ?auto_765411 ) ( ON ?auto_765409 ?auto_765410 ) ( ON ?auto_765408 ?auto_765409 ) ( ON ?auto_765407 ?auto_765408 ) ( ON ?auto_765406 ?auto_765407 ) ( ON ?auto_765405 ?auto_765406 ) ( ON ?auto_765404 ?auto_765405 ) ( CLEAR ?auto_765402 ) ( ON ?auto_765403 ?auto_765404 ) ( CLEAR ?auto_765403 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_765395 ?auto_765396 ?auto_765397 ?auto_765398 ?auto_765399 ?auto_765400 ?auto_765401 ?auto_765402 ?auto_765403 )
      ( MAKE-18PILE ?auto_765395 ?auto_765396 ?auto_765397 ?auto_765398 ?auto_765399 ?auto_765400 ?auto_765401 ?auto_765402 ?auto_765403 ?auto_765404 ?auto_765405 ?auto_765406 ?auto_765407 ?auto_765408 ?auto_765409 ?auto_765410 ?auto_765411 ?auto_765412 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_765432 - BLOCK
      ?auto_765433 - BLOCK
      ?auto_765434 - BLOCK
      ?auto_765435 - BLOCK
      ?auto_765436 - BLOCK
      ?auto_765437 - BLOCK
      ?auto_765438 - BLOCK
      ?auto_765439 - BLOCK
      ?auto_765440 - BLOCK
      ?auto_765441 - BLOCK
      ?auto_765442 - BLOCK
      ?auto_765443 - BLOCK
      ?auto_765444 - BLOCK
      ?auto_765445 - BLOCK
      ?auto_765446 - BLOCK
      ?auto_765447 - BLOCK
      ?auto_765448 - BLOCK
      ?auto_765449 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_765449 ) ( ON-TABLE ?auto_765432 ) ( ON ?auto_765433 ?auto_765432 ) ( ON ?auto_765434 ?auto_765433 ) ( ON ?auto_765435 ?auto_765434 ) ( ON ?auto_765436 ?auto_765435 ) ( ON ?auto_765437 ?auto_765436 ) ( ON ?auto_765438 ?auto_765437 ) ( ON ?auto_765439 ?auto_765438 ) ( not ( = ?auto_765432 ?auto_765433 ) ) ( not ( = ?auto_765432 ?auto_765434 ) ) ( not ( = ?auto_765432 ?auto_765435 ) ) ( not ( = ?auto_765432 ?auto_765436 ) ) ( not ( = ?auto_765432 ?auto_765437 ) ) ( not ( = ?auto_765432 ?auto_765438 ) ) ( not ( = ?auto_765432 ?auto_765439 ) ) ( not ( = ?auto_765432 ?auto_765440 ) ) ( not ( = ?auto_765432 ?auto_765441 ) ) ( not ( = ?auto_765432 ?auto_765442 ) ) ( not ( = ?auto_765432 ?auto_765443 ) ) ( not ( = ?auto_765432 ?auto_765444 ) ) ( not ( = ?auto_765432 ?auto_765445 ) ) ( not ( = ?auto_765432 ?auto_765446 ) ) ( not ( = ?auto_765432 ?auto_765447 ) ) ( not ( = ?auto_765432 ?auto_765448 ) ) ( not ( = ?auto_765432 ?auto_765449 ) ) ( not ( = ?auto_765433 ?auto_765434 ) ) ( not ( = ?auto_765433 ?auto_765435 ) ) ( not ( = ?auto_765433 ?auto_765436 ) ) ( not ( = ?auto_765433 ?auto_765437 ) ) ( not ( = ?auto_765433 ?auto_765438 ) ) ( not ( = ?auto_765433 ?auto_765439 ) ) ( not ( = ?auto_765433 ?auto_765440 ) ) ( not ( = ?auto_765433 ?auto_765441 ) ) ( not ( = ?auto_765433 ?auto_765442 ) ) ( not ( = ?auto_765433 ?auto_765443 ) ) ( not ( = ?auto_765433 ?auto_765444 ) ) ( not ( = ?auto_765433 ?auto_765445 ) ) ( not ( = ?auto_765433 ?auto_765446 ) ) ( not ( = ?auto_765433 ?auto_765447 ) ) ( not ( = ?auto_765433 ?auto_765448 ) ) ( not ( = ?auto_765433 ?auto_765449 ) ) ( not ( = ?auto_765434 ?auto_765435 ) ) ( not ( = ?auto_765434 ?auto_765436 ) ) ( not ( = ?auto_765434 ?auto_765437 ) ) ( not ( = ?auto_765434 ?auto_765438 ) ) ( not ( = ?auto_765434 ?auto_765439 ) ) ( not ( = ?auto_765434 ?auto_765440 ) ) ( not ( = ?auto_765434 ?auto_765441 ) ) ( not ( = ?auto_765434 ?auto_765442 ) ) ( not ( = ?auto_765434 ?auto_765443 ) ) ( not ( = ?auto_765434 ?auto_765444 ) ) ( not ( = ?auto_765434 ?auto_765445 ) ) ( not ( = ?auto_765434 ?auto_765446 ) ) ( not ( = ?auto_765434 ?auto_765447 ) ) ( not ( = ?auto_765434 ?auto_765448 ) ) ( not ( = ?auto_765434 ?auto_765449 ) ) ( not ( = ?auto_765435 ?auto_765436 ) ) ( not ( = ?auto_765435 ?auto_765437 ) ) ( not ( = ?auto_765435 ?auto_765438 ) ) ( not ( = ?auto_765435 ?auto_765439 ) ) ( not ( = ?auto_765435 ?auto_765440 ) ) ( not ( = ?auto_765435 ?auto_765441 ) ) ( not ( = ?auto_765435 ?auto_765442 ) ) ( not ( = ?auto_765435 ?auto_765443 ) ) ( not ( = ?auto_765435 ?auto_765444 ) ) ( not ( = ?auto_765435 ?auto_765445 ) ) ( not ( = ?auto_765435 ?auto_765446 ) ) ( not ( = ?auto_765435 ?auto_765447 ) ) ( not ( = ?auto_765435 ?auto_765448 ) ) ( not ( = ?auto_765435 ?auto_765449 ) ) ( not ( = ?auto_765436 ?auto_765437 ) ) ( not ( = ?auto_765436 ?auto_765438 ) ) ( not ( = ?auto_765436 ?auto_765439 ) ) ( not ( = ?auto_765436 ?auto_765440 ) ) ( not ( = ?auto_765436 ?auto_765441 ) ) ( not ( = ?auto_765436 ?auto_765442 ) ) ( not ( = ?auto_765436 ?auto_765443 ) ) ( not ( = ?auto_765436 ?auto_765444 ) ) ( not ( = ?auto_765436 ?auto_765445 ) ) ( not ( = ?auto_765436 ?auto_765446 ) ) ( not ( = ?auto_765436 ?auto_765447 ) ) ( not ( = ?auto_765436 ?auto_765448 ) ) ( not ( = ?auto_765436 ?auto_765449 ) ) ( not ( = ?auto_765437 ?auto_765438 ) ) ( not ( = ?auto_765437 ?auto_765439 ) ) ( not ( = ?auto_765437 ?auto_765440 ) ) ( not ( = ?auto_765437 ?auto_765441 ) ) ( not ( = ?auto_765437 ?auto_765442 ) ) ( not ( = ?auto_765437 ?auto_765443 ) ) ( not ( = ?auto_765437 ?auto_765444 ) ) ( not ( = ?auto_765437 ?auto_765445 ) ) ( not ( = ?auto_765437 ?auto_765446 ) ) ( not ( = ?auto_765437 ?auto_765447 ) ) ( not ( = ?auto_765437 ?auto_765448 ) ) ( not ( = ?auto_765437 ?auto_765449 ) ) ( not ( = ?auto_765438 ?auto_765439 ) ) ( not ( = ?auto_765438 ?auto_765440 ) ) ( not ( = ?auto_765438 ?auto_765441 ) ) ( not ( = ?auto_765438 ?auto_765442 ) ) ( not ( = ?auto_765438 ?auto_765443 ) ) ( not ( = ?auto_765438 ?auto_765444 ) ) ( not ( = ?auto_765438 ?auto_765445 ) ) ( not ( = ?auto_765438 ?auto_765446 ) ) ( not ( = ?auto_765438 ?auto_765447 ) ) ( not ( = ?auto_765438 ?auto_765448 ) ) ( not ( = ?auto_765438 ?auto_765449 ) ) ( not ( = ?auto_765439 ?auto_765440 ) ) ( not ( = ?auto_765439 ?auto_765441 ) ) ( not ( = ?auto_765439 ?auto_765442 ) ) ( not ( = ?auto_765439 ?auto_765443 ) ) ( not ( = ?auto_765439 ?auto_765444 ) ) ( not ( = ?auto_765439 ?auto_765445 ) ) ( not ( = ?auto_765439 ?auto_765446 ) ) ( not ( = ?auto_765439 ?auto_765447 ) ) ( not ( = ?auto_765439 ?auto_765448 ) ) ( not ( = ?auto_765439 ?auto_765449 ) ) ( not ( = ?auto_765440 ?auto_765441 ) ) ( not ( = ?auto_765440 ?auto_765442 ) ) ( not ( = ?auto_765440 ?auto_765443 ) ) ( not ( = ?auto_765440 ?auto_765444 ) ) ( not ( = ?auto_765440 ?auto_765445 ) ) ( not ( = ?auto_765440 ?auto_765446 ) ) ( not ( = ?auto_765440 ?auto_765447 ) ) ( not ( = ?auto_765440 ?auto_765448 ) ) ( not ( = ?auto_765440 ?auto_765449 ) ) ( not ( = ?auto_765441 ?auto_765442 ) ) ( not ( = ?auto_765441 ?auto_765443 ) ) ( not ( = ?auto_765441 ?auto_765444 ) ) ( not ( = ?auto_765441 ?auto_765445 ) ) ( not ( = ?auto_765441 ?auto_765446 ) ) ( not ( = ?auto_765441 ?auto_765447 ) ) ( not ( = ?auto_765441 ?auto_765448 ) ) ( not ( = ?auto_765441 ?auto_765449 ) ) ( not ( = ?auto_765442 ?auto_765443 ) ) ( not ( = ?auto_765442 ?auto_765444 ) ) ( not ( = ?auto_765442 ?auto_765445 ) ) ( not ( = ?auto_765442 ?auto_765446 ) ) ( not ( = ?auto_765442 ?auto_765447 ) ) ( not ( = ?auto_765442 ?auto_765448 ) ) ( not ( = ?auto_765442 ?auto_765449 ) ) ( not ( = ?auto_765443 ?auto_765444 ) ) ( not ( = ?auto_765443 ?auto_765445 ) ) ( not ( = ?auto_765443 ?auto_765446 ) ) ( not ( = ?auto_765443 ?auto_765447 ) ) ( not ( = ?auto_765443 ?auto_765448 ) ) ( not ( = ?auto_765443 ?auto_765449 ) ) ( not ( = ?auto_765444 ?auto_765445 ) ) ( not ( = ?auto_765444 ?auto_765446 ) ) ( not ( = ?auto_765444 ?auto_765447 ) ) ( not ( = ?auto_765444 ?auto_765448 ) ) ( not ( = ?auto_765444 ?auto_765449 ) ) ( not ( = ?auto_765445 ?auto_765446 ) ) ( not ( = ?auto_765445 ?auto_765447 ) ) ( not ( = ?auto_765445 ?auto_765448 ) ) ( not ( = ?auto_765445 ?auto_765449 ) ) ( not ( = ?auto_765446 ?auto_765447 ) ) ( not ( = ?auto_765446 ?auto_765448 ) ) ( not ( = ?auto_765446 ?auto_765449 ) ) ( not ( = ?auto_765447 ?auto_765448 ) ) ( not ( = ?auto_765447 ?auto_765449 ) ) ( not ( = ?auto_765448 ?auto_765449 ) ) ( ON ?auto_765448 ?auto_765449 ) ( ON ?auto_765447 ?auto_765448 ) ( ON ?auto_765446 ?auto_765447 ) ( ON ?auto_765445 ?auto_765446 ) ( ON ?auto_765444 ?auto_765445 ) ( ON ?auto_765443 ?auto_765444 ) ( ON ?auto_765442 ?auto_765443 ) ( ON ?auto_765441 ?auto_765442 ) ( CLEAR ?auto_765439 ) ( ON ?auto_765440 ?auto_765441 ) ( CLEAR ?auto_765440 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-9PILE ?auto_765432 ?auto_765433 ?auto_765434 ?auto_765435 ?auto_765436 ?auto_765437 ?auto_765438 ?auto_765439 ?auto_765440 )
      ( MAKE-18PILE ?auto_765432 ?auto_765433 ?auto_765434 ?auto_765435 ?auto_765436 ?auto_765437 ?auto_765438 ?auto_765439 ?auto_765440 ?auto_765441 ?auto_765442 ?auto_765443 ?auto_765444 ?auto_765445 ?auto_765446 ?auto_765447 ?auto_765448 ?auto_765449 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_765468 - BLOCK
      ?auto_765469 - BLOCK
      ?auto_765470 - BLOCK
      ?auto_765471 - BLOCK
      ?auto_765472 - BLOCK
      ?auto_765473 - BLOCK
      ?auto_765474 - BLOCK
      ?auto_765475 - BLOCK
      ?auto_765476 - BLOCK
      ?auto_765477 - BLOCK
      ?auto_765478 - BLOCK
      ?auto_765479 - BLOCK
      ?auto_765480 - BLOCK
      ?auto_765481 - BLOCK
      ?auto_765482 - BLOCK
      ?auto_765483 - BLOCK
      ?auto_765484 - BLOCK
      ?auto_765485 - BLOCK
    )
    :vars
    (
      ?auto_765486 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_765485 ?auto_765486 ) ( ON-TABLE ?auto_765468 ) ( ON ?auto_765469 ?auto_765468 ) ( ON ?auto_765470 ?auto_765469 ) ( ON ?auto_765471 ?auto_765470 ) ( ON ?auto_765472 ?auto_765471 ) ( ON ?auto_765473 ?auto_765472 ) ( ON ?auto_765474 ?auto_765473 ) ( not ( = ?auto_765468 ?auto_765469 ) ) ( not ( = ?auto_765468 ?auto_765470 ) ) ( not ( = ?auto_765468 ?auto_765471 ) ) ( not ( = ?auto_765468 ?auto_765472 ) ) ( not ( = ?auto_765468 ?auto_765473 ) ) ( not ( = ?auto_765468 ?auto_765474 ) ) ( not ( = ?auto_765468 ?auto_765475 ) ) ( not ( = ?auto_765468 ?auto_765476 ) ) ( not ( = ?auto_765468 ?auto_765477 ) ) ( not ( = ?auto_765468 ?auto_765478 ) ) ( not ( = ?auto_765468 ?auto_765479 ) ) ( not ( = ?auto_765468 ?auto_765480 ) ) ( not ( = ?auto_765468 ?auto_765481 ) ) ( not ( = ?auto_765468 ?auto_765482 ) ) ( not ( = ?auto_765468 ?auto_765483 ) ) ( not ( = ?auto_765468 ?auto_765484 ) ) ( not ( = ?auto_765468 ?auto_765485 ) ) ( not ( = ?auto_765468 ?auto_765486 ) ) ( not ( = ?auto_765469 ?auto_765470 ) ) ( not ( = ?auto_765469 ?auto_765471 ) ) ( not ( = ?auto_765469 ?auto_765472 ) ) ( not ( = ?auto_765469 ?auto_765473 ) ) ( not ( = ?auto_765469 ?auto_765474 ) ) ( not ( = ?auto_765469 ?auto_765475 ) ) ( not ( = ?auto_765469 ?auto_765476 ) ) ( not ( = ?auto_765469 ?auto_765477 ) ) ( not ( = ?auto_765469 ?auto_765478 ) ) ( not ( = ?auto_765469 ?auto_765479 ) ) ( not ( = ?auto_765469 ?auto_765480 ) ) ( not ( = ?auto_765469 ?auto_765481 ) ) ( not ( = ?auto_765469 ?auto_765482 ) ) ( not ( = ?auto_765469 ?auto_765483 ) ) ( not ( = ?auto_765469 ?auto_765484 ) ) ( not ( = ?auto_765469 ?auto_765485 ) ) ( not ( = ?auto_765469 ?auto_765486 ) ) ( not ( = ?auto_765470 ?auto_765471 ) ) ( not ( = ?auto_765470 ?auto_765472 ) ) ( not ( = ?auto_765470 ?auto_765473 ) ) ( not ( = ?auto_765470 ?auto_765474 ) ) ( not ( = ?auto_765470 ?auto_765475 ) ) ( not ( = ?auto_765470 ?auto_765476 ) ) ( not ( = ?auto_765470 ?auto_765477 ) ) ( not ( = ?auto_765470 ?auto_765478 ) ) ( not ( = ?auto_765470 ?auto_765479 ) ) ( not ( = ?auto_765470 ?auto_765480 ) ) ( not ( = ?auto_765470 ?auto_765481 ) ) ( not ( = ?auto_765470 ?auto_765482 ) ) ( not ( = ?auto_765470 ?auto_765483 ) ) ( not ( = ?auto_765470 ?auto_765484 ) ) ( not ( = ?auto_765470 ?auto_765485 ) ) ( not ( = ?auto_765470 ?auto_765486 ) ) ( not ( = ?auto_765471 ?auto_765472 ) ) ( not ( = ?auto_765471 ?auto_765473 ) ) ( not ( = ?auto_765471 ?auto_765474 ) ) ( not ( = ?auto_765471 ?auto_765475 ) ) ( not ( = ?auto_765471 ?auto_765476 ) ) ( not ( = ?auto_765471 ?auto_765477 ) ) ( not ( = ?auto_765471 ?auto_765478 ) ) ( not ( = ?auto_765471 ?auto_765479 ) ) ( not ( = ?auto_765471 ?auto_765480 ) ) ( not ( = ?auto_765471 ?auto_765481 ) ) ( not ( = ?auto_765471 ?auto_765482 ) ) ( not ( = ?auto_765471 ?auto_765483 ) ) ( not ( = ?auto_765471 ?auto_765484 ) ) ( not ( = ?auto_765471 ?auto_765485 ) ) ( not ( = ?auto_765471 ?auto_765486 ) ) ( not ( = ?auto_765472 ?auto_765473 ) ) ( not ( = ?auto_765472 ?auto_765474 ) ) ( not ( = ?auto_765472 ?auto_765475 ) ) ( not ( = ?auto_765472 ?auto_765476 ) ) ( not ( = ?auto_765472 ?auto_765477 ) ) ( not ( = ?auto_765472 ?auto_765478 ) ) ( not ( = ?auto_765472 ?auto_765479 ) ) ( not ( = ?auto_765472 ?auto_765480 ) ) ( not ( = ?auto_765472 ?auto_765481 ) ) ( not ( = ?auto_765472 ?auto_765482 ) ) ( not ( = ?auto_765472 ?auto_765483 ) ) ( not ( = ?auto_765472 ?auto_765484 ) ) ( not ( = ?auto_765472 ?auto_765485 ) ) ( not ( = ?auto_765472 ?auto_765486 ) ) ( not ( = ?auto_765473 ?auto_765474 ) ) ( not ( = ?auto_765473 ?auto_765475 ) ) ( not ( = ?auto_765473 ?auto_765476 ) ) ( not ( = ?auto_765473 ?auto_765477 ) ) ( not ( = ?auto_765473 ?auto_765478 ) ) ( not ( = ?auto_765473 ?auto_765479 ) ) ( not ( = ?auto_765473 ?auto_765480 ) ) ( not ( = ?auto_765473 ?auto_765481 ) ) ( not ( = ?auto_765473 ?auto_765482 ) ) ( not ( = ?auto_765473 ?auto_765483 ) ) ( not ( = ?auto_765473 ?auto_765484 ) ) ( not ( = ?auto_765473 ?auto_765485 ) ) ( not ( = ?auto_765473 ?auto_765486 ) ) ( not ( = ?auto_765474 ?auto_765475 ) ) ( not ( = ?auto_765474 ?auto_765476 ) ) ( not ( = ?auto_765474 ?auto_765477 ) ) ( not ( = ?auto_765474 ?auto_765478 ) ) ( not ( = ?auto_765474 ?auto_765479 ) ) ( not ( = ?auto_765474 ?auto_765480 ) ) ( not ( = ?auto_765474 ?auto_765481 ) ) ( not ( = ?auto_765474 ?auto_765482 ) ) ( not ( = ?auto_765474 ?auto_765483 ) ) ( not ( = ?auto_765474 ?auto_765484 ) ) ( not ( = ?auto_765474 ?auto_765485 ) ) ( not ( = ?auto_765474 ?auto_765486 ) ) ( not ( = ?auto_765475 ?auto_765476 ) ) ( not ( = ?auto_765475 ?auto_765477 ) ) ( not ( = ?auto_765475 ?auto_765478 ) ) ( not ( = ?auto_765475 ?auto_765479 ) ) ( not ( = ?auto_765475 ?auto_765480 ) ) ( not ( = ?auto_765475 ?auto_765481 ) ) ( not ( = ?auto_765475 ?auto_765482 ) ) ( not ( = ?auto_765475 ?auto_765483 ) ) ( not ( = ?auto_765475 ?auto_765484 ) ) ( not ( = ?auto_765475 ?auto_765485 ) ) ( not ( = ?auto_765475 ?auto_765486 ) ) ( not ( = ?auto_765476 ?auto_765477 ) ) ( not ( = ?auto_765476 ?auto_765478 ) ) ( not ( = ?auto_765476 ?auto_765479 ) ) ( not ( = ?auto_765476 ?auto_765480 ) ) ( not ( = ?auto_765476 ?auto_765481 ) ) ( not ( = ?auto_765476 ?auto_765482 ) ) ( not ( = ?auto_765476 ?auto_765483 ) ) ( not ( = ?auto_765476 ?auto_765484 ) ) ( not ( = ?auto_765476 ?auto_765485 ) ) ( not ( = ?auto_765476 ?auto_765486 ) ) ( not ( = ?auto_765477 ?auto_765478 ) ) ( not ( = ?auto_765477 ?auto_765479 ) ) ( not ( = ?auto_765477 ?auto_765480 ) ) ( not ( = ?auto_765477 ?auto_765481 ) ) ( not ( = ?auto_765477 ?auto_765482 ) ) ( not ( = ?auto_765477 ?auto_765483 ) ) ( not ( = ?auto_765477 ?auto_765484 ) ) ( not ( = ?auto_765477 ?auto_765485 ) ) ( not ( = ?auto_765477 ?auto_765486 ) ) ( not ( = ?auto_765478 ?auto_765479 ) ) ( not ( = ?auto_765478 ?auto_765480 ) ) ( not ( = ?auto_765478 ?auto_765481 ) ) ( not ( = ?auto_765478 ?auto_765482 ) ) ( not ( = ?auto_765478 ?auto_765483 ) ) ( not ( = ?auto_765478 ?auto_765484 ) ) ( not ( = ?auto_765478 ?auto_765485 ) ) ( not ( = ?auto_765478 ?auto_765486 ) ) ( not ( = ?auto_765479 ?auto_765480 ) ) ( not ( = ?auto_765479 ?auto_765481 ) ) ( not ( = ?auto_765479 ?auto_765482 ) ) ( not ( = ?auto_765479 ?auto_765483 ) ) ( not ( = ?auto_765479 ?auto_765484 ) ) ( not ( = ?auto_765479 ?auto_765485 ) ) ( not ( = ?auto_765479 ?auto_765486 ) ) ( not ( = ?auto_765480 ?auto_765481 ) ) ( not ( = ?auto_765480 ?auto_765482 ) ) ( not ( = ?auto_765480 ?auto_765483 ) ) ( not ( = ?auto_765480 ?auto_765484 ) ) ( not ( = ?auto_765480 ?auto_765485 ) ) ( not ( = ?auto_765480 ?auto_765486 ) ) ( not ( = ?auto_765481 ?auto_765482 ) ) ( not ( = ?auto_765481 ?auto_765483 ) ) ( not ( = ?auto_765481 ?auto_765484 ) ) ( not ( = ?auto_765481 ?auto_765485 ) ) ( not ( = ?auto_765481 ?auto_765486 ) ) ( not ( = ?auto_765482 ?auto_765483 ) ) ( not ( = ?auto_765482 ?auto_765484 ) ) ( not ( = ?auto_765482 ?auto_765485 ) ) ( not ( = ?auto_765482 ?auto_765486 ) ) ( not ( = ?auto_765483 ?auto_765484 ) ) ( not ( = ?auto_765483 ?auto_765485 ) ) ( not ( = ?auto_765483 ?auto_765486 ) ) ( not ( = ?auto_765484 ?auto_765485 ) ) ( not ( = ?auto_765484 ?auto_765486 ) ) ( not ( = ?auto_765485 ?auto_765486 ) ) ( ON ?auto_765484 ?auto_765485 ) ( ON ?auto_765483 ?auto_765484 ) ( ON ?auto_765482 ?auto_765483 ) ( ON ?auto_765481 ?auto_765482 ) ( ON ?auto_765480 ?auto_765481 ) ( ON ?auto_765479 ?auto_765480 ) ( ON ?auto_765478 ?auto_765479 ) ( ON ?auto_765477 ?auto_765478 ) ( ON ?auto_765476 ?auto_765477 ) ( CLEAR ?auto_765474 ) ( ON ?auto_765475 ?auto_765476 ) ( CLEAR ?auto_765475 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_765468 ?auto_765469 ?auto_765470 ?auto_765471 ?auto_765472 ?auto_765473 ?auto_765474 ?auto_765475 )
      ( MAKE-18PILE ?auto_765468 ?auto_765469 ?auto_765470 ?auto_765471 ?auto_765472 ?auto_765473 ?auto_765474 ?auto_765475 ?auto_765476 ?auto_765477 ?auto_765478 ?auto_765479 ?auto_765480 ?auto_765481 ?auto_765482 ?auto_765483 ?auto_765484 ?auto_765485 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_765505 - BLOCK
      ?auto_765506 - BLOCK
      ?auto_765507 - BLOCK
      ?auto_765508 - BLOCK
      ?auto_765509 - BLOCK
      ?auto_765510 - BLOCK
      ?auto_765511 - BLOCK
      ?auto_765512 - BLOCK
      ?auto_765513 - BLOCK
      ?auto_765514 - BLOCK
      ?auto_765515 - BLOCK
      ?auto_765516 - BLOCK
      ?auto_765517 - BLOCK
      ?auto_765518 - BLOCK
      ?auto_765519 - BLOCK
      ?auto_765520 - BLOCK
      ?auto_765521 - BLOCK
      ?auto_765522 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_765522 ) ( ON-TABLE ?auto_765505 ) ( ON ?auto_765506 ?auto_765505 ) ( ON ?auto_765507 ?auto_765506 ) ( ON ?auto_765508 ?auto_765507 ) ( ON ?auto_765509 ?auto_765508 ) ( ON ?auto_765510 ?auto_765509 ) ( ON ?auto_765511 ?auto_765510 ) ( not ( = ?auto_765505 ?auto_765506 ) ) ( not ( = ?auto_765505 ?auto_765507 ) ) ( not ( = ?auto_765505 ?auto_765508 ) ) ( not ( = ?auto_765505 ?auto_765509 ) ) ( not ( = ?auto_765505 ?auto_765510 ) ) ( not ( = ?auto_765505 ?auto_765511 ) ) ( not ( = ?auto_765505 ?auto_765512 ) ) ( not ( = ?auto_765505 ?auto_765513 ) ) ( not ( = ?auto_765505 ?auto_765514 ) ) ( not ( = ?auto_765505 ?auto_765515 ) ) ( not ( = ?auto_765505 ?auto_765516 ) ) ( not ( = ?auto_765505 ?auto_765517 ) ) ( not ( = ?auto_765505 ?auto_765518 ) ) ( not ( = ?auto_765505 ?auto_765519 ) ) ( not ( = ?auto_765505 ?auto_765520 ) ) ( not ( = ?auto_765505 ?auto_765521 ) ) ( not ( = ?auto_765505 ?auto_765522 ) ) ( not ( = ?auto_765506 ?auto_765507 ) ) ( not ( = ?auto_765506 ?auto_765508 ) ) ( not ( = ?auto_765506 ?auto_765509 ) ) ( not ( = ?auto_765506 ?auto_765510 ) ) ( not ( = ?auto_765506 ?auto_765511 ) ) ( not ( = ?auto_765506 ?auto_765512 ) ) ( not ( = ?auto_765506 ?auto_765513 ) ) ( not ( = ?auto_765506 ?auto_765514 ) ) ( not ( = ?auto_765506 ?auto_765515 ) ) ( not ( = ?auto_765506 ?auto_765516 ) ) ( not ( = ?auto_765506 ?auto_765517 ) ) ( not ( = ?auto_765506 ?auto_765518 ) ) ( not ( = ?auto_765506 ?auto_765519 ) ) ( not ( = ?auto_765506 ?auto_765520 ) ) ( not ( = ?auto_765506 ?auto_765521 ) ) ( not ( = ?auto_765506 ?auto_765522 ) ) ( not ( = ?auto_765507 ?auto_765508 ) ) ( not ( = ?auto_765507 ?auto_765509 ) ) ( not ( = ?auto_765507 ?auto_765510 ) ) ( not ( = ?auto_765507 ?auto_765511 ) ) ( not ( = ?auto_765507 ?auto_765512 ) ) ( not ( = ?auto_765507 ?auto_765513 ) ) ( not ( = ?auto_765507 ?auto_765514 ) ) ( not ( = ?auto_765507 ?auto_765515 ) ) ( not ( = ?auto_765507 ?auto_765516 ) ) ( not ( = ?auto_765507 ?auto_765517 ) ) ( not ( = ?auto_765507 ?auto_765518 ) ) ( not ( = ?auto_765507 ?auto_765519 ) ) ( not ( = ?auto_765507 ?auto_765520 ) ) ( not ( = ?auto_765507 ?auto_765521 ) ) ( not ( = ?auto_765507 ?auto_765522 ) ) ( not ( = ?auto_765508 ?auto_765509 ) ) ( not ( = ?auto_765508 ?auto_765510 ) ) ( not ( = ?auto_765508 ?auto_765511 ) ) ( not ( = ?auto_765508 ?auto_765512 ) ) ( not ( = ?auto_765508 ?auto_765513 ) ) ( not ( = ?auto_765508 ?auto_765514 ) ) ( not ( = ?auto_765508 ?auto_765515 ) ) ( not ( = ?auto_765508 ?auto_765516 ) ) ( not ( = ?auto_765508 ?auto_765517 ) ) ( not ( = ?auto_765508 ?auto_765518 ) ) ( not ( = ?auto_765508 ?auto_765519 ) ) ( not ( = ?auto_765508 ?auto_765520 ) ) ( not ( = ?auto_765508 ?auto_765521 ) ) ( not ( = ?auto_765508 ?auto_765522 ) ) ( not ( = ?auto_765509 ?auto_765510 ) ) ( not ( = ?auto_765509 ?auto_765511 ) ) ( not ( = ?auto_765509 ?auto_765512 ) ) ( not ( = ?auto_765509 ?auto_765513 ) ) ( not ( = ?auto_765509 ?auto_765514 ) ) ( not ( = ?auto_765509 ?auto_765515 ) ) ( not ( = ?auto_765509 ?auto_765516 ) ) ( not ( = ?auto_765509 ?auto_765517 ) ) ( not ( = ?auto_765509 ?auto_765518 ) ) ( not ( = ?auto_765509 ?auto_765519 ) ) ( not ( = ?auto_765509 ?auto_765520 ) ) ( not ( = ?auto_765509 ?auto_765521 ) ) ( not ( = ?auto_765509 ?auto_765522 ) ) ( not ( = ?auto_765510 ?auto_765511 ) ) ( not ( = ?auto_765510 ?auto_765512 ) ) ( not ( = ?auto_765510 ?auto_765513 ) ) ( not ( = ?auto_765510 ?auto_765514 ) ) ( not ( = ?auto_765510 ?auto_765515 ) ) ( not ( = ?auto_765510 ?auto_765516 ) ) ( not ( = ?auto_765510 ?auto_765517 ) ) ( not ( = ?auto_765510 ?auto_765518 ) ) ( not ( = ?auto_765510 ?auto_765519 ) ) ( not ( = ?auto_765510 ?auto_765520 ) ) ( not ( = ?auto_765510 ?auto_765521 ) ) ( not ( = ?auto_765510 ?auto_765522 ) ) ( not ( = ?auto_765511 ?auto_765512 ) ) ( not ( = ?auto_765511 ?auto_765513 ) ) ( not ( = ?auto_765511 ?auto_765514 ) ) ( not ( = ?auto_765511 ?auto_765515 ) ) ( not ( = ?auto_765511 ?auto_765516 ) ) ( not ( = ?auto_765511 ?auto_765517 ) ) ( not ( = ?auto_765511 ?auto_765518 ) ) ( not ( = ?auto_765511 ?auto_765519 ) ) ( not ( = ?auto_765511 ?auto_765520 ) ) ( not ( = ?auto_765511 ?auto_765521 ) ) ( not ( = ?auto_765511 ?auto_765522 ) ) ( not ( = ?auto_765512 ?auto_765513 ) ) ( not ( = ?auto_765512 ?auto_765514 ) ) ( not ( = ?auto_765512 ?auto_765515 ) ) ( not ( = ?auto_765512 ?auto_765516 ) ) ( not ( = ?auto_765512 ?auto_765517 ) ) ( not ( = ?auto_765512 ?auto_765518 ) ) ( not ( = ?auto_765512 ?auto_765519 ) ) ( not ( = ?auto_765512 ?auto_765520 ) ) ( not ( = ?auto_765512 ?auto_765521 ) ) ( not ( = ?auto_765512 ?auto_765522 ) ) ( not ( = ?auto_765513 ?auto_765514 ) ) ( not ( = ?auto_765513 ?auto_765515 ) ) ( not ( = ?auto_765513 ?auto_765516 ) ) ( not ( = ?auto_765513 ?auto_765517 ) ) ( not ( = ?auto_765513 ?auto_765518 ) ) ( not ( = ?auto_765513 ?auto_765519 ) ) ( not ( = ?auto_765513 ?auto_765520 ) ) ( not ( = ?auto_765513 ?auto_765521 ) ) ( not ( = ?auto_765513 ?auto_765522 ) ) ( not ( = ?auto_765514 ?auto_765515 ) ) ( not ( = ?auto_765514 ?auto_765516 ) ) ( not ( = ?auto_765514 ?auto_765517 ) ) ( not ( = ?auto_765514 ?auto_765518 ) ) ( not ( = ?auto_765514 ?auto_765519 ) ) ( not ( = ?auto_765514 ?auto_765520 ) ) ( not ( = ?auto_765514 ?auto_765521 ) ) ( not ( = ?auto_765514 ?auto_765522 ) ) ( not ( = ?auto_765515 ?auto_765516 ) ) ( not ( = ?auto_765515 ?auto_765517 ) ) ( not ( = ?auto_765515 ?auto_765518 ) ) ( not ( = ?auto_765515 ?auto_765519 ) ) ( not ( = ?auto_765515 ?auto_765520 ) ) ( not ( = ?auto_765515 ?auto_765521 ) ) ( not ( = ?auto_765515 ?auto_765522 ) ) ( not ( = ?auto_765516 ?auto_765517 ) ) ( not ( = ?auto_765516 ?auto_765518 ) ) ( not ( = ?auto_765516 ?auto_765519 ) ) ( not ( = ?auto_765516 ?auto_765520 ) ) ( not ( = ?auto_765516 ?auto_765521 ) ) ( not ( = ?auto_765516 ?auto_765522 ) ) ( not ( = ?auto_765517 ?auto_765518 ) ) ( not ( = ?auto_765517 ?auto_765519 ) ) ( not ( = ?auto_765517 ?auto_765520 ) ) ( not ( = ?auto_765517 ?auto_765521 ) ) ( not ( = ?auto_765517 ?auto_765522 ) ) ( not ( = ?auto_765518 ?auto_765519 ) ) ( not ( = ?auto_765518 ?auto_765520 ) ) ( not ( = ?auto_765518 ?auto_765521 ) ) ( not ( = ?auto_765518 ?auto_765522 ) ) ( not ( = ?auto_765519 ?auto_765520 ) ) ( not ( = ?auto_765519 ?auto_765521 ) ) ( not ( = ?auto_765519 ?auto_765522 ) ) ( not ( = ?auto_765520 ?auto_765521 ) ) ( not ( = ?auto_765520 ?auto_765522 ) ) ( not ( = ?auto_765521 ?auto_765522 ) ) ( ON ?auto_765521 ?auto_765522 ) ( ON ?auto_765520 ?auto_765521 ) ( ON ?auto_765519 ?auto_765520 ) ( ON ?auto_765518 ?auto_765519 ) ( ON ?auto_765517 ?auto_765518 ) ( ON ?auto_765516 ?auto_765517 ) ( ON ?auto_765515 ?auto_765516 ) ( ON ?auto_765514 ?auto_765515 ) ( ON ?auto_765513 ?auto_765514 ) ( CLEAR ?auto_765511 ) ( ON ?auto_765512 ?auto_765513 ) ( CLEAR ?auto_765512 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-8PILE ?auto_765505 ?auto_765506 ?auto_765507 ?auto_765508 ?auto_765509 ?auto_765510 ?auto_765511 ?auto_765512 )
      ( MAKE-18PILE ?auto_765505 ?auto_765506 ?auto_765507 ?auto_765508 ?auto_765509 ?auto_765510 ?auto_765511 ?auto_765512 ?auto_765513 ?auto_765514 ?auto_765515 ?auto_765516 ?auto_765517 ?auto_765518 ?auto_765519 ?auto_765520 ?auto_765521 ?auto_765522 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_765541 - BLOCK
      ?auto_765542 - BLOCK
      ?auto_765543 - BLOCK
      ?auto_765544 - BLOCK
      ?auto_765545 - BLOCK
      ?auto_765546 - BLOCK
      ?auto_765547 - BLOCK
      ?auto_765548 - BLOCK
      ?auto_765549 - BLOCK
      ?auto_765550 - BLOCK
      ?auto_765551 - BLOCK
      ?auto_765552 - BLOCK
      ?auto_765553 - BLOCK
      ?auto_765554 - BLOCK
      ?auto_765555 - BLOCK
      ?auto_765556 - BLOCK
      ?auto_765557 - BLOCK
      ?auto_765558 - BLOCK
    )
    :vars
    (
      ?auto_765559 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_765558 ?auto_765559 ) ( ON-TABLE ?auto_765541 ) ( ON ?auto_765542 ?auto_765541 ) ( ON ?auto_765543 ?auto_765542 ) ( ON ?auto_765544 ?auto_765543 ) ( ON ?auto_765545 ?auto_765544 ) ( ON ?auto_765546 ?auto_765545 ) ( not ( = ?auto_765541 ?auto_765542 ) ) ( not ( = ?auto_765541 ?auto_765543 ) ) ( not ( = ?auto_765541 ?auto_765544 ) ) ( not ( = ?auto_765541 ?auto_765545 ) ) ( not ( = ?auto_765541 ?auto_765546 ) ) ( not ( = ?auto_765541 ?auto_765547 ) ) ( not ( = ?auto_765541 ?auto_765548 ) ) ( not ( = ?auto_765541 ?auto_765549 ) ) ( not ( = ?auto_765541 ?auto_765550 ) ) ( not ( = ?auto_765541 ?auto_765551 ) ) ( not ( = ?auto_765541 ?auto_765552 ) ) ( not ( = ?auto_765541 ?auto_765553 ) ) ( not ( = ?auto_765541 ?auto_765554 ) ) ( not ( = ?auto_765541 ?auto_765555 ) ) ( not ( = ?auto_765541 ?auto_765556 ) ) ( not ( = ?auto_765541 ?auto_765557 ) ) ( not ( = ?auto_765541 ?auto_765558 ) ) ( not ( = ?auto_765541 ?auto_765559 ) ) ( not ( = ?auto_765542 ?auto_765543 ) ) ( not ( = ?auto_765542 ?auto_765544 ) ) ( not ( = ?auto_765542 ?auto_765545 ) ) ( not ( = ?auto_765542 ?auto_765546 ) ) ( not ( = ?auto_765542 ?auto_765547 ) ) ( not ( = ?auto_765542 ?auto_765548 ) ) ( not ( = ?auto_765542 ?auto_765549 ) ) ( not ( = ?auto_765542 ?auto_765550 ) ) ( not ( = ?auto_765542 ?auto_765551 ) ) ( not ( = ?auto_765542 ?auto_765552 ) ) ( not ( = ?auto_765542 ?auto_765553 ) ) ( not ( = ?auto_765542 ?auto_765554 ) ) ( not ( = ?auto_765542 ?auto_765555 ) ) ( not ( = ?auto_765542 ?auto_765556 ) ) ( not ( = ?auto_765542 ?auto_765557 ) ) ( not ( = ?auto_765542 ?auto_765558 ) ) ( not ( = ?auto_765542 ?auto_765559 ) ) ( not ( = ?auto_765543 ?auto_765544 ) ) ( not ( = ?auto_765543 ?auto_765545 ) ) ( not ( = ?auto_765543 ?auto_765546 ) ) ( not ( = ?auto_765543 ?auto_765547 ) ) ( not ( = ?auto_765543 ?auto_765548 ) ) ( not ( = ?auto_765543 ?auto_765549 ) ) ( not ( = ?auto_765543 ?auto_765550 ) ) ( not ( = ?auto_765543 ?auto_765551 ) ) ( not ( = ?auto_765543 ?auto_765552 ) ) ( not ( = ?auto_765543 ?auto_765553 ) ) ( not ( = ?auto_765543 ?auto_765554 ) ) ( not ( = ?auto_765543 ?auto_765555 ) ) ( not ( = ?auto_765543 ?auto_765556 ) ) ( not ( = ?auto_765543 ?auto_765557 ) ) ( not ( = ?auto_765543 ?auto_765558 ) ) ( not ( = ?auto_765543 ?auto_765559 ) ) ( not ( = ?auto_765544 ?auto_765545 ) ) ( not ( = ?auto_765544 ?auto_765546 ) ) ( not ( = ?auto_765544 ?auto_765547 ) ) ( not ( = ?auto_765544 ?auto_765548 ) ) ( not ( = ?auto_765544 ?auto_765549 ) ) ( not ( = ?auto_765544 ?auto_765550 ) ) ( not ( = ?auto_765544 ?auto_765551 ) ) ( not ( = ?auto_765544 ?auto_765552 ) ) ( not ( = ?auto_765544 ?auto_765553 ) ) ( not ( = ?auto_765544 ?auto_765554 ) ) ( not ( = ?auto_765544 ?auto_765555 ) ) ( not ( = ?auto_765544 ?auto_765556 ) ) ( not ( = ?auto_765544 ?auto_765557 ) ) ( not ( = ?auto_765544 ?auto_765558 ) ) ( not ( = ?auto_765544 ?auto_765559 ) ) ( not ( = ?auto_765545 ?auto_765546 ) ) ( not ( = ?auto_765545 ?auto_765547 ) ) ( not ( = ?auto_765545 ?auto_765548 ) ) ( not ( = ?auto_765545 ?auto_765549 ) ) ( not ( = ?auto_765545 ?auto_765550 ) ) ( not ( = ?auto_765545 ?auto_765551 ) ) ( not ( = ?auto_765545 ?auto_765552 ) ) ( not ( = ?auto_765545 ?auto_765553 ) ) ( not ( = ?auto_765545 ?auto_765554 ) ) ( not ( = ?auto_765545 ?auto_765555 ) ) ( not ( = ?auto_765545 ?auto_765556 ) ) ( not ( = ?auto_765545 ?auto_765557 ) ) ( not ( = ?auto_765545 ?auto_765558 ) ) ( not ( = ?auto_765545 ?auto_765559 ) ) ( not ( = ?auto_765546 ?auto_765547 ) ) ( not ( = ?auto_765546 ?auto_765548 ) ) ( not ( = ?auto_765546 ?auto_765549 ) ) ( not ( = ?auto_765546 ?auto_765550 ) ) ( not ( = ?auto_765546 ?auto_765551 ) ) ( not ( = ?auto_765546 ?auto_765552 ) ) ( not ( = ?auto_765546 ?auto_765553 ) ) ( not ( = ?auto_765546 ?auto_765554 ) ) ( not ( = ?auto_765546 ?auto_765555 ) ) ( not ( = ?auto_765546 ?auto_765556 ) ) ( not ( = ?auto_765546 ?auto_765557 ) ) ( not ( = ?auto_765546 ?auto_765558 ) ) ( not ( = ?auto_765546 ?auto_765559 ) ) ( not ( = ?auto_765547 ?auto_765548 ) ) ( not ( = ?auto_765547 ?auto_765549 ) ) ( not ( = ?auto_765547 ?auto_765550 ) ) ( not ( = ?auto_765547 ?auto_765551 ) ) ( not ( = ?auto_765547 ?auto_765552 ) ) ( not ( = ?auto_765547 ?auto_765553 ) ) ( not ( = ?auto_765547 ?auto_765554 ) ) ( not ( = ?auto_765547 ?auto_765555 ) ) ( not ( = ?auto_765547 ?auto_765556 ) ) ( not ( = ?auto_765547 ?auto_765557 ) ) ( not ( = ?auto_765547 ?auto_765558 ) ) ( not ( = ?auto_765547 ?auto_765559 ) ) ( not ( = ?auto_765548 ?auto_765549 ) ) ( not ( = ?auto_765548 ?auto_765550 ) ) ( not ( = ?auto_765548 ?auto_765551 ) ) ( not ( = ?auto_765548 ?auto_765552 ) ) ( not ( = ?auto_765548 ?auto_765553 ) ) ( not ( = ?auto_765548 ?auto_765554 ) ) ( not ( = ?auto_765548 ?auto_765555 ) ) ( not ( = ?auto_765548 ?auto_765556 ) ) ( not ( = ?auto_765548 ?auto_765557 ) ) ( not ( = ?auto_765548 ?auto_765558 ) ) ( not ( = ?auto_765548 ?auto_765559 ) ) ( not ( = ?auto_765549 ?auto_765550 ) ) ( not ( = ?auto_765549 ?auto_765551 ) ) ( not ( = ?auto_765549 ?auto_765552 ) ) ( not ( = ?auto_765549 ?auto_765553 ) ) ( not ( = ?auto_765549 ?auto_765554 ) ) ( not ( = ?auto_765549 ?auto_765555 ) ) ( not ( = ?auto_765549 ?auto_765556 ) ) ( not ( = ?auto_765549 ?auto_765557 ) ) ( not ( = ?auto_765549 ?auto_765558 ) ) ( not ( = ?auto_765549 ?auto_765559 ) ) ( not ( = ?auto_765550 ?auto_765551 ) ) ( not ( = ?auto_765550 ?auto_765552 ) ) ( not ( = ?auto_765550 ?auto_765553 ) ) ( not ( = ?auto_765550 ?auto_765554 ) ) ( not ( = ?auto_765550 ?auto_765555 ) ) ( not ( = ?auto_765550 ?auto_765556 ) ) ( not ( = ?auto_765550 ?auto_765557 ) ) ( not ( = ?auto_765550 ?auto_765558 ) ) ( not ( = ?auto_765550 ?auto_765559 ) ) ( not ( = ?auto_765551 ?auto_765552 ) ) ( not ( = ?auto_765551 ?auto_765553 ) ) ( not ( = ?auto_765551 ?auto_765554 ) ) ( not ( = ?auto_765551 ?auto_765555 ) ) ( not ( = ?auto_765551 ?auto_765556 ) ) ( not ( = ?auto_765551 ?auto_765557 ) ) ( not ( = ?auto_765551 ?auto_765558 ) ) ( not ( = ?auto_765551 ?auto_765559 ) ) ( not ( = ?auto_765552 ?auto_765553 ) ) ( not ( = ?auto_765552 ?auto_765554 ) ) ( not ( = ?auto_765552 ?auto_765555 ) ) ( not ( = ?auto_765552 ?auto_765556 ) ) ( not ( = ?auto_765552 ?auto_765557 ) ) ( not ( = ?auto_765552 ?auto_765558 ) ) ( not ( = ?auto_765552 ?auto_765559 ) ) ( not ( = ?auto_765553 ?auto_765554 ) ) ( not ( = ?auto_765553 ?auto_765555 ) ) ( not ( = ?auto_765553 ?auto_765556 ) ) ( not ( = ?auto_765553 ?auto_765557 ) ) ( not ( = ?auto_765553 ?auto_765558 ) ) ( not ( = ?auto_765553 ?auto_765559 ) ) ( not ( = ?auto_765554 ?auto_765555 ) ) ( not ( = ?auto_765554 ?auto_765556 ) ) ( not ( = ?auto_765554 ?auto_765557 ) ) ( not ( = ?auto_765554 ?auto_765558 ) ) ( not ( = ?auto_765554 ?auto_765559 ) ) ( not ( = ?auto_765555 ?auto_765556 ) ) ( not ( = ?auto_765555 ?auto_765557 ) ) ( not ( = ?auto_765555 ?auto_765558 ) ) ( not ( = ?auto_765555 ?auto_765559 ) ) ( not ( = ?auto_765556 ?auto_765557 ) ) ( not ( = ?auto_765556 ?auto_765558 ) ) ( not ( = ?auto_765556 ?auto_765559 ) ) ( not ( = ?auto_765557 ?auto_765558 ) ) ( not ( = ?auto_765557 ?auto_765559 ) ) ( not ( = ?auto_765558 ?auto_765559 ) ) ( ON ?auto_765557 ?auto_765558 ) ( ON ?auto_765556 ?auto_765557 ) ( ON ?auto_765555 ?auto_765556 ) ( ON ?auto_765554 ?auto_765555 ) ( ON ?auto_765553 ?auto_765554 ) ( ON ?auto_765552 ?auto_765553 ) ( ON ?auto_765551 ?auto_765552 ) ( ON ?auto_765550 ?auto_765551 ) ( ON ?auto_765549 ?auto_765550 ) ( ON ?auto_765548 ?auto_765549 ) ( CLEAR ?auto_765546 ) ( ON ?auto_765547 ?auto_765548 ) ( CLEAR ?auto_765547 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_765541 ?auto_765542 ?auto_765543 ?auto_765544 ?auto_765545 ?auto_765546 ?auto_765547 )
      ( MAKE-18PILE ?auto_765541 ?auto_765542 ?auto_765543 ?auto_765544 ?auto_765545 ?auto_765546 ?auto_765547 ?auto_765548 ?auto_765549 ?auto_765550 ?auto_765551 ?auto_765552 ?auto_765553 ?auto_765554 ?auto_765555 ?auto_765556 ?auto_765557 ?auto_765558 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_765578 - BLOCK
      ?auto_765579 - BLOCK
      ?auto_765580 - BLOCK
      ?auto_765581 - BLOCK
      ?auto_765582 - BLOCK
      ?auto_765583 - BLOCK
      ?auto_765584 - BLOCK
      ?auto_765585 - BLOCK
      ?auto_765586 - BLOCK
      ?auto_765587 - BLOCK
      ?auto_765588 - BLOCK
      ?auto_765589 - BLOCK
      ?auto_765590 - BLOCK
      ?auto_765591 - BLOCK
      ?auto_765592 - BLOCK
      ?auto_765593 - BLOCK
      ?auto_765594 - BLOCK
      ?auto_765595 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_765595 ) ( ON-TABLE ?auto_765578 ) ( ON ?auto_765579 ?auto_765578 ) ( ON ?auto_765580 ?auto_765579 ) ( ON ?auto_765581 ?auto_765580 ) ( ON ?auto_765582 ?auto_765581 ) ( ON ?auto_765583 ?auto_765582 ) ( not ( = ?auto_765578 ?auto_765579 ) ) ( not ( = ?auto_765578 ?auto_765580 ) ) ( not ( = ?auto_765578 ?auto_765581 ) ) ( not ( = ?auto_765578 ?auto_765582 ) ) ( not ( = ?auto_765578 ?auto_765583 ) ) ( not ( = ?auto_765578 ?auto_765584 ) ) ( not ( = ?auto_765578 ?auto_765585 ) ) ( not ( = ?auto_765578 ?auto_765586 ) ) ( not ( = ?auto_765578 ?auto_765587 ) ) ( not ( = ?auto_765578 ?auto_765588 ) ) ( not ( = ?auto_765578 ?auto_765589 ) ) ( not ( = ?auto_765578 ?auto_765590 ) ) ( not ( = ?auto_765578 ?auto_765591 ) ) ( not ( = ?auto_765578 ?auto_765592 ) ) ( not ( = ?auto_765578 ?auto_765593 ) ) ( not ( = ?auto_765578 ?auto_765594 ) ) ( not ( = ?auto_765578 ?auto_765595 ) ) ( not ( = ?auto_765579 ?auto_765580 ) ) ( not ( = ?auto_765579 ?auto_765581 ) ) ( not ( = ?auto_765579 ?auto_765582 ) ) ( not ( = ?auto_765579 ?auto_765583 ) ) ( not ( = ?auto_765579 ?auto_765584 ) ) ( not ( = ?auto_765579 ?auto_765585 ) ) ( not ( = ?auto_765579 ?auto_765586 ) ) ( not ( = ?auto_765579 ?auto_765587 ) ) ( not ( = ?auto_765579 ?auto_765588 ) ) ( not ( = ?auto_765579 ?auto_765589 ) ) ( not ( = ?auto_765579 ?auto_765590 ) ) ( not ( = ?auto_765579 ?auto_765591 ) ) ( not ( = ?auto_765579 ?auto_765592 ) ) ( not ( = ?auto_765579 ?auto_765593 ) ) ( not ( = ?auto_765579 ?auto_765594 ) ) ( not ( = ?auto_765579 ?auto_765595 ) ) ( not ( = ?auto_765580 ?auto_765581 ) ) ( not ( = ?auto_765580 ?auto_765582 ) ) ( not ( = ?auto_765580 ?auto_765583 ) ) ( not ( = ?auto_765580 ?auto_765584 ) ) ( not ( = ?auto_765580 ?auto_765585 ) ) ( not ( = ?auto_765580 ?auto_765586 ) ) ( not ( = ?auto_765580 ?auto_765587 ) ) ( not ( = ?auto_765580 ?auto_765588 ) ) ( not ( = ?auto_765580 ?auto_765589 ) ) ( not ( = ?auto_765580 ?auto_765590 ) ) ( not ( = ?auto_765580 ?auto_765591 ) ) ( not ( = ?auto_765580 ?auto_765592 ) ) ( not ( = ?auto_765580 ?auto_765593 ) ) ( not ( = ?auto_765580 ?auto_765594 ) ) ( not ( = ?auto_765580 ?auto_765595 ) ) ( not ( = ?auto_765581 ?auto_765582 ) ) ( not ( = ?auto_765581 ?auto_765583 ) ) ( not ( = ?auto_765581 ?auto_765584 ) ) ( not ( = ?auto_765581 ?auto_765585 ) ) ( not ( = ?auto_765581 ?auto_765586 ) ) ( not ( = ?auto_765581 ?auto_765587 ) ) ( not ( = ?auto_765581 ?auto_765588 ) ) ( not ( = ?auto_765581 ?auto_765589 ) ) ( not ( = ?auto_765581 ?auto_765590 ) ) ( not ( = ?auto_765581 ?auto_765591 ) ) ( not ( = ?auto_765581 ?auto_765592 ) ) ( not ( = ?auto_765581 ?auto_765593 ) ) ( not ( = ?auto_765581 ?auto_765594 ) ) ( not ( = ?auto_765581 ?auto_765595 ) ) ( not ( = ?auto_765582 ?auto_765583 ) ) ( not ( = ?auto_765582 ?auto_765584 ) ) ( not ( = ?auto_765582 ?auto_765585 ) ) ( not ( = ?auto_765582 ?auto_765586 ) ) ( not ( = ?auto_765582 ?auto_765587 ) ) ( not ( = ?auto_765582 ?auto_765588 ) ) ( not ( = ?auto_765582 ?auto_765589 ) ) ( not ( = ?auto_765582 ?auto_765590 ) ) ( not ( = ?auto_765582 ?auto_765591 ) ) ( not ( = ?auto_765582 ?auto_765592 ) ) ( not ( = ?auto_765582 ?auto_765593 ) ) ( not ( = ?auto_765582 ?auto_765594 ) ) ( not ( = ?auto_765582 ?auto_765595 ) ) ( not ( = ?auto_765583 ?auto_765584 ) ) ( not ( = ?auto_765583 ?auto_765585 ) ) ( not ( = ?auto_765583 ?auto_765586 ) ) ( not ( = ?auto_765583 ?auto_765587 ) ) ( not ( = ?auto_765583 ?auto_765588 ) ) ( not ( = ?auto_765583 ?auto_765589 ) ) ( not ( = ?auto_765583 ?auto_765590 ) ) ( not ( = ?auto_765583 ?auto_765591 ) ) ( not ( = ?auto_765583 ?auto_765592 ) ) ( not ( = ?auto_765583 ?auto_765593 ) ) ( not ( = ?auto_765583 ?auto_765594 ) ) ( not ( = ?auto_765583 ?auto_765595 ) ) ( not ( = ?auto_765584 ?auto_765585 ) ) ( not ( = ?auto_765584 ?auto_765586 ) ) ( not ( = ?auto_765584 ?auto_765587 ) ) ( not ( = ?auto_765584 ?auto_765588 ) ) ( not ( = ?auto_765584 ?auto_765589 ) ) ( not ( = ?auto_765584 ?auto_765590 ) ) ( not ( = ?auto_765584 ?auto_765591 ) ) ( not ( = ?auto_765584 ?auto_765592 ) ) ( not ( = ?auto_765584 ?auto_765593 ) ) ( not ( = ?auto_765584 ?auto_765594 ) ) ( not ( = ?auto_765584 ?auto_765595 ) ) ( not ( = ?auto_765585 ?auto_765586 ) ) ( not ( = ?auto_765585 ?auto_765587 ) ) ( not ( = ?auto_765585 ?auto_765588 ) ) ( not ( = ?auto_765585 ?auto_765589 ) ) ( not ( = ?auto_765585 ?auto_765590 ) ) ( not ( = ?auto_765585 ?auto_765591 ) ) ( not ( = ?auto_765585 ?auto_765592 ) ) ( not ( = ?auto_765585 ?auto_765593 ) ) ( not ( = ?auto_765585 ?auto_765594 ) ) ( not ( = ?auto_765585 ?auto_765595 ) ) ( not ( = ?auto_765586 ?auto_765587 ) ) ( not ( = ?auto_765586 ?auto_765588 ) ) ( not ( = ?auto_765586 ?auto_765589 ) ) ( not ( = ?auto_765586 ?auto_765590 ) ) ( not ( = ?auto_765586 ?auto_765591 ) ) ( not ( = ?auto_765586 ?auto_765592 ) ) ( not ( = ?auto_765586 ?auto_765593 ) ) ( not ( = ?auto_765586 ?auto_765594 ) ) ( not ( = ?auto_765586 ?auto_765595 ) ) ( not ( = ?auto_765587 ?auto_765588 ) ) ( not ( = ?auto_765587 ?auto_765589 ) ) ( not ( = ?auto_765587 ?auto_765590 ) ) ( not ( = ?auto_765587 ?auto_765591 ) ) ( not ( = ?auto_765587 ?auto_765592 ) ) ( not ( = ?auto_765587 ?auto_765593 ) ) ( not ( = ?auto_765587 ?auto_765594 ) ) ( not ( = ?auto_765587 ?auto_765595 ) ) ( not ( = ?auto_765588 ?auto_765589 ) ) ( not ( = ?auto_765588 ?auto_765590 ) ) ( not ( = ?auto_765588 ?auto_765591 ) ) ( not ( = ?auto_765588 ?auto_765592 ) ) ( not ( = ?auto_765588 ?auto_765593 ) ) ( not ( = ?auto_765588 ?auto_765594 ) ) ( not ( = ?auto_765588 ?auto_765595 ) ) ( not ( = ?auto_765589 ?auto_765590 ) ) ( not ( = ?auto_765589 ?auto_765591 ) ) ( not ( = ?auto_765589 ?auto_765592 ) ) ( not ( = ?auto_765589 ?auto_765593 ) ) ( not ( = ?auto_765589 ?auto_765594 ) ) ( not ( = ?auto_765589 ?auto_765595 ) ) ( not ( = ?auto_765590 ?auto_765591 ) ) ( not ( = ?auto_765590 ?auto_765592 ) ) ( not ( = ?auto_765590 ?auto_765593 ) ) ( not ( = ?auto_765590 ?auto_765594 ) ) ( not ( = ?auto_765590 ?auto_765595 ) ) ( not ( = ?auto_765591 ?auto_765592 ) ) ( not ( = ?auto_765591 ?auto_765593 ) ) ( not ( = ?auto_765591 ?auto_765594 ) ) ( not ( = ?auto_765591 ?auto_765595 ) ) ( not ( = ?auto_765592 ?auto_765593 ) ) ( not ( = ?auto_765592 ?auto_765594 ) ) ( not ( = ?auto_765592 ?auto_765595 ) ) ( not ( = ?auto_765593 ?auto_765594 ) ) ( not ( = ?auto_765593 ?auto_765595 ) ) ( not ( = ?auto_765594 ?auto_765595 ) ) ( ON ?auto_765594 ?auto_765595 ) ( ON ?auto_765593 ?auto_765594 ) ( ON ?auto_765592 ?auto_765593 ) ( ON ?auto_765591 ?auto_765592 ) ( ON ?auto_765590 ?auto_765591 ) ( ON ?auto_765589 ?auto_765590 ) ( ON ?auto_765588 ?auto_765589 ) ( ON ?auto_765587 ?auto_765588 ) ( ON ?auto_765586 ?auto_765587 ) ( ON ?auto_765585 ?auto_765586 ) ( CLEAR ?auto_765583 ) ( ON ?auto_765584 ?auto_765585 ) ( CLEAR ?auto_765584 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-7PILE ?auto_765578 ?auto_765579 ?auto_765580 ?auto_765581 ?auto_765582 ?auto_765583 ?auto_765584 )
      ( MAKE-18PILE ?auto_765578 ?auto_765579 ?auto_765580 ?auto_765581 ?auto_765582 ?auto_765583 ?auto_765584 ?auto_765585 ?auto_765586 ?auto_765587 ?auto_765588 ?auto_765589 ?auto_765590 ?auto_765591 ?auto_765592 ?auto_765593 ?auto_765594 ?auto_765595 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_765614 - BLOCK
      ?auto_765615 - BLOCK
      ?auto_765616 - BLOCK
      ?auto_765617 - BLOCK
      ?auto_765618 - BLOCK
      ?auto_765619 - BLOCK
      ?auto_765620 - BLOCK
      ?auto_765621 - BLOCK
      ?auto_765622 - BLOCK
      ?auto_765623 - BLOCK
      ?auto_765624 - BLOCK
      ?auto_765625 - BLOCK
      ?auto_765626 - BLOCK
      ?auto_765627 - BLOCK
      ?auto_765628 - BLOCK
      ?auto_765629 - BLOCK
      ?auto_765630 - BLOCK
      ?auto_765631 - BLOCK
    )
    :vars
    (
      ?auto_765632 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_765631 ?auto_765632 ) ( ON-TABLE ?auto_765614 ) ( ON ?auto_765615 ?auto_765614 ) ( ON ?auto_765616 ?auto_765615 ) ( ON ?auto_765617 ?auto_765616 ) ( ON ?auto_765618 ?auto_765617 ) ( not ( = ?auto_765614 ?auto_765615 ) ) ( not ( = ?auto_765614 ?auto_765616 ) ) ( not ( = ?auto_765614 ?auto_765617 ) ) ( not ( = ?auto_765614 ?auto_765618 ) ) ( not ( = ?auto_765614 ?auto_765619 ) ) ( not ( = ?auto_765614 ?auto_765620 ) ) ( not ( = ?auto_765614 ?auto_765621 ) ) ( not ( = ?auto_765614 ?auto_765622 ) ) ( not ( = ?auto_765614 ?auto_765623 ) ) ( not ( = ?auto_765614 ?auto_765624 ) ) ( not ( = ?auto_765614 ?auto_765625 ) ) ( not ( = ?auto_765614 ?auto_765626 ) ) ( not ( = ?auto_765614 ?auto_765627 ) ) ( not ( = ?auto_765614 ?auto_765628 ) ) ( not ( = ?auto_765614 ?auto_765629 ) ) ( not ( = ?auto_765614 ?auto_765630 ) ) ( not ( = ?auto_765614 ?auto_765631 ) ) ( not ( = ?auto_765614 ?auto_765632 ) ) ( not ( = ?auto_765615 ?auto_765616 ) ) ( not ( = ?auto_765615 ?auto_765617 ) ) ( not ( = ?auto_765615 ?auto_765618 ) ) ( not ( = ?auto_765615 ?auto_765619 ) ) ( not ( = ?auto_765615 ?auto_765620 ) ) ( not ( = ?auto_765615 ?auto_765621 ) ) ( not ( = ?auto_765615 ?auto_765622 ) ) ( not ( = ?auto_765615 ?auto_765623 ) ) ( not ( = ?auto_765615 ?auto_765624 ) ) ( not ( = ?auto_765615 ?auto_765625 ) ) ( not ( = ?auto_765615 ?auto_765626 ) ) ( not ( = ?auto_765615 ?auto_765627 ) ) ( not ( = ?auto_765615 ?auto_765628 ) ) ( not ( = ?auto_765615 ?auto_765629 ) ) ( not ( = ?auto_765615 ?auto_765630 ) ) ( not ( = ?auto_765615 ?auto_765631 ) ) ( not ( = ?auto_765615 ?auto_765632 ) ) ( not ( = ?auto_765616 ?auto_765617 ) ) ( not ( = ?auto_765616 ?auto_765618 ) ) ( not ( = ?auto_765616 ?auto_765619 ) ) ( not ( = ?auto_765616 ?auto_765620 ) ) ( not ( = ?auto_765616 ?auto_765621 ) ) ( not ( = ?auto_765616 ?auto_765622 ) ) ( not ( = ?auto_765616 ?auto_765623 ) ) ( not ( = ?auto_765616 ?auto_765624 ) ) ( not ( = ?auto_765616 ?auto_765625 ) ) ( not ( = ?auto_765616 ?auto_765626 ) ) ( not ( = ?auto_765616 ?auto_765627 ) ) ( not ( = ?auto_765616 ?auto_765628 ) ) ( not ( = ?auto_765616 ?auto_765629 ) ) ( not ( = ?auto_765616 ?auto_765630 ) ) ( not ( = ?auto_765616 ?auto_765631 ) ) ( not ( = ?auto_765616 ?auto_765632 ) ) ( not ( = ?auto_765617 ?auto_765618 ) ) ( not ( = ?auto_765617 ?auto_765619 ) ) ( not ( = ?auto_765617 ?auto_765620 ) ) ( not ( = ?auto_765617 ?auto_765621 ) ) ( not ( = ?auto_765617 ?auto_765622 ) ) ( not ( = ?auto_765617 ?auto_765623 ) ) ( not ( = ?auto_765617 ?auto_765624 ) ) ( not ( = ?auto_765617 ?auto_765625 ) ) ( not ( = ?auto_765617 ?auto_765626 ) ) ( not ( = ?auto_765617 ?auto_765627 ) ) ( not ( = ?auto_765617 ?auto_765628 ) ) ( not ( = ?auto_765617 ?auto_765629 ) ) ( not ( = ?auto_765617 ?auto_765630 ) ) ( not ( = ?auto_765617 ?auto_765631 ) ) ( not ( = ?auto_765617 ?auto_765632 ) ) ( not ( = ?auto_765618 ?auto_765619 ) ) ( not ( = ?auto_765618 ?auto_765620 ) ) ( not ( = ?auto_765618 ?auto_765621 ) ) ( not ( = ?auto_765618 ?auto_765622 ) ) ( not ( = ?auto_765618 ?auto_765623 ) ) ( not ( = ?auto_765618 ?auto_765624 ) ) ( not ( = ?auto_765618 ?auto_765625 ) ) ( not ( = ?auto_765618 ?auto_765626 ) ) ( not ( = ?auto_765618 ?auto_765627 ) ) ( not ( = ?auto_765618 ?auto_765628 ) ) ( not ( = ?auto_765618 ?auto_765629 ) ) ( not ( = ?auto_765618 ?auto_765630 ) ) ( not ( = ?auto_765618 ?auto_765631 ) ) ( not ( = ?auto_765618 ?auto_765632 ) ) ( not ( = ?auto_765619 ?auto_765620 ) ) ( not ( = ?auto_765619 ?auto_765621 ) ) ( not ( = ?auto_765619 ?auto_765622 ) ) ( not ( = ?auto_765619 ?auto_765623 ) ) ( not ( = ?auto_765619 ?auto_765624 ) ) ( not ( = ?auto_765619 ?auto_765625 ) ) ( not ( = ?auto_765619 ?auto_765626 ) ) ( not ( = ?auto_765619 ?auto_765627 ) ) ( not ( = ?auto_765619 ?auto_765628 ) ) ( not ( = ?auto_765619 ?auto_765629 ) ) ( not ( = ?auto_765619 ?auto_765630 ) ) ( not ( = ?auto_765619 ?auto_765631 ) ) ( not ( = ?auto_765619 ?auto_765632 ) ) ( not ( = ?auto_765620 ?auto_765621 ) ) ( not ( = ?auto_765620 ?auto_765622 ) ) ( not ( = ?auto_765620 ?auto_765623 ) ) ( not ( = ?auto_765620 ?auto_765624 ) ) ( not ( = ?auto_765620 ?auto_765625 ) ) ( not ( = ?auto_765620 ?auto_765626 ) ) ( not ( = ?auto_765620 ?auto_765627 ) ) ( not ( = ?auto_765620 ?auto_765628 ) ) ( not ( = ?auto_765620 ?auto_765629 ) ) ( not ( = ?auto_765620 ?auto_765630 ) ) ( not ( = ?auto_765620 ?auto_765631 ) ) ( not ( = ?auto_765620 ?auto_765632 ) ) ( not ( = ?auto_765621 ?auto_765622 ) ) ( not ( = ?auto_765621 ?auto_765623 ) ) ( not ( = ?auto_765621 ?auto_765624 ) ) ( not ( = ?auto_765621 ?auto_765625 ) ) ( not ( = ?auto_765621 ?auto_765626 ) ) ( not ( = ?auto_765621 ?auto_765627 ) ) ( not ( = ?auto_765621 ?auto_765628 ) ) ( not ( = ?auto_765621 ?auto_765629 ) ) ( not ( = ?auto_765621 ?auto_765630 ) ) ( not ( = ?auto_765621 ?auto_765631 ) ) ( not ( = ?auto_765621 ?auto_765632 ) ) ( not ( = ?auto_765622 ?auto_765623 ) ) ( not ( = ?auto_765622 ?auto_765624 ) ) ( not ( = ?auto_765622 ?auto_765625 ) ) ( not ( = ?auto_765622 ?auto_765626 ) ) ( not ( = ?auto_765622 ?auto_765627 ) ) ( not ( = ?auto_765622 ?auto_765628 ) ) ( not ( = ?auto_765622 ?auto_765629 ) ) ( not ( = ?auto_765622 ?auto_765630 ) ) ( not ( = ?auto_765622 ?auto_765631 ) ) ( not ( = ?auto_765622 ?auto_765632 ) ) ( not ( = ?auto_765623 ?auto_765624 ) ) ( not ( = ?auto_765623 ?auto_765625 ) ) ( not ( = ?auto_765623 ?auto_765626 ) ) ( not ( = ?auto_765623 ?auto_765627 ) ) ( not ( = ?auto_765623 ?auto_765628 ) ) ( not ( = ?auto_765623 ?auto_765629 ) ) ( not ( = ?auto_765623 ?auto_765630 ) ) ( not ( = ?auto_765623 ?auto_765631 ) ) ( not ( = ?auto_765623 ?auto_765632 ) ) ( not ( = ?auto_765624 ?auto_765625 ) ) ( not ( = ?auto_765624 ?auto_765626 ) ) ( not ( = ?auto_765624 ?auto_765627 ) ) ( not ( = ?auto_765624 ?auto_765628 ) ) ( not ( = ?auto_765624 ?auto_765629 ) ) ( not ( = ?auto_765624 ?auto_765630 ) ) ( not ( = ?auto_765624 ?auto_765631 ) ) ( not ( = ?auto_765624 ?auto_765632 ) ) ( not ( = ?auto_765625 ?auto_765626 ) ) ( not ( = ?auto_765625 ?auto_765627 ) ) ( not ( = ?auto_765625 ?auto_765628 ) ) ( not ( = ?auto_765625 ?auto_765629 ) ) ( not ( = ?auto_765625 ?auto_765630 ) ) ( not ( = ?auto_765625 ?auto_765631 ) ) ( not ( = ?auto_765625 ?auto_765632 ) ) ( not ( = ?auto_765626 ?auto_765627 ) ) ( not ( = ?auto_765626 ?auto_765628 ) ) ( not ( = ?auto_765626 ?auto_765629 ) ) ( not ( = ?auto_765626 ?auto_765630 ) ) ( not ( = ?auto_765626 ?auto_765631 ) ) ( not ( = ?auto_765626 ?auto_765632 ) ) ( not ( = ?auto_765627 ?auto_765628 ) ) ( not ( = ?auto_765627 ?auto_765629 ) ) ( not ( = ?auto_765627 ?auto_765630 ) ) ( not ( = ?auto_765627 ?auto_765631 ) ) ( not ( = ?auto_765627 ?auto_765632 ) ) ( not ( = ?auto_765628 ?auto_765629 ) ) ( not ( = ?auto_765628 ?auto_765630 ) ) ( not ( = ?auto_765628 ?auto_765631 ) ) ( not ( = ?auto_765628 ?auto_765632 ) ) ( not ( = ?auto_765629 ?auto_765630 ) ) ( not ( = ?auto_765629 ?auto_765631 ) ) ( not ( = ?auto_765629 ?auto_765632 ) ) ( not ( = ?auto_765630 ?auto_765631 ) ) ( not ( = ?auto_765630 ?auto_765632 ) ) ( not ( = ?auto_765631 ?auto_765632 ) ) ( ON ?auto_765630 ?auto_765631 ) ( ON ?auto_765629 ?auto_765630 ) ( ON ?auto_765628 ?auto_765629 ) ( ON ?auto_765627 ?auto_765628 ) ( ON ?auto_765626 ?auto_765627 ) ( ON ?auto_765625 ?auto_765626 ) ( ON ?auto_765624 ?auto_765625 ) ( ON ?auto_765623 ?auto_765624 ) ( ON ?auto_765622 ?auto_765623 ) ( ON ?auto_765621 ?auto_765622 ) ( ON ?auto_765620 ?auto_765621 ) ( CLEAR ?auto_765618 ) ( ON ?auto_765619 ?auto_765620 ) ( CLEAR ?auto_765619 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_765614 ?auto_765615 ?auto_765616 ?auto_765617 ?auto_765618 ?auto_765619 )
      ( MAKE-18PILE ?auto_765614 ?auto_765615 ?auto_765616 ?auto_765617 ?auto_765618 ?auto_765619 ?auto_765620 ?auto_765621 ?auto_765622 ?auto_765623 ?auto_765624 ?auto_765625 ?auto_765626 ?auto_765627 ?auto_765628 ?auto_765629 ?auto_765630 ?auto_765631 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_765651 - BLOCK
      ?auto_765652 - BLOCK
      ?auto_765653 - BLOCK
      ?auto_765654 - BLOCK
      ?auto_765655 - BLOCK
      ?auto_765656 - BLOCK
      ?auto_765657 - BLOCK
      ?auto_765658 - BLOCK
      ?auto_765659 - BLOCK
      ?auto_765660 - BLOCK
      ?auto_765661 - BLOCK
      ?auto_765662 - BLOCK
      ?auto_765663 - BLOCK
      ?auto_765664 - BLOCK
      ?auto_765665 - BLOCK
      ?auto_765666 - BLOCK
      ?auto_765667 - BLOCK
      ?auto_765668 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_765668 ) ( ON-TABLE ?auto_765651 ) ( ON ?auto_765652 ?auto_765651 ) ( ON ?auto_765653 ?auto_765652 ) ( ON ?auto_765654 ?auto_765653 ) ( ON ?auto_765655 ?auto_765654 ) ( not ( = ?auto_765651 ?auto_765652 ) ) ( not ( = ?auto_765651 ?auto_765653 ) ) ( not ( = ?auto_765651 ?auto_765654 ) ) ( not ( = ?auto_765651 ?auto_765655 ) ) ( not ( = ?auto_765651 ?auto_765656 ) ) ( not ( = ?auto_765651 ?auto_765657 ) ) ( not ( = ?auto_765651 ?auto_765658 ) ) ( not ( = ?auto_765651 ?auto_765659 ) ) ( not ( = ?auto_765651 ?auto_765660 ) ) ( not ( = ?auto_765651 ?auto_765661 ) ) ( not ( = ?auto_765651 ?auto_765662 ) ) ( not ( = ?auto_765651 ?auto_765663 ) ) ( not ( = ?auto_765651 ?auto_765664 ) ) ( not ( = ?auto_765651 ?auto_765665 ) ) ( not ( = ?auto_765651 ?auto_765666 ) ) ( not ( = ?auto_765651 ?auto_765667 ) ) ( not ( = ?auto_765651 ?auto_765668 ) ) ( not ( = ?auto_765652 ?auto_765653 ) ) ( not ( = ?auto_765652 ?auto_765654 ) ) ( not ( = ?auto_765652 ?auto_765655 ) ) ( not ( = ?auto_765652 ?auto_765656 ) ) ( not ( = ?auto_765652 ?auto_765657 ) ) ( not ( = ?auto_765652 ?auto_765658 ) ) ( not ( = ?auto_765652 ?auto_765659 ) ) ( not ( = ?auto_765652 ?auto_765660 ) ) ( not ( = ?auto_765652 ?auto_765661 ) ) ( not ( = ?auto_765652 ?auto_765662 ) ) ( not ( = ?auto_765652 ?auto_765663 ) ) ( not ( = ?auto_765652 ?auto_765664 ) ) ( not ( = ?auto_765652 ?auto_765665 ) ) ( not ( = ?auto_765652 ?auto_765666 ) ) ( not ( = ?auto_765652 ?auto_765667 ) ) ( not ( = ?auto_765652 ?auto_765668 ) ) ( not ( = ?auto_765653 ?auto_765654 ) ) ( not ( = ?auto_765653 ?auto_765655 ) ) ( not ( = ?auto_765653 ?auto_765656 ) ) ( not ( = ?auto_765653 ?auto_765657 ) ) ( not ( = ?auto_765653 ?auto_765658 ) ) ( not ( = ?auto_765653 ?auto_765659 ) ) ( not ( = ?auto_765653 ?auto_765660 ) ) ( not ( = ?auto_765653 ?auto_765661 ) ) ( not ( = ?auto_765653 ?auto_765662 ) ) ( not ( = ?auto_765653 ?auto_765663 ) ) ( not ( = ?auto_765653 ?auto_765664 ) ) ( not ( = ?auto_765653 ?auto_765665 ) ) ( not ( = ?auto_765653 ?auto_765666 ) ) ( not ( = ?auto_765653 ?auto_765667 ) ) ( not ( = ?auto_765653 ?auto_765668 ) ) ( not ( = ?auto_765654 ?auto_765655 ) ) ( not ( = ?auto_765654 ?auto_765656 ) ) ( not ( = ?auto_765654 ?auto_765657 ) ) ( not ( = ?auto_765654 ?auto_765658 ) ) ( not ( = ?auto_765654 ?auto_765659 ) ) ( not ( = ?auto_765654 ?auto_765660 ) ) ( not ( = ?auto_765654 ?auto_765661 ) ) ( not ( = ?auto_765654 ?auto_765662 ) ) ( not ( = ?auto_765654 ?auto_765663 ) ) ( not ( = ?auto_765654 ?auto_765664 ) ) ( not ( = ?auto_765654 ?auto_765665 ) ) ( not ( = ?auto_765654 ?auto_765666 ) ) ( not ( = ?auto_765654 ?auto_765667 ) ) ( not ( = ?auto_765654 ?auto_765668 ) ) ( not ( = ?auto_765655 ?auto_765656 ) ) ( not ( = ?auto_765655 ?auto_765657 ) ) ( not ( = ?auto_765655 ?auto_765658 ) ) ( not ( = ?auto_765655 ?auto_765659 ) ) ( not ( = ?auto_765655 ?auto_765660 ) ) ( not ( = ?auto_765655 ?auto_765661 ) ) ( not ( = ?auto_765655 ?auto_765662 ) ) ( not ( = ?auto_765655 ?auto_765663 ) ) ( not ( = ?auto_765655 ?auto_765664 ) ) ( not ( = ?auto_765655 ?auto_765665 ) ) ( not ( = ?auto_765655 ?auto_765666 ) ) ( not ( = ?auto_765655 ?auto_765667 ) ) ( not ( = ?auto_765655 ?auto_765668 ) ) ( not ( = ?auto_765656 ?auto_765657 ) ) ( not ( = ?auto_765656 ?auto_765658 ) ) ( not ( = ?auto_765656 ?auto_765659 ) ) ( not ( = ?auto_765656 ?auto_765660 ) ) ( not ( = ?auto_765656 ?auto_765661 ) ) ( not ( = ?auto_765656 ?auto_765662 ) ) ( not ( = ?auto_765656 ?auto_765663 ) ) ( not ( = ?auto_765656 ?auto_765664 ) ) ( not ( = ?auto_765656 ?auto_765665 ) ) ( not ( = ?auto_765656 ?auto_765666 ) ) ( not ( = ?auto_765656 ?auto_765667 ) ) ( not ( = ?auto_765656 ?auto_765668 ) ) ( not ( = ?auto_765657 ?auto_765658 ) ) ( not ( = ?auto_765657 ?auto_765659 ) ) ( not ( = ?auto_765657 ?auto_765660 ) ) ( not ( = ?auto_765657 ?auto_765661 ) ) ( not ( = ?auto_765657 ?auto_765662 ) ) ( not ( = ?auto_765657 ?auto_765663 ) ) ( not ( = ?auto_765657 ?auto_765664 ) ) ( not ( = ?auto_765657 ?auto_765665 ) ) ( not ( = ?auto_765657 ?auto_765666 ) ) ( not ( = ?auto_765657 ?auto_765667 ) ) ( not ( = ?auto_765657 ?auto_765668 ) ) ( not ( = ?auto_765658 ?auto_765659 ) ) ( not ( = ?auto_765658 ?auto_765660 ) ) ( not ( = ?auto_765658 ?auto_765661 ) ) ( not ( = ?auto_765658 ?auto_765662 ) ) ( not ( = ?auto_765658 ?auto_765663 ) ) ( not ( = ?auto_765658 ?auto_765664 ) ) ( not ( = ?auto_765658 ?auto_765665 ) ) ( not ( = ?auto_765658 ?auto_765666 ) ) ( not ( = ?auto_765658 ?auto_765667 ) ) ( not ( = ?auto_765658 ?auto_765668 ) ) ( not ( = ?auto_765659 ?auto_765660 ) ) ( not ( = ?auto_765659 ?auto_765661 ) ) ( not ( = ?auto_765659 ?auto_765662 ) ) ( not ( = ?auto_765659 ?auto_765663 ) ) ( not ( = ?auto_765659 ?auto_765664 ) ) ( not ( = ?auto_765659 ?auto_765665 ) ) ( not ( = ?auto_765659 ?auto_765666 ) ) ( not ( = ?auto_765659 ?auto_765667 ) ) ( not ( = ?auto_765659 ?auto_765668 ) ) ( not ( = ?auto_765660 ?auto_765661 ) ) ( not ( = ?auto_765660 ?auto_765662 ) ) ( not ( = ?auto_765660 ?auto_765663 ) ) ( not ( = ?auto_765660 ?auto_765664 ) ) ( not ( = ?auto_765660 ?auto_765665 ) ) ( not ( = ?auto_765660 ?auto_765666 ) ) ( not ( = ?auto_765660 ?auto_765667 ) ) ( not ( = ?auto_765660 ?auto_765668 ) ) ( not ( = ?auto_765661 ?auto_765662 ) ) ( not ( = ?auto_765661 ?auto_765663 ) ) ( not ( = ?auto_765661 ?auto_765664 ) ) ( not ( = ?auto_765661 ?auto_765665 ) ) ( not ( = ?auto_765661 ?auto_765666 ) ) ( not ( = ?auto_765661 ?auto_765667 ) ) ( not ( = ?auto_765661 ?auto_765668 ) ) ( not ( = ?auto_765662 ?auto_765663 ) ) ( not ( = ?auto_765662 ?auto_765664 ) ) ( not ( = ?auto_765662 ?auto_765665 ) ) ( not ( = ?auto_765662 ?auto_765666 ) ) ( not ( = ?auto_765662 ?auto_765667 ) ) ( not ( = ?auto_765662 ?auto_765668 ) ) ( not ( = ?auto_765663 ?auto_765664 ) ) ( not ( = ?auto_765663 ?auto_765665 ) ) ( not ( = ?auto_765663 ?auto_765666 ) ) ( not ( = ?auto_765663 ?auto_765667 ) ) ( not ( = ?auto_765663 ?auto_765668 ) ) ( not ( = ?auto_765664 ?auto_765665 ) ) ( not ( = ?auto_765664 ?auto_765666 ) ) ( not ( = ?auto_765664 ?auto_765667 ) ) ( not ( = ?auto_765664 ?auto_765668 ) ) ( not ( = ?auto_765665 ?auto_765666 ) ) ( not ( = ?auto_765665 ?auto_765667 ) ) ( not ( = ?auto_765665 ?auto_765668 ) ) ( not ( = ?auto_765666 ?auto_765667 ) ) ( not ( = ?auto_765666 ?auto_765668 ) ) ( not ( = ?auto_765667 ?auto_765668 ) ) ( ON ?auto_765667 ?auto_765668 ) ( ON ?auto_765666 ?auto_765667 ) ( ON ?auto_765665 ?auto_765666 ) ( ON ?auto_765664 ?auto_765665 ) ( ON ?auto_765663 ?auto_765664 ) ( ON ?auto_765662 ?auto_765663 ) ( ON ?auto_765661 ?auto_765662 ) ( ON ?auto_765660 ?auto_765661 ) ( ON ?auto_765659 ?auto_765660 ) ( ON ?auto_765658 ?auto_765659 ) ( ON ?auto_765657 ?auto_765658 ) ( CLEAR ?auto_765655 ) ( ON ?auto_765656 ?auto_765657 ) ( CLEAR ?auto_765656 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-6PILE ?auto_765651 ?auto_765652 ?auto_765653 ?auto_765654 ?auto_765655 ?auto_765656 )
      ( MAKE-18PILE ?auto_765651 ?auto_765652 ?auto_765653 ?auto_765654 ?auto_765655 ?auto_765656 ?auto_765657 ?auto_765658 ?auto_765659 ?auto_765660 ?auto_765661 ?auto_765662 ?auto_765663 ?auto_765664 ?auto_765665 ?auto_765666 ?auto_765667 ?auto_765668 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_765687 - BLOCK
      ?auto_765688 - BLOCK
      ?auto_765689 - BLOCK
      ?auto_765690 - BLOCK
      ?auto_765691 - BLOCK
      ?auto_765692 - BLOCK
      ?auto_765693 - BLOCK
      ?auto_765694 - BLOCK
      ?auto_765695 - BLOCK
      ?auto_765696 - BLOCK
      ?auto_765697 - BLOCK
      ?auto_765698 - BLOCK
      ?auto_765699 - BLOCK
      ?auto_765700 - BLOCK
      ?auto_765701 - BLOCK
      ?auto_765702 - BLOCK
      ?auto_765703 - BLOCK
      ?auto_765704 - BLOCK
    )
    :vars
    (
      ?auto_765705 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_765704 ?auto_765705 ) ( ON-TABLE ?auto_765687 ) ( ON ?auto_765688 ?auto_765687 ) ( ON ?auto_765689 ?auto_765688 ) ( ON ?auto_765690 ?auto_765689 ) ( not ( = ?auto_765687 ?auto_765688 ) ) ( not ( = ?auto_765687 ?auto_765689 ) ) ( not ( = ?auto_765687 ?auto_765690 ) ) ( not ( = ?auto_765687 ?auto_765691 ) ) ( not ( = ?auto_765687 ?auto_765692 ) ) ( not ( = ?auto_765687 ?auto_765693 ) ) ( not ( = ?auto_765687 ?auto_765694 ) ) ( not ( = ?auto_765687 ?auto_765695 ) ) ( not ( = ?auto_765687 ?auto_765696 ) ) ( not ( = ?auto_765687 ?auto_765697 ) ) ( not ( = ?auto_765687 ?auto_765698 ) ) ( not ( = ?auto_765687 ?auto_765699 ) ) ( not ( = ?auto_765687 ?auto_765700 ) ) ( not ( = ?auto_765687 ?auto_765701 ) ) ( not ( = ?auto_765687 ?auto_765702 ) ) ( not ( = ?auto_765687 ?auto_765703 ) ) ( not ( = ?auto_765687 ?auto_765704 ) ) ( not ( = ?auto_765687 ?auto_765705 ) ) ( not ( = ?auto_765688 ?auto_765689 ) ) ( not ( = ?auto_765688 ?auto_765690 ) ) ( not ( = ?auto_765688 ?auto_765691 ) ) ( not ( = ?auto_765688 ?auto_765692 ) ) ( not ( = ?auto_765688 ?auto_765693 ) ) ( not ( = ?auto_765688 ?auto_765694 ) ) ( not ( = ?auto_765688 ?auto_765695 ) ) ( not ( = ?auto_765688 ?auto_765696 ) ) ( not ( = ?auto_765688 ?auto_765697 ) ) ( not ( = ?auto_765688 ?auto_765698 ) ) ( not ( = ?auto_765688 ?auto_765699 ) ) ( not ( = ?auto_765688 ?auto_765700 ) ) ( not ( = ?auto_765688 ?auto_765701 ) ) ( not ( = ?auto_765688 ?auto_765702 ) ) ( not ( = ?auto_765688 ?auto_765703 ) ) ( not ( = ?auto_765688 ?auto_765704 ) ) ( not ( = ?auto_765688 ?auto_765705 ) ) ( not ( = ?auto_765689 ?auto_765690 ) ) ( not ( = ?auto_765689 ?auto_765691 ) ) ( not ( = ?auto_765689 ?auto_765692 ) ) ( not ( = ?auto_765689 ?auto_765693 ) ) ( not ( = ?auto_765689 ?auto_765694 ) ) ( not ( = ?auto_765689 ?auto_765695 ) ) ( not ( = ?auto_765689 ?auto_765696 ) ) ( not ( = ?auto_765689 ?auto_765697 ) ) ( not ( = ?auto_765689 ?auto_765698 ) ) ( not ( = ?auto_765689 ?auto_765699 ) ) ( not ( = ?auto_765689 ?auto_765700 ) ) ( not ( = ?auto_765689 ?auto_765701 ) ) ( not ( = ?auto_765689 ?auto_765702 ) ) ( not ( = ?auto_765689 ?auto_765703 ) ) ( not ( = ?auto_765689 ?auto_765704 ) ) ( not ( = ?auto_765689 ?auto_765705 ) ) ( not ( = ?auto_765690 ?auto_765691 ) ) ( not ( = ?auto_765690 ?auto_765692 ) ) ( not ( = ?auto_765690 ?auto_765693 ) ) ( not ( = ?auto_765690 ?auto_765694 ) ) ( not ( = ?auto_765690 ?auto_765695 ) ) ( not ( = ?auto_765690 ?auto_765696 ) ) ( not ( = ?auto_765690 ?auto_765697 ) ) ( not ( = ?auto_765690 ?auto_765698 ) ) ( not ( = ?auto_765690 ?auto_765699 ) ) ( not ( = ?auto_765690 ?auto_765700 ) ) ( not ( = ?auto_765690 ?auto_765701 ) ) ( not ( = ?auto_765690 ?auto_765702 ) ) ( not ( = ?auto_765690 ?auto_765703 ) ) ( not ( = ?auto_765690 ?auto_765704 ) ) ( not ( = ?auto_765690 ?auto_765705 ) ) ( not ( = ?auto_765691 ?auto_765692 ) ) ( not ( = ?auto_765691 ?auto_765693 ) ) ( not ( = ?auto_765691 ?auto_765694 ) ) ( not ( = ?auto_765691 ?auto_765695 ) ) ( not ( = ?auto_765691 ?auto_765696 ) ) ( not ( = ?auto_765691 ?auto_765697 ) ) ( not ( = ?auto_765691 ?auto_765698 ) ) ( not ( = ?auto_765691 ?auto_765699 ) ) ( not ( = ?auto_765691 ?auto_765700 ) ) ( not ( = ?auto_765691 ?auto_765701 ) ) ( not ( = ?auto_765691 ?auto_765702 ) ) ( not ( = ?auto_765691 ?auto_765703 ) ) ( not ( = ?auto_765691 ?auto_765704 ) ) ( not ( = ?auto_765691 ?auto_765705 ) ) ( not ( = ?auto_765692 ?auto_765693 ) ) ( not ( = ?auto_765692 ?auto_765694 ) ) ( not ( = ?auto_765692 ?auto_765695 ) ) ( not ( = ?auto_765692 ?auto_765696 ) ) ( not ( = ?auto_765692 ?auto_765697 ) ) ( not ( = ?auto_765692 ?auto_765698 ) ) ( not ( = ?auto_765692 ?auto_765699 ) ) ( not ( = ?auto_765692 ?auto_765700 ) ) ( not ( = ?auto_765692 ?auto_765701 ) ) ( not ( = ?auto_765692 ?auto_765702 ) ) ( not ( = ?auto_765692 ?auto_765703 ) ) ( not ( = ?auto_765692 ?auto_765704 ) ) ( not ( = ?auto_765692 ?auto_765705 ) ) ( not ( = ?auto_765693 ?auto_765694 ) ) ( not ( = ?auto_765693 ?auto_765695 ) ) ( not ( = ?auto_765693 ?auto_765696 ) ) ( not ( = ?auto_765693 ?auto_765697 ) ) ( not ( = ?auto_765693 ?auto_765698 ) ) ( not ( = ?auto_765693 ?auto_765699 ) ) ( not ( = ?auto_765693 ?auto_765700 ) ) ( not ( = ?auto_765693 ?auto_765701 ) ) ( not ( = ?auto_765693 ?auto_765702 ) ) ( not ( = ?auto_765693 ?auto_765703 ) ) ( not ( = ?auto_765693 ?auto_765704 ) ) ( not ( = ?auto_765693 ?auto_765705 ) ) ( not ( = ?auto_765694 ?auto_765695 ) ) ( not ( = ?auto_765694 ?auto_765696 ) ) ( not ( = ?auto_765694 ?auto_765697 ) ) ( not ( = ?auto_765694 ?auto_765698 ) ) ( not ( = ?auto_765694 ?auto_765699 ) ) ( not ( = ?auto_765694 ?auto_765700 ) ) ( not ( = ?auto_765694 ?auto_765701 ) ) ( not ( = ?auto_765694 ?auto_765702 ) ) ( not ( = ?auto_765694 ?auto_765703 ) ) ( not ( = ?auto_765694 ?auto_765704 ) ) ( not ( = ?auto_765694 ?auto_765705 ) ) ( not ( = ?auto_765695 ?auto_765696 ) ) ( not ( = ?auto_765695 ?auto_765697 ) ) ( not ( = ?auto_765695 ?auto_765698 ) ) ( not ( = ?auto_765695 ?auto_765699 ) ) ( not ( = ?auto_765695 ?auto_765700 ) ) ( not ( = ?auto_765695 ?auto_765701 ) ) ( not ( = ?auto_765695 ?auto_765702 ) ) ( not ( = ?auto_765695 ?auto_765703 ) ) ( not ( = ?auto_765695 ?auto_765704 ) ) ( not ( = ?auto_765695 ?auto_765705 ) ) ( not ( = ?auto_765696 ?auto_765697 ) ) ( not ( = ?auto_765696 ?auto_765698 ) ) ( not ( = ?auto_765696 ?auto_765699 ) ) ( not ( = ?auto_765696 ?auto_765700 ) ) ( not ( = ?auto_765696 ?auto_765701 ) ) ( not ( = ?auto_765696 ?auto_765702 ) ) ( not ( = ?auto_765696 ?auto_765703 ) ) ( not ( = ?auto_765696 ?auto_765704 ) ) ( not ( = ?auto_765696 ?auto_765705 ) ) ( not ( = ?auto_765697 ?auto_765698 ) ) ( not ( = ?auto_765697 ?auto_765699 ) ) ( not ( = ?auto_765697 ?auto_765700 ) ) ( not ( = ?auto_765697 ?auto_765701 ) ) ( not ( = ?auto_765697 ?auto_765702 ) ) ( not ( = ?auto_765697 ?auto_765703 ) ) ( not ( = ?auto_765697 ?auto_765704 ) ) ( not ( = ?auto_765697 ?auto_765705 ) ) ( not ( = ?auto_765698 ?auto_765699 ) ) ( not ( = ?auto_765698 ?auto_765700 ) ) ( not ( = ?auto_765698 ?auto_765701 ) ) ( not ( = ?auto_765698 ?auto_765702 ) ) ( not ( = ?auto_765698 ?auto_765703 ) ) ( not ( = ?auto_765698 ?auto_765704 ) ) ( not ( = ?auto_765698 ?auto_765705 ) ) ( not ( = ?auto_765699 ?auto_765700 ) ) ( not ( = ?auto_765699 ?auto_765701 ) ) ( not ( = ?auto_765699 ?auto_765702 ) ) ( not ( = ?auto_765699 ?auto_765703 ) ) ( not ( = ?auto_765699 ?auto_765704 ) ) ( not ( = ?auto_765699 ?auto_765705 ) ) ( not ( = ?auto_765700 ?auto_765701 ) ) ( not ( = ?auto_765700 ?auto_765702 ) ) ( not ( = ?auto_765700 ?auto_765703 ) ) ( not ( = ?auto_765700 ?auto_765704 ) ) ( not ( = ?auto_765700 ?auto_765705 ) ) ( not ( = ?auto_765701 ?auto_765702 ) ) ( not ( = ?auto_765701 ?auto_765703 ) ) ( not ( = ?auto_765701 ?auto_765704 ) ) ( not ( = ?auto_765701 ?auto_765705 ) ) ( not ( = ?auto_765702 ?auto_765703 ) ) ( not ( = ?auto_765702 ?auto_765704 ) ) ( not ( = ?auto_765702 ?auto_765705 ) ) ( not ( = ?auto_765703 ?auto_765704 ) ) ( not ( = ?auto_765703 ?auto_765705 ) ) ( not ( = ?auto_765704 ?auto_765705 ) ) ( ON ?auto_765703 ?auto_765704 ) ( ON ?auto_765702 ?auto_765703 ) ( ON ?auto_765701 ?auto_765702 ) ( ON ?auto_765700 ?auto_765701 ) ( ON ?auto_765699 ?auto_765700 ) ( ON ?auto_765698 ?auto_765699 ) ( ON ?auto_765697 ?auto_765698 ) ( ON ?auto_765696 ?auto_765697 ) ( ON ?auto_765695 ?auto_765696 ) ( ON ?auto_765694 ?auto_765695 ) ( ON ?auto_765693 ?auto_765694 ) ( ON ?auto_765692 ?auto_765693 ) ( CLEAR ?auto_765690 ) ( ON ?auto_765691 ?auto_765692 ) ( CLEAR ?auto_765691 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_765687 ?auto_765688 ?auto_765689 ?auto_765690 ?auto_765691 )
      ( MAKE-18PILE ?auto_765687 ?auto_765688 ?auto_765689 ?auto_765690 ?auto_765691 ?auto_765692 ?auto_765693 ?auto_765694 ?auto_765695 ?auto_765696 ?auto_765697 ?auto_765698 ?auto_765699 ?auto_765700 ?auto_765701 ?auto_765702 ?auto_765703 ?auto_765704 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_765724 - BLOCK
      ?auto_765725 - BLOCK
      ?auto_765726 - BLOCK
      ?auto_765727 - BLOCK
      ?auto_765728 - BLOCK
      ?auto_765729 - BLOCK
      ?auto_765730 - BLOCK
      ?auto_765731 - BLOCK
      ?auto_765732 - BLOCK
      ?auto_765733 - BLOCK
      ?auto_765734 - BLOCK
      ?auto_765735 - BLOCK
      ?auto_765736 - BLOCK
      ?auto_765737 - BLOCK
      ?auto_765738 - BLOCK
      ?auto_765739 - BLOCK
      ?auto_765740 - BLOCK
      ?auto_765741 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_765741 ) ( ON-TABLE ?auto_765724 ) ( ON ?auto_765725 ?auto_765724 ) ( ON ?auto_765726 ?auto_765725 ) ( ON ?auto_765727 ?auto_765726 ) ( not ( = ?auto_765724 ?auto_765725 ) ) ( not ( = ?auto_765724 ?auto_765726 ) ) ( not ( = ?auto_765724 ?auto_765727 ) ) ( not ( = ?auto_765724 ?auto_765728 ) ) ( not ( = ?auto_765724 ?auto_765729 ) ) ( not ( = ?auto_765724 ?auto_765730 ) ) ( not ( = ?auto_765724 ?auto_765731 ) ) ( not ( = ?auto_765724 ?auto_765732 ) ) ( not ( = ?auto_765724 ?auto_765733 ) ) ( not ( = ?auto_765724 ?auto_765734 ) ) ( not ( = ?auto_765724 ?auto_765735 ) ) ( not ( = ?auto_765724 ?auto_765736 ) ) ( not ( = ?auto_765724 ?auto_765737 ) ) ( not ( = ?auto_765724 ?auto_765738 ) ) ( not ( = ?auto_765724 ?auto_765739 ) ) ( not ( = ?auto_765724 ?auto_765740 ) ) ( not ( = ?auto_765724 ?auto_765741 ) ) ( not ( = ?auto_765725 ?auto_765726 ) ) ( not ( = ?auto_765725 ?auto_765727 ) ) ( not ( = ?auto_765725 ?auto_765728 ) ) ( not ( = ?auto_765725 ?auto_765729 ) ) ( not ( = ?auto_765725 ?auto_765730 ) ) ( not ( = ?auto_765725 ?auto_765731 ) ) ( not ( = ?auto_765725 ?auto_765732 ) ) ( not ( = ?auto_765725 ?auto_765733 ) ) ( not ( = ?auto_765725 ?auto_765734 ) ) ( not ( = ?auto_765725 ?auto_765735 ) ) ( not ( = ?auto_765725 ?auto_765736 ) ) ( not ( = ?auto_765725 ?auto_765737 ) ) ( not ( = ?auto_765725 ?auto_765738 ) ) ( not ( = ?auto_765725 ?auto_765739 ) ) ( not ( = ?auto_765725 ?auto_765740 ) ) ( not ( = ?auto_765725 ?auto_765741 ) ) ( not ( = ?auto_765726 ?auto_765727 ) ) ( not ( = ?auto_765726 ?auto_765728 ) ) ( not ( = ?auto_765726 ?auto_765729 ) ) ( not ( = ?auto_765726 ?auto_765730 ) ) ( not ( = ?auto_765726 ?auto_765731 ) ) ( not ( = ?auto_765726 ?auto_765732 ) ) ( not ( = ?auto_765726 ?auto_765733 ) ) ( not ( = ?auto_765726 ?auto_765734 ) ) ( not ( = ?auto_765726 ?auto_765735 ) ) ( not ( = ?auto_765726 ?auto_765736 ) ) ( not ( = ?auto_765726 ?auto_765737 ) ) ( not ( = ?auto_765726 ?auto_765738 ) ) ( not ( = ?auto_765726 ?auto_765739 ) ) ( not ( = ?auto_765726 ?auto_765740 ) ) ( not ( = ?auto_765726 ?auto_765741 ) ) ( not ( = ?auto_765727 ?auto_765728 ) ) ( not ( = ?auto_765727 ?auto_765729 ) ) ( not ( = ?auto_765727 ?auto_765730 ) ) ( not ( = ?auto_765727 ?auto_765731 ) ) ( not ( = ?auto_765727 ?auto_765732 ) ) ( not ( = ?auto_765727 ?auto_765733 ) ) ( not ( = ?auto_765727 ?auto_765734 ) ) ( not ( = ?auto_765727 ?auto_765735 ) ) ( not ( = ?auto_765727 ?auto_765736 ) ) ( not ( = ?auto_765727 ?auto_765737 ) ) ( not ( = ?auto_765727 ?auto_765738 ) ) ( not ( = ?auto_765727 ?auto_765739 ) ) ( not ( = ?auto_765727 ?auto_765740 ) ) ( not ( = ?auto_765727 ?auto_765741 ) ) ( not ( = ?auto_765728 ?auto_765729 ) ) ( not ( = ?auto_765728 ?auto_765730 ) ) ( not ( = ?auto_765728 ?auto_765731 ) ) ( not ( = ?auto_765728 ?auto_765732 ) ) ( not ( = ?auto_765728 ?auto_765733 ) ) ( not ( = ?auto_765728 ?auto_765734 ) ) ( not ( = ?auto_765728 ?auto_765735 ) ) ( not ( = ?auto_765728 ?auto_765736 ) ) ( not ( = ?auto_765728 ?auto_765737 ) ) ( not ( = ?auto_765728 ?auto_765738 ) ) ( not ( = ?auto_765728 ?auto_765739 ) ) ( not ( = ?auto_765728 ?auto_765740 ) ) ( not ( = ?auto_765728 ?auto_765741 ) ) ( not ( = ?auto_765729 ?auto_765730 ) ) ( not ( = ?auto_765729 ?auto_765731 ) ) ( not ( = ?auto_765729 ?auto_765732 ) ) ( not ( = ?auto_765729 ?auto_765733 ) ) ( not ( = ?auto_765729 ?auto_765734 ) ) ( not ( = ?auto_765729 ?auto_765735 ) ) ( not ( = ?auto_765729 ?auto_765736 ) ) ( not ( = ?auto_765729 ?auto_765737 ) ) ( not ( = ?auto_765729 ?auto_765738 ) ) ( not ( = ?auto_765729 ?auto_765739 ) ) ( not ( = ?auto_765729 ?auto_765740 ) ) ( not ( = ?auto_765729 ?auto_765741 ) ) ( not ( = ?auto_765730 ?auto_765731 ) ) ( not ( = ?auto_765730 ?auto_765732 ) ) ( not ( = ?auto_765730 ?auto_765733 ) ) ( not ( = ?auto_765730 ?auto_765734 ) ) ( not ( = ?auto_765730 ?auto_765735 ) ) ( not ( = ?auto_765730 ?auto_765736 ) ) ( not ( = ?auto_765730 ?auto_765737 ) ) ( not ( = ?auto_765730 ?auto_765738 ) ) ( not ( = ?auto_765730 ?auto_765739 ) ) ( not ( = ?auto_765730 ?auto_765740 ) ) ( not ( = ?auto_765730 ?auto_765741 ) ) ( not ( = ?auto_765731 ?auto_765732 ) ) ( not ( = ?auto_765731 ?auto_765733 ) ) ( not ( = ?auto_765731 ?auto_765734 ) ) ( not ( = ?auto_765731 ?auto_765735 ) ) ( not ( = ?auto_765731 ?auto_765736 ) ) ( not ( = ?auto_765731 ?auto_765737 ) ) ( not ( = ?auto_765731 ?auto_765738 ) ) ( not ( = ?auto_765731 ?auto_765739 ) ) ( not ( = ?auto_765731 ?auto_765740 ) ) ( not ( = ?auto_765731 ?auto_765741 ) ) ( not ( = ?auto_765732 ?auto_765733 ) ) ( not ( = ?auto_765732 ?auto_765734 ) ) ( not ( = ?auto_765732 ?auto_765735 ) ) ( not ( = ?auto_765732 ?auto_765736 ) ) ( not ( = ?auto_765732 ?auto_765737 ) ) ( not ( = ?auto_765732 ?auto_765738 ) ) ( not ( = ?auto_765732 ?auto_765739 ) ) ( not ( = ?auto_765732 ?auto_765740 ) ) ( not ( = ?auto_765732 ?auto_765741 ) ) ( not ( = ?auto_765733 ?auto_765734 ) ) ( not ( = ?auto_765733 ?auto_765735 ) ) ( not ( = ?auto_765733 ?auto_765736 ) ) ( not ( = ?auto_765733 ?auto_765737 ) ) ( not ( = ?auto_765733 ?auto_765738 ) ) ( not ( = ?auto_765733 ?auto_765739 ) ) ( not ( = ?auto_765733 ?auto_765740 ) ) ( not ( = ?auto_765733 ?auto_765741 ) ) ( not ( = ?auto_765734 ?auto_765735 ) ) ( not ( = ?auto_765734 ?auto_765736 ) ) ( not ( = ?auto_765734 ?auto_765737 ) ) ( not ( = ?auto_765734 ?auto_765738 ) ) ( not ( = ?auto_765734 ?auto_765739 ) ) ( not ( = ?auto_765734 ?auto_765740 ) ) ( not ( = ?auto_765734 ?auto_765741 ) ) ( not ( = ?auto_765735 ?auto_765736 ) ) ( not ( = ?auto_765735 ?auto_765737 ) ) ( not ( = ?auto_765735 ?auto_765738 ) ) ( not ( = ?auto_765735 ?auto_765739 ) ) ( not ( = ?auto_765735 ?auto_765740 ) ) ( not ( = ?auto_765735 ?auto_765741 ) ) ( not ( = ?auto_765736 ?auto_765737 ) ) ( not ( = ?auto_765736 ?auto_765738 ) ) ( not ( = ?auto_765736 ?auto_765739 ) ) ( not ( = ?auto_765736 ?auto_765740 ) ) ( not ( = ?auto_765736 ?auto_765741 ) ) ( not ( = ?auto_765737 ?auto_765738 ) ) ( not ( = ?auto_765737 ?auto_765739 ) ) ( not ( = ?auto_765737 ?auto_765740 ) ) ( not ( = ?auto_765737 ?auto_765741 ) ) ( not ( = ?auto_765738 ?auto_765739 ) ) ( not ( = ?auto_765738 ?auto_765740 ) ) ( not ( = ?auto_765738 ?auto_765741 ) ) ( not ( = ?auto_765739 ?auto_765740 ) ) ( not ( = ?auto_765739 ?auto_765741 ) ) ( not ( = ?auto_765740 ?auto_765741 ) ) ( ON ?auto_765740 ?auto_765741 ) ( ON ?auto_765739 ?auto_765740 ) ( ON ?auto_765738 ?auto_765739 ) ( ON ?auto_765737 ?auto_765738 ) ( ON ?auto_765736 ?auto_765737 ) ( ON ?auto_765735 ?auto_765736 ) ( ON ?auto_765734 ?auto_765735 ) ( ON ?auto_765733 ?auto_765734 ) ( ON ?auto_765732 ?auto_765733 ) ( ON ?auto_765731 ?auto_765732 ) ( ON ?auto_765730 ?auto_765731 ) ( ON ?auto_765729 ?auto_765730 ) ( CLEAR ?auto_765727 ) ( ON ?auto_765728 ?auto_765729 ) ( CLEAR ?auto_765728 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-5PILE ?auto_765724 ?auto_765725 ?auto_765726 ?auto_765727 ?auto_765728 )
      ( MAKE-18PILE ?auto_765724 ?auto_765725 ?auto_765726 ?auto_765727 ?auto_765728 ?auto_765729 ?auto_765730 ?auto_765731 ?auto_765732 ?auto_765733 ?auto_765734 ?auto_765735 ?auto_765736 ?auto_765737 ?auto_765738 ?auto_765739 ?auto_765740 ?auto_765741 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_765760 - BLOCK
      ?auto_765761 - BLOCK
      ?auto_765762 - BLOCK
      ?auto_765763 - BLOCK
      ?auto_765764 - BLOCK
      ?auto_765765 - BLOCK
      ?auto_765766 - BLOCK
      ?auto_765767 - BLOCK
      ?auto_765768 - BLOCK
      ?auto_765769 - BLOCK
      ?auto_765770 - BLOCK
      ?auto_765771 - BLOCK
      ?auto_765772 - BLOCK
      ?auto_765773 - BLOCK
      ?auto_765774 - BLOCK
      ?auto_765775 - BLOCK
      ?auto_765776 - BLOCK
      ?auto_765777 - BLOCK
    )
    :vars
    (
      ?auto_765778 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_765777 ?auto_765778 ) ( ON-TABLE ?auto_765760 ) ( ON ?auto_765761 ?auto_765760 ) ( ON ?auto_765762 ?auto_765761 ) ( not ( = ?auto_765760 ?auto_765761 ) ) ( not ( = ?auto_765760 ?auto_765762 ) ) ( not ( = ?auto_765760 ?auto_765763 ) ) ( not ( = ?auto_765760 ?auto_765764 ) ) ( not ( = ?auto_765760 ?auto_765765 ) ) ( not ( = ?auto_765760 ?auto_765766 ) ) ( not ( = ?auto_765760 ?auto_765767 ) ) ( not ( = ?auto_765760 ?auto_765768 ) ) ( not ( = ?auto_765760 ?auto_765769 ) ) ( not ( = ?auto_765760 ?auto_765770 ) ) ( not ( = ?auto_765760 ?auto_765771 ) ) ( not ( = ?auto_765760 ?auto_765772 ) ) ( not ( = ?auto_765760 ?auto_765773 ) ) ( not ( = ?auto_765760 ?auto_765774 ) ) ( not ( = ?auto_765760 ?auto_765775 ) ) ( not ( = ?auto_765760 ?auto_765776 ) ) ( not ( = ?auto_765760 ?auto_765777 ) ) ( not ( = ?auto_765760 ?auto_765778 ) ) ( not ( = ?auto_765761 ?auto_765762 ) ) ( not ( = ?auto_765761 ?auto_765763 ) ) ( not ( = ?auto_765761 ?auto_765764 ) ) ( not ( = ?auto_765761 ?auto_765765 ) ) ( not ( = ?auto_765761 ?auto_765766 ) ) ( not ( = ?auto_765761 ?auto_765767 ) ) ( not ( = ?auto_765761 ?auto_765768 ) ) ( not ( = ?auto_765761 ?auto_765769 ) ) ( not ( = ?auto_765761 ?auto_765770 ) ) ( not ( = ?auto_765761 ?auto_765771 ) ) ( not ( = ?auto_765761 ?auto_765772 ) ) ( not ( = ?auto_765761 ?auto_765773 ) ) ( not ( = ?auto_765761 ?auto_765774 ) ) ( not ( = ?auto_765761 ?auto_765775 ) ) ( not ( = ?auto_765761 ?auto_765776 ) ) ( not ( = ?auto_765761 ?auto_765777 ) ) ( not ( = ?auto_765761 ?auto_765778 ) ) ( not ( = ?auto_765762 ?auto_765763 ) ) ( not ( = ?auto_765762 ?auto_765764 ) ) ( not ( = ?auto_765762 ?auto_765765 ) ) ( not ( = ?auto_765762 ?auto_765766 ) ) ( not ( = ?auto_765762 ?auto_765767 ) ) ( not ( = ?auto_765762 ?auto_765768 ) ) ( not ( = ?auto_765762 ?auto_765769 ) ) ( not ( = ?auto_765762 ?auto_765770 ) ) ( not ( = ?auto_765762 ?auto_765771 ) ) ( not ( = ?auto_765762 ?auto_765772 ) ) ( not ( = ?auto_765762 ?auto_765773 ) ) ( not ( = ?auto_765762 ?auto_765774 ) ) ( not ( = ?auto_765762 ?auto_765775 ) ) ( not ( = ?auto_765762 ?auto_765776 ) ) ( not ( = ?auto_765762 ?auto_765777 ) ) ( not ( = ?auto_765762 ?auto_765778 ) ) ( not ( = ?auto_765763 ?auto_765764 ) ) ( not ( = ?auto_765763 ?auto_765765 ) ) ( not ( = ?auto_765763 ?auto_765766 ) ) ( not ( = ?auto_765763 ?auto_765767 ) ) ( not ( = ?auto_765763 ?auto_765768 ) ) ( not ( = ?auto_765763 ?auto_765769 ) ) ( not ( = ?auto_765763 ?auto_765770 ) ) ( not ( = ?auto_765763 ?auto_765771 ) ) ( not ( = ?auto_765763 ?auto_765772 ) ) ( not ( = ?auto_765763 ?auto_765773 ) ) ( not ( = ?auto_765763 ?auto_765774 ) ) ( not ( = ?auto_765763 ?auto_765775 ) ) ( not ( = ?auto_765763 ?auto_765776 ) ) ( not ( = ?auto_765763 ?auto_765777 ) ) ( not ( = ?auto_765763 ?auto_765778 ) ) ( not ( = ?auto_765764 ?auto_765765 ) ) ( not ( = ?auto_765764 ?auto_765766 ) ) ( not ( = ?auto_765764 ?auto_765767 ) ) ( not ( = ?auto_765764 ?auto_765768 ) ) ( not ( = ?auto_765764 ?auto_765769 ) ) ( not ( = ?auto_765764 ?auto_765770 ) ) ( not ( = ?auto_765764 ?auto_765771 ) ) ( not ( = ?auto_765764 ?auto_765772 ) ) ( not ( = ?auto_765764 ?auto_765773 ) ) ( not ( = ?auto_765764 ?auto_765774 ) ) ( not ( = ?auto_765764 ?auto_765775 ) ) ( not ( = ?auto_765764 ?auto_765776 ) ) ( not ( = ?auto_765764 ?auto_765777 ) ) ( not ( = ?auto_765764 ?auto_765778 ) ) ( not ( = ?auto_765765 ?auto_765766 ) ) ( not ( = ?auto_765765 ?auto_765767 ) ) ( not ( = ?auto_765765 ?auto_765768 ) ) ( not ( = ?auto_765765 ?auto_765769 ) ) ( not ( = ?auto_765765 ?auto_765770 ) ) ( not ( = ?auto_765765 ?auto_765771 ) ) ( not ( = ?auto_765765 ?auto_765772 ) ) ( not ( = ?auto_765765 ?auto_765773 ) ) ( not ( = ?auto_765765 ?auto_765774 ) ) ( not ( = ?auto_765765 ?auto_765775 ) ) ( not ( = ?auto_765765 ?auto_765776 ) ) ( not ( = ?auto_765765 ?auto_765777 ) ) ( not ( = ?auto_765765 ?auto_765778 ) ) ( not ( = ?auto_765766 ?auto_765767 ) ) ( not ( = ?auto_765766 ?auto_765768 ) ) ( not ( = ?auto_765766 ?auto_765769 ) ) ( not ( = ?auto_765766 ?auto_765770 ) ) ( not ( = ?auto_765766 ?auto_765771 ) ) ( not ( = ?auto_765766 ?auto_765772 ) ) ( not ( = ?auto_765766 ?auto_765773 ) ) ( not ( = ?auto_765766 ?auto_765774 ) ) ( not ( = ?auto_765766 ?auto_765775 ) ) ( not ( = ?auto_765766 ?auto_765776 ) ) ( not ( = ?auto_765766 ?auto_765777 ) ) ( not ( = ?auto_765766 ?auto_765778 ) ) ( not ( = ?auto_765767 ?auto_765768 ) ) ( not ( = ?auto_765767 ?auto_765769 ) ) ( not ( = ?auto_765767 ?auto_765770 ) ) ( not ( = ?auto_765767 ?auto_765771 ) ) ( not ( = ?auto_765767 ?auto_765772 ) ) ( not ( = ?auto_765767 ?auto_765773 ) ) ( not ( = ?auto_765767 ?auto_765774 ) ) ( not ( = ?auto_765767 ?auto_765775 ) ) ( not ( = ?auto_765767 ?auto_765776 ) ) ( not ( = ?auto_765767 ?auto_765777 ) ) ( not ( = ?auto_765767 ?auto_765778 ) ) ( not ( = ?auto_765768 ?auto_765769 ) ) ( not ( = ?auto_765768 ?auto_765770 ) ) ( not ( = ?auto_765768 ?auto_765771 ) ) ( not ( = ?auto_765768 ?auto_765772 ) ) ( not ( = ?auto_765768 ?auto_765773 ) ) ( not ( = ?auto_765768 ?auto_765774 ) ) ( not ( = ?auto_765768 ?auto_765775 ) ) ( not ( = ?auto_765768 ?auto_765776 ) ) ( not ( = ?auto_765768 ?auto_765777 ) ) ( not ( = ?auto_765768 ?auto_765778 ) ) ( not ( = ?auto_765769 ?auto_765770 ) ) ( not ( = ?auto_765769 ?auto_765771 ) ) ( not ( = ?auto_765769 ?auto_765772 ) ) ( not ( = ?auto_765769 ?auto_765773 ) ) ( not ( = ?auto_765769 ?auto_765774 ) ) ( not ( = ?auto_765769 ?auto_765775 ) ) ( not ( = ?auto_765769 ?auto_765776 ) ) ( not ( = ?auto_765769 ?auto_765777 ) ) ( not ( = ?auto_765769 ?auto_765778 ) ) ( not ( = ?auto_765770 ?auto_765771 ) ) ( not ( = ?auto_765770 ?auto_765772 ) ) ( not ( = ?auto_765770 ?auto_765773 ) ) ( not ( = ?auto_765770 ?auto_765774 ) ) ( not ( = ?auto_765770 ?auto_765775 ) ) ( not ( = ?auto_765770 ?auto_765776 ) ) ( not ( = ?auto_765770 ?auto_765777 ) ) ( not ( = ?auto_765770 ?auto_765778 ) ) ( not ( = ?auto_765771 ?auto_765772 ) ) ( not ( = ?auto_765771 ?auto_765773 ) ) ( not ( = ?auto_765771 ?auto_765774 ) ) ( not ( = ?auto_765771 ?auto_765775 ) ) ( not ( = ?auto_765771 ?auto_765776 ) ) ( not ( = ?auto_765771 ?auto_765777 ) ) ( not ( = ?auto_765771 ?auto_765778 ) ) ( not ( = ?auto_765772 ?auto_765773 ) ) ( not ( = ?auto_765772 ?auto_765774 ) ) ( not ( = ?auto_765772 ?auto_765775 ) ) ( not ( = ?auto_765772 ?auto_765776 ) ) ( not ( = ?auto_765772 ?auto_765777 ) ) ( not ( = ?auto_765772 ?auto_765778 ) ) ( not ( = ?auto_765773 ?auto_765774 ) ) ( not ( = ?auto_765773 ?auto_765775 ) ) ( not ( = ?auto_765773 ?auto_765776 ) ) ( not ( = ?auto_765773 ?auto_765777 ) ) ( not ( = ?auto_765773 ?auto_765778 ) ) ( not ( = ?auto_765774 ?auto_765775 ) ) ( not ( = ?auto_765774 ?auto_765776 ) ) ( not ( = ?auto_765774 ?auto_765777 ) ) ( not ( = ?auto_765774 ?auto_765778 ) ) ( not ( = ?auto_765775 ?auto_765776 ) ) ( not ( = ?auto_765775 ?auto_765777 ) ) ( not ( = ?auto_765775 ?auto_765778 ) ) ( not ( = ?auto_765776 ?auto_765777 ) ) ( not ( = ?auto_765776 ?auto_765778 ) ) ( not ( = ?auto_765777 ?auto_765778 ) ) ( ON ?auto_765776 ?auto_765777 ) ( ON ?auto_765775 ?auto_765776 ) ( ON ?auto_765774 ?auto_765775 ) ( ON ?auto_765773 ?auto_765774 ) ( ON ?auto_765772 ?auto_765773 ) ( ON ?auto_765771 ?auto_765772 ) ( ON ?auto_765770 ?auto_765771 ) ( ON ?auto_765769 ?auto_765770 ) ( ON ?auto_765768 ?auto_765769 ) ( ON ?auto_765767 ?auto_765768 ) ( ON ?auto_765766 ?auto_765767 ) ( ON ?auto_765765 ?auto_765766 ) ( ON ?auto_765764 ?auto_765765 ) ( CLEAR ?auto_765762 ) ( ON ?auto_765763 ?auto_765764 ) ( CLEAR ?auto_765763 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_765760 ?auto_765761 ?auto_765762 ?auto_765763 )
      ( MAKE-18PILE ?auto_765760 ?auto_765761 ?auto_765762 ?auto_765763 ?auto_765764 ?auto_765765 ?auto_765766 ?auto_765767 ?auto_765768 ?auto_765769 ?auto_765770 ?auto_765771 ?auto_765772 ?auto_765773 ?auto_765774 ?auto_765775 ?auto_765776 ?auto_765777 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_765797 - BLOCK
      ?auto_765798 - BLOCK
      ?auto_765799 - BLOCK
      ?auto_765800 - BLOCK
      ?auto_765801 - BLOCK
      ?auto_765802 - BLOCK
      ?auto_765803 - BLOCK
      ?auto_765804 - BLOCK
      ?auto_765805 - BLOCK
      ?auto_765806 - BLOCK
      ?auto_765807 - BLOCK
      ?auto_765808 - BLOCK
      ?auto_765809 - BLOCK
      ?auto_765810 - BLOCK
      ?auto_765811 - BLOCK
      ?auto_765812 - BLOCK
      ?auto_765813 - BLOCK
      ?auto_765814 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_765814 ) ( ON-TABLE ?auto_765797 ) ( ON ?auto_765798 ?auto_765797 ) ( ON ?auto_765799 ?auto_765798 ) ( not ( = ?auto_765797 ?auto_765798 ) ) ( not ( = ?auto_765797 ?auto_765799 ) ) ( not ( = ?auto_765797 ?auto_765800 ) ) ( not ( = ?auto_765797 ?auto_765801 ) ) ( not ( = ?auto_765797 ?auto_765802 ) ) ( not ( = ?auto_765797 ?auto_765803 ) ) ( not ( = ?auto_765797 ?auto_765804 ) ) ( not ( = ?auto_765797 ?auto_765805 ) ) ( not ( = ?auto_765797 ?auto_765806 ) ) ( not ( = ?auto_765797 ?auto_765807 ) ) ( not ( = ?auto_765797 ?auto_765808 ) ) ( not ( = ?auto_765797 ?auto_765809 ) ) ( not ( = ?auto_765797 ?auto_765810 ) ) ( not ( = ?auto_765797 ?auto_765811 ) ) ( not ( = ?auto_765797 ?auto_765812 ) ) ( not ( = ?auto_765797 ?auto_765813 ) ) ( not ( = ?auto_765797 ?auto_765814 ) ) ( not ( = ?auto_765798 ?auto_765799 ) ) ( not ( = ?auto_765798 ?auto_765800 ) ) ( not ( = ?auto_765798 ?auto_765801 ) ) ( not ( = ?auto_765798 ?auto_765802 ) ) ( not ( = ?auto_765798 ?auto_765803 ) ) ( not ( = ?auto_765798 ?auto_765804 ) ) ( not ( = ?auto_765798 ?auto_765805 ) ) ( not ( = ?auto_765798 ?auto_765806 ) ) ( not ( = ?auto_765798 ?auto_765807 ) ) ( not ( = ?auto_765798 ?auto_765808 ) ) ( not ( = ?auto_765798 ?auto_765809 ) ) ( not ( = ?auto_765798 ?auto_765810 ) ) ( not ( = ?auto_765798 ?auto_765811 ) ) ( not ( = ?auto_765798 ?auto_765812 ) ) ( not ( = ?auto_765798 ?auto_765813 ) ) ( not ( = ?auto_765798 ?auto_765814 ) ) ( not ( = ?auto_765799 ?auto_765800 ) ) ( not ( = ?auto_765799 ?auto_765801 ) ) ( not ( = ?auto_765799 ?auto_765802 ) ) ( not ( = ?auto_765799 ?auto_765803 ) ) ( not ( = ?auto_765799 ?auto_765804 ) ) ( not ( = ?auto_765799 ?auto_765805 ) ) ( not ( = ?auto_765799 ?auto_765806 ) ) ( not ( = ?auto_765799 ?auto_765807 ) ) ( not ( = ?auto_765799 ?auto_765808 ) ) ( not ( = ?auto_765799 ?auto_765809 ) ) ( not ( = ?auto_765799 ?auto_765810 ) ) ( not ( = ?auto_765799 ?auto_765811 ) ) ( not ( = ?auto_765799 ?auto_765812 ) ) ( not ( = ?auto_765799 ?auto_765813 ) ) ( not ( = ?auto_765799 ?auto_765814 ) ) ( not ( = ?auto_765800 ?auto_765801 ) ) ( not ( = ?auto_765800 ?auto_765802 ) ) ( not ( = ?auto_765800 ?auto_765803 ) ) ( not ( = ?auto_765800 ?auto_765804 ) ) ( not ( = ?auto_765800 ?auto_765805 ) ) ( not ( = ?auto_765800 ?auto_765806 ) ) ( not ( = ?auto_765800 ?auto_765807 ) ) ( not ( = ?auto_765800 ?auto_765808 ) ) ( not ( = ?auto_765800 ?auto_765809 ) ) ( not ( = ?auto_765800 ?auto_765810 ) ) ( not ( = ?auto_765800 ?auto_765811 ) ) ( not ( = ?auto_765800 ?auto_765812 ) ) ( not ( = ?auto_765800 ?auto_765813 ) ) ( not ( = ?auto_765800 ?auto_765814 ) ) ( not ( = ?auto_765801 ?auto_765802 ) ) ( not ( = ?auto_765801 ?auto_765803 ) ) ( not ( = ?auto_765801 ?auto_765804 ) ) ( not ( = ?auto_765801 ?auto_765805 ) ) ( not ( = ?auto_765801 ?auto_765806 ) ) ( not ( = ?auto_765801 ?auto_765807 ) ) ( not ( = ?auto_765801 ?auto_765808 ) ) ( not ( = ?auto_765801 ?auto_765809 ) ) ( not ( = ?auto_765801 ?auto_765810 ) ) ( not ( = ?auto_765801 ?auto_765811 ) ) ( not ( = ?auto_765801 ?auto_765812 ) ) ( not ( = ?auto_765801 ?auto_765813 ) ) ( not ( = ?auto_765801 ?auto_765814 ) ) ( not ( = ?auto_765802 ?auto_765803 ) ) ( not ( = ?auto_765802 ?auto_765804 ) ) ( not ( = ?auto_765802 ?auto_765805 ) ) ( not ( = ?auto_765802 ?auto_765806 ) ) ( not ( = ?auto_765802 ?auto_765807 ) ) ( not ( = ?auto_765802 ?auto_765808 ) ) ( not ( = ?auto_765802 ?auto_765809 ) ) ( not ( = ?auto_765802 ?auto_765810 ) ) ( not ( = ?auto_765802 ?auto_765811 ) ) ( not ( = ?auto_765802 ?auto_765812 ) ) ( not ( = ?auto_765802 ?auto_765813 ) ) ( not ( = ?auto_765802 ?auto_765814 ) ) ( not ( = ?auto_765803 ?auto_765804 ) ) ( not ( = ?auto_765803 ?auto_765805 ) ) ( not ( = ?auto_765803 ?auto_765806 ) ) ( not ( = ?auto_765803 ?auto_765807 ) ) ( not ( = ?auto_765803 ?auto_765808 ) ) ( not ( = ?auto_765803 ?auto_765809 ) ) ( not ( = ?auto_765803 ?auto_765810 ) ) ( not ( = ?auto_765803 ?auto_765811 ) ) ( not ( = ?auto_765803 ?auto_765812 ) ) ( not ( = ?auto_765803 ?auto_765813 ) ) ( not ( = ?auto_765803 ?auto_765814 ) ) ( not ( = ?auto_765804 ?auto_765805 ) ) ( not ( = ?auto_765804 ?auto_765806 ) ) ( not ( = ?auto_765804 ?auto_765807 ) ) ( not ( = ?auto_765804 ?auto_765808 ) ) ( not ( = ?auto_765804 ?auto_765809 ) ) ( not ( = ?auto_765804 ?auto_765810 ) ) ( not ( = ?auto_765804 ?auto_765811 ) ) ( not ( = ?auto_765804 ?auto_765812 ) ) ( not ( = ?auto_765804 ?auto_765813 ) ) ( not ( = ?auto_765804 ?auto_765814 ) ) ( not ( = ?auto_765805 ?auto_765806 ) ) ( not ( = ?auto_765805 ?auto_765807 ) ) ( not ( = ?auto_765805 ?auto_765808 ) ) ( not ( = ?auto_765805 ?auto_765809 ) ) ( not ( = ?auto_765805 ?auto_765810 ) ) ( not ( = ?auto_765805 ?auto_765811 ) ) ( not ( = ?auto_765805 ?auto_765812 ) ) ( not ( = ?auto_765805 ?auto_765813 ) ) ( not ( = ?auto_765805 ?auto_765814 ) ) ( not ( = ?auto_765806 ?auto_765807 ) ) ( not ( = ?auto_765806 ?auto_765808 ) ) ( not ( = ?auto_765806 ?auto_765809 ) ) ( not ( = ?auto_765806 ?auto_765810 ) ) ( not ( = ?auto_765806 ?auto_765811 ) ) ( not ( = ?auto_765806 ?auto_765812 ) ) ( not ( = ?auto_765806 ?auto_765813 ) ) ( not ( = ?auto_765806 ?auto_765814 ) ) ( not ( = ?auto_765807 ?auto_765808 ) ) ( not ( = ?auto_765807 ?auto_765809 ) ) ( not ( = ?auto_765807 ?auto_765810 ) ) ( not ( = ?auto_765807 ?auto_765811 ) ) ( not ( = ?auto_765807 ?auto_765812 ) ) ( not ( = ?auto_765807 ?auto_765813 ) ) ( not ( = ?auto_765807 ?auto_765814 ) ) ( not ( = ?auto_765808 ?auto_765809 ) ) ( not ( = ?auto_765808 ?auto_765810 ) ) ( not ( = ?auto_765808 ?auto_765811 ) ) ( not ( = ?auto_765808 ?auto_765812 ) ) ( not ( = ?auto_765808 ?auto_765813 ) ) ( not ( = ?auto_765808 ?auto_765814 ) ) ( not ( = ?auto_765809 ?auto_765810 ) ) ( not ( = ?auto_765809 ?auto_765811 ) ) ( not ( = ?auto_765809 ?auto_765812 ) ) ( not ( = ?auto_765809 ?auto_765813 ) ) ( not ( = ?auto_765809 ?auto_765814 ) ) ( not ( = ?auto_765810 ?auto_765811 ) ) ( not ( = ?auto_765810 ?auto_765812 ) ) ( not ( = ?auto_765810 ?auto_765813 ) ) ( not ( = ?auto_765810 ?auto_765814 ) ) ( not ( = ?auto_765811 ?auto_765812 ) ) ( not ( = ?auto_765811 ?auto_765813 ) ) ( not ( = ?auto_765811 ?auto_765814 ) ) ( not ( = ?auto_765812 ?auto_765813 ) ) ( not ( = ?auto_765812 ?auto_765814 ) ) ( not ( = ?auto_765813 ?auto_765814 ) ) ( ON ?auto_765813 ?auto_765814 ) ( ON ?auto_765812 ?auto_765813 ) ( ON ?auto_765811 ?auto_765812 ) ( ON ?auto_765810 ?auto_765811 ) ( ON ?auto_765809 ?auto_765810 ) ( ON ?auto_765808 ?auto_765809 ) ( ON ?auto_765807 ?auto_765808 ) ( ON ?auto_765806 ?auto_765807 ) ( ON ?auto_765805 ?auto_765806 ) ( ON ?auto_765804 ?auto_765805 ) ( ON ?auto_765803 ?auto_765804 ) ( ON ?auto_765802 ?auto_765803 ) ( ON ?auto_765801 ?auto_765802 ) ( CLEAR ?auto_765799 ) ( ON ?auto_765800 ?auto_765801 ) ( CLEAR ?auto_765800 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-4PILE ?auto_765797 ?auto_765798 ?auto_765799 ?auto_765800 )
      ( MAKE-18PILE ?auto_765797 ?auto_765798 ?auto_765799 ?auto_765800 ?auto_765801 ?auto_765802 ?auto_765803 ?auto_765804 ?auto_765805 ?auto_765806 ?auto_765807 ?auto_765808 ?auto_765809 ?auto_765810 ?auto_765811 ?auto_765812 ?auto_765813 ?auto_765814 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_765833 - BLOCK
      ?auto_765834 - BLOCK
      ?auto_765835 - BLOCK
      ?auto_765836 - BLOCK
      ?auto_765837 - BLOCK
      ?auto_765838 - BLOCK
      ?auto_765839 - BLOCK
      ?auto_765840 - BLOCK
      ?auto_765841 - BLOCK
      ?auto_765842 - BLOCK
      ?auto_765843 - BLOCK
      ?auto_765844 - BLOCK
      ?auto_765845 - BLOCK
      ?auto_765846 - BLOCK
      ?auto_765847 - BLOCK
      ?auto_765848 - BLOCK
      ?auto_765849 - BLOCK
      ?auto_765850 - BLOCK
    )
    :vars
    (
      ?auto_765851 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_765850 ?auto_765851 ) ( ON-TABLE ?auto_765833 ) ( ON ?auto_765834 ?auto_765833 ) ( not ( = ?auto_765833 ?auto_765834 ) ) ( not ( = ?auto_765833 ?auto_765835 ) ) ( not ( = ?auto_765833 ?auto_765836 ) ) ( not ( = ?auto_765833 ?auto_765837 ) ) ( not ( = ?auto_765833 ?auto_765838 ) ) ( not ( = ?auto_765833 ?auto_765839 ) ) ( not ( = ?auto_765833 ?auto_765840 ) ) ( not ( = ?auto_765833 ?auto_765841 ) ) ( not ( = ?auto_765833 ?auto_765842 ) ) ( not ( = ?auto_765833 ?auto_765843 ) ) ( not ( = ?auto_765833 ?auto_765844 ) ) ( not ( = ?auto_765833 ?auto_765845 ) ) ( not ( = ?auto_765833 ?auto_765846 ) ) ( not ( = ?auto_765833 ?auto_765847 ) ) ( not ( = ?auto_765833 ?auto_765848 ) ) ( not ( = ?auto_765833 ?auto_765849 ) ) ( not ( = ?auto_765833 ?auto_765850 ) ) ( not ( = ?auto_765833 ?auto_765851 ) ) ( not ( = ?auto_765834 ?auto_765835 ) ) ( not ( = ?auto_765834 ?auto_765836 ) ) ( not ( = ?auto_765834 ?auto_765837 ) ) ( not ( = ?auto_765834 ?auto_765838 ) ) ( not ( = ?auto_765834 ?auto_765839 ) ) ( not ( = ?auto_765834 ?auto_765840 ) ) ( not ( = ?auto_765834 ?auto_765841 ) ) ( not ( = ?auto_765834 ?auto_765842 ) ) ( not ( = ?auto_765834 ?auto_765843 ) ) ( not ( = ?auto_765834 ?auto_765844 ) ) ( not ( = ?auto_765834 ?auto_765845 ) ) ( not ( = ?auto_765834 ?auto_765846 ) ) ( not ( = ?auto_765834 ?auto_765847 ) ) ( not ( = ?auto_765834 ?auto_765848 ) ) ( not ( = ?auto_765834 ?auto_765849 ) ) ( not ( = ?auto_765834 ?auto_765850 ) ) ( not ( = ?auto_765834 ?auto_765851 ) ) ( not ( = ?auto_765835 ?auto_765836 ) ) ( not ( = ?auto_765835 ?auto_765837 ) ) ( not ( = ?auto_765835 ?auto_765838 ) ) ( not ( = ?auto_765835 ?auto_765839 ) ) ( not ( = ?auto_765835 ?auto_765840 ) ) ( not ( = ?auto_765835 ?auto_765841 ) ) ( not ( = ?auto_765835 ?auto_765842 ) ) ( not ( = ?auto_765835 ?auto_765843 ) ) ( not ( = ?auto_765835 ?auto_765844 ) ) ( not ( = ?auto_765835 ?auto_765845 ) ) ( not ( = ?auto_765835 ?auto_765846 ) ) ( not ( = ?auto_765835 ?auto_765847 ) ) ( not ( = ?auto_765835 ?auto_765848 ) ) ( not ( = ?auto_765835 ?auto_765849 ) ) ( not ( = ?auto_765835 ?auto_765850 ) ) ( not ( = ?auto_765835 ?auto_765851 ) ) ( not ( = ?auto_765836 ?auto_765837 ) ) ( not ( = ?auto_765836 ?auto_765838 ) ) ( not ( = ?auto_765836 ?auto_765839 ) ) ( not ( = ?auto_765836 ?auto_765840 ) ) ( not ( = ?auto_765836 ?auto_765841 ) ) ( not ( = ?auto_765836 ?auto_765842 ) ) ( not ( = ?auto_765836 ?auto_765843 ) ) ( not ( = ?auto_765836 ?auto_765844 ) ) ( not ( = ?auto_765836 ?auto_765845 ) ) ( not ( = ?auto_765836 ?auto_765846 ) ) ( not ( = ?auto_765836 ?auto_765847 ) ) ( not ( = ?auto_765836 ?auto_765848 ) ) ( not ( = ?auto_765836 ?auto_765849 ) ) ( not ( = ?auto_765836 ?auto_765850 ) ) ( not ( = ?auto_765836 ?auto_765851 ) ) ( not ( = ?auto_765837 ?auto_765838 ) ) ( not ( = ?auto_765837 ?auto_765839 ) ) ( not ( = ?auto_765837 ?auto_765840 ) ) ( not ( = ?auto_765837 ?auto_765841 ) ) ( not ( = ?auto_765837 ?auto_765842 ) ) ( not ( = ?auto_765837 ?auto_765843 ) ) ( not ( = ?auto_765837 ?auto_765844 ) ) ( not ( = ?auto_765837 ?auto_765845 ) ) ( not ( = ?auto_765837 ?auto_765846 ) ) ( not ( = ?auto_765837 ?auto_765847 ) ) ( not ( = ?auto_765837 ?auto_765848 ) ) ( not ( = ?auto_765837 ?auto_765849 ) ) ( not ( = ?auto_765837 ?auto_765850 ) ) ( not ( = ?auto_765837 ?auto_765851 ) ) ( not ( = ?auto_765838 ?auto_765839 ) ) ( not ( = ?auto_765838 ?auto_765840 ) ) ( not ( = ?auto_765838 ?auto_765841 ) ) ( not ( = ?auto_765838 ?auto_765842 ) ) ( not ( = ?auto_765838 ?auto_765843 ) ) ( not ( = ?auto_765838 ?auto_765844 ) ) ( not ( = ?auto_765838 ?auto_765845 ) ) ( not ( = ?auto_765838 ?auto_765846 ) ) ( not ( = ?auto_765838 ?auto_765847 ) ) ( not ( = ?auto_765838 ?auto_765848 ) ) ( not ( = ?auto_765838 ?auto_765849 ) ) ( not ( = ?auto_765838 ?auto_765850 ) ) ( not ( = ?auto_765838 ?auto_765851 ) ) ( not ( = ?auto_765839 ?auto_765840 ) ) ( not ( = ?auto_765839 ?auto_765841 ) ) ( not ( = ?auto_765839 ?auto_765842 ) ) ( not ( = ?auto_765839 ?auto_765843 ) ) ( not ( = ?auto_765839 ?auto_765844 ) ) ( not ( = ?auto_765839 ?auto_765845 ) ) ( not ( = ?auto_765839 ?auto_765846 ) ) ( not ( = ?auto_765839 ?auto_765847 ) ) ( not ( = ?auto_765839 ?auto_765848 ) ) ( not ( = ?auto_765839 ?auto_765849 ) ) ( not ( = ?auto_765839 ?auto_765850 ) ) ( not ( = ?auto_765839 ?auto_765851 ) ) ( not ( = ?auto_765840 ?auto_765841 ) ) ( not ( = ?auto_765840 ?auto_765842 ) ) ( not ( = ?auto_765840 ?auto_765843 ) ) ( not ( = ?auto_765840 ?auto_765844 ) ) ( not ( = ?auto_765840 ?auto_765845 ) ) ( not ( = ?auto_765840 ?auto_765846 ) ) ( not ( = ?auto_765840 ?auto_765847 ) ) ( not ( = ?auto_765840 ?auto_765848 ) ) ( not ( = ?auto_765840 ?auto_765849 ) ) ( not ( = ?auto_765840 ?auto_765850 ) ) ( not ( = ?auto_765840 ?auto_765851 ) ) ( not ( = ?auto_765841 ?auto_765842 ) ) ( not ( = ?auto_765841 ?auto_765843 ) ) ( not ( = ?auto_765841 ?auto_765844 ) ) ( not ( = ?auto_765841 ?auto_765845 ) ) ( not ( = ?auto_765841 ?auto_765846 ) ) ( not ( = ?auto_765841 ?auto_765847 ) ) ( not ( = ?auto_765841 ?auto_765848 ) ) ( not ( = ?auto_765841 ?auto_765849 ) ) ( not ( = ?auto_765841 ?auto_765850 ) ) ( not ( = ?auto_765841 ?auto_765851 ) ) ( not ( = ?auto_765842 ?auto_765843 ) ) ( not ( = ?auto_765842 ?auto_765844 ) ) ( not ( = ?auto_765842 ?auto_765845 ) ) ( not ( = ?auto_765842 ?auto_765846 ) ) ( not ( = ?auto_765842 ?auto_765847 ) ) ( not ( = ?auto_765842 ?auto_765848 ) ) ( not ( = ?auto_765842 ?auto_765849 ) ) ( not ( = ?auto_765842 ?auto_765850 ) ) ( not ( = ?auto_765842 ?auto_765851 ) ) ( not ( = ?auto_765843 ?auto_765844 ) ) ( not ( = ?auto_765843 ?auto_765845 ) ) ( not ( = ?auto_765843 ?auto_765846 ) ) ( not ( = ?auto_765843 ?auto_765847 ) ) ( not ( = ?auto_765843 ?auto_765848 ) ) ( not ( = ?auto_765843 ?auto_765849 ) ) ( not ( = ?auto_765843 ?auto_765850 ) ) ( not ( = ?auto_765843 ?auto_765851 ) ) ( not ( = ?auto_765844 ?auto_765845 ) ) ( not ( = ?auto_765844 ?auto_765846 ) ) ( not ( = ?auto_765844 ?auto_765847 ) ) ( not ( = ?auto_765844 ?auto_765848 ) ) ( not ( = ?auto_765844 ?auto_765849 ) ) ( not ( = ?auto_765844 ?auto_765850 ) ) ( not ( = ?auto_765844 ?auto_765851 ) ) ( not ( = ?auto_765845 ?auto_765846 ) ) ( not ( = ?auto_765845 ?auto_765847 ) ) ( not ( = ?auto_765845 ?auto_765848 ) ) ( not ( = ?auto_765845 ?auto_765849 ) ) ( not ( = ?auto_765845 ?auto_765850 ) ) ( not ( = ?auto_765845 ?auto_765851 ) ) ( not ( = ?auto_765846 ?auto_765847 ) ) ( not ( = ?auto_765846 ?auto_765848 ) ) ( not ( = ?auto_765846 ?auto_765849 ) ) ( not ( = ?auto_765846 ?auto_765850 ) ) ( not ( = ?auto_765846 ?auto_765851 ) ) ( not ( = ?auto_765847 ?auto_765848 ) ) ( not ( = ?auto_765847 ?auto_765849 ) ) ( not ( = ?auto_765847 ?auto_765850 ) ) ( not ( = ?auto_765847 ?auto_765851 ) ) ( not ( = ?auto_765848 ?auto_765849 ) ) ( not ( = ?auto_765848 ?auto_765850 ) ) ( not ( = ?auto_765848 ?auto_765851 ) ) ( not ( = ?auto_765849 ?auto_765850 ) ) ( not ( = ?auto_765849 ?auto_765851 ) ) ( not ( = ?auto_765850 ?auto_765851 ) ) ( ON ?auto_765849 ?auto_765850 ) ( ON ?auto_765848 ?auto_765849 ) ( ON ?auto_765847 ?auto_765848 ) ( ON ?auto_765846 ?auto_765847 ) ( ON ?auto_765845 ?auto_765846 ) ( ON ?auto_765844 ?auto_765845 ) ( ON ?auto_765843 ?auto_765844 ) ( ON ?auto_765842 ?auto_765843 ) ( ON ?auto_765841 ?auto_765842 ) ( ON ?auto_765840 ?auto_765841 ) ( ON ?auto_765839 ?auto_765840 ) ( ON ?auto_765838 ?auto_765839 ) ( ON ?auto_765837 ?auto_765838 ) ( ON ?auto_765836 ?auto_765837 ) ( CLEAR ?auto_765834 ) ( ON ?auto_765835 ?auto_765836 ) ( CLEAR ?auto_765835 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_765833 ?auto_765834 ?auto_765835 )
      ( MAKE-18PILE ?auto_765833 ?auto_765834 ?auto_765835 ?auto_765836 ?auto_765837 ?auto_765838 ?auto_765839 ?auto_765840 ?auto_765841 ?auto_765842 ?auto_765843 ?auto_765844 ?auto_765845 ?auto_765846 ?auto_765847 ?auto_765848 ?auto_765849 ?auto_765850 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_765870 - BLOCK
      ?auto_765871 - BLOCK
      ?auto_765872 - BLOCK
      ?auto_765873 - BLOCK
      ?auto_765874 - BLOCK
      ?auto_765875 - BLOCK
      ?auto_765876 - BLOCK
      ?auto_765877 - BLOCK
      ?auto_765878 - BLOCK
      ?auto_765879 - BLOCK
      ?auto_765880 - BLOCK
      ?auto_765881 - BLOCK
      ?auto_765882 - BLOCK
      ?auto_765883 - BLOCK
      ?auto_765884 - BLOCK
      ?auto_765885 - BLOCK
      ?auto_765886 - BLOCK
      ?auto_765887 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_765887 ) ( ON-TABLE ?auto_765870 ) ( ON ?auto_765871 ?auto_765870 ) ( not ( = ?auto_765870 ?auto_765871 ) ) ( not ( = ?auto_765870 ?auto_765872 ) ) ( not ( = ?auto_765870 ?auto_765873 ) ) ( not ( = ?auto_765870 ?auto_765874 ) ) ( not ( = ?auto_765870 ?auto_765875 ) ) ( not ( = ?auto_765870 ?auto_765876 ) ) ( not ( = ?auto_765870 ?auto_765877 ) ) ( not ( = ?auto_765870 ?auto_765878 ) ) ( not ( = ?auto_765870 ?auto_765879 ) ) ( not ( = ?auto_765870 ?auto_765880 ) ) ( not ( = ?auto_765870 ?auto_765881 ) ) ( not ( = ?auto_765870 ?auto_765882 ) ) ( not ( = ?auto_765870 ?auto_765883 ) ) ( not ( = ?auto_765870 ?auto_765884 ) ) ( not ( = ?auto_765870 ?auto_765885 ) ) ( not ( = ?auto_765870 ?auto_765886 ) ) ( not ( = ?auto_765870 ?auto_765887 ) ) ( not ( = ?auto_765871 ?auto_765872 ) ) ( not ( = ?auto_765871 ?auto_765873 ) ) ( not ( = ?auto_765871 ?auto_765874 ) ) ( not ( = ?auto_765871 ?auto_765875 ) ) ( not ( = ?auto_765871 ?auto_765876 ) ) ( not ( = ?auto_765871 ?auto_765877 ) ) ( not ( = ?auto_765871 ?auto_765878 ) ) ( not ( = ?auto_765871 ?auto_765879 ) ) ( not ( = ?auto_765871 ?auto_765880 ) ) ( not ( = ?auto_765871 ?auto_765881 ) ) ( not ( = ?auto_765871 ?auto_765882 ) ) ( not ( = ?auto_765871 ?auto_765883 ) ) ( not ( = ?auto_765871 ?auto_765884 ) ) ( not ( = ?auto_765871 ?auto_765885 ) ) ( not ( = ?auto_765871 ?auto_765886 ) ) ( not ( = ?auto_765871 ?auto_765887 ) ) ( not ( = ?auto_765872 ?auto_765873 ) ) ( not ( = ?auto_765872 ?auto_765874 ) ) ( not ( = ?auto_765872 ?auto_765875 ) ) ( not ( = ?auto_765872 ?auto_765876 ) ) ( not ( = ?auto_765872 ?auto_765877 ) ) ( not ( = ?auto_765872 ?auto_765878 ) ) ( not ( = ?auto_765872 ?auto_765879 ) ) ( not ( = ?auto_765872 ?auto_765880 ) ) ( not ( = ?auto_765872 ?auto_765881 ) ) ( not ( = ?auto_765872 ?auto_765882 ) ) ( not ( = ?auto_765872 ?auto_765883 ) ) ( not ( = ?auto_765872 ?auto_765884 ) ) ( not ( = ?auto_765872 ?auto_765885 ) ) ( not ( = ?auto_765872 ?auto_765886 ) ) ( not ( = ?auto_765872 ?auto_765887 ) ) ( not ( = ?auto_765873 ?auto_765874 ) ) ( not ( = ?auto_765873 ?auto_765875 ) ) ( not ( = ?auto_765873 ?auto_765876 ) ) ( not ( = ?auto_765873 ?auto_765877 ) ) ( not ( = ?auto_765873 ?auto_765878 ) ) ( not ( = ?auto_765873 ?auto_765879 ) ) ( not ( = ?auto_765873 ?auto_765880 ) ) ( not ( = ?auto_765873 ?auto_765881 ) ) ( not ( = ?auto_765873 ?auto_765882 ) ) ( not ( = ?auto_765873 ?auto_765883 ) ) ( not ( = ?auto_765873 ?auto_765884 ) ) ( not ( = ?auto_765873 ?auto_765885 ) ) ( not ( = ?auto_765873 ?auto_765886 ) ) ( not ( = ?auto_765873 ?auto_765887 ) ) ( not ( = ?auto_765874 ?auto_765875 ) ) ( not ( = ?auto_765874 ?auto_765876 ) ) ( not ( = ?auto_765874 ?auto_765877 ) ) ( not ( = ?auto_765874 ?auto_765878 ) ) ( not ( = ?auto_765874 ?auto_765879 ) ) ( not ( = ?auto_765874 ?auto_765880 ) ) ( not ( = ?auto_765874 ?auto_765881 ) ) ( not ( = ?auto_765874 ?auto_765882 ) ) ( not ( = ?auto_765874 ?auto_765883 ) ) ( not ( = ?auto_765874 ?auto_765884 ) ) ( not ( = ?auto_765874 ?auto_765885 ) ) ( not ( = ?auto_765874 ?auto_765886 ) ) ( not ( = ?auto_765874 ?auto_765887 ) ) ( not ( = ?auto_765875 ?auto_765876 ) ) ( not ( = ?auto_765875 ?auto_765877 ) ) ( not ( = ?auto_765875 ?auto_765878 ) ) ( not ( = ?auto_765875 ?auto_765879 ) ) ( not ( = ?auto_765875 ?auto_765880 ) ) ( not ( = ?auto_765875 ?auto_765881 ) ) ( not ( = ?auto_765875 ?auto_765882 ) ) ( not ( = ?auto_765875 ?auto_765883 ) ) ( not ( = ?auto_765875 ?auto_765884 ) ) ( not ( = ?auto_765875 ?auto_765885 ) ) ( not ( = ?auto_765875 ?auto_765886 ) ) ( not ( = ?auto_765875 ?auto_765887 ) ) ( not ( = ?auto_765876 ?auto_765877 ) ) ( not ( = ?auto_765876 ?auto_765878 ) ) ( not ( = ?auto_765876 ?auto_765879 ) ) ( not ( = ?auto_765876 ?auto_765880 ) ) ( not ( = ?auto_765876 ?auto_765881 ) ) ( not ( = ?auto_765876 ?auto_765882 ) ) ( not ( = ?auto_765876 ?auto_765883 ) ) ( not ( = ?auto_765876 ?auto_765884 ) ) ( not ( = ?auto_765876 ?auto_765885 ) ) ( not ( = ?auto_765876 ?auto_765886 ) ) ( not ( = ?auto_765876 ?auto_765887 ) ) ( not ( = ?auto_765877 ?auto_765878 ) ) ( not ( = ?auto_765877 ?auto_765879 ) ) ( not ( = ?auto_765877 ?auto_765880 ) ) ( not ( = ?auto_765877 ?auto_765881 ) ) ( not ( = ?auto_765877 ?auto_765882 ) ) ( not ( = ?auto_765877 ?auto_765883 ) ) ( not ( = ?auto_765877 ?auto_765884 ) ) ( not ( = ?auto_765877 ?auto_765885 ) ) ( not ( = ?auto_765877 ?auto_765886 ) ) ( not ( = ?auto_765877 ?auto_765887 ) ) ( not ( = ?auto_765878 ?auto_765879 ) ) ( not ( = ?auto_765878 ?auto_765880 ) ) ( not ( = ?auto_765878 ?auto_765881 ) ) ( not ( = ?auto_765878 ?auto_765882 ) ) ( not ( = ?auto_765878 ?auto_765883 ) ) ( not ( = ?auto_765878 ?auto_765884 ) ) ( not ( = ?auto_765878 ?auto_765885 ) ) ( not ( = ?auto_765878 ?auto_765886 ) ) ( not ( = ?auto_765878 ?auto_765887 ) ) ( not ( = ?auto_765879 ?auto_765880 ) ) ( not ( = ?auto_765879 ?auto_765881 ) ) ( not ( = ?auto_765879 ?auto_765882 ) ) ( not ( = ?auto_765879 ?auto_765883 ) ) ( not ( = ?auto_765879 ?auto_765884 ) ) ( not ( = ?auto_765879 ?auto_765885 ) ) ( not ( = ?auto_765879 ?auto_765886 ) ) ( not ( = ?auto_765879 ?auto_765887 ) ) ( not ( = ?auto_765880 ?auto_765881 ) ) ( not ( = ?auto_765880 ?auto_765882 ) ) ( not ( = ?auto_765880 ?auto_765883 ) ) ( not ( = ?auto_765880 ?auto_765884 ) ) ( not ( = ?auto_765880 ?auto_765885 ) ) ( not ( = ?auto_765880 ?auto_765886 ) ) ( not ( = ?auto_765880 ?auto_765887 ) ) ( not ( = ?auto_765881 ?auto_765882 ) ) ( not ( = ?auto_765881 ?auto_765883 ) ) ( not ( = ?auto_765881 ?auto_765884 ) ) ( not ( = ?auto_765881 ?auto_765885 ) ) ( not ( = ?auto_765881 ?auto_765886 ) ) ( not ( = ?auto_765881 ?auto_765887 ) ) ( not ( = ?auto_765882 ?auto_765883 ) ) ( not ( = ?auto_765882 ?auto_765884 ) ) ( not ( = ?auto_765882 ?auto_765885 ) ) ( not ( = ?auto_765882 ?auto_765886 ) ) ( not ( = ?auto_765882 ?auto_765887 ) ) ( not ( = ?auto_765883 ?auto_765884 ) ) ( not ( = ?auto_765883 ?auto_765885 ) ) ( not ( = ?auto_765883 ?auto_765886 ) ) ( not ( = ?auto_765883 ?auto_765887 ) ) ( not ( = ?auto_765884 ?auto_765885 ) ) ( not ( = ?auto_765884 ?auto_765886 ) ) ( not ( = ?auto_765884 ?auto_765887 ) ) ( not ( = ?auto_765885 ?auto_765886 ) ) ( not ( = ?auto_765885 ?auto_765887 ) ) ( not ( = ?auto_765886 ?auto_765887 ) ) ( ON ?auto_765886 ?auto_765887 ) ( ON ?auto_765885 ?auto_765886 ) ( ON ?auto_765884 ?auto_765885 ) ( ON ?auto_765883 ?auto_765884 ) ( ON ?auto_765882 ?auto_765883 ) ( ON ?auto_765881 ?auto_765882 ) ( ON ?auto_765880 ?auto_765881 ) ( ON ?auto_765879 ?auto_765880 ) ( ON ?auto_765878 ?auto_765879 ) ( ON ?auto_765877 ?auto_765878 ) ( ON ?auto_765876 ?auto_765877 ) ( ON ?auto_765875 ?auto_765876 ) ( ON ?auto_765874 ?auto_765875 ) ( ON ?auto_765873 ?auto_765874 ) ( CLEAR ?auto_765871 ) ( ON ?auto_765872 ?auto_765873 ) ( CLEAR ?auto_765872 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-3PILE ?auto_765870 ?auto_765871 ?auto_765872 )
      ( MAKE-18PILE ?auto_765870 ?auto_765871 ?auto_765872 ?auto_765873 ?auto_765874 ?auto_765875 ?auto_765876 ?auto_765877 ?auto_765878 ?auto_765879 ?auto_765880 ?auto_765881 ?auto_765882 ?auto_765883 ?auto_765884 ?auto_765885 ?auto_765886 ?auto_765887 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_765906 - BLOCK
      ?auto_765907 - BLOCK
      ?auto_765908 - BLOCK
      ?auto_765909 - BLOCK
      ?auto_765910 - BLOCK
      ?auto_765911 - BLOCK
      ?auto_765912 - BLOCK
      ?auto_765913 - BLOCK
      ?auto_765914 - BLOCK
      ?auto_765915 - BLOCK
      ?auto_765916 - BLOCK
      ?auto_765917 - BLOCK
      ?auto_765918 - BLOCK
      ?auto_765919 - BLOCK
      ?auto_765920 - BLOCK
      ?auto_765921 - BLOCK
      ?auto_765922 - BLOCK
      ?auto_765923 - BLOCK
    )
    :vars
    (
      ?auto_765924 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_765923 ?auto_765924 ) ( ON-TABLE ?auto_765906 ) ( not ( = ?auto_765906 ?auto_765907 ) ) ( not ( = ?auto_765906 ?auto_765908 ) ) ( not ( = ?auto_765906 ?auto_765909 ) ) ( not ( = ?auto_765906 ?auto_765910 ) ) ( not ( = ?auto_765906 ?auto_765911 ) ) ( not ( = ?auto_765906 ?auto_765912 ) ) ( not ( = ?auto_765906 ?auto_765913 ) ) ( not ( = ?auto_765906 ?auto_765914 ) ) ( not ( = ?auto_765906 ?auto_765915 ) ) ( not ( = ?auto_765906 ?auto_765916 ) ) ( not ( = ?auto_765906 ?auto_765917 ) ) ( not ( = ?auto_765906 ?auto_765918 ) ) ( not ( = ?auto_765906 ?auto_765919 ) ) ( not ( = ?auto_765906 ?auto_765920 ) ) ( not ( = ?auto_765906 ?auto_765921 ) ) ( not ( = ?auto_765906 ?auto_765922 ) ) ( not ( = ?auto_765906 ?auto_765923 ) ) ( not ( = ?auto_765906 ?auto_765924 ) ) ( not ( = ?auto_765907 ?auto_765908 ) ) ( not ( = ?auto_765907 ?auto_765909 ) ) ( not ( = ?auto_765907 ?auto_765910 ) ) ( not ( = ?auto_765907 ?auto_765911 ) ) ( not ( = ?auto_765907 ?auto_765912 ) ) ( not ( = ?auto_765907 ?auto_765913 ) ) ( not ( = ?auto_765907 ?auto_765914 ) ) ( not ( = ?auto_765907 ?auto_765915 ) ) ( not ( = ?auto_765907 ?auto_765916 ) ) ( not ( = ?auto_765907 ?auto_765917 ) ) ( not ( = ?auto_765907 ?auto_765918 ) ) ( not ( = ?auto_765907 ?auto_765919 ) ) ( not ( = ?auto_765907 ?auto_765920 ) ) ( not ( = ?auto_765907 ?auto_765921 ) ) ( not ( = ?auto_765907 ?auto_765922 ) ) ( not ( = ?auto_765907 ?auto_765923 ) ) ( not ( = ?auto_765907 ?auto_765924 ) ) ( not ( = ?auto_765908 ?auto_765909 ) ) ( not ( = ?auto_765908 ?auto_765910 ) ) ( not ( = ?auto_765908 ?auto_765911 ) ) ( not ( = ?auto_765908 ?auto_765912 ) ) ( not ( = ?auto_765908 ?auto_765913 ) ) ( not ( = ?auto_765908 ?auto_765914 ) ) ( not ( = ?auto_765908 ?auto_765915 ) ) ( not ( = ?auto_765908 ?auto_765916 ) ) ( not ( = ?auto_765908 ?auto_765917 ) ) ( not ( = ?auto_765908 ?auto_765918 ) ) ( not ( = ?auto_765908 ?auto_765919 ) ) ( not ( = ?auto_765908 ?auto_765920 ) ) ( not ( = ?auto_765908 ?auto_765921 ) ) ( not ( = ?auto_765908 ?auto_765922 ) ) ( not ( = ?auto_765908 ?auto_765923 ) ) ( not ( = ?auto_765908 ?auto_765924 ) ) ( not ( = ?auto_765909 ?auto_765910 ) ) ( not ( = ?auto_765909 ?auto_765911 ) ) ( not ( = ?auto_765909 ?auto_765912 ) ) ( not ( = ?auto_765909 ?auto_765913 ) ) ( not ( = ?auto_765909 ?auto_765914 ) ) ( not ( = ?auto_765909 ?auto_765915 ) ) ( not ( = ?auto_765909 ?auto_765916 ) ) ( not ( = ?auto_765909 ?auto_765917 ) ) ( not ( = ?auto_765909 ?auto_765918 ) ) ( not ( = ?auto_765909 ?auto_765919 ) ) ( not ( = ?auto_765909 ?auto_765920 ) ) ( not ( = ?auto_765909 ?auto_765921 ) ) ( not ( = ?auto_765909 ?auto_765922 ) ) ( not ( = ?auto_765909 ?auto_765923 ) ) ( not ( = ?auto_765909 ?auto_765924 ) ) ( not ( = ?auto_765910 ?auto_765911 ) ) ( not ( = ?auto_765910 ?auto_765912 ) ) ( not ( = ?auto_765910 ?auto_765913 ) ) ( not ( = ?auto_765910 ?auto_765914 ) ) ( not ( = ?auto_765910 ?auto_765915 ) ) ( not ( = ?auto_765910 ?auto_765916 ) ) ( not ( = ?auto_765910 ?auto_765917 ) ) ( not ( = ?auto_765910 ?auto_765918 ) ) ( not ( = ?auto_765910 ?auto_765919 ) ) ( not ( = ?auto_765910 ?auto_765920 ) ) ( not ( = ?auto_765910 ?auto_765921 ) ) ( not ( = ?auto_765910 ?auto_765922 ) ) ( not ( = ?auto_765910 ?auto_765923 ) ) ( not ( = ?auto_765910 ?auto_765924 ) ) ( not ( = ?auto_765911 ?auto_765912 ) ) ( not ( = ?auto_765911 ?auto_765913 ) ) ( not ( = ?auto_765911 ?auto_765914 ) ) ( not ( = ?auto_765911 ?auto_765915 ) ) ( not ( = ?auto_765911 ?auto_765916 ) ) ( not ( = ?auto_765911 ?auto_765917 ) ) ( not ( = ?auto_765911 ?auto_765918 ) ) ( not ( = ?auto_765911 ?auto_765919 ) ) ( not ( = ?auto_765911 ?auto_765920 ) ) ( not ( = ?auto_765911 ?auto_765921 ) ) ( not ( = ?auto_765911 ?auto_765922 ) ) ( not ( = ?auto_765911 ?auto_765923 ) ) ( not ( = ?auto_765911 ?auto_765924 ) ) ( not ( = ?auto_765912 ?auto_765913 ) ) ( not ( = ?auto_765912 ?auto_765914 ) ) ( not ( = ?auto_765912 ?auto_765915 ) ) ( not ( = ?auto_765912 ?auto_765916 ) ) ( not ( = ?auto_765912 ?auto_765917 ) ) ( not ( = ?auto_765912 ?auto_765918 ) ) ( not ( = ?auto_765912 ?auto_765919 ) ) ( not ( = ?auto_765912 ?auto_765920 ) ) ( not ( = ?auto_765912 ?auto_765921 ) ) ( not ( = ?auto_765912 ?auto_765922 ) ) ( not ( = ?auto_765912 ?auto_765923 ) ) ( not ( = ?auto_765912 ?auto_765924 ) ) ( not ( = ?auto_765913 ?auto_765914 ) ) ( not ( = ?auto_765913 ?auto_765915 ) ) ( not ( = ?auto_765913 ?auto_765916 ) ) ( not ( = ?auto_765913 ?auto_765917 ) ) ( not ( = ?auto_765913 ?auto_765918 ) ) ( not ( = ?auto_765913 ?auto_765919 ) ) ( not ( = ?auto_765913 ?auto_765920 ) ) ( not ( = ?auto_765913 ?auto_765921 ) ) ( not ( = ?auto_765913 ?auto_765922 ) ) ( not ( = ?auto_765913 ?auto_765923 ) ) ( not ( = ?auto_765913 ?auto_765924 ) ) ( not ( = ?auto_765914 ?auto_765915 ) ) ( not ( = ?auto_765914 ?auto_765916 ) ) ( not ( = ?auto_765914 ?auto_765917 ) ) ( not ( = ?auto_765914 ?auto_765918 ) ) ( not ( = ?auto_765914 ?auto_765919 ) ) ( not ( = ?auto_765914 ?auto_765920 ) ) ( not ( = ?auto_765914 ?auto_765921 ) ) ( not ( = ?auto_765914 ?auto_765922 ) ) ( not ( = ?auto_765914 ?auto_765923 ) ) ( not ( = ?auto_765914 ?auto_765924 ) ) ( not ( = ?auto_765915 ?auto_765916 ) ) ( not ( = ?auto_765915 ?auto_765917 ) ) ( not ( = ?auto_765915 ?auto_765918 ) ) ( not ( = ?auto_765915 ?auto_765919 ) ) ( not ( = ?auto_765915 ?auto_765920 ) ) ( not ( = ?auto_765915 ?auto_765921 ) ) ( not ( = ?auto_765915 ?auto_765922 ) ) ( not ( = ?auto_765915 ?auto_765923 ) ) ( not ( = ?auto_765915 ?auto_765924 ) ) ( not ( = ?auto_765916 ?auto_765917 ) ) ( not ( = ?auto_765916 ?auto_765918 ) ) ( not ( = ?auto_765916 ?auto_765919 ) ) ( not ( = ?auto_765916 ?auto_765920 ) ) ( not ( = ?auto_765916 ?auto_765921 ) ) ( not ( = ?auto_765916 ?auto_765922 ) ) ( not ( = ?auto_765916 ?auto_765923 ) ) ( not ( = ?auto_765916 ?auto_765924 ) ) ( not ( = ?auto_765917 ?auto_765918 ) ) ( not ( = ?auto_765917 ?auto_765919 ) ) ( not ( = ?auto_765917 ?auto_765920 ) ) ( not ( = ?auto_765917 ?auto_765921 ) ) ( not ( = ?auto_765917 ?auto_765922 ) ) ( not ( = ?auto_765917 ?auto_765923 ) ) ( not ( = ?auto_765917 ?auto_765924 ) ) ( not ( = ?auto_765918 ?auto_765919 ) ) ( not ( = ?auto_765918 ?auto_765920 ) ) ( not ( = ?auto_765918 ?auto_765921 ) ) ( not ( = ?auto_765918 ?auto_765922 ) ) ( not ( = ?auto_765918 ?auto_765923 ) ) ( not ( = ?auto_765918 ?auto_765924 ) ) ( not ( = ?auto_765919 ?auto_765920 ) ) ( not ( = ?auto_765919 ?auto_765921 ) ) ( not ( = ?auto_765919 ?auto_765922 ) ) ( not ( = ?auto_765919 ?auto_765923 ) ) ( not ( = ?auto_765919 ?auto_765924 ) ) ( not ( = ?auto_765920 ?auto_765921 ) ) ( not ( = ?auto_765920 ?auto_765922 ) ) ( not ( = ?auto_765920 ?auto_765923 ) ) ( not ( = ?auto_765920 ?auto_765924 ) ) ( not ( = ?auto_765921 ?auto_765922 ) ) ( not ( = ?auto_765921 ?auto_765923 ) ) ( not ( = ?auto_765921 ?auto_765924 ) ) ( not ( = ?auto_765922 ?auto_765923 ) ) ( not ( = ?auto_765922 ?auto_765924 ) ) ( not ( = ?auto_765923 ?auto_765924 ) ) ( ON ?auto_765922 ?auto_765923 ) ( ON ?auto_765921 ?auto_765922 ) ( ON ?auto_765920 ?auto_765921 ) ( ON ?auto_765919 ?auto_765920 ) ( ON ?auto_765918 ?auto_765919 ) ( ON ?auto_765917 ?auto_765918 ) ( ON ?auto_765916 ?auto_765917 ) ( ON ?auto_765915 ?auto_765916 ) ( ON ?auto_765914 ?auto_765915 ) ( ON ?auto_765913 ?auto_765914 ) ( ON ?auto_765912 ?auto_765913 ) ( ON ?auto_765911 ?auto_765912 ) ( ON ?auto_765910 ?auto_765911 ) ( ON ?auto_765909 ?auto_765910 ) ( ON ?auto_765908 ?auto_765909 ) ( CLEAR ?auto_765906 ) ( ON ?auto_765907 ?auto_765908 ) ( CLEAR ?auto_765907 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_765906 ?auto_765907 )
      ( MAKE-18PILE ?auto_765906 ?auto_765907 ?auto_765908 ?auto_765909 ?auto_765910 ?auto_765911 ?auto_765912 ?auto_765913 ?auto_765914 ?auto_765915 ?auto_765916 ?auto_765917 ?auto_765918 ?auto_765919 ?auto_765920 ?auto_765921 ?auto_765922 ?auto_765923 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_765943 - BLOCK
      ?auto_765944 - BLOCK
      ?auto_765945 - BLOCK
      ?auto_765946 - BLOCK
      ?auto_765947 - BLOCK
      ?auto_765948 - BLOCK
      ?auto_765949 - BLOCK
      ?auto_765950 - BLOCK
      ?auto_765951 - BLOCK
      ?auto_765952 - BLOCK
      ?auto_765953 - BLOCK
      ?auto_765954 - BLOCK
      ?auto_765955 - BLOCK
      ?auto_765956 - BLOCK
      ?auto_765957 - BLOCK
      ?auto_765958 - BLOCK
      ?auto_765959 - BLOCK
      ?auto_765960 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_765960 ) ( ON-TABLE ?auto_765943 ) ( not ( = ?auto_765943 ?auto_765944 ) ) ( not ( = ?auto_765943 ?auto_765945 ) ) ( not ( = ?auto_765943 ?auto_765946 ) ) ( not ( = ?auto_765943 ?auto_765947 ) ) ( not ( = ?auto_765943 ?auto_765948 ) ) ( not ( = ?auto_765943 ?auto_765949 ) ) ( not ( = ?auto_765943 ?auto_765950 ) ) ( not ( = ?auto_765943 ?auto_765951 ) ) ( not ( = ?auto_765943 ?auto_765952 ) ) ( not ( = ?auto_765943 ?auto_765953 ) ) ( not ( = ?auto_765943 ?auto_765954 ) ) ( not ( = ?auto_765943 ?auto_765955 ) ) ( not ( = ?auto_765943 ?auto_765956 ) ) ( not ( = ?auto_765943 ?auto_765957 ) ) ( not ( = ?auto_765943 ?auto_765958 ) ) ( not ( = ?auto_765943 ?auto_765959 ) ) ( not ( = ?auto_765943 ?auto_765960 ) ) ( not ( = ?auto_765944 ?auto_765945 ) ) ( not ( = ?auto_765944 ?auto_765946 ) ) ( not ( = ?auto_765944 ?auto_765947 ) ) ( not ( = ?auto_765944 ?auto_765948 ) ) ( not ( = ?auto_765944 ?auto_765949 ) ) ( not ( = ?auto_765944 ?auto_765950 ) ) ( not ( = ?auto_765944 ?auto_765951 ) ) ( not ( = ?auto_765944 ?auto_765952 ) ) ( not ( = ?auto_765944 ?auto_765953 ) ) ( not ( = ?auto_765944 ?auto_765954 ) ) ( not ( = ?auto_765944 ?auto_765955 ) ) ( not ( = ?auto_765944 ?auto_765956 ) ) ( not ( = ?auto_765944 ?auto_765957 ) ) ( not ( = ?auto_765944 ?auto_765958 ) ) ( not ( = ?auto_765944 ?auto_765959 ) ) ( not ( = ?auto_765944 ?auto_765960 ) ) ( not ( = ?auto_765945 ?auto_765946 ) ) ( not ( = ?auto_765945 ?auto_765947 ) ) ( not ( = ?auto_765945 ?auto_765948 ) ) ( not ( = ?auto_765945 ?auto_765949 ) ) ( not ( = ?auto_765945 ?auto_765950 ) ) ( not ( = ?auto_765945 ?auto_765951 ) ) ( not ( = ?auto_765945 ?auto_765952 ) ) ( not ( = ?auto_765945 ?auto_765953 ) ) ( not ( = ?auto_765945 ?auto_765954 ) ) ( not ( = ?auto_765945 ?auto_765955 ) ) ( not ( = ?auto_765945 ?auto_765956 ) ) ( not ( = ?auto_765945 ?auto_765957 ) ) ( not ( = ?auto_765945 ?auto_765958 ) ) ( not ( = ?auto_765945 ?auto_765959 ) ) ( not ( = ?auto_765945 ?auto_765960 ) ) ( not ( = ?auto_765946 ?auto_765947 ) ) ( not ( = ?auto_765946 ?auto_765948 ) ) ( not ( = ?auto_765946 ?auto_765949 ) ) ( not ( = ?auto_765946 ?auto_765950 ) ) ( not ( = ?auto_765946 ?auto_765951 ) ) ( not ( = ?auto_765946 ?auto_765952 ) ) ( not ( = ?auto_765946 ?auto_765953 ) ) ( not ( = ?auto_765946 ?auto_765954 ) ) ( not ( = ?auto_765946 ?auto_765955 ) ) ( not ( = ?auto_765946 ?auto_765956 ) ) ( not ( = ?auto_765946 ?auto_765957 ) ) ( not ( = ?auto_765946 ?auto_765958 ) ) ( not ( = ?auto_765946 ?auto_765959 ) ) ( not ( = ?auto_765946 ?auto_765960 ) ) ( not ( = ?auto_765947 ?auto_765948 ) ) ( not ( = ?auto_765947 ?auto_765949 ) ) ( not ( = ?auto_765947 ?auto_765950 ) ) ( not ( = ?auto_765947 ?auto_765951 ) ) ( not ( = ?auto_765947 ?auto_765952 ) ) ( not ( = ?auto_765947 ?auto_765953 ) ) ( not ( = ?auto_765947 ?auto_765954 ) ) ( not ( = ?auto_765947 ?auto_765955 ) ) ( not ( = ?auto_765947 ?auto_765956 ) ) ( not ( = ?auto_765947 ?auto_765957 ) ) ( not ( = ?auto_765947 ?auto_765958 ) ) ( not ( = ?auto_765947 ?auto_765959 ) ) ( not ( = ?auto_765947 ?auto_765960 ) ) ( not ( = ?auto_765948 ?auto_765949 ) ) ( not ( = ?auto_765948 ?auto_765950 ) ) ( not ( = ?auto_765948 ?auto_765951 ) ) ( not ( = ?auto_765948 ?auto_765952 ) ) ( not ( = ?auto_765948 ?auto_765953 ) ) ( not ( = ?auto_765948 ?auto_765954 ) ) ( not ( = ?auto_765948 ?auto_765955 ) ) ( not ( = ?auto_765948 ?auto_765956 ) ) ( not ( = ?auto_765948 ?auto_765957 ) ) ( not ( = ?auto_765948 ?auto_765958 ) ) ( not ( = ?auto_765948 ?auto_765959 ) ) ( not ( = ?auto_765948 ?auto_765960 ) ) ( not ( = ?auto_765949 ?auto_765950 ) ) ( not ( = ?auto_765949 ?auto_765951 ) ) ( not ( = ?auto_765949 ?auto_765952 ) ) ( not ( = ?auto_765949 ?auto_765953 ) ) ( not ( = ?auto_765949 ?auto_765954 ) ) ( not ( = ?auto_765949 ?auto_765955 ) ) ( not ( = ?auto_765949 ?auto_765956 ) ) ( not ( = ?auto_765949 ?auto_765957 ) ) ( not ( = ?auto_765949 ?auto_765958 ) ) ( not ( = ?auto_765949 ?auto_765959 ) ) ( not ( = ?auto_765949 ?auto_765960 ) ) ( not ( = ?auto_765950 ?auto_765951 ) ) ( not ( = ?auto_765950 ?auto_765952 ) ) ( not ( = ?auto_765950 ?auto_765953 ) ) ( not ( = ?auto_765950 ?auto_765954 ) ) ( not ( = ?auto_765950 ?auto_765955 ) ) ( not ( = ?auto_765950 ?auto_765956 ) ) ( not ( = ?auto_765950 ?auto_765957 ) ) ( not ( = ?auto_765950 ?auto_765958 ) ) ( not ( = ?auto_765950 ?auto_765959 ) ) ( not ( = ?auto_765950 ?auto_765960 ) ) ( not ( = ?auto_765951 ?auto_765952 ) ) ( not ( = ?auto_765951 ?auto_765953 ) ) ( not ( = ?auto_765951 ?auto_765954 ) ) ( not ( = ?auto_765951 ?auto_765955 ) ) ( not ( = ?auto_765951 ?auto_765956 ) ) ( not ( = ?auto_765951 ?auto_765957 ) ) ( not ( = ?auto_765951 ?auto_765958 ) ) ( not ( = ?auto_765951 ?auto_765959 ) ) ( not ( = ?auto_765951 ?auto_765960 ) ) ( not ( = ?auto_765952 ?auto_765953 ) ) ( not ( = ?auto_765952 ?auto_765954 ) ) ( not ( = ?auto_765952 ?auto_765955 ) ) ( not ( = ?auto_765952 ?auto_765956 ) ) ( not ( = ?auto_765952 ?auto_765957 ) ) ( not ( = ?auto_765952 ?auto_765958 ) ) ( not ( = ?auto_765952 ?auto_765959 ) ) ( not ( = ?auto_765952 ?auto_765960 ) ) ( not ( = ?auto_765953 ?auto_765954 ) ) ( not ( = ?auto_765953 ?auto_765955 ) ) ( not ( = ?auto_765953 ?auto_765956 ) ) ( not ( = ?auto_765953 ?auto_765957 ) ) ( not ( = ?auto_765953 ?auto_765958 ) ) ( not ( = ?auto_765953 ?auto_765959 ) ) ( not ( = ?auto_765953 ?auto_765960 ) ) ( not ( = ?auto_765954 ?auto_765955 ) ) ( not ( = ?auto_765954 ?auto_765956 ) ) ( not ( = ?auto_765954 ?auto_765957 ) ) ( not ( = ?auto_765954 ?auto_765958 ) ) ( not ( = ?auto_765954 ?auto_765959 ) ) ( not ( = ?auto_765954 ?auto_765960 ) ) ( not ( = ?auto_765955 ?auto_765956 ) ) ( not ( = ?auto_765955 ?auto_765957 ) ) ( not ( = ?auto_765955 ?auto_765958 ) ) ( not ( = ?auto_765955 ?auto_765959 ) ) ( not ( = ?auto_765955 ?auto_765960 ) ) ( not ( = ?auto_765956 ?auto_765957 ) ) ( not ( = ?auto_765956 ?auto_765958 ) ) ( not ( = ?auto_765956 ?auto_765959 ) ) ( not ( = ?auto_765956 ?auto_765960 ) ) ( not ( = ?auto_765957 ?auto_765958 ) ) ( not ( = ?auto_765957 ?auto_765959 ) ) ( not ( = ?auto_765957 ?auto_765960 ) ) ( not ( = ?auto_765958 ?auto_765959 ) ) ( not ( = ?auto_765958 ?auto_765960 ) ) ( not ( = ?auto_765959 ?auto_765960 ) ) ( ON ?auto_765959 ?auto_765960 ) ( ON ?auto_765958 ?auto_765959 ) ( ON ?auto_765957 ?auto_765958 ) ( ON ?auto_765956 ?auto_765957 ) ( ON ?auto_765955 ?auto_765956 ) ( ON ?auto_765954 ?auto_765955 ) ( ON ?auto_765953 ?auto_765954 ) ( ON ?auto_765952 ?auto_765953 ) ( ON ?auto_765951 ?auto_765952 ) ( ON ?auto_765950 ?auto_765951 ) ( ON ?auto_765949 ?auto_765950 ) ( ON ?auto_765948 ?auto_765949 ) ( ON ?auto_765947 ?auto_765948 ) ( ON ?auto_765946 ?auto_765947 ) ( ON ?auto_765945 ?auto_765946 ) ( CLEAR ?auto_765943 ) ( ON ?auto_765944 ?auto_765945 ) ( CLEAR ?auto_765944 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-2PILE ?auto_765943 ?auto_765944 )
      ( MAKE-18PILE ?auto_765943 ?auto_765944 ?auto_765945 ?auto_765946 ?auto_765947 ?auto_765948 ?auto_765949 ?auto_765950 ?auto_765951 ?auto_765952 ?auto_765953 ?auto_765954 ?auto_765955 ?auto_765956 ?auto_765957 ?auto_765958 ?auto_765959 ?auto_765960 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_765979 - BLOCK
      ?auto_765980 - BLOCK
      ?auto_765981 - BLOCK
      ?auto_765982 - BLOCK
      ?auto_765983 - BLOCK
      ?auto_765984 - BLOCK
      ?auto_765985 - BLOCK
      ?auto_765986 - BLOCK
      ?auto_765987 - BLOCK
      ?auto_765988 - BLOCK
      ?auto_765989 - BLOCK
      ?auto_765990 - BLOCK
      ?auto_765991 - BLOCK
      ?auto_765992 - BLOCK
      ?auto_765993 - BLOCK
      ?auto_765994 - BLOCK
      ?auto_765995 - BLOCK
      ?auto_765996 - BLOCK
    )
    :vars
    (
      ?auto_765997 - BLOCK
    )
    :precondition
    ( and ( ON ?auto_765996 ?auto_765997 ) ( not ( = ?auto_765979 ?auto_765980 ) ) ( not ( = ?auto_765979 ?auto_765981 ) ) ( not ( = ?auto_765979 ?auto_765982 ) ) ( not ( = ?auto_765979 ?auto_765983 ) ) ( not ( = ?auto_765979 ?auto_765984 ) ) ( not ( = ?auto_765979 ?auto_765985 ) ) ( not ( = ?auto_765979 ?auto_765986 ) ) ( not ( = ?auto_765979 ?auto_765987 ) ) ( not ( = ?auto_765979 ?auto_765988 ) ) ( not ( = ?auto_765979 ?auto_765989 ) ) ( not ( = ?auto_765979 ?auto_765990 ) ) ( not ( = ?auto_765979 ?auto_765991 ) ) ( not ( = ?auto_765979 ?auto_765992 ) ) ( not ( = ?auto_765979 ?auto_765993 ) ) ( not ( = ?auto_765979 ?auto_765994 ) ) ( not ( = ?auto_765979 ?auto_765995 ) ) ( not ( = ?auto_765979 ?auto_765996 ) ) ( not ( = ?auto_765979 ?auto_765997 ) ) ( not ( = ?auto_765980 ?auto_765981 ) ) ( not ( = ?auto_765980 ?auto_765982 ) ) ( not ( = ?auto_765980 ?auto_765983 ) ) ( not ( = ?auto_765980 ?auto_765984 ) ) ( not ( = ?auto_765980 ?auto_765985 ) ) ( not ( = ?auto_765980 ?auto_765986 ) ) ( not ( = ?auto_765980 ?auto_765987 ) ) ( not ( = ?auto_765980 ?auto_765988 ) ) ( not ( = ?auto_765980 ?auto_765989 ) ) ( not ( = ?auto_765980 ?auto_765990 ) ) ( not ( = ?auto_765980 ?auto_765991 ) ) ( not ( = ?auto_765980 ?auto_765992 ) ) ( not ( = ?auto_765980 ?auto_765993 ) ) ( not ( = ?auto_765980 ?auto_765994 ) ) ( not ( = ?auto_765980 ?auto_765995 ) ) ( not ( = ?auto_765980 ?auto_765996 ) ) ( not ( = ?auto_765980 ?auto_765997 ) ) ( not ( = ?auto_765981 ?auto_765982 ) ) ( not ( = ?auto_765981 ?auto_765983 ) ) ( not ( = ?auto_765981 ?auto_765984 ) ) ( not ( = ?auto_765981 ?auto_765985 ) ) ( not ( = ?auto_765981 ?auto_765986 ) ) ( not ( = ?auto_765981 ?auto_765987 ) ) ( not ( = ?auto_765981 ?auto_765988 ) ) ( not ( = ?auto_765981 ?auto_765989 ) ) ( not ( = ?auto_765981 ?auto_765990 ) ) ( not ( = ?auto_765981 ?auto_765991 ) ) ( not ( = ?auto_765981 ?auto_765992 ) ) ( not ( = ?auto_765981 ?auto_765993 ) ) ( not ( = ?auto_765981 ?auto_765994 ) ) ( not ( = ?auto_765981 ?auto_765995 ) ) ( not ( = ?auto_765981 ?auto_765996 ) ) ( not ( = ?auto_765981 ?auto_765997 ) ) ( not ( = ?auto_765982 ?auto_765983 ) ) ( not ( = ?auto_765982 ?auto_765984 ) ) ( not ( = ?auto_765982 ?auto_765985 ) ) ( not ( = ?auto_765982 ?auto_765986 ) ) ( not ( = ?auto_765982 ?auto_765987 ) ) ( not ( = ?auto_765982 ?auto_765988 ) ) ( not ( = ?auto_765982 ?auto_765989 ) ) ( not ( = ?auto_765982 ?auto_765990 ) ) ( not ( = ?auto_765982 ?auto_765991 ) ) ( not ( = ?auto_765982 ?auto_765992 ) ) ( not ( = ?auto_765982 ?auto_765993 ) ) ( not ( = ?auto_765982 ?auto_765994 ) ) ( not ( = ?auto_765982 ?auto_765995 ) ) ( not ( = ?auto_765982 ?auto_765996 ) ) ( not ( = ?auto_765982 ?auto_765997 ) ) ( not ( = ?auto_765983 ?auto_765984 ) ) ( not ( = ?auto_765983 ?auto_765985 ) ) ( not ( = ?auto_765983 ?auto_765986 ) ) ( not ( = ?auto_765983 ?auto_765987 ) ) ( not ( = ?auto_765983 ?auto_765988 ) ) ( not ( = ?auto_765983 ?auto_765989 ) ) ( not ( = ?auto_765983 ?auto_765990 ) ) ( not ( = ?auto_765983 ?auto_765991 ) ) ( not ( = ?auto_765983 ?auto_765992 ) ) ( not ( = ?auto_765983 ?auto_765993 ) ) ( not ( = ?auto_765983 ?auto_765994 ) ) ( not ( = ?auto_765983 ?auto_765995 ) ) ( not ( = ?auto_765983 ?auto_765996 ) ) ( not ( = ?auto_765983 ?auto_765997 ) ) ( not ( = ?auto_765984 ?auto_765985 ) ) ( not ( = ?auto_765984 ?auto_765986 ) ) ( not ( = ?auto_765984 ?auto_765987 ) ) ( not ( = ?auto_765984 ?auto_765988 ) ) ( not ( = ?auto_765984 ?auto_765989 ) ) ( not ( = ?auto_765984 ?auto_765990 ) ) ( not ( = ?auto_765984 ?auto_765991 ) ) ( not ( = ?auto_765984 ?auto_765992 ) ) ( not ( = ?auto_765984 ?auto_765993 ) ) ( not ( = ?auto_765984 ?auto_765994 ) ) ( not ( = ?auto_765984 ?auto_765995 ) ) ( not ( = ?auto_765984 ?auto_765996 ) ) ( not ( = ?auto_765984 ?auto_765997 ) ) ( not ( = ?auto_765985 ?auto_765986 ) ) ( not ( = ?auto_765985 ?auto_765987 ) ) ( not ( = ?auto_765985 ?auto_765988 ) ) ( not ( = ?auto_765985 ?auto_765989 ) ) ( not ( = ?auto_765985 ?auto_765990 ) ) ( not ( = ?auto_765985 ?auto_765991 ) ) ( not ( = ?auto_765985 ?auto_765992 ) ) ( not ( = ?auto_765985 ?auto_765993 ) ) ( not ( = ?auto_765985 ?auto_765994 ) ) ( not ( = ?auto_765985 ?auto_765995 ) ) ( not ( = ?auto_765985 ?auto_765996 ) ) ( not ( = ?auto_765985 ?auto_765997 ) ) ( not ( = ?auto_765986 ?auto_765987 ) ) ( not ( = ?auto_765986 ?auto_765988 ) ) ( not ( = ?auto_765986 ?auto_765989 ) ) ( not ( = ?auto_765986 ?auto_765990 ) ) ( not ( = ?auto_765986 ?auto_765991 ) ) ( not ( = ?auto_765986 ?auto_765992 ) ) ( not ( = ?auto_765986 ?auto_765993 ) ) ( not ( = ?auto_765986 ?auto_765994 ) ) ( not ( = ?auto_765986 ?auto_765995 ) ) ( not ( = ?auto_765986 ?auto_765996 ) ) ( not ( = ?auto_765986 ?auto_765997 ) ) ( not ( = ?auto_765987 ?auto_765988 ) ) ( not ( = ?auto_765987 ?auto_765989 ) ) ( not ( = ?auto_765987 ?auto_765990 ) ) ( not ( = ?auto_765987 ?auto_765991 ) ) ( not ( = ?auto_765987 ?auto_765992 ) ) ( not ( = ?auto_765987 ?auto_765993 ) ) ( not ( = ?auto_765987 ?auto_765994 ) ) ( not ( = ?auto_765987 ?auto_765995 ) ) ( not ( = ?auto_765987 ?auto_765996 ) ) ( not ( = ?auto_765987 ?auto_765997 ) ) ( not ( = ?auto_765988 ?auto_765989 ) ) ( not ( = ?auto_765988 ?auto_765990 ) ) ( not ( = ?auto_765988 ?auto_765991 ) ) ( not ( = ?auto_765988 ?auto_765992 ) ) ( not ( = ?auto_765988 ?auto_765993 ) ) ( not ( = ?auto_765988 ?auto_765994 ) ) ( not ( = ?auto_765988 ?auto_765995 ) ) ( not ( = ?auto_765988 ?auto_765996 ) ) ( not ( = ?auto_765988 ?auto_765997 ) ) ( not ( = ?auto_765989 ?auto_765990 ) ) ( not ( = ?auto_765989 ?auto_765991 ) ) ( not ( = ?auto_765989 ?auto_765992 ) ) ( not ( = ?auto_765989 ?auto_765993 ) ) ( not ( = ?auto_765989 ?auto_765994 ) ) ( not ( = ?auto_765989 ?auto_765995 ) ) ( not ( = ?auto_765989 ?auto_765996 ) ) ( not ( = ?auto_765989 ?auto_765997 ) ) ( not ( = ?auto_765990 ?auto_765991 ) ) ( not ( = ?auto_765990 ?auto_765992 ) ) ( not ( = ?auto_765990 ?auto_765993 ) ) ( not ( = ?auto_765990 ?auto_765994 ) ) ( not ( = ?auto_765990 ?auto_765995 ) ) ( not ( = ?auto_765990 ?auto_765996 ) ) ( not ( = ?auto_765990 ?auto_765997 ) ) ( not ( = ?auto_765991 ?auto_765992 ) ) ( not ( = ?auto_765991 ?auto_765993 ) ) ( not ( = ?auto_765991 ?auto_765994 ) ) ( not ( = ?auto_765991 ?auto_765995 ) ) ( not ( = ?auto_765991 ?auto_765996 ) ) ( not ( = ?auto_765991 ?auto_765997 ) ) ( not ( = ?auto_765992 ?auto_765993 ) ) ( not ( = ?auto_765992 ?auto_765994 ) ) ( not ( = ?auto_765992 ?auto_765995 ) ) ( not ( = ?auto_765992 ?auto_765996 ) ) ( not ( = ?auto_765992 ?auto_765997 ) ) ( not ( = ?auto_765993 ?auto_765994 ) ) ( not ( = ?auto_765993 ?auto_765995 ) ) ( not ( = ?auto_765993 ?auto_765996 ) ) ( not ( = ?auto_765993 ?auto_765997 ) ) ( not ( = ?auto_765994 ?auto_765995 ) ) ( not ( = ?auto_765994 ?auto_765996 ) ) ( not ( = ?auto_765994 ?auto_765997 ) ) ( not ( = ?auto_765995 ?auto_765996 ) ) ( not ( = ?auto_765995 ?auto_765997 ) ) ( not ( = ?auto_765996 ?auto_765997 ) ) ( ON ?auto_765995 ?auto_765996 ) ( ON ?auto_765994 ?auto_765995 ) ( ON ?auto_765993 ?auto_765994 ) ( ON ?auto_765992 ?auto_765993 ) ( ON ?auto_765991 ?auto_765992 ) ( ON ?auto_765990 ?auto_765991 ) ( ON ?auto_765989 ?auto_765990 ) ( ON ?auto_765988 ?auto_765989 ) ( ON ?auto_765987 ?auto_765988 ) ( ON ?auto_765986 ?auto_765987 ) ( ON ?auto_765985 ?auto_765986 ) ( ON ?auto_765984 ?auto_765985 ) ( ON ?auto_765983 ?auto_765984 ) ( ON ?auto_765982 ?auto_765983 ) ( ON ?auto_765981 ?auto_765982 ) ( ON ?auto_765980 ?auto_765981 ) ( ON ?auto_765979 ?auto_765980 ) ( CLEAR ?auto_765979 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_765979 )
      ( MAKE-18PILE ?auto_765979 ?auto_765980 ?auto_765981 ?auto_765982 ?auto_765983 ?auto_765984 ?auto_765985 ?auto_765986 ?auto_765987 ?auto_765988 ?auto_765989 ?auto_765990 ?auto_765991 ?auto_765992 ?auto_765993 ?auto_765994 ?auto_765995 ?auto_765996 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_766016 - BLOCK
      ?auto_766017 - BLOCK
      ?auto_766018 - BLOCK
      ?auto_766019 - BLOCK
      ?auto_766020 - BLOCK
      ?auto_766021 - BLOCK
      ?auto_766022 - BLOCK
      ?auto_766023 - BLOCK
      ?auto_766024 - BLOCK
      ?auto_766025 - BLOCK
      ?auto_766026 - BLOCK
      ?auto_766027 - BLOCK
      ?auto_766028 - BLOCK
      ?auto_766029 - BLOCK
      ?auto_766030 - BLOCK
      ?auto_766031 - BLOCK
      ?auto_766032 - BLOCK
      ?auto_766033 - BLOCK
    )
    :precondition
    ( and ( ON-TABLE ?auto_766033 ) ( not ( = ?auto_766016 ?auto_766017 ) ) ( not ( = ?auto_766016 ?auto_766018 ) ) ( not ( = ?auto_766016 ?auto_766019 ) ) ( not ( = ?auto_766016 ?auto_766020 ) ) ( not ( = ?auto_766016 ?auto_766021 ) ) ( not ( = ?auto_766016 ?auto_766022 ) ) ( not ( = ?auto_766016 ?auto_766023 ) ) ( not ( = ?auto_766016 ?auto_766024 ) ) ( not ( = ?auto_766016 ?auto_766025 ) ) ( not ( = ?auto_766016 ?auto_766026 ) ) ( not ( = ?auto_766016 ?auto_766027 ) ) ( not ( = ?auto_766016 ?auto_766028 ) ) ( not ( = ?auto_766016 ?auto_766029 ) ) ( not ( = ?auto_766016 ?auto_766030 ) ) ( not ( = ?auto_766016 ?auto_766031 ) ) ( not ( = ?auto_766016 ?auto_766032 ) ) ( not ( = ?auto_766016 ?auto_766033 ) ) ( not ( = ?auto_766017 ?auto_766018 ) ) ( not ( = ?auto_766017 ?auto_766019 ) ) ( not ( = ?auto_766017 ?auto_766020 ) ) ( not ( = ?auto_766017 ?auto_766021 ) ) ( not ( = ?auto_766017 ?auto_766022 ) ) ( not ( = ?auto_766017 ?auto_766023 ) ) ( not ( = ?auto_766017 ?auto_766024 ) ) ( not ( = ?auto_766017 ?auto_766025 ) ) ( not ( = ?auto_766017 ?auto_766026 ) ) ( not ( = ?auto_766017 ?auto_766027 ) ) ( not ( = ?auto_766017 ?auto_766028 ) ) ( not ( = ?auto_766017 ?auto_766029 ) ) ( not ( = ?auto_766017 ?auto_766030 ) ) ( not ( = ?auto_766017 ?auto_766031 ) ) ( not ( = ?auto_766017 ?auto_766032 ) ) ( not ( = ?auto_766017 ?auto_766033 ) ) ( not ( = ?auto_766018 ?auto_766019 ) ) ( not ( = ?auto_766018 ?auto_766020 ) ) ( not ( = ?auto_766018 ?auto_766021 ) ) ( not ( = ?auto_766018 ?auto_766022 ) ) ( not ( = ?auto_766018 ?auto_766023 ) ) ( not ( = ?auto_766018 ?auto_766024 ) ) ( not ( = ?auto_766018 ?auto_766025 ) ) ( not ( = ?auto_766018 ?auto_766026 ) ) ( not ( = ?auto_766018 ?auto_766027 ) ) ( not ( = ?auto_766018 ?auto_766028 ) ) ( not ( = ?auto_766018 ?auto_766029 ) ) ( not ( = ?auto_766018 ?auto_766030 ) ) ( not ( = ?auto_766018 ?auto_766031 ) ) ( not ( = ?auto_766018 ?auto_766032 ) ) ( not ( = ?auto_766018 ?auto_766033 ) ) ( not ( = ?auto_766019 ?auto_766020 ) ) ( not ( = ?auto_766019 ?auto_766021 ) ) ( not ( = ?auto_766019 ?auto_766022 ) ) ( not ( = ?auto_766019 ?auto_766023 ) ) ( not ( = ?auto_766019 ?auto_766024 ) ) ( not ( = ?auto_766019 ?auto_766025 ) ) ( not ( = ?auto_766019 ?auto_766026 ) ) ( not ( = ?auto_766019 ?auto_766027 ) ) ( not ( = ?auto_766019 ?auto_766028 ) ) ( not ( = ?auto_766019 ?auto_766029 ) ) ( not ( = ?auto_766019 ?auto_766030 ) ) ( not ( = ?auto_766019 ?auto_766031 ) ) ( not ( = ?auto_766019 ?auto_766032 ) ) ( not ( = ?auto_766019 ?auto_766033 ) ) ( not ( = ?auto_766020 ?auto_766021 ) ) ( not ( = ?auto_766020 ?auto_766022 ) ) ( not ( = ?auto_766020 ?auto_766023 ) ) ( not ( = ?auto_766020 ?auto_766024 ) ) ( not ( = ?auto_766020 ?auto_766025 ) ) ( not ( = ?auto_766020 ?auto_766026 ) ) ( not ( = ?auto_766020 ?auto_766027 ) ) ( not ( = ?auto_766020 ?auto_766028 ) ) ( not ( = ?auto_766020 ?auto_766029 ) ) ( not ( = ?auto_766020 ?auto_766030 ) ) ( not ( = ?auto_766020 ?auto_766031 ) ) ( not ( = ?auto_766020 ?auto_766032 ) ) ( not ( = ?auto_766020 ?auto_766033 ) ) ( not ( = ?auto_766021 ?auto_766022 ) ) ( not ( = ?auto_766021 ?auto_766023 ) ) ( not ( = ?auto_766021 ?auto_766024 ) ) ( not ( = ?auto_766021 ?auto_766025 ) ) ( not ( = ?auto_766021 ?auto_766026 ) ) ( not ( = ?auto_766021 ?auto_766027 ) ) ( not ( = ?auto_766021 ?auto_766028 ) ) ( not ( = ?auto_766021 ?auto_766029 ) ) ( not ( = ?auto_766021 ?auto_766030 ) ) ( not ( = ?auto_766021 ?auto_766031 ) ) ( not ( = ?auto_766021 ?auto_766032 ) ) ( not ( = ?auto_766021 ?auto_766033 ) ) ( not ( = ?auto_766022 ?auto_766023 ) ) ( not ( = ?auto_766022 ?auto_766024 ) ) ( not ( = ?auto_766022 ?auto_766025 ) ) ( not ( = ?auto_766022 ?auto_766026 ) ) ( not ( = ?auto_766022 ?auto_766027 ) ) ( not ( = ?auto_766022 ?auto_766028 ) ) ( not ( = ?auto_766022 ?auto_766029 ) ) ( not ( = ?auto_766022 ?auto_766030 ) ) ( not ( = ?auto_766022 ?auto_766031 ) ) ( not ( = ?auto_766022 ?auto_766032 ) ) ( not ( = ?auto_766022 ?auto_766033 ) ) ( not ( = ?auto_766023 ?auto_766024 ) ) ( not ( = ?auto_766023 ?auto_766025 ) ) ( not ( = ?auto_766023 ?auto_766026 ) ) ( not ( = ?auto_766023 ?auto_766027 ) ) ( not ( = ?auto_766023 ?auto_766028 ) ) ( not ( = ?auto_766023 ?auto_766029 ) ) ( not ( = ?auto_766023 ?auto_766030 ) ) ( not ( = ?auto_766023 ?auto_766031 ) ) ( not ( = ?auto_766023 ?auto_766032 ) ) ( not ( = ?auto_766023 ?auto_766033 ) ) ( not ( = ?auto_766024 ?auto_766025 ) ) ( not ( = ?auto_766024 ?auto_766026 ) ) ( not ( = ?auto_766024 ?auto_766027 ) ) ( not ( = ?auto_766024 ?auto_766028 ) ) ( not ( = ?auto_766024 ?auto_766029 ) ) ( not ( = ?auto_766024 ?auto_766030 ) ) ( not ( = ?auto_766024 ?auto_766031 ) ) ( not ( = ?auto_766024 ?auto_766032 ) ) ( not ( = ?auto_766024 ?auto_766033 ) ) ( not ( = ?auto_766025 ?auto_766026 ) ) ( not ( = ?auto_766025 ?auto_766027 ) ) ( not ( = ?auto_766025 ?auto_766028 ) ) ( not ( = ?auto_766025 ?auto_766029 ) ) ( not ( = ?auto_766025 ?auto_766030 ) ) ( not ( = ?auto_766025 ?auto_766031 ) ) ( not ( = ?auto_766025 ?auto_766032 ) ) ( not ( = ?auto_766025 ?auto_766033 ) ) ( not ( = ?auto_766026 ?auto_766027 ) ) ( not ( = ?auto_766026 ?auto_766028 ) ) ( not ( = ?auto_766026 ?auto_766029 ) ) ( not ( = ?auto_766026 ?auto_766030 ) ) ( not ( = ?auto_766026 ?auto_766031 ) ) ( not ( = ?auto_766026 ?auto_766032 ) ) ( not ( = ?auto_766026 ?auto_766033 ) ) ( not ( = ?auto_766027 ?auto_766028 ) ) ( not ( = ?auto_766027 ?auto_766029 ) ) ( not ( = ?auto_766027 ?auto_766030 ) ) ( not ( = ?auto_766027 ?auto_766031 ) ) ( not ( = ?auto_766027 ?auto_766032 ) ) ( not ( = ?auto_766027 ?auto_766033 ) ) ( not ( = ?auto_766028 ?auto_766029 ) ) ( not ( = ?auto_766028 ?auto_766030 ) ) ( not ( = ?auto_766028 ?auto_766031 ) ) ( not ( = ?auto_766028 ?auto_766032 ) ) ( not ( = ?auto_766028 ?auto_766033 ) ) ( not ( = ?auto_766029 ?auto_766030 ) ) ( not ( = ?auto_766029 ?auto_766031 ) ) ( not ( = ?auto_766029 ?auto_766032 ) ) ( not ( = ?auto_766029 ?auto_766033 ) ) ( not ( = ?auto_766030 ?auto_766031 ) ) ( not ( = ?auto_766030 ?auto_766032 ) ) ( not ( = ?auto_766030 ?auto_766033 ) ) ( not ( = ?auto_766031 ?auto_766032 ) ) ( not ( = ?auto_766031 ?auto_766033 ) ) ( not ( = ?auto_766032 ?auto_766033 ) ) ( ON ?auto_766032 ?auto_766033 ) ( ON ?auto_766031 ?auto_766032 ) ( ON ?auto_766030 ?auto_766031 ) ( ON ?auto_766029 ?auto_766030 ) ( ON ?auto_766028 ?auto_766029 ) ( ON ?auto_766027 ?auto_766028 ) ( ON ?auto_766026 ?auto_766027 ) ( ON ?auto_766025 ?auto_766026 ) ( ON ?auto_766024 ?auto_766025 ) ( ON ?auto_766023 ?auto_766024 ) ( ON ?auto_766022 ?auto_766023 ) ( ON ?auto_766021 ?auto_766022 ) ( ON ?auto_766020 ?auto_766021 ) ( ON ?auto_766019 ?auto_766020 ) ( ON ?auto_766018 ?auto_766019 ) ( ON ?auto_766017 ?auto_766018 ) ( ON ?auto_766016 ?auto_766017 ) ( CLEAR ?auto_766016 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-1PILE ?auto_766016 )
      ( MAKE-18PILE ?auto_766016 ?auto_766017 ?auto_766018 ?auto_766019 ?auto_766020 ?auto_766021 ?auto_766022 ?auto_766023 ?auto_766024 ?auto_766025 ?auto_766026 ?auto_766027 ?auto_766028 ?auto_766029 ?auto_766030 ?auto_766031 ?auto_766032 ?auto_766033 ) )
  )

  ( :method MAKE-18PILE
    :parameters
    (
      ?auto_766052 - BLOCK
      ?auto_766053 - BLOCK
      ?auto_766054 - BLOCK
      ?auto_766055 - BLOCK
      ?auto_766056 - BLOCK
      ?auto_766057 - BLOCK
      ?auto_766058 - BLOCK
      ?auto_766059 - BLOCK
      ?auto_766060 - BLOCK
      ?auto_766061 - BLOCK
      ?auto_766062 - BLOCK
      ?auto_766063 - BLOCK
      ?auto_766064 - BLOCK
      ?auto_766065 - BLOCK
      ?auto_766066 - BLOCK
      ?auto_766067 - BLOCK
      ?auto_766068 - BLOCK
      ?auto_766069 - BLOCK
    )
    :vars
    (
      ?auto_766070 - BLOCK
    )
    :precondition
    ( and ( not ( = ?auto_766052 ?auto_766053 ) ) ( not ( = ?auto_766052 ?auto_766054 ) ) ( not ( = ?auto_766052 ?auto_766055 ) ) ( not ( = ?auto_766052 ?auto_766056 ) ) ( not ( = ?auto_766052 ?auto_766057 ) ) ( not ( = ?auto_766052 ?auto_766058 ) ) ( not ( = ?auto_766052 ?auto_766059 ) ) ( not ( = ?auto_766052 ?auto_766060 ) ) ( not ( = ?auto_766052 ?auto_766061 ) ) ( not ( = ?auto_766052 ?auto_766062 ) ) ( not ( = ?auto_766052 ?auto_766063 ) ) ( not ( = ?auto_766052 ?auto_766064 ) ) ( not ( = ?auto_766052 ?auto_766065 ) ) ( not ( = ?auto_766052 ?auto_766066 ) ) ( not ( = ?auto_766052 ?auto_766067 ) ) ( not ( = ?auto_766052 ?auto_766068 ) ) ( not ( = ?auto_766052 ?auto_766069 ) ) ( not ( = ?auto_766053 ?auto_766054 ) ) ( not ( = ?auto_766053 ?auto_766055 ) ) ( not ( = ?auto_766053 ?auto_766056 ) ) ( not ( = ?auto_766053 ?auto_766057 ) ) ( not ( = ?auto_766053 ?auto_766058 ) ) ( not ( = ?auto_766053 ?auto_766059 ) ) ( not ( = ?auto_766053 ?auto_766060 ) ) ( not ( = ?auto_766053 ?auto_766061 ) ) ( not ( = ?auto_766053 ?auto_766062 ) ) ( not ( = ?auto_766053 ?auto_766063 ) ) ( not ( = ?auto_766053 ?auto_766064 ) ) ( not ( = ?auto_766053 ?auto_766065 ) ) ( not ( = ?auto_766053 ?auto_766066 ) ) ( not ( = ?auto_766053 ?auto_766067 ) ) ( not ( = ?auto_766053 ?auto_766068 ) ) ( not ( = ?auto_766053 ?auto_766069 ) ) ( not ( = ?auto_766054 ?auto_766055 ) ) ( not ( = ?auto_766054 ?auto_766056 ) ) ( not ( = ?auto_766054 ?auto_766057 ) ) ( not ( = ?auto_766054 ?auto_766058 ) ) ( not ( = ?auto_766054 ?auto_766059 ) ) ( not ( = ?auto_766054 ?auto_766060 ) ) ( not ( = ?auto_766054 ?auto_766061 ) ) ( not ( = ?auto_766054 ?auto_766062 ) ) ( not ( = ?auto_766054 ?auto_766063 ) ) ( not ( = ?auto_766054 ?auto_766064 ) ) ( not ( = ?auto_766054 ?auto_766065 ) ) ( not ( = ?auto_766054 ?auto_766066 ) ) ( not ( = ?auto_766054 ?auto_766067 ) ) ( not ( = ?auto_766054 ?auto_766068 ) ) ( not ( = ?auto_766054 ?auto_766069 ) ) ( not ( = ?auto_766055 ?auto_766056 ) ) ( not ( = ?auto_766055 ?auto_766057 ) ) ( not ( = ?auto_766055 ?auto_766058 ) ) ( not ( = ?auto_766055 ?auto_766059 ) ) ( not ( = ?auto_766055 ?auto_766060 ) ) ( not ( = ?auto_766055 ?auto_766061 ) ) ( not ( = ?auto_766055 ?auto_766062 ) ) ( not ( = ?auto_766055 ?auto_766063 ) ) ( not ( = ?auto_766055 ?auto_766064 ) ) ( not ( = ?auto_766055 ?auto_766065 ) ) ( not ( = ?auto_766055 ?auto_766066 ) ) ( not ( = ?auto_766055 ?auto_766067 ) ) ( not ( = ?auto_766055 ?auto_766068 ) ) ( not ( = ?auto_766055 ?auto_766069 ) ) ( not ( = ?auto_766056 ?auto_766057 ) ) ( not ( = ?auto_766056 ?auto_766058 ) ) ( not ( = ?auto_766056 ?auto_766059 ) ) ( not ( = ?auto_766056 ?auto_766060 ) ) ( not ( = ?auto_766056 ?auto_766061 ) ) ( not ( = ?auto_766056 ?auto_766062 ) ) ( not ( = ?auto_766056 ?auto_766063 ) ) ( not ( = ?auto_766056 ?auto_766064 ) ) ( not ( = ?auto_766056 ?auto_766065 ) ) ( not ( = ?auto_766056 ?auto_766066 ) ) ( not ( = ?auto_766056 ?auto_766067 ) ) ( not ( = ?auto_766056 ?auto_766068 ) ) ( not ( = ?auto_766056 ?auto_766069 ) ) ( not ( = ?auto_766057 ?auto_766058 ) ) ( not ( = ?auto_766057 ?auto_766059 ) ) ( not ( = ?auto_766057 ?auto_766060 ) ) ( not ( = ?auto_766057 ?auto_766061 ) ) ( not ( = ?auto_766057 ?auto_766062 ) ) ( not ( = ?auto_766057 ?auto_766063 ) ) ( not ( = ?auto_766057 ?auto_766064 ) ) ( not ( = ?auto_766057 ?auto_766065 ) ) ( not ( = ?auto_766057 ?auto_766066 ) ) ( not ( = ?auto_766057 ?auto_766067 ) ) ( not ( = ?auto_766057 ?auto_766068 ) ) ( not ( = ?auto_766057 ?auto_766069 ) ) ( not ( = ?auto_766058 ?auto_766059 ) ) ( not ( = ?auto_766058 ?auto_766060 ) ) ( not ( = ?auto_766058 ?auto_766061 ) ) ( not ( = ?auto_766058 ?auto_766062 ) ) ( not ( = ?auto_766058 ?auto_766063 ) ) ( not ( = ?auto_766058 ?auto_766064 ) ) ( not ( = ?auto_766058 ?auto_766065 ) ) ( not ( = ?auto_766058 ?auto_766066 ) ) ( not ( = ?auto_766058 ?auto_766067 ) ) ( not ( = ?auto_766058 ?auto_766068 ) ) ( not ( = ?auto_766058 ?auto_766069 ) ) ( not ( = ?auto_766059 ?auto_766060 ) ) ( not ( = ?auto_766059 ?auto_766061 ) ) ( not ( = ?auto_766059 ?auto_766062 ) ) ( not ( = ?auto_766059 ?auto_766063 ) ) ( not ( = ?auto_766059 ?auto_766064 ) ) ( not ( = ?auto_766059 ?auto_766065 ) ) ( not ( = ?auto_766059 ?auto_766066 ) ) ( not ( = ?auto_766059 ?auto_766067 ) ) ( not ( = ?auto_766059 ?auto_766068 ) ) ( not ( = ?auto_766059 ?auto_766069 ) ) ( not ( = ?auto_766060 ?auto_766061 ) ) ( not ( = ?auto_766060 ?auto_766062 ) ) ( not ( = ?auto_766060 ?auto_766063 ) ) ( not ( = ?auto_766060 ?auto_766064 ) ) ( not ( = ?auto_766060 ?auto_766065 ) ) ( not ( = ?auto_766060 ?auto_766066 ) ) ( not ( = ?auto_766060 ?auto_766067 ) ) ( not ( = ?auto_766060 ?auto_766068 ) ) ( not ( = ?auto_766060 ?auto_766069 ) ) ( not ( = ?auto_766061 ?auto_766062 ) ) ( not ( = ?auto_766061 ?auto_766063 ) ) ( not ( = ?auto_766061 ?auto_766064 ) ) ( not ( = ?auto_766061 ?auto_766065 ) ) ( not ( = ?auto_766061 ?auto_766066 ) ) ( not ( = ?auto_766061 ?auto_766067 ) ) ( not ( = ?auto_766061 ?auto_766068 ) ) ( not ( = ?auto_766061 ?auto_766069 ) ) ( not ( = ?auto_766062 ?auto_766063 ) ) ( not ( = ?auto_766062 ?auto_766064 ) ) ( not ( = ?auto_766062 ?auto_766065 ) ) ( not ( = ?auto_766062 ?auto_766066 ) ) ( not ( = ?auto_766062 ?auto_766067 ) ) ( not ( = ?auto_766062 ?auto_766068 ) ) ( not ( = ?auto_766062 ?auto_766069 ) ) ( not ( = ?auto_766063 ?auto_766064 ) ) ( not ( = ?auto_766063 ?auto_766065 ) ) ( not ( = ?auto_766063 ?auto_766066 ) ) ( not ( = ?auto_766063 ?auto_766067 ) ) ( not ( = ?auto_766063 ?auto_766068 ) ) ( not ( = ?auto_766063 ?auto_766069 ) ) ( not ( = ?auto_766064 ?auto_766065 ) ) ( not ( = ?auto_766064 ?auto_766066 ) ) ( not ( = ?auto_766064 ?auto_766067 ) ) ( not ( = ?auto_766064 ?auto_766068 ) ) ( not ( = ?auto_766064 ?auto_766069 ) ) ( not ( = ?auto_766065 ?auto_766066 ) ) ( not ( = ?auto_766065 ?auto_766067 ) ) ( not ( = ?auto_766065 ?auto_766068 ) ) ( not ( = ?auto_766065 ?auto_766069 ) ) ( not ( = ?auto_766066 ?auto_766067 ) ) ( not ( = ?auto_766066 ?auto_766068 ) ) ( not ( = ?auto_766066 ?auto_766069 ) ) ( not ( = ?auto_766067 ?auto_766068 ) ) ( not ( = ?auto_766067 ?auto_766069 ) ) ( not ( = ?auto_766068 ?auto_766069 ) ) ( ON ?auto_766052 ?auto_766070 ) ( not ( = ?auto_766069 ?auto_766070 ) ) ( not ( = ?auto_766068 ?auto_766070 ) ) ( not ( = ?auto_766067 ?auto_766070 ) ) ( not ( = ?auto_766066 ?auto_766070 ) ) ( not ( = ?auto_766065 ?auto_766070 ) ) ( not ( = ?auto_766064 ?auto_766070 ) ) ( not ( = ?auto_766063 ?auto_766070 ) ) ( not ( = ?auto_766062 ?auto_766070 ) ) ( not ( = ?auto_766061 ?auto_766070 ) ) ( not ( = ?auto_766060 ?auto_766070 ) ) ( not ( = ?auto_766059 ?auto_766070 ) ) ( not ( = ?auto_766058 ?auto_766070 ) ) ( not ( = ?auto_766057 ?auto_766070 ) ) ( not ( = ?auto_766056 ?auto_766070 ) ) ( not ( = ?auto_766055 ?auto_766070 ) ) ( not ( = ?auto_766054 ?auto_766070 ) ) ( not ( = ?auto_766053 ?auto_766070 ) ) ( not ( = ?auto_766052 ?auto_766070 ) ) ( ON ?auto_766053 ?auto_766052 ) ( ON ?auto_766054 ?auto_766053 ) ( ON ?auto_766055 ?auto_766054 ) ( ON ?auto_766056 ?auto_766055 ) ( ON ?auto_766057 ?auto_766056 ) ( ON ?auto_766058 ?auto_766057 ) ( ON ?auto_766059 ?auto_766058 ) ( ON ?auto_766060 ?auto_766059 ) ( ON ?auto_766061 ?auto_766060 ) ( ON ?auto_766062 ?auto_766061 ) ( ON ?auto_766063 ?auto_766062 ) ( ON ?auto_766064 ?auto_766063 ) ( ON ?auto_766065 ?auto_766064 ) ( ON ?auto_766066 ?auto_766065 ) ( ON ?auto_766067 ?auto_766066 ) ( ON ?auto_766068 ?auto_766067 ) ( ON ?auto_766069 ?auto_766068 ) ( CLEAR ?auto_766069 ) ( HAND-EMPTY ) )
    :subtasks
    ( ( MAKE-18PILE ?auto_766069 ?auto_766068 ?auto_766067 ?auto_766066 ?auto_766065 ?auto_766064 ?auto_766063 ?auto_766062 ?auto_766061 ?auto_766060 ?auto_766059 ?auto_766058 ?auto_766057 ?auto_766056 ?auto_766055 ?auto_766054 ?auto_766053 ?auto_766052 )
      ( MAKE-18PILE ?auto_766052 ?auto_766053 ?auto_766054 ?auto_766055 ?auto_766056 ?auto_766057 ?auto_766058 ?auto_766059 ?auto_766060 ?auto_766061 ?auto_766062 ?auto_766063 ?auto_766064 ?auto_766065 ?auto_766066 ?auto_766067 ?auto_766068 ?auto_766069 ) )
  )

)

